r"""Measure with pdflatex what a node label of the shape `{A\\\(t\in[2,5]\)\\\(v'=0\)}` sets.

`NODE_MATH` keeps a `(` whose backslash follows another backslash out of the maths path, on the
reading that the second backslash belongs to the line break and the pair is prose.  TeX's own page
is the only referee: if the label shows the element-of sign and an italic `t`, the delimiters were
maths and the lookbehind is a misreading that costs 23 papers their 64 labels.
"""
import io
import os
import subprocess
import sys

import pymupdf

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
FOLDER = r"E:\math\_work\pic-break-math"
os.makedirs(FOLDER, exist_ok=True)
TEX = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\pagestyle{empty}
\begin{document}
\begin{tikzpicture}[node distance=3cm]
\node[draw,text width=3cm,font=\small,align=center] (reset)
  {Reset\\\(t\in[2,5]\)\\\(v'_\ell=0\)};
\end{tikzpicture}
\end{document}
"""
path = os.path.join(FOLDER, "measure.tex")
open(path, "w", encoding="utf-8").write(TEX)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", FOLDER, path],
               capture_output=True, text=True)
pdf = os.path.join(FOLDER, "measure.pdf")
if not os.path.exists(pdf):
    print("no pdf -- pdflatex did not run")
    sys.exit(1)
doc = pymupdf.open(pdf)
print("PAGE TEXT:", " | ".join(" ".join(p.get_text().split()) for p in doc))
for page in doc:
    for words in page.get_text("words"):
        print("   %-14s x0=%.1f y0=%.1f" % (words[4], words[0], words[1]))
doc.close()
