# -*- coding: utf-8 -*-
r"""`Double subscript／superscript` 13 站的修法规格（单一来源）。
`python _work/dbl_fix.py` 落 `_work/dbl_fix.json`，
`node _work/fix_probe.js _work/dbl_fix.json <sites台账>` 验真，
`python _work/fix_apply.py _work/dbl_fix.json [--apply]` 执行。
每单＝(cid, 行, old, new, 期望命中, $ 差, 反引号差, 素材凭据)。

- D155 两站同串（497、501），一单覆盖两站：同句自己写「范数界为 $1$」，
  Lean `l2ToL1` 带 `mkContinuous 1`，Hölder 在概率空间上就是 $\lVert f\rVert_1\le\lVert f\rVert_2$，
  多打的那枚下标是重复。
- D274 `main.tex:198  \norm{E_{g_j}}_2\longrightarrow0`（笔记把 `\norm` 的第一参写成裸 `E_{g_j}` 再接 `_2`）。
- D296 `introduction.tex:98` 是 `\beff(J,\bc(J))`，笔记的压缩形 `\beta_{\mathrm{eff}}_c` 把两枚下标并成一枚：
  取并入同组 `\beta_{\mathrm{eff},c}`（字母零增减），不取展开成 `(J,\beta_{\mathrm c})`（那是重写作者的记号）。
- D36 `main.tex:473  1<\lambda<A^{1/10}`；「从左逼近」的 `^-` 并进指数＝`A^{1/10-}`。
- D370 `packets.tex:40-41  if $M'_\ell=c_\ell M_\ell$ ... $(RM)_\ell/M_\ell$ with $(RM')_\ell/M'_\ell$`——素材的
  `\ell` 不带撇，笔记多打一枚。
- D486 `fixed-space.tex:273  \det B[1,\ldots,t_a\mid j_1,\ldots,j_{t_a}]`。
- D489 `deformation.tex:296  =\E_p[X_t^D(u)s_t^{D\setminus A}(v)]`——笔记在组后又挂了一枚 `^D`。
- D493 `06-cycles.tex:428  \kappa(F,J_F+M_i^*|_F)>0`。这一站在**表格格内**，裸竖线会切列，
  所以按全库 house 形 `\rvert_`（908 处／96 篇）发，字节增而 `|` 不增。
- D555 两站同一机制（尾撇多打），凭据 `02-pure-inputs.tex:214/225` 的 `J_s,J'_s`、
  `03-transfer.tex:292-295` 的「两份独立副本 $\sigma,\sigma'$：`Q_s=s^{-7/4}\sum_x\sigma_x\sigma_x'`」。
- D570 `stage.tex:107  a_v=s_1d_v and b_v=s_vd_1`——笔记多插一枚 `k`，本篇同栏的 `a_v`、`\tau_v` 都逐字合素材。
- D94 `07-parity.tex:24-26` 给 `\psi_0=|+\rangle_I^{\otimes n}\otimes|0\rangle^{\otimes a}\otimes|0\rangle_R^{\otimes n}`，
  且本篇下一句的平行形自己写 `|0\rangle_R^{n}`：`|0\rangle^n^n` 的尾指数位是丢了 `_R`。
"""
import io
import json

FIXES = [
    (u'D155', 497, r'\lVert f\rVert_1_1\le\lVert f\rVert_1_2',
     r'\lVert f\rVert_1\le\lVert f\rVert_2', 2, 0, 0,
     u'Hölder；两站同串'),
    (u'D274', 43, r'\norm E_{g_j}_2\to0', r'\norm{E_{g_j}}_2\to0', 1, 0, 0,
     u'main.tex:198'),
    (u'D296', 111, r'\beta_{\mathrm{eff}}_c', r'\beta_{\mathrm{eff},c}', 1, 0, 0,
     u'introduction.tex:98'),
    (u'D36', 553, r'\lambda\to A^{1/10}^-', r'\lambda\to A^{1/10-}', 1, 0, 0,
     u'main.tex:473'),
    (u'D370', 39, r"(RM')_\ell/M'_\ell'", r"(RM')_\ell/M'_\ell", 1, 0, 0,
     r"packets.tex:41  (RM')_\ell/M'_\ell"),
    (u'D486', 102, r'\det B[1..t_a\mid j_1..j_t_a]', r'\det B[1..t_a\mid j_1..j_{t_a}]', 1, 0, 0,
     u'fixed-space.tex:273'),
    (u'D489', 129, r'X_t^D(u)s_t^{D\setminus A}^D(v)', r'X_t^D(u)s_t^{D\setminus A}(v)', 1, 0, 0,
     u'deformation.tex:296'),
    (u'D493', 278, r'J_F+M_i^*_F', r'J_F+M_i^*\rvert_F', 1, 0, 0,
     u'06-cycles.tex:428；表格格内 house 形 \\rvert'),
    (u'D555', 306, r"\sum_{J'_s'}\sigma", r"\sum_{J'_s}\sigma", 1, 0, 0,
     u"02-pure-inputs.tex:225  \\sum_{J'_s}"),
    (u'D555', 317, r"\sigma_x\sigma'_x'", r"\sigma_x\sigma'_x", 1, 0, 0,
     u"03-transfer.tex:292-295"),
    (u'D570', 147, r'b_v=s_kv_d_1', r'b_v=s_vd_1', 1, 0, 0, u'stage.tex:107'),
    (u'D94', 227, r'\psi_0=|+\rangle^n|0\rangle^a|0\rangle^n^n',
     r'\psi_0=|+\rangle^n|0\rangle^a|0\rangle_R^n', 1, 0, 0, u'07-parity.tex:24-26'),
]

out = [{u'cid': c, u'line': ln, u'old': o, u'new': n, u'expect': e,
        u'dollars': dd, u'ticks': dt, u'cred': cr}
       for (c, ln, o, n, e, dd, dt, cr) in FIXES]
json.dump(out, io.open(u'_work/dbl_fix.json', u'w', encoding=u'utf-8'),
          ensure_ascii=False, indent=1)
print(u'%d 单 -> _work/dbl_fix.json' % len(out))
