# -*- coding: utf-8 -*-
"""Why does a note get no material directory? Print, per unmatched note, the first
line that mentions the corpus path and the regex verdict on it."""
from __future__ import unicode_literals
import io, os, re, glob, sys

ROOT = u'E:/math/' + u'研究笔记'
BS = chr(92)
DIRPAT = re.compile(u'preprints' + ('[' + BS + BS + '/]') + u'([A-Za-z0-9._%+' + BS + u'-]+)')
HINT = re.compile(u'preprints')

out = io.open(u'E:/math/_work/missing_dir_report.txt', 'w', encoding='utf-8')
n = 0
for p in sorted(glob.glob(os.path.join(ROOT, u'D*.md'))):
    t = io.open(p, encoding='utf-8').read()
    lines = t.split(u'\n')
    head = u'\n'.join(lines[:25])
    m = DIRPAT.search(head)
    if m:
        d = m.group(1).rstrip(u'.')
        cand = os.path.join(u'E:/math/preprints', d)
        if os.path.isdir(cand):
            continue
        n += 1
        out.write(u'== %s BADDIR name=%s\n' % (os.path.basename(p)[:20], d[:70]))
        continue
    n += 1
    hits = [(k + 1, l.strip()[:120]) for k, l in enumerate(lines) if HINT.search(l)][:2]
    out.write(u'== %s NOPAT lines=%d\n' % (os.path.basename(p)[:20], len(lines)))
    for k, l in hits:
        out.write(u'   %d: %s\n' % (k, l))
out.write(u'total_unresolved=%d\n' % n)
out.close()
print(u'unresolved=%d' % n)
