# -*- coding: utf-8 -*-
import glob, io, sys

B = chr(92)
f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D01-*.md')[0]
t = io.open(f, encoding='utf-8', errors='ignore').read()
old = B + u'langle x+y,v' + B + u'rVert' + B + u'le'
new = B + u'langle x+y,v' + B + u'rangle' + B + u'le'
assert t.count(old) == 1, t.count(old)
n = t.replace(old, new)
assert len(n) == len(t) + len(new) - len(old)
assert n.count(B + u'langle') == t.count(B + u'langle')
assert n.count(B + u'rangle') == t.count(B + u'rangle') + 1
assert n.count(B + u'rVert') == t.count(B + u'rVert') - 1
assert n.count(chr(36)) == t.count(chr(36))
print('ok', len(t), '->', len(n))
if '--apply' in sys.argv:
    io.open('_work/D01.pre-delim.md', 'w', encoding='utf-8').write(t)
    io.open(f, 'w', encoding='utf-8', newline='').write(n)
    print('applied')
