r"""What the emitter answers for a scope shift under a scale and under a rotate (test expectations)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "scope under scale": r"\begin{tikzpicture}[scale=1.45]\begin{scope}[xshift=-1.7cm]"
                         r"\node at (0,0) {t};\end{scope}\end{tikzpicture}",
    "scope under rotate": r"\begin{tikzpicture}[rotate=90]\begin{scope}[xshift=1cm]"
                          r"\node at (0,0) {t};\end{scope}\end{tikzpicture}",
    "scope under axis": r"\begin{tikzpicture}[x=2cm,y=2cm]\begin{scope}[xshift=1cm]"
                        r"\node at (0,0) {t};\end{scope}\end{tikzpicture}",
    "scope shift before scale": r"\begin{tikzpicture}\begin{scope}[xshift=1.7cm,scale=2]"
                               r"\node at (0,0) {t};\end{scope}\end{tikzpicture}",
    "scope scale before shift": r"\begin{tikzpicture}\begin{scope}[scale=2,xshift=1.7cm]"
                               r"\node at (0,0) {t};\end{scope}\end{tikzpicture}",
    "picture head scale then shift": r"\begin{tikzpicture}[scale=2,xshift=1cm]"
                                     r"\node at (0,0) {t};\end{tikzpicture}",
    "picture head shift then scale": r"\begin{tikzpicture}[xshift=1cm,scale=2]"
                                     r"\node at (0,0) {t};\end{tikzpicture}",
    "node under scale": r"\begin{tikzpicture}[scale=2]\node[xshift=1cm] at (0,0) {t};"
                        r"\end{tikzpicture}",
    "coordinate offset under scale": r"\begin{tikzpicture}[scale=2]\draw (0,0) -- ([yshift=1cm]0,1);"
                                     r"\end{tikzpicture}",
}

for name, pic in CASES.items():
    print("%-32s %s" % (name, (cetz.build(pic) or "REFUSED").replace("\n", " ")[:150]))
