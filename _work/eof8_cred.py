# -*- coding: utf-8 -*-
r"""`Expected '}', got 'EOF'` 8 站的素材凭据：按笔记引用的文件冒号行号，把素材那一行原文打全。
（笔记的断言是「缺哪一枚闭符」，凭据必须给出素材自己怎么写这个式子，才谈得上定点回改。）
"""
import io
import json
import os

T = json.load(io.open(u'_work/preamble_tables.json', encoding='utf-8'))

WANT = {
    u'D402': [(u'kernel.tex', 214, 236)],
    u'D490': [(u'06-early.tex', 130, 146)],
    u'D500': [(u'introduction.tex', 74, 82)],
    u'D765': [(u'', 0, 0)],
    u'D335': [(u'04-continuum.tex', 740, 748), (u'03-hopping.tex', 592, 600)],
    u'D762': [(u'fluctuations.tex', 120, 130)],
    u'D16': [(u'', 0, 0)],
}
for cid, spans in sorted(WANT.items()):
    v = T.get(cid)
    if not v:
        print(u'no row %s' % cid)
        continue
    d = os.path.join(u'preprints', v[u'dir'])
    print(u'\n### %s  %s' % (cid, v[u'dir'][:64]))
    for fn, a, b in spans:
        if not fn:
            continue
        found = None
        for root, _dirs, files in os.walk(d):
            if u'typst' in root:
                continue
            for x in files:
                if x.endswith(fn):
                    found = os.path.join(root, x)
                    break
        if not found:
            print(u'   素材文件未找到: %s' % fn)
            continue
        ls = io.open(found, encoding='utf-8', errors='replace').read().split(u'\n')
        for i in range(a, min(b, len(ls)) + 1):
            if ls[i - 1].strip():
                print(u'   %s:%d  %s' % (fn, i, ls[i - 1].strip()[:190]))

# D765 与 D16：不知道素材文件名，按 needle 全文扫
NEED = {u'D765': [u'P_j', u'eu'],
        u'D16': [u'sup_{h']}
for cid, pats in NEED.items():
    v = T.get(cid)
    d = os.path.join(u'preprints', v[u'dir'])
    print(u'\n### needle %s' % cid)
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for fn in sorted(files):
            if not fn.endswith(u'.tex'):
                continue
            ls = io.open(os.path.join(root, fn), encoding='utf-8', errors='replace').read().split(u'\n')
            for i, l in enumerate(ls, 1):
                if all(p in l for p in pats):
                    print(u'   %s:%d  %s' % (fn, i, l.strip()[:190]))
