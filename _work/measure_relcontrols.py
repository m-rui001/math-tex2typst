r"""Where does TikZ put a control point written `+(dx,dy)` after `.. controls ..`?

Two things decide the parser: which endpoint the offset belongs to (the first control to the start,
the second to the end), and whether it is read in the picture's own axes or as an absolute page
length. The figure sets `x=1cm, y=2cm` and draws a black reference segment `(0,0)--(3,0)` whose length
fixes the scale, so a user-unit `+1` shows as 28.35pt along x and 56.69pt along y while an absolute one
would show the same on both. Raw tuples are printed, with no rel arithmetic, because the first version
of this probe argued itself in circles over pymupdf's item order.
"""
import subprocess

import pymupdf

TEX = r'''\documentclass[tikz,border=2pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=2cm]
  \draw[black] (0,0) -- (3,0);
  \draw[red]   (4,0) .. controls +(1,1) and +(1,1) .. (7,0);
  \draw[blue]  (0,3) .. controls +(1,1) and +(-1,-1) .. (3,3);
  \draw[green] (4,3) .. controls +(2pt,3pt) and +(0cm,0.5cm) .. (7,3);
\end{tikzpicture}
\end{document}
'''
open("_work/measure_relcontrols.tex", "w", encoding="utf-8").write(TEX)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory=_work",
                "_work/measure_relcontrols.tex"], capture_output=True)
page = pymupdf.open("_work/measure_relcontrols.pdf")[0]
for d in page.get_drawings():
    col = d.get("color")
    if not col:
        continue
    name = ("black" if max(col) < 0.2 else "red" if col[0] > 0.5
            else "blue" if col[2] > 0.5 else "green")
    for it in d["items"]:
        print("%-6s %s %s" % (name, it[0], ["(%.3g, %.3g)" % (p.x, p.y) for p in it[1:]]))
