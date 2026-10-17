"""Measure pgf's own bezier control points, one picture per PDF, per spelling.

`tangent_factor.log` came from three curves on one page and one of its readings contradicted the
fallback the emitter assumes, so each spelling now renders alone and both control offsets are
printed in TikZ space (x right, y up) as distance/chord and angle.
"""
import math
import subprocess
from pathlib import Path

import pymupdf

PT = 72.0 / 25.4
VARIANTS = [
    ("out90_in180", r"\draw (0,0) to[out=90,in=180] (2,0);"),
    ("out30", r"\draw (0,0) to[out=30] (2,0);"),
    ("in30", r"\draw (0,0) to[in=30] (2,0);"),
    ("out0", r"\draw (0,0) to[out=0] (2,0);"),
    ("out45_in135", r"\draw (0,0) to[out=45,in=135] (2,0);"),
    ("bend_left_90", r"\draw (0,0) to[bend left=90] (2,0);"),
    ("plain", r"\draw (0,0) to (2,0);"),
]
TEMPLATE = ("\\documentclass[tikz]{standalone}\n\\begin{document}\n"
            "\\begin{tikzpicture}[x=1cm,y=1cm]\n%s\n\\end{tikzpicture}\n\\end{document}\n")

for label, body in VARIANTS:
    src = Path("_work/mt_%s.tex" % label)
    src.write_text(TEMPLATE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name],
                   cwd="_work", check=True, capture_output=True)
    page = pymupdf.open("_work/mt_%s.pdf" % label)[0]
    curves = []
    for d in page.get_drawings():
        for item in d["items"]:
            pts = [p for p in item[1:] if isinstance(p, pymupdf.Point)]
            if item[0] == "c" and len(pts) == 4:
                curves.append(pts)
    if not curves:
        print("%-12s no curve item (straight)" % label)
        continue
    a, c1, c2, b = curves[0]
    ax, ay = a.x / PT, -a.y / PT
    bx, by = b.x / PT, -b.y / PT
    chord = math.hypot(bx - ax, by - ay)
    print("%-12s chord=%.3f" % (label, chord), end="")
    for name, at, ctrl in (("out", (ax, ay), (c1.x / PT, -c1.y / PT)),
                           ("in", (bx, by), (c2.x / PT, -c2.y / PT))):
        dx, dy = ctrl[0] - at[0], ctrl[1] - at[1]
        print("  %s r=%.4f ang=%7.2f"
              % (name, math.hypot(dx, dy) / chord, math.degrees(math.atan2(dy, dx))), end="")
    print("  pts=%s" % [(round(p.x / PT, 3), round(-p.y / PT, 3)) for p in curves[0]])
