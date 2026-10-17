"""How big is a `to[out=,in=]` loop whose endpoints coincide, and is that loop the only blocker?

pdflatex draws the degenerate cases and pgf's own control points come out of the PDF, measured in cm
against the picture's own 1cm axis; then the refused picture rebuilds with the loop line removed, to
see whether the rest of it draws.
"""
import math
import re
import subprocess
import sys
from pathlib import Path

import pymupdf

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PT = 72.0 / 25.4
VARIANTS = [
    ("loop_l1", r"\draw (0,0) to[out=135,in=45] (0,0);"),
    ("loop_l5", r"\draw (0,0) to[out=135,in=45,looseness=5] (0,0);"),
    ("loop_l8", r"\draw (0,0) to[out=135,in=45,looseness=8] (0,0);"),
    ("loop_l20", r"\draw (0,0) to[out=135,in=45,looseness=20] (0,0);"),
    ("tiny_l1", r"\draw (0,0) to[out=135,in=45] (0.001,0);"),
    ("tiny_l5", r"\draw (0,0) to[out=135,in=45,looseness=5] (0.001,0);"),
]
TEMPLATE = ("\\documentclass[tikz]{standalone}\n\\begin{document}\n"
            "\\begin{tikzpicture}[x=1cm,y=1cm]\n%s\n\\end{tikzpicture}\n\\end{document}\n")

for label, body in VARIANTS:
    src = Path("_work/mz_%s.tex" % label)
    src.write_text(TEMPLATE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name],
                   cwd="_work", check=True, capture_output=True)
    page = pymupdf.open("_work/mz_%s.pdf" % label)[0]
    curves = []
    for d in page.get_drawings():
        for item in d["items"]:
            pts = [p for p in item[1:] if isinstance(p, pymupdf.Point)]
            if item[0] == "c" and len(pts) == 4:
                curves.append(pts)
    if not curves:
        print("%-9s no curve" % label)
        continue
    # standalone magnifies 1cm to 10cm, so divide the read cm by that factor
    a, c1, c2, b = [((p.x / PT / 10.0, -p.y / PT / 10.0)) for p in curves[0]]
    chord = math.hypot(b[0] - a[0], b[1] - a[1])
    r1 = math.hypot(c1[0] - a[0], c1[1] - a[1])
    r2 = math.hypot(c2[0] - b[0], c2[1] - b[1])
    ang1 = math.degrees(math.atan2(c1[1] - a[1], c1[0] - a[0]))
    ang2 = math.degrees(math.atan2(c2[1] - b[1], c2[0] - b[0]))
    print("%-9s chord=%.4f  out r=%.4f ang=%7.2f  in r=%.4f ang=%7.2f  start=(%.3f,%.3f)"
          % (label, chord, r1, ang1, r2, ang2, a[0], a[1]))

SRC = "_work/flat/Translative-covering-densities-of-order-n-log-n-September-23-2026.tex"
text = open(SRC, encoding="utf-8", errors="replace").read()
pic = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S)[1]
no_loop = pic.replace(r"\draw[edge,dashed] (six) to[out=135,in=45,looseness=5] (six);", "")
print("picture without the loop line ->",
      "emitted" if cetz.build(no_loop) else "still refuses")
