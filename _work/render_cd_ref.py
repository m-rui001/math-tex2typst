"""Render the PDF page of a CD diagram so the source decides what @. draws.

Run: python _work/render_cd_ref.py [paper-prefix] [text-to-find]
"""
import pathlib
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1]


def main():
    prefix = sys.argv[1] if len(sys.argv) > 1 else "Unrestricted-pro-modularity"
    needle = sys.argv[2] if len(sys.argv) > 2 else "forget factors"
    d = next(p for p in (ROOT / "preprints").iterdir() if p.name.startswith(prefix))
    pdf = next(p for p in d.glob("*.pdf"))
    doc = pymupdf.open(pdf)
    for i, page in enumerate(doc):
        if needle in page.get_text():
            pix = page.get_pixmap(matrix=pymupdf.Matrix(2.2, 2.2))
            out = ROOT / "_work" / "cd_ref.png"
            pix.save(out)
            print("page %d of %s -> %s (%dx%d)" % (i, pdf.name, out.name, pix.width, pix.height))
            return
    print("not found on any page of %s" % pdf.name)


if __name__ == "__main__":
    main()
