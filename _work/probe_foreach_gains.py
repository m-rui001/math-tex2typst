"""Which papers hold a foreach picture that the run converted.

The foreach fix is a picture-level change, so the sample screenshots have to come from
the papers whose drawings only became canvases after it: their report must show more
conversions than the quoted pictures they no longer carry.
"""
import glob
import json
import os
import re

rows = []
for path in sorted(glob.glob(os.path.join("_work", "flat", "*.tex"))):
    stem = os.path.splitext(os.path.basename(path))[0]
    tex = open(path, encoding="utf-8", errors="replace").read()
    if "\\foreach" not in tex:
        continue
    rp = os.path.join("typst", stem, "report.json")
    if not os.path.exists(rp):
        continue
    rep = json.load(open(rp, encoding="utf-8"))
    blob = json.dumps(rep)
    conv = len(re.findall(r"cetz_converted", blob))
    refused = len(re.findall(r"cetz_refused", blob))
    if conv and not refused:
        rows.append((conv, stem))
rows.sort(reverse=True)
print("papers with foreach pictures and no refusal: %d" % len(rows))
for conv, stem in rows[:8]:
    print("  %2d  %s" % (conv, stem[:60]))
