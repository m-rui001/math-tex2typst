# -*- coding: utf-8 -*-
import io, glob, os

ERSHI = u'\u800c\u662f'
for pid in ('D39', 'D51', 'D88'):
    for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pid):
        sz = os.path.getsize(p)
        print('FILE', p[-40:], sz)
        if sz == 0:
            continue
        lines = io.open(p, encoding='utf-8').read().split('\n')
        for i, l in enumerate(lines, 1):
            k = l.find(ERSHI)
            if k >= 0:
                print('  %s@%d|%s' % (pid, i, l[max(0, k - 66):k + 34]))
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D33-*.md')[0]
lines = io.open(p, encoding='utf-8').read().split('\n')
h = max(i for i, l in enumerate(lines) if l.startswith(u'| \u7b26\u53f7 |'))
for j in range(h + 1, len(lines)):
    if not lines[j].startswith('| '):
        break
    if lines[j].count('|') != 6:
        print('D33 bad row', j + 1, lines[j][:220])
