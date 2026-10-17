# -*- coding: utf-8 -*-
# D207 新落的区的宏残留定位：围栏内外分开，配对宏（带参数）单独一档。
import io
import glob

f = glob.glob(u"研究笔记/D207-*.md")[0]
L = io.open(f, encoding=u"utf-8").read().split(u"\n")
FROM = 273
MACS = (u"\\rank", u"\\pair", u"\\norm", u"\\abs")
o = []
fence = False
for i, l in enumerate(L[:FROM - 1]):
    if l.strip().startswith(u"```"):
        fence = not fence
pre_fence = fence
for i in range(FROM - 1, len(L)):
    l = L[i]
    if l.strip().startswith(u"```"):
        fence = not fence
        continue
    for mac in MACS:
        if mac in l:
            o.append(u"%4d fence=%d %s | %s" % (i + 1, fence, mac, l.strip()[:150]))
io.open(u"_work/d207_mac2.txt", "wb").write(
    (u"pre_fence_at_273=%s hits=%d\n" % (pre_fence, len(o)) + u"\n".join(o)).encode(u"utf-8"))
print("hits", len(o), "pre_fence", pre_fence)
