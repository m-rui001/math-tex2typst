"""Are the 45/135 defaults relative to the chord direction, or absolute angles?

One horizontal chord cannot tell them apart, so these run over chords at 90 and 45 degrees. The
emitter has to know which, because `to[out=30]`-only spellings are the common form in the corpus.
"""
import math
import subprocess
from pathlib import Path

import pymupdf

PT = 72.0 / 25.4
VARIANTS = [
    ("up_out30", r"\draw (0,0) to[out=30] (0,2);"),
    ("up_in30", r"\draw (0,0) to[in=30] (0,2);"),
    ("up_plain", r"\draw (0,0) to (0,2);"),
    ("diag_out30", r"\draw (0,0) to[out=30] (2,2);"),
    ("down_out30", r"\draw (0,0) to[out=30] (2,-2);"),
]
TEMPLATE = ("\\documentclass[tikz]{standalone}\n\\begin{document}\n"
            "\\begin{tikzpicture}[x=1cm,y=1cm]\n%s\n\\end{tikzpicture}\n\\end{document}\n")

for label, body in VARIANTS:
    src = Path("_work/md_%s.tex" % label)
    src.write_text(TEMPLATE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name],
                   cwd="_work", check=True, capture_output=True)
    page = pymupdf.open("_work/md_%s.pdf" % label)[0]
    curves = [[p for p in item[1:] if isinstance(p, pymupdf.Point)]
              for d in page.get_drawings() for item in d["items"]
              if item[0] == "c"]
    curves = [c for c in curves if len(c) == 4]
    if not curves:
        print("%-11s no curve item (straight)" % label)
        continue
    def cm(p):
        return (p.x / PT, -p.y / PT)
    a, c1, c2, b = [cm(p) for p in curves[0]]
    chord = math.hypot(b[0] - a[0], b[1] - a[1])
    d = math.degrees(math.atan2(b[1] - a[1], b[0] - a[0]))
    out = []
    for name, at, ctrl in (("out", a, c1), ("in", b, c2)):
        dx, dy = ctrl[0] - at[0], ctrl[1] - at[1]
        ang = math.degrees(math.atan2(dy, dx))
        out.append("%s r=%.4f ang=%7.2f rel=%7.2f"
                   % (name, math.hypot(dx, dy) / chord, ang, (ang - d + 180) % 360 - 180))
    print("%-11s chord=%.3f dir=%6.1f  %s" % (label, chord, d, "  |  ".join(out)))
