r"""Render named pages of product PDFs to PNG so they can be looked at."""
import os
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for arg in sys.argv[1:]:
    stem, num = arg.rsplit(":", 1)
    pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
    doc = pymupdf.open(pdf)
    try:
        page = doc[int(num) - 1]
        out = os.path.join(ROOT, "_work", "look_%s_p%s.png" % (stem[:28], num))
        page.get_pixmap(dpi=170).save(out)
        print(out)
    finally:
        doc.close()
