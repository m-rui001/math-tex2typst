"""Render the page of a paper where a roman operator name prints, to check letter spacing.

Usage: python _work/shot_upright.py <paper-prefix> <word>
"""
import sys
import glob

import fitz

prefix, word = sys.argv[1], sys.argv[2]
pdfs = glob.glob("typst/%s*/main.pdf" % prefix)
if not pdfs:
    print("no pdf for %s" % prefix)
    sys.exit(1)
doc = fitz.open(pdfs[0])
for pno, page in enumerate(doc):
    hits = page.search_for(word)
    if not hits:
        continue
    r = hits[0]
    if len(sys.argv) > 3 and sys.argv[3] == "full":
        pix = page.get_pixmap(dpi=150)
    else:
        clip = fitz.Rect(r.x0 - 90, r.y0 - 26, max(r.x1 + 240, r.x0 + 330), r.y1 + 26)
        pix = page.get_pixmap(clip=clip, dpi=220)
    out = "_work/upright_%s_%s_p%d.png" % (prefix[:18], word, pno + 1)
    pix.save(out)
    print(out, "page", pno + 1, "hits", len(hits))
    break
else:
    print("word %r not found in %s" % (word, pdfs[0]))
