r"""Crop the band a flagged word pair sits in, at 300 dpi, and list the words inside it.

`_work/word_overlap_report.py` reports two words whose boxes coincide, together with the top-left of
the first one (`'Visible:'/'on'@381,156`). That is either a CeTz placement bug -- the engine does not
measure glyph widths -- or an artefact of how fitz splits one math atom into words, and only the page
settles which. So crop around the reported coordinate and read the words out.

usage: python _work/crop_words.py <paper-dir-prefix> <page> <x> <y> [out.png]
"""
import glob
import io
import os
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SPAN = 60.0


def main():
    prefix, page_no = sys.argv[1], int(sys.argv[2])
    x, y = float(sys.argv[3]), float(sys.argv[4])
    out = (sys.argv[5] if len(sys.argv) > 5
           else os.path.join(ROOT, "_work", "crop_words.png"))
    hits = glob.glob(os.path.join(ROOT, "typst", prefix + "*"))
    if len(hits) != 1:
        print("prefix %r matches %d papers" % (prefix, len(hits)))
        return
    doc = fitz.open(os.path.join(hits[0], "main.pdf"))
    page = doc[page_no - 1]
    clip = fitz.Rect(x - SPAN, y - SPAN / 3, x + SPAN, y + SPAN / 3)
    for w in page.get_text("words"):
        if fitz.Rect(w[:4]).intersects(clip):
            print("  %-26s x %7.2f y %7.2f  block %d/%d"
                  % (w[4][:26], w[0], w[1], w[5], w[6]))
    print("%d drawings on the page" % len(page.get_drawings()))
    page.get_pixmap(dpi=300, clip=clip).save(out)
    print("%s -> %s" % (os.path.basename(hits[0])[:40], out))


if __name__ == "__main__":
    main()
