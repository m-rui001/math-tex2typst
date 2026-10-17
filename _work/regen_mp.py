r"""Regenerate the 20 papers the side-by-side minipage fix touches.

Same as `_work/regen_list.py` but reads `_work/mp_face_names.txt` so it does not clobber the
shared `_work/regen_needed.txt`.
"""
import concurrent.futures
import json
import os
import pathlib
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper  # noqa: E402


def run(item):
    name, source = item
    out = ROOT / "typst" / name
    out.mkdir(parents=True, exist_ok=True)
    try:
        report = convert_paper(str(source), str(out), name)
    except Exception as exc:  # noqa: BLE001
        report = {"paper": name, "ok": False, "compile_ok": False, "error": repr(exc)}
    report["source"] = str(source)
    (out / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2),
                                     encoding="utf-8")
    return report


def main():
    sys.stdout.reconfigure(errors="replace")
    names = [l.strip() for l in (ROOT / "_work/mp_face_names.txt").read_text(
        encoding="utf-8").splitlines() if l.strip()]
    items = [(n, ROOT / "_work/flat" / (n + ".tex")) for n in names]
    items = [(n, s) for n, s in items if s.exists()]
    print("regenerating %d papers" % len(items), flush=True)
    reports = []
    start = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(12, os.cpu_count() or 4)) as pool:
        for report in pool.map(run, items):
            reports.append(report)
    print("DONE %d compiled=%d elapsed=%.0fs" % (
        len(reports), sum(r.get("compile_ok", False) for r in reports), time.time() - start),
        flush=True)
    for r in reports:
        if not r.get("compile_ok"):
            print("  FAIL", r["paper"][:60], str(r.get("compile_err_full", r.get("error", "")))[:200])


if __name__ == "__main__":
    main()
