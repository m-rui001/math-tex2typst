# -*- coding: utf-8 -*-
"""`Unexpected end of input in a macro argument` 一族的凭据面：
1) 语料宏表里这些名字到底是几参（`\Set` 报的是缺组，若素材写作 0 参常记号，那就是尺子侧的事）；
2) 素材自己怎么写这个形（D351 的 Id、D157 的 Set、D326 的 kappa、D576 的分数、D521 的 mathfrak、D463 的 red）；
3) 笔记这几行的现场窗口。
"""
import glob
import io
import json
import os

B = chr(92)
M = json.load(io.open(u'_work/katex_macros.json', encoding='utf-8'))
for k in [u'\\Set', u'\\mathfrak', u'\\red', u'\\eqref', u'\\mathrm', u'\\text', u'\\frac']:
    print(u'schema %-10s %s' % (k, json.dumps(M.get(k), ensure_ascii=False)))

T = json.load(io.open(u'_work/preamble_tables.json', encoding='utf-8'))

NEEDLES = {
    u'D157': [u'Set', u'\\Set'],
    u'D326': [u'\\kappa(q)', u'arccos'],
    u'D351': [u'\\mathrm{Id}', u'\\operatorname{Id}', u'\\Id'],
    u'D521': [u'\\mathfrak'],
    u'D576': [u'33k', u'\\frac{33'],
    u'D463': [u'\\red', u'red'],
}
for cid, pats in sorted(NEEDLES.items()):
    d = os.path.join(u'preprints', T[cid][u'dir'])
    print(u'\n### %s  dir=%s  defs=%d' % (cid, T[cid][u'dir'][:60], len(T[cid][u'defs'])))
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for fn in sorted(files):
            if not fn.endswith(u'.tex'):
                continue
            txt = io.open(os.path.join(root, fn), encoding='utf-8', errors='replace').read()
            for i, l in enumerate(txt.split(u'\n'), 1):
                for pat in pats:
                    if pat in l:
                        print(u'   %s:%d  %s' % (fn, i, l.strip()[:150]))
                        break
