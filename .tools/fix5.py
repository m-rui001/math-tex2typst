# -*- coding: utf-8 -*-
import io, glob

HDR = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
ALT = HDR.replace(u'\u7b26\u53f7', u'\u8bb0\u53f7', 1)
ERSHI = u'\u800c\u662f'
BARE = u'| \u8bb0\u53f7 |'
BARE2 = u'| \u7b26\u53f7 |'

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D83-*.md')[0]
lines = io.open(p, encoding='utf-8').read().split('\n')
for i in (314, 394):
    if lines[i].strip() == BARE or lines[i].strip() == BARE2:
        lines[i] = ALT if i == 314 else HDR
        print('restored', i + 1)
t = u'\n'.join(lines)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('spec_hdr', sum(1 for l in lines if l.startswith(BARE2)), 'size', len(t.encode('utf-8')))
for i, l in enumerate(lines, 1):
    k = l.find(ERSHI)
    if k >= 0:
        print('ERSHI@%d|%s' % (i, l[max(0, k - 70):k + 40]))
