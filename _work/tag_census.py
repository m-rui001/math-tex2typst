# -*- coding: utf-8 -*-
r"""`\tag{…}` 的参数形普查：全库 house 形是什么、带反斜杠的有几处、长什么样。

用法：`PYTHONIOENCODING=utf-8 python _work/tag_census.py [过滤子串]`
按「参数里是否含反斜杠」分档计数，含反斜杠的那些逐条打 file:line＋参数原文。
"""
import glob
import io
import re
import sys

BS = chr(92)
PAT = re.compile('[' + BS + BS + r']tag\{([^}]*)\}')
NEEDLE = sys.argv[1] if len(sys.argv) > 1 else None

hits = []
naive = 0
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    text = io.open(p, encoding='utf-8').read()
    naive += text.count(BS + u'tag{')
    for i, line in enumerate(text.split(u'\n'), 1):
        for m in PAT.finditer(line):
            arg = m.group(1)
            if NEEDLE and NEEDLE not in arg:
                continue
            hits.append((p.split(BS)[-1], i, arg))

with_bs = [h for h in hits if BS in h[2]]
print((u'总数=%d  含反斜杠=%d  不含=%d  自证：字面 count(' + BS + u'tag{)=%d') % (
    len(hits), len(with_bs), len(hits) - len(with_bs), naive))
for f, i, a in with_bs[:40]:
    print(u'  %s:%d  %r' % (f[:14], i, a[:80]))
