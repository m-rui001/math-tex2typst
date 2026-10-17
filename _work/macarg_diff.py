# -*- coding: utf-8 -*-
"""复量的账要落在站点集合上，不是总数上：sites11 vs sites12 的差集，按 (file,line,kind,body) 比。
新增的那几站必须逐站读，因为「消旗标」与「修笔记」的区别就在这里。
"""
import io
import json


def key(r):
    return (r['file'], r['line'], r['kind'], r['body'])


a = [json.loads(l) for l in io.open(u'_work/dollarmath_sites11.jsonl', encoding='utf-8')]
b = [json.loads(l) for l in io.open(u'_work/dollarmath_sites12.jsonl', encoding='utf-8')]
ka, kb = set(map(key, a)), set(map(key, b))
ma, mb = {}, {}
for r in a:
    ma[key(r)] = r
for r in b:
    mb[key(r)] = r
gone = sorted(ka - kb)
new = sorted(kb - ka)
print(u'修前=%d 修后=%d 消失=%d 新增=%d' % (len(ka), len(kb), len(gone), len(new)))
print(u'--- 消失的站')
for k in gone:
    r = ma[k]
    print(u'  %-52s:%-4d %s' % (r['file'][:52], r['line'], (r['errClass'] or u'')[:50]))
print(u'--- 新增的站')
for k in new:
    r = mb[k]
    print(u'  %-52s:%-4d %s' % (r['file'][:52], r['line'], (r['errClass'] or u'')[:50]))
    print(u'      BODY %s' % repr(r['body'])[:220])
same = sorted(ka & kb)
print(u'--- 原地不动的族分布（前 12）')
from collections import Counter
c = Counter((mb[k]['errClass'] or u'')[:48] for k in same)
for e, n in c.most_common(12):
    print(u'  %3d  %s' % (n, e))
