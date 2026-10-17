"""Which stage of cetz.convert refuses a tikzcd that reached the emitter as a formula?

The flat source of these diagrams converts fine when cut straight from the .tex, so the
string pandoc hands back must differ from the one we measured. This probe reads that exact
string: pandoc runs again on the .tex the last batch left in _work/flat/_work_tex, the Math
nodes are collected the same way convert_paper collects them, and each picture-shaped one is
walked through convert's stages.

Usage: python _work/probe_cd_string.py [papers]
"""
import json
import os
import pathlib
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz, convert as conv

limit = int(sys.argv[1]) if len(sys.argv) > 1 else 3

rows = []
for path in sorted((ROOT / "typst").glob("*/report.json")):
    try:
        rep = json.loads(path.read_text(encoding="utf-8", errors="replace"))
    except (ValueError, OSError):
        continue
    stats = rep.get("stats") or {}
    held = stats.get("math_unconverted")
    if held:
        rows.append((held, rep.get("paper") or path.parent.name))
rows.sort(reverse=True)
print("papers holding formulas: %d, total %d" % (len(rows), sum(n for n, _ in rows)))

work = ROOT / "_work" / "flat" / "_work_tex"
out_dir = ROOT / "_work" / "cd_string"
out_dir.mkdir(parents=True, exist_ok=True)
stage_hits = {}
shown = 0
for held, name in rows:
    if shown >= limit:
        break
    tex = work / (name + ".tex")
    if not tex.exists():
        print("  no pandoc source kept for", name)
        continue
    shown += 1
    json_path = out_dir / (name + ".json")
    subprocess.run([os.environ.get("PANDOC", "pandoc"),
                    str(tex), "-f", "latex", "-t", "json", "-o", str(json_path)],
                   capture_output=True, text=True, encoding="utf-8", timeout=900)
    ast = json.loads(json_path.read_text(encoding="utf-8"))
    formulas = conv.formula_list(ast)
    pics = [f for f in formulas if cetz.PICTURE.search(f)]
    print("\n== %s: %d formulas, %d picture-shaped, batch held %d"
          % (name, len(formulas), len(pics), held))
    for src in pics:
        core = cetz.MATH_ENVELOPE.sub("", src)
        canvas = cetz.build(core)
        stage = "build ok" if canvas else None
        if canvas is None:
            cd = cetz.build_cd(core)
            if cd is None:
                stage = "build_cd None"
            elif not cetz.sane(cd):
                stage = "insane"
            elif not cetz.compiles(cd):
                stage = "no compile"
            else:
                stage = "build_cd ok"
        elif not cetz.sane(canvas):
            stage = "insane"
        elif not cetz.compiles(canvas):
            stage = "no compile"
        stage_hits[stage] = stage_hits.get(stage, 0) + 1
        if stage != "build ok" and stage != "build_cd ok":
            print("   [%s] %r" % (stage, src[:260]))
print("\nstages:", stage_hits)
