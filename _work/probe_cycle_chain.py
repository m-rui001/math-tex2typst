"""Does a closed polygon chain build on its own?

The three refused pictures all die on a `--cycle` chain, so each chain is replayed here
inside a minimal picture: if it builds alone, the refusal belongs to the context around it.
"""
import os
import sys

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

CASES = [
    (r"\fill[black!4] (a0)--(a1)--(a2)--(a3)--cycle;", ["a0", "a1", "a2", "a3"]),
    (r"\fill[black!3] (1,-1,-1)--(1,1,-1)--(1,1,1)--(1,-1,1)--cycle;", []),
    (r"\fill[gray!8] (-1.4,-1,1)--(1.4,-1,1)--(1.4,1.3,1)--(-1.4,1.3,1)--cycle;", []),
    (r"\fill[black!14] (0,0)--(2,0)--(2,1)--cycle;", []),
]

for stmt, coords in CASES:
    for z in (False, True):
        pre = "".join(r"\coordinate (%s) at (%s, %s, 0);" % (c, i * 0.7, i) for i, c in enumerate(coords))
        head = r"[scale=0.95, x={(1cm,0cm)},y={(0.35cm,0.35cm)},z={(0cm,1cm)}]" if z else "[scale=0.95]"
        pic = r"\begin{tikzpicture}" + head + pre + stmt + r"\end{tikzpicture}"
        got = cetz.build(pic)
        print("%s z=%s -> %s" % (stmt[:56], z, (got or "REFUSED")[:70].replace("\n", " ")))
