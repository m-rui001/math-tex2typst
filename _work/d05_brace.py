# -*- coding: utf-8 -*-
import glob, io, sys

B = chr(92)
f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D05-*.md')[0]
t = io.open(f, encoding='utf-8', errors='ignore').read()
old = B + u'rVert_{\\infty}' + B + u'}' + B + u'}' + u'\\right'
new = B + u'rVert_{\\infty}' + B + u'}' + u'}' + u'\\right'
assert t.count(old) == 1, t.count(old)
n = t.replace(old, new)
assert len(n) == len(t) - 1
assert n.count(u'{') == t.count(u'{')
assert n.count(u'}') == t.count(u'}')
assert n.count(B) == t.count(B) - 1
assert n.count(chr(36)) == t.count(chr(36))
print('ok', len(t), '->', len(n))
if '--apply' in sys.argv:
    io.open('_work/D05.pre-brace.md', 'w', encoding='utf-8').write(t)
    io.open(f, 'w', encoding='utf-8', newline='').write(n)
    print('applied')
