"""Guard the arrow regeneration: did any paper lose a figure, and did the heads actually arrive?

Run as `... before`, then `... after` around `_work/regen_list.py`. It reads the same 150 papers from
`_work/regen_needed.txt` and counts, in each `main.typ`, the canvases drawn (`#cetz.canvas(`), the
LaTeX quoted instead of drawn (`#raw(block: true, lang: "latex")`) and the heads emitted (`mark: (`).
A canvas that turned into a quotation is a figure lost, so `canvases` must not fall; `marks` is what
the change was for, so it must rise by roughly the 185 canvases `_work/probe_arrow_yield.py` counted.
"""
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(errors="replace")
PHASE = sys.argv[1] if len(sys.argv) > 1 else "before"
NAMES = [l.strip() for l in open(os.path.join(ROOT, "_work", "regen_needed.txt"),
                                 encoding="utf-8") if l.strip()]

rows = {}
missing = []
for name in NAMES:
    path = os.path.join(ROOT, "typst", name, "main.typ")
    if not os.path.exists(path):
        missing.append(name)
        continue
    text = open(path, encoding="utf-8", errors="replace").read()
    rows[name] = (text.count("#cetz.canvas("),
                  text.count('#raw(block: true, lang: "latex")'),
                  text.count("mark: ("))
tot = [sum(r[i] for r in rows.values()) for i in (0, 1, 2)]
print("%s: papers %d (no main.typ: %d)  canvases %d  quoted-latex %d  marks %d"
      % (PHASE, len(rows), len(missing), tot[0], tot[1], tot[2]))
out = os.path.join(ROOT, "_work", "arrow_%s.json" % PHASE)
json.dump(rows, open(out, "w", encoding="utf-8"), indent=1)
print("wrote _work/arrow_%s.json" % PHASE)
