r"""Find the page each restored canvas is drawn on, by matching the ink cluster to the canvas extent.

Every label of these seven diagrams is maths, so no prose word identifies the page (`shot_canvas_page.py`
needs 5+ letter words and finds none). What both sides do share is geometry: a CeTz canvas block lists its
points in cm, so its ink is a cluster of vector rectangles of that width and height. Merge the page's
drawings into clusters and take the cluster whose size matches -- then crop that cluster at 300 dpi.
"""
import glob
import io
import os
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PT = 28.3465
POINT = re.compile(r"\(\s*(-?\d+\.?\d*)\s*,\s*(-?\d+\.?\d*)\s*\)(?!\s*,\s*-?\d)")
CANVAS_START = re.compile(r"^\s*(?:.*#)?cetz\.canvas\(")


def canvas_blocks(text):
    out, lines, i = [], text.split("\n"), 0
    while i < len(lines):
        if CANVAS_START.match(lines[i]) or "#cetz.canvas(" in lines[i]:
            depth, block = 0, []
            while i < len(lines):
                block.append(lines[i])
                depth += lines[i].count("(") - lines[i].count(")")
                i += 1
                if depth <= 0:
                    break
            out.append(" ".join(block))
            continue
        i += 1
    return out


def extent(block):
    pts = [(float(x), float(y)) for x, y in POINT.findall(block)]
    if len(pts) < 2:
        return None
    xs = [p[0] for p in pts]
    ys = [p[1] for p in pts]
    return (max(xs) - min(xs)) * PT, (max(ys) - min(ys)) * PT


def clusters(page, pad=14.0):
    rects = [fitz.Rect(d["rect"]) for d in page.get_drawings() if not d["rect"].is_empty]
    grew = True
    while grew:
        grew, out = False, []
        for r in rects:
            hit = next((o for o in out if (o + (-pad, -pad, pad, pad)).intersects(r)), None)
            if hit:
                hit |= r
                grew = True
            else:
                out.append(fitz.Rect(r))
        rects = out
    return [c for c in rects if c.width > 20 and c.height > 20]


for stem in ["A-counterexample-to-the-coarse-Novikov-conjecture",
             "An-infinite-finitely-presented-residually-finite-2-group",
             "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions",
             "The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one",
             "Numerical-semiampleness-of-nef-adjoint-classes-on-compact-Kahler-manifolds"]:
    folder = glob.glob(os.path.join(ROOT, "typst", stem + "*"))[0]
    snap = glob.glob(os.path.join(ROOT, "_work", "pre70_" + stem + "*.typ"))[0]
    now = canvas_blocks(open(os.path.join(folder, "main.typ"), encoding="utf-8").read())
    was = canvas_blocks(open(snap, encoding="utf-8").read())
    fresh = [b for b in now if b not in was]
    doc = fitz.open(glob.glob(os.path.join(folder, "*.pdf"))[0])
    print("=== %s: %d canvas blocks, %d new, %d pages" % (stem[:46], len(now), len(fresh), len(doc)))
    for k, block in enumerate(fresh):
        size = extent(block)
        if not size:
            print("  canvas %d: no readable extent (%s)" % (k, block[:60]))
            continue
        best, score = None, None
        for n, page in enumerate(doc):
            for c in clusters(page):
                s = abs(c.width - size[0]) / size[0] + abs(c.height - size[1]) / size[1]
                if score is None or s < score:
                    best, score, page_no = c, s, n
        if best is None:
            print("  canvas %d: expected %.0f x %.0f pt, page has no ink cluster" % (k, *size))
            continue
        box = fitz.Rect(best.x0 - 20, best.y0 - 20, best.x1 + 20, best.y1 + 20) & doc[page_no].rect
        out = os.path.join(ROOT, "_work", "crop70_%s_%d.png" % (re.sub(r"[^A-Za-z0-9]", "", stem)[:14], k))
        doc[page_no].get_pixmap(clip=box, dpi=300).save(out)
        words = doc[page_no].get_text(clip=box).split()
        print("  canvas %d: expected %.0fx%.0f pt -> p%d cluster %.0fx%.0f pt (mismatch %.2f), "
              "page words in box: %d, crop %s" % (k, size[0], size[1], page_no + 1, best.width,
                                                  best.height, score, len(words), os.path.basename(out)))
    doc.close()
