# -*- coding: utf-8 -*-
# 复核 REPAIR 候选：坏形/好形的全文计数、正文缺陷位行号与该行原文、行数、字节数、
# 以及"若就地回填"的字节增量与行数不变性。全程只读笔记。
import io, os

NS = u'\u7814\u7a76\u7b14\u8bb0'

# (D###, bad, good, 期望正文位行号)
CAND = [
    (u'D595', u'\u6b63\u6587\u524d\u4e94\u5343\u7c73',
     u'\u6b63\u6587\u524d\u4e94\u5343\u514b\u5b57\u7b26', 250),
    (u'D570', u'\u7a7a $c_*$ \u4e0e\u5305\u542b\u4ea4\u53e0\u540c-cover',
     u'\u7a7a $c_*$ \u4e0e\u5305\u542b\u4ea4\u53e0\u540c\u6837\u8986\u76d6', 137),
    (u'D542', u'\u5e94\u8d8a\u8fc7\u4e03\u4e07\u4e00\u514b\u4e00\u7ebf',
     u'\u5e94\u8d8a\u8fc7\u4e03\u4e07\u4e00\u5343\u4e94\u767e\u4e00\u7ebf', 302),
    (u'D494', u'\u5e76\u662f\u975e\u8981\u4ea4\u4ee3\u7684\u8fb9\u89d2',
     u'\u5e76\u975e\u591a\u4f59\u7684\u8fb9\u89d2\u4ea4\u4ee3', 287),
]

out = []
for d, bad, good, want in CAND:
    p = None
    for fn in os.listdir(NS):
        if fn.startswith(d + '-'):
            p = os.path.join(NS, fn)
    raw = io.open(p, 'rb').read()
    t = raw.decode('utf-8')
    lines = t.split(u'\n')
    nb = t.count(bad)
    ng = t.count(good)
    occ = [i + 1 for i, l in enumerate(lines) if bad in l]
    delta = len(good.encode('utf-8')) - len(bad.encode('utf-8'))
    out.append(u'== %s file=%s bytes=%d lines=%d' % (
        d, os.path.basename(p), len(raw), len(lines)))
    out.append(u'   bad=%s count=%d occ=%s (expect want=%d)' % (bad, nb, occ, want))
    out.append(u'   good=%s count=%d' % (good, ng))
    out.append(u'   byte delta per site=%d ; after=%d ; bad count after repair=%d' % (
        delta, len(raw) + delta, nb - 1))
    for i in occ:
        out.append(u'   L%d: %s' % (i, lines[i - 1]))
    out.append(u'')

io.open('_work/bodyside_upper_verify.txt', 'wb').write(
    u'\n'.join(out).encode('utf-8') + b'\n')
print('cands=%d' % len(CAND))
