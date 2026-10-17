# -*- coding: utf-8 -*-
r"""落笔前最后一批现场：
- `\Set` 另两站（D128:315、D139:111、D157:795）到底在什么语境里；
- D326 本篇相邻行的 `\frac{4\pi}{\arccos(...)}` 合法形（凭据在同一篇）；
- D576:175 全文（作者申报笔误那一处）；
- 7 处 F3 的 `\text{…$…$…}` 片段在本篇出现几次。
"""
import glob
import io
import os
import re

B = chr(92)
NOTE = u'研究笔记'


def load(cid):
    p = sorted(glob.glob(os.path.join(NOTE, cid + u'-*.md')))
    return os.path.basename(p[0]), io.open(p[0], encoding='utf-8').read().split(u'\n')


for cid, rows in [(u'D128', [315]), (u'D139', [111]), (u'D157', [795, 826]),
                  (u'D326', [39, 40, 41]), (u'D576', [175])]:
    name, lines = load(cid)
    for r in rows:
        print(u'--- %s:%d' % (name[:30], r))
        print(lines[r - 1])

print(u'=== 第二枚 \\red 在哪')
rx = re.compile(re.escape(B + u'red'))
for path in sorted(glob.glob(os.path.join(NOTE, u'D*.md'))):
    txt = io.open(path, encoding='utf-8').read().split(u'\n')
    for li, line in enumerate(txt, 1):
        for m in rx.finditer(line):
            print(u'  %s:%d  %s' % (os.path.basename(path)[:24], li, line[max(0, m.start() - 40):m.start() + 30]))

print(u'=== 7 处 F3 片段的本篇枚数')
FRAGS = [
    (u'D139', B + u'text{' + u'$s$ 的固定幂}'),
    (u'D163', B + u'text{ 是 $k$-power-free}'),
    (u'D30', B + u'text{$F$ 有界全纯}'),
    (u'D396', B + u'text{至少 $s$ 个槽在 }'),
    (u'D57', B + u'text{$S$ 是 transversal}'),
    (u'D582', B + u'text{$i$ 之后下一钉在 $T$}'),
    (u'D750', B + u'text{$n$ 圈的返回贡献}'),
]
for cid, frag in FRAGS:
    name, lines = load(cid)
    n = sum(l.count(frag) for l in lines)
    at = [i + 1 for i, l in enumerate(lines) if frag in l]
    print(u'  %-6s 枚=%d 行=%s  %s' % (cid, n, at, repr(frag[:34])))
