# -*- coding: utf-8 -*-
"""Lines whose $-parity is odd once backtick code spans are removed.

A real break shows as an odd line followed by an odd continuation line;
the author's own convention statements keep $ inside code spans.
"""
from __future__ import unicode_literals
import io, os, re, sys, glob

D = chr(36)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
CODE = re.compile(u'`[^`]*`')

odd = []
for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
    L = io.open(p, encoding='utf-8').read().split(u'\n')
    flags = [l.count(D) % 2 == 1 for l in (CODE.sub(u'', x) for x in L)]
    idx = [i for i, f in enumerate(flags) if f]
    if idx:
        odd.append((os.path.basename(p)[:12], len(idx), idx[:6]))
print('files_with_odd_parity=%d  total_odd_lines=%d'
      % (len(odd), sum(o[1] for o in odd)))
for o in odd[:40]:
    print(o[0], 'odd=%d' % o[1], 'lines=%s' % o[2])
