# -*- coding: utf-8 -*-
"""Pair every $ left-to-right per file, then classify pairs that straddle a newline."""
from __future__ import unicode_literals
import io, os, re, glob

D = chr(36)
BT = chr(96)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'

rows = []
for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
    t = io.open(p, encoding='utf-8').read()
    pos = [i for i, c in enumerate(t) if c == D]
    if len(pos) % 2:
        rows.append((os.path.basename(p)[:6], 'ODD_TOTAL', len(pos), 0, 0, u''))
        continue
    for k in range(0, len(pos), 2):
        s = t[pos[k]:pos[k + 1] + 1]
        nl = s.count(u'\n')
        if nl:
            line = t.count(u'\n', 0, pos[k]) + 1
            rows.append((os.path.basename(p)[:6], 'WRAP', nl, line,
                         s.count(BT) % 2, s[:80].replace(u'\n', u' ~ ')))

wrap = [r for r in rows if r[1] == 'WRAP']
odd = [r for r in rows if r[1] == 'ODD_TOTAL']
code = [r for r in wrap if r[4]]
plain = [r for r in wrap if not r[4]]
multi = [r for r in plain if r[2] >= 2]
single = [r for r in plain if r[2] == 1]
print('odd_total_files=%d wrap_pairs=%d' % (len(odd), len(wrap)))
print('  with_backtick_in_pair=%d' % len(code))
print('  plain_single_newline=%d  plain_multi_newline=%d' % (len(single), len(multi)))
print('plain_multi files=%d' % len(set(r[0] for r in multi)))
for r in multi[:25]:
    print(*r[:5], r[5])
print('--- single-newline sample by file counts (top 12)')
cnt = {}
for r in single:
    cnt[r[0]] = cnt.get(r[0], 0) + 1
for k, v in sorted(cnt.items(), key=lambda x: -x[1])[:12]:
    print(k, v)
