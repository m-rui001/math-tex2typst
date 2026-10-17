# 《A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Odd Characteristic》单篇素材

来源：论文 tex 源码（`E:/math/preprints/A-Counterexample-to-Kaplanskys-Direct-Finiteness-Conjecture-in-Odd-Characteristic-September-26-2026/build/`，paper.tex + sections/01–06 共 7 个文件，2026-09-26）、Lean 形式化 `E:/math/lean/OAI/Algebra/OddKaplansky/`（87 个文件，约 13000 行）+ 比较器 `E:/math/lean/ComparatorChallenges/OddKaplansky.json` + `formalization.yaml` 条目。公式按 tex 原样转写。标注 [推测] 的失败路线为基于文本证据的重构（本篇**没有**公开的思维链 summary——`E:/math/reasoning_traces/` 只有 `kaplansky-direct-finiteness-characteristic-two.pdf`，即特征 2 版的 23 页 summary；奇特征版的失败路线只能从论文文本的防御性措辞与 Lean 代码的平行结构反推，故本篇 [推测] 密度高于特征 2 素材，使用时需更加谨慎）。

姊妹篇素材：`E:/math/研究笔记/素材/Kaplansky-特征2-素材.md`（下称"char-2 素材"）。本篇的写法约定：与特征 2 版文字/机制相同或实质相同的部分快速引用并标注"同 char-2 §x"，奇特征特有的新机制逐引理展开。

---

## 一、定理与构造总览

### 1.1 主定理精确陈述

论文主定理（`sections/01-introduction.tex`，Theorem 1.1，TeX 原文照抄）：

> Put
> \[
>  m=\binom{1200}{600},\qquad
>  p=\min\{h\in\mathbb Z:h>1,\ h\mid(m!)^2+1\}.
> \]
> Then $p$ is an odd prime. There are a specified field $K$ of order $p^4$,
> a specified finitely generated group $G$ containing torsion, and specified
> finite sums $a,b\in K[G]$ satisfying $ab=1$ and $ba\ne1$.

即：Kaplansky 直有限性猜想（对每个域 $K$、每个群 $G$，$ab=1\Rightarrow ba=1$）在**一个指定的奇素数特征**处被否证。注意四个措辞细节：

1. **"specified"**："The word ``specified'' refers to finite formulas and choices in ordered finite sets. The field is a quadratic tower, the group is built from finitely many finite groups and explicit identifications, and the sums are defined without solving the word problem of that group. The construction is not claimed to have been evaluated as a practical computation. It concerns the displayed prime, not every odd prime."——与 char-2 版的 prescription 语言同源，但这里连 $p$ 本身都是"指定而未计算"的：$p$ 是 $(m!)^2+1$ 的最小素因子，$m=\binom{1200}{600}\approx 4\times 10^{359}$，$(m!)^2+1$ 的位数是天文数字，论文只用到 $p$ 的**存在性、素性、奇性、$p>m$、以及 $(m!)^2\equiv-1\pmod p$** 这几条形式性质，从不需要 $p$ 的数值。
2. **"containing torsion"** 而非 char-2 版的 "containing an element of odd prime order"——奇特征版的主定理对挠率的陈述**更弱**（虽然构造中 $G$ 明确含 $p$ 阶元：每个 $H_i$ 里的 $u(s)$，$s\ne0$，阶恰为 $p$）。
3. **"finitely generated"** 而非有限表现——与 char-2 版主定理口径一致（char-2 素材 §4.4：比较器只认证 FG 版；有限表现在旁边单独证）。奇特征版的 Lean `MainClaim` 同样只要求 `Group.FG`，且**没有** FP 附注定理（见四、4.2）。
4. 推论与 char-2 版同款：$K[G]$ 不稳定有限；由 Elek–Szabó 的 sofic 群稳定有限性定理反证 $G$ 非 sofic（intro 原话："Elek--Szab\'o's theorem implies, after the scalar construction is completed, that $G$ cannot be sofic"）；由第八节细胞自动机直接给出 $G$ 非 surjunctive（Gottschalk 猜想反例）。

### 1.2 与特征 2 版的关系：同骨架、异机制

论文 intro 的自我定位（TeX 原文照抄）：

> A separate characteristic-two construction uses incidence structures,
> polynomial pairings, a planar group-embedding argument, and character
> packing~\cite[Theorem~1.1]{OpenAICharacteristicTwo2026}.
> The construction here has a different local mechanism. A high-degree
> subspace of a modular translation representation is annihilated on one
> side; a weighted pairing gives a compatible annihilation on the other.
> The characteristic-two theorem is not an input to this odd-prime
> argument, and the two methods retain distinct coefficient hypotheses.

三句话划清边界：(i) **局部机制不同**——char-2 版的引擎是"低次多项式在整条仿射线上求和为零"+ 特征 2 让正则度 $D=\ell+1$ 作为标量消失；odd 版的引擎是"模平移表示的高次子空间单侧被湮灭"+ 对角加权配对给出另一侧相容湮灭。(ii) char-2 定理**不是**本文的输入——两篇是平行反例而非归约链。(iii) 系数假设互斥保留。

但两篇的**总骨架完全同型**，下表给出逐层对位（后续逐引理部分反复引用）：

| 层 | char-2 版（2026-09-23） | odd 版（2026-09-26） |
|---|---|---|
| 系数域 | $K=\F_{2^{217(\ell-1)}}$，$\ell=2^{21701}-1$（Mersenne/Linnik 路线） | $K=\F_{p^4}$，两层二次塔 $\F_p(\sqrt\eta,\sqrt[2]{\xi})$，$p=\operatorname{minFac}((m!)^2+1)$ |
| 本原根 | $\zeta$：阶 $\ell$（由 Fermat $\ell\mid 2^{h(\ell-1)}-1$ 保证存在） | $\zeta$：阶 $M=p^4-1=\lvert K^*\rvert$（本原元，"least element of order $M$"） |
| 组合图 | punctured affine space 上的正则围长 12 线族，$D=\ell+1$ | 三角形自由 threshold-Kneser 图 $\Gamma$（600-子集，邻接 = 交 $<200$） |
| 局部群 | $N$ 的子群 $K_v\cong(\Z/\ell)^2$、$L_f\cong(\Z/\ell)$，共享生成元粘合 | $H=A_0\rtimes P$（regular wreath），$U=u(P)$、$V=cUc^{-1}$，$U\cap V=\{1\}$ |
| 恒等式引擎 | 引理 3.1/3.2：全次数 $\le q-2$ 的多项式线和零和（特征 2 使 $D\cdot\sum W_v=0$ 与 $\sum W_v=-I_m$ 共存） | Jennings 增广过滤：高次列被 $(L_s-I)^\ell$ 湮灭（特征 $p$ 使 $X^p=0$，$\ell=(p-1)/2$ 是"半幂"） |
| 配对非退化 | Newton 插值的三角性（下集 $S_{d_0}$） | 对角加权 Gram $N_\lambda=B^{\mathsf T}D_\lambda^{-1}B$ 的 Cauchy–Binet 展开 + Schwartz/Zippel 乘积网格界 |
| 打包 | 多重 HNN 特征扭转 + 槽-型对 $(s,\alpha_v)$，中心幂等 $e$ 的 $e$-块 | Fourier 特征轨道块 $q_\lambda K[H]\cong\Mat_{p^3}(K)$，中心幂等 $f$ 的 $f$-扇区 |
| 矩形恒等式 | $UT=I_m$、$UP=U$、$PT=T$（子群平均 $P_v$） | $Y_iJ_i=fI_d$、$J_iY_i=P_iI_w$（扇区 $S=fK[G_1]$ 内） |
| 有序零积 | (3.12) $J_0C=eP$（同槽特征正交 $eQ_{\alpha_v}eQ_{\alpha_w}=0$） | 推论 3.5：$e_ie_j=0$ 对每条边 $i<j$（右零化子链 $e_i=qX^{p-\ell}$，$p-\ell=\ell+1$） |
| 维数悖论 | $m<t\le m\ell^2$（鸽笼打包预算 + 核非空预算） | $\dfrac tm<\dfrac1{100}<\dfrac1{96}<\dfrac dw$（拟合秩 vs 幂等秩的缝隙） |
| 缺陷侦测 | 标量特化 $\varepsilon$ + 秩论证：$X^{\mathsf T}X-I_t\ne0$（$t>m$） | 显式核证书：$u_*$（末坐标 $f$），$(B_RA_R-I_r)v_*=-v_*\ne0$ |
| 标量化 | 有限群 $F=(\Z/\ell)^m\rtimes S_m$ 的矩阵单位 $p_{ij}$，$\Phi:\Mat_m\to K[G]$ | 有限 Heisenberg 群 $\Lambda$（合成阶 $M$）的矩阵单位 $\Omega_{uv}$，$\Mat_n(K)\cong f'K[\Lambda]$ |
| 补身份 | $a_{\rm out}=1-f_{\rm blk}+\Phi(\cdot)$ | 引理 7.2（不要求 $g=\Phi(1)$ 中心）：$a=1_{\mathcal B}-g+\Phi(A)$ |
| 群嵌入证书 | 轨道配对置换作用（§3.2）+ 平面平衡图（围长 12，Euler 预算 $1/3+1/2+1/6$） | 轨道配对置换作用（§4 尾、§4a 首）+ 球面地图（$C(4)$–$T(4)$，短字 $\le3$，Euler 亏损 $4$–$4$–$8$） |
| 动力学 | 命题 6.2：$T_cx(g)=\sum c_ux(gu)$ | 命题 8.1：同一个 $T_c$，文字几乎逐句相同（同 char-2 §6/2.15） |

结论：**两篇共享"局部幂等元 + 图的低秩拟合/低次配对 + 矩形恒等式 + 严格维数不等式 + 一侧逆 + 有序零积 + 三明治/证书侦测反向缺陷 + 有限群矩阵单位标量化 + 细胞自动机"的九层骨架**（char-2 素材一、1.3 的装配顺序逐层有对应物），但每一层的**代数引擎**都换了：特征 2 版吃"奇阶挠率平均可逆 + 偶数正则度归零"，奇特征版吃"合成阶循环基座可对角化 + $p$-部幂零"。这正是作者需要单独一篇奇特征版的第一性理由（详见六、锚点 A1–A3）。

### 1.3 奇特征版自己的装配链（§1 intro 的三个过渡）

intro 用 "The proof has three transitions that numerical rank inequalities alone cannot justify" 明确标出三个非数值的过渡（TeX 原文照抄，编号为本文所加）：

1. **粘合的保真**："First, the quotient identifying the cyclic subgroups must retain the finite vertex groups. Its injectivity proof uses the $C(4)$--$T(4)$ graphical-complex mechanism described by Prytu\l a~\cite[Section~8]{Prytula2024}: local short-word restrictions and triangle-freeness rule out a spherical map with exactly one nontrivial face. Ordinary graph-of-groups normal form does not by itself establish this first quotient's injectivity. Section~\ref{sec:gluing} proves it locally, including the reductions for loops and bridges."——对应 §4（引理 4.1 + 命题 4.2，见二、2.10–2.11）。
2. **秩变恒等式**："Second, regular ranks must become identities over the same ring. A further group enlargement $G_1$ has a nonzero central idempotent $f$ in $R=K[G_1]$. In the ring $S=fR$, whose identity is $f$, the elements $P_i=fe_i$ admit rectangular matrices ... The finite-group blocks in this step have elementary abelian $p$-group stabilizers, possibly nontrivial and nonnormal. Their group algebras have nilpotent augmentation ideals, and a finite change of basis proves exact integer rank identities before coordinates are paired."——对应 §4a（命题 5.1，见二、2.12）。
3. **矩阵变标量**："Third, a matrix counterexample does not yet give two scalar elements of the same group algebra. In Section~\ref{op:compression-section}, the fit and the ordered zero products produce a split injection $S^{md}\longrightarrow S^{wt}\longrightarrow S^{md}$, $wt<md$, whose composite is the identity. ... Section~\ref{op:scalar-section} then implements the finite-factor reduction of Dykema--Juschenko. A finite Heisenberg group gives explicit matrix units..."——对应 §5–§6（引理 6.1/6.2 + 命题 7.1/7.2/推论 7.3，见二、2.13–2.17）。

外围约定（intro 尾部，全文有效）："All matrices below act on columns of free right modules. Matrix entries therefore multiply coordinates on the left. Transpose is ordinary transpose over $K$, with no involution. Cardinalities and dimensions in rank comparisons are integers, not elements of the coefficient field."——**没有对合**这一点与 char-2 版共享（char-2 素材 2.2(d) 路线 2 的"避免 $-1\ne1$ 论证"）；但在奇特征版里 $-1\ne1$ 是成立的，只是从未被用作对合，代之以"换位 + 无标量共轭"（§3.1 明确注明 "The transpose identity uses $L_{-s}^{\mathsf T}=L_s$; no scalar conjugation is present"）。

### 1.4 为什么"奇特征"可行——第一性理由的完整展开

这是理解全文的钥匙，先把机制彻底说透，后面引理的机械理由都从这里取材。

奇特征版把特征 $p$ 当作**两种互斥资源的同时供应者**：

- **资源 A（幂零性，吃特征 $p$）**：平移算子 $L_s$（$s\in P=(\F_p)^3$）满足 $L_s^p=I$，于是在特征 $p$ 中 $X_s:=L_s-I$ 满足 $X_s^p=L_s^p-I^p=0$（二项展开 $(1+X)^p=1+X^p$ 只在特征 $p$ 里塌缩——中间二项式系数 $\binom{p}{k}$ 被 $p$ 整除）。这让增广理想幂零、让"高次列"被 $(L_s-I)^\ell$ 湮灭（Jennings 过滤），是**入射/出射零积的供应器**。
- **资源 B（可逆性，吃 $p\nmid M$）**：$M=p^4-1$ 与 $p$ 互素，故 $M$、$M^{p^3}$、$n=M^q$ 在 $K$ 中全部可逆——Fourier 投影 $p_\chi^{A_*}=|A_*|^{-1}\sum_a\chi(a)^{-1}a$、Heisenberg 幂等 $f'$、分母 $1/n$ 全部合法。这让**特征基座 $(\Z/M\mathbb Z)^P$ 完全可对角化**，是"秩分数 $d/w>1/96$"与矩阵单位的供应器。

同一个群 $H=A_0\rtimes P$ 里，$A_0=(\Z/M\Z)^P$ 是 $p'$-部（可对角化），$P$ 是 $p$-部（幂零）——**半直积把两种资源装进一个有限群**。这与 char-2 版的组合"$\ell$ 奇保证 $\kappa=\ell^2$ 可逆 + 特征 2 保证 $D=0$"完全同构，但实现是颠倒的：char-2 版里可逆性服务于**平均幂等元**（$P_v=\kappa^{-1}\sum u$）、零性服务于**正则度消失**；odd 版里可逆性服务于**特征对角化**、零性服务于**列空间湮灭**。

再往下钻一层，三个"奇"字特有的小机制：

1. **$-1$ 是平方**：$p\mid(m!)^2+1$ 直接给出 $(m!)^2\equiv-1\pmod p$。这强制 $p\equiv1\pmod4$，且是两层二次塔存在的关键：$\F_p(\sqrt\eta)$ 中 $\xi$ 的范数是 $-\eta$，"$-1$ 平方 $\Rightarrow-\eta$ 非平方 $\Rightarrow$ $\xi$ 在 $K_0$ 中非平方 $\Rightarrow$ 第二层商是域"。在特征 2 中 $-1=1$ 自动是平方，这个论证退化——char-2 版根本不需要域塔（$K=\F_2[Z]/(g)$ 一次到位）。
2. **$\ell=(p-1)/2$ 的极值性**（详见二、2.9 的机械理由）：湮灭指数 $\ell$ 必须满足 $\ell\le p/2$（边零链 $e_i=qX^{p-\ell}$ 需要 $p-\ell\ge\ell$ 才能从 $X^{p-\ell}e_j$ 中分离出 $X^\ell e_j=0$），取 $\ell=\lfloor p/2\rfloor=(p-1)/2$ 使高次列数 $h=\binom{\ell+2}{3}$ 最大、秩分数最大。**奇性把 $\ell$ 的上限卡在 $(p-1)/2$ 而非 $p/2$**——这是"奇"直接进入常数的地方。
3. **合成阶 $M$ 的 Fourier**：$M=p^4-1$ 是偶合数，但正交性 $\sum_y\zeta^{y\cdot a}=0$ 的平移论证只要求 $\zeta$ 阶**恰为** $M$（§6 原文："The argument still works when $a_j$ is a zero divisor modulo the composite integer $M$"）——本原性而非素性是全部所需。char-2 版的 $\ell$ 是素数，从不需要面对这个问题。

### 1.5 论文章节结构与本文索引

| 章节 | 文件 | 内容 | 本文索引 |
|---|---|---|---|
| §1 | 01-introduction.tex | 定理、背景、三过渡 | 一 |
| §2 | 02-finite-data.tex | 域、图、局部群（引理 2.1、命题 2.2） | 二、2.1–2.4 |
| §3 | 03-modular.tex | 大幂等元 + 有序湮灭（命题 3.2、引理 3.3、推论 3.5） | 二、2.5–2.9 |
| §4 | 04-gluing.tex | 粘合不塌缩（引理 4.1、命题 4.2） | 二、2.10–2.11 |
| §4a | 04a-sector.tex | 中央扇区（命题 5.1、引理 5.2） | 二、2.12 |
| §5 | 05-compression.tex | 压缩 + 证书（引理 6.1、6.2） | 二、2.13–2.14 |
| §6 | 06-scalar-cellular.tex（前半） | Heisenberg 编码（命题 7.1、引理 7.2、推论 7.3、主定理证明） | 二、2.15–2.17 |
| §7 | 06-scalar-cellular.tex（后半，`\section` 编号续） | 细胞自动机（命题 8.1） | 二、2.18 |

注意 tex 文件的物理划分与逻辑章节号有错位：`06-scalar-cellular.tex` 内含 §6（An injective finite-group encoding）与 §7（The cellular automaton on all configurations）两个 `\section`；`04a-sector.tex` 的逻辑编号是 §5（Realizing the local ranks in a common central sector）。下文引用一律按逻辑章节号。

---

## 二、逐引理带批注重构

每条引理四样东西：(a) TeX 原文照抄；(b) 不跳步推导；(c) 假设/常数的机械性理由；(d) 2–3 条 [推测] 失败路线。

### 2.1 引理 2.1（域的构造：两层二次塔）

**(a) 陈述**（`sections/02-finite-data.tex`，Lemma 2.1 `op:field`，TeX 原样）：

> For $m,p$ in Theorem~\ref{op:main}, $p>m$ is an odd prime and $-1$
> is a square in $\F_p$. If $\eta$ is a nonsquare in $\F_p^*$, then
> \[
>  K_0=\F_p[\xi]/(\xi^2-\eta),\qquad
>  K=K_0[\nu]/(\nu^2-\xi)
> \]
> are quadratic field extensions, so $|K|=p^4$.

**(b) 不跳步推导**：

- *最小素因子是素数*：设 $p$ 是某整数的大于 1 的最小因子。若 $p$ 合数，它有非平凡真因子 $d$（$1<d<p$），而 $d$ 整除原数，与最小性矛盾。论文原话："A least divisor greater than one of an integer is prime: any nontrivial proper divisor of a composite least divisor would be smaller."
- *$p>m$*：若 $p\le m$，则 $p\mid m!$（$m!$ 含因子 $p$），而 $p\mid(m!)^2+1$，两式相减得 $p\mid 1$，矛盾。故 $p>m>600$。
- *$-1$ 是平方*：$p\mid(m!)^2+1$ 在 $\F_p$ 中就是 $(m!)^2=-1$，见证元是 $\overline{m!}\in\F_p^*$。
- *非平方存在*：$\F_p^*$ 的平方映射 $x\mapsto x^2$ 的像中每个元素恰有两个平方根（$x$ 与 $-x$，$p$ 奇故 $x\ne-x$），故平方元恰占一半，非平方存在。论文："There are nonsquares because each nonzero square has exactly two square roots."
- *第一层是域*：$\eta$ 非平方 $\Rightarrow$ $X^2-\eta$ 在 $\F_p[X]$ 中无根 $\Rightarrow$（二次多项式）不可约 $\Rightarrow$ $K_0$ 是二次域。
- *第二层是域*：$K_0$ 中 $\xi$ 的共轭是 $-\xi$，故范数 $N_{K_0/\F_p}(\xi)=\xi\cdot(-\xi)=-\eta$。由 $-1$ 是平方且 $\eta$ 非平方，$-\eta$ 非平方（平方乘平方是平方）。若 $\xi$ 在 $K_0$ 中是平方，其范数 $-\eta$ 必是 $\F_p$ 中的平方（范数把平方映到平方：$N(ab)=N(a)N(b)$）——矛盾。故 $X^2-\xi$ 在 $K_0$ 上不可约，$K/K_0$ 是二次域。$|K|=p^2\cdot p^2=p^4$。

**(c) 假设/常数的机械理由**：

- $p$ 的定义式 $\min\{h:h>1,\ h\mid(m!)^2+1\}$ 一石三鸟：素性（最小因子论证）、奇性（$(m!)^2+1$ 是奇数——$m!\,$偶，平方是偶的平方还是偶……更准确地说 $(m!)^2+1$ 是奇数，故最小素因子 $\ge3$）、$-1$ 平方（见证元免费赠送）。$p>m$ 是副产品，后面处处用来保证 $\{1,\dots,m\}$ 的元素在 $\F_p$ 中两两不同（边的 Vandermonde 论证）。
- **两层**二次塔而非一层四次：$\zeta$ 需要阶 $M=p^4-1$，即 $K$ 必须恰好是 $\F_{p^4}$；两层二次让"每次只需验证一个二次多项式不可约"，而第二次的不可约性靠**范数论证**（$-\eta$ 非平方）从第一次免费推出——这是 $-1$ 平方这个礼物的兑现点。一层直接找四次不可约多项式需要 $X^{p^4}-X$ 的分解理论或显式多项式，没有这么便宜的传递结构。
- $\eta$ 取"最小非平方"（代表元 $0,\dots,p-1$ 的序）：纯粹为 prescription 的确定性服务，数学上任意非平方皆可。Lean 对应：`QuadraticTower.nonsquareIndex`（`Nat.find`）与 `eta`。
- $K$ 的序：按 $(1,\xi,\nu,\xi\nu)$ 系数的字典序（$\xi\nu$ 基，$K$ 作为 $K_0$-二维即 $\{1,\nu\}$、$K_0$ 作为 $\F_p$-二维即 $\{1,\xi\}$，张量基是 $(1,\xi,\nu,\xi\nu)$）——供 $\zeta$ 的"最小阶 $M$ 元"与后续所有有限选择规范化。Lean 对应：`CoefficientOrder.fieldOrder`、`coefficientTuple : CoeffField p hp ≃ₗ (Fin 4 → ZMod p)`。

**(d) 候选失败路线**：

- 用 $\F_{p^2}$ 就够 [推测]：不行——$\zeta$ 的阶必须 $\ge M=p^4-1$（$\zeta$ 要给 $(\Z/M\Z)^P$ 的全部特征提供值，指数模 $M$ 读数），$|K^*|=p^2-1<p^4-1$ 装不下。证据：$M=p^4-1$ 的定义与 $|K|=p^4$ 严格锁定，§2 的 $\zeta$ 存在性论证用 root bound $M\le b$ 逼出阶恰为 $M$。
- 取 $\eta$ 为任意预给非平方而非最小者 [推测]：数学上无损，但"specified"要求 finite formulas；Lean 里 `nonsquareIndex = Nat.find` 恰好同时给出存在性与最小性证书，任意选取需要额外的选择公理记账（permitted axioms 只有 propext/Quot.sound/Classical.choice，Classical 允许但会让 prescription 变弱）。
- 跳过 $-1$ 平方、直接断言第二层是域 [推测]：断链——$-\eta$ 的非平方性依赖 $-1$ 是平方；若 $p\equiv3\pmod4$（$-1$ 非平方），两层塔的第二步一般失败（$-\eta$ 可能变平方）。这也是构造**必须**选 $p\mid(m!)^2+1$ 型素数而非任意大素数的深层原因。

### 2.2 $\zeta$ 的存在性（§2 无编号段落）

**(a) 陈述**（TeX 原样）：

> Put $M=p^4-1$ and
> choose the least element $\zeta\in K^*$ of order $M$. This element
> exists: if $b$ is the least common multiple of all orders in $K^*$,
> then $b\mid M$, while the root bound for $X^b-1$ gives $M\le b$.

**(b) 推导**：$K^*$ 是 $M$ 阶循环群（有限域乘法群），本原元存在是标准事实，但论文给了一个**不引用循环性**的自足论证：令 $b=\mathrm{lcm}\{$各元素阶$\}$。其一，每个元素的阶整除 $|K^*|=M$（Lagrange），故 $b\mid M$。其二，若 $M<b$，则 $X^b-1$ 在 $K$ 中有至少 $M$ 个根（每个元素的阶整除 $b$，故都是根），但 $b$ 次多项式至多 $b$ 个根且根数 $M<b$ 矛盾……准确地说 root bound 给 $M\le b$。其三，对 $b$ 的每个素数幂因子 $q^e\|b$，取一个阶被 $q^e$ 整除的元素，其适当幂有阶恰 $q^e$；把所得的两两互素阶的交换元素相乘得阶 $b$。故 $b=M$，即存在 $M$ 阶元。"In particular, $M$ and all its powers are invertible in $K$."（$p\nmid M$。）

**(c) 机械理由**：这条论证同时供应三样东西——$\zeta$ 的存在（Fourier 的基础）、$M$ 的可逆性（所有分母 $|A_*|^{-1}$ 的合法性）、以及 $\zeta$ 的**规范性**（"least element"用 $K$ 的序）。root bound $M\le b$ 的形式是"多项式根数 $\le$ 次数"在有限域里的用法，与 char-2 版 prescription 第 (3) 步的 Fermat 论证（$\ell\mid 2^{\ell-1}-1\Rightarrow\ell\mid|K^\times|$，循环群取元）功能相同但路径不同。Lean 对应：`FiniteChoice.exists_primitive`（对任意有限域证明 $\exists\zeta,\ \mathrm{IsPrimitiveRoot}\,\zeta\,(\mathrm{card}-1)$）+ `FiniteChoice.primitive = first (...)`（最小元）；`Main.lean` 的 `zeta_primitive` 把它与 $M=p^4-1$ 拼接（`zeta_le` 证明它还是**最小**的本原根）。

**(d) 候选失败路线**：

- 直接引用"$K^*$ 循环、取生成元" [推测]：Mathlib 有该定理，但"least element of order $M$"需要把存在性转成有序选择；Lean 的 `FiniteChoice.first` 模式（candidates 非空 + min'）就是为此。论文不用循环性的措辞可能正是为了规避"生成元不唯一"的规范化负担。
- 用 $\zeta^{M/2}=-1$ 型部分根 [推测]：阶 $M/2$ 的元素不够给 $\Z/M$ 全体指数特征赋值——特征 $\chi$ 的值域要 $\zeta^{\mathbb Z/M}$ 覆盖全部 $M$ 个指数，$M$ 阶是下界。

### 2.3 命题 2.2（图与拟合分解）——$t/m<1/100$ 的诞生

**(a) 陈述**（Proposition 2.2 `op:graph`，TeX 原样）：

> The graph $\Gamma$ is triangle-free and has a specified fitting
> factorization $F_{ij}=\sum_{T\in\mathcal T}\alpha_i(T)\beta_j(T)$
> over $\F_p$ with $t/m<1/100$.

数据（§2 正文，先于命题）：$I_1,\dots,I_m$ 是 $[1200]$ 的 600-子集按序枚举（$m=\binom{1200}{600}$）；$\Gamma$ 中相异 $i,j$ 邻接当且仅当 $|I_i\cap I_j|<200$；$\mathcal T=\{T\subseteq[1200]:|T|\le400\}$，$t=\sum_{j=0}^{400}\binom{1200}{j}$。"A matrix $F$ \emph{fits} a simple graph when $F_{ii}=1$ and $F_{ij}=0$ for distinct nonadjacent vertices"（intro 的定义）。

**(b) 不跳步推导**：

- *三角形自由*：设 $I_a,I_b,I_c$ 两两邻接，即两两交 $<200$、即 $\le199$。容斥：$|I_a\cup I_b\cup I_c|=1800-(|I_a\cap I_b|+|I_b\cap I_c|+|I_a\cap I_c|)+|I_a\cap I_b\cap I_c|\ge1800-3\cdot199+0=1203>1200$——但并集在 $[1200]$ 中，矛盾。论文："Three pairwise adjacent sets would have union of size at least $3\cdot600-3\cdot199=1203$, exceeding $1200$."
- *拟合的构造*：$\alpha_i(T)=1$ 若 $T\subseteq I_i$，否则 0。$\beta_j(T)$ 定义为多项式
  $$Q_j(X)=\prod_{k=200}^{599}\frac{\sum_{x\in I_j}X_x-k}{600-k}$$
  展开后 $\prod_{x\in T}X_x$ 的系数，并把每个单项式的正指数**归一**（"replacing every positive exponent in each monomial by one"，即 $X_x^r\mapsto X_x$ 对 $r\ge1$）。三个逐条检验：
  - *分母可逆*：$600-k\in\{1,\dots,400\}$，而 $p>m\ge1200>400$，故分母在 $\F_p$ 中非零。
  - *归一保持 0-1 求值*：在 $X_x\in\{0,1\}$ 上 $X_x^r=X_x$（$r\ge1$），故 $Q_j$ 与其归一化在 0-1 向量上取值相同；且归一不升全次数（每单项式指数只降）。
  - *乘积求值*：$F_{ij}=\sum_T\alpha_i(T)\beta_j(T)$ 在 $X=\mathbf 1_{I_i}$（$I_i$ 的指示向量）处等于 $Q_j(\mathbf 1_{I_i})$（$\alpha_i$ 挑出 $T\subseteq I_i$ 的项，恰是归一化多项式在该点的单项式展开……准确地说：归一化后的 $Q_j$ 在 0-1 点 $v$ 的值 $=\sum_{T\subseteq\mathrm{supp}(v)}\beta_j(T)$，而 $\alpha_i(T)=[T\subseteq I_i]$ 恰好做这个筛选）。代入：
    $$F_{ij}=\prod_{k=200}^{599}\frac{|I_i\cap I_j|-k}{600-k}.$$
  - *对角*：$i=j$ 时 $|I_i\cap I_i|=600$，每个因子 $(600-k)/(600-k)=1$，积为 1。
  - *非边*：相异非邻接即 $|I_i\cap I_j|\in[200,599]$，某个 $k=|I_i\cap I_j|$ 出现在乘积里，该因子为 0。（注意 $|I_i\cap I_j|\le599$ 因为 $I_i\ne I_j$。）
- *比率界*：二项式系数到下标 400 递增，故 $t\le401\binom{1200}{400}$，而
  $$\frac{\binom{1200}{400}}{\binom{1200}{600}}=\prod_{u=401}^{600}\frac{u}{1201-u}.$$
  于是
  $$\frac tm\le401\prod_{u=401}^{600}\frac{u}{1201-u}\le401(5/7)^{100}<\frac1{100}.$$
  细节："In the second inequality the first hundred factors are at most $500/701<5/7$ and the rest are at most one."（$u=401,\dots,500$ 时分子 $\le500$、分母 $=1201-u\ge701$；$u>500$ 时分子 $\le$ 分母？$u>500$ 给 $u<1201-u\iff u<600.5$，成立。所以只有前 100 个因子 $>1$。）"The last inequality follows from $(5/7)^3<1/2$ and $40100<2^{33}$."：$(5/7)^{99}<2^{-33}$，$401\cdot(5/7)^{100}<401\cdot\frac57\cdot2^{-33}<40100\cdot2^{-33}<2^{16}\cdot2^{-33}=2^{-17}<\frac1{100}$（等价地 $40100\cdot(5/7)^{100}<1$）。

**(c) 假设/常数的机械理由**：

- **1200/600/200/400 四元组互相锁定**：600-子集是"半数"；邻接阈值 200 = $600-400$，使非边的交 $\ge200$ 而拟合多项式的零点窗 $[200,599]$ 恰好覆盖非边；$|T|\le400$ 让 $t$ 只数"前 401 个二项式系数"，比率 $\approx401\cdot(5/7)^{100}$。若把阈值换成 300，$t/m\approx401\cdot\prod_{u=301}^{600}u/(1201-u)$，因子 $u/(1201-u)\le\frac{300}{901}\cdot\dots$ 组合出来仍 $<1/100$ 吗？粗算 $\prod_{u=301}^{600}\frac{u}{1201-u}=\frac{\binom{1200}{300}}{\binom{1200}{600}}\approx\frac{2^{1200\cdot H(1/4)}}{2^{1200}}$ 量级（$H(1/4)\approx0.811$），$t/m\approx401\cdot2^{-227}$ 更小——所以 200 不是唯一可行值，但 200 让"非边 ⟺ 零点窗命中"最干净且使 $|I_i\cap I_j|\le199$ 的容斥（$1203>1200$）有 3 的余量。**真正不能动的是 $400=600-200$ 的对偶**：$\beta$ 多项式的次数 $599-200+1=400$ 与 $|T|\le400$ 必须一致，$t$ 才只数低维单项式。
- $F$ 的取值在 $\{0,1\}$ 向量上、按 $\alpha/\beta$ 分解为 $t$ 个秩一贡献——这就是 intro 说的 "This is an explicit threshold-Kneser instance of the polynomial constructions of Haviv and Golovnev--Haviv ... whose polynomial ancestry includes Alon--Babai--Suzuki"。threshold-Kneser 图（jagged/aligned 集族的补图结构）的 fitting number 有多项式上界，这里给了**显式**分解与**显式**计数。
- $t/m$ 与 $d/w$ 的缝隙（$\frac1{100}<\frac1{96}$）在 §5 兑现：$wt<md\iff t/m<d/w$。两个分数都刻意取得宽松（100 与 96 只差 4%），因为两端各自有裕量（$(5/7)^{100}$ 与 $\frac{h}{2p^3}>\frac1{96}$），缝隙是白送的保险。
- Lean 对应：`GraphEdges`（Vertex = 600-子集subtype、Edge、Inc、incidence_girth：`8 ≤ egirth`——**incidence 图**即二部细分图，$\Gamma$ 的 4-圈对应细分后 8-圈，三角形自由 ⟹ 细分围长 $\ge8$，这是 §4 粘合判据的围长假设的来源）；`GraphNumerics`（`ratio_bound : 100 * (∑ j ∈ Finset.range 401, binom j) < binom 600`，纯 `Nat` 论证用 `choose_step`/`choose_growth`）；`SourceFit`（`Slot`、`polynomial j : MvPolynomial (Fin 1200) K`、`alpha`、`beta = BooleanPolynomial.coefficient`、`fitting_eq`、`fitting_diagonal`、`fitting_nonedge`、`ratio_bound`）；`BooleanPolynomial`（`coefficient f T` 取"0/1 化单项式系数"、`bool_power_product`、`evaluate`——归一保持 0-1 求值的形式化）。

**(d) 候选失败路线**：

- 用 Frankl–Wilson/Alon–Babai–Suzuki 的**维数下界**代替显式分解 [推测]：那些定理给" fitting number $\ge$ 某下界"，但压缩层需要的是**上界** $t/m<1/100$ 且分解必须是**显式有限和**（$\alpha,\beta$ 要进 $\Mat_{t\times m}$ 的元素）；下界型定理给不出可写入矩阵的 $\beta_j(T)$ 表。证据：论文引用 Haviv/Golovnev–Haviv 的 Proposition 13/Theorem 3.2（构造性方向）而非 ABS 的下界。
- 对称化分解（要求 $F_{ij}=F_{ji}$ 且双向零积）[推测]：拟合本身对称，但 §5 压缩的三角结构依赖"$D_0C_0=\mathcal P+\mathcal N$、$\mathcal N$ 严格下三角"，而严格下三角来自**只有** $i<j$ 的边零积——对称化会让 $\mathcal N$ 变满矩阵，$\mathcal N^m=0$ 失效。证据：intro "The asymmetry is what allows a triangular calculation to combine the two strict bounds."
- 把 $\beta_j$ 的"指数归一"换成截断 [推测]：截断（丢掉次数 $>400$ 的项）会破坏 0-1 求值等式——归一是唯一保持 0-1 求值又不升次数的化简（$X^r\mapsto X$ 在 $\{0,1\}$ 上恒等）。证据：BooleanPolynomial.lean 的 `evaluate` 引理以 `f.totalDegree ≤ n` 为前提，说明归一后的次数控制是形式化必需。

### 2.4 局部群 $H=A_0\rtimes P$ 与 $U\cap V=\{1\}$（§2 尾部，无编号定义）

**(a) 定义**（TeX 原样）：

> For the local algebra define the additive group $P=(\F_p)^3$, the
> function group $A_0=(\mathbb Z/M\mathbb Z)^P$, and
> \[
>  H=A_0\rtimes P,\qquad
>  (a,s)(a',s')=(a+s\cdot a',s+s'),\qquad
>  (s\cdot a)(x)=a(x-s).
> \]
> Its order is $w=M^{p^3}p^3$. Let $c\in A_0$ have value one at zero and
> zero elsewhere, and put
> \[
>  u(s)=(0,s),\quad U=u(P),\qquad
>  v(s)=cu(s)c^{-1},\quad V=cUc^{-1}.
> \]
> The coordinate formula $v(s)=(c-s\cdot c,s)$ gives $U\cap V=\{1\}$,
> because $c-s\cdot c\ne0$ when $s\ne0$.

**(b) 推导**：

- *半直积律*：$s\cdot a$ 是"平移指标"（把函数 $a:P\to\Z/M$ 平移 $-s$），$s\mapsto(s\cdot)$ 是 $P$ 在 $A_0$ 上的自同构作用（保持逐点加法），半直积乘法 $(a,s)(a',s')=(a+s\cdot a',\ s+s')$ 结合性由作用律 $(s+t)\cdot a=s\cdot(t\cdot a)$ 保证。$|H|=|A_0|\cdot|P|=M^{p^3}p^3$。
- *$c$ 与 $V$*：$c$ 是"在 $0$ 取 1 其余取 0"的 delta 函数（注意 $\Z/M$ 里的"1"）。$v(s)=cu(s)c^{-1}$：直接计算，$u(s)=(0,s)$，共轭得 $v(s)=(c-s\cdot c,\ s)$（共轭公式 $(b,1)(0,s)(b,1)^{-1}=(b-s\cdot b,\ s)$——核对：$(b,1)(0,s)=(b,s)$；$(b,s)(-b,1)=(b-s\cdot(-b)\dots)$ 等一下，仔细算：$(b,1)^{-1}=(-b,1)$；$(0,s)(b,1)=(0+s\cdot b,\ s)=(s\cdot b,s)$；$(b,1)(s\cdot b,s)=(b+s\cdot b,s)=( (1+s)\cdot b,s)$？不对——$(a,s)(a',s')=(a+s\cdot a',s+s')$，故 $(b,1)\cdot(s\cdot b,\ s)=(b+1\cdot(s\cdot b),\ 1+s)=(b+s\cdot b,\ s)$。而 $b+s\cdot b$ 在 $x$ 处取值 $b(x)+b(x-s)$，$b=c$ 时 $c(x)+c(x-s)=\delta_0(x)+\delta_0(x-s)=\delta_0(x)+\delta_s(x)$，即"在 0 与 $s$ 处取 1"的函数，不是 $c-s\cdot c$。让我重算：$v(s)=cu(s)c^{-1}=(c,1)(0,s)(c,1)^{-1}$。$(c,1)(0,s)=(c+1\cdot(s\cdot0),\ 1+s)=(c,\ s)$？$s\cdot0=0$（作用在零函数上），所以 $(c,1)(0,s)=(c,s)$。$(c,s)(-c,1)=(c+s\cdot(-c),\ s)=(c-s\cdot c,\ s)$。✓ 与论文一致。$c-s\cdot c$ 在 $x$ 处取值 $c(x)-c(x-s)=\delta_0(x)-\delta_s(x)$：在 0 取 1、在 $s$ 取 $-1$、其余 0。
- *$U\cap V=\{1\}$*：$u(s)=(0,s)$，$v(t)=(c-t\cdot c,\ t)$。相等要求 $s=t$（第二坐标）且 $c-s\cdot c=0$（第一坐标）；$s\ne0$ 时 $c-s\cdot c$ 在 0 处取 $1-0=1\ne0$（在 $\Z/M$ 中），故 $s=0$。更一般地（论文只用这个特例，但 §4 的短字论证用）：$u(s)v(t)=1$ 或 $v(t)u(s)=1$ 同理逼 $s=t=0$。Lean 的 `LocalGroup.v_eq_u` 正是这个：`v p M x = u p M y → x = 1 ∧ y = 1`，证明用 `(z.left 1).toAdd = 1` 与 `M ∣ 1` 矛盾。
- *$u(s)$ 的阶*：$p$（$P$ 是加法 $(\F_p)^3$ 写成乘法）。$v(s)$ 同阶（共轭保持阶）。**这是 $G$ 挠率的来源**：$G$ 含每个 $H_i\le G_0\le G_1\le G$，含 $p$ 阶元 $u(s)$，$s\ne0$。

**(c) 机械理由**：

- **为什么用函数群 $A_0=(\Z/M)^P$ 而非更小的模**：$A_0$ 的特征群是 $(\Z/M)^P$（指数表），秩 $p^3$——每个坐标函数 $b_x$ 给一个独立指数，Fourier 基 $p_\chi$ 有 $|A_0|=M^{p^3}$ 个，$\zeta$ 的阶 $M$ 恰好够给所有指数赋值。$A_0$ 大是"秩分数 $d/w$ 分母大"的代价（$w=M^{p^3}p^3$），换来的是 $d$ 的分子 $h\cdot p^3\cdot|\mathscr R|$ 里 $|\mathscr R|>|A_0|/(2p^3)$ 的**比例**增长——$d/w$ 只依赖比例，$M^{p^3}$ 在分子分母间消掉。这是"奇特征版用指数大的群买比例"的设计，与 char-2 版用 $|V|=t$ 个子群平均买 $t/m$ 同型。
- **为什么 $P=(\F_p)^3$ 恰好三维**：Jennings 列空间的高次切片数 $h=\binom{\ell+2}{3}$ 需要维数 3（三维的单项式计数给出 $\frac{h}{p^3}\to\frac{1}{48}$ 的正确常数）；2 维给 $\binom{\ell+1}{2}/p^2\to\frac18$（更大！但……见 (d)）；4 维给 $\binom{\ell+3}{4}/p^4\to\frac1{384}$（更小）。等等——3 维是使 $\frac{\binom{(p-1)/2+2}{3}}{p^3}=\frac{(p-1)(p+1)(p+3)}{48p^3}>\frac1{48}$ 成立的**最小**维数；2 维的话 $h=\binom{\ell+1}{2}=\frac{(p-1)(p+1)}{8}$，$\frac{h}{p^2}\to\frac18>\frac1{48}$ 更大，那为什么不用 2 维？因为 $P$ 还要当**边的方向空间**用：§4 的边同态把 $C_p$ 嵌入 $U$ 或 $V$，短字条件需要"任意 $\le3$ 个相异方向的向量线性无关"——2 维空间里 3 个方向必相关，三音节短字条件失效；3 维恰好允许 Vandermonde 行列式 $(\bar j_2-\bar j_1)(\bar j_3-\bar j_1)(\bar j_3-\bar j_2)\ne0$。**3 = 短字长度上限**。这是"C(4)–T(4) 短字长度 3"向群参数的传导。
- $c$ 的选择（delta at 0）：$v(s)=(c-s\cdot c,s)$ 的第一坐标在 $s\ne0$ 时非零，**只需 $c$ 不是平移不变的**——delta 是最简 witness。$V\ne U$（否则 $U\cap V=U\ne\{1\}$）正是边同态能区分两侧的前提。
- Lean 对应：`LocalGroup.lean`——`LocalGroup p M := RegularWreathProduct (Multiplicative (ZMod M)) (Multiplicative (Fin 3 → ZMod p))`（Mathlib 的 regular wreath = 函数群 $A_0\rtimes$ 顶群 $P$，与论文记号一致）；`u = RegularWreathProduct.inl`、`c = ⟨fun x => if x.toAdd = 0 then 1 else 0, 1⟩`、`v = (MulAut.conj c).toMonoidHom.comp u`；`v_eq_u` 即 $U\cap V=\{1\}$；`direction j = ![1, j, j²]`、`line j : ZMod p →+ Point p`、`edgeHom outgoing j = (if outgoing then v else u) ∘ line j`；`two_directions`/`three_directions` 用 `linear_combination` 验证 Vandermonde 型行列式（`a*(x-y)*(x-z) ≠ 0` 型恒等式），`edge_word_one/two/three` 就是短字条件的局部内容。

**(d) 候选失败路线**：

- 取 $P=(\F_p)^2$ [推测]：$h/p^2\to1/8$ 秩分数更大，但**三音节短字失败**（2 维中 3 个相异方向线性相关，存在零和非平凡三元组），§4 引理 4.1 的短字假设 (2.3 型条件) 无法验证，粘合塌缩。证据：`LocalGroup.three_directions` 的 Vandermonde 论证本质是 3 维的（`a*((x-y)*(x-z))` 型）；论文 $\S4$ 明确使用 $k\le3$。
- 取 $c$ 为常值函数 [推测]：$c-s\cdot c=0$ 对所有 $s$，$V=U$，$U\cap V\ne\{1\}$，边同态把两侧嵌成同一个子群——粘合退化、短字条件全毁。$c$ 必须"非平移不变"，delta 是最小代价。
- 把 $A_0$ 换成 $(\Z/q\Z)^P$（$q\mid M$，$q<M$）[推测]：特征群变小，$\zeta$ 的阶 $M$ 浪费、$|\mathscr R|$ 的界与 $d/w$ 重算；且 §4a 的扇区构造里 $z$ 的阶必须与 $A_0$ 的指数模一致（$\chi(z)=\zeta$ 型条件），$q<M$ 会让 $f=\frac1M\sum\zeta^{-k}z^k$ 与 $K[A_0]$ 的 Fourier 分解错位。

### 2.5 命题 3.2 的陈述与 §3.1 灭列空间——$B$ 矩阵、$h=\binom{\ell+2}{3}$

**(a) 命题陈述**（Proposition 3.2 `op:modular`，TeX 原样）：

> There is a specified idempotent $e\in K[H]$ satisfying, for every $s\in P$,
> \[
>  (u(s)-1)^\ell e=0,\qquad e(v(s)-1)^\ell=0.
> \]
> Its regular rank $d$ satisfies $d/w>1/96$. Its coefficients are obtained
> by finite operations in the specified field $K$.

参数约定（§3 开头）："Here $\ell=(p-1)/2$, $D=3(p-1)$, $w=|H|$." 以及 "The \emph{regular rank} of $e\in K[H]$ means $\dim_K eK[H]$, the dimension of the image of left multiplication. Although this map multiplies on the left, its image is a right ideal."

**(b) §3.1 灭列空间的不跳步推导**（TeX 原样引入 + 逐条核验）：

> On $K^P$, let $\mathbf e_x$ be the standard basis and
> $L_s\mathbf e_x=\mathbf e_{s+x}$. For the three standard generators
> $\varepsilon_j$ of $P$ set $X_j=L_{\varepsilon_j}-I$. The $X_j$ commute,
> and characteristic $p$ gives $X_j^p=0$. The vectors
> \[
>  X_1^{n_1}X_2^{n_2}X_3^{n_3}\mathbf e_0,
>   \qquad 0\le n_1,n_2,n_3<p,
> \]
> are a basis. Indeed, every translation of $\mathbf e_0$ is a product of
> powers of $I+X_j$ applied to $\mathbf e_0$, so the displayed family spans
> $K^P$; its cardinality is the dimension $p^3$.

- *$X_j^p=0$*：$X_j^p=(L_{\varepsilon_j}-I)^p=\sum_k\binom pk L_{\varepsilon_j}^k(-1)^{p-k}$；特征 $p$ 中 $\binom pk\equiv0\ (0<k<p)$，只剩 $L^p+(-1)^p=L^p-I=0$（$L^p=I$ 因 $\varepsilon_j$ 在 $P$ 中阶 $p$）。$X_j$ 两两交换（平移算子交换）。这是一、1.4 资源 A 的最小实例。
- *单项式基*：$\mathbf e_x=L_{\varepsilon_1}^{x_1}\cdots L_{\varepsilon_3}^{x_3}\mathbf e_0=(I+X_1)^{x_1}\cdots(I+X_3)^{x_3}\mathbf e_0$，展开为 $X$-单项式的和，故 $\{X_1^{n_1}X_2^{n_2}X_3^{n_3}\mathbf e_0\}_{0\le n_j<p}$ 张成 $K^P$；个数 $p^3=\dim K^P$，故为基（独立性自动成立）。
- *高次切片的定义*：$B$ 的列是 $X_1^{n_1}X_2^{n_2}X_3^{n_3}\mathbf e_0$，$n_1+n_2+n_3\ge D-\ell+1$，按序排列（$D=3(p-1)$ 是单项式的最大总次数）。
- *双侧湮灭 (op:B-annihilation)*：对每个 $s$，$L_s-I$ 是 $X_j$ 的零常数项多项式（$L_s=(I+X_1)^{s_1}\cdots(I+X_3)^{s_3}$，减 $I$ 后常数项为零）。乘以 $(L_s-I)^\ell$ 把每个列的总次数**提升至少 $\ell$**：从 $\ge D-\ell+1$ 到 $\ge D+1$。总次数 $\ge D+1$ 的单项式必有某指数 $\ge p$（三个指数都 $\le p-1$ 时总次数 $\le D$），故该项为 0。于是 $(L_s-I)^\ell B=0$。转置侧：对 $-s$ 用同一断言得 $(L_{-s}-I)^\ell B=0$，而 $L_{-s}^{\mathsf T}=L_s$（$(L_s)_{x,y}=[x=s+y]$，转置 $[(L_s)^{\mathsf T}]_{x,y}=[y=s+x]$，即 $L_s^{\mathsf T}=L_{-s}$），所以 $B^{\mathsf T}(L_s-I)^\ell=0$。论文强调："The transpose identity uses $L_{-s}^{\mathsf T}=L_s$; no scalar conjugation is present."——**无对合**约定在这里兑现：普通转置 + 参数取反就够，不需要 $\lambda\mapsto\bar\lambda$。
- *列数计数*：换元 $a_j=p-1-n_j$（$\ge0$），"高次"条件 $n_1+n_2+n_3\ge3(p-1)-\ell+1$ 变成 $a_1+a_2+a_3\le\ell-1$；各 $a_j\le p-1$ 自动满足因 $\ell-1<p$。星与棒计数给
  $$h=\binom{\ell+2}{3},\qquad \frac{h}{p^3}=\frac{(p-1)(p+1)(p+3)}{48p^3}>\frac1{48}.$$
  （$\binom{\ell+2}{3}=\frac{(\ell+2)(\ell+1)\ell}{6}$，代入 $\ell=\frac{p-1}{2}$ 得 $\frac{(p-1)(p+1)(p+3)}{48}$。严格不等式："the numerator minus $p^3$ is $3p^2-p-3>0$ for $p\ge3$"。）
- *§3.1 尾的警告*（转向加权配对的动机）："The same subspace is killed on the two sides in Equation~(B-annihilation), but an arbitrary projection onto it need not give the outgoing conjugate annihilation. We therefore choose the row factor by a diagonal weighted pairing."——$B$ 只是**列空间**；幂等元要同时满足两侧湮灭，右因子不能随便取。

**(c) 假设/常数的机械理由**：

- **$\ell=(p-1)/2$ 的极值性**（一、1.4 第 2 条的展开）：湮灭指数 $\ell$ 受两条约束夹击。(i) *下界方向*：$h=\binom{\ell+2}{3}$ 随 $\ell$ 单调增，$\ell$ 越大列越多、$h/p^3$ 越大——秩分数要 $\ell$ 大。(ii) *上界方向*：2.9 的边零链要求 $p-\ell\ge\ell$，即 $\ell\le p/2$；奇素数给 $\ell\le(p-1)/2$。取 $\ell=(p-1)/2$ 同时满足两者且使 $h$ 最大。若取 $\ell=p-1$：$h/p^3\to1/6$ 更大，但 $p-\ell=1$，$e_i=qX$ 无法从中分离 $X^\ell e_j=0$，链断。若取 $\ell$ 小：链闭合但 $h/p^3$ 掉，$\frac1{96}$ 预算不足（$\frac{h}{2p^3}>\frac1{96}$ 需要 $\frac hp>\frac{1}{48}$ 型强度）。
- $D=3(p-1)$：单项式指数上界 $p-1$ 乘变量数 3——"$X_j^p=0$ 允许的指数范围"的精确上限，零化论证里"总次数 $\ge D+1$ ⟹ 某指数 $\ge p$"的逆否由它支撑。§4a 的幂零界复用同一个 $D_{\max}=3(p-1)$（见 2.12）。
- $B$ 的"按序排列"（increasing-list lex）：让 $B_J$（极大子式）与加权多项式的单项式有固定对应（Cauchy–Binet 展开的确定性）。
- Lean 对应：`Augmentation.lean`（`X i = delta - 1`、`X_pow : X^p = 0`、`monomial`/`monomialSpan`/`span_eq_top`——单项式基）、`AugmentationMatrices.lean`（`High := {n : E → Fin p // card E * (p-1) < ell + ∑ n_i}`——**"总次数 $\ge D-\ell+1$" 的 Lean 形式是 "$\ell+\sum n_i>3(p-1)$"**，恒等变形；`columns`、`columns_independent`、`columns_annihilated`、`columns_transpose_annihilated`——(B-annihilation) 的两侧）、`HighCount.lean`/`SimplexCount.lean`（`High ≃ Deficit`、`card_high = (ell+2).choose 3`、`high_ratio : card P < 48 * card High`——$\frac{h}{p^3}>\frac1{48}$ 的整数形式）、`ModularSource.left_ann/right_ann`（经 `regular_translation` 把平移算子转成左正则表示矩阵）、`TranslationMatrix.matrix`（`MatrixActions.lean` 的 `matrix h : (x y : H) => if x = h*y then 1 else 0` 与 `mul_apply`——左乘平移在矩阵层是行移，与论文"$L_s\mathbf e_x=\mathbf e_{s+x}$"的列作用互为转置视角，形式化在 `Represents` 接口里统一：`Represents a s ↔ a*φ F = φ (s*F) ∧ φ F * a = φ (F*s)`，`annihilates_left/right` 正是"矩阵层湮灭 ⟹ 代数层湮灭"的桥）。

**(d) 候选失败路线**：

- 用低次列（次数 $\le$ 某阈）代替高次列 [推测]：零化方向反了——$(L_s-I)^\ell$ 把次数**升** $\ell$，低次列被升后仍 $\le D$，不为零；湮灭要求"升后超上限"，故只能选高次切片。这是 Jennings 过滤的"顶层切片"选择，char-2 版没有对应物（那边是多项式在**线**上的求和归零，方向是"低次 ⟹ 局部零和"）。
- 三维改两维/四维 [推测]：见 2.4(c)——2 维毁短字、4 维掉秩分数（$\binom{\ell+3}{4}/p^4\to1/384<1/96$ 不够）。3 维是两组约束的唯一交点。
- 只做单侧湮灭、指望反向从对称性来 [推测]：$(u(s)-1)^\ell e=0$ 与 $e(v(s)-1)^\ell=0$ 的两侧不对称（$U$ 入、$V$ 出），$B$ 本身两侧都灭但**投影因子**必须按 2.6 的方式选才能把出侧共轭湮灭传给 $e$；任意投影只保入侧。证据：§3.1 尾警告原文。

### 2.6 §3.2 对角加权配对 + Schwartz 网格界 + 引理 3.3（过半可采纳）

**(a) 陈述**（Lemma 3.3 `op:good-count`，TeX 原样）：

> More than half of the $|A_0|=M^{p^3}$ characters are admissible.

其中 "admissible" 的定义（§3.2 正文）：对函数群 $A_*=(\mathbb Z/M\mathbb Z)^E$，特征 $\chi:A_*\to K^*$ 都是 $\zeta$ 的幂的指数表，Fourier 投影
$$p_\chi^{A_*}=|A_*|^{-1}\sum_{a\in A_*}\chi(a)^{-1}a,\tag{op:fourier}$$
满足 $ap_\chi=\chi(a)p_\chi$、$p_\chi p_\psi=\delta_{\chi\psi}p_\chi$、$\sum_\chi p_\chi=1$、构成 $K[A_*]$ 的基（推导见 (b)）。特化到 $A_0$：特征作用 $(s\lambda)(a)=\lambda((-s)\cdot a)$；定义 $\chi_x=x\lambda$（$x\in P$）、$D_\lambda=\diag(\chi_x(c):x\in P)$、$N_\lambda=B^{\mathsf T}D_\lambda^{-1}B$；"Call $\lambda$ admissible if its stabilizer in $P$ is trivial and $N_\lambda$ is invertible. This condition is a finite test."

**(b) 不跳步推导**：

- *Fourier 恒等式*（式 (op:fourier) 后）：
  - $ap_\chi=\chi(a)p_\chi$：把和重排（$\sum_{a'}\chi(a')^{-1}aa'$ 中 $aa'$ 遍历全群）。
  - 非平凡特征求和为零："translating its sum by an element on which it is nontrivial multiplies it by a scalar different from one"——$\sigma=\sum_a\chi(a)^{-1}a$，取 $b$ 使 $\chi(b)\ne1$，则 $b\sigma=\sum_{a'}\chi(b^{-1}a')^{-1}a'=\chi(b)\sigma$，$(1-\chi(b))\sigma=0$。
  - 由此 $p_\chi p_\psi=\delta_{\chi\psi}p_\chi$（乘积内和 $\sum_a(\chi\psi^{-1})(a)$，$\chi\ne\psi$ 时归零）与 $\sum_\chi p_\chi=1$（"sum coefficients over the independent character exponents: every nonzero coordinate of a nonidentity element is detected by a power of $\zeta$"——按指数逐坐标求几何级数）。每个 $p_\chi\ne0$（恒等系数 $|A_*|^{-1}\ne0$），$|A_*|$ 个两两正交幂等 ⟹ 线性无关 ⟹ 基。**分母 $|A_*|^{-1}$ 需要 $p\nmid|A_*|$**——$A_*$ 的幂指数整除 $M$，$p\nmid M$。这整块与 char-2 版 (3.9) 的 $Q_\alpha$ 正交性是同一个论证（char-2 素材 2.8(b)），但奇特征版把它抽象成任意有限函数群的引理（Lean 的 `Fourier.lean`：`projector`、`projector_mul`、`projector_idempotent`、`projector_orthogonal`、`projector_one_coeff`、`pushed` 系列与 `cyclicCharacter_injective`——**与 DirectFiniteness 的 `CharacterIdempotents.lean` 平行且同名**，是复制而非 import，见四、4.1）。
- *引理 3.3 证明第一半（稳定子计数）*：对非零 $s\in P$，平移 $x\mapsto x+s$ 把 $P$ 分成 $p^2$ 个长 $p$ 的轮换；被 $s$ 固定的特征在每个轮换上指数为常数，故恰 $M^{p^2}$ 个。并集界：有非平凡稳定子的特征占比 $\le(p^3-1)M^{p^2-p^3}$。
- *第二半（加权 Gram）*：因 $\chi_x(c)=\lambda(c_{-x})$（$c_r$ 记 $r$ 处的坐标生成元；核对：$\chi_x(c)=\lambda((-x)\cdot c)$，$((-x)\cdot c)$ 在 $-x$ 处取 $c(0)=1$、其余 0，即支撑 $-x$ 的 delta，故 $\chi_x(c)=\lambda(c_{-x})$ ✓），当 $\lambda$ 遍历所有特征时 $D_\lambda^{-1}$ 的对角元 $\chi_x(c)^{-1}$ **独立地**遍历 $K^*$。对独立变量 $\tau_x$，Cauchy–Binet：
  $$Q(\tau):=\det\bigl(B^{\mathsf T}\diag(\tau_x)B\bigr)=\sum_{\substack{J\subseteq P\\|J|=h}}\det(B_J)^2\prod_{x\in J}\tau_x.\tag{op:weighted-gram}$$
  "$B_J$ consists of the indicated rows in their fixed order." $B$ 列满秩 ⟹ 某极大子式 $\det(B_J)\ne0$ ⟹ $Q$ 的对应单项式系数非零；不同 $J$ 给不同单项式 ⟹ $Q\ne0$、总次数 $h$。"even though the unweighted Gram matrix could be singular"——**未加权** $B^{\mathsf T}B$ 可能奇异，加权是救生索。
- *Schwartz 网格界*（论文内嵌完整归纳证明）：总次数 $\le a$ 的非零多项式在乘积网格（每坐标 $M$ 个值）上至多消失 $a/M$ 比例。归纳：末变量次数 $b$，其首项系数次数 $\le a-b$，在前面选择上至多消失 $(a-b)/M$；每个剩余选择上末变量多项式至多 $b$ 个根，贡献 $b/M$；合计 $a/M$；常数情形起归纳。引用 Schwartz [Lemma 1, Corollary 1] 与 Zippel。
- *合成*：在 $(K^*)^{p^3}$ 上应用，奇异配对（$N_\lambda$ 不可逆）占比 $\le h/M$。两块互斥碎片都严格 $<1/4$：
  $$\frac hM\le\frac{p^3}{p^4-1}<\frac14,\qquad (p^3-1)M^{-p^2(p-1)}\le\frac{p^3-1}{M}<\frac14.$$
  （第二条用 $-p^2(p-1)\le-1$ 即 $p^2(p-1)\ge1$。"The estimates use $p>600$; for example, $p^4-1-4p^3=p^3(p-4)-1>0$."）并集 $<1/2$ ⟹ 过半可采纳。

**(c) 假设/常数的机械理由**：

- *为什么加权*：$B$ 是 $p^3\times h$ 高矩阵、$h<p^3$，$B^{\mathsf T}B$ 可能奇异（论文自己承认）。对角加权 $\tau_x$ 让 $h\times h$ Gram 行列式变成 $h$ 次多项式，单项式按 $h$-子集 $J$ 分组、系数 $\det(B_J)^2$；列满秩保证某系数非零 ⟹ 多项式非零 ⟹ Schwartz 界给"坏 $\tau$ 稀疏"。**可采纳特征的存在性与密度（过半）**都从这里来；密度是 2.7 中 $d=hp^3|\mathscr R|$ 里 $|\mathscr R|>|A_0|/(2p^3)$ 的来源，没有密度就没有 $d/w>1/96$。
- *为什么要求稳定子平凡*：稳定子非平凡的特征在 $P$-轨道里大小 $<p^3$，§3.3 的矩阵单位 $E^\lambda_{xy}$ 论证（"Fourier orthogonality and freeness of the orbit"）需要**自由**轨道。计数用到"每个非零 $s$ 恰有 $p^2$ 个长 $p$ 轮换"——$P=(\F_p)^3$ 的具体结构。
- $\frac1{100}<\frac1{96}$ 的另一端：$\frac{h}{2p^3}>\frac1{96}\iff\frac hp>\frac1{48}$——2.5 的 $h/p^3>1/48$ 恰好强一倍，因为轨道选择再丢一个 $\frac12$："Select the first admissible character from each $P$-orbit containing one... Each selected orbit is free, of size $p^3$. These orbits cover all admissible characters, so $|\mathscr R|>\frac{|A_0|}{2p^3}$. This argument does not need admissibility to be constant on an orbit."（选代表不要求可采纳性沿轨道恒定，只数"含至少一个可采纳成员的轨道"，每条贡献 $p^3$ 个可采纳特征，覆盖全体）。
- Lean 对应：`WeightedGram.lean`（`exists_minor`、`gram_entry`、`polynomial`、`eval_polynomial`、`nonzero`、`totalDegree ≤ card I`）、`PolynomialGrid.lean`（`card_units_zero_le_general`——Schwartz 界的 Lean 化）、`AdmissibleCount.lean`（`weight`/`weight_bijective`——对角元独立性；`Admissible = FreeShiftCount.Free ∧ det ≠ 0`；`card_singular`（奇异者个数 $\times M\le\mathrm{card}\ I\times M^{\mathrm{card}\ H}$）；`cardinality`：`card Base < 2 * card {Admissible}`，证明是单射分拣 + `omega`）、`FreeShiftCount.card_not_free`、`OrbitSelection.lean`（`Rep`、`representative`、`representative_spec`、`orbit_injective`、`card_good`）。

**(d) 候选失败路线**：

- 用未加权 Gram + 直接找正则子阵 [推测]：$B^{\mathsf T}B$ 奇异时坏特征不再是稀疏多项式零点、不可计数；加权把"可逆性"变成"多项式非零点"这个可 Schwartz 计数的对象。证据："even though the unweighted Gram matrix could be singular"。
- 用 Chebyshev/二阶矩代替 Schwartz [推测]：随机矩阵行列式矩方法在**有限域**上失效（无序、无绝对值、特征 $p$ 中矩塌缩）；Schwartz 界是纯代数的（单变量根数 + 归纳），对任意域成立。证据：论文内嵌的是 Schwartz 归纳证明而非概率论证。
- 只证存在一个可采纳特征 [推测]：$d=hp^3|\mathscr R|$ 与 $\frac dw=\frac{h|\mathscr R|}{|A_0|}$ 是**求和**——单个 $\lambda$ 只给一个块的正则秩 $hp^3$，占 $w$ 比例 $\frac{hp^3}{M^{p^3}p^3}$ 微乎其微；必须凑 $|\mathscr R|>|A_0|/(2p^3)$ 个块才到 $\frac1{96}$。证据：式 (op:regular-rank)。

### 2.7 §3.3 Fourier 轨道块与显式幂等元 $e$

**(a) 定义**（TeX 原样，式 (op:explicit-e) 及上下文）：

> Fix $\lambda\in\mathscr R$. For $x,y\in P$, define
> \[
>  E_{xy}^{\lambda}=p_{x\lambda}^{A_0}u(x-y).
> \]
> Conjugation gives $u(s)p_\chi^{A_0}u(s)^{-1}=p_{s\chi}^{A_0}$.
> Fourier orthogonality and freeness of the orbit therefore imply
> \[
>  E_{xy}^{\lambda}E_{zt}^{\lambda}=\delta_{yz}E_{xt}^{\lambda}.
> \]
> Indeed the Fourier product can survive only when
> $x\lambda=(x-y+z)\lambda$, which is equivalent to $y=z$.

以及矩阵与群代数元：
$$T_\lambda=BN_\lambda^{-1}B^{\mathsf T}D_\lambda^{-1},\qquad e=\sum_{\lambda\in\mathscr R}\sum_{x,y\in P}(T_\lambda)_{xy}E_{xy}^{\lambda}.\tag{op:explicit-e}$$

**(b) 不跳步推导**：

- *共轭公式*：$u(s)p_\chi u(s)^{-1}$ 的群基系数重排后为 $|A_0|^{-1}\chi(s^{-1}\cdot a)^{-1}$，即 $p_{s\chi}$，其中 $(s\chi)(a)=\chi((-s)\cdot a)$——正是 §3.2 定义的特征 $P$-作用。
- *矩阵单位律*：$E^\lambda_{xy}E^\lambda_{zt}=p_{x\lambda}u(x-y)p_{z\lambda}u(z-t)$。用 $u(s)p_\chi=p_{s\chi}u(s)$ 穿过：$u(x-y)p_{z\lambda}=p_{(x-y)\cdot(z\lambda)}u(x-y)$，$P$-作用在特征群上线性故 $(x-y)\cdot(z\lambda)=(x-y+z)\lambda$。于是 $E_{xy}E_{zt}=p_{x\lambda}p_{(x-y+z)\lambda}u(x-y)u(z-t)$，Fourier 正交压成 $\delta_{x\lambda,(x-y+z)\lambda}$——轨道自由 ⟺ $x\lambda=(x-y+z)\lambda\iff(y-z)\lambda=0\iff y=z$（稳定子平凡！）。$y=z$ 时 $u(x-y)u(z-t)=u(x-t)$，得 $E^\lambda_{xt}$。"Products between different orbits vanish"：不同轨道的 $p_\mu p_\nu=0$（$\mu\ne\nu$ 直接正交——不需要同轨道）。
- *$q_\lambda$ 与块同构*：$q_\lambda=\sum_xp_{x\lambda}$ 中心（与 $A_0$ 交换因各 $p_\chi$ 是 $A_0$-特征幂等；与 $P$ 交换因 $P$ 置换求和项）。"The basis $p_{x\lambda}^{A_0}u(s)$ of its ideal is indexed equally by $(x,y)$ through $s=x-y$. Thus these units prove $q_\lambda K[H]\cong\Mat_{p^3}(K)$."——$E^\lambda_{xy}$ 恰是 $q_\lambda K[H]$ 的矩阵单位基。这是 Clifford 特征轨道块的显式实例，"It does not assert semisimplicity of the entire modular algebra"——**只有 $p'$-部 $A_0$ 被对角化**，$P$-部保持幂零。
- *块上的作用*："On this block, the elements $u(s)$, $c$, and $v(s)$ act respectively by $L_s$, $D_\lambda$, $D_\lambda L_sD_\lambda^{-1}$."——$c\in A_0$ 在块上对角：块基 $p_{x\lambda}u(s)$ 的行指标 $x$ 承载 $p_{x\lambda}$，$c$ 乘行 $x$ 以 $(x\lambda)(c)$，即 $D_\lambda$ 的对角元。$v(s)=cu(s)c^{-1}$ 的作用是 $D_\lambda L_sD_\lambda^{-1}$（三者的共轭关系平行于群关系 $v=cuc^{-1}$——**在块层把群嵌入"表示进矩阵"**）。
- *$T_\lambda$ 的性质*：因 $B^{\mathsf T}D_\lambda^{-1}B=N_\lambda$，$T_\lambda B=B$ 且 $T_\lambda^2=T_\lambda$；像恰为 $\operatorname{im}B$（$h$ 维，$B$ 列满秩）。"Orthogonality of the blocks proves $e^2=e$; on the complementary ideal its component is zero."
- *正则秩（不只是表示秩）*："We now compute the regular rank, rather than the smaller rank of a single representation matrix. In $\Mat_{p^3}(K)$, left multiplication by $T_\lambda$ has image the matrices whose $p^3$ columns all lie in $\im B$. Its image dimension is $hp^3$. Summing the selected blocks gives
  $$d=hp^3|\mathscr R|,\qquad \frac dw=\frac{h|\mathscr R|}{|A_0|}>\frac{h}{2p^3}>\frac1{96}.\tag{op:regular-rank}$$"
  （$\Mat_{p^3}$ 中左乘 $T_\lambda$ 的像 = "列都在 $\im B$ 里"的矩阵空间，维数 $p^3\times h$；$|\mathscr R|$ 个直和块；$w=|A_0|p^3$。）这个"正则秩 vs 表示秩"的区分与 char-2 版 $e$-块正交分解同型，但这里显式算成分数界。
- *两侧湮灭收尾*：入侧 $(L_s-I)^\ell T_\lambda=0$ 由 (B-annihilation) 第一式。出侧**保持实际顺序**：
  $$B^{\mathsf T}D_\lambda^{-1}(D_\lambda L_sD_\lambda^{-1}-I)^\ell=B^{\mathsf T}(L_s-I)^\ell D_\lambda^{-1}=0.$$
  中间步：$D_\lambda L_sD_\lambda^{-1}-I=D_\lambda(L_s-I)D_\lambda^{-1}$，$\ell$ 次幂 $=D_\lambda(L_s-I)^\ell D_\lambda^{-1}$（$D_\lambda$ 可逆），于是 $B^{\mathsf T}D_\lambda^{-1}\cdot D_\lambda(L_s-I)^\ell D_\lambda^{-1}=B^{\mathsf T}(L_s-I)^\ell D_\lambda^{-1}$，用转置湮灭。论文："For the outgoing annihilation, keep the factors in their actual order"——**顺序不能重排**（$D_\lambda^{-1}$ 与 $L_s$ 不交换），出侧湮灭的唯一可用顺序是"$D_\lambda$ 先消、$(L_s-I)^\ell$ 再撞 $B^{\mathsf T}$"。

**(c) 假设/常数的机械理由**：

- $e$ 的公式是"逐块 $T_\lambda$ + 矩阵单位 $E^\lambda_{xy}$"的有限和：$|\mathscr R|\cdot p^3\cdot p^3$ 项，每项系数 $(T_\lambda)_{xy}\in K$ 由有限线性代数（$N_\lambda^{-1}$）给出。**规范性**：$\mathscr R$ 取"每条含可采纳成员的 $P$-轨道的第一个可采纳成员"，块内 $(x,y)$ 按 $P$ 的序——全部 finite formulas。
- $T_\lambda=BN_\lambda^{-1}B^{\mathsf T}D_\lambda^{-1}$ 的形状是"到 $\im B$ 的加权斜投影"：$BN^{-1}B^{\mathsf T}$ 是标准 Gram 投影（幂等、像 $\im B$、固定 $B$ 的列），$D_\lambda^{-1}$ 在尾部把行加权吸收进出射湮灭。$T_\lambda B=B$ 是出射湮灭里 $B^{\mathsf T}\cdot B$ 内积消成 $N_\lambda$ 的前提。
- 为什么 $v(s)$ 在块上是 $D_\lambda L_sD_\lambda^{-1}$：$c$ 的 Fourier 特征值把"共轭 $v=cuc^{-1}$"翻译成"对角共轭"。**$c$ 的存在（delta 函数）同时供应 $U\cap V=1$（2.4）与对角化 $D_\lambda$（2.7）**——一个群元素双职。
- Lean 对应：`WreathFourier.lean`（`Wreath = RegularWreathProduct (Fourier.C M) H`——注意 Lean 的 wreath 是 $C_M\wr H$ 型；`Base = H → C M`、`shift`/`character_shift`、`projector`/`projector_idempotent`、`topElt`/`baseElt`/`lamp`、以及大定理 `modular_idempotent`——命题 3.2 的完整 generic 版本，输入是列矩阵 $B$ 及两侧湮灭假设、输出幂等元 + $w<96d$）、`ModularGeneric.lean` 的 `Blocks`（`projection`、`weights`、`rank_bound`）、`OrderedModular.lean`（`modularElement_properties`、`explicitElement`/`explicit_properties`——prescribed 版）、`OrbitBlock.lean`/`OrderedBlocks.lean`（`unit`、`entry`、`lift`、`lift_mul`、`identity`——$E^\lambda_{xy}$ 与 $q_\lambda$ 块同构的 Lean 化；`Ordered*` 前缀 = 全部选择已用固定序规范化）。

**(d) 候选失败路线**：

- 用稳定子非平凡的特征 [推测]：轨道大小 $<p^3$，$E^\lambda_{xy}$ 的矩阵单位律在 $y=z$ 判据处失效（$(y-z)\lambda=0$ 有非零解），$q_\lambda K[H]$ 不是满矩阵代数而是稳定子的扭曲版本——§4a 才允许非平凡稳定子（用幂零换基吸收），§3 必须用自由轨道。证据："Fourier orthogonality and freeness of the orbit therefore imply..."。
- 把出射湮灭的因子重排 [推测]：$D_\lambda$ 与 $L_s$ 不交换，任何重排都需要额外交换关系，而 $B^{\mathsf T}(L_s-I)^\ell=0$ 的形式固定——只有"先消 $D_\lambda$"能用上 (B-annihilation) 第二式。证据："keep the factors in their actual order"。
- 对整个群 $H$ 做不可约特征分解（把 $P$-部也对角化）[推测]：特征 $p$ 中 $K[P]$ 不半单（Maschke 失败，$p\mid|P|$），没有足够的特征；Clifford 轨道理论正是"只对正规 $p'$-部 $A_0$ 对角化、$p$-部按轨道+稳定子处理"的形式——论文显式走这条路并引 Clifford。

### 2.8 §3 内部的三段论（路标小节，论文无对应）

§3 的整体逻辑：(i) 造**列空间**（$B$，§3.1）——两侧湮灭的原料；(ii) 造**可逆加权**（$\mathscr R$，§3.2）——保证"到列空间的投影存在且很多"；(iii) 组装**幂等元**（$e$，§3.3）——把投影沿 Fourier 轨道铺进 $K[H]$，同时兑现正则秩分数与两侧湮灭。与 char-2 版对应：(i)↔插值列 $x_v$（char-2 命题 3.3），(ii)↔"特征 2 使 $D=0$ 让配对与正则性共存"（char-2 Remark 3.4），(iii)↔子群平均 $P_v$ + 矩形 $UT=I_m$（char-2 式 3.2–3.5）。**位置对应但机制互补**：char-2 的列空间由孔洞插值供应（多项式方法）、odd 由幂零过滤供应（表示论方法）；char-2 的"投影"是子群平均 $P_v$（群平均）、odd 是加权 Gram 投影 $T_\lambda$（线性代数）。

### 2.9 推论 3.5（有序零积 $e_ie_j=0$）——奇特征版最独特的引理

**(a) 陈述与设置**（§3.4，TeX 原样）：

> Take copies $H_i$ of $H$. For each edge $i<j$, identify
> $v(1,\bar j,\bar j^2)$ in $H_i$ with $u(1,\bar i,\bar i^2)$ in $H_j$,
> where bars denote residues in $\F_p$. Let $G_0$ be the resulting
> free-product quotient, and let $e_i$ denote the image of $e$ from $H_i$.
> The injectivity of these copies is proved in Section~\ref{sec:gluing}.
> The following ordered identity
> already follows from the local calculations and the quotient relations.

> \begin{corollary}\label{op:edge-zero}
> For every edge $i<j$ of $\Gamma$, $e_i e_j=0$ in $K[G_0]$.
> \end{corollary}

**(b) 证明机制推导**（TeX 原样 + 逐条展开）：

> Let $y$ be its generator, initially of order $p$ on either local side,
> and put $X=y-1$. In the local cyclic group algebra
> $K[\langle y\rangle]=K[X]/(X^p)$, the annihilator of right multiplication
> by $X^\ell$ is precisely the ideal $(X^{p-\ell})$. Choose representatives
> of the left cosets $a\langle y\rangle$ in $H_i$; they give a free right
> $K[\langle y\rangle]$-basis of $K[H_i]$. Thus the outgoing identity
> $e_iX^\ell=0$, applied coefficientwise in this basis before taking
> images in the quotient, gives $e_i=qX^{p-\ell}$ for some local $q$.
> On the incoming side $X^\ell e_j=0$. Since $p-\ell=\ell+1$,
> \[
>  e_i e_j=qX^{\ell+1}e_j=qX(X^\ell e_j)=0.
> \]
> No factor is commuted across $X$, and no reverse ordered product is
> asserted.

逐步：

- *右零化子*：$K[X]/(X^p)$ 有 $K$-基 $\{1,X,\dots,X^{p-1}\}$。右乘 $X^\ell$ 把 $X^i\mapsto X^{i+\ell}$。$aX^\ell=0\iff a$ 的 $X^i$ 系数全零对 $i+\ell<p\iff a\in(X^{p-\ell})$。这是"幂零链代数的右零化子 = 尾部理想"。Lean 对应：`NilpotentBasis.lean` 的 `right_divisible`（对 $K[\Z/p]$ 用 `basis` $X^i$ 与 `low_coefficient : a*X^ell=0 → i+ell<p → 系数=0`）。
- *自由右模分解*：左陪集代表给出 $K[H_i]=\bigoplus_r a_rK[\langle y\rangle]$（自由右 $K[\langle y\rangle]$-模），右乘 $X^\ell$ 逐坐标作用。$e_iX^\ell=0$ ⟹ 每坐标 $a_rX^\ell=0$ ⟹ $a_r\in(X^{p-\ell})$ ⟹ $e_i=qX^{p-\ell}$，$q$ 是 $K[H_i]$ 内部元素，**取商之前**得到。
- *边上的两个湮灭方向*：边 $i<j$ 的共享元素 $y$：在 $H_i$ 里是 $v(1,\bar j,\bar j^2)$（$V$-侧），在 $H_j$ 里是 $u(1,\bar i,\bar i^2)$（$U$-侧）。命题 3.2 的两个湮灭：$e(v(s)-1)^\ell=0$（出侧，认 $V$）与 $(u(s)-1)^\ell e=0$（入侧，认 $U$）。**出侧湮灭在 $i$ 侧触发**（$e_iX^\ell=0$，因 $y=v(\cdot)\in H_i$），**入侧湮灭在 $j$ 侧触发**（$X^\ell e_j=0$，因 $y=u(\cdot)\in H_j$）。方向匹配 = 边定向 $i<j$ 与 $U/V$ 分工的合成：小指标端接 $V$（出）、大指标端接 $U$（入），零积从"小端出湮灭 × 大端入湮灭"的链式相消中掉出来。
- *链式相消*：$p-\ell=\frac{p+1}{2}=\ell+1$，故 $e_ie_j=qX^{\ell+1}e_j=qX\cdot(X^\ell e_j)=0$——用 $X^\ell e_j=0$ **在 $K[G_0]$ 中**（$K[H_j]\to K[G_0]$ 是代数同态，湮灭式随像保持）。"No factor is commuted across $X$"：三因子 $q,X,e_j$ 顺序全程不动，唯一用到**结合律**。"no reverse ordered product is asserted"：$e_je_i$ 完全没有断言（按 2.13 的三角结构也**不能**有）。

**(c) 假设/常数的机械理由**：

- **$\bar j$、$\bar i$ 两两不同**（$p>m$）：顶点 $i$ 处，入边（邻居 $j<i$）供 $u(1,\bar j,\bar j^2)$，出边（邻居 $j>i$）供 $v(1,\bar j,\bar j^2)$——方向向量 $(1,\bar j,\bar j^2)$ 由 $\bar j$ 参数化，相异邻居 ⟹ 相异方向。§4 的短字验证需要"至多 3 个相异方向线性无关"，Vandermonde $(\bar j_2-\bar j_1)(\bar j_3-\bar j_1)(\bar j_3-\bar j_2)\ne0$ 用 $p>m$ 保证。
- **为什么 $y$ 在两侧分别落在 $V$ 与 $U$**：$e$ 的湮灭分工（$U$ 入、$V$ 出）是命题 3.2 的输出；边恒等式要"两侧都能触发"，共享元素必须一侧 $V$-型、另一侧 $U$-型。$H_i$ 的 $V=cUc^{-1}$ 与 $H_j$ 的 $U$ 通过**同一** $C_p$ 粘合——粘合关系的非对称选择（$v_{j\text{-向量}}\sim u_{i\text{-向量}}$）就是为这个匹配设计的。这也是**没有反向断言**的原因：$e_je_i$ 走同样链需要 $e_j$ 的出侧湮灭撞上 $y$，但 $y$ 在 $H_j$ 是 $U$-型，出侧只认 $V$——机制沉默。
- **$p-\ell=\ell+1$ 是设计出来的**：链式相消需要从 $X^{p-\ell}e_j$ 左端分离 $X^\ell$，即 $p-\ell\ge\ell$；$\ell=(p-1)/2$ 是此约束下的最大值（见 2.5(c)）。论文写 $qX(X^\ell e_j)$ 展示了 $p-\ell=\ell+1$ 的"多一个 $X$"版本。
- Lean 对应：`OrderedZero.lean`（`product_zero`，唯一一条引理——假设 `hell : ell ≤ p-ell` 就是 $p-\ell\ge\ell$ 的整数形式！参数是出侧嵌入 `edgeHom` 与商映射 `vertex`），`Construction.ordered_zero`（把 LocalDatum 的 leftAnn/rightAnn 与 `Gluing.edge_eq` 拼接），`LocalGroup.edgeHom`/`edgeHom_injective`，`NilpotentBasis.right_divisible`。注意 Lean 的 `LocalDatum` 结构体（`Construction.lean`）把命题 3.2 输出打包成五字段：`e`、`idem`、`leftAnn`、`rightAnn`、`rank`（`card HH < 96 * finrank (range (lmul e))`）——**$d/w>1/96$ 的 Lean 形式是 $w<96d$**（整数化避免分数）。

**(d) 候选失败路线**：

- 要求对称零积 $e_ie_j=e_je_i=0$ [推测]：反向没有机制——$e_j$ 的出侧湮灭由 $H_j$ 的 $V$-元素触发，而边的 $H_j$-侧元素是 $u(\cdot)\in U$；除非 $U=V$（毁掉 $U\cap V=1$）或 $e$ 对 $U,V$ 双侧对称湮灭，$e_je_i$ 不为零。零积的有向性把压缩层变成三角的（2.13）。证据："There is no assertion about the reverse product. The asymmetry is what allows a triangular calculation..."（intro）。
- 在 $K[G_0]$ 层（取商后）做右零化子计算 [推测]：$K[G_0]$ 不再有 $K[\langle y\rangle]$ 的自由右模分解（陪集在商中粘合）；必须**先**在局部 $K[H_i]$ 得 $e_i=qX^{p-\ell}$、再映到商。论文 "applied coefficientwise in this basis before taking images in the quotient" 明确顺序。Lean 的 `Construction.ordered_zero` 严格按此（先 `edgeHom` 局部嵌入、后 `Gluing.edge_eq`）。
- 用 $X^{p-\ell}$ 的中心性 [推测]：$X=y-1$ 不中心化 $H_i$，$q$ 是**局部**元素不能随意移动；链式相消只用结合律所以不需要移动——但任何"把 $q$ 挪到 $e_j$ 右边"的改写都引入共轭项而断裂。

### 2.10 引理 4.1（三角形自由粘合判据）——$C(4)$–$T(4)$ 的球面地图论证

**(a) 陈述**（Lemma 4.1 `lem:triangle-free-gluing`，TeX 原样，条件编号 (eq:gluing-short-word) 为本文标注）：

> Let $\Delta$ be a finite simple triangle-free graph.  For each vertex $i$,
> let $D_i$ be a finite group.  For each edge $\gamma=\{i,j\}$, let
> $C_\gamma$ be a nontrivial finite cyclic group, with injective homomorphisms
> $\iota_{\gamma,i}:C_\gamma\to D_i$ and $\iota_{\gamma,j}:C_\gamma\to D_j$.
> Assume the following condition at every vertex $i$.  If $1\leq k\leq3$,
> the edges $\gamma_1,\ldots,\gamma_k$ are incident to $i$, and
> $s_a\in C_{\gamma_a}\setminus\{1\}$, then
> \begin{equation}\label{eq:gluing-short-word}
>  \iota_{\gamma_1,i}(s_1)\cdots \iota_{\gamma_k,i}(s_k)\neq1
> \end{equation}
> whenever consecutive edge labels are distinct cyclically.  For $k=1$
> the distinctness condition is omitted; for $k\geq2$ it includes
> $\gamma_k\neq\gamma_1$.
> Then every natural homomorphism $D_i\to Q$ is injective, where
> \[
>  Q=\left(*_{i\in V(\Delta)}D_i\right)
>  \big/\left\langle\!\left\langle
>  \iota_{\gamma,i}(s)\iota_{\gamma,j}(s)^{-1}:
>  \gamma=\{i,j\},\ s\in C_\gamma
>  \right\rangle\!\right\rangle.
> \]

与 char-2 粘合（char-2 引理 2.2，素材 2.4–2.5）的结构对照——都是"局部短关系禁绝 ⟹ 自由积商不塌缩"的平面/Euler 论证，三处本质差异：

| | char-2 引理 2.2 | odd 引理 4.1 |
|---|---|---|
| 局部群 | $K_v\cong(\Z/\ell)^2$（由 $\ell+1$ 条线划分） | 任意有限群 $D_i$（局部生成子群 $D_i^0$） |
| 短字条件 | 零和关系 $\sum\varepsilon_i\iota_{vf_i}(c_i)=0$，长度**不设界** | 长度 $\le3$ 的乘积 $\ne1$，**有界** |
| 图条件 | incidence 图围长 $\ge12$ | 单图三角形自由（girth $\ge4$） |
| Euler 预算 | $n_b\le E/3,\ n_w\le(E+1)/2,\ n_f\le E/6+1$（面长 $\ge12$） | $\sum_v(4-\deg v)+\sum_F(4-\lvert\partial F\rvert)=8$（度 $\ge4$、面长 $\ge4$） |
| 地图类 | 平面带符号平衡二部图（边权进交换群求和） | 球面带标签地图（dart 值进非交换群求积） |
| Lean | `PlanarBalance`（$\iota:V\to F\to(A\to+B)$ 交换群） | `NoncommBalanced`（$\iota:V\to F\to(A\to*B)$ **非交换** + `ShortWords`） |

**(b) 证明机制推导**（论文最长的初等论证，约五页，分六段）：

*第 0 步（子群层先行）*：先对 $D_i^0=\langle\iota_{\gamma,i}(C_\gamma):\gamma\ni i\rangle$ 证明 $D_i^0\to L$ 单射，其中 $L$ 是"每个 $C_\gamma$ 一个生成元 $x_\gamma$、定义关系 = 单顶点处全部求值为 1 的字"的群。有良定义映射 $D_i^0\to L$（同一元素的两个代表字差一个此类关系）。最后用置换作用扩到整个 $D_i$（第 6 步）。

*第 1 步（字等式 ⟹ 球面例外地图）*：假设 $D_i^0$ 的非恒等元在 $L$ 中死去，取代表字 $w$。归约序列存在性："membership in the normal closure of the relators expresses $w$ in the free group as a finite product of conjugates of relators; free insertions and cancellations reach such a product, and the conjugated relators can then be erased." 画法：successive words 画在矩形水平层，每字母一条有向边（dart），空层用单个 neutral 边；未变前后缀用非交叉 neutral 边连接；插入/删除处把插入块两端口与对面单点连接；strip 面读到"字母 + 其逆"或"插入的关系"；外表面读到 $w$ 或 $w^{-1}$、类型 $i$。地图定义要点（原文）："A map is a finite connected graph drawn tamely on the sphere, allowing loops and parallel edges. An edge is either \emph{neutral}, with value $1$, or is labelled by an edge $\gamma$ of $\Delta$. In the latter case its two oriented traversals, called darts, have mutually inverse values in $C_\gamma\setminus\{1\}$. Every face has a type $i\in V(\Delta)$ incident to every label in its boundary walk... A face is \emph{ordinary} when this evaluation is the identity. Call the map \emph{exceptional} if precisely one face has nonidentity evaluation and all other faces have identity evaluation." 良定性："Changing the starting point conjugates a boundary product, and reversing the walk inverts it, so identity versus nonidentity is well-defined."

*第 2 步（边界行走与 Euler 公式）*：取球面定向；顶点处 $\sigma$ = 出 darts 的循环后继、$\alpha$ 反转 dart；边界行走 = $\sigma\alpha$ 的轮换。连通公式
$$v-e+F=2c.\tag{eq:gluing-euler}$$
证明（"For completeness"）：非桥边删去合并两个边界行走、保连通，归纳到树（$e=v-1$、一个行走）；分支求和。

*第 3 步（初等约化）*：
- neutral 非圈边可收缩（保求值、违反极小性）；neutral 圈：保留含例外面的闭侧、移除圈——保留侧连通（"each side of the loop attaches to the other only at $b$"）、行走求值不变（slot 区间论证）。**结论：每条边非 neutral。**
- 无桥：删桥值 $s$，所在面行走分裂为 $W_1,W_2$（各带旧类型），原词 $W_1sW_2s^{-1}$。例外时至少一个 $W_a$ 求值非 1，保留该分支；普通时 $W_1,W_2$ 同 1 或同非 1——前者保留含原例外面的分支，后者保留**不含**的分支（它的新边界成为唯一例外）。各种情形给更小例外地图。
- 每条边两侧面类型不同：否则删边并面——$sD$ 与 $s^{-1}E$ 合并成 $DE$，恒等式 (eq:gluing-merge) $DE=s^{-1}(sD)s(s^{-1}E)$ 说明"普通+普通合并普通、普通+例外合并例外"，边数减少。于是跨边 $\gamma$ 的两侧类型恰是 $\gamma$ 的两端。
- 至多一个圈，且若是圈则圈住例外面为 monogon：给圈后保留**不含**例外面的闭侧（含圈与基点），抹掉另一侧——抹掉的侧成为 monogon（值非 1），是新的例外地图；极小性 ⟹ 该侧原本无其他边，即原本就是例外 monogon；例外面只有一个，故至多一个圈。

*第 4 步（同标签连续 dart 的平滑）*：设面 $\Phi$ 有连续非圈 darts $e:a\to b$、$f:b\to d$，同标签 $\gamma$、值 $\epsilon,\varphi$。两 dart 属不同边（否则 $\Phi$ 两侧经过同一边 ⟹ 桥，已排除）。对面 $X,Y$ 类型同为 $j$（$\gamma$ 的另一端）。**手术**：删两边、沿 $\Phi$ 在 $b$ 的空角插入边 $g:a\to d$，值 $\epsilon\varphi$（为 1 则 neutral），slot 规则指定球面嵌入（"These instructions specify the spherical embedding even when vertices or other boundary segments coincide"）。$X\ne Y$ 时两对面合并，求值 (eq:gluing-smooth-merge) $(\epsilon\varphi)^{-1}DE=\varphi^{-1}(\epsilon^{-1}D)\varphi(\varphi^{-1}E)$——普通+普通 ⟹ 普通、恰一例外 ⟹ 例外，更小。$X=Y$ 时该面行走 $\bar eD\bar fE$ 分裂为 (eq:gluing-smooth-split) $\bar gD$ 与 $E$（从 $\sigma\alpha$ 直接读出；$E$ 空时 $b$ 成孤立点带 stipulated 空面；$D$ 空时 $\bar gD$ 是新圈的 monogon——"Thus the description includes all empty cases"；配 tikz Figure 1）。分支计数：行走总数 $+1$、边数 $-1$、顶点数不变，(eq:gluing-euler) 给恰两分支；新边把 $a,d$ 放进一支、$b$ 在另一支。两行走赋类型 $j$，求值 $A=(\epsilon\varphi)^{-1}D$、$B=E$；原词求值 $\epsilon^{-1}D\varphi^{-1}B$ 经循环起点变换为 (eq:gluing-split-evaluation) $(\varphi^{-1}B\varphi)A$。$X$ 例外时 $A,B$ 至少一个非 1，保留其分支；$X$ 普通时 $A,B$ 同 1 或同非 1，同前分拣。**结论：极小地图没有同标签连续非圈 darts**（含循环边界首尾相接）。

*第 5 步（Euler 亏损公式收尾）*：
- 顶点度 $\ge4$：非圈基点顶点，绕顶点读相邻面类型得 $\Delta$ 中的闭行走；每条入射边跨到不同端点类型、相邻边标签互异（第 4 步）⟹ 无立即回折；三角形自由 ⟹ 无 $<4$ 长闭行走 ⟹ 度 $\ge4$。
- 普通面长 $\ge4$：边界非空（"every boundary walk of a connected graph with at least one edge is a nonempty dart cycle"）；相邻标签互异 + 短字条件 ⟹ 长度 $\ge4$（长 1、2、3 的边界给出求值 1 的 $k=1,2,3$ 短字）。"a loop counts twice toward its vertex degree, and boundary lengths count dart occurrences."
- 亏损公式：
  $$\sum_v(4-\deg v)+\sum_F(4-|\partial F|)=8.\tag{eq:gluing-deficit}$$
  （由 $v-e+F=2$ 与 $\sum\deg v=2e$、$\sum|\partial F|=2e$ 直接得出。）
- 无圈情形：只有例外面可正贡献，其非空行走贡献至多 3，总和 $\le3<8$，矛盾。
- 有圈情形：圈基点贡献至多 2（度 $\ge2$）、例外 monogon 贡献 3、圈另一侧的面贡献至多 2（普通面且不能长 1——"its sole letter would be the loop's nonidentity value"，$k=1$ 短字禁绝）。总 $\le2+3+2=7<8$，矛盾。
- **结论：无例外地图 ⟹ $D_i^0\to L$ 单射。**

*第 6 步（扩到全顶点群）*：$\Omega=L\times\mathbb N$，$L$ 左乘第一坐标；限制到每个 $D_i^0$ 是自由作用、可数无穷轨道；$D_i^0$ 在 $D_i\times\mathbb N$ 上同样；轨道配对 + 选点给 $D_i^0$-等变双射 $D_i\times\mathbb N\to\Omega$，把 $D_i$ 的自由左作用搬运过去——限制到 $D_i^0$ 恰是原作用。各 $i$ 独立选取；"The resulting actions agree on every edge group because both copies of its chosen generator act as $x_\gamma\in L$."——各作用拼成 $Q$ 在 $\Omega$ 上的作用，在每个 $D_i$ 上忠实 ⟹ 单射。**这就是轨道配对置换作用证书**——与 char-2 版 §3.2 的 $H\hookrightarrow L$ 证书（char-2 素材 2.8(b)）、odd 版 §4a 的 $G_1$ 因子嵌入（2.12）是**同一模式**的三次使用。

**(c) 假设/常数的机械理由**：

- **短字长度 3 是 Euler 预算的必要输入**：普通面长 $\ge4$ 的推导里，面长 1、2、3 的边界分别给出 $k=1,2,3$ 短字求值 1，被三档条件禁绝。若只有 $k\le2$，长 3 普通面可存在（贡献 $4-3=1$），例外面 3 + 若干三角面 1 的总和能到 8，Euler 不再矛盾。$k=3$ 不可或缺。
- **三角形自由的方向**：论证只用"无 $<4$ 长闭行走"（girth $\ge4$），4-循环允许。与 char-2 版需要围长 12 对比：**odd 版的图只是粘合骨架，不承载几何恒等式**（恒等式由局部群 $H$ 的代数性质供应），girth 4 就够；char-2 版的图同时是零和恒等式的供应器（线 = 零和组），需要围长 12 保证局部子群存活 + LLL 概率构造。图的角色差异是两篇论文最深的结构分岔之一。
- 极小化在**抽象地图类**上进行（"Choose one with the smallest possible number of edges"，约化保持"例外地图"类非空）——与 char-2 版第 2 步 "We do not require this comparison graph to come from a word reduction"（char-2 素材 2.5(b)）逐字同型的自审结论；Lean 的 `NoncommBalanced.Minimal`（`Diagrams.lean:2309`）同样把极小性对象化为抽象层属性。
- **群是非交换的**：不同 $\gamma$ 的像在 $D_i^0$ 里可能不交换；第 4 步的合并恒等式 (eq:gluing-merge)/(eq:gluing-smooth-merge)/(eq:gluing-split-evaluation) 全部写成共轭形式（$s^{-1}(sD)s(s^{-1}E)$、$\varphi^{-1}(\epsilon^{-1}D)\varphi(\varphi^{-1}E)$、$(\varphi^{-1}B\varphi)A$）正是为了在非交换群里传递"求值 = 1"（共轭保 1；循环起点移动保 1/非 1，因为循环移位是共轭）。char-2 版的交换群权重求和不需要这些小心。Lean 对应：`Diagrams.lean` 的 `NoncommBalanced`（$A\to*B$ 非交换同态；`localWeight`、`defect`、`combine`/`restrict`/`detach`/`mergeWhite`/`spliceBlack` 系列手术、`Reduced`、`not_genusZero`）与 `ShortWords`（`one`/`two`/`three` 三字段——注意 Lean 的 ShortWords 用"非平凡音节 $=$ 相异标签的非恒等元"表述，与论文式 (eq:gluing-short-word) 的"非单位元 $s_a$"一致）。
- **Lean 的围长假设是 $8\le$ incidence 图 egirth**：`Gluing.vertex_injective` 的假设 `hgirth : 8 ≤ (Planar.incidenceGraph Inc).egirth`——incidence 图 = $\Delta$ 的二部细分（顶点 + 边各为一侧），$\Delta$ 的 4-圈对应细分后 8-圈、三角形自由给细分围长 $\ge8$。§4 面长 $\ge4$ 在 Lean 里从 `egirth ≥ 8` 导出（`Diagrams.lean:2188` 附近 `hgirth.trans (hp.egirth_le hne)`）。`GraphEdges.incidence_girth` 是从三角形自由到 `8 ≤ egirth` 的桥。
- Lean 对应（整体）：`Diagrams.lean`（`Ribbon`/`Spherical`/`euler_contradiction`/`GenusZero`/`detach`/`mergeBlack`/`swapBlack`——置换代数化地图手术，**与 DirectFiniteness 的 `RibbonGeometry.lean` 平行复制**：char-2 素材 4.2 的 `Ribbon.face = white * black`、`Spherical = 三置换轮换数和 = 边数+2` 原样出现——奇特征版复用了特征 2 版已开发的置换地图机器）、`OddKaplansky.GluedGroup`（`Diagrams.lean:3658` 起：`Local`、`N`、`theta`、`theta_evaluation`、`theta_injective`；注意与 DirectFiniteness 的 `GluedGroup.lean` **同名不同物**）、`Gluing.lean`（`con`/`Q`/`vertex`/`edge_eq`/`lift`/`vertex_injective`/`Group.FG` 实例——判据封装，`vertex_injective` 委托 `StarAmalgam.faithful_realization` + `GluedGroup.theta_injective`，假设恰好三条：`hInc` + `hshort` + `hgirth`）、`Amalgam.lean`（`StarAmalgam`：两因子自由积按子群粘合的商 + `faithful_realization`——轨道配对证书的 Lean 化；以及 `OddKaplansky.MultipleHNN`——**DirectFiniteness `MultiHNN.lean` 的完整复制**，odd 主链路其实不用多稳定字母 HNN，属冗余携带）。

**(d) 候选失败路线**：

- 用 ordinary graph-of-groups normal form [推测]：论文明说 "Ordinary graph-of-groups normal form does not by itself establish this first quotient's injectivity"——normal form 给"每元素有规范形"，但"顶点群单射"需要"规范形在顶点子群上不动"，对**商掉多个循环子群恒等**的图 of groups 需要额外验证；论文改为直接球面地图论证，绕开 Bass–Serre 树的一般理论。
- 走 $C(4)$–$T(4)$ 组合地图理论的完整机器（Prytuła §8）[推测]：可行但依赖 complexes of groups 的 developability（link 条件、发展复形）；论文 "We give a direct proof using only labelled spherical maps and Euler's formula" 刻意自足。Lean 侧 `Diagrams.lean` 的自足置换机器（3839 行，全库最大文件）正是这条自足路线的形式化代价。
- 允许普通面长 3（短字只到 $k=2$）[推测]：Euler 亏损预算破产——例外面 3 + 普通三角面各 1，总和可达 8。短字三档齐全是预算成立的必要条件。
- 允许顶点度 3 [推测]：度 3 顶点贡献 $4-3=1$，"只有例外面正贡献"失效。度 $\ge4$ 由三角形自由 + 平滑约化联合保证——若 $\Delta$ 有三角形，绕顶点闭行走可长 3，度 3 顶点出现。**三角形自由与短字 3 是 Euler 预算的两条腿，缺一即倒。**

### 2.11 命题 4.2（短字条件的验证）——Vandermonde 与 $U\cap V$

**(a) 陈述**（Proposition 4.2 `prop:first-gluing-injective`，TeX 原样）：

> Every natural map $H_i\to G_0$ is injective.  In particular, the maps
> $K[H_i]\to K[G_0]$ induced on group algebras are injective.

**(b) 证明机制推导**（TeX 原样 + 展开）：

> We verify the short-word hypothesis of Lemma~\ref{lem:triangle-free-gluing}.  At a fixed vertex, every incident
> edge subgroup lies either in $U$ or in $V$.  Within either subgroup,
> the labels supplied by distinct neighbors $j$ correspond to the
> vectors $(1,\bar j,\bar j^{2})$; a nonidentity syllable corresponds
> to a nonzero scalar multiple of its vector.  Any three with distinct residues
> are independent, because their determinant is, up to sign,
> \[
>  (\bar j_2-\bar j_1)(\bar j_3-\bar j_1)
>  (\bar j_3-\bar j_2)\neq0.
> \]
> The residues are distinct since $p>m$.  The analogous first two
> coordinates show independence for two vectors, and a single vector
> is nonzero.  Thus a word of at most three nonidentity syllables with
> distinct labels, all in $U$ or all in $V$, cannot evaluate to $1$.

- *同侧情形*：$U=u(P)$ 交换，元素 $u(a)$，$a\in(\F_p)^3$；边标签给 $a=(1,\bar j,\bar j^2)$ 的非零标量倍。$k$ 音节求值 $=u(\sum\varepsilon_ra_r)$（$U$ 里相加），$=1\iff\sum\varepsilon_ra_r=0$。3 个相异 $(1,j_r,j_r^2)$ 的 Vandermonde 行列式非零（$j_r$ 相异由 $p>m$）；2 个看前两坐标；1 个非零。
- *混合情形*："For a mixed word of length two or three, one of $U,V$ supplies exactly one syllable. After a cyclic permutation, a putative relation would equate that nonidentity syllable to a product of syllables from the other subgroup. This contradicts $U\cap V=\{1\}$. For lengths two and three, cyclically distinct consecutive labels are precisely distinct labels, so all required words have been covered."——混合词长 2 或 3 时必有一侧恰一个音节；循环置换把它挪到首位，等式右端落在另一侧子群（$U$、$V$ 各是子群、积封闭）；于是该非平凡音节 $\in U\cap V=\{1\}$，矛盾。长 $\le3$ 的循环序列"相邻相异"⟺"全体相异"。
- *群代数单射*："distinct elements of an embedded subgroup remain distinct basis elements of $K[G_0]$"——群基映射把子群基映为子集基。

**(c) 假设/常数的机械理由**：

- **$P$ 三维 + $(1,j,j^2)$ 二次参数化**：边标签向量取 Vandermonde 曲线——任意 $\le3$ 个相异参数线性无关恰好是"3 点 Vandermonde 非退化"；这是把"短字长度 3"编码进群参数的最经济方式（次数 2 的曲线在 3 维空间中任意 3 点不过原点共线）。char-2 版的对应物是 $(\F_\ell)^2$ 的 $\ell+1$ 个一维子空间 Fano 划分（char-2 素材 2.4(c)）——那边需要 $\ell+1$ 个方向**划分**全部非零元（供划分恒等式 (3.3)），这边只需要 $\le3$ 个方向**独立**（供短字条件）；前者是全局组合预算、后者是局部线性代数，要求弱得多，所以奇特征版的图可以换成任意的三角形自由图。
- **顶点处方向的来源**：顶点 $i$ 的入边（邻居 $j<i$）在 $H_i$ 供 $u(1,\bar j,\bar j^2)\in U$，出边（邻居 $j>i$）供 $v(1,\bar j,\bar j^2)\in V$——$U$-方向由小邻居、$V$-方向由大邻居，互不重叠。混合短字最多 3 音节 ⟹ 某侧至多 1 音节 ⟹ $U\cap V$ 论证触发。度数无上限没关系（引理只需 $k\le3$）——这是 $C(4)$–$T(4)$ 相对 char-2 围长 12 的成本优势：局部条件只看 3。
- Lean 对应：`SourceGluing.lean`（`edgeHom v e` 把每条边映到 `LocalGroup.edgeHom p M true/false (index 邻居)`；`shortWords : Planar.ShortWords Inc edgeHom`——三档条件完整验证；`G₀ := Gluing.Q Inc edgeHom`；`vertex_injective`——调用 `Gluing.vertex_injective`，三假设 `hInc` + `shortWords` + `incidence_girth`）；`LocalGroup.edge_word_one/two/three`（同侧与混合情形；Lean 证明用**右坐标**投影：`q.right.toAdd` 的线性和 $=0$ ⟹ Vandermonde 型因子 $\ne0$ ⟹ 系数为零——`linear_combination` 逐坐标组合——比论文的 $U\cap V$ 论证更直接，两路都通）。

**(d) 候选失败路线**：

- 让边标签向量是线性的 $(1,j)$（2 维）[推测]：3 个相异 $(1,j)$ 必线性相关（2 维空间），$k=3$ 同侧短字失败。二次曲线 $(1,j,j^2)$ 是"3-独立"的最小次数参数化。
- 用 $U\cap V$ 处理长 4 混合词 [推测]：一侧 2 音节积在子群内、另一侧也 2 音节——"$U\cap V=1$"只对不等长的"单音节 vs 多音节"直接工作；等长情形需要半直积 normal form 两边同时化简，超出短字机制。好在 Euler 层把面长压到 $\ge4$，长 4 的**面**不是短字（是求值 1 的四音节乘积，允许存在），只有顶点度与短字交互，$k\le3$ 覆盖。
- 跳过群代数单射的传递 [推测]：$H_i\hookrightarrow G_0$ 不自动写明给 $K[H_i]\hookrightarrow K[G_0]$——其实自动（群基映为子集基），但后续所有 $e_i$ 运算都在 $K[G_0]$ 里，这一句是"幂等元运算合法"的桥。Lean 里 `Construction.push : MonoidAlgebra K H →ₐ[K] MonoidAlgebra K G₀` 用 `MonoidAlgebra.mapDomainAlgHom` 显式构造。

### 2.12 命题 5.1（中央扇区）——秩变恒等式的完整机械

**(a) 陈述**（Proposition 5.1 `prop:sector-ranks`，TeX 原样）：

> Let $K$ be a field of characteristic $p$, let $M$ be a positive integer prime to $p$, and assume
> that $K$ contains an element $\zeta$ of order $M$.  In the application,
> $M=p^4-1$ and $|K|=p^4$. Write $C_M=\mathbb Z/M\mathbb Z$ and put
> \[
>  P=(\mathbb F_p)^3,\qquad A_0=(C_M)^P,\qquad
>  H=A_0\rtimes P,\qquad w=|H|,
> \]
> where $P$ acts on the functions in $A_0$ by translation. Suppose that a
> countable group $G_0$ contains specified copies $H_1,\ldots,H_m$ of $H$.
> For each $i$, let $e_i\in K[H_i]$ be an idempotent, and assume that the
> positive integer
> \[
>  d=\dim_K e_iK[H_i]
> \]
> is independent of $i$. ... 

> Under these assumptions, there is a group $G_1$ containing $G_0$ and a
> central element $z\in G_1$ of order $M$ with the following property.  Set
> \[
>  R=K[G_1],\qquad
>  f=\frac1M\sum_{k=0}^{M-1}\zeta^{-k}z^k,\qquad
>  S=fR,\qquad P_i=fe_i.
> \]
> Then $f$ is a nonzero central idempotent.  There are explicitly
> specified matrices
> \[
>  J_i\in\operatorname{Mat}_{w\times d}(S),\qquad
>  Y_i\in\operatorname{Mat}_{d\times w}(S)
> \]
> satisfying
> \begin{equation}\label{eq:sector-rectangular}
>  Y_iJ_i=fI_d,\qquad J_iY_i=P_iI_w.
> \end{equation}
> The entries of $J_i$ and $Y_i$ lie in the group algebra of a finite
> subgroup of $G_1$, multiplied by $f$.  Their construction uses only
> finite group operations and linear algebra over $K$.

动机（§5 开头）："An idempotent in a finite group algebra has a well-defined rank as a linear operator. We now turn each of these numerical ranks into an isomorphism between modules over one common ring. The enlargement of the group is needed because the different simple or modular summands of the original group algebra need not have the same rank fraction."——**同一个 $d$ 在不同 $H_i$ 的不同和体会以不同的方式实现**；$G_1$ 的扇区 $S=fR$ 把它们统一到一个环上。

**(b) 三阶段不跳步推导**：

*阶段一：附加有限群（§5.1）*。

- 数据：$z$ 先生成独立的 $C_M$ 拷贝；$Q_{\rm base}=\langle z\rangle\times G_0$。每个 $i$：$B_i=(C_M)^{H_i}$（$H_i$ 上函数群）、$L_i=B_i\rtimes H_i$（**regular wreath**，$h\cdot b$ 平移指标：$(h\cdot b)(x)=b(h^{-1}x)$）、$\delta_i\in B_i$ 常值函数 1。"It has order $M$ and is fixed by $H_i$, so it is central in $L_i$. Moreover, $\langle\delta_i\rangle\cap H_i=1$. Thus $C_i=\langle z\rangle\times H_i$ embeds in both $Q_{\rm base}$ and $L_i$, with $(z^k,h)$ sent to $(k\delta_i,h)$ in the latter."
- $G_1$ = 自由积 $Q_{\rm base}*L_1*\cdots*L_m$ 按每对 $C_i$ 拷贝粘合的商。
- **嵌入证书**（"For completeness, the following action proves that all the factors embed"）：$X$ = 可数个 $Q_{\rm base}$-正则集的不交并；限制到 $C_i$ 自由、可数无穷轨道；可数个 $L_i$-正则集不交并 $X_i$ 同样；配对 $C_i$-轨道、逐点等变延拓给 $C_i$-等变双射 $X\to X_i$；搬运 $L_i$-正则作用到 $X$；各作用在每个 prescribed $C_i$ 上一致 ⟹ 拼成 $G_1$ 在 $X$ 上的作用，各因子忠实。"This argument uses the assumed embeddings $H_i\hookrightarrow G_0$ in defining the subgroups $C_i\le Q_{\rm base}$."——又是轨道配对置换作用（第三次使用）。
- *$f$ 的性质*："In $R$, direct multiplication gives $zf=\zeta f$, $f^2=f$. The coefficient of the identity in $f$ is $M^{-1}\ne0$, since the elements $1,z,\ldots,z^{M-1}$ are distinct."——$f\ne0$ 的见证是**恒等系数**，不依赖字问题（与 char-2 版 $e$ 的 $\ell^{-1}$ 恒等系数论证同型，char-2 素材 2.8(b)）。$S=fR$ 是以 $f$ 为单位元的环；$P_i=fe_i$ 是 $fK[L_i]$ 中的幂等元；"any identity $e_ie_j=0$ already valid in $K[G_0]$ remains valid after multiplication by $f$ in $S$"——2.9 的有序零积进入扇区。

*阶段二：扇区的矩阵块（§5.2）*。

- *Fourier 基*：$B_i$ 的特征 $\chi$ 由指数 $a_x\in\Z/M$ 给出（$\chi(b_x)=\zeta^{a_x}$，$b_x$ 是 $x$ 处坐标函数）；$p_\chi=\frac1{|B_i|}\sum_b\chi(b)^{-1}b$；"The denominator is invertible because $p\nmid M$."；$p_\chi$ 是两两正交幂等基、和为 1、$bp_\chi=\chi(b)p_\chi$（2.6 的引理搬到 $B_i$）。
- *$f$ 的 Fourier 展开*：作用 $(h\chi)(b)=\chi(h^{-1}\cdot b)$，$hp_\chi h^{-1}=p_{h\chi}$；$z=\delta_i$ 被 $H_i$ 固定 ⟹ $\mathcal X_i=\{\chi:\chi(z)=\zeta\}$ 是 $H_i$-不变集，且
  $$f=\sum_{\chi\in\mathcal X_i}p_\chi.\tag{eq:sector-fourier-f}$$
  （核对：$fp_\chi=\frac1M\sum_k\zeta^{-k}\chi(z)^kp_\chi=\frac1M\sum_k(\chi(z)/\zeta)^kp_\chi$，几何和 $=p_\chi$ 当 $\chi(z)=\zeta$、$=0$ 否则（$M$ 个 $M$ 次根的求和）。）
- *引理 5.2（稳定子初等交换）*（`lem:sector-stabilizers`，TeX 原样陈述："For each such $\theta$, the subgroup $T_\theta$ is elementary abelian of exponent $p$ and rank at most $3$, with the trivial subgroup allowed."）：证明——$\theta(b_x)=\zeta^{a_x}$，$z=\sum_{x\in H_i}b_x$（$B_i$ 的加法里！$\delta_i=\sum_x b_x$），条件 $\theta(z)=\zeta$ 即 $\sum_xa_x=1$（$\Z/M$ 中）。设非恒等 $g\in A_0\cap T_\theta$ 有阶 $q$：$q\mid M$（$A_0$ 的幂指数整除 $M$）；$g$ 左乘把 $H_i$ 分成长恰 $q$ 的轮换；$\theta$ 不变性 ⟹ 指数 $a_x$ 沿轮换为常数 ⟹ 总和 $\in q(\Z/M\mathbb Z)$；"It cannot equal $1$: reduction modulo $q$ would give $0=1$"（$q\mid M$ ⟹ $\Z/M\to\Z/q$ 满同态，把 $q(\Z/M)$ 映到 0、把 1 映到 1）。故 $T_\theta\cap A_0=1$；$T_\theta$ 注入 $H_i/A_0\cong P$；"Every subgroup of the additive group $(\mathbb F_p)^3$ is an $\mathbb F_p$-linear subspace, giving the assertion."——**素数幂阶 ⟹ 初等交换**，这正是 $p$-部进入扇区的形态。
- *块表示*：固定轨道代表 $\theta$，$T=T_\theta$、$s=[H_i:T]$、$D=K[T]$；陪集代表 $r_1,\dots,r_s$；$K[H_i]$ 是自由右 $D$-模。$g\in H_i$ 左乘 $L_g$，$b\in B_i$ 对角作用 $D_b(h)=(h\theta)(b)h$；两者都右 $T$-线性（$(ht)\theta=h\theta$）且半直积关系成立（$L_gD_bL_g^{-1}=D_{g\cdot b}$，中间步 $((g^{-1}h)\theta)(b)=(h\theta)(g\cdot b)$）。代数同态 $\rho_\theta:K[L_i]\to\Mat_s(D)$；"$z$ acts as $\zeta$, so $\rho_\theta(f)=I_s$"。
- *块逆公式*（eq:sector-block-inverse）：$p_{r_a\theta}\,r_at_0r_b^{-1}$（$t_0\in T$）属于 $fK[L_i]$（eq:sector-fourier-f）；在 $\theta$-表示中把 $r_bt'$ 送 to $r_at_0t'$、其余基陪集上为零（"its left group factor sends the coset $r_cT$ to $r_at_0r_b^{-1}r_cT$; the Fourier projection keeps this coset precisely when it equals $r_aT$, which is equivalent to $c=b$"）；其他轨道的表示中恒为零。**这就是 $E_{kl}^{\rm std}\otimes t_0$ 的显式原像**——扇区矩阵单位的逆公式。
- *同构*（eq:sector-blocks）：
  $$\rho:fK[L_i]\longrightarrow\prod_{\theta}\operatorname{Mat}_{[H_i:T_\theta]}(K[T_\theta]).$$
  满射（各块矩阵单位有原像）；单射："$p_\chi h$, for $\chi\in\mathcal X_i$ and $h\in H_i$, form a basis of its source. An orbit of size $s$ contributes $sw=s^2|T|$ basis elements, equal to the dimension of the corresponding target block."——维数相等 + 满射 ⟹ 同构；逆 = 逆公式线性延拓。

*阶段三：维数变恒等式（§5.3）*。

- *链接*：$E=\rho_\theta(P_i)\in\Mat_s(D)$；"As a $K$-linear operator on $K[H_i]$, $E$ is exactly left multiplication by $e_i$, since $f$ acts as the identity. Therefore $\dim_K\operatorname{im}E=d$."（eq:sector-regular-rank）——**原正则秩与块表示秩的桥**。
- *幂零增广*：$\varepsilon:D\to K$ 增广、$\mathfrak a=\ker\varepsilon$。由引理 5.2 取 $T\cong(C_p)^q$、$0\le q\le3$ 的生成元 $t_1,\dots,t_q$；$X_j=t_j-1$ 交换、$X_j^p=0$、生成 $\mathfrak a$；$D\cong K[X_1,\dots,X_q]/(X_1^p,\dots,X_q^p)$；故
  $$\mathfrak a^{D_{\max}+1}=0,\qquad D_{\max}=3(p-1).$$
  （"a monomial of total degree greater than $q(p-1)$ has an exponent at least $p$"——$D_{\max}=3(p-1)\ge q(p-1)$ 是不依赖 $q$ 的一致界；$q=0$ 时 $D=K$、$\mathfrak a=0$。）矩阵entries in $\mathfrak a$ 同样幂零（乘积 entry $\in\mathfrak a^{D_{\max}+1}$）。**这是 2.5 的 $D=3(p-1)$ 的第二次出场**——同一个数既卡 §3 的单项式次数、又卡 §5 的幂零指数。
- *贪心换基*：$\overline E=\varepsilon(E)$（entrywise）、$d_0=\operatorname{rank}_K\overline E$；$\overline E$ 幂等 ⟹ 其像与 $I_s-\overline E$ 的像互补；"Scan the columns of $\overline E$ in order and keep each column that increases their span; then do the same for $I_s-\overline E$."（**贪心列选择**——Lean 的 `GreedyColumns`：`Selected := {i | v i ∉ span K (v '' Set.Iio i)}`）；$Q$ = 相应的 $d_0$ 列（$E$ 的）+ $s-d_0$ 列（$I_s-E$ 的）；$Q_0=\varepsilon(Q)$ 可逆；$N=Q_0^{-1}(Q-Q_0)$ entries in $\mathfrak a$ ⟹ $N^{D_{\max}+1}=0$；$Q=Q_0(I_s+N)$ 给
  $$Q^{-1}=\Bigl(\sum_{k=0}^{D_{\max}}(-N)^k\Bigr)Q_0^{-1}.\tag{eq:sector-Q-inverse}$$
  $E$ 固定前 $d_0$ 列、杀其余 ⟹ $\Pi=\diag(I_{d_0},0)$、$EQ=Q\Pi$、$Q^{-1}EQ=\Pi$。共轭保 $K$-维数 ⟹ 整数恒等式
  $$d=d_0|T|,\qquad w=s|T|,\qquad wd_0=sd.\tag{eq:sector-dimensions}$$
  "In particular, these are equalities of ordinary dimensions, not equalities after reduction to $K$."——**幂零换基把"投影的秩"从 $K$ 层提升到 $D$ 层且不损失**：$\operatorname{im}E$ 是自由 $D$-模秩 $d_0$（局部环上投射模自由 = Kaplansky [Theorem 2] 的构造性实例，"no general projective-module theorem is needed here"）。
- *坐标配对*：字典序双射 $\{(\mu,l)\}_{\mu\le d,\,l\le s}\leftrightarrow\{(\lambda,k)\}_{\lambda\le w,\,k\le d_0}$（集合等势由 $wd_0=sd$）；$V$ = $w\times d$ 块矩阵（$s\times s$ entries，标准矩阵单位和），$W$ 反向；"$WV=I_d\otimes I_s$, $VW=I_w\otimes\Pi$"；$J^{(\theta)}=(I_w\otimes Q)V$、$Y^{(\theta)}=W(I_w\otimes Q^{-1})$；积 $Y^{(\theta)}J^{(\theta)}=I_d\otimes I_s$、$J^{(\theta)}Y^{(\theta)}=I_w\otimes E$。最后逐 entry 用 $\rho^{-1}$ 拉回：$\rho$ 把 $f$ 送到单位阵元组、$P_i$ 送到 $E$ 元组 ⟹ (eq:sector-rectangular)。
- *规范性收尾*："All choices in the matrix construction are over finite sets: character orbits, coset representatives, augmentation matrices, and coordinate pairings. Taking the first element or the first independent columns in fixed orders makes the prescription definite. The inverse (Q-inverse) is a finite sum, and the inverse (block-inverse) is a finite group-algebra formula."
- *应用*："The group $G_0$ is countable because it is finitely generated. All the ranks equal the positive integer $d$ from Equation (op:regular-rank). Hence the group $G_1$, the nonzero central idempotent $f$, and the matrices $J_i,Y_i$ are now fixed... Corollary (edge-zero) also gives $P_iP_j=0$ on every edge with $i<j$. These are precisely the inputs to the next section."——**五个输入**：$G_1$、$f$、$J_i,Y_i$（矩形恒等式）、$P_iP_j=0$（有序零积）、$S=fR$（公共环）。

**(c) 假设/常数的机械理由**：

- **为什么必须加群 $G_1$**：$e_iK[H_i]$ 的秩 $d$ 是 $K$-维数，但"矩形恒等式"需要**同一个环上**的 $Y_iJ_i=fI_d$——各 $K[H_i]$ 是不同的环；且 $K[H_i]$ 的各直和项秩分数不必一致（§5 开头）。$L_i=B_i\rtimes H_i$ 里的 regular wreath 让"扇区 $fK[L_i]$"包含一个与 $K[H_i]$ 同秩的幂等 $P_i=fe_i$ 的完整矩形实现——**b_i 的作用是把秩复制成自由模**。$z$ 的中心性（在各生成因子中心、故在 $G_1$ 中心）与阶 $M$（$Q_{\rm base}$ 嵌入）是 $f$ 的两个前提。
- **为什么允许稳定子非平凡**：§3 的 $\mathscr R$ 选自由轨道是因为矩阵单位律 $E_{xy}E_{zt}=\delta_{yz}E_{xt}$ 需要自由；§5 的扇区不需要矩阵单位律——它需要的是 $\rho:fK[L_i]\to\prod\Mat_s(D)$ 的**同构**，稳定子 $T\ne1$ 恰好把块变成 $\Mat_s(K[T])$，$D=K[T]$ 的幂零增广理想让换基 $Q$ 可逆（eq:sector-Q-inverse）。**幂零性是稳定子的补偿**：$T$ 越大（$s$ 越小），块越"厚"（$D$ 越大），但秩恒等式 $d=d_0|T|$ 保持精确。"Eliminating the prime-to-$p$ part of each stabilizer is what makes its augmentation ideal nilpotent, and will permit the later change of basis."（引理 5.2 后的批注）——若稳定子有 $p'$-部，$K[T]$ 不局部、投射模不必自由、$d=d_0|T|$ 失败。
- **$D_{\max}=3(p-1)$ 的复用**：§3 用它当单项式次数上限（零化论证）、§5 用它当幂零指数（换基级数 (eq:sector-Q-inverse) 的长度）。两处都源于"三个生成元、每个指数 $<p$"——$P$ 三维与 $X_j^p=0$ 的同一个后果。
- **整数化的秩比较**：$d/w>1/96$ 与 $t/m<1/100$ 在 §5 末变成 $r=wt<md=N$——"The strict, ordinary rational inequalities are..."——**分数比较只在整数层做一次**，环的非交换性不进入。Lean 对应：`SectorConstruction.lean`（`G₁`、`f`、`P`、`P_idem`、`P_ordered`、`fit_upper`）、`SectorGroup.lean`（`StarAmalgam.Amalgam` 型的 $G_1$、`original`/`central`/`base`/`factor` 及各单射）、`SectorStabilizer.lean`（`stabilizer`、`toPoint_injective`、`commutative`、`exponent : x^p = 1`、`commGroup` 实例）、`AugmentBound.lean`（`bounded`、`generator_nil`、`kernel_nil_of_basis`、`dimension_le_three`、`kernel_nil_three`——引理 5.2 + 幂零界）、`AugmentInverse.lean`（`error_entry_mem`、`error_nil`、`matrix_inverse_formula`——(eq:sector-Q-inverse)）、`GreedyColumns.lean`/`GreedyLift.lean`/`GreedyRing.lean`/`GreedyRectangle.lean`（贪心列 + $Q$ 矩阵 + $D$-层矩形：`rectangleYJ`、`rectangleJY`、`image_dimension`、`pair_dimension`）、`IdempotentFree.lean`（`projective`/`free`——局部环上投射模自由的构造性版本、`J`/`Y`、`YJ`/`JY`、`rectangular`）、`OrbitBlock.lean`/`SectorOrbit.lean`（轨道分解 `pack`/`pack_mul`/`pack_representation`——(eq:sector-blocks) 的轨道版）、`SourceSector.rectangular`（最终 $J_i,Y_i\in\Mat(MonoidAlgebra\ K\ (Wreath))$ 与 $Y*J=\diag f$、$J*Y=\diag(f\cdot\mathrm{push}\ e)$，其中 `hn : Fintype.card N = finrank (range (lmul e))` 即 $d$、`hw : card W = card H` 即 $w$）、`IndexCut.lean`（`inclusion`/`extra`/`misses`——坐标配对里"前 $d_0$ 列 + 补列"的 Lean 化，同时供 2.14 的 $\iota/\pi$）。

**(d) 候选失败路线**：

- 直接在 $K[H_i]$ 中造 $J_i/Y_i$（不加 $G_1$）[推测]：各 $K[H_i]$ 是不同环，$Y_iJ_i=I_d$ 的 "$I_d$" 无法统一；且 $K[H_i]$ 的单/模直和项秩分数不一致（§5 开头动机），矩形实现可能只在某个和体里存在而幂等 $e_i$ 横跨多个和体。$f$-扇区把"秩 $d$ 的幂等"集中到单一环 $S$。
- 用 Maschke 平均整个 $H_i$ [推测]：$|H_i|=M^{p^3}p^3$ 含 $p$ 因子，特征 $p$ 中不可逆——只能对 $p'$-部 $A_0$ 做 Fourier，稳定子轨道不可避免；硬要全平均会除以 0。这正是"modular"设置的本质：论文标题词 "modular translation representation"。
- 假设稳定子平凡 [推测]：§3 的自由轨道是选出来的（可采纳性），§5 的 $\mathcal X_i$ 轨道**无法**都自由（$\theta\mapsto$ 指数表的约束 $\sum a_x=1$ 与 $H_i$-作用可以相容地有固定点——$P$-部的小子群固定大特征群的非零向量）；若强行排除非平凡稳定子轨道，$f=\sum_{\chi\in\mathcal X_i}p_\chi$ 的分解不完备、$\rho$ 不是同构。幂零换基就是为消化它们而设。
- 用一般投射模自由定理（Kaplansky [Theorem 2]）代替构造性换基 [推测]：可行但 (i) 需要局部性判据（$\mathfrak a$ 幂零 ⟹ 局部环）的额外引理，(ii) 基的选择不"specified"（存在性而非显式贪心）。论文选构造性贪心（"no general projective-module theorem is needed here"），Lean 的 `GreedyColumns`/`GreedyLift` 是对应实现。

### 2.13 引理 6.1（三角压缩）——有序零积 + 拟合分解 ⟹ 一侧逆

**(a) 陈述**（Lemma 6.1 `op:compression`，TeX 原样）：

> We now use only the graph factorization and the precise common-sector
> output. The first lemma is independent of the group construction. Its
> proof explains why ordered edge annihilations, rather than symmetric
> orthogonality, suffice.

> \begin{lemma}[Triangular compression]\label{op:compression}
> Let $S$ be a nonzero unital algebra over a field $K$, and let $m,t,w,d$
> be positive integers. Suppose $P_i\in S$ are idempotents and
> $\alpha_i(T),\beta_j(T)\in K$ satisfy
> \[
>  F_{ij}=\sum_{T=1}^t\alpha_i(T)\beta_j(T),\qquad
>  F_{ii}=1,\qquad F_{ij}P_iP_j=0\quad(i<j).
> \]
> Suppose there are $J_i\in\Mat_{w\times d}(S)$ and
> $Y_i\in\Mat_{d\times w}(S)$ with
> $Y_iJ_i=I_d$, $J_iY_i=P_iI_w$. Then explicit matrices
> \[
>  C_\sharp\in\Mat_{wt\times md}(S),\qquad
>  D_\sharp\in\Mat_{md\times wt}(S)
> \]
> satisfy $D_\sharp C_\sharp=I_{md}$.
> \end{lemma}

**(b) 不跳步推导**（TeX 原样关键句 + 逐步展开）：

- *第一层（$t\times m$ 与 $m\times t$）*：$(C_0)_{T,j}=\beta_j(T)P_j$（$t\times m$）、$(D_0)_{i,T}=\alpha_i(T)P_i$（$m\times t$）。乘积 entries $=F_{ij}P_iP_j$（$\alpha_i(T)\beta_j(T)$ 求和与 $P_iP_j$ 用 $P_j$ 右、$P_i$ 左——注意 entry 的左因子 $P_i$ 与右因子 $P_j$ **不能交换**，求和里的 $T$-项共享同一对 $P_i,P_j$）。于是
  $$D_0C_0=\mathcal P+\mathcal N,\qquad \mathcal P=\diag(P_1,\dots,P_m),$$
  $\mathcal N$ 严格下三角：对角 entries $F_{ii}P_iP_i=P_i$（幂等）；$i<j$ 的 entries $F_{ij}P_iP_j=0$（假设第三条）；$i>j$ 的 entries 任意（不假设）。"In particular $\mathcal N^m=0$."（严格下三角的 $m$ 次幂必零——每乘一次列指标下移一层。）
- *交换信息的精确清单*："Every off-diagonal entry begins with $P_i$ and ends with $P_j$, so idempotence gives $\mathcal P^2=\mathcal P$, $\mathcal P\mathcal N=\mathcal N=\mathcal N\mathcal P$. This is all the commutation information needed."——核对：$\mathcal N$ 的 $(i,j)$ entry（$i>j$）形如 $P_i\cdot(*)\cdot P_j$；$\mathcal P\mathcal N$ 的 $(i,j)$ entry $=P_i\cdot P_i(*)P_j=P_i(*)P_j$（$P_i^2=P_i$）$=\mathcal N$ 的 entry ✓；右乘同理。"$P_i$ 不假设交换"——压缩引理的假设面刻意最小。
- *修正矩阵*：
  $$\mathcal Q=\mathcal P+\sum_{k=1}^{m-1}(-\mathcal N)^k$$
  满足 $\mathcal Q(\mathcal P+\mathcal N)=\mathcal P$："by cancellation of consecutive powers"——$\mathcal P\mathcal N=\mathcal N$ 让 $\mathcal P\cdot\mathcal N^k=\mathcal N^k$（$k\ge1$），于是
  $\mathcal Q(\mathcal P+\mathcal N)=\mathcal P^2+\mathcal P\mathcal N+\sum_{k=1}^{m-1}(-\mathcal N)^k\mathcal P+\sum_{k=1}^{m-1}(-\mathcal N)^k\mathcal N=\mathcal P+\mathcal N+\sum_{k=1}^{m-1}(-\mathcal N)^k+\sum_{k=2}^{m}(-\mathcal N)^k$；用 $\mathcal N\mathcal P=\mathcal N$：$\sum_{k=1}^{m-1}(-\mathcal N)^k\mathcal P=\sum_{k=1}^{m-1}(-\mathcal N)^k$。合并：
  $\mathcal P+\mathcal N+\sum_{k=1}^{m-1}(-N)^k+\sum_{k=1}^{m-1}(-N)^k+\sum_{k=2}^{m}(-N)^k$——不对，重算：$\mathcal Q(\mathcal P+\mathcal N)=\mathcal Q\mathcal P+\mathcal Q\mathcal N$。$\mathcal Q\mathcal P=\mathcal P^2+\sum_{k\ge1}(-N)^k\mathcal P=\mathcal P+\sum_{k\ge1}(-N)^k$。$\mathcal Q\mathcal N=\mathcal P\mathcal N+\sum_{k\ge1}(-N)^k\mathcal N=\mathcal N+\sum_{k\ge2}(-N)^k$。总和 $=\mathcal P+\mathcal N+\sum_{k\ge1}(-N)^k+\sum_{k\ge2}(-N)^k$。嗯这不对——符号交错：$(-N)^k\mathcal N=(-1)^kN^{k+1}$。所以 $\mathcal Q\mathcal N=\mathcal N+\sum_{k=1}^{m-1}(-1)^kN^{k+1}=\mathcal N-\sum_{j=2}^{m}(-1)^{j-1}N^{j}=\mathcal N+\sum_{j=2}^{m}(-N)^j$。而 $\mathcal Q\mathcal P=\mathcal P+\sum_{k=1}^{m-1}(-N)^k$。总和 $=\mathcal P+\mathcal N+\sum_{k=1}^{m-1}(-N)^k+\sum_{k=2}^{m}(-N)^k$。$= \mathcal P+\mathcal N+(-N)+\sum_{k=2}^{m-1}[(-N)^k+(-N)^k]+\dots$ 仍然交错相消：$\sum_{k=1}^{m-1}(-N)^k+\sum_{k=2}^{m}(-N)^k=(-N)+\sum_{k=2}^{m-1}[(-N)^k+(-N)^k]+(-N)^m$——这不消！让我重来，用整数环里的标准几何和验证逻辑：$Q=P+\sum_{k=1}^{m-1}(-N)^k$，要证 $Q(P+N)=P$。$Q(P+N)=QP+QN$。$NP=N$、$PN=N$。$QP=P^2+\sum_{k=1}^{m-1}(-1)^kN^kP=P+\sum_{k=1}^{m-1}(-1)^kN^k$。$QN=PN+\sum_{k=1}^{m-1}(-1)^kN^{k+1}=N+\sum_{j=2}^{m}(-1)^{j-1}N^j$。注意 $(-1)^{j-1}N^j=-(-1)^jN^j=-(-N)^j$。所以 $QN=N-\sum_{j=2}^{m}(-N)^j$。总和 $=P+N+\sum_{k=1}^{m-1}(-N)^k-\sum_{j=2}^{m}(-N)^j=P+N+(-N)+\sum_{k=2}^{m-1}(-N)^k-\sum_{j=2}^{m-1}(-N)^j-(-N)^m=P+N-N-N^m\cdot(\pm1)$。等等：$\sum_{j=2}^{m}(-N)^j=\sum_{k=2}^{m-1}(-N)^k+(-N)^m$，而 $\sum_{k=1}^{m-1}(-N)^k=(-N)+\sum_{k=2}^{m-1}(-N)^k$。所以总和 $=P+N+(-N)+\sum_{k=2}^{m-1}(-N)^k-\sum_{k=2}^{m-1}(-N)^k-(-N)^m=P-(-N)^m=P$（$\mathcal N^m=0$）。✓ 好，"cancellation of consecutive powers" 的精确含义：相邻 $N$-幂交错相消，残余 $(-N)^m=0$。$D_1=\mathcal QD_0$，$D_1C_0=\mathcal P$。"For $m=1$ the sum is empty and the same identity holds."
- *第二层（$w$ 重复制）*：块对角 $C_{\rm rep}$（$w$ 份 $C_0$）、$D_{\rm rep}$（$w$ 份 $D_1$）；坐标 $(\lambda,i)$ 与 $(\lambda,T)$；$D_{\rm rep}C_{\rm rep}=\mathcal P_{\rm rep}=\diag_{\lambda=1}^w(\mathcal P)$。
- *第三层（接扇区矩形）*：$\mathcal J:S^{md}\to S^{wm}$、$\mathcal Y:S^{wm}\to S^{md}$ 由 $J_i,Y_i$ 块对角拼装（$\delta_{ij}$ 型公式见 tex）；"$\mathcal Y\mathcal J=I_{md}$ and $\mathcal J\mathcal Y=\mathcal P_{\rm rep}$"（由 $Y_iJ_i=I_d$、$J_iY_i=P_iI_w$ 逐块）。于是
  $$C_\sharp=C_{\rm rep}\mathcal J,\qquad D_\sharp=\mathcal YD_{\rm rep}$$
  形状 $wt\times md$、$md\times wt$，且
  $$D_\sharp C_\sharp=\mathcal Y\mathcal P_{\rm rep}\mathcal J=\mathcal Y\mathcal J\mathcal Y\mathcal J=I_{md}.$$
  （中间步 $\mathcal P_{\rm rep}\mathcal J=\mathcal J$？不——用的恒等式是 $\mathcal P_{\rm rep}=\mathcal J\mathcal Y$，故 $\mathcal Y\mathcal P_{\rm rep}\mathcal J=\mathcal Y(\mathcal J\mathcal Y)\mathcal J=(\mathcal Y\mathcal J)(\mathcal Y\mathcal J)=I_{md}$。"Only associativity and the stated identities have been used; the $P_i$ are not assumed to commute."）

**(c) 假设/常数的机械理由**：

- **三条假设三处消费**：$F_{ii}=1$ 供对角 $\mathcal P$；$F_{ij}P_iP_j=0\ (i<j)$ 供 $\mathcal N$ 严格下三角（即 $\mathcal N^m=0$，修正级数的有限性）；$Y_iJ_i=I_d$、$J_iY_i=P_iI_w$ 供第三层的 $\mathcal Y\mathcal J/\mathcal J\mathcal Y$。**拟合分解只经 $\sum_T\alpha_i\beta_j$ 进入**（$F_{ij}$ 的具体值不需要——非边处 $F_{ij}=0$ 由命题 2.2 给、边处由零积假设吸收），这就是引理"独立于群构造"的含义。
- **为什么有序（$i<j$）零积够**：$\mathcal N$ 只需**严格下三角**——右上角必须零（$i<j$）、左下角自由（$i>j$ 的 $F_{ij}P_iP_j$ 任意）。若零积假设是对称的（$i\ne j$ 全零），$\mathcal N=0$ 更强但**代价是群侧需要对称正交**——2.9 已论证对称正交无机制。三角化让"有向的局部信息"足以启动幂零修正。intro："The asymmetry is what allows a triangular calculation to combine the two strict bounds."
- **$wt<md$ 不进入引理**：引理只造一侧逆；$wt<md$ 在引理 6.2 里用（$\pi u_*=0$ 的坐标预算）。分离设计：引理 6.1 是纯代数、引理 6.2 加维数悖论。
- 应用段落（§5 正文）：$S=fK[G_1]$（单位元 $f$）；"Distinct nonedges have $F_{ij}=0$ by Proposition 2.2; edges with $i<j$ have $P_iP_j=0$. The rectangular identities are exactly those of Proposition 5.1."；输出
  $$D_\sharp C_\sharp=fI_{md},\qquad C_\sharp:S^{md}\longrightarrow S^{wt}.\tag{op:split}$$
  以及不等式链
  $$\frac tm<\frac1{100}<\frac1{96}<\frac dw,\qquad r:=wt<md=:N.$$
  "This is more than an abstract rank paradox: it gives a nonzero vector that will certify the reverse-product defect."——**1/100 与 1/96 的缝隙在 $r<N$ 处兑现，且论文预告"将给出非零向量"**（下一条引理的 $u_*$）。
- Lean 对应：`Compression.lean`——逐条对位：`nilpotent_lower`（严格下三角 ⟹ 幂零）、`C₀`/`D₀`（同公式）、`D₀C₀`（$=\mathcal P+\mathcal N$ 的 entries 引理）、`diag_idempotent`/`C₀_diag`/`diag_D₀`（$\mathcal P^2=\mathcal P$ 与两侧吸收 $\mathcal P\mathcal N=\mathcal N=\mathcal N\mathcal P$）、`error`/`correction`/`D₁`/`corrected`（$\mathcal Q$ 与 $D_1C_0=\mathcal P$）、`rep`/`rep_mul`（$w$ 重复制）、`blockJ`/`blockY`/`blockYJ`/`blockJY`（$\mathcal J/\mathcal Y$ 与 $YJ=I$、$JY=\mathcal P_{\rm rep}$）。**注意 Lean 的 `corrected` 直接构造 `D₁ = correction * D₀` 而论文写 $\mathcal QD_0$——同一物，`correction` 即 $\sum(-N)^k$ 项。**

**(d) 候选失败路线**：

- 要求 $P_i$ 交换 [推测]：不必要且在应用里**为假**——$P_i=fe_i$ 来自不同 $H_i$ 的拷贝经粘合的元素，不交换；引理刻意把交换信息缩到 $\mathcal P^2=\mathcal P$ 与两侧吸收。"the $P_i$ are not assumed to commute" 是引理的设计卖点，也是它在 $K[G_1]$ 里可用的前提。
- 用 $C_0D_0$ 的修正对称地做 [推测]：$C_0D_0$ 的 entries 是 $\sum_T\beta_j(T)\alpha_i(T)P_jP_i$——注意**顺序反了**（$P_j$ 在左），$\mathcal P$-吸收失效、三角结构在另一侧不成立；而且我们根本不需要 $C_0D_0$ 的控制（$C_\sharp D_\sharp$ 无断言）。
- 跳过修正矩阵直接用 $D_0C_0=\mathcal P+\mathcal N\ne\mathcal P$ [推测]：第三层拼接时 $\mathcal Y(\mathcal P+\mathcal N)\mathcal J=I+\mathcal Y\mathcal N\mathcal J\ne I$；幂零修正不是化妆而是必需。

### 2.14 引理 6.2（方阵一侧逆与显式证书）

**(a) 陈述**（Lemma 6.2 `op:kernel`，TeX 原样）：

> \begin{lemma}[A square inverse and its certificate]\label{op:kernel}
> Let $R$ be a unital ring, $f\ne0$ a central idempotent, and $S=fR$.
> Suppose $N>r\ge1$ and matrices
> $C\in\Mat_{r\times N}(S)$, $D\in\Mat_{N\times r}(S)$ satisfy
> $DC=fI_N$. Let $\iota:S^r\to S^N$ include the first $r$ coordinates
> and $\pi:S^N\to S^r$ retain them, with entries $f$ and zero. Then
> \[
>  A_R=\pi D+(1-f)I_r,\qquad B_R=C\iota+(1-f)I_r
> \]
> satisfy $A_RB_R=I_r$ and $B_RA_R\ne I_r$. More precisely, if
> $u_*\in S^N$ has last coordinate $f$ and all others zero, then
> \[
>  v_*:=Cu_*\ne0,\qquad Dv_*=u_*,\qquad
>  A_Rv_*=0,\qquad (B_RA_R-I_r)v_*=-v_*\ne0.
> \]
> \end{lemma}

**(b) 不跳步推导**（TeX 原样 + 展开）：

- *"Every entry of $C,D,\iota,\pi$ belongs to $S$ and is annihilated on both sides by $1-f$. Since $\pi\iota=fI_r$,"*
  $$A_RB_R=\pi DC\iota+(1-f)I_r=fI_r+(1-f)I_r=I_r.$$
  （交叉项 $(1-f)\pi D$ 与 $C\iota(1-f)$：$(1-f)\cdot(\pi D 的 entry)=0$ 因 entry $\in S$、$1-f$ 左零化 $S$；同理右侧。$\pi DC\iota$：$DC=fI_N$，$\pi\cdot fI_N\cdot\iota=\pi\iota=fI_r$。）
- *$u_*$ 非零*："The vector $u_*$ is nonzero because $f\ne0$."（末坐标是 $f$ 本身。）
- *$Dv_*=u_*$*：$DCu_*=fu_*=u_*$（$u_*$ 的 entries 在 $S$ 中、$f$ 是 $S$ 的单位元）。这证明 $v_*\ne0$（否则 $u_*=0$）。
- *$A_Rv_*=0$*："But $N>r$ makes $\pi u_*=0$（$u_*$ 只有末坐标、$\pi$ 保留前 $r$ 坐标）, so
  $$A_Rv_*=\pi Dv_*+(1-f)v_*=0.$$"
  （$\pi Dv_*=\pi u_*=0$；$(1-f)v_*=0$ 因 $v_*=Cu_*$ 的 entries $\in S$。）
- *终式*："Multiplying by $B_R$ and subtracting $v_*$ gives the final displayed identity"：$A_Rv_*=0\Rightarrow B_RA_Rv_*=0\Rightarrow(B_RA_R-I_r)v_*=-v_*\ne0$（$v_*\ne0$ 故左乘 $B_R$ 不会湮灭……准确地说 $B_R(A_Rv_*)=0$，减 $v_*$ 得 $(B_RA_R-I_r)v_*=-v_*$，右端非零 ⟹ $B_RA_R\ne I_r$）。

**(c) 假设/常数的机械理由**：

- **$u_*$ 的"末坐标"选择**：$\pi$ 保留**前** $r$ 坐标，所以证书向量必须活在 $\ker\pi$ 里——末坐标（第 $N$ 个）恰是 $\pi$-核的成员（$N>r$ 保证第 $N$ 坐标 $>r$）。若取首坐标，$\pi u_*\ne0$、$A_Rv_*\ne0$、证书消失。Lean 对应：`SquareCertificate.u f a = Pi.single a f`（任取 $a$ 但 `SquareCertificate` 证明里 $a$ 需在 $\pi$-核——实现上取 `IndexCut.extra`，即 $\iota$ 不覆盖的那个坐标；`inclusion_ne_extra : inclusion d i ≠ extra d`——**$2.12$ 的 `IndexCut.extra` 在这里复用**：extra = 大集合的最后一个元素，正是"末坐标"）。`SquareCertificate.certificate` 与 `reverse_ne` 是本引理的 Lean 化。
- **$f$ 中心 + $S=fR$ 的"补身份"机制**：$A_R,B_R$ 定义在**整个** $K[G_1]$ 上（不只 $f$-扇区）——$(1-f)I_r$ 把扇区外的直和项填上单位阵，与 char-2 版 (3.13) 的 $(1-e)I_m$、§6 引理 7.2 的 $1_{\mathcal B}-g$ 是同一个"补身份"手法（char-2 素材 2.9/2.11 的 `(1-e)I_m` 项与 `1-f_blk`）。区别：这里补身份在**方阵层**先做（引理 6.2），§6 的引理 7.2 在**标量层**再做一次（经过 Heisenberg 编码后）。
- **证书不依赖字问题**："The nonzero certificate is rooted in the exact order of $z$, which proves $f\ne0$, and then in $D_\sharp v_*=u_*$. It does not depend on identifying a coefficient by deciding equality of group words."（§5 正文）——$f\ne0$ 来自恒等系数 $M^{-1}$（2.12），$v_*$ 的非零性来自 $Dv_*=u_*$ 的**方程**而非系数识别。与 char-2 版"certificates 独立于字问题"（char-2 素材 2.10(d)）同一设计原则。
- 应用：$C=C_\sharp$、$D=D_\sharp$（引理 6.1 输出）给方阵 $A_R,B_R\in\Mat_r(K[G_1])$（$r=wt$）、$A_RB_R=I_r$、$B_RA_R\ne I_r$。

**(d) 候选失败路线**：

- 用秩/行列式论证缺陷 [推测]：$K[G_1]$ 非交换、无行列式；$S^{wt}\to S^{md}$ 的"秩"论证在非交换环上不直接。显式 $u_*$ 是构造性的、可形式化的（Lean 的 `SquareCertificate` 全部是等式推导 + `Pi.single` 计算）。
- 让 $\iota/\pi$ 用普通坐标（entries 1 而非 $f$）[推测]：$\pi\iota=I_r$（不是 $fI_r$）会让 $A_RB_R=I_r+\pi DC\iota$ 的交叉项出现 $1-f$ 因子未消的项；entries 必须在 $S=fR$ 中（被 $1-f$ 双侧零化）才能把 $A_RB_R$ 拼成 $I_r$。Lean `SquareCertificate` 的 `sector_right/complement_left/complement_right` 正是这三条吸收引理。
- 试图同时得到 $B_RA_R=I_r$ 与缺陷 [推测]：矛盾——$A_RB_R=I_r$ 而 $B_RA_R\ne I_r$ 是**单向**的；若两者都等，$u_*$ 的构造立即给出 $-v_*=0$，与 $v_*\ne0$ 矛盾。这是维数悖论 $r<N$ 的强制性（在非交换环上通过显式向量而非抽象秩表现）。

### 2.15 命题 7.1（Heisenberg 矩阵单位）——合成阶的 shift-modulation

**(a) 陈述**（Proposition 7.1 `op:heisenberg`，TeX 原样）：

> Let $K$ be a field, let $M\ge2$ be invertible in $K$, and let
> $\zeta\in K$ have order $M$. For an integer $q\ge0$ put
> $Z_q=(\mathbb Z/M\mathbb Z)^q$ and $n=M^q$. There is a finite group
> $\Lambda$ of order $Mn^2$ and a nonzero central idempotent
> $f'\in K[\Lambda]$ for which explicitly specified elements
> $\Omega_{uv}$, $u,v\in Z_q$, form a basis of $f'K[\Lambda]$ and obey
> \[
>  \Omega_{uv}\Omega_{st}=\delta_{vs}\Omega_{ut},\qquad
>  \sum_u\Omega_{uu}=f'.
> \]
> Thus $\Mat_n(K)\cong f'K[\Lambda]$ by its standard matrix units.

**(b) 不跳步推导**（TeX 原样关键句 + 展开）：

- *群律*：$\Lambda=Z_q\times Z_q\times\Z/M\Z$，
  $$(x,y,k)(x',y',k')=(x+x',y+y',k+k'+y\cdot x').\tag{op:heisenberg-law}$$
  结合性："Associativity follows from the bilinear identity $y\cdot x'+(y+y')\cdot x''=y'\cdot x''+y\cdot(x'+x'')$."；恒等元零元组；逆 $(-x,-y,-k+y\cdot x)$。"No primality of $M$ is involved."——**$M$ 合成照样成立**（结合性只用双线性）。$z'=(0,0,1)$ 中心、阶恰 $M$。
- *$f'$*：$f'=\frac1M\sum_{k=0}^{M-1}\zeta^{-k}(z')^k$；"Reindexing gives $z'f'=\zeta f'$, and convolution gives $(f')^2=f'$. The identity coefficient $M^{-1}$ is nonzero, so $f'\ne0$."（与 2.12 的 $f$ 完全同型——同一个"中心循环群上的 ζ-幂等"模板，char-2 版的 (3.7) $e=\ell^{-1}\sum\zeta^{-r}z^r$ 是其素数阶特例。）
- *$D_v$ 与复合阶正交性*：$X_x=(x,0,0)$、$Y_y=(0,y,0)$；
  $$D_v=\frac1n\sum_{y\in Z_q}\zeta^{-y\cdot v}f'Y_y.\tag{op:heisenberg-D}$$
  分母 $n=M^q$ 可逆。**复合阶正交性**：
  $$\sum_{y\in Z_q}\zeta^{y\cdot a}=\begin{cases}n,&a=0,\\0,&a\ne0.\end{cases}\tag{op:composite-orthogonality}$$
  "$a\ne0$ 时 choose a nonzero coordinate $a_j$. Translation of the sum by the $j$th coordinate vector multiplies it by $\zeta^{a_j}\ne1$. In the field $K$, this forces the sum to vanish. The argument still works when $a_j$ is a zero divisor modulo the composite integer $M$."——**零因子无关**：$\zeta$ 阶恰 $M$ ⟹ $a_j\not\equiv0\pmod M\Rightarrow\zeta^{a_j}\ne1$，平移消去不需要除法。这是"合成循环阶"的关键引理（素数阶版本 = char-2 (3.9) 的几何级数论证的直积化）。
- *$D_v$ 幂等正交*：$D_vD_t$ 中 $f'Y_b$ 的系数 $=\frac{\zeta^{-b\cdot t}}{n^2}\sum_y\zeta^{y\cdot(t-v)}$——用 (op:composite-orthogonality) 得 $\delta_{vt}$ 型。$\sum_vD_v=f'$（同一定理的 $a=0$ 情形）。群律给 $Y_yX_a=(z')^{y\cdot a}X_aY_y$，故 $f'$ 穿过（$ez'=\zeta e$ 型）后 $D_vX_a=X_aD_{v-a}$。
- *矩阵单位*：
  $$\Omega_{uv}=X_{u-v}D_v=X_{u-v}\frac1n\sum_{y\in Z_q}\zeta^{-y\cdot v}f'Y_y.\tag{op:matrix-units}$$
  $$\Omega_{uv}\Omega_{st}=X_{u-v+s-t}D_{v-s+t}D_t=\delta_{vs}\Omega_{ut}.$$
  （$D_{v-s+t}D_t=\delta_{v-s,0}D_t=\delta_{vs}D_t$；$X_{u-v}X_{s-t}=X_{u-v+s-t}$，$v=s$ 时 $u-v+s-t=u-t$。）对角和 $\sum_u\Omega_{uu}=\sum_uX_0D_u=\sum_uD_u=f'$。
- *独立性与维数*（"The multiplication identities alone do not yet prove that this block has no kernel"）：表示
  $$\rho(x,y,k)\mathbf e_s=\zeta^{k+y\cdot s}\mathbf e_{s+x}\quad\text{on }K^{Z_q}.$$
  "The scalar in a composite is $\zeta^{k+k'+y\cdot x'+(y+y')\cdot s}$, so Equation (heisenberg-law) proves that $\rho$ is a representation."（复合标量的指数 $k+k'+y\cdot x'+(y+y')\cdot s=(k+k'+y\cdot x'+y'\cdot s)+y\cdot s$……核对：$\rho(g)\rho(g')\mathbf e_s=\zeta^{k+y\cdot s'}\zeta^{k'+y'\cdot s}\mathbf e_{s'+x'+x}$，其中 $s'=s+x'$：指数 $=k+k'+y\cdot(s+x')+y'\cdot s=k+k'+y\cdot x'+(y+y')\cdot s$ ✓ 与 $g\cdot g'$ 的 $\rho$ 值一致。）$\rho(f')=\mathrm{id}$、$\rho(D_v)=$ 坐标投影 at $v$，故 $\rho(\Omega_{uv})\mathbf e_s=\delta_{vs}\mathbf e_u$——**$n^2$ 个 $\Omega_{uv}$ 的像线性无关 ⟹ 自身线性无关**。反向计数："the $n^2$ elements $f'(x,y,0)$ span $f'K[\Lambda]$, because $f'(x,y,k)=\zeta^kf'(x,y,0)$. Their group-basis supports have distinct $(x,y)$ coordinates, so they too are independent. The sector has dimension exactly $n^2$, and the matrix units form a basis."——$f'K[\Lambda]$ 的维数：$\Lambda$ 的每个陪集 $(x,y)+\langle z'\rangle$ 贡献 $f'$-扇区内的一维（$f'(x,y,k)=\zeta^kf'(x,y,0)$），共 $n^2$。
- *$q=0$ 退化*："the empty tuple set has one element: $n=1$, $\Lambda=C_M$, and the sole matrix unit is $f'$. All formulas remain valid."

**(c) 假设/常数的机械理由**：

- **为什么是 Heisenberg 群**：矩阵单位律 $\Omega_{uv}\Omega_{st}=\delta_{vs}\Omega_{ut}$ 需要"shift（$X$）× modulation（$D$）"结构——$D$ 幂等正交（对角投影）、$X$ 平移投影指标、交换关系 $D_vX_a=X_aD_{v-a}$ 让 $\Omega_{uv}=X_{u-v}D_v$ 的乘积恰好筛出 $v=s$。这是有限 Heisenberg 群的 Stone–von Neumann 图像（论文引 Gurevich–Hadani [Section 1.2] 但强调 "the comparison is methodological, since our cyclic order can be composite and our coefficient field is finite"）。与 char-2 版的 $F=(\Z/\ell)^m\rtimes S_m$ 对比：那边矩阵单位 $p_{ij}=\sigma_ip_1\sigma_j^{-1}$ 靠**置换共轭**、载体维数 $m^2$ 由行数决定；这边靠**中心扩张的交换关系**、载体维数 $n^2=M^{2q}$ 由**倍增搜索**决定——$q$ 取"最小 $M^q\ge r$"（推论 7.3），嵌套任意 $r$。
- **$M$ 合成不伤论证的三处**：群律结合性（双线性）；正交性 (op:composite-orthogonality)（本原性 ⟹ $\zeta^{a_j}\ne1$）；表示 $\rho$（指数加法）。Lean 对应：`Heisenberg.lean`（`GroupData`、`dot` 的双线性引理 `dot_mul_left/right`、`card = M*(M^q)^2`、`central`、`X`、`Y`）、`Fourier.lean` 的 `cyclicCharacter : C M →* Kˣ` 与 `cyclicCharacter_injective`（$\zeta^a=\zeta^b\iff a\equiv b\pmod M$——复合阶的"本原性单射"，零因子情形由阶恰 $M$ 保证）、`HeisenbergRepresentation.lean`（`ρGroup`、`ρ`、`f`、`p v`、`D v`、`xElt`、`Ω u v = xElt (u*v⁻¹) * D v`、`ρ_Ω`）、`HeisenbergSector.lean`（`Sector`、`frame`、`span_frame`、`sector_dim_le`、`encode`、`encode_injective`、`ρ_encode`、`ρ_injective_on_sector`、`Ω_mul`、`Ω_sum`——$\Omega$ 律与维数计数的完整 Lean 化）、`MatrixUnits.lean`（`lift`、`lift_injective`、`lift_mul`、`regular_rank_bound`——"正则秩 vs 表示秩"的通用引理，与 2.7 的区分同型）。

**(d) 候选失败路线**：

- 假设 $M$ 素数 [推测]：$M=p^4-1$ 是偶合数，素性假设直接不可用；正交性的平移论证恰好不需要素性——"No primality of $M$ is involved"（群律处）与 "The argument still works when $a_j$ is a zero divisor"（正交性处）是论文的两处显式防御。
- 用 $(\Z/M)^2$ 交换群直接造矩阵单位 [推测]：交换群代数的 Fourier 基只给**正交幂等**（$p_\chi p_\psi=\delta_{\chi\psi}p_\chi$），没有 shift-modulation 交叉关系，拼不出 $\Omega_{uv}\Omega_{st}=\delta_{vs}\Omega_{ut}$ 的非对角矩阵单位——最多得到对角代数 $K^n$。中心扩张 $k+k'+y\cdot x'$ 的 2-上循环正是 $X$ 与 $D$ 的交换子来源。
- 用 char-2 版的 $(\Z/\ell)^m\rtimes S_m$ [推测]：需要 $\ell$ 素（$|B|=\ell^m$ 的可逆平均）与行数 $m$ 匹配维数 $m^2$；这里要嵌 $r=wt$ 阶方阵而 $r$ 与任何"自然"行数不匹配，倍增搜索 `leastQ` 是必须的（char-2 版 $m$ 恰好同时是秩参数与矩阵单位数，无搜索）。

### 2.16 引理 7.2（补身份，不要求中心）与推论 7.3（标量化）

**(a) 陈述**（Lemma 7.2 `op:complement`，TeX 原样）：

> The elementary identity-completion step is worth recording separately.
> Its unit need not be central in the target ring.

> Let $\Phi:\mathcal A\to\mathcal B$ be an injective ring homomorphism
> between unital rings, not necessarily preserving their identities, and
> put $g=\Phi(1_{\mathcal A})$. If $AB=1_{\mathcal A}$ and
> $BA\ne1_{\mathcal A}$, then
> \[
>  a=1_{\mathcal B}-g+\Phi(A),\qquad
>  b=1_{\mathcal B}-g+\Phi(B)
> \]
> satisfy $ab=1_{\mathcal B}$ and $ba\ne1_{\mathcal B}$.

证明（全文照抄）："The element $g$ is idempotent and is an identity on the image of $\Phi$ on both sides. Thus $1-g$ annihilates that image on both sides. Expanding the two products gives $ab=1-g+\Phi(AB)=1$, $ba-1=\Phi(BA-1)\ne0$. Only the last inequality uses injectivity; no global centrality of $g$ is required."

展开：$g^2=g$（$\Phi(1)^2=\Phi(1)$）；$\Phi(A)g=\Phi(A1)=\Phi(A)$、$g\Phi(B)=\Phi(1B)=\Phi(B)$（同态性，不必单射）；于是 $\Phi(A)(1-g)=0$、$(1-g)\Phi(B)=0$；展开 $ab=(1-g)+\Phi(A)(1-g)+(1-g)\Phi(B)+\Phi(A)\Phi(B)=1-g+\Phi(AB)=1-g+g=1$。$ba-1=\Phi(B)\Phi(A)-1+（被零化的交叉项）=\Phi(BA-1)$，$\Phi$ 单射 + $BA\ne1$ ⟹ 非零。

**(b) 推论 7.3 `op:scalar`**（TeX 原样）：

> Under the field hypotheses of Proposition~\ref{op:heisenberg}, suppose
> $A,B\in\Mat_r(K[L])$ for a group $L$ and an integer $r\ge1$, with
> $AB=I_r$ and $BA\ne I_r$. Finite formulas give a finite group $\Lambda$
> and $a,b\in K[L\times\Lambda]$ with $ab=1$ and $ba\ne1$.
> In particular, over any fixed finite field with at least three elements,
> a failure of stable finiteness transfers to a scalar failure after a
> finite direct factor, without changing the field.

证明机制：

- *倍增搜索*："Choose the least $q\ge0$ with $n=M^q\ge r$. This search is finite, since $M^r\ge2^r\ge r$."（$M\ge2$。）
- *补齐方阵*：$\widetilde A=\diag(A,I_{n-r})$、$\widetilde B=\diag(B,I_{n-r})$；"The padding is empty if $n=r$. Then $\widetilde A\widetilde B=I_n$ and $\widetilde B\widetilde A-I_n=\diag(BA-I_r,0)\ne0$."——**补单位块不伤缺陷**：反向差在对角块上原样保留。
- *编码*：群基分解 $K[L\times\Lambda]=K[L]\otimes_KK[\Lambda]$；$\Phi(T)=\sum_{u,v}T_{uv}\otimes\Omega_{uv}$；"The matrix-unit products prove multiplicativity, with $\Phi(I_n)=1\otimes f'$. Independence of the $\Omega_{uv}$ gives injectivity: extend their coordinate dual functionals to $K[\Lambda]$ and apply each in the second tensor factor to recover $T_{uv}$. This works even when $K[L]$ has zero divisors."（对偶泛函 = 把 $\Omega_{uv}$-坐标读出，$K[L]$ 的零因子不影响——只动第二个张量因子。）
- *输出*（eq:op:scalar-formulas）：
  $$a=1\otimes(1-f')+\sum_{u,v\in Z_q}\widetilde A_{uv}\otimes\Omega_{uv},\qquad
    b=1\otimes(1-f')+\sum_{u,v\in Z_q}\widetilde B_{uv}\otimes\Omega_{uv}.$$
  "Their full scalar product is one, and their reverse defect is $\Phi(\widetilde B\widetilde A-I_n)\ne0$."——引理 7.2 的直接应用（$\mathcal A=\Mat_n(K[L])$、$\mathcal B=K[L\times\Lambda]$、$g=1\otimes f'$；**$g$ 恰好中心**——$f'$ 中心——但引理没用这一点）。
- *末句的应用备注*："For a finite field of order $Q\ge3$, take $M=Q-1$ and a generator of its multiplicative group. Then $M\ge2$ is invertible in the field, so the preceding construction applies."——**任意** $\ge3$ 元有限域上的稳定有限失败都传成标量失败（本文 $Q=p^4$、$M=p^4-1$、$\zeta=$ 本原元，正好是 2.2 造好的）。

**(c) 机械理由与 Lean 对应**：

- 引理 7.2 把"补身份"从具体构造（char-2 的 $1-f_{\rm blk}+\Phi$、引理 6.2 的 $(1-f)I_r$）抽象成**环层引理**——单位不必中心是因为"像的两侧恒等"只需 $\Phi(A)g=\Phi(A)$（同态性）而非 $g$ 与一切交换。这一抽象是奇特征版的新增（char-2 版在 §3.5 内联做，没有单独引理）。
- 推论 7.3 的"without changing the field"值得划线：char-2 版的标量化也在原域做（$F$ 的平均只用 $|B|=\ell^m$ 奇），两边都不需要扩域；但 char-2 版需要在构造**起点**就把 $K$ 造得含 $\zeta$（degree $h(\ell-1)$），奇特征版靠 $|K^*|=p^4-1$ 天然含本原元——**奇特征给"本原根免费"，特征 2 要显式扩域**。
- Lean 对应：`ScalarAlgebra.lean`（`block`、`block_mul`、`block_sandwich`、`block_injective`、`scalar_witnesses`——$\Phi$ 的可乘性与单射；`output X = 1 - block f q 1 + block f q X`、`output_formula`、`prescribed_scalar_products`——式 (op:scalar-formulas)；`leftMap`/`rightMap`/`left_right_commute`/`product_coeff`/`product_ne_zero`——$K[L\times\Lambda]=K[L]\otimes K[\Lambda]$ 的直积分解工具）、`Transfer.lean`（`matrixEquiv`、`scalar`、`scalar_products`、`pad`/`pad_mul`/`pad_ne_one`——$\widetilde A/\widetilde B$ 补齐；`power_search`/`leastQ`/`leastQ_spec`/`leastQ_min`——倍增搜索；`finite_field_data`——推论末句的"任意 $\ge3$ 元有限域"版本，`Main.lean` 的 `fixed_field_transfer` 用它）、`GeneralTransfer.lean`（`fixed_field_transfer_general`）、`FiniteInverse.lean`（`series`/`series_mul`/`inverse_formula`——(eq:sector-Q-inverse) 型级数逆的通用版）、`SquareConstruction.lean`（`slotOrder`/`lexOrder`/`orderedIndex`/`smallIndex`/`largeIndex`/`inclusion`/`extra`——引理 6.2 的坐标实例化；`squareA`/`squareB`/`square_products`/`visible_certificate`；`A`/`B`/`products`；`q = FixedField.leastQ`、`Λ = Heisenberg.GroupData M q`、`G := G₁ × Λ`、`a`/`b`/`scalar_products`、`torsion`）。

**(d) 候选失败路线**：

- 要求 $g$ 中心 [推测]：引理不需要；但更深的防御是——在非中心情形强行用 $1_{\mathcal B}-g$ 两侧乘会引入 $g\Phi(A)\ne\Phi(A)$ 型修正项。论文抽象引理的设计让推论 7.3 不必检查 $f'$ 与 $\Omega_{uv}$ 的交换（虽然它中心）。
- 用 $\Mat_r$ 直接等于 $K[\Lambda']$ 的子代数、$\Lambda'$ 更小 [推测]：$\Mat_r(K)$ 嵌入有限群代数需要 $n^2$ 个矩阵单位 ⟹ $|\Lambda'|\ge n^2$；Heisenberg 给 $Mn^2$，接近下界；更小的载体（如 $n^2$ 阶群）需要非中心幂等结构，未知构造。
- 把补身份省掉、直接输出 $\Phi(\widetilde A),\Phi(\widetilde B)$ [推测]：$\Phi(A)\Phi(B)=\Phi(I_n)=1\otimes f'\ne1$——得到的是扇区内的单位，不是全代数的单位；$1\otimes(1-f')$ 恰好填平扇区外（与 char-2 素材 2.9(d) 路线 2 同型的错误）。

### 2.17 主定理的收尾证明（§6 末）

**(a) 证明链**（TeX 原样骨架）：

> Lemma~\ref{op:field} supplies the specified odd prime and field of
> order $p^4$. Propositions~\ref{op:graph} and~\ref{op:modular} give the
> graph fit and the strict regular-rank comparison.
> Proposition~\ref{prop:first-gluing-injective} embeds the local groups
> in $G_0$, and Proposition~\ref{prop:sector-ranks} places their ranks in
> the nonzero ring $fK[G_1]$ with the required rectangular identities.
> Corollary~\ref{op:edge-zero} supplies every ordered edge product.
> Lemmas~\ref{op:compression}
> and~\ref{op:kernel} produce $A_R,B_R\in\Mat_r(K[G_1])$, with their
> nonzero certificate. Corollary~\ref{op:scalar}, using $L=G_1$ and
> $M=p^4-1$, gives $G=G_1\times\Lambda$ and the sums
> in Equation~\ref{op:scalar-formulas}. Their product is one and their
> reverse-product defect is nonzero by the injectivity of the matrix
> encoding.

> The group $G_0$ is generated by the finite groups $H_i$. The construction
> of $G_1$ adds only $\langle z\rangle$ and the finitely many finite
> groups $L_i$, and $\Lambda$ is finite. Thus $G$ is finitely generated.
> The embedded copy of any $H_i$ supplies nontrivial torsion. All field,
> group and coefficient choices were given by finite formulas and fixed
> orders, as required.

**(b) 范围与推广的三个批注**（"Finite prescriptions and scope" 段，原文要点）：

1. "Every choice of character, basis, field element, or finite inverse occurs in an explicitly finite set. Products of the resulting group words define finite group-algebra sums even when different words happen to coincide. No word comparisons are needed to define the elements, and the kernel certificate and injective matrix block certify the nonzero reverse defect. The countable permutation actions used to certify group embeddings are not coefficient-search inputs."——**嵌入证书（轨道配对）不进 prescription**，与 char-2 版"its choices do not add generators or relators"（char-2 素材 2.12）同款。
2. "Containing torsion does not say that every element has finite order. The group must be infinite, since finite-dimensional left multiplication proves direct finiteness for every finite group algebra, in modular characteristic as well as otherwise."——与 char-2 版 intro 第一段的有限群论证同源（char-2 素材 1.1 的"finiteness problem"段）。
3. **FG 充分性**："More generally, the supports of any two finite sums in a group algebra generate a finitely generated subgroup. Its group algebra embeds by the group bases, preserving both a one-sided product and its nonzero reverse defect. Thus a universal direct-finiteness theorem for finitely generated groups would already imply the assertion for all groups."——主定理陈述 FG 版的正当性说明；同款论证在 char-2 版没有明写（char-2 主定理就是 FG 陈述但没有这句推广批注）。

**(c) Lean 对应**：`Main.lean` 的 `Prescribed.products : a*b = 1 ∧ b*a ≠ 1`（由 `Construction.scalar_products`）、`torsion : ∃ g, g ≠ 1 ∧ IsOfFinOrder g`（由 `Construction.torsion`）、`cellular_consequences`；主定理的装配顺序与论文逐条对应。

**(d) 失败路线** [推测]：在 FG 版之外顺手断言有限表现 [推测]——$G_1$ 是自由积的商，$G_0$ 由 $m$ 个有限群生成但关系系统（粘合关系）有限、$G_1$ 再加有限组，**实际上** $G$ 应该是有限表现的（图 of groups + 有限附加），但论文不做此断言（"finitely generated group"），因为证明没用到也不需要检查关系的完备性；Lean 的 `MainClaim` 同样只要 `Group.FG`。任何"加 FP"的改写都要重新审计粘合关系的有限性传递，收益为零。

### 2.18 命题 8.1（细胞自动机迁移）——同 char-2 §6

**(a) 陈述**（Proposition 8.1 `op:cellular`，TeX 原样）：

> Let $k$ be a finite field, $L$ a group, and $a,b\in k[L]$ with $ab=1$.
> Then $T_b:k^L\to k^L$ is an injective cellular automaton, with
> \[
>  \im T_b=\{y\in k^L:T_{ba}y=y\}.
> \]
> For every $h$ with $(ba-1)_h\ne0$, the configuration $\delta_h$ is
> absent from its image.

定义与乘积律：$(T_cx)(g)=\sum_uc_ux(gu)$（右邻域约定）；"Only the coefficient sum is finite; $x$ may have infinite support."；$(T_cT_dx)(g)=\sum_{u,v}c_ud_vx(guv)=(T_{cd}x)(g)$（eq:op:cellular-product）；忠实性 $(T_c\delta_h)(1_L)=c_h$。

**(b) 推导**（同 char-2 命题 6.2，char-2 素材 2.15——**文字几乎逐句相同**）：$T_aT_b=T_{ab}=\id$ 供单射；$\im T_b=\operatorname{Fix}(T_{ba})$（⊂：$T_{ba}T_bx=T_bT_aT_bx=T_bx$；⊃：$y=T_b(T_ay)$）；$(T_{ba}\delta_h-\delta_h)(1_L)=(ba-1)_h\ne0$ ⟹ $\delta_h$ 不是不动点 ⟹ 不在像中——"The argument excludes preimages of arbitrary support"（intro），缺失配置的论证对所有配置成立。

**(c) 与 char-2 版的文本对比**：char-2 版 §6 的引理 6.1 + 命题 6.2 + 推论 6.3/6.4 三层结构，在奇特征版压缩成一个命题 + 应用段；乘法约定、像刻画、缺失指示子的论证逐字对应。差异只有：奇特征版没写推论 6.4 型的"经嵌入定理搬到 type $F_\infty$ 群"的伴侣论文引用（char-2 有伴侣嵌入定理论文；odd 版没有对应段）。应用段（TeX 原样）："Apply the proposition to the scalar sums in Equation (scalar-formulas). Their nonzero defect has a nonzero coefficient in the group basis, so the resulting automaton is injective and nonsurjective. The missing point indicator has no preimage even among infinitely supported configurations. If the finite formula for $b$ displays a group element more than once, its terms simply add in the same local rule; specifying the rule requires no word-problem oracle. Thus the constructed group also gives a negative answer to Gottschalk's surjunctivity conjecture."

**(d) 失败路线**：同 char-2 素材 2.15(c) 的两条（限制到有限支撑配置；把见证群嵌入熟悉群）。补充一条奇特征版特有的 [推测]：把 $k$ 换成任意域 [推测]——命题陈述只对**有限**域（字母表 $k$ 本身须有限供 CA 定义），引理 7.3 末句的 "$Q\ge3$" 也是为此；无限域的字母表问题超出本构造。

---

## 三、叙事时间线：论文自述动机、划界原话与引用语境全录

取证规则（本节自定，全节遵守）：

- 所有引文一律从 `build/paper.tex` 与 `build/sections/01–06*.tex` 的 **tex 源码逐字复制**（不是 PDF 提取，避免连字/换行伪迹），标注"文件:行号"。引文内的 TeX 命令（`\emph`、`~\cite`、`$...$`）**原样保留**，不做美化，因为措辞本身就是证据。
- 论文没有说的话，一律写"论文未述"，并在 3.12 汇总。
- 本节的功能定位：给"思维链复盘"提供**可引用的动机证据链**。奇特征版没有公开思维链 summary（`E:/math/reasoning_traces/` 只有 char-2 版的 23 页 PDF），所以我们唯一能反推作者思路的文本证据，就是论文自述 + 引用语境 + 防御性措辞三样，本节把它们榨干。

### 3.1 摘要与 intro 第一段：论文给自己的定位

摘要（`paper.tex:38–40`，全录）：

> We construct a counterexample to Kaplansky's direct-finiteness conjecture in odd characteristic. For one specified odd prime $p$, we obtain a field $K$ of order $p^4$, a finitely generated group $G$ containing torsion, and finite sums $a,b\in K[G]$ with $ab=1$ but $ba\ne1$. The same elements define a cellular automaton on $K^G$ that is injective but not surjective.

intro 第一段（`01-introduction.tex:4–11`，全录）：

> A group algebra $K[G]$ consists of finite sums $\sum_g c_g g$, with
> $c_g\in K$, multiplied by the group law and bilinearity. A unital ring is
> \emph{directly finite} when $ab=1$ implies $ba=1$; it is \emph{stably
> finite} when this implication holds in every finite square matrix ring.
> Kaplansky's direct-finiteness conjecture asks whether $K[G]$ is directly
> finite for every field $K$ and every group $G$, including groups with
> torsion. The result here is a negative answer in one specified
> odd characteristic.

四个可取证的措辞选择：

1. **开头不写任何"历史意义/重要性"套话**，直接从定义写起（"A group algebra $K[G]$ consists of finite sums…"）。对照 char-2 版 intro 的第一段是同一句式（char-2 素材 一、1.1），两篇共享同一"零背景假设"的写法：**不假设读者知道 Kaplansky 猜想在文献中的位置，只假设读者能读懂一句 $ab=1\Rightarrow ba=1$**。这是"构造型否证论文"的典型自我定位——它的价值主张在陈述本身，不在谱系。
2. **"including groups with torsion"**——猜想最难的部分被点名为挠率。这是本篇动机的唯一正面自述：全文的构造（每个 $H_i$ 含 $p$ 阶元 $u(s)$）就是冲着这个词去的。
3. **"in one specified odd characteristic"**——范围限定出现了两次（摘要 + 第一段末），并在 L29 第三次重申。这不是谦辞，是**声明口径**（见 3.11 防御性措辞第 1 条）。
4. 摘要**不提** nonsofic、**不提** Gottschalk 名字（只说"injective but not surjective"的 CA），而 char-2 版摘要明写 "The group $G$ is nonsofic" 与 "disproving Gottschalk's surjunctivity conjecture"。**同一系列、相隔三天的两篇，摘要口径明显收紧**（详见 3.4 对照表与 3.11 第 6 条）。

### 3.2 "The finiteness problem."：论文自己交代的困难在哪

intro 的具名段落第一段（`01-introduction.tex:31–36`，全录）：

> \paragraph{The finiteness problem.}
> For finite $G$, the algebra and all its finite matrix rings are
> finite-dimensional over $K$. A one-sided inverse between their left
> multiplication operators is therefore two-sided. This argument works even
> when the characteristic divides $|G|$. The difficulty for an infinite
> group is to obtain a corresponding conclusion from finite support alone.

逐句的功能：

- "This argument works even when the characteristic divides $|G|$"——**先把"模特征不是困难"钉住**。这句话的作用是排除一类误读：读者可能以为反例要靠"特征不整除 $|G|$"才成立。论文明说：有限情形下直有限性与特征无关，靠的是 $\operatorname{rank}$ 论证。所以本篇真正的困难必须来自**无限**。
- "to obtain a corresponding conclusion from finite support alone"——这一句是全篇构造的**问题陈述**。$K[G]$ 的元素只有有限支撑，但 $G$ 无限，于是"有限支撑 ⇒ 类似有限维的结论"就是要否证的东西。反过来说，构造只需要在**有限维像的层面**造出单侧逆，然后保证反向缺陷不被支撑有限性杀掉——这正好是 §5 压缩（三明治 $S^{md}\to S^{wt}\to S^{md}$，$wt<md$）+ §6 核证书的工作划分。
- 与本素材二、各节的关系：2.13（引理 6.1）"其证明解释为何有序的边湮灭而非对称正交就够用"（§5 开头原话见 3.11 第 8 条）就是这个"from finite support alone"的具体执行。

### 3.3 正向定理被明确列为"约束而非假设"

`01-introduction.tex:38–49`，全录：

> Kaplansky proved stable finiteness in characteristic zero using finite
> von Neumann algebras, and asked whether the one-sided-inverse property
> persists in positive characteristic~\cite[pp.~122--123]{Kaplansky1972}.
> Ara, O'Meara, and Perera proved stable finiteness for free-by-amenable
> groups over arbitrary division rings~\cite{AraOMearaPerera2002}.
> Elek and Szab\'o~\cite[Corollary~4.7]{ElekSzabo2004} established the
> same conclusion for all sofic groups. Such groups admit finite
> permutation models that approximate multiplication while keeping
> distinct elements separated.
> These theorems are constraints on the example, not hypotheses about its
> group. In particular, Elek--Szab\'o's theorem implies, after the scalar
> construction is completed, that $G$ cannot be sofic.

取证要点：

1. **猜想的出处被精确到页码**：`\cite[pp.~122--123]{Kaplansky1972}`（*Fields and Rings*, 2nd ed., Chicago Lectures in Mathematics）。全篇 bib 里只有这一条带页码的"猜想原始出处"引用，另一条 Kaplansky 条目是 `Kaplansky1958`（*Projective modules*, Ann. of Math. 68 (1958), Theorem 2），用途完全不同（见 3.6）。也就是说：**同一个人在 bib 里以"猜想提出者"和"局部环上射影模自由"两种身份各出现一次**，这两处在证明里互不相干。
2. "free-by-amenable"（Ara–O'Meara–Perera）与"sofic"（Elek–Szabó）两条并列，但**只有 Elek–Szabó 那条给出了对本篇的反推**（"$G$ cannot be sofic"）。AOP 那条纯粹是"不可触碰的邻域"：本篇的 $G$ 既不是 free-by-amenable 也不是 sofic，论文没有逐条说"$G$ 不可能是 AOP 意义下的群"，因为 AOP 的结论只在除法环上对 free-by-amenable 群成立，而我们的 $G$ 只需避开这个类。[推测] 论文没有把"非 sofic"放进摘要，是因为它是**推论而非构造目标**——真正的动力学目标是 §8 的 surjunctivity 反例，它比"$G$ 非 sofic"更强也更直接（非 sofic 只能由稳定有限性反推，而 surjunctivity 反例由 $a,b$ 直接给出）。
3. "These theorems are constraints on the example, not hypotheses about its group."——这是全篇最有思维链含量的一句方法论文：作者明确说明**已知正向定理在他的工作里扮演的角色是"设计约束/可行性筛子"，不是"引理"**。任何候选构造路线如果落进 sofic / free-by-amenable / char 0 三类之一，就自动出局。这条约束在 3.11 里会被复用（"为什么 $G$ 必须是粘合出来的、不能嵌入熟悉的群"）。
4. "after the scalar construction is completed"——时间状语很关键：非 sofic 这个结论**在 §6 标量化完成之前不可用**（矩阵级的反例不构成群环元素，也就不能对 $G$ 施加 sofic 约束）。这是作者对"论证顺序不可交换"的一次自认，对应素材二、2.13–2.17 的依赖链。

### 3.4 对特征 2 姊妹篇的划界原话（逐句拆 + 引用计数取证）

`01-introduction.tex:51–58`，全录：

> A separate characteristic-two construction uses incidence structures,
> polynomial pairings, a planar group-embedding argument, and character
> packing~\cite[Theorem~1.1]{OpenAICharacteristicTwo2026}.
> The construction here has a different local mechanism. A high-degree
> subspace of a modular translation representation is annihilated on one
> side; a weighted pairing gives a compatible annihilation on the other.
> The characteristic-two theorem is not an input to this odd-prime
> argument, and the two methods retain distinct coefficient hypotheses.

逐句功能标注（每句都在堵一类读者推论）：

| 原句 | 它在建立什么 | 它在否认什么 |
|---|---|---|
| "uses incidence structures, polynomial pairings, a planar group-embedding argument, and character packing" | 用四个名词概括 char-2 的四层机制 | — |
| "The construction here has a **different local mechanism**" | 差异被定位到"局部机制"这一层，而非"整体骨架" | 否认"只是把 2 换成 p 的参数替换" |
| "A high-degree subspace of a modular translation representation is annihilated on one side; a weighted pairing gives a compatible annihilation on the other." | odd 版自己的两句机制摘要：**单侧靠高次子空间被湮灭，另一侧靠加权配对给出相容湮灭** | — |
| "The characteristic-two theorem is **not an input** to this odd-prime argument" | 两篇是**平行反例**，不是归约链 | 否认"char-2 结果 ⟹ 奇特征结果"或反之 |
| "the two methods **retain distinct coefficient hypotheses**" | 系数假设互斥保留：char-2 需要 $D=\ell+1$ 在特征 2 归零；odd 需要 $p\nmid M$ 让基座可对角化、$\ell=(p-1)/2$ 取极值 | 否认"两条路线能合并成一个统一特征无关的证明" |

**引用计数的机械取证**：在 odd 版全部 7 个 tex 文件里 grep `OpenAICharacteristicTwo2026`，**只命中 1 次**（`01-introduction.tex:53`），且带定理号定位（`\cite[Theorem~1.1]`）。bib 条目（`references.bib:144–150`）是 `@misc{OpenAICharacteristicTwo2026, author={{OpenAI}}, title={{A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Characteristic Two}}, howpublished={OpenAI Math Release preprint …}, year={2026}}`——即**对内部姊妹篇的唯一引用形式是 preprint URL，没有期刊版**。这意味着：char-2 的定理在 odd 版的参考文献体系里没有可核对的正式出处，进一步支持"不作为输入"的声明（不作输入就不需要精确引号）。

**反向取证**：在 char-2 版（`…Characteristic-Two-September-23-2026/build/`）全库 grep `odd characteristic` / `Odd-Characteristic` / `September 26`，**零命中**（只有它自己标题里的 "Characteristic Two"）。char-2 早三天，自然不引 odd。但值得注意的是 char-2 的 §6 末（`06-cellular-automata.tex:151`）有 "Characteristic two is used to construct the algebraic witnesses," 一句——char-2 版在**结论处专门说明特征 2 用在哪里**，这正是 odd 版 L58 "retain distinct coefficient hypotheses" 的同族措辞。两篇都在"特征用途"这一处加了显式自白，说明作者意识到**这类反例最容易被质疑的点就是"特征用在哪一步、换个特征会不会塌"**。

摘要口径对照（同一系列，两篇摘要并列）：

| 声明项 | char-2 摘要（`paper.tex:43`） | odd 摘要（`paper.tex:39`） |
|---|---|---|
| 群的表观 | "a finitely presented group $G$" | "a finitely generated group $G$" |
| 挠率表述 | "containing an element of odd prime order"（intro L10） | "containing torsion" |
| 非 sofic | "The group $G$ is nonsofic." | **摘要不提**（intro L49 才说 "cannot be sofic"） |
| Gottschalk | "disproving Gottschalk's surjunctivity conjecture" | **摘要不提**（§8 末才说 "a negative answer to Gottschalk's surjunctivity conjecture"） |
| 特征范围 | "in characteristic two" | "in one specified odd characteristic" |

可取证的事实：**odd 版把 FP 降级为 FG、把两个"猜想否证"口号从摘要降级为正文推论**。素材一、1.1 已经记过 `MainClaim` 只要求 `Group.FG`（见四、4.2），这里给出论文侧的对称证据。[推测] FP 降级的原因不是奇特征版做不到 FP，而是做 FP 需要**额外证明粘合关系的完备性可枚举**，而 odd 版的注入性证明走的是球面地图/短字路线（不给出 presentation 的显式关系枚举），把 FG 写进主定理可以让"无需 word-problem oracle"（§7 "Finite prescriptions and scope."）这句核心声明**不需要任何附加工夫**。

### 3.5 组合侧引用的语境：Haviv、Golovnev–Haviv、Alon–Babai–Suzuki、storage codes

`01-introduction.tex:60–77`，全录：

> \paragraph{The two quantities that must be compared.}
> A matrix $F$ \emph{fits} a simple graph when $F_{ii}=1$ and $F_{ij}=0$
> for distinct nonadjacent vertices. We use a triangle-free graph on $m$
> vertices and a specified factorization
> \[
>  F_{ij}=\sum_{T\in\mathcal T}\alpha_i(T)\beta_j(T),\qquad
>  |\mathcal T|=t,\qquad \frac{t}{m}<\frac1{100}.
> \]
> This is an explicit threshold-Kneser instance of the polynomial
> constructions of Haviv and Golovnev--Haviv
> \cite[Proposition~13]{Haviv2018Theta}
> \cite[Theorem~3.2 and Lemma~3.5]{GolovnevHaviv2022}, whose polynomial
> ancestry includes Alon--Babai--Suzuki~\cite{AlonBabaiSuzuki1991}.
> Low-rank fitting matrices also give storage-code recovery equations.
> The triangle-free constructions of Barg--Z\'emor, Huang--Xiang, and
> Barg--Schwartz--Yohananov provide related context
> \cite{BargZemor2022,HuangXiang2023,BargSchwartzYohananov2024}.
> Their results are not used to supply a group-algebra idempotent.

正文侧对应引用（`02-finite-data.tex:73–77`）：

> It equals one for $i=j$. For distinct nonneighbors the intersection
> size lies between $200$ and $599$, so one factor is zero. This is the
> threshold-Kneser polynomial specialization of
> \cite[Proposition~13]{Haviv2018Theta}
> \cite[Theorem~3.2]{GolovnevHaviv2022}.

三条取证结论：

1. **两处引用的定理号不一致**：intro 引 `\cite[Theorem~3.2 and Lemma~3.5]{GolovnevHaviv2022}`，§2 引 `\cite[Theorem~3.2]{GolovnevHaviv2022}`（无 Lemma 3.5）。[推测] intro 多引的 Lemma 3.5 是"三角形自由/阈值"性质的来源，而 §2 自己直接证明了三角形自由（"Three pairwise adjacent sets would have union of size at least $3\cdot600-3\cdot199=1203$, exceeding $1200$"），所以正文不再需要那个引理。这是"引文按论证角色增减"的实例，可作为复盘笔记的一个小样板。
2. **"whose polynomial ancestry includes"** 是对 Alon–Babai–Suzuki（*Multilinear polynomials and Frankl–Ray-Chaudhuri–Wilson type intersection theorems*, JCTA 58 (1991)）的**谱系声明**，不是引用其定理：全篇没有一处使用 Frankl–Wilson 型交集定理的结论。这类"ancestry"措辞在奇特征版里出现两次（另一处是 §8 "Its group-ring ancestry appears in \cite[Section~1]{ElekSzabo2004}"，见 3.9），风格一致——**作者用 ancestry 表示"我知道这从哪儿来，但我不吃它的定理"**。
3. **storage codes 三连引（Barg–Zémor 2022、Huang–Xiang 2023、Barg–Schwartz–Yohananov 2024）后面紧跟一句否认**："Their results are not used to supply a group-algebra idempotent." 这三条是纯语境引用（低秩拟合矩阵 = 存储码恢复方程，是同一个线性代数结构在两个学科里的两次出现）。这句话在防的是"你的图论输入其实是编码论已知结果"的归类质疑——作者的立场是：**借用结构，不借用定理**。

论文未述（组合侧）：为什么取 $600/200/400$ 这组参数（而不是 $600/150$ 或 $500/250$）；为什么阈值 $1/100$；有没有考虑过别的三角形自由低秩图（Paley 图、极图、Golygina–Sidorenko 型）；$m=\binom{1200}{600}$ 的量级为什么够用。**全部未述**——§2 只给了充分的验证（$t/m\le 401(5/7)^{100}<1/100$，`02-finite-data.tex:79–87`），没给任何"为什么是这组数"的理由。这些常数的机械作用在素材五、逐项给出；[推测] 它们是从"不等式预算"反推出来的最省事解，见五、5.13。

### 3.6 代数侧引用的语境：Jennings、Schwartz + Zippel、Clifford、Kaplansky(1958)

`01-introduction.tex:91–101`，全录：

> The characteristic-dependent construction appears in
> Section~\ref{op:modular-section}. High augmentation degree gives the
> annihilated columns, in the elementary abelian setting of
> Jennings' theory~\cite{Jennings1941}. A diagonal weighted Gram determinant
> and Schwartz's grid bound~\cite[Lemma~1 and Corollary~1]{Schwartz1980},
> with related polynomial-identity work of Zippel~\cite{Zippel1979}, supply
> enough nondegenerate pairings. Fourier character orbits turn these
> projections into actual elements of $K[H]$. The full algebra need not
> be semisimple; only its prime-to-$p$ normal abelian subgroup is
> diagonalized, in the character-orbit setting of
> Clifford~\cite{Clifford1937Announcement}.

正文侧四处对应：

- Jennings（`03-modular.tex:38–40`）：

  > This is the elementary abelian augmentation filtration in the setting
  > studied by Jennings~\cite{Jennings1941}. Here the exact degree argument
  > can be given directly.

  **裸 cite（无定理号、无页码）**，并且紧接 "Here the exact degree argument can be given directly" —— 引用 Jennings 只为**命名环境**（增广过滤 = Jennings 理论的对象），实际论证是自己给的（$X_j^p=0$ 的幂零次数计数）。Jennings 条目是 *The structure of the group ring of a $p$-group over a modular field*, Trans. AMS 50 (1941), 175–185——**1941 年的论文，2026 年的证明仍然不复用它的主定理**，这个事实本身就是复盘要点：本篇的"高次湮灭"只需要最初等的部分（增广理想的幂零性），不需要 Jennings 的下中心列同调机器。
- Schwartz + Zippel（`03-modular.tex:125–136`），全录（含论文自己的重证）：

  > We use the polynomial grid estimate of
  > Schwartz~\cite[Lemma~1 and Corollary~1]{Schwartz1980}; see also the
  > related identity-testing method of Zippel~\cite{Zippel1979}. A nonzero
  > polynomial of total degree at most $a$ vanishes on at most an $a/M$
  > fraction of a product grid whose coordinate sets each have size $M$.
  > To prove this, induct on the number of variables. If the degree in the
  > last variable is $b$, its leading coefficient has degree at most $a-b$.
  > It vanishes at at most an $(a-b)/M$ fraction of the earlier choices.
  > For each remaining choice, the last-variable polynomial has at most
  > $b$ roots, contributing at most $b/M$. The sum proves the bound; the
  > constant case starts the induction.

  这是全篇"引用 + 完整自证"的最清楚样板：**引用给了出处（Schwartz 的 Lemma 1 与 Corollary 1），正文把六行归纳证明全部写出来**。Zippel 是 `see also` 级的第二手引用（*Probabilistic algorithms for sparse polynomials*, LCNS 72, 1979），全篇没有用到 Zippel 的任何具体结论。[推测] 之所以把 grid bound 重证一遍，是因为 Lean 形式化不能引外部文献（见四、4.3：`norm_num`/`polyrith` 要自己把它跑出来），论文的"自含程度"很可能是**被形式化目标反向塑形**的——同一句"the estimates use $p>600$"（`03-modular.tex:141–143`）也是为可机检的数值不等式服务的。
- Clifford（`03-modular.tex:176–181`），全录：

  > \[
  >  q_\lambda K[H]\cong\Mat_{p^3}(K).
  > \]
  > This is an explicit character-orbit block, in the normal-subgroup
  > representation setting of Clifford~\cite{Clifford1937Announcement}.
  > It does not assert semisimplicity of the entire modular algebra.

  末句 **"It does not assert semisimplicity of the entire modular algebra."** 是全篇最典型的"防误读补丁"：$K[H]$ 在特征 $p\mid |H|$ 下**不半单**，只有 prime-to-$p$ 正规交换基座 $A_0$ 的特征轨道被对角化。Clifford 条目是 1937 年的 PNAS **公告**（2 页，89–90）——注意论文引的是 announcement 而不是任何成熟的 Clifford 理论教科书陈述，bib key 就叫 `Clifford1937Announcement`（作者刻意标明这是公告）。
  §4a 里同一机制第二次被引用（`04a-sector.tex:162–168`）："This is the character-orbit construction already used in Section~\ref{op:modular-section}, now allowing nontrivial stabilizers; compare the Clifford-theoretic orbit picture in~\cite{Clifford1937Announcement}."——**"compare"** 这个动词说明此处连"引用出处"的口气都放弱了，只是让读者去对照观念；而 stabilizer 非平凡时的轨道分析是论文自己做的（引理 5.x，素材二、2.12）。
- Kaplansky 1958（`04a-sector.tex:230–235`），全录：

  > This is the link between the original rank calculation and the block
  > decomposition.  We will now obtain a basis in which $E$ is a coordinate
  > projection over $D$, not just over $K$. The argument is a constructive
  > nilpotent-ideal instance of the freeness of projective modules over local
  > rings, studied by Kaplansky~\cite[Theorem~2]{Kaplansky1958}; no general projective-module
  > theorem is needed here.

  这是**第二个 Kaplansky 引用**，角色与 1972 那条完全相反：1972 是被否证的猜想提出者，1958 是被绕开的正面定理（局部环上射影模自由）。"no general projective-module theorem is needed here" 又是一处"引用 = 定位，不用 = 自证"。值得单独记一笔：**同一作者的两次引用，一篇论文把他的成果同时用作"要反对的立场"和"可以援引但选择不用的工具"**，措辞上分别用 "asked whether" 和 "studied by … no general theorem is needed" 区分。

### 3.7 粘合侧引用的语境：Prytuła 的 $C(4)$–$T(4)$

intro 第一个过渡（`01-introduction.tex:103–112`），全录：

> \paragraph{From the comparison to scalar elements.}
> The proof has three transitions that numerical rank inequalities alone
> cannot justify. First, the quotient identifying the cyclic subgroups must
> retain the finite vertex groups. Its injectivity proof uses the
> $C(4)$--$T(4)$ graphical-complex mechanism described by
> Prytu\l a~\cite[Section~8]{Prytula2024}: local short-word restrictions and
> triangle-freeness rule out a spherical map with exactly one nontrivial
> face. Ordinary graph-of-groups normal form does not by itself establish
> this first quotient's injectivity. Section~\ref{sec:gluing} proves it
> locally, including the reductions for loops and bridges.

§4 开头（`04-gluing.tex:1–10`），全录：

> \section{Gluing the finite groups without collapsing them}\label{sec:gluing}
>
> The quotient $G_0$ of Section~\ref{op:modular-section} identifies a cyclic
> subgroup across each edge of $\Gamma$. It must
> retain every vertex group: otherwise a later nonzero element of a finite
> group algebra could disappear.  We first prove a general injectivity
> criterion and then verify it for the groups used here.  The local
> injectivity argument belongs to the $C(4)$--$T(4)$ theory of graphical
> complexes of groups \cite[Section~8]{Prytula2024}.  We give a direct
> proof using only labelled spherical maps and Euler's formula.

四条取证：

1. **这是全篇唯一一处论文自陈"某个显然的工具不够用"**："Ordinary graph-of-groups normal form does not by itself establish this first quotient's injectivity." 一般位置（graph of groups）的法式只给出正规形，不保证**顶点群在商里不被压扁**——因为粘合可能引入把顶点群元素杀死的球面关系。§4 标题 "without collapsing them" 就是这个失败模式的正名。素材二、2.10–2.11 的机制展开与此对齐；六、锚点 A2 把它作为"奇特征版必须自带组合注入性证明"的第一性证据。
2. **引用的粒度是 Section 不是定理**：`\cite[Section~8]{Prytula2024}`（*Graphical complexes of groups*, J. Group Theory 27 (2024), no. 2, 223–254, doi 10.1515/jgth-2021-0118）。两处引用（intro 与 §4）都是 Section 8，一致。[推测] 用 Section 级定位是因为 Prytuła 的 $C(4)$–$T(4)$ 定理在 §8 里是一组定义 + 定理的包，论文只借用它的**局部条件的名字**，不用它的结论。
3. **$C(4)$–$T(4)$ 这两个符号在 odd 版正文里没有定义**。全篇 grep `C(4)` 只命中 `01-introduction.tex:107` 与 `04-gluing.tex:8` 两处，均为引用语境；§4 自己给的判据是"labelled spherical maps + Euler's formula + 短字 $\le 3$ + 三角形自由"（素材二、2.10–2.11 逐条重建）。也就是说：**论文用 Prytuła 的语言标记"这是什么类型的论证"，然后把该类型论证的完整证明本地重写**。若读者不熟悉小消去论，$C(4)$/$T(4)$ 字面含义（每个区域至少 4 条边、每个两条边的区域交至多…）在本文里查不到——这是一处**可报告的自含性缺口**（论文未述）。
4. "otherwise a later nonzero element of a finite group algebra could disappear"——**保真性的动机被写成"为了后面的非零元不被吃掉"**，即 §4 的注入性服务于 §5–§6 的缺陷证书（$ba-1\ne 0$ 依赖某个群基系数非零）。这类"前面的引理由后面的需求解释"的措辞，在 intro 三个过渡段里连续出现三次（"must retain" / "must become identities over the same ring" / "does not yet give two scalar elements"），是全篇最规整的一处叙事结构，也是六、锚点 A3 的取证入口。

### 3.8 标量化侧引用的语境：Dykema–Juschenko、Gurevich–Hadani

intro 第三个过渡（`01-introduction.tex:130–145`），全录：

> Third, a matrix counterexample does not yet give two scalar elements of
> the same group algebra. In Section~\ref{op:compression-section}, the
> fit and the ordered zero products produce a split injection
> \[
>  S^{md}\longrightarrow S^{wt}\longrightarrow S^{md},
>  \qquad wt<md,
> \]
> whose composite is the identity. We derive square matrices with a
> one-sided inverse and certify the reverse defect by a nonzero kernel
> vector. Section~\ref{op:scalar-section} then implements the finite-factor
> reduction of Dykema--Juschenko~\cite[Lemma~2.1 and Theorem~2.2]{DykemaJuschenko2015}.
> A finite Heisenberg group gives explicit matrix units, their linear
> independence makes the encoding injective, and a complementary idempotent
> restores the full scalar identity. The shift and modulation model is
> classical~\cite[Section~1.2]{GurevichHadani2009}; the composite cyclic
> order and finite coefficient field used here are checked directly.

§6 开头（`06-scalar-cellular.tex:4–13`），全录：

> We have a strict matrix one-sided inverse over $K[G_1]$. The
> finite-factor reduction of Dykema and Juschenko
> \cite[Lemma~2.1 and Theorem~2.2]{DykemaJuschenko2015} explains the
> appropriate next step: put a full matrix algebra inside a finite group
> algebra and fill the complementary summand with the identity. We prove
> the actual matrix block needed here, including its injectivity. Its
> shift and diagonal operators are the finite Heisenberg model; the
> comparison with~\cite[Section~1.2]{GurevichHadani2009} is methodological,
> since our cyclic order can be composite and our coefficient field is
> finite.

取证要点：

1. **D–J 引用的角色是"解释下一步该做什么"**（"explains the appropriate next step"），不是"提供结论"。随后立刻 "We prove the actual matrix block needed here, including its injectivity." —— 论文把 D–J 归约**重新实现**了一遍。D–J 条目是 *On stable finiteness of group rings*, Algebra and Discrete Mathematics 19 (2015)，bib 里带 `note={\url{…admjournal…}}`（**唯一带 URL note 的条目**，说明该刊无 DOI 索引，作者手动补了下载链接）。
2. **Gurevich–Hadani 被明确降格为"方法论对照"**："the comparison … **is methodological**, since our cyclic order can be composite and our coefficient field is finite." 该条目是 *On the diagonalization of the discrete Fourier transform*, ACHA 27 (2009)——即 DFT 对角化的 shift-and-modulation 模型。论文的否认对象很具体：**GH 的模型要求素数阶循环 + 复数域**（DFT 对角化需要分圆条件），而本篇 $\Lambda$ 的合成阶 $M=p^4-1$ 是**合数**、系数域是**有限域** $\F_{p^4}$，所以矩阵单位的构造必须自己按 $\zeta$ 的阶与 $p$-幂 Frobenius 轨道验证。素材二、2.16 的 $\Omega_{uv}$ 显式矩阵单位就是这段"checked directly"的内容。
3. intro L130 那句 "A matrix counterexample does not yet give two scalar elements of the same group algebra" 是**全篇最直白的一句"我们卡在归约上"**。对照 char-2 版：那里对应的问题是"矩阵级反例怎么变成群环元素"，用的是有限群 $F=(\Z/\ell)^m\rtimes S_m$ 的矩阵单位（char-2 素材 一、1.3 与 §5）；odd 版改用 Heisenberg 群 + 合成阶基座。[推测] 换的理由是 odd 版的 $m=\binom{1200}{600}$ 太大，$(\Z/p)^m$ 型基座会让辅助群的阶爆炸到不可管理，而 Heisenberg 路线只需 $n\times n$、$n=M^q$ 与 $m$ 解耦。这条推测在六、锚点 A3 里给出可核对的文本证据链（§6 里 $q$ 的定义、`leastQ` 的 Lean 对应）。

### 3.9 动力学侧引用的语境：Gottschalk、Gromov–Weiss、Elek–Szabó、CSC–Coornaert、Phung 及后续

`01-introduction.tex:147–166`，全录：

> \paragraph{The dynamical consequence.}
> A configuration over a finite alphabet $A$ is any function $G\to A$.
> A cellular automaton has one finite memory set $E\subset G$ and one
> rule applied to $(x(gu))_{u\in E}$ at every $g$. A group is
> \emph{surjunctive} when every injective such automaton, over every finite
> alphabet, is surjective. Gottschalk proposed this for all groups
> \cite{Gottschalk1973}; Gromov and Weiss proved it for sofic groups
> \cite{Gromov1999,Weiss2000}. The group-ring connection is recorded by
> Elek--Szab\'o and developed in the linear theory of
> Ceccherini-Silberstein--Coornaert
> \cite{ElekSzabo2004,CSCCoornaert2006}. Phung proved stable finiteness
> over every field for surjunctive groups~\cite[Theorem~B]{Phung2023};
> subsequent proofs and extensions include~\cite{CSCPhungGroup2025,CSCPhungMonoid2025}.
>
> Section~\ref{op:cellular-section} gives the elementary transfer with its
> actual multiplication convention. The coefficients of $b$ define an
> injective automaton, those of $a$ give a left inverse, and a nonzero
> coefficient of $ba-1$ specifies a missing point indicator. The argument
> excludes preimages of arbitrary support. It is a consequence of the
> scalar construction, not a further existence theorem.

§8 开头（`06-scalar-cellular.tex:232–237`），全录：

> The final transfer is short and characteristic-independent. We give it
> locally to fix the multiplication order and the meaning of a missing
> configuration. Its group-ring ancestry appears in
> \cite[Section~1]{ElekSzabo2004} and the linear theory
> of~\cite{CSCCoornaert2006}.

取证要点：

1. **动力学引用被分成三种角色**，措辞严格区分：Gottschalk = 猜想的提出者（"proposed this for all groups"，裸 cite）；Gromov + Weiss = 猜想在 sofic 类的已知正面结果（"proved it for sofic groups"）；CSC–Coornaert = 线性理论的"developed"者；Elek–Szabó 出现**两次**，角色不同——intro L43 引其 Corollary 4.7（sofic 群稳定有限）作为对 $G$ 的**约束**，§8 引其 Section 1（群环—CA 的联系）作为**血统**。同一个 bib key 两个定位号，是全篇唯一一例。
2. **"Phung proved stable finiteness over every field for surjunctive groups~\cite[Theorem~B]{Phung2023}"**——论文把这条列出来但**没有明写反推**。逻辑反推是：本 $G$ 上存在域 $K$ 使 $K[G]$ 不稳定有限 ⟹ 由 Phung Thm B 的逆否，$G$ 非 surjunctive ⟹ 否证 Gottschalk。论文在 §8 末用另一句表达了同一结论："Thus the constructed group also gives a negative answer to Gottschalk's surjunctivity conjecture."（`06-scalar-cellular.tex:257–258`，注意原句里 "Thus the constructed group also gives" 换行处是 "specifying the rule requires no word-problem oracle.\nThus the constructed group also gives…"）。所以严格说：**反推在正文以结论形式给出，在 intro 以背景形式给出，两处不合并陈述**。这是"论文明白说了但没连成一句"的典型缝隙，复盘时值得点出。
3. "subsequent proofs and extensions include~\cite{CSCPhungGroup2025,CSCPhungMonoid2025}"——两条 2025 年的后续（GGD 19 (2025) 495–503；TCS 1042 (2025) 115228）以"include"收尾，是**文献覆盖义务**式引用，不承担任何论证角色。全篇真正"零使用"的引用共四条：`CSCPhungGroup2025`、`CSCPhungMonoid2025`、`Zippel1979`（see also 级）、storage codes 三条（Barg–Zémor / Huang–Xiang / Barg–Schwartz–Yohananov）。bib 共 21 条，实际参与论证定位的约 13 条。
4. "It is a consequence of the scalar construction, not a further existence theorem."——§8 被明确定位为**推论节**，不是独立定理来源。对照 char-2 版：char-2 的 §6 有独立的命题 + 推论 6.3/6.4 结构，并且带一条"经嵌入定理搬到 type $F_\infty$ 群"的伴侣论文引用（char-2 素材 2.15）。odd 版把这一整套压缩成一个命题 8.1 + 应用段，**删掉了伴侣嵌入定理那条引用**（本素材 2.18(c) 已记）。这是 odd 版比 char-2 版"少一层"的唯一一处，可用来检验"两篇是同一骨架的两次实现"这一论断的边界。
5. "The final transfer is short and **characteristic-independent**."——本篇里唯一明确自称"与特征无关"的一节。它与素材六节的对照极有价值：**九层骨架里只有 CA 迁移层是特征无关的**，其余八层都是特征分岔的。这直接支持"为什么需要单独一篇奇特征版"。

### 3.10 全篇引用角色总表

| bib key | 出现位置（文件:行） | 定位粒度 | 论文赋予的角色 | 是否被当作输入 |
|---|---|---|---|---|
| Kaplansky1972 | 01:40 | pp. 122–123 | 猜想原始出处 + "asked whether" | 否（立场） |
| AraOMearaPerera2002 | 01:42 | 裸 | free-by-amenable 稳定有限 → 约束 | 否（约束） |
| ElekSzabo2004 | 01:43；06:236 | Cor. 4.7；Sec. 1 | ①sofic 约束并反推 $G$ 非 sofic；②群环—CA 血统 | 否（约束/血统），但反推结论依赖其定理 |
| OpenAICharacteristicTwo2026 | 01:53 | Thm 1.1 | 姊妹篇，四名词概括 | **明确否认**（"not an input"） |
| Haviv2018Theta | 01:70；02:76 | Prop. 13 | 拟合因子化的构造出处 | 部分（构造同型，论证本地重写） |
| GolovnevHaviv2022 | 01:71；02:77 | Thm 3.2 (+Lem. 3.5 仅 intro) | 同上 | 部分（同上；两处定位号不一致） |
| AlonBabaiSuzuki1991 | 01:72 | 裸 | "whose polynomial ancestry includes" | 否（谱系） |
| BargZemor2022 / HuangXiang2023 / BargSchwartzYohananov2024 | 01:76 | 裸三连 | storage-code 语境 | **明确否认**（"not used to supply a group-algebra idempotent"） |
| Prytula2024 | 01:108；04:9 | Sec. 8 | $C(4)$–$T(4)$ 局部注入性论证的类型标记 | 否（"We give a direct proof"） |
| Jennings1941 | 01:94；03:39 | 裸 | 增广过滤的环境命名 | 否（"can be given directly"） |
| Schwartz1980 | 01:95；03:126 | Lem. 1 + Cor. 1 | 网格零点界 | 否（引 + 六行自证） |
| Zippel1979 | 01:96；03:127 | 裸 | "see also" 相关方法 | 否 |
| Clifford1937Announcement | 01:101；03:180；04a:166 | 裸×3 | 特征轨道块观念 | 否（"It does not assert semisimplicity…"） |
| Kaplansky1958 | 04a:234 | Thm 2 | 局部环射影模自由（可选择不用） | **明确否认**（"no general projective-module theorem is needed"） |
| DykemaJuschenko2015 | 01:140；06:6 | Lem. 2.1 + Thm 2.2 | "explains the appropriate next step" | 否（"We prove the actual matrix block needed here"） |
| GurevichHadani2009 | 01:144；06:11 | Sec. 1.2 | 经典 shift/modulation 模型 | **明确降格**（"comparison … is methodological"） |
| Gottschalk1973 | 01:153 | 裸 | 猜想提出者 | 否 |
| Gromov1999 / Weiss2000 | 01:154 | 裸两条 | surjunctivity 在 sofic 成立 | 否 |
| CSCCoornaert2006 | 01:157；06:237 | 裸 | 线性 CA 理论 | 否 |
| Phung2023 | 01:158 | Thm B | surjunctive ⟹ 每域稳定有限 | 否（背景；反推在 §8 以另一句给出） |
| CSCPhungGroup2025 / CSCPhungMonoid2025 | 01:159 | 裸 | "subsequent proofs and extensions include" | 否（零使用） |

总特征：**全篇 21 条 bib，没有一条被当作定理输入使用**——所有引用要么是"环境命名"（Jennings/Clifford/Alon–Babai–Suzuki），要么是"下一步该做什么的解释"（D–J、Prytuła），要么是"约束"（AOP、Elek–Szabó、Gromov–Weiss、Phung），要么是"划界"（char-2、storage codes、GH、Kaplansky1958）。这是一篇**完全自含**的构造论文。[推测] 这种极端自含度最合理的解释是形式化要求（四、4.4：`permitted_axioms` 只有三个、无外部数学库依赖），因为 Lean 证明不能引文献。

### 3.11 防御性措辞全录（12 条）与"它在防什么"

按文件行号给出原文片段（**逐字**），右侧是本素材给出的解读。这 12 条是反推失败路线（二节各 (d) 与六节锚点）的主要文本证据。

| # | 原文（文件:行） | 防的质疑 | 反推内容 |
|---|---|---|---|
| 1 | "The construction is not claimed to have been evaluated as a practical computation. It concerns the displayed prime, not every odd prime."（01:28–29） | "你的 $p$ 到底是多少？能不能跑？" / "是不是对所有奇特征都否证了？" | 声明口径主动收缩；见五、5.2（$p$ 从未被计算） |
| 2 | "These theorems are constraints on the example, not hypotheses about its group."（01:47–48） | "你是不是偷偷假设了 $G$ 非 sofic？" | 非 sofic 是结论，不是选群标准 |
| 3 | "The characteristic-two theorem is not an input to this odd-prime argument."（01:56–57） | "这篇是不是 char-2 的例行推广？" | 六、锚点 A1 |
| 4 | "Their results are not used to supply a group-algebra idempotent."（01:76–77） | "幂等元是不是从编码论文献搬来的？" | 幂等元是 §3 自建 |
| 5 | "Ordinary graph-of-groups normal form does not by itself establish this first quotient's injectivity."（01:110–112） | "为什么不用现成的 graph of groups 法式？" | **最直接的失败路线自白**；六、锚点 A2、二、2.10(d) |
| 6 | "It must retain every vertex group: otherwise a later nonzero element of a finite group algebra could disappear."（04:4–6） | 同上（正文版） | 保真的必要性 |
| 7 | "Their group algebras have nilpotent augmentation ideals, and a finite change of basis proves exact integer rank identities **before coordinates are paired**."（01:126–128） | "秩不等式怎么升级成环上等式？" | 顺序不可换：先换基、再配对 |
| 8 | "The first lemma is independent of the group construction. Its proof explains why ordered edge annihilations, **rather than symmetric orthogonality**, suffice."（05:4–7） | "为什么不用对称正交（那样更漂亮）？" | 有序性是本质而非技术选择；二、2.13 |
| 9 | "It does not assert semisimplicity of the entire modular algebra."（03:181） | "你在模特征下凭什么对角化？" | 半单性只在 prime-to-$p$ 基座上 |
| 10 | "no general projective-module theorem is needed here."（04a:234–235） | "你是不是用了 Kaplansky 射影模定理？" | 换基是构造性的 |
| 11 | "the comparison with Gurevich–Hadani is **methodological**, since our cyclic order can be composite and our coefficient field is finite."（06:11–13） | "DFT 对角化文献已经给了这个矩阵块？" | 合数阶 + 有限域是两个真障碍 |
| 12 | "If the finite formula for $b$ displays a group element more than once, its terms simply add in the same local rule; specifying the rule requires **no word-problem oracle**."（06:255–256）+ 06:210–218 "No word comparisons are needed to define the elements, and the kernel certificate and injective matrix block certify the nonzero reverse defect. The countable permutation actions used to certify group embeddings are not coefficient-search inputs." | "你的 $a,b$ 是不是要靠解词问题才能写出来？" | 定义与认证分离；这是全篇 prescription 哲学的核心句，出现**两次**（intro L26–27 与 §7/§8）——重复说明作者认为这是最容易被误读的点 |

第 12 条值得单独展开一句，因为它是"思维链"最浓的一处。§7 的 "Finite prescriptions and scope." 段（`06-scalar-cellular.tex:210–218`，全录）：

> \paragraph{Finite prescriptions and scope.}
> Every choice of character, basis, field element, or finite inverse
> occurs in an explicitly finite set. Products of the resulting group
> words define finite group-algebra sums even when different words happen
> to coincide. No word comparisons are needed to define the elements,
> and the kernel certificate and injective matrix block certify the
> nonzero reverse defect. The countable permutation actions used to
> certify group embeddings are not coefficient-search inputs.

它把整篇的"可指定性"拆成三件事：**选择有限可枚举**（每个特征、基、域元、逆元都在显式有限集里取）、**定义不需要相等判定**（不同的词偶然相等也只是项相加）、**认证靠证书不靠搜索**（核证书 + 注入矩阵块），并额外切割了一条："用于认证群嵌入的**可数置换作用**不是系数搜索的输入"。最后这句是关键：**§4 的球面地图/置换作用论证只服务于注入性，不参与 $a,b$ 的显式构造**。反过来说，若把置换作用算进构造，prescription 就退化为不可执行的无限搜索——这正是 char-2 素材里反复出现的"轨道配对不是计算程序"的同一防御（char-2 §3.2 与素材 2.x）。

### 3.12 论文未述清单 + 本仓库时间线观察

**论文未述（奇特征版 tex 内确认零命中或无解释）**：

1. **致谢 / 代码链接 / 复现说明**：全篇无 `\section*{Acknowledgements}`，grep `acknowledg` 零命中；grep `Lean|formaliz|machine-check|computer algebra`（`sections/*.tex` + `paper.tex`）**零命中**——论文正文完全不提形式化，尽管配套有 87 文件的 Lean 目录（四节）。唯一可疑的机器辅助痕迹是 §3 把 Schwartz 网格界六行重证（3.6）与各处显式数值不等式（$(5/7)^3<1/2$、$40100<2^{33}$、$p^4-1-4p^3>0$）。
2. **为什么是 $p=\operatorname{minFac}((m!)^2+1)$**：Lem 2.1 只证明"这个 $p$ 有我们需要的四条性质"（$p>m$、奇、$-1$ 是平方、$(m!)^2\equiv-1$），从未说明**为什么想到用 $(m!)^2+1$ 的最小素因子**。[推测] 动机是"免费得到 $-1$ 是平方 + $p$ 大于所有需要的界"，见五、5.2。
3. **$1/100$、$1/96$、$200/400/600/1200$ 的来源**：无任何动机性文字（见五、5.13）。
4. **$K$ 为什么是 $p^4$ 而不是 $p^2$**：Lem 2.1 只保证 $\xi$ 在 $K_0$ 中非平方从而 $|K|=p^4$；$M=p^4-1$ 的整除性需要（引理 3.x 里 $p^3\mid M+1$？实际用到 $M=p^4-1$ 被 $p^2+1$、$p+1$ 等整除）在五、5.9 逐条机械核对；论文未述"为什么 $p^2$ 不够"。
5. **Heisenberg 群 $\Lambda$ 的选型**：§6 只给构造与验证，未述"为什么不用 $(\Z/n)^{2g}$ 或 char-2 版的 $ (\Z/\ell)^m\rtimes S_m$"。
6. **$q$ / `leastQ` 为什么存在**：§6 用 $n=M^q$ 使某些整除性成立（详见五、5.11），$q$ 的定义是"最小的使……成立的正整数"，存在性靠 Fermat/Euler 型论证；论文没有讨论 $q$ 的量级。
7. **$G$ 是否有限表现（FP）**：**只在证明 FG 的地方写了一句**（`06:199–202`："The group $G_0$ is generated by the finite groups $H_i$. The construction of $G_1$ adds only $\langle z\rangle$ and the finitely many finite groups $L_i$, and $\Lambda$ is finite. Thus $G$ is finitely generated."），没有任何 FP 讨论。char-2 版有 FP（摘要级）。这是两篇最实质的一条口径差。
8. **奇特征版有没有推翻任何"新"猜想**：$G$ 非 sofic、非 surjunctive 都是从 char-2 版已有的猜想陈述继承的，odd 版没有引入新的动力学/代数猜想。
9. **$p$ 与其他素数的关系**：`01:29` "It concerns the displayed prime, not every odd prime."——**特征 3、5、7… 是否可反例，论文未述**（一句带过，无讨论）。

**本仓库时间线观察（不是论文自述，标注为外部证据）**：

- `…Characteristic-Two-September-23-2026`（char-2，FP + 非 sofic + Gottschalk 口号进摘要）
- `…Odd-Characteristic-September-26-2026`（本篇，FG、口号退到正文）
- `A-Torsion-Free-Group-Algebra-That-Is-Not-Directly-Finite-October-4-2026`（更晚的同系列）在其 intro（`sections/introduction.tex:46–52`）写道：

  > Two companion manuscripts are especially relevant. A separate construction
  > gives a scalar counterexample over a finite field of characteristic two for
  > a finitely presented group with odd-order torsion~\cite[Theorem~1.1]{OpenAI2026DF}.
  > Theorem~\ref{thm:main} uses the prime field $\Ftwo$ and a torsion-free group.
  > Its method develops the graph and cone construction of
  > \emph{A Torsion-Free Group Algebra with Zero Divisors}~\cite{OpenAI2026ZD}.

  **可取证的事实**：这篇 10 月 4 日的后续只引用了 char-2（`OpenAI2026DF`）与零因子版（`OpenAI2026ZD`），**没有引用奇特征版**。[推测] 三种可能：(i) 后续工作在 9/23 版基础上推进，与奇特征版无关（它的目标是 $\F_2$ + 挠自由，与 odd 版目标正交，最省事的解释）；(ii) 奇特征版当时尚未纳入其文献管理；(iii) 系列内部把"char-2 版"视为 Kaplansky 反例的**代表文献**，奇特征版被视为其技术变体。仓库观察不能区分三者，此处仅作时间线记录，不进入锚点证据链。
- Lean 目录的时间分布：`E:/math/lean/OAI/Algebra/OddKaplansky/`（87 文件）与 char-2 形式化目录 `E:/math/lean/OAI/RingTheory/DirectFiniteness/`（126 文件，namespace `OAI.KaplanskyCounterexample`；四、4.2 给逐文件对偶表）是**两份独立证明**而非同一证明的两处实例化，因为两篇的机制不同；但大量文件是**复制后改命名空间**（四、4.2 有逐文件证据）。

---

## 四、Lean 形式化取证

目录：`E:/math/lean/OAI/Algebra/OddKaplansky/`（87 个 `.lean` 文件，13148 行，含 1280 处声明、1060 个不同声明名）。比较器：`E:/math/lean/ComparatorChallenges/OddKaplansky.{lean,json}`。仓库登记：`E:/math/lean/formalization.yaml:1350–1352`（`comparator_config: ComparatorChallenges/OddKaplansky.json` / `declaration: OAI.OddKaplansky.main_theorem` / `file: OAI/Algebra/OddKaplansky/Main.lean`）；库根 `E:/math/lean/OAI.lean:22` = `import OAI.Algebra.OddKaplansky.GeneralTransfer`。姊妹树：`E:/math/lean/OAI/RingTheory/DirectFiniteness/`（char-2，126 文件，1043 处声明、1009 个不同名）。

取证脚本方法（可复现）：对每个文件用同一个正则抓声明行

```
^\s*(?:private\s+|protected\s+|noncomputable\s+|partial\s+)*
(?:theorem|lemma|def|abbrev|structure|inductive|instance|class|example)\s+([A-Za-z_][\w.']*)
```

取名字最后一段（去命名空间限定），做集合交；行数用 `\n` 计数；import 图用 `^import OAI.Algebra.OddKaplansky\.` 抓。**下面给出的所有数字都是这个脚本的输出**，不是估计。注意：因为去掉了限定名，两个不同 namespace 下的同名声明会被视为一个名字，所以"共有名 321"是**下界口径**（保守）。

### 4.1 模块地图

**(i) 全树拓扑 = 一条链。** 这是本节最重要的结构发现：87 个文件中，除 `Parameters.lean`（0 个内部 import）之外，**每个文件恰好 import 一个 odd 文件**，且**没有任何文件被两个文件 import**。于是内部 import 图是一条覆盖全部 87 个节点的哈密顿路径：

```
Parameters → QuadraticTower → FiniteChoice → CoefficientOrder → Diagrams → Amalgam → Gluing
→ IncidenceCycles → GraphEdges → LocalGroup → SourceGluing → BooleanPolynomial → GraphNumerics
→ SourceFit → Fourier → WreathFourier → WreathRepresentation → WreathBasis → WreathLinear
→ WreathMultiply → FreeBlocks → MatrixUnits → MatrixActions → WreathActions → FreeShiftCount
→ WeightedGram → PolynomialGrid → AdmissibleCount → WeightedProjection → OrbitSelection
→ ModularGeneric → Augmentation → AugmentationMatrices → SimplexCount → HighCount
→ ModularSource → OrderedModular → CosetCoordinates → CosetMatrix → OrbitBlock → SectorFourier
→ SectorOrbit → LocalAlgebra → AugmentBound → FiniteInverse → AugmentInverse → IdempotentFree
→ CosetRectangles → SectorRectangles → SectorStabilizer → SourceSector → GreedyColumns
→ GreedyLift → GreedyRing → GreedyInverse → GreedyRectangle → GreedyFormula → OrderedGroup
→ OrderedCoordinates → OrderedMatrices → OrderedBlocks → OrderedOrbits → OrderedRectangles
→ PrescribedSector → CosetGreedy → SectorGreedy → PrescribedGreedy → PrescribedInverse
→ AmalgamExtras → SectorGroup → NilpotentBasis → CyclicCoset → OrderedZero → Compression
→ SquareCertificate → Heisenberg → HeisenbergRepresentation → HeisenbergSector → ScalarAlgebra
→ Transfer → Cellular → IndexCut → Construction → SectorConstruction → SquareConstruction
→ Main → GeneralTransfer
```

机械含义与解读：

1. 拓扑上这等价于**把 13148 行按依赖序切成 87 段**——不是分层架构。任何"模块地图"只能按 namespace 与论文节次重建，不能按 import 图重建。
2. 只需 import 链尾即可拉入全树，这正是 `OAI.lean:22` 只写 `GeneralTransfer` 的原因（链尾，而非主入口）。**主入口是 `Main.lean`（链上第 86 位）**，`GeneralTransfer` 是它之后的附加定理文件。
3. 链序与论文节序**不一致**：论文 §2（域与图）在 Lean 里被拆散成 `Parameters/QuadraticTower`（链首）与 `GraphEdges/GraphNumerics/SourceFit`（链中部）；论文 §4（粘合）的 3840 行 `Diagrams` 在链上排第 **5**，比它要服务的群构造（`LocalGroup/SourceGluing`，第 8–11 位）**更早**出现。这是因为 `Diagrams` 只依赖 `CoefficientOrder`（有限选择装置），它的"通用球面地图判据"与具体群无关——**Lean 把论文 §4 的引理 4.1 抽成独立通用层并提前编译**，这是论文叙述里没有的结构。
4. `Ordered*`（11 个文件）、`Sector*`（9 个）、`Greedy*`（7 个）、`Coset*`（5 个）、`Wreath*`（6 个）是五组前缀族，同族文件在链上**相邻成段**，说明切分时按主题连续切段。`Prescribed*`（3 个）是"指定版"（把存在性换成显式指定项）的最后一段。

**(ii) 体量分布。** 前 15 大文件（行数）：

| 文件 | 行 | 占全树 | 声明数 | 对应论文 |
|---|---:|---:|---:|---|
| Diagrams | 3840 | 29.2% | 287 | §4 引理 4.1（$C(4)$–$T(4)$ 球面地图判据）全部 + 命题 4.2 的局部部分 |
| FreeBlocks | 298 | 2.3% | 12 | §3 高次子空间/自由块 |
| Augmentation | 278 | 2.1% | 25 | §3 增广过滤（Jennings 环境） |
| Compression | 251 | 1.9% | 22 | §5 引理 6.1 三角压缩 |
| Fourier | 246 | 1.9% | 29 | §3 特征幂等元（`CharacterIdempotents` 段） |
| Amalgam | 245 | 1.9% | 20 | 论文**没有**对应物（`MultipleHNN` + `StarAmalgam`，见 4.2(v)） |
| ScalarAlgebra | 224 | 1.7% | 17 | §6/§7 矩阵块→标量（`MatrixBlock` + `ProductAlgebras`） |
| OrderedBlocks | 219 | 1.7% | 21 | §4a 有序轨道块 |
| SectorConstruction | 194 | 1.5% | 31 | §4a 扇区构造 |
| GraphEdges | 181 | 1.4% | 22 | §2 threshold-Kneser 图 $\Gamma$（`Fin 1200`/`card = 600`/`< 200` 都在这里） |
| CosetGreedy | 176 | 1.3% | 7 | §4a 陪集贪心 |
| AugmentBound | 172 | 1.3% | 14 | §3 增广次数界 |
| ModularGeneric | 172 | 1.3% | 10 | §3 命题 3.1 通用版 |
| SectorGroup | 161 | 1.2% | 24 | §4a 的 $G_1$（`abbrev G₁ := StarAmalgam.Amalgam …`） |
| OrderedModular | 160 | 1.2% | 11 | §3 命题 3.1 有序指定版 |

`Diagrams` 一个文件占全树 **29.2%** 的行、**22.4%** 的声明（287/1280）。它是全篇形式化成本的集中点——而这恰好是论文里**唯一一处自陈"现成工具不够用"**的地方（三、3.11 防御性措辞第 5/6 条）。这个对应关系是本节最重要的取证结论：**论文的防御性措辞位置 = 形式化的成本集中位置**。

**(iii) namespace ≠ 文件。** 一个文件可开多个 namespace，一个 namespace 可跨多个文件。例：`Diagrams.lean` 内含 `OddKaplansky.Planar`、`OddKaplansky.GluedGroup`、`OddKaplansky.Holonomy`、`OddKaplansky.WordReduction`；`OddKaplansky.WreathFourier` 出现在 `WreathFourier / WreathRepresentation / WreathBasis / WreathLinear / WreathMultiply / FreeBlocks / ModularGeneric / AdmissibleCount / ModularSource / OrderedModular / SectorFourier` 等 8+ 个文件里；`OddKaplansky.CharacterIdempotents` 出现在 `Fourier / WreathBasis / WreathFourier / SectorFourier` 四个文件。全树 232 处 `^namespace`（char-2 是 294 处），平均每文件 2.7 个 namespace 开关——**namespace 是逻辑层名，文件是编译分段**，两者刻意脱钩（这样"把一个 namespace 的实现分散到多个文件"能让每段编译时间可控）。

**(iv) 论文各节 ↔ Lean 文件的映射表**（按论文顺序，非链序）：

| 论文 | Lean 文件 |
|---|---|
| §1 定理 1.1（$p$ 的四条性质） | `Parameters.lean`（60 行，全篇唯一 0-import 文件，独立于 odd 树其余部分） |
| §2 引理 2.1（二次塔 $\|K\|=p^4$） | `QuadraticTower.lean`（125 行；`polynomial (a : F) : F[X] := X^2 - C a`、`second_irreducible`、`tower_card`） |
| §2 有限选择约定（"least element…"） | `FiniteChoice.lean`（67 行：`first`、`first_spec`、`first_le`、`exists_primitive`、`primitive`、`orderedIndex`、`functionOrder`）、`CoefficientOrder.lean`、`SourceOrders`（在 `OrderedGroup.lean`） |
| §2 图 $\Gamma$、$t$、$m$ | `GraphEdges.lean`（`Vertex ≃ {s : Finset (Fin 1200) // s.card = 600}`、`Adj i j := i ≠ j ∧ (i.val ∩ j.val).card < 200`）、`GraphNumerics.lean`（`binom` 与 $t/m$ 界）、`BooleanPolynomial.lean`（`GraphPolynomial.polynomial S r lo hi`，"正指数全部改成 1"的操作） |
| §2 局部群 $H=A_0\rtimes P$ | `LocalGroup.lean`（141 行）、`Wreath*` 族 |
| §3 命题 3.1（幂等 $e$，两侧湮灭，$d/w>1/96$） | `ModularSource.lean`（`exists_idempotent`、`explicitElement`、`explicit_properties`）、`OrderedModular.lean`、`ModularGeneric.lean`、`Augmentation*`、`AugmentBound`、`HighCount`、`SimplexCount` |
| §3 加权 Gram + Schwartz 网格界 | `WeightedGram.lean`（`polynomial (B : Matrix X I K)`）、`PolynomialGrid.lean`、`AdmissibleCount.lean`、`FreeShiftCount.lean` |
| §3 特征轨道块 $q_\lambda K[H]\cong\Mat_{p^3}(K)$ | `Fourier.lean`、`SectorFourier.lean`、`OrbitBlock.lean`、`SectorOrbit.lean`、`OrbitSelection.lean`、`WeightedProjection.lean` |
| §4 引理 4.1（三角形自由粘合） | `Diagrams.lean`（3840 行）+ `Gluing.lean`（82 行，包装成 `vertex_injective`）+ `Amalgam.lean`（245 行，`StarAmalgam.faithful_realization`） |
| §4 命题 4.2（$G_0$ 保真） | `SourceGluing.lean`（`shortWords : Planar.ShortWords Inc edgeHom`，第 49 行起） |
| §5 命题 5.1（扇区 $S=fR$、$Y_iJ_i=fI_d$） | `SectorGroup.lean`、`SectorStabilizer.lean`、`SectorRectangles.lean`、`Coset*`、`Greedy*`、`Prescribed*`、`NilpotentBasis.lean`（换基 = Kaplansky 1958 的构造性替代）、`LocalAlgebra.lean`、`AugmentInverse.lean`、`FiniteInverse.lean`（`FiniteMatrixInverse`：有限逆的显式伴随矩阵）、`IdempotentFree.lean`、`CyclicCoset.lean`、`OrderedZero.lean` |
| §6 引理 6.1/6.2（三角压缩 + 核证书） | `Compression.lean`、`SquareCertificate.lean` |
| §7 命题 7.1/7.2/推论 7.3（Heisenberg 标量化） | `Heisenberg.lean`、`HeisenbergRepresentation.lean`、`HeisenbergSector.lean`、`MatrixUnits.lean`、`ScalarAlgebra.lean`、`Transfer.lean`（`Padding` + `FixedField`）、`Construction.lean`、`SectorConstruction.lean`、`SquareConstruction.lean` |
| §8 命题 8.1（CA 迁移） | `Cellular.lean`（88 行：`operator`、`operator_formula`、`IsCellular`、`theorem_all_configurations`） |
| 主定理 | `Main.lean`（111 行：`Prescribed` 子 namespace 装配 + `MainClaim` + `main_theorem`） |
| **论文没有的** | `GeneralTransfer.lean`（34 行，`fixed_field_transfer_general`）、`AmalgamExtras.lean`（62 行）、`IndexCut.lean`、`OrderedRectangles.lean` |

### 4.2 与论文叙述的不一致处

**(i) 复制 vs import：全树只有一条跨树 import，其余"共享"全是复制。**

硬证据：

```
$ grep -h "^import" OAI/Algebra/OddKaplansky/*.lean | grep -v OddKaplansky | sort -u
import Mathlib
import OAI.RingTheory.DirectFiniteness.ReducedWalks
```

即 87 个文件对 char-2 树的**唯一**一次 import 是 `Diagrams.lean:2` 的 `import OAI.RingTheory.DirectFiniteness.ReducedWalks`（用的是约化走字的通用引理，如第 2158 行 `apply SimpleGraph.Walk.reduced_of_getVert`）。除此之外，两棵树之间**没有任何 import 关系**，但共享声明极多。

按"共享声明名 / 该文件声明数"排序的复制来源清单（奇 → char-2 文件对，实测）：

| odd 文件（声明数） | 复制来源（char-2 文件 : 共有名数） | 判读 |
|---|---|---|
| `Amalgam`(20) | `MultiHNN:10` | `MultipleHNN` 段 10/10 **整段复制**；`StarAmalgam` 段是 odd 新增 |
| `Fourier`(29) | `CharacterIdempotents:16` | 该 char-2 文件的 16 个声明**全部出现**（`projector*`、`pushed*`、`lift_pushed`、`sum_character_eq_zero`），即特征幂等元层整层复制 |
| `ScalarAlgebra`(17) | `MatrixBlock:9`、`ProductAlgebras:5`、`ScalarFormulas:3` | 矩阵块三件套（`block*`、`block_sandwich`、`scalar_witnesses`）整体搬来，外加两个 char-2 文件的片段 |
| `IncidenceCycles`(6) | `IncidenceCycles:6`（**同名文件**） | 6/7 共有（`cycle_polygon*`、`incidenceColoring`、`getVert_even_left`、`getVert_odd_right`、`incidence_walk_even`）——同名同内容文件，最纯粹的复制证据 |
| `Diagrams`(287) | `RibbonGeometry:33`、`RibbonDetachment:19`、`PlanarBalance:17`、`WordReduction:15`、`PartitionMerging:15`、`RibbonRestriction:13`、`RibbonSums:11`、`RibbonWheels:10`、`DetachmentGenus:9`、`GluedGroup:9`、`BoundaryCycles:8`、`RibbonSplitting:8`、`VertexMerging:7` | 3840 行文件是 char-2 **13 个 Ribbon/Diagram 族文件的合并副本**（`Ribbon`、`Spherical`、`Cycles`、`unplug*`、`mergeWhite*`、`euler_contradiction`、`bypass*` 等名字逐个相同） |
| `Gluing`(6) | `MultiHNN:2` | 片段 |
| `Main`(18) | `PrescribedOutputs:3`、`PrescribedFields:3` | 装配层的模式（`zeta*`、`card_field`、`products`）同型 |
| `WreathFourier`(18) | `CharacterIdempotents:4` | 片段 |
| 其余 60+ 文件 | 共有名 ≤ 3 | 只是通用名（`G`、`H`、`K`、`M`、`N`、`Q`、`Reduced`、`Related`、`Allowed`、`Base`、`LocalGenerator`、`Generator`、`OpenDiagram`、`MainClaim` 等），不是复制 |

全库口径：odd 1060 个不同声明名 vs char-2 1009 个，**共有 321 个**（占 odd 的 30.3%）。其中约 85 个来自上表前五行（`Diagrams`/`Fourier`/`ScalarAlgebra`/`Amalgam`/`IncidenceCycles` 五个文件），其余是通用单字母名。**所以"哪些模块是从 char-2 复制而非 import"的完整答案是：只有 5 个文件承载真实复制（Diagrams、Fourier、ScalarAlgebra、Amalgam、IncidenceCycles），其余 82 个文件是奇特征特有的新代码**——素材前文只提到 Fourier/Diagrams/Amalgam 三处，此处补全并给出文件+名字级证据。

**(ii) 复制的"指纹"：逐行 diff 显示是复制后加工，不是重写。**

对 `Amalgam.lean` 的 `MultipleHNN` 段（第 10–141 行）与 `MultiHNN.lean`（第 1–142 行）做命名空间归一化后的行级 diff（忽略空行与注释行），**相似度 0.8824**，全部差异只有四类：

1. **宇宙名**：char-2 用自动名 `u_1 u_2 u_3`，odd 用显式声明的 `portUniverse1..6`（文件头一次性 `universe portUniverse1 … portUniverse6`）。
2. **docstring 被删**：char-2 有 `/-- Extend any finite sublist of the required conjugacies one at a time. Mathlib's complete Britton-lemma proof supplies the embedding at each step. -/` 与 `/-- The presentation is generated by the base group and the stable letters. -/`，odd 全删。**全树统计：odd 的 `/--` 出现 0 次，char-2 出现 149 次**——odd 是一份**无文档**的树。
3. **`abbrev Extension` → `def Extension`**（odd 第 21 行）：把可展开改成不可展开，配合下一行 `instance : Group (Extension A B φ) := by delta Extension; infer_instance`。这是**展开性/性能的绕行**（见 4.3(iii)），不是数学差异。
4. 少量尾部空行差异。

被删掉的那条 docstring 值得单独引用，因为它**是 char-2 侧留下的机制说明**："Mathlib's complete Britton-lemma proof supplies the embedding at each step."——odd 的 `finite_partial_realization`（`Amalgam.lean:53–83`）按 `Finset.induction_on` 逐个把共轭关系加进 Mathlib 的 `HNNExtension`，每步用 `HNNExtension.of_injective`（即 Mathlib 已证的 Britton 定理）保持嵌入；`of_injective`（第 85–91 行）对 `Finset.univ` 收尾。

**(iii) `MainClaim` 只要求 `Group.FG`，且没有 FP 附注定理。**

`Main.lean:79–90` 原样：

```lean
def MainClaim : Prop :=
  sourcePrime.Prime ∧ Odd sourcePrime ∧
  ∃ (K : Type) (_ : Field K) (_ : Fintype K) (_ : CharP K sourcePrime),
    Fintype.card K = sourcePrime^4 ∧
    ∃ (G : Type) (_ : Group G) (_ : Group.FG G),
      (∃ g : G, g ≠ 1 ∧ IsOfFinOrder g) ∧
      ∃ a b : MonoidAlgebra K G,
        a * b = 1 ∧ b * a ≠ 1 ∧
        Function.Injective (cellular b) ∧ ¬ Function.Surjective (cellular b)
```

四点：

1. 群的表观是 `Group.FG G`（`Main.lean:85`），与论文定理 1.1 的 "finitely generated" 严格一致。
2. `MainClaim` 里**没有任何 FP 字样**；`grep -rn "IsFinitelyPresented\|FinitelyPresented" OAI/Algebra/OddKaplansky/*.lean` **零命中**。
3. 对照 char-2：它的 `MainClaim` 在 `Model.lean:7–10`，**只有四行**——`∃ K [Field] [Fintype] [CharP K 2], ∃ G [Group] [Group.FG G], ∃ a b, a*b=1 ∧ b*a≠1`，**不含挠率、不含 CA**（`Main.lean:7–8` 的 docstring 也只说 "A finite field of characteristic two and a finitely generated group admit finite group-algebra sums with a right inverse that is not a left inverse."）。FP 在 char-2 里是**单独一个文件 + 单独一个比较器条目**：`FinitelyPresented.lean:35–43` 的 `theorem finitelyPresented_counterexample : ∃ K …, ∃ (G : Type) (_ : Group G) (_ : Group.IsFinitelyPresented G), (∃ (ℓ : ℕ) (_ : ℓ.Prime) (_ : Odd ℓ) (g : G), orderOf g = ℓ) ∧ ∃ a_out b_out, …`，且 `formalization.yaml` 为它登记了第二条 comparator（`ComparatorChallenges/KaplanskyFinitelyPresented.json` → `declaration: OAI.KaplanskyCounterexample.finitelyPresented_counterexample`）。**odd 只有 1 条 comparator，char-2 有 2 条（`KaplanskyDirectFiniteness` + `KaplanskyFinitelyPresented`）**——这是"没有 FP 附注定理"的机器可核对证据（比三、3.4 的摘要口径对照更硬）。
4. 反方向的一条不对称：odd 的 `MainClaim` 比 char-2 的**更富**（多了 `sourcePrime.Prime ∧ Odd sourcePrime`、`Fintype.card K = sourcePrime^4`、挠率、CA 单射非满射四条）。也就是说 odd 版**在"群的表观"上收缩、在"结论的合取数"上扩张**。[推测] 扩张的动机是把论文定理 1.1 的形容词（"specified field of order $p^4$"、"containing torsion"）与摘要第二句（CA）一次性写进题面，避免像 char-2 那样需要多份 comparator 配置。
5. `Group.FG` 的机器来源是 `Gluing.lean:71–82` 的 `instance [Finite V] [Finite B] : Group.FG (Q Inc ι)`（对 `CoprodI` 归纳，生成集取 `Set.range (fun x : V × B => vertex Inc ι x.1 x.2)`）与 `Amalgam.lean` 末段的 `instance [Finite I] [Group.FG H] : Group.FG (Extension A B φ)`（生成集取 `of '' S ∪ Set.range (letter A B φ)`）——**FG 是这两处 instance 机械拼出来的**；FP 之所以没有附注，直接原因是这两个 instance 的写法只给出有限生成集，关系集是 `Con.conGen` 的闭包，**要证 FP 得把 `Con` 的同余生成元翻译成有限 relator 集并证 `Group.IsFinitelyPresented`**，char-2 做了这件事（`PrescribedPresentation.lean`），odd 没做。这与三、3.4 末尾的 [推测]（FP 需额外审计关系完备性）在代码层得到支持。

**(iv) `LocalDatum`：把论文散落四处的性质打包成一个五字段 structure。**

`Construction.lean:81–88` 原样：

```lean
structure LocalDatum where
  e : MonoidAlgebra K HH
  idem : e*e=e
  leftAnn : ∀ s : ModularSource.P p, (MonoidAlgebra.single (LocalGroup.u p M s) 1-1)^ell*e=0
  rightAnn : ∀ s : ModularSource.P p, e*(MonoidAlgebra.single (LocalGroup.v p M s) 1-1)^ell=0
  rank : Fintype.card HH<96*Module.finrank K (LinearMap.range (Algebra.lmul K _ e))
```

对照论文命题 3.1（`03-modular.tex:15–25`）：陈述是"存在指定幂等 $e$，满足 $(u(s)-1)^\ell e=0$、$e(v(s)-1)^\ell=0$、$d/w>1/96$"，是**三条并列性质散在一条命题里**。Lean 的改动：

1. 把 $H$（记号 `HH`）、$u(s)$、$v(s)$、$\ell$ 全部**固化进字段类型**，于是下游所有文件（`Compression`、`SquareConstruction`、`Construction.ordered_zero`、`SectorConstruction`）只对 `LocalDatum` 说话，不再重复群论细节。这是**论文没有的抽象层**：论文用"设 $e$ 是满足以下性质的幂等元"就地使用，没有给这个包起名。
2. `rank` 字段是**整数化写法**（见 (vi)）。
3. 两条入口：`localDatum_exists : Nonempty (LocalDatum)`（存在性，第 89–98 行）与 `prescribedLocalDatum : LocalDatum`（指定版，第 99–109 行，用 `ModularSource.explicitElement / explicit_properties`）。**存在版 + 指定版并存**是整棵树的统一模式（`exists_idempotent` vs `explicit_properties`；`OrbitSelection` vs `OrbitBlock`；`Nat.find` 型指定 `leastQ`），对应论文 "specified" 一词的双层含义：既是"有限公式给出的"，也是"存在且可从有限有序集里挑"。
4. `rightAnn` 的证明里有一句关键绕行：`simpa only [local_conjugate] using …`——`Construction.lean:73–80` 的 `local_conjugate` 把 `WreathFourier` 世界里的共轭式 `baseElt(lamp)*topElt(s)*baseElt(lamp)⁻¹ = single (LocalGroup.v p M s) 1` 翻译成 `LocalGroup` 世界的 $v(s)$。**论文把 $v(s)=cu(s)c^{-1}$ 当成定义直接写（`02-finite-data.tex:100–103`），Lean 必须用一条引理跨越两套 wreath 表示（Mathlib 侧的 `WreathFourier` 与自建的 `LocalGroup`）之间的表示差异**。见 4.3(vi)。

**(v) 论文的"置换作用"句 ↔ Lean 的 HNN 实现：机制替换。**

论文引理 4.1 证明的开头交代了三手（`04-gluing.tex:41–45`，原样）：

> We first handle the subgroups generated by the incident cyclic groups.
> The diagram argument will rule out a relation that is nontrivial at one
> vertex but follows from the relations at all the vertices.  At the end,
> a permutation action extends the conclusion to the full groups $D_i$.

Lean 的第三手**不是置换作用**，而是 `StarAmalgam.faithful_realization`（`Amalgam.lean:183–199`）：给定 $f_i:S_i\to^*G$、$g_i:S_i\to^*D_i$ 都单射，构造 $E:=$ `MultipleHNN.Extension A B φ`（把星型粘合的关系写成对自由积 $G*\coprod_I D_i$ 的**多重 HNN**），得到 $b:G\to^*E$、$d_i:D_i\to^*E$ 全单射且相容；`ofBase_injective`（第 225–231 行）与 `ofFactor_injective`（第 233–238 行）用 `Con.lift` 把结论搬回商群。而 `Gluing.lean:42–58` 的 `vertex_injective` 正是这条链的应用（原样见 4.2(vi) 前的代码块）。

分解成两步：球面地图只证**局部子群** $D_i^0=\langle$像$\rangle$ 嵌入（`Diagrams.lean:3801` 的 `theta_injective`，其定义域 `Local v := (localEvaluation Inc ι v).range` 在第 3787 行），再由 HNN 升级为**整个 $D_i$ 嵌入**。论文里这两步的顺序完全相同（先 $D_i^0$ 后"permutation action"），**只有第二手的机制不同**。

三、3.10 已记：全篇 21 条引用无一条是输入。此处补一条 Lean 侧的对应：**这一处是"Lean 用了论文没用的定理"的唯一实例**（Mathlib 的 Britton，即 `HNNExtension.of_injective`）。其余所有 Lean 结构都能在论文里找到叙述对应物。

**(vi) 不等式的整数化（系统性改写：论文写商、Lean 写积）。**

论文：$d/w>1/96$（`01-introduction.tex:83–85`、`03-modular.tex:4–5`）与 $\frac{t}{m}<\frac1{100}$（`01:66`、`02:53`、`02:81–83`）。Lean：

```
Fintype.card HH < 96 * Module.finrank K (LinearMap.range (Algebra.lmul K _ e))   Construction.lean:88
Fintype.card (Wreath (H := H) M) < 96 * …                       ModularGeneric.lean:134
Fintype.card (Base (H := H) M) < 96 * Fintype.card R * Fintype.card I   ModularGeneric.lean:152
Fintype.card (WreathFourier.Wreath (H := P p) M) < 96 * …        ModularSource.lean:107
（同型另见 OrderedModular.lean:95, 113, 126, 144）
100 * (∑ j ∈ Finset.range 401, binom j) < binom 600               GraphNumerics.lean:63  ratio_bound
40100 * 5^100 < 7^100                                             GraphNumerics.lean:67（全树唯一真正的 norm_num）
```

理由（机械）：商要写成分数就得引入 `ℚ` 或抽象域上的除法，于是每个比较都要带 `NeZero` / `0 < w` 侧条件，且 `omega`（线性算术决策程序）**不懂除法**。两边同乘分母后全部落在 `ℕ` 上，`omega`/`nlinarith` 直接可用。**统计佐证：全树 `omega` 出现 167 次，`norm_num` 只有 3 次（其中真正算数的仅 `40100 * 5^100 < 7^100` 一处）**——整数化后剩下的活儿几乎都是线性算术，正是 `omega` 的适用范围。`ratio_bound` 之后第 76 行还有一条把它回写成论文原形的 `100 * (∑ j ∈ range 401, Nat.choose 1200 j) < Nat.choose 1200 600`（去掉 `binom` 包装），说明包装层与内容层刻意分离。

同族第三例：论文 §2 的 $(5/7)^3<1/2$ 与 $40100<2^{33}$（`02:86–87`）在 Lean 里被**合并成一条** `40100 * 5^100 < 7^100` 交给 `norm_num` 一次判定——论文给的是"人可验证的两步分解"，Lean 给的是"机器可判定的单条整数不等式"。这与三、3.6 关于"论文重证 Schwartz 网格界很可能是被形式化目标塑形"的 [推测] 相互印证。

**(vii) 三角形自由 ↔ `8 ≤ egirth`：假设的形式换了。**

论文引理 4.1 假设"$\Delta$ 是有限简单**三角形自由**图"（`04-gluing.tex:14–15`）。Lean 的 `theta_injective` 假设是 `hgirth : 8 ≤ (Planar.incidenceGraph Inc).egirth`（`Diagrams.lean:3803`、`Gluing.lean:42`），而三角形自由 → eirth≥8 是一条需要证的引理：`GraphEdges.lean:77` 的 `8 ≤ (Planar.incidenceGraph (Inc Γ)).egirth := by apply SimpleGraph.le_egirth.mpr …`，并在第 172 行以 `lemma incidence_girth` 对外提供。**为什么是 8 而不是 6**：`incidenceGraph` 的点是"旗标"（vertex, face）二元组，$\Delta$ 的一个三角形在旗标图里给出长度 6 的环，加上线段化的两个半步，阈值变成 8。[推测] 论文里"Three pairwise adjacent sets would have union of size at least $3\cdot 600-3\cdot 199=1203$"给的是三角形自由的**组合证明**，而球面地图的 Euler 论证需要的是"旗标图没有短环"，8 是 Euler 亏损计算（$4$–$4$–$8$，见二、2.10）真正用到的阈值——**论文把阈值藏在 "triangle-free" 这个说法里，Lean 把它显式化为 `8 ≤`**。这是"Lean 比论文更精确"的一条证据。

另一处形式化更严格：`ShortWords`（`Diagrams.lean:1964–1970`）是**三条字段的结构**（`one`/`two`/`three`，分别对应 $k=1,2,3$ 的短字非平凡性），而论文写成一句带 $1\le k\le 3$ 的量词（`04-gluing.tex:20–29`），并额外注明"$k=1$ 时省略相异条件、$k\ge2$ 时含 $\gamma_k\ne\gamma_1$"。Lean 的 `three` 需要 `f ≠ g → g ≠ h → h ≠ f`（**循环相异**三条都写），`two` 需要 `f ≠ g`——与论文完全一致，但拆成三条后每条形如不同，证明里分派使用。

**(viii) `q` 与 `n = M^q`：论文没写的"最小性"只在 Lean 的额外文件里被陈述。**

`Transfer.lean:85–89` 原样：

```lean
lemma power_search : ∃ q, r≤M^q := by
  refine ⟨r,?_⟩
  exact (Nat.le_of_lt (Nat.lt_two_pow_self (n := r))).trans (Nat.pow_le_pow_left hM r)
def leastQ : ℕ := Nat.find (power_search M hM r)
lemma leastQ_spec : r≤M^(leastQ M hM r) := Nat.find_spec (power_search M hM r)
lemma leastQ_min {q : ℕ} (hq : r≤M^q) : leastQ M hM r≤q := Nat.find_min' (power_search M hM r) hq
```

三点取证：

1. 存在性的**见证直接取 $q:=r$**，靠 `Nat.lt_two_pow_self`（$r<2^r$）与 $2\le M$。因此 `leastQ M hM r ≤ r` 恒成立——论文没说这条上界，Lean 里它是 `power_search` 定义的自然后果。
2. **$q$ 可以为 0**：当 $r\le 1$ 时 $M^0=1\ge r$，`leastQ_min` 给出 `leastQ ≤ 0`，故 $q=0$；此时 `Heisenberg.Z M 0` 是单点型、`GroupData M 0` 退化。调用点 `Main.lean:100` 与 `GeneralTransfer.lean:12` 都传 `(_hr : 0 < r)`，而实际 $r$ 是 `Fintype.card Small`（很大），不触发退化——但**Lean 的语句允许 $r=1$**，所以 $q=0$ 分支必须在素材五、5.11 单独检查。论文里没有 $q=0$ 的讨论（"论文未述"）。
3. **最小性 $\forall q'<q,\ M^{q'}<r$ 只写进 `GeneralTransfer.lean:15–16` 的结论**（`fixed_field_transfer_general`），`Main.lean:95–105` 的 `fixed_field_transfer` 不陈述它，论文里也没把它作为结论陈述（只作为 $n$ 的取法）。[推测] `GeneralTransfer` 是"论文之外的一条附注"：形式化时把 §7 的论证抽象成**任意 $r$、任意 $(K,\zeta)$ 参数**的引理再回实例化，而论文的写法是"就地实例化 $r=md$、$K=\F_{p^4}$"。这是"Lean 抽象层次高于论文"的第二例（第一例是 4.1(iii) 的 `Diagrams` 提前通用化）。
4. 同一文件还给出 $|\Lambda|$ 的精确式：`Fintype.card Λ = M*(M^q)^2`（`GeneralTransfer.lean:16`）——即论文 §7 的 $|\Lambda|=Mn^2$、$n=M^q$。

**(ix) `Padding.pad`：论文没有的补维步骤。**

`Transfer.lean:52–53`：`def pad (T : Matrix I I R) : Matrix (I⊕J) (I⊕J) R := Matrix.fromBlocks T 0 0 1`，配合 `indices : Fin r ⊕ Fin (M^(leastQ M hM r) - r) ≃ Heisenberg.Z M (leastQ M hM r)`（第 96–101 行）重标索引。**论文 §7 没有这个 padding 步骤**（它直接取 $n=M^q$ 使 $\Lambda$ 的矩阵块恰为 $n\times n$）；Lean 需要它，是因为要把"$r\times r$ 单侧逆"与"$M^q\times M^q$ 全矩阵块"用同一个 `Matrix.reindexAlgEquiv` 连起来。`pad_ne_one`（第 66–75 行，看 `Sum.inl` 分量）证明"补出来的矩阵仍不等于 1"，即**缺陷不被 padding 抹掉**——这是论文里被隐含跳过的一步（论文只说"fill the complementary summand with the identity"，见三、3.8）。

**(x) `fixed_field_data` 的 $3\le|K|$：论文里 "$Q\ge3$" 那句的真正用途。**

`Transfer.lean:129–141` 原样（节选）：

```lean
lemma finite_field_data (K : Type) [Field K] [Fintype K] (hK : 3≤Fintype.card K) :
    ∃ ζ : K, IsPrimitiveRoot ζ (Fintype.card K-1) ∧ ((Fintype.card K-1 : ℕ) : K)≠0 := by …
```

第二条靠 `FiniteField.cast_card_eq_zero K`（$|K|=0$ in $K$）与 `Nat.cast_sub`：$(|K|-1)_{\!K}=|K|-1=0-1=-1\ne0$。**$hK:3\le|K|$ 的全部作用就是给出 `hM : 2 ≤ M`（$M=|K|-1$）**，从而 `power_search` 与 `leastQ` 可用、`NeZero M` 成立。二、2.17 提到"引理 7.3 末句的 $Q\ge3$"，此处给出它在 Lean 里的唯一消耗点——**不是半单性、不是可对角化，而仅仅是 $M\ge2$**。这是一条"论文里的假设在 Lean 里只剩最小用途"的对照，适合用来检查论文措辞是否多余（结论：$Q\ge3$ 是**恰好够用**的，不能降到 $Q=2$，但对 $Q\ge4$ 也不给任何额外好处）。

**(xi) 双向不可见。** 论文 tex 里 grep `Lean|formaliz|machine-check|computer algebra` 零命中（三、3.12 第 1 条）；odd Lean 树里 grep 论文标题/`paper.tex`/任何文献引用零命中，唯一的"外部知识"是 `import Mathlib` 与那一条 `ReducedWalks`。**文本与形式化之间没有任何引用通道**——这意味着任何"论文说法 ⟺ 代码说法"的对照都必须由人（或本素材）手工搭建，也解释了为什么 4.2 这节要逐条给行号。

### 4.3 tactic 卡点与绕行

**(i) `@[irreducible]` + `opaque … : Subtype (Eq f)`：阻止大数被真值化的双层屏障。**

`Parameters.lean:8–9`：

```lean
@[irreducible] def sourceM : ℕ := Nat.choose 1200 600
@[irreducible] def sourcePrime : ℕ := Nat.minFac ((Nat.factorial sourceM)^2 + 1)
```

`SourceGluing.lean:12–20`（`p`）与 `GraphNumerics.lean:12–20`（`binom`）用的是更强的 **opaque 包装**（原样）：

```lean
def pDefinition : ℕ := sourcePrime
opaque pWrapped : Subtype (Eq pDefinition) := ⟨_, rfl⟩
def p : ℕ := pWrapped.1
theorem p_def : p = sourcePrime := by
  delta p
  rw [show pWrapped = ⟨pDefinition, rfl⟩ from Subtype.ext pWrapped.2.symm]
  rfl
attribute [irreducible] p pDefinition
attribute [eqns p_def] p
```

机制：`opaque` 让 `pWrapped` 无定义可展（只能在证明里靠 `Subtype.ext` 一次性揭示），于是 `p` 的**数值在归约机上永不可达**；`p_def` 是唯一出口，`attribute [irreducible]` 保证 `simp`/`unfold` 不自动打开它，`attribute [eqns]` 又把它登记给 `fun_prop` 一类工具。绕行的代价：每次需要 $p$ 的数论性质都必须 `rw [SourceGluing.p_def]`（`Construction.lean:19,21`、`Main.lean:97,106` 等），并要先把 `sourcePrime` 侧的引理（`sourcePrime_prime / odd / dvd / gt / minimal`，`Parameters.lean:11–44`）准备好。

为什么必须这么做（三条机械理由）：(a) `Nat.minFac ((Nat.factorial sourceM)^2 + 1)` 若可展，`Fact p.Prime` 的实例化或任何 `decide`/`norm_num` 尝试都会去真的做 `minFac`，当场卡死；(b) `Fintype.card K = p^4` 一类语句若两边可展，`simp` 会试图比较天文数字；(c) 论文的声明本身就说 $p$ 未被计算（三、3.11 第 1 条），屏障把这句话**变成代码层的不变量**：证明确实没有在任何地方依赖 $p$ 的十进制表示。**这是 Lean 侧对论文那句 "The construction is not claimed to have been evaluated as a practical computation" 的形式化对应**：代码结构与文本声明同构。

**(ii) `decide` 只用在"小常数"上，且从不碰 `sourceM`/`sourcePrime`。**

全树 `by decide` 4 次，内容全是极小事实：`zero_pow (by decide : 4≠0)`（`Construction.lean:44`）、`dvd_pow hd (by decide : 2 ≠ 0)`（`Parameters.lean:31`）、`monic_X_pow_sub_C a (by decide : 2 ≠ 0)`（`QuadraticTower.lean:18`）、`(by decide : (0 : Fin 2) ≠ 1)`（`GraphEdges.lean:89`）。另有 1 次 `decide` 用作**项**：`LocalGroup.edgeHom p modulus (decide (v = e.val.1)) (index (neighbor v e))`（`SourceGluing.lean:37`）——把"顶点 $v$ 是否等于这条边的第一端点"交给 `Fin 1200`-子集上的可判定等式。**没有 `native_decide`、没有 `#eval`、没有 `unsafe`**（grep 零命中），因此全树是纯构造性可检查的（配合 `permitted_axioms`，见 4.4）。

**(iii) `def`/`abbrev` 与 `delta`：控制展开的三件套。**

全树 `delta` 23 处，典型是 `instance : Group (Q Inc ι) := by delta Q; infer_instance`（`Gluing.lean:22`）、`by delta Extension; infer_instance`（`Amalgam.lean:23`）、`delta binom`（`GraphNumerics.lean:17`）。配合 20 处 `@[instance_reducible]`（如 `Transfer.lean:93` 的 `coordinateOrder`）与 5 处 `attribute [irreducible]`，形成一套**可控可展开性**策略：需要实例搜索时打开（`instance_reducible`），需要防止项爆炸时关闭（`irreducible` + `delta` 手动开）。4.2(ii) 记录的 `abbrev Extension → def Extension` 正是这条策略的直接证据：**同一份数学，odd 版比 char-2 版更收紧展开**。

**(iv) `convert … using 1 ; congr ; exact Subsingleton.elim _ _`：处理"证明参数不匹配"的固定套路。**

全树 `Subsingleton.elim` 20 次、`convert` 26 次、`using 1` 25 次。最机械的是 `Transfer.lean:112–124`（`output_products`）与 `Transfer.lean:26–38`（`Heisenberg.scalar_products`）里连续的 `by convert hAB using 1 ; congr ; exact Subsingleton.elim _ _`。机制：`Matrix.reindexAlgEquiv` 与 `Padding.pad` 改变了矩阵的索引类型（`Fin r` → `Fin (r ⊕ (M^q-r))` → `Z M q`），等式两边在 `congr` 层差一个 `Fintype`/`DecidableEq`/`BEq` 实例的**证明项**，而 `Subsingleton` 让这类差异一步消掉。这是"非交换 + 重索引"证明里最典型的绕行；论文侧完全看不到（数学上 trivial）。同类绕行还有长串 `simpa only [...]`（全树 `simpa` 277 次、`simp only` 361 次，例：`Diagrams.lean:3442` 的 `simp [f, Q, g, List.mem_map, Function.comp_def, List.mem_append, List.mem_cons]`）。

**(v) 生成器痕迹：`contextInstance` 236 / `portUniverse` 698 / `sectionInstance` 81。**

`Construction.lean:36–45` 的 `modulus_cast` 签名是最佳样本（原样，注意实例链被完全展开）：

```lean
lemma modulus_cast
    {K : Type}
    [contextInstance1 : Field.{0} K]
    [Fintype.{0} K]
    [@CharP.{0} K
  (@AddGroupWithOne.toAddMonoidWithOne.{0} K
    (@Ring.toAddGroupWithOne.{0} K (@DivisionRing.toRing.{0} K (@Field.toDivisionRing.{0} K contextInstance1))))
  OddKaplansky.SourceGluing.p] : (M : K) ≠ 0 := by
```

一个本该写 `variable {K} [Field K] [Fintype K] [CharP K p]` 的引理，被展开成完全显式的实例链，且 binder 名是 `contextInstance1`、`sectionInstance78/79` 这类**机器生成名**。这类签名在 odd 树里成规模出现（`contextInstance` 236 次、`portUniverse` 698 次——`Diagrams.lean` 一个文件就声明了 `portUniverse1 … portUniverse76`），而 char-2 树里 binder 名保留手写的 `u_1 u_2 u_3`（4.2(ii) 的 diff 已见）。**判读**：odd 树的这些文件是**由内部工具规范化/重打印后写回**的（把 `variable` 段展开成逐引理的完全显式签名，并统一重命名 binder/宇宙），这与 4.2(ii) 的 docstring 统计（odd 0 / char-2 149）互相印证：文档被剥、风格被重写。对本素材的意义有两条：(a) **代码风格不能作为"作者意图"的证据**；(b) **但结构无法伪造**——链式 import、opaque 屏障、复制来源、`Group.FG` 这些是工具改动不了的，所以四节刻意只做结构判断，不做风格判断。

**(vi) 两套 wreath 表示之间的翻译义务。**

odd 树同时存在两条路：`WreathFourier` 一族（用于计算，`Wreath`/`Base`/`baseElt`/`topElt`/`lamp`）与自建的 `LocalGroup p modulus`（用于与论文的 $H=A_0\rtimes P$ 对齐）。$v(s)=cu(s)c^{-1}$ 在两条路里是两个不同的项，于是每次跨越都要一条 `simpa only [local_conjugate]`（`Construction.lean:95,104`；`local_conjugate` 本体第 73–80 行，用 `MonoidAlgebra.single_mul_single, one_mul, map_inv` 三引理打平），另外 `local_lamp`（第 65–70 行）先证 `base M (lamp …) = LocalGroup.c p M`。论文只有一种写法（`02-finite-data.tex:103` 的"coordinate formula $v(s)=(c-s\cdot c,s)$ gives $U\cap V=\{1\}$"）。**判读**：这是"复用现成正规模型 vs 自建可计算模型"的经典取舍成本，且这条成本在 char-2 版不存在（char-2 的局部群不是 wreath 积）。

**(vii) `linear_combination` 全树只有 3 次，位置极有指向性。**

`Parameters.lean:49–50`：

```lean
lemma neg_one_isSquare_of_dvd (p n : ℕ) [Fact p.Prime] (h : p ∣ n^2+1) :
    IsSquare (-1 : ZMod p) := by
  refine ⟨(n : ZMod p), ?_⟩
  …
  linear_combination -hz
```

`LocalGroup.lean:95`：`have hz : a * (x-y) = 0 := by linear_combination h1 - y * h0`；`LocalGroup.lean:105`：`linear_combination h2 - (y+z) * h1 + y*z * h0`（$U\cap V=\{1\}$ 的坐标验证，即论文 `02:103` 那句的机器版）。**全树最"代数几何味"的三次自动化调用，恰好用在三处纯坐标验证上**，其余一律 `simp`/`omega`；反过来 `polyrith` **零次**——值得注意，因为 `polyrith` 是 Mathlib 里做多项式恒等式证书的标准工具，其缺席说明这三处恒等式都太简单（一次线性组合即可），不需要求证书。

**(viii) `noncomm_ring` 只在非交换层，共 6 次，位置精确可查。**

`Compression.lean:118`（`have hm : -(1+E)= -E-1 := by noncomm_ring`）、`ScalarAlgebra.lean:96,103,203,210`（`noncomm_ring [he, hea, hae, heb, hbe, hab']`，即在 $e^2=e$、$ea=ae$、$eb=be$ 假设下验非交换多项式恒等式）、`SquareCertificate.lean:48`（`noncomm_ring [hf]`）。与 `ring`（9 次，只在交换/自然数层）严格分工。这六处正是论文"所有矩阵作用在自由**右**模的列上、矩阵元从左边乘坐标、**转置不带对合**"这套约定（三、3.9 前的 intro 尾段）的形式化消耗点：$S=fR$ 是非交换环（$R=K[G_1]$），`ring` 不适用，必须 `noncomm_ring` 并显式给出可交换性假设列表。[推测] `ScalarAlgebra.lean` 里同一段 `noncomm_ring [he, hea, hae, heb, hbe]` **出现两次**（96/103 与 203/210 结构重复），说明该引理被复制了一份变体（很可能是 `block_sandwich` 的两个方向）——"复制式扩张"在 odd 树内部的再现，与 4.2(i) 的跨树复制是同一行为的两个尺度。

**(ix) 3840 行 `Diagrams` 的内部成本在哪。**

三条可核对的结构性事实：

1. `Nat.find` 极小对象选法出现 2 处（`Diagrams.lean:177–181` 的 `let n := Nat.find hret` + `Nat.find_min`，用于"取使 $p^n b=b$ 的最小 $n$"即轨道长度；`Diagrams.lean:2387–2392` 的 `obtain ⟨β, iβ, S, hcard, hS, ⟨E⟩⟩ := Nat.find_spec hex` + `Nat.find_min'`，用于取**极小面积反例地图**）。后者就是论文 Euler 论证的"取一个非平凡面数最少的球面地图"的形式化——注意 Lean 用 `Nat.find` 选极小元，又一次消耗 `Classical.choice`（见 4.4 第 4 点）。
2. `Planar.ShortWords`（1964）+ `Ribbon`/`NoncommBalanced`/`OpenDiagram`/`Related`/`Allowed` 一套（3151–3660）是"带色 ribbon + 开图 + 删除/插入块"的完整重述；`OpenDiagram.deleteBlock/insertBlock/deleteWordBlock/insertWordBlock`（3261/3347/3462/3492）是**双向**引理（删与插互逆），`related_iff`（3634）把"presentation 里等于 1"与"开图相关类非空"挂钩，`fromLocal_eq_one_iff`（3755）与 `theta_injective`（3801）收尾。`euler_contradiction`（从 char-2 `RibbonGeometry` 复制而来，见 4.2(i) 的共有名表）是 Euler 亏损不等式的名字。
3. **"一条注入性定理 = 3840 行"**：这是本篇最贵的单一事实，也是三、3.11 第 5 条防御性措辞（"Ordinary graph-of-groups normal form does not by itself establish…"）的成本核算。对照：char-2 的同类论证分散在 13 个文件（`Ribbon*`、`Planar*`、`Word*`、`GluedGroup`、`Boundary*`、`Partition*`、`Vertex*`、`Detachment*`），而 odd 把整个 diagram 层**压进一个文件**（因为链式 import 结构允许单文件巨大，分层压力消失）。

**(x) 卡点小结（按"绕行成本 / 论文可见度"排序）。**

| 卡点 | 绕行手段 | 论文里看得见吗 |
|---|---|---|
| $p$ 不可计算 | `@[irreducible]` + `opaque Subtype (Eq ·)` + `p_def` 单向出口 | 看得见（"not claimed to have been evaluated…"） |
| 分数不等式 | 整数化（`96 * finrank`、`100 * ∑ binom < binom`） | 看不见（论文写商） |
| $D_i^0\to D_i$ 的升级 | Mathlib `HNNExtension` + `StarAmalgam` | 看不见（论文写 "permutation action"） |
| 三角形自由 → 短环排除 | 显式 `8 ≤ egirth` + `SimpleGraph.le_egirth` | 半看得见（论文只说 triangle-free） |
| 两套 wreath 表示 | `local_lamp` + `local_conjugate` + `simpa only` | 看不见 |
| 矩阵重索引 + 非交换 | `convert using 1` + `Subsingleton.elim` + `noncomm_ring [假设表]` | 看不见 |
| 实例项不匹配 / 项膨胀 | `delta` / `instance_reducible` / `irreducible` / 完全展开签名 | 看不见 |
| 任意 $r$ 的标量化 | `Padding.pad` + `indices : Fin r ⊕ Fin (M^q-r) ≃ Z M q` | 看不见（论文直接取 $n=M^q$） |
| 极小对象选取 | `Nat.find` / `FiniteChoice.first` + `Classical.choice` | 看得见（"choices in ordered finite sets"） |

### 4.4 axiom 与 sorry

**解答树（87 文件）：零 sorry、零 axiom、零 `native_decide`/`#eval`/`unsafe`。** 四条 grep 均零命中（`grep -rn "sorry" OAI/Algebra/OddKaplansky/*.lean`；`grep -rn "^axiom\|axiom \|native_decide\|#eval\|unsafe" OAI/Algebra/OddKaplansky/*.lean`）。因此素材一、1.1 与二节里凡涉及"Lean 已完全验证"的说法，在 odd 树上**没有已知例外**。

**唯一的 sorry 在题面里，且是占位。** `E:/math/lean/ComparatorChallenges/OddKaplansky.lean`（全文件 33 行）第 27–28 行：

```lean
theorem main_theorem : MainClaim := by
  sorry
```

题面与解答的关系（比较器机制的核心，完整记录）：

1. **题面不 import 解答**，而是**逐字重复定义**了 `sourceM`、`sourcePrime`、`cellular`、`MainClaim` 四个语句。对照可查：`ComparatorChallenges/OddKaplansky.lean:8–25` 与 `OAI/Algebra/OddKaplansky/Parameters.lean:8–9` + `Main.lean:71–77` + `Main.lean:79–90` 内容**逐字符相同**（包括 `@[irreducible] def sourceM : ℕ := Nat.choose 1200 600` 与 `cellular d x g := d.coeff.sum fun u c => c * x (g * u)`）。题面自己也是 `namespace OAI / OddKaplansky`，因此两处的 `MainClaim` 是**不同宇宙变量的两个定义**，比较器负责证明它们陈述一致。
2. 比较器配置（`ComparatorChallenges/OddKaplansky.json`）原样：

   ```json
   {"challenge_module": "ComparatorChallenges.OddKaplansky",
    "solution_module": "OAI.Algebra.OddKaplansky.Main",
    "theorem_names": ["OAI.OddKaplansky.main_theorem"],
    "definition_names": [],
    "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
    "enable_nanoda": false}
   ```

   逐字段判读：`theorem_names` 只有一个（`main_theorem`），所以**认证的边界就是 `MainClaim` 的合取**；`definition_names: []` 表示**不要求任何定义等价**（即不检查"这里的 $H$ 与论文里的 $H$ 是否同一构造"，只检查定理陈述可证）——[推测] 这解释了为什么题面选择重复定义而非共享定义：共享定义会强迫 `definition_names` 也登记，把认证范围扩大到实现细节。`permitted_axioms` 恰是 Mathlib 的三个默认公理，**没有额外 axiom**，与 4.3(ii) 的"无 `native_decide`"合并可读成：**这份证明完全在 Mathlib 的公理预算内**。`enable_nanoda: false`——本仓库另一条可选外部检查开关，char-2 的三条 comparator 也都为 `false`，故非 odd 特有；[推测] 它是未启用的独立重检器。
3. **char-2 对照**：`KaplanskyDirectFiniteness.json`、`KaplanskyFinitelyPresented.json`、`KaplanskyStableFiniteness.json` 的 `permitted_axioms` 与 `enable_nanoda` 取值与 odd **完全相同**（三条默认 + false）。差别只在条目数（char-2 的 Kaplansky 反例占 2 条，odd 占 1 条）。所以"odd 没有 FP 附注"在 comparator 层是**独立可核对的**（4.2(iii)）。
4. **三个公理各自的实质消耗点**（谁真的被用到）：
   - `Classical.choice`：`noncomputable section` 成规模出现 + `open scoped Classical` 108 处；实质消耗是 `FiniteChoice.first / primitive / orderedIndex / functionOrder`（`FiniteChoice.lean:57–59`，有限有序集上的最小选择三件套：`primitive : F := first (fun ζ => IsPrimitiveRoot ζ (Fintype.card F - 1)) (exists_primitive F)`）、`Transfer.lean:87` 的 `Nat.find (power_search …)`、`Diagrams.lean:177` 与 `2387` 的两处 `Nat.find`、`GraphNumerics.lean:13` 与 `SourceGluing.lean:13` 的两个 `opaque`。也就是说：**论文里每一个 "least element / 取最小者" 都对应一次选择公理的使用**。这与三、1.3 记的 "specified = finite formulas and choices in ordered finite sets" 精确对偶——"choices in ordered finite sets" 在 Lean 里就是 `FiniteChoice.first` 加 `Classical.choice`。
   - `Quot.sound`：`Planar.Cycles p := Quotient (SameCycle.setoid p)`（`Diagrams.lean:24`）、`Quotient.map`（第 636–653 行）、`Gluing.Q := (con Inc ι).Quotient`（`Gluing.lean:21`）、`StarAmalgam.Amalgam`（`Amalgam.lean:150`）、`PresentedGroup (relators Inc ι)`（`Diagrams.lean:3677`）——**所有商构造**都要它。
   - `propext`：所有把 `↔`/`=` 当类型使用之处（`Subtype.ext`、`Setoid`、`Con.eq`、`Quotient.eq`）。
5. **`formalization.yaml` 只登记一条**（`:1350–1352`），即"这篇论文 ⟺ 一个声明 `OAI.OddKaplansky.main_theorem`"。**论文里 §4 引理 4.1 那样的通用定理，在登记层面不可见**——这解释了为什么 `Diagrams` 那 3840 行不被任何 comparator 引用：它们的价值只在服务 `theta_injective` 从而 `main_theorem`。

**"题面占位 vs 真实未完成"的判别法（可复用为素材模板）**：在 comparator 仓库里判一条 `sorry` 属于哪一种，看三件事——(a) 它是否在 `challenge_module`（题面）而非 `solution_module`；(b) 题面里同名的 `theorem` 是否恰在 `theorem_names` 中列出（列出即"必须由解答填充"）；(c) 解答树是否零 `sorry`。本篇三条都通过，因此**不存在"论文声称已证而 Lean 未完成"的情形**。作为对照：若某篇 `definition_names` 非空而题面里出现 `axiom`，或解答树里出现 `native_decide`，那才是真正的未完成/信任扩张信号（本篇都没有）。

---
