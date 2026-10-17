# -*- coding: utf-8 -*-
import io
import os

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
cand = [f for f in os.listdir(NOTES) if f.startswith('D410-')]
assert len(cand) == 1, cand
p = os.path.join(NOTES, cand[0])
t = io.open(p, encoding='utf-8').read()
l = t.split('\n')[18]
BT = chr(96)
D = chr(36)
rows = []
rows.append('bt=%d dollar=%d len=%d' % (l.count(BT), l.count(D), len(l)))
idx = l.find(u'775')
rows.append('around775=%s' % repr(l[idx - 12:idx + 30]))
idx2 = l.find(u'560')
rows.append('around560=%s' % repr(l[idx2 - 20:idx2 + 30]))
io.open(os.path.join('E:', BS, BS, 'math', '_work', 'd410_l19.txt'), 'wb').write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print('\n'.join(rows[:1]))
