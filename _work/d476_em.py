# -*- coding: utf-8 -*-
import glob, io, re

EM = u'\u2014'
P = glob.glob(u'研究笔记/D476-*.md')[0]
b = io.open(P, 'rb').read()
t = b.decode('utf-8')
assert b.count(b'\r') == 0
L = t.split(u'\n')

EDITS = [
    (315, u'等行替换' + EM + EM + u'行数', u'等行替换：行数'),
    (323, u'不改' + EM + EM + u'本篇旧文', u'不改，本篇旧文'),
]
for ln, old, new in EDITS:
    i = ln - 1
    assert L[i].count(old) == 1, (ln, L[i].count(old))
    L[i] = L[i].replace(old, new)

out = u'\n'.join(L).encode('utf-8')
assert out.count(b'\r') == 0
assert len(out) == len(b) - 6, (len(b), len(out))
assert out.decode('utf-8').count(EM) == 0
assert t.count(u'$') == out.decode('utf-8').count(u'$')
assert t.count(u'\n') == out.decode('utf-8').count(u'\n')

io.open(P, 'wb').write(out)
print('ok size %d -> %d' % (len(b), len(out)))
