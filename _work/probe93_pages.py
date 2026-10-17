r"""#93 page-side account: how many slash GLYPHS do the product pages carry?

TeX's `/` in a node label reaches a Typst canvas as a FRACTION, and a fraction is drawn as two
lines under a bar -- there is no slash GLYPH in it.  So the count of `/` characters in the rendered
page text is a direct read of the shape on the page: today it is one per slash the author wrote
anywhere else (URLs, prose), and every canvas slash is missing.  The same count after the regen is
the receipt, per paper, because only canvas maths changes between the two runs -- body prose in the
same paper is untouched by the round, so an increase is the shipped glyph and nothing else.

Read-only against `typst/<paper>/main.pdf` with fitz; no typst, no tools/.  The paper list is the
face `_work/probe93_slash_classes2.py` measured (the emission dump `_work/m93_slash_sites2.tsv`).

  python _work/probe93_pages.py > _work/m93_pages_before.tsv
  python _work/probe93_pages.py > _work/m93_pages_after.tsv
"""
import collections
import os
import sys

import pymupdf

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

FACES = os.path.join(ROOT, "_work", "m93_slash_sites2.tsv")
TY = os.path.join(ROOT, "typst")

wanted = collections.Counter()
for line in open(FACES, encoding="utf-8"):
    parts = line.rstrip("\n").split("\t")
    if len(parts) >= 2 and parts[0] != "paper":
        wanted[parts[0]] += 1

dirs = {}
for name in os.listdir(TY):
    for stem in wanted:
        if name.startswith(stem[:40]) or name == stem:
            dirs.setdefault(stem, name)

print("paper\tslashes_in_sites\tpages\tslashes_on_page")
for stem in sorted(wanted):
    name = dirs.get(stem)
    if name is None:
        print("%s\t%d\tNO DIR\t-" % (stem, wanted[stem]))
        continue
    pdf = os.path.join(TY, name, "main.pdf")
    if not os.path.exists(pdf):
        print("%s\t%d\tNO PDF\t-" % (stem, wanted[stem]))
        continue
    doc = pymupdf.open(pdf)
    total = 0
    for pno in range(doc.page_count):
        total += doc[pno].get_text().count("/")
    doc.close()
    print("%s\t%d\t%d\t%d" % (stem, wanted[stem], pno + 1, total))
