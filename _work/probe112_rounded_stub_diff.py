r"""#89 改动面: the same source strings through the emitter, before and after the rounding law.

Per the standing rule a round's churn is measured by diffing the OLD law's canvases against the NEW
law's on ONE base (`_work/probe_macro_canvas_diff.py`'s census is the same shape): this walks every
tikzpicture in `_work/flat/*.tex`, calls `cetz.build` on exactly the string the batch hands it, and
writes the canvases to `_work/rounded_canvases_<tag>.json`.  Run it once before the edit and once
after; the second run prints how many canvases changed, how many papers that is, and which.

Everything else in the emitter must stay byte-identical, so a change outside the six papers that write
`rounded corners` on a polyline is a regression, not a fix.
"""
import io
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
tag = sys.argv[1] if len(sys.argv) > 1 else "now"
out_path = os.path.join(HERE, "rounded_canvases_%s.json" % tag)

canvases = {}
for name in sorted(os.listdir(os.path.join(ROOT, "_work", "flat"))):
    if not name.endswith(".tex"):
        continue
    text = io.open(os.path.join(ROOT, "_work", "flat", name),
                   encoding="utf-8", errors="replace").read()
    for i, pic in enumerate(PIC.findall(text)):
        canvases["%s#%d" % (name[:-4], i)] = cetz.build(pic)

io.open(out_path, "w", encoding="utf-8").write(json.dumps(canvases, ensure_ascii=False))
drawn = sum(1 for v in canvases.values() if v)
print("tag=%s pictures=%d drawn=%d -> %s" % (tag, len(canvases), drawn, out_path))

base_path = os.path.join(HERE, "rounded_canvases_old.json")
if tag != "old" and os.path.exists(base_path):
    base = json.loads(io.open(base_path, encoding="utf-8").read())
    changed = [k for k in base if base.get(k) != canvases.get(k)]
    papers = sorted({k.split("#")[0] for k in changed})
    gone = [k for k in changed if canvases.get(k) is None]
    print("changed canvases=%d over %d papers, of which refused now=%d"
          % (len(changed), len(papers), len(gone)))
    for k in changed:
        print("  %s" % k)
