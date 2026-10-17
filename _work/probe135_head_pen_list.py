r"""Which pictures fix a HEAVY pen on their own brackets -- the page leg's candidate list.

`_work/probe125_head_pen_width_face.py` counts the head's width as a loss; the page-side check needs
the few heaviest of them, because a 12pt head moves a node's border half a rule (0.2pt for `thick`)
is worth verifying where the ink is thick enough for a 300 dpi crop to see it at all.  One line per
picture: paper, the head's spelling, the weight it prices, and how many rules the canvas now carries
at that weight.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TH = re.compile(r"thickness: ([0-9.]+)pt")

from t2t import cetz

rows = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        if not m:
            continue
        head, _pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
        if not head:
            continue
        want = cetz.pen_width_pt(head)
        if want is None or want <= 0.4001:
            continue
        got = cetz.build(pic)
        if got is None:
            rows.append((fn[:-4], round(want, 3), "REFUSED", 0, 0))
            continue
        th = [float(x) for x in TH.findall(got)]
        rows.append((fn[:-4], round(want, 3),
                     "carries" if th and max(th) >= want * 0.9 else "LOSES",
                     len([t for t in th if t >= want * 0.9]), len(th)))
rows.sort(key=lambda r: -r[1])
print("head fixes a pen above pgf's default: %d pictures" % len(rows))
for r in rows:
    print("   %-62s head=%-7s %-8s rules=%s/%s" % r)
