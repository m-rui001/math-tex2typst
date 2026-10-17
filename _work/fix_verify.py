# -*- coding: utf-8 -*-
r"""通用落盘核验：`python _work/fix_verify.py <spec.json>`。

逐单查两件事：
1) 规格那一行现在含**新形**、且旧形只剩新形自带的那些（残差 0）；
2) 全篇旧形残差归零（若作者登记句里的留档引文要保留，规格用 `keep_old` 声明那个数）。
残差而不是计数，是因为有一族修法往旧串里**插入字符**（old 是 new 的子串，
如 `\begin{…}&0`→`\begin{…}&0\end{pmatrix}`），落盘后旧形计数天然还在——定义只在
`_work/spec_resid.py` 写一遍，`_work/delim_probe.py --after` 用同一个。
`$`／反引号／行数／字节四项不变量由 `_work/fix_apply.py` 在落盘那一趟断言，这里不重复量。
"""
import glob
import io
import json
import os
import sys

sys.path.insert(0, u'_work')
from spec_resid import residual  # noqa: E402

BASE = {}
fixes = json.load(io.open(sys.argv[1], encoding='utf-8'))
bad = 0
for f in fixes:
    cid, ln = f[u'cid'], f[u'line']
    path = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    if cid not in BASE:
        BASE[cid] = io.open(path, encoding='utf-8').read()
    text = BASE[cid]
    lines = text.split(u'\n')
    cur = lines[ln - 1] if 0 < ln <= len(lines) else u''
    res_line = residual(cur, f[u'old'], f[u'new'])
    ok_line = (f[u'new'] in cur) and res_line == 0
    want_old = f.get(u'keep_old', 0)
    got_old = residual(text, f[u'old'], f[u'new'])
    ok_file = got_old == want_old
    flag = u''
    if not ok_line or not ok_file:
        flag = u'  <== 异常'
        bad += 1
    print(u'%s:%-5d 该行新形=%d 旧形残差=%d  全篇残差=%d(期望%d)%s  %s' % (
        cid, ln, cur.count(f[u'new']), res_line, got_old, want_old,
        flag, os.path.basename(path)[4:14]))
print(u'单数=%d 异常=%d' % (len(fixes), bad))
