# -*- coding: utf-8 -*-
import io, re, sys

sys.path.insert(0, u'.tools')
sys.path.insert(0, u'_work')
import gate
from pipe_lib import bare

IDS = [u'D246', u'D274', u'D309', u'D341', u'D368', u'D370', u'D544', u'D639', u'D710', u'D96']
import glob
paths = {}
for p in glob.glob(u'研究笔记/D*.md'):
    ID = p.split(u'\\')[-1].split(u'/')[-1].split(u'-')[0]
    if ID in IDS:
        paths[ID] = p

out = []
for ID in IDS:
    p = paths[ID]
    t = io.open(p, 'rb').read().decode('utf8')
    L = t.split(u'\n')
    res = gate.chk(p, quiet=True)
    hdr = t.count(gate.HDR)
    pipe6 = sum(1 for l in L if l.startswith(u'| ') and bare(l) == 6)
    pipe5 = sum(1 for l in L if l.startswith(u'| ') and bare(l) == 5)
    seclines = [i + 1 for i, l in enumerate(L) if l.startswith(u'## ')]
    # 自述所在行：含「共…行」且提到 台账/表
    decl = [i + 1 for i, l in enumerate(L)
            if re.search(u'[\u5171\u542b]([' + u'0-9\u96f6\u4e00\u4e8c\u4e24\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341\u767e' + u']+)(\u884c|\u6761)', l)
            and (u'\u53f0\u8d26' in l or u'\u8868' in l)]
    out.append(u'== %s %s' % (ID, p.split(u'\\')[-1][:40]))
    out.append(u'   gate=%s HDR=%d pipe6=%d pipe5=%d secs=%d lines=%d'
               % (res, hdr, pipe6, pipe5, len(seclines), len(L)))
    for ln in decl:
        out.append(u'   L%d: %s' % (ln, L[ln - 1][:200]))
io.open(u'_work/rowcount_detail.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print('rows dumped', len(out))
