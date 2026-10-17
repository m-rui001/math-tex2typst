"""Where pdflatex actually puts each positioned node, in the picture's own cm.

The `<ver> and <hor>` order of TikZ's positioning library decides whether
'below left=1cm and 2cm of A' moves a node 1 down / 2 left or the other way, and the reading
below is what the emitter has to match. Baseline y grows downward in the PDF, so the printed
y is negated to the picture's up-positive axes.
"""
import math
import re
import subprocess
import sys
from pathlib import Path

import pymupdf

src = Path(sys.argv[1] if len(sys.argv) > 1 else "_work/measure_positioned.tex")
out = src.parent
subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name], check=True,
               capture_output=True, cwd=str(out))
pdf = out / (src.stem + ".pdf")
page = pymupdf.open(str(pdf))[0]
words = [(w[4], w[0] + w[2] / 2.0, w[1] + w[3] / 2.0) for w in page.get_text("words")]
by = {t: (x, y) for t, x, y in words if len(t) == 1 and t in "ABCDEFGF"}

origin = by["A"]
# the picture sits wherever the page put it; measure in points and turn them into the
# picture's own cm using the A->E distance, which the source fixes at 1cm
def delta(t):
    dx = by[t][0] - origin[0]
    dy = origin[1] - by[t][1]
    return dx, dy


scale = 28.3465  # a cm in pt, only used to name the axis, not to read a distance
print("A at page %s; deltas in pt below (a cm is %.3f pt)" % (origin, scale))
for t in "BCDEFG":
    dx, dy = delta(t)
    print("  %s -> (%+.2f, %+.2f) pt" % (t, dx, dy))
# B and C differ only by their swapped numbers, so their difference names the axes
print("C - B = (%+.2f, %+.2f) pt: the first number moves this axis"
      % (by["C"][0] - by["B"][0], origin[1] - by["C"][1] - (origin[1] - by["B"][1])))
