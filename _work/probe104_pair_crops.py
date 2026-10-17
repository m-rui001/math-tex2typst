r"""#104: the eight on-ink face rows, cropped at the crossing on BOTH pages, 300 dpi.

`probe100i` proved for the rows its pages can speak for that the two labels sit at the same offset on
our page and on the author's (`dx,dy` within ~1pt) while our *boxes* are taller -- 12.54pt against
10.91pt at an 11pt face, 10.26 against 8.97 at 9pt. A box is what fitz reports for text; 轴 62 already
ruled that Typst ships letters as letters, so the only ink truth is pixels. This leg asks the one
question the boxes cannot answer: do the two labels' LETTERS touch, on our page and on the control?

The frame is the same on both sides because both pages carry the same one-canvas drawing: the crop is
anchored at the pair's offset **from that page's own ink box** (`probe100i.ink_box`), the quantity
`probe100i` already prints as `pair at ink`. Where a page has several candidate pairings, every one of
them is cropped -- the repeated `block $A$` is a real ambiguity, not noise to hide.

  PYTHONIOENCODING=utf-8 python _work/probe104_pair_crops.py control152_rows.json
      # -> _work/label104_crops/NN_ours.png, NN_ctl.png  (look, then delete)

Gauge functions are imported from `probe100i` and `probe81`, never copied (轴 68).
"""
import io
import os
import re
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe81_label_box_face as g  # noqa: E402
import probe100i_page_pair as P  # noqa: E402

OUT = os.path.join(HERE, "label104_crops")
DPI = 300
PAD = 6.0


def crop(pdf, rect, name):
    """The window `rect` of this page, and nothing else, written at 300 dpi."""
    doc = fitz.open(pdf)
    page = doc[0]
    box = fitz.Rect(rect) + (-PAD, -PAD, PAD, PAD) & page.rect
    page.get_pixmap(clip=box, dpi=DPI).save(name)
    doc.close()
    return box


def main():
    sys.stdout.reconfigure(errors="replace")
    rows_file = sys.argv[1]
    face_path, mech_path, _ = P.paths(rows_file)
    rows = P.face_rows(face_path)
    pins = P.census_boxes(mech_path)
    canv = g.canvases()
    os.makedirs(OUT, exist_ok=True)
    lines = ["#104: on-ink pairs cropped at the crossing, ours vs the pdflatex control, %.0f dpi" % DPI]
    for n, (depth, stem, k, t1, t2, bad) in enumerate(rows):
        if bad:
            lines.append("\n### %s#%s  %s" % (stem[:44], k, bad))
            continue
        key = (stem, k)
        lines.append("\n### %02d %s#%s  row %s  %r vs %r" % (n, stem[:44], k, depth, t1, t2))
        if key not in canv:
            lines.append("  no canvas in the product")
            continue
        head, block = canv[key]
        got = g.render(block, "m104_%02d" % n, head)
        ours_pdf = got[2] if got else None
        san = re.sub(r"[^A-Za-z0-9]", "_", stem)[:40]
        ctl_pdf = os.path.join(P.CMP, "%s-%d.pdf" % (san, k))
        for label, pdf, pin in (("ours", ours_pdf, P.pin_for(pins, stem, k, t1, t2)),
                               ("ctl", ctl_pdf, None)):
            if not pdf or not os.path.isfile(pdf):
                lines.append("  %s  NO PAGE" % label)
                continue
            side = P.read(pdf, t1, t2, pin)
            for line in P.rel(side):
                lines.append("  %s  %s" % (label, line))
            doc = fitz.open(pdf)
            ink = P.ink_box(doc[0])
            doc.close()
            b1 = side.get("b1") if isinstance(side.get("b1"), list) else [side.get("b1")]
            b2 = side.get("b2") if isinstance(side.get("b2"), list) else [side.get("b2")]
            i = 0
            for c1 in [c for c in b1 if c]:
                for c2 in [c for c in b2 if c]:
                    box = fitz.Rect(c1[0]) | fitz.Rect(c2[0])
                    # the same window on every page: anchored at the pair's offset from the ink box
                    off = (box.x0 - ink.x0, box.y0 - ink.y0, box.x1 - ink.x0, box.y1 - ink.y0)
                    rect = fitz.Rect(ink.x0 + off[0], ink.y0 + off[1], ink.x0 + off[2], ink.y0 + off[3])
                    name = os.path.join(OUT, "%02d_%s%d.png" % (n, label, i))
                    i += 1
                    got_box = crop(pdf, rect, name)
                    lines.append("  %s  crop %s -> %s" % (label,
                                 "%.0fx%.0fpt" % (got_box.width, got_box.height),
                                 os.path.relpath(name, ROOT)))
    text = "\n".join(lines) + "\n"
    io.open(os.path.join(HERE, "label104_pair_crops.txt"), "w", encoding="utf-8").write(text)
    print(text)
    for name in os.listdir(g.TMP):
        if name.startswith("m104_"):
            os.remove(os.path.join(g.TMP, name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
