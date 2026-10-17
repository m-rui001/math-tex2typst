"""Find the page carrying a drawing of a given fill colour and clip it tightly at 300 dpi."""
import pathlib
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = pathlib.Path(__file__).resolve().parents[1]
STEM, RGB, TAG = sys.argv[1], [int(v) / 255 for v in sys.argv[2].split(",")], sys.argv[3]

doc = pymupdf.open(str(ROOT / "typst" / STEM / "main.pdf"))
try:
    for n in range(len(doc)):
        page = doc[n]
        hits = []
        for path in page.get_drawings():
            fill = path.get("fill")
            if fill and all(abs(a - b) < 0.01 for a, b in zip(fill, RGB)):
                hits.append(path["rect"])
        if not hits:
            continue
        box = hits[0]
        for path in page.get_drawings():
            if path["rect"].intersects(box):
                box |= path["rect"]
        box = pymupdf.Rect(box.x0 - 10, box.y0 - 10, box.x1 + 10, box.y1 + 10) & page.rect
        print("page %d hits=%d box=%s empty=%s" % (n + 1, len(hits), box, box.is_empty))
        if box.is_empty:
            continue
        out = ROOT / "_work" / ("clip_%s_p%d.png" % (TAG, n + 1))
        page.get_pixmap(dpi=300, clip=box).save(str(out))
        print("page %d box=%s -> %s" % (n + 1, box, out.name))
finally:
    doc.close()
