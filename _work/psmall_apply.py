# -*- coding: utf-8 -*-
r"""`No such environment: psmallmatrix` 12 站的定点修补驱动（9 条 OLD/NEW 覆盖 12 站）。

凭据与改法（一条路，不发第二形）：
- `psmallmatrix` 是 mathtools 的环境，＝ `\left(\begin{smallmatrix}…\end{smallmatrix}\right)`；
  KaTeX 只带 amsmath 的 `smallmatrix`（探针 _work/psmall_probe.js：psmallmatrix/bsmallmatrix 均
  `No such environment`，改写后 12 站逐站 RENDERS，见 _work/psmall_rewrite_probe.js）。
- house 形已经是这个：全库笔记 `\begin{smallmatrix}` 66 处里 63 处前驱是 `\left(`
  （_work/psmall_cred.py），素材同形 —— D214 `selector.tex:151`、D47 `topology.tex:27`
  都写 `\left(\begin{smallmatrix}-1&1\\1&1\end{smallmatrix}\right)`。
- 全库 `psmallmatrix` 出现次数＝12＝拒渲站数，4 篇，没有围栏／代码跨度里的隐形同族，
  所以这一族不需要 `_work/textdollar_face.js` 那样的第二把尺。
- D49:116 那一站里另有第二处缺陷：行分隔 `\\` 后面写作 `mathbf 1`，反斜杠丢了，
  页上把字母印出来（AS-IS ink `(0−1mathbf10)`）。素材 `main.tex:21` 定义 `\newcommand{\1}{\mathbf 1}`，
  作者的字面形就是 `\mathbf 1`（带空格的算子形，KaTeX 认），所以补一枚反斜杠、不改写成 `\mathbf{1}`。
- D47 两条 OLD 的顺序有讲究：`\phi=\begin{psmallmatrix}1&1\\1&2\end{psmallmatrix}`（254＋575 两站）
  必须先落，剩下的裸形（254 手工乘积那一处）才是 1 命中；反序会把 `\phi=` 那一处也吞进 3 命中。
"""
import glob
import io
import os
import subprocess
import sys

PAIRS = [
    ('D214', r'\begin{psmallmatrix}-1&1\\1&1\end{psmallmatrix}',
     r'\left(\begin{smallmatrix}-1&1\\1&1\end{smallmatrix}\right)', 1),
    ('D214', r'H=\begin{psmallmatrix}-1&-1&1\\-1&-1&1\\1&1&1\end{psmallmatrix}',
     r'H=\left(\begin{smallmatrix}-1&-1&1\\-1&-1&1\\1&1&1\end{smallmatrix}\right)', 1),
    ('D24', r'e=\begin{psmallmatrix}1&0\\0&0\end{psmallmatrix}',
     r'e=\left(\begin{smallmatrix}1&0\\0&0\end{smallmatrix}\right)', 1),
    ('D24', r'f=\begin{psmallmatrix}0&0\\0&1\end{psmallmatrix}',
     r'f=\left(\begin{smallmatrix}0&0\\0&1\end{smallmatrix}\right)', 1),
    ('D24', r't=\begin{psmallmatrix}0&1\\0&0\end{psmallmatrix}',
     r't=\left(\begin{smallmatrix}0&1\\0&0\end{smallmatrix}\right)', 1),
    ('D47', r'\phi=\begin{psmallmatrix}1&1\\1&2\end{psmallmatrix}',
     r'\phi=\left(\begin{smallmatrix}1&1\\1&2\end{smallmatrix}\right)', 2),
    ('D47', r'\psi=\begin{psmallmatrix}1&-1\\-1&2\end{psmallmatrix}',
     r'\psi=\left(\begin{smallmatrix}1&-1\\-1&2\end{smallmatrix}\right)', 2),
    ('D47', r'\begin{psmallmatrix}1&1\\1&2\end{psmallmatrix}',
     r'\left(\begin{smallmatrix}1&1\\1&2\end{smallmatrix}\right)', 1),
    ('D47', r'\begin{psmallmatrix}1&6\\0&1\end{psmallmatrix}',
     r'\left(\begin{smallmatrix}1&6\\0&1\end{smallmatrix}\right)', 1),
    ('D49', r'\begin{psmallmatrix}0&-1\\mathbf 1&0\end{psmallmatrix}',
     r'\left(\begin{smallmatrix}0&-1\\\mathbf 1&0\end{smallmatrix}\right)', 1),
]

APPLY = '--apply' in sys.argv
bad = 0
sim = {}
for cid, old, new, expect in PAIRS:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    if cid not in sim:
        sim[cid] = io.open(f, encoding='utf-8').read()
    # 预数读的是「前面几条落完之后」的那一形：D47 的裸形在 `\phi=` 那条之前命中 3，之后才是 1。
    here = sim[cid].count(old)
    sim[cid] = sim[cid].replace(old, new)
    cmd = [sys.executable, os.path.join(u'_work', u'c_note_fix.py'), cid,
           u'--old', old, u'--new', new, u'--dollars', u'0', u'--ticks', u'0']
    if APPLY:
        cmd.append(u'--apply')
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    out = ((r.stdout or u'') + (r.stderr or u'')).rstrip()
    tail = out.split(u'\n')[-2:]
    flag = u'' if here == expect else u'  <== 预数不符'
    print(u'%s 本篇预数=%d 期望=%d  %s%s' % (cid, here, expect, u' / '.join(tail), flag))
    if r.returncode != 0 or u'零命中' in out or here != expect:
        bad += 1
print(u'%s 单数=%d 覆盖站=%d 异常=%d' % (
    u'APPLY' if APPLY else u'DRY', len(PAIRS), sum(p[3] for p in PAIRS), bad))
