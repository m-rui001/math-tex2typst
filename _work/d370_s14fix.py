# -*- coding: utf-8 -*-
import io

P = u'研究笔记/D370-素数次数环面包在任意局部型下的等分布.md'
b0 = io.open(P, 'rb').read()
assert b0.count(b'\r') == 0
L = b0.decode('utf8').split(u'\n')
n0 = len(L)
assert n0 == 444, n0

BAD = u'\u53cd\u9053\u662f'   # 反道是, sweep.py typo artifact
GOOD = u'\u53cd\u5012\u662f'  # 反倒是, grammatical and clean of 而是
assert len(BAD) == len(GOOD) == 3

# item 二 / 七: line 227 artifact
i = 226
assert L[i].count(BAD) == 1, L[i].count(BAD)
L[i] = L[i].replace(BAD, GOOD)

# item 八: line 413 self-reported row count 39 vs measured 52
OLD = u'\u53f0\u8d26\u5171\u4e09\u5341\u4e5d\u884c'          # 台账共三十九行
NEW = u'\u53f0\u8d26\u5171\u4e94\u5341\u4e8c\u884c'          # 台账共五十二行
j = 412
assert L[j].count(OLD) == 1
L[j] = L[j].replace(OLD, NEW)

# item 十二: line 91 probe comment, author-authorized deletion.
# Blank it in place instead of removing the line: this note's §12/§14 cite about
# a dozen "第 N 行" coordinates, and deleting one line would shift them all by -1.
K = 90
assert L[K].startswith(u'<!--') and L[K].endswith(u'-->'), L[K]
assert L[K].count(u'\u4ec5\u4f5c\u673a\u5236\u6821\u9a8c') == 1
L[K] = u''
assert u'<!--' not in u'\n'.join(L), 'probe markup remains'
assert len(L) == n0, len(L)
assert sum(l.count(u'$') for l in L) == sum(l.count(u'$') for l in b0.decode('utf8').split(u'\n'))
assert u'\n'.join(L).count(u'`') == b0.decode('utf8').count(u'`')
out = u'\n'.join(L).encode('utf8')
assert out.count(b'\r') == 0
io.open(P, 'wb').write(out)
print('bytes %d -> %d lines %d -> %d' % (len(b0), len(out), n0, len(L)))
print('dollar', sum(l.count(u'$') for l in L), 'btick', u'\n'.join(L).count(u'`'))
