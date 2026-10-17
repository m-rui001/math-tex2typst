# -*- coding: utf-8 -*-
r"""
台账行内 \| 定点修补执行器（机械替换，不续写）。
用法：  python _work/pipe_fix.py <ID> [--dry]
纪律：
  * 只改清单内 16 篇；严禁 D84/D95/D535；只改指定行的指定片段。
  * 每处替换先 assert 全文件命中数 == 1，且命中落在目标行内。
  * 替换后 assert：该行竖线数 == 预期、该行 $ 数奇偶不变、全文件行数不变、CR 字节为 0。
  * 代码跨度（反引号内）的 \| 不动；落盘前先数目标行的非代码 \| 数 == 台账预期 sites。
  * 落盘只用 io.open(p,'wb') 写字节；打印 OLD/NEW 整行。
"""
import io, os, re, sys

BASE = r'E:\math\研究笔记'
LOG = r'E:\math\_work\pipe_fix_log.txt'
FORBID = ('D84-', 'D95-', 'D535-')

# ---------------------------------------------------------------- 决策表
# 每条： (行号, 该码跨度外 \| 数, 替换后该行竖线数, [(old, new), ...])
PLAN = {}

PLAN['D25'] = [
    (255, 8, 4, [
        (r'正定 $S$，$\|S\|\|S^{-1}\|\le2$', r'正定 $S$，$\lVert S\rVert\lVert S^{-1}\rVert\le2$'),
        (r'$\|P[A]\|\le2\max_{W(A)}\|P\|$', r'$\lVert P[A]\rVert\le2\max_{W(A)}\lVert P\rVert$')]),
    (259, 4, 4, [
        (r'相似条件数 $\|S\|\|S^{-1}\|\le2$', r'相似条件数 $\lVert S\rVert\lVert S^{-1}\rVert\le2$')]),
    (315, 2, 6, [
        (r'| $\|\cdot\|_\partial$ | `main.tex:368-371`', r'| $\lVert \cdot\rVert_\partial$ | `main.tex:368-371`')]),
    (596, 6, 5, [
        (r'$\|(Tu)(\mu)\|^2\le\int K\|u\|^2$', r'$\lVert (Tu)(\mu)\rVert^2\le\int K\lVert u\rVert^2$'),
        (r'$=\kappa\ne1$：$\|T\|\le\kappa$', r'$=\kappa\ne1$：$\lVert T\rVert\le\kappa$')]),
    (700, 4, 5, [
        (r'一份来自 $Tu$（$\|T\|\le1$）', r'一份来自 $Tu$（$\lVert T\rVert\le1$）'),
        (r'若 $\|T\|\le\kappa$（例如', r'若 $\lVert T\rVert\le\kappa$（例如')]),
    (702, 2, 5, [(r'变号则 $\|T\|\le1$ 失效', r'变号则 $\lVert T\rVert\le1$ 失效')]),
    (703, 2, 5, [(r'$\|T\|_{L^2\to L^2}$ 未知', r'$\lVert T\rVert_{L^2\to L^2}$ 未知')]),
    (705, 2, 5, [(r'$\|T\|\le2\pi$', r'$\lVert T\rVert\le2\pi$')]),
    (708, 2, 5, [(r'换成 $\|FG\|_\partial^2$', r'换成 $\lVert FG\rVert_\partial^2$')]),
    (709, 2, 5, [(r'$\|T\|\le1$ 仍可能成立', r'$\lVert T\rVert\le1$ 仍可能成立')]),
    (1043, 10, 5, [
        (r'| $\|F(z)\|\le1$ on $\partial\Omega$ | `main.tex:324` | 只用于第 4.2 步',
         r'| $\lVert F(z)\rVert\le1$ on $\partial\Omega$ | `main.tex:324` | 只用于第 4.2 步'),
        (r'$\int_\Omega\|F\|^2\le1$：第三个不等号', r'$\int_\Omega\lVert F\rVert^2\le1$：第三个不等号'),
        (r'$\|FG\|_\partial\le(\sup\|F\|)\|G\|_\partial$',
         r'$\lVert FG\rVert_\partial\le(\sup\lVert F\rVert)\lVert G\rVert_\partial$')]),
    (1044, 2, 5, [(r'| $\gamma=\|F[A]\|$ 与前置分情形', r'| $\gamma=\lVert F[A]\rVert$ 与前置分情形')]),
    (1046, 2, 5, [(r'带上 $\|x\|^4$', r'带上 $\lVert x\rVert^4$')]),
    (1344, 6, 5, [
        (r'| $\|F(z)\|\le1$ on $\partial\Omega$ | `main.tex:324` | 第 (3) 个不等号',
         r'| $\lVert F(z)\rVert\le1$ on $\partial\Omega$ | `main.tex:324` | 第 (3) 个不等号'),
        (r'改成 $\int_\Omega\|F\|^2\le1$ ⇒', r'改成 $\int_\Omega\lVert F\rVert^2\le1$ ⇒'),
        (r'$\|F\|$ 次调和', r'$\lVert F\rVert$ 次调和')]),
    (1345, 2, 5, [(r'| $\gamma=\|F[A]\|$ 与 $a>0$', r'| $\gamma=\lVert F[A]\rVert$ 与 $a>0$')]),
    (1609, 4, 4, [(r'"contraction" = $\|Tf\|_2\le\|f\|_2$', r'"contraction" = $\lVert Tf\rVert_2\le\lVert f\rVert_2$')]),
    # ↓ 1360 / 1611：台账清单 pipe_rows_census.txt 漏测的两行（6 枚启发式看不见：该行竖线数恰为
    #   4 列表头 4 枚 + 格内 2 枚 \| = 6 枚）。由全表复扫 _work/pipe_verify.py 抓到，同一修法补齐。
    (1360, 2, 4, [(r'$\lvert AB\rvert_2\le\|A\|\lvert B\rvert_2$（两个方向）',
                   r'$\lvert AB\rvert_2\le\lVert A\rVert\lvert B\rvert_2$（两个方向）')]),
    (1611, 2, 4, [(r'"boundary operator norm" = $\sup_{\partial\Omega}\|F(z)\|\le1$',
                   r'"boundary operator norm" = $\sup_{\partial\Omega}\lVert F(z)\rVert\le1$')]),
    (1871, 2, 7, [(r'$\|b_k(A)\|\le C\theta^k$ 保证级数绝对收敛', r'$\lVert b_k(A)\rVert\le C\theta^k$ 保证级数绝对收敛')]),
    (1872, 2, 7, [(r'| $\gamma=\|F[A]\|$ | `main.tex:329` |', r'| $\gamma=\lVert F[A]\rVert$ | `main.tex:329` |')]),
    (1876, 2, 7, [(r'里的 $\|z\|\le L$ 结论', r'里的 $\lVert z\rVert\le L$ 结论')]),
    (1882, 2, 7, [(r'结论变成 $\|0\|\le2\cdot0$ 仍真', r'结论变成 $\lVert 0\rVert\le2\cdot0$ 仍真')]),
    (1884, 4, 7, [(r'$\|x^*Ax\|=2\|x_1x_2\|\le1$', r'$\lvert x^*Ax\rvert=2\lvert x_1x_2\rvert\le1$')]),
    (1885, 4, 7, [
        (r'就是让 $\|A\|=2$ 且', r'就是让 $\lVert A\rVert=2$ 且'),
        (r'给出 $\|A\|=t$', r'给出 $\lVert A\rVert=t$')]),
    (1886, 4, 11, [(r'否则像不在半径 $\|u\|^2+\|v\|^2=1$ 的球面上', r'否则像不在半径 $\lVert u\rVert^2+\lVert v\rVert^2=1$ 的球面上')]),
    (2550, 2, 5, [(r'| $\gamma$（$\|F[A]\|$） |', r'| $\gamma$（$\lVert F[A]\rVert$） |')]),
]

PLAN['D32'] = [
    (646, 2, 6, [(r'| $S_X$ | $\{x:\|x\|=1\}$，继承度量', r'| $S_X$ | $\{x:\lVert x\rVert=1\}$，继承度量')]),
    (647, 4, 6, [(r'$\|f(x)-qf(y)\|-\|x-qy\|$', r'$\lVert f(x)-qf(y)\rVert-\lVert x-qy\rVert$')]),
    (649, 2, 6, [(r'| $\|D_q\|\le2\min(q,1-q)$ |', r'| $\lvert D_q\rvert\le2\min(q,1-q)$ |')]),
    (652, 4, 6, [
        (r'| $\|(a_n)\|_{\mathcal U}$ | $\lim_{\mathcal U}\|a_n\|$ |',
         r'| $\lVert (a_n)\rVert_{\mathcal U}$ | $\lim_{\mathcal U}\lVert a_n\rVert$ |')]),
    (654, 4, 6, [(r'$\|f(x_0)-tf(y)\|-\|x_0-ty\|=M$', r'$\lVert f(x_0)-tf(y)\rVert-\lVert x_0-ty\rVert=M$')]),
    (660, 2, 6, [(r'| $r=u+M$、$\|pv+rg(v)\|=p+r$ | 248-250 |', r'| $r=u+M$、$\lVert pv+rg(v)\rVert=p+r$ | 248-250 |')]),
    (662, 8, 6, [
        (r"$\|g(v)-g(v')\|\le\frac{up}{rs}\|v-v'\|+\frac{2\|u-u'\|}{r}+\frac{2u\|p-p'\|}{rs}$",
         r"$\lVert g(v)-g(v')\rVert\le\frac{up}{rs}\lVert v-v'\rVert+\frac{2\lvert u-u'\rvert}{r}+\frac{2u\lvert p-p'\rvert}{rs}$")]),
    (676, 4, 6, [(r'$\|sw+\eta b\|-\|pv+\eta y\|\le M$', r'$\lVert sw+\eta b\rVert-\lVert pv+\eta y\rVert\le M$')]),
    (680, 4, 6, [(r'$\|y+\lambda v\|$、$\|b+\lambda w\|$', r'$\lVert y+\lambda v\rVert$、$\lVert b+\lambda w\rVert$')]),
    (681, 4, 6, [
        (r'$\epsilon F(r/\epsilon)=\|y-z\|=\|b-f(z)\|=\epsilon G(u/\epsilon)$',
         r'$\epsilon F(r/\epsilon)=\lVert y-z\rVert=\lVert b-f(z)\rVert=\epsilon G(u/\epsilon)$')]),
    (683, 4, 6, [(r"$\|F(m)-m'\|\le\|a-c\|/2$", r"$\lVert F(m)-m'\rVert\le\lVert a-c\rVert/2$")]),
]

PLAN['D65'] = [
    (341, 8, 6, [
        (r'| $s=\|y\|/(12\|x\|)$ 与 $1/12$', r'| $s=\lVert y\rVert/(12\lVert x\rVert)$ 与 $1/12$'),
        (r'eq:paired 的 $\sqrt{\|x\|^2+\|y\|^2/12}$', r'eq:paired 的 $\sqrt{\lVert x\rVert^2+\lVert y\rVert^2/12}$')]),
    (342, 2, 6, [(r'改动即失 $\|x\pm z\|\le R$', r'改动即失 $\lVert x\pm z\rVert\le R$')]),
    (348, 6, 6, [
        (r'$0<\eta<1$,$\|x-P_Hx\|<\eta$;lens 侧 $\|Q_Hx\|<\eta$、$\|P_H(y_i-y_j)\|<2\eta$',
         r'$0<\eta<1$,$\lVert x-P_Hx\rVert<\eta$;lens 侧 $\lVert Q_Hx\rVert<\eta$、$\lVert P_H(y_i-y_j)\rVert<2\eta$')]),
]

PLAN['D47'] = [
    (594, 2, 5, [(r"$\|P'\|\le C\delta$、domination", r"$\lVert P'\rVert\le C\delta$、domination")]),
    (595, 6, 5, [
        (r"$\|P\|\le C_0,\|P'\|\le C_0\delta,\|P'p\|^2\le C_0\delta(-F'')$",
         r"$\lVert P\rVert\le C_0,\lVert P'\rVert\le C_0\delta,\lVert P'p\rVert^2\le C_0\delta(-F'')$")]),
    (597, 4, 5, [
        (r'$\|S(p,e)-Lp_1\|\le C_m\delta L\|p_1\|$',
         r'$\lVert S(p,e)-Lp_1\rVert\le C_m\delta L\lVert p_1\rVert$')]),
]

PLAN['D36'] = [
    (600, 2, 6, [(r'| κ_j | \|B₂^j\| |', r'| κ_j | \lvert B₂^j\rvert |')]),
    (601, 4, 6, [(r'| \|T_d\| | 1/d! | :315 | R 分母 \|T_d\|^{d−1} |', r'| \lvert T_d\rvert | 1/d! | :315 | R 分母 \lvert T_d\rvert^{d−1} |')]),
    (602, 2, 6, [(r'| \|ΠT_d\| | (d+1)/((d−1)!)^d |', r'| \lvert ΠT_d\rvert | (d+1)/((d−1)!)^d |')]),
    (603, 2, 6, [(r'÷ \|T₂\|=1/2）', r'÷ \lvert T₂\rvert=1/2）')]),
]

PLAN['D26'] = [
    (1090, 2, 5, [(r'$\|u\|\le D$ 与均值误差的乘积结构', r'$\lVert u\rVert\le D$ 与均值误差的乘积结构')]),
    (1096, 2, 5, [(r'$2D$（$\|u\|$ 界）', r'$2D$（$\lVert u\rVert$ 界）')]),
    (1116, 2, 5, [(r'$c_p=(\mathbb E\|g\|^p)^{1/p}$', r'$c_p=(\mathbb E\lVert g\rVert^p)^{1/p}$')]),
]

PLAN['D28'] = [
    (1166, 2, 6, [(r'| E\|Ω\| | N^{3−β−90δ}', r'| E\lvert Ω\rvert | N^{3−β−90δ}')]),
    (1176, 2, 6, [(r'边长和 6、\|3−s\| 检查唯一确定', r'边长和 6、\lvert 3−s\rvert 检查唯一确定')]),
    (1184, 2, 6, [(r'| N | \|S_n\|（论文）', r'| N | \lvert S_n\rvert（论文）')]),
]

PLAN['D29'] = [
    (826, 2, 7, [(r'| $\|P_x-P_y\|_F^2=2-2\langle u,v\rangle^2$', r'| $\lVert P_x-P_y\rVert_F^2=2-2\langle u,v\rangle^2$')]),
    (834, 2, 7, [(r'$\|F(A)\|_1=\operatorname{tr}\lvert A\rvert$', r'$\lVert F(A)\rVert_1=\operatorname{tr}\lvert A\rvert$')]),
    (847, 2, 7, [(r'$\|A\|_F^2$ 含', r'$\lVert A\rVert_F^2$ 含')]),
]

PLAN['D41'] = [
    (536, 2, 5, [(r'$\|\mathcal T\|<t$、系数', r'$\lvert \mathcal T\rvert<t$、系数')]),
    (541, 2, 5, [(r'| $\|\mathcal T\|$ | $\le t-1=15$', r'| $\lvert \mathcal T\rvert$ | $\le t-1=15$')]),
    (542, 2, 5, [(r'| $\|\mathcal G\|$ | $\le3$', r'| $\lvert \mathcal G\rvert$ | $\le3$')]),
]

PLAN['D68'] = [
    (1346, 2, 6, [
        (r'| $D(\mu\|\nu_{*})\ge\epsilon D(\mu\|U_{m})-O(\log d)$ |',
         r'| $D(\mu\Vert \nu_{*})\ge\epsilon D(\mu\Vert U_{m})-O(\log d)$ |')]),
    (1347, 1, 6, [(r'| $D(P\|R)\ge\mathbb E_{P}W-\log\mathbb E_{R}e^{W}$ | 允许支撑外取',
                   r'| $D(P\Vert R)\ge\mathbb E_{P}W-\log\mathbb E_{R}e^{W}$ | 允许支撑外取')]),
    (1370, 2, 6, [
        (r"| $\lVert A_{2}A_{1}\rVert_{S^{P}}\le\big\|\lvert A_{2}\rvert^{P/q}\lvert A_{1}^{*}\rvert^{P/q}\big\|_{S^{q}}^{q/P}$",
         r"| $\lVert A_{2}A_{1}\rVert_{S^{P}}\le\big\lVert \lvert A_{2}\rvert^{P/q}\lvert A_{1}^{*}\rvert^{P/q}\big\rVert_{S^{q}}^{q/P}$")]),
]

PLAN['D30'] = [
    (804, 4, 6, [
        (r'| $c_0=\frac{1-\|f\|_\infty}{4}$', r'| $c_0=\frac{1-\lVert f\rVert_\infty}{4}$'),
        (r'| $\|f\|_\infty\to1$ ⇒ $c_0\to0$', r'| $\lVert f\rVert_\infty\to1$ ⇒ $c_0\to0$')]),
]

PLAN['D34'] = [
    (570, 2, 6, [(r'$\mathbb E\|\cdot\|_{\mathrm{TV}}\le B_C', r'$\mathbb E\lVert \cdot\rVert_{\mathrm{TV}}\le B_C')]),
    (739, 2, 7, [(r'引理 5.1 用 $\|\cdot\|_{\mathrm{TV}}$', r'引理 5.1 用 $\lVert \cdot\rVert_{\mathrm{TV}}$')]),
]

PLAN['D24'] = [
    (706, 2, 6, [(r'推出 $\|P^*P-I\|<\frac{11}{25}$', r'推出 $\lVert P^*P-I\rVert<\frac{11}{25}$')]),
]

PLAN['D364'] = [
    (453, 2, 6, [(r'| $C\|f\|_{H^{1/3}}$ 端点界', r'| $C\lVert f\rVert_{H^{1/3}}$ 端点界')]),
]

PLAN['D44'] = [
    (450, 2, 6, [(r'$\cong(\mathbb Z/2)^m$，$\|Z_m\|=2^m$', r'$\cong(\mathbb Z/2)^m$，$\lvert Z_m\rvert=2^m$')]),
]

# D50 line 438 的 $\big\|_P$ 为单枚未配对限制号：该篇只有 \mid（整除）与 \lvert\rvert（绝对值）
# 两种自述合法形，无 restriction 凭据 ⇒ 登记不改动（见报告）。
PLAN['D50'] = []
REGISTER = {'D50': [(438, 1, '单枚未配对 \\|：$(1+2s^2x)F\\big\\|_P$ 是限制/求值号，非绝对值/范数；'
                              '本篇自述只用 \\mid（整除）与 \\lvert\\rvert（绝对值），无 \\upharpoonright 凭据 ⇒ 不发明，原样登记')]}

CODESPAN_NOTE = {
    ('D25', 315): '代码跨度 `\\|H\\|_\\partial^2=...` 内 2 枚 \\| 保留 ⇒ 该行剩 6 枚竖线（表头 4）',
    ('D25', 1886): '代码跨度 `\\|u\\|2-\\|v\\|2` 内 4 枚 \\| 保留 ⇒ 该行剩 11 枚竖线（表头 7）',
    ('D34', 739): '代码跨度 `\\|p i - q i\\|` 内 2 枚 \\| 保留 ⇒ 该行剩 7 枚竖线（表头 5）',
}

CS = re.compile(r'`[^`]*`')


def mask(line):
    return CS.sub(lambda m: '\x00' * len(m.group(0)), line)


def note_path(pid):
    for f in sorted(os.listdir(BASE)):
        if f.startswith(pid + '-'):
            for bad in FORBID:
                assert not f.startswith(bad), 'forbidden note ' + f
            return os.path.join(BASE, f)
    raise SystemExit('note not found: ' + pid)


def main():
    pid = sys.argv[1].upper()
    dry = '--dry' in sys.argv
    only = None
    for a in sys.argv[2:]:
        if a.startswith('--only'):
            spec = a.split('=', 1)[1] if '=' in a else sys.argv[sys.argv.index(a) + 1]
            only = set(int(x) for x in spec.replace(',', ' ').split())
    p = note_path(pid)
    raw = io.open(p, 'rb').read()
    assert raw.count(b'\r') == 0, 'CR bytes present'
    text = raw.decode('utf-8')
    lines = text.split('\n')
    nlines0 = len(lines)
    log = []
    log.append('################ %s  (%s)' % (pid, os.path.basename(p)))
    log.append('before: bytes=%d lines=%d%s' % (len(raw), nlines0,
                                               ('  only=' + ','.join(str(x) for x in sorted(only))) if only else ''))
    rows_done = 0
    sites_done = 0
    for (ln, nbar, exp_pipes, frags) in PLAN[pid]:
        if only is not None and ln not in only:
            continue
        idx = ln - 1
        assert 0 <= idx < len(lines), 'line out of range %s:%d' % (pid, ln)
        old_line = lines[idx]
        # 前置校验：非代码 \| 数与台账一致
        m = mask(old_line)
        got = m.count('\\|')
        assert got == nbar, '%s:%d non-code \\| = %d, expected %d' % (pid, ln, got, nbar)
        cur = old_line
        for (o, nw) in frags:
            assert cur.count(o) == 1, '%s:%d fragment not 1x in target line: %r' % (pid, ln, o[:60])
            assert text.count(o) == 1, '%s:%d fragment not 1x in whole file: %r' % (pid, ln, o[:60])
            assert o != nw
            cur = cur.replace(o, nw)
            text = text.replace(o, nw)
            lines = text.split('\n')
        new_line = lines[idx]
        # 后置校验
        assert len(lines) == nlines0, 'line count changed'
        assert new_line.count('|') == exp_pipes, '%s:%d pipes=%d expected %d' % (pid, ln, new_line.count('|'), exp_pipes)
        assert (new_line.count('$') % 2) == (old_line.count('$') % 2), '%s:%d dollar parity changed' % (pid, ln)
        assert new_line.count('$') == old_line.count('$'), '%s:%d dollar count changed' % (pid, ln)
        assert mask(new_line).count('\\|') == 0, '%s:%d residual non-code \\|' % (pid, ln)
        assert len(new_line) - len(old_line) == sum(len(nw) - len(o) for (o, nw) in frags)
        assert old_line.count('|') - exp_pipes == nbar, '%s:%d census vbars/sites mismatch' % (pid, ln)
        rows_done += 1
        sites_done += nbar
        log.append('ROW line=%d  sites=%d  pipes %d->%d  $=%d(parity %s)' %
                   (ln, nbar, old_line.count('|'), new_line.count('|'), new_line.count('$'),
                    'even' if new_line.count('$') % 2 == 0 else 'odd'))
        log.append('OLD| ' + old_line)
        log.append('NEW| ' + new_line)
    for (ln, nb, why) in REGISTER.get(pid, []):
        old_line = lines[ln - 1]
        assert mask(old_line).count('\\|') == nb, '%s:%d registered site count mismatch' % (pid, ln)
        log.append('REGISTERED line=%d sites=%d reason=%s' % (ln, nb, why))
        log.append('KEEP| ' + old_line)
    raw2 = text.encode('utf-8')
    assert raw2.count(b'\r') == 0
    assert raw2.split(b'\n').__len__() == nlines0
    log.append('after: bytes=%d (delta %+d) lines=%d rows_fixed=%d sites_fixed=%d sites_registered=%d' %
               (len(raw2), len(raw2) - len(raw), len(lines), rows_done, sites_done,
                sum(nb for (_, nb, _) in REGISTER.get(pid, []))))
    blob = ('\n'.join(log) + '\n').encode('utf-8')
    if dry:
        sys.stdout.buffer.write(blob)
        sys.stdout.buffer.write(b'[DRY] nothing written to the note\n')
    else:
        io.open(p, 'wb').write(raw2)
        with io.open(LOG, 'ab') as fh:
            fh.write(blob)
        sys.stdout.buffer.write(b'[WROTE] note updated\n')
    # 统计宏用量
    for k in ('\\lVert ', '\\lvert ', '\\mid ', '\\upharpoonright', '\\Vert '):
        sys.stdout.buffer.write(('%s file-count %s = %d\n' % (pid, k, text.count(k))).encode('utf-8'))


if __name__ == '__main__':
    main()
