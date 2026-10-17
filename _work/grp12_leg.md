# 腿：`Expected group after '_'／'^'` 族 12 站／10 篇（2026-10-17）

读数：全库拒渲 **166 → 154**（`_work/dollarmath_sites17.jsonl` → `sites18`，第二遍 `sites19` 逐字相同），
本族 **消失 12／新增 0**；`unclosed_spans=0`、dollar 族 49 站不动（无附带损伤）；
`files_hit` 105→98；十篇 `.tools/gate.py` **CLEAN**。量具＝`_work/grp12_face.js`（按报错原文从台账筛族）、
`_work/grp12_probe.js`（修前串逐字取自台账、修法＝同一 body 定点替换后重喂 KaTeX）、
驱动 `_work/grp12_apply.py`（DRY 12／异常 0 才 --apply），盘外复量 `_work/grp12_verify.py`（异常=0）。

## 定性与凭据（三形）

**形一：双打 `^^`／`__`（多敲一枚上／下标定界符），6 处正文**

| 站 | 修前 | 修后 | 素材凭据 |
|---|---|---|---|
| D235:383 | `q(\xi)^^{-\gamma}` | `q(\xi)^{-\gamma}` | `kernel.tex:33  \|\\Gamma(\\xi)\|\\le q(\\xi)^{-\\gamma}` |
| D262:502 | `\mu\{S^^*f>\lambda\}` | `\mu\{S^*f>\lambda\}` | `11-fourier.tex:367  S^*f=\sup_{N\ge0}\|S_Nf\|` |
| D523:178 | `\mathbf C^^r` | `\mathbf C^r` | `08-integral.tex:348  q:U\to\mathbb C^r` |
| D61:983 | `\|U\|\\le(6r/c)^^{3/2}` | `^{3/2}` | `04-base-logic.tex:274  \|U\|\le(6r/c)^{3/2}` |
| D619:184 | `$(p_U)__*$` | `$(p_U)_*$` | `04-lattice.tex:512  (p_U)_*` |
| D772:322 | `$U(v)__1\\otimes…$` | `U(v)_1` | `02-tensors.tex:410  U(v)_1\otimes U(v)_c` |

全库面：`^^` 6 处／4 篇、`__` 5 处／3 篇（`_work/grp12_census2.py`），扣掉下表两处作者登记句与
D85:1134 的 numdam 条目号 `PMIHES_1995__81__73_0`（坐在代码跨度里，本来就是逐字引文），正文即这六处。

**形二：同一枚坏形在文末登记句里是留档引文，2 处**——不改史，只换载体（`$…$` → `` `…` ``，`$` −2／反引号 +2）：

- D61:1048 「一处排字错误申报：第 25 节第三段我写了 `` `(6r/c)^^{3/2}` ``，正确形状是 $(6r/c)^{3/2}$」；
- D772:1050 「丙类，笔误。§5 一处式内双下划线（$U(v)_1$ 打成 `` `U(v)__1` ``…）」。

这条律第三次生效：正文坏形按素材回改，登记句里的坏形逐字保留、发成代码跨度。所以 983／322 两处的
OLD 必须带上下文（`\|\U\|\\le`、`\otimes…$`），否则连引文一起抹平。D262:539 那一处作者当场就写成了
代码跨度，本来不在台账里，零动作。

**形三：宏名误拼 `\mathfrm`，2 处**——两篇作者都在登记节给了正确形，素材凭据齐：

- D204:254 `\kappa_s\bmod\mathfrm_B=\kappa_0` → `\mathfrak m_B`（`frobenius.tex:493  \mathfrak m_B=(s_1,s_2,s_3)`；
  登记节 355 行的引文 `"\mathfrm_B"` 在双引号里、不在式内，逐字不动，所以该篇旧形篇级计数＝1 是对的）；
- D307:112 `$U,I_0,J,\mathfrm_x$` → `\mathfrak m_x`（`constrained-minimum.tex:126  \(U,I_0,J,\m_x\)` ＋
  `preamble.tex:37  \newcommand{\m}{\mathfrak m}`；登记节 334 行的 `` `\mathfrm` `` 已在代码跨度里）。

**形四：`\tfrac` 把下标算子当第二参，1 处（本腿唯一一枚语义修补）**

D137:667 `(m_0+\tfrac a_\sigma? )`。诊断：`a_\sigma` 裸形合法（探针把素材 `preliminaries.tex:99`
`f_\pm(z)=m_0x(z)+a_\pm r(z)` 原句喂进去＝RENDERS），坏在 `\tfrac` 先取紧跟的 `a` 当第一参、
再把 `_` 当第二参的开头，于是报 `Expected group after '_'`。该式的值由素材两行唯一决定：
`:120` 写 `z=x(z)(u+r(z)x(z)^{-1}e_2)`，`:99/:121` 写 `f_\sigma(z)=m_0x(z)+a_\sigma r(z)\le\mu(z)`，
齐性提出 `x(z)` 后那个因子只能是 `r/x`，故 `(m_0+\tfrac{r}{x}a_\sigma? )`；作者那枚表犹豫的 `?` 保留。
字节＋5，`$`／反引号零变动。

**形五：Lean 推前下标 `_#`，1 处**

D260:246 `(x\mapsto cx)_#\mu_\alpha` → `(x\mapsto cx)_\#\mu_\alpha`。素材 `60-general.tex:432` 逐字写作
`_\#`；全库 house 形 `_\#` **261 处／38 篇**（D125/D138/D169/D17/D170/D180…），裸 `_#` 另有 21 处／17 篇，
但那 21 处全在式外（`grep -n "^## "` 之类命令字面、`∠^#_x` 的散文记号），唯一一枚坐在数学跨度里的就是这一站。
KaTeX 三形实测：裸 `_#` ERR、`_\#` OK、`_{\#}` OK——取 house 那一形。

## 复量与残余

- 修后全库 `^^` 只剩 2 处／2 篇（D262:539、D61:1048），`__` 只剩 3 处／2 篇（D772:1050、D85:1134×2），
  四处都在代码跨度内＝逐字引文，零拒渲。
- 下一支候选（按站点数，来自 154 那份直方图）：`Can't use function '$'` 45＋2＝dollar 族 49（已判不动，工单在
  `_work/dollarmath_residual.md`）／`Double subscript` 7＋`Double superscript` 6／`Can't use function '\('` 6
  （pandoc 转义族，墨价在 typst 轴 76 已算）／`Expected 'EOF', got '\right'` 5／
  `\mathbf in text mode` 2＋表格环境 `Expected & or \\ or \cr or \end` 2＋`Expected 'EOF', got '\end'` 1＋
  `Expected 'EOF', got '&'` 1＋`{equation} can be used only in display environment` 1＋
  `Got function '\operatorname@' with no arguments` 1＋`Expected '\right', got 'EOF'` 1＋`Expected 'EOF', got '_'` 1。
