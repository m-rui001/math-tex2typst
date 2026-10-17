"""Recompile the papers whose picture maths uses a newly added spelling.

One picture went from converted to refused between two runs, and the static builder still says it
builds, so the typst compile gate is what rejected it. Each candidate paper is run through the real
pipeline here, and the canvas plus typst's own error is printed for the one that refuses.
"""
import glob
import json
import os
import re
import sys

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz
import batch_typst

NAMES = [r"\Downarrow", r"\Uparrow", r"\cup", r"\setminus", r"\mapsto", r"\twoheadrightarrow",
         r"\curvearrowleft", r"\rightrightarrows", r"\Vdash", r"\ddagger", r"\i"]
NEEDLE = re.compile("|".join(re.escape(n) for n in NAMES))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

cands = []
for path in sorted(glob.glob(os.path.join("_work", "flat", "*.tex"))):
    tex = open(path, encoding="utf-8", errors="replace").read()
    if any(NEEDLE.search(p.group(0)) for p in PIC.finditer(tex)):
        stem = os.path.splitext(os.path.basename(path))[0]
        rp = os.path.join("typst", stem, "report.json")
        before = json.load(open(rp, encoding="utf-8"))["stats"].get("cetz_refused", 0) if os.path.exists(rp) else -1
        cands.append((stem, path, before))

print("candidates: %d" % len(cands))
for stem, path, before in cands:
    got = batch_typst.run((stem, __import__("pathlib").Path(path)))
    after = json.load(open(os.path.join("typst", stem, "report.json"), encoding="utf-8"))["stats"]
    flag = "  <-- CHANGED" if after.get("cetz_refused", 0) != before else ""
    print("%-50s refused %s -> %s  converted %s%s"
          % (stem[:50], before, after.get("cetz_refused", 0), after.get("cetz_converted", 0), flag))
