r"""The depth of the roman letters our ink table has to price: `f`, `j`, `i`, no maths.

`_work/measure_node_vertical_ink.py` read whole labels, so a word like `typical` gives only the sum
of its tallest and deepest mark; the sum was enough to found the law but not to say WHICH letter
paid the depth. `_work/node_glyph_heights.txt` measured single glyphs, but in MATH italic, where `f`
stands 0.694 over 0.194 -- and the same `f` in a prose label like `five` costs the engine nothing
below the baseline (the six-row label at \small stands 13.3159pt, exactly the 0.694em of its `h` or
`f`). A node's anchors give only the SUM of height and depth, so read the box TeX sets for each
letter: `\ht\box0` is the mark above the baseline and `\dp\box0` the one below it.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-vertical-ink-roman")
os.makedirs(OUT, exist_ok=True)

LETTERS = list("abcdefghijklmnopqrstuvwxyz") + ["A", "R", "T", "'", "`", "-", "!", "?", "."]

TEMPLATE = r"""\documentclass[10pt]{article}
\begin{document}
\makeatletter
\newcommand\ink[2]{\setbox0\hbox{#2}\typeout{LET #1 HT=\the\ht0 DP=\the\dp0}}
\makeatother
@BODY@
\end{document}
"""

body = "\n".join(r"\ink{%d}{%s}" % (i, ch) for i, ch in enumerate(LETTERS))
open(os.path.join(OUT, "roman.tex"), "w", encoding="utf-8").write(TEMPLATE.replace("@BODY@", body))
subprocess.run(["pdflatex", "-interaction=nonstopmode", "roman.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "roman.log"), encoding="utf-8", errors="replace").read()
print("%-4s %8s %8s %8s" % ("ch", "top/em", "deep/em", "ink/em"))
for ch, n, s in re.findall(r"LET (\d+) HT=([\d.]+)pt ?DP=([\d.]+)pt", log):
    top, deep = float(n), float(s)
    print("%-4s %8.4f %8.4f %8.4f" % (LETTERS[int(ch)], top / 10.0, deep / 10.0, (top + deep) / 10.0))
