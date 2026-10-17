# -*- coding: utf-8 -*-
r"""修后盘外复量：逐站断言 新形在盘＝1、旧形在盘＝0；两处作者登记句还要另证
「坏形逐字留档、且此刻坐在代码跨度里而不是数学跨度里」。"""
import glob
import io
import os
import re

# (cid, line, 旧形, 新形, 该行新形应为几)  —— D204:254 行首本来就有一枚正确的 `\mathfrak m_B`
PAIRS = [
    (u'D137', 667, r'\tfrac a_\sigma', r'\tfrac{r}{x}a_\sigma', 1),
    (u'D204', 254, r'\mathfrm_B', r'\mathfrak m_B', 2),
    (u'D235', 383, r'q(\xi)^^{-\gamma}', r'q(\xi)^{-\gamma}', 1),
    (u'D260', 246, r'(x\mapsto cx)_#\mu', r'(x\mapsto cx)_\#\mu', 1),
    (u'D262', 502, r'\mu\{S^^*f', r'\mu\{S^*f', 1),
    (u'D307', 112, r'\mathfrm_x', r'\mathfrak m_x', 1),
    (u'D523', 178, r'\mathbf C^^r', r'\mathbf C^r', 1),
    (u'D619', 184, r'$(p_U)__*$', r'$(p_U)_*$', 1),
    (u'D772', 322, r'$U(v)__1\otimes U(v)_c$', r'$U(v)_1\otimes U(v)_c$', 1),
]
bad = 0
for cid, line, old, new, want_new in PAIRS:
    p = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    t = io.open(p, encoding=u'utf-8').read()
    ls = t.split(u'\n')
    has_new = ls[line - 1].count(new)
    has_old = ls[line - 1].count(old)
    file_old = t.count(old)
    # D204 的旧形在 355 行作者登记句的引文里逐字留档，篇级计数应为 1，不是缺陷
    want_file_old = 1 if cid == u'D204' else 0
    ok = has_new == want_new and has_old == 0 and file_old == want_file_old
    print(u'%s:%-5d 新形=%d(应%d) 旧形(行)=%d 旧形(篇)=%d  %s' % (
        cid, line, has_new, want_new, has_old, file_old, u'OK' if ok else u'!! 复核不过'))
    if not ok:
        bad += 1

# 两处作者登记句：坏形逐字仍在，只是换了载体
REG = [
    (u'D61', 1048, u'`(6r/c)^^{3/2}`', u'$(6r/c)^^{3/2}$'),
    (u'D772', 1050, u'`U(v)__1`', u'$U(v)__1$'),
]
for cid, line, span, mathform in REG:
    p = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    ls = io.open(p, encoding=u'utf-8').read().split(u'\n')
    l = ls[line - 1]
    ok = span in l and mathform not in l
    print(u'%s:%-5d 登记句 代码跨度=%d 数学跨度=%d  %s' % (
        cid, line, l.count(span), l.count(mathform), u'OK' if ok else u'!! 复核不过'))
    print(u'      %s' % l[:150])
    if not ok:
        bad += 1

# 全库双打面：`^^` 应只在代码跨度／正文引文里，`_{2,}` 同
rx1 = re.compile(r'\^\^')
rx2 = re.compile(r'_{2,}')
tot = {}
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    cid = os.path.basename(p)[:4]
    for i, l in enumerate(io.open(p, encoding=u'utf-8', errors=u'replace').read().split(u'\n'), 1):
        for lab, rx in ((u'caret', rx1), (u'under', rx2)):
            n = len(rx.findall(l))
            if n:
                tot.setdefault(lab, []).append((cid, i, n, l.strip()[:90]))
for lab in (u'caret', u'under'):
    v = tot.get(lab, [])
    print(u'\n### 修后全库 %s 双打：%d 处 / %d 篇' % (lab, sum(x[2] for x in v), len(set(x[0] for x in v))))
    for cid, i, n, l in v:
        print(u'  %s:%-5d x%d  %s' % (cid, i, n, l))
print(u'\n异常=%d' % bad)
