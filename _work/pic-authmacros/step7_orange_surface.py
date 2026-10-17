r"""Blast radius of the one colour value the patch corrects.

`cetz.RGB["orange"]` is mixed into every canvas that names orange, so the count of pictures that do
is the count of pages whose ink shifts. Read-only over the flat sources.
"""
import os
import re

flat = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "_work", "flat")
span = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
hits = []
for fn in sorted(os.listdir(flat)):
    if not fn.endswith(".tex"):
        continue
    src = open(os.path.join(flat, fn), encoding="utf-8", errors="replace").read()
    n = sum(len(re.findall(r"orange", p)) for p in span.findall(src))
    if n:
        hits.append((fn[:-4][:70], n))
print("papers whose pictures name orange: %d, occurrences: %d" % (len(hits), sum(n for _, n in hits)))
for h in hits:
    print("  ", h)
