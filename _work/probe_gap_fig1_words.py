r"""Read the word gaps of figure 1's rows on the real page, before and after a change.

A controlled two-cell document did not settle whether a `set par(justify: false)` written around the
grid reaches a table's cells -- it changed the number but in the wrong direction, which means the toy
is not modelling the real layout (the real table's columns are over-constrained by a long formula).
So measure the page that started the question: print every word and every inter-word gap of the rows
of that figure, and let the same reading after a rebuild say whether the fix did anything.
"""
import glob
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NEEDLES = ("Weighted-mean", "Ordinary rarity", "Directional covariance", "entropy inequality",
           "Total remaining")


def main():
    pdf = glob.glob(os.path.join(ROOT, "typst", "A-spectral-gap-*", "main.pdf"))[0]
    doc = fitz.open(pdf)
    for pno, page in enumerate(doc, 1):
        rows = {}
        for w in page.get_text("words"):
            rows.setdefault(round((w[1] + w[3]) / 2.0), []).append(w)
        for key in sorted(rows):
            ws = sorted(rows[key], key=lambda w: w[0])
            text = " ".join(w[4] for w in ws)
            if not any(n in text for n in NEEDLES):
                continue
            gaps = [round(b[0] - a[2], 1) for a, b in zip(ws, ws[1:])]
            print("p%d y%-6.1f x%-6.1f..%-6.1f  %s\n        gaps %s"
                  % (pno, key, ws[0][0], ws[-1][2], text[:96], gaps))
    doc.close()


if __name__ == "__main__":
    main()
