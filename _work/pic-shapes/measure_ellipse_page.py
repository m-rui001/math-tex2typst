r"""The page geometry of the ellipse the capacity picture draws inside its turned scope.

`\draw[...] (0,0) ellipse (1.00 and .37)` sits in `\begin{scope}[shift={(.12,.20)},rotate=25]`, so
the question is what the reader actually sees: an ellipse with which centre, which semi-axes, and
tilted by how much? pgf draws an ellipse as four arcs whose junctions are the two vertices of each
axis, so the four curve endpoints of the compiled PDF hand the answer back directly. The same reading
is taken with the scope's `rotate=25` removed, and that unturned control is what calibrates the
method: it must come out as exactly 1.00cm by 0.37cm standing on the picture's own 1cm axes.
"""
import math
import subprocess
import sys
from pathlib import Path

import pymupdf

HERE = Path(__file__).resolve().parent
PT = 72.0 / 25.4  # a centimetre, in PDF points

TEMPLATE = ("""\\documentclass[tikz]{standalone}
\\begin{document}
\\begin{tikzpicture}[x=1cm,y=1cm,%%
  capacityellipse/.style={draw=blue,fill=blue!8,thick}]
%s
\\end{tikzpicture}
\\end{document}
""")

CASES = [
    ("unturned", r"\draw[capacityellipse] (0,0) ellipse (1.00 and .37);"),
    ("turned 25", r"\begin{scope}[shift={(.12,.20)},rotate=25]"
                  r"\draw[capacityellipse] (0,0) ellipse (1.00 and .37);\end{scope}"),
    ("third ellipse, turned", r"\begin{scope}[shift={(8.57,.21)},rotate=25]"
                             r"\draw[capacityellipse] (0,0) ellipse (.50 and .185);\end{scope}"),
]

for label, body in CASES:
    src = HERE / ("mel_%s.tex" % label.replace(" ", "_").replace(",", ""))
    src.write_text(TEMPLATE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name], cwd=str(HERE),
                   capture_output=True, timeout=180)
    page = pymupdf.open(str(HERE / (src.stem + ".pdf")))[0]
    curves = []
    for d in page.get_drawings():
        for item in d["items"]:
            pts = [p for p in item[1:] if isinstance(p, pymupdf.Point)]
            if item[0] == "c" and len(pts) == 4:
                curves.append(pts)
    if not curves:
        print("%-22s no curve" % label)
        continue
    # the page's own origin: standalone centres the picture, so read the drawing's own bbox
    xs = [p.x for c in curves for p in c]
    ys = [p.y for c in curves for p in c]
    x0, y0 = min(xs), min(ys)
    pts = [((p.x - x0) / PT, -(p.y - y0) / PT) for c in curves for p in (c[0], c[3])]
    seen, verts = [], []
    for x, y in pts:
        if not any(abs(x - sx) < 1e-3 and abs(y - sy) < 1e-3 for sx, sy in seen):
            seen.append((x, y))
            verts.append((x, y))
    cx = sum(v[0] for v in verts) / len(verts)
    cy = sum(v[1] for v in verts) / len(verts)
    offs = [(v[0] - cx, v[1] - cy) for v in verts]
    lens = sorted({round(math.hypot(*o), 4) for o in offs})
    long_axis = max(offs, key=lambda o: math.hypot(*o))
    tilt = math.degrees(math.atan2(long_axis[1], long_axis[0])) % 180
    print("%-22s %d arcs, centre=(%.4f, %.4f)  semi-axes=%s  long axis at %.2f deg"
          % (label, len(curves), cx, cy, lens, tilt))
