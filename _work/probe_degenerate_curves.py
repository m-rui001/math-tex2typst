"""Which pictures now build because a degenerate curve draws nothing instead of refusing?

A curve is degenerate when it starts and ends at the same coordinate. The name-matching here is
deliberately loose -- the builder decides, the regex only points at candidates -- and the picture
the looseness came from is asked directly, so a flip is measured, not assumed.
"""
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SAME = re.compile(r"\(([^)]+)\)\s*(?:to|edge)\s*(?:\[[^\]]*\])?\s*\(\1\s*\)")
LOOP = re.compile(r"\bloop\b")

SRC = "_work/flat/Translative-covering-densities-of-order-n-log-n-September-23-2026.tex"
target = PIC.findall(open(SRC, encoding="utf-8", errors="replace").read())[1]
print("the looseness picture builds:", bool(cetz.build(target)))

emitted = refused = 0
flips = []
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    for i, m in enumerate(PIC.finditer(src)):
        pic = m.group(0)
        got = SAME.search(pic) or LOOP.search(pic)
        if not got:
            continue
        built = cetz.build(pic)
        emitted += 1 if built else 0
        refused += 0 if built else 1
        if built and len(flips) < 10:
            flips.append((path.rsplit("/", 1)[-1][:-4], i,
                          re.sub(r"\s+", " ", pic[max(0, got.start() - 40):got.end() + 30])))

print("candidate pictures (a repeated endpoint or a `loop` key) that build now:", emitted)
print("still refusing:", refused)
for name, idx, frag in flips:
    print("  %-52s pic %d  %s" % (name[:52], idx, frag[:96]))
