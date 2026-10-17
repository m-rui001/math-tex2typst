r"""Which channel really carries pandoc's escaped punctuation -- canvas or body?

`_work/probe94_escape_face.py` split the product on its own, and its canvas rows (78 `\/` over 2 papers)
need to be read with the scanner #93 established: `probe93_product_scan.canvases()` walks the `{...}`
argument of every `#cetz.canvas(` with brace counting.  This asks one question per paper: does a maths
string carrying an escaped punctuation sit inside a canvas, or is it a body equation?

  python _work/probe94_channel_split.py > _work/m94_split.txt
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # the #93 canvas walker, unchanged

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TY = os.path.join(ROOT, "typst")
ESC = re.compile(r"\\[/()\[\]|]")

papers = ["Virtual-compact-specialness-of-hyperbolic-one-relator-groups-September-25-2026",
          "Cutoff-throughout-the-high-temperature-Sherrington-Kirkpatrick-phase-September-24-2026"]
for d in papers:
    path = os.path.join(TY, d, "main.typ")
    text = open(path, encoding="utf-8", errors="replace").read()
    inside = set()
    for c in canvases(text):
        for m in re.finditer(r"\$[^$]*\$", c):
            inside.add(m.group(0))
    allspans = re.findall(r"\$[^$]*\$", text)
    esc_all = [s for s in allspans if ESC.search(s)]
    esc_canvas = [s for s in esc_all if s in inside]
    print("\n%s" % d)
    print("   maths strings %d   carrying an escaped punctuation: all=%d  inside a canvas=%d"
          % (len(allspans), len(esc_all), len(esc_canvas)))
    print("   bare `/`: all=%d  inside a canvas=%d"
          % (len([s for s in allspans if re.search(r"(?<!\\)/", re.sub(r'"[^"\n]*"', "", s))]),
             len([s for s in esc_canvas if re.search(r"(?<!\\)/", re.sub(r'"[^"\n]*"', "", s))])))
    for s in esc_canvas[:3]:
        print("      canvas: %s" % re.sub(r"\s+", " ", s)[:100])
    for s in [x for x in esc_all if x not in inside][:3]:
        print("      body  : %s" % re.sub(r"\s+", " ", s)[:100])
