# -*- coding: utf-8 -*-
"""psmallmatrix 一族的两个前置问题：
1) 全库 `\begin{<env>}` 的环境名清单，逐个喂 KaTeX 问认不认（改动面要把整族一起看，不止这 12 站）；
2) 这 12 站的 body 逐字节打印（反斜杠数必须数清：行分隔 `\\` 少一枚是另一种缺陷），
   并按「素材那一形」改写后回喂 KaTeX 验 RENDERS。
"""
import io
import json
import re

rows = [json.loads(l) for l in io.open(u'_work/dollarmath_sites13.jsonl', encoding='utf-8')]
sel = [r for r in rows if r.get('errClass') and 'psmallmatrix' in r['errClass']]

print(u'### 12 站 body 逐字节（bs=该段反斜杠总数）')
out = []
for r in sorted(sel, key=lambda x: (x['file'], x['line'])):
    b = r['body']
    print(u'%s:%d  bs=%d  %s' % (r['file'][:8], r['line'], b.count(chr(92)), b))
    out.append({u'file': r['file'], u'line': r['line'], u'body': b})
json.dump(out, io.open(u'_work/psmall_bodies.json', 'w', encoding='utf-8'), ensure_ascii=False)

# 全库环境名普查
names = {}
for f in sorted(json.loads(l)[u'file'] if False else [] for l in []):
    pass
import glob
import os
pat = re.compile(r'\\begin\{([a-zA-Z*]+)\}')
for p in glob.glob(os.path.join(u'研究笔记', u'D*.md')):
    t = io.open(p, encoding='utf-8', errors='replace').read()
    for m in pat.finditer(t):
        names.setdefault(m.group(1), [0, set()])
        names[m.group(1)][0] += 1
        names[m.group(1)][1].add(os.path.basename(p)[:4])
print(u'\n### 全库 \begin{} 环境名（次数／篇数）')
for k, v in sorted(names.items(), key=lambda x: -x[1][0]):
    print(u'  %-22s %4d  %3d' % (k, v[0], len(v[1])))
