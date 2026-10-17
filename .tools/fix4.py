# -*- coding: utf-8 -*-
import io, glob

ERSHI = u'\u800c\u662f'
old = u'\u82e5 Y \u4e0d\u7ed9 \u2115 \u7684\u79bb\u6563\u62d3\u6251\u800c\u662f\u67d0\u4e2a\u7c97\u62d3\u6251\uff0c'
new = u'\u82e5 Y \u7684\u62d3\u6251\u7c97\u4e8e \u2115 \u7684\u79bb\u6563\u62d3\u6251\uff0c'

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D87-*.md')[0]
t = io.open(p, encoding='utf-8').read()
print('hits', t.count(old))
t = t.replace(old, new)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('ershi', t.count(ERSHI), 'size', len(t.encode('utf-8')))
