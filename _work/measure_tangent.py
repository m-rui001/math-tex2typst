"""Measure TikZ's own control points for `to[out=,in=]` out of a rendered PDF.

The emitter currently places each control a third of the chord along its tangent, which is the
textbook rule and unverified here. `get_drawings` hands back the bezier segments pgf writes, so
the ratio and the tangent angle are read directly: run this and compare against 1/3.
"""
import math
import subprocess
import sys
from pathlib import Path

import fitz

out = Path("_work")
src = out / "measure_tangent.tex"
subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name],
               cwd=str(out), check=True, capture_output=True)
doc = fitz.open(str(out / "measure_tangent.pdf"))
page = doc[0]
PT = 72.0 / 25.4  # a PDF point per cm; the picture declares x=y=1cm

lines = []
for d in page.get_drawings():
    for item in d["items"]:
        pts = [p for p in item[1:] if isinstance(p, fitz.Point)]
        if item[0] != "c" or len(pts) != 4:
            lines.append("skipped op=%s points=%d" % (item[0], len(pts)))
            continue
        a, c1, c2, b = pts
        chord = math.hypot(b.x - a.x, b.y - a.y) / PT
        for name, at, ctrl in (("out", a, c1), ("in", b, c2)):
            dx, dy = (ctrl.x - at.x) / PT, -(ctrl.y - at.y) / PT  # pdf y grows down
            lines.append("%s: r=%.4f angle=%7.2f (chord %.3f cm)"
                         % (name, math.hypot(dx, dy) / chord,
                            math.degrees(math.atan2(dy, dx)), chord))
text = "\n".join(lines)
(out / "tangent_factor.log").write_text(text + "\n", encoding="utf-8")
print(text)
