"""How many figure labels are emitted as quoted text instead of maths?

A canvas label that maths conversion could not parse is spliced in as $"..."$, which Typst prints
as literal text -- so `_{c_b}` and `nu _b` reach the page. Count those across typst/*/main.typ and
show which LaTeX they came from.
"""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
QUOTED = re.compile(r'\[\$"([^"]*)"\$\]')

files = sorted((ROOT / "typst").glob("*/main.typ"))
hits = collections.Counter()
papers = set()
samples = []
for path in files:
    text = path.read_text(encoding="utf-8", errors="replace")
    for m in QUOTED.finditer(text):
        body = m.group(1)
        papers.add(path.parent.name)
        hits["any"] += 1
        if "_{" in body or re.search(r"(^| )\\?[a-z]+ _", body):
            hits["subscript-shaped"] += 1
            if len(samples) < 25:
                samples.append("%s  %s" % (path.parent.name[:46], body[:60]))
        if "\\" in body:
            hits["keeps-a-backslash"] += 1

print("main.typ files scanned:", len(files))
for k, v in hits.most_common():
    print("  %-22s %d in %d papers" % (k, v, len(papers)))
print("\n-- subscript-shaped labels --")
print("\n".join(samples))
