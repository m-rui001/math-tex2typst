"""Shoot the page a converted picture lands on, by a phrase inside that drawing.

`shot_figures.py` points at a page through a following caption, which appendix diagrams often do not
have. A node's own text is in the PDF, so search for it and render that page instead.

Usage: python _work/shot_page_word.py <paper-prefix> <phrase> [page-no]
"""
import glob
import sys

import fitz

prefix, phrase = sys.argv[1], sys.argv[2]
pdf = glob.glob("typst/%s*/main.pdf" % prefix)
if not pdf:
    sys.exit("no main.pdf under typst/%s*" % prefix)
doc = fitz.open(pdf[0])
force = int(sys.argv[3]) if len(sys.argv) > 3 else None

pages = [i for i, page in enumerate(doc) if phrase in page.get_text()]
pick = [force] if force is not None else pages[:1]
if not pick:
    sys.exit("%r found on no page of %s (%d pages)" % (phrase, pdf[0], doc.page_count))
for i in pick:
    pix = doc[i].get_pixmap(dpi=130)
    name = "_work/shot_%s_p%d.png" % (prefix[:24], i + 1)
    pix.save(name)
    print("%s -> page %d of %d hits" % (name, i + 1, len(pages)))
