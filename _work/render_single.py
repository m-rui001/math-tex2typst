"""Render one page of a generated Typst PDF to PNG for the eye to check.

The figure captions carry the numbering we bake in, and whether Typst adds its own prefix is only
visible on the page: `python _work/render_single.py _work/_figchk/<paper>/main.pdf "Figure 1"`.
"""
import sys
from pathlib import Path

import pymupdf

pdf, needle = Path(sys.argv[1]), sys.argv[2]
doc = pymupdf.open(str(pdf))
page = next((p for p in doc if needle in p.get_text()), None)
if page is None:
    print("no page contains %r" % needle)
else:
    out = Path("_work", "single.png")
    page.get_pixmap(matrix=pymupdf.Matrix(2, 2)).save(str(out))
    print("%s  page %d of %d" % (out, page.number + 1, len(doc)))
