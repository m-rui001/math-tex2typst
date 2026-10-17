import io
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

CASES = (
    (r"\begin{tikzpicture}[rotate=90]\draw (-1,-1) grid (1,1);\end{tikzpicture}",
     "a turned lattice"),
    (r"\begin{tikzpicture}\draw (0,0) grid (2,2);\end{tikzpicture}",
     "the same lattice unturned"),
    (r"\begin{tikzpicture}[xstep=.5]\draw (0,0) grid (1,1);\end{tikzpicture}",
     "a bare step counts the axis' own units"),
    (r"\begin{tikzpicture}\node[xshift=1cm] at (0,0) {t};\end{tikzpicture}",
     "a node's own xshift moves its placement"),
    (r"\begin{tikzpicture}\node[yshift=2cm] at (1,1) {t};\end{tikzpicture}",
     "and yshift"),
    (r"\begin{tikzpicture}\draw (0,0) node[xshift=1cm] {t};\end{tikzpicture}",
     "an in-path node too"),
    (r"\begin{tikzpicture}\node[xshift=1foo] at (0,0) {t};\end{tikzpicture}",
     "an unreadable shift refuses"),
    (r"\begin{tikzpicture}[rotate=90]\node[xshift=1cm] at (0,0) {t};\end{tikzpicture}",
     "a scope shift stays absolute"),
)
for pic, why in CASES:
    print("%-42s %s" % (why, cetz.build(pic)))
