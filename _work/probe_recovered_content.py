# Static, typst-free: for the flat files the patched flatten enlarges, show what
# was previously dropped -- TikZ pictures, environments, and math constructs.
import os
import re
import sys
from collections import Counter

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
import inventory as inv

FLAT = os.path.join(inv.ROOT, "_work", "flat")

PICTURE = re.compile(r"\\begin\{tikzpicture\}")
ENV = re.compile(r"\\begin\{([a-zA-Z*]+)\}")
MACRO = re.compile(r"\\(?:foreach|pgfmathsetmacro|pgfmathparse|begin\{scope\}|clip|draw|node)\b")

tot = Counter()
for paper in sorted(os.listdir(inv.PREPRINTS)):
    d = os.path.join(inv.PREPRINTS, paper)
    if not os.path.isdir(d):
        continue
    cand = inv.candidates(d)
    old_p = os.path.join(FLAT, paper + ".tex")
    if not cand or not os.path.exists(old_p):
        continue
    old = inv.read(old_p)
    new = inv.flatten(cand[0], set(), [], os.path.dirname(cand[0]))
    if len(new) <= len(old):
        continue
    # the recovered tail is not a contiguous slice, so compare by construct counts
    dc = Counter(ENV.findall(new)) - Counter(ENV.findall(old))
    pics = len(PICTURE.findall(new)) - len(PICTURE.findall(old))
    marks = len(MACRO.findall(new)) - len(MACRO.findall(old))
    tot["papers"] += 1
    tot["pictures"] += max(pics, 0)
    print("%s\n  +%d chars, +%d tikzpicture, envs %s, +%d draw/foreach/scope marks"
          % (paper[:70], len(new) - len(old), pics,
             dict((k, v) for k, v in dc.items() if v > 0) or "-", marks))

print("\nrecovered across %d papers: %d tikzpictures" % (tot["papers"], tot["pictures"]))
