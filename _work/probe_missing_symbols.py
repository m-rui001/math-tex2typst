"""Which control words in a picture's maths have no Typst spelling.

`_math_body` keeps the name of every command it cannot map and quotes it, so the page prints the
word itself. This replays the lookup over the node maths of every flattened picture and counts the
names the table is missing, most-needed first.
"""
import collections
import glob
import os
import re
import sys

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

MATHSPAN = re.compile(r"\$([^$]*)\$")
WORD = re.compile(r"\\([a-zA-Z]+)")

missing = collections.Counter()
papers = collections.defaultdict(set)
for path in sorted(glob.glob(os.path.join("_work", "flat", "*.tex"))):
    stem = path.split(os.sep)[1]
    tex = open(path, encoding="utf-8", errors="replace").read()
    for pic in re.finditer(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", tex, re.S):
        for m in MATHSPAN.finditer(pic.group(0)):
            for w in WORD.findall(m.group(1)):
                if "\\" + w not in cetz.MATH_SYMBOLS:
                    missing[w] += 1
                    papers[w].add(stem)

print("unmapped commands in picture maths: %d distinct, %d uses" % (len(missing), sum(missing.values())))
for w, n in missing.most_common(30):
    print("  %-22s %4d uses  %3d papers" % (w, n, len(papers[w])))
