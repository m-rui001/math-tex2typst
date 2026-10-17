# -*- coding: utf-8 -*-
# Execute the upper 本体侧 leg's REPAIR queue (6 declared rows / 7 sites).
# The leg itself wrote nothing because inflight churned; its range (D400-D734)
# is now free. Every site is a whole-string swap on the declared defect line:
# the declaration line keeps quoting the bad form on purpose, so counts drop
# by one, not to zero, where the agent said so.
import io
import os
import re
import sys

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
APPLY = '--apply' in sys.argv

# (note id, line no, bad, good, declared byte delta, expected post-count of bad)
SITES = [
    ('D486', 174, u'kernel.tex:140 \u81f3 planar \u547d\u9898\u7684\u56de\u6307\u5728 kernel.tex:141',
     u'\u547d\u9898\u56de\u6307\u89c1 kernel.tex:140 \u81f3 kernel.tex:141', -10, 0),
    ('D494', 287, u'\u5e76\u662f\u975e\u8981\u4ea4\u4ee3\u7684\u8fb9\u89d2',
     u'\u5e76\u975e\u591a\u4f59\u7684\u8fb9\u89d2\u4ea4\u4ee3', 0, 0),
    ('D542', 302, u'\u5e94\u8d8a\u8fc7\u4e03\u4e07\u4e00\u5343\u514b\u4e00\u7ebf',
     u'\u5e94\u8d8a\u8fc7\u4e03\u4e07\u4e00\u5343\u4e94\u767e\u4e00\u7ebf', 3, 1),
    ('D543', 250, u'\u672a\u8bd1Foreign\u5f62\u6001\u8bcd',
     u'\u672a\u8bd1\u5f62\u6001\u8bcd', -7, 0),
    ('D543', 250, u'\u6240display \u4e0d\u7b49\u5f0f',
     u'\u6240\u793a\u4e0d\u7b49\u5f0f', -5, 0),
    ('D570', 137, u'\u7a7a $c_*$ \u4e0e\u5305\u542b\u4ea4\u53e0\u540c-cover',
     u'\u7a7a $c_*$ \u4e0e\u5305\u542b\u4ea4\u53e0\u540c\u6837\u8986\u76d6', 3, 1),
    ('D595', 250, u'\u6b63\u6587\u524d\u4e94\u5343\u7c73',
     u'\u6b63\u6587\u524d\u4e94\u5343\u514b\u5b57\u7b26', 6, 1),
]

rows = ['mode=%s' % ('APPLY' if APPLY else 'DRY-RUN')]
by_note = {}
for nid, ln, bad, good, delta, post in SITES:
    by_note.setdefault(nid, []).append((ln, bad, good, delta, post))

for nid, edits in sorted(by_note.items()):
    cand = [f for f in os.listdir(NOTES) if f.startswith(nid + '-')]
    assert len(cand) == 1, cand
    p = os.path.join(NOTES, cand[0])
    raw = io.open(p, 'rb').read()
    assert raw.count(chr(13).encode()) == 0
    t = raw.decode('utf-8')
    lines = t.split('\n')
    b0 = len(raw)
    for ln, bad, good, delta, post in edits:
        l = lines[ln - 1]
        assert l.count(bad) >= 1, (nid, ln, 'bad form not on the declared line')
        new = l.replace(bad, good)
        assert new.count(bad) == 0, (nid, ln, 'bad form still on the line')
        assert new.count('$') % 2 == 0 and new.count(chr(96)) % 2 == 0, (nid, ln, 'parity')
        lines[ln - 1] = new
        rows.append('%s L%d swap bytes %+d  bad-in-line %d->%d' % (
            nid, ln, (len(new.encode('utf-8')) - len(l.encode('utf-8'))),
            l.count(bad), new.count(bad)))
    out = '\n'.join(lines)
    new_bytes = out.encode('utf-8')
    total_delta = sum(e[3] for e in edits)
    assert len(new_bytes) - b0 == total_delta, (nid, len(new_bytes) - b0, total_delta)
    assert new_bytes.count(chr(10).encode()) == raw.count(chr(10).encode())
    for ln, bad, good, delta, post in edits:
        assert out.count(bad) == post, (nid, 'bad count %d != declared %d' % (out.count(bad), post))
    assert out.count('$') % 2 == 0 and out.count(chr(96)) % 2 == 0
    rows.append('%s file bytes %d -> %d (delta %+d) lines %d -> %d bad-left %d' % (
        nid, b0, len(new_bytes), total_delta, raw.count(chr(10).encode()),
        new_bytes.count(chr(10).encode()), sum(out.count(e[1]) for e in edits)))
    if APPLY:
        io.open(p, 'wb').write(new_bytes)
        rows.append('%s WRITTEN' % nid)

io.open(os.path.join('E:', BS, BS, 'math', '_work', 'bodyside_upper_repair.txt'), 'wb') \
    .write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print(rows[0], 'rows', len(rows))
