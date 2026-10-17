r"""Why does fitz report a 3cm bend as spanning thousands of units?

Prints the page box, the transform `get_drawings` used, and the raw content stream of the already
rendered `_bc/flat_45.pdf`, so the unit that the curve readings are in can be read off the file
itself instead of assumed.
"""
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_bc", "flat_45.pdf")

doc = fitz.open(PATH)
page = doc[0]
print("rect", page.rect, "rotation", page.rotation)
print("mediabox", page.mediabox, "cropbox", page.cropbox)
for d in page.get_drawings():
    print("path type=%s width=%s items=%d" % (d["type"], d.get("width"), len(d["items"])))
    for item in d["items"]:
        print("   ", item[0], [(round(p.x, 3), round(p.y, 3)) for p in item[1:]])
print("--- content stream ---")
for xref in page.get_contents():
    print(doc.xref_stream(xref).decode("latin-1")[:900])
