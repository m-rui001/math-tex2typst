r"""Read back the two stacked lines above figure 1 of the spectral-gap paper.

The whole-corpus gauge (_work/probe_stacked_cell_page.py) joins a line's words and looks for the
joined string, so an inline formula between two words makes a false miss. Three of its five misses are
settled that way; this one is not: the `\Downarrow` row of that figure. Ask the page directly whether
each of its two lines is there, and print the surrounding text either way.
"""
import glob
import os
import re
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

NEEDLES = [r"entropyinequality", r"choosethen", r"terminalgapongoodpaths",
           r"Varianceonbadpaths", r"Downarrow"]


def main():
    path = glob.glob(os.path.join(ROOT, "typst", "A-spectral-gap-*", "main.pdf"))[0]
    doc = fitz.open(path)
    for i, page in enumerate(doc):
        flat = re.sub(r"\s+", "", page.get_text())
        for needle in NEEDLES:
            k = flat.find(needle)
            if k >= 0:
                print("p%-3d %-28s -> …%s…" % (i + 1, needle, flat[max(0, k - 30):k + 40]))
    doc.close()


if __name__ == "__main__":
    main()
