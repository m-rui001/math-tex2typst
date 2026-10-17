# -*- coding: utf-8 -*-
import glob, io, re, unicodedata

P = glob.glob(u'研究笔记/D71-*.md')[0]
t = io.open(P, 'rb').read().decode('utf-8')
L = t.split(u'\n')
SPLIT = 610

out = []
for w in [u'crossing', u'applied', u'Kasteleyn', u'Pfaffian', u'Tutte']:
    old = new = 0
    ctx = []
    for i, l in enumerate(L):
        c = l.count(w)
        if not c:
            continue
        if i + 1 < SPLIT:
            old += c
        else:
            new += c
        for m in re.finditer(re.escape(w), l):
            a = max(0, m.start() - 34)
            ctx.append(u'%s%d | ...%s...' % (u'*' if i + 1 >= SPLIT else u' ', i + 1,
                                             l[a:m.end() + 30]))
    out.append(u'=== %s old=%d new=%d' % (w, old, new))
    out.extend(ctx[:8])

out.append(u'')
for ph in [u'通向系', u'的系让', u'被引']:
    out.append(u'### %s' % ph)
    for i, l in enumerate(L):
        if ph in l:
            m = l.find(ph)
            out.append(u'%s%d | ...%s...' % (u'*' if i + 1 >= SPLIT else u' ', i + 1,
                                             l[max(0, m - 40):m + 44]))

io.open(u'_work/d71_shapes.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('written', len(out))
