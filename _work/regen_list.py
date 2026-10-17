r"""Regenerate only the papers a change actually touches, from a name list.

`regen_rest.py` re-runs every paper whose `main.typ` is older than a cutoff; that is the right tool
after a change that reaches all of them. A change to how one construct is drawn (the #26 path
clipping) only moves the papers that carry that construct, and `_work/probe_regen_needed.py` writes
their names to `_work/regen_needed.txt` -- this driver walks that list.
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
    names = [l.strip() for l in (ROOT / "_work/regen_needed.txt").read_text(
        encoding="utf-8").splitlines() if l.strip()]
    items = [(n, ROOT / "_work/flat" / (n + ".tex")) for n in names]
    items = [(n, s) for n, s in items if s.exists()]
    print("regenerating %d papers" % len(items), flush=True)
    reports = []
    start = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=min(12, os.cpu_count() or 4)) as pool:
        for report in pool.map(run, items):
            reports.append(report)
            if len(reports) % 10 == 0:
                print("%d/%d compiled=%d elapsed=%.0fs"
                      % (len(reports), len(items),
                         sum(r.get("compile_ok", False) for r in reports),
                         time.time() - start), flush=True)
    print("DONE %d compiled=%d" % (len(reports),
                                   sum(r.get("compile_ok", False) for r in reports)), flush=True)


if __name__ == "__main__":
    main()
