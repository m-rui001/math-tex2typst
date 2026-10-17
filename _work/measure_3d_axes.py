"""Does TikZ's default z axis contribute anything to the page?

Three corpus pictures refuse on a 3D coordinate (`\fill (1,-1,-1)--(1,1,-1)--...`). TikZ's axes
default to x=(1cm,0), y=(0,1cm), z=(0,0,1cm), and with no 3d canvas the third vector has no page
direction, so a 3D coordinate should land exactly where its first two components say. Draw the same
rectangle twice, once with z=0 and once with z=+-1, and measure the ink boxes: if they coincide the
faithful reading is to project through the axis and drop nothing but the unreadable part.
"""
import os
import re
import subprocess
import sys

import pymupdf

TEMPLATE = r"""
\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
%s
\end{tikzpicture}
\end{document}
"""

BODY = (r"\fill[black!40] (1,-1,0)--(1,1,0)--(1,1,1)--(1,-1,1)--cycle;"
        r"\fill[red!40] (1,-1,0)--(1,1,0)--(1,1,-1)--(1,-1,-1)--cycle;"
        r"\fill[blue!40] (2,-2)--(2,2)--(3,2)--(3,-2)--cycle;")

OUT = "_work/measure_3d"
os.makedirs(OUT, exist_ok=True)
tex = OUT + "/t.tex"
with open(tex, "w", encoding="utf-8") as f:
    f.write(TEMPLATE % BODY)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
pdf = OUT + "/t.pdf"
doc = pymupdf.open(pdf)
page = doc[0]
print("page size pt:", [round(v, 3) for v in page.rect])
for d in page.get_drawings():
    box = d["rect"]
    ink = [(round(k, 3) for k in (box.x0, box.y0, box.x1, box.y1))
           for k in ()] or [round(box.x0, 3), round(box.y0, 3), round(box.x1, 3), round(box.y1, 3)]
    print("path fill=%s bbox=%s items=%d" % (d.get("fill"), ink, len(d["items"])))
doc.close()
