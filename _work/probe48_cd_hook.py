r"""How many tikzcd arrows in the corpus use a hook, and with which spelling?

The normal in `build_cd` is about to change side, which moves every arrow's label, its bend and its
hook barb.  Labels and bends are measured against tikz-cd (`_work/measure48_cd_bend.py`); a hook needs
its own count first -- a spelling the corpus never writes is not this round's problem, and one it writes
a hundred times is (`_work/probe48_cd_hook.py` reads the same CD spans the converter is handed).
"""
import collections
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
FLAT = os.path.join(os.path.dirname(HERE), "_work", "flat")
CD = re.compile(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", re.S)
ARROW = re.compile(r"\\(?:arrow|r|ar)\[([^\]]*)\]")

count = collections.Counter()
papers = collections.Counter()
for name in sorted(os.listdir(FLAT)):
    if not name.endswith(".tex"):
        continue
    src = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
    for span in CD.findall(src):
        for spec in ARROW.findall(span):
            for part in (p.strip() for p in spec.split(",")):
                if "hook" in part:
                    count[part] += 1
                    papers[name[:-4]] += 1
print("hook spellings inside tikzcd arrows:", sum(count.values()), "in",
      len(papers), "papers")
for spelling, n in count.most_common():
    print("   %-24s %d" % (spelling, n))
