"""Which papers carry the newly-mapped symbols inside a CeTz canvas, and on which page."""
import os
import re
import sys

NEW = [
    "arrow.b.double", "arrow.t.double", "union", "without", "arrow.r.bar",
    "arrow.r.twohead", "arrow.l.curve", "arrow.r.double.bar", "tack.r.double",
    "dagger.double", "i.dot",
]
TYPST = os.path.join("typst")

hits = {}
for paper in sorted(os.listdir(TYPST)):
    src = os.path.join(TYPST, paper, "main.typ")
    if not os.path.isfile(src):
        continue
    text = open(src, encoding="utf-8").read()
    for m in re.finditer(r"#cetz\.canvas\(\{.*?\n\}\)", text, re.S):
        body = m.group(0)
        found = [w for w in NEW if "$" + w in body or "(" + w + ")" in body or "{" + w + "}" in body]
        for w in found:
            hits.setdefault(w, []).append(paper)

for w in NEW:
    papers = hits.get(w, [])
    print("%-22s %d" % (w, len(papers)))
    for p in papers[:3]:
        print("    ", p[:70])
