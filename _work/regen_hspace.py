r"""Regenerate the papers the `\hspace` length fix touches (the 242 of probe87e).

Same driver as `_work/regen_list.py`, but the name list is computed from the flat sources with
the same maths-span scanner `probe87e_hspace_changeface.py` uses, so it cannot go stale. Runs the
real `typst compile` (this IS the batch the board registration covers).

  python _work/regen_hspace.py
"""
import concurrent.futures
import glob
import io
import json
import os
import re
import pathlib
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "_work"))
sys.path.insert(0, str(ROOT / "tools"))
import probe87_math_spans as B  # noqa: E402
from t2t.convert import convert_paper  # noqa: E402

RX = (r"\\;", r"\\enspace(?![A-Za-z])", r"\\hspace\s*\{[^{}]*\}")


def names():
    out = []
    for path in sorted(glob.glob(str(ROOT / "_work" / "flat" / "*.tex"))):
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        maths = "".join(text[a:b] for a, b in B.spans(text))
        if any(re.search(rx, maths) for rx in RX):
            out.append(stem)
    return out


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
    if len(sys.argv) > 1:
        # a name list (the scanner-missed delta from probe87f), one per line
        listed = [l.strip() for l in io.open(sys.argv[1], encoding="utf-8").read().splitlines()
                  if l.strip()]
    else:
        listed = names()
    items = [(n, ROOT / "_work" / "flat" / (n + ".tex")) for n in listed]
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
            print("  FAIL", r["paper"][:60],
                  str(r.get("compile_err_full", r.get("error", "")))[:200])


if __name__ == "__main__":
    main()
