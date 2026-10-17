r"""#87b 的三张新互压：在我们的页上，箭杆、单元墨、标签墨各自在哪条 y 上？

控制侧（`_work/probe96_cd_worse_control.py`）说作者那一页干净，而换律之后我们的页上标签墨压单元墨 3.8～4.3pt。
这一轮的间距律把列拉近之后，唯一还能解释这深度的是**竖向上的归属**：箭杆画在两格中心连线上，标签按
`CD_LABEL_GAP + 半高` 推离这条线，单元自己的墨却没有任何一条律管着它相对这条线站在哪。Typst 的 `content()`
把**行盒**发在点上（轴 62：Typst 把文字发成文字），TeX 把箭接在单元的**数学轴**上——这两条线差几个像素，
横箭的标签就会正好骑进上一格的下缘。

所以在同一张重建页上把三样东西的 y 一起读出来：水平箭杆（`get_drawings()` 里高度小于 1pt 的那几条）、
单元词的墨带、标签词的墨带；控制页同一条并排。差在哪，律就补在哪。

  python _work/probe98_cd_shaft_vs_ink.py
"""
import io
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import compare_figure  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
from t2t import cetz  # noqa: E402

CASES = [("The-height-three-chromatic-overlap-an-explicit", 1),
         ("Abundance-in-numerical-dimension-one-for-term", 0)]


def readout(pdf, tag):
    doc = fitz.open(pdf)
    page = doc[0]
    words = [(w[0], w[1], w[2], w[3], w[4]) for w in page.get_text("words")]
    doc.close()
    print("  -- %s (%d words)" % (tag, len(words)))
    for x0, y0, x1, y1, text in sorted(words, key=lambda w: (round(w[1], 1), w[0])):
        print("     %-24r x %6.1f..%-6.1f  y %5.1f..%-5.1f" % (text[:24], x0, x1, y0, y1))


def main():
    canvases = g.canvases()
    for prefix, k in CASES:
        key = [c for c in canvases if c[0].startswith(prefix) and c[1] == k][0]
        head, block = canvases[key]
        path, pics = C.pictures(key[0])
        rebuilt = cetz.convert(pics[k], refs=None)
        got = g.render(rebuilt, "98r%d" % k, head)
        print("\n=== %s#%d" % (key[0][:46], k))
        print("  canvas: %s" % " | ".join(l.strip() for l in block.splitlines()[2:]))
        if got:
            readout(got[2], "ours")
            doc = fitz.open(got[2])
            for d in doc[0].get_drawings():
                r = d["rect"]
                if r.width > 3 and (r.height < 1.2 or r.width < 1.2):
                    print("     shaft/edge x %.1f..%.1f y %.1f..%.1f" % (r.x0, r.x1, r.y0, r.y1))
            doc.close()
        pdf, _ = compare_figure.control(path, k, [], C.body_size(head))
        readout(pdf, "control")
    return 0


if __name__ == "__main__":
    sys.exit(main())
