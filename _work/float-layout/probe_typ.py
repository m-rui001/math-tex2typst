r"""Print the generated typst around each empty float, wide enough to see the material above it.

`probe_empty_where.py` only classifies the 260 characters before the mark; whether the canvas is
inside a block adjacent to the float or merely nearby needs the block structure.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
TYPST = os.path.join(ROOT, "typst")
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)

PAPERS = sys.argv[1:]
for stem in sorted(os.listdir(TYPST)):
    if PAPERS and not any(stem.startswith(p) for p in PAPERS):
        continue
    path = os.path.join(TYPST, stem, "main.typ")
    if not os.path.isfile(path):
        continue
    typ = open(path, encoding="utf-8", errors="replace").read()
    for m in EMPTY.finditer(typ):
        print("=" * 90)
        print("%s  at %d" % (stem, m.start()))
        print(typ[max(0, m.start() - 3000):m.start() + 700])
