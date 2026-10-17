r"""#91's every-path smoke: the picture's `every path` weight lands, and what still outranks it.

The oracle says which way round the precedence goes (`_work/measure91_every_path.py`); this only asks
whether the emitter answers the same numbers on the canvas, for the corpus's own spelling
(`every path/.style={line width=.6pt}` on the picture's brackets).
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz

CASES = [
    ("every path 2pt, plain path",
     "[every path/.style={line width=2pt}]", "\\draw (0,0)--(2,0);", 2.0),
    ("every path 2pt, head writes 1pt",
     "[every path/.style={line width=2pt}, line width=1pt]", "\\draw (0,0)--(2,0);", 2.0),
    ("every path 2pt, statement writes 0.4pt",
     "[every path/.style={line width=2pt}]", "\\draw[line width=0.4pt] (0,0)--(2,0);", 0.4),
    ("every path 2pt, statement writes thin",
     "[every path/.style={line width=2pt}]", "\\draw[thin] (0,0)--(2,0);", 0.4),
    ("every path 2pt, invoked style 0.8pt",
     "[every path/.style={line width=2pt}, my/.style={line width=0.8pt}]", "\\draw[my] (0,0)--(2,0);",
     0.8),
    ("every path ultra thick, plain path",
     "[every path/.style={ultra thick}]", "\\draw (0,0)--(2,0);", 1.6),
    ("every path 2pt, node frame",
     "[every path/.style={line width=2pt}]", "\\node[draw] at (1,1) {X};", 2.0),
    ("every path 2pt with a head cap",
     "[every path/.style={line width=2pt}, line cap=round]", "\\draw (0,0)--(2,0);", 2.0),
    ("no every path, head 1pt still the default",
     "[line width=1pt]", "\\draw (0,0)--(2,0);", 1.0),
]

for label, head, stmt, want in CASES:
    canvas = cetz.build("\\begin{tikzpicture}" + head + stmt + "\\end{tikzpicture}")
    if canvas is None:
        print("   %-42s  REFUSED" % label)
        continue
    got = re.findall(r"thickness: ([0-9.]+)pt", canvas)
    caps = re.findall(r'cap: "(\w+)"', canvas)
    print("   %-42s  want=%-4s thickness=%-22s cap=%s"
          % (label, want, ",".join(got), ",".join(caps) or "-"))
