# -*- coding: utf-8 -*-
# 花括号平衡：按 $…$ 跨度与 \[ … \] 独立式逐处数 { } 与 \{ \} 之外的花括号
import glob, io, re, sys

M = chr(36)
B = chr(92)
f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D%s-*.md' % sys.argv[1])[0]
L = io.open(f, encoding='utf-8', errors='ignore').read().split(u'\n')
sec = None
for i, l in enumerate(L):
    if l.startswith(u'## '):
        sec = l[3:9]
    segs = l.replace(B + M, u'\x01').split(M)
    for j in range(1, len(segs), 2):
        s = segs[j].replace(B + u'{', u'').replace(B + u'}', u'')
        o, c = s.count(u'{'), s.count(u'}')
        if o != c:
            print('sec', sec, 'line', i + 1, 'span', j, o, c, repr(segs[j][:120]))

# 独立式 \[ … \]（可跨行）
raw = u'\n'.join(L)
for m in re.finditer(re.escape(B + u'[') + u'(.*?)' + re.escape(B + u']'), raw, re.S):
    s = m.group(1).replace(B + u'{', u'').replace(B + u'}', u'')
    o, c = s.count(u'{'), s.count(u'}')
    if o != c:
        line = raw[:m.start()].count(u'\n') + 1
        print('display line', line, o, c, repr(m.group(1)[:120]))
