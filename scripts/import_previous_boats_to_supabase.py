from __future__ import annotations

import json
import re
import subprocess
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BUILD_SCRIPT = ROOT / "scripts" / "build_area_defects_and_seed.py"
ENV_FILE = ROOT / ".env.local"


def load_env() -> dict[str, str]:
    values: dict[str, str] = {}

    if not ENV_FILE.exists():
        return values

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


def normalize(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip()).lower()


def extract_payload() -> dict[str, list[dict[str, str]]]:
    namespace: dict[str, object] = {"__file__": str(BUILD_SCRIPT)}
    code = BUILD_SCRIPT.read_text(encoding="utf-8")
    exec(compile(code, str(BUILD_SCRIPT), "exec"), namespace)
    _, discipline_by_text = namespace["load_common_defects_from_area_workbook"]()
    return namespace["extract_previous_boats"](discipline_by_text)


def main() -> None:
    env = load_env()
    supabase_url = env.get("NEXT_PUBLIC_SUPABASE_URL", "").rstrip("/")
    anon_key = env.get("NEXT_PUBLIC_SUPABASE_ANON_KEY", "")

    if not supabase_url or not anon_key:
        raise SystemExit("Missing NEXT_PUBLIC_SUPABASE_URL or NEXT_PUBLIC_SUPABASE_ANON_KEY in .env.local")

    boats = extract_payload()
    imported_boats = 0
    imported_defects = 0

    for boat_name, defects in boats.items():
        boat_url = f"{supabase_url}/rest/v1/boats?on_conflict=name"
        boat_result = request_json("POST", boat_url, anon_key, {"name": boat_name})

        if boat_result:
            boat_id = boat_result[0]["id"]
            imported_boats += 1
        else:
            query = urllib.parse.urlencode({
                "name": f"eq.{boat_name}",
                "select": "id",
            })
            existing_boats = request_json("GET", f"{supabase_url}/rest/v1/boats?{query}", anon_key)

            if not existing_boats:
                raise RuntimeError(f"Could not create or find boat {boat_name}")

            boat_id = existing_boats[0]["id"]

        existing_query = urllib.parse.urlencode({
            "boat_id": f"eq.{boat_id}",
            "select": "text,area",
        })
        existing_defects = request_json("GET", f"{supabase_url}/rest/v1/defects?{existing_query}", anon_key)
        existing_keys = {
            (normalize(item.get("area", "")), normalize(item.get("text", "")))
            for item in existing_defects
        }
        new_defects = []

        for defect in defects:
            key = (normalize(defect["area"]), normalize(defect["text"]))

            if key in existing_keys:
                continue

            new_defects.append({
                "boat_id": boat_id,
                "text": defect["text"],
                "discipline": defect["discipline"] or None,
                "area": defect["area"],
            })
            existing_keys.add(key)

        for index in range(0, len(new_defects), 250):
            batch = new_defects[index:index + 250]

            if batch:
                request_json("POST", f"{supabase_url}/rest/v1/defects", anon_key, batch)
                imported_defects += len(batch)

    print(json.dumps({
        "boatsProcessed": len(boats),
        "boatsCreatedOrUpdated": imported_boats,
        "defectsInserted": imported_defects,
    }, indent=2))


if __name__ == "__main__":
    main()
