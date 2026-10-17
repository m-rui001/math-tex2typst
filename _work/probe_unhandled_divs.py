# What the pipeline throws away as unhandled block environments, corpus-wide.
# `unhandled_div_class:<name>` is a report.json stat per paper; each hit means a whole
# environment's body was dropped, which can also remove labels and pictures.
import collections
import glob
import io
import json
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

classes = collections.Counter()
papers = collections.Counter()
hits = collections.defaultdict(list)

for rep in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "report.json"))):
    d = json.load(open(rep, encoding="utf-8"))
    name = os.path.basename(os.path.dirname(rep))
    st = d.get("stats") or {}
    for k, v in st.items():
        if not k.startswith("unhandled_div_class:"):
            continue
        cls = k.split(":", 1)[1]
        classes[cls] += v
        papers[cls] += 1
        if len(hits[cls]) < 3:
            hits[cls].append((v, name[:42]))

print("unhandled block environments: %d classes, %d occurrences, %d paper-slots"
      % (len(classes), sum(classes.values()), sum(papers.values())))
for cls, n in classes.most_common():
    print("  %-22s %5d over %3d papers   %s" % (cls, n, papers[cls], hits[cls]))

# does the class even exist as an environment in the flat source?
src = open(os.path.join(ROOT, "_work", "flat", "Uniform-marked-polygon-estimates-and-sharp-finite-bridge-moments-September-26-2026.tex"), encoding="utf-8", errors="replace").read()
for cls in ("auxlemma", "auxproposition"):
    blocks = re.findall(r"\\begin\{%s\}.*?\\end\{%s\}" % (cls, cls), src, re.S)
    labels = sum(len(re.findall(r"\\label\{", b)) for b in blocks)
    print("flat %s: %d blocks, %d labels inside them, %d chars"
          % (cls, len(blocks), labels, sum(len(b) for b in blocks)))
