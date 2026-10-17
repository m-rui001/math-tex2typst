r"""Next-round candidate: does `line cap=` / `line join=` reach the product at all?

pgf ends every stroked subpath with the cap the picture asks for (`round` makes a 0.4pt pen look like
a dot at a lone point, and rounds the corner where two straight pieces meet), and Typst's `stroke`
dict carries the same two keys.  This counts the SOURCE spellings inside `tikzpicture` regions and the
emitted `cap:` / `join:` keys in the products, so the face of the gap is one reading.
"""
import glob
import io
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CAP = re.compile(r"line\s+cap\s*=\s*(round|rect|butt)")
JOIN = re.compile(r"line\s+join\s*=\s*(round|miter|bevel)")
EMIT = re.compile(r'\b(?:cap|join): "')


def count(paths, rx, in_pictures):
    hits = files = 0
    for p in paths:
        text = io.open(p, encoding="utf-8", errors="replace").read()
        blob = " ".join(PIC.findall(text)) if in_pictures else text
        n = len(rx.findall(blob))
        if n:
            hits += n
            files += 1
    return hits, files


flat = sorted(glob.glob(os.path.join(FLAT, "*.tex")))
prod = sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ")))
for name, rx in (("line cap", CAP), ("line join", JOIN)):
    n, f = count(flat, rx, True)
    print("%-10s source (in tikzpicture): %4d over %3d papers" % (name, n, f))
n, f = count(prod, EMIT, False)
print("%-10s product (`cap:`/`join:` keys): %4d over %3d papers" % ("emitted", n, f))
