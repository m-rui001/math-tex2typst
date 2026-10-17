# _work/oddline_read.py — read the 13 odd-'$'-line coordinates the dollar leg left as a
# lead, and print each line with its neighbour, its '$' count and its control-sequence
# neighbours, so every one gets an adjudication (登记 / 就地改 / 上游因) instead of a guess.
# Read-only.  An ODD number of '$' on a line means the line-level pairing is unbalanced:
# either the span crosses a newline, or a delimiter is missing / mis-typed.
import io, os, re, sys

B, D = chr(92), chr(36)
ROOT = u'E:/math/' + u'研究笔记'
COORDS = [('D113', 31), ('D113', 32), ('D219', 49), ('D219', 119), ('D38', 157),
          ('D47', 191), ('D52', 603), ('D59', 302), ('D79', 104), ('D85', 50),
          ('D85', 939), ('D92', 220), ('D92', 230)]

for cid, ln in COORDS:
    fs = [f for f in os.listdir(ROOT) if f.startswith(cid + '-') and f.endswith('.md')]
    if not fs:
        print(u'%s NOFILE' % cid)
        continue
    lines = io.open(os.path.join(ROOT, fs[0]), encoding='utf-8', newline='').read().split('\n')
    for k in (ln - 1, ln, ln + 1):
        if k < 1 or k > len(lines):
            continue
        l = lines[k - 1]
        mark = u'>>' if k == ln else u'  '
        print(u'%s %s:%d  $=%d  %s' % (mark, cid, k, l.count(D), l.strip()[:168]))
    print(u'   ' + u'-' * 40)
