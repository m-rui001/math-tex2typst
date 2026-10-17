r"""#89 law, measured by A on pdflatex: how far a rounded corner's arc starts from the NOMINAL corner.

pgf cuts the corner by a radius `r` along both edges and joins the two tangent points with an arc.  What
the law has to say is what `r` becomes when an edge is shorter than 2r.  This control does not need a
coordinate mapping: the nominal corner is recovered as the intersection of the two straight runs that
border the arc, and the tangent distance is `|arc endpoint - corner|` in PDF bp (TeX pt at 0.99651).

One case per page, so item association is trivial.  Output: per case the measured tangent distances at
every inner corner, next to the two candidate laws -- `min(r, 0.5*min(in, out))` per corner and `min(r,
min(in, out))` (no half) -- so the two can be told apart on the page.
"""
import io
import math
import os
import re
import subprocess
import sys
import tempfile

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
BP_PT = 0.99651

CASES = [
    ("free-15pt", "40mm", "40mm", "rounded corners=15pt", [(40 * 72 / 25.4, 0.0)]),
    ("clamp-short-in", "10mm", "40mm", "rounded corners=40pt", [(10 * 72 / 25.4, 0.0)]),
    ("clamp-short-out", "40mm", "10mm", "rounded corners=40pt", [(40 * 72 / 25.4, 0.0)]),
    ("default-bare", "40mm", "40mm", "rounded corners", [(40 * 72 / 25.4, 0.0)]),
    ("thirty-deg-turn", "40mm", "40mm", "rounded corners=40pt", [(40 * 72 / 25.4, 0.0)]),
    ("reflex-150", "40mm", "40mm", "rounded corners=40pt", [(40 * 72 / 25.4, 0.0)]),
]

# a two-corner path with a short middle segment: does each corner take half of it?
DOUBLE = ("double-half-middle", "rounded corners=40pt")


def poly(case):
    """The coordinate list of the case, in cm-space units of the picture (x=1cm,y=1cm)."""
    name = case[0]
    if name == "free-15pt" or name == "default-bare":
        return [(0, 0), (4, 0), (4, 4)]
    if name == "clamp-short-in":
        return [(0, 0), (1, 0), (1, 4)]
    if name == "clamp-short-out":
        return [(0, 0), (4, 0), (4, 1)]
    if name == "thirty-deg-turn":
        return [(0, 0), (4, 0), (4 + 3.5, 2.0)]
    if name == "reflex-150":
        return [(0, 0), (4, 0), (4 - 3.8, 0.5)]
    return [(0, 0), (4, 0), (4, 4)]


def tex_source():
    pics = []
    for case in CASES:
        pts = poly(case)
        path = " -- ".join("(%.4fcm, %.4fcm)" % p for p in pts)
        pics.append(r"\begin{tikzpicture}[%s] \draw[%s] %s; \end{tikzpicture}"
                    % ("x=1cm,y=1cm", case[3], path))
    pts = [(0, 0), (4, 0), (4, 0.6), (8, 0.6)]
    path = " -- ".join("(%.4fcm, %.4fcm)" % p for p in pts)
    pics.append(r"\begin{tikzpicture}[x=1cm,y=1cm] \draw[%s] %s; \end{tikzpicture}"
                % (DOUBLE[1], path))
    body = "\\pagestyle{empty}\n" + "\n\\newpage\n".join(pics) + "\n"
    return ("\\documentclass[10pt]{article}\n"
            "\\usepackage[margin=25mm]{geometry}\n"
            "\\usepackage{tikz}\n"
            "\\begin{document}\n" + body + "\\end{document}\n")


def lines_and_arcs(page):
    """(straight runs, arc bezier runs) of the page's one drawn path, in pt."""
    runs, arcs = [], []
    for d in page.get_drawings():
        for item in d["items"]:
            kind = item[0]
            if kind == "l":
                runs.append((item[1].x, item[1].y, item[2].x, item[2].y))
            elif kind == "c":
                arcs.append((item[1].x, item[1].y, item[2].x, item[2].y,
                             item[3].x, item[3].y, item[4].x, item[4].y))
    return runs, arcs


def intersect(r1, r2):
    """Infinite-line intersection of two runs (the nominal corner)."""
    x1, y1, x2, y2 = r1
    x3, y3, x4, y4 = r2
    den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
    if abs(den) < 1e-9:
        return None
    px = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / den
    py = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / den
    return (px, py)


def measure(page):
    runs, arcs = lines_and_arcs(page)
    if not arcs:
        return runs, arcs, []
    out = []
    a0 = (arcs[0][0], arcs[0][1])
    a1 = (arcs[-1][6], arcs[-1][7])
    near = []
    for end in (a0, a1):
        best, bestd = None, 1e9
        for r in runs:
            for other in ((r[0], r[1]), (r[2], r[3])):
                d = math.hypot(other[0] - end[0], other[1] - end[1])
                if d < bestd:
                    best, bestd = r, d
        near.append(best)
    corner = intersect(near[0], near[1]) if near[0] and near[1] else None
    if corner:
        for end, label in ((a0, "in"), (a1, "out")):
            out.append((label, round(math.hypot(end[0] - corner[0],
                                                end[1] - corner[1]) / BP_PT, 3)))
    return runs, arcs, out


tmp = tempfile.mkdtemp(prefix="m89_")
tex = os.path.join(tmp, "control.tex")
io.open(tex, "w", encoding="utf-8").write(tex_source())
proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                       "-output-directory", tmp, "control.tex"],
                      cwd=tmp, capture_output=True, text=True)
pdf = os.path.join(tmp, "control.pdf")
if not os.path.exists(pdf):
    print(proc.stdout[-3000:])
    sys.exit(1)

doc = fitz.open(pdf)
print("pages=%d" % doc.page_count)
for i, case in enumerate(CASES + [DOUBLE]):
    if i + 1 >= doc.page_count + 1:
        break
    page = doc[i]
    runs, arcs, got = measure(page)
    pts = poly(case) if case in CASES else [(0, 0), (4, 0), (4, 0.6), (8, 0.6)]
    segs = [round(math.hypot(pts[j + 1][0] - pts[j][0], pts[j + 1][1] - pts[j][1])
                  * 28.346, 2) for j in range(len(pts) - 1)]
    declared = 40.0 if case[0] not in ("free-15pt", "default-bare") else (
        15.0 if case[0] == "free-15pt" else 4.0)
    halves = [round(min(segs[j - 1], segs[j]) / 2.0, 3) for j in range(1, len(pts) - 1)]
    print("%-18s declared=%6.2f segs(pt)=%s half-min=%s  measured=%s  curves=%d lines=%d"
          % (case[0], declared, segs, halves, got, len(arcs), len(runs)))
    if "-v" in sys.argv:
        for r in runs:
            print("      line (%8.3f,%8.3f)-(%8.3f,%8.3f) len=%.3f"
                  % (r[0], r[1], r[2], r[3], math.hypot(r[2] - r[0], r[3] - r[1])))
        for a in arcs:
            print("      arc (%8.3f,%8.3f)..(%8.3f,%8.3f) ctrl (%8.3f,%8.3f)(%8.3f,%8.3f) chord=%.3f"
                  % (a[0], a[1], a[6], a[7], a[2], a[3], a[4], a[5],
                     math.hypot(a[6] - a[0], a[7] - a[1])))
shutil_tmp = tmp
print("tmp=%s" % shutil_tmp)
