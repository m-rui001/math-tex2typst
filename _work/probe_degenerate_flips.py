"""Which pictures now build because a degenerate curve draws nothing instead of refusing?

A curve is degenerate when its endpoints are the same coordinate name or the same numbers; this
reads the raw `to[`/`edge[`/`bcontrols` spellings, asks the new build, and reports the pictures that
carry such a curve and emit.
"""
import collections
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end{tikzpicture}", re.S)
# (a) to[...] (a)  /  (a) edge[...] (a)  with the same coordinate on both sides
SAME = re.compile(r"\(([^)]+)\)\s*(?:to|edge)\s*(?:\[[^\]]*\])?\s*\((\1)\)")

CHR = r""
emitted = refused = 0
flips = []
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    for i, m in enumerate(PIC.finditer(src)):
        pic = m.group(0)
        if not SAME.search(pic):
            continue
        built = cetz.build(pic)
        emitted += 1 if built else 0
        refused += 0 if built else 1
        if built and len(flips) < 8:
            flips.append((path.rsplit("/", 1)[-1][:-4], i, SAME.findall(pic)[0][0]))

print("pictures with a repeated-endpoint curve that build now:", emitted)
print("still refusing:", refused)
for name, idx, frag in flips:
    print("  %-58s pic %d  %s" % (name[:58], idx, frag[:60]))
