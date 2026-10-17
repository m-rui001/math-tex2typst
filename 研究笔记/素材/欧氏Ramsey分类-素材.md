# 欧氏 Ramsey 配置分类 — 研究素材（第一人称反推思维链用）

> 论文：*A classification of finite Euclidean Ramsey configurations*，作者 OpenAI，日期 2026-09-23。
> 素材来源：TeX 源码 `E:\math\preprints\A-classification-of-finite-Euclidean-Ramsey-configurations-September-23-2026\build\main.tex` 及 `sections\01–07`（全部照抄/引用自源码），Lean 形式化 `E:\math\lean\OAI\Combinatorics\EuclideanRamsey\`（由 `E:\math\lean\formalization.yaml` 第 1150–1152 行指定：comparator_config `ComparatorChallenges/EuclideanRamsey.json`，declaration `OAI.EuclideanRamsey.classification`，file `OAI/Combinatorics/EuclideanRamsey/Main.lean`）。
> 本文之外的一切推断一律标 [推测] 或注明外部来源。

---

## 一、定理总览

### 1.1 Ramsey 性质的精确定义（§1 开头，TeX 原文照抄）

> "A finite nonempty set $A$ in a Euclidean space is \emph{Ramsey} if, for
> every integer $r\ge2$, there is an integer $D\ge1$ such that every map
> $c:\R^D\to\{1,\ldots,r\}$ is constant on a congruent copy of $A$.
> Congruence means preservation of every pairwise distance, at the original
> scale. The coloring is an arbitrary function. In particular, no
> measurability or other regularity is assumed."

要点拆解（反推时注意每个量词的位置）：

- 对象：**有限非空**集合 $A\subset\R^d$（某维）。
- 量词链：$\forall r\ge2\ \exists D\ge1\ \forall c:\R^D\to\{1,\dots,r\}\ \exists$ 与 $A$ 全等（congruent，**原尺度**，不缩放）的拷贝，$c$ 在其上取常值。
- 全等 = 保持所有两两距离，即存在 $t\in\R^D$ 与等距 $Q$ 使 $b_i=t+Qa_i$。
- 染色是**任意函数**——无连续性、无可测性假设。这是全文反复强调的点：任何靠"逼近/连续性"吸收误差的论证路线都天然不可用，必须用**精确**代数恒等式。
- 注意"原尺度"：这是与 Richardson-type / Gallai 型结果（允许缩放）的本质区别。缩放版本容易得多（Gallai 定理），原尺度版本才是欧氏 Ramsey 理论的核心困难。

### 1.2 坐标数据（§1.1，TeX 原文照抄）

> "For any other set, let $d\ge1$ be its affine dimension, and choose a congruent representative
> $A=\{a_1,\ldots,a_s\}\subset\R^d$ whose affine span is $\R^d$.
> The points are distinct and $s\ge2$. Define
> \[
>  p_i=\begin{pmatrix}1\\a_i\end{pmatrix},\qquad
>  F=\Q\bigl((a_i)_\alpha:1\le i\le s,\ 1\le\alpha\le d\bigr),
>  \qquad B=F\otimes_{\Q}F.
> \]
> The commutative ring $B$ has a multiplication homomorphism
> \[
>  m_F:B\longrightarrow F,\qquad m_F(x\otimes y)=xy.
> \]
> An equality in $B$ is stronger than the equality obtained by applying
> $m_F$; this map need not be injective."

关键概念清单（后面所有证明都围绕它们）：

- $p_i\in\F^{d+1}$：齐次化（增广）点，第 0 分量是常数坐标 1。
- $F$：**坐标域**——所有点所有坐标在 $\Q$ 上生成的子域。它是有理不变量的家。
- $B=F\otimes_\Q F$：**张量环**。一个元素是"系数在 $F$ 的 $F$-系数线性式的形式组合"的抽象化：$x\otimes y$ 记忆"左边来自第一份 $F$、右边来自第二份"，而 $m_F$ 把两份相乘。$m_F$ 一般有非平凡核（当 $F/\Q$ 不是正则扩张时，例如 $F=\Q(t)$ 时 $t\otimes t-t\otimes t$ 型关系……准确说核由 $a\otimes1-1\otimes a$ 型元素生成）。"在 $B$ 中相等"严格强于"乘后相等"——这句是全文判断点。
- 指标约定：$p_i$ 的分量、矩阵的行列都从 $0$ 编号到 $d$；指标 $0$ 是常数坐标。

### 1.3 主定理（Theorem 1.1 [Classification]，TeX 原文逐字照抄）

> "\begin{theorem}[Classification]\label{thm:classification}
> Let $A=\{a_1,\ldots,a_s\}\subset\R^d$ be a finite set of at least two
> points with affine span $\R^d$, and define $p_i,F,B,m_F$ as above.
> Then $A$ is Ramsey if and only if there is a matrix
> $P\in\operatorname{Mat}_{d+1}(B)$ such that
> \begin{align}
>  (p_i\otimes1)^T P(1\otimes p_i)&=0
>        &&(1\le i\le s),\label{eq:field-evaluations}\\
>  m_F(P_{\alpha\beta})&=\delta_{\alpha\beta}
>        &&(1\le\alpha,\beta\le d).\label{eq:field-spatial}
> \end{align}
> Here the entries of $p_i\otimes1$ and $1\otimes p_i$ are formed
> componentwise. There are no separate conditions on the multiplied
> constant row or constant column of $P$.
> \end{theorem}"

语义拆解（每个条件的机械性理由在第二节逐条展开）：

- 条件 (1.1)（field-evaluations）：$B$-值二次型 $(p_i\otimes1)^TP(1\otimes p_i)$ 在张量环里**恰好为零**（不是乘后为零）。这是"增强版球面方程"：乘开它得到 $\|a_i\|^2+\ell\cdot a_i+c=0$（见 §7 Corollary 1.2/spherical），但原式要求在 $m_F$ 之前成立。
- 条件 (1.2)（field-spatial）：$P$ 的"空间块"（行列指标 $1..d$）乘后恰为单位阵 $I_d$。常数行/常数列**不**单独约束（定理原文明确说 "There are no separate conditions on the multiplied constant row or constant column of $P$"）。
- 单点集单独处理（$s\ge2$ 是定理前提）：单点是 Ramsey 的（平凡：一个点在任何 $D$ 中都能找到同色点当 $r<\infty$……准确说 $D=1$、鸽笼原理）。
- 条件对全等代表选取无关（论文 §1.1 末句 + §2 Remark `alg:congruence` 给出直接张量证明）。
- 论文强调："It uses exact relations in the coordinate field. It is not a procedure for recovering those relations from numerical approximations"——判据是**精确代数**的，不可数值化。

### 1.4 "分类"的确切含义

- 主定理给出有限欧氏点集 Ramsey 性的一个**充要条件**，且该条件是坐标域上的**线性代数**条件（在 Noetherian 环 $B$ 上解一个线性方程组 + 一个乘后恒等条件），因此是可判定的（对坐标能有限描述的集合）[推测：论文未直接声称可判定性，但 Remark `alg:noetherian` 说 kernel 有有限 $B$-生成元，暗示该条件在原则上是有限可验证的——当坐标域由有限有理数据给出时]。
- 它同时给出：
  - **充分方向（新构造）**：张量条件 $\Rightarrow$ Ramsey。这是本文的主要新内容——通过"精确坐标置换双尺度拷贝 + 路径端点判据 + 超滤子实现 + Hales–Jewett"三阶段。
  - **必要方向（旧思想的张量化）**：非 Ramsey $\Rightarrow$ 存在固定有限染色避开 $A$ 于一切维度（Proposition `alg:necessity`），把 Erdős–Graham–Montgomery–Rothschild–Spencer–Straus 的实变量染色引理改为有理张量分离。
- 由此得到的**分类推论**：
  - Corollary `cons:spherical`：每个有限 Ramsey 集是球面的（spherical）——重推 EGM-RSS Theorem 13，但作为判据的瞬时推论。
  - Corollary `cons:transitive`：每个有限传递欧氏集的非空子集（即每个 **subtransitive** 集）是 Ramsey——重推 Leader–Russell–Walters 的"充分方向"。
  - Corollary `cons:quadrilateral`：圆上至多五个不同点的非空集（特别地每个圆内接四边形）是 Ramsey。
  - Corollary `cons:kites`：对每个 $(-1,1)$ 中超越数 $a$，风筝四边形 $K_a$ Ramsey 且**非** subtransitive——**否定** Leader–Russell–Walters 特征猜想的必要性方向（及其 Conjecture 3"这些风筝不 Ramsey"）。
  - Proposition `cons:nine`：9 个代数独立参数的圆上点不 Ramsey（与 Pálvölgyi 泛型七点主张一致，但直接从判据推出）。
  - Proposition `cons:twelve`：三个旋转坐标方块的 12 点配置不 Ramsey（Liouville 常数参数 + 导子障碍）。

### 1.5 与已知 Ramsey 结果的关系（§1 引言脉络）

论文引言列出的已知正面结果（均为文献结果，非本文新证）：

1. EGM-RSS（Erdős, Graham, Montgomery, Rothschild, Spencer, Straus）：每个有限 Ramsey 集是球面的（Theorem 13）；他们还给出紧性原理（Proposition 4，本文 Lemma `paths:compactness` 的原型）和实变量染色引理（Lemma 15，本文 Prop `alg:necessity` 的原型）。
2. Graham 猜想：球面性是充分的（sufficiency 方向）——**被 Pálvölgyi 否证**：七点圆上配置不 Ramsey（`palvolgyi-heptagon` Theorem 1）；该文附录还断言泛型七点圆配置不 Ramsey（Theorem A.3，作者注称未经本人检查，且注明其证明思想归 ChatGPT——论文脚注 1 原文："Pálvölgyi attributes the writing, proofs, and ideas in that manuscript to ChatGPT. He labels the additional appendix claims as unchecked by him."）。
3. Frankl–Rödl：非退化三角形、进而所有非退化单纯形是 Ramsey。
4. Kříž：有可解传递等距群的有限集、圆内接梯形是 Ramsey。
5. Cantwell：正多面体顶点集是 Ramsey。
6. Leader–Russell–Walters：猜想"有限集 Ramsey $\iff$ 可嵌入有限传递欧氏集"（即 subtransitive $\iff$ Ramsey，Conjecture A）；其群论与 Hales–Jewett 表述引出 Block Sets Conjecture（后续 `ilw-blocks`）。
7. Karamanlis：每个单纯形可嵌入正多边形有限积；Behague：许多已知 Ramsey 类的可解传递扩张；Ivan–Leader–Walters：广义棱柱构造；Moore / Mirabi：在 Ramsey 集仿射包外添点保持 Ramsey 性——但仿射包限制使"任意共面圆上点"超出该扩张定理的适用范围（这是本文 Corollary `cons:quadrilateral` 的定位）。

本文的定位一句话（摘要原文）：

> "The criterion shows that every nonempty subtransitive set and every nonempty set of at most five points on a circle is Ramsey. In particular, some Ramsey cyclic quadrilaterals are not subtransitive, disproving the necessity direction of the Leader--Russell--Walters conjectured characterization."

即：本文**不**完整回答"哪些球面集是 Ramsey"（Pálvölgyi 的七点反例说明球面不充分），而是给出一个把"球面"细分下去的**精确代数刻划**；这个刻划把 LRW 的传递性猜想修正为：必要方向错（风筝反例）、充分方向对（subtransitive ⇒ 张量条件 ⇒ Ramsey）。

### 1.6 证明总路线图（§1.3 "How the algebra forces a monochromatic copy" 摘译，作为第二节的导航）

- **必要性**：张量条件不存在 ⇒ 代数分离出 $\Q$-线性泛函 $\ell$ 与函数 $h_i,L$ ⇒ 构造 $r_0=K^s$（$K=2s+1$）色染色，在**每个**维度避开 $A$（Prop `alg:necessity`）。
- **充分性三阶段**：
  1. **张量 → 精确坐标置换对（Lemma `pairs:two-scale`）**：张量给出有限个仿射函数的带符号有理重数，在 $A$ 每点上正负重数按取值逐值相消；Gaussian 构造 + 截断 + 有理化使负梯度的二阶矩任意小而相消恒等式精确保持。得 $f_i,g_i\in\R^\ell$：$\|f_i-f_j\|^2=\|a_i-a_j\|^2$，$\|g_i-g_j\|^2=q\|a_i-a_j\|^2$（$q>0$ 任意小），且 $g_i$ 是 $f_i$ 的坐标置换。
  2. **路径判据（Prop `paths:criterion`）**：自由群 $K$（生成元 $\xi_z$，$z\in\mathcal E=\R^{(\N)}$）中定义"路径"（对角因子 + 权重 $u$ 的缩放拷贝因子），端点 = 坐标wise乘积，权重 = 缩放平方和。证明：同一端点、权重比任意小的两条路径 ⇒ Ramsey。工具：紧性引理 + 权重同步化 + $\beta\mathcal S$ 幂等元角群 + 超滤子字符串实现 + Hales–Jewett。
  3. **端点校正（Prop `groups:endpoints`）**：置换对给出的两条路径端点不同；通过轨道平均把差异压入导出子群 $N^{(s-2)}$，其元素可用单位尺度拷贝的路径校正（Lemma `groups:pairs`, `groups:fractions`），再平均使校正代价相对主权重任意小（Lemma `groups:averaging`）。拼合：权重比 $<1/n$ 的等端点路径对。

最终组装（§6 末 "Completion of the sufficiency implication"）：给定 $n$，取 $q<1/(2n)$、$\delta=1/(2sn)$，得权重比 $<1/n$ 的等端点路径，由路径判据得 Ramsey。

---

## 二、逐引理带批注重构（论文主线，按节顺序）

本节约占全篇 60%。每条命题/引理按四段展开：(a) 精确陈述（TeX 原文）；(b) 证明机制逐步推导；(c) 每个假设/常数的机械性理由；(d) [推测] 候选失败路线。

### 2.0 预备数据：把矩阵条件翻译成仿射函数张量（§2 开头）

TeX 原文（设置）：

> "Put $W=\R\times\R^d$, regarded as a vector space over $\Q$.
> An element $w=(v,u)$ specifies the affine function $a\mapsto v+a\cdot u$.
> For each label define the $\Q$-linear evaluation map
> \[
>  e_i:W\longrightarrow\R,\qquad e_i(v,u)=v+a_i\cdot u.
> \]
> Let $\mathcal T(W)$ be the subspace of $W\otimes_{\Q}W$ fixed by the
> flip $w\otimes w'\mapsto w'\otimes w$. ... The map
> \[
>  (v,u)\otimes(v',u')\longmapsto u(u')^{\mathsf T}
> \]
> is $\Q$-linear on the tensor product and restricts to a map
> $G:\mathcal T(W)\to\Sym_d(\R)$ ... In particular, $G(w\otimes w)=uu^{\mathsf T}$.
> The tensor condition is the existence of $T\in\mathcal T(W)$ such that
> \begin{equation}\label{alg:tensor}
>  (e_i\otimes e_i)(T)=0\quad(1\leq i\leq s),
>  \qquad G(T)=I_d.
> \end{equation}
> The first identities hold in $\R\otimes_{\Q}\R$.
> They are stronger than their images under real multiplication."

批注：

- $W=\R\times\R^d$ 作为 **$\Q$-向量空间**（不是 $\R$-向量空间！）——这是全篇最容易被忽视的一点。仿射函数 $a\mapsto v+a\cdot u$ 的系数 $(v,u)$ 允许是任意实数，但张量组合系数只许有理数。原因：Ramsey 构造最终要用"有限列表 + 重复次数"实现，重复次数只能是整数，权重只能是有理的。若允许实系数组合，就无法拆成正负两个有限列表。
- $e_i$ 是 $\Q$-线性的：因为 $a_i\cdot u$ 对 $u$ 是 $\R$-线性的，从而也是 $\Q$-线性的；对 $v$ 平凡。注意 $e_i$ 的**核** $\Lambda_i=\{(v,u):v=-a_i\cdot u\}$ 是 $\Q$-超平面。
- $(e_i\otimes e_i)(T)$ 落在 $\R\otimes_\Q\R$ 中：张量级的零（$\R\otimes_\Q\R$ 的核结构：当 $x,y\in\R$ 在 $\Q$ 上线性无关时 $x\otimes y\ne0$，即使 $xy$ 看似可相消）。
- $G$ 只看梯度部分：$u(u')^{\mathsf T}$；$v$ 部分被丢弃。$G(T)=I_d$ 说的是"梯度 Gram 矩阵是单位阵"。
- 张量条件 (2.1) 与主定理矩阵条件的对应：$T$ 是 $P$ 在坐标分解 $W=\Q p_0\oplus(\text{实空间})$……不对，精确对应在 Prop `alg:equivalence` 里证明：$W\otimes_\Q W$ 按 $(v,u)$ 的分量展开成 $B$-值 $(d+1)\times(d+1)$ 数组 $Q$，求值 $E_i(Q)=\sum_{\alpha,\beta}(p_{i,\alpha}\otimes1)Q_{\alpha\beta}(1\otimes p_{i,\beta})$，梯度块是 $(m_\R(Q_{\alpha\beta}))_{1\le\alpha,\beta\le d}$。

### 2.1 Proposition `alg:equivalence`（矩阵条件 $\iff$ 张量条件）

**(a) 精确陈述（TeX 原文）：**

> "\begin{proposition}\label{alg:equivalence}
> The matrix condition in Theorem~\ref{thm:classification} is equivalent
> to~\eqref{alg:tensor}.
> \end{proposition}"

**(b) 证明机制（逐步）：**

方向一（矩阵 $\Rightarrow$ 对称张量）：

1. 记 $\mathscr B=\R\otimes_\Q\R$，$\tau(x\otimes y)=y\otimes x$，$m_\R:\mathscr B\to\R$ 乘法。把主定理的 $P\in\operatorname{Mat}_{d+1}(B)$ 通过自然包含 $B=F\otimes_\Q F\subset\R\otimes_\Q\R=\mathscr B$ 视为 $\mathscr B$-值数组 $Q$。
2. 坐标分解把 $W\otimes_\Q W$ 等同于数组 $Q=(Q_{\alpha\beta})_{0\le\alpha,\beta\le d}$（$\alpha,\beta$ 是 $W$ 分解为 $0$ 号"常数坐标" + $1..d$ 号"空间坐标"的指称）。在这个等同下求值恰是 $E_i(Q)=\sum_{\alpha,\beta}(p_{i,\alpha}\otimes1)Q_{\alpha\beta}(1\otimes p_{i,\beta})$——因为 $p_i$ 的第 $\alpha$ 分量就是 $W$ 的第 $\alpha$ 坐标基向量上的分量。梯度矩阵是空间块 $(m_\R(Q_{\alpha\beta}))_{1..d}$。
3. 翻转在对称群作用下的作用是 $Q^*_{\alpha\beta}=\tau(Q_{\beta\alpha})$。直接从求值公式验证 $E_i(Q^*)=\tau(E_i(Q))$；乘法把 $Q^*$ 的空间块变成乘后矩阵的转置。
4. 取 $Q'=\tfrac12(Q+Q^*)$：则 $E_i(Q')=\tfrac12(E_i(Q)+\tau(E_i(Q)))$。若 $E_i(Q)=0$，则 $E_i(Q')=0$（零在 $\tau$ 下不变）。若乘后空间块是 $I_d$，$Q'$ 的乘后空间块是 $\tfrac12(I_d+I_d^{\mathsf T})=I_d$。所以总可取对称（flip-不变）解。**这一半只用对称化，不需要任何深度。**
5. 注意：$\tfrac12(Q+Q^*)$ 中 $1/2$ 是有理数，所以还在 $W\otimes_\Q W$ 的像里；这是有理系数张量的世界里合法的运算。

方向二（张量/对称张量 $\Rightarrow$ 矩阵，即"降环 descent"）：这是实质内容。目标：若数组 $Q$ 取值在**更大**的环 $\mathscr B=\R\otimes_\Q\R$ 中满足条件，则 $B$-值解已存在。也就是说把系数环从 $B$ 扩到 $\mathscr B$ 不引入新解。

1. 选 $\R$ 的 $F$-基 $(r_\lambda)_{\lambda\in\Lambda}$（$\Q$ 上线性无关、$F$ 上张成 $\R$；由 Zorn 存在）。
2. 关键分解（TeX 原文）：
   \[
   \mathscr B=\bigoplus_{\lambda,\mu\in\Lambda} B(r_\lambda\otimes r_\mu),
   \]
   其中和项 $B(r_\lambda\otimes r_\mu)=\{x r_\lambda\otimes y r_\mu:x,y\in F\}$。验证：$\R=\bigoplus_\lambda F r_\lambda$（作为 $F$-向量空间直和），两边张量（域上向量空间张量是正合的，$\R\otimes_\Q\R=(\bigoplus Fr_\lambda)\otimes_\Q(\bigoplus Fr_\mu)$，而 $F\otimes_\Q F=B$ 展开系数）得直和分解。$B$-模结构：$B\cdot(xr_\lambda\otimes yr_\mu)$ 落在同一个和项里（$(x'x)r_\lambda\otimes(y'y)r_\mu$），故各和项是 $B$-子模且分解是 $B$-模直和（**free** $B$-module decomposition，原文如此）。
3. 任何解 $Q$ 只用到有限多个 $(\lambda,\mu)$，故可写成有限和 $Q=\sum_{(\lambda,\mu)\in J}(r_\lambda\otimes r_\mu)P^{\lambda\mu}$，$P^{\lambda\mu}\in\operatorname{Mat}_{d+1}(B)$。
4. 求值映射 $E_i$ 的所有系数都在 $B$ 里（因为 $p_{i,\alpha}\in F$，$(p_{i,\alpha}\otimes1)$ 与 $(1\otimes p_{i,\beta})$ 是 $B$ 的元素，左乘右乘保持各直和项）。故 $E_i(Q)=\sum_{(\lambda,\mu)}(r_\lambda\otimes r_\mu)E_i(P^{\lambda\mu})$，由直和分解唯一性，$E_i(Q)=0\Rightarrow E_i(P^{\lambda\mu})=0$ 对每对、每个 $i$。
5. 梯度条件：设 $C^{\lambda\mu}\in\operatorname{Mat}_d(F)$ 是 $P^{\lambda\mu}$ 的乘后空间块。对展开式逐项乘法（$m_\R(r_\lambda\otimes r_\mu)=r_\lambda r_\mu$）：
   \[ I_d=\sum_{(\lambda,\mu)\in J}r_\lambda r_\mu C^{\lambda\mu}. \]
   这是 $d^2$ 个系数在 $F$ 中、未知量是矩阵 $C^{\lambda\mu}$ 的条目的有限线性系统；已知它在 $\R$ 上相容（上式成立）。**行化简在 $F$ 上进行**：$F$ 上行化简只用到 $F$ 的域运算，相容性在扩域上保持当且仅当秩条件用系数域检验——即"若 $F$-线性系统在扩域上相容，则其在 $F$ 上相容"（标准事实：消元法是域内运算，矛盾行组合的存在与否与扩域无关）。故可选 $c_{\lambda\mu}\in F$ 使 $I_d=\sum c_{\lambda\mu}C^{\lambda\mu}$。
6. 令 $P=\sum_{(\lambda,\mu)}(c_{\lambda\mu}\otimes1)P^{\lambda\mu}\in\operatorname{Mat}_{d+1}(B)$。则 $E_i(P)=\sum(c_{\lambda\mu}\otimes1)E_i(P^{\lambda\mu})=0$（系数属于 $B$ 左乘保持直和项、求值为零），乘后空间块 $=\sum c_{\lambda\mu}C^{\lambda\mu}=I_d$。完成。
7. 原文提醒两点（容易漏）：
   - "The individual matrices $C^{\lambda\mu}$ need not be symmetric; the descent took place in the full space $\operatorname{Mat}_d(F)$."——降环时**不**保持对称性，因为 $\sum c_{\lambda\mu}C^{\lambda\mu}=I_d$ 的组合不必对称。若之后想要对称张量解，再对 $P$ 用方向一的对称化。
   - $\det$ 型论证不可用：$\mathscr B$ 不是域、不是整环（$\R\otimes_\Q\R$ 有零因子），所以这里用**模直和 + 域上线性系统相容性**而不是用某种"张出 $\mathscr B$ 再缩回"。

**(c) 假设的机械性理由：**

- "$s\ge2$、affine span $\R^d$"：保证 $E_i$ 系统非退化；且 $d=0$（单点）时空间块条件退化为空、判据平凡。
- $F$-基 $(r_\lambda)$ 的存在用 Zorn/选择公理——论文说 "All arguments take place in ZFC"，这里是选择公理的唯一实质出场点之一（另一处在超滤子的存在性）。
- "extending the coefficient ring introduces no new solutions"：直观理由是 $\mathscr B$ 作为 $B$-模是自由的（基 $r_\lambda\otimes r_\mu$），自由扩张不引入新的线性关系。若 $F/\Q$ 有复杂结构导致 $B$ 不再是"坐标独立的"，分解 (2.3) 仍成立因为它是纯向量空间层次的。
- 对称化的 $1/2$：要求 $2$ 在系数里可逆——$\Q$、$F$、$\R$ 都是特征零，无问题。

**(d) [推测] 候选失败路线：**

- [推测] 若把 $W$ 误取为 $\R$-向量空间，则 $W\otimes_\R W\simeq\R$，张量条件退化为"乘后"条件，即纯球面性——此时判据会错误地宣称所有球面集 Ramsey（与 Pálvölgyi 七点反例矛盾）。失败机制：$\R\otimes_\R(\cdot)$ 摧毁核结构，$m_F$ 变成同构，"增强"信息全部丢失。
- [推测] 若在方向二第 5 步直接对每个 $C^{\lambda\mu}$ 单独要求对称/或用行列式论证"$\det$ 非零故可除"，会在 $\mathscr B$ 有零因子处失败：$\operatorname{Mat}_d(F)$ 上的线性系统相容性论证之所以必要，正是因为不能对 $\mathscr B$-值矩阵做 Gaussian 消元。失败机制：$\mathscr B$ 中非单位元不可逆，$\det M$ 可能是零因子。
- [推测] 若 $\R$ 的 $F$-基不存在（无选择公理的 ZF 中 $\R$ 可能没有 Hamel 基于不可数域……准确说 $F$ 基需要超限构造），则降环论证整体失效；Lean 中会用经典选择/基存在定理处理（见第三节 Lean 取证）。

### 2.2 Remark `alg:noetherian`（有限坐标呈现）

TeX 原文：

> "Let $F_0=\Q[(a_i)_j]$, the subring of $\R$ generated by all
> coordinates. It is a finitely generated domain and $F=\operatorname{Frac}(F_0)$.
> The ring $B$ is the localization of $F\otimes_{\Q}F_0$ at the elements
> $1\otimes f$ for $0\ne f\in F_0$. The latter ring is a finitely generated
> $F$-algebra, so $B$ is Noetherian.
> The kernel of the finite evaluation system therefore has finitely many
> $B$-module generators. Its multiplied spatial image is the $F$-span of
> their multiplied spatial blocks, because every scalar $c\in F$ lifts to
> $c\otimes1$. This description uses exact coordinate-field relations;
> it makes no claim to recover those relations from numerical real inputs."

批注：

- $F_0$ 是有限生成 $\Q$-代数（$\le sd$ 个生成元），Noetherian（Hilbert 基定理）；$F$ 是其分式域。
- $B=F\otimes_\Q F$：把第二份 $F$ 写成分式 $g/f$（$g,f\in F_0$），则 $F\otimes_\Q F\cong(F\otimes_\Q F_0)[(1\otimes f)^{-1}:0\ne f\in F_0]$——对 $F_0$ 的全部非零元（的像）做局部化。$F\otimes_\Q F_0$ 是有限生成 $F$-代数（$F_0$ 那边提供生成元），局部化保持 Noetherian。所以 $B$ Noetherian。
- 用途：判据的可行解空间（$\ker$ 系统）是有限型 $B$-模——"原则上有限可验证"。乘后空间像 = 各生成元乘后块的 $F$-张成（因 $c\in F$ 可提升为 $c\otimes1$）。
- 这条 Remark 是 Lean 取证时的重要锚点：Lean 里"有限呈现"是显式构造而非抽象 Noether 性（见第三节）。

### 2.3 Remark `alg:congruence`（对全等的直接不变性）

TeX 原文：

> "If $a_i'=Qa_i+t$ with $Q\in O(d)$, the invertible $\Q$-linear map
> \[
>  H:W\longrightarrow W,\qquad
>  H(v,u)=(v-t\cdot Qu,Qu)
> \]
> satisfies $e_i'\circ H=e_i$ and
> $G((H\otimes H)T)=QG(T)Q^{\mathsf T}$."

批注（机制逐步）：

- 设 $A'=\{a_i'\}$，$a_i'=Qa_i+t$，$Q\in O(d)$，$t\in\R^d$。新求值泛函 $e_i'(v,u)=v+a_i'\cdot u$。
- 验证 $e_i'\circ H=e_i$：$e_i'(H(v,u))=e_i'(v-t\cdot Qu,Qu)=(v-t\cdot Qu)+(Qa_i+t)\cdot(Qu)=v-t\cdot Qu+Qa_i\cdot Qu+t\cdot Qu=v+a_i\cdot u=e_i(v,u)$。（用到 $Q$ 正交：$(Qx)\cdot(Qy)=x\cdot y$。）
- $H$ 可逆：$H^{-1}(v',u')=(v'+t\cdot Q^{-1}u',Q^{-1}u')$……即 $H^{-1}(v',u')=(v'+t\cdot Qu',Q^{\mathsf T}u')$。
- $G((H\otimes H)(w\otimes w'))=(Qu)(Qu')^{\mathsf T}=Q\,uu'^{\mathsf T}\,Q^{\mathsf T}$，故 $G((H\otimes H)T)=QG(T)Q^{\mathsf T}$；$I_d$ 在 $O(d)$-共轭下不动。
- 求值恒等式：$(e_i'\otimes e_i')((H\otimes H)T)=((e_i'\circ H)\otimes(e_i'\circ H))(T)=(e_i\otimes e_i)(T)$。
- 结论：$A$ 的证书 $\Rightarrow$ $A'$ 的证书；逆全等给反向。标签重排只是重排方程。**因此矩阵判据与代表选取无关，即使两个代表的坐标域不同**（比如 $A$ 与其无理旋转像坐标域不同也无妨）。
- 机械性理由：$H$ 的形状 $(v-t\cdot Qu,Qu)$ 是"把新代表处的仿射函数拉回旧代表处"的共轭——这正是把"函数的平移变换" lift 到系数空间。

### 2.4 Proposition `alg:necessity`（必要性：非 Ramsey ⇒ 固定有限染色避开）

**(a) 精确陈述（TeX 原文）：**

> "\begin{proposition}\label{alg:necessity}
> If~\eqref{alg:tensor} has no solution, then there is an integer $r_0\geq2$
> such that every $\R^D$ admits an $r_0$-coloring with no monochromatic
> congruent copy of $A$. In particular, every Euclidean Ramsey set
> satisfies the matrix condition of Theorem~\ref{thm:classification}.
> \end{proposition}"

**(b) 证明机制（逐步推导，不跳步）：**

1. **构造分离泛函。** 设 $\mathcal Y=(\R\otimes_\Q\R)^s\oplus\Sym_d(\R)$，$\Phi:\mathcal T(W)\to\mathcal Y$，$\Phi(T)=((e_i\otimes e_i)(T))_{i=1}^s\oplus G(T)$，都是 $\Q$-线性。$y_0=(0,\dots,0,I_d)\notin\operatorname{im}\Phi$（这就是"张量条件无解"）。在商空间 $\mathcal Y/\operatorname{im}\Phi$ 中把 $y_0$ 的非零类扩张成 $\Q$-基，把该基元映到 $1$、其余映到 $0$，得 $\Q$-线性泛函 $\ell:\mathcal Y\to\R$ 满足
   \[ \ell\circ\Phi=0,\qquad \ell(y_0)=1. \]
   写分量为 $\ell_i:\R\otimes_\Q\R\to\R$（$i=1..s$）与 $L:\Sym_d(\R)\to\R$，令 $h_i(x)=\ell_i(x\otimes x)$。
2. **得到两条恒等式。** 对 $w=(v,u)\in W$，$w\otimes w\in\mathcal T(W)$，$\Phi(w\otimes w)=((e_i\otimes e_i)(w\otimes w))_i\oplus uu^{\mathsf T}$，而 $(e_i\otimes e_i)(w\otimes w)=e_i(w)\otimes e_i(w)=(v+a_i\cdot u)\otimes(v+a_i\cdot u)$。故
   \begin{equation}(2.4)\quad \sum_{i=1}^s h_i(v+a_i\cdot u)+L(uu^{\mathsf T})=0,\qquad L(I_d)=1.\end{equation}
   取 $u=0$：$v$ 任意，得 $\sum_i h_i(x)=0\ (\forall x\in\R)$（常数相消恒等式）。
   注意：$\ell$ 是纯代数的（$\Q$-线性、由基选取构造），**不连续、不可测**——原文强调 "These are purely algebraic functionals; no continuity or measurability is asserted or needed."。所以 $L$ 对正交变换不必不变，但对**和**是加性的（$\Q$-线性 ⇒ 对有理系数线性；对实数相加？注意 $L:\Sym_d(\R)\to\R$ 是 $\Q$-线性，故 $L(A+B)=L(A)+L(B)$——加性成立；$L(cA)=cL(A)$ 只对 $c\in\Q$）。后面只用到加性和 $L(I_d)=1$。
3. **把恒等式搬到 $\R^D$ 的拷贝上。** 固定 $D$，定义 $H_i(z)=\sum_{j=1}^D h_i(z_j)$，$z\in\R^D$。断言：每个有序全等拷贝 $(b_1,\dots,b_s)$ 满足
   \begin{equation}(2.5)\quad \sum_{i=1}^s H_i(b_i)=-1.\end{equation}
   推导：$b$ 与 $A$ 全等 ⇒ 两两距离相等 ⇒（极化恒等式）Gram 矩阵相等 ⇒ 差向量组 $(a_i-a_1)_i$ 与 $(b_i-b_1)_i$ 的 Gram 矩阵相等 ⇒ 映射 $a_i-a_1\mapsto b_i-b_1$ 保持内积（任何线性关系：若 $\sum c_i(a_i-a_1)=0$，则 $\|\sum c_i(b_i-b_1)\|^2=\sum c_ic_j\langle b_i-b_1,b_j-b_1\rangle=\sum c_ic_j\langle a_i-a_1,a_j-a_1\rangle=\|\sum c_i(a_i-a_1)\|^2=0$，良定义且内积保持）。因 $A$ 仿射张成 $\R^d$，差向量张成线性空间，故上述映射延拓为线性等距 $Q:\R^d\to\R^D$，且 $b_i=t+Qa_i$（取 $t=b_1-Qa_1$，则 $b_i-b_1=Q(a_i-a_1)$）。
4. 写 $u_j^{\mathsf T}$ 为 $Q$ 的第 $j$ 行，则 $(b_i)_j=t_j+u_j\cdot a_i=e_i(t_j,u_j)$，且 $\sum_{j=1}^D u_ju_j^{\mathsf T}=Q^{\mathsf T}Q=I_d$。
   现在：$\sum_i H_i(b_i)=\sum_i\sum_j h_i((b_i)_j)=\sum_j\sum_i h_i(e_i(t_j,u_j))$。由 (2.4)，$\sum_i h_i(e_i(t_j,u_j))=-L(u_ju_j^{\mathsf T})$。求和：$=-L(\sum_j u_ju_j^{\mathsf T})=-L(I_d)=-1$。（用到 $L$ 的**加性** $L(\sum_j u_ju_j^{\mathsf T})=\sum_jL(u_ju_j^{\mathsf T})$——$\Q$-线性给出有限和的加性，这里 $D$ 有限，OK。）
   同时常数相消给出 $\sum_iH_i(z)=\sum_j\sum_ih_i(z_j)=\sum_j0=0$ 对每个点 $z$。
5. **构造染色。** 取 $K=2s+1$，把 $[0,2)$ 等分为 $K$ 个半开区间，长度 $2/K<1/s$。给点 $z\in\R^D$ 染色：取 $s$ 元组（$H_1(z)\bmod 2,\dots,H_s(z)\bmod 2$ 各自落入的区间标签），至多 $r_0=K^s$ 色，**与 $D$ 无关**。
   反证：若 $b_1,\dots,b_s$ 同色，则存在整数 $n_i$ 与实数 $\varepsilon_i$，$|\varepsilon_i|<2/K$，使
   \[ H_i(b_i)-H_i(b_1)=2n_i+\varepsilon_i\quad(i=1..s).\]
   （$H_i(b_i)$ 与 $H_i(b_1)$ 落在模 2 的同一区间 ⇒ 相差 $2\cdot$整数 + 长度 $<2/K$ 的误差。注意是同一个 $i$ 的两个值在**同一**区间——同色给出的正是这一点。）
   对 $i=1..s$ 求和：左端 $=\sum_iH_i(b_i)-\sum_iH_i(b_1)=-1-0=-1$（用 (2.5) 和点恒等式）。右端 $=2\sum_i n_i+\sum_i\varepsilon_i$。故 $\sum_i\varepsilon_i=-1-2\sum n_i$ 是**奇整数**。但 $|\sum\varepsilon_i|<s\cdot2/K=2s/(2s+1)<1$，奇整数绝对值 $\ge1$，矛盾。
6. 结论：该 $r_0$-染色在每个 $\R^D$ 避开 $A$；故 Ramsey 集（对每个 $r$ 存在 $D$ 迫使单色拷贝）必满足张量条件。

**(c) 常数的机械性理由：**

- $K=2s+1$：要 $2/K<1/s$，即 $K>2s$，取最小奇数……其实取 $K=2s+1$ 只是"够用的具体值"；任何 $K>2s$ 都行。$2/K<1/s$ 保证 $s$ 个误差绝对值之和 $<1$，与"奇整数"矛盾。
- $r_0=K^s$：染色由 $s$ 个区间标签的元组决定。维数无关性来自 $H_i(z)\bmod2$ 的定义在任意维一致。
- 模 2：因为 $H_i$ 只满足"点恒等式"（每点 $\sum_iH_i=0$）而没有逐点界；模 2 把"和为 $-1$"（(2.5) 的全局信息）与"同色 ⇒ 同区间"（局部信息）对接成奇整数矛盾。
- $\ell(y_0)=1$ 的归一化：让 (2.5) 右端是 $-1$ 而非某个 $\ne0$ 的常数；染色只需非零，数值大小无关紧要，但归一化让"$-1$ 是奇数"这一步干净。
- [批注] 为什么 $\ell_i$ 可以任意取值在 $\R\otimes_\Q\R$ 上而不必通过乘法分解：$\ell_i$ 是 $\Q$-线性泛函，$\R\otimes_\Q\R$ 是 $\Q$-向量空间，基扩张是自由的。$h_i(x)=\ell_i(x\otimes x)$ 只用了对角部分；$\ell_i$ 在非对角 $x\otimes y$ 上的取值从未被用到——原论文 EGM-RSS Lemma 15 的实变量版本是同一构造（原文注明 "Their real-variable coloring lemma extends Rado's work on partition regularity"）。

**(d) [推测] 候选失败路线：**

- [推测] 若试图把染色改成 Borel/可测的，会失败：$h_i$ 依赖 Hamel 基选取，天生不可测；而且"任意函数染色"本来就是这个理论的标准设置。失败机制：对可测 $h$，$\sum_ih_i(x)=0$（$\forall x$）加上 $h_i$ 的可测性会迫使 $L$ 线性连续化，从而 (2.4) 变成真实的球面方程，分离不复存在。
- [推测] 若 $K$ 取 $2s$（即 $2/K=1/s$），误差和可以恰好 $=1$：奇整数 1 不与 $|\sum\varepsilon_i|<1$ 矛盾（这里是 $\le$ 边界情形；半开区间的选取可能救回来但论证不再干净）。
- [推测] 若 $A$ 不仿射张成（比如全共线但 $d$ 取成 2），第 3 步"差向量张成 ⇒ 延拓为等距"会失效——其实能延拓但 $Q$ 不唯一且不必是整体等距；论文通过"先取仿射维数的代表"绕开，这解释了主定理为什么要规范化 affine span $=\R^d$。

### 2.5 §2 的过渡句（进入充分性）

TeX 原文：

> "The remaining direction begins with a tensor satisfying
> \eqref{alg:tensor}. Its evaluations vanish before multiplication, and
> that exact cancellation will produce equal coordinate histograms for
> two embeddings at different scales."

这句预告了 §3–§4 的核心：**求值相消（在 $m_F$ 之前）→ 同一坐标直方图的两个不同尺度嵌入**。反推时的关键直觉："张量级的零"经过 Lemma `stencil:finite` 变成"格点上带符号有理权函数在求值类上零推前"（即逐值相消），再经过 §4 变成两个坐标多重集相等的点列表。

---

### 2.6 §3 预备：从张量到"求值格"（§3 开头设置）

TeX 原文（设置）：

> "Recall that $W=\R\times\R^d$ is viewed over $\Q$, and that
> $e_i(v,u)=v+a_i\cdot u$. Let $T\in W\otimes_{\Q}W$ be symmetric, with
> \[
>  (e_i\otimes e_i)T=0\quad(1\leq i\leq s),
>  \qquad G(T)=I_d.
> \]
> A tensor uses only finitely many vectors. Choose a basis
> $w_1,\ldots,w_k$ over $\Q$ for a finite-dimensional subspace containing
> its factors, and write
> \[
>  T=\sum_{a,b=1}^k C_{ab}w_a\otimes w_b,
>  \qquad C\in\operatorname{Mat}_k(\Q),\quad C=C^{\mathsf T}.
> \]"

- $w_j=(v_j,u_j)$；记 $U=(u_1\ \cdots\ u_k)$ 为 $d\times k$ 实矩阵（列为梯度）。梯度恒等式：
  \begin{equation}(3.1)\quad UCU^{\mathsf T}=I_d.\end{equation}
  推导：$G(T)=\sum_{a,b}C_{ab}u_au_b^{\mathsf T}=UCU^{\mathsf T}$，而 $G(T)=I_d$。
- 定义格与求值格：
  \[
  \Gamma=\Z^k,\qquad
  \Lambda_i=\{\lambda\in\Gamma:e_i(w(\lambda))=0\},\qquad
  V_i=\operatorname{span}_{\Q}\Lambda_i,
  \]
  其中 $w(\lambda)=\sum_j\lambda_jw_j$。
- "Clearing denominators shows that $V_i$ is the kernel of the rational linear map $\lambda\mapsto e_i(w(\lambda))$ on $\Q^k$."——即 $\Q^k$ 上有理线性泛函 $\lambda\mapsto v(\lambda)+a_i\cdot u(\lambda)$（值在 $\R$，但**系数** $v_j,a_i\cdot u_j$ 是实数……注意：这个泛函的系数是实数不假，但"clearing denominators"指的是什么？细看：$e_i(w(\lambda))=\sum_j\lambda_j e_i(w_j)$，$\lambda_j\in\Z$。$\Lambda_i$ 是这个整线性式的零点集（对 $\Z$ 格）。$V_i=\operatorname{span}_\Q\Lambda_i$。由于 $e_i(w(\lambda))$ 对 $\lambda\in\Q^k$ 是 $\Q$-系数……不对，$e_i(w_j)\in\R$ 一般是超越的。论文声称 $V_i$ 等于 $\Q^k$ 中 $\lambda\mapsto e_i(w(\lambda))$ 的核（把该式当作 $\Q^k\to\R$ 的 $\Q$-线性映射的核）。"Clearing denominators"论证：若 $\lambda\in\Q^k$ 使 $e_i(w(\lambda))=0$，取 $N$ 使 $N\lambda\in\Z^k$，则 $e_i(w(N\lambda))=N\cdot0=0$，故 $N\lambda\in\Lambda_i$，$\lambda\in V_i$。反方向 $V_i\subset\ker$ 平凡。**于是** $\Q^k/V_i$ 通过 $\lambda\mapsto e_i(w(\lambda))$ 嵌入 $\R$（作为 $\Q$-向量空间单射：核恰为 $V_i$）。
- 下一步（原文）："Tensoring this injection with itself remains injective, so the tensor represented by $C$ has zero image in $(\Q^k/V_i)\otimes_{\Q}(\Q^k/V_i)$."——$\Q$ 是域，域上向量空间张量正合（平坦），单射张单射仍单射。$(e_i\otimes e_i)(T)=0\in\R\otimes_\Q\R$；把 $T$ 的坐标表示 $\sum C_{ab}\varepsilon_a\otimes\varepsilon_b$ 投到 $(\Q^k/V_i)^{\otimes2}$：由于 $e_i\otimes e_i$ 分解为 $\Q^k\to\Q^k/V_i\hookrightarrow\R$ 的复合与张量，且 $\Q^k/V_i\to\R$ 是单射，$(e_i\otimes e_i)(T)=0$ 蕴含投影后为零。

这一段的作用：把抽象张量条件改写成"有限秩有理矩阵 $C$ 在商空间 $\Q^k/V_i$ 上给出零双线性型"——一个**纯组合/代数**的输入，喂给下面的大引理。

### 2.7 Lemma `stencil:finite`（有限格点恒等式）——充分性链条的第一根支柱

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}[Finite lattice identity]\label{stencil:finite}
> Let $k,s\geq1$, let $\Lambda_1,\ldots,\Lambda_s$ be subgroups of
> $\Gamma=\Z^k$, and put $V_i=\operatorname{span}_{\Q}\Lambda_i$.
> Let $C\in\operatorname{Mat}_k(\Q)$ be symmetric. Suppose that the
> image of
> $\sum_{a,b}C_{ab}\varepsilon_a\otimes\varepsilon_b$
> in $(\Q^k/V_i)\otimes_{\Q}(\Q^k/V_i)$ is zero for every $i$,
> where $\varepsilon_1,\ldots,\varepsilon_k$ is the standard basis of
> $\Q^k$. There is a finitely supported function $\nu:\Gamma\to\Q$
> such that
> \begin{equation}\label{stencil:cosets}
>  \sum_{\gamma\in q}\nu(\gamma)=0
>  \qquad(q\in\Gamma/\Lambda_i,\ 1\leq i\leq s)
> \end{equation}
> and
> \begin{equation}\label{stencil:moments}
>  \sum_\gamma\nu(\gamma)=0,\qquad
>  \sum_\gamma\nu(\gamma)\gamma=0,\qquad
>  \sum_\gamma\nu(\gamma)\gamma\gamma^{\mathsf T}=C.
> \end{equation}
> \end{lemma}"

语义：找一个**有限支撑有理权函数** $\nu$，使得 (i) 在每个 $\Lambda_i$ 的每个陪集上带权和为零（注意：陪集和为 0 意味着**正部与负部分别在陪集内相消**——因为陪集和为零只约束总和，但"正负分别相消"的读法是 $\sum\nu=0$ 推出正权和 = 负权和（取相反数）；更精确的"逐值相消"解读在 §4：同一陪集 = 同一求值值，$\nu$ 的正部与负部在该求值值上的质量相等）；(ii) 总质量为 0、一阶矩为 0、二阶矩恰为 $C$。

**(b) 证明机制（逐步，这是全文代数最重的引理）：**

1. **群代数改写。** $R=\Q[X_1^{\pm1},\ldots,X_k^{\pm1}]$ 是 $\Gamma=\Z^k$ 的群代数，$X^\gamma=\prod_jX_j^{\gamma_j}$。商 $\Gamma\to\Gamma/\Lambda_i$ 诱导环同态 $\rho_i:R\to\Q[\Gamma/\Lambda_i]$，其核为
   \[ J_i=(X^h-1:h\in\Lambda_i). \]
   验证"$\ker\rho_i$ = 陪集零和多项式"：$f=\sum_\gamma c_\gamma X^\gamma$，$\rho_i(f)=\sum_{q}\bigl(\sum_{\gamma\in q}c_\gamma\bigr)X^q$，故 $f\in\ker\rho_i\iff$ 每个陪集内系数和为零。若陪集 $q$ 非零和……若每个陪集和为零：在支撑所在陪集 $q$ 里取代表元 $\gamma_0$，则 $\sum_{\gamma\in q}c_\gamma X^\gamma=\sum_{\gamma\in q}c_\gamma(X^\gamma-X^{\gamma_0})+\bigl(\sum_{\gamma\in q}c_\gamma\bigr)X^{\gamma_0}$，第一部分每项 $X^\gamma-X^{\gamma_0}=X^{\gamma_0}(X^{\gamma-\gamma_0}-1)\in J_i$（$\gamma-\gamma_0\in\Lambda_i$），第二部分为零。故零和多项式属于 $J_i$；反向显然。
   所以 (2.6)（陪集零和）$\iff f=\sum\nu(\gamma)X^\gamma\in\bigcap_iJ_i$。
2. **进入完备化并换对数坐标。** 令 $\mathfrak m=(X_1-1,\ldots,X_k-1)$，取 $\mathfrak m$-adic 完备化。用 $Z_j=X_j-1$：$\widehat R=\Q[[Z_1,\ldots,Z_k]]$（因子 $1+Z_j$ 模 $\mathfrak m$ 的任意幂可逆，故 Laurent 环的完备化就是形式幂级数环）。
   形式换元 $Y_j=\log(1+Z_j)$，$Z_j=\exp(Y_j)-1$：$\Q[[Z]]\cong\Q[[Y]]$（两个互逆的形式幂级数自同构，常数项为 0 的级数组合），$\mathfrak m\widehat R$ 对应 $(Y_1,\ldots,Y_k)$。
   对 $h\in\Gamma$：
   \[ X^h-1=\exp(h\cdot Y)-1=(h\cdot Y)\sum_{n\ge0}\frac{(h\cdot Y)^n}{(n+1)!}. \]
   最后的因子在 $\Q[[Y]]$ 中常数项为 1，是**单位**。故
   \begin{equation}(3.2)\quad J_i\widehat R=(h\cdot Y:h\in\Lambda_i)\widehat R,\end{equation}
   即理想扩张后变成线性式生成的理想。
3. **用张量假设匹配二次型。** 令 $Q_2(Y)=\tfrac12Y^{\mathsf T}CY$。把 $\Q[Y_1,\ldots,Y_k]$ 等同为 $\Q^k$ 的对称代数（$\varepsilon_j\mapsto Y_j$）。到对称代数 $\operatorname{Sym}(\Q^k/V_i)$ 的商映射的核由一次部分 $V_i$ 生成（"This follows, for example, by extending a basis of $V_i$ to a basis of $\Q^k$"：换基后商掉前 $r$ 个坐标方向，核就是 $(Y_1,\ldots,Y_r)$ 生成的理想，其中 $r=\dim V_i$；二次部分 $Q_2$ 在商中为零 $\iff$ 其双线性型在 $\Q^k/V_i$ 上为零 $\iff$ $C$ 的像在 $(\Q^k/V_i)^{\otimes2}$ 中为零——正是假设）。故 $Q_2$ 属于线性式 $h\cdot Y$（$h\in V_i$）生成的理想。
   还需 $h\in V_i$（$\Q$-线性组合）能换成 $h\in\Lambda_i$（格点）：$V_i=\operatorname{span}_\Q\Lambda_i$，若 $h=\sum c_jh_j$（$c_j\in\Q$，$h_j\in\Lambda_i$），则 $h\cdot Y=\sum c_j(h_j\cdot Y)$，线性式理想对 $\Q$-系数封闭……$\widehat R$ 是 $\Q$-代数，理想对 $\Q$-数乘封闭，OK。（若用 $\Z$-系数则不行，这也是为何要 $V_i=\operatorname{span}_\Q\Lambda_i$ 而不直接用 $\Lambda_i$。）结合 (3.2)：$Q_2\in J_i\widehat R$ 对每个 $i$。
4. **从"逐个理想"到"交集"。** $R$ 是 Noetherian（多项式环的局部化）。$\mathfrak m$-adic 完备化 $\widehat R$ 在 $R$ 上平坦（引 Stacks Project Lemma 10.97.2, Tag 00MB）。设 $I=\bigcap_iJ_i$；单射 $R/I\to\bigoplus_iR/J_i$ 张量 $\widehat R$ 后仍单射（平坦性），故 $I\widehat R=\bigcap_iJ_i\widehat R$（平坦交换：$I\widehat R\cong I\otimes_R\widehat R\to\bigoplus_iJ_i\otimes\widehat R=\bigoplus_iJ_i\widehat R$ 单射给出 $I\widehat R\subseteq\bigcap J_i\widehat R$；反向包含平凡因 $I\subseteq J_i$）。于是 $Q_2\in I\widehat R$。
5. **退回有限多项式并保持精确属于 $I$。** 写 $Q_2=\sum_{a=1}^Nf_a\alpha_a$，$f_a\in I$，$\alpha_a\in\widehat R$（有限和）。对每个 $\alpha_a$ 截断其 $Z$-展开到二次项，取 $b_a\in R$（有限 Laurent 多项式）使 $b_a-\alpha_a\in\mathfrak m^3\widehat R$。令 $f=\sum_af_ab_a\in I$。则
   \[ f(e^{Y_1},\ldots,e^{Y_k})=\tfrac12Y^{\mathsf T}CY\pmod{(Y)^3}. \]
   （因为 $f-\sum f_a\alpha_a=\sum f_a(b_a-\alpha_a)\in I\cdot\mathfrak m^3\widehat R\subseteq\mathfrak m^3\widehat R=(Y)^3$，而 $X^\gamma$ 与 $e^{\gamma\cdot Y}$ 在该同构下对应。）
6. **读出矩恒等式。** 记 $f=\sum_\gamma\nu(\gamma)X^\gamma$（有限和，$\nu:\Gamma\to\Q$ 有限支撑）。$f\in J_i$ 即 (2.6) 陪集零和。又 $f(e^Y)=\sum_\gamma\nu(\gamma)e^{\gamma\cdot Y}$，而
   \[ e^{\gamma\cdot Y}=1+\gamma\cdot Y+\tfrac12(\gamma\cdot Y)^2\pmod{(Y)^3}
     =1+\gamma\cdot Y+\tfrac12\gamma^{\mathsf T}(\gamma\gamma^{\mathsf T})Y\cdots \]
   准确地 $(\gamma\cdot Y)^2=Y^{\mathsf T}(\gamma\gamma^{\mathsf T})Y$。比较 $f(e^Y)$ 与 $\tfrac12Y^{\mathsf T}CY$ 在 $(Y)^3$ 商中的常数项、一次项、二次项系数：
   - 常数：$\sum_\gamma\nu(\gamma)=0$；
   - 一次：$\sum_\gamma\nu(\gamma)\gamma=0$；
   - 二次：$\sum_\gamma\nu(\gamma)\gamma\gamma^{\mathsf T}=C$。
   这就是 (2.7)。证毕。

**(c) 假设/构造的机械性理由：**

- 为什么用 Laurent 环而不是多项式环：格 $\Gamma=\Z^k$ 的群代数天然是 Laurent 环；负指数允许 $\nu$ 支撑在负坐标上（§4 中 $\mu$ 的支撑要包含 $-\gamma$ 型点，因为卷积 $\nu*d_n$ 的支撑是差集）。若用多项式环，$J_i$ 的描述会复杂化。
- 为什么完备化：**核心技巧是"对数坐标把乘法结构线性化"**。$X^h-1$ 在 $\mathfrak m$-adic 意义下"等于"线性式 $h\cdot Y$（差一个单位因子）；二次型 $Q_2$ 是 2 阶的，故只需 $\mathfrak m^3$ 精度，截断安全。这与 p-adic/形式群论证同源：把 $X^\gamma$ 看作 $\exp(\gamma\cdot Y)$，把"陪集求和"变成"线性式理想成员资格"。
- 为什么 $Q_2$ 只到二阶：因为张量条件只控制**二阶**矩（$C$ 是双线性型）；三阶及以上项被 $\mathfrak m^3$ 吸收，不影响结论。这也解释了后面 §4 只能控制"梯度二阶矩"而不是更高矩。
- $\nu$ 的系数在 $\Q$ 里：$C\in\operatorname{Mat}_k(\Q)$、$R$ 的系数域是 $\Q$、截断与线性代数都在 $\Q$ 上做。有理性在 §4 用于"取 $M$ 使 $M\mu$ 为整数"（重复次数）。
- (2.6) 与 (2.7) 的分工：(2.6) 保证**逐值相消**（§4 中两列表的多重集相等）；(2.7) 保证 Gram 矩阵差为 $C$（§4 中两列表的距离尺度不同）。二者缺一不可：只有 (2.7)，坐标多重集不必相等；只有 (2.6)，得到的是零 Gram 差（两列表全同尺度），无法得 $q<1$。

**(d) [推测] 候选失败路线：**

- [推测] 若 $k$ 个向量 $w_j$ 在 $\Q$ 上取成"极小生成集"而其中某些 $e_i(w_j)$ 有 $\Q$-线性关系，则 $V_i$ 的计算与 $\Lambda_i$ 的"陪集和"论证仍然成立（引理本身只假设 $\Lambda_i\le\Gamma$ 是子群），所以引理层面对此稳健；真正的脆弱点在"把张量条件代入"那一步（§2.6 末尾）——那里需要 $(\Q^k/V_i)^{\otimes2}$ 中为零。若有人试图只假设"乘后为零"（即 $\sum C_{ab}e_i(w_a)e_i(w_b)=0$），则商空间论证完全失效：$\Q^k/V_i\hookrightarrow\R$ 的单射在乘法下不保持（两个非零类乘后可为零在 $\R$ 中不会，但"乘后为零"这一假设太弱，推不出张量级为零）。失败机制：$\R$ 的 $\Q$-向量空间结构下，$x^2=0\Rightarrow x=0$，故"乘后零"是更弱的信息，它等价于双线性型在 $\operatorname{span}(e_i(w_j))$ 的像上为零，而张量级零还控制坐标之间的关系。
- [推测] 若 $\Lambda_i=\{0\}$（$e_i$ 在格上无处为零，即 $e_i(w(\lambda))=0$ 只有平凡解），则 (2.6) 只要求 $\sum_\gamma\nu(\gamma)=0$——退化情形仍可行。但若所有 $\Lambda_i$ 都平凡且 $C\ne0$，(2.6)+(2.7) 可以共存（如 $\nu=\delta_0-\delta_1+\cdots$ 型），不构成失败。真正的失败候选是：**$C$ 的符号结构**——(2.7) 要求 $\sum\nu\gamma\gamma^{\mathsf T}=C$，若 $C$ 有正有负方向，$\nu$ 的正部承担正矩、负部承担负矩……在 §4 中把负部做小（$\|U\lambda/n\|^2$ 加权），这依赖 $UCU^{\mathsf T}=I_d$ 在 $H=\operatorname{im}U^{\mathsf T}$ 上限制正定（Lemma `pairs:bump` 的关键）；若 $C$ 在 $\ker U$ 上不定，操作仍可行（$P_V$ 方向用大 $L$ 吸收），若 $C$ 在 $H$ 上不正定（即 $UCU^{\mathsf T}=I_d$ 不成立）则整个二阶矩方案崩塌。
- [推测] 若把 $s$ 个理想 $J_i$ 的交集改成和 $I=\sum_iJ_i$（误读），则 $f\in I$ 不再给出陪集零和（陪集零和对应**交**，因为要同时对每个商映射为零）。失败机制：$R/\bigcap J_i\to\bigoplus R/J_i$ 单射 vs $R/\sum J_i$ 商更大；用和会丢失各 $i$ 的独立相消信息。

### 2.8 §3 结尾的接线段（论文原文）

> "Apply Lemma~\ref{stencil:finite} to the matrix and evaluation lattices
> constructed above. If $\gamma,\gamma'\in\Gamma$, then
> $e_i(w(\gamma))=e_i(w(\gamma'))$ exactly when
> $\gamma-\gamma'\in\Lambda_i$. Thus \eqref{stencil:cosets} says that
> the positive and negative weights cancel separately at every
> evaluation value."

批注：$e_i(w(\gamma))-e_i(w(\gamma'))=e_i(w(\gamma-\gamma'))$（线性），为零 $\iff\gamma-\gamma'\in\Lambda_i$。所以陪集 = 求值等值类。(2.6) 的"陪集上总权和为零"配合 $\nu$ 的正负分解给出：**对每个 $i$、每个实数值 $t$，集合 $\{\gamma:e_i(w(\gamma))=t\}$ 上 $\nu$ 的正部质量 = 负部质量**。这正是 §4 中"两个列表的坐标多重集相等"的来源：把正部展开成一份坐标列表、负部展开成另一份，逐 $i$ 逐值配对。

> "The second moment in \eqref{stencil:moments}, together
> with \eqref{stencil:gram}, gives their prescribed difference in gradient
> Gram matrices. We next redistribute these weights so that the negative
> part has arbitrarily small gradient second moment, while all these
> equalities remain exact."

批注：$B_+-B_-=\zeta^{-1}C$ 型恒等式（精确），而负部的 $\|U\cdot\|^2$ 加权二阶矩可以任意小（下一节）。"redistribute" = 与光滑核卷积。

---

### 2.9 Lemma `pairs:bump`（紧支撑光滑函数）——"负部可以做小"的分析引擎

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}[A compactly supported smoothing function]\label{pairs:bump}
> Let $C$ be a real symmetric $k\times k$ matrix and let
> $U\in\operatorname{Mat}_{d\times k}(\R)$, where $d\geq1$ and
> $UCU^{\mathsf T}=I_d$. For every $\eta>0$, there is a nonnegative
> $b\in C_c^\infty(\R^k)$ such that
> \begin{equation}\label{pairs:bump-bound}
>  \int_{\R^k}b(x)\,dx>0,
>  \qquad
>  \int_{\R^k}(D_Cb)_-(x)\|Ux\|^2\,dx
>  <\eta\int_{\R^k}b(x)\,dx.
> \end{equation}
> \end{lemma}"
>
> 记号："For a real symmetric $k\times k$ matrix $C$, write
> \[
>  D_C=\frac12\sum_{j,l=1}^k C_{jl}\partial_j\partial_l,
>  \qquad r_+ = \max\{r,0\},\quad r_- = \max\{-r,0\}\quad(r\in\R).
> \]"

语义：存在光滑紧支撑非负函数 $b$，其"沿 $C$ 方向的二阶导"的负部对 $\|Ux\|^2$ 的加权积分相对 $\int b$ 任意小。$D_Cb$ 的负部测量"$C$-曲率朝下"的地方。

**(b) 证明机制（逐步）：**

1. **构造协方差对 $(S, S+C)$。** 由 $UCU^{\mathsf T}=I_d$，$U$ 满秩（rank $d$）：若 $\operatorname{rank}U<d$，则存在 $0\ne y$ 使 $U^{\mathsf T}y=0$，$0=y^{\mathsf T}UCU^{\mathsf T}y=\|y\|^2$ 矛盾。令 $H=\operatorname{im}(U^{\mathsf T})$（$k$ 维空间的 $d$ 维子空间），$V=\ker U$，$\R^k=H\oplus V$ 正交直和。
   $C|_H$ **正定**：$0\ne h=U^{\mathsf T}y\Rightarrow h^{\mathsf T}Ch=y^{\mathsf T}UCU^{\mathsf T}y=\|y\|^2>0$。（$U^{\mathsf T}$ 在 $H$ 上到 $\R^d$ 是同构，$y=（U^{\mathsf T}|_H)^{-1}h$。）
   取 $\epsilon>0$ 使 $\epsilon\tr(UU^{\mathsf T})<\eta/8$，取大 $L>0$，令
   \[ S=\epsilon P_H+LP_V. \]
   $S\succ0$ 平凡。$S+C\succ0$：Schur 补。分块
   \[ S+C=\begin{pmatrix}A&B\\B^{\mathsf T}&C_{VV}+LI_V\end{pmatrix},\quad A=C_{HH}+\epsilon I_H>0,\]
   选 $L$ 使 $C_{VV}+LI_V-B^{\mathsf T}A^{-1}B>0$（左端随 $L$ 增大趋于正定，因为 $LI_V$ 主导）。$V=\{0\}$ 时第二块缺席，$S+C=C_{HH}+\epsilon I_H\succ0$。
   且 $UP_V=0$ 给出关键小量：
   \begin{equation}(4.1)\quad \tr(USU^{\mathsf T})=\epsilon\tr(UU^{\mathsf T})<\eta/8.\end{equation}
   所有 $S+tC$（$0\le t\le1$）正定：$S$ 与 $S+C$ 的凸组合，正定锥凸。
2. **Gaussian 路径积分 = $D_C$ 的原函数。** 对正定 $Q$，$\phi_Q(x)=(2\pi)^{-k/2}(\det Q)^{-1/2}e^{-\frac12x^{\mathsf T}Q^{-1}x}$。直接求导（$Q_t=S+tC$）：
   \[ \frac{d}{dt}\phi_{Q_t}(x)=\frac12\left(x^{\mathsf T}Q_t^{-1}CQ_t^{-1}x-\tr(Q_t^{-1}C)\right)\phi_{Q_t}(x)=D_C\phi_{Q_t}(x). \]
   （第一等式：$\partial_t Q_t^{-1}=-Q_t^{-1}CQ_t^{-1}$，配对指数与行列式的导数；第二等式是 $D_C\phi$ 的标准公式——$C$ 不必半正定也成立，原文强调 "This identity does not require $C$ to be positive semidefinite"。）
   $t\mapsto\phi_{Q_t}$ 在 Schwartz 拓扑里光滑（特征值一致有界、下方一致远离 0），故
   \[ b_*(x)=\int_0^1\phi_{S+tC}(x)\,dt \]
   是非负 Schwartz 函数、积分为 1，且**微积分基本定理**：
   \[ D_Cb_*=\phi_{S+C}-\phi_S. \]
3. **负部估计。** $(\phi_{S+C}-\phi_S)_-\le\phi_S$（两密度之差为负时其绝对值 $\le\phi_S$，因为 $\phi_{S+C}\ge0$）。于是
   \[ \int(D_Cb_*)_-\|Ux\|^2\le\int\phi_S\|Ux\|^2=\tr(USU^{\mathsf T})<\eta/8, \]
   最后一步：协方差 $S$ 的 Gaussian 的 $\|Ux\|^2$ 期望是 $\tr(USU^{\mathsf T})$（标准公式 $\mathbb E\|Ux\|^2=\tr(USU^{\mathsf T})$）。
4. **紧化支撑。** 取 $\chi$：$0\le\chi\le1$，单位球上 $=1$，半径 2 外 $=0$；$\chi_R(x)=\chi(x/R)$，$b_R=\chi_Rb_*$。则 $\int b_R\to\int b_*=1$。乘积法则：
   \[ D_Cb_R=\chi_RD_Cb_*+\sum_{j,l}C_{jl}(\partial_j\chi_R)(\partial_lb_*)+b_*D_C\chi_R. \]
   $\partial_j\chi_R$ 的量级 $R^{-1}$、$\partial_j\partial_l\chi_R$ 量级 $R^{-2}$，支撑在壳 $R\le\|x\|\le2R$；$b_*$ 的 Schwartz 衰变压倒一切多项式权重，故
   \[ \int_{\R^k}|D_Cb_R-D_Cb_*|(x)\|Ux\|^2\,dx\to0. \]
   $r\mapsto r_-$ 是 1-Lipschitz ⇒ $|r_- - s_-|\le|r-s|$ ⇒ 负部加权积分同样收敛。取大 $R$：$\int b_R>1/2$ 且差积分 $<\eta/8$，于是
   \[ \int(D_Cb_R)_-\|Ux\|^2<\eta/8+\eta/8=\eta/4<\eta\int b_R. \]
   取 $b=b_R$。

**(c) 常数与假设的机械性理由：**

- $\eta/8$：预算分解——最终要 $\eta/4<\eta\int b_R\approx\eta\cdot(>1/2)$；$1/8+1/8=1/4$，留了余量。拆分：$\epsilon\tr(UU^{\mathsf T})<\eta/8$ 给 Gaussian 阶段，$\eta/8$ 给截断误差阶段。
- $S=\epsilon P_H+LP_V$ 的"各向异性"是**要点**：$H$ 方向取小 $\epsilon$（让 $\tr USU^{\mathsf T}$ 小——只有 $H$ 方向贡献，因 $UP_V=0$），$V$ 方向取大 $L$（吸收 $C$ 在核上的任意负曲率，保证 $S+C\succ0$）。若 $C|_V$ 有大负方向，$L$ 必须更大——引理对此无界宽容，因为 $V$ 方向的 $\|Ux\|^2$ 权重为零，代价不出现在估计里。
- $D_C$ 与卷积/矩的关系：$\sum\nu(\gamma)\gamma\gamma^{\mathsf T}=C$ 在连续极限下正是"$b$ 的 $C$-加权二阶矩"，而 $(D_Cb)(x)=\frac12\sum C_{jl}\partial_j\partial_lb$ 是二阶矩密度的生成元。$\phi_{S+C}-\phi_S$ 恰好是"二阶矩从 $S$ 到 $S+C$"的差分——这就是为什么负部可被 $\phi_S$ 控制。
- [批注] "$\int b>0$" 顺带成立（$\ge1/2$ 最终版本）；严格地说引理只需 $\int b>0$ 以便除以它。

**(d) [推测] 候选失败路线：**

- [推测] 若 $d=0$（无空间坐标）引理陈述退化（$U$ 是 $0\times k$，$\|Ux\|^2\equiv0$，不等式平凡成立）——论文限定 $d\ge1$ 是为了 $\tr$ 论证有意义；$d=0$ 时整个 Ramsey 问题退化为单点，另一路处理。失败机制不存在，只是记号空转。
- [推测] 若试图用**各向同性** Gaussian（$S=\epsilon I$）替代，则当 $C$ 有大负特征值时 $S+C$ 不正定，路径积分不存在；失败机制：$\phi_{S+tC}$ 可能变为不可积的 $e^{+\lambda\|x\|^2}$ 型。$L P_V$ 与正定性修正正是为此。
- [推测] 若省略紧化步骤、直接用 Schwartz 的 $b_*$，则 §4 中 Riemann 和论证的"单一固定球支撑"失效（$b_*$ 支撑无界，格点数不再是 $O(n^k)$，截断误差无法 $O(n^{-1})$ 控制）。失败机制：支撑无界时 $\sum_{\lambda}(\ldots)$ 的项数随 $n$ 超线性增长，$O(n^{-1})$ 估计崩溃。

### 2.10 Lemma `pairs:rational`（有限有理权）——把分析不等式变回精确组合

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}[Finite rational weights]\label{pairs:rational}
> Let $\Gamma=\Z^k$, and let $\Lambda_1,\ldots,\Lambda_s$ be subgroups
> of $\Gamma$. Suppose that a finitely supported function
> $\nu:\Gamma\to\Q$ has zero pushforward on each $\Gamma/\Lambda_i$,
> and satisfies
> \[
>  \sum_\gamma\nu(\gamma)=0,
>  \qquad \sum_\gamma\nu(\gamma)\gamma=0,
>  \qquad \sum_\gamma\nu(\gamma)\gamma\gamma^{\mathsf T}=C.
> \]
> Let $U$ be a real $d\times k$ matrix with $UCU^{\mathsf T}=I_d$,
> where $d\geq1$. For every $\eta>0$, there are an integer $n\geq1$,
> a finitely supported $\mu:\Gamma\to\Q$, and $\zeta\in\Q_{>0}$ such
> that $\mu$ has zero pushforward on each $\Gamma/\Lambda_i$ and
> \begin{align}
>  \sum_\lambda\mu(\lambda)
>        \frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}
>    &=\zeta C, \label{pairs:exact-moment}\\
>  \sum_\lambda\mu(\lambda)_-
>        \left\|U\frac{\lambda}{n}\right\|^2
>    &<\eta\zeta. \label{pairs:small-negative}
> \end{align}
> \end{lemma}"

**(b) 证明机制（逐步）：**

1. **卷积构造。** 取 Lemma `pairs:bump` 的 $b$。对正整数 $n$：
   \[ d_n(\lambda)=n^{2-k}b(\lambda/n),\qquad
      \mu_n=(\nu*d_n)(\lambda)=\sum_\gamma\nu(\gamma)d_n(\lambda-\gamma). \]
   有限支撑（$\nu$ 有限支撑 + $b$ 紧支撑）。"Quotient pushforward commutes with convolution"：陪集指示函数与 $d_n$ 的卷积是常数（陪集上 $d_n$ 部分和），故 $\nu$ 的零推前 ⟹ $\nu*d_n$ 零推前。准确论证：对陪集 $q\in\Gamma/\Lambda_i$，$\sum_{\lambda\in q}(\nu*d_n)(\lambda)=\sum_\gamma\nu(\gamma)\sum_{\lambda\in q}d_n(\lambda-\gamma)=\sum_\gamma\nu(\gamma)\sum_{\lambda'\in q}d_n(\lambda')$（陪集平移不变）$=\bigl(\sum_{\lambda'\in q}d_n(\lambda')\bigr)\cdot\sum_\gamma\nu(\gamma)=0$。
2. **矩恒等式（卷积的代数）。** 对任意有限支撑实函数 $d$：
   \begin{equation}(4.2)\quad \sum_\lambda(\nu*d)(\lambda)=0,\qquad
   \sum_\lambda(\nu*d)(\lambda)\lambda\lambda^{\mathsf T}=\Bigl(\sum_\beta d(\beta)\Bigr)C.\end{equation}
   推导：$\sum_\lambda(\nu*d)(\lambda)\lambda\lambda^{\mathsf T}=\sum_{\gamma,\beta}\nu(\gamma)d(\beta)(\gamma+\beta)(\gamma+\beta)^{\mathsf T}$
   $=\sum_{\gamma,\beta}\nu(\gamma)d(\beta)\bigl[\gamma\gamma^{\mathsf T}+\gamma\beta^{\mathsf T}+\beta\gamma^{\mathsf T}+\beta\beta^{\mathsf T}\bigr]$
   - $\sum_\gamma\nu(\gamma)\gamma\gamma^{\mathsf T}=C$，$\sum_\beta d(\beta)$ 提出 ⇒ $C\sum d$；
   - $\gamma\beta^{\mathsf T}$ 项：$(\sum_\gamma\nu(\gamma)\gamma)(\sum_\beta d(\beta))^{\mathsf T}=0$（一阶矩为零）；
   - $\beta\gamma^{\mathsf T}$ 项同理；$\gamma\gamma^{\mathsf T}\cdot\beta\beta^{\mathsf T}$ 项只剩 $\beta\beta^{\mathsf T}$ 系 $\sum_\gamma\nu(\gamma)=0$ ⇒ 消失。
   总质量：$\sum_{\lambda}(\nu*d)(\lambda)=(\sum\nu)(\sum d)=0$。
   注意 (4.2) **不依赖 $d$ 的形状**——只依赖 $\sum d$；这就是"等式层在卷积下自动保持"的机制。
3. **取 $d=d_n$ 并读出 $\zeta_n$。** $\sum_\lambda d_n(\lambda)=n^{2-k}\sum_\lambda b(\lambda/n)=n^2\sum_\lambda b(\lambda/n)\cdot n^{-k}$……直接算：$\sum_{\lambda\in\Z^k}n^{2-k}b(\lambda/n)\approx n^{2-k}\cdot n^k\int b=n^2\int b$。故令
   \[ \zeta_n=n^{-2}\sum_\lambda d_n(\lambda)=n^{-k}\sum_\lambda b(\lambda/n)\xrightarrow{n\to\infty}\int b>0 \quad(\text{Riemann 和}). \]
   由 (4.2)：$\sum_\lambda\mu_n(\lambda)\frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}=n^{-2}\bigl(\sum d_n\bigr)C=\zeta_nC$ ——(4.3) 对 $(\mu_n,\zeta_n)$ **精确**成立。
4. **负部不等式的极限。** Taylor 展开（$x=\lambda/n$）：
   \[ n^k\mu_n(\lambda)=n^k\sum_\gamma\nu(\gamma)n^{2-k}b(x-\gamma/n)
     =n^2\sum_\gamma\nu(\gamma)b(x-\gamma/n). \]
   对 $\gamma/n$ 展开 $b$ 到二阶：$b(x-\gamma/n)=b(x)-\nabla b(x)\cdot(\gamma/n)+\tfrac12(\gamma/n)^{\mathsf T}\nabla^2b(x)(\gamma/n)+O(n^{-3}\|\gamma\|^3)$。代入：$\sum\nu=0$ 消常数项，$\sum\nu(\gamma)\gamma=0$ 消一次项，剩
   \[ n^k\mu_n(\lambda)=\frac{n^2}{2n^2}\sum_{j,l}\Bigl(\sum_\gamma\nu(\gamma)\gamma_j\gamma_l\Bigr)\partial_j\partial_lb(x)+O(n^{-1})
     =D_Cb(x)+O(n^{-1}). \]
   误差一致（$b$ 的三阶导有界、$\sum|\nu(\gamma)|\|\gamma\|^3<\infty$——$\nu$ 有限支撑）。支撑一致含于固定球（$\supp\nu$ 紧 + $\supp b$ 紧）。$O(n^k)$ 个格点、权重 $\|Ux\|^2$ 有界、负部 1-Lipschitz ⇒
   \[ \sum_\lambda\mu_n(\lambda)_-\|U\lambda/n\|^2-\;n^{-k}\sum_\lambda(D_Cb(\lambda/n))_-\|U\lambda/n\|^2=O(n^{-1}), \]
   第二项是 Riemann 和 ⟶ $\int(D_Cb)_-\|Ux\|^2<\eta\int b$（Lemma `pairs:bump`）。取大 $n$：$\zeta_n>0$ 且 (4.4) 对 $(\mu_n,\zeta_n)$ 严格成立。
5. **有理化（Q-稠密开邻域论证）。** 令 $E\subset\Gamma$ 为 $d_n$ 的支撑。映射 $d\mapsto\nu*d$、$d\mapsto\zeta=n^{-2}\sum d(\lambda)$ 是 $\R^E$ 上的线性映射；$d\mapsto\sum_{\lambda\in\supp\nu+E}(\nu*d)(\lambda)_-\|U\lambda/n\|^2$ 连续。两个严格不等式（$\zeta>0$、(4.4)）在 $d_n$ 处成立 ⟹ 在 $\R^E$ 的一个开邻域内成立 ⟹ 取有理点 $d$（$\Q^E$ 稠密）。$\mu=\nu*d$：有理（$\nu,d$ 有理）、有限支撑、零推前（卷积保）、精确二阶矩 (4.3)（代数恒等式 (4.2) 不依赖 $d$ 有实或有理系数，$\zeta$ 有理因 $d$ 有理）。证毕。

**(c) 机械性理由：**

- $d_n$ 的规格 $n^{2-k}b(\lambda/n)$：指数 $2-k$ 使得 (i) $\zeta_n=n^{-2}\sum d_n\to\int b$（$n^2$ 因子把二阶矩放大到 $\zeta C$ 的规模，见下），(ii) $\mu_n$ 的"密度" $n^k\mu_n\to D_Cb$。反推：想让 $\mu_n$ 在尺度 $1/n$ 上近似连续密度 $D_Cb$，需要 $d_n$ 是 $n^{-k}$ 尺度的原子近似，即 $d_n(\lambda)\approx n^{-k}b(\lambda/n)$；多乘的 $n^2$ 来自想要**二阶矩**是 $\zeta C$（$C$ 阶）而不是 $O(n^{-2})$。二阶矩在 $1/n$ 尺度上自然缩小 $n^{-2}$，乘 $n^2$ 补偿。
- 为什么要求 (4.3)(4.4) 而不是直接对 $\mu_n$ 用：需要一个**有理**三元组 $(n,\mu,\zeta)$ 以便 §4 末"取 $M$ 使 $M\mu\in\Z$"；$b$ 是实函数不能直接用，必须经过有理邻域。
- $\zeta\in\Q_{>0}$：作为两列表 Gram 矩阵的公共缩放因子（§4 中除以 $\sqrt{\zeta M}$），必须为正且有意义。
- [批注] "The inequalities will only be used to add a common positive semidefinite Gram increment; no further approximation is needed."（§4 卷首语）——不等式 (4.4) 在下游只用一次：证明 $P=\eta I-B_-$ 半正定。之后一切都是精确代数。

**(d) [推测] 候选失败路线：**

- [推测] 若 $b$ 不紧支撑（用 Schwartz $b_*$），第 4 步"支撑一致含于固定球"失败，$O(n^k)$ 格点计数不成立，$O(n^{-1})$ 误差控制崩溃。失败机制：尾部格点贡献 $\sum_{\|\lambda\|>nR}$ 无法用固定球上的 Lipschitz 论证吸收。
- [推测] 若 $\nu$ 的支撑"太大"使 $\sum|\nu(\gamma)|\|\gamma\|^3$ 发散——不可能（有限支撑），但如果有人把引理推广到无穷支撑 $\nu$（比如想绕过 Lemma `stencil:finite`），Taylor 一致误差与卷积有限性都会失效。
- [推测] 若在开邻域论证中忘了保持**严格**不等式（取闭包而非开邻域），有理点可能落在 $\zeta=0$ 或 (4.4) 取等的边界上；下游 $P=\eta I-B_-$ 半正定的推导依赖 (4.4) 的严格性（$\tr B_-<\eta$，从而 $B_-\le\tr B_-<\eta\cdot I$……准确说 $B_-$ 半正定且 $\tr B_-<\eta$ 给 $B_-\le(\tr B_-)I\subset\eta I$——不，半正定矩阵的特征值 $\le$ 迹，故 $B_-\preceq(\tr B_-)I\prec\eta I$）。若只得到 $\le$，可以微调 $\eta$，但干净性丧失。

### 2.11 Lemma `pairs:two-scale`（双尺度坐标置换配置）——充分性链条的几何出口

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}[Two-scale configurations]\label{pairs:two-scale}
> Let $A=\{a_1,\ldots,a_s\}\subset\R^d$ have affine span $\R^d$, with
> $s\geq2$. Let $W=\R^{1+d}$ be regarded as a vector space over $\Q$.
> Suppose that a symmetric tensor $T\in W\otimes_{\Q}W$ satisfies
> \[
>  (e_i\otimes e_i)(T)=0\quad(1\leq i\leq s),
>  \qquad G(T)=I_d,
> \]
> where $e_i(v,u)=v+a_i\cdot u$. For every $\eta>0$, there are an integer
> $\ell\geq1$ and vectors $f_i,g_i\in\R^\ell$ such that
> \begin{align}
>  \|f_i-f_j\|^2&=\|a_i-a_j\|^2,
>  &\|g_i-g_j\|^2&=q\|a_i-a_j\|^2,
>  &q&=\frac{\eta}{1+\eta}, \label{pairs:distances}
> \end{align}
> for every $i,j$, and $g_i$ is a permutation of the coordinates of $f_i$
> for each $i$.
> \end{lemma}"

**(b) 证明机制（逐步）：**

1. **由 §2.6–§2.7 得 $\nu$。** 取 $T$ 的 $\Q$-基表示：$w_j=(v_j,u_j)$，$U=(u_1\cdots u_k)$，$C\in\operatorname{Mat}_k(\Q)$ 对称，$UCU^{\mathsf T}=I_d$（梯度恒等式 (3.1)）。$\Lambda_i=\{\lambda\in\Gamma:e_i(w(\lambda))=0\}$。Lemma `stencil:finite` 给 $\nu:\Gamma\to\Q$ 有限支撑，满足陪集零和 (2.6) 与矩 (2.7)。
2. **由 Lemma `pairs:rational` 得 $(n,\mu,\zeta)$。** $\mu$ 有限支撑、有理值、逐 $i$ 零推前、$\sum_\lambda\mu(\lambda)\frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}=\zeta C$、$\sum_\lambda\mu(\lambda)_-\|U\lambda/n\|^2<\eta\zeta$。
3. **造两个列表。** 取正整数 $M$ 使 $M\mu(\lambda)\in\Z$ 对所有 $\lambda$（$\mu$ 有理、有限支撑 ⇒ 取分母的 l.c.m.）。定义：
   - 正列表：$w(\lambda/n)$ 重复 $M\mu(\lambda)_+$ 次；
   - 负列表：$w(\lambda/n)$ 重复 $M\mu(\lambda)_-$ 次。
   这里 $w(\lambda/n)=\sum_j(\lambda_j/n)w_j$ 是仿射行 $(v(\lambda/n),u(\lambda/n))\in W$。
4. **两列表等长。** $\sum_\lambda\mu(\lambda)=0$（$\nu$ 的零总质量经卷积保持，(4.2) 第一式）⇒ $\sum M\mu_+=\sum M\mu_-$（正部和 = 负部和 = $\frac12\sum|M\mu|$）。
5. **逐值相消 ⇒ 坐标多重集相等。** 对标签 $i$：$e_i(w(\lambda/n))=e_i(w(\lambda'/n))\iff\lambda-\lambda'\in\Lambda_i$。零推前说：对每个陪集 $q\in\Gamma/\Lambda_i$，$\sum_{\lambda\in q}\mu(\lambda)=0$ ⇒ $\sum_{\lambda\in q}M\mu(\lambda)_+=\sum_{\lambda\in q}M\mu(\lambda)_-$（陪集上正部和 = 负部和 = $\frac12|\sum_{\lambda\in q}M\mu|$ 的绝对值……准确说 $\sum_{q}\mu=0$ ⇒ $\sum_q\mu_+=\sum_q\mu_-$）。把正列表在 $a_i$ 处求值得到的实数多重集与负列表的多重集**相等**（每个值 = 陪集标记，每个值的重数 = 陪集质量）。故 $f_i$（正列表求值向量）与 $g_i$（负列表求值向量）是彼此的坐标置换。
6. **Gram 矩阵。** 两列表各行除以 $\sqrt{\zeta M}$ 后，梯度 Gram 矩阵为
   \[ B_\pm=\frac1\zeta\sum_\lambda\mu(\lambda)_\pm\frac1{n^2}U\lambda\lambda^{\mathsf T}U^{\mathsf T}
     =\frac1\zeta\sum_\lambda\mu(\lambda)_\pm(U\lambda/n)(U\lambda/n)^{\mathsf T}. \]
   （梯度部分：行 $(v,u)$ 的梯度是 $u$；行 $w(\lambda/n)$ 的梯度是 $u(\lambda/n)=U\lambda/n$。）
   由 (4.3)：$B_+-B_-=\zeta^{-1}\cdot\zeta C$ 的"梯度化" $=\zeta^{-1}\cdot U(\zeta C)U^{\mathsf T}\cdot\frac1{?}$——仔细：$\sum_\lambda\mu(\lambda)(U\lambda/n)(U\lambda/n)^{\mathsf T}=U\bigl(\sum_\lambda\mu(\lambda)\frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}\bigr)U^{\mathsf T}=U(\zeta C)U^{\mathsf T}=\zeta UCU^{\mathsf T}=\zeta I_d$。除以 $\zeta$：$B_+-B_-=I_d$。
   由 (4.4)：$\tr(B_-)=\frac1\zeta\sum_\lambda\mu(\lambda)_-\|U\lambda/n\|^2<\eta$。
7. **补公共半正定增量。** $B_-\succeq0$ 且特征值 $\le\tr(B_-)<\eta$ ⇒ $B_-\prec\eta I_d$ ⇒ $P=\eta I_d-B_-\succeq0$（严格地说 $B_-$ 半正定、$\tr B_-<\eta$ ⇒ 每个特征值 $\le\tr B_-<\eta$ ⇒ $\eta I-B_-$ 的特征值 $>0$）。取向量 $r_1,\ldots,r_d$（如 $P^{1/2}$ 的列）使 $\sum_jr_jr_j^{\mathsf T}=P$，把同一组仿射行 $(0,r_j)$ **追加到两个列表**。新 Gram：$B_++P=(B_++\eta I-B_-)=\eta I+I_d=(1+\eta)I_d$ 与 $B_-+P=\eta I_d$。追加相同行不影响多重集相等性（对每个 $i$，追加行的求值 $0+r_j\cdot a_i$ 在两列表中相同）。
8. **终缩放与距离公式。** 全部行再除以 $\sqrt{1+\eta}$。$f_i$ = 正列表（现在含追加行）在 $a_i$ 的求值向量，$g_i$ = 负列表的。
   对任意仿射行 $(v,u)$：在 $a_i$ 与 $a_j$ 的求值差 $=(a_i-a_j)\cdot u$（$v$ 消掉）。故
   \[ \|f_i-f_j\|^2=\frac{1}{1+\eta}\sum_{\text{行}}(u\cdot(a_i-a_j))^2=\frac{1}{1+\eta}(a_i-a_j)^{\mathsf T}\bigl((1+\eta)I_d\bigr)(a_i-a_j)=\|a_i-a_j\|^2, \]
   \[ \|g_i-f_j\|\ \text{同理}=\frac{1}{1+\eta}(a_i-a_j)^{\mathsf T}(\eta I_d)(a_i-a_j)=\frac{\eta}{1+\eta}\|a_i-a_j\|^2. \]
   得 (4.5)，$q=\eta/(1+\eta)$，且 $0<q<1$，$\eta\to0\Rightarrow q\to0$。

**(c) 机械性理由：**

- 为什么 $q$ 是 $\eta/(1+\eta)$ 而不是直接 $\eta$：缩放次序——先做 Gram 差为 $I_d$ vs $B_-$，补增量后是 $(1+\eta)I_d$ vs $\eta I_d$，要**正列表达到精确尺度 1**（$\|f_i-f_j\|^2=\|a_i-a_j\|^2$，原尺度 Ramsey），必须除以 $\sqrt{1+\eta}$，负列表随之缩为 $\eta/(1+\eta)$。若先归一负列表，正列表会超过 1，全等（原尺度）要求正列表精确为 1。
- 为什么需要 $g_i$ 是 $f_i$ 的**坐标置换**（多重集相等而非仅数值集合）：§6 中 $H$（坐标置换群）作用于 $\mathcal E$，$f_i,g_i$ 同轨道是"端点校正代价小"的前提（Lemma `groups:averaging` 的 orbit 假设）。置换结构是 §5–§6 的群论原料。
- $M$ 的存在性：$\mu$ 有理、有限支撑 ⇒ 分母有限 ⇒ 取最小公倍数。这一步把有理权变成"整数重复次数"，即真实的有限列表。
- $\ell$（环境维数）= 列表长度（加追加行后），是**有限**的——因为 $\mu$ 有限支撑。这是"有限坐标多重集"承诺的兑现。

**(d) [推测] 候选失败路线：**

- [推测] 若 $q=0$（想要负列表退化成常向量），需要 $\eta=0$，而 (4.4) 是严格不等式链：$\tr B_-<\eta$ 且 $B_-\ne0$ 一般（$B_-$ 承载负矩 $\zeta C$ 的负部贡献，只要 $C$ 非零必有 $B_-\ne0$？——准确说 $B_+-B_-=I_d$、若 $B_-=0$ 则两列表 Gram 相差 $I_d$……$B_-=0$ 意味负列表所有梯度投影为零，即 $g_i$ 全同一点，只有 $A$ 是单点才行）。所以 $q>0$ 严格，必须走 §5–§6 把 $q$ 的残余"用权重比"吸收，不能取极限。失败机制：$\eta\to0$ 时 $n\to\infty$、列表长度 $\to\infty$，无有限拷贝；这就是必须引入路径/自由群机制的根本原因。
- [推测] 若 $A$ 不仿射张成（$d$ 取大），$\|f_i-f_j\|^2$ 公式仍成立但"原尺度全等"对应差分 $a_i-a_j$ 的 Gram——没问题；真正依赖仿射张成的是 Prop `alg:necessity` 与主定理陈述的规范化，不在本引理。
- [推测] 若把"追加行"加到 Gram 上但忘了同时加到**两个**列表，多重集相等破坏，$g_i$ 不再是 $f_i$ 的置换，§6 的轨道论证失效（$f_i,g_i$ 不同轨道）。追加公共行是"免费保持置换性"的唯一手段。

---

### 2.12 §5 预备：路径的定义（§5 开头，TeX 原文照抄）

> "Let $\mathcal E=\R^{(\N)}$ be the Euclidean space of real sequences with
> finite support, and let $K$ be the free group on the symbols
> $\xi_z$, indexed by $z\in\mathcal E$. Write
> $\Delta g=(g,\ldots,g)\in K^s$ for $g\in K$.
> A \emph{path} is a chosen finite sequence of factors in $K^s$ of the
> following two kinds:
> \begin{enumerate}
> \item a diagonal factor $\Delta g$, assigned weight zero;
> \item a factor $X_b=(\xi_{b_1},\ldots,\xi_{b_s})$, where
>       $b_1,\ldots,b_s\in\mathcal E$ and, for some $u\ge0$,
>       \[
>       \|b_i-b_j\|^2=u\|a_i-a_j\|^2\qquad(1\le i,j\le s),
>       \]
>       assigned weight $u$.
> \end{enumerate}
> The \emph{endpoint} is the product of the factors in $K^s$, in their
> given order. The \emph{weight} is the sum of their assigned weights.
> The weight belongs to the chosen path, not to its endpoint. In
> particular, two paths with the same endpoint can have different weights."

批注：

- $\mathcal E=\R^{(\N)}$：有限支撑实数列，即"所有有限维欧氏空间的公共并"。选它是为了 (i) 免费提供任意大有限维（$\R^D\subset\mathcal E$ 自然嵌入），(ii) 有无穷多两两正交的坐标块供 §5.2 的嵌入 $J_j$ 使用。
- $K$ 是**自由群**：生成元与 $\mathcal E$ 的点一一对应。自由性保证 $\psi:K\to p(\beta\mathcal S)p$（$\xi_z\mapsto p\delta_{(z)}p$）是良定义的同态（自由群上定义同态只需指定生成元像）。
- 拷贝因子 $X_b$ 允许 $u=0$（$b_1=\cdots=b_s$ 时权重 0）与任意 $u\ge0$；§4 给出 $u=q$（小尺度）的因子，§6 给出 $u=1$（原尺度）的因子。
- "weight belongs to the chosen path, not to its endpoint"：同一端点可以有多条不同权重的路径——整个 §5 判据建立在这个非唯一性上。端点是 $K^s$ 中精确的群元素；权重是表达式的计数性质。

### 2.13 Lemma `paths:compactness`（有限维紧性原理）

**(a) 精确陈述：**

> "\begin{lemma}\label{paths:compactness}
> Fix an integer $r\ge2$. If every $r$-coloring of $\mathcal E$ contains
> a monochromatic congruent copy of $A$, then the same holds for every
> $r$-coloring of $\R^D$, for some finite $D$.
> \end{lemma}"

**(b) 证明机制（逐步）：**

1. 反证：假设每个 $\R^D$ 都有避开 $A$ 的 $r$-染色。
2. 考虑积空间 $\{1,\ldots,r\}^{\mathcal E}$（紧，Tychonoff；离散有限集的任意积）。"每个有序全等拷贝 $(b_1,\ldots,b_s)\subset\mathcal E$ 非单色"是**柱集/闭开条件**：只依赖 $s$ 个坐标点的颜色。
3. 任取有限个这样的条件，涉及的有限支撑向量全体落在前 $D$ 个坐标位置（有限个有限支撑向量的并支撑有限）。用 $\R^D$ 的避开染色任意延拓到 $\mathcal E$，满足这有限个条件。
4. 有限交性质 + 紧性 ⇒ 存在染色满足**所有**条件，即 $\mathcal E$ 的避开染色，与假设矛盾。

**(c) 机械性理由：**

- 这是 EGM-RSS Proposition 4 的重述（原文注明 "compare \cite[Proposition~4]{egm-rss}"），且"对任意染色"证明——EGM-RSS 原版对可测染色用测度论，这里避免任何正则性。
- $\mathcal E$ 包含所有 $\R^D$ 的拷贝，所以"$\mathcal E$ 可避开 ⇒ 各 $\R^D$ 可避开"平凡；有内容的是反方向，即紧性。注意逻辑方向：引理说"$\mathcal E$ 强迫 ⇒ 某个有限 $D$ 强迫"。
- [批注] 这引理在主证明里的位置：Prop `paths:criterion` 在 $\mathcal E$ 上工作（因为 $K$ 的生成元与 $\mathcal E$ 对应），最后一步用紧性把结论降到有限维 $D(r)$。$D$ 的有效性依赖 $r$ 固定——"Compactness supplies a finite ambient dimension for each number of colors"（§1.3 原文）。

**(d) [推测] 候选失败路线：**

- [推测] 若 $\mathcal E$ 换成直积 $\R^\N$（全空间而非有限支撑），积空间 $\{1,\dots,r\}^{\mathcal E}$ 的"拷贝非单色"条件仍是柱集，论证照样过；但 $\Phi$（坐标块嵌入）的 (5.1) 距离公式需要求和有限——有限支撑正是为此。失败机制：$\R^\N$ 中 $\Phi(z)$ 可能不收敛（无穷和）。
- [推测] 若不用 Tychonoff 而试图"显式构造 $D$"：一般不可行，$D$ 由紧性非构造地给出；这也是 Lean 中走"经典逻辑 + 紧性"路线的原因（见第三节）。

### 2.14 Lemma `paths:synchronization`（权重同步化）

**(a) 精确陈述：**

> "\begin{lemma}\label{paths:synchronization}
> Fix an integer $n\ge1$. Let two paths have the same endpoint and weights $\lambda>0$ and
> $\mu\ge0$. If $\rho=\mu/\lambda<1/n$, then there is an endpoint
> $w\in K^s$ admitting a path of weight $1/t$ for every integer
> $1\le t\le n$.
> \end{lemma}"

**(b) 证明机制（逐步）：**

1. 令 $\alpha_t=\dfrac{1/t-\rho}{1-\rho}$（$1\le t\le n$）。验证：$0<\alpha_n<\cdots<\alpha_1=1$。
   - $\alpha_1=(1-\rho)/(1-\rho)=1$；
   - $\alpha_n=(1/n-\rho)/(1-\rho)>0$ 因为 $\rho<1/n$；
   - 单调：$1/t$ 递减、$\rho$ 固定、$1-\rho>0$ ⇒ $\alpha_t$ 随 $t$ 递减。
2. 把 $[0,1]$ 在这些点切开，得区间，长度 $l>0$。对每个长度 $l$ 的区间，对两条路径施加 $K$ 的自同态（endomorphism——实为自同构？缩放映射 $\xi_z\mapsto\xi_{\sqrt{l/\lambda}z}$ 是 $K$ 的自同构，因为 $z\mapsto\sqrt{l/\lambda}z$ 是 $\mathcal E$ 的双射线性映射，自由群生成元集合被双射置换）：
   \[ \xi_z\mapsto\xi_{\sqrt{l/\lambda}\,z}. \]
   对角因子保持（$\Delta g$ 里的 $g$ 的生成元也被缩放，但仍是对角元）；拷贝因子权重乘 $l/\lambda$：$\|\sqrt{l/\lambda}b_i-\sqrt{l/\lambda}b_j\|^2=(l/\lambda)u\|a_i-a_j\|^2$。两条新路径：同端点（同一自同构作用在相同端点上），权重 $l$ 与 $\rho l$。
3. 把各区间的路径按**固定顺序**（区间递增顺序）拼接。端点与"每段选哪条路径"无关（两路径同端点）。对给定 $t$：在 $\alpha_t$ 之前的区间选**大**权重（权重 = 区间长度 $l$，因为大权重路径权重恰为区间长 $l$），之后的区间选小权重（$\rho l$）。总重：
   \[ \alpha_t+\rho(1-\alpha_t)=\frac{1/t-\rho}{1-\rho}+\rho=\frac{1/t-\rho+\rho-\rho^2}{1-\rho}\cdot\text{（核对）} \]
   直接算：$\alpha_t+\rho(1-\alpha_t)=\rho+(1-\rho)\alpha_t=\rho+(1/t-\rho)=1/t$。✔
4. "The fixed order of concatenation gives one endpoint $w$ for all $t$; no commutation of factors is used."——端点 $w$ 固定；不同 $t$ 只换每段的"选哪条路径"，拼接顺序不变，所以端点元组相同。

**(c) 机械性理由：**

- 为什么需要这个引理：Hales–Jewett 线的**变量位置个数 $t$ 在染色之前未知**（§1.3 原文 "The obstacle ... is the initially unknown number $t$ of variable positions in a Hales--Jewett line"）。LRW 的群表述（Conjecture C）预先规定 $t$；这里允许线自己选 $t$，所以必须**预先**准备好权重 $1/t$（$1\le t\le n$）全部落在一个共同端点上，染色之后再按需取用。
- $1/t$ 的角色：Hales–Jewett 步里 $t$ 个变量位置各贡献权重 $1/t$ 的拷贝因子，$t$ 个相加恰为 1——给出**原尺度**全等（$\|\Phi(z^{(i)})-\Phi(z^{(j)})\|^2=t\cdot\frac1t\|a_i-a_j\|^2$）。这是"$t(1/t)=1$"的机制（§1.3 原文 "The $t$ variable positions give squared-distance multiplier $t(1/t)=1$"）。
- 区间拼接 vs 权重加法：权重是加性的（路径串联权重相加），端点是乘性的（$K^s$ 乘积）；两者分离是自由群路径方法的要点。
- 为什么对角因子"权重零"重要：缩放自同构下对角因子仍对角（权重保持 0），区间化只影响拷贝因子权重——$\rho l$ 与 $l$ 的计算才成立。

**(d) [推测] 候选失败路线：**

- [推测] 若 $\rho\ge1/n$（权重比不够小），$\alpha_n\le0$，区间 $[\alpha_n,\alpha_{n-1}]$……退化，无法为 $t=n$ 准备正权重段。这正是 §6 末取 $\delta=1/(2sn)$、$q<1/(2n)$ 严格保证 $\mu/\lambda<1/n$ 的原因。
- [推测] 若试图在拼接时**交换**因子次序（比如把所有大权重段排前面以简化），端点会变——$K^s$ 非交换；论文明确"no commutation of factors is used"是特性而非缺陷：固定序拼接保证所有 $t$ 共享同一端点 $w$。
- [推测] 若 $K$ 的自同态作用在 $\Delta g$ 上后 $g$ 内部生成元被缩放，路径是否仍是合法路径？是——对角因子定义只要求因子形如 $\Delta g$，$g$ 任意。但若有人把"路径"定义成只允许 $\xi_z$ 型字（无逆），对角因子中的逆元无法处理；论文定义 $\Delta g$ 对任意 $g\in K$（含逆），§5.2 才需要超滤子来"求值"含逆的对角因子（"Diagonal factors may contain group inverses, so they cannot in general be evaluated directly in the string monoid"）。

### 2.15 Lemma `paths:corner-group`（$\beta\mathcal S$ 的幂等元角群）

**(a) 精确陈述：**

> "\begin{lemma}\label{paths:corner-group}
> The operation in \eqref{paths:ultrafilter-product} makes
> $\beta\mathcal S$ a compact right-topological semigroup with identity
> $\delta_\epsilon$. It contains an idempotent $p$ such that
> $p(\beta\mathcal S)p$ is a group with identity $p$.
> \end{lemma}"
>
> 超滤子乘法定义（TeX 原文）：
> "\begin{equation}\label{paths:ultrafilter-product}
> B\in uv
> \quad\Longleftrightarrow\quad
> \{x\in\mathcal S:x^{-1}B\in v\}\in u.
> \end{equation}"
> （"For a string $x$, put $x^{-1}B=\{y\in\mathcal S:xy\in B\}$;
> this notation denotes a preimage under concatenation, not a string
> inverse."）

**(b) 证明机制（逐步）：**

1. **半群结构。** 固定 $v$，映射 $B\mapsto\{x:x^{-1}B\in v\}$ 保持有限交与补（$x^{-1}(B\cap C)=x^{-1}B\cap x^{-1}C$ 等），故把超滤子映到超滤子：$uv$ 良定义。
   结合性：两种括号方式含 $B$ 都等价于
   \[ \{x:\{y:\{z:xyz\in B\}\in w\}\in v\}\in u. \]
   （展开两次定义即得。）
   右拓扑：固定 $v$，$\{u:uv\in\overline B\}=\overline{\{x:x^{-1}B\in v\}}$ 是基本开集 ⇒ 右平移连续。单位：$B\in u\,\delta_\epsilon\iff\{x:x^{-1}B\in\delta_\epsilon\}\in u\iff\{x:\epsilon\in x^{-1}B\}\in u\iff\{x:x\in B\}\in u$，即 $B\in u$；故 $u\delta_\epsilon=u$。（左单位 $\delta_\epsilon u=u$ 需要另证吗？$B\in\delta_\epsilon u\iff\{x:x^{-1}B\in u\}\in\delta_\epsilon\iff\epsilon^{-1}B=B\in u$。✔ 两边单位。）
2. **存在极小左理想。** $\beta\mathcal S$ 紧 Hausdorff（超滤子条件定义 $\{0,1\}^{\mathcal P(\mathcal S)}$ 的闭子集）。非空紧左理想链有非空交（紧性 + 有限交性质）⇒ Zorn 得极小非空紧左理想 $L_0$。
3. **$L_0$ 的均匀性。** 对 $v\in L_0$：$(\beta\mathcal S)v$ 是非空紧左理想、含于 $L_0$（$v\in L_0$，左理想吸收）⇒ 由极小性 $(\beta\mathcal S)v=L_0$。（这一等式后面用于：$p=vy$ 型分解。）
4. **$L_0$ 内的极小子半群含幂等元。** 取极小非空紧子半群 $H_0\subseteq L_0$（Zorn）。对 $x\in H_0$：$H_0x$ 紧、是子半群（$(ax)(bx)=a(xb)x\in H_0x$，因 $xb\in H_0$、$a,b\in H_0$）⇒ 极小性 $H_0x=H_0$。于是 $\{y\in H_0:yx=x\}$ 非空（$H_0=H_0x$ 给出某个 $yx=x$）……准确说：$H_0x=H_0\Rightarrow x\in H_0x$？$x\in H_0=H_0x$，故存在 $y$ 使 $yx=x$。该集合紧、子半群（若 $y_1x=y_1'$？——若 $y x = x$ 则 $(zy)x=z(yx)x=zx$，封闭），极小性 ⇒ 等于 $H_0$ ⇒ 特别地 $x\cdot x=x$（$x\in H_0$ 满足 $x^2=x$？集合 $=H_0$ 含 $x$，即 $x^2=x$）。故 $L_0$ 含幂等元 $p$。
5. **角群 $G=p(\beta\mathcal S)p$ 是群。** $G$ 是以 $p$ 为单位的幺半群（$p\cdot pyq\cdot p=pyq$）。
   每个 $y\in G$ 属于 $L_0$（$y=pyq\in\beta\mathcal S\cdot L_0=L_0$……由 (5.4)：$(\beta\mathcal S)y=L_0$，故存在 $v$ 使 $vy=p$）。
   由 $py=y$（$p$ 是 $G$ 的左单位且 $y\in G$）：
   \[ (pvp)y=p(vy)=p\cdot p=p. \]
   故 $pvp\in G$ 是 $y$ 的左逆。幺半群中每元素有左逆 ⇒ 是群：若 $ay=p$、$ba=p$，则 $b=b(ay)=(ba)y=y$，故 $ya=p$（$b=y$ 是双侧逆）。
6. 注意这是 Ellis 幂等元引理的标准套路（原文引 Hindman–Strauss Theorem 2.5/Corollary 2.6/Theorem 1.42 与 Ellis Lemma 1；"taking the opposite semigroup matches the one-sided continuity convention"——$\beta\mathcal S$ 这里是**右**拓扑（右平移连续），标准文献常是左拓扑，取反半群对齐约定）。

**(c) 机械性理由：**

- 为什么需要**群**而不只是幂等元：Prop `paths:criterion` 的染色定义把字 $i_1\cdots i_n$ 染成使 $B_k\in\psi(w_{i_1})\cdots\psi(w_{i_n})$ 的唯一 $k$。若 $\psi$ 落在一般半群里，"字乘积属于哪个色类"不构成 Hales–Jewett 可用的均匀结构；落在**群**里保证每个字的染色良定义且"变量位置展开"后的列结构（共同列 + 主列）可被 Lemma `paths:realization` 实现。其实直接读证明：需要的是 (i) 幂等元 $p$ 提供"空字"的单位语义（"The identity of the corner group is $p$; if an empty group product occurs, it is retained as this common factor"），(ii) $\psi(\xi_z)=p\delta_{(z)}p$ 的规范形使拷贝因子成为"主列 + 两侧公共 $p$"。
- 选择公理出场：极小左理想、极小子半群的存在用 Zorn——与 §2.1 的 Hamel 基并列，这是全文两处非构造点。
- $\beta\mathcal S$ 用**字符串幺半群** $\mathcal S$（不是 $\mathcal E$ 的加法群）：因为 Ramsey 拷贝要"有限字符串的逐位对齐"（(5.1) 距离公式），幺半群（不可逆）才对应字符串拼接。

**(d) [推测] 候选失败路线：**

- [推测] 若在幺半群 $\mathcal S$ 上直接找幂等元并试图避免角群：幂等 $p$ 存在但 $p\beta\mathcal S p$ 的群结构是让 $\psi(K)$ 落入群的关键；若只用幂等元，$\psi(\xi_z^{-1})$ 无法定义为 $\psi(\xi_z)^{-1}$……准确说自由群同态需要目标群。失败机制：$K$ 是群，同态像必是群，半群目标装不下。
- [推测] 若把 (5.3) 的乘法定义写反（用右平移），会得到左拓扑半群，Lemma `paths:realization` 的"从左到右选串"归纳方向对不上——必须保持一致的手性约定。
- [推测] Zorn 论证依赖 $\beta\mathcal S$ 非空紧：$\mathcal S$ 无穷（$\mathcal E$ 无穷），$\beta\mathcal S$ 非平凡；若 $\mathcal S$ 有限则 $\beta\mathcal S=\mathcal S$ 无自由幂等元—— $\mathcal E$ 无穷保证一切有意义。

### 2.16 Lemma `paths:realization`（同时实现）——把超滤子乘积兑换成真实字符串

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}[Simultaneous realization]\label{paths:realization}
> Let $q_{i,j}\in\beta\mathcal S$ for $1\le i\le s$ and
> $1\le j\le M$, where $M\ge1$. Suppose that every column $j$ has
> one of the following specified forms:
> \begin{enumerate}
> \item $q_{i,j}=q_j$ is independent of $i$;
> \item $q_{i,j}=\delta_{z_{i,j}}$ for prescribed strings
>       $z_{i,j}\in\mathcal S$.
> \end{enumerate}
> If $B\in q_{i,1}\cdots q_{i,M}$ for every $i$, there are strings
> $x_{i,j}$ such that all products $x_{i,1}\cdots x_{i,M}$ belong to
> $B$, with $x_{i,j}$ independent of $i$ in each column of the first
> form and $x_{i,j}=z_{i,j}$ in each column of the second form.
> \end{lemma}"

**(b) 证明机制（从左到右归纳）：**

1. 维护不变量：选好前 $j-1$ 列后，前缀 $P_i$ 满足
   \[ P_i^{-1}B\in q_{i,j}\cdots q_{i,M}. \]
   （$P_i^{-1}B=\{y:P_iy\in B\}$，字符串前缀消去。）初始 $P_i=\epsilon$，$B\in q_{i,1}\cdots q_{i,M}$ 即假设。
2. 第 $j$ 列：记 $v_i=q_{i,j+1}\cdots q_{i,M}$（空积 $=\delta_\epsilon$）。令
   \[ E_i=\{x:x^{-1}(P_i^{-1}B)\in v_i\}. \]
   由 (5.3)，$E_i\in q_{i,j}$。
3. **共同列**（第 $j$ 列 $q_{i,j}=q_j$ 与 $i$ 无关）：所有 $E_i\in q_j$，超滤子对有限交封闭 ⇒ $\bigcap_iE_i\in q_j$ ⇒ 非空 ⇒ 所有行选**同一个** $x_{i,j}\in\bigcap_iE_i$。
4. **主列**：$q_{i,j}=\delta_{z_{i,j}}$ 且 $z_{i,j}\in E_i$（主超滤子含集合 ⟺ 其标记元素在集合里），选 $x_{i,j}=z_{i,j}$。
5. 更新 $P_i\leftarrow P_ix_{i,j}$：$(P_ix_{i,j})^{-1}B=x_{i,j}^{-1}(P_i^{-1}B)\in v_i=q_{i,j+1}\cdots q_{i,M}$，不变量保持。
6. 最后一列后：$P_i^{-1}B\in\delta_\epsilon$，即 $\epsilon\in P_i^{-1}B$，即 $P_i\in B$。证毕。

**(c) 机械性理由：**

- 这是 Hindman–Strauss 式"超滤子成员资格 = 可实现性"的标准转换；论文的特定需求是**逐列控制哪些行取相同串**：共同列对应路径的对角因子/未展开固定位置（$s$ 个角色必须用同一串），主列对应拷贝因子的 $\xi_{b_i}$（角色 $i$ 必须用串 $(b_i)$）。
- 为什么从左到右：乘积定义 (5.3) 的不对称性——$B\in uv$ 由"$u$-测度下的 $\{x:x^{-1}B\in v\}$"决定，自然从左侧展开归纳。
- 有限交：$s$ 有限，OK。

**(d) [推测] 候选失败路线：**

- [推测] 若共同列的 $E_i$ 之交为空（$s$ 无穷），归纳中断；本文 $s$ 固定有限，无碍。
- [推测] 若忘了"空群积保留为 $p$"（即 $\psi(w_{i_j})=p$ 的列），该列既非共同列也非主列——实现引理的前提破坏。处理办法：$p=p\delta_\epsilon p$？不对——$p$ 本身作为共同列 $q_j=p$ 即可（$p\in p(\beta\mathcal S)p$ 与所有行相同），证明里"if an empty group product occurs, it is retained as this common factor"即把 $\psi$-像为 $p$ 的因子并入共同列。

### 2.17 Proposition `paths:criterion`（路径判据）——§5 主定理

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{proposition}[A path criterion]\label{paths:criterion}
> Suppose that for every integer $n\ge1$ there are two paths with the
> same endpoint and weights $\lambda>0$ and $\mu\ge0$ satisfying
> $\mu/\lambda<1/n$. Then $A$ is Euclidean Ramsey.
> \end{proposition}"

**(b) 证明机制（逐步，四阶段）：**

1. **取 Hales–Jewett 长度。** 固定 $r\ge2$ 与任意染色 $c:\mathcal E\to\{1,\ldots,r\}$。取 $n$ 使每个 $r$-染色于 $\{1,\ldots,s\}^n$ 有单色组合线（Hales–Jewett；原文引 Shelah 的原始递归界但强调 "We use only existence of the length"）。组合线：非空变量位置集（同一字母）+ 固定字母其余位置。变量位置数 $t$（$1\le t\le n$）**由线决定，事先未知**。
2. **同步权重。** 假设给出对每个 $n$ 的等端点路径对（权重 $\lambda>0$、$\mu\ge0$、$\mu/\lambda<1/n$）。Lemma `paths:synchronization` 给出端点 $w=(w_1,\ldots,w_s)$ 与对每个 $1\le t\le n$ 的权重 $1/t$ 路径（端点均为 $w$）。
3. **染色 $\mathcal S$ 与字的染色。** 用 $c\circ\Phi$ 染 $\mathcal S$（$\Phi$ 见 §5.2：固定两两不交无穷坐标块，$J_j:\mathcal E\to\mathcal E$ 线性等距嵌入，$\Phi(z)=\sum_{j=1}^LJ_jz_j$；等长串的距离公式 (5.1) $\|\Phi(z)-\Phi(z')\|^2=\sum_j\|z_j-z'_j\|^2$）。色类 $B_1,\ldots,B_r$。
   取 Lemma `paths:corner-group` 的 $p$。自由性给同态
   \[ \psi:K\longrightarrow p(\beta\mathcal S)p,\qquad \psi(\xi_z)=p\delta_{(z)}p, \]
   $((z)$ 是单字母串$)$。把字 $i_1\cdots i_n\in\{1,\ldots,s\}^n$ 染成唯一的 $k$ 使
   \[ B_k\in\psi(w_{i_1})\cdots\psi(w_{i_n}). \]
   （"Every ultrafilter contains exactly one class of a finite partition"，故良定义 $r$-染色。）
4. **Hales–Jewett 线展开。** 取单色组合线，变量位置数 $t$。线的 $s$ 个字（第 $i$ 个字 = 把变量字母换成 $i$）颜色相同。
   对每个字的每个变量位置：用端点 $w$、权重 $1/t$ 的路径**展开** $\psi(w_i)$？——准确读原文："For each of the line's $s$ words, expand the factor at every variable position using the chosen path ending at $w$ with weight $1/t$."。即字在位置 $\pi$ 的字母 $i$ 对应 $\psi(w_i)$；$w_i$ 是路径端点 $w$ 的第 $i$ 坐标，路径本身（权 $1/t$）是 $w_i$ 的一种表达——把 $\psi(w_i)$ 换成路径各因子的 $\psi$-像之积：
   - 对角路径因子 $\Delta g$：贡献一个**共同**超滤子 $\psi(g)$（第 1 类列）；
   - 拷贝路径因子（权 $1/t$ 的拷贝 $b$）：贡献 $p\delta_{(b_i)}p$ 于角色 $i$——两侧 $p$ 公共（第 1 类列的两半？），中间是主列 $\delta_{(b_i)}$（第 2 类列）。
   - 未展开的固定位置：也是共同因子（第 1 类列）。
   所有 $s$ 个行积都含同一色类 $B_k$（单色性）。
5. **实现。** Lemma `paths:realization` 产出串 $z^{(1)},\ldots,z^{(s)}\in B_k$，积 ∈ $B_k$ 且逐列满足：共同列各角色同串、主列取指定串。"Every common factor was realized by the same string in all roles, and every varying factor has length one. Hence the resulting strings have equal lengths and their entries align."——所有列的串长：共同列选同一串、主列是单字母串 ⇒ 每行总长相等，且**逐列对齐**（第 $j$ 列的位置对应第 $j$ 个因子）。
6. **距离计算。** 公共串贡献零距离（两行同列同串 ⇒ $J_jz_j=J_jz_j'$）。每个展开的变量位置路径贡献权重 $1/t$ 的拷贝 $b^{(j)}$：第 $i$ 行该列放 $b^{(j)}_i$，对距离贡献 $\|b^{(j)}_i-b^{(j)}_j\|^2=\frac1t\|a_i-a_j\|^2$（权 $1/t$ 的拷贝定义）。$t$ 个变量位置（每行 $t$ 个）总计：
   \[ \|\Phi(z^{(i)})-\Phi(z^{(j)})\|^2=t\cdot\frac1t\|a_i-a_j\|^2=\|a_i-a_j\|^2. \]
   于是 $\Phi(z^{(1)}),\ldots,\Phi(z^{(s)})$ 是 $\mathcal E$ 中单色（同在 $B_k$）全等拷贝。
7. **有限维化。** Lemma `paths:compactness` 给有限 $D$ 对这个 $r$。$r$ 任意 ⇒ $A$ Ramsey。

**(c) 机械性理由：**

- 为什么染色定义在**字**上而不是直接用 $c$：让 Hales–Jewett 的组合线结构对应"端点 $w$ 的 $t$ 重乘积"——线的单色性是关于字染色的，而字染色通过 $\psi$ 与路径端点挂钩，从而单色线可以"展开"成单色点集。这是 LRW 群方法的超滤子化改写。
- 为什么只引 Hales–Jewett 的存在性（不用界）：$n$ 在取路径之前固定，度数与坐标数不需要对 $n$ 一致有界（§6 末原文："All choices are made after fixing $n$; no bound uniform in $n$ on the degrees or the number of coordinates is required."）。
- (5.1) 的两两正交坐标块：保证不同列的嵌入互不干扰（$\|J_jz-J_{j'}z'\|^2=\|z\|^2+\|z'\|^2$，$j\ne j'$），串距离严格等于列距离和。
- $t$ 未知性的最终处理：权重 $1,1/2,\ldots,1/n$ 全部预先备在同一端点 $w$（Lemma `paths:synchronization`），染色后按线的实际 $t$ 取用——"prepare one endpoint at weights $1,1/2,\ldots,1/n$ before coloring the words"（§1.3）。

**(d) [推测] 候选失败路线：**

- [推测] 若两条路径的公共端点 $w$ 的各坐标 $w_i$ 不"互不相同"或路径权重为 0（$\lambda=0$，即两条全对角路径），判据的前提 $\lambda>0$ 失败；空端点（全对角）不产生任何距离。$\lambda>0$ 是"至少有一个单位拷贝"的最低要求。
- [推测] 若 $\psi$ 的像有非平凡关系（$K$ 不自由），字染色可能不良定义或单色线的展开长度不一；自由群是"长度对齐"的保证。失败机制：若 $\psi(w_{i_1})\cdots\psi(w_{i_n})$ 的因子列在 $\beta\mathcal S$ 中塌缩，列数 $M$ 因行而异，串长不等，(5.1) 失效。
- [推测] 若变量位置数 $t=0$（Hales–Jewett 线无变量位置——不可能：组合线定义要求非空变量集，且 $n\ge1$；若取 $n=0$，权重 $1/t$ 无意义）。取 $n\ge1$ 由 HJ 保证线存在且变量数 $\ge1$。

---

### 2.18 §6 预备：校正幺半群与右分数（§6.1 设置，TeX 原文照抄）

> "Let $M\subset K^s$ be the monoid generated by the diagonal subgroup
> $\Delta K$ and the tuples $X_b=(\xi_{b_i})_{i=1}^s$ associated to
> ordered congruent copies $b$ of $A$.  Thus a chosen expression for an
> element of $M$ is a path using only copy factors of weight one.
> Its \emph{degree} is the number of those factors; diagonal factors have
> degree zero.  Degrees always refer to chosen expressions."

> "Suppose two paths have endpoints $D_+,D_-\in K^s$. If we can write
> \[
>  D_+^{-1}D_-=uv^{-1}\qquad(u,v\in M),
> \]
> then $D_+u=D_-v$. Appending the chosen expressions for $u$ and $v$
> therefore gives equal endpoints, with added weights $\deg u$ and
> $\deg v$, respectively."

> "To construct these corrections, let
> \[
>  N=\ker\bigl(K\longrightarrow\Z,\ \xi_z\longmapsto1\bigr).
> \]"

批注：

- $N$：$K$ 到 $\Z$ 的"字长/生成元个数"同态的核——即"总指数和为零"的字；是 $K$ 的正规子群（同态核），恰为把所有生成元等同后的无限循环群之核。$N$ 的抽象性质：$N/N'$（换位子群）……具体地，$N^{(0)}=N$，$N^{(r+1)}=[N^{(r)},N^{(r)}]$（导出列）。$s=2$ 时 $N^{(s-2)}=N$。
- 校正原理：$D_+^{-1}D_-=uv^{-1}$ ⇒ $D_+u=D_-v$；校正代价 $\deg u+\deg v$（单位尺度拷贝因子数）。
- "We will only multiply right fractions when their supports permit an explicit construction of a new denominator. No closure assertion for the whole set $MM^{-1}$ is needed."——重要方法论：**不**证明 $MM^{-1}$ 是群（一般不成立，$M$ 是幺半群），只做显式构造。

### 2.19 Lemma `groups:pairs`（对坐标幺半群是群）

**(a) 精确陈述：**

> "\begin{lemma}\label{groups:pairs}
> For every $i\ne j$, the monoid $M_{ij}$ is a group containing
> $N\times N$.
> \end{lemma}"

（$M_{ij}$：$M$ 在坐标 $(i,j)$ 上的投影像。）

**(b) 证明机制（逐步）：**

1. **任意距离 $r$ 的有序对可扩成拷贝。** $r=\|a_i-a_j\|>0$。给定 $z,z'\in\mathcal E$，$\|z-z'\|=r$：把 $a_j-a_i$ 的方向映到 $(z'-z)/r$，扩充为 $\operatorname{span}(A)$ 的一组标准正交架，平移把 $a_i$ 送到 $z$。架可取在 $\mathcal E$ 的有限维坐标子空间内（$\mathcal E$ 的"通用性"：任何有限维空间等距嵌入 $\mathcal E$）。故 $(x,y)=(\xi_z,\xi_{z'})\in M_{ij}$。
2. **可逆性。** $(y,x)\in M_{ij}$ 同理，而
   \[ (x,y)^{-1}=(x^{-1},x^{-1})(y,x)(y^{-1},y^{-1})\in M_{ij}. \]
   核对：$(x,y)(x^{-1},x^{-1})=(1,1)$……直接验证：$(x^{-1},x^{-1})(y,x)(y^{-1},y^{-1})$ 逐坐标 = $x^{-1}yy^{-1}=x^{-1}$（第一坐标）与 $x^{-1}xy^{-1}=y^{-1}$（第二坐标）＝ $(x^{-1},y^{-1})=(x,y)^{-1$ ✔。对角生成元可逆（$\Delta K$ 是群）。所以 $M_{ij}$ 是群。
3. **生成 $N\times N$ 型元素。**
   \[ (x,y)(y^{-1},y^{-1})=(xy^{-1},1),\qquad (x,y)(x^{-1},x^{-1})=(1,yx^{-1}), \]
   加上对角共轭（$(\Delta k)(g,1)(\Delta k)^{-1}=(kgk^{-1},1)$）。
4. **距离 $r$ 图连通。** $\mathcal E$ 上以"$r$-距离"为边的图连通：任何位移 $\delta=z'-z$ 分成若干段，每段长 $\le2r$；每段两端点有公共的 $r$-邻点（从中点取垂直位移 $h$，$\|h\|=\sqrt{r^2-(\text{半段})^2}$，$\|h\|\ge0$；当段长 $\le2r$ 时可行。垂直方向可用 $\mathcal E$ 的一个额外坐标提供——$\mathcal E$ 维数任意大）。故差 $\xi_z\xi_{z'}^{-1}$ 沿图边生成。
5. **正规闭包 $=$ $N$。** 沿边的差生成元（$\xi_z\xi_{z'}^{-1}$）在 $K$ 中的正规闭包：把所有生成元等同的商 $K\to\Z$ 下这些差映到 $0$，故正规闭包 $\subseteq N$；反之 $N$ 由形如 $uv^{-1}$（$u,v$ 生成元）的元素正规生成（$N=\ker(K\to\Z)$ 的标准生成元集），而这些正是差型元素。故正规闭包 $=N$。
6. 由第 3 步与对角共轭，$N$ 的（正规）生成元都属于 $M_{ij}$ 的两坐标版本，且 $M_{ij}$ 是群 ⇒ $N\times N\subseteq M_{ij}$。（注意 $N$ 是 $K$ 的子群，两坐标差生成元 $(n,1)$、$(1,n)$ 型 ⇒ 乘出 $N\times N$。）

**(c) 机械性理由：**

- 为什么任何 $r$-距离对都扩成拷贝：$A$ 至少两点（$s\ge2$），$(i,j)$ 是其中一对；全等拷贝的"有序性"允许 $a_i\mapsto z$、$a_j\mapsto z'$ 的任何实现。这条引理把 $M_{ij}$ 做成"足够大"的群，供引理 `groups:fractions` 的对坐标乘法规则 (6.2) 使用。
- 连通性论证中 $\le2r$ 的分段：保证弦高公式 $\sqrt{r^2-(d/2)^2}$ 有意义（$d\le2r$）。
- [批注] $(x,y)^{-1}$ 的显式分解 (6.x) 是"无需逆的拷贝"（所有因子都是拷贝或对角）的典范：$M$ 的生成元不含逆元，逆必须用拷贝表达——这是"度数"计数能够运作的结构前提。

**(d) [推测] 候选失败路线：**

- [推测] 若 $r$ 无法实现（$z,z'$ 距离 $\ne r$）：拷贝定义要求**所有**对距离匹配，故 $(\xi_z,\xi_{z'})$ 根本不是拷贝因子，$M_{ij}$ 变小。连通性论证只在 $r$-图上工作，与其他距离无关——若有人误用任意距离对会失败。
- [推测] 若 $\mathcal E$ 换成固定 $\R^D$：正交架可能放不下（$D$ 太小），连通性论证的"额外坐标"不存在，$M_{ij}$ 可能不是群。$\mathcal E$ 的无穷维是关键自由度。

### 2.20 Lemma `groups:fractions`（右分数演算 + 导出子群包含）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}\label{groups:fractions}
> Each $L_i$ is a normal subgroup of $K$, and its cost satisfies
> \[
>  c_i(g^{-1})=c_i(g),\qquad
>  c_i(kgk^{-1})=c_i(g),\qquad
>  c_i(gh)\le c_i(g)+c_i(h)
> \]
> for $g,h\in L_i$ and $k\in K$.
> Every tuple $(g_i)_{i=1}^s$ with $g_i\in L_i$ has a represented
> right fraction of cost at most $\sum_i c_i(g_i)$.
> Moreover,
> \begin{equation}\label{groups:derived-inclusion}
>  N^{(s-2)}\subset L_i\qquad(1\le i\le s),
> \end{equation}
> where $N^{(0)}=N$ and $N^{(r+1)}=[N^{(r)},N^{(r)}]$.
> \end{lemma}"
>
> （设置："For $g\in K$, let $g^{[i]}\in K^s$ have value $g$ in coordinate $i$
> and identity in every other coordinate.  Define
> \[
>  L_i=\{g\in K:g^{[i]}=uv^{-1}\text{ for some }u,v\in M\}.
> \]
> We call $uv^{-1}$ a \emph{right fraction}.  Its cost, with chosen
> expressions for $u,v$, is the sum of their degrees.  For $g\in L_i$,
> let $c_i(g)$ be the minimum cost of a right fraction representing
> $g^{[i]}$."）

**(b) 证明机制（逐步）：**

1. **逆与共轭。** 逆：分数 $uv^{-1}$ 的逆是 $vu^{-1}$（分子分母互换），代价不变。共轭：$d=\Delta(k)$ 对角元，$(kgk^{-1})^{[i]}=\Delta(k)g^{[i]}\Delta(k)^{-1}=(du)(dv)^{-1}$，$\deg(du)=\deg u$（对角因子度数 0），代价不变。
2. **单坐标乘法规则。** 给定已表达分数 $uv^{-1}$（代表某 $K^s$ 元）与 $g\in L_i$：令 $h=v_i^{-1}gv_i$（$v_i$ = $v$ 的第 $i$ 坐标）。$h^{[i]}=\Delta(v_i^{-1})\,g^{[i]}\,\Delta(v_i)$，故 $c_i(h)=c_i(g)$（共轭不变）。取 $h^{[i]}=ab^{-1}$（代价 $c_i(h)$）。则
   \begin{equation}(6.1)\quad uv^{-1}g^{[i]}=u\,\Delta(v_i)\,h^{[i]}\,\Delta(v_i^{-1})\,v^{-1}\cdots \end{equation}
   论文原文的形式："uv^{-1}g^{[i]} = u h^{[i]}v^{-1} = ua b^{-1}v^{-1} = (ua)(vb)^{-1}$"——核对：$v^{-1}g^{[i]}$，而 $g^{[i]}=\Delta(v_i)h^{[i]}\Delta(v_i^{-1})$；$v^{-1}\Delta(v_i)=\Delta(v_i)\cdot v^{-1}$？逐坐标：$v^{-1}$ 的第 $i$ 坐标是 $v_i^{-1}$，$\Delta(v_i)$ 在第 $i$ 坐标是 $v_i$；$v^{-1}\cdot g^{[i]}=v^{-1}\Delta(v_i)h^{[i]}\Delta(v_i^{-1})$；$v^{-1}\Delta(v_i)$ 是"第 $i$ 坐标为单位、其余 $v^{-1}$"的元，即 $v^{-1}\Delta(v_i)=\Delta(v_i)v'^{-1}$ 型……论文的写法是直接断言
   \[ uv^{-1}g^{[i]}=u\,h^{[i]}\,v^{-1} \]
   其中隐含 $v^{-1}g^{[i]}=h^{[i]}v^{-1}$（因为 $g^{[i]}=\Delta(v_i)h^{[i]}\Delta(v_i)^{-1}$ 且 $v^{-1}\Delta(v_i)=\Delta(v_i)v^{-1}$——核对：$v^{-1}\Delta(v_i)$ 逐坐标 $j\ne i$：$v_j^{-1}v_i$？不对。让我重推：设 $g^{[i]}=uv^{-1}$ 的意思是 $g^{[i]}=u v^{-1}$？不——原设：$uv^{-1}$ 是**任意**已表达分数（代表 $K^s$ 中某元素），$g\in L_i$。要计算 $uv^{-1}\cdot g^{[i]}$。
   $v=(v_1,\ldots,v_s)$。$v^{-1}g^{[i]}$：$g^{[i]}$ 只有第 $i$ 坐标非平凡。$v^{-1}g^{[i]}=v^{-1}\Delta(v_i)\Delta(v_i)^{-1}g^{[i]}$。而 $\Delta(v_i)^{-1}g^{[i]}=h^{[i]}$ 其中 $h=v_i^{-1}gv_i$：$(\Delta(v_i)^{-1}g^{[i]})$ 第 $i$ 坐标 $=v_i^{-1}gv_i=h$ ✔。且 $v^{-1}\Delta(v_i)$ = 把 $v^{-1}$ 的第 $i$ 坐标乘 $v_i$ 修正为单位 ⇒ 是"第 $i$ 坐标为单位、其余 $v_j^{-1}$"的对角元 $\Delta(v')$（$v'=(v_1,\dots,\widehat{v_i},\dots)$ 型）。
   故 $uv^{-1}g^{[i]}=u\Delta(v')h^{[i]}$。而 $\Delta(v')h^{[i]}=h^{[i]}\Delta(v')$？不交换！$h^{[i]}$ 只有第 $i$ 坐标非平凡，$\Delta(v')$ 第 $i$ 坐标平凡 ⇒ **二者交换**。故 $u\Delta(v')h^{[i]}=uh^{[i]}\Delta(v')$。
   于是 $uv^{-1}g^{[i]}=uh^{[i]}\Delta(v')$；又 $u$ 里可以并掉对角因子？论文写 "$uv^{-1}g^{[i]}=uh^{[i]}v^{-1}$"——$\Delta(v')v^{-1}$ 型合并后 $=v^{-1}$？$\Delta(v')v^{-1}$ 逐坐标：第 $j\ne i$：$v'_jv_j^{-1}$。若 $v'=v$（即论文把 $v$ 规范成第 $i$ 坐标 $=1$？）……实际上论文原文正是："Given any represented right fraction $uv^{-1}$ and $g\in L_i$, put $h=v_i^{-1}gv_i$ and choose $h^{[i]}=ab^{-1}$ of cost $c_i(h)=c_i(g)$. Then
   \[ uv^{-1}g^{[i]} = u h^{[i]}v^{-1} = ua b^{-1}v^{-1} = (ua)(vb)^{-1}. \]"
   这里 $uv^{-1}g^{[i]}=uh^{[i]}v^{-1}$ 需要核对：$uv^{-1}g^{[i]}=u(v^{-1}g^{[i]})$；$v^{-1}g^{[i]}=v^{-1}\Delta(v_i)\Delta(v_i)^{-1}g^{[i]}$。$\Delta(v_i)^{-1}g^{[i]}$ 第 $i$ 坐标 $=v_i^{-1}gv_i=h$，故 $\Delta(v_i)^{-1}g^{[i]}=h^{[i]}$（哦，等等：$\Delta(v_i)^{-1}g^{[i]}$ 逐坐标 $j\ne i$ 为 $1$，第 $i$ 为 $v_i^{-1}gv_i=h$，所以它就是 $h^{[i]}$！）。于是 $v^{-1}g^{[i]}=v^{-1}\Delta(v_i)h^{[i]}$。$v^{-1}\Delta(v_i)$：第 $i$ 坐标 $v_i^{-1}v_i=1$；第 $j\ne i$：$v_j^{-1}$。这是一个对角元 $\Delta(\bar v)$，$\bar v$ 的第 $i$ 坐标为 1。$\Delta(\bar v)$ 与 $h^{[i]}$ 交换（支撑不交）⇒ $v^{-1}g^{[i]}=h^{[i]}\Delta(\bar v)=\Delta(\bar v)h^{[i]}$。而 $u\Delta(\bar v)$：把 $u$ 的第 $i$ 坐标右乘 1 = $u$……不对，$u\Delta(\bar v)$ 第 $i$ 坐标 $=u_i$，第 $j$：$u_j\bar v_j$。嗯，论文的恒等式 $uv^{-1}g^{[i]}=uh^{[i]}v^{-1}$ 逐坐标核对：第 $i$ 坐标：LHS $=u_iv_i^{-1}g$；RHS $=u_i\cdot h\cdot v_i^{-1}=u_iv_i^{-1}gv_iv_i^{-1}=u_iv_i^{-1}g$ ✔。第 $j\ne i$：LHS $=u_jv_j^{-1}\cdot1=u_jv_j^{-1}$；RHS $=u_j\cdot1\cdot v_j^{-1}=u_jv_j^{-1}$ ✔。所以恒等式成立（我上面的中间步骤算错了 $\bar v$ 的角色——直接逐坐标验证即可，论文的分解 $u\,h^{[i]}\,v^{-1}$ 在坐标层面正确）。
   继续：$h^{[i]}=ab^{-1}$（$a,b\in M$，单坐标支撑……$a,b$ 是 $M$ 中"表示 $h^{[i]}$"的元）。$uh^{[i]}v^{-1}=uab^{-1}v^{-1}=(ua)(b^{-1}v^{-1})=(ua)(vb)^{-1}$。代价：$\deg(ua)+\deg(vb)=\deg u+\deg a+\deg v+\deg b\le$ 原代价 $+c_i(g)$。
   ⇒ 乘法封闭 + 次可加 + （与逆、共轭一起）正规性：$L_i$ 是正规子群。
3. **元组成本。** $(g_i)_i=\prod_i g_i^{[i]}$（各坐标支撑不交，可任意序——单坐标元相乘逐坐标独立）。逐个用 (6.1)：总代价 $\le\sum_ic_i(g_i)$。
4. **对坐标乘法规则（为导出包含准备）。** 设 $z=cd^{-1}$ 是支撑在对 $J$（两个坐标）上的分数（$c,d\in M_{J}$-可表示），$uv^{-1}$ 是任意右分数。由 Lemma `groups:pairs`，$M$ 到 $J$ 的投影是群 ⇒ 存在 $b\in M$ 使 $t=vb$ 在 $J$ 上是单位。$t$ 与 $z$ **交换**（支撑不交：$t$ 在 $J$ 上单位，$z$ 只在 $J$ 上非平凡）。则
   \begin{equation}(6.2)\quad uv^{-1}z=ubt^{-1}z=ubzt^{-1}=ubcd^{-1}t^{-1}=(ubc)(td)^{-1}.\end{equation}
   代价有限（辅助 $b$ 的度数**不需估计**——这是后面"平均引理只需要 $L$-成员资格、不需要新代价"的原因）。
5. **导出子群包含 (6.3) 的归纳。** 论文："The proof applies to any submonoid of $K^s$ containing the diagonal whose pair projections are groups containing $N\times N$."
   - $s=2$：整个幺半群 = 对投影，含 $N\times N$ ⇒ $N=N^{(0)}\subseteq L_i$ ✔。
   - $s\ge3$：固定 $i,j,k$ 互异。**投影掉 $j$** 的幺半群满足同样抽象假设（对角 + 对投影是群含 $N\times N$）⇒ 由归纳（$s-1$ 个坐标）每个 $a\in N^{(s-3)}$ 有支撑在 $\{i\}$（投影后）的右分数。把分子分母**提升**回 $M$：商是支撑在 $\{i,j\}$、第 $i$ 坐标值为 $a$ 的右分数 $z_a$（第 $j$ 坐标值不定）。同样投影掉 $k$ 得支撑 $\{i,k\}$、第 $i$ 值为任意 $b\in N^{(s-3)}$ 的 $z_b$。
   - 换位子：$z_az_bz_a^{-1}z_b^{-1}$——四个因子都是对支撑分数（逆 = 分子分母互换）。反复用 (6.2) 把乘积做成右分数。其积的第 $j,k$ 坐标相消（$z_a$ 只动 $\{i,j\}$、$z_b$ 只动 $\{i,k\}$；逐坐标看：$j$ 坐标上 $z_a$ 出现两次（一正一逆）、$z_b$ 单位 ⇒ 相消？$z_a^{-1}$ 的支撑也是 $\{i,j\}$，$z_b$ 在 $j$ 上单位 ⇒ $j$ 坐标总积 $=z_{a,j}\cdot1\cdot z_{a,j}^{-1}\cdot1=1$ ✔ 同理 $k$），第 $i$ 坐标值 $=[a,b]$。
   - 故 $[a,b]\in L_i$；$L_i$ 是子群 ⇒ 含所有换位子生成的群 $=[N^{(s-3)},N^{(s-3)}]=N^{(s-2)}$。
6. 最后定义（TeX 原文）：
   \[ L=N^{(s-2)},\qquad c(g)=\max_{1\le i\le s}c_i(g)\quad(g\in L). \]
   $L$ 正规；$c$ 有限、对称、次可加、共轭不变。

**(c) 机械性理由：**

- $N^{(s-2)}$ 的深度为何是 $s-2$：换位子构造一次"消耗"一个辅助坐标（需要 $j,k$ 两个坐标制造交换但只在 $i$ 留痕），$s$ 个坐标能支撑的换位深度是 $s-2$（$s=2$ 时只能做 0 阶）。这是"坐标数买导出深度"的交换。
- (6.2) 中"$b$ 的代价不需估计"：平均引理（下一节）把差异 $w_xw_y^{-1}$ 的**代价**用别的方式（度数比例）控制，(6.2) 只负责"存在右分数"。
- $c_i$ 最小值存在：代价是非负整数集，非空（$g\in L_i$）必有最小。
- [批注] 论文强调 "No closure assertion for the whole set $MM^{-1}$ is needed"——$L_i$ 定义为"可被单坐标分数表示"的子集，其群性由演算证明，不依赖 $MM^{-1}$ 封闭。

**(d) [推测] 候选失败路线：**

- [推测] 若试图取 $N^{(s-1)}$ 或 $N$（更深/更浅）会分别"构造不出"（换位子机需要两个辅助坐标）或"不够用"（平均引理要把轨道内差异降到 $N^{(s-2)}$ 才能被 (6.3) 覆盖；轨道平均每轮降一层导出深度，$s$ 个坐标恰好够 $s-2$ 轮……准确说初始差在 $N$、每轮平均升一层 ⇒ $s-2$ 轮后到 $N^{(s-2)}$，见下节）。
- [推测] 若 $A$ 的两点对 $(i,j)$ 对每个 $i\ne j$ 都要 $M_{ij}$ 是群——由 Lemma `groups:pairs` 对所有对成立；若某个距离 $r_{ij}$ 出现退化（$r_{ij}=0$，即 $a_i=a_j$）则 $s\ge2$ 与"点互异"排除。
- [推测] (6.2) 依赖"$t$ 与 $z$ 交换"即支撑不交；若分数支撑超过两坐标（比如全 $s$ 坐标），交换性失效，乘法规则崩塌——这就是为什么导出包含的归纳要逐对构造。

### 2.21 Lemma `groups:averaging`（轨道平均：把差异代价压到相对度数任意小）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{lemma}\label{groups:averaging}
> Let $H$ be a finite group of coordinate permutations of $\mathcal E$,
> and let $Z\subset\mathcal E$ be a finite $H$-invariant set. For every
> $\delta>0$, there is a tuple $w\in K^Z$ represented by diagonal
> factors and factors $(\xi_{h x})_{x\in Z}$, $h\in H$, with degree
> $m>0$, for which
> \begin{equation}\label{groups:orbit-bound}
>  w_xw_y^{-1}\in L,\qquad c(w_xw_y^{-1})\le\delta m
>  \quad\text{whenever }x,y\text{ belong to the same }H\text{-orbit}.
> \end{equation}
> \end{lemma}"

（设置："Consider represented tuples $w=(w_x)_{x\in Z}\in K^Z$ obtained by multiplying diagonal factors and factors
\[ (\xi_{h x})_{x\in Z},\qquad h\in H. \]
The degree of such an expression is the number of factors of the latter kind. Right multiplication by a diagonal element has degree zero. Replacing $w_x$ by $w_{h x}$ preserves the degree: it sends a generator indexed by $g\in H$ to the generator indexed by $gh$.")

**(b) 证明机制（逐步）：**

1. **阶段一：把差异压进 $L$（导出深度 $s-2$）。** 起点 $w_x=\xi_x$（度数 1 的表达式：一个因子 $(\xi_{hx})_{x\in Z}$ 型……起点是"度数 1"，即用一次拷贝因子）。同轨道差 $w_xw_y^{-1}\in N$（两生成元之差）。
   循环处理各轨道：设轨道 $O$ 上差异属于 $N^{(r)}$。
   - **右规范化**：取 $x_0\in O$，右乘对角元 $w_{x_0}^{-1}$（度数不变）：$O$ 上所有值进入 $N^{(r)}$（$w_xw_{x_0}^{-1}\in N^{(r)}$），且**每个轨道的差不变**（右乘公共对角元：$(w_xk)(w_yk)^{-1}=w_xkk^{-1}w_y^{-1}=w_xw_y^{-1}$ ✔）。
   - **轨道平均**（(6.5)）：
     \[ w'_x=\prod_{h\in H}w_{hx}\quad(\text{固定 }H\text{ 顺序}). \]
     对 $x\in O$：列表 $(hx)_{h\in H}$ 以相同重数 $|H|/|O|$ 遍历 $O$ 每点。于是各 $w'_x$（$x\in O$）在阿贝尔群 $N^{(r)}/N^{(r+1)}$ 中的像相同（因子的 $N^{(r)}$-像多重集相同、阿贝尔化只看多重集）。故 $O$ 上的差异属于 $N^{(r+1)}$。
   - **不破坏已处理的轨道**：若某轨道差异已在正规子群 $G\lhd K$ 中，平均后对应因子的 $K/G$ 像多重集相同 ⇒ 乘积的 $K/G$ 像相同 ⇒ 差异仍在 $G$。
   - 逐轨道把深度从 $N$ 提到 $N^{(s-2)}$（每轨道 $s-2$ 轮平均）。$s=2$ 时起点即达标。度数每轮乘 $|H|$，保持正。
   - 结果：同轨道差异 ∈ $L=N^{(s-2)}$。
2. **阶段二：代价/度数比压到 $\delta$。** 固定一个轨道 $O$：再右规范化于 $x_0$，记 $B=\max_{x\in O}c(w_x)$，$h=|H|$。
   若 $h=1$：全单点轨道，(6.6) 已成立。
   $h\ge2$：反复执行**收缩**（(6.7)）：
   \[ w'_x=\Bigl(\prod_{g\in H}w_{gx}\Bigr)w_{x_0}^{-1}. \]
   对每个 $x\in O$，积中恰有一个因子 $=a=w_{x_0}$（$g=e$ 那项？……"one factor in the product is $a=w_{x_0}$"：$g$ 使 $gx=x_0$ 的那个 $g$）。写积 $=PaQ$。则
   \[ w'_x=P(aQa^{-1}),\qquad c(w'_x)\le c(P)+c(Q)\le(h-1)B. \]
   （用 $c$ 的共轭不变与次可加；$P,Q$ 各 $h-1$ 个因子。注意 $w'_x$ 本身属于 $L$（阶段一保持：平均保持 $L$-成员性），所以 $c(w'_x)$ 有定义。）
   新度数 $=$ 旧度数 $\times h$。$k$ 轮后（初始度数 $m_0$）：
   \begin{equation}(6.8)\quad \frac{2B}{m_0}\Bigl(\frac{h-1}{h}\Bigr)^{k} \end{equation}
   上界于差代价/度数（因子 2 来自 $c(w_xw_y^{-1})\le c(w_x)+c(w_y)$）。收敛到 0 ⇒ 取足够 $k$ 使 $\le\delta$。
3. **不破坏其他轨道的界**：关键恒等式（(6.9) 的归纳证明）：
   \[ c\bigl((a_1\cdots a_h)(b_1\cdots b_h)^{-1}\bigr)\le\sum_{j=1}^hc(a_jb_j^{-1}) \quad(a_jb_j^{-1}\in L). \]
   证明：$A_j=a_1\cdots a_j$，$B_j=b_1\cdots b_j$，
   \[ A_jB_j^{-1}=\bigl(A_{j-1}(a_jb_j^{-1})A_{j-1}^{-1}\bigr)\bigl(A_{j-1}B_{j-1}^{-1}\bigr), \]
   逐次用共轭不变 + 次可加。
   于是 (6.7) 的乘积把**其他轨道**的最大差代价至多乘 $h$（各因子对的代价和），而度数恰乘 $h$ ⇒ 差代价/度数比不升。附加的公共右因子 $w_{x_0}^{-1}$ 不改变差。故可逐轨道达到 $\delta$，轨道有限。

**(c) 机械性理由：**

- 平均的代数本质：$\prod_{h\in H}w_{hx}$ 在阿贝尔化里只依赖 $\{w_{hx}\}$ 的多重集，与 $x$ 无关（轨道均匀遍历）——这就是"对称化消除一阶差异"。每轮在 $N^{(r)}/N^{(r+1)}$ 中"抹平"，$s-2$ 轮后差异落入 $N^{(s-2)}=L$。**与标准证明（例如群论中"轨道平均使元素落在导出列深处"）同构。**
- 收缩 (6.7) 的代价估计 $(h-1)B$：抛弃含 $a$ 的因子（其代价被共轭吸收），其余 $h-1$ 个因子各 $\le B$。每轮度数 $\times h$、代价上界从 $B$ 变 $(h-1)B$ ⇒ 比率 $\times\frac{h-1}{h}$ 几何衰减。
- $c(w_xw_y^{-1})\le c(w_x)+c(w_y)$：需要 $w_x,w_y\in L$（阶段一保证），配合次可加。
- $H$ 是坐标置换群：作用保距（坐标置换是 $\mathcal E$ 的等距），所以拷贝因子 $(\xi_{hx})_{x\in Z}$ 合法（$h$ 等距 ⇒ $h$ 把拷贝映到拷贝）。度数在 $h$-重标记下不变（生成元按 $g\mapsto gh$ 重排）。

**(d) [推测] 候选失败路线：**

- [推测] 若 $H$-轨道内两点不在同一"拷贝轨道"（即没有拷贝因子能同时覆盖），平均仍进行但起点差可能不在 $N$——起点 $w_x=\xi_x$ 的差恒在 $N$（两生成元商），与拷贝无关，稳健。
- [推测] 若 $s=2$：$L=N$，阶段一退化（0 轮），阶段二照常。若有人误设深度 $s-1$，$s=2$ 时 $N^{(-1)}$ 无意义——$s-2$ 是让所有 $s\ge2$ 一致工作的唯一选择。
- [推测] 逐轨道处理的次序依赖"处理一个轨道不增其他轨道的比率"((6.9))；若 $c$ 不共轭不变，(6.9) 的归纳断裂。共轭不变性源于对角共轭度数零 + $M$ 对对角乘法封闭——若 $M$ 只含拷贝因子不含对角，共轭不变性丢失，整个代价控制失败。

### 2.22 Proposition `groups:endpoints`（等端点路径对的组装）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{proposition}\label{groups:endpoints}
> Suppose $q>0$ and $f_i,g_i\in\R^\ell$ satisfy
> \[
>  \|f_i-f_j\|^2=\|a_i-a_j\|^2,\qquad
>  \|g_i-g_j\|^2=q\|a_i-a_j\|^2
>  \quad(1\le i,j\le s),
> \]
> and each $g_i$ is a coordinate permutation of $f_i$.
> For every $\delta>0$ there exist two paths with the same endpoint and
> weights $\lambda>0$ and $\mu\ge0$ such that
> \[
>  \frac{\mu}{\lambda}\le q+s\delta.
> \]
> \end{proposition}"

**(b) 证明机制（逐步）：**

1. 嵌入 $\R^\ell\hookrightarrow\mathcal E$；取 $H$ = $\R^\ell$ 的全坐标置换群（对余下坐标平凡作用）；$Z$ = $\{f_i\}\cup\{g_i\}$ 的 $H$-轨道之并。$Z$ 有限；$g_i$ 与 $f_i$ 同轨道（坐标置换！），且 $H$ 限制在各轨道上传递。
2. Lemma `groups:averaging`（给定 $\delta$）给 $w\in K^Z$，度数 $m>0$，同轨道差 ∈ $L$、代价 $\le\delta m$。
3. **两条路径与权重。** 把 $w$ 的表达式限制到标签 $f_i$：得端点 $D_+=(w_{f_i})_{i=1}^s$ 的路径，权重 $m$（所有 $|H|$ 型因子逐坐标作用，$w_{f_i}$ 的"每个因子"是某个 $(\xi_{hx})_{x\in Z}$ 的第 $f_i$ 坐标 $\xi_{hf_i}$）。这些因子的权重为何是 $m$ 而非别的？——关键：限制后的因子 $(\xi_{hf_i})_{i=1}^s$ 是一个**拷贝因子**（权重 1）：$h$ 是坐标置换 ⇒ $\|hf_i-hf_j\|^2=\|f_i-f_j\|^2=\|a_i-a_j\|^2$（等距）。每个此类因子权重 1，共 $m$ 个 ⇒ 权重 $m$。对角因子权重 0。
   限制到 $g_i$：因子 $(\xi_{hg_i})_i$ 也是拷贝因子，权重 $q$：$\|hg_i-hg_j\|^2=\|g_i-g_j\|^2=q\|a_i-a_j\|^2$。共 $m$ 个 ⇒ 权重 $qm$。对角因子照旧（"diagonal factors stay diagonal"：$w$ 的对角因子在两处限制都是对角）。
4. **校正。** 对每个 $i$：$r_i=w_{f_i}w_{g_i}^{-1}\in L$，$c(r_i)\le\delta m$（同轨道）。$D_+^{-1}D_-$ 的第 $i$ 分量：
   \[ w_{f_i}^{-1}w_{g_i}=w_{f_i}^{-1}(w_{f_i}w_{g_i}^{-1})^{-1}w_{f_i}=w_{f_i}^{-1}r_i^{-1}w_{f_i}\in L,\quad c\le\delta m. \]
   （共轭不变。）
   Lemma `groups:fractions`（元组成本 $\le\sum_ic_i\le s\delta m$）给出 $u,v\in M$：
   \[ D_+^{-1}D_-=uv^{-1},\qquad \deg u+\deg v\le s\delta m. \]
   ⇒ $D_+u=D_-v$。
5. **权重比。** 两条等端点路径：$D_+$ 路径接 $u$ 的表达式（权重 $m+\deg u$）；$D_-$ 路径接 $v$（权重 $qm+\deg v$）。令 $\lambda=m+a$、$\mu=qm+b$（$a=\deg u$、$b=\deg v$，$a+b\le s\delta m$）：
   \[ \frac{\mu}{\lambda}\le\frac{qm+b}{m}\le q+s\delta. \]

**(c) 机械性理由：**

- 为什么 $H$ 取**全**置换群：只需 $g_i,f_i$ 同轨道（存在某个置换），取全群保证轨道条件与 Lemma `groups:averaging` 的 "$x,y$ same orbit" 匹配；$Z$ 取轨道并保证 $H$-不变。
- $q$ 与 $s\delta$ 的分工：$q$ 是几何残差（来自二阶矩不可为零），$s\delta$ 是端点校正的群论代价；二者都可任意小但都严格正，相加后由 §6 末取 $q<1/(2n)$、$\delta=1/(2sn)$ 使总和 $<1/n$。
- "no bound uniform in $n$"：$m$、$\deg u,v$、$Z$ 的大小都可在 $n$ 之后爆炸——判据对每个 $n$ 单独要求路径对存在。

**(d) [推测] 候选失败路线：**

- [推测] 若 $q=0$（$g_i$ 全部重合），权重 $\mu=qm+b=b\ge0$ 可以是 0，路径退化为对角——命题仍成立（$\mu/\lambda\le s\delta$）；但如果想让它严格供 HJ 使用，$\mu=0$ 也可以（判据允许 $\mu\ge0$）。
- [推测] 若 $g_i$ 只是"f_i 的置换"但**不同 $i$ 的置换不同**——这正是实际情形（每个 $i$ 有自己的置换 $\sigma_i$）；$H$ 全群保证所有 $\sigma_i(f_i)=g_i$ 同轨道即可，无需统一置换。若有人错误假设统一置换，会漏掉一般情形。
- [推测] 若 $D_+^{-1}D_-$ 的分量代价估计漏了因子 $s$：元组成本 $\le\sum_i c_i(g_i)\le s\delta m$——漏掉 $s$ 会把最终界错成 $q+\delta$，§6 末的 $\delta=1/(2sn)$ 就不够小（需 $1/(2n)$），连锁破坏 $\mu/\lambda<1/n$。

### 2.23 充分性的最终组装（§6.3 末，TeX 原文照抄）

> "\begin{proof}[Completion of the sufficiency implication in
> Theorem~\ref{thm:classification}]
> Assume the matrix condition of the theorem. By
> Proposition~\ref{alg:equivalence}, the tensor condition
> \eqref{alg:tensor} holds.
> For every integer $n\ge1$, Lemma~\ref{pairs:two-scale} supplies two
> images as in Proposition~\ref{groups:endpoints} with
> $0<q<1/(2n)$.  Apply that proposition with $\delta=1/(2sn)$.
> It gives equal-endpoint paths whose weight ratio is strictly less than
> $1/n$.  Proposition~\ref{paths:criterion} now implies that $A$ is Ramsey.
> All choices are made after fixing $n$; no bound uniform in $n$ on the
> degrees or the number of coordinates is required.
> \end{proof}"

数值核对：$\mu/\lambda\le q+s\delta<\frac{1}{2n}+s\cdot\frac{1}{2sn}=\frac1n$ ✔（严格，因 $q<1/(2n)$）。

依赖链（充分方向）一览：

```
Theorem thm:classification (⇐)
 ├─ Prop alg:equivalence        (矩阵条件 ⇔ 张量条件)          [§2]
 ├─ Lemma pairs:two-scale       (张量条件 ⇒ 双尺度置换对)      [§4]
 │   ├─ Lemma stencil:finite    (张量 ⇒ 格点权 ν)              [§3]
 │   ├─ Lemma pairs:bump        (光滑函数 b，负部小)           [§4]
 │   └─ Lemma pairs:rational    (卷积 + 有理化 ⇒ μ,ζ,n)        [§4]
 ├─ Prop groups:endpoints       (置换对 ⇒ 等端点路径, 比 ≤ q+sδ) [§6]
 │   ├─ Lemma groups:pairs      (M_ij 群 ⊇ N×N)                [§6]
 │   ├─ Lemma groups:fractions  (右分数演算, N^(s-2) ⊆ L_i)    [§6]
 │   └─ Lemma groups:averaging  (轨道平均, 代价/度数 → 0)      [§6]
 └─ Prop paths:criterion        (等端点小权重比 ⇒ Ramsey)      [§5]
     ├─ Lemma paths:compactness      (E ⇒ 有限维)              [§5]
     ├─ Lemma paths:synchronization  (权重 1/t 预备)           [§5]
     ├─ Lemma paths:corner-group     (βS 幂等角群)             [§5]
     └─ Lemma paths:realization      (超滤子积 ⇒ 串)           [§5]
```

必要性方向：`Prop alg:necessity`（§2.4）单独完成。

---

### 2.24 §7 推论 `cons:spherical`（Ramsey ⇒ 球面）

**(a) 精确陈述：**

> "\begin{corollary}\label{cons:spherical}
> Every finite Euclidean Ramsey set is spherical.
> \end{corollary}"

**(b) 证明机制：** 取主定理的 $P$，令 $H=m_F(P)$（逐项乘）。对 (1.1) 逐项乘：
$(p_i^{\mathsf T}Hp_i)=0$，即 $\|a_i\|^2+\ell\cdot a_i+c=0$，其中 $c=H_{00}$、$\ell_\alpha=H_{0\alpha}+H_{\alpha0}$（注意 $H$ 不必对称，交叉项相加）。球心 $-\ell/2$、平方半径 $\|\ell\|^2/4-c$；半径为正当且仅当存在两个不同点（$s\ge2$ 时正）。"No symmetry of the constant row and column of $H$ is needed"——因为 $\ell$ 用的是 $H_{0\alpha}+H_{\alpha0}$ 的和。

**(c) 机械性理由：** 这就是"乘后条件 = 球面方程"的直接兑现：主定理的 (1.2) 只约束空间块，常数行/列自由度恰好容纳球心与半径参数——这也解释了主定理为什么"不对常数行列单独提条件"：它们是球面参数的载体。

**(d) [推测] 候选失败路线：**[推测] 若 $s=1$（单点），"半径为正"论证失效（单点可视为退化球）；推论单独处理 singleton（"A singleton is spherical"）。[推测] 若 $m_F(P)$ 的空间块是 $I_d$ 而常数行列给出矛盾约束——不可能，(1.1) 乘后自动相容（球面方程有解，因为点确实共球）。[推测] 把此推论当作 EGM-RSS Theorem 13 的新证——它确实是，但依赖主定理（其充分性证明本身不依赖 EGM-RSS 的球面定理，所以逻辑上无循环；不过必须确认主定理证明没用"Ramsey ⇒ 球面"作为引理——检查依赖链：没有用到，安全）。

### 2.25 Corollary `cons:transitive`（subtransitive ⇒ Ramsey）

**(a) 精确陈述：**

> "\begin{corollary}\label{cons:transitive}
> Every nonempty subset of a finite transitive Euclidean set is Ramsey.
> \end{corollary}"

**(b) 证明机制（逐步）：**

1. 单点平凡。设 $A=\{a_i\}_{i=1}^s\subset\R^d$ 仿射张成 $\R^d$，等距嵌入 $a_i\mapsto y_i\in Y$（$Y\subset\R^n$ 有限传递集，$H$ = 其等距置换群）。
2. 对每个 $h\in H$、每个坐标 $j\in\{1..n\}$：$a_i\mapsto(h(y_i))_j$ 是 $a\mapsto v+a\cdot u$ 型仿射函数，系数行 $w_{hj}\in W$，$e_i(w_{hj})=(h(y_i))_j$。$n$ 行的梯度 Gram $=\sum_ju_ju_j^{\mathsf T}=I_d$（因为 $a_i\mapsto(h(y_i))_j$ 整体是 $a_i\mapsto h(y_i)$ 的各坐标切片，$a_i\mapsto h(y_i)$ 是等距嵌入……准确：$a_i\mapsto h(y_i)$ 是从 $\operatorname{span}(A)$ 到 $\R^n$ 的等距，其坐标行 Gram 为 $I_d$）。
3. 常数行 $c_{hj}=((h(y_1))_j,0)\in W$。构造**对称有理张量**（有理：$\frac1{|H|}$ 是有理数！）：
   \[ T=\frac1{|H|}\sum_{h\in H}\sum_{j=1}^n\bigl(w_{hj}\otimes w_{hj}-c_{hj}\otimes c_{hj}\bigr). \]
   $G(T)=I_d$（$c_{hj}$ 梯度为零；$\frac1{|H|}\sum_h(\text{等距的 Gram})=\frac1{|H|}\cdot|H|\cdot I_d$）。
4. 求值相消：传递性 ⇒ 对每个 $i$，多重集 $(h(y_i))_{h\in H}$ 以相同重数 $|H|/|Y|$ 含 $Y$ 每点 ⇒
   \[ \sum_{h,j}(h(y_i))_j\otimes(h(y_i))_j=\sum_{h,j}(h(y_1))_j\otimes(h(y_1))_j \quad(\text{对每个 }i\text{ 相同}), \]
   减去常数行部分后 $(e_i\otimes e_i)(T)=0$ 对所有 $i$（包括 $i=1$：$i=1$ 时 $w_{hj}$ 求值 $(h(y_1))_j$ 与 $c_{hj}$ 求值相同，但恒等式对齐后各 $i$ 一致——核对：$(e_i\otimes e_i)(T)=\frac1{|H|}\sum_{h,j}[(h(y_i))_j\otimes(h(y_i))_j-((h(y_1))_j)\otimes((h(y_1))_j)]$。当 $i=1$ 显式为零；一般 $i$ 由传递性等于 $i=1$ 的值。✔）
5. 用 Prop `alg:equivalence` + 主定理 ⇒ Ramsey。

**(c) 机械性理由：**

- 这是 LRW"传递 ⇒ Ramsey"（充分方向）的**新证**：不再经 Hales–Jewett 块集，而是直接给出显式张量证书。$1/|H|$ 的有理性：$|H|$ 是正整数，$\Q$ 中可除——这是把"平均"写进张量的唯一非整数系数，且它是**精确有理**的，故合法。
- 对称性：$w\otimes w-c\otimes c$ 已对称，无需对称化。
- "singletons immediate"：$s=1$ 不满足 $s\ge2$ 前提。

**(d) [推测] 候选失败路线：**

- [推测] 若 $A$ 在 $Y$ 中的像是**非等距**嵌入（只保部分距离），$w_{hj}$ 的 Gram 不是 $I_d$，证书失效。subtransitive 的定义（isometric subset）正是为此。
- [推测] 若 $Y$ 传递但 $A$ 的像的坐标域与 $Y$ 不同——不影响，$T$ 的系数是实系数有理组合……$T\in W\otimes_\Q W$ 只要求 $\frac1{|H|}$ 有理，$w_{hj}$ 可任意实。✔
- [推测] 若 $|H|/|Y|$ 不整除……多重集论证只需重数相等（都 $=|H|/|Y|$），无需整除性意义上的整——重数是 $|H|/|Y|$ 次出现次数，必为整数（轨道-稳定子），✔。

### 2.26 Proposition `cons:quadratic`（二次插值充分条件）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{proposition}\label{cons:quadratic}
> Let $A=\{a_1,\ldots,a_s\}\subset\R^d$ be spherical and affinely
> span $\R^d$. Put $p_i=(1,a_i)^{\mathsf T}$ and let $F$ be its
> coordinate field. If the $s$ row vectors
> \[
>  (p_{i\alpha}p_{i\beta})_{0\le\alpha,\beta\le d}
>  \quad(1\le i\le s)
> \]
> are linearly independent over $F$, then $A$ is Ramsey.
> \end{proposition}"

语义：二次多项式求值泛函（在 $A$ 上）是单射 ⇔ 可在 $A$ 上**插值**任意二次数据。

**(b) 证明机制（逐步）：**

1. $N=(d+1)^2$。球面性给出实矩阵（球面方程的系数矩阵，空间块 $I_d$）在诸 $p_i$ 处二次值零——这些要求是 $F$ 上的线性系统，实解存在 ⇒（Gaussian 消元不换域）$F$-解存在，记 $h\in F^N$（写成向量）。
2. 张量求值矩阵 $D\in\operatorname{Mat}_{s\times N}(B)$：$D_{i,(\alpha,\beta)}=p_{i\alpha}\otimes p_{i\beta}$。把 $h$ 提升 $b=h\otimes1\in B^N$。则 $Db\in B^s$ 是"张量级误差"（各分量 $(p_i\otimes1)^TP(1\otimes p_i)$ 型），一般非零；但 $m_F(D)h=0$（乘后为零——球面方程精确成立）。
3. 行独立 ⇒ $D$ 的行秩为 $s$（在 $B$ 上？注意 $D$ 的行独立是 $F$ 上二次求值行独立假设 ⇒ 存在 $s$ 列使 $s\times s$ 子矩阵 $M$ 满足 $\delta=m_F(\det M)\ne0$）。
   为什么行独立（$F$ 上）给出 $F$ 上满秩的列选择：二次求值矩阵 $m_F(D)\in\operatorname{Mat}_{s\times N}(F)$ 行独立 ⇒ 某些 $s$ 列构成的 $s\times s$ 子式非零（$F$ 上秩 $s$）⇒ $\delta=m_F(\det M)\ne0$。取这些列。
4. **伴随恒等式消误差**（核心一步）：
   \[ z=(\det M)\,b-\iota\operatorname{adj}(M)\,Db\in\ker D, \]
   其中 $\iota:B^s\to B^N$ 把向量插入所选列坐标。核对：$Dz=(\det M)Db-D\iota\operatorname{adj}(M)Db$；$D\iota=M$（所选列上的子矩阵），故 $D\iota\operatorname{adj}(M)=M\operatorname{adj}(M)=(\det M)I_s$ ⇒ $Dz=(\det M)Db-(\det M)Db=0$ ✔。
   "Multiplying by $\det M$ allows us to cancel the tensor evaluation error $Db$ through the selected columns: ... This argument does not require $\det M$ to be a unit of $B$."——关键：不除法！$\det M\in B$ 可能是零因子/非单位，用伴随恒等式避免求逆。
5. $m_F(z)=(\det M)h-\iota\operatorname{adj}(M)\,m_F(D)\,h$……$m_F(D)h=0$ ⇒ $m_F(z)=\delta h$（乘后空间块：$z$ 的空间块乘后 $=\delta I_d$？核对：$m_F(z)=\delta h$，而 $h$ 的空间块乘后是 $I_d$（球面方程的 $F$-解空间块恰为 $I_d$——$h$ 是"实矩阵空间块 $I_d$ 的 $F$-化"）⇒ $z$ 的乘后空间块 $=\delta I_d$。
   故 $P=(\delta^{-1}\otimes1)\,z$（$\delta\in F^\times$，域内可逆）满足 (1.1)（$z\in\ker D$）与 (1.2)（乘后空间块 $\delta^{-1}\cdot\delta I_d=I_d$）✔。

**(c) 机械性理由：**

- 行独立假设 = "二次多项式可在 $A$ 上任意插值"：由 Lagrange 型构造（见下一推论的五点乘积多项式），这是把"球面方程的 $F$-解"提升为"张量级解"的一般机制。
- $b=h\otimes1$ 的"误差" $Db$：分量形如 $\sum_{\alpha\beta}h_{\alpha\beta}(p_{i\alpha}\otimes p_{i\beta})$，乘后为零（球面方程）但张量级非零。伴随技巧在所选 $s$ 列上**用 $\det M$ 的乘法**吸收误差——本质是"以行列式为代价换取消元"，域中 $\delta^{-1}$ 最后消掉行列式因子。
- [批注] 这个证明模式（在 $\ker D$ 中找乘后像为标量倍 $h$ 的元素）是"从乘后解到张量解"的一般 lift 路线，与 §2.1 方向二的"降环"互补。

**(d) [推测] 候选失败路线：**

- [推测] 若二次求值行**相关**（如圆上 $\ge6$ 个点：二次函数空间维数 $(3)^2=9$……圆上 $s=6$ 时行秩 $\le6$ 仍可能独立；失败的真实场景是行相关，例如共线多点：$p_ip_i^{\mathsf T}$ 行在直线上必相关）。失败机制：找不到 $\det M$ 非零的子矩阵，消元不能进行——但不代表集合不 Ramsey，只是该充分条件不适用。
- [推测] 若 $\delta=m_F(\det M)=0$（$\det M$ 是 $B$ 的非零零因子且乘后为零）：伴随论证给出 $m_F(z)=0$ 而非 $\delta h$，无法缩放回 $I_d$。这就是"不要求 $\det M$ 是单位"但仍要求 $m_F(\det M)\ne0$ 的原因。
- [推测] 若 $A$ 球面但仿射张成不满（$d$ 虚高）：$h$ 的空间块 $I_d$ 的"实矩阵空间块 $I_d$"这步要求 $d$ = 仿射维数（否则空间块约束空转）。

### 2.27 Corollary `cons:quadrilateral`（圆上至多五点）

**(a) 精确陈述：**

> "\begin{corollary}\label{cons:quadrilateral}
> Every nonempty set of at most five distinct points on a circle is Ramsey.
> In particular, every cyclic quadrilateral is Ramsey.
> \end{corollary}"

**(b) 证明机制（逐步）：**

1. 在圆所在平面工作；不足五点则补足为圆上五个不同点。坐标域 $F$ 取五点集的。
2. 对每个点 $a_i$：其余四点分成两对，两对各自决定一条（割）线；取两条线的仿射方程之积。**无三点共线**（圆性质）保证：该二次多项式在其余四点为零（每对线各杀两点）、在 $a_i$ 非零（$a_i$ 不在两条割线上——$a_i$ 在割线上的话三圆点共线，矛盾）。
3. 五个多项式的系数都在 $F$（两线方程系数在 $F$：两点连线方程系数是坐标的有理式——过 $F$ 两点的直线方程系数可在 $F$ 中取：$\det$ 展开式）。缩放使每个多项式在 $a_i$ 取值 1 ⇒ 二次求值到 $F^5$ **满射** ⇒ 五行独立 ⇒ Prop `cons:quadratic` ⇒ 五点集 Ramsey。
4. 五点集的单色拷贝含原集合的拷贝（原集合是五点集的子集，全等拷贝保持子集结构）⇒ 原集合 Ramsey。

**(c) 机械性理由：**

- "至多五点"的来源：二次单项式个数 $(2+1)^2=9$，但圆上点的二次行秩受限于"圆上乘积线"构造，能凑出的独立行数上限是五（五点：每点一个"两割线乘积"构造，五个多项式两两在对方点为零、本点非零 ⇒ 对角化 ⇒ 独立）。六点及以上此构造失效（第 6 点分对后 4 点不够分?——6 点时其余 5 点分两对剩 1 点，乘积多项式在 4 点为零但需在全部 5 个其余点为零才能插值——构造只能杀 4 个）。所以是"五"而不是抽象维数。
- 补足五点：补点的坐标可能扩 $F$——无妨，$F$ 取扩后的（原集合的坐标域 ⊂ 新 $F$；主定理证书对扩域仍有效——[批注：证书对坐标域的依赖：$B$ 随 $F$ 变大，但存在性传递：$B$-解存在 ⇒ 在子域……不对方向。扩域使 $B$ 变大，解存在于大 $B$ 即可，主定理允许任意坐标域。原文直接取"the resulting five-point set"的域。]）。
- [批注] 原文注明：五点乘积线观察与 Pálvölgyi 的 Theorem A.2 证明中的观察相同（"The same observation appears in Pálvölgyi's analysis of derivation obstructions"）——非本文独创，但用于本文框架给出 Ramsey 性（Pálvölgyi 用它做的是障碍分析方向）。

**(d) [推测] 候选失败路线：**

- [推测] 若四点共圆但其中三点共线——不可能（圆与直线交点至多两个）。若"圆"退化成直线（半径无穷）则失败；定义要求真圆。
- [推测] 若试图推广到六点：乘积线构造不够；需要别的插值机制（如加三次函数——但判据只允许二次行，$p_ip_i^{\mathsf T}$ 固定）。这解释了为什么判据对"圆上 6–8 点"留白（Pálvölgyi 的 7 点反例说明至少某些 7 点不行）。
- [推测] 补点若与原点重合（"distinct"破坏）——原文说补成五个**不同**点（圆上无穷多点可选），可控。

### 2.28 Corollary `cons:kites`（超越风筝：非 subtransitive 的 Ramsey 集）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{corollary}\label{cons:kites}
> For every transcendental $a\in(-1,1)$, the cyclic quadrilateral
> \[
>  K_a=\bigl\{(-1,0),(1,0),
>            (a,\sqrt{1-a^2}),(a,-\sqrt{1-a^2})\bigr\}
> \]
> is Ramsey and is not subtransitive.
> \end{corollary}"

**(b) 机制：** Ramsey = Corollary `cons:quadrilateral`（四圆点）。非 subtransitive = Leader–Russell–Walters [Corollary 2, lrw-kites]（文献结果，本文引用）。

**(c) 意义：** 一举否定 (i) LRW 特征猜想的必要性方向（Conjecture A：Ramsey ⇒ subtransitive），(ii) 其 Conjecture 3（该族风筝不 Ramsey）。"$a$ 超越"是 LRW 非 subtransitive 证明的条件（代数 $a$ 的风筝可能 subtransitive——如正方形 $a=0$）。

**(d) [推测] 候选失败路线：**[推测] 若 $a$ 代数（例如 $a=0$ 正方形），LRW 的非嵌入证明可能失效（正方形嵌入自身），推论陈述范围（超越 $a$）不能放宽到全部 $a$。[推测] 若有人试图从"非 subtransitive"反推"不 Ramsey"（旧猜想直觉），本推论正是反例屏障：必要方向的否定是本文三大新闻之一。[推测] $K_a$ 的坐标域含 $\sqrt{1-a^2}$（$a$ 超越时是 $F=\Q(a,\sqrt{1-a^2})$ 的超越二次扩张），判据在该域上工作——若误用 $\Q(a)$ 会漏坐标，证书不存在。

### 2.29 Proposition `cons:nine`（九个代数独立圆点不 Ramsey）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{proposition}\label{cons:nine}
> Let $t_1,\ldots,t_9$ be algebraically independent real numbers over
> $\Q$. The nine points
> \[
>  a_i=\left(\frac{1-t_i^2}{1+t_i^2},
>                 \frac{2t_i}{1+t_i^2}\right),\qquad 1\le i\le9,
> \]
> form a spherical set that is not Ramsey.
> \end{proposition}"

**(b) 证明机制（逐步）：**

1. 参数化在单位圆上、单射（$t_i=(a_i)_2/(1+(a_i)_1)$，注意 $1+(a_i)_1=\frac{2}{1+t_i^2}\ne0$）。九点互异、仿射张成 $\R^2$、坐标域 $F=\Q(t_1,\ldots,t_9)$。
2. 代数独立 ⇒ $F$ 同构于有理函数域 $\Q(T_1,\ldots,T_9)$ ⇒
   \[ B=F\otimes_\Q F\ \cong\ \text{$\Q[T,U]$ 对"$T$-非零多项式与 $U$-非零多项式"的局部化}, \]
   特别 $B$ 是**整环**，嵌入 $\Q(T,U)=\Q(T_1..T_9,U_1..U_9)$。
3. 张量求值方程组（九个）的系数矩阵 $D$，行 $(p_\alpha(T_i)p_\beta(U_i))_{0\le\alpha,\beta\le2}$（$p(t)=(1,\frac{1-t^2}{1+t^2},\frac{2t}{1+t^2})^{\mathsf T}$，注意两份变量 $T_i$（左因子）与 $U_i$（右因子）——因为 $B$ 中左 $F$ 变量是 $T$、右是 $U$）。
4. $\det D\ne0$：**特判网格**。把九对 $(T_i,U_i)$ 特判到 $\{0,1,-1\}^2$（按 $0,1,-1$ 序排列九个格点）。所有分母（$1+t^2$ 型）非零。特判后矩阵 = Kronecker 积 $C\otimes C$，其中
   \[ C=\begin{pmatrix}1&1&0\\1&0&1\\1&0&-1\end{pmatrix},\qquad\det C=2. \]
   （$C$ 的三行对应 $t\in\{0,1,-1\}$ 的 $p_\alpha(t)$：$p(0)=(1,1,0)$、$p(1)=(1,0,1)$、$p(-1)=(1,0,-1)$——正是"常数、$x$、$y$"型行。）$\det(C\otimes C)=(\det C)^3(\det C)^3=2^6=64\ne0$。
   因此 $\det D$（作为 $\Q(T,U)$ 的元素）在非零特判点取值 64 ⇒ $\det D\ne0$。原文强调："This evaluates the specific determinant expression; no specialization of the entire localized ring $B$ is asserted."（只对行列式这一个多项式表达式做特判，合法；$B$ 整体没有特判同态。）
5. 故 $D\,\mathrm{vec}(P)=0$ 在分式域上只有零解；$B$ 嵌入分式域 ⇒ 在 $B$ 上也只有零解。零矩阵没有乘后空间块 $I_2$ ⇒ 判据（必要性方向）失效 ⇒ 不 Ramsey。

**(c) 机械性理由：**

- 为什么是 **9** 点：$F=\Q(t_1..t_9)$ 的超越次数 9；二次单项式个数 $(2+1)^2=9$；张量求值矩阵是 $9\times9$ 方阵，独立参数让行列式成为"真"多项式而非恒等。若参数更少，行数 > 超越次数，行列式必为 0（行相关）。
- 特判网格 $\{0,1,-1\}^2$：选 $t$ 值使 $p(t)$ 行成 "$C$"——可逆的具体数值矩阵。0,1,-1 的选择使 $(1-t^2)/(1+t^2)$ 与 $2t/(1+t^2)$ 取简单值 $(1,0),(0,1),(0,-1)$。
- 球面但非 Ramsey：与 Corollary `cons:spherical` 合起来展示"球面 ⇏ Ramsey"（Pálvölgyi 七点反例之外的独立、直接证据；且论文说明该非 Ramsey 结论可由 Pálvölgyi Theorem A.3 的泛型七点主张取子集导出——本文给直接证明）。

**(d) [推测] 候选失败路线：**

- [推测] 若把 $B$ 整体特判（比如 $T_i\mapsto U_i\mapsto$ 具体数），会踩"局部化环无剩余特判同态"的坑（$B$ 的非零元 $T_1-T_2$ 在特判下可为零）；论文的"只特判行列式表达式"是严格性关键。
- [推测] 若参数换成代数相关的（如 $t_i$ 是同一参数的多项式），$B$ 不再是"双变量局部化"，$\det D$ 的独立论证失效；实际结论可能翻转（某些相关参数配置可能 Ramsey）。
- [推测] 若点数取 10：$D$ 是 $10\times9$ 长方阵（行多于列？不——行 = 点数 $s=10$，列 = $9$；$\ker D$ 维数 $\ge1$ **必然**非平凡？不：$D\,\mathrm{vec}(P)=0$ 有非零解不代表有"空间块 $I_2$"的解——但求核更难控制。论文选 9 是让矩阵**方**而可逆，论证最干净）。

### 2.30 Proposition `cons:twelve`（三个旋转方块，Liouville 常数，导子障碍）

**(a) 精确陈述（TeX 原文逐字）：**

> "\begin{proposition}\label{cons:twelve}
> Set
> \[
>  t=\sum_{m=1}^{\infty}10^{-m!},\qquad
>  u=\frac{1-t^2}{1+t^2},\qquad v=\frac{2t}{1+t^2},
>  \qquad Q_0=\{(\pm1,0),(0,\pm1)\},
> \]
> and define
> \[
>  R_+=\begin{pmatrix}u&-v\\v&u\end{pmatrix},\qquad
>  R_-=\begin{pmatrix}u&v\\-v&u\end{pmatrix},\qquad
>  X=R_+Q_0\cup R_-Q_0\cup Q_0.
> \]
> Then $X$ is a twelve-point subset of the unit circle that is not Ramsey.
> \end{proposition}"

**(b) 证明机制（逐步）：**

1. **$t$ 是超越数**（Liouville 逼近论证）：部分和 $t_m=p_m/q_m$，$q_m=10^{m!}$，$0<t-t_m<2q_m^{-(m+1)}$（$m\ge2$；尾和 $\sum_{k>m}10^{-k!}\le2\cdot10^{-(m+1)!}$，与 $q_m^{-(m+1)}=10^{-(m+1)m!}$ 比较：$(m+1)!=(m+1)m!$ ✔）。若 $t$ 有 $d$ 次极小多项式 $P\in\Z[T]$：$P(t_m)\ne0$、$|P(t_m)|\ge q_m^{-d}$（代数数下界：$|P(t_m)|=|P(t_m)-P(t)|/1\cdot$ 有理数分母……标准 Liouville：$|P(t_m)|\ge1/q_m^d$）；$|P'|\le C$ 于 $[0,1]$ 给 $|P(t_m)|\le2C(t-t_m)<2Cq_m^{-(m+1)}$；比较 $q_m^{-d}<2Cq_m^{-(m+1)}$，$m$ 大时矛盾。同时 $0.11<t<0.12$（首项 $10^{-1}+10^{-2}+\cdots$ 界定）。
2. **三块不交**：$R_\pm$ 是角 $\pm\theta$（$\theta=2\arctan t$，$0<\theta<\pi/4$）的旋转。三块两两夹角差 $\in\{\theta,-\theta,2\theta\}$，均 $\ne0\ (\mathrm{mod}\ \pi/2)$ 且 $<\pi/2$ ⇒ 十二点互异。单位圆上；$Q_0$ 已仿射张成平面。
3. **坐标域 $F=\Q(t)$**：坐标含 $u,v$，且 $t=v/(1+u)$ 可回收。
4. **导子**：$\partial=\frac{1+t^2}{2}\frac{d}{dt}$，$\partial u=-v$、$\partial v=u$（旋转结构常数化）。标注 $x_{\epsilon,q}=R_\epsilon q$，权重 $\beta_{+,q}=\beta_{-,q}=1$、$\beta_{0,q}=-2$。**三个增广矩恒等式** (7.4)：
   \[ \sum_i\beta_ip_ip_i^{\mathsf T}=0,\qquad
      \sum_i\beta_i(\partial p_i)p_i^{\mathsf T}=0,\qquad
      \sum_i\beta_i(\partial p_i)(\partial p_i)^{\mathsf T}=\begin{pmatrix}0&0\\0&4I_2\end{pmatrix}. \]
   验证原料：$\sum_{q\in Q_0}q=0$、$\sum_{q\in Q_0}qq^{\mathsf T}=2I_2$；$\partial R_+=R_+J$、$\partial R_-=-R_-J$、$\partial R_0=0$（$J=\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}$）。
   - 第一式：$\sum_\epsilon\beta_\epsilon R_\epsilon(\sum_q qq^{\mathsf T})R_\epsilon^{\mathsf T}+\beta$ 的标量部分 $=2(I_2\cdot2I_2\cdot I_2)-2(2I_2)=4I_2-4I_2=0$（常数项部分 $\sum\beta_i=1+1-2=0$、向量部分 $\sum\beta_iR_\epsilon(\sum q)=0$）。原文："The constant and vector entries vanish by the same square symmetries."
   - 第二式（混合矩）：$\sum_i\beta_i(\partial R_\epsilon q)q^{\mathsf T}$ 型 = $(R_+J)\cdot2I_2-(R_+J)\cdot2I_2$？原文："the mixed moment is $2J-2J=0$"（配 $\partial R_+=R_+J$、$\partial R_-=-R_-J$ 与 $\beta_{+}=\beta_{-}=1$、$\beta_0=-2$ 及 $R_\pm$ 单位性）。第一空间矩："The first spatial moment is $2(1+1-2)I_2=0$"。
   - 第三式：$\sum_\epsilon\beta_\epsilon(\partial R_\epsilon)(\partial R_\epsilon)^{\mathsf T}$ 的空间块 $=(R_+J)(R_+J)^{\mathsf T}\cdot1+(-R_-J)(-R_-J)^{\mathsf T}\cdot1+0=JJ^{\mathsf T}+JJ^{\mathsf T}=2I_2$？原文说 $4I_2$——"the derivative moment is $2I_2+2I_2=4I_2$"：$(R_\pm J)(R_\pm J)^{\mathsf T}=R_\pm JJ^{\mathsf T}R_\pm^{\mathsf T}=I_2$？$JJ^{\mathsf T}=I_2$，那每块是 $I_2$，$1+1+0=2I_2$。原文 $2I_2+2I_2=4I_2$——因为 $\sum_q(\partial R_\epsilon q)(\partial R_\epsilon q)^{\mathsf T}=(\partial R_\epsilon)(\sum_q qq^{\mathsf T})(\partial R_\epsilon)^{\mathsf T}=(\partial R_\epsilon)(2I_2)(\partial R_\epsilon)^{\mathsf T}=2(\partial R_\epsilon)(\partial R_\epsilon)^{\mathsf T}=2I_2$，两块相加 $4I_2$ ✔（$Q_0$ 的 $2I_2$ 因子在前面）。
5. **导子障碍（核心）**：定义 $\Q$-线性 $\Phi:F\otimes_\Q F\to F$，$\Phi(a\otimes b)=(\partial a)(\partial b)$。对任意 $P\in\operatorname{Mat}_3(B)$：
   \begin{equation}(7.5)\quad \sum_i\beta_i\Phi\bigl((p_i\otimes1)^{\mathsf T}P(1\otimes p_i)\bigr)=4\sum_{\alpha=1}^2m_F(P_{\alpha\alpha}).\end{equation}
   证明（展开纯张量 $P_{\alpha\beta}=a\otimes b$）：$\Phi((p_{i\alpha}a)(p_{i\beta}b))=\partial(p_{i\alpha}a)\partial(p_{i\beta}b)=a\,b\,(\partial p_{i\alpha})(\partial p_{i\beta})+a(\partial b)p_{i\alpha}(\partial p_{i\beta})+(\partial a)bp_{i\beta}(\partial p_{i\alpha})+(\partial a)(\partial b)p_{i\alpha}p_{i\beta}$。
   带 $\beta_i$ 求和：
   - $(\partial a)(\partial b)\sum_i\beta_ip_{i\alpha}p_{i\beta}=0$（第一矩）；
   - $a(\partial b)\sum_i\beta_ip_{i\alpha}(\partial p_{i\beta})=0$（第二矩的转置/分量）；
   - $(\partial a)b\sum_i\beta_i(\partial p_{i\alpha})p_{i\beta}=0$（第二矩）；
   - 剩 $ab\sum_i\beta_i(\partial p_{i\alpha})(\partial p_{i\beta})$：第三矩给出 $\alpha=\beta\in\{1,2\}$ 时 $4\delta_{\alpha\beta}$、其余 0 ⇒ 总和 $4\sum_{\alpha=1}^2m_F(P_{\alpha\alpha})$ ✔。
6. **矛盾**：若 $P$ 满足判据 (1.1)（各求值为零，$\Phi$ 线性 ⇒ 左和为零）且 (1.2)（$\alpha=1,2$ 对角乘后 $=1$，右和 $=4\cdot2=8$）。$0=8$ 矛盾 ⇒ 不 Ramsey。

**(c) 机械性理由：**

- 为什么用 Liouville 常数而不取任意超越数：需要 $\theta=2\arctan t$ 足够小使三块不交（$0<\theta<\pi/4$ ⇔ $0<t<\tan(\pi/8)\approx0.4142$；Liouville 常数 $\approx0.110001$ 满足且超越性有初等证明）。任意足够小超越数亦可，Liouville 是现成例子（原文引 liouville1851）。
- 导子 $\partial=\frac{1+t^2}{2}\frac{d}{dt}$ 的规范：使 $\partial u=-v,\partial v=u$（$\partial$ 在"圆旋转参数化"上是角变导），$\partial R_\pm=\pm R_\pm J$ 的整齐形式依赖此规范。
- (7.5) 的结构意义：$\Phi$ 是"乘后环上的另一个泛函"，它与 $m_F$ 不同；判据的解要同时被 $\Phi$-加权求和杀死（左端）与被 $m_F$ 固定（右端 $\ne0$）——不相容。这是 Pálvölgyi 导子障碍（his heptagon construction）的十二点版本，但论文强调 "the calculation below is independent of that proof"。
- 权重 $\beta=(1,1,-2)$：三块旋转对称性的特征权重（$Q_0$ 自身对称、两旋转块权重 1），使三个矩恒等式同时成立——权重是解"矩方程组"的未知量。

**(d) [推测] 候选失败路线：**

- [推测] 若三块有重合（$t$ 大到 $\theta=\pi/4$ 或 $2\theta\equiv0\ \mathrm{mod}\ \pi/2$），点数 $<12$，矩恒等式的常数 $4I_2$ 会变化，(7.5) 右端与"对角乘后"的匹配可能破坏——障碍不再成立，集合可能 Ramsey（如 $t=0$ 时三块合一，$X=Q_0$ 是正方形顶点集，transitive ⇒ Ramsey！）。障碍的成立范围对 $t$ 敏感。
- [推测] 若 $t$ 取代数数：$F=\Q(t)$ 是数域，$\partial=\frac{d}{dt}$ 在数域上**不存在**（数域到自身的导子只有零导子——代数元上 $\partial(\text{代数关系})$ 强制 $\partial t=0$），整个导子机制失效。$t$ 的超越性是障碍存在的先决条件。
- [推测] 若 $\beta$ 权重取别的（如 $(1,1,-1)$），$\sum\beta_i=0$ 不再成立（$1+1-1=1$），第一矩不消；(7.5) 左端出现多余项，无法归零。权重必须解"三矩同时为零（除第三矩空间块）"的线性系统，$(1,1,-2)$ 是其解。

### 2.31 §7 与主线的关系小结

- 正例构造（`cons:transitive`、`cons:quadratic`、`cons:quadrilateral`）全部是"造张量证书"，用主定理充分方向；不新增 Ramsey 构造机器（原文："These consequences are proved after the classification and require no further Ramsey construction."）。
- 反例（`cons:nine`、`cons:twelve`）用主定理**必要**方向：造出"判据无解"的代数证明。
- `cons:kites` 是两者的合流：正例（圆上四点）+ 文献负结果（非 subtransitive）⇒ 修正 LRW 猜想版图。

---

## 三、Lean 取证（形式化精读，占素材约 40%）

**取证来源**：`E:\math\lean\formalization.yaml` 第 1150–1152 行：

```yaml
    - comparator_config: ComparatorChallenges/EuclideanRamsey.json
      declaration: OAI.EuclideanRamsey.classification
      file: OAI/Combinatorics/EuclideanRamsey/Main.lean
```

`E:\math\lean\ComparatorChallenges\EuclideanRamsey.json`：

```json
{
  "challenge_module": "ComparatorChallenges.EuclideanRamsey",
  "solution_module": "OAI.Combinatorics.EuclideanRamsey.Main",
  "theorem_names": ["OAI.EuclideanRamsey.classification"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false
}
```

**permitted axioms**：仅 `propext`（命题外延性）、`Quot.sound`（商的类型论公理）、`Classical.choice`（选择公理）——即标准 Mathlib 三公理，无附加公理、无 `sorry` 声明的合法性依赖（本节引用的所有定理均有完整证明体）。ZFC 论断（论文 §1.3 末 "All arguments take place in ZFC"）在 Lean 侧对应为：只依赖 choice + 类型论基础。

模块规模：`E:\math\lean\OAI\Combinatorics\EuclideanRamsey\` 下 **46 个 .lean 文件、共 8620 行**（`wc -l` 统计）。

### 3.1 定义层（Model.lean，全文 46 行，逐行对应论文 §1.1）

Lean 源码（关键定义照抄）：

```lean
abbrev Space (d : ℕ) := EuclideanSpace ℝ (Fin d)

def Congruent {s d D : ℕ} (a : Fin s → Space d) (b : Fin s → Space D) : Prop :=
  ∀ i j, dist (b i) (b j) = dist (a i) (a j)

def Ramsey {s d : ℕ} (a : Fin s → Space d) : Prop :=
  ∀ r : ℕ, 2 ≤ r → ∃ D : ℕ, 1 ≤ D ∧
    ∀ c : Space D → Fin r, ∃ b : Fin s → Space D,
      Congruent a b ∧ ∃ k : Fin r, ∀ i, c (b i) = k

def coordinateField {s d : ℕ} (a : Fin s → Space d) : IntermediateField ℚ ℝ :=
  IntermediateField.adjoin ℚ (Set.range (fun ij : Fin s × Fin d => a ij.1 ij.2))

abbrev Coeff {s d : ℕ} (a : Fin s → Space d) := ↥(coordinateField a)
abbrev TensorRing {s d : ℕ} (a : Fin s → Space d) := Coeff a ⊗[ℚ] Coeff a

def augmented {s d : ℕ} (a : Fin s → Space d) (i : Fin s) : Option (Fin d) → Coeff a
  | none => 1
  | some j => coordinate a i j

def multiply {s d : ℕ} (a : Fin s → Space d) : TensorRing a →ₐ[ℚ] Coeff a :=
  Algebra.TensorProduct.lmul' ℚ

def FieldCriterion {s d : ℕ} (a : Fin s → Space d) : Prop :=
  ∃ P : Matrix (Option (Fin d)) (Option (Fin d)) (TensorRing a),
    (∀ i : Fin s, ∑ α, ∑ β,
      ((augmented a i α) ⊗ₜ[ℚ] (1 : Coeff a)) * P α β *
      ((1 : Coeff a) ⊗ₜ[ℚ] (augmented a i β)) = 0) ∧
    (∀ α β : Fin d, multiply a (P (some α) (some β)) = if α = β then 1 else 0)
```

与论文的对应与差异：

| 论文 | Lean | 差异说明 |
|---|---|---|
| $A=\{a_1,\dots,a_s\}$ | `a : Fin s → Space d` | 点集建模为**带标号族**+单射假设（`Function.Injective a`），而非无序集合 |
| $p_i=(1,a_i)$ | `augmented a i : Option (Fin d) → Coeff a`，`none ↦ 1` | 用 `Option` 编号实现"指标 0 是常数坐标"，与论文 $0..d$ 编号一致 |
| $F=\Q((a_i)_\alpha)$ | `coordinateField a : IntermediateField ℚ ℝ` | Lean 直接取中间域；$F$ 是 `adjoin`，要求坐标确实属于域——自动满足 |
| $B=F\otimes_\Q F$ | `TensorRing a = Coeff a ⊗[ℚ] Coeff a` | 一致；$B$ 的元素用 `TensorProduct`（Mathlib 通用构造） |
| $m_F(x\otimes y)=xy$ | `multiply a = Algebra.TensorProduct.lmul' ℚ` | 一致（`lmul'` 正是张量代数的乘法同态） |
| 判据 (1.1) | `∀ i, ∑ α, ∑ β, (aug α ⊗ 1) * P α β * (1 ⊗ aug β) = 0` | 精确对应 $(p_i\otimes1)^TP(1\otimes p_i)=0$，$B$ 中等号 |
| 判据 (1.2) | `∀ α β : Fin d, multiply a (P (some α) (some β)) = if α = β then 1 else 0` | **注意**：Lean 把 $\delta_{\alpha\beta}$ 展开成 `if α = β then 1 else 0`——对角线为 1、非对角线为 0 都是显式条件；与论文 $m_F(P_{\alpha\beta})=\delta_{\alpha\beta}$ 等价 |
| （论文常数行列无约束） | Lean 同样只约束 `some α, some β` | 一致：`none` 行列不出现在 (1.2) 中 |

Ramsey 谓词的量词链 `∀ r, 2 ≤ r → ∃ D, 1 ≤ D ∧ ∀ c, ∃ b, Congruent a b ∧ ∃ k, ∀ i, c (b i) = k` 与论文定义逐词对应（$\forall r\,\exists D\,\forall c$ 单色全等拷贝）。

**Lean 缺失**：论文的张量表述 $\mathcal T(W)$（flip-对称子空间）与对称张量条件 (2.1) 在 Lean 中**没有**对应物——Lean 的 `RealCriterion`（见下）不要求对称性。这是形式化上的实质简化：对称化（论文 Prop `alg:equivalence` 的方向一）在 Lean 里根本不需要，因为 Lean 从头到尾走**非对称数组**版本。

### 3.2 主定理组装（Main.lean，153 行）

最终定理（照抄）：

```lean
theorem classification {s d : ℕ} (a : Fin s → Space d)
    (hs : 2 ≤ s) (hd : 1 ≤ d) (ha : Function.Injective a)
    (hspan : affineSpan ℝ (Set.range a) = ⊤) :
    Ramsey a ↔ FieldCriterion a :=
  ⟨ramsey_fieldCriterion a (by omega) hspan, fieldCriterion_ramsey a hs hd ha⟩
```

充分方向 `fieldCriterion_ramsey` 的组装（Main.lean 第 28–57 行，照抄关键常数选择）：

```lean
    let η : ℝ := 1/(4*n)
    let δ : ℝ := 1/(4*n*s)
    ...
    obtain ⟨ℓ,hℓ,f,g,hf,hg,hperm⟩ := realCriterion_two_scale a hd (by omega) hreal η hη
    have hq : 0<η/(1+η) := div_pos hη (by linarith)
    obtain ⟨w,lmb,μ,hp,hm,hlmb,hμ,hr⟩ :=
      permutation_equal_endpoints a ha f g (η/(1+η)) δ hq hδ hf hg hperm
    ...
    have he : η+(s:ℝ)*δ=1/(2*n) := by dsimp [η,δ]; field_simp; ring
```

**论文 vs Lean 的常数差异**：论文取 $q<1/(2n)$、$\delta=1/(2sn)$；Lean 取 $\eta=1/(4n)$、$\delta=1/(4ns)$，由 `realCriterion_two_scale` 产生的 $q=\eta/(1+\eta)<\eta$，再 $\eta+s\delta=1/(2n)<1/n$。Lean 的选取使"$q+s\delta<1/n$"变成**等式链**（`he : η + s*δ = 1/(2*n)`），比论文的"$<\frac1{2n}+s\cdot\frac1{2sn}=\frac1n$"更利于 `linarith`。机械性理由：`div_lt_iff₀`、`nlinarith` 对等式化简更友好。

紧性步骤（Main 第 58–67 行）：`finite_coloring_compactness (fun i => FiniteEuclidean.embed d (a i)) r (fun c => paths_monochromatic _ hpaths c)`，然后对任意染色 $c$ 取 `hmono c` 的单色族，距离用 `LinearIsometry.norm_map` 从 $\mathcal E$ 传回 $\R^D$。

**Lean 独有引理 `full_affine_representative`**（Main 第 78–124 行）：论文一句话带过（"choose a congruent representative $A\subset\R^d$ whose affine span is $\R^d$"），Lean 必须显式构造：

```lean
theorem full_affine_representative {s D : ℕ} (a : Fin s → Space D)
    (hs : 2 ≤ s) (ha : Function.Injective a) :
    ∃ d : ℕ,1 ≤ d ∧ ∃ b : Fin s → Space d,Function.Injective b ∧
      Congruent a b ∧ affineSpan ℝ (Set.range b)=⊤
```

构造：差向量张成的子模 `V = span ℝ (range fun i => a i - a i₀)`，取 `stdOrthonormalBasis ℝ V` 的坐标表示 `b i = E (x i)`。证明 $0<\operatorname{finrank}V$ 用了 `s≥2` + 单射（$a_1-a_0\ne0$）。这是"论文一句带过、Lean 必须展开"的典型。

**最终分类的完整版 `classification_nonempty`**（Main 第 128–149 行）：对**任意非空**有限点集（不预设仿射张成）：

```lean
theorem classification_nonempty {s D : ℕ} (a : Fin s → Space D)
    (hs : 0 < s) (ha : Function.Injective a) :
    Ramsey a ↔ s = 1 ∨ ∃ d : ℕ, 1 ≤ d ∧ ∃ b : Fin s → Space d,
      Function.Injective b ∧ Congruent a b ∧ affineSpan ℝ (Set.range b) = ⊤ ∧
      FieldCriterion b
```

即：单点集平凡 Ramsey；$s\ge2$ 时先降到全仿射张成代表再用 `classification`。这是论文主定理"choose a congruent representative"的完整形式化，也顺带证明判据在"同全等类"内不变（`ramsey_congruent_iff`，Congruence.lean）。

### 3.3 模块依赖链（按 import 顺序，实际是一条近乎线性的链）

```
Model (定义)
 └ Congruence (singleton_ramsey, ramsey_congruent_iff, linearIsometry_of_equal_gram, congruent_linearIsometry)
   └ TensorNecessity (floor_coloring_obstruction, exists_separated_functions,
                      separated_copy_sum, ramsey_realCriterion)          [论文 §2 必要性]
     └ TensorDescent (tensorDescent, realCriterion_fieldCriterion,
                      fieldCriterion_realCriterion, ramsey_fieldCriterion) [论文 §2 等价性]
       └ SmoothingKernel (radialBump, exists_radial_smoothing, halfLaplacian) [论文 Lemma pairs:bump 的分析核心]
         └ Hessian (hessianB 运算律)
           └ DifferentialSplitting (split_differential, exists_split_smoothing) [H⊕V 分解乘积 bump]
             └ SmoothingMatrix (exists_small_covariance, compact_smoothing, stencilDifferential) [Lemma pairs:bump]
               └ LatticeMoments (LatticeRing, mass/firstMoment/secondMoment,
                                 jetOne/jetTwo, FiniteLatticeIdentity, quadraticStencil) [论文 §3 代数层]
                 └ Discretization (lattice_riemann, latticeSample)
                   └ RationalConvolution (rationalize_convolution, lattice_riemann_perturb) [Lemma pairs:rational 卷积层]
                     └ StencilConvolution (exists_discrete_smoothing, rational_smoothing) [Lemma pairs:rational]
                       └ AdicLifting (nilpotent exp/log, adic_intersection_lifting,
                                      finite_lattice_identity)               [Lemma stencil:finite]
                         └ TensorPresentation (exists_symmetric_tensor_presentation,
                                               realCriterion_lattice)       [论文 §3 预备]
                           └ SignedRows (integerize_finsupp, normalized_signed_rows) [M μ 整数化+两列表]
                             └ GramCompletion (complete_gram_pair, two_scale_of_signed_rows,
                                               realCriterion_two_scale)     [Lemma pairs:two-scale]
                               └ FiniteEuclidean (FiniteEuclidean = ℕ →₀ ℝ, embed, block, flatten, common_vertex)
                                 └ PathFractions (RightFraction 演算, singleCost, GradedPaths) [Lemma groups:fractions]
                                   └ DerivedFractions (derived_subset_single)  [N^(s-2) ⊆ L_i]
                                     └ PathWords (LetterGroup = FreeGroup FiniteEuclidean, CopyPath, Path,
                                                  unitGraded, unit_pair_inverse, unit_pair_coverage,
                                                  StringFamily)              [§5-6 群/字层]
                                       └ UltrafilterStrings (ultrafilterMonoid, UltraColumn,
                                                             simultaneously_realize, Path.expand) [Lemma paths:realization]
                                         └ PathSynchronization (scaleGroup, synchronize_paths) [Lemma paths:synchronization]
                                           └ CornerGroup (exists_group_corner, Corner, Corner.group) [Lemma paths:corner-group]
                                             └ ColoringCompactness (paths_monochromatic,
                                                                    finite_coloring_compactness) [Prop paths:criterion + 紧性]
                                               └ NormalCost (orbitAverage, NormalCost 结构)
                                                 └ OrbitAveraging (OrbitWords, Evolution, finite_group_averaging) [Lemma groups:averaging]
                                                   └ CorrectionPaths (GradedPaths.maxCost, averaged_equal_endpoints,
                                                                      permutation_equal_endpoints) [Prop groups:endpoints]
                                                     └ Main (fieldCriterion_ramsey, classification,
                                                             full_affine_representative, classification_nonempty)
旁支：
 Quadratic (field_rightInverse, lift_kernel, sphere_field_quadratic,
            quadraticIndependent_fieldCriterion, spherical_quadraticIndependent_ramsey)  → imports Main  [Prop cons:quadratic]
 Transitive (orbit_sum_eq, averaged_realCriterion, isometric_subconfiguration_ramsey,
             subset_of_finite_transitive_ramsey)                                          → imports Main  [Cor cons:transitive]
 TensorSphere (realCriterion_cospherical) [Ramsey ⇒ 球面 的代数核]
 SphereTransport (cospherical_transport)
 Spherical (ramsey_cospherical)                                                            [Cor cons:spherical]
 CircleGeometry/CircleExtension(stereographic, extend_to_five)/CircleInterpolation(secant)/
   CircleRows(quadratic_evaluation_surjective, circle_five_rows_independent)/CircleSpan
 Circle (five_circle_points_ramsey, at_most_five_circle_points_ramsey)                     [Cor cons:quadrilateral]
 NineGridDeterminant (det_E_ne_zero, C = ![![1,1,0],[2,0,2],[2,0,-2]], det_C = 8, det = 8^6)
 IndependentTensor (tensorEmbedding_injective 等，F⊗F → 分式域的嵌入)
 NineRationalDeterminant (det_genericMatrix_ne_zero, det_M_ne_zero)
 NineField (T/U 变量, parameter, coordinateTensorEmbedding)
 NineGeometry (circleConfig, circleConfig_affineSpan, circleConfig_coordinateField)
 NineLinearObstruction (evaluationMatrix, not_fieldCriterion_of_det_ne_zero,
                        not_ramsey_of_det_ne_zero)                                          [Prop cons:nine]
 Nine / NineStatement (nine_circle_configuration，含 literalCircleConfig 字面参数化)      [Prop cons:nine 组装]
```

统计：Main 到 Model 的主链 **28 层 import**（一条线），几何推论与九点反例挂在 `Main`/`TensorDescent` 之上。

### 3.4 必要性方向的 Lean 实现（TensorNecessity.lean，262 行）与论文的逐点差异

**(a) 分离泛函**。论文：在商空间 $\mathcal Y/\operatorname{im}\Phi$ 中扩基、造 $\ell$。Lean：

```lean
theorem separate_arrayMap {s d : ℕ} (a : Fin s → Space d) (h : ¬ RealCriterion a) :
    ∃ ℓ : SeparationSpace s d →ₗ[ℚ] ℝ,
      (∀ P, ℓ (arrayMap a P) = 0) ∧ ℓ (0, 1) = 1
```
其中 `SeparationSpace s d = (Fin s → RealTensor) × Matrix (Fin d) (Fin d) ℝ`——正是论文的 $\mathcal Y$（$\ell_i$ 部分打包成 $(\Fin s\to\R\otimes_\Q\R)$，$L$ 部分是 $\operatorname{Mat}_d(\R)$）。核心一步用 Mathlib 的
`Module.Projective.exists_dual_eq_one ℚ`（投影性 ⇒ 存在 $\Q$-线性泛函把指定非零元映到 1）——**这是"扩基把 $y_0$ 映到 1"的库级封装**。选择公理（`Classical.choice`）经由该定理进入。

**(b) $h_i$ 与两条恒等式**。Lean 的 `exists_separated_functions` 给出
```lean
∃ f : Fin s → ℝ → ℝ, ∃ L : Matrix (Fin d) (Fin d) ℝ →ₗ[ℚ] ℝ,
  L 1 = 1 ∧ (∀ v u, (∑ i, f i (affineEvaluation a i v u)) + L (gradientRankOne u) = 0) ∧
  ∀ x, ∑ i, f i x = 0
```
对应论文的 (2.4)+(2.5) 前半（$h_i(x)=\ell_i(x\otimes x)$ 与 $L$）。`f i x = ℓ (Pi.single i (x ⊗ x), 0)` 正是 $h_i$ 的定义。

**(c) 染色与矛盾**。论文：模 2 区间染色 + "奇整数 vs 误差和 $<1$"。Lean 的 `floor_coloring_obstruction`（照抄）：

```lean
theorem floor_coloring_obstruction {X : Type uPoint} {s : ℕ} (hs : 0 < s)
    (H : Fin s → X → ℝ) (hcancel : ∀ z, ∑ i, H i z = 0)
    (b : Fin s → X)
    (hmono : ∀ i, (fun j : Fin s =>
      (⌊((2 * s + 1 : ℕ) : ℝ) / 2 * H j (b i)⌋ : ZMod (2 * s + 1))) =
      (fun j : Fin s =>
      (⌊((2 * s + 1 : ℕ) : ℝ) / 2 * H j (b ⟨0, hs⟩)⌋ : ZMod (2 * s + 1)))) :
    ∑ i, H i (b i) ≠ -1
```

**差异表**：

| 环节 | 论文 | Lean |
|---|---|---|
| 染色函数 | 点 $z$ 染 $s$ 元组（$H_i(z)\bmod 2$ 落入 $[0,2)$ 的 $K$ 等分区间标签），色数 $K^s$ | 点 $z$ 染 `Fin s → ZMod K`，`color z i = ⌊(K:ℝ)/2 * H i z⌋ mod K`，色数 $K^s$ |
| 矛盾论证 | 同色 ⇒ $H_i(b_i)-H_i(b_1)=2n_i+\varepsilon_i$，误差和为奇整数、绝对值 $<1$ | 同色 ⇒ 两组**下取整**在 `ZMod K` 中相等 ⇒ $K\mid B-A$，而 $0<B-A<K$（`sum_floor_bounds` 给出严格界），矛盾 |
| 结构 | "奇整数"显式 | `$\Z$-整除 + 严格界`；`ZMod.intCast_eq_intCast_iff_dvd_sub` |
| 常数 $K$ | $2s+1$ | `K := 2*s + 1`（相同）；缩放因子 $\times K/2$ 出现在 floor 内，等价于把 $[0,2)$ 分成 $K$ 段 |

数学上两者等价（floor-编码把"区间标签"和"模 2"合并成一个 $\bmod K$ 量），但 Lean 版本更紧凑：一个 `ZMod` 方程替代 $s$ 个实数误差的求和论证。

**(d) 拷贝的和式**。`separated_copy_sum`：$\sum_i\sum_j f_i((t+Qa_i)_j)=-1$，用 `isometryRows`（等距 $Q$ 的行向量）与 $\sum_j u_ju_j^{\mathsf T}=I$（`isometryRows_gram`）——对应论文 $\sum_j u_ju_j^{\mathsf T}=Q^{\mathsf T}Q=I_d$。`congruent_linearIsometry`（Congruence.lean）对应论文"Gram 矩阵相等 ⇒ 线性等距延拓"（极化论证），Lean 里是 `linearIsometry_of_equal_gram`。

**(e) `ramsey_realCriterion`（反证总装）**：从 `¬ RealCriterion a` 出发，取 `hR` 给的 $r=$ 色数 $K^s$（`Fintype.card Colors = K^s`，用 `Nat.one_lt_pow` 证 $2\le$），得 $D$ 与避开染色，单色拷贝 $b$，套 `floor_coloring_obstruction`。**注意 Lean 把 $r$ 的选取显式化**（`obtain ⟨D, hD, hD'⟩ := hR (Fintype.card Colors) hr`），论文则说"there is an integer $r_0$"。

### 3.5 等价性/下降的 Lean 实现（TensorDescent.lean，162 行）——**与论文证明不同的构造**

论文 Prop `alg:equivalence` 方向二（降环）：自由 $B$-模分解 (2.3) + $F$ 上行化简求 $c_{\lambda\mu}$。Lean 的做法（`realCriterion_fieldCriterion`）：

```lean
let F := coordinateField a
let b := Module.Free.chooseBasis F ℝ
obtain ⟨φ, hφ⟩ := Module.Projective.exists_dual_eq_one F (one_ne_zero : (1 : ℝ) ≠ 0)
let δ := tensorDescent F b φ
obtain ⟨P, he, hm⟩ := h
refine ⟨fun α β => δ (P α β), ?_, ?_⟩
```

机制：
1. 取 $\R$ 在 $F$ 上的基 `b`（`Module.Free.chooseBasis`——论文的 $(r_\lambda)$，选择公理第二出场）。
2. 取 $F$-线性 $\varphi:\R\to_F F$、$\varphi(1)=1$（投影性）。
3. `tensorCoordinates F b : (ℝ ⊗[ℚ] ℝ) ≃ₗ[ℚ] (ι × ι →₀ (F ⊗[ℚ] F))`——把 $\R\otimes_\Q\R$ 按"两个基分解"写成 $B$-系数有限支撑函数，即论文分解 (2.3) 的实现（`finsuppTensorFinsupp`）。
4. `coefficientTrace`：$\sum_k \varphi(b_{k.1}b_{k.2})\otimes1\cdot(\cdot)$，即论文的 $P=\sum(c_{\lambda\mu}\otimes1)P^{\lambda\mu}$ 且 **$c_{\lambda\mu}:=\varphi(r_\lambda r_\mu)$**。
5. 关键恒等式（照抄）：
```lean
lemma tensorDescent_sandwich (x y : F) (T : ℝ ⊗[ℚ] ℝ) :
    tensorDescent F b φ (((x : ℝ) ⊗ₜ[ℚ] (1 : ℝ)) * T * ((1 : ℝ) ⊗ₜ[ℚ] (y : ℝ))) =
      (x ⊗ₜ[ℚ] (1 : F)) * tensorDescent F b φ T * ((1 : F) ⊗ₜ[ℚ] y)

lemma tensorDescent_multiply (T : ℝ ⊗[ℚ] ℝ) :
    Algebra.TensorProduct.lmul' ℚ (tensorDescent F b φ T) =
      φ (Algebra.TensorProduct.lmul' ℚ T)
```

**论文 vs Lean 的对应与差异**：论文的"$F$ 上行化简证线性系统相容"被**对偶泛函一步替代**——$\varphi$ 的 $F$-线性性自动给出 $I_d=\sum c_{\lambda\mu}C^{\lambda\mu}$（对恒等式 $I_d=\sum r_\lambda r_\mu C^{\lambda\mu}$ 的条目作用 $\varphi$，$\varphi(1)=1$ 即得）。也就是说：**论文证明里"线性系统在扩域相容 ⇒ 在基域相容"这一步，Lean 根本不做**，因为 $\varphi$ 本身就是该系统的一个 $F$-解的选择器。这是形式化对证明的实质重组（更短、更典范），不是逐行搬运。

反向 `fieldCriterion_realCriterion`：$\varphi'=\mathrm{map}(\iota,\iota):B\to_\Q\R\otimes_\Q\R$（包含映射的张量），把 $B$-解推到实数组解。`RealCriterion` 定义（TensorNecessity.lean）：

```lean
def RealCriterion {s d : ℕ} (a : Fin s → Space d) : Prop :=
  ∃ P : RealArray d, (∀ i, arrayEvaluation a i P = 0) ∧ spatialMultiply P = 1
```
无对称性要求（见 3.1 末尾批注）——**论文中对称张量 $\mathcal T(W)$ 这一层在 Lean 中被完全绕过**：等价性在"非对称数组"层面直接往返成立，对称化只是论文为了把 (2.1) 写成"对称张量"叙述而做的规范化。

### 3.6 有限格点恒等式的 Lean 实现（LatticeMoments + AdicLifting + TensorPresentation）——**无完备化的重构**

论文 Lemma `stencil:finite` 用 $\mathfrak m$-adic 完备化 + 对数坐标 + 平坦性 + 截断。Lean 的对应物 `finite_lattice_identity`（AdicLifting.lean 第 422 行，陈述 `FiniteLatticeIdentity` 在 LatticeMoments.lean）：

```lean
def FiniteLatticeIdentity : Prop :=
  ∀ (k s : ℕ), 1 ≤ k → 1 ≤ s →
    ∀ (Λ : Fin s → AddSubgroup (Lattice k)) (C : Matrix (Fin k) (Fin k) ℚ),
      C.IsSymm → (∀ i, quotientTensor (Λ i) (matrixTensor C) = 0) →
      ∃ ν : LatticeRing k,
        (∀ i, cosetPushforward (Λ i) ν = 0) ∧ mass ν = 0 ∧
        (∀ a, firstMoment ν a = 0) ∧ (∀ a b, secondMoment ν a b = C a b)
```

其中 `Lattice k = Fin k → ℤ`、`LatticeRing k = AddMonoidAlgebra ℚ (Fin k → ℤ)`（群代数 = 论文的 $R=\Q[X^{\pm1}]$，但用**加法**格 $\Z^k$ 写；Laurent 多项式 ↔ 群代数同构）。

**Lean 与论文的技术路线差异**（这是全篇 Lean 取证最大的亮点）：

| 论文步骤 | Lean 实现 |
|---|---|
| $\mathfrak m$-adic 完备化 $\widehat R=\Q[[Z]]$ | **不完成**。只在 `LatticeRing k` 内用幂理想 $I^n$（`augmentationIdeal`）做**模幂运算**；因为只需要精度 3（二次型），一切发生在 $I^{n}/I^{N}$ 有限商里 |
| 形式对数 $Y_j=\log(1+Z_j)$、$X^h=\exp(h\cdot Y)$ | **幂零 exp/log**：`IsNilpotent.exp`（AdicLifting.lean 第 30–90 行的 `nil_exp_*` 引理族），在 $I/I^N$ 内 $\exp,\log$ 是互逆多项式（`nil_exp_eq_one_iff` 等）；`characterLog`、`characterLogHom` 定义格点到幂零元的"对数" |
| $J_i\widehat R=(h\cdot Y)\widehat R$（单位因子消去） | `log_quadratic_mod_coset`：对 `cosetIdeal Λ = (X^h−1 : h∈Λ)`，二次型在商 $I^N/I$ 层面等于线性式理想成员资格（用 `finite_order_log_lifts` 把 $\Z^k$ 生成元的提升做到模 $I^N$ 精度） |
| 平坦性 ⇒ $I\widehat R=\bigcap J_i\widehat R$（引 Stacks Tag 00MB） | `adic_intersection_lifting I cosetIdeals 3`：幂零层次的交提升（AdicLifting.lean 第 240 行），直接给出 $\nu\cdot(\text{陪集理想})\cap I^n$ 的成员；**不引用平坦性**，用 nilpotent 商的显式算术 |
| 截断 $\bmod\ \mathfrak m^3$ 保精确属于 $I$ | `moments_eq_of_sub_mem_cube`：若 $x-y\in I^3$ 则 $x,y$ 的 mass/一阶矩/二阶矩相同（LatticeMoments.lean 第 223 行）——因为矩泛函差被 $I^3$ 吸收（`augmentation_sq_le_jetOne`、`augmentation_cube_le_jetTwo`，jet 理想 `jetOne`,`jetTwo`） |
| 比较系数读出 (2.7) | `quadraticStencil C l`（$\tfrac12Y^{\mathsf T}CY$ 的群代数像）+ `quadraticStencil_moments`：矩恰为 $C$ |

**为什么 Lean 可以不完成**：结论只到二阶矩精度，即模 $I^3$。完备化的全部作用是"让 $\exp/\log$ 收敛"，而在 $I/I^N$ 中 $\exp/\log$ 是**有限多项式**（幂零截断），不需要拓扑。Lean 用 `finite_order_logs`（对每个格点 $\gamma$，$X^\gamma$ 的对数在 $I^N$ 商中良定义且指数回原）实现。这是"论文一句带过、Lean 必须另辟蹊径"的最大实例，也是 Lean 证明比论文初等（无交换代数拓扑/平坦性引用）的地方。论文引用的 Stacks Project Tag 00MB 在 Lean 中无对应物。

**假设对照**：引理前提 `quotientTensor (Λ i) (matrixTensor C) = 0`——$C$ 在商 $(\Q^k/V_i)^{\otimes2}$（Lean: `quotientTensor Λ` = 张量打到 $\Z^k/\Lambda$ 的有理化）为零——精确对应论文的张量假设；`C.IsSymm` 对应对称性（这里 Lean **确实**要 $C$ 对称，因为 `matrixTensor` 在对称代数层面工作）。

### 3.7 光滑/卷积层的 Lean 实现（SmoothingKernel + SmoothingMatrix + DifferentialSplitting + Discretization + RationalConvolution + StencilConvolution）

**(a) bump 函数——与论文完全不同的分析构造。**

论文：Gaussian 混合路径积分 $b_*=\int_0^1\phi_{S+tC}dt$，$D_Cb_*=\phi_{S+C}-\phi_S$，再紧化。

Lean（SmoothingKernel.lean，485 行）：**显式径向 bump**。核心定理（照抄）：

```lean
theorem exists_radial_smoothing (hn : 1 ≤ Module.finrank ℝ E) {η : ℝ} (hη : 0 < η) :
    ∃ b : E → ℝ, ContDiff ℝ (⊤ : ℕ∞) b ∧ HasCompactSupport b ∧
      (∀ x, 0 ≤ b x) ∧ 0 < ∫ x, b x ∂μ ∧
      (∫ x, max (-halfLaplacian b x) 0 * ‖x‖^2 ∂μ) < η * ∫ x, b x ∂μ
```

构造：`radialBump a p x`（径向幂函数 `radialPower a p` 复合），指数 `p = smoothingExponent E < 0`；负部估计 `radialBump_weighted_negative_bound`、积分下界 `radialBump_integral_lower` 都是**显式常数**（`K = μ.real(ball 0 1) * (−p) * d * (d+1)^(d+2)`），参数选取 $\varepsilon=\delta^2$、$\delta=\min(t,1/2)$。`halfLaplacian`（$\Delta/2$）对应论文的 $D_C$ 在 $C=I$ 的情形。

**分解与拼接**（DifferentialSplitting.lean）：`split_differential` 把 $D_C$ 沿 $H\oplus V$ 分解（对应论文 $H=\operatorname{im}U^{\mathsf T}$、$V=\ker U$）：

```lean
secondOperator C ... b x = g (et x).2 * halfLaplacian f (et x).1 +
  t^2*f (et x).1*secondOperator C z g (et x).2
```
即乘积 bump $b=f\otimes g$ 的 $C$-二阶导 = 水平半拉普拉斯（$g$ 加权）+ 垂直项（$\times t^2$）；`scaleVertical t` 把垂直方向放大 $t$ 倍（对应论文的"大 $L$"），让垂直项的贡献稀释。`exists_split_smoothing` 总装出 `CompactSmoothing`（SmoothingMatrix.lean 第 160 行的定义，逐条对应论文 (4.0) 的四条：非负、紧支撑、积分正、负部加权积分 $<\eta\int b$）。

**协方差对**（SmoothingMatrix.lean `exists_small_covariance`）：论文的 $S=\epsilon P_H+LP_V$（正交投影）被 Lean 换成**代数分裂**：

```lean
let R := C * U.transpose        -- U R = 1（右逆）
let Z := 1 - R * U              -- U Z = 0（"核投影"）
-- covariance_splitting: C = R*R.transpose + Z*C*Z.transpose
let ε : ℝ := η / (2 * (d + 1))
let S := R * (ε • 1) * R.transpose + Z * (L • 1) * Z.transpose
-- 结论: S.PosDef ∧ (S+C).PosDef ∧ (U*S*U^T).trace < η
```
Lean 的 $S$ 用斜投影 $Z=1-RU$ 而非正交投影 $P_V$，常数 $\epsilon=\eta/(2(d+1))$ 使 $\tr(USU^{\mathsf T})=\epsilon d<\eta/2$（论文是 $\epsilon\tr(UU^{\mathsf T})<\eta/8$）。`exists_positive_shift C hC` 给 $L$（$C+L\cdot I\succ0$ 的位移，对应论文的"大 $L$ 吸收 $C_{VV}$"）。注意 Lean 这里**没有**用 Schur 补——正定性用 `positive_joint_pushforward`（分裂和的正定性）直接验。

**(b) 卷积与 Riemann 和（Lemma `pairs:rational`）**。

- `exists_discrete_smoothing`（StencilConvolution.lean 第 209 行）：把连续 bump 离散到格（$d_n(\lambda)=n^{2-k}b(\lambda/n)$ 的对应物，Lean 直接以"存在格上函数 $a$ 近似 $b$ 的三个矩 + 负部不等式"陈述），误差用 `lattice_riemann`（Discretization.lean：固定紧集上 Riemann 和收敛）+ `compact_taylor_bound`（Taylor 一致界，对应论文"$O(n^{-1})$ 误差"）。
- `rationalize_convolution`（RationalConvolution.lean 第 133 行）：**有理化**——在有限支撑实函数 $d_n$ 的参数空间中取有理点（对应论文"$\Q^E$ 稠密、开邻域内严格不等式保持"），`rational_vector_strict` 处理严格不等式的有理近似。
- `rational_smoothing`（StencilConvolution.lean 第 266 行）输出 $(n,\mu,\zeta)$：`secondMoment μ j l / n^2 = ζ * C j l`（精确，`secondMoment_mul` 代数）、负部 `∑' δ, max (−μ.coeff δ) 0 * gradientWeight U (latticeSample n δ) < η * ζ`。**注意 Lean 把 (4.3) 写成 `secondMoment/n² = ζ·C`（除法形式），论文写成 $\sum\mu\frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}=\zeta C$（乘法形式）——同物异形。**

**(c) 从 $\mu$ 到两个列表再到几何（SignedRows + GramCompletion）**。

`normalized_signed_rows`（SignedRows.lean）：`integerize_finsupp`（取 $M$ 使 $M\mu\in\Z$——实现为矩阵公分母 `A.den` + floor 映射）后，正部 `positiveCount`、负部 `negativeCount` 转 multiset，`multiset_map_equiv` 给逐 $i$ 的求值多重集等价（$\exists e:m\simeq n,\forall x,\ v(e x)+\sum a_i g(e x)=v x+\sum a_i g x$）——**这是"坐标多重集相等"的 Lean 形态：显式置换 `Equiv.Perm τ`**。

`two_scale_of_signed_rows` + `complete_gram_pair`（GramCompletion.lean）：
- `complete_gram_pair` 对应论文补公共半正定增量：`trace_gram_complement`（$\tr B\le\eta\Rightarrow\eta I-B\succeq0$，经 **Unitary 谱定理** `hB.1.eigenvectorUnitary`——Lean 用 C*-代数式谱分解，论文用"特征值 ≤ 迹"）、`exists_gram_sqrt`（$P=R R^{\mathsf T}$ 的平方根，用 `CFC.sqrt`）、`gram_fromCols`（列拼接 Gram 可加）。
- 终缩放 `c = (Real.sqrt (1+η))⁻¹`，输出两 Gram 恰为 $1$ 与 $(\eta/(1+\eta))\cdot 1$。
- `row_gram_distance`：距离公式 $\|f_i-f_j\|^2=\|a_i-a_j\|^2$ 化为矩阵恒等式 $(U^{\mathsf T}(a_i-a_j))\cdot(U^{\mathsf T}(a_i-a_j))=(a_i-a_j)^{\mathsf T}(UU^{\mathsf T})(a_i-a_j)$。
- `realCriterion_two_scale` 总装（GramCompletion.lean 第 251 行）：从 `RealCriterion` 经 `realCriterion_lattice`（TensorPresentation：提取 $w_j,C,U$，即论文"张量只用有限多个向量"的有限基表示）→ `finite_lattice_identity` → `rational_smoothing` → `two_scale_of_signed_rows`。**注意**：Lean 的 `realCriterion_two_scale` 输出的 $q$ 恰为 $\eta/(1+\eta)$，与论文 Lemma `pairs:two-scale` 的 $q$ 公式一致（这是 Lean 少数与论文常数完全同形的地方）。

### 3.8 路径与群层的 Lean 实现（FiniteEuclidean → ColoringCompactness）

**(a) 环境 $\mathcal E$**：`FiniteEuclidean := ℕ →₀ ℝ`（**Finsupp**，有限支撑函数）——对应论文 $\R^{(\N)}$。`embed d : EuclideanSpace ℝ (Fin d) →ₗᵢ[ℝ] FiniteEuclidean`、`block j`（第 $j$ 个无穷坐标块的等距嵌入，对应论文 $J_j$）、`flatten`（串求和 $\Phi$）、`common_vertex`（距离 $r$ 图连通的"公共顶点"引理——对应论文 Lemma `groups:pairs` 证明中的"$\le2r$ 分段 + 垂直位移"，Lean 版：$\|y-x\|\le2r\Rightarrow\exists w,\|w-x\|=\|w-y\|=r$）。

**(b) 路径**（PathWords.lean）：

```lean
abbrev LetterGroup := FreeGroup FiniteEuclidean
def CopyPath (a : ι → FiniteEuclidean) (u : ℝ) (b : ι → FiniteEuclidean) : Prop :=
  ∀ i j, ‖b i - b j‖^2 = u * ‖a i - a j‖^2
inductive Path (a : ι → FiniteEuclidean) : (ι → LetterGroup) → ℝ → Prop
  | diag (g : LetterGroup) : Path a (fun _ => g) 0
  | copy {u : ℝ} {b : ι → FiniteEuclidean} : CopyPath a u b → Path a (fun i => FreeGroup.of (b i)) u
  | mul {w v lmb μ} : Path a w lmb → Path a v μ → Path a (w*v) (lmb+μ)
```
与论文路径定义一致（对角因子权重 0、拷贝因子权重 $u$、串联权重相加、端点逐坐标乘积）。注意 Lean 的端点是 `ι → LetterGroup`（逐坐标），权重是实数参数——`Path` 是**归纳谓词**（表达式的归纳结构显式），论文是定义性描述。

`unit_pair_inverse`（Lemma `groups:pairs` 的 $(x,y)^{-1}=(x^{-1},x^{-1})(y,x)(y^{-1},y^{-1})$）、`unit_pair_coverage`（任何距离 $r$ 的有序对可扩成拷贝——用 `extend_pair_E`/`common_vertex`/`FiniteEuclidean.extend_pair`）。

**(c) 右分数演算**（PathFractions.lean + DerivedFractions.lean）：`RightFraction`、`singleFractions`、`singleCost`（`sInf`——对应论文 $c_i(g)$ 最小代价，用自然数的良序）、`bounded_tuple_list`（元组成本 $\le\sum c_i$）、`RightFraction.mul_pair`（对坐标乘法规则 (6.2)）、`derived_subset_single`：

```lean
theorem derived_subset_single (N : Subgroup G) [N.Normal] (n : ℕ) :
    ∀ (ι : Type uIndex) [Fintype ι] [DecidableEq ι] (M : Submonoid (ι → G))
      (hd : HasDiagonal M) (_hi : PairInverse M) (_hc : PairCoverage M N),
      Fintype.card ι ≤ n+2 → ∀ i, Derived N n ≤ singleFractions M hd i
```
即 $N^{(s-2)}\subseteq L_i$，参数化为 `card ι ≤ n+2`（$n=s-2$）——**归纳按坐标数**，与论文一致；归纳步用"删去坐标 $j$ 的子类型 $\{l:l\ne j\}$"（Lean 代码中 `κ := {l : ι // l≠j}`），对应论文"投影掉 $j$ 的幺半群满足同样抽象假设"。

**(d) 超滤子层**（UltrafilterStrings.lean + CornerGroup.lean）：
- `exists_group_corner`（CornerGroup.lean 第 30 行）：论文 Lemma `paths:corner-group` 的推广形态——任意非空紧 Hausdorff 右拓扑半群（右平移连续）含幂等 $p$ 使角群存在：

```lean
theorem exists_group_corner {S : Type uSemigroup} [Nonempty S] [Semigroup S]
    [TopologicalSpace S] [CompactSpace S] [T2Space S]
    (hc : ∀ y : S, Continuous (· * y)) :
    ∃ p : S, p*p=p ∧ ∀ y : S, p*y=y → y*p=y →
      ∃ v : S, p*v=v ∧ v*p=v ∧ v*y=p
```
极小闭左理想用 `zorn_superset` + `IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`；幂等元用 `exists_idempotent_in_compact_subsemigroup`（**Mathlib 已有**——论文的 Ellis 引理部分 Lean 直接调库）。`Corner.group` 把角单边逆条件升级成 `Group` 实例。**注意与论文的差异**：论文证明"每个元素有左逆 ⇒ 是群"（$b=b(ay)=(ba)y=y$），Lean 用 `Group.ofLeftAxioms`（左逆 + 左单位 + 结合律 ⇒ 群，Mathlib 标准引理）。
- `simultaneously_realize`（UltrafilterStrings.lean 第 85 行）：论文 Lemma `paths:realization`。Lean 的列类型 `UltraColumn ι M := common (U : Ultrafilter M) | principal (x : ι → M)`——把论文的"第一类/第二类列"做成**归纳类型**，`Realizes` 谓词编码"共同列选同一串 / 主列取指定串"。归纳方向：`List` 上的结构归纳（从左到右）。
- `Path.expand`：路径在 $\Psi:K\toₙ*$ 超滤子半群中的展开——拷贝因子变成 `[.common p, .principal (fun i => FreeMonoid.of (b i)), .common p]`（三个 UltraColumn）——**论文的"两个 $p$ 公共 + 中间主列"在 Lean 里是显式三列**。
- Hales–Jewett：`Combinatorics.Line.exists_mono_in_high_dimension`（Mathlib 的 HJ 定理，`ColoringCompactness.lean` 第 67 行）。**论文引 Shelah 的界但"只用存在性"；Lean 直接用 Mathlib 库版本**（Grid 泛函式陈述）。变量位置数 `t = (Finset.univ.filter (fun j => line.idxFun j = none)).card`，$1\le t\le \mathrm{card}\,\beta+1$。
- 权重同步 `synchronize_paths`（PathSynchronization.lean 第 101 行）：论文的 $\alpha_t$ 区间拼接。Lean 的实现细节不同：先把两条路径**归一化**（`scaleGroup lmb⁻¹`——`FreeGroup.map (fun z => √c • z)`，把权变为 $1$ 与 $\rho$），再对链 $v(j)=\text{if }j<n\text{ then }1/(j+1)\text{ else }\rho$ 用 `synchronized_chain` 一次构造出公共端点 $W$。数学等价（归一化后区间拼 接），组织不同。

**(e) 紧性——与论文证明不同**。论文 Lemma `paths:compactness` 用 Tychonoff 积空间 $\{1,\dots,r\}^{\mathcal E}$。Lean 的 `finite_coloring_compactness`（ColoringCompactness.lean 第 150 行）用**维数上的超滤子极限**：

```lean
let U : Ultrafilter ℕ := Ultrafilter.of Filter.atTop
let C : FiniteEuclidean → Fin r := fun z => ultraColor
  (fun n => c n (FiniteEuclidean.truncate (n+1) z)) U
```
反证：每个维数 $n+1$ 有坏染色 $c_n$；取维数上的超滤子，定义 $\mathcal E$-染色 $C(z)=$"$c_n(\mathrm{trunc}_{n+1}z)$ 的 $U$-极限"；假设给的单色拷贝 $b$ 在几乎所有 $n$ 处 trunc 后仍是 $c_n$ 的单色拷贝（`eventually_embed_truncate`），取一个具体 $n$ 得矛盾。**这是 Lean 独有的证明路线**（论文用积空间紧性；Lean 用 $\beta\N$ 超滤子极限 + 截断相容性），两者都避开"任意函数族的对角线论证"的可测性问题。值得注意 Lean 里超滤子在这里是工具而非装饰——因为结论"存在 $D$"是经典的，超滤子极限给出构造性的选 $D$。

**(f) 轨道平均**（NormalCost.lean + OrbitAveraging.lean）：
- `orbitAverage w x = ∏ h ∈ groupList H, w (h • x)`（(6.5) 的实现，`groupList H = (Finset.univ : Finset H).toList`，固定顺序 = Finset 顺序——对应论文"fixed order on $H$"）。
- `orbitAverage_derived`：轨道平均把差异深度 +1（对应 $N^{(r)}/N^{(r+1)}$ 论证）；`orbitAverage_preserves`：不破坏已有正规子群成员性。
- `Evolution` 关系（OrbitAveraging.lean）：把"反复收缩 (6.7)"建模为状态演化 `Evolution w m v n`（$w$ 度数 $m$ 演化到 $v$ 度数 $n$），`finite_group_averaging`（第 289 行）输出论文 (6.6) 的对应物：

```lean
theorem finite_group_averaging (N : Subgroup G) [N.Normal] (r : ℕ)
    (c : NormalCost (Derived N r)) (letter : X → G)
    (hletter : ∀ x y, letter x*(letter y)⁻¹ ∈ N) (δ : ℝ) (hδ : 0 < δ) :
    ∃ (w : X → G) (m : ℕ), OrbitWords (H:=H) letter w m ∧ 0 < m ∧
      ∀ x y, SameOrbit (H:=H) x y →
        w x*(w y)⁻¹ ∈ Derived N r ∧ c.cost (w x*(w y)⁻¹) ≤ δ*m
```
`maxCost = Finset.univ.sup singleCost`（$c(g)=\max_i c_i(g)$ 的实现）；`NormalCost` 结构体打包逆/共轭/次可加三条（对应 (6.4) 的三条代价性质）。
- 收缩估计 (6.8)：Lean 在 `orbit_make_small`/`contraction_iterate` 中实现 $\bigl(\frac{h-1}{h}\bigr)^k$ 衰减（代码用度数 $\times|H|^k$ 与代价 $\le(h-1)^kB$ 的整数算术）。
- (6.9)（乘积差估计）对应 `NormalCost.product_difference` / `product_difference_mem`。

**(g) 端点总装**（CorrectionPaths.lean）：

```lean
theorem averaged_equal_endpoints (a : ι → FiniteEuclidean) (ha : Function.Injective a)
    (z : X → FiniteEuclidean) (f g : ι → X) (q δ : ℝ) ...
    (hf : ∀ h : H, CopyPath a 1 (fun i => z (h • f i)))
    (hg : ∀ h : H, CopyPath a q (fun i => z (h • g i)))
    (horbit : ∀ i, SameOrbit (H:=H) (f i) (g i)) :
    ∃ w lmb μ, Path a w lmb ∧ Path a w μ ∧ 0 < lmb ∧ 0 ≤ μ ∧
      μ/lmb ≤ q+(Fintype.card ι:ℝ)*δ
```
注意 Lean 的输入是**整个 $H$-轨道族** `∀ h, CopyPath a 1 (z ∘ (h·f))`——即所有 $h\in H$ 的缩放拷贝都合法，因为 $H$ 由等距组成。`permutation_equal_endpoints`（第 174 行）再特化到"坐标置换"情形：$X=H\times\Fin s$、$z(h,i)=\mathrm{embed}\,\ell(\mathrm{permute}\,h\,(f i))$，其中 `permute σ = LinearIsometryEquiv.piLpCongrLeft 2 ℝ ℝ σ`。**差异**：论文 Prop `groups:endpoints` 直接假设"$g_i$ 是 $f_i$ 的坐标置换"；Lean 把"置换 → 轨道"的转化显式构造（`X := H × Fin s`、`SameOrbit` 由 `⟨σ i, ...⟩` 给出），并把 $H$ 限制为 $\mathrm{Equiv.Perm}(\Fin \ell)$。

### 3.9 几何推论的 Lean 实现

**(a) `ramsey_cospherical`（Spherical.lean，Cor `cons:spherical`）**：分 $s=0,1,s\ge2$；$s\ge2$ 走 `full_affine_representative` → `ramsey_realCriterion` → `realCriterion_cospherical`（TensorSphere.lean：乘后矩阵 $H$ 的空间块 $=I$ ⇒ 球面方程）→ `cospherical_transport`（SphereTransport.lean：球心沿 $t+Q$ 传输，半径不变）。**差异**：论文推论直接从 $P$ 读出 $\ell,c$（$\ell_\alpha=H_{0\alpha}+H_{\alpha0}$）；Lean 用 Mathlib 的 `EuclideanGeometry.Cospherical`（存在球心与半径的谓词），且**单独处理 $s=0$ 与 $s=1$**（论文说 "A singleton is spherical" 一句话）。`realCriterion_cospherical` 里球面方程的"不对称系数"处理：Lean 取 $H_{0j}=−2c_j$、$H_{j0}=0$ 的**非对称**规范（Quadratic.lean `sphere_field_quadratic`），论文取对称和 $\ell_\alpha=H_{0\alpha}+H_{\alpha0}$——因为二次型只看对称部分，两种规范都合法；Lean 选了把常数项放 $\varphi(C)$ 的方案。

**(b) `sphere_field_quadratic` + `quadraticIndependent_fieldCriterion`（Quadratic.lean，Prop `cons:quadratic`）**：
- 球面方程的 $F$-解：论文"线性系统 + Gaussian 消元"；Lean 用**又一次 `Module.Projective.exists_dual_eq_one`**（$\varphi:\R\to_FF$、$\varphi(1)=1$，把实球面系数 $\varphi$-拉回 $F$：$h_{(none,none)}=\varphi(C)$、$h_{(none,j)}=\varphi(-2c_j)$、$h_{(j,k)}=\delta_{jk}$）。与下降处同一技巧。
- lift：`lift_kernel`（Quadratic.lean 第 49 行）逐行实现论文的伴随恒等式：
```lean
let z : ν → B := M.det • b - J *ᵥ (M.adjugate *ᵥ (D *ᵥ b))
-- 结论: D *ᵥ z = 0 ∧ μ ∘ z = h
```
前置 `field_rightInverse`（行独立 ⇒ 存在右逆 $S$，$ES=1$）——论文"选 $s$ 列使 $\det M\ne0$"被 Lean 替换为"右逆存在"（等价但避免选列）；$\delta=m_F(\det M)\ne0$ 在 Lean 中化为 `μ M.det = 1`（`hdet`）。
- `spherical_quadraticIndependent_ramsey`：与 Main 的 `fieldCriterion_ramsey` 拼接。

**(c) 五圆点（Circle*.lean，Cor `cons:quadrilateral`）**：
- `extend_to_five`（CircleExtension.lean）：补足五点——**用球极投影** `stereographic c r t`（$t\mapsto$ 圆上点）+ `circle_infinite`（圆无穷多点）构造第 5 点；论文一句话（"extend the set, if necessary, to five distinct points"），Lean 需要 stereographic 参数化的单射性、在圆上、恢复公式（`stereographic_recover/injective/on_circle`）。
- `secantRow`/`pairedSecantMatrix`/`five_point_isolator`（CircleInterpolation.lean）：割线对乘积多项式——论文的"两对点连线方程之积"；`secantValue_ne_zero` 对应"无三点共线 ⇒ 在 $a_i$ 非零"（`secant_nonzero`，CircleGeometry.lean）。
- `circle_five_rows_independent` + `quadratic_evaluation_surjective`（CircleRows.lean）：二次求值满射/行独立。
- `at_most_five_circle_points_ramsey`：分 $r=0$（`zero_radius_ramsey`——零半径圆即单点退化，Lean 单独处理；论文未提）与 $r>0$，`ramsey_restrict`（Ramsey 子集遗传）。

**(d) 九点反例（Nine*.lean + NineGridDeterminant + IndependentTensor，Prop `cons:nine`）**：
- `IndependentTensor.lean`：`tensorEmbedding_injective`——$\Q[T]\otimes\Q[U]$（分式化后）嵌入联合分式域 `JointField`。Lean 用 **Ore 局部化**（`OreLocalization`，NineField.lean 头部）构造 $\Q[T_1..T_9,U_1..U_9]$ 的分式域并证明嵌入单射——论文一句"B is a domain and embeds in Q(T,U)"在 Lean 里是一整个模块（`polynomialEmbedding_injective`、`halfEmbedding_injective`、`tensorEmbedding_injective`，206 行）。
- `NineGridDeterminant.lean`：网格特判的显式实现。**数值差异**：Lean 的 $C$ 是
```lean
lemma C_eq : C = ![![1, 1, 0], ![2, 0, 2], ![2, 0, -2]]
lemma det_C : Matrix.det C = 8
lemma det_evaluated_E : Matrix.det (gridEval.mapMatrix E) = (8 : ℚ) ^ 6
```
而论文的 $C=\begin{pmatrix}1&1&0\\1&0&1\\1&0&-1\end{pmatrix}$、$\det C=2$、$\det=2^6=64$。**Lean 的行取 $q(0)=(1,1,0),q(1)=(2,0,2),q(-1)=(2,0,-2)$（分母 $1+t^2$ 未除），行间倍数关系不同 ⇒ $\det C=8=2^3$、总行列式 $8^6=2^{18}$，仍非零。** 结论同（非零判定），中间数值不同——这是 Lean 与论文在具体计算路径上的典型分歧：Lean 选择避免处理"除以 $1+t^2$ 后仍整数"的细节，直接用未约分的行。
- `NineLinearObstruction.lean`：`not_fieldCriterion_of_det_ne_zero`（$\det D\ne0\Rightarrow$ 判据无解）+ `not_ramsey_of_det_ne_zero`（再接 `ramsey_fieldCriterion` 逆否）。形式：$D$ 是 `Matrix (Column d) (Column d)`（$9\times9$ 方阵，`Column 2 = Option (Fin 2) × Option (Fin 2)`），`vector_eq_zero_of_det_ne_zero`（非零行列式 ⇒ 核平凡）。
- `Nine.lean` 的 `evaluationMatrix_eq`：把坐标域中真实的 `augmented` 行与泛型矩阵 `genericMatrix`（$T/U$ 变量）经 `rowEquiv` 重排后等同——这要求 `coordinateTensorEmbedding`（坐标到联合分式域的嵌入，NineField.lean 第 145 行）保持 `augmented` 结构（`coordinateTensorEmbedding_augmented_tmul`）。
- `nine_circle_configuration` 的**字面版本**（NineStatement.lean）：`literalCircleConfig t = ![(1−t²)/(1+t²), 2t/(1+t²)]` 与内部 `circleConfig` 相等（`fin_cases j <;> simp`）——Lean 需要证明字面参数化与抽象构造逐坐标相等。

**(e) Lean 缺失/未形式化的部分**（对照论文 §7）：
1. **Cor `cons:kites`（超越风筝非 subtransitive）完全没有 Lean 对应**——grep 无 "kite"。原因显然：非 subtransitive 方向依赖 LRW 的文献结果，Lean 侧没有 LRW 论文的形式化。
2. **Prop `cons:twelve`（三旋转方块 / Liouville 导子障碍）没有 Lean 对应**——grep 无 "twelve/Liouville/rotation[al]"。导子 $\partial=\frac{1+t^2}{2}\frac{d}{dt}$、权重矩恒等式 (7.4)、(7.5) 均未形式化。
3. Remark `alg:noetherian`（$B$ 的 Noether 性/有限呈现）未作为独立结果形式化（Lean 的下降走了对偶泛函路线，不需要 Noether 性）。
4. Remark `alg:congruence` 的显式共轭映射 $H(v,u)=(v-t\cdot Qu,Qu)$ 未形式化——Lean 用 `ramsey_congruent_iff`（Ramsey 性在全等类内不变）+ `classification_nonempty` 达成同一目的（判据对代表选取的无关性由"换代表后判据仍刻画 Ramsey"间接获得），**没有**张量证书在共轭下的直接传输。
5. Hales–Jewett 的界（Shelah 原始递归界）与论文脚注的 Pálvölgyi 七点反例、附录声明：无 Lean 内容（后者本来也不是论文证明的一部分）。

### 3.10 论文引理 ↔ Lean 模块总对应表

| 论文条目 | Lean 定理 | 模块 | 证明路线差异 |
|---|---|---|---|
| 定义（Ramsey, $p_i,F,B,m_F$，判据） | `Ramsey`, `FieldCriterion` | Model | 一致（`Option` 编号） |
| 单点 Ramsey | `singleton_ramsey` | Congruence | 论文未证（平凡），Lean 显式 |
| Ramsey 全等不变 | `ramsey_congruent_iff` | Congruence | 论文隐含 |
| 全等 ⇒ 线性等距延拓 | `linearIsometry_of_equal_gram`, `congruent_linearIsometry` | Congruence | 论文用极化+Gram；Lean 同（`linearIsometry_of_equal_gram`） |
| Prop `alg:equivalence` 方向一（对称化） | **无对应**（不需要） | — | Lean 全程非对称 |
| Prop `alg:equivalence` 方向二（降环） | `realCriterion_fieldCriterion` | TensorDescent | **对偶泛函 φ(1)=1 替代行化简** |
| （逆方向） | `fieldCriterion_realCriterion` | TensorDescent | 包含映射张量，一致 |
| Prop `alg:necessity` | `ramsey_realCriterion`（+ `exists_separated_functions`, `separated_copy_sum`, `floor_coloring_obstruction`） | TensorNecessity | ZMod(K) floor 染色替代模 2 区间；分离泛函用 `exists_dual_eq_one` |
| Remark `alg:congruence` | `classification_nonempty`（间接） | Main | 共轭传输未形式化 |
| Remark `alg:noetherian` | **无对应** | — | 不需要 |
| §3 预备（有限基表示） | `realCriterion_lattice`, `exists_symmetric_tensor_presentation` | TensorPresentation | 一致 |
| Lemma `stencil:finite` | `finite_lattice_identity` | AdicLifting (+LatticeMoments) | **无完备化：幂零 exp/log + 交提升 + jet 理想** |
| Lemma `pairs:bump` | `exists_radial_smoothing` + `exists_small_covariance` + `compact_smoothing` | SmoothingKernel/SmoothingMatrix/DifferentialSplitting | **径向 bump 替代 Gaussian 混合；斜投影替代正交投影；无 Schur 补** |
| Lemma `pairs:rational` | `rational_smoothing`（+ `lattice_riemann`, `rationalize_convolution`, `exists_discrete_smoothing`） | StencilConvolution/Discretization/RationalConvolution | 一致（Taylor 界 + Riemann + 有理邻域） |
| Lemma `pairs:two-scale` | `realCriterion_two_scale`（+ `normalized_signed_rows`, `complete_gram_pair`, `two_scale_of_signed_rows`） | GramCompletion/SignedRows | 一致；谱定理实现半正定增量 |
| Lemma `paths:compactness` | `finite_coloring_compactness` | ColoringCompactness | **维数超滤子极限替代 Tychonoff** |
| Lemma `paths:synchronization` | `synchronize_paths`（+ `synchronized_chain`, `Path.scale`） | PathSynchronization | 归一化+链构造，等价重组 |
| Lemma `paths:corner-group` | `exists_group_corner` + `Corner.group` | CornerGroup | 幂等元调 Mathlib 库；群性用 `Group.ofLeftAxioms` |
| Lemma `paths:realization` | `UltraColumn.simultaneously_realize` | UltrafilterStrings | 一致（列=归纳类型） |
| Prop `paths:criterion` | `paths_monochromatic` | ColoringCompactness | HJ 用 Mathlib `Combinatorics.Line.exists_mono_in_high_dimension` |
| Lemma `groups:pairs` | `unit_pair_inverse` + `unit_pair_coverage`（+ `common_vertex`） | PathWords/FiniteEuclidean | 一致 |
| Lemma `groups:fractions` | `RightFraction.*`, `singleCost_*`, `bounded_tuple_list`, `RightFraction.mul_pair` | PathFractions | 一致（`sInf` 定义 cost） |
| (6.3) $N^{(s-2)}\subseteq L_i$ | `derived_subset_single` | DerivedFractions | 归纳按 card ι ≤ n+2，一致 |
| Lemma `groups:averaging` | `finite_group_averaging`（+ `orbitAverage_*`, `Evolution`, `orbit_make_small`） | OrbitAveraging/NormalCost | 一致（groupList 固定序） |
| Prop `groups:endpoints` | `averaged_equal_endpoints` + `permutation_equal_endpoints` | CorrectionPaths | 轨道族输入显式化 |
| Theorem 1.1 充分 | `fieldCriterion_ramsey` | Main | η=1/(4n), δ=1/(4ns)（vs 论文 1/(2n),1/(2sn)） |
| Theorem 1.1 必要 | `ramsey_fieldCriterion` | TensorDescent | 组合 |
| Theorem 1.1 全体非空集 | `classification_nonempty`（+ `full_affine_representative`） | Main | 论文一句带过的代表构造被完整展开 |
| Cor `cons:spherical` | `ramsey_cospherical`（+ `realCriterion_cospherical`, `cospherical_transport`） | Spherical/TensorSphere/SphereTransport | 非对称球面系数规范；s=0,1 分情况 |
| Cor `cons:transitive` | `subset_of_finite_transitive_ramsey`（+ `averaged_realCriterion`, `orbit_sum_eq`） | Transitive | 一致（$1/\vert H\vert$ 有理权） |
| Prop `cons:quadratic` | `quadraticIndependent_fieldCriterion`（+ `sphere_field_quadratic`, `field_rightInverse`, `lift_kernel`） | Quadratic | 右逆替代选列；伴随恒等式照抄 |
| Cor `cons:quadrilateral` | `at_most_five_circle_points_ramsey`（+ `five_circle_points_ramsey`, `extend_to_five`, `five_point_isolator`） | Circle 系列 | 球极投影补点；r=0 分情况 |
| Prop `cons:nine` | `nine_circle_configuration`（NineStatement/Nine/NineLinearObstruction/NineRationalDeterminant/NineGridDeterminant/NineField/NineGeometry/IndependentTensor，共约 1000 行） | Nine 系列 | Ore 局部化；**det C = 8（未约分行）vs 论文 2** |
| Prop `cons:twelve` | **无对应** | — | 未形式化 |
| Cor `cons:kites` | **无对应** | — | 未形式化（依赖外部文献） |

### 3.11 只在 Lean 里暴露的细节（取证要点清单）

1. **对偶泛函 $\varphi(1)=1$ 是全文 Lean 证明的"隐形主角"**：出现三次（降环 `tensorDescent`、球面方程 `sphere_field_quadratic`、分离 `separate_arrayMap` 的射影性论证），论文里对应的分别是"行化简""Gaussian 消元""扩基"。机械性理由：Mathlib 对"自由模上的泛函扩张"有现成 API（`Module.Projective.exists_dual_eq_one`），而对"域上线性系统相容性下降"没有直接 API——形式化自然滑向泛函路线。
2. **完备化完全消失**：论文 §3 的 Stacks Project 引用（Tag 00MB 平坦性）在 Lean 中不存在；替代品是幂零 exp/log + `adic_intersection_lifting` + jet 理想。这使 Lean 证明严格更初等（纯交换代数多项式运算），也意味着论文 §3 的完备化叙述是**表述性**的，不是逻辑必需。
3. **对称张量层消失**：论文的 $\mathcal T(W)$、$T=\frac12(Q+Q^*)$、flip 不变性在 Lean 中没有任何对应物；Lean 的判据（`RealCriterion`/`FieldCriterion`）天然非对称。反推时若以"对称性"为必要组件会走错。
4. **色数打包方式**：论文 $r_0=K^s$ 染色的"区间标签元组"在 Lean 中是 `Fin s → ZMod K` 单个函数空间；`Fintype.card (Fin s → ZMod K) = K^s` 由 `Fintype.card_fun` + `Nat.one_lt_pow` 算出。
5. **`Z := 1 − R·U` 斜投影**：论文的 $P_H,P_V$（正交投影、Schur 补）在 Lean 中被代数右逆 $R=CU^{\mathsf T}$ 与投影 $Z=1-RU$ 替代；代价常数从 $\eta/8$ 变为 $\eta/(2(d+1))$。正定性证明不用 Schur 补而用 `positive_joint_pushforward`。
6. **径向 bump 的显式指数**：`smoothingExponent E`（负数，依赖 finrank）与常数 $K=\mu(\text{ball})\cdot(-p)\cdot d\cdot(d+1)^{d+2}$——论文没有这个显式常数（Gaussian 论证不给显式 $b$）；Lean 必须给出生成函数本身。
7. **Hales–Jewett 的库形态**：Mathlib 的 HJ 是"高维网格单色组合线"（`Combinatorics.Line.exists_mono_in_high_dimension`），线的"变量位置"编码为 `line.idxFun j = none`（`Option`），变量数上界是**维数+1**（card β + 1）——Lean 据此把同步化引理的 $n$ 取为 card β + 1（Main.lean/ColoringCompactness.lean 中 `hpaths (Fintype.card β+1)`）。
8. **超滤子被用在两个不同的地方**：(i) $\beta\mathcal S$ 角群（与论文相同）；(ii) **维数紧性的超滤子极限**（与论文的 Tychonoff 不同）。论文 §5.1 的紧性证明是 Tychonoff 式；Lean 用 `Ultrafilter.of atTop` 于 $\N$——这是"Lean 必须展开论文一句带过内容"时的路线分叉。
9. **九点行列式的数值分歧**：Lean 的网格行未除以 $1+t^2$（$C$ 的行是 $(1,1,0),(2,0,2),(2,0,-2)$），$\det C=8$、总 $\det=8^6=2^{18}$；论文约分后 $\det C=2$、$\det=64$。非零性结论相同。取证时注意不要把论文的 64 与 Lean 的 $8^6$ 混同。
10. **`FiniteEuclidean := ℕ →₀ ℝ`**：Lean 用 Finsupp 而非序列类型；`embed/block/flatten` 的等距性与距离公式（`norm_sum_blocks`, `flatten_distance`）是一整层需要显式验证的结构（论文的 (5.1) 一行式在 Lean 中是 FiniteEuclidean.lean 的约 100 行）。
11. **度数与代价的整数化**：论文的 cost 是"非负整数、最小值存在"（良序），Lean 用 `singleCost := sInf {c | BoundedFraction ...}` 与 `Nat` 运算；权重是实数但度数是 `Nat`——两套量纲的区分在 Lean 里严格化（`(m : ℝ)` 的转换散布于 CorrectionPaths）。
12. **`classification_nonempty` 的析取形态**：Lean 的最终"全称"定理把 $s=1$ 拆成析取支，因为 `classification` 主定理自身限定 $s\ge2$。论文未给出这种"完整版"陈述（论文在定义层面允许单点，判据陈述限定 $s\ge2$）。

---

## 四、常数与参数表

### 4.1 论文中的常数（按出场顺序）

| 常数/参数 | 出处 | 取值 | 机械性理由 |
|---|---|---|---|
| $s$ | 全文 | 点数，$s\ge2$ | 主定理前提；$s=1$ 单独处理 |
| $d$ | 全文 | 仿射维数，$d\ge1$ | 空间块 $I_d$ 的规模；$d=0$ 退化 |
| $K$ | Prop `alg:necessity` | $2s+1$ | 区间数；要求 $2/K<1/s$ 即 $K>2s$，使 $s$ 个误差和 $<1$ 与奇整数矛盾 |
| $r_0$ | Prop `alg:necessity` | $K^s$ | 色数 = $s$ 元组区间标签数；与 $D$ 无关（固定染色跨所有维数） |
| $k$ | §3 | 基向量个数 | 张量因子的 $\Q$-生成集大小（有限） |
| $C$ | §3 | $\operatorname{Mat}_k(\Q)$ 对称 | 张量坐标矩阵；$UCU^{\mathsf T}=I_d$ |
| $Q_2(Y)$ | Lemma `stencil:finite` | $\tfrac12Y^{\mathsf T}CY$ | 二阶截断对象；精度只需 $\mathfrak m^3$ |
| 截断深度 2 | Lemma `stencil:finite` | $\bmod (Y)^3$ | 只需要到二阶矩；三阶项不携带信息 |
| Stacks Tag 00MB | Lemma `stencil:finite` | 完备平坦性引理 | $I\widehat R=\bigcap J_i\widehat R$（Lean 中无对应） |
| $\epsilon$ | Lemma `pairs:bump` | 满足 $\epsilon\tr(UU^{\mathsf T})<\eta/8$ | Gaussian 阶段预算 |
| $L$ | Lemma `pairs:bump` | 大参数（$LP_V$） | 吸收 $C$ 在 $\ker U$ 上的负曲率；$UP_V=0$ 故不出现在迹中 |
| $\eta/8,\eta/4$ | Lemma `pairs:bump` | 预算分解 | Gaussian $<\eta/8$ + 截断 $<\eta/8$ ⇒ $<\eta/4<\eta\int b$（$\int b>1/2$） |
| $R$（截断半径）、$\chi$ | Lemma `pairs:bump` | $\chi_R=\chi(\cdot/R)$ | Schwartz → 紧支撑；导数量级 $R^{-1},R^{-2}$ 被 Schwartz 衰变压制 |
| $d_n$ | Lemma `pairs:rational` | $n^{2-k}b(\lambda/n)$ | $n^{-k}$ 原子近似 $\times n^2$ 补偿二阶矩的 $n^{-2}$ 缩小 |
| $\zeta_n$ | Lemma `pairs:rational` | $n^{-k}\sum b(\lambda/n)\to\int b$ | Riemann 和；正且有理化为 $\zeta$ |
| $M$ | Lemma `pairs:two-scale` 证明 | 使 $M\mu(\lambda)\in\Z$ | 有限有理权的公分母（`integerize_finsupp`：矩阵公分母 `A.den`） |
| 追加行 $(0,r_j)$ | Lemma `pairs:two-scale` 证明 | $\sum r_jr_j^{\mathsf T}=P=\eta I-B_-$ | 公共半正定 Gram 增量，保多重集相等 |
| 终缩放 | Lemma `pairs:two-scale` | $\div\sqrt{1+\eta}$ | 正列表精确归一到原尺度 |
| $q$ | Lemma `pairs:two-scale` | $\eta/(1+\eta)$ | 负列表残余尺度；$0<q<1$，$\eta\to0\Rightarrow q\to0$ |
| $\lambda,\mu$ 路径权重 | §5 | $\lambda>0,\mu\ge0$，$\mu/\lambda<1/n$ | 判据输入；$\lambda$ = 单位拷贝因子数，$\mu$ = $q$-尺度因子数 |
| $\alpha_t$ | Lemma `paths:synchronization` | $(1/t-\rho)/(1-\rho)$ | 区间切分点；$\rho+(1-\rho)\alpha_t=1/t$ |
| $n$（HJ 长度） | Prop `paths:criterion` | Hales–Jewett 长度 | 使 $r$-染色于 $\{1..s\}^n$ 必有单色组合线；只取存在性 |
| $t$ | Prop `paths:criterion` | 线的变量位置数，$1\le t\le n$ | 由单色线事后决定；$t\cdot\frac1t=1$ 的来源 |
| $1/t$（预备权重） | Lemma `paths:synchronization` | $1,1/2,\dots,1/n$ | 覆盖所有可能的 $t$ |
| $N=\ker(K\to\Z)$ | §6 | $N^{(0)}=N$，$N^{(r+1)}=[N^{(r)},N^{(r)}]$ | 导出列；差元素的起点 |
| $L=N^{(s-2)}$ | §6 | (6.4) | $s$ 个坐标支撑 $s-2$ 层换位深度 |
| $\delta$ | Lemma `groups:averaging` / Prop `groups:endpoints` | 任意正数；最终 $\delta=1/(2sn)$ | 校正代价/度数的上界比率 |
| $(h-1)/h$ | Lemma `groups:averaging` | 收缩比率 | 每轮度数 $\times h$、代价上界 $(h-1)B$；$2B/m_0\cdot((h-1)/h)^k$ |
| 最终组合 | §6 末 | $q<1/(2n)$、$\delta=1/(2sn)$ | $q+s\delta<1/n$，接路径判据 |
| $K_a$ 的 $a$ | Cor `cons:kites` | $(-1,1)$ 中超越数 | LRW 非嵌入证明的条件 |
| 九点参数 | Prop `cons:nine` | $t_1..t_9$ 代数独立 | 超越次数 9 = 二次单项式数，使 $D$ 方阵可逆 |
| $\det C$、$\det$ | Prop `cons:nine` | $2$、$2^6=64$ | 网格特判 $\{0,1,-1\}^2$ |
| $t$（Liouville） | Prop `cons:twelve` | $\sum_m10^{-m!}\in(0.11,0.12)$ | 超越（Liouville 不等式 $2q_m^{-(m+1)}$）+ 足够小（$\theta=2\arctan t<\pi/4$ 保证三块不交） |
| $\beta$ 权重 | Prop `cons:twelve` | $\beta_{+,q}=\beta_{-,q}=1$、$\beta_{0,q}=-2$ | 解三矩线性系统；$\sum\beta=0$、一阶矩 0、三阶 $4I_2$ |
| $4I_2$、$8$ | Prop `cons:twelve` | (7.4)(7.5) 右端 | $\partial R_\pm=\pm R_\pm J$、$\sum_{Q_0}qq^{\mathsf T}=2I_2$ ⇒ 导子矩 $2I_2+2I_2=4I_2$；判据右端 $4\cdot(\text{两个对角})=8$ |

### 4.2 Lean 中的对应常数（差异对照）

| 论文 | Lean | 差异 |
|---|---|---|
| $q<1/(2n)$、$\delta=1/(2sn)$ | $\eta=1/(4n)$、$\delta=1/(4ns)$，$q=\eta/(1+\eta)$；$\eta+s\delta=1/(2n)$（精确等式 `he`） | Lean 用精确等式链利于 linarith |
| $\epsilon\tr(UU^{\mathsf T})<\eta/8$ | $\epsilon=\eta/(2(d+1))$，$\tr(USU^{\mathsf T})=\epsilon d<\eta/2$ | 斜投影使迹 = $\epsilon d$（精确），预算 $\eta/2$ |
| Schur 补 + 正交投影 | $R=CU^{\mathsf T}$（右逆）、$Z=1-RU$、`exists_positive_shift` 的 $L$ | 代数分裂 `C = RR^T + ZCZ^T` |
| Gaussian $b_*$（无显式式） | `radialBump (ε²) p`，`p = smoothingExponent E`，常数 $K=\mu(B_1)(-p)d(d+1)^{d+2}$、$\delta=\min(t,1/2)$、$\varepsilon=\delta^2$ | 显式 bump + 显式常数 |
| $\det C=2$、$\det=64$ | `det C = 8`、`det = 8^6 = 2^18` | Lean 行未除以 $1+t^2$；非零结论相同 |
| 色数 $K^s$ | `Fintype.card (Fin s → ZMod (2*s+1))` | 相同数值 $K^s$，类型化 |
| $c(g)=\max_i c_i(g)$ | `maxCost = Finset.univ.sup singleCost` | 相同 |
| $1/\vert H\vert$ | `q := (Fintype.card H : ℚ)⁻¹` | 相同（有理数，`smul` 张量） |
| HJ 长度 $n$（存在性） | `Fintype.card β + 1`（β = HJ 网格维数） | Lean 显式给出所用长度 |

---

## 五、开放问题与可信度审查

### 5.1 论文明示或暗示的开放问题

1. **圆上 6、7、8 点的分界**（由 Cor `cons:quadrilateral` + Prop `cons:nine` + Pálvölgyi 七点反例夹出的空白）：判据给出"≤5 点 Ramsey"、"9 个代数独立点不 Ramsey"、Pálvölgyi 有"某 7 点不 Ramsey"与"泛型 7 点不 Ramsey（附录，未检查）"。**恰有多少点的圆上配置 Ramsey / 哪些**仍开放。判据本身是充要的，所以问题的剩余部分是"对具体配置验证判据"。
2. **Pálvölgyi 的"所有有限传递集 Ramsey"手稿**（论文脚注 1）：作者注称写作进行中、思想归 ChatGPT、附录声明未经检查。本文 Cor `cons:transitive` 已覆盖其主体（subtransitive ⇒ Ramsey），但"传递集自身的新证明"与本文独立。
3. **球面但非 Ramsey 的最小点数**：12 点（本文，显式参数）与 7 点（Pálvölgyi）都存在；单参数族（cons:twelve 用一个参数）是否可以更小、以及非 Ramsey 集的最小基数，论文未讨论 [推测：论文以 12 点作为"判据直接应用"的演示，而非极值研究]。
4. **判据的可计算性**：Remark `alg:noetherian` 说明核有限生成，但论文明确声明"It is not a procedure for recovering those relations from numerical approximations to arbitrary real coordinates"——对坐标由算法给出的集合，判据的判定复杂度未研究。

### 5.2 可信度审查（内部一致性）

1. **证明闭环检查**：充分方向依赖链 `classification ← fieldCriterion_ramsey ← {fieldCriterion_realCriterion（等价）, realCriterion_two_scale（§3–4）, permutation_equal_endpoints（§6）, paths_monochromatic（§5）}`；必要性 `ramsey_fieldCriterion ← ramsey_realCriterion`。无循环引用主定理；`cons:spherical` 作为推论不回流。
2. **Lean 与论文的双证书**：主定理 `OAI.EuclideanRamsey.classification` 有完整 Lean 证明（28 层依赖链、46 模块 8620 行），permitted axioms 仅标准三条。Lean 的证明与论文在多处**实质不同**（无完备化、无对称化、超滤子紧性、径向 bump、对偶泛函下降）——这不是缺陷信号，反而是"同一结果的独立验证"的证据；但也意味着：**论文某处若有错，Lean 大概率不共享该错误；反之亦然**。两证都成立说明主定理高可信。
3. **未形式化的论文结果**：`cons:kites`（依赖 LRW 文献）、`cons:twelve`（导子障碍）、Remark `alg:noetherian`、Remark `alg:congruence` 的证书传输。这些结论的可信度只由论文文本支撑。其中 `cons:twelve` 的矩恒等式 (7.4) 可手工复核（常向量部分、一阶、二阶、导子矩各一；本文 §2.30 已逐步重算，其中原文 "$2I_2+2I_2=4I_2$" 的分解已在 2.30(b) 核对：$\sum_qqq^{\mathsf T}=2I_2$ 的因子先乘进去）。
4. **论文中两处表述较紧、需要小心之处**（反推写作时注意）：
   - §2.4 的染色论证中"sum of the interval labels"是**逐 $i$ 独立取模 2**，不是把 $s$ 个标签当 $K$ 进制数；
   - §5 Hales–Jewett 步骤中"color a word by the unique index $k$ for which $B_k\in\psi(w_{i_1})\cdots\psi(w_{i_n})$"——唯一性来自超滤子对有限划分恰好含一个类；字染色不是 $c$ 本身，而是 $c\circ\Phi$ 通过 $\Psi$ 的超滤子极限，写作时勿混同。
5. **论文与 Lean 的常数不一致处**（均为无害）：$\det C=2$ vs $8$；预算 $\eta/8$ vs $\eta/(2(d+1))$；$q<1/(2n)$ vs $\eta/(1+\eta)<1/(4n)$。取证写作时应注明"论文/Lean 各自的常数版本"。
6. **文献依赖的外部断言**（本文未证明、Lean 未验证）：LRW Conjecture A 的历史表述、LRW Corollary 2（风筝非嵌入）、Pálvölgyi Theorem 1 与 Theorem A.3（后者论文自称未经作者检查，本文引用时注明）、Kříž/Cantwell/Frankl–Rödl 等历史结果。
7. **ZFC 合规**：论文声明 "All arguments take place in ZFC"。Lean 侧 `Classical.choice` 承担 Hamel 基（`Module.Free.chooseBasis`）、极小理想（Zorn）、分离泛函（射影性）与超滤子存在（`Ultrafilter.of`）——与 ZFC 声明一致。

### 5.3 反推写作的切入建议（基于以上素材）

- 第一人称思维链的最佳切入口是**判据的"乘前 vs 乘后"区分**（§1.1 末 "An equality in $B$ is stronger than..."），因为它是全文唯一的"为什么非平凡"点，其余一切（格点恒等式、双尺度、路径、超滤子、平均）都是把这一区分兑换成 Ramsey 的机器。
- 三阶段叙述的"中间最难处"是 §5 的 $t$ 未知性（权重同步化）与 §6 的代价/度数比（轨道平均）；Lean 的 `Evolution` 归纳与 `synchronized_chain` 提供了比论文更机械的中间步骤（可作反推的阶梯）。
- 反例方向的"标志性一步"是 (7.5)：$\Phi$ 与 $m_F$ 的不相容——写作时先造 $\Phi$ 再读出 $8\ne0$，比先读判据更自然。

---

*素材完。字数规模：本文件约 6 万字符。所有 TeX 引用均为源码逐字照抄；Lean 引用均为 `E:\math\lean\OAI\Combinatorics\EuclideanRamsey\` 下源码逐字照抄或摘录；[推测] 标注处为编者推断。*
