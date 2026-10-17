r"""#89 seam test: does splitting a rounded run into `line` + `arc` items show on the page?

The SLE corridor is a 12pt pen turning a 12pt corner, and the product page shows a white bite at the
inner edge of the junction (`_work/corner119_5.png`). Three canvases on one page, same corner:
A = the items as the emitter writes them now, B = the same items bolted into one `merge-path`,
C = the sharp polyline this round replaced. Cropped at 300 dpi and looked at.
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m89d")
os.makedirs(TMP, exist_ok=True)

PEN = "stroke: (paint: rgb(\"#dfe7ee\"), thickness: 12pt)"
SPLIT = ("  line((0, 0), (3.5767, 0), %s)\n"
         "  arc((3.5767, 0), start: -180deg, stop: -270deg, radius: 0.4233cm, %s)\n"
         "  line((4, 0.4233), (4, 4), %s)\n" % (PEN, PEN, PEN))
MERGED = ("  merge-path({\n"
          "    line((6, 0), (9.5767, 0))\n"
          "    arc((9.5767, 0), start: -180deg, stop: -270deg, radius: 0.4233cm)\n"
          "    line((10, 0.4233), (10, 4))\n"
          "  }, %s)\n" % PEN)
SHARP = "  line((12, 0), (16, 0), (16, 4), %s)\n" % PEN

src = ['#import "@preview/cetz:0.5.0"',
       '#set page(width: 18cm, height: 8cm, margin: 0cm)',
       '#set text(size: 8pt)',
       '#cetz.canvas({\n  import cetz.draw: *',
       '  content((1.8, 4.6), [A split])',
       '  content((7.8, 4.6), [B merged])',
       '  content((13.8, 4.6), [C sharp])',
       SPLIT + MERGED + SHARP + "})"]
typ = os.path.join(TMP, "m89d.typ")
open(typ, "w", encoding="utf-8").write("\n".join(src) + "\n")
pdf = os.path.join(TMP, "m89d.pdf")
if os.path.exists(pdf):
    os.remove(pdf)
r = subprocess.run(["typst", "compile", "--root", ROOT, "m89d.typ"], cwd=TMP,
                   capture_output=True, text=True, encoding="utf-8", errors="replace")
if r.returncode or not os.path.exists(pdf):
    print(r.stdout[-1500:])
    print(r.stderr[-1500:])
    sys.exit(1)
doc = fitz.open(pdf)
page = doc[0]
print("pages=%d size=%.0fx%.0fpt" % (doc.page_count, page.rect.width, page.rect.height))
for i, block in enumerate(page.get_text("blocks")):
    print("  label %d at y=%.0f: %s" % (i, block[1], block[4].strip()[:20]))
for i, rect in enumerate([fitz.Rect(0, 0, 160, 227), fitz.Rect(140, 0, 330, 227),
                          fitz.Rect(310, 0, 500, 227)]):
    out = os.path.join(ROOT, "_work", "seam89d_%d.png" % i)
    page.get_pixmap(dpi=300, clip=rect).save(out)
    print("-> %s" % os.path.basename(out))
print("arc ink bbox check")
for d in page.get_drawings():
    if any(it[0] == "c" for it in d["items"]):
        print("  curve drawing rect=%s" % d["rect"])
