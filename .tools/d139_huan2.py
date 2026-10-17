# -*- coding: utf-8 -*-
import io, glob

SW = u'\u6362\u53e5\u8bdd\uff0c'
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D139-*.md')[0]
t = io.open(p, encoding='utf-8').read()
print('D139 swapped before=%d' % t.count(SW))
t = t.replace(SW, u'')
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('D139 swapped after=%d' % t.count(SW))

for pat in ['D136', 'D142', 'D144']:
    q = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/' + pat + u'-*.md')[0]
    lines = io.open(q, encoding='utf-8').read().split('\n')
    print('=== %s ===' % pat)
    for i, l in enumerate(lines, 1):
        if u'\u88ab\u8c01\u6d88\u8d39' in l or u'\u82e5\u6539\u52a8' in l:
            print('L%d %s' % (i, repr(l[:150])))
