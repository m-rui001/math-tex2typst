r"""Cut the page around one diagram label, at 300 dpi, so the eye rules on the crossing.

`_work/probe30_cd_face.py` measures a label box against the nearest arrow shaft in canvas
centimetres.  Whether a shaft really runs through the letters is a question about the page, and this
answers it for a named label: it finds the line of text the needle sits on, crops a band wide enough
to hold the arrow it belongs to, and writes the PNG.

Usage: python _work/crop30_cd.py <stem-prefix> <needle> [out-prefix]
"""
import glob
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main():
    stem, needle = sys.argv[1], sys.argv[2]
    out = sys.argv[3] if len(sys.argv) > 3 else "crop30"
    hits = glob.glob(os.path.join(ROOT, "typst", stem + "*"))
    if not hits:
        print("no such paper: %s" % stem)
        return
    path = os.path.join(hits[0], "main.pdf")
    doc = fitz.open(path)
    found = 0
    for i, page in enumerate(doc):
        for r in page.search_for(needle):
            found += 1
            clip = fitz.Rect(r.x0 - 70, r.y0 - 55, r.x1 + 70, r.y1 + 55) & page.rect
            pix = page.get_pixmap(dpi=300, clip=clip)
            name = "%s_%s_p%d_%d.png" % (out, os.path.basename(hits[0])[:22], i + 1, found)
            dest = os.path.join(ROOT, "_work", name)
            pix.save(dest)
            print("%s p%d  span %.1fx%.1f pt at (%.0f, %.0f) -> %s"
                  % (os.path.basename(hits[0])[:40], i + 1,
                     r.width, r.height, r.x0, r.y0, name))
    if not found:
        print("needle %r not on any page of %s" % (needle, os.path.basename(hits[0])[:40]))
    doc.close()


if __name__ == "__main__":
    main()
