"use client";

const DEFECT_COLUMN = "Common Defect List";
const DISCIPLINE_COLUMN = "Task Allocation";

function parseCsvLine(line) {
  const values = [];
  let value = "";
  let isQuoted = false;

  for (let index = 0; index < line.length; index += 1) {
    const char = line[index];
    const nextChar = line[index + 1];

    if (char === '"' && isQuoted && nextChar === '"') {
      value += '"';
      index += 1;
      continue;
    }

    if (char === '"') {
      isQuoted = !isQuoted;
      continue;
    }

    if (char === "," && !isQuoted) {
      values.push(value);
      value = "";
      continue;
    }

    value += char;
  }

  values.push(value);
  return values;
}

export function parseCommonDefectsCsv(csvText) {
  const rows = csvText
    .trim()
    .split(/\r?\n/)
    .map(parseCsvLine);
  const headers = rows[0] || [];

  return rows
    .slice(1)
    .map((row) => {
      const record = headers.reduce((acc, header, index) => {
        acc[header] = row[index] || "";
        return acc;
      }, {});

      return {
        text: record[DEFECT_COLUMN]?.trim() || "",
        discipline: record[DISCIPLINE_COLUMN]?.trim() || "",
        record
      };
    })
    .filter((defect) => defect.text);
}

export function normalizeDefectText(value) {
  return value.trim().replace(/\s+/g, " ").toLowerCase();
}
