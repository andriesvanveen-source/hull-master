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
  const titleHeight = 34;
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
  const titleSize = 10;
  const titleWidth = fonts.bold.widthOfTextAtSize(title, titleSize);
  const logoSize = 28;
  const disciplineText = "Discipline:";
  const disciplineSize = 6.2;
  const disciplineWidth = fonts.bold.widthOfTextAtSize(disciplineText, disciplineSize);
  const lineWidth = Math.min(72, Math.max(38, width * 0.22));
  const groupWidth = logoSize + 7 + titleWidth + 8 + disciplineWidth + 6 + lineWidth;
  const groupX = x + Math.max(5, (width - groupWidth) / 2);

  page.drawImage(logo, {
    x: groupX,
    y: titleY + (titleHeight - logoSize) / 2,
    width: logoSize,
    height: logoSize
  });
  const titleX = groupX + logoSize + 7;
  const baseline = titleY + 12.5;
  page.drawText(title, { x: titleX, y: baseline, size: titleSize, font: fonts.bold });
  const disciplineX = titleX + titleWidth + 8;
  const disciplineLabel = discipline.trim() ? `Discipline: ${discipline.trim()}` : disciplineText;
  page.drawText(disciplineLabel, {
    x: disciplineX,
    y: baseline + 0.5,
    size: disciplineSize,
    font: fonts.bold,
    maxWidth: lineWidth + disciplineWidth
  });
  if (!discipline.trim()) {
    const lineX = disciplineX + disciplineWidth + 6;
    page.drawLine({
      start: { x: lineX, y: baseline },
      end: { x: Math.min(lineX + lineWidth, x + width - 4), y: baseline },
      thickness: 0.5
    });
  }

  ["Team Member", "Team Leader", "CE / QC"].forEach((label, index) => {
    drawCenteredText(page, label, fonts.bold, 6.6, x + colWidth * index + colWidth / 2, headerY + 7.5);
    page.drawText("Date:", { x: x + colWidth * index + 4, y: y + 4, size: 6.2, font: fonts.regular });
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
