"use client";

function downloadBlob(blob, fileName) {
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = fileName;
  document.body.appendChild(link);
  link.click();
  link.remove();
  window.setTimeout(() => URL.revokeObjectURL(url), 1000);
}

export async function exportQualityExcel(boat) {
  const ExcelJS = (await import("exceljs")).default;
  const workbook = new ExcelJS.Workbook();
  workbook.creator = "Hull Master Quality Control";
  const sheet = workbook.addWorksheet(String(boat.name || "Quality Audit").slice(0, 31));
  const headers = ["No", "Concerns", "Code", "Item/Part /sub component", "Failure", "Description", "Repaired by", "Repaired Date", "TL/BM CHECK", "QC", ""];
  sheet.addRow(["QUALITY CONTROL AUDIT", boat.name]);
  sheet.addRow(["Exported", new Date()]);
  sheet.addRow([]);
  sheet.addRow(headers);
  sheet.addRow(["", "", "", "", "", "", "", "", "", "RWK", "ACC"]);
  sheet.mergeCells("A4:A5"); sheet.mergeCells("B4:B5"); sheet.mergeCells("C4:C5"); sheet.mergeCells("D4:D5"); sheet.mergeCells("E4:E5"); sheet.mergeCells("F4:F5"); sheet.mergeCells("G4:G5"); sheet.mergeCells("H4:H5"); sheet.mergeCells("I4:I5"); sheet.mergeCells("J4:K4");
  let number = 1;
  boat.areas.forEach((area) => {
    sheet.addRow([area, `Inspector: ${boat.areaInspectors?.[area] || "Not assigned"}`]);
    const areaRow = sheet.lastRow;
    areaRow.font = { bold: true };
    areaRow.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FFDDE8E3" } };
    sheet.mergeCells(`B${areaRow.number}:K${areaRow.number}`);
    boat.defects.filter((defect) => defect.area === area).forEach((defect) => {
      sheet.addRow([number, defect.concern ? "X" : "", defect.code || "", defect.item, defect.failure, defect.description, "", "", "", "", ""]);
      number += 1;
    });
  });
  sheet.columns = [7, 11, 8, 31, 22, 54, 19, 18, 18, 10, 10].map((width) => ({ width }));
  [4, 5].forEach((rowNumber) => { sheet.getRow(rowNumber).font = { bold: true, color: { argb: "FFFFFFFF" } }; sheet.getRow(rowNumber).fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF0B2D49" } }; sheet.getRow(rowNumber).alignment = { vertical: "middle", horizontal: "center", wrapText: true }; });
  sheet.autoFilter = { from: "A4", to: `K${Math.max(5, sheet.rowCount)}` };
  sheet.views = [{ state: "frozen", ySplit: 5 }];
  sheet.eachRow((row, rowNumber) => {
    if (rowNumber > 5) row.alignment = { vertical: "top", wrapText: true };
    row.eachCell((cell) => { cell.border = { bottom: { style: "thin", color: { argb: "FFD5DFE8" } } }; });
  });
  const buffer = await workbook.xlsx.writeBuffer();
  downloadBlob(new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" }), `${boat.name}-quality-audit.xlsx`);
}

export async function exportQualityPdf(boat) {
  const { jsPDF } = await import("jspdf");
  const { default: autoTable } = await import("jspdf-autotable");
  const doc = new jsPDF({ orientation: "landscape", unit: "mm", format: "a4" });
  const rows = [];
  let number = 1;
  boat.areas.forEach((area) => {
    rows.push([{ content: `${area} · Inspector: ${boat.areaInspectors?.[area] || "Not assigned"}`, colSpan: 11, styles: { fillColor: [221, 232, 227], fontStyle: "bold" } }]);
    boat.defects.filter((defect) => defect.area === area).forEach((defect) => {
      rows.push([number++, defect.concern ? "X" : "", defect.code || "", defect.item, defect.failure, defect.description, "", "", "", "", ""]);
    });
  });
  doc.setFillColor(11, 45, 73);
  doc.rect(0, 0, 297, 20, "F");
  doc.setTextColor(255, 255, 255);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(17);
  doc.text("Quality Control Audit", 10, 12);
  doc.setFontSize(10);
  doc.text(`Hull ${boat.name}`, 287, 12, { align: "right" });
  doc.setTextColor(20, 28, 34);
  doc.setFont("helvetica", "normal");
  autoTable(doc, {
    startY: 26,
    head: [[{ content: "No", rowSpan: 2 }, { content: "Concerns", rowSpan: 2 }, { content: "Code", rowSpan: 2 }, { content: "Item/Part /sub component", rowSpan: 2 }, { content: "Failure", rowSpan: 2 }, { content: "Description", rowSpan: 2 }, { content: "Repaired by", rowSpan: 2 }, { content: "Repaired Date", rowSpan: 2 }, { content: "TL/BM CHECK", rowSpan: 2 }, { content: "QC", colSpan: 2 }], ["RWK", "ACC"]],
    body: rows,
    theme: "grid",
    styles: { fontSize: 6.2, cellPadding: 1.2, valign: "middle", lineColor: [140, 150, 160], lineWidth: .2 },
    headStyles: { fillColor: [11, 45, 73], textColor: 255, fontStyle: "bold", halign: "center" },
    columnStyles: { 0: { cellWidth: 8 }, 1: { cellWidth: 14, halign: "center" }, 2: { cellWidth: 10 }, 3: { cellWidth: 45 }, 4: { cellWidth: 29 }, 5: { cellWidth: 71 }, 6: { cellWidth: 24 }, 7: { cellWidth: 23 }, 8: { cellWidth: 24 }, 9: { cellWidth: 10 }, 10: { cellWidth: 10 } },
    margin: { left: 7, right: 7, top: 15, bottom: 12 }
  });
  doc.save(`${boat.name}-quality-audit.pdf`);
}
