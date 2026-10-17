import io, glob, sys
sys.stdout.reconfigure(encoding='utf-8', errors='replace')
NL = chr(10)
B = chr(92)
PIPE = B + u'|'
for nid in (u'D84', u'D535'):
    p = glob.glob(u'研究笔记/' + nid + u'-*.md')[0]
    ls = io.open(p, 'r', encoding='utf-8').read().split(NL)
    start = 1029 if nid == u'D84' else 314
    bad = []
    for i in range(start - 1, len(ls)):
        l = ls[i]
        if l.startswith(u'|'):
            n = l.count(u'|')
            k = l.count(PIPE)
            if n != 6:
                bad.append((i + 1, n, k))
    print(u'%s region-from %d  rows not 6-pipes: %d' % (nid, start, len(bad)))
    for r in bad:
        print(u'   line=%d pipes=%d escapedPIPE=%d' % r)
        print(u'   ' + ls[r[0] - 1][:200])
