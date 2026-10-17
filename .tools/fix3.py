# -*- coding: utf-8 -*-
import io, glob

HDR_SPEC = u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
HDR_ALT = u'| \u8bb0\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |'
ERSHI = u'\u800c\u662f'

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D87-*.md')[0]
lines = io.open(p, encoding='utf-8').read().split('\n')
n = 0
for i, l in enumerate(lines):
    if l == HDR_SPEC:
        lines[i] = HDR_ALT
        n += 1
        print('spec->alt at', i + 1)
    elif l == HDR_ALT:
        lines[i] = HDR_SPEC
        n += 1
        print('alt->spec at', i + 1)
t = u'\n'.join(lines)
for i, l in enumerate(lines):
    k = l.find(ERSHI)
    if k >= 0:
        print('D87 ershi line', i + 1, repr(l[max(0, k - 60):k + 40]))
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('swaps', n, 'hdr_now', t.count(HDR_SPEC))

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D19-*.md')[0]
t = io.open(p, encoding='utf-8').read()
old = u'\u6ce8\u610f\u8fd9\u4e0d\u662f\u6e10\u8fd1\u547d\u9898\u800c\u662f**\u5b58\u5728\u7edd\u5bf9\u5e38\u6570**\u7684\u5b9a\u91cf\u547d\u9898\u3002'
new = u'\u6ce8\u610f\u8fd9\u662f\u4e00\u4e2a\u8981\u4ea4\u51fa\u7edd\u5bf9\u5e38\u6570\u7684\u5b9a\u91cf\u547d\u9898\uff0c\u7eaf\u7cb9\u7684\u6e10\u8fd1\u9648\u8ff0\u5728\u8fd9\u4e00\u6b65\u9876\u4e0d\u4f4f\u3002'
print('D19 old hits', t.count(old), 'bytes old/new', len(old.encode('utf-8')), len(new.encode('utf-8')))
t = t.replace(old, new)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('D19 ershi now', t.count(ERSHI), 'stars', t.count('**'), 'size', len(t.encode('utf-8')))
