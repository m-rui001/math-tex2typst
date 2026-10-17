r"""Render the control PDFs to PNG so the drawing TeX makes can be looked at.

fitz reads the vector output directly; the pictures are what the author's macros expand to in real
TeX, which is the reference the CeTz canvas has to match.
"""
import sys
import fitz

for name in ("m_cylinder", "m_gff", "m_peps"):
    doc = fitz.open("_work/pic-authmacros/%s.pdf" % name)
    page = doc[0]
    pix = page.get_pixmap(matrix=fitz.Matrix(2.2, 2.2), clip=page.rect)
    pix.save("_work/pic-authmacros/%s.png" % name)
    print(name, page.rect, "->", pix.width, "x", pix.height)
