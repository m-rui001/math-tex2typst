# -*- coding: utf-8 -*-
import io, glob, sys

PAIRS = [
    (u"拿**同一个**横向目标", u"拿同一个横向目标"),
    (u"相邻两层不同 mesh 之比至多为", u"相邻两层不同步长之比至多为"),
    (u"下游调用 rare-fast 那条时", u"下游调用「稀有快速跨越」那条时"),
]
do_apply = "--apply" in sys.argv
p = glob.glob(u"E:/math/研究笔记/D137-*.md")[0]
s = io.open(p, encoding=u"utf-8", newline=u"").read()
b = (len(s.encode(u"utf-8")), s.count(u"\n") + 1, s.count(u"$"), s.count(u"`"), s.count(u"\r"))
for old, new in PAIRS:
    n = s.count(old)
    if n != 1:
        print(u"FAIL count=%d %r" % (n, old[:30]))
        continue
    s = s.replace(old, new)
a = (len(s.encode(u"utf-8")), s.count(u"\n") + 1, s.count(u"$"), s.count(u"`"), s.count(u"\r"))
print(u"bytes %d->%d lines %d->%d dollars %d->%d backtick %d->%d CR %d->%d" % (b + a))
if do_apply:
    io.open(p, u"w", encoding=u"utf-8", newline=u"").write(s)
    print(u"written")
