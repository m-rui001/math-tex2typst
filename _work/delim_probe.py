# -*- coding: utf-8 -*-
r"""定界符级修法的验真尺：`python _work/delim_probe.py <spec.json> [--after]`。

这一族改的是 `$`／反引号本身，不是式体，所以「把跨喂给 KaTeX 看会不会渲染」那把尺
（`_work/fix_probe.js`）量不到它。这里量的是**这一行的定界符账**：
用 `texmask.line_delims` 数行内代码之外的单 `$` 枚数与行末反引号开关态，
对规格里的每一单在内存中做 old→new，报修前／修法两个读数，
断言修法后该行单 `$` 成偶、反引号闭合（规格 `parity` 为真时）。
`--after` 是同一把尺的落盘后那一格：不再做替换，只读当前那一行，
断言旧形残差归零（残差＝旧形命中减去新形自带的那几枚，定义在 `_work/spec_resid.py`，
往旧串里插入字符的修法旧形计数天然不归零）、新形在位、且该行定界符账本身就成偶（真偶＝不是替换算出来的）。
式体本身能不能渲染，由全库量具的复量（`_work/sites_diff.js` 的「新增 0」）兜。
"""
import glob
import io
import json
import os
import sys

sys.path.insert(0, u'_work')
from texmask import line_delims  # noqa: E402
from spec_resid import residual  # noqa: E402

fixes = json.load(io.open(sys.argv[1], encoding='utf-8'))
AFTER = u'--after' in sys.argv
bad = 0
for f in fixes:
    path = glob.glob(os.path.join(u'研究笔记', f[u'cid'] + u'-*.md'))[0]
    lines = io.open(path, encoding='utf-8').read().split(u'\n')
    ln = f[u'line']
    cur = lines[ln - 1]
    hits = residual(cur, f[u'old'], f[u'new'])
    b_s, b_d, b_t = line_delims(cur)
    if AFTER:
        ok_hits = hits == 0 and f[u'new'] in cur
        ok_par = (b_s % 2 == 0 and b_t == 0) if f[u'parity'] else True
        shown = u'单$ %d  $$=%d  反引号开=%d  旧形残差=%d/%d' % (
            b_s, b_d, b_t, hits, f[u'expect'])
    else:
        a_s, a_d, a_t = line_delims(cur.replace(f[u'old'], f[u'new']))
        ok_hits = hits == f[u'expect']
        ok_par = (a_s % 2 == 0 and a_t == 0) if f[u'parity'] else True
        shown = u'命中=%d/%d  单$ %d->%d  $$=%d  反引号开=%d->%d' % (
            hits, f[u'expect'], b_s, a_s, b_d, b_t, a_t)
    flag = u''
    if not ok_hits or not ok_par:
        flag = u'  <== 异常'
        bad += 1
    print(u'%s:%-5d %s  %s%s' % (f[u'cid'], ln, shown, f[u'cred'], flag))
print(u'单数=%d %s 异常=%d' % (len(fixes), u'落盘后' if AFTER else u'修前', bad))
