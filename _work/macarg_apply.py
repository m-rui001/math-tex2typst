# -*- coding: utf-8 -*-
r"""`Unexpected end of input in a macro argument` 21 站的定点修补驱动（＋两站尺上不报的 `\Set` 同族）。
串原文用 r'' 落在这个文件里（Write 落盘，bash 吃不到反斜杠），再叫起同一把尺 c_note_fix.py。
先 DRY 看命中与差值，零异常才 --apply。

四族凭据：
- F3 `\text{…$…$…}`（7 站）：shipped 跨度语法会在内层那枚「前不空白、后不数字」的 `$` 关段，
  前半截断在 `\text{` 上＝拒渲，后半掉成正文。内层只是被中文注释夹住的一个字母，
  去掉这两枚 `$` 后整式复原成一跨度，字母一个不删（同族另外 14 站在围栏／引用块里＝逐字 tex 引文，不动）。
- F1 光杆报名字（6 站＋2 站隐身）：`$\eqref$` 四站全库代码跨度形 `` `\eqref` `` 有 17 处先例；
  `$\red$` 那一站本身就是登记句（本篇 `\mathrm{red}` 18 处）；`\Set` 是 KaTeX 内置带参函数，
  写 `\Set(\text{…})` 发成 `{(}…` 的乱码（尺上不报），Lean 侧的 `Set` 按 `\mathrm{Set}` 记。
- F4 拼接残伤（5 站＝D351 一行）：`\mathrm\operatorname{Id}`，本篇另有 9 处合法形 `\mathrm{Id}`。
- F2 漏符／作者申报（3 站）：D326 第 41 行自己说「第二式括号应当闭合」并给出正确形；
  D521 本篇 `\mathfrak S` 14 处；D576「最后一处我笔误」那一枚改成代码跨度，留档不动正文。
"""
import glob
import io
import os
import subprocess
import sys

PAIRS = [
    # ---- F3：内层 $ 落在 \text{} 里（D582 那一处有两对，所以 $ 少四枚）
    ('D139', r'\text{$s$ 的固定幂}', r'\text{s 的固定幂}', -2, 0),
    ('D163', r'\text{ 是 $k$-power-free}', r'\text{ 是 k-power-free}', -2, 0),
    ('D30', r'\text{$F$ 有界全纯}', r'\text{F 有界全纯}', -2, 0),
    ('D396', r'\text{至少 $s$ 个槽在 }', r'\text{至少 s 个槽在 }', -2, 0),
    ('D57', r'\text{$S$ 是 transversal}', r'\text{S 是 transversal}', -2, 0),
    ('D582', r'\text{$i$ 之后下一钉在 $T$}', r'\text{i 之后下一钉在 T}', -4, 0),
    ('D750', r'\text{$n$ 圈的返回贡献}', r'\text{n 圈的返回贡献}', -2, 0),
    # ---- F1：光杆控制字改成代码跨度／按登记形写
    ('D233', r'$\eqref$ 形的第二条不等式', r'`\eqref` 形的第二条不等式', -2, 2),
    ('D446', r'$\eqref$ 意义下', r'`\eqref` 意义下', -2, 2),
    ('D480', r'$\eqref$ 式得', r'`\eqref` 式得', -2, 2),
    ('D575', r'$\eqref$ 形式的径向解', r'`\eqref` 形式的径向解', -2, 2),
    ('D463', r'$\red$ 写成', r'`\red` 写成', -2, 2),
    ('D157', r'\Set', r'\mathrm{Set}', 0, 0),
    ('D128', r'\Set', r'\mathrm{Set}', 0, 0),
    # ---- F4：D351 第 78 行五处 `\mathrm\operatorname{Id}`，OLD 各带自己的左右手
    ('D351', r'$RD=\mathrm\operatorname{Id}$', r'$RD=\mathrm{Id}$', 0, 0),
    ('D351', r'B_0P=\mathrm\operatorname{Id}+K', r'B_0P=\mathrm{Id}+K', 0, 0),
    ('D351', r'B_0(\mathrm\operatorname{Id}-H_0)', r'B_0(\mathrm{Id}-H_0)', 0, 0),
    ('D351', r'RD=PL+H_0=\mathrm\operatorname{Id}', r'RD=PL+H_0=\mathrm{Id}', 0, 0),
    ('D351', r'L=(P+H_0)^{-1}(\mathrm\operatorname{Id}-H_0)', r'L=(P+H_0)^{-1}(\mathrm{Id}-H_0)', 0, 0),
    # ---- F2
    ('D326', r'\arccos(-\sqrt q/2),$$', r'\arccos(-\sqrt q/2)},$$', 0, 0),
    ('D521', r'\frac{\mathfrak}2', r'\frac{\mathfrak S}2', 0, 0),
    ('D576', r'$k+8(k+1)-\frac{12}{5}(k+1)=\frac{33k+28)/5}$',
     r'`k+8(k+1)-\frac{12}{5}(k+1)=\frac{33k+28)/5}`', -2, 2),
]

APPLY = '--apply' in sys.argv
bad = 0
for cid, old, new, dd, dt in PAIRS:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    here = io.open(f, encoding='utf-8').read().count(old)
    cmd = [sys.executable, os.path.join(u'_work', u'c_note_fix.py'), cid,
           u'--old', old, u'--new', new, u'--dollars', str(dd), u'--ticks', str(dt)]
    if APPLY:
        cmd.append(u'--apply')
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    out = ((r.stdout or u'') + (r.stderr or u'')).rstrip()
    tail = out.split(u'\n')[-2:]
    print(u'%s 本篇预数=%d  %s' % (cid, here, u' / '.join(tail)))
    if r.returncode != 0 or u'零命中' in out:
        bad += 1
print(u'%s 单数=%d 异常=%d' % (u'APPLY' if APPLY else u'DRY', len(PAIRS), bad))
