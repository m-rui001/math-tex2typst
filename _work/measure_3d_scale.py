"""Does a 3D coordinate scale each axis on its own before the default projection is applied?

The first census gave the images of the unit axes under the defaults: ux=(1.385,0.385),
uy=(0.385,1.385), uz=(0.385,0.385) cm, i.e. page = (X + k*s, Y + k*s) with s = X+Y+Z and k=0.385.
That is only one picture's worth of evidence, and the corpus writes `[x=1.3cm,y=1.3cm]` next to 3D
points, so the question is whether k belongs to the *projection* (Z scales by its own axis length
and k never moves) or to the axes. Draw the basis under x=2cm,y=1cm and read the columns.
"""
import os
import subprocess

import pymupdf

CM = 28.346
POINTS = [(1, 0, 0), (0, 1, 0), (0, 0, 1), (1, 1, 1), (0, 0, 2)]

BODY = "\n".join(r"\fill (%d,%d,%d) circle (2pt);" % p for p in POINTS)
HEAD = r"""\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}[%s]
%s
\end{tikzpicture}
\end{document}
"""

OUT = "_work/measure_3dscale"
os.makedirs(OUT, exist_ok=True)
for tag, axes in (("default", "x=1cm,y=1cm"), ("x2y1", "x=2cm,y=1cm"), ("z3", "x=1cm,y=1cm,z=3cm")):
    tex = "%s/%s.tex" % (OUT, tag)
    open(tex, "w", encoding="utf-8").write(HEAD % (axes, BODY))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    doc = pymupdf.open("%s/%s.pdf" % (OUT, tag))
    page = doc[0]
    h = page.rect.height / CM
    dots = sorted(((r[0] + r[1]) / 2.0 / CM for r in
                   [(d["rect"].x0, d["rect"].x1) for d in page.get_drawings()]))
    got = []
    for d in page.get_drawings():
        c = d["rect"]
        got.append((round(c.x0 / CM, 4), round((h - (c.y0 + c.y1) / 2.0) / CM, 4)))
    got.sort()
    print("%-8s page %.4f x %.4f cm" % (tag, page.rect.width / CM, h))
    for (x, y), p in zip(got, POINTS):
        print("     %-12s -> x=%8.4f  y=%8.4f" % (str(p), x, y))
    doc.close()
