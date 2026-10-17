r"""How tall is a TikZ node that TikZ sizes from its own text?

A node with `text width` and n lines has a frame whose height TeX computes from the typeset text;
the converter needs that number to place anything `below=... of` the node. Measured here from the
engine itself: for 1..6 lines at each TeX size name, the north and south anchors of a node centred at
the picture origin, so (N - S) is the frame's height in bp and N/S say how far it reaches each way.

Also prints `\f@baselineskip` for the size names, the candidate leading.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "sizecheck")
os.makedirs(OUT, exist_ok=True)
sys.stdout.reconfigure(errors="replace")

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\makeatletter
\AtBeginDocument{%BASELINES%}
\newcommand{\measure}[2]{%
  \begin{tikzpicture}[font=#1]
    \node[draw, text width=5.7cm, align=left, inner sep=8pt] (a) at (0,0) {#2};
    \pgfextracty{\dimen0}{\pgfpointanchor{a}{north}}%
    \pgfextracty{\dimen1}{\pgfpointanchor{a}{south}}%
    \typeout{H #1 lines=\number\value{lines} N=\the\dimen0\space S=\the\dimen1\space D=\the\dimexpr\dimen0-\dimen1\relax}%
  \end{tikzpicture}%
}
\newcount\lines \lines=0
\begin{document}
\lines=1 \measure{\small}{one}
\lines=2 \measure{\small}{one\\two}
\lines=3 \measure{\small}{one\\two\\three}
\lines=4 \measure{\small}{one\\two\\three\\four}
\lines=6 \measure{\small}{one\\two\\three\\four\\five\\six}
\lines=1 \measure{\footnotesize}{one}
\lines=3 \measure{\footnotesize}{one\\two\\three}
\lines=2 \measure{\normalsize}{one\\two}
\lines=3 \measure{\normalsize}{one\\two\\three}
\lines=2 \measure{\scriptsize}{one\\two}
x
\end{document}
"""
BASELINES = "\n".join(
    r"{\%s\typeout{BL %s = \the\f@baselineskip\space (size \f@size pt)}}" % (n, n)
    for n in ["tiny", "scriptsize", "footnotesize", "small", "normalsize", "large"])
tex = os.path.join(OUT, "nodeheight.tex")
open(tex, "w", encoding="utf-8").write(DOC.replace("%BASELINES%", BASELINES))
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               capture_output=True)
log = open(os.path.join(OUT, "nodeheight.log"), encoding="utf-8", errors="replace").read()
for line in log.splitlines():
    if line.startswith("BL ") or line.startswith("H "):
        print(line)
