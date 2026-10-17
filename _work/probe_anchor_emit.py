"""What does a node's own side of the point come out as?

`above` on an in-path label and `anchor=north west` on a standalone node are the two spellings the
corpus uses; both have to reach CeTz's `anchor:` argument, and only where the point is unambiguous.
"""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

CASES = {
    "in-path above": r"\begin{tikzpicture}\draw (0,0) -- node[above] {mid} (4,0);"
                     r"\end{tikzpicture}",
    "in-path below": r"\begin{tikzpicture}\draw (0,0) -- node[below] {under} (4,0);"
                     r"\end{tikzpicture}",
    "node anchor=": r"\begin{tikzpicture}\node[anchor=north west] at (1,1) {t};"
                    r"\end{tikzpicture}",
    "node above": r"\begin{tikzpicture}\node[above] at (1,1) {t};\end{tikzpicture}",
    "framed node": r"\begin{tikzpicture}\node[draw,above] at (1,1) {t};\end{tikzpicture}",
    "sized node": r"\begin{tikzpicture}\node[draw,minimum width=2cm,anchor=north west]"
                  r" at (1,1) {t};\end{tikzpicture}",
}
for name, pic in CASES.items():
    got = cetz.build(pic)
    line = next((ln.strip() for ln in (got or "").splitlines() if "content(" in ln), "-none-")
    print("%-14s %s" % (name, line[:110]))
