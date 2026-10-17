"""How many pictures in the corpus ask for a node anchor, and what spelling do we emit?"""
import glob
import re
import sys
import collections

sys.path.insert(0, "tools")
from t2t import cetz

CHUNK = re.compile(r"\\begin{tikzpicture}(.*?)\\end{tikzpicture}", re.S)

counts = collections.Counter()
papers = collections.Counter()
examples = []
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    name = path.split("/")[-1][:-4]
    for i, m in enumerate(CHUNK.finditer(src)):
        built = cetz.build(m.group(0))
        if built is None:
            continue
        got = re.findall(r'anchor: "[a-z- ]*"', built)
        for g in got:
            counts[g] += 1
        if got:
            papers[name] += 1
            if len(examples) < 12:
                lines = [line.strip() for line in built.splitlines()
                         if "anchor" in line]
                examples.append((name, i, lines[:2]))

print("emitted anchor spellings:", dict(counts), "total", sum(counts.values()))
print("papers carrying one:", len(papers), papers.most_common(8))
for name, idx, lines in examples:
    print("--", name, "pic", idx)
    for line in lines:
        print("   ", line)
