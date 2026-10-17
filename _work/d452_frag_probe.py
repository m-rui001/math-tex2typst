# -*- coding: utf-8 -*-
import io, sys
sys.stdout.reconfigure(encoding='utf-8')
P = u'研究笔记/D452-每个无理旋转的不变投影反例.md'
lines = io.open(P, encoding='utf-8').read().split(u'\n')
FRAG = u'$^{]}$'
for n in (398, 414):
    l = lines[n - 1]
    i = l.find(FRAG)
    print('L%d  $=%d  frag at %d' % (n, l.count(u'$'), i))
    if i >= 0:
        seg = l[max(0, i - 24):i + 24]
        print('   ', repr(seg))
    print('   codepoints around:', [hex(ord(c)) for c in l[max(0, i - 4):i + 1]])
