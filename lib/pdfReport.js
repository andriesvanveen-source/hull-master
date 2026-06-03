"use client";

import { getBoatAreas } from "./constants";

function getAreaRows(boat, areas) {
  return areas.reduce((acc, area) => {
    acc[area] = boat.defects.filter((defect) => defect.area === area);
    return acc;
  }, {});
}

function getRowNumbers(boat, areas) {
  let current = 1;
  const numbers = {};

  areas.forEach((area) => {
    boat.defects
      .filter((defect) => defect.area === area && defect.text.trim())
      .forEach((defect) => {
        numbers[defect.id] = current;
        current += 1;
      });
  });

  return numbers;
}

export async function exportBoatReport(boat) {
  const createdAt = new Date();
  const safeBoatName = boat.name.replace(/[^a-z0-9-]+/gi, "-").replace(/^-|-$/g, "") || "hull";
  const defectCount = boat.defects.filter((defect) => defect.text.trim()).length;
  const commissioningEngineer = boat.commissioningEngineer || "";
  const areas = getBoatAreas(boat);
  const { jsPDF } = await import("jspdf");
  const { default: autoTable } = await import("jspdf-autotable");
  const doc = new jsPDF({ orientation: "portrait", unit: "mm", format: "a4" });
  const pageWidth = doc.internal.pageSize.getWidth();
  const pageHeight = doc.internal.pageSize.getHeight();
  const generatedAt = createdAt.toLocaleString();
  const tableRows = [];
  const areaRows = getAreaRows(boat, areas);
  const rowNumbers = getRowNumbers(boat, areas);

  areas.forEach((area) => {
    const defects = areaRows[area] || [];

    tableRows.push([
      {
        content: area,
        colSpan: 7,
        styles: {
          fillColor: [223, 232, 227],
          fontStyle: "bold",
          fontSize: 9.5,
          textColor: [23, 33, 30],
          halign: "left"
        }
      }
    ]);

    if (defects.length === 0) {
      tableRows.push([
        {
          content: "- no defects logged -",
          colSpan: 7,
          styles: {
            fontStyle: "italic",
            halign: "center",
            textColor: [110, 110, 110]
          }
        }
      ]);
      return;
    }

    defects.forEach((defect) => {
      tableRows.push([
        String(rowNumbers[defect.id] || ""),
        defect.text,
        defect.discipline || "-",
        "",
        "",
        "",
        ""
      ]);
    });
  });

  doc.setFillColor(11, 45, 73);
  doc.rect(0, 0, pageWidth, 22, "F");
  doc.setTextColor(255, 255, 255);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(18);
  doc.text("Yacht Commissioning Audit", 12, 13);
  doc.setFontSize(9);
  doc.text("Hull Master", pageWidth - 12, 13, { align: "right" });

  doc.setTextColor(20, 28, 34);
  doc.setFontSize(10);
  doc.setFont("helvetica", "normal");
  doc.roundedRect(12, 29, pageWidth - 24, 40, 2, 2);
  doc.setFont("helvetica", "bold");
  doc.text("Hull Number", 18, 37);
  doc.text("Report Date", 68, 37);
  doc.text("Logged Defects", 18, 49);
  doc.text("Report Type", 68, 49);
  doc.text("Commissioning Engineer", 18, 61);
  doc.setFont("helvetica", "normal");
  doc.text(boat.name, 18, 43);
  doc.text(generatedAt, 68, 43);
  doc.text(String(defectCount), 18, 55);
  doc.text("Commissioning Defect Audit", 68, 55);
  doc.text(commissioningEngineer, 18, 67);

  autoTable(doc, {
    startY: 78,
    head: [[
      "#",
      "Defect",
      "Discipline",
      "Team Member",
      "Date",
      "Team Leader",
      "Commissioning Engineer"
    ]],
    body: tableRows,
    theme: "grid",
    tableLineColor: [130, 144, 139],
    tableLineWidth: 0.25,
    margin: { left: 12, right: 12, top: 30, bottom: 16 },
    styles: {
      font: "helvetica",
      fontSize: 6.8,
      cellPadding: 1.5,
      lineColor: [130, 144, 139],
      lineWidth: 0.25,
      minCellHeight: 8,
      textColor: [17, 17, 17],
      valign: "middle"
    },
    headStyles: {
      fillColor: [47, 58, 56],
      textColor: [255, 255, 255],
      fontStyle: "bold",
      halign: "center",
      lineColor: [130, 144, 139],
      lineWidth: 0.25
    },
    columnStyles: {
      0: { cellWidth: 8, halign: "center" },
      1: { cellWidth: 62 },
      2: { cellWidth: 18, halign: "center" },
      3: { cellWidth: 25 },
      4: { cellWidth: 18 },
      5: { cellWidth: 25 },
      6: { cellWidth: 30 }
    },
    didDrawPage: (data) => {
      const pageNumber = doc.internal.getNumberOfPages();

      if (pageNumber > 1) {
        doc.setFillColor(11, 45, 73);
        doc.rect(0, 0, pageWidth, 16, "F");
        doc.setTextColor(255, 255, 255);
        doc.setFont("helvetica", "bold");
        doc.setFontSize(10);
        doc.text(`Yacht Commissioning Audit - Hull ${boat.name}`, 12, 10);
      }

      doc.setDrawColor(130, 144, 139);
      doc.line(12, pageHeight - 11, pageWidth - 12, pageHeight - 11);
      doc.setFont("helvetica", "normal");
      doc.setFontSize(8);
      doc.setTextColor(95, 103, 99);
      doc.text(`Generated ${generatedAt}`, 12, pageHeight - 6);
      doc.text(`Page ${data.pageNumber}`, pageWidth - 12, pageHeight - 6, { align: "right" });
    }
  });

  doc.save(`${safeBoatName}-commissioning-audit.pdf`);
  return createdAt;
}
