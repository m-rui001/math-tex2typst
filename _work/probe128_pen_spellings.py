r"""#90 ledger leg: which spellings of the two pen keys does the corpus actually use?

The name tables in `cetz.py` carry four arms each (`butt`/`round`/`rect`->square/`square`, and
`miter`/`round`/`bevel`), but the products show only `cap: "round"` (1,556) / `"butt"` (3) and
`join: "round"` (1,157) / `"miter"` (13) -- no `square`, no `bevel`.  Before writing that into 轴 72
it is worth reading the SOURCE side directly: every distinct value the authors write for the two keys,
counted over the flat pictures, plus the values the parser hands `CAP_NAME`/`JOIN_NAME`.
"""
import collections
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

from t2t import cetz

caps = collections.Counter()
joins = collections.Counter()
papers_cap = collections.Counter()
papers_join = collections.Counter()
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        for v in re.findall(r"line cap\s*=\s*([a-zA-Z]+)", pic):
            caps[v] += 1
            papers_cap[fn[:-4]] += 1
        for v in re.findall(r"line join\s*=\s*([a-zA-Z]+)", pic):
            joins[v] += 1
            papers_join[fn[:-4]] += 1

print("=== source-side values written inside tikzpictures")
print("   line cap=  %s  (papers=%d)" % (dict(caps), len(papers_cap)))
print("   line join= %s  (papers=%d)" % (dict(joins), len(papers_join)))
print("=== what the emitter's name tables make of them")
print("   CAP_NAME covers: %s" % {k: cetz.CAP_NAME.get(k) for k in caps})
print("   JOIN_NAME covers: %s" % {k: cetz.JOIN_NAME.get(k) for k in joins})
