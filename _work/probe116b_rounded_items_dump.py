r"""Why the page gauge sees only some of a merged run's corners: dump the item sequences.

For one page, print every drawing that carries a bezier: its type (fill/stroke), the item-type string
(`l`/`c` in path order), and for each bezier chain whether a line item borders it in the same drawing.
"""
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPER = "Eventual-Categoricity-for-Abstract-Elementary-Classes-September-24-2026"
PAGE = 71
doc = fitz.open(os.path.join(ROOT, "typst", PAPER, "main.pdf"))
page = doc[PAGE - 1]
for n, d in enumerate(page.get_drawings()):
    kinds = "".join(i[0] for i in d["items"])
    if "c" not in kinds:
        continue
    print("drawing %d type=%s even_odd=%s items=%s" % (n, d["type"], d.get("even_odd"), kinds))
    for i, item in enumerate(d["items"]):
        if item[0] == "c":
            print("   c%d %s -> %s" % (i, (round(item[1].x, 2), round(item[1].y, 2)),
                                       (round(item[4].x, 2), round(item[4].y, 2))))
        else:
            print("   l%d %s -> %s" % (i, (round(item[1].x, 2), round(item[1].y, 2)),
                                       (round(item[2].x, 2), round(item[2].y, 2))))
