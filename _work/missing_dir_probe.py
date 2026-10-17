# -*- coding: utf-8 -*-
"""Which notes give no preprints directory in the first 25 lines, and how do they
register their material instead?"""
from __future__ import unicode_literals
import io, os, re, glob
ROOT = u'E:/math/' + u'研究笔记'
DIRPAT = re.compile(u'preprints' + u'[\\/]' + u'([A-Za-z0-9._%+\-]+)')
HINT = re.compile(u'arxiv|素材|目录|build|abs/')
miss = []
for p in sorted(glob.glob(os.path.join(ROOT, u'D*.md'))):
    t = io.open(p, encoding='utf-8').read()
    lines = t.split(u'\n')
    head = u'\n'.join(lines[:25])
    if DIRPAT.search(head):
        continue
    hits = [(k + 1, l.strip()[:78]) for k, l in enumerate(lines[:40]) if HINT.search(l)]
    miss.append((os.path.basename(p)[:14], len(lines), hits[:2]))
print(u'missing=%d' % len(miss))
for name, nl, h in miss[:20]:
    print(u'--', name, u'lines=%d' % nl)
    for k, l in h:
        print(u'   %d: %s' % (k, l))
