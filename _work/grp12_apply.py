# -*- coding: utf-8 -*-
r"""`Expected group after '_'／'^'` 12 站／10 篇的定点修补驱动。
候选形全部经 `_work/grp12_probe.js` 逐字取自台账验过（修前 ERR／修法 OK）。

三形与凭据：
- 双打 `^^`／`__`（多打一枚定界上标／下标）：D235:383（素材 kernel.tex:33 `q(\\xi)^{-\\gamma}`）、
  D262:502（11-fourier.tex:367 `S^*f`）、D523:178（08-integral.tex:348 `\\mathbb C^r`）、
  D61:983（04-base-logic.tex:274 `(6r/c)^{3/2}`）、D619:184（04-lattice.tex:512 `(p_U)_*`）、
  D772:322（02-tensors.tex:410 `U(v)_1`）。删一枚字符，字母与 `$` 一个不动。
- 作者登记句那一枚（同一坏形在文末「排字错误申报／丙类，笔误」里是**留档引文**）：
  D61:1048、D772:1050 不改史，把 `$…$` 换成代码跨度 `` `…` ``（`$` −2／反引号 +2）。
  所以 983／322 两处的 OLD 都带上下文，不连引文一起抹平。
- `\\mathfrm` 误拼（D204:254、D307:112）：两篇作者都在登记节给出正确形，素材凭据
  `frobenius.tex:493  \\mathfrak m_B=(s_1,s_2,s_3)`、`constrained-minimum.tex:126  (U,I_0,J,\\m_x)`
  ＋ `preamble.tex:37  \\newcommand{\\m}{\\mathfrak m}`。D204 的 OLD 取整式，避开 355 行引文；
  D307 的 OLD 带 `$` 定界，避开 334 行代码跨度里的 `` `\\mathfrm` ``。
- D137:667 `\\tfrac a_\\sigma?`：`\\tfrac` 把紧跟的 `a` 当第一参、再把 `_` 当第二参的开头，
  所以断在 `_` 上（`a_\\sigma` 裸形本身合法，探针已证）。素材 `preliminaries.tex:99  f_\\pm(z)=m_0x(z)+a_\\pm r(z)`
  与 `:120` 的 `z=x(z)(u+r(z)x(z)^{-1}e_2)` 唯一决定该因子是 `\\tfrac{r}{x}`，作者的 `?` 保留。
- D260:246 `(x\\mapsto cx)_#`：Lean 的推前下标，素材 `60-general.tex:432` 逐字写作 `(x\\mapsto cx)_\\#`，
  全库 house 形 `_'#` 261 处／38 篇（`_#` 裸写在正文外另有 21 处，全库唯一一枚落在式内即此站）。
"""
import glob
import io
import os
import subprocess
import sys

PAIRS = [
    ('D137', r'(m_0+\tfrac a_\sigma? )', r'(m_0+\tfrac{r}{x}a_\sigma? )', 1, 0, 0),
    ('D204', r'\kappa_s\bmod\mathfrm_B=\kappa_0', r'\kappa_s\bmod\mathfrak m_B=\kappa_0', 1, 0, 0),
    ('D235', r'q(\xi)^^{-\gamma}', r'q(\xi)^{-\gamma}', 1, 0, 0),
    ('D260', r'(x\mapsto cx)_#\mu_\alpha', r'(x\mapsto cx)_\#\mu_\alpha', 1, 0, 0),
    ('D262', r'\mu\{S^^*f>\lambda\}', r'\mu\{S^*f>\lambda\}', 1, 0, 0),
    ('D307', r'$U,I_0,J,\mathfrm_x$', r'$U,I_0,J,\mathfrak m_x$', 1, 0, 0),
    ('D523', r'\mathbf C^^r', r'\mathbf C^r', 1, 0, 0),
    ('D61', r'|U|\le(6r/c)^^{3/2}', r'|U|\le(6r/c)^{3/2}', 1, 0, 0),
    ('D61', r'$(6r/c)^^{3/2}$', r'`(6r/c)^^{3/2}`', 1, -2, 2),
    ('D619', r'$(p_U)__*$', r'$(p_U)_*$', 1, 0, 0),
    ('D772', r'$U(v)__1\otimes U(v)_c$', r'$U(v)_1\otimes U(v)_c$', 1, 0, 0),
    ('D772', r'$U(v)__1$', r'`U(v)__1`', 1, -2, 2),
]

APPLY = '--apply' in sys.argv
bad = 0
sim = {}
for cid, old, new, expect, dd, dt in PAIRS:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    if cid not in sim:
        sim[cid] = io.open(f, encoding='utf-8').read()
    here = sim[cid].count(old)
    sim[cid] = sim[cid].replace(old, new)
    cmd = [sys.executable, os.path.join(u'_work', u'c_note_fix.py'), cid,
           u'--old', old, u'--new', new, u'--dollars', str(dd), u'--ticks', str(dt)]
    if APPLY:
        cmd.append(u'--apply')
    r = subprocess.run(cmd, capture_output=True, text=True, encoding='utf-8')
    out = ((r.stdout or u'') + (r.stderr or u'')).rstrip()
    tail = out.split(u'\n')[-2:]
    flag = u'' if here == expect else u'  <== 预数不符'
    print(u'%s 预数=%d 期望=%d $=%+d 反引号=%+d  %s%s' % (
        cid, here, expect, dd, dt, u' / '.join(tail), flag))
    if r.returncode != 0 or u'零命中' in out or here != expect:
        bad += 1
print(u'%s 单数=%d 覆盖站=%d 异常=%d' % (
    u'APPLY' if APPLY else u'DRY', len(PAIRS), sum(p[3] for p in PAIRS), bad))
