"""Which control-word names reach the page as plain text.

When a node's maths holds a command with no spelling, the converter keeps the command's own name as
the label, so the page shows `Downarrow` instead of the arrow. This counts those names across the
generated corpus: the words that appear most are the ones the symbol table still lacks.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

# a quoted word inside a canvas: the label a lost command leaves behind
LEAK = re.compile(r"content\([^)]*?\[\s*\"([A-Za-z]{2,})\"\s*\]")

counts = {}
papers = {}
for path in sorted(glob.glob(os.path.join("typst", "*", "main.typ"))):
    typ = open(path, encoding="utf-8").read()
    stem = path.split(os.sep)[1]
    for m in LEAK.finditer(typ):
        w = m.group(1)
        counts[w] = counts.get(w, 0) + 1
        papers.setdefault(w, set()).add(stem)
known = {k[1:] for k in cetz.MATH_SYMBOLS}
rows = sorted(counts.items(), key=lambda kv: -kv[1])
print("distinct leaked words: %d ; occurrences: %d ; papers touched: %d"
      % (len(rows), sum(counts.values()), len({p for s in papers.values() for p in s})))
for w, n in rows[:25]:
    print("  %-22s %3d  in %2d papers   %s" % (w, n, len(papers[w]),
                                               "in table" if "\\" + w in known or w in known else "MISSING"))
