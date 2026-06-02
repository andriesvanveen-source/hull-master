from __future__ import annotations

import json
import re
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

import pypdf


ROOT = Path(__file__).resolve().parents[1]
ENV_FILE = ROOT / ".env.local"
PDF_PATH = Path("C:/Users/andri/Downloads/C2020_CE_List.pdf")

BOAT_NAME = "C2020"
DISCIPLINES = {"PLUM", "ELEC", "MECH", "FA", "DECK", "CARP"}
AREA_MAP = {
    "SALOON": "Saloon",
    "AFT COCKPIT": "Aft Cockpit",
    "FWD COCKPIT LOUNGE & DECK": "Fwd Cockpit Lounge & Deck",
    "STBD ENGINE": "Stbd Engine",
    "PORT ENGINE": "Port Engine",
    "STBD FWD CABIN & HEADS": "Stbd Fwd Cabin & Heads",
    "STBD MID CABIN & HEADS": "Stbd Mid Cabin & Heads",
    "STBD AFT CABIN & HEADS": "Stbd Aft Cabin & Heads",
    "PORT FWD CABIN & HEADS": "Port Fwd Cabin & Heads",
    "PORT MID CABIN & HEADS": "Port Mid Cabin & Heads",
    "PORT AFT CABIN & HEADS": "Port Aft Cabin & Heads",
    "CREW CABIN": "Crew Cabin",
}


def load_env() -> dict[str, str]:
    values: dict[str, str] = {}

    for line in ENV_FILE.read_text(encoding="utf-8").splitlines():
        if not line.strip() or line.strip().startswith("#") or "=" not in line:
            continue

        key, value = line.split("=", 1)
        values[key.strip()] = value.strip()

    return values


def request_json(method: str, url: str, anon_key: str, payload: object | None = None) -> object:
    body = None if payload is None else json.dumps(payload).encode("utf-8")
    request = urllib.request.Request(url, data=body, method=method)
    request.add_header("apikey", anon_key)
    request.add_header("Authorization", f"Bearer {anon_key}")
    request.add_header("Content-Type", "application/json")
    request.add_header("Prefer", "return=representation")

    if "on_conflict=" in url:
        request.add_header("Prefer", "resolution=merge-duplicates,return=representation")

    try:
        with urllib.request.urlopen(request, timeout=45) as response:
            text = response.read().decode("utf-8")
            return json.loads(text) if text else []
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"{method} {url} failed: {error.code} {detail}") from error


def clean_text(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip())


def parse_pdf_defects() -> list[dict[str, str]]:
    reader = pypdf.PdfReader(str(PDF_PATH))
    lines: list[str] = []

    for page in reader.pages:
        for raw_line in (page.extract_text() or "").splitlines():
            line = raw_line.strip()

            if not line:
                continue

            if line.startswith("Yacht Commissioning Audit"):
                continue

            if line.startswith("Hull C2020"):
                continue

            if line.startswith("# Defect Discipline"):
                continue

            if line == "Engineer":
                continue

            lines.append(line)

    defects: list[dict[str, str]] = []
    current_area = ""
    current_defect: dict[str, str] | None = None

    def flush_current() -> None:
        nonlocal current_defect

        if current_defect:
            current_defect["text"] = clean_text(current_defect["text"])
            defects.append(current_defect)
            current_defect = None

    for line in lines:
        area = AREA_MAP.get(line.upper())

        if area:
            flush_current()
            current_area = area
            continue

        if line == "— no defects logged —":
            flush_current()
            continue

        row_match = re.match(r"^(\d+)\s+(.+)$", line)

        if row_match:
            flush_current()
            text = row_match.group(2).strip()
            discipline = ""

            for candidate in DISCIPLINES:
                suffix = f" {candidate}"

                if text.endswith(suffix):
                    text = text[:-len(suffix)].strip()
                    discipline = candidate
                    break

            current_defect = {
                "number": row_match.group(1),
                "text": text,
                "discipline": discipline,
                "area": current_area,
            }
            continue

        if line in DISCIPLINES and current_defect:
            current_defect["discipline"] = line
            continue

        if current_defect:
            current_defect["text"] = f"{current_defect['text']} {line}"

    flush_current()
    return defects


def import_to_supabase(defects: list[dict[str, str]]) -> dict[str, int]:
    env = load_env()
    supabase_url = env["NEXT_PUBLIC_SUPABASE_URL"].rstrip("/")
    anon_key = env["NEXT_PUBLIC_SUPABASE_ANON_KEY"]
    boat_url = f"{supabase_url}/rest/v1/boats?on_conflict=name"
    boat_result = request_json("POST", boat_url, anon_key, {"name": BOAT_NAME})

    if boat_result:
        boat_id = boat_result[0]["id"]
    else:
        query = urllib.parse.urlencode({"name": f"eq.{BOAT_NAME}", "select": "id"})
        existing_boats = request_json("GET", f"{supabase_url}/rest/v1/boats?{query}", anon_key)

        if not existing_boats:
            raise RuntimeError(f"Could not create or find {BOAT_NAME}")

        boat_id = existing_boats[0]["id"]

    delete_query = urllib.parse.urlencode({"boat_id": f"eq.{boat_id}"})
    deleted = request_json("DELETE", f"{supabase_url}/rest/v1/defects?{delete_query}", anon_key)
    payload = [
        {
            "boat_id": boat_id,
            "text": defect["text"],
            "discipline": defect["discipline"] or None,
            "area": defect["area"],
        }
        for defect in defects
    ]

    inserted = 0
    batch_size = 50
    for index in range(0, len(payload), batch_size):
        batch = payload[index:index + batch_size]

        if batch:
            result = request_json("POST", f"{supabase_url}/rest/v1/defects", anon_key, batch)
            inserted += len(result)

    return {
        "defectsDeleted": len(deleted),
        "defectsInserted": inserted,
    }


def main() -> None:
    defects = parse_pdf_defects()

    missing_area = [defect for defect in defects if not defect["area"]]
    missing_discipline = [defect for defect in defects if not defect["discipline"]]

    if len(defects) != 81 or missing_area or missing_discipline:
        print(json.dumps({
            "parsedDefects": len(defects),
            "missingArea": missing_area,
            "missingDiscipline": missing_discipline,
        }, indent=2))
        raise SystemExit("PDF parse check failed.")

    if "--dry-run" in sys.argv:
        print(json.dumps({
            "boat": BOAT_NAME,
            "defectCount": len(defects),
            "firstFive": defects[:5],
            "last": defects[-1],
        }, indent=2))
        return

    result = import_to_supabase(defects)
    result["boat"] = BOAT_NAME
    result["parsedDefects"] = len(defects)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
