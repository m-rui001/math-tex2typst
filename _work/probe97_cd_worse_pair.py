r"""#87b 的三张「控制侧干净、我们互压」：同一对字在两张页上各自站在哪？

`_work/probe96_cd_worse_control.py` 给了并排读数——`Abundance`／`Irrational`／`height-three` 三张的重建页
有 over-3pt 的墨压墨，作者自己的 pdflatex 页没有。旗标不说明机制，所以这一支把**同一对词**在两页上的墨盒
逐条打出来：行距（两页的同一对词的基线差）、盒高、以及这对词各自属于哪一个 `content()`。行距对得上而墨盒对
不上，是 Typst 的字在盒里站得比 TeX 低（或我们的字号/形状不同）；行距就对不上，是这一轮的盒高／间距律把画布
压得比源页紧，得回去补尺。

  python _work/probe97_cd_worse_pair.py
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

DEPTH = 3.0
# (stem prefix, canvas index, the pair's own text as the gauge prints it)
CASES = [("Abundance-in-numerical-dimension-one-for-term", 0, "Preparedcycle(V,D)"),
         ("Irrational-cubic-fourfolds-with-geometric-K3-c", 0, "⇢X"),
         ("The-height-three-chromatic-overlap-an-explicit", 1, "RΓ")]


def words(pdf):
    doc = fitz.open(pdf)
    got = [(w[0], w[1], w[2], w[3], w[4]) for w in doc[0].get_text("words")]
    doc.close()
    return got


def show(pdf, tag, needle, stem, k):
    ws = words(pdf)
    hit = [w for w in ws if re.sub(r"\s+", "", w[4]).startswith(needle[:6])]
    print("  -- %s: %d words, %r matches %d" % (tag, len(ws), needle[:6], len(hit)))
    for x0, y0, x1, y1, text in hit[:3]:
        near = sorted((w for w in ws if abs((w[1] + w[3]) / 2 - (y0 + y1) / 2) < 12),
                      key=lambda w: w[0])
        print("     %-22r box x %.1f..%.1f  y %.1f..%.1f  | line: %s"
              % (text[:22], x0, x1, y0, y1,
                 " ".join("%s(%.1f..%.1f)" % (w[4][:8], w[1], w[3]) for w in near[:6])))


def main():
    canvases = g.canvases()
    for prefix, k, needle in CASES:
        key = [c for c in canvases if c[0].startswith(prefix) and c[1] == k][0]
        stem = key[0]
        head, block = canvases[key]
        path, pics = C.pictures(stem)
        rebuilt = cetz.convert(pics[k], refs=None)
        got = g.render(rebuilt, "97r%d" % k, head)
        pdf, _ = compare_figure.control(path, k, [], C.body_size(head))
        print("\n=== %s#%d  (canvas %d lines)" % (stem[:46], k, len(block.splitlines())))
        print("  source: %s" % pics[k][:300].replace("\n", " "))
        if not got:
            print("  OUR page did not compile")
            continue
        found, both = g.decide(got[2], *got[:2])
        deep = [(round(t[0], 2), t[3][:24], t[4][:24]) for t in both if t[0] > DEPTH]
        print("  OUR pairs: %s" % deep)
        show(got[2], "ours", needle.replace(" ", ""), stem, k)
        print("  control pairs: %s"
              % [(round(t[0], 2), t[3][:24]) for t in C.measure(pdf)[4] if t[0] > DEPTH])
        show(pdf, "control", needle.replace(" ", ""), stem, k)
    return 0


if __name__ == "__main__":
    sys.exit(main())
