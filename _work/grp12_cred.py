# -*- coding: utf-8 -*-
r"""`Expected group after '_'／'^'` 12 站的凭据面。
1) 素材那一行到底怎么写（`\mathfrak m_B`？`(x\mapsto cx)_\#`？`q(\xi)^{-\gamma}`？）；
2) house 形：全库笔记写「下标紧跟控制字」时加不加组（`_{\alpha}` vs `_\alpha`），
   写 Lean 的 pushforard 下标 `_#` 时到底怎么发（`_\#`／`_{\#}`／`_{{\#}}`）。
"""
import glob
import io
import json
import os
import re

B = chr(92)
T = json.load(io.open(u'_work/preamble_tables.json', encoding='utf-8'))

SCAN = {
    u'D137': [u'm_0+', u'\\tfrac'],
    u'D204': [u'lifted-cycle', u'\\kappa_0', u'mathfrak m_B'],
    u'D235': [u'\\Gamma(\\xi)', u'q(\\xi)'],
    u'D260': [u'pushforward', u'_#', u'_{#}', u'\\#'],
    u'D262': [u'S^*f', u'S^{*}f', u'\\sup_{\\lambda'],
    u'D307': [u'log resolution', u'I_0', u'\\mathfrak m'],
    u'D523': [u'\\mathbf C^r', u'q:U\\to'],
    u'D61': [u'(6r/c)^{3/2}', u'6r/c'],
    u'D619': [u'(p_U)_*', u'(p_X)_*'],
    u'D772': [u'U(v)_1', u'U(v)_{1}'],
}
for cid, pats in sorted(SCAN.items()):
    v = T.get(cid)
    if not v:
        continue
    d = os.path.join(u'preprints', v[u'dir'])
    print(u'\n### %s  needle=%s' % (cid, u' / '.join(pats)))
    n = 0
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for fn in sorted(files):
            if not fn.endswith(u'.tex'):
                continue
            ls = io.open(os.path.join(root, fn), encoding='utf-8', errors='replace').read().split(u'\n')
            for i, l in enumerate(ls, 1):
                if any(p in l for p in pats):
                    print(u'   %s:%d  %s' % (fn, i, l.strip()[:150]))
                    n += 1
                    if n > 6:
                        break
            if n > 6:
                break
        if n > 6:
            break

# house 形：笔记全库
pats = [
    (u'下标紧跟控制字（无组）  x_\\alpha 形', re.compile(r'[_\^](?![_\^{\*\dA-Za-z\s])' + B + r'[a-zA-Z]+')),
    (u'下标带组            x_{\\alpha} 形', re.compile(r'[_\^]\{' + B + r'[a-zA-Z]')),
    (u'`^^` 双打', re.compile(r'\^\^')),
    (u'`__` 双打', re.compile(r'__')),
    (u'`_#` 裸写', re.compile(r'[_]\#')),
    (u'`_\#`', re.compile(r'[_]' + B + r'#')),
    (u'`_{\#}`／`_{#}`', re.compile(r'_\{\s*' + B + r'?\s*#\s*\}')),
]
tot = {}
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    t = io.open(p, encoding='utf-8', errors='replace').read()
    for label, rx in pats:
        for m in rx.finditer(t):
            tot.setdefault(label, [0, set()])
            tot[label][0] += 1
            tot[label][1].add(os.path.basename(p)[:4])
print(u'\n### 全库笔记 house 形')
for label, _rx in pats:
    v = tot.get(label, [0, set()])
    print(u'  %-30s %5d 处  %3d 篇' % (label, v[0], len(v[1])))
