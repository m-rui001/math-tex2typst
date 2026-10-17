# -*- coding: utf-8 -*-
"""Odd-dollar parity census v3.

Single state machine over the file: fenced ``` blocks skipped, inline code
spans (which may cross lines) masked, escaped \\$ masked.  What is left is
real inline-math delimiter parity, counted per line.
"""
import io, os, glob

D = chr(36)
BT = chr(96)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'

rows = []
for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
    L = io.open(p, encoding='utf-8').read().split('\n')
    odd = []
    infence = False
    insp = False
    for i, line in enumerate(L):
        if line.lstrip().startswith(BT * 3):
            infence = not infence
            insp = False
            continue
        if infence:
            continue
        cnt = 0
        j = 0
        while j < len(line):
            c = line[j]
            if c == '\\':
                j += 2
                continue
            if c == BT:
                insp = not insp
                j += 1
                continue
            if c == D and not insp:
                cnt += 1
            j += 1
        if cnt % 2 == 1:
            odd.append(i + 1)
    if odd:
        rows.append((os.path.basename(p).split('-')[0], len(odd), odd[:10]))

rows.sort(key=lambda z: -z[1])
out = io.open('_work/odd_census_v3.txt', 'w', encoding='utf-8')
out.write('notes=%d lines=%d\n' % (len(rows), sum(r[1] for r in rows)))
for r in rows:
    out.write('%s odd=%d lines=%s\n' % r)
out.close()
print('notes=%d lines=%d' % (len(rows), sum(r[1] for r in rows)))
