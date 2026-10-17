r"""#91 smoke: the four spellings of a pen, read back off the canvas `build` emits."""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz

CASES = [
    ("default silence", r"\begin{tikzpicture}\draw (0,0)--(2,1);\end{tikzpicture}"),
    ("statement length", r"\begin{tikzpicture}\draw[line width=2pt] (0,0)--(2,1);\end{tikzpicture}"),
    ("statement thick", r"\begin{tikzpicture}\draw[thick] (0,0)--(2,1);\end{tikzpicture}"),
    ("statement very thick", r"\begin{tikzpicture}\draw[very thick] (0,0)--(2,1);\end{tikzpicture}"),
    ("statement ultra thin", r"\begin{tikzpicture}\draw[ultra thin] (0,0)--(2,1);\end{tikzpicture}"),
    ("head length", r"\begin{tikzpicture}[line width=2pt]\draw (0,0)--(2,1);\end{tikzpicture}"),
    ("head very thick", r"\begin{tikzpicture}[very thick]\draw (0,0)--(2,1);\end{tikzpicture}"),
    ("head thick, node frame",
     r"\begin{tikzpicture}[thick]\node[draw] (a) at (1,1) {X};\end{tikzpicture}"),
    ("head length overruled by statement",
     r"\begin{tikzpicture}[line width=2pt]\draw[thin] (0,0)--(2,1);\end{tikzpicture}"),
    ("head thin (the no-op name)",
     r"\begin{tikzpicture}[thin]\draw (0,0)--(2,1);\end{tikzpicture}"),
    ("style carries a name",
     r"\begin{tikzpicture}[pen/.style={very thick}]\draw[pen] (0,0)--(2,1);\end{tikzpicture}"),
    ("mm length", r"\begin{tikzpicture}\draw[line width=0.8mm] (0,0)--(2,1);\end{tikzpicture}"),
]
for name, pic in CASES:
    got = cetz.build(pic)
    th = re.findall(r"thickness: ([0-9.]+)pt", got or "")
    caps = re.findall(r'cap: "([a-z]+)"', got or "")
    print("%-34s %-10s stroke parts: %s" % (name, got is None and "REFUSED" or ",".join(th),
                                            sorted(set(caps)) or "-"))
