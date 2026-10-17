# -*- coding: utf-8 -*-
r"""`Double subscript／superscript` 13 站的凭据面：
1) 站点整行（不截断）；2) 笔记自述出处的素材行窗；3) 本篇合法形用量比。"""
import glob
import io
import json
import os
import re

T = json.load(io.open(u'_work/preamble_tables.json', encoding=u'utf-8'))
SITES = [
    (u'D155', 497), (u'D155', 501), (u'D274', 43), (u'D296', 111), (u'D36-', 553),
    (u'D370', 39), (u'D486', 102), (u'D489', 129), (u'D493', 278), (u'D555', 306),
    (u'D555', 317), (u'D570', 147), (u'D94-', 227),
]
for cid, line in SITES:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))
    if not f:
        print(u'NOFILE %s' % cid)
        continue
    ls = io.open(f[0], encoding=u'utf-8').read().split(u'\n')
    print(u'\n@@@ %s:%d' % (cid, line))
    print(u'   ' + ls[line - 1][:700])

# 素材行窗：(cid, 文件名子串, 起, 止)
WANT = [
    (u'D274', u'main.tex', 195, 200),
    (u'D296', u'introduction.tex', 478, 487),
    (u'D36-', u'.tex', 476, 485),
    (u'D370', u'packets.tex', 44, 52),
    (u'D486', u'.tex', 1, 1),
    (u'D489', u'deformation.tex', 206, 218),
    (u'D493', u'06-cycles.tex', 425, 430),
    (u'D555', u'02-pure-inputs.tex', 220, 228),
    (u'D555', u'03-transfer.tex', 290, 297),
    (u'D570', u'stage.tex', 24, 48),
    (u'D570', u'stage.tex', 57, 66),
    (u'D155', u'WeakNullity.lean', 176, 200),
    (u'D94-', u'07', 1, 1),
]
NEEDLE = {
    u'D296': [u'beta_{\\\\mathrm{eff}', u'beta_c'],
    u'D36-': [u'1/10', u'A^{'],
    u'D486': [u'j_1..j_t', u'\\\\det B['],
    u'D489': [u's_t^', u'D\\\\setminus A'],
    u'D94-': [u'1/4', u'rangle'],
}
for cid, fn, lo, hi in WANT:
    v = T.get(cid)
    if not v:
        continue
    d = os.path.join(u'preprints', v[u'dir'])
    got = []
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for f2 in files:
            if fn not in f2:
                continue
            p = os.path.join(root, f2)
            ls = io.open(p, encoding=u'utf-8', errors=u'replace').read().split(u'\n')
            if lo == hi == 1:
                for i, l in enumerate(ls, 1):
                    for nd in NEEDLE.get(cid, []):
                        if nd.replace(u'\\\\', u'\\') in l:
                            got.append(u'   %s:%-4d %s' % (f2, i, l.strip()[:160]))
                            break
            else:
                for i in range(lo - 1, min(hi, len(ls))):
                    got.append(u'   %s:%-4d %s' % (f2, i + 1, ls[i][:160]))
    print(u'\n### 素材 %s %s' % (cid, fn))
    for g in got[:26]:
        print(g)
