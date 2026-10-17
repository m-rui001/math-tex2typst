"""Read PGF's default 3D-to-page projection off the page, in cm.

The first measurement said a unit step in z moves the ink about 0.385 cm sideways and 0.385 cm up --
that is PGF's documented default `view = (1cm, 0.385cm)`, not the zero I expected. Here nine dots
are placed at the basis points and their centres give the axis images exactly, so a faithful
emission becomes arithmetic instead of guesswork.
"""
import os
import subprocess

import pymupdf

CM = 28.346
POINTS = [(0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1),
          (1, 1, 0), (1, 0, 1), (0, 1, 1), (2, 0, 0), (0, 0, 2)]

BODY = "\n".join(r"\fill (%d,%d,%d) circle (2pt);" % p for p in POINTS)
TEX = r"""
\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
%s
\end{tikzpicture}
\end{document}
""" % BODY

OUT = "_work/measure_3dproj"
os.makedirs(OUT, exist_ok=True)
tex = OUT + "/t.tex"
open(tex, "w", encoding="utf-8").write(TEX)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
doc = pymupdf.open(OUT + "/t.pdf")
page = doc[0]
got = []
for d in page.get_drawings():
    c = d["rect"]
    got.append(((c.x0 + c.x1) / 2.0 / CM, (c.y0 + c.y1) / 2.0 / CM))
got.sort(key=lambda t: (t[0], t[1]))
print("page cm:", round(page.rect.width / CM, 4), round(page.rect.height / CM, 4))
for x, y in got:
    print("  dot  x=%8.4f  y=%8.4f   (page y down: %8.4f)" % (x, y, -y))
doc.close()
