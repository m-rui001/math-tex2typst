r"""Page 1 of our build against page 1 of the author's PDF, for the papers whose title
still carries TeX macros. The title block is where \$\\C\$ style residue lands in the PDF,
so the screenshot is the check that a metric number means anything.

Run: python _work/shot_titles.py <paper-prefix>...   -> _work/titles.png
"""
import pathlib
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "_work" / "titles.png"


def first_page(pdf, label):
    if not pdf.exists():
        print("%s: missing %s" % (label, pdf))
        return None
    doc = pymupdf.open(str(pdf))
    pix = doc[0].get_pixmap(matrix=pymupdf.Matrix(1.1, 1.1))
    doc.close()
    return pix


def main():
    prefixes = sys.argv[1:] or ["A-universal-group-of-t"]
    for prefix in prefixes:
        src = next((p for p in (ROOT / "preprints").iterdir()
                    if p.name.startswith(prefix)), None)
        if src is None:
            print("no preprint for %s" % prefix)
            continue
        ours = ROOT / "typst" / src.name / "main.pdf"
        theirs = next(iter(sorted(src.glob("*.pdf"))), None)
        for pix, pdf, label in ((first_page(theirs, "source"), theirs, "src"),
                                (first_page(ours, "ours"), ours, "typst")):
            if pix is None:
                continue
            out = ROOT / "_work" / ("title_%s_%s.png" % (prefix[:18], label))
            pix.save(str(out))
            print("%s: %s" % (label, out))


main()
