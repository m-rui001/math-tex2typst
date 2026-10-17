# -*- coding: utf-8 -*-
"""`Unexpected end of input in a macro argument` 21 站的现场窗口。
两类要看的东西：
1) 报 `at end of input` 的站：span 在光杆控制字上断气，必须看见从这枚 `$` 到后面两枚 `$` 的完整窗口，
   才能判断是 span 被内层 `$` 提前关段，还是作者本来就只写到这里。
2) `\mathrm\\operator` / `\frac{\\mathfrak}` 这种报名字的站：把整条 body 打全。
"""
import io
import json

B = chr(92)
rows = [json.loads(l) for l in io.open(u'_work/dollarmath_sites11.jsonl', encoding='utf-8')]
sel = [r for r in rows if r['errClass'] and 'Unexpected end of input' in r['errClass']]
cache = {}
for r in sorted(sel, key=lambda a: (a['file'], a['line'])):
    key = r['file']
    if key not in cache:
        cache[key] = io.open(u'研究笔记/' + key, encoding='utf-8').read().split(u'\n')
    line = cache[key][r['line'] - 1]
    body = r['body']
    i = line.find(body[:18])
    mark = r['errClass'].strip()
    print(u'=== %s:%d kind=%s' % (key[:24], r['line'], r['kind']))
    print(u'    BODY   ' + repr(body))
    print(u'    TAIL   ' + repr(body[-40:]))
    print(u'    LINE   ' + repr(line[max(0, i - 20):i + len(body) + 160]))
    # 这一行里所有 `$` 的位置与从 span 起点往后 3 枚 `$` 的窗口
    if i >= 0:
        dollars = [k for k, ch in enumerate(line) if ch == u'$']
        after = [k for k in dollars if k >= i][:4]
        if after:
            print(u'    DOLLAR ' + repr(line[i:after[-1] + 1][:400]))
