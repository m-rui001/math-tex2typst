r"""Rebuild typst/batch-report.json from the per-paper report.json files.

The interrupted batch left the aggregate at 460 entries while every paper's own report.json is
fresh. This re-collects them in manifest order (then any extra folders), matching the shape the
batch driver publishes.
"""
import glob
import json
import os
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]


def main():
    sys.stdout.reconfigure(errors="replace")
    manifest = json.loads((ROOT / "_work/manifest.json").read_text(encoding="utf-8"))
    reports, seen = [], set()
    for e in manifest:
        if not e.get("entry"):
            continue
        name = e["paper"]
        path = ROOT / "typst" / name / "report.json"
        if path.exists():
            reports.append(json.loads(path.read_text(encoding="utf-8")))
            seen.add(name)
    for path in sorted(glob.glob(str(ROOT / "typst" / "*" / "report.json"))):
        name = os.path.basename(os.path.dirname(path))
        if name in seen:
            continue
        reports.append(json.loads(open(path, encoding="utf-8").read()))
        seen.add(name)
    tmp = ROOT / "typst" / "batch-report.tmp"
    tmp.write_text(json.dumps(reports, ensure_ascii=False, indent=2), encoding="utf-8")
    tmp.replace(ROOT / "typst" / "batch-report.json")
    print("reports %d compiled %d"
          % (len(reports), sum(1 for r in reports if r.get("compile_ok"))))


if __name__ == "__main__":
    main()
