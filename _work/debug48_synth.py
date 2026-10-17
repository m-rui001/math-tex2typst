r"""Why does the page gauge read 0 on a page where a shaft runs straight through a word?

`_work/probe30_cd_control.py` draws exactly that and the gauge says nothing, so one of the gauge's own
filters is failing on the synthetic page.  This prints each stage in the order the gauge applies them:
the drawings as fitz hands them over (items, count, rect), which of them became tips, which became
shafts, the spans and their ink clusters, and the clip interval for the one pair that must hit.
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import fitz  # noqa: E402
import probe30_cd_page as gauge  # noqa: E402

pdf = os.path.join(ROOT, "_work", "_m48control", "synth.pdf")
doc = fitz.open(pdf)
page = doc[0]
print("== drawings")
for d in page.get_drawings():
    kinds = [i[0] for i in d["items"]]
    print("   %-14s rect %s  even_odd=%s close=%s"
          % (" ".join(kinds), [round(v, 2) for v in d["rect"]],
             d.get("even_odd"), d.get("closePath")))
    for item in d["items"]:
        print("        %s" % (item[1:],))
print("== tips/shafts")
tips, lines = [], []
for d in page.get_drawings():
    items = [i for i in d["items"] if i[0] == "l"]
    if len(d["items"]) != len(items):
        continue
    if 2 <= len(items) <= 4 and d["rect"].width <= gauge.TIP_PT and d["rect"].height <= gauge.TIP_PT:
        tips.append(d["rect"])
    elif len(items) == 1:
        lines.append((items[0][1], items[0][2]))
print("   tips %s" % [[round(v, 2) for v in r] for r in tips])
print("   lone lines %s" % [[(round(p.x, 2), round(p.y, 2)) for p in s] for s in lines])
print("   shafts_of() -> %s" % [tuple(round(v, 2) for v in s) for s in gauge.shafts_of(page)])
print("== spans and their ink")
paths = [fitz.Rect(d["rect"]) for d in page.get_drawings()]
for b in page.get_text("dict")["blocks"]:
    for line in b.get("lines", []):
        for s in line["spans"]:
            r = fitz.Rect(s["bbox"])
            ink = [p for p in paths if r.x0 - 1 <= (p.x0 + p.x1) / 2 <= r.x1 + 1
                   and r.y0 - 1 <= (p.y0 + p.y1) / 2 <= r.y1 + 1]
            print("   %-12r box %s  ink-under-box %d %s"
                  % (s["text"], [round(v, 2) for v in r], len(ink),
                     [[round(v, 2) for v in p] for p in ink[:4]]))
print("== crossings() -> %r" % (gauge.crossings(page),))
