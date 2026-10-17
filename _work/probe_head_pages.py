"""Do the new heads actually paint, and on which page? A rendered-PDF measurement.

The guard counts `mark:` in the Typst source; that only says the converter asked for a head. This
reads the generated PDF back with fitz and counts the paths a CeTz head leaves: a *filled* drawing
whose box is head-sized (5.67pt long, 2.8-4.5pt high -- what `_work/probe_mark_per_side.py` measured
for `symbol: ">>"` at `length: 0.2cm`, hollow or filled alike). Zero such paths on a paper the census
says gained heads would mean the mark compiled but painted nothing.
"""
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(errors="replace")

NAMES = [
    "Turn-Based-Stochastic-Mean-Payoff-Games",
    "Strict-convexity-and-differentiability-of-the-planar-exponential",
    "Cutoff-throughout-the-high-temperature-Sherrington-Kirkpatrick-p",
    "Deforming-hypersymplectic-four-manifolds-to-hyperkahler-triples",
    "The-Unique-Games-Theorem",
]


def main():
    for want in NAMES:
        dirs = [d for d in os.listdir(os.path.join(ROOT, "typst")) if d.startswith(want)]
        if not dirs:
            print("%-42s NO SUCH DIR" % want[:42])
            continue
        name = dirs[0]
        pdf = os.path.join(ROOT, "typst", name, "main.pdf")
        if not os.path.exists(pdf):
            print("%-42s no main.pdf" % name[:42])
            continue
        d = fitz.open(pdf)
        pages = []
        for i, page in enumerate(d):
            n = 0
            for x in page.get_drawings():
                r = x["rect"]
                if 4.0 <= r.width <= 7.5 and 2.0 <= r.height <= 5.0 and x.get("fill") is not None:
                    n += 1
            if n:
                pages.append((i + 1, n))
        d.close()
        total = sum(n for _p, n in pages)
        print("%-44s pages=%d heads=%d  by page=%s"
              % (name[:44], len(pages), total, pages[:8]))


if __name__ == "__main__":
    main()
