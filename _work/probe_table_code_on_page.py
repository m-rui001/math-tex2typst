r"""Do the products that start a line with `table(` print Typst code on the page?

`b_table` with no caption returns the grid as its own top-level line, and a top-level Typst document is
markup: `table(` there is the word `table` followed by text, not a call -- only inside `#figure(`'s
argument list, or after a `#`, is it code.  The census split is by spelling: `table(` at column 0 is
`b_table`'s no-caption path, `[table(` is `figure_content` wrapping a grid inside a content block.
Both are then read back off the rendered page of a paper that has them, looking for the words a call
would never print (`columns:`, `table.cell`, `inset: 4pt`).
"""
import glob
import os
import re
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CODE_WORDS = ["table.cell", "columns:", "inset: 4pt", "table.header"]


def census():
    top, inside, papers = 0, 0, set()
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        for line in open(path, encoding="utf-8", errors="replace"):
            s = line.rstrip("\n")
            if s.startswith("table("):
                top += 1
                papers.add(stem)
            elif "[table(" in s:
                inside += 1
    return top, inside, len(papers)


def pages_with_code(stems):
    for stem in stems:
        pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
        if not os.path.exists(pdf):
            continue
        doc = fitz.open(pdf)
        hits = []
        for pno in range(len(doc)):
            text = doc[pno].get_text()
            for w in CODE_WORDS:
                if w in text:
                    hits.append("p%d: %s" % (pno + 1, w))
        doc.close()
        print("  %-58s %s" % (stem[:56], "; ".join(hits) or "clean -- renders as a table"))


def main():
    top, inside, npapers = census()
    print("products: `table(` at column 0 -> %d lines in %d papers | `[table(` -> %d lines"
          % (top, npapers, inside))
    # the papers counted at column 0, plus the one figure case we just produced
    sample = []
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        if any(l.startswith("table(") for l in open(path, encoding="utf-8", errors="replace")):
            sample.append(os.path.basename(os.path.dirname(path)))
        if len(sample) >= 5:
            break
    print("page check on the first five of them:")
    pages_with_code(sample)


if __name__ == "__main__":
    main()
