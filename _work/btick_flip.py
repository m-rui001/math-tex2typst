# -*- coding: utf-8 -*-
# Flip the mistyped code-span closers ( `NNN$ -> `NNN` ) found by btick_tail.py.
# Dry-run by default: prints per-site context and the predicted parity outcome.
# Pass the ids to touch; a note owned by a running writer or repair leg must
# stay out of that list until its owner lands.
import io
import os
import re
import sys

BS = chr(92)
NOTES = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
BT = chr(96)
DOLLAR = chr(36)
PAT = re.compile(BT + u'([0-9]{2,4})' + u'[' + DOLLAR + u']' + u'(?=[^' + BT + DOLLAR + u'])')
TARGETS = [a for a in sys.argv[1:] if not a.startswith('--')]
assert TARGETS, 'give the note ids to flip, e.g. python _work/btick_flip.py D229'
APPLY = '--apply' in sys.argv
rows = []
for nid in TARGETS:
    cand = [f for f in os.listdir(NOTES) if f.startswith(nid + '-')]
    assert len(cand) == 1, cand
    p = os.path.join(NOTES, cand[0])
    raw = io.open(p, 'rb').read()
    assert raw.count(chr(13).encode()) == 0
    t = raw.decode('utf-8')
    lines = t.split('\n')
    n = 0
    for i, l in enumerate(lines):
        m = PAT.findall(l)
        if not m:
            continue
        new = PAT.sub(lambda x: BT + x.group(1) + BT, l)
        n += len(m)
        rows.append('%s L%d hits=%d bt %d->%d dollar %d->%d' % (
            nid, i + 1, len(m), l.count(BT), new.count(BT), l.count(DOLLAR), new.count(DOLLAR)))
        assert new.count(BT) % 2 == 0 and new.count(DOLLAR) % 2 == 0, 'parity not fixed on this line'
        assert len(new) == len(l)
    old_file = t
    new_file = PAT.sub(lambda x: BT + x.group(1) + BT, t)
    rows.append('%s total=%d bytes %d -> %d lines %d -> %d' % (
        nid, n, len(old_file.encode('utf-8')), len(new_file.encode('utf-8')),
        old_file.count(chr(10)), new_file.count(chr(10))))
    if APPLY and n:
        buf = new_file.encode('utf-8')
        assert buf.count(chr(13).encode()) == 0
        assert buf.count(chr(10).encode()) == old_file.count(chr(10))
        io.open(p, 'wb').write(buf)
        rows.append('%s WRITTEN' % nid)
rows.insert(0, 'mode=%s' % ('APPLY' if APPLY else 'DRY-RUN'))
io.open(os.path.join('E:', BS, BS, 'math', '_work', 'btick_flip.txt'), 'wb').write((u'\n'.join(rows) + u'\n').encode('utf-8'))
print(rows[0], 'lines', len(rows))
