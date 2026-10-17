r"""#88 的改动面：交换图的箭标签改按 `\scriptstyle` 发，哪些画布真的变了？

律是量出来的（`_work/probe88b_cd_label_size.py`：tikz-cd 与 amscd 的标签都是 6.97/7.97/7.97pt 对单元
9.96/10.91/11.96pt），代码里换成了两件事：标签发成 `#text(size: 0.73em)`，以及 `cd_label_off` 的半宽
半高两项跟着这个比例缩。打桩就是把 `CD_LABEL_EM` 按回 1.0——几何与旧律逐字相同，只剩那层壳——在同一
基（批处理自己的图片路径）上 live 与 old 各跑一遍再 diff。

分两个数：**只多一层壳**（标签位置没动）与**坐标也变了**（让位量按缩小的标签盒子重算）。前者是纯排版
差异，后者才是几何改动。

基是 `cetz.PICTURE_ENV` 在 `_work/flat` 上的图序，不是 #80 那套 `lifted_pictures`：那条路只把
`\begin{tikzpicture}` 举出来，交换图从它手里一张都拿不到（本探针第一版就在同一基上报 0 改动）。图序
即画布序，与普查同源。

  python _work/probe88d_cd_label_churn.py
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
COORD = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\)")
CD = re.compile(r"\\begin\{(tikzcd|CD)\}")


def sweep():
    out = {}
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for k, m in enumerate(cetz.PICTURE_ENV.finditer(src)):
            if not CD.match(m.group(0)):
                continue
            out[(stem, k)] = cetz.build_cd(cetz.strip_envelope(m.group(0)))
    return out


def classify(live, old):
    """(moved, wrapped) canvases: coordinates differ vs only the `#text(size:)` shell."""
    moved, wrapped = [], []
    for key in live:
        a, b = live[key], old[key]
        if a == b:
            continue
        if (a is None) != (b is None):
            moved.append(key)
            continue
        if COORD.findall(a) != COORD.findall(b):
            moved.append(key)
        else:
            wrapped.append(key)
    return moved, wrapped


live = sweep()
em, cetz.CD_LABEL_EM = cetz.CD_LABEL_EM, 1.0
old = sweep()
cetz.CD_LABEL_EM = em

moved, wrapped = classify(live, old)
changed = moved + wrapped
papers = sorted({key[0] for key in changed})
print("canvases built: %d (refused both ways: %d)"
      % (sum(1 for v in live.values() if v is not None),
         sum(1 for v in live.values() if v is None)))
print("labels at script size: %d canvases in %d papers" % (len(changed), len(papers)))
print("  geometry moved: %d   shell only: %d" % (len(moved), len(wrapped)))
with open(os.path.join(ROOT, "_work", "regen88.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(papers))
print("wrote _work/regen88.txt (%d papers)" % len(papers))
for key in (moved[:3] + wrapped[:2]):
    a, b = (live[key] or "").splitlines(), (old[key] or "").splitlines()
    for x, y in zip(a, b):
        if x != y:
            print("  %s#%d\n    old %s\n    new %s" % (key[0][:46], key[1], y.strip()[:150],
                                                       x.strip()[:150]))
            break
