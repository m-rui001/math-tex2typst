# -*- coding: utf-8 -*-
"""Census of self-referenced line coordinates that cannot be true any more.

A note writes 「第 N 行」 about its own body. Corpus-wide line-moving repairs (fence
masked joins) shift those numbers. Two readings are provably stale without reading
any context: N past the current last line, and N landing on a blank line.
Read-only. Usage: python selfref_census.py [--show]
"""
from __future__ import unicode_literals
import io, os, re, glob, sys

ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
REF = re.compile(u'\u7b2c\s*(\d+)\s*\u884c')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')

def run(show):
    tot = eof = blank = files = 0
    rows = []
    for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
        t = io.open(p, encoding='utf-8').read()
        L = t.split(u'\n')
        n = len(L)
        # drop fenced lines from the search space: quoted source is not a coordinate
        infence = False
        cand = []
        for i, l in enumerate(L):
            s = l.strip()
            if FENCE.match(s):
                infence = not infence
                continue
            if infence:
                continue
            for m in REF.finditer(l):
                cand.append((int(m.group(1)), i + 1))
        if not cand:
            continue
        e = sum(1 for v, _ in cand if v > n)
        b = sum(1 for v, _ in cand if 0 < v <= n and not L[v - 1].strip())
        if e + b:
            files += 1
            tot += e + b
            eof += e
            blank += b
            rows.append((os.path.basename(p)[:14], n, len(cand), e, b))
    rows.sort(key=lambda r: -r[3])
    print('files_with_refs_scanned refs_total=%d past_eof=%d on_blank=%d files_hit=%d'
          % (sum(r[2] for r in rows), eof, blank, files))
    if show:
        for r in rows[:40]:
            print('%-16s lines=%-6d refs=%-4d past_eof=%-4d on_blank=%d' % r)

run('--show' in sys.argv)
