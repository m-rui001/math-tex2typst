"""A self-loop written between two node endpoints: where does pgf put its curve?

`(six) to[out=135,in=45,looseness=5] (six)` names the same node twice, and a node has a border, so
unlike the bare-coordinate case the chord is not zero. Rendered by pdflatex with a `circle` node of
`minimum size=8mm`, and pgf's own points read out of the PDF in the picture's cm (standalone
magnifies 1cm to 10cm). The node center is the origin of the reported numbers.
"""
import math
import subprocess
from pathlib import Path

import pymupdf

PT = 72.0 / 25.4
VARIANTS = [
    ("node_l5", r"\node[circle,draw,minimum size=8mm] (s) at (0,0) {6};"
                r"\draw (s) to[out=135,in=45,looseness=5] (s);"),
    ("node_l1", r"\node[circle,draw,minimum size=8mm] (s) at (0,0) {6};"
                r"\draw (s) to[out=135,in=45] (s);"),
    ("node_loop_above", r"\node[circle,draw,minimum size=8mm] (s) at (0,0) {6};"
                        r"\draw (s) edge[loop above] (s);"),
    ("rect_l5", r"\node[draw,minimum size=8mm] (s) at (0,0) {6};"
                r"\draw (s) to[out=135,in=45,looseness=5] (s);"),
]
TEMPLATE = ("\\documentclass[tikz]{standalone}\n\\usepackage{tikz}\n\\begin{document}\n"
            "\\begin{tikzpicture}[x=1cm,y=1cm,every node/.style={}]\n%s\n\\end{tikzpicture}\n"
            "\\end{document}\n")

for label, body in VARIANTS:
    src = Path("_work/mn_%s.tex" % label)
    src.write_text(TEMPLATE % body, encoding="utf-8")
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name],
                       cwd="_work", capture_output=True, encoding="utf-8", errors="replace")
    page = pymupdf.open("_work/mn_%s.pdf" % label)[0]
    curves, circles = [], []
    for d in page.get_drawings():
        for item in d["items"]:
            pts = [p for p in item[1:] if isinstance(p, pymupdf.Point)]
            if item[0] == "c" and len(pts) == 4:
                curves.append(pts)
    print("%-15s rc=%d curves=%d" % (label, r.returncode, len(curves)))
    for pts in curves:
        a, c1, c2, b = [(p.x / PT / 10.0, -p.y / PT / 10.0) for p in pts]
        chord = math.hypot(b[0] - a[0], b[1] - a[1])
        print("      a=(%.3f,%.3f) c1=(%.3f,%.3f) c2=(%.3f,%.3f) b=(%.3f,%.3f) chord=%.3f"
              % (a + c1 + c2 + b + (chord,)))
