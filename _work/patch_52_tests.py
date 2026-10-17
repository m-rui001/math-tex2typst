r"""#52: retarget the geometry assertions in `tools/test_t2t.py` at the new stroke law.

Every assertion whose subject is a SHAPE's coordinates loses its closing paren, which is how the rest
of this file already asserts a line (line 254, 275, 587, 1590, 1777, 2071 do it) -- the pen is not
what those tests are about.  Assertions whose subject IS the pen, the field or the ink keep the full
spelling and are rewritten to it.  Run once, then the suite itself is the check.
"""
import pathlib
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
PATH = pathlib.Path(__file__).resolve().parents[1] / "tools" / "test_t2t.py"

# (old, new, expected replacements) -- a mismatch is an error, not a silent skip
PAIRS = [
    # coordinates only: the pen is now always named, so the assertion stops at the last number
    ('"line((1, -1), (-1, -1))"', '"line((1, -1), (-1, -1)"', 1),
    ('"line((1, 0), (1, 2))"', '"line((1, 0), (1, 2)"', 1),
    ('"bezier((0, 0), (3, 0), (1, 1), (2, 1))"', '"bezier((0, 0), (3, 0), (1, 1), (2, 1)"', 2),
    ('"bezier((0, 0), (3, 0), (0, 1.15), (2, 1))"', '"bezier((0, 0), (3, 0), (0, 1.15), (2, 1)"', 1),
    ('"bezier((0, 0), (3, 0), (1, 2), (2, 2))"', '"bezier((0, 0), (3, 0), (1, 2), (2, 2)"', 1),
    ('"bezier((0, 0), (2, 0), (4.776e-17, 0.78), (1.22, 9.552e-17))"',
     '"bezier((0, 0), (2, 0), (4.776e-17, 0.78), (1.22, 9.552e-17)"', 1),
    ('"bezier((0, 0), (2, 0), (0.6755, 0.39), (1.448, 0.5515))"',
     '"bezier((0, 0), (2, 0), (0.6755, 0.39), (1.448, 0.5515)"', 1),
    ('"bezier((0, 0), (2, 0), (1, -0.8284), (1, -0.8284))"',
     '"bezier((0, 0), (2, 0), (1, -0.8284), (1, -0.8284)"', 1),
    ('"bezier((0, 0), (4, 0), (1, 2), (3, 2))"', '"bezier((0, 0), (4, 0), (1, 2), (3, 2)"', 1),
    ('"bezier((0, 0), (2, 0), (-0.5515, 0.5515), (2.552, 0.5515))"',
     '"bezier((0, 0), (2, 0), (-0.5515, 0.5515), (2.552, 0.5515)"', 1),
    ('"bezier((0, 0), (2, 0), (-2.758, 2.758), (4.758, 2.758))"',
     '"bezier((0, 0), (2, 0), (-2.758, 2.758), (4.758, 2.758)"', 1),
    ('"bezier((0, 0), (2, 0), (-0.2758, 0.2758), (2.276, 0.2758))"',
     '"bezier((0, 0), (2, 0), (-0.2758, 0.2758), (2.276, 0.2758)"', 1),
    ('"bezier((0, 0), (2, 0), (1, -0.3978), (1, -0.3978))"',
     '"bezier((0, 0), (2, 0), (1, -0.3978), (1, -0.3978)"', 1),
    ('"line((1, 1), (3, 1))"', '"line((1, 1), (3, 1)"', 1),
    ('"line((1.2, 0), (1.2, 1))"', '"line((1.2, 0), (1.2, 1)"', 1),
    ('"line((4.1, 0), (4.6, 1))"', '"line((4.1, 0), (4.6, 1)"', 1),
    # the pen itself: a drawn shape names pgf's 0.4pt, a filled one says it has no border
    ('"circle((1, 1), radius: 0.07056, fill: black)"',
     '"circle((1, 1), radius: 0.07056, fill: black, stroke: none)"', 1),
    ('"circle((0, 0.5), radius: 0.07056, fill: black)"',
     '"circle((0, 0.5), radius: 0.07056, fill: black, stroke: none)"', 1),
    ('\'circle((2, 0), radius: 0.07056, fill: rgb("#000099"))\'',
     '\'circle((2, 0), radius: 0.07056, fill: rgb("#000099"), stroke: none)\'', 1),
    ('\'circle((0.7, -1.08), radius: 0.03528, fill: rgb("#8c8c8c"))\'',
     '\'circle((0.7, -1.08), radius: 0.03528, fill: rgb("#8c8c8c"), stroke: none)\'', 1),
    ('\'stroke: (paint: rgb("#0000a6"))\'', '\'stroke: (paint: rgb("#0000a6"), thickness: 0.4pt)\'', 1),
    ('\'stroke: (paint: rgb("#0000ff"))\'',
     '\'stroke: (paint: rgb("#0000ff"), thickness: 0.4pt)\'', 1),
    ('\'radius: 5.669pt, stroke: (paint: rgb("#ff0000")), fill: rgb("#ffff00")\'',
     '\'radius: 5.669pt, stroke: (paint: rgb("#ff0000"), thickness: 0.4pt), '
     'fill: rgb("#ffff00")\'', 1),
    # `\path (a) edge node {red} (b)`: the label lands, the edge paints nothing
    ('self.assertIn("line((0, 0), (2, 0))", lines)',
     'self.assertIn("line((0, 0), (2, 0), stroke: none)", lines)', 1),
]

text = PATH.read_text(encoding="utf-8")
bad = []
for old, new, want in PAIRS:
    got = text.count(old)
    if got != want:
        bad.append((old[:60], want, got))
        continue
    text = text.replace(old, new)
PATH.write_text(text, encoding="utf-8", newline="\n")
for old, want, got in bad:
    print("MISS %d!=%d  %s" % (got, want, old))
print("done" if not bad else "rewrote what matched")
