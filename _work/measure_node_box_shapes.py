r"""A node's own text box at the three shapes and two paddings, read from the engine.

`_work/measure_node_row_height.py` confirmed the law for a node written with `text width`:
`2*inner sep + line + (rows-1) * leading`. A bare `\node (n) {N}` is set as an \hbox rather than a
paragraph, and the engine read it 13.899pt tall where the paragraph law gives 10.35pt, so the two
shapes do not share a line height. Measures bare, `align=` and `text width=` at `inner sep=0pt`
and `inner sep=8pt`, one to three rows, at normalsize and \small, so the padding rule and the
per-shape line height both come out of numbers instead of out of an assumption.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "sizecheck")
os.makedirs(OUT, exist_ok=True)
sys.stdout.reconfigure(errors="replace")

SIZES = {"normalsize": (10.0, 12.0), "small": (9.0, 11.0)}
SHAPES = {"bare": "", "align": "align=center", "width": "text width=5.7cm,align=left"}
BREAK = "\\\\"

ROWS = []
for font in SIZES:
    for shape in SHAPES:
        for sep in (0, 8):
            for rows in (1, 2, 3):
                ROWS.append(r"\measure{%s}{%s}{%s}{%s}{%s}{%s,%s,%d,%d}"
                            % (SIZES[font][0], SIZES[font][1], SHAPES[shape], sep,
                               BREAK.join(["aaa"] * rows), font, shape, sep, rows))

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\newcommand{\measure}[6]{%
  \begin{tikzpicture}
    \node[draw, font=\fontsize{#1}{#2}\selectfont, #3, inner sep=#4pt] (a) at (0,0) {#5};
    \pgfextracty{\dimen0}{\pgfpointanchor{a}{north}}%
    \pgfextracty{\dimen1}{\pgfpointanchor{a}{south}}%
    \typeout{SH #6 H=\the\dimen0\the\dimen1}%
  \end{tikzpicture}%
}
\begin{document}
%(ROWS)s
x
\end{document}
"""
tex = os.path.join(OUT, "nodeshapes.tex")
open(tex, "w", encoding="utf-8").write(DOC.replace("%(ROWS)s", "\n".join(ROWS)))
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               capture_output=True)
log = open(os.path.join(OUT, "nodeshapes.log"), encoding="utf-8", errors="replace").read()
got = {}
for m in re.finditer(r"SH ([\w,]+) H=(-?[\d.]+)pt(-?[\d.]+)pt", log.replace("\n", " ")):
    got[m.group(1)] = float(m.group(2)) - float(m.group(3))
print("%-16s %7s %7s %7s | %7s %7s %7s   %s" % ("shape", "s0/1r", "s0/2r", "s0/3r",
                                                "s8/1r", "s8/2r", "s8/3r", "per row, pad"))
for font in SIZES:
    for shape in SHAPES:
        d0 = [got.get("%s,%s,0,%d" % (font, shape, r)) for r in (1, 2, 3)]
        d8 = [got.get("%s,%s,8,%d" % (font, shape, r)) for r in (1, 2, 3)]
        row = ["%.3f" % v if v is not None else "  -  " for v in d0 + d8]
        steps = ["%.3f" % (d8[i] - d8[i - 1]) for i in (1, 2)] if None not in d8 else ["?", "?"]
        pad = "%.3f" % (d8[0] - d0[0]) if None not in (d8[0], d0[0]) else "?"
        print("%-16s %7s %7s %7s | %7s %7s %7s   +%s +%s  2sep=%s"
              % (font + " " + shape, *row, steps[0], steps[1], pad))
