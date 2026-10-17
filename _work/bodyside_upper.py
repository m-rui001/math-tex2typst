# -*- coding: utf-8 -*-
# Size the D400+ complement of the body-side restoration leg: how many notes in the
# upper ID range carry the "本体侧" marker, and how heavy the occurrences are.
import io
import os

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
OUT = os.path.join('E:', BS, BS, 'math', '_work', 'bodyside_upper.txt')
KEY = u'\u672c\u4f53\u4fa7'

rows = []
notes = sorted(f for f in os.listdir(NOTES) if f.endswith('.md') and f.startswith('D'))
lo = up = 0
lo_hits = up_hits = 0
up_list = []
for f in notes:
    t = io.open(os.path.join(NOTES, f), encoding='utf-8').read()
    n = t.count(KEY)
    if not n:
        continue
    nid = f.split('-')[0]
    num = int(nid[1:])
    if num <= 399:
        lo += 1
        lo_hits += n
    else:
        up += 1
        up_hits += n
        up_list.append((nid, n))
rows.append('D001-D399 notes=%d occurrences=%d' % (lo, lo_hits))
rows.append('D400+      notes=%d occurrences=%d' % (up, up_hits))
rows.append('')
for nid, n in sorted(up_list, key=lambda x: -x[1]):
    rows.append('%s %d' % (nid, n))
io.open(OUT, 'wb').write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print('wrote', OUT, 'upper_notes', up)
