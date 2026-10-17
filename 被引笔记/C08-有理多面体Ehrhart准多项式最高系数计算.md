# C08 有理多面体Ehrhart准多项式最高系数计算（arXiv:1011.1602）

## 0 取证边界

- arXiv id：1011.1602。
- 原题名（逐字）：Computation of the highest coefficients of weighted Ehrhart quasi-polynomials of rational polyhedra。
- 作者（原文署名逐字，`top-ehrhart.tex:107-127`）：Velleda Baldoni, Nicole Berline, Jesús A. De Loera, Matthias Köppe, Michèle Vergne。
- 发表年月：2010-11-07（源文件顶栏 `$Id: top-ehrhart.tex 242 2010-11-07 01:57:32Z mkoeppe $`，`top-ehrhart.tex:2`）。
- 素材目录：`E:\math\被引素材\1011.1602`。主 tex 清单：`被引素材/1011.1602/top-ehrhart.tex`，盘面实测 100240 字节 / 2141 行（末行无 `\n`，`wc -l` 报 2140）；同目录另有 `top-ehrhart.bbl`、四个 `*.pstex_t`/`*.pdf_t` 图形桩件、`projected-lattice.*` 与 `triangle528.*` 两个位图，按规格第 2 条不作内容来源。
- 本语料引用它的稿号与 bib key：D318（`BaldoniBerlineDeLoeraKoeppeVergne2012`）、D385（`BaldoniBerlineDeLoeraKoeppeVergne2012`）、D447（`BaldoniBerlineDeLoeraKoeppeVergne2012`）、D451（`BaldoniBerlineDeLoeraKoeppeVergne2012`）、D471（`BaldoniBerlineDeLoeraKoeppeVergne2012`）。写手不读这些稿。
- 取材薄读之处（`top-ehrhart.tex`）：`1-400`（preamble 自定义命令、摘要、引言、记法起始）、`401-800`（生成函数赋值、Brion 定理、单纯锥基本平行体与短式、加权 Ehrhart 定义与例子三角形、分次结构、格多面体的最高系数命题）、`801-1200`（中间生成函数、拼贴函数定义与等价条件、锥上的分片积分乘积公式、近似定理与其证明、例子）、`1200-1600`（Möbius 显式拼贴函数、Bernoulli 母函数 $T$、短式定理及其证明、3 维示例）、`1600-2000`（定理 7.8 与 7.9、截断乘积引理、证明主体、5 维单纯形示例、Barvinok 风格推论）、`2000-2140`（推论的完整输入输出、实验表与结论、致谢）。
- preamble 自定义宏（`top-ehrhart.tex:29-97`）中，本稿一律改写为 KaTeX 认得的形态：`\la/\ra` 写作 `\langle/\rangle`，`\charfun{}` 写作指示函数 $\chi_{\{\cdot\}}$，`\lattice` 写作 $\Lambda$，`\e` 写作 $\mathrm{e}$，`\CV/\CM/\CH/\CL/\CS/\CF/\CC/\CA/\CB/\CE/\CJ/\CL/\CM/\CP/\CS/\CV` 写作 `\mathcal V/\mathcal M/\mathcal H/\mathcal L/\mathcal S/\mathcal F/\mathcal C/\mathcal A/\mathcal B/\mathcal E/\mathcal J/\mathcal L/\mathcal M/\mathcal P/\mathcal S/\mathcal V`，`\b` 写作 `\mathfrak b`，`\a` 写作 `\mathfrak a`，`\t` 写作 `\mathfrak t`，`\p` 写作 `\mathfrak p`，`\q` 写作 `\mathfrak q`，`\Jposet{d}{d_0}` 写作 $\mathcal J^{d}_{\geq d_0}$，`\Moebius` 写作 "Möbius"，`\co` 写作 $k_0$，`\ellpert` 写作 $\ell'$，`\vol/\card/\lin/\cone/\Res/\Sum/\apex/\relvol/\Vertex/\codim/\proj` 写作 `\operatorname{}` 形态。

## 1 加权 Ehrhart 准多项式与问题陈述

原文引言在 `top-ehrhart.tex:159-343` 里把问题摊开：给定 $V$ 上一个有理凸多面体 $\mathfrak p \subset \R^d$ 与一个权函数 $h(x)$（多项式，次数记为 $M = \deg h$），计算格点加权和
$$S(\mathfrak p, h) = \sum_{x \in \mathfrak p \cap \Z^d} h(x).$$
把 $\mathfrak p$ 按整因子 $n \in \N$ 膨胀后得到 $n\mathfrak p$，函数 $S(n\mathfrak p, h)$ 关于 $n$ 是准多项式：`top-ehrhart.tex:186-187`
$$S(n\mathfrak p, h) = \sum_{x \in n\mathfrak p \cap \Z^d} h(x) = \sum_{m=0}^{d+M} E_m(n \bmod q)\, n^m,$$
最高次到 $d + M$，系数 $E_m$ 是 $n$ 的周期函数，周期 $q$ 是使 $q\mathfrak p$ 成为格多面体的最小正整数。`top-ehrhart.tex:558-566` 里 Definition 5.1 把这层意义正式钉死：设 $q$ 如上，$E(\mathfrak p, h; n)$ 与系数 $E_m(\mathfrak p, h; n \bmod q)$ 由
$$E(\mathfrak p, h; n) = \sum_{x \in n\mathfrak p \cap \mathbf{\Lambda}} h(x) = \sum_{m=0}^{d+M} E_m(\mathfrak p, h; n \bmod q)\, n^m$$
定义。若 $h$ 是 $M$ 次齐次，最高次系数 $E_{d+M}$ 恰等于连续积分 $\int_{\mathfrak p} h(x)\, \mathrm{d}x$，这在 `top-ehrhart.tex:199-207` 与 `top-ehrhart.tex:567-573` 两处均被点名，且引用 Baldoni-Berline-De Loera-Köppe-Vergne 前作作为积分算法。

原文明确指出：所有 $E_m$ 一起算是 NP-困难，能指望的是"高位近似"。`top-ehrhart.tex:214-216` 立论：固定 $k_0$，目标是算最高 $k_0 + 1$ 个系数 $E_m(\mathfrak p, \xi, M; n \bmod q)$，$m = M + d, \dots, M + d - k_0$（`top-ehrhart.tex:663-666`）。

原文把权函数归约到线性型的幂：`top-ehrhart.tex:575-597` 声明不失一般性地取 $h(x) = \frac{\langle \xi, x \rangle^M}{M!}$，因任意多项式都可通过多项式时间线性组合成线性型的幂（引用 Baldoni-Berline-De Loera-Köppe-Vergne 积分篇）。Definition 5.3（`top-ehrhart.tex:590-597`）由此定 $E(\mathfrak p, \xi, M; n)$ 与 $E_m(\mathfrak p, \xi, M; n \bmod q)$：
$$E(\mathfrak p, \xi, M; n) = \sum_{x \in n\mathfrak p \cap \Lambda} \frac{\langle \xi, x \rangle^M}{M!} = \sum_{m=0}^{M+d} E_m(\mathfrak p, \xi, M; n \bmod q)\, n^m.$$

`top-ehrhart.tex:601-612` 引入模分解记号：$q \in \N$, $n \in \R$ 时 $\lfloor n \rfloor_q := q \lfloor \frac{1}{q} n \rfloor \in q\Z$ 与 $\{n\}_q := (n \bmod q) \in [0, q)$，故 $n = \lfloor n \rfloor_q + \{n\}_q$；$\lfloor n \rfloor = \lfloor n \rfloor_1$、$\{n\} = \{n\}_1$、$\lceil n \rceil = -\lfloor -n \rfloor$。这套记号贯穿后文所有"阶跃多项式"（step polynomial）表述。

`top-ehrhart.tex:615-657` 给出一个可验证的实例：$\mathfrak t$ 是顶点 $(0, 0)$、$(\frac{5}{28}, 0)$、$(\frac{5}{28}, \frac{5}{14})$ 的有理三角形，$q = 28$。取 $\xi = x + y$，$M = 0$ 时
$$E(\mathfrak t, \xi, 0; n) = \frac{25}{784} n^2 + \left( -\frac{5}{392} \{5n\}_{28} + \frac{5}{14} \right) n + \left( 1 + \frac{1}{784} \{5n\}_{28}^2 - \frac{1}{14} \{5n\}_{28} \right),$$
$n = 1$ 代回得 1，$n = 6$ 代回得 4，与图上膨胀 $6\mathfrak t$ 的格点数吻合。$M = 1$ 时最高次项 $\frac{125}{16464} n^3$，一次项系数含 $\{5n\}_{28}^2$。这段是本稿后面读定理 7.9 输出形态时的锚点样例。

引言对既有文献的梳理浓缩在 `top-ehrhart.tex:214-240`：Barvinok 1994 给出格多面体的多项式时间算法，靠 Morelli 恒等式与"面体积神谕"算最高 $k_0$ 个系数；Barvinok 2006 把 $k$ 个最高系数与"由余维小于 $k$ 的仿射格子空间截多面体的截面体积"关联，得到有理单纯形的多项式时间算法，但仅通过插值给出 $E_m(n \bmod q)$ 的数，无闭式与生成函数形式。`top-ehrhart.tex:238-239` 明确记 Barvinok 原文 8.2 节把"闭式高效计算"作为问题提出。本文的推进就是把这层缺口的生成函数版本补上，并同时给阶跃多项式闭式（`top-ehrhart.tex:292-299`）。

## 2 生成函数、赋值与 Brion 分解

原文在 `top-ehrhart.tex:382-466` 建立函数空间与两个基本赋值。Definition 4.1（`top-ehrhart.tex:383-390`）记 $\mathcal H(V^*)$ 为 $0 \in V^*$ 附近的解析函数环，$\mathcal M(V^*)$ 为亚纯函数环，$\mathcal M_{\ell}(V^*) \subset \mathcal M(V^*)$ 是"解析函数除以线性型乘积"这一子环。`top-ehrhart.tex:399-407` 把"赋值"（valuation）定义成：从多面体集到向量空间 $M$ 的映射 $F$，只要指示函数满足 $\sum_i r_i \chi_{\mathfrak p_i} = 0$ 就有 $\sum_i r_i F(\mathfrak p_i) = 0$。

Proposition 4.2（`top-ehrhart.tex:408-428`）给出唯一的连续生成函数赋值 $I(\cdot, \Lambda)$，落在 $\mathcal M_{\ell}(V^*)$：（i）$\mathfrak p$ 不满维或含直线时 $I(\mathfrak p, \Lambda) = 0$；（ii）当 $\mathrm{e}^{\langle \xi, x \rangle}$ 在 $\mathfrak p$ 上可积时 $I(\mathfrak p, \Lambda)(\xi) = \int_{\mathfrak p} \mathrm{e}^{\langle \xi, x \rangle} \mathrm{d}m_{\Lambda}(x)$；（iii）$s \in V_{\Q}$ 时 $I(s + \mathfrak p, \Lambda)(\xi) = \mathrm{e}^{\langle \xi, s \rangle} I(\mathfrak p, \Lambda)(\xi)$。

Proposition 4.3（`top-ehrhart.tex:430-449`）给离散生成函数 $S(\mathfrak p, \Lambda)$，性质对称：（i）含直线时 $S = 0$；（ii）求和式 $S(\mathfrak p, \Lambda)(\xi) = \sum_{x \in \mathfrak p \cap \Lambda} \mathrm{e}^{\langle \xi, x \rangle}$；（iii）$s \in \Lambda$ 时 $S(s + \mathfrak p, \Lambda)(\xi) = \mathrm{e}^{\langle \xi, s \rangle} S(\mathfrak p, \Lambda)(\xi)$。

Theorem 4.4（`top-ehrhart.tex:459-465`）是 Brion 分解，$\mathfrak p$ 顶点集记 $\mathcal V(\mathfrak p)$，$s$ 处的可行方向锥记 $\mathfrak c_s$（原文用 `\c`，本稿写作 $\mathfrak c$）：
$$S(\mathfrak p, \Lambda) = \sum_{s \in \mathcal V(\mathfrak p)} S(s + \mathfrak c_s, \Lambda).$$
这是把整体问题化归到局部锥的枢纽，也是本文复杂度只对顶点数敏感的关键。

`top-ehrhart.tex:467-543` 建立单纯锥上的显式短式。设 $v_i \in \Lambda$, $i = 1, \dots, d$ 线性无关整向量，$\mathfrak c = \sum_{i=1}^d \R_+ v_i$。Definition 4.5（`top-ehrhart.tex:474-480`）给出基本平行体 $\mathfrak b = \sum_{i=1}^d [0, 1) v_i$，边界取半开。Lemma 4.6（`top-ehrhart.tex:482-492`）给出
$$I(s + \mathfrak c, \Lambda)(\xi) = \mathrm{e}^{\langle \xi, s \rangle} \frac{(-1)^d \operatorname{vol}_{\Lambda}(\mathfrak b)}{\prod_{i=1}^d \langle \xi, v_i \rangle},$$
在 $\R^d / \Z^d$ 情形退化成 $|\det(v_1, \dots, v_d)|$（`top-ehrhart.tex:494-497`）。Lemma 4.7（`top-ehrhart.tex:499-517`）三件事：（i）$(s + \mathfrak c) \cap \Lambda$ 是平移平行体 $s + \mathfrak b + v$（$v \in \sum_j \N v_j$）的不交并；（ii）格点集是 $x + \sum_i \N v_i$（$x$ 跑 $(s + \mathfrak b) \cap \Lambda$）的不交并；（iii）$\operatorname{card}((s + \mathfrak b) \cap \Lambda) = \operatorname{vol}_{\Lambda}(\mathfrak b)$。

Lemma 4.8（`top-ehrhart.tex:526-530`）把上面合成短式
$$S(s + \mathfrak c, \Lambda)(\xi) = S(s + \mathfrak b, \Lambda)(\xi) \frac{1}{\prod_{j=1}^d (1 - \mathrm{e}^{\langle \xi, v_j \rangle})},$$
其中 $S(s + \mathfrak b, \Lambda)(\xi) = \sum_{x \in (s + \mathfrak b) \cap \Lambda} \mathrm{e}^{\langle \xi, x \rangle}$ 是"盒子里格点"的有限和。Example 4.9（`top-ehrhart.tex:533-543`）在一维情形 $V = \R, \Lambda = \Z, \mathfrak c = \R_+$ 校验：$s + \mathfrak b$ 中唯一格点是 $s + \{-s\}$，因此 $I(s + \mathfrak c, \Z)(\xi) = \mathrm{e}^{\xi s} \cdot (-1) / \xi$，$S(s + \mathfrak c, \Z)(\xi) = \mathrm{e}^{\xi(s + \{-s\})} / (1 - \mathrm{e}^{\xi})$。这条一维式是后文所有"$\lceil \cdot \rceil$ 型"与"$\{ \cdot \}$ 型"写法的最小原型。

## 3 分次结构与高位系数的读取

`top-ehrhart.tex:668-712` 引入 $\mathcal M_{\ell}$ 上的分次：任一 $\phi(\xi) \in \mathcal M_{\ell}(V^*)$ 唯一展开为齐次有理函数之和 $\phi(\xi) = \sum_{m \geq m_0} \phi_{[m]}(\xi)$。齐次度的规则：分子 $P$ 是 $V^*$ 上 $p$ 次齐次多项式，分母 $D$ 是 $r$ 个线性型的乘积，则 $P / D$ 齐次度 $m = p - r$；$\xi_1 / \xi_2$ 是 0 度。原文强调"非负度项"未必解析（`top-ehrhart.tex:680-682`）。

把分次套到 $S(s + \mathfrak c, \Lambda)$ 上：Lemma 5.7（`top-ehrhart.tex:691-710`）
$$S(s + \mathfrak c, \Lambda)(\xi) = S(s + \mathfrak c, \Lambda)_{[-d]}(\xi) + S(s + \mathfrak c, \Lambda)_{[-d+1]}(\xi) + \cdots,$$
最低度项 $S(s + \mathfrak c, \Lambda)_{[-d]}(\xi) = I(\mathfrak c, \Lambda)(\xi)$，即无平移的锥的积分。证明靠 Todd 型因子分解（`top-ehrhart.tex:701-704`）
$$\prod_{j=1}^d \frac{1}{1 - \mathrm{e}^{\langle \xi, v_j \rangle}} = \prod_{j=1}^d \frac{\langle \xi, v_j \rangle}{1 - \mathrm{e}^{\langle \xi, v_j \rangle}} \cdot \frac{1}{\prod_{j=1}^d \langle \xi, v_j \rangle},$$
$x / (1 - \mathrm{e}^x)$ 在 $x = 0$ 解析、值 $-1$；盒子生成函数在 $\xi = 0$ 取值 $\operatorname{vol}_{\Lambda}(\mathfrak b)$。

Proposition 5.8（`top-ehrhart.tex:727-792`）是格多面体情形（顶点全在格上）的关键读取式：$k \geq 0$ 时
$$E_{M+d-k}(\mathfrak p, \xi, M) = \sum_{s \in \mathcal V(\mathfrak p)} \frac{\langle \xi, s \rangle^{M+d-k}}{(M+d-k)!} S(\mathfrak c_s)_{[-d+k]}(\xi),$$
最高系数 $E_{M+d}(\mathfrak p, \xi, M) = \int_{\mathfrak p} \frac{\langle \xi, x \rangle^M}{M!} \mathrm{d}x$。证明链条从 Brion 起步（`top-ehrhart.tex:742-792`）：先把 $\mathfrak p$ 换成 $n\mathfrak p$ 得 $\sum_{x \in n\mathfrak p \cap \Lambda} \mathrm{e}^{\langle \xi, x \rangle} = \sum_s \mathrm{e}^{n \langle \xi, s \rangle} S(\mathfrak c_s)(\xi)$；再把 $\xi$ 换成 $t \xi$ 抽出 $t^M$ 项，$\mathfrak c_s$ 的齐次展开让 $t^{-d} I(\mathfrak c_s)(\xi) + t^{-d+1} S(\mathfrak c_s)_{[-d+1]}(\xi) + \cdots$ 与 $\mathrm{e}^{n t \langle \xi, s \rangle}$ 相乘，$t^M$ 系数即 $\sum_{k=0}^{M+d} (nt)^{M+d-k} t^{-d+k} \frac{\langle \xi, s \rangle^{M+d-k}}{(M+d-k)!} S(\mathfrak c_s)_{[-d+k]}(\xi)$。$n^{M+d-k}$ 前面的因子就是 $E_{M+d-k}$。

Remark 5.9（`top-ehrhart.tex:736-741`）指出 $E_m(\mathfrak p, \xi, M)$ 作为 $\xi$ 的多项式是 $M$ 次齐次的，但按上式右边展开成有理函数后极点互相抵消。

`top-ehrhart.tex:793-801` 抽出方法论后果：要算 $k_0 + 1$ 个最高次加权 Ehrhart 系数，只需锥生成函数 $S(\mathfrak c_s)(\xi)$ 的 $k_0 + 1$ 个最低次齐次项；对一般有理多面体，还要把"顶点是格点"这一简化通过 $\lfloor n \rfloor_{q_s}$ 与 $\{n\}_{q_s}$ 的分解补回来（这条正是 6.10 与 7.8 的骨架）。

## 4 中间生成函数与拼贴函数

`top-ehrhart.tex:803-859` 引入中间生成函数以在 $I$ 与 $S$ 之间插值。$L \subseteq V$ 是有理子空间，$V / L$ 上的投影格记 $\Lambda_{V / L}$。Proposition 5.10（`top-ehrhart.tex:817-838`）给出唯一赋值 $S^L(\cdot, \Lambda)$：（i）含直线时 $S^L = 0$；（ii）在收敛域上
$$S^L(\mathfrak p, \Lambda)(\xi) = \sum_{x \in \Lambda_{V / L}} \int_{\mathfrak p \cap (x + L)} \mathrm{e}^{\langle \xi, y \rangle} \mathrm{d}y;$$
（iii）$s \in \Lambda$ 时 $S^L(s + \mathfrak p, \Lambda)(\xi) = \mathrm{e}^{\langle \xi, s \rangle} S^L(\mathfrak p, \Lambda)(\xi)$。$L = \{0\}$ 回收 $S$，$L = V$ 回收 $I$；紧 $\mathfrak p$ 时 $S^L$ 在 $\xi = 0$ 正则，其值等于 Barvinok 2006 里的 $\Q$-值赋值 $E_{L^{\perp}}(\mathfrak p)$。Remark 5.11（`top-ehrhart.tex:852-858`）指出 $S^L(\mathfrak p, \Lambda)$ 实际落在 $\mathcal M_{\ell}(V^*)$，且能分解为若干锥上的 $S$ 与 $I$ 之组合，完整讨论留给后续"paper 2"。

`top-ehrhart.tex:886-983` 定义拼贴函数。$I \subseteq \{1, \dots, d\}$，$L_I$ 为 $\{v_i\}_{i \in I}$ 的线性张成，$L_I^{\perp} \subseteq V^*$ 其正交；$I^c$ 补集。$\mathcal J^d_{\geq d_0}$ 是 $\{1, \dots, d\}$ 中基数不小于 $d_0$ 的子集族。Definition 6.1（`top-ehrhart.tex:893-901`）说 $\lambda: \mathcal J^d_{\geq d_0} \to \Z$ 是拼贴函数当且仅当
$$\chi_{\left\{ \bigcup_{I \in \mathcal J^d_{\geq d_0}} L_I^{\perp} \right\}} = \sum_{I \in \mathcal J^d_{\geq d_0}} \lambda(I) \chi_{\{L_I^{\perp}\}}.$$
Remark 6.2（`top-ehrhart.tex:903-913`）说明 $\{L_I^{\perp}\}_{|I| \geq d_0}$ 对交封闭，$\lambda(I)$ 的角色等同 Barvinok 原文第 7 节里沿着这个 poset 走出来的 Möbius 函数 $\mu(L)$。

Lemma 6.3（`top-ehrhart.tex:918-983`）把"是拼贴函数"翻成四种等价表述，本稿只摘最要紧的两条：（ii）$\sum_{I \in \mathcal J^d_{\geq d_0}, I \subseteq I_0} \lambda(I) = 1$ 对每个 $I_0$ 成立；（iii）对任意常数为 1 的形式幂级数 $F_i(z_i) \in \C[[z]]$
$$\prod_{1 \leq i \leq d} F_i(z_i) \equiv \sum_{I \in \mathcal J^d_{\geq d_0}} \lambda(I) \prod_{i \in I^c} F_i(z_i) \quad \text{mod terms of } z\text{-degree} \geq d - d_0 + 1.$$
证明要点（`top-ehrhart.tex:944-983`）：(i) 与 (ii) 通过"给定 $I_0$，$\xi \in L_{I_0}^{\perp}$ 只在 $I \subseteq I_0$ 时才同时属于 $L_I^{\perp}$"直接等价；(ii) 蕴含 (iii) 靠 $F_i = 1 + z_i g_i$ 展开并按 $K_0 = \{k_i \neq 0\}$ 归组，条件 (ii) 保证截断的每个单变量系数前 $\sum_{K \subseteq K_0, K \subseteq I^c} \lambda(I)$ 都是 1；(iv) 是 (iii) 的特殊化，反向由 $(z_1 + \cdots + z_d)^{d - d_0}$ 展开读出。

## 5 分片乘积分解、近似定理与 Möbius 显式

`top-ehrhart.tex:985-1068` 先把 $S^{L_I}(s + \mathfrak c, \Lambda)$ 拆成 $S$ 与 $I$ 的乘积。记 $V = L_I \oplus L_{I^c}$，$x = x_I + x_{I^c}$，把 $V / L_I$ 认同 $L_{I^c}$，$\Lambda_{I^c} \subset L_{I^c}$ 为投影格；$\mathfrak c_I$ 由 $\{v_j\}_{j \in I}$ 张成，$\mathfrak b_I$ 是其半开基本平行体。Example 6.4（`top-ehrhart.tex:1003-1012`）警示 $L_{I^c} \cap \Lambda$ 到 $\Lambda_{I^c}$ 是严格包含：$v_1 = (1, 0), v_2 = (1, 2), I = \{2\}$ 时 $\Lambda_{\{1\}} = \Z \cdot \frac{v_1}{2}$，图 `projected-lattice.pstex_t` 只作几何示意。

Proposition 6.5（`top-ehrhart.tex:1036-1068`，标签 `petite-somme`）：
$$S^{L_I}(s + \mathfrak c, \Lambda)(\xi) = S(s_{I^c} + \mathfrak c_{I^c}, \Lambda_{I^c})(\xi) \cdot I(s_I + \mathfrak c_I, L_I \cap \Lambda)(\xi).$$
证明沿"切片 $x_{I^c} + s_I + \mathfrak c_I$ 上的积分只依赖 $x_{I^c}$ 的因子是 $\mathrm{e}^{\langle \xi, x_{I^c} \rangle}$"，其他因子 $\mathrm{e}^{\langle \xi, s_I \rangle} \operatorname{vol}_{L_I \cap \Lambda}(\mathfrak b_I) (-1)^{|I|} \prod_{j \in I} \frac{1}{\langle \xi, v_j \rangle}$ 提出来正好等于 $I(s_I + \mathfrak c_I, L_I \cap \Lambda)(\xi)$。

现在把 $\mathfrak c$ 与顶点 $s$ 都放到 $\Q$ 情形。原文在 `top-ehrhart.tex:1074-1160` 陈述并证明近似定理。Theorem 6.6（`top-ehrhart.tex:1074-1085`，标签 `approx-generating-function`）设 $\mathfrak c \subset V$ 有理单纯锥、棱生元 $v_1, \dots, v_d$，$s \in V_{\Q}$，$\lambda: \mathcal J^d_{\geq d_0} \to \Z$ 是拼贴函数，$L_I$ 为 $\{v_i\}_{i \in I}$ 张成，则
$$S(s + \mathfrak c, \Lambda)(\xi) \equiv A^{\lambda}(s + \mathfrak c, \Lambda)(\xi) := \sum_{I \in \mathcal J^d_{\geq d_0}} \lambda(I) S^{L_I}(s + \mathfrak c, \Lambda)(\xi) \quad \text{mod terms of } \xi\text{-degree} \geq -d_0 + 1.$$
右边 $A^{\lambda}$ 称为"拼贴生成函数"。

证明思路（`top-ehrhart.tex:1089-1160`）把 Lemma 6.3(iii) 用在解析函数族 $F_i(z_i) = \mathrm{e}^{(a_i - s_i) z_i} \cdot \frac{-z_i}{1 - \mathrm{e}^{z_i}}$ 上，代入 $z_i = \langle \xi, v_i \rangle$。先用 $\mathrm{e}^{\langle \xi, s \rangle}$ 乘两侧、再乘 $\prod_{i=1}^d (-\langle \xi, v_i \rangle)^{-1}$（齐次度 $-d$，不改变截断等级），得到式 (32)（`top-ehrhart.tex:1108-1115`）：左边退化为 $\mathrm{e}^{\langle \xi, a \rangle} \prod_i (1 - \mathrm{e}^{\langle \xi, v_i \rangle})^{-1}$，右边是 $\lambda(I)$ 加权的 $\mathrm{e}^{\langle \xi, a_{I^c} \rangle} \prod_{i \in I^c} (1 - \mathrm{e}^{\langle \xi, v_i \rangle})^{-1} \cdot \mathrm{e}^{\langle \xi, s_I \rangle} \prod_{i \in I} \frac{-1}{\langle \xi, v_i \rangle}$。把 $a$ 沿盒子 $(s + \mathfrak b) \cap \Lambda$ 求和，左边按 Lemma 4.8 恰为 $S(s + \mathfrak c, \Lambda)(\xi)$，右边按纤维"每个 $a_{I^c}$ 上有 $\operatorname{vol}_{L_I \cap \Lambda}(\mathfrak b_I)$ 个 $a_I$"化成式 (34)（`top-ehrhart.tex:1143-1151`），再用 Proposition 6.5 与 Lemma 4.6 归拢到 $S^{L_I}(s + \mathfrak c, \Lambda)$。

Remark 6.7（`top-ehrhart.tex:1162-1169`）核对边界：$d_0 = 0$ 时唯一拼贴函数 $\lambda(\emptyset) = 1, \lambda(I) = 0 (I \neq \emptyset)$，近似恒等。Example 6.8（`top-ehrhart.tex:1172-1197`）在 $\R^2$ 标准锥、$s = (-\frac12, -\frac12)$、$d_0 = 1$、$\lambda(\{1\}) = \lambda(\{2\}) = 1, \lambda(\{1, 2\}) = -1$ 时校验：
$$\frac{1}{(1 - \mathrm{e}^{\xi_1})(1 - \mathrm{e}^{\xi_2})} \equiv \frac{1}{1 - \mathrm{e}^{\xi_2}} \cdot \frac{-\mathrm{e}^{-\xi_1 / 2}}{\xi_1} + \frac{1}{1 - \mathrm{e}^{\xi_1}} \cdot \frac{-\mathrm{e}^{-\xi_2 / 2}}{\xi_2} - \frac{\mathrm{e}^{-\xi_1 / 2 - \xi_2 / 2}}{\xi_1 \xi_2} \quad \text{mod } \xi^{\geq 0}.$$
差的封闭形式是 $\left( \frac{1}{1 - \mathrm{e}^{\xi_1}} + \frac{\mathrm{e}^{-\xi_1 / 2}}{\xi_1} \right) \left( \frac{1}{1 - \mathrm{e}^{\xi_2}} + \frac{\mathrm{e}^{-\xi_2 / 2}}{\xi_2} \right)$，两因子各自在 $0$ 附近解析。

`top-ehrhart.tex:1200-1266` 给显式 Möbius 拼贴函数。Proposition 6.9（`top-ehrhart.tex:1213-1218`，标签 `rho`）
$$\lambda_{\text{Möbius}}(I) = (-1)^{|I| - d_0} \binom{|I| - 1}{d_0 - 1},$$
满足拼贴条件。原文证明用参数 $t$ 技巧（`top-ehrhart.tex:1220-1262`）：$\mathrm{e}^{z_1 + \cdots + z_d} = \prod_{i=1}^d (1 + t (\mathrm{e}^{z_i} - 1))|_{t=1}$，视作 $t$ 的多项式 $P(t) = \sum_{q=0}^d C_q(z) t^q$。取到 $t^{k_0}$（其中 $k_0 = d - d_0$）就得到 (39) 的 $z$-截断。展开 $C_q(z) = \sum_{|K| \leq q} (-1)^{q - |K|} \binom{d - |K|}{q - |K|} \mathrm{e}^{z_K}$，交换求和顺序得 $\sum_{|K| \leq k_0} f(d - |K|) \mathrm{e}^{z_K}$，其中 $f(j) = \sum_{m = d_0}^{j} (-1)^{j - m} \binom{j}{m}$。用二项式递推 $\binom{j}{m} = \binom{j-1}{m-1} + \binom{j-1}{m}$ 逐阶消去得 $f(j) = (-1)^{j - d_0} \binom{j-1}{d_0 - 1}$，与 Proposition 6.9 一致。Remark 6.10（`top-ehrhart.tex:1263-1266`）指出这条恒等也可从 Björner-Lovász-Yao 的 poset 结果推出。此后 $\lambda_{\text{Möbius}}$ 对应的 $A^{\lambda}$ 记为 $A_{\geq d_0}(s + \mathfrak c, \Lambda)$。

## 6 短式与多项式时间算法

`top-ehrhart.tex:1268-1551` 把 $A_{\geq d_0}$ 化成可算的短式。Definition 7.1（`top-ehrhart.tex:1285-1291`）引入 Bernoulli 母函数
$$T(\tau, x) = \mathrm{e}^{\tau x} \frac{x}{1 - \mathrm{e}^x} = -\sum_{n=0}^{\infty} B_n(\tau) \frac{x^n}{n!},$$
$B_n(\tau)$ 是 Bernoulli 多项式。

Theorem 7.2（`top-ehrhart.tex:1294-1339`，标签 `th:problem1`）：固定 $k_0 \geq 0$，输入是单纯锥 $\mathfrak c = \mathfrak c(v_1, \dots, v_d) \subset \R^d$（本原整向量 $v_i$，二进制编码）、指标集 $I \subseteq \{1, \dots, d\}$（$|I| = d_0 = d - k_0$，即 $L_I$ 的余维为 $k_0$），多项式时间输出有限集 $\Gamma$ 及每 $\gamma \in \Gamma$ 的整数 $\alpha^{(\gamma)}$、有理向量 $\eta_i^{(\gamma)}$ 与 $w_i^{(\gamma)}$（$i \in I^c$ 时 $\eta_i^{(\gamma)} \in \Z^d$），使每 $s \in \Q^d$ 有
$$S^{L_I}(s + \mathfrak c, \Z^d)(\xi) = \sum_{\gamma \in \Gamma} \alpha^{(\gamma)} \prod_{i \in I^c} T\left( \left\lceil \langle \eta_i^{(\gamma)}, s \rangle \right\rceil, \langle \xi, w_i^{(\gamma)} \rangle \right) \cdot \prod_{i \in I} \exp\left( \langle \eta_i^{(\gamma)}, s \rangle \langle \xi, w_i^{(\gamma)} \rangle \right) \cdot \frac{1}{\prod_{i=1}^d \langle \xi, w_i^{(\gamma)} \rangle},$$
（式 (41)）与等价形式（式 (42)）
$$S^{L_I}(s + \mathfrak c, \Z^d)(\xi) = \mathrm{e}^{\langle \xi, s \rangle} \sum_{\gamma \in \Gamma} \alpha^{(\gamma)} \prod_{i \in I^c} T\left( \{ -\langle \eta_i^{(\gamma)}, s \rangle \}, \langle \xi, w_i^{(\gamma)} \rangle \right) \cdot \frac{1}{\prod_{i=1}^d \langle \xi, w_i^{(\gamma)} \rangle}.$$

证明（`top-ehrhart.tex:1383-1480`）沿 Proposition 6.5 拆 $S^{L_I}$，$I(s_I + \mathfrak c_I, L_I \cap \Lambda)$ 走 Lemma 4.6 得到 (43)：$\mathrm{e}^{\langle \xi, s_I \rangle} \operatorname{vol}_{L_I \cap \Lambda}(\mathfrak b_I) (-1)^{|I|} \prod_{j \in I} \frac{1}{\langle \xi, v_j \rangle}$；$s_I = \sum_{i \in I} \langle \eta_i, s \rangle v_i$ 用 $v$ 基的对偶 $\eta_i \in \Q^d$，即矩阵 $(v_1, \dots, v_d)$ 的逆的行。对 $S(s_{I^c} + \mathfrak c_{I^c}, \Lambda_{I^c})$：先用 Kannan-Bachem 的 Hermite 标准形做多项式时间基变换，把投影格化成 $\Z^{k_0}$；再用 Barvinok 的固定维单纯锥单模分解 $\chi_{\{\mathfrak c_{I^c}\}} \equiv \sum_{m \in M} \epsilon_m \chi_{\{\mathfrak c_{I^c}^{(m)}\}}$（模掉含直线的锥，$\epsilon_m = \pm 1$）；每条 $\mathfrak c_{I^c}^{(m)}$ 用棱基 $w_i$ 与对偶整向量 $\eta_i \in \Z^d$，$s'_{I^c} = \sum_{i \in I^c} \lceil \langle \eta_i, s \rangle \rceil w_i$ 是盒子 $(s_{I^c} + \mathfrak c_{I^c})$ 里唯一格点，$S$ 走 Lemma 4.8。乘上常数 $\alpha$（含 $\epsilon, \operatorname{vol}_{L_I \cap \Lambda}(\mathfrak b_I), (-1)^{|I|}$）得式 (46)-(47)。第二条 (42) 用 $\lceil \cdot \rceil$ 与 $\{ \cdot \}$ 关系 $\lceil a \rceil = a + \{-a\}$ 与 $T$ 的乘性 $T(a + b, x) = T(a, x) \mathrm{e}^{bx}$（原文 (49)，`top-ehrhart.tex:1462-1468`）。

Remark 7.3（`top-ehrhart.tex:1345-1358`）指出 $w_i^{(\gamma)} (i \in I)$ 就是原来的 $v_i$，$\{w_i^{(\gamma)}\}_{i=1}^d$ 组成 $\R^d$ 基，$\eta_i^{(\gamma)}$ 是双正交对偶 $\langle \eta_i^{(\gamma)}, w_j^{(\gamma)} \rangle = \delta_{ij}$；只需存 $\alpha^{(\gamma)}$ 与 $I^c$ 侧的 $w_i^{(\gamma)}$。Remark 7.4（`top-ehrhart.tex:1359-1379`）把式 (42) 换成 $\mathrm{e}^{\langle \xi, s + s^{(\gamma)} \rangle}$ 形式：$s^{(\gamma)} = \sum_{i \in I^c} \{ -\langle \eta_i^{(\gamma)}, s \rangle \} w_i^{(\gamma)}$ 是 $V / (\Lambda + L_I)$ 环面上的整系数线性映射像，$s + s^{(\gamma)}$ 落在 $\bigoplus_{i \in I^c} \Z w_i^{(\gamma)} \oplus \bigoplus_{i \in I} \R v_i$ 中。Example 7.5（`top-ehrhart.tex:1483-1541`）给出 3 维非单模锥（棱 $(1,1,1), (1,-1,0), (1,1,0)$）上 $S(s + \mathfrak c, \Z^3)$ 与 $S^{L_{\{1\}}}(s + \mathfrak c, \Z^3)$ 的显式输出，含两个 $\gamma$，$T$ 参数出现 $\{ -s_3 + s_2 \}$、$\{ -s_1 + s_2 \}$、$\{ -s_3 \}$、$\{ 2 s_3 - s_2 - s_1 \}$ 型。Remark 7.6（`top-ehrhart.tex:1544-1550`）把 $\mathcal J^d_{\geq d_0}$ 的枚举与 $\lambda_{\text{Möbius}}$ 一起打包成多项式时间，$A_{\geq d_0}$ 同形态可算。

`top-ehrhart.tex:1554-1953` 组装最终算法。Theorem 7.7（`top-ehrhart.tex:1561-1594`，标签 `main-general`）：$\mathfrak p$ 是 simple 多面体，$\mathcal V(\mathfrak p)$ 顶点集，$s$ 处切锥 $\mathfrak c_s$，$q_s \in \N$ 使 $q_s s \in \Lambda$；固定 $\ell \in V^*$、$M \geq 0$、$0 \leq k_0 \leq d$、$d_0 = \max\{d - k_0, 0\}$。加权 Ehrhart 准多项式 $E(\mathfrak p, \ell, M; n)$ 在 $n$-度 $\geq M + d - k_0$ 上等于 (51) 或 (52)：
$$\sum_{k=0}^{k_0} n^{M+d-k} \sum_{s \in \mathcal V(\mathfrak p)} \frac{\langle \xi, s \rangle^{M+d-k}}{(M+d-k)!} \left( \mathrm{e}^{-\langle \xi, \{n\}_{q_s} s \rangle} A_{\geq d_0}(\{n\}_{q_s} s + \mathfrak c_s, \Lambda)(\xi) \right)_{[-d+k]}$$
在 $\xi = \ell$ 的取值。证明沿 $n = \lfloor n \rfloor_{q_s} + \{n\}_{q_s}$ 分解 $S(n s + \mathfrak c_s)(\xi) = \mathrm{e}^{\lfloor n \rfloor_{q_s} \langle \xi, s \rangle} S(\{n\}_{q_s} s + \mathfrak c_s)(\xi)$ 与齐次展开；再用 $S(\{n\}_{q_s} s + \mathfrak c_s)_{[-d+k]} = A_{\geq d_0}(\{n\}_{q_s} s + \mathfrak c_s)_{[-d+k]}$ 完成替换。

Theorem 7.8（`top-ehrhart.tex:1679-1712`，标签 `powersoflinear-stepfun`）是全文主定理：对每个固定 $k_0$ 有多项式时间算法，输入 $d$（一元）、有限指标集 $\mathcal V$、simple 多面体 $\mathfrak p$（顶点 $s_j \in \Q^d$ 二进制）、有理向量 $\ell \in \Q^d$（二进制）、$M$（一元），输出有限指标集 $\Gamma$、多项式 $f^{\gamma, m} \in \Q[r_1, \dots, r_{k_0}]$ 与整 $\zeta_i^{\gamma, m}$、正整 $q_i^{\gamma, m}$（$\gamma \in \Gamma, m = M+d-k_0, \dots, M+d, i = 1, \dots, k_0$），使
$$E(\mathfrak p, \ell, M; n) = \sum_{m=0}^{M+d} E_m(\mathfrak p, \ell, M; \{n\}_q) n^m$$
在 $n$-度 $\geq M + d - k_0$ 上等于 $\sum_{\gamma \in \Gamma} \sum_{m=M+d-k_0}^{M+d} f^{\gamma, m}\left( \{\zeta_1^{\gamma,m} n\}_{q_1^{\gamma,m}}, \dots, \{\zeta_{k_0}^{\gamma,m} n\}_{q_{k_0}^{\gamma,m}} \right) n^m$，即阶跃多项式闭式。

证明要点（`top-ehrhart.tex:1750-1925`）：先把 V-description 用 Bremner-Fukuda-Marzetta 原始-对偶转成 H-description，再抽 $\mathfrak c_{s_j}$ 的本原向量；对每条 (53) 的 $T$ 因子把 $\tau_i(n) = \{-\langle \eta_i, s \rangle \{n\}_{q_s}\}$ 化成 $\frac{1}{q_i} \{\zeta_i n\}_{q_i}$（$q_i \mid q_s$，$\zeta_i = q_i \langle -\eta_i, s \rangle \in \Z$），把 $r_i = \{\zeta_i n\}_{q_i}$ 作符号变量。对 $\ell$ 与 $w_i$ 正交的项用微扰 $\xi = t (\ell + \epsilon \ell')$，$\ell' \in \Q^d$ 一次选定让所有 $\langle \ell, w_i \rangle = 0$ 的 $i$ 满足 $\langle \ell', w_i \rangle \neq 0$。$t$ 追踪 $\xi$-分次，$\epsilon$ 追踪极点；截断阶 $U \leq d$（$U = \#\{i : \langle \ell, w_i \rangle = 0\}$）。$\Q[r_i : i \in I^c][t^{\pm 1}, \epsilon^{\pm 1}]$ 中 $|I^c| \leq k_0$，多项式时间用 Lemma 7.9（`top-ehrhart.tex:1736-1746`，截断乘积）连乘 $T$ 因子。最后抽 $\epsilon^0$、$t^M$ 系数即为 $E_m$ 的多项式表示。

Corollary 7.10（`top-ehrhart.tex:1959-1986`，标签 `ehrhart-barvinok-style`）加一个 $n$ 输入即得给定膨胀类 $\{n\}_q$ 下 $E_m(\mathfrak p, \ell, M; \{n\}_q)$ 数值的 Barvinok 型定理；Remark 7.11（`top-ehrhart.tex:1987-1993`）指出单膨胀类算法可把 $r_i$ 直接代值，只需在二元环 $\Q[t^{\pm1}, \epsilon^{\pm1}]$ 上做截断。Corollary 7.12（`top-ehrhart.tex:2004-2029`，标签 `ehrhart-barvinok-style-general`）把权函数放宽到"线性型幂 / 每个单变量只依赖固定变量数 / 固定全次稀疏多项式"三种形态之一，仍多项式时间。

## 7 复杂度、实现与实验表

原文在 `top-ehrhart.tex:2032-2111` 报告实验。作者用 Maple 实现无权情形（$h \equiv 1$）且假设输入是满维格单纯形（此时准多项式退化为多项式，方便与 LattE macchiato 输出的完整 Ehrhart 多项式对比）。顶点坐标取自 $\{-99, \dots, 99\}$ 独立均匀随机，每维 50 个样本，记算前三个最高 Ehrhart 系数的平均 CPU 秒。对比 LattE macchiato 的三档：`Dual`（Barvinok 对偶分解，`count --ehrhart-polynomial`），`Primal`（Köppe 的原始变体 `count --ehrhart-polynomial --irrational-primal`），`Primal_{1000}`（原始变体 + 单模分解在 $\det \leq 1000$ 时截停并枚举基本平行体，`--maxdet=1000`）。原文说明（`top-ehrhart.tex:2082-2085`）"我们的实现也是原始变体，故应跟 `Primal` 列比"。

表（`top-ehrhart.tex:2046-2071`）在 AMD Opteron 880 2.4 GHz 上运行，超过 30 分钟停：

| 维 | Dual | Primal | $\text{Primal}_{1000}$ | Top 3（本文 Maple） |
| --- | --- | --- | --- | --- |
| 3 | 0.16 | 0.10 | 0.04 | 1.12 |
| 4 | 28.00 | 4.68 | 0.28 | 4.31 |
| 5 | -- | 317.5 | 5.8 | 13.4 |
| 6 | -- | -- | 198.0 | 37.4 |
| 7 | -- | -- | -- | 103 |
| 8 | -- | -- | -- | 294 |
| 9 | -- | -- | -- | 393 |
| 10 | -- | -- | -- | 1179 |
| 11 | -- | -- | -- | 1681 |

低维慢是 Maple 解释执行的固定开销；从 5 维起本文实现反超 LattE 的 Primal（317.5 秒对比 13.4 秒），12 维样本全部超 30 分钟被截。`top-ehrhart.tex:2107-2109` 期待 $\text{Primal}_{1000}$ 型截停在本文实现里同样有效，因为本文短式已经带基本平行体枚举语义。

`top-ehrhart.tex:2115-2134` 致谢：文章成形于 2009 年比萨 Centro De Giorgi、2009 年 7 月与 2010 年 9 月 Palo Alto AIM SQuaRE、2010 年 3-4 月 Oberwolfach Research in Pairs 三次聚会；V. Baldoni 部分由 MIUR Cofin 40% 支持，De Loera 与 Köppe 各由 NSF DMS-0914107 与 DMS-0914873 支持；感谢 UC Davis 本科生 Brandon Dutra 与 Gregory Pinto 承担实验与测试。

从整体方法论上把复杂度再归拢一次：全文只在三处依赖 Barvinok 型多项式时间子程序，(a) 单模分解固定维 $\mathfrak c_{I^c}$（$\dim L_{I^c} = k_0$，与本文主输入维 $d$ 无关），(b) Kannan-Bachem 的 Hermite 标准形（`top-ehrhart.tex:1405-1407`）把投影格 $\Lambda_{I^c}$ 化到 $\Z^{k_0}$，(c) Bremner-Fukuda-Marzetta 原始-对偶（`top-ehrhart.tex:1751-1755`）由 V-description 得 H-description。截断乘积引理 Lemma 7.9 保证 $\Q[r_i][t][\epsilon]$ 里 $|I^c| \leq k_0$ 个变元的多项式乘积在多项式时间完成。$\mathcal J^d_{\geq d_0}$ 的枚举规模 $\binom{d}{\leq k_0} = O(d^{k_0})$，也是 $k_0$ 固定时的多项式。三处拼合，得全文复杂度对顶点数 $|\mathcal V(\mathfrak p)|$ 多项式、对 $d$ 多项式（前提是 simple 多面体，且以顶点 V-description 输入，Corollary 7.12 明确强调"不能以线性不等式输入"）。非 simple 时靠扰动三角化或单纯分解归约（`top-ehrhart.tex:334-335` 引 Edelsbrunner、DRS 三角化手册、Köppe 无理 Barvinok）。

## 8 与本语料的接缝

本语料以 bib key `BaldoniBerlineDeLoeraKoeppeVergne2012` 引本稿的稿号共五处：D318、D385、D447、D451、D471。写手不去读这些稿，本节只登记派单信息并给 C 稿侧的记号读法。

- 记号读法：C 稿里出现的 $E_m(\mathfrak p, \xi, M; n \bmod q)$、$A_{\geq d_0}(s + \mathfrak c, \Lambda)$、$\lambda_{\text{Möbius}}(I) = (-1)^{|I| - d_0} \binom{|I| - 1}{d_0 - 1}$、$T(\tau, x) = \mathrm{e}^{\tau x} \frac{x}{1 - \mathrm{e}^x} = -\sum_n B_n(\tau) x^n / n!$、$\mathcal J^d_{\geq d_0}$、$\lfloor n \rfloor_q$ 与 $\{n\}_q$、$\chi_{\{\cdot\}}$（原文 `\charfun{}`）、$\mathfrak b$（原文 `\b`）与 $\mathfrak c$（原文 `\c`）都按 §0 的映射从 KaTeX 认得的形态读；语料稿侧若把本文引用为"有理单纯锥 Ehrhart 高位系数的阶跃多项式闭式算法"，对应 C 稿内 §5 的 Theorem 6.6 拼贴近似与 §6 的 Theorem 7.8 `powersoflinear-stepfun`。
- D318 若走的是加权 Ehrhart 准多项式多项式时间计算，接缝应落在 C 稿的 Theorem 7.8 与 Corollary 7.12（`top-ehrhart.tex:1679-1712, 2004-2029`）。
- D385、D447、D451、D471 与本稿同被 D385/D447/D451/D471 引用的 Fujino 2016（C09）与 BDPP 2013（C10）、Berndtsson-Păun 2008（C11）在 bib key 上互不相通。这几稿若走的是锥的赋值 / 生成函数层面，接缝应落在 C 稿 §2 与 §4，即 $S^L$ 中间生成函数与拼贴函数定义（`top-ehrhart.tex:803-859, 886-983`）；若走的是"高位齐次分量抽取"（`top-ehrhart.tex:691-710, 727-792`），落在 C 稿 §3。
- 本稿实验表（§7）里的 $\text{Primal}_{1000}$ 型截停语义对应 LattE macchiato 命令行 `--maxdet=1000`（`top-ehrhart.tex:2089-2090`），若语料稿在讨论实现细节，可引 C 稿这一节。









