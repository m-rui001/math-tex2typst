"""Render the author's own page, by a phrase inside the drawing, for side-by-side comparison.

`shot_page_word.py` does this for our generated PDF; the reference render lives at
preprints/<paper>/<paper>.pdf and its page numbers differ from ours, so a phrase is the pointer.

Usage: python _work/shot_reference.py <paper-prefix> <phrase> [page-no]
"""
import glob
import sys

import pymupdf

prefix, phrase = sys.argv[1], sys.argv[2]
pdfs = glob.glob("preprints/%s/%s.pdf" % (prefix, prefix)) or glob.glob("preprints/%s*/*.pdf" % prefix)
if not pdfs:
    sys.exit("no author pdf for preprints/%s*" % prefix)
doc = pymupdf.open(pdfs[0])
force = int(sys.argv[3]) if len(sys.argv) > 3 else None
pages = [i for i, page in enumerate(doc) if phrase in page.get_text()]
if force is not None:
    pages = [force - 1]
if not pages:
    sys.exit("phrase not found in %s (%d pages)" % (pdfs[0], len(doc)))
page = doc[pages[0]]
out = "_work/ref_%s_p%d.png" % (prefix[:28], pages[0] + 1)
page.get_pixmap(dpi=150).save(out)
print(out, " page %d of %d hits in %s" % (pages[0] + 1, len(pages), pdfs[0]))
