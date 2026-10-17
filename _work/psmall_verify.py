# -*- coding: utf-8 -*-
r"""收稿断言（改到能跑）：把修前 body 用与驱动同一变换算成期望形，逐站问盘上有没有；
矩阵 cell 序列要一字不动，唯一的额外变化是 D49 那一枚补回来的 `\mathbf` 反斜杠。
"""
import glob
import io
import json
import os
import re

B = chr(92)
OLD = json.load(io.open(u'_work/psmall_bodies.json', encoding='utf-8'))


def fix_env(s):
    s = s.replace(B + u'begin{psmallmatrix}', B + u'left(' + B + u'begin{smallmatrix}')
    s = s.replace(B + u'end{psmallmatrix}', B + u'end{smallmatrix}' + B + u'right)')
    return s


def cells(s):
    s = re.sub(r'\\(left|right|begin|end)[({]\s*', u'', s)
    s = re.sub(r'[})]', u'', s)
    return s.replace(u'&', u'|').replace(B + B, u' / ')


hit = miss = 0
for o in sorted(OLD, key=lambda x: (x['file'], x['line'])):
    f = u'研究笔记/' + o[u'file']
    t = io.open(f, encoding='utf-8').read()
    exp = fix_env(o[u'body'])
    if o[u'file'].startswith(u'D49'):
        exp = exp.replace(B + B + u'mathbf', B + B + B + u'mathbf')
    n = t.count(exp)
    same_cells = cells(exp).replace(B + u'mathbf', u'mathbf') == cells(o[u'body'])
    hit += 1 if n else 0
    miss += 0 if n else 1
    print(u'%s:%-4d 盘上=%d cell不变=%s  %s' % (
        o[u'file'][:4], o[u'line'], n, same_cells, exp[:78]))
print(u'站=%d 命中=%d 缺=%d' % (len(OLD), hit, miss))

for cid in [u'D214', u'D24', u'D47', u'D49']:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    tt = io.open(f, encoding='utf-8').read()
    print(u'%s psmallmatrix=%d  \\left(\\begin{smallmatrix}=%d  \\end{smallmatrix}\\right)=%d' % (
        cid, tt.count(u'psmallmatrix'),
        tt.count(B + u'left(' + B + u'begin{smallmatrix}'),
        tt.count(B + u'end{smallmatrix}' + B + u'right)')))
