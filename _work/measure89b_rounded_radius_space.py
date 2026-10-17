r"""#89 law, second half: does a picture's own scale reach the rounded corner's radius?

`measure89_rounded_clamp.py` says the tangent point sits at the declared radius whatever the edge
length is. That control drew at the default `x=1cm`, so it cannot tell the two remaining readings
apart:
  - the radius is a length OF THE PICTURE'S USER SPACE, so a scale of .5 halves it on paper, or
  - the radius is an absolute length on paper, and the picture's scale does not touch it.
An anisotropic head (`x=1cm, y=0.5cm`) with a corner whose two edges run along different axes settles
it alone: user-space rounding then measures 20pt along the x edge and 10pt along the y edge, absolute
rounding 20pt on both.

Every case is one picture per page: the corner is the intersection of the two straight runs bordering
the arc, and the tangent distance is `|arc endpoint - corner|` in TeX pt (fitz bp at 0.99651).
"""
import io
import math
import os
import subprocess
import sys
import tempfile

import fitz

BP_PT = 0.99651

# (name, head options, path in user coordinates, declared radius written on the page)
CASES = [
    ("unit-x-default", "[]", [(0, 0), (4, 0), (4, 4)], 20.0),
    ("half-both", "[x=0.5cm,y=0.5cm]", [(0, 0), (4, 0), (4, 4)], 20.0),
    ("scale-key", "[scale=0.5]", [(0, 0), (4, 0), (4, 4)], 20.0),
    ("aniso", "[x=1cm,y=0.5cm]", [(0, 0), (4, 0), (4, 4)], 20.0),
    ("aniso-diag", "[x=1cm,y=0.5cm]", [(0, 0), (4, 0), (8, 4)], 20.0),
    ("rotate", "[rotate=30]", [(0, 0), (4, 0), (4, 4)], 20.0),
    ("sle-face-0.88", "[x=0.88cm,y=0.88cm]", [(0, 0), (4, 0), (4, 4)], 12.0),
]


def source():
    pics = []
    for name, head, pts, radius in CASES:
        path = " -- ".join("(%.4f, %.4f)" % p for p in pts)
        pics.append(r"\begin{tikzpicture}%s \draw[rounded corners=%.0fpt] %s; \end{tikzpicture}"
                    % (head, radius, path))
    body = "\\pagestyle{empty}\n" + "\n\\newpage\n".join(pics) + "\n"
    return ("\\documentclass[10pt]{article}\n"
            "\\usepackage[margin=25mm]{geometry}\n"
            "\\usepackage{tikz}\n\\begin{document}\n" + body + "\\end{document}\n")


def items(page):
    runs, arcs = [], []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "l":
                runs.append((item[1].x, item[1].y, item[2].x, item[2].y))
            elif item[0] == "c":
                arcs.append((item[1].x, item[1].y, item[4].x, item[4].y))
    # an arc of more than 90deg comes out as several beziers bolted end to end, and only the outer
    # two ends are tangent points, so the chain is joined before it is read
    joined = []
    for arc in arcs:
        if joined and math.hypot(arc[0] - joined[-1][2], arc[1] - joined[-1][3]) < 0.02:
            joined[-1] = (joined[-1][0], joined[-1][1], arc[2], arc[3])
        else:
            joined.append(arc)
    return runs, joined


def tangent(page):
    """Per arc: the two tangent distances from the nominal corner, and the corner's turn angle."""
    runs, arcs = items(page)
    got = []
    for arc in arcs:
        ends = [(arc[0], arc[1]), (arc[2], arc[3])]
        near = []
        for end in ends:
            best, bestd = None, 1e9
            for r in runs:
                for other in ((r[0], r[1]), (r[2], r[3])):
                    d = math.hypot(other[0] - end[0], other[1] - end[1])
                    if d < bestd:
                        best, bestd = r, d
            near.append((best, bestd))
        if any(n[0] is None or n[1] > 2.0 for n in near):
            got.append(("unmatched", None))
            continue
        (x1, y1, x2, y2), (x3, y3, x4, y4) = near[0][0], near[1][0]
        den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
        if abs(den) < 1e-9:
            got.append(("parallel", None))
            continue
        px = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / den
        py = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / den
        d = [round(math.hypot(e[0] - px, e[1] - py) / BP_PT, 3) for e in ends]
        ang = math.degrees(math.acos(max(-1.0, min(1.0, (
            ((x2 - x1) * (x4 - x3) + (y2 - y1) * (y4 - y3))
            / (math.hypot(x2 - x1, y2 - y1) * math.hypot(x4 - x3, y4 - y3)))))))
        got.append(("tangent", d))
        got.append(("arc-pair", round(math.hypot(ends[0][0] - ends[1][0],
                                                 ends[0][1] - ends[1][1]) / BP_PT, 3)))
        got.append(("sweep-ang", round(ang, 2)))
    return got


tmp = tempfile.mkdtemp(prefix="m89b_")
tex = os.path.join(tmp, "control.tex")
io.open(tex, "w", encoding="utf-8").write(source())
proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                       "-output-directory", tmp, "control.tex"],
                      cwd=tmp, capture_output=True, text=True)
pdf = os.path.join(tmp, "control.pdf")
if not os.path.exists(pdf):
    print(proc.stdout[-3000:])
    sys.exit(1)

doc = fitz.open(pdf)
print("pages=%d cases=%d" % (doc.page_count, len(CASES)))
for i, (name, head, pts, radius) in enumerate(CASES):
    print("%-15s head=%-22s declared=%5.1fpt  %s" % (name, head, radius, tangent(doc[i])))
print("tmp=%s" % tmp)
