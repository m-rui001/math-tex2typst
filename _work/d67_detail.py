# -*- coding: utf-8 -*-
# D67 收稿细节定位：非 6 枚竖线的表格行、申报的奇数定界符行、以及续表头形态。
import glob
import io
import re

p = glob.glob(u"研究笔记/D67-*.md")[0]
t = io.open(p, encoding="utf-8").read()
L = t.split(u"\n")
out = []
out.append(u"== pipe histogram of |-lines ==")
h = {}
for l in L:
    if l.startswith(u"|"):
        h[l.count(u"|")] = h.get(l.count(u"|"), 0) + 1
out.append(repr(h))
out.append(u"== non-6 pipe lines ==")
for i, l in enumerate(L):
    if l.startswith(u"|") and l.count(u"|") != 6:
        out.append(u"%4d n=%d %s" % (i + 1, l.count(u"|"), l[:200]))
out.append(u"== odd-dollar lines (whole file) ==")
odd = [(i + 1, L[i]) for i in range(len(L)) if L[i].count(u"$") % 2]
out.append(u"count=%d" % len(odd))
fence = [False] * len(L)
f = False
for i, l in enumerate(L):
    if l.startswith(u"```"):
        fence[i] = True
        f = not f
    else:
        fence[i] = f
for i, l in odd[:14]:
    out.append(u"%4d infence=%s %s" % (i + 1, fence[i], l[:160]))
out.append(u"== headers of ledger ==")
for i, l in enumerate(L):
    if l.startswith(u"|") and (u"记号" in l or u"符号" in l):
        out.append(u"%4d %s" % (i + 1, l[:120]))
io.open(u"_work/d67_detail.txt", "w", encoding="utf-8", newline=u"\n").write(u"\n".join(out) + u"\n")
print("written", len(out))
