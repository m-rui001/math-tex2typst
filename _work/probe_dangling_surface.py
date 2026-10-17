r"""Dangling references and the two ways they can still show on the page.

An unresolved \ref should read `[??]`, the way LaTeX prints a label that never stepped a counter;
pandoc's own bracket `\[fig:chords\]` is leftover TeX and must not survive. Both numbers come
straight off the generated tree, so the ledger's `dangling_ref` count can be checked against them.
"""
import collections
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
LEAK = re.compile(r"\\\[[a-zA-Z]+:[a-zA-Z0-9_-]+\\\]")
WHOA = re.compile(r"\[\?\?\]")

ledger = collections.Counter()
papers = collections.Counter()
for rep in sorted((ROOT / "typst").glob("*/report.json")):
    s = (json.loads(rep.read_text(encoding="utf-8")).get("stats") or {})
    n = int(s.get("dangling_ref", 0))
    if n:
        ledger["dangling_ref"] += n
        papers[rep.parent.name] = n

leaks = pages = whoa = 0
for typ in sorted((ROOT / "typst").glob("*/main.typ")):
    text = typ.read_text(encoding="utf-8", errors="replace")
    leaks += len(LEAK.findall(text))
    whoa += len(WHOA.findall(text))
    if LEAK.search(text):
        pages += 1

print("ledger dangling_ref: %d over %d papers" % (ledger["dangling_ref"], len(papers)))
print("on the page: %d `[??]`, %d pandoc-bracket leaks over %d papers" % (whoa, leaks, pages))
print("worst: %s" % papers.most_common(6))
