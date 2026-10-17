r"""Look at the two canvases the `node distance` fix was supposed to eat, at 300 dpi, beside TikZ.

The face count (`_work/label100_face.txt`: on-ink 14 -> 12 rows / 12 -> 10 canvases) says the two
rows left the census; a count is not a picture. This renders exactly those two canvases through the
census's own `render` (one canvas per page, the paper's own prelude for the body font size), crops
each to its ink at 300 dpi, and puts the pdflatex control page of the same picture beside it --
`_work/cmp/<stem>-<k>.pdf`, written by the control leg that just ran.

  python _work/probe100k_fixed_crops.py      # -> _work/m100k_*.png
"""
import os
import re
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe81_label_box_face as g  # noqa: E402
from probe100i_page_pair import ink_box  # noqa: E402

CMP = os.path.join(HERE, "cmp")
# the two canvases the fix moved -- named by prefix and resolved against `typst/`, because a paper
# directory's date suffix is not something to write from memory
FIXED = [("The-Grothendieck-homotopy-hypothesis-via-elementary-expansions", 4),
         ("Relative-independence-of-the-separable-quotient-problem", 0)]
DPI = 300.0 / 72.0


def stem_for(prefix):
    hits = [d for d in os.listdir(os.path.join(ROOT, "typst")) if d.startswith(prefix)]
    assert len(hits) == 1, (prefix, hits)
    return hits[0]


def crop(pdf, out):
    doc = fitz.open(pdf)
    page = doc[0]
    box = ink_box(page)
    if box.is_empty:
        doc.close()
        return "no ink"
    box = fitz.Rect(box.x0 - 6, box.y0 - 6, box.x1 + 6, box.y1 + 6) & page.rect
    page.get_pixmap(matrix=fitz.Matrix(DPI, DPI), clip=box).save(out)
    doc.close()
    return "%dx%d pt -> %s" % (box.width, box.height, os.path.basename(out))


def main():
    sys.stdout.reconfigure(errors="replace")
    canv = g.canvases()
    for prefix, k in FIXED:
        stem = stem_for(prefix)
        if (stem, k) not in canv:
            print("%s#%d  NOT IN THE CENSUS POPULATION" % (stem[:40], k))
            continue
        head, canvas = canv[(stem, k)]
        got = g.render(canvas, "m100k", head)
        san = re.sub(r"[^A-Za-z0-9]", "_", stem)[:40]
        for label, pdf in (("ours", got[2] if got else None),
                           ("ctl", os.path.join(CMP, "%s-%d.pdf" % (san, k)))):
            if not pdf or not os.path.isfile(pdf):
                print("%s#%d  %-5s NO PAGE" % (stem[:40], k, label))
                continue
            out = os.path.join(HERE, "m100k_%s-%d-%s.png" % (san[:28], k, label))
            print("%s#%d  %-5s %s" % (stem[:40], k, label, crop(pdf, out)))
    for name in os.listdir(g.TMP):
        if name.startswith("m100k"):
            os.remove(os.path.join(g.TMP, name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
