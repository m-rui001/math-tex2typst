# -*- coding: utf-8 -*-
# 只读：腿①「停止加深写作」的盘上证言——近 24 h 被改动的语料稿是谁改的、改成了什么形状
import glob
import io
import os
import time

now = time.time()
rows = []
for p in glob.glob(u'研究笔记/D*.md'):
    st = os.stat(p)
    if now - st.st_mtime < 86400:
        t = io.open(p, encoding='utf-8').read()
        rows.append((st.st_mtime, os.path.basename(p)[:40], st.st_size,
                     u'对照' in t, t.count(u'\n') + 1))
rows.sort()
print(u'近 24 h 改动的语料稿=%d 份' % len(rows))
noref = [r for r in rows if not r[3]]
print(u'其中不带「被引文献笔记对照」节的=%d 份 %s' % (len(noref), [r[1][:6] for r in noref][:10]))
buckets = {}
for m, b, s, r, l in rows:
    buckets.setdefault(time.strftime('%m-%d %H:%M', time.localtime(m)), []).append(b[:3])
print(u'按分钟桶（改动时刻＝哪一趟）：')
for k in sorted(buckets):
    print(u'   %s  %d 份  %s' % (k, len(buckets[k]), u' '.join(buckets[k])[:90]))

# 在飞写手：研究笔记侧与 被引笔记侧 最近 20 分钟还在动的文件
fresh = []
for pat in (u'研究笔记/D*.md', u'被引笔记/C*.md'):
    for p in glob.glob(pat):
        age = now - os.stat(p).st_mtime
        if age < 1200:
            fresh.append((int(age), p))
fresh.sort()
print(u'近 20 分钟内有动静的稿=%d 份' % len(fresh))
for a, p in fresh[:12]:
    print(u'   age=%ds %s' % (a, p))
