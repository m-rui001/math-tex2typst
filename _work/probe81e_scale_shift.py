r"""Does a picture's `scale=` multiply a scope's `xshift=`?

The census found two captions colliding in a picture written
`[scale=1.45]` + `scope[xshift=-1.7cm]`; our canvas puts the scopes 3.4cm apart (the shift read as an
absolute length, the coordinates inside scaled). PGF's own answer is what the emitter must match, so
measure it: three stroked rectangles, one per scope, and read their left edges off the PDF.

  python _work/probe81e_scale_shift.py            # scale=1.45, xshift=+-1.7cm
  python _work/probe81e_scale_shift.py axis       # the same with x=1.45cm,y=1.45cm instead of scale=

Prints the offsets in cm from the unshifted rect.
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
CM = 28.452756

HEAD = r"""\documentclass[tikz,border=2pt]{standalone}
\usepackage{tikz}
\begin{document}
"""
TAIL = r"""
\end{document}
"""

BODY = r"""\begin{tikzpicture}[%s]
 \begin{scope}[xshift=-1.7cm] \draw (0,0) rectangle (0.2,0.2) node[below,anchor=north west] {LEFTCAPTION}; \end{scope}
 \begin{scope}[xshift=1.7cm]  \draw (0,0) rectangle (0.2,0.2) node[below,anchor=north west] {RIGHTCAPTION}; \end{scope}
 \draw (0,0) rectangle (0.2,0.2);
\end{tikzpicture}"""


def offsets(tex, name):
    d = tempfile.mkdtemp(prefix="m81e_")
    path = os.path.join(d, "c.tex")
    open(path, "w", encoding="utf-8").write(HEAD + tex + TAIL)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", d, "c.tex"],
                       capture_output=True, cwd=d)
    pdf = os.path.join(d, "c.pdf")
    if r.returncode or not os.path.exists(pdf):
        print("FATAL pdflatex refused:\n%s" % (r.stdout.decode("utf-8", "replace")[-1500:],))
        return None
    doc = fitz.open(pdf)
    page = doc[0]
    origins = sorted((round(dg["rect"].x0, 2), round(dg["rect"].y0, 2))
                     for dg in page.get_drawings()
                     if dg.get("color") is not None and 3 < dg["rect"].width < 20)
    words = [w for w in page.get_text("words")]
    doc.close()
    if len(origins) < 3:
        print("FATAL read %d rects, expected 3" % len(origins))
        return None
    x0 = min(o[0] for o in origins)
    y0 = min(o[1] for o in origins)
    print("%-6s rect origins in cm from the top-left: %s"
          % (name, [("+%.3f" % ((x - x0) / CM), "+%.3f" % ((y - y0) / CM))
                    for x, y in origins]))
    print("       words: %s" % [(w[4], round(w[0] - x0, 1), round(w[3] - w[1], 2)) for w in words])
    return origins


def main():
    offsets(BODY % "scale=1.45", "scale")
    offsets(BODY % "x=1.45cm,y=1.45cm", "axis")
    offsets(BODY % "scale=1.45,transform shape", "tshape")
    offsets(BODY % "rotate=90", "rot90")
    offsets(BODY % "scale=0.8,rotate=90", "both")
    print("\nwritten 3.4cm apart in our canvas; if the two edges are +-2.465cm here, `scale` eats the shift")
    print("rot90: a shift that pgf carries through the matrix lands on the y axis, not the x one")


if __name__ == "__main__":
    main()
