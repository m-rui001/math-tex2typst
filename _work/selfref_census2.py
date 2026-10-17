# -*- coding: utf-8 -*-
"""Split 「第 N 行」 readings into attributed source coordinates and bare ones.

Dispatch rules make a position string resolvable only when the file is named. So a
coordinate is attributed when a file name (or a corpus-level word like 台账/正文/本节)
appears before it in the same sentence; otherwise it is bare, and a bare number past
the note's own last line cannot be resolved by any reader.
Read-only census. Usage: python selfref_census2.py [--show]
"""
from __future__ import unicode_literals
import io, os, re, glob, sys

ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
REF = re.compile(u'\u7b2c\s*(\d+)\s*\u884c')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')
ATTR = re.compile(u'[A-Za-z0-9_\u2013\-/. ]{0,24}'
                  u'(?:\.tex|\.lean|\.yaml|\.json|\.bib|\.sty|\.cls|\.md)')
SELF = re.compile(u'\u672c\u7bc7|\u672c\u6587|\u5168\u6587|\u672c\u8282|\u7b2c\s*\d+\s*\u8282'
                  u'|\u53f0\u8d26|\u52d8\u8bef|\u9644\u5f55|\u4e0a\u6587|\u4e0b\u6587')

def attributing(pre):
    m = ATTR.search(pre[-40:])
    if m:
        return m.group(0).strip()[-14:]
    m = SELF.search(pre[-24:])
    if m:
        return u'self:' + m.group(0)
    return None

def run(show):
    files = 0
    cnt = {u'src': 0, u'self': 0, u'bare_in': 0, u'bare_eof': 0}
    rows = []
    for p in sorted(glob.glob(os.path.join(ROOT, '*.md'))):
        t = io.open(p, encoding='utf-8').read()
        L = t.split(u'\n')
        n = len(L)
        infence = False
        per = {u'src': 0, u'self': 0, u'bare_in': 0, u'bare_eof': 0}
        samples = []
        for i, l in enumerate(L):
            s = l.strip()
            if FENCE.match(s):
                infence = not infence
                continue
            if infence:
                continue
            for m in REF.finditer(l):
                v = int(m.group(1))
                pre = l[max(0, m.start() - 40):m.start()]
                a = attributing(pre)
                if a and a.startswith(u'self:'):
                    per[u'self'] += 1
                elif a:
                    per[u'src'] += 1
                elif v > n:
                    per[u'bare_eof'] += 1
                    if len(samples) < 3:
                        samples.append((i + 1, v, pre.strip()[-20:]))
                else:
                    per[u'bare_in'] += 1
        if sum(per.values()):
            files += 1
            for k in cnt:
                cnt[k] += per[k]
            if per[u'bare_eof']:
                rows.append((os.path.basename(p)[:14], n, per[u'bare_eof'],
                             per[u'src'], per[u'self'], per[u'bare_in'], samples))
    print('scanned_files=%d src=%d selfword=%d bare_in=%d bare_eof=%d files_with_bare_eof=%d'
          % (files, cnt[u'src'], cnt[u'self'], cnt[u'bare_in'], cnt[u'bare_eof'], len(rows)))
    rows.sort(key=lambda r: -r[2])
    if show:
        for r in rows[:25]:
            print('%-16s lines=%-5d bare_eof=%-3d src=%-4d self=%-4d bare_in=%-4d %s'
                  % (r[0], r[1], r[2], r[3], r[4], r[5],
                     u' | '.join(u'@%d:%d %s' % s for s in r[6][:2])))

run('--show' in sys.argv)
