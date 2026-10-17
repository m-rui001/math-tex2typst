# -*- coding: utf-8 -*-
# Census the "code-span opened with a backtick but closed with a dollar" shape:
# sites are lines whose backtick count is odd AND that carry `NNN$ immediately
# before a Chinese char. Replacement (the $ -> a backtick) must make BOTH counts even.
import io
import os
import re

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
OUT = os.path.join('E:', BS, BS, 'math', '_work', 'btick_tail.txt')
BT = chr(96)
DOLLAR = chr(36)
PAT = re.compile(BT + u'([0-9]{2,4})' + u'[' + DOLLAR + u']' + u'(?=[^' + BT + DOLLAR + u'])')

rows = []
notes = sorted(f for f in os.listdir(NOTES) if f.endswith('.md') and f.startswith('D'))
odd_bt_lines = 0
notes_odd = 0
hits = []
for f in notes:
    t = io.open(os.path.join(NOTES, f), encoding='utf-8').read()
    nid = f.split('-')[0]
    line_hits = 0
    odd_here = 0
    for i, l in enumerate(t.split('\n')):
        if l.count(BT) % 2:
            odd_here += 1
        m = PAT.findall(l)
        if m:
            line_hits += len(m)
            hits.append('%s L%d bt=%d dollar=%d cand=%s ctx=%s' % (nid, i + 1, l.count(BT), l.count(DOLLAR), ','.join(m), l[max(0, l.find(BT + m[0] + DOLLAR) - 40):l.find(BT + m[0] + DOLLAR) + 20]))
    if odd_here:
        notes_odd += 1
        odd_bt_lines += odd_here
    if line_hits:
        rows.append('%s odd_bt_lines=%d shape_hits=%d' % (nid, odd_here, line_hits))
rows.insert(0, 'notes=%d notes_with_odd_backtick_line=%d odd_lines_total=%d' % (len(notes), notes_odd, odd_bt_lines))
rows.insert(1, '---- candidate sites (backtick-digits-dollar inside an odd-backtick line) ----')
rows.extend(hits)
io.open(OUT, 'wb').write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print('wrote', OUT, 'sites', len(hits))
