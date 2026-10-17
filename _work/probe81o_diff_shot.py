r"""Crop only where a fix MOVED ink: for each (old, new) canvas pair, the union of the text spans
whose position changed, at 300 dpi, both versions.

A whole 256x687pt canvas at 300 dpi is unreadable in one glance; the question this round asks is
narrower — did those two labels stop sitting on each other? — so show exactly the strip that moved.

  python _work/probe81o_diff_shot.py <pdf 名片段> [...]
"""
import glob
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m81render")


def spans(pdf):
    doc = fitz.open(pdf)
    out = [(tuple(round(v, 1) for v in s["bbox"]), s["text"].strip())
           for b in doc[0].get_text("dict")["blocks"] if b.get("lines")
           for l in b["lines"] for s in l["spans"] if s["text"].strip()]
    doc.close()
    return out


def main():
    for frag in sys.argv[1:]:
        for new in sorted(glob.glob(os.path.join(TMP, "*" + frag + "*.pdf"))):
            old = new.replace("_new", "_old")
            if not os.path.exists(old) or "_new" not in new:
                continue
            a, b = spans(old), spans(new)
            moved = [r for (r, t), (r2, t2) in zip(a, b) if r != r2 and t == t2]
            if not moved:
                print("%-34s no span moved (text identical)" % os.path.basename(new))
                continue
            box = fitz.Rect(moved[0])
            for r in moved[1:]:
                box |= fitz.Rect(r)
            doc = fitz.open(new)
            box = (box + (-14, -14, 14, 14)) & doc[0].rect
            base = os.path.basename(new)[:-4]
            for tag, path in (("new", new), ("old", old)):
                d = fitz.open(path)
                name = os.path.join(ROOT, "_work", "diff_%s_%s.png" % (tag, base))
                d[0].get_pixmap(clip=box, dpi=300).save(name)
                d.close()
                print("%-34s %s  %.0fx%.0fpt (%d spans moved) -> %s"
                      % (base, tag, box.width, box.height, len(moved), os.path.relpath(name, ROOT)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
