r"""#80 的改动面：对角方向键带距离（`above left=2pt`）现在会挪节点了——哪些画布真的变了？

只撤这一步：把 `_side_key` 打回它昨天的样子（只查四个单词），其余一行不动。在同一基（批处理自己的
图片路径：`lifted_pictures` → `picture_scopes` → `with_declarations` → `expand_macros` →
`expand_linewidth(strip_envelope(pic), line_cm)` → `build(core, colors) or build_cd(core)`）上把
live 与 old 各跑一遍再 diff，得到的就是这一轮的改动面；关键词普查不是量具（#78 那 23 处假账）。

`refused both ways` 不是余数：每张打桩也建不出来的图是这个量具的盲区，要单独读。
"""
import glob
import io
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
OLD_WORDS = ("above", "below", "left", "right")


def old_side_key(o):
    """Yesterday's reader: the four single words only, same dimension requirement."""
    for word in OLD_WORDS:
        val = o.get(word)
        if isinstance(val, str) and cetz._size(val) is not None:
            return word, val
    return None


def sweep():
    out = {}
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)
        src = open(path, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        pics = convert.lifted_pictures(body)
        if not pics:
            continue
        scopes = convert.picture_scopes(body, p.macros)
        axis = convert.line_cm(p)
        for k, m in enumerate(pics):
            pic = m.group(0)
            table, decls = scopes[k]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            core = cetz.expand_linewidth(cetz.strip_envelope(pic), axis)
            out[(stem, k)] = cetz.build(core, p.colors) or cetz.build_cd(core)
    return out


live = sweep()
side_key = cetz._side_key
cetz._side_key = old_side_key
old = sweep()
cetz._side_key = side_key

changed = [key for key in live if live[key] != old[key]]
papers = sorted({key[0] for key in changed})
start = [key for key in changed if old[key] is None and live[key] is not None]
stop = [key for key in changed if live[key] is None and old[key] is not None]
lines = diagonal = 0
for key in changed:
    if not (live[key] and old[key]):
        continue
    for a, b in zip(live[key].splitlines(), old[key].splitlines()):
        if a == b:
            continue
        lines += 1
        if "south-east" in a or "north-west" in a or "south-west" in a or "north-east" in a:
            diagonal += 1
print("canvases built: %d (refused both ways: %d)"
      % (sum(1 for v in live.values() if v is not None),
         sum(1 for v in live.values() if v is None)))
print("canvases moved: %d in %d papers, %d lines (%d carry a corner anchor)"
      % (len(changed), len(papers), lines, diagonal))
print("started drawing: %d   stopped drawing: %d" % (len(start), len(stop)))
with open(os.path.join(ROOT, "_work", "regen80.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(os.path.splitext(p)[0] for p in papers))
print("wrote _work/regen80.txt (%d papers)" % len(papers))
for key in changed[:8]:
    a = (live[key] or "").splitlines()
    b = (old[key] or "").splitlines()
    for i, (x, y) in enumerate(zip(a, b)):
        if x != y:
            print("  %s#%d line %d\n    old %s\n    new %s"
                  % (key[0][:46], key[1], i, y.strip()[:150], x.strip()[:150]))
            break
