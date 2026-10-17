# -*- coding: utf-8 -*-
import glob, io, sys

B = chr(92)
D = chr(124)
f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D91-*.md')[0]
t = io.open(f, encoding='utf-8', errors='ignore').read()
L = t.split(u'\n')
idx = [i for i, l in enumerate(L) if l.startswith(D) and l.count(D) == 8]
assert len(idx) == 1, idx
i = idx[0]
old = D + u'H_0' + D + B + u'le'
new = B + u'lvert H_0' + B + u'rvert ' + B + u'le'
assert L[i].count(old) == 1, L[i].count(old)
line = L[i].replace(old, new)
assert line.count(D) == 6
L[i] = line
n = u'\n'.join(L)
assert len(n) == len(t) + (len(new) - len(old))
print('line', i + 1, repr(line[:130]))
if '--apply' in sys.argv:
    io.open('_work/D91.pre-barepipe.md', 'w', encoding='utf-8').write(t)
    io.open(f, 'w', encoding='utf-8', newline='').write(n)
    print('applied', len(t), '->', len(n))
