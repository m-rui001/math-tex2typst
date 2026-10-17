r"""The canvas the grown-label test asserts on, printed so the expectation is a read number.

The Turn-Based flowchart's `up` box holds a label the author broke into six rows with two `\\[3pt]`
gaps; `persist` hangs 6mm under it. pdflatex reads that label as
`2*inner sep + line + (rows-1) leading + gaps` = 78.275pt at \\small, so the neighbour's centre has
to sit one half-height of `up`, the written 6mm, and one half-height of its own below `up`'s centre.
"""
import io
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

PIC = (r"\begin{tikzpicture}[font=\small,"
       r"stage/.style={draw=black!60,text width=5.7cm,align=left,inner sep=8pt}]"
       r"\node[stage] (up) at (0,0) {one\\[3pt]two\\three\\four\\five\\six};"
       r"\node[below=6mm of up] (p) {P};"
       r"\node[stage, below=6mm of p] (q) {one\\two};"
       r"\end{tikzpicture}")
built = cetz.build(PIC)
print(built if built is None else "\n".join(built.splitlines()[2:]))
