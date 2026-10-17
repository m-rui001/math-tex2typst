r"""Sweep every generated canvas for a Typst call written inside content brackets without '#'.

`_work/probe_node_box.py` found that a canvas body is *content* mode: `[box(stroke: ...)]` printed
its own source instead of drawing. The emitter has the same shape for a tilted node label,
`content((x, y), [rotate(-90deg)[t]])`. Math calls inside `$...$` are legal without '#', so maths
spans are cut first; the remaining names are the page-level functions the emitter writes.
"""
import glob
import io
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")

MATH = re.compile(r"\$[^$]*\$")
# names Typst resolves as content functions -- a bare one of these inside [...] is literal text
KNOWN = r"rotate|text|box|block|linebreak|emph|strong|underline|overline|align|stack|grid"
BARE = re.compile(r"(?<![#\w])(%s)\(" % KNOWN)
HASHED = re.compile(r"#(%s)\(" % KNOWN)

bare = Counter()
hashed = Counter()
sample = {}
lines = 0
for path in sorted(glob.glob("typst/*/main.typ")):
    for line in open(path, encoding="utf-8"):
        s = line.strip()
        if not re.match(r"^(content|line|path|rect|circle|grid|arc|bezier)\(", s):
            continue
        lines += 1
        body = MATH.sub("", s[s.index("["):]) if "[" in s else ""
        for m in BARE.finditer(body):
            bare[m.group(1)] += 1
            sample.setdefault(m.group(1), (body[max(0, m.start() - 12):m.start() + 40],
                                           path.replace("\\", "/").split("/")[-2][:40]))
        for m in HASHED.finditer(body):
            hashed[m.group(1)] += 1

print("canvas lines scanned: %d" % lines)
print("calls written with '#'  : %s" % dict(hashed))
print("calls written WITHOUT '#' (literal on the page): %s" % dict(bare))
for name, (ctx, paper) in sample.items():
    print("  %-9s %-52s %s" % (name, ctx, paper))
