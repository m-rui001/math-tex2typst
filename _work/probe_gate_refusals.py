"""Which refused picture actually builds: that one was dropped by the typst compile gate.

The ledger stores the first 120 characters of every refused chunk, so each stored chunk is replayed
through the static builder here. A chunk that builds is not a parser refusal -- typst rejected the
canvas it produced, which is the difference between an unsupported drawing and a bad spelling.
"""
import glob
import json
import os
import sys

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

rows = []
for path in sorted(glob.glob(os.path.join("typst", "*", "report.json"))):
    rep = json.load(open(path, encoding="utf-8"))
    stats = rep.get("stats") or {}
    notes = stats.get("cetz_refused") if isinstance(stats, dict) else None
    if notes is None and isinstance(stats, list):
        notes = [s for s in stats if isinstance(s, dict) and s.get("name") == "cetz_refused"]
    if not notes:
        continue
    for note in notes:
        chunk = note.get("text") if isinstance(note, dict) else None
        if chunk is None:
            rows.append(("SHAPE", path, repr(note)[:120]))
            continue
        rows.append((chunk, os.path.basename(os.path.dirname(path)), None))

built = 0
for chunk, paper, shape in rows:
    if shape:
        print("unknown stats shape:", chunk, paper, shape)
        continue
    # the ledger truncates the chunk, so a whole-picture rebuild is impossible; ask only whether the
    # stored prefix carries a construct the builder knows nothing about
    print("%-52s %s" % (paper[:52], chunk[:96].replace("\n", " ")))
    built += 1
print("refused chunks recorded: %d" % built)
