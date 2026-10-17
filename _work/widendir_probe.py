# -*- coding: utf-8 -*-
"""How many notes could a widened material-dir search resolve, and how many of them
register more than one distinct directory (which would make the choice unsafe)?"""
from __future__ import unicode_literals
import io, os, re, glob
from collections import Counter

ROOT = u'E:/math/' + u'研究笔记'
BS = chr(92)
PAT = re.compile(u'preprints' + ('[' + BS + BS + '/]') +
                 u'([A-Za-z0-9._%+' + BS + u'-]+)')
HEADWIN = 25

multi = 0
single = 0
none = 0
rows = []
for p in sorted(glob.glob(os.path.join(ROOT, u'D*.md'))):
    key = re.match(u'(D\\d+)', os.path.basename(p)).group(1)
    t = io.open(p, encoding='utf-8').read()
    lines = t.split(u'\n')
    if PAT.search(u'\n'.join(lines[:HEADWIN])):
        continue
    c = Counter()
    for m in PAT.finditer(t):
        name = m.group(1).rstrip(u'.')
        cand = os.path.join(u'E:/math/preprints', name)
        if not os.path.isdir(cand):
            g = glob.glob(os.path.join(u'E:/math/preprints', name[:40] + u'*'))
            if not g:
                continue
            name = os.path.basename(g[0])
        c[name] += 1
    if not c:
        none += 1
        rows.append(u'NONE ' + key + u' ' + os.path.basename(p)[:24])
    elif len(c) == 1:
        single += 1
        rows.append(u'SINGLE ' + key + u' ' + list(c)[0][:60] + u' x' + str(list(c.values())[0]))
    else:
        multi += 1
        top = c.most_common(3)
        rows.append(u'MULTI ' + key + u' ' + u' | '.join(u'%s x%d' % (n[:40], k) for n, k in top))
print(u'outside_head: single=%d multi=%d none=%d' % (single, multi, none))
io.open(u'E:/math/_work/widendir_report.txt', 'w', encoding='utf-8').write(u'\n'.join(rows))
