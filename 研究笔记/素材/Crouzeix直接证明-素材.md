# 《A direct proof of the complete Crouzeix inequality》素材采集

> 素材文件（供第一人称深读笔记使用，不是笔记本身）。
> 论文 tex：`E:\math\preprints\A-direct-proof-of-the-complete-Crouzeix-inequality-September-26-2026\build\main.tex`（623 行，全文已读）
> 附属：`build\references.tex`（105 行）、`build\figures\normal.tex`（21 行）
> Lean：`E:\math\lean\OAI\Analysis\DirectCrouzeix\`（42 个文件 / 7431 行 / 0 `sorry`）＋ `E:\math\lean\ComparatorChallenges\DirectCrouzeix.lean/.json`
> 对照同族论文：`The complete Crouzeix theorem`（yaml 第 652 行 / Lean `StructuralCrouzeix`）

## 目录

- **一、定理总览**：1.1 主定理精确陈述（照抄 `eq:main`）· 1.2 全文证明依赖图 · 1.3 "直接证明"直接在哪里（对比 Crouzeix–Haage、Glovo–Okounkov–Seip–Soria–Varona、Beckermann–Sorensen）· 1.4 一句话总结
- **二、逐引理带批注重构**（主体）：2.0 记号表 · 2.1 `lem:exterior-collar` · 2.2 `lem:faber` · 2.3 `prop:coefficients` · 2.4 `lem:resolvent` · 2.5 `thm:domain`（核心）· 2.6 `lem:approx` · 2.7 `thm:main` 的证明 · 2.8 导言那段"元证明"与正文的对应。每一节按 (a) 精确陈述 / (b) 证明机制逐步重建 / (c) 常数与假设的机械理由 / (d) 2–3 条候选失败路线 [推测] 四栏展开
- **三、叙事时间线**：3.1 动机叙述 · 3.2 问题提法 · 3.3 史段落全文 · 3.4 与同族论文的关系 · 3.5 "we do not know / no elementary" 句式清点 · 3.6 参考文献表 · 3.7 图形与 LaTeX 源痕迹 · 3.8 "论文未述"清单
- **四、Lean 取证**：4.0 题面文件与 json 配置 · 4.1 模块拓扑与量级差 · 4.2 陈述层一致性核对 · 4.3 引擎层 `analytic_domain_core`（常数 2 的产地）· 4.4 `uniform_sharpness` · 4.5 绕行清单（变分/紧性 → 证书/构造）· 4.6 tactic 密度与卡点 · 4.7 源码卫生（分片拼接痕迹）· 4.8 双向缺口清单 · 4.9 可引用的 Lean 短摘
- **五、常数与参数表**：5.0 一览表 · 5.1 $C=2$ 的完整常数账 · 5.2 权重 2 专条 · 5.3 记号冲突表
- **状态**：完成情况与取证边界声明
## 一、定理总览

### 1.1 主定理的精确陈述（tex 原文照抄）

论文 `main.tex` 第 38–52 行先把对象定义清楚。数值范围：

```tex
The numerical range of a matrix $A\in M_n(\C)$ is
\[
 W(A)=\{u^*Au:u\in\C^n,\ u^*u=1\}.
\]
It is a compact convex set containing the spectrum.
```

关键的一步是**允许矩阵系数**（`main.tex` 第 48–56 行原文）：

```tex
We allow matrix coefficients. If
$P(z)=\sum_{k=0}^d B_kz^k$ with $B_k\in M_m(\C)$, set
\[
 P[A]=\sum_{k=0}^d A^k\otimes B_k.
\]
The base space $\C^n$ is the first tensor factor. All operator norms
come from the Euclidean inner products and their Hilbert tensor products.
The complete Crouzeix conjecture asks whether the constant two holds
uniformly in the coefficient dimension $m$, the base dimension, and the degree.
```

主定理（`main.tex` 第 58–66 行，标签 `thm:main`，公式标签 `eq:main`，原文照抄）：

```tex
\begin{theorem}\label{thm:main}
For every pair of positive integers $n,m$, every $A\in M_n(\C)$,
every nonnegative integer $d$, and every polynomial
$P(z)=\sum_{k=0}^d B_kz^k$ with $B_k\in M_m(\C)$,
\begin{equation}\label{eq:main}
 \|P[A]\|\le2\max_{z\in W(A)}\|P(z)\|.
\end{equation}
The constant two cannot be decreased uniformly over $n,m$, and $d$.
\end{theorem}
```

量化顺序必须逐字记住，因为它是"complete（完整）"这个词的全部内容：
1. `For every pair of positive integers n,m` —— **底空间维数 n 与系数维数 m 同时任意、彼此独立**；
2. `every A\in M_n(\C)` —— 不对 A 加任何非次法向（nonderogatory）、数值范围有内部、可对角化之类的假设；**允许 W(A) 是一个点或一条线段**；
3. `every nonnegative integer d` —— 次数不受限；
4. `every polynomial P(z)=\sum B_k z^k with B_k\in M_m(\C)` —— 系数矩阵不交换；
5. 结尾一句 `The constant two cannot be decreased uniformly over n,m, and d.` —— 2 是**在 (n,m,d) 全体上一致的最优常数**，不只是某个固定维数下的最优。

摘要（`main.tex` 第 31–36 行）自陈定位：

```tex
\begin{abstract}
We give a direct proof of the sharp constant-two numerical-range inequality
for matrix-valued polynomials in all finite base and coefficient dimensions.
This resolves the complete Crouzeix conjecture in its matrix formulation,
including matrices whose numerical ranges are points or line segments.
\end{abstract}
```

论文自己对"完整"二字的解释（`main.tex` 第 68–72 行原文）：

```tex
The estimate includes point and segment numerical ranges. Its complete
character is the uniformity in $m$: a scalar proof need not survive
matrix amplification, because coefficient matrices need not commute.
The argument below keeps their multiplication order, using the two
products $FG$ and $GF$ separately.
```

这三句话是全文的密码本：**"complete = 对 m 一致"**、**"标量证明未必能扛住矩阵放大（amplification），因为系数矩阵不交换"**、**"本文的应对办法是保住乘法顺序，把 $FG$ 与 $GF$ 两个乘积分开用"**。Lean 侧对这三个词的机械对应分别是：`UniversalBound c` 里 `∀ n m d` 三连量化（`Model.lean` 第 28–33 行）、`tensorPolynomial` 用 `Polynomial.eval₂RingHom'`（系数环的像必须与 $A\otimes 1$ 交换才能定义，`PolynomialCalculus.lean` 第 58–66 行）、`hsSq_mul_le` 与 `hsSq_mul_le_right` 两条**方向不同**的 Hilbert–Schmidt 乘积界（`HilbertSchmidt.lean` 第 62–90 行）。

### 1.2 全文证明依赖图

论文的宏观链条（节点名用 tex 里的 label，行号是 `main.tex` 里的位置）：

```
附录 sec:collar（第 533–621 行）
   lem:exterior-collar  外共形坐标 h（领子 r_0、单极点 c≠0、q=λh' 是外法向、支撑线不等式）
        │  依赖：Riemann 映射定理、Carathéodory Jordan 定理、Schwarz 反射、
        │        单位圆周的有限覆盖粘合（"第三半径"论证）、局部反演 + 紧致性 ⇒ 更小邻域内单叶
        ▼
第 2 节 sec:coefficients（第 162–285 行）
   eq:h   h(λ)=cλ+c_0+O(λ^{-1})
   eq:support  Re( conj(q(λ)) (h(λ)-z) ) ≥ 0        ← 来自 lem:exterior-collar
   lem:faber  外 Faber 系数 b_k、边界展开 b_k(h(μ))=μ^k+Σ_j s_{kj}μ^{-j}
        │      核 K(λ,μ)=1+s+s̄ ≥ 0、每个变元边际积分 = 1、|s_{kj}| ≤ C_ρ ρ^{k+j}
        │  依赖：H(λ,μ)=(h(λ)-h(μ))/(λ-μ) 的整除差表示 eq:H、
        │        H 在倒数双盘上无零点、s=-u∂_u(H)/H、Cauchy 估计
        ▼
   prop:coefficients  Σ‖C_k‖²_HS ≤ ∫_T ‖G(h(μ))‖²_HS dτ ≤ ‖C_0‖²_HS + 2Σ_{k≥1}‖C_k‖²_HS
        │  依赖：K 的 L² 压缩 T（Jensen 型一步）、
        │        (Tu)(μ)=Σ_j(Σ_k s_{kj}C_k)μ^{-j}、
        │        三块 Fourier 支撑互不交 + Parseval
        ▼
第 3 节 sec:matrix（第 286–453 行）
   lem:resolvent  R(λ)=q(λ)(h(λ)I-A)^{-1}=Σ b_k(A)λ^{-k}、R+R*≽0、‖b_k(A)‖≤Cθ^k
        │  依赖：σ(A)⊂W(A)、eq:support、合同变换 B*(R+R*)B
        ▼
   thm:domain  （γ=‖F[A]‖、F 在 ∂Ω 上 ‖F‖≤1 ⇒ γ≤2）
        │  内部子链条（论文用 \emph 小标题切分，第 346/357/409/434 行）：
        │   (1) 奇异对 eq:singular: F[A]x=γy, F[A]*y=γx
        │   (2) 四块 P=X*RX, Q=Y*RY, M=Y*RX, L=X*RY；a²=Σ_k‖M_k‖²_HS
        │   (3) 配对恒等式 eq:pairing  y*G[A]x=Σ(M_k)_{ij}(C_k)_{ij}
        │   (4) Cauchy–Schwarz ⇒ eq:crossfunctional |y*G[A]x| ≤ a(Σ‖C_k‖²)^{1/2}
        │   (5) 有序测试 eq:ordered-products: y*(FG)[A]x=γ x*G[A]x, y*(GF)[A]x=γ y*G[A]y
        │   (6) prop:coefficients + HS 乘积界 ⇒ eq:diagonal-functional
        │   (7) 变分测试 C_0=P̄_0, C_k=P̄_k/2 ⇒ eq:weighted-dual（倒数权重 1, 1/2, 1/2, …）
        │   (8) Parseval ⇒ eq:diagonal-L2（上界 4a²/γ²）与 eq:cross-L2（下界 a²）
        │   (9) Δ≽0、J=diag(I,-I)、tr(Δ^{1/2}(JΔJ)Δ^{1/2})≥0 ⇒ 2a² ≤ … ≤ 8a²/γ² ⇒ γ≤2
        ▼
第 4 节 sec:limit（第 454–531 行）
   lem:approx  解析凸外逼近 Ω_δ（指数和次水平集、δ-网含四个轴向、Hessian 正定、
        │       距离估计 sup dist(z,K) ≤ δ(1+diam K)/(1-δ)）
        ▼
   thm:main  证明 = Toeplitz–Hausdorff 凸性重证 + lem:approx + thm:domain 缩放 + 一致连续取极限
             + 2×2 幂零 A=[[0,2],[0,0]], P(z)=z, m=1 给最优性
```

依赖图里有两个"反向边"值得注意：

- `thm:domain` 的证明第 327 行写 `Choose $h$ from Lemma~\ref{lem:exterior-collar} and apply Theorem~\ref{lem:faber} to this coordinate.`，即**正文定理反过来引用附录**；附录排在 `\input{references.tex}` 之前（`\appendix` 在第 532 行），逻辑上是全文第一块基石，阅读顺序上却是最后一块。
- tex 源码内部的命名不一致：`lem:exterior-collar`、`lem:approx` 是 `lemma` 环境，`prop:coefficients` 是 `proposition`，而 `lem:faber`、`lem:resolvent` 虽然是 `lem:` 前缀却都声明为 `theorem`（`main.tex` 第 182、295 行）。这说明这两条一度被当作引理、后来升格为独立定理（它们各自有完整的假设清单，可被单独引用）。升格的痕迹还有：`lem:faber` 的假设里把 §2 开头的" supplied exterior map"重新完整列了一遍（第 183 行 `Let $h$ be meromorphic and one-to-one on $|\lambda|>r$ including infinity ...`），与 §2 第 163 行几乎逐字重复。

另外第 236–243 行插入两段"身份确认"文字，不属于任何 theorem 环境：一段把 $b_k$ 认成 Faber 多项式（$b_k$ 是 $\Phi^k$ 的多项式部分，$\Phi=h^{-1}$），一段把 $s_{kj}$ 认成**微分后的 Grunsky 系数**（differentiated Grunsky coefficients），并明确交代经典加权系数不等式的出处是 `[Beckermann–Stylianopoulos 2018, equations (1.1)--(1.3)]`，而本文要的是**不带权**的版本，理由写的是

```tex
the unweighted estimate used here follows from convexity and the two
angular marginal identities.
```

这句话是"直接"二字的第二个技术落点：不借用 Grunsky 理论的重型 machinery，只用凸性给的支撑线符号 + 两个边际归一化。

### 1.3 "直接证明"直接在哪里

论文的"直接"有三层，都能从 tex 里指出字面位置。

**第一层：不建结构对象，一次只估计一个多项式。** 第 124–128 行原文：

```tex
The direct proof below estimates one polynomial at a time. Its exterior
kernel, marginal identities, and positive block comparison have counterparts
in \cite[Propositions~3.1 and~3.3 and Lemma~5.1]{OpenAI2026Complete};
Sections~\ref{sec:coefficients}--\ref{sec:matrix} prove the specific
coefficient, resolvent, and block estimates used here.
```

对照同族的"structural"证明（`OpenAI2026Complete` = *The complete Crouzeix theorem: optimal similarity and a common positive boundary representation*，第 114–123 行原文摘要）：

```tex
A separate structural proof of the complete inequality is given in
\cite{OpenAI2026Complete}. For a bounded convex domain $\Omega$ with
regular real-analytic boundary and $W(A)\subset\Omega$, it constructs a
positive definite $S$ with $\|S\|\|S^{-1}\|\le2$ such that
$S f(A)S^{-1}$ is a contraction, where $f:\Omega\to\D$ is an interior
conformal map and $\D=\{z\in\C:|z|<1\}$. The same $S$, obtained from a
minimizing metric, gives one continuous normalized positive boundary density representing
the calculus of $SAS^{-1}$ for every coefficient dimension and every
matrix function holomorphic near $\overline\Omega$
\cite[Theorems~1.2--1.3 and Proposition~2.1]{OpenAI2026Complete}.
```

两篇的策略差异（第 2、3 列取自本文第 114–128 行的自述；末行含 [推测]）：

| 维度 | 本篇 DirectCrouzeix（直接） | StructuralCrouzeix（结构） |
| --- | --- | --- |
|  共形映射方向 | **外**共形映射 $h:\{\lvert\lambda\rvert>1\}\to\C\setminus\overline\Omega$（第 163 行） | **内**共形映射 $f:\Omega\to\D$（第 118 行）  |
|  核心产出 | 一条数不等式 $\|P[A]\|\le2\max_{W(A)}\|P\|$ | 一个**算子对象**：正定 $S$，$\|S\|\|S^{-1}\|\le2$，使 $Sf(A)S^{-1}$ 为压缩  |
| 边界表示 | 不存在全局边界测度；只在一次估计里临时用 $R+R^*$ | 存在**同一个**归一化正边界密度，对一切系数维数、一切近 $\overline\Omega$ 全纯的函数统一表示 |
| 主要工具 | 单变元 Fourier 分析（$L^2(\T;M_m)$）＋ 双变元正核 $K(\lambda,\mu)$ | 变分/极小度量（minimizing metric） |
| 估计对象 | 一个多项式 $F$ + 它的一对奇异向量（第 329 行） | 整个泛函演算的表示 |
|  常数的来源 | Parseval 权重配平（$1$ vs $1,\tfrac12$）→ $\gamma^2\le4$ | 相似条件数 $\|S\|\|S^{-1}\|\le2$  |
| 覆盖范围 | 所有 $n,m,d$（点/线段数值范围靠 `sec:limit` 的外逼近） | 同样完整，但要求 $W(A)\subset\Omega$ 且 $\partial\Omega$ 正则实解析后取极限 |
| 相互引用 | 本文第 124–128 行点名 companion 的 Prop 3.1/3.3、Lemma 5.1 有对应物 | companion 侧 [推测] 把本文这条路线作为"另一篇直接证明"并列，具体措辞见该论文（素材主体不做那一篇） |

**第二层：常数的出现方式"直接"。** 传统路线的常数（$11.08$、$1+\sqrt2$）来自把若干不等式串联后**剩下的余量**；本文的 2 来自一条**双向夹逼**：Parseval 给出对角块的上界 $4a^2/\gamma^2$（`eq:diagonal-L2`），同时给出交叉块的下界 $a^2$（`eq:cross-L2`），正块比较把两者夹在一起得到 $\gamma^2\le4$，开方即 2。第 150–158 行原文：

```tex
These are exactly the weights in the squared Fourier norms of the corresponding
Hermitian diagonal compressions, after a common factor of four.

Section~\ref{sec:matrix} completes the comparison. The numerical-range
condition makes $R+R^*$ positive, so its compression to a two-by-two
block bounds the off-diagonal boundary norm by the two diagonal norms.
The cross term retains all coefficients of the first functional, including
its constant coefficient. The resulting inequality gives the sharp bound
two.
```

`exactly` 与 `after a common factor of four` 是说：这个证明里 2 不是被压出来的，而是**两边权重刚好配平**的结果。"cross term retains all coefficients of the first functional, including its constant coefficient" 是关键一句 —— 交叉块 $M+L^*$ 的 Fourier 权重是全 1（第 429–431 行公式），而对角块 $P+P^*,Q+Q^*$ 的权重是 $1,\tfrac12,\tfrac12,\dots$；正是**这一组权重差**把常数从"某个 $>2$ 的数"钉到 $2$。

**第三层：与已知路线的差异。** 论文列出的路线（第 74–112 行，逐字引用见第三节）：

- **Crouzeix 2004 / 2007**：标量常数二问题的提出 + 第一个完整界 $11.08$。差异是常数（$11.08\to2$）与论证层级。
- **Delyon–Delyon 1999**：正边界表示。本文保留其内核 —— 第 291–293 行明说 `This Hermitian field is the numerical-range double-layer kernel of \cite{DelyonDelyon1999,CrouzeixPalencia2017}; we prove the positivity for the original matrix $A$`，即不引用其表示定理，只**借用同一个核的正性**并自证。
- **Crouzeix–Palencia 2017（$1+\sqrt2$）**：正双层位势 + 共轭边界数据的 Cauchy 变换。分野：Crouzeix–Palencia 路线把问题化成一个 **singular integral / Cauchy 变换的算子范数**估计，常数被这个范数量级（$1+\sqrt2$）支配；本文换成**离散 Fourier 侧的系数恒等式 + 正块矩阵比较**，因此不再有"奇异积分范数"这个瓶颈。[背景] Crouzeix–Palencia 的 $1+\sqrt2$ 来自 Hilbert 变换在 $L^2$ 中关于凸曲线的界 $\|H\|\le\tan(\pi/2\alpha)$ 型估计在 $\alpha=3/4$ 处的值 —— **论文未述这条推导**，只写了构造方法。
- **Ransford–Schwenninger 2018**：只简化 $1+\sqrt2$ 的**最后一步范数论证**，量级不变。
- **Badea–Crouzeix–Delyon 2006（$n=2$ 完整 2）**：靠**相似变换**把共形像变成压缩，条件数 ≤ 2，用数值范围椭圆。这是"2 从相似条件数来"的老路子；本文全程不做相似变换、不构造 $S$，2 从权重配平来。
- **Crouzeix–Greenbaum 2025（加权移位矩阵的完整 2）**：标量极值函数 + 相似化约后取达到范数的向量。本文第 111–112 行的替代说法是 `Here a Faber coefficient estimate controls the two diagonal functionals obtained by placing a test polynomial on each side of the polynomial being estimated.` —— **不化约 $A$、不假设移位结构**，且用"两侧各放一个测试多项式"（即 $FG$ 与 $GF$）代替"取一个极值函数"。
- **Jin 2026 / Lorist–Schwenninger 2026 / Luo 2026**：三篇 **标量**（$m=1$）证明。本文第 99–100 行的定位：`The scalar results fix $m=1$, while the latter complete result restricts the base dimension; Theorem~\ref{thm:main} leaves these dimensions independent.` 尤其 Lorist–Schwenninger 的 Section 3(iv) 被点名（第 94–96 行）：他们证明里用的交换性**在放大下不会自动保持**，这是"标量 ⇒ 完整"的一般性障碍。
- **Åhag–Czyż–Virtanen 2026**：$n\le3$、$m$ 任意的完整不等式 —— 与本文互补：他们限底维数、不限系数维数。
- **Beckermann 2005 / Beckermann–Crouzeix 2014**：Faber 多项式进入数值范围泛函演算的先例（第 102–103 行承认）。另外第 236 行提到经典 Faber 归一化选相位使 $c>0$，而本文**不需要**这个归一化（只要求 $c\ne0$）—— 机械理由见 2.2。
- **用户点名但论文未述的路线**：`references.tex` 里**没有** Crouzeix–Haage、**没有** Glovo–Okounkov–Seip–Soria–Varona、**没有** Beckermann–Sørensen。这三条与本文的差异**论文未述**；若展开笔记要写，必须标注为读者背景知识（[背景]）而不是论文内容，否则会造假。

### 1.4 一句话总结

**"直接"= 不构造任何全局对象（不做相似变换、不建公共正边界密度、不取极值函数），而是对给定多项式 $F$、取它的一对奇异向量 $x,y$、把预解式压缩成 $2\times2$ 块矩阵 $\Delta$，靠 $K$ 核的 $L^2$ 压缩性质把"系数 $\ell^2$ 范数"与"边界 $L^2$ Hilbert–Schmidt 范数"夹成双向不等式，再让正性 $\Delta\succeq0$ 把权重 $1,1,1,\dots$（交叉块）与 $1,\tfrac12,\tfrac12,\dots$（对角块）之差兑换成恰好 $\gamma^2\le4$。**

## 二、逐引理带批注重构

### 2.0 记号表与全局约定（散落在 §2 开头与导言，先集中一次）

| 记号 | tex 出处 | 定义原文 / 说明 |
| --- | --- | --- |
|  $\C,\T,\D$ | 第 10–12 行宏 | `\newcommand{\C}{\mathbb C}` 等；$\T=\{\lambda:\lvert\lambda\rvert=1\}$ 在第 169 行文字里点明  |
| $\HS x=\lvert x\rvert_2$ | 第 13 行 `\newcommand{\HS}[1]{\lvert #1\rvert_2}` | **未归一化** Hilbert–Schmidt 范数；第 180 行原文：`We use the unnormalized Hilbert--Schmidt norm $\HS C=(\tr(C^*C))^{1/2}$, which makes each finite-dimensional matrix space a Hilbert space.` |
| $\tr,\Rea,\diag,\dist$ | 第 14–17 行 | `\DeclareMathOperator`；正文里出现的是 $\tr$（第 180、442–444 行）、$\Re$（直接用 `\Re`，第 171、229、317、320、484、493 等行）、$\diag$（第 440 行 $J=\diag(I_m,-I_m)$）、$\dist$（`lem:approx`） |
| $d\tau(e^{it})=dt/(2\pi)$ | 第 178 行 | `Every circle integral below uses $d\tau(e^{it})=dt/(2\pi)$.` —— **归一化**圆周测度；总质量 1。这个 1/(2π) 与 $\HS{\cdot}$ 的"未归一化"是配套的一对选择，见 2.3(d) |
| $\Omega$ | 第 163 行 | bounded open **convex** set with regular real-analytic Jordan boundary |
| $h$ | 第 163–166 行 | 外共形映射，在 $\lvert\lambda\rvert>r$（含 $\infty$）单叶，$0<r<1$，把 $\lvert\lambda\rvert>1$ 映到 $\C\setminus\overline\Omega$，在 $\infty$ 有单极点：`h(\lambda)=c\lambda+c_0+O(\lambda^{-1}),\ c\ne0` |
| $q(\lambda)=\lambda h'(\lambda)$ | 第 169 行 | 在 $\T$ 上是**外法向**；$iq(\lambda)$ 是**正向切向**（原文：`the vector $q(\lambda)$ is an outward normal and $iq(\lambda)$ is a positively oriented tangent`） |
| $b_k$ | 第 184–186 行 eq:faber | `\frac{q(\lambda)}{h(\lambda)-z}=\sum_{k\ge0}b_k(z)\lambda^{-k}`，在 $\infty$ 处展开 |
| $s_{kj}$, $s(\lambda,\mu)$ | 第 192–195 行 eq:s | `s(\lambda,\mu)=\frac{q(\lambda)}{h(\lambda)-h(\mu)}-\frac{\lambda}{\lambda-\mu}=\sum_{k,j\ge1}s_{kj}\lambda^{-k}\mu^{-j}` |
| $K(\lambda,\mu)$ | 第 201–203 行 | `K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}` |
| $R(\lambda)$ | 第 297–299 行 eq:R | `R(\lambda)=q(\lambda)(h(\lambda)I-A)^{-1}` |
| $P,Q,M,L$ | 第 334–336 行 | `P=X^*RX,\ Q=Y^*RY,\ M=Y^*RX,\ L=X^*RY`；下标 $k$ = $\lambda^{-k}$ 的系数，如 $M_k=Y^*b_k(A)X$ |
| $a^2$ | 第 341 行 | `Set $a^2=\sum_{k\ge0}\HS{M_k}^2$.` |
|  $\|\cdot\|_\partial$ | 第 368–371 行 | `\|H\|_\partial^2=\int_\T\HS{H(h(\mu))}^2\,d\tau(\mu)`（把边界 $L^2$ HS 范数的平方记成一个范数平方）  |
| $\Phi=h^{-1}$ | 第 236 行 | 外部的逆映射，用来认 Faber 多项式 |
|  $\gamma$ | 第 329 行 | `Put $\gamma=\|F[A]\|$.`  |

三条**全局选择**（不是某个引理内部的技巧，而是贯穿全文的口径），后面每个常数都要回引它们：

1. **HS 未归一化 + 圆周测度归一化**。这样 Parseval 是"等号"而不是带 $m$ 因子的不等式：$\int_\T\HS{u}^2d\tau=\sum_{n\in\Z}\HS{\hat u(n)}^2$。若 HS 归一化（除以 $\sqrt m$），$m$ 会从 Parseval 侧冒出来，破坏"对 $m$ 一致"。[推测：这是"complete"能保住的形式原因之一。]
2. **只用 $L^2$，不用 $L^\infty$**。论文的假设是 $\|F(z)\|\le1$ 在 $\partial\Omega$（$L^\infty$ 型），但估计全部在 $L^2(\T;M_m)$ 里做；桥梁是 $F$ 是多项式（有限 Fourier 支撑），$\|F\|_\partial\le\sup_{\partial\Omega}\|F\|$ 一步到位（第 380 行 $\|FG\|_\partial\le\|G\|_\partial$ 链条里的第一式）。
3. **$2\times2$ 块正性代替标量正性**。所有正性最终只用到一次 $\Delta\succeq0$（第 435–445 行），且是 $2m\times2m$ 的块矩阵；$J=\diag(I_m,-I_m)$ 的三明治技巧把"交叉块被对角块控制"翻译成一个**迹**不等式，因此只需要 HS（Hilbert 空间结构），不需要任何谱分解。

### 2.1 附录引理 `lem:exterior-collar`：外共形坐标与单叶子领子

#### (a) 精确陈述（`main.tex` 第 536–554 行原文照抄）

```tex
\begin{lemma}[Exterior coordinate and a univalent collar]
\label{lem:exterior-collar}
Let $\Omega\subset\mathbb C$ be a bounded convex domain whose boundary
is a regular real-analytic Jordan curve. There are $0<r_0<1$ and a map
$h$, meromorphic on $\{\lambda:|\lambda|>r_0\}\cup\{\infty\}$,
which is one-to-one there as a map of the sphere, has a simple pole at
infinity, and maps $|\lambda|>1$ conformally onto
$\mathbb C\setminus\overline\Omega$. It maps the unit circle onto
$\partial\Omega$ and has an expansion
\[
 h(\lambda)=c\lambda+c_0+\sum_{j\ge1}c_j\lambda^{-j},\qquad c\ne0.
\]
For $\lambda$ on the unit circle, $q(\lambda)=\lambda h'(\lambda)$
is a nonzero outward normal vector at $h(\lambda)$. In particular,
\[
 \operatorname{Re}\bigl(\overline{q(\lambda)}(h(\lambda)-z)\bigr)
 \ge0\qquad (z\in\overline\Omega).
\]
\end{lemma}
```

量化顺序：给定域 → 存在 $(r_0,h)$ 一对；$h$ 的解析性只要求在**领子** $\{|\lambda|>r_0\}\cup\{\infty\}$ 上作为**球面映射**单叶（注意 "as a map of the sphere"：$\infty$ 也参与单叶性，这正是 $h$ 在 $\infty$ 有单极点、把 $\infty$ 映到 $\infty$ 的说法）。

#### (b) 证明机制逐步重建（第 556–621 行）

**步骤 1：反演把外部变成有界单连通域。** 取 $z_*\in\Omega$，作用于球面外部 $(\C\setminus\overline\Omega)\cup\{\infty\}$ 得
$$h\rightsquigarrow U=\Bigl\{\tfrac{1}{z-z_*}:z\notin\overline\Omega\Bigr\}\cup\{0\}.$$
论文给出的**为什么 $U$ 是 star-shaped 且有正则实解析 Jordan 边界**的理由是逐字可抄的（第 561–564 行）：

```tex
Its image $U$ is
a bounded simply connected domain containing zero, with a regular
real-analytic Jordan boundary. Indeed, each ray from $z_*$ meets
$\partial\Omega$ at a unique positive radius; inversion turns the
exterior portions of these rays into a star-shaped domain about zero.
```

这里用了凸性两次：(i) 射线从内点出发只交边界一次（唯一正半径），(ii) 由此得到的像是关于 0 星形的。**注意**：$z_*\in\Omega$ 需要 $\Omega$ 有内部；这在 `thm:domain` 的假设里有（$\Omega$ 是 open convex），但 $W(A)$ 退化成点的情形是在 `lem:approx` 里先人为造出一个开集后才进入这条引理的 —— 依赖图上是 `lem:approx` → `lem:exterior-collar`，不是反过来。

**步骤 2：Riemann 映射 + Carathéodory。** 引 `Ahlfors1979` Chapter 6 §1.1 Theorem 1 得共形双射 $g:\D\to U$，$g(0)=0$；再引 Carathéodory Jordan 域定理（Ahlfors Chapter 6 §1.2）把 $g$ 扩成 $\overline\D\to\overline U$ 的同胚。这一步只给**连续**边界延拓，不给解析延拓。

**步骤 3：Schwarz 反射给边界解析开拓（论文用了 14 行来"justify the stronger boundary continuation needed below"）。** 拆解：
1. 正则实解析边界弧有非零导数的实解析参数化；
2. 参数化的全纯延拓 + 全纯反函数定理 ⇒ 存在局部坐标把该弧变成**实区间**、域变成区间的一侧；
3. 在 $\zeta\in\partial\D$ 与 $p=g(\zeta)\in\partial U$ 各取这样的坐标；
4. 用**边界延拓的连续性**收缩源邻域，使 $g$ 把（源邻域 ∩ $\overline\D$）送入目标图；
5. $g$ 在新坐标下表示为：上半盘上全纯、在实区间上连续、且在实区间上**取实值** ⇒ Schwarz 反射跨过实区间全纯延拓（引 Ahlfors Chapter 4 §6.5 与 Chapter 6 §1.3–1.4）；
6. 对 $g^{-1}$ 同样处理，收缩邻域使反射后的映射可复合；复合在原域一侧等于恒等 ⇒ **identity theorem** ⇒ 在整个更小邻域等于恒等 ⇒ 延拓后的 $g$ 在每个边界点导数非零。

第 4 与第 6 步是容易被略读掉的：**"$g$ 把源邻域送进目标图"这一步是必须先收缩才能成立的**，否则反射坐标只在目标的一个小邻域里定义；而对 $g^{-1}$ 也反射并验证复合是恒等，才能得到**导数非零**，光反射 $g$ 只给全纯性。

**步骤 4：粘合（论文自创的"第三半径"论证，第 588–598 行）。** 这是我认为最能体现"作者真的在算"的一段，因为它不引任何 standard patching 定理而是现场证明：
- 每个 $\zeta\in\partial\D$ 取一个携带解析开拓的开圆盘 $B(\zeta,R_\zeta)$，与 $g$ 在 $B\cap\D$ 上一致；
- 取有限子覆盖，但只覆盖**三分之一半径**的盘 $V_i=B(\zeta_i,R_i/3)$，大盘记 $U_i=B(\zeta_i,R_i)$；
- 若 $V_i\cap V_j\ne\varnothing$ 且 $R_i\ge R_j$，则
  $$|\zeta_i-\zeta_j|<(R_i+R_j)/3\le 2R_i/3<R_i,$$
  所以 $\zeta_j\in U_i$；同理 $\zeta_i\in U_i$（显然）。于是透镜形连通集 $U_i\cap U_j$ **同时包含 $\zeta_i,\zeta_j$** 并且**与 $\D$ 相交**（因为它含边界点而且开，任何边界点的邻域都碰到 $\D$）；
- 两个开拓在 $U_i\cap U_j$ 内、在 $U_i\cap U_j\cap\D$ 这个非空开集上相等 ⇒ identity theorem ⇒ 在整个透镜上相等 ⇒ 相容。

这一步的机械理由："$1/3$" 不是任意选择。若用一半半径：$|\zeta_i-\zeta_j|<(R_i+R_j)/2\le R_i$ —— 也成立！但 $R_i\ge R_j$ 时 $(R_i+R_j)/2\le R_i$ 只给**非严格**不等式（$R_i=R_j$ 时取等号），所以 $\zeta_j$ 可能恰好在 $\partial U_i$ 上，透镜就不一定包含 $\zeta_j$。$1/3$ 把不等式变成严格的：$(R_i+R_j)/3\le 2R_i/3<R_i$。**放宽成 $1/2$ 会在"$\zeta_j\in U_i$"这一步崩**（退化情形失去开性）；放宽成任何 $\ge1/2$ 都不行。这是"第三半径"这个说法的硬理由。

**步骤 5：紧致性 → 单叶性（第 600–607 行）。** 论证是标准反证：若在闭盘的任意小邻域内都不单叶，则存在相异点对 $(w_k',w_k'')$，$|w_k'-w_k''|\to0$（或至少两点都趋近紧致集），取子列收敛到 $\overline\D$ 内的公共极限 $w$；由 $\overline\D$ 上的连续性与单叶性，两点极限必须相同；而每个边界点有**局部反演邻域**（步骤 3 的导数非零 ⇒ 局部双全纯），充分接近后两点落在同一个局部反演邻域内，与该邻域内单叶矛盾。⇒ 存在 $R_0>1$ 使 $g$ 在 $\{|w|<R_0\}$ 单叶。
- 附加两句必要的账：`Its sole zero there is $0$, and that zero is simple.` —— $g(0)=0$ 且 $g'(0)\ne0$（单叶 ⇒ 除零点外不取 0；$g$ 是 $\D$ 上的双射所以 0 的原像唯一）。这保证 $1/g(1/\lambda)$ 恰有**单**极点。

**步骤 6：定义 $h$。**
```tex
 h(\lambda)=z_*+\frac1{g(1/\lambda)},\qquad r_0=R_0^{-1}.
```
于是 $h$ 在 $\{|\lambda|>r_0\}\cup\{\infty\}$ 亚纯、单叶，$h(\infty)=\infty$，展开式 $h(\lambda)=c\lambda+c_0+\sum_{j\ge1}c_j\lambda^{-j}$ 中
$$c=\frac{1}{g'(0)}\ne0.$$
这是全文第一个"常数来源"：$c$ 不是被选的，是 $g'(0)$ 的倒数；$\lambda\mapsto1/\lambda$ 把 $\{|w|<R_0\}\setminus\{0\}$ 送到 $\{|\lambda|>r_0\}$，$g$ 的 $R_0$ 盘外推变成 $h$ 的 $r_0$ 领子。

**步骤 7：法向与支撑线（第 615–620 行）。** 在 $\lambda=e^{i\theta}$：径向导数 $=\partial_r h(re^{i\theta})|_{r=1}=h'(\lambda)\lambda=q(\lambda)$；角向导数 $=\partial_\theta h(e^{i\theta})=ih'(\lambda)e^{i\theta}=iq(\lambda)$。两者**垂直**（相差因子 $i$）且**非零**（$h'$ 在领子内不为 0：$g'$ 在 $\{|w|<R_0\}$ 内非零）。半径增大 ⇒ 进入 $\overline\Omega$ 的外部 ⇒ $q(\lambda)$ 指向外。最后一步：`The supporting half-plane property of a smooth convex boundary proves the final inequality.` 即凸集在边界点被支撑半平面包含，$z\in\overline\Omega$ 在内侧，所以 $\Re(\overline{q(\lambda)}(h(\lambda)-z))\ge0$。

**注意符号方向的一个坑**（我读第一遍时差点弄反）：不等式左边是 $\overline{q(\lambda)}(h(\lambda)-z)$，即"从 $z$ 指向边界点"的向量与外法向的内积 $\ge0$ —— 因为 $z$ 在边界点**内侧**，$h(\lambda)-z$ 大体朝外，与外法向同侧。如果误写成 $(z-h(\lambda))$，第 (5) 步 `eq:crossfunctional` 之后的正性（`lem:resolvent` 的 $R+R^*\succeq0$）会变负号，整条链立刻崩。Lean 里这个方向被写成 `0 ≤ (conj (Faber.boundaryNormal c g t)*(Faber.boundary c g t-w)).re`（`DomainBound.lean` 第 77–78 行），完全一致。

#### (c) 各假设/常数的机械理由（放宽它会在哪一步崩）

| 假设/常数 | 用在哪一步 | 放宽后的崩点 |
| --- | --- | --- |
|  $\partial\Omega$ 是**正则实解析** Jordan 曲线 | 步骤 3（Schwarz 反射需要解析弧的解析参数化与非零导数） | 只要 $C^k$ 或 Lipschitz：反射不成立 ⇒ $h$ 不能跨过 $\T$ ⇒ 领子 $r_0$ 不存在 ⇒ `lem:faber` 里 $s$ 的双变量全纯与 $\lvert s_{kj}\rvert\le C_\rho\rho^{k+j}$ 全部失效，$T$ 不再是 $L^2$ 算子（核不收敛）。这是"为什么本文先做解析域、再靠 `lem:approx` 外逼近"的全部理由。  |
| **Jordan**（单闭曲线）+ 凸 | 步骤 1（射线唯一交点）、步骤 2（Carathéodory） | 边界自交则 $U$ 不是 Jordan 域，$\overline\D\to\overline U$ 同胚失败；非凸则射线可能多次交边界，星形性与 $z_*$ 内点假设都失效。 |
| $\Omega$ **有界** | 步骤 1（$U$ 有界） | 无界外部反演后 0 可能不是内点 / $g$ 的像不有界，Riemann 定理仍可用但 $h$ 的极点阶数会变（例如映射 $\infty\mapsto\infty$ 变成高阶极点），$b_k$ 的次数就不再是 $k$。 |
| $z_*\in\Omega$（内点存在） | 步骤 1 | $\Omega$ 无内部（点/线段）⇒ 没有内点 ⇒ 整条附录不可用。**这正是 `lem:approx` 存在的理由**：先把退化的 $K$ 塞进有内部的解析凸域。 |
| $c\ne0$（等价 $g'(0)\ne0$） | `lem:faber` 里 $b_k$ 首项系数 $c^{-k}$；`prop:coefficients` 的 $b_k$ 是一组基 | 若 $c=0$（$g$ 在 0 有重根，即 $h$ 在 $\infty$ 有二阶以上极点）⇒ $b_k$ 的次数变成 $\lceil k/\nu\rceil$，$b_k\circ h$ 的正 Fourier 项变成 $\lambda^{k\nu}$ 型 ⇒ **正负频谱不再按 $k$ 分离**，Parseval 分解 $C_0+u+Tu$ 三块不交的写法失效。 |
|  $0<r_0<1$（领子宽度） | 只在 `lem:faber` 与 `lem:resolvent` 里选 $\rho,\theta$ 用 | 若 $r_0=1$（无领子）⇒ 无法取 $r<\rho<1$，几何衰减 $\|s_{kj}\|\le C_\rho\rho^{k+j}$ 变成无衰减 ⇒ $s$ 在 $\T^2$ 上不再绝对一致收敛 ⇒ 第 267 行 `All interchanges are justified by the absolute uniform convergence` 这句授权失效。  |
| $R_0>1$ 与 $r_0=R_0^{-1}$ | 步骤 4/5 的全部输出 | 论文对 $r_0$ 的**数值**毫无要求，只要 $<1$。这是刻意的：领子宽度不参与最后的常数 2。 |

#### (d) 候选失败路线 [推测]

1. [推测] **为什么不直接用 Riemann 映射定理在外部共形到 $\D$ 的"标准外部版本"（Ahlfors 的正规化 $h(\lambda)=\gamma+\lambda+\dots$）**。标准做法要求先证明外部映射可跨过边界；论文选的路线是**反演成内部问题、在内部做反射再变回来**。可能的绕开理由：内部的 Schwarz 反射有现成的教科书陈述（Ahlfors Ch.4 §6.5），而外部版本要么重新证、要么依赖边界参数化的解析性定义；把问题搬到 $\overline\D$ 的一个邻域上，"第三半径"论证在开圆盘里最干净。
2. [推测] **为什么不用 Kellogg–Warschawski 定理（边界解析的共形映射的导数到边界连续可延）**。那是现成的一劳永逸结果，但它处理的是**内部映射的导数**的延拓，而本文需要的是 $h$ 在 $\infty$ 附近的 Laurent 系数**几何衰减**以及 $h$ 作为球面映射的**单叶领子**。自己从反射搭一遍可以同时把单叶性与极点阶数拿到手，避免两次引用不同定理再核对相容性。
3. [推测] **为什么不用共形容量/保形映射的数值构造**。因为全文只在**符号层面**用 $h$（$b_k$、$s_{kj}$、$q$），任何具体 $h$ 都不需要写出来；反而若引入具体映射（椭圆、多边形的 Schwarz–Christoffel），会把证明特殊化成"某类域上的证明"，还得再补一次逼近论证。这也解释了为什么论文宁愿把附录写成存在性引理。

（本小节继续时，先把已写内容的行号对齐检查过一次：`lem:exterior-collar` 的 `q(\lambda)` 在附录里定义为 `\lambda h'(\lambda)`（第 548 行），在 §2 里第 169 行**重新定义**了一次同名记号 —— 素材记录：论文对该记号有两次独立定义，且两处措辞一致，说明 §2 是被写成可独立阅读的。）

### 2.2 定理 `lem:faber`：外 Faber 系数与正核

这是全文真正的技术发动机，也是"直接证明"这个名字里"直接"最具体的地方：它把一个几何信息（凸性）兑换成一个 Hilbert 空间算子性质（一个 $L^2$ 压缩）。

#### (a) 精确陈述（`main.tex` 第 182–205 行原文照抄，含全部量化顺序）

```tex
\begin{theorem}[Exterior Faber coefficients and the positive kernel]\label{lem:faber}
Let $\Omega$ be a bounded convex domain with regular real-analytic Jordan boundary. Let $h$ be meromorphic and one-to-one on $|\lambda|>r$ including infinity, where $0<r<1$, with a simple pole at infinity as in \eqref{eq:h}, and mapping $|\lambda|>1$ onto $\C\setminus\overline\Omega$. Put $q(\lambda)=\lambda h'(\lambda)$ and define $b_k(z)$ by expansion at infinity:
\begin{equation}\label{eq:faber}
 \frac{q(\lambda)}{h(\lambda)-z}=\sum_{k\ge0}b_k(z)\lambda^{-k}.
\end{equation}
Then $b_0=1$, and each $b_k$ is a polynomial of degree $k$ with leading coefficient $c^{-k}$. There are scalars $s_{kj}$, $k,j\ge1$, such that
\begin{equation}\label{eq:boundary-basis}
 b_k(h(\mu))=\mu^k+\sum_{j\ge1}s_{kj}\mu^{-j}\quad(k\ge1).
\end{equation}
The function
\begin{equation}\label{eq:s}
 s(\lambda,\mu)=\frac{q(\lambda)}{h(\lambda)-h(\mu)}-\frac{\lambda}{\lambda-\mu}
 =\sum_{k,j\ge1}s_{kj}\lambda^{-k}\mu^{-j}
\end{equation}
extends holomorphically across the diagonal and both infinities in $|\lambda|,|\mu|>r$. For every $r<\rho<1$ there is a constant $C_\rho$ with
$|s_{kj}|\le C_\rho\rho^{k+j}$. The series converges normally on
the exterior product collar: it converges absolutely and uniformly on
every compact subset, including subsets meeting either infinity. In particular it converges absolutely and uniformly on $\T^2$. The continuous kernel
\[
 K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}
\]
is nonnegative and has integral one in each variable with the other fixed.
\end{theorem}
```

陈述里塞了七件事，逐条列出以免漏读：
1. $b_0=1$；
2. $\deg b_k=k$ 且首项系数 $c^{-k}$（⇒ $\{b_k\}$ 是标量多项式的一组基，证明第 208 行末句 `In particular, the $b_k$ form a basis of the scalar polynomials.`）；
3. 边界展开 $b_k\circ h=\mu^k+\sum_{j\ge1}s_{kj}\mu^{-j}$：**恰好一个正频率 $\mu^k$，其余全为负频率，且没有零频项**；
4. $s$ 跨过对角线 $\lambda=\mu$ 与两个 $\infty$ 全纯延拓；
5. 系数几何衰减 $|s_{kj}|\le C_\rho\rho^{k+j}$（**双指标同时衰减**）；
6. 在外部乘积领子上**正规收敛**（normal convergence），措辞特意加了 `including subsets meeting either infinity`；
7. $K=1+s+\bar s$ 连续、非负、每个变元边际积分为 1。

#### (b) 证明机制逐步重建（第 207–234 行）

**第一步：$b_k$ 的次数与首项（第 208 行）。** 把 eq:faber 的分母提出 $c\lambda$。用附录的展开 $h(\lambda)=c\lambda+c_0+\sum_{j\ge1}c_j\lambda^{-j}$，则
$$q(\lambda)=\lambda h'(\lambda)=c\lambda-\sum_{j\ge1}j\,c_j\lambda^{-j},\qquad
h(\lambda)-z=c\lambda\Bigl(1+\frac{c_0-z}{c\lambda}+\sum_{j\ge1}\frac{c_j}{c\lambda^{j+1}}\Bigr).$$
于是
$$\frac{q(\lambda)}{h(\lambda)-z}=\Bigl(1-\sum_{j\ge1}\frac{j\,c_j}{c}\lambda^{-j-1}\Bigr)
\sum_{n\ge0}(-1)^n\Bigl(\frac{c_0-z}{c}\lambda^{-1}+\sum_{j\ge1}\frac{c_j}{c}\lambda^{-j-1}\Bigr)^{n}.$$
$\lambda^{-k}$ 的系数只能来自 $n\le k$（每个因子至少贡献 $\lambda^{-1}$），而 $z$ 只出现在 $\frac{c_0-z}{c}\lambda^{-1}$ 这一项里，所以 $z$ 的次数 $\le n\le k$。要拿到 $\lambda^{-k}$ 上的 $z^k$ 必须 $n=k$ 且每次取 $\frac{c_0-z}{c}\lambda^{-1}$，给出 $(-1)^k\bigl(\frac{c_0-z}{c}\bigr)^{k}=(-1)^k\frac{(-1)^k z^k+\dots}{c^k}=\frac{z^k}{c^k}+\text{低次}$。故 $\deg b_k=k$、首项 $c^{-k}z^k$。$k=0$ 时只有 $n=0$ 项，值为 $1$，故 $b_0=1$。

**阅读陷阱（素材必须记录）**：第 208 行的句子是 `The constant coefficient is one.` 直读像"$b_k$ 的常数项是 1"，但那是**错的**（圆盘情形 $h(\lambda)=\lambda$ 给 $b_k(z)=z^k$，$k\ge1$ 的常数项为 0）。它指的是 **$b_0$（$\lambda^0$ 那个系数对应的多项式）等于 1**。展开式里"系数"一词同时指 $\lambda^{-k}$ 的系数与 $z^j$ 的系数，这句话在两个含义之间切换。Lean 侧把这件事写得没有歧义：`faberBasis_zero : faberBasis c g 0 = 1`（`FaberPolynomials.lean` 第 54 行）与 `faberBasis_top_coeff : (faberBasis c g k).coeff k = c⁻¹ ^ k`（第 57–64 行）分成两条。

**第二步： joint extension —— 引入 $H$ 并换成倒数变量（第 210–218 行）。** 定义
$$H(\lambda,\mu)=\frac{h(\lambda)-h(\mu)}{\lambda-\mu}.$$
写 $u=\lambda^{-1},\ v=\mu^{-1}$，并把 $h$ 拆成 $h(\lambda)=c\lambda+g(u)$，其中
$$g(u)=c_0+\sum_{j\ge1}c_ju^j\quad\text{在 }|u|<r^{-1}\text{ 上全纯}.$$
关键代数是
$$\lambda-\mu=\frac1u-\frac1v=\frac{v-u}{uv}=-\frac{u-v}{uv},$$
所以
$$H=\frac{c(\lambda-\mu)+g(u)-g(v)}{\lambda-\mu}=c-\frac{uv\,(g(u)-g(v))}{u-v}.\qquad(\text{eq:H 第 216 行})$$
这一步是整个构造的心脏：**$h$ 的极点在左边，$g$ 的正则性在右边**。论文接下去的三句都是围绕这个式子的**奇点清点**：
1. 整除差 $\frac{g(u)-g(v)}{u-v}$ 联合全纯，对角线值为 $g'(u)$ ⇒ eq:H 这个式子**自动覆盖**"其中一个或两个都是 $\infty$"的情形（第 218 行 `so this formula also covers either or both infinities`）—— 即 $u=0$ 或 $v=0$ 时它仍有意义。这是"$s$ 跨过两个 $\infty$ 延拓"的全部理由。
2. 非对角且离开坐标轴：$H\ne0$ 因为 $h$ **单叶**（$h(\lambda)\ne h(\mu)$ 而 $\lambda\ne\mu$）。
3. 对角线上：$H=c-u^2g'(u)=h'(\lambda)\ne0$（共形映射导数非零）；坐标轴上（$u=0$）：$H=c\ne0$。
合起来：`Thus it has no zeros on the reciprocal bidisk.` —— $H$ 在双盘 $\{|u|,|v|<r^{-1}\}$ 上全纯且无零点。

**第三步：$s=-u\partial_u(H)/H$ 与"严格混合幂"（第 220 行）。** 验证论文那句 `Direct differentiation gives $s=\lambda\partial_\lambda H/H=-u\partial_uH/H$`：
$$\lambda\partial_\lambda\log\bigl(h(\lambda)-h(\mu)\bigr)=\frac{\lambda h'(\lambda)}{h(\lambda)-h(\mu)}=\frac{q(\lambda)}{h(\lambda)-h(\mu)},$$
$$\lambda\partial_\lambda\log(\lambda-\mu)=\frac{\lambda}{\lambda-\mu}.$$
两式相减 ⇒ $\lambda\partial_\lambda\log\frac{h(\lambda)-h(\mu)}{\lambda-\mu}=\frac{q(\lambda)}{h(\lambda)-h(\mu)}-\frac{\lambda}{\lambda-\mu}=s(\lambda,\mu)$，即 $s=\lambda\partial_\lambda H/H$。再由 $u=1/\lambda$：$\lambda\partial_\lambda=-u\partial_u$。$H$ 无零点 ⇒ $s$ 在双盘上全纯。

然后是**最关键的一句话**：`This function is holomorphic and vanishes on both reciprocal axes.` 因为 $s=-u\partial_u(H/H)$ 带一个因子 $u$，故 $u=0$（即 $\lambda=\infty$）时 $s=0$；同理对 $v$。一个在 $(u,v)=(0,0)$ 附近全纯、且在两个坐标轴上都消失的函数，其 Taylor 级数 $\sum a_{kj}u^kv^j$ 满足：$a_{0j}=0$（对 $v$ 轴消失）与 $a_{k0}=0$（对 $u$ 轴消失）。所以
$$s(\lambda,\mu)=\sum_{k\ge1,\,j\ge1}s_{kj}\lambda^{-k}\mu^{-j},$$
**只有严格混合幂**，这正是 eq:s 右端，也正是 eq:boundary-basis 里"只有 $\mu^k$ 一个正频项、其余负频"的来源。这一步是全文我最想强调的机制：**$b_k$ 的 Fourier 结构不是算出来的，是被"轴上消失"这一条拓扑/代数事实决定的。**

**第四步：Cauchy 估计与正规收敛（第 220–227 行）。** 逐句拆：
- `For any $r<\rho<1$, Cauchy estimates on the closed reciprocal bidisk of radius $\rho^{-1}$ give a constant $C_\rho$ with $|s_{kj}|\le C_\rho\rho^{k+j}$.`
  这里的"reciprocal bidisk of radius $\rho^{-1}$"是 $(u,v)$ 坐标里的闭双盘 $\{|u|,|v|\le\rho^{-1}\}$（注意 $\rho^{-1}>1$，而全纯半径是 $r^{-1}>\rho^{-1}$，装得下）。Cauchy：$|s_{kj}|\le\max_{|u|=|v|=\rho^{-1}}|s|\cdot(\rho^{-1})^{-k-j}=C_\rho\rho^{k+j}$。$C_\rho$ 就是这个最大值（可能有绝对值 2 之类的常数倍，论文不追踪）。
- `On a compact subset of the exterior product collar, choose $\sigma>r$ below all finite coordinate moduli, and then $r<\rho<\min(1,\sigma)$.`
  即在紧致集上取所有**有限**坐标模长下确界 $\sigma$；由紧致性与 $\{|λ|>r\}$ 的开性，$\sigma>r$。再取 $\rho\in(r,\min(1,\sigma))$。于是紧致集上 $|u|=1/|\lambda|\le1/\sigma<1/\rho$，严格落在 Cauchy 双盘**内部**，几何双级数
  $$\sum_{k,j\ge1}C_\rho\rho^{k+j}|u|^k|v|^j\le\sum C_\rho(\rho/\sigma)^{k+j}$$
  一致收敛（$\rho<\sigma$）。这就是 `The resulting geometric double series dominates the Laurent series uniformly there`。
- `terms vanish on the reciprocal axes`：紧致集中 $|\lambda|=\infty$ 的点（$u=0$）不需要估计，因为 $k\ge1$ 的所有项自动为 0。这就是为什么要额外补一句 `including subsets meeting either infinity` —— 一般的 Laurent 收敛论证在无穷远点是断的，此处靠"轴上消失"补上。
- 取 $\sigma$ 时把 $\infty$ 排除在"模长"之外是**必须的**：$\infty$ 没有模长，若紧致集含 $\infty$，下确界只能对有限点取；而 $u=0$ 处项数直接为 0，两者配合才覆盖所有情形。

**第五步：从 $s$ 到 eq:boundary-basis（第 227 行末）。** 在 eq:faber 里代 $z=h(\mu)$：
$$\frac{q(\lambda)}{h(\lambda)-h(\mu)}=\sum_{k\ge0}b_k(h(\mu))\lambda^{-k}\qquad(|\lambda|>|\mu|).$$
又 $\frac{\lambda}{\lambda-\mu}=\sum_{k\ge0}\mu^k\lambda^{-k}$。两式相减并按 $\lambda^{-k}$ 比较系数：
$$b_k(h(\mu))-\mu^k=\sum_{j\ge1}s_{kj}\mu^{-j}.$$
论文加了两个限定，都很实在：`first for fixed finite $\mu$ in the exterior collar` —— 先固定**有限**的 $\mu$（保证几何展开 $|\lambda|>|\mu|$ 合法、且 $\mu$ 在领子内使 $h(\mu)$ 有意义），比较出的等式再靠两边在领子上的全纯性作为 $\mu$ 的恒等式成立（`which holds throughout the exterior collar`，第 236 行回指）。$k=0$ 时 $b_0(h(\mu))-1=0$，与 $s$ 无 $k=0$ 项自洽。

**第六步：正性与归一化（第 229–233 行）。**
- 圆盘上的恒等式：对 $\lambda,\mu\in\T$、$\lambda\ne\mu$，`$2\Re(\lambda/(\lambda-\mu))=1$`。验算：$\overline{\lambda/(\lambda-\mu)}=\bar\lambda/(\bar\lambda-\bar\mu)=\lambda^{-1}/(\lambda^{-1}-\mu^{-1})=\mu/(\mu-\\lambda)$，两式相加 $=(\lambda-\mu)/(\lambda-\mu)=1$。
- 于是 $K=1+s+\bar s=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)}-\underbrace{2\Re\frac{\lambda}{\lambda-\mu}}_{=1}+1=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)}$。
- 符号：$\frac{q(\lambda)}{h(\lambda)-h(\mu)}=\frac{q(\lambda)\overline{(h(\lambda)-h(\mu))}}{|h(\lambda)-h(\mu)|^2}=\frac{\bar{}\,\overline{q(\lambda)}(h(\lambda)-h(\mu))}{|h(\lambda)-h(\mu)|^2}$，取实部不改变值，再由 eq:support（$z=h(\mu)\in\partial\Omega\subset\overline\Omega$）得 $\ge0$。**这里用到凸性的唯一一次、也是最本质的一次。**
- 对角线：`Continuity gives the same sign on the diagonal.` 因为 $s$ 跨过 $\lambda=\mu$ 全纯、$K$ 连续，非负集的极限仍非负。（原始表达式 $2\Re\frac{q}{h(\lambda)-h(\mu)}$ 在对角线上是 $\infty/\infty$ 型，延拓后才是有限值 —— 这正是"跨过对角线延拓"这条结论的用途。）
- 边际：`Every term of $s$ and of its conjugate has nonzero frequency in each variable. Their integrals in either variable vanish, proving both normalizations.` 即 $\int_\T\lambda^{-k}d\tau(\lambda)=0$（$k\ge1$）与 $\int_\T\lambda^{+k}d\tau(\lambda)=0$，所以 $\int_\T s(\lambda,\mu)d\tau(\lambda)=0$、$\int_\T s(\lambda,\mu)d\tau(\mu)=0$，从而 $\int_\T K\,d\tau(\lambda)=\int_\T 1\,d\tau=1$，另一变元同理。

**注意 $K$ 不对称**：$K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}$，而 $s$ 的两个变元角色不同（第一个变元带 $q(\lambda)$ 与 $\lambda/(\lambda-\mu)$）。一般 $s(\lambda,\mu)\ne s(\mu,\lambda)$，所以 $K$ 不是对称核。论文在第 283–285 行专门强调：
```tex
$s_{kj}=\beta_{jk}$ in that paper's notation. In particular,
\eqref{eq:kernel-fourier-action} uses this coefficient orientation and
does not require symmetry of the kernel.
```
这句"不需要对称性"是一处**防错声明**：读者（或 companion 论文的作者）很容易顺手假设核对称从而把 $s_{kj}$ 与 $\beta_{jk}$ 混用。

#### (c) 每个常数/假设的机械理由

| 对象 | 出现位置 | 机械理由 | 放宽后崩在哪 |
| --- | --- | --- | --- |
| $b_0=1$ | eq:faber $k=0$ | $q\sim c\lambda$、$h-z\sim c\lambda$ | 若 $b_0\ne1$（例如把 $q$ 换成 $\kappa q$），第 339 行 `eq:means` 的 $P_0=X^*X$ 变成 $\kappa X^*X$，$a^2$ 与各边界范数的**比例尺**全部错位，最后 $\gamma\le2$ 会带上 $\kappa$ |
| $\deg b_k=k$，首项 $c^{-k}$ | 第 208 行 | 提出 $c\lambda$ 后，$\lambda^{-k}$ 系数最多含 $z^k$，$n=k$ 时正好取满 | 若 $h$ 在 $\infty$ 是 $\nu$ 阶极点（$\nu>1$），$\deg b_k\approx k/\nu$：**同一个指标 $k$ 不再同时代表"多项式次数 / Laurent 阶 / 边界频率"**。第 367–371 行 `Write the full finite Faber expansions as $FG=\sum_kb_kU_k$` 的有限性、以及 $U_k$ 只在 $k\le\deg F+\deg G$ 出现这件事都要重写；$1,\frac12$ 权重配平被破坏。[分析] |
| $c\ne0$（等价于单极点） | eq:h | $c^{-k}$ 有定义；$H\vert_{u=0}=c\ne0$ | $c=0$  ⇒ $H$ 在坐标轴上为零 ⇒ $s=-u\partial_uH/H$ 有极点 ⇒ 领子内不再全纯 ⇒ 无几何衰减 ⇒ `prop:coefficients` 的交换次序失效（第 267 行的授权句） |
|  几何衰减 $\rho^{k+j}$（双指标） | 第 196–197、220 行 | Cauchy 估计在 $(u,v)$-双盘半径 $\rho^{-1}$ | 只有单指标衰减（$\|s_{kj}\|\le C\rho^k$）时，$\sum_j$ 方向不收敛，$\sum_{j\ge1}\HS{\sum_ks_{kj}C_k}^2$ 可能 $=\infty$，$T$ 不是 $L^2\to L^2$ 算子  |
| 正规收敛（含无穷远） | 第 198–200 行 | "$\sigma$ 取有限模长下界 + 轴上项为 0" | 只在 $\T^2$ 上绝对一致收敛也够 `prop:coefficients`，但 $b_k\circ h$ 的恒等式（第 236 行说 `which holds throughout the exterior collar`）需要整个领子；`lem:resolvent` 里选 $r_A\in(r,1)$ 也需要在领子里展开 |
| $0<r<\rho<1$ 的存在 | 第 196 行 | $r<1$ 来自 `lem:exterior-collar` 的 $R_0>1$ | $r=1$ 无 $\rho$ 可取；这就是附录要**多花力气证明 $R_0>1$** 的唯一理由（对常数 2 无影响，但它是整条链的存在性闸门） |
| 凸性（用一次） | eq:support ⇒ $K\ge0$ | 支撑半平面 | $\Omega$ 非凸 ⇒ $K$ 变号 ⇒ Jensen 型压缩不成 ⇒ `prop:coefficients` 的双边不等式两端都失效。注意：`Beckermann–Crouzeix 2014`（参考文献）标题就是 *Faber polynomials of matrices for **non-convex** sets*，说明"凸"在这里不是装饰 |
|  $K\ge0$ 与两个边际 = 1 | 第 200–204 行 | 上面第五、六步 | 若只有 $\int K=1$ 而 $K$ 不变号：$T$ 不是正算子，第 260 行的 Jensen 步 $\|(Tu)(\mu)\|^2\le\int K\|u\|^2$ 不成立（需要 $K\ge0$ **且** 边际=1 两个条件同时成立）。若 $K\ge0$ 但边际 $=\kappa\ne1$：$\|T\|\le\kappa$，`prop:coefficients` 右端权重从 2 变成 $1+\kappa^2$，最后 $\gamma\le2$ 变 $\gamma\le\sqrt{1+\kappa^2}\cdot$…（见 2.5(c) 的敏感度表）  |
| $s$ 无零频项 | 第 233 行 | "轴上消失 ⇒ 严格混合幂" | 若 $s$ 含 $\lambda^0\mu^{-j}$ 项，则 $G\circ h$ 的常数项不再只是 $C_0$，而是 $C_0+(\text{来自 }s\text{ 的贡献})$，三块 Fourier 支撑不再"干净地"分成 $C_0/u/Tu$，Parseval 分解要加交叉项，$\pm 2$ 权重失去解释 |
| $q(\lambda)$ 取**外**法向的符号 | eq:support | $K\ge0$ | 反向 ⇒ $K\le0$ ⇒ 整条链的符号翻转，正块比较给出的是反向不等式，$\gamma\le2$ 变 $\gamma\ge2$ |

#### (d) 候选失败路线 [推测]

1. [推测] **为什么不用现成的 Grunsky 不等式（Bieberbach–Grunsky / de Branges 路线）直接给 $\sum s_{kj}$ 的算子范数？** 经典 Grunsky 型系数不等式是**带权**的：它控制 $\sum_{j,k}jk|s_{jk}|^2x_j\bar x_k$ 这类量（论文第 238–241 行承认这个出处：`The classical normalization gives a weighted coefficient inequality \cite[equations~(1.1)--(1.3)]{BeckermannStylianopoulos2018}`）。带权的不等式代入 `prop:coefficients` 会得到 $T$ 的**加权** $L^2$ 压缩，权 $\{k\}$ 与 $\{j\}$ 会乘进系数范数；而 `thm:domain` 需要的正是"$P_k$ 的权重恰好是 $1,\frac12,\frac12,\dots$"这种**无权的、常数级的**权重表。一旦权带上 $k$，第 395–397 行的 `eq:weighted-dual` 与第 419–421 行的 `eq:diagonal-L2` 就不再是同一个量的两侧，配平失败。论文用"凸性 + 两个边际恒等式"绕开权重的做法，是这条路线的**替代**而非简化。
2. [推测] **为什么不走 spectral calculus（谱定理/谱测度）？** 第 42–46 行论文已经点了动机：`For a normal matrix, the spectral theorem controls polynomial evaluation by values on the spectrum. For a nonnormal matrix, the spectrum alone cannot provide the same control: even a nonzero nilpotent matrix has spectrum $\{0\}$.` 即谱路线在幂零矩阵上**信息量为零**（$\|P[A]\|$ 可以任意大而 $\sigma(A)=\{0\}$）。谱包络的替代品是 $H^\infty$ 演算 + 相似变换（`Badea–Crouzeix–Delyon` 走的路），但那要构造 $S$；本文要"直接"，于是把谱定理换成**边界 Fourier 分析**（$L^2(\T;M_m)$ 上的 Parseval 扮演谱定理的角色，$b_k$ 扮演幂函数 $z^k$ 的角色）。
3. [推测] **为什么不用 Pick/Schur 插值？** 本文需要的是"把正频部分映射到负频部分"的一个**压缩**，这在结构上就是 Schur 类算子；但走 Schur/Nevalinna–Pick 路线需要 $A$（压缩）与系数代数之间的交换子提升（commutant lifting），而交换子提升在矩阵值情形要求被提升的映射是**完全压缩**（complete contraction），正是要证明的结论，会循环。论文用 $K\ge0$ + Jensen 现场证明一个具体的 $L^2$ 压缩，把提升问题消解成一次迹不等式。
4. [推测] **为什么不在 $|\lambda|=1$ 上用留数定理直接算 $\int\|G\circ h\|^2$？** 那是 Crouzeix–Palencia 型做法（Cauchy 变换 + 双层位势的算子范数），会得到 $1+\sqrt2$ 量级的常数，因为它估计的是**积分算子的范数**而不是**系数的 $\ell^2$ 恒等式**。本文的 $K$ 核虽然形式上是同一个双层核，但用法完全不同：只使用它的**符号**与**边际**，从不估计它的范数。

### 2.3 命题 `prop:coefficients`：系数范数估计

#### (a) 精确陈述（`main.tex` 第 246–253 行照抄）

```tex
\begin{proposition}[The coefficient norm estimate]\label{prop:coefficients}
For every positive integer $m$ and every $M_m(\C)$-valued polynomial $G(z)=\sum_{k=0}^N b_k(z)C_k$,
\begin{equation}\label{eq:coefficient-estimate}
 \sum_{k=0}^N\HS{C_k}^2
 \le\int_\T\HS{G(h(\mu))}^2\,d\tau(\mu)
 \le\HS{C_0}^2+2\sum_{k=1}^N\HS{C_k}^2.
\end{equation}
\end{proposition}
```

量化顺序要点：`For every positive integer $m$` 在**最前面**，而 $N$ 与系数 $C_k$ 在多项式里给定；$\Omega,h$ 是本节的全局假设（隐含量化）。这条命题里**没有 $A$**，纯粹是边界 Fourier 分析。

三处容易被略过的写法细节：
- 左端求和 $\sum_{k=0}^N$ 权全 1；右端 $\HS{C_0}^2+2\sum_{k=1}^N$ —— **常数项权重 1，非常数项权重 2**。这个 $1,2,2,\dots$ 的表与后面 `eq:weighted-dual` 的 $1,\tfrac12,\tfrac12,\dots$ 是**倒数关系**，是全文最重要的一组对偶权重。
- $G$ 用 Faber 基 $\{b_k\}$ 展开，而不是用幂基 $\{z^k\}$。这是把 $h$ 的几何吸收进基函数的位置。
- 右端是 $\int_\T\HS{G(h(\mu))}^2d\tau(\mu)$ —— 边界上 HS 范数平方对**归一化**测度积分，所以圆盘情形它恰好等于 $\sum_k\HS{C_k}^2$（见 (c)）。

#### (b) 证明机制逐步重建（第 254–278 行）

**第一步：定义算子 $T$。**
```tex
For $u\in L^2(\T;\mathcal H)$ with values in a Hilbert space $\mathcal H$, define
\[
 (Tu)(\mu)=\int_\T K(\lambda,\mu)u(\lambda)\,d\tau(\lambda).
\]
```
注意 $\mathcal H$ 是**任意** Hilbert 空间。论文在这里把 $\mathcal H$ 取成 $M_m(\C)$ 配 HS 内积（第 180 行的 `which makes each finite-dimensional matrix space a Hilbert space` 就是为这句话准备的）。$K$ 是**标量**核，所以 $T$ 是"标量积分算子 $\otimes\,\mathrm{id}_{\mathcal H}$"。

**第二步：Jensen 型一步 + 两次边际。**
```tex
Positivity and the normalization in $\lambda$ imply
$\|(Tu)(\mu)\|^2\le\int K(\lambda,\mu)\|u(\lambda)\|^2d\tau(\lambda)$.
Integrating in $\mu$ and using the normalization in that variable shows that $T$ is an $L^2$ contraction.
```
展开写：固定 $\mu$，由 $K(\cdot,\mu)\ge0$ 与 $\int K(\lambda,\mu)d\tau(\lambda)=1$，$d\nu_\mu(\lambda):=K(\lambda,\mu)d\tau(\lambda)$ 是概率测度，于是 Bochner 积分的范数凸性（Jensen）给
$$\Bigl\|\int u\,d\nu_\mu\Bigr\|^2\le\int\|u\|^2\,d\nu_\mu.$$
再对 $\mu$ 积分并用 Fubini 与**另一个**边际 $\int K(\lambda,\mu)d\tau(\mu)=1$：
$$\|Tu\|_{L^2}^2\le\int_\T\!\!\int_\T K(\lambda,\mu)\|u(\lambda)\|^2d\tau(\lambda)d\tau(\mu)=\int_\T\|u(\lambda)\|^2d\tau(\lambda)=\|u\|_{L^2}^2.$$
**机械清点**：`lem:faber` 结论里的三个事实，这里各用一次且只各用一次 —— $K\ge0$（Jensen 的测度非负）、$\lambda$-边际（Jensen 的概率归一）、$\mu$-边际（Fubini 后收掉 $\int d\tau(\mu)$）。少任何一个，$\|T\|\le1$ 都不成立。$K$ 连续（$s$ 在 $\T^2$ 绝对一致收敛）保证积分与 Fubini 无技术障碍。

**第三步：$T$ 在正频多项式上的作用（第 263–266 行）。** 取 $u(\lambda)=\sum_{k=1}^N C_k\lambda^k$。逐项算 $\int K\lambda^k$：
- $1\cdot\lambda^k$：$\int_\T\lambda^k d\tau=0$（$k\ge1$）。
- $s(\lambda,\mu)\lambda^k=\sum_{a,b\ge1}s_{ab}\lambda^{k-a}\mu^{-b}$：只有 $a=k$ 项零频非零，$\int\lambda^{k-a}d\tau=[a=k]$，贡献 $\sum_{b\ge1}s_{kb}\mu^{-b}$。
- $\overline{s(\lambda,\mu)}\lambda^k=\sum_{a,b\ge1}\bar s_{ab}\lambda^{k+a}\mu^{b}$：$k\ge1,a\ge1$ ⇒ 全是正频 ⇒ 积分为 0。

合起来就是 eq:kernel-fourier-action：
$$(Tu)(\mu)=\sum_{j\ge1}\Bigl(\sum_{k=1}^Ns_{kj}C_k\Bigr)\mu^{-j}.$$
**这条计算是"系数取向"的定义处**：$s$ 的**第一个指标** $k$ 吃掉 $u$ 的正频，**第二个指标** $j$ 输出 $Tu$ 的负频。所以第 264–266 行的式子是"$s$ 作为从正频到负频的映射"的矩阵元写法。论文第 283–285 行特意为这一点作辩护（见 (c) 最后一行）。
授权句 `All interchanges are justified by the absolute uniform convergence in Theorem~\ref{lem:faber}`（第 267 行）：把 $\int\sum_{a,b}$ 换成 $\sum_{a,b}\int$ 需要 $\T^2$ 上绝对一致收敛 —— 这正是 `lem:faber` 里那句 `In particular it converges absolutely and uniformly on $\T^2$` 的唯一用途。
推出（第 268–270 行）：
$$\sum_{j\ge1}\HS{\sum_{k=1}^Ns_{kj}C_k}^2=\|Tu\|_{L^2}^2\le\|u\|_{L^2}^2=\sum_{k=1}^N\HS{C_k}^2.$$
（左式用到 Parseval 在 $M_m$-值 $L^2$ 上成立；$Tu$ 的 Fourier 系数在 $j\ge1$ 处是 $\sum_ks_{kj}C_k$，其余为 0。）

**第四步：三段 Fourier 支撑不交 + Parseval（第 271–277 行）。** 由 eq:boundary-basis，
$$G(h(\mu))=\sum_{k=0}^Nb_k(h(\mu))C_k=C_0+\underbrace{\sum_{k=1}^N\mu^kC_k}_{=u(\mu)}+\underbrace{\sum_{j\ge1}\bigl(\sum_ks_{kj}C_k\bigr)\mu^{-j}}_{=(Tu)(\mu)}.$$
三块的频撑分别是 $\{0\}$、$\{1,\dots,N\}$、$\{-1,-2,\dots\}$，两两不交，所以 Parseval **没有交叉项**：
$$\int_\T\HS{G\circ h}^2d\tau=\HS{C_0}^2+\sum_{k=1}^N\HS{C_k}^2+\sum_{j\ge1}\HS{\sum_ks_{kj}C_k}^2.$$
左不等式：扔掉最后非负一项。右不等式：用第三步的 $\le\sum_{k\ge1}\HS{C_k}^2$，于是 $\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2$。$\blacksquare$

**这一证法里"$G$ 是多项式"的作用**：$u$ 只有有限个正频，所以 $\sum_{k=1}^N$ 是有限和，$Tu$ 的 $\ell^2$ 范数计算里不需要任何收敛性预备工作（除了 $j\to\infty$ 一侧，由 $|s_{kj}|\le C_\rho\rho^{k+j}$ 保证）。若 $G$ 是无穷级数就要额外论证 $\sum_k$ 与 $\sum_j$ 的交换；论文选择**只做多项式**，这也呼应第 124 行 `estimates one polynomial at a time`。

#### (c) 常数与假设的机械理由

| 对象 | 位置 | 作用 | 放宽/改动后的崩点 |
| --- | --- | --- | --- |
|  **权重 2**（非常数项） | 第 251 行右端 | $2=1+1$：一份来自 $u$ 自身，一份来自 $Tu$（$\|T\|\le1$） | 若 $\|T\|\le\kappa$（例如边际归一化被改成 $\int K=\kappa$），右端变 $\HS{C_0}^2+(1+\kappa^2)\sum_{k\ge1}\HS{C_k}^2$。回代到 `thm:domain` 的 `eq:weighted-dual` 会给对角块权重 $\frac{1}{1+\kappa^2}$ 之类，最终 $\gamma^2\le 4/(1+\kappa^2)\cdot$…；**关键是配平被打破**，$\gamma\le2$ 变成 $\gamma\le$（某个依赖 $\kappa$ 的数）。当 $\kappa=1$ 才正好回到 2。[分析]  |
| **权重 1**（常数项 $C_0$） | 同上 | 常数项不产生负频，不被 $T$ 复制 | 若常数项也带权 2，`eq:weighted-dual` 的对角权重就变 $\frac12,\frac12,\dots$，而 `eq:cross-L2` 的交叉权重仍是 $1,1,\dots$（$M_0$ 权重 1），配平后给出**更松**的界；反之若 $C_0$ 权重 0 则不等式假（圆盘上 $G\equiv C_0$ 时 $\int\HS{G}^2=\HS{C_0}^2>0$）。 |
|  $K\ge0$ | 第 260 行 | Jensen | 变号 ⇒ $\|T\|\le1$ 失效（符号核的 $L^2$ 范数可远大于 1）⇒ 右不等式失效。左不等式**不依赖** $K\ge0$（它只是 Parseval 丢项），见下一行  |
|  两个边际 $=1$ | 第 260、261 行 | 各用一次（Jensen / Fubini） | 只证一个边际 ⇒ $T$ 只在一侧受控，$\|T\|_{L^2\to L^2}$ 未知  |
| **未归一化** HS 范数 | 第 180 行 + Parseval | 让 Parseval 是**等号**、让 `eq:pairing` 的双线性配对与内积一致 | 若用归一化 HS（$\frac1{\sqrt m}\HS{\cdot}$），$m$ 会从 Parseval 冒出来 ⇒ "对 $m$ 一致"被破坏。第 180 行那句强调不是装饰 |
|  $d\tau$ 归一化（$dt/2\pi$） | 第 178 行 | $\int1\,d\tau=1$ ⇒ 边际"$=1$"的写法成立 | 用 $dt$ 则边际变 $2\pi$，$\int K=2\pi$，$\|T\|\le2\pi$ 之类，权重 2 会被 $2\pi$ 污染  |
| $m$ 是**正整数**（$m\ge1$） | 第 247 行 | 与 Lean 里 `0 < m` 假设对应（`Model.lean` 的 `UniversalBound` 要求 `0 < n → 0 < m`） | $m=0$ 时 $M_0(\C)$ 是零环，所有范数为 0，命题平凡但会把 `sharpnessCoefficients : Fin 2 → Matrix (Fin 1) (Fin 1) ℂ` 之类的构造逼成特例。Lean 用类型 `Fin m` + `0<m` 显式排除 |
| "$G$ 是**多项式**" | 第 247 行 | 有限正频 ⇒ 有限和；$\deg G=\deg F+\deg G$ 在 `thm:domain` 里保证 $FG$ 的 Faber 展开有限 | 换成 $G$ 全纯（无穷 Faber 级数）需要额外的收敛/闭性论证；论文不需要，因为它只处理多项式 |
|  左不等式的独立价值 | 第 249–250 行 | 在 `thm:domain` 里被用来把 $\sum\HS{U_k}^2$ 换成 $\|FG\|_\partial^2$（**上界方向**的估计用在 $FG$ 上） | 若只有右不等式，$\sum_k\HS{U_k}^2$ 无法用边界范数控制，`eq:diagonal-functional` 出不来  |
|  不对称核的取向声明 | 第 279–285 行原文 | `In particular, \eqref{eq:kernel-fourier-action} uses this coefficient orientation and does not require symmetry of the kernel.` | 若误用 $s_{jk}$，$T$ 变成另一个算子（转置），$\|T\|\le1$ 仍可能成立（因为对偶算子同范数），但**与 $b_k\circ h$ 的展开不再匹配**，Parseval 分解出的负频系数不是 $Tu$，第三步的等式失效。这段"对照 companion 记号"的文字存在的理由就是防这个错  |

**圆盘基例（用来校准这条命题的形状）**：$\Omega=\D$，$h(\lambda)=\lambda$（$c=1$，$g\equiv0$）。则 $q(\lambda)=\lambda$，$s(\lambda,\mu)=\frac{\lambda}{\lambda-\mu}-\frac{\lambda}{\lambda-\mu}=0$，$K\equiv1$，$T=0$，$b_k(z)=z^k$。命题退化为
$$\sum_{k=0}^N\HS{C_k}^2=\int_\T\HS{G(\mu)}^2d\tau(\mu),$$
即经典的 Hardy 空间 $H^2$ 等距，**上下界重合，权重 2 完全没有被用到**。所以 $1+\sqrt2\to2$ 的改进、以及"2 是否最优"这件事，都不发生在这条命题里，而在 `thm:domain` 里"交叉块保权 1、对角块保权 1/2"的比对里。这一条对第五节的敏感度表很关键：**`prop:coefficients` 的常数 2 在圆盘上是松弛的，却仍是全文最终常数 2 的唯一来源** —— 说明这个 2 是"结构余量"而不是"解析损失"。

#### (d) 候选失败路线 [推测]

1. [推测] **为什么不用 $L^\infty$（最大值）而用 $L^2$？** 双边的系数–边界比较只有在 $L^2$（Hilbert/Parseval）里才能同时拿到上界与下界；$L^\infty$ 侧只能给上界，且 Hardy 空间 $H^\infty$ 的系数估计（例如 Cauchy 估计 $|C_k|\le\|G\|_\infty$）会带 $k$ 依赖或丢失正交性，最后第 442–444 行的**迹**不等式无从谈起（迹需要 Hilbert–Schmidt 结构）。Crouzeix–Palencia 走的正是"$L^\infty$ 边界数据 → 奇异积分算子在 $L^2$ 上的范数"这条混合路线，代价是 $1+\sqrt2$。
2. [推测] **为什么不用 Bergman 空间（面积分）而用边界积分？** 第 238–241 行点名的 `Beckermann–Stylianopoulos 2018` 是 *Bergman Orthogonal Polynomials and the Grunsky Matrix*，说明 Bergman 路线在文献里是现成的。用面积分的话，权 $2$ 会被 Bergman 核的对角行为替换，且 `lem:resolvent` 里 $R(\lambda)=\sum b_k(A)\lambda^{-k}$ 的"边界 = 圆周"身份会变成面积域，$P,Q,M,L$ 的边界 $L^2$ 范数不再有 Parseval 分解（Fourier 支撑不交这一核心优势消失）。[分析：这是我认为最可能的"被绕开的自然做法"。]
3. [推测] **为什么不直接对 $T$ 取伴随来同时得左右不等式？** 论文的左右不等式不是对偶关系（右端是 $\|T\|\le1$ 的推论，左端是 Parseval 的丢项），所以没必要引入 $T^*$；反而若引入 $T^*$，会需要 $K$ 的共轭对称性，把第 285 行那句"不需要对称"变成额外假设。
4. [推测] **为什么不改进 $K$（例如乘一个正权函数使 $\|T\|$ 严格小于 1，从而得到 $<2$ 的常数）？** 因为 2 是最优的，$\|T\|$ 严格小于 1 只能在**特定**域（如圆盘：$T=0$）成立；一般凸域上若 $\|T\|\le\kappa<1$，配平给出 $\gamma\le\sqrt{1+\kappa^2}\cdot(\dots)<2$，会与 $2\times2$ 幂零矩阵的最优性矛盾。也就是说，$\sup_\Omega\|T\|=1$ 是**必然**的（否则定理的常数可降）。这个反向推理论文未述，是本素材的 [推测]：`prop:coefficients` 的 2 一旦能被全域一致改进，主定理的 2 就能改进，故 2 的最优性把 $T$ 的范数上确界钉在 1。

### 2.4 定理 `lem:resolvent`：预解式展开与双层位正性

#### (a) 精确陈述（`main.tex` 第 295–308 行照抄）

```tex
\begin{theorem}[The resolvent expansion and double-layer positivity]\label{lem:resolvent}
Let $\Omega,h,q$, and $(b_k)$ satisfy the hypotheses and conclusions of Theorem~\ref{lem:faber}. For any positive integer $n$ and $A\in M_n(\C)$ with $W(A)\subset\Omega$, on $\T$ let
\begin{equation}\label{eq:R}
 R(\lambda)=q(\lambda)(h(\lambda)I-A)^{-1}.
\end{equation}
Then
\[
 R(\lambda)=\sum_{k\ge0}b_k(A)\lambda^{-k},\qquad R(\lambda)+R(\lambda)^*\succeq0.
\]
For the fixed $A,h$, there are constants $C<\infty$ and $0<\theta<1$
such that $\|b_k(A)\|\le C\theta^k$ for all $k\ge0$. Thus the series
converges absolutely and uniformly on $\T$. In particular,
$\int_\T R\,d\tau=I$ and $\int_\T(R+R^*)\,d\tau=2I$.
\end{theorem}
```

假设的传递方式值得记：`satisfy the hypotheses and conclusions of Theorem~\ref{lem:faber}` —— 不是 "satisfy the hypotheses"，而是**假设与结论都要**。也就是说 $b_k$ 的多项式性、eq:boundary-basis、几何衰减等都被当作已知量搬过来用。这是"升格为定理"的第二个理由（见 1.2）：它需要被独立引用一整套结论。

注意 $C,\theta$ 的量词：`For the fixed $A,h$, there are constants $C<\infty$ and $0<\theta<1$` —— $C,\theta$ **依赖 $A$ 和 $h$**，不是一致常数。这对后面没有影响（只用平方可和性），但素材要记：本文**没有**任何"对一切 $A$ 一致"的预解式界，那正是 Crouzeix–Palencia 路线要的那种估计。

#### (b) 证明机制逐步重建（第 291–321 行，含 §3 开头的动机段）

**§3 开头的定位（第 291–293 行原文）：**
```tex
This Hermitian field is the numerical-range double-layer kernel of
\cite{DelyonDelyon1999,CrouzeixPalencia2017}; we prove the
required positivity for the original matrix $A$.
```
（tex 第 292 行原文是 `we prove the required positivity` —— "required" 这个措辞说明作者意识到该正性在文献里已知，本文只是**自证一遍**，且强调"for the original matrix $A$"。）

**第一步：预解式有定义。** `Every eigenvalue of $A$ belongs to $W(A)$, by testing a unit eigenvector.` 于是 $h(\lambda)I-A$ 在 $|\lambda|\ge1$ 可逆（$h(\T)=\partial\Omega$，$h(|\lambda|>1)\subset\C\setminus\overline\Omega$，都不碰 $W(A)\subset\Omega$）。

更细的一步（论文压缩成半句、这里必须补全）：$W(A)$ 紧、$\Omega$ 开、$W(A)\subset\Omega$ ⇒ $\dist(W(A),\C\setminus\Omega)>0$。$h$ 在 $\T$ 上一致连续且 $h(\T)=\partial\Omega$，故存在 $r<r_A<1$ 使 $\{|\lambda|>r_A\}$ 中 $|\lambda|<1$ 那部分被 $h$ 送进 $\{z:\dist(z,\partial\Omega)<\varepsilon\}\subset\Omega\setminus W(A)$（只要 $\varepsilon<\dist(W(A),\partial\Omega)$）。这就是原文
```tex
Compactness of the circle and strict spectral separation allow a smaller collar $|\lambda|>r_A$, with $r<r_A<1$, on which it remains holomorphic, including infinity where $R(\infty)=I$.
```
的全部内容。这里还用到 `lem:exterior-collar` 给的"单叶领子"：$|\lambda|<1$ 侧的像落在 $\Omega$ 内部（单叶性排除它跑到 $h(\{|\mu|\ge1\})\supset\partial\Omega$ 的像里）。

- $R(\infty)=I$ 的计算：$q(\lambda)=c\lambda+O(\lambda^{-1})$、$h(\lambda)I-A=c\lambda I+O(1)$，故 $R(\lambda)\to(c\lambda)(c\lambda I)^{-1}=I$。**"including infinity" 是必需的**，否则 $\infty$ 处 Laurent 展开的零频项没有依据。

**第二步：展开系数是 $b_k(A)$。** 论文给了**两条并列**的合法化路径（第 310 行）：
```tex
this follows either by the geometric resolvent series for large $|h(\lambda)|$ or by substituting $A$ into the polynomial coefficient identities in \eqref{eq:faber}.
```
- 路径 A（几何级数）：$|h(\lambda)|$ 大时 $\|A/h(\lambda)\|<1$，
  $$\frac{q(\lambda)}{h(\lambda)}\Bigl(I-\frac{A}{h(\lambda)}\Bigr)^{-1}=\sum_{m\ge0}A^mh(\lambda)^{-m-1}q(\lambda),$$
  再把每个 $q(\lambda)/(h(\lambda)-z)^{m+1}$ 用 eq:faber 型的 $\lambda$-展开插回（需要 $\partial_z^m$ 后的展开式，属于同一套系数恒等式）。这条路要控制二重级数在领子里的收敛。
- 路径 B（代数量恒等式）：eq:faber 是"关于 $z$ 的多项式、系数是 $\lambda$ 的 Laurent 级数"的恒等式；把 $z\mapsto A$ 通过代数同态代入，对每个固定的截断次数是**有限**运算，剩下只需验证代入后级数仍收敛到预解式。
- 素材判断：这两条在严格性上不对等（B 需补收敛论证，A 需二重级数控制），论文用 "either … or" 而不选定一条，说明作者**两处都能过**、但没把细节写死。**Lean 里必然只能实现一条** —— 见第四节对 `FaberCalculus.lean` / `FaberEnergy.lean` / `KernelContraction.lean` 分工的取证。

**第三步：几何衰减 ⇒ $\ell^2$。** `Choose $r_A<\theta<1$. Cauchy estimates on the reciprocal circle of radius $\theta^{-1}$ give the stated geometric bound.` 换成 $u=1/\lambda$ 后 $R$ 在 $|u|<r_A^{-1}$ 全纯，在闭盘 $|u|\le\theta^{-1}<r_A^{-1}$ 上有界 $M_\theta$，故
$$\|b_k(A)\|\le M_\theta\,(\theta^{-1})^{-k}=C\theta^k.$$
$\theta^k$ 可和 ⇒ 在 $\T$ 上绝对一致收敛 ⇒ 可逐项取 Fourier 系数、可逐项做 $X^*RX$ 型压缩。第 337 行
```tex
By Theorem~\ref{lem:resolvent}, all four series converge absolutely and uniformly on $\T$, and their coefficient sequences are square summable.
```
就是在这里兑现：**$a^2=\sum_{k\ge0}\HS{M_k}^2<\infty$ 的全部依据是这条 $\theta^k$**。
- 一个必须记住的细节：$\|b_k(A)\|\le C\theta^k$ 是**算子范数**界，而 $a^2$ 要的是 **HS 平方和**。有限维里 $\HS{Y^*b_k(A)X}\le\sqrt m\,\|b_k(A)\|$ 会引入 $\sqrt m$；但论文（正确地）不需要这个：$\HS{M_k}\le\HS{Y^*}\|b_k(A)\|_{\mathrm{HS}}\HS{X}$ 之类都会带 $m$，而 $m$ 无关性的做法是——每个 $k$ 的 $M_k$ 是固定的 $n\times m$ 矩阵，$\sum_k\HS{M_k}^2\le\sum_k\|b_k(A)\|_{\mathrm{op}}^2\HS{}\ldots$。真正保住 $m$ 一致的是：$b_k(A)$ 只作用在 $\C^n$ 上（**底空间**），其算子范数几何衰减与 $m$ 无关，而 $X,Y$ 的 HS 范数进入 $a$ 的方式与进入其他三个块的方式相同，最终全部约掉。[分析：素材在此标 [推测] 不成立——这不是推测，是齐次性论证；但它**论文未述**，值得在笔记里点出来。]

**第四步：零频与两个积分。** $b_0=1$ ⇒ $R$ 的 $\lambda^0$ 系数是 $b_0(A)=I$，即 $\int_\T R\,d\tau=I$，取伴随相加得 $\int_\T(R+R^*)d\tau=2I$。**用途**在第 412–413 行 `In the diagonal fields, \eqref{eq:means} makes the constant term twice $P_0$ or $Q_0$.` 与第 425 行 `For the cross field, $L_0^*=M_0$ makes the constant term $2M_0$.` 也就是说 **2 第一次出现在"对角块与交叉块的零频都是 $2\times$"这一点上**（2.5 第 (8) 步）。$\int(R+R^*)=2I$ 是这两条的母陈述，本身在正文里没有独立引用 —— 素材记录：这是一处**冗余输出**（作者把它写出来是为了让读者预先看到 $2I$，实际用的是逐频版本）。

**第五步：正性（第 315–320 行）。** 令 $B=h(\lambda)I-A$，直接合同计算：
$$B^*(R+R^*)B=B^*\bigl(qB^{-1}+\bar q(B^*)^{-1}\bigr)B=qB^*+\bar qB.$$
（论文原文写作 `\overline{q(\lambda)}B+q(\lambda)B^*`，同一式子。）逐向量取二次型（$\|v\|=1$）：
$$v^*(qB^*+\bar qB)v=\bar q\,(Bv,v)+q\,\overline{(Bv,v)}=2\Re\bigl(\overline{q(\lambda)}(h(\lambda)-v^*Av)\bigr)\ge0,$$
最后一步是 eq:support 在 $z=v^*Av\in W(A)\subset\overline\Omega$ 处。$B$ 可逆 ⇒ 合同变换保持正半定等价 ⇒ $R+R^*\succeq0$。$\blacksquare$

**这一步的三个技术要点（都容易漏）**：
1. 用 $B^*(\cdot)B$ 合同而不是直接算 $R+R^*$ 的二次型：后者会出现 $(h(\lambda)I-A)^{-1}$ 的二次型，无法直接套 eq:support；合同一次把逆消掉 —— **这正是 Crouzeix–Palencia 那套"正双层位势"论证的最小内核**，本文把它压缩成三行。
2. eq:support 里的 $z$ 必须是 $v^*Av$（一个**数值范围点**），不是特征值、不是任意的 $z$。这解释了为什么 $R+R^*$ 的正性**只对 $A$ 本身**成立而对相似的 $SAS^{-1}$ 不成立（第 292 行 `for the original matrix $A$` 的分量就在这里）—— 也正是本文**不能**走相似化约路线的原因：一做相似，正性立刻失效。这条因果链素材必须写进笔记。
3. $\lambda\in\T$ 固定后再做，正性是**逐点**的（pointwise in $\lambda$），没有积分平均 —— 后续 $2\times2$ 块比较能逐点做、然后再积分，全靠这一点。

#### (c) 常数与假设的机械理由

| 对象 | 位置 | 作用 | 崩点 |
| --- | --- | --- | --- |
| $W(A)\subset\Omega$（**严格**包含在开集里） | 第 296 行假设 | 使 $h(\lambda)I-A$ 在 $\T$ 及更大领子上可逆，并提供 $\dist(W(A),\partial\Omega)>0$ ⇒ $r_A$ 存在 | 若只 $W(A)\subset\overline\Omega$：边界上可能有 $h(\lambda)\in W(A)$ ⇒ $R$ 有极点 ⇒ 无 Laurent 展开、无 $\theta^k$、$a=\infty$。这就是 `sec:limit` 必须"从外部加厚"而不能"从内部逼近"的原因（`lem:approx` 给 $K\subset\Omega_\delta$，方向是外逼） |
| 三层半径 $0<r<r_A<\theta<1$ | 第 310–311 行 | $r$：$h$ 的单叶领子；$r_A$：预解式全纯领子；$\theta$：Cauchy 估计半径 | 若 $r_A=r$：$\theta$ 只能 $\to1^-$，$C\to\infty$，但**仍有一个** $\theta<1$ 可用（因为 $r_A>r$ 严格），所以真正不能等号的是 $r_A>r$ 与 $\theta>r_A$。数值本身不敏感 |
| $C<\infty$ | 第 304–305 行 | 只用于 "$\sum_k$ 收敛" | 对最终常数 2 **无影响**：`thm:domain` 里所有比较关于 $a$ 是齐次的，$C$ 被约掉 |
| $b_0(A)=I$ | 第 310、313 行 | $\int R=I$、$\int(R+R^*)=2I$；eq:means 的 $P_0=X^*X$、$Q_0=Y^*Y$；对角/交叉块的零频 $2\times$ | 若 $b_0(A)=\kappa I$：$P_0=\kappa X^*X$、$Q_0=\kappa Y^*Y$、$M_0$ 也带 $\kappa$，`eq:diagonal-L2` 的 $4$ 与 `eq:cross-L2` 的 $4\HS{M_0}^2$ 同比例缩放，**最后仍约掉**。[分析：$b_0$ 的归一化不是绝对必需，但 $b_0$ 必须是**标量倍数 of $I$**（即 $b_0$ 是常数多项式）—— 这由 $h$ 的单极点性质给出] |
| $q(\lambda)=\lambda h'(\lambda)$ 里的 $\lambda$ 因子 | eq:R | 使 $B^*(R+R^*)B=\bar qB+qB^*$ 恰为 $2\Re(\bar q\,\cdot)$，且 $\bar q$ 正是 eq:support 需要的法向共轭 | 若 $R=h'(\lambda)(h(\lambda)I-A)^{-1}$（不带 $\lambda$）：二次型变 $2\Re(\overline{h'(\lambda)}(h(\lambda)-z))$，而 eq:support 需要 $\overline{\lambda h'(\lambda)}$ —— 相差旋转 $e^{-i\theta}$，符号不再非负 ⇒ **正性直接崩**。这是全文最小的"结构性常数"，也是 Lean 里 `Faber.boundaryNormal` 必须定义成 `unitPoint t * deriv exterior c g (unitPoint t)` 的原因（`DomainBound.lean` 第 82–83 行 `Faber.unitPoint t*deriv (Faber.exterior c g) (Faber.unitPoint t) = Faber.boundaryNormal c g t`） |
| $\succeq0$ 逐点成立 | 第 302 行 | 第 435–439 行的压缩 $\Delta(\lambda)\succeq0$ 逐点成立，逐点取迹不等式后再积分 | 若只有平均意义下的正性，块压缩后不能逐点做 $J\Delta J$，第 442 行 $\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})\ge0$ 失效 |
| 绝对一致收敛 | 第 306 行 | 四个级数 $P,Q,M,L$ 的逐项操作、逐频陈述 | 只有 $L^2$ 收敛时，第 413–415 行"$P_k$ 与 $P_k^*$ 出现在频率 $\mp k$ 且 HS 范数相等"这类陈述需要额外论证 |
| $n$ 是正整数 | 第 296 行 | $M_n(\C)$ 非零；$X,Y$ 是 $n\times m$ | $n=0$ 时 $A$ 是空矩阵、$W(A)=\varnothing$，$R$ 仍是 $0\times0$，一切平凡；Lean 用 `0 < n` 排除（`Model.lean` 第 29 行） |

#### (d) 候选失败路线 [推测]

1. [推测] **为什么不用 Riesz–Dunford 谱投影 / 谱演算定义 $P[A]$ 并估范数？** 幂零矩阵的谱在原点，Riesz 投影给不出信息（第 45 行的 nilpotent 论证即此意）；$H^\infty$ 演算需要 $\Omega$ 是 $A$ 的 $C$-spectral set —— 这正是待证结论，路线循环。本文让预解式**只在圆周上**取值，且只用其 **Hermitian 部分的符号**，从不取其范数。这是绕开谱演算的关键设计。
2. [推测] **为什么不直接用 Cauchy 公式套范数？** $\|P[A]\|\le\frac{|\Gamma|}{2\pi}\max_\Gamma\|P\|\max_\Gamma\|(zI-A)^{-1}\|$，后者只能用伪谱界估计，对幂零 Jordan 块是 $\sim\varepsilon^{1-n}$ 型发散，给不出一致常数。本文把"积在什么轮廓上"与"$P$ 在哪里取最大值"**绑在同一条 $\partial\Omega$ 上**（$b_k$ 与 $R$ 用同一个 $h$），这个同步是 Crouzeix–Palencia 之后所有路线的共同难题，本文用"系数"而非"轮廓积分"绕过。
3. [推测] **为什么不把 $R+R^*\succeq0$ 写成一个正边界测度的 Stieltjes 表示（Delyon–Delyon 式）？** 那产出的是**表示定理**（companion 论文做的事），是全局对象，需要相容性/归一化技术；本文只要一次逐点正性。这也解释了为什么本文引用 Delyon–Delyon 时只说"这是同一个核"而不引其定理。
4. [推测] **为什么不证 $\|b_k(A)\|$ 对 $A$ 一致？** 不可能：圆盘情形 $b_k(A)=A^k$，幂零 Jordan 块可以 $\|A\|=1$ 而 $\|A^k\|$ 不衰减。所以第 304 行把 $C,\theta$ 写成 "for the fixed $A,h$" 不是疏忽，是**能力上限声明**；也正因如此，全文的 $A$-依赖性都被塞进 $a$ 里，最后在齐次比较中被消掉。

### 2.5 定理 `thm:domain`：解析凸域上的界（全文核心）

#### (a) 精确陈述（`main.tex` 第 323–325 行照抄）

```tex
\begin{theorem}[The bound on an analytic convex domain]\label{thm:domain}
For positive integers $n,m$, let $\Omega\subset\C$ be bounded, open, and convex with regular real-analytic Jordan boundary, and let $A\in M_n(\C)$ satisfy $W(A)\subset\Omega$. For every $M_m(\C)$-valued polynomial $F$ with $\|F(z)\|\le1$ on $\partial\Omega$, one has $\|F[A]\|\le2$.
\end{theorem}
```

量化顺序：$\Omega$（连同它的 $h$）在 $A$ 之前、$A$ 在 $F$ 之前 —— 即**一个域一个矩阵，对一切满足边界归一化的多项式**。$F$ 的归一化是 $\|F(z)\|\le1$ on $\partial\Omega$（**逐点算子范数**，不是 HS、不是 Faber 系数），这是全文唯一一次出现"$\le1$"这种硬归一化。结论 $\|F[A]\|\le2$ 里**没有 $\Omega$、没有 $h$、没有 $F$ 的次数** —— 所以常数 2 是真的统一。

与 `thm:main` 的关系：`thm:main` 的 $\max_{z\in W(A)}\|P(z)\|$ 通过缩放到这里（第 520–523 行），即 $\gamma$ 型结论 $\|F[A]\|\le2$ 与 $\|P[A]\|\le2\max\|P\|$ 只差一个 normalization，是齐次的。

#### (b) 证明机制逐步重建（第 326–453 行，论文自己用四个 `\emph` 小标题分段）

**第 0 步：坐标与归一化（第 327–332 行）。**
```tex
Choose $h$ from Lemma~\ref{lem:exterior-collar} and apply
Theorem~\ref{lem:faber} to this coordinate.
Put $\gamma=\|F[A]\|$. There is nothing to prove if $\gamma=0$. Otherwise choose unit singular vectors $x,y\in\C^n\otimes\C^m$ such that
\begin{equation}\label{eq:singular}
 F[A]x=\gamma y,\qquad F[A]^*y=\gamma x.
\end{equation}
```
- `There is nothing to prove if $\gamma=0$`：$\gamma=0$ 时结论 $0\le2$ 平凡，且**必须**排除，因为后面要用 $\gamma$ 作除数、要 $\gamma>0$ 推 $a>0$。
- 为什么必须是一对奇异向量而不是一个达到范数的向量（第 104–106 行提到别人用 attainer）：$F[A]$ 一般**非正规**，$\|F[A]x\|=\gamma$ 给不出 $x^*F[A]x=\gamma$；只有配对 $(x,y)$ 才让 $y^*F[A]x=\gamma y^*y=\gamma$ 成为**一个双线性泛函数的值**。eq:singular 的两个等式各管一头：$F[A]x=\gamma y$ 用于 $y^*(GF)[A]x=\gamma y^*G[A]y$，$F[A]^*y=\gamma x$（等价 $y^*F[A]=\gamma x^*$，因 $\gamma$ 是**正实数**）用于 $y^*(FG)[A]x=\gamma x^*G[A]x$。

**第 1 步：把向量写成矩阵 $X,Y$（第 333 行）。**
```tex
Write $x=\sum_{i=1}^mXe_i\otimes e_i$ and $y=\sum_{i=1}^mYe_i\otimes e_i$, where $X,Y$ are $n$-by-$m$ matrices and $(e_i)$ is the standard basis of $\C^m$.
```
机械含义：$\C^n\otimes\C^m\ni x\mapsto X\in M_{n\times m}$，第 $i$ 列是 $x$ 在系数基向量 $e_i$ 上的 $\C^n$ 分量。于是 $\|x\|^2=\sum_i\|Xe_i\|^2=\tr(X^*X)=\HS X^2$，即
$$\|x\|=1\iff\HS X=1,\qquad\|y\|=1\iff\HS Y=1.$$
论文没有明写这个等价（**论文未述**），但它正是"未归一化 HS"选择的回报：Lean 里写成 `hsVector_matrixify`（`SingularPairs.lean` 第 83–86 行）与 `hsSq_eq_norm_hsVector_sq`（`HilbertSchmidt.lean` 第 31–33 行）。同时它也保证 $P_0=X^*X$、$Q_0=Y^*Y$ 的迹是 1，即 $P,Q$ 的零频是**密度矩阵型**对象。

**第 2 步：四个块与 $a$（第 333–344 行）。**
```tex
For the resolvent in Theorem~\ref{lem:resolvent}, define matrix functions
\[
 P=X^*RX,\quad Q=Y^*RY,\quad M=Y^*RX,\quad L=X^*RY.
\]
Subscripts $k\ge0$ denote the coefficients of $\lambda^{-k}$, so $M_k=Y^*b_k(A)X$, for example. By Theorem~\ref{lem:resolvent}, all four series converge absolutely and uniformly on $\T$, and their coefficient sequences are square summable. Since $b_0=1$,
\begin{equation}\label{eq:means}
 P_0=X^*X=P_0^*,\qquad Q_0=Y^*Y=Q_0^*,\qquad L_0^*=M_0.
\end{equation}
Set $a^2=\sum_{k\ge0}\HS{M_k}^2$. We will bound the squared
boundary $L^2$ Hilbert--Schmidt norms of $P+P^*$ and $Q+Q^*$
above by $4a^2/\gamma^2$ each, and that of $M+L^*$ below by $a^2$.
Positivity will then compare these quantities and force $\gamma\le2$.
```
- $P,Q$ 是**Hermitian 型**（零频 Hermitian，且整体 $P+P^*$ 是 Hermitian 值函数）；$M,L$ 互为"转位"：$L(\lambda)=X^*RY=(Y^*R^*X)^*$，所以 $L_k=(M_k(R^*))^{\,*}$，具体地 $L_k=X^*b_k(A)^*Y=(Y^*b_k(A)X)^*=M_k^*$ **当 $b_k(A)$ 是 Hermitian 时才成立 —— 这里不是**！正确关系是 $L_k=X^*b_k(A)Y$，$M_k^*=Y^*b_k(A)^*X$，两者不等。唯一可靠的关系是 $k=0$：$L_0=X^*Y=M_0^*\,?$ $M_0=Y^*X$，$M_0^*=X^*Y=L_0$ ✓（因 $b_0(A)=I$）。这就是 eq:means 第三式 $L_0^*=M_0$ 的全部内容，也是为什么第 425 行"$L_0^*=M_0$ makes the constant term $2M_0$"只能对**零频**说。素材记录：$L_k$ 与 $M_k$ 对 $k\ge1$ **没有**共轭关系，全文对此只字不提，因为第 427–431 行的写法"$L_k^*$ 是正频系数"不需要任何关系，只需要 $\HS{L_k}$ 出现且非负。这是"下界 $\ge a^2$"里那个松绑的来源。
- 第 341–344 行是全文的**路线图**，把三个目标量写死：$\int\HS{P+P^*}^2\le4a^2/\gamma^2$、$\int\HS{Q+Q^*}^2\le4a^2/\gamma^2$、$\int\HS{M+L^*}^2\ge a^2$。

**第 3 步（`\emph{The off-diagonal coefficient functional}`，第 346–355 行）：配对恒等式。**
```tex
For a polynomial $G=\sum_k b_kC_k$, direct expansion in the tensor basis gives
\begin{equation}\label{eq:pairing}
 y^*G[A]x=\sum_{k,i,j}(M_k)_{ij}(C_k)_{ij}.
\end{equation}
Indeed, $C_ke_j=\sum_i(C_k)_{ij}e_i$ in the coefficient factor, leaving $(Ye_i)^*b_k(A)Xe_j$ in the base factor. Equation~\eqref{eq:pairing} is the bilinear entry pairing of the two coefficient arrays. Cauchy--Schwarz gives
\begin{equation}\label{eq:crossfunctional}
 |y^*G[A]x|\le a\left(\sum_k\HS{C_k}^2\right)^{1/2}.
\end{equation}
Taking $G=F$ and using \eqref{eq:singular} shows that $a>0$.
```
逐步补：$G[A]=\sum_kb_k(A)\otimes C_k$（把 Faber 基展开通过同态 $z\mapsto A\otimes1$、$C\mapsto1\otimes C$ 送进去）。$(b_k(A)\otimes C_k)$ 作为 $n\times n$ 分块（每块 $m\times m$）的 $(a,b)$ 块是 $(b_k)_{ab}C_k$；也可按系数基看：其 $(i,j)$ 块（$\C^n$ 上的算子）是 $(C_k)_{ij}b_k(A)$。于是
$$y^*G[A]x=\sum_{i,j}(Ye_i)^*\Bigl(\sum_k(C_k)_{ij}b_k(A)\Bigr)(Xe_j)=\sum_{k,i,j}(C_k)_{ij}\,(Ye_i)^*b_k(A)(Xe_j)=\sum_{k,i,j}(C_k)_{ij}(M_k)_{ij}.\ \checkmark$$
其中 $(M_k)_{ij}=(Y^*b_k(A)X)_{ij}=\sum_{a,b}\bar Y_{ai}(b_k(A))_{ab}X_{bj}=(Ye_i)^*b_k(A)(Xe_j)$。$\checkmark$
- **双线性、不带共轭**：eq:pairing 右端是 $\sum M_{ij}C_{ij}$ 而非 $\sum\bar M_{ij}C_{ij}$。这一点决定了后面测试必须用**逐元素共轭** $C_k=\bar P_k$（第 401–402 行），因为 $|{\cdot}|$ 侧要变实非负。Lean 的 `entryPair`（`HilbertSchmidt.lean` 第 45–46 行 `def entryPair (M C) := ∑ i, ∑ j, M i j * C i j`）与 `entryPair_conj : entryPair M (M.map star) = (hsSq M : ℂ)`（第 48–56 行）把这件事写得毫无歧义 —— **Lean 强制论文里"隐身的共轭约定"显形**。
- Cauchy–Schwarz：把 $\{(M_k)_{ij}\}$ 与 $\{(C_k)_{ij}\}$ 当作一个大向量的分量，$\bigl|\sum M_k{}_{ij}C_k{}_{ij}\bigr|\le(\sum\HS{M_k}^2)^{1/2}(\sum\HS{C_k}^2)^{1/2}=a(\cdots)^{1/2}$。
- $a>0$ 的推法：取 $G=F$（写成 Faber 基 $F=\sum b_kD_k$，有限），左端 $y^*F[A]x=\gamma\ne0$，右端 $(\sum\HS{D_k}^2)^{1/2}$ 有限（有限和），故 $a\ge\gamma/(\sum\HS{D_k}^2)^{1/2}>0$。**这是 $\gamma$ 首次进入不等式**，也是全文唯一用"$F[A]$ 的范数被双线性泛函数抓到"的地方。

**第 4 步（`\emph{The two ordered tests}`，第 357–407 行）：本文与标量证明分岔的地方。**

(4.1) 乘法顺序（第 358–366 行）：
```tex
Polynomial evaluation respects multiplication in its given order. Explicitly, if $F(z)=\sum_iD_iz^i$ and $G(z)=\sum_jE_jz^j$, then
\[
 (FG)[A]=\sum_{i,j}A^{i+j}\otimes D_iE_j=F[A]G[A],
\]
and the reversed product has coefficients $E_jD_i$. Hence
\begin{equation}\label{eq:ordered-products}
 y^*(FG)[A]x=\gamma x^*G[A]x,\qquad
 y^*(GF)[A]x=\gamma y^*G[A]y.
\end{equation}
```
验算：$(FG)[A]=F[A]G[A]$ 成立是因为 $(\sum_iA^i\otimes D_i)(\sum_jA^j\otimes E_j)=\sum_{i,j}A^{i+j}\otimes D_iE_j$（**用 $(A\otimes B)(C\otimes D)=AC\otimes BD$**，这一步不需要任何东西交换）。而 $(GF)[A]$ 的系数是 $E_jD_i$ 而非 $D_iE_j$ —— 这就是"$m$" 的全部难度所在：$F[A]G[A]\ne G[A]F[A]$ 一般。
再由 eq:singular：$y^*(FG)[A]x=y^*F[A]G[A]x=(F[A]^*y)^*G[A]x=(\gamma x)^*G[A]x=\gamma x^*G[A]x$（用 $\gamma\in\mathbb R_{>0}$）；$y^*(GF)[A]x=y^*G[A](F[A]x)=\gamma y^*G[A]y$。$\checkmark$
素材记录：eq:ordered-products 的两条**各自**用掉 eq:singular 的一个等式（第一条用 $F[A]^*y=\gamma x$，第二条用 $F[A]x=\gamma y$）。**只用一个奇异向量或只做一侧乘积，这两条里就会有一条出不来。**

(4.2) 两条链（第 367–384 行）：
```tex
Write the full finite Faber expansions as
\[
 FG=\sum_k b_kU_k,\qquad GF=\sum_k b_kV_k,
 \qquad \|H\|_\partial^2=\int_\T\HS{H(h(\mu))}^2\,d\tau(\mu).
\]
The functional in \eqref{eq:crossfunctional} uses all $M_k$, so it applies
to these full expansions for every finite degree. Apply it to the two
identities in \eqref{eq:ordered-products}. The lower coefficient estimate
in Proposition~\ref{prop:coefficients} and the two boundary multiplier
bounds give
\begin{align*}
 \gamma|x^*G[A]x|
 &\le a\Bigl(\sum_k\HS{U_k}^2\Bigr)^{1/2}
 \le a\|FG\|_\partial\le a\|G\|_\partial,\\
 \gamma|y^*G[A]y|
 &\le a\Bigl(\sum_k\HS{V_k}^2\Bigr)^{1/2}
 \le a\|GF\|_\partial\le a\|G\|_\partial.
\end{align*}
Here $\HS{F(z)G(z)}\le\|F(z)\|\HS{G(z)}$ and
$\HS{G(z)F(z)}\le\HS{G(z)}\|F(z)\|$ are used in their
respective orders. The upper coefficient estimate for $G$ now gives
\begin{equation}\label{eq:diagonal-functional}
 \max\{|x^*G[A]x|,|y^*G[A]y|\}
 \le\frac a\gamma
 \left(\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2\right)^{1/2}.
\end{equation}
```
四个不等号逐个点名：
1. $\le a(\sum\HS{U_k}^2)^{1/2}$：eq:crossfunctional 用在多项式 $FG$ 上（其 Faber 系数为 $U_k$）。合法性来自第 372–373 行那句"泛函数用到**所有** $M_k$，所以对任意有限次展开都适用"——因为 $FG$ 的 Faber 次数 $=\deg F+\deg G$，比 $F$ 高，必须允许求和到任意有限 $N$。
2. $\le a\|FG\|_\partial$：**`prop:coefficients` 的左不等式**（$\sum_k\HS{U_k}^2\le\int\HS{(FG)(h(\mu))}^2d\tau$）。
3. $\le a\|G\|_\partial$：逐点 HS 乘积界 $\HS{F(z)G(z)}\le\|F(z)\|\HS{G(z)}$ 与 $\|F(z)\|\le1$（$z\in\partial\Omega$）。**这是假设 $\|F\|_{\partial\Omega}\le1$ 在全证明中唯一被使用的地方**（$GF$ 一侧用另一个顺序 $\HS{G(z)F(z)}\le\HS{G(z)}\|F(z)\|$）。
4. 最后把 $\|G\|_\partial^2$ 换成 $\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2$：**`prop:coefficients` 的右不等式**。
=> **同一个命题 `prop:coefficients` 在同一条链里被反方向用了两次**（左不等式用在 $FG/GF$ 上，右不等式用在 $G$ 上）。这个"一物两用"是配平能够成立的结构原因，也是这段最难读的地方。

(4.3) 变分测试（第 393–407 行）：
```tex
The entries paired with $C_k$ in these two functionals are respectively those of $P_k$ and $Q_k$, by the calculation in \eqref{eq:pairing}. The weighted coefficient norm on the right gives reciprocal weights on these two coefficient sequences:
\begin{equation}\label{eq:weighted-dual}
 \HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\le a^2/\gamma^2,
 \qquad
 \HS{Q_0}^2+\tfrac12\sum_{k\ge1}\HS{Q_k}^2\le a^2/\gamma^2.
\end{equation}
For the first inequality, set
$d_N=\HS{P_0}^2+\tfrac12\sum_{k=1}^N\HS{P_k}^2$
and test \eqref{eq:diagonal-functional} with $C_0=\overline{P_0}$,
$C_k=\overline{P_k}/2$ for $1\le k\le N$, and $C_k=0$ otherwise;
bars mean entrywise conjugation. The paired value is $d_N$, and the squared
weighted test norm is also $d_N$. Hence
$d_N\le(a/\gamma)\sqrt{d_N}$, which gives $d_N\le a^2/\gamma^2$
including when $d_N=0$. Letting $N\to\infty$ proves the first bound.
The same finite tests with $Q_k$ prove the second.
```
把 $x^*G[A]x=\sum_k(P_k)_{ij}(C_k)_{ij}$ 与测试 $C_0=\bar P_0$、$C_k=\bar P_k/2$ 代进去：
$$(P_k)_{ij}\overline{(P_k)_{ij}}=|(P_k)_{ij}|^2\ \Rightarrow\ \text{paired value}=\HS{P_0}^2+\sum_{k=1}^N\tfrac12\HS{P_k}^2=d_N\in\mathbb R_{\ge0}.$$
测试的加权平方范数：
$$\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2=\HS{\bar P_0}^2+2\sum_{k=1}^N\tfrac14\HS{\bar P_k}^2=\HS{P_0}^2+\tfrac12\sum_{k=1}^N\HS{P_k}^2=d_N.$$
**两者相等** —— 这就是"self-dual test"：$2$（来自 `prop:coefficients` 的右端权）与 $\tfrac12$（来自测试系数）相消。于是 eq:diagonal-functional 给
$$d_N\le\frac a\gamma\sqrt{d_N}\ \Rightarrow\ \bigl(d_N>0\bigr)\Rightarrow\sqrt{d_N}\le\frac a\gamma\Rightarrow d_N\le\frac{a^2}{\gamma^2};\quad \bigl(d_N=0\bigr)\text{ 结论平凡成立}.$$
$N\to\infty$ 用单调收敛（部分和递增有界）。
- 需要 $\HS{\bar P}=\HS P$：显然（逐元素共轭不改模长）。Lean: `hsSq_map_star`（`HilbertSchmidt.lean` 第 58–60 行）。
- 这个测试的**抽象化版本**在 Lean 里是 `weighted_coefficient_dual`（`Duality.lean` 第 15–46 行），它把"$C_k=(w_k)^{-1}\bar P_k$"写成任意权族 $w_k>0$ 的形式，并且 `by_cases hs0 : s = 0` 恰好对应论文的 "including when $d_N=0$"。也就是说**论文这一段的一个句点，在 Lean 里是一条完整的引理加一次分情形**。

**第 5 步（`\emph{The boundary norms of the three blocks}`，第 409–432 行）：Parseval 与因子 4。**
```tex
The compression of $R+R^*$ by $[X\ Y]$ has diagonal blocks $P+P^*$,
$Q+Q^*$ and lower off-diagonal block $M+L^*$. We first compute their
boundary norms. In the diagonal fields, \eqref{eq:means} makes the
constant term twice $P_0$ or $Q_0$. For $k\ge1$, the coefficients $P_k$
and $P_k^*$ occur at frequencies $-k$ and $k$ and have equal
Hilbert--Schmidt norms; the same holds for $Q_k$ and $Q_k^*$.
Parseval therefore gives four times the reciprocal weighted sum in
\eqref{eq:weighted-dual}:
\begin{equation}\label{eq:diagonal-L2}
 \int_\T\HS{P+P^*}^2d\tau
 =4\left(\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\right)
 \le4a^2/\gamma^2,
\end{equation}
and the same identity and bound hold for $Q+Q^*$.
```
逐频清点：$P(\lambda)=\sum_{k\ge0}P_k\lambda^{-k}$，$\lambda\in\T$。$(P+P^*)(\lambda)=\sum_kP_k\lambda^{-k}+\sum_kP_k^*\lambda^{k}$。
- 频率 $0$：$P_0+P_0^*=2P_0$（用 $P_0$ Hermitian，来自 eq:means）。
- 频率 $-k$（$k\ge1$）：$P_k$；频率 $+k$：$P_k^*$；两者 HS 相等（$\HS{A^*}=\HS A$）。
所以（Parseval 在 $M_m$-值 $L^2$ 上、$\HS{}^2$ 侧）
$$\int_\T\HS{P+P^*}^2d\tau=\HS{2P_0}^2+\sum_{k\ge1}\bigl(\HS{P_k}^2+\HS{P_k^*}^2\bigr)=4\HS{P_0}^2+2\sum_{k\ge1}\HS{P_k}^2=4\Bigl(\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\Bigr).$$
**这是全证明里"4"的出处**，且它必须与 eq:weighted-dual 的 $\tfrac12$ **成对出现**：正是因为测试引入了 $\tfrac12$，Parseval 的双计数（$\pm k$ 两份）才会被包进一个干净的 4 里。$4\cdot\tfrac12=2$ 抵消，只剩 $4\HS{P_0}^2$ 的 4。

交叉块（第 425–432 行）：
```tex
For the cross field, $L_0^*=M_0$ makes the constant term $2M_0$.
Its negative coefficients are $M_k$ for $k\ge1$ and its positive
coefficients are $L_k^*$ for $k\ge1$. Consequently
\begin{equation}\label{eq:cross-L2}
 \int_\T\HS{M+L^*}^2d\tau
 =4\HS{M_0}^2+\sum_{k\ge1}\bigl(\HS{M_k}^2+\HS{L_k}^2\bigr)
 \ge a^2.
\end{equation}
```
清点：$(M+L^*)(\lambda)=\sum_kM_k\lambda^{-k}+\sum_kL_k^*\lambda^{k}$；频率 $0$：$M_0+L_0^*=2M_0$（用 $L_0^*=M_0$）；频率 $-k$：$M_k$；频率 $+k$：$L_k^*$（HS $=\HS{L_k}$）。
$$\int_\T\HS{M+L^*}^2=4\HS{M_0}^2+\sum_{k\ge1}\HS{M_k}^2+\sum_{k\ge1}\HS{L_k}^2\ge\HS{M_0}^2+\sum_{k\ge1}\HS{M_k}^2=a^2.$$
**两个松绑**：$4\HS{M_0}^2\ge\HS{M_0}^2$（零频多算了 3 倍，但 $a^2$ 需要的是权重 1）与 $\sum\HS{L_k}^2\ge0$（整个 $L$ 侧白送）。第 157 行那句 `The cross term retains all coefficients of the first functional, including its constant coefficient` 说的就是：$a^2$ 的全部（含 $M_0$）都被 $\int\HS{M+L^*}^2$ 抓住，**不需要** $\tfrac12$、不需要丢项。素材要点：**交叉块（全权重 1）与对角块（权重 $1,\tfrac12$）之间的这 $\tfrac12$ 差额，就是常数 2 的来源。**

**第 6 步（`\emph{The positive block comparison}`，第 434–452 行）：最后一步。**
```tex
Theorem~\ref{lem:resolvent} gives $R+R^*\succeq0$. Its compression by the
$n$-by-$2m$ matrix $[X\ Y]$ is therefore
\[
 \Delta=\begin{pmatrix}P+P^*&L+M^*\\M+L^*&Q+Q^*\end{pmatrix}\succeq0.
\]
For $J=\diag(I_m,-I_m)$, the matrix $J\Delta J$ is also positive, so
\[
 0\le\tr\bigl(\Delta^{1/2}(J\Delta J)\Delta^{1/2}\bigr)
 =\tr(\Delta J\Delta J)
 =\HS{P+P^*}^2+\HS{Q+Q^*}^2-2\HS{M+L^*}^2.
\]
Integrating this inequality and using \eqref{eq:diagonal-L2} and \eqref{eq:cross-L2} yields
\[
 2a^2\le2\int_\T\HS{M+L^*}^2d\tau
 \le\int_\T\bigl(\HS{P+P^*}^2+\HS{Q+Q^*}^2\bigr)d\tau
 \le8a^2/\gamma^2.
\]
Since $a>0$, this proves $\gamma\le2$.
```
补全每一环：
- $\Delta=[X\ Y]^*(R+R^*)[X\ Y]$：分块算出来是 $\begin{pmatrix}X^*(R+R^*)X&X^*(R+R^*)Y\\Y^*(R+R^*)X&Y^*(R+R^*)Y\end{pmatrix}=\begin{pmatrix}P+P^*&L+M^*\\M+L^*&Q+Q^*\end{pmatrix}$，因为 $X^*R^*Y=(Y^*RX)^*=M^*$，$Y^*R^*X=(X^*RY)^*=L^*$。合同保正半定 ⇒ $\Delta(\lambda)\succeq0$ 逐点。
- $J=J^*=J^{-1}$ ⇒ $J\Delta J\succeq0$（合同）。
- $0\le\tr\bigl(\Delta^{1/2}(J\Delta J)\Delta^{1/2}\bigr)$：因为 $\Delta^{1/2}(J\Delta J)\Delta^{1/2}=(J\Delta J)^{1/2}$ 型 sandwich 是正半定的（写作 $A^*BA$，$B\succeq0$），正半定矩阵的迹 $\ge0$。
- 循环性：$\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\tr((J\Delta J)\Delta)=\tr(\Delta J\Delta J)$。
- 展开：记 $D=P+P^*$、$E=Q+Q^*$、$F=L+M^*$（则 $F^*=M+L^*$）。$J\Delta J=\begin{pmatrix}D&-F\\-G&E\end{pmatrix}$ 其中 $G=F^*$；$\Delta J\Delta J=\begin{pmatrix}D&F\\G&E\end{pmatrix}\begin{pmatrix}D&-F\\G&E\end{pmatrix}$，迹 $=\tr(D^2)+\tr(FG)+\tr(GD)+\dots$ 让我按块乘：$(1,1)$ 块 $=D^2+FG$，$(2,2)$ 块 $=-GF+E^2$。迹 $=\tr(D^2)+\tr(E^2)+\tr(FG)-\tr(GF)=\tr(D^2)+\tr(E^2)+\bigl(\tr(FG)-\tr(GF)\bigr)$。而 $\tr(FG)=\tr((L+M^*)(M+L^*))$，$\tr(GF)=\tr((M+L^*)(L+M^*))$，由 $\tr(AB)=\tr(BA)$ 两者相等 ⇒ 差为 0？这与论文的 $-2\HS{M+L^*}^2$ 不符 —— 说明块的排列要更小心。正确做法：$\Delta J\Delta J$。先 $\Delta J=\begin{pmatrix}D&F\\G&E\end{pmatrix}\begin{pmatrix}I&0\\0&-I\end{pmatrix}=\begin{pmatrix}D&-F\\G&-E\end{pmatrix}$。再乘 $J$ 于右之前，先算 $(\Delta J)(\Delta J)=(\Delta J)^2=\begin{pmatrix}D&-F\\G&-E\end{pmatrix}\begin{pmatrix}D&-F\\G&-E\end{pmatrix}$，$(1,1)=D^2-FG$，$(2,2)=-GF+E^2$。迹 $=\tr(D^2)+\tr(E^2)-\tr(FG)-\tr(GF)$。而 $\tr(\Delta J\Delta J)=\tr((\Delta J)(\Delta J))$（因为 $\Delta J\Delta J$ 里 $J\Delta J$ 与 $\Delta$ 结合顺序：$\Delta J\Delta J=(\Delta J)(\Delta J)$ ✓ 因 $\Delta J\Delta J$ 读作 $\Delta\cdot J\cdot\Delta\cdot J=(\Delta J)(\Delta J)$）。✓
  $\FG$ 项：$G=F^*$，所以 $FG=F^*F=(M+L^*)^*(M+L^*)$？$F=L+M^*$，$F^*=L^*+M=M+L^*=G$ ✓。故 $FG=F^*F$ ⇒ $\tr(FG)=\HS F^2$？注意 $\HS F^2=\tr(F^*F)=\tr(GF)$。论文写的是 $\HS{M+L^*}^2=\HS G^2=\tr(G^*G)=\tr(FG)$。两者都由 $\tr(FG)=\tr(GF)$ 相等 ✓。于是
  $$\tr(\Delta J\Delta J)=\tr(D^2)+\tr(E^2)-2\HS{M+L^*}^2.$$
  又 $D,E$ Hermitian ⇒ $\tr(D^2)=\tr(D^*D)=\HS D^2$。$\checkmark$ 与论文完全一致。
- 逐点积分 ⇒ $\int\HS{M+L^*}^2$ 的系数 2 与两个对角的 1+1 相加：
  $$2\int\HS{M+L^*}^2\le\int\HS{P+P^*}^2+\int\HS{Q+Q^*}^2.$$
- 收尾算术：
  $$2a^2\le 2\int_\T\HS{M+L^*}^2d\tau\le\int_\T(\HS{P+P^*}^2+\HS{Q+Q^*}^2)d\tau\le 4a^2/\gamma^2+4a^2/\gamma^2=8a^2/\gamma^2.$$
  $a>0$ 消去 $2a^2$：$1\le4/\gamma^2$ ⇒ $\gamma^2\le4$ ⇒ $\gamma\le2$。$\blacksquare$

**常数记账（这段我认为是全文最值得做笔记的算术）**：最终 $\gamma^2\le4$，$\gamma\le2$，那个 **4 恰好就是 `eq:diagonal-L2` 里 Parseval 的 4**，两个 2（一个来自 $2a^2$ 左端、一个来自两个对角相加）**完全抵消**。也就是说：
$$\gamma^2\le\frac{2\times(\text{Parseval 因子 }4)}{2\times(\text{trace 步的因子 }2)/2}=\dots$$
更清楚的写法：左端 $=2\cdot(\text{交叉下界 }1)\cdot a^2$，右端 $=2\cdot(\text{对角上界 }4)\cdot a^2/\gamma^2$。$\gamma^2\le\frac{2\cdot4}{2}=\frac{8}{2}=4$。**分子 $2\cdot4$：2 个对角块 × Parseval 因子 4；分母 2：$\tr(\Delta J\Delta J)$ 里 $-2\HS{M+L^*}^2$ 的 2。** $\gamma\le2$ 于是是 $\sqrt{4}$。若只有 1 个对角块（即只测 $FG$ 不测 $GF$）则右端 $4a^2/\gamma^2$，链成 $2a^2\le4a^2/\gamma^2$ ⇒ $\gamma\le\sqrt2$ —— 这**不可能**成立（会与最优性矛盾），说明少了第二个对角块时 trace 步本身就不成立（$\Delta$ 的 $(2,2)$ 块没界，正性给不出任何东西）。这解释"$F$ 的左右两侧都要放测试多项式"（第 111–112 行 `placing a test polynomial on each side`）不是冗余，而是**正性可用的前提**。

#### (c) 每个常数/假设的机械理由

| 对象 | 位置 | 作用 | 放宽/改动后的崩点 |
| --- | --- | --- | --- |
|  $\|F(z)\|\le1$ on $\partial\Omega$ | 第 324 行 | 只用于第 4.2 步的第 (3) 个不等号（边界乘子界） | 若改成 $\le\kappa$：$a\|G\|_\partial\le\kappa a\|G\|_\partial$，$a^2/\gamma^2$ 变 $\kappa^2a^2/\gamma^2$，最终 $\gamma\le2\kappa$ —— 与缩放齐次性一致，无矛盾（$F/\kappa$ 归一化即回到 $\kappa=1$）。若改成**面积分** $\int\|F\|^2\le1$：第 (3) 步不等号仍成立（Cauchy–Schwarz 后 $\|FG\|_\partial\le(\sup\|F\|)\|G\|_\partial$ 需要 sup），因此**假设必须是 $L^\infty$ 型**，不能弱化成 $L^2$；论文选 $\partial\Omega$ 上的 sup 而不是 $\Omega$ 内的 sup（次调和性可互换，但多项式 $F$ 的 $\|F\|$ 次调和 ⇒ 边界 sup = 域内 sup，这一步论文未述，Lean 里靠 `hF` 只在边界取到（`DomainBound.lean` 第 96–97 行 `exact hF _ (le_of_eq (hcircle _ (Faber.unitPoint_norm t)))`）—— **Lean 的做法是把假设直接设在圆周上，绕开最大模原理**）  |
|  $\gamma=\|F[A]\|$ 与 $a>0$ | 第 329、355 行 | 最后一步要除以 $a^2$；$d_N\le(a/\gamma)\sqrt{d_N}$ 要 $\gamma>0$ | $\gamma=0$ 已在前置分情形排除；$a=0$ 已由 $G=F$ 的测试排除。**若没有 eq:singular（只有一个 attainer），$a>0$ 的论证出不来**：$x^*F[A]x$ 不一定是 $\gamma$  |
| $a^2=\sum_{k\ge0}\HS{M_k}^2$（含 $k=0$） | 第 341 行 | 与 `eq:cross-L2` 的 $4\HS{M_0}^2\ge\HS{M_0}^2$ 配对 | 若 $a^2$ 从 $k=1$ 起：交叉下界变 $\sum_{k\ge1}\HS{M_k}^2$，仍然成立但**丢掉 $M_0$ 的控制**；则 $a$ 可以很小而 $M_0$ 很大，最终比较与 $\gamma$ 脱钩（$\gamma$ 是通过 $y^*F[A]x=\gamma$ 进入 $M_0$ 的）。第 157 行专门强调 "including its constant coefficient"，就是在防这个改动 |
| 权重 $\tfrac12$（`eq:weighted-dual`） | 第 395–397 行 | 与 `prop:coefficients` 右端的 2 配平成 self-dual 测试 | 若测试取 $C_k=\bar P_k$（不带 $\tfrac12$）：paired value $=\HS{P_0}^2+\sum_{1}^{N}\HS{P_k}^2$，加权测试范数 $=\HS{P_0}^2+2\sum\HS{P_k}^2$，两者不等 ⇒ 得到 $\sum\HS{P_k}^2\le(a/\gamma)^2\cdot(\text{另一范数})$，无法闭合（会出现循环的范数定义）。**$\tfrac12$ 的唯一理由就是 $2$ 的倒数** |
| 因子 $4$（`eq:diagonal-L2`） | 第 416–421 行 | Parseval 对 Hermitian 对称化 $P+P^*$ 的双计数 | 若不加 $P^*$（直接估 $P$ 的边界范数）：正性 $\Delta\succeq0$ 里对角块是 $P+P^*$ 而不是 $P$，**根本没有 $P$ 的范数可用**；这就是为什么必须对称化、必须付这个 4 |
|  $J=\diag(I_m,-I_m)$ | 第 440 行 | 产生 $-2\HS{M+L^*}^2$ | 若用 $J=\diag(I_m,\mu I_m)$（$\|\mu\|=1$）：$J\Delta J$ 的交叉项变成 $-\bar\mu F-\mu G$ 型，迹里出现 $\mu$；只能取实 $\mu=\pm1$ 才给 $-2$。若用其他 Hermitian 对称 $J$（例如置换型）会得到 $0\le\tr(\Delta J\Delta J)=\HS D^2+\HS E^2-2\HS F^2$ 的同型或更弱式 —— **这个特定 $J$ 就是"对角 − 交叉"的投影**  |
| $\Delta^{1/2}$（三明治） | 第 442 行 | 把 $J\Delta J\succeq0$ 转成 $\tr\ge0$ | 需要 $\Delta$ 有正半定平方根（有限维平凡）。[分析] 这一步的替代是"$\tr(\Delta J\Delta J)=\HS{\Delta^{1/2}J\Delta^{1/2}}^2$?"不对；实质是 $\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\HS{(J\Delta J)^{1/2}\Delta^{1/2}}^2\ge0$。Lean 里用 `re_trace_mul_nonneg`（`PositiveBlocks.lean` 第 22–27 行：$A,B\succeq0\Rightarrow0\le\tr(AB)$ 的实部）与 `re_trace_block_comparison`（第 29–33 行），把 $\Delta^{1/2}$ 一步省掉、直接用 $\tr(D\cdot DJDJ)$ 型分解 —— **Lean 比论文更省：它只用 $A\succeq0,B\succeq0\Rightarrow\tr(AB)\ge0$，绕开平方根**（平方根在 Lean 里需要 `Real.sqrt` 与算子连续函数演算）。素材：这是一处可记录的"形式化绕行"，见第四节 |
| 最后 $2a^2\le8a^2/\gamma^2$ | 第 446–451 行 | 给 $\gamma\le2$ | 若只有 $FG$ 一侧（一个对角块）⇒ 正性比较不可用；若 $L$ 侧被估成上界（而非丢弃）⇒ 方向反 |
| $n,m$ 只以"$n\times m$ 矩阵"身份出现 | 全文 | 所有步骤关于 $m$ 一致 | 任何引入 $\sqrt m$、$\log m$ 的步骤都会毁掉完整性。清点上面所有不等式：HS 乘积界、Cauchy–Schwarz、Parseval、$\HS{A^*}=\HS A$、$J\Delta J$ 的迹展开 —— **全部与 $m$ 无关**。这是本文"complete"的证明论证据 |

#### (d) 候选失败路线 [推测]

1. [推测] **只用一个达到范数的向量（Lorist–Schwenninger 式，第 104–105 行提到）。** 失败机制：需要 $x^*F[A]x=\gamma$，这只在 $F[A]$ 有达到范数的特征向量（特别地正规/次正规情形）时成立。$2\times2$ 幂零上 $F[A]=\begin{pmatrix}0&2\\0&0\end{pmatrix}$ 没有单位向量使 $x^*F[A]x=2$（事实上 $|x^*Fx|\le1$）。所以**必须**引入 $y$，进而必须有两个块 $P,Q$，进而必须有两个有序乘积 $FG,GF$，进而必须付 Parseval 的因子 4 —— 这条因果链解释了 $\gamma\le2$ 的**必然性**（而不是巧合）。论文对此没有一句话解释（**论文未述**），只在第 104–106 行并列了三篇的做法（attainer / top singular pair / attainer after similarity reduction）作为选择证据。
2. [推测] **对 $A$ 做相似变换 $SAS^{-1}$ 把域变成圆盘。** 失败机制有两处硬伤：(i) $R+R^*\succeq0$ 的正性**只对原矩阵 $A$** 成立（eq:support 里 $z=v^*Av$ 必须是 $A$ 的数值范围点；换成 $SAS^{-1}$ 后二次型不再是 $v^*(SAS^{-1})v\in W(A)$），第 292 行的强调就是这条；(ii) 系数嵌入 $C\mapsto1\otimes C$ 与相似 $S\otimes I_m$ 不交换 —— 相似作用在底空间，数值范围也变，但 $P[A]$ 的范数不变性需要 $S$ 只作用第一因子，条件数 $\kappa(S)$ 就进了常数。`Badea–Crouzeix–Delyon` 用椭圆把 $\kappa(S)\le2$ 做出来（第 86–88 行），但那是 $n=2$ 的特殊几何。
3. [推测] **用 Schur 分析 / 单位圆上的算子值 Schur 算法。** 走这条路需要把 $M_m$-值的 Schur 函数与底空间算子 $A$ 做交换子提升，正是要证的"完全"性质；且在 $L^2(\T;M_m)$ 中，$\|T\|\le1$ 的提升需要 $T$ 是**完全非扩张**的。$K$ 是标量核 ⇒ $T$ 自动完全压缩，但交换子提升还需要 $A$ 生成的代数包含 $T$ —— 本文用"奇异对 + 系数配对"直接给出泛函数表示，跳过提升定理。
4. [推测] **用 Pick 插值把 $\max_{\partial\Omega}\|F\|\le1$ 转成 Nevanlinna–Pick 矩阵正性。** NP 正性是一族**分块矩阵正性**（Sz.-Nagy–Pejcsov 型），形式上与本文的 $\Delta\succeq0$ 相似；但 NP 给的是**存在性**（存在插值函数 $\iff$ NP 矩阵正），而本文要的是**给定** $F$ 的范数估计，方向相反：需要"从 $F$ 的存在推出矩阵正"，即 NP 的**逆向**，一般只在 $m=1$ 或超酉结构下等价。而且 NP 路线需要 $\Omega$ 上的函数代数及其完全有界基，`lem:approx` 的外逼近又要重做。本文用 $R+R^*\succeq0$（正向、由凸性给出）恰好是"免费的那一半正性"。
5. [推测] **直接对 $F[A]$ 用 $\|F[A]\|=\sup_{\|x\|=\|y\|=1}|y^*F[A]x|$ 的双变分而不固定配对。** 失败机制：$a$ 依赖于所选 $(x,y)$（$a^2=\sum\HS{Y^*b_k(A)X}^2$），若让 $x,y$ 随 $G$ 变化，$a$ 也变，`eq:diagonal-functional` 与 `eq:weighted-dual` 就不是同一个 $a$，配平崩。**必须固定 $(x,y)$、只让 $G$ 变** —— 这正是第 329 行那句 `choose unit singular vectors` 在证明结构里的作用。[分析：这是我在 2.5 里唯一的"读法警告"，笔记展开时值得强调。]

### 2.6 引理 `lem:approx`：解析凸外逼近

#### (a) 精确陈述（`main.tex` 第 457–461 行照抄）

```tex
\begin{lemma}[Analytic convex outer approximation]\label{lem:approx}
Let $K\subset\C$ be nonempty, compact, and convex. There are bounded convex open domains $\Omega_j$ with regular real-analytic Jordan boundaries such that $K\subset\Omega_j$ and
\[
 \sup_{z\in\overline\Omega_j}\dist(z,K)\longrightarrow0.
\]
\end{lemma}
```

注意假设只有三条：`nonempty, compact, convex` —— **允许空内部**（点、线段）。第 455 行的动机句原文：
```tex
Theorem~\ref{thm:domain} applies on an analytic convex neighborhood. We now construct such neighborhoods even for compact convex sets with empty interior, and then shrink them to $W(A)$.
```
这条引理是"complete 包含点与线段数值范围"这句摘要宣称的**唯一技术兑现处**。

#### (b) 证明机制逐步重建（第 463–511 行）

**构造（第 464–469 行）。** 给定 $0<\delta<1$：
1. 取单位方向的**有限** Euclidean $\delta$-网 $D_\delta\subset\T$，且要求 $1,-1,i,-i\in D_\delta$；
2. 支撑函数 $s_K(\nu)=\max_{z\in K}\Re(\bar\nu z)$（$K$ 紧 ⇒ 最大值取得到）；
3. 选 $t_\delta>0$ 使 $|D_\delta|e^{-t_\delta\delta}<1$；
4. 定义
$$\Phi_\delta(z)=\sum_{\nu\in D_\delta}\exp\bigl(t_\delta(\Re(\bar\nu z)-s_K(\nu)-\delta)\bigr),\qquad \Omega_\delta=\{z:\Phi_\delta(z)<1\}.$$

这是一个**指数和的次水平集**：每项 $\exp(t_\delta(\text{仿射}(z)-\text{const}))$ 是正实解析的凸函数（实部仿射后再 exp，Hessian 是 $\nu\nu^{\mathsf T}$ 的正倍数），有限和仍正实解析凸。

**性质清点，逐条补：**

(1) $K\subset\Omega_\delta$：$z\in K$ 时 $\Re(\bar\nu z)-s_K(\nu)\le0$，故每项 $\le e^{-t_\delta\delta}$，和 $\le|D_\delta|e^{-t_\delta\delta}<1$。$\checkmark$ **这就是 $t_\delta$ 那个不等式的唯一用途**，也把 $|D_\delta|$ 的有限性用上了（若网无限，$|D_\delta|=\infty$，无法选 $t_\delta$）。

(2) 次水平集 $\subset$ 支撑不等式族：$\Phi_\delta(z)\le1$ ⇒ 每项正且 $\le1$ ⇒ $t_\delta(\Re(\bar\nu z)-s_K(\nu)-\delta)\le0$ ⇒ $\Re(\bar\nu z)\le s_K(\nu)+\delta$（$\forall\nu\in D_\delta$）。$\checkmark$（这里 $t_\delta>0$ 才能除掉，且**不需要** $t_\delta$ 的具体大小 —— 只要 $>0$。素材：$t_\delta$ 只通过 (1) 起作用。）

(3) 有界性（第 475–482 行）：四个轴向给出
$$\min_{w\in K}\Re w-\delta\le\Re z\le\max_{w\in K}\Re w+\delta,\qquad \min_{w\in K}\Im w-\delta\le\Im z\le\max_{w\in K}\Im w+\delta.$$
即 $\nu=1$ 给上界 $\Re z\le s_K(1)+\delta=\max\Re w+\delta$；$\nu=-1$ 给 $-\Re z\le -\min\Re w+\delta$；$\nu=\pm i$ 同理管虚部。故**一个固定的矩形**（只依赖 $K$，不依赖 $\delta<1$）包含所有闭次水平集。$\checkmark$
**这是四个轴向的第二个用途**（第一个见下面的 Hessian）。仅有两个非共线方向不够：那只能给出一个**楔形**，无界。要同时界住 $\pm\Re,\pm\Im$ 必须这四个方向（或任何正向张成 $\mathbb R^2$ 的集合）。

(4) 严格凸 + 实解析（第 484 行）：`The Hessian is a sum of positive multiples of $\nu\nu^{\mathsf T}$ after identifying $\C$ with $\mathbb R^2$. The four axis directions ensure it is positive definite.`
$$\nabla^2\Phi_\delta(z)=\sum_{\nu\in D_\delta}t_\delta\,E_\nu(z)\,\nu\nu^{\mathsf T},\qquad E_\nu(z)=\exp(\cdots)>0.$$
对任意实向量 $\xi\ne0$：$\xi^{\mathsf T}\nu\nu^{\mathsf T}\xi=(\nu\cdot\xi)^2$；取 $\nu=1$ 与 $\nu=i$ 两项得 $\ge t(E_1\xi_1^2+E_i\xi_2^2)>0$。$\checkmark$ **这是四个轴向的第一个用途，且 $\pm$ 里其实只用一个即可**（$1$ 与 $-1$ 给同一个 $\nu\nu^{\mathsf T}$）。所以 $1,-1,i,-i$ 这组的选择是"两个用途的并"：Hessian 正定只需 $\{1,i\}$，有界性需要 $\{1,-1,i,-i\}$。

(5) 水平集正则（第 486 行）：`The gradient cannot vanish at level one: a critical point of a differentiable convex function is a global minimum, whereas every point of $K$ has value less than one.` 即若 $z\in\{\Phi=1\}$ 且 $\nabla\Phi(z)=0$，凸性 ⇒ $z$ 是全局极小 ⇒ $\Phi(z)\le\Phi(w)$ 对所有 $w$，但 $K$ 非空且有 $w\in K$ 使 $\Phi(w)<1=\Phi(z)$，矛盾。$\checkmark$ 隐函数定理 ⇒ $\{\Phi_\delta=1\}$ 是正则实解析曲线。
**$K$ nonempty 在这里被用了一次**（另一次在 (1)）。若 $K=\varnothing$，整个引理无意义。
**严格凸性在这一步并没有被用到**，用的是"凸 + 存在值更小的点"。严格凸的作用是保证 (6) 的唯一性与 (7) 的光滑形状？再看论文：严格凸用在下一段。素材记录：论文把 (4) 的严格凸性写在 (5) 之前，(5) 本身只需凸性；顺序是为了让读者先有"好的形状"。

(6) Jordan 曲线（第 486 行后半）：开次水平集有界、凸、有内点（$K\subset\Omega_\delta$ 且 $\Omega_\delta$ 开，非空开集当然有内点）。固定内点后每条射线**恰一次**穿过水平 1：
- 存在性：射线方向 $e^{it}$，$\{z:\Phi_\delta(z)\le1\}$ 有界 ⇒ 沿射线足够远处 $\Phi>1$；$\Phi$ 连续、起点处 $<1$ ⇒ 中间值。
- 唯一性：次水平集是**凸**的（只需凸性！），凸集与射线的交是区间，含起点（内点侧），故边界交点唯一。
- 从紧边界到圆的径向投影是连续双射 ⇒（紧 → Hausdorff）**同胚** ⇒ Jordan 曲线，且 $\overline\Omega_\delta=\{\Phi_\delta\le1\}$。$\checkmark$
- 素材记录：`convexity and boundedness give existence and uniqueness` 一句里，boundedness 管存在、convexity 管唯一 —— 两个前面单独建立的性质在这里各管一半。$\{\Phi\le1\}$ 紧 = 闭 + 有界（(3)）。

(7) 距离估计（第 488–509 行）：核心三行不等式，逐行还原：
取 $z\in\overline\Omega_\delta\setminus K$，$w\in K$ 为最近点，$d=|z-w|$，$\nu=(z-w)/d$，$\mu\in D_\delta$ 使 $|\mu-\nu|\le\delta$，$v\in K$ 达到 $s_K(\mu)$。
- **投影不等式**：$w+t(v-w)\in K$（$0\le t\le1$，$K$ 凸），$w$ 最近 ⇒ $|z-(w+t(v-w))|^2\ge d^2$ ⇒ $-2t\Re(\overline{z-w}(v-w))+t^2|v-w|^2\ge0$ ⇒ 除以 $t$ 令 $t\to0^+$：$\Re(\bar\nu(v-w))\le0$。$\checkmark$（**这里用 $K$ 凸**，且是全文唯一用到 $K$ 凸性的地方之一。）
- 第一行：$(1-\delta)d\le\Re(\bar\mu(z-w))$：$\Re(\bar\mu\nu)=1-\Re(\bar\mu\nu-1)=1-\Re((\bar\mu-\bar\nu)\nu)=1-\Re(\bar{\mu-\nu}\,\nu)$，而 $|\bar{\mu-\nu}\nu|\le|\mu-\nu|\le\delta$ ⇒ $\Re(\bar\mu\nu)\ge1-\delta$，乘 $d$。$\checkmark$（这里 $|\nu|=1$ 起作用；也说明 $\delta<1$ 必需，否则 $1-\delta\le0$ 不等式变平凡。）
- 第二行：$\Re(\bar\mu(z-w))\le\Re(\bar\mu(v-w))+\delta$：由 $z\in\overline\Omega_\delta$ 得**支撑不等式** $\Re(\bar\mu z)\le s_K(\mu)+\delta$；又 $s_K(\mu)=\Re(\bar\mu v)$；故 $\Re(\bar\mu(z-v))\le\delta$，而 $\Re(\bar\mu(z-w))=\Re(\bar\mu(z-v))+\Re(\bar\mu(v-w))$。$\checkmark$
- 第三行：$\Re(\bar\mu(v-w))\le\delta|v-w|$：$\Re(\bar\mu(v-w))=\Re(\bar\nu(v-w))+\Re((\bar\mu-\bar\nu)(v-w))\le0+|\mu-\nu||v-w|\le\delta|v-w|$（用投影不等式）。$\checkmark$
- 末行：$|v-w|\le\operatorname{diam}K$。合并：$d\le\frac{\delta(1+\operatorname{diam}K)}{1-\delta}$，$z\in K$ 时 $d=0$，取上确界得论文式子，$\delta\to0$ 收敛到 0。$\checkmark$
- 取 $\delta_j=1/(j+1)$（论文写 `Taking, for example, $\delta_j=1/(j+1)$`，"for example" 说明序列选择不重要，只要 $\to0$ 且 $<1$）。

**这段三行不等式是全引理最"手工"的地方**：它把"$\mu$ 是 $\nu$ 的近似"与"$z$ 在次水平集里"两条信息拼成 $d$ 的上界，用了一个精妙的插入点 $v$（支撑点）而不是 $w$ 本身。我读到这里的第一反应是"为什么不用 $|z-w|\le\dist$ 的定义直接算"——因为 $K$ 只给方向支撑，不给距离；插入 $v$ 是把**方向误差 $\delta$** 转成**距离误差 $\delta\cdot(1+\operatorname{diam}K)$** 的桥梁。

#### (c) 常数与假设的机械理由

| 对象 | 位置 | 作用 | 崩点 |
| --- | --- | --- | --- |
|  $D_\delta$ **有限** | 第 464 行 | (1) 里的 $\|D_\delta\|$ 可被 $e^{-t_\delta\delta}$ 压住；Hessian 是有限和；$\Phi$ 是实解析的指数和 | 无穷网：$\|D_\delta\|=\infty$，无法选 $t_\delta$；且级数一致收敛/解析性都要重证  |
| $\{1,-1,i,-i\}\subset D_\delta$ | 第 464 行 | 两用：Hessian 正定（$\{1,i\}$ 够）、次水平集被固定矩形包住（需四个） | 少 $\pm i$：虚向无界 ⇒ (6) 的"有界"与 $\overline\Omega_\delta$ 紧失效 ⇒ 不能做径向投影，Jordan 不成立 ⇒ `lem:exterior-collar` 不可用 |
|  $t_\delta$ 满足 $\|D_\delta\|e^{-t_\delta\delta}<1$ | 第 464 行 | 保证 $K\subset\Omega_\delta$（**严格**包含，不是 $\le$） | 若只 $\le1$：$K$ 可能触到水平集 $\{\Phi=1\}$ ⇒ (5) 的"存在值 $<1$ 的点"失效 ⇒ 梯度可能在水平 1 处为零 ⇒ 隐函数定理不可用；且 `lem:exterior-collar` 需要 $z_*\in\Omega$（有内点、严格内部）以及 `lem:resolvent` 需要 $\dist(W(A),\partial\Omega)>0$。**这个严格不等号是全文"外逼近"方向性的根**  |
| $0<\delta<1$ | 第 464 行 | 距离估计里的 $1-\delta>0$；$\delta_j=1/(j+1)$ 满足 | $\delta\ge1$ 时 $(1-\delta)\le0$，第一行不等式不再约束 $d$ |
|  $\delta$ 的双重身份 | 第 464、466、473 行 | 既是**网的分辨率**（$\|\mu-\nu\|\le\delta$），又是**支撑松弛量**（$\Re(\bar\nu z)\le s_K(\nu)+\delta$、指数里的 $-\delta$）。这是刻意的：让近似误差与支撑松弛同一量级，最终 $O(\delta)$ | 若两个 $\delta$ 取不同量级（比如网用 $\delta^2$ 而松弛用 $\delta$），距离界仍是 $O(\delta)$，无改善；但写法会变复杂 —— [分析] 论文把两者合并，是为了让"误差 = 分辨率 = 松弛"三条线只跟一个参数，少一个自由度  |
| $s_K(\nu)$ 用 $\max$（取得到） | 第 464 行 | $v$ 的存在（第 491 行 `Choose $v\in K$ attaining $s_K(\mu)$`） | $K$ 不紧 ⇒ 支撑值可能不取到 ⇒ 第三行的 $\Re(\bar\mu(v-w))$ 无 $v$ 可用 |
| $K$ 凸 | 投影不等式（$w+t(v-w)\in K$）与 $\Omega_\delta$ 凸 | 非凸 ⇒ $w$ 的投影最小性不再给出方向不等式（对非凸集，最近点的法向不是支撑向）⇒ 距离估计崩 | 这正是为什么必须先用 Toeplitz–Hausdorff 证 $W(A)$ 凸（第 514 行）再用本引理 |
| $\operatorname{diam}K$ 出现 | 第 501、507 行 | 把角度误差 $\delta$ 换成距离误差 | 无界 $K$ 时 $\operatorname{diam}K=\infty$；但主定理里 $K=W(A)$ 自动紧有界 |
| $\Phi_\delta$ 的 exp 结构 | 第 466 行 | 实解析 + 凸 + Hessian 显式 | 若改用多边形外逼近（$\Re(\bar\nu z)\le s_K(\nu)+\delta$ 的交）：得到的是**凸多边形**，边界有角点 ⇒ 非"正则实解析 Jordan" ⇒ `lem:exterior-collar` 不可用。**这是本引理必须用光滑化（指数和）而不是多边形的全部理由**，也是论文绕开"最自然做法"的一处 |

#### (d) 候选失败路线 [推测]

1. [推测] **为什么不直接用 Minkowski 和 $K+\overline{D(0,\varepsilon)}$？** 那给出凸紧集、$\dist\to0$，但边界只是 $C^1$-piecewise（一般是 Lipschitz，甚至有平直段接圆弧的角），**不是实解析 Jordan 曲线** ⇒ `lem:exterior-collar` 的 Schwarz 反射不能做 ⇒ 没有领子 ⇒ 没有 $|s_{kj}|\le C_\rho\rho^{k+j}$。失败机制是"正则性不足"，不是"逼近不够好"。
2. [推测] **为什么不用卷积磨光（Mollifier）+ 支撑函数？** 标准做法是 $\Phi=\rho*K$ 的水平集，但磨光后的集合边界的实解析性需要解析核（高斯核），而高斯卷积的次水平集**凸性不显然**（需要 Prékopa 型论证或 $K$ 的支撑函数直接磨光）。论文的指数和构造把"凸"与"解析"两个性质都变成**逐项显然**的，代价是要手工做距离估计（第 488–509 行）。[分析：我认为这是"直接"风格的又一体现 —— 用可逐项验证的初等构造代替一般定理。]
3. [推测] **为什么不用代数曲线（把 $\Phi$ 换成多项式的次水平集）？** 多项式次水平集一般**无界**（例如 $z\mapsto\Re z^2$ 的水平集无界），要造有界凸代数域需要特殊技巧；而指数项 $\exp(t\Re(\bar\nu z))$ 在支撑方向外侧**增长极快**，天然有界。$t_\delta$ 那个选择就是这种增长的体现。

### 2.7 定理 `thm:main` 的证明：凸性重证 + 极限 + 最优性

#### (a) 陈述见 1.1（`eq:main`）。证明在第 513–531 行，分三段。

**第一段：重证 Toeplitz–Hausdorff（第 514–518 行）。** 论文为什么要重证？因为 `lem:approx` 需要 $K=W(A)$ **凸**，而它不愿引用一个定理名字就把凸性当已知（`We recall a short proof of the Toeplitz--Hausdorff convexity theorem \cite{Toeplitz1918,Hausdorff1919}.` —— "recall a short proof" 是作者自陈这段是**回顾**而非新贡献）。逐字重构：
1. 紧致性：`Compactness of $W(A)$ follows from compactness of the unit sphere.`（连续像：$u\mapsto u^*Au$ 在紧球面上）
2. 两点连线：取 $W(A)$ 中两值，压缩 $A$ 到它们测试向量的张成空间。$\dim=1$ 平凡。
3. $\dim=2$：二次型在单位向量 $(u,v)$ 上是
$$(2\Re(\bar uv),\ 2\Im(\bar uv),\ |u|^2-|v|^2)$$
的**复值实仿射函数**。核对：$u^*Bu=b_{11}|u|^2+\bar b_{12}\bar u v+b_{21}\bar v u+b_{22}|v|^2$，用 $|u|^2=\frac{1+z}2,|v|^2=\frac{1-z}2$（$z=|u|^2-|v|^2$）与 $\bar uv=\frac{x-iy}2$（$x=2\Re\bar uv,\ y=2\Im\bar uv$）改写为常数 + 线性项 $\checkmark$。
4. 这三个量跑遍 $\mathbb R^3$ 的**整个单位球面**（恒等式 $x^2+y^2+z^2=(|u|^2+|v|^2)^2=1$，且每个球面点都可反解出 $(u,v)$）$\checkmark$。
5. `The linear part of a map from $\mathbb R^3$ to $\mathbb R^2$ has a nonzero kernel. Any point of the unit ball can be moved in a kernel direction to the sphere without changing its image.` ⇒ 球面像 = 球体像。
6. 球体在仿射映射下的像凸 ⇒ 球面像凸 ⇒ 该 $2\times2$ 压缩的数值范围凸；其两点连线属于压缩的数值范围，从而属于 $W(A)$（因为 $W(P^*AP)\subset W(A)$：把压缩空间的单位向量嵌入原空间）$\checkmark$。

素材要点：第 5 步"沿核方向推到球面"是**仿射几何的免费一步**，比标准教材的"椭圆参数方程证明"短；这也解释了为什么它出现在一篇 Crouzeix 论文里而不是背景引用 —— 作者**只需要**凸性，不需要椭圆描述（特征多项式判据那套）。

**第二段：极限（第 520–524 行）。**
```tex
Apply Lemma~\ref{lem:approx} with $K=W(A)$. By scaling Theorem~\ref{thm:domain},
\[
 \|P[A]\|\le2\max_{z\in\overline\Omega_j}\|P(z)\|.
\]
If this maximum is zero, each entry of $P$ vanishes on an open set and the polynomial is identically zero, making the inequality immediate. Otherwise divide $P$ by the maximum to invoke that theorem. All $\overline\Omega_j$ lie in one compact set. Uniform continuity of the fixed function $z\mapsto\|P(z)\|$, the containment of $K$, and the uniform distance convergence imply convergence of these maxima to $\max_K\|P\|$. This proves \eqref{eq:main} without any interior assumption on $K$.
```
拆开：
- **缩放**：令 $M_j=\max_{\overline\Omega_j}\|P\|$；$M_j>0$ 时 $F=P/M_j$ 满足 $\|F(z)\|\le1$ on $\partial\Omega_j$（因为在**整个** $\overline\Omega_j$ 上 $\le1$），`thm:domain` 给 $\|F[A]\|\le2$，即 $\|P[A]\|\le2M_j$。
  **注意方向**：`thm:domain` 的假设是边界上的 $\le1$，而这里给的是**闭包上的 $\le1$**，比边界更强，所以不需要最大模原理。素材：这是刻意的省事（论文未述），Lean 侧同样把假设写在"边界 = 圆周"上（`DomainBound.lean` 第 96–97 行只用 `hcircle` 把点拉回圆周），完全避开最大模原理。
- $M_j=0$ 的分情形是**必需的**（要除 $M_j$）：论证"$\overline\Omega_j$ 有内点 ⇒ $P$ 的每个元（标量多项式）在一个开集上为 0 ⇒ 恒为 0"。这里用到 $\Omega_j$ 是**开**集（`lem:approx` 的产出），线段 $K$ 自己没有内点但 $\overline\Omega_j$ 有。
- 收敛：三个输入 —— (i) $\overline\Omega_j$ 都在一个公共紧集里（`lem:approx` 第 482 行的固定矩形！这是那一步的**第二次**用途）；(ii) $z\mapsto\|P(z)\|$ 在该紧集上一致连续；(iii) $\sup_{\overline\Omega_j}\dist(z,K)\to0$ 且 $K\subset\overline\Omega_j$。于是
  $$\max_K\|P\|\le\max_{\overline\Omega_j}\|P\|\le\max_K\|P\|+\omega_{\overline\Omega}\bigl(\sup_{\overline\Omega_j}\dist(\cdot,K)\bigr)\xrightarrow[j\to\infty]{}\max_K\|P\|.$$
  这里 $\omega$ 是一致连续模。$\checkmark$ 然后 $\|P[A]\|\le2\lim_jM_j=2\max_{W(A)}\|P\|$。
- `This proves \eqref{eq:main} without any interior assumption on $K$.` —— 呼应摘要的 "including matrices whose numerical ranges are points or line segments"。

**第三段：最优性（第 526–530 行）。**
```tex
For sharpness take $n=2$, $m=1$, $P(z)=z$, and
\[
 A=\begin{pmatrix}0&2\\0&0\end{pmatrix}.
\]
Its norm is two, while $|x^*Ax|=2|x_1x_2|\le1$ for every unit $x$, with equality at $x_1=x_2=1/\sqrt2$. Thus the right-hand maximum in \eqref{eq:main} is one. No smaller universal constant is possible.
```
核对：$A^*A=\begin{pmatrix}0&0\\0&4\end{pmatrix}$ ⇒ $\|A\|=2$ ✓；$x^*Ax=2\bar x_1x_2$，$2|x_1x_2|\le|x_1|^2+|x_2|^2=1$ ✓，等号在 $|x_1|=|x_2|=1/\sqrt2$ ✓（论文写 $x_1=x_2=1/\sqrt2$，取实正数即可）。右端 $\max_{W(A)}|z|=1$，左端 $\|P[A]\|=\|A\|=2$ ⇒ 比值恰 2 ⇒ 任何一致常数 $\ge2$。
素材要点：这个 $A$ 的数值范围是**闭圆盘 $\overline{D(0,1)}$**（论文未明说，但由 $|x^*Ax|\le1$ 与等号在某个方向取得、加上 $W(A)$ 凸且含 0 可推；严格说 $W\begin{pmatrix}0&2\\0&0\end{pmatrix}=\{z:|z|\le1\}$ 是标准事实）。论文只算了最大值 $=1$，够用。
**最优性只用 $m=1$**（标量系数！）⇒ 一旦 $n,m$ 都自由，标量下界立刻给出完整下界；这与"完整性的难点在 $m$"形成有趣的不对称：**上界难在 $m$，下界只需 $m=1$**。素材记这条到第三节/第五节。

#### (c) 各步骤的机械理由

| 对象 | 位置 | 崩点 |
| --- | --- | --- |
| $W(A)$ 紧（球面紧） | 第 514 行 | 不紧 ⇒ `lem:approx` 的 $s_K$ 与 $\max$ 无定义 |
| $W(A)$ 凸（Toeplitz–Hausdorff） | 第 514–518 行 | 非凸 ⇒ `lem:approx` 不能用（2.6 的投影不等式失效），且 $\Omega_j$ 无法凸 ⇒ `lem:faber` 的 $K\ge0$ 失效 |
| $\dim 2$ 情形的 $(x,y,z)$ 参数化 | 第 515–517 行 | 若压缩空间维数 $>2$：仿射映射 $\mathbb R^{2d^2-1}\to\mathbb R^2$ 的"球面像=球体像"不再显然（需要 $d$ 足够小使核能推出去），这正是为什么证明必须先压缩到 $\le2$ 维 |
| $\overline\Omega_j$ 在公共紧集内 | 第 523 行 | 若无公共紧集，一致连续模 $\omega$ 无法统一，$\max_{\overline\Omega_j}\to\max_K$ 可能慢/不成立。依据是 `lem:approx` 第 482 行的固定矩形 |
| $M_j>0$ 的分情形 | 第 524 行 | 若 $P\equiv0$ 而强行除 $0$ ⇒ 无意义。[分析] 这段的写法透露作者对"最大值为零"是**先处理掉再归一化**，而不是用 $\varepsilon$ 扰动，保持证明的初等性 |
| 最优性用 $m=1$ | 第 526 行 | 若只证 $n$ 固定时的下界，结论"cannot be decreased uniformly over $n,m$, and $d$" 就缺 $m$ 侧的支撑；不过 $m=1$ 的下界对更大的 $m$（取 $m\times m$ 纯量矩阵）自动成立 ⇒ 一个论证覆盖全部 |

#### (d) 候选失败路线 [推测]

1. [推测] **为什么不用现成的 Toeplitz–Hausdorff 证明（特征多项式/椭圆描述）？** 标准证明给出"$2\times2$ 数值范围是椭圆盘，焦点在特征值"，信息更多但也需要更多铺垫；本文只需要凸性，于是选了"仿射映射 + 球/球体像相同"这条最短路径。可能的另一层原因：**这段要出现在一篇会被形式化的论文里**，而 Lean 侧对应的 `Geometry.convex_quadratic_range`（`CompleteBound.lean` 第 61–63 行引用）是一个独立模块，论文的重证相当于给出该模块的可对照陈述。
2. [推测] **为什么不用紧性 + Arzelà–Ascoli 直接从解析域取极限（比如令 $\Omega_j$ 的边界收敛到 $W(A)$ 并取 $h_j$ 的子列）？** 那需要共形映射的 Carathéodory 紧性（核收敛），把边界几何收敛性当作前提，比"一致连续 + 距离收敛"重得多。论文只让 $\Omega_j$ 存在、只在**最大值**这一层取极限，完全不让 $h_j$ 参与极限过程 —— $h_j$ 在每一步内部被用完就丢。这是"直接"的第三个体现：**极限只作用在数值上，不作用在几何对象上。**
3. [推测] **为什么不在退化情形（点/线段）单独证明？** 线段 $K$ 时可选 $\Omega$ 为细长椭圆、$h$ 显式（Joukowski 型），本可给一个更精的论证；但那样要处理"$W(A)$ 落在线段上"时 $A$ 的结构（此时 $A$ 正规到一个仿射像？实际 $W(A)$ 是线段 $\iff A$ 正规的等价类结果），复杂度高于统一的外逼近。论文第 524 行 `without any interior assumption on $K$` 的自得语气，说明作者明确把"不分支处理退化情形"当作卖点。

### 2.8 引言里那段"元证明"（第 130–161 行）与正文的对应

第 130–161 行 `\subsection*{How the coefficients give the sharp bound}` 是全文的**路线图**，逐句对应如下（素材可直接引用这张映射表）：

| 引言原句（节选） | 对应正文位置 |
| --- | --- |
| `First place $W(A)$ strictly inside an analytic convex domain $\Omega$.` | `lem:approx`（§4）与 `thm:domain` 假设 |
| `An exterior conformal map $h$ parametrizes its boundary by the unit circle.` | `lem:exterior-collar`（附录） |
| `Expanding the Cauchy kernel at infinity defines scalar polynomials $b_k$ of degree $k$.` | eq:faber ⇒ `lem:faber` 第 1 步 |
| `For $k\ge1$, the boundary value $b_k\circ h$ has the positive Fourier term $\lambda^k$ and an otherwise strictly negative expansion.` | eq:boundary-basis（**严格负**，无零频） |
| `a nonnegative kernel with integral one in each variable makes the map from the positive part to the negative part an $L^2$ contraction` | $K$ 的三个性质 ⇒ `prop:coefficients` 第一、二步 |
| `its squared boundary Hilbert--Schmidt norm lies between the square sum of its coefficient norms and that sum with weight two on every nonconstant coefficient` | `eq:coefficient-estimate` |
| `For a polynomial $F$ normalized by its boundary operator norm, choose a unit top singular pair $x,y$ for $F[A]$.` | `thm:domain` 第 0 步 |
| `The resolvent $R(\lambda)=\lambda h'(\lambda)(h(\lambda)I-A)^{-1}$ supplies the coefficient arrays representing the three functionals $y^*G[A]x$, $x^*G[A]x$, and $y^*G[A]y$.` | `lem:resolvent` + eq:pairing（**三个泛函数**：$M,P,Q$） |
| `The first is bounded by a coefficient Hilbert norm. Testing it on $FG$ and $GF$ separately gives bounds for the other two.` | 第 3、4 步（eq:crossfunctional、eq:ordered-products） |
| `Their squared dual coefficient norms have reciprocal weights: one on the constant coefficient and one half on the others.` | `eq:weighted-dual` |
| `These are exactly the weights in the squared Fourier norms of the corresponding Hermitian diagonal compressions, after a common factor of four.` | `eq:diagonal-L2` |
| `The numerical-range condition makes $R+R^*$ positive, so its compression to a two-by-two block bounds the off-diagonal boundary norm by the two diagonal norms.` | `lem:resolvent` 正性 + 第 6 步 $\Delta$ |
| `The cross term retains all coefficients of the first functional, including its constant coefficient.` | `eq:cross-L2`（$a^2$ 含 $M_0$） |
| `The resulting inequality gives the sharp bound two.` | $2a^2\le8a^2/\gamma^2$ |
| `Section~\ref{sec:limit} then shrinks analytic convex neighborhoods to an arbitrary numerical range and proves sharpness with a two-by-two nilpotent matrix.` | `lem:approx` + `thm:main` |
| `Appendix~\ref{sec:collar} supplies the exterior collar using classical conformal mapping and reflection theorems.` | 附录 |

引言第 111–112 行的方法自述与 2.5(d) 的对照：
```tex
Here a Faber coefficient estimate controls the two diagonal functionals obtained by placing a test
polynomial on each side of the polynomial being estimated.
```
`on each side` 就是 $FG$ 与 $GF$；`the polynomial being estimated` 是 $F$。素材：这是全论文里对"为什么需要两个乘积"最直白的一句话。

## 三、叙事时间线（论文自述的史、障碍与自我定位）

**总原则**：本节只收录 `main.tex` 与 `references.tex` 里**确实写了**的句子，逐字引用并注行号。论文没写的一律标"论文未述"，不补任何外部叙事。

### 3.1 论文的动机叙述（第 42–46 行）

```tex
It is a compact convex set containing the spectrum. For a normal matrix,
the spectral theorem controls polynomial evaluation by values on the
spectrum. For a nonnormal matrix, the spectrum alone cannot provide the
same control: even a nonzero nilpotent matrix has spectrum $\{0\}$.
The numerical range retains enough information to give a universal bound.
```

这是全文唯一的"为什么要求这个定理"的说明，且完全是**信息论式**的：谱不足以支撑非正规矩阵的多项式估计，数值范围"保留了足够的信息"。**注意论文没有说**"这是 20 年公开猜想""广泛应用于 GMRES"等等（**论文未述**）——它没有应用动机段落，第 20–22 行的导言只有 15 行正文加一段"Earlier bounds"。

### 3.2 问题的精确提法（第 55–56 行）

```tex
The complete Crouzeix conjecture asks whether the constant two holds
uniformly in the coefficient dimension $m$, the base dimension, and the degree.
```

"conjecture … asks whether" —— 论文把本文工作表述为**回答一个存在已久的问句**，但在别处（摘要）说 `This resolves the complete Crouzeix conjecture in its matrix formulation`。**素材记一处措辞张力**：导言用"asks whether"（问句），摘要用"resolves"（已解决）；从初稿到定稿的升格痕迹？[推测]

### 3.3 史段落全文（第 74–112 行，标题 `Earlier bounds and related arguments`）

逐字引用，按论文自己的顺序（这个顺序就是作者心中的因果链）：

```tex
Crouzeix formulated the scalar constant-two question in 2004 and proved a
universal complete bound of $11.08$ in 2007
\cite{Crouzeix2004,Crouzeix2007}.
Positive boundary representations developed by Delyon and Delyon
\cite{DelyonDelyon1999} supply an important part of the numerical-range
method. Crouzeix and Palencia combined a positive double-layer potential
with the Cauchy transform of conjugate boundary data to obtain the
complete bound $1+\sqrt2$ \cite{CrouzeixPalencia2017}; Ransford and
Schwenninger simplified its final norm argument
\cite{RansfordSchwenninger2018}.
For all base matrices of order two, Badea, Crouzeix, and Delyon obtained
the complete constant two. In the nonnormal case, they make the conformal
image of the matrix a contraction by a similarity with condition number at
most two, using the numerical-range ellipse \cite{BadeaCrouzeixDelyon2006}.
```

四个动词条值得逐条批注：
- `formulated … in 2004 and proved a universal complete bound of $11.08$ in 2007`：年份与数字都写死，是全文唯一给出的历史常数。
- `supply an important part of the numerical-range method`：**"供应重要部件"**，不是"提供定理"。这与第 291–293 行的用法一致（只借核、不借表示定理）。
- `combined a positive double-layer potential with the Cauchy transform of conjugate boundary data`：这是作者对 Crouzeix–Palencia 的**机制描述**，用"combine"点出该路线的两个部件。本文只保留第一个部件（正双层位 = $R+R^*\succeq0$），**丢掉了第二个**（Cauchy 变换 + 共轭边界数据）—— 这是"直接"的最小说法证据：全文没有出现过 Cauchy 变换的算子范数估计。
- `simplified its final norm argument`：Ransford–Schwenninger 只改最后一步，量级不变。
- `they make the conformal image of the matrix a contraction by a similarity with condition number at most two, using the numerical-range ellipse`：Badea–Crouzeix–Delyon 的机制被概括为"相似变换 + 条件数 ≤ 2 + 数值范围椭圆"。作者写这句时**明知**本文不走这条路（本文不构造 $S$），所以这段的功能是"标出岔路口"。

接着是 2026 年的三篇标量证明与一篇 $n\le3$：

```tex
Recent scalar proofs include work of Jin \cite{Jin2026},
Lorist and Schwenninger \cite{LoristSchwenninger2026}, and Luo
\cite{Luo2026}.
Lorist and Schwenninger's Theorem~3 applies to scalar rational functions
of bounded Hilbert-space operators; their Section~3(iv) explains why the
commutation used in that proof does not automatically persist under
amplification. \AA hag, Czy{\.{z}}, and Virtanen prove the complete
inequality for base matrices of order at most three, with arbitrary
coefficient dimension \cite[Theorem~1.1]{AhagCzyzVirtanen2026}.
The scalar results fix $m=1$, while the latter complete result restricts
the base dimension; Theorem~\ref{thm:main} leaves these dimensions independent.
```

**这是全文最重要的一段"障碍陈述"**：`their Section~3(iv) explains why the commutation used in that proof does not automatically persist under amplification` —— 作者**明确承认**标量证明里有一处交换步骤在矩阵放大下失效，并把它作为本文必须绕过的机制障碍引用出来。注意引用的不是"结论"而是别人的**讨论小节**（Section 3(iv)），这种引用方式是"我要解决这个问题"的自证。

然后是技术工具的认领与差异：

```tex
The use of Faber polynomials in numerical-range functional calculus has
precedents in \cite{Beckermann2005,BeckermannCrouzeix2014}.
Lorist and Schwenninger use a norm-attaining vector in their scalar
argument \cite[Lemma~1]{LoristSchwenninger2026}, while Luo chooses an
explicit top singular pair \cite[Section~3, equations~(21)--(22)]{Luo2026}.
In their complete constant-two proof for weighted shift matrices, Crouzeix
and Greenbaum use a scalar extremal function and a norm-attaining vector
after a similarity reduction
\cite[Section~3, proof of Theorem~2]{CrouzeixGreenbaum2025}.
Here a Faber coefficient estimate controls the two diagonal functionals obtained by placing a test
polynomial on each side of the polynomial being estimated.
```

素材批注：这一段是**方法论的选型表**。作者列出三种"提取 $\gamma$"的办法（attainer / explicit top singular pair / scalar extremal function + attainer after similarity），然后用 `Here …` 说自己用第四种（**两侧各放测试多项式的 Faber 系数估计**）。引用精度极高：`Lemma 1`、`Section 3, equations (21)--(22)`、`Section 3, proof of Theorem 2` —— 这三处说明作者**读过对手证明的选向量环节**并逐一对比。结合 2.5(d) 第 1 条（单 attainer 在非正规 $F[A]$ 上给不出 $\gamma$），可判断：作者之所以把这段写进导言，是因为**他知道"选谁"是有后果的技术选择，不是风格选择**。

关于 Grunsky 的认领与摆脱（第 236–243 行）：

```tex
These mixed coefficients are differentiated Grunsky coefficients.
The classical normalization gives a weighted coefficient inequality
\cite[equations~(1.1)--(1.3)]{BeckermannStylianopoulos2018};
the unweighted estimate used here follows from convexity and the two
angular marginal identities.
```

`the unweighted estimate used here follows from convexity and the two angular marginal identities` —— 全文明确说自己的核心估计只依赖"凸性 + 两个角向边际恒等式"，这是一句**自我设限式**的技术声明（不使用任何更深的系数定理）。第 236 行的另一处克制：

```tex
The usual normalization chooses the phase of $h$ so that $c>0$ \cite{Beckermann2005,BeckermannCrouzeix2014}.
```

作者指出经典做法会归一化相位，然后**没有采用**（全文只要求 $c\ne0$）。素材：这是"故意不做归一化"的一处，值得在笔记里当作"作者克制"的证据。

### 3.4 与同族论文的关系（第 114–128 行）

已在 1.3 逐字引用。补充两处机制细节：

```tex
For comparison with \cite[Proposition~3.1]{OpenAI2026Complete}, the
companion's exterior map $G$ and variables $t,w$ correspond to
$h,\lambda,\mu$, respectively.
The mixed correction is $s(\lambda,\mu)=B(\mu,\lambda)$, so
$s_{kj}=\beta_{jk}$ in that paper's notation. In particular,
\eqref{eq:kernel-fourier-action} uses this coefficient orientation and
does not require symmetry of the kernel.
```

`companion`（同伴论文）这个词本身是叙事证据：两篇是同一计划的两个产物，且本文写了**记号对照表**来避免交叉引用出错 —— 说明两篇并行写作时曾发生过记号冲突。[推测]

### 3.5 "we do not know / no elementary" 类句式的清点

**穷尽搜索结果**：全文 `main.tex` 里
- **没有** "we do not know"、"we do not see"、"it is unclear"、"we leave"、"open problem"、"no elementary" 这类**自陈不知道**的句子；
- 唯一表示"未做/未采用"的句子是第 236 行 `The usual normalization chooses the phase of $h$ so that $c>0$`（说明自己没这么做）与第 115 行 `A separate structural proof of the complete inequality is given in \cite{OpenAI2026Complete}`（承认存在另一条路）；
- 唯一带"必要性/困难"色彩的是第 95–96 行 `explains why the commutation used in that proof does not automatically persist under amplification` 与第 69–70 行 `a scalar proof need not survive matrix amplification`。

素材结论（重要）：**这篇论文通篇不使用"承认无知"的修辞**。所有不确定性都被转写成"我们选择 X 而不是 Y"的技术陈述。这与 D 类笔记里常见的"作者坦承障碍"文体截然不同，写作时应注意：不能替论文编造 "we do not know"。

第 163 行有一处**把负担推给附录**的措辞：

```tex
Appendix~\ref{sec:collar} supplies such a coordinate for every domain under consideration. Here we use it to compare polynomial coefficients with boundary norms.
```

`Here we use it to compare polynomial coefficients with boundary norms.` —— "这里我们只用它来比较系数与边界范数"：作者在本节开头就限定本节的目的，是典型的"分工声明"。

第 534 行附录开头：

```tex
We record the classical conformal inputs and prove the continuation and global injectivity required in Section~\ref{sec:coefficients}.
```

`classical … inputs` 与 `prove the continuation and global injectivity` 并列：作者承认 Riemann/Carathéodory/Schwarz 是经典的，但**延拓与整体单叶要自己证**。这三件事正是 2.1 里最长的三段（步骤 3、4、5）。

### 3.6 参考文献表的规模与倾向（`references.tex` 全文 105 行）

共 17 条。分布清点：
- 经典（1918–2007）：Toeplitz 1918、Hausdorff 1919、Ahlfors 1979、Delyon–Delyon 1999、Crouzeix 2004、Crouzeix 2007、Badea–Crouzeix–Delyon 2006 —— 7 条；
- 2014–2018：Beckermann–Crouzeix 2014、Beckermann–Stylianopoulos 2018、Crouzeix–Palencia 2017、Ransford–Schwenninger 2018 —— 4 条；
- 2025–2026：Crouzeix–Greenbaum 2025、Åhag–Czyż–Virtanen 2026、Jin 2026、Lorist–Schwenninger 2026、Luo 2026、OpenAI2026Complete —— 6 条。

三处可核实的细节：
1. `Beckermann2005` 与 `BeckermannCrouzeix2014` 各只被引用一次，用途都是"Faber 多项式进入数值范围演算的先例"（第 102–103、236 行），**没有借用其任何定理**。
2. 全部 2026 年文献都带 arXiv/Preprints 版本号与**具体日期**（如 `arXiv:2608.27346v4, September 21, 2026`、`Preprints.org 202607.1919, version 4, August 7, 2026`），说明本文写作时对同期工作的追踪到"版本 4"这种粒度。
3. **没有**任何关于 $C$-spectral set、GMRES、伪谱的一般综述被引（`Beckermann2005` 的标题里有 GMRES，但引用点与其无关）。这与 3.1 的"无应用动机"一致。

### 3.7 LaTeX 源文件本身的叙事痕迹

- 第 25 行 `\pdftrailerid{}`：清空 PDF trailer ID，用于**可复现构建**（byte-identical builds）。工程实践痕迹。
- 第 22 行 `\numberwithin{equation}{section}` 与第 18–21 行的四个定理环境：`theorem/lemma/proposition` 编号共用，`remark` 也被声明但**全文没有一处 `\begin{remark}`** —— 声明了未用，说明写作过程中删掉了 remark 环境的内容（[推测]）。
- 第 23 行 `\setlength{\emergencystretch}{2em}`：排版最后微调的痕迹。
- 第 7 行 `\usepackage{microtype,booktabs,tikz}` 与第 8 行 `\usetikzlibrary{arrows.meta}`：只为一张图（`figures/normal.tex`）。全文**唯一插图**就是那张支撑线示意图，且 caption 是解释性的：
```tex
\caption{The map $h$ sends the exterior of the circle to the exterior of the domain; the supporting line is shown schematically. Increasing the circle radius gives the outward normal $q(\lambda)$; convexity places every $z\in\overline\Omega$ on the inner side of the line.}
```
caption 里 `shown schematically` 与图里 `\draw[dashed]` 的虚线支撑线对应 —— 作者特意声明这是**示意图**（不是精确图形）。素材：全文一张图，且服务于 eq:support 这个"唯一一次凸性使用"，图的分配也体现了证明的重心。
- 图本身画的是 $\D$（圆）经 $h$ 到 $\Omega$（椭圆），$\lambda$ 在 $(1.05,0)$、$h(\lambda)$ 在椭圆右端点、$q(\lambda)$ 水平向右箭头、$z$ 在椭圆内部偏上 —— **法向朝右、$z$ 在左**，与不等式 $\Re(\bar q(h(\lambda)-z))\ge0$ 的符号方向一致。第 174 行的引用句：`Figure~\ref{fig:normal} illustrates this supporting-line relation.`
- `\input{figures/normal.tex}` 出现在第 176 行（正文中部），`\input{references.tex}` 在第 622 行（`\appendix` 之后）—— 参考文献被拆成独立文件，与 722 篇语料库的统一构建方式一致（[推测]）。
- `main.typ` / `main.pdf` / `fig` 存在于同级 `typst/` 目录：同一论文有 LaTeX 与 Typst 两个版本。素材记录：本次任务指定读 tex，未读 Typst 版本的差异；如需比对 Typst 版是否措辞相同，需要另开一次采集（**未做**）。

### 3.8 论文的"未述"清单（写作时必须避免编造）

以下都是我在读时想知道、但论文**一个字都没说**的：
- Crouzeix 猜想的原始陈述（$m=1$ 情形的公开问题形式）与其历史年份之外的细节；
- 为什么 2 是"自然"常数（除了第 530 行的 $2\times2$ 幂零例子）；
- `prop:coefficients` 的权重 2 是否可能被改进（2.3(d) 第 4 条是我的反证推测，**论文未述**）；
- $b_k(A)$ 的几何衰减界对 $A$ 的一致性问题（只在第 304 行以"for the fixed $A,h$"回避，未讨论为何不能一致）；
- 单 attainer 为何不够（只在第 104–106 行并列别人的做法，未点出机制）；
- 若 $A$ 在 Hilbert 空间（无限维）中是否成立 —— 注意论文标题与定理都是 matrix（$M_n$），摘要 `in all finite base and coefficient dimensions` 明确限定**有限**；而 `LoristSchwenninger2026` 被描述为适用于 `bounded Hilbert-space operators`（第 93–94 行）—— 即**别人的定理比本文覆盖面更广（无限维底空间），本文只做有限维**。这是一个论文未展开但客观存在的取舍，必须在笔记里如实标注，不能粉饰成"本文更强"。
- 数值范围等于线段/点时的直接证明（全部通过外逼近绕开，未单独处理，第 524 行以 "without any interior assumption" 一句带过）。




## 四、Lean 取证：形式化与论文叙述的错位、卡点与绕行

**取证范围**：`E:\math\lean\OAI\Analysis\DirectCrouzeix\`（42 个 `.lean`，合计 7431 行）、`E:\math\lean\ComparatorChallenges\DirectCrouzeix.lean`（题面文件，1397 字节）、`E:\math\lean\ComparatorChallenges\DirectCrouzeix.json`（15 行配置）、`E:\math\lean\formalization.yaml`（书目第 82–85 行、比较器条目第 1110–1112 行）、`E:\math\lean\OAI.lean` 第 75 行、`lean-toolchain`、`lakefile.lean`。所有行号均为本次实测。

### 4.0 题面文件：一个"自带定义的 sorry"

`ComparatorChallenges/DirectCrouzeix.lean` 是**盲测题面**，它自己重抄了五个定义再挂两个 `sorry`：

```lean
def numericalRange {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) : Set ℂ :=
  {z | ∃ u : EuclideanSpace ℂ (Fin n), ‖u‖ = 1 ∧
    inner ℂ u (Matrix.toEuclideanCLM (n := Fin n) (𝕜 := ℂ) A u) = z}
def polynomialValue {m d : ℕ} (B : Fin (d + 1) → Matrix (Fin m) (Fin m) ℂ) (z : ℂ) :=
  ∑ k : Fin (d + 1), z ^ (k : ℕ) • B k
def tensorEvaluation {n m d : ℕ} (A : …) (B : …) := ∑ k : Fin (d + 1), (A ^ (k : ℕ)) ⊗ₖ (B k)
def rangeMaximum {n m d : ℕ} (A : …) (B : …) : ℝ :=
  sSup ((fun z => ‖polynomialValue B z‖) '' numericalRange A)
def UniversalBound (c : ℝ) : Prop :=
  ∀ (n m d : ℕ), 0 < n → 0 < m → ∀ (A : …) (B : …), ‖tensorEvaluation A B‖ ≤ c * rangeMaximum A B
theorem complete_crouzeix : UniversalBound 2 := by sorry
theorem uniform_sharpness (c : ℝ) (hc : UniversalBound c) : 2 ≤ c := by sorry
```

**取证要点（三条，都很硬）**：

1. 解侧的 `OAI/Analysis/DirectCrouzeix/Model.lean` 第 11/15/19/24/28 行逐字重复这五个定义（`numericalRange`/`polynomialValue`/`tensorEvaluation`/`rangeMaximum`/`UniversalBound`）。也就是说**"定理陈述"与"定义"都不由解题者改写**，只允许在证明体里自由。这解释了下一节的 `change` 密度：陈述给死了，所有"把目标改写成论文里的样子"的动作只能发生在证明内部。
2. **整个解目录 `sorry` 计数为 0**（实测：42 文件全文 `sorry` 出现 0 次；`native_decide` 0 次；`Axiom` 关键字 0 次）。题面里的两个 `sorry` 在 `ComparatorChallenges/`，不在 `OAI/`。写笔记时必须区分这两处，否则会把"题面占位"误读成"证明未完成"。
3. 题面**只给了 `rangeMaximum`（用 `sSup`）而不给 `max`**。这个决定把论文里"连续函数在紧凸集上取到最大值"变成了解侧必须自己证的引理（`NumericalRange.lean` 的 `rangeMaximum_attained`），而且见 4.4：最终证明**根本没有依赖"取到最大值"**，只用 `sSup + ε/2` 松弛。这是题面写法诱导出的一个证明路线差异。

配置 `ComparatorChallenges/DirectCrouzeix.json` 全文：

```json
{ "challenge_module": "ComparatorChallenges.DirectCrouzeix",
  "solution_module": "OAI.Analysis.DirectCrouzeix.Main",
  "theorem_names": ["OAI.DirectCrouzeix.complete_crouzeix",
                    "OAI.DirectCrouzeix.uniform_sharpness"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false }
```

- `definition_names: []` ⇒ 验收**不检查定义本身的形式化**（定义由题面给定，抄过来即可），只检查两个定理名。**全库实测**：`ComparatorChallenges/*.json` 共 **405** 个，其中 `definition_names` 非空的只有 **9** 个（如 `Brenier.json` 列 `OAI.Problem358.E / uniformMeasure / IsSupported`，`DefocusingNLS.json` 列 `sobolevProduct / schrodingerFlow / sobolevOddPower`，`Naimark.json` 列 `IsSimpleCStar / IsState / IsFaithfulTracialState`）。⇒ 本文属于 **396/405 的常态**，不能读成"本文特殊地不要求定义"；但它确实意味着**"数值范围"这一概念在验收里没有独立地位**。
- `theorem_names` 有两条 ⇒ **上界与最优性同等地位**：Crouzeix 的常数 2 不可改进这件事（论文第 530 行的一句话）在验收里是一个独立定理 `uniform_sharpness`。这在 Lean 侧被实装为 `Sharpness.lean`（96 行 9 条声明）。
- `permitted_axioms` 恰好是 Mathlib 的标准三件套（外延性、`Quot` 可靠性、选择公理）。**全库实测**：405 个 json 里 `permitted_axioms` 只有 **2 个互异取值**，而这两个只是**同一三元组的字序差异**（`propext, Classical.choice, Quot.sound` 与 `propext, Quot.sound, Classical.choice`）。⇒ "允许哪些公理"**不是本文的个性化约束**，而是整个语料库的统一策略；笔记里不要把它写成"本篇特别保守/特别宽松"。真正有区分度的字段只有 `theorem_names`、`enable_nanoda` 与 `solution_module`。⇒ 不允许引入任何新公理；`Classical.choice` 被点名允许，见 4.6 它具体在哪里被消费。
- `enable_nanoda: false` ⇒ 不使用 `nanoda`（把 `MeasureTheory` 积分/测度自动化外挂的第三方库）；本论文的测度论全部走 Mathlib 本体。这一点对本文特别关键：证明的核心对象是**圆上的积分**（`circleMeasure`、Parseval），一旦允许 nanoda 就会改变写法。

`formalization.yaml` 侧：第 82–85 行是**书目条目**（`title / authors:["OpenAI"] / id: ../preprints/…/paper.pdf / type: article`），没有 Lean 字段；Lean 映射在文件后半的比较器清单第 1110–1112 行：

```yaml
    - comparator_config: ComparatorChallenges/DirectCrouzeix.json
      declaration: OAI.DirectCrouzeix.complete_crouzeix
      file: OAI/Analysis/DirectCrouzeix/CompleteBound.lean
```

⇒ **注意一个不一致**：`yaml` 的 `declaration` 只列 `complete_crouzeix`，而 `json` 的 `theorem_names` 列了两个（含 `uniform_sharpness`）。也就是说"入口声明"与"验收声明"不等价：yaml 指向单一入口，json 要求两条都成立。素材记为管线设计细节，不要读成"最优性次要"。

顺带清点同族：yaml 里 Crouzeix 相关条目有**三条**，不是两条 —— 第 82 行 `A direct proof of the complete Crouzeix inequality`（比较器第 1110 行，`OAI.DirectCrouzeix.complete_crouzeix`）、第 652 行 `The complete Crouzeix theorem: optimal similarity and a common positive boundary representation`（比较器第 1542 行，`OAI.StructuralCrouzeixReference.challenge`，文件 `OAI/Analysis/StructuralCrouzeix/Endpoint.lean`）、以及第 1038 行的 `ComparatorChallenges/CompleteCrouzeix.json` → `OAI.CompleteCrouzeix.main` → `OAI/Analysis/NumericalRange/Main.lean`（对应某篇"数值范围"论文）。**仓库里有三套并行的 Crouzeix 形式化**。这一事实本身对笔记有用：同一猜想族被拆成三个独立挑战，`OAI/Analysis/NumericalRange/` 与 `OAI/Analysis/DirectCrouzeix/` 是两套互不相干的定义与证明（各自的 `numericalRange` 各写一遍）。

### 4.1 模块拓扑与论文结构的量级差

- 解侧 `Main.lean` 全文 42 行、**0 条声明**，只是 41 条 `import`；`OAI.lean` 第 75 行 `import OAI.Analysis.DirectCrouzeix.Main` 把整个包接入根。`Main.lean` 的 import 顺序即拓扑顺序（每个文件只 import 它前面的模块）。
- 论文：`main.tex` 624 行、1 个正文 figure（`\input{figures/normal.tex}`）、`\appendix` 后接 `references.tex`（105 行）；正文定理环境只有 6 个具名对象（`lem:faber`、`prop:coefficients`、`lem:resolvent`、`thm:domain`、`lem:approx`、`lem:exterior-collar`，其中两个在附录）+ `thm:main`。
- 量级比：**7431 行 Lean / 624 行 tex ≈ 12:1**；**42 个文件 / 6 个具名定理 ≈ 7:1**。这不是"翻译膨胀"，而是膨胀集中在**几何分析基础层**：论文里当作已知事实引用的东西（Riemann 映射在边界的正则性、Carathéodory、Laurent 展开、Montel 紧性、Poisson/Herglotz 表示、凸集支撑函数）在 Lean 侧自建了约 1400–1900 行。

按依赖层次把 42 个文件分五层（层次是我按 import 关系归的，论文无对应分层）：

| 层 | 文件（行数） | 对应论文位置 |
|---|---|---|
| ① 题面/基础 | `Model`(39) `NumericalRange`(71) `PositiveBlocks`(69) `Resolvent`(155) `HilbertSchmidt`(121) `SingularPairs`(124) `Duality`(86) `Sharpness`(96) | §2 记号、`eq:singular`、块正定一句话、第 530 行最优性 |
| ② Fourier/能量引擎 | `CircleFourier`(182) `BoundaryEnergy`(140) `PolynomialEnergy`(226) `DomainCore`(170) `KernelContraction`(203) `TaylorFourier`(167) `CompactIntegrals`(214) | `thm:domain` 证明的第 326–453 行（四段 `\emph`） |
| ③ Faber/解析层 | `FaberPolynomials`(208) `FaberCalculus`(197) `FaberEnergy`(225) `BoundaryKernel`(255) `DividedDifferences`(165) `ExteriorCollar`(121) `PolynomialCalculus`(108) | `lem:faber`、`prop:coefficients`、`lem:resolvent` |
| ④ 共形几何层 | `NormalFamilies`(260) `DiskMapping`(290) `ExtremalEmbedding`(246) `PoissonBoundary`(246) `HarmonicReflection`(213) `HolomorphicReflection`(270) `Continuation`(181) `ConformalCollar`(263) `AnalyticCharts`(253) `ExponentialLevels`(178) `BoundaryParametrization`(156) `InverseExterior`(188) `ExteriorMapping`(228) | `lem:exterior-collar`（附录第 536–621 行）与其前置事实 |
| ⑤ 装配层 | `SupportNets`(191) `Convexity`(273) `ExponentialSupport`(176) `OuterApproximation`(173) `DomainBound`(142) `CompleteBound`(120) | `lem:approx`（第 457–511 行）、`eq:support`、第 513–531 行 |

**"论文一句话 = Lean 一个模块"的实测清单**（这一列在笔记里最能说明两套叙述的信息密度差）：

| 论文的一句话 | tex 位置 | Lean 侧为它存在的模块 |
|---|---|---|
| "There is nothing to prove if $\gamma=0$." | 329 | `DomainCore.lean:33` `by_cases hγ0 : γ = 0`（1 行，但决定了后面所有除法的前提） |
| "choose unit singular vectors $x,y$" | 329–332 | `SingularPairs.lean` 的 `exists_norm_attainer`（`:30`）+ `exists_singular_pair`（`:51`）（124 行，含 `matrixify`（`:80`）/`entryPair`（`HilbertSchmidt.lean:45`）桥接） |
| "Write $x=\sum Xe_i\otimes e_i$" | 333 | `HilbertSchmidt.lean` 的 `hsVector`/`matrixify`/`hsSq_eq_norm_hsVector_sq`（121 行） |
| "Invertibility of $B$ proves positivity." | 320 | `Resolvent.lean` 21 条声明（`quadratic` 六件套 + `posSemidef_of_unit_quadratic` + `supported_matrix_posSemidef` + `positive_resolvent`），155 行 |
| "their coefficient sequences are square summable" | 337 | `CircleFourier.lean` 的 `matrix_circle_parseval` + `BoundaryEnergy.lean:90` `finite_negative_bessel` |
| "Cauchy–Schwarz gives \eqref{eq:crossfunctional}" | 351–352 | `PolynomialEnergy.lean:121` `cross_boundary_estimate` 与 `Duality.lean:15` `weighted_coefficient_dual`（变分选择写死为 `C k := (w k)⁻¹ • (P k).map star`） |
| 凸性"数值范围是凸集" | 第 514–522 行重证 | `Convexity.lean` 13 条声明 273 行（Bloch 球 `bloch`(`:84`)/`norm_bloch`(`:90`)/`bloch_surjective_sphere`(`:101`)/`threeLinear_ker_ne_bot`(`:137`)/`twoForm_bloch`(`:144`)/`convex_twoForm`(`:160`)/`convex_quadratic_range`(`:201`）——论文里这是 Toeplitz–Hausdorff 的经典一句话 |
| "由紧性取 δ 邻域" | 519 前后 | `IsCompact.exists_thickening_subset_open`（Mathlib 本体，`CompleteBound.lean:82` 一行调用） |
| "外共形坐标 $h(\zeta)=c\zeta+g(1/\zeta)$ 存在" | `lem:exterior-collar` | `InverseExterior`(9 条集合性质) + `ConformalCollar`(`exists_riemann_collar`) + `DiskMapping`(`exists_riemannMap`) + `ExtremalEmbedding` + `NormalFamilies`(Montel) + `AnalyticCharts` + `Continuation` ≈ 1600 行 |
| "把 $F$ 按 Faber 基展开" | 347 | `DomainCore.lean:119` `faber_expansion_of_degree`（33 行，需要 `Polynomial.Sequence`、`Submodule.span_degreeLT`、`mem_span_range_iff_exists_fun`） |

### 4.2 陈述层的一致性核对（逐条）

**主定理**。Lean：`complete_crouzeix : UniversalBound 2`，展开即

$$\forall n\,m\,d,\; 0<n \to 0<m \to \forall A\in M_n(\C),\; \forall B:\Fin(d+1)\to M_m(\C),\quad \|\textstyle\sum_k A^k\otimes B_k\|\le c\cdot \sup_{z\in W(A)}\|\sum_k z^k B_k\|.$$

与论文 `eq:main` 比对得到的差异（三处，都是**Lean 更宽**）：

1. **不要求 $0<d$**。$d=0$ 时 $A^0\otimes B_0 = 1\otimes B_0 = B_0$，$\text{rangeMaximum}=\|B_0\|$，结论退化为等式。论文若把 $d$ 写成"正整数"，Lean 覆盖的情形更多（因为系数序列用 `Fin (d+1)` 索引，$d$ 只是上界）。[推测] 题面选 `Fin (d+1) →` 而不是 `Polynomial`，就是为了免去"次数恰好为 d"的歧义。
2. **$B$ 是系数函数而非多项式**。`polynomialValue` 用 `z ^ (k:ℕ) • B k` 求和；论文把 $F$ 当 $M_m(\C)$-值多项式。解侧为了同时使用两种观点，专门写了 `PolynomialCalculus.lean` 的 `coefficientPolynomial` / `tensorPolynomial`，并在 `OuterApproximation.lean:128` 加了 `@[simp] matrixPolynomialValue_coefficientPolynomial` 把两套写法缝合（`CompleteBound.lean:88` 与 `:94` 各用一次 `rw`）。**这是"论文一句话对应 Lean 一个转换层"的典型**：论文里 $F[A]$ 一个记号，Lean 里 `tensorEvaluation A B`（题面）= `tensorPolynomial A (coefficientPolynomial B)`（内部）两种写法。
3. `UniversalBound c` 的 $c$ 是 `ℝ` 且**不带 $c\ge0$ 假设**。所以 `uniform_sharpness` 必须先证 `0 ≤ c`（`Sharpness.lean:84–87`：`by_contra` + `mul_nonpos_of_nonpos_of_nonneg` + `linarith`）。论文完全不会意识到这是个问题。

**`thm:domain` 与 `expLevel_domain_bound`：本文最大的陈述错位。** 论文第 323–325 行原文：

```tex
\begin{theorem}[The bound on an analytic convex domain]\label{thm:domain}
For positive integers $n,m$, let $\Omega\subset\C$ be bounded, open, and convex with regular real-analytic Jordan boundary, and let $A\in M_n(\C)$ satisfy $W(A)\subset\Omega$. For every $M_m(\C)$-valued polynomial $F$ with $\|F(z)\|\le1$ on $\partial\Omega$, one has $\|F[A]\|\le2$.
\end{theorem}
```

Lean 侧**没有任何一个定理**陈述"bounded open convex + regular real-analytic Jordan boundary"。它有的是 `DomainBound.lean:63`：

```lean
theorem expLevel_domain_bound {n m : ℕ} (hn : 0 < n) (hm : 0 < m)
    (A : Matrix (Fin n) (Fin n) ℂ) {ι : Type u_144} [Fintype ι]
    (v : ι → ℂ) (b : ι → ℝ) (hc : IsCompact {z | Geometry.expLevel v b z ≤ 1})
    (hW : ∀ z ∈ numericalRange A, Geometry.expLevel v b z < 1)
    (F : MatrixPolynomial m)
    (hF : ∀ z, Geometry.expLevel v b z ≤ 1 → ‖matrixPolynomialValue z F‖ ≤ 1) :
    ‖tensorPolynomial A F‖ ≤ 2
```

其中 `Geometry.expLevel`（`AnalyticCharts.lean:237`）是

```lean
def expLevel (v : ι → ℂ) (b : ι → ℝ) (z : ℂ) : ℝ := ∑ i, Real.exp (inner ℝ (v i) z+b i)
```

**取证结论（重要，值得在笔记里专门一段）**：Lean 把"解析凸域"这一几何概念**替换为它的表示定理产物**——有限个指数型仿射函数之和的次水平集。于是

- 论文的假设 "$\Omega$ 有 regular real-analytic Jordan 边界" 变成 `hc : IsCompact {expLevel ≤ 1}` + `hW : W(A)` 严格落在 `{expLevel < 1}`；
- 论文的结论前提 "$\|F\|\le1$ on $\partial\Omega$" 变成 `hF` 在**闭次水平集**上（比边界更强，但因为 `hc` 只给紧性，用整个闭包反而是 Lean 的自然写法）；
- 关键：**"边界是解析 Jordan 曲线"这件事在 Lean 里变成待证命题而不是假设**——`ExteriorMapping.lean:148` `exists_expLevel_exterior` 从 `(v,b,hc,ha)` 造出 $R>1,c\ne0,g$ 与 $h(\zeta)=c\zeta+g(\zeta^{-1})$，并要求
  `(∀ ‖η‖=1, expLevel (ψ η) = 1)` 与 `(∀ 1≤‖η‖, 1 ≤ expLevel (ψ η))`；
  它的证明链是 `inverseExterior_isOpen / _simplyConnected / _proper / _compact_closure / _analytic_boundary / zero_mem_inverseExterior` → `Conformal.exists_riemann_collar` → `exterior_laurent_form`。**即：Lean 用 expLevel 的可微性（`expLevel_contDiff : ContDiff ℝ ⊤`）把论文当作正则性假设的东西变成定理**。这解释了为什么 `AnalyticCharts.lean` 里同时存在 `expLevel` 的定义与 `analytic_complex_chart`——定义层就是为了让正则性可证。
- 代价：Lean 只覆盖**能被有限 expLevel 表示**的那类域。论文第 457–511 行 `lem:approx` 说明"$W(A)$ 总能被这类域从外面任意逼近"，Lean 侧对应 `Geometry.exists_exponential_outer`（见 4.5），因此**整体覆盖面不缩水**：`thm:main` 的凸性/逼近论证正好把这条限制吸收掉。这一点必须在笔记里说清楚，否则容易误判成"Lean 版更弱"。

**$a$ 的定义错位（我核对到的一处实质性差异）**。论文第 341–344 行：

```tex
Set $a^2=\sum_{k\ge0}\HS{M_k}^2$. We will bound the squared boundary $L^2$ Hilbert--Schmidt norms of $P+P^*$ and $Q+Q^*$ above by $4a^2/\gamma^2$ each, and that of $M+L^*$ below by $a^2$. Positivity will then compare these quantities and force $\gamma\le2$.
```

Lean `DomainCore.lean:63`：`let a := ∫ t, hsSq (M t) ∂circleMeasure`。**Lean 的 `a` 不是论文的 `a`，而是论文的 `a²`（甚至只是它的下界）**：由 `finite_negative_bessel`（`BoundaryEnergy.lean:90`，Bessel 只给 $\sum_{k<N}\le\int$）与 Parseval，$\sum_{k\ge0}\HS{M_k}^2 \le \int\hsSq(M)$。于是论文的 `$a^2$` 在 Lean 里全程写作 `a`，界写作 `4*a/γ^2`、`2*a ≤ 8*a/γ^2`（`:105–113`）。⇒ **Lean 的证明实际上把论文的"系数 $\ell^2$ 能量"换成了"边界 $L^2$ 能量"，只在需要下界的方向上使用（`hME : a ≤ ∫ hsSq (M + Lᴴ)`），从而根本不需要 Parseval 等式对 $M$ 成立**。这是一个真实的、可写进笔记的技术观察：**换成 $L^2$ 视角后，$\sum\leftrightarrow\int$ 的等号只在"对角"引理里被用到**（`anti_diagonal_energy` 是等式，见 4.3）。

### 4.3 引擎层：`analytic_domain_core` 是全文常数的产地

`DomainCore.lean:15–117` 这 101 行是**整个 Lean 证明里唯一产生常数 2 的地方**，而且它与共形几何完全解耦（假设只有 `b : ℕ → Polynomial ℂ`、`h : BoundaryCircle → ℂ`、`R : BoundaryCircle → Matrix …` 与四个抽象条件 `hexpand / hlower / hupper / hcoeff, hposfreq, hpositive`）。逐行提取的常数链：

| Lean 位置 | 事实 | 常数的来源 |
|---|---|---|
| `:40` `obtain ⟨x,y,hx,hy,hxy,hyx⟩ := exists_singular_pair T (hT ▸ hγ)` | 奇异对 $(x,y)$，$\gamma>0$ | 论文 329–332 |
| `:63` `a := ∫ t, hsSq (M t)` | 交叉能量 | 论文 $a^2$ |
| `:75` `hdiag := singular_diagonal_estimates …` | `hsSq(Xᴴb₀X) + (1/2)∑'ₖ hsSq(Xᴴb_{k+1}X) ≤ a/γ²`（X、Y 各一条） | `PolynomialEnergy.lean:183–186` |
| `:77` `hPE : ∫ hsSq(P+Pᴴ) = … ≤ 4*a/γ²` | **因子 4** | `BoundaryEnergy.lean:57` `anti_diagonal_energy` 的等式右边就是 `4 * (hsSq(coeff 0) + (1/2)∑' hsSq(coeff -(n+1)))` |
| `:86` `hQE` 同上 | 再一个 4 | 同上，用 `hdiag.2` |
| `:95` `hME : a ≤ ∫ hsSq(M+Lᴴ)` | 交叉项"下界" | `BoundaryEnergy.lean:72` `anti_cross_energy`，收尾是 `nlinarith [hsSq_nonneg (fourierCoeff M 0)]`（丢掉的正交叉项靠非负性吸收） |
| `:105` `hblock : 2*∫hsSq(M+Lᴴ) ≤ ∫hsSq(P+Pᴴ) + ∫hsSq(Q+Qᴴ)` | **因子 2** | `PositiveBlocks.lean:35` `positive_block_hsSq : 2*hsSq Z ≤ hsSq U + hsSq V`，证明里显式写了证书矩阵 `J := fromBlocks 1 0 0 (-1)`，靠 `re_trace_block_comparison D J h hJ` |
| `:111` `hb : 2*a ≤ 8*a/γ²` | 8 = 4+4 | `linarith` |
| `:116` `hg2 : γ² ≤ 4` | 除以 $a>0$ | `nlinarith [hapos]` |
| `:117` `nlinarith` | $\gamma\le2$ | 由 $\gamma^2\le4$ 与 $\gamma\ge0$ |

⇒ **C = 2 的机械来源在 Lean 里是可分离的两个因子**：一个来自 $P+P^{\mathsf H}$ 的 Parseval 展开里的 $4=\lvert1+1\rvert^2$（即"加自己的共轭转置"使对角系数翻倍，平方后出 4），另一个来自块正定的 $2\|Z\|^2\le\|U\|^2+\|V\|^2$。最终 $\gamma^2\le 8/2=4$，故 $\gamma\le2$。这与论文第 341–344 行的叙述完全一致，但 Lean 表明：**两处 2 都是等号可达的**（前者在系数只剩 $b_0$ 时取等，后者在 $U=V$、$Z$ 满秩时取等），这正是 `Sharpness.lean` 的 $2\times2$ 幂零例能 saturate 的原因（见 4.4）。笔记里"2 为什么是 2"这一段，Lean 给出了比论文更细的分解。

另外两个只在 Lean 里看得见的细节：

- `faberWeight (k:ℕ) : ℝ := if k = 0 then 1 else 2`（`BoundaryEnergy.lean:106`）。这个 1/2-权重的**不整齐**（第 0 项权 1，其余权 2）正好和 `anti_diagonal_energy` 里的 `hsSq(c₀) + (1/2)∑'ₙ hsSq(c_{-(n+1)})` 对齐；`Duality.lean:15 weighted_coefficient_dual` 把"对所有测试矩阵 $C$"的二次型界转成 $\sum_k \hsSq(P_k)/w_k\le b$，`BoundaryEnergy.lean:112` 的 `weighted_sequence_dual` 再把它写成 `hsSq (P 0) + (1/2) * ∑' n, hsSq (P (n+1)) ≤ b`。**即：论文里 $1,2,2,2,\dots$ 这个权重不是选出来的，而是被 `anti_diagonal_energy` 的等式反推出来的**——Lean 侧两处必须写成同一个 `faberWeight` 才能闭合，任何一边改成别的权重就 `linarith` 不通。这是 `prop:coefficients` 那条"权重 2"最强的一条机械证据。
- `weighted_coefficient_dual` 的证明里那个变分选择是**写死的**：`let C := fun k => ((w k : ℂ)⁻¹) • (P k).map star`，然后 `by_cases hs0 : s = 0` 分流（$s=0$ 时结论平凡、$s>0$ 时两边除以 $s$）。论文说的是"取 $C$ 为极值方向/Cauchy–Schwarz 取等"，Lean 直接给出取等的那个 $C$。**这是"论文用变分语言，Lean 用证书"的第一处典型绕行。**

### 4.4 最优性 `uniform_sharpness`：Lean 比论文多算了一步

论文第 530 行的最优性叙述只有几句（$2\times2$ 幂零 + 一次多项式给出常数不可降）。Lean 侧 `Sharpness.lean`（96 行）把这句话拆成 6 条：

```lean
def sharpnessMatrix : Matrix (Fin 2) (Fin 2) ℂ := !![0, 2; 0, 0]
def sharpnessCoefficients : Fin 2 → Matrix (Fin 1) (Fin 1) ℂ := ![0, 1]
```

- `norm_entry_le_l2_opNorm`（`:17`）：单个矩阵元 $\le$ L² 算子范数（用 `Pi.single j 1` 作单位向量 + `PiLp.norm_apply_le` + `le_opNorm`）。**这条就是"‖A⊗1‖ ≥ |A_{01}| = 2"的机器**。
- `norm_le_one_of_mem_sharpnessRange`（`:36`）：$W(\text{sharpnessMatrix})\subseteq\overline{\D}$。计算 `inner ℂ u (A u) = 2 * star (u 0) * u 1`，然后
  `nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]`（`:50`）——**Lean 用最诚实的方式证明了 $2|u_0||u_1|\le|u_0|^2+|u_1|^2=1$**。论文的"显然"在这里是一次 AM–GM。
- `sharpness_rangeMaximum_le_one`（`:61`）与 `sharpness_tensor_norm_ge_two`（`:68`）；
- `uniform_sharpness (c) (hc : UniversalBound c) : 2 ≤ c`（`:75`），中间必须先补 `0 ≤ c`（`:84`）。

**关键观察**：`sharpnessCoefficients = ![0, 1]` 意味着 $B_0 = 0,\;B_1 = 1$，所以 $F(z) = z$、$\|F\|_{W(A)} = \max_{z\in W(A)}|z|\le1$，而 $F[A] = A\otimes 1$，$\|A\otimes 1\| = 2$。⇒ **不可改进性完全发生在 $m=1$（系数维 1）且次数 $d=1$ 处**；"complete"版本的困难（$m$ 任意大）在反例侧完全不出现。这一点 Lean 写得比论文清楚，因为题面要求把反例也写成 `UniversalBound` 的实例。同时它给出一个诚实的批评素材：**下界例子与定理的难度不成比例**——上界要靠 $M_m(\C)$-值 Faber 展开，下界只用标量。[推测] 论文大概正是因此不展开这段。

### 4.5 绕行清单：论文的"存在/变分/紧性"↔ Lean 的"构造/证书/有限网格"

**（i）外逼近的完全显式构造。** `Geometry.exists_exponential_outer`（`OuterApproximation.lean:59–122`）对应论文 `lem:approx`（第 457–511 行）。Lean 侧没有任何"取充分大的参数"，全部是闭式：

```lean
obtain ⟨M,hM0,hM⟩ := hK.isBounded.exists_pos_norm_le
let L := 2*(M+1)                    -- :67
let C := 1+L+M                      -- :68
let δ := min (1/2) (ε/(2*C))        -- :70
obtain ⟨D,hD,h1,hm1,hI,hmI,hnet⟩ := exists_axis_net hδ   -- :77
let N : ℝ := Fintype.card D         -- :78
let t := (N+1)/δ                    -- :80
let v : D → ℂ := fun ν => t • (ν:ℂ) -- :83
let b : D → ℝ := fun ν => -t*(convexSupport K ν+δ)       -- :84
have hsumlt : N*Real.exp (-t*δ) < 1 := by
  rw [neg_mul,htδ,Real.exp_neg,mul_inv_lt_iff₀ (Real.exp_pos _),one_mul]
  linarith [Real.add_one_le_exp (N+1)]                   -- :89–91
```

机制拆开看：$K\subseteq\overline{B(0,M)}$；$\delta=\min(1/2,\varepsilon/(2C))$；有限网格 $D$ 是单位圆的 $\delta$-网且**强制包含 $\pm1,\pm i$**（`SupportNets.lean:53`，来自 `(isCompact_sphere (0:ℂ) 1).elim_finite_subcover` 的有限子覆盖 + `∪ {1,-1,I,-I}`）；$N=\#D$；$t=(N+1)/\delta$ 使得 $t\delta=N+1$，于是
$$N\cdot e^{-t\delta}=\frac{N}{e^{N+1}}<1\quad\text{（只用 }N+1\le e^{N+1}\text{）}.$$
从而 $z\in K$ 时 $\operatorname{expLevel}(z)=\sum_\nu e^{t(\langle\nu,z\rangle-h_K(\nu)-\delta)}\le N e^{-t\delta}<1$。

- **与论文的差异**：论文里这是"取 $t$ 充分大"的一句存在性话；Lean 给出 $t=(N+1)/\delta$ 这个**恰好等于 $\log$ 阈值的闭式**，只用一条 `Real.add_one_le_exp`。笔记可写：形式化迫使把"充分大"变成"多大"。
- **$\delta$ 里那个 $1/2$**：它保证网格与支撑面的误差在 `axis_support_bound`/`direction_net_distance` 下不失真；而 $\varepsilon/(2C)$ 里的 `2` 是给 $|b_\nu|$ 的偏移留一半（最终 `hδε : δ*C < ε`）。`C := 1+L+M` 是"半径 + 1"型的粗界，出现在把支撑函数误差转成欧氏距离的那一步（`:121` 的 `direction_net_distance`）。⇒ 这三个数（1/2、2、1+L+M）**在论文里不存在**，是 Lean 构造的副产品，第五节的常数表要单独列它们并标"仅 Lean 侧"。
- **`convexSupport` 用 `sSup` 而不是 `max`**（`SupportNets.lean:79`），并配 `convexSupport_attained`（`:81`，靠 `IsCompact.sSup_mem`）。⇒ 论文写 $h_K(\nu)=\max_{z\in K}\langle\nu,z\rangle$，Lean 写 `sSup` 再证明能取到。与 `rangeMaximum` 同样的模式，全目录里出现了至少 3 次（`rangeMaximum`、`convexSupport`、以及 `ExtremalEmbedding` 的极值泛函）。**这是"论文的 max = Lean 的 sSup + attained"这条固定绕行**。

**（ii）极值嵌入与 Riemann 映射。** 论文附录 `lem:exterior-collar` 把外共形映射当作 Carathéodory/Koebe 级别的已知。Lean 自建：`ExtremalEmbedding.lean`（`exists_injective_not_dense_image_deriv_ne_zero`、`exists_mapsTo_unitBall_injOn_deriv_ne_zero`、`exists_normalizedEmbedding`、`exists_extremalEmbedding`）→ `DiskMapping.lean`（`diskMobius` 八条性质 + `improve_embedding` + `exists_riemannMap` + `norm_tendsto_one_boundary`）→ `NormalFamilies.lean`（`bounded_holomorphic_equicontinuous`、`bounded_holomorphic_compact`、`zero_or_nonvanishing_limit`、`constant_or_injective_limit`、`strict_bound_of_normalized`）→ `ConformalCollar.lean`（`local_riemann_extension`、`exists_riemann_collar`）。
⇒ 注意 `constant_or_injective_limit` 这一条：它是 Hurwitz 型引理，说明 Lean 侧在取极限时**必须区分极限是常数还是单叶**——论文里"由正规族取子列"一句话背后的这个分岔没有被提及。这是 tactic/引理名暴露出来的**真实卡点**（[推测] 作者在写 `exists_extremalEmbedding` 时会在此卡一次）。

**（iii）边界解析性靠反射，不靠引用。** 论文把 $\partial\Omega$ 的实解析性作为假设；Lean 用 `PoissonBoundary.lean`（`poissonExtension`、`poisson_nonnegative_circle`、`herglotzExtension`、`harmonic_le_boundary`）+ `HarmonicReflection.lean`（`harmonic_reflection`、`oddUpper` 五条、`upperBall` 三条）+ `HolomorphicReflection.lean`（`logModulusUpper`、`herglotz_deriv_im_pos`、`holomorphic_reflection_modulus`）造出来，再由 `ExteriorMapping.lean:148` 消费。⇒ 论文明确把这块当输入，Lean 把它当输出。**这一条差异必须在笔记里点出**：它不代表 Lean 更强，而是代表"Lean 不接受'由正则性可知'这类输入"。

**（iv）支撑线条件的机器形式。** 论文 `eq:support`（$\Re(\overline{q(\lambda)}(h(\lambda)-z))\ge0$）在 Lean 里是 `expLevel_holomorphic_support`（`ExponentialSupport.lean:87`）的结论
`0 ≤ inner ℝ (ζ*deriv ψ ζ) (ψ ζ-w)`，
它的证明里出现了一个**参数化技巧**：`let e := fun t : ℝ => ζ*Complex.exp ((t:ℂ)*Complex.I)`，用 $e(t)=\zeta e^{it}$ 在单位圆上滑动来推出梯度与 $iq$ 正交（`horth : inner ℝ G (Complex.I*q) = 0`）。⇒ 论文里"沿边界方向微分，得切向；法向即 $q$"这句话，Lean 变成"绕一圈的子路径 + `HasFDerivAt`"。这是**第 3 类绕行**：论文用几何直观，Lean 用显式路径。
随后 `DomainBound.lean:82` 把它转成 `he : unitPoint t * deriv exterior c g (unitPoint t) = boundaryNormal c g t`，再 `simpa only [boundary, mul_comm]`——即"法向量 $q(t)$"的定义在 Lean 是 $\overline{\zeta}\,h'(\zeta)$ 的实数化，与论文写法差一个共轭位置。素材：核对 `boundaryNormal` 与论文 $q(\lambda)$ 的共轭约定是必要的（[需核对]，我未逐字比对 `Faber.boundaryNormal` 定义与 tex 第 528–540 行的 $q$ 定义）。

**（v）`choose` 与 `classical`。** 全目录 `choose` 出现 16 次、`classical` 块 13 次。`choose` 集中处是"对每个 $t$ 存在……"要变成函数的地方（例如 `ExteriorCollar`/`FaberEnergy` 里的逐点选择）。⇒ 论文的"对每个边界点取相应的……"在 Lean 需要一个选择公理实例化，这就是 `permitted_axioms` 里 `Classical.choice` 的实际消费者之一。

### 4.6 tactic 密度：从统计看卡点

全目录（7431 行）的关键 token 频次实测：

```
have 970 · rw 438 · simp 339 · exact 329 · intro 226 · simpa 204 · apply 155
let 137 · obtain 99 · change 78 · refine 59 · norm_num 52 · nlinarith 44
dsimp 42 · by_cases 36 · ext 22 · convert 19 · calc 17 · positivity 16
omega 13 · classical 13 · fun_prop 11 · sorry 0 · native_decide 0
```

以及 `noncomputable section` **143 次**（最多单文件 9 次：`CompleteBound`/`DomainBound`/`Convexity`/`OuterApproximation`/`ExponentialSupport`/`SupportNets`）。

- **`change` 78 次是异常高的**（正常 Mathlib 模块每百行 0–2 次）。含义：几乎所有目标都要先在 defeq 层面改写成"论文里的那个式子"。实测三处最能说明问题：
  - `DomainCore.lean:34` `change γ ≤ 2`（因为 `γ` 是 `let` 绑定的局部名，goal 里还是原始式子）；
  - `DomainCore.lean:67` `change ‖inner ℂ (hsVector Y) (T (hsVector X))‖^2 ≤ a * polynomialEnergy h F at hv`（把 `cross_boundary_estimate` 的一般式实例化到 $G:=F$ 后的形体重写）；
  - `DomainCore.lean:76` `change (_ ≤ a/γ^2) ∧ (_ ≤ a/γ^2) at hdiag`（用模式匹配把结论认成论文第 343 行的"$4a^2/\gamma^2$ 与 $a^2$"）；
  - `DomainBound.lean:85` `change 0 ≤ ((exterior c g (unitPoint t)-w)*conj (boundaryNormal c g t)).re at hh`（**乘法交换后才是论文的 $\Re(\bar q(h-z))\ge0$**，`:86` 靠 `simpa only [boundary, mul_comm]` 收尾）。
  ⇒ 这四处的共同点：**论文的公式与 Lean 的公式在数学上相同、 syntactically 不同**。`change` 就是把这层"翻译"显式化。笔记里"论文一行 = Lean 一步"的判断，可以直接引用 `change` 的频次作为量化证据。
- **`by_cases` 36 次，其中三处是"除法前的零分流"**：`DomainCore.lean:33`（$\gamma=0$）、`DomainCore.lean:70`（`have hapos : 0 < a := by … by_contra`，$a=0$ 时靠 `nlinarith [sq_pos_of_pos hγ]` 矛盾）、`Duality.lean:40`（`by_cases hs0 : s = 0`）。⇒ 论文分别写成 "There is nothing to prove if $\gamma=0$"、"由于 $F[A]\ne0$…"、"两边除以 $s$"。**Lean 需要三个真正的分支，其中 $a>0$ 那个还不是平凡分支而是反证**（因为后面要 `a/γ²` 与 `2a ≤ 8a/γ² ⟹ γ² ≤ 4`，若 $a=0$ 这一步除不掉）。素材：这是全文最容易被读者跳过、但形式化里必须显式处理的一处逻辑。
- **`nlinarith` 44 次集中在常数链**：`DomainCore.lean:74`（$\gamma^2\le0$ 矛盾）、`:116`（$\gamma^2\le4$）、`:117`（$\gamma\le2$）、`PositiveBlocks.lean`（块迹不等式）、`Sharpness.lean:50`（AM–GM）、`OuterApproximation.lean:76/100/114`（$\delta C<\varepsilon$ 与支撑函数放缩）、`BoundaryEnergy.lean`（`anti_cross_energy` 丢交叉项）。⇒ 凡是论文说"整理即得"，Lean 是 `nlinarith [具体的引料列表]`。**"引料"就是作者心里的隐藏中间不等式**：`nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]`、`linarith [Real.add_one_le_exp (N+1)]`、`nlinarith [hapos]`——这三条尤其值得抄进笔记，它们分别是"数值范围 ⊆ 盘""$N/e^{N+1}<1$""$a>0$ 才能除"的最短证明。
- **`positivity` 只有 16 次**、而 `norm_num` 52 次：非负性大多靠显式 `hsSq_nonneg` / `integral_nonneg` / `tsum_nonneg` / `Finset.sum_nonneg`，而不是 tactic 搜索。⇒ 论文的"由正定性"在 Lean 是**逐处指名**的。
- **`fun_prop` 11 次、`continuity`/`measurability` 各 0 次、`IntervalIntegrable` 仅 1 次**：连续性/可测性**全部写成显式假设** `hP : Continuous P`、`hh : Continuous h`、`hR : Continuous R`。⇒ 这就是 `analytic_domain_core` 顶部那一长串假设里三个 `Continuous` 的由来。可积性证据不靠 tactic，而是靠手写的桥接引理 `integrable_of_continuous_compact`（`CompactIntegrals.lean:19`，全目录出现 18 次）与 `continuous_integrable_compact`（`PolynomialEnergy.lean:103` 用法：`continuous_integrable_compact _ (continuous_hsSq.comp ((continuous_matrixPolynomialValue H).comp hh))` —— 一条 3 层的函数复合手动喂给引理）。⇒ 论文的"$\|F\|\le1$ 且连续，故可积"= Lean 的一个显式 `Continuous` 参数字段 + 一次三层 `comp`。这是**第二类绕行**：**积分号下的连续性在论文里是免费的，在 Lean 里是假设清单里的一项**。同类：`circleMeasure` 出现 33 次（归一化圆周测度，见第五节关于"没有 $2\pi$"的条目）。
- **`convert … using 1 ; ring` 的模式**（`DomainBound.lean:211/213` 在 `PolynomialEnergy`、`OuterApproximation.lean` 的 `convert!`）：`ring` 处理不了复数与实数的除法式，需要 `convert` 用 1 个 `ℕ`-参数误差容忍。⇒ 论文"$\rho=\ldots$ 代入即得"的位置。

### 4.7 源码卫生：分片拼接的取证痕迹（与数学无关但必须记录）

这一小节记录的**不是数学内容**，但它支持一个结构性推断：Lean 侧的模块边界 ≈ 生成任务边界。

1. **重复 preamble**。`CompleteBound.lean` 第 5–53 行有 **7 个** `noncomputable section` 与 6 组完全相同的
   ```lean
   open Set Filter Metric
   open scoped Topology ComplexConjugate
   ```
   块，中间没有任何内容。`DomainBound.lean`、`Convexity.lean`、`OuterApproximation.lean`、`ExponentialSupport.lean`、`SupportNets.lean` 各有 9 个 `noncomputable section`（同样的堆叠）。单文件声明只有 1–2 条。⇒ 每个"分片"自带 preamble，拼接时未去重。
2. **`end` 与 `noncomputable section` 的机械配对**。实测五份装配层文件的计数：

   | 文件 | `noncomputable section` | `namespace` | 裸 `end` | 具名 `end` | 开/闭 |
   |---|---|---|---|---|---|
   | `CompleteBound.lean` | 9 | 2 | 9 | 2 | 11/11 |
   | `DomainBound.lean` | 9 | 3 | 9 | 3 | 12/12 |
   | `OuterApproximation.lean` | 9 | 4 | 9 | 4 | 13/13 |
   | `ExteriorCollar.lean` | 3 | 4 | 3 | 4 | 7/7 |
   | `DomainCore.lean` | 2 | 3 | 2 | 3 | 5/5 |

   **裸 `end` 的数量恰好等于 `noncomputable section` 的数量**（每个分片以一个 `noncomputable section` 开、以一个裸 `end` 闭），配对完全平衡（不是语法错误，只是冗余）。同时尾部还有真正的空壳：`DomainBound.lean:117–121` 的
   ```lean
   namespace DirectCrouzeix
   open Set Filter Metric
   end DirectCrouzeix
   ```
   与 `ExteriorCollar.lean:108–112` 的 `namespace Conformal / end Conformal`（**完全空的 namespace 对**）、`DomainCore.lean:161–163` 的 `namespace DirectCrouzeix.Faber / end …`。⇒ 这些空块没有任何声明，是拼接留下的关节。
3. **同名引理重复定义**：`continuous_integrable_compact`、`continuous_integral_compact`、`markov_kernel_contraction` 同时出现在 `CircleFourier.lean` 与 `KernelContraction.lean`（两个不同 namespace 下同义引理）。⇒ 两块是并行产出的，各自补了自己需要的测度论小工具。
4. **`universe` 声明的碎片**：`DomainBound.lean:5` `universe u_144 u_145`、`Sharpness.lean:5` `universe u_46`、`Duality.lean` 用 `u_41..u_43`、`BoundaryEnergy` 用 `u_81..u_86`。编号**不连续且明显来自全局计数器**，说明这些模块是在同一批处理里生成的。
5. `lean-toolchain` = `leanprover/lean4:v4.34.1`；`lakefile.lean` 第 85–86 行 `require mathlib from git … @ "d13f23b723b8a846827a245b89c10fc7d3f11612"`；`patches/` 有 24 个补丁但**没有 DirectCrouzeix 相关补丁** ⇒ 本形式化只依赖 Mathlib 本体 + 自研，不打第三方补丁（与 `enable_nanoda: false` 一致）。`E:\math\lean\.lake` 不存在 ⇒ **本次无法实际编译验证**，所有"通过"的判断仅来自 yaml/json 配置与源码 0 `sorry`，不能声称 `lake build` 成功。（笔记里若要写"已编译通过"，属于**未取证**，不要写。）

### 4.8 论文有 / Lean 无，以及反向缺口

- **Lean 无对应**：论文第 74–112 行的"Earlier bounds"史段、`prop:coefficients` 的"权重 2 是否最优"讨论、摘要与导言的措辞差（"asks whether" vs "resolves"）、以及那张 `figures/normal.tex` 示意图（Lean 里 `eq:support` 的对应物是 `expLevel_holomorphic_support`，没有任何图形对应物）。⇒ 图形在形式化里是**纯冗余**，这本身就是"证明重心在支撑线关系"的独立证据（与第 3.7 节的图形取证相互印证）。
- **Lean 有 / 论文未强调**：`Markov kernel contraction`（`CircleFourier.lean`、`KernelContraction.lean` 各一条 `markov_kernel_contraction`）——把"边界压缩算子是 Markov 核，故能量不增"这条**论文里没有明确命题**的东西形式化了；`kronecker_pow_one`、`tensorPolynomial_mul`、`hsSq_mul_le`/`hsSq_mul_le_right`（$\hsSq{AB}\le\hsSq A\cdot\|B\|^2$ 两个方向）等代数桥接。⇒ `polynomialEnergy_mul_le`（`PolynomialEnergy.lean:97`）的结论是 $E(FG)\le E(G)$ **且** $E(GF)\le E(G)$，即论文里"$F$ 的边界范数 $\le1$ 让左右乘都不增大能量"这一句话的两侧；论文第 3.7 节我记录过的"on each side"表述在这里得到 Lean 的确认（两条必须同时成立，`singular_diagonal_estimates` 的 `.1/.2` 分别用到 `hm.1`（$F\cdot G$）与 `hm.2`（$G\cdot F$）——见 `PolynomialEnergy.lean:201–202`。**即：论文的两个乘积 $FG$ 与 $GF$ 不是修辞，是 `hbound` 的两条分支，缺一条则 X 与 Y 的对称性破缺。**这是 Lean 侧给出的最强证据，值得在笔记第二部分强调。）
- **`expLevel` 的 `ι` 是 `Fintype`**（`DomainBound.lean:64` `[Fintype ι]`）⇒ Lean 只允许**有限项**指数表示。论文 `thm:domain` 用的是几何语言，`lem:approx` 造的域自然是有限项，所以闭合；但如果有人想把解析凸域定义为可数和，Lean 版不覆盖。这是可写的一句"覆盖面诚实说明"。

### 4.9 可直接引用的 Lean 侧短摘（写作时备用）

`CompleteBound.lean:65–97` 的全文骨架（33 行完成主定理，除 `Geometry.exists_exponential_outer` 与 `expLevel_domain_bound_scaled` 外全靠 Mathlib）：

```lean
theorem complete_crouzeix : UniversalBound 2 := by
  intro n m d hn hm A B
  let M := rangeMaximum A B
  …
  apply le_of_forall_pos_le_add
  intro ε hε
  let ρ := M+ε/2
  let V := {z : ℂ | ‖polynomialValue B z‖ < ρ}
  have hWV : numericalRange A ⊆ V := …
  obtain ⟨δ,hδ,hδV⟩ := (isCompact_numericalRange A).exists_thickening_subset_open hV hWV
  obtain ⟨D,v,b,hW,hc,hnear⟩ := Geometry.exists_exponential_outer (isCompact_numericalRange A)
    (numericalRange_nonempty hn A) (convex_numericalRange A) hδ
  have hbound : ∀ z, Geometry.expLevel v b z ≤ 1 →
      ‖matrixPolynomialValue z (coefficientPolynomial B)‖ ≤ ρ := …
  have hh := expLevel_domain_bound_scaled hn hm A v b hc hW (coefficientPolynomial B) hρ hbound
  rw [tensorPolynomial_coefficientPolynomial] at hh
  calc ‖tensorEvaluation A B‖ ≤ 2*ρ := hh
       _ = 2*rangeMaximum A B+ε := by dsimp [ρ,M]; ring
```

这一段值得逐句读，因为它是**论文第 513–531 行的精确 Lean 镜像**，且比论文更清楚三件事：(1) $\varepsilon/2$ 的选择是为了让 $2\rho = 2M+\varepsilon$（而不是 $2M+2\varepsilon$）——**"$\varepsilon$ 随便取"在 Lean 里必须配平常数**；(2) `obtain ⟨D,v,b,…⟩` 里 `D` 被绑定后**从未被使用**（只用 `v,b`），说明外逼近的有限网格只是构造 `v,b` 的中间量，主定理不需要知道它；(3) 最后两行的 `calc` 就是论文的"令 $\varepsilon\to0$"，用的是 `le_of_forall_pos_le_add`（Mathlib 的 $\forall\varepsilon>0,\;x\le y+\varepsilon\Rightarrow x\le y$）。
`dsimp [ρ,M]; ring` 一行完成 $\rho$ 与 $M$ 的展开——**论文里需要一句话，Lean 里需要两个 tactic**：`dsimp` 是因为 `let` 绑定不进 goal，`ring` 是因为 $\varepsilon/2\cdot2$ 的除法是 ring 域上的恒等式（`ρ = M+ε/2` ⟹ `2*ρ = 2*M+ε`）。

---

## 五、常数与参数表

**用法说明**：本表把论文里出现的**每一个具体数值/受命名约束的参数**列成"值 → 位置 → 作用 → 敏感度"。位置一栏给 `main.tex` 行号（本次实测）与 Lean 侧对应（文件:行，同样实测）。敏感度一栏回答"放宽/改掉它会在哪一步崩"，凡是我从结构反推而非论文/代码明说的，标 [推测]。

### 5.0 一览表（按"是否进入最终常数"排序）

| 值 | 论文位置 | Lean 对应 | 作用 | 敏感度（改坏的后果） |
|---|---|---|---|---|
| $C=2$（最终常数） | 第 51–56 行 `eq:main`、第 324 行 `thm:domain`、第 450 行 | `complete_crouzeix : UniversalBound 2`（`CompleteBound.lean:65`）、`expLevel_domain_bound : ‖_‖ ≤ 2`（`DomainBound.lean:69`）、`analytic_domain_core`（`DomainCore.lean:29`） | 全定理的断言 | 不可降：第 526–530 行的例子；Lean 侧 `uniform_sharpness`（`Sharpness.lean:75`）。见 5.1 |
| $4=2^2$（对角能量放大） | 第 420 行 `=4(\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2)`、第 421 行 `\le 4a^2/\gamma^2` | `anti_diagonal_energy` 等式右侧的 `4 * (…) / 8`（`BoundaryEnergy.lean:57–70`）、`DomainCore.lean:77` `hPE … ≤ 4*a/γ^2` | 来自"$P+P^*$"（把算子加自己的伴随）后 $b_0$ 项系数翻倍再平方 | 若只估 $P$ 不估 $P+P^*$，则失去 $\Re$ 半正定信息，块正定不等式无从调用；4 本身是等号可达（当只有 $b_0$ 非零） |
| $8$（合并上界） | 第 450 行 `\le 8a^2/\gamma^2` | `DomainCore.lean:111` `hb : 2*a ≤ 8*a/γ^2` | $4+4$（$P$ 与 $Q$ 两路各 $4a^2/\gamma^2$） | 8 与块不等式的 2 相除得 $4$，开方得 $2$；任何一侧常数恶化都直接进最终 $C$ |
|  $2$（块正定系数） | 第 442–444 行 `$0\le\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\HS{P+P^*}^2+\HS{Q+Q^*}^2-2\HS{M+L^*}^2$` | `positive_block_hsSq : 2*hsSq Z ≤ hsSq U + hsSq V`（`PositiveBlocks.lean:35`）+ 证书 `J := fromBlocks 1 0 0 (-1)`（`:40`） | $2\Delta$ 型 $2\times2$ 块矩阵的正定性 ⇒ $2\|M+L^*\|^2\le\|P+P^*\|^2+\|Q+Q^*\|^2$ | 等号可达（$U=V$、$Z$ 与其同秩时）。这是 $C=2$ 的第二个不可压缩因子。若改用 $\|M+L^*\|\le\frac12(\cdots)$ 的粗化（AM–GM 而非块正定），得到的常数会变大到 $2\sqrt2$ 量级。[推测]  |
| $\tfrac12$（系数权重） | 第 395、397 行 `\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\le a^2/\gamma^2`、第 400 行 `d_N` 定义、第 420 行 | `singular_diagonal_estimates` 结论里的 `(1/2 : ℝ) * ∑'`（`PolynomialEnergy.lean:183–186`）、`weighted_sequence_dual` 结论（`BoundaryEnergy.lean:112`） | 与 `faberWeight` 互逆：$1/w_k$，$w_0=1,w_{k\ge1}=2$ | 必须与 $4$ 那条等式的 $(1+\frac12+\frac12+\cdots)$ 结构完全一致，否则 `linarith` 闭合不了（`DomainCore.lean:111`）。**$1/2$ 不是选出来的，是被 `anti_diagonal_energy` 的等式反推的** |
| $2$（非零系数权重） | 第 251 行 `\le\HS{C_0}^2+2\sum_{k=1}^N\HS{C_k}^2`、第 391 行 `(\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2)^{1/2}` | `def faberWeight (k:ℕ) : ℝ := if k = 0 then 1 else 2`（`BoundaryEnergy.lean:106`） | 上界侧的能量权重（`prop:coefficients` 的右端） | 见 5.2 专条 |
| $d\tau(e^{it})=dt/(2\pi)$ | 第 178 行（全文唯一一次声明测度归一化） | `circleMeasure`（出现 33 次；`TaylorFourier.lean` 的 `angularMeasure`/`circleMeasure`）、`scalar_circle_parseval`/`matrix_circle_parseval`/`euclidean_circle_parseval` | 归一化为**概率测度**，使"积分在一变量固定时为 1"（第 204 行）成立 | 若用未归一化 $dt$，则 $K$ 的马尔可夫性（第 260 行 $\int K=1$）会变成 $\int K=2\pi$，$L^2$ 收缩引理（`markov_kernel_contraction`）需要额外 $2\pi$ 因子，一路传到 $4,8$。**$2\pi$ 在本文不进入最终常数，正是因为归一化了** |
| $\pi$ | 只在第 178 行 $dt/(2\pi)$ 与图注中出现 | 全目录 `Real.pi` **仅 2 处**：`HolomorphicReflection.lean:82` `0 < ∫ θ in (0:ℝ)..2*Real.pi, u (circleMap 0 R θ)` 与 `:86` `⟨Real.pi / 2, …⟩`；主链一律用 `Angle`/`unitPoint`（`TaylorFourier.lean:92` `def unitPoint (t : Angle) : ℂ := fourier 1 t`）与 `circleMeasure` | 圆周参数化 | 因归一化，$\pi$ 全篇不参与不等式。Lean 里 $\pi$ 只出现在**反射原理的实分析角落**（对 $[0,2\pi]$ 上积分取正的 $\pi/2$ 处），与 $C=2$ 无关。**这是一个可写进笔记的"形式化让冗余常数现形"的例子：$\pi$ 在证明主链上是可消除的** |
|  $\HS C=(\tr(C^*C))^{1/2}$（未归一化 HS） | 第 180 行 + 第 13 行宏 `\newcommand{\HS}[1]{\lvert #1\rvert_2}` | `hsSq`（`PositiveBlocks.lean:15`）、`hsVector`/`hsSq_eq_norm_hsVector_sq`（`HilbertSchmidt.lean:28/31/45`） | 使 $M_m(\C)$ 成为 Hilbert 空间且 $\|C_k\|_{HS}$ 不加 $1/\sqrt m$ | **若归一化（除以 $\sqrt m$），$m$ 会显式出现在常数里，"complete"（一致于 $m$）就没了。**第 180 行那句"unnormalized … which makes each finite-dimensional matrix space a Hilbert space"是全文最省事的一处设计  |
| $1+\sqrt2$ | 第 82 行（Crouzeix–Palencia 的完整界） | 无对应（Lean 只形式化 $2$） | 历史比较 | 论文用来说明"complete"情形的已知最好值；不参与本文 |
| $11.08$ | 第 76 行（Crouzeix 2007 的 universal complete bound） | 无 | 历史 | 同上。注意这是全文唯一的小数常数，来自数值优化的界（[推测] 引自原始论文的显式计算） |
|  $0<r<1$ | 第 183 行（$h$ 在 $\|\lambda\|>r$ 单叶亚纯） | `hR : 1 < R` + `hg : AnalyticOnNhd ℂ g (ball 0 R)`（`DomainBound.lean:64–65`、`ExteriorCollar.lean:77–78`），关系为 $r=1/R$ | 解析边界 ⇒ 共形映射越过 $\T$ | $r<1$ 严格是"$\partial\Omega$ 实解析"的等价表述；若 $r=1$（仅连续边界），$g$ 只在开圆盘解析，`chordDenominator_ne_zero`（`DividedDifferences.lean:103`）需要的 `convex_ball 0 R` 与 `AnalyticOnNhd` 立刻失效（调用点 `ExteriorCollar.lean:89`）  |
|  $C_\rho,\ \rho\in(r,1)$（几何衰减） | 第 196–197 行 `\|s_{kj}\|\le C_\rho\rho^{k+j}` | **Lean 无对应**：`FaberEnergy/BoundaryKernel/DividedDifferences` 三个文件里 `rho`、`C_`、`tsum`、`summable` 均不出现（实测）；收敛性改由 `algebraGenerating = (c-u²·deriv g u) • Ring.inverse (algebraDenominator c g A u)`（`FaberCalculus.lean:68`）与 `ringInverse_geometric`（`:41`）在完备 Banach 代数里的闭式给出 | 论文用它证 $s(\lambda,\mu)$ 的正则收敛与 $\T^2$ 上绝对一致收敛（第 198–200 行） | 这是一处**真实的路线差异**：论文=系数衰减估计，Lean=闭式求逆 + `CompleteSpace`。放宽它（在论文侧）会让"绝对一致收敛"（第 200 行）失去依据；在 Lean 侧根本没有这一步可放宽  |
|  $C,\ \theta\in(0,1)$ | 第 304 行 `For the fixed $A,h$, there are constants $C<\infty$ and $0<\theta<1$` | 同上无对应；Lean 用 `IsUnit (algebraDenominator c g A u)`（`FaberCalculus.lean:139` 的 `hunit`）与 `hu : 1 < R` | $\|b_k(A)\|\le C\theta^k$ 保证级数绝对收敛 | **注意论文自己写了 "For the fixed $A,h$"** —— 即这个 $C,\theta$ 不一致于 $A$。Lean 绕开它，所以 Lean 也回避了"一致性"问题（与第 3.8 节"论文未述"清单呼应）  |
|  $\gamma=\|F[A]\|$ | 第 329 行 | `let γ := ‖tensorPolynomial A F‖`（`DomainCore.lean:32`）、`hγ : 0 < γ`（`:37`） | 归一化标度；最终要证 $\gamma\le2$ | $\gamma=0$ 必须分流（论文第 329 行"There is nothing to prove if $\gamma=0$"；Lean `by_cases hγ0`，`DomainCore.lean:33`）。因为后面有 $a/\gamma^2$  |
| $a$（交叉能量） | 第 341 行 `$a^2=\sum_{k\ge0}\HS{M_k}^2$`、第 355 行 `Taking $G=F$ … shows that $a>0$` | `let a := ∫ t, hsSq (M t) ∂circleMeasure`（`DomainCore.lean:63`）、`hapos : 0 < a` 用反证（`:65–74`） | 全部中间界的公共量 | **Lean 的 $a$ 是论文的 $a^2$ 的上界**（靠 `finite_negative_bessel`，`BoundaryEnergy.lean:90$），因此 Lean 全程写 `a/γ²` 而论文写 `a²/γ²`；见第 4.2 节末。$a>0$ 在 Lean 是反证 + `nlinarith [sq_pos_of_pos hγ]`，在论文是一句话 |
| $a^2/\gamma^2$ 型界对 $d_N=0$ 的处理 | 第 405–406 行 `$d_N\le(a/\gamma)\sqrt{d_N}$, which gives $d_N\le a^2/\gamma^2$ including when $d_N=0$` | `weighted_coefficient_dual` 的 `by_cases hs0 : s = 0`（`Duality.lean:40`） | 除法前的零分支 | 论文与 Lean **都**显式处理了，是两套叙述少见的完全对齐点 |
| $\varepsilon$、$\rho=M+\varepsilon/2$ | 第 513–531 行的极限段（`thm:main` 证明） | `apply le_of_forall_pos_le_add; intro ε hε; let ρ := M+ε/2`（`CompleteBound.lean:72–74`）、`hρ : 0 < ρ`、`hMρ : M < ρ`、结尾 `2*ρ = 2*rangeMaximum A B+ε`（`:97`） | 把"$\sup$ 而非 $\max$"与"$\le 2$ 而非 $<2$"缝起来 | $\varepsilon/2$ 的 $\frac12$ **是配平常数**：$2\rho=2M+\varepsilon$。若取 $\rho=M+\varepsilon$，最终得到 $2M+2\varepsilon$，仍成立但要多一次 $\varepsilon\mapsto\varepsilon/2$。Lean 用 `dsimp [ρ,M]; ring` 一行完成（`:97`） |
|  $\delta$（外逼近厚度） | 第 464 行 `For $0<\delta<1$, choose a finite Euclidean $\delta$-net …`、第 468 行 `$\Omega_\delta=\{z:\Phi_\delta(z)<1\}$`、第 510 行 `$\delta_j=1/(j+1)$` | `Geometry.exists_exponential_outer` 的 `ε` 参数 + `δ := min (1/2) (ε/(2*C))`（`OuterApproximation.lean:70`）；主证明里 `obtain ⟨δ,hδ,hδV⟩ := (isCompact_numericalRange A).exists_thickening_subset_open hV hWV`（`CompleteBound.lean:82`） | 两重身份：(1) 网格精度；(2) 支撑函数下移量 | `0<δ<1` 的上界 $1$ 是**任意的**（只为参数化好看）；真正的敏感度在 Lean 的 `min (1/2) (·)`：那个 $1/2$ 保证 $h_K(\nu)+\delta$ 不把 $\Omega_\delta$ 撑出包含 $K$ 的最小范围。[推测] 主要服务于 `axis_support_bound` 里的 $\|z\|\le L$ 结论  |
| $1/(j+1)$ | 第 510 行 `Taking, for example, $\delta_j=1/(j+1)$ completes the construction.` | 主证明里不需要具体序列：Lean 直接一次 `exists_exponential_outer … hδ`（`CompleteBound.lean:83`），不构造序列 | 论文用它把"每个 $\delta$ 有外逼近"变成可数序列以取极限 | **差异点**：论文用序列 $\delta_j\to0$（第 510 行）来做极限；Lean 用 `le_of_forall_pos_le_add`（`CompleteBound.lean:72`）绕开序列，只取一个 $\delta$。⇒ Lean 少了一个"可数选择/对角线"的依赖，是**紧性论证 → ε-论证**的典型改写 |
| $D_\delta$ 含 $1,-1,i,-i$ | 第 464 行 `…choose a finite Euclidean $\delta$-net $D_\delta$ of unit directions that includes $1,-1,i,-i$`、第 484 行 `The four axis directions ensure it is positive` | `exists_axis_net`（`SupportNets.lean:53`）的五个结论 `1 ∈ D ∧ -1 ∈ D ∧ Complex.I ∈ D ∧ -Complex.I ∈ D` + `D := S.image Subtype.val ∪ {1,-1,Complex.I,-Complex.I}`（`:61`） | 让 Hessian 正定（把 $\C$ 视 $\R^2$，四个轴向的 $\nu\nu^{\mathsf T}$ 张满对称阵锥） | **这四点是 {const.} 必需的**：若只有一个方向的网，$\Phi_\delta$ 的次水平集会退化成条带（无界），`hc : IsCompact {expLevel ≤ 1}`（`DomainBound.lean:65`）不成立 → `exists_expLevel_exterior` 不能用。Lean 里由 `axis_support_bound`（`SupportNets.lean`）+ `hbound`（`OuterApproximation.lean:111–114`）显式消费这四个成员 |
| $N=\#D$、$t=(N+1)/\delta$ | 第 464–484 行的"$t$ 充分大"（论文未给公式） | `let N : ℝ := Fintype.card D`（`OuterApproximation.lean:78`）、`let t := (N+1)/δ`（`:80`）、`htδ : t*δ = N+1`（`:82`）、`hsumlt : N*Real.exp (-t*δ) < 1` 用 `linarith [Real.add_one_le_exp (N+1)]`（`:89–91`） | 使 $\sum_\nu e^{-t\delta}=N e^{-(N+1)}<1$ | **Lean 把论文的"充分大"钉成闭式**。$N+1$ 而不是 $N$ 是为了只用 $x+1\le e^x$ 这一条引理；换成 $t=N/\delta$ 会需要 $N e^{-N}<1$（$N=1$ 时 $=e^{-1}<1$ 仍成立，但 $N$ 的定义方式让 `add_one_le_exp` 直接用不上）。[推测] 作者选 $N+1$ 纯粹为最短证明 |
| $L=2(M+1)$、$C=1+L+M$ | 仅 Lean：`OuterApproximation.lean:67–68`（`M` 是 $K$ 的半径界，来自 `hK.isBounded.exists_pos_norm_le`） | 同上 | 给 $\Omega_\delta$ 一个统一有界半径 `hbound : ‖z‖ ≤ L`，再用 `isCompact_closedBall 0 L` 证紧 | **论文未述**：论文的紧性论证在第 482 行"Thus one fixed rectangle contains every closed sublevel"用矩形；Lean 用闭球且必须显式给 $L,C$。这里 $2$ 与 $1+L+M$ 里的两个 $1$ 都是"随便取大一点"的平凡选择（敏感度低，只影响证明里 `linarith` 的可行性，不影响定理常数） |
| $M_m(\C)$、$m$（系数维） | 第 51–56 行（一致于 $m$）、第 247 行 `For every positive integer $m$` | `0 < m`（`UniversalBound`，`Model.lean:29`）、`hm : 0 < m` 全程携带 | "complete" 的实质 | $m$ 不进任何常数——这是本文的核心诉求。**Lean 需要 $0<m$ 的真正原因是 `NeZero m` 与 `Fin m` 非空**（`DomainCore.lean:31` `let : NeZero m := ⟨Nat.ne_of_gt hm⟩`），而非数学必需 |
|  $n$（底维） | 同上 | `0 < n`、`NeZero n`（`DomainCore.lean:30`） | $W(A)$ 非空需要 $\C^n$ 有单位向量 | $n=0$ 时 `numericalRange A = ∅`、`rangeMaximum = sSup ∅ = 0`（Mathlib 约定），结论变成 $\|0\|\le 2\cdot0$ 仍真。Lean 拒绝处理，故加 `hn`。⇒ **`numericalRange_nonempty hn A`（`NumericalRange.lean`）是 $0<n$ 的真实消费者**  |
| $d$（次数） | 第 49 行 `$P(z)=\sum_{k=0}^d B_kz^k$` | `Fin (d+1) → Matrix (Fin m) (Fin m) ℂ`（`Model.lean:16`），**无 `0 < d`** | 有限性保证 $P[A]$ 有意义 | 论文若要求 $d\ge1$，Lean 覆盖更广（$d=0$ 平凡）。这是 4.2 记的差异 (1) |
|  $x_1=x_2=1/\sqrt2$、$\|x^*Ax\|=2\|x_1x_2\|\le1$ | 第 530 行 | `norm_le_one_of_mem_sharpnessRange`（`Sharpness.lean:36`）+ `nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]`（`:50`） | 证明 $W(A)\subseteq\overline\D$ | 论文的 $1/\sqrt2$ 是取等点；Lean 用 AM–GM 形式，**没有显式给出取等点**（不需要）。⇒ 一个"论文给了等号情形、Lean 只要不等式"的省略例  |
|  $A=\begin{pmatrix}0&2\\0&0\end{pmatrix}$ | 第 528 行 | `def sharpnessMatrix := !![0, 2; 0, 0]`（`Sharpness.lean:32`） | 唯一反例 | 那个 **2**（而非 1）就是让 $\|A\|=2$ 且 $W(A)\subseteq\overline\D$ 同时成立的选择：一般地 $[[0,t],[0,0]]$ 给出 $\|A\|=t$、$\max_{W(A)}\|z\|=t/2$，比值恒为 $2$。论文取 $t=2$ 是为了让右端恰为 $1$。**Lean 用 `sharpnessCoefficients := ![0, 1]`（`:34`）把 $P(z)=z$ 编成 $B_0=0,B_1=1$，与第 526 行 "$m=1$, $P(z)=z$" 一致**  |
|  $(1,i,j,k)$ 四元组 | 第 514–518 行（Toeplitz–Hausdorff 重证）：`$(2\Re(\bar uv),2\Im(\bar uv),\|u\|^2-\|v\|^2)$` ranges over the unit sphere in $\R^3$ | `Convexity.lean`：`bloch`（`Convexity.lean:84`）、`norm_sq_three`/`norm_bloch`/`bloch_surjective_sphere`/`threeLinear`/`threeLinear_ker_ne_bot`/`twoForm`/`twoForm_bloch`/`convex_twoForm`/`convex_quadratic_range`（13 条声明，273 行） | 用 Bloch 球参数化把 $W(A)$ 写成"实二次映射像"，再由 $\R^3\to\R^2$ 线性核非空得凸性 | 三个 $2$（$2\Re,2\Im$）**必须是同一个 $2$**，否则像不在半径 $\|u\|^2+\|v\|^2=1$ 的球面上（`norm_bloch` 与 `bloch_surjective_sphere` 就是这条）；换成 $(\Re,\Im,\cdot)$ 会掉到半球。$\R^3$ 的 $3$ 与"核非空"需要 $\dim\ker\ge1$（`threeLinear_ker_ne_bot`），即**线性映射 $\R^3\to\R^2$ 的秩亏**，这一点在 `Convexity.lean` 里是一个独立引理  |
|  $R_i/3$、$2R_i/3$（领子覆盖） | 第 591 行 `the third-radius disks $V_i=B(\zeta_i,R_i/3)$ that cover the circle`、第 594 行 `$\|\zeta_i-\zeta_j\|<(R_i+R_j)/3\le2R_i/3<R_i$` | **Lean 有同一个 $1/3$**：`ConformalCollar.lean:124` `refine ⟨S/3,by positivity,E,?_,?_,?_,hEd⟩` 配三次 `simpa only [show 3*(S/3) = S by ring]`（`:125–127`），以及 `:142` `refine ⟨r/3,by positivity,f,…⟩` + `:143/:146` 的 `3*(r/3)=r by ring`；另 `AnalyticCharts.lean:141` `let r := min (d/3) e` 与 `:143` `3*r ≤ d` | 从局部解析延拓拼出整圈领子时的 3 倍标准选取（Lebesgue 数的粗略版） | $1/3$ 是**纯粹的技术宽松选择**，敏感度极低（$1/4,1/2$ 同样可行）；但三处 `ring` 恒等式说明 Lean 必须**精确知道**"取三分之一再乘三回到原半径"，即覆盖数 $3$ 出现在等式而不是不等式里。⇒ 论文里"三个同心半径"的直觉在 Lean 是一组 `3*(S/3)=S` 的算术  |
| $c\ne0$、$c_0$、$c=1/g'(0)$ | 第 165 行 `$h(\lambda)=c\lambda+c_0+O(\lambda^{-1}),\ c\ne0$`、第 187 行 `leading coefficient $c^{-k}$`、第 613 行 `pole with coefficient $c=1/g'(0)\ne0$` | `hc : c ≠ 0`（`DomainBound.lean:78`、`ExteriorCollar.lean:78`）+ `hc0`、`Faber.faberBasis_zero hc g`、`Faber.faberBasis_degree`（`FaberPolynomials.lean`） | 首项系数 $c^{-k}$ 进 $b_k$；$c\ne0$ 保证 $h$ 在无穷是简单极 | $c\ne0$ 若失败则 $h$ 在无穷无极 ⇒ 非双全纯。Lean 里 `hc` 的**具体消费点**：`algebraDenominator` 在 $u=0$ 处 $=c\bullet 1$ 的可逆性（`ExteriorCollar.lean:55–58`，`isUnit_iff_ne_zero.mpr hc`），以及 `chordDenominator_ne_zero`（`DividedDifferences.lean:103`）。⇒ **$c\ne0$ 不只是几何要求，它是对角项 $b_0=1$ 与"斜率不为零"的来源** |
| $b_0=1$ | 第 187 行 `Then $b_0=1$`、第 313 行 `$b_0(A)=I$ gives both integrals`、第 337–339 行 `Since $b_0=1$ …` | `hb0 : b 0 = 1`（`DomainCore.lean:16`）、`Faber.faberBasis_zero hc g`、`hC0 : fourierCoeff … 0 = Vᴴ * U`（`DomainCore.lean:60–62`，用 `hb0` 经 `map_one, mul_one`） | 常数项归一化 ⇒ $P_0=X^*X$、$Q_0=Y^*Y$、$L_0^*=M_0$ | **全文最关键的"1"**：若 $b_0\ne1$，则 `eq:means`（第 339 行）三条恒等式全废，`anti_diagonal_energy` 的 $4\hsSq(\text{coeff }0)$ 变成 $4\hsSq{V^*R_0V}$，无法与 $X^*X$ 比较，块正定矩阵 $\begin{psmallmatrix}P&M\\L&Q\end{psmallmatrix}$ 的对角块就不是 $X^*X/Y^*Y$，整个 $\gamma^2\le4$ 崩。**Lean 里 `hb0` 只被 `hC0` 用了一次，但那一次是致命的**（`DomainCore.lean:62, 84, 93, 97`）|
| $\lambda/(\lambda-\mu)$ 的 $2\Re=1$ | 第 229 行 `For distinct $\lambda,\mu\in\T$, one has $2\Re(\lambda/(\lambda-\mu))=1$` | `BoundaryKernel.lean` 的 `boundaryCoefficient_eq_taylor`/`boundaryKernel_character`/`unitPoint_ne_zero` 与 `FaberEnergy.lean` 的 `re_circle_fraction`/`circle_nonneg_of_off_point`/`boundaryKernel_nonneg_off_diagonal` | 把 Szegő 核的实部换成 $1$ ⇒ $K=1+s+\bar s$（第 202 行）积分恰为 1 | 这是 $K$ 的**归一化来源**；若该恒等式右端是 $c\ne1$，则马尔可夫核收缩（`markov_kernel_contraction`）需要归一化，权重 $1,2$ 全部重标。**该恒等式只在 $\lambda\ne\mu$ 成立**，第 229 行的 "distinct" 与 Lean 的 `chordDenominator_off_diagonal`/`_diagonal` 分流（`DividedDifferences.lean:140–146`）一一对应 |
| $K(\lambda,\mu)=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)}\ge0$ | 第 231 行 | `Faber.boundaryKernel c g`（`BoundaryKernel.lean`）+ `boundaryKernel_nonnegative`（`FaberEnergy.lean:199`，10 参数字段） | 正核 ⇒ `prop:coefficients` 的双边估计 | 这里的 $2$ 与 $4a^2/\gamma^2$ 无关，是把 $\Re$ 写成对称化的习惯；但若去掉它，$K$ 的积分是 $\tfrac12$ 而非 $1$，马尔可夫性失效 |
| $q(\lambda)=\lambda h'(\lambda)$、$R(\lambda)=q(\lambda)(h(\lambda)I-A)^{-1}$ | 第 169、298、144 行 | `Faber.boundaryNormal c g t`（`FaberEnergy.lean`）与 `Faber.algebraGenerating c g A u := (c - u²•deriv g u) • Ring.inverse (algebraDenominator …)`（`FaberCalculus.lean:68`） | 法向 + 预解式的权重 | $\lambda h'(\lambda)$ 里的那个 $\lambda$（即 $1$ 次幂）**把"圆切向"转成"外法向"**：Lean 的 `algebraGenerating` 里对应项是 `c - u^2 * deriv g u`，$u^2$ 而非 $u$ —— 因为 $u=1/\zeta$ 换元一次、$q=\zeta h'(\zeta)$ 又贡献一次（$\zeta^2$）。⇒ **$u^2$ 是两次变量替换的累积**，这个 $2$ 与前面的 $2$ 无关。见 4.5(iv) 的共轭约定告警 |
| $\frac{q(\lambda)}{h(\lambda)-z}=\sum_{k\ge0}b_k(z)\lambda^{-k}$ | 第 184–186 行 `eq:faber` | `Faber.faberBasis c g k`（`FaberPolynomials.lean`，`faberBasis_coeff/_top_coeff/_degree/_eval`）+ `fourierCoeff_comp_neg` | Faber 基定义 | 指数是 $-k$（不是 $+k$）决定了 Lean 里所有 Fourier 系数用 `-(k : ℤ)` 索引（`DomainCore.lean:25` `hcoeff`、`BoundaryEnergy.lean:90` `finite_negative_bessel`）。**若写成 $+k$，则 `hposfreq`（正频率为零）与 `hcoeff`（负频率是系数）互换，整块 Parseval 逻辑需要重做** |
| $\sum_{i=1}^m X e_i\otimes e_i$ | 第 333 行 | `matrixify`/`hsVector`（`HilbertSchmidt.lean:14`、`SingularPairs.lean:80`）、`hsSq_eq_norm_hsVector_sq`、`vectorKronecker` 桥接 | 把 $\C^n\otimes\C^m$ 的单位向量识别成 $n\times m$ 矩阵 | 这个"识别"在论文是自然同构；Lean 需要 `hsVector_matrixify`（`DomainCore.lean:44/46` 两次 `simpa only` 消费） + `entryPair` 来把 $y^*G[A]x$ 变成 `\sum (M_k)_{ij}(C_k)_{ij}`（第 349–351 行 `eq:pairing`）。**"标准基 $(e_i)$" 在 Lean 里就是 `Pi.single`**（`HilbertSchmidt.lean` 的 `entryPair`、`Sharpness.lean:19` 的 `EuclideanSpace.single j 1`） |
| `2\Re(\overline{q(\lambda)}(h(\lambda)-v^*Av))\ge0` | 第 320 行 | `positive_resolvent A _ _ (houtside …) (hsupport t)`（`ExteriorCollar.lean:74`）、`posSemidef_of_unit_quadratic`/`supported_matrix_posSemidef`/`quadratic_toLp`（`Resolvent.lean`） | "$B$ 可逆 ⇒ 正定"（`eq:support` → $R(t)+R(t)^*\ge0$） | 这里的 $2$ 是 $\Re w = \frac12(w+\bar w)$ 的对称化，与 $C=2$ 无关。**`Invertibility of $B$ proves positivity` 这句论文的话，在 Lean 是 `IsUnit.mul` + `isUnit_resolvent_of_not_mem` + `Matrix.nonsing_inv_eq_ringInverse`（`ExteriorCollar.lean:59–71`）四次调用** |

### 5.1 关于"$C=2$ 最优"的完整常数账（可直接用于笔记）

把上面的表压缩成一条链，$C=2$ 的产生**只用三个数字**：

$$
\underbrace{2}_{\text{块正定 }2\|Z\|^2\le\|U\|^2+\|V\|^2}
\quad\cdot\quad a^2
\;\le\; 2\!\int\!\HS{M+L^*}^2
\;\le\; \int\!\HS{P+P^*}^2+\int\!\HS{Q+Q^*}^2
\;\le\; \underbrace{4}_{\text{对称化 }|1+1|^2}\frac{a^2}{\gamma^2}+\underbrace{4}_{\text{同上}}\frac{a^2}{\gamma^2},
$$

于是 $\gamma^2\le \dfrac{2\cdot 4}{2}=4$，$\gamma\le2$。

- **两处 4 与一处 2 都各自是等号可达的**：$4$ 在"级数只剩 $b_0$"时取等（因为 $P+P^*$ 的常数项是 $2P_0$）；块不等式的 $2$ 在 $U=V$ 且 $Z$ 与 $U$ 同秩时取等。$2\times2$ 幂零例（$P(z)=z$，$B_0=0,B_1=1$）正好让 $M_0 = X^*X$ 型退化，同时达到两处等号。[推测]（论文第 530 行只验证结论，未逐条验证两处等号同时成立）
- **$a^2$ 在这条链里完全消掉**，所以 $a$ 的任何归一化选择都不影响 $C$；影响 $C$ 的只有 $a/\gamma^2$ 那一步的常数 —— 即 $d_N\le a^2/\gamma^2$（第 405 行）里的**恰好 1**。而这一步依赖 `faberWeight` 的 $1,2,2,\dots$ 与 `anti_diagonal_energy` 的 $4(1,\frac12,\frac12,\dots)$ 精确互逆。**这是"权重 2 为何不能是别的数"的最硬答案**：若权重取 $w$（$k\ge1$），则 $\frac{1}{w}$ 必须等于 $\frac12$，故 $w=2$；权重与对角展开式是同一个事实的两侧。
- 唯一能改常数的自由度是 $a/\gamma^2$ 里的"$1$"：论文第 353 行 $|y^*G[A]x|\le a(\sum\HS{C_k}^2)^{1/2}$ 的 $a$ 不带任何倍数（因为 $a$ 定义为 $\ell^2$ 范数），所以没有松弛空间。⇒ **本文的证明没有任何 $\varepsilon$-松弛进入最终常数**（$\varepsilon$ 只在 `thm:main` 的极限段出现，见 5.0 的 $\rho$ 行），这与"数值 2 是精确最优"完全一致；对比 Crouzeix–Palencia 的 $1+\sqrt2$（第 82 行）那种来自插值松弛的常数，本文的 2 是**结构常数**而非**优化常数**。

### 5.2 `prop:coefficients` 的权重 2：敏感度专条

第 249–251 行的双边估计

$$\sum_{k=0}^N\HS{C_k}^2\;\le\;\int_\T\HS{G(h(\mu))}^2\,d\tau(\mu)\;\le\;\HS{C_0}^2+2\sum_{k=1}^N\HS{C_k}^2$$

Lean 侧对应 `faber_matrix_coefficient_bounds`（`ExteriorCollar.lean:21–29`）返回**合取的两条**，正是 `analytic_domain_core` 的 `hlower`（`:20–21`）与 `hupper`（`:22–23`）。逐条敏感度：

- **左端（下界，权重全 1）**：`hlower` 的系数 $1$ 必须**不大于** $d_N$ 定义里的 $1$；下界是 Cauchy–Schwarz/Bessel 侧（`finite_negative_bessel`），它是**纯 Bessel**，故系数只能是 $1$（放大就失效）。若把下界加强为带 $1+\eta$ 的权重，Bessel 不等式不成立（Parseval 只在 $N\to\infty$ 时取等）。
- **右端（上界，权重 2）**：来自 `K = 1 + s + \bar s` 的非负性 + 马尔可夫核收缩（第 260–261 行 `‖(Tu)(μ)‖² ≤ ∫K(λ,μ)‖u(λ)‖²dτ(λ)`，"Integrating in μ and using the normalization in that variable shows that $T$ is an $L^2$ contraction"）。Lean 里这一步是 `markov_kernel_contraction`（`CircleFourier.lean` 与 `KernelContraction.lean` **各一份同名**，见 4.7(3)）+ `energy_positiveSeries`/`energy_orthogonal_positiveSeries`（`KernelContraction.lean`）。
- **第 274–275 行的展开** `$=\HS{C_0}^2+\sum_{k=1}^N\HS{C_k}^2+\sum_{j\ge1}\HS{\sum_k s_{kj}C_k}^2$` 说明 **权重 2 完全由"$s$ 的贡献 $\le$ 主项"给出**，即 $T$ 的收缩性恰好给出一个"再加一份 $\sum_{k\ge1}$"。⇒ **2 = 1（主项）+ 1（$T$ 的像）**。这条结构性解释在第 274–275 行的等式里是透明的，而 `faberWeight` 用 `if k = 0 then 1 else 2` 把它硬编码。$C_0$ 之所以权 1，是因为 $s$ 项只对 $k\ge1$ 有贡献（第 263 行 "For $u(\lambda)=\sum_{k=1}^N C_k\lambda^k$, only the $s$ term contributes"）。
- 若权重 2 能改成 $2-\eta$：则 `anti_diagonal_energy` 的 $\frac12$ 需要改成 $\frac{1}{2-\eta}$，$\gamma^2\le\frac{2\cdot4_\eta}{2}$ 中的常数会**同步变化**。⇒ 严格说，`prop:coefficients` 的上界若改进，会**同时**改进主定理常数；这与我 2.3(d) 里的推测一致（论文未述）。

### 5.3 参数命名冲突表（读源码时的坑，务必记录）

| 记号 | 含义 A | 含义 B | 含义 C |
|---|---|---|---|
| $M$ | tex 第 335 行 `M=X^*RY`（交叉矩阵值函数） | `CompleteBound.lean:67` `let M := rangeMaximum A B`（实数） | tex 第 49 行 $M_m(\C)$ 的 $m$；Lean `DomainCore.lean:16` 的 `m : ℕ` |
| $\rho$ | tex 第 196 行 衰减半径 $r<\rho<1$ | `CompleteBound.lean:74` `let ρ := M+ε/2`（放大后的界） | Lean `R : ℝ`（`hR : 1 < R`）是 tex 的 $1/r$ 而非 tex 的 $R(\lambda)$；tex 第 298 行的 $R(\lambda)$ 在 Lean 是 `algebraGenerating … ∘ inv`（`faber_resolvent_data` 的 `Q`） |
| $C$ | tex 第 196 行 $C_\rho$ | tex 第 304 行 $C$ | tex 第 334 行 $C_k$（矩阵系数）；Lean `faberPolynomial b C` 的 `C : Fin N → Matrix …`（`DomainCore.lean:19`）；`OuterApproximation.lean:68` 的 `C := 1+L+M`；主定理常数 $C=2$ |
| $\delta$ | tex 第 464 行 网格精度 | `CompleteBound.lean:82` 开邻域厚度 | Lean `OuterApproximation.lean:70` `δ := min (1/2) (ε/(2*C))`（两者合体） |
| $c$ | tex 首项系数 $c\ne0$ | tex 常数 $c=1/g'(0)$（同一物） | `DomainBound.lean:77` `c` 与 tex 的 $c$ 对应；但 `UniversalBound c`（`Model.lean:28`）的 `c` 是定理常数 $2$ |
| $a$ | tex 第 341 行 $a^2=\sum_k\HS{M_k}^2$ | — | `DomainCore.lean:63` `a := ∫ hsSq(M)`（$\approx$ tex 的 $a^2$，**不是** $a$） |
| $h$ | tex 外共形映射 $h$ | `DomainCore.lean:17` `h : BoundaryCircle → ℂ`（同一物的边界限制） | `hh : Continuous h`；`AnalyticCharts.lean` 的 `analytic_inverse_chart` |
| $P,Q$ | tex 第 335 行 $P=X^*RX,\;Q=Y^*RY$ | tex 第 49 行 $P(z)=\sum B_kz^k$（多项式本身） | `DomainCore.lean:47–48` `P/Q` 同 tex 335；`Model.lean` 里没有 $P$，改用 `coefficientPolynomial B` |

⇒ 素材结论：**论文自己的记号复用度很高**（尤其 $C$ 与 $\rho$ 各有三义），而 Lean 侧用不同类型（`BoundaryCircle → Matrix`、`MatrixPolynomial m`、`Fin (d+1) → …`）在类型层面强制区分。这既是 Lean 的优势（无歧义），也是它的成本（必须给 4 个 `P/Q/M/L` 各写 `Continuous` 证据，`DomainCore.lean:51–57`）。

---

## 状态

- [x] 论文 tex 全文读取（`main.tex` 624 行 + `references.tex` 105 行 + `figures/normal.tex`）
- [x] 一、定理总览
- [x] 二、逐引理带批注重构（2.0–2.8，全文 6 个具名对象 + 导言元证明）
- [x] 三、叙事时间线（3.1–3.8，含"未述"清单与源文件痕迹）
- [x] 四、Lean 取证（4.0–4.9，题面文件 / 配置 / 拓扑 / 陈述核对 / 常数链 / tactic 统计 / 源码卫生 / 缺口清单）
- [x] 五、常数与参数表（5.0 一览表 + 5.1 $C=2$ 的常数账 + 5.2 权重 2 专条 + 5.3 记号冲突表）

**取证方法声明（写作时须保留的诚实边界）**：
1. 本文件所有 tex 行号、Lean 文件行号、tactic 频次、`sorry`/`noncomputable section` 计数均为本次实测；未实测的判断一律标 [推测] 或"论文未述"。
2. **本次未实际编译**：`E:\math\lean\.lake` 不存在，无法运行 `lake build`。所有"证明已完成"的判断仅基于（a）解目录 42 文件 `sorry` 计数为 0，（b）`formalization.yaml` 第 1110–1112 行的正式条目，（c）`ComparatorChallenges/DirectCrouzeix.json` 的 `permitted_axioms` 白名单。**笔记里不要写"已编译通过"或"CI 验证通过"。**
3. 共轭约定（`boundaryNormal` vs 论文 $q(\lambda)=\lambda h'(\lambda)$ 的 $\zeta\bar{\;}/$共轭位置）我在 4.5(iv) 标了 [需核对]，本次未逐字比对；若笔记要写"$q$ 与 `boundaryNormal` 完全一致"，需先补一次核对。
4. 同族两篇（`StructuralCrouzeix`、`CompleteCrouzeix`）本次**只做了条目定位**（yaml 第 652–655 / 1542–1544 / 1038–1040 行），未读其 Lean 源码，因此第四、五节里所有"与同族对比"都只能停留在"仓库里有三套并行形式化"这一事实层面。
