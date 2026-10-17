r"""#89 page leg: read the cut radii back off the six regenerated product pages, and crop them.

The pdflatex controls (`measure89_rounded_clamp.py`, `measure89b_rounded_radius_space.py`) say pgf puts
the tangent point at the declared radius in PAGE points, whatever the picture's own scale, so the
product page has to show the same page points. Nothing is assumed about how the canvas got placed: the
nominal corner is the intersection of the two straight runs that border the arc, and the tangent
distance is |arc end - corner|.

A rounded run reaches the page as ONE path (`merge-path`), so its pieces are neighbours in the same
drawing and the walk goes in path order -- line, arc, line. Matching each arc against the nearest run
end anywhere on the page instead picks a different run that happens to end at the same point, and the
corner then comes out of two nearly parallel lines: the same instrument read 12.0pt before the merge
and 2,124pt after, which was the gauge, not the page. Pages are cropped around the matched arcs at
300 dpi and the crops are cleaned after reading.
"""
import io
import math
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, macros, prep  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BP_PT, CM_PT = 0.99651, 28.346
TOL = 0.05

PAPERS = [
    "An-explicit-exact-Hausdorff-gauge-for-SLE-September-26-2026",
    "Cardys-formula-for-critical-Poisson-Voronoi-percolation-September-23-2026",
    "Conformal-Limits-of-Critical-Square-Lattice-Random-Cluster-Interfaces-October-5-2026",
    "Eventual-Categoricity-for-Abstract-Elementary-Classes-September-24-2026",
    "The-critical-Liouville-quantum-sphere-and-geometric-limits-of-FK-maps-at-q-equals-4-"
    "September-24-2026",
    "The-spherical-magnetization-law-for-the-three-dimensional-quantum-Heisenberg-ferromagnet-"
    "October-5-2026",
]


def arcs_of(page):
    """[(arc, incoming run, outgoing run)] on one page, chains bolted end to end past 90deg."""
    got, loose = [], []
    for d in page.get_drawings():
        items = [i for i in d["items"] if i[0] in ("l", "c")]
        k = 0
        while k < len(items):
            if items[k][0] != "c":
                k += 1
                continue
            start, stop = (items[k][1].x, items[k][1].y), (items[k][4].x, items[k][4].y)
            j = k + 1
            while j < len(items) and items[j][0] == "c" and math.hypot(
                    items[j][1].x - stop[0], items[j][1].y - stop[1]) < TOL:
                stop = (items[j][4].x, items[j][4].y)
                j += 1
            prev = next_ = None
            # a merged run carries its own zero-length pieces (two arcs whose tangent points coincide
            # leave a `line` of no length between them), and a run of no length has no direction to
            # intersect with, so the bordering pieces are the nearest ones that actually go somewhere
            for m in range(k - 1, -1, -1):
                if items[m][0] != "l":
                    break
                if math.hypot(items[m][2].x - items[m][1].x, items[m][2].y - items[m][1].y) > 0.05:
                    prev = (items[m][1].x, items[m][1].y, items[m][2].x, items[m][2].y)
                    break
            for m in range(j, len(items)):
                if items[m][0] != "l":
                    break
                if math.hypot(items[m][2].x - items[m][1].x, items[m][2].y - items[m][1].y) > 0.05:
                    next_ = (items[m][1].x, items[m][1].y, items[m][2].x, items[m][2].y)
                    break
            if prev is None or next_ is None:
                loose.append((start, stop))
            else:
                got.append(((start, stop), prev, next_))
            k = j
    return got, loose


def corners(page, want):
    """(corner, tangent distances, run ends) for the arcs whose cut is one of `want` page points."""
    got, loose = arcs_of(page)
    runs = [(i[1].x, i[1].y, i[2].x, i[2].y) for d in page.get_drawings() for i in d["items"]
            if i[0] == "l"]
    for start, stop in loose:
        near = []
        for end in (start, stop):
            best, bestd = None, 1e9
            for r in runs:
                for other in ((r[0], r[1]), (r[2], r[3])):
                    d = math.hypot(other[0] - end[0], other[1] - end[1])
                    if d < bestd:
                        best, bestd = r, d
            near.append(best)
        if all(near):
            got.append(((start, stop), near[0], near[1]))
    out = []
    for (start, stop), r1, r2 in got:
        # walk each bordering run so it arrives at the arc (r1) and leaves from it (r2)
        if math.hypot(r1[2] - start[0], r1[3] - start[1]) > math.hypot(r1[0] - start[0],
                                                                       r1[1] - start[1]):
            r1 = (r1[2], r1[3], r1[0], r1[1])
        if math.hypot(r2[0] - stop[0], r2[1] - stop[1]) > math.hypot(r2[2] - stop[0],
                                                                     r2[3] - stop[1]):
            r2 = (r2[2], r2[3], r2[0], r2[1])
        x1, y1, x2, y2 = r1
        x3, y3, x4, y4 = r2
        den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
        if abs(den) < 1e-6:
            continue
        px = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / den
        py = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / den
        d0 = math.hypot(start[0] - px, start[1] - py) / BP_PT
        if not any(abs(d0 - w) < 0.4 for w in want):
            continue
        out.append(((px, py), [round(d0, 2),
                               round(math.hypot(stop[0] - px, stop[1] - py) / BP_PT, 2)],
                    (min(x1, x2, x3, x4, px), min(y1, y2, y3, y4, py),
                     max(x1, x2, x3, x4, px), max(y1, y2, y3, y4, py))))
    return out


def declared(paper):
    """The radii, in page pt, the changed canvases of this paper were emitted with."""
    text = io.open(os.path.join(ROOT, "_work", "flat", paper + ".tex"),
                   encoding="utf-8", errors="replace").read()
    pre, _ = prep.split_document(text)
    table, _ = macros.parse_definitions(pre)
    out = []
    for pic in PIC.findall(text):
        src = prep.expand_macros(pic, table) if table else pic
        built = cetz.build(cetz.MATH_ENVELOPE.sub("", src))
        if built and "rounded corners" in src:
            out += [float(m) * CM_PT for m in re.findall(r"radius: ([0-9.e-]+)cm", built)]
    return sorted(set(out))


for paper in PAPERS:
    want = declared(paper)
    print("=== %s  emitted radii(pt)=%s" % (paper[:50], want))
    doc = fitz.open(os.path.join(ROOT, "typst", paper, "main.pdf"))
    for i, page in enumerate(doc):
        got = corners(page, want)
        if not got:
            continue
        rect = fitz.Rect(min(g[2][0] for g in got) - 10, min(g[2][1] for g in got) - 10,
                         max(g[2][2] for g in got) + 10, max(g[2][3] for g in got) + 10)
        name = "rounded116_%d_%d.png" % (PAPERS.index(paper), i + 1)
        page.get_pixmap(dpi=300, clip=rect).save(os.path.join(ROOT, "_work", name))
        print("   p%-3d corners=%-3d d(pt)=%s  -> %s"
              % (i + 1, len(got), [g[1] for g in got][:12], name))
    doc.close()
