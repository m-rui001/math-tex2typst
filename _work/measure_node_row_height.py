r"""Rows to height: does the last row of a node's label count?

The shapes probe above read one row and two rows as the same height, which means either pgf drops a
row the author left unterminated (a node's label ends `{...}` with no trailing `\\`) or the height
model is not `one line + (n-1) leading`. Measures the corpus shape -- `text width=5.7cm`,
`inner sep=8pt`, `font=\small` -- at one, two, three and four rows, each with and without a
trailing break, so the two spellings can be told apart by the numbers they return.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "sizecheck")
os.makedirs(OUT, exist_ok=True)
sys.stdout.reconfigure(errors="replace")

ROWS = []
for rows in (1, 2, 3, 4):
    for trail in ("cut", "brk"):
        body = "\\\\"
        label = body.join(["aaa"] * rows) + (body if trail == "brk" else "")
        ROWS.append(r"\measure{r%d%s}{\node[draw, text width=5.7cm, align=left, inner sep=8pt, "
                    r"font=\fontsize{9}{11}\selectfont] (a) at (0,0) {%s};}"
                    % (rows, trail, label))
# and the same with the first break carrying its own gap, which is what a corpus flowchart writes:
# `\\[3pt]` between two paragraphs of the label. The engine has to answer the leading plus the gap.
for rows in (2, 6):
    body = "\\\\"
    label = "aaa" + body + "[3pt]aaa" + body + body.join(["aaa"] * (rows - 2))
    ROWS.append(r"\measure{g%d}{\node[draw, text width=5.7cm, align=left, inner sep=8pt, "
                r"font=\fontsize{9}{11}\selectfont] (a) at (0,0) {%s};}" % (rows, label))

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\newcommand{\measure}[2]{%
  \begin{tikzpicture}
    #2
    \pgfextracty{\dimen0}{\pgfpointanchor{a}{north}}%
    \pgfextracty{\dimen1}{\pgfpointanchor{a}{south}}%
    \pgfextractx{\dimen2}{\pgfpointanchor{a}{east}}%
    \typeout{RH #1 H=\the\dimen0\the\dimen1\space W=\the\dimen2}%
  \end{tikzpicture}%
}
\begin{document}
%(ROWS)s
x
\end{document}
"""
tex = os.path.join(OUT, "rowheight.tex")
open(tex, "w", encoding="utf-8").write(DOC.replace("%(ROWS)s", "\n".join(ROWS)))
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               capture_output=True)
log = open(os.path.join(OUT, "rowheight.log"), encoding="utf-8", errors="replace").read()
got = {}
for m in re.finditer(r"RH (\S+?) H=(-?[\d.]+)pt(-?[\d.]+)pt\s*W=(-?[\d.]+)pt",
                     log.replace("\n", " ")):
    got[m.group(1)] = (float(m.group(2)) - float(m.group(3)), float(m.group(4)))
print("%-10s %9s %9s %9s   %s" % ("rows", "cut", "brk", "delta", "per row"))
prev = {}
for rows in (1, 2, 3, 4):
    cut, brk = got.get("r%dcut" % rows), got.get("r%dbrk" % rows)
    print("%-10s %9s %9s %9s" % (rows, cut and "%.4f" % cut[0], brk and "%.4f" % brk[0],
                                 "n/a" if None in (cut, brk) else "%.4f" % (brk[0] - cut[0])))
    prev[rows] = cut
print()
print("leading between row counts (cut): %s"
      % ["%.4f" % (prev[i][0] - prev[i - 1][0]) for i in (2, 3, 4) if prev[i] and prev[i - 1]])
print("widths (cut): %s" % ["%.4f" % prev[i][1] for i in (1, 2, 3, 4) if prev[i]])
for rows in (2, 6):
    gap = got.get("g%d" % rows)
    plain = prev.get(rows)
    print("g%d: %s  vs %d rows with a plain first break: %s  -> gap adds %s"
          % (rows, "n/a" if gap is None else "%.4f" % gap[0], rows,
             "n/a" if plain is None else "%.4f" % plain[0],
             "n/a" if None in (gap, plain) else "%.4f" % (gap[0] - plain[0])))
