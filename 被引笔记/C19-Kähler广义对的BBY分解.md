# C19 Kähler广义对的BBY分解（arXiv:2506.23218）

## 0 取证边界

- arXiv id：2506.23218
- 作者（原文署名逐字）：Shin-ichi Matsumura, Juanyong Wang, Xiaojun Wu, Qimin Zhang
- 发表年月：2025-06-29
- 素材目录：`E:\math\被引素材/2506.23218/`
- 主 tex 清单：`被引素材/2506.23218/arXiv_0909_2026.tex`（399736 字节 / 13384 行）
- 本语料中引用它的稿号与 bib key：D385（bib key `MatsumuraWangWuZhang2026`）；D447（bib key `MatsumuraWangWuZhang2026`）；D471（bib key `MatsumuraWangWuZhang2026`）
- 取材薄读之处：取材第 0–1200 行（前置、记号、主定理、抽象）；第 1200–1600 行（局部常值纤维化与广义对定义）；第 2000–4800 行（Q-可因子化定理、相对丰沛丛构造、广义对相关正性技术）；第 4800–8000 行（直接像平坦性、切丛切丛层量化、切丛分裂与 Miyaoka-Yau 部分）；第 9140–9440 行（一般情形的下降论证）；第 10635–12255 行（应用、generic nefness、Miyaoka-Yau 型不等式）。其余章节（Druel 型解析版、辅助引理）未直接取材；行号位置串均逐字来自以上已读行。

## 1 论文主定理与几何背景

作者研究的对象是 **Kähler 广义 klt 对 $(X,\Delta,\boldsymbol\beta)$ 的 Calabi–Yau 型**，三者依次是紧致 Kähler 簇 $X$、有效 $\mathbb R$-除子 $\Delta$、nef b-$(1,1)$-电流 $\boldsymbol\beta$，并要求 Bott–Chern 类
$$c_1(K_X+\Delta+\boldsymbol\beta_X)\in H^{1,1}_{\mathrm{BC}}(X)$$
良定义，且 $K_X+\Delta+\boldsymbol\beta_X\equiv 0$（arXiv_0909_2026.tex:383-393，定义 1.3（广义对）位于 arXiv_0909_2026.tex:1394-1420 的 def-gpairs 项）。这一族把经典对、log 对、广义对三种 MMP 对象统一在 $\boldsymbol\beta$ 项之下：$\boldsymbol\beta=0$ 即旧的对（klt 对），$\boldsymbol\beta$ 非零且由 birational 提升得到的即 Kollar–Xu 风格的 b-除子对应物（arXiv_0909_2026.tex:1507-1546）。

主定理 1.1（thm-main，位于 arXiv_0909_2026.tex:405-426）的陈述如下。设 $(X,\Delta,\boldsymbol\beta)$ 为 Kähler 广义 klt 对、Calabi–Yau 型，则存在有限 quasi-étale 覆叠 $\nu\colon X'\to X$ 与纤维化 $f\colon X'\to Y'$ 满足：(1) $f$ 关于 $(X',\Delta':=\nu^*\Delta)$ 是 **局部常值纤维化**（locally constant fibration，见定义 1.4）；(2) 纤维 $F'$ 有理连通；(3) 底 $Y'$ 是紧致 Calabi–Yau klt 簇。特别地，$f\colon (X',\Delta')\to Y'$ 在小开集上同构为
$$\bigl(f^{-1}(B),\Delta'|_{f^{-1}(B)}\bigr)\cong B\times(F',\Delta'_{F'}).$$

由此对原问题作代换：把 $X$ 换成 $X'$ 之后，分解剩下三个结构对：(i) 局部常值结构给出的整体 monodromy 表示 $\rho\colon\pi_1(Y')\to\Aut(F')$；(ii) Calabi–Yau 底作奇异 BBY 分解（BGL22）（arXiv_0909_2026.tex:516-548）；(iii) 当 $\boldsymbol\beta=0$ 时 monodromy 在 quasi-étale 覆叠下可消，回归 BGL–理智的全局乘积分解（推论 1.4 cor-bby，arXiv_0909_2026.tex:562-582）：
$$(X',\Delta')\cong(F',\Delta'_{F'})\times\prod_i Y_i\times\prod_j Z_j\times T.$$

论文的创新点有二（arXiv_0909_2026.tex:450-466）：一是发展 Kähler 解析 MMP 的解析技术（相对投影性、直接像层正性与平坦性、奇异 Kähler 簇上的叶状结构），二是把 nefness 揉进广义 MMP。当底 $Y$ 非射影时，相对丰沛线丛的构造依赖 Cao-Höring 项目化准则 (CH24)；直接像层 $\phi_*\mathcal O_X(mG)$ 的伪有效与首陈类为零的论证依赖 Cao-Donaldson-Mus的综合 (CDM26) 提供的平坦性准则。

## 2 局部常值纤维化与广义对的严格定义

**定义 1.4**（locally constant fibration，arXiv_0909_2026.tex:1214-1252 的 def-constant）。设 $\phi\colon X\to Y$ 为正常解析簇间的纤维化，$\Delta$ 为 $X$ 上的 Weil $\mathbb R$-除子。若下列全部满足：(a) $\phi$ 为以 $F$ 为纤维的解析纤维丛；(b) $\Delta$ 的每个分量 $\Delta_i$ 满足 $\phi(\Delta_i)=Y$（即每个分支都是"水平"的，不会被纤维切到）；(c) 存在 Weil $\mathbb R$-除子 $\Delta_F$ 与表示 $\rho\colon\pi_1(Y)\to\Aut(F)$，使 $\Delta_F$ 在 $\pi_1(Y)$ 下不变，且 $(X,\Delta)$ 通过商映射
$$\bigl(\widetilde Y\times(F,\Delta_F)\bigr)/\pi_1(Y)$$
在 $Y$ 上同构（$\gamma\in\pi_1(Y)$ 在 $\widetilde Y\times F$ 上斜乘 $(\gamma\cdot y,\rho(\gamma)(z))$），则 $\phi\colon(X,\Delta)\to Y$ 称为局部常值纤维化。

注意 (c) 是比局部平凡更强的约束：局部常值结构保证了 $(X,\Delta)\times_Y\widetilde Y\cong\widetilde Y\times(F,\Delta_F)$，从而 monodromy 表示 $\rho$ 是整体的，不是每个小开集上拼装的局部数据。作者强调（arXiv_0909_2026.tex:1281-1295）："the local constancy is substantially stronger than the local triviality, and some arguments in this paper fail for fibrations that are merely locally trivial"，这是后两节中两则引理（lemma_lc_line 与 prop_flat-lcf）能奏效的根本。

**引理 2.1**（lemma_lc_line，arXiv_0909_2026.tex:1302-1335）。设 $\phi\colon X\to Y$ 为射影局部常值纤维化，纤维 $F$ 的不规则量 $q(F)=0$，$L$ 为相对 $\phi$-丰沛线丛。则 (1) 对充分大可除 $m\in\mathbb Z_+$，$mL|_F$ 是 $\rho$-等变与 $\rho$-线性化；(2) 存在 $F$ 上的线丛 $L_F$ 与 $Y$ 上的 $\mathbb Q$-线丛 $L_Y$，使 $p_X^*(L-\phi^*L_Y)\sim_\mathbb Q\pr_2^*L_F$；特别地，对可除 $m$，$p_X^*(m(L-\phi^*L_Y))\cong\pr_2^*(mL_F)$ 是 $\pi_1(Y)$-等变的，且直接像层 $\phi_*\mathcal O_X(m(L-\phi^*L_Y))$ 是 $Y$ 上的平坦向量丛。

**命题 2.2**（prop_flat-lcf，arXiv_0909_2026.tex:1342-1372）。设 $\phi\colon X\to Y$ 为正常解析簇间的纤维化，$D$ 为 $X$ 上的有效 Weil $\mathbb R$-除子。假设 $\phi$ 是平坦射影态射，且存在相对 $\phi$-丰沛线丛 $L$ 满足：(1) $E_m:=\phi_*\mathcal O_X(mL)$ 是局部系统（即平坦向量丛）；(2) 自然映射 $\Sym^m E_1\to E_m$ 是局部系统之间的态射（即由 $\pi_1(Y)$ 的相应表示导出）；(3) 子层 $F_m:=\phi_*\mathcal O_X(mL-\lfloor D\rfloor)$ 是 $E_m$ 的局部子系统。则 $\phi\colon(X,\lfloor D\rfloor)\to Y$ 是局部常值纤维化。

注 2.3（arXiv_0909_2026.tex:1374-1378）。若 $Y$ 为紧 Kähler 流形，则 (1)(2)(3) 可由"两向量丛 $E_m$、$F_m$ 都是数值平坦向量丛"推出。

**广义对的定义**（arXiv_0909_2026.tex:1394-1504，def-gpairs）。三元组 $(X,\Delta,\boldsymbol\beta)$ 包含：$X$ 为正常解析簇；$\Delta$ 为有效 $\mathbb R$-除子；$\boldsymbol\beta$ 为 $X$ 上的 nef b-$(1,1)$-电流。后者是 $\boldsymbol\beta=\{\boldsymbol\beta_{X'}\}_{X'}$ 的集合，其中 $X'$ 遍历 $X$ 的所有 proper bimeromorphic 模型，每个 $\boldsymbol\beta_{X'}$ 是 $X'$ 上的闭 $(1,1)$-电流，且对任意 bimeromorphic 态射 $g\colon X''\to X'$ 满足 $g_*\boldsymbol\beta_{X''}=\boldsymbol\beta_{X'}$。所谓"nef"，即 $\boldsymbol\beta$ 在某模型 $M\to X$ 上 local potentials 存在且 $c_1(\boldsymbol\beta_M)\in H^{1,1}_{\mathrm{BC}}(M)$ 是 nef。Kähler 广义对 $(X,\Delta,\boldsymbol\beta)$ 为 Calabi–Yau 型指 $X$ 紧 Kähler 且 $K_X+\Delta+\boldsymbol\beta_X\equiv 0\in H^{1,1}_{\mathrm{BC}}(X)$。

广义 klt（log klt）条件由 log resolution $\pi\colon M\to X$ 上的判别式给出：存在有效 $\mathbb R$-除子 $\Delta_M$ 与 $\pi$-例外除子 $F_+$（无公共分支）使 $K_M+\Delta_M+\boldsymbol\beta_M\equiv\pi^*(K_X+\Delta+\boldsymbol\beta_X)+F_+$。$(X,\Delta,\boldsymbol\beta)$ 为 klt 当且仅当 $\Delta_M<1$（对某个、亦即任意 log resolution）。

具体例子（arXiv_0909_2026.tex:1516-1600 的 example-compare）：经典 klt 对 $(X,\Delta)$ 若 $-(K_X+\Delta)$ 是 nef $\mathbb Q$-Cartier 除子，则可令 $\boldsymbol\beta$ 为 $-(K_X+\Delta)$ 诱导的 nef b-$(1,1)$-电流（取光滑 $(1,1)$-形 $\theta$ 代表 $-c_1(K_X+\Delta)$，令 $\boldsymbol\beta_{X'}:=f^*\theta$），此时 $(X,\Delta,\boldsymbol\beta)$ 是广义 klt 对，且广义差异与 $(X,\Delta)$ 的经典差异一致（arXiv_0909_2026.tex:1539-1545）。更一般的，由 Zariski 型分解 $(M,\Delta_M)$、nef $\mathbb R$-除子 $P$、$\pi$-例外除子 $N$ 构造 $-(\pi^*K_X+\pi^*\Delta)\equiv P+N$，只要 $(M,\Delta_M'+N)$ 是 klt 即可（arXiv_0909_2026.tex:1553-1600，prop-zariski）。这两种构造给出通用 Calabi–Yau 型广义 klt 对的最小来源。

## 3 主要技术准备：Q-可因子化、极大 quasi-étale 覆叠、相对丰沛丛

**Q-可因子化定理**（thm-Q-factorialization，arXiv_0909_2026.tex:2304-2323）。设 $X$ 为紧致正常解析簇，$\Delta$ 为有效除子且 $\lfloor\Delta\rfloor=0$。则存在紧致、强 $\mathbb Q$-可因子化、klt 对 $(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})$ 与射影修正 $q\colon X^{\text{\rm\tiny qf}}\to X$，满足 $q_*\Delta^{\text{\rm\tiny qf}}=\Delta$，且 $K_{X^{\text{\rm\tiny qf}}}+\Delta^{\text{\rm\tiny qf}}$ 为 $q$-nef（即 $(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})$ 是 $X$ 上的相对极小模型）。若 $X$ 又是 Kähler，则 $X^{\text{\rm\tiny qf}}$ 也是 Kähler（条件 (e)）。

证明思路（arXiv_0909_2026.tex:2325-2373）依赖解析 log-MMP：取 log resolution $f\colon W\to X$，设 $\Phi$ 为 $f$-例外除子，对足够小 $\varepsilon>0$，运行 $K_W+f_*^{-1}\Delta+(1-\varepsilon)\Phi$ 在 $X$ 上的相对 log-MMP（由 DHP24 与 Fuj22 给出），得到 bimeromorphic 映射 $g\colon W\dashrightarrow X^{\text{\rm\tiny qf}}$；令 $\Delta^{\text{\rm\tiny qf}}:=g_*f_*^{-1}\Delta+(1-\varepsilon)g_*\Phi$ 即为所求。对开子集 $X_0\subset X$ 上的 klt 条件，需验证 $q_0:=q|_{X_0^{\text{\rm\tiny qf}}}$ 是小收缩（用广义的 negativity lemma）。特别地，若 $(X,\Delta,\boldsymbol\beta)$ 是 g-klt，则 $q$ 是 $(X,\Delta,\boldsymbol\beta)$ 的小强 $\mathbb Q$-可因子化。

**极大 quasi-étale 覆叠定理**（thm-maxqetale，arXiv_0909_2026.tex:2620-2651）。设 $(X,\Delta,\boldsymbol\beta)$ 为紧致广义 klt 对。则 (1) 存在极大 quasi-étale 覆叠 $\nu\colon X'\to X$；(2) 若 $X$ 极大 quasi-étale，则对每个线性表示 $\rho_0\colon\pi_1(X_{\reg})\to\GL(r,\mathbb C)$ 都存在表示 $\rho\colon\pi_1(X)\to\GL(r,\mathbb C)$ 使 $\rho_0=\rho\circ\iota_*$（这里 $\iota_*\colon\pi_1(X_{\reg})\twoheadrightarrow\pi_1(X)$ 是极大 quasi-étale 假设给出的满射）；(3) 若 $X$ 极大 quasi-étale 且 $\pi\colon\bar X\to X$ 是 bimeromorphic 态射，则 $\bar X$ 也是极大 quasi-étale。

证明要点（arXiv_0909_2026.tex:2653-2774）：(1) 由 thm-Q-factorialization 取 $X^{\text{\rm\tiny qf}}$，然后用 Fuj22 风格的全球可能 klt 引理（prop-local-klt, arXiv_0909_2026.tex:2051-2055）得极大 quasi-étale Galois 覆叠 $Y\to X^{\text{\rm\tiny qf}}$，再作 Stein 分解 $Y\to X'\to X$；(2) 是 Malcev 定理的应用，参考 GKP16b 与 CDM26 的 Theorem 2.9；(3) 由 MW 的 Theorem 2.12 推得。

**线性系与 Bertini 型定理**（arXiv_0909_2026.tex:2069-2233）。这是解析框架的关键技术替代品，目的是把"开集上一般点"的概念推广到非紧解析簇。定义：$Y$ 中子集 $S$ 称为解析贫（analytically meagre）若 $S\subseteq\bigcup_n Y_n$，其中每个 $Y_n$ 是 codim≥1 的局部解析子集；性质 (P) 在解析充分一般点 $y\in Y$ 上成立即存在解析贫集 $S$ 使 $(P)$ 在 $Y\setminus S$ 上成立。Frisch 定理（thm-generic-flatness，arXiv_0909_2026.tex:2118-2127）说明：若 $f\colon X\to Y$ 是解析簇间的态射，$\mathcal F$ 是凝聚层，则 $f$-非平展轨迹 $S:=\{x\in X\mid\mathcal F_x\text{ not flat over }\mathcal O_{Y,f(x)}\}$ 是解析子集；$Y$ 约化时 $f(S)$ 解析贫。

Bertini 型定理（thm-Bertini，arXiv_0909_2026.tex:2130-2149）：设 $L$ 为 $X$ 上的线丛，$V\subseteq H^0(X,L)$ 是无处基点的有限维线性系，$\mathcal F$ 是 $X$ 上的凝聚层满足性质 (P)（如局部自由、$(S_k)$ 凝聚、reflexive、$(R_k)$）。则对解析充分一般 $v\in V$，$\mathcal F|_{H_v}$ 仍满足 (P)。证明由 universal family $\mathscr H_V$ 与 proposition-generic 命题归结到命题 3.2（arXiv_0909_2026.tex:2176-2187）的论证。Corollary 3.3（cor-Bertini，arXiv_0909_2026.tex:2191-2203）说明该定理对 reflexive sheaf 的 saturated subsheaf 仍成立。

作者明确警告（arXiv_0909_2026.tex:2235-2253 的 rmk-Bertini）：解析簇上 Bertini 不可约性定理不成立，具体反例：$X=D\times\mathbb C_{z_3}\subset\mathbb C^3_{z_1,z_2,z_3}$（$D$ 为 $\mathbb C^2$ 内小圆盘，不含整点），取线性系 $V:=\operatorname{span}\{e^{2\pi iz_1}-1,e^{2\pi iz_2}-1,e^{2\pi iz_3}-1\}\subseteq H^0(X,\mathcal O_X)$，则 $V$ 在 $\mathbb C^3$ 上的基轨迹为 $\mathbb Z^3$；一般成员有无穷多连通分支，codim 0 反例说明代数 Bertini 不可约定理不能直接搬过来。

**正向叶状结构与 flat pullback**（arXiv_0909_2026.tex:3346-3427）。Lemma 3.4（lem-pull）：设 $\phi\colon M\to Y$ 是紧 Kähler 簇间的纤维化，$\phi$ 在 $Y$ 的 Zariski 开子集 $Y_1$ 上平坦，$\mathcal E$ 是 $Y$ 上的 torsion-free 层且 $\mathcal E$ 关于 $Y_1$ 上的 Kähler 形 $\omega_Y$ 弱正曲率。则 (1) reflexive pullback $\phi^{[*]}\mathcal E$ 关于 $M$ 上 Kähler 形 $\omega_M$ 在 $M_1:=\phi^{-1}(Y_1)$ 上弱正曲率；(2) 若 $\pi\colon M\to X$ 是 bimeromorphic 态射且 $M\setminus M_1\subset E_\pi$，则 reflexive pushforward $\pi_{[*]}\phi^{[*]}\mathcal E$ 在 $X$ 上弱正曲率。证明用 $\varepsilon$-水平曲率指标与 Hartogs 扩张。

## 4 部分 A：MRC 纤维化、相对 big 线丛与直接像平坦性

**设定**（Setting，arXiv_0909_2026.tex:4836-4873）。设 $(X,\Delta,\boldsymbol\beta)$ 是紧致 Kähler 广义 klt 对，$n=\dim X$，且 $X$ 强 $\mathbb Q$-可因子化。设 $\psi\colon X\dashrightarrow Y$ 是到紧致 Kähler 流形 $Y$ 的 MRC 纤维化。取 log resolution $\pi\colon M\to X$ 使诱导有理映射被态射 $\phi\colon M\to Y$ 解决。$E:=\Exc(\pi)$。因为 $(X,\Delta,\boldsymbol\beta)$ 是 Calabi–Yau 型，可由 canonical divisor 公式 $K_M+\Delta_M+\boldsymbol\beta_M\equiv\pi^*(K_X+\Delta+\boldsymbol\beta_X)+F_+$ 得到
$$-(K_M+\Delta_M)+F_+\equiv\boldsymbol\beta_M,$$
左侧是 nef Bott–Chern 类。即使 $\Delta$ 是 $\mathbb Q$-除子，$\Delta_M$ 与 $F_+$ 仍是 $\mathbb R$-除子，不必是 $\mathbb Q$-除子，这是与早期工作的一个显著差别。

**Step 1（相对极化构造）**（arXiv_0909_2026.tex:816-840）。在射影情形，先取 $X$ 上丰沛线丛并构造相对 $\phi$-丰沛线丛 $G$ 使 $\phi_*\mathcal O_X(mG)$ 伪有效且首陈类消失。Kähler 情形下，$G$ 不能直接取自 $X$ 的丰沛线丛（未必存在）。但 MRC 纤维的一般纤维 $F$ 是有理连通的紧 Kähler 簇因此是射影的；用 CH24 的项目化准则（Theorem 1.2），MRC 纤维化的某模型在 $Y$ 上是射影的，从而可构造所求相对丰沛线丛。构造中需解决 MRC 纤维化的不定性，同时控制例外除子、$\Delta$ 与 $\boldsymbol\beta$，故强 $\mathbb Q$-可因子化假设必不可少。

**Step 2（直接像层的正性与平坦性）**（arXiv_0909_2026.tex:853-892）。目标是证 $\phi_*\mathcal O_X(mG)$ 的 reflexive hull $\mathcal V^{**}$ 局部自由且数值平坦。在射影情形，原方法用 Kawamata covering trick 加 $Y$ 上的丰沛线丛；Kähler 情形下，$Y$ 上未必有丰沛线丛，故改用基于 Bergman 核的局部化正性论证（这是本文的关键思想之一）。Kawamata covering trick 原是研究 MRC 纤维 bimeromorphic 几何的工具，本文用 generic nefness（§8 中 nefness 定理）替代，证于 Proposition 1（prop_bir-geometry-psi）。伪有效且 $c_1=0$ 的 torsion-free sheaf 的平坦性，用 CDM26 的 Kähler 平坦性准则（对应本稿 Theorem 1.6 thm-flatness）。此步骤需要"X 极大 quasi-étale"假设。

**Step 3（从平坦性到局部常值纤维化）**（arXiv_0909_2026.tex:897-924）。把 $\mathcal V^{**}$ 的平坦结构传给射影丛 $\mathbb P(\mathcal V^{**})\to Y$，通过 $mG$ 决定的相对嵌入与 $\phi\colon X\to Y$ 比较，得到切丛分裂
$$T_X\cong\mathcal F\oplus\mathcal G,$$
其中 $\mathcal F$ 是代数可积叶状结构（一般叶为 MRC 纤维），$\mathcal G$ 满足 $K_{\mathcal G}\sim_\mathbb Q 0$。再由 Druel 定理的解析版（见 §6 描述，本文 Section 3 sec-druel），把这个无穷小分裂提升到全坐标系定义纤维间等分对的纤维化，从而在 Part (A) 的技术假设下得到局部常值纤维化。

**直接像平坦性的核心定理**（thm-faked-flat 与推论 thm-flat，arXiv_0909_2026.tex:5314-5360）。设 $(X,\Delta,\boldsymbol\beta)$ 与 Setting 同，$\psi\colon X\dashrightarrow Y$ 为 MRC 纤维化，$G$ 为相对 big 线丛。对 $m\gg0$，设
$$\mathcal V_m:=\psi_*\mathcal O_{X^{\text{\rm\tiny qf}}}(mG),$$
则 $\mathcal V_m$ 是局部自由、伪有效、且 $c_1(\mathcal V_m)=0$；其 reflexive hull $\mathcal V_m^{**}$ 与 $\mathcal V_m$ 一样局部自由；进一步，对所有 $m$，$\psi_*\mathcal O_{X^{\text{\rm\tiny qf}}}(mG)\otimes\mathcal O_Y(-mD_{c,1})$ 是 $Y_0$ 上的平坦向量丛。

证明（arXiv_0909_2026.tex:5314-5449、7149-7226、7276-7380）：(a) 由 generic nefness（thf-faked-flat 中 $\mathcal V_m$ 的正性）构造相对 ample 线丛 $G$ 与 $c_0$；(b) 对 $c\geqslant c_0$ 应用 prop_det-stablize 得 $\det\mathcal V_m$ 在 $\det$-意义上"stabilize"，从而推出 $c_1(\mathcal V_m)=0$ 与数值平坦；(c) 用 CDM26 的平坦性准则（依赖 CDM26 自己的 pseudo-effective 刻画，由本稿 §9 引理 lemm-extension 提供）证 $\mathcal V_m^{**}$ 局部自由；(d) 用 Proposition prop_bir-geometry-psi 证 $Y_0$ 上的平坦向量丛性质（详见 arXiv_0909_2026.tex:7380-7490）。

**切丛分裂**（thm_splitting，arXiv_0909_2026.tex:7609-7629）。在 thm-main 的假设下，若再设 $X$ 强 $\mathbb Q$-可因子化、极大 quasi-étale，则 MRC 纤维化诱导切丛分裂 $T_X\cong\mathcal F\oplus\mathcal G$，$\mathcal F$ 是代数可积叶状结构、一般叶为 MRC 纤维的纤维，$\mathcal G$ 满足 $K_{\mathcal G}:=\det(\mathcal G^*)\sim_\mathbb Q 0$。

证明分四步（arXiv_0909_2026.tex:7631-7900）：(Step 1) 构造 bimeromorphic 模型 $X_G$：用 CH24 项目化准则（Theorem 1.2），$\phi\colon M\to Y$ 是射影的；选 $\phi$-big 线丛 $G$，对 $c\geqslant c_0$ 用 Proposition prop_det-stablize；再爆开 $M$ 使 $\phi$-relative base locus of $G+cE$ 是 divisor，作 Zariski 分解 $G+cE=G_{c,\operatorname{free}}+G_{c,\operatorname{base}}$，得到 $\pi_G\colon M\to\mathbb P(\phi_*\mathcal O_M(G_{c,\operatorname{free}}))$，像记为 $X_G$。(Step 2) $X_G$ over $Y_0$ 的局部常值：由 thm-faked-flat $\mathcal E_m$ 数值平坦局部自由，thm-flat $\mathcal V_m$ 在 $Y_0$ 上平坦向量丛；flat connection 从 $\mathcal E_m$ 下降到 $\mathcal V_m$，验证 prop_bir-geometry-psi 的 condition (●)。再证 $\mathcal W_m:=\psi_{G*}\mathcal O_{X_G}(m)\otimes\mathcal O_Y(-mD_{c,1})$ 在 $Y_0$ 上与 $\mathcal V_m$ 同构。(Step 3) 验证 prop_flat-lcf 的条件 (2)（Sym$^m E_1→ E_m$ 是局部系统间态射）。(Step 4) 由 Step 1-3 构造叶状结构，应用 Druel 定理的解析版得到 $T_X$ 的分裂。

## 5 部分 B：去掉强 Q-可因子化与极大 quasi-étale 假设

Part (A) 给出的纤维化在强 $\mathbb Q$-可因子化、极大 quasi-étale 假设下成立。一般情形分两步：先把 $X$ 换为强 $\mathbb Q$-可因子化模型，再把所得纤维化"下降"到原对 $(X,\Delta)$。

**Step 1 of Part (B)（强 $\mathbb Q$-可因子化）**（arXiv_0909_2026.tex:931-963）。先用 thm-maxqetale 取极大 quasi-étale 覆叠，再用 thm-Q-factorialization 取小 bimeromorphic $q\colon X^{\text{\rm\tiny qf}}\to X$。需要 $X^{\text{\rm\tiny qf}}$ 仍极大 quasi-étale（thm-maxqetale(3) 保证这一点）。对 $(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}},\boldsymbol\beta^{\text{\rm\tiny qf}})$ 应用 Part (A) 得局部常值纤维化 $f_{\text{\rm\tiny qf}}\colon(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})\to Y^{\text{\rm\tiny qf}}$。

注（arXiv_0909_2026.tex:7505-7511）：极大 quasi-étale 覆叠的强 $\mathbb Q$-可因子化不必是强 $\mathbb Q$-可因子化，所以必须"先取覆叠、再取可因子化"。证明主定理时分两步：先在 Section sec-mainthm 中用 Part (A) 证 $X^{\text{\rm\tiny qf}}\to Y^{\text{\rm\tiny qf}}$ 存在；再在 Section sec-red 中下降这个纤维化到 $X$。

**Step 2 of Part (B)（下降论证）**（arXiv_0909_2026.tex:967-998）。关键定理 thm-reduction（arXiv_0909_2026.tex:9144-9172）陈述如下。设 $q\colon (X,\Delta)\to(X',\Delta')$ 是小 bimeromorphic 态射，$q_*\Delta=\Delta'$，$(X,\Delta)$ 是紧致 Kähler klt 对，$X'$ 紧致 Kähler、locally potentially klt。设 $X$ 有纤维化 $\phi\colon X\to Y$ 满足：(i) $\phi\colon (X,\Delta)\to Y$ 射影且局部常值；(ii) 纤维 $F$ 有理连通；(iii) 底 $Y$ 是 Calabi–Yau（$K_Y$ 数值平凡）。则在替换 $(X',\Delta')$ 为某个有限 quasi-étale 覆叠后，$(X',\Delta')$ 也存在纤维化 $\phi'\colon X'\to Y'$ 且满足相同性质，并有交换图
交换图的内容用文字复述：四条边依次是 $q\colon X\to X'$、$\phi\colon X\to Y$、$\phi'\colon X'\to Y'$ 与一条由 $Y$ 到 $Y'$ 的态射，四方交换说的就是「先 $q$ 后 $\phi'$」与「先 $\phi$ 后 $Y\to Y'$」这两条形如 $X\to Y'$ 的复合相等。
证明（arXiv_0909_2026.tex:9174-9720）分两步走：
- **Claim 1**（arXiv_0909_2026.tex:9177-9218）。用 Singula 奇异 BBY 分解（BGL22 Theorem A）得有限 quasi-étale 覆叠 $Y_{\text{q\'e}}\to Y$，使 $Y_{\text{q\'e}}\cong Z\times T$，其中 $T$ 是复环面、$Z$ 是 klt Calabi–Yau 簇、增强不规则量 $\hat q(Z)=0$。把 $(X,\Delta)$、$(X',\Delta')$ 换成对应覆叠后，$Y\cong Z\times T$。
- **Lemma 5.2（lem-local-const-base-change，arXiv_0909_2026.tex:9220-9236）**。设 $\phi\colon X\to Y$ 为 $(X,\Delta)$ 上的局部常值纤维化，$f\colon Y'\to Y$ 为态射，则底变换 $X':=X\times_Y Y'$ 上 $(X',f'^*\Delta)\to Y'$ 仍是局部常值纤维化。证明用 universal cover 与 $f_*$-等变 lift。
- **Claim 2'**（arXiv_0909_2026.tex:9319-9367）。设 $\rho\colon\pi_1(Y)\to\Aut(F,\Delta_F)$ 是 $\phi$ 的 monodromy 表示。Claim 1 的 $Y\cong Z\times T$ 替换下，可再换有限 quasi-étale 覆叠使 $\rho$ 透过 $\pi_1(T)$ 因子分解。证明要点：(a) 射影性 + lemma_lc_line 给出 $\operatorname{Im}(\rho)\subset$ 线性代数群 $\Aut(F,mA_F)$；(b) $\pi_1(Z)\to\Aut(F,\Delta_F)$ 的像也是代数群，由 Campana 定理 (Theorem 7.8 of Cam04)，Calabi–Yau $Z$ 的 $\operatorname{Im}(\rho_Z)$ 实际 abelian；(c) $\hat q(Z)=0$ 蕴含 $H_1(Z,\mathbb Z)$ 有限生成无挠，因此是有限群；故换覆叠后可设 $\rho_Z$ 平凡，$\rho$ 因子透过 $\pi_1(T)$。

进一步，把 $\phi$ 与 $\pr_2\colon Z\times T\to T$ 复合得 $\varphi\colon X\to T$。由 Fuj26 (Corollary 1.4) 与 HM07 (Corollary 1.7)，$T$ 不含有理曲线且 $X'$ locally potentially klt，所以 $\varphi\circ q^{-1}$ 扩展为纤维化 $\psi\colon X'\to T$。设 $W:=Z\times F$、$\Delta_W:=\pr_2^*\Delta_F$。Claim 2' 蕴含 $\varphi\colon (X,\Delta)\to T$ 是局部常值纤维化，纤维 $(W,\Delta_W)$，表示 $\tau\colon\pi_1(T)\xrightarrow{\rho_T}\Aut(F,\Delta_F)\xrightarrow{\id_Z\times\bullet}\Aut(W,\Delta_W)$。

继续在 $T$ 的万有覆叠 $\widetilde T$ 上做底变换，记 $\widetilde{X}$、$\widetilde X'$ 等。把 $T$ 上的万有覆叠 $p_T\colon\widetilde T\to T$ 用作底变换，记 $\widetilde X$ 等。由定义，$\widetilde X\cong\widetilde T\times W$。这个交换图与 monodromy 的具体结构是"几乎积结构"的核心表达源。以此为起点，作者用 $\tau$ 与 $Z$ 的代数群结构给出 $X'\to T\times Z$ 上的"局部乘积"延拓，并证 $X'$ 上的纤维化 $X'\to T$ 是良好定义的，最终下降得 thm-reduction 的结论。

另有一处（arXiv_0909_2026.tex:991-995）：修正 BGL22 后证明不再依赖 Kollar 的 transcendental base-point-free 猜想（虽然该猜想近期已被 HX26 解决）。证明用 monodromy 与等变性作结构论证，不依赖该猜想成立。所以本文的下降论证即使在 HX26 之前也是完整独立的。

## 6 应用 I：均匀化与奇异 BBY 分解

**推论 1.2**（cor-main1，arXiv_0909_2026.tex:532-548）。在 thm-main 的设定下，存在有限 quasi-étale 覆叠 $\nu\colon X'\to X$ 与可能无限的 étale 覆叠 $p\colon X''\to X'$，使
$$(X'',\Delta'')\cong(F',\Delta'_{F'})\times Z\times\mathbb C^d,$$
其中 $\mathbb C^d$ 是复环面的万有覆叠，$Z$ 是严格 Calabi–Yau 与不可约全纯辛簇的乘积。

证明（arXiv_0909_2026.tex:10646-10757）。先取 $X$ 的有限 quasi-étale 覆叠使 $X$ 极大 quasi-étale，再用 thm-Q-factorialization 取小 $\mathbb Q$-可因子化 $q\colon X^{\text{\rm\tiny qf}}\to X$。先证 $(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})$ 的均匀化：由 thm-main 取得局部常值纤维化 $f_{\text{\rm\tiny qf}}\colon (X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})\to Y^{\text{\rm\tiny qf}}$；由 BGL22 Theorem A，存在有限 quasi-étale 覆叠 $T\times Z\to Y^{\text{\rm\tiny qf}}$，$T$ 复环面、$Z$ 是严格 Calabi–Yau 与不可约全纯辛簇的乘积。设 $\tau\colon X'\to X^{\text{\rm\tiny qf}}$ 是沿 $T\times Z\to Y^{\text{\rm\tiny qf}}$ 的底变换。Claim 2' 证 $\pi_1(Z)\to\pi_1(T\times Z)\xrightarrow{\rho}\Aut(F',\Delta'_{F'})$ 在有限 quasi-étale 覆叠下平凡；于是 $(X',\Delta')$ 在 $T\times Z$ 上乘积分解为 $(W,\Delta_W)\times Z$，$(W,\Delta_W)$ 在 $T$ 上有局部常值纤维化 $g$。再沿万有覆叠 $\mathbb C^d\to T$ 拉回得
$$(X'',\Delta'')\cong(F',\Delta'_{F'})\times Z\times\mathbb C^d.$$

然后把 $X'\to X$ 与 Stein 分解结合：$X'\to W\to X$（$W\to X$ 有限 quasi-étale，$X'\to W$ 小 bimeromorphic），再用 thm-reduction 下降得 $W$ 上均匀化。

**推论 1.4**（cor-bby，arXiv_0909_2026.tex:562-582）。在 thm-main 的设定下，再设 $\boldsymbol\beta=0$（即 $(X,\Delta)$ 是经典 klt 对、$K_X+\Delta$ 数值平凡）。则存在有限 quasi-étale 覆叠 $\nu\colon X'\to X$，使 $(X',\Delta')$ 有乘积分解
$$(X',\Delta')\cong(F',\Delta'_{F'})\times\prod_i Y_i\times\prod_j Z_j\times T,$$
每个 $Y_i$ 是严格 Calabi–Yau 簇、$Z_j$ 是不可约全纯辛簇、$T$ 是复环面。

证明（arXiv_0909_2026.tex:10760-10840）。先取 $X$ 的极大 quasi-étale 覆叠，再取强 $\mathbb Q$-可因子化 $q\colon X^{\text{\rm\tiny qf}}\to X$。$K_{X^{\text{\rm\tiny qf}}}+\Delta^{\text{\rm\tiny qf}}$ 也是数值平凡的（因 $q$ 是小 bimeromorphic）。由 thm-main 取局部常值纤维化 $f_{\text{\rm\tiny qf}}\colon(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})\to Y^{\text{\rm\tiny qf}}$。$X^{\text{\rm\tiny qf}}$ 强 $\mathbb Q$-可因子化蕴涵纤维化射影（CH24 Corollary 4.2），由 Amb05 Proposition 4.4 与 Theorem 4.7，作有限 quasi-étale 底变换后纤维化有分裂
$$(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})|_U\cong(F^{\text{\rm\tiny qf}},\Delta_{F^{\text{\rm\tiny qf}}})\times U$$
在 $Y^{\text{\rm\tiny qf}}$ 的 Zariski 开子集 $U$ 上。由纤维化局部平凡性，这个分裂延拓到全 $Y^{\text{\rm\tiny qf}}$：对每个小开集 $B$ 取局部平凡化 $\Phi_B$；在 $U\cap B$ 上 $\Phi_B$ 与乘积分解相差 meromorphic 映射 $\gamma_B\colon B\dashrightarrow\Aut(F^{\text{\rm\tiny qf}},\Delta_{F^{\text{\rm\tiny qf}}})$；由 Amb05 Theorem 4.2，$\kappa(K_{F^{\text{\rm\tiny qf}}}+\Delta_{F^{\text{\rm\tiny qf}}})=0$；由 Amb05 Proposition 4.6，连通自同构群是 abelian variety、不含有理曲线；$B$ klt 蕴涵 $\gamma_B$ 由 Fuj26 Corollary 1.4 / HM07 Corollary 1.7 延拓为 $B$ 上的态射；修正 $\Phi_B$ 后在重叠上拼装得
$$(X^{\text{\rm\tiny qf}},\Delta^{\text{\rm\tiny qf}})\cong(F^{\text{\rm\tiny qf}},\Delta_{F^{\text{\rm\tiny qf}}})\times Y^{\text{\rm\tiny qf}}.$$
最后对 $Y^{\text{\rm\tiny qf}}$ 应用 BGL22 Theorem A 得所求分解。

**Hacon–McKernan 型不等式**（cor-HM，arXiv_0909_2026.tex:594-617）。设 $(X,\Delta)$ 为 Kähler klt 对，$-(K_X+\Delta)$ 是 nef $\mathbb Q$-Cartier 除子。则 thm-main 的纤维化 $f\colon X\to Y$ 满足：(1) $\kappa(-(K_X+\Delta))\leqslant\kappa(-(K_F+\Delta_F))$；(2) $\nu(-(K_X+\Delta))=\nu(-(K_F+\Delta_F))$，其中 $\Delta_F:=\Delta|_F$。证明（arXiv_0909_2026.tex:10866-11040）用 prop-red 与 Proposition 5.3：先把 $\kappa$、$\nu$ 在有限 étale 覆叠下不变，再用 Proposition 5.3 的"扩展 step"。

## 7 应用 II：nef 反典范丛猜想与 Kodaira 问题

**Conjecture 1**（main-conj，arXiv_0909_2026.tex:476-489）。设 $X$ 是紧 Kähler 流形、反典范丛 $-K_X$ nef，则存在纤维化 $f\colon X\to Y$：(1) 局部常值纤维化；(2) 纤维 $F$ 有理连通；(3) 底 $Y$ 是 Calabi–Yau 流形。

历史背景（arXiv_0909_2026.tex:491-504）：Amb05、CH19、CCM19、Zhang05 等系列工作研究了 nef 反典范丛。然而反典范丛的 nef 性在双有理收缩或严格变换下不保持；反过来，其 nef 贡献可以以 nef b-对象的形式记入更高 birational 模型，自然导出"广义对"概念。一般地，若 $(X,\Delta)$ 是 log 对、$-(K_X+\Delta)$ nef，则取 $\boldsymbol\beta$ 为 $-(K_X+\Delta)$ 诱导的 nef b-$(1,1)$-电流（arXiv_0909_2026.tex:498-506），可把 $(X,\Delta)$ 视为 Calabi–Yau 型广义对。

**推论 1.3**（cor-conj，arXiv_0909_2026.tex:634-637）。Conjecture 1 成立。即任何紧 Kähler 流形 $X$、反典范丛 $-K_X$ nef，都有 Conjecture 1 所述分解。

证明要点（arXiv_0909_2026.tex:619-632）：在光滑射影框架下，CH19 用依赖于丰沛线丛存在的论证完成。但一般 Kähler 情形除 $\dim X=3$（MW25）和 $-K_X$ 半正（CDP15、DPS96）之外一直悬而未决。thm-main 在全一般情形（紧 Kähler 流形、nef 反典范丛）下证明该猜想。

**推论 1.5**（cor-kodaira，arXiv_0909_2026.tex:652-671）。设 $X$ 是紧 Kähler 流形、反典范丛 $-K_X$ nef，则存在从 $\mathfrak X$ 到 $\mathbb D$（$\mathbb D\subset\mathbb C$ 含 0 的开圆盘）的光滑纤维化满足：(1) 是 Kähler 纤维化；(2) 中心纤维 $\mathfrak X_0\cong X$；(3) 每个 $t\in\mathbb D$ 上的纤维 $\mathfrak X_t$ 的反典范丛 nef；(4) 存在 $\{t_k\}\subset\mathbb D$、$t_k\to 0$，使 $\mathfrak X_{t_k}$ 是射影的。

证明（arXiv_0909_2026.tex:12128-12162）结合 NW23 Theorem D 与 thm-main：MRC 纤维 $f\colon X\to Y$ 是局部常值纤维化（thm-main），在 FS90 Theorem 5.4 构造的极化 Calabi–Yau 流形的 coarse moduli 上构造 $X$ 的代数逼近 $\mathfrak Y\to\mathbb D$（Kähler 态射）；由 prop_flat-lcf 的证明，存在平坦向量丛 $E$ 在 $Y$ 上及相对嵌入 $X\hookrightarrow\mathbb P(E)$ over $Y$；$Y=\mathfrak Y_0\hookrightarrow\mathfrak Y$ 诱导 $\pi_1$ 同构，故 $E$ 延拓为 $\mathfrak E$ 在 $\mathfrak Y$ 上的平坦向量丛；通用覆叠 $\mathbb P(E)$ 上 $X$ 的定义方程不依赖 $Y$ 的点，定义射影 submersion $\mathfrak X\to\mathfrak Y$ via $\mathfrak X\hookrightarrow\mathbb P(\mathfrak E)$；最后 $\mathfrak Y\to\mathbb D$ Kähler、$\mathfrak X\to\mathfrak Y$ 射影的复合 $\mathfrak X\to\mathbb D$ 是 Kähler 态射。

这一结果给出 Kodaira 问题的肯定回答：紧 Kähler 流形能否通过形变被射影流形逼近（参见 Huy06）。更强地，反典范丛的 nef 性在形变中保持，形变由 Kähler 纤维化实现。

## 8 通用 nefness 与 Miyaoka–Yau 型不等式

**Cao-Păun 正性定理**（new positivity*，arXiv_0909_2026.tex:11520-11541）。设 $f\colon X\to Y$ 是紧 Kähler 流形间的纤维化，$\theta$ 是 $Y$ 上的 $d$-闭光滑 $(1,1)$-形，$L$ 是 $X$ 上的 $\mathbb Q$-线丛。设下列成立：(a) $L$ 有奇异 Hermite 范数 $h_L$ 满足 $\sqrt{-1}\Theta_{h_L}\geqslant f^*\theta$ 且 $\mathcal I(h_L)=\mathcal O_X$；(b) 一般纤维上的 $(K_X+L)|_{X_y}$ 伪有效；(c) 存在 Kähler 形 $\omega_X$ 与 $X$ 上的全纯 2-形 $\sigma$，使 $\omega_X+\sigma+\bar\sigma$ 代表有理上同调类且 $\sigma\rvert_{X_y}=0$（一般纤维上）。则 $K_{X/Y}+L-R(f)$ 是 $f^*\theta$-正曲率：存在 $T\in c_1(K_{X/Y}+L-R(f))$ 使 $T\geqslant f^*\theta$。

其中 $R(f)=\sum_i(m_i-1)W_i$ 为分歧除子（$W_i$ 映到真除子 $Z_i$）。

证明（arXiv_0909_2026.tex:11550-11585）依 CP25 Theorem 1.2 但改作解析版本：取一般点 $y\in Y$ 与邻域 $U$、$\theta=dd^c\varphi$；指标理想仍平凡；用 CP25 Lemma 3.3 与 Theorem 3.4 得 $f^{-1}(U)$ 上 $(K_{X/Y}+L)|_{f^{-1}(U)}$ 的最小奇异范数 $h_{\min,\varphi}$，半正曲率；这些局部范数不一定拼装，但 $h_{\min,\varphi}e^{-f^*\varphi}$ 在重叠上兼容，在 $X$ 的 Zariski 开集上拼装，曲率电流由下界 $f^*\theta$ 控制；用 Riemann 型延拓定理（与 Siu 分解）得全局 $T_0\in c_1(K_{X/Y}+L)$ 满足 $T_0\geqslant f^*\theta$；再以一般点的 Lelong 数处理 $R(f)$：$T_0-f^*\theta-[R(f)]\geqslant 0$；令 $T:=T_0-[R(f)]$ 即可。

**通用 nefness 定理**（nefness，arXiv_0909_2026.tex:11593-11608）。设 $(X,\Delta,\boldsymbol\beta)$ 为 Kähler 广义 klt 对、Calabi–Yau 型。设 $\mathcal Q$ 是切丛 $T_X$ 的 torsion-free 商。则对任意 Kähler 形 $\omega_1,\ldots,\omega_{n-1}$，设 $\alpha=\{\omega_1\wedge\cdots\wedge\omega_{n-1}\}$，有
$$c_1(\mathcal Q)\cdot\alpha\geqslant 0.$$

证明（arXiv_0909_2026.tex:11629-11917）分两段：(a) 用 thm-Q-factorialization 把问题化到 $X$ 强 $\mathbb Q$-可因子化情形；(b) 用反证法与 HN 滤过：设 $\mu_{\alpha,\min}(T_X)<0$，则 $T_X$ 有非平凡 HN 滤过 $0=\mathcal E_0\subsetneq\mathcal E_1\subsetneq\cdots\subsetneq\mathcal E_r=T_X$，$r\geqslant 2$；找最小 $k$ 使 $\mu_\alpha(T_X/\mathcal E_k)<0$，令 $\mathcal F:=\mathcal E_k$；slope 论证（CP19 Lemma 4.10）得 $\mathcal F$ 对李括号封闭，故 $\mathcal F\subset T_X$ 是 $X$ 上的叶状结构；取 resolution $\mu\colon X'\to X$，由 CP25 Corollary 1.5 推 $\mu^{-1}\mathcal F$ 代数可积、叶闭包有理连通；把 $\mathcal F$ 关联的有理映射 $f\colon X\dashrightarrow Y'$ 提升到紧 Kähler 流形 $Y'$，得 dominant rational map $g\colon Y'\dashrightarrow Y$；再取 modification $\pi\colon M\to X$ 解决 $f$、$\psi$ 的不定性，得交换图
交换图的箭头依次是 $\pi\colon M\to X$、$\phi\colon M\to Y$、$\tilde f\colon M\to Y'$、$f\colon X\dashrightarrow Y'$（虚线箭头，即尚未成为态射的有理映射）与 $g\colon Y'\to Y$；两条路径的相等关系是 $\tilde f=f\circ\pi$ 与 $\phi=g\circ\tilde f$。
由 $K_X\cdot\alpha>K_\mathcal F\cdot\alpha$ 推
$$K_M\cdot\pi^*\alpha=K_X\cdot\alpha>K_{\tilde{\mathcal F}}\cdot\pi^*\alpha=K_\mathcal F\cdot\alpha.$$
由 CP19 Lemma 5.12，$K_{\tilde{\mathcal F}}=K_{M/Y'}-R(\tilde f)-E$（$E$ 是 $\tilde f$-例外除子）；prop_bir-geometry-psi(b) 推 $E$ 也是 $\pi$-例外的；由 Ou25 Theorem 8.5，存在 $\omega_M$ 与全纯 2-形 $\sigma$ 使 $[\omega_M+\sigma+\bar\sigma]\in H^2(M,\mathbb Q)$；一般纤维 $F$ 有理连通故 $\sigma|_F=0$；CH24 Corollary 4.2 项目化准则推 $\tilde f$ 是射影的，存在 $\tilde f$-相对丰沛线丛 $L$。由 $\boldsymbol\beta_M$ 的 nef 性（来自 $-K_M-\Delta_M$ 加 $F_+$）和 $L$ 的相对丰沛性，可构造 $\mathcal L_m:=-K_M+(1/m)\lceil mF_+\rceil+(1/m)L$ 的范数 $h_m$ 满足
$$\sqrt{-1}\Theta_{h_m}\geqslant-(C/m)\tilde f^*\omega_{Y'},\quad\mathcal I(h_m)=\mathcal O_M.$$
$K_M+\mathcal L_m$ 在一般纤维上伪有效；由 Ou25 的全纯 2-形条件验证 new positivity* 的条件 (3)；由 new positivity* 得电流 $T_m\in c_1(K_{M/Y'}-K_M+(1/m)\lceil mF_+\rceil+(1/m)L-R(\tilde f))$ 满足 $T_m\geqslant-(C/m)\tilde f^*\omega_{Y'}$；令 $m\to\infty$ 得
$$-\tilde f^*K_{Y'}+F_+-R(\tilde f)$$
伪有效；进而 $K_{\tilde{\mathcal F}}-K_M+F_++E$ 伪有效；冲突于 $K_X\cdot\alpha>K_\mathcal F\cdot\alpha$，反证完成。

**Miyaoka–Yau 型不等式**（thm-second，arXiv_0909_2026.tex:12171-12197）。设 $X$ 是 $n\geqslant 2$ 维紧 Kähler 流形、反典范丛 nef。则 Miyaoka–Yau 型不等式
$$c_2(T_X)\cdot\{\omega_1\}\cdots\{\omega_{n-2}\}\geqslant 0$$
对任意 Kähler 形 $\omega_1,\ldots,\omega_{n-2}$ 成立。此外下列两条件等价：(1) 存在 Kähler 形 $\omega_1,\ldots,\omega_{n-2}$ 使 $c_2(T_X)\cdot\{\omega_1\}\cdots\{\omega_{n-2}\}=0$；(2) 存在有限 étale 覆叠 $\widetilde X\to X$ 使 $\widetilde X$ 同构于复环面或 $\mathbb P^1$-bundle over a complex torus；在后者情形，再换二重 étale 覆叠后等价于 $\widetilde X\cong\mathbb P(V)$（$V$ 是秩 2 向量丛，参 CP91 Lemma 7.4）。

证明（arXiv_0909_2026.tex:12199-12255）：射影情形由 Ou23 Corollary 1.5 基于 Miy87 Theorem 6.1 完成；紧 Kähler 情形由 nefness + Gieseker–Bogomolov 不等式 + Khovanskii–Teissier 不等式得。多极化情形用 CW24 Corollary 3.7 的 Gieseker–Bogomov 不等式与 Dem93 Proposition 5.2 的 Khovanskii–Teissier 不等式（或 Cao13 Proposition 6.2.1 的论证用 Gro90 Theorem 2.4.B 或 DN06 Theorems A、C）。

(2) ⇒ (1) 直接；只需 (1) ⇒ (2)。由 Ou23 Lemma 5.1（对 ample 类陈述但论证同样适用于 Kähler 类）：若一组 Kähler 类满足等式，则任何 Kähler 类组都满足。由 cor-kodaira，存在代数逼近 $p\colon\mathfrak X\to\mathbb D$ 是 Kähler 纤维化、含射影纤维序列收敛到中心纤维 $\mathfrak X_0\cong X$；取相对 Kähler 类，其在纤维上的限制记 $\alpha_t$；由前述观察 (1) 给出 $c_2(T_{\mathfrak X_0})\cdot\alpha_0^{n-2}=0$；此交数在形变下不变，故 $c_2(T_{\mathfrak X_t})\cdot\alpha_t^{n-2}=0$ 对每个 $t\in\mathbb D$；对任何射影纤维应用 Ou23 Theorem 1.8 得其增强不规则量 $\hat q\geqslant n-1$；增强不规则量在形变下不变，故 $\hat q(X)\geqslant n-1$，即 (2) 成立。
## 9 与本语料的接缝

D385、D447、D471 三篇语料稿在本语料内以 bib key `MatsumuraWangWuZhang2026` 引这篇论文（具体使用本稿的哪些主结论，由语料稿自身决定，本稿写手不读那些稿、不去查它们的位置串）。

本稿对语料可提供的回引接口为：

- 主定理 thm-main（arXiv_0909_2026.tex:405-426）：Kähler 广义 klt 对、Calabi–Yau 型 → 有限 quasi-étale 覆叠后局部常值纤维化（有理连通纤维 + Calabi–Yau 底）。语料稿若引用 $(X,\Delta,\boldsymbol\beta)$ 框架下的 BBY 型结构定理，这是首选条目。
- 局部常值纤维化定义 def-constant（arXiv_0909_2026.tex:1214-1252）：含 monodromy 表示 $\rho\colon\pi_1(Y)\to\Aut(F)$、水平分支、商表达。语料稿若需要"水平分支"或"monodromy 保持对"的精确说法，本稿给出定义说明。
- 命题 1.5 prop_flat-lcf（arXiv_0909_2026.tex:1342-1372）：把平坦直接像层翻译为局部常值纤维化。语料稿若讨论"由直接像平坦性推出 BBY 分解"，本命题是论证的关键节点。
- 推论 1.4 cor-bby（arXiv_0909_2026.tex:562-582）：𝛃=0 时 monodromy 在 quasi-étale 覆叠下可消，回到 BGL 风格的全局乘积分解（Calabi–Yau + 全纯辛 + 复环面）。
- 推论 1.2 cor-main1（arXiv_0909_2026.tex:532-548）：均匀化 $(X'',\Delta'')\cong(F',\Delta'_{F'})\times Z\times\mathbb C^d$。
- Hacon–McKernan 型不等式 cor-HM（arXiv_0909_2026.tex:594-617）：$\kappa$、$\nu$ 在全空间与纤维上比较。
- nef 反典范丛猜想 cor-conj（arXiv_0909_2026.tex:634-637）：在紧 Kähler 框架下全解决。
- Kodaira 问题 cor-kodaira（arXiv_0909_2026.tex:652-671）：Kähler 纤维化 + nef 在形变下保持 + 含射影纤维序列。
- 通用 nefness nefness（arXiv_0909_2026.tex:11593-11608）：$T_X$ torsion-free 商的 $c_1$ 在 Kähler 类乘积上非负。
- Miyaoka–Yau 不等式 thm-second（arXiv_0909_2026.tex:12171-12197）：$c_2(T_X)\cdot\{\omega_1\}\cdots\{\omega_{n-2}\}\geqslant 0$，等式情形的完整分类。

记号层面：通用对 $(X,\Delta,\boldsymbol\beta)$ 在本稿中按 arXiv_0909_2026.tex:1394-1504 的 def-gpairs 项；Kähler 形 $\omega$、Bott–Chern 上同调 $H^{1,1}_{\mathrm{BC}}(X)$、torsion-free 层的 reflexive hull $\mathcal E^{**}$、reflexive pullback $f^{[*]}$ 与 pushforward $\pi_{[*]}$ 等记法与 §2 一致；MRC 纤维化的相对嵌入在 §4 Step 1-3 中构造；Druel 定理的解析版与叶状结构的弱正则性在 §3 的 Lemma 3.4 中提及，本稿写手未直接取材该节（仅依 §3 中其他引理的间接引用）。语料稿若需要用到 Druel 定理在 Kähler 情形的解析推广，应直接查 arXiv_0909_2026.tex:sec-druel 节（写手本单不取材该节）。
