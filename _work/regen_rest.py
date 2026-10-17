r"""Finish the interrupted font run: convert only the papers not yet regenerated.

The full batch was cut off after ~383 papers. This walks the same manifest and converts only the
entries whose `main.typ` is older than the cutoff, so the whole corpus ends up regenerated without
redoing the finished ones.
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

CUTOFF = float(sys.argv[1]) if len(sys.argv) > 1 else 0.0


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
    manifest = json.loads((ROOT / "_work/manifest.json").read_text(encoding="utf-8"))
    items = []
    for e in manifest:
        if not e.get("entry"):
            continue
        name = e["paper"]
        typ = ROOT / "typst" / name / "main.typ"
        if typ.exists() and typ.stat().st_mtime >= CUTOFF:
            continue
        items.append((name, ROOT / "_work/flat" / (name + ".tex")))
    print("regenerating %d papers" % len(items), flush=True)
    reports = []
    start = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(8, os.cpu_count() or 4)) as pool:
        for report in pool.map(run, items):
            reports.append(report)
            if len(reports) % 20 == 0:
                print("%d/%d compiled=%d elapsed=%.0fs"
                      % (len(reports), len(items),
                         sum(r.get("compile_ok", False) for r in reports),
                         time.time() - start), flush=True)
    print("DONE %d compiled=%d" % (len(reports),
                                   sum(r.get("compile_ok", False) for r in reports)), flush=True)


if __name__ == "__main__":
    main()
