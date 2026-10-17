# -*- coding: utf-8 -*-
r"""D142 里 `R_{ab}&` 的两处分别在哪：逐行打印命中行号与该串前后窗口，并数**候选 old** 的整篇命中。"""
import glob
import io

BS = chr(92)
ND = u'R_{ab}&'
OLD = u'"$R_{ab}&=' + BS + u'cup B_bR_a(L_bR_a)^*F_b.$"'
path = glob.glob(u'研究笔记/D142-*.md')[0]
text = io.open(path, encoding=u'utf-8').read()
lines = text.split(u'\n')
print(u'候选 old 整篇命中=%d   短 needle 整篇命中=%d' % (text.count(OLD), text.count(ND)))
for i, l in enumerate(lines):
    if ND in l:
        j = l.index(ND)
        print(u'%d | %r' % (i + 1, l[max(0, j - 60):j + 90]))
