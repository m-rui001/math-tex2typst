# -*- coding: utf-8 -*-
import io, glob, re, os

old = (u'\u3002\u503c\u5f97\u6ce8\u610f\u7684\u662f\uff0c\u8fd9\u6761\u5f15\u7406\u5bf9 $G$ '
       u'\u4e0d\u5fc5\u81ea\u5185\u5c04')
new = (u'\u3002\u8fd8\u6709\u4e00\u5904\u8981\u7d27\u7684\uff1a\u8fd9\u6761\u5f15\u7406\u5bf9 $G$ '
       u'\u4e0d\u5fc5\u81ea\u5185\u5c04')

BAN = [u'\u503c\u5f97\u6ce8\u610f\u7684\u662f', u'\u9700\u8981\u6307\u51fa\u7684\u662f',
       u'\u6362\u53e5\u8bf4', u'\u7efc\u4e0a', u'\u603b\u4f53\u800c\u8a00']

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D18-*.md')[0]
t = io.open(p, encoding='utf-8').read()
print('hit', old in t)
t = t.replace(old, new, 1)
io.open(p, 'w', encoding='utf-8', newline='\n').write(t)

for q in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = re.match(r'D\d+', os.path.basename(q)).group(0)
    if b in (u'D01 D02 D03 D04 D05 D06 D07 D20 D44 D45 D47 '
             u'D41 D102 D145 D76 D46 D29').split():
        continue
    s = io.open(q, encoding='utf-8', errors='replace').read()
    n = sum(s.count(w) for w in BAN)
    if n:
        print(b, n)
