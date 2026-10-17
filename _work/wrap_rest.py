# -*- coding: utf-8 -*-
"""List the wrap1 spans that the guarded joiner refuses to touch, with the reason."""
from __future__ import unicode_literals
import io, os, glob
import join_wraps2 as J

ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
    t = io.open(p, encoding='utf-8').read()
    L, flags = J.fence_flags(t)
    for a, b in J.wrap1_spans(L, flags):
        why = []
        for i, tag in ((a, 'head'), (b, 'next')):
            s = L[i].strip()
            r = []
            if flags[i]:
                r.append('infence')
            if not s:
                r.append('blank')
            if s[:1] in u'|#>`':
                r.append({u'|': u'tablerow', u'#': u'heading', u'`': u'fenceline',
                          u'>': u'quote'}[s[:1]])
            if J.ITEM.match(s):
                r.append('listitem')
            if L[i].endswith(chr(92)):
                r.append('backslash')
            if L[i].count(chr(96)) % 2 == 1:
                r.append('oddticks')
            if r:
                why.append(tag + ':' + ','.join(r))
        print(os.path.basename(p)[:10], a + 1, b + 1,
              u' '.join(why) if why else 'TAKEABLE', u'|',
              L[a][-34:].strip(), u'/', L[b][:34].strip())
