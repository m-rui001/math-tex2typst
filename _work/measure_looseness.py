"""Does `looseness` multiply the tangent length, and does it touch `bend` too?

One picture per spelling, rendered by pdflatex, with pgf's own bezier control points read back out
of the PDF -- the same method that gave the 0.39 factor in measure_tangent_table.py.
"""
import math
import subprocess
from pathlib import Path

import pymupdf

PT = 72.0 / 25.4
VARIANTS = [
    ("l1_out135_in45", r"\draw (0,0) to[out=135,in=45] (2,0);"),
    ("l2_out135_in45", r"\draw (0,0) to[out=135,in=45,looseness=2] (2,0);"),
    ("l5_out135_in45", r"\draw (0,0) to[out=135,in=45,looseness=5] (2,0);"),
    ("l05_out135_in45", r"\draw (0,0) to[out=135,in=45,looseness=0.5] (2,0);"),
    ("bend45_l1", r"\draw (0,0) to[bend left=45] (2,0);"),
    ("bend45_l5", r"\draw (0,0) to[bend left=45,looseness=5] (2,0);"),
    ("l5_out135_only", r"\draw (0,0) to[out=135,looseness=5] (2,0);"),
]
TEMPLATE = ("\\documentclass[tikz]{standalone}\n\\begin{document}\n"
            "\\begin{tikzpicture}[x=1cm,y=1cm]\n%s\n\\end{tikzpicture}\n\\end{document}\n")

for label, body in VARIANTS:
    src = Path("_work/ml_%s.tex" % label)
    src.write_text(TEMPLATE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name],
                   cwd="_work", check=True, capture_output=True)
    page = pymupdf.open("_work/ml_%s.pdf" % label)[0]
    curves = []
    for d in page.get_drawings():
        for item in d["items"]:
            pts = [p for p in item[1:] if isinstance(p, pymupdf.Point)]
            if item[0] == "c" and len(pts) == 4:
                curves.append(pts)
    if not curves:
        print("%-16s no curve item" % label)
        continue
    a, c1, c2, b = curves[0]
    ax, ay = a.x / PT, -a.y / PT
    bx, by = b.x / PT, -b.y / PT
    chord = math.hypot(bx - ax, by - ay)
    print("%-16s chord=%.3f" % (label, chord), end="")
    for name, at, ctrl in (("out", (ax, ay), (c1.x / PT, -c1.y / PT)),
                           ("in", (bx, by), (c2.x / PT, -c2.y / PT))):
        dx, dy = ctrl[0] - at[0], ctrl[1] - at[1]
        print("  %s r=%.4f ang=%7.2f"
              % (name, math.hypot(dx, dy) / chord, math.degrees(math.atan2(dy, dx))), end="")
    print("  pts=%s" % [(round(p.x / PT, 3), round(-p.y / PT, 3)) for p in curves[0]])
