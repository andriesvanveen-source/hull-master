from __future__ import annotations

import json
import re
import urllib.error
import urllib.parse
import urllib.request
from difflib import SequenceMatcher
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ENV_FILE = ROOT / ".env.local"
AREA_JSON = ROOT / "public" / "area-common-defects.json"


def load_env() -> dict[str, str]:
    values: dict[str, str] = {}

    for line in ENV_FILE.read_text(encoding="utf-8").splitlines():
        if not line.strip() or line.strip().startswith("#") or "=" not in line:
            continue

        key, value = line.split("=", 1)
        values[key.strip()] = value.strip()

    return values


def normalize(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip()).lower()


def request_json(method: str, url: str, anon_key: str, payload: object | None = None) -> object:
    body = None if payload is None else json.dumps(payload).encode("utf-8")
    request = urllib.request.Request(url, data=body, method=method)
    request.add_header("apikey", anon_key)
    request.add_header("Authorization", f"Bearer {anon_key}")
    request.add_header("Content-Type", "application/json")
    request.add_header("Prefer", "return=representation")

    try:
        with urllib.request.urlopen(request, timeout=45) as response:
            text = response.read().decode("utf-8")
            return json.loads(text) if text else []
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"{method} {url} failed: {error.code} {detail}") from error


def build_discipline_lookup() -> dict[str, str]:
    area_data = json.loads(AREA_JSON.read_text(encoding="utf-8"))
    lookup: dict[str, str] = {}

    for defects in area_data.values():
        for defect in defects:
            text = str(defect.get("text", "")).strip()
            discipline = str(defect.get("discipline", "")).strip().upper()

            if text and discipline:
                lookup[normalize(text)] = discipline

    return lookup


def find_best_discipline(text: str, lookup: dict[str, str]) -> str:
    normalized = normalize(text)

    if normalized in lookup:
        return lookup[normalized]

    best_score = 0.0
    best_discipline = ""

    for candidate, discipline in lookup.items():
        score = SequenceMatcher(None, normalized, candidate).ratio()

        if score > best_score:
            best_score = score
            best_discipline = discipline

    return best_discipline if best_score >= 0.90 else ""


def main() -> None:
    env = load_env()
    supabase_url = env["NEXT_PUBLIC_SUPABASE_URL"].rstrip("/")
    anon_key = env["NEXT_PUBLIC_SUPABASE_ANON_KEY"]
    discipline_by_text = build_discipline_lookup()
    updated = 0
    examined = 0
    offset = 0
    page_size = 1000

    while True:
        select_query = urllib.parse.urlencode({
            "select": "id,text,discipline",
            "or": "(discipline.is.null,discipline.eq.)",
            "limit": str(page_size),
            "offset": str(offset),
        })
        defects = request_json("GET", f"{supabase_url}/rest/v1/defects?{select_query}", anon_key)

        if not defects:
            break

        for defect in defects:
            examined += 1
            discipline = find_best_discipline(defect.get("text", ""), discipline_by_text)

            if not discipline:
                continue

            patch_query = urllib.parse.urlencode({"id": f"eq.{defect['id']}"})
            request_json(
                "PATCH",
                f"{supabase_url}/rest/v1/defects?{patch_query}",
                anon_key,
                {"discipline": discipline},
            )
            updated += 1

        offset += page_size

    print(json.dumps({
        "blankDisciplinesExamined": examined,
        "disciplinesUpdated": updated,
    }, indent=2))


if __name__ == "__main__":
    main()
