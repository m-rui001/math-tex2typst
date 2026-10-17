r"""Put each restored canvas in front of a reader: render the page that hosts it, at 300 dpi.

The canvas labels are all maths, so no word needle finds the page and the ink clusters are too small to
match by size. What does sit next to one in the flow is the author's own prose: the last sentence before
the display block is typeset on the same page in nearly every case, so its longest words pick the page.
The whole page is rendered -- a diagram that exists, is mispositioned, or crushes its caption all read
differently at 300 dpi, and the page is the only referee.
"""
import glob
import io
import os
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PROSE = re.compile(r"^[A-Za-z][A-Za-z0-9 ,;:()\-\.'`]{40,}$")

STEMS = ["A-counterexample-to-the-coarse-Novikov-conjecture",
         "An-infinite-finitely-presented-residually-finite-2-group",
         "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions",
         "The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one",
         "Numerical-semiampleness-of-nef-adjoint-classes-on-compact-Kahler-manifolds"]


def canvas_lines(lines):
    """(start line index, block text) for every canvas block, in source order."""
    out, i = [], 0
    while i < len(lines):
        if "#cetz.canvas(" in lines[i]:
            depth, block, start = 0, [], i
            while i < len(lines):
                block.append(lines[i])
                depth += lines[i].count("(") - lines[i].count(")")
                i += 1
                if depth <= 0:
                    break
            out.append((start, " ".join(block)))
            continue
        i += 1
    return out


for stem in STEMS:
    folder = glob.glob(os.path.join(ROOT, "typst", stem + "*"))[0]
    lines = open(os.path.join(folder, "main.typ"), encoding="utf-8").read().split("\n")
    was = open(glob.glob(os.path.join(ROOT, "_work", "pre70_" + stem + "*.typ"))[0],
               encoding="utf-8").read()
    blocks = canvas_lines(lines)
    fresh = [(i, b) for i, b in blocks if " ".join(b.split()) not in " ".join(was.split())]
    doc = fitz.open(glob.glob(os.path.join(folder, "*.pdf"))[0])
    ptexts = [" ".join(p.get_text().split()) for p in doc]
    print("=== %s (%d pages, %d new canvases)" % (stem[:46], len(doc), len(fresh)))
    for idx, (start, block) in enumerate(fresh):
        anchor = ""
        for j in range(start, max(-1, start - 120), -1):
            if PROSE.match(lines[j].strip()):
                anchor = lines[j].strip()
                break
        words = sorted({w for w in re.findall(r"[A-Za-z]{6,}", anchor)} - set(), key=len, reverse=True)[:4]
        hits = [n for n, t in enumerate(ptexts) if sum(1 for w in words if w in t) >= 2]
        if not hits:
            print("  canvas at line %d: anchor prose %r found on no page" % (start + 1, anchor[:60]))
            continue
        n = hits[0]
        out = os.path.join(ROOT, "_work", "page70_%s_%d.png" % (re.sub(r"[^A-Za-z0-9]", "", stem)[:12], idx))
        doc[n].get_pixmap(dpi=150).save(out)
        crop = os.path.join(ROOT, "_work", "crop70_%s_%d.png" % (re.sub(r"[^A-Za-z0-9]", "", stem)[:12], idx))
        m = doc[n].search_for(words[0])
        y = m[0].y0 if m else 90
        box = fitz.Rect(36, max(36, y - 60), doc[n].rect.x1 - 36, min(doc[n].rect.y1, y + 320))
        doc[n].get_pixmap(clip=box, dpi=300).save(crop)
        drawings = len(doc[n].get_drawings())
        print("  canvas at line %d: p%d, %d vector drawings, anchor %r -> %s / %s"
              % (start + 1, n + 1, drawings, anchor[:48], os.path.basename(out), os.path.basename(crop)))
    doc.close()
