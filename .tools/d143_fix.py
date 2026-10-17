# -*- coding: utf-8 -*-
import io, glob, re

EM = chr(8212)
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D143-*.md')[0]
t = io.open(p, encoding='utf-8').read()
print('before em=%d ershi=%d fei=%d bc=%d' % (t.count(EM), t.count(u'\u800c\u662f'),
      t.count(u'\u800c\u975e'), t.count(u'\u800c\u4e0d\u662f')))
t = t.replace(EM + EM, u'\uff0c').replace(EM, '--')
t = t.replace(u'\uff0c\u800c\u975e', u'\uff0c\u4e0d\u662f').replace(u'\u800c\u975e', u'\u3001\u4e0d\u662f')
t = t.replace(u'\uff0c\u800c\u662f', u'\uff0c\u662f').replace(u'\u800c\u662f', u'\uff0c\u5c31\u662f')
print('after  em=%d ershi=%d fei=%d cc=%d' % (t.count(EM), t.count(u'\u800c\u662f'),
      t.count(u'\u800c\u975e'), t.count(u'\uff0c\uff0c')))
io.open(p, 'w', encoding='utf-8', newline='').write(t)
lines = t.split('\n')
out = []
for n in [95, 121, 184, 337, 459, 689, 751, 810]:
    out.append('L%d: %s' % (n, lines[n - 1][:260]))
out.append('--- ledger odd cells ---')
for i, l in enumerate(lines, 1):
    if l.startswith('| ') and (u' $\\,$ ' in l or l.count('|') != 6):
        out.append('L%d: %s' % (i, l[:260]))
io.open('.tools/d143_left.txt', 'w', encoding='utf-8').write('\n\n'.join(out))
print('wrote d143_left')
