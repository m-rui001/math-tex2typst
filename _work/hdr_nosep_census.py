# -*- coding: utf-8 -*-
# 只读普查：以 `|` 开头的连续块里，表头之后不是分隔行（GFM 认不出表，整块掉成字面文本）。
import glob, io, re, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
CELL = re.compile(u'^:?-+:?$')
FLIGHT = set(u'D95 D93 D452 D24 D25 D26 D28 D29 D30 D32 D34 D36 D364 D41 D44 D47 D50 D65 D68'.split())


def is_pipe(l):
    return l.startswith(u'|')


def is_sep(l):
    if not (l.startswith(u'|') and l.rstrip().endswith(u'|')):
        return False
    cells = l.strip().strip(u'|').split(u'|')
    return len(cells) >= 2 and all(CELL.match(c.strip()) for c in cells if c.strip() != u'')


n = 0
hits = []
runs = 0
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    kid = p.split(u'\\\\')[-1] if u'\\\\' in p else p
    kid = re.split(r'[/\\]', p)[-1].split(u'-')[0]
    if kid in FLIGHT:
        continue
    ls = io.open(p, 'r', encoding='utf-8').read().split(NL)
    i = 0
    while i < len(ls):
        if is_pipe(ls[i]):
            j = i
            while j < len(ls) and is_pipe(ls[j]):
                j += 1
            block = ls[i:j]
            runs += 1
            if len(block) >= 2 and not is_sep(block[1]):
                hits.append((kid, i + 1, len(block), block[0][:70], block[1][:70]))
            i = j
        else:
            i += 1
    n += 1
print(u'notes_scanned=%d pipe_runs=%d header_without_sep=%d' % (n, runs, len(hits)))
for h in hits[:40]:
    print(u'  %s line=%d blocklen=%d' % (h[0], h[1], h[2]))
    print(u'     hdr: %s' % h[3])
    print(u'     nxt: %s' % h[4])
