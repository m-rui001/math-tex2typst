# -*- coding: utf-8 -*-
r"""双下标／双上标族：第二轮素材凭据（D296/D370/D489/D493/D555/D570/D94/D36/D155）。"""
import io
import json
import os

T = json.load(io.open(u'_work/preamble_tables.json', encoding=u'utf-8'))

def walk(cid):
    d = os.path.join(u'preprints', T[cid][u'dir'])
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for f in sorted(files):
            if f.endswith((u'.tex', u'.lean')):
                yield f, os.path.join(root, f)

def grep(cid, pats, limit=8, fn_filter=None):
    print(u'\n### grep %s  %s' % (cid, u' / '.join(pats)))
    n = 0
    for f, p in walk(cid):
        if fn_filter and fn_filter not in f:
            continue
        for i, l in enumerate(io.open(p, encoding=u'utf-8', errors=u'replace').read().split(u'\n'), 1):
            if any(x in l for x in pats):
                print(u'   %s:%-4d %s' % (f, i, l.strip()[:170]))
                n += 1
                if n >= limit:
                    return

def window(cid, fname, lo, hi):
    print(u'\n### window %s %s:%d-%d' % (cid, fname, lo, hi))
    for f, p in walk(cid):
        if f == fname:
            ls = io.open(p, encoding=u'utf-8', errors=u'replace').read().split(u'\n')
            for i in range(lo - 1, min(hi, len(ls))):
                print(u'   %s:%-4d %s' % (f, i + 1, ls[i][:170]))

grep(u'D296', [u'beta_{\\mathrm{eff}}', u'\\mathrm{eff}'], 10)
window(u'D296', u'introduction.tex', 94, 100)
grep(u'D370', [u"M'_{\\ell}", u"(RM)'", u"M'_\\ell", u"j_\\ell"], 8)
grep(u'D489', [u's_t^{D', u'D\\setminus A'], 10)
grep(u'D493', [u'M_i', u'^*_F', u'M_i^*'], 10)
window(u'D493', u'06-cycles.tex', 425, 431)
grep(u'D555', [u'J_', u"\\sigma'_", u'sigma_x'], 10)
grep(u'D570', [u'b_v', u'a_v', u's_k'], 10)
grep(u'D36-', [u'A^{1/10}', u'1/10'], 8)
grep(u'D155', [u'l2ToL1', u'norm'], 8, u'WeakNullity.lean')
