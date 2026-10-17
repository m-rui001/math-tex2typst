# -*- coding: utf-8 -*-
# 把 pipe_census2 点名的 18 行整行取出来，逐枚判形用。
import io, glob, os

NOTE = u"研究笔记"
WANT = {
    u"D09": [379],
    u"D103": [598, 601, 602],
    u"D25": [1870, 1886, 1887],
    u"D28": [1162, 1163],
    u"D34": [533, 654, 658, 660, 739],
    u"D43": [562],
    u"D49": [444],
    u"D53": [514],
}
out = []
for ID in sorted(WANT, key=lambda k: (len(k), k)):
    p = glob.glob(u"E:/math/" + NOTE + u"/" + ID + u"-*.md")
    if not p:
        out.append(u"%s NOFILE" % ID)
        continue
    lines = io.open(p[0], encoding=u"utf-8").read().split(u"\n")
    for ln in WANT[ID]:
        l = lines[ln - 1]
        out.append(u"%s:%d pipes=%d" % (ID, ln, l.count(u"|")))
        out.append(u"    " + l)
io.open(u"E:/math/_work/pipe_rows.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"rows", sum(len(v) for v in WANT.values()))
