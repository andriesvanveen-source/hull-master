import argparse
import json
import re
from pathlib import Path

import openpyxl

from build_quality_control_reference_data import DISCIPLINES, STAMP, canonical_area, clean, sql_text

ROOT = Path(__file__).resolve().parents[1]
REFERENCE_JSON = ROOT / "public" / "quality-control" / "reference-audits.json"
CATALOG_JSON = ROOT / "public" / "quality-control" / "area-common-defects.json"
SQL_DIRECTORY = ROOT / "supabase"
MODELS = ["B5", "B8", "B9", "C1", "C2", "C5"]


def normalize(value):
    return re.sub(r"[^a-z0-9]+", " ", clean(value).lower()).strip()


def hull_from_file(path):
    match = re.match(r"([BC]\d+)", path.stem, re.I)
    if not match:
        raise ValueError(f"Could not identify a hull number from {path.name}")
    return match.group(1).upper()


def description_column(sheet):
    headers = [normalize(cell.value) for cell in sheet[1]]
    for label in ("description", "failure mode"):
        if label in headers:
            return headers.index(label)
    return 6


def parse_handover(path):
    workbook = openpyxl.load_workbook(path, read_only=True, data_only=True)
    sheet = workbook["Audit sheet"]
    hull = hull_from_file(path)
    description_index = description_column(sheet)
    current_area = "Unassigned"
    areas = []
    defects = []
    for row_number, values in enumerate(sheet.iter_rows(values_only=True), 1):
        row = list(values) + [None] * 14
        code_value = row[2]
        try:
            code = int(code_value)
        except (TypeError, ValueError):
            code = 0
        if code not in DISCIPLINES:
            if not clean(row[3]) and not clean(row[4]):
                candidate = clean(row[description_index]) or clean(row[1])
                if candidate and normalize(candidate) not in {"area", "description", "failure mode"}:
                    current_area = canonical_area(candidate)
            continue
        area_cell = clean(row[1])
        concern = normalize(area_cell) == "concern"
        if area_cell and not concern and not area_cell.isdigit():
            current_area = canonical_area(area_cell)
        area = canonical_area(current_area)
        item = clean(row[3]) or "Unspecified item"
        failure = clean(row[4]) or "Defect"
        description = clean(row[description_index])
        if not description:
            continue
        if area not in areas:
            areas.append(area)
        defects.append({
            "id": f"qc-handover-{hull.lower()}-r{row_number}",
            "area": area,
            "item": item,
            "failure": failure,
            "description": description,
            "code": code,
            "discipline": DISCIPLINES[code],
            "concern": concern,
            "repairedBy": "",
            "repairedDate": "",
            "teamLeaderCheck": "",
            "qcRwk": "",
            "qcAcc": "",
            "createdAt": STAMP,
            "updatedAt": STAMP,
        })
    return {
        "id": f"qc-handover-{hull.lower()}",
        "name": f"{hull}_HO_Audit",
        "model": hull[:2],
        "auditType": "HO",
        "areas": areas,
        "areaInspectors": {},
        "completedAreas": [],
        "defects": defects,
        "createdAt": STAMP,
        "updatedAt": STAMP,
    }


def sql_for_model(qc3_audits, handover_audits, model):
    lines = [
        f"-- Quality Control audit import for {model} boats.",
        "-- Renames existing reference audits to _QC3 and adds _HO_Audit boats.",
        "-- Idempotent and non-destructive: existing defects are not overwritten.",
        "begin;",
    ]
    for audit in qc3_audits:
        lines.append(
            f"update public.quality_control_boats set name={sql_text(audit['name'])} "
            f"where id={sql_text(audit['id'])};"
        )
    for audit in handover_audits:
        lines.append(
            "insert into public.quality_control_boats (id,name,model) values "
            f"({sql_text(audit['id'])},{sql_text(audit['name'])},{sql_text(audit['model'])}) "
            "on conflict (id) do update set name=excluded.name, model=excluded.model;"
        )
        for index, area in enumerate(audit["areas"]):
            lines.append(
                "insert into public.quality_control_areas (boat_id,area_name,sort_order) values "
                f"({sql_text(audit['id'])},{sql_text(area)},{index}) "
                "on conflict (boat_id,area_name) do nothing;"
            )
        for start in range(0, len(audit["defects"]), 200):
            rows = []
            for defect in audit["defects"][start:start + 200]:
                rows.append("(" + ",".join([
                    sql_text(defect["id"]), sql_text(audit["id"]), sql_text(defect["area"]),
                    sql_text(defect["item"]), sql_text(defect["failure"]), sql_text(defect["description"]),
                    str(defect["code"]), sql_text(defect["discipline"]),
                    "true" if defect["concern"] else "false", "''", "''", "''", "''", "''",
                ]) + ")")
            lines.append(
                "insert into public.quality_control_defects "
                "(id,boat_id,area_name,item,failure_mode,description,code,discipline,concern,repaired_by,repaired_date,team_leader_check,qc_rwk,qc_acc) values\n  "
                + ",\n  ".join(rows) + "\non conflict (id) do nothing;"
            )
    lines.extend([
        "commit;",
        f"select model, count(*) as audits from public.quality_control_boats where model={sql_text(model)} group by model;",
        "",
    ])
    return "\n".join(lines)


def build(handover_directory):
    qc3_audits = [audit for audit in json.loads(REFERENCE_JSON.read_text(encoding="utf-8")) if audit["id"].startswith("qc-reference-")]
    for audit in qc3_audits:
        base_name = re.sub(r"_(QC3|HO_Audit)$", "", audit["name"], flags=re.I)
        audit["name"] = f"{base_name}_QC3"
        audit["model"] = base_name[:2]
        audit["auditType"] = "QC3"
    handover_audits = [parse_handover(path) for path in sorted(handover_directory.glob("*.xlsx"))]
    if not handover_audits:
        raise ValueError(f"No .xlsx files were found in {handover_directory}")
    combined = sorted([*qc3_audits, *handover_audits], key=lambda audit: audit["name"], reverse=True)
    REFERENCE_JSON.write_text(json.dumps(combined, ensure_ascii=False, separators=(",", ":")), encoding="utf-8")

    catalog = json.loads(CATALOG_JSON.read_text(encoding="utf-8"))
    seen = {(normalize(row["area"]), normalize(row["item"]), normalize(row["issue"]), normalize(row["defect"])) for row in catalog}
    added_catalog_rows = 0
    for audit in handover_audits:
        for defect in audit["defects"]:
            key = (normalize(defect["area"]), normalize(defect["item"]), normalize(defect["failure"]), normalize(defect["description"]))
            if key in seen:
                continue
            seen.add(key)
            catalog.append({
                "area": defect["area"], "defect": defect["description"], "item": defect["item"],
                "issue": defect["failure"], "code": str(defect["code"]), "discipline": defect["discipline"],
            })
            added_catalog_rows += 1
    catalog.sort(key=lambda row: (normalize(row["area"]), normalize(row["item"]), normalize(row["issue"]), normalize(row["defect"])))
    CATALOG_JSON.write_text(json.dumps(catalog, ensure_ascii=False, separators=(",", ":")), encoding="utf-8")

    guide = ["-- Run one model file at a time after quality-control-schema.sql."]
    for model in MODELS:
        selected_qc3 = [audit for audit in qc3_audits if audit["model"] == model]
        selected_handover = [audit for audit in handover_audits if audit["model"] == model]
        output = SQL_DIRECTORY / f"quality-control-audit-data-{model}.sql"
        output.write_text(sql_for_model(selected_qc3, selected_handover, model), encoding="utf-8")
        guide.append(f"-- {output.name}: {len(selected_handover)} HO audits, {sum(len(a['defects']) for a in selected_handover)} HO defects")
    (SQL_DIRECTORY / "quality-control-audit-data.sql").write_text("\n".join(guide) + "\n", encoding="utf-8")
    print(json.dumps({
        "qc3Audits": len(qc3_audits), "handoverAudits": len(handover_audits),
        "handoverDefects": sum(len(audit["defects"]) for audit in handover_audits),
        "catalogRowsAdded": added_catalog_rows,
        "models": {model: len([audit for audit in handover_audits if audit["model"] == model]) for model in MODELS},
    }))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("handover_directory", type=Path)
    args = parser.parse_args()
    build(args.handover_directory)
