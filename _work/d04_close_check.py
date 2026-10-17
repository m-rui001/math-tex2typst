# -*- coding: utf-8 -*-
# Post-edit invariant check on D04 + pipe census over the table block the writer appended.
import io, sys, collections

P = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + u'/D04-乘性函数二点关联.md'
raw = io.open(P, 'rb').read()
t = raw.decode('utf-8')
lines = t.split('\n')
print('bytes', len(raw), 'lines', len(lines), 'cr', raw.count(b'\r'))
print('dollar', t.count('$'), 'backtick', t.count('`'))
for w in (u'\u800c\u662f', u'\u800c\u4e0d\u662f', u'\u3001\u4e0d\u662f', u'\uff0c\uff0c'):
    print('hit', w.encode('unicode_escape').decode(), t.count(w))

# The appended ledger block lives after the last section heading; gate.rows cannot see it.
start = max(i for i, l in enumerate(lines) if l.startswith(u'## '))
print('last_head_line', start + 1, lines[start][:40].encode('unicode_escape').decode())
hist = collections.Counter()
first = last = None
for i in range(start, len(lines)):
    l = lines[i]
    if l.count('|') >= 2:
        hist[l.count('|')] += 1
        if first is None:
            first = i + 1
        last = i + 1
print('pipecount_histogram', dict(hist), 'block', first, last, 'rows', sum(hist.values()))
