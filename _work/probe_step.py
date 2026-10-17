"""Measure how TikZ reads a bare grid step: axis units, cm, or points?

pdflatex renders two pictures with x=y=0.5cm, one step=1 and one step=1cm; PyMuPDF
reads the line positions back out of the PDF, so the spacing tells us the unit.
"""
import pathlib
import subprocess
import tempfile

import pymupdf

TEX = r"""
\documentclass[tikz,border=4pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=.5cm,y=.5cm]
  \draw[step=1,blue] (0,0) grid (4,4);
\end{tikzpicture}
\end{document}
"""

TEX2 = r"""
\documentclass[tikz,border=4pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=.5cm,y=.5cm]
  \draw[step=1cm,red] (0,0) grid (4,4);
\end{tikzpicture}
\end{document}
"""


def run(tex, tmp, tag):
    src = pathlib.Path(tmp) / (tag + ".tex")
    src.write_text(tex, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", str(tmp), str(src)],
                   capture_output=True)
    pdf = pathlib.Path(tmp) / (tag + ".pdf")
    if not pdf.exists():
        return None
    doc = pymupdf.open(str(pdf))
    xs, ys = set(), set()
    for d in doc[0].get_drawings():
        if d["rect"].width < 0.01:
            xs.add(round(d["rect"].x0, 2))
        elif d["rect"].height < 0.01:
            ys.add(round(d["rect"].y0, 2))
        else:
            for it in d["items"]:
                if it[0] == "l":
                    a, b = it[1], it[2]
                    if abs(a.x - b.x) < 0.01:
                        xs.add(round(a.x, 2))
                    if abs(a.y - b.y) < 0.01:
                        ys.add(round(a.y, 2))
    doc.close()
    return sorted(xs), sorted(ys)


def gaps(vals):
    return sorted(set(round(b - a, 3) for a, b in zip(vals, vals[1:])))


with tempfile.TemporaryDirectory() as tmp:
    for tag, tex in (("bare", TEX), ("cm", TEX2)):
        got = run(tex, tmp, tag)
        if got is None:
            print("%s: pdflatex produced no pdf" % tag)
            continue
        xs, ys = got
        print("%s step: %d vertical lines, x gaps %s pt | %d horizontal, y gaps %s pt"
              % (tag, len(xs), gaps(xs)[:4], len(ys), gaps(ys)[:4]))
    print("reference: 1cm = %.2f pt, 0.5cm = %.2f pt" % (28.3465, 14.173))
