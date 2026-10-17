"""Which option of an in-path node the parser cannot read.

The remaining `midway` refusal is `\path (a) -- (b) node[midway,below=13mm,result] (n) {text}`.
Each option is dropped in turn against a two-box picture, so the failing one is named
instead of guessed at.
"""
import os
import sys

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

HEAD = (r"\node[draw] (prediction) at (0,0) {A}; \node[draw] (alignment) at (4,0) {B}; ")
TAIL = r"\path (prediction.south) -- (alignment.south) node[%s] (deduction) {text};"
CASES = [
    "midway",
    "midway,below=13mm",
    "midway,result",
    "below=13mm",
    "result",
    "midway,below=13mm,draw",
]

for opts in CASES:
    pic = r"\begin{tikzpicture}[result/.style={draw,rounded corners}]" + HEAD + (TAIL % opts) + r"\end{tikzpicture}"
    got = cetz.build(pic)
    where = ""
    if got:
        drawn = [l.strip() for l in got.split("\n") if "content" in l or "line(" in l]
        where = " | " + " ; ".join(drawn)[:150]
    print("%-28s -> %s%s" % (opts, "OK" if got else "REFUSED", where))
