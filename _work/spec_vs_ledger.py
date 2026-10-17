# -*- coding: utf-8 -*-
r"""规格 old 串与台账跨内串的对账：`python _work/spec_vs_ledger.py <spec.json> <sites.jsonl>`。
逐单报三格：old 在该行原文里命中几次、在台账 body 里命中几次、台账 body 的逐字符表（非 ASCII 打码点）。
fix_probe 报「old 不在这一跨里」时用这个看差在哪一枚字符。
"""
import glob
import io
import json
import sys

spec = json.load(io.open(sys.argv[1], encoding=u'utf-8'))
rows = [json.loads(s) for s in io.open(sys.argv[2], encoding=u'utf-8').read().split(u'\n') if s.strip()]
for f in spec:
    r = next((x for x in rows if x[u'file'].startswith(f[u'cid'] + u'-') and x[u'line'] == f[u'line']), None)
    path = glob.glob(u'研究笔记/' + f[u'cid'] + u'-*.md')[0]
    line = io.open(path, encoding=u'utf-8').read().split(u'\n')[f[u'line'] - 1]
    print(u'\n=== %s:%d (%s)' % (f[u'cid'], f[u'line'], f.get(u'level', u'')))
    print(u'  old   ' + json.dumps(f[u'old'], ensure_ascii=False))
    print(u'  new   ' + json.dumps(f[u'new'], ensure_ascii=False))
    print(u'  行内命中=%d  台账=%s' % (line.count(f[u'old']), u'无此站' if r is None else json.dumps(r[u'body'], ensure_ascii=False)))
    if r is not None:
        odd = [(i, c, hex(ord(c))) for i, c in enumerate(r[u'body']) if ord(c) > 126]
        print(u'  台账非 ASCII %s' % (odd[:8] if odd else u'无'))
