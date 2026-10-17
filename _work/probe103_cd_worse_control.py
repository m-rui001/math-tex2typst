r"""#87b 剩下的 worse 两张：页上的互压是我们自己的，还是作者那一页本来就这样？

`_work/probe102_cd_face_batch.py` 用转换器真正画的那一串字符重读了全部 124 张交换图画布：
same 116／**worse 2**／不可比 6（宏没展开或画布序号对不上，两版不是同一张图，同一把尺读不出前后）。
轴 67 的规矩是「互压普查要有控制侧」——旗标本身不说明是谁的缺陷。这一支就替这两张跑
pdflatex＋`tikz-cd`／`amscd` 控制（standalone 带该篇正文字号、带该篇前言里的宏，所以控制画的是
作者真正画的那个形状），把两版的 over-3pt 对并排打出来。

控制侧同深度也有，就是这一轮的换律把画布放回了源页本来就有的位置；控制侧干净，才是我们的单元比真单元
宽——`A-universal…` 那一张的墨是 `'Ŵ'`，`Unrestricted-pro-modularity…` 那一张是 `'forgetfactors2'`，
后者是**带参数的宏**印成了自己的名字（`\forgetfactors2`），产品的页上同样印着它，所以不是这一轮加的墨。

  python _work/probe103_cd_worse_control.py
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import compare_figure  # noqa: E402
import probe101_cd_batch_pictures as B  # noqa: E402
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
from t2t import cetz, convert  # noqa: E402

DEPTH = 3.0
LIST = os.path.join(WORK, "label102_cd_face_batch.txt")
FLAT = os.path.join(WORK, "flat")
WORSE = re.compile(r"WORSE\s+(\S+)#(\d+) (\w+): (\d+) -> (\d+)\s+(.*)$")


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
        stems = [os.path.basename(p)[:-4] for p in glob.glob(os.path.join(FLAT, m.group(1) + "*.tex"))]
        if len(stems) != 1:
            print("  AMBIGUOUS stem %r -> %d" % (m.group(1), len(stems)))
            continue
        keys.append((stems[0], int(m.group(2)), m.group(3)))
    print("worse canvases: %d" % len(keys))
    for stem, k, env in keys:
        head, block = canvases.get((stem, k), (None, None))
        if head is None:
            print("\n=== %s#%d not in the products" % (stem[:46], k))
            continue
        pics, p = B.batch(stem)
        rebuilt = cetz.convert(pics[k], p.colors, convert.line_cm(p), refs=None)
        ours = pairs(rebuilt, head, "103r%d" % k) if rebuilt else None
        prod = pairs(block, head, "103p%d" % k)
        path = glob.glob(os.path.join(FLAT, stem + "*.tex"))[0]
        size = C.body_size(head)
        pdf, _ = compare_figure.control(path, k, [], size)
        print("\n=== %s#%d  env=%s  size=%s" % (stem[:46], k, env, size))
        if pdf is None:
            print("  CONTROL pdflatex produced nothing")
            continue
        doc_boxes, raw, ink, cfound, cboth, text = C.measure(pdf)
        ctl = [(round(t[0], 2), t[3][:22]) for t in cboth if t[0] > DEPTH]
        print("  product  : %s" % (prod if prod is not None else "page did not compile"))
        print("  ours     : %s" % (ours if ours is not None else "page did not compile"))
        print("  control  : boxes=%d raw=%d ink=%d  pairs %s%s"
              % (doc_boxes, raw, ink, ctl,
                 "  [SOURCE SET AS TEXT]" if C.syntax_left(pics[k], text) else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
