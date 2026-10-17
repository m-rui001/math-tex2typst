# -*- coding: utf-8 -*-
"""批量定点修补的驱动：一串 (id, OLD, NEW, dollars, ticks) 原文用 r'' 落在这个文件里（Write
工具落盘，bash 吃不到反斜杠；r'' 又免掉手写双反斜杠这一层自伤——上一版把 B+B 拼进正文，
`\\prod` 那一形素材里根本没有，命中=0 就是这个信号），再用 argv 列表叫起同一把尺
c_note_fix.py，不复制它的断言。先 DRY 看命中与差值，零异常才 --apply。
"""
import glob
import io
import os
import subprocess
import sys

PAIRS = [
    ('D07', r'\mathbb P_{\mathrm P}}', r'\mathbb P_{\mathrm P}', 0, 0),
    ('D132', r'\max\{\lvert a\rvert,\lvert b\rvert}=',
     r'\max\{\lvert a\rvert,\lvert b\rvert\}=', 0, 0),
    # `\{` 开的字面大括号要用 `\}` 关，不是 `}`。
    ('D190', r'0\le r\le L}\|_{L^4}', r'0\le r\le L\}\|_{L^4}', 0, 0),
    ('D291', r"c_R'=r^{-3/2}}", r"c_R'=r^{-3/2}", 0, 0),
    ('D324', r'\delta_{e_{h(s)}}}', r'\delta_{e_{h(s)}}', 0, 0),
    # 作者第 479 行的工单授权删这枚多余右括号；OLD 带上「 记在」是因为工单自己引用了坏形
    # `$s_n=\frac{n}{2(n+1)}}$`，那一处是留档，不许被一起修好。
    ('D365', r'$s_n=\frac{n}{2(n+1)}}$ 记在', r'$s_n=\frac{n}{2(n+1)}$ 记在', 0, 0),
    # 素材 03-separation.tex:196 逐字写作 s(g,x_i)，笔记这枚 } 是 ) 的误打。
    ('D41', r'f(y)}s(g,x_i}\le s(f,y)', r'f(y)}s(g,x_i)\le s(f,y)', 0, 0),
    ('D533', r'\mathcal H}$', r'\mathcal H$', 0, 0),
    # 同一句前半写作 \frac{ir^2}2Df，凭据在本篇自身。
    ('D586', r'\frac ir^2}2Df_N', r'\frac{ir^2}2Df_N', 0, 0),
    ('D66', r'd_{i+1}^r}', r'd_{i+1}^r', 0, 0),
    ('D757', r'\text{）都有两色密度 }}', r'\text{）都有两色密度 }', 0, 0),
    ('D769', r'\operatorname{Sym}^bT_{C^\circ}}', r'\operatorname{Sym}^bT_{C^\circ}', 0, 0),
    ('D84', r'g(B_\R^n}(0,r))', r'g(B_{\R^n}(0,r))', 0, 0),
    ('D94', r'\lVert \chi\rVert}\le1', r'\lVert \chi\rVert\le1', 0, 0),
    # 两句把中文夹进式子里，配对接成两段；话搬进 \text{}，一段式子复原成一段，$ 各少两枚。
    # D303 的 OLD 不能带开头的 `$`：`\mathbf` 前面是 `\frac1{Z_{\mathcal I}}`，整段只在最外面
    # 有一对 `$`，中间那两枚才是把「内互相回避」挤成段间文字的元凶（本篇预数=0 就是这一格）。
    # 1_{\{...\}}：字面大括号 \{ \} 成对，外面的 _{ } 关掉自己那一层，缺一枚仍拒渲。
    ('D303', r'\mathcal I$ 内互相回避$}\prod_{i\in\mathcal I}P_i$',
     r'\mathcal I\text{ 内互相回避}\}}\prod_{i\in\mathcal I}P_i$', -2, 0),
    ('D511', r"$\lim_{a\to0$ 或 $\infty}X_{n,m}(a,A';B)=X_{n-1,m}(A';B)$",
     r"$\lim_{a\to 0\ \text{或}\ \infty}X_{n,m}(a,A';B)=X_{n-1,m}(A';B)$", -2, 0),
]

APPLY = '--apply' in sys.argv
bad = 0
for cid, old, new, dd, dt in PAIRS:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    # 先在 python 侧数一遍：正文里有几枚、传进 c_note_fix 之后又是几枚。两处不一致就是 argv
    # 在路上掉了字符，不必怀疑正文。
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
print(u'%s bad=%d' % (u'APPLIED' if APPLY else u'DRY-RUN', bad))
