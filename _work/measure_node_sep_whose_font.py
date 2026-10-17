r"""Which font prices pgf's default `inner sep` -- the node's own or the one around it?

`_work/measure_node_vertical_ink.py` read the slack as .3333em of the document size at 10/11/12pt,
where the node's own font IS the document font and the two cannot be told apart. `font=\small`
separates them: pdflatex puts such a node's `P` at 13.2159pt, which is the 9pt ink (6.15pt, the
cmr9 capital) plus 6.666pt of slack -- .3333em of the *10pt document*, not of the 9pt the label is
set in. Read the same node at two sizes the document never uses to see whether the slack moves at
all, and price the anchor that needs no rule (inner sep written as 0pt) beside it so the ink alone
can be checked against the size.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-vertical-ink-who-sep")
os.makedirs(OUT, exist_ok=True)

# (name, node font command, the same font for the bare ink box)
CASES = [
    ("small", r"\small", r"{\small P}"),
    ("normalsize", r"\normalsize", "{P}"),
    ("large12", r"\large", r"{\large P}"),
    ("huge20", r"\fontsize{20}{24}\selectfont", r"{\fontsize{20}{24}\selectfont P}"),
    ("tiny5", r"\tiny", r"{\tiny P}"),
]

TEMPLATE = r"""\documentclass[10pt]{article}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\newdimen\measHT
\newdimen\measDP
\makeatletter
\newcommand\report[4]{%
  \setbox0\hbox{#4}%
  \measHT=\ht0 \measDP=\dp0 %
  \pgfextracty{\dimen6}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{north}}}%
  \pgfextracty{\dimen8}{\pgfpointdiff{\pgfpointanchor{#1}{south}}{\pgfpointanchor{#1}{center}}}%
  \pgfextracty{\dimen10}{\pgfpointdiff{\pgfpointanchor{#2}{center}}{\pgfpointanchor{#2}{north}}}%
  \pgfextracty{\dimen12}{\pgfpointdiff{\pgfpointanchor{#2}{south}}{\pgfpointanchor{#2}{center}}}%
  \typeout{GOT #3 INKHT=\the\measHT INKDP=\the\measDP ZN=\the\dimen10 ZS=\the\dimen12 N=\the\dimen6 S=\the\dimen8}}
\makeatletter
\begin{document}
@BODY@
\end{document}
"""

body = []
for i, (name, font, ink) in enumerate(CASES):
    body.append(r"""\begin{tikzpicture}
  \node[font=%s] (a%d) at (0,0) {P};
  \node[font=%s,inner sep=0pt] (z%d) at (5,0) {P};
  \report{a%d}{z%d}{%d}{%s}
\end{tikzpicture}""" % (font, i, font, i, i, i, i, ink))
open(os.path.join(OUT, "who-sep.tex"), "w", encoding="utf-8").write(
    TEMPLATE.replace("@BODY@", "\n".join(body)))
subprocess.run(["pdflatex", "-interaction=nonstopmode", "who-sep.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "who-sep.log"), encoding="utf-8", errors="replace").read()
print("%-12s %8s %8s %8s | %8s %8s" % ("case", "ink", "zero", "total", "slack", "slack/em"))
for i, ht, dp, zn, zs, n, s in re.findall(
        r"GOT (\d+) INKHT=([\d.]+)pt ?INKDP=([\d.]+)pt ?ZN=([\d.]+)pt ?ZS=([\d.]+)pt ?"
        r"N=([\d.]+)pt ?S=([\d.]+)pt", log):
    i = int(i)
    ink, zero, total = float(ht) + float(dp), float(zn) + float(zs), float(n) + float(s)
    print("%-12s %8.4f %8.4f %8.4f | %8.4f %8.4f"
          % (CASES[i][0], ink, zero, total, (total - zero) / 2.0, (total - zero) / 2.0 / 10.0))
