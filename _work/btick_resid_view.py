# -*- coding: utf-8 -*-
# 残余的缩写式闭合误写：按 4 枚后继字符分桶，看清楚 $ 后面到底跟着什么，
# 决定每一族的修法形状（有的后随全角括号会把误写的 $ 配成自闭合数学跨段）。
import glob, io, os, re, sys, collections
sys.stdout.reconfigure(encoding="utf-8")
TICK = chr(96)
PAT = re.compile(TICK + u"([A-Za-z0-9_.\-]+:[A-Za-z0-9_.\-]+)([$])(.{0,4})")
buckets = collections.Counter()
rows = []
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    k = os.path.basename(p)[:10]
    t = io.open(p, encoding="utf-8", errors="replace").read()
    for i, l in enumerate(t.split(u"\n")):
        for m in PAT.finditer(l):
            nxt = m.group(3)
            buckets[nxt] += 1
            rows.append((k, i + 1, nxt, m.group(0)[:46], l.count(u"$") % 2, l.count(TICK) % 2))
print(u"resid =", sum(buckets.values()), u" lines =", len(set((r[0], r[1]) for r in rows)),
      u" notes =", len(set(r[0] for r in rows)))
for b, c in buckets.most_common():
    print(u"  after=%r  n=%d" % (b, c))
for r in rows:
    print(r)
