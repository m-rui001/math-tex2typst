# -*- coding: utf-8 -*-
"""Fence-aware, code-span-aware census of inline $...$ spans that straddle a newline.

Fenced blocks and single-line `code` spans are blanked (same length, newlines
kept) before the $ positions are paired, so a stray $ in quoted source cannot
flip the parity of the surrounding prose.
"""
from __future__ import unicode_literals
import io, os, re, glob

D = chr(36)
BT = chr(96)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
CODE = re.compile(u'`+[^' + BT + u'\n]*`+')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')


def mask(t):
    L = t.split(u'\n')
    out = []
    infence = False
    fence_tok = None
    for l in L:
        s = l.strip()
        m = FENCE.match(s)
        if m:
            tok = s[0] * 3
            if not infence:
                infence = True
                fence_tok = tok
                out.append(l)
                continue
            if fence_tok and s.startswith(fence_tok):
                infence = False
                fence_tok = None
                out.append(l)
                continue
        if infence:
            out.append(u' ' * len(l))
            continue
        out.append(CODE.sub(lambda mm: u' ' * len(mm.group(0)), l))
    return u'\n'.join(out)


def run(paths):
    tot = {'w1': 0, 'w2': 0}
    per = []
    for p in paths:
        t = io.open(p, encoding='utf-8').read()
        mt = mask(t)
        pos = [i for i, c in enumerate(mt) if c == D]
        if len(pos) % 2:
            per.append((os.path.basename(p)[:12], 'ODD_TOTAL', len(pos), 0))
            continue
        w1 = w2 = 0
        for k in range(0, len(pos), 2):
            seg = mt[pos[k]:pos[k + 1] + 1]
            nl = seg.count(u'\n')
            if nl == 1:
                w1 += 1
            elif nl >= 2:
                w2 += 1
        if w1 or w2:
            per.append((os.path.basename(p)[:12], 'WRAP', w1, w2))
        tot['w1'] += w1
        tot['w2'] += w2
    odd = [r for r in per if r[1] == 'ODD_TOTAL']
    wr = [r for r in per if r[1] == 'WRAP']
    print('masked: single_nl_spans=%d multi_nl_spans=%d files_with_wrap=%d'
          % (tot['w1'], tot['w2'], len(wr)))
    print('files_still_odd_after_masking=%d' % len(odd))
    for r in sorted(wr, key=lambda e: -e[2])[:15]:
        print(r)
    for r in odd[:12]:
        print('ODD', r)


if __name__ == u'__main__':
    run(sorted(glob.glob(os.path.join(ROOT, '*.md'))))
