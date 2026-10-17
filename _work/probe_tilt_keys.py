"""Which tilt keys block a picture, and what the tilted scope holds.

Measured through cetz.build, so a refusal is the real stage decision and not a keyword table.
"""
import collections
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
KEYS = re.compile(r"\b(rotate around|rotate|xslant|yslant|cm|transform shape)\s*=")
BASIS = re.compile(r"\b[xy]\s*=\s*\{?\(")

keys = collections.Counter()
papers = collections.Counter()
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        if not (KEYS.search(pic) or BASIS.search(pic)):
            continue
        if cetz.build(pic) is not None:
            continue  # draws anyway: the tilt was inside node text or a style we never reach
        for k in set(KEYS.findall(pic)):
            keys[k] += 1
        if BASIS.search(pic):
            keys["x=/y= basis"] += 1
        papers[tex.stem[:40]] += 1

print("refused pictures that tilt the plane: %d over %d papers"
      % (sum(papers.values()), len(papers)))
for k, n in keys.most_common():
    print("  %-16s %d" % (k, n))
for name, n in papers.most_common(8):
    print("  %2d  %s" % (n, name))
