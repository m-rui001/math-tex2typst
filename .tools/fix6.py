# -*- coding: utf-8 -*-
import io, glob

ERSHI = u'\u800c\u662f'
p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D83-*.md')[0]
t = io.open(p, encoding='utf-8').read()
pairs = [
    (u'\u53f3\u7aef\u4e0d\u518d\u662f E \u7684\u500d\u6570\u800c\u662f\u53e6\u4e00\u4e2a\u672a\u77e5\u91cf',
     u'\u53f3\u7aef\u79bb\u5f00 E \u7684\u500d\u6570\uff0c\u843d\u5230\u53e6\u4e00\u4e2a\u672a\u77e5\u91cf\u4e0a'),
    (u'\u5728\u673a\u5668\u91cc\u4e0d\u662f\u5047\u8bbe\u800c\u662f\u5b9a\u7406',
     u'\u5728\u673a\u5668\u91cc\u5df2\u7ecf\u5347\u6210\u5b9a\u7406\uff0c\u5047\u8bbe\u90a3\u4e00\u5c42\u90fd\u4e0d\u9700\u8981'),
    (u'\u673a\u6784\u9875\u53cd\u800c\u662f bib',
     u'\u673a\u6784\u9875\u6070\u6070\u662f bib'),
]
for a, b in pairs:
    print('hits', t.count(a), a[:12])
    t = t.replace(a, b)
io.open(p, 'w', encoding='utf-8', newline='').write(t)
print('ershi_left', t.count(ERSHI), 'size', len(t.encode('utf-8')))
for i, l in enumerate(t.split('\n'), 1):
    k = l.find(ERSHI)
    if k >= 0:
        print('LEFT@%d|%s' % (i, l[max(0, k - 70):k + 40]))
