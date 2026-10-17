# -*- coding: utf-8 -*-
# 真缺陷判据：每个数学跨度内 ( [ 与 ) ] 总数相等，且按区间约定可栈式配对
# （闭符 ) 与 ] 都可开闭 ( 或 [ —— 半开区间 [a,b) 与 (a,b] 合法）。
import glob, io, sys

M = chr(36)
B = chr(92)
OP = u'(['
f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D%s-*.md' % sys.argv[1])[0]
L = io.open(f, encoding='utf-8', errors='ignore').read().split(u'\n')
sec = None
for i, l in enumerate(L):
    if l.startswith(u'## '):
        sec = l[3:10]
    segs = l.replace(B + M, u'\x01').split(M)
    for j in range(1, len(segs), 2):
        s = segs[j].replace(B + u'{', u'').replace(B + u'}', u'')
        st = []
        bad = None
        for c in s:
            if c in OP:
                st.append(c)
            elif c in u')]':
                if not st:
                    bad = u'extra ' + c
                    break
                st.pop()
        if bad is None and st:
            bad = u'unclosed ' + st[-1]
        n_open = sum(s.count(c) for c in OP)
        n_cl = sum(s.count(c) for c in u')]')
        if bad or n_open != n_cl:
            print('sec', sec, 'line', i + 1, bad, n_open, n_cl, repr(segs[j][:110]))
