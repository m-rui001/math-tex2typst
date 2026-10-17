r"""The statement the Critical-bond picture refused, checked against real TeX.

`\draw[->] (qf label.west)--(2.38,0.00)--(qf representative)` mixes three things at once: a name
with a space, an anchor on a node placed with `anchor=west`, and a coordinate defined in the outer
3D scope but referenced from inside a nested `[x=1cm,y=1cm]` one. The canvas is compared with the
same picture compiled by pdflatex, both measured from the scope origin dot, so the numbers answer
the same question.

Usage: python _work/pic-3d/verify_qf.py
"""
import io
import os
import re
import subprocess
import sys

import pymupdf

ROOT = r"E:\math\_work\pic-3d"
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

from t2t import cetz  # noqa: E402

CM = 28.346
OUT = os.path.join(ROOT, "measure")
os.makedirs(OUT, exist_ok=True)

PIC = r"""\begin{tikzpicture}[
  x={(1.10cm,-0.55cm)},
  y={(-1.10cm,-0.55cm)},
  z={(0cm,1.18cm)},
  font=\small]
  \coordinate (qf representative) at (1,0.48,0.56);
  \begin{scope}[x=1cm,y=1cm]
    \fill[black] (0,0) circle (1pt);
    \node[anchor=west] (qf label) at (2.70,0.00) {$F_{1,+}^{+,+}$};
    \draw[red,->,line width=0.45pt] (qf label.west)--(2.38,0.00)--(qf representative);
    \draw[green,line width=0.45pt] (qf label.west)--(2.38,0.00)--(qf representative);
    \fill[blue] (2.38,0) circle (1pt);
  \end{scope}
\end{tikzpicture}"""

DOC = r"""\documentclass[tikz]{standalone}
\begin{document}
%s
\end{document}
"""

tex = os.path.join(OUT, "qf_arrow.tex")
open(tex, "w", encoding="utf-8").write(DOC % PIC)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
doc = pymupdf.open(os.path.join(OUT, "qf_arrow.pdf"))
page = doc[0]
h = page.rect.height
origin = dot = None
red, green = [], []
for d in page.get_drawings():
    rgb = tuple(round(v, 2) for v in (d.get("fill") or d.get("color") or ()))
    r = d["rect"]
    centre = ((r.x0 + r.x1) / 2.0 / CM, -(r.y0 + r.y1) / 2.0 / CM)
    if rgb == (0.0, 0.0, 0.0):
        origin = centre
    elif rgb == (0.0, 0.0, 1.0):
        dot = centre
    elif rgb in ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0)):
        bucket = red if rgb[0] else green
        for item in d["items"]:
            if item[0] == "l":
                bucket.append(((item[1].x / CM, -(item[1].y) / CM),
                               (item[2].x / CM, -(item[2].y) / CM)))
doc.close()
print("measured: origin dot %s, blue (2.38,0) dot %s" % (origin, dot))
print("measured red polyline (with `->`), relative to the scope origin:")
for a, b in red:
    print("   (%7.4f,%7.4f) -> (%7.4f,%7.4f)" % (a[0] - origin[0], a[1] - origin[1],
                                                 b[0] - origin[0], b[1] - origin[1]))
print("measured green polyline (no arrow head), relative to the scope origin:")
for a, b in green:
    print("   (%7.4f,%7.4f) -> (%7.4f,%7.4f)" % (a[0] - origin[0], a[1] - origin[1],
                                                 b[0] - origin[0], b[1] - origin[1]))
print("measured blue dot from origin: (%7.4f,%7.4f)" % (dot[0] - origin[0], dot[1] - origin[1]))

canvas = cetz.build(PIC)
print("--- canvas ---")
for line in canvas.splitlines():
    print("   " + line)
