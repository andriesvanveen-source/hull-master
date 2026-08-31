from __future__ import annotations

import argparse
import io
import json
import re
import sys
from pathlib import Path

from pypdf import PdfReader, PdfWriter
from reportlab.lib.colors import Color
from reportlab.lib.utils import ImageReader
from reportlab.pdfgen import canvas


LOGO_IMAGE_PATH = Path(__file__).resolve().parents[1] / "assets" / "robertson-kane-logo.png"
TABLE_HEIGHT = 105
TITLE_ROW_HEIGHT = 25
HEADER_ROW_HEIGHT = 18
LOGO_RADIUS = 6
TITLE_FONT_SIZE = 12
DISCIPLINE_FONT_SIZE = 6.8
HEADER_FONT_SIZE = 7.4
DATE_FONT_SIZE = 6.6

IMAGE_DRAW_RE = re.compile(
    rb"(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+"
    rb"(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+"
    rb"(-?\d+(?:\.\d+)?)\s+(-?\d+(?:\.\d+)?)\s+cm\s*\n?/a0 gs /x\d+ Do"
)


def image_rects_top_coords(page) -> list[tuple[float, float, float, float]]:
    data = page.get_contents().get_data()
    rects: list[tuple[float, float, float, float]] = []
    for match in IMAGE_DRAW_RE.finditer(data):
        a, _b, _c, d, e, f = map(float, match.groups())
        width = abs(a)
        height = abs(d)
        if width < 50 or height < 50:
            continue
        x = e
        y = f + d if d < 0 else f
        rects.append((x, y, width, height))
    return rects


def draw_compass_mark(c: canvas.Canvas, center_x: float, center_y: float, radius: float) -> None:
    c.saveState()
    if LOGO_IMAGE_PATH.exists():
        size = radius * 2
        c.drawImage(
            ImageReader(str(LOGO_IMAGE_PATH)),
            center_x - radius,
            center_y - radius,
            width=size,
            height=size,
            preserveAspectRatio=True,
            mask="auto",
        )
        c.restoreState()
        return

    c.setFillColorRGB(0.02, 0.17, 0.36)
    c.setStrokeColorRGB(0.83, 0.70, 0.42)
    c.setLineWidth(max(0.7, radius * 0.11))
    c.circle(center_x, center_y, radius, fill=1, stroke=1)

    c.setFillColor(Color(0.93, 0.75, 0.28, alpha=0.95))
    gold_points = [
        (center_x, center_y + radius * 0.84),
        (center_x + radius * 0.16, center_y + radius * 0.16),
        (center_x + radius * 0.84, center_y),
        (center_x + radius * 0.16, center_y - radius * 0.16),
        (center_x, center_y - radius * 0.84),
        (center_x - radius * 0.16, center_y - radius * 0.16),
        (center_x - radius * 0.84, center_y),
        (center_x - radius * 0.16, center_y + radius * 0.16),
    ]
    path = c.beginPath()
    path.moveTo(*gold_points[0])
    for point in gold_points[1:]:
        path.lineTo(*point)
    path.close()
    c.drawPath(path, fill=1, stroke=0)

    c.setFillColorRGB(1, 1, 1)
    white_points = [
        (center_x, center_y + radius * 0.73),
        (center_x + radius * 0.11, center_y + radius * 0.11),
        (center_x + radius * 0.73, center_y),
        (center_x + radius * 0.11, center_y - radius * 0.11),
        (center_x, center_y - radius * 0.73),
        (center_x - radius * 0.11, center_y - radius * 0.11),
        (center_x - radius * 0.73, center_y),
        (center_x - radius * 0.11, center_y + radius * 0.11),
    ]
    path = c.beginPath()
    path.moveTo(*white_points[0])
    for point in white_points[1:]:
        path.lineTo(*point)
    path.close()
    c.drawPath(path, fill=1, stroke=0)
    c.restoreState()


def draw_signoff_table(
    c: canvas.Canvas,
    x: float,
    y_top: float,
    width: float,
    height: float,
    page_height: float,
    discipline: str,
) -> None:
    y = page_height - y_top - height
    title_h = TITLE_ROW_HEIGHT
    header_h = HEADER_ROW_HEIGHT
    body_h = height - title_h - header_h
    col_w = width / 3

    c.saveState()
    c.setFillColorRGB(1, 1, 1)
    c.setStrokeColorRGB(0, 0, 0)
    c.setLineWidth(0.8)
    c.rect(x, y, width, height, fill=1, stroke=1)

    title_y = y + height - title_h
    header_y = title_y - header_h
    c.line(x, title_y, x + width, title_y)
    c.line(x, header_y, x + width, header_y)
    c.line(x + col_w, y, x + col_w, title_y)
    c.line(x + (col_w * 2), y, x + (col_w * 2), title_y)

    c.setFillColorRGB(0, 0, 0)
    title_text = "R&C Sign Off"
    discipline_label = "Discipline:"
    discipline_text = discipline.strip() or "________________________"
    line_text = discipline_text if discipline.strip() else "________________________"

    c.setFont("Times-Bold", TITLE_FONT_SIZE)
    title_width = c.stringWidth(title_text, "Times-Bold", TITLE_FONT_SIZE)
    c.setFont("Times-Bold", DISCIPLINE_FONT_SIZE)
    discipline_width = c.stringWidth(discipline_label, "Times-Bold", DISCIPLINE_FONT_SIZE)
    c.setFont("Times-Roman", DISCIPLINE_FONT_SIZE)
    line_width = min(72, max(38, width * 0.22))

    group_width = (LOGO_RADIUS * 2) + 8 + title_width + 8 + discipline_width + 8 + line_width
    group_x = x + max(5, (width - group_width) / 2)
    title_baseline = title_y + 7.5
    mark_x = group_x + LOGO_RADIUS
    mark_y = title_y + (title_h / 2)
    draw_compass_mark(c, mark_x, mark_y, LOGO_RADIUS)

    title_x = group_x + (LOGO_RADIUS * 2) + 8
    c.setFont("Times-Bold", TITLE_FONT_SIZE)
    c.drawString(title_x, title_baseline, title_text)

    discipline_x = title_x + title_width + 8
    c.setFont("Times-Bold", DISCIPLINE_FONT_SIZE)
    c.drawString(discipline_x, title_baseline + 1, discipline_label)

    line_x = discipline_x + discipline_width + 8
    c.setFont("Times-Roman", DISCIPLINE_FONT_SIZE)
    if discipline.strip():
        available_width = max(12, (x + width - 4) - line_x)
        while len(line_text) > 3 and c.stringWidth(line_text, "Times-Roman", DISCIPLINE_FONT_SIZE) > available_width:
            line_text = line_text[:-2].rstrip() + "."
        c.drawString(line_x, title_baseline + 1, line_text)
    else:
        c.line(line_x, title_baseline + 1, min(line_x + line_width, x + width - 4), title_baseline + 1)

    c.setFont("Times-Bold", HEADER_FONT_SIZE)
    for idx, label in enumerate(["Team Member", "Team Leader", "CE / QC"]):
        c.drawCentredString(x + (col_w * idx) + (col_w / 2), header_y + 7.5, label)

    c.setFont("Times-Roman", DATE_FONT_SIZE)
    for idx in range(3):
        c.drawString(x + (col_w * idx) + 4, y + max(4, body_h * 0.05), "Date:")
    c.restoreState()


def make_overlay(page, rects: list[tuple[float, float, float, float]], discipline: str):
    page_w = float(page.mediabox.width)
    page_h = float(page.mediabox.height)
    packet = io.BytesIO()
    c = canvas.Canvas(packet, pagesize=(page_w, page_h))

    for photo_x, photo_y, photo_w, photo_h in rects:
        table_x = photo_x + photo_w + 20
        table_w = min(300, page_w - table_x - 45)
        if table_w < 150:
            table_w = max(130, page_w - table_x - 20)
        table_y = min(photo_y, page_h - TABLE_HEIGHT - 35)
        draw_signoff_table(c, table_x, table_y, table_w, TABLE_HEIGHT, page_h, discipline)

    c.save()
    packet.seek(0)
    return PdfReader(packet).pages[0]


def process(input_path: Path, output_path: Path, discipline: str) -> tuple[int, int]:
    reader = PdfReader(str(input_path))
    writer = PdfWriter()
    total = 0

    for page in reader.pages:
        rects = image_rects_top_coords(page)
        total += len(rects)
        if rects:
            page.merge_page(make_overlay(page, rects, discipline))
        writer.add_page(page)

    with output_path.open("wb") as handle:
        writer.write(handle)
    return len(reader.pages), total


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--discipline", default="")
    args = parser.parse_args()

    pages, tables = process(Path(args.input), Path(args.output), args.discipline)
    print(json.dumps({"pages": pages, "tables": tables}))


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(json.dumps({"error": str(exc)}), file=sys.stderr)
        raise

