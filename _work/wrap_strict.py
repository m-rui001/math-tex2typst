# -*- coding: utf-8 -*-
"""Strict meter for inline math that the GFM/KaTeX grammar refuses to render.

Rule read off micromark-extension-math: an inline $...$ span is bytes only --
no EOL inside; the opener $ must not be followed by whitespace, the closer $
must not be preceded by whitespace and must not be followed by a digit.
Fenced blocks and single-line `code` spans are blanked first.
"""
from __future__ import unicode_literals
import io, os, re, glob, sys
from wrap_census import mask

D = chr(36)
WS = u' \t'
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
DIG = set(u'0123456789')


def scan(t):
    mt = mask(t)
    n = len(mt)
    hits = []
    i = 0
    while i < n:
        if mt[i] != D:
            i += 1
            continue
        if mt[i + 1:i + 2] == D:              # display $$..$$: skip the marker pair
            i += 2
            continue
        if mt[i + 1:i + 2] in (u' ', u'\t', u'\n', u''):
            i += 1
            continue
        j = i + 1
        closer = -1
        while j < n:
            if mt[j] == D:
                prev = mt[j - 1]
                nxt = mt[j + 1:j + 2]
                if prev not in (u' ', u'\t', u'\n') and nxt not in DIG:
                    closer = j
                    break
            j += 1
        if closer < 0:
            hits.append((i, 'UNCLOSED'))
            i += 1
            continue
        seg = mt[i:closer + 1]
        if u'\n' in seg:
            real = t[i:closer + 1]
            nl = seg.count(u'\n')
            hits.append((i, 'WRAP%d' % nl))
        i = closer + 1
    return hits


def main():
    files = sorted(glob.glob(os.path.join(ROOT, '*.md')))
    if len(sys.argv) > 1:
        files = [f for f in files if f.startswith(os.path.join(ROOT, sys.argv[1]))]
    show_wrap = '--wrap' in sys.argv
    w1 = w2 = unc = 0
    per = []
    detail = []
    for p in files:
        t = io.open(p, encoding='utf-8').read()
        h = scan(t)
        a = sum(1 for x in h if x[1] == 'WRAP1')
        b = sum(1 for x in h if x[1].startswith('WRAP') and x[1] != 'WRAP1')
        c = sum(1 for x in h if x[1] == 'UNCLOSED')
        w1 += a
        w2 += b
        unc += c
        if a + b + c:
            per.append((os.path.basename(p)[:12], a, b, c))
        for off, k in h:
            if k == 'UNCLOSED' or (k == 'WRAP1' and show_wrap):
                detail.append((os.path.basename(p)[:12],
                               t.count(u'\n', 0, off) + 1, k,
                               t[off:off + 70].replace(u'\n', u' ~ ')))
            elif k.startswith('WRAP') and k != 'WRAP1' and len(detail) < 40:
                detail.append((os.path.basename(p)[:12],
                               t.count(u'\n', 0, off) + 1, k,
                               t[off:off + 70].replace(u'\n', u' ~ ')))
    print('files=%d wrap1=%d wrapN=%d unclosed=%d files_hit=%d'
          % (len(files), w1, w2, unc, len(per)))
    for r in sorted(per, key=lambda e: -(e[1] + e[2]))[:14]:
        print(r)
    for d in detail[:60]:
        print(*d[:3], d[3])


if __name__ == u'__main__':
    main()
