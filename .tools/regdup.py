# -*- coding: utf-8 -*-
# 登记句重复自检：统计每篇笔记里出现的补登记句式条数。
import io, glob, os, re

A = re.compile(u'^\u672c\u7b14\u6ce8\u53d9\u4e8b\u5bf9\u5e94\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/')
B = re.compile(u'^\u672c\u884c\u53ea\u8865\u767b\u8bb0\uff1a\u672c\u7b14\u8bbd\u4e8b\u7684\u8bba\u6587\u76ee\u5f55\u4e3a preprints/')
dup = []
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    t = io.open(p, encoding='utf-8', errors='strict').read().split('\n')
    na = len([l for l in t if A.match(l)])
    nb = len([l for l in t if B.match(l)])
    if na + nb > 1:
        dup.append((os.path.basename(p).split(u'-')[0], na, nb))
print('dup=%d' % len(dup))
for d in dup:
    print(*d)
