"""Convert one paper exactly as tools/batch_typst.py does, and report its residue.

Usage: python _work/one_paper.py <paper-name>
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import convert_paper

name = sys.argv[1]
out = ROOT / "typst" / name
out.mkdir(parents=True, exist_ok=True)
report = convert_paper(str(ROOT / "_work/flat" / (name + ".tex")), str(out), name)
(out / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
print("ok", report.get("ok"), "compile_ok", report.get("compile_ok"),
      "tables", report.get("tables"), "stage", report.get("stage"), "error", str(report.get("error"))[:160])

typ = (out / "main.typ").read_text(encoding="utf-8", errors="replace")
bad = [ln for ln in typ.splitlines() if "#raw(" not in ln and re.search(r"\\[A-Za-z@]+", ln)]
print("residue lines:", len(bad))
for ln in bad[:3]:
    print("  ", ln[:200])
