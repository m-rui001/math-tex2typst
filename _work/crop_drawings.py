r"""Crop the band a figure actually occupies on a product page, at a dpi that shows a tenth of a mm.

A 150 dpi whole page hides an 11pt overlap (the lesson behind §0's standing 「记得抽查图片」), so this
takes the union bounding box of the page's vector drawings -- a CeTz canvas is dozens of small paths,
and the text drawn by `content(...)` rides inside or just outside them -- pads it by 8pt for the labels
that hang off the box, and renders that rectangle at 300 dpi. `word` narrows the band to the lines
around a word, which is where an arrowhead sitting inside a letter shows up.

    python _work/crop_drawings.py Novikov-stem:8 BSD-stem:105 --dpi 300
"""
import io
import os
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

args = [a for a in sys.argv[1:] if not a.startswith("--")]
got = [a.split("=", 1)[1] for a in sys.argv[1:] if a.startswith("--dpi")]
dpi = int(got[0]) if got else 300

for arg in args:
    stem, num = arg.rsplit(":", 1)
    dirs = [d for d in os.listdir(os.path.join(ROOT, "typst"))
            if d.startswith(stem.rstrip(":"))]
    if not dirs:
        print("no paper dir starting with %s" % stem)
        continue
    pdf = os.path.join(ROOT, "typst", dirs[0], "main.pdf")
    doc = fitz.open(pdf)
    try:
        page = doc[int(num) - 1]
        boxes = [fitz.Rect(d["rect"]) for d in page.get_drawings()]
        if not boxes:
            print("%s p%s: no drawings" % (dirs[0][:40], num))
            continue
        r = boxes[0]
        for b in boxes[1:]:
            r |= b
        r = fitz.Rect(max(0, r.x0 - 8), max(0, r.y0 - 8),
                      min(page.rect.x1, r.x1 + 8), min(page.rect.y1, r.y1 + 8))
        out = os.path.join(ROOT, "_work", "fig_%s_p%s.png" % (dirs[0][:32], num))
        page.get_pixmap(dpi=dpi, clip=r).save(out)
        print("%s p%s  box=(%.1f, %.1f, %.1f, %.1f)  %s"
              % (dirs[0][:40], num, r.x0, r.y0, r.x1, r.y1, out))
    finally:
        doc.close()
