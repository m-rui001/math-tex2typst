r"""Render a page band of a product PDF at 300 dpi so the eye can settle a table question.

Two pages need looking at: A-spectral-gap's figure 1, where #64 turned a leaked `\&` blob into a real
Typst table, and one of the 83 papers whose captionless table #65 was printing as call syntax.  Text
extraction already says the code words are gone; what it cannot say is whether the table is now drawn
as a table -- borders, columns, the caption under it -- so print the band as an image.
"""
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def crop(stem, page, y0, y1, name):
    pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
    doc = fitz.open(pdf)
    p = doc[page - 1]
    rect = fitz.Rect(0, p.rect.height * y0, p.rect.width, p.rect.height * y1)
    pix = p.get_pixmap(dpi=300, clip=rect)
    out = os.path.join(ROOT, "_work", name)
    pix.save(out)
    doc.close()
    print("wrote %s (%dx%d) from %s p%d" % (out, pix.width, pix.height, stem[:40], page))


def main():
    crop(sys.argv[1], int(sys.argv[2]), float(sys.argv[3]), float(sys.argv[4]), sys.argv[5])


if __name__ == "__main__":
    main()
