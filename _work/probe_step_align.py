"""Where does TikZ put the grid lines when the corner is not on a step multiple?

A canvas-origin aligned grid would start part of a step after the corner; a
corner-aligned grid puts the first line exactly on the corner. pdflatex decides.
"""
import pathlib
import subprocess
import tempfile

import pymupdf

TEX = r"""
\documentclass[tikz,border=0pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
  \draw[step=1cm,blue] (0.3,0.2) grid (4,4);
\end{tikzpicture}
\end{document}
"""

CM = 28.3465

with tempfile.TemporaryDirectory() as tmp:
    src = pathlib.Path(tmp) / "g.tex"
    src.write_text(TEX, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", str(tmp), str(src)],
                   capture_output=True)
    doc = pymupdf.open(str(pathlib.Path(tmp) / "g.pdf"))
    xs, ys = set(), set()
    for d in doc[0].get_drawings():
        for it in d["items"]:
            if it[0] == "l":
                a, b = it[1], it[2]
                if abs(a.x - b.x) < 0.01:
                    xs.add(a.x)
                if abs(a.y - b.y) < 0.01:
                    ys.add(a.y)
    doc.close()
    rx, ry = sorted(xs), sorted(ys)
    # the pdf page is the picture box with border 0, so the left edge is x=0.3cm
    print("first line %.4f cm, gaps %s, last %.4f cm" %
          (rx[0] / CM, [round((b - a) / CM, 3) for a, b in zip(rx, rx[1:])], rx[-1] / CM))
    print("first hline %.4f cm, gaps %s, last %.4f cm" %
          (ry[0] / CM, [round((b - a) / CM, 3) for a, b in zip(ry, ry[1:])], ry[-1] / CM))
