"""Which pictures write `looseness`, and what else sits in that option list?

`to[...]` ignores keys it does not know, so a looseness the author asked for can be silently
dropped from a curve that still converts -- this reads the raw option lists to see how many
curves a fidelity fix would touch, and whether any of them are in the 27 still-quoted pictures.
"""
import collections
import glob
import re

FORM = re.compile(r"looseness\s*=\s*([-+0-9.]+)")
BRACKET = re.compile(r"(?:to|edge)\s*\[([^\]]*looseness[^\]]*)\]")
ANY = re.compile(r"looseness\s*=\s*[-+0-9.]+")

counts = collections.Counter()
brackets = collections.Counter()
files = collections.Counter()
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    hits = ANY.findall(src)
    if not hits:
        continue
    name = path.rsplit("/", 1)[-1][:-4]
    files[name] += len(hits)
    for m in FORM.finditer(src):
        counts[m.group(1)] += 1
    for m in BRACKET.finditer(src):
        brackets[re.sub(r"\s+", " ", m.group(1)).strip()] += 1

print("looseness values:", dict(counts), "total", sum(counts.values()))
print("papers:", len(files), files.most_common(6))
print("option lists carrying it:")
for spec, n in brackets.most_common(12):
    print("  %2d  %s" % (n, spec[:110]))
