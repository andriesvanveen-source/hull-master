import { spawn } from "node:child_process";
import { mkdir, readFile, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import path from "node:path";
import { randomUUID } from "node:crypto";

import { supabaseAdmin, isSupabaseServerConfigured } from "../../../lib/pdfSupabaseServer";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const PROJECT_ROOT = process.cwd();
const SCRIPT_PATH = path.join(PROJECT_ROOT, "scripts", "pdf_signoff_processor.py");
const DEFAULT_PYTHON = process.platform === "win32" ? "python" : "python3";
const PYTHON_BIN = process.env.PDF_PROCESSOR_PYTHON || process.env.PYTHON || DEFAULT_PYTHON;

function cleanFileName(fileName) {
  return path.basename(fileName || "report.pdf").replace(/[^\w .&()-]/g, "_");
}

function outputNameFor(fileName) {
  return `${path.parse(cleanFileName(fileName)).name} - with R&C Sign Off.pdf`;
}

function runProcessor(inputPath, outputPath, discipline) {
  return new Promise((resolve, reject) => {
    const child = spawn(PYTHON_BIN, [
      SCRIPT_PATH,
      "--input",
      inputPath,
      "--output",
      outputPath,
      "--discipline",
      discipline || ""
    ]);
    let stdout = "";
    let stderr = "";

    child.stdout.on("data", (chunk) => {
      stdout += chunk.toString();
    });
    child.stderr.on("data", (chunk) => {
      stderr += chunk.toString();
    });
    child.on("error", reject);
    child.on("close", (code) => {
      if (code !== 0) {
        reject(new Error(stderr || `PDF processor exited with code ${code}`));
        return;
      }

      try {
        resolve(JSON.parse(stdout.trim()));
      } catch {
        reject(new Error("PDF processor returned an unreadable response."));
      }
    });
  });
}

async function logJob(discipline, results) {
  if (!isSupabaseServerConfigured) {
    return null;
  }

  const totalTables = results.reduce((sum, result) => sum + result.tables, 0);
  const { data: job, error: jobError } = await supabaseAdmin
    .from("pdf_signoff_jobs")
    .insert({
      discipline,
      file_count: results.length,
      total_tables: totalTables,
      status: "completed"
    })
    .select("id")
    .single();

  if (jobError || !job?.id) {
    return null;
  }

  await supabaseAdmin.from("pdf_signoff_job_files").insert(
    results.map((result) => ({
      job_id: job.id,
      source_file_name: result.sourceName,
      output_file_name: result.fileName,
      page_count: result.pages,
      table_count: result.tables
    }))
  );

  return job.id;
}

export async function POST(request) {
  const formData = await request.formData();
  const discipline = String(formData.get("discipline") || "");
  const files = formData
    .getAll("pdfs")
    .filter((file) => file && typeof file.arrayBuffer === "function" && file.name?.toLowerCase().endsWith(".pdf"));

  if (!files.length) {
    return Response.json({ error: "Upload at least one PDF report." }, { status: 400 });
  }

  const workDir = path.join(tmpdir(), `signoff-${randomUUID()}`);
  await mkdir(workDir, { recursive: true });

  try {
    const results = [];

    for (const file of files) {
      const sourceName = cleanFileName(file.name);
      const inputPath = path.join(workDir, sourceName);
      const outputPath = path.join(workDir, outputNameFor(sourceName));
      const bytes = Buffer.from(await file.arrayBuffer());
      await writeFile(inputPath, bytes);

      const summary = await runProcessor(inputPath, outputPath, discipline);
      const processedBytes = await readFile(outputPath);
      results.push({
        sourceName,
        fileName: path.basename(outputPath),
        pages: summary.pages,
        tables: summary.tables,
        base64: processedBytes.toString("base64")
      });
    }

    const jobId = await logJob(discipline, results);
    return Response.json({ jobId, results });
  } catch (error) {
    return Response.json(
      { error: error.message || "Could not process the uploaded PDF reports." },
      { status: 500 }
    );
  } finally {
    await rm(workDir, { recursive: true, force: true });
  }
}

