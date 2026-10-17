# 《A counterexample to Kaplansky's quasitrace conjecture and failure of tensor-product stable finiteness》单篇素材

来源：论文 tex 源码（`E:/math/preprints/A-counterexample-to-Kaplanskys-quasitrace-conjecture-September-23-2026/build/`：`paper.tex` + `01-introduction.tex`、`02-preliminaries.tex`、`03-scaling.tex`、`04-bundles.tex`、`05-algebra.tex`、`06-conclusion.tex`、`07-consequences.tex`、`bibliography.tex`、`figures/finite-test.tex`，共 9 个文件，日期 2026-09-23，署名 OpenAI）、Lean 形式化 `E:/math/lean/OAI/Analysis/Kaplansky/`（74 个文件，7837 行）+ 平行支持库 `OAI/Analysis/Quasitrace/`（7 文件 1093 行）、`OAI/Analysis/Cuntz/`（15 文件 3370 行）、`OAI/Geometry/BundleTests/`（12 文件 2788 行）、比较器 `E:/math/lean/ComparatorChallenges/KaplanskyQuasitrace.json` 与 `.lean`、`formalization.yaml` 第 47–51 行（sources 条目）与第 1270–1272 行（theorem 条目）。全部公式按 tex 原文照抄，未做任何 OCR/PDF 转换。

姊妹篇素材：`Kaplansky-特征2-素材.md`（群环直有限性，特征 2）、`Kaplansky奇特征直接有限性-素材.md`（同族，奇特征群环）。**本篇是同名的第三个 Kaplansky 猜想**：算子代数方向的"拟迹必为迹"猜想，与群环 $ab=1\Rightarrow ba=1$ 方向只有名字相近，机制完全不通用；写作时避免把两篇的"specified/prescription"语式混用。

行号约定：下文标注 `01:86` 表示 `01-introduction.tex` 第 86 行；`03:120` 同理。tex 源码已按行读取，行号可直接核对。

---

## 目录

- 一、定理总览
  - 1.1 主定理精确陈述（Theorem 1.1）
  - 1.2 推论精确陈述（Corollary 1.2，三段式）
  - 1.3 反例对象一句话画像
  - 1.4 全文依赖图
  - 1.5 编号与文件对位表
- 二、逐引理带批注重构（主体）
  - 2.0 §2 预备知识：1-拟迹/2-拟迹/规格化/无穷性的定义机制 + Theorem 2.1（拟迹存在定理）
  - 2.0b §2 末尾那段"没有编号的观察"：$W^*W$ 可逆 ⟹ 连续等距因子化
  - 2.1 Lemma 3.1（避开小集体像 / incidence）
  - 2.2 Lemma 3.2（连续规格化 / determinant potential）
  - 2.3 Proposition 4.1（有限拓扑测试 / bundle test）
  - 2.4 Theorem 5.1（代数 $B$ 的构造与逐矩阵尺寸排除）
  - 2.5 Lemma 5.2（从两条关系到一个固定的正元对缺陷）
  - 2.6 Theorem 1.1 的证明（06-conclusion.tex）
  - 2.7 Corollary 1.2 的证明（07-consequences.tex）
- 三、叙事时间线（含英文原文逐字引用）
- 四、Lean 取证
- 五、常数与参数表

---

## 一、定理总览

### 1.1 主定理精确陈述（Theorem 1.1）

`01-introduction.tex` 第 80–88 行，TeX 原文照抄：

```tex
\begin{theorem}
\label{thm:main}
There exist a separable unital complex \(C^*\)-algebra \(A\), admitting
a normalized \(2\)-quasitrace, and positive contractions \(a,b\in A\)
such that every normalized \(2\)-quasitrace \(\tau\) on \(A\) satisfies
\[
 \tau(a+b)-\tau(a)-\tau(b)\ge\frac1{144}.
\]
\end{theorem}
```

量化顺序值得逐字对齐（后面 Lean 取证要按它核对）：

$$\exists A\ (\text{separable}\wedge\text{unital}\wedge\mathbb C\text{-}C^*\text{-algebra}\wedge \exists\tau_0\ (\tau_0\text{ 是 }A\text{ 上的规格化 }2\text{-拟迹}))\wedge \exists a,b\in A\ (a,b\text{ 为正压缩元}\wedge \forall \tau\ (\tau(1)=1\wedge\tau\text{ 是 }2\text{-拟迹}\Rightarrow \tau(a+b)-\tau(a)-\tau(b)\ge 1/144)).$$

三个容易被读掉的要点：

1. **不是"存在一个拟迹不线性"**，而是"存在**一对固定的**正元 $a,b$，使得**每一个**规格化 2-拟迹在这对上都有 $\ge 1/144$ 的可加性缺陷"。这是很强的陈述：它把反例做成了"一致量化在拟迹集合之外、缺陷有显式下界"的形式，因此不需要写出任何一个具体拟迹的公式（intro `01:209-211`："requires no formula for a chosen quasitrace"）。
2. $a,b$ 是 **positive contractions**（正压缩元），不是任意自伴元；缺陷是对**实数序** $\ge 1/144$ 陈述的，隐含 $\tau(a+b)-\tau(a)-\tau(b)\in\mathbb R$（由正元在拟迹下取实值，见 2.0 节）。
3. 定理本身没有说 $A$ 无迹——但"无迹"是它的直接推论（有迹态就与 $\ge1/144$ 矛盾）。abstract（`01:2-7`）反过来把论文的宣传重心放在"admits normalized 2-quasitraces but has no tracial state"上，即**存在性与障碍性各占一半**。

### 1.2 推论精确陈述（Corollary 1.2，`01:110-124`）

```tex
\begin{corollary}[Tensor products and stable finiteness]
\label{cor:stable-finiteness}
\leavevmode
\begin{enumerate}[label=\textup{(\roman*)}]
\item There are two unital simple stably finite complex \(C^*\)-algebras
whose minimal tensor product is properly infinite. One factor can be
taken to be \(C_r^*(\mathbb F_2)\).
\item There is a separable unital complex \(C^*\)-algebra \(B\) admitting
a normalized \(2\)-quasitrace such that
\(B\otimes_{\min}C_r^*(\mathbb F_2)\) is properly infinite and admits no
normalized \(2\)-quasitrace.
\item There is a separable unital stably finite complex \(C^*\)-algebra
with no tracial state.
\end{enumerate}
\end{corollary}
```

论文自己强调三条用的是**不同的代数**（`01:126-135`，这段是防误读的关键声明）：

```tex
The three assertions use related but different algebras. The simple
tensor-product example comes from a non-von-Neumann \(AW^*\)-factor of
type \(\mathrm{II}_1\), with no separability assertion for that factor.
The quasitrace-loss example uses the explicit separable algebra \(B\)
constructed below; we prove that no matrix algebra over \(B\) is properly
infinite, not that \(B\) is stably finite. A finitely generated subalgebra
of the \(AW^*\)-factor gives the separable stably finite traceless example,
without a simplicity assertion.
```

即：(i) 用 $AW^*$ 因子 $M$（不可分、单、稳定有限）；(ii) 用显式构造的可分代数 $B$（只证"没有矩阵代数在其上适当无穷"，**不**宣称 $B$ 稳定有限）；(iii) 用 $M$ 的有限生成子代数 $C$（可分、稳定有限、无迹，**不**宣称单）。这三句"not that"/"without a simplicity assertion" 是全篇最典型的防御性措辞，第二节 2.7 会逐条回到机制。

### 1.3 反例对象一句话画像

**$A=M_{48}(B)$，其中 $B=C^*(1,x_1,\dots,x_{24})$ 是 24 个"分层移位算子"在积代数 $\mathcal D=\prod_{m,R\ge1,\;y\in Y_{m,R}}\mathcal B(\mathcal H_{m,R,y})$ 中对全部 $(m,R,y)$ 坐标同时实现的生成元；$x_i$ 满足 $\sum x_i^*x_i=1,\ \sum x_ix_i^*\le\tfrac23 1$，且每个 $M_m(B)$ 都不适当无穷；$A$ 上的规格化 2-拟迹由 Cuntz–Blackadar–Handelman 存在定理（本文 Theorem 2.1）非构造性地给出，缺陷对由 Lemma 5.2 的部分和望远镜矩阵显式给出。**

一句话版本："反例不是造出一个坏拟迹，而是造出一个**只有坏拟迹**（有规格化 2-拟迹但无迹态）的代数，并且把非可加性钉在两个固定的对角矩阵上。"

### 1.4 全文依赖图

```
外部输入（不在本文证明）：
  Sard 定理 (Sard1942) ─────────────┐
  Hatcher 向量丛讲义 Chern 类性质 ───┤
  Milhøj–Rødnam [Thm 2.3] 存在定理 ──┤
  Blackadar–Handelman, Blackadar–Rødrdam（存在定理的历史来源，仅引用）
  Haagerup [Lemma 2.1][Thm 5.11][Rem 2.5(a)] ─┤
  Milhøj–Rødnam [Thm 3.1] 迹障碍张量积定理 ───┤
  Gow [Thm 4.11][Rem 2.7] 因子等价 + 单性 ─────┤
  Powers 1975  C_r*(F_2) 的单性 ───────────────┤
  Villadsen / Rørdam 2003（Chern 类方法的先例，风格性引用）
  Gurvits / Sra–Hosseini（det-势方法的先例，风格性引用）
                                          │
本文内部链条：                            ▼
  Lemma 3.1 (incidence, 03)  ──┐
                               ├──► Proposition 4.1 (bundle test, 04) ──┐
  Lemma 3.2 (scaling, 03)    ──┘                                        │
                                              （4.1 内部还复用 3.1 两次：小 s / 大 s）
                                                                        ▼
                              Theorem 5.1 (构造 B, 05) ──► [06] Theorem 1.1 证明
                                                                        ▲
  Theorem 2.1 (拟迹存在, 02) ───────────────────────────────────────────┤
  Lemma 5.2 (缺陷对, 05，完全独立于 3.x/4.1/5.1) ───────────────────────┘
                                                                        
  Theorem 1.1 ──► Corollary 1.2 (07)：
        (i)  靠 1.1 + Gow 因子等价 + Haagerup[Thm5.11 之外的]MR[Thm3.1] + Powers
        (ii) 靠 Thm 5.1(B) + Thm 2.1(两个方向) + 关系式无迹 + MR[Thm3.1]
        (iii) 靠 Haagerup[Lemma2.1] + M 的稳定有限性（继承到子代数）
```

依赖图的四个非平凡观察：

- **Lemma 3.2（scaling）与 Lemma 3.1（incidence）彼此独立**：3.2 只假设"集体像膨胀 $\dim\sum T_iS\ge 2\dim S$"这一条抽象性质，不关心它怎么来的。3.1 的唯一职责是生产这条性质。解耦点是 Proposition 4.1 内部。
- **Lemma 5.2 与构造完全解耦**：它是全篇唯一一条"纯代数恒等式"型引理，输入只有 $N$ 条关系和 1-拟迹公理。论文明说它"useful independently of the construction"（`05:125-127`）。
- **Theorem 2.1 被用了两次、方向相反**：在 06 里用"⟸"（不排除适当无穷 ⟹ 存在拟迹），在 07(ii) 里用"⟹"的逆否（张量积已适当无穷 ⟹ 不存在拟迹）。
- **1/144 是两处乘积**：$(1-c)/(2N)$，$c=2/3$ 来自 Lemma 3.2 的 $3/2$ 系数，$N=24$ 来自 Lemma 3.1 的 $16+8$，$2N=48$ 来自 Lemma 5.2 需要把 $a,b$ 放进 $M_{2N}(B)$。三者串成一条常数链，第五节逐值展开。

### 1.5 编号与文件对位表

| 编号 | 名称/标签 | 文件 | 行 |
|---|---|---|---|
| Theorem 1.1 | `thm:main` | 01-introduction.tex | 80–88 |
| Corollary 1.2 | `cor:stable-finiteness` (i)(ii)(iii) | 01-introduction.tex | 110–124 |
| 关系式 (1.1) | `eq:intro-relations` | 01-introduction.tex | 140–144 |
| Theorem 2.1 | `thm:existence`（拟迹存在定理） | 02-preliminaries.tex | 31–36 |
| Lemma 3.1 | `lem:incidence`（避开小集体像） | 03-scaling.tex | 9–28 |
| 维数条件 (3.1) | `eq:incidence-dimension` | 03-scaling.tex | 15–19 |
| Lemma 3.2 | `lem:scaling`（连续规格化） | 03-scaling.tex | 86–104 |
| 膨胀假设 (3.2) | `eq:expansion` | 03-scaling.tex | 94–96 |
| 规格化界 (3.3) | `eq:scaled-bounds` | 03-scaling.tex | 98–103 |
| 行列式下界 (3.4) | `eq:scaling-determinant-bound` | 03-scaling.tex | 145–149 |
| Proposition 4.1 | `prop:bundle-test` | 04-bundles.tex | 14–37 |
| 秩 (4.1) | `eq:test-ranks` $d_0=64m4^R,\ d_j=4^jd_0$ | 04-bundles.tex | 16–18 |
| 乘度 (4.2) | `bundle:multiplicities` | 04-bundles.tex | 57–63 |
| 底空间 (4.3) | `eq:test-base` $K_i=320m^24^{2i-2}(4^{R-i+1}-1)$ | 04-bundles.tex | 65–70 |
| Chern 障碍 (4.4) | `eq:chern-obstruction` | 04-bundles.tex | 31–36 |
| Chern 分解 (4.5) | `bundle:chern-decomposition` | 04-bundles.tex | 97–101 |
| 前缀维数 (4.6) | `bundle:prefix-dimension` $\eta_j<\tfrac{20}{3}md_j$ | 04-bundles.tex | 133–140 |
| 小块 incidence (4.7) | `bundle:small-incidence` $\tfrac52sD-27s^2\ge133ms$ | 04-bundles.tex | 158–162 |
| 大块 incidence (4.8) | `bundle:large-incidence` $\tfrac{43}{2}sd-11s^2>\eta_j$ | 04-bundles.tex | 204–212 |
| Theorem 5.1 | `thm:construction` | 05-algebra.tex | 9–20 |
| 关系式 (5.1) | `eq:algebra-relations` | 05-algebra.tex | 13–18 |
| 多项式下界 (5.2) | `eq:polynomial-lower-bound` $P^*P\ge\tfrac12 I$ | 05-algebra.tex | 73–76 |
| 丛映射 (5.3) | `eq:polynomial-bundle-map` | 05-algebra.tex | 86–91 |
| Lemma 5.2 | `lem:defect` | 05-algebra.tex | 130–147 |
| 缺陷界 (5.4) | `eq:uniform-defect` $(1-c)/(2N)$ | 05-algebra.tex | 143–146 |
| 缺陷对 (5.5) | `eq:defect-pair` | 05-algebra.tex | 159–167 |
| 角规格化 (5.6) | `eq:corner-normalization` | 05-algebra.tex | 183–189 |
| 平方相等 (5.7) | `eq:corner-square-equality` | 05-algebra.tex | 192–195 |
| Figure 1 | `fig:finite-test` | figures/finite-test.tex | 全文（1–46 行） |
| 式 (6.1) | `eq:traceless-tensor` | 07-consequences.tex | 40–45 |

（式号是我按 `\numberwithin{equation}{section}` 推定的顺序编号，论文里没有给公式打数字，只有标签；引用时以 `\label` 名为准。）

---

## 二、逐引理带批注重构

### 2.0 §2 预备节：四个定义的机制，以及 Theorem 2.1

#### (a) 精确陈述

1-拟迹（`02:6-13`，原文照抄）：

```tex
For a unital \(C^*\)-algebra \(C\), a \emph{\(1\)-quasitrace} is a function
\(\tau:C\to\mathbb C\) satisfying
\begin{enumerate}[label=\textup{(\roman*)}]
\item \(\tau(x^*x)=\tau(xx^*)\ge0\) for every \(x\in C\);
\item \(\tau(h+ik)=\tau(h)+i\tau(k)\) for self-adjoint \(h,k\in C\);
\item the restriction of \(\tau\) to every abelian \(C^*\)-subalgebra
of \(C\) is complex linear.
\end{enumerate}
```

2-拟迹与规格化（`02:14-19`）：

```tex
It is a \emph{\(2\)-quasitrace} if a \(1\)-quasitrace on \(M_2(C)\)
restricts to \(\tau\) on the upper-left corner. It is
\emph{normalized} when \(\tau(1_C)=1\).
The extension then has value two at \(1_{M_2(C)}\): the two
diagonal corner units have the same value by \textup{(i)} and
their values add by \textup{(iii)}.
```

适当无穷 / 稳定适当无穷（`02:21-29`）：

```tex
A unital \(C^*\)-algebra \(C\) is \emph{properly infinite} when it
contains isometries \(s_1,s_2\) with orthogonal ranges. Equivalently,
\[
 s_i^*s_j=\delta_{ij}1_C,\qquad i,j\in\{1,2\}.
\]
It is \emph{stably properly infinite} if \(M_m(C)\) is properly
infinite for some positive integer \(m\). Absence of stable proper
infiniteness is the condition needed below; no assertion about
finiteness of every projection is required.
```

Theorem 2.1（拟迹存在定理，`02:31-36`）：

```tex
\begin{theorem}[Quasitrace existence]
\label{thm:existence}
A unital \(C^*\)-algebra \(C\) admits a normalized \(2\)-quasitrace
if and only if \(M_m(C)\) is not properly infinite for every
positive integer \(m\).
\end{theorem}
```

论文随即声明它的出处与"无额外假设"性（`02:38-47`）："We use Theorem~\ref{thm:existence} in the formulation of \cite[Theorem~2.3]{MR} … In particular, Theorem~\ref{thm:existence} has no exactness, simplicity, or representation assumption."

#### (b) 证明机制推导

本节没有证明（定义 + 引用外部定理），但有四个必须补出的推导步骤，否则后面 Lemma 5.2 与 06/07 的两处用法会看不懂：

**步骤 1：由 (i)+(iii) 得"$\tau$ 在自伴元上取实值"。** 设 $h=h^*$。则 $1\pm h$ 在 $h$ 足够小时正，更稳妥的做法：$h$ 落在 abelian 子代数 $C^*(1,h)$ 里，(iii) 说 $\tau$ 在其上复线性；正元在 abelian $C^*$-代数里等于某个平方 $y^*y$（取 $y=h^{1/2}$），由 (i) 得 $\tau(h)=\tau(h^{1/2}h^{1/2})\ge 0$。于是 $\tau$ 在 $C^*(1,h)$ 上是一个正的线性泛函（态的倍数），实值。这解释了为什么 Theorem 1.1 的不等式 $\tau(a+b)-\tau(a)-\tau(b)\ge 1/144$ 是**有意义的实数不等式**（Lean 里写成 `.re`，见四、4.3，那是一处口径差）。

**步骤 2：由 (ii) 得"复线性 ⟺ 实部/虚部可加"。** 任何 $x\in C$ 写成 $x=h+ik$（$h=\operatorname{Re}x,\ k=\operatorname{Im}x$ 自伴），(ii) 直接把 $\tau$ 的值由自伴部分决定；配合 (iii) 就得到"$\tau$ 在每个 abelian 子代数上是 $\mathbb C$-线性正泛函"。(ii) 是冗余保险还是必需？见 (d) 的候选失败路线 1。

**步骤 3：2-拟迹的角延拓自动把 $1_{M_2(C)}$ 的值钉为 2。** 论文用一行话证明（`02:17-19`）。展开：记延拓为 $\sigma$，$e=\begin{psmallmatrix}1&0\\0&0\end{psmallmatrix}$、$f=\begin{psmallmatrix}0&0\\0&1\end{psmallmatrix}$。取 $t=\begin{psmallmatrix}0&1\\0&0\end{psmallmatrix}$，则 $t^*t=f$、$tt^*=e$，由 (i) 得 $\sigma(e)=\sigma(f)$。而 $e,f$ 都在 abelian 子代数 $\mathbb C e\oplus\mathbb C f$ 内，(iii) 给 $\sigma(1_{M_2(C)})=\sigma(e+f)=\sigma(e)+\sigma(f)=2\sigma(e)=2\tau(1_C)=2$。这一步在 Lemma 5.2 里被推广到 $2N$ 个角（式 5.6 $\varphi(1)=1/(2N)$），是同一论证的 $N$ 角版本。

**步骤 4：Theorem 2.1 ⟹ 本文用法的两个方向。**
- 正向（用于 06）：$M_m(B)$ 全部不适当无穷 ⟹ $B$ 有规格化 2-拟迹。再往 $A=M_{48}(B)$ 上搬：$M_k(A)=M_{48k}(B)$（矩阵代数嵌套同构，`06:6-7` "because \(M_k(A)\cong M_{48k}(B)\) for every \(k\)"），故 $A$ 也满足条件 ⟹ $A$ 有规格化 2-拟迹。这是 Theorem 1.1 里"admitting a normalized 2-quasitrace"的全部内容，**不构造**。
- 反向（用于 07(ii)）：$B\otimes_{\min}R$ 本身（$m=1$）已适当无穷 ⟹ 它没有规格化 2-拟迹。注意这只需要"$m=1$ 一档"，比正向的"对一切 $m$"弱得多。

#### (c) 每个假设/常数的机械理由

- **为什么定义里只写 $M_2$ 而不是 $M_n$**：Haagerup 的"2-拟迹"约定就够了——$M_2$ 延拓已足以让 Lemma 5.2 里那种 $2\times2$ 型的角搬运算法生效。但注意 Lemma 5.2 的结论是对 $M_{2N}(B)$ 上的 **1-拟迹**陈述的，所以最终定理里"2-拟迹"的用量其实比表面看更小（见 2.5(c) 与 2.6(c)）。放大到 $M_n$ 定义"n-拟迹"只会让假设更强、反例更难造；缩小到"无矩阵延拓的 1-拟迹"则反例已有 Kirchberg 2006（`01:98-101`），命题变弱。
- **"normalized" 定为 $\tau(1_C)=1$ 而非 $\le1$**：为了让 $1_{M_2(C)}$ 上的值恰好是 2（步骤 3），从而式 (5.6) 的 $\varphi(1)=1/(2N)$ 精确成立；若是 $\le1$，缺陷 $(1-c)/(2N)$ 会退化为 $(1-c)\varphi(1)$ 而无显式下界，1/144 就没了。
- **"properly infinite 用两个 isometry"而不是"一个投影 $p\sim1\sim q$ 分解"**：等价（$s_1,s_2$ 的正交值投影给出 $1$ 的两个互相等价的真子投影）；选 $s_i^*s_j=\delta_{ij}1$ 的写法是为了让 §5 里能一句话把两个 isometry 拼成矩形 $W=[s_1\ s_2]$ 并要求 $W^*W=I_{2m}$（这是把"等距嵌入平凡丛"翻译成矩阵语言的关键，见 2.4(b) 步骤 3）。
- **"no assertion about finiteness of every projection is required"（`02:28-29`）**：这是明确放弃一个更强的自然性质（"finite"= 每个投影都有限）。机械理由：Theorem 2.1 的条件**只**涉及"没有两个正交值 isometry"，加上投影有限性的讨论不会给证明带来任何东西，但会让 §5 的拓扑排除失效（见 2.4(d) 候选路线 2）。
- **Theorem 2.1 的"⟸"方向为什么必须有 2-拟迹而不是迹**：该定理是 Cuntz–Blackadar–Handelman 型的，其输出天然是 2-拟迹（对应下半连续维数函数，`02:42-45` 引 BH）。若把结论加强成"存在迹态"，就正好是要否证的东西。
- **$m$ 跑遍全部正整数**：这是"稳定"两字的来源。本文的构造核心难点恰恰在"$m$ 无界"——每个 $m$ 需要一个独立的拓扑测试（见 2.4、2.5），所以 Theorem 2.1 的量化形式直接决定了构造必须是"一族测试"而不是"一个测试"。

#### (d) 候选失败路线 [推测]

1. **把 (iii) 换成"$\tau$ 在 $C^*(x)$ 上对每个单元素 $x$ 线性"** [推测]：这是 Blackadar 文献里出现过的弱化。失败机制——Lemma 5.2 的式 (5.6) 需要把**不同角上的**元素 $z_1,\dots,z_{2N}$ 合起来加，这要用到同时包含这些元素的 abelian 子代数上的线性性；单元素版本只给 $C^*(z_k)$ 内的线性，跨角合并时得不到 $\tau(\operatorname{diag}(z_k))=\sum\varphi(z_k)$，缺陷估计链条第一步就断。论文用的是"every abelian $C^*$-subalgebra"（成对交换 ⟹ 落在同一个 abelian 子代数），这个差别正是 06 里那句"This last step works for every normalized \(1\)-quasitrace on \(A\)"能成立的前提。
2. **想用 Theorem 2.1 直接得到"$B$ 稳定有限"** [推测]：定理只给"没有矩阵代数适当无穷"，与稳定有限（每个矩阵代数里 isometry 皆酉）在**非单**代数上不等价；$B$ 单性论文根本没证（也几乎不可能：$B$ 是可分且有大量坐标表示的子代数）。07(iii) 之所以要绕道"取 $AW^*$ 因子的有限生成子代数"而不直接用 $B$，机制就在这里（见 2.7(b) 步骤 4）。论文在 `01:130-131` 明确写了"we prove that no matrix algebra over \(B\) is properly infinite, not that \(B\) is stably finite"，说明作者意识到并主动划了这条线。
3. **用 Haagerup 的确切性定理路线** [推测]：$A$ 必须非确切（`01:94-95` "The constructed algebra is necessarily nonexact, by Haagerup's result."）。若构造过程中任何一步不小心把 $B$ 做成某个自由积/确切归纳极限的归纳极限，就会自动确切、自动被 Haagerup 定理否定掉整个目标。这大概是为什么 §5 用**有界积** $\mathcal D$（积代数不保持确切性）而不是用自由积或归纳极限来放生成元——[推测]，论文没有明写这一动机。

---

### 2.0b §2 末尾的无编号观察：$W^*W$ 可逆给出连续等距因子化

#### (a) 原文（`02:49-59`）

```tex
For finite-rank complex vector bundles, Hermitian metrics are fixed.
Adjoints, positive endomorphisms, and their square roots are taken
fiberwise. A positive lower bound on the adjoint square of a
continuous bundle map makes it injective with a continuous image
subbundle: if \(W^*W\) is invertible, then
\[
 Q=W(W^*W)^{-1/2},\qquad Q^*Q=I,
\]
has the same image, and \(QQ^*\) is its continuous orthogonal
projection. We will use this observation when passing from
polynomial operators to the Chern-class obstruction.
```

#### (b) 机制推导

逐纤维：$W_y:E_y\to F_y$ 线性单射（因 $W_y^*W_y$ 正定）；$Q_y=W_y(W_y^*W_y)^{-1/2}$ 满足 $Q_y^*Q_y=(W^*W)^{-1/2}W^*W(W^*W)^{-1/2}=I$，故 $Q_y$ 是等距；$\operatorname{ran}Q_y=\operatorname{ran}W_y$（右乘可逆同构不改像）；$Q_yQ_y^*$ 是到 $\operatorname{ran}W_y$ 的正交投影。连续性的来源是 $(T\mapsto T^{-1/2})$ 在正定锥上连续（函数演算 + 一致有界：$W^*W\ge\delta I$ 给出 $\|(W^*W)^{-1/2}\|\le\delta^{-1/2}$，从而 $\operatorname{ran}W_y$ 的"倾斜度"有界，像丛构成 $F$ 的**连续子丛**）。

这一步在 §5 里的具体用法（`05:114-121`）是：$P_0^*P_0\ge\tfrac12 I_{2m}$（式 5.2 逐纤维压到角上得到）⟹ $Q=P_0(P_0^*P_0)^{-1/2}$ 是连续纤维等距 ⟹ $\operatorname{ran}Q$ 是 $F_{m,R}$ 的连续子丛，同构于 $E_0^{\oplus2m}$（平凡，因为 $E_0$ 平凡），秩 $2md_0$ ⟹ 与 Chern 障碍 (4.4) 矛盾。

#### (c) 常数的机械理由

下界只需 $>0$（$P_0^*P_0\ge(1-2\delta-\delta^2)I$，$\delta=\|P-W\|$）；$\tfrac12$ 是 $\delta=1/5$ 时 $\delta^2+2\delta=0.44$ 的四舍五入余量（见 2.4(c)）。真正被"机制"钉住的是**逆平方根的连续一致界**：$\delta$ 越小，$(W^*W)^{-1/2}$ 越大，但只要 $\delta<\sqrt{3/2}-1$ 就仍有界。所以这里没有任何常数需要精确，只需要非零。

#### (d) 候选失败路线 [推测]

1. **直接在纤维层面断言像丛连续** [推测]：不写极因子化而只说"逐纤维单射的连续丛映射的像是子丛"，在非紧致底空间或没有一致下界时是错的（像的维度可以跳）。本文底空间 $Y_{m,R}$ 紧致、且 $P_0^*P_0\ge\tfrac12 I$ 全局成立，所以安全。论文明说"if $W^*W$ is invertible"而不是"pointwise injective"，说明作者知道这是需要一致可逆性的地方。
2. **绕开极分解，改用 $K$-理论/指标** [推测]：Chern 类障碍也可以用陈特征 + 上同环运算表达，但那样需要像丛的 $K$-类信息，而这里只需一个具体的最高次 Chern 类非零。选极分解是为了"连续子丛"这一最低限度的结构。
3. 论文未述其它失败提示。

---

### 2.1 Lemma 3.1（Avoiding small collective images，incidence 计数）

#### (a) 精确陈述（`03:9-28`，原文照抄）

```tex
\begin{lemma}[Avoiding small collective images]
\label{lem:incidence}
Let $E,F$ be smooth Hermitian complex vector bundles of ranks $d,r$ over
a compact smooth manifold $Y$ of real dimension $2h$, and let $q\geq1$.
Let $\mathcal A$ be a finite set of integer pairs $(s,t)$ with
$1\leq s\leq d$ and $0\leq t\leq r$ such that
\begin{equation}
  (qs-t)(r-t)-s(d-s)>h
  \qquad ((s,t)\in\mathcal A).
  \label{eq:incidence-dimension}
\end{equation}
There are smooth bundle maps $T_1,\ldots,T_q:E\to F$ such that, for every
$y\in Y$, every $(s,t)\in\mathcal A$, and every complex $s$-plane
$S\subset E_y$,
\[
  \dim_{\mathbb C}\sum_{i=1}^q T_i(y)S>t.
\]
Here and below the sum denotes linear span.  The same statement holds
over a point, with $h=0$.
\end{lemma}
```

量化顺序：给定 $(E,F,Y,q,\mathcal A)$ 满足维数不等式 ⟹ 存在**一组** $q$ 个光滑丛映射，对**所有**底点、**所有** $(s,t)\in\mathcal A$、**所有** $s$-平面同时生效（"simultaneously"是引理的全部价值所在——$\mathcal A$ 有限是关键）。

#### (b) 证明机制推导（五步）

**步骤 1：造一个"逐点满射求值"的有限维参数空间 $V$。** 取 $\operatorname{Hom}(E,F)$ 的有限平凡化开覆盖 $\{U_\alpha\}$ 与 subordinate 单位分解 $\{\rho_\alpha\}$（$\operatorname{supp}\rho_\alpha\subset U_\alpha$）。把 $U_\alpha$ 上的每个平凡化截面乘以 $\rho_\alpha$ 并零延拓，得到的截面全体张成的复线性空间 $V$ 是有限维的（有限覆盖 × 有限秩）。论断：求值映射 $V\to\operatorname{Hom}(E_y,F_y)$ 对每个 $y$ 满。理由（论文原话 `03:40-41`）："at least one partition function is nonzero there, and its multiplied frame still spans the fiber."——在 $y$ 处至少一个 $\rho_\alpha(y)\ne0$，而该 $\alpha$ 的（被 $\rho_\alpha$ 缩过的）平凡化框架仍张成整条纤维，乘以非零常数不改变张成。
这一步把"丛映射的全体"压缩成"有限维向量空间里的点"，是后面一切测度论证的前提。参数空间 $\mathcal V=V^q$，复维数 $M=\dim_\mathbb C V$，实维数 $2M$。求值 $\mathcal V\to\operatorname{Hom}(E_y,F_y)^q$ 仍满。

**步骤 2：数出"坏元组"构成的纤维丛的维数。** 固定 $(s,t)$。考虑 Grassmann 丛
$$\{(y,S,U):S\subset E_y,\ \dim_\mathbb C S=s,\ U\subset F_y,\ \dim_\mathbb C U=t\}.$$
实维数 $=2h+2s(d-s)+2t(r-t)$：底 $2h$；$s$-平面在 $\mathbb C^d$ 中的 Grassmannian $\operatorname{Gr}(s,d)$ 复维 $s(d-s)$；$t$-平面在 $\mathbb C^r$ 中复维 $t(r-t)$。论文直接把这三个数相加（`03:45-50`），没有展开证明——这是标准事实。

**步骤 3：造"关联丛" $\mathcal I_{s,t}$ 并数它的维数。** 在上述 Grassmann 丛上，从平凡丛 $\mathcal V\times(\cdot)$ 到丛（纤维为 $\operatorname{Hom}(S,F_y/U)^q$）的映射：$(T_1,\dots,T_q)\mapsto(\operatorname{res}:\;S\to F_y/U\ \text{by}\ T_i)$。**逐纤维满射**（`03:52-55`）："any linear map $S\to F_y/U$ extends to a map $E_y\to F_y$"（线性代数：先把 $S$ 的基映过去，再零延拓到 $E_y$ 的一个补空间），"and evaluation from $V$ is surjective"（步骤 1）。目标丛复秩 $qs(r-t)$（每个 $i$ 给 $s(r-t)$）。于是核丛 $\mathcal I_{s,t}$（"这组映射把某个 $s$-平面塞进某个 $t$-平面"的元组集合）是全空间的闭子流形，实维数
$$2M+2h+2s(d-s)+2t(r-t)-2qs(r-t).$$
把它 $<2M$ 化简：两边减 $2M$、除 2，得 $h+s(d-s)+t(r-t)-qs(r-t)<0$，即 $h+s(d-s)<(qs-t)(r-t)$，正是 (3.1)（`03:60-62` 说 "where the inequality is precisely \eqref{eq:incidence-dimension}"）。**这一步是整条引理的算术核心：incidence 不等式不是"启发式余量"，而是核丛维数严格小于参数空间维数的等价改写。**

**步骤 4：投影的像是零测集。** $\pi:\mathcal I_{s,t}\to\mathcal V$ 光滑，$\dim_{\mathbb R}\mathcal I_{s,t}<2M=\dim\mathcal V$。论文的论证（`03:64-74`）不用 Sard 的一般形式，而用"Sard 的降维情形"加一个显式的 Lipschitz + 立方体细分论证：
- 在紧坐标片上 $\pi$ 是 Lipschitz；
- 边长 $\delta$ 的立方体细分给出 $O(\delta^{-a})$ 个原像块，每块像被 $O(\delta)$ 半径的球覆盖（$a=\dim\mathcal I_{s,t}<2M$）；
- 总 $2M$-体积 $\lesssim \delta^{-a}\cdot\delta^{2M}=\delta^{2M-a}\to0$；
- "A countable exhaustion by such patches handles the possibly noncompact total space."（$\mathcal I_{s,t}$ 可能非紧，因为 $\mathcal V$ 非紧）。
注意 $\mathcal V$ 是向量空间（$\sigma$-紧），Lebesgue 测度从零测度覆盖论证直接得到。

**步骤 5：有限并。** $\mathcal A$ 有限 ⟹ 坏集合并仍零测 ⟹ $\mathcal V$ 中真存在好元组（甚至"几乎所有"）。取之，逐点解释即得结论。$\dim>t$ 是"$\not\le t$"的对偶：坏 ⟺ $\exists S,\ \dim\sum T_iS\le t$ ⟺ $\exists S\ \exists U(\dim U=t)\ \forall i:\ T_iS\subset U$，即元组落在 $\mathcal I_{s,t}$ 的像里。

#### (c) 每个假设/常数的机械理由

- **底空间实维数写成 $2h$（偶数）**：不是巧合。因为底空间在应用中全是 $\prod\mathbb{CP}^{K_i}$，实维数 $\sum 2K_i$。写成 $2h$ 让 (3.1) 右边 $h$ 与左边 Grassmann 维数 $2s(d-s)$ 在同一"复维"单位下比较（两边同除 2 后 $h$ 是底空间的**复**维数）。若底是奇数维实流形，引理仍然成立但要把 $2h$ 换成 $\dim Y$、右边取 $\lfloor\cdot\rfloor$；作者选了够用且最干净的形式。
- **$q\ge1$**：$q=1$ 时不等式成为 $(s-t)(r-t)-s(d-s)>h$，通常无法满足（$r$ 要远大于 $d$），但在**逐块**情形 $r=D/4>d=D$ 不成立——所以 $q$ 的意义是把 $qs(r-t)$ 放大 $q$ 倍，等价于"多映射共享同一目标余维"。应用中 $q=16$ 与 $q=8$（见 2.3）。
- **$(s,t)$ 的量化：$1\le s\le d$、$0\le t\le r$**：$s=0$ 无意义（零空间的像和是 0，不可能 $>t\ge0$），所以从 1 起；$t=0$ 允许，含义是"像和非零"，在 $s\ge1$ 时正是"映射集体无公共核"的形式。$t\le r$ 是 $U\subset F_y$ 存在的必要条件，也是 $\mathcal I_{s,t}$ 定义良好所需。
- **$\mathcal A$ 必须有限**：步骤 5 用的是有限并的零测性。若 $\mathcal A$ 可数无穷，可数并仍是零测集，所以**结论其实对可数 $\mathcal A$ 也成立**——但论文的有限性来自应用：$\mathcal A=\{(s,2s):1\le s\le m\}$ 或 $\{m<s\le d\}$，随 $m,R$ 有限。写成有限是为了不在证明里处理 $\mathcal A$ 可数时"好元组是否存在"与"光滑性是否逐点一致"的额外技术细节。
- **不等式严格 "$>h$"**：若改成 $\ge h$，则核丛实维数 $\le 2M$，可能是满维（甚至投影的像可含内点），零测性论证崩掉，无法保证好元组存在。$>h$ 提供的余量在应用里被数出来：小块情形余量是 $133ms>0$（式 4.7），大块情形是 $(21/2)sd-\eta_j>0$（式 4.8）。这两个显式正数是论文里"为什么是 16 和 8 而不是 15 和 7"的唯一硬证据。
- **"The same statement holds over a point, with $h=0$"**：这不是修辞。$h=0$ 时 $Y$ 是单点，丛映射退化为矩阵，单位分解/Grassmann 丛步骤仍然有效（$2h=0$），而 §4 的十六个"小块映射"正是逐块地在**点**上做（因为它们是 scalar 矩阵张量 $\operatorname{id}_{L_i}$，与底无关）。这条附注把"是否需要底空间维数预算"分成两种预算，见 2.3(c)。
- **光滑性（"smooth bundle maps"）**：结论只需要连续，但证明用维数/ Sard 型论证，需要参数化是光滑的，因此取光滑类。$C^*$-代数侧最终只用到连续（§5 里 $X_i^{(j)}$ 只要求连续即可）。

#### (d) 候选失败路线 [推测]

1. **不用单位分解造 $V$，而直接取"所有光滑丛映射"这个 Fréchet 空间** [推测]：无穷维空间没有 Lebesgue 测度，零测性论证不可用；要用无穷维版本（如泛 Baire / 残余集论证）则结论退化为"存在性好元组"但失去"开稠"式的稳定性，且很难处理逐点同时性。作者用一个有限维子空间换掉全体，代价是必须证明求值满射（步骤 1 那句 partition function 的话就是为此付出的）。
2. **用 Sard 定理（临界值测度）而非降维 Lipschitz 论证** [推测]：Sard 要求映射足够光滑（$C^k$，$k>$ 维数商），且需要论证"每个坏元组都是某个投影的临界值"——而这里 $\pi$ 的像本身来自降维定义域，临界值定理是过强的工具。论文写 "as in the lower-dimensional case of Sard's theorem \cite{Sard}"，实际给的是自包含的立方体细分证明，[推测] 是为了避开 $C^k$ 正则性阈值的额外假设。
3. **把 $\mathcal A$ 换成无穷（例如要求所有 $s$ 一律膨胀 2 倍而不加 $t=2s$ 的预算）** [推测]：这正是 §4 里"分成 16 个小块映射 + 8 个大块映射"两套 $\mathcal A$ 的原因：单个 $\mathcal A$ 若同时含 $s=1$ 与 $s=d$，则 $t=2s$ 在 $s$ 大时超过 $r$（$2s\le 2d<r=15d/4$ 勉强成立，但对 $r=D/4$ 的小块立刻失败），且 $-s(d-s)$ 项在 $s\sim d/2$ 时最负。见 2.3(c)：小块用 $r=D/4$ 只能覆盖 $s\le m$，大 $s$ 必须换到 $r=15d/4$ 的新块。
4. **想同时把 $T_i$ 选成满足规格化（列和为 1）的映射** [推测]：incidence 论证只在参数空间 $\mathcal V^q$（无范数约束的开集）里做，若先验地把 $T_i$ 限制在"$\sum T_i^*T_i=I$"这种非线性的约束流形上，维数计数与满射性都失去。作者的解法是**解耦**：先用 3.1 拿到膨胀性（不管范数），再用 3.2 把它规格化（不管拓扑）。这两条引理谁也不用谁（依赖图里已说明），[推测] 这不是偶然而是本论文最重要的方法论设计。

---

### 2.2 Lemma 3.2（Continuous normalization，determinant potential）

#### (a) 精确陈述（`03:86-104`）

```tex
\begin{lemma}[Continuous normalization]
\label{lem:scaling}
Let $E,F$ be Hermitian complex vector bundles of positive ranks over a
compact manifold $Y$.  Suppose that continuous bundle maps
$T_1,\ldots,T_n:E\to F$ satisfy
\begin{equation}
  \dim_{\mathbb C}\sum_{i=1}^n T_i(y)S
  \geq 2\dim_{\mathbb C}S
  \qquad (y\in Y,\ S\subset E_y).
  \label{eq:expansion}
\end{equation}
Then there are continuous bundle maps $X_1,\ldots,X_n:E\to F$ with
\begin{equation}
  \sum_{i=1}^nX_i^*X_i=I_E,
  \qquad
  \sum_{i=1}^nX_iX_i^*\leq\frac23 I_F.
  \label{eq:scaled-bounds}
\end{equation}
\end{lemma}
```

注意：输入输出都是**同一个 $n$**（映射个数不变！这是保住"$B$ 只需 24 个生成元"的关键），$2$ 出现在假设 (3.2)，$2/3$ 出现在结论 (3.3)。

#### (b) 证明机制推导（五个 paragraph，逐段展开）

**段落 0（设置）。** 记 $d=\operatorname{rank}E$、$r=\operatorname{rank}F$。逐纤维定义
$$D_y(P)=\sum_{i=1}^nT_i(y)\,P\,T_i(y)^*,\qquad g_y(P)=\log\det(I_{F_y}+D_y(P))-\tfrac32\log\det P,$$
定义域 $P\in\operatorname{End}(E_y)$ 正定。"Both determinants are intrinsic"：$\det$ 是自伴算子的谱不变量，换基（酉共轭）不变，所以不需要局部平凡化就能定义函数（这一句为段落 3 的粘合铺路）。总策略：证明 $g_y$ 有**唯一**极小元，且随 $y$ 连续，然后由极小性的一阶条件显式写出 $X_i$。

**段落 1（一致紧的下层集）。** 目标：找一个与 $y$ 无关的紧区间 $[a,A]\subset(0,\infty)$，使 $g_y$ 在 $\{aI\le P\le AI\}$ 之外严格大于 $g_y(I)$，从而极小元落在该紧集内部。

1. 先证**特征值一致下界 $\epsilon$**。对秩 $s$ 正交投影 $p$：
$$\operatorname{ran}D_y(p)=\sum_iT_i(y)\operatorname{ran}p.$$
论文给出的理由是"both sides have orthogonal complement $\bigcap_i\ker(pT_i(y)^*)$"——注意这里是 $p$ 作用在**左边**（$\ker(p\,T_i^*)$ 是那些被 $T_i$ 映到 $(\operatorname{ran}p)^\perp$ 方向的向量），两边正交补相同 ⟹ 两边相同。这个等式把"算子 $D_y(p)$ 的像"与"丛几何的像和"接上。
由 (3.2)：$\dim\operatorname{ran}D_y(p)=\dim\sum_iT_i\operatorname{ran}p\ge 2s$。于是自伴正算子 $D_y(p)$ 的第 $2s$ 大特征值 $\mu_{2s}(D_y(p))>0$。（"in particular $r\ge2d$"：取 $s=d$，需要 $F_y$ 至少 $2d$ 维；这是引理的**隐含可行性条件**，见 (c)。）
"$\mu_{2s}(D_y(p))>0$ 逐点成立" 升级为 "$\ge\epsilon>0$ 一致成立"：特征值是矩阵系数的连续函数；$(y,p)$  lives 在"$Y$ × 秩 $s$ 投影的 Grassmann 丛"这个**紧**空间上；先对 $(y,p)$ 取下确界（连续函数在紧集上取到最小值，且恒正 ⟹ 最小值 $\ge\epsilon_s>0$），再对 $1\le s\le d$ 取有限最小，得 $\epsilon$。
2. 再把它搬到一般的 $P$。设 $P$ 的特征值 $\lambda_1\ge\dots\ge\lambda_d>0$，取 $p_s$ 为"顶部 $s$ 个特征向量的投影"（任意一个）。则 $P\ge\lambda_sp_s$（作为算子序：$P-\lambda_sp_s$ 在 $\operatorname{ran}p_s$ 上 $\ge\lambda_s-\lambda_s=0$、在正交补上 $\ge0$）。$D_y$ 单调（$P_1\le P_2\implies D_y(P_1)\le D_y(P_2)$，因为 $D_y(P_2-P_1)=\sum T_i(P_2-P_1)T_i^*\ge0$）⟹ $D_y(P)\ge\lambda_sD_y(p_s)$ ⟹ 特征值单调性给 $\mu_{2s}(D_y(P))\ge\lambda_s\mu_{2s}(D_y(p_s))\ge\epsilon\lambda_s$。
3. 配对特征值取行列式：$\det(I+D_y(P))=\prod_{k=1}^r(1+\mu_k(D_y(P)))$。把指标配对成 $(2s-1,2s)$，$s=1..d$；因为 $\mu$ 递减，$\mu_{2s-1}\ge\mu_{2s}\ge\epsilon\lambda_s$，每对贡献 $\ge(1+\epsilon\lambda_s)^2$；剩下 $\max(r-2d,0)$ 个非负项丢弃（论文原话 "discarding any remaining nonnegative terms"——$1+\mu\ge1$ 所以丢弃是安全的下界方向）。得式 (3.4)：
$$\log\det(I+D_y(P))\ge 2\sum_{s=1}^d\log(1+\epsilon\lambda_s).$$
4. 定义 $f(t)=2\log(1+\epsilon t)-\tfrac32\log t$。$t\to0^+$ 时 $-\tfrac32\log t\to+\infty$；$t\to\infty$ 时 $2\log(\epsilon t)-\tfrac32\log t=(\tfrac12)\log t+\text{const}\to+\infty$。故 $f$ 有下界 $b=\min f>-\infty$。令 $C=\max_{y\in Y}g_y(I_{E_y})$（紧性 + 段落 3 的连续性保证 $y\mapsto g_y(I)$ 连续；事实上 $g_y(I)$ 连续由 $T_i$ 连续直接得，不需要极小元）。
把 (3.4) 与 $-\tfrac32\log\det P=-\tfrac32\sum_j\log\lambda_j$ 合起来：
$$g_y(P)\ \ge\ \sum_{j=1}^d\Big[2\log(1+\epsilon\lambda_j)-\tfrac32\log\lambda_j\Big]-\text{(重复计数)}\,?$$
这里必须补出论文的省略：不等式 (3.4) 用**同一批** $\lambda_j$ 写两遍（$s=j$ 时给出 $\lambda_j$ 的那一项），故
$$g_y(P)\ \ge\ \sum_{j=1}^d f(\lambda_j)=f(\lambda_1)+\dots+f(\lambda_d).$$
若 $g_y(P)\le C$，则对每个 $j$：$f(\lambda_j)\le C-\sum_{i\ne j}f(\lambda_i)\le C-(d-1)b$（因每个 $f\ge b$）。这正是论文写的 $f(\lambda_j)\le C-(d-1)b$。由于 $f(t)\to+\infty$ 于两端，集合 $\{t>0:f(t)\le C-(d-1)b\}$ 是 $(0,\infty)$ 内的紧区间 $[a,A]$。⟹ 所有满足 $g_y(P)\le C$ 的 $P$ 的特征值都在 $[a,A]$，即 $aI\le P\le AI$。在此紧集之外 $g_y(P)>C\ge g_y(I_{E_y})$ ⟹ 逐纤维极小元存在（Weierstrass）且落在正定锥内部。

**段落 2（沿正定测地线的严格凸性）。** 固定 $P_0>0$ 与 Hermitian $H\ne0$，令 $P(u)=P_0^{1/2}e^{uH}P_0^{1/2}$（这是 $\operatorname{Pos}$ 上的"线性化测地线"，$u\in\mathbb R$）。取 $H$ 的标准正交特征基 $e_j$（特征值 $h_j$），记 $v_{ij}=T_iP_0^{1/2}e_j$，则
$$D(P(u))=\sum_{i,j}e^{uh_j}v_{ij}v_{ij}^*.$$
（核对：$P(u)=\sum_je^{uh_j}(P_0^{1/2}e_j)(P_0^{1/2}e_j)^*$，代入 $D$ 的定义即得。）
Gram 行列式展开（$\det(I+CC^*)=\sum_{\text{列子集}}|\det C_{\text{子集}}|^2$，Cauchy–Binet）应用于以 $e^{uh_j/2}v_{ij}$ 为列的算子，把
$$\det(I+D(P(u)))=\sum_\alpha c_\alpha e^{u\alpha},\qquad c_\alpha\ge0,$$
写成有限正指数和：$\alpha$ 跑遍被选列对应的 $h_j$ 之和，$c_\alpha=\sum_{\text{给出该 }\alpha\text{ 的子集}}|\det|^2$。
- 空子集贡献 $1$（即 $\alpha=0$，系数 $\ge1$）。
- 单元素子集贡献 $\|v_{ij}\|^2e^{uh_j}$，故**每个 $h_j$ 处的单元素系数 $\sum_i\|v_{ij}\|^2=\sum_i\|T_iP_0^{1/2}e_j\|^2>0$**——非零的理由：$P_0^{1/2}e_j\ne0$，且由 (3.2)（取 $S=\mathbb C\cdot P_0^{1/2}e_j$，一维）"the common kernel of the maps $T_i$ is trivial"，所以至少一个 $T_i$ 在其上非零。⟹ 指数集合含 $0$（常数项）**和**至少一个非零 $h_j$（"Since some $h_j\ne0$"）。
- 关键分析事实：$\dfrac{d^2}{du^2}\log\big(\sum_\alpha c_\alpha e^{u\alpha}\big)$ $=$ 概率测度 $\propto c_\alpha e^{u\alpha}$ 下 $\alpha$ 的**方差** $\ge0$；当指数集合含 $\ge2$ 个不同值且相应系数正时严格 $>0$。故 $\log\det(I+D(P(u)))$ 关于 $u$ 严格凸。
- $\log\det P(u)=\log\det P_0+u\operatorname{tr}H$（因 $\det P_0^{1/2}e^{uH}P_0^{1/2}=\det P_0\cdot e^{u\operatorname{tr}H}$）是**仿射**的，$-\tfrac32$ 倍仍是仿射。
⟹ $g(P(u))$ 严格凸。任意两个正定 $P_0,P_1$ 由 $H=\log(P_0^{-1/2}P_1P_0^{-1/2})$ 相连（$u=0\mapsto P_0$、$u=1\mapsto P_1$）⟹ 极小元唯一。

**段落 3（连续性与粘合）。** 局部酉标架下 $(y,P)\mapsto g_y(P)$ 连续（$T_i$ 连续 + $\log\det$ 连续），极小元在同一个紧集 $\{aI\le P\le AI\}$ 里。取 $y_k\to y$，极小元 $P_k$ 的任一收敛子列的极限 $P_\infty$：对任意固定正定比较矩阵 $R$，"pass to the limit in the minimizing inequality" 即 $g_{y_k}(P_k)\le g_{y_k}(R)$ ⟹ $g_y(P_\infty)\le g_y(R)$ ⟹ $P_\infty$ 是 $g_y$ 的极小元。唯一性 ⟹ 整个序列收敛到该极小元 ⟹ $y\mapsto P_y$ 连续。
在两个酉标架的重叠区，$P\mapsto UPU^*$、$I_F+D(P)\mapsto U(I_F+D(P))U^*$（酉共轭，因为 $T_i$ 作为丛映射在标架变换下是 $T_i\mapsto UT_iU_E^*$ 型，$D$ 里 $T_iPT_i^*$ 恰好把两个标架变换消掉），$\det$ 不变 ⟹ 极小元的定义与标架无关 ⟹ 局部极小元粘成 $E$ 的整体连续正定自同态 $P$。**"uniqueness makes the normalization compatible with changes of bundle frame"（`01:198-199`）就是这一段的功能陈述**：如果极小元不唯一，不同标架里选出的极小元可能不重合，就无法粘。

**段落 4（一阶条件 + 显式公式）。** 记 $Q=I_F+D(P)$。在极小点沿任意 Hermitian 方向 $K$ 求导：
$$\frac{d}{du}\Big|_0\log\det(Q+D(uK))=\operatorname{tr}\big(Q^{-1}D(K)\big)=\operatorname{tr}\Big(\big(\sum_iT_i^*Q^{-1}T_i\big)K\Big),$$
$$\frac{d}{du}\Big|_0\log\det(P+uK)=\operatorname{tr}(P^{-1}K).$$
（用了 $\operatorname{tr}(Q^{-1}T_iKT_i^*)=\operatorname{tr}(T_i^*Q^{-1}T_iK)$ 的循环性。）合起来 $0=\operatorname{tr}\big[(\sum_iT_i^*Q^{-1}T_i-\tfrac32P^{-1})K\big]$ 对**所有** Hermitian $K$ ⟹ 由 Hermite 空间上迹配对非退化，得
$$\sum_iT_i^*Q^{-1}T_i=\tfrac32P^{-1}.$$
定义 $X_i=\sqrt{\tfrac23}\,Q^{-1/2}T_iP^{1/2}$（连续函数演算 ⟹ 连续丛映射），则
$$\sum_iX_i^*X_i=\tfrac23P^{1/2}\Big(\sum_iT_i^*Q^{-1}T_i\Big)P^{1/2}=\tfrac23\cdot\tfrac32 P^{1/2}P^{-1}P^{1/2}=I_E,$$
$$\sum_iX_iX_i^*=\tfrac23Q^{-1/2}D(P)Q^{-1/2}=\tfrac23Q^{-1/2}(Q-I_F)Q^{-1/2}=\tfrac23(I_F-Q^{-1})\le\tfrac23I_F,$$
最后一步用 $Q=I+D(P)\ge I>0$ ⟹ $Q^{-1}\le I$ ⟹ $I-Q^{-1}\ge0$ 且 $\le I$。这就是 (3.3)。
**注意"$\tfrac23$"从哪来**：它纯粹是 $\alpha=\tfrac32$ 的倒数 $\alpha^{-1}=2/3$（因为一阶条件给出系数 $\alpha$，而 $X_i$ 前的归一化取了 $\sqrt{\alpha^{-1}}$）；不等式侧 $\tfrac23(I-Q^{-1})$ 里那个 $I-Q^{-1}\le I$ 是**放缩损失**的唯一来源。

#### (c) 每个假设/常数的机械理由

- **系数 $\tfrac32$（$g_y$ 里 $-\tfrac32\log\det P$）**：它同时决定三件事。(i) 结论的行界是 $1/\tfrac32=2/3$；(ii) 强制 $\tfrac32<$ 假设里的膨胀率 $2$，否则 $f(t)=2\log(1+\epsilon t)-\tfrac32\log t$ 在大 $t$ 端不再是 $+\infty$（若系数 $\alpha\ge2$，则 $f(t)\to(\text{sign}(\le0))\log t$，$\alpha=2$ 时对 $\epsilon$ 的依赖：$2\log(\epsilon t)-2\log t=2\log\epsilon$ 常数，$\alpha>2$ 时 $-\infty$，下层集不再紧 ⟹ 极小元可逃向无穷 ⟹ 段落 1、3 全崩）；(iii) 一阶条件右侧出现 $\tfrac32P^{-1}$，与 $\sqrt{2/3}$ 归一化配平给出列和恰好 $=I_E$。**放大** $\alpha$（接近 2）会让行界 $1/\alpha$ 接近 $1/2$（对缺陷更好），但余量 $\epsilon$ 与 $a,A$ 会退化；**缩小** $\alpha$ 让行界变大、失去 $c<1$（$\alpha\le1$ 时行界 $\ge1$，两条关系不再互斥，迹态障碍消失）。$\alpha=3/2$ 是让"$2/\alpha$ 型余量 $\tfrac12$ 严格为正"且行界为干净的 $2/3$ 的折中。论文自述："The expansion factor $2$ and the coefficient $3/2$ leave a strict margin that prevents this minimizer from escaping to infinity."（`03:116-118`）
- **膨胀率 $2$（假设 (3.2) 里的 $2\dim S$）**：$2$ 是"$\mu_{2s}$ 有正下界"这个配对方案的直接产物——要把 $P$ 的第 $s$ 大特征值配对到 $D(P)$ 的第 $2s$ 大特征值，恰好需要像维数至少 $2s$。若膨胀率是 $\kappa$，配对 $(\kappa s-\kappa+1,\dots,\kappa s)$ 需要目标秩 $r\ge\kappa d$，行界变成 $1/\alpha$（$\alpha<\kappa$）。取 $\kappa=2$ 是让 §4 的 $t=2s$ 与"$16+8=24$"这两个预算刚好落地的最小整数（$\kappa=1$ 显然不够，因为 $f$ 的下界论证需要 $2$ 与 $\tfrac32$ 的差）。
- **$\det(I+D(P))$ 里那个 "$+I$"**：若写 $\det D(P)$，当 $D(P)$ 不满秩（$r>d$ 时必然有零特征值，因为 $\operatorname{rank}D(P)\le nd$ 但更关键的是 $r>2d$ 时像空间维数不足 $r$……实际障碍是 $D(P)$ 可以奇异）则 $\log$ 为 $-\infty$，$g$ 不定义在正定锥内部之外，凸性/连续性论证全废。$+I_F$ 把定义域整体保在 $\det>1$ 的光滑区。代价是行界变成 $1-\;Q^{-1}$ 型不等式而非严格更小；这正是损失掉的那一项。
- **"$\ge2\dim S$ 对所有 $S$"（包括 $S=0$ 与 $\dim S=d$）**：$S=0$ 平凡；$\dim S=d$（全空间）时要求 $\dim\sum_i\operatorname{ran}T_i\ge2d$，即目标秩 $r\ge 2d$——论文在段落 1 里主动指出"in particular $r\geq2d$"（`03:127-128`），这不是闲笔：它给出 §4 里"$d=d_j$、$r$ 必须 $\ge 2d_j$"的硬约束，而 §4 的 $E_{j+1}$ 秩是 $4d_j\ge2d_j$ ✓。
- **$n$ 不变（输入 $n$ 个 $T_i$、输出 $n$ 个 $X_i$）**：若允许增加映射个数，$B$ 的生成元数就不再是 24，与"$C^*$ 代数由固定有限个生成元生成"这条主干冲突（intro `01:153-156` "The fixed number of generators preserves the trace obstruction while all finite polynomial candidates are excluded"）。
- **$Y$ 紧**：段落 1 的 $\epsilon$（连续函数在紧集上取正下界）、$C=\max_yg_y(I)$、段落 3 的子列论证全部依赖紧性。若底非紧，$\epsilon$ 可以退化到 0，$[a,A]$ 变成 $(0,\infty)$，极小元失去一致紧界，连续性仍逐点成立但无法保证**连续粘合**（无统一界）。§4 的底 $\prod\mathbb{CP}^{K_i}$ 紧 ✓。
- **"continuous"而非"smooth"**：因为极小元是变分问题的解，不是代数构造；$P$ 是逐纤维解析的（一阶条件含解析映射），原则上可证光滑，但 $C^*$-代数侧只要连续，作者没有多花力气。这也解释了 3.2 的陈述用 continuous 而 3.1 用 smooth——两条引理的证明工具各自需要的那一档。

#### (d) 候选失败路线 [推测]

1. **逐纤维独立选规格化（例如每纤维取 $\tilde X_i=T_i(T^*T)^{-1/2}$ 之类）** [推测]：$\sum_iT_i^*T_i$ 一般只是可逆正元（当 $\cap\ker T_i=0$），这样得到列和 $=I$，但**行和毫无控制**——行和是 $\sum T_i(T^*T)^{-1}T_i^*$，其范数可以接近 $\dim E$ 级别而不是 $<1$，$c<1$ 这条迹障碍就丢了。det-势的价值恰是把"行和 $\le 2/3$"作为**变分问题的副产品**逼出来（一阶条件同时控制两侧）。这也解释了为什么必须证极小元唯一：非唯一 ⟹ 无法跨标架粘合 ⟹ 丛上的连续规格化不存在（只在局部平凡化里存在）。
2. **用算术–几何平均 / 迭代算子缩放（operator scaling 的算法版本，即 Gurvits / Burgisser 等的迭代格式）** [推测]：迭代算法给出的是"近似 doubly-stochastic"（$\sum X^*X$ 与 $\sum XX^*$ 都趋近某个标量矩阵，但不精确等于 $I$ 与 $\le\tfrac23I$），而本文需要 $\sum x_i^*x_i=1$ **精确成立**（否则关系 $\sum x^*x=1$ 与 $\sum xx^*\le c<1$ 不相容，见 2.4(b) 里 $1=\tau(\sum x^*x)=\tau(\sum xx^*)$ 的等号）。此外迭代的极限选择若依赖起点，就不给出唯一的 $P$，跨标架粘合失败。论文只引 Gurvits 的"capacity"观点（`03:78-84`）作为方法学来源而不引迭代格式，[推测] 正是因为这里要的是"精确 + 唯一"而不是"近似 + 快"。
3. **用 Sra–Hosseini 的锥上几何优化框架直接引用现成定理** [推测]：文献里的严格凸性结论一般是对 $\log\det A(x)$（$A$ 仿射）给凸性，而本文的目标含 $\log\det(I+D(P))$ 其中 $P\mapsto D(P)$ 是线性、$P\mapsto I+D(P)$ 在**目标侧**，$\log\det$ 的凸性方向恰好相反（$\log\det$ 在正定锥上凹），所以要靠 Gram/Cauchy–Binet 展开成指数和再用"方差恒等式"证严格凸。作者明写"We prove the version needed here, including the strict convexity and continuity"（`03:82-84`）——直接引用现成定理是走不通的。
4. **不证唯一性、用选择公理逐点选极小元** [推测]：得到的 $y\mapsto P_y$ 一般不连续，于是 $X_i$ 不是连续丛映射，§5 里"$P_0$ 是连续丛映射、其像是连续子丛"整条链断掉。论文 `03:200-207` 用子列极限 + 唯一性给连续性的写法，正是为了避开任何选择公理式论证（注意 Lean 端 permitted_axioms 里其实**有** `Classical.choice`，见四、4.6——所以这里更可能是数学上的洁癖，而不是可形式化的限制 [推测]）。

---


### 2.3 Proposition 4.1（Bundle tests of bounded degree，有限拓扑测试）

#### (a) 精确陈述（`04:14-37`）

```tex
\begin{proposition}\label{prop:bundle-test}
For every pair of integers $m,R\geq 1$, set
\begin{equation}\label{eq:test-ranks}
 d_0=64m4^R,\qquad d_j=4^j d_0\quad(0\leq j\leq R).
\end{equation}
There are a compact smooth manifold $Y$, Hermitian complex vector bundles
$E_j\to Y$ for all $j\geq0$, and continuous bundle maps
$X_i^{(j)}:E_j\to E_{j+1}$, for $1\leq i\leq24$ and $j\geq0$, such that
$E_0$ is trivial of rank $d_0$, the rank of $E_j$ is $d_j$ for
$0\leq j\leq R$, and
\begin{equation}\label{bundle:scaled-identities}
 \sum_{i=1}^{24}(X_i^{(j)})^*X_i^{(j)}=I_{E_j},
 \qquad
 \sum_{i=1}^{24}X_i^{(j)}(X_i^{(j)})^*
 \leq\frac23 I_{E_{j+1}}.
\end{equation}
Moreover,
\begin{equation}\label{eq:chern-obstruction}
 \begin{gathered}
 \left(\bigoplus_{j=0}^R E_j\right)^{\oplus m}\\
 \text{contains no trivial subbundle of rank }2md_0.
 \end{gathered}
\end{equation}
\end{proposition}
```

陈述里有五个必须同时成立的性质，它们的相容性就是整节的困难所在：
(1) 生成元个数固定 $=24$；(2) 每级映射满足精确的列和 $=I$ 与行和 $\le\tfrac23I$（与 $(m,R)$ 无关的**同一组**常数）；(3) $E_0$ 平凡（秩 $d_0$）；(4) 到 $R$ 级为止的直和 $m$ 份里没有秩 $2md_0$ 的平凡子丛；(5) 一切只对 $j\le R$ 负责，$j>R$ 是纯填充。

#### (b) 证明机制推导（五段）

**段落 1：丛与底（设计动机段，`04:40-49`）。** 论文先自述设计原则（这段是"思维链"最接近原文的地方，三、叙事时间线会引用）：
```tex
The bundles must satisfy two requirements.  Their sum through level $R$
must retain a Chern class after allowing the trivial directions coming
from $E_0$.  At the same time, successive bundles must admit a fixed
number of maps that expand every source subspace.  We reduce each old
line-bundle multiplicity by a factor of four at every step, so the total
trivial part stays small.  Each new projective-space factor is then sized
to retain the Chern class contributed by every later occurrence of its
line bundle.  The initial rank leaves enough room in the reduced blocks
to expand small subspaces; a large new block handles the others.
```
具体参数（`04:52-77`）：
```tex
 b_i=\frac{15}{4}d_{i-1}.\qquad
 a_{0,j}=d_0 4^{-j}=64m4^{R-j},\qquad
 a_{i,j}=b_i4^{-(j-i)}=960m4^{R+2i-j-2}\ (1\leq i\leq j\leq R).
 K_i=m\sum_{j=i}^R a_{i,j}=320m^2 4^{2i-2}\bigl(4^{R-i+1}-1\bigr),\qquad
 Y=\prod_{i=1}^R\mathbb{CP}^{K_i}.
 E_j=\bigoplus_{i=0}^j L_i^{\oplus a_{i,j}}\qquad(0\leq j\leq R).
```
$L_0$ 平凡线丛；$L_i$（$i\ge1$）是第 $i$ 个 $\mathbb{CP}^{K_i}$ 因子上的超平面线丛拉回。

**推导：秩递推。** $\operatorname{rank}E_{j+1}=\sum_{i=0}^{j}\frac{a_{i,j}}4+b_{j+1}=\frac14d_j+\frac{15}{4}d_j=4d_j=d_{j+1}$。即"每级把旧乘度全除 4，再加一个 $b_{j+1}=\frac{15}{4}d_j$ 的新块"。归纳给出 $\operatorname{rank}E_j=d_j$。
**推导：$\sum_{i=0}^ja_{i,j}=d_j$ 的闭合形式。** $\sum_{i=1}^jb_i4^{-(j-i)}=\frac{15}{4}d_0\sum_{i=1}^j4^{2i-1-j}=\frac{15}{4}d_0\cdot\frac{4^{j+1}-4^{1-j}}{15}=d_04^j-d_04^{-j}$，加上 $a_{0,j}=d_04^{-j}$ 得 $d_04^j=d_j$ ✓（论文用归纳绕过这个和式，但和式本身是自检）。
**推导：整数性。** $a_{i,j}=60m\,4^{R+2i-j}$（与论文的 $960m4^{R+2i-j-2}$ 相同，因为 $960/16=60$），指数 $R+2i-j\ge R-j\ge0$ ✓；$b_i=240m4^{R+i-1}$ ✓；$K_i=320m^24^{2i-2}(4^{R-i+1}-1)$ ✓（$i=1,R=1$ 时 $=960m^2$）。论文原话 "All these numbers are positive integers"（`04:64`）、"Thus every $K_i$ is a positive integer"（`04:71`）。
**推导：除 4 的安全性。** 被除的乘度是 $a_{i,j}$（$j\le R-1$）。$a_{0,R-1}=64m\cdot4=d_0/4^{R-1}=256m$；$a_{i,j}\ge60m\cdot4^{R+2-(R-1)}=60m\cdot4^3=3840m$。故 $D\ge256m$ 且 $60m4^{R+2i-j}$ 的因子 $4$（或 $60=4\cdot15$）保证整除 ✓（`04:85-87`："every multiplicity $D$ to which division by four is applied is divisible by four and satisfies $D\geq256m$"）。

**段落 2：保留的 Chern 类（`04:89-121`）。**
令 $G=(\bigoplus_{j=0}^RE_j)^{\oplus m}$，$h_0=m\sum_{j=0}^Ra_{0,j}$，$p=\sum_{i=1}^RK_i$。
- 由 $K_i$ 的定义，$L_i$ 在 $G$ 中的总乘度**恰好**是 $K_i$（这正是 $K_i$ 的定义式 $K_i=m\sum_{j=i}^Ra_{i,j}$）。故
$$G\cong L_0^{\oplus h_0}\oplus\bigoplus_{i=1}^RL_i^{\oplus K_i},\qquad h_0=\tfrac43md_0(1-4^{-(R+1)})<2md_0,$$
其中 $h_0$ 的闭式来自几何级数 $\sum_{j=0}^R4^{-j}=\frac{1-4^{-(R+1)}}{3/4}=\frac43(1-4^{-(R+1)})$。
- $H^*(Y;\mathbb Z)=\mathbb Z[z_1,\dots,z_R]/(z_1^{K_1+1},\dots,z_R^{K_R+1})$，$\deg z_i=2$ ⟹ $\prod z_i^{K_i}\ne0$（它是 $H^{2p}(Y)=\mathbb Z$ 的生成元，每个因子取各自的顶次）。
- Whitney：$c(G)=\prod_i(1+z_i)^{K_i}$（线丛 $L^{\oplus K}$ 的总陈类 $(1+c_1(L))^K$）；取 $2p$ 次分量唯一方式是每个 $i$ 都取 $z_i^{K_i}$ ⟹ $c_p(G)=\prod z_i^{K_i}\ne0$。
- 障碍论证：设 $G$ 含秩 $k$ 的平凡子丛 $V$（$k>h_0$）。取 Hermitian 补 $W=V^\perp$，$\operatorname{rank}W=\operatorname{rank}G-k=(h_0+p)-k<p$。$c(G)=c(V)c(W)=c(W)$（$V$ 平凡 ⟹ $c(V)=1$）⟹ $c_p(G)=c_p(W)=0$（高于秩的陈类为零），矛盾。取 $k=2md_0>h_0$ 即得 (4.4)。
- 论文强调普适度："The argument applies to any continuous subbundle, without a condition on its position relative to the displayed line summands."（`04:120-121`）——这是关键：我们不需要 $V$ 与 $L_i$ 的分解"对齐"，纯陈类论证即可。

**段落 3：映射要用的小底空间（`04:123-145`）。** 对 $j\to j+1$（$j<R$），源与靶只用到 $L_0,\dots,L_{j+1}$，因此它们是
$$Y_{j+1}=\prod_{i=1}^{j+1}\mathbb{CP}^{K_i}$$
上的丛拉回。**注意 $K_i$ 用的是 (4.3) 的全局定义**（包含 $L_i$ 在 $i$ 之后直到 $R$ 级的全部出现），不是"到 $j+1$ 级为止"的截断值——这正是段落 1 那句"Each new projective-space factor is then sized to retain the Chern class contributed by every later occurrence of its line bundle"的含义。
在这个较小的底上先造映射、再拉回到 $Y$。底复维数
$$\eta_j=\sum_{i=1}^{j+1}K_i\le\frac43m\sum_{i=1}^{j+1}b_i=\frac53md_0(4^{j+1}-1)<\frac{20}{3}md_j.$$
第一 $\le$：$K_i=\frac43mb_i(1-4^{-(R-i+1)})\le\frac43mb_i$（几何级数、公比 $1/4$，论文注 "Here the first inequality uses the geometric series with ratio $1/4$"）。中间等式：$\sum_{i=1}^{j+1}b_i=\frac{15}{4}d_0\sum_{i=1}^{j+1}4^{i-1}=\frac{15}{4}d_0\frac{4^{j+1}-1}{3}=\frac54d_0(4^{j+1}-1)$，乘 $\frac43m$ 得 $\frac53md_0(4^{j+1}-1)$。最后 $<\frac53md_0\cdot4^{j+1}=\frac53md_{j+1}=\frac{20}{3}md_j$。
用途（论文自述）："The estimate by a multiple of $md_j$ is what will allow the incidence argument to handle all subspaces of dimension greater than $m$, even though the full base $Y$ may be much larger."（`04:143-145`）——即 $\eta_j=O(md_j)$ 而 $d_j$ 是源的秩，两者同阶才能给大 $s$ 留出正的 incidence 余量（对比段落 5 的 $(21/2)sd$）。

**段落 4：16 个小空间映射（`04:147-197`）。** 设 $j\to j+1$。把 $E_{j+1}$ 拆成"替代块"（$\bigoplus_iL_i^{\oplus(a_{i,j}/4)}$）与"新块"（$L_{j+1}^{\oplus b_{j+1}}$）。对每个源块 $L_i^{\oplus D}$（$D=a_{i,j}$）与对应替代块 $L_i^{\oplus(D/4)}$，只取**乘度空间之间的纯量矩阵**张量 $\operatorname{id}_{L_i}$。在点底上用 Lemma 3.1：$d=D$、$r=D/4$、$q=16$、$\mathcal A=\{(s,2s):1\le s\le m\}$、$h=0$。
- 前置不等式（`04:152-155`）：由 $D\ge64m$，$t=2s\le2m\le D/32<D/4=r$ ✓，且 $r-2s=D/4-2s\ge D/4-2m\ge D/4-D/32=\frac7{32}D\ge D/8$ ✓（这条是留给"替代块不能太空"的余量）。
- incidence 值：
$$(16s-2s)(D/4-2s)-s(D-s)=\tfrac52sD-27s^2\ \ge\ 160ms-27ms=133ms>0.$$
（$(5/2)sD\ge(5/2)s\cdot64m=160ms$；$27s^2\le27sm$ 因 $s\le m$。）
- 一次应用同时得到全部 $s=1..m$（$\mathcal A$ 有限，Lemma 3.1 本来就支持整个 $\mathcal A$）。得到的性质：任一 $s$-平面（$s\le m$）的 16 个像张成维数 $>2s$（即 $\ge2s+1$，论文指出"avoiding dimension at most $2s$ gives a slightly stronger conclusion"，比需要的 $\ge2s$ 多 1）。
- 逐块拼成 16 个**分块对角**映射 $T_1,\dots,T_{16}$（在新块上分量为 0）。
- **关键的"相关分量"处理（flag 论证，`04:170-197`）**：分块对角只在源向量整体落在**单个块**里时给出膨胀；若 $S$ 在多个块里都有分量，需另外论证。做法：把源块按序排成 $V_1,\dots,V_K$、替代块 $F_1,\dots,F_K$，$V_{\le k}=\sum_{i\le k}V_i$，$S_k=S\cap V_{\le k}$，$W=\sum_iT_iS$、$W_k=W\cap F_{\le k}$。投影把 $S_k/S_{k-1}$ 视为 $V_k$ 的子空间（维数 $\le\dim S\le m$），把 $W_k/W_{k-1}$ 视为 $F_k$ 的子空间；分块对角性给 $\sum_iT_{i,k}(S_k/S_{k-1})\subseteq W_k/W_{k-1}$，故 $\dim W_k/W_{k-1}\ge2\dim S_k/S_{k-1}$。对 $k$ 求和：
$$\dim W=\sum_k\dim(W_k/W_{k-1})\ge2\sum_k\dim(S_k/S_{k-1})=2\dim S.\qquad\checkmark$$
（两个 $\sum=$ 都是滤过标准分解：$\dim W=\sum\dim W_k/W_{k-1}$、$\dim S=\sum\dim S_k/S_{k-1}$。）
这一步是全节唯一"看起来显然其实不显然"的地方，论文特意标注："This proves the required estimate even when $S$ has correlated components in several blocks."（`04:196-197`）

**段落 5：8 个大空间映射 + 拉回 + 规格化（`04:199-229`）。** 取 $d=d_j$，靶只取新块（秩 $r=\frac{15}{4}d$），$q=8$，底 $Y_{j+1}$（故 $h=\eta_j$），$\mathcal A=\{(s,2s):m<s\le d\}$。
- 端点合法性："The rank endpoint is valid because $2s\le2d<r$"（$2<15/4$）✓。
- incidence 值：
$$(8s-2s)(15d/4-2s)-s(d-s)=\tfrac{43}{2}sd-11s^2\ \ge\ \tfrac{21}{2}sd\ >\ \tfrac{20}{3}md\ >\ \eta_j.$$
第一个 $\ge$：$11s^2\le11sd$（因 $s\le d$），$\frac{43}{2}-11=\frac{21}{2}$ ✓。第一个 $>$：$s>m$ ⟹ $\frac{21}{2}sd>\frac{21}{2}md$，而 $\frac{21}{2}=10.5>\frac{20}{3}=6.66\dots$ ✓。第二个 $>$：段落 3 的 (4.6) ✓。
- 于是 Lemma 3.1 在 $Y_{j+1}$ 上给出 8 个光滑映射进新块，其集体像 $\dim>2s$（$\ge2s+1>2s$）。
- 两组合并成 24 个映射 $T_i:E_j\to E_{j+1}$：$\dim S\le m$ 时由第一组给 $\ge2\dim S$，$\dim S>m$ 时由第二组给；"adding maps cannot decrease an image span"（`04:224-225`）所以合起来仍成立。
- 拉回 $\pi^*:Y\to Y_{j+1}$（源/靶本来就是拉回，映射沿 $\pi$ 拉回）后对 $Y$ 应用 Lemma 3.2，得连续 $X_i^{(j)}$ 满足 (4.5')（即 `bundle:scaled-identities`）。
- 论文补一句防误读："The scaling may mix the displayed line summands, but each resulting map still has source $E_j$ and target $E_{j+1}$."（`04:228-229`）——$X_i=\sqrt{2/3}Q^{-1/2}T_iP^{1/2}$ 里 $P$ 是 $E$ 上的自同态（可以混合线丛直和项），$Q$ 是 $F$ 上的自同态，故 $X_i$ 仍是 $E_j\to E_{j+1}$ 的丛映射，但**不再分块对角、不再逐块保持 $L_i$**。这没关系：Chern 障碍 (4.4) 是关于 $G$ 里是否存在平凡子丛的陈述，与分解对齐无关（段落 2 末句已埋伏笔）。

**段落 6：$j\ge R$ 的续接（`04:231-242`）。**
```tex
E_{j+1}=E_j\oplus E_j,\quad
X_1^{(j)}=2^{-1/2}\iota_1,\quad X_2^{(j)}=2^{-1/2}\iota_2,\quad X_i^{(j)}=0\ (3\leq i\leq24).
```
列和 $\frac12I+\frac12I=I_{E_j}$ ✓（$\iota_k^*\iota_k=I$、$\iota_1^*\iota_2=0$）；行和 $\frac12(\iota_1\iota_1^*+\iota_2\iota_2^*)=\frac12I_{E_{j+1}}\le\frac23I$ ✓。"This continuation leaves the retained bundle in (4.4) unchanged"（`04:241-242`）因为 (4.4) 只涉及 $j\le R$。

#### (c) 每个常数/假设的机械理由

- **$d_0=64m4^R$**：唯一硬约束是"每个要被除 4 的乘度 $D\ge64m$"（段落 4 用的正是 $64m$，不是 $256m$）。最小的被除乘度是 $a_{0,R-1}=d_0/4^{R-1}=4d_0/4^R$；设 $d_0=cm4^R$ 则 $a_{0,R-1}=4cm\ge64m\iff c\ge16$。取 $c=64$ 提供 4 倍余量。[推测] 4 倍余量的用途：让 $r-2s\ge D/8$ 与 $133ms$ 这两个"证明里出现的正下界"远离 0，避免在 $R$ 很大时出现边界整数化问题（同时 $c=64$ 是 4 的幂，$a_{0,j}=d_04^{-j}$ 整除到底）。若把 $c$ 降到 16，段落 4 的 $133ms$ 变成 $133ms/4$，仍正；所以严格说 $d_0$ 的敏感度是"线性放大 $D$ ⟹ 二次放大 incidence 余量"，降到 16 不会崩，降到 $<16$ 会在 $s=m$ 处崩（$t=2s$ 与 $r=D/4$ 冲突）。
- **因子 4（秩递推 $d_{j+1}=4d_j$、乘度递减 $/4$）**：约束是 $h_0=\frac{m\,d_0}{1-\rho^{-1}}<2md_0$，其中 $\rho$ 是每级的除数（乘度 $\rho^{-1}$ 衰减时 $\sum_ja_{0,j}=d_0/(1-1/\rho)$）。要求 $\frac{1}{1-1/\rho}<2\iff\rho>2$。所以 $\rho=2$ **不行**（$h_0=2md_0/(1-4^{-(R+1)})$ 会 $\ge2md_0$，Chern 障碍直接失效，因为要嵌入的平凡丛秩 $2md_0$ 不再超过 $h_0$）。$\rho=3$ 可行（$\frac{3}{2}<2$）但 $a_{i,j}$ 的整除性要用 $3^j$ 而 $b_i$ 的表达式 $(15/4)$ 型会变成 $(\rho-1)/\rho\cdot d_j$ 的分数；$\rho=4$ 同时满足"是 2 的幂（保持 $4^j$ 与 $4^{-j}$ 双向整除）""$>2$"。所以 **4 是被"2 的幂 + 严格 $>2$"两条夹出来的最小值**。放大到 8 会让 $d_j$ 增长更快（$D$ 更大、incidence 更宽裕），但 $\eta_j$ 与 $b_i$ 同步放大，缺陷对 $c$ 无影响。
- **$b_i=\frac{15}{4}d_{i-1}$**：由"$\rho=4$ 且 $d_{j+1}=4d_j$"唯一决定：新块 $=$ 目标秩 $-$ 替代部分 $=4d_j-\frac14d_j=\frac{15}{4}d_j$。不是自由参数。
- **$q=16$（小块）**：不等式 $(qs-2s)(D/4-2s)-s(D-s)>0$ 在 $s=m,\ D=64m$ 时最紧：$(q-2)\cdot m\cdot(16m-2m)-m(64m-m)=(q-2)\cdot14m^2-63m^2>0\iff q-2>4.5\iff q\ge7$。所以 16 有 9 的富余。那为什么是 16 而不是 8？因为总预算 $24=16+8$ 且大块需要 8（见下）；把 16 减到 8、大块 8 增到…见 $q=8$ 的分析。真正的耦合是"两组共享同一个目标 $E_{j+1}$"：小块映射进替代块（秩 $d_j/4$），大块映射进新块（秩 $\frac{15}{4}d_j$），两块的秩由 $\rho=4$ 固定，从而各自允许的 $q$ 由 incidence 决定；把 24 拆成 $16+8$ 是"16 能在 $r=D/4$ 里工作到 $s\le m$"与"8 能在 $h=\eta_j$ 的底上工作到 $s>m$"两个约束的交集里挑的整数。[推测] 具体分配可能有多种（例如 $12+12$），论文未给唯一性论证。
- **$q=8$（大块）**：$(qs-2s)(\tfrac{15}{4}d-2s)-s(d-s)>\eta_j$ 在 $s=m+1$ 处最紧（左边随 $s$ 递增的一段）。用 $s>m$ 放缩后要求 $(\tfrac{15}{4}(q-2)-(q-1))\cdot$……按论文的写法：一般 $q$ 时左边 $=(q-2)s(\frac{15}{4}d-2s)-sd+s^2$；取 $s\le d$ 得 $\ge(q-2)s\cdot\frac{7}{4}d-sd$，再用 $s>m$ 与 $\eta_j<\frac{20}{3}md$：需要 $\big(\frac{7}{4}(q-2)-1\big)md>\frac{20}{3}md$ ⟹ $\frac{7}{4}(q-2)>\frac{23}{3}$ ⟹ $q-2>4.38$ ⟹ $q\ge7$。所以 $q=8$ 恰好是"让上面这条粗化放缩成立"的最小整数（$q=7$ 时粗化后 $=\frac{20}{3}\cdot\frac{7\cdot5/4-1}{20/3}$……实际 $q=7$ 给 $\frac74\cdot5-1=7.75<6.67$？  $7.75>6.67$ 成立！[修正] 用粗化放缩 $q=7$ 也过，但粗化本身损失大；论文的精确式是 $\frac{43}{2}sd-11s^2$（$q=8$）与 $\frac{21}{2}sd$，其中 $43/2$ 来自 $6\cdot\frac{15}{4}-1=\frac{90-4}{4}=\frac{86}{4}=\frac{43}{2}$ ✓。$q=7$ 时对应系数是 $5\cdot\frac{15}{4}-1=\frac{71}{4}$，减去 $11$（放缩 $s\le d$ 的代价）得 $\frac{27}{4}=6.75>\frac{20}{3}=6.67$ ✓ 仍勉强过——余量只有 $0.08$。所以 **8 是"有余量的最小整数"，7 是"余量趋零的边界值"**，这解释了为什么大块用 8。若 $q=6$：$\frac11\cdot$…$4\cdot\frac{15}{4}-1=14$，减 11 得 $3<6.67$ ✗ 崩，崩在 $(8s-2s)(r-2s)$ 与 $s(d-s)$ 的差额不足以支付底空间维数 $\eta_j$。
  （这段放缩是我按论文两条显式不等式反推的机械敏感度分析，论文本身未给"7 行不行"的讨论——标 [推测]。）
- **$t=2s$（目标维数预算）**：直接对齐 Lemma 3.2 需要的膨胀率 2：$\dim>t=2s$ ⟹ $\ge 2s+1\ge 2s$ ✓。取 $t=2s-1$ 也能满足 3.2，但会让 $(qs-t)$ 变大而 $(r-t)$ 变小，净效果不显然；取 $t=2s$ 是"最小满足需求"的自然选择。
- **$s\le m$ 与 $s>m$ 的分界取 $m$**：因为 §5 里要排除的对象是 $M_{m,2m}$ 中的矩阵，其列数是 $2m$，任何"部分"的秩最多 $m$ 相关？更准确地说：小块映射只需要处理**逐块**维数 $\le m$ 的子空间，而 flag 论证把"$\dim S\le m$"拆成各块商 $\dim\le m$ ——所以 $m$ 是 flag 论证里唯一需要的界。分界为什么必须正好是 $m$：小块只能在 $2s\le r=D/4$ 即 $s\le D/8$ 内工作，$D\ge64m$ 给 $s\le8m$，所以 $s\le m$ 是安全且与 flag 论证匹配的选取；超过 $m$ 的子空间可能横跨多个块、每块分量 $>m$？不——flag 论证已覆盖全部 $\dim\le m$；剩下 $\dim>m$ 全部交给大块（大块在 $r=\frac{15}{4}d$ 里能覆盖到 $s\le d$）。所以这个分界是**由"$\dim S$ 的全域要被两组覆盖、且各自 incidence 都正"唯一逼迫的**：小块能覆盖的范围是 $s\le\min(m, D/8)$，大块覆盖 $m<s\le d$。若把分界改成 $m'<m$ 或 $m'>m$，前者只是浪费大块预算，后者会让小块出现 $s>m$ 时 $27s^2$ 项压过 $\frac52sD$？实际上 $s\le D/8$ 时 $(qs-2s)(D/4-2s)-s(D-s)$ 仍可能正——[推测] 分界选 $m$ 纯粹是为了与 §5 的 $M_{m,2m}$（列 $2m$、行 $m$）以及 $E_0^{\oplus2m}$ 的秩对齐，不是最优点。
- **$Y=\prod\mathbb{CP}^{K_i}$ 用复射影空间**：需要 (i) 每个因子有一个 $z_i$ 使 $z_i^{K_i}\ne0$（$\mathbb{CP}^n$ 的 $H^*$ 是单生成元截断多项式环，这是最便宜的例子）；(ii) 陈类可显式计算（Whitney + 线丛规范化）；(iii) 底是光滑紧流形，供 Lemma 3.1 用。[推测] 用 Grassmann 丛或 flag 流形也能做，但 $z_i^{K_i}$ 的非零性与次数记账会复杂化；论文引 Villadsen/Rørdam 的"projective-space factors"正是这条先例（`01:183-186`、`04:8-10`）。
- **$K_i$ 必须"$\ge$"还是"$=$"乘度**：取**等号** $K_i=m\sum_{j\ge i}a_{i,j}$。等号 ⟹ $p=\sum K_i=\dim_\mathbb C Y$ ⟹ $\prod z_i^{K_i}$ 恰好是顶次类、非零。若 $K_i$ 更大，$\dim_\mathbb C Y>p$，$\prod z_i^{K_i}$ 仍非零（在次数 $2p$ 处），但 $\eta_j$（即底维数）变 ⟹ 大块 incidence 更难满足；若 $K_i$ 更小，$L_i$ 在 $G$ 中的乘度 $>K_i$，则 $c_p(G)$ 的最高次项要从 $(1+z_i)^{K_i}$ 里取 $z_i^{K_i}$（仍可）⟹ 但 $G$ 的真实分解里 $L_i$ 乘度更大，$p$ 的定义要重算；等号是"记账最省"的选择，同时给出 $\eta_j$ 的上界 $\frac43mb_i$。
- **"continuous bundle maps $X_i^{(j)}$，$1\le i\le24$，$j\ge0$"里的 $24$**：必须与 $B$ 的生成元个数**相同**，因为 §5 里 $x_i$ 的第 $i$ 个分量就是 $X_i^{(j)}$ 的移位；24 是 $16+8$。
- **引理 3.1 在小块用 $h=0$（"over a point"）**：因为小块映射是"纯量矩阵 $\otimes\operatorname{id}_{L_i}$"，与底无关，所以坏集只需在**乘度空间**层面测度；这省下整块底空间维数预算，让 $r=D/4\ll d=D$ 这种"目标比源小"的配置也能工作。若把小块也放在 $Y_{j+1}$ 上做，$\eta_j$ 项会立刻压垮 $\frac52sD-27s^2$（因为 $D$ 可以小到 $256m$ 而 $\eta_j$ 是 $\frac{20}{3}md_j$，$d_j\gg D$……实际 $d_j\ge D$，所以更糟）。**"点底"是小块方案成立的必要条件**，这是个非平凡的观察。
- **续接用 $2^{-1/2}$、行界 $\tfrac12$**：只需行界 $\le\frac23$。$\frac12$ 是"把 $E_{j+1}$ 分成两份等距拷贝"的必然标量（两份正交投影之和 $=I$ ⟹ 每个的系数平方和 $=1$ ⟹ $2\lambda^2=1$ ⟹ $\lambda=2^{-1/2}$）。用三个拷贝 $\lambda=3^{-1/2}$、行界仍 $\frac13$ 也行，但秩增长 $3^j$ 会让"$j>R$ 的 $E_j$ 定义"更浪费；$[1+0]$（单份、$\lambda=1$）会给行界 $1$，违反 $\le\frac23$ ✗。所以"必须 $\ge2$ 份、$2$ 份最省"。

#### (d) 候选失败路线 [推测]

1. **不做乘度衰减（$a_{i,j}$ 全级相同）** [推测]：则 $h_0=m(R+1)a_{0}\sim md_0R$，一旦 $R\ge2$ 就超过 $2md_0$，Chern 障碍彻底失效（平凡部分本身就够容纳 $2md_0$ 的平凡子丛）。衰减因子 $1/4$ 的全部作用是让 $h_0=\frac43md_0(1-4^{-R-1})$ 关于 $R$ **一致有界**于 $\frac43md_0<2md_0$，从而 $R$ 可以任意大而障碍不衰减。这是"$R$ 无界"这条需求与"$c<1$ 固定"这条需求相容的核心机关。
2. **用示性类去障碍"$P^*P\ge\frac12I$"本身** [推测]：不通过像丛，而是尝试对 $P_0$ 的直接陈类/ $K$-论不变量取矛盾。失败机制——$P_0$ 是矩形单射，其像丛的不变量才受 $G$ 的限制，$P_0$ 本身在平凡源上没有可用不变量；必须"平凡源 ⟹ 像平凡 ⟹ 与 $G$ 的陈类冲突"这条三段论。
3. **让 24 个映射中的一部分跨级混合（例如把新旧块混在一个映射里）** [推测]：Lemma 3.2 的规格化 $X_i=\sqrt{2/3}Q^{-1/2}T_iP^{1/2}$ 实际上已经造成这种混合（论文主动承认"The scaling may mix the displayed line summands"）；但**构造阶段**必须保持分块对角，否则段落 4 的 flag 论证（依赖"$T_i(S_k)\subseteq W_k$"）立刻失效——分块对角性是 flag 单调性的唯一来源。这解释了"为什么先在分块对角类里做 incidence（还要逐块用点底），再让规格化去破坏它"的顺序：incidence 需要结构，规格化需要自由度，两者不能同时。
4. **只用一组映射（不做 16/8 分裂）** [推测]：若全部 24 个映射都进"新块"，则小 $s$ 的膨胀没问题，但新块秩 $\frac{15}{4}d_j$ 意味着替代块的秩必须是 $\frac14d_j$（为了 $h_0$ 的几何衰减），而替代块仍需承载 $E_j\to E_{j+1}$ 的"旧丛延续"——旧线丛在下一级的出现量必须 $\le$ 有映射进入的量，否则 $E_{j}$ 里的 $L_i$ 分量没有归宿？更实质的机制障碍：若 24 个映射全进新块，则 $E_{j+1}$ 的替代部分 $\bigoplus_iL_i^{\oplus a_{i,j}/4}$ 上没有任何映射进入，那些方向的列和 $\sum(X_i^{(j)})^*X_i^{(j)}=I_{E_j}$ 仍要成立（列和在源上，与靶无关）——技术上不矛盾。真正的障碍是**大子空间**：一个 $s\le m$ 的子空间如果主要由新块映射覆盖，其像要 $\ge2s$ 落在秩 $\frac{15}{4}d$ 里毫无困难；反过来一个 $s$ 接近 $d$ 的子空间用**分块标量**映射（只能处理 $s\le m$）做不到。所以分裂的真实理由是"**分块标量映射（为用点底而必须）天然只能覆盖小维数，剩下的大维数必须由整块新映射承担**"。[推测]
5. **用实 $K$-论/Pontryagin 类替代 $c_1$** [推测]：文献（Villadsen、Rørdam）里常见用更高阶陈类或实 $K$-论做障碍。本文只需要 $c_1$ 的乘积（线丛情形最便宜），选高阶类会让 $\eta_j$ 记账复杂。论文未述失败机制，只说"Here projective-space factors retain a nonzero Chern class after a controlled trivial summand is allowed"（`01:186-188`）。

---

### 2.4 Theorem 5.1（代数 $B$ 的构造与逐矩阵尺寸排除）

#### (a) 精确陈述（`05:9-20`）

```tex
\begin{theorem}
\label{thm:construction}
There is a separable unital complex $C^*$-algebra
$B=C^*(1,x_1,\ldots,x_{24})$ such that
\begin{equation}
  \sum_{i=1}^{24}x_i^*x_i=1,
  \qquad
  \sum_{i=1}^{24}x_ix_i^*\le\frac23\,1,
  \label{eq:algebra-relations}
\end{equation}
and $M_m(B)$ is not properly infinite for every integer $m\ge1$.
\end{theorem}
```

#### (b) 证明机制推导（九步）

**步骤 1：取全部测试的数据。** "For each pair of integers $m,R\ge1$, choose the data supplied by Proposition 4.1, and denote its base by $Y_{m,R}$."（`05:23-24`）即对 $\mathbb N_{>0}\times\mathbb N_{>0}$ 中每个点，Prop 4.1 给出 $(Y,\{E_j\},\{X_i^{(j)}\})$；这里改名 $Y\to Y_{m,R}$。索引集 $\{(m,R,y):m,R\ge1,\ y\in Y_{m,R}\}$ 是**不可数**的（每个 $Y_{m,R}$ 是正维形流形）。

**步骤 2：逐坐标的 Hilbert 空间与移位。** 对 $(m,R,y)$ 形成
$$\mathcal H_{m,R,y}=\bigoplus_{j=0}^{\infty}E_j(y),$$
$S_i^{m,R}(y)$ 为**前向移位**：其从 $E_j(y)$ 到 $E_{j+1}(y)$ 的块是 $X_i^{(j)}(y)$，其余块为 0。

**步骤 3：一致范数界。** 由列恒等式 (4.5')：$\sum_i(X_i^{(j)})^*X_i^{(j)}=I_{E_j}$ 且每项正 ⟹ 每项 $\le I$（正元之和为 $I$ 时每个被 $I$ 控制）。故每个块 $\|X_i^{(j)}(y)\|\le1$ ⟹ 每个移位 $\|S_i^{m,R}(y)\|\le1$。论文强调："These bounds hold uniformly over all coordinates."（`05:36-37`）**这句是构造能成立的技术前提**：只有 $\ell^\infty$-积允许把无界多个坐标收成一个元素。

**步骤 4：积代数与生成元。** $\mathcal D$ 是 $\prod_{m,R,y}\mathcal B(\mathcal H_{m,R,y})$ 的**有界 $C^*$-积**（"its elements are the operator families of finite supremum norm"，`05:39-40`）。定义
$$x_i=\bigl(S_i^{m,R}(y)\bigr)_{m,R\geq1,\;y\in Y_{m,R}}\in\mathcal D,\qquad B=C^*(1,x_1,\dots,x_{24})\subseteq\mathcal D.$$

**步骤 5：验证关系式 (5.1) 在 $\mathcal D$ 中成立。** 逐坐标验证：
- 列和：$\sum_i(S_i^{m,R}(y))^*S_i^{m,R}(y)$ 作用在 $\bigoplus_jE_j(y)$ 的第 $j$ 级上等于 $\sum_i(X_i^{(j)})^*X_i^{(j)}=I_{E_j}$ ⟹ 整空间上是 $I$ ⟹ "The column sum of the shifts is the identity on every level"（`05:47`）。
- 行和：进入第 $0$ 级的行和为 $0$（没有更低级），进入第 $j\ge1$ 级的行和是 $\sum_iX_i^{(j-1)}X_i^{(j-1)*}\le\tfrac23I_{E_j}$（`05:48-52`）。故逐坐标行和 $\le\tfrac23I$ ⟹ $\sum x_ix_i^*\le\tfrac23\cdot1_\mathcal D$。
关键：$j\ge R$ 的续接段（$E_{j+1}=E_j\oplus E_j$、行和 $\tfrac12I$）保证**每一级**都满足列 $=I$、行 $\le\tfrac23$ ⟹ (5.1) 在整个无穷直和上成立。若漏掉续接，$x_i$ 就不是有界算子（无法定义）。

**步骤 6：$B$ 可分、非零、有单位。**"$*$-polynomials in these generators with rational complex coefficients form a countable dense subset"（`05:56-57`）。注意 $\mathcal D$ 本身**不**可分（不可数积 + 连续底），可分性来自"只由 24 个元素生成"。这是"$24$ 固定"的第二处收益（第一处是缺陷对的分母 $2N$）。

**步骤 7：反证设与矩形拼接。** 固定 $m\ge1$，设 $M_m(B)$ 含正交值 isometry $s_1,s_2$。拼接
$$W=[s_1\ s_2]\in M_{m,2m}(B),\qquad W^*W=I_{2m}.$$
（$W$ 是 $m$ 行 $2m$ 列的块矩阵，两个块列分别是 $s_1,s_2$；$W^*W$ 的 $(i,j)$ 块是 $s_i^*s_j=\delta_{ij}1$ ✓。）注意 $\|W\|=1$：$\|W\xi\|^2=\langle W^*W\xi,\xi\rangle=\|\xi\|^2$。

**步骤 8：多项式逼近 + 半正定下界。** 由范数稠密性取 $P\in M_{m,2m}(B)$ 为 $*$-多项式矩阵，$\|P-W\|<1/5$。恒等式（这是那步放缩的全部内容）：
$$P^*P-W^*W=(P-W)^*P+W^*(P-W),$$
（展开：$P^*P-W^*P+W^*P-W^*W$ ✓。）取范数，用 $\|P\|\le\|W\|+\|P-W\|<1+\tfrac15$、$\|W\|=1$、$\|P-W\|<\tfrac15$：
$$\|P^*P-I_{2m}\|<\tfrac15(1+\tfrac15)+\tfrac15=\tfrac25+\tfrac1{25}=\tfrac{11}{25}=0.44<\tfrac12 .$$
自伴元 $A$ 满足 $\|A\|<\tfrac12$ ⟹ $I+A\ge(1-\tfrac12)I$；取 $A=P^*P-I$ 得式 (5.2)：$P^*P\ge\tfrac12 I_{2m}$。

**步骤 9：度决定测试（对角化步骤）+ 丛限制 + 极分解 + 矛盾。**
- **顺序很重要**："After fixing this approximation, choose $R\ge1$ at least the length of every word occurring in its entries. We use the coordinate family belonging to the already constructed test $(m,R)$."（`05:77-79`）即 $R:=R(P)$ 是逼近定下**之后**才选的；矩阵尺寸 $m$ 是反证假设里给的。
- **层级传播**：$P$ 的每个元素是 $x_i,x_i^*,1$ 的有限线性组合（词长 $\le R$）。在坐标 $(m,R,y)$ 的表示里：$S_i$ 把级 $j$ 抬到 $j+1$；$S_i^*$ 把 $j$ 降到 $j-1$，而"an adjoint applied at level zero gives zero"（$E_0$ 之下没有级）；$1$ 保级。故从级 0 出发、长度 $\le R$ 的任何词**停留在级 $0,\dots,R$**，且终点不超过 $R$。
- 于是把 $P(m,R,y)$ 限制到级 0 输入，得到一个丛映射（记 $\iota_0$ 为 $E_0(y)^{\oplus2m}\hookrightarrow\mathcal H^{\oplus2m}$、$\iota_F$ 为 $F_{m,R}(y):=(\bigoplus_{j=0}^RE_j)^{\oplus m}\hookrightarrow\mathcal H^{\oplus m}$）：
$$P(y)\iota_0=\iota_F P_0(y),\qquad P_0:E_0^{\oplus2m}\longrightarrow F_{m,R}\ \text{over}\ Y_{m,R}.$$
- **连续性**：$P_0$ 的每个块是 $X_i^{(j)},(X_i^{(j)})^*$（$j<R$）的有限复合与和，故连续；论文强调："This description is intrinsic to the bundles; no simultaneous trivialization of the Hilbert fibers or continuity between different tests is required."（`05:95-96`）以及"The continuation beyond level $R$ does not enter these compositions."（`05:97`）。
- **下界压到角上**：坐标求值是 $*$-同态（范数不增），故 (5.2) 在坐标 $(m,R,y)$ 仍成立：$P(y)^*P(y)\ge\tfrac12 I$ 在 $\mathcal H_{m,R,y}^{\oplus2m}$ 上。压缩（$\iota_0$ 是等距嵌入）给
$$P_0(y)^*P_0(y)=\iota_0^*P(y)^*P(y)\iota_0\ge\tfrac12 I\qquad\forall y.$$
- **极分解（用 2.0b 的观察）**：$P_0^*P_0\ge\tfrac12 I$ ⟹ $Q=P_0(P_0^*P_0)^{-1/2}$ 是连续纤维等距，$\operatorname{ran}Q$ 是 $F_{m,R}$ 的连续子丛，同构于 $E_0^{\oplus2m}$。而 $E_0$ 平凡（秩 $d_0$）⟹ $\operatorname{ran}Q$ 是**秩 $2md_0$ 的平凡子丛**，与 (4.4)（$\bigoplus_{j\le R}E_j$ 的 $m$ 份里没有秩 $2md_0$ 的平凡子丛）矛盾。
- $m$ 任意 ⟹ 每个 $M_m(B)$ 都不适当无穷。$\blacksquare$

**Figure 1（`figures/finite-test.tex`）说明的就是步骤 9 的传播窗**：$E_0\to E_1\to\cdots\to E_R$ 被虚线框住，"$E_{R+1}$"在框外用虚线双向箭头标出，caption 原话："If $P^*P\ge\tfrac12 I$, this restriction would embed a trivial bundle of rank $2md_0$ into that target, contradicting its retained Chern class… The continuation after level $R$ does not affect this test. When $R=1$, the labels $E_1$ and $E_R$ denote the same level."（最后那句是排版说明：$R=1$ 时图上的 $E_1$ 与 $E_R$ 重合。）

#### (c) 每个常数/假设的机械理由

- **$\|P-W\|<1/5$**：真正需要的是"$P^*P\ge cI$ 对某个 $c>0$"，即 $2\delta+\delta^2<1\iff\delta<\sqrt2-1\approx0.4142$。但论文要把结论写成**干净的一半**（$P^*P\ge\tfrac12I$，式 5.2），于是要求 $2\delta+\delta^2<\tfrac12\iff\delta<\sqrt{3/2}-1\approx0.2247$。在简单分数 $\{1/2,1/3,1/4,1/5\}$ 中 $1/5=0.2$ 是**第一个满足**的（$1/4=0.25$ 失败，只给 $P^*P\ge0.4375I$）。所以 $1/5$ 的机械理由是"$恰好跨过 $0.2247$"。放大到 $1/4$：$c=0.4375$，矛盾论证照样成立（$P_0^*P_0\ge0.4375I$ 已足以让 $(P_0^*P_0)^{-1/2}$ 有界）；**只有当 $\delta\ge\sqrt2-1$ 时才真的崩**，崩在"$P_0$ 可能在某些纤维失去单射性，像的秩跳变，不再是连续子丛"。缩小 $\delta$ 没有收益，只是让 $c$ 更接近 1。
- **$\tfrac12$（式 5.2 的下界）**：只是"$>0$"的具象化；对拓扑障碍，任何一致正下界等价。它出现在论文里是为了给读者一个可核查的数，而不是被机制要求。第五节我把它标为"零敏感度"。
- **$R$ 必须在 $P$ 之后选**：多项式稠密性**不控制词长**——逼近一个具体 isometry 可能需要任意长的词。若先固定 $R$，则 $P$ 的词长可能超过 $R$，$P_0$ 的靶就跑到 $F_{m,R}$ 之外（级 $>R$），那里没有陈类控制（续接段是纯平凡 doubling，其直和里满是平凡子丛）。这正是 Milhøj–Rødnam 提问版式里"increasingly delayed matrix proper infiniteness"（`01:151-153`）的含义：对**每个** $m$，词长可以任意大；解法是"让积代数同时装着所有 $(m,R)$ 的测试，$R$ 由候选自选"。
- **生成元个数 $24$（与 Prop 4.1 一致）**：三处用途——(i) 移位族的列/行关系必须逐指标对齐，即 $x_i$ 的第 $i$ 个坐标分量恰是 $X_i^{(j)}$，个数不等则 (5.1) 无法从 (4.5') 读出；(ii) $B$ 可分性只依赖"有限生成"；(iii) Lemma 5.2 的分母 $2N=48$，从而 $1/144$。
- **$\tfrac23$ 在 (5.1) 里**：来自 Lemma 3.2 的结论 (3.3)（系数 $\tfrac32$ 的倒数）；$<1$ 是**唯一**被机制要求的性质（它让迹态不可能存在：$1=\tau(\sum x^*x)=\tau(\sum xx^*)\le c<1$，`07:65-66`）。
- **$E_0$ 必须平凡**：因为 $\operatorname{ran}Q\cong E_0^{\oplus2m}$，要得到"**平凡**子丛"这一矛盾对象。若 $E_0$ 非平凡，(4.4) 就变成"不含秩 $2md_0$ 的、同构于 $E_0^{\oplus2m}$ 的子丛"，需要更精细的陈类记账（$\prod z_i^{K_i}$ 要减去 $c(E_0^{\oplus2m})$），复杂度上升而收益为零。论文把 $a_{0,j}=d_04^{-j}$ 单列出来正是为了保住这条"平凡种子"。
- **$m,R$ 双向无界跑遍**：$m$ 无界是 Theorem 2.1 的要求（"every positive integer $m$"）；$R$ 无界是逼近词长的要求。
- **用 $\ell^\infty$-积而不是直和表示**：若把全部 $\mathcal H_{m,R,y}$ 合成一个大 Hilbert 空间 $\bigoplus$ 并令 $x_i$ 为移位之和，(5.1) 同样成立，但**"限制到某个坐标"不再是 $*$-同态而是压缩**，步骤 9 里"坐标求值保持 (5.2)"就失去依据（压缩只给 $\le$ 方向的估计，不给 $P^*P\ge\tfrac12$ 在该坐标成立）。积代数的坐标投影是满 $*$-同态，这是它的不可替代处。[推测]（论文没写这个理由，只写"in one bounded operator product"，`01:174`。）

#### (d) 候选失败路线 [推测]

1. **每个 $m$ 造一个代数 $B_m$，再取直和或归纳极限** [推测]：直和/极限会破坏"24 个生成元"（每份需要新的生成元）或破坏关系式在整体上的精确成立（例如无限直和里 $\sum x^*x=1$ 不收敛于单位）。归纳极限（ Villadsen/Rørdam 型的"infinitely slow dimension growth"路线）是文献里造可分反例的正统做法，但那些构造的**关系是近似的**（approximate unitary equivalence），而本文需要 $\sum x_i^*x_i=1$ **精确**成立以制造与行界 $\le\tfrac23$ 的硬冲突。[推测] 这一点可以从"作者引用 Villadsen/Rørdam 的 Charn 类方法但明确改写成'bounded product + generated subalgebra'"的措辞看出：`01:153-156` "Milhøj and Rødnam proposed separating a uniformly bounded length of such a tuple from increasingly delayed matrix proper infiniteness… The construction below uses a bounded product and a generated subalgebra, with a separate test for every matrix size and polynomial degree."
2. **把 $P_0$ 的靶取到 $\bigoplus_{j\ge0}E_j$ 整体** [推测]：那时 $F=\mathcal H$ 含无穷维平凡部分（续接段 $E_{j}=E_R^{\oplus2^{j-R}}$ 的直和里充满平凡子丛——其实不一定平凡，$E_R$ 非平凡；但 $j\ge R$ 的段是 $E_R$ 的有限拷贝的直和的迭代，其 $m$ 份直和里"秩 $2md_0$ 平凡子丛"是否存在由 $E_R$ 决定，不再是 (4.4) 能保证的），陈类论证在高次处失效（$p=\sum_{i}K_i$ 只到 $R$ 级）。必须把靶**截断**到 $\bigoplus_{j\le R}E_j$，这正是"词长 $\le R$ ⟹ 不出窗口"这条传播性质提供的。
3. **不近似、直接对 $W$ 做丛限制** [推测]：$W\in M_{m,2m}(B)$ 是一般元素（连续函数而非多项式），限制到级 0 后得到的映射的靶要跑到无穷多级，$P_0$ 不再是任何有限 $F_{m,R}$ 中的丛映射，陈类记账无从谈起。所以"先多项式逼近（牺牲精确等距性，得到 $\ge\tfrac12$ 的下界），再用极分解把'近似等距'变成'真正的连续等距'"这两步都是必需的，缺一不可。
4. **用 $P^*P\ge\tfrac12I$ 直接断言 $P_0$ 是子丛嵌入而不做极分解** [推测]：单射性逐点成立，但没有一致下界时像可能不是连续子丛（见 2.0b(d)）。这里因为有 $\tfrac12$ 全局下界所以安全；[推测] 论文在 §2 提前把该观察写成一般形式，就是为了此处不必重述。
5. **想要 $B$ 简单** [推测]：07(i) 需要的单代数来自 $AW^*$ 因子而非 $B$。$B$ 作为 $\mathcal D$ 的可分子代数，几乎肯定有巨大闭理想（例如"在某些坐标集上为零"的压缩），简单性不可能；而且简单 + 可分 + 无迹 + 有 2-拟迹的组合本身没问题，但证明简单性需要另一整套工具。论文明说 07(iii) 用的是"$AW^*$ 因子的有限生成子代数 … without a simplicity assertion"（`01:132-133`），显示作者主动放弃了用 $B$ 证 (iii)。

---

### 2.5 Lemma 5.2（从两条关系到一个固定的正元对缺陷）

#### (a) 精确陈述（`05:130-147`）

```tex
\begin{lemma}
\label{lem:defect}
Let $B$ be a unital complex $C^*$-algebra, let $N\ge1$, and suppose
$x_1,\ldots,x_N\in B$ satisfy
\[
  \sum_{i=1}^N x_i^*x_i=1,
  \qquad
  \sum_{i=1}^N x_ix_i^*\le c1
  \quad\text{for some }0\le c<1.
\]
There are positive contractions $a,b\in M_{2N}(B)$, determined by this
tuple, such that every normalized $1$-quasitrace $\tau$ on $M_{2N}(B)$
satisfies
\begin{equation}
  \tau(a+b)-\tau(a)-\tau(b)\ge\frac{1-c}{2N}.
  \label{eq:uniform-defect}
\end{equation}
\end{lemma}
```

前置声明（`05:125-127`）："The passage from the two relations to a specified positive pair is useful independently of the construction. It requires only the $1$-quasitrace axioms once a quasitrace on the matrix algebra is given."

#### (b) 证明机制推导（六步）

**步骤 1：记号。**
$$u_i=x_i^*x_i,\quad v_i=x_ix_i^*,\quad H_i=\sum_{j=1}^i u_j,\quad J_i=\sum_{j=1}^i v_j,\quad H_0=J_0=0.$$
则 $H_N=1$（列关系），$0\le J_N\le c\,1$（行关系）。

**步骤 2：缺陷对的显式形状（式 5.5）。**
```tex
  a&=\operatorname{diag}
      (H_0,\ldots,H_{N-1},\,1-J_0,\ldots,1-J_{N-1}),\\
  b&=\operatorname{diag}
      (u_1,\ldots,u_N,\,1-v_1,\ldots,1-v_N).
```
这是 $M_{2N}(B)$ 里的**对角**元（$2N$ 个 $B$-值对角块：前 $N$ 个与后 $N$ 个）。逐块相加：
- 前段第 $i$ 块：$a$ 给 $H_{i-1}$、$b$ 给 $u_i$，和 $=H_i$。
- 后段第 $i$ 块：$a$ 给 $1-J_{i-1}$、$b$ 给 $1-v_i$，和 $=2-J_i$。
**正压缩元核对**（`05:168-169`）：$0\le H_i\le H_N=1$（部分和递增，且 $H_i\le H_N$ 因 $u_j\ge0$）；$0\le u_i\le1$；$0\le J_i,v_i\le J_N\le c1$（同一递增论证）。于是 $1-J_{i-1}\ge1-c>0$、$1-v_i\ge 1-c>0$，全部块是 $[0,1]$ 内的正元 ⟹ 每个对角块的范数 $\le1$ ⟹ $a,b$ 正、$\|a\|,\|b\|\le1$ ✓。**"后段用补元 $1-J$"正是为了保正性**（若后段直接用 $-J_{i-1}$ 会失去正元条件）。

**步骤 3：角上的值都等于同一个 $\varphi$。** 固定 $M_{2N}(B)$ 上的规格化 1-拟迹 $\tau$。$\iota_k(z)$ 表示 $z$ 放在第 $k$ 个对角角、其余为 0。定义 $\varphi(z):=\tau(\iota_1(z))$。对 $z\ge0$：取 $t$ 为在 $(k,\ell)$ 位置放 $z^{1/2}$、其余为 0 的矩阵，则
$$t^*t=\iota_\ell(z),\qquad tt^*=\iota_k(z),$$
（矩阵单位的转置/共轭把 $(k,\ell)$ 换到 $(\ell,k)$，$z^{1/2}$ 自伴 ⟹ 乘积给出对角线上的 $z$。）由公理 (i)：$\tau(\iota_k(z))=\tau(\iota_\ell(z))$，取 $\ell=1$ 得
$$\tau(\iota_k(z))=\varphi(z)\quad(z\ge0,\ 1\le k\le2N).$$
这一步是"把 $2N$ 个角统一到一个泛函"的核心，它只用 (i)。

**步骤 4：对角的可加性与 $\varphi(1)=1/(2N)$（式 5.6）。** 支撑在**不同**对角角的自伴元两两交换（乘积为 0），因此它们与 $1$ 共同生成一个 abelian $C^*$-子代数；公理 (iii) 在其上给复线性 ⟹
$$\tau(\operatorname{diag}(z_1,\dots,z_{2N}))=\sum_{k=1}^{2N}\varphi(z_k)\qquad(z_k\ge0).$$
取所有 $z_k=1$：左边 $=\tau(1_{M_{2N}(B)})=1$（规格化），右边 $=2N\varphi(1)$ ⟹ $\varphi(1)=\frac1{2N}$ ✓。
（这就是 §2 步骤 3 里"$1_{M_2}$ 上值为 2"的 $2N$ 角推广。）
**步骤 4b（式 5.7）**：把平方公理用在**第一个角内部**：取 $t$ 只在 $(1,1)$ 块里是 $x_i$（作为 $M_{2N}(B)$ 的元素），则 $t^*t=\iota_1(u_i)$、$tt^*=\iota_1(v_i)$ ⟹ $\varphi(u_i)=\varphi(v_i)$ ✓。**这一步是把"列"与"行"两条关系统计到同一个 $\varphi$ 上的唯一通道。**

**步骤 5：逐块缺陷与望远镜。**
- 前段第 $i$ 块的标量缺陷：$\varphi(H_i)-\varphi(H_{i-1})-\varphi(u_i)$。
- 后段第 $i$ 块：$\varphi(2-J_i)-\varphi(1-J_{i-1})-\varphi(1-v_i)=-\varphi(J_i)+\varphi(J_{i-1})+\varphi(v_i)$。
  这里的每一步"$\varphi(\alpha\cdot1-X)=\alpha\varphi(1)-\varphi(X)$"都**限定在 abelian 子代数 $C^*(1_{B},X)$**（$X$ 为 $J_i$ 或 $v_i$）内使用线性，论文专门点明："Here each scalar-translation identity is taken within the abelian algebra generated by the corner identity and the indicated self-adjoint element. Thus these equalities use no additivity on noncommuting elements of $B$."（`05:207-209`）
- 求和 + 望远镜（$H_0=J_0=0$、$H_N=1$）：
$$\tau(a+b)-\tau(a)-\tau(b)=\varphi(H_N)-\sum_i\varphi(u_i)-\varphi(J_N)+\sum_i\varphi(v_i)=\varphi(1)-\varphi(J_N),$$
最后用了 (5.7) 把 $\sum\varphi(u_i)$ 与 $\sum\varphi(v_i)$ 完全抵消。
**注意这不是"不等式"而是"等式"**：缺陷精确等于 $\varphi(1)-\varphi(J_N)$，然后才放缩。

**步骤 6：最后的放缩。** $\varphi$ 限制到 abelian 子代数 $C^*(1,J_N)\subseteq B$ 是正线性泛函（步骤 3–4 的产物），而 $0\le J_N\le c\,1$ ⟹ $\varphi(J_N)\le c\varphi(1)$。于是
$$\tau(a+b)-\tau(a)-\tau(b)\ \ge\ \varphi(1)(1-c)=\frac{1-c}{2N}\qquad\blacksquare$$

#### (c) 每个常数/假设的机械理由

- **矩阵尺寸 $2N$（不是 $N$）**：后段 $N$ 个块要用"$1-J$"型补元，与前段 $N$ 个块并列 ⟹ 需要 $2N$ 个对角角。缩小到 $N$ 会让两段互相干涉（同一个角不能同时放 $H_{i-1}$ 与 $1-J_{k-1}$），并且步骤 3 的"$\tau(\iota_k(z))$ 全等"依赖角之间互不干涉。放大（例如 $4N$）只会让 $\varphi(1)=1/(4N)$ 更小、缺陷 $(1-c)/(4N)$ 更弱。所以 $2N$ 是"最小可行且最优"的。
- **$\varphi(1)=1/(2N)$ 与分母 $2N$**：缺陷 $=\varphi(1)(1-c)$，规格化把 $\varphi(1)$ 定死 ⟹ **想放大缺陷只能减小 $N$ 或减小 $c$**。$N$ 由 Prop 4.1 的 $16+8=24$ 决定，$c$ 由 Lemma 3.2 的 $\tfrac32$ 决定：$(1-c)/(2N)=\tfrac13/48=1/144$。这是全篇常数的唯一汇聚点。
- **前段用 $H_{i-1}$ 配 $u_i$、后段用 $1-J_{i-1}$ 配 $1-v_i$**：这是**符号设计**。前段望远镜给 $+\varphi(H_N)-\sum\varphi(u_i)$（用列关系 $H_N=1$）；后段望远镜给 $-\varphi(J_N)+\sum\varphi(v_i)$（负号来自"补元"，即 $2-J_i$ 与 $1-J_{i-1}$、$1-v_i$ 之间的差）。两段的 $\sum\varphi(u_i)/\sum\varphi(v_i)$ 项通过 (5.7) 抵消后，剩下的正是"$1$ 与 $J_N$ 的差"，即两条关系式的**冲突量**。若两段都用同号（例如后段也用 $J$ 而非 $1-J$），望远镜会给出 $\varphi(1)-\varphi(J_N)+2\sum\varphi(v_i)$ 之类的混合项，无法化简为 $\varphi(1)(1-c)$；若后段不用补元，正压缩元条件失败（$-J_{i-1}$ 不是正元）。**"补元 + 负号"是一个双向不可少的耦合设计**。
- **$c\in[0,1)$**：$c<1$ 给正的缺陷（$1-c>0$）；$c=0$ 时缺陷 $=1/(2N)$ 最大（但 $c=0$ 意味 $\sum xx^*=0$ ⟹ 所有 $x_i=0$ ⟹ 与 $\sum x^*x=1$ 矛盾，所以 $c=0$ 不可达；论文仍把假设写成 $0\le c<1$ 只是形式化地允许区间）；$c\ge1$ 时缺陷 $\le0$，引理变成空话，且与"存在迹态"不再矛盾。
- **$a,b$ 是"正压缩元"**：Theorem 1.1 的陈述需要它们落在正单位球里（这让反例"有界、定量"，也方便 Lean 用 `PositiveContraction` 谓词表达，见四、4.3）。机制上，正性来自步骤 2 的核对；压缩性 $\|H_i\|\le1$ 来自 $0\le H_i\le1$。
- **只对"1-拟迹"陈述**：引理不需要 2-拟迹的矩阵延拓假设！这解释了 `01:209-211` 的句子"This last step works for every normalized \(1\)-quasitrace on \(A\), hence for every normalized \(2\)-quasitrace there"。也就是说，$A=M_{48}(B)$ 上哪怕只有 1-拟迹（不含任何 $M_2$ 延拓信息）也必须非可加。$M_2$-延拓的全部作用只出现在**存在性**一侧（Theorem 2.1 输出的是 2-拟迹）。这是一个非常值得笔记强调的"公理用量分析"。
- **"$\tau$ 定义在 $M_{2N}(B)$ 上"而不是"$\tau$ 定义在 $B$ 上再放大"**：步骤 3 的角比较 $t^*t=\iota_\ell(z),tt^*= \iota_k(z)$ 需要 $\tau$ 能在**矩阵代数**上用 (i)。若只有 $B$ 上的 1-拟迹，跨角搬运完全不可用。所以引理的量化"$\tau$ on $M_{2N}(B)$"是实质性的。

#### (d) 候选失败路线 [推测]

1. **直接取 $a=u_1,\ b=\sum_{i\ge2}u_i$（或 $a=\sum u_i=1,\ b=\sum v_i$）** [推测]：这样 $\tau(a)=\tau(1)=1$，而 $\tau(b)$ 无法用 $\tau$ 的公理拆——$\{u_i\}$ 两两不交换，(iii) 不适用，(i) 只给 $\tau(u_i)=\tau(v_i)$ 逐个相等而不是和的可加。缺陷根本算不出来。引理 5.2 的全部技巧是"把不可加性藏进**对角矩阵的角之间**，那里的不可交换性被矩阵单位吸收"：真正的非交换内容放在 $u_i,v_i$ 的部分和顺序上，而 $\tau$ 的可加性只在"不同角"这种**交换**场景使用。
2. **只用 $N$ 个角、前段单独望远镜** [推测]：$\varphi(H_N)-\sum\varphi(u_i)=\varphi(1)-\sum\varphi(u_i)$，但 $\sum\varphi(u_i)=\varphi(\sum u_i)=\varphi(1)$ 需要 (iii) 在 $C^*(u_1,\dots,u_N)$ 上成立，而 $u_i$ 不交换，无从谈起。所以**必须**用后段的 $\sum\varphi(v_i)$ 通过逐个 (5.7) 等式来替换 $\sum\varphi(u_i)$，而不是把 $\varphi$ 加到 $\sum u_i$ 上。这解释了后段的存在必要性（不是装饰）。
3. **想证明缺陷 $\ge(1-c)/N$（分母 $N$ 而非 $2N$）** [推测]：那要把 $2N$ 项压到 $N$ 项，即让 $\varphi(1)=1/N$；但 $\varphi(1)=1/(\text{角数})$ 是规格化的推论，角数减半 ⟹ 前段/后段共用角 ⟹ 步骤 2 的正性/步骤 3 的跨角搬运同时坏掉。分母 $2N$ 是"用规格化换可加性"的价格。
4. **对一般自伴元（不限正元）做同样的构造** [推测]：Theorem 1.1 要求 $a,b$ 正压缩元是为了把反例钉在单位球的正锥里（更强的陈述）。若允许任意自伴元，缺陷会因线性 $\tau(h+ik)$ 的公理而更容易被"归一化掉"（例如把 $a,b$ 换成 $a+\lambda 1$ 会改变缺陷的符号）；论文的构造是"正锥内的定量非可加"，这是最强的可读形式。[推测] 论文未述。

---

### 2.6 Theorem 1.1 的证明（06-conclusion.tex，全篇最短的一节）

#### (a) 原文全文（`06:1-15`）

```tex
\Needspace{8\baselineskip}
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Theorem~\ref{thm:construction} supplies the separable unital algebra
\(B\), generated by twenty-four elements satisfying
\eqref{eq:algebra-relations}, with no properly infinite matrix
algebra over it. Consequently the same is true of \(A=M_{48}(B)\),
because \(M_k(A)\cong M_{48k}(B)\) for every \(k\).
Theorem~\ref{thm:existence} gives a normalized \(2\)-quasitrace on \(A\).

Apply Lemma~\ref{lem:defect} with \(N=24\) and \(c=2/3\).
It supplies positive contractions \(a,b\in A\) for which every
normalized \(2\)-quasitrace has defect at least
\((1-c)/(2N)=1/144\). Matrix amplification preserves separability
and unitality, so all assertions of Theorem~\ref{thm:main} follow.
\end{proof}
```

注意：**06 节没有 `\section` 命令**（`paper.tex` 的输入顺序 05 → 06 → 07 使这段证明被排在 §5 之后、§6 之前，因此它属于 §5 的排版区间，但不占用 Theorem 编号；`06:1` 的 `\Needspace{8\baselineskip}` 是防跨页断排的排版指令）。这是文件命名与论文结构的错位——文件名"conclusion"其实不是结论节，真正的结论节是 07（"Tensor products and stable finiteness"，Section 6）。[推测] 这是稿件组装遗留的顺序安排，作者把 Theorem 1.1 的证明推迟到构造之后才给出，以便 §5 能独立成篇。

#### (b) 机制推导（每句的用量）

1. "$M_k(A)\cong M_{48k}(B)$"：矩阵代数的标准同构 $M_k(M_n(B))\simeq M_{kn}(B)$ ⟹ "没有 $M_m(B)$ 适当无穷" 直接升级为"没有 $M_k(A)$ 适当无穷"（把 $48k$ 跑遍所有 $48$ 的倍数——注意这里需要的是**全部** $m$ 都不适当无穷，所以 $48$ 的倍数只是子集；但因为条件是"for every $k$"，覆盖的正好是 $\{48k\}$，而 $M_j(A)$ 的 $j$ 跑遍全部正整数 ⟹ $48j$ 跑遍全部 $48$ 的倍数。要得到"$M_k(A)$ 对**每个** $k$ 不适当无穷"，需要的正是"$M_{48k}(B)$ 对每个 $k$ 不适当无穷"，这由 Theorem 5.1 的"每个 $m$"给出 ✓，无需覆盖非 48 倍数的 $B$-矩阵尺寸）。
2. 由 Theorem 2.1（⟸ 方向）⟹ $A$ 有规格化 2-拟迹 ⟹ 满足 Theorem 1.1 的"admitting a normalized 2-quasitrace"。
3. Lemma 5.2 在 $N=24$、$c=2/3$、代数 $B$、元组 $(x_1,\dots,x_{24})$ 上应用 ⟹ 存在正压缩元 $a,b\in M_{48}(B)=A$，使 $M_{48}(B)$ 上**每个规格化 1-拟迹**缺陷 $\ge\tfrac{1/3}{48}=1/144$。
4. $A$ 上的 2-拟迹（作为 $M_2(A)$ 上 1-拟迹在左上角的限制）自身就是 $A$ 上的 1-拟迹（定义 2 的第一句话，`02:14-15`）⟹ 步骤 3 的结论对"每个规格化 2-拟迹"成立 ✓。
5. "Matrix amplification preserves separability and unitality"：$M_{48}(B)$ 可分（有限维矩阵代数是 $B$ 的有限积，稠密子集取有理系数矩阵元）且有单位 ✓。
6. **完全没有用到的东西**：没有用到 $\tau$ 的任何具体公式、没有用到 2-拟迹的 $M_2$ 延拓在缺陷估计中的作用（步骤 4 只是"1-拟迹 ⟸ 2-拟迹"的方向）。

#### (c) 常数的机械理由

- **$48=2N=2\times24$**：Lemma 5.2 要求放大到 $M_{2N}$。$24$ 又是 Prop 4.1 的 $16+8$。所以 $A$ 的尺寸不是自由参数而是被上游两个数钉死。放大 $A$（如 $M_{96}(B)$）仍能给反例但缺陷会被 $\varphi(1)$ 稀释（此时规格化 $1$-拟迹在 $M_{96}$ 上的角值是 $1/96$，缺陷 $\ge1/288$，**更差**）；缩小（$M_{24}(B)$）则 Lemma 5.2 不适用（需要 $2N$ 个角）。
- **$1/144=\tfrac13/48$**：见 2.5(c)；敏感度分析放第五节。
- **为什么必须在 $A$（而不是 $B$）上陈述 Theorem 1.1**：因为缺陷对天然住在 $M_{48}(B)$ 里；$B$ 自己上没有已知的固定正元对有一致缺陷下界。[推测] 这也解释了 abstract 说"constructing a separable unital $C^*$-algebra"时不指明 $B$ 还是 $A$——正文用的是 $A$。

#### (d) 候选失败路线 [推测]

1. **直接令 $A=B$** [推测]：定理的"$a,b$"要来自 Lemma 5.2，而它活在 $M_{2N}(B)$；若不放大矩阵代数，就没有现成的缺陷对，只能退回到"存在某个 2-拟迹不是迹"的非定量陈述，失去 $1/144$ 与"对每个拟迹一致"两条强度。
2. **不借助 Theorem 2.1 而试图显式给出一个 2-拟迹** [推测]：$B$（乃至 $A$）非确切（`01:94-95`），显式拟迹在文献里没有可用的构造手段；Theorem 2.1 是**唯一**能给出"存在性"的通道，代价是必须证"所有矩阵代数都不适当无穷"，也就是整篇 §3–§5 的全部工作量。这是本论文"绕远"的根本原因，也是最有叙事价值的一条 [推测]（论文的 intro `01:206-211` 明写 "set \(A=M_{48}(B)\) and apply Theorem~\ref{thm:existence} directly to \(A\)… requires no formula for a chosen quasitrace"，说明作者自觉地把这一点当作设计目标）。
3. **把 Theorem 2.1 用在 $B$ 上、再放大拟迹** [推测]：$B$ 上的规格化 2-拟迹并不能自动搬成 $M_{48}(B)$ 上的（放大需要 $\tau\mapsto\operatorname{Tr}\otimes\tau$，而这要求 $\tau$ 是**迹**才线性；拟迹不线性，无法用矩阵张量积放大）。所以顺序必须是"先放大代数、再在放大后的代数上用存在定理"，不能反过来。这一点论文没写，但它是依赖图里 Theorem 2.1 被用到 $A$ 而非 $B$ 的原因。[推测] 强度较高，因为 (i) 反向放大不成立是拟迹非线性的直接后果；(ii) 论文 `01:206` "set $A=M_{48}(B)$ and apply Theorem 2.1 directly to $A$" 的 "directly" 一词像是有意强调。

---

### 2.7 Corollary 1.2 的证明（07-consequences.tex，Section 6）

#### (a) 精确陈述与前置输入

除了 1.2 抄过的推论本身，本节的两段"输入登记"必须原样保留。

因子输入（`07:9-21`）：

```tex
The assertion that every normalized \(2\)-quasitrace on every unital
\(C^*\)-algebra is a tracial state is equivalent to the assertion that
every \(AW^*\)-factor of type \(\mathrm{II}_1\) is a \(W^*\)-algebra;
see \cite[Section~2]{MR} and \cite[Theorem~4.11]{Gow}.
Every such factor admits
a normalized \(2\)-quasitrace, and it admits a tracial state exactly
when it is a \(W^*\)-algebra \cite[Section~2]{MR}. A finite
\(AW^*\)-factor is simple as a \(C^*\)-algebra
\cite[Remark~2.7]{Gow}. For a simple unital \(C^*\)-algebra, absence of
stable proper infiniteness is equivalent to stable finiteness
\cite[Section~2]{MR}. These statements impose no separability condition
on the factor.
```

张量积输入与 $\mathbb F_\infty\to\mathbb F_2$ 的降级（`07:23-45`）：

```tex
Haagerup's trace-obstruction theorem, in the properly infinite
formulation recorded by Milh{\o}j and R{\o}rdam
\cite[Theorem~3.1]{MR}, says that a unital \(C^*\)-algebra \(D\) has no
tracial state if and only if
\(D\otimes_{\min}C_r^*(\mathbb F_\infty)\) is properly infinite.
Haagerup notes that the subgroup inclusion
\(\mathbb F_\infty\hookrightarrow\mathbb F_2\) induces a unital
inclusion \(C_r^*(\mathbb F_\infty)\hookrightarrow C_r^*(\mathbb F_2)\)
\cite[Remark~2.5(a)]{Haagerup}. The minimal tensor product preserves
injective \(*\)-homomorphisms, so it gives a unital inclusion
\[
D\otimes_{\min}C_r^*(\mathbb F_\infty)
\hookrightarrow D\otimes_{\min}C_r^*(\mathbb F_2).
\]
The two isometries witnessing proper infiniteness retain their relations
under this inclusion. Consequently,
\begin{equation}
 D\text{ has no tracial state}
 \quad\Longrightarrow\quad
 D\otimes_{\min}C_r^*(\mathbb F_2)\text{ is properly infinite}.
 \label{eq:traceless-tensor}
\end{equation}
```

#### (b) 证明机制推导（按 (i)(ii)(iii) 分）

**(i) 两条单稳定有限代数、其极小张量积适当无穷。**

1. 由 Theorem 1.1，"每个规格化 2-拟迹都是迹态"这一命题为假。
2. 因子输入的第一句（等价性）⟹ 存在 type $\mathrm{II}_1$ 的 $AW^*$-因子 $M$ 不是 $W^*$-代数（即没有 Banach 空间预对偶）。
3. 因子输入第三句（"it admits a tracial state exactly when it is a $W^*$-algebra"）⟹ $M$ **无迹态**。
4. 因子输入第四句（Gow Remark 2.7：有限 $AW^*$-因子作为 $C^*$-代数是单的）⟹ $M$ 单。
5. $M$ 有规格化 2-拟迹（因子输入第二句"Every such factor admits a normalized $2$-quasitrace"）。由 Theorem 2.1 的另一方向（"有规格化 2-拟迹 ⟹ 每个 $M_m$ 不适当无穷"）⟹ $M$ 无稳定适当无穷。论文的写法是"Theorem~\ref{thm:existence} therefore excludes stable proper infiniteness"（`07:51-52`）。
6. 因子输入第五句（单 + 有单位 ⟹ "无稳定适当无穷" ⟺ "稳定有限"）⟹ $M$ **稳定有限**。
7. $R=C_r^*(\mathbb F_2)$：Powers 定理给单性；典范迹态 faithful（论文直接陈述"Its canonical tracial state is faithful, as are the matrix traces induced by it"），faithful 迹排除非酉 isometry（若 $s^*s=1$、$ss^*\ne1$ 则 $1-ss^*\ge0$ 非零，faithful 迹给 $\tau(1-ss^*)>0$，但 $\tau(ss^*)=\tau(s^*s)=1=\tau(1)$ ⟹ 矛盾）⟹ $R$ 稳定有限；$R$ 有单位 ✓。
8. 把 (6.1) 用于 $D=M$ ⟹ $M\otimes_{\min}R$ 适当无穷 ⟹ (i) ✓（其中一个因子是 $C_r^*(\mathbb F_2)$）。
9. (6.1) 本身的推导：$D$ 无迹 ⟹（MR Thm 3.1）$D\otimes C_r^*(\mathbb F_\infty)$ 适当无穷 ⟹ 通过 $C_r^*(\mathbb F_\infty)\hookrightarrow C_r^*(\mathbb F_2)$（由 $\mathbb F_\infty\hookrightarrow\mathbb F_2$，自由群含无穷秩自由子群）与极小张量积保持单射 ⟹ 两个 isometry 在子代数里，其关系 $s_i^*s_j=\delta_{ij}$ 不被破坏 ⟹ $D\otimes C_r^*(\mathbb F_2)$ 适当无穷 ✓。**$\mathbb F_2$ 是"$\mathbb F_\infty$ 的加强"而不是削弱**——论文 intro（`01:22-24`）说"The resulting tensor product can be properly infinite with one factor equal to … $C_r^*(\mathbb F_2)$"，语气是"能降到 2 个生成元"。

**(ii) 拟迹在张量积上丢失。**

1. 取 Theorem 5.1 的显式 $B$（可分、有单位）。
2. 无矩阵代数适当无穷 ⟹ Theorem 2.1（⟸）⟹ $B$ 有规格化 2-拟迹。
3. 关系式 (5.1) 排除迹态：若有迹态 $\sigma$，则 $1=\sigma(\sum x_i^*x_i)=\sigma(\sum x_ix_i^*)\le\tfrac23\sigma(1)=\tfrac23$，矛盾（`07:65-66` "applying one to their two sums would give \(1\le2/3\]"）。
4. (6.1) 用于 $D=B$ ⟹ $B\otimes_{\min}R$ 适当无穷。
5. Theorem 2.1 的"有规格化 2-拟迹 ⟹ 每个 $M_m$ 不适当无穷"取逆否：$M_1(B\otimes R)$ 自身已适当无穷 ⟹ $B\otimes_{\min}R$ **没有**规格化 2-拟迹 ✓。
6. (ii) 的独立意义：稳定有限性在张量积下不仅不保持，连"存在拟迹"这种更弱的性质都不保持。

**(iii) 可分、稳定有限、无迹态的代数。**

1. 因子 $M$（来自 (i)）无迹态 ⟹ Haagerup 有限迹障碍判据（`07:72-78`）给出 $y_1,\dots,y_n\in M$：
$$\sum_{i=1}^ny_i^*y_i=1,\qquad \Big\|\sum_{i=1}^ny_iy_i^*\Big\|<1.$$
2. 令 $C=C^*(1,y_1,\dots,y_n)\subseteq M$：有限生成 ⟹ 可分；有单位 ✓。
3. **继承稳定有限**："an isometry in $M_k(C)$ is an isometry in $M_k(M)$, hence is unitary there and therefore already unitary in $M_k(C)$."（`07:80-82`）三步：$M_k(C)\subseteq M_k(M)$（包含是 $*$-同态，保持 $s^*s=1$）；$M_k(M)$ 稳定有限 ⟹ 其中 isometry 是酉；酉关系只涉及 $s$ 自身 ⟹ 在 $M_k(C)$ 里也是酉 ✓。$M$ 稳定有限是 (i) 第 6 步产物。
4. 无迹：若有迹态 $\tau$ 于 $C$，
$$1=\tau\Big(\sum y_i^*y_i\Big)=\tau\Big(\sum y_iy_i^*\Big)\le\Big\|\sum y_iy_i^*\Big\|<1,$$
矛盾 ✓（第一个等号用迹性 $\tau(y^*y)=\tau(yy^*)$ 与 $\tau(1)=1$；不等号用正线性泛函在正元上 $\le$ 范数的标准估计）。
5. 不宣称单（$C$ 是 $M$ 的有限生成子代数）——与 `01:132-133` 的声明一致 ✓。

#### (c) 每个输入/常数的机械理由

- **$\mathbb F_2$ 而不是 $\mathbb F_\infty$**：(6.1) 的推出依赖 $\mathbb F_\infty\hookrightarrow\mathbb F_2$（$\mathbb F_2$ 的 $\ker(\mathbb F_2\to\mathbb Z)$ 是无穷秩自由群，经典事实）。$C_r^*(\mathbb F_n)$，$n\ge2$ 皆可；$n=1$（$\mathbb Z$）不行——$C_r^*(\mathbb Z)=C(\mathbb T)$ 交换，其极小张量积不可能是适当无穷（且 $\mathbb F_\infty$ 不含于 $\mathbb Z$）。(i) 还额外要 $R$ **单**（Powers 1975 的定理），$\mathbb F_2$ 是该定理的最小形式。
- **$\|\sum y_iy_i^*\|<1$（(iii)）**：Haagerup 判据（`01:148-150` "Haagerup's characterization of the absence of tracial states by a finite tuple with column sum one and a strict row bound \cite[Lemma~2.1]{Haagerup}"）给的就是严格不等号；具体数值不重要。$B$ 里的对应物是 $\tfrac23$，$M$ 里是某个未知的 $<1$。**两处是同一机制（列和 $=1$ vs 行和 $<1$）的两个实例**，前者定量、后者定性。
- **"$M$ 有规格化 2-拟迹"是外部输入**：来自"$AW^*$ 因子上的维数函数"理论（因子输入第二句，引 MR §2），本文无法替代。少了它 (i) 就缺"$M$ 稳定有限"这一半。
- **"$M$ 单"来自 Gow Remark 2.7**：单性是 Milhøj–Rødnam 问题的硬要求；$B$ 提供不了，这正是 (i) 必须绕道 $AW^*$-因子的原因。
- **"These statements impose no separability condition on the factor"（`07:20-21`）**：承认 $M$ 可能不可分 ⟹ (i) 的因子 $M$ 不带可分性；(iii) 要求可分 ⟹ 必须取有限生成子代数 $C$，同时放弃单性。三个断言"用不同代数"的机制原因就在这里。
- **(ii) 里 Theorem 2.1 被用了两次、方向相反**：先在 $B$ 上用充分性（无稳定适当无穷 ⟹ 存在拟迹），再在 $B\otimes R$ 上用必要性的逆否（自身适当无穷 ⟹ 不存在拟迹）。

#### (d) 候选失败路线 [推测]

1. **想直接用 $B$ 证 (iii)** [推测]：需要 $B$ 稳定有限；Theorem 2.1 只给"没有矩阵代数适当无穷"，两者在**非单**代数上不等价（可能存在无穷但不适当无穷的投影）。$B$ 的单性论文没证也不顺手。绕道 $M$ 的有限生成子代数一步到位，代价只是丢掉单性——而 (iii) 不要单性。
2. **想用 $M$ 直接满足 (iii)** [推测]：$M$ 一般不可分（论文明说 "with no separability assertion for that factor"）。取 $C=C^*(1,y_1,\dots,y_n)$ 是可分化的唯一廉价手段。[推测] 顺便注意"$1$"在这里是冗余写法：由 $\sum y_i^*y_i=1$ 确有 $1\in C^*(y_1,\dots,y_n)$；§5 里 $B=C^*(1,x_1,\dots,x_{24})$ 同样冗余但同样被写下——两处一致，像是作者的书写习惯（也可能是为了和 Lean 里 `generatedAlgebra (Set.range x)` 之类的定义口径对齐，见四、4.4 [推测]）。
3. **想用 $B\otimes R$ 顶替 (i) 里的 $M\otimes R$** [推测]：$B$ 的稳定有限性未证（路线 1），(i) 要求两个因子都单且稳定有限，$B$ 两条都不满足。作者把 (i) 与 (ii) 分派给不同代数，是"哪条性质可得上"的直接映射。
4. **不引用 MR Thm 3.1 而直接构造 $M\otimes R$ 中的两个 isometry** [推测]：等价于重证 Haagerup 的张量积刻画。论文选择"登记外部定理 + 一句 $\mathbb F_\infty\hookrightarrow\mathbb F_2$ 的降级"，把工作量压到最小。

---

## 三、叙事时间线（论文自述的动机、已知结果与作者声明）

### 3.1 论文给出的历史线（逐字引用 + 出处）

论文的历史叙述集中在 intro 的第 3–5 段与 §2 的存在定理注记里。按时序把原文钉好：

1. **1951：Kaplansky 引入 $AW^*$-代数。**（`01:38-45`，转述 Gow）
   > "Gow's historical account explains that Kaplansky introduced \(AW^*\)-algebras in 1951 to characterize \(AW^*\)-algebras by intrinsic algebraic conditions, independent of a chosen Hilbert-space representation. The factor types have different outcomes: every type \(\mathrm{I}\) \(AW^*\)-factor is a \(W^*\)-algebra, whereas type \(\mathrm{III}\) counterexamples exist. The type \(\mathrm{II}_1\) factor question is the finite case addressed here \cite[Introduction]{Gow}."

   注意作者的口径：type I 为真、type III 有反例、type II$_1$ 是本文要否证的"有限情形"。三类结局并列写出，是给读者的"为什么这个问题不是显然"的交代。

2. **1978：Cuntz 维数函数。**（`01:48-49`）
   > "Cuntz developed dimension functions for simple algebras \cite{Cuntz1978}"
   §2 里再次提及（`02:40-41`）："Cuntz's work on dimension functions \cite{Cuntz1978} precedes the general criterion."

3. **1982：Blackadar–Handelman，2-拟迹 ⟺ 下半连续维数函数。**（`01:50-51`）
   > "Blackadar and Handelman established the correspondence between \(2\)-quasitraces and lower semicontinuous dimension functions \cite{BH}."
   §2 注（`02:42-45`）："The correspondence between \(2\)-quasitraces and lower semicontinuous dimension functions is due to Blackadar--Handelman \cite[Theorems~II.2.2 and II.3.1]{BH}"

4. **1992：Blackadar–Rørdam，预序半群上态的延拓。**（`01:58-60`）
   > "Blackadar and R{\o}rdam later developed the extension of states on preordered semigroups that underlies the general existence criterion \cite{BR}."
   §2 注（`02:45-46`）："the extension of semigroup states underlying this formulation is discussed in \cite{BR}."

5. **1991 草稿 / 2014 发表：Haagerup，确切代数上 2-拟迹皆是迹。**（`01:62-65`）
   > "The exact case was settled by Haagerup: every \(2\)-quasitrace on a unital exact \(C^*\)-algebra is a trace \cite[Theorem~5.11]{Haagerup}. A first draft was completed in 1991 and circulated thereafter; the paper was published in 2014."

   这两句的信息量在于：**作者特意交代了 23 年的草稿—发表间隔**。[推测] 目的是提醒读者"反例必须在非确切代数里找"这一事实早在 1991 年就已知，本文的新意不在"绕开确切性"而在"具体绕开的方式"。紧接着：
   > "Without exactness, the existence of quasitraces is governed by a different condition."（`01:66-67`）

6. **2006（未发表）：Kirchberg 的 1-拟迹反例。**（`01:97-101`，这是"矩阵延拓条件不可省"的证据）
   > "The matrix-extension requirement is essential to this conclusion. Haagerup reports Kirchberg's 2006 unpublished example of a \(1\)-quasitrace that is not a \(2\)-quasitrace, and hence is not a trace \cite[Introduction]{Haagerup}. This example lacks the matrix extension required here."

   全篇只有这一处用"essential"来断言某条件的不可省性。它同时划出本文的**最低合法强度**：反例必须扛得住"2-拟迹"这一加强。

7. **2023：Milhøj–Rødarn 的问题与归约。**（`01:16-21`，这是本文的立项陈述）
   > "Milh{\o}j and R{\o}rdam asked whether the minimal tensor product of two unital simple stably finite \(C^*\)-algebras must again be stably finite \cite[Question~2.5]{MR}. They proved that this question is equivalent to the quasitrace problem and that a negative answer to that problem would yield a properly infinite tensor product with \(C_r^*(\mathbb F_\infty)\) \cite[Section~2 and Theorem~3.1]{MR}. We construct the required quasitrace counterexample."

   以及关于生成元长度与延迟无穷性的那条建议（`01:151-156`，本文构造路线的直接出处）：
   > "Milh{\o}j and R{\o}rdam proposed separating a uniformly bounded length of such a tuple from increasingly delayed matrix proper infiniteness \cite[Remark~4.7]{MR}. The construction below uses a bounded product and a generated subalgebra, with a separate test for every matrix size and polynomial degree. The fixed number of generators preserves the trace obstruction while all finite polynomial candidates are excluded."

8. **2026：Gow 的等价刻画与本文。**（`01:102-104`）
   > "Gow's recent work places the established factor--quasitrace equivalence alongside further equivalent formulations involving maximal abelian subalgebras and bidual retractions \cite[Theorem~4.11]{Gow}."

   bibliography 里 Gow 是 "preprint, 2026, version~2, 14~July~2026, arXiv:2601.04431v2"，MR 是 "preprint, 2023, version~2, 30~November~2023; to appear in Münster J. Math."，本文日期 2026-09-23。时间线上本文晚于 Gow v2 两个月。

9. **拓扑方法的先例。**（`01:183-188`）
   > "The topological obstruction follows the use of characteristic classes in the constructions of Villadsen \cite[Section~3]{Villadsen1999} and R{\o}rdam \cite[Proposition~4.5]{Rordam2003}. Here projective-space factors retain a nonzero Chern class after a controlled trivial summand is allowed. The parameters are selected anew for each finite test."

   §4 开头（`04:8-12`）重复了同一声明并加了一句"our test"的差异：
   > "The use of characteristic classes to obstruct comparison follows the methods of Villadsen \cite[Section~3]{Villadsen1999} and R{\o}rdam \cite[Sections~3--4]{Rordam2003}. Our test retains enough of a Chern class to exclude a specified trivial subbundle, even though the maps between successive levels have the normalized column and row bounds."

10. **优化方法的先例。**（`03:78-84`）
    > "The next normalization uses a determinant potential. Gurvits's operator-scaling theory uses determinant capacity to relate rank nondecrease to approximate doubly stochastic scaling \cite[Section~4]{Gurvits2003}. Related affine log-determinant functions are studied by Sra and Hosseini \cite[Corollary~2.11]{SraHosseini2015}. We prove the version needed here, including the strict convexity and continuity that allow normalization over nontrivial bundles."

    intro 里对应的通俗版（`01:194-199`）：
    > "The determinant-potential approach is related to operator scaling \cite[Section~4]{Gurvits2003} and to geodesically convex matrix optimization \cite[Corollary~2.11]{SraHosseini2015}. We prove strict convexity and existence of a unique minimizer for the present rectangular maps; uniqueness makes the normalization compatible with changes of bundle frame."

### 3.2 作者明写的"边界声明"（本文**没有**证什么）

论文没有 "we cannot…"、"there is no reason…"、"it is unclear whether…" 这类句式（我对 `we cannot|we do not|no reason|it is not clear|remains open|unclear|unknown|not claimed` 做了全库正则检索，**零命中**）。它的自我设限全部通过"声明强度"完成。逐条原文：

| 位置 | 原文 | 排除的误读 |
|---|---|---|
| `01:126-129` | "The three assertions use related but different algebras. The simple tensor-product example comes from a non-von-Neumann \(AW^*\)-factor of type \(\mathrm{II}_1\), with no separability assertion for that factor." | 不要以为 (i) 的因子可分 |
| `01:129-131` | "The quasitrace-loss example uses the explicit separable algebra \(B\) constructed below; we prove that no matrix algebra over \(B\) is properly infinite, not that \(B\) is stably finite." | 不要以为 $B$ 稳定有限 |
| `01:131-133` | "A finitely generated subalgebra of the \(AW^*\)-factor gives the separable stably finite traceless example, without a simplicity assertion." | 不要以为 (iii) 的代数单 |
| `01:133-135` | "The short deductions from established trace-obstruction and tensor-product results are given in Section~\ref{sec:consequences}." | §6 只是"短推导"，不是新定理 |
| `02:28-29` | "Absence of stable proper infiniteness is the condition needed below; no assertion about finiteness of every projection is required." | 不要以为证明了"所有投影有限" |
| `02:46-47` | "In particular, Theorem~\ref{thm:existence} has no exactness, simplicity, or representation assumption." | 存在定理是普适的（这是**肯定式**声明） |
| `01:94-95` | "The constructed algebra is necessarily nonexact, by Haagerup's result." | 承认反例落在非确切范畴（这是本文的"代价"） |
| `01:206-211` | "This last step works for every normalized \(1\)-quasitrace on \(A\), hence for every normalized \(2\)-quasitrace there, and requires no formula for a chosen quasitrace." | 缺陷估计不用 2-延拓、不用具体拟迹 |
| `04:120-121` | "The argument applies to any continuous subbundle, without a condition on its position relative to the displayed line summands." | 陈类障碍不需要子丛与分解对齐 |
| `04:228-229` | "The scaling may mix the displayed line summands, but each resulting map still has source \(E_j\) and target \(E_{j+1}\)." | 规格化会破坏分块结构（承认，但不致命） |
| `05:95-96` | "This description is intrinsic to the bundles; no simultaneous trivialization of the Hilbert fibers or continuity between different tests is required." | 各测试之间不需要任何相容性 |
| `05:125-127` | "The passage from the two relations to a specified positive pair is useful independently of the construction." | Lemma 5.2 是可复用的独立模块 |

### 3.3 设计动机的原文段（最接近"思维链"的两处）

**其一：`04:40-49`（Prop 4.1 证明开头的设计说明）**——已在 2.3(b) 段落 1 全文抄出。它的结构是"提出两个互相冲突的需求 → 给出三个各自解决一半的手段"：需求是"到 $R$ 级为止的直和要保住陈类"与"相邻丛之间要有固定个数、能膨胀一切子空间的映射"；手段是"旧线丛乘度每级除 4""新的射影空间因子按其线丛在**后续所有级**的出现总量定尺寸""初始秩给缩小的块留出膨胀小空间、大块负责其余"。

**其二：`01:158-181`（intro 的"The construction"后半）**，把双层索引与"度选择测试"这一对角化思想写在最前面：

> "The generators are shifts between finite-rank vector bundles. For each pair of positive integers \((m,R)\), we choose a compact base \(Y_{m,R}\) and bundles \(E_j\to Y_{m,R}\) for all \(j\geq0\), with \(E_0\) trivial. Only levels \(0,\ldots,R\) enter the finite topological test. A polynomial matrix \(P\in M_{m,2m}(B)\) whose entries contain only words of length at most \(R\) restricts to a bundle map \[ P_0:E_0^{\oplus2m}\longrightarrow \left(\bigoplus_{j=0}^{R}E_j\right)^{\oplus m}. \] The target's Chern class forbids the trivial image bundle that would result from \(P^*P\geq\tfrac12 I\). … The number of generators and the row bound in \eqref{eq:intro-relations} are uniform, while the bundle ranks and base dimensions may depend on \((m,R)\). A polynomial matrix approximating a candidate pair of isometries has the same coefficients at every coordinate. Its finite degree selects one of the tests already present in the product, which obstructs that approximation."

两处值得注意的措辞："**Only levels $0,\ldots,R$ enter the finite topological test**"（承认 $j>R$ 是纯填充）与"**Its finite degree selects one of the tests already present in the product**"（对角化的核心句：候选自己挑自己的否决者）。

**其三：`01:190-204`（"两个使膨胀与拓扑相容的要素"）**：

> "Two ingredients keep the expansion and the topological obstruction compatible. First, a family of bundle maps whose collective image expands every source subspace by a factor of two can be normalized continuously to have column sum one and row sum at most \(2/3\). … Second, the bundle tests separate small and large source subspaces: sixteen maps into reduced copies of old line bundles handle the small ones, while eight generic maps into a new line-bundle block handle the large ones. This keeps the generator count fixed as the matrix size and word-length bound increase."

这段是全文对"16 + 8 = 24"这一拆分给出的**唯一**官方理由（"keeps the generator count fixed"），与我 2.3(d) 路线 4 的机制分析互补。

### 3.4 论文未述的内容（明说，避免笔记里编造）

- **未述**任何尝试失败的历史：没有"we tried X and it failed"式句子；2.1–2.7 里所有"候选失败路线"都是我按文本约束反推的 [推测]。
- **未述** $d_0=64m4^R$、$q=16/8$、$\alpha=3/2$ 的**最优性**：只给了使不等式成立的验证，没有任何"更小的数不行"的论证（我在 2.2(c)、2.3(c) 给出的敏感度分析是外部推算，标注了 [推测]）。
- **未述** $B$（或 $A$）的确切性、核空间性质、理想格、单性、归纳极限结构等任何进一步的算子代数不变量。
- **未述** Kaplansky 原话/原始文献（1951 年的 \(AW^*\) 论文没有进入参考文献表；bibliography 里最早的 Kaplansky 条目**不存在**，历史部分全部经 Gow 转述）。
- **未述** 与 Connes 嵌入问题、$C^*$-代数预对偶唯一性等相邻问题的关系（Gow 的等价形式里可能涉及，但本文只列到"maximal abelian subalgebras and bidual retractions"这一句）。
- **未述** 本反例是否能让"1-拟迹是否都是 2-拟迹"之类更弱问题得到新信息（除了引用 Kirchberg 的 2006 例子说明 2-条件不可省）。
- **未述**任何计算/数值验证；全篇是纯存在性构造，连 $K_i$ 的具体值都没有被算出来过（只证它是正整数）。
- **未述**致谢、资助、代码/数据可得性声明（tex 里没有这些节）。

---

## 四、Lean 取证

> 本节所有引用格式：`文件相对路径:行号`，根目录是 `E:\math\lean\`。所有代码片段为逐字摘录（`cat -n` / `Read` 得到），未改写。

### 4.0 取证入口与体量

三处入口必须一起读，否则会低估形式化范围：

1. `formalization.yaml:1270-1272`（论文条目在 `sources:` 段的 `47-51` 行，标题逐字为 "A counterexample to Kaplansky's quasitrace conjecture and failure of tensor-product stable finiteness"）：
```yaml
    - comparator_config: ComparatorChallenges/KaplanskyQuasitrace.json
      declaration: OAI.Kaplansky.kaplansky_quasitrace_counterexample
      file: OAI/Analysis/Kaplansky/Main.lean
```
2. `docs/294.md`（该论文的 scope 说明页），除主定理外还列出**第二个** comparator 挑战：
```
| Nonadditive normalized $2$-quasitraces | [KaplanskyQuasitrace.lean](../ComparatorChallenges/KaplanskyQuasitrace.lean) |
| Tensor-product failure of stable finiteness and quasitrace consequences | [KaplanskyStableFiniteness.lean](../ComparatorChallenges/KaplanskyStableFiniteness.lean) |
```
   并且 `docs/294.md` 的 Scope 段自己就把 $1/144$ 写进了摘要："fixed positive contractions $a,b$ for which every such quasitrace satisfies $\mathrm{Re}(\tau(a+b)-\tau(a)-\tau(b))\ge1/144$. Thus none is additive on this pair."（逐字）
3. 两个 challenge 的 json：
   - `ComparatorChallenges/KaplanskyQuasitrace.json`：`"solution_module": "OAI.Analysis.Kaplansky.Main"`，`"theorem_names": ["OAI.Kaplansky.kaplansky_quasitrace_counterexample"]`，`"permitted_axioms": ["propext","Quot.sound","Classical.choice"]`，`"enable_nanoda": false`。
   - `ComparatorChallenges/KaplanskyStableFiniteness.json`：`"solution_module": "OAI.Analysis.Kaplansky.StableFiniteness"`，`"theorem_names": ["OAI.KaplanskyConsequences.stable_finiteness_bundle"]`，同样的三条 permitted_axioms、`enable_nanoda: false`。
   **登记不对称**：`grep -n "stable_finiteness_bundle|KaplanskyStableFiniteness" formalization.yaml` 零命中（该 yaml 共有 185 个 `comparator_config` 条目）。也就是说**推论束有 challenge 文件、有解法模块、有 docs 链接，但没有进 yaml 的 `formalized_in` 列表**。[推测] 原因是 yaml 按"论文主结果"登记，一篇论文只挂一条；不要把这点误读为推论未形式化。

体量（`find … -name '*.lean' | xargs wc -l` 实测）：

| 目录 | 文件数 | 行数 | 角色 |
|---|---|---|---|
| `OAI/Analysis/Kaplansky/` | 72 | 7837 | 反例本体 +  consequences |
| `OAI/Analysis/Quasitrace/` | 7 | 1093 | 拟迹公理、缺陷恒等式、幂无限排除 |
| `OAI/Analysis/Cuntz/` | 15 | 3370 | Cuntz 单胚上的维数态 → 正规化 2-拟迹 |
| `OAI/Geometry/BundleTests/` | 12 | 2788 | §4 的丛测试（Prop 4.1） |
| `OAI/Geometry/ComplexBundle/` | 32 | 8916 | §3/§4 的 Grassmann、incidence、Chern 替身 |
| `OAI/Analysis/MatrixScaling/` | 10 | 2617 | 被 `ComplexBundle/{Coordinates,Frames,Hom,Projection,Replacement}` 引用的标量/扩张机器 |

合计约 **26,600 行 Lean** 支撑一篇 24 页的论文。全树 `sorry` 计数：**0**（`grep -rn "sorry"` 在 `OAI/Analysis/Kaplansky OAI/Analysis/Quasitrace OAI/Analysis/Cuntz OAI/Geometry/BundleTests OAI/Geometry/ComplexBundle` 下唯一命中是 `OAI/Analysis/Cuntz/Content.lean:99` docstring 里的英文单词 "admit"："Disjoint closed sets admit nonnegative continuous cutoffs with disjoint…"，不是 `admit`  tactic）。两个 `sorry` 只在 challenge 桩里：`ComparatorChallenges/KaplanskyQuasitrace.lean:49`、`ComparatorChallenges/KaplanskyStableFiniteness.lean:241`。

### 4.1 顶层调用链（逐字，5 段闭环）

**闭环**：`Main.lean:13-18`
```lean
theorem actual_normalizedTwoQuasitrace_exists :
    ∃ τ : OneQuasitrace ActualDefectAlgebra, τ.Normalized ∧ τ.IsTwo :=
  actualCuntzDimensionState.normalizedTwoQuasitrace_exists

theorem kaplansky_quasitrace_counterexample : MainTarget :=
  mainTarget_of_actualDefectQuasitrace actual_normalizedTwoQuasitrace_exists
```
即整个主定理是**两个定理的拼装**，`Main.lean` 全文 25 行（含 namespace 壳），只做一件事：把"拟迹存在"喂进"缺陷下界"。这一步的数学内容是论文 `06-conclusion.tex` 全部（见 2.6），但结构上 Lean 把论文最后一段拆成了两个独立方向：

**(A) 缺陷侧**（不依赖任何拟迹存在性）——`OAI/Analysis/Kaplansky/ActualAlgebra.lean:70-76`
```lean
def actualDefectA : ActualDefectAlgebra := defectA actualGeneratorNat 24
def actualDefectB : ActualDefectAlgebra := defectB actualGeneratorNat 24

/-- The fixed pair in the actual 48-by-48 amplification satisfies the
universal defect bound, without assuming that any quasitrace exists. -/
theorem actualDefectPair_spec :
    PositiveContraction actualDefectA ∧ PositiveContraction actualDefectB ∧
      ∀ τ : OneQuasitrace ActualDefectAlgebra, τ.Normalized →
        (1 : ℝ)/144 ≤ (τ (actualDefectA+actualDefectB) - τ actualDefectA - τ actualDefectB).re :=
  uniform_defect_twentyFour actualGeneratorNat actualGeneratorNat_column actualGeneratorNat_row
```
注意 `actualDefectPair_spec` 的证明就是**一次三参数调用**：`uniform_defect_twentyFour`（`OAI/Analysis/Quasitrace/Defect.lean:204`）吃 24 个生成元 + column 关系 + row 关系。所有论文 Lemma 5.2 的 telescoping 都压进 `Defect.lean:178 uniform_defect`，其内部一行是
```lean
    uniform_defect x 24 (by decide) (2/3) (by norm_num) (by norm_num) hcol hrow
```
（`Defect.lean:212`）——`0<24` 用 `decide`，两个常数条件用 `norm_num`。

**(B) 两条关系式**（几何出口）——`ActualAlgebra.lean:52-65`
```lean
def actualGeneratorNat (i : ℕ) : ActualAlgebra :=
  if hi : i < 24 then generatedGenerator actualBoundedGenerator ⟨i,hi⟩ else 0

theorem actualGeneratorNat_column : partialSum (leftSquare actualGeneratorNat) 24 = 1 := …
theorem actualGeneratorNat_row :
    partialSum (rightSquare actualGeneratorNat) 24 ≤ ((2/3 : ℝ) : ℂ) • (1 : ActualAlgebra) := …
```
这是论文 `05-algebra.tex:12-16` 的 $\sum x_i^*x_i=1$、$\sum x_ix_i^*\le\frac23 1$ 的**逐字对应**（Lean 用 `partialSum/leftSquare/rightSquare` 把 "$\sum_{i=1}^{24}$" 写成 $\mathbb N$-序列的前缀和，以便 `Defect.lean` 的 telescoping 能在 $\mathbb N$ 上做归纳；`ActualAlgebra.lean:17-27` 两个 `private theorem partialSum_leftSquare_fin/partialSum_rightSquare_fin` 就是把前缀和换回 `∑ i : Fin 24`）。

**(C) 拟迹存在侧**——`ActualAlgebra.lean:106-115`
```lean
/-- An actual normalized dimension state exists for the constructed algebra.
No quasitrace-existence premise, simplicity, or exactness assumption is used. -/
theorem actualCuntzDimensionState_nonempty : Nonempty (CuntzDimensionState ActualDefectAlgebra) :=
  cuntzDimensionState_nonempty fun _ hk => actualDefectAlgebra_matrix_not_properlyInfinite hk

/-- A chosen state on actual Cuntz classes. No analytic correspondence is claimed. -/
def actualCuntzDimensionState : CuntzDimensionState ActualDefectAlgebra :=
  Classical.choice actualCuntzDimensionState_nonempty
```
这里发生了本形式化**最关键的一次口径转换**：论文 Theorem 2.1（`02-preliminaries.tex:31-36`，明说取自 `\cite[Theorem~2.3]{MR}`）在 Lean 里不是"引用"而是**两段重证**：
- "每个 $M_m$ 不幂无限 ⇒ 存在 Cuntz 单胚上的正规化维数态"：`OAI/Analysis/Cuntz/State.lean:29 theorem cuntzDimensionState_nonempty`（其假设形态正是 `∀ m, ¬ProperlyInfinite (M_m A)`，从 `ActualAlgebra.lean:108` 传入）+ `State.lean:14 normalizedCuntzState_exists`（用 `positive_orderUnit_normalized_state`，即有序单胚上的态扩张定理，对应论文引用的 Blackadar–Rødnam `\cite{BR}` 与 Blackadar–Handelman）。
- "维数态 ⇒ 正规化 2-拟迹"：`OAI/Analysis/Cuntz/Quasitrace.lean:232 theorem normalizedTwoQuasitrace_exists (d : CuntzDimensionState A)`。
两条合起来在 Lean 内部**重建**了论文当作外部定理引用的那一半。（另一半"2-拟迹存在 ⇒ 不幂无限"也在树内：`OAI/Analysis/Quasitrace/Infiniteness.lean:21 theorem not_properlyInfinite`，但主链用的是它的逆否形式，见 `ActualAlgebra.lean:92-97`。）

**(D) 逐尺寸排除的传递**——`ActualAlgebra.lean:84-97`
```lean
/-- Explicit matrix correspondence for every further amplification. -/
def actualDefectAmplificationEquiv (m : ℕ) :
    CStarMatrix (Fin m) (Fin m) ActualDefectAlgebra ≃⋆ₐ[ℂ]
      CStarMatrix (Fin (48*m)) (Fin (48*m)) ActualAlgebra :=
  (cstarMatrixFlatten ActualAlgebra (Fin m) ActualDefectIndex).trans
    (CStarMatrix.reindexₐ ℂ ActualAlgebra
      ((Fintype.equivFin (Fin m × ActualDefectIndex)).trans
        (finCongr (by simp [ActualDefectIndex,Nat.mul_comm]))))

theorem actualDefectAlgebra_matrix_not_properlyInfinite {m : ℕ} (hm : 0 < m) :
    ¬ ProperlyInfinite (CStarMatrix (Fin m) (Fin m) ActualDefectAlgebra) := by
  intro hp
  exact actualAlgebra_matrix_not_properlyInfinite (m := 48*m) (by omega)
    (properlyInfinite_map (actualDefectAmplificationEquiv m).toStarAlgHom hp)
```
论文说 $A=M_{48}(B)$、"degree-selects-its-own-test" 时只有一句话；Lean 把它变成一个**显式 $\star$-代数同构** `actualDefectAmplificationEquiv`，因为 `ActualDefectAlgebra := CStarMatrix (Fin 24 ⊕ Fin 24) (Fin 24 ⊕ Fin 24) ActualAlgebra`（`ActualAlgebra.lean:41-42`）与 `$M_{48}(B)$` 只是同构而非 defeq，`24 ⊕ 24` 与 `48` 的差别需要 `finCongr (by simp [ActualDefectIndex,Nat.mul_comm])` 才抹平——`Nat.mul_comm` 出现是因为 `48*m` 被写成 `m*48` 的方向问题。

**(E) 目标装配**——`ActualAlgebra.lean:99-104`
```lean
theorem mainTarget_of_actualDefectQuasitrace
    (hq : ∃ τ : OneQuasitrace ActualDefectAlgebra, τ.Normalized ∧ τ.IsTwo) : MainTarget := by
  refine ⟨ActualDefectAlgebra,inferInstance,actualDefectAlgebra_separable,hq,
    actualDefectA,actualDefectB,actualDefectPair_spec.1,actualDefectPair_spec.2.1,?_⟩
  intro τ hτ _
  exact actualDefectPair_spec.2.2 τ hτ
```
`MainTarget` 是四元组存在式（代数 + 实例 + 可分性 + 拟迹存在 + 一对元 + 通用下界），这句 `refine` 的字段顺序就是它的定义顺序。

### 4.2 模块地图：三套 namespace 的分工

`grep -m2 "^namespace"` 全 72 个文件的结果把目录一刀切成两半：

- **`namespace Kaplansky`（反例本体，14 个根文件 + 1 个异名文件，共 2169 行）**：`Main.lean`(25)、`ActualAlgebra.lean`(124)、`TestAlgebra.lean`(159)、`Shift.lean`(214)、`ShiftAlgebra.lean`(98)、`Products.lean`(251)、`Words.lean`(160)、`Polynomials.lean`(132)、`Operators.lean`(114)、`MatrixTest.lean`(109)、`MatrixImage.lean`(185)、`BundleWords.lean`(233)、`BundlePolynomials.lean`(246)、`PolynomialTest.lean`(97)。
- **`namespace KaplanskyConsequences`（07-consequences 的三条推论，57 文件 5668 行，比本体还大一倍半）**：`Quotient/`(8 文件 1337 行)、`Regular/`(19 文件 1869 行，子 namespace `.Regular`)、`StableFiniteness/`(11 文件 683 行) + 根部的聚合文件 `StableFiniteness.lean`(25 行)、`Ultrapower/`(19 文件 1775 行，子 namespace `.QuasiValue`/`.PolarScalar`)。这些文件的第一行都是 `import OAI.Analysis.Kaplansky.Main`（共 58 个文件如此），把 Main 当 prelude 用——**不是**循环依赖（Main 只 import `Cuntz.Quasitrace` 与 `ActualAlgebra`）。
- **几何/解析共享库**：`Kaplansky.ComplexGrassmann`、`Kaplansky.Incidence`、`Kaplansky.SmoothKernel`（在 `OAI/Geometry/ComplexBundle/` 里，仍属 Kaplansky 命名空间！）以及 `OAI/Analysis/{Quasitrace,Cuntz,MatrixScaling}`。注意 `StableFiniteness/ScalarTower.lean` 的 namespace 是 `OAI.Kaplansky.ComplexGrassmann`（唯一一处 consequences 目录里的异 namespace，说明该文件实际是几何工具）。

`KaplanskyConsequences` 的顶层聚合是一个**合取式 Prop**，不是三条定理：`OAI/Analysis/Kaplansky/StableFiniteness/Definitions.lean:189-190`
```lean
def StableFinitenessBundle : Prop :=
  SimpleStableTensorCounterexample ∧ ReducedQuasitraceLoss ∧ TraceFreeStablyFinite
```
配 `OAI/Analysis/Kaplansky/StableFiniteness.lean:18-20`（全文件 25 行）
```lean
theorem stable_finiteness_bundle : StableFinitenessBundle :=
  ⟨simple_stable_tensor_counterexample_exists,reduced_quasitrace_loss_exists,
    trace_free_stably_finite_exists⟩
```
即论文 Corollary 1.2 的 (i)(ii)(iii) 在 Lean 里是三个 `def … : Prop`（各自是一长串带 `letI :=` 的"存在一个类型 + 存在一个 Hilbert 空间 + …"），再由一个匿名构造器三元组一次证明。对照见 2.7。

### 4.3 论文一句话 ↔ Lean 一个模块（逐条对位表）

| 论文（file:line） | Lean 落点 | 判断 |
|---|---|---|
| §2 1-拟迹 (i)(ii)(iii)（`02:6-13`） | `Quasitrace/Basic.lean:17-25 structure OneQuasitrace`：四字段 `square_nonneg`/`square_swap`/`real_imag`/`abelian_linear` | (i) 被**拆成两条**：`0 ≤` 与交换；(iii) 被改写为 Σ-式（见 4.4-d） |
| §2 "2-quasitrace = $M_2(C)$ 上的 1-拟迹在上左角限制"（`02:14-15`） | `Quasitrace/Matrix.lean:16-21 upperLeft` + `OneQuasitrace.IsTwo` | 逐字一致 |
| §2 "normalized when $\tau(1_C)=1$"（`02:16`） | `Basic.lean:29 Normalized` | 一致 |
| §2 "The extension then has value two at $1_{M_2(C)}$"（`02:17-19`） | `Quasitrace/Extension.lean:134 extension_value_two`；再加 `:146 extension_not_normalized`，docstring "A direct check that the target's matrix extension is not accidentally required to be normalized." | Lean **多做一步**：显式证明延拓 $\sigma$ 必不正规化（论文只把 value=2 当附注） |
| §2 幂无限 $s_i^*s_j=\delta_{ij}1$（`02:21-25`） | `Quasitrace/Infiniteness.lean:18 def ProperlyInfinite := ∃ s t, star s*s = 1 ∧ star t*t = 1 ∧ star s*t = 0` | 一致（Lean 不写 $\delta_{ij}$，用三条合取） |
| §2 Theorem 2.1（引 MR Thm 2.3，`02:31-47`） | `Cuntz/State.lean:29` + `Cuntz/Quasitrace.lean:232`；反向 `Quasitrace/Infiniteness.lean:21` | **外部引用被内证**：15 文件 3370 行的 Cuntz 树 |
| §2 末尾 polar 观察 $Q=W(W^*W)^{-1/2}$（`02:51-58`） | `Ultrapower/{Polar,ApproxPolar,PolarDefect,PolarScalar,CornerPolarCut}.lean`；`Cuntz/State.lean:76 exists_positiveOrder_approx`；`BundleTests/Normalized.lean` | 论文一句话 → 三处不同用途的极化机器 |
| §3 Lemma 3.1 incidence 计数 | `ComplexBundle/{Incidence,BundleIncidence,OpenIncidence,PointExpansion,Avoidance}.lean` + `ComplexBundle/Replacement.lean:15-21 small_incidence` | 论文的一个不等式链在 Lean 里有 ℝ 版与 ℕ 版两条定理（见 4.6-5） |
| §3 Lemma 3.2 determinant potential、严格凸、唯一极小 | `MatrixScaling/{Determinant,Minimizer,Critical,Geodesic,Gram,Bounds,Canonical,Continuous,Spectrum}.lean`；`ComplexBundle/Hom.lean`（"Descent of canonical scaling"）、`ComplexBundle/Coordinates.lean`（"Coordinates and realization of Hermitian scaling sections"） | 论文 §3 的解析部分被"外包"到共享库 `MatrixScaling`（该树未出现在 `formalization.yaml` 中任何条目：`grep -n "MatrixScaling\|Scaling" formalization.yaml` 零命中）[推测] 它是跨论文复用的 operator-scaling 库，本论文的 §3 形式化正好搭在其上 |
| §4 Prop 4.1 有限拓扑测试 | `BundleTests/` 12 文件：`Multiplicities`(重数与 $d_j$)、`Base`($Y$ 底空间与前缀维数)、`Bundles`(测试丛与 Hermitian 度量)、`Twisted`(扭曲超平面丛与截面)、`Obstruction`(非零截面类)、`Retained`(retained 标号与余丛秩)、`Normalization`/`Normalized`(归一化图坐标与酉换标)、`Sequence`(前缀与完整测试步)、`Smooth`(光滑底与替换映射)、`Assembly`(16+8 映射装配)、`Complement`(重排 retained frame) | 论文一段命题 → 12 文件 2788 行 |
| §4 "top Chern class $\prod z_i^{K_i}\ne0$" | `BundleTests/Obstruction.lean:196-214 twistedOrdinarySection_fundamental_ne_zero`（docstring "The actual twisted section carries the existing augmented-base fundamental class to a nonzero ordinary relative class."）；配套 `:130-133 twistedProjectiveDimensions_sum`、`:135 twistedOrdinaryRelativeMap`、`:160 twistedOrdinaryRelativeMap_mono`、`:214 twistedHyperplane_every_section_has_zero` | **术语替换**：全树 `grep -rn "Chern\|chern" OAI/Geometry/BundleTests/` 零命中；用奇异同调的相对类 + 基本类 + excision 完成同一句话 |
| §5 Theorem 5.1 构造 $B$ | `Kaplansky/TestAlgebra.lean`（`ActualTestIndex`、`actualTestOperator`、`ActualAlgebra`、`actual_test_shift_algebra`）、`Products.lean`、`Shift.lean`、`ShiftAlgebra.lean`、`Words.lean`、`Polynomials.lean`、`MatrixTest.lean`、`MatrixImage.lean`、`Operators.lean` | $X_i^{(j)}$→`actualTestOperator i z j`；`forwardShift`（`Shift.lean:37`）实现 $\ell^2$-塔上的位移 |
| §5 "$\|P-W\|<1/5$"（`05:67`） | `Quasitrace/Defect.lean:30 approximation_margin` | 见 4.6-2 |
| §5 逐尺寸排除（对每个 $m$ 造测试） | `PolynomialTest.lean:13 properlyInfinite_actual_polynomial_bound` → `:52 properlyInfinite_actual_image` → `:70 properlyInfinite_retained_frame` → `Obstruction.lean:292 actualAlgebra_matrix_not_properlyInfinite` | 论文的"degree-selects-its-own-test"在 Lean 里是 `matrixPolynomialDegree p` 这个**从多项式提取的度数**充当 $R$（见 4.7-4） |
| §5 Lemma 5.2 缺陷恒等式 | `Quasitrace/Defect.lean:17 defect_telescoping`、`:28 defect_constant`、`:45-71 partialSum/leftSquare/rightSquare/defectA/defectB`、`:73 defect_entries_bounds`、`:94 defect_pair_positiveContractions`、`:115 reflected_defect`、`:130 defect_pair_identity`、`:174 scalar_unit_le_one`、`:178 uniform_defect`、`:204 uniform_defect_twentyFour` | 论文一段证明 → 14 条引理；`reflected_defect` 单独成条（见 4.5-b） |
| §6(=06-conclusion) Theorem 1.1 | `Kaplansky/Main.lean:17` | 一行 |
| §6(=07-consequences) Corollary 1.2(i) | `StableFiniteness/SimpleTensor.lean:11 simple_stable_tensor_counterexample_exists`；材料来自 `Regular/PowersSimple.lean:24 algebra_F2_simple`、`Regular/ReducedStable.lean:12 algebra_stablyFinite`、`Regular/ReducedTensor.lean`（`tensor_two_isometries_of_small_tuple`） | 论文的 Powers/Cuntz 论证被拆成 19 个 `Regular/` 文件 |
| Corollary 1.2(ii) | `StableFiniteness/TraceFree.lean:17 no_tracialState_of_twoThirds`、`:29 actualAlgebra_no_tracialState`、`:35 trace_free_stably_finite_exists`；`StableFiniteness/TracialStable.lean:15 stablyFinite_of_faithful_trace`；`Quotient/Extraction.lean:337 finite_trace_obstruction`、`:348 separable_extraction` | 论文 "applying one to their two sums would give $1\le2/3$"（`07:66`）就是 `no_tracialState_of_twoThirds` |
| Corollary 1.2(iii) | `StableFiniteness/QuasitraceLoss.lean:37 reduced_quasitrace_loss_exists`；`SimpleReduction.lean:17 tensor_properlyInfinite_of_no_trace`；`SimpleAmbient.lean:39 simple_stablyFinite_traceless_exists` | — |
| Gow Thm 4.11 / MR Thm 3.1 式的"无迹 ⇒ 张量幂无限" | `StableFiniteness/SimpleReduction.lean:17`、`Ultrapower/`（19 文件的准值/饱和机器） | 论文只引外部结果；Lean 自建 ultrapower 树 |

### 4.4 陈述口径的 6 处具体差异（逐字代码）

**(a) `.re`：论文写实数不等式，Lean 写实部。** challenge 与 solution 两侧的 `MainTarget` 都是
```lean
        (1 : ℝ) / 144 ≤ (τ (a+b) - τ a - τ b).re
```
（`ComparatorChallenges/KaplanskyQuasitrace.lean:46`；`OAI/Analysis/Quasitrace/Matrix.lean:34`）。论文 `01:100-108` 与 `06` 写的是 $\tau(a+b)-\tau(a)-\tau(b)\ge 1/144$，把量视为实数——这一步在论文里由 (ii) 的自伴分解免费提供（$a,b,a+b$ 都自伴，故三个值都实）。Lean 因为 `OneQuasitrace` 的实值性是**定理**（`Quasitrace/Order.lean:63 selfAdjoint_im_zero`）而不是类型信息，写 `.re` 让目标变成 `ℝ` 上的不等式，可直接用 `norm_num`/`linarith`。[推测] 这也是 `docs/294.md` 摘要里写 $\mathrm{Re}(\cdots)$ 的原因。

**(b) 正性用"伴随平方"而非 `0 ≤`。** `PositiveContraction (a : A) : Prop := (∃ x, a = star x * x) ∧ ‖a‖ ≤ 1`（`Matrix.lean:25`，docstring 逐字："Positivity via an adjoint square is equivalent to C*-positivity; the norm bound is the actual contraction condition."）。配套方向在 `Products.lean:45`：
```lean
    choose x hx using fun i => CStarAlgebra.nonneg_iff_eq_star_mul_self.mp (h i)
```
即需要正性→平方见证时立刻 `choose`。原因：`CStarAlgebra` 上的 `≤` 默认不是谱序（见 4.6-1），而论文对 $a,b$ 的要求本来就是"$a=x^*x$ 型 + 压缩"，用 ∃ 更贴近构造。`Defect.lean:94 defect_pair_positiveContractions` 就是论文 §5 "$a,b$ 是正压缩元"那一步。

**(c) `IsTwo` 的"σ 不要求 normalized"被写成显式条款。** `Matrix.lean:20` 的 `IsTwo` 里 `∃ σ` 没有归一化条件；`Extension.lean:146 extension_not_normalized` 证明"若 $\tau$ 正规化且 $\sigma$ 延拓它，则 $\sigma$ **不**正规化"（证明是 `extension_value_two` + `norm_num at ht`：`2 = 1` 矛盾）。论文 `02:17-19` 说了 value two，但没把"因此延拓不可能正规化"写成一句话。`Compactness.lean:90-92` 的 docstring 更明确："Requirements on a function and its actual M₂ corner extension. **The extension is deliberately not required to have unit value one.**"

**(d) `abelian_linear`：把论文 (iii) 变成 Σ-陈述、并且对象是"闭的非幺 star 子代数"。**
```lean
  abelian_linear : ∀ S : NonUnitalStarSubalgebra ℂ A,
    IsClosed (S : Set A) → (∀ x y : S, x * y = y * x) →
    ∃ f : S →ₗ[ℂ] ℂ, ∀ x : S, f x = toFun x
```
（`Basic.lean:23-25`，challenge 文件 `:21-23` 逐字相同）。三点差异：
1. 论文说"$\tau$ 在每个 abelian $C^*$-子代数上的**限制**是复线性的"；Lean 说"存在一个 `S →ₗ[ℂ] ℂ` 的线性映射与 $\tau$ 逐点相等"。等价，但后者才能直接调用 Mathlib 的 `NonUnitalStarSubalgebra` API（`Cuntz/Quasitrace.lean:191 nonunitalCommutativeValueLinearMap` 用 Unitization 把非幺情形化归为幺情形；`:176 commutativeValueLinearMap` 用 Gelfand duality）。
2. 因此**加法只能在交换的自伴对上做**：`Basic.lean:102-103` docstring 逐字 "Only commuting self-adjoint pairs are added here."；`:129-130` "Finite additivity is derived only for pairwise commuting self-adjoints."（`map_sum`）。论文 §5 的 $\sum\tau(\cdot)$ 拆分正需要这条，所以 Lean 在 `Matrix.lean:95 map_diagonal` 里逐角核对 `corner_commute`（`:75`，靠 `Matrix.single_mul_single_of_ne`）与 `corner_selfAdjoint`（`:70`）。
3. 需要 `IsClosed`——论文里 "$C^*$-子代数"自带闭包，Lean 必须显式携带。

**(e) `MainTarget` 是"存在一个类型"的编码。** `∃ (A : Type) (inst : CStarAlgebra A), letI := inst, …`（`Matrix.lean:27-34`）：把"存在一个 $C^*$-代数"写成 `Type` 的 Σ 类型 + 实例作为数据。同一手法用于 `TraceFreeStablyFinite`、`ReducedQuasitraceLoss`、`SimpleStableTensorCounterexample`（`StableFiniteness/Definitions.lean:118/152/174`），后者还额外把 Hilbert 空间也拆成 `∃ (H : Type) (instH : NormedAddCommGroup H) (innerH : InnerProductSpace ℂ H), letI := instH, letI := innerH, ∃ (completeH : CompleteSpace H), …`——四个存在量词把"一个 Hilbert 空间"的字段逐个量化。[推测] 这是为了让 challenge 文件能在不引入解法侧任何定义的情况下重述目标（challenge 与 solution 里的这些定义**逐字重复**，见 4.8）。

**(f) `StablyFinite` 的定义形式与论文不同但等价。** Lean：`∀ n : ℕ, 0 < n → ∀ v : CStarMatrix (Fin n) (Fin n) A, star v * v = 1 → v * star v = 1`（`StableFiniteness/Definitions.lean:109-112`，challenge 文件 `:158-160` 逐字同）。论文用投影语言或直接说"$M_m(A)$ 直接有限"。`0 < n` 是必需的（`n = 0` 时 `CStarMatrix (Fin 0) (Fin 0) A` 是零代数，`1 = 0`，两条关系同时成立但目标退化）——这是 Lean 侧显式、论文侧隐式的一处。

### 4.5 引理拆分与论文叙述的结构差

- **一命题→多文件**：Prop 4.1（论文 `04:8-13` 的一段陈述、`04:14-244` 的全部证明）在 Lean 里被切成 12 个文件；Theorem 5.1 的"四条性质"分别落在 `TestAlgebra.lean:115 actual_test_shift_algebra`（关系式）、`TestAlgebra.lean:150 actualAlgebra_nontrivial_separable`（非零 + 可分）、`PolynomialTest.lean`（逐尺寸排除）、`ActualAlgebra.lean:55/59`（把 24 个生成元搬进缺陷代数）。
- **一段证明→一条引理（反向合并）**：论文 Lemma 5.2 的 (a)(b)(c) 三段（telescoping、正性核对、$\frac{1-2/3}{2N}$ 计算）在 Lean 里被 `uniform_defect`（`Defect.lean:178`）一次吃掉，`uniform_defect_twentyFour`（`:204`）只负责实例化。
- **论文没写的中间步骤被 Lean 强制显式**：① `reflected_defect`（`Defect.lean:115`）把"$b$ 的角是 $1-\sum$（补的符号）"这一步单独成条——论文里是行文中的一个负号。② `defect_entries_bounds`（`:73`）单独给出条目级界。③ `scalar_unit_le_one`（`:174`）。④ `partialSum_mono/term_le_partialSum`（`:53/:58`）——论文用"部分和单调"时未列。
- **论文的顺序与 Lean 的依赖顺序不同**：论文先 §3（scaling）后 §4（bundles）再 §5（algebra）；Lean 的 import DAG 是 `Geometry/ComplexBundle` → `Geometry/BundleTests` → `Kaplansky/{TestAlgebra,PolynomialTest,ActualAlgebra}` → `Kaplansky/Main`，而 `Analysis/{Quasitrace,Cuntz}` 只在 `ActualAlgebra` 之后接入（`ActualAlgebra.lean:1-3` 的 import 是 `Cuntz.State`、`Quasitrace.Defect`、`Geometry.BundleTests.Obstruction`）。也就是说**缺陷算术与几何是同层被消费的**，二者互不依赖，与论文"先几何后代数最后拟迹"的叙述顺序一致但耦合更松。
- **一条备用桥未接入**：`Quasitrace/Compactness.lean` 造了完整的 Tychonoff 有限交机器（`TwoQuasitraceConstraint` 归纳类型：`base`/`matrix`/`normalized`/`corner` 四种约束；`quasitraceCandidateBox` 逐点闭盘乘积，radius $2\|a\|$ 与 $4\|a\|$；docstring "Compact pointwise disks. The factor four for the extension follows from its unit value two, not an additional assumption."；`normalizedTwoQuasitrace_of_finite_constraints` + `normalizedTwoQuasitrace_iff_finite_constraints`）。`grep -rn "normalizedTwoQuasitrace_of_finite_constraints" OAI` 只命中该文件自身（147/165/178）。**主链没走这条路**，因为 Cuntz 树直接构造性地给了拟迹。且其 docstring 自己声明了适用边界："This is a conditional construction; finite satisfiability is not deduced from stable finiteness."
- **编号错位需记住两处**：① `06-conclusion.tex` 无 `\section`，其 Theorem 1.1 证明在 tex 里不属于任何编号节；② `07-consequences.tex` 实际是 Section 6。Lean 用 namespace（`Kaplansky` vs `KaplanskyConsequences`）而不是编号来对位，因此**不会**继承这个坑。

### 4.6 tactic 选择暴露的卡点（含具体行）

**1）实例优先级战争（最大的一处结构性卡点）。** `attribute [local instance] CStarAlgebra.spectralOrder CStarAlgebra.spectralOrderedRing` 出现 **32 次**（几乎每个 Kaplansky/Cuntz/Quasitrace 文件一次或多次），另有 `attribute [local instance 2000] …` **6 次**（`ActualAlgebra.lean:15`、`PolynomialTest.lean:11`、`BundleTests/Complement.lean`、`BundleTests/Obstruction.lean:116`、`Infiniteness.lean:102`）。`ActualAlgebra.lean:29-39` 更是手工钉死：
```lean
local instance (priority := 3100) actualAlgebraMonoid : Monoid ActualAlgebra :=
  actualAlgebra_cstar.toMonoid
local instance (priority := 3100) actualAlgebraSemiring : Semiring ActualAlgebra :=
  actualAlgebra_cstar.toSemiring
local instance (priority := 3000) actualAlgebraSpectralOrder : PartialOrder ActualAlgebra :=
  CStarAlgebra.spectralOrder ActualAlgebra
local instance (priority := 3000) actualAlgebraSpectralLE : LE ActualAlgebra :=
  (CStarAlgebra.spectralOrder ActualAlgebra).toLE
local instance (priority := 3000) actualAlgebraSpectralOrderedRing : StarOrderedRing ActualAlgebra :=
  CStarAlgebra.spectralOrderedRing ActualAlgebra
```
外加 `instance (priority := 2400) actualDefectAlgebra_cstar : CStarAlgebra ActualDefectAlgebra := CStarMatrix.instCStarAlgebra`（`:44`）与 `local instance (priority := 3100) actualDefectMatrixSemiring (m : ℕ)`（`:49`）。
卡点内容：`CStarMatrix` 层叠后（本例是 4 层：`CStarMatrix (Fin (48m)) (Fin (48m)) ActualAlgebra`），`≤`、`0 ≤`、`1`、`Monoid`/`Semiring`/`StarOrderedRing` 都有多个候选实例（Mathlib 的 `CStarAlgebra.le` 走谱序，而 `OrderedRing` 默认可能走点式序），`selfAlgebra` 的偏序与代数结构必须**同一方向**才不报错。作者用"高优先级 local 覆写 + 2000 号全局加强"消歧。结论性判断：论文 `02:4-5` "All $C^*$-algebras in this paper are complex, and all matrix algebras carry their usual $C^*$-norms" 这一句约定，在 Lean 里对应**一整层实例管理成本**，且这是全树出现频次最高的 tactic-level 模式。

**2）非线性算术需要人工提示。** `nlinarith` 共 7 次，且关键的那次带唯一提示：
```lean
theorem approximation_margin {δ : ℝ} (hδ : 0 ≤ δ) (hsmall : δ < 1/5) :
    2*δ + δ^2 < 1/2 := by nlinarith [sq_nonneg (δ - 1/5)]
```
（`Defect.lean:30-33`）。这条引理正是论文 `05:67` 的 $\|P-W\|<1/5\Rightarrow P^*P\ge\tfrac12 I$ 的算术内核（$2\delta+\delta^2<1/2$）。`sq_nonneg (δ - 1/5)` 说明线性算术器看不出 $1/5\mapsto 1/2$ 的裕量关系——必须喂在边界处取零的平方项。同类：`Replacement.lean:22 constructor <;> nlinarith`（$133ms$ 下界，先用两条 `mul_le_mul_of_nonneg_right` 造事实）、`Replacement.lean:41 nlinarith [mul_pos hm hd]`、`PolynomialTest.lean:44 nlinarith`（配合 `field_simp` 得到 `δ*(4*(m*(m+m)+1)) = 1`）。

**3）常数计算全部外包给 `norm_num`（34 次）。** 最典型：
```lean
theorem defect_constant : ((1 : ℝ) - 2/3) / (2*24) = 1/144 := by norm_num
```
（`Defect.lean:28`）——论文 `05` 里手写的 $\frac{1-2/3}{2\cdot 24}=\frac1{144}$ 在 Lean 是一行。此外 `(by norm_num : (0 : ℝ)<1/2)` 在 `PolynomialTest.lean:65/67/79` 反复出现，说明"½ 严格正"这种对读者显然的事实需要每次显式提供。

**4）`omega`（27 次）承担全部 Nat 剪切。** `Multiplicities.lean` 是最集中的样本：整个文件就是 $a_{0,j}=64m4^{R-j}$、$a_{i,j}=960m4^{R+2i-j-2}$ 两条定义与四条算术引理，`by omega` 出现在 34/37/45/47/56 行，负责证明 $R-j=(R-(j+1))+1$、$R+2i-j-2=(R+2i-(j+1)-2)+1$、$R+j=(R+2(j+1)-(j+1)-2)+1$ 这类"下标不会剪成 0"的合法性；`testMultiplicity_pos` 用 `Nat.exists_eq_succ_of_ne_zero` + `pow_pos` + `positivity` 才得到 $4^{R-i}-1>0$（`Base.lean:17-24`）。对照：论文 `04:55-67` 写下标时读者自动假设 $j\le R$。这印证了 2.3(c) 里"$R$ 与 $j$ 的相对大小在每个 $4$ 的幂处都要重新检查"的判断。

**5）ℝ 定理↔ℕ 使用的双版本结构。** `Replacement.lean:15-47` 全部是 ℝ 版引理（`small_incidence`、`large_incidence`、`replacement_rank (d : ℝ) : d/4 + (15/4)*d = 4*d := by ring`、`prefix_dimension_margin`、`retained_trivial_rank_bound`），真正的使用版 `:53-70 fresh_incidence_dimension (m d r N s : ℕ)` 里有 `exact_mod_cast` 5 次 + `push_cast [Nat.cast_sub hsd, Nat.cast_sub htr]` + `le_of_lt (by exact_mod_cast hh)`。含义：Lean 必须在 ℕ 上重新收回"$2s\le r$"（ℝ 版只给 $2s<r$），并且减法引理 `Nat.cast_sub` 的假设要逐条传入。论文 `04:152-161` 与 `04:201-208` 的两段不等式链因此各对应两条 Lean 定理。

**6）`decide`（3 次）与 `simp`/`rw`（54/82 次）。** `decide` 用在 `Defect.lean:212 (by decide)`（$0<24$）、`SimpleRepresentation.lean:47` 与 `PolarScalar.lean:67`（`zero_pow (by decide : 2 ≠ 0)`）。频次最高的是 `rw` 与 `simp`，说明本形式化的主体工作是**定义展开与坐标核对**（丛的 trivialization、`Fin` 下标、`Sum.elim` 分支），而非深层不等式。`noncomm_ring` 21 次对应论文 "a straightforward computation" 级别的非交换条目算术；`fun_prop` 13 次全部在几何树，对应论文里每处"显然连续"。

**7）同调侧的范畴论 tactic。** `Obstruction.lean:160-183 twistedOrdinaryRelativeMap_mono` 用 `Category.assoc`、`cancel_epi`、`mono_of_mono`、`infer_instance`、`IsIso` 组合；`relativeHomologyMap_comp`/`relativeHomologyMap_congr_ambient`/`absoluteToRelative_naturality` 是自制同调 API 的名字。这说明"Chern 类非零"在 Lean 里不是算示数，而是**证明一个同态是 mono，再断言基本类非零**：
```lean
  rw [projectiveProductFundamentalClass_localizes]
  intro hz
  exact canonicalProductLocalGenerator_ne_zero (twistedProjectiveDimensions K h) hp
    ((ModuleCat.mono_iff_injective (twistedOrdinaryRelativeMap K h _)).mp
      inferInstance (hz.trans (map_zero _).symm))
```
（`Obstruction.lean:206-213`）——最后一步是"mono ⟹ 单射 ⟹ 非零"。`by_contra` + `push Not`（`:96-97`）把"每个截面有零点"从反证得到，靠 `ordinarySectionClassMap_eq_zero`（无零点截面的相对类为零）与上面的非零性相撞。

### 4.7 绕行清单（论文的写法 vs Lean 的写法）

1. **"取极小元/取子列极限" → `Classical.choice`。** 论文 `03:200-207` 用序列紧 + 唯一性得连续极小投影；Lean 在需要"选一个"的两处直接用选择：`ActualAlgebra.lean:113-115 actualCuntzDimensionState := Classical.choice actualCuntzDimensionState_nonempty`（docstring 明确 "A chosen state on actual Cuntz classes. No analytic correspondence is claimed."）与 `BundleTests/Sequence.lean:62 Classical.choice (testCoordinateStep_nonempty hm hj)`。注意后者证明的是 `Nonempty`，即**唯一性/连续性内容仍在前置引理里**，choice 只承担"实例化"。
2. **"取极限使得…" → 给证书。** 论文/标准写法用极限论证处，Lean 换成显式见证三元组：`Cuntz/State.lean:74-76`
   > "Positive order gives actual approximate conjugation. An inverse square-root of b+δ1 supplies a contraction and an error bounded by δ."
   
   `exists_positiveOrder_approx (ha : 0 ≤ a) (hab : a ≤ b)` 产出 $Q=b+\delta\cdot1$、$L=Q^{-1/2}$、$\|v\|\le1$、误差 $=\delta\,vv^*$。这比论文里"由 $a\le b$ 存在近似共轭"的引用式说法**更构造**，也更接近 `07-consequences` 需要的可核对形式。
3. **$\varepsilon$ 的"任意小" → 一个具体的 $\delta$ 公式。** 论文 §5 的逼近步骤写作"$\|P-W\|<1/5$"（先取 polar 再取 $1/5$）；Lean 在 `PolynomialTest.lean:23` 直接算出容许误差：`let δ : ℝ := 1/(4*((m : ℝ)*(m+m)+1))`，随后 `hfactor : (1/2 : ℝ) ≤ 1-(m : ℝ)*(m+m)*δ`（`:39`）。即"对任意 $m$，多项式逼近要准到什么程度"被**解出**成一个含 $m$ 的表达式，而不是留成 $\varepsilon$。这是本形式化里"把论文里的存在性语句换成显式量"的最干净例子。
4. **"对每个 $m$ 做各自的测试" → 从多项式里提取度数当 $R$。** 论文的 diagonalization（$R$ 由测试自身次数选定，见 2.4/2.7 讨论）在 Lean 里是 `matrixPolynomialDegree p`：`PolynomialTest.lean:16` 的结论里 `y : SmoothTestBase m (matrixPolynomialDegree p)` 与 `testSequenceStage m (matrixPolynomialDegree p)`，`:75` 更直白 `let R := matrixPolynomialDegree p`。流程：假设幂无限 → 取 $W$（`properIsometryColumns s t`）→ 用 `generated_matrix_polynomial_approximation`（`Polynomials.lean:117`）得到词多项式 $p$ → $p$ 自带度数 → 把该度数的丛测试用尽 → `actualMatrixImage_finrank`/`trivialMapFrame`造出一个过大的 frame → `retainedGrouped_no_independent_test_frame`（`Obstruction.lean:287`）矛盾。
5. **算子语言 $W=[s_1\ s_2]$ → 坐标化。** `Quasitrace/Infiniteness.lean:72/78-80`
   > `def properIsometryColumns` … docstring "The rectangular concatenation of a pair of orthogonal isometries has column adjoint-square identity, with exactly 2m input columns."
   
   实现用 `Matrix.fromCols`/`finSumFinEquiv`/`Fin m ⊕ Fin m`；`2m` 在类型层面就是 `m + m`（`PolynomialTest.lean:15` 的 `Fin (m+m)`）。同样地 `ActualDefectIndex := Fin 24 ⊕ Fin 24` 让"$48\times48$"永远以 $24+24$ 的形式出现（见 4.1-D）。
6. **Chern 类 → 奇异相对同调 + 基本类。** 见 4.6-7。术语表：论文 $z_i$ ↔ `twistedProjectiveDimensions K h`；$\deg=h+\sum K_i$ ↔ `twistedProjectiveDimensions_sum`（`:130-133`）；$2\deg$ 次相对类 ↔ `relativeHomologyMap … (2*(h+∑ i, K i))`；"$\prod z_i^{K_i}\ne 0$" ↔ `twistedOrdinarySection_fundamental_ne_zero`。
7. **外部长引理 → 自建库。** 论文引用的 MR Thm 2.3 / Blackadar–Handelman / Blackadar–Rødnam / Powers / Cuntz / Haagerup 全部**没有**以"引用"形式进入 Lean；对应物是 `Cuntz/`(3370 行) + `Regular/`(Powers 平均与 $\mathbb F_\infty\hookrightarrow\mathbb F_2$) + `Ultrapower/`(准值/饱和) + `Quotient/`(理想、商、迹反拉)。特别是 Haagerup 定理在本形式化里**不需要**（因为论文只用它做 $W^*$ vs $AW^*$ 的背景讨论），这解释了为什么 Lean 树里没有对应的模块。
8. **"$\ell^\infty$ 乘积 over all $(m,R,y)$" → `lp A ∞` + 依赖 sigma 指标。** `Products.lean:21 abbrev BoundedProduct := lp A ∞`；`TestAlgebra.lean:18 abbrev ActualTestIndex := Σ m : ℕ+, Σ R : ℕ+, SmoothTestBase m.val R.val`（用 `ℕ+` 保证 $m,R\ge1$，省掉论文里的 "$m,R$ 为正整数" 假设）。可分性：`Products.lean:107 countable_monoid_closure`（"Countably many letters have only countably many finite multiplicative words."）+ `:126 generatedAlgebra_separable`，对应论文里"$B$ 可分"一句但 Lean 需要额外证明词集可数。
9. **论文的"测试秩 $d_0=64m4^R$、$b_i=\tfrac{15}{4}d_{i-1}$"→ 一对递归定义的算术引理簇。** `BundleTests/Multiplicities.lean:15-20`
   ```lean
   def testMultiplicity (m R j : ℕ) (i : Fin (j+1)) : ℕ :=
     if i.val=0 then 64*m*4^(R-j) else 960*m*4^(R+2*i.val-j-2)
   def testRank (m R j : ℕ) : ℕ := 4^j*(64*m*4^R)
   ```
   `testMultiplicity_fresh (hj : j<R) : 4*testMultiplicity m R (j+1) (Fin.last (j+1)) = 15*testRank m R j`（`:41-49`）就是 $b_{j+1}=\tfrac{15}{4}d_j$ 的**整数安全**写法（避免除以 4）；`sum_testMultiplicity (hj : j≤R) : ∑ i, testMultiplicity m R j i = testRank m R j`（`:51-68`）是"$\sum$ 重数 $=$ 秩"的归纳证明，用 `Fin.sum_univ_castSucc` + `omega` 收尾；`testMultiplicity_lower_bound : 256*m ≤ testMultiplicity m R j i`（`:73-83`）正是论文 `04:87` "applied is divisible by four and satisfies $D\geq256m$" 里的 $256m$。注意 Lean 里 **960 = 15·64** 从未作为"$b_i$ 的通式"出现，它只在 `if` 的 else 分支里；$15$ 与 $4$ 被拆开用（见 `testMultiplicity_fresh` 的 $15\cdot\text{testRank}$），这解释了论文里 $960$ 这个看似神秘的常数（见五、表格第 12 行）。
10. **前缀维数 $320m^24^{2i-2}(4^{R-i+1}-1)$ → 一个 0-起标的 def + 三个界。** `BundleTests/Base.lean:14-15 def testProjectiveDimension (m R) (i : Fin R) := 320 * m^2 * 4^(2*i.val) * (4^(R-i.val)-1)`（`i.val = i-1`），配套 `testProjectiveDimension_pos`（`:17`）、上界估计 `… ≤ 320*m^2*4^(R+i.val)`（`:93-98`，论文里 "$\le 320m^2 4^{R+i}$" 级别的一步）、以及 `Base.lean:142 have hg : 3*(∑ t : Fin (R-i.val),4^t.val)=4^(R-i.val)-1`（等比和公式，论文 `04:67` 隐含未写）。`abbrev BundleTestBase (m R) := ∀ i : Fin R, projectionSpace (testProjectiveDimension m R i + 1) 1`（`:39-40`）——论文的 $Y=\prod_i\mathbb{CP}^{K_i}$ 在 Lean 里是**逐因子的 projectionSpace 依赖函数**，`+1` 是为了射影空间的齐次坐标维数（论文未区分的 $K$ 与 $K+1$ 约定在此处必须交代）。

### 4.8 permitted_axioms 与实际公理足迹

两个 json 的 `permitted_axioms` 相同：`["propext","Quot.sound","Classical.choice"]`；`enable_nanoda: false`（`ComparatorChallenges/README.md` 只给出 `lake env comparator <json>` 的跑法，无额外数值/自动化步骤；语料里没有 comparator 源码，故其匹配规则不可考 [推测]）。

实际 `#print axioms` 无法在此运行（不编译），改用 grep 定位三类使用点：
- `Classical.choice` **6 处**：`Kaplansky/ActualAlgebra.lean:114`（选 Cuntz 维数态）、`Kaplansky/Quotient/NullIdeal.lean:77`（`let i₀ : n := Classical.choice hn`，从 `Nontrivial` 取非零下标）、`StableFiniteness/{QuasitraceLoss:38,SimpleAmbient:43,TraceFree:36}`（三处都是 `let d : CuntzDimensionState ActualAlgebra := Classical.choice …`）、`BundleTests/Sequence.lean:62`（选测试坐标）。
- `choose` tactic **6 处**：`Products.lean:45`、`Quotient/Extraction.lean:249`、`Quasitrace/Extension.lean:60`、`Ultrapower/UltraSaturation.lean:69/72/76`（饱和性里逐层选见证，$\varepsilon n/2$ 减半构造）。
- `attribute [local instance] Classical.propDecidable`（`StableFiniteness/Definitions.lean` 与 challenge 文件 `:81/:177`）——经典可判定性，属 `Classical.choice` 派生。
- `Quot.sound` 隐含面：所有商型 `A ⧸ I`（`Quotient/ClosedStarQuotient.lean:34 abbrev Quotient := A ⧸ I.submodule`）、`Quotient.lift`（`Ultrapower/Quotient.lean:23 def quotQ := Quotient.lift …`）、`RingCon`（`:22`）、`Submodule.Quotient.norm_mk_le`（`:89`）。
- `propext`：所有 `simp`/`rw` 重写链的事实基础，无法逐点定位（全树 `by simp` 54 处）。

**判断**：解法树没有使用超出许可的公理，也未见 `sorry`/`admit`/`native_decide`/`axiom` 声明（`grep -rn "^axiom|sorry|admit|native_decide|#eval"` 在六个目录下只命中 Content.lean:99 的英文单词）。可形式化的"诚实性"很高；反过来说，论文里所有"我们不用选择公理也能…"式的暗示都不存在（论文 `03` 的极小化子论证实际上是**非构造**的，Lean 侧自然接受 `Classical.choice`）。

### 4.9 两个 sorry 桩的位置与含义

- `ComparatorChallenges/KaplanskyQuasitrace.lean`（55 行）：`import Mathlib.Algebra.Order.Star.Basic`、`Mathlib.Analysis.CStarAlgebra.Classes`、`Mathlib.Analysis.CStarAlgebra.CStarMatrix` 三行后，在 `namespace OAI / namespace Kaplansky` 里**自带一整套目标定义**：`structure OneQuasitrace`（15-23）、`instance CoeFun`（25）、`Normalized`（27）、`upperLeft`（31-32）、`IsTwo`（34-35）、`PositiveContraction`（37）、`MainTarget`（39-46），最后
```lean
theorem kaplansky_quasitrace_counterexample : MainTarget := by
  sorry
```
（48-49）。
- `ComparatorChallenges/KaplanskyStableFiniteness.lean`（247 行）：同样的手法，但目标定义规模大得多——`Regular/{HilbertSum,reindex,left,Algebra,generator,diagonal}`（13-88，全部是**可计算的**具体构造，逐字与解法侧 `StableFiniteness/Definitions.lean` 相同）、`OneQuasitrace`（101-111）、`ProperlyInfinite`（122-123）、`upperLeft/IsTwo`（131-135）、`structure ClosedStarIdeal`（147-150）、`StablyFinite`（158-160）、`TracialState`（162-165）、`TraceFreeStablyFinite`（167-171）、`tensorAlgebra`（182-189）、`ReducedQuasitraceLoss`（200-212）、`CStarSimple`（217-220）、`SimpleStableTensorCounterexample`（222-234）、`StableFinitenessBundle`（237-238），末尾
```lean
theorem stable_finiteness_bundle : StableFinitenessBundle := by
  sorry
```
（240-241）。它的 json 把 `solution_module` 指向 `OAI.Analysis.Kaplansky.StableFiniteness`（即 4.2 那个 25 行的聚合文件）。

**三点取证结论**：
1. **challenge 与 solution 的定义是逐字复制关系，不是 import 关系。** `grep -rn "ComparatorChallenges" --include=*.lean OAI` 零命中，`grep -n "import OAI.Analysis.Kaplansky.Main" ComparatorChallenges/*.lean` 也没有。两侧因此在**同一全名** `OAI.Kaplansky.OneQuasitrace`、`OAI.Kaplansky.MainTarget`、`OAI.KaplanskyConsequences.StableFinitenessBundle` 下各有一份声明——它们能共存是因为任何 build 都不会同时 import 两侧。[推测] comparator 的工作方式是把 challenge 文件的声明当作规格，与 `solution_module` 里同名定理的类型做可统一性检查（语料内无 comparator 源码，无法在文件层面核实）。
2. **口径必须逐字对上，这解释了 4.4 的多处"不自然"设计**：`(1 : ℝ) / 144 ≤ (τ (a+b) - τ a - τ b).re`、`(∃ x, a = star x * x) ∧ ‖a‖ ≤ 1`、`∃ σ : OneQuasitrace (CStarMatrix (Fin 2) (Fin 2) A), ∀ a, σ (upperLeft a) = τ a`、`∃ (A : Type) (inst : CStarAlgebra A), letI := inst, …`——这些写法在纯数学上不是最简的，但 challenge 与 solution 两侧**完全同形**，说明它们是被当作"公开规格"冻结的。因此：论文里更自然的表述（例如 $\tau(a+b)-\tau(a)-\tau(b)\in\mathbb R_{\ge1/144}$）**不是**形式化目标，做笔记时不能把 Lean 的 `.re` 当成论文符号缺失。
3. **"没证"的部分只有这两个桩**，且它们的陈述就是论文 Theorem 1.1 与 Corollary 1.2 的形式化目标；换言之**论文正文的全部可形式化主张都已落地**，未落地的是论文里未主张的东西（外部落文献引用、$AW^*$/Haagerup 背景、Chern 类的经典语言）。

### 4.10 论文与 Lean 的"证明重心"差异（供笔记写作时取舍）

| 论文篇幅占比（按 tex 行数粗算） | Lean 行数占比 | 观察 |
|---|---|---|
| §2 预备 60 行 | `Quasitrace/` 1093 行 | 论文半页定义 ⇒ 一千行公理核对（`Order.lean` 117 行只为"实值/界"） |
| §3 scaling 234 行 | `MatrixScaling/` 2617 行（共享库）+ `ComplexBundle/{Hom,Coordinates,Frames}` | 重心相近 |
| §4 bundles 244 行 | `Geometry/ComplexBundle/` 8916 + `Geometry/BundleTests/` 2788 = 11704 行（约 44%） | 几何是全形式化最重的一块，与论文一致 |
| §5 algebra 223 行 | 本体 15 文件 2169 行 + `Quasitrace/Defect.lean` 219 行 | 一致 |
| §6 结论 16 行 | `Main.lean` 25 行 | 一致（都是纯拼装） |
| **Theorem 2.1（论文 5 行，引用）** | **`Cuntz/` 3370 行** | **最大失衡点**：论文当外部定理引用的一句话，Lean 用 15 个文件重证 |
| Corollary 1.2（07：91 行） | `KaplanskyConsequences` 57 文件 5668 行 | 第二失衡点：推论在论文里 91 行，形式化里比主定理本体（2169 行）还大 2.6 倍 |

[推测] 这两处失衡的工程解释：论文引用的是已被接受的公共定理（MR Thm 2.3、Gow、Powers），但 Mathlib 里没有对应条目，形式化只能自建；而 comparator 规格又不允许引入新公理或外部依赖，于是"引一句话"变成"写三千行"。这对"AI 形式化成本主要来自文献缺口"这一判断是一个很强的样本。

### 4.11 需要在笔记里谨慎处理的 3 个形式化风险点

1. **`actualCuntzDimensionState` 的"无解析对应"声明**（`ActualAlgebra.lean:113` docstring "No analytic correspondence is claimed."）：Lean 选出的这个态与论文 §4 归一化极小投影给出的维数函数之间**没有**被证明相同。也就是说形式化没有验证"论文的拟迹 = Lean 的拟迹"，只验证了"存在一个满足同一公理的拟迹，并且它在这个固定对上有 $\ge1/144$ 缺陷"。因为缺陷界是**通用的**（`∀ τ`），这个缺口不影响结论。但笔记不能写"Lean 复现了论文构造的那个拟迹"。
2. **`PositiveContraction` 用了 ∃ 见证，而 `defectA/defectB` 的见证由 `defectAEntries/defectBEntries` 的 `Sum.elim` 分支给出**（`Defect.lean:65-71`）。b 分支写成 `inr := 1 - partialSum (rightSquare x)`，即补元形式；论文的 $b$ 是 $1-\sum H_i$ 型。核对论文"两个和"时，Lean 侧的符号约定是 `reflected_defect`（`:115`）这条单独引理。若笔记引用"$a+b$ 的具体形状"，应以 `defectAEntries/defectBEntries` 为准。
3. **`uniform_defect_twentyFour` 的 $N=24$ 是硬编码**（`Defect.lean:204-213`，`uniform_defect x 24 (by decide) (2/3) …`），而 `uniform_defect`（`:178`）本身对任意 $N$ 成立。因此 $1/144$ 不是"只能这样"的常数；形式化保留了泛化版本，这为"若把 24 换成 $n$、$\frac23$ 换成 $c$ 会怎样"的反事实讨论提供了可核对的接口（详见五、最后一列 sensitivity）。

---

## 五、常数与参数表

> 用法说明：每行给 **位置**（tex 行号 + 若有则 Lean 行号）、**作用**（这个数在证明里做的是什么动作）、**敏感度**（把它改大/改小会在哪一步断）。所有"改动会断"的判断都基于本材料前面（二、）已逐步重推过的不等式；凡论文没做最优性讨论的地方，我给的界限会标 **[我的推导]**，因为论文确实没说"这个数不能再好"（见 3.4 的"未述"清单）。

### 5.1 先看链条：八个常数其实是一条因果链

单看表格会把这篇论文读成"一堆魔数"。实际结构是**两条链**，每条只有一个自由度：

**链 A（分析链，决定 $c$ 与 $1/144$）**
$$\text{扩张系数 }2\ \longrightarrow\ \alpha=\tfrac32\ (\text{势函数系数},\ \text{须 }<2)\ \longrightarrow\ c=\alpha^{-1}=\tfrac23\ \longrightarrow\ \text{缺陷 } \frac{1-c}{2N}.$$
逐字证据：`03:116-118` "The expansion factor $2$ and the coefficient $3/2$ leave a strict margin that prevents this minimizer from escaping to infinity."；`03:218-220` 由 $\sum_iT_i^*Q^{-1}T_i=\frac32P^{-1}$ 定义 $X_i=\sqrt{2/3}\,Q^{-1/2}T_iP^{1/2}$；`03:228-230`
$$\textstyle\sum_iX_iX_i^*=\frac23Q^{-1/2}D(P)Q^{-1/2}=\frac23(I_F-Q^{-1})\le\frac23I_F$$
（这个 $\le\frac23$ 就是 `05:16` 的 $\sum_{i=1}^{24}x_ix_i^*\le\frac23 1$）；`06:10-13` "Apply Lemma~\ref{lem:defect} with $N=24$ and $c=2/3$ … defect at least $(1-c)/(2N)=1/144$."
链 A 上**唯一的自由选数是 $\alpha$**；$2/3$、$1/144$ 都是派生量。

**链 B（几何链，决定 $N=24$ 与一切 4 的幂）**
$$d_0=64m4^R\ \longrightarrow\ \text{每步保留 }1/4,\ \text{新增 }b_{j+1}=\tfrac{15}{4}d_j\ \longrightarrow\ d_{j+1}=4d_j\ \longrightarrow\ \text{小元情形 }q=16,\ \text{大元情形 }q=8\ \longrightarrow\ N=16+8=24.$$
逐字证据：`04:17` $d_0=64m4^R,\ d_j=4^jd_0$；`04:79` "four and a fresh block of rank $b_{j+1}=(15/4)d_j$ is added"；`04:44-46` "We reduce each old line-bundle multiplicity by a factor of four at every step, so the total trivial part stays small."；`04:152-161`（$r=D/4,t=2s,q=16$，得 $\ge 133ms$）；`04:201-209`（$r=(15/4)d,q=8$，$\frac{43}{2}sd-11s^2\ge\frac{21}{2}sd>\frac{20}{3}md$）；`04:219` "Together, the two lists give $24$ maps"。
链 B 上 **$N=24$ 是几何喂给分析的唯一数据**，它同时决定 $2N=48$（$A=M_{48}(B)$，`01:206`、`06:6`）和 $1/144$ 的分母。

两链在 $c=2/3$ 处咬合：$c$ 既要 $<1$（让缺陷为正）又要被 24 个映射同时满足（$\sum X_iX_i^*\le c$）。链 A 给 $c=\frac23$，链 B 给"$24$ 个映射能把任意 $s$ 维子空间撑到 $2s$ 维"（`04:221` $\dim\sum_{i=1}^{24}T_iS\ge2\dim S$），"撑到 2 倍"正是 $\alpha<2$ 的可行性来源。**这就是"为什么 $24$ 个而不是别的数目"与"为什么 $\frac23$"之间的真正接口**（论文未把这句话写出来，见 3.4；此为二、2.3/2.4 重建的结论）。

### 5.2 代数/分析层常数

| 常数 | 位置（tex / Lean） | 作用 | 敏感度 |
|---|---|---|---|
| $N=24$（生成元个数） | `05:12,14,16,19,45,50`；`ActualAlgebra.lean:41 (Fin 24 ⊕ Fin 24)`、`:53 (i<24)`、`:55/:60 (… ) 24`；`Defect.lean:28 (2*24)`、`:204-212` | §5 的 24 个 $x_i$；Lemma 5.2 的 $N$；$1/144$ 的分母一半 | 下界由链 B 的 $16+8$ 锁死。**[我的推导]** 若允许 $q$ 更小可降到 $N=13$ 左右（见 5.3 的 $q$ 行），缺陷反而变大（$(1-c)/(2N)$ 随 $N$ 递减），所以 24 是"够用且顺手"，不是最优 |
| $c=2/3$（row 界） | `05:16`；`03:102` ($\sum X_iX_i^*\le\frac23I_F$)；`ActualAlgebra.lean:60 ((2/3 : ℝ) : ℂ) • 1`；`Defect.lean:212` 传入 `(2/3)` | 使 $\varphi(J_N)\le c\varphi(1)$（`05:220`），从而缺陷 $\ge(1-c)\varphi(1)$ | 必须 $<1$，否则缺陷非正；$=1$ 时整篇崩塌。**[我的推导]** 可更小（见 $\alpha$ 行） |
| $\alpha=3/2$（势函数系数） | `03:112` ($g_y=\log\det(I+D_y)-\frac32\log\det P$)、`03:152` ($f(t)=2\log(1+\epsilon t)-\frac32\log t$)、`03:214/218`（Euler 式）、`03:220`（$\sqrt{2/3}$）；Lean `MatrixScaling/Determinant.lean:15 def scalingScalar (ε t) := 2*Real.log (1+ε*t) - (3/2)*Real.log t` | 同时控制 coercivity（$\alpha<2$）与 $c=\alpha^{-1}$ | **锁死方向**：$\alpha\ge2$ 时 `scalingScalar_lower_large`（`:25-27`）给出 $2\log\varepsilon+\frac12\log t\le$ scalar，其中 $\frac12=2-\frac32$ **正是裕量**）的正系数消失，`scalingScalar_sublevel`（`:40`）的双侧区间上限失去，$[a,A]$ 紧性断掉，极小元可逃向无穷。**[我的推导]** $\alpha\in(1,2)$ 都合法（$\alpha>1$ 才使 $c<1$）；$\alpha\to2^-$ 时 $c\to\frac12$、缺陷 $\to\frac{1/2}{2N}=\frac1{96}$（$N=24$），但 $1/96$ 取不到（需 $\alpha=2$，此时 coercivity 退化）。论文选 $3/2$ 未解释（3.4 已列"未述"） |
| 扩张系数 $2$（$\dim\sum T_iS\ge2\dim S$） | `04:221`；`03:143`（配对 $2s-1,2s$）；`03:141` ($\mu_{2s}\ge\epsilon\lambda_s$)；`04:239`（"$\tfrac12I_{E_{j+1}}$"，即归一化后 row 和为 $\frac12$，是 $2$ 的倒数痕迹） | 使 $\log\det(I+D)\ge2\sum_s\log(1+\epsilon\lambda_s)$（`03:145-148`），即 coercivity 左侧的 2 | 若只做 $\dim\sum T_iS\ge(1+\theta)\dim S$，则 $\alpha<1+\theta$，于是 $c>\frac{1}{1+\theta}$，缺陷 $\le\frac{\theta}{1+\theta}\cdot\frac1{2N}$：**扩张裕量直接线性地换成缺陷**。$2$ 是"翻倍"，是整篇最本质的一个数（也是 $r\ge2d$ 的来历：`03:128` "in particular $r\geq2d$"） |
| $\epsilon$（谱下界） | `03:131-136`（在紧的 Grassmann 丛上取最小值得 $\epsilon>0$，使 $\mu_{2s}(D_y(p))\ge\epsilon$）、`03:141`（$\mu_{2s}(D_y(P))\ge\epsilon\lambda_s$）；Lean `MatrixScaling/Determinant.lean:18/:25/:34/:40` 全部以 `(hε : 0 < ε)` 形式出现 | 把"扩张"从几何陈述转成解析不等式的尺度 | 只要求 $>0$；其**具体值**由 $m,R,d_0$ 与 24 个映射决定，论文未算出也无需算出。`scalingScalar_bounded_below`（`:34`）给出一致下界 $\frac32\log\varepsilon$，`scalingScalar_sublevel` 给出 $[e^{-2C/3},\,e^{2C-4\log\varepsilon}]$：**Lean 把论文"有紧的下水平集"这句话变成了显式区间**（论文 `03:152-160` 用 $b=\min f$、$C=\max g_y(I)$ 抽象描述，未写出区间） |
| $\epsilon'=1/5$（逼近容差） | `05:67`（"choose $P$ … with $\|P-W\|<1/5$"）；`01` 无；Lean `Quasitrace/Defect.lean:30-33 approximation_margin (hδ : 0 ≤ δ) (hsmall : δ < 1/5) : 2*δ + δ^2 < 1/2 := by nlinarith [sq_nonneg (δ - 1/5)]` | 由 $W^*W=I$ 传 $P^*P\ge\frac12I$（`05:70` $\le2\|P-W\|+\|P-W\|^2<\frac12$、`05:74` $P^*P\ge\frac12I_{2m}$） | **[我的推导]** 真相是 $\delta<\sqrt{3/2}-1\approx0.2247$；$1/5=0.2$ 留 $0.0247$ 裕量。若只要 $P^*P$ 可逆（不必 $\ge\frac12$），阈值放宽到 $\sqrt2-1\approx0.4142$。$1/5$ 是"一个好写的数"而非边界值；`nlinarith [sq_nonneg (δ-1/5)]` 这个提示**恰好**在边界 $1/5$ 处取零，说明 Lean 侧也把它当"贴着可用边界的好写值"用 |
| $1/2$（下界谱隙） | `05:70/:74/:111`；Lean `PolynomialTest.lean:18 ((1/2 : ℝ)*‖v‖ ≤ …)`、`:65/:67/:79 (by norm_num : (0 : ℝ)<1/2)` | 使 $P$ 有连续极分解、像子丛连续（`02:51-58` 的观察）；在 Lean 里还是"注入性裕量" `norm_lower_bound_injective _ (by norm_num : (0:ℝ)<1/2)` | 只要 $>0$ 即可；$1/2$ 的选取纯粹是为与 $\|W\|=1$ 配成"半收缩"。**注意**：`05:74` 的 $I_{2m}$ 里的 $2m$ 是"2 倍列数"，与 `Infiniteness.lean:78-80` docstring "with exactly 2m input columns" 逐字对应 |
| $1/144$（缺陷常数） | `01:86`（主定理）、`06:13`（$(1-c)/(2N)=1/144$）；`Defect.lean:28 defect_constant : ((1 : ℝ) - 2/3) / (2*24) = 1/144 := by norm_num`、challenge `:46`、solution `Matrix.lean:34` | 定理的全部内容所在：把"非交换性"量化成一个**不依赖于 $\tau$** 的正数 | 完全派生：$=\frac{1-c}{2N}$。三处（论文 / challenge / solution）**逐字同形且都写成 $(1:\mathbb R)/144$**，所以它已经是"公开规格"（见 4.9），改动等于换定理 |
| $\varphi(1)=\frac1{2N}$（角的归一化） | `05:187`；Lean `Quasitrace/Extension.lean:134 extension_value_two`（$\sigma 1=2$）+ `:84 corner_normalization` | 让 $2N\times2N$ 单位阵的对角 $2N$ 个角各分得 $\frac1{2N}$ | $\frac{1}{2N}$ 与 $2N$ 同步；这是 $1/144$ 分母里那个 $2$ 的出处（论文 `02:17-19` 的 "value two" 在 Lean 里被 `extension_not_normalized`（`:146`）额外确认为"$\sigma$ 必不可正规化"） |
| $48$（放大次数） | `01:206`（$A=M_{48}(B)$）、`06:6-7`（$M_k(A)\cong M_{48k}(B)$）；Lean `ActualAlgebra.lean:27 (Fin (48*m))`、`:41 (Fin 24 ⊕ Fin 24)` | 让 Lemma 5.2 的 $M_{2N}(B)$ 成为定理代数本身（`05:140` $a,b\in M_{2N}(B)$） | **不是自由参数**：$48=2N=2\cdot24$，是链 B→链 A 的必然结果。Lean 用 `Fin 24 ⊕ Fin 24` 而非 `Fin 48` 表示，因此 $48$ 在代码里从不以字面量出现，只在 `actualDefectAmplificationEquiv` 的 `finCongr (by simp [ActualDefectIndex,Nat.mul_comm])`（`:90`）里以算术恒等式出现 |
| $4$（$\ell^\infty$ 指标里的"尺寸自选"） | 无（论文用语言描述 degree-selects-its-own-test）；Lean `PolynomialTest.lean:23 let δ := 1/(4*((m : ℝ)*(m+m)+1))` | 把多项式逼近误差压到使 $1-(m(m+m))\delta\ge\frac12$ 成立 | **[我的推导]** 这里的 $4$ 与 $\frac12$ 是配对设计（$4=2\cdot2$：一个 $2$ 给 $\frac12$ 目标，一个给 $m(m+m)$ 的条目数余量），属于"解出来的容差"而非选取（见 4.7-3） |

### 5.3 几何/丛层常数

| 常数 | 位置（tex / Lean） | 作用 | 敏感度 |
|---|---|---|---|
| $m$（每个 $E_j$ 的张数副本数） | `04:17`（$d_0=64m4^R$）、`04:93`（$G=(\bigoplus_jE_j)^{\oplus m}$）；Lean `BundleTests/Multiplicities.lean:15 (m R j)`、`Base.lean:14`、`TestAlgebra.lean:18 (Σ m : ℕ+, …)` | 控制要同时测试多少组 $m$ 维子空间；量化"$M_m$ 不幂无限" | 全称量化参数（$\forall m\ge1$），不可"选"。Lean 用 `ℕ+` 把 $m\ge1$ 编进类型（`TestAlgebra.lean:18`），省掉论文的"for every $m\ge1$" |
| $R$（塔深） | `04:17`、`04:21`（$j\ge0$）、`04:56-61`；Lean `Multiplicities.lean:24/:29/:41` 全部要求 `(hj : j<R)` | 有限拓扑测试的层数；"degree-selects-its-own-test" 里被测试自身次数选定 | 同样全称量化。$R$ 越大 $d_0$ 越大（$4^R$），从而所有 4 的幂出现；$R=0$ 时链 B 退化（没有新块，$b_i$ 无定义），所以必须 $R\ge1$（`TestAlgebra.lean:18` 的 `ℕ+`、`PolynomialTest.lean:89 matrixPolynomialDegree_pos p`） |
| $d_0=64m4^R$，$d_j=4^jd_0$ | `04:17`、`04:59`（$a_{0,j}=d_04^{-j}=64m4^{R-j}$）；Lean `Multiplicities.lean:18/:20 testRank m R j = 4^j*(64*m*4^R) = 64*m*4^(R+j)` | 测试秩（每个 $E_j$ 的纤维维数） | 那个 **64** 的机械作用（**[我的推导]**，二、2.3(c) 已推）：小元情形要用 $D\ge64m$ 换 $\frac52D-27s\ge133m$（见下一行）；同时 $D$ 必须先被 4 整除（`04:87` "divisible by four"），所以真正的输入界是 $D\ge256m$，除以 4 后得 $D/4\ge64m$。故 $64=256/4$，**是"能被 4 除完还剩 64 倍 m"的记号**，不是独立选取 |
| $256m$、$64m$、$D/4$ | `04:87`（$D\ge256m$）、`04:148-149`（"the corresponding replacement block is $L_i^{\oplus(D/4)}$"）、`04:152`（"Since $D\geq64m$"）；Lean `Multiplicities.lean:73-74 testMultiplicity_lower_bound : 256*m ≤ testMultiplicity m R j i`、`Replacement.lean:15-16 small_incidence … (hD : 64*m ≤ D)`、`:24-26 small_rank_endpoint : 2*s < D/4 ∧ D/8 ≤ D/4-2*s` | 保证 $D/4-2s$（可用于替换的秩余量）为正，且 $D/8$ 有半块余量 | $256=4\cdot64$ 的关系在 Lean 里由 `testMultiplicity_lower_bound` 显式给出（先证 $64m\le$（下一级重数）再乘 4、用 `omega` 收回，`:75-83`） |
| $16$（小元情形映射数 $q=16$） | `04:150`（"We seek $16$ scalar matrices"）、`04:156`（"with $q=16$"）、`04:167/:170/:177/:185`；Lean `MatrixScaling/Expansion.lean:109` docstring "Expansion restricted to the dimensions used by the **sixteen** small-subspace maps."（`ExpandingThrough` 定义在 `:110-112`，量化条件正是 `finrank S ≤ m → 2*finrank S ≤ finrank (⨆ i, S.map (T i))`，与论文 `04:163-165`/`04:221` 的 $\dim\sum T_iS\ge2\dim S$ 同形）、`Replacement.lean:17 ((16*s-2*s)*(D/4-2*s)-s*(D-s))` | 处理 $\dim S=s\le m$ 的"小"子空间（点态、块对角） | **[我的推导]** $q$ 只需满足 $(q-2)(D/4)-D-(2q-5)s>0$；代 $D\ge64m,\ s\le m$ 得下界 $(14q-91)m$，$q=16$ 时正好 $=133m$（与 `04:161` 的 $133ms$ 逐字吻合，**这说明 $133=14\cdot16-91$**）。于是 $q\ge7$ 即可为正，$q=16$ 有极大裕量。论文未讨论最优性（3.4"未述"） |
| $133ms$ | `04:161`（"$\geq133ms>0$"）；Lean `Replacement.lean:18 133*m*s ≤ (16*s-2*s)*(D/4-2*s)-s*(D-s)`（同一行还要求 $>0$，两条结论用 `constructor <;> nlinarith` 一次拿下，`:22`） | 小元 incidence 的**量化裕量**（余维数下界） | 派生量：$133=(5/2)\cdot64-27$（$5/2$ 来自 $14/4-1$，$27=2\cdot14-1$ 来自 $s$ 的系数）。它同时被用来卡 $\eta_j$ 的上界（见 $20/3$ 行），所以"133 这个数"在论文里出现两次作用：证正 + 给余维 |
| $8$（大元情形 $q=8$） | `04:201`（"take $q=8$"）、`04:206`；Lean `Replacement.lean:30 ((8*s-2*s)*(15*d/4-2*s)-s*(d-s))` | 处理 $m<s\le d$ 的"大"子空间（在 $Y_{j+1}$ 上整体做） | **[我的推导]** 系数化为 $(q-2)\cdot\frac74$（$q=8$ 时 $=10.5=\frac{21}{2}$，与 `04:208` 吻合）；要 $>\frac{20}{3}$ 只需 $q-2>\frac{80}{21}\approx3.81$，即 $q\ge6$。$q=8$ 留裕量 $\frac{21}{2}-\frac{20}{3}=\frac{23}{6}$ |
| $24=16+8$ | `04:219/:221`；`04:7/:21/:25/:27`（"fixed at $24$"）、`04:236`（$X_i^{(j)}=0,\ 3\le i\le24$）；`ActualAlgebra.lean:41` | 两批映射合并成固定的 24 个，才能同时得到 column 恒等与 row 界 | 关键耦合点：**必须是同一个 24 贯穿 §4→§5→Lemma 5.2**。`04:7` 特意写 "fixed at $24$"（见 3.3 的引用块），说明作者意识到"数目统一"是设计约束。`04:236` 的 $3\le i\le24$ 表示归一化后只有前两个映射非零（frame 粘合的产物），这是"24 个"与"$\le\frac23$"能同时成立的机制 |
| $15/4$（新块秩 $b_{j+1}=(15/4)d_j$） | `04:79`、`04:201`（$r=(15/4)d$）；Lean `Multiplicities.lean:41-42 testMultiplicity_fresh : 4*testMultiplicity m R (j+1) (Fin.last (j+1)) = 15*testRank m R j`（**整数安全写法：乘 4 而非除 4**）、`Replacement.lean:37 replacement_rank (d : ℝ) : d/4 + (15/4)*d = 4*d := by ring` | 让 $E_{j+1}$ 拆成"保留 $d_j/4$ + 新增 $b_{j+1}=\frac{15}{4}d_j$"，和恰为 $d_{j+1}=4d_j$ | 由恒等式 $\frac14+\frac{15}{4}=4$ **锁死**（`replacement_rank` 把它单列为一条 `ring` 引理，说明这一步在 Lean 里必须显式核对）。另需 $\frac{15}{4}>2$ 才满足 $r\ge2d$（`03:128`）：$\frac{15}{4}=3.75>2$ ✓ 裕量 $1.75$。若把保留系数从 $\frac14$ 改为 $\rho$，则新块为 $(4-\rho)d$，一切照旧；真正被"4"（每级总增长）与"$\frac14$（保留比例）"两个选取共同决定 |
| $4^j$、$4^{R-j}$、$4^{R+2i-j-2}$（重数公式） | `04:59/:61`；Lean `Multiplicities.lean:16 if i.val=0 then 64*m*4^(R-j) else 960*m*4^(R+2*i.val-j-2)` | 重数 $a_{i,j}$ 的双指标闭式，使 $\sum_i a_{i,j}=d_j$（`sum_testMultiplicity`） | 全部依赖 Nat 剪切合法性：`Multiplicities.lean:34/:37/:45/:47` 四处 `by omega` 逐条检查 $R-j=(R-(j+1))+1$ 等。**敏感度**：只要 $j\le R$ 假设一松，`4^(R-j)` 变成 `4^0`，$\sum$ 恒等式即失效（`sum_testMultiplicity` 的 `(hj : j≤R)` 是硬假设，`:51`） |
| $960=15\cdot64$ | `04:61`；Lean `Multiplicities.lean:16`（else 分支） | $i\ge1$ 时"第 $i$ 个线丛在第 $j$ 级的重数"，即 $\frac{15}{4}$ 增长在"必须是 4 的倍数"约定下的展开 | 派生：$960=4\cdot240=4\cdot15\cdot16$。Lean 从不做除法，改用 `testMultiplicity_divisible (hj : j<R) : 4 ∣ testMultiplicity m R j i`（`:70-71`）与 `testMultiplicity_quarter : 4*mult(j+1)=mult(j)`（`:29-39`）两条来表达"每级除以 4" |
| $320m^24^{2i-2}(4^{R-i+1}-1)=\eta_{i-1}$（前缀底空间复维数） | `04:67`；Lean `Base.lean:14-15 def testProjectiveDimension (m R) (i : Fin R) := 320 * m^2 * 4^(2*i.val) * (4^(R-i.val)-1)`（**0-起标**：`i.val=i-1`，故 $4^{2i-2}\to4^{2i.val}$、$4^{R-i+1}\to4^{R-i.val}$） | 射影因子 $\mathbb{CP}^{K_i}$ 的维数预算，即"前面各级已经占掉多少余维" | **[我的推导]** $320=960/3$：等比级数 $\sum_{t<n}4^t=\frac{4^n-1}{3}$ 把 960 除以 3，Lean 里这条求和就是 `Base.lean:142 hg : 3*(∑ t : Fin (R-i.val),4^t.val)=4^(R-i.val)-1`。上界化简为 $\le320m^24^{R+i.val}$（`Base.lean:93-98`） |
| $20/3$（余维预算 $\eta_j<\frac{20}{3}md_j$） | `04:138`（`<\frac{20}{3}md_j`）、`04:136`（$\le\frac43m\sum_{i\le j+1}b_i$）、`04:137`（$=\frac53md_0(4^{j+1}-1)$）；Lean `Replacement.lean:29 (hη : η < (20/3)*m*d)`、`:39-41 prefix_dimension_margin : (5/3)*m*d₀*(4*q-1) < (20/3)*m*(d₀*q)`、`:53-55 fresh_incidence_dimension … (hN : 3*N<40*m*d)`（ℕ 版：把 $\frac{20}{3}$ 清分母成 $3N<40md$） | incidence 计数可用的总余维；$\frac{21}{2}sd>\frac{20}{3}md$ 是该链的收口 | $5/3$ 与 $20/3$ 是**同一常数的两个视角**（$\frac53 m d_0(4^{j+1}-1)$ 与 $\frac{20}{3}md_j$，因 $d_j=4^jd_0$ 而差 4 倍）。$20/3$ 的敏感度是"必须 $<21/2$"，即必须 $<\frac{21}{2}$；把保留系数 $\frac14$ 改大会同时推高 $20/3$ 并压低 $21/2$，两侧挤压后区间消失。**[我的推导]** 裕量 $\frac{23}{6}$ 是全部几何不等式里最紧的一处（除 $1/5$ 那处 0.0247 之外） |
| $h_0=\frac43md_0(1-4^{-(R+1)})$、$<2md_0$ | `04:94/:100`；Lean `Replacement.lean:43-47 retained_trivial_rank_bound (m d₀ e) (he : 0 ≤ e) : (4/3)*m*d₀*(1-e) < 2*m*d₀`（把 $4^{-(R+1)}$ **抽象成任意非负参数 $e$**） | $G$ 里"平凡方向"的总量；Chern 障碍要排除的秩 $>h_0$ | $\frac43=\sum_{j\ge0}4^{-j}$（等比和），**锁死**于"每级除 4"。被比较的 $2md_0$ 来自 Prop 4.1 的结论目标 `04:34` "contains no trivial subbundle of rank $2md_0$"：需要 $2md_0>h_0$，即 $2>\frac43(1-4^{-(R+1)})$。Lean 把 $e\ge0$ 一般化后，该不等式对任何 $e\ge0$ 都真（`nlinarith` 一行），说明**这里的裕量 $\frac23 md_0$ 大到指数项完全无关紧要**——$4^{-(R+1)}$ 只是为了闭式而已。**[我的推导]** 因此测试秩系数只要 $>\frac43$ 就行；取 $2$ 是为了与链 A 的"翻倍"共用同一个 2 |
| $K_i$（射影因子尺寸） | `04:64-69`（eq:test-base：$K_i=m\sum_{j=i}^Ra_{i,j}=320m^24^{2i-2}(4^{R-i+1}-1)$、$Y=\prod_{i=1}^R\mathbb{CP}^{K_i}$），设计语在 `04:46-48`（"Each new projective-space factor is then sized to retain the Chern class contributed by every later occurrence of its line bundle"）、`04:90-91`（"The choice of $K_i$ records exactly the total multiplicity of $L_i$ in the bundle to be tested"）；Lean `Base.lean:39-40 abbrev BundleTestBase (m R) := ∀ i : Fin R, projectionSpace (testProjectiveDimension m R i + 1) 1` | 决定 $Y=\prod\mathbb{CP}^{K_i}$，从而决定同调次数 $2(h+\sum K_i)$ | 论文**从未算出** $K_i$ 的数值（只证正），Lean 同样只把 $K:\iota\to\mathbb N$ 当参数（`BundleTests/*.lean` 全体以 `{K : ι → ℕ}` 变量化）。`+1` 是齐次坐标约定（`projectionSpace (n+1) 1` 需要 $\mathbb C^{n+1}$），论文写 $\mathbb{CP}^{K_i}$ 时把这一步吞掉了 |
| $2(h+\sum_iK_i)$（同调次数） | `04:102-112`（$H^*(Y)\cong\mathbb Z[z_i]/(z_i^{K_i+1})$，$\deg z_i=2$，$c_p(G)=\prod z_i^{K_i}\ne0$）；Lean `Obstruction.lean:130-133 twistedProjectiveDimensions_sum : ∑ i, twistedProjectiveDimensions K h i = h+∑ i, K i`、`:161/:170` 的 `(2*(h+∑ i, K i))` | 顶类次数 = 底空间实维数 | 因子 2 是"复维数→实维数"，论文用 $\deg z_i=2$ 一句话，Lean 必须把 `2*` 写进每个同调次数 |
| $1/2$（frame 归一化 row 和） | `04:239`（"their row sum is $\tfrac12I_{E_{j+1}}$"） | 归一化后前两个映射的 row 和给 $\frac12$，与 $\sum X_iX_i^*\le\frac23$ 相容 | **[我的推导]** $\frac12$ 是"$24$ 个映射里只有 2 个非零"（`04:236`）与"$\sum X_i^*X_i=I$"的算术后果；$\frac12<\frac23$ ✓ 裕量 $\frac16$。这也是为什么"翻倍扩张"与"$c=\frac23$"能共存的最小性检查点 |

### 5.4 参数（不是常数，但承担同样的"选取"角色）

| 参数 | 位置 | 作用 | 说明 |
|---|---|---|---|
| $y\in Y$（底点） | `03:112`（$g_y$）、`04:127-128`（$Y_{j+1}=\prod_{i\le j+1}\mathbb{CP}^{K_i}$）、`05:29`（$S_i^{m,R}(y)$）；Lean `TestAlgebra.lean:18`（把 $y$ 放进指标 `ActualTestIndex`）、`Base.lean:39` | 势函数逐纤维定义；测试按底点索引 | 唯一性使逐纤维选择自动粘合（`03:205-207`），这是"不用选择公理也能连续"的设计核心；Lean 侧仍用 `Classical.choice` 实例化坐标（`Sequence.lean:62`），但唯一性引理在 `MatrixScaling/Minimizer.lean:84 scaling_minimizer_unique` / `:110 existsUnique_scaling_minimizer` 里都**独立证明了**（见 4.11-1） |
| $s$（被测试子空间维数） | `04:152`（"For $1\leq s\leq m$, set $r=D/4$ and $t=2s$"）、`04:163`（"simultaneously for $s=1,\ldots,m$"）、`04:201`（"For every integer $m<s\leq d$, take $q=8$ and $t=2s$"）、`04:213-214`（"applied to the finite list $s=m+1,\ldots,d$"）；Lean `Replacement.lean:15-16 small_incidence … (hsm : s ≤ m)`、`:28-30 large_incidence … (hms : m < s) (hsd : s ≤ d)` | 小/大情形的分界**就是 $s$ 与 $m$ 的比较** | 分界点 $s=m$ 在两处假设里各出现一次（`s ≤ m` / `m < s`），是完备分割；Lean 用两条不同定理（`small_incidence`/`large_incidence`）分别覆盖，与论文 `04:147-197`（"Sixteen maps for small subspaces"）与 `04:199-217`（"Eight maps for large subspaces"）两段一一对应 |
| $t=2s$（目标 collective image 的维数） | `04:152`、`04:201`；Lean `Replacement.lean:17/:30` 里表现为 `(16*s-2*s)` 与 `(8*s-2*s)` | Lemma 3.1 incidence 式 $(qs-t)(r-t)-s(d-s)$ 的 $t$ | $t=2s$ 是"扩张到 2 倍"的直接代入：$q s-t=(q-2)s$。**$q=2$ 会让整个式子为 0**，所以 $q>2$ 是绝对下限（**[我的推导]** 这也是"必须多于 2 个映射"的最硬理由） |
| $r$（目标丛秩） | `04:152`（$r=D/4$）、`04:201`（$r=(15/4)d$）；Lean `Replacement.lean:54 (hr : 4*r=15*d)` | incidence 式的第二个参数 | Lean 用 **整数等式 `4*r=15*d`** 表达 $r=\frac{15}{4}d$，再用 `exact_mod_cast` 回 ℝ（`:56-57`）；$2s\le r$ 的 ℕ 版收回在 `:64-66`（`le_of_lt (by exact_mod_cast hh)`）——见 4.6-5 |
| $p$（Chern 类次数 $\sum_{i=1}^R K_i$） | `04:94`、`04:110`（$c_p(G)$） | "保留足够 Chern 类"的度量 | 关键不等式是**余维数**式的：若平凡子丛秩 $k>h_0$，其正交补秩 $h_0+p-k<p$，于是 $c_p$ 必须为 0，与 $c_p(G)\ne0$ 矛盾（`04:115-121`）。因此 $p$ 与 $h_0$ 是**同一个预算的两半**（**[我的推导]** $p$ 越大越容易排除大平凡子丛，但 $p$ 由重数决定，不能独立放大） |
| $\varepsilon$（外部逼近，非 $\epsilon$） | `05:66`（"$* $-polynomial entries" 的密度逼近）；Lean `PolynomialTest.lean:23`（解出的具体 $\delta$） | 把"$P$ 逼近 $W$"落地 | 论文留符号，Lean 给公式（见 4.7-3）。另注：论文 §5 里 polar factorization $Q=P_0(P_0^*P_0)^{-1/2}$ 的 $P_0$ 与 §3 的 $Q=I_F+D(P)$ 用了同一字母 $Q$，两处不同对象，读 tex 时容易混（Lean 里分别叫 `spectralCandidate`/`unitization` 类名字，不会混） |

### 5.5 敏感度总结：三种"被写下"的身份

把上面的行按"为什么是这个数"分三类，笔记里最值得展开的是第三类：

1. **派生量（不能自由改动）**：$\frac23$（$=\alpha^{-1}$）、$\frac1{144}$（$=\frac{1-c}{2N}$）、$48$（$=2N$）、$\frac{15}{4}$（$=4-\frac14$）、$960$（$=15\cdot64$）、$320$（$=960/3$）、$133$（$=14\cdot16-91$）、$\frac{21}{2}$（$=(8-2)\cdot\frac74$）、$\frac{43}{2}$（$=\frac{45}{2}-1$）、$\frac43$（$=\sum4^{-j}$）、$256$（$=4\cdot64$）、$h_0$ 与 $\eta_j$ 的一切 4 的幂。**这类常数一个都不能"调"**，只能调它们各自的母参数。
2. **被类型/编码逼出来的记号**：`Fin 24 ⊕ Fin 24` 里的 $\oplus$、`projectionSpace (K+1) 1` 里的 $+1$、`ℕ+`、`2*(h+∑K)` 里的 2、`4*r=15*d` 里的 4（Lean 不开除法）、`Fin (m+m)` 而不是 `Fin (2*m)`。这些**没有数学内容**，但会占用阅读预算，笔记里应当明确区分"编码噪声"与"定理内容"。
3. **真正有裕量的自由选数只有三个**（**[我的推导]**，因为论文未讨论最优性）：
   - $\alpha=3/2\in(1,2)$：越接近 2，$c$ 越接近 $\frac12$，缺陷越大；上确界 $\frac1{96}$ 取不到。
   - $q_{\text{small}}=16$、$q_{\text{large}}=8$：算术下界分别约 $7$ 与 $6$；两者相加的最小可行 $N$ 约 $13$，会把缺陷从 $\frac1{144}$ 提到约 $\frac1{78}$。但 $N$ 一变，$2N$（放大尺寸）、$\frac1{2N}$（$\varphi$ 归一化）、$d_0=64m4^R$ 里的 $m$ 依赖全部要重排，**所以"改 $q$"实际上是改整篇 §4 的装配**。
   - 逼近容差 $1/5<\sqrt{3/2}-1$：换成 $\sqrt{3/2}-1$ 只影响书写，不影响结论。
   
   这三处合起来给出一个结论性判断：**本文的常数体系是"一个自由参数 $\alpha$ + 两个装配参数 $q$ + 一个好写的容差"，其余全部锁死。**论文之所以把 $1/144$ 写得像"魔法数"，是因为链 A/链 B 的推导都在正文里，而"为什么选 $\frac32$、为什么 $q=16+8$"这两步作者没写（3.4"未述"清单第 3、4 条）。

---


---


---


---



---

