import { readFile } from "node:fs/promises";
import path from "node:path";

import {
  decodePDFRawStream,
  PDFArray,
  PDFDocument,
  PDFRawStream,
  StandardFonts,
  rgb
} from "pdf-lib";

const TABLE_HEIGHT = 105;
const IMAGE_DRAW_RE = /(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+cm\s*\n?\/a0 gs \/x\d+ Do/g;

function pageContent(page) {
  const contents = page.node.Contents();
  const streams = contents instanceof PDFArray
    ? Array.from({ length: contents.size() }, (_, index) => page.doc.context.lookup(contents.get(index)))
    : [page.doc.context.lookup(contents)];

  return streams
    .filter((stream) => stream instanceof PDFRawStream)
    .map((stream) => Buffer.from(decodePDFRawStream(stream).decode()).toString("latin1"))
    .join("\n");
}

function imageRects(page) {
  const rects = [];
  const content = pageContent(page);
  IMAGE_DRAW_RE.lastIndex = 0;
  let match;

  while ((match = IMAGE_DRAW_RE.exec(content))) {
    const [, aText, , , dText, eText, fText] = match;
    const a = Number(aText);
    const d = Number(dText);
    const width = Math.abs(a);
    const height = Math.abs(d);

    if (width >= 50 && height >= 50) {
      rects.push({
        x: Number(eText),
        top: Number(fText) + (d < 0 ? d : 0),
        width,
        height
      });
    }
  }

  return rects;
}

function drawCenteredText(page, text, font, size, centerX, y) {
  const width = font.widthOfTextAtSize(text, size);
  page.drawText(text, { x: centerX - width / 2, y, size, font, color: rgb(0, 0, 0) });
}

function drawTable(page, rect, discipline, fonts, logo) {
  const { width: pageWidth, height: pageHeight } = page.getSize();
  const x = rect.x + rect.width + 20;
  let width = Math.min(300, pageWidth - x - 45);
  if (width < 150) width = Math.max(130, pageWidth - x - 20);
  if (width < 100 || x >= pageWidth - 20) return false;

  const top = Math.min(rect.top, pageHeight - TABLE_HEIGHT - 35);
  const y = pageHeight - top - TABLE_HEIGHT;
  const titleHeight = 40;
  const headerHeight = 18;
  const titleY = y + TABLE_HEIGHT - titleHeight;
  const headerY = titleY - headerHeight;
  const colWidth = width / 3;

  page.drawRectangle({
    x, y, width, height: TABLE_HEIGHT,
    color: rgb(1, 1, 1),
    borderColor: rgb(0, 0, 0),
    borderWidth: 0.8
  });

  for (const lineY of [titleY, headerY]) {
    page.drawLine({ start: { x, y: lineY }, end: { x: x + width, y: lineY }, thickness: 0.8 });
  }
  for (const lineX of [x + colWidth, x + colWidth * 2]) {
    page.drawLine({ start: { x: lineX, y }, end: { x: lineX, y: titleY }, thickness: 0.8 });
  }

  const title = "R&C Sign Off";
  const titleSize = 12;
  const titleWidth = fonts.bold.widthOfTextAtSize(title, titleSize);
  const logoSize = 34;
  const groupX = x + Math.max(5, (width - Math.min(width - 10, titleWidth + 140)) / 2);

  page.drawImage(logo, {
    x: groupX,
    y: titleY + (titleHeight - logoSize) / 2,
    width: logoSize,
    height: logoSize
  });
  const titleX = groupX + logoSize + 7;
  page.drawText(title, { x: titleX, y: titleY + 15, size: titleSize, font: fonts.bold });
  const disciplineLabel = discipline.trim() ? `Discipline: ${discipline.trim()}` : "Discipline: __________";
  page.drawText(disciplineLabel, {
    x: Math.min(titleX + titleWidth + 8, x + width - 105),
    y: titleY + 16,
    size: 6.8,
    font: fonts.bold,
    maxWidth: 100
  });

  ["Team Member", "Team Leader", "CE / QC"].forEach((label, index) => {
    drawCenteredText(page, label, fonts.bold, 7.4, x + colWidth * index + colWidth / 2, headerY + 7.5);
    page.drawText("Date:", { x: x + colWidth * index + 4, y: y + 4, size: 6.6, font: fonts.regular });
  });

  return true;
}

export async function processSignoffPdf(inputBytes, discipline = "") {
  const pdf = await PDFDocument.load(inputBytes);
  const logoBytes = await readFile(path.join(process.cwd(), "public", "robertson-caine-logo-transparent.png"));
  const logo = await pdf.embedPng(logoBytes);
  const fonts = {
    regular: await pdf.embedFont(StandardFonts.TimesRoman),
    bold: await pdf.embedFont(StandardFonts.TimesRomanBold)
  };
  let tables = 0;

  for (const page of pdf.getPages()) {
    for (const rect of imageRects(page)) {
      if (drawTable(page, rect, discipline, fonts, logo)) tables += 1;
    }
  }

  return {
    bytes: await pdf.save(),
    pages: pdf.getPageCount(),
    tables
  };
}
