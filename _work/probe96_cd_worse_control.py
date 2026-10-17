r"""#87b 的 worse 五张：页上的互压是我们自己的，还是作者那一页也这样？

`_work/probe95_cd_face_all.py` 把盒到盒的间距律与拟合的单元盒喂给全部 124 张交换图画布，同一把尺读两版：
better 1（动机那篇 7 对 → 0）／same 118／**worse 5**。轴 67 的规矩是「互压普查要有控制侧」——旗标本身不
说明是谁的缺陷，作者自己的 TikZ 也在互压的有 41 张。这一支就替这五张跑 pdflatex＋`tikz-cd`／`amscd` 控制
（standalone 带该篇正文字号），把两版的 over-3pt 对逐条并排打出来：控制侧同深度也有，就是这一轮的换律把画布
放回了源页本来就有的位置；控制侧干净，才是我们的盒比真盒窄、得回去修尺。

  python _work/probe96_cd_worse_control.py
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import compare_figure  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
from t2t import cetz  # noqa: E402

DEPTH = 3.0
LIST = os.path.join(WORK, "label95_cd_face_all.txt")
FLAT = os.path.join(WORK, "flat")
WORSE = re.compile(r"WORSE (\S+)#(\d+) (\w+): (\d+) -> (\d+)\s+(.*)$")


def pairs(canvas, head, name):
    got = g.render(canvas, name, head)
    if not got:
        return None
    found, both = g.decide(got[2], *got[:2])
    return [(round(t[0], 2), t[3][:22]) for t in both if t[0] > DEPTH]


def main():
    canvases = g.canvases()
    keys = []
    for line in open(LIST, encoding="utf-8").read().splitlines():
        m = WORSE.search(line)
        if not m:
            continue
        stem = [os.path.basename(p)[:-4] for p in glob.glob(os.path.join(FLAT, m.group(1) + "*.tex"))]
        if len(stem) != 1:
            print("  AMBIGUOUS stem %r -> %d" % (m.group(1), len(stem)))
            continue
        keys.append((stem[0], int(m.group(2)), m.group(3)))
    print("worse canvases: %d" % len(keys))
    for stem, k, env in keys:
        head, block = canvases.get((stem, k), (None, None))
        if head is None:
            print("\n=== %s#%d not in the products" % (stem[:46], k))
            continue
        path, pics = C.pictures(stem)
        rebuilt = cetz.convert(pics[k], refs=None) if k < len(pics) else None
        ours = pairs(rebuilt, head, "96r%d" % k) if rebuilt else None
        # `probe84_control_face.one` refuses when a paper's canvas count differs from its picture
        # count; the same guard has to hold here or the control page is somebody else's diagram
        n = len([p for p in pics if re.match(r"\\begin\{(tikzcd|CD|tikzpicture)\}", p)])
        size = C.body_size(head)
        pdf, _ = compare_figure.control(path, k, [], size)
        print("\n=== %s#%d  env=%s  size=%s  pics=%d" % (stem[:46], k, env, size, n))
        if pdf is None:
            print("  CONTROL pdflatex produced nothing")
            continue
        doc_boxes, raw, ink, cfound, cboth, text = C.measure(pdf)
        ctl = [(round(t[0], 2), t[3][:22]) for t in cboth if t[0] > DEPTH]
        print("  ours     : %s" % (ours if ours is not None else "page did not compile"))
        print("  control  : boxes=%d raw=%d ink=%d  pairs %s%s"
              % (doc_boxes, raw, ink, ctl,
                 "  [SOURCE SET AS TEXT]" if C.syntax_left(pics[k], text) else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
