r"""#89 control leg: the SLE corridor statement, pgf's own page next to ours.

The statement is `line width=12pt` with `rounded corners=12pt` inside a `scale=.88` scope, so the pen is
as wide as the corner's radius and any mistake in either shows up as a bite out of the band. This draws
just that stroke with pdflatex (the paper's `circuitblue` replaced by `blue!12`, the rest verbatim) and
crops it at 300 dpi next to `_work/rounded117_0.png`.
"""
import os
import subprocess
import sys
import tempfile

import fitz

PATH = ("(3,.6)--(3,2.4)--(2.4,3.15)--(-2.4,3.15)--(-3.15,2.4)"
        "--(-3.15,-2.4)--(-2.4,-3.15)--(2.4,-3.15)--(2.55,-2.25)--(2.55,0)--(3.55,0)")

SRC = r"""\documentclass[10pt]{article}
\usepackage[margin=20mm]{geometry}
\usepackage{tikz}
\usetikzlibrary{arrows.meta}
\begin{document}
\pagestyle{empty}
\begin{tikzpicture}[x=1cm,y=1cm,font=\small,
  line cap=round,line join=round,>=Latex]
\path[use as bounding box] (-.25,-.15) rectangle (14.6,10.1);
\begin{scope}[shift={(3.35,6.2)},scale=.88]
  \draw[blue!12,line width=12pt,rounded corners=12pt] %s;
\end{scope}
\end{tikzpicture}
\end{document}
""" % PATH

tmp = tempfile.mkdtemp(prefix="m89c_")
tex = os.path.join(tmp, "control.tex")
open(tex, "w", encoding="utf-8").write(SRC)
proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                       "-output-directory", tmp, "control.tex"],
                      cwd=tmp, capture_output=True, text=True)
pdf = os.path.join(tmp, "control.pdf")
if not os.path.exists(pdf):
    print(proc.stdout[-2500:])
    sys.exit(1)
doc = fitz.open(pdf)
page = doc[0]
box = page.get_drawings()[0]["rect"]
clip = fitz.Rect(box.x0 - 8, box.y0 - 8, box.x1 + 8, box.y1 + 8)
out = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work",
                   "rounded89c_sle_control.png")
page.get_pixmap(dpi=300, clip=clip).save(out)
print("rect=%.0fx%.0fpt  -> %s" % (clip.width, clip.height, out))
print("tmp=%s" % tmp)
