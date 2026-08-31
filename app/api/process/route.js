import path from "node:path";

import { processSignoffPdf } from "../../../lib/pdfSignoffProcessor";
import { supabaseAdmin, isSupabaseServerConfigured } from "../../../lib/pdfSupabaseServer";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function cleanFileName(fileName) {
  return path.basename(fileName || "report.pdf").replace(/[^\w .&()-]/g, "_");
}

function outputNameFor(fileName) {
  return `${path.parse(cleanFileName(fileName)).name} - with R&C Sign Off.pdf`;
}

async function logJob(discipline, results) {
  if (!isSupabaseServerConfigured) return null;

  const totalTables = results.reduce((sum, result) => sum + result.tables, 0);
  const { data: job, error: jobError } = await supabaseAdmin
    .from("pdf_signoff_jobs")
    .insert({ discipline, file_count: results.length, total_tables: totalTables, status: "completed" })
    .select("id")
    .single();

  if (jobError || !job?.id) return null;

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

  try {
    const results = [];

    for (const file of files) {
      const sourceName = cleanFileName(file.name);
      const processed = await processSignoffPdf(new Uint8Array(await file.arrayBuffer()), discipline);
      results.push({
        sourceName,
        fileName: outputNameFor(sourceName),
        pages: processed.pages,
        tables: processed.tables,
        base64: Buffer.from(processed.bytes).toString("base64")
      });
    }

    const jobId = await logJob(discipline, results);
    return Response.json({ jobId, results });
  } catch (error) {
    return Response.json(
      { error: error.message || "Could not process the uploaded PDF reports." },
      { status: 500 }
    );
  }
}

