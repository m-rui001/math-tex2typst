r"""For one figure page, compare each drawn rectangle with the text it is supposed to hold.

fitz gives both: `page.get_drawings()` carries the box's rectangle, `page.get_text("dict")`
carries every span's bbox.  A border that crosses a span is a sizing failure of the box; a
span that a *line* crosses is an edge routed without the node's real extent.  The two have
different fixes, so the audit has to tell them apart.
"""
import glob
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main():
    sys.stdout.reconfigure(errors="replace")
    pat, page_no = sys.argv[1], int(sys.argv[2])
    d = fitz.open(glob.glob(os.path.join(ROOT, "typst", pat, "main.pdf"))[0])
    p = d[page_no - 1]
    boxes = []
    lines = []
    for dr in p.get_drawings():
        for item in dr["items"]:
            if item[0] == "l":
                lines.append((item[1], item[2]))
            elif item[0] == "re":
                boxes.append(fitz.Rect(item[1]))
        if dr["rect"].width > 4 and dr["rect"].height > 4:
            boxes.append(fitz.Rect(dr["rect"]))
    spans = []
    for blk in p.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                if sp["text"].strip():
                    spans.append((fitz.Rect(sp["bbox"]), sp["text"].strip()))
    print("page %d: %d rectangles, %d line segments, %d spans"
          % (page_no, len(boxes), len(lines), len(spans)))

    spill = [(sr, t) for r in boxes for (sr, t) in spans
             if sr.intersects(r) and not (r.x0 - 0.6 <= sr.x0 and sr.x1 <= r.x1 + 0.6
                                          and r.y0 - 0.6 <= sr.y0 and sr.y1 <= r.y1 + 0.6)]
    print("spans that stick out of a box they overlap: %d" % len(spill))
    for sr, t in spill[:8]:
        print("   %-28s %s" % (repr(t)[:28], sr))
    # an edge crossing letters: it enters and leaves the span's box, so its middle is
    # inside while neither end is -- an arrow that merely touches a border is not this
    hit = []
    for (l0, l1) in lines:
        for (sr, t) in spans:
            mid = fitz.Point((l0.x + l1.x) / 2, (l0.y + l1.y) / 2)
            if sr.contains(mid) and not sr.contains(l0) and not sr.contains(l1):
                hit.append((l0, l1, t))
    print("line segments crossing through a span's box: %d" % len(hit))
    for l0, l1, t in hit[:10]:
        print("   %-28s (%.0f,%.0f)-(%.0f,%.0f)" % (repr(t)[:28], l0.x, l0.y, l1.x, l1.y))


if __name__ == "__main__":
    main()
