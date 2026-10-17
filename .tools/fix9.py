# -*- coding: utf-8 -*-
import io, glob

ERSHI = u'\u800c\u662f'
jobs = [
    ('D39', u'$\mathcal U$ \u56e0\u800c\u662f Baire \u7a7a\u95f4',
     u'$\mathcal U$ \u5e26\u6765 Baire \u7a7a\u95f4\u8fd9\u4e00\u5c5e\u6027'),
    ('D51', u'\u5b8c\u5168\u76f8\u540c\uff0c\u4e0d\u662f\u540c\u8c03\u610f\u4e49\u4e0b\u76f8\u540c\u800c\u662f\u5143\u7d20\u76f8\u7b49',
     u'\u5b8c\u5168\u76f8\u540c\uff0c\u8fd9\u91cc\u5f3a\u5230\u5143\u7d20\u76f8\u7b49\uff0c\u4e0d\u505c\u5728\u540c\u8c03\u610f\u4e49\u4e0b\u76f8\u540c'),
    ('D51', u'\u4e0d\u662f\u6295\u5f71\u610f\u4e49\u4e0b\u800c\u662f upstairs \u7cbe\u786e\u6210\u7acb',
     u'\u9000\u5230\u6295\u5f71\u610f\u4e49\u4e5f\u4e0d\u5fc5\u8981\uff0c\u5b83\u5728 upstairs \u7cbe\u786e\u6210\u7acb'),
    ('D88', u'\u6cdb\u6027\u8d28\u62fc\u51fa\u7684\u4e0d\u662f pushout \u800c\u662f\u8fc7\u4f59\u6781\u9650',
     u'\u6cdb\u6027\u8d28\u62fc\u51fa\u7684\u8d85\u51fa pushout\uff0c\u843d\u5230\u8fc7\u4f59\u6781\u9650'),
    ('D88', u'\u4e0d\u5f62\u6210\u6811\u800c\u662f\u5f62\u6210\u73af',
     u'\u4e0d\u5f62\u6210\u6811\uff0c\u5f62\u6210\u73af'),
]
cache = {}
for pid, a, b in jobs:
    key = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % pid)[0]
    if key not in cache:
        cache[key] = io.open(key, encoding='utf-8').read()
    print(pid, 'hits', cache[key].count(a))
    cache[key] = cache[key].replace(a, b)
for key, t in cache.items():
    io.open(key, 'w', encoding='utf-8', newline='').write(t)
    print('wrote', key[-30:], 'ershi_left', t.count(ERSHI), 'size', len(t.encode('utf-8')))

p = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D33-*.md')[0]
lines = io.open(p, encoding='utf-8').read().split('\n')
print('D33@1312 full:')
print(lines[1311])
print('pipes', lines[1311].count('|'))
