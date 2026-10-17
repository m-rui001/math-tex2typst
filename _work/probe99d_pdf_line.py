# -*- coding: utf-8 -*-
r"""Page reading for A's 12:23 gate: is `\(A_C(F)\ge3\)\hspace{15mm}Hilbert` fused on the page?

Reads the *shipped* PDF (`typst/The-normalized-volume-gap…/main.pdf`, built 2026-10-14 22:29 by B's
own round, and this paper is not in A's run141 list, so it is current).  No typst is opened.

  python _work/probe99d_pdf_line.py
"""
import glob
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main():
    pdfs = glob.glob(os.path.join(ROOT, "typst", "The-normalized-volume-gap*", "main.pdf"))
    if not pdfs:
        print("no pdf")
        return 1
    import fitz
    doc = fitz.open(pdfs[0])
    for pno, page in enumerate(doc):
        t = page.get_text()
        if "Hilbert duality" not in t:
            continue
        j = t.index("Hilbert duality")
        print("page %d  text: %r" % (pno + 1, t[max(0, j - 46):j + 26]))
        words = page.get_text("words")
        prev = None
        for w in words:
            if w[4].startswith("Hilbert"):
                x0 = w[0]
                for v in words:
                    if v[2] <= x0 + 0.01 and v[3] > w[1] - 4 and v[1] < w[3] + 4:
                        if prev is None or v[2] > prev[2]:
                            prev = v
                print("  word 'Hilbert' x0=%.2f ; previous word %r x1=%.2f ; gap=%.2fpt"
                      % (x0, prev[4] if prev else None, prev[2] if prev else -1,
                         (x0 - prev[2]) if prev else -1))
                break
        return 0
    print("line not found")
    return 1


if __name__ == "__main__":
    sys.exit(main())
