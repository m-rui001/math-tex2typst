# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import io, glob, sys

B = chr(92)
path = glob.glob(u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + u'/D84-*.md')[0]
t = io.open(path, encoding='utf-8').read()

old_span = u'$' + B + u'lvert' + B + u'rVert' + u'$'
new_span = (u'$' + B + u'mu' + B + u'bigl(B(x,r)' + B + u'cap g(B_' +
            B + u'R^n}(0,r))' + B + u'bigr)' + u'$')

assert t.count(old_span) == 1, t.count(old_span)

n = t.replace(old_span, new_span)

assert n.count(B + u'lvert') == t.count(B + u'lvert') - 1
assert n.count(B + u'rVert') == t.count(B + u'rVert') - 1
assert n.count(chr(36)) == t.count(chr(36))
assert n.count(B + u'mu') == t.count(B + u'mu') + 1
assert n.count(B + u'bigl') == t.count(B + u'bigl') + 1
assert n.count(B + u'bigr') == t.count(B + u'bigr') + 1
assert n.count(old_span) == 0

lines = t.split(u'\n')
k = [i for i, l in enumerate(lines) if old_span in l]
assert len(k) == 1
print('line', k[0] + 1)
print('before', repr(lines[k[0]][60:140]))
print('after ', repr(n.split(u'\n')[k[0]][60:190]))
print('size %d -> %d' % (len(t.encode('utf-8')), len(n.encode('utf-8'))))

if '--apply' in sys.argv:
    io.open(path, 'w', encoding='utf-8', newline='').write(n)
    print('APPLIED', path)
