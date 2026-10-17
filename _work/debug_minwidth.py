import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
from t2t import cetz  # noqa: E402

sys.stdout.reconfigure(errors="replace")

SRC = (r"\begin{tikzpicture}\node[draw, minimum width=2cm,"
       r" minimum height=1cm] at (0,0) {A\\B};"
       r"\end{tikzpicture}")
canvas = cetz.build(SRC)
print(repr(canvas))
print("sane:", cetz.sane(canvas) if canvas else None)
print("convert:", bool(cetz.convert(SRC)))
