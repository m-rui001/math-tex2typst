# -*- coding: utf-8 -*-
import glob, io

P = glob.glob(u'研究笔记/D71-*.md')[0]
b = io.open(P, 'rb').read()
t = b.decode('utf-8')
assert b.count(b'\r') == 0
L = t.split(u'\n')

EDITS = [
    (705, u'$|E|=km$', u'$\\lvert E\\rvert=km$'),
    (706, u'$k|S|=2|E(S)|+\\lvert\\delta(S)\\rvert$',
     u'$k\\lvert S\\rvert=2\\lvert E(S)\\rvert+\\lvert\\delta(S)\\rvert$'),
]

dollar = t.count(u'$')
tick = t.count(u'`')
lines = t.count(u'\n')

for ln, old, new in EDITS:
    i = ln - 1
    assert L[i].count(old) == 1, (ln, L[i].count(old))
    assert L[i].count(u'|') - old.count(u'|') == 6, (ln, L[i].count(u'|'))
    L[i] = L[i].replace(old, new)
    assert L[i].count(u'|') == 6, (ln, L[i].count(u'|'))

s = u'\n'.join(L)
out = s.encode('utf-8')
assert s.count(u'$') == dollar
assert s.count(u'`') == tick
assert s.count(u'\n') == lines
assert out.count(b'\r') == 0
assert s.count(u'\\lvert') - t.count(u'\\lvert') == 3
assert s.count(u'\\rvert') - t.count(u'\\rvert') == 3

io.open(P, 'wb').write(out)
print('ok size %d -> %d' % (len(b), len(out)))
