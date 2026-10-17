# -*- coding: utf-8 -*-
# Expand the four \Q survivors in D256's appended region using this paper's own preamble
# definition (\Q -> \mathbb Q), then re-measure.
import glob
import io
import os

BS = chr(92)
d = os.path.join('E:', BS, BS, 'math', u'\u7814\u7a76\u7b14\u8bb0')
p = glob.glob(os.path.join(d, 'D256-*.md'))[0]
raw = io.open(p, 'rb').read()
before = len(raw)
assert raw.count(chr(13).encode()) == 0
t = raw.decode('utf-8')
lines = t.split('\n')
OLD = BS + 'Q' + '$-factorial'
NEW = BS + 'mathbb Q' + '$-factorial'
hits = [i + 1 for i, l in enumerate(lines) if OLD in l]
cnt = t.count(OLD)
assert cnt == 4, cnt
assert sum(l.count(OLD) for l in lines) == 4
out = t.replace(OLD, NEW)
assert out.count(OLD) == 0
assert out.count(BS + 'mathbb Q' + '$-factorial') == cnt + t.count(BS + 'mathbb Q' + '$-factorial')
buf = out.encode('utf-8')
assert buf.count(chr(13).encode()) == 0
io.open(p, 'wb').write(buf)
print('lines_with_hits', hits, 'bytes', before, '->', len(buf), 'delta', len(buf) - before)
print('Q_total_after', out.count(BS + 'Q'), 'mathbbQ_after', out.count(BS + 'mathbb Q'))
