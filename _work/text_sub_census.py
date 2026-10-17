# -*- coding: utf-8 -*-
r"""`\text{}` 与下标的 house 形普查：`python _work/text_sub_census.py`。

D104:155 那一跨写作 `\prod_j(\text{w_j 非典范})^2`，KaTeX 报 `Expected 'EOF', got '_'`
（`\text{}` 的参数位是**文本模式**，裸 `_` 不被接受——与 [[note-backslash-digit-macro-collision-family]]
里 `\tag{}` 那一格是同一条律）。修法候选里唯一「看起来免费」的是 `\text{…$…$…}`（KaTeX 认嵌套数学），
所以要问量具：本库跨度语法是逐字符扫定界符的，它剥不剥 `\text{}`？不剥的话这两枚 `$` 会把跨从中间切断。
不加定界符的候选是 `\text{w}_{j}`／`\mathrm{w}_j`／`\mathit{w}_j`，本尺数它们在**全库笔记**里各值多少处、多少篇。
"""
import glob
import io
import re

BS = chr(92)
D = chr(36)
RBS = BS + BS          # 正则里的一枚反斜杠
PATS = {
    u'text 内裸下划线(病形)': RBS + u'text\{[^{}' + RBS + u']*' + RBS + u'_[^{}]*\}',
    u'text 内套 $…$': RBS + u'text\{' + D + u'[^{}]*' + D,
    u'text{拉丁}后紧跟下标': RBS + u'text\{[A-Za-z][^{}]*\}' + RBS + u'_',
    u'mathrm{拉丁}后紧跟下标': RBS + u'mathrm\{[A-Za-z][^{}]*\}' + RBS + u'_',
    u'mathit{拉丁}后紧跟下标': RBS + u'mathit\{[A-Za-z][^{}]*\}' + RBS + u'_',
    u'operatorname': RBS + u'operatorname',
    u'text{含 CJK}': RBS + u'text\{[^{}]*[^\x00-\x7f][^{}]*\}',
}
tot = dict((k, 0) for k in PATS)
files = dict((k, set()) for k in PATS)
hits = {}
for p in glob.glob(u'研究笔记/D*.md'):
    t = io.open(p, encoding=u'utf-8').read()
    for k, pat in PATS.items():
        n = len(re.findall(pat, t))
        if n:
            tot[k] += n
            files[k].add(p)
        if k.startswith(u'text 内'):
            hits.setdefault(k, []).append((p[5:9], n))
for k in PATS:
    print(u'%-26s 处=%-6d 篇=%d' % (k, tot[k], len(files[k])))
for k, v in hits.items():
    print(k, sorted(v)[:12])
