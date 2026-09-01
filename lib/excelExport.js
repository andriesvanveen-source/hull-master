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

  const XLSX = await import("xlsx");
  const workbook = XLSX.utils.book_new();
  const usedNames = new Set();

  for (const boat of boats) {
    const metadata = [
      ["Hull", boat.name || ""],
      ["Commissioning Engineer", boat.commissioningEngineer || ""],
      ["Completed Areas", (boat.completedAreas || []).join(", ")],
      []
    ];
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
    const worksheet = XLSX.utils.aoa_to_sheet(metadata);
    XLSX.utils.sheet_add_aoa(worksheet, [headers], { origin: "A5" });
    if (rows.length > 0) {
      XLSX.utils.sheet_add_json(worksheet, rows, {
        origin: "A6",
        skipHeader: true
      });
    }
    worksheet["!cols"] = [
      { wch: 8 },
      { wch: 24 },
      { wch: 58 },
      { wch: 16 },
      { wch: 12 },
      { wch: 20 },
      { wch: 20 },
      { wch: 20 }
    ];
    worksheet["!autofilter"] = { ref: `A5:H${Math.max(5, rows.length + 5)}` };

    XLSX.utils.book_append_sheet(workbook, worksheet, safeSheetName(boat.name, usedNames));
  }

  XLSX.writeFile(workbook, fileName, {
    compression: true,
    cellDates: true
  });
}
