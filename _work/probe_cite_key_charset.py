r"""The character set of every bib key in the corpus, and the notes of the three maths cites.

The lifted citation travels through the maths converter as an upright token made of its mode letter
and its keys, so a key with a character outside that token alphabet -- or a TeX-special note -- would
leak as the token instead of becoming a citation. This reads the keys the papers actually use.
"""
import collections
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BIB = re.compile(r"@\w+\s*\{\s*([^,{}\s]+)")
ALPHA = re.compile(r"[A-Za-z0-9_.:+-]")

counts = collections.Counter()
odd = []
seen = set()
for name in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    path = os.path.join(ROOT, "typst", name, "refs.bib")
    if not os.path.exists(path):
        continue
    for key in BIB.findall(io.open(path, encoding="utf-8", errors="replace").read()):
        if key in seen:
            continue
        seen.add(key)
        rest = "".join(c for c in key if not ALPHA.match(c))
        for c in rest:
            counts[c] += 1
        if rest:
            odd.append((name[:40], key, rest))
print("distinct bib keys: %d" % len(seen))
print("characters outside [A-Za-z0-9_.:+-]: %s" % dict(counts))
for name, key, rest in odd[:20]:
    print("   %-40s %s  (%s)" % (name, key, " ".join("%02x" % ord(c) for c in rest)))
