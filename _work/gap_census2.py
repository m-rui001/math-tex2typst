# -*- coding: utf-8 -*-
"""Real section-number gaps: any '## ' heading carrying a number counts.

Shapes seen in the corpus: '## 7.', '## 7 ', '## 7、', '## §7', '## 七、'.
A gap is an integer inside [first, last] with no heading of that number.
"""
from __future__ import unicode_literals
import io, os, re, glob

U = u'\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d'
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
NUM = re.compile(u'^##\\s*(?:\\u00a7\\s*)?(\\d+)(?:[.\\u3001)\\s]|$)')
CN = re.compile(u'^##\\s*(' + U + u'{1,3})(?:\\u3001|\\s|[.)]|$)')


def cn2num(s):
    if s == u'\u5341':
        return 10
    if len(s) == 1:
        return U.index(s) + 1 if s in U else None
    if s[0] == u'\u5341':
        return 10 + (U.index(s[1]) + 1 if s[1] in U else 0)
    if u'\u5341' in s:
        a, b = s.split(u'\u5341')
        return (U.index(a) + 1) * 10 + (U.index(b) + 1 if b in U else 0)
    return None


gaps = []
for p in sorted(glob.glob(os.path.join(ROOT, 'D*.md'))):
    t = io.open(p, encoding='utf-8').read()
    seq = []
    for l in t.split(u'\n'):
        m = NUM.match(l)
        if m:
            seq.append(int(m.group(1)))
            continue
        m = CN.match(l)
        if m:
            k = cn2num(m.group(1))
            if k:
                seq.append(k)
    if len(seq) < 3:
        continue
    have = set(seq)
    miss = sorted(set(range(min(seq), max(seq) + 1)) - have)
    if miss:
        gaps.append((os.path.basename(p)[:10], min(seq), max(seq), len(seq), miss))
print('files=%d with_gaps=%d' % (len(glob.glob(os.path.join(ROOT, 'D*.md'))), len(gaps)))
for g in gaps:
    print('  %s range=%d..%d heads=%d missing=%s' % g)
