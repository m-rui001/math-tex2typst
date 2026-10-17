# -*- coding: utf-8 -*-
r"""第三轮：D36／D94 素材、D570 整行与 stage.tex 窗、D555 的 03-transfer 窗，
外加「表格格内怎么写限制竖线」的全库先例。"""
import glob
import io
import json
import os
import re

T = json.load(io.open(u'_work/preamble_tables.json', encoding=u'utf-8'))

def walk(cid, exts=(u'.tex', u'.lean')):
    d = os.path.join(u'preprints', T[cid][u'dir'])
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for f in sorted(files):
            if f.endswith(exts):
                yield f, os.path.join(root, f)

def grep(cid, pats, limit=10, fn_filter=None):
    print(u'\n### grep %s  %s' % (cid, u' / '.join(pats)))
    n = 0
    for f, p in walk(cid):
        if fn_filter and fn_filter not in f:
            continue
        for i, l in enumerate(io.open(p, encoding=u'utf-8', errors=u'replace').read().split(u'\n'), 1):
            if any(x in l for x in pats):
                print(u'   %s:%-4d %s' % (f, i, l.strip()[:175]))
                n += 1
                if n >= limit:
                    return

def window(cid, fname, lo, hi):
    print(u'\n### window %s %s:%d-%d' % (cid, fname, lo, hi))
    for f, p in walk(cid):
        if f == fname:
            ls = io.open(p, encoding=u'utf-8', errors=u'replace').read().split(u'\n')
            for i in range(lo - 1, min(hi, len(ls))):
                print(u'   %s:%-4d %s' % (f, i + 1, ls[i][:175]))

print(u'=== D570:147 整行')
ls = io.open(glob.glob(os.path.join(u'研究笔记', u'D570-*.md'))[0], encoding=u'utf-8').read().split(u'\n')
print(ls[146][400:1400])
window(u'D570', u'stage.tex', 100, 115)
grep(u'D570', [u'\\varphi', u's_k'], 6, u'stage.tex')

print(u'\n=== D94:227 整行')
ls = io.open(glob.glob(os.path.join(u'研究笔记', u'D94-*.md'))[0], encoding=u'utf-8').read().split(u'\n')
print(ls[226][:1200])
grep(u'D94', [u'1/4', u'rangle^{n}'], 8)

grep(u'D36', [u'A^{1/10}', u'10}'], 8)
window(u'D555', u'03-transfer.tex', 290, 297)

print(u'\n### 全库笔记：表格格内的限制竖线写法')
pats = [(u'\\rvert_', re.compile(r'\\rvert_\{?[a-zA-Z]')), (u'\\lvert_', re.compile(r'\\lvert_\{?[a-zA-Z]')),
        (u'\\big|_', re.compile(r'\\big\s*\|_')), (u'裸 | 在 math 里', re.compile(r'\$\w+\|\w')),
        (u'M^*|_F 形', re.compile(r'\^\*\|_'))]
tot = {}
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    t = io.open(p, encoding=u'utf-8', errors=u'replace').read()
    for label, rx in pats:
        ms = rx.findall(t)
        if ms:
            tot.setdefault(label, [0, set()])
            tot[label][0] += len(ms)
            tot[label][1].add(os.path.basename(p)[:4])
for label, _rx in pats:
    v = tot.get(label, [0, set()])
    print(u'  %-16s %5d 处 / %2d 篇' % (label, v[0], len(v[1])))
