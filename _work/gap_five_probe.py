# -*- coding: utf-8 -*-
"""Adjudicate the five notes gap_census2 now reports as having missing section numbers.

A gap is only a defect when nothing says why: the writer may have declared the number
permanently withdrawn (then it stays), or the heading may have been eaten by an anchor
(then the body is still in the file). Print, per note, every line that names a missing
number, so the classification is made on the note's own words.
"""
from __future__ import unicode_literals
import io, os, re, glob

ROOT = u'E:/math/' + u'研究笔记'
CASES = {
    u'D227': [27, 28, 29, 30],
    u'D244': [11, 12],
    u'D351': [15],
    u'D569': [14, 27],
    u'D643': [9],
}
DECL = re.compile(u'缺号|删去|已删|撤|不再单列|并入|永久|勘误|无第|跳过|没有')
for p in sorted(glob.glob(os.path.join(ROOT, u'D*.md'))):
    key = re.match(u'(D\\d+)', os.path.basename(p)).group(1)
    if key not in CASES:
        continue
    t = io.open(p, encoding='utf-8').read()
    lines = t.split(u'\n')
    heads = [(k + 1, l) for k, l in enumerate(lines) if l.startswith(u'## ')]
    print(u'===== %s heads=%d missing=%s bytes=%d'
          % (os.path.basename(p)[:20], len(heads), CASES[key], os.path.getsize(p)))
    for k in CASES[key]:
        pats = [u'§%d' % k, u'%d 节' % k, u'第 %d 节' % k, u'## %d ' % k]
        hits = [(n, l.strip()[:110]) for n, l in enumerate(lines, 1)
                if any(pt in l for pt in pats) and (DECL.search(l) or u'##' not in l)]
        print(u'  -- §%d mentions=%d' % (k, len(hits)))
        for n, l in hits[:4]:
            print(u'     %d: %s' % (n, l.encode('unicode_escape').decode()[:200]))
    # the heading sequence around the gap
    seq = [h[1][:34] for h in heads]
    print(u'  heads tail:', u' / '.join(x.encode('unicode_escape').decode()[:38] for x in seq[-3:]))
