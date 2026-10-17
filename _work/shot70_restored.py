r"""Show the canvases that #70 put back on the page, cropped at 300 dpi.

A restored canvas is a `#cetz.canvas(` block in today's `main.typ` with no twin in the pre-#70
snapshot, so the two files decide the population -- nothing here guesses from the LaTeX source.
For each one the probe finds the page that carries its label words, prints the words the page shows,
and crops the band the labels sit in: only the rendered page says whether the diagram is drawn,
placed and not crushing the text around it.
"""
import glob
import io
import os
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPERS = ["A-counterexample-to-the-coarse-Novikov-conjecture",
          "An-infinite-finitely-presented-residually-finite-2-group",
          "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions",
          "The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one",
          "Numerical-semiampleness-of-nef-adjoint-classes-on-compact-Kahler-manifolds"]


def canvases(text):
    """Every `#cetz.canvas(` block, whitespace-normalised, in source order."""
    out, lines, i = [], text.split("\n"), 0
    while i < len(lines):
        if "#cetz.canvas(" in lines[i]:
            depth, block = 0, []
            while i < len(lines):
                block.append(lines[i])
                depth += lines[i].count("(") - lines[i].count(")")
                i += 1
                if depth <= 0:
                    break
            out.append(" ".join(" ".join(block).split()))
            continue
        i += 1
    return out


def labels(block):
    """The words a canvas writes, as they will read on the page."""
    words = []
    for body in re.findall(r"content\(\s*\([^)]*\)\s*,\s*\[(.*?)\]\s*\)", block):
        body = re.sub(r"#[a-zA-Z.]+\([^)]*\)", " ", body)
        body = re.sub(r"[${}\\]", " ", body)
        words += [w for w in body.split() if re.search(r"[A-Za-z0-9]", w)]
    return words


for stem in PAPERS:
    folder = glob.glob(os.path.join(ROOT, "typst", stem + "*"))
    snap = glob.glob(os.path.join(ROOT, "_work", "pre70_" + stem + "*.typ"))
    if not folder or not snap:
        print("!! no product or snapshot for %s" % stem[:48])
        continue
    now = canvases(open(os.path.join(folder[0], "main.typ"), encoding="utf-8").read())
    was = set(canvases(open(snap[0], encoding="utf-8").read()))
    fresh = [b for b in now if b not in was]
    print("=== %s: canvas blocks %d, restored by #70: %d" % (stem[:48], len(now), len(fresh)))
    if not fresh:
        continue
    doc = fitz.open(glob.glob(os.path.join(folder[0], "*.pdf"))[0])
    pages = [(n, " ".join(p.get_text().split())) for n, p in enumerate(doc)]
    for k, block in enumerate(fresh):
        words = labels(block)
        hits = [(n, w) for n, t in pages for w in words[:6] if w in t]
        if not hits:
            print("  canvas %d: labels %r found on NO page" % (k, words[:6]))
            continue
        page_no = max(set(n for n, _ in hits), key=lambda n: sum(1 for m, _ in hits if m == n))
        page = doc[page_no]
        rects = [fitz.Rect(r) for w in words[:8] for r in page.search_for(w)]
        box = rects[0] if rects else page.rect
        for r in rects[1:]:
            box |= r
        box = fitz.Rect(max(0, box.x0 - 42), max(0, box.y0 - 34),
                        min(page.rect.x1, box.x1 + 42), min(page.rect.y1, box.y1 + 34))
        out = os.path.join(ROOT, "_work", "crop70_%s_%d.png" % (stem[:18], k))
        page.get_pixmap(clip=box, dpi=300).save(out)
        drawing = [d["rect"] for d in page.get_drawings() if d["rect"].intersects(box)]
        ink = fitz.Rect()
        for r in drawing:
            ink |= r
        print("  canvas %d: p%d, labels on page %d/%d, ink bbox %s, crop %s [%d x %d pt]"
              % (k, page_no + 1, sum(1 for n, _ in hits if n == page_no), min(6, len(words)),
                 ("%.1f %.1f %.1f %.1f" % tuple(ink)) if drawing else "none",
                 os.path.basename(out), box.width, box.height))
    doc.close()
