r"""#80 的产物侧收口：这一轮该改的画布，页上的 `main.typ` 真的写了新画布吗？

打桩 diff 给的是「代码会发什么」，产物才是「页上有什么」——#69 的桩漏了 6 篇，30 个正文带着旧盒边出厂。
这一支对 `_work/regen80.txt` 的 15 篇走批处理自己的图片路径（`lifted_pictures` → `picture_scopes` →
`with_declarations` → `expand_macros` → `expand_linewidth(strip_envelope(pic), line_cm)` →
`build(core, colors) or build_cd(core)`）在同一基上跑 live / old 两趟：
- `moved` 张变了画布的**整段**必须逐字出现在 `typst/<paper>/main.typ` 里，否则这篇没重跑（stale）；
- `corners gained` 是新写上的角 anchor 数，应与普查的单段带距离 **41 处**对齐——对不上就是有一处
  代码发了、页上没有，或反之。
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
TY = os.path.join(ROOT, "typst")
CORNER = re.compile(r'anchor: "(?:south|north)-(?:east|west)"')
OLD_WORDS = ("above", "below", "left", "right")


def old_side_key(o):
    """Yesterday's reader: the four single words only, same dimension requirement."""
    for word in OLD_WORDS:
        val = o.get(word)
        if isinstance(val, str) and cetz._size(val) is not None:
            return word, val
    return None


def cores(path):
    src = open(path, encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    body = prep.scale_linewidth_in_minipages(body)
    body = prep.unwrap_boxes(body)
    pics = convert.lifted_pictures(body)
    if not pics:
        return []
    scopes = convert.picture_scopes(body, p.macros)
    axis = convert.line_cm(p)
    out = []
    for k, m in enumerate(pics):
        pic = m.group(0)
        table, decls = scopes[k]
        if decls:
            pic = convert.with_declarations(pic, decls)
        pic = prep.expand_macros(pic, table)
        out.append((cetz.expand_linewidth(cetz.strip_envelope(pic), axis), p.colors))
    return out


def main():
    names = [l.strip() for l in open(os.path.join(ROOT, "_work", "regen80.txt"),
                                     encoding="utf-8") if l.strip()]
    live_key = cetz._side_key
    moved = stale = gained = lines = no_product = 0
    for name in names:
        path = os.path.join(FLAT, name + ".tex")
        product_path = os.path.join(TY, name, "main.typ")
        if not os.path.exists(product_path):
            no_product += 1
            print("NO PRODUCT: %s" % name)
            continue
        product = open(product_path, encoding="utf-8").read()
        for core, colors in cores(path):
            cetz._side_key = live_key
            now = cetz.build(core, colors) or cetz.build_cd(core)
            cetz._side_key = old_side_key
            was = cetz.build(core, colors) or cetz.build_cd(core)
            if not now or now == was:
                continue
            moved += 1
            gained += len(CORNER.findall(now)) - len(CORNER.findall(was or ""))
            lines += sum(1 for a, b in zip(now.splitlines(), (was or "").splitlines()) if a != b)
            if now not in product:
                stale += 1
                print("STALE: %s  (%s)" % (name, [l.strip()[:70]
                                                  for l in now.splitlines()
                                                  if CORNER.search(l)][:2]))
    cetz._side_key = live_key
    print("papers read: %d (no product: %d)" % (len(names) - no_product, no_product))
    print("canvases moved: %d, %d lines, corner anchors gained: %d" % (moved, lines, gained))
    print("stale (new canvas not on the page): %d" % stale)


if __name__ == "__main__":
    main()
