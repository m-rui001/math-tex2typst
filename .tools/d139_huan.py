# -*- coding: utf-8 -*-
import io, glob

HUAN = u'\u6362\u53e5\u8bf4\u8bdd\uff0c'
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D139-*.md')[0]
t = io.open(p, encoding='utf-8').read()
n = t.count(HUAN)
print('hits', n, 'raw-huan', t.count(u'\u6362\u53e5'))
if n:
    t = t.replace(HUAN, u'')
    io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('after', t.count(HUAN), t.count(u'\u6362\u53e5'), t.count(u'\u8bf4\u8bdd'))
for i, l in enumerate(t.split('\n'), 1):
    if u'\u6362\u53e5' in l:
        print('L%d %s' % (i, l[:200]))
