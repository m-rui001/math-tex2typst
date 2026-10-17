import io
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

for pic in (
    r"\begin{tikzpicture}[rotate=90]\draw (0,0) rectangle (2,1);\end{tikzpicture}",
    r"\begin{tikzpicture}[rotate=45]\node at (1,1) {hi};\end{tikzpicture}",
    r"\begin{tikzpicture}[x={(0.866cm,0.5cm)}]\draw (0,0)--(1,0);\end{tikzpicture}",
    r"\begin{tikzpicture}[rotate=30]\draw (0,0) ellipse (2cm and 1cm);\end{tikzpicture}",
    r"\begin{tikzpicture}\draw[rotate=90] (0,0) rectangle (2,1);\end{tikzpicture}",
    r"\begin{tikzpicture}[rotate=45]\draw (0,0) arc (0:90:2);\end{tikzpicture}",
):
    print(repr(cetz.build(pic)))
    print()
