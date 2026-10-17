# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import io, glob, sys

B = chr(92)
D = chr(36)
path = glob.glob(u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + u'/D84-*.md')[0]
t = io.open(path, encoding='utf-8').read()

old = B + u'lvert' + B + u'langle e_Q,u' + B + u'rVert'
new = B + u'lvert' + B + u'langle e_Q,u' + B + u'rangle'
assert t.count(old) == 1, t.count(old)
n = t.replace(old, new)
assert n.count(B + u'rangle') == t.count(B + u'rangle') + 1
assert n.count(B + u'rVert') == t.count(B + u'rVert') - 1
assert n.count(B + u'lvert') == t.count(B + u'lvert')
assert n.count(B + u'langle') == t.count(B + u'langle')
assert n.count(D) == t.count(D)
lines = t.split(u'\n')
print('line', [i + 1 for i, l in enumerate(lines) if old in l])
print('before', repr(lines[290][95:150]))
print('after ', repr(n.split(u'\n')[290][95:150]))
print('size %d -> %d' % (len(t.encode('utf-8')), len(n.encode('utf-8'))))
if '--apply' in sys.argv:
    io.open(path, 'w', encoding='utf-8', newline='').write(n)
    print('APPLIED', path)
