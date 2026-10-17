# -*- coding: utf-8 -*-
r"""`Undefined control sequence` 一族逐站取证：`python _work/undef_triage.py <sites.jsonl>`。

按控制字分组之后（分组尺 `_work/undef_census.py`）还要问两把**素材侧**的尺，才谈得上开药：
1. **素材里有没有定义这个控制字**——取笔记 §0 申报的素材目录（目录名只能 glob，台账截到 44 字，
   见 [[preprint-dir-name-globs]]），扫该目录下所有 `.tex`/`.sty`/`.cls` 里的
   `\newcommand{?\N`、`\renewcommand`、`\def\N`、`\DeclareMathOperator{?\N`、`\let\N`；
   命中＝**素材宏未进 KaTeX 宏表**（腿 #12 那一族的续集），修法＝按素材逐字展开。
2. **同一行／同一篇里有没有合法形可用**——数该篇正文里 `N` 的**最长合法前缀扩展**（宏表里以 `N` 起头的名字）
   与 `N` 本身各出现几次；这是 [[note-control-word-letter-fusions]] 的「本篇合法形用量比」判据，
   用来分「丢尾字母」与「缝在一起」两形。
本尺只报读数不定罪：每一档的**修法**仍要逐站读素材后写进规格。
"""
import collections
import glob
import io
import json
import os
import re
import sys

sys.path.insert(0, u'_work')

BS = chr(92)
MAC = list(json.load(io.open(u'_work/katex_macros.json', encoding=u'utf-8')))


def note_dir(cid):
    p = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))
    if not p:
        return None
    head = u'\n'.join(io.open(p[0], encoding=u'utf-8').read().split(u'\n')[:40])
    m = re.search(r'preprints[\\/ ]+([^\s`，、）)]{6,})', head)
    if not m:
        return None
    stem = m.group(1).rstrip(u'.\\/')[:20]
    hit = glob.glob(os.path.join(u'preprints', stem + u'*'))
    return hit[0] if hit else None


def definitions(droot, name):
    if not droot:
        return []
    out = []
    for dirpath, _dirs, files in os.walk(droot):
        for fn in files:
            if not fn.endswith(('.tex', '.sty', '.cls')):
                continue
            try:
                t = io.open(os.path.join(dirpath, fn), encoding=u'utf-8', errors='ignore').read()
            except IOError:
                continue
            for pat in (u'newcommand', u'renewcommand', u'declareRobustCommand', u'def',
                        u'DeclareMathOperator', u'let'):
                for mm in re.finditer(u'\\\\' + pat + u'\\s*\\{?' + BS + name + u'(?![A-Za-z])', t):
                    ln = t[:mm.start()].count(u'\n') + 1
                    out.append((fn, ln, pat))
    return out


BS = chr(92)
rows = [json.loads(s) for s in io.open(sys.argv[1], encoding=u'utf-8').read().split(u'\n') if s.strip()]
nulls = [r for r in rows if r[u'errClass'] is None]
byname = collections.defaultdict(list)
for r in nulls:
    byname[(r[u'tok'] or u'').lstrip(BS)].append(r)

DROOT = {}
for name in sorted(byname):
    rs = byname[name]
    cid = rs[0][u'file'][:4]
    if cid not in DROOT:
        DROOT[cid] = note_dir(cid)
    defs = definitions(DROOT[cid], name)
    longer = sorted(k for k in MAC if k[1:] == name or (k[1:].startswith(name) and len(k) > len(name) + 1))
    print(u'%-20s 站=%-3d 篇=%-2d 素材定义=%-3d 宏表同前缀=%s' % (
        u'\\' + name, len(rs), len(set(r[u'file'][:4] for r in rs)),
        len(defs), u','.join(longer)[:34] or u'-'))
    for d in defs[:2]:
        print(u'      定义 %s:%d (%s)' % d)
print(u'站合计=%d  名字=%d  素材目录取到=%d/%d' % (
    len(nulls), len(byname), sum(1 for v in DROOT.values() if v), len(DROOT)))
