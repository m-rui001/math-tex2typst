r"""pgf's clamping law for `rounded corners` on a too-small rectangle, read edge by edge.

A 2cm x 1cm rectangle with radius r leaves straight pieces of 2cm-2r along the long edges and
1cm-2r along the short ones, so the lengths of the lines that survive say exactly what pgf does when
r no longer fits -- it cannot be read off a corner distance, because a clamped arc sits on top of the
corner it was supposed to leave.  CeTz's `rect(radius:)` is measured the same way for comparison.
"""
import math
import os
import subprocess
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))

PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}
\draw[rounded corners=%s] (0,0) rectangle (2,1);
\end{tikzpicture}
\end{document}
"""

CETZ = r"""#import "@preview/cetz:0.5.0"
#set page(width: 80mm, height: 60mm, margin: 10mm)
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  rect((0, 0), (2, 1), radius: %s, stroke: (thickness: 0.4pt))
})
"""

RADII = ["4pt", "8pt", "12pt", "14pt", "16pt", "20pt", "24pt", "30pt"]


def run(dirpath, name, source, engine):
    path = os.path.join(dirpath, name)
    suffix = ".tex" if engine == "pdflatex" else ".typ"
    open(path + suffix, "w", encoding="utf-8").write(source)
    pdf = path + ".pdf"
    if os.path.exists(pdf):
        os.remove(pdf)
    args = ([engine, "-interaction=nonstopmode", os.path.basename(path) + suffix]
            if engine == "pdflatex" else [engine, "compile", path + suffix, pdf])
    for _ in range(2 if engine == "pdflatex" else 1):
        subprocess.run(args, cwd=dirpath, capture_output=True)
    return pdf if os.path.exists(pdf) else None


def edges(pdf):
    doc = fitz.open(pdf)
    items = [it for d in doc[0].get_drawings() for it in d["items"]]
    doc.close()
    lens = sorted(round(math.hypot(it[2].x - it[1].x, it[2].y - it[1].y), 3)
                  for it in items if it[0] == "l")
    curves = sum(1 for it in items if it[0] == "c")
    return lens, curves


def main():
    tmp = os.path.join(HERE, "_rc")
    os.makedirs(tmp, exist_ok=True)
    print("rect = 2cm x 1cm  (long edge 56.693bp, short 28.346bp; 1 TeX pt = 0.99651bp)")
    for r in RADII:
        out = "r=%-6s" % r
        pgf = run(tmp, "p_" + r.replace("pt", ""), PGF % r, "pdflatex")
        out += "  pgf lines=%s curves=%d" % edges(pgf) if pgf else "  pgf: no pdf"
        c = run(tmp, "c_" + r.replace("pt", ""), CETZ % r, "typst")
        out += ("  cetz lines=%s curves=%d" % edges(c)) if c else "  cetz: no pdf"
        print(out)


if __name__ == "__main__":
    main()
