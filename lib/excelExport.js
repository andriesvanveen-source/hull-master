"use client";

function safeSheetName(name, used) {
  const base = String(name || "Boat").replace(/[\\/?*\[\]:]/g, " ").trim().slice(0, 31) || "Boat";
  let candidate = base;
  let suffix = 2;

  while (used.has(candidate.toLowerCase())) {
    const label = ` (${suffix})`;
    candidate = `${base.slice(0, 31 - label.length)}${label}`;
    suffix += 1;
  }

  used.add(candidate.toLowerCase());
  return candidate;
}

function boatRows(boat) {
  const completed = new Set(boat.completedAreas || []);
  return (boat.defects || []).map((defect, index) => ({
    Number: index + 1,
    Area: defect.area || "",
    Defect: defect.text || "",
    Discipline: defect.discipline || "",
    Audited: completed.has(defect.area) ? "Yes" : "No",
    "Callback Requested": defect.callbackRequestedAt ? "Yes" : "No",
    "Created At": defect.createdAt ? new Date(defect.createdAt) : "",
    "Updated At": defect.updatedAt ? new Date(defect.updatedAt) : ""
  }));
}

export async function exportBoatsWorkbook(boats, fileName = "Hull Master Defects.xlsx") {
  if (!Array.isArray(boats) || boats.length === 0) {
    throw new Error("There are no boats to export.");
  }

  const ExcelJS = (await import("exceljs")).default;
  const workbook = new ExcelJS.Workbook();
  workbook.creator = "Hull Master";
  workbook.created = new Date();
  const usedNames = new Set();

  for (const boat of boats) {
    const rows = boatRows(boat);
    const headers = [
      "Number",
      "Area",
      "Defect",
      "Discipline",
      "Audited",
      "Callback Requested",
      "Created At",
      "Updated At"
    ];
    const worksheet = workbook.addWorksheet(safeSheetName(boat.name, usedNames));
    worksheet.addRow(["Hull", boat.name || ""]);
    worksheet.addRow(["Commissioning Engineer", boat.commissioningEngineer || ""]);
    worksheet.addRow(["Completed Areas", (boat.completedAreas || []).join(", ")]);
    worksheet.addRow([]);
    worksheet.addRow(headers);
    rows.forEach((row) => worksheet.addRow(headers.map((header) => row[header])));
    worksheet.columns = [8, 24, 58, 16, 12, 20, 20, 20].map((width) => ({ width }));
    worksheet.autoFilter = { from: "A5", to: `H${Math.max(5, rows.length + 5)}` };
    worksheet.getRow(5).font = { bold: true, color: { argb: "FFFFFFFF" } };
    worksheet.getRow(5).fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF173F63" } };
    worksheet.views = [{ state: "frozen", ySplit: 5 }];
  }

  const buffer = await workbook.xlsx.writeBuffer();
  const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = fileName;
  document.body.appendChild(link);
  link.click();
  link.remove();
  window.setTimeout(() => URL.revokeObjectURL(url), 1000);
}
