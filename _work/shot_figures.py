"""Render the page a CeTz picture lands on, so a converted drawing can be looked at.

A picture that parses is not a picture that is right: the caption is the only text near a
canvas that the PDF still carries, so it points at the page to shoot. Run after a batch,
when typst/ holds that run's pdfs.

Usage: python _work/shot_figures.py <paper-prefix> [page-count]
"""
import glob
import re
import sys

import fitz

prefix = sys.argv[1]
count = int(sys.argv[2]) if len(sys.argv) > 2 else 1

typ = glob.glob("typst/%s*/main.typ" % prefix)
pdf = glob.glob("typst/%s*/main.pdf" % prefix)
if not typ or not pdf:
    sys.exit("no main.typ/main.pdf under typst/%s*" % prefix)

source = open(typ[0], encoding="utf-8", errors="replace").read()
CAPTION = re.compile(r"caption:\s*\[((?:[^\[\]]|\[[^\[\]]*\])*)\]", re.S)
captions = [(m.start(), re.sub(r"[#$\[\]\\]", " ", m.group(1))) for m in CAPTION.finditer(source)]

shots = 0
for canvas in list(re.finditer(r"#cetz\.canvas\(", source))[:count * 4]:
    after = [c for c in captions if c[0] > canvas.start()]
    if not after:
        continue
    # "Figure 1: " is what a sentence in the running text also says, so the caption is
    # found by its own words and not by the word that names it
    words = re.sub(r"^\s*(Figure|Table)\s*\d+\s*[:.]\s*", "", after[0][1]).strip()
    if not words:
        continue
    phrase = " ".join(words.split()[:6])[:60]
    doc = fitz.open(pdf[0])
    for pno, page in enumerate(doc):
        if page.search_for(phrase):
            out = "_work/shot_%s_p%d.png" % (prefix[:24], pno + 1)
            page.get_pixmap(dpi=150).save(out)
            print("%s  page %d  caption %r" % (out, pno + 1, words[:70]))
            shots += 1
            break
    doc.close()
    if shots >= count:
        break
if not shots:
    print("no caption page found for %s" % prefix)
