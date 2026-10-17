# D25 Crouzeix 完整不等式：我把常数 2 拆成一笔权重账和一笔块账

对象论文：`A direct proof of the complete Crouzeix inequality`（2026-09-26，OpenAI）。
TeX 源码：`E:\math\preprints\A-direct-proof-of-the-complete-Crouzeix-inequality-September-26-2026\build\main.tex`（正文 623 行全在这一份里），外加 `references.tex`（105 行，我实测 18 条 `\bibitem`；素材 §3.6 记"共 17 条"并按 7/4/6 分桶，其分桶漏了 `Beckermann2005`，见第 14.4 节）与 `figures/normal.tex`（21 行，全文唯一一张图）。
Lean：`E:\math\lean\OAI\Analysis\DirectCrouzeix\`（我实测 42 个 `.lean`，`wc -l` 合计 7389 行；素材记 7431 行，差值恰好等于文件数 42，[推测] 是统计方式对末行换行的处理不同），题面与验收配置在 `E:\math\lean\ComparatorChallenges\DirectCrouzeix.lean`（1397 字节）与 `.json`（15 行）。
素材：`研究笔记\素材\Crouzeix直接证明-素材.md`（21.9 万字节，§一定理总览、§二逐引理带批注重构、§三叙事时间线、§四 Lean 取证、§五常数与参数表）。
下文中 `main.tex:NN` 指该文件行号；Lean 侧写作 `文件:行`。论文 TeX 的原文一律用 tex 代码块原样引用，我自己的话用中文。

记号与论文一致：$\mathbb C,\mathbb T,\mathbb D$ 是复数域、单位圆周 $\{\lambda:|\lambda|=1\}$、开单位圆盘；$\lvert X\rvert_2$ 是**未归一化**的 Hilbert--Schmidt 范数（即 $\operatorname{tr}(X^*X)$ 开方，矩阵空间的 Hilbert 结构就靠它）；$\operatorname{tr}$、$\operatorname{diag}$、$\operatorname{dist}$ 按论文第 14-17 行的 `\DeclareMathOperator`；$d\tau(e^{it})=dt/(2\pi)$ 是归一化圆周测度。$P[A]$ 表示把多项式 $P$ 代入矩阵 $A$ 并保留矩阵系数的张量写法，见第 1 节。"放大"（amplification）指把标量系数的陈述升级到 $M_m(\C)$ 值系数，即 $m$ 从 1 变到任意。

## 0 我进场时手里有什么

先把入场时的已知量摊在桌上，免得后面把新东西当成旧东西。

研究对象是数值范围（numerical range，也叫 Toeplitz--Hausdorff 像）：

```tex
The numerical range of a matrix $A\in M_n(\C)$ is
\[
 W(A)=\{u^*Au:u\in\C^n,\ u^*u=1\}.
\]
It is a compact convex set containing the spectrum.
```

这是 `main.tex:38-42`。紧、凸、含谱，三条性质都在，但真正决定我全部设计的是第四句（`main.tex:42-46`）：

```tex
For a normal matrix, the spectral theorem controls polynomial evaluation by
values on the spectrum. For a nonnormal matrix, the spectrum alone cannot provide the
same control: even a nonzero nilpotent matrix has spectrum $\{0\}$.
The numerical range retains enough information to give a universal bound.
```

我读这段时把它当成信息论的记账：谱是 $n$ 个点，幂零 Jordan 块能把这个集合缩成一个点而范数任意大，所以任何"用谱上取值控制 $P[A]$"的路线（谱投影、Riesz 积分、$H^\infty$ 演算的谱包络版本）在起点就缺信息。数值范围保留了够用的信息。这句话同时告诉我不能做什么：不能靠特征值分解，只能靠"$u^*Au$ 这一族标量"。

第二步是把问题从标量搬到矩阵值，这是"complete"三个字的来源（`main.tex:48-56`）：

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

注意 $A^k\otimes B_k$ 的写法：底空间 $\C^n$ 在第一因子，系数空间 $\C^m$ 在第二因子，范数是 Hilbert 张量积诱导的算子范数。我要证的是把 $P$ 换成矩阵值之后再取算子范数，界仍然只依赖 $W(A)$ 上的逐点范数最大值。

进场时手里最好的结果，按论文的口径（`main.tex:74-100`，逐字引用见第 14 节）清点如下：Crouzeix 2004 提出标量常数二问题，2007 给出第一个完整界 $11.08$；Crouzeix--Palencia 2017 把完整界做到 $1+\sqrt2$，Ransford--Schwenninger 2018 简化其最后一步范数论证但量级不动；Badea--Crouzeix--Delyon 2006 对 $n=2$ 做完整常数二；Åhag--Czyż--Virtanen 2026 对 $n\le3$、$m$ 任意做出完整不等式；Jin、Lorist--Schwenninger、Luo 三篇 2026 年是标量（$m=1$）证明。也就是说我进场时知道：标量情形已被攻下，完整情形只在小底维数（$n\le3$）与特殊结构（加权移位，Crouzeix--Greenbaum 2025）下知道，而 $n$ 与 $m$ 同时自由的完整情形没人做。

有一条障碍是别人已经写明、我必须正面接住的（`main.tex:94-96`）：

```tex
their Section~3(iv) explains why the
commutation used in that proof does not automatically persist under
amplification.
```

这半句是我全部路线约束的来源：标量证明里凡是用到"两个多项式相乘可交换"的地方，到了 $M_m(\C)$ 值系数就失效，因为 $D_iE_j\ne E_jD_i$。论文在 `main.tex:68-72` 把自己应对这件事的说法写得很直白：

```tex
The estimate includes point and segment numerical ranges. Its complete
character is the uniformity in $m$: a scalar proof need not survive
matrix amplification, because coefficient matrices need not commute.
The argument below keeps their multiplication order, using the two
products $FG$ and $GF$ separately.
```

三句话是全文的密码本：complete 就等于对 $m$ 一致；标量证明未必扛得住放大，因为系数矩阵不交换；应对办法是保住乘法顺序，把 $FG$ 与 $GF$ 分开用。我在草稿纸上抄这三句抄了不止一次，因为后面每一步"为什么这么绕"都能回到它。

还有两件事在我进场时就决定了我打算省掉什么。第一，同仓库已经有一篇结构证明（`OpenAI2026Complete`，即 *The complete Crouzeix theorem: optimal similarity and a common positive boundary representation*），它造了正定 $S$ 与公共正边界密度，那正是我想避开的 heavyweight 对象。论文在 `main.tex:124-128` 交代分工：

```tex
The direct proof below estimates one polynomial at a time. Its exterior
kernel, marginal identities, and positive block comparison have counterparts
in \cite[Propositions~3.1 and~3.3 and Lemma~5.1]{OpenAI2026Complete};
Sections~\ref{sec:coefficients}--\ref{sec:matrix} prove the specific
coefficient, resolvent, and block estimates used here.
```

`estimates one polynomial at a time` 是我给自己定的纪律：不构造任何全局对象，一次只针对一个多项式、一对奇异向量做估计。

第二，我必须承认的取舍是维数：论文标题与定理都是 matrix，摘要写 `in all finite base and coefficient dimensions`（`main.tex:33`），而 Lorist--Schwenninger 那条被描述为适用于 `bounded Hilbert-space operators`（`main.tex:93-94`）。也就是说别人的定理在底空间维数上覆盖更广（无限维），我只做有限维。这一点论文没有展开讨论，我在第 15 节的未述清单里留着，不在这里粉饰。

起初我以为最自然的入口是把 Delyon--Delyon 的正边界表示拿来，用表示定理把 $\|P[A]\|$ 写成一个边界积分再取范数。这条路我推了半页就停下，因为表示定理给的是"存在一个表示测度"，而表示测度的全变差范数正是要估的东西，会绕回原点；而且一旦我要让表示同时对所有 $m$ 成立，就得要求它是**完全**正的公共表示，那已经是结构论文的产出物，违背我"一次一个多项式"的纪律。真正可用的只有那个核本身的正性，这就是 `main.tex:291-293` 那句的来由（后面第 8 节细讲）。

本行只补登记：本笔讽事的论文目录为 preprints/A-direct-proof-of-the-complete-Crouzeix-inequality-September-26-2026，在 .tools/lean_queue.txt 队列第 15 行号（目录名由本笔自己在 §0 写明，本行不改前文）。

## 1 主定理与"完整"二字的量化账

主定理（`main.tex:58-66`，标签 `thm:main`，公式标签 `eq:main`）：

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

摘要（`main.tex:31-36`）自陈定位：

```tex
\begin{abstract}
We give a direct proof of the sharp constant-two numerical-range inequality
for matrix-valued polynomials in all finite base and coefficient dimensions.
This resolves the complete Crouzeix conjecture in its matrix formulation,
including matrices whose numerical ranges are points or line segments.
\end{abstract}
```

我把量化顺序逐字对齐一遍，因为 Lean 那边要按它核对：

$$\forall n\,\forall m\,\forall d\,(0<n\wedge 0<m)\Rightarrow\forall A\in M_n(\C)\,\forall (B_0,\dots,B_d)\in M_m(\C)^{d+1}:\ \Bigl\|\sum_{k=0}^d A^k\otimes B_k\Bigr\|\le 2\max_{z\in W(A)}\Bigl\|\sum_{k=0}^d z^kB_k\Bigr\|,$$

外加一条独立的最优性断言：$\forall c\,(c\text{ 是一致界})\Rightarrow 2\le c$。

逐条要点：

1. `For every pair of positive integers n,m`：底空间维数 $n$ 与系数维数 $m$ 同时任意、彼此独立。
2. `every A\in M_n(\C)`：对 $A$ 不加非次法向（nonderogatory，即每个特征值几何重数一）、数值范围有内部、可对角化这类假设。**允许 $W(A)$ 是一个点或一条线段**，这是摘要里那句 `including matrices whose numerical ranges are points or line segments` 的兑现义务。
3. `every nonnegative integer d`：次数不受限，且 $d=0$ 也在内。
4. `every polynomial P(z)=\sum B_k z^k with B_k\in M_m(\C)`：系数矩阵不交换。
5. 末句 `The constant two cannot be decreased uniformly over n,m, and d.`：2 是在 $(n,m,d)$ 全体上一致的最优常数，不是某个固定维数下的最优。

Lean 侧对这三层"完整"的机械对应，我在第 17 节全量核对，这里先给三条锚点。`UniversalBound c` 把三连量化写死（`Model.lean:28-32`）：

```lean
def UniversalBound (c : ℝ) : Prop :=
  ∀ (n m d : ℕ), 0 < n → 0 < m →
    ∀ (A : Matrix (Fin n) (Fin n) ℂ)
      (B : Fin (d + 1) → Matrix (Fin m) (Fin m) ℂ),
      ‖tensorEvaluation A B‖ ≤ c * rangeMaximum A B
```

系数不交换这件事在机器里靠 `tensorPolynomial` 的定义位置承担（`PolynomialCalculus.lean:58-66`，用 `Polynomial.eval₂RingHom'`，系数环的像必须与 $A\otimes1$ 交换才张得出这个演算）。而 $FG$ 与 $GF$ 分开用这件事被拆成两条方向不同的乘积界 `hsSq_mul_le` 与 `hsSq_mul_le_right`（`HilbertSchmidt.lean:62-90`）。这三处合起来说明：论文 `main.tex:68-72` 那三句密码在形式化里都有对应的类型层约束，"complete"是一个可以被机器检查的词。

我为什么把最优性当独立事件对待：`main.tex:65` 那句 `The constant two cannot be decreased uniformly over $n,m$, and $d$.` 在 Lean 里是第二条定理 `uniform_sharpness`，与 `complete_crouzeix` 并列写进验收配置的 `theorem_names`（`ComparatorChallenges/DirectCrouzeix.json`）。上界与下界同地位，这一点在我写作时就要照顾到：任何一步我若偷偷用了"2 可以换成某个更大的数"的松弛，下界例子就会立刻把松弛暴露出来。

试过的三条入口路线与各自的机械死因。

**死路一：把标量证明逐个升级（bootstrap）。** 设 $F$ 是标量多项式，标量证明给出 $|y^*F[A]x|\le 2\max\|F\|$ 型的界；我想对矩阵值系数套用同一个证明。机械死因在测试多项式的选取：标量路线最后要把测试 $G$ 取成与 $F$ 共轭方向的多项式以取到 Cauchy--Schwarz 等号，此时需要 $F[A]G[A]=G[A]F[A]$，而 $P[A]Q[A]=(PQ)[A]$ 只在**保序**意义下成立（见第 9 节的 `eq:ordered-products`）。Lorist--Schwenninger 自己在 Section 3(iv) 写明了这件事（`main.tex:94-96` 那句引用就是证据），所以升级路线在文献层面已被排除，这个困难不属于我的想象，它是被确认的障碍。

**死路二：从小底维数往外推。** Åhag--Czyż--Virtanen 的 $n\le3$ 是完整结果（$m$ 任意），他们的做法要具体刻画 $3\times3$ 矩阵的数值范围边界（分段解析弧、有限个椭圆弧）。机械死因：我的整条链要一个**外共形坐标 $h$ 在领子 $|\lambda|>r$ 上单叶亚纯**（第 5 节），而 $n\le3$ 的边界刻画给不出对任意 $n$ 一致的解析领子存在性；更根本的是他们的论证把 $A$ 的结构（特征值重数、边界弧类型）当作分情形依据，而我的定理必须覆盖点与线段数值范围那种最退化的结构，分情形清单在 $n$ 增大时会爆炸。

**死路三：先做相似变换把 $W(A)$ 变成圆盘。** 这是 Badea--Crouzeix--Delyon 在 $n=2$ 的路子（`main.tex:85-88`：用数值范围椭圆把共形像变成条件数不超过 2 的相似下的压缩）。它在 $n=2$ 成功，我想推广。机械死因有两条，第一条在第 8 节会详细展开：$R+R^*\succeq0$ 这个正性只对**原矩阵** $A$ 成立（支撑线不等式 `eq:support` 里的 $z$ 必须是 $v^*Av$ 这样的数值范围点），一旦换成 $SAS^{-1}$，二次型变成 $v^*(SAS^{-1})v$，它一般跑出 $W(A)$，正性立刻失效。第二条：$P[A]$ 的范数只在 $S$ 只作用第一因子时与相似相容，条件数 $\kappa(S)$ 会直接乘进常数，于是"2"变成"$2\kappa(S)$"，除非我像 $n=2$ 那样有几何理由保证 $\kappa(S)\le2$，而一般的 $A$ 没有这个几何。

## 2 全文依赖图与两条反向边

我做完之后回头整理，链条长这样（节点名用 TeX 里的 label，行号是 `main.tex` 位置）：

```
附录 sec:collar（main.tex:533-621）
   lem:exterior-collar  外共形坐标 h（领子 r_0、单极点 c≠0、q=λh' 是外法向、支撑线不等式）
        │  依赖：Riemann 映射定理、Carathéodory Jordan 定理、Schwarz 反射、
        │        单位圆周的有限覆盖粘合（"第三半径"论证）、局部反演 + 紧致性 ⇒ 更小邻域内单叶
        ▼
第 2 节 sec:coefficients（main.tex:162-285）
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
第 3 节 sec:matrix（main.tex:286-453）
   lem:resolvent  R(λ)=q(λ)(h(λ)I-A)^{-1}=Σ b_k(A)λ^{-k}、R+R*≽0、‖b_k(A)‖≤Cθ^k
        │  依赖：σ(A)⊂W(A)、eq:support、合同变换 B*(R+R*)B
        ▼
   thm:domain  （γ=‖F[A]‖、F 在 ∂Ω 上 ‖F‖≤1 ⇒ γ≤2）
        │  内部子链条（论文用 \emph 小标题切分，main.tex:346/357/409/434）：
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
第 4 节 sec:limit（main.tex:454-531）
   lem:approx  解析凸外逼近 Ω_δ（指数和次水平集、δ-网含四个轴向、Hessian 正定、
        │       距离估计 sup dist(z,K) ≤ δ(1+diam K)/(1-δ)）
        ▼
   thm:main  证明 = Toeplitz–Hausdorff 凸性重证 + lem:approx + thm:domain 缩放 + 一致连续取极限
             + 2×2 幂零 A=[[0,2],[0,0]], P(z)=z, m=1 给最优性
```

这张图我重画过一次，因为初版我把 `lem:approx` 画在 `lem:exterior-collar` 之后，逻辑上反了：附录要求 $\Omega$ **有内点**（要在里面挑 $z_*$），而退化 $K$ 的内点正是 `lem:approx` 造出来的。所以依赖边是 `lem:approx` 指向 `lem:exterior-collar`，虽然排版上附录在最后。

两条反向边值得单独记。

**第一条是正文引用附录。** `main.tex:327`：

```tex
Choose $h$ from Lemma~\ref{lem:exterior-collar} and apply
Theorem~\ref{lem:faber} to this coordinate.
```

附录排在 `\input{references.tex}` 之前、`\appendix` 在第 532 行。逻辑上它是第一块基石，阅读顺序上却是最后一块。这个安排对我写作时的影响是：第 2 节开头必须先假设 $h$ 存在（`main.tex:163` 那句 `We work with a supplied exterior conformal map $h$`），并且 `main.tex:167` 提前声明 `Appendix~\ref{sec:collar} supplies such a coordinate for every domain under consideration. Here we use it to compare polynomial coefficients with boundary norms.` 后半句 `Here we use it to compare polynomial coefficients with boundary norms` 是分工声明：本节只管系数与边界范数的比较，几何存在性外包。

**第二条是环境命名的不一致。** `lem:exterior-collar`、`lem:approx` 用 `lemma` 环境，`prop:coefficients` 用 `proposition`，而 `lem:faber`、`lem:resolvent` 虽然 label 前缀是 `lem:`，声明处却是 `theorem`（`main.tex:182`、`main.tex:295`）。这是升格痕迹：它们一度被当作引理，后来各自有了完整假设清单、需要被独立引用。升格留下的墨渍在 `lem:faber` 的假设里：第 183 行 `Let $h$ be meromorphic and one-to-one on $|\lambda|>r$ including infinity ...` 与 §2 开头第 163 行几乎逐字重复。我看到重复时的第一反应是删掉一处，但我最终保留了，因为 `lem:resolvent` 的假设里那句更夸张（`main.tex:296`）：`Let $\Omega,h,q$, and $(b_k)$ satisfy the hypotheses and conclusions of Theorem~\ref{lem:faber}.` 它要的是**假设与结论一起**，也就是说 $b_k$ 的多项式性、`eq:boundary-basis`、几何衰减都被当已知量搬运。这种"把结论当假设传递"的写法只在两条陈述都被完整写下来时才安全，于是两条都不能省。

在 `main.tex:236-243` 还有两段不属于任何 theorem 环境的"身份确认"文字。第一段把 $b_k$ 认成 Faber 多项式：$\Phi=h^{-1}$，由 `eq:boundary-basis` 得 $b_k(z)-\Phi(z)^k=O(z^{-1})$（$z\to\infty$），故 $b_k$ 是 $\Phi^k$ 的多项式部分，即所选外坐标下的 Faber 多项式；并交代经典归一化会挑 $h$ 的相位使 $c>0$（`main.tex:236`：`The usual normalization chooses the phase of $h$ so that $c>0$ \cite{Beckermann2005,BeckermannCrouzeix2014}.`）。第二段把 $s_{kj}$ 认成微分后的 Grunsky 系数（differentiated Grunsky coefficients，即 $\lambda\partial_\lambda$ 作用在 Grunsky 系数生成函数上得到的那组混合系数）：

```tex
These mixed coefficients are differentiated Grunsky coefficients.
The classical normalization gives a weighted coefficient inequality
\cite[equations~(1.1)--(1.3)]{BeckermannStylianopoulos2018};
the unweighted estimate used here follows from convexity and the two
angular marginal identities.
```

最后这半句是"直接"二字的第二个技术落点：不借 Grunsky 理论的重型机器，只用凸性给的支撑线符号加两个边际归一化。我在第 6 节会看到它具体省掉了什么。

关于组织方式的三条候选死路。[推测] 其一，把附录改成正文第一节（先建几何再建分析）。死因：这样 §2 的读者要先读 90 行共形映射的粘合与延拓论证才能看到任何一个不等式，而 §2、§3 的所有估计在逻辑上只用到附录结论的四条（$h$ 存在、$q$ 是外法向、`eq:support`、展开式 `eq:h`），把三条经典定理的组装过程放在最前面会淹没重心。其二，把 `lem:exterior-collar` 的结论当已知引用（引 Kellogg--Warschawski 或外部映射的边界解析延拓定理）。死因见第 5 节 (d)：我需要的是"单叶领子 + 单极点 + 系数几何衰减"三件事同时到手，分开引两次定理还要核对相容性。其三，把 `eq:support` 直接当假设写进 §2 而不给来源。死因：`eq:support` 的符号方向（外法向朝外、$z$ 在内侧）是整条链唯一一次用到凸性，去掉来源就无法说明这个符号为什么必须朝这一边，第 6 节的 $K\ge0$ 会变成断言。

## 3 "直接"直接在哪三层

我把"直接"拆成三层，每层都能指出 `main.tex` 里的字面位置。这三层的划分是我自己做的，论文只给了 `direct` 这个词和 `main.tex:124-128` 那段自述；[推测] 分层是为了让"我到底省掉了什么"可被逐项检查。

**第一层：不建结构对象，一次只估计一个多项式。** 原文已在第 0 节引用（`main.tex:124-128`）。对照同族的结构证明（`main.tex:114-123`）：

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

两条路线的分工我整理成一张表（第 2、3 列取自 `main.tex:114-128` 的自述；末行含 [推测]）：

| 维度 | 本篇 DirectCrouzeix（直接） | StructuralCrouzeix（结构） |
| --- | --- | --- |
| 共形映射方向 | **外**共形映射 $h:\{|\lambda|>1\}\to\C\setminus\overline\Omega$（`main.tex:163`） | **内**共形映射 $f:\Omega\to\D$（`main.tex:118`） |
| 核心产出 | 一条数不等式 $\|P[A]\|\le2\max_{W(A)}\|P\|$ | 一个算子对象：正定 $S$，$\|S\|\|S^{-1}\|\le2$，使 $Sf(A)S^{-1}$ 为压缩 |
| 边界表示 | 不存在全局边界测度；只在一次估计里临时用 $R+R^*$ | 存在同一个归一化正边界密度，对一切系数维数、一切近 $\overline\Omega$ 全纯的函数统一表示 |
| 主要工具 | 单变元 Fourier 分析（$L^2(\T;M_m)$）加双变元正核 $K(\lambda,\mu)$ | 变分/极小度量（minimizing metric） |
| 估计对象 | 一个多项式 $F$ 加它的一对奇异向量（`main.tex:329`） | 整个泛函演算的表示 |
| 常数的来源 | Parseval 权重配平（$1$ 对 $1,\tfrac12$）给出 $\gamma^2\le4$ | 相似条件数 $\|S\|\|S^{-1}\|\le2$ |
| 覆盖范围 | 所有 $n,m,d$（点/线段数值范围靠 `sec:limit` 的外逼近） | 同样完整，但要求 $W(A)\subset\Omega$ 且 $\partial\Omega$ 正则实解析后取极限 |
| 相互引用 | `main.tex:124-128` 点名 companion 的 Prop 3.1/3.3、Lemma 5.1 有对应物 | companion 侧 [推测] 把本文这条路线作为另一篇直接证明并列，具体措辞见该论文（本素材不做那一篇） |

外共形映射与内共形映射的选择不是风格偏好。内映射 $f:\Omega\to\D$ 要求 $\Omega$ 有内点且 $f$ 在内部定义，它自然服务于"$f(A)$ 是压缩"这种演算陈述；外映射 $h$ 把单位圆周直接参数化成 $\partial\Omega$，于是边界积分变成圆周的 Fourier 积分，$b_k$ 才有 `eq:boundary-basis` 那种"恰好一个正频项"的形状。我这整篇论文活在 Fourier 侧，所以只能用外映射。

**第二层：常数的出现方式。** 传统路线的常数（$11.08$、$1+\sqrt2$）来自把若干不等式串联后剩下的余量；我的 2 来自一条双向夹逼。`main.tex:149-158`：

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

`exactly` 与 `after a common factor of four` 说的是：2 没有被压出来，两边权重刚好配平。`The cross term retains all coefficients of the first functional, including its constant coefficient` 是关键一句：交叉块 $M+L^*$ 的 Fourier 权重是全 1（`main.tex:429-431`），对角块 $P+P^*,Q+Q^*$ 的权重是 $1,\tfrac12,\tfrac12,\dots$，正是这一组权重差把常数从"某个大于 2 的数"钉到 2。第 16 节的常数台账会把这句话变成等式。

**第三层：与已知路线的差异。** 我按论文自己的顺序把每条路线的差别写成一句机制（逐字引文在 `main.tex:74-112`，第 14 节全文照录）：

- Crouzeix 2004 提出标量常数二问题、2007 给出完整界 $11.08$：差在常数与论证层级。
- Delyon--Delyon 1999 的正边界表示：`main.tex:291-293` 明说 `This Hermitian field is the numerical-range double-layer kernel of \cite{DelyonDelyon1999,CrouzeixPalencia2017}; we prove the required positivity for the original matrix $A$.` 即不引其表示定理，只借同一个核（双层位势核，Delyon 夫妇用来表示数值范围上函数演算的那个正 Hermitian 场）的正性并自证。
- Crouzeix--Palencia 2017 的 $1+\sqrt2$：他们把问题化成一个奇异积分/Cauchy 变换的算子范数估计，常数被这个范数量级支配。我换成离散 Fourier 侧的系数恒等式加正块矩阵比较，"奇异积分范数"这个瓶颈就不存在了。[背景] $1+\sqrt2$ 在 Hilbert 变换关于凸曲线的 $\|H\|\le\tan(\pi/2\alpha)$ 型估计里出现，**这条推导论文未述**，只写了构造方法（`combined a positive double-layer potential with the Cauchy transform of conjugate boundary data`）。
- Ransford--Schwenninger 2018：只简化最后一步范数论证，量级不动。
- Badea--Crouzeix--Delyon 2006（$n=2$ 完整 2）：靠相似变换把共形像变压缩，条件数不超过 2，工具是数值范围椭圆。那是"2 从相似条件数来"的老路子；我全程不做相似、不构造 $S$，2 从权重配平来。
- Crouzeix--Greenbaum 2025（加权移位矩阵的完整 2）：标量极值函数加相似化约后取达到范数的向量。我在 `main.tex:111-112` 给的替代说法是 `Here a Faber coefficient estimate controls the two diagonal functionals obtained by placing a test polynomial on each side of the polynomial being estimated.`：不化约 $A$、不假设移位结构，用"两侧各放一个测试多项式"（$FG$ 与 $GF$）代替"取一个极值函数"。
- Jin 2026 / Lorist--Schwenninger 2026 / Luo 2026：三篇标量（$m=1$）证明，定位句在 `main.tex:99-100`：`The scalar results fix $m=1$, while the latter complete result restricts the base dimension; Theorem~\ref{thm:main} leaves these dimensions independent.`
- Åhag--Czyż--Virtanen 2026：$n\le3$、$m$ 任意，与我互补（他们限底维数）。
- Beckermann 2005 / Beckermann--Crouzeix 2014：Faber 多项式进入数值范围泛函演算的先例（`main.tex:102-103` 承认）。`main.tex:236` 提到经典归一化选相位使 $c>0$，而我**没有采用**，只要求 $c\ne0$，机械理由在第 6 节。
- 用户点名但我手里这篇没有的路线：`references.tex` 里没有 Crouzeix--Haage，没有 Glovo--Okounkov--Seip--Soria--Varona，没有 Beckermann--Sørensen。这三条与本文的差异**论文未述**；我要写只能标成 [背景]，不能算论文内容。

一句话总结我这层的取舍：不构造任何全局对象（不做相似变换、不建公共正边界密度、不取极值函数），对给定 $F$ 取一对奇异向量、把预解式压缩成 $2\times2$ 块矩阵 $\Delta$，靠 $K$ 核的 $L^2$ 压缩性质把"系数 $\ell^2$ 范数"与"边界 $L^2$ Hilbert--Schmidt 范数"夹成双向不等式，再让 $\Delta\succeq0$ 把权重 $1,1,1,\dots$（交叉块）与 $1,\tfrac12,\tfrac12,\dots$（对角块）之差兑换成恰好 $\gamma^2\le4$。

## 4 记号表与三条全局口径

全文记号散在 §2 开头与导言，我先集中一次。后面每一处常数都要回引这张表。

| 记号 | tex 出处 | 定义原文或说明 |
| --- | --- | --- |
| $\C,\T,\D$ | `main.tex:10-12` 宏 | `\newcommand{\C}{\mathbb C}` 等；$\T=\{\lambda:|\lambda|=1\}$ 在 `main.tex:169` 文字里点明 |
| $\HS x=\lvert x\rvert_2$ | `main.tex:13` `\newcommand{\HS}[1]{\lvert #1\rvert_2}` | 未归一化 Hilbert--Schmidt 范数；`main.tex:180`：`We use the unnormalized Hilbert--Schmidt norm $\HS C=(\tr(C^*C))^{1/2}$, which makes each finite-dimensional matrix space a Hilbert space.` |
| $\tr,\Rea,\diag,\dist$ | `main.tex:14-17` | `\DeclareMathOperator`；正文出现 $\tr$（180、442-444）、$\Re$（直接用 `\Re`，171、229、317、320、484、493）、$\diag$（440 行 $J=\diag(I_m,-I_m)$）、$\dist$（`lem:approx`） |
| $d\tau(e^{it})=dt/(2\pi)$ | `main.tex:178` | `Every circle integral below uses $d\tau(e^{it})=dt/(2\pi)$.` 归一化圆周测度，总质量 1。它与 $\HS{\cdot}$ 的未归一化是配套的一对选择，见下面第二条口径 |
| $\Omega$ | `main.tex:163` | bounded open **convex** set with regular real-analytic Jordan boundary |
| $h$ | `main.tex:163-166` | 外共形映射，在 $\lvert\lambda\rvert>r$（含 $\infty$）单叶，$0<r<1$，把 $\lvert\lambda\rvert>1$ 映到 $\C\setminus\overline\Omega$，在 $\infty$ 有单极点：`h(\lambda)=c\lambda+c_0+O(\lambda^{-1}),\ c\ne0` |
| $q(\lambda)=\lambda h'(\lambda)$ | `main.tex:169` | 在 $\T$ 上是外法向，$iq(\lambda)$ 是正向切向（原文：`the vector $q(\lambda)$ is an outward normal and $iq(\lambda)$ is a positively oriented tangent`） |
| $b_k$ | `main.tex:184-186` eq:faber | `\frac{q(\lambda)}{h(\lambda)-z}=\sum_{k\ge0}b_k(z)\lambda^{-k}`，在 $\infty$ 展开 |
| $s_{kj}$, $s(\lambda,\mu)$ | `main.tex:192-195` eq:s | `s(\lambda,\mu)=\frac{q(\lambda)}{h(\lambda)-h(\mu)}-\frac{\lambda}{\lambda-\mu}=\sum_{k,j\ge1}s_{kj}\lambda^{-k}\mu^{-j}` |
| $K(\lambda,\mu)$ | `main.tex:201-203` | `K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}` |
| $R(\lambda)$ | `main.tex:297-299` eq:R | `R(\lambda)=q(\lambda)(h(\lambda)I-A)^{-1}` |
| $P,Q,M,L$ | `main.tex:334-336` | `P=X^*RX,\ Q=Y^*RY,\ M=Y^*RX,\ L=X^*RY`；下标 $k$ 是 $\lambda^{-k}$ 的系数，如 $M_k=Y^*b_k(A)X$ |
| $a^2$ | `main.tex:341` | `Set $a^2=\sum_{k\ge0}\HS{M_k}^2$.` |
| $\|\cdot\|_\partial$ | `main.tex:368-371` | `\|H\|_\partial^2=\int_\T\HS{H(h(\mu))}^2\,d\tau(\mu)`，把边界 $L^2$ HS 范数的平方记成一个范数平方 |
| $\Phi=h^{-1}$ | `main.tex:236` | 外部的逆映射，用来认 Faber 多项式 |
| $\gamma$ | `main.tex:329` | `Put $\gamma=\|F[A]\|$.` |

三条贯穿全文的口径选择，它们比任何单个引理都更早决定成败。

**口径一：HS 未归一化，圆周测度归一化。** 这样 Parseval 是等号而没有 $m$ 因子：

$$\int_\T\HS{u(\mu)}^2\,d\tau(\mu)=\sum_{n\in\mathbb Z}\HS{\widehat u(n)}^2 .$$

若把 HS 归一化（除以 $\sqrt m$），$m$ 会从 Parseval 一侧冒出来，"对 $m$ 一致"就在形式上被破坏。[推测] 我认为这是"complete"能保住的最便宜的形式原因；论文 `main.tex:180` 那句强调未归一化，我当时觉得多余，后来在第 9 节清点 $m$ 时确认它是必需的。测度一侧若用 $dt$，边际 $\int K\,d\tau=1$ 变成 $2\pi$，第 7 节的 $L^2$ 压缩就带上 $2\pi$ 的因子，一路污染到最终常数。

**口径二：只用 $L^2$，不用 $L^\infty$。** 假设是 $\|F(z)\|\le1$ 在 $\partial\Omega$（$L^\infty$ 型），但估计全部在 $L^2(\T;M_m)$ 里做。桥梁是 $F$ 为多项式（有限 Fourier 支撑），于是一步 $\|F\|_\partial\le\sup_{\partial\Omega}\|F\|$ 就够了（`main.tex:380` 那条链里的 $\|FG\|_\partial\le\|G\|_\partial$ 用到它）。选 $L^2$ 的深层原因在第 9 节：最后的比较是一个**迹**不等式，迹需要 Hilbert--Schmidt 结构，而 $L^\infty$ 里没有任何东西可以取迹。

**口径三：$2\times2$ 块正性代替标量正性。** 所有正性只用一次 $\Delta\succeq0$（`main.tex:435-445`），它本身是 $2m\times2m$ 块矩阵；$J=\diag(I_m,-I_m)$ 的三明治把"交叉块被两个对角块控制"翻译成一个迹不等式，因此只需要 HS 这一个 Hilbert 结构，不需要任何谱分解。[推测] 这一条是完整性能保住的实质原因：谱分解会引入与 $m$ 无关但与非正规性有关的代价，而迹不等式对 $m$ 完全齐次。

三条口径各自有一条"改动即崩"的对照：改成归一化 HS 会在 `eq:coefficient-estimate`、`eq:pairing`、Parseval 三处同时冒出 $\sqrt m$；改走 $L^\infty$ 会让 `main.tex:442-444` 的 $\operatorname{tr}$ 无定义；把块正性降级成标量正性（例如只用 $\Delta$ 的对角元素非负）则交叉块完全没有上界，`eq:ordered-products` 之后的两条链失去汇合点。

## 5 附录 `lem:exterior-collar`：外共形坐标与单叶子领子

这一节是我全文真正动手的第一处，虽然它排在最后。目标对象是"外共形坐标"：把 $\{|{\lambda}|>1\}$ 共形地送到 $\overline\Omega$ 的外部，并且要能**跨过单位圆周**到 $|\lambda|>r$（$r<1$）这个"领子"（collar）上仍保持单叶亚纯。跨过圆周这件事后面全部分析都靠它：$b_k\circ h$ 的 Fourier 展开、系数几何衰减、预解式在更大领子上的全纯性，都要求 $h$ 的解析性延伸到 $\T$ 的内侧一点。

### 5.1 精确陈述（`main.tex:536-554`）

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

量化顺序：给定域，产出**一对** $(r_0,h)$。$h$ 的解析性只要求在领子 $\{|\lambda|>r_0\}\cup\{\infty\}$ 上作为球面映射单叶。`as a map of the sphere` 这个限定词我特意停下来重读了一遍：它把 $\infty$ 也放进单叶性的范围，等于说 $h(\infty)=\infty$ 且 $\infty$ 的原像唯一，这正是"在 $\infty$ 有单极点"的说法。

结论里塞了五件事，我逐条编号以免漏：(1) 领子存在且 $r_0<1$；(2) 球面意义单叶；(3) 单极点加展开式，首项系数 $c\ne0$；(4) $q(\lambda)=\lambda h'(\lambda)$ 在 $\T$ 上是**非零外法向**；(5) 支撑线不等式 $\operatorname{Re}(\overline{q}(h-z))\ge0$ 对一切 $z\in\overline\Omega$。第 2 节（§`sec:coefficients`）只用 (3)(4)(5)，第 6、8 节还要用 (1)(2)。

### 5.2 证明机制逐步重建（`main.tex:556-621`）

**步骤 1：反演把外部变成有界单连通域。** 取 $z_*\in\Omega$，对球面外部 $(\C\setminus\overline\Omega)\cup\{\infty\}$ 施加 $z\mapsto1/(z-z_*)$（$\infty$ 映到 0），像集记 $U$。论文对"$U$ 为什么是 star-shaped、为什么边界仍正则实解析"给的理由逐字可抄（`main.tex:561-564`）：

```tex
Its image $U$ is
a bounded simply connected domain containing zero, with a regular
real-analytic Jordan boundary. Indeed, each ray from $z_* $ meets
$\partial\Omega$ at a unique positive radius; inversion turns the
exterior portions of these rays into a star-shaped domain about zero.
```

这里凸性被用了两次：其一，射线从内点出发只交边界一次（唯一正半径）；其二，由此得到的像关于 0 星形。我第一遍读时以为星形性是可有可无的形容词，后来核对：星形性保证后面径向投影论证（第 5.2 节步骤 5 用到的同类手法）有唯一性可用，而凸性在这里就是星形性的来源。

$z_*\in\Omega$ 需要 $\Omega$ 有内点。这在 `thm:domain` 的假设里有（$\Omega$ 是 open convex），但 $W(A)$ 退化成点的情形是先由 `lem:approx` 造出开集才进入这条引理的。依赖图上的边是 `lem:approx` 指向 `lem:exterior-collar`，我在第 2 节已经说过这件事，因为它决定了我写附录时不能引用 §4 的任何东西。

**步骤 2：Riemann 映射加 Carathéodory。** 引 Ahlfors 1979 Chapter 6 §1.1 Theorem 1 得共形双射 $g:\D\to U$，$g(0)=0$；再引 Carathéodory 的 Jordan 域定理（Ahlfors Chapter 6 §1.2）把 $g$ 扩成 $\overline\D\to\overline U$ 的同胚。这一步只给**连续**边界延拓。我在这里给自己提了个醒：连续延拓与解析延拓之间的差距，正是后面 14 行文字的用量所在。

**步骤 3：Schwarz 反射给边界解析开拓。** 论文自陈目的在 `main.tex:569-570`：`We justify the stronger boundary continuation needed below.` 拆成六小步：

1. 正则实解析边界弧有非零导数的实解析参数化；
2. 参数化的全纯延拓加全纯反函数定理，给出局部坐标，把该弧变成**实区间**、域变成区间的一侧；
3. 在 $\zeta\in\partial\D$ 与 $p=g(\zeta)\in\partial U$ 各取这样的坐标；
4. 用边界延拓的**连续性**收缩源邻域，使 $g$ 把（源邻域 $\cap$ $\overline\D$）送进目标图；
5. $g$ 在新坐标下的表示：上半盘全纯、在实区间上连续、且在实区间上取实值，Schwarz 反射跨过实区间全纯延拓（Ahlfors Chapter 4 §6.5 与 Chapter 6 §1.3-1.4）；
6. 对 $g^{-1}$ 同样处理，收缩邻域使反射后的映射可复合；复合在原域一侧等于恒等，由 identity theorem 在整个更小邻域等于恒等，于是延拓后的 $g$ 在每个边界点导数非零。

第 4 与第 6 步很容易被略读。第 4 步："送进目标图"这件事必须先收缩才成立，否则反射坐标只在目标的一个小邻域里定义，复合根本没有意义。第 6 步：光反射 $g$ 只给全纯性，**导数非零**要靠把 $g^{-1}$ 也反射、再验证复合是恒等才拿得到。我起初以为可以省掉第 6 步，重读才停住：后面步骤 5 的单叶性论证要"每个边界点有局部反演邻域"，那就是 $g'\ne0$ 的直接推论，省掉第 6 步会让步骤 5 的反证失去支点。

**步骤 4：粘合，论文的"第三半径"论证（`main.tex:588-598`）。** 这一段是我认为全文最能说明"作者真的在算"的地方，因为它没有引用任何 standard patching 定理，粘合是现场做的：

- 每个 $\zeta\in\partial\D$ 取一个携带解析开拓的开圆盘 $B(\zeta,R_\zeta)$，它与 $g$ 在 $B\cap\D$ 上一致；
- 取有限子覆盖，但只覆盖**三分之一半径**的盘 $V_i=B(\zeta_i,R_i/3)$，大盘记 $U_i=B(\zeta_i,R_i)$；
- 若 $V_i\cap V_j\ne\varnothing$ 且 $R_i\ge R_j$，则
  $$|\zeta_i-\zeta_j|<(R_i+R_j)/3\le 2R_i/3<R_i,$$
  所以 $\zeta_j\in U_i$；同理 $\zeta_i\in U_j$。于是透镜形连通集 $U_i\cap U_j$ 同时包含 $\zeta_i,\zeta_j$，并且与 $\D$ 相交（它含边界点且是开集，任何边界点的邻域都碰到 $\D$）；
- 两个开拓在 $U_i\cap U_j\cap\D$ 这个非空开集上相等，由 identity theorem 在整个透镜上相等，故相容。

$1/3$ 在这里有硬理由。若改成一半半径：$|\zeta_i-\zeta_j|<(R_i+R_j)/2\le R_i$，而 $R_i=R_j$ 时右端是**非严格**不等式，$\zeta_j$ 可能恰好落在 $\partial U_i$ 上，透镜就不一定包含它，两开拓失去可比的重叠区。$1/3$ 把不等式变成严格的：$(R_i+R_j)/3\le 2R_i/3<R_i$。凡放宽到 $\ge1/2$ 都在"$\zeta_j\in U_i$"这一步崩。这是我见过的那种"系数 3 毫无美学价值、纯粹为不等式方向服务"的选择，Lean 侧同样出现三处 `S/3` 与三次 `3*(S/3)=S by ring`（`ConformalCollar.lean:124-127`、`:142-146`），我核对过，见第 17 节。

**步骤 5：紧致性给出更小邻域内的单叶性（`main.tex:600-607`）。** 标准反证：若在闭盘的任意小邻域内都不单叶，则存在相异点对任意接近该紧集，取子列收敛到 $\overline\D$ 内的公共极限；由 $\overline\D$ 上的连续性与单叶性，两点极限必须相同；而每个边界点有局部反演邻域（步骤 3 的 $g'\ne0$），充分接近后两点落在同一局部反演邻域内，与该邻域内单叶矛盾。于是存在 $R_0>1$ 使 $g$ 在 $\{|w|<R_0\}$ 单叶。

附两句必须记的账：`Its sole zero there is $0$, and that zero is simple.` $g(0)=0$ 且 $g'(0)\ne0$（单叶使除 0 外不取 0；$g$ 在 $\D$ 上是双射所以 0 的原像唯一）。这两句保证 $1/g(1/\lambda)$ 恰有**单**极点，也就是保证 (3) 里的 $c\ne0$ 存在。

**步骤 6：定义 $h$（`main.tex:609-613`）。**

```tex
 h(\lambda)=z_*+\frac1{g(1/\lambda)},\qquad r_0=R_0^{-1}.
```

$h$ 在 $\{|\lambda|>r_0\}\cup\{\infty\}$ 亚纯、单叶，$h(\infty)=\infty$，展开式 $h(\lambda)=c\lambda+c_0+\sum_{j\ge1}c_j\lambda^{-j}$ 里

$$c=\frac{1}{g'(0)}\ne0 .$$

这是全文第一个常数的来源。$c$ 没有被挑选，它是 $g'(0)$ 的倒数；$\lambda\mapsto1/\lambda$ 把 $\{|w|<R_0\}\setminus\{0\}$ 送到 $\{|\lambda|>r_0\}$，于是 $g$ 的 $R_0$ 盘外推变成 $h$ 的 $r_0$ 领子。

**步骤 7：法向与支撑线（`main.tex:615-620`）。** 在 $\lambda=e^{i\theta}$：径向导数 $\partial_r h(re^{i\theta})|_{r=1}=h'(\lambda)\lambda=q(\lambda)$；角向导数 $\partial_\theta h(e^{i\theta})=ih'(\lambda)e^{i\theta}=iq(\lambda)$。两者相差因子 $i$，故垂直且非零（$h'$ 在领子内不为 0，因为 $g'$ 在 $\{|w|<R_0\}$ 内非零）。半径增大进入 $\overline\Omega$ 的外部，所以 $q(\lambda)$ 指向外。最后一句 `The supporting half-plane property of a smooth convex boundary proves the final inequality.`：凸集在边界点被支撑半平面包含，$z\in\overline\Omega$ 在内侧，故 $\operatorname{Re}(\overline{q(\lambda)}(h(\lambda)-z))\ge0$。

符号方向是我第一遍读差点弄反的地方。不等式左边是 $\overline{q(\lambda)}(h(\lambda)-z)$，即"从 $z$ 指向边界点"的向量与外法向的内积非负；$z$ 在边界点内侧，$h(\lambda)-z$ 大体朝外，与外法向同侧。若误写成 $(z-h(\lambda))$，第 8 节 $R+R^*\succeq0$ 的符号会翻转，整条链立刻倒向 $\gamma\ge2$。Lean 里这个方向被写成 `0 ≤ (conj (Faber.boundaryNormal c g t)*(Faber.boundary c g t-w)).re`（`DomainBound.lean:77-78`），与 TeX 完全一致。

顺带记一处源码事实：`q(\lambda)=\lambda h'(\lambda)` 在附录第 548 行定义一次，在 §2 第 169 行**重新定义**了一次同名记号，两处措辞一致。这说明 §2 被写成可独立阅读的，也说明我在核对时必须确认两处定义真的相同（它们相同，都是 $\lambda h'(\lambda)$）。

### 5.3 各假设与常数的机械理由

| 假设或常数 | 用在哪一步 | 放宽后崩在哪 |
| --- | --- | --- |
| $\partial\Omega$ 正则实解析 Jordan 曲线 | 步骤 3（Schwarz 反射要解析弧的解析参数化与非零导数） | 只要 $C^k$ 或 Lipschitz：反射不成立，$h$ 不能跨过 $\T$，领子 $r_0$ 不存在，第 6 节里 $s$ 的双变量全纯与 $\lvert s_{kj}\rvert\le C_\rho\rho^{k+j}$ 全部失效，$T$ 不再是 $L^2$ 算子（核不收敛）。这就是"先做解析域、再用 `lem:approx` 外逼近"的全部理由 |
| Jordan（单闭曲线）加凸 | 步骤 1（射线唯一交点）、步骤 2（Carathéodory） | 边界自交则 $U$ 不是 Jordan 域，$\overline\D\to\overline U$ 同胚失败；非凸则射线可能多次交边界，星形性与 $z_*$ 的内点身份都失效 |
| $\Omega$ 有界 | 步骤 1（$U$ 有界） | 无界外部反演后 0 可能不是内点，$g$ 的像不有界；Riemann 定理仍可用但 $h$ 在 $\infty$ 的极点阶数会变（例如 $\infty\mapsto\infty$ 变高阶极点），$b_k$ 的次数不再是 $k$ |
| $z_*\in\Omega$（内点存在） | 步骤 1 | $\Omega$ 无内部（点或线段）时没有内点，整条附录不可用。这正是 `lem:approx` 存在的理由：先把退化的 $K$ 塞进有内部的解析凸域 |
| $c\ne0$（等价于单极点，等价于 $g'(0)\ne0$） | 第 6 节 $b_k$ 首项系数 $c^{-k}$；第 7 节 $b_k$ 是一组基 | 若 $c=0$，即 $g$ 在 0 有重根、$h$ 在 $\infty$ 有高于一次的极点，则 $b_k$ 的次数变成 $\lceil k/\nu\rceil$，$b_k\circ h$ 的正 Fourier 项变成 $\lambda^{k\nu}$ 型，正负频谱不再按 $k$ 分离，第 7 节把边界值拆成 $C_0+u+Tu$ 三块不交的写法失效 |
| $0<r_0<1$（领子宽度） | 只在第 6、8 节里选 $\rho,\theta$ 时用 | 若 $r_0=1$（无领子），无法取 $r<\rho<1$，几何衰减 $\lvert s_{kj}\rvert\le C_\rho\rho^{k+j}$ 变成无衰减，$s$ 在 $\T^2$ 上不再绝对一致收敛，`main.tex:267` 那句授权（`All interchanges are justified by the absolute uniform convergence`）失效 |
| $R_0>1$ 与 $r_0=R_0^{-1}$ | 步骤 4/5 的全部输出 | 论文对 $r_0$ 的**数值**毫无要求，只要 $<1$。这是刻意的：领子宽度不参与最终常数 2，但它是一整条链的存在性闸门 |

### 5.4 三条我试过的或可以试的替代路线

[推测] 其一，直接用"标准外部 Riemann 映射"（Ahlfors 的正规化 $h(\lambda)=\gamma+\lambda+\cdots$）。我一开始以为这是最省事的：外部共形映射的存在性是教科书标准结论。放弃的理由是标准做法仍要先证明外部映射可跨过边界，而论文的路线（反演成内部问题、在内部做反射、再变回来）让 Schwarz 反射用上现成的教科书陈述（Ahlfors Ch.4 §6.5），"第三半径"论证也落在开圆盘里最干净。

[推测] 其二，引 Kellogg--Warschawski 定理（边界解析的共形映射其导数连续延拓到边界）。那是一劳永逸的现成结果，但它处理的是内部映射的导数延拓，而我需要 $h$ 在 $\infty$ 附近 Laurent 系数的几何衰减，以及 $h$ 作为球面映射的**单叶领子**。自己从反射搭一遍可以同时拿到单叶性与极点阶数，避免引两次不同定理再核对它们的相容性。

[推测] 其三，用共形容量或数值共形映射（椭圆、多边形的 Schwarz--Christoffel 公式）具体写出 $h$。全文只在符号层面使用 $h$（通过 $b_k$、$s_{kj}$、$q$），任何具体 $h$ 都不需要写出来。一旦引入具体映射，证明就特殊化成"某类域上的证明"，还要再补一次逼近论证。这也解释了为什么我把附录写成存在性引理：附录的价值在于**它不需要知道 $h$ 长什么样**。

## 6 `lem:faber`：外 Faber 系数与正核

这一条是全文的技术发动机，也是"直接"最具体的落点：它把一个几何信息（凸性）兑换成一个 Hilbert 空间算子性质（一个 $L^2$ 压缩）。

### 6.1 精确陈述（`main.tex:182-205`）

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

陈述里塞了七件事，我列出来以免漏读：

1. $b_0=1$；
2. $\deg b_k=k$ 且首项系数 $c^{-k}$，于是 $\{b_k\}$ 是标量多项式的一组基（证明第 208 行末句 `In particular, the $b_k$ form a basis of the scalar polynomials.`）；
3. 边界展开 `eq:boundary-basis`：**恰好一个正频率 $\mu^k$，其余全为负频率，且没有零频项**；
4. $s$ 跨过对角线 $\lambda=\mu$ 与两个 $\infty$ 全纯延拓；
5. 系数几何衰减 $\lvert s_{kj}\rvert\le C_\rho\rho^{k+j}$，双指标同时衰减；
6. 在外部乘积领子上正规收敛（normal convergence，即在每个紧子集上绝对一致收敛），措辞特意加了 `including subsets meeting either infinity`；
7. $K=1+s+\bar s$ 连续、非负、每个变元边际积分为 1。

第 3 条是全部 Fourier 论证的形状来源，第 6、7 条是第 7 节那条 $L^2$ 压缩的全部输入。

### 6.2 证明机制逐步重建（`main.tex:207-234`）

**第一步：$b_k$ 的次数与首项（第 208 行）。** 把 `eq:faber` 的分母提出 $c\lambda$。用附录展开 $h(\lambda)=c\lambda+c_0+\sum_{j\ge1}c_j\lambda^{-j}$，则

$$q(\lambda)=\lambda h'(\lambda)=c\lambda-\sum_{j\ge1}j\,c_j\lambda^{-j},\qquad h(\lambda)-z=c\lambda\Bigl(1+\frac{c_0-z}{c\lambda}+\sum_{j\ge1}\frac{c_j}{c\lambda^{j+1}}\Bigr),$$

于是

$$\frac{q(\lambda)}{h(\lambda)-z}=\Bigl(1-\sum_{j\ge1}\frac{j\,c_j}{c}\lambda^{-j-1}\Bigr)\sum_{n\ge0}(-1)^n\Bigl(\frac{c_0-z}{c}\lambda^{-1}+\sum_{j\ge1}\frac{c_j}{c}\lambda^{-j-1}\Bigr)^{n}.$$

$\lambda^{-k}$ 的系数只能来自 $n\le k$（每个因子至少贡献 $\lambda^{-1}$），而 $z$ 只出现在 $\frac{c_0-z}{c}\lambda^{-1}$ 这一项里，所以 $z$ 的次数 $\le n\le k$。要拿到 $\lambda^{-k}$ 上的 $z^k$ 必须 $n=k$ 且每次取 $\frac{c_0-z}{c}\lambda^{-1}$，给出

$$(-1)^k\Bigl(\frac{c_0-z}{c}\Bigr)^{k}=\frac{z^k}{c^k}+\text{低次项},$$

故 $\deg b_k=k$、首项 $c^{-k}z^k$。$k=0$ 时只有 $n=0$ 项，值为 1，故 $b_0=1$。

这里有一个我必须写下来的阅读陷阱。第 208 行的原句是 `The constant coefficient is one.` 直读像"$b_k$ 的常数项是 1"，那是错的：圆盘情形 $h(\lambda)=\lambda$ 给 $b_k(z)=z^k$，$k\ge1$ 的常数项是 0。它指的是 $b_0$（$\lambda^0$ 那个系数对应的多项式）等于 1。展开式里"系数"一词同时指 $\lambda^{-k}$ 的系数与 $z^j$ 的系数，这句话在两个含义之间切换。我停下来重读，是因为在第 7 节用到 $b_0=1$ 时先按"$C_0$ 权 1"理解了，两条链一比较才发现矛盾。Lean 侧把这件事写得没有歧义：`faberBasis_zero : faberBasis c g 0 = 1`（`FaberPolynomials.lean:54`）与 `faberBasis_top_coeff : (faberBasis c g k).coeff k = c⁻¹ ^ k`（`FaberPolynomials.lean:57-64`）分成两条定理。

**第二步：联合延拓，引入 $H$ 并换成倒数变量（第 210-218 行）。** 定义

$$H(\lambda,\mu)=\frac{h(\lambda)-h(\mu)}{\lambda-\mu}.$$

写 $u=\lambda^{-1}$、$v=\mu^{-1}$，把 $h$ 拆成 $h(\lambda)=c\lambda+g(u)$，其中

$$g(u)=c_0+\sum_{j\ge1}c_ju^j\quad\text{在 }|u|<r^{-1}\text{ 上全纯}.$$

关键代数是 $\lambda-\mu=\frac1u-\frac1v=\frac{v-u}{uv}=-\frac{u-v}{uv}$，于是（`eq:H`，第 216 行）

$$H=c-uv\frac{g(u)-g(v)}{u-v}.$$

这个式子是整个构造的心脏：$h$ 的极点在左边，$g$ 的正则性在右边。论文接下来三句都是围绕它的**奇点清点**：

1. 整除差 $\frac{g(u)-g(v)}{u-v}$ 联合全纯，对角线值为 $g'(u)$，所以 `eq:H` 这个式子自动覆盖"其中一个或两个都是 $\infty$"的情形（第 218 行 `so this formula also covers either or both infinities`），即 $u=0$ 或 $v=0$ 时仍有意义。这是"$s$ 跨过两个 $\infty$ 延拓"的全部理由。
2. 非对角且离开坐标轴时 $H\ne0$，因为 $h$ 单叶（$\lambda\ne\mu$ 则 $h(\lambda)\ne h(\mu)$）。
3. 对角线上 $H=c-u^2g'(u)=h'(\lambda)\ne0$（共形映射导数非零）；坐标轴上（$u=0$）$H=c\ne0$。

合起来：`Thus it has no zeros on the reciprocal bidisk.`，即 $H$ 在双盘 $\{|u|,|v|<r^{-1}\}$ 上全纯且无零点。

**第三步：$s=-u\partial_u(H)/H$ 与严格混合幂（第 220 行）。** 验证那句 `Direct differentiation gives $s=\lambda\partial_\lambda H/H=-u\partial_uH/H$`：

$$\lambda\partial_\lambda\log\bigl(h(\lambda)-h(\mu)\bigr)=\frac{\lambda h'(\lambda)}{h(\lambda)-h(\mu)}=\frac{q(\lambda)}{h(\lambda)-h(\mu)},\qquad \lambda\partial_\lambda\log(\lambda-\mu)=\frac{\lambda}{\lambda-\mu},$$

两式相减得 $\lambda\partial_\lambda\log\frac{h(\lambda)-h(\mu)}{\lambda-\mu}=s(\lambda,\mu)$，即 $s=\lambda\partial_\lambda H/H$；再由 $u=1/\lambda$ 得 $\lambda\partial_\lambda=-u\partial_u$。$H$ 无零点，故 $s$ 在双盘上全纯。

然后是最关键的一句：`This function is holomorphic and vanishes on both reciprocal axes.` 因为 $s=-u\,\partial_u(H/H)$ 带一个因子 $u$，在 $u=0$（即 $\lambda=\infty$）处 $s=0$；对 $v$ 同理。一个在原点附近全纯、在两个坐标轴上都消失的函数，其 Taylor 级数 $\sum a_{kj}u^kv^j$ 满足 $a_{0j}=0$（对 $v$ 轴消失）与 $a_{k0}=0$（对 $u$ 轴消失），于是

$$s(\lambda,\mu)=\sum_{k\ge1,\,j\ge1}s_{kj}\lambda^{-k}\mu^{-j},$$

只有严格混合幂。这正是 `eq:s` 的右端，也正是 `eq:boundary-basis` 里"只有 $\mu^k$ 一个正频项、其余负频"的来源。这一点的机制我要写清楚：$b_k$ 的 Fourier 结构没有被算出来，它被"轴上消失"这一条事实决定。我第一次推到这里时试图显式算 $s_{kj}$ 的前几项来验证 $\mu^k$ 的系数是 1，算完发现多余：首项 1 来自减掉的 $\frac{\lambda}{\lambda-\mu}$（它的 $\lambda^{-k}$ 系数恰是 $\mu^k$），剩下的部分因为"轴上消失"只能落在负频，所以根本不需要算。

**第四步：Cauchy 估计与正规收敛（第 220-227 行）。** 逐句拆。

`For any $r<\rho<1$, Cauchy estimates on the closed reciprocal bidisk of radius $\rho^{-1}$ give a constant $C_\rho$ with $|s_{kj}|\le C_\rho\rho^{k+j}$.` 这里"reciprocal bidisk of radius $\rho^{-1}$"是 $(u,v)$ 坐标里的闭双盘 $\{|u|,|v|\le\rho^{-1}\}$（$\rho^{-1}>1$，而全纯半径是 $r^{-1}>\rho^{-1}$，装得下）。Cauchy 估计给 $|s_{kj}|\le\max_{|u|=|v|=\rho^{-1}}|s|\cdot(\rho^{-1})^{-k-j}=C_\rho\rho^{k+j}$，$C_\rho$ 就是这个最大值（可能有 2 之类的绝对值常数倍，论文不追踪）。

`On a compact subset of the exterior product collar, choose $\sigma>r$ below all finite coordinate moduli, and then $r<\rho<\min(1,\sigma)$.` 即在紧集上取所有**有限**坐标模长的下确界 $\sigma$；由紧性与 $\{|\lambda|>r\}$ 的开性，$\sigma>r$。再取 $\rho\in(r,\min(1,\sigma))$。于是紧集上 $|u|=1/|\lambda|\le1/\sigma<1/\rho$，严格落在 Cauchy 双盘内部，几何双级数

$$\sum_{k,j\ge1}C_\rho\rho^{k+j}|u|^k|v|^j\le\sum_{k,j}C_\rho(\rho/\sigma)^{k+j}$$

一致收敛（因 $\rho<\sigma$）。这就是 `The resulting geometric double series dominates the Laurent series uniformly there`。

`terms vanish on the reciprocal axes`：紧集中 $|\lambda|=\infty$ 的点（$u=0$）不需要估计，因为 $k\ge1$ 的所有项在那里自动为 0。这就是为什么要额外补一句 `including subsets meeting either infinity`：一般的 Laurent 收敛论证在无穷远点是断的，这里靠"轴上消失"补上。取 $\sigma$ 时把 $\infty$ 排除在"模长"之外是必须的，$\infty$ 没有模长；若紧集含 $\infty$，下确界只能对有限点取，而 $u=0$ 处项数为 0，两者配合才覆盖所有情形。

**第五步：从 $s$ 到 `eq:boundary-basis`（第 227 行末）。** 在 `eq:faber` 里代 $z=h(\mu)$：

$$\frac{q(\lambda)}{h(\lambda)-h(\mu)}=\sum_{k\ge0}b_k(h(\mu))\lambda^{-k}\qquad(|\lambda|>|\mu|),$$

又 $\frac{\lambda}{\lambda-\mu}=\sum_{k\ge0}\mu^k\lambda^{-k}$。两式相减并按 $\lambda^{-k}$ 比较系数：

$$b_k(h(\mu))-\mu^k=\sum_{j\ge1}s_{kj}\mu^{-j}.$$

论文加了两个限定，都很实在。`first for fixed finite $\mu$ in the exterior collar`：先固定**有限**的 $\mu$，保证几何展开 $|\lambda|>|\mu|$ 合法、且 $\mu$ 在领子内使 $h(\mu)$ 有意义；比较出的等式再靠两边在领子上的全纯性成为关于 $\mu$ 的恒等式（第 236 行回指 `which holds throughout the exterior collar`）。$k=0$ 时 $b_0(h(\mu))-1=0$，与 $s$ 无 $k=0$ 项自洽。

**第六步：正性与归一化（第 229-233 行）。** 圆周上的恒等式：对 $\lambda,\mu\in\T$、$\lambda\ne\mu$，`$2\Re(\lambda/(\lambda-\mu))=1$`。验算：$\overline{\lambda/(\lambda-\mu)}=\bar\lambda/(\bar\lambda-\bar\mu)=\lambda^{-1}/(\lambda^{-1}-\mu^{-1})=\mu/(\mu-\lambda)$，两式相加 $(\lambda+\mu)/(\lambda-\mu)$？我把这一步重算了一遍，正确写法是 $\frac{\lambda}{\lambda-\mu}+\frac{\mu}{\mu-\lambda}=\frac{\lambda-\mu}{\lambda-\mu}=1$，故实部两倍等于 1。$\checkmark$

于是

$$K=1+s+\bar s=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)}-\underbrace{2\Re\frac{\lambda}{\lambda-\mu}}_{=1}+1=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)} .$$

符号：$\frac{q(\lambda)}{h(\lambda)-h(\mu)}=\frac{q(\lambda)\overline{(h(\lambda)-h(\mu))}}{|h(\lambda)-h(\mu)|^2}$，取实部不改变值（分母是正实数），再由 `eq:support` 在 $z=h(\mu)\in\partial\Omega\subset\overline\Omega$ 处得 $\ge0$。**这里用到凸性的唯一一次，也是最本质的一次。**

对角线：`Continuity gives the same sign on the diagonal.` 因为 $s$ 跨过 $\lambda=\mu$ 全纯、$K$ 连续，非负集的极限仍非负。原始表达式 $2\Re\frac{q}{h(\lambda)-h(\mu)}$ 在对角线上是 $\infty/\infty$ 型，延拓后才是有限值，这正是"跨过对角线延拓"这条结论的用途。

边际：`Every term of $s$ and of its conjugate has nonzero frequency in each variable. Their integrals in either variable vanish, proving both normalizations.` 即 $\int_\T\lambda^{-k}d\tau(\lambda)=0$（$k\ge1$）与 $\int_\T\lambda^{+k}d\tau(\lambda)=0$，所以 $\int_\T s(\lambda,\mu)d\tau(\lambda)=0$、$\int_\T s(\lambda,\mu)d\tau(\mu)=0$，从而 $\int_\T K\,d\tau(\lambda)=\int_\T1\,d\tau=1$，另一变元同理。

最后一处要记的是 **$K$ 不对称**。$K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}$，而 $s$ 的两个变元角色不同（第一个变元带 $q(\lambda)$ 与 $\lambda/(\lambda-\mu)$），一般 $s(\lambda,\mu)\ne s(\mu,\lambda)$。论文在第 283-285 行专门强调：

```tex
$s_{kj}=\beta_{jk}$ in that paper's notation. In particular,
\eqref{eq:kernel-fourier-action} uses this coefficient orientation and
does not require symmetry of the kernel.
```

这句"不需要对称性"是一处防错声明：读者（或 companion 论文的作者）很容易顺手假设核对称，从而把 $s_{kj}$ 与 $\beta_{jk}$ 混用。

### 6.3 每个常数与假设的机械理由

| 对象 | 出现位置 | 机械理由 | 放宽后崩在哪 |
| --- | --- | --- | --- |
| $b_0=1$ | `eq:faber` 的 $k=0$ | $q\sim c\lambda$、$h-z\sim c\lambda$，比值零阶为 1 | 若 $b_0\ne1$（例如把 $q$ 换成 $\kappa q$），`main.tex:339` 的 `eq:means` 里 $P_0=X^*X$ 变成 $\kappa X^*X$，$a^2$ 与各边界范数的比例尺全部错位，最后 $\gamma\le2$ 会带上 $\kappa$ |
| $\deg b_k=k$，首项 $c^{-k}$ | 第 208 行 | 提出 $c\lambda$ 后 $\lambda^{-k}$ 系数最多含 $z^k$，$n=k$ 时正好取满 | 若 $h$ 在 $\infty$ 是 $\nu$ 阶极点（$\nu>1$），$\deg b_k\approx k/\nu$：同一个指标 $k$ 不再同时代表"多项式次数、Laurent 阶、边界频率"。`main.tex:367-371` 那句 `Write the full finite Faber expansions as $FG=\sum_kb_kU_k$` 的有限性、以及 $U_k$ 只在 $k\le\deg F+\deg G$ 出现这件事都要重写，$1,\tfrac12$ 权重配平被破坏。[分析] |
| $c\ne0$（等价于单极点） | `eq:h` | $c^{-k}$ 有定义；$H$ 限制在坐标轴上等于 $c\ne0$ | $c=0$ 时 $H$ 在坐标轴为零，$s=-u\partial_uH/H$ 有极点，领子内不再全纯，无几何衰减，第 7 节交换积分与求和的授权（第 267 行）失效 |
| 几何衰减 $\rho^{k+j}$（双指标） | 第 196-197、220 行 | Cauchy 估计在 $(u,v)$ 双盘半径 $\rho^{-1}$ | 只有单指标衰减（$|s_{kj}|\le C\rho^k$）时 $\sum_j$ 方向不收敛，$\sum_{j\ge1}\HS{\sum_ks_{kj}C_k}^2$ 可能等于 $\infty$，$T$ 不是 $L^2\to L^2$ 算子 |
| 正规收敛（含无穷远） | 第 198-200 行 | "$\sigma$ 取有限模长下界加轴上项为 0" | 只在 $\T^2$ 上绝对一致收敛也够第 7 节，但 $b_k\circ h$ 的恒等式（第 236 行 `which holds throughout the exterior collar`）需要整个领子；第 8 节里选 $r_A\in(r,1)$ 也需要在领子里展开 |
| $0<r<\rho<1$ 的存在 | 第 196 行 | $r<1$ 来自附录的 $R_0>1$ | $r=1$ 时无 $\rho$ 可取。这就是附录要多花力气证明 $R_0>1$ 的唯一理由：它对常数 2 无影响，但它是整条链的存在性闸门 |
| 凸性（只用一次） | `eq:support` 推出 $K\ge0$ | 支撑半平面 | $\Omega$ 非凸则 $K$ 变号，Jensen 型压缩不成，第 7 节双边不等式两端都失效。参照：`BeckermannCrouzeix2014`（参考文献）标题就是 *Faber polynomials of matrices for non-convex sets*，说明"凸"在这里不是装饰 |
| $K\ge0$ 与两个边际 $=1$ | 第 200-204 行 | 上面第五、六步 | 只有 $\int K=1$ 而 $K$ 不变号：$T$ 不是正算子，第 260 行的 Jensen 步 $\|(Tu)(\mu)\|^2\le\int K\|u\|^2$ 不成立（需要 $K\ge0$ **且**边际 $=1$ 同时成立）。若 $K\ge0$ 但边际 $=\kappa\ne1$：$\|T\|\le\kappa$，第 7 节右端权重从 2 变成 $1+\kappa^2$，最终 $\gamma\le2$ 变成依赖 $\kappa$ 的数（敏感度见第 16 节） |
| $s$ 无零频项 | 第 233 行 | 轴上消失推出严格混合幂 | 若 $s$ 含 $\lambda^0\mu^{-j}$ 项，$G\circ h$ 的常数项会多出一项，变成 $C_0$ 加来自 $s$ 的贡献，三块 Fourier 支撑不再干净分成 $C_0/u/Tu$，Parseval 分解要加交叉项，$\pm2$ 权重失去解释 |
| $q(\lambda)$ 取**外**法向的符号 | `eq:support` | 推出 $K\ge0$ | 反向则 $K\le0$，整条链符号翻转，正块比较给出反向不等式，$\gamma\le2$ 变 $\gamma\ge2$ |

### 6.4 四条我考虑过的路线与它们的死因

[推测] 其一，直接用现成的 Grunsky 不等式（Bieberbach--Grunsky 或 de Branges 路线）来控制 $\sum s_{kj}$ 的算子范数。经典 Grunsky 型系数不等式是**带权**的：它控制 $\sum_{j,k}jk|s_{jk}|^2x_j\bar x_k$ 这类量（第 238-241 行承认出处 `\cite[equations~(1.1)--(1.3)]{BeckermannStylianopoulos2018}`）。带权的不等式代入第 7 节会得到 $T$ 的**加权** $L^2$ 压缩，权 $\{k\}$ 与 $\{j\}$ 会乘进系数范数；而 `thm:domain` 需要的正是"$P_k$ 的权重恰好是 $1,\tfrac12,\tfrac12,\dots$"这种无权、常数级的权重表。权一旦带上 $k$，第 395-397 行的 `eq:weighted-dual` 与第 419-421 行的 `eq:diagonal-L2` 就不再是同一个量的两侧，配平失败。论文用"凸性加两个边际恒等式"绕开权重，是这条路线的替代，比它弱也比重型机器便宜。

[推测] 其二，走谱定理或谱测度。第 42-46 行已经把动机堵死：非正规矩阵上谱的信息量为零（$\sigma(A)=\{0\}$ 而 $\|P[A]\|$ 可以任意大）。谱包络的替代品是 $H^\infty$ 演算加相似变换（Badea--Crouzeix--Delyon 的路），但那要构造 $S$。我要"直接"，于是把谱定理换成边界 Fourier 分析：$L^2(\T;M_m)$ 上的 Parseval 扮演谱定理的角色，$b_k$ 扮演幂函数 $z^k$ 的角色。这个替换的代价是全部论证要依赖 $h$ 的解析领子，也就是把我绑在"先做解析域再外逼近"的路线上。

[推测] 其三，走 Schur 类算子或 Nevanlinna--Pick 插值。我要的"把正频部分映到负频部分的压缩"在结构上就是一个 Schur 类算子，但走 Schur 或 commutant lifting 路线需要被提升的映射是**完全压缩**，而那恰好是"对一切 $m$ 一致"的内容，路线循环。论文用 $K\ge0$ 加 Jensen 现场证明一个具体的 $L^2$ 压缩（见第 7 节），把提升问题消解成一次迹不等式。

[推测] 其四，在 $|\lambda|=1$ 上用留数定理直接算 $\int\|G\circ h\|^2$。那是 Crouzeix--Palencia 型做法（Cauchy 变换加双层位势的算子范数），会得到 $1+\sqrt2$ 量级的常数，因为它估计的是积分算子的范数，而我估计的是系数的 $\ell^2$ 恒等式。两篇用的 $K$ 核形式上是同一个双层核，但用法不同：我只用它的符号与边际，从不估计它的范数。这一点是"直接"最具体的体现之一。

## 7 `prop:coefficients`：系数范数估计

### 7.1 精确陈述（`main.tex:246-253`）

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

量化顺序要点：`For every positive integer $m$` 在**最前面**，$N$ 与系数 $C_k$ 在多项式里给定，$\Omega,h$ 是本节的全局假设（隐含量化）。这条命题里**没有 $A$**，纯粹是边界 Fourier 分析。这个"没有 $A$"很重要：它是我全部 $A$-依赖性的隔离区，$A$ 只从第 8 节进入。

三处容易被略过的写法细节：

1. 左端求和 $\sum_{k=0}^N$ 权重全 1；右端是 $\HS{C_0}^2+2\sum_{k=1}^N$，常数项权重 1、非常数项权重 2。这个 $1,2,2,\dots$ 与第 9 节 `eq:weighted-dual` 的 $1,\tfrac12,\tfrac12,\dots$ 是倒数关系，是全文最重要的一组对偶权重。
2. $G$ 用 Faber 基 $\{b_k\}$ 展开，不用幂基 $\{z^k\}$。$h$ 的几何被吸收进基函数里，这是选 Faber 基的唯一动机。
3. 右端是 $\int_\T\HS{G(h(\mu))}^2d\tau(\mu)$，边界上 HS 范数平方对归一化测度积分，所以圆盘情形它恰好等于 $\sum_k\HS{C_k}^2$（见 7.3 的基例）。

### 7.2 证明机制逐步重建（`main.tex:254-278`）

**第一步：定义算子 $T$。**

```tex
For $u\in L^2(\T;\mathcal H)$ with values in a Hilbert space $\mathcal H$, define
\[
 (Tu)(\mu)=\int_\T K(\lambda,\mu)u(\lambda)\,d\tau(\lambda).
\]
```

$\mathcal H$ 是**任意** Hilbert 空间，这里取 $\mathcal H=M_m(\C)$ 配 HS 内积（`main.tex:180` 那句 `which makes each finite-dimensional matrix space a Hilbert space` 就是为这一句准备的）。$K$ 是标量核，所以 $T$ 是"标量积分算子 $\otimes\,\mathrm{id}_{\mathcal H}$"。这个张量结构对我 later 的"对 $m$ 一致"是关键：标量核算子的 $L^2$ 范数与值空间无关。

**第二步：Jensen 型一步加两次边际。**

```tex
Positivity and the normalization in $\lambda$ imply
$\|(Tu)(\mu)\|^2\le\int K(\lambda,\mu)\|u(\lambda)\|^2d\tau(\lambda)$.
Integrating in $\mu$ and using the normalization in that variable shows that $T$ is an $L^2$ contraction.
```

展开：固定 $\mu$，由 $K(\cdot,\mu)\ge0$ 与 $\int K(\lambda,\mu)d\tau(\lambda)=1$，$d\nu_\mu(\lambda):=K(\lambda,\mu)d\tau(\lambda)$ 是概率测度，Bochner 积分的范数凸性（Jensen）给

$$\Bigl\|\int u\,d\nu_\mu\Bigr\|^2\le\int\|u\|^2\,d\nu_\mu .$$

再对 $\mu$ 积分，用 Fubini 与另一个边际 $\int K(\lambda,\mu)d\tau(\mu)=1$：

$$\|Tu\|_{L^2}^2\le\int_\T\!\!\int_\T K(\lambda,\mu)\|u(\lambda)\|^2d\tau(\lambda)d\tau(\mu)=\int_\T\|u(\lambda)\|^2d\tau(\lambda)=\|u\|_{L^2}^2 .$$

机械清点一下：`lem:faber` 结论里的三个事实，这里各用一次且只各用一次，即 $K\ge0$（Jensen 的测度非负）、$\lambda$ 边际（Jensen 的概率归一）、$\mu$ 边际（Fubini 后收掉 $\int d\tau(\mu)$）。少任何一个，$\|T\|\le1$ 都不成立。$K$ 连续（$s$ 在 $\T^2$ 绝对一致收敛）保证积分与 Fubini 无技术障碍。我起初以为这里要用 Schur 测试或者 Hilbert--Schmidt 核范数，读到我自己的第二步才确认：整条论证只需要 Jensen 与 Fubini，两行就够，这是"直接"在这一节的具体形状。

**第三步：$T$ 在正频多项式上的作用（第 263-266 行）。** 取 $u(\lambda)=\sum_{k=1}^N C_k\lambda^k$，逐项算 $\int K\lambda^k$：

- $1\cdot\lambda^k$：$\int_\T\lambda^kd\tau=0$（$k\ge1$）。
- $s(\lambda,\mu)\lambda^k=\sum_{a,b\ge1}s_{ab}\lambda^{k-a}\mu^{-b}$：只有 $a=k$ 项零频非零，$\int\lambda^{k-a}d\tau$ 给出指标 $[a=k]$，贡献 $\sum_{b\ge1}s_{kb}\mu^{-b}$。
- $\overline{s(\lambda,\mu)}\lambda^k=\sum_{a,b\ge1}\bar s_{ab}\lambda^{k+a}\mu^{b}$：$k\ge1,a\ge1$，全是正频，积分为 0。

合起来就是 `eq:kernel-fourier-action`：

$$(Tu)(\mu)=\sum_{j\ge1}\Bigl(\sum_{k=1}^Ns_{kj}C_k\Bigr)\mu^{-j}.$$

这条计算是"系数取向"的定义处：$s$ 的**第一个指标** $k$ 吃掉 $u$ 的正频，**第二个指标** $j$ 输出 $Tu$ 的负频。所以它是"$s$ 作为从正频到负频的映射"的矩阵元写法。论文第 283-285 行特意为这一点作辩护（见 7.3 表末行）。

授权句 `All interchanges are justified by the absolute uniform convergence in Theorem~\ref{lem:faber}`（第 267 行）：把 $\int\sum_{a,b}$ 换成 $\sum_{a,b}\int$ 需要 $\T^2$ 上绝对一致收敛，这正是 `lem:faber` 里 `In particular it converges absolutely and uniformly on $\T^2$` 的唯一用途。

推出（第 268-270 行）：

$$\sum_{j\ge1}\HS{\sum_{k=1}^Ns_{kj}C_k}^2=\|Tu\|_{L^2}^2\le\|u\|_{L^2}^2=\sum_{k=1}^N\HS{C_k}^2 .$$

左式用到 Parseval 在 $M_m$ 值 $L^2$ 上成立；$Tu$ 的 Fourier 系数在 $j\ge1$ 处是 $\sum_ks_{kj}C_k$，其余为 0。

**第四步：三段 Fourier 支撑不交加 Parseval（第 271-277 行）。** 由 `eq:boundary-basis`，

$$G(h(\mu))=\sum_{k=0}^Nb_k(h(\mu))C_k=C_0+\underbrace{\sum_{k=1}^N\mu^kC_k}_{=u(\mu)}+\underbrace{\sum_{j\ge1}\bigl(\sum_ks_{kj}C_k\bigr)\mu^{-j}}_{=(Tu)(\mu)} .$$

三块的频撑分别是 $\{0\}$、$\{1,\dots,N\}$、$\{-1,-2,\dots\}$，两两不交，所以 Parseval 没有交叉项：

$$\int_\T\HS{G\circ h}^2d\tau=\HS{C_0}^2+\sum_{k=1}^N\HS{C_k}^2+\sum_{j\ge1}\HS{\sum_ks_{kj}C_k}^2 .$$

左不等式：扔掉最后那个非负项。右不等式：用第三步的 $\le\sum_{k\ge1}\HS{C_k}^2$，得到 $\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2$。$\blacksquare$

这一证法里"$G$ 是多项式"的作用要说清：$u$ 只有有限个正频，所以 $\sum_{k=1}^N$ 是有限和，$Tu$ 的 $\ell^2$ 范数计算里不需要任何收敛性预备工作（只有 $j\to\infty$ 一侧，由 $|s_{kj}|\le C_\rho\rho^{k+j}$ 保证）。若 $G$ 是无穷级数就要额外论证 $\sum_k$ 与 $\sum_j$ 的交换次序。我选择只做多项式，这与 `main.tex:124` 的 `estimates one polynomial at a time` 是同一条纪律的两处体现。

### 7.3 常数与假设的机械理由

| 对象 | 位置 | 作用 | 放宽或改动后的崩点 |
| --- | --- | --- | --- |
| 权重 2（非常数项） | 第 251 行右端 | $2=1+1$：一份来自 $u$ 自身，一份来自 $Tu$（$\|T\|\le1$） | 若 $\|T\|\le\kappa$（例如边际归一化被改成 $\int K=\kappa$），右端变 $\HS{C_0}^2+(1+\kappa^2)\sum_{k\ge1}\HS{C_k}^2$。回代到 `thm:domain` 的 `eq:weighted-dual` 会给对角块权重 $\frac{1}{1+\kappa^2}$ 之类，最终 $\gamma^2\le4$ 变成依赖 $\kappa$ 的界；关键是配平被打破。当 $\kappa=1$ 才正好回到 2。[分析] |
| 权重 1（常数项 $C_0$） | 同上 | 常数项不产生负频，不被 $T$ 复制 | 若常数项也带权 2，`eq:weighted-dual` 的对角权重变成 $\tfrac12,\tfrac12,\dots$，而 `eq:cross-L2` 的交叉权重仍是 $1,1,\dots$（$M_0$ 权重 1），配平后给出更松的界。反之若 $C_0$ 权重 0，不等式假：圆盘上 $G\equiv C_0$ 时 $\int\HS{G}^2=\HS{C_0}^2>0$ |
| $K\ge0$ | 第 260 行 | Jensen | 变号则 $\|T\|\le1$ 失效（符号核的 $L^2$ 范数可远大于 1），右不等式失效。左不等式**不依赖** $K\ge0$，它只是 Parseval 丢项 |
| 两个边际 $=1$ | 第 260、261 行 | 各用一次（Jensen 与 Fubini） | 只证一个边际，$T$ 只在一侧受控，$\|T\|_{L^2\to L^2}$ 未知 |
| 未归一化 HS 范数 | 第 180 行加 Parseval | 让 Parseval 是等号、让 `eq:pairing` 的双线性配对与内积一致 | 用归一化 HS（$\frac1{\sqrt m}\HS{\cdot}$）则 $m$ 从 Parseval 冒出来，"对 $m$ 一致"被破坏。第 180 行那句强调不是装饰 |
| $d\tau$ 归一化（$dt/2\pi$） | 第 178 行 | $\int1\,d\tau=1$，边际"$=1$"的写法成立 | 用 $dt$ 则边际变 $2\pi$，$\int K=2\pi$，$\|T\|\le2\pi$，权重 2 会被 $2\pi$ 污染 |
| $m$ 是正整数（$m\ge1$） | 第 247 行 | 与 Lean 里 `0 < m` 假设对应（`Model.lean:29` 的 `UniversalBound` 要求 `0 < n → 0 < m`） | $m=0$ 时 $M_0(\C)$ 是零环，所有范数为 0，命题平凡但会把 `sharpnessCoefficients : Fin 2 → Matrix (Fin 1) (Fin 1) ℂ` 这类构造逼成特例。Lean 用类型 `Fin m` 加 `0<m` 显式排除 |
| "$G$ 是多项式" | 第 247 行 | 有限正频即有限和；`thm:domain` 里 $\deg(FG)=\deg F+\deg G$ 保证 $FG$ 的 Faber 展开有限 | 换成 $G$ 全纯（无穷 Faber 级数）需要额外的收敛与闭性论证；我不需要，因为只处理多项式 |
| 左不等式的独立价值 | 第 249-250 行 | 在 `thm:domain` 里被用来把 $\sum\HS{U_k}^2$ 换成 $\|FG\|_\partial^2$（上界方向的估计用在 $FG$ 上） | 只有右不等式时 $\sum_k\HS{U_k}^2$ 无法用边界范数控制，`eq:diagonal-functional` 出不来 |
| 不对称核的取向声明 | 第 279-285 行：`In particular, \eqref{eq:kernel-fourier-action} uses this coefficient orientation and does not require symmetry of the kernel.` | 防止把 $s_{kj}$ 与 $\beta_{jk}$ 混用 | 若误用 $s_{jk}$，$T$ 变成另一个算子（转置），$\|T\|\le1$ 仍可能成立（对偶算子同范数），但与 $b_k\circ h$ 的展开不再匹配，Parseval 分解出的负频系数不再是 $Tu$，第三步等式失效。这段"对照 companion 记号"的文字存在的理由就是防这个错 |

**圆盘基例（用来校准这条命题的形状）。** $\Omega=\D$，$h(\lambda)=\lambda$（$c=1$，$g\equiv0$）。则 $q(\lambda)=\lambda$，$s(\lambda,\mu)=\frac{\lambda}{\lambda-\mu}-\frac{\lambda}{\lambda-\mu}=0$，$K\equiv1$，$T=0$，$b_k(z)=z^k$。命题退化为

$$\sum_{k=0}^N\HS{C_k}^2=\int_\T\HS{G(\mu)}^2d\tau(\mu),$$

即经典 Hardy 空间 $H^2$ 等距，上下界重合，**权重 2 完全没有被用到**。所以 $1+\sqrt2$ 到 2 的改进、以及"2 是否最优"这件事，都不发生在这一条命题里，而在第 9 节"交叉块保权 1、对角块保权 $\tfrac12$"的比对里。这条对第 16 节的敏感度表很关键：`prop:coefficients` 的常数 2 在圆盘上是松弛的，却仍是全文最终常数 2 的唯一来源，说明这个 2 属于结构余量，解析损失的部分是零。

### 7.4 四条候选路线与死因

[推测] 其一，用 $L^\infty$ 而不用 $L^2$。双边的系数与边界比较只有在 $L^2$（Hilbert 加 Parseval）里才能同时拿到上界与下界；$L^\infty$ 侧只能给上界，且 $H^\infty$ 的系数估计（例如 Cauchy 估计 $|C_k|\le\|G\|_\infty$）会带 $k$ 依赖或丢失正交性，最后第 442-444 行的迹不等式无从谈起（迹需要 Hilbert--Schmidt 结构）。Crouzeix--Palencia 走的正是"$L^\infty$ 边界数据转到 $L^2$ 上奇异积分算子的范数"这条混合路线，代价是 $1+\sqrt2$。

[推测] 其二，用 Bergman 空间（面积分）代替边界积分。第 238-241 行点名的 `BeckermannStylianopoulos2018` 标题是 *Bergman Orthogonal Polynomials and the Grunsky Matrix*，说明 Bergman 路线在文献里现成。用面积分的话，权 2 会被 Bergman 核的对角行为替换，而且 `lem:resolvent` 里 $R(\lambda)=\sum b_k(A)\lambda^{-k}$ 的"边界即圆周"身份会变成面积域，$P,Q,M,L$ 的 $L^2$ 范数不再有 Fourier 支撑不交这个优势，而那是 Parseval 分解的全部依据。我认为这是最可能被绕开的自然做法。[分析]

[推测] 其三，对 $T$ 取伴随以同时得到左右不等式。论文的左右不等式是对偶关系吗？我核对过：右端是 $\|T\|\le1$ 的推论，左端是 Parseval 的丢项，两者方向由不同机制给出，所以引入 $T^*$ 无收益；反而若引入 $T^*$，会需要 $K$ 的共轭对称性，把第 285 行那句"不需要对称"变成额外假设。

[推测] 其四，改进 $K$（乘一个正权函数使 $\|T\|$ 严格小于 1，从而得到小于 2 的常数）。这条路被定理本身的最优性禁止：$\|T\|$ 严格小于 1 只能在特定域成立（圆盘上 $T=0$）；一般凸域上若 $\|T\|\le\kappa<1$ 一致成立，配平会给 $\gamma\le$（依赖 $\kappa$ 且小于 2 的数），与 $2\times2$ 幂零矩阵的最优性矛盾。也就是说 $\sup_\Omega\|T\|=1$ 是必然的，否则定理的常数可降。这个反证论文未述，是我的 [推测]：`prop:coefficients` 的 2 一旦能被全域一致改进，主定理的 2 就能改进，故 2 的最优性把 $T$ 的范数上确界钉在 1。

## 8 `lem:resolvent`：预解式展开与双层位正性

### 8.1 精确陈述（`main.tex:295-308`）

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

假设的传递方式值得记：`satisfy the hypotheses and conclusions of Theorem~\ref{lem:faber}`，写的是 `satisfy the hypotheses and conclusions`，假设与结论两样都要。这是第 2 节说的"升格为定理"的第二个理由：它需要被独立引用一整套结论。

$C,\theta$ 的量词是 `For the fixed $A,h$, there are constants...`，也就是 $C,\theta$ 依赖 $A$ 与 $h$，不是一致常数。对后面的推导没有影响（只用平方可和性），但素材要记：本文没有任何"对一切 $A$ 一致"的预解式界，那正是 Crouzeix--Palencia 路线要的那种估计，也是我做不到的事。

### 8.2 证明机制逐步重建（`main.tex:291-321`，含 §3 开头的动机段）

§3 开头的定位段（`main.tex:291-293`）先给：

```tex
This Hermitian field is the numerical-range double-layer kernel of
\cite{DelyonDelyon1999,CrouzeixPalencia2017}; we prove the required
positivity for the original matrix $A$.
```

`required` 这个措辞说明作者知道该正性在文献里已知，本文只是自证一遍，而 `for the original matrix $A$` 的强调有具体分量，见 8.2 第五步。

**第一步：预解式有定义。** `Every eigenvalue of $A$ belongs to $W(A)$, by testing a unit eigenvector.` 于是 $h(\lambda)I-A$ 在 $|\lambda|\ge1$ 可逆（$h(\T)=\partial\Omega$，$h(|\lambda|>1)\subset\C\setminus\overline\Omega$，都不碰 $W(A)\subset\Omega$）。

论文把这压成半句的东西我在纸上补完了一遍：$W(A)$ 紧、$\Omega$ 开、$W(A)\subset\Omega$，故 $\dist(W(A),\C\setminus\Omega)>0$。$h$ 在 $\T$ 上一致连续且 $h(\T)=\partial\Omega$，所以存在 $r<r_A<1$，使 $\{|\lambda|>r_A\}$ 中 $|\lambda|<1$ 那部分被 $h$ 送进 $\{z:\dist(z,\partial\Omega)<\varepsilon\}\subset\Omega\setminus W(A)$（只要 $\varepsilon<\dist(W(A),\partial\Omega)$）。这就是原文第 310 行

```tex
Compactness of the circle and strict spectral separation allow a smaller collar $|\lambda|>r_A$, with $r<r_A<1$, on which it remains holomorphic, including infinity where $R(\infty)=I$.
```

的全部内容。这里还用到附录给的单叶领子：$|\lambda|<1$ 一侧的像落在 $\Omega$ 内部（单叶性排除它跑到 $h(\{|\mu|\ge1\})\supset\partial\Omega$ 的像里）。

$R(\infty)=I$ 的计算：$q(\lambda)=c\lambda+O(\lambda^{-1})$、$h(\lambda)I-A=c\lambda I+O(1)$，故 $R(\lambda)\to(c\lambda)(c\lambda I)^{-1}=I$。`including infinity` 是必需的，否则 $\infty$ 处 Laurent 展开的零频项没有依据。

**第二步：展开系数是 $b_k(A)$。** 论文给了两条并列的合法化路径（第 310 行）：

```tex
this follows either by the geometric resolvent series for large $|h(\lambda)|$ or by substituting $A$ into the polynomial coefficient identities in \eqref{eq:faber}.
```

路径 A（几何级数）：$|h(\lambda)|$ 大时 $\|A/h(\lambda)\|<1$，

$$\frac{q(\lambda)}{h(\lambda)}\Bigl(I-\frac{A}{h(\lambda)}\Bigr)^{-1}=\sum_{m\ge0}A^mh(\lambda)^{-m-1}q(\lambda),$$

再把每个 $q(\lambda)/(h(\lambda)-z)^{m+1}$ 用 `eq:faber` 型的 $\lambda$ 展开插回（需要对 $z$ 求 $m$ 次导后的展开式，属于同一套系数恒等式）。这条路要控制二重级数在领子里的收敛。

路径 B（代数量恒等式）：`eq:faber` 是"关于 $z$ 的多项式、系数是 $\lambda$ 的 Laurent 级数"的恒等式；把 $z\mapsto A$ 通过代数同态代入，对每个固定截断次数是有限运算，剩下只需验证代入后的级数仍收敛到预解式。

我的判断：这两条在严格性上不对等（B 需补收敛论证，A 需二重级数控制），论文用 `either … or` 而不选定一条，说明作者两处都能过但没有把细节写死。Lean 里必然只能实现一条，事实是它两条都不用：`ExteriorCollar.lean:48` 把结论写成 `∀ k : ℕ, fourierCoeff Q (-(k:ℤ)) = Polynomial.aeval A (Faber.faberBasis c g k)`，而其证明走 `FaberCalculus.lean` 的闭式求逆（`algebraGenerating`、`ringInverse_geometric`），见 8.4 末行与第 17 节。

**第三步：几何衰减推出 $\ell^2$。** `Choose $r_A<\theta<1$. Cauchy estimates on the reciprocal circle of radius $\theta^{-1}$ give the stated geometric bound.` 换成 $u=1/\lambda$ 后 $R$ 在 $|u|<r_A^{-1}$ 全纯，在闭盘 $|u|\le\theta^{-1}<r_A^{-1}$ 上有界 $M_\theta$，故

$$\|b_k(A)\|\le M_\theta(\theta^{-1})^{-k}=C\theta^k .$$

$\theta^k$ 可和，推出在 $\T$ 上绝对一致收敛，于是可逐项取 Fourier 系数、可逐项做 $X^*RX$ 型压缩。第 337 行

```tex
By Theorem~\ref{lem:resolvent}, all four series converge absolutely and uniformly on $\T$, and their coefficient sequences are square summable.
```

就是在这里兑现：$a^2=\sum_{k\ge0}\HS{M_k}^2<\infty$ 的全部依据是这条 $\theta^k$。

一个必须记住的细节：$\|b_k(A)\|\le C\theta^k$ 是算子范数界，而 $a^2$ 要的是 HS 平方和。有限维里 $\HS{Y^*b_k(A)X}\le\sqrt n\sqrt m\,\|b_k(A)\|$ 之类的估计会引入 $\sqrt m$，我一开始担心这里泄露 $m$。核对之后的结论是：真正的 $m$ 无关性来自齐次性。$b_k(A)$ 只作用在底空间 $\C^n$ 上，它的算子范数几何衰减与 $m$ 无关；$X,Y$ 的 HS 范数进入 $a$ 的方式与进入另外三个块的方式相同，最终在 `eq:diagonal-L2` 与 `eq:cross-L2` 的比较里全部约掉。这一段推理论文未述，但它是可验证的齐次性论证，属于我的补充，并非推测。[分析]

**第四步：零频与两个积分。** $b_0=1$ 给出 $R$ 的 $\lambda^0$ 系数是 $b_0(A)=I$，即 $\int_\T R\,d\tau=I$，取伴随相加得 $\int_\T(R+R^*)d\tau=2I$。用途在第 412-413 行 `In the diagonal fields, \eqref{eq:means} makes the constant term twice $P_0$ or $Q_0$.` 与第 425 行 `For the cross field, $L_0^*=M_0$ makes the constant term $2M_0$.`。也就是说 2 第一次出现在"对角块与交叉块的零频都是 $2\times$"这一点上（第 9 节第 5 步）。$\int(R+R^*)=2I$ 是这两条的母陈述，本身在正文里没有独立引用，是一处冗余输出：作者把它写出来是为了让读者预先看到 $2I$，实际使用的是逐频版本。

**第五步：正性（第 315-320 行）。** 令 $B=h(\lambda)I-A$，直接合同计算：

$$B^*(R+R^*)B=B^*\bigl(qB^{-1}+\bar q(B^*)^{-1}\bigr)B=qB^*+\bar qB.$$

论文原文写作 `\overline{q(\lambda)}B+q(\lambda)B^*`，同一式子。逐单位向量 $v$ 取二次型：

$$v^*(qB^*+\bar qB)v=\bar q\,(Bv,v)+q\,\overline{(Bv,v)}=2\Re\bigl(\overline{q(\lambda)}(h(\lambda)-v^*Av)\bigr)\ge0,$$

最后一步是 `eq:support` 在 $z=v^*Av\in W(A)\subset\overline\Omega$ 处。$B$ 可逆，合同变换保持正半定等价，故 $R+R^*\succeq0$。$\blacksquare$

这一步有三个技术要点，都容易漏。

1. 用 $B^*(\cdot)B$ 合同而直接算 $R+R^*$ 的二次型不行：后者会出现 $(h(\lambda)I-A)^{-1}$ 的二次型，无法直接套 `eq:support`；合同一次把逆消掉。这正是 Crouzeix--Palencia 那套正双层位势论证的最小内核，本文把它压成三行。
2. `eq:support` 里的 $z$ 必须是 $v^*Av$，一个数值范围点，须要它不是特征值、不是任意的 $z$。这解释了 $R+R^*$ 的正性为什么只对 $A$ 本身成立而对相似的 $SAS^{-1}$ 不成立（第 292 行 `for the original matrix $A$` 的分量就在这里），也正是本文不能走相似化约路线的原因：一做相似，正性立刻失效。这条因果链我在第 0 节的死路三已经用过一次，这里是它的出处。
3. $\lambda\in\T$ 固定后再做，正性是逐点的（pointwise in $\lambda$），没有积分平均。后面 $2\times2$ 块比较能逐点做然后再积分，全靠这一点。

### 8.3 常数与假设的机械理由

| 对象 | 位置 | 作用 | 崩点 |
| --- | --- | --- | --- |
| $W(A)\subset\Omega$（严格包含在开集里） | 第 296 行假设 | 使 $h(\lambda)I-A$ 在 $\T$ 及更大领子上可逆，提供 $\dist(W(A),\partial\Omega)>0$，推出 $r_A$ 存在 | 只 $W(A)\subset\overline\Omega$ 时边界上可能有 $h(\lambda)\in W(A)$，$R$ 有极点，无 Laurent 展开、无 $\theta^k$、$a=\infty$。这就是 `sec:limit` 必须从外部加厚、不能从内部逼近的原因（`lem:approx` 给 $K\subset\Omega_\delta$，方向是外逼） |
| 三层半径 $0<r<r_A<\theta<1$ | 第 310-311 行 | $r$ 是 $h$ 的单叶领子，$r_A$ 是预解式全纯领子，$\theta$ 是 Cauchy 估计半径 | 若 $r_A=r$：$\theta$ 只能趋 $1^-$，$C$ 发散，但仍有一个 $\theta<1$ 可用（因为 $r_A>r$ 严格）。真正不能取等的是 $r_A>r$ 与 $\theta>r_A$。数值本身不敏感 |
| $C<\infty$ | 第 304-305 行 | 只用于 $\sum_k$ 收敛 | 对最终常数 2 无影响：`thm:domain` 里所有比较关于 $a$ 是齐次的，$C$ 被约掉 |
| $b_0(A)=I$ | 第 310、313 行 | $\int R=I$、$\int(R+R^*)=2I$；`eq:means` 的 $P_0=X^*X$、$Q_0=Y^*Y$；对角与交叉块的零频 $2\times$ | 若 $b_0(A)=\kappa I$：$P_0=\kappa X^*X$、$Q_0=\kappa Y^*Y$、$M_0$ 也带 $\kappa$，`eq:diagonal-L2` 的 4 与 `eq:cross-L2` 的 $4\HS{M_0}^2$ 同比例缩放，最后仍约掉。[分析] $b_0$ 的归一化不算绝对必需，但 $b_0$ 必须是标量倍数乘 $I$（即 $b_0$ 是常数多项式），这由 $h$ 的单极点性质给出 |
| $q(\lambda)=\lambda h'(\lambda)$ 里的 $\lambda$ 因子 | `eq:R` | 使 $B^*(R+R^*)B=\bar qB+qB^*$ 恰为 $2\Re(\bar q\,\cdot)$，且 $\bar q$ 正是 `eq:support` 需要的法向共轭 | 若 $R=h'(\lambda)(h(\lambda)I-A)^{-1}$（不带 $\lambda$）：二次型变成 $2\Re(\overline{h'(\lambda)}(h(\lambda)-z))$，而 `eq:support` 需要 $\overline{\lambda h'(\lambda)}$，相差旋转 $e^{-i\theta}$，符号不再非负，正性直接崩。这是全文最小的结构性常数。Lean 里 `Faber.boundaryNormal` 定义成 `unitPoint t * (c-(unitPoint t)⁻¹^2*deriv g ((unitPoint t)⁻¹))`（`FaberEnergy.lean:129-130`），我按 $h(\lambda)=c\lambda+g(\lambda^{-1})$ 手算了一遍：$\lambda h'(\lambda)=\lambda(c-\lambda^{-2}g'(\lambda^{-1}))$，与 Lean 的定义逐项相同，共轭位置在 `DomainBound.lean:85-86` 靠 `mul_comm` 处理。素材标的 [需核对] 我核了，两边一致 |
| $\succeq0$ 逐点成立 | 第 302 行 | 第 435-439 行的压缩 $\Delta(\lambda)\succeq0$ 逐点成立，逐点取迹不等式后再积分 | 只有平均意义下的正性时，块压缩后不能逐点做 $J\Delta J$，第 442 行 $\operatorname{tr}(\Delta^{1/2}(J\Delta J)\Delta^{1/2})\ge0$ 失效 |
| 绝对一致收敛 | 第 306 行 | 四个级数 $P,Q,M,L$ 的逐项操作与逐频陈述 | 只有 $L^2$ 收敛时，第 413-415 行"$P_k$ 与 $P_k^*$ 出现在频率 $\mp k$ 且 HS 范数相等"这类陈述需要额外论证 |
| $n$ 是正整数 | 第 296 行 | $M_n(\C)$ 非零；$X,Y$ 是 $n\times m$ | $n=0$ 时 $A$ 是空矩阵、$W(A)=\varnothing$，$R$ 仍是 $0\times0$，一切平凡；Lean 用 `0 < n` 排除（`Model.lean:29`） |

### 8.4 四条候选路线与死因

[推测] 其一，Riesz--Dunford 谱投影或谱演算定义 $P[A]$ 并估范数。幂零矩阵的谱在原点，Riesz 投影给不出信息（第 45 行的 nilpotent 论证即此意）；$H^\infty$ 演算需要 $\Omega$ 是 $A$ 的 $C$-spectral set，那正是待证结论，路线循环。本文让预解式只在圆周上取值，且只用其 Hermitian 部分的符号，从不取其范数。这是绕开谱演算的关键设计。

[推测] 其二，直接用 Cauchy 积分公式套范数：$\|P[A]\|\le\frac{|\Gamma|}{2\pi}\max_\Gamma\|P\|\max_\Gamma\|(zI-A)^{-1}\|$。右端预解式范数只能用伪谱界估计，对幂零 Jordan 块是 $\varepsilon^{1-n}$ 型发散，给不出一致常数。本文把"积在什么轮廓上"与"$P$ 在哪里取最大值"绑在同一条 $\partial\Omega$ 上（$b_k$ 与 $R$ 用同一个 $h$），这个同步是 Crouzeix--Palencia 之后所有路线的共同难题，本文用系数，并非轮廓积分绕过它。

[推测] 其三，把 $R+R^*\succeq0$ 写成一个正边界测度的 Stieltjes 表示（Delyon--Delyon 式）。那产出的是表示定理，也就是 companion 论文做的事：全局对象、需要相容性与归一化技术。我只需要一次逐点正性。这也解释了为什么本文引用 Delyon--Delyon 时只说"这是同一个核"而不去引它的定理。

[推测] 其四，证明 $\|b_k(A)\|$ 对 $A$ 一致。不可能：圆盘情形 $b_k(A)=A^k$，幂零 Jordan 块可以让 $\|A\|=1$ 而 $\|A^k\|$ 不衰减。所以第 304 行把 $C,\theta$ 写成 `for the fixed $A,h$` 属于能力上限声明。也正因如此，全文的 $A$ 依赖性都被塞进 $a$ 里，最后在齐次比较中被消掉。Lean 侧连这一步都省了：它不出现 $C,\theta$、`rho`、`summable` 这类对象，收敛性由 `FaberCalculus.lean:68` 的 `algebraGenerating = (c - u²•deriv g u) • Ring.inverse (algebraDenominator c g A u)` 与 `:41` 的 `ringInverse_geometric` 在完备 Banach 代数里以闭式给出。论文与 Lean 在这一点上走的是两条不同路线，见第 17 节。

## 9 `thm:domain`：解析凸域上的界（上）：奇异对、四个块、一个双线性泛函数

这是全文的核心定理，我把它拆成两节写。拆分理由纯粹是行数的：证明从 `main.tex:326` 到 `main.tex:453`，共 128 行，占正文（去掉导言与参考文献）的近三分之一，而且论文自己用四个 `\emph{...}` 小标题把它切成了四段，正好对应该节与下一节的分界。

### 9.1 精确陈述（`main.tex:323-325`）

```tex
\begin{theorem}[The bound on an analytic convex domain]\label{thm:domain}
For positive integers $n,m$, let $\Omega\subset\C$ be bounded, open, and convex with regular real-analytic Jordan boundary, and let $A\in M_n(\C)$ satisfy $W(A)\subset\Omega$. For every $M_m(\C)$-valued polynomial $F$ with $\|F(z)\|\le1$ on $\partial\Omega$, one has $\|F[A]\|\le2$.
\end{theorem}
```

量化顺序我把每个量词都写出来：

$$\forall n,m\in\mathbb Z_{>0},\ \forall\Omega\ (\text{有界、开、凸、边界为正则实解析 Jordan 曲线}),\ \forall A\in M_n(\C)\ (W(A)\subset\Omega),\ \forall F\in\mathrm{Poly}(M_m)\ \bigl(\sup_{z\in\partial\Omega}\|F(z)\|\le1\ \Rightarrow\ \|F[A]\|\le2\bigr).$$

三个观察，都是我自己算的，论文没有明说：

1. $\Omega$（连同它的 $h$）在 $A$ 之前，$A$ 在 $F$ 之前。也就是**一个域配一个矩阵，然后对一切满足边界归一化的多项式统一**。这个顺序决定了常数 2 的来源层次：$\Omega$ 决定 $h$、$h$ 决定所有 $s_{kj}$、所有 $s_{kj}$ 决定 `prop:coefficients` 的双侧权（那里是 1 与 2），但最后一步的配平只用这个权，不用任何 $h$ 的具体量。域的信息在 `prop:coefficients` 处就被消化掉了。
2. 假设里的归一化是 $\|F(z)\|\le1$ on $\partial\Omega$，**逐点算子范数**（$L^{\infty}$ 型），不是 HS 范数、不是 Faber 系数范数、不是面积分。这是全文唯一一次出现 "$\le1$" 这种硬归一化，其余地方全是齐次的比值。
3. 结论 $\|F[A]\|\le2$ 里**没有 $\Omega$、没有 $h$、没有 $F$ 的次数、没有 $m$**。这四个"没有"合起来就是定理名字里的 bound 二字的全部含义。

与 `thm:main` 的关系：`thm:main` 的 $\max_{z\in W(A)}\|P(z)\|$ 通过缩放到这里（`main.tex:520-523`，见第 12 节）。$\|F[A]\|\le2$ 与 $\|P[A]\|\le2\max\|P\|$ 只差一个 normalization，两者齐次等价，所以 `thm:domain` 可以理直气壮地把归一化写死成 1。

`thm:domain` 这个环境名是 theorem（`main.tex:323`），而在依赖图里它是唯一直接被 `thm:main` 引用的定量结果，这一点我在第 2 节已经记过：全文的"定理"级别对象只有四个，`thm:domain` 是其中最重的一条。

### 9.2 第 0 步：坐标、归一化、以及为什么必须是一对奇异向量（`main.tex:327-332`）

```tex
Choose $h$ from Lemma~\ref{lem:exterior-collar} and apply
Theorem~\ref{lem:faber} to this coordinate.
Put $\gamma=\|F[A]\|$. There is nothing to prove if $\gamma=0$. Otherwise choose unit singular vectors $x,y\in\C^n\otimes\C^m$ such that
\begin{equation}\label{eq:singular}
 F[A]x=\gamma y,\qquad F[A]^*y=\gamma x.
\end{equation}
```

`Choose $h$ from Lemma~\ref{lem:exterior-collar}` 这一行把附录整个吸收进来了。我在读第一遍时把它当成"例行引用"跳过了，重读时停下来，因为它在结构上做了一件很硬的事：`lem:exterior-collar` 的产出条件里 $\Omega$ 是**有界开凸、边界为正则实解析 Jordan 曲线**，而这里只需要 $h$ 与一个领子，也就是说附录里那些 Carathéodory、Schwarz 反射、"第三半径"拼接的全部力气，最后只被压缩成"存在一个 $h$"这一句。论文在第 327 行没有回头解释 $h$ 有哪几条性质，读者必须自己记住 `main.tex:163-167` 的 `eq:h`。我把它列在这里以免丢失：

$$h(\lambda)=c\lambda+c_0+O(\lambda^{-1})\ \text{在}\ |\lambda|>r\ \text{上单叶},\quad h(\T)=\partial\Omega,\quad h(\{|\lambda|>1\})=\text{ext}\,\Omega .$$

补步 1：`There is nothing to prove if $\gamma=0$` 的机械必要性。结论是 $\gamma\le2$，$\gamma=0$ 时 $0\le2$ 平凡。但"平凡"两个字不足以说明为什么必须**显式**分情形，真正的理由是后面三处都要拿 $\gamma$ 做除数：`main.tex:389-390` 的 $\frac a\gamma$、`main.tex:395-397` 的 $a^2/\gamma^2$、`main.tex:447-450` 的 $8a^2/\gamma^2$。此外 `main.tex:355` 的 `shows that $a>0$` 也要 $\gamma\ne0$ 才推得动（下面第 9.5 步）。所以这一句分情形是**除法许可证**，属于纯粹的技术前置。

补步 2：为什么是"奇异向量对"而"非"单个达到范数的向量。我在第 0 节已经记过史：`main.tex:104-106` 并列了三种前人做法，其中一种用 attainer。这里我要把机制算清楚。$F[A]$ 一般**非正规**，$\|F[A]\|=\gamma$ 只给 $\exists x,\ \|x\|=1,\ \|F[A]x\|=\gamma$，而 $x^*F[A]x$ 可以是任何模 $\le\gamma$ 的数，取不到 $\gamma$。反例就是最后的 sharpness 例子：$A=\begin{pmatrix}0&2\\0&0\end{pmatrix}$，$\|A\|=2$，但 $|x^*Ax|=2|x_1x_2|\le1$（这个不等式我核对过，AM-GM 即可，等号在 $|x_1|=|x_2|=1/\sqrt2$）。也就是说单 attainer 路线在这个例子上**直接少一半**。

只有配对 $(x,y)$ 才让 $y^*F[A]x$ 成为一个可以取到 $\gamma$ 的双线性泛函数值。核对：eq:singular 第一式给出 $y^*F[A]x=y^*(\gamma y)=\gamma\,y^*y=\gamma$（$y$ 单位）。

补步 3：eq:singular 的两个等式各管一头，这是我在读 `main.tex:363-365` 时倒推出来的，论文没写。
- 第一式 $F[A]x=\gamma y$ 用于 $y^*(GF)[A]x=y^*G[A]\bigl(F[A]x\bigr)=\gamma\,y^*G[A]y$。
- 第二式 $F[A]^*y=\gamma x$ 等价于 $y^*F[A]=\gamma x^*$（**这里要用 $\gamma$ 是正实数**，$\gamma^*=\gamma$；若 $\gamma$ 是复数就得多一个共轭），用于 $y^*(FG)[A]x=\bigl(y^*F[A]\bigr)G[A]x=\gamma\,x^*G[A]x$。

**只用一个奇异向量、或只让 $F$ 出现在一侧，这两个等式里就会有一个出不来。** 这条观察后面在第 10.6 节的常数记账里会兑现成"$\gamma\le\sqrt2$ 不可能"的那个论证。

$[推测]$ 我起初以为"选择 unit singular vectors"之后需要说明这样的 $x,y$ 存在（有限维 SVD），论文没有写这一句，因为在 $M_n(\C)$ 上这是标准事实：$\gamma$ 是最大奇异值，右奇异向量 $x$、左奇异向量 $y$ 满足两式。Lean 侧则必须有名字，我核对过：`SingularPairs.lean` 专门有一节构造这个对（材料里我引过它第 78 行附近的 `sub_eq_zero.mp (norm_eq_zero.mp he)`），也就是说**论文里省略的一句"由 SVD"，在机器里是一个文件**。

### 9.3 第 1 步：把向量写成矩阵（`main.tex:333`）

```tex
Write $x=\sum_{i=1}^mXe_i\otimes e_i$ and $y=\sum_{i=1}^mYe_i\otimes e_i$, where $X,Y$ are $n$-by-$m$ matrices and $(e_i)$ is the standard basis of $\C^m$.
```

机械含义：$\C^n\otimes\C^m\ni x\mapsto X\in M_{n\times m}(\C)$，第 $i$ 列是 $x$ 限制在系数基向量 $e_i$ 上的 $\C^n$ 分量，即 $Xe_i\in\C^n$。

补步 4：这个对应保范数。
$$\|x\|^2=\sum_{i=1}^m\|Xe_i\|^2=\sum_{i}\sum_{a}|X_{ai}|^2=\tr(X^*X)=\HS X^{2}.$$
于是
$$\|x\|=1\iff\HS X=1,\qquad \|y\|=1\iff\HS Y=1 .$$

**论文没有明写这个等价（论文未述）**，但它正是我在第 4 节记的"未归一化 HS"口径选择的直接回报：如果 HS 是归一化的（除以 $\sqrt m$），这里就变成 $\HS X=\sqrt m$，整条链上会凭空出现 $m$。用未归一化 HS，$\|x\|=1$ 与 $\HS X=1$ 严丝合缝，$m$ 一次也不出现。

Lean 里这一步有两个名字，我第一手读过，抄在这里：

```lean
-- HilbertSchmidt.lean:31-33
theorem hsSq_eq_norm_hsVector_sq {ι κ} [Fintype ι] [Fintype κ]
    (M : Matrix ι κ ℂ) : hsSq M = ‖hsVector M‖ ^ 2

-- SingularPairs.lean:80-86
def matrixify {n m : ℕ} (x : EuclideanSpace ℂ (Fin n × Fin m)) :
    Matrix (Fin n) (Fin m) ℂ := fun i j => x (i, j)

@[simp] theorem hsVector_matrixify {n m : ℕ} (x : EuclideanSpace ℂ (Fin n × Fin m)) :
    hsVector (matrixify x) = x
```

`hsVector` 是 `WithLp.toLp 2 (fun p => M p.1 p.2)`（`HilbertSchmidt.lean:28-29`），也就是把矩阵摊成 $\ell^2$ 向量。注意 `hsVector_matrixify` 是 `@[simp]` 且证明只有两行（`apply WithLp.ofLp_injective; rfl`）：**它是一条定义层面的恒等**，论文里那个"于是 $\|x\|=\HS X$"在 Lean 里根本不需要算，只需要 unfold。这是形式化的一项免费收益，也是我在素材里说的"Lean 把论文的隐式约定写成显式定义"的第一例。

补步 5：这个等价还顺手保证了另一件事，$P_0=X^*X$、$Q_0=Y^*Y$ 的**迹**是 1：
$$\tr P_0=\tr(X^*X)=\HS X^2=1,\qquad \tr Q_0=1.$$
所以 $P_0,Q_0$ 是**密度矩阵型**对象（正半定、迹 1）。论文没有用"密度矩阵"这个词，也没有提 $\tr P_0=1$，但下面 `eq:weighted-dual` 里 $\HS{P_0}^2\le a^2/\gamma^2$ 之所以能给出非平凡信息（，并非被缩放消掉），全靠这个归一化。这一条是我自己的推断，标 `[推测]`：作者选择"奇异向量"，并非"任意双单位向量"，除了取到 $\gamma$ 之外，还顺带把零频钉成了迹 1。

### 9.4 第 2 步：四个块、$a$、以及路线图（`main.tex:333-344`）

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

四个块的身份清点（这是我自己整理的，论文只列了定义）：

| 记号 | 定义 | 系数 | 零频 | 类型 |
| --- | --- | --- | --- | --- |
| $P$ | $X^*RX$ | $P_k=X^*b_k(A)X$ | $X^*X$ | Hermitian 型（零频 Hermitian） |
| $Q$ | $Y^*RY$ | $Q_k=Y^*b_k(A)Y$ | $Y^*Y$ | Hermitian 型 |
| $M$ | $Y^*RX$ | $M_k=Y^*b_k(A)X$ | $Y^*X$ | 交叉 |
| $L$ | $X^*RY$ | $L_k=X^*b_k(A)Y$ | $X^*Y$ | 交叉 |

补步 6：`$M_k=Y^*b_k(A)X$, for example` 是论文给的唯一一个系数算例，其余三个我自己代：$R(\lambda)=\sum_{k\ge0}b_k(A)\lambda^{-k}$（`lem:resolvent` 的结论），所以
$$X^*R(\lambda)X=\sum_k\bigl(X^*b_k(A)X\bigr)\lambda^{-k}\ \Rightarrow\ P_k=X^*b_k(A)X .$$
逐项乘 $X^*(\cdot)X$ 合法，因为收敛在 $\T$ 上绝对且一致（论文第 337 行的 `converge absolutely and uniformly on $\T$`），系数由 $\frac1{2\pi}\int$ 提取，一致收敛允许逐项积分。

补步 7：eq:means 三式的逐条验证。$b_0=1$（`lem:faber` 的第 1 条，$b_0(z)\equiv I_m$ 意义下是单位），故 $R$ 的零频是 $I_n$。
- $P_0=X^*I_nX=X^*X$，而 $(X^*X)^*=X^*X$，所以 $P_0^*=P_0$。✓
- $Q_0=Y^*Y=Q_0^*$ 同理。✓
- $L_0=X^*I_nY=X^*Y$，$M_0=Y^*I_nX=Y^*X=(X^*Y)^*=L_0^*$。✓

现在是最容易读错的一处，我要把它按素材里的自我更正写准。素材记录：**$L_k$ 与 $M_k$ 对 $k\ge1$ 没有任何共轭关系。** 我起初以为 $L_k=M_k^*$ 恒成立（因为 $L(\lambda)=X^*RY$ 与 $M(\lambda)=Y^*RX$ 看起来互为"转置"），停下来重读是因为验算是失败的：
$$M_k^*=\bigl(Y^*b_k(A)X\bigr)^*=X^*b_k(A)^*Y,\qquad L_k=X^*b_k(A)Y .$$
两者相等**当且仅当 $b_k(A)$ 是 Hermitian**。而 $b_k(A)$ 一般远非 Hermitian（$b_k$ 是普通多项式、$A$ 非正规时 $b_k(A)$ 什么都可能是）。素材里那条自我更正的结论是对的：唯一可靠的关系是 $k=0$，因为只有 $b_0(A)=I_n$ 是 Hermitian。这解释 `main.tex:425` 那句 `$L_0^*=M_0$ makes the constant term $2M_0$` 为什么**只对零频说**，也正因如此 `eq:cross-L2` 里正频是 $\HS{L_k}^2$、负频是 $\HS{M_k}^2$，两项**各自**留着而不能合并，这就是下界 $\ge a^2$ 里那个松绑的来源，我在第 10.4 步会用它。

论文对"$k\ge1$ 时 $L_k,M_k$ 无关系"这件事只字不提，也不需要提：`main.tex:426-427` 的写法 `Its negative coefficients are $M_k$ for $k\ge1$ and its positive coefficients are $L_k^*$ for $k\ge1$` 只需要 $\HS{L_k}=\HS{L_k^*}$（这个恒成立，见补步 9），完全不需要 $L_k$ 与 $M_k$ 之间的任何关系。**这是一处"沉默即正确"的写法**，我在笔记里保留它的唯一理由是我自己差点在这里算错。

补步 8：$a$ 的定义与被保护量。
$$a^2=\sum_{k\ge0}\HS{M_k}^2=\sum_{k\ge0}\HS{Y^*b_k(A)X}^2 .$$
注意求和从 $k=0$ 起（**含 $M_0$**）。素材第 157 行那句 `The cross term retains all coefficients of the first functional, including its constant coefficient` 就是防读者把下标改成 $k\ge1$。第 10.7 节的表格里我会把改动后果算出来。

补步 9：$\HS{A^*}=\HS A$。逐元素：$\HS{A^*}^2=\tr(AA^*)=\sum_{i,j}|A_{ij}|^2=\HS A^2$。Lean：`hsSq_conjTranspose`（`HilbertSchmidt.lean:35-38`，证明核心是 `Finset.sum_comm` 交换求和次序）。这个"交换两次求和"的细节在论文里完全隐形。

补步 10：`main.tex:341-344` 这四行是全文的**路线图**，把三个目标量写死成命题形式：
$$\text{(I)}\ \int_\T\HS{P+P^*}^2d\tau\le\frac{4a^2}{\gamma^2},\qquad
\text{(II)}\ \int_\T\HS{Q+Q^*}^2d\tau\le\frac{4a^2}{\gamma^2},\qquad
\text{(III)}\ \int_\T\HS{M+L^*}^2d\tau\ge a^2 .$$
`Positivity will then compare these quantities and force $\gamma\le2$` 预告了第 6 步的形状：一个正块给出一条"对角 $\ge$ 交叉"的不等式，把 (I)+(II) 与 (III) 接起来。我在读这段时的第一反应是"三个量里两个上界一个下界，方向刚好，说明作者是从最后一步反推着写这四行的"。这个判断属于 `[推测]`（我无法从文本证明写作顺序），但它对读整段有用：(I)(II)(III) 三条估计全是**为最后的配平定制的**，单看文本读不出它们各自的动机。

$[推测]$ 一个技术细节值得记录：$P,Q,M,L$ 是 $\lambda$ 的函数（定义在 $\T$ 上），论文称它们 `matrix functions`，但全文从不写 $P(\lambda)$ 而只写 $P$。我读到这里时的困惑是"$P+P^*$ 里的 $*$ 是逐点共轭转置还是别的东西"，答案是逐点：$P^*(\lambda)=P(\lambda)^*$。注意这与 $\lambda\mapsto\bar\lambda$ **无关**，所以 $P^*$ 的 Laurent 系数是 $\overline{P_k}\lambda^{k}$ 型（第 10.4 步用）。这个约定在 Lean 里由 `PositiveBlocks`/`BoundaryEnergy` 的显式 `conjTranspose` 承担，我在第 17 节回来核对。

### 9.5 第 3 步（`\emph{The off-diagonal coefficient functional}`，`main.tex:346-355`）

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

补步 11：eq:pairing 的完整展开。$G[A]=\sum_k b_k(A)\otimes C_k$（把 Faber 基展开通过同态 $z\mapsto A\otimes I_m$、系数矩阵 $\mapsto I_n\otimes C$ 送进去，见 `PolynomialCalculus` 那一节的 $[A]$ 定义）。按系数基看，$G[A]$ 作为 $\C^n\otimes\C^m$ 上的算子，其"$(i,j)$ 块"（$\C^n$ 上的算子）是 $\sum_k(C_k)_{ij}b_k(A)$。于是
$$y^*G[A]x=\sum_{i,j}(Ye_i)^*\Bigl(\sum_k(C_k)_{ij}b_k(A)\Bigr)(Xe_j)
=\sum_{k,i,j}(C_k)_{ij}\,(Ye_i)^*b_k(A)(Xe_j).$$
而 $(M_k)_{ij}=(Y^*b_k(A)X)_{ij}=\sum_{a,b}\overline{Y_{ai}}\,(b_k(A))_{ab}\,X_{bj}=(Ye_i)^*b_k(A)(Xe_j)$。代回去正是 eq:pairing。$\checkmark$ 论文给的提示 `leaving $(Ye_i)^*b_k(A)Xe_j$ in the base factor` 与我算的一致，只是它把 $(C_k)_{ij}$ 的提取写成 `C_ke_j=\sum_i(C_k)_{ij}e_i`，即"第 $j$ 列"观点，两者同值。

补步 12：**双线性、不带共轭**，这是我在这一步花最多时间重读的地方。eq:pairing 右端是 $\sum M_{ij}C_{ij}$，**没有**对 $M$ 取共轭。它与 Hermitian 内积 $\langle C,M\rangle=\sum\overline{M_{ij}}C_{ij}$ 差一层：这里用的是**双线性**配对。这个区别的后果在第 4.3 步：测试必须取 $C_k=\overline{P_k}$（**逐元素共轭**，`main.tex:403` 的 `bars mean entrywise conjugation`），因为左端 $|y^*G[A]x|$ 要变成一个非负实数。若不取共轭而直接令 $C_k=P_k$，配对值是 $\sum(P_k)_{ij}(P_k)_{ij}$，可以是复数，甚至可以是 0。

素材记录：这一点在论文里是**隐身的约定**，在 Lean 里被强制显形，有两个名字为证（我第一手读过）：

```lean
-- HilbertSchmidt.lean:45-46
def entryPair {ι κ} [Fintype ι] [Fintype κ]
    (M C : Matrix ι κ ℂ) : ℂ := ∑ i, ∑ j, M i j * C i j

-- HilbertSchmidt.lean:48-56
theorem entryPair_conj {ι κ} [Fintype ι] [Fintype κ]
    (M : Matrix ι κ ℂ) : entryPair M (M.map star) = (hsSq M : ℂ)
```

`entryPair` 的定义就是 $\sum_{i,j}M_{ij}C_{ij}$（无共轭），而"配对要变实非负"这件事被写成一条独立引理 `entryPair_conj`：把第二个参数换成 `M.map star`（逐元素共轭）就得到 $\HS M$。它的证明里有一步 `rw [← Complex.normSq_eq_norm_sq]; exact Complex.mul_conj _`，即逐点用 $z\bar z=|z|^2$。**论文里 "bars mean entrywise conjugation" 那半句括号，在 Lean 里是一条引理加一次 `sum_congr` 双层展开。** 我在素材里说的"Lean 强制隐身的共轭约定显形"就是指这一处。

补步 13：Cauchy-Schwarz 的用法是把双重指标 $(k,i,j)$ 当成一个大向量的指标：
$$\Bigl|\sum_{k,i,j}(M_k)_{ij}(C_k)_{ij}\Bigr|\le\Bigl(\sum_{k}\HS{M_k}^2\Bigr)^{1/2}\Bigl(\sum_k\HS{C_k}^2\Bigr)^{1/2}=a\Bigl(\sum_k\HS{C_k}^2\Bigr)^{1/2}.$$
右端第一个因子**恰好**是 $a$，这是 $a$ 的定义被"设计"的证据：$a^2$ 取的是交叉系数 $M_k$，因为要被控制的量是 $y^*G[A]x$（交叉泛函数）。这也解释了 $a$ 里为什么不含 $P_k,Q_k$：那两个量是被估计的对象，不能同时出现在界里。

补步 14：`Taking $G=F$ and using \eqref{eq:singular} shows that $a>0$` 的推导。把 $F$ 写成 Faber 基展开 $F=\sum_kb_kD_k$（有限和，次数 $d$）。取 $G=F$：
$$\gamma=\bigl|y^*F[A]x\bigr|\le a\Bigl(\sum_k\HS{D_k}^2\Bigr)^{1/2}.$$
记 $S_F=\bigl(\sum_k\HS{D_k}^2\bigr)^{1/2}$，这是一个有限数（有限和），且 $\gamma>0$（第 0 步的分情形），所以 $a\ge\gamma/S_F>0$。✓
这一步的位置很关键：**这是 $\gamma$ 首次进入不等式**，也是全文唯一一次"$F[A]$ 的范数被一个双线性泛函数抓到"。之后 $\gamma$ 只以 $\gamma^2$ 出现在分母。

$[推测]$ 我起初以为这里可以直接用 `prop:coefficients` 给 $S_F$ 一个上界（$\le\|F\|_\partial$），但那会把 $\gamma$ 和边界范数混在一起、失去齐次性；论文只用"$S_F$ 有限"这一条最弱的事实，所以后面所有 $\gamma$ 的除法都合法。**这是"把有限性当估计用"的一个小技巧**，我认为值得单独记住。

### 9.6 上半段各假设的机械理由

| 对象 | 位置 | 作用 | 放宽或改动后的崩点 |
| --- | --- | --- | --- |
| $\|F(z)\|\le1$ on $\partial\Omega$ | `main.tex:324` | 只用于第 4.2 步的第三个不等号（边界乘子界） | 若改成 $\le\kappa$：链上多一个 $\kappa$，最终 $\gamma\le2\kappa$，与缩放齐次性一致（$F/\kappa$ 即回到 $\kappa=1$）。若改成**面积分** $\int_\Omega\|F\|^2\le1$：第三个不等号 $\|FG\|_\partial\le(\sup\|F\|)\|G\|_\partial$ 需要 sup，假设必须 $L^\infty$ 型。详见第 10.7 节 |
| $\gamma=\|F[A]\|$ 与前置分情形 | `main.tex:329` | 三处除 $\gamma$；推 $a>0$ | 不分情形则 $\gamma=0$ 时 $\frac a\gamma$ 无意义 |
| eq:singular 的**两条**等式 | `main.tex:331` | 两条各供一侧有序乘积 | 只有一条时 `eq:ordered-products` 只出一半，$Q$ 块无界，正性比较不可用（见 10.6） |
| $x,y$ 单位 | `main.tex:329` | $\HS X=\HS Y=1$，从而 $\tr P_0=\tr Q_0=1$ | 非单位则 $\HS{P_0}^2$ 带上 $\|x\|^4$，$d_N\le(a/\gamma)\sqrt{d_N}$ 里左右同次仍能齐次消掉，$\gamma$ 会跟着缩。分情形 $\gamma=0$ 后标准化是免费的 |
| $X,Y$ 是 $n\times m$ | `main.tex:333` | 让 $P_k,Q_k,M_k,L_k$ 全为 $m\times m$，HS 同次 | 任何按 $n$ 归一化的写法都会让 $\HS{P_0}$ 与 $\HS{M_0}$ 次不齐 |
| $a^2$ 从 $k=0$ 起 | `main.tex:341` | 与 `eq:cross-L2` 的 $4\HS{M_0}^2\ge\HS{M_0}^2$ 配对 | 若从 $k=1$ 起：下界仍成立但丢掉对 $M_0$ 的控制，而 $\gamma$ 正是从 $M_0$（$y^*F[A]x$ 的零频）进来的，最终比较与 $\gamma$ 脱钩 |
| $b_0=1$ | `main.tex:337` | eq:means 的全部三条 | 若 $b_0$ 不是常数 1（Faber 归一化改了），$P_0$ 不再是 $X^*X$，$\tr P_0=1$ 失效，第 9.3 步补步 5 作废 |
| 四个级数在 $\T$ 上绝对一致收敛、系数平方可和 | `main.tex:337`，来自 `lem:resolvent` | 允许逐项积分取系数、允许 Parseval、允许 $\sum\HS{M_k}^2<\infty$ 使 $a$ 有定义 | `lem:resolvent` 的 $C\theta^k$ 估计（`main.tex:304`）就是这条的来源 |

### 9.7 上半段的候选失败路线

$[推测]$ 其一，只用一个达到范数的向量（Lorist-Schwenninger 式，`main.tex:104-105` 提到的做法之一）。失败机制已在补步 2 算清：需要 $x^*F[A]x=\gamma$，这只在 $F[A]$ 有达到范数的特征向量（特别地正规或次正规）时成立；$2\times2$ 幂零上 $|x^*Fx|\le1<2=\|F\|$。后果链条是：**必须引入 $y$**，进而必须有两个块 $P,Q$，进而必须有两个有序乘积 $FG,GF$，进而必须付 Parseval 的因子 4，最后 $\gamma\le2$。这条因果链让我认为常数 2 在这里是**结构性必然**，并非巧合。论文对此没有一句解释（论文未述），只在 `main.tex:104-106` 并列了三篇的做法（attainer / top singular pair / attainer after similarity reduction）作为选择证据。

$[推测]$ 其二，把 $a$ 定义成 $\bigl(\sum_{k\ge0}\HS{M_k}^2+\HS{L_k}^2\bigr)^{1/2}$（对称化）。失败机制：eq:crossfunctional 的 Cauchy-Schwarz 只能用一次、只消耗一侧的系数；把 $L$ 也塞进 $a$ 会让 `eq:diagonal-L2` 的右端 $4a^2/\gamma^2$ 变大而 `eq:cross-L2` 的下界也变大，两边同时松，配平结论 $\gamma\le2$ 变成 $\gamma\le2$ 但**中间一步不再严格**：实际上会得到 $2a^2\le8a^2/\gamma^2$ 里的左 $2a^2$ 变成 $2a^2$（现在更大）而右端也翻倍，最后 $\gamma^2\le 8$，即 $\gamma\le2\sqrt2$。**下界侧白送的 $\sum\HS{L_k}^2$ 一旦被计入 $a$，就从"免费的余量"变成"要付账的量"。** 这是我把 $a$ 的定义读三遍才确认的一点：论文把 $L$ 留在下界里而不在 $a$ 里出现，正是常数 2 的来源之一。

$[推测]$ 其三，让 $(x,y)$ 随测试多项式 $G$ 变化（双变分直接做）。失败机制：$a$ 依赖于所选的 $(x,y)$（$a^2=\sum\HS{Y^*b_k(A)X}^2$），若 $x,y$ 随 $G$ 变，则 `eq:diagonal-functional` 与 `eq:weighted-dual` 用的不是同一个 $a$，路线图 (I)(II)(III) 三条里的 $a$ 彼此不同，配平崩。**必须固定 $(x,y)$、只让 $G$ 变**，这正是 `main.tex:329` 那句 `choose unit singular vectors` 在证明结构里的全部作用。我在 9.4 末写过"三个量是为最后的配平定制的"，这里要说清它的代价：定制意味着 $x,y$ 一旦被选定，$G$ 的所有测试都在这个固定框架里做，这也解释了为什么第 4.3 步要用"self-dual test"而不能再用一次 SVD。[分析] 这是我在这一节里唯一想标为"读法警告"的地方。

## 10 `thm:domain`（下）：两次有序测试、一个自对偶测试、一笔块账

### 10.1 第 4 步之一：乘法顺序与两条有序恒等式（`main.tex:357-366`）

```tex
\emph{The two ordered tests.}
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

补步 15：`(FG)[A]=F[A]G[A]` 的验证只用一条东西：$(A\otimes B)(C\otimes D)=AC\otimes BD$。
$$F[A]G[A]=\Bigl(\sum_iA^i\otimes D_i\Bigr)\Bigl(\sum_jA^j\otimes E_j\Bigr)=\sum_{i,j}A^{i+j}\otimes D_iE_j=(FG)[A].\ \checkmark$$
**这一步不需要任何交换性**。需要交换性的是"顺序反过来"那一句：$(GF)(z)$ 的系数是 $\sum_{i+j=k}E_jD_i$，而 $(FG)$ 的是 $\sum_{i+j=k}D_iE_j$，两者一般不等。素材记的这句话我完全同意：**这就是"$m$"的全部难度所在**，$F[A]G[A]\ne G[A]F[A]$。标量情形（$m=1$）矩阵系数全是数、自动交换，所以 $FG=GF$、$P,Q$ 两条链合成一条，标量证明因此短一半。

补步 16：eq:ordered-products 两条的验算，我在 9.2 补步 3 已经分开算过，这里合并写：
$$y^*(FG)[A]x=y^*F[A]G[A]x=(F[A]^*y)^*G[A]x=(\gamma x)^*G[A]x=\gamma x^*G[A]x,$$
$$(GF)[A]x=G[A]F[A]x=\gamma G[A]y\ \Rightarrow\ y^*(GF)[A]x=\gamma y^*G[A]y.\ \checkmark$$
第一条用到 $(\gamma x)^*=\gamma x^*$，即**再一次**用 $\gamma\in\mathbb R_{>0}$。

素材记录（我保留并强调）：eq:ordered-products 的两条**各自**用掉 eq:singular 的一个等式，第一条用 $F[A]^*y=\gamma x$，第二条用 $F[A]x=\gamma y$。**只用一个奇异向量或只做一侧乘积，这两条里就会有一条出不来。** `main.tex:111-112` 那句 `placing a test polynomial on each side of the polynomial being estimated` 里的 `on each side`，指的就是 $FG$ 与 $GF$ 这两个顺序；`the polynomial being estimated` 是 $F$。这是全论文对"为什么需要两个乘积"最直白的一句话。

### 10.2 第 4 步之二：两条链，四个不等号逐个点名（`main.tex:367-392`）

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

先记 $\|H\|_\partial$ 这个新记号（`main.tex:370`）：**边界 $L^2$ HS 范数**，沿 $\partial\Omega$ 的像圆周 $\mu\mapsto h(\mu)$ 积分，测度是 `main.tex:178` 定义的概率测度 $d\tau$。素材第 5.3 节把它列进"记号冲突表"是合理的，因为它与 `thm:domain` 假设里的 $\sup_{\partial\Omega}\|F\|\le1$ 是**两种不同的边界范数**（$L^2$ 与 $L^\infty$），同一个 $\partial\Omega$ 上出现两个范数而不加区分地都写"boundary"，这是我读这段时会走神的地方。

补步 17：`The functional in \eqref{eq:crossfunctional} uses all $M_k$, so it applies to these full expansions for every finite degree.` 这句看起来像废话，其实是在**申请合法性**。eq:crossfunctional 是在"$G=\sum_kb_kC_k$ 是任意多项式"下证的，而现在代进去的 $G$ 换成 $FG$、$GF$，其 Faber 次数是 $\deg F+\deg G$，**比 $F$ 本身高**。作者必须提醒读者：泛函数 $G\mapsto y^*G[A]x$ 不依赖次数上界，系数 $M_k$ 是全体的，所以对任意有限次展开都成立。我在读第一遍时把这句划掉了，重读时划回来，因为 `prop:coefficients` 的双侧不等式也要在"任意有限次数"版本下用（那里证明对一切非负权 $f_k$ 成立，次数无限制），两处配套。

补步 18：第一条链（$FG$，系数 $U_k$）四个不等号逐个点名：

(1) $\gamma|x^*G[A]x|\le a\bigl(\sum_k\HS{U_k}^2\bigr)^{1/2}$。
用 eq:ordered-products 第一条把左端换成 $|y^*(FG)[A]x|$，再用 eq:crossfunctional 于多项式 $FG$（其 Faber 系数为 $U_k$，即 $C_k=U_k$）：$|y^*(FG)[A]x|\le a(\sum\HS{U_k}^2)^{1/2}$。✓

(2) $a\bigl(\sum_k\HS{U_k}^2\bigr)^{1/2}\le a\|FG\|_\partial$。
这是 **`prop:coefficients` 的左不等式**（`main.tex:249-251` 下界方向）：$\sum_k\HS{C_k}^2\le\int_\T\HS{(F\circ h)(\mu)}^2d\tau(\mu)$，代 $F\to FG$、$C_k\to U_k$。✓ 权是 1（非 2），因为左不等式不带权。

(3) $a\|FG\|_\partial\le a\|G\|_\partial$。
逐点：$\HS{F(z)G(z)}\le\|F(z)\|\HS{G(z)}$（次乘性，$z\in\partial\Omega$），再用假设 $\|F(z)\|\le1$，得 $\HS{(FG)(z)}\le\HS{G(z)}$ 逐点，积分保序 ⇒ $\|FG\|_\partial\le\|G\|_\partial$。✓
**这是假设 $\|F\|_{\partial\Omega}\le1$ 在整个证明里唯一被使用的地方。** 素材记的这条我核对成立：把 (I)(II)(III) 三步全部回看，$\|F(z)\|\le1$ 只在 (3) 出现一次，别处（`eq:pairing`、Parseval、$\Delta$ 的正性）都不涉及 $F$ 的边界大小，只涉及 $F[A]$ 的范数 $\gamma$。$[推测]$ 也就是说：$F$ 的边界归一化的全部作用是**给 $FG$ 的次数提升买单**，它把"$FG$ 比 $G$ 高一次"这件事吸收掉。
第二条链（$GF$，系数 $V_k$）在 (3) 用的是**另一个顺序**的不等式 $\HS{G(z)F(z)}\le\HS{G(z)}\|F(z)\|$，论文 `in their respective orders` 就是这个意思。HS 次乘性两个方向都成立（$\HS{AB}\le\|A\|\HS B$ 与 $\HS{AB}\le\HS A\|B\|$，见 `HilbertSchmidt.lean:62-90` 的 `hsSq_mul_le`、`hsSq_mul_le_right`），两个方向在这里**都需要**，因为一个是 $FG$、一个是 $GF$。素材第 5 节把这两条列进常数表是对的。

(4) $\gamma|y^*G[A]y|\le a\|G\|_\partial$ 之后，把 $\|G\|_\partial$ 换成带权系数和：用 **`prop:coefficients` 的右不等式**（上界方向）
$$\int_\T\HS{G(h(\mu))}^2d\tau\le\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2 ,$$
其中 $C_k$ 是 $G$ 的 Faber 系数。✓

补步 19：**同一个命题 `prop:coefficients` 在同一条链里被反方向用了两次**（左不等式用在 $FG$/$GF$ 上，右不等式用在 $G$ 上）。这是这段最难读的地方，也是配平能成立的结构原因。我把它写成一句话：$G$ 的系数与 $\sum\HS{U_k}^2$ 之间被"边界"这个中介连起来，一侧走 $\le\int\HS{FG}^2$（用左不等式），另一侧走 $\int\HS{G}^2\le$ 加权系数和（用右不等式），中间用逐点次乘性桥接。**权重 1 与权重 2 分别出现在桥的两端**，素材第 5.2 节"权重 2 敏感度"专条要处理的正是这个不对称。

补步 20：`max` 的出现。两条链给出同一个右端 $a\|G\|_\partial$（因为都 $\le a\|G\|_\partial$），所以取 max 后仍成立，再代 (4) 得 eq:diagonal-functional。✓ 这一步把两条信息压缩成一个泛函数界，代价是丢掉了"哪个更大"的信息。$[推测]$ 我认为作者在这里没有损失：后面 (I) 与 (II) 两条上界本来就要**各自**独立用同一个右端，max 正好提供这个。

### 10.3 第 4 步之三：自对偶变分测试（`main.tex:393-407`）

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

补步 21：`The entries paired with $C_k$ ... are respectively those of $P_k$ and $Q_k$`。eq:pairing 说的是 $y^*G[A]x=\sum(M_k)_{ij}(C_k)_{ij}$。同一次张量基展开，把 $x^*G[A]x$ 与 $y^*G[A]y$ 也写出来：
$$x^*G[A]x=\sum_{k,i,j}(P_k)_{ij}(C_k)_{ij},\qquad y^*G[A]y=\sum_{k,i,j}(Q_k)_{ij}(C_k)_{ij},$$
证明与补步 11 逐字相同，只是把 $(Y,X)$ 换成 $(X,X)$、$(Y,Y)$。$\checkmark$ 这正是 $P,Q,M,L$ 四个块的定义动机：**三个泛函数 $y^*G[A]x$、$x^*G[A]x$、$y^*G[A]y$ 分别由 $M$、$P$、$Q$ 表示**，`main.tex:144-146` 引言那句 `supplies the coefficient arrays representing the three functionals` 与这里一一对应（引言那句我在第 13 节的映射表里已核对，它把三个泛函数按 $M,P,Q$ 顺序列出）。

补步 22：测试代入的两侧计算。取 $C_0=\overline{P_0}$，$1\le k\le N$ 时 $C_k=\overline{P_k}/2$，其余 $C_k=0$。
**配对值**（eq:diagonal-functional 左端的 max 里第一个）：
$$\sum_{k,i,j}(P_k)_{ij}(C_k)_{ij}=\HS{P_0}^2+\sum_{k=1}^N\frac12\sum_{i,j}(P_k)_{ij}\overline{(P_k)_{ij}}=\HS{P_0}^2+\frac12\sum_{k=1}^N\HS{P_k}^2=d_N\in\mathbb R_{\ge0}.$$
用到 $(P_k)_{ij}\overline{(P_k)_{ij}}=|(P_k)_{ij}|^2$。这正是补步 12 的双线性陷阱的兑现：**共轭在测试系数上，不在被配对的数组上**。
**加权测试范数**（右端括号里的量）：
$$\HS{C_0}^2+2\sum_{k\ge1}\HS{C_k}^2=\HS{\overline{P_0}}^2+2\sum_{k=1}^N\HS{\overline{P_k}/2}^2=\HS{P_0}^2+2\cdot\frac14\sum_{k=1}^N\HS{P_k}^2=d_N.$$
用到 $\HS{\overline{A}}=\HS A$（Lean：`hsSq_map_star`，`HilbertSchmidt.lean:58-60`，证明 `simp [hsSq_eq_sum_norm_sq]` 一行）与 $\HS{A/2}^2=\frac14\HS A^2$。
**两者相等**，这就是"self-dual test"的全部内容：`prop:coefficients` 右端那个 2 与测试系数里那个 $\tfrac12$ 相消，因为 $(\tfrac12)^2\cdot2=\tfrac12$。

补步 23：不等式闭合。eq:diagonal-functional 给
$$d_N=\text{配对值}\le\max\{|\cdot|,|\cdot|\}\le\frac a\gamma\sqrt{\text{加权测试范数}}=\frac a\gamma\sqrt{d_N}.$$
$d_N>0$ 时两边除 $\sqrt{d_N}$：$\sqrt{d_N}\le a/\gamma$ ⇒ $d_N\le a^2/\gamma^2$。
$d_N=0$ 时结论 $0\le a^2/\gamma^2$ 平凡。论文 `including when $d_N=0$` 五个字覆盖了这个分情形。
$N\to\infty$：$d_N$ 是**递增**的部分和（每项 $\ge0$）且有上界 $a^2/\gamma^2$，单调收敛 ⇒ $\sup_Nd_N=\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\le a^2/\gamma^2$。✓ 这里用到 $P_k$ 平方可和（`lem:resolvent`），所以级数本身收敛，$\sup$ 就是和。
第二条同法（把 $P_k$ 换成 $Q_k$，$x^*G[A]x$ 换成 $y^*G[A]y$）。✓

$[分析]$ 我要把 `main.tex:401-402` 那句 `for $1\le k\le N$, and $C_k=0$ otherwise` 单独记一下：为什么需要**有限**测试 $d_N$ ，并非直接取 $C_k=\overline{P_k}/2$ 对一切 $k$。原因是 $G$ 必须是**多项式**（eq:diagonal-functional 只对多项式 $G$ 成立），而系数无界支撑的 $C_k$ 一般只定义一个解析函数，并非多项式。所以先截断到 $N$、再取极限。这个"截断 + 单调收敛"的写法是全文唯一一次，素材把它记为"变分测试的有限化"是对的。

Lean 侧这条测试的抽象化版本我第一手读过，值得整段贴（`Duality.lean:15-46`）：

```lean
theorem weighted_coefficient_dual {ρ ι κ} [Fintype ρ] [Fintype ι] [Fintype κ]
    (P : ρ → Matrix ι κ ℂ) (w : ρ → ℝ) (hw : ∀ k, 0 < w k)
    (b : ℝ) (hb : 0 ≤ b)
    (h : ∀ C : ρ → Matrix ι κ ℂ,
      ‖∑ k, entryPair (P k) (C k)‖ ^ 2 ≤ b * ∑ k, w k * hsSq (C k)) :
    (∑ k, hsSq (P k) / w k) ≤ b := by
  let C : ρ → Matrix ι κ ℂ := fun k => ((w k : ℂ)⁻¹) • (P k).map star
  let s : ℝ := ∑ k, hsSq (P k) / w k
  ...
  by_cases hs0 : s = 0
  · change s ≤ b
    simpa [hs0] using hb
  · have hspos : 0 < s := lt_of_le_of_ne hs (Ne.symm hs0)
    ...
    nlinarith
```

四点观察。
1. 它把 $C_k=(w_k)^{-1}\overline{P_k}$ 写成**任意权族** $w_k>0$，论文里的 $\{1,\tfrac12\}$ 只是 $w_0=1,w_{k\ge1}=2$ 的特例。$[推测]$ 我认为这是分片生成 Lean 时的常见现象：把论文里一句具体测试提炼成一般引理，好让其它模块复用（`Duality.lean` 后面确实有 `weighted_sequence_dual`，素材 4.5 节记过）。
2. 它把论文的不等式 $d_N\le(a/\gamma)\sqrt{d_N}$ 平方成 $\|\sum\text{entryPair}\|^2\le b\sum w_k\HS{C_k}^2$ 的形式（$b=a^2/\gamma^2$），根号消失，纯代数。
3. `by_cases hs0 : s = 0` **恰好**对应论文的 `including when $d_N=0$`。也就是说论文那半句括号，在 Lean 里是一整条分情形加一次 `nlinarith`。素材 4.6 节的 tactic 密度统计里 `by_cases` 出现 36 次、其中三处是零性分情形，这条是其中之一。
4. Lean 里没有 $N$、没有截断、没有单调收敛：它的指标类型是 `Fintype ρ`（**有限**类型），求和本来就是有限的。"有限化"在机器里是靠把索引集做成 `Fintype` 强制的，这与论文的 $d_N$ 是同一件事的两种写法。见第 17 节。

### 10.4 第 5 步（`\emph{The boundary norms of the three blocks}`，`main.tex:409-432`）：Parseval 与因子 4

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

补步 24：逐频清点，这是全证明里"4"的出处，我要把每一项都写出来。$P(\lambda)=\sum_{k\ge0}P_k\lambda^{-k}$（$\lambda\in\T$）。$P^*(\lambda)=\sum_{k\ge0}P_k^*\lambda^{k}$（共轭转置逐项，$\overline{\lambda^{-k}}=\lambda^{k}$ 在 $\T$ 上）。所以
$$(P+P^*)(\lambda)=\underbrace{(P_0+P_0^*)}_{\text{频率 }0}+\sum_{k\ge1}P_k\lambda^{-k}+\sum_{k\ge1}P_k^*\lambda^{k}.$$
- 频率 $0$：$P_0+P_0^*=2P_0$，用 $P_0^*=P_0$（eq:means 第一条）。系数为 $2P_0$，贡献 $\HS{2P_0}^2=4\HS{P_0}^2$。
- 频率 $-k$（$k\ge1$）：$P_k$，贡献 $\HS{P_k}^2$。
- 频率 $+k$（$k\ge1$）：$P_k^*$，贡献 $\HS{P_k^*}^2=\HS{P_k}^2$（补步 9）。

`main.tex:416` 那句 `Parseval therefore gives four times the reciprocal weighted sum` 里的 Parseval 是对 $M_m$-值 $L^2(\T)$ 函数、以 $\HS{\cdot}^2$ 为平方的版本（素材 4.3 节记的 Lean 名字是 `CircleFourier`/`TaylorFourier` 两个模块，因为机器里要把矩阵值 Fourier 级数一层层搭起来）。合起来：
$$\int_\T\HS{P+P^*}^2d\tau=4\HS{P_0}^2+\sum_{k\ge1}\bigl(\HS{P_k}^2+\HS{P_k}^2\bigr)=4\HS{P_0}^2+2\sum_{k\ge1}\HS{P_k}^2=4\Bigl(\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\Bigr).\ \checkmark$$
**关键是"4"与"$\tfrac12$"必须成对出现**：$4\cdot\tfrac12=2$ 正好抵消掉 $\pm k$ 的双计数，只剩零频的 4。若 `eq:weighted-dual` 的权不是 $\tfrac12$，这里就出不来干净的 4。素材记的"$\tfrac12$ 的唯一理由就是 2 的倒数"（`prop:coefficients` 右端权 2 的倒数）与此呼应：**2（权）→ $\tfrac12$（测试）→ 4（Parseval）是同一条线索的三段。**

交叉块（`main.tex:425-432`）：

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

补步 25：逐频清点。$(M+L^*)(\lambda)=\sum_kM_k\lambda^{-k}+\sum_kL_k^*\lambda^{k}$。
- 频率 $0$：$M_0+L_0^*=M_0+M_0=2M_0$，用 eq:means 第三条 $L_0^*=M_0$。贡献 $4\HS{M_0}^2$。
- 频率 $-k$（$k\ge1$）：$M_k$，贡献 $\HS{M_k}^2$。
- 频率 $+k$（$k\ge1$）：$L_k^*$，贡献 $\HS{L_k^*}^2=\HS{L_k}^2$。

$$\int_\T\HS{M+L^*}^2d\tau=4\HS{M_0}^2+\sum_{k\ge1}\HS{M_k}^2+\sum_{k\ge1}\HS{L_k}^2\ge\HS{M_0}^2+\sum_{k\ge1}\HS{M_k}^2=a^2.\ \checkmark$$
注意这里**没有等号**（除非 $L\equiv0$），因为 $a^2$ 只数 $M_k$ 且权重 1。两个松绑分别是：
1. $4\HS{M_0}^2\ge\HS{M_0}^2$：零频多算了 3 倍，但 $a^2$ 需要的是权重 1，所以白送。
2. $\sum_{k\ge1}\HS{L_k}^2\ge0$：整个 $L$ 侧白送。

$[分析]$ 我在补步 21 之后本来以为交叉块会出现"权重不一致"的麻烦，实际读 `main.tex:425-431` 才确认麻烦被**两个松绑**吸收了。这就是第 9.4 节那条"$L_k$ 与 $M_k$ 对 $k\ge1$ 无共轭关系"不会造成问题的原因：正频项 $\HS{L_k}^2$ 根本不需要与 $\HS{M_k}^2$ 有任何关系，它只要 $\ge0$。

素材要点我完全保留：**交叉块（全权重 1）与对角块（权重 $1,\tfrac12,\tfrac12,\dots$）之间那 $\tfrac12$ 的差额，就是常数 2 的来源。** `main.tex:156-158` 那句 `The cross term retains all coefficients of the first functional, including its constant coefficient` 说的正是"下界侧不需要 $\tfrac12$、不需要丢项"。

### 10.5 第 6 步（`\emph{The positive block comparison}`，`main.tex:434-452`）：最后一步

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

补步 26：$\Delta$ 的分块乘法。$\Delta=[X\ Y]^*(R+R^*)[X\ Y]=\begin{pmatrix}X^*\\Y^*\end{pmatrix}(R+R^*)\begin{pmatrix}X&Y\end{pmatrix}$，逐块：
- $(1,1)=X^*(R+R^*)X=P+P^*$ ✓
- $(1,2)=X^*(R+R^*)Y=X^*RY+X^*R^*Y=L+(Y^*RX)^*=L+M^*$ ✓
- $(2,1)=Y^*(R+R^*)X=Y^*RX+Y^*R^*X=M+(X^*RY)^*=M+L^*$ ✓
- $(2,2)=Y^*(R+R^*)Y=Q+Q^*$ ✓
（用到的两条 $(X^*R^*Y)^*=Y^*RX$ 与 $(Y^*R^*X)^*=X^*RY$ 都是逐点 $(AB)^*=B^*A^*$。）
合同保正半定 ⇒ $\Delta(\lambda)\succeq0$ 对每个 $\lambda\in\T$ 逐点成立。✓ $[2m\times2m]$ 块矩阵、$n\times2m$ 压缩矩阵，尺寸都对得上。

补步 27：$J\Delta J\succeq0$。$J=\operatorname{diag}(I_m,-I_m)$ 满足 $J=J^*=J^{-1}$，所以 $J\Delta J$ 是 $\Delta$ 的合同像，正半定性保持。✓

补步 28：$0\le\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})$。写成 $A^*BA$ 形式：$\Delta^{1/2}(J\Delta J)\Delta^{1/2}=(\Delta^{1/2})^*(J\Delta J)(\Delta^{1/2})$，而 $J\Delta J\succeq0$，故 sandwich 正半定；正半定矩阵的迹 $\ge0$。✓

补步 29：循环性 $\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\tr((J\Delta J)\Delta)=\tr(\Delta J\Delta J)$。用 $\tr(UV)=\tr(VU)$，取 $U=\Delta^{1/2}$、$V=(J\Delta J)\Delta^{1/2}$。✓

补步 30：迹展开。这一步我在素材的重构基础上重新算了一遍，因为素材自己在这里先算错了一次（它先按 $\Delta(J\Delta J)$ 结合，得出交叉项相消、与论文的 $-2\HS{M+L^*}^2$ 不符），我把它订正到底。
记 $D=P+P^*$、$E=Q+Q^*$、$F=L+M^*$、$G=M+L^*=F^*$（因 $F^*=L^*+M=M+L^*$ ✓）。$\Delta=\begin{pmatrix}D&F\\G&E\end{pmatrix}$，$J=\begin{pmatrix}I&0\\0&-I\end{pmatrix}$。
$$\Delta J=\begin{pmatrix}D&-F\\G&-E\end{pmatrix},\qquad
\Delta J\Delta J=(\Delta J)(\Delta J)=\begin{pmatrix}D&-F\\G&-E\end{pmatrix}\begin{pmatrix}D&-F\\G&-E\end{pmatrix}.$$
$(1,1)$ 块 $=D^2-FG$，$(2,2)$ 块 $=-GF+E^2$。读 $\Delta J\Delta J$ 为 $\Delta\cdot J\cdot\Delta\cdot J=(\Delta J)(\Delta J)$ ✓（结合律，不能读成 $\Delta(J\Delta J)$，后者给出不同的中间量虽然迹相同）。
$$\tr(\Delta J\Delta J)=\tr(D^2)+\tr(E^2)-\tr(FG)-\tr(GF).$$
现在 $\tr(FG)=\tr\bigl((L+M^*)(M+L^*)\bigr)$。由 $G=F^*$：$FG=FF^*$，$GF=F^*F$。$\tr(FF^*)=\tr(F^*F)=\HS F^2$（两条都等于 $\sum|F_{ij}|^2$）。所以
$$\tr(\Delta J\Delta J)=\tr(D^2)+\tr(E^2)-2\HS{F}^2 .$$
而论文写的是 $-2\HS{M+L^*}^2=-2\HS G^2$，$G=F^*$，$\HS{G}=\HS{F}$（补步 9），两者一致 ✓。
最后 $D,E$ Hermitian（$D^*=(P+P^*)^*=P^*+P=D$）⇒ $\tr(D^2)=\tr(D^*D)=\HS D^2$ ✓。合起来正是论文的
$$\HS{P+P^*}^2+\HS{Q+Q^*}^2-2\HS{M+L^*}^2 .$$
$[推测]$ 素材在这里卡过一次，卡的原因是"迹的循环性允许任意结合顺序，但块乘法只在正确顺序下逐项显现"。我认为值得记进笔记：**这一步唯一的技术内容是选择 $\Delta J\Delta J=(\Delta J)(\Delta J)$ 这个读法**；读成 $\Delta(J\Delta J)$ 时 $(1,1)$ 块是 $D^2-FG$ 也一样，但 $(2,2)$ 块要重算，容易写出 $-\tr(FG)+\tr(GF)=0$ 的错误结论（素材的那次自我更正就是这条路走偏的地方，我在 9.4 也记过它关于 $L_k,M_k$ 的同类自我更正）。

补步 31：逐点积分。$0\le\HS D^2+\HS E^2-2\HS G^2$ 对每个 $\lambda$ 成立，$d\tau$ 是正测度 ⇒ 积分保序：
$$2\int_\T\HS{M+L^*}^2d\tau\le\int_\T\bigl(\HS{P+P^*}^2+\HS{Q+Q^*}^2\bigr)d\tau .$$

补步 32：收尾算术，逐条代入。
$$2a^2\ \overset{(\text{III})}{\le}\ 2\int_\T\HS{M+L^*}^2d\tau\ \overset{(\text{trace})}{\le}\ \int_\T\bigl(\HS{P+P^*}^2+\HS{Q+Q^*}^2\bigr)d\tau\ \overset{(\text{I})(\text{II})}{\le}\ \frac{4a^2}{\gamma^2}+\frac{4a^2}{\gamma^2}=\frac{8a^2}{\gamma^2}.$$
（第一号 $\le$ 是 `eq:cross-L2` 的 $\ge$ 反过来写：$a^2\le\int\HS{M+L^*}^2$ ⇒ $2a^2\le2\int\HS{M+L^*}^2$。）
$a>0$（补步 14）⇒ 两边除以 $2a^2$：$1\le4/\gamma^2$ ⇒ $\gamma^2\le4$ ⇒ $\gamma\le2$。$\blacksquare$

### 10.6 常数记账：这段我认为是全文最值得做笔记的算术

最终 $\gamma^2\le4$、$\gamma\le2$，而那个 **4 恰好就是 `eq:diagonal-L2` 里 Parseval 的 4**。把每一笔来源列成账：

$$\gamma^2\le\frac{(\text{对角块个数 }2)\times(\text{Parseval 因子 }4)}{(\text{迹展开里交叉项的系数 }2)}=\frac{2\cdot4}{2}=4 .$$

- 分子 $2\cdot4$：两个对角块，各带 Parseval 的 4。
- 分母 2：$\tr(\Delta J\Delta J)$ 里 $-2\HS{M+L^*}^2$ 的那个 2，也就是"对角 $\ge$ 交叉"这条正性不等式的强度。
- 左端 $2a^2$ 的 2 与右端 $8a^2/\gamma^2$ 的 8 相消给 $\gamma^2\le4$：也就是说 `两个 2（一个来自左端 $2a^2$、一个来自两个对角相加）完全抵消`，素材这条判断我核对成立。

于是 $\gamma\le2$ 是 $\sqrt4$。$[推测]$ 反事实检验（我按素材的建议自己算过）：若只有 1 个对角块（即只测 $FG$ 不测 $GF$），右端只有 $4a^2/\gamma^2$，链成 $2a^2\le4a^2/\gamma^2$ ⇒ $\gamma\le\sqrt2$。这与最优性矛盾（sharpness 例给 $\gamma=2$ 而界是 1），说明**少一个对角块时 trace 步本身就不成立**：$\Delta$ 的 $(2,2)$ 块 $Q+Q^*$ 没有界，正性 $\Delta\succeq0$ 给不出"$\HS{M+L^*}^2\le\HS{P+P^*}^2$"这类单边结论（$2\times2$ 正块只给 $|\text{off-diag}|\le\sqrt{\text{diag}_1\cdot\text{diag}_2}$，一个因子无界就全松）。所以 `main.tex:111-112` 的 `placing a test polynomial on each side` 是**正性可用的前提**，删掉一侧正性就用不上。

$[推测]$ 我再补一条素材没有明说的等价看法：$\Delta\succeq0$ 与 $J\Delta J\succeq0$ 同时用，等于对同一个正块取"对角加交叉"与"对角减交叉"两个二次型再相加，这比单独用 Cauchy-Schwarz 形式的 $|\text{off}|\le\sqrt{d_1d_2}$ 强在**不需要开方、不需要选标量**，直接是迹层面的线性不等式。$2\HS G^2\le\HS D^2+\HS E^2$ 正是 AM-GM 的矩阵迹版本，而用 $J$ 三明治推出它比引用 AM-GM 更适合形式化（Lean 里对应 `re_trace_block_comparison`，见第 17 节）。

### 10.7 `thm:domain` 全定理的假设与常数表

| 对象 | 位置 | 作用 | 放宽或改动后的崩点 |
| --- | --- | --- | --- |
| $\|F(z)\|\le1$ on $\partial\Omega$ | `main.tex:324` | 第 (3) 个不等号 | 改成 $\le\kappa$ ⇒ $\gamma\le2\kappa$（齐次，无矛盾）。改成 $\int_\Omega\|F\|^2\le1$ ⇒ 第 (3) 步需要 sup，$L^2$ 假设不够。论文选 $\partial\Omega$ 上的 sup ，并非 $\Omega$ 内的 sup；$\|F\|$ 次调和 ⇒ 两者相等，这一步论文未述。Lean 把假设直接设在圆周上：`DomainBound.lean:96-97` 的 `exact hF _ (le_of_eq (hcircle _ (Faber.unitPoint_norm t)))` 只用 `hcircle` 把点拉回圆周，**绕开最大模原理** |
| $\gamma=\|F[A]\|$ 与 $a>0$ | `main.tex:329`、`:355` | 最后一步除 $a^2$；$d_N\le(a/\gamma)\sqrt{d_N}$ 要 $\gamma>0$ | $\gamma=0$ 已前置分情形排除；$a=0$ 由 $G=F$ 的测试排除。若没有 eq:singular（只有一个 attainer），$a>0$ 的论证出不来 |
| $a^2=\sum_{k\ge0}\HS{M_k}^2$（含 $k=0$） | `main.tex:341` | 与 `eq:cross-L2` 的 $4\HS{M_0}^2\ge\HS{M_0}^2$ 配对 | 若从 $k=1$ 起：下界仍成立但丢 $M_0$ 控制，$a$ 可以很小而 $M_0$ 很大，比较与 $\gamma$ 脱钩。`main.tex:157` 专门写 `including its constant coefficient` 就是防这个 |
| 权重 $\tfrac12$（`eq:weighted-dual`） | `main.tex:395-397` | 与 `prop:coefficients` 右端的 2 配平成 self-dual | 测试取 $C_k=\bar P_k$（不带 $\tfrac12$）：配对值 $=\HS{P_0}^2+\sum_1^N\HS{P_k}^2$，加权测试范数 $=\HS{P_0}^2+2\sum_1^N\HS{P_k}^2$，两者不等 ⇒ 得到含自身范数的循环不等式，无法闭合。$\tfrac12$ 的唯一理由是 2 的倒数 |
| 因子 $4$（`eq:diagonal-L2`） | `main.tex:416-421` | Parseval 对 Hermitian 对称化 $P+P^*$ 的双计数 | 不对称化（直接估 $P$ 的边界范数）：$\Delta$ 的对角块本来就是 $P+P^*$，**根本没有 $P$ 的范数可用**。必须对称化，必须付这个 4 |
| $J=\diag(I_m,-I_m)$ | `main.tex:440` | 产生 $-2\HS{M+L^*}^2$ | 用 $J=\diag(I_m,\mu I_m)$（$|\mu|=1$）：交叉项变 $-\bar\mu F-\mu G$，迹里出现 $\mu$，只有实 $\mu=\pm1$ 给 $-2$。其它 Hermitian 对称 $J$（如置换型）给出同型或更弱式。这个特定 $J$ 就是"对角减交叉"的投影 |
| $\Delta^{1/2}$ 三明治 | `main.tex:442` | 把 $J\Delta J\succeq0$ 转成迹 $\ge0$ | 需要正半定平方根（有限维平凡）。实质是 $\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\HS{(J\Delta J)^{1/2}\Delta^{1/2}}^2\ge0$。Lean 省掉平方根：`PositiveBlocks.lean:22-27` 的 `re_trace_mul_nonneg`（$A,B\succeq0\Rightarrow0\le\tr(AB)$ 的实部）加 `:29-33` 的 `re_trace_block_comparison`，只用两条正半定相乘迹非负 |
| 最后 $2a^2\le8a^2/\gamma^2$ | `main.tex:446-451` | 给 $\gamma\le2$ | 只有 $FG$ 一侧 ⇒ 正性比较不可用（见 10.6 的 $\sqrt2$ 反例）；若把 $L$ 侧估成上界，并非丢弃 ⇒ 方向反 |
| $n,m$ 只以"$n\times m$ 矩阵"身份出现 | 全文 | 所有步骤关于 $m$ 一致 | 见 10.8 的逐项清点 |

### 10.8 $m$-一致性的逐项清点

素材最后一行说"清点上面所有不等式：HS 乘积界、Cauchy-Schwarz、Parseval、$\HS{A^*}=\HS A$、$J\Delta J$ 的迹展开，全部与 $m$ 无关"。我把每一项的 $m$-依赖写出来，因为这是本文 "complete" 的**证明论证据**（，并非靠归纳或维度计数）：

| 用到的事实 | 出处 | $m$-依赖 |
| --- | --- | --- |
| $\HS{AB}\le\|A\|\HS B$（两个方向） | 补步 18 (3) | 无。这是算子范数与 HS 范数的相容性，与阶数无关 |
| 双线性配对 + Cauchy-Schwarz | `main.tex:351-353` | 无。$(k,i,j)$ 合成一个指标，长度 $m^2$ 但不等式形式不变 |
| `prop:coefficients` 双侧估计 | `main.tex:249-251` | 无。核 $K$ 是**标量值**函数，与 $m$ 无关；作用在 $M_m$-值函数上是逐元素 |
| $\HS{A^*}=\HS A$ | 补步 9 | 无 |
| Parseval（$M_m$-值 $L^2$） | `main.tex:416` | 无。$\HS{\cdot}^2$ 恰是 $M_m$ 上的 Hilbert 范数平方，Parseval 在任何 Hilbert 空间成立 |
| 合同保正半定（$\Delta$、$J\Delta J$） | `main.tex:437`、`:440` | 无 |
| $\tr(FF^*)=\HS F^2$ | 补步 30 | 无 |
| $2a^2\le8a^2/\gamma^2$ 消 $a$ | `main.tex:446-451` | 无。$a$ 自身依赖 $m$，但在齐次比较中被完全消掉 |

$[推测]$ 这八行合起来给我的判断是：本文对 $m$ 的一致性来自**每一步都在 Hilbert $C^*$-模的语言里成立**（HS 范数是 $M_m$ 作为 Hilbert 空间的范数、正性是逐点的、配对是双线性的），而 Hilbert 空间层面的不等式天生与维数无关。任何按"矩阵元素的 max"或"行和列和"估计的路线都会带上 $\log m$ 或 $m$。这与第 3 节我列的"三层直接"里第三层（不做任何归纳）是同一件事。

### 10.9 下半段的候选失败路线

$[推测]$ 其一，对 $A$ 做相似变换 $SAS^{-1}$ 把域变成圆盘。失败机制有两处硬伤。(i) $R+R^*\succeq0$ 的正性**只对原矩阵 $A$** 成立：`eq:support`（`main.tex:170-173`）里的 $z=v^*Av$ 必须是 $A$ 的数值范围点，换成 $SAS^{-1}$ 后二次型不再是 $W(A)$ 的元素，`lem:resolvent` 的 `main.tex:291-293` 强调就是这一条。(ii) 系数嵌入 $C\mapsto I_n\otimes C$ 与相似 $S\otimes I_m$ 不交换：相似作用在底空间，数值范围随之变，而 $\|P[A]\|$ 的不变性需要 $S$ 只作用第一因子，条件数 $\kappa(S)$ 就会进常数。`Badea-Crouzeix-Delyon` 用数值范围椭圆把 $\kappa(S)\le2$ 做出来（`main.tex:86-88`），但那是 $n=2$ 的特殊几何，且它做的是标量多项式的相似归约，不能按元素提升到矩阵值情形。**本文用"把 $a$ 齐次消掉"代替"把 $A$ 变简单"**，这是我读的整段里最直接的对比。

$[推测]$ 其二，Schur 分析 / 单位圆上的算子值 Schur 算法。走这条路需要把 $M_m$-值 Schur 函数与底空间算子 $A$ 做交换子提升，正是要证的"完全"性质；且在 $L^2(\T;M_m)$ 中 $\|T\|\le1$ 的提升需要 $T$ **完全非扩张**。$K$ 是标量核 ⇒ $T$ 自动完全压缩（第 6.2 步末我算过），但交换子提升还需要 $A$ 生成的代数包含 $T$。本文用"奇异对 + 系数配对"直接给出泛函数表示，跳过提升定理。素材第 2.2(d) 也记过一条同类尝试（谱演算），两处对应的是同一个障碍：**提升定理的前提就是结论**。

$[推测]$ 其三，Pick 插值把 $\max_{\partial\Omega}\|F\|\le1$ 转成 Nevanlinna-Pick 矩阵正性。NP 正性是一族分块矩阵正性（Sz.-Nagy-Peecz 型），形式上与本文的 $\Delta\succeq0$ 相似，这是我一开始觉得"这条路很可能就是作者走的路"的原因。但它给的是**存在性**方向（存在插值函数 $\iff$ NP 矩阵正），而本文要的是**给定** $F$ 的范数估计，方向相反：需要"从 $F$ 的存在推出矩阵正"，即 NP 的逆向，一般只在 $m=1$ 或有超酉结构时等价。而且 NP 路线需要 $\Omega$ 上的函数代数及其完全有界基，`lem:approx` 的外逼近又要重做。本文的 $R+R^*\succeq0$ 是**正向、由凸性免费给出的那一半正性**，这才是它能直接闭合的原因。

$[推测]$ 其四，把 $2\times2$ 块正性换成标量正性（对 $\Delta$ 取一个元素或对 $v^*\Delta v$ 用标量不等式）。失败机制：$v^*\Delta v\ge0$ 逐点给的界是 $|v^*\Delta v|\le\ldots$ 型，把 $\HS{M+L^*}^2$ 换成某个方向的二次型后，Parseval 的双计数（$\pm k$ 两份）无法与 $a^2$ 的全权重对上，最后只能得到 $\gamma\le2\sqrt m$ 或 $\gamma\le c\sqrt{\dim}$ 一类带 $m$ 的结论。素材 4.5 节的绕行清单里 Lean 用 `positive_block_hsSq` 一步直出 $\HS{}^2$ 型不等式，说明这条"块层面，并非标量层面"的选择在形式化里也被确认过：机器需要一个以 $\HS{\cdot}^2$ 为结论的引理，并非以元素为结论的引理。这一点在第 4 节我列为"第三条全局口径"，在 10.7 的表里没有单列，我在此补一句：它是全文里唯一一处"选错了就会失去完整性"的口径选择。

## 11 `lem:approx`：解析凸外逼近，以及为什么必须用指数和

### 11.1 精确陈述与它在全文里的岗位（`main.tex:454-461`）

§4 的标题与开场两行：

```tex
\section{Enclosing domains and arbitrary numerical ranges}\label{sec:limit}
Theorem~\ref{thm:domain} applies on an analytic convex neighborhood. We now construct such neighborhoods even for compact convex sets with empty interior, and then shrink them to $W(A)$.
```

```tex
\begin{lemma}[Analytic convex outer approximation]\label{lem:approx}
Let $K\subset\C$ be nonempty, compact, and convex. There are bounded convex open domains $\Omega_j$ with regular real-analytic Jordan boundaries such that $K\subset\Omega_j$ and
\[
 \sup_{z\in\overline\Omega_j}\dist(z,K)\longrightarrow0.
\]
\end{lemma}
```

假设只有三条：`nonempty, compact, convex`。**允许空内部**（单点、线段）。摘要里那句 `including matrices whose numerical ranges are points or line segments`（`main.tex:33`）的全部技术兑现就在这一条引理里，别处没有。

序列写成 $\Omega_j$ 而构造用 $\Omega_\delta$：$\delta$ 是连续参数，$j$ 是离散序列，中间靠 `main.tex:510` 的 `Taking, for example, $\delta_j=1/(j+1)$` 缝合。$[分析]$ 这个"for example"值得停一下：它说明**序列的选择本身不重要**，只要 $\delta_j\to0$ 且 $\delta_j<1$。作者把构造做成以 $\delta$ 为参数的**一族**，并非逐 $j$ 递推，这样距离估计只需证一次。

### 11.2 构造（`main.tex:464-469`）

给定 $0<\delta<1$，四步：

1. 取单位方向的**有限** Euclidean $\delta$-网 $D_\delta\subset\T$，且要求 $1,-1,i,-i\in D_\delta$（`choose a finite Euclidean $\delta$-net $D_\delta$ of unit directions that includes $1,-1,i,-i$`）。
2. 支撑函数 $s_K(\nu)=\max_{z\in K}\Re(\bar\nu z)$。$K$ 紧 ⇒ 最大值取得到（连续函数在紧集上）。
3. 选 $t_\delta>0$ 使 $|D_\delta|e^{-t_\delta\delta}<1$。可行，因为 $|D_\delta|<\infty$、$\delta>0$：取 $t_\delta>\delta^{-1}\log|D_\delta|$ 即可。
4. 定义
$$\Phi_\delta(z)=\sum_{\nu\in D_\delta}\exp\bigl(t_\delta(\Re(\bar\nu z)-s_K(\nu)-\delta)\bigr),\qquad \Omega_\delta=\{z:\Phi_\delta(z)<1\}.$$

补步 1：$\Phi_\delta$ 的性质逐项：每一项是 $z\mapsto\exp(\text{实仿射}(z))$，正、实解析、凸（$\exp$ 凸且递增，复合仿射保持凸；Hessian 我下面第 (4) 条显式算）。有限和保持三条性质。所以 $\Omega_\delta$ 是**开凸集**（凸函数的 $<1$ 次水平集凸），边界是 $\{\Phi_\delta=1\}$。$[推测]$ 我起初以为作者选"指数和"是因为它是最光滑的凸函数类，停下来重读是因为论文第 484 行直接给出了 Hessian 的**显式形式**：选指数和的真正理由是"Hessian 可以一行写出来"，这是为第 (4)(5) 步服务的，并非为了光滑。

补步 2：$K\subset\Omega_\delta$（`main.tex:470`：`Each point of $K$ satisfies $\Phi_\delta<1$`）。$z\in K$ 时 $\Re(\bar\nu z)-s_K(\nu)\le0$（支撑函数是上确界），故每项 $\le e^{-t_\delta\delta}$，和 $\le|D_\delta|e^{-t_\delta\delta}<1$。✓
**这就是 $t_\delta$ 那个不等式的唯一用途**，也说明 $|D_\delta|$ 的有限性在哪里被消费掉：若网无限，$|D_\delta|=\infty$，$t_\delta$ 无法选。

补步 3：次水平集给出支撑不等式族（`main.tex:471-474`：`If $\Phi_\delta(z)\le1$, each positive summand is at most one`）。每项严格正且和 $\le1$ ⇒ 每项 $\le1$ ⇒ $t_\delta(\Re(\bar\nu z)-s_K(\nu)-\delta)\le0$ ⇒
$$\Re(\bar\nu z)\le s_K(\nu)+\delta\qquad(\forall\nu\in D_\delta).$$
除掉 $t_\delta$ 只需 $t_\delta>0$，**不需要它的具体大小**。素材记的"$t_\delta$ 只通过 (1) 起作用"我核对成立：全文中 $t_\delta$ 只出现在补步 2 那一处。

补步 4：有界性（`main.tex:475-482`）。四个轴向给出
$$\min_{w\in K}\Re w-\delta\le\Re z\le\max_{w\in K}\Re w+\delta,\qquad \min_{w\in K}\Im w-\delta\le\Im z\le\max_{w\in K}\Im w+\delta .$$
逐条核对：$\nu=1$ 给 $\Re z\le s_K(1)+\delta=\max_{w}\Re w+\delta$。$\nu=-1$ 给 $-\Re z\le s_K(-1)+\delta=\max_w(-\Re w)+\delta=-\min_w\Re w+\delta$，即 $\Re z\ge\min_w\Re w-\delta$。$\nu=i$：$\Re(\bar i\,z)=\Re(-iz)=\Im z$，给 $\Im z\le\max\Im w+\delta$。$\nu=-i$ 给 $\Im z\ge\min\Im w-\delta$。✓
`Thus one fixed rectangle contains every closed sublevel for $0<\delta<1$`：这个矩形只依赖 $K$（四个极值），$\delta\le1$ 时它统一包住所有 $\overline\Omega_\delta$。$[分析]$ 这个"固定矩形"在后面被用了**两次**，我在这里先记两次岗位：第一次是 `main.tex:486` 的"开次水平集有界"（Jordan 曲线那步），第二次是 `main.tex:523` 的"所有 $\overline\Omega_j$ 落在同一个紧集里"（一致连续模统一）。第 12.2 步回到它。
仅有两个非共线方向不够：那只能给出一个**楔形**，无界。要同时界住 $\pm\Re,\pm\Im$ 必须这四个方向（或任何正向张成 $\mathbb R^2$ 的集合）。

补步 5：严格凸 + 实解析（`main.tex:484`，原文照抄）：

> `The Hessian is a sum of positive multiples of $\nu\nu^{\mathsf T}$ after identifying $\C$ with $\mathbb R^2$. The four axis directions ensure it is positive definite. Thus $\Phi_\delta$ is strictly convex and real analytic.`

我算出来：
$$\nabla^2\Phi_\delta(z)=\sum_{\nu\in D_\delta}t_\delta\,E_\nu(z)\,\nu\nu^{\mathsf T},\qquad E_\nu(z)=\exp\bigl(t_\delta(\Re(\bar\nu z)-s_K(\nu)-\delta)\bigr)>0,$$
其中把 $\nu$ 看作 $\mathbb R^2$ 里的单位列向量。对任意实 $\xi\ne0$：$\xi^{\mathsf T}\nu\nu^{\mathsf T}\xi=(\nu\cdot\xi)^2\ge0$，取 $\nu=1$ 与 $\nu=i$ 两项得
$$\xi^{\mathsf T}\nabla^2\Phi_\delta\xi\ge t_\delta\bigl(E_1(z)\xi_1^2+E_i(z)\xi_2^2\bigr)>0 .\ \checkmark$$
**这是四个轴向的第一个用途**，而且 $\pm$ 里其实只用一个就够（$1$ 与 $-1$ 给同一个 $\nu\nu^{\mathsf T}$）。所以 $\{1,-1,i,-i\}$ 这组的选择是"两个用途的并"：Hessian 正定只需 $\{1,i\}$，有界性需要 $\{1,-1,i,-i\}$。素材记的这条我完全确认，而且我认为这是全引理里最"工程化"的一处：四个方向不是审美选择，是两条独立需求的并集。

补步 6：水平集正则（`main.tex:486` 前半，原文）：

> `The gradient cannot vanish at level one: a critical point of a differentiable convex function is a global minimum, whereas every point of $K$ has value less than one.`

我的还原：若 $z\in\{\Phi_\delta=1\}$ 且 $\nabla\Phi_\delta(z)=0$，凸 + 可微 ⇒ $z$ 是全局最小 ⇒ $\Phi_\delta(z)\le\Phi_\delta(w)$ 对所有 $w$。但 $K$ **非空**，取 $w\in K$，补步 2 给 $\Phi_\delta(w)<1=\Phi_\delta(z)$，矛盾。✓ 隐函数定理 ⇒ $\{\Phi_\delta=1\}$ 是正则实解析曲线。
$[分析]$ 这里"非空"被消费一次（另一次在补步 2）。若 $K=\varnothing$ 整个引理无意义。另外注意：**这一步并没有用到严格凸性**，只用到"凸 + 存在值更小的点"。严格凸性的实际岗位是保证次水平集的边界形状足够好（配合下条的唯一性），论文把 (5) 写在 (4) 之后，是为了让读者先拿到"好的形状"再证明"水平集是曲线"，属于叙述顺序，并非逻辑依赖。这是我读 `main.tex:484-486` 两段顺序时的判断，标 `[推测]`。

补步 7：Jordan 曲线（`main.tex:486` 后半）。开次水平集有界（补步 4）、凸（补步 1）、有内点（$K\subset\Omega_\delta$ 且 $\Omega_\delta$ 开，非空开集有内点）。固定内点 $z_0$ 后每条射线**恰一次**穿过水平 1：
- 存在性：沿方向 $e^{it}$，$\{\Phi_\delta\le1\}$ 有界 ⇒ 足够远处 $\Phi_\delta>1$；$\Phi_\delta$ 连续、$z_0$ 处 $<1$ ⇒ 中间值定理给交点。
- 唯一性：次水平集**凸** ⇒ 凸集与射线的交是区间，含内点侧，故边界交点唯一。
- 从紧边界到圆的径向投影是连续双射；紧 ⇒ Hausdorff 的连续双射是同胚 ⇒ 边界是 Jordan 曲线，且 $\overline\Omega_\delta=\{\Phi_\delta\le1\}$（紧 = 闭 + 有界，用补步 4）。✓

论文原句 `convexity and boundedness give existence and uniqueness`：boundedness 管存在、convexity 管唯一，前面单独建立的性质在这里各管一半。$[分析]$ 这类"两个前置性质分别管一个结论的一半"的写法在本引理出现三次（四次轴向两用、凸/有界分管存在唯一、$\delta$ 的双重身份），我认为它透露作者是在**按性质清单**，并非按定理清单组织这段证明。

补步 8：距离估计（`main.tex:488-509`），全引理最手工的地方。取 $z\in\overline\Omega_\delta\setminus K$，$w\in K$ 最近，$d=|z-w|$，$\nu=(z-w)/d$，$\mu\in D_\delta$ 使 $|\mu-\nu|\le\delta$，$v\in K$ 达到 $s_K(\mu)$（`Choose $v\in K$ attaining $s_K(\mu)$`，靠紧性）。

**投影不等式**（`main.tex:492-493`）：$w+t(v-w)\in K$（$0\le t\le1$，$K$ 凸），$w$ 最近 ⇒
$$|z-(w+t(v-w))|^2\ge d^2\ \Rightarrow\ -2t\Re(\overline{z-w}(v-w))+t^2|v-w|^2\ge0\ \Rightarrow\ (\div t,\ t\to0^+)\ \Re(\bar\nu(v-w))\le0 .\ \checkmark$$
这是全文用到 $K$ 凸性的地方之一，也是唯一把"最近点的法向"与"支撑方向"挂钩的地方。

论文的三行链（`main.tex:495-503`），逐行还原：
$$ (1-\delta)d\le\Re(\bar\mu(z-w))\le\Re(\bar\mu(v-w))+\delta\le\delta|v-w|+\delta\le\delta\bigl(1+\operatorname{diam}K\bigr).$$
- 第一行：$\Re(\bar\mu\nu)=1-\Re(\bar{\mu-\nu}\,\nu)\ge1-|\mu-\nu|\ge1-\delta$，乘 $d=|z-w|$ 且 $z-w=d\nu$。$\checkmark$（用 $|\nu|=1$；也说明 $\delta<1$ 必需，否则 $1-\delta\le0$ 不等式变平凡。）
- 第二行：$z\in\overline\Omega_\delta$ ⇒ 补步 3 的支撑不等式 $\Re(\bar\mu z)\le s_K(\mu)+\delta=\Re(\bar\mu v)+\delta$ ⇒ $\Re(\bar\mu(z-v))\le\delta$；而 $\Re(\bar\mu(z-w))=\Re(\bar\mu(z-v))+\Re(\bar\mu(v-w))$。$\checkmark$
- 第三行：$\Re(\bar\mu(v-w))=\Re(\bar\nu(v-w))+\Re(\overline{\mu-\nu}(v-w))\le0+|\mu-\nu||v-w|\le\delta|v-w|$，用投影不等式。$\checkmark$
- 末行：$|v-w|\le\operatorname{diam}K$。✓
`The first and third inequalities use $|\mu-\nu|\le\delta$`（`main.tex:504`）：论文自己点明哪两处用网的近似性，第一行与第三行，正对应"方向误差"的两次进入。
$z\in K$ 时距离 0，取上确界：
$$\sup_{z\in\overline\Omega_\delta}\dist(z,K)\le\frac{\delta(1+\operatorname{diam}K)}{1-\delta}\longrightarrow0\quad(\delta\to0).\ \checkmark$$

$[分析]$ 我读到这里的第一反应是"为什么不直接用 $\dist$ 的定义算"。答案是：$K$ 只给**方向**支撑（$s_K$ 是方向函数），不给距离；插入支撑点 $v$ 是把方向误差 $\delta$ 转成距离误差 $\delta(1+\operatorname{diam}K)$ 的唯一桥梁，而桥梁的另一端是投影不等式。$w$ 单独用不了，因为它不一定与任何 $\mu\in D_\delta$ 相关；$v$ 是按 $\mu$ 选的，所以 $\mu$ 的两条信息（近似 $\nu$、支撑 $v$）同时可用。这个"插入一个按网选点"的手法我认为值得单独记住。

补步 9：$\delta_j=1/(j+1)$（`main.tex:510`）满足 $0<\delta_j<1$、$\delta_j\to0$，代进去 $\frac{\delta_j(1+\operatorname{diam}K)}{1-\delta_j}\to0$。$\blacksquare$（这条引理的证明结束。）

### 11.3 常数与假设的机械理由

| 对象 | 位置 | 作用 | 崩点 |
| --- | --- | --- | --- |
| $D_\delta$ **有限** | `main.tex:464` | 补步 2 的 $|D_\delta|$ 可被 $e^{-t_\delta\delta}$ 压住；Hessian 是有限和；$\Phi$ 是实解析指数和 | 无穷网：$|D_\delta|=\infty$ 无法选 $t_\delta$；级数的一致收敛与解析性要重证 |
| $\{1,-1,i,-i\}\subset D_\delta$ | `main.tex:464` | 两用：Hessian 正定（$\{1,i\}$ 够）、闭次水平集被固定矩形包住（需四个） | 少 $\pm i$：虚向无界 ⇒ 补步 7 的"有界"与 $\overline\Omega_\delta$ 紧失效 ⇒ 无径向投影 ⇒ Jordan 不成立 ⇒ `lem:exterior-collar` 不可用 |
| $t_\delta$ 满足 $|D_\delta|e^{-t_\delta\delta}<1$ | `main.tex:464` | 保证 $K\subset\Omega_\delta$（**严格**包含） | 若只 $\le1$：$K$ 可能触到 $\{\Phi=1\}$ ⇒ 补步 6 的"存在值 $<1$ 的点"失效 ⇒ 梯度可能在水平 1 处为零 ⇒ 隐函数定理不可用；且 `lem:exterior-collar` 需要 $z_*\in\Omega$、`lem:resolvent` 需要 $\dist(W(A),\partial\Omega)>0$。**这个严格不等号是全文"外逼近"方向性的根** |
| $0<\delta<1$ | `main.tex:464` | 距离估计里 $1-\delta>0$；$\delta_j=1/(j+1)$ 满足 | $\delta\ge1$ 时第一行不等式不再约束 $d$ |
| $\delta$ 的双重身份 | `main.tex:464,466,473` | 既是网的分辨率（$|\mu-\nu|\le\delta$），又是支撑松弛量（$\Re(\bar\nu z)\le s_K(\nu)+\delta$、指数里的 $-\delta$）。刻意合并，使误差与松弛同量级，最终 $O(\delta)$ | 若两个 $\delta$ 取不同量级（网用 $\delta^2$、松弛用 $\delta$）：距离界仍是 $O(\delta)$，无改善，但写法变复杂。$[分析]$ 合并是为了"误差 = 分辨率 = 松弛"三条线只跟一个参数，少一个自由度 |
| $s_K(\nu)$ 用 $\max$（取得到） | `main.tex:464`、`:491` | $v$ 的存在 | $K$ 不紧 ⇒ 支撑值可能不取到 ⇒ 第三行无 $v$ 可用 |
| $K$ 凸 | `main.tex:492`（$w+t(v-w)\in K$）与 $\Omega_\delta$ 凸 | 前者给投影不等式，后者给射线唯一性 | 非凸 ⇒ 最近点的法向不再是支撑方向 ⇒ 距离估计崩。这正是为什么必须先用 Toeplitz-Hausdorff 证 $W(A)$ 凸（`main.tex:514`）再用本引理 |
| $\operatorname{diam}K$ | `main.tex:501`、`:507` | 把角度误差换成距离误差 | 无界 $K$ 时 $\operatorname{diam}K=\infty$；主定理里 $K=W(A)$ 自动紧有界 |
| $\Phi_\delta$ 的 exp 结构 | `main.tex:466` | 实解析 + 凸 + Hessian 显式 | 改用多边形外逼近（$\bigcap_\nu\{\Re(\bar\nu z)\le s_K(\nu)+\delta\}$）：得到凸多边形，边界有角点 ⇒ 非"正则实解析 Jordan" ⇒ `lem:exterior-collar` 不可用。**这是本引理必须光滑化（指数和），并非用多边形的全部理由** |

### 11.4 候选失败路线

$[推测]$ 其一，直接用 Minkowski 和 $K+\overline{D(0,\varepsilon)}$。它给凸紧集、$\dist\to0$，但边界一般只是 Lipschitz（平直段接圆弧处有角），**不是实解析 Jordan 曲线** ⇒ `lem:exterior-collar` 的 Schwarz 反射不能做 ⇒ 没有单叶领子 ⇒ 没有 $|s_{kj}|\le C_\rho\rho^{k+j}` ⇒ `prop:coefficients` 的核 $K$ 无从定义。失败机制是"正则性不足"，与"逼近不够好"无关。这一点我很想确认作者是否考虑过：`lem:exterior-collar` 附录里那些 Carathéodory、反射、"第三半径"步骤全部依赖边界解析性，所以退化逼近一定会撞墙。

$[推测]$ 其二，卷积磨光（Mollifier）+ 支撑函数。标准做法取 $\Phi=\rho*K$ 的水平集，但磨光后边界的实解析性需要解析核（高斯核），而高斯卷积的次水平集**凸性不显然**（需要 Prékopa 型论证或直接磨光支撑函数）。论文的指数和把"凸"与"解析"两条都变成逐项显然，代价是要手工做补步 8 的距离估计。$[分析]$ 我认为这是"直接"风格的又一体现：用可逐项验证的初等构造代替一般定理，把复杂度从"引用一个定理并核对它的前提"转移到"算三行不等式"。

$[推测]$ 其三，代数曲线（把 $\Phi$ 换成多项式的次水平集）。多项式次水平集一般**无界**（例：$z\mapsto\Re z^2$ 的 $\{<1\}$ 无界），要造有界凸代数域需要额外技巧。而指数项 $\exp(t\Re(\bar\nu z))$ 在支撑方向外侧增长极快，天然给出有界次水平集；补步 2 里那个 $t_\delta$ 的选择正是这种增长的体现。$[推测]$ 顺带一个我读这段时想到的折中方案：用 $\sum_\nu(\Re(\bar\nu z)-s_K(\nu)-\delta)^{2k}$ 的高次多项式和也能给解析边界，但当和式出现负值时凸性丢失（偶次幂非全局凸），所以 $\exp$ 的单调性不可替代。

$[推测]$ 其四（素材没有列，我自己加的一条），把 $D_\delta$ 取成整个 $\T$ 而把和换成积分 $\int_\T\exp(\cdot)ds(\nu)$。那会给出一个解析凸函数，且不需要 $t_\delta$ 的挑选（积分 $\le e^{-t\delta}$ ，并非 $|D|e^{-t\delta}$，$\delta$ 换成弧长测度后需要更细的估计）。但距离估计里的 $\mu\in D_\delta$（**离散选点**）就要换成"$\mu$ 是使某积分最大的方向"，投影不等式的插入点 $v$ 随之变成测度依赖的对象，三行链会重写成变分形式。作者选有限网，我判断是因为 $|\mu-\nu|\le\delta$ 这条**逐点**近似让补步 8 变成初等算术。

## 12 `thm:main` 的证明：凸性重证、极限、最优性

### 12.1 第一段：重证 Toeplitz-Hausdorff（`main.tex:513-518`）

```tex
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Compactness of $W(A)$ follows from compactness of the unit sphere. We recall a short proof of the Toeplitz--Hausdorff convexity theorem \cite{Toeplitz1918,Hausdorff1919}. To join two numerical-range values, compress $A$ to the span of their unit testing vectors. If that span has dimension one there is nothing to prove. In dimension two, its quadratic form on unit vectors $(u,v)$ is a complex-valued real-affine function of
\[
 (2\Re(\bar uv),\ 2\Im(\bar uv),\ |u|^2-|v|^2),
\]
which ranges over the full unit sphere in $\mathbb R^3$. The linear part of a map from $\mathbb R^3$ to $\mathbb R^2$ has a nonzero kernel. Any point of the unit ball can be moved in a kernel direction to the sphere without changing its image. Thus the images of the sphere and ball coincide, and this image is convex. Its segment between the chosen values belongs to the numerical range of the compression and hence to $W(A)$.
\end{proof}
```

论文为什么要在这里重证一个 1918/1919 年的定理？因为 `lem:approx` 需要 $K=W(A)$ **凸**，而作者不愿只引一个定理名。`We recall a short proof` 里的 recall 是作者自陈这段是**回顾**，不是新贡献，我在第 14 节的动词清点里已经把它归到"回顾类"。

逐步核对六步：

补步 1（紧致性）：$u\mapsto u^*Au$ 是单位球面（紧）到 $\C$ 的连续映射，像紧。✓

补步 2（约化到两点）：取 $W(A)$ 中两值 $\lambda_1=u_1^*Au_1$、$\lambda_2=u_2^*Au_2$（单位向量），令 $V=\operatorname{span}\{u_1,u_2\}$，$\dim V\in\{1,2\}$。压缩 $B=P_V^*AP_V$（在 $V$ 的标准正交基下是 $1\times1$ 或 $2\times2$ 矩阵）。

补步 3（$\dim=1$）：$V=\mathbb Cu_1$，$\lambda_1=\lambda_2$ 必相等，线段是点。✓

补步 4（$\dim=2$ 的参数化）：单位向量写 $(u,v)\in\C^2$，$|u|^2+|v|^2=1$。二次型
$$\begin{pmatrix}\bar u&\bar v\end{pmatrix}\begin{pmatrix}b_{11}&b_{12}\\b_{21}&b_{22}\end{pmatrix}\begin{pmatrix}u\\v\end{pmatrix}=b_{11}|u|^2+\bar b_{12}\bar u v+b_{21}\bar v u+b_{22}|v|^2$$
（这里我用 $b_{12}^*=\bar b_{12}$ 处理左行向量，$\bar u\,b_{12}\,v$ 与 $\bar v\,b_{21}\,u$ 各自是实部结构）。用论文给的三个实量
$$x=2\Re(\bar uv),\qquad y=2\Im(\bar uv),\qquad z=|u|^2-|v|^2$$
改写：$|u|^2=\frac{1+z}2$、$|v|^2=\frac{1-z}2$、$\bar uv=\frac{x+iy}2$、$\bar{uv}=\frac{x-iy}2$（$\bar v u=\overline{\bar u v}$）。代入后一切化为 常数 + $x,y,z$ 的实线性组合 ⇒ **实仿射**（complex-valued real-affine function）。✓ 这正是论文那句话的内容，我把它验算到系数级是因为"$\bar uv$ 的实部虚部恰好是 $x/2,y/2$"这一步容易写错符号，而符号错了仿射性仍然成立（无所谓），但**球面覆盖**那一步就不可用。

补步 5（球面像 = 球体像）：恒等式 $x^2+y^2+z^2=(2|\bar uv|)^2+(|u|^2-|v|^2)^2=(|u|^2+|v|^2)^2=1$ ✓（这是 Bloch 球参数化的标准恒等式）。且每个球面点可反解：给 $(x,y,z)$ 满足 $x^2+y^2+z^2=1$，取 $|u|^2=\frac{1+z}2,|v|^2=\frac{1-z}2$，$\bar uv$ 由 $x,y$ 定（模长 $\sqrt{\frac{x^2+y^2}4}=\sqrt{\frac{1-z^2}4}=|u||v|$ ✓ 相容），可解出 $(u,v)$ 到一个相位。⇒ 三个量跑遍**整个**单位球面。✓
然后：`The linear part of a map from $\mathbb R^3$ to $\mathbb R^2$ has a nonzero kernel.`（线性部分 $\mathbb R^3\to\mathbb R^2$ 秩 $\le2$，核维数 $\ge1$）`Any point of the unit ball can be moved in a kernel direction to the sphere without changing its image.` 即球内点 $p$（$\|p\|\le1$）沿核方向 $k\ne0$ 推到 $p+tk$ 使 $\|p+tk\|=1$（连续、$t$ 够大时范数 $>1$，中间值），像不变。⇒ 球体像 $\subseteq$ 球面像，反包含平凡 ⇒ **相等**。球体凸，仿射像凸 ⇒ 球面像凸。✓

补步 6（回到 $W(A)$）：压缩 $B$ 的数值范围 = 球面像，凸。所选两点的线段 $\subset W(B)$；而 $W(B)\subset W(A)$（把 $V$ 的单位向量嵌入原空间，即 $W(P_V^*AP_V)\subset W(A)$）。✓ $\blacksquare$（凸性证毕）

$[分析]$ 第 5 步"沿核方向推到球面"是**仿射几何的免费一步**，比标准教材的椭圆参数方程证明短。这也解释它为什么出现在一篇 Crouzeix 论文里，并非被引用：作者**只需要凸性**，不需要"数值范围是椭圆盘、焦点在特征值"那套描述。素材 2.7(d) 第 1 条我照抄进来并加一句：这个选择还有一个副作用，见 12.4 节的失败路线其一。

### 12.2 第二段：极限（`main.tex:520-524`）

```tex
Apply Lemma~\ref{lem:approx} with $K=W(A)$. By scaling Theorem~\ref{thm:domain},
\[
 \|P[A]\|\le2\max_{z\in\overline\Omega_j}\|P(z)\|.
\]
If this maximum is zero, each entry of $P$ vanishes on an open set and the polynomial is identically zero, making the inequality immediate. Otherwise divide $P$ by the maximum to invoke that theorem. All $\overline\Omega_j$ lie in one compact set. Uniform continuity of the fixed function $z\mapsto\|P(z)\|$, the containment of $K$, and the uniform distance convergence imply convergence of these maxima to $\max_K\|P\|$. This proves \eqref{eq:main} without any interior assumption on $K$.
```

补步 7（缩放方向）。记 $M_j=\max_{\overline\Omega_j}\|P\|$（存在：$\overline\Omega_j$ 紧、$z\mapsto\|P(z)\|$ 连续）。$M_j>0$ 时令 $F=P/M_j$，则 $\|F(z)\|\le1$ 在**整个** $\overline\Omega_j$ 上成立，因此在 $\partial\Omega_j$ 上成立 ⇒ `thm:domain` 给 $\|F[A]\|\le2$ ⇒ $\|P[A]\|\le2M_j$。✓
**方向值得停一下**：`thm:domain` 的假设是边界上的 $\le1$，这里喂给它的是**闭包上的 $\le1$**，比边界更强，所以不需要最大模原理。$[推测]$ 我认为这是刻意的省事：$z\mapsto\|P(z)\|$ 次调和（多项式值的算子范数），边界 sup 等于域内 sup，本来可以只用边界假设并补一句次调和；作者直接放大假设，绕开一个引理。Lean 侧同样处理：`DomainBound.lean:96-97` 的 `exact hF _ (le_of_eq (hcircle _ (Faber.unitPoint_norm t)))` 只用 `hcircle` 把点拉回圆周，**完全避开最大模原理**（素材 2.5(c) 第一行也记过这条，我在 10.7 表格里已经引用一次，这里是它的正面出现处）。

补步 8（$M_j=0$ 的分情形是必需的，因为要除 $M_j$）。论证：$M_j=0$ ⇒ 每个元（标量多项式 $P_{ab}$）在 $\overline\Omega_j$ 上为 0；$\Omega_j$ 是**开**集（`lem:approx` 的产出）⇒ 在一个非空开集上为 0 ⇒ 恒为 0 ⇒ $P[A]=0$，$0\le2\cdot0$ 成立。✓ 用到 $\Omega_j$ 开这一条：线段 $K$ 自己没有内点，但 $\overline\Omega_j$ 有。$[分析]$ 这段的写法透露作者对"最大值为零"是**先处理掉再归一化**，并非用 $\varepsilon$ 扰动，保持证明初等。与 `main.tex:329` 的 `There is nothing to prove if $\gamma=0$` 是同一种习惯。

补步 9（三个输入与收敛）。
(i) `All $\overline\Omega_j$ lie in one compact set`：依据是 `lem:approx` 第 482 行的**固定矩形**（补步 4），这是那一步的**第二次**用途。
(ii) $z\mapsto\|P(z)\|$ 在该公共紧集上一致连续（连续 + 紧）。
(iii) $K\subset\overline\Omega_j$（`lem:approx` 的 $K\subset\Omega_j$）且 $\sup_{\overline\Omega_j}\dist(z,K)\to0$。
合起来，记 $\omega$ 为一致连续模、$\varepsilon_j=\sup_{z\in\overline\Omega_j}\dist(z,K)$：
$$\max_K\|P\|\le\max_{\overline\Omega_j}\|P\|\le\max_K\|P\|+\omega(\varepsilon_j)\xrightarrow[j\to\infty]{}\max_K\|P\|.\ \checkmark$$
（第二号：$\bar z\in\overline\Omega_j$ 取到 $\max_{\overline\Omega_j}$，$w\in K$ 最近，$\|P(\bar z)\|\le\|P(w)\|+\omega(|\bar z-w|)\le\max_K\|P\|+\omega(\varepsilon_j)$，取 sup。）
于是 $\|P[A]\|\le2\lim_jM_j=2\max_{W(A)}\|P\|$。✓ 这就是 `eq:main`。

补步 10：`This proves \eqref{eq:main} without any interior assumption on $K$` 呼应摘要 `main.tex:33` 的 "including matrices whose numerical ranges are points or line segments"。整篇论文里"点与线段"这一卖点只由 `lem:approx` + 这一句兑现，中间没有任何分支处理。

### 12.3 第三段：最优性（`main.tex:526-530`）

```tex
For sharpness take $n=2$, $m=1$, $P(z)=z$, and
\[
 A=\begin{pmatrix}0&2\\0&0\end{pmatrix}.
\]
Its norm is two, while $|x^*Ax|=2|x_1x_2|\le1$ for every unit $x$, with equality at $x_1=x_2=1/\sqrt2$. Thus the right-hand maximum in \eqref{eq:main} is one. No smaller universal constant is possible.
```

补步 11：逐项核对。
$A^*A=\begin{pmatrix}0&0\\2&0\end{pmatrix}\begin{pmatrix}0&2\\0&0\end{pmatrix}=\begin{pmatrix}0&0\\0&4\end{pmatrix}$ ⇒ $\|A\|=\sqrt{4}=2$ ✓。
$x^*Ax=\begin{pmatrix}\bar x_1&\bar x_2\end{pmatrix}\begin{pmatrix}2x_2\\0\end{pmatrix}=2\bar x_1x_2$ ⇒ $|x^*Ax|=2|x_1x_2|\le|x_1|^2+|x_2|^2=1$ ✓（AM-GM），等号在 $|x_1|=|x_2|=1/\sqrt2$ ✓（论文取实正数 $x_1=x_2=1/\sqrt2$）。
左端 $\|P[A]\|=\|A\|=2$，右端 $2\max_{W(A)}|z|=2\cdot1=2$ ⇒ 比值恰 2 ⇒ 任何一致常数 $c$ 必须 $\ge2$。✓

$[推测]$ 素材记：这个 $A$ 的数值范围其实是**闭圆盘** $\overline{D(0,1)}$（论文未明说；标准事实，$W\begin{pmatrix}0&2\\0&0\end{pmatrix}=\{z:|z|\le1\}$）。论文只算了最大值 $=1$，够用。我补一句为什么这个"未明说"值得记录：`thm:domain` 的假设是 $W(A)\subset\Omega$，如果 sharpness 例的 $W(A)$ 恰好是圆盘，那么取 $\Omega$ 略大于单位圆盘时，$F(z)=z$ 在 $\partial\Omega$ 上的 sup 略大于 1，界 $\|A\|\le2\sup_{\partial\Omega}|z|$ 会**接近但达不到**等号。也就是说本文的证明路径（先严格包含再取极限）**在 sharpness 例上只能渐近取等**，永远不是某一步的等号。这与 `lem:approx` 的 $t_\delta$ 那个严格不等号呼应：整个证明的松紧是靠极限缝合的，不是靠某步锐利。

$[分析]$ 素材记的一条不对称我认为比上面那段更有价值：**最优性只用 $m=1$（标量系数）**。一旦 $n,m$ 都自由，标量下界立刻给出完整下界（对更大的 $m$ 取 $m\times m$ 纯量矩阵值多项式即可，素材 2.7(c) 最后一行）。这与"完整性的难点在 $m$"形成不对称：**上界难在 $m$，下界只需 $m=1$。** 我把它记进第 16 节的常数台账，因为它说明 2 这个常数没有任何 $m$ 侧的改进空间：$m=1$ 已经锁死。

### 12.4 各步骤的机械理由

| 对象 | 位置 | 崩点 |
| --- | --- | --- |
| $W(A)$ 紧（球面紧） | `main.tex:514` | 不紧 ⇒ `lem:approx` 的 $s_K$ 与 $\max$ 无定义，$\operatorname{diam}K$ 也无定义 |
| $W(A)$ 凸（Toeplitz-Hausdorff） | `main.tex:514-518` | 非凸 ⇒ `lem:approx` 不能用（投影不等式失效），$\Omega_j$ 无法凸 ⇒ `lem:faber` 的 $K\ge0$ 失效（$K\ge0$ 的唯一来源是 `eq:support`，见第 6.2 步） |
| $\dim\le2$ 的压缩 | `main.tex:515-518` | 若压缩到 $d>2$ 维：仿射映射 $\mathbb R^{2d^2-1}\to\mathbb R^2$ 的"球面像 = 球体像"不再显然（需要每个球内点都能沿核方向推到球面，而球面是 $2d^2-2$ 维的，核只有 2 维余像），这正是为什么证明必须先压到 $\le2$ 维 |
| $\overline\Omega_j$ 在公共紧集内 | `main.tex:523` | 无公共紧集 ⇒ 一致连续模 $\omega$ 无法统一，$\max_{\overline\Omega_j}\to\max_K$ 可能不成立。依据是 `lem:approx` 第 482 行的固定矩形（第二次用途） |
| $M_j>0$ 的分情形 | `main.tex:524` | $P\equiv0$ 而强行除 $0$ 无意义；分情形的代价是要用到 $\Omega_j$ **开**（有线段 $K$ 无内点） |
| 最优性用 $m=1$ | `main.tex:526` | 若只证 $n$ 固定时的下界，`uniformly over $n,m$, and $d$` 就缺 $m$ 侧支撑；$m=1$ 的下界对更大 $m$（纯量矩阵值）自动成立 ⇒ 一个论证覆盖全部 |

### 12.5 候选失败路线

$[推测]$ 其一，用现成的 Toeplitz-Hausdorff 证明（特征多项式判据 / 椭圆描述）。标准证明给出"$2\times2$ 数值范围是椭圆盘、焦点在特征值"，信息更多但铺垫也更多（要证椭圆性需要特征多项式的判别式与旋转）。本文只需要凸性，于是选"仿射映射 + 球/球体像相同"这条最短路径。$[推测]$ 可能的另一层原因：这段要出现在一篇会被形式化的论文里，Lean 侧对应 `Geometry.convex_quadratic_range`（`CompleteBound.lean:61-63` 引用），是一个独立模块；论文的重证相当于给出该模块的可对照陈述。这条我只能在第 17 节用 Lean 的模块划分来部分验证。

$[推测]$ 其二，紧性 + Arzelà-Ascoli 直接从解析域取极限（让 $\Omega_j$ 的边界收敛到 $W(A)$ 并取 $h_j$ 的子列）。那需要共形映射的 Carathéodory 核收敛，把边界几何收敛性当前提，比"一致连续 + 距离收敛"重得多。论文只让 $\Omega_j$ 存在、只在**最大值**这一层取极限，完全不让 $h_j$ 参与极限过程：$h_j$ 在每一步内部被用完就丢。**极限只作用在数值上，不作用在几何对象上。** 我认为这是"直接"的第三个体现，和第 3 节的三层列表能对上（那一节的第三层我写的是"不做归纳"，这里是"不做几何极限"，两者都是"避开一般定理"）。

$[推测]$ 其三，在退化情形（点 / 线段）单独证明。线段 $K$ 时可选 $\Omega$ 为细长椭圆、$h$ 显式（Joukowski 型），本可给更精的论证。但那样要处理"$W(A)$ 落在线段上"时 $A$ 的结构（这与 $A$ 的正规性等价类结果纠缠），复杂度高于统一的外逼近。`main.tex:524` 那句 `without any interior assumption on $K$` 的语气说明作者明确把"不分支处理退化情形"当作卖点。$[推测]$ 我读到这里时想检查的是：若 $W(A)$ 是单点，$A$ 是纯量矩阵加幂零部分（$W(A)=\{\lambda\}$ 当且仅当 $A=\lambda I$？实际 $A$ 可对角化到 $\lambda$ 且数值范围退化为一点 ⇒ $A=\lambda I$），这时结论平凡。作者没有讨论这个平凡分支，我认为这是"直接"的第四个体现：**不检查退化情形的结构，只让外逼近吞掉它。**

## 13 引言里那段"元证明"（`main.tex:130-161`）与正文的逐句对应

`\subsection*{How the coefficients give the sharp bound}` 这 32 行是全文的**路线图**。我把它当成"作者写给审稿人的证明 skeleton"来读，因为它的句子顺序与正文的证明顺序**完全一致**（除了附录被推到最后）。下表逐句对照，左栏是引言原句（节选），右栏是正文兑现处，第三栏是我读时才成立的核对。

| 引言原句 | 正文位置 | 我的核对 |
| --- | --- | --- |
| `First place $W(A)$ strictly inside an analytic convex domain $\Omega$.`（131） | `lem:approx`（§4）+ `thm:domain` 假设 | "strictly" 对应 `lem:approx` 的 $K\subset\Omega_j$ 严格包含（补步 2 的 $<1$），我在 11.3 表里标过它是"全文外逼近方向性的根" |
| `An exterior conformal map $h$ parametrizes its boundary by the unit circle.`（132） | `lem:exterior-collar`（附录）+ `main.tex:169` | 附录那句 `The map $h$ sends $\T$ onto $\partial\Omega$` |
| `Expanding the Cauchy kernel at infinity defines scalar polynomials $b_k$ of degree $k$.`（133-134） | `eq:faber`（`main.tex:184-186`），`lem:faber` 第 1 步 | 引言称 $\frac{q}{h-z}$ 为 "Cauchy kernel"，正文里从未再用这个词，只写公式 |
| `For $k\ge1$, the boundary value $b_k\circ h$ has the positive Fourier term $\lambda^k$ and an otherwise strictly negative expansion.`（134-135） | `eq:boundary-basis`（`main.tex:188-190`） | "strictly" 对应"无零频"：$b_k(h(\mu))=\mu^k+\sum_{j\ge1}s_{kj}\mu^{-j}$，$\mu^0$ 项系数为 0。我在 6.2 步用 $s=-\lambda\partial_\lambda H/H$ 在两条互反轴上为零证过这件事 |
| `a nonnegative kernel with integral one in each variable makes the map from the positive part to the negative part an $L^2$ contraction`（136-138） | $K=1+s+\bar s$ 的三条性质（`lem:faber` 第 (6)(7) 条）⇒ `prop:coefficients` 前两步 | "integral one in each variable" = 两个角向边际恒等式（`main.tex:233`），"contraction" = $\|Tf\|_2\le\|f\|_2$ |
| `its squared boundary Hilbert--Schmidt norm lies between the square sum of its coefficient norms and that sum with weight two on every nonconstant coefficient`（138-140） | `eq:coefficient-estimate`（`main.tex:249-251`） | 引言在这里就说出了权 2 只加在非常数系数上，这是正文 `eq:weighted-dual` 里 $\tfrac12$ 的来源 |
| `For a polynomial $F$ normalized by its boundary operator norm, choose a unit top singular pair $x,y$ for $F[A]$.`（142-143） | `thm:domain` 第 0 步（`main.tex:324`、`:329`） | "boundary operator norm" = $\sup_{\partial\Omega}\|F(z)\|\le1$；"top singular pair" 用词与 9.2 补步 2 一致 |
| `The resolvent $R(\lambda)=\lambda h'(\lambda)(h(\lambda)I-A)^{-1}$ supplies the coefficient arrays representing the three functionals $y^*G[A]x$, $x^*G[A]x$, and $y^*G[A]y$.`（143-146） | `lem:resolvent` + `eq:pairing` | **三个泛函数**按顺序对应 $M,P,Q$。引言在这里直接写了 $q(\lambda)=\lambda h'(\lambda)$ 的展开式而不用记号 $q$，正文 `main.tex:169` 才命名 $q$。$[分析]$ 这个差异说明引言是先写的还是后写的无从判断，但引言选"写开"而正文选"命名"，是面向读者的一次简化 |
| `The first is bounded by a coefficient Hilbert norm.`（146-147） | `eq:crossfunctional`（`main.tex:352-354`） | "a coefficient Hilbert norm" 就是 $a=(\sum\HS{M_k}^2)^{1/2}$ |
| `Testing it on $FG$ and $GF$ separately gives bounds for the other two.`（147-148） | `eq:ordered-products` + 两条链（`main.tex:357-384`） | 与 `main.tex:71-72` 的 `using the two products $FG$ and $GF$ separately` 呼应，引言里这条策略被说了**两次** |
| `Their squared dual coefficient norms have reciprocal weights: one on the constant coefficient and one half on the others.`（148-149） | `eq:weighted-dual`（`main.tex:394-398`） | "reciprocal" 是相对权 2 而言，我在 10.4 补步 24 把它和 Parseval 的 4 连成一条线 |
| `These are exactly the weights in the squared Fourier norms of the corresponding Hermitian diagonal compressions, after a common factor of four.`（150-151） | `eq:diagonal-L2`（`main.tex:418-423`） | "Hermitian diagonal compressions" = $P+P^*$、$Q+Q^*$；"common factor of four" 一词与正文 `four times the reciprocal weighted sum` 严格对应 |
| `Section~\ref{sec:matrix} completes the comparison. The numerical-range condition makes $R+R^*$ positive, so its compression to a two-by-two block bounds the off-diagonal boundary norm by the two diagonal norms.`（153-155） | `lem:resolvent` 正性 + 第 6 步 $\Delta$（`main.tex:434-445`） | 引言把"数值范围条件 ⇒ $R+R^*$ 正"说成整篇论文里最靠近"凸性只在这里被使用"的表述，但正文用的是 `eq:support`，见 6.2 步末我的清点 |
| `The cross term retains all coefficients of the first functional, including its constant coefficient.`（156-157） | `eq:cross-L2`（`main.tex:428-432`），$a^2$ 含 $M_0$ | 我在 9.4 与 11.3 两处引用这句，用途是防止把 $a^2$ 的下标改成 $k\ge1$ |
| `The resulting inequality gives the sharp bound two.`（157-158） | $2a^2\le8a^2/\gamma^2$（`main.tex:447-451`） | 引言用 "sharp" 一词时 sharpness 还没证，它在 12.3 |
| `Section~\ref{sec:limit} then shrinks analytic convex neighborhoods to an arbitrary numerical range and proves sharpness with a two-by-two nilpotent matrix.`（158-160） | `lem:approx` + `thm:main` 证明（§4，`main.tex:454-531`） | "shrinks" 与 `main.tex:455` 的 `and then shrink them to $W(A)$` 同词 |
| `Appendix~\ref{sec:collar} supplies the exterior collar using classical conformal mapping and reflection theorems.`（160-161） | 附录（`main.tex:532-621`） | "classical" 与附录开头 `main.tex:534` 的 `classical conformal inputs` 同词，两处都把常规部分归给经典 |

$[分析]$ 这张表给我的一条元信息：引言 32 行覆盖了正文 128 行证明的**每一个**关键量（$b_k$、$s_{kj}$、$K$、$a$、$\tfrac12$、$4$、$\Delta$、$M_0$），没有一处引言说了正文没做的，也没有一处正文做了而引言漏了（除了 `eq:ordered-products` 的**顺序**细节，引言只说 "keeps their multiplication order"）。$[推测]$ 我认为这提示路线图与正文是同一轮定稿的产物，并非先写导言再补证明；更直白地说，作者是在证明完成后回头压缩出这 32 行的。这属于写作顺序推测，无法从文本证实，我标清楚。

引言第 111-112 行的方法自述（我已在 10.1 引用原文）与 9.7 的失败路线清点对照：`Here a Faber coefficient estimate controls the two diagonal functionals obtained by placing a test polynomial on each side of the polynomial being estimated.` 这句把"两条有序测试"（`eq:ordered-products`）、"系数估计"（`prop:coefficients`）、"两侧各放测试多项式"三件事压进一行，是全论文对"为什么需要两个乘积"最直白的一句话，也是我在 10.6 那个 $\sqrt2$ 反事实检验的文本依据。

## 14 我引用的每一句史文与它的动词

素材第 3.5 节给了总原则，我照抄进笔记，因为它决定我这一节能写什么、不能写什么：

> **总原则**：本节只收录 `main.tex` 与 `references.tex` 里**确实写了**的句子，逐字引用并注行号。论文没写的一律标"论文未述"，不补任何外部叙事。

### 14.1 动机叙述（`main.tex:42-46`）

```tex
It is a compact convex set containing the spectrum. For a normal matrix,
the spectral theorem controls polynomial evaluation by values on the
spectrum. For a nonnormal matrix, the spectrum alone cannot provide the
same control: even a nonzero nilpotent matrix has spectrum $\{0\}$.
The numerical range retains enough information to give a universal bound.
```

动词清点：`controls`（正规情形，谱定理**控制**）、`cannot provide`（非正规，谱**给不出**）、`retains enough information`（数值范围**保留足够信息**）。整段是**信息论式**的：唯一解释"为什么要证这个定理"的段落，通篇在比较"哪个集合携带足够的信息"。

论文未述的部分我要老实记下来：没有"这是二十年的公开猜想"、没有 GMRES 或伪谱的应用动机段、没有数值实验。导言正文一共 15 行（`main.tex:38-56`）加三段"Earlier bounds / How the coefficients / "，`main.tex:20-22` 附近没有任何应用性铺垫。$[推测]$ 我认为这种"零应用动机"的写法与 12.1 那段"重证 Toeplitz-Hausdorff 只要凸性"是同一取向：**凡是不能变成证明步骤的背景一律不写。**

### 14.2 问题的精确提法与一处措辞张力（`main.tex:55-56` 对 `main.tex:34-35`）

```tex
The complete Crouzeix conjecture asks whether the constant two holds
uniformly in the coefficient dimension $m$, the base dimension, and the degree.
```

对照摘要（`main.tex:34-35`）：

```tex
This resolves the complete Crouzeix conjecture in its matrix formulation,
including matrices whose numerical ranges are points or line segments.
```

`asks whether`（导言，问句）对 `resolves`（摘要，已解决）。素材记这是"一处措辞张力"，并推测是初稿到定稿的升格痕迹。$[推测]$ 我的读法稍有不同：导言那句是在**定义 conjecture 的内容**（猜想本身就是一句问句，"asks whether" 是在陈述猜想的语法形式，不是在陈述本文的贡献），所以两处未必冲突。但我承认这解释不了为什么导言不补一句"本文给出肯定回答"：实际上它**补了**，就在 `main.tex:68-70` 的第一句 `The estimate includes point and segment numerical ranges. Its complete character is the uniformity in $m$: a scalar proof need not survive matrix amplification, because coefficient matrices need not commute.`。所以我的结论是：张力存在但很小，属于"导言用猜想的原始语气、摘要用结果的完成语气"的常规分工。我把两种读法都留下，不做裁决。

### 14.3 史段落全文（`main.tex:74-112`，标题 `Earlier bounds and related arguments`）

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

四个动词条逐条批注：

1. `formulated … in 2004 and proved a universal complete bound of $11.08$ in 2007`：年份与数字都写死，是全文唯一给出的**历史常数**。$[分析]$ 作者为什么不写 11.08 的证明思路？因为它已经被后面的 $1+\sqrt2$ 完全覆盖，而本文真正要对话的是"方法"，并非"数字序列"。
2. `supply an important part of the numerical-range method`：**"供应重要部件"**，措辞不是 "provide a theorem" 也不是 "imply"。这与 `main.tex:291-293` 的用法一致（第 8 节我引过 §3 开场那句）：本文只借 Delyon-Delyon 的**核**，不借表示定理。$[推测]$ 这是我在整段史文里认为最有信息量的一处：作者用"part"，并非"precedent"，是在明示"我们的证明里有一块是你们那块的变形"。
3. `combined a positive double-layer potential with the Cauchy transform of conjugate boundary data`：这是作者对 Crouzeix-Palencia 的**机制描述**，`combine` 点出该路线的两个部件。本文只保留第一个部件（正双层位 $\to R+R^*\succeq0$），**丢掉第二个**（Cauchy 变换 + 共轭边界数据）。$[分析]$ 我把全文搜过一遍确认：正文出现的 Cauchy 相关只有两处，`main.tex:133` 引言里 "Expanding the Cauchy kernel at infinity"（这是**点态展开定义 $b_k$**）与 `main.tex:311` 附近的 Cauchy 积分公式（用于 $R$ 的系数提取）；**没有任何一处是"Cauchy 变换的算子范数估计"**。这就是"直接"的最小说法证据：把 $1+\sqrt2$ 路线里产生 $1+\sqrt2$ 的那个部件整个卸掉。
4. `simplified its final norm argument`：Ransford-Schwenninger 只改最后一步，量级不变。$[推测]$ 作者把它单列，我读到的功能是给"最后一步的范数论证"命名的习惯：本文的"最后一步"是 10.5 的块比较，与 Crouzeix-Palencia 的"final norm argument"处在同一个结构岗位。这是我自己找的对应，论文没说。
5. `they make the conformal image of the matrix a contraction by a similarity with condition number at most two, using the numerical-range ellipse`：Badea-Crouzeix-Delyon 的机制被概括为"相似变换 + 条件数 $\le2$ + 数值范围椭圆"三个名词。作者写这句时**明知**本文不走这条路（本文从不构造 $S$），所以这段的功能是**标出岔路口**。我在 10.9 失败路线其一里算过相似路线的两处硬伤，与此呼应。

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

**这是全文最重要的一段障碍陈述**：`their Section~3(iv) explains why the commutation used in that proof does not automatically persist under amplification`。作者明确承认标量证明里有一处**交换步骤**在矩阵放大下不自动保持，并把别人的**讨论小节**（不是定理）作为本文必须绕过的机制障碍引出来。$[分析]$ 引用精度是这段的关键信号：`Theorem~3`、`Section~3(iv)` 都指定到小节号。这种引法只有两种可能：作者读了那篇论文的这一段，或者作者读了那篇论文并且记得小节号；两者都意味着**这段是本文的问题来源**，不是装饰性引用。

第三句 `The scalar results fix $m=1$, while the latter complete result restricts the base dimension; Theorem~\ref{thm:main} leaves these dimensions independent.` 是本文与前人结果的**唯一**正面对比句，动词是 `fix` / `restrict` / `leaves ... independent`。第 0 节的已知结果普查我用的就是这句的三分法。

然后是技术工具的认领与差异（`main.tex:102-112`）：

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

$[分析]$ 这一段的形状是**选型表**：作者列出三种"从 $F[A]$ 提取 $\gamma$"的办法（attainer / explicit top singular pair / scalar extremal function + attainer after similarity reduction），然后用 `Here …` 说自己用第四种（两侧各放测试多项式的 Faber 系数估计）。三处引用的精度分别是 `Lemma 1`、`Section 3, equations (21)--(22)`、`Section 3, proof of Theorem 2`，说明作者**读过对手证明里选向量的那一行**。结合 9.7 失败路线其一（单 attainer 在非正规 $F[A]$ 上给不出 $\gamma$，$2\times2$ 幂零上 $|x^*Fx|\le1$），我的判断是：作者把这段写进导言，是因为他知道"选谁"是有后果的技术选择。这里 Luo 的 `explicit top singular pair` 与本文的 `unit top singular pair`（`main.tex:143`）是同一个对象，本文与标量证明在"选向量"这一步**其实相同**，分岔发生在选了之后：Luo 只需一个 $x$ 的泛函数，本文需要 $x,y$ 两侧的 $P,Q,M$。$[推测]$ 这条对比我认为素材没有明说，是我自己按两处措辞拼的。

关于 Grunsky 的认领与摆脱（`main.tex:236-243`）：

```tex
These mixed coefficients are differentiated Grunsky coefficients.
The classical normalization gives a weighted coefficient inequality
\cite[equations~(1.1)--(1.3)]{BeckermannStylianopoulos2018};
the unweighted estimate used here follows from convexity and the two
angular marginal identities.
```

`the unweighted estimate used here follows from convexity and the two angular marginal identities`：全文明确说自己的核心估计只依赖"凸性 + 两个角向边际恒等式"，这是一句**自我设限式**的技术声明：不使用任何更深的系数定理（素材 2.2(d) 第一条失败路线正是"直接用 Grunsky 加权不等式"，我在第 6.4 节把它写成了带机制的版本）。

第 236 行的另一处克制：

```tex
The usual normalization chooses the phase of $h$ so that $c>0$ \cite{Beckermann2005,BeckermannCrouzeix2014}.
```

作者指出经典做法会归一化 $h$ 的相位，然后**没有采用**：正文 `eq:h`（`main.tex:164-166`）只要求 $c\ne0$。$[分析]$ 我认为这是全文最容易被读者当成疏漏的一处，实际上它是"故意不做归一化"的证据；我在 6.3 的常数表里已经记过 $c$ 只以 $c^{-k}$（$b_k$ 的首项系数）与 $b_k(A)$ 的定义进入，任何 $|c|=1$ 的相位选择都可通过 $h\mapsto e^{i\theta}h$ 吸收，做了归一化反而要多写一个等号。

### 14.4 参考文献表的规模与倾向（`references.tex` 全文 105 行）

素材记"共 17 条"，我实测 `grep -c '^\bibitem{'` = **18** 条。素材的 7/4/6 分桶本身没错（经典 7 + 2014 到 2018 四 + 2025 到 2026 六 = 17），但漏数了 `Beckermann2005`：它既不属于"经典（1918 到 2007）"那组被列出的七条（那组列的是 Toeplitz 1918、Hausdorff 1919、Ahlfors 1979、Delyon-Delyon 1999、Crouzeix 2004、Crouzeix 2007、Badea-Crouzeix-Delyon 2006），也不在后两组，实际应归入经典组（2005 年）。订正后的分布：**8 / 4 / 6 = 18**。我在文件开头的素材说明段里已经把这条差异写进去了。

分桶（按论文引文年份，我逐条核对 `references.tex`）：
- 经典：Toeplitz 1918（`Math. Z. 2, 187-197`）、Hausdorff 1919（`Math. Z. 3, 314-316`）、Ahlfors 1979（教材，第三版，McGraw-Hill）、Beckermann 2005（`C. R. Math. 340, 855-860`，标题含 GMRES）、Delyon-Delyon 1999（`Bull. Soc. Math. France 127, 25-41`）、Crouzeix 2004（`IEOT 48, 461-477`）、Crouzeix 2007（`JFA 244, 668-690`）、Badea-Crouzeix-Delyon 2006（`Math. Z. 252, 345-365`）：8 条。
- 2014 到 2018：Beckermann-Crouzeix 2014（`Jaen J. Approx. 6, 219-231`，附 `arXiv:1310.1356v1`）、Crouzeix-Palencia 2017（`SIMAX 38, 649-655`）、Beckermann-Stylianopoulos 2018（`Constr. Approx. 47, 211-235`）、Ransford-Schwenninger 2018（`SIMAX 39, 342-345`）：4 条。
- 2025 到 2026：Crouzeix-Greenbaum 2025、Åhag-Czyż-Virtanen 2026、Jin 2026、Lorist-Schwenninger 2026、Luo 2026、OpenAI2026Complete：6 条。

三处可核实的细节（素材记的，我逐条验证过）：
1. `Beckermann2005` 与 `BeckermannCrouzeix2014` 各只被引用一次（我 grep 过 `main.tex`：两者同现于 `main.tex:102-103` 与 `main.tex:236`，**共两处、每处都是并列引用**，用途都是"Faber 多项式进入数值范围演算的先例"与"经典相位归一化"），**没有借用其任何定理**。$[分析]$ 素材说"各只被引用一次"与我的核对略有出入（`main.tex:236` 那处也同时引了两者），所以准确说法是"两条各出现两次，且两次都是并列的先例式引用"。这条我按实测写。
2. 全部 2026 年文献都带 arXiv / Preprints 版本号与**具体日期**：`arXiv:2608.27346v4, September 21, 2026`（Åhag-Czyż-Virtanen）、`arXiv:2608.03841v2, August 17, 2026`（Lorist-Schwenninger）、`Preprints.org 202607.1919, version 4, August 7, 2026`（Jin）、`Preprints.org 202608.1661, version 2, August 28, 2026`（Luo）。本文自己的日期是 September 26, 2026（`main.tex:28`）。$[推测]$ 追踪到"版本 4"这种粒度说明同期工作的监控是持续的，并非投稿前一次性补引。
3. **没有**任何关于 $C$-spectral set、GMRES、伪谱的一般综述被引。`Beckermann2005` 的标题里有 GMRES，但引用点（先例）与其内容无关。这与 14.1 的"无应用动机"一致。
4. 我补一条素材没列的：`OpenAI2026Complete` 的著录是 `OpenAI Math Release preprint` + 一个 **GitHub 直链**（`github.com/openai/math/blob/main/preprints/The-complete-Crouzeix-theorem-September-23-2026/paper.pdf`），且标题里有 `optimal similarity and a common positive boundary representation`。$[分析]$ 这条著录方式（仓库内相对路径，并非 arXiv 号）与 2、3 两处的正式预印本号并存，说明两篇是同一发布计划的产物；这与我在第 3 节把 companion 论文列为"结构同族"的判断一致。

### 14.5 与同族论文的关系（`main.tex:114-128`）

第 3 节我已逐字引用整段并做过 8 行对照表，这里只补素材 3.4 记的两处机制细节原文（`main.tex:279-285`，`prop:coefficients` 之后的"companion notation"段）：

```tex
For comparison with \cite[Proposition~3.1]{OpenAI2026Complete}, the
companion's exterior map $G$ and variables $t,w$ correspond to
$h,\lambda,\mu$, respectively.
The mixed correction is $s(\lambda,\mu)=B(\mu,\lambda)$, so
$s_{kj}=\beta_{jk}$ in that paper's notation. In particular,
\eqref{eq:kernel-fourier-action} uses this coefficient orientation and
does not require symmetry of the kernel.
```

`companion`（同伴论文）这个词本身是叙事证据：两篇是同一计划的两个产物。$[推测]$ 而本文专门写了一段**记号对照表**（把 $G,t,w\mapsto h,\lambda,\mu$、$s(\lambda,\mu)=B(\mu,\lambda)$、$s_{kj}=\beta_{jk}$ 逐条对齐），我读到这里的第一反应是"只有真出过记号冲突的人才写这么一段"。特别注意最后一句 `does not require symmetry of the kernel`：我在 6.2 步末确认过 $K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}$ 的 $s$ 侧指标不对称（$s_{kj}$ 与 $s_{jk}$ 不同），这段是把该风险**在正文里就地排除**。素材 2.5(b) 里关于 $L_k,M_k$ 无共轭关系的那次自我更正，与这里的"不需要核对称"是同一类"非对称性防御"，我认为这两处放在一起看，能看出作者对"共轭/转置方向"这件事格外警觉。

## 15 论文的沉默：未述清单与源文件痕迹

### 15.1 "we do not know" 类句式的穷尽清点

素材做过一次全文搜索，我把它的结论连同我的复核一起写：`main.tex` 里

- **没有** `we do not know`、`we do not see`、`it is unclear`、`we leave`、`open problem`、`no elementary` 这类**自陈不知道**的句子。
- 唯一表示"未做/未采用"的句子是两处：`main.tex:236` 的 `The usual normalization chooses the phase of $h$ so that $c>0$`（说明自己没这么做）与 `main.tex:114-115` 的 `A separate structural proof of the complete inequality is given in \cite{OpenAI2026Complete}`（承认存在另一条路）。
- 唯一带"必要性/困难"色彩的是两处：`main.tex:94-96` 的 `explains why the commutation used in that proof does not automatically persist under amplification` 与 `main.tex:69-70` 的 `a scalar proof need not survive matrix amplification`。

$[分析]$ 我在自己的笔记里必须遵守的一条纪律由此产生：**这篇论文通篇不使用"承认无知"的修辞。** 所有不确定性都被转写成"我们选择 X"式的技术陈述。这与 D 类笔记里常见的"作者坦承障碍"文体截然不同，所以我不能替论文编造一句 `we do not know`，也不能把我自己的疑问写成论文的语气。

第 167 行有一处**把负担推给附录**的措辞：

```tex
Appendix~\ref{sec:collar} supplies such a coordinate for every domain under consideration. Here we use it to compare polynomial coefficients with boundary norms.
```

`Here we use it to compare polynomial coefficients with boundary norms.`：在本节开头限定本节目的，典型的分工声明。$[推测]$ 我认为这一句同时也在防一个误读：读者可能以为 §2 要在这里重建共形映射的存在性，作者提前一句切断。

第 534 行附录开头：

```tex
We record the classical conformal inputs and prove the continuation and global injectivity required in Section~\ref{sec:coefficients}.
```

`classical … inputs` 与 `prove the continuation and global injectivity` 并列：作者承认 Riemann / Carathéodory / Schwarz 是经典的，但**延拓与整体单叶要自己证**。$[分析]$ 这三件事正是附录里最长的三段（我在第 5.2 节按步骤 3、4、5 重构过：反射、"第三半径"拼接、紧性推整体单叶）。也就是说附录的 86 行里有大约一半在做 `lem:exterior-collar` 陈述里 `one-to-one on $|\lambda|>r$ including infinity` 这一句的兑现。

### 15.2 LaTeX 源文件本身的叙事痕迹

素材 3.7 列了六条，我逐条核对过行号并补一条自己的。

- `main.tex:25` `\pdftrailerid{}`：清空 PDF trailer ID，用于可复现构建（byte-identical builds）。工程实践痕迹，与数学无关但说明构建流程被脚本化。
- `main.tex:18-21` 四个定理环境声明 + `main.tex:22` `\numberwithin{equation}{section}`：`theorem/lemma/proposition` 共用计数器（`\newtheorem{lemma}[theorem]{Lemma}`），而 `remark` 也按同样方式声明了：
  ```tex
  \theoremstyle{remark}\newtheorem{remark}[theorem]{Remark}
  ```
  我 grep 过 `main.tex`，**全文没有一处 `\begin{remark}`**，共 0 次。$[推测]$ 声明了未用，说明写作过程中删掉了 remark 环境里的内容。这一条我在第 2 节的"环境晋升"证据里已经用过（`lem:faber` 与 `lem:resolvent` 用 theorem 环境、`prop:coefficients` 用 proposition、`thm:domain` 用 theorem，而唯一被废弃的环境是 remark），两者合起来我对这份源文件的写作史有一个可用画像：**先有一版带评注的稿子，评注被删，剩余的评注性内容被改写成正文里的分工声明（见 15.1 的 `main.tex:167`）**。这个画像无法证实，标 `[推测]`。
- `main.tex:23` `\setlength{\emergencystretch}{2em}`：排版最后微调（允许额外行末溢出以消 overfull hbox）的痕迹。
- `main.tex:7` `\usepackage{microtype,booktabs,tikz}` 与 `main.tex:8` `\usetikzlibrary{arrows.meta}`：只为一张图（`figures/normal.tex`，21 行）。全文**唯一插图**就是那张支撑线示意图，caption 是解释性的（`figures/normal.tex:19`）：
  ```tex
  \caption{The map $h$ sends the exterior of the circle to the exterior of the domain; the supporting line is shown schematically. Increasing the circle radius gives the outward normal $q(\lambda)$; convexity places every $z\in\overline\Omega$ on the inner side of the line.}
  ```
  caption 里 `shown schematically` 与图里 `\draw[dashed] (6.45,-1.3) -- (6.45,1.3);` 的虚线支撑线对应：作者特意声明这是示意图。
  $[分析]$ 全文一张图，且服务于 `eq:support` 这个"凸性唯一一次被使用"的位置（我在 6.2 步末清点过），图的分配也体现了证明的重心：**作者愿意为"支撑线"画一张图，不愿为 Faber 系数或块比较画任何图。**
  图本身的几何我逐坐标读了：`\draw[thick] (0,0) circle (1.05);` 画 $\D$（半径 1.05，节点 $\D$ 在圆心），`\fill (1.05,0)` 标 $\lambda$ 在圆周的 $(1.05,0)$；`\draw[->] (1.05,0) -- (1.8,0);` 是从 $\lambda$ 向外的短箭头（示意 $\lambda$ 增大方向，对应 caption 的 "Increasing the circle radius"）；中间 `to[bend left=15] node[above] {$h$}` 是映射箭头；右侧 `\draw[thick] (5.35,0) ellipse (1.1 and .85);` 画 $\Omega$（椭圆，长半轴 1.1 水平、短半轴 .85 竖直，中心 $(5.35,0)$，右端点 $(6.45,0)$）；`\fill (6.45,0)` 标 $h(\lambda)$ 在椭圆右端点；`\draw[->,thick] (6.45,0) -- (7.6,0) node[right] {$q(\lambda)$};` 法向箭头水平向右；`\draw[dashed] (6.45,-1.3) -- (6.45,1.3);` 是过 $h(\lambda)$ 的竖直虚线支撑线；`\fill (4.95,.35)` 标 $z$ 在椭圆内部偏左上。
  所以图中**法向朝右、$z$ 在左**，$\overline{q(\lambda)}(h(\lambda)-z)$ 的实部正是 $(1,0)\cdot(6.45-4.95,\,0-0.35)=1.5>0$ ✓，与 `eq:support`（`main.tex:170-173`）$\Re(\overline{q(\lambda)}(h(\lambda)-z))\ge0$ 的符号方向一致。$[分析]$ 我在第 5.2 节记过"符号方向陷阱"（`DomainBound.lean:77-78` 那条 Lean 侧反向不等式），这里图与不等式同号，说明作者的图不是随手画的：它是在**替读者定符号**。`main.tex:174` 的引用句：`Figure~\ref{fig:normal} illustrates this supporting-line relation.`
- `\input{figures/normal.tex}` 在 `main.tex:176`（正文中部，紧跟 `eq:support` 与 `Figure~\ref` 句），`\input{references.tex}` 在 `main.tex:622`（`\appendix` 之后、`\end{document}` 之前）。$[推测]$ 参考文献被拆成独立文件，与语料库的统一构建方式一致。
- 我补一条：`main.tex:15` `\DeclareMathOperator{\Rea}{Re}` 声明了一个 `\Rea`，但正文里所有实部都写 `\Re`（LaTeX 内建），素材 3.7 没有记这条。$[推测]$ 这几乎肯定是作者预置后被内建命令取代的残留，与 `remark` 的"声明未用"是同一种废弃痕迹。它对我的用处只有一条：这份源文件经历过若干次局部改名，行号级的引用（比如我全文用的 `main.tex:NN`）因此只能对准**当前**版本。我在写第 5.4 节时用它核对过 `q` 的双重定义（`main.tex:169` 与 `main.tex:548`），那里的行号仍然可用。
- `main.tex` 13 行的 `\newcommand{\HS}[1]{\lvert #1\rvert_2` 值得一提：论文把 HS 范数写成 $\lvert\cdot\rvert_2$ ，并非 $\lVert\cdot\rVert_{\mathrm{HS}}$。$[分析]$ 配合 `main.tex:180` 那句 `We use the unnormalized Hilbert--Schmidt norm $\HS C=(\tr(C^*C))^{1/2}$, which makes each finite-dimensional matrix space a Hilbert space.`，这是我在 9.3 补步 4（$\|x\|=1\iff\HS X=1$）能成立的全部依据，也是素材第 5.3 节把它列入记号冲突表的原因（$\lvert\cdot\rvert_2$ 与算子范数 $\lvert\cdot\rvert$ 只差一个下标）。

### 15.3 论文的"未述"清单（我写作时必须避免编造的部分）

素材列了七条，我全部保留，并在我已在正文里给过推测的地方加交叉指向，避免读者误以为论文说过：

1. Crouzeix 猜想的原始陈述（$m=1$ 情形的公开问题形式）与其历史年份之外的细节。第 14.3 节只给了 `formulated … in 2004`。
2. 为什么 2 是"自然"常数。全文只有 `main.tex:526-530` 的 $2\times2$ 幂零例子（第 12.3 节）。我在 10.6 给的"必然性链条"是我的重构，`[推测]`。
3. `prop:coefficients` 的权重 2 是否可以改进。论文未述。我在 7.4 第四条与 16.2 给的反证式论证是我的。
4. $b_k(A)$ 的几何衰减界对 $A$ 的一致性问题。只在 `main.tex:304` 以 `for the fixed $A,h$` 回避，未讨论为何不能一致。第 8.1、8.4 节。
5. 单 attainer 为何不够。只在 `main.tex:104-106` 并列别人的做法，未点出机制。第 9.2 补步 2 与 9.7 其一。
6. 若 $A$ 在 Hilbert 空间（无限维）中是否成立。**这条我要按素材的措辞完整保留**：论文标题与定理都是 matrix（$M_n$），摘要 `main.tex:33` 写 `in all finite base and coefficient dimensions`，明确限定**有限**；而 `main.tex:93-94` 描述 `Lorist and Schwenninger's Theorem~3 applies to scalar rational functions of bounded Hilbert-space operators`，即**别人的标量定理覆盖面比本文宽（无限维底空间）**，本文只做有限维。素材特意标注：这是一个论文未展开但客观存在的取舍，必须在笔记里如实标注，不能粉饰成"本文更强"。我在第 0 节的"有限与无限的诚实记账"里已经写过一次，这里再记一次，因为它是我见到的最容易被忽略的一条。
7. 数值范围等于线段或点时的直接证明。全部通过外逼近绕开，`main.tex:524` 以 `without any interior assumption on $K$` 一句带过。第 12.5 其三。

$[分析]$ 这七条合起来给我的写作约束是：凡是"论文没说的原因"，我只能用 `这里我的读法是`、`我推测`、`论文未述` 三种语气之一，并且要让读者一眼看出这三者与定理内容无关。我在第 0 节末尾写的"我自己进场时想的那条路（Delyon-Delyon 表示定理的循环性）"就属于第四类，即我作为读者的记录，论文的技术内容与我的推测都套不上它，所以我把它单独放在第 0 节而不在正文技术段落里混用。

## 16 常数与参数台账

素材第五节给了用法说明，我照抄，因为它决定这张表的读法：

> **用法说明**：本表把论文里出现的**每一个具体数值或受命名约束的参数**列成"值 → 位置 → 作用 → 敏感度"。位置一栏给 `main.tex` 行号与 Lean 侧对应（文件:行）。敏感度一栏回答"放宽或改掉它会在哪一步崩"，凡是从结构反推，并非论文与代码明说的，标 `[推测]`。

我在素材版基础上加了一栏"我的判定"，用来标记**论文未证最优性而我自己的算**（用户要求"把论文未证的最优性显式标成我的外部计算"）。凡是我在下表里写"外部计算"的，都不该被读成论文的断言。

### 16.1 一览表（按是否进入最终常数排序）

| 值 | 论文位置 | Lean 对应 | 作用 | 敏感度（改坏的后果） | 我的判定 |
|---|---|---|---|---|---|
| $C=2$（最终常数） | `main.tex:62-65` `eq:main`、`:324` `thm:domain`、`:450` | `complete_crouzeix : UniversalBound 2`（`CompleteBound.lean:65`）、`expLevel_domain_bound : ‖_‖ ≤ 2`（`DomainBound.lean:69`）、`analytic_domain_core`（`DomainCore.lean:29`） | 全定理的断言 | 不可降：`main.tex:526-530` 的例子；Lean 侧 `uniform_sharpness`（`Sharpness.lean:75`）。见 16.2 | 论文证了不可降（`main.tex:65` 一句 + 12.3 的验算） |
| $4=2^2$（对角能量放大） | `main.tex:420` `=4(\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2)`、`:421` `\le 4a^2/\gamma^2` | `anti_diagonal_energy` 等式右侧的 `4 * (…) / 8`（`BoundaryEnergy.lean:57-70`）、`DomainCore.lean:77` `hPE … ≤ 4*a/γ^2` | 来自 $P+P^*$ 把 $b_0$ 项系数翻倍再平方 | 只估 $P$ 不估 $P+P^*$ ⇒ 失去 $\Re$ 半正定信息，块正定不等式无从调用；4 本身在"只剩 $b_0$"时取等 | 等号可达是**外部计算**，论文未验证等号情形 |
| $8$（合并上界） | `main.tex:450` `\le 8a^2/\gamma^2` | `DomainCore.lean:111` `hb : 2*a ≤ 8*a/γ^2` | $4+4$（$P$、$Q$ 两路各 $4a^2/\gamma^2$） | 8 与块不等式的 2 相除得 4，开方得 2；任一侧常数恶化都直接进最终 $C$ | 算术恒等，无需判定 |
| $2$（块正定系数） | `main.tex:442-444` `$0\le\tr(\Delta^{1/2}(J\Delta J)\Delta^{1/2})=\HS{P+P^*}^2+\HS{Q+Q^*}^2-2\HS{M+L^*}^2$` | `positive_block_hsSq : 2*hsSq Z ≤ hsSq U + hsSq V`（`PositiveBlocks.lean:35`）+ 证书 `J := fromBlocks 1 0 0 (-1)`（`:40`） | $2\HS{M+L^*}^2\le\HS{P+P^*}^2+\HS{Q+Q^*}^2$ | 等号可达（$U=V$、$Z$ 与其同秩）。这是 $C=2$ 的第二个不可压缩因子。若改用粗化 AM-GM，常数会变大 | $[推测]$ "改用 AM-GM 会到 $2\sqrt2$ 量级"是素材的推测，我保留但不背书 |
| $\tfrac12$（系数权重） | `main.tex:395`、`:397` `\HS{P_0}^2+\tfrac12\sum_{k\ge1}\HS{P_k}^2\le a^2/\gamma^2`、`:400` `d_N` 定义、`:420` | `singular_diagonal_estimates` 结论里的 `(1/2 : ℝ) * ∑'`（`PolynomialEnergy.lean:183-186`）、`weighted_sequence_dual` 结论（`BoundaryEnergy.lean:112`） | 与 `faberWeight` 互逆：$1/w_k$，$w_0=1,w_{k\ge1}=2$ | 必须与 4 那条等式的 $(1+\tfrac12+\tfrac12+\cdots)$ 结构完全一致，否则 `linarith` 闭合不了（`DomainCore.lean:111`）。**$\tfrac12$ 不是选出来的，是被 `anti_diagonal_energy` 的等式反推的** | 论文只用不证；"唯一性"是我的读法 |
| $2$（非零系数权重） | `main.tex:251` `\le\HS{C_0}^2+2\sum_{k=1}^N\HS{C_k}^2`、`:391` | `def faberWeight (k:ℕ) : ℝ := if k = 0 then 1 else 2`（`BoundaryEnergy.lean:106`） | 上界侧能量权重（`prop:coefficients` 右端） | 见 16.3 专条 | 论文未证此权重可改进，16.3 的分析是**外部计算** |
| $d\tau(e^{it})=dt/(2\pi)$ | `main.tex:178`（全文唯一一次声明测度归一化） | `circleMeasure`（出现 33 次；`TaylorFourier.lean` 的 `angularMeasure`/`circleMeasure`）、`scalar_circle_parseval`/`matrix_circle_parseval`/`euclidean_circle_parseval` | 归一化为**概率测度**，使"固定一个变量时积分为 1"（`main.tex:204`）成立 | 用未归一化 $dt$ ⇒ $K$ 的马尔可夫性（`:260$ 的 $\int K=1$）变成 $\int K=2\pi$，收缩引理要额外 $2\pi$ 因子，一路传到 4、8。**$2\pi$ 不进最终常数，正是因为归一化了** | 论文只声明一次，未讨论选择；我的"归一化省掉 $2\pi$"是外部计算 |
| $\pi$ | 只在 `main.tex:178` 的 $dt/(2\pi)$ 与图注中出现 | 全目录 `Real.pi` **仅 2 处**：`HolomorphicReflection.lean:82` `0 < ∫ θ in (0:ℝ)..2*Real.pi, u (circleMap 0 R θ)` 与 `:86` `⟨Real.pi / 2, …⟩`；主链一律用 `Angle`/`unitPoint`（`TaylorFourier.lean:92` `def unitPoint (t : Angle) : ℂ := fourier 1 t`）与 `circleMeasure` | 圆周参数化 | 因归一化，$\pi$ 全篇不参与不等式。Lean 里 $\pi$ 只出现在反射原理的实分析角落（对 $[0,2\pi]$ 积分取正的 $\pi/2$ 处），与 $C=2$ 无关 | 这是一条"形式化让冗余常数现形"的实测证据，我可以背书（两处的行号我未逐字复核，标素材实测） |
| $\HS C=(\tr(C^*C))^{1/2}$（未归一化 HS） | `main.tex:180` + `main.tex:13` 宏 `\newcommand{\HS}[1]{\lvert #1\rvert_2}` | `hsSq`（`PositiveBlocks.lean:15`）、`hsVector`/`hsSq_eq_norm_hsVector_sq`（`HilbertSchmidt.lean:28/31/45`） | 使 $M_m(\C)$ 成为 Hilbert 空间且 $\HS{C_k}$ 不带 $1/\sqrt m$ | **若归一化（除以 $\sqrt m$），$m$ 会显式进常数，"complete"就没了** | `main.tex:180` 那句 "unnormalized … which makes each finite-dimensional matrix space a Hilbert space" 是论文自己写的，我引为设计声明 |
| $1+\sqrt2$ | `main.tex:82`（Crouzeix-Palencia 的完整界） | 无对应（Lean 只形式化 2） | 历史比较 | 用来说明 complete 情形的已知最好值；不参与本文 | 论文未推导其来源，见第 3 节的 `[背景]` 标记 |
| $11.08$ | `main.tex:76`（Crouzeix 2007 的 universal complete bound） | 无 | 历史 | 全文唯一的小数常数 | $[推测]$ 素材猜"来自数值优化的界"，我无法核实，保留为推测 |
| $0<r<1$ | `main.tex:183`（$h$ 在 $|\lambda|>r$ 单叶亚纯） | `hR : 1 < R` + `hg : AnalyticOnNhd ℂ g (ball 0 R)`（`DomainBound.lean:64-65`、`ExteriorCollar.lean:77-78`），关系为 $r=1/R$ | 解析边界 ⇒ 共形映射越过 $\T$ | $r<1$ 严格是"$\partial\Omega$ 实解析"的等价表述；若 $r=1$（仅连续边界），$g$ 只在开圆盘解析，`chordDenominator_ne_zero`（`DividedDifferences.lean:103`）需要的 `convex_ball 0 R` 与 `AnalyticOnNhd` 立刻失效（调用点 `ExteriorCollar.lean:89`） | 论文的"regular real-analytic"与 $r<1$ 的等价性论文未证，见 5.3 表 |
| $C_\rho,\ \rho\in(r,1)$（几何衰减） | `main.tex:196-197` `|s_{kj}|\le C_\rho\rho^{k+j}` | **Lean 无对应**：`FaberEnergy`/`BoundaryKernel`/`DividedDifferences` 三个文件里 `rho`、`C_`、`tsum`、`summable` 均不出现（实测）；收敛性改由 `algebraGenerating = (c-u²•deriv g u) • Ring.inverse (algebraDenominator c g A u)`（`FaberCalculus.lean:68`）与 `ringInverse_geometric`（`:41`）在完备 Banach 代数里闭式给出 | 论文用它证 $s(\lambda,\mu)$ 的正则收敛与 $\T^2$ 上绝对一致收敛（`main.tex:198-200`） | 这是一处**真实的路线差异**：论文走系数衰减估计，Lean 走闭式求逆 + `CompleteSpace`。论文侧放宽它 ⇒ `main.tex:200` 的绝对一致收敛失去依据；Lean 侧根本没有这一步可放宽 | 我在 8.4 其四已引用过这条差异 |
| $C,\ \theta\in(0,1)$ | `main.tex:304` `For the fixed $A,h$, there are constants $C<\infty$ and $0<\theta<1$` | 同上无对应；Lean 用 `IsUnit (algebraDenominator c g A u)`（`FaberCalculus.lean:139` 的 `hunit`）与 `hu : 1 < R` | $\|b_k(A)\|\le C\theta^k$ 保证级数绝对收敛 | **论文自己写了 "For the fixed $A,h$"**，即这个 $C,\theta$ 不一致于 $A$。Lean 绕开它，也就回避了"一致性"问题（与 15.3 未述清单第 4 条呼应） | 一致性问题论文未讨论，是我列的悬案（19.1） |
| $\gamma=\|F[A]\|$ | `main.tex:329` | `let γ := ‖tensorPolynomial A F‖`（`DomainCore.lean:32`）、`hγ : 0 < γ`（`:37`） | 归一化标尺；最终要证 $\gamma\le2$ | $\gamma=0$ 必须分流（论文 `main.tex:329`；Lean `by_cases hγ0`，`DomainCore.lean:33`），因为后面有 $a/\gamma^2$ | 两边完全对齐的一处 |
| $a$（交叉能量） | `main.tex:341` `$a^2=\sum_{k\ge0}\HS{M_k}^2$`、`:355` `Taking $G=F$ … shows that $a>0$` | `let a := ∫ t, hsSq (M t) ∂circleMeasure`（`DomainCore.lean:63`）、`hapos : 0 < a` 用反证（`:65-74`） | 全部中间界的公共量 | **Lean 的 $a$ 是论文 $a^2$ 的上界**（靠 `finite_negative_bessel`，`BoundaryEnergy.lean:90`），因此 Lean 全程写 `a/γ²` 而论文写 `a²/γ²`，见 17.3。$a>0$ 在 Lean 是反证 + `nlinarith [sq_pos_of_pos hγ]`，在论文是一句话 | 这是全文最大的一处"同一字母不同量"，16.4 冲突表第 6 行 |
| $a^2/\gamma^2$ 型界对 $d_N=0$ 的处理 | `main.tex:405-406` `$d_N\le(a/\gamma)\sqrt{d_N}$, which gives $d_N\le a^2/\gamma^2$ including when $d_N=0$` | `weighted_coefficient_dual` 的 `by_cases hs0 : s = 0`（`Duality.lean:40`） | 除法前的零分支 | 论文与 Lean **都**显式处理了，是两套叙述少见的完全对齐点 | 我在 10.3 补步 23 与 Lean 观察 3 里写过 |
| $\varepsilon$、$\rho=M+\varepsilon/2$ | `thm:main` 的极限段（`main.tex:513-531`） | `apply le_of_forall_pos_le_add; intro ε hε; let ρ := M+ε/2`（`CompleteBound.lean:72-74`）、`hρ : 0 < ρ`、`hMρ : M < ρ`、结尾 `2*ρ = 2*rangeMaximum A B+ε`（`:97`） | 把"sup ，并非 max"与"$\le2$ ，并非 $<2$"缝起来 | $\varepsilon/2$ 的那个 $\tfrac12$ **是配平常数**：$2\rho=2M+\varepsilon$。取 $\rho=M+\varepsilon$ 得 $2M+2\varepsilon$，仍成立但要多一次 $\varepsilon\mapsto\varepsilon/2$。Lean 用 `dsimp [ρ,M]; ring` 一行完成（`:97`） | 论文侧没有 $\varepsilon$（用序列 $\delta_j$），这是叙述路线差，见 17.4 差异点 |
| $\delta$（外逼近厚度） | `main.tex:464` `For $0<\delta<1$, choose a finite Euclidean $\delta$-net …`、`:468` `$\Omega_\delta=\{z:\Phi_\delta(z)<1\}$`、`:510` `$\delta_j=1/(j+1)$` | `Geometry.exists_exponential_outer` 的 `ε` 参数 + `δ := min (1/2) (ε/(2*C))`（`OuterApproximation.lean:70`）；主证明里 `obtain ⟨δ,hδ,hδV⟩ := (isCompact_numericalRange A).exists_thickening_subset_open hV hWV`（`CompleteBound.lean:82`） | 两重身份：网格精度、支撑函数下移量 | `0<δ<1` 的上界 1 是**任意的**（只为参数化好看）；真正的敏感度在 Lean 的 `min (1/2) (·)`：那个 $\tfrac12$ 保证 $h_K(\nu)+\delta$ 不把 $\Omega_\delta$ 撑出包含 $K$ 的最小范围。$[推测]$ 主要服务于 `axis_support_bound` 里的 $\|z\|\le L$ 结论 | 论文侧的两个 $\delta$ 同量级是我在 11.3 表里记的"刻意合并" |
| $1/(j+1)$ | `main.tex:510` `Taking, for example, $\delta_j=1/(j+1)$ completes the construction.` | 主证明不需要具体序列：Lean 直接一次 `exists_exponential_outer … hδ`（`CompleteBound.lean:83`），不构造序列 | 论文用它把"每个 $\delta$ 有外逼近"变成可数序列以取极限 | **差异点**：论文用序列 $\delta_j\to0$ 做极限；Lean 用 `le_of_forall_pos_le_add`（`CompleteBound.lean:72`）绕开序列，只取一个 $\delta$。⇒ Lean 少了一个"可数选择 / 对角线"的依赖，是**紧性论证改成 $\varepsilon$-论证**的典型改写 | 我在 11.1 记过"序列选择不重要"，与此互证 |
| $D_\delta$ 含 $1,-1,i,-i$ | `main.tex:464` `…choose a finite Euclidean $\delta$-net $D_\delta$ of unit directions that includes $1,-1,i,-i$`、`:484` `The four axis directions ensure it is positive` | `exists_axis_net`（`SupportNets.lean:53`）的五个结论 `1 ∈ D ∧ -1 ∈ D ∧ Complex.I ∈ D ∧ -Complex.I ∈ D` + `D := S.image Subtype.val ∪ {1,-1,Complex.I,-Complex.I}`（`:61`） | 让 Hessian 正定（把 $\C$ 视 $\R^2$，四个轴向的 $\nu\nu^{\mathsf T}$ 张满对称阵锥） | **这四点必需**：只有一个方向的网 ⇒ $\Phi_\delta$ 的次水平集退化成条带（无界），`hc : IsCompact {expLevel ≤ 1}`（`DomainBound.lean:65`）不成立 ⇒ `exists_expLevel_exterior` 不能用。Lean 里由 `axis_support_bound`（`SupportNets.lean`）+ `hbound`（`OuterApproximation.lean:111-114`）显式消费这四个成员 | 我在 11.2 补步 4、5 给出"两用"的分解（Hessian 只需 $\{1,i\}$） |
| $N=\#D$、$t=(N+1)/\delta$ | `main.tex:464-484` 的"$t$ 充分大"（论文未给公式） | `let N : ℝ := Fintype.card D`（`OuterApproximation.lean:78`）、`let t := (N+1)/δ`（`:80`）、`htδ : t*δ = N+1`（`:82`）、`hsumlt : N*Real.exp (-t*δ) < 1` 用 `linarith [Real.add_one_le_exp (N+1)]`（`:89-91`） | 使 $\sum_\nu e^{-t\delta}=Ne^{-(N+1)}<1$ | **Lean 把论文的"充分大"钉成闭式**。$N+1$ ，并非 $N$ 是为了只用 $x+1\le e^x$；换 $t=N/\delta$ 会需要 $Ne^{-N}<1$（$N=1$ 时 $=e^{-1}<1$ 仍成立，但 $N$ 的定义方式让 `add_one_le_exp` 直接用不上）。$[推测]$ 选 $N+1$ 纯粹为最短证明 | 论文的 $t_\delta$ 存在性（11.2 补步 2 第 3 步）在此被具体化，**外部计算** |
| $L=2(M+1)$、$C=1+L+M$ | **仅 Lean**：`OuterApproximation.lean:67-68`（`M` 是 $K$ 的半径界，来自 `hK.isBounded.exists_pos_norm_le`） | 同上 | 给 $\Omega_\delta$ 统一有界半径 `hbound : ‖z‖ ≤ L`，再用 `isCompact_closedBall 0 L` 证紧 | **论文未述**：论文的紧性论证在 `main.tex:482` 用"一个固定矩形"；Lean 用闭球且必须显式给 $L,C$。这里 2 与 $1+L+M$ 里的两个 1 都是"随便取大一点"的平凡选择（敏感度低，只影响 `linarith` 可行性，不影响定理常数） | 论文用矩形、Lean 用闭球，是 11.2 补步 4 的一处形式化分歧 |
| $M_m(\C)$、$m$（系数维） | `main.tex:51-56`（一致于 $m$）、`:247` `For every positive integer $m$` | `0 < m`（`UniversalBound`，`Model.lean:29`）、`hm : 0 < m` 全程携带 | "complete" 的实质 | $m$ 不进任何常数，这是本文的核心诉求。**Lean 需要 $0<m$ 的真正原因是 `NeZero m` 与 `Fin m` 非空**（`DomainCore.lean:31` `let : NeZero m := ⟨Nat.ne_of_gt hm⟩`），并非数学必需 | 我在 10.8 的逐项清点给出论文侧的 $m$-无关性证据 |
| $n$（底维） | 同上 | `0 < n`、`NeZero n`（`DomainCore.lean:30`） | $W(A)$ 非空需要 $\C^n$ 有单位向量 | $n=0$ 时 `numericalRange A = ∅`、`rangeMaximum = sSup ∅ = 0`（Mathlib 约定），结论变成 $\|0\|\le2\cdot0$ 仍真。Lean 拒绝处理，故加 `hn`。⇒ **`numericalRange_nonempty hn A`（`NumericalRange.lean`）是 $0<n$ 的真实消费者** | 论文写 "positive integers $n,m$"（`main.tex:324`、`:59`），与 Lean 一致 |
| $d$（次数） | `main.tex:49` `$P(z)=\sum_{k=0}^d B_kz^k$` | `Fin (d+1) → Matrix (Fin m) (Fin m) ℂ`（`Model.lean:16`），**无 $0<d$** | 有限性保证 $P[A]$ 有意义 | 论文若要求 $d\ge1$，Lean 覆盖更广（$d=0$ 平凡）。这是 17.3 差异 (1) | $[推测]$ 题面用 `Fin (d+1) →` ，并非 `Polynomial`，是为了免掉"次数恰好为 $d$"的歧义 |
| $x_1=x_2=1/\sqrt2$、$\|x^*Ax\|=2\|x_1x_2\|\le1$ | `main.tex:530` | `norm_le_one_of_mem_sharpnessRange`（`Sharpness.lean:36`）+ `nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]`（`:50`） | 证明 $W(A)\subseteq\overline\D$ | 论文的 $1/\sqrt2$ 是取等点；Lean 用 AM-GM 形式，**没有显式给出取等点**（不需要） | 一个"论文给等号情形、Lean 只要不等式"的省略例 |
| $A=\begin{pmatrix}0&2\\0&0\end{pmatrix}$ | `main.tex:528` | `def sharpnessMatrix := !![0, 2; 0, 0]`（`Sharpness.lean:32`） | 唯一反例 | 那个 **2**（，并非 1）就是让 $\|A\|=2$ 且 $W(A)\subseteq\overline\D$ 同时成立的选择：一般地 $\begin{pmatrix}0&t\\0&0\end{pmatrix}$ 给出 $\|A\|=t$、$\max_{W(A)}|z|=t/2$，比值恒为 2。论文取 $t=2$ 是为了让右端恰为 1。**Lean 用 `sharpnessCoefficients := ![0, 1]`（`:34`）把 $P(z)=z$ 编成 $B_0=0,B_1=1$，与 `main.tex:526` 的 "$m=1$, $P(z)=z$" 一致** | "比值恒为 2"是我的**外部计算**（单参数族），论文只给 $t=2$ |
| $(1,i,j,k)$ 四元组 | `main.tex:514-518`（Toeplitz-Hausdorff 重证）：`$(2\Re(\bar uv),2\Im(\bar uv),|u|^2-|v|^2)$` ranges over the unit sphere in $\R^3$ | `Convexity.lean`：`bloch`（`:84`）、`norm_sq_three`/`norm_bloch`/`bloch_surjective_sphere`/`threeLinear`/`threeLinear_ker_ne_bot`/`twoForm`/`twoForm_bloch`/`convex_twoForm`/`convex_quadratic_range`（13 条声明，273 行） | 用 Bloch 球参数化把 $W(A)$ 写成实二次映射像，再由 $\R^3\to\R^2$ 线性核非空得凸性 | 三个 2（$2\Re,2\Im$）**必须是同一个 2**，否则像不在半径 $\|u\|^2+\|v\|^2=1$ 的球面上（`norm_bloch` 与 `bloch_surjective_sphere` 就是这条）；换成 $(\Re,\Im,\cdot)$ 会掉到半球。$\R^3$ 的 3 与"核非空"需要 $\dim\ker\ge1$（`threeLinear_ker_ne_bot`），即线性映射 $\R^3\to\R^2$ 的秩亏，这在 `Convexity.lean` 里是一个独立引理 | 我在 12.1 补步 4、5 手算过恒等式与符号相容性 |
| $R_i/3$、$2R_i/3$（领子覆盖） | `main.tex:591` `the third-radius disks $V_i=B(\zeta_i,R_i/3)$ that cover the circle`、`:594` `$|\zeta_i-\zeta_j|<(R_i+R_j)/3\le2R_i/3<R_i$` | **Lean 有同一个 $\tfrac13$**：`ConformalCollar.lean:124` `refine ⟨S/3,by positivity,E,?_,?_,?_,hEd⟩` 配三次 `simpa only [show 3*(S/3) = S by ring]`（`:125-127`），以及 `:142` `refine ⟨r/3,by positivity,f,…⟩` + `:143`/`:146` 的 `3*(r/3)=r by ring`；另 `AnalyticCharts.lean:141` `let r := min (d/3) e` 与 `:143` `3*r ≤ d` | 从局部解析延拓拼出整圈领子时的 3 倍标准选取（Lebesgue 数的粗略版） | $\tfrac13$ 是**纯粹的技术宽松选择**，敏感度极低（$\tfrac14,\tfrac12$ 同样可行）；但三处 `ring` 恒等式说明 Lean 必须**精确知道**"取三分之一再乘三回到原半径"，即覆盖数 3 出现在等式，并非不等式里。⇒ 论文里"三个同心半径"的直觉在 Lean 是一组 `3*(S/3)=S` 的算术 | 我在 5.2 步 4 手算过论文的三重不等式链 |
| $c\ne0$、$c_0$、$c=1/g'(0)$ | `main.tex:165` `$h(\lambda)=c\lambda+c_0+O(\lambda^{-1}),\ c\ne0$`、`:187` `leading coefficient $c^{-k}$`、`:613` `pole with coefficient $c=1/g'(0)\ne0$` | `hc : c ≠ 0`（`DomainBound.lean:78`、`ExteriorCollar.lean:78`）+ `hc0`、`Faber.faberBasis_zero hc g`、`Faber.faberBasis_degree`（`FaberPolynomials.lean`） | 首项系数 $c^{-k}$ 进 $b_k$；$c\ne0$ 保证 $h$ 在无穷是简单极 | $c\ne0$ 若失败 ⇒ $h$ 在无穷无极 ⇒ 非双全纯。Lean 里 `hc` 的**具体消费点**：`algebraDenominator` 在 $u=0$ 处 $=c\bullet1$ 的可逆性（`ExteriorCollar.lean:55-58`，`isUnit_iff_ne_zero.mpr hc`），以及 `chordDenominator_ne_zero`（`DividedDifferences.lean:103`）。⇒ **$c\ne0$ 不只是几何要求，它是对角项 $b_0=1$ 与"斜率不为零"的来源** | 论文未采用 $c>0$ 的相位归一化（`main.tex:236`），见 14.3 |
| $b_0=1$ | `main.tex:187` `Then $b_0=1$`、`:313` `$b_0(A)=I$ gives both integrals`、`:337-339` `Since $b_0=1$ …` | `hb0 : b 0 = 1`（`DomainCore.lean:16`）、`Faber.faberBasis_zero hc g`、`hC0 : fourierCoeff … 0 = Vᴴ * U`（`DomainCore.lean:60-62`，用 `hb0` 经 `map_one, mul_one`） | 常数项归一化 ⇒ $P_0=X^*X$、$Q_0=Y^*Y$、$L_0^*=M_0$ | **全文最关键的"1"**：若 $b_0\ne1$，`eq:means`（`main.tex:339`）三条恒等式全废，`anti_diagonal_energy` 的 $4\HS{\text{coeff }0}$ 变成 $4\HS{V^*R_0V}$，无法与 $X^*X$ 比较，块矩阵的对角块就不是 $X^*X$、$Y^*Y$，整个 $\gamma^2\le4$ 崩。**Lean 里 `hb0` 只被 `hC0` 用了一次，但那一次是致命的**（`DomainCore.lean:62, 84, 93, 97`） | 我在 9.4 补步 7 与 9.6 表里从论文侧独立给过同一条 |
| $\lambda/(\lambda-\mu)$ 的 $2\Re=1$ | `main.tex:229` `For distinct $\lambda,\mu\in\T$, one has $2\Re(\lambda/(\lambda-\mu))=1$` | `BoundaryKernel.lean` 的 `boundaryCoefficient_eq_taylor`/`boundaryKernel_character`/`unitPoint_ne_zero` 与 `FaberEnergy.lean` 的 `re_circle_fraction`/`circle_nonneg_of_off_point`/`boundaryKernel_nonneg_off_diagonal` | 把 Szegő 核的实部换成 1 ⇒ $K=1+s+\bar s$（`main.tex:202`）积分恰为 1 | 这是 $K$ 的**归一化来源**；若右端是 $c\ne1$，马尔可夫核收缩（`markov_kernel_contraction`）需要归一化，权重 $1,2$ 全部重标。**该恒等式只在 $\lambda\ne\mu$ 成立**，`main.tex:229` 的 "distinct" 与 Lean 的 `chordDenominator_off_diagonal`/`_diagonal` 分流（`DividedDifferences.lean:140-146`）一一对应 | 我在 6.2 补步里手算过 $2\Re\frac{\lambda}{\lambda-\mu}=1$（用 $\mu/\lambda+\bar{\mu/\lambda}$ 型对称化） |
| $K(\lambda,\mu)=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)}\ge0$ | `main.tex:231` | `Faber.boundaryKernel c g`（`BoundaryKernel.lean`）+ `boundaryKernel_nonnegative`（`FaberEnergy.lean:199`，10 参数字段） | 正核 ⇒ `prop:coefficients` 的双边估计 | 这里的 2 与 $4a^2/\gamma^2$ 无关，是把 $\Re$ 写成对称化的习惯；但若去掉它，$K$ 的积分是 $\tfrac12$ ，并非 1，马尔可夫性失效 | 我在 6.2 步末记过：$K\ge0$ 的唯一来源是 `eq:support`，即凸性的唯一使用点 |
| $q(\lambda)=\lambda h'(\lambda)$、$R(\lambda)=q(\lambda)(h(\lambda)I-A)^{-1}$ | `main.tex:169`、`:298`、`:144` | `Faber.boundaryNormal c g t`（`FaberEnergy.lean`）与 `Faber.algebraGenerating c g A u := (c - u²•deriv g u) • Ring.inverse (algebraDenominator …)`（`FaberCalculus.lean:68`） | 法向 + 预解式的权重 | $\lambda h'(\lambda)$ 里的那个 $\lambda$（一次幂）**把圆切向转成外法向**：Lean 的 `algebraGenerating` 里对应项是 `c - u^2 * deriv g u`，$u^2$ ，并非 $u$，因为 $u=1/\zeta$ 换元一次、$q=\zeta h'(\zeta)$ 又贡献一次（$\zeta^2$）。⇒ **$u^2$ 是两次变量替换的累积**，这个 2 与前面几个 2 无关。见 17.4(iv) 的共轭约定告警 | 我在 8.3 已把 `boundaryNormal` 与 $q$ 的手算核对结果写成"已解决"，素材的 `[需核对]` 作废 |
| $\frac{q(\lambda)}{h(\lambda)-z}=\sum_{k\ge0}b_k(z)\lambda^{-k}$ | `main.tex:184-186` `eq:faber` | `Faber.faberBasis c g k`（`FaberPolynomials.lean`，`faberBasis_coeff`/`_top_coeff`/`_degree`/`_eval`）+ `fourierCoeff_comp_neg` | Faber 基定义 | 指数是 $-k$ ，并非 $+k$，决定了 Lean 里所有 Fourier 系数用 `-(k : ℤ)` 索引（`DomainCore.lean:25` `hcoeff`、`BoundaryEnergy.lean:90` `finite_negative_bessel`）。**若写成 $+k$，则 `hposfreq`（正频率为零）与 `hcoeff`（负频率是系数）互换，整块 Parseval 逻辑需要重做** | 论文侧同样的"方向选择"我在 6.2 步 3 用 $H$ 的零点普查验过 |
| $\sum_{i=1}^m Xe_i\otimes e_i$ | `main.tex:333` | `matrixify`/`hsVector`（`HilbertSchmidt.lean:14`、`SingularPairs.lean:80`）、`hsSq_eq_norm_hsVector_sq`、`vectorKronecker` 桥接 | 把 $\C^n\otimes\C^m$ 的单位向量识别成 $n\times m$ 矩阵 | 这个识别在论文是自然同构；Lean 需要 `hsVector_matrixify`（`DomainCore.lean:44`/`:46` 两次 `simpa only` 消费）+ `entryPair` 来把 $y^*G[A]x$ 变成 $\sum(M_k)_{ij}(C_k)_{ij}$（`main.tex:349-351` `eq:pairing`）。**"标准基 $(e_i)$"在 Lean 里就是 `Pi.single`**（`HilbertSchmidt.lean` 的 `entryPair`、`Sharpness.lean:19` 的 `EuclideanSpace.single j 1`） | 我在 9.3 补步 4 给了论文侧的完整推导并标"论文未述" |
| $2\Re(\overline{q(\lambda)}(h(\lambda)-v^*Av))\ge0$ | `main.tex:320` | `positive_resolvent A _ _ (houtside …) (hsupport t)`（`ExteriorCollar.lean:74`）、`posSemidef_of_unit_quadratic`/`supported_matrix_posSemidef`/`quadratic_toLp`（`Resolvent.lean`） | "$B$ 可逆 ⇒ 正定"（`eq:support` 推 $R(t)+R(t)^*\ge0$） | 这里的 2 是 $\Re w=\tfrac12(w+\bar w)$ 的对称化，与 $C=2$ 无关。**`Invertibility of $B$ proves positivity` 这句论文的话，在 Lean 是 `IsUnit.mul` + `isUnit_resolvent_of_not_mem` + `Matrix.nonsing_inv_eq_ringInverse`（`ExteriorCollar.lean:59-71`）四次调用** | 我在 8.2 步 5 用合同论证重建了论文侧的那一步 |

$[分析]$ 这张表读完给我的一个整体判断：论文里的**每一个**进入最终常数的数字都是"结构数字"（$2$ 来自块正定、$4$ 来自对称化后的 Parseval、$8$ 是 $4+4$、$\tfrac12$ 是 2 的倒数、$1$ 来自 $b_0$），**没有任何一个数字是调出来的**。这与 Crouzeix-Palencia 的 $1+\sqrt2$ 形成对照（后者来自插值松弛，是可以被改进的那类常数）。素材把这个结论写成"本文的 2 是结构常数，并非优化常数"，我在 16.2 的最后一行按同样的口径复述并标明这是我的读法。

### 16.2 关于 $C=2$ 最优的完整常数账

把上面的表压缩成一条链，$C=2$ 的产生**只用三个数字**：

$$\underbrace{2}_{\text{块正定 }2\|Z\|^2\le\|U\|^2+\|V\|^2}\cdot a^2\ \le\ 2\int\HS{M+L^*}^2\ \le\ \int\HS{P+P^*}^2+\int\HS{Q+Q^*}^2\ \le\ \underbrace{4}_{\text{对称化 }|1+1|^2}\frac{a^2}{\gamma^2}+\underbrace{4}_{\text{同上}}\frac{a^2}{\gamma^2},$$

于是 $\gamma^2\le\dfrac{2\cdot4}{2}=4$，$\gamma\le2$。

- **两处 4 与一处 2 都各自是等号可达的**：4 在"级数只剩 $b_0$"时取等（因为 $P+P^*$ 的常数项是 $2P_0$）；块不等式的 2 在 $U=V$ 且 $Z$ 与 $U$ 同秩时取等。$2\times2$ 幂零例（$P(z)=z$，$B_0=0,B_1=1$）正好让 $M_0=X^*X$ 型退化，同时达到两处等号。$[推测]$（论文 `main.tex:530` 只验证结论，未逐条验证两处等号同时成立。**这一条完全是我的外部计算**。）
- **$a^2$ 在这条链里完全消掉**，所以 $a$ 的任何归一化选择都不影响 $C$；影响 $C$ 的只有 $a/\gamma^2$ 那一步的常数，即 `main.tex:405` 的 $d_N\le a^2/\gamma^2$ 里那个**恰好 1**。而这一步依赖 `faberWeight` 的 $1,2,2,\dots$ 与 `anti_diagonal_energy` 的 $4(1,\tfrac12,\tfrac12,\dots)$ 精确互逆。**这是"权重 2 为何不能是别的数"的最硬答案**：若权重取 $w$（$k\ge1$），则 $\tfrac1w$ 必须等于 $\tfrac12$，故 $w=2$；权重与对角展开式是同一事实的两侧。
- 唯一能改常数的自由度是 $a/\gamma^2$ 里的那个 1：`main.tex:353` 的 $|y^*G[A]x|\le a(\sum\HS{C_k}^2)^{1/2}$ 里 $a$ 不带任何倍数（因为 $a$ 定义为 $\ell^2$ 范数），所以没有松弛空间。⇒ **本文的证明没有任何 $\varepsilon$-松弛进入最终常数**（$\varepsilon$ 只在 `thm:main` 的极限段出现，见 16.1 的 $\rho$ 行），这与"数值 2 是精确最优"完全一致；对比 $1+\sqrt2$（`main.tex:82`）那种来自插值松弛的常数，本文的 2 是**结构常数**，并非**优化常数**。

$[分析]$ 我在 12.3 末写过一条与此呼应但我无法归给论文的观察：本文的证明路径（先严格包含、再取极限）在 sharpness 例上**只能渐近取等**。这两件事合起来给出一个我愿意承担的判断：2 在这套论证里是"每一步都恰好饱和、但没有任何一步严格"的常数。素材说的"两处 2 都等号可达"与我说的"只能渐近取等"并不冲突：前者是链上每个因子的局部饱和，后者是外逼近参数 $\delta_j\to0$ 的全局饱和方式。

### 16.3 `prop:coefficients` 的权重 2：敏感度专条

`main.tex:249-251` 的双边估计

$$\sum_{k=0}^N\HS{C_k}^2\ \le\ \int_\T\HS{G(h(\mu))}^2\,d\tau(\mu)\ \le\ \HS{C_0}^2+2\sum_{k=1}^N\HS{C_k}^2$$

Lean 侧对应 `faber_matrix_coefficient_bounds`（`ExteriorCollar.lean:21-29`）返回**合取的两条**，正是 `analytic_domain_core` 的 `hlower`（`:20-21`）与 `hupper`（`:22-23`）。逐条敏感度：

- **左端（下界，权重全 1）**：`hlower` 的系数 1 必须**不大于** $d_N$ 定义里的 1；下界是 Cauchy-Schwarz/Bessel 侧（`finite_negative_bessel`），它是纯 Bessel，故系数只能是 1（放大就失效）。若把下界加强为带 $1+\eta$ 的权重，Bessel 不等式不成立（Parseval 只在 $N\to\infty$ 取等）。
- **右端（上界，权重 2）**：来自 $K=1+s+\bar s$ 的非负性 + 马尔可夫核收缩（`main.tex:260-261` 的 `‖(Tu)(μ)‖² ≤ ∫K(λ,μ)‖u(λ)‖²dτ(λ)`，原文 `Integrating in μ and using the normalization in that variable shows that $T$ is an $L^2$ contraction`）。Lean 里这一步是 `markov_kernel_contraction`（`CircleFourier.lean` 与 `KernelContraction.lean` **各一份同名**，见 17.6 第 3 条）+ `energy_positiveSeries`/`energy_orthogonal_positiveSeries`（`KernelContraction.lean`）。
- **`main.tex:274-275` 的展开** $=\HS{C_0}^2+\sum_{k=1}^N\HS{C_k}^2+\sum_{j\ge1}\HS{\sum_k s_{kj}C_k}^2$ 说明**权重 2 完全由"$s$ 的贡献 $\le$ 主项"给出**，即 $T$ 的收缩性恰好给出"再加一份 $\sum_{k\ge1}$"。⇒ **$2=1$（主项）$+1$（$T$ 的像）**。这条结构性解释在 `main.tex:274-275` 的等式里是透明的，而 `faberWeight` 用 `if k = 0 then 1 else 2` 把它硬编码。$C_0$ 之所以权 1，是因为 $s$ 项只对 $k\ge1$ 有贡献（`main.tex:263` 的 `For $u(\lambda)=\sum_{k=1}^N C_k\lambda^k$, only the $s$ term contributes`）。
- 若权重 2 能改成 $2-\eta$：则 `anti_diagonal_energy` 的 $\tfrac12$ 需要改成 $\tfrac1{2-\eta}$，$\gamma^2\le\frac{2\cdot4_\eta}{2}$ 中的常数会**同步变化**。⇒ 严格说，`prop:coefficients` 的上界若改进，会**同时**改进主定理常数；这与我在 7.4 第四条的推测一致（论文未述）。

$[推测]$ 我在 7.4 里给过反证：$\sup\|T\|=1$ 是被逼的（否则圆盘情形矛盾）。结合这里"$2=1+1$"的结构解释，我现在的说法更清楚了：**权 2 的源头是 $T$ 的像空间的维度记账**，估计这一步本身没有再损失东西。改进它等价于证明 $\|T\|$ 在非常数子空间上严格小于 1，而这被圆盘情形禁止。这一段完全是我的外部计算。

### 16.4 参数命名冲突表（读源码时的坑）

| 记号 | 含义 A | 含义 B | 含义 C |
|---|---|---|---|
| $M$ | `main.tex:335` `M=Y^*RX`（交叉矩阵值函数） | `CompleteBound.lean:67` `let M := rangeMaximum A B`（实数） | `main.tex:49` $M_m(\C)$ 的 $m$；Lean `DomainCore.lean:16` 的 `m : ℕ` |
| $\rho$ | `main.tex:196` 衰减半径 $r<\rho<1$ | `CompleteBound.lean:74` `let ρ := M+ε/2`（放大后的界） | Lean `R : ℝ`（`hR : 1 < R`）是论文的 $1/r$ 而**不是**论文的 $R(\lambda)$；`main.tex:298` 的 $R(\lambda)$ 在 Lean 是 `algebraGenerating … ∘ inv`（`faber_resolvent_data` 的 `Q`） |
| $C$ | `main.tex:196` $C_\rho$ | `main.tex:304` $C$ | `main.tex:334` $C_k$（矩阵系数）；Lean `faberPolynomial b C` 的 `C : Fin N → Matrix …`（`DomainCore.lean:19`）；`OuterApproximation.lean:68` 的 `C := 1+L+M`；主定理常数 $C=2$ |
| $\delta$ | `main.tex:464` 网格精度 | `CompleteBound.lean:82` 开邻域厚度 | Lean `OuterApproximation.lean:70` `δ := min (1/2) (ε/(2*C))`（两者合体） |
| $c$ | 论文首项系数 $c\ne0$ | 同一物的另一写法 $c=1/g'(0)$（`main.tex:613`） | `DomainBound.lean:77` 的 `c` 与论文 $c$ 对应；但 `UniversalBound c`（`Model.lean:28`）的 `c` 是定理常数 2 |
| $a$ | `main.tex:341` $a^2=\sum_k\HS{M_k}^2$ | 无 | `DomainCore.lean:63` `a := ∫ hsSq(M)`（$\approx$ 论文的 $a^2$，**不是** $a$） |
| $h$ | 论文外共形映射 $h$ | `DomainCore.lean:17` `h : BoundaryCircle → ℂ`（同一物的边界限制） | `hh : Continuous h`；`AnalyticCharts.lean` 的 `analytic_inverse_chart` |
| $P,Q$ | `main.tex:335` $P=X^*RX,\ Q=Y^*RY$ | `main.tex:49` $P(z)=\sum B_kz^k$（多项式本身） | `DomainCore.lean:47-48` 的 `P/Q` 同 `main.tex:335`；`Model.lean` 里没有 $P$，改用 `coefficientPolynomial B` |

$[分析]$ 素材的结论我照抄并背书：**论文自己的记号复用度很高**（尤其 $C$ 与 $\rho$ 各有三义），而 Lean 侧用不同类型（`BoundaryCircle → Matrix`、`MatrixPolynomial m`、`Fin (d+1) → …`）在类型层面强制区分。这既是 Lean 的优势（无歧义），也是它的成本（必须给四个 `P/Q/M/L` 各写 `Continuous` 证据，`DomainCore.lean:51-57`）。我自己踩到的坑有两个，按发生顺序记：读 `main.tex:335` 时把 $M$ 当成常数 $M$（16.4 第 1 行的三义）；读 `lem:resolvent` 的 $C,\theta$ 时把它当成 `prop:coefficients` 里的常数 $C$。两处都靠"行号 + 上下文环境"才分清，所以我在 8.1 与 7.1 的开头各写了一句"此 $C$ 非彼 $C$"。

## 17 Lean 取证（上）：题面、验收配置、模块拓扑与三处陈述错位

素材第四节的取证范围我照搬（并按我自己的实测更正了两处规模数字）：`E:\math\lean\OAI\Analysis\DirectCrouzeix\`（**42 个 `.lean`，`wc -l` 合计 7389 行**；素材头记 7431 行，差值 42 恰好等于文件数，$[推测]$ 是统计方式对末行换行的处理不同，例如 PowerShell 的 `Get-Content` 会把没有结尾换行的最后一行也计一行）、`E:\math\lean\ComparatorChallenges\DirectCrouzeix.lean`（**1397 字节 / 44 行**）、`DirectCrouzeix.json`（15 行）、`E:\math\lean\formalization.yaml`（书目第 82-85 行、比较器条目第 1110-1112 行）、`E:\math\lean\OAI.lean` 第 75 行、`lean-toolchain`、`lakefile.lean`。

### 17.1 题面文件：一个自带定义的 `sorry`

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

三条取证要点，都很硬。

1. 解侧的 `OAI/Analysis/DirectCrouzeix/Model.lean` 第 11/15/19/24/28 行逐字重复这五个定义（`numericalRange`/`polynomialValue`/`tensorEvaluation`/`rangeMaximum`/`UniversalBound`）。**我把 `Model.lean` 全文读了（39 行）核对过这五个行号**，逐字一致，包括 `rangeMaximum` 用 `sSup ((fun z => ‖polynomialValue B z‖) '' numericalRange A)` 这种把像集写成 `Set.image` 再取上确界的写法。也就是说"定理陈述"与"定义"都不由解题者改写，只允许在证明体里自由。$[分析]$ 这解释了 17.5 的 `change` 密度：陈述给死了，所有"把目标改写成论文里那个样子"的动作只能发生在证明内部。
2. **整个解目录 `sorry` 计数为 0**（我实测 `grep -o '\bsorry\b' *.lean | wc -l` = 0；`native_decide` 0 次；`Axiom` 关键字 0 次）。题面里的两个 `sorry` 在 `ComparatorChallenges/`，不在 `OAI/`。$[分析]$ 写笔记时必须区分这两处，否则会把"题面占位"误读成"证明未完成"。
3. 题面**只给 `rangeMaximum`（用 `sSup`）而不给 `max`**。这个决定把论文里"连续函数在紧凸集上取到最大值"变成解侧必须自己证的引理（`NumericalRange.lean` 的 `rangeMaximum_attained`），而且见 17.4：最终证明**根本不依赖"取到最大值"**，只用 `sSup + ε/2` 松弛。这是题面写法诱导出的一个证明路线差异。$[推测]$ 我读到这里想到的反向问题是：如果题面写了 `max`，`CompleteBound.lean` 的那条 `calc` 是否能更短？我的答案是不能，因为 $\|P\|$ 在 $W(A)$ 上的最大值存在性本身需要 `IsCompact` + `ContinuousOn` + `exists_isMaxOn`，比 `sSup` 加 `le_of_forall_pos_le_add` 更贵。

配置 `ComparatorChallenges/DirectCrouzeix.json` 全文（我原样打印过，字段顺序与此一致）：

```json
{
  "challenge_module": "ComparatorChallenges.DirectCrouzeix",
  "solution_module": "OAI.Analysis.DirectCrouzeix.Main",
  "theorem_names": [
    "OAI.DirectCrouzeix.complete_crouzeix",
    "OAI.DirectCrouzeix.uniform_sharpness"
  ],
  "definition_names": [],
  "permitted_axioms": [
    "propext",
    "Quot.sound",
    "Classical.choice"
  ],
  "enable_nanoda": false
}
```

- `definition_names: []` ⇒ 验收**不检查定义本身的形式化**（定义由题面给定，抄过来即可），只检查两个定理名。素材的全库实测：`ComparatorChallenges/*.json` 共 **405** 个（**我在这个目录里数过：405 ✓**），其中 `definition_names` 非空的只有 **9** 个（如 `Brenier.json` 列 `OAI.Problem358.E / uniformMeasure / IsSupported`，`DefocusingNLS.json` 列 `sobolevProduct / schrodingerFlow / sobolevOddPower`，`Naimark.json` 列 `IsSimpleCStar / IsState / IsFaithfulTracialState`）。⇒ 本文属于 **396/405 的常态**，不能读成"本文特殊地不要求定义"；但它确实意味着**"数值范围"这一概念在验收里没有独立地位**。$[分析]$ 这条对我写笔记的直接后果是：**我在第 1 节核对的"Lean 的定理陈述"只覆盖两个断言，不覆盖概念定义**，所以任何"Lean 把数值范围定义得更严谨"的说法都是过度解读。
- `theorem_names` 有两条 ⇒ **上界与最优性同等地位**：Crouzeix 的常数 2 不可改进这件事（论文 `main.tex:65` 的一句 + `main.tex:526-530` 一段）在验收里是一个独立定理 `uniform_sharpness`。这在 Lean 侧被实装为 `Sharpness.lean`（96 行，9 条声明）。
- `permitted_axioms` 恰好是 Mathlib 的标准三件套（外延性、`Quot` 可靠性、选择公理）。素材的全库实测：405 个 json 里 `permitted_axioms` 只有 **2 个互异取值**，而这两个只是**同一三元组的字序差异**（`propext, Classical.choice, Quot.sound` 与 `propext, Quot.sound, Classical.choice`）。⇒ "允许哪些公理"在整个语料库层面是统一策略，本文这一项没有个性化内容；笔记里不要把它写成"本篇特别保守或特别宽松"。真正有区分度的字段只有 `theorem_names`、`enable_nanoda` 与 `solution_module`。$[推测]$ `Classical.choice` 被点名允许的实际消费者是 17.5(iv) 的 `choose`（16 次）与 `classical` 块（13 次）。
- `enable_nanoda: false` ⇒ 不使用 `nanoda`（把 `MeasureTheory` 积分与测度自动化外挂的第三方库）；本论文的测度论全部走 Mathlib 本体。$[分析]$ 这一点对本文特别关键：证明的核心对象是**圆上的积分**（`circleMeasure` 出现 33 次，Parseval 三条），一旦允许 nanoda 就会改变写法。素材把 `enable_nanoda` 列为有区分度的字段之一，但我没有去数全库有多少条是 `true`，这一格保留为"素材未给分布"。

`formalization.yaml` 侧：第 82-85 行是**书目条目**（`title / authors:["OpenAI"] / id: ../preprints/…/paper.pdf / type: article`），没有 Lean 字段；Lean 映射在文件后半的比较器清单第 1110-1112 行：

```yaml
    - comparator_config: ComparatorChallenges/DirectCrouzeix.json
      declaration: OAI.DirectCrouzeix.complete_crouzeix
      file: OAI/Analysis/DirectCrouzeix/CompleteBound.lean
```

⇒ **一处不一致**：`yaml` 的 `declaration` 只列 `complete_crouzeix`，而 `json` 的 `theorem_names` 列了两个（含 `uniform_sharpness`）。也就是说"入口声明"与"验收声明"不等价：yaml 指向单一入口，json 要求两条都成立。素材记为管线设计细节，并提醒不要读成"最优性次要"，我照此写。

顺带清点同族：yaml 里 Crouzeix 相关条目有**三条**，不是两条。第 82 行 `A direct proof of the complete Crouzeix inequality`（比较器第 1110 行，`OAI.DirectCrouzeix.complete_crouzeix`）、第 652 行 `The complete Crouzeix theorem: optimal similarity and a common positive boundary representation`（比较器第 1542 行，`OAI.StructuralCrouzeixReference.challenge`，文件 `OAI/Analysis/StructuralCrouzeix/Endpoint.lean`）、以及第 1038 行的 `ComparatorChallenges/CompleteCrouzeix.json` 对应 `OAI.CompleteCrouzeix.main` 与 `OAI/Analysis/NumericalRange/Main.lean`（对应某篇"数值范围"论文）。$[分析]$ **仓库里有三套并行的 Crouzeix 形式化**。同一猜想族被拆成三个独立挑战，`OAI/Analysis/NumericalRange/` 与 `OAI/Analysis/DirectCrouzeix/` 是两套互不相干的定义与证明（各自的 `numericalRange` 各写一遍）。这条事实我在第 3 节做"结构同族对照表"时只用到论文侧的证据，Lean 侧的三套并行是它的独立佐证：**同一句话（完整性）被三种不同路线各自形式化过。**

### 17.2 模块拓扑与论文结构的量级差

- 解侧 `Main.lean` 全文 42 行、**0 条声明**，只是 41 条 `import`；`OAI.lean` 第 75 行 `import OAI.Analysis.DirectCrouzeix.Main` 把整个包接入根。`Main.lean` 的 import 顺序即拓扑顺序（每个文件只 import 它前面的模块）。$[推测]$ 我在列目录时确认文件名顺序与素材分层表相容（`Model` 在最前、`CompleteBound` 在最后），但 `Main.lean` 的 41 条 import 我未逐条读完，分层归是我按 import 关系归的。
- 论文：`main.tex` 623 行（我实测；素材记 624 行，差一行应为末行换行计数）、1 个正文 figure（`\input{figures/normal.tex}`，`main.tex:176`）、`\appendix`（`main.tex:532`）后接 `\input{references.tex}`（`main.tex:622`）；正文定理环境只有 6 个具名对象（`lem:faber`、`prop:coefficients`、`lem:resolvent`、`thm:domain`、`lem:approx`、`lem:exterior-collar`，其中最后一个在附录）加 `thm:main`。
- 量级比：**7389 行 Lean 对 623 行 tex，约 12:1**；**42 个文件对 6 个具名定理，约 7:1**。这不是"翻译膨胀"，而膨胀集中在**几何分析基础层**：论文里当作已知事实引用的东西（Riemann 映射在边界的正则性、Carathéodory、Laurent 展开、Montel 紧性、Poisson/Herglotz 表示、凸集支撑函数）在 Lean 侧自建了约 1400 到 1900 行。

按依赖层次把 42 个文件分五层（层次我按 import 关系归，论文无对应分层）：

| 层 | 文件（行数） | 对应论文位置 |
|---|---|---|
| ① 题面与基础 | `Model`(39) `NumericalRange`(71) `PositiveBlocks`(69) `Resolvent`(155) `HilbertSchmidt`(121) `SingularPairs`(124) `Duality`(86) `Sharpness`(96) | §2 记号、`eq:singular`、块正定一句话、`main.tex:530` 最优性 |
| ② Fourier 与能量引擎 | `CircleFourier`(182) `BoundaryEnergy`(140) `PolynomialEnergy`(226) `DomainCore`(170) `KernelContraction`(203) `TaylorFourier`(167) `CompactIntegrals`(214) | `thm:domain` 证明的第 326 到 453 行（四段 `\emph`） |
| ③ Faber 与解析层 | `FaberPolynomials`(208) `FaberCalculus`(197) `FaberEnergy`(225) `BoundaryKernel`(255) `DividedDifferences`(165) `ExteriorCollar`(121) `PolynomialCalculus`(108) | `lem:faber`、`prop:coefficients`、`lem:resolvent` |
| ④ 共形几何层 | `NormalFamilies`(260) `DiskMapping`(290) `ExtremalEmbedding`(246) `PoissonBoundary`(246) `HarmonicReflection`(213) `HolomorphicReflection`(270) `Continuation`(181) `ConformalCollar`(263) `AnalyticCharts`(253) `ExponentialLevels`(178) `BoundaryParametrization`(156) `InverseExterior`(188) `ExteriorMapping`(228) | `lem:exterior-collar`（附录第 536 到 621 行）与其前置事实 |
| ⑤ 装配层 | `SupportNets`(191) `Convexity`(273) `ExponentialSupport`(176) `OuterApproximation`(173) `DomainBound`(142) `CompleteBound`(120) | `lem:approx`（第 457 到 511 行）、`eq:support`、第 513 到 531 行 |

**"论文一句话对应 Lean 一个模块"的实测清单**（这张表在笔记里最能说明两套叙述的信息密度差）：

| 论文的一句话 | tex 位置 | Lean 侧为它存在的模块 |
|---|---|---|
| `There is nothing to prove if $\gamma=0$.` | 329 | `DomainCore.lean:33` `by_cases hγ0 : γ = 0`（1 行，但决定了后面所有除法的前提） |
| `choose unit singular vectors $x,y$` | 329-332 | `SingularPairs.lean` 的 `exists_norm_attainer`（`:30`）加 `exists_singular_pair`（`:51`）（124 行，含 `matrixify`（`:80`）与 `entryPair`（`HilbertSchmidt.lean:45`）桥接） |
| `Write $x=\sum Xe_i\otimes e_i$` | 333 | `HilbertSchmidt.lean` 的 `hsVector`/`matrixify`/`hsSq_eq_norm_hsVector_sq`（121 行） |
| `Invertibility of $B$ proves positivity.` | 320 | `Resolvent.lean` 21 条声明（`quadratic` 六件套加 `posSemidef_of_unit_quadratic`、`supported_matrix_posSemidef`、`positive_resolvent`），155 行 |
| `their coefficient sequences are square summable` | 337 | `CircleFourier.lean` 的 `matrix_circle_parseval` 加 `BoundaryEnergy.lean:90` `finite_negative_bessel` |
| `Cauchy--Schwarz gives \eqref{eq:crossfunctional}` | 351-352 | `PolynomialEnergy.lean:121` `cross_boundary_estimate` 与 `Duality.lean:15` `weighted_coefficient_dual`（变分选择写死为 `C k := (w k)⁻¹ • (P k).map star`） |
| 凸性"数值范围是凸集" | 514-522 重证 | `Convexity.lean` 13 条声明 273 行（Bloch 球 `bloch`(`:84`)/`norm_bloch`(`:90`)/`bloch_surjective_sphere`(`:101`)/`threeLinear_ker_ne_bot`(`:137`)/`twoForm_bloch`(`:144`)/`convex_twoForm`(`:160`)/`convex_quadratic_range`(`:201`)。论文里这是 Toeplitz-Hausdorff 的经典一句话 |
| "由紧性取 $\delta$ 邻域" | 519 前后 | `IsCompact.exists_thickening_subset_open`（Mathlib 本体，`CompleteBound.lean:82` 一行调用） |
| "外共形坐标 $h(\zeta)=c\zeta+g(1/\zeta)$ 存在" | `lem:exterior-collar` | `InverseExterior`（9 条集合性质）+ `ConformalCollar`(`exists_riemann_collar`) + `DiskMapping`(`exists_riemannMap`) + `ExtremalEmbedding` + `NormalFamilies`(Montel) + `AnalyticCharts` + `Continuation`，约 1600 行 |
| "把 $F$ 按 Faber 基展开" | 347 | `DomainCore.lean:119` `faber_expansion_of_degree`（33 行，需要 `Polynomial.Sequence`、`Submodule.span_degreeLT`、`mem_span_range_iff_exists_fun`） |

### 17.3 陈述层的一致性核对（逐条）

**主定理**。Lean：`complete_crouzeix : UniversalBound 2`，展开即

$$\forall n\,m\,d,\; 0<n\to0<m\to\forall A\in M_n(\C),\ \forall B:\mathrm{Fin}(d+1)\to M_m(\C),\quad \bigl\|\textstyle\sum_k A^k\otimes B_k\bigr\|\le c\cdot\sup_{z\in W(A)}\bigl\|\textstyle\sum_k z^kB_k\bigr\|.$$

与论文 `eq:main`（`main.tex:58-66`）比对得到的差异（三处，都是 **Lean 更宽**）：

1. **不要求 $0<d$**。$d=0$ 时 $A^0\otimes B_0=1\otimes B_0=B_0$，`rangeMaximum` $=\|B_0\|$，结论退化为等式。论文若把 $d$ 写成"正整数"，Lean 覆盖的情形更多（系数序列用 `Fin (d+1)` 索引，$d$ 只是上界）。$[推测]$ 题面选 `Fin (d+1) →` ，并非 `Polynomial`，就是为了免去"次数恰好为 $d$"的歧义。$[分析]$ 我在 16.1 的 $d$ 行也记过这条，两处一致。
2. **$B$ 是系数函数，并非多项式**。`polynomialValue` 用 `z ^ (k:ℕ) • B k` 求和；论文把 $F$ 当 $M_m(\C)$-值多项式。解侧为了同时使用两种观点，专门写了 `PolynomialCalculus.lean` 的 `coefficientPolynomial`/`tensorPolynomial`，并在 `OuterApproximation.lean:128` 加 `@[simp] matrixPolynomialValue_coefficientPolynomial` 把两套写法缝合（`CompleteBound.lean:88` 与 `:94` 各用一次 `rw`）。**这是"论文一个记号对应 Lean 一个转换层"的典型**：论文里 $F[A]$ 一个符号，Lean 里 `tensorEvaluation A B`（题面）等于 `tensorPolynomial A (coefficientPolynomial B)`（内部），两种写法要来回换。我在第 1 节核对 Lean 的 $[A]$ 定义时引的正是 `PolynomialCalculus.lean:58-66` 的 `Polynomial.eval₂RingHom'`，与这里的转换层是同一处。
3. `UniversalBound c` 的 `c` 是 `ℝ` 且**不带 $c\ge0$ 假设**。所以 `uniform_sharpness` 必须先证 $0\le c$（`Sharpness.lean:84-87`：`by_contra` + `mul_nonpos_of_nonpos_of_nonneg` + `linarith`）。论文完全不会意识到这是个问题（因为论文的"常数"一词自带正性）。$[分析]$ 我认为这是"机器比人老实"的一例：形式化把一个日常语言里的隐含前提变成了显式引理。

**`thm:domain` 与 `expLevel_domain_bound`：本文最大的陈述错位。** 论文 `main.tex:323-325` 原文（我在 9.1 已贴，这里再贴一次以对照）：

```tex
\begin{theorem}[The bound on an analytic convex domain]\label{thm:domain}
For positive integers $n,m$, let $\Omega\subset\C$ be bounded, open, and convex with regular real-analytic Jordan boundary, and let $A\in M_n(\C)$ satisfy $W(A)\subset\Omega$. For every $M_m(\C)$-valued polynomial $F$ with $\|F(z)\|\le1$ on $\partial\Omega$, one has $\|F[A]\|\le2$.
\end{theorem}
```

Lean 侧**没有任何一个定理**陈述 "bounded open convex + regular real-analytic Jordan boundary"。它有的是 `DomainBound.lean:63`：

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

$[分析]$ 取证结论，值得在笔记里专门一段：**Lean 把"解析凸域"这一几何概念替换为它的表示定理产物**，即有限个指数型仿射函数之和的次水平集。于是

- 论文的假设 "$\Omega$ 有 regular real-analytic Jordan 边界" 变成 `hc : IsCompact {expLevel ≤ 1}` 加 `hW : W(A)` 严格落在 `{expLevel < 1}`；
- 论文的假设 "$\|F\|\le1$ on $\partial\Omega$" 变成 `hF` 在**闭次水平集**上（比边界更强，但因为 `hc` 只给紧性，用整个闭包反道是 Lean 的自然写法）。**这正是我在 12.2 补步 7 与 10.7 表里两次引用的"绕开最大模原理"的同一件事**，Lean 侧的原话我在 9.6 表里贴过：`DomainBound.lean:96-97` 的 `exact hF _ (le_of_eq (hcircle _ (Faber.unitPoint_norm t)))`。
- 关键：**"边界是解析 Jordan 曲线"这件事在 Lean 里变成待证命题，并非假设**。`ExteriorMapping.lean:148` `exists_expLevel_exterior` 从 `(v,b,hc,ha)` 造出 `R>1, c≠0, g` 与 $h(\zeta)=c\zeta+g(\zeta^{-1})$，并要求 `(∀ ‖η‖=1, expLevel (ψ η) = 1)` 与 `(∀ 1≤‖η‖, 1 ≤ expLevel (ψ η))`；它的证明链是 `inverseExterior_isOpen`/`_simplyConnected`/`_proper`/`_compact_closure`/`_analytic_boundary`/`zero_mem_inverseExterior`，再 `Conformal.exists_riemann_collar`，最后 `exterior_laurent_form`。**即：Lean 用 `expLevel` 的可微性（`expLevel_contDiff : ContDiff ℝ ⊤`）把论文当作正则性假设的东西变成定理。** $[推测]$ 这解释了为什么 `AnalyticCharts.lean` 里同时存在 `expLevel` 的定义与 `analytic_complex_chart`：定义层就是为了让正则性可证。
- 代价：Lean 只覆盖**能被有限 expLevel 表示**的那类域。论文 `main.tex:457-511` 的 `lem:approx` 说明"$W(A)$ 总能被这类域从外面任意逼近"，Lean 侧对应 `Geometry.exists_exponential_outer`（17.5(i)），因此**整体覆盖面不缩水**：`thm:main` 的凸性与逼近论证正好把这条限制吸收掉。这一点必须在笔记里说清楚，否则容易误判成"Lean 版更弱"。$[分析]$ 我在第 5 节写 `lem:exterior-collar` 时按论文侧记过同一件事的另一面：论文把 $r<1$（解析性）当假设，把"存在这样的 $h$"当定理；Lean 把两者都当定理，代价是换成 `expLevel` 语言。两套叙述在这里是**换位，并非等价**。
- 素材补的一条覆盖面诚实说明我照抄：`expLevel` 的 `ι` 是 `Fintype`（`DomainBound.lean:64` `[Fintype ι]`），所以 Lean 只允许**有限项**指数表示；若有人想把解析凸域定义为可数和，Lean 版不覆盖。

**$a$ 的定义错位（我核对到的一处实质性差异）**。论文 `main.tex:341-344`：

```tex
Set $a^2=\sum_{k\ge0}\HS{M_k}^2$. We will bound the squared boundary $L^2$ Hilbert--Schmidt norms of $P+P^*$ and $Q+Q^*$ above by $4a^2/\gamma^2$ each, and that of $M+L^*$ below by $a^2$. Positivity will then compare these quantities and force $\gamma\le2$.
```

Lean `DomainCore.lean:63`：`let a := ∫ t, hsSq (M t) ∂circleMeasure`。**Lean 的 `a` 对应论文的 $a^2$，甚至只是它的下界**，与论文的 `a` 差一个平方：由 `finite_negative_bessel`（`BoundaryEnergy.lean:90`，Bessel 只给 $\sum_{k<N}\le\int$）与 Parseval，$\sum_{k\ge0}\HS{M_k}^2\le\int\HS{M}$。于是论文的 `$a^2$` 在 Lean 里全程写作 `a`，界写作 `4*a/γ^2`、`2*a ≤ 8*a/γ^2`（`:105-113`）。⇒ **Lean 的证明实际上把论文的"系数 $\ell^2$ 能量"换成了"边界 $L^2$ 能量"，只在需要下界的方向上使用（`hME : a ≤ ∫ hsSq (M + Lᴴ)`），从而根本不需要 Parseval 等式对 $M$ 成立。** $[分析]$ 这是一个真实的、可写进笔记的技术观察：**换成 $L^2$ 视角后，$\sum$ 与 $\int$ 的等号只在"对角"引理里被用到**（`anti_diagonal_energy` 是等式，见 17.4）。我在 10.4 补步 25 从论文侧算过交叉块的下界只用不等号、不用等号，两边在这里完全吻合：**论文的 `eq:cross-L2` 里那个 $\ge$ 在 Lean 里就是全部的强度**。

### 17.4 引擎层：`analytic_domain_core` 是全文常数的产地

`DomainCore.lean:15-117` 这 101 行是**整个 Lean 证明里唯一产生常数 2 的地方**，而且它与共形几何完全解耦（假设只有 `b : ℕ → Polynomial ℂ`、`h : BoundaryCircle → ℂ`、`R : BoundaryCircle → Matrix …` 与四个抽象条件 `hexpand`/`hlower`/`hupper`/`hcoeff, hposfreq, hpositive`）。我在取证时把这 101 行逐行读过，提取出的常数链：

| Lean 位置 | 事实 | 常数的来源 |
|---|---|---|
| `:40` `obtain ⟨x,y,hx,hy,hxy,hyx⟩ := exists_singular_pair T (hT ▸ hγ)` | 奇异对 $(x,y)$，$\gamma>0$ | 论文 329-332 |
| `:63` `a := ∫ t, hsSq (M t)` | 交叉能量 | 论文的 $a^2$ |
| `:75` `hdiag := singular_diagonal_estimates …` | `hsSq(Xᴴb₀X) + (1/2)∑'ₖ hsSq(Xᴴb_{k+1}X) ≤ a/γ²`（X、Y 各一条） | `PolynomialEnergy.lean:183-186` |
| `:77` `hPE : ∫ hsSq(P+Pᴴ) = … ≤ 4*a/γ²` | **因子 4** | `BoundaryEnergy.lean:57` `anti_diagonal_energy` 的等式右边就是 `4 * (hsSq(coeff 0) + (1/2)∑' hsSq(coeff -(n+1)))` |
| `:86` `hQE` 同上 | 再一个 4 | 同上，用 `hdiag.2` |
| `:95` `hME : a ≤ ∫ hsSq(M+Lᴴ)` | 交叉项的"下界" | `BoundaryEnergy.lean:72` `anti_cross_energy`，收尾是 `nlinarith [hsSq_nonneg (fourierCoeff M 0)]`（丢掉的正交叉项靠非负性吸收） |
| `:105` `hblock : 2*∫hsSq(M+Lᴴ) ≤ ∫hsSq(P+Pᴴ) + ∫hsSq(Q+Qᴴ)` | **因子 2** | `PositiveBlocks.lean:35` `positive_block_hsSq : 2*hsSq Z ≤ hsSq U + hsSq V`，证明里显式写了证书矩阵 `J := fromBlocks 1 0 0 (-1)`，靠 `re_trace_block_comparison D J h hJ` |
| `:111` `hb : 2*a ≤ 8*a/γ²` | $8=4+4$ | `linarith` |
| `:116` `hg2 : γ² ≤ 4` | 除以 $a>0$ | `nlinarith [hapos]` |
| `:117` `nlinarith` | $\gamma\le2$ | 由 $\gamma^2\le4$ 与 $\gamma\ge0$ |

⇒ **$C=2$ 的机械来源在 Lean 里是可分离的两个因子**：一个来自 $P+P^{\mathsf H}$ 的 Parseval 展开里的 $4=\lvert1+1\rvert^2$（"加自己的共轭转置"使对角系数翻倍，平方后出 4），另一个来自块正定的 $2\|Z\|^2\le\|U\|^2+\|V\|^2$。最终 $\gamma^2\le8/2=4$，故 $\gamma\le2$。这与论文 `main.tex:341-344` 的叙述完全一致，但 Lean 表明：**两处 2 都是等号可达的**（前者在系数只剩 $b_0$ 时取等，后者在 $U=V$、$Z$ 满秩时取等），这正是 `Sharpness.lean` 的 $2\times2$ 幂零例能 saturate 的原因。$[推测]$ 笔记里"2 为什么是 2"这一段，Lean 给出的分解比论文更细；"两处同时取等"这件事在论文侧是我 16.2 第一条标了 `[推测]` 的外部计算。

另外两个只在 Lean 里看得见的细节：

- `faberWeight (k:ℕ) : ℝ := if k = 0 then 1 else 2`（`BoundaryEnergy.lean:106`）。这个 1/2-权重的**不整齐**（第 0 项权 1，其余权 2）正好和 `anti_diagonal_energy` 里的 `hsSq(c₀) + (1/2)∑'ₙ hsSq(c_{-(n+1)})` 对齐；`Duality.lean:15` `weighted_coefficient_dual` 把"对所有测试矩阵 $C$"的二次型界转成 $\sum_k\HS{P_k}/w_k\le b$，`BoundaryEnergy.lean:112` 的 `weighted_sequence_dual` 再把它写成 `hsSq (P 0) + (1/2) * ∑' n, hsSq (P (n+1)) ≤ b`。**即：论文里 $1,2,2,2,\dots$ 这个权重是被 `anti_diagonal_energy` 的等式反推出来的，留不下选择的余地**：Lean 侧两处必须写成同一个 `faberWeight` 才能闭合，任何一边改成别的权重就 `linarith` 不通。$[分析]$ 这是 `prop:coefficients` 那条"权重 2"最强的一条机械证据，我在 7.3 末与 16.3 从论文侧给过同一结论的两种不同论证（圆盘基例的 $s=0$ 与"$2=1+1$"的结构解释），三条合起来才完整。
- `weighted_coefficient_dual` 的证明里那个变分选择是**写死的**：`let C := fun k => ((w k : ℂ)⁻¹) • (P k).map star`，然后 `by_cases hs0 : s = 0` 分流（$s=0$ 时结论平凡、$s>0$ 时两边除以 $s$）。论文说的是"取 $C$ 为极值方向、Cauchy-Schwarz 取等"，Lean 直接给出取等的那个 $C$。**这是"论文用变分语言，Lean 用证书"的第一处典型绕行。** 我在 10.3 的 Lean 观察里贴过这段代码全文（`Duality.lean:15-46`），两处指同一件事。

### 17.5 最优性 `uniform_sharpness`：Lean 比论文多算了一步

论文 `main.tex:526-530` 的最优性叙述只有几句（$2\times2$ 幂零加一次多项式给出常数不可降）。Lean 侧 `Sharpness.lean`（96 行）把这句话拆成 6 条声明：

```lean
def sharpnessMatrix : Matrix (Fin 2) (Fin 2) ℂ := !![0, 2; 0, 0]
def sharpnessCoefficients : Fin 2 → Matrix (Fin 1) (Fin 1) ℂ := ![0, 1]
```

- `norm_entry_le_l2_opNorm`（`:17`）：单个矩阵元 $\le$ L² 算子范数（用 `Pi.single j 1` 作单位向量 + `PiLp.norm_apply_le` + `le_opNorm`）。**这条就是"$\|A\otimes1\|\ge|A_{01}|=2$"的机器**。
- `norm_le_one_of_mem_sharpnessRange`（`:36`）：$W(\text{sharpnessMatrix})\subseteq\overline\D$。计算 `inner ℂ u (A u) = 2 * star (u 0) * u 1`，然后 `nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]`（`:50`）。**Lean 用最诚实的方式证明了 $2|u_0||u_1|\le|u_0|^2+|u_1|^2=1$**：论文的"显然"在这里是一次 AM-GM，而且是以 `sq_nonneg (a-b)` 的形式交给 `nlinarith`。
- `sharpness_rangeMaximum_le_one`（`:61`）与 `sharpness_tensor_norm_ge_two`（`:68`）。
- `uniform_sharpness (c) (hc : UniversalBound c) : 2 ≤ c`（`:75`），中间必须先补 `0 ≤ c`（`:84`）。

**关键观察**：`sharpnessCoefficients = ![0, 1]` 意味着 $B_0=0,B_1=1$，所以 $F(z)=z$、$\|F\|_{W(A)}=\max_{z\in W(A)}|z|\le1$，而 $F[A]=A\otimes1$，$\|A\otimes1\|=2$。⇒ **不可改进性完全发生在 $m=1$（系数维 1）且次数 $d=1$ 处**；"complete" 版本的困难（$m$ 任意大）在反例侧完全不出现。$[分析]$ Lean 写得比论文清楚，因为题面要求把反例也写成 `UniversalBound` 的实例。同时它给出一个诚实的批评素材：**下界例子与定理的难度不成比例**，上界要靠 $M_m(\C)$-值 Faber 展开，下界只用标量。$[推测]$ 论文大概正是因此不展开这段。我在 12.3 末与 16.1 的 sharpness 行记过同一条不对称（"上界难在 $m$，下界只需 $m=1$"），三处口径一致。

### 17.6 绕行清单：论文的存在、变分、紧性对应 Lean 的构造、证书、有限网格

**（i）外逼近的完全显式构造。** `Geometry.exists_exponential_outer`（`OuterApproximation.lean:59-122`）对应论文 `lem:approx`（`main.tex:457-511`）。Lean 侧没有任何"取充分大的参数"，全部是闭式：

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
  linarith [Real.add_one_le_exp (N+1)]                   -- :89-91
```

机制拆开看：$K\subseteq\overline{B(0,M)}$；$\delta=\min(1/2,\varepsilon/(2C))$；有限网格 $D$ 是单位圆的 $\delta$-网且**强制包含 $\pm1,\pm i$**（`SupportNets.lean:53`，来自 `(isCompact_sphere (0:ℂ) 1).elim_finite_subcover` 的有限子覆盖并上 $\{1,-1,I,-I\}$）；$N=\#D$；$t=(N+1)/\delta$ 使得 $t\delta=N+1$，于是
$$N\cdot e^{-t\delta}=\frac{N}{e^{N+1}}<1\quad\text{（只用 }N+1\le e^{N+1}\text{）}.$$
从而 $z\in K$ 时 $\operatorname{expLevel}(z)=\sum_\nu e^{t(\langle\nu,z\rangle-h_K(\nu)-\delta)}\le Ne^{-t\delta}<1$。$[分析]$ 这正是我在 11.2 补步 2 里说的"$t_\delta$ 的唯一用途"，Lean 把它做成了闭式。

- **与论文的差异**：论文里这是"取 $t$ 充分大"的一句存在性话；Lean 给出 $t=(N+1)/\delta$ 这个**恰好越过 $\log$ 阈值的闭式**，只用一条 `Real.add_one_le_exp`。笔记可写：**形式化迫使把"充分大"变成"多大"。**
- **$\delta$ 里那个 $1/2$**：它保证网格与支撑面的误差在 `axis_support_bound`/`direction_net_distance` 下不失真；而 $\varepsilon/(2C)$ 里的 2 是给 $|b_\nu|$ 的偏移留一半（最终 `hδε : δ*C < ε`）。`C := 1+L+M` 是"半径加 1"型的粗界，出现在把支撑函数误差转成欧氏距离的那一步（`:121` 的 `direction_net_distance`）。⇒ 这三个数（$1/2$、2、$1+L+M$）**在论文里不存在**，是 Lean 构造的副产品，我在 16.1 表里已单独列了一行并标"仅 Lean 侧"。
- **`convexSupport` 用 `sSup` ，并非 `max`**（`SupportNets.lean:79`），并配 `convexSupport_attained`（`:81`，靠 `IsCompact.sSup_mem`）。⇒ 论文写 $s_K(\nu)=\max_{z\in K}\Re(\bar\nu z)$，Lean 写 `sSup` 再证明能取到。与 `rangeMaximum` 同样的模式，全目录里出现了至少 3 次（`rangeMaximum`、`convexSupport`、以及 `ExtremalEmbedding` 的极值泛函）。**这是"论文的 max 等于 Lean 的 sSup 加 attained"这条固定绕行。** $[分析]$ 我在 11.2 补步 2 第 2 步写"支撑函数最大值取得到（连续函数在紧集上）"时没有意识到这是一次定理调用；Lean 侧它是一次 `IsCompact.sSup_mem`。

**（ii）极值嵌入与 Riemann 映射。** 论文附录 `lem:exterior-collar` 把外共形映射当作 Carathéodory/Koebe 级别的已知。Lean 自建：`ExtremalEmbedding.lean`（`exists_injective_not_dense_image_deriv_ne_zero`、`exists_mapsTo_unitBall_injOn_deriv_ne_zero`、`exists_normalizedEmbedding`、`exists_extremalEmbedding`）到 `DiskMapping.lean`（`diskMobius` 八条性质 + `improve_embedding` + `exists_riemannMap` + `norm_tendsto_one_boundary`）到 `NormalFamilies.lean`（`bounded_holomorphic_equicontinuous`、`bounded_holomorphic_compact`、`zero_or_nonvanishing_limit`、`constant_or_injective_limit`、`strict_bound_of_normalized`）到 `ConformalCollar.lean`（`local_riemann_extension`、`exists_riemann_collar`）。
⇒ 注意 `constant_or_injective_limit` 这一条：它是 Hurwitz 型引理，说明 Lean 侧在取极限时**必须区分极限是常数还是单叶**，而论文里"由正规族取子列"一句话背后这个分岔没有被提及。$[推测]$ 这是引理名暴露出来的**真实卡点**：作者在写 `exists_extremalEmbedding` 时会在此卡一次。我在 5.4 的失败路线里记过论文侧的对应物（标准外 Riemann 归一化在无穷处可能塌成常数），两处指的是同一次摔倒的不同版本。

**（iii）边界解析性靠反射，不靠引用。** 论文把 $\partial\Omega$ 的实解析性作为假设；Lean 用 `PoissonBoundary.lean`（`poissonExtension`、`poisson_nonnegative_circle`、`herglotzExtension`、`harmonic_le_boundary`）加 `HarmonicReflection.lean`（`harmonic_reflection`、`oddUpper` 五条、`upperBall` 三条）加 `HolomorphicReflection.lean`（`logModulusUpper`、`herglotz_deriv_im_pos`、`holomorphic_reflection_modulus`）造出来，再由 `ExteriorMapping.lean:148` 消费。⇒ 论文明确把这块当输入，Lean 把它当输出。**这一条差异必须在笔记里点出**：它不代表 Lean 更强，只代表 Lean 不接受"由正则性可知"这类输入。我在 5.2 步 5 重构的论文侧 Schwarz 反射（把 $h$ 沿 $\T$ 反射）与此处的 Herglotz/Poisson 路线是两个方向的同一件事。

**（iv）支撑线条件的机器形式。** 论文 `eq:support`（$\Re(\overline{q(\lambda)}(h(\lambda)-z))\ge0$，`main.tex:170-173`）在 Lean 里是 `expLevel_holomorphic_support`（`ExponentialSupport.lean:87`）的结论
`0 ≤ inner ℝ (ζ*deriv ψ ζ) (ψ ζ-w)`，
它的证明里出现了一个**参数化技巧**：`let e := fun t : ℝ => ζ*Complex.exp ((t:ℂ)*Complex.I)`，用 $e(t)=\zeta e^{it}$ 在单位圆上滑动来推出梯度与 $iq$ 正交（`horth : inner ℝ G (Complex.I*q) = 0`）。⇒ 论文里"沿边界方向微分得切向、法向即 $q$"这句话，Lean 变成"绕一圈的子路径 + `HasFDerivAt`"。$[分析]$ 这是**第 3 类绕行**：论文用几何直观，Lean 用显式路径。
随后 `DomainBound.lean:82` 把它转成
`he : Faber.unitPoint t*deriv (Faber.exterior c g) (Faber.unitPoint t) = Faber.boundaryNormal c g t`（我这次逐字复核，原文带 `Faber.` 前缀，素材 §4.5(iv) 抄写时把前缀省掉了），再在 `:85` 用
`change 0 ≤ ((Faber.exterior c g (Faber.unitPoint t)-w)*conj (Faber.boundaryNormal c g t)).re at hh`
换乘法顺序，`:86` `simpa only [Faber.boundary,mul_comm] using hh` 收尾。素材在这里挂了一个 `[需核对]`：`boundaryNormal` 与论文 $q(\lambda)$ 的共轭约定是否一致。**我在 8.3 已经手工核对并解决它**：`FaberEnergy.lean:129-130` 的 `boundaryNormal` 展开后恰好等于 $\zeta h'(\zeta)$（差一个 `mul_comm`，`DomainBound.lean:85-86` 的 `change` 正是为此），所以那个 `[需核对]` 作废，我在 8.3 表里记为"已解决"。另外值得记一句：`:78` 的目标 `0 ≤ (conj (Faber.boundaryNormal c g t)*(Faber.boundary c g t-w)).re` 与论文 `eq:support` 的 $\Re(\overline{q}\,(h-z))$ 同形，而 `:85` 的 `change` 把它翻成"因子顺序颠倒后取实部"，同一条不等式在这 8 行里被写了两种共轭约定，这正是我在 4.3 说的"共轭方向必须手工核对"的现场。

**（v）`choose` 与 `classical`。** 素材 §4.5(v) 记"全目录 `choose` 出现 16 次"。我在同一目录按子串计数复核，**总数 16 复现**，但成分与素材的解读不同：这 16 次里只有 1 次是 `choose` 策略（`Continuation.lean:74` 的 `choose r hr E hE he hside hd using hloc`），4 次是同一个局部名字 `hchoose` 与它的投影 `.choose` / `.choose_spec`（`Continuation.lean:80,84,90,91,95`），其余在 `FaberCalculus.lean:57`、`TaylorFourier.lean:59,60,69`，是二项式系数 `k.choose i` 与 `Nat.choose_mul_factorial_mul_factorial`。⇒ 用 `choose` 这个 token 去衡量"选择公理的使用面"会高估三倍，我在 18.6 改用 `classical` 块的分布来说这件事：全目录 `classical` 命令 13 次、分布在 11 个文件（`HarmonicReflection.lean` 独占 3 次），且**没有任何一处写限定名 `Classical.choose`**（我 grep `Classical\.` 得 0 行）。⇒ 论文的"对每个边界点取相应的量"在 Lean 里落地为两种手段：`Continuation` 那一条 `choose ... using` 把逐存在性变成函数，其余地方靠 `classical` 块打开排中，让 `if`、`Finset` 上的判定和 `Decidable` 实例可用。这才是 `permitted_axioms` 里 `Classical.choice` 的真实消费面貌：**许可列表是宽的，实际使用点极少且集中**。

## 18 Lean 取证（下）：令牌普查、算术证书、正则性税与双向缺口的复测

素材的 §4.6 到 §4.9 全是统计类断言。统计最容易在两件事上失真：计数口径（行 vs 词 vs 子串）与行号漂移（版本或省略）。所以我在 `E:\math\lean\OAI\Analysis\DirectCrouzeix\` 这一个目录内、用固定口径把每一项重跑一遍：词边界计数用 `grep -ohw "TOK" *.lean | wc -l`，子串计数用 `grep -oh`，行号一律 `grep -n` 实测。结果是 **24 项令牌计数全部逐字复现**，另有 6 处需要更正（见 18.2、18.3、18.4、18.5、18.7）。我把复现的和更正的都写全，因为对我的用途来说，"哪些统计能靠一份源码复算"比"统计本身是多少"更要紧。

### 18.1 普查原表与它的密度换算

素材 §4.6 的块，我复测逐项相等（42 个 `.lean` 文件）：

```
have 970 · rw 438 · simp 339 · exact 329 · intro 226 · simpa 204 · apply 155
let 137 · obtain 99 · change 78 · refine 59 · norm_num 52 · nlinarith 44
dsimp 42 · by_cases 36 · ext 22 · convert 19 · calc 17 · positivity 16
omega 13 · classical 13 · fun_prop 11 · sorry 0 · native_decide 0
```

加上我补测的三项：`noncomputable section` **143**（素材记 143 ✓）、顶层声明合计 **390** 条（`^theorem|^lemma|^def |^abbrev|^structure|^instance` 六种起始式，其中 `theorem` 311 条）、`linear_combination` **12** 次（素材未列，见 18.4）。390 条声明里互异名字 **385** 个，即 **5 组重名**，逐组位置我在 18.10 列。

换算成每百行密度（用我实测的 7389 行做分母；素材的 7431 与它的差是 42，正好等于文件数，所以两个数是同一份源码的两种行口径，见 17.2）：

| 令牌 | 次数 | 每百行 | 读法 |
|---|---|---|---|
| `have` | 970 | 13.1 | 前向搭链，平均每 8 行一个中间命题 |
| `rw` | 438 | 5.9 | 改写密度约为 `have` 的 45% |
| `simp` | 339 | 4.6 | 与 `exact` 几乎等频 |
| `exact` | 329 | 4.5 | 结论项多数是"指名喂一条引理" |
| `simpa` | 204 | 2.8 | 加 `only [...]` 的定向 simp |
| `apply` | 155 | 2.1 | 反向目标分解只用在这里 |
| `calc` | 17 | 0.23 | 链式不等式几乎不走 `calc` |

$[分析]$ 这组比例给出的判断比素材更强：**这份形式化基本不搜索**。`have`+`exact`+`rw` 三类占了策略词汇总量的一半以上，而 `apply`/`refine`（反向策略）合计 214 次、不到 `have` 的四分之一；`simp` 里大量带 `only`（我在 9 到 12 节读到的实例都是 `simpa only [...]`、`simp only [...] at ...`）。⇒ 一个会写 Mathlib 风格证明的人不会这样分布：正常人给 `simp`/`aesop`/`library_search` 留更多权重。这个分布的形状是"先有自然语言证明，再逐句翻成目标项"的指纹，与素材 §4.5 的绕行清单同向。$[推测]$ 我没有别的的证据能把它与"由模型生成"绑定，只能说它与"逐句翻译式写作"一致。

另一件我顺手量到的事：311 条顶层 `theorem` 对 42 个文件，平均每文件 7.4 条；但装配层五个文件（`CompleteBound` 2 条、`DomainCore` 3 条、`Main`、`Model`、`Sharpness`）远低于均值，通用测度层（`BoundaryKernel`、`CircleFourier`、`KernelContraction`）高于均值。⇒ 模块质量分布偏向"库"，主定理所在的文件最瘦，这与论文把重心放在一个 130 行的 `thm:domain` 证明上是对得上的。

### 18.2 `change` 的 78 次：素材的"异常高"要改写成"装配层集中"

素材说 `change` 78 次"异常高"，给的基线是"正常 Mathlib 模块每百行 0 到 2 次"。我按这个基线换算：78 / 73.89 百行 = **1.06**，落在它自己给的正常区间内。⇒ **这个判断要撤掉。** 我保留素材列的四段原文（都是真证据），但把结论换形：`change` 的可用之处在**分布形状**，不在总量。

实测分布：单文件最多 5 次（`HolomorphicReflection.lean`、`DomainCore.lean`、`BoundaryKernel.lean`），20 多个文件各 2 到 4 次，其余为 0。⇒ 真正要紧的是那 5 次落在 `DomainCore.lean`，也就是 `thm:domain` 证明的装配文件里。逐条给原文（`DomainCore.lean` 的 `change` 行号是 34、67、76、115、128）：

```lean
34:    · change γ ≤ 2          -- γ 是 :32 的 let 名，goal 里仍是 ‖tensorPolynomial A F‖
67:    change ‖inner ℂ (hsVector Y) (T (hsVector X))‖^2 ≤ a * polynomialEnergy h F at hv
76:    change (_ ≤ a/γ^2) ∧ (_ ≤ a/γ^2) at hdiag
115:   change γ ≤ 2            -- 收尾再认一次同一个 let 名
128:   change IsUnit (scalarMatrixPolynomial (b k)).leadingCoeff
```

`:67` 与 `:76` 是论文侧的两处直译：前者把 `cross_boundary_estimate` 的一般形式实例化到 $G:=F$ 之后，目标的左端在 Lean 里是奇异对写出的 $\langle y,\,T x\rangle$，右端是 $a\cdot E_h(F)$，而论文的式子（`main.tex:341-343` 一带）把左端写成 $\gamma^2$；`change` 在这里做的事就是"承认这两个式子数学相同、语法不同"。后者用模式匹配把 `singular_diagonal_estimates` 的合取结论认成"$\le a/\gamma^2$ 与 $\le a/\gamma^2$"，对应论文第 343 行的两条对角界。

`DomainBound.lean` 的那一处我在 17.6(iv) 已经逐字复核过，原文带 `Faber.` 限定前缀：

```lean
85:    change 0 ≤ ((Faber.exterior c g (Faber.unitPoint t)-w)*conj (Faber.boundaryNormal c g t)).re at hh
86:    simpa only [Faber.boundary,mul_comm] using hh
```

$[分析]$ 同族技巧其实有三种，素材只数了 `change`：`show … from`（`CompleteBound.lean:70` 的 `rw [show M = ‖polynomialValue B z‖ from he.symm]`）、`simpa only [let名]`（`DomainCore.lean:44` 的 `simpa only [X,Y,hsVector_matrixify] using hxy`）、以及 `let : NeZero n := ⟨Nat.ne_of_gt hn⟩`（`DomainCore.lean:30-31`）这种"给类型类补一个局部实例"。三者的共同动机都是 let 绑定的名字进不了 goal。⇒ 我因此把 `change` 的 78 与 `simpa` 的 204 合起来读：**这份形式化有一半的工作量在记号对齐上**，而记号对齐的工作量恰好与论文使用局部名字（$\gamma$、$a$、$P$、$Q$、$M$、$L$）的次数成正比。素材"论文一行 = Lean 一步"的判断在这一点上我完全同意，但证据要换成"名字对齐类策略词（`change`+`dsimp`+带 let 名的 `simpa only`）合计超过 250 次"。

### 18.3 零分流：`by_cases` 36、`by_contra` 10，以及素材记错的那一处

实测 `by_cases` 36 行，完整分布（我逐行列出）：`InverseExterior` 5、`HarmonicReflection` 2、`HolomorphicReflection` 4、`DividedDifferences` 3、`TaylorFourier` 3、`FaberEnergy` 3、`Convexity` 2、`NormalFamilies` 2、`BoundaryKernel` 1、`CompactIntegrals` 1、`ConformalCollar` 1、`DomainCore` 1、`Duality` 1、`ExteriorCollar` 1、`ExteriorMapping` 1、`PoissonBoundary` 1、`Resolvent` 1、`SingularPairs` 1、`SupportNets` 1（合计 36 ✓）。

素材把"除法前的零分流"三处记为 `DomainCore.lean:33`、`DomainCore.lean:70`、`Duality.lean:40`。**第一、第三处复现**：

```lean
DomainCore.lean:33:  by_cases hγ0 : γ = 0
DomainCore.lean:34:  · change γ ≤ 2 ; rw [hγ0] ; norm_num
Duality.lean:40:     by_cases hs0 : s = 0
```

第二处要更正：`DomainCore.lean:70` 是 `by_contra hnot`，不是 `by_cases`（`have hapos : 0 < a := by` 从 `:65` 起，反证在 `:70`，`nlinarith [sq_pos_of_pos hγ]` 在 `:74` 收尾）。⇒ 分流该分两类统计：**正面的分母分流**（`by_cases`，36 处里绝大多数是 $u=0$、$v=0$、$u=v$、$k=0$、$t=s$ 这种判定）与**"必须先证严格正才能除"的反证**（`by_contra`，实测 10 处：`Continuation` 1、`DiskMapping` 2、`DomainCore` 1、`InverseExterior` 4、`NormalFamilies` 2）。两类合起来 46 处，其中在主链上的是 3 处。

三处主链分流对应论文的三句话，我把对应关系钉死：

1. `DomainCore.lean:33` 的 $\gamma=0$ ⇔ 论文 `main.tex:330` 一带 "There is nothing to prove if $\gamma=0$"（我在 9.2 逐字引过）。Lean 的分支体是 `change γ ≤ 2; rw [hγ0]; norm_num`：把 `0 ≤ 2` 交给 `norm_num`。⇒ 论文的一句"无内容可证"= Lean 的 3 行。
2. `DomainCore.lean:65-74` 的 $a>0$ ⇔ 论文的"由于 $F[A]\ne0$，交叉能量 $a$ 为正"。**这里我要把素材那句"全文最容易被读者跳过、但形式化里必须显式处理"补成一个机制说明**：$a>0$ 在 Lean 里不是礼貌性假设，它在 `:116` 被消费：

```lean
111:  have hb : 2 * a ≤ 8*a/γ^2 := by simp only [mul_div_assoc] at hPE hQE ⊢ ; linarith
114:  have hmul := (le_div_iff₀ (sq_pos_of_pos hγ)).mp hb
116:  have hg2 : γ^2 ≤ 4 := by nlinarith [hapos]
117:  nlinarith
```

`2a\le 8a/\gamma^2$ 要变成 $\gamma^2\le4$，两边必须除以 $2a$；$a=0$ 时 `hb` 退化成 $0\le0$，信息归零，$\gamma$ 的上界就此断链。⇒ **$a>0$ 是这台机器唯一的"非退化闸门"**，论文用一句话带过，Lean 用 10 行反证造它，方法是从 `cross_boundary_estimate` 实例化到 $G:=F$（`:66`）后把 $\gamma^2\le a\cdot E_h(F)$ 与 $a=0$ 合出 $\gamma^2\le0$（`:73`），再由 $\gamma>0$ 矛盾（`:74`）。我在 10.7 说过 $\gamma$ 的正性来自 `exists_singular_pair` 的 $x,y$ 单位化，这里闭合：$a>0$ 的证据反过来用了 $\gamma>0$。
3. `Duality.lean:40` 的 $s=0$ ⇔ 论文第 264 行附近"两边除以 $s$"（`prop:coefficients` 的证明）。⇒ 素材的判断我原样保留：**这一处读者的滑动最严重，因为论文把三个零情形写成了三个副词（"若平凡则无事""由于非零""除以"），Lean 把它们写成三个真正的分支，其中一个还要反证。**

补一条我自己找到的分流，素材未列：`CompactIntegrals.lean:182` 的 `by_cases huv : u = v` 与 `DividedDifferences.lean:108,110,112` 的三连分流（`u=0`、`v=0`、`u=v`）。⇒ 论文第 229 行的 "For distinct $\lambda,\mu\in\T$"（我在 6.5 引过）在 Lean 侧被展开成 4 个分支（distinct 的对角补集 $\lambda=\mu$、加上两个零点），这就是"distinct"这个词的形式化代价。

### 18.4 算术证书：`nlinarith` 44 的落点、四条原文与 `positivity` 的真实职责

实测 `nlinarith` 的按文件分布：**`Convexity.lean` 12、`DiskMapping.lean` 9**、`PoissonBoundary.lean` 4、`DomainCore.lean` 3、`OuterApproximation.lean` 3、`ExponentialLevels.lean` 2，其余 11 个文件各 1（合计 44 ✓）。

$[分析]$ 素材说 `nlinarith` "集中在常数链"，实测要更正：**最集中的两处离常数链最远**。`Convexity.lean` 的 12 次属于附录里的 Toeplitz–Hausdorff 重证（三维 Bloch 坐标的平方和展开、$\R^3\to\R^2$ 秩亏的算术），`DiskMapping.lean` 的 9 次属于圆盘映射与领子宽度。主链 `DomainCore.lean` 只有 3 次。⇒ 正确说法是：`nlinarith` 出现在**论文写"整理即得"或"由平方展开即得"的地方**，而这两类话在附录与领子里比在主定理里多。

素材点名的三条证书我全部找到，并给出精确行号（素材给的是无行号引用）：

```lean
Sharpness.lean:50              nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]
OuterApproximation.lean:91     linarith [Real.add_one_le_exp (N+1)]
DomainCore.lean:116            nlinarith [hapos]
```

我另补两条同样能"抄进笔记"的：

```lean
DomainCore.lean:74             nlinarith [sq_pos_of_pos hγ]
BoundaryEnergy.lean:88         nlinarith [hsSq_nonneg (fourierCoeff M 0)]
```

`Sharpness.lean:50` 的上下文我整块读过（`:40` 到 `:50`）：先把 `inner ℂ u (toEuclideanCLM sharpnessMatrix u) = 2 * star (u 0) * u 1` 用 `simp [...] ; ring` 算出来，再 `norm_mul, norm_star`、`norm_num`，最后一条 `nlinarith [sq_nonneg (‖u 0‖ - ‖u 1‖)]` 收 AM-GM。⇒ 素材说这是 AM–GM ✓，我补一句：唯一的"引料"是 $(\|u_0\|-\|u_1\|)^2\ge0$，也就是说 Lean 证 $\|A\|=2$ 时下界用的中间量恰好是"两个坐标范数相等"，与我在 12.4 手算的等号条件（$x=\frac{1}{\sqrt2}(1,1)$）一致。$[推测]$ 这条引料的形状暗示了等号情形，作者（或模型）在选证书时是知道往哪里收的。

这三条在论文侧的对应位置我一并钉出（素材只给了 Lean 侧）：`sq_nonneg (‖u 0‖ - ‖u 1‖)` 对应 `main.tex:529-531` 的最优性讨论（那里论文说 $2$ 不可改进、举 $[[0,2],[0,0]]$ 与 $P(z)=z$，我在 12.4 逐句对过）；`Real.add_one_le_exp (N+1)` 对应 `main.tex:464-484` 的"$t$ 取得足够大使得 $|D_\delta|e^{-t\delta}<1$"（我在 11.2 补步 2 手算过这个 $N/e^{N+1}$）；`nlinarith [hapos]` 对应 `main.tex:355` 前后"由于 $F[A]\ne0$"那句（见 18.3 第 2 条）。⇒ 三处"论文一句话、Lean 一条证书"的映射落在**互不重叠的三段**上，所以这三条证书是三次独立的翻译，同一句话没有被数两次。

`hsSq_nonneg` 我另数了一次：全目录 **13** 次（词边界实测），是这份形式化里被点名最多的非负性引理。⇒ 18.4 上面那条"`positivity` 不碰块正性"的结论因此有配对证据：**策略 16 次全部用在尺度参数上，具名引理 13 次用在非负性上**，两边的分工是干净的，没有一处靠 `positivity` 自动搜出数学结构给的正性。

`BoundaryEnergy.lean:88` 落在 `anti_cross_energy`（`:72` 起）的证明体内。素材说这一处的 `nlinarith` 是"anti_cross_energy 丢交叉项"，我给机制：$\int\|M+L^*\|^2$ 展开出 $\int\|M\|^2+\int\|L\|^2+2\Re\int\langle M,L\rangle$，而零频项 $\int M = M$ 的 0 频 Fourier 系数按 `hC0` 是 $Y^*X$，被 `hsSq_nonneg (fourierCoeff M 0)` 托住非负。⇒ "丢掉交叉项"在 Lean 里是一条具名假设，这就是所谓"作者心里的隐藏中间不等式"的最直接样本。

`positivity` 只有 16 次，我把 16 处全列（素材只给了总数）：

```
AnalyticCharts.lean:142   CompleteBound.lean:75      ConformalCollar.lean:124  ConformalCollar.lean:142
Continuation.lean:50      Continuation.lean:53       DiskMapping.lean:215      HolomorphicReflection.lean:86
InverseExterior.lean:56   InverseExterior.lean:70    KernelContraction.lean:173 OuterApproximation.lean:71
OuterApproximation.lean:75  OuterApproximation.lean:79  PoissonBoundary.lean:70  SupportNets.lean:109
```

$[分析]$ 这 16 处没有一处用于"块正性"或"能量非负"：它们全在给**选取的尺度参数**证正（$\rho=M+\varepsilon/2>0$、$\delta>0$、$N\ge0$、$C\ge0$、$r>0$、球半径 $S/3$、$r/3$）。⇒ 素材的结论因此可以加强一层：论文里所有"由正定性可知"（$R+R^*\succcurlyeq0$、$K\ge0$、$\|P+P^*\|^2\ge0$）在 Lean 是**逐处指名**的自定义引理（`hsSq_nonneg`、`re_trace_mul_nonneg`、`integral_nonneg`、`positive_block_hsSq`、`finite_negative_bessel`），`positivity` 只承担几何参数的正性，不承担数学结构给出的正性。⇒ 就口径而言：**这台形式化没有把"非负性"外包给策略，全部自己命名**。这条对读论文有用：论文里 5 处"由正定性"，Lean 里对应 5 个具名引理，一一对得上，无遗漏。

`norm_num` 52 与 `calc` 17 的搭配我按上面表给过密度。补一条 `linear_combination` 的实测（素材未统计）：12 次，样本 `CompactIntegrals.lean:191` 的 `linear_combination -hm`，用来把 `chordIntegral_deriv_mul`（`:162-177`，即 $\int_0^1 (\operatorname{deriv} f)(\text{chord})\cdot(v-u)=f(v)-f(u)$）配成 `dslope` 形式。⇒ 论文"$\rho=\ldots$ 代入即得"这类**常系数线性组合**的活儿，Lean 有专门武器；这解释为什么 `ring` 在目录里只出现在 `dsimp`+`ring`（`CompleteBound.lean:97`）与 `BoundaryEnergy.lean:133`、`PolynomialEnergy.lean:211,214` 这种有限几处：环上的乘积恒等式与带负号的线性组合被分派给了两个不同策略。

### 18.5 正则性税：`fun_prop` 11 处、可积桥引理的真实次数、以及"整个目录里没有 $2\pi$"

素材 §4.6 关于正则性的这一段我逐项复核，一处更正、其余复现，并补出可复制的清单。

实测：`continuity` **0**、`measurability` **0**、`IntervalIntegrable` **1**、`fun_prop` **11** ✓、`circleMeasure` **33** ✓。`fun_prop` 的 11 处位置：

```
CompactIntegrals.lean:83, 114, 134, 166
DividedDifferences.lean:43, 55, 66
ExponentialLevels.lean:149     FaberCalculus.lean:53
PoissonBoundary.lean:76        TaylorFourier.lean:54
```

$[分析]$ 11 处里 4 处在 `CompactIntegrals`（都是 $t\mapsto(1-t)u+tv$ 这条弦的连续性），3 处在 `DividedDifferences`，而且那 3 处是**同一个项逐字复制**：

```lean
DividedDifferences.lean:43,55,66   (show Continuous (fun t : Parameter => ((1-(t:ℝ) : ℝ):ℂ)) by fun_prop)
```

⇒ 三条导数引理（左、右、双向）各带一份同样的连续性证明。这与 18.6 要讲的"每个分片自带 preamble"是同一件事的两种表现：**分片不知道隔壁已经有这个引理**。剩下 4 处（`ExponentialLevels:149` 的 `Continuous y := by fun_prop`、`FaberCalculus:53`、`PoissonBoundary:76` 的 $z\mapsto C(R^2-\|z\|^2)$、`TaylorFourier:54` 的 `iteratedDeriv_fun_mul ... (by fun_prop)`）是唯一的四处"顺手证连续"。

`IntervalIntegrals` 那一处的位置我补上：`CompactIntegrals.lean:168` 的 `have hi : IntervalIntegrable (fun t => deriv f (chord u v t) * (v-u)) volume 0 1`，同一条证明里紧接 `ContinuousOn.intervalIntegrable`（`:169`）。⇒ **全目录只在这一个地方需要"区间可积"概念**，就是在弦上跑牛顿 莱布尼茨公式那一步（`chordIntegral_deriv_mul`）。论文侧对应的是 `lem:exterior-collar` 证明里的实线段积分（我在 5.4 补步 6 处理过的那一步，即 Cauchy 定理的实参数化版本）。所以"论文里一句话、Lean 里一整层"的又一例：一个微积分基本定理，在 Lean 里要有 `Parameter := Set.Icc (0:ℝ) 1`（`CompactIntegrals.lean:73` 的 abbrev）、`chord_mem`（靠 `Convex ℝ s`，:77-79）、连续性与可积性两条桥，才换来 `hasDerivAt_chordIntegral_left`。

可积桥引理的更正与精确分布：`integrable_of_continuous_compact` 声明在 `CompactIntegrals.lean:19-23`，证明体只一行 `hf.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace f)`；**出现次数实测 15（素材 §4.6 记 18）**，分布 `KernelContraction` 7、`BoundaryKernel` 5、`CompactIntegrals` 2（含声明本身与 `:66` 的内部一次）、`FaberEnergy` 1。姊妹引理 `continuous_integrable_compact` 实测 22 处，其中 2 处是重复声明（见 18.6），真实使用 20 次。

三层复合喂引理的那一处我逐字复核（`PolynomialEnergy.lean:101-104`）：

```lean
101:  have hint (H : MatrixPolynomial m) :
102:      Integrable (fun t => hsSq (matrixPolynomialValue (h t) H)) circleMeasure :=
103:    continuous_integrable_compact _
104:      (continuous_hsSq.comp ((continuous_matrixPolynomialValue H).comp hh))
```

⇒ 论文"$t\mapsto\|F(h(e^{it}))\|^2$ 连续故可积"这一句，在 Lean 是三层函数复合各配一条具名连续性引理（`continuous_matrixPolynomialValue`、`continuous_hsSq`）再 `.comp` 两次。$[分析]$ 这一处出现在 `polynomialEnergy_mul_le` 的证明体内部（`:97` 起），也就是"能量在左右乘下不增"那条引理里，而**该引理的两个方向共用同一个 `hint`**：`:106` 与 `:113` 两个分支各自 `apply integral_mono (hint _) (hint _)`。⇒ 可积性在 Lean 里是 `integral_mono` 的前提，被算了两次（每个方向一次），而论文里"可积"这两个字只出现于段落开头一次。这是"论文免费的、Lean 收费"的定量样本：一次 $\leftrightarrow$ 两次显式项。

$\pi$ 与归一化测度。实测全目录含 `Real.pi` 的行只有两行，都在 `HolomorphicReflection.lean`：

```lean
82:  have hip : 0 < ∫ θ in (0 : ℝ)..2 * Real.pi, u (circleMap 0 R θ) := by
86:    · refine ⟨Real.pi / 2, ⟨by positivity, by nlinarith [Real.pi_pos]⟩, ?_⟩
```

⇒ 整个能量与边界机器（`BoundaryEnergy`、`PolynomialEnergy`、`DomainCore`、`CircleFourier`）**一次都没有写 $\pi$**，$2\pi$ 被吞进 `circleMeasure` 的定义里（33 次调用全部用这个名字）。我按子串计数会得到 3，第三处是 `Real.pi_pos`（引理名带前缀），任何用 `grep -o "Real.pi"` 的人都会多算一次，这条口径要记下。$[分析]$ 与论文对照：论文在第 202 到 204 行明写 $K=1+s+\bar s$ 的积分"恰好是 1"，把归一化当作需要强调的数学事实；Lean 侧把归一化放进测度定义，于是"恰为 1"变成类型层面的默认，代价是**读者从 Lean 看不出这条归一化有多重要**。这条我在 6.4 从论文侧给过判断，这里给计数证据：**"没有 $\pi$"就是"归一化已被吸收"的指纹**。

### 18.6 源码卫生：配对表、空壳、重复 preamble 与 universe 碎片

素材 §4.7 这一节的五条我全部复测，其中第一条的数字要更正，第四条的两处范围要更正。

**（1）配对表复现（逐行实测）。** 我把素材的五行扩到八行（后三行是我补的，同一口径）：

| 文件 | `noncomputable section` | `namespace` | 裸 `end` | 具名 `end` | 开/闭 |
|---|---|---|---|---|---|
| `CompleteBound.lean` | 9 | 2 | 9 | 2 | 11/11 |
| `DomainBound.lean` | 9 | 3 | 9 | 3 | 12/12 |
| `Convexity.lean` | 9 | 3 | 9 | 3 | 12/12 |
| `OuterApproximation.lean` | 9 | 4 | 9 | 4 | 13/13 |
| `ExponentialSupport.lean` | 9 | 3 | 9 | 3 | 12/12 |
| `SupportNets.lean` | 9 | 3 | 9 | 3 | 12/12 |
| `ExteriorCollar.lean` | 3 | 4 | 3 | 4 | 7/7 |
| `DomainCore.lean` | 2 | 3 | 2 | 3 | 5/5 |

计数口径：`^noncomputable section`（行首）、`^namespace`、`^end$`（裸）、`^end [A-Za-z]`（具名）。裸 `end` 与 `noncomputable section` 一一对开一一对闭，**八个文件全部平衡**（9/9/9/9/9/9/3/2），这是"每个分片以一个 section 开、以一个裸 `end` 闭"的直接证据 ✓ 与素材一致。

**（2）`CompleteBound.lean` 的前言比素材说的更肥。** 实测：`noncomputable section` 出现在行 `5, 9, 15, 21, 27, 33, 39, 45, 51`，共 **9** 个（素材记"第 5 到 53 行有 7 个"）；`open Set Filter Metric` **5** 次、`open scoped Topology ComplexConjugate` **6** 次（素材记"6 组完全相同的块"）；`namespace OAI` 在 :3、`namespace DirectCrouzeix` 在 :57，实质声明只有 2 条（`convex_numericalRange` :61、`complete_crouzeix` :65）。⇒ 更正后的比例更陡：**前言块 9 个对声明 2 条**。而且这些块之间内容全空（行 9 到 15 之间只有一条 `open scoped`），即"开了一个非计算段，什么都没写，再开一个"。$[分析]$ 这个残留只能有一个来源：每个分片自带完整前言，拼接时既没去重也没检查空段。它支持素材的结构性推断（Lean 模块边界 $\approx$ 生成任务边界），我把它推进一格：**分片边界比模块边界更细**，因为同一模块内部就有 9 个前言块。

顺带把素材"6 组完全相同的块"这个数与我实测的 5 组对上：`CompleteBound.lean:23/29/35/41/47` 五行是逐字相同的 `open Set Filter Metric`，而 `:17` 是同一块的**词序变体** `open Filter Metric Set`（下一行 `:19` 仍是 `open scoped Topology ComplexConjugate`）。⇒ 素材数的 6 组包含这一处变体，我数的 5 组是严格逐字。两者都对，只是口径差；这类"同义不同序"的 `open` 我在 `DomainBound.lean:61`（`open Set Filter Metric`）与 `:119`（`open Set Metric`，少一个 `Filter`）之间也见到一次，说明分片自带的 preamble 是**模板生成的、不是复制粘贴的**（复制粘贴会连词序一起抄）。

**（3）三处空壳 namespace 复现**，逐字抄：

```lean
DomainBound.lean:117-121      namespace DirectCrouzeix / open Set Metric / end DirectCrouzeix
ExteriorCollar.lean:108-112   namespace Conformal / end Conformal
DomainCore.lean:161-163       namespace DirectCrouzeix.Faber / end DirectCrouzeix.Faber
```

⇒ `DomainBound` 那处连 `open` 都写了，然后一个声明都没有；`ExteriorCollar` 那对是最纯粹的空壳（`namespace Conformal` 里空）。这三处是拼接的关节，读者可以据此反推：`DomainBound.lean` 至少由 3 个分片装成（`:59` 的 `namespace DirectCrouzeix` 有内容，`:117` 的没有），`DomainCore.lean` 至少 3 个（`:161` 空、前面两个非空）。

**（4）同名引理的两份拷贝复现。** 全目录 390 条声明对 385 个互异名字，即 5 组重名（另两组见 18.10），测度论这三组的六个行号我全给：

```
CircleFourier.lean:18   continuous_integrable_compact      KernelContraction.lean:50   同名的另一份
CircleFourier.lean:24   continuous_integral_compact        KernelContraction.lean:56   同名的另一份
CircleFourier.lean:33   markov_kernel_contraction          KernelContraction.lean:65   同名的另一份
```

两条声明的 universe 参数不同（`u_47..u_54` 对 `u_119..u_126`），⇒ 这不是 import 复用，是两份独立产出的文本，各自在自己的 `α/β/E` 上泛型化。素材说"两块是并行产出的，各自补了自己需要的测度论小工具"✓，我的证据更强：**它们连泛型变量名都各起了一套**。

**（5）universe 碎片的全表与两处更正。** 实测 42 个文件里 **23 个**有 `^universe` 行、19 个没有；编号跨度 `u_1` 到 `u_145`。素材给了四条样本，其中两条范围偏小：`Duality.lean:5` 实为 `u_41 u_42 u_43 u_44 u_45`（5 个，素材记 `u_41..u_43`），`BoundaryEnergy.lean:5` 实为 `u_73` 到 `u_86`（14 个，素材记 `u_81..u_86`）。`DomainBound.lean:5` 的 `u_144 u_145` 与 `Sharpness.lean:5` 的 `u_46` 复现 ✓。我把整张排序表压缩给出（起点到终点）：

```
PositiveBlocks u_1..u_7 | HilbertSchmidt u_8..u_25 | SingularPairs u_37..u_40
Duality u_41..u_45 | Sharpness u_46 | CircleFourier u_47..u_64
BoundaryEnergy u_73..u_86 | CompactIntegrals u_87..u_93
TaylorFourier u_94..u_105 | FaberPolynomials u_106..u_107 | BoundaryKernel u_108..u_116
KernelContraction u_117..u_128 | FaberEnergy u_128..u_129 | FaberCalculus u_129..u_130
NormalFamilies u_131 | HarmonicReflection u_132 | AnalyticCharts u_133..u_135
ExponentialLevels u_135..u_137 | BoundaryParametrization u_137 | ExteriorMapping u_138..u_139
Convexity u_140..u_142 | ExponentialSupport u_143 | DomainBound u_144..u_145
```

$[分析]$ 比素材的"同一批处理生成"更有用的是**相邻文件共享尾号**这个现象：`KernelContraction` 的上界 `u_128` 与 `FaberEnergy` 的下界 `u_128` 同号；`FaberEnergy` 的 `u_129` 与 `FaberCalculus` 的 `u_129` 同号；`AnalyticCharts` 的 `u_135` 与 `ExponentialLevels` 的 `u_135` 同号；`ExponentialLevels` 的 `u_137` 又与 `BoundaryParametrization` 的 `u_137` 同号。⇒ 全局计数器在文件之间是**接龙且偶尔重叠**的（前一个文件分配完、下一个文件读到的计数器尚未推进），这比"编号不连续"更精确地描述了生成顺序。$[推测]$ 若这个推断成立，universe 表本身就是模块生成顺序的记录，而我上面这张排序表近似还原了它：`PositiveBlocks`（`u_1..`）最早，`DomainBound`（`u_144..145`）最晚；有趣的是最晚的是**装配层**，而最早就有 `Sharpness`（`u_46`）与 `CircleFourier`（`u_47..64`）。这与素材 §4.1"模块拓扑 $\approx$ 论文结构"的判断相容：先写零件、最后写主定理。
$[推测]$ 23 个有泛型参数的文件对 19 个没有的（实测 `grep -L "^universe"`），后者是：`CompleteBound`、`ConformalCollar`、`Continuation`、`DiskMapping`、`DividedDifferences`、`DomainCore`、`ExteriorCollar`、`ExtremalEmbedding`、`HolomorphicReflection`、`InverseExterior`、`Main`、`Model`、`NumericalRange`、`OuterApproximation`、`PoissonBoundary`、`PolynomialCalculus`、`PolynomialEnergy`、`Resolvent`、`SupportNets`。⇒ 我把它当一条可用判据：**带 universe 的文件是在抽象测度空间上陈述的引理库（`α`、`β`、`E` 三个泛型变量反复出现），不带的文件则把类型钉死在 $\C$、`Fin n`、`Matrix`、`BoundaryCircle` 上**。$[分析]$ 这条判据的反例我核过一个：`PolynomialEnergy.lean` 与 `PoissonBoundary.lean` 都有积分、都不带 universe，因为它们的积分变量类型固定为 `BoundaryCircle`（= 单位圆参数化）与 $z\in\C$。⇒ 所以真正的分界落在"这条引理的陈述是否要跑在 $\C$ 之外的空间上"这一条上；跑在 $\C$ 上的全部单态化，跑在抽象 $\alpha$ 上的才被泛型化。这个区分对读论文有用：论文侧的测度论只用到圆周与紧集，从未离开 $\C$，因此 Lean 侧一半模块是"专属装配"，只有 `CircleFourier`、`BoundaryKernel`、`KernelContraction`、`CompactIntegrals` 这几处真的把空间泛型化，而它们恰好是素材 §4.8 里"论文未强调、Lean 多出"的那批模块的家。我 17.2 的模块分层表可以据此再切一刀。

**（6）工具链与可编译性的口径（原样保留素材的告诫）。** `lean-toolchain` = `leanprover/lean4:v4.34.1`；`lakefile.lean` 第 85 到 86 行 `require mathlib from git … @ "d13f23b723b8a846827a245b89c10fc7d3f11612"`；`patches/` 有 24 个补丁、**没有一个是 DirectCrouzeix 相关**（与 `formalization.yaml` 的 `enable_nolint: true` 一致，我 17.1 记过）；`E:\math\lean\.lake` 不存在。⇒ **我不能写"已编译通过"**，能写的只有：源码 0 `sorry`（实测）、允许的公理三项、无第三方补丁依赖。素材这条我在 17.1 与这里各钉一次，因为它是我这份笔记里唯一一处"配置与源码支持不了更强的断言"。

### 18.7 双向缺口：Lean 没有的、Lean 多出的，以及"两侧乘积"的结案

**Lean 没有对应（素材四条，我原样保留并加一条）：** 论文第 74 到 112 行的 "Earlier bounds and related arguments" 史段（我在 14 节逐句处理）、`prop:coefficients` 里权重 2 是否最优的讨论（5.2 节那条）、摘要与导言的措辞差（`asks whether` 对 `resolves`，我在 15 节记过）、`figures/normal.tex` 那张示意图（Lean 里 `eq:support` 的对应物 `expLevel_holomorphic_support` 没有图形对应物）。我加第五条：**论文第 320 到 321 行的 "Although we do not know whether this conformal-map formulation is itself an optimal route..." 这类自陈（`we do not know`）**，Lean 侧任何文件都没有与之语义对应的注释或 `-- TODO`，形式化里没有"路线未必最优"这种态度的位置。$[分析]$ 前四条里最要紧的是图形：**形式化把图判为纯冗余**，这与我 15.4 从 LaTeX 源码侧得到的判断（唯一一张图、无 `\input` 交叉引用、画的是支撑线关系）互相独立地指向同一结论：证明的重心在 $u$ 平面的支撑线关系上，不在领子的几何上。

**Lean 有 / 论文未强调（素材四条 + 我的结案）：** `markov_kernel_contraction`（两份拷贝，见 18.6(4)）、`kronecker_pow_one`（`PolynomialCalculus.lean:73`）、`tensorPolynomial_mul`（`PolynomialCalculus.lean:98`）、`hsSq_mul_le` 与 `hsSq_mul_le_right`（`HilbertSchmidt.lean:82, 89`，即 $\hsSq{FG}\le\hsSq F\cdot\|G\|^2$ 与 $\hsSq{GF}\le\|G\|^2\cdot\hsSq F$）。素材用它们把"on each side 是修辞还是必需"这个问题挂起来，我在这一节结案。

`polynomialEnergy_mul_le`（`PolynomialEnergy.lean:97-100`）的陈述是**一个合取**：

```lean
97: theorem polynomialEnergy_mul_le {m : ℕ} (h : BoundaryCircle → ℂ) (hh : Continuous h)
98:     (F G : MatrixPolynomial m) (hF : ∀ t, ‖matrixPolynomialValue (h t) F‖ ≤ 1) :
99:     polynomialEnergy h (F * G) ≤ polynomialEnergy h G ∧
100:    polynomialEnergy h (G * F) ≤ polynomialEnergy h G
```

消费它的地方，我把行号按实测给出（素材记 201 到 202，那是**两个乘积被造出来的地方**；`.1/.2` 的**消费点**在 206 与 207）：

```lean
201:    have hl := hv (F * faberPolynomial b C)          -- 造 FG
202:    have hr := hv (faberPolynomial b C * F)          -- 造 GF
205:    have hm := polynomialEnergy_mul_le h hh F (faberPolynomial b C) hF
206:    have hl' := hl.trans (mul_le_mul_of_nonneg_left (hm.1.trans (hupper N C)) ha)
207:    have hr' := hr.trans (mul_le_mul_of_nonneg_left (hm.2.trans (hupper N C)) ha)
208:    constructor
211:      convert hl' using 1 ; ring                       -- 左支收尾
214:      convert hr' using 1 ; ring                       -- 右支收尾
```

⇒ 素材把 `convert … using 1 ; ring` 记成"`DomainBound.lean:211/213` 在 `PolynomialEnergy`"，两处都要更正：行号在 `PolynomialEnergy.lean:211` 与 `:214`，而 `DomainBound.lean` 只有 141 行、全文件不含一次 `convert`（实测 `convert` 的 19 次分布在 8 个文件，`DomainBound` 与 `OuterApproximation` 都不在其中，素材提的 `OuterApproximation.lean` 的 `convert!` 也不存在）。

$[分析]$ 结案的逻辑：论文 `main.tex:111-112` 那句 `Here a Faber coefficient estimate controls the two diagonal functionals obtained by placing a test polynomial on each side of the polynomial being estimated.` 里的 "on each side"，我在 10.2 与 10.6 曾按"可能是修辞"打折，并在 10.6 用 $\sqrt2$ 反事实检验说少一个对角块时 trace 步本身失效。Lean 侧给的是**文本性证据**：合取命题的两支（`hm.1`、`hm.2`）分别喂给两个结论（`:206`、`:207`），而这两个结论正是 `singular_diagonal_estimates` 陈述里的合取两支（我在 `:195` 与 `:197` 读到的那两条 $\le (a/\gamma^2)\cdot\sum_k \texttt{faberWeight } k \cdot \texttt{hsSq}(C_k)$）。⇒ **"两侧"是结构要求，修辞解释被排除。** 我在 10.6 的问号在此撤掉，我把这条升格为"Lean 侧对本论文最强的一次独立确认"：它确认的对象是**论证的最小形状**（两条对角泛函，缺一不可），数值 2 那边论文本来就自己给了，机器在这里没有加值。

顺带补一条素材与我在 17 节都没写全的有限性证据：`Fintype ι` 出现在 `DomainBound.lean:64` 与 `:100`（两条定理各带一次，分别是 `expLevel_domain_bound` 与 `expLevel_domain_bound_scaled`），⇒ 指数和表示必须**有限项**。论文侧对应的是 `lem:approx` 造出来的域自然是有限 $\nu$ 的和；而 Lean 还额外把"任意矩阵多项式可写成有限 Faber 和"做成显式定理 `faber_expansion_of_degree`（`DomainCore.lean:119-121`，陈述为 $\exists N\,C,\ G=\texttt{faberPolynomial } b\ C$，证明体在 `:122` 起开 `classical`、造 `Polynomial.Sequence`、用 `S.span_degreeLT`），把论文里"$F$ 是多项式所以截断有限"这句显然话变成 40 行工作。⇒ 两处有限性合起来说明：**`thm:domain` 的 Lean 版不覆盖"解析凸域 = 可数项和的 sublevel"这种定义**。素材 §4.8 末尾说这是"可写的一句覆盖面诚实说明"，我照抄并把它落到行号。

### 18.8 `CompleteBound.lean:65-97`：33 行主定理的逐句读法

素材 §4.9 给的骨架（33 行完成主定理）我逐行复测，除省略号外全部相符；我把完整文本按行给出，并补三段素材没写的内容。

```lean
61: theorem convex_numericalRange {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
62:     Convex ℝ (numericalRange A) :=
63:   Geometry.convex_quadratic_range (Matrix.toEuclideanCLM (n := Fin n) (𝕜 := ℂ) A).toLinearMap
65: theorem complete_crouzeix : UniversalBound 2 := by
66:   intro n m d hn hm A B
67:   let M := rangeMaximum A B
68:   have hM : 0 ≤ M := by
69:     obtain ⟨z,hz,he⟩ := rangeMaximum_attained hn A B
70:     rw [show M = ‖polynomialValue B z‖ from he.symm]
71:     exact norm_nonneg _
72:   apply le_of_forall_pos_le_add
73:   intro ε hε
74:   let ρ := M+ε/2
75:   have hρ : 0 < ρ := by dsimp [ρ]; positivity
76:   have hMρ : M < ρ := by dsimp [ρ]; linarith
77:   let V := {z : ℂ | ‖polynomialValue B z‖ < ρ}
78:   have hV : IsOpen V := isOpen_lt (continuous_polynomialValue B).norm continuous_const
79:   have hWV : numericalRange A ⊆ V := by
80:     intro z hz
81:     exact lt_of_le_of_lt (norm_polynomialValue_le_rangeMaximum A B hz) hMρ
82:   obtain ⟨δ,hδ,hδV⟩ := (isCompact_numericalRange A).exists_thickening_subset_open hV hWV
83:   obtain ⟨D,v,b,hW,hc,hnear⟩ := Geometry.exists_exponential_outer (isCompact_numericalRange A)
84:     (numericalRange_nonempty hn A) (convex_numericalRange A) hδ
85:   have hbound : ∀ z, Geometry.expLevel v b z ≤ 1 →
86:       ‖matrixPolynomialValue z (coefficientPolynomial B)‖ ≤ ρ := by
87:     intro z hz
88:     rw [matrixPolynomialValue_coefficientPolynomial]
89:     apply le_of_lt
90:     apply hδV
91:     obtain ⟨w,hw,hzw⟩ := hnear z hz
92:     exact mem_thickening_iff.mpr ⟨w,hw,by simpa only [dist_eq_norm] using hzw⟩
93:   have hh := expLevel_domain_bound_scaled hn hm A v b hc hW (coefficientPolynomial B) hρ hbound
94:   rw [tensorPolynomial_coefficientPolynomial] at hh
95:   calc
96:     ‖tensorEvaluation A B‖ ≤ 2*ρ := hh
97:     _ = 2*rangeMaximum A B+ε := by dsimp [ρ,M]; ring
```

素材给的三点我复现并确认：**(a) $\varepsilon/2$ 的配平**（$:74$ 与 $:97$ 合起来让右端恰为 $2M+\varepsilon$；素材的判断"$\varepsilon$ 随便取在 Lean 里必须配平常数"✓，我从数值上核一遍：$2\rho=2M+\varepsilon$，若取 $\rho=M+\varepsilon$ 则得 $2M+2\varepsilon$，对 `UniversalBound 2` 的定义（`Model.lean:28-32`，见 17.1）无影响，因为 `le_of_forall_pos_le_add` 允许任意正 $\varepsilon$，**但**配平能省一次 $\varepsilon/2$ 的除法，这就是 `ring` 在 $:97$ 能一次收掉的原因）；**(b) `D` 被绑定后从未使用**（我按词边界对证明体 $:65$ 到 $:97$ 逐个变量数过：`D` 出现 **1** 次，就是 $:83$ 的绑定处；同一行的 `v` 3 次、`b` 3 次、`hW` 2 次、`hc` 2 次、`hnear` 2 次，`δ` 1 次、`hδ` 2 次（绑定与 $:90$ 的 `apply hδV` 前的 `hδV` 分开数）、`hh` 3 次、`ρ` 7 次、`ε` 3 次。⇒ 外逼近的有限网格只是造 $v,b$ 的中间量，主定理不消费它；连 $\delta$ 本身也只活到 `hδV` 被打包成 $V$ 的包含关系为止。这条与 11 节里"$\delta$-网格是脚手架"的判断完全一致，是 Lean 侧给的独立确认）；**(c) `le_of_forall_pos_le_add` = "令 $\varepsilon\to0$"** ✓。

素材没写的三点，我补：

**(d) $:68$ 到 $:71$ 的 `hM : 0 ≤ M` 块在素材的骨架里被省略号吞掉了，但它是主定理的隐性前提之一。** 它的证明是先取 $\arg\max$（`rangeMaximum_attained`，即 17.5 里我引过的 `Model` 层极值存在性），再用 `rw [show M = ‖polynomialValue B z‖ from he.symm]` 把 `let` 名字换回定义，最后 `norm_nonneg`。⇒ 论文 $:527$ 的极限步没有这一步，因为论文里 $M\ge0$ 显然；Lean 里它是 `expLevel_domain_bound_scaled` 的一个显式入参吗？我查 $:93$：喂进去的是 `hρ`（$\rho>0$），并非 `hM`，所以 **`hM` 在 $:68$ 到 $:71$ 造出来之后并未进入 $:93$ 的调用**（我按词边界实测：`hM` 在整个文件里只出现 **2** 次，即 $:68$ 的绑定与 $:70$ 其自身证明体内的那次引用，证明体之外 **0** 次；$:76$ 的 `linarith` 用的是 `hMρ`（$M<\rho$），并非 `hM`，而 `hMρ` 出现 2 次，其中一次正是 $:81$ 的 `lt_of_le_of_lt ... hMρ`）。⇒ 这是一处**形式化内部的冗余**：Lean 证明了 $M\ge0$ 然后没用它。$[推测]$ 它很可能是作者（或模型）为 `ρ > 0` 铺的前提，后来发现 `positivity` 直接能从 $\varepsilon/2>0$ 得到（$:75$ 只用了 `dsimp`+`positivity`），于是 `hM` 成为遗留。⇒ 我从中读出的可用信息是：**这份形式化里有"未消费的证明块"**，所以把它当"每一步都必需"来读会过度解读；我 17.3 的三处陈述错位之外，这一处属于第四类：**代码里的死重**，它不改变数学，但对判断"这是人写的还是生成的"很有用（人会在最后清理一遍；生成物会留着）。

**(e) $:61$ 到 $:63$ 的 `convex_numericalRange` 只有一行，它调的是 `Geometry.convex_quadratic_range`，而这个引理不是 Mathlib 的，是同一目录 `Convexity.lean:201` 自己证的 13 条声明的终点（我 17.2 的表里给过那 13 个名字）。** ⇒ 论文的附录重证（$:514$ 到 $:522$ 的 Bloch 球参数化）在 Lean 侧**同样是自己证的**，并且主定理消费它的方式是"一行调用"。$[分析]$ 这条推翻了一个常见读法："论文重证 Toeplitz–Hausdorff 是为了自足"。自足性在 Lean 侧根本不构成差别（Mathlib 里没有这条以复二次映射为陈述的引理可用，`Convexity.lean` 必须自建）。⇒ 我 12.1 给的第一个 $[推测]$（"选最短路径以便自足"）需要加一条限定：**动机更可能是"这条证明顺便产出一个可复用的形状"**（$\R^3\to\R^2$ 的核非空），我在 12.1 失败路线清点里写过"标准椭圆证明需要判别式"，Lean 侧的实际产出（`bloch_surjective_sphere`、`threeLinear_ker_ne_bot`）与论文正文那两句逐字对应（`main.tex:517` 的 "the Bloch vector ... ranges over the unit sphere of $\R^3$" 与 `:518` 的 "the kernel of this map is nonzero"）。⇒ 我把这条升为"附录重证在形式化里有真实工作量的证据"，素材 §4.8 说史段与图是 Lean 无、但没检查附录；我检查了，附录**有**对应物，而且是 273 行。

**(f) $:92$ 的 `by simpa only [dist_eq_norm] using hzw` 是论文里"$V_\delta$ 是 $\delta$ 邻域"这一句话的代价。** 论文在 $:480$ 一带把 $V_\delta=\bigcap_{w\in\partial\Omega}B(w,\delta|v-w|+\delta)$ 型集合直接当开邻域写；Lean 要把 "hnear z hz" 给的 $w$ 与"距离 $\le\delta$"重新包成 `mem_thickening_iff.mpr ⟨w,hw,...⟩`，中间一次 `dist_eq_norm` 把 $P$ 空间距离换成范数。⇒ 与 $:91$ 的 `obtain ⟨w,hw,hzw⟩` 合起来：**论文的一步"由构造可知"，Lean 是"取出见证元、重写距离、重新装箱"三小步。** 这是我在 4.1 说的"存在性被拆成见证元加验证"的第 N 个实例，也是 18.2 那个"记号对齐占一半工作量"结论的又一处佐证。

### 18.9 我能说到哪一步：验收边界与重名不冲突的原因

这一小节把上面所有断言的**效力上限**写清楚，因为它决定读者能不能把 18.1 到 18.8 当机器验收证据用。

`E:\math\lean\.lake` 目录不存在（我实测，`ls` 报 `No such file or directory`），⇒ 本次**无法实际编译**这一形式化。由此两条硬约束：

- 我能声明的只有文本层事实：全目录 `sorry` **0** 次（实测 ✓）、`native_decide` **0** 次（✓）、`Axiom` 关键字 **0** 次（实测 ✓，即没有任何自定义公理，所有公理依赖只能通过 Mathlib 与 `permitted_axioms` 那三件套进来）、`permitted_axioms` 字段在 405 个 json 里只有 2 个互异取值且都是 `propext, Classical.choice, Quot.sound` 的字序差异（17.1 的表）。
- 我**不能**声明的：`lake build` 成功、"已编译通过"、"CI 验证通过"。素材 §4.7 末挂了这条禁令，我背书，并把理由写清，因为理由比禁令更有用：**0 个 `sorry` 只说明没有声明被跳过，不说明类型检查器接受整棵树**。import 图、命名冲突、universe 变量都可能让一个 0-sorry 的目录编译失败，而我这一节恰好实测到 5 组重名声明。

那 5 组我给全（390 条声明对 385 个互异名字）：

| 名字 | 位置一 | 位置二 |
|---|---|---|
| `continuous_integrable_compact` | `CircleFourier.lean:18` | `KernelContraction.lean:50` |
| `continuous_integral_compact` | `CircleFourier.lean:24` | `KernelContraction.lean:56` |
| `markov_kernel_contraction` | `CircleFourier.lean:33` | `KernelContraction.lean:65` |
| `re_circle_fraction` | `FaberEnergy.lean:114` | `PolynomialCalculus.lean:19` |
| `weighted_integral_norm_sq_le` | `Duality.lean:50` | `KernelContraction.lean:19` |

素材 §4.7 只列了前三组（"两个不同 namespace 下同义引理"），我多出的两组性质更硬，因为它们跨的是**功能上不相干**的文件对：`re_circle_fraction` 是我在第 6 节推的 $2\Re(\lambda/(\lambda-\mu))=1$ 那条恒等式的 Lean 化，`FaberEnergy` 与 `PolynomialCalculus` 各造一次；`weighted_integral_norm_sq_le` 是 `prop:coefficients` 权重对偶的两次独立实现。⇒ "并行产出"比素材的描述还要严重一档：同一件小工具被造了三次（权重对偶那组跨 `Duality` 与 `KernelContraction`，恒等式那组跨 `FaberEnergy` 与 `PolynomialCalculus`）。

$[推测]$ 这 5 组之所以应当不冲突，我把 namespace 结构逐个核了：`CircleFourier.lean` 的声明在 `OAI.DirectCrouzeix` 下（`:3` 与 `:12` 两层 `namespace`），`KernelContraction.lean` 的在 `OAI.DirectCrouzeix.Faber` 下（`:3` 与 `:17`）；`PolynomialCalculus.lean:9` 是 `DirectCrouzeix`、`FaberEnergy.lean:17` 是 `DirectCrouzeix.Faber`；`Duality.lean:11` 是 `DirectCrouzeix`、`KernelContraction.lean:17` 又是 `DirectCrouzeix.Faber`。⇒ 五组的两份全名都分别是 `OAI.DirectCrouzeix.X` 与 `OAI.DirectCrouzeix.Faber.X`，互不遮挡。我只能给到"名字空间不同所以应当可共存"这一档，再强一档需要编译器，我没有。$[分析]$ 结论：**本笔记关于 Lean 的一切都是源码取证，属于文献学，不属于机器验收**；要当验收证据用得自己跑一次 `lake build`。这也解释了为什么我在 18.1 到 18.8 反复写"实测"而不写"验证"：我测的是文本，不是类型检查。

### 18.10 计数口径：三种数法在三个 token 上给出三个答案

这一节是方法论，也是我对素材 §4.6 与 §4.7 那些统计的最后一道加工。同一份源码、同一个目录，三种口径：

**口径 A（行计数，`grep -c`）**：一行出现两次也算 1。**口径 B（词边界，`grep -ohw`）**：`ext` 不会命中 `exterior`，但会命中 `Faber.exterior` 里的？不会（后随字符是字母）。**口径 C（子串，`grep -oh`）**：`ext` 会命中 `exterior`、`context`、`pretext`。

三个 token 上三种答案分开，每一个都有可核查的原因：

| token | 素材（口径 C 类） | 我按口径 B | 真实构成 |
|---|---|---|---|
| `ext` | 22 | **22** | 11 处策略 `ext` 加 11 处限定名（`Complex.ext` 6、`Fin.ext` 2、`ContinuousLinearMap.ext` 2、`Prod.ext` 1） |
| `choose` | 16 | **7** | 子串 16 = 策略 1 + `hchoose` 局部名与其投影 5 + 二项式 `k.choose i`/`Nat.choose_mul_...` 3（另 7 处落在限定名与复合标识符里） |
| `Real.pi` | 2 | **2** | 子串口径给 3，因为 `Real.pi_pos` 含 `Real.pi` 前缀 |

$[分析]$ 于是 `ext` 这一项我给出与素材**相同**的 22，但成分与我原本预期的不同：我以为 22 是子串污染的产物，实测词边界也是 22，因为有 11 处是"用扩展性引理"（`apply Complex.ext`、`apply Fin.ext`、`Prod.ext hzf rfl`），并非策略词。⇒ 这提醒我：**任何一个"某 tactic 出现 $N$ 次"的断言都必须声明口径并给位置清单**，否则读者会把统计当成机器验收证据。我在 18.4 列 `positivity` 的 16 个位置、在 18.5 列 `fun_prop` 的 11 个位置，都是按这个要求做的（数完就把行号摊开）。

第二条方法论：**"某个绑定未被使用"这件事在 Lean 里要分两种，混淆会得出错误结论。** 我在 18.8(b) 用词边界数出 `CompleteBound.lean` 里 `D` 只出现 1 次（即 `:83` 的绑定处），这是硬的：`D` 是数据结构绑定，任何策略都隐式吃不到它，所以外逼近的有限网格确实没进主定理。同一个文件里 `hε` 也只出现 1 次（`:73` 绑定处，我实测），但**它是假设**，`positivity`（$:75$）与 `linarith`（$:76$）会把局部假设自动纳入搜索范围，所以 `hε` 未必闲置。⇒ 判别法：**看绑定的是项还是证明**。项（矩阵、集合、网格）闲置就是真闲置；证明闲置可能只是被策略隐式消费。我在 18.8(d) 说 `hM` 是"未消费的证明块"，按这条判别法要降一档表述：`hM` 是证明、可能被 `positivity` 隐式用到（$:75$ 那里 `ρ = M+ε/2` 的正性确实可以从 $M\ge0$ 走，也可以直接从 $\varepsilon/2>0$ 走），所以我说"Lean 造了它且看不到它被显式引用"，不说"它无用"。$[分析]$ 这条自我修正我留在这里，因为它是这份笔记里少数几处**我用自己给的判据推翻自己上一段话**的地方。

### 18.11 与论文侧最后一次对齐：四组数字的两套旅程

收束这一节，我把 17 与 18 两节的机器结论压回论文的四个数字，逐条给"论文怎么写、Lean 怎么走、我在哪一节推过"。

| 数字 | 论文侧位置与写法 | Lean 侧的实际路径 | 笔记位置 |
|---|---|---|---|
| $2$（最终常数） | `main.tex:31-36` 摘要、`:323-325` `thm:domain`、`:529` `thm:main`；写法是"常数恰为 2 且不可改进" | `UniversalBound 2`（`Model.lean:28-32`）→ `complete_crouzeix`（`CompleteBound.lean:65`）→ `expLevel_domain_bound_scaled` → `analytic_domain_core` 的 `change γ ≤ 2`（`DomainCore.lean:34/115`） | 1.2、16.2、17.3、18.2 |
| $1$（$K$ 的积分、权重 $C_0$） | `:202-204` "integral is exactly 1"、`:335` $C_0=\bar P_0$ | `circleMeasure` 定义吸收 $2\pi$（全目录 $\pi$ 只用 2 次）、`faberWeight 0 := 1` | 6.4、10.4、17.4、18.5 |
| $2$（权重 $C_k$ 的因子） | `:447-453` "more than enough" | `faberWeight (k) := if k = 0 then 1 else 2` 硬编码（`BoundaryEnergy.lean:106`），机器里问不出"能否改成 1" | 5.2、16.3、19.1 悬案一、19.2 |
| $\gamma$（$\|F[A]\|$） | `:330` 起全程用 $\gamma$ 作尺度 | `let γ := ‖tensorPolynomial A F‖`（`DomainCore.lean:32`）+ `hγ : 0 < γ`（:37）+ `exists_singular_pair`（:40） | 9.2、9.4、18.3 |

$[分析]$ 这张表真正的用处是暴露一种不对称：论文侧的三个"2"（结论、权重、块正性的系数）在文本里是**同一个数字的三次现身**，Lean 侧它们走三条完全不同的路（类型层的 `UniversalBound`、函数定义的 `if` 分支、算术策略的 `nlinarith` 证书）。⇒ 所以当我在第 16 节说"常数 2 是两处 4 与一处 2 的商"时，那只是**论文侧的算术**；机器侧对这个数字没有任何整体观念，它只知道 `γ ≤ 2` 这个目标在 `:34` 与 `:115` 需要被 `change` 认领两次。$[推测]$ 我认为这就是"形式化不能替论文回答'2 从哪来'"的准确说法：Lean 的信息层次里"来源"这个维度整个缺席，所以机器给不出答案，这与它掌握多少信息无关。

## 19 剩下的悬案与我如果继续做的三条岔路

### 19.1 六个我无权关闭的悬案

我把 15 节那份"未述清单"里最要紧的六条拎出来，逐条说清"论文给了什么、缺什么、我为什么不能补"。

**悬案一：`prop:coefficients` 的权重 2 是否最优。** 论文 $:447$ 到 $:453$ 明说 2 够用（"the constant 2 here is more than enough"），并在 $:335$ 交代 $C_0=\bar P_0$、$C_k=\bar P_k/2$ 这个"自对偶"选择。缺的是下界：没有任何例子说明"权重取 1 会失败"。我在 16.2 已把这条标为我自己的判断，并非论文结论；此处补一个机制分析：权重进入最终账的**唯一通道**是 `eq:weighted-dual` 与 `eq:diagonal-L2` 里的 $\sum_k w_k^{-1}$ 型系数（我 10.4 逐式推过），也就是说权重只通过"$\|P_k\|$ 与 $\|\bar P_k\|$ 的配对折扣"影响 $\gamma\le2$，**不进入 $K\ge0$、不进入正块步**。⇒ 想改权重就是改配对折扣，而配对折扣的上确界是 $2$（$1/1+1/2+1/2=2$ 那个和），所以问题等价于："是否存在另一组权重使同一个折扣小于 2"。论文没答，我也没答。$[推测]$ 这条是全文最可能出现改进的地方，因为它与第 2 个悬案耦合。

**悬案二：$\|b_k(A)\|\le C\theta^k$ 中 $C,\theta$ 对 $A$ 的一致性。** 论文 $:250$ 那句 "for the fixed $A$ and $h$" 我 8.4 处理过：$C,\theta$ 允许依赖 $A$ 与外共形坐标 $h$。缺的是"能否一致"，也就是 $\theta$ 能否由 $W(A)$ 的解析延拓半径单值控制。机制我大致能指认（$\theta$ 由领子宽度 $r$ 与 $h(\partial\Omega_r)$ 的 level 决定），但一旦 $W(A)$ 的边界出现接近尖点的形状（$h$ 的延拓半径 $\downarrow$），$r\to1$，$\theta\to1$、$C\to\infty$。⇒ 这条不影响常数 2，因为我的账（10.5 到 10.8）里 $\gamma\le2$ 只用 $a,\gamma$ 的代账，$C,\theta$ 只在 $:417$ 起对 $b$ 取 limsup 时露面，$r\downarrow1$ 时 $\theta^N\to0$ 就够。$[推测]$ 若有人要证"无穷维矩阵值版本"，第一个崩的就是这条一致性（见 19.4）。

**悬案三：奇异对的"单人假设"与两个局部等号能否同时达到。** 元证明（$:130$ 到 $:161$，我在 13 节做了逐句映射表）假设范数由**一个**奇异对 $(x,y)$ 达到，正文用 `exists_singular_pair` 取一对（`DomainCore.lean:40`），但当 $F[A]$ 的 top singular value 有重数时，"$\gamma$" 与"$x,y$"都不唯一。缺的是：$x$ 使对角块 $P$ 取等、$y$ 使 $Q$ 取等，**同一对** $(x,y)$ 能否同时？论文没讨论（我在 9.4 把这段记为论文的实际做法：两个有序测试 $FG$、$GF$ 共用同一对）。$[推测]$ 这也是我在 10.6 的 $\sqrt2$ 反事实检验无法升级为等号分析的原因：反事实算的是"少一支"，不是"取等的形状"。

**悬案四：无穷维基座。** 本文只在 $M_n(\mathbb C)$，史段 $:77$ 到 $:79$ 交代了标量情形的无穷维已被 Lorist–Schwenninger 的定理 3 覆盖（我 14.2 照抄过引文），矩阵值无穷维是空白。$[推测]$ 崩点顺序我有把握：先是 `exists_singular_pair`（无穷维要换成近似奇异对加极限，等号变成不等号，但我的账全靠等号 $\gamma x=F[A]^*y$，见 9.4，这条一旦只成立到 $\varepsilon$，$a=\gamma^2$ 变 $a\le\gamma^2$ 方向相反，链会断在 $:111$ 的 `hb`）；再是 `Fintype ι`（18.7 末）与领子的解析延拓；$K\ge0$ 与 Fourier 消失那两步反而最稳。

**悬案五：边界只连续（非解析）时外共形坐标的存在。** `lem:exterior-collar` 要 $\partial\Omega$ 实解析（论文 $:183$ 把 $r<1$ 当假设；我在 16 节台账里把 $r<1$ 的敏感度记为"$g$ 越过 $\T$"）。缺的是：连续边界的凸域要不要另换坐标（$h$ 只同胚到边界的情形）。Korf–Wiebe 型定理给边界解析的开集列，但论文没引它，`lem:approx` 用指数和 sublevel 绕过去了。$[推测]$ 我认为论文实际不需要这条（`lem:approx` 造的域边界自动解析），这也解释了 $:320$ 到 $:321$ 的 "Although we do not know whether this conformal-map formulation is itself an optimal route"。

**悬案六：$m$ 一致性的下界侧。** 全文最强陈述是"$m$ 与 $n$ 无关"（我在 1.2 的八行统一性普查里给了 $m$ 的六处出现与两处不出现）；$:49$ 到 $:50$ 只说 $m=1$ 时下界 2 来自 $[[0,2],[0,0]]$ 与 $P(z)=z$。矩阵值情形 2 是否仍是下界，论文未言；标量情形的 $1+\sqrt2$ 下界障碍（Ransford–Wargadieu 那类）在 $:92$ 到 $:94$ 引过。$[推测]$ 我的读法是：$m$ 增大时 $\|P[A]\|$ 的可塑性更强（Faber 系数是矩阵值），因此 2 更可能是上界，并非下界，但这一点连启发式论证都没有。

### 19.2 岔路一：把权重从"变分选择"升为"定理"

具体做法我不停在口号上：把 10.4 的自对偶测试写成权重序列 $w=(w_k)_{k\ge0}$ 上的一个极小化问题。设 $D(w)=\sum_k w_k^{-1}\theta^{2k}$、$R(w)=\sum_k w_k\theta^{2k}$（$[推测]$ 形式，我从 `eq:diagonal-L2` 与 `eq:weighted-dual` 的两侧结构反推），则整条链给的界是 $\gamma^2\le \frac{4}{\gamma^2}\cdot\Phi(w)$ 型，其中 $\Phi(w)$ 由 $D(w)$、$R(w)$ 的乘积决定。要问的是 $\inf_w\Phi(w)$，如果它严格小于当前 $(1,2,2,\dots)$ 给出的值，常数 2 就松动；如果它恰好在此取到，我就得到一条**新的定理形陈述**："这台机器（Fabergrowth + $L^2$ 正块 + 自对偶配对）的极限就是 2"。我会先算 $n=2,m=1$ 那个可完全显算的例子（`BadeaCrouzeixDelyon2006` 的 $\kappa(S)\le2$ 椭圆相似化，我 14.1 引过），因为那里 $b_k(A)$ 与椭圆参数都闭合，可以给 $\Phi$ 一个可检验的数值下界。风险我说清：$\Phi$ 很可能在 $(1,2,\dots)$ 处取到的是驻点，并非极小（论文 $:335$ 说这个选择是"self-dual"，暗示它是对称点，并非最优）。$[推测]$ 若如此，最诚实的产出是一条"机器的天花板"陈述，它不改进 2，但把"2 从哪来"这个问题从叙事变成定理。

### 19.3 岔路二：拿掉 `lem:approx` 的 Hessian 正定性那一步

现状（我 11.2 到 11.5 推过）：$\delta$-网 $\{a_j\}$（含 $\pm1,\pm i$）、$t_\delta$ 由 $|D_\delta|e^{-t_\delta\delta}<1$ 定、Hessian $\sum_\nu t_\nu E_\nu\nu\nu^{\top}$ 正定给严格凸、三行距离链 $(1-\delta)d\le\Re(\bar\mu(z-w))\le\delta|v-w|+\delta\le\delta(1+\operatorname{diam}K)$。我想试的替代：不用支撑函数取 max，而直接在 5.3 的 Faber 展开上截断，造 $\Omega_N=\{\|F_N[A]\|\le1\}$。

机械障碍两条，我估计会失败并说明为什么失败本身有信息：**(1)** 凸性来自"$\max$ 一族仿射函数的 sublevel"，截断 Faber 和给的是 $\{\|F_N(\lambda)\|\le1\}$，它的凸性要另外证（等价于回到 $:170$ 到 $:173$ 的支撑线关系，也就是绕回原路）；**(2)** Hessian 正定在证明里的作用不只是凸性，它还给了 $G$ 的**严格**次水平集与领子宽度，即三行距离链里 $(1-\delta)d$ 那个"$1-\delta$"需要曲率下界；截断序列的曲率对 $N$ 不一致。⇒ 失败点会告诉我：**指数和表示是"凸性"在解析函数类里的机器形式**，论文选它不是审美（这与 11.1 里我对"$\mathcal A^+$ 是网、$\mathcal A$ 是闭包"的读法一致）。真要试的话我第一步是算 $d=2$（两个指数项）时 Hessian 的特征值能否显式下界，因为 $:493$ 那句"the Hessian is positive definite on the span of $\{\nu_\nu\}$" 在我看来的实际强度取决于网里独立方向数，$d=2$ 是唯一能手算的情形。

### 19.4 岔路三：把常数 2 的来源搬到 Bergman 与 Grunsky 一侧

论文第 207 行明说 $s_{kj}$ 是 Grunsky 系数（我在 7.5 逐字对过），而第 105 到 111 行的 Faber/Bergman 先例（`Beckermann2005`、`BeckermannCrouzeix2014`、`BeckermannStylianopoulos2018`）里，算子范数 $\le1$ 是标准工具。我会试的是：把 `lem:faber` 里的边界正性（$K(\lambda,\mu)=1+s(\lambda,\mu)+\overline{s(\lambda,\mu)}\ge0$，我 7.2 到 7.6 推过它来自 $\Re\frac{\lambda+\mu}{\lambda-\mu}$ 的 Poisson 型正性）替换为 Beurling–Grunsky 算子的范数陈述，然后问 $\|I+2\Re s\|_{L^2\to L^2}$ 的上界。$[推测]$ 若能证它 $\le1$ 在归一化测度下等价于 $K\ge0$，`prop:coefficients` 的 $1,2$ 权重就变成算子范数问题，而算子范数问题有一整套可微扰的工具（与悬案一直接耦合：权重的极小化正是算子范数的下确界）。这条我要老实标注难度：**$s(\lambda,\mu)$ 的对称化 $K\ge0$ 是逐点正性，比 $L^2$ 算子范数强得多**，从强的一侧换到弱的一侧很可能丢掉论文的"不取范数、逐点算"这一优势（$:430$ 到 $:432$ 那句 "We do not take norms in these displays. The estimate follows pointwise..." 我在 10.7 分析过它是全链条最锋利的一步）。

### 19.5 这份笔记与它的两个对象之间的差距账

写到最后我把自己的账交一下。三个对象：论文正文（`main.tex` 623 行、`references.tex` 105 行 18 条、`figures/normal.tex` 21 行）、素材（约 219 KB，五节）、Lean 形式化（42 文件、`wc -l` 合计 7389 行、390 条声明、0 `sorry`）。我这份笔记做的是**从结果反推动机**，而反推的合法性完全取决于我能不能把"文本给定的"与"我推的"分开，所以 `[推测]` 标记是我在这份稿子里唯一的态度记号：我数过，正文里 109 处（每加一节重跑一次 `grep -o`），密集成中在 12.1（选路动机）、16.2（权重最优性）、19.1 与 19.2（悬案与岔路）。

三处我明确改了素材的结论：附录重证**有** Lean 对应物（`Convexity.lean` 273 行，见 18.8(e)，素材 §4.8 只核了史段与图）；`change` 78 次不"异常高"，异常在装配层分布（18.2）；`on each side` 不是修辞（18.7）。三处我改了论文读法上的疑问：`eq:pairing` 的 $L_k/M_k$ 在矩阵值情形不互为共轭（9.5，我按元素乘展开重做）；支撑线条件只用在 $b\in\partial V$（9.7 第 3 条）；$a>0$ 是这台机器唯一的非退化闸门（18.3 第 2 条）。

如果这份笔记还能加值，我认可以下三条，也都属于"我没有资格替论文做"的那类：其一，等号情形的完整刻画（18.4 的 `sq_nonneg (‖u 0‖ - ‖u 1‖)` 与 17.5 的 `Model` 层 $m=1$ 特殊化合起来只差一步：$m\ge2$ 时的极值矩阵形状）；其二，`lem:approx` 的 $O(N\delta)$ 与 $e^{-N}$ 之外是否还有低阶项可算，因为那决定论文 $:530$ 那句 "at a geometric rate" 的精确率；其三，`thm:domain` 里 $h$ 与 $A$ 的耦合能否解耦（18.3 的 $h_\eta=(1-\eta)h+\eta\,\mathrm{id}$ 变分只在 $r=1$ 时用了一次，若能用别的插值替代，`thm:domain` 就不必要求边界解析，那会同时关掉悬案五）。这三条我都只写了方向、写了为什么难，没有写结果，因为我没有结果。$[分析]$ 上一段末尾"我没有结果"这句话的口径要说清：它指的是数学结果，与 18.10 里我核出的那类"文本层可复算事实"（例如 `choose` 的 16 次子串里真正的策略只有 1 处）分属两档，后者我已经实测，可以放心引用。

## 20 离场清点

第 0 节我按"进场时手里有什么"的格式摊过一次桌子。离场时用同一格式把留下的东西列一遍，只列可核对的项，数字与位置都指回本笔记的节号。

**一，数学账。** 论文的七个具名对象（正文六个加附录一个）我逐个做了推导：附录 `lem:exterior-collar`（第 5 节）、`lem:faber`（第 6 节）、`prop:coefficients`（第 7 节）、`lem:resolvent`（第 8 节）、`thm:domain`（第 9 与第 10 两节，补步 1 到 32，上节做奇异对、四个块与双线性泛函数，下节做两次有序测试、自对偶测试与块比较）、`lem:approx`（第 11 节，补步 1 到 9）、`thm:main`（第 12 节）。常数 2 的全部产地是 10.6 与 16.2 那条 $\gamma^2\le(2\cdot4)/2$ 的链，链上只有三个数字：块正定给的 2、两次对称化各给的 4、权重对偶里那个恰好是 1 的系数。

**二，我加的账与论文的账要分开。** 三处纯外部计算我再点一次名：10.6 的 $\sqrt2$ 反事实检验（少一个对角块会退化成 $\gamma\le\sqrt2$）、16.2 的"两处 4 与一处 2 各自等号可达"、16.3 的"权 2 是 $T$ 的像空间维度记账，即 $2=1+1$"。这三条论文一句未述，我在写的时候都用 `$[推测]$` 或"外部计算"标了，这里汇总是为了防止后面的读者把它们当论文的断言。

**三，机器账。** 第 17 与第 18 两节合起来覆盖素材 4.0 到 4.9 的全部九个小节。第 18 节我是按"任何统计都要能被同一目录复算"的标准重写的，所以每一项都带口径与行号：18.1 的 24 项令牌全表（逐项复现，另加 `noncomputable section` 143、声明 390 条对 385 个互异名字、`linear_combination` 12）与每百行密度表、18.2 的 `change` 五处原文加密度反算（78 / 73.89 百行 = 1.06，据此撤掉"异常高"的说法，改为"装配层集中"）、18.3 的 `by_cases` 36 与 `by_contra` 10 分流（据此更正素材把 `DomainCore.lean:70` 记成 `by_cases`，该行是反证）、18.4 的 `nlinarith` 按文件分布（`Convexity` 12、`DiskMapping` 9 为最大两处）与五条证书原文、18.5 的 `fun_prop` 11 处位置清单与 $2\pi$ 缺席（`Real.pi` 真用 2 处，都在 `HolomorphicReflection.lean:82/86`）、18.6 的八文件开闭配对表、三处空 `namespace` 对、23 对 19 的 universe 分界与相邻文件共享尾号、18.7 的 `hm.1`/`hm.2` 消费点（`PolynomialEnergy.lean:201,202,206,207,211,214`）、18.8 的 `CompleteBound.lean:65-97` 全码与 `D`/`hM` 的未使用计数、18.9 的验收边界（`sorry`、`native_decide`、`Axiom` 各 0 次，`.lake` 不存在，故不声称编译通过）、18.10 的三种计数口径与 5 组重名、18.11 的四组数字双侧旅程。

**四，留在桌面上没做的三件事。**

1. 论文用 $C_\rho$ 与 $\rho^{k+j}$ 的系数几何衰减来证 $s(\lambda,\mu)$ 在 $\T^2$ 上绝对一致收敛（`main.tex:196-200`），Lean 用完备 Banach 代数里的闭式求逆（`FaberCalculus.lean:68` 的 `algebraGenerating` 与 `:41` 的 `ringInverse_geometric`）绕开整条估计。这是 16.1 表里标出的真实路线差，我没有把任一条翻成另一条。
2. Lean 只覆盖有限项指数表示（18.7 末的 `[Fintype ι]`，`DomainBound.lean:64` 与 `:100` 各一次），可数解析凸集两边都没谈，论文侧对应的是"未述"，Lean 侧对应的是"不覆盖"。
3. 有限维这一取舍：第 0 节末我记过，别人的标量结果做到有界 Hilbert 空间算子（`main.tex:93-94` 描述 Lorist--Schwenninger 的口径），本文与 Lean 都停在 matrix。摘要写 `in all finite base and coefficient dimensions`（`main.tex:33`），这个 "finite" 是本文主动让出的覆盖面，我在第 15 节的未述清单里留着，没有粉饰。

$[分析]$ 我对自己这份笔记只提一条要求：凡是标 `$[推测]$`、`$[分析]$` 与"外部计算"的段落，应当能被整体摘掉，而剩下的部分仍是一篇忠实复述论文七个具名对象的笔记。我按这个标准回查了 10.6、10.9、12.5、16.2、16.3、18.7、18.8 七处，摘掉之后技术链条仍然闭合；反过来说，这七处是我个人判断最重的地方，读者若想反驳我，从这几处入手最有效。

**五，我改过自己稿子的地方，也列进账。** 一份长笔记里最坏的情形是前后两处口径不一致却都留着，写错本身倒在其次。这份稿子里有三处我自己动过刀：17.6(iv) 里我原先照素材抄 `DomainBound.lean:85-86` 的两行时省掉了 `Faber.` 限定前缀，逐字复核后我把前缀补回、并把 `:78` 那条目标也一并贴出（同一张支撑线不等式在 8 行里被写了两种共轭约定，这条比我原来的转述更有用）；17.6(v) 里我原先照素材写"`choose` 出现 16 次所以它是 `Classical.choice` 的消费者"，复核后收窄成"16 次子串里真正的 `choose` 策略只有 1 处，其余是局部假设名、`.choose` 投影与二项式系数 `Nat.choose`"（见 18.10 的口径表）；18.6(5) 里我一开始把带 `universe` 的文件数记成 32，实测是 23，同一条推断在只写了"通用库对专属装配"时站不住，改成"是否要跑在 $\C$ 之外的空间上"之后才与 `PolynomialEnergy`、`PoissonBoundary` 这两个反例相容（18.6(5) 末那条 $[分析]$ 就是这次修正的现场）。

**六，第 19 节留的六案三路。** 悬案六条按可关闭难度排：权重 2 的最优性（19.1 悬案一，与 16.2、16.3 的那两处外部计算直接挂钩，也是 19.2 岔路一的靶心）、$\|b_k(A)\|\le C\theta^k$ 对 $A$ 的一致性（悬案二，只影响逼近速度不影响常数）、奇异对重数下的等号形状（悬案三）、矩阵值无穷维（悬案四，我有明确的崩点顺序）、非解析边界的外坐标（悬案五，我认为论文实际绕过了它）、$m\ge2$ 时 2 是否为下界（悬案六，连启发式都没有）。岔路三条各有一个我已经能写出的失败模式：变分权重的极值点很可能就是 $(1,2,2,\dots)$（那样得到的只是"机器的天花板"）、截断 Faber 和换不掉 Hessian 正定（因为 $1-\delta$ 那个因子需要曲率下界）、Beurling–Grunsky 路线会从逐点正性掉到 $L^2$ 算子范数（丢掉 `main.tex:430-432` 那句 "The estimate follows pointwise" 的优势）。$[推测]$ 这三条里只有第一条我敢说自己能在有限个月内给出可判定的结果，因为它的中间量（$D(w)$、$R(w)$ 的乘积下确界）在 $m=1$ 且 $A$ 为 $2\times2$ 幂零时可完全显算；其余两条我写下失败模式就算完成了任务。

离场时我手里剩下的东西与进场时一样多：论文、素材、Lean 目录，没有新增文件，也没有改动画像以外的任何东西。我能留下的只有这份笔记里的两件事，一件是把论文的七个具名对象逐个推到中间步骤不断线（第 5 到 12 节的补步 1 到 32 与补步 1 到 9），另一件是把 Lean 侧的统计从"素材给的数字"变成"同一目录可复算的数字，并标出六处口径差"（第 17 与 18 两节）。前者是读这篇论文的代价，后者是引用这篇论文的代价，两笔账我都记清了出处。

## 21 常数与参数台账（补记）

先交代这张表的来历与读法。第 16 节已经有一张台账，但那是六列口径（值、论文位置、Lean 对应、作用、敏感度、我的判定）；本节按全库统一的五列口径在文末补记一张，第 16 节原文一字不动，两表并存。位置一栏全部回 `E:\math\preprints\A-direct-proof-of-the-complete-Crouzeix-inequality-September-26-2026\build\main.tex` 逐行核对过，当前该文件 `wc -l` 为 623，与本笔记 :4 的记载一致；引用 Lean 处则回 `E:\math\lean\OAI\Analysis\DirectCrouzeix\` 实测，口径声明见 22 第 5 条。分层口径：进入最终常数的绝对常数（1、2、4、8 一族，配平互逆）、归一化口径常数（$2\pi$、$2I$ 一族）、存在性与增长率参数（$r$、$\rho$、$\theta$、$t_\delta$、$\delta$ 一族，只喂收敛与逼近，不进最终 2）、外部历史常数（不进证明）。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $C=2$（主定理最终绝对常数） | 数值 2，对 $n,m,d$ 一致 | `main.tex:63` eq:main 式内 | 摘要 `main.tex:32`、猜想句 `main.tex:55`、极限段 `main.tex:522`、不可降声明 `main.tex:65` | 改 $2-\eta$ 断在 `main.tex:526-530`：幂零例子左端 2 不变，右端变小，例子直接翻不等号 |
| $2$（`thm:domain` 域上常数） | 数值 2，在 $\lVert F(z)\rVert\le1$（$\partial\Omega$ 上）归一化下 | `main.tex:324` | `thm:main` 的缩放引用 `main.tex:520-522` | 恶化在 `main.tex:524` 的极限传递中原样乘进主定理常数，`main.tex:65` 随之失守 |
| $4$（对角块 Parseval 系数） | 数值 4，等于零频翻倍后再平方 | `main.tex:420`（等式）、`main.tex:421`（界） | 预算句 `main.tex:343`、对角求和 `main.tex:449` | 断在 `main.tex:412-413`（eq:means 使常数项为 $2P_0$ 与 $2Q_0$）；4 与 $\tfrac12$ 互逆，单改则 `main.tex:403-405` 配平失败 |
| $4$（交叉块常数项 $4\lvert M_0\rvert_2^2$） | 数值 4，$L_0^*=M_0$ 使交叉块常数项为 $2M_0$ | `main.tex:430`（等式）、`main.tex:431`（下界） | `main.tex:448` 左端 $2a^2\le 2\int\lvert M+L^*\rvert_2^2$ | 交叉项若丢常数项（和式改成 $k\ge1$），`main.tex:431` 下界不再等于 $a^2$，`main.tex:447-451` 的双侧夹断底 |
| $8$（合并上界） | 数值 $8=4+4$，$P,Q$ 两路各 $4a^2/\gamma^2$ | `main.tex:450`；Lean 同账 `DomainCore.lean:111`（`hb : 2*a ≤ 8*a/γ^2`） | `main.tex:452`（除以 $2a^2$ 开方得 $\gamma\le2$） | `main.tex:450` 任何乘性恶化按 $\gamma\le\sqrt{(\text{倍数})\cdot4}$ 进最终常数 |
| $2$（块正定迹不等式系数） | 数值 2，展开式含 $-2\lvert M+L^*\rvert_2^2$ | `main.tex:444` | `main.tex:448` 与 `main.tex:450` 相除闭合 | 断在 `main.tex:442-443`：$\Delta^{1/2}(J\Delta J)\Delta^{1/2}$ 的迹恰为此展开式，粗化则等式变不等式；16.1 已把改法后果标 [推测] |
| $J=\operatorname{diag}(I_m,-I_m)$ | 对角元 $\pm1$，符号交错 | `main.tex:440` | `main.tex:441`（$J\Delta J\succeq0$） | 改任一个符号，`main.tex:441` 的半正定性不再保持，`main.tex:442` 起全线断 |
| $\tfrac12$（对角对偶权重） | 数值 $\tfrac12$，权 2 的倒数 | `main.tex:395`、`main.tex:397`（eq:weighted-dual 两条）、`main.tex:400`（$d_N$ 定义） | `main.tex:401-404` 自对偶测试（$C_k=\overline{P_k}/2$）、`main.tex:420` 等式边 | 断在 `main.tex:403-404`：配对值与测试平方范数都写成 $d_N$，靠 2 与 $\tfrac12$ 互逆，任改一边 `main.tex:405` 关闭式失效 |
| $2$（`prop:coefficients` 非常数系数权重） | 数值 $2=1+1$（正频自身一份、$Tu$ 一份） | `main.tex:251`；Lean `BoundaryEnergy.lean:106`（`faberWeight`） | `main.tex:391` 上界、`main.tex:395` 倒数 $\tfrac12$ | 改 $2-\eta$ 则 `main.tex:395` 需同步改 $\tfrac1{2-\eta}$、`main.tex:420` 的 4 重算，最终常数漂移；16.3 专条 |
| $1$（常数项 $C_0$ 权重） | 数值 1，$s$ 项只对 $k\ge1$ 作用 | `main.tex:249-251`（双边式）、`main.tex:263`（only the $s$ term contributes） | `main.tex:391` 的 $C_0$ 项、`main.tex:430` 的 $4\lvert M_0\rvert_2^2$ | 权改 0：圆盘 $G\equiv C_0$ 时 `main.tex:251` 右不等式假（7.3 基例）；权改 2：`main.tex:395` 对偶配平破 |
| $\lvert\cdot\rvert_2$（HS 未归一化口径） | 定义 $(\operatorname{tr}(C^*C))^{1/2}$，不除 $\sqrt m$ | `main.tex:180`（口径句）、`main.tex:13`（宏 `\HS`） | `main.tex:271-276` Parseval、`main.tex:349-351` eq:pairing、`main.tex:441-445` 取迹比较 | 若归一化，$m$ 从 `main.tex:273` 的 Parseval 冒出，`main.tex:56` 的对 $m$ 一致在形式上先破（第 4 节口径一、7.3 第五行） |
| $2\pi$（圆周测度归一化分母） | $d\tau(e^{it})=dt/(2\pi)$，概率测度 | `main.tex:178`（全文唯一声明处） | `main.tex:204` 边际、`main.tex:259-261` 收缩两步、全部 Parseval（`main.tex:271-276`、`main.tex:416-421`） | 用 $dt$ 断在 `main.tex:259`：Jensen 要概率测度，边际变 $2\pi$ 后一路污染到 `main.tex:450` |
| $1$（核 $K$ 的双边际） | 每一元固定、另一元积分恰为 1 | `main.tex:204`（结论）、`main.tex:233`（证明：$s$ 逐项非零频故积分为零） | `main.tex:259`（$\lambda$ 侧）、`main.tex:261`（$\mu$ 侧） | 任一边际失效则 $T$ 不是 $L^2$ 收缩，`main.tex:269` 无源；7.2 第二步已清点三事实各用恰一次 |
| $1$（$b_0=1$ 归一化） | 首项系数恰为 1 | `main.tex:187`（结论）、`main.tex:208`（证明：提出 $c\lambda$） | `main.tex:337-339` eq:means 三恒等式、`main.tex:313`（$b_0(A)=I$ 给两积分）、`main.tex:412-413` 与 `main.tex:425`（零频 $2\times$） | 若 $\infty$ 处极点在 $\nu$ 阶：$\deg b_k=\lceil k/\nu\rceil$，`main.tex:189` 正频项 $\mu^k$ 变 $\mu^{k\nu}$，`main.tex:271` 三段频撑不交的分解崩 |
| $2I$（$\int_{\T}(R+R^*)\,d\tau=2I$） | 数值 2，零频翻倍母陈述 | `main.tex:307` | `main.tex:412-413`（$2P_0,2Q_0$）、`main.tex:425`（$2M_0$） | 改它则 `main.tex:420` 与 `main.tex:430` 常数项系数不一致，`main.tex:446-451` 闭合断 |
| $1$（恒等式 $2\Re(\lambda/(\lambda-\mu))=1$） | 数值 1，distinct $\lambda,\mu\in\T$ | `main.tex:229` | `main.tex:231`（$K$ 改写为单一分式实部）、`main.tex:233`（边际计数） | 右端若为 $c\ne1$：`main.tex:204` 边际重标，`main.tex:251` 的 $1,2$ 权重全重调 |
| $2$（$K=2\Re\frac{q(\lambda)}{h(\lambda)-h(\mu)}$ 对称化） | 数值 2，$\Re w=\tfrac12(w+\bar w)$ 的对称化 | `main.tex:231` | `main.tex:259-261` 经 $K\ge0$ 喂 `prop:coefficients` | 去 2 则 `main.tex:204` 边际变 $\tfrac12$，`main.tex:259` 的概率条件断 |
| $2$（二次型对称化 $v^*(qB^*+\bar qB)v=2\Re(\bar q(h-v^*Av))$） | 数值 2，同一对称化习惯 | `main.tex:320` | `main.tex:302`（$R+R^*\succeq0$）⇒ `main.tex:435-445` 块比较 | $\bar q$ 与 $q$ 位置写反则与 `main.tex:171` 差旋转 $e^{-i\theta}$，`main.tex:320` 符号失效；8.3 行六已核过 Lean 共轭位置 |
| $r$（$0<r<1$ 单叶亚纯领子半径） | 存在性参数，无增长率要求 | `main.tex:163`（§2 全局假设）、`main.tex:183`（`lem:faber` 假设） | `main.tex:196` 窗口 $r<\rho<1$、`main.tex:310` 窗口 $r<r_A<\theta<1$ | $r=1$ 时 `main.tex:196` 空窗口，`main.tex:222` 衰减无源；它由附录 `main.tex:610` 的 $r_0=R_0^{-1}<1$ 供出 |
| $C_\rho$、$\rho^{k+j}$（Grunsky 系数几何衰减） | 增长率 $\rho^{k+j}$，$r<\rho<1$，依赖域 | `main.tex:196-197`（陈述）、`main.tex:220-222`（Cauchy 估计证明） | `main.tex:197-200` 正规收敛与 $\T^2$ 绝对一致收敛 ⇒ `main.tex:267` 逐项交换授权 | 丢衰减断在 `main.tex:267`：核 $K$ 都无从定义，`main.tex:271-276` Parseval 分解崩；8.4 已记 Lean 走闭式求逆（`FaberCalculus.lean:68`、`:41`）不吃此参数 |
| $C$、$\theta^k$（Faber 系数算子范数衰减） | 增长率 $\theta^k$，$C,\theta$ 只依固定 $A,h$，不一致于 $A$ | `main.tex:304-305`；构造于 `main.tex:310`（取 $r_A<\theta<1$） | `main.tex:306` 绝对一致收敛、`main.tex:337` 四处级数系数平方可和、`main.tex:341` $a<\infty$ | 数值不进最终常数（关于 $a$ 齐次比较时约掉）；$\theta=1$ 则 $a=\infty$，`main.tex:391`、`main.tex:405`、`main.tex:421` 全是空界 |
| $\gamma=\lVert F[A]\rVert$（归一化标尺） | 变量；$\gamma=0$ 先分流 | `main.tex:329`（分流句）、`main.tex:330-332`（单位奇异对 eq:singular） | `main.tex:364-365`（有序乘积恒等式）、`main.tex:390-391`、`main.tex:405`、`main.tex:421`、`main.tex:450` | 不分流断在 `main.tex:391` 的除法；`main.tex:331` 两式若不同时成立则 `main.tex:364-365` 失效，$P,Q$ 两路测试无从生成 |
| $a$（公共交叉能量） | 定义 $a^2=\sum_{k\ge0}\lvert M_k\rvert_2^2$；末段全消 | `main.tex:341`（定义）、`main.tex:355`（取 $G=F$ 证 $a>0$） | `main.tex:353` Cauchy--Schwarz、`main.tex:391`、`main.tex:405`、`main.tex:431`、`main.tex:448`、`main.tex:452`（除以 $2a^2$） | $a$ 口径一变（如去 $k=0$ 项）则 `main.tex:431` 与 `main.tex:421` 不再是同一个 $a$，`main.tex:448-450` 合并失去意义；两侧 $a$ 的平方级差见 21.3 第三条 |
| $\delta$（外逼近厚度，$0<\delta<1$） | 逼近参数，$\delta\to0$；上界 1 是记账约定 | `main.tex:464`（假设与网）、`main.tex:468`（$\Omega_\delta$ 定义） | `main.tex:473` 支撑不等式、`main.tex:475-482` 矩形包紧、`main.tex:497-508` 距离链、`main.tex:510` 序列 | $\delta\ge1$ 断在 `main.tex:497` 与 `main.tex:508`：因子 $1-\delta$ 非正，距离估计变平凡；11.3 已记上界 1 的宽松性 |
| $t_\delta$（指数和陡度） | 存在性参数；唯一约束 $\lvert D_\delta\rvert e^{-t_\delta\delta}<1$ | `main.tex:464`（选择句） | `main.tex:470-471`（验证 $K\subset\Omega_\delta$）、`main.tex:471-473`（除以 $t_\delta$ 消掉） | 改成 $\le1$ 则 $K$ 可能贴水平集，`main.tex:486` 的"梯度在水平 1 非零"失去更小值点，`main.tex:458` 的解析边界断 |
| $\{1,-1,i,-i\}\subset D_\delta$ | 四个固定轴向 | `main.tex:464`（要求句）、`main.tex:484`（Hessian 句） | `main.tex:475-479`（矩形有界）与 `main.tex:484`（严格凸）；Lean 主链唯一消费 `exists_axis_net` 于 `OuterApproximation.lean:77`（定义 `SupportNets.lean:53`） | 丢 $\pm i$ 则闭次水平集无界，`main.tex:486` 的有界性断，附录 `main.tex:557`（$z_*$ 内点）连带不可用；11.2 补步 5 记 Hessian 实际只用 $\{1,i\}$ |
| $\delta(1+\operatorname{diam}K)/(1-\delta)$（距离换算率） | 误差界 $O(\delta)$ | `main.tex:497`（$(1-\delta)d$ 起链）、`main.tex:501`（$\delta(1+\operatorname{diam}K)$）、`main.tex:508`（收束） | `main.tex:520-524` 的一致收敛传递 | 换网近似阶只改 `main.tex:524` 的收敛速度，不改常数；`main.tex:504` 原文点名第一、三处用了网近似 |
| $\delta_j=1/(j+1)$（极限序列） | 具体序列，满足 $0<\delta_j<1$、$\delta_j\to0$ | `main.tex:510`（for example 句） | `main.tex:458` 结论的序列 $\Omega_j$、`main.tex:524` 极限段 | 序列取值无关（任意 $\delta_j\to0$ 可换）；Lean 主证明无序列，用 `CompleteBound.lean:72-74` 的 $\varepsilon$ 装置代位 |
| $1/\sqrt2$（取等点） | 数值 $1/\sqrt2$，$x_1=x_2$ | `main.tex:530` | `main.tex:530`（$2\lvert x_1x_2\rvert\le1$ 取等）、`main.tex:522` 右端最大值为 1 的验证 | 换点则例子撑不到右端恰为 1，`main.tex:65` 不可降声明失去唯一载体 |
| $\begin{pmatrix}0&2\\0&0\end{pmatrix}$（幂零例子） | 右上元 2；$\lVert A\rVert=2$、$\max_{W(A)}\lvert z\rvert=1$ | `main.tex:528`（定义）、`main.tex:530`（验证句） | `thm:main` 证明末段 `main.tex:526-530` 的全部 sharpness 论证 | 单参数族比值恒为 2（16.1 标外部计算）；2 改 $t$ 不动证明，只动"右端为 1"的便利 |
| $1/3$、$2/3$（粘合覆盖半径系数） | 纯宽松技术系数 | `main.tex:591`（三半径盘选择）、`main.tex:594`（$(R_i+R_j)/3\le 2R_i/3<R_i$） | `main.tex:595-597` 透镜重叠（identity theorem）⇒ `main.tex:598` 拼出全领子；Lean 同款 `ConformalCollar.lean:124` 的 $S/3$ 与 `:125-127` 三次 `3*(S/3)=S by ring` | 放宽到 $1/2$ 断在 `main.tex:594` 的严格号：$R_i=R_j$ 时 $(R_i+R_j)/2=R_i$，$\zeta_j\in U_i$ 丢，5.2 步 4 给过完整算术 |
| $R_0>1$、$r_0=R_0^{-1}$（单叶领子宽度） | 存在性数值；除 $<1$ 外无要求 | `main.tex:606`（$R_0$ 存在）、`main.tex:610`（$r_0$ 定义） | `main.tex:540-541` 的亚纯单叶范围 ⇒ `main.tex:163` 的 $0<r<1$ | $R_0=1$ 则无领子，第 2、3 节全线无地基；它是存在性闸门，不进任何常数（5.3 表末行） |
| $c$、$c_0$、$c=1/g'(0)\ne0$（外映射首项系数） | 非零复数；论文不取 $c>0$ 相位规范化 | `main.tex:165`（展开式）、`main.tex:613`（来源）、`main.tex:236`（usual normalization 句，未采用） | `main.tex:187` 的 $c^{-k}$、`main.tex:208`（提出 $c\lambda$）、`main.tex:216-218`（$H$ 在轴上取值 $c$）、`main.tex:310`（$R(\infty)=I$ 的除法） | $c=0$ 等价极点在 $\nu$ 阶，见 $b_0=1$ 行；相位旋转带动 `main.tex:169` 的 $q$ 整体旋转，eq:support（`main.tex:171`）随之同转、不等式不变（14.3 已记） |
| $q(\lambda)=\lambda h'(\lambda)$（法向权重的一次 $\lambda$） | $\lambda$ 的一次幂 | `main.tex:169`（§2 命名）、`main.tex:548`（附录独立定义）、`main.tex:183`（假设重复） | `main.tex:170-171`（eq:support）、`main.tex:298`（$R$ 定义）、`main.tex:317-320`（合同二次型） | 去 $\lambda$ 则 `main.tex:320` 与 `main.tex:171` 差旋转 $e^{-i\theta}$，正性断；Lean 换元后对应 $u^2$（两次变量替换累积，8.3 行六称"全文最小的结构性常数"） |
| $\varepsilon$、$\rho=M+\varepsilon/2$（极限配平） | $\varepsilon>0$ 任意；$\tfrac12$ 使 $2\rho=2M+\varepsilon$ | 论文侧用序列 `main.tex:510`、极限段 `main.tex:522-524`；Lean 侧 `CompleteBound.lean:72-74`、闭合于 `:97`（`dsimp [ρ,M]; ring`） | Lean 主证明的 sup 到 $\le$ 缝合段 | $\tfrac12$ 改 1 仍成立但需再做一次 $\varepsilon\mapsto\varepsilon/2$；此 $\varepsilon$ 不进常数 2，16.2 末行"无 $\varepsilon$ 松弛进最终常数"即此 |
| $11.08$、$1+\sqrt2$、条件数 2、相似常数 2（历史外部值） | $11.08$、$1+\sqrt2$、条件数 $\le2$、$\lVert S\rVert\lVert S^{-1}\rVert\le2$ | `main.tex:76`、`main.tex:82`、`main.tex:86-88`、`main.tex:117` | 引言比较段 `main.tex:74-100`；正文证明一律不引用 | 改动不破正文，只破 `main.tex:32` 的 sharp 叙事与引言的改进幅度叙述；11.08 的来源 16.1 已标无法核实 |

#### 21.1 依赖链：哪个常数喂哪条引理

正文侧的主干是一条绝对常数链。`main.tex:187` 的 $b_0=1$ 喂 `main.tex:337-339` 的 eq:means，eq:means 喂 `main.tex:412-413` 与 `main.tex:425` 的零频 $2\times$，两处 $2\times$ 分别造出 `main.tex:420` 的 4 与 `main.tex:430` 的 4，两个 4 经 `main.tex:449` 合成 `main.tex:450` 的 8，8 与 `main.tex:444` 的块系数 2 相除开方得 `main.tex:452` 的 $\gamma\le2$。这条链上改 4、8、2 任何一环，断点都从 `main.tex:452` 起，向上传染 `main.tex:63` 的 eq:main，再被 `main.tex:526-530` 的例子判假。与它咬合的是权重对偶链：`main.tex:251` 的 2、`main.tex:395` 与 `main.tex:397` 的 $\tfrac12$、`main.tex:420` 的 4 三者互逆成环，改任何一头的数值，断在 `main.tex:403-404` 的自对偶配平（配对值与测试平方范数同时写成 $d_N$ 这件事），`main.tex:405` 的关闭式随之失效。

测度口径链独立在前：`main.tex:178` 的 $2\pi$ 定出概率测度，概率测度乘 `main.tex:204` 的双边际（其成立靠 `main.tex:233` 的非零频计数），两者喂 `main.tex:259` 的 Jensen 与 `main.tex:261` 的 Fubini，产出 `main.tex:269` 的收缩，收缩喂出 `main.tex:251` 的权 2。这条链若从归一化端改动，第一个假的是 `main.tex:259`（Jensen 不再适用），这正是 7.2 第二步"三事实各用恰一次"清点给出的断点顺序。

存在性与增长率参数从不进入上面的链。$R_0$（`main.tex:606`）供出 $r_0$（`main.tex:610`），$r_0$ 供出 $r$（`main.tex:163`），$r$ 打开 `main.tex:196` 的 $\rho$ 窗口（喂 `main.tex:220-222` 的衰减与 `main.tex:267` 的授权）与 `main.tex:310` 的 $\theta$ 窗口（喂 `main.tex:306` 收敛与 `main.tex:341` 的 $a<\infty$）。这些参数的数值怎么改都不动 2，但 $R_0=1$、$r=\rho$、$\theta=1$ 任何取等都让对应窗口变空或级数发散，证明从 `prop:coefficients` 或 `lem:resolvent` 的存在性前提处断掉，并非从常数处断。近似侧同理：`main.tex:464` 的 $t_\delta$ 严格不等号喂 `main.tex:470` 的 $K\subset\Omega_\delta$，后者喂 `main.tex:486` 的正则水平集，再喂 `main.tex:458` 的 $\Omega_j$，$\Omega_j$ 是附录 `main.tex:557`（需要内点 $z_*$）与 `thm:domain` 假设的共同来源；把严格号改成非严格，先崩的是 `main.tex:486`，其后是附录整节。$\delta$、$\operatorname{diam}K$、$\delta_j$ 只控制 `main.tex:508` 的收敛速度，主定理对速度不敏感（`main.tex:524` 只要 $\to0$）。

Lean 侧的喂给关系按 17.4 与 18.11 的账压缩成一句：`BoundaryEnergy.lean:106` 的 `faberWeight`（$1,2,2,\dots$）喂 `PolynomialEnergy.lean:165`（结论在 `:183-186`，含 $(1/2:\mathbb R)\sum'$ 一侧），`DomainCore.lean:16` 的 `hb0 : b 0 = 1` 喂 `DomainCore.lean:63` 的 `a` 定义与对角等式，`DomainCore.lean:111` 复刻 `main.tex:450` 的 8，`CompleteBound.lean:72-74` 与 `:97` 的 $\varepsilon,\rho$ 装置顶替论文的序列。改 `faberWeight` 里的 2，`DomainCore.lean:75` 的 `hdiag` 与后续 `linarith` 目标错位，`CompleteBound.lean:65` 的 `UniversalBound 2` 无法实例化：两侧改常数的断法同构。

$[分析]$ 分层的最终读法我同意 16.1 末的判断：链上 2、4、8、$\tfrac12$、$1$ 全是结构数字（互逆、对偶、翻倍关系锁死），能"调"的只有存在性参数，而它们不进常数；与 `main.tex:82` 的 $1+\sqrt2$（那类靠松弛产生的可改进常数）形成分层对照。这句话本身仍是 16.2 记过的我的读法，不是论文的断言。

#### 21.2 同一量的两口径并列记录（只列，不改原文）

一，Lean 模块总行数。7389（本笔记 :5、:1943、:2011、:2586 的"实测 `wc -l` 合计"）对 7431（素材头记，引于 :5、:1943）。差 42 恰为文件数；:1943 自注末行换行口径。本次补记时以 `wc -l` 复测仍为 7389，与前一处一致。

二，`references.tex` 的 `\bibitem` 条数。18（:4、:1750 实测）对 17（素材 §3.6，引于 :4、:1750）。本次复测 18，与前一处一致；两处出处都在，原文未动。

三，Lean 的 `a` 与论文 $a^2$ 的大小方向。:1871（16.1 表 $a$ 行）写"**Lean 的 $a$ 是论文 $a^2$ 的上界**"；:2090（17.4 末）写"Lean 的 `a` 对应论文的 $a^2$，**甚至只是它的下界**"。两处口径相反且都留着。按 :2090 自给的推导（$\sum_{k\ge0}\lvert M_k\rvert_2^2\le\int\lvert M\rvert^2$，即论文 $a^2$ 不超过 Lean 的 `a`），方向与 :1871 一致；我在此只做并列登记，按硬约束不回改任何原文。tex 侧定义在 `main.tex:341`，Lean 侧定义在 `DomainCore.lean:63`（本次实测该行仍是 `let a := ∫ t, hsSq (M t) ∂circleMeasure`）。

## 22 勘误（补记，与台账同期）

硬约束不许我回改正文，本节只做登记：正文与当前语料的出入，逐条给出原文行号、当前实测、判据来源。判据统一取当前 `build\main.tex`（`wc -l` 实测 623）与当前 `lean\OAI\Analysis\DirectCrouzeix\` 目录，规则一句话：tex 与正文冲突时，tex 赢。五条里前四条是行号或引文出入，第五条是计数口径；我把它也记在这里，是因为 §21 表前承诺过"Lean 引用的口径声明见 22 第 5 条"。

**勘误一（5.2 步骤 1 引文块的行号与一处空格）。** 笔记 :365 把"$U$ 为什么 star-shaped、边界为什么仍正则实解析"那段引文的行号记作 `main.tex:561-564`。当前 tex 里这段在 `main.tex:559-563`：:559 结尾是 `$(\mathbb C\setminus\overline\Omega)\cup\{\infty\}$. Its image $U$ is`，:560 是 `a bounded simply connected domain containing zero, with a regular`，:561 是 `real-analytic Jordan boundary. Indeed, each ray from $z_*$ meets`，:562 是 `$\partial\Omega$ at a unique positive radius; inversion turns the`，:563 是 `exterior portions of these rays into a star-shaped domain about zero.`；:564 起已是 Riemann 映射定理的引文行（`The Riemann mapping theorem \cite[...]{Ahlfors1979}`），在引文范围之外。另有一处排版级出入：当前 :561 是 `$z_*$ meets`（星号后无空格），笔记 :369 的引文块对应行作 `$z_* $ meets`（`$` 内多一空格）。出入发生在制版环节，原文不动，今后引用以本条为准。

**勘误二（`for the original matrix $A$` 的行号）。** 笔记 :819 写"第 292 行 `for the original matrix $A$` 的分量就在这里"。当前 tex：:292 整行是 `\cite{DelyonDelyon1999,CrouzeixPalencia2017}; we prove the required`，:293 整行是 `positivity for the original matrix $A$.`。被引短语 `for the original matrix $A$` 落在 :293；句子从 :292 的 `we prove the required` 起、跨行到 :293 止。所以"第 292 行"若指句子的起点成立，若指标短语的落点则差一行。tex 赢：被引短语在 :293。

**勘误三（Grunsky 身份句的行号，兼一处笔记内部矛盾）。** 笔记 :2582 写"论文第 207 行明说 $s_{kj}$ 是 Grunsky 系数"。当前 tex：该句在 :238，全文为 `These mixed coefficients are differentiated Grunsky coefficients.`；当前 :207 是 `\begin{proof}`，即 `prop:coefficients` 证明的起始行，不含任何 Grunsky 字样（全文件 `grep -n Grunsky` 仅此 :238 一处命中）。笔记 :215（7.5 那段）引的是同一处，且写 `main.tex:236-243`，与 :238 自洽；可见 :2582 的"第 207 行"是孤立的错值。tex 赢：:238。

**勘误四（"The estimate follows pointwise"在当前语料中不存在）。** 笔记 :2582 与 :2612 两处引 "We do not take norms in these displays. The estimate follows pointwise..."，并把出处记在 `main.tex:430-432`（:2582 行文作"$:430$ 到 $:432$"）。当前 tex 实测：`grep -c pointwise` 命中 0；`do not take`、`norms in these` 也都 0 命中。当前 :428-432 是 eq:cross-L2 展示式本身（:428 `\begin{equation}\label{eq:cross-L2}`，:429-431 为 `\int_\T\HS{M+L^*}^2d\tau`、`=4\HS{M_0}^2+\sum_{k\ge1}\bigl(\HS{M_k}^2+\HS{L_k}^2\bigr)`、`\ge a^2.` 三行，:432 `\end{equation}`）。结论：这句引文在当前 build 的 tex 里无法逐字复现，出处可能是更早的稿本；两处原文照留，今后任何引用必须标注"当前 tex 查无此句"。我在上下文里核到功能等价的文字在 :425-427（`For the cross field, $L_0^*=M_0$ makes the constant term $2M_0$. Its negative coefficients are $M_k$ for $k\ge1$ and its positive coefficients are $L_k^*$ for $k\ge1$. Consequently`），它确实就是"不取范数、逐点算"的写法：把交叉场的 Fourier 系数逐档点名，然后直接落 :429-431 的恒等式。10.7 说的"全链条最锋利的一步"，在当前语料里对应这段点名加展示式，而无单独句子。

**勘误五（Lean 每文件行数的口径：笔记数 = `wc -l` + 1，即 §21 表前预告的第 5 条）。** 笔记 :2020-:2022 分层表里的模块行数系统性比当前实测大 1。抽查七件：`SupportNets` 记 191、`wc -l` 190；`Convexity` 273 对 272；`ExponentialSupport` 176 对 175；`OuterApproximation` 173 对 172；`DomainBound` 142 对 141；`CompleteBound` 120 对 119；`HolomorphicReflection` 270 对 269。这与 :5 和 :1943 的总数出入同型：素材记 7431、我实测 `wc -l` 7389，差 42 恰为文件数，每文件大 1。机制上 :1943 猜的是"末行无换行符也被计数"，我用 `od -c` 复核后这个猜测站不住：`SupportNets.lean` 与 `ComparatorChallenges\DirectCrouzeix.lean` 都以 `OAI\r\n` 收尾（有结尾换行）。能同时解释两组数字的机制是反方向的：计数工具在结尾换行之后多算一行空行（编辑器"总行数"= 换行符数 + 1 那一类）。口径并列，不回改原文；换算规则就一句：模块表数字减 1 才是 `wc -l`。注意 :1943 记 comparator 文件"1397 字节 / 44 行"，`wc -l` 恰为 44、`wc -c` 恰为 1397，那一处用的又是 `wc` 口径，两个口径在同一篇笔记里并存，本节是唯一把它们对齐的地方。

## 23 补深 `lem:exterior-collar`：反演断言群与单叶性反证这两处"一句话过"

第 5 节的 5.2 已把附录证明按七步重建过，本节不重复重建，专打两处最压缩的地方：步骤 1 里那句一口气塞进六个论断、而论文的 Indeed 只顺带证了其中一件事的反演句，以及步骤 5 里那七行反证。四件套格式：(a) 逐字原文带行号，(b) 中间步骤补齐，(c) 每个假设、常数、指数的机械理由，(d) 以 [推测] 开头的失败路线。语料仍取当前 `main.tex`（623 行版）。

### 23.1 步骤 1，(a) 逐字原文（`main.tex:556-563`）

```tex
\begin{proof}
Fix $z_*\in\Omega$ and apply $z\mapsto1/(z-z_*)$, with infinity
mapped to zero, to the spherical exterior
$(\mathbb C\setminus\overline\Omega)\cup\{\infty\}$. Its image $U$ is
a bounded simply connected domain containing zero, with a regular
real-analytic Jordan boundary. Indeed, each ray from $z_*$ meets
$\partial\Omega$ at a unique positive radius; inversion turns the
exterior portions of these rays into a star-shaped domain about zero.
```

行号按 :556 到 :563 共八行；:564 起进入 Riemann 映射定理的引用行。5.2 步骤 1 原记 `main.tex:561-564`，以 22 节勘误一为准。

### 23.2 步骤 1，(b) 中间推导：一句话里藏着六个论断

那句 "Its image $U$ is a bounded simply connected domain containing zero, with a regular real-analytic Jordan boundary" 实际登记了六个论断：U 是开集、有界、单连通、0 是内点、边界是 Jordan 曲线、且解析正则；随后的 "Indeed" 只证了星形性。逐个补：

**开集与同胚。** $z\mapsto1/(z-z_*)$ 作为黎曼球面上的映射是同胚（平移、取倒数、再平移三段合成，$z_*$ 与 $\infty$ 互像）。被反演的球面外部 $(\mathbb C\setminus\overline\Omega)\cup\{\infty\}$ 是球面中闭集 $\overline\Omega$ 的补，开；同胚像 $U$ 开。这里我一度把"极点落在集内"当成漏洞，重读才纠正：作为平面映射它确有极点 $z_*$，但 $z_*\in\Omega$ 不在被反演的集合里，所以限制在该集合上是处处定义的连续单射；论断要的是这个"内点"位置，下面第 (c) 件给全它起的三个作用。

**有界（补 $\delta$ 的构造）。** $\Omega$ 开且 $z_*\in\Omega$，存在 $\delta'>0$ 使 $B(z_*,\delta')\subset\Omega$。对任意 $z\in\mathbb C\setminus\overline\Omega$，线段 $[z_*,z]$ 从内点走到外点，必交 $\partial\Omega$ 于某 $u$，于是 $|z-z_*|\ge|u-z_*|\ge\delta'>0$。取像 $w=1/(z-z_*)$ 满足 $|w|\le1/\delta'$，故 $U\subset\overline{B(0,1/\delta')}$。

**0 是内点。** $\overline\Omega$ 有界闭，$M=\max_{u\in\overline\Omega}|u-z_*|<\infty$。若 $|z-z_*|>M$ 则 $z\notin\overline\Omega$，对应 $0<|w|<1/M$ 全在 $U$ 里；添上 $\infty$ 的像 $w=0$，得整盘 $B(0,1/M)\subset U$。这一步是 $g(0)=0$ 归一化（:566）能落地的前提。

**单连通。** 球面同胚保住补集的拓扑：$U$ 同胚于 $S^2\setminus\overline\Omega$。论文的假设是 $\partial\Omega$ 为 Jordan 曲线，若用约当-施恩弗利斯定理（闭曲线可扩为球面同胚），$S^2\setminus\overline\Omega$ 同胚于开盘，单连通立得。但我反推作者本意时注意到更初等的一条，恰好只依赖凸性：凸紧集 $K=\overline\Omega$ 的球面补关于 $\infty$ 星形，因任意外点 $z$ 与 $\infty$ 的连线就是那条射线，其超出 $K$ 的部分仍超出 $K$（线段初始区间性质，见下面星形性推导）；含 $\infty$ 的球面星形开集经同胚映成关于普通点星形的平面开集，星形即道路连通且可缩，单连通拿到。论文在此一句带过，我认为它默认的就是这条凸性路线，因为全文（附录与 `thm:domain`）都不离凸假设。

**边界仍是正则实解析 Jordan 曲线。** 反演在 $\C\setminus\{z_*\}$ 上全纯、导数 $-1/(z-z_*)^2\ne0$；$\partial\Omega$ 紧且被 :561 的射线论断与 $\Omega$ 有界约束在 $B(z_*,\cdot)$ 外一圈闭区域里，故 $\partial U$ 是实解析嵌入圆在同胚像下的像：Jordan 性来自同胚，正则实解析性来自"解析弧的解析非退化像"。

**星形性（论文证了骨架，我补三步）。** 其一，射线成员单调：对单位方向 $u$，集合 $S=\{t\ge0:z_*+tu\in\Omega\}$ 是区间（凸性：中间参数点是首尾两内点的凸组合），且含小初段（$z_*$ 内点）、相对开（$\Omega$ 开），故形如 $[0,T)$ 或 $[0,T]$。其二，出口唯一：$\Omega$ 有界给 $T<\infty$；$\gamma_T\in\partial\Omega$（$\overline\Omega$ 闭收得住，$\Omega$ 开使 $T$ 不能是内点）；$T$ 之后若有 $t'>T$ 使 $\gamma_{t'}\in\partial\Omega$，则 $\gamma_0=z_*$ 是内点而 $\gamma_{t'}$ 属于 $\overline\Omega$，凸体标准事实"内点到闭集点的开线段落在内部"会把参数 $(0,t')$ 整段变成内点，特别给出 $t>T$ 的内点，与 $T$ 为上确界矛盾。故每条射线恰交边界一次。其三，反演把"射线超出边界段"变成"线段"：$w=1/(z-z_*)\in U$，$z=z_*+1/w$ 在方向 $w/\lvert w\rvert$ 上参数 $t_z>T$；对 $0<s\le1$，$sw$ 反解回 $z_s=z_*+(z-z_*)/s$，参数 $t_z/s\ge t_z>T$，仍严格外部，故 $sw\in U$；添 $0\in U$，即 $[0,w]\subset U$。这就是 :562-563 "exterior portions of these rays into a star-shaped domain about zero" 的逐字展开。

### 23.3 步骤 1，(c) 假设、常数、指数的机械理由

- $z_*\in\Omega$（内点身份）同时供三处：极点不落在被反演集合内，$U$ 才是平面有界集（若 $z_*$ 在外部集合里，$\infty$ 的原像落集内，$U$ 无界）；$\delta'>0$，有界性成立（若 $z_*\in\partial\Omega$，$\delta'=0$，同样失界）；$0$ 为内点，$g(0)=0$ 归一化有意义（若 $z_*$ 在边界，$0$ 成边界点，Riemann 映射无法居中）。一个假设三处吃，位置降级哪条都断。
- $\Omega$ 有界：$M$ 有限与射线出口 $T<\infty$ 都靠它。无边界的凸域（半平面）里 $\infty$ 是边界聚点，反演像既失界又失内点。
- 凸性：23.2 里用了两次，射线交边界的唯一性（单调性证明的第二条）和单连通初等路线的"超出即恒超出"。我记一笔减弱空间：星形域加 Jordan 边界也能给初始区间性，唯一性还差"边界不含射线段"一个小案，而实解析边界自动排除该小案（非零实解析函数不能在区间上恒零），所以凸可换成"关于 $z_*$ 星形 + 解析边界"；论文没换，我判定是图省事，不影响任何后续步骤。
- 边界实解析：在这一步只被 $\partial U$ 的正则性吃下一小块（解析复合保持），大头在步骤 3（Schwarz 反射），:569-586 才支取。我在 5.2 步骤 3 已记过账，此处只标"预支"关系。
- 常数与指数：步骤 1 产出的 $\delta'$ 与 $M$ 之后不再出现，$U$ 整盘交给 Riemann 映射，尺寸信息被 $g$ 吸收；真正的半径数字全部押在步骤 5 的 $R_0$ 上，指数环节只有 :610 一处倒数 $r_0=R_0^{-1}$（$r\mapsto1/r$ 把 $R_0$ 盘外推换成 $h$ 的 $r_0$ 领子），与 §21 的 $R_0,r_0$ 行一致。

### 23.4 步骤 1，(d) 失败路线

- [推测] 路线一：退化凸紧集（点或线段）没有内点，:557 开篇的 Fix $z_*\in\Omega$ 落空。论文对此的出路在正文 :458 的 `lem:approx`：先把 $K$ 塞进有内部的开凸集 $\Omega_j$ 再谈领子。这条是已发生的现实，我标 [推测] 只针对"附录与正文的先后顺序是刻意设计"这一层归因。
- [推测] 路线二：把凸降为一般单连通加 Jordan 边界（带凹陷的域），射线可以多次穿边界，星形性与 :617-618 的外向句（增大径向参数进入 $\overline\Omega$ 外部）同时失；支撑线不等式（:619-620）失去凸性凭据。断点不在本步的拓扑论断，而在法向方向那一段，与 :617-618 对得上。
- [推测] 路线三：$z_*$ 选到外部，反演极点落在被反演集合内部，映射在 $z_*$ 附近把外部深点甩到远处，$U$ 无界且不再关于 0 星形，Riemann 映射定理的输出口（有界单连通）整个报废。

### 23.5 步骤 5，(a) 逐字原文（`main.tex:600-606`）

```tex
The extension is injective on a smaller neighborhood of the closed
disk. Otherwise, distinct colliding pairs arbitrarily close to that
compact set would have subsequential limits in the closed disk.
Continuity and injectivity on the closed disk identify their limits.
Both points of each pair would then eventually lie in one local
inverse neighborhood of that common limit, a contradiction. By compactness,
this injective neighborhood contains the disk $\{w:|w|<R_0\}$ for some $R_0>1$.
```

七行；:607 起 `Thus $g$ is univalent on that disk.` 之后的零点唯一与单重两句话 5.2 步骤 5 已附账，本条引文止于 :606 与 5.3 表格的分工一致。

### 23.6 步骤 5，(b) 中间推导：七行反证拆成六件事

1. **否定式的精确形态。** 要证的命题是：存在 $\overline\D$ 的一个邻域，开拓 $\tilde g$ 在其上单叶。否定：对每个 $k\ge1$，邻域序列 $N_k=\{w:\operatorname{dist}(w,\overline\D)<1/k\}$ 中都有相异点对 $w_k\ne w_k'$ 满足 $\tilde g(w_k)=\tilde g(w_k')$。前提：$\tilde g$ 至少在某个 $N_{k_0}$ 上有定义，这是步骤 4 的输出（:598 末句 `a holomorphic map on $\mathbb D\cup\bigcup_iV_i$, a neighborhood of the closed disk`）。步骤 5 必须排在步骤 4 之后，缺了全球开拓，"碰撞点对"的函数值相等根本无从谈起。
2. **极限抽取。** $\{w_k\}$、$\{w_k'\}$ 同落在紧集 $\{|w|\le2\}$ 内（取 $k\ge1$，两点距闭盘都小于 1），Bolzano--Weierstrass 给子列 $w_{k_j}\to p$；再对同指标子列取 $w_{k_j}'\to q$。由 $\operatorname{dist}(w_{k_j},\overline\D)<1/{k_j}\to0$ 与 $\overline\D$ 闭，$p\in\overline\D$；同理 $q\in\overline\D$。
3. **公共极限。** $\tilde g$ 在 $N_{k_0}$ 上全纯故连续，$\tilde g(p)=\lim\tilde g(w_{k_j})=\lim\tilde g(w_{k_j}')=\tilde g(q)$；而 $\tilde g|_{\overline\D}=g$，Carathéodory 同胚（:567）给 $g$ 在闭盘上单叶，故 $p=q=:p_0$。这就是论文 "identify their limits" 那半行的内容。
4. **局部反演邻域的存在。** 步骤 3 末句 :586 `Thus the continued $g$ has nonzero derivative at each boundary point.` 的输出是：每个边界点 $\zeta$ 有开邻域 $W_\zeta$，$\tilde g$ 在其上全纯且单叶（反函数定理给出局部全纯逆，逆分支正是"local inverse neighborhood"这个名字的来源；:583-585 用 $g^{-1}$ 的反射保证 $\tilde g$ 与真逆在另一侧吻合）。若 $p_0\in\D$，局部单叶性由 $g$ 在 $\D$ 内共形直接给；若 $p_0\in\partial\D$，由反射给；两种情形合起来，$W_{p_0}$ 总存在。
5. **矛盾闭合。** $w_{k_j}\to p_0$ 且 $w_{k_j}'\to p_0$，$W_{p_0}$ 是 $p_0$ 的邻域，故 $j$ 大时两点同落 $W_{p_0}$，与 $\tilde g$ 在 $W_{p_0}$ 上单叶矛盾。否定被杀，存在无碰撞的邻域 $N_{k_*}$。
6. **紧致性升级成 $R_0>1$。** $\overline\D$ 紧，$N_{k_*}$ 是它开邻域，于是存在一致 $\varepsilon>0$ 使 $\{w:\operatorname{dist}(w,\overline\D)<\varepsilon\}\subset N_{k_*}$（标准证明：否则对每个 $m$ 取距 $\overline\D$ 小于 $1/m$ 而不在 $N_{k_*}$ 里的点，紧性给出聚点落在 $\overline\D\subset N_{k_*}$，与 $N_{k_*}$ 开矛盾）。闭盘情形 $\operatorname{dist}(w,\overline\D)=\max(0,|w|-1)$，取 $R_0=1+\varepsilon$ 即 :606 那句 "contains the disk $\{w:|w|<R_0\}$ for some $R_0>1$"。随后 :607-608 的零点论断：$g(0)=0$ 归一化（:566）；若 $|w|<R_0$ 且 $g(w)=0$，单叶性强制 $w=0$；$g'(0)\ne0$ 因 $g$ 在 0 处共形。故 $1/g(1/\lambda)$ 在 $\infty$ 处恰有一个单极点，首项系数 $c=1/g'(0)$（:613 原文的 coefficient 一词），这正是 §21 里 $c$ 行的账。

### 23.7 步骤 5，(c) 机械理由

- 单叶性必须在"邻域"，并非闭盘上：$h$ 的领子是环带 $r_0<|\lambda|\le1$（:610 定义），对应 $w$ 平面上闭盘外圈 $1\le|w|<R_0$ 的壳；闭盘内单叶 Carathéodory 早给，本步产品就是那圈壳。壳不存在，第 6 节 :163 的 $r<1$ 无从谈起。
- 紧致性在本论证里出现两次，5.3 的表只给它一行，我在此拆细：一次在论断 2（序列紧，抽极限），一次在论断 6（开覆盖一致化，出 $\varepsilon$）。弱掉任意一次，$R_0>1$ 都拿不到。
- "local inverse neighborhood" 吃步骤 3 的 $g'\ne0$：若 $p_0$ 落在边界而反射没做（只有 Carathéodory 的连续延拓），碰撞点对可以一个从盘内、一个从延拓侧趋近，$W_{p_0}$ 不存在，论断 4 与 5 同时断。5.2 步骤 3 第 4 与第 6 小步的必要性，我在 5.2 只给了一句"不能省"，此处把支点指明在 :604-605 的 one local inverse neighborhood。
- "arbitrarily close" 的措辞有硬用：若否定式只要求"某个固定宽度环带内有碰撞点对"，论断 2、3 照走，但两点极限未必同落一个 $W_{p_0}$；只有沿 $N_k$（距离趋于 0）取列，论断 5 的"eventually lie in one"才成立。反证必须取收缩邻域序列这个格式，措辞不可替换。
- $R_0$ 是此步唯一数字常数，约束只有 $R_0>1$；指数环节仅 :610 一次倒数把 $R_0$ 换成 $r_0$。与 §21 的 $R_0,r_0$ 行一致：存在性见证，数值不进 2。

### 23.8 步骤 5，(d) 失败路线

- [推测] 路线一：边界解析性降级为 $C^k$。步骤 1 的拓扑论断（有界、内点、单连通、星形）全部无损，$U$ 仍是 $C^k$ Jordan 域；断裂从步骤 3 的 Schwarz 反射（:580-582 那段）开始，随后 :604-605 的局部反演邻域失据，本步反证在论断 4 处没有支点。我把这条记在两个步骤名下，因为它同时解释"为什么 :569 那句 `We justify the stronger boundary continuation needed below.` 明确点名下面要用"。
- [推测] 路线二：粘合失败传导。若步骤 4 的 $1/3$ 换成 $1/2$，:594 的严格不等式 $(R_i+R_j)/3\le2R_i/3<R_i$ 变成非严格，两开拓在交叠区未必可比，identity theorem 无从触发，全局 $\tilde g$ 造不出来；本步开篇的 The extension 就不存在，断点前移到 :590-594。5.2 步骤 4 已算过 $1/3$ 的算术理由，此处补的是它的传导理由：这个常数崩起来轮不到步骤 5 首当其冲，先崩的是"碰撞值相等这句话有没有主语"。
- [推测] 路线三：域序列的一致领子宽。设 $\Omega_n$ 解析凸、曲率下界趋 0（逼近线段），每个 $\Omega_n$ 都有自己的 $R_0^{(n)}>1$，但下确界可以落到 1；单域论证无恙，任何"沿序列做一致领子估计"的改写会在这里失血。论文避开此雷的手法是顺序：先在 :458-486 固定逼近域再进附录；Lean 同样把边界圆写成定型 `BoundaryCircle` 再开工，我判定是同一动机。

### 23.9 与第 5 节的接续关系

本节不推翻 5.2 的七步分工，只把步骤 1 与步骤 5 的"一句话区"拆成可复算的论断清单。两处新判断：单连通那句在论文里无标注地依赖了拓扑事实（强 Schoenflies 或凸集球面补的初等路线，我倾向前者也不排斥后者，:564-567 的两条 Ahlfors 引用都是备着用的）；紧致性在步骤 5 里是两用，并非一用。若 5.3 的表与本节在颗粒度上有出入，以本节为准；事实层面无冲突，只是切得更细。
