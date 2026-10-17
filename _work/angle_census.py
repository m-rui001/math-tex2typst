# -*- coding: utf-8 -*-
"""Corpus census: within one math span, is every \\langle closed by \\rangle?"""
from __future__ import unicode_literals
import io, os, re, glob

B = chr(92)
D = chr(36)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'

INLINE = re.compile(re.escape(D) + u'([^$' + re.escape(D) + u']*)' + re.escape(D))
DISPLAY = re.compile(re.escape(B + u'[') + u'(.*?)' + re.escape(B + u']'), re.S)

hits = []
files = sorted(glob.glob(os.path.join(ROOT, '*.md')))
for p in files:
    t = io.open(p, encoding='utf-8').read()
    spans = [(m.group(1), m.start(), 'inline') for m in INLINE.finditer(t)]
    spans += [(m.group(1), m.start(), 'display') for m in DISPLAY.finditer(t)]
    for s, off, kind in spans:
        if s.count(B + u'langle') != s.count(B + u'rangle'):
            hits.append((os.path.basename(p)[:12],
                         t.count(u'\n', 0, off) + 1, kind,
                         s.count(B + u'langle'), s.count(B + u'rangle'),
                         s[:90].replace(u'\n', u' ~ ')))
print('files=%d hits=%d' % (len(files), len(hits)))
for h in hits[:60]:
    print(h[0], 'line', h[1], h[2], h[3], h[4], h[5])
