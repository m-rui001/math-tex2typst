r"""The placement numbers the two positioning tests now read, and what each term is.

Every node that holds a label has a height the engine charges to a neighbour's `of`-placement
(_work/measure_own_height_placement.py: a one-line node placed `below=1cm of` a point lands
1.2452cm under it, the written centimetre plus the node's own half-height). Prints the built
canvas line for each spelling the tests assert, so the expectation moves to the measured model
rather than to a typed guess.
"""
import io
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

CASES = [
    (r"\node (t) at (0,0) {T};", "below left=12mm and -12mm of t"),
    (r"\node (t) at (0,0) {T};", "above right=1cm and 2cm of t"),
    (r"\node (t) at (0,0) {T};", "below=1cm of t"),
    (r"\node (t) at (0,0) {T};", "right=1cm and 2cm of t"),
    (r"\node (t) at (0,0) {T};", "below=of t"),
    (r"\node (t) at (0,0) {T};", "below=23mm of t.south"),
    (r"\node[minimum size=2cm] (t) at (0,0) {T};", "below=1cm of t.south"),
    (r"\node (t) at (0,0) {T};", "above=5mm of t"),
    (r"\node (t) at (0,0) {T};", "right=5mm of t"),
]
CALC = (r"\node[text width=1cm] (count) at (0,0) {C};"
        r"\node[text width=1cm] (bounds) at (6,0) {B};")
for opt in ("below=1cm of $(count)!0.5!(bounds)$",
            "below=1cm of $(count.south)!0.5!(bounds.south)$",
            "above=1cm of $(count.north)!0.5!(bounds.north)$"):
    CASES.append((CALC, opt))

for decl, opt in CASES:
    built = cetz.build(r"\begin{tikzpicture}" + decl + r"\node[" + opt + r"] {N};\end{tikzpicture}")
    if built is None:
        print("%-46s refused" % opt)
        continue
    line = [l.strip() for l in built.splitlines() if "content(" in l][-1]
    print("%-46s %s" % (opt, line))
