r"""Are `table.cell` / `rowspan:` / `table.header` still printed anywhere in the corpus?

The broad page scan (`_work/probe_code_on_pages.py`) hits prose like "the rows and columns: choose …"
and real code listings (`def grid():` in a Python appendix), so it cannot settle #65.  These four
needles are different: no English sentence contains `table.cell` or `rowspan: 1`, and no code listing
in a maths paper writes `table.header`.  Any hit is Typst call syntax printed as text.
"""
import glob
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NEEDLES = ["table.cell", "rowspan:", "colspan:", "table.header", "columns: 2", "inset: 4pt"]


def main():
    pages = papers = 0
    for pdf in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.pdf"))):
        stem = os.path.basename(os.path.dirname(pdf))
        doc = fitz.open(pdf)
        hits = []
        for pno in range(len(doc)):
            text = doc[pno].get_text()
            found = [w for w in NEEDLES if w in text]
            if found:
                hits.append("p%d %s" % (pno + 1, ",".join(found)))
        doc.close()
        if hits:
            pages += len(hits)
            papers += 1
            print("  %-56s %s" % (stem[:54], "; ".join(hits[:3])))
    print("pages carrying Typst table call syntax: %d in %d papers" % (pages, papers))


if __name__ == "__main__":
    main()
