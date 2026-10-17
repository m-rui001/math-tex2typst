r"""Put the seven restored canvases in front of a reader: find each one's page by its own labels.

A canvas label reaches the page as maths, so the words to search are not the Typst spelling (`K_1(C^*(B))`)
and not prose the author happened to write nearby -- the page locator that used the preceding sentence
landed on page 1 of a paper whose diagram is on page 2. What survives both sides is the letter skeleton:
NFKD-decompose the page text (italic `K` -> `K`), drop everything that is not a letter, and look for the
label's letters in that order. The page carrying the most distinct skeletons is the page holding the
diagram; crop the ink there at 300 dpi.
"""
import glob
import io
import os
import re
import sys
import unicodedata

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STEMS = ["A-counterexample-to-the-coarse-Novikov-conjecture",
         "An-infinite-finitely-presented-residually-finite-2-group",
         "The-Grothendieck-homotopy-hypothesis-via-elementary-expansions",
         "The-two-primary-Birch-Swinnerton-Dyer-formula-in-Selmer-corank-at-most-one",
         "Numerical-semiampleness-of-nef-adjoint-classes-on-compact-Kahler-manifolds"]


def canvas_blocks(text):
    out, lines, i = [], text.split("\n"), 0
    while i < len(lines):
        if "#cetz.canvas(" in lines[i]:
            depth, block, start = 0, [], i
            while i < len(lines):
                block.append(lines[i])
                depth += lines[i].count("(") - lines[i].count(")")
                i += 1
                if depth <= 0:
                    break
            out.append((start + 1, " ".join(block)))
            continue
        i += 1
    return out


def skeleton(s):
    return "".join(ch for ch in unicodedata.normalize("NFKD", s) if ch.isalpha())


def label_skeletons(block):
    out = []
    for body in re.findall(r"content\(\s*\([^)]*\)\s*,\s*\[(.*?)\]\s*\)", block):
        body = re.sub(r"#[a-zA-Z.]+\([^)]*\)", " ", body)
        sk = skeleton(body)
        if len(sk) >= 2:
            out.append(sk)
    return sorted(set(out), key=len, reverse=True)


for stem in STEMS:
    folder = glob.glob(os.path.join(ROOT, "typst", stem + "*"))[0]
    now = open(os.path.join(folder, "main.typ"), encoding="utf-8").read()
    was = skeleton(open(glob.glob(os.path.join(ROOT, "_work", "pre70_" + stem + "*.typ"))[0],
                        encoding="utf-8").read())
    doc = fitz.open(glob.glob(os.path.join(folder, "*.pdf"))[0])
    pages = [(n, skeleton(p.get_text()), p) for n, p in enumerate(doc)]
    print("=== %s (%d pages)" % (stem[:46], len(doc)))
    for idx, (line, block) in enumerate(canvas_blocks(now)):
        if skeleton(block) in was:
            continue
        needles = label_skeletons(block)[:6]
        scored = sorted(((sum(1 for nd in needles if nd in t), n) for n, t, _ in pages), reverse=True)
        if not needles or scored[0][0] == 0:
            print("  line %d: no label skeleton matched any page (needles %r)" % (line, needles[:3]))
            continue
        n, score = scored[0]
        page = doc[n]
        cluster = fitz.Rect()
        for d in page.get_drawings():
            if not d["rect"].is_empty:
                cluster |= fitz.Rect(d["rect"])
        tag = re.sub(r"[^A-Za-z0-9]", "", stem)[:12]
        box = (fitz.Rect(cluster.x0 - 24, cluster.y0 - 24, cluster.x1 + 24, cluster.y1 + 24)
               if not cluster.is_empty else page.rect) & page.rect
        crop = os.path.join(ROOT, "_work", "crop70b_%s_%d.png" % (tag, idx))
        page.get_pixmap(clip=box, dpi=300).save(crop)
        print("  line %d -> p%d (%d/%d label skeletons), ink cluster %s, %d drawings, crop %s"
              % (line, n + 1, score, len(needles),
                 "%.0fx%.0f pt" % (cluster.width, cluster.height) if not cluster.is_empty else "none",
                 len(page.get_drawings()), os.path.basename(crop)))
    doc.close()
