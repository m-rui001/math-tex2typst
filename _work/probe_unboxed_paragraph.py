r"""Product scan: CeTz nodes whose label is a paragraph set as one unbroken line.

`content(...)` bodies that are not a `#box(` have no measure, so Typst sets the whole label on one
line. In pgf that only happens when the author wrote no `text width` and no `align` -- and then the
node would have run off his own page too. A long one is therefore a `text width` we dropped.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NODE = re.compile(r"^\s*content\((?:\([^)]*\)|[^,]+), \[(?!#box\()(.*?)\]\s*(?:,.*)?\)\s*$")
BOXED = re.compile(r"#box\(")

hits = {}
for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
    stem = os.path.basename(os.path.dirname(path))
    for n, line in enumerate(open(path, encoding="utf-8"), 1):
        if BOXED.search(line) or not line.lstrip().startswith("content("):
            continue
        m = NODE.match(line)
        if m is None:
            continue
        body = m.group(1)
        plain = re.sub(r"#text\([^)]*\)\[|\]|\\?linebreak\(\)", "", body)
        if len(plain) >= 110:
            hits.setdefault(stem, []).append((n, len(plain)))

total = sum(len(v) for v in hits.values())
print("nodes %d in %d papers" % (total, len(hits)))
for stem, rows in sorted(hits.items(), key=lambda kv: -len(kv[1])):
    print("  %-62s %d  %s" % (stem[:62], len(rows), [c for _, c in rows][:6]))
