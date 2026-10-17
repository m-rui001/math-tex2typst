# -*- coding: utf-8 -*-
import glob, io

P = glob.glob(u'研究笔记/D370-*.md')[0]
b = io.open(P, 'rb').read()
t = b.decode('utf-8')
assert b.count(b'\r') == 0
BS = chr(92)
MAP = [(u'$' + BS + 'S$' + BS + 'ref{shell-moment}', u'\u00a74'),
       (u'$' + BS + 'S$' + BS + 'ref{residue-count}', u'\u00a75'),
       (u'$' + BS + 'S$' + BS + 'ref{wrong-turns}', u'\u00a76'),
       (u'$' + BS + 'S$' + BS + 'ref{local-question}', u'\u00a710')]

s = t
counts = []
for old, new in MAP:
    c = s.count(old)
    counts.append(c)
    assert c >= 1, old
    s = s.replace(old, new)

total = sum(counts)
assert total == 6, counts
# 申报句里的省略号写法必须原样留着
assert s.count(u'`$' + BS + 'S$' + BS + 'ref{...}`') == 1
rem = [i + 1 for i, l in enumerate(s.split(u'\n')) if BS + 'ref{' in l]
assert s.count(BS + 'ref{') == t.count(BS + 'ref{') - total, (rem,)
assert rem == [352], rem
assert s.count(BS + 'label{') == t.count(BS + 'label{')
assert s.count(u'\n') == t.count(u'\n')
assert s.count(u'`') == t.count(u'`')
assert s.count(u'$') == t.count(u'$') - 2 * total
out = s.encode('utf-8')
assert out.count(b'\r') == 0

io.open(P, 'wb').write(out)
print('ok counts=%s size %d -> %d' % (counts, len(b), len(out)))
