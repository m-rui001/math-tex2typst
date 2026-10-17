# -*- coding: utf-8 -*-
# D68 的文末台账续行是 13 行四格（写手把「符号」与「数值」两格并成一格，竖线少一枚，
# 自己在申报里登记了）。补一张与格数相符的续表头，而不是往内容里插竖线拆格：后者要
# 替作者判定哪一段是符号、哪一段是数值，属内容创作，不属机械修补。
# 表头全文唯一由 HDR 那一枚保证，这里的四格表头与四格分隔行都不等于 gate 的字面量，
# 所以 hdr / sep 两个计数都不动。
import glob, io, os, sys
from collections import Counter

sys.stdout.reconfigure(encoding='utf-8')
B = chr(92)
HDR5 = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | '
        u'\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
HDR4 = (u'| \u7b26\u53f7\u4e0e\u6570\u503c | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | '
        u'\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
assert (len(HDR5), HDR5.count(u'|'), HDR4.count(u'|')) == (44, 6, 5)
SEP4 = u'| --- | --- | --- | --- |'
MARK = u'\u4e94\u3001\u672c\u8282\u65b0\u589e\u53f0\u8d26\u884c'
apply = u'--apply' in sys.argv

p = glob.glob(u'研究笔记/D68-*.md')[0]
raw = io.open(p, encoding='utf-8').read()
assert u'\r' not in raw
L = raw.split(u'\n')
mk = [i for i, l in enumerate(L) if l.startswith(MARK)]
assert len(mk) == 1, mk
i = mk[0] + 1
while i < len(L) and not L[i].startswith(u'| '):
    assert not L[i].startswith(u'#'), (u'crossed a heading', i + 1)
    i += 1
j = i
while j < len(L) and L[j].startswith(u'| '):
    assert L[j].count(u'|') == 5, (j + 1, L[j].count(u'|'))
    j += 1
assert raw.count(HDR4) == 0, 'continuation header already present'
print(u'D68 mark@%d rows@%d-%d n=%d' % (mk[0] + 1, i + 1, j, j - i))
nl = L[:i] + [HDR4, SEP4] + L[i:]
new = u'\n'.join(nl)
ob, nb = raw.encode('utf-8'), new.encode('utf-8')
assert len(nl) == len(L) + 2
assert Counter([l for l in nl if l.strip()]) == Counter([l for l in L if l.strip()]) + Counter({HDR4: 1, SEP4: 1})
assert len(nb) - len(ob) == len((HDR4 + u'\n' + SEP4 + u'\n').encode('utf-8'))
assert new.count(u'$') == raw.count(u'$') and new.count(u'`') == raw.count(u'`')
assert new.count(HDR5) == raw.count(HDR5) == 1
assert u'\r' not in new
print(u'bytes %d->%d +%d hdr5=%d hdr4=%d' % (len(ob), len(nb), len(nb) - len(ob),
                                             new.count(HDR5), new.count(HDR4)))
if apply:
    io.open(u'_work/D68.pre-conthdr.md', 'w', encoding='utf-8', newline='').write(raw)
    io.open(p, 'w', encoding='utf-8', newline='').write(new)
    print(u'APPLIED ' + str(os.path.getsize(p)))
else:
    print(u'APPLY=False')
