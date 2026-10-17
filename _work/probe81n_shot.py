r"""把 #81 那三张「修前 vs 修后」的画布整幅裁成 300 dpi 的图，供人读页。

`_work/probe81m_churn_read.py` 已经把它们各排成一页；这里只按内容包围盒裁出来。

  python _work/probe81n_shot.py <pdf 名片段> [...]
"""
import glob
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m81render")


def main():
    for frag in sys.argv[1:]:
        for pdf in sorted(glob.glob(os.path.join(TMP, "*" + frag + "*.pdf"))):
            doc = fitz.open(pdf)
            page = doc[0]
            box = None
            for d in page.get_drawings():
                box = d["rect"] if box is None else box | d["rect"]
            for b in page.get_text("blocks"):
                r = fitz.Rect(b[:4])
                box = r if box is None else box | r
            box = fitz.Rect(box) + (-4, -4, 4, 4) & page.rect
            name = os.path.join(ROOT, "_work", os.path.basename(pdf)[:-4] + ".png")
            page.get_pixmap(clip=box, dpi=300).save(name)
            print("%-40s %.0fx%.0fpt -> %s" % (os.path.basename(pdf), box.width, box.height,
                                               os.path.relpath(name, ROOT)))
            doc.close()
    return 0


if __name__ == "__main__":
    sys.exit(main())
