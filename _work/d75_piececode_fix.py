# -*- coding: utf-8 -*-
# D75 第 1306 行：写手自己申报的一处「片名写成数学态而非代码格」。这是字符类型错，不是内容问题：
# 同一段里 `05:191-192` 用的就是代码格，全库代码格形才是本地约定。逐字符等长替换，字节 delta 0。
# 省文件名的缩写式位置串（本行也有一枚）属全库通改族，未得用户明示，此处不动。
import io
import sys

sys.stdout.reconfigure(encoding="utf-8")

LINE = 1306
OLD = u"在 $05$ 片"
NEW = u"在 `05` 片"

hits = [p for p in __import__("glob").glob(u"研究笔记/D75-*.md")]
assert len(hits) == 1, hits
PATH = hits[0]
raw = io.open(PATH, encoding="utf-8").read()
L = raw.split(u"\n")
l = L[LINE - 1]
assert l.count(OLD) == 1, l.count(OLD)
assert l.count(u"$") % 2 == 0 and l.count(u"`") % 2 == 0

b = raw.encode("utf-8")
L[LINE - 1] = l.replace(OLD, NEW)
nb = u"\n".join(L).encode("utf-8")
assert len(nb) == len(b), (len(b), len(nb))
assert nb.count(b"$") == b.count(b"$") - 2
assert nb.count(b"`") == b.count(b"`") + 2
assert nb.count(b"\r") == b.count(b"\r")
odd = [i + 1 for i, x in enumerate(u"\n".join(L).split(u"\n")) if x.count(u"$") % 2 == 1]
print(u"bytes=%d->%d dollars=%d->%d ticks=%d->%d odd_after=%s" % (
    len(b), len(nb), b.count(b"$"), nb.count(b"$"), b.count(b"`"), nb.count(b"`"), odd))
if u"--apply" in sys.argv:
    io.open(u"_work/D75.pre-piecefix.md", u"w", encoding="utf-8").write(raw)
    io.open(PATH, "wb").write(nb)
    print(u"APPLIED")
