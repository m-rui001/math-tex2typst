# Ryser 覆盖猜想反例 —— 研究素材（供"第一人称反推思维链"笔记使用）

来源文件（绝对路径）：
- 论文 TeX：`E:\math\preprints\A-Counterexample-to-Rysers-Covering-Conjecture-September-23-2026\build\paper.tex`（主文件），分节 `incidence.tex`、`linecover.tex`、`selection.tex`、`construction.tex`（同目录，经 `\input` 引入）。
- README：`E:\math\preprints\A-Counterexample-to-Rysers-Covering-Conjecture-September-23-2026\README.md`
- Lean 形式化：`E:\math\lean\formalization.yaml` 第 1470–1476 行两条目；
  - 条目 A（RyserCovering）：declaration `OAI.RyserCoveringCounterexample.exists_prime_eventually_counterexampleRank`，file `OAI/Combinatorics/Ryser/Construction/Main.lean`，comparator_config `ComparatorChallenges/RyserCovering.json`
  - 条目 B（RyserOddExtensions）：declaration `OAI.RyserOdd.eventualOddFailures_and_infinite`，file `OAI/Combinatorics/Ryser/OddExtensions.lean`，comparator_config `ComparatorChallenges/RyserOddExtensions.json`
  - Lean 模块根：`E:\math\lean\OAI\Combinatorics\Ryser\`（子目录 Construction / Domination / Field / Geometry / Hypergraph / Incidence / LineCover / Probability / Selection + 根 Main.lean、OddExtensions.lean）

说明：凡论文之外的推断一律标 [推测] 或注明外部来源；凡照抄 TeX 源码处保留 LaTeX 形式。

---

## 一、定理总览

### 1.1 被否定的猜想

Ryser 覆盖猜想（论文 introduction 原文照抄）：

```latex
A vertex cover of a finite hypergraph $H$ is a set of vertices meeting
every edge. Its covering number $\tau(H)$ is the minimum size of such a
set, and its matching number $\nu(H)$ is the maximum number of pairwise
disjoint edges. For an integer $r\ge2$, an $r$-partite $r$-uniform
hypergraph has disjoint vertex parts $V_1,\ldots,V_r$, with every edge
containing exactly one vertex from each part. Ryser's covering
conjecture asserts that every such hypergraph satisfies
\begin{equation}\label{eq:ryser}
 \tau(H)\le(r-1)\nu(H).
\end{equation}
```

即：每个 $r$-部 $r$-一致超图满足 $\tau(H)\le (r-1)\nu(H)$。交（intersecting）情形即 $\nu(H)=1$（任何两条不同边相交），此时猜想要求 $\tau(H)\le r-1$。本文正是在交情形否定它：构造 $\tau(H)=r=q+1$ 的交超图。

已知正面结果（论文引言列举）：
- $r=2$：Kőnig 匹配定理。
- $r=3$（一般情形）：Aharoni 2001。
- 交情形 rank 4（Gyárfás）、rank 5（Tuza）。
- Haxell–Scott：$r=4,5$ 时（不假设交）$\tau\le(r-\epsilon)\nu$。
- White 2026：$r=4,\ \nu=2$ 特例 $\tau\le6$（脚注提到 White 报告获得 GPT-5.6 Sol 与 Claude 协助）。
- 任意两条边恰交于一点时，rank 9 以内成立（Francetić–Herke–McKay–Wanless 2017）。
- 经典等号例子：删去射影平面一个点及过它的线，剩余点按删去线分部、剩余线作边——$r=q+1$ 部、$\tau=q$，当 $r-1$ 为素数幂时等号成立。
- Abu-Khazneh–Barát–Pokrovskiy–Szabó 2019：截断平面 + 例外边，部数与覆盖数同时 +1。
- Haxell–Scott 2017：仿射平面 + 交配置，得 $\tau\ge r-4$（$r$ 充分大），$r$ 偶时 $r-3$。
- Lovász 的匹配下降增强命题在 $r=3$ 已被 Clow–Haxell–Mohar 2025 否定（Abiad–Garbe–Povill–Spiegel 2025 给出无穷族），但这些例子与 (eq:ryser) 相容；本文否定的是覆盖不等式本身。

### 1.2 主定理精确陈述（TeX 原文照抄）

```latex
\begin{theorem}\label{thm:main}
There exists $s_0$ such that, for every prime $s\ge s_0$ with
$s\equiv2\pmod3$, there is an integer $n_0(s)\ge3$ with the following
property. For every odd integer $n\ge n_0(s)$, put $q=s^n$.
There is a finite intersecting $(q+1)$-partite $(q+1)$-uniform
hypergraph $H$ satisfying
\[
 \tau(H)=q+1.
\]
In particular, the intersecting case of~\eqref{eq:ryser} is false.
\end{theorem}
```

要点：
- 域阶 $q=s^n$：$s$ 是充分大的、$\equiv2\pmod3$ 的素数；$n$ 是充分大的**奇**整数（阈值 $n_0(s)\ge3$ 依赖 $s$）。$\tau(H)=q+1=r$，而交情形 Ryser 上界是 $r-1=q$，故违反。
- $\tau(H)\le q+1$ 是自动的：非空交超图的任一条边本身就是一个 $q+1$ 元覆盖。证明的全部负担是：构造交超图，并排除一切大小 $\le q$ 的覆盖。
- 结构是渐近式的：先固定一个充分大的合格素数 $s$，在 $\F_s^2$ 中造一个小构形；再让 $n$ 在奇数中取充分大。所有后续阈值可依赖这个固定构形。证明**不给出数值阈值**（"the proof does not give a numerical threshold"）。
- 与姊妹篇（`OpenAI2026Balanced`，即 BalancedRyser）的关系：那篇对每个充分大素数 $q$ 直接在素平面改线分划，得到每部恰 $q+1$ 个点、无孤立点的例子；本篇的 $q$ 是真奇次幂（proper odd power），用小域构形 + 非线性坐标变换。两文给出的 rank 范围不同。本文只从姊妹篇引入附录 A 的三个初等估计：仿射二阶矩恒等式（Lemma A.1）、有界漂移集中（Lemma A.2）、独立试验的暴露界（Lemma A.3）。

### 1.3 反例结构（概览）

论文 "Proof strategy" 一节给出的骨架：

1. **仿射平面模型**。部 = $\F_q^2$ 的 $q+1$ 个方向；每部的顶点 = 该方向的 $q$ 条仿射线。一个点 $x$ 决定一条边：它在每个方向上的关联线（即"点边"）。两点边交于连线，但一整个平行类给出大小 $q$ 的覆盖——这是必须绕开的原初障碍。
2. **保留大量点边 + 插入例外边**。例外边是在某些方向上换了标签的边。
3. **限制普通覆盖**：在 $O(q)$ 个独立试验中删除每处有界多个平移形状（线或曲线，与任何线至多有界个交点，除非它就是那条线本身）。linecover 一节证明：在一致的存活假设下，几乎全部存活点的、大小 $\le q$ 的线覆盖必"几乎含一个铅笔"（pencil = 过一个射影点的线族；中心在无穷远处时即平行类，含 $q$ 条；有限中心时 $q+1$ 条）。incidence 一节为此先在"真子域阶 $\le q^{1/3}$"的域上用 BKT 和–积法证 incidence 节省。
4. **小域构形 + 非线性坐标**：固定素平面 $\F_s^2$，在每个非零有限方向删一条线，剩下的点集记 $Y$。坐标变换 $f(x,y)=(x^3,y)$（$s\equiv2\pmod3$ 时双射）。被改动方向的标签改从过 $f(w)$（$w\in Y$）的线读出。$f$ 保持水平、竖直平行类（保证例外构形内部相交），且把其他直线映为与任何直线至多 3 个交点的曲线。gadget 一节证明关键障碍：用 $a$ 条线 + $b$ 个单点覆盖 $f(Y)$ 且 $a+b/2\le s$ 时，必须恰含一个完整平行类且不用点资源。
5. **放置构形与花费预算**：把 $Y$ 的线性变换副本嵌入 $\F_q^2$，使每个环境方向在一或两个副本中被改动；每个副本采样固定数目个独立候选平移，selection 一节用 Haxell 型独立横截论证选出相容代表；placement 在选定前对整个独立池证删除估计，选定后只保留所选删除，普通点按确定性包含恢复估计。
6. **最后排除覆盖**（hypergraph 一节）：普通边强迫出铅笔后，按铅笔中心分三种情形——(a) 中心在无穷远处：未覆盖的例外构形需要的顶点数超过缺的平行线释放的顶点数；(b) 中心在某个嵌入构形内部：剩余预算会把 $f(Y)$ 用 $\le s$ 条线（含两条不平行轴线）覆盖；(c) 中心在所有构形之外：每条被删的铅笔线释放 5 条未覆盖例外边，而每个额外顶点至多盖 5 条。三种情形预算都不够。

### 1.4 推论：单色树覆盖（Gyárfás 猜想的反例）

```latex
\begin{corollary}\label{cor:tree-cover}
Let $s_0$ and $n_0(s)$ be as in Theorem~\ref{thm:main}. For every prime
$s\ge s_0$ with $s\equiv2\pmod3$ and every odd integer $n\ge n_0(s)$,
put $r=s^n+1$. There is a finite simple complete graph with an
$r$-edge-coloring for which the minimum number of monochromatic trees
needed to cover its vertices is exactly $r$. The same minimum holds with
connected monochromatic subgraphs or maximal monochromatic components in
place of trees.
\end{corollary}
```

证明机制：取 $H$，顶点集 = $E(H)$ 成完全图 $K$。对每对超边 $e,f$，选一个下标 $i$ 使 $x_i(e)=x_i(f)$（$x_i(e)$ 是 $e$ 在部 $V_i$ 中的唯一顶点；存在性由交性保证；即使多部相交也只选一种颜色）并把 $K$ 的边 $ef$ 染色 $i$。沿颜色 $i$ 的路径 $x_i$ 不变，故每个连通单色子图决定一个属于其所有超边的 $V_i$ 顶点；$t$ 个连通单色子图覆盖 $K$ 的顶点 $\Rightarrow$ 至多 $t$ 个超图顶点覆盖 $H$ $\Rightarrow$ $t\ge\tau(H)=r$。反方向：固定 $K$ 的一个顶点，以它为中心的 $r$ 个单色星（允许单点星）覆盖 $K$，故最小值恰为 $r$。因此 Gyárfás 的 $r-1$ 单色树覆盖猜想在这些扩域 rank 处失效，同时否定 Milićević 的有界直径强化（Conjecture 6, [Milicevic2017]）与 DeBiasio–Kamel–McCourt–Sheats 的 $\alpha=1$ 情形（Conjecture 2.8；此处 $\alpha(K)=1$）。

### 1.5 论文中的记号约定

- 方向 = $\F_q^2$ 的一维线性子空间（含零）；射影完备化每个方向加一个无穷远点。
- 铅笔 = 过一个射影点的全体仿射线：有限中心 $q+1$ 条，无穷远中心 $q$ 条。共线（concurrence）总是把平行线算作相交。
- $(a)_j=a(a-1)\cdots(a-j+1)$（下降阶乘）。
- 所有渐近常数可依赖显式固定的参数；"with high probability" 指沿指定域序列概率 $\to1$；小域在环境域趋于无穷**之前**固定。
- $I(P,\mathcal L)$ = 射影点–线关联数（见 incidence 一节）。

---

## 二、逐引理带批注重构

（本节为全素材主体，每条引理按四段展开：(a) 精确陈述（TeX 原文）；(b) 证明机制逐步推导，不跳步；(c) 每个假设/常数的机械性理由；(d) [推测] 候选失败路线。）

### 2.0 依赖的拓扑顺序

整个证明是一条"自下而上"的链，常数的引入顺序被论文明确固定（construction.tex 结尾原文）：

> The order of choices is
> \(s,Y\), then the selection constant and \(K\), then the deletion
> constants \(D,\delta,\rho\), and finally \(q=s^n\).

即：$s$（素域）→ $Y$（gadget）→ 选择定理常数 $K$ → 删除常数 $D,\delta,\rho$ → 才轮到 $q=s^n\to\infty$。理解任何一步"为什么这个常数"都必须回到这个顺序。链的形状：

```
incidence 定理 (κ, Q, 绝对常数)
   ↓ 供给 "小覆盖 ⇒ 几乎铅笔" 的几何输入
linecover 引理 (任意 D, δ, ρ; 删形状族)
   ↓ 应用于两个坐标系统（原坐标 + f-坐标）
gadget 引理 (s ≡ 2 mod 3; Y 与 f(Y) 的双性质)
   ↓ 作为"刚度黑箱"被消耗
selection 定理 (D ↦ K; 独立池选相容平移)
   ↓ 保证例外边彼此相交
placement (池删除估计 + 确定性转移)
   ↓
hypergraph 装配 + 三情形排除覆盖 ⇒ 主定理
   ↓
树覆盖染色推论
```

---

### 2.1 定理 incidence（一致 incidence 节省）\label{sec:incidence}

#### (a) 精确陈述（TeX 原文）

```latex
\begin{theorem}[Uniform incidence saving]\label{thm:incidence}
There exist absolute constants $\kappa\in(0,1/10)$ and $Q$ with the following
property. Suppose that $q\ge Q$ is a prime power and every proper subfield
of $\F_q$ has order at most $q^{1/3}$. If $P$ and $\mathcal L$ are sets of
projective points and projective lines over $\F_q$ satisfying
\begin{equation}\label{eq:inc-theorem-sizes}
 |P|,|\mathcal L|\le q^{1+\kappa},
\end{equation}
then
\begin{equation}\label{eq:inc-theorem-bound}
 I(P,\mathcal L)\le q^{3/2-\kappa}.
\end{equation}
\end{theorem}
```

注意它不是渐近命题而是**存在绝对常数**的定量命题：$\kappa$ 与 $Q$ 都不依赖域序列。其作用（在 linecover 中被消费的方式）是控制"一个不几乎共点的 $\le q$ 条线的覆盖，其两两交点落在存活点里的数量"——若没有 incidence 节省，linecover 的低并发情形就推不出"随机样本的对几乎都交在 $X$ 外"。

#### (b) 证明机制：四步分解

**第一步：有限集估计（引理 inc-sumset-estimates）。**

```latex
\begin{lemma}[Triangle, covering, and multiple-sum estimates]
\label{inc-sumset-estimates}
Let the sets below be finite subsets of an abelian group.
\begin{enumerate}
\item If $Z$ is nonempty, then |X-Y|\,|Z|\le |X-Z|\,|Z-Y|.
\item If $Y$ is nonempty and $|X-Y|\le M|Y|$, then $X$ is contained in
the union of at most $M$ translates of $Y-Y$.
\item If $Y$ is nonempty and $|Y-Y|\le M|Y|$, then, for all nonnegative
integers $u,v$, |uY-vY|\le M^{u+v}|Y|.
\end{enumerate}
\end{lemma}
```

(i) Ruzsa 三角不等式的证明：为每个 $d\in X-Y$ 固定一个表示 $d=x_d-y_d$；映射 $(d,z)\mapsto(x_d-z,\ z-y_d)$ 从 $(X-Y)\times Z$ 注入 $(X-Z)\times(Z-Y)$，因为两坐标之和恢复 $d=x_d-y_d$，再用选定表示恢复 $z$。**中间步骤**：这是"选定表示"计数法， Injectivity 的代价是 $|X-Y||Z|\le|X-Z||Z-Y|$ 而非对称版本。
(ii) 覆盖引理：取极大的 $T\subseteq X$ 使 $\{t-Y:t\in T\}$ 两两不交；这些平移的并落在 $X-Y$ 内故 $|T|\le M$；极大性给出任何 $x-Y$ 与某个 $t-Y$ 相交，即 $x\in t+(Y-Y)$。
(iii) Plünnecke–Ruzsa（Petridis 极小子集证法）：取非空 $W\subseteq Y$ 最小化 $\mu=|W+Q_0|/|W|$（$Q_0=-Y$），则 $\mu\le M$ 且所有 $W'\subseteq W$ 满足 $|W'+Q_0|\ge\mu|W'|$。核心增长不等式是：对任意有限 $E_0$，
$$|W+Q_0+E_0|\le\mu|W+E_0|,$$
证明按 $E_0=\{e_1,\dots,e_k\}$ 逐个加入平移 $W+e_i$，记 $W_i'=\{w\in W: w+e_i\in\bigcup_{j<i}(W+e_j)\}$，新贡献为 $|W|-|W_i'|$，而 $W+Q_0+e_i$ 的新贡献至多 $|W+Q_0|-|W_i'+Q_0|\le\mu(|W|-|W_i'|)$（用到 $W_i'\subseteq W$ 的极小性）。求和得增长式；迭代得 $|W+jQ_0|\le\mu^j|W|$；最后用 (i) 消掉 $W$：
$$|uQ_0-vQ_0|\,|W|\le|W+uQ_0|\,|W+vQ_0|\le\mu^{u+v}|W|^2,$$
再用 $|W|\le|Y|$、$\mu\le M$ 与 $|uQ_0-vQ_0|=|uY-vY|$。

**机械性理由**：(iii) 需要"差集小"，这与几何步给出的形态（沿稠密图边缘的差/商受控）匹配；Petridis 证法被选中（而非原始 Plünnecke 图论）是因为它只依赖加法群结构，便于 Lean 里对任意 abelian 群实现。[推测] Lean 里对应的模块可能是直接对 Plünnecke 型不等式一次性引用/证明，因为 Incidence 目录下没有名为 Petridis 的文件。

**第二步：同时抽取（引理 inc-simultaneous-extraction）。**

```latex
\begin{lemma}[Simultaneous difference and quotient extraction]
\label{inc-simultaneous-extraction}
Let $F$ be a field, let $A,B\subseteq F^*$ be finite, and let
$G\subseteq A\times B$. Define
 D=\{a-b:(a,b)\in G\},\qquad J=\{a/b:(a,b)\in G\}.
Suppose that, for real numbers $n>0$ and $V\ge2$,
 |A|,|B|,|D|,|J|\le Vn, \qquad |G|\ge n^2/V.
Then there is $S\subseteq A$ such that
 \frac{3n}{8V^2}\le |S|\le Vn
and |S-S|,|S/S|\le 2^{20}V^{22}n.
\end{lemma}
```

证明逐步：
1. 令 $\tau=(512V^8)^{-1}$。$B$ 中邻居数 $<n/(2V^2)$ 的点合计贡献至多 $|B|\,n/(2V^2)\le n^2/(2V)$ 条边（每点至多 $Vn$ 个邻居），故存在大小 $\ge n/(2V^2)$ 的"大邻居"集合。
2. 坏序对 $(a,a_2)$：公共邻居 $<\tau n$。全 $A$ 上坏对至多 $V^2\tau n^3$；平均到大邻域 $A_0$（$|A_0|\ge n/(2V^2)$）内，坏对数 $\le 2V^4\tau n^2=n^2/(256V^4)\le|A_0|^2/64\le|A_0|^2/16$。
3. 丢弃在 $A_0$ 内有多于 $|A_0|/4$ 个坏伙伴的 $a$，剩 $S$ 满足 $|S|\ge3|A_0|/4$，从而 $3n/(8V^2)\le|S|\le Vn$。
4. 对 $a,a'\in S$：至少 $|A_0|/2$ 个 $a_2\in A_0$ 与两端都不坏，每个给至少 $(\tau n)^2$ 条四步游走 $a,b_1,a_2,b_2,a'$，合计每对端点至少
$$\frac{|A_0|}{2}(\tau n)^2\ge\frac{n^3}{2^{20}V^{18}}$$
条游走。
5. 差记账：四条边的差 $d_1=a-b_1,d_2=a_2-b_1,d_3=a_2-b_2,d_4=a'-b_2$ 满足 $a-a'=d_1-d_2+d_3-d_4$；固定 $a$ 后四差**唯一确定**游走（依次恢复 $b_1,a_2,b_2,a'$）。每个 $S-S$ 元素选一对端点，四差组按交错和不同而**不交**，故 $|S-S|\le|D|^4\cdot 2^{20}V^{18}/n^3\le2^{20}V^{22}n$。
6. 商记账：同一批游走的四个商 $j_1=a/b_1,j_2=a_2/b_1,j_3=a_2/b_2,j_4=a'/b_2$ 满足 $a/a'=j_1j_3/(j_2j_4)$；固定初始 $a$ 后四商恢复游走（$b_1=a/j_1,\ a_2=j_2b_1,\ b_2=a_2/j_3,\ a'=j_4b_2$），在 $J^4$ 里数出同一上界。

**机械性理由**：Gowers 型共同邻域方法被同时用于加法与乘法两组边标签——这是"同时"的全部内容；Balog–Szemerédi 分解被绕开（不需要抽稠密子图，因为假设直接给了 $|G|\ge n^2/V$）。指数 $2^{20}V^{22}$ 里：$V^{18}$ 来自游走计数下界的分母（$\tau^2$ 贡献 $V^{16}$、$|A_0|$ 贡献 $V^2$），$V^4$ 来自 $|D|\le Vn$ 的四次方。

**第三步：一致标量覆盖（引理 inc-scalar-coverings）。**

```latex
\begin{lemma}[Uniform scalar coverings]\label{inc-scalar-coverings}
Let $B$ be a nonempty finite subset of a field $F$, let $E\subseteq B$,
and let $K\ge2$. Suppose that |B-B|\le K|B|,
 \qquad |B-eB|\le 2K^3|B|\quad(e\in E).
Define C_0=4,\qquad C_{m+1}=3C_m+5,
 \qquad\text{so that }C_m=\frac{13\cdot3^m-5}{2}.
If $\lambda\in F$ has an expression in $E$ using at most $m$
operations, then $\lambda B$ is contained in at most $K^{C_m}$
translates of $B-B$. In particular, |E+\lambda E|\le |B+\lambda B|
 \le K^{C_m+3}|B|.
\end{lemma}
```

这是 BKT [Lemma 3.2 / Prop 3.3] 的"显式操作次数"版本。归纳按表达式长度：
- 固定 $H=B-B$（$H=-H\ni0$）。先备好 $2H$ 的覆盖：$|2H-B|=|2B-3B|\le K^5|B|$，用覆盖引理取 $|T_*|\le K^5$ 使 $2H\subseteq T_*+H$。
- 基例 $m=0$：每个 $e\in E$ 有 $eB\subseteq T_e+H$，$|T_e|\le2K^3\le K^4$；$0,1$ 各用一条平移。
- 加/减：$(\lambda\pm\mu)B\subseteq T\pm U+2H\subseteq T\pm U+T_*+H$，代价 $K^{a+b+5}$。
- 乘：$\lambda\mu B\subseteq\lambda U+\lambda H=\lambda U+(\lambda B-\lambda B)\subseteq\lambda U+T-T+T_*+H$，代价 $K^{b+2a+5}$（$\lambda=0$ 也成立）。
- 逆：$|\lambda B-B|\le|T|\,|H-B|=|T|\,|B-2B|\le K^{a+3}|B|$，缩放取负得 $|\lambda^{-1}B-B|\le K^{a+3}|B|$，再覆盖。
三种复合的最坏情形都 $\le K^{a+b+5}$（乘法 $b+2a+5\le$? 注意乘法其实可能是最坏——原文直接断言总代价 $\le K^{3C_m+5}$，因为每个二元运算把两个至多 $C_m$ 级的覆盖合成一个至多 $3C_m+5$ 级的覆盖：加法 $C_m+C_m+5$，乘法 $2C_m+C_m+5$。这是 $C_{m+1}=3C_m+5$ 的机械来源：**乘法需要把左因子整个平移族再膨胀**）。最后 $|B+\lambda B|\le|T|\,|B+H|=|T|\,|2B-B|\le K^{C_m+3}|B|$。

**机械性理由**：假设中 $|B-eB|\le2K^3|B|$（而非 $K|B$）的 "$2K^3$" 是为了从 $Z=S\cap eS$ 型重叠集出发经 Ruzsa 三角不等式后刚好落进来（见第四步），这是**下游估计反推上游假设**的典型痕迹。

**第四步：排除中间近似子域（引理 inc-no-approximate-subfield）。**

```latex
\begin{lemma}[Exclusion of an intermediate approximate subfield]
\label{inc-no-approximate-subfield}
There is no sequence of prime powers $q\to\infty$, each satisfying
the proper-subfield hypothesis of Theorem~\ref{thm:incidence}, together
with sets $S\subseteq\F_q^*$ and numbers $K\ge2$ such that
 |S|=q^{1/2+o(1)},\qquad K=q^{o(1)},\qquad |S-S|,|S/S|\le K|S|.
\end{lemma}
```

逐步：
1. **抽取标量覆盖假设**：令 $s=|S|$。$s$ 个集合 $S/a$（$a\in S$）各含 $s$ 元、并含于 $S/S$，Cauchy–Schwarz 给 $\sum_{a,b}|S/a\cap S/b|\ge s^4/|S/S|\ge s^3/K$。故某个 $b$ 的列和 $\ge s^2/K$；因每项 $\le s$，至少 $s/(2K)$ 个 $a$ 有 $|S/a\cap S/b|\ge s/(2K)$。令 $E=\{a/b\}$、$B=S/b$，则 $E\subseteq B$、$|E|\ge s/(2K)$、$|S\cap eS|\ge s/(2K)$（乘 $a$ 回去）。对 $Z=S\cap eS$ 用 Ruzsa 三角：
$$|S-eS|\le\frac{|S-Z|\,|Z-eS|}{|Z|}\le\frac{(Ks)^2}{s/(2K)}=2K^3s,$$
（"$2K^3$" 的出处！）缩放后 $|B-B|\le Ks$、$|B-eB|\le2K^3s$。
2. **差之比构成子域**：定义 $R_0=\{(x-x')/(y-y'): x,x',y,y'\in E,\ y\ne y'\}$。$R_0$ 的每个成员是 $E$ 中至多 4 次运算的表达式，于是 $r+r'$、$rr'$ 至多 9 次运算。对候选 $\lambda$，标量覆盖给出 $|E+\lambda E|\le K^{C_9+3}s<t^2$（比值 $4K^{C_9+5}/s\to0$，$t=|E|=q^{1/2+o(1)}$）。于是 $(x,y)\mapsto x+\lambda y$ 在 $E^2$ 上不单射；碰撞对必有 $y\ne y'$（否则 $x=x'$），给 $\lambda=(x'-x)/(y-y')\in R_0$。故 $R_0$ 对加乘封闭，又显然含 $0,1$、对取负与非零取逆封闭——是子域。
3. **真子域禁忌**：取不同 $e_0,e_1\in E$，映射 $e\mapsto(e-e_0)/(e_1-e_0)$ 把 $E$ 注入 $R_0$，故 $|R_0|\ge t>q^{1/3}$，真子域假设强迫 $R_0=\F_q$。
4. **找一个坏标量**：对 $\lambda\in\F_q$，令 $N_\lambda$ 为 $E^4$ 中 $x+\lambda y=x'+\lambda y'$ 的四元组数。$t^2$ 个恒等对总贡献碰撞；$y\ne y'$ 时恰一个 $\lambda$ 产生碰撞；$y=y'\ne x'$ 时无。故
$$\frac1q\sum_\lambda N_\lambda=t^2+\frac{t^4-t^3}{q}\le t^2+\frac{t^4}{q}.$$
Cauchy–Schwarz 于映射 $(x,y)\mapsto x+\lambda y$ 的纤维：某个 $\lambda$ 满足
$$|E+\lambda E|\ge\frac{t^4}{t^2+t^4/q}\ge\frac12\min(t^2,q)=q^{1-o(1)}.$$
但 $R_0=\F_q$ 使这个 $\lambda$ 有 4 次运算表示，于是 $|E+\lambda E|\le K^{C_4+3}s=q^{1/2+o(1)}$，矛盾。
**关键注记（原文强调）**："The expression length here remains bounded; no iteration of field generation is being used." 即只对**固定长度**表达式使用标量覆盖，$C_9$、$C_4$ 是常数——这是 $K=q^{o(1)}$ 能吸收 $K^{C_m}$ 的原因。

**第五步：定理 incidence 的组装**（反证 + 反例序列）：

1. 反证取反例序列：$\kappa_j\to0$，$q_j\to\infty$，$U=\max(2,q_j^{\kappa_j})=q^{o(1)}$，满足 $|P|,|\mathcal L|\le Uq$、$I\ge q^{3/2}/U$。
2. **剪枝**：每侧 $\sum_v d(v)^2\le2U^2q^2$（因 $\sum d(v)(d(v)-1)\le U^2q^2$：两条不同射影线恰交一点/两个不同射影点恰定一线；再加 $\sum d(v)\le U^2q^2$）。删初始度 $>H=16U^3q^{1/2}$ 的点：两侧共损失 $\le4U^2q^2/H=q^{3/2}/(4U)$。再迭代删当前度 $<d=q^{1/2}/(8U^2)$ 的点：至多 $2Uq$ 个点各删一次，损失 $\le q^{3/2}/(4U)$。存活集满足 $I\ge q^{3/2}/(2U)$、$q/(32U^4)\le|P|,|\mathcal L|\le Uq$、$d\le d(v)\le H$。
3. **全直线帽**：对任何射影线 $\ell$（含不在 $\mathcal L$ 的），$P\cap\ell$ 中每点关联 $\ge d-1$ 条 $\mathcal L$ 的其他线，不同点给不同线，故 $|P\cap\ell|\le|\mathcal L|/(d-1)\le16U^3q^{1/2}=H$。这个"对每条线"的强形式是后面丢锚点线上的见证时需要的。
4. **四锚点**：对 $x\in P$，$|N(x)|\ge d(d-1)\ge q/(128U^4)$（过 $x$ 的不同线在 $x$ 外不交）。设 $t_\ell=|N(x)\cap\ell|$；$\sum_{\ell\in\mathcal L}t_\ell\ge d|N(x)|\ge q^{3/2}/(1024U^6)$；$t_\ell\le2$ 的线合计 $\le2Uq$（$U=q^{o(1)}$ 最终只占一半以下），故 $\sum_{t_\ell\ge3}t_\ell\ge q^{3/2}/(2048U^6)$；由 $t(t-1)(t-2)\ge(2/9)t^3$（$t\ge3$）与 Hölder：
$$\sum_{\ell}t_\ell(t_\ell-1)(t_\ell-2)\ge\frac{2}{9|\mathcal L|^2}\Big(\sum_{t_\ell\ge3}t_\ell\Big)^3\ge\frac{q^{5/2}}{9\cdot2^{32}U^{20}}.$$
每个共线三组再配第 4 个点：$\ge q/(128U^4)-H\ge q/(256U^4)$ 个选择。对 $x$ 求和：至少 $q^{9/2}/(9\cdot2^{45}U^{28})$ 个有序五元组 $(x,p_1,p_2,p_3,p_4)$，$p_1,p_2,p_3$ 在 $\mathcal L$ 的某线上、$p_4$ 在线外、四点全在 $N(x)$。
5. **反数锚点**：四元组 $(p_1,p_2,p_3,p_4)$ 至多 $|\mathcal L|H^3|P|\le2^{12}U^{11}q^{7/2}$ 个（$p_1p_2p_3$ 所在线 $\in\mathcal L$、每个 $p_i\le H$ 个选择、$|P|\le Uq$），故某四元组有 $\ge c_0q/U^{39}$ 个见证，$c_0=1/(9\cdot2^{57})$。丢弃共线上的及 $p_1p_4$、$p_2p_4$ 连线上的见证（帽 $3H<\frac{c_0q}{2U^{39}}$ 最终成立）。
6. **四铅笔即坐标**：取射影坐标 $p_1=(1{:}0{:}0),p_2=(0{:}1{:}0),p_3=(1{:}1{:}0),p_4=(0{:}0{:}1)$（存在性：$p_1,p_2$ 代表张成其线，第三点两系数非零允许缩放前两者，$p_4$ 补全基）。丢弃的线恰为无穷远坐标线与过 $p_4$ 的两条坐标轴，故余下见证形如 $(a{:}b{:}1)$，$a,b\ne0$。四条连线方程 $X=aZ,\ Y=bZ,\ X-Y=(a-b)Z,\ X=(a/b)Y$ 恰好编码 $a,b,a-b,a/b$ 四个参数，且各属于 $\mathcal L$；参数不同则线不同，故 $|A|,|B|,|D|,|J|\le H$，而 $|G|\ge c_0q/(2U^{39})$。取 $n=q^{1/2}$、$V=\frac{2}{c_0}U^{39}$，则 $V\ge2$、$V=q^{o(1)}$，抽取引理适用：得 $S\subseteq\F_q^*$，$|S|=q^{1/2+o(1)}$，$|S-S|,|S/S|\le2^{20}V^{22}q^{1/2}$；令 $K=2^{23}V^{24}$ 即与第四步矛盾。

**(c) 常数理由**：$\kappa<1/10$ 是**下游** linecover 的指数预算反推的（低并发情形需要 $\kappa<1/10$ 使 $D-h(1/2-\kappa/4)<0$，见 2.3）；$q^{1/3}$ 子域界与奇次数的自洽（1.2 节）；$U=q^{o(1)}$ 序列化使所有 $U$ 的固定幂都被吸收。

**(d) [推测] 失败路线**：
1. **若真子域假设只做到 $q^{1/2+o(1)}$ 而非 $q^{1/3}$**：第四步中 $|R_0|\ge t>q^{1/3}$ 无法强迫 $R_0=\F_q$，"$\lambda\in R_0$"与"坏标量"脱钩，论证断在"标量有大和集"与"标量可被短表达式表示"的接缝处。这正是 BKT 原文用 $\F_{q^2}/\F_q$ 需要额外处理的地方。
2. **若同时抽取失败**（例如改用 Balog–Szemerédi 分别处理差与商）：两侧得到的子集 $S$ 不同，第四步需要**同一个** $S$ 同时差小、商小；分解误差 $V$ 的指数会翻倍，$K=q^{o(1)}$ 不再成立。
3. **若剪枝只对 $\mathcal L$ 内直线控制 $|P\cap\ell|$**：丢锚点线上的见证时无界可用，见证数从 $c_0q/U^{39}$ 掉到 0 以下，四锚点不存在。

---

### 2.2 引理 martingale（Freedman 型集中）\label{lem:martingale}

#### (a) 精确陈述

```latex
\begin{lemma}[Martingale concentration]\label{lem:martingale}
Let $Z_i$, $1\leq i\leq n$, be martingale differences for a filtration
$(\mathcal A_i)_{i=0}^n$. Suppose that $M,V>0$ and deterministic numbers
$v_i\geq0$ satisfy, almost surely, |Z_i|\leq M,\qquad
 \E(Z_i^2\mid\mathcal A_{i-1})\leq v_i,\qquad \sum_{i=1}^n v_i\leq V.
Then, for every $u>0$,
 \Pr\left(\left|\sum_{i=1}^n Z_i\right|\geq u\right)
 \leq 2\exp\left[-\frac14 \min\left\{\frac{u^2}{V},\frac{u}{M}\right\}\right].
\end{lemma}
```

#### (b) 证明机制

1. 对 $|z|\le1$ 用 $e^z\le1+z+z^2$：若 $|\theta|\le M^{-1}$，则 $|\theta Z_i|\le1$，条件均值零给
$\E(e^{\theta Z_i}|\mathcal A_{i-1})\le1+\theta^2\E(Z_i^2|\mathcal A_{i-1})\le1+\theta^2v_i\le e^{\theta^2v_i}$。
2. 迭代乘积 + Markov：上尾 $\le\exp(\theta^2V-\theta u)$，$0<\theta\le M^{-1}$。
3. 取 $\theta=\min\{u/(2V),1/M\}$：若 $u\le2V/M$，指数 $\ge u^2/(4V)$（因 $\theta^2V=u^2/(4V)$ 且 $\theta u\ge u^2/(2V)$，差为 $u^2/(4V)$）；否则 $\theta u\ge u/(2M)$、$\theta^2V\le u/(2M)$，指数 $\ge u/(2M)$……注意原文写 $\min\{u^2/V,u/M\}$ 乘 $1/4$，正是两个 regime 的统一。
4. 对 $-Z_i$ 重复得双侧。

**(c) 机械性理由**：条件方差版本（而非 Hoeffding 的有界差分版本）是 2.3 中"tuple 事件"需要的——那里增量的支撑集大（$2C_0$）但**方差被稀有性压小**（$C_0^2Dt^2/q$），只有 Freedman 型界能把稀有性变现成 $e^{-c_0t^2}$。这就是论文自述"we must use that rarity in the variance estimate"。

**(d) [推测] 失败路线**：
1. 若改用纯 Azuma（只用 $|Z_i|\le2C_0$）：偏差 $\delta t^2/2$ 与 $n\cdot2C_0\sim Dq\cdot C_0$ 相比根本不偏离——Azuma 在此完全无力，因为单个 trial 删掉整个 $P_0$ 的最坏情形淹没信号。
2. 若 $v_i$ 取确定性上界 $C_0^2$（而非稀有的 $\E(\cdot|\cdot)\le C_0^2Dt^2/q$）：总和 $V\sim DqC_0^2$，指数 $\sim\delta^2t^4/(VD)\sim t^4/(D^3q)$，当 $t^2\sim\log q$ 时为 $(\log q)^2/q\to0$，联合界失效。
3. 常数 $1/4$（而非 Freedman 原文的更优常数）是为了让 $\theta$ 的两个 regime 的推导只用初等不等式、避免精细的 Lambert-$W$ 优化——[推测] Lean 里这类解析不等式代价高，故意取保守常数。

---

### 2.3 引理 linecover（随机删除后的线覆盖）\label{lem:linecover}

#### (a) 精确陈述（TeX 原文，条件与结论）

```latex
\begin{lemma}[Line covers after random deletions]\label{lem:linecover}
Let $q\to\infty$ through prime powers for which every proper subfield
of $\F_q$ has order at most $q^{1/3}$. Fix a positive integer $D$ and
constants $\delta>0$ and $0<\rho<1$. For each $q$, let $\mathcal F$ be a
family of at most $Dq^D$ subsets of $\F_q^2$, called shapes, such that
\begin{enumerate}
 \item every $F\in\mathcal F$ has at most $Dq$ points;
 \item for every $F\in\mathcal F$ and affine line $\ell$, either
       $F=\ell$ or $|F\cap\ell|\leq D$.
\end{enumerate}
There are at most $Dq$ independent trials, each producing a random list
of at most $D$ shapes from $\mathcal F$. Delete every point on any listed
shape, and denote the surviving set by $X$. Assume that
\begin{enumerate}
 \item for each point $x$ and each trial, the probability that this
       trial deletes $x$ is at most $D/q$;
 \item $\Pr(x\in X)=\delta_q\geq\delta$ for every $x\in\F_q^2$;
 \item for each affine line $\ell$, the sum over trials of the
       probabilities that the trial lists the exact shape $\ell$ is
       at most $D/q$.
\end{enumerate}
Write $X^\ell$ for the surviving set when all exact occurrences of the
shape $\ell$ are ignored, with every other listed shape still deleted.
With probability tending to one, both of the following
statements hold:
\begin{enumerate}
 \item $|X^\ell\cap\ell|\geq\delta q/2$ for every affine line $\ell$;
 \item every set of at most $q$ affine lines covering all but at most
       $2q$ points of $X$ contains at least $(1-\rho)q$ lines through a
       common projective point.
\end{enumerate}
\end{lemma}
```

论文强调（引言处）："The deletions within a single trial may be dependent; independence is required only between trials."——单次试验内删一整族线没关系，跨试验独立即可。

#### (b) 证明机制（分四层）

**层 1：一致计数（GoodCounts 对应物）。**
- 暴露单个试验时 $|X|$ 至多变 $2D^2q$（新旧列表共 $\le2D$ 个形状，每个 $\le Dq$ 点）；用伴生论文的暴露界（Lemma A.3）与固定时刻集中（Lemma A.2），$L=2D^2q$、$u=q^{3/2+\epsilon}$：
$$\Pr\bigl||X|-\delta_qq^2\bigr|\ge q^{3/2+\epsilon}\bigr)\le2\exp\bigl(-q^{2\epsilon}/(32D^5)\bigr).$$
- 线计数 $|X^\ell\cap\ell|$：忽略精确 $\ell$ 后单个试验只变计数 $2D^2$（每个形状与 $\ell$ 交 $\le D$ 点）；$u=q^{1/2+\epsilon}$ 得同型尾。
- 精确-$\ell$ 恢复的点只能来自"列出 $\ell$ 本身"的试验，其概率和 $\le D/q$（假设 3），故 $\delta_qq\le\E|X^\ell\cap\ell|\le\delta_qq+D$。
- $q(q+1)$ 条仿射线做联合界，以概率 $\to1$ 同时成立：
$$|X|=\delta_qq^2+O_D(q^{3/2+\epsilon}),\qquad |X^\ell\cap\ell|=\delta_qq+O_D(q^{1/2+\epsilon})\ (\forall\ell).$$
第一条证结论 1；又 $X\subseteq X^\ell$ 给一致上界 $|X\cap\ell|\le\delta_qq+O_D(q^{1/2+\epsilon})$（结论 2 的证明要用来数覆盖量）。

**层 2：短样本的同时事件（tuple 事件）。**
- 记 $h=10(D+1)$、$H_0=2Dh$、$t=\lceil A\log q\rceil$。固定有序 $2t$ 条不同直线（两份长度 $t$ 的表），称**可行（admissible）**若：
  (i) 跨表交点集 $P_0$ 由 $t^2$ 个不同有限点组成；(ii) 每个不等于某表线的形状 $F$ 有 $|F\cap P_0|\le H_0$。
- 对该 tuple，忽略一切等于表线的删除形状，令 $Y_0$ 计 $P_0$ 中幸存者。断言：以概率 $\to1$，**每个**可行 tuple 有 $Y_0\ge\delta t^2/2$。
- 证明：$\E Y_0\ge\delta t^2$（忽略形状只会恢复点）。每个试验在 $P_0$ 内的删除贡献 $\le C_0=DH_0$；贡献非空概率 $\le Dt^2/q$（对 $P_0$ 联合 + 每点删除假设）。暴露鞅的增量：$g_i(w)$ 对 $g_i(\varnothing)$（该试验不删 $P_0$）的偏离 $\le C_0$ 且非空时才非零，故 $|Z_i|\le2C_0$ 且
$$\E(Z_i^2|\text{past})\le C_0^2\cdot Dt^2/q,$$
总和 $V\le D^2C_0^2t^2$（$\le Dq$ 个试验）。用 2.2 于偏差 $\delta t^2/2$：
$$\Pr(Y_0<\delta t^2/2)\le2e^{-c_0t^2},\qquad c_0=\min\{\delta^2/(16D^2C_0^2),\ \delta/(16C_0)\}>0.$$
注意 $c_0$ **不依赖** $A$。tuple 总数 $\le(q(q+1))^{2t}$，联合界的对数 $-c_0t^2+4t\log q+O(t/q)+O(1)=(-c_0A^2+4A+o(1))(\log q)^2$，取任意 $A>5/c_0$ 即可（"$5$"来自 $c_0A^2-4A>0\iff A>4/c_0$，留余量）。

**层 3：从一个冒犯覆盖出发的确定性论证。**
- 固定满足两层事件的实现。设结论 2 失败：从冒犯覆盖删去所有"真的被某试验列为删除形状"的线（这样的线上没有 $X$ 的点），余集 $L$ 仍覆盖 $X$ 的除 $\le2q$ 点外的全部。$m=|L|\le q$，$n_p=$ 过 $p$ 的 $L$ 线数。
- 计数：$m(\delta_qq+O_D(q^{1/2+\epsilon}))\ge\delta_qq^2-O_D(q^{3/2+\epsilon})-2q$，由 $\delta_q\ge\delta$ 与 $m\le q$ 得
$$m=q-O_{D,\delta}(q^{1/2+\epsilon}),\qquad E_L:=\sum_{x\in X}(n_x-1)_+=O_D(q^{3/2+\epsilon}).$$
（$E_L$ 的估计：$\sum_{\ell\in L}|X\cap\ell|$ 减去被覆盖幸存者数，重复覆盖每个多余点贡献 1。）
- $R=\max_p n_p$；结论 2 失败即 $R\le(1-\rho)q$。要在 $L$ 中找到可行 tuple，其跨交点在 $X$ 中者 $<\delta t^2/2$。分两段。

**低并发情形 $R\le q^{1/2+\kappa/4}$：**
- 取 $T=q^{1/2-\kappa/3}$。轻点（$n_x<T$）的有序对贡献 $\le TE_L=O(q^{2-7\kappa/30})$（指数：$1/2-\kappa/3+3/2+\kappa/10=2-7\kappa/30$，$\kappa/10$ 是 $\epsilon$）。重点集 $P=\{x\in X:n_x\ge T\}$ 有 $|P|\le E_L/(T-1)=O(q^{1+13\kappa/30})\le q^{1+\kappa}$，incidence 定理给 $\sum_{x\in P}n_x\le q^{3/2-\kappa}$，其有序对贡献 $\le R\sum_{x\in P}n_x\le q^{2-3\kappa/4}$。合计占比 $O(q^{-7\kappa/30}+q^{-3\kappa/4})=o(1)$。
- 均匀抽样 $2t$ 条不同线：跨对交在 $X$ 中的期望 $=t^2\cdot o(1)$，Markov 给 $<\delta t^2/2$ w.h.p.。
- 可行性 (i)：平行对概率 $\le R/(m-1)$；指定三元共点概率 $\le R/(m-2)$；总退化概率 $O((t^2+t^3)R/m)=O((\log q)^3q^{-1/2+\kappa/4})=o(1)$。无平行对、无三线共点时：跨交点全有限（两表内线不平行；原文的机制是"两表"设定下平行即退化事件的一部分）且互异——两个跨交点相等将强迫至少三条 tuple 线共点。
- 可行性 (ii)：若形状 $F$（非表线）含 $>H_0$ 个跨交点，则每条表线含 $F$ 的 $\le D$ 点；贪心选取：每次取一个跨交点及其两个代表位置，弃掉这两条线上的所有跨交点（每步 $\le2D$ 点），得 $h$ 个跨对、$2h$ 个位置互异。种群层面：非表线对的、交点落在 $F$ 上的有序对 $\le mDR$（第一条线交 $F$ 于 $\le D$ 点、每点处第二条线 $\le R$ 选择）。$2h$ 个位置抽到这 $h$ 个对的概率 $\le t^{2h}(mDR)^h/(m)_{2h}$。对形状族求和：
$$O\bigl((\log q)^{2h}q^{D-h(1/2-\kappa/4)}\bigr)=o(1),$$
因为 $\kappa<1/10$、$h=10(D+1)$ 使 $D-h(1/2-\kappa/4)<D-\frac{19}{4}(D+1)<0$。**这就是 $\kappa<1/10$ 的机械出处**：$\frac{19}{4}=4.75$，需要 $h(1/2-\kappa/4)>D$，即 $10(D+1)\cdot\frac{1}{2}(1-\kappa/2)>D$，只要 $1-\kappa/2>\frac{2D}{10(D+1)}<\frac{1}{5}$，$\kappa$ 可以小到任何 $<0.9$ 的数——不，更精确地：需要 $5(D+1)(1-\kappa/2)>\frac{4D}{10}$？重算：$h(1/2-\kappa/4)=10(D+1)(1/2-\kappa/4)=5(D+1)-\frac{5}{2}(D+1)\kappa$。要 $>D$ 即 $\frac{5}{2}(D+1)\kappa<4(D+1)+D$，对任何 $\kappa<1/10$ 显然成立且裕量巨大——所以 $\kappa<1/10$ 实际上不是被这一处逼出的下限，而是 incidence 定理里固定 $\kappa\in(0,1/10)$ 后全篇统一使用；原文在此处显式验证了它的充分性。
- 归纳 $h$ 的选取：$h=10(D+1)$ 使 (a) $H_0=2Dh$ 有限步贪心可行，(b) 形状和的指数 $D-h(1/2\mp\kappa/4)$ 严格负且有裕量。

**高并发情形 $R>q^{1/2+\kappa/4}$：**
- 取 $p$ 使 $n_p=R$，$L$ 中过 $p$ 的 $R$ 条线为 pencil，补集大小 $N=m-R\ge\rho q/2$（由 $m=q-O(q^{1/2+\epsilon})$）。第一表从 pencil 无放回抽 $t$ 条，第二表独立地从补集抽 $t$ 条。
- 跨交点全在 $p$ 外；$x\in X$ 处恰一条 pencil 线穿过，交在 $x$ 的跨对数是补集线过 $x$ 的条数 $n_x-1$，故交在 $X$ 的跨对至多 $E_L$ 个，占比
$$\frac{E_L}{RN}=O(q^{\epsilon-\kappa/4})=O(q^{-3\kappa/20})=o(1).$$
- 有限性/互异性：固定补集线，至多一条 pencil 线与它在无穷远交（$p$ 有限时）；$p$ 在无穷远时 pencil 有方向 $p$、补集线方向全不同，跨交全有限。概率 $\le t^2/R$。碰撞：两跨交点相等 ⇒ 同一 pencil 线（不同 pencil 线只在 $p$ 相交而 $p$ 不在任何补集线上）；给两条补集线，其射影交与 $p$ 的连线至多决定一条仿射 pencil 线；条件在第二表上联合，概率 $O(t^3/R)$。合计 $O((t^2+t^3)/R)=O((\log q)^3q^{-1/2-\kappa/4})=o(1)$。
- 形状 (ii)：$DN$ 个种群跨对（补集线交 $F$ 于 $\le D$ 个不在 $p$ 的点、每点定唯一 pencil 线）、两表独立，概率 $\le t^{2h}(DN)^h/(R)_h(N)_h=O_{D,h}((t^2/R)^h)$；求和 $O((\log q)^{2h}q^{D-h(1/2+\kappa/4)})=o(1)$，因 $D-h(1/2+\kappa/4)<D-5(D+1)<0$。注意这里 $h$ 只需 $>D/4$ 级，比低并发更宽裕。

**层 4：矛盾与选择顺序。**
- 两情形都给出：对每个足够大 $q$，固定线集 $L$ 内存在可行 tuple，其 $|X\cap P_0|<\delta t^2/2$。但 $L$ 中没有线真的被列为删除形状，故忽略其表线的精确出现**不改变**这个实现里的任何删除，tuple 的 $Y_0=|X\cap P_0|$，与层 2 的事件矛盾。
- 原文显式强调选择顺序（"the order of choices"）：

> In particular, the cover and the tuple are allowed to depend on the
> realized deletions: the event \eqref{eq:lc-tuple-event} was established
> simultaneously for every admissible tuple before fixing the
> realization. Sampling from $L$ is used only to prove the existence of
> a tuple inside that fixed realization. No concentration estimate is
> conditioned on the choice of the cover.

即"事件先对一切可行 tuple 同时建立，再暴露删除、再谈覆盖"——这是整个随机论证合法性的枢纽，也是 Lean 里最需要小心的条件结构。

**(c) 假设的机械性理由汇总**：
- 形状界 (1) $|F|\le Dq$：控制单试验对 $|X|$ 的暴露增量。
- 形状界 (2) $|F\cap\ell|\le D$ 除非 $F=\ell$：控制线计数增量与 (ii) 的贪心步。
- 假设 1（每点删除概率 $\le D/q$）：$\E Y_0\ge\delta t^2$ 与 $Z_e$ 期望界的来源。
- 假设 2（一致存活 $\delta$）：计数层的中心项。
- 假设 3（精确列出 $\ell$ 的概率和 $\le D/q$）：保证"忽略精确 $\ell$"只恢复 $O(1)$ 个期望点——这在 gadget 应用里是自动的（$D=3$ 时精确概率为 0），在环境应用里来自"每方向至多两组、每组 $s-1$ 条、概率 $1/q$"（见 2.6）。
- $2q$（结论 2 中的未覆盖余量）：恰好平衡 $m=q-O(q^{1/2+\epsilon})$ 的推导——$2q$ 允许 $E_L=O(q^{3/2+\epsilon})$ 的重复计数上界；更小的余量会迫使 $E_L$ 的界更紧、低并发的轻点贡献失控。

**(d) [推测] 失败路线**：
1. **把"试验间独立"放松为"形状间独立"**：tuple 事件的鞅是按试验暴露的；若同一试验内部形状相关（ gadget 应用中正是如此：一个候选平移删 $(s-1)^2$ 条线），则层 1/层 2 的增量界 $2D^2q$、$C_0=DH_0$ 仍对（只用了"每次试验的增量"），但**假设 1、2、3 的验证**会需要整体概率计算；真正的风险在 $Z_e$ 的条件独立性（2.4 selection 用的"试验内条目独立"）不成立处。
2. **若 $\rho$ 依赖 $q$**（如 $\rho=q^{-\eta}$）：高并发补集 $N\ge\rho q/2$ 太小，$E_L/(RN)$ 的指数 $\epsilon-\kappa/4+\eta$ 变正，跨对占比不再 $o(1)$；这就是 Lean 里 $\rho=\delta/10$（固定比值）被硬编码进 `GoodAmbientPool` 的原因。
3. **若 tuple 长度取常数而非 $\log q$**：联合界 $(q(q+1))^{2t}$ 变 $q^{O(1)}$ 而 $e^{-c_0t^2}$ 是常数，无法同时成立；反之取 $t\gg\log q$ 则 $t^2$ 尾虽然更大但采样退化概率 $(t^2+t^3)R/m$ 变大——$A$ 的窗口（$4/c_0<A$ 且退化项 $(\log q)^3q^{-1/2\pm\kappa/4}\to0$ 对任何固定 $A$）相当宽，真正的约束是 $A$ 固定。

---

### 2.4 引理 sel-domination + 定理 selection（相容平移选择）\label{sec:selection}

#### (a) 精确陈述

```latex
\begin{lemma}[A domination certificate]\label{sel-domination}
Let a finite simple graph have a vertex partition into nonempty parts
$A_1,\ldots,A_n$.  If there is no independent set containing one
vertex from each part, then there are a nonempty index set $I$ and a set
 T\subseteq\bigcup_{i\in I}A_i, \qquad |T|\le 2(|I|-1),
such that $T$ dominates $\bigcup_{i\in I}A_i$.
\end{lemma}
```

```latex
\begin{theorem}[Compatible translates from independent pools]\label{thm:selection}
For every positive integer $D$ there is a positive integer $K=K(D)$
with the following property.  Let $q$ tend to infinity through prime
powers.  For each $q$, let $n\le Dq$, and for $1\le i\le n$ let
$W_i\subseteq\F_q^2$ and let $D_i$ be a set of directions, with
 |W_i|\le D,\qquad |D_i|\le D.
Assume that each direction belongs to $D_i$ for at most $D$ indices $i$.
For distinct indices $i,j$, declare the translates $b+W_i$ and
$b'+W_j$ to conflict if there are $u\in W_i$, $v\in W_j$, and
$d\in D_i\cup D_j$ such that (b+u)-(b'+v)\in d.
For each $i$, draw $K$ independent uniform shifts
$b_{i,1},\ldots,b_{i,K}\in\F_q^2$, independently for all indices.
With probability tending to one, one can choose $k_i\in\{1,\ldots,K\}$
for every $i$ so that the translates $b_{i,k_i}+W_i$ have no conflicts.
The convergence is uniform over all data satisfying the stated bounds.
\end{theorem}
```

论文点明与 Haxell 的关系："The certificate argument is a weaker form of Haxell's independent-transversal domination theorem [Haxell2001]... Haxell's theorem uses total domination, which also requires neighbors for the vertices of the dominating set. Here we use the following weaker convention."（$T$ 自身的顶点不要求有邻居。）

#### (b) 证明机制

**引理 sel-domination 的证明（增长式论证）：**
1. 取**包含极小**的无独立横截的部子族，指定一个部 $A_*$；$\mathcal U$ = 其余各部的独立横截族（极小性保证非空）。亏缺子族至少两部。
2. 任取 $x_1\in A_*$，在 $\mathcal U$ 中最小化 $|N(x_1)\cap U|$，记 $Y_1$。$Y_1\ne\varnothing$：否则 $x_1$ 可拼接。
3. 归纳不变量：(1) $Y_1,\dots,Y_j$ 非空两两不交，且存在 $U\in\mathcal U$ **同时实现** $N(x_a)\cap U=Y_a$（$1\le a\le j$）；(2) 每步在满足先前等式的 $U$ 中最小化；(3) $x_a\in A_*$ 或属于某个更早 $Y_b$ 的代表部。
4. 记 $Y=\bigcup Y_a$、$I$ = {指定部} ∪ $Y$ 的代表部、$T=\{x_1,\dots,x_j\}\cup Y$。则 $|I|=|Y|+1$、$j\le|Y|$、$T\subseteq\bigcup_{i\in I}A_i$、$|T|\le j+|Y|\le2(|I|-1)$。
5. 若 $T$ 不支配：取 $T$ 外无 $T$ 邻居的 $x_{j+1}$；在实现等式的 $U$ 中最小化 $|N(x_{j+1})\cap U|$ 得 $Y_{j+1}$。它避开所有 $Y_a$（$x_{j+1}$ 无 $T$ 邻居）。**非空**：若空且 $x_{j+1}\in A_*$，拼接成亏缺子族的横截；否则其部含 $Y$ 中唯一顶点 $y\in Y_b$，换入 $U'=(U\setminus\{y\})\cup\{x_{j+1\}$ 仍是横截，且 $a<b$ 的旧等式保持（$y\notin Y_a$、$x_{j+1}$ 不邻 $x_a$），而 $a=b$ 的计数变 $|Y_b|-1$，违反第 $b$ 步最小化——原文特别注明："the contradiction uses only the equalities preceding stage $b$; preservation of later equalities is not required."
6. 每次延续给 $Y$ 添加新部的顶点，而 $Y$ 装在一条固定横截里，故只能延续有限次；过程停止时 $T$ 支配。

**定理 selection 的证明：**
1. 图：顶点 = 候选位置 $(i,k)$，按池分部；不同池之间按冲突连边。独立横截 = 所求选择。用引理，只需证 w.h.p. 无支配证书 $(I,T)$，$|I|=m$、$|T|\le2m$。**$I,T$ 在暴露平移前固定。**
2. 禁忌方程：对用到的方向 $d$ 固定核为 $d$ 的非零线性泛函 $\pi_d$；暴露 $T$ 的平移后，称 $b$ 对目标 $i$ **可行**若避免一切
$$\pi_d(b)=\pi_d(b_e)+\pi_d(v-u),\qquad u\in W_i,\ v\in W_j,\ d\in D_i\cup D_j,\ e\in T.$$
（明确连 $i=j$ 也禁止——"This only makes feasibility more restrictive"，是保守化。）
3. 常数 $C=2D^3$、$c_1=1/(4C)$、$\alpha=1/(2C)$：一个已暴露候选 $e$ 对一个目标 $i$ 至多 $C$ 条禁忌方程，每条禁一条含 $q$ 个平移的仿射线。
4. 证书计数：$|I|\le\binom{n}{m}\le(eDq/m)^m$；$|T|\le2m$ 的候选集 $\le(C_*K^2)^m$（$K\ge6$，用 $\sum_{t\le r}\binom Nt\le(eN/r)^r$，$N=Km$、$r=2m$）。
5. **小范围 $1\le m\le c_1q$**：条件在 $T$ 的平移上，新平移不可行的概率 $\le C|T|/q\le2Cm/q\le1/2$；目标池里未暴露候选至少 $(K-2)m$ 个条件独立均匀，故支配概率 $\le(2Cm/q)^{(K-2)m}$。与两个计数合并：
$$\Bigl[2CeDC_*K^2\Bigl(\frac{2Cm}{q}\Bigr)^{K-3}\Bigr]^m\le\Bigl[2CeDC_*K^2\,2^{-(K-3)}\Bigr]^m\le(1/2)^m,$$
取 $K$ 满足 $2CeDC_*K^2\,2^{-(K-3)}\le1/2$。固定截断内求和趋于零、余下是几何尾。
6. **大范围 $m>c_1q$（可行密度估计）**：目标是对每个固定 $(I,T)$，
$$\Pr\Bigl[\sum_{i\in I}|U_i^{\mathrm{fin}}|<\delta_1mq^2\Bigr]\le\exp(-\Omega_D(q\log q)),$$
其中 $\delta_1=\delta_1(D)$ **不依赖 $K$**——这是整个大范围论证的支点。
   - 把 $T$ 的候选按顺序切成至多 $J_0=\lceil4D/\alpha+1\rceil$ 个大小 $\le\lfloor\alpha q\rfloor$ 的块。
   - 块开始时冻结各 $U_i$；块内条目 $e$（源池 $j$）定义 $Z_e$ = 该条目在各 $(i,e)$ 禁忌方程下从各 $U_i$ 实际删掉的平移数（$D_i,D_j$ 分开计、容重复——重复计数只会高估损失，保守化）。$0\le Z_e\le Cmq$、$\E Z_e\le CM/q$。
   - **方差分解**：$Z_e=Z_e^{(1)}+Z_e^{(2)}$。$Z_e^{(1)}$（目标方向表 $D_i$ 的项）按方向分组，不同方向的 $(\pi_d(b_e),\pi_{d'}(b_e))$ 是 $\F_q^2$ 上双射故独立均匀，组界 $D^3q$、组数 $\le Dm$，$\Var\le D^7mq^2$。$Z_e^{(2)}$（源方向表 $D_j$ 的项）：每个 $(i,d)$ 项是均匀抽样线片计数，方差为切片方差
$$V_{i,d}=\frac1q\sum_{\ell\parallel d}\Bigl(|U_i\cap\ell|-\frac{|U_i|}{q}\Bigr)^2,$$
   而**仿射二阶矩恒等式** $\sum_dV_{i,d}=|U_i|-|U_i|^2/q^2\le|U_i|$（对全部 $q+1$ 个方向求和；即伴生论文 Lemma A.1，"it has no randomness, characteristic, or subfield hypothesis"——对任何有限仿射平面的任何子集恒成立）把所有方向的方差一次性兜住。Cauchy–Schwarz（无独立性假设）给 $\Var(Z_e^{(2)})\le D^5mA_e$，$A_e=\sum_{i\in I}\sum_{d\in D_j}V_{i,d}$。
   - 能量记账：每个源池至多 $K$ 个块内条目、每方向至多属 $D$ 个源表，故 $\sum_{e\in\text{chunk}}A_e\le KD\sum_{i,d}V_{i,d}\le KDmq^2$。称 $e$ **规则**若 $A_e\le mq^{3/2}$；不规则条目至多 $KD\sqrt q$ 个。规则条目 $\Var(Z_e)\le2D^7mq^2+2D^5m^2q^{3/2}$，Chebyshev：
$$\Pr\bigl[Z_e>CM/q+\gamma mq\bigr]\le2D^7/(\gamma^2m)+2D^5/(\gamma^2\sqrt q)\le B_{D,\gamma}q^{-1/2}.$$
（最后一步用 $m>c_1q$。$B_{D,\gamma}$ 不依赖 $K$。）
   - **条件独立 + 联合**：规则性由冻结集决定、与 $b_e$ 无关；块内规则条目的 $Z_e$ 是独立随机变量的函数。子集联合界：$\ge\lceil\gamma q\rceil$ 次超阈的概率 $\le2^{\lceil\alpha q\rceil}(B_{D,\gamma}q^{-1/2})^{\lceil\gamma q\rceil}\le\exp(-c_{D,\gamma}q\log q)$。取 $q$ 大使 $KD\sqrt q\le\gamma q$。
   - **块递推**：除坏事件外，块内除 $\le2\gamma q$ 个例外条目外都规则且低于阈值；实际损失 $\le\sum_eZ_e$（用块初的冻结集上界），例外条目每个 $\le Cmq$，其余每个 $\le\gamma mq$：
$$M'\ge M-C\alpha M-\alpha\gamma mq^2-2C\gamma mq^2=\tfrac12M-(\alpha+2C)\gamma mq^2.$$
   - 取 $\gamma$ 使 $2(\alpha+2C)\gamma\le2^{-J_0-1}$、$\delta_1=2^{-J_0-1}$；初值 $M=mq^2$，迭代 $J\le J_0$ 块：
$$M_{\mathrm{fin}}/(mq^2)\ge2^{-J}-(\alpha+2C)\gamma\sum_{a=0}^{J-1}2^{-a}\ge2^{-J_0}-2(\alpha+2C)\gamma\ge\delta_1.$$
   条件尾对一切过去成立，平均过去、联合 $J_0$ 块即得密度估计。**注意 $J_0,\gamma,\delta_1$ 只依赖 $D$；$K$ 只影响 $q$ 的下限**。
7. **未用候选的指数收益**：条件在 $T$ 的平移与密度成功事件上，池 $i$ 的未暴露候选仍独立均匀，可行概率 $|U_i^{\mathrm{fin}}|/q^2$。目标池全部不可行的概率
$$\le\exp\Bigl(-\sum_{i\in I}(K-t_i)|U_i^{\mathrm{fin}}|/q^2\Bigr)\le\exp(-(K\delta_1-2)m)$$
（用 $\sum_i|U_i^{\mathrm{fin}}|/q^2\ge\delta_1m$、$|U_i^{\mathrm{fin}}|\le q^2$、$\sum_it_i=|T|\le2m$；对整池被 $T$ 覆盖的情形也成立——"it does not assume $K-t_i$ is positive in every target pool"）。
8. **大范围联合**：$(I,T)$ 对数 $\le A_K^m$，$A_K=(eD/c_1)C_*K^2$（只随 $K$ 二次增长）。密度失败总和 $\exp(O_{D,K}(q))\exp(-\Omega_D(q\log q))=o(1)$；其余失败每对 $\le\exp(-(K\delta_1-2)m)$，取 $K$ 使 $A_K\exp(2-K\delta_1)<1/2$，求和 $\le\sum2^{-m}=o(1)$。这样的 $K$ 存在因为 $\delta_1$ 不依赖 $K$ 而 $A_K=O(K^2)$。
9. 最终常数顺序：$D$；$C,c_1,\alpha,J_0,\gamma,\delta_1$；$K$；$q$。

**(c) 机械性理由**：
- $|W_i|\le D$、$|D_i|\le D$：使每候选-每目标的禁忌方程数 $C=2D^3$ 为常数——$D^3$ 来自 $|W_i|\cdot|W_j|\cdot|D_i\cup D_j|$ 的三重积。
- "每方向至多属 $D$ 个 $D_i$"：大范围论证中能量记账 $\sum A_e\le KDmq^2$ 与组数 $\le Dm$ 的来源；没有它，$Z_e^{(1)}$ 的方差会带 $m^2$。
- $\delta_1$ 与 $K$ 解耦：$K$ 要先于 $q$ 固定（selection 的输出 $K$ 是 placement 的输入），而失败概率的指数 $K\delta_1$ 需要压过 $A_K$ 的多项式增长——若 $\delta_1$ 隐含依赖 $K$，第 8 步的不等式 $A_K\exp(2-K\delta_1)<1/2$ 可能无解。
- 禁忌对 $i=j$ 也施加：把"同池两候选冲突"也纳入，使 Feasible 的定义与暴露次序无关（lean 中 `Feasible data T pool i b` 正是对每个 $e\in T$ 无冲突，不分池）。

**(d) [推测] 失败路线**：
1. **若 $W_i$ 的大小允许依赖 $q$**（如 $|W_i|=s^2$ 而 $s$ 随 $q$ 长）：$C$ 不再常数，小范围的 $(2Cm/q)^{(K-2)m}$ 指数失效；论文的用法恰好 $|W_i|=s^2$ **固定**（$s$ 先定），定理假设 $|W_i|\le D$ 中 $D$ 吸收了 $s^2$。
2. **若池大小 $K$ 想依赖 $q$**：大范围的 $\exp(O_{D,K}(q))$ 项变 $\exp(O(q\log q))$，与密度失败的 $\exp(-\Omega(q\log q))$ 同阶，联合失败——这就是"pool size 固定、次数 $n\to\infty$"的渐近结构的不可简化处。
3. **若不引 dominaton certificate 而直接对每个池做 LLL**：冲突图的依赖度是 $O(DK)$ 级、坏概率 $O(D/q)$ 级，LLL 需要 $ep(DK+1)\le1$ 即 $K=O(1)$——看似可行，但 LLL 给不出"一致地 over 所有数据"的收敛率声明，且 conflict 事件的概率在 $m$ 大时不再独立有界（证书的存在性是全局事件）。[推测] 论文选 Haxell 路线是因为证书计数给出显式联合界，便于 Lean 复现。

---

### 2.5 引理 gadget（两套坐标的核心构形）\label{sec:gadget}

#### (a) 精确陈述（TeX 原文）

```latex
\begin{lemma}\label{lem:gadget}
For every sufficiently large prime \(s\equiv2\pmod3\), there is
a set \(Y\subseteq\F_s^2\) with the following properties.  For each
\(d\in\F_s^*\), there is an affine line \(\ell_d\) of slope \(d\), and
 Y=\F_s^2\setminus\bigcup_{d\in\F_s^*}\ell_d.
For each \(d\in\F_s^*\), every line of slope \(d\) other than
\(\ell_d\) contains at least five points of \(Y\).  The map
 f:\F_s^2\longrightarrow\F_s^2, \qquad f(x,y)=(x^3,y),
is a bijection, and every affine line contains at least \(s/8\) points
of \(f(Y)\).  Moreover, if \(a\) affine lines and \(b\) individual
points cover \(f(Y)\), and
\begin{equation}\label{con-weighted-budget}
 a+\frac b2\le s,
\end{equation}
then \(a=s\), \(b=0\), and the lines form a full parallel class.
Consequently every such mixed cover has weighted cost at least \(s\),
and no cover of \(f(Y)\) by at most \(s\) lines contains two
nonparallel lines.
\end{lemma}
```

这个引理是全文的"刚度黑箱"：$Y$ 与 $f(Y)$ 是**同一个随机对象的两种读法**——原坐标下它每条非删除线有 $\ge5$ 个点（供"外部点"情形用：每条删除线释放 5 条例外边），新坐标下它每条线有 $\ge s/8$ 个点且小覆盖唯一（供"内部/无穷远"情形用）。

#### (b) 证明机制

**双射性**：$s\equiv2\pmod3\Rightarrow\gcd(3,s-1)=1\Rightarrow$ 立方在 $\F_s^*$ 上是置换且固定 0；$f$ 分量式双射。$f$ 把水平线映到水平线、竖直线映到竖直线（这两族被**逐条保持**：$(x,y)\mapsto(x^3,y)$ 下 $y$ 不变、$x^3$ 跑遍全 $\F_s$）。

**原坐标的存活**：独立地、在每个非零斜率的平行类内均匀地选 $\ell_d$。固定斜率 $d$ 的线 $\ell\ne\ell_d$：先忽略 $\ell_d$ 的选择，其余 $s-2$ 个选择各删 $\ell$ 上一个均匀分布点，故
$$\mu:=\E Z_\ell=s(1-1/s)^{s-2}.$$
改一个选择改变幸存数至多 2；用伴生论文 A.2/A.3 于暴露鞅（$T=s-2$、$L=2$、$u=\mu/2$）：
$$\Pr(Z_\ell<\mu/2)\le2\exp\Bigl(-\frac{\mu^2}{128(s-2)}\Bigr)=\exp(-\Omega(s)),$$
（$\mu\sim s/e$，$\mu^2/(128s)\sim s/(128e^2)$。）联合界少于 $s^2$ 条线；$\mu/2\ge5$ 对大 $s$。**最后** reinstating $\ell_d$：$\ell\ne\ell_d$ 时两者平行，$\ell_d$ 不碰 $\ell$ 的任何点，计数不变。

**新坐标的存活与刚度**：新坐标下的删除形状是曲线
$$F_{d,z}=\{(x^3,dx+z):x\in\F_s\},\qquad d\in\F_s^*,\ z\in\F_s,$$
共 $s(s-1)$ 个、每个 $s$ 点；每个试验（每个斜率 $d$ 的均匀选线）在新坐标下均匀选 $F_{d,z}$（$z$ 均匀）。每点被指定试验删除的概率 $=1/s$（形状过给定点当且仅当 $z=$ 点的 $d$-截距），故整体存活率均匀：
$$\delta_s=(1-1/s)^{s-1}\ge\frac14\quad(s\text{ 大}).$$
每个形状与任何仿射线交 $\le3$ 点：
- 竖线 $x=c$：$x^3$ 双射给唯一交点。
- 水平线 $y=u$：$dx+z=u$ 解唯一（$d\ne0$）。
- 斜率 $m\notin\{0,\infty\}$：$dx+z=mx^3+u$，非零三次多项式方程。
且 $s>5$ 时形状本身不是直线（否则 3 点界与 $|F_{d,z}|=s>3$ 矛盾）。于是 linecover 引理适用于域 $\F_s$（素域，子域假设自动成立），取 $D=3$、$\delta=1/4$、$\rho_0=1/100$：以概率 $\to1$，每条线含 $\ge s/8$ 个 $f(Y)$ 点，且"大小 $\le s$、留 $\le2s$ 点"的线覆盖含 $\ge(1-\rho_0)s$ 条共点线。

**几乎铅笔 ⇒ 完整平行类**：设满足加权预算 $\eqref{con-weighted-budget}$ 的混合覆盖。去重不减预算；线部分至多 $s$ 条，留 $\le b\le2s$ 个未覆盖点。linecover 给 $\ge(1-\rho_0)s$ 条共点线（中心 $p$），故 $b\le2(s-a)\le2\rho_0s$（$a$ 为线总数，$\ge(1-\rho_0)s$）。若某条过 $p$ 的仿射线缺席：
- 共点的那些线至多盖它 1 个仿射点（都在 $p$ 或在线上唯一交点）；
- 其余 $\le\rho_0s$ 条线至多再盖 $\rho_0s$ 个点；
- 单点资源至多 $2\rho_0s$ 个；
合计 $\le1+3\rho_0s<s/8$，与该线含 $\ge s/8$ 个 $f(Y)$ 点矛盾。故过 $p$ 的仿射线**全部在场**：$p$ 有限要 $s+1$ 条 > 预算；$p$ 在无穷远则恰是完整平行类（$s$ 条），预算 $a+\frac b2\le s$ 强迫 $a=s$、$b=0$。

两个坐标系的事件同时以概率 $\to1$ 成立，故每个大 $s\equiv2\pmod3$ 都有成功的 $(Y,\{\ell_d\})$。

**存在性兜底**：$\equiv2\pmod3$ 的素数无限——原文给出两行证明：若素数表有限、乘积 $P$，则 $3P-1\equiv2\pmod3$ 有一个 $\equiv2\pmod3$ 的素因子，且它不整除 $P$。

**(c) 机械性理由**：
- "每条非删除线 $\ge5$ 个 $Y$ 点"中 **5** 这个数不是任意的：它被最终覆盖论证的"外部点"情形精确消耗——每条删除线给 5 条未覆盖例外边、每个附加顶点至多盖 5 条，$5(h_p-1)<5h_p$ 差 1 就是矛盾；任何 $\ge1$ 都够，但 5 给了容差（有的例外边可能重复等），Lean 里硬编码 5。
- $s/8$：来自 $\delta_s\approx1/e$ 乘 linecover 的 $\delta q/2$（$\delta=1/4$ 时 $\ge s/8$）——两个常数 $\frac12\times\frac14$ 的乘积。
- 加权 $1/2$ 的点代价：它使"内部点"情形能用 $2+(h_p-1)\le s$ 的**线数**预算覆盖 $f(Y)$（两条轴线各顶 1 条线、附加顶点各顶 1 条线），同时使"双组无穷远"情形的合并计数 $a_i+b_i'/2$ 能与 $|C\setminus F_p|$ 直接比较。$1/2$ 是使两种记账兼容的最粗公共单位。
- $\rho_0=1/100$：来自 $1+3\rho_0s<s/8$（$\rho_0<1/24$ 即可）与 linecover 中 $A>5/c_0$ 的联合界的共同裕量。

**(d) [推测] 失败路线**：
1. **换任何非常值多项式 $\phi(x)$ 代 $x^3$**：需要 (i) $\phi$ 置换 $\F_s$（$s\equiv2\pmod3$ 的立方恰好是最简单的非常值置换多项式族），(ii) $\deg(\phi\cdot$线$-\ell)\le D$ 小且 $\deg\phi=3$ 使"形状≠线"成立。$\deg$ 更大的置换多项式给 $D>3$，linecover 的形状和指数 $D-h(1/2-\kappa/4)$ 变号风险增大；线性 $\phi$ 则失去"曲线"性质，新坐标下删除形状还是线，精确列出概率假设 (3) 无法满足。
2. **若 $Y$ 的删除线取非均匀分布**（如各斜率相关联）：原坐标存活用的是"每个其他选择在 $\ell$ 上均匀"——相关性会破坏 $\mu=s(1-1/s)^{s-2}$ 与暴露鞅的零漂移。事实上 gadget 恰好只需逐斜率独立、类内均匀。
3. **若想直接对 $Y$（不过 $f$）证刚度**：原坐标的删除形状就是线，"精确列出 $\ell_d$ 本身"的概率是 $1/s$ 量级非零，linecover 假设 (3) 勉强满足，但混合覆盖的分类会失败——$Y$ 的小覆盖可以是"删掉的那 $s-1$ 条线附近"的琐碎覆盖，刚度不真；$f$ 的作用正是把删除线**弯成曲线**，使"精确命中"归零、刚度结论成为可能。这是 $f$ 存在的第一性理由。

---

### 2.6 环境放置：删除计数与池性质\label{sec:placement}

#### (a) 结构数据（原文照抄关键定义）

陪集代表 $\Lambda\subseteq\F_q^*/\F_s^*$（$1\in\Lambda$），$\mathcal I=\Lambda\sqcup\{*\}$，$N_q=(q-1)/(s-1)+1$：
```latex
M_\lambda(x,y)=(x,\lambda y), \qquad S_\lambda=\lambda\F_s^*, \qquad A_\lambda=\{0,\infty\}.
M_*=\begin{pmatrix}1&1\\u&v\end{pmatrix}, S_*=(\F_s\cup\{\infty\})\setminus\{u,v\}, A_*=\{u,v\}.
```
$M_*$ 的有限斜率像是 $(u+vt)/(1+t)$（零分母给 $\infty$），把 $s-1$ 个非零子域斜率**恰好**映到 $S_*$。所有 $S_i$ 大小 $s-1$；陪集 $S_\lambda$ 划分全部非零有限斜率，$S_*=\F_s\cup\{\infty\}\setminus\{u,v\}$ 补上 $0,\infty$——故每个环境方向属且仅属一或两个 $S_i$，且
```latex
\begin{equation}\label{con-double-directions}
 S_1\cap S_* = \F_s^*\setminus\{u,v\},
\end{equation}
```
即**重复方向只出现在组 1 与组 $*$ 之间**。相容用方向集 $D_i=S_i\cup A_i$（$i\in\{1,*\}$）或 $S_i$（其余），特别地 $D_1=D_*=\PP^1(\F_s)$（`con-conflict-directions`）："Since $|W_i|=s^2$, $|D_i|\le s+1$, and $N_q=O_s(q)$, a fixed constant depending only on $s$ satisfies all size and multiplicity assumptions of Theorem~\ref{thm:selection}."

**Lean 对应速记**：`ConfigurationGroup σ = Option (CosetIndex σ)`（`none` ↔ 组 $*$，`some c` ↔ 陪集 $c$）；`groupPlacement σ u v huv none = PlaneLinearMap.extra (σ u) (σ v) _`、`some c ↦ cosetPlacement σ c`；`groupAltered` ↔ $S_i$（`alteredDirections`），`groupAxes` ↔ $A_i$（`axisDirections`，恒 2 元）；`groupConflict` ↔ $D_i$（`none` 与 `some 1` 都给 `embeddedDirections σ`，即 $\PP^1(\F_s)$ 的像）。`groupAltered_multiplicity_le_two` 就是"每方向至多两组"。

#### (b) 引理 con-deletion-count（每候选的删除线清单）

```latex
\begin{lemma}\label{con-deletion-count}
For every candidate and every \(d\in S_i\), exactly \(s-1\)
lines of \(\mathcal B_{i,k}\) have direction \(d\).  Each of
these lines contains at least five points of \(Y_{i,k}\).
Consequently \(|\mathcal B_{i,k}|=(s-1)^2\).
\end{lemma}
```
证明：平移回去、用 $M_i^{-1}$ 拉：环境线（方向 $d=M_i(t)$，$t$ 子域非零方向）碰到 $P_{i,k}$ 当且仅当其对应的子域线非删除线；该子域平行类 $s$ 条中恰一条是 $\ell_t$，其余 $s-1$ 条各含 $\ge5$ 个 $Y$ 点（gadget），且这些子域线延伸成**不同**的环境平行线。故 $(s-1)^2$ 条、每条 $\ge5$ 点。

Lean 对应：`deletedLines σ M b a` 的方向过滤恒等式（DeletionLines.lean）：
```lean
theorem deletedLines_direction_eq_image (σ : k →+* F) (M : PlaneLinearMap F)
    (b : Point F) (a : GadgetOutcome k) (ha : OriginalLineDensity a)
    (t : NonzeroSlope k) :
    (deletedLines σ M b a).filter
        (fun ell => ell.1 = placedDirection σ M (some t.val)) =
      (Finset.univ.erase (a t)).image
        (fun c : k => placedLine σ M b (some t.val, c))
```
——方向 $M_i(t)$ 的删除线恰是"截距 $\ne a(t)$（被删截距）"的 $s-1$ 条；`OriginalLineDensity a` 定义为
```lean
def OriginalLineDensity (a : GadgetOutcome k) : Prop :=
  ∀ t : NonzeroSlope k, ∀ c : k, c ≠ a t →
    5 ≤ ((retainedPoints a).filter (fun p => Incidence p (some t.val, c))).card
```
即论文的"每条非删除线 $\ge5$ 个 $Y$ 点"。

#### (c) 引理 con-pool-properties（全池删除估计）

```latex
\begin{lemma}\label{con-pool-properties}
There are constants \(\delta\in(0,1)\) and \(\rho=\delta/10\), independent
of \(n\), with the following properties with probability tending to one as
\(n\) tends to infinity through odd integers. Let
 X_{\rm pool} =\F_q^2\setminus \bigcup_{i\in\mathcal I}\bigcup_{k=1}^K \bigcup_{\ell\in\mathcal B_{i,k}}\ell.
\begin{enumerate}
\item Every cover of \(X_{\rm pool}\) by at most \(q\) affine
lines contains at least \((1-\rho)q\) lines through a common
projective point.
\item For every affine line \(\ell\), if only exact occurrences
of \(\ell\) are ignored in the pool deletions, at least
\(\delta q/2\) points of \(\ell\) remain.
\item For every finite point \(p\) and affine line \(\ell\)
not through \(p\), at most five groups \(i\) have a candidate
\(P_{i,k}\) containing a point \(y\in\ell\) whose join to
\(p\) has direction in \(S_i\).
\end{enumerate}
\end{lemma}
```

验证 linecover 假设：形状族 = 全部 $q(q+1)$ 条环境线；试验 = $KN_q=O_{s,K}(q)$ 个候选平移，各列 $m=(s-1)^2$ 条线。$D$ 取足够大的仅依赖 $s,K$ 的常数。
- 每点删除概率：候选的删除集是固定 $m$ 线并的均匀平移，点删除概率 $m/q$ 与点无关；$\delta_q$ 一致。$m/q\le1/2$、$N_q\le2q/(s-1)$、$\log(1-t)\ge-2t$：
$$\delta_q\ge(1-m/q)^{KN_q}\ge\exp(-2KN_qm/q)\ge\exp(-4K(s-1)),$$
固定 $\delta=\exp(-4K(s-1))$、$\rho=\delta/10$。
- 精确线概率（`con-exact-line-probability`）：方向 $d$ 的线只能由 $d\in S_i$ 的至多两组列出，每组 $s-1$ 条平移线，每条成为 $\ell$ 的概率 $1/q$：
$$\le\frac{2K(s-1)}q.$$
- 第 3 条（**"5 组"性质**）：固定 $p\notin\ell$。组 $i$ 的一个候选至多有 $s-1$ 个可能的 $y\in\ell$ 使 $py$ 方向 $\in S_i$（每方向至多一个交点）；固定点属该候选的概率 $s^2/q^2$；候选级别概率 $\le(s-1)s^2/q^2$。若 6 个组都命中，选见证候选各一，共 $\le(KN_q)^6=O_{s,K}(q^6)$ 种选择、平移独立，固定 $(p,\ell)$ 概率 $O(q^{-6})$；$(p,\ell)$ 至多 $q^2q(q+1)=O(q^4)$ 对，联合失败 $O_{s,K}(q^{-2})$。

**Lean 对应**：`PoolThin (W S ω) : ∀ p ell, ¬Incidence p ell → (poolBadGroups W S p ell ω).card ≤ 5`，`ShiftHits W S p ell b : ∃ w∈W, ∃ d∈S, Incidence (b+w) ell ∧ projection d (b+w) = projection d p`；失败概率界
$$|F|^3(|F|+1)|G|^6(Kws/|F|^2)^6$$
（`prob_not_poolThin_le`），其中 $w=|W_i|\le s^2$、$s=|S_i|\le s+1$（实际 $s-1$）——正是论文第 3 条的 6 组联合界（6 幂而非 5：联合在"存在 6 个坏组"上）。

**(d) [推测] 失败路线**：
1. **若组数不是 $O_s(q)$ 而是 $q$ 的更高次**（比如对每个 $\F_s$-仿射子平面都放一组）：第 3 条的联合界 $(KN_q)^6q^4$ 变 $O(q^7)$ 量级、失败概率不再趋零；组数 $N_q=(q-1)/(s-1)+1$ 由陪集分解**天然**只有 $O(q)$，这是把 $\PP^1(\F_q)$ 按 $\F_s^*$ 陪集铺满的极小方案。
2. **若 $u,v$ 允许为 0 或相等**：$M_*$ 退化（不可逆或 $S_*$ 大小错），$(u+vt)/(1+t)$ 不再把子域斜率双射到 $S_*$，"每方向至多两组"破坏——Lean 里 `exists_distinct_nonzero` 提供的 $u\ne v\ne0$ 是必需输入。
3. **若第 3 条的常数 5 想改成 1**：不可能——一个 $y\in\ell$ 的加入方向 $S_i$ 与 $p$ 的关系不排除多组同向；5 恰是第 2.5 节 gadget "每线 5 点"的镜像常数，两者必须匹配（见 2.10 外部点情形）。

---

### 2.7 选择与估计的确定性转移\label{sec:transfer}

论文的转移段（原文关键句）：

> By Theorem~\ref{thm:selection}, with probability tending to one the
> same pool admits one candidate per group with no conflicts.
> Intersect this event with those of Lemma~\ref{con-pool-properties}.
> No independence between these events is needed.  For every
> sufficiently large odd integer \(n\), their intersection has positive
> probability, so fix a pool in the intersection and a conflict-free
> selection.

- 相容选择给出分离蕴含（`con-separation`）：
```latex
\begin{equation}\label{con-separation}
 i\ne j,\quad \operatorname{dir}(\ell)\in D_i,\quad \ell\cap P_i\ne\varnothing
 \quad\Longrightarrow\quad \ell\cap P_j=\varnothing.
\end{equation}
```
特别地 $P_i$ 两两不交（公共点给零差，零向量属每个方向）。
- 选中删除线之并 $B$，$X=\F_q^2\setminus\bigcup_{\ell\in B}\ell$。**转移的关键是两个方向的包含**：
  - $X\supseteq X_{\rm pool}$（选中删除 ⊆ 全池删除）——池级"几乎铅笔"结论对 $X_{\rm pool}$ 成立 ⇒ 对 $X$ 成立（覆盖 $X$ 的 $\le q$ 条线更覆盖 $X_{\rm pool}$）。
  - 反向：若 $\ell\notin B$，则**忽略精确 $\ell$ 后**每个选中删除线仍是池列表成员（选中候选是池成员），故 $X\supseteq$（修正后池过程的幸存集），于是
```latex
\begin{equation}\label{con-selected-line-bound}
 \ell\notin B \quad\Longrightarrow\quad |X\cap\ell|\ge\frac{\delta q}{2}.
\end{equation}
```
  - 原文强调包含是**确定性**的："it holds even if $\ell$ occurs in an unselected candidate and even though the selected shifts depend on the whole pool."（即使 $\ell$ 出现在未选候选中、即使选中平移依赖全池也成立。）
- 第 3 条（5 组）对选中也成立，因为它对**所有**池候选成立。

Lean 对应：`GoodAmbientPool σ u v huv a ha K pool` 的三分量定义——
```lean
Selection.HasCompatibleChoice (groupSelectionData σ u v huv)
    (ambientFlatPoolEquiv σ K pool) ∧
LineCover.GoodLineCover (ambientDeletionDelta s K) (…/10)
    (ambientPoolConfig …) ∧
PoolThin (groupPoints σ u v huv) (groupAltered σ u v huv) pool
```
三个事件在池律 `poolThinLaw` 下各以概率 $\ge3/4$ 成立，联合界 $3\times\frac14<1$（Lean 的 `exists_goodAmbientPool_uniform` 用 `prob_mono`+`prob_union_le`+`linarith` 做交非空论证，与论文文字完全同构）；阈值 $Q=QS+QL+QT+2(s-1)^2+\lceil10/\delta\rceil+1$——最后一项 $QF=\lceil10/\delta\rceil+1$ 对应论文的 $\delta q/2>1+\rho q$ 强迫 $q>10/\delta$。

[推测] 失败路线：若把"先全池估计、后选择、再包含转移"改成"先选择、再对选中集跑 linecover"，则删除过程不再是独立试验的乘积律（选中依赖所有平移），linecover 的假设 1–3 无法验证；转移的包含结构是这个证明唯一能自洽的顺序。

---

### 2.8 超图装配与相交性\label{sec:hypergraph}

#### (a) 顶点、部、边

- $r=q+1$；部 $V_d$ 一一对应方向 $d\in\PP^1(\F_q)$。
- 普通顶点：每条环境仿射线 $\ell$（方向 $d$）给 $o_\ell\in V_d$。
- 特殊顶点：$d\in S_i$ 时，$t_i(d)\in\F_s^*$ 是 $M_i$ 下映为 $d$ 的唯一子域方向；对 $t_i(d)$ 方向的 $s$ 条子域仿射线 $L$ 各给 $v_{i,d,L}\in V_d$（按组 $i$ 打标签、组间不混淆）。
- 普通边 $e_x=\{o_{\ell_d(x)}:d\in\PP^1(\F_q)\}$，$x\in X$。
- 例外边：$w\in Y$、$y_{i,w}=b_i+M_iw$，
```latex
\begin{equation}\label{con-exceptional-vertex}
 v = \begin{cases}
 v_{i,d,L_{t_i(d)}(f(w))},& d\in S_i,\\
 o_{\ell_d(y_{i,w})},&d\notin S_i.
 \end{cases}
\end{equation}
```
- $H=\{e_x:x\in X\}\cup\{e_{i,w}:i\in\mathcal I,\ w\in Y\}$；每边每部恰一顶点 ⇒ $(q+1)$-部 $(q+1)$-匀称；$Y\ne\varnothing$ ⇒ 非空。

**Lean 对应**：`ConfigurationData k F G` 是抽象装配记录：`altered : G → Finset (Direction F)`（$S_i$ 族）、`inverseSlope`（$t_i(d)$，存成 subtype 索引）、`base : G → Point k → Point F`（$y_{i,w}$ 的逆像）、`transform : Point k → Point k`（$f$）、`retained : Finset (Point k)`（$Y$）、`ordinaryPoints : Finset (Point F)`（$X$）。顶点类型
```lean
abbrev Vertex (altered) := AffineLine F ⊕ (Σ i : G, {d // d ∈ altered i} × k)
```
——普通顶点 = 直线本身（`Sum.inl`），特殊顶点 = (组, 方向, 子域截距) 三元组（`Sum.inr`）。`exceptionalVertex` 的 `dite` 分支逐字实现 (con-exceptional-vertex)。`hypergraph data = ordinaryPoints.image (ordinaryEdge data) ∪ univ.biUnion fun i => retained.image (exceptionalEdge data i)`。部函数 `vertexPart`：普通给 `ell.1`、特殊给方向；`PartiteUniform` 的 Lean 定义是 `∀ e ∈ H, ∀ i, ∃! v, v ∈ e ∧ part v = i`（每边每部唯一顶点）——比论文的"分部 + 每边恰一"更直接可证。

#### (b) 命题 con-intersection（相交 + 边互异）

```latex
\begin{proposition}\label{con-intersection}
The hypergraph \(H\) is intersecting.  Furthermore, all the edges
in its displayed parametrization are distinct.
\end{proposition}
```

证明按边对类型分四款：
1. **普通×普通**：不同基点共享连线的普通标签。
2. **普通×例外**：例外基点 $y\in Y_i$ 落在每个 $S_i$ 方向的一条删除线上（删除线定义：含 $Y_{i,k}$ 点的 $S_i$ 方向线），故 $y\notin X$；$x\in X$ 与 $y$ 的连线**不能**有方向 $\in S_i$——否则该连线是被选删除线、含 $x$，矛盾。于是连线的普通标签同时属于 $e_x$ 与例外边。这正是"两套坐标"的第一处咬合：删除是按 $y_{i,w}$ 记账的，相交却在 $f(w)$ 的标签下读出，由普通标签兜底。
3. **例外×例外，不同组**：基点不同（`con-separation`），连线方向 $\notin D_i\cup D_j\supseteq S_i\cup S_j$，共享连线的普通标签。
4. **例外×例外，同组** $e_{i,w},e_{i,w'}$，$w\ne w'$：$f(w)\ne f(w')$。若连线斜率 $t$ 有限非零：两条边共享子域线 $L_t(f(w))$（斜率 $t$）在部 $M_i(t)$ 的特殊标签。若连线水平/竖直：$f$ 保持这两族，$f(w),f(w')$ 的相应原坐标也相等，故原基点 $w,w'$ 共享 $A_i$ 方向的普通轴标签。

互异性：两个非平行方向的普通标签定基点 ⇒ 普通边互异；例外边有特殊标签、不等于普通边；同组内两个 $S_i$ 方向的特殊标签定出 $f(w)$（子域线不平行），故同组例外边互异（$|S_i|=s-1\ge2$）；跨组的特殊标签带组戳、别的组的边没有 ⇒ 跨组互异。

**Lean 对应**：`Intersection.lean` 的通用几何引理链——`exceptionalEdge_inter_of_projection_eq`（普通标签兜底款：给一条方向不在两侧 altered 的线，其普通顶点同时在两边）、`ordinaryEdge_inter_exceptional_edge`（havoid 条款：`∀ d∈altered i, projection d x ≠ projection d (base i w)`——即"普通点不在删除线上"的投影形式）、`exceptionalEdge_inter_sameGroup`（同组款，其输入条款 `haxisTransport` 逐字对应"$f$ 保持两轴平行类"：`projection a (transform p) = projection a (transform q) → projection (directions a) (base i p) = projection (directions a) (base i q)`）、`exceptionalEdge_injective`（同组互异，需要 `transform` 单射与 `inverseSlope i d ≠ inverseSlope i e`——$|S_i|\ge2$ 的抽象化）、`ordinaryEdge_ne_exceptionalEdge` / `exceptionalEdge_ne_of_group_ne`（跨型互异）。总装 `hypergraph_intersecting_of_geometric_data` 把六款列成两条几何输入：`havoid`（普通点与每个例外基点在 altered 方向的投影不同）与 `hseparate`（不同组基点在彼此 altered 方向投影不同 = `DeletionSeparated`）。

#### (c) 机械性理由
- 特殊顶点带**组戳**且 $v_{i,d,L}$ 只在同组边中出现：这是"跨组互异"的来源，也是 Lean 里特殊顶点用 `Σ i : G, ...` 而非裸截距的原因。
- 删除线在**所有** $S_i$ 方向都有（每方向 $s-1$ 条）：第 2 款相交需要"例外基点不在 $X$"对每个 $S_i$ 方向的说法成立——实际只需要一条删除线即可推出 $y\notin X$，但"连线的方向 $\in S_i$ ⇒ 连线是删除线"需要该方向的删除线**覆盖 $y$**，这正是 `con-deletion-count` 的内容。
- $D_i\supseteq S_i\cup A_i$ 对 $i=1,*$ 加轴线：使第 3 款的连线方向避开 $S_i\cup S_j$ 时也避开两组的轴——这是后面双组情形"轴顶点贡献不外溢"的前提（2.9/2.10）。

#### (d) [推测] 失败路线
1. **若 $f$ 换成不保持任何平行类的置换**（如 $f(x,y)=(x^3,y^3)$）：第 4 款的"水平/竖直时原坐标相等"断裂，同组例外边可能不相交。$f$ 保持**恰好两条**平行类是最小需求；Lean 的 `haxisTransport` 条款对 `a = none ∨ a = some 0` 两条轴方向成立即可，这解释了为什么 $M_*$ 要把两条轴映到 $u,v$ 并把它们从 $S_*$ 中剔除（$A_*=\{u,v\}$ 不被 altered）。
2. **若两个例外边同组且 $f(w),f(w')$ 连线斜率恰在 $S_i$ 的边界**：斜率 $t$ 非零有限即可用特殊标签，无边界问题；真正的边界是 $t=0,\infty$——已被轴条款吸收。
3. **若允许 $s=3$**：$|S_i|=s-1=2$ 勉强够互异，但 gadget 的 $5$ 点性质与 $s/8$ 都失败（$s/8<1$）；$s>5$ 在多处隐式使用，Lean 里是 `3 < Fintype.card k` 与 `5 < p`。

---

### 2.9 引理 con-label-action（顶点在小平面坐标下的作用）

```latex
\begin{lemma}\label{con-label-action}
Fix a group \(i\).
\begin{enumerate}
\item A special vertex of group \(i\) covers the positions on one
subfield line.  A special vertex of another group covers none.
\item An ordinary vertex of direction in \(S_i\) covers none.
An ordinary vertex of direction in \(A_i\), if it covers any
positions, covers them on a single horizontal or vertical line in
the \(f\) coordinates.
\item An ordinary vertex of direction outside \(S_i\cup A_i\)
covers at most one position.
\end{enumerate}
In particular, the positions covered by any one vertex are contained
in a subfield affine line.
\end{lemma}
```

（"位置"= 例外边的参数化位置 $e_{i,w}\leftrightarrow f(w)\in f(Y)$。）

证明：第 1 条直接由 (con-exceptional-vertex)——特殊顶点 $v_{i,d,L}$ 出现在 $e_{i,w}$ 中当且仅当 $f(w)\in L$。第 2 条：$S_i$ 方向的普通顶点不在任何例外边（该方向标签是特殊的）；轴方向（$A_i$）： Undo 平移与 $M_i$ 固定一个原坐标，$f$ 后变成 $f$ 坐标的水平或竖直线。第 3 条：方向在 $S_i\cup A_i$ 之外的直线不能含 $P_i$ 的两点（$P_i$ 的连线方向恰是 $S_i\cup A_i$），故至多盖一个位置；单点可并入任意过它的子域线、空集不耗资源。

**Lean 对应**：`ExceptionalCover.lean` 的分类装置——
```lean
def LineCapable (data axes i) : Vertex … → Prop
  | Sum.inl ell => ell.1 ∈ axes i
  | Sum.inr tag => tag.1 = i
def lineResources := C.filter fun v => LineCapable … ∧ ActiveExceptional …
def pointResources := C.filter fun v => ¬LineCapable … ∧ ActiveExceptional …
```
`lineCapable_has_line`：线型资源顶点给一条子域线盖住其全部位置（普通轴顶点给 `cubeMap_incidence_axis_of_placed_incidence`，特殊顶点直接给截距线）；`not_lineCapable_unique`：非线型顶点若活跃则其所有位置共享同一 $f$-像（普通顶点方向在 `altered ∪ axes` 之外时 `placedPoint_eq_of_incidence_outside_altered_axis`；他组特殊顶点直接矛盾）。注意 Lean 把论文第 2、3 条**合并**为二分法：`LineCapable`（线资源）/ 非 `LineCapable`（点资源，每顶点至多一个 $f$-像）——论文第 3 条的"至多一个位置"与第 2 条的"轴顶点在一条线上"被统一成"线型给线、点型给点"的二元资源模型，这正是把 gadget 的加权预算 $a+b/2$ 接上来的接口。

#### (d) [推测] 失败路线
1. **若允许一个顶点同时是两组的线资源**（例如两个组的轴方向重合而顶点不带组别）：加权合并论证（2.10 双组情形）的"每附加顶点合计贡献 $\le1$"断裂——两组会重复计算同一顶点。Lean 用 `lineResources_disjoint_other_of_axis_subset`（需要 `axes i ⊆ altered j` 假设，即 $D_i\supseteq A_i$ 对共享方向组成立）显式排除。
2. **若轴方向也被 altered**：$f$ 保轴的性质无从使用（例外基点的连线可能落在 altered 方向，第 2 款相交也断）——这就是 $A_i$ 与 $S_i$ 必须分离、$M_*$ 特意不 alter $u,v$ 的机械理由。
3. **若"位置"改用 $y_{i,w}$ 参数化**（而非 $f(w)$）：特殊顶点的覆盖集不再是子域线（它连到 $f(w)$ 而不是 $y_{i,w}$），gadget 的刚度结论无处施加。

---

### 2.10 主定理的最终覆盖论证（三情形）\label{sec:final}

#### (a) 论证设置

反设 $|C|\le q$ 的覆盖。普通顶点读作仿射线后覆盖 $X$（特殊顶点不在任何普通边——Lean: `specialVertex_notMem_ordinaryEdge`）。这些线更覆盖 $X_{\rm pool}$，由 con-pool-properties (1) 得射影点 $p$ 使 $C$ 中 $\ge(1-\rho)q$ 个普通顶点（线）过 $p$。

**强制引理**（`con-forced-pencil`）：
```latex
\begin{equation}\label{con-forced-pencil}
 p\in\ell,\quad\ell\notin B
 \quad\Longrightarrow\quad o_\ell\in C,
\end{equation}
```
证明：若 $o_\ell\notin C$，过 $p$ 的其他线至多盖 $\ell$ 的 1 个仿射点；-pencil 外至多 $\rho q$ 个顶点、每个的普通线至多再盖 1 点、特殊顶点盖 0；故 $|X\cap\ell|\le1+\rho q$，与 `con-selected-line-bound` 的 $\delta q/2>1+\rho q$（$\rho=\delta/10$）矛盾。$p$ 在无穷远时铅笔线平行、"过 $p$ 的其他线"恰是同方向其余线，上界照用。

记 $F_p$ = 被强制的普通顶点，附加顶点 = $C\setminus F_p$。$F_p$ **不盖任何** $I_d$ 组（$d\in S_i$）的例外边——那些组在方向 $d$ 用特殊标签（Lean: `forcedPencilVertices_no_action_of_altered`）。

**Lean 的强制顶点定义**（`forcedPencilVertices data B p` = 数据里删除线集 $B$ 中过 $p$ 的线的普通顶点，即 $B\cap\text{pencil}(p)$ 的 $o_\ell$）；`forcedPencilVertices_subset_of_near_pencil` 证明它 ⊆ $C$，其输入 `hgap : 1 + ρ*|F| < δ*|F|/2` 正是 $\delta q/2>1+\rho q$。

#### (b) 情形一：$p$ 在无穷远（方向 $d$）

- $I_d=\{i:d\in S_i\}$、$z=|I_d|\in\{1,2\}$（每组贡献 $s-1$ 条删除线，`con-deletion-count`）。
- $|C\setminus F_p|\le z(s-1)$。
- **$z=1$**：该组例外位置必须被 $\le s-1$ 个附加顶点覆盖；由 con-label-action 每个顶点的效果可并入一条子域线，得 $f(Y)$ 被 $\le s-1$ 条线覆盖——违反 gadget（任何 $\le s$ 线的覆盖不含两条不平行线，何况 $s-1$ 条盖不住）。Lean: `single_infinite_center_impossible`，其中 `exceptional_cover_card_lower_bound` 从 gadget 的 `weighted_card_lower_bound`（$B=\varnothing$）读出 $|C\setminus F_p|\ge|k|$。
- **$z=2$**（组 $1,*$）：附加顶点可同时服务两组，改用加权记账。对每组 $i$：$a_i$ = 附加顶点中"本组特殊顶点或轴方向普通顶点"者数（线资源），$b_i'$ = 其余覆盖者数（点资源，各盖一个位置）。gadget 加权结论给
```latex
\begin{equation}\label{con-two-group-lower}
 a_i+\frac{b_i'}2\ge s \qquad (i=1,*).
\end{equation}
```
  合并：特殊顶点只在己方组记账；轴顶点是方向 $\in A_i\subseteq D_i$ 的线且碰 $P_i$，由 `con-separation` 它不碰 $P_j$（$j\ne i$），故连"作为点资源服务 $j$"都不可能；其余顶点对每组至多贡献 $1/2$（点资源）。于是
$$2s\le a_1+\tfrac{b_1'}2+a_*+\tfrac{b_*'}2\le|C\setminus F_p|\le2(s-1),$$
矛盾。
  **Lean 对应**：`double_infinite_center_impossible`——`exceptional_resource_weight_lower_bound` 给 $2|k|\le2|L_i|+|B_i|$（即 $a_i+b_i'/2\ge|k|$），`two_group_resource_budget_impossible` 是纯组合引理：两个不相交资源组、轴资源跨组不相交（输入 `lineResources_disjoint_other_of_axis_subset`，其假设 `axisDirections σ (M i) ⊆ alteredDirections σ (M j)` 来自 `shared_groupAltered_axes_subset`——重复方向只在组 $1,*$ 之间、而 $A_1\subseteq D_*=S_*\cup A_*$……实际 Lean 条款是 `shared_groupAltered_axes_subset σ u v huv hu hv hij hi hj : axisDirections σ (M i) ⊆ alteredDirections σ (M j)`，由 $u,v\in S_j$ 当组 $i$ 的轴映到 $j$ 的 altered——因为组 $1,*$ 之间 $A_i\cap S_j\ne\varnothing$ 恰是 $(u,v)$ 的安排），总预算 $\le2(s-1)$，omega 矛盾。

#### (c) 情形二：$p$ 有限、$p\in P_i$（唯一组）

- $h_p=|\{\ell\in B:p\in\ell\}|$。过 $p$ 的仿射线 $q+1$ 条：
```latex
\begin{equation}\label{con-finite-budget}
 |F_p|=q+1-h_p, \qquad |C\setminus F_p|\le h_p-1.
\end{equation}
```
（"-1"：$q+1$ 个强制顶点 + 预算 $q$。$h_p=0$ 时 $|F_p|=q+1>q$ 直接矛盾，故设 $h_p\ge1$。）
- **$h_p\le s-1$**（`con-internal-pencil-size`）：过 $p$ 的删除线全部来自组 $i$（他组的删除线若过 $p$，其方向属 $D_j$ 而碰 $P_i$，违反 `con-separation`），且每方向至多一条。
- 强制顶点对该组例外位置的覆盖落在两条轴线上：位置基点 $y\ne p$ 时连线方向 $\in S_i\cup A_i$，$S_i$ 方向的普通顶点不盖例外边 ⇒ 只能沿两条轴线；基点 $=p$ 的位置（若有）同在两轴上。$f$ 保两轴 ⇒ 被覆盖位置（新坐标）含于过 $f(w_p)$ 的水平与竖直线，$w_p=M_i^{-1}(p-b_i)$。
- 剩余位置由附加顶点盖，每个可并入一条子域线。于是 $f(Y)$ 被 $\le2+(h_p-1)\le s$ 条线覆盖且含两条不平行坐标线——直接违反 gadget（含两条非平行线的 $\le s$ 线覆盖不存在）。"These are legitimate covering resources whether or not their ordinary labels belong to $F_p$: their union contains every position covered by $F_p$. Removing any duplicate replacement lines preserves these two distinct lines and can only decrease the count."——即轴线的合法性不依赖轴线本身是否被强制。
- **Lean 对应**：`finite_inside_center_impossible`（在 DeterministicCover.lean 中经 `card_deletedPencil_le_of_mem_placedSubplane` 得 $|B\cap\text{pencil}(p)|\le|k|-1$）。

#### (d) 情形三：$p$ 有限、$p\notin\bigcup P_i$

- **每组的删除线至多一条过 $p$**：若同组两条平行线都过 $p$ 则重合；若不平行，拉回子域后两条子域仿射线方程方向不同，联立得非奇异线性方程组、解在 $\F_s^2$ 内——$p\in P_i$，矛盾。跨组删除线不重合（`con-separation`）。故 $h_p$ 条删除线来自 $h_p$ 个不同组。
- 每组在其贡献线上取 5 个 $Y_i$ 点（`con-deletion-count`），得 $5h_p$ 条互异例外边（`con-intersection` 的互异性）。**它们都不被 $F_p$ 覆盖**：其与 $p$ 的连线恰是本组的贡献删除线，方向对该组 altered。
- **每个附加顶点至多盖 5 条**：特殊顶点只在己组（若己组是贡献组，其特殊标签在该组那条删除线方向上……实际论证：特殊顶点属于一组，至多覆盖该组 5 条选中边——由 gadget 每线 5 点）；过 $p$ 的普通线一条也盖不到（唯一连线即删除线、方向 altered）；不过 $p$ 的普通线 $o_\ell$ 至多每贡献组 1 条（$\ell$ 交贡献线 $\le1$ 点），且每组这样的 $y\in Y_i\cap\ell$（连线方向 $\in S_i$）——第 3 条池性质把组数压到 5。
- 预算 $h_p-1$ 个附加顶点至多盖 $5(h_p-1)<5h_p$，矛盾。
- **Lean 对应**：`not_isCover_of_finite_outside_placedSubplanes`（FiniteOutsideCover.lean），输入 `hthin : OffPencilThin data p`（= `PoolThin` 转移到选中的形式，`offPencilThin_of_groupPoolThin`）。

#### (e) 收尾

三种 $p$ 穷尽一切射影点，故无 $\le q$ 覆盖，$\tau(H)\ge q+1$；又任一边是 $q+1$ 元覆盖，$\tau(H)=q+1$。原文结尾：对每个合格 $s$ 选一个成功 $Y$，令 $n_0(s)\ge3$ 超过全部次数门槛（"Choose one such $Y$ for each eligible $s$, and let $n_0(s)\ge3$ exceed all the resulting degree thresholds"）——注意 $n_0(s)$ 的存在性靠的是"每个固定常数要求只吃掉有限门槛"这一积累，而非显式数值。无穷多秩 $r=q+1$ 随奇数 $n$ 无界而无限。

#### (f) [推测] 失败路线（最终覆盖论证层面）
1. **$z=2$ 情形若两组的轴方向不落入对方 $D$**：轴顶点会作为 $j$ 组的点资源被二次计数，$2s\le2(s-1)$ 的合并不等式少掉一项，矛盾消失。$(u,v)$ 的选取（$u,v\ne0$、$u\ne v$）+ $D_1=D_*=\PP^1(\F_s)$ 恰好封住这条路；这也是为什么 $S_*$ 剔除 $u,v$ 而不是别的两个子域斜率。
2. **内部点情形若 $h_p=s$**：$2+(h_p-1)=s+1>s$，gadget 约束失效。但 $h_p\le s-1$ 由"每方向至多一条 + 每组一个方向族"保证，且 $p\in P_i$ 时**任何**过 $p$ 的删除线必属组 $i$——这条"组内饱和"若被破坏（例如允许两个组的 $P$ 相交），$h_p$ 可达 $2(s-1)$，论证崩溃。
3. **外部点情形的"每顶点至多 5"若退化**：第 3 条池性质是对 $(p,\ell)$ 二元组成立的；若覆盖顶点 $o_\ell$ 的线恰好过 $p$，池性质不适用（它要 $p\notin\ell$）——但过 $p$ 的线已被"唯一连线 = 删除线、方向 altered"单独处理。这个两分法（过 $p$ / 不过 $p$）是论证的隐式分岔，Lean 里在 `not_lineCapable_unique` 与外部覆盖计数中分别体现。

---

## 三、Lean 取证

（本节约占素材 40%。Lean 是权重最高的取证材料：它给出论文证明的完整可机检版本，其模块切分、常数取值与假设排序暴露论文行文中的所有省略。）

### 3.1 形式化登记信息

`E:\math\lean\formalization.yaml` 中本论文对应**两个**条目（第 1470–1476 行），这是第一个值得记录的事实：一篇论文、两个 comparator 挑战。

```yaml
    - comparator_config: ComparatorChallenges/RyserCovering.json
      declaration: OAI.RyserCoveringCounterexample.exists_prime_eventually_counterexampleRank
      file: OAI/Combinatorics/Ryser/Construction/Main.lean

    - comparator_config: ComparatorChallenges/RyserOddExtensions.json
      declaration: OAI.RyserOdd.eventualOddFailures_and_infinite
      file: OAI/Combinatorics/Ryser/OddExtensions.lean
```

comparator 配置文件全文：

```json
{
  "challenge_module": "ComparatorChallenges.RyserCovering",
  "solution_module": "OAI.Combinatorics.Ryser.Construction.Main",
  "theorem_names": [
    "OAI.RyserCoveringCounterexample.exists_prime_eventually_counterexampleRank"
  ],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false
}
```

（RyserOddExtensions.json 同构，theorem_names 换为 `OAI.RyserOdd.eventualOddFailures_and_infinite`。）

**axioms 审计**：permitted axioms 恰为 Lean 的三个标准公理（命题外延性、商的可靠性、经典选择）。对整个 `E:\math\lean\OAI\Combinatorics\Ryser\` 目录 grep `^axiom` 得 **0 条**；grep `sorry|admit` 得 **0 条**。即形式化没有引入任何新公理、没有留洞，`#print axioms` 的输出应当恰落在 permitted 集内。[推测] `Classical.choice` 的实际使用点：`Classical.decEq`（如 `ConfigurationGroup` 的可判定相等）、`Classical.choose`（`exists_line_cover_of_exceptional_cover` 中从 `exceptional_resource_has_line` 的存在性选取子域线）、以及 `propext`/`Quot.sound` 是 Mathlib 基础设施的常伴公理。

**技术栈**：Lean 4（toolchain `leanprover/lean4:v4.34.1`），Mathlib 固定在 `d13f23b723b8a846827a245b89c10fc7d3f11612`（lakefile.lean）。`enable_nanoda: false`——不启用数值/black-box 辅助。

### 3.2 命名的两层规范：Statement 层与 Construction 层

Lean 代码把"论文说了什么"与"怎么造"拆成两个命名空间，这个分层本身就是取证线索：

- **`RyserCoveringCounterexample.Hypergraph.*`**（`Hypergraph/` 目录）：超图的抽象定义层。
  - `Hypergraph V := Finset (Finset V)`——边集是有限集的有限集，**顶点集是一个类型**而非记录域。
  - `IsCover H C : ∀ e ∈ H, ∃ v ∈ C, v ∈ e`；`coverNumber H := sInf (coverCardinalities H)`；`matchingNumber H := (matchings H).sup Finset.card`。
  - `Intersecting H : ∀ e ∈ H, ∀ f ∈ H, e ≠ f → (e ∩ f).Nonempty`——注意**不含**"边非空"条款，非空边单独叫 `NonemptyEdges`。
  - `Uniform r H : ∀ e ∈ H, e.card = r`；`PartiteUniform part H : ∀ e ∈ H, ∀ i, ∃! v, v ∈ e ∧ part v = i`（每边每部**恰一个**顶点，用唯一存在量词）；`RPartiteUniform r H : ∃ part : V → Fin r, PartiteUniform part H`。
  - `CounterexampleRank r`（Infinitude.lean）：
    ```lean
    def CounterexampleRank (r : ℕ) : Prop :=
      ∃ (V : Type) (fin : Fintype V) (dec : DecidableEq V),
        ∃ H : Hypergraph V,
          0 < r ∧ H.Nonempty ∧ RPartiteUniform r H ∧ Intersecting H ∧
            (∃ C : Finset V, IsCover H C) ∧ matchingNumber H = 1 ∧ coverNumber H = r
    ```
    与论文主定理逐条款对照：`RPartiteUniform r` + `Uniform`（后者由前者推出：`RPartiteUniform.uniform`）↔ $(q+1)$-部 $(q+1)$-匀称；`Intersecting` + `matchingNumber = 1` ↔ 相交（匹配数 1 在 Lean 里是**由**非空+相交**推出**的，`matchingNumber_eq_one_of_nonempty_intersecting`）；`coverNumber H = r` ↔ $\tau(H)=q+1$。
  - 关键桥接定理 `coverNumber_eq_rank_of_no_small_cover`：
    ```lean
    theorem coverNumber_eq_rank_of_no_small_cover {r : ℕ} (hr : 0 < r)
        (hU : Uniform r H) (hne : H.Nonempty) (hI : Intersecting H)
        (hsmall : ∀ C : Finset V, C.card ≤ r - 1 → ¬ IsCover H C) :
        coverNumber H = r
    ```
    即"排除小覆盖 + 边是覆盖 ⇒ 覆盖数恰为秩"，把论文 "$\tau\le q+1$ 免费、$\tau>q$ 是全部工作" 的分工形式化。
- **`RyserCoveringCounterexample.Construction.*`**（`Construction/` 等 9 个子目录）：全部几何/概率/组合构造。

### 3.3 模块依赖链（自底向上）

按目录分层（括号内为文件数与 Lean 行数，来自 wc 统计）：

```
Geometry/        (13 文件, ~1750 行)   —— 仿射/射影平面基础
  Basic: Point F := F × F, Direction F := Option F (none=竖直, some m=斜率m),
         AffineLine F := Direction F × F, projection d p, Incidence, lineThrough,
         joinLine, ProjectivePoint F := Point F ⊕ Direction F (inl 有限 / inr 无穷远),
         affinePencil, ProjectiveIncidence
  AffineJoins / ProjectiveJoins: 连线唯一性、过两点的线
  ProjectiveTransform{Basic,XY,XZ,Affine}: 射影坐标归一化（四锚点用）
  Cardinality / Normalization / SliceEnergy / ProjectionMoments / ProjectionPair

Hypergraph/      (5 文件, ~313 行)     —— 抽象层（见 3.2）

Field/           (4 文件, ~261 行)     —— 子域界
  Extension: ExtensionField p n（n 次扩域的构造）, extensionField_card,
             primeEmbedding p n : ZMod p →+* ExtensionField p n
  ExtensionSubfields: extensionField_properSubfield_cube_le（素数次版本）
  OddSubfields: subfield_degree_data_of_odd（奇数次的完整版本，见 3.6）
  SubfieldBound: 一般的 subfield_natCard_cube_le_of_prime_degree

Incidence/       (28 文件, ~4000 行)   —— 定理 2.1 的形式化
  Parameters: savingExponent := 1/10^10, witnessConstant := 1/(9·2^57),
              graphScaleConstant := 9·2^58, graphScale U = graphScaleConstant·U^39,
              expansionScale V = 2^23·V^24, LargeEnough q, incidenceThreshold
  Pruning / PruningCore / PruningHigh / PruningNumerics: 剪枝层
  FourAnchors{,Counting,Geometry,Local,Numerics}: 四锚点层
  Pencils / DegreeSquares / AllLineCap: 铅笔坐标与帽
  WalkExpansion / WalkCounts / WalkQuotients / WalkTrimming / WalkExtraction:
      同时抽取（Gowers 游走）
  ScalarCover / ScalarCoverExpressions / ScalarCoverGeometry / ScalarCollisions
      / ScalarCollisionCount / PopularScalars / PopularOverlap / RatioSet:
      标量覆盖 + 比集子域
  NoApproximateSubfield / NoApproximateSubfieldNumerics: 近似子域排除
  GraphParameters / DenseNeighborhood / FiniteSet{Estimates,s,Covering}
  Uniform: uniform_incidence_bound（总装）
  ExtractedContradiction / CoordinateTransfer{,Set}

LineCover/       (42 文件, ~5500 行)   —— 引理 2.3 的形式化
  Definitions / DeletionDefinitions / SamplingDefinitions: DeletionProcess, Outcome,
      survivors, deleted, GoodLineCover δ ρ, LineTuple, AdmissibleTuple, SparseShapes
  GoodCounts / CountEvents / CountConcentration / CountTailNumerics: 计数层
  GoodTuples / TupleConcentration / TupleGeometry / TailNumerics / SurvivalNumerics:
      tuple 事件层
  HighProbability / HighConcurrency / LowConcurrency / MaxConcurrency / HighDegeneracy
      / LowDegeneracy / HighIncidence / LowOccupancy / HighOccupancy / HighSamples:
      两段采样分析
  PairSampling / PairCounting / DisjointPairs / Overlap / TwoPopulation{Moments,Sampling}
      / InjectionSampling / SurvivorSampling / MeanCounts / HeavyIncidence:
      抽样几何与计数
  Rigidity / RigiditySampling / RigidityNumerics / RigidityParameters: 刚度总装
  FailureNumerics / FiniteFailureNumerics / ProjectiveLift / CleanCover / Process
  Main: uniform_linecover_probability（总装）

Probability/     (9 文件, ~1536 行)    —— 伴生论文附录 A 的三个估计 + 概率基础
  Finite: FiniteLaw（有限样本空间上的显式概率律：weights, prob, expectation, pi）
  Product / ProductMap: 独立乘积律
  Variance / Exponential / Concentration: 二阶矩与指数尾
  Exposure: 暴露界（Lemma A.3）
  RareAnchor

Selection/       (35 文件, ~4300 行)   —— 定理 2.4 的形式化
  Definitions: Data (W, dirs), Conflict, HasCompatibleChoice, Feasible,
               feasibleSet, feasibleMass, Bounded, exposedCount
  Domination 引理另置 Domination/ 目录
  PoolGraph / PoolCounts / PoolLaw: 冲突图
  Chunk / ChunkPartition / ChunkPartitionBounds / ChunkConditioning / ChunkDensity
      / ChunkEnergy / ChunkLoss / ChunkTail / ChunkTailAsymptotics: 分块可行密度
  Certificate{Bounds,Count,Union} / SmallCertificates / LargeCertificates:
      证书计数与排除
  KChoice / SmallSum / SmallRange / UniformDensity / IndependentTail / RegularTail
      / LayerBounds / LayerNormalization / Estimates / Quantitative / Forbidden
      / DensityConstants / FeasibleDensity / NumericLimits / AnalyticalLimits
      / Parameters / UnusedProduct
  Main: compatible_selection_uniform（总装）

Domination/      (10 文件, ~811 行)    —— 引理 sel-domination 的形式化
  Basic (Graph), Seed (DominationTrace 的初始), Extension (DominationTrace.extend),
  TraceDefinitions, Exchange, Counting, Nonempty, Append, Main

Construction/    (64 文件, ~7300 行)   —— gadget、放置、装配、最终覆盖
  GadgetAlgebra: cubeMap, cubicShape, cubicPoint, cubicLinePolynomial,
      cube_bijective (由 Coprime 3 (q-1)), cubicShape_inter_linePoints_card_le ≤ 3,
      cubicShape_ne_linePoints, coprime_three_zmod_card_sub_one
  GadgetDefinitions: GadgetOutcome := NonzeroSlope k → k（每个非零斜率 ↦ 删除截距）,
      omittedLine, retainedPoints (= Y), transformedRetained (= f(Y)), cubicDeletionUnion
  GadgetOriginal{Counts,Expectation,Density}: 原坐标存活（exp(-q/2048) 尾）
  GadgetShapes / GadgetProcess (gadgetTrials, gadgetLaw, cubicDeletionProcess,
      gadgetConfig) / GadgetConcentration: 新坐标形状与删除过程
  GadgetCover / GadgetConsequences: GadgetCoverProperty（加权刚度，见 3.5）
  GadgetGood / GadgetExistence / OddGadgets: GoodGadget 的三条款与存在性
  DirectionSets (alteredDirections = S_i, axisDirections = A_i),
  CosetDirections / CosetIndex / ExtraDirections / GroupPlacement (groupPlacement,
      groupAltered, groupConflict, multiplicity ≤ 2, shared_groupAltered_axes_subset)
  LinearPlacement (placedPoint, placedLine, placedDirection, placedSubplane),
  DirectionPlacement / CoordinateCompatibility / PlacedLines / PlacementIntersection
  Deletion{Lines,Intersection,Parallel,UnionBasic,UnionInside,UnionOutside}
  AmbientDeletion{Shapes,Numerics,Process,Trials,Survivors,PoolLaw,Geometry}
      (ambientDeletionDelta = exp(-4K(s-1)), ambientDeletionConstant)
  PoolThin{Geometry,Probability,Selection,Asymptotic} (ShiftHits, PoolThin ≤ 5)
  GroupSelection / GroupBounds / GroupPlacement / DirectionSets: 选择数据
  Selection (via Selection/) / AmbientPoolExistence (GoodAmbientPool, 总装池)
  Hypergraph (ConfigurationData, Vertex, hypergraph) / LabelAction
  Intersection / SelectedHypergraph / ActualHypergraph
  CoverBudget / CoverCounting / CoverPencil / OrdinaryCover / ExceptionalCover
      / ExceptionalBudget / DeterministicCover
  FiniteInsideCover / FiniteOutsideCover / FiniteOutsideAction / InfiniteCover
      / FiniteSelectionCounting / SmallPrimes
  Main: counterexampleRank_of_goodAmbientPool（超图级总装）
根级:
  Main.lean (import Construction.Main — 单行转发), OddExtensions.lean (总装)
```

### 3.4 最终定理组装：两条 main 定理逐行解读

**条目 A：`exists_prime_eventually_counterexampleRank`（Construction/Main.lean）**

```lean
theorem exists_prime_eventually_counterexampleRank :
    ∃ p : ℕ, p.Prime ∧ 5 < p ∧ p % 3 = 2 ∧
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → n.Prime → 2 < n →
        CounterexampleRank (p ^ n + 1)
```

与论文 thm:main 的量词对照：Lean 的陈述**弱化**了两处——(i) `∃ p` 而非 `∀ 大素数 p`（只造一个素数）；(ii) `n.Prime → 2 < n` 而非 `Odd n`（只对**素**次数）。这是"存在性反例"的最小充分版本：否定 Ryser 只需一个秩。条目 B（见下）把这两处都补成论文的全称形式。

证明骨架（每行一个下游模块）：
1. `exists_prime_goodGadget`：取素数 $p\equiv2\pmod3$、$p>5$，及 `a : GadgetOutcome (ZMod p)` 满足 `GoodGadget a`。注意内部是 `exists_prime_goodGadget_above B` 对 $B=0$ 的应用，它把三个概率事件（linecover 概率 $\ge3/4$、original density $\ge1-1/4$、`200 < 19 p`）用 `prob_mono`+`linarith` 合并出存在性——即论文 gadget 引理的"两个坐标系事件同时以概率→1"的显式版本，且**概率阈值 1/4+1/4 各出现一次**：事件交非空由 $1-(\frac14+\frac14)>0$ 保证。
2. `exists_distinct_nonzero (k := ZMod p)`：提供 $u\ne v\ne0$（组 $*$ 的参数）。
3. `coprime_three_zmod_card_sub_one hpmod`：$\gcd(3,p-1)=1$（$\texttt{p \% 3 = 2}$ 的代数翻译）。
4. `exists_goodAmbientPool_uniform u v huv a ha.1 hs`：输出 `K, Q`，对每个 `Q ≤ |F|` 且 `SmallProperSubfields F` 的域给出 `pool : AmbientPool σ K` 与 `GoodAmbientPool`（三分量）。这里的 `hgap` 条款
   ```lean
   (1 + ambientDeletionDelta s K / 10 * |F| < ambientDeletionDelta s K * |F| / 2)
   ```
   即 $\delta q/2 > 1+\rho q$（$\rho=\delta/10$）——强制引理的数值缝隙，由 $q>\lceil10/\delta\rceil$ 保证。
5. 对每个 `n ≥ N`（素、`2 < n`）：`extensionField_card p n` 给 $|\F_{p^n}|=p^n$；`extensionField_properSubfield_cube_le` 给子域立方界；`hpool` 应用于 `(ExtensionField p n, primeEmbedding p n)` 得 `(hgap, pool, hgood)`。
6. `counterexampleRank_of_goodAmbientPool`（ActualHypergraph.lean，见下）收尾。

**`counterexampleRank_of_goodAmbientPool` 的内部结构**（论文 2.7–2.10 节的总装）：

```lean
theorem counterexampleRank_of_goodAmbientPool
    (σ : k →+* F) (u v : k) (huv : u ≠ v) (hu : u ≠ 0) (hv : v ≠ 0)
    (a : GadgetOutcome k) (ha : GoodGadget a)
    (hcop : Nat.Coprime 3 (|k| - 1))
    (K : ℕ) (pool : AmbientPool σ K)
    (hpool : GoodAmbientPool σ u v huv a ha.1 K pool)
    (hgap : 1 + δ/10 * |F| < δ * |F| / 2) :
    CounterexampleRank (|F| + 1)
```
1. 解包 `hpool = ⟨⟨choiceFin, hchoice⟩, hrigid, hthin⟩`：选择函数、刚度（`GoodLineCover`）、池薄（`PoolThin`）。
2. `selectedShifts_deletionSeparated`：选择的无冲突性翻译成 `DeletionSeparated`（2.7 的 con-separation）。
3. `ambientPool_goodLineCover_selected`：池级刚度转移到选中集，得 `hline`（`∀ ell ∉ B, δ|F|/2 ≤ |X ∩ ℓ|`，即 con-selected-line-bound）与 `hnear`（覆盖 ⇒ 几乎铅笔）。
4. `offPencilThin_of_groupPoolThin`：5 组性质转移为 `OffPencilThin`。
5. `ambientSelectedHypergraph_nonempty / _intersecting / _rPartiteUniform`：三条结构性质。
6. `not_isCover_actual_group_configuration`：排除 $\le q$ 覆盖（2.10 的三情形总装，输入正是 3–5 的全部产物）。
7. `counterexampleRank_of_no_small_cover` 收尾。

值得记录的一个 Lean 独有片段：`hdec : instDecidableEqConfigurationGroup σ = (inferInstance : DecidableEq (ConfigurationGroup σ)) := Subsingleton.elim _ _`——同一命题的两个实例通过 `Subsingleton.elim` 强制相等后 `rw`。这是"可判定相等实例不一致"这种论文里根本不会出现的障碍的直接证据：Lean 顶点类型 `Vertex` 的元素资格依赖实例参数，实例不匹配时成员资格命题字面上不同。**论文完全隐去了这一层**。

**条目 B：`eventualOddFailures_and_infinite`（OddExtensions.lean）**

```lean
theorem eventualOddFailures_and_infinite :
    (∃ primeThreshold : ℕ, ∀ prime : ℕ, primeThreshold ≤ prime →
      prime.Prime → prime % 3 = 2 →
        ∃ degreeThreshold : ℕ, 3 ≤ degreeThreshold ∧
          ∀ degree : ℕ, degreeThreshold ≤ degree → Odd degree →
            Specification.ExplicitFailureAt (prime ^ degree + 1)) ∧
    Set.Infinite {rank : ℕ | Specification.ExplicitFailureAt rank}
```

这是**比论文更强的陈述**的组合：(i) 素数门槛是**一致**的（`∃ P, ∀ p ≥ P`——注意 Lean 里 `exists_threshold_goodGadget` 给出的 `P = Q + N + 2048` 是在选素数之前确定的，文档注释 "The base-prime threshold is uniform; the odd-degree threshold may depend on the base prime. Every sufficiently large odd degree is included."）；(ii) 次数是**任意奇数**而非素数；(iii) 输出 `ExplicitFailureAt r` 是**显式失败**：
```lean
def ExplicitFailureAt (r : ℕ) : Prop :=
  ∃ (V : Type) (fin : Fintype V) (dec : DecidableEq V), …
    ∃ H : Hypergraph V, 0 < r ∧ H.Nonempty ∧ RPartiteUniform r H ∧ Uniform r H ∧
      Intersecting H ∧ (∃ C, IsCover H C) ∧ matchingNumber H = 1 ∧ coverNumber H = r ∧
      (r - 1) * matchingNumber H < coverNumber H
```
最后一条 `(r-1) * matchingNumber H < coverNumber H` 把 Ryser 不等式的**违反**本身写成条款（`explicitFailureAt_of_counterexampleRank` 由 `Nat.sub_lt` 完成）。而 `WholeUnbalancedPaper := EventualOddRanks ∧ InfiniteRanks` 的命名（"unbalanced"——各部大小不必相等，区别于伴生论文的 balanced 版本）与 `RyserOddReference.challenge` 一起，构成形式化对论文标题主张的完整覆盖。

**奇数次的关键强化**（OddSubfields.lean 的文档注释，取证价值极高）：

> Proper subfields in every odd extension degree. The degree divisor and its
> properness are derived from actual finite-field cardinalities, not assumed of
> the splitting field chosen by the construction.

```lean
theorem subfield_degree_data_of_odd (hp : p.Prime) (hn : Odd n)
    (hcard : Fintype.card F = p ^ n) (S : Subfield F) [Fintype S] (hS : S ≠ ⊤) :
    ∃ d : ℕ, 0 < d ∧ d ∣ n ∧ 3 * d ≤ n ∧ Fintype.card S = p ^ d
```
论文对奇数 $n$ 的子域论证（"$a\mid n$、真因子 $\le n/3$"）是一段文字；Lean 里它是从 `FiniteField.card S p` + `Module.card_eq_pow_finrank` + `Nat.pow_right_injective` 逐条抽出的实际基数等式，`three_mul_le_of_dvd_odd` 处理"奇数的真因子至少 3 倍缩进"。`extensionField_properSubfield_cube_le_of_odd` 不再要求 $n$ 素——**Lean 版本覆盖了论文正文（素数次假设都没有，只有奇数次）而条目 A 的旧版本 `extensionField_properSubfield_cube_le` 只对素数次成立**。两套并存的痕迹说明形式化先做了素数次、后按论文的奇数次主张加固（文件时间序无法直接验证，但 API 并存是事实）。

### 3.5 对应差异表（论文 ↔ Lean）

下表把论文的每个组成部分映射到 Lean 声明，并标注差异。

| 论文对象（TeX label / 章节） | Lean 声明（模块.定理） | 差异注记 |
|---|---|---|
| thm:main 主定理 | `RyserCoveringCounterexample.exists_prime_eventually_counterexampleRank`（Construction/Main.lean） | Lean: ∃ 一个素数 + 素数次；论文: ∀ 大素数 + 奇数次。全称版在 OddExtensions 条目 |
| thm:main 的 ∀奇 n + ∀素 s | `RyserOdd.eventualOddRanks` / `eventualOddFailures_and_infinite`（OddExtensions.lean） | Lean 甚至更强：素数门槛一致 |
| "$\tau(H)=q+1$ 且违反不等式" | `RyserOdd.Specification.ExplicitFailureAt`（含 `(r-1)*matchingNumber < coverNumber`） | Lean 显式写出违反条款；论文只是文字 |
| 无穷多反例秩（论文尾句 "infinitely many ranks"） | `infinite_counterexampleRanks_of_eventually_prime_powers` / `RyserOdd.infiniteRanks` | 论文一句话；Lean 有独立证明（`Nat.exists_infinite_primes` 或奇数构造） |
| §incidence thm:incidence | `Incidence.uniform_incidence_bound`（Incidence/Uniform.lean） | Lean 固定 κ=10⁻¹⁰（savingExponent），论文"∃ 绝对 κ"；见 3.6 |
| inc-sumset-estimates (Ruzsa/Plünnecke) | Incidence/ 的 FiniteSet* 系列（`FiniteSetEstimates` 等） | [推测] 具体拆分见 FiniteSets/FiniteSetCovering/FiniteSetEstimates |
| inc-simultaneous-extraction | `WalkExpansion`/`WalkCounts`/`WalkQuotients`/`WalkTrimming`/`WalkExtraction` | Lean 拆成 5 个游走模块，论文一个引理 |
| inc-scalar-coverings | `ScalarCover`（234 行）+ `ScalarCoverExpressions`/`ScalarCoverGeometry` | $C_m=(13\cdot3^m-5)/2$ 的显式递推在 Expressions 中 |
| inc-no-approximate-subfield | `NoApproximateSubfield` + `NoApproximateSubfieldNumerics` + `RatioSet`/`PopularScalars` | 同构 |
| 四锚点 + 四铅笔坐标 | `FourAnchors{,Counting,Geometry,Local,Numerics}`、`Pencils`、`ProjectiveTransform*` | Lean 把坐标归一化（ProjectiveTransformXY/XZ/Affine）单列，论文一句"Choose projective coordinates" |
| 剪枝 + 度方界 + 全线帽 | `Pruning`/`PruningCore`/`PruningHigh`、`DegreeSquares`、`AllLineCap` | 同构 |
| lem:martingale (Freedman) | `Probability/Variance.lean`（264 行）+ `Exponential.lean`（271 行） | Lean 无通用鞅抽象，用逐暴露的显式归纳（`FiniteLaw` 有限样本空间） |
| lem:linecover | `LineCover.Main.uniform_linecover_probability` + `prob_not_goodLineCover_le` | Lean 把结论拆成 `GoodLineCover δ ρ` 谓词 = GoodCounts ∧ (结论 2)；失败概率显式公式 `linecoverFailureBound` |
| linecover 结论 1（每线存活） | `GoodCounts`（`GoodLineCover.1`） | Lean 中结论 1 是 GoodLineCover 的**第一个分量**，结构化而非并列 |
| linecover 结论 2（几乎铅笔） | `GoodLineCover.2 : ∀ L, L.card ≤ q → missed ≤ 2q → ∃ p, (1-ρ)q ≤ \|coverPencil L p\|` | 论文用"包含 $(1-\rho)q$ 条共点线"；Lean 用 `coverPencil L p := L.filter (ProjectiveIncidence p ∘ some)`，同物 |
| tuple 事件 / admissible tuple | `AdmissibleTuple`、`GoodTuples`、`TupleConcentration` | Lean: `FiniteCrossings ∧ card(crossPoints)=t*t ∧ 形状帽 ≤ 2*D*h`——逐字对应 |
| thm:selection | `Selection.Main.compatible_selection_uniform` | Lean 输出 `6 ≤ K`（论文只说正整数）并暴露失败概率结构 |
| sel-domination | `Domination.Main.domination_of_no_transversal`（`DominationCertificate` + `DominationTrace` 0/extend 归纳） | Lean 用 **DominationTrace 的长度参数化归纳**（`htraces (Fintype.card V + 1)`、`length_le_card` 矛盾）实现论文的"有限次延续必停"；`2*(|I|-1)` 逐字 |
| Conflict 定义 | `Selection.Definitions.Conflict`（`projection d ((b+u)-(b'+v)) = 0`） | 论文 `(b+u)-(b'+v) ∈ d`；Lean 用投影=0 表达"差落在方向子空间内"，`conflict_iff_forbidden` 证明两形等价 |
| lem:gadget | `GadgetGood.GoodGadget` = `OriginalLineDensity ∧ (∀ ℓ, s ≤ 8*|transformedRetained ∩ linePoints ℓ|) ∧ GadgetCoverProperty` | 三条款 = gadget 引理的三个结论；存在性 = `exists_prime_goodGadget`/`exists_threshold_goodGadget` |
| gadget 的混合覆盖刚度 | `GadgetCoverProperty Y : ∀ B L, cover → 2*L.card + B.card ≤ 2*s → ∃ d, L = affinePencil (inr d) ∧ B = ∅` | 预算 $a+b/2\le s$ 乘 2 化成整数式 `2*L.card + B.card ≤ 2*s`；"完整平行类"明确为**无穷远中心**（`Sum.inr d`）——论文从有限中心 $s+1>s$ 排除，Lean 里结论直接写成 inr |
| gadget "每非删线 ≥5 点" | `OriginalLineDensity`（`5 ≤ card(filter …)`） | 5 硬编码 |
| gadget "每线 ≥ s/8 点" | `GoodGadget` 第 2 分项 `s ≤ 8*(…)` | 以 $8\times$ 形式避免分数 |
| 删除计数 (con-deletion-count) | `deletedLines_direction_eq_image`（DeletionLines.lean） | Lean 直接给出方向切片与 `univ.erase (a t)` 的像相等——比论文文字更精确 |
| con-pool-properties (1)(2) | `ambientDeletionProcess` 验证 `DeletionProcess` 假设 + `uniform_linecover_probability` 应用 | 池律通过 `poolThinLaw_map_ambientPoolConfig` 把池律变成删除过程的像律 |
| con-pool-properties (3)（≤5 组） | `PoolThin` + `prob_not_poolThin_le`（PoolThinProbability.lean） | 6 组联合界、失败概率 $\|F\|^3(\|F\|+1)\|G\|^6(Kws/\|F\|^2)^6$ 显式 |
| 存活率 $\delta=\exp(-4K(s-1))$ | `ambientDeletionDelta s K := exp(-4*K*(s-1))` | 逐字；`ambientDeletionDelta_le_pow` 对应 $\log(1-t)\ge-2t$ 那步 |
| 选择转移 (con-separation) | `DeletionSeparated` + `selectedShifts_deletionSeparated` | Lean 名字点明"删除分离"视角 |
| con-intersection 相交 | `hypergraph_intersecting_of_geometric_data` + 四款引理 | 六款在 Lean 压成两条款输入（havoid, hseparate）+ 同组款内嵌 |
| con-intersection 互异 | `ordinaryEdge_injective`, `exceptionalEdge_injective`, `ordinaryEdge_ne_exceptionalEdge`, `exceptionalEdge_ne_of_group_ne` | 论文并成一段；Lean 四个独立定理 |
| con-label-action | `LineCapable`/`lineResources`/`pointResources` + `lineCapable_has_line`/`not_lineCapable_has_point` | Lean 二分法（线资源/点资源）替代论文三分条款；第 2、3 条合并 |
| con-forced-pencil | `forcedPencilVertices_subset_of_near_pencil`（输入 hgap, hline, hnear） | Lean 的 `forcedPencilVertices data B p` 定义为 $B$ 的 pencil 成员的普通顶点 |
| 无穷远 z=1 / z=2 | `single_infinite_center_impossible` / `double_infinite_center_impossible` | Lean 把"z=2 只可能是组 1,*"编码为 `shared_groupAltered` 的析取 `(i=none ∧ j=some 1) ∨ (i=some 1 ∧ j=none)` |
| 双组加权合并 $2s\le2(s-1)$ | `two_group_resource_budget_impossible`（GroupBounds.lean） | 纯组合引理，与几何脱耦 |
| 内部点情形 | `finite_inside_center_impossible` + `card_deletedPencil_le_of_mem_placedSubplane` | 同构 |
| 外部点情形（5h_p vs 5(h_p-1)） | `not_isCover_of_finite_outside_placedSubplanes`（FiniteOutsideCover.lean，145 行） | 输入 `OffPencilThin data p` |
| 三情形调度 | `not_isCover_actual_group_configuration`（DeterministicCover.lean） | `cases p with | inr d => … | inl p => …` 精确对应"无穷远/有限"，有限再 `by_cases ∃ i, p ∈ placedSubplane` |
| cor:tree-cover 树覆盖推论 | **（无对应）** | Lean 未形式化；见 3.7 |

### 3.6 只在 Lean 里暴露的细节（论文一句话、Lean 一个模块）

以下细节在论文中要么一笔带过、要么完全不出现，但在 Lean 里是**必须展开**的实质工作。这是形式化作为取证材料的核心价值。

1. **$\kappa$ 被固定为 $10^{-10}$**。论文写"there exist absolute constants $\kappa\in(0,1/10)$"，Lean 里
   ```lean
   def savingExponent : ℝ := 1 / 10000000000
   ```
   且 `LargeEnough q` 的条款中出现了指数 $127942$（= $2+39\cdot2+936\cdot127942/…$ 的复合：`32 * V^2 * K^127942 < 3*sqrt q`）、`527`、`42`、`7` 等巨型指数。也就是说论文的"$o(1)$ 吸收一切固定幂"在 Lean 里被兑换成**显式指数核算**：`scaled_power_identity` 把 $A U^a (9\cdot2^{58}U^{39})^b(2^{23}(9\cdot2^{58}U^{39})^{24})^c$ 化成 $U^{a+39b+936c}$，要求 $\kappa(a+39b+936c)<1/2$。$936=39\times24$ 是抽取-标量-子域三层复合的指数代价。论文里这些全是 $q^{o(1)}$ 一笔带过。
2. **witnessConstant $=1/(9\cdot2^{57})$ 与 graphScaleConstant $=9\cdot2^{58}=2/c_0$**：论文正文 $c_0=1/(9\cdot2^{57})$ 出现过，但 $V=\frac{2}{c_0}U^{39}$ 的常数在 Lean 里一路带符号传播（`graphScaleConstant_eq : graphScaleConstant = 2 / witnessConstant`）。
3. **概率的显式有限模型**。Lean 没有测度论式的独立试验：`FiniteLaw Ω` 是权重函数，`FiniteLaw.pi μ` 是乘积律，一切"with high probability"都是**对固定 $|F|$ 的有限样本空间的显式概率不等式**，阈值 $Q$ 由 `Filter.eventually` 在 $\mathbb R$ 上提出后取整（`exists_threshold_largeEnough`、`incidenceThreshold := Classical.choose …`）。论文的渐近序列论证（"along this sequence"）在 Lean 里变成"对每个满足 $Q\le|F|$ 的域逐一成立"——**量词次序的强制规范化**。
4. **三个 1/4 的会计**。gadget 存在性与池存在性都用"三个事件各以概率 $\ge3/4$ ⇒ 交非空"（`prob_mono`+`prob_union_le`+`linarith`）。论文只说"with probability tending to one... simultaneously"；Lean 里每一处联合的预算分配（1/4 + 1/4 + 1/4 + 剩余）是显式的。特别是 `exists_goodAmbientPool_uniform` 的阈值 $Q = QS+QL+QT+2(s-1)^2+QF$ 把选择、linecover、池薄三个独立阈值与 gadget 专用门槛 $2(s-1)^2$、强制缝隙 $QF=\lceil10/\delta\rceil+1$ **加总**——论文只有一句"the result is asymptotic"。
5. **$2048$ 这个常数**：原坐标存活尾 $\exp(-q/2048)$（`prob_originalLineCount_lt_five`），来自 $128(s-2)$ 型分母的保守化 + $e^{q/2048}\ge2$ 的两步链（`Real.add_one_le_exp`）。论文写 $\exp(-\Omega(s))$；Lean 必须选定 2048。且门槛 `2048 ≤ p` 在 `exists_prime_goodGadget_above` 里通过把素数搜到 $B+Q+N+2048$ 以上来满足——**概率阈值与代数门槛在素数搜索中合并**。
6. **`coprime_three_zmod_card_sub_one`**：$\gcd(3,|k|-1)=1$ 的证明走 `Nat.prime_three.coprime_iff_not_dvd` + $\omega$，因为 `Nat.Coprime 3 (Fintype.card (ZMod p) - 1)` 在 $\omega$ 眼里是 `p % 3 = 2` 的语义重排。论文认为这是显然的。
7. **`cube_bijective` 的单位群论证**：立方映射双射性从 `Nat.Coprime.pow_left_bijective`（$\F^*$ 的单位群上 $u\mapsto u^3$ 双射）+ 0 的特例 + 有限性合成。论文一句"cubing permutes $\F_s^*$ and fixes zero"。
8. **三次曲线与线至多 3 交**：`cubicLinePolynomial d z l` 显式写出竖线情形 $X^3-b$ 与斜线情形 $dz - mX^3 - b$ 的多项式，`cubicShape_ne_linePoints` 用系数比较（`coeff 3` / `coeff 1`）证多项式非零，`Polynomial.card_le_degree_of_subset_roots` 给根数 ≤ natDegree ≤ 3。论文的"a nonzero polynomial equation of degree three"在 Lean 是整整一个模块（GadgetAlgebra 后半）。
9. **`DeletionSeparated` 与"零方向"**：论文 `con-separation` 说"公共点会给零差，零差属每个冲突方向"；Lean 里 `Conflict` 用 `projection d p = 0`，零向量自动满足一切方向，这个泛性不需要特判——但**两两不交**（$P_i$ pairwise disjoint）在 Lean 里是从 `DeletionSeparated` 单独导出的推论，而非假设。
10. **`LineCapable` 的 `Sum.inr tag => tag.1 = i` 条款**：特殊顶点"只服务己组"编码为类型级相等检验；`lineResources_disjoint_other_of_axis_subset` 需要的 `axes i ⊆ altered j` 假设——对应论文的 $A_1\subseteq D_*$——在应用处由 `shared_groupAltered_axes_subset` 提供，而后者依赖 $u,v$ 的具体值（组 $*$ 的轴像恰为 $u,v\in S_1$）。论文用一句括号 "the two groups involved are always $1$ and $*$" 带过，Lean 里这是 `GroupPlacement.lean` 60 行的枚举证明。
11. **`DominationTrace` 的显式归纳**：论文的 domination 引理用"过程必停"的文字论证；Lean 定义
    ```lean
    -- Domination/TraceDefinitions + Seed + Extension
    ```
    一个 `DominationTrace G pool J root k` 记录 $k$ 步延伸，`extend` 给出延伸构造，最后 `htraces (Fintype.card V + 1)` 与 `t.length_le_card` 矛盾——**把"必停"变成自然数归纳上的长度矛盾**。`Exchange`（交换论证保持旧等式）对应论文的"replace $y$ by $x_{j+1}$"段。
12. **`survivors_update_sdiff_subset` 型引理**（LineCover/Deletion.lean）：单试验更换对幸存集的扰动**双向**包含于该试验的贡献集，由此 `retainedCount_update_abs_le`。论文说"Changing one trial changes the count by at most …"；Lean 把"改变"分解为两个单侧包含，因为有限集差的基数上界需要两个方向的包含。
13. **期望的逐点展开**：`expectation_card_inter μ S test = ∑ x ∈ test, μ.prob (fun ω => x ∈ S ω)`——"幸存点数的期望 = 各点存活概率之和"在 Lean 是交换求和 + 指示函数展开的完整计算；`prob_mem_survivors` 把存活概率写成乘积 $\prod_i(1-\mu_i.\text{prob}(\cdot))$（`FiniteLaw.prob_pi` + `prob_compl`）。这两条是论文假设 1、2 验证的全部机械基础。
14. **`linecoverFailureBound` 的显式公式**（LineCover/Main.lean）：
    ```lean
    def linecoverFailureBound (D δ A q : ℝ) : ℝ :=
      2 * (1 + q * (q + 1)) * exp (-q ^ (2*(κ/10)) / (16 * D^5)) +
      2 * (q * (q + 1)) ^ (2 * logarithmicSampleSize A q) *
          exp (-tupleTailConstant D (10*(D+1)) δ * (logarithmicSampleSize A q)^2)
    ```
    论文的两个尾界（计数尾、tuple 尾）被加总成一个显式函数并证明趋于 0（`tendsto_linecoverFailureBound`，条件 $A > 5/c_0$、$c_0=\text{tupleTailConstant}$）。论文的 $O_D(\cdot)$ 记号全部落地。
15. **$h=10(D+1)$ 与 $t=\lceil A\log q\rceil$ 的显式化**：`let h := 10 * (D + 1)`、`logarithmicSampleSize A q`。论文的"$h=10(D+1)$"的 10 是使形状和指数严格负的最小裕量选择，Lean 里直接常量化。
16. **`Vertex` 类型的可判定相等实例问题**（见 3.4 末尾的 `hdec` 片段）——论文无对应物。
17. **`GroupBounds.two_group_resource_budget_impossible`** 是**纯算术组合引理**：给定两个不相交资源分解与跨组不相交性，$2s\le(2|L_1|+|B_1|)/1+(2|L_2|+|B_2|)/1\le 2|A|$ 型合并。论文里它被写进"Summing \eqref{con-two-group-lower}, we obtain…"一行；Lean 里它是带 11 个假设参数的独立定理（`lineResources_subset`, `pointResources_subset`, 两个 `disjoint`, 两个 `disjoint_other_of_axis_subset`, 两个 weight 下界, 预算上界）。
18. **`SmallPrimes.lean`**（61 行）：论文两行证明"$\equiv2\pmod3$ 的素数无限"（$3P-1$ 论证）；Lean 里模块化（供 `exists_prime_gt_mod_three_eq_two` 配合使用）。

### 3.7 形式化缺口与替换（Lean 缺失或改写的部分）

1. **树覆盖推论 cor:tree-cover 未形式化**。全 Ryser 目录无图染色/树覆盖内容（grep 无命中）。反例的完整论文主张 = 主定理 + 推论；Lean 覆盖主定理（两个变体），推论留白。[推测] 原因：推论的图论侧（染色构造、连通分量参数计数）需要另一套基础设施，与超图构造正交。
2. **"每部恰 $q+1$ 个顶点、无孤立点"不在本文范围**：论文明确把 balanced 版本让给伴生论文；Lean 的 `CounterexampleRank` 也确实不要求部的大小——`PartiteUniform` 允许 $V_d$ 里有任意多个顶点（普通 $q$ 条线 + 每组最多 $s$ 条特殊线）。Lean 的命名 `WholeUnbalancedPaper` 直白承认这一点。
3. **顶点集的实现**：论文的顶点是"形式标签，标注跨部、跨类型、跨组互异"；Lean 用 `AffineLine F ⊕ (Σ i, {d // d ∈ altered i} × k)` 把互异性**做进类型**（和类型的左右分支不交、Sigma 的组索引打戳）。差异的后果：`vertexPart` 是全函数，`RPartiteUniform` 的证明（`selector_edge_partite`）是 6 行泛型论证——论文说"place an ordinary vertex… All vertices are formal labels"的地方在 Lean 是数据结构设计。
4. **`Uniform (|F|+1)` 的推导**：`hypergraph_uniform` 经 `Fintype.card_option`（`PartiteUniform` 部索引取 `Direction F = Option F`，$|{\rm Option}\ F|+1$ 换算）——论文的 $q+1$ 在 Lean 是 `Direction F` 的基数 +1，两处 `simpa only [Fintype.card_option]`。纯技术，但说明"方向集 = Option F"的编码贯穿始终。
5. **删除形状族的选择**：论文 gadget 应用说 shapes 是 $F_{d,z}$ 曲线族（$s(s-1)$ 个），环境应用说"shape family 取全部 $q(q+1)$ 条仿射线"。Lean 里两处都用**线的全集**作为形状族（`ambientShapes = image linePoints univ`、gadget 处 cubicShape 族），`SparseShapes D` 的验证在 gadget 处由 `cubicShape_inter_linePoints_card_le`（≤3）、环境处由"两线至多一点"给出。
6. **`GoodLineCover` 把结论 1 编码进谓词**：论文的两个结论并列；Lean 的 `GoodLineCover δ ρ ω = GoodCounts ∧ (∀ L …)`，结论 1（每线存活 $\ge\delta q/2$）成为 `GoodCounts` 的一部分。因此 "conclusion 1 for every line" 在池级转移时随 `hrigid` 一起搬运，论文的"Both statements hold"是两行，Lean 是一个连体谓词。

### 3.8 形式化与论文的对应总结句

- Lean 的条目 A 是论文主定理的**∃-变体**（一个素数 + 素数次），条目 B 是**∀-全称版**（一致素数门槛 + 一切奇数次 + 显式违反条款），两者都零公理、零 sorry。
- 所有论文的"with high probability"被规范化为"显式有限概率律 + 数值阈值 $Q$"；所有 $O(\cdot)$、$o(1)$ 被规范化为显式常数（$\kappa=10^{-10}$、$c_0=2^{-57}/9$、$h=10(D+1)$、$\delta=\exp(-4K(s-1))$、$\rho=\delta/10$、$\rho_0=1/100$、$2048$、$127942$、$527$ 等）。
- 论文的每个结构引理在 Lean 中都能找到同名机制，但**分块更细**（Incidence 28 文件 vs 论文 1 节；Selection+Domination 45 文件 vs 论文 1 节）——细分的轴线恰好沿着"论文一句话、展开要一页"的缝：坐标归一化、实例管理、期望逐点化、指数核算、枚举证明。
- Lean 缺口仅树覆盖推论一处（见 3.7.1）。

---

## 四、常数与参数表

按"引入顺序"排列（即 2.0 节的 $s,Y\to K\to D,\delta,\rho\to q$ 顺序），每行给出：符号、值/约束、首次出现的论文位置、机械性角色、Lean 落点（如有）。

### 4.1 域与构造层

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $s$ | 素数，$s\equiv2\pmod3$，$s\ge s_0$，$s>5$（实际门槛 $\max(B+Q+N+2048,\cdot)$） | thm:main, lem:gadget | 使 $\gcd(3,s-1)=1$；$f$ 双射 | `ZMod p`, `5 < p`, `p % 3 = 2` |
| $n$ | 奇数，$n\ge n_0(s)\ge3$ | thm:main | 子域指数 $\le n/3$ | `Odd n`, `3 ≤ N` |
| $q$ | $s^n$ | thm:main | 环境域大小、秩 $r=q+1$ | `p ^ n` |
| $u,v$ | $\F_s^*$ 中 $u\ne v$、$u,v\ne0$ | placement §Fields | $M_*$ 的轴像；双组封口 | `exists_distinct_nonzero` |
| $\Lambda$ | $\F_q^*/\F_s^*$ 代表元集，$1\in\Lambda$ | placement | 陪集组 | `CosetIndex` |
| $\mathcal I,N_q$ | $\Lambda\sqcup\{*\}$，$N_q=(q-1)/(s-1)+1$ | placement | 组数 $O_s(q)$ | `ConfigurationGroup σ = Option (CosetIndex σ)`，`N_q = |G|` |
| $|S_i|,|A_i|$ | $s-1$；2 | placement | 每组改动方向数、轴数 | `groupAltered_card`, `groupAxes_card` |
| $S_1\cap S_*$ | $\F_s^*\setminus\{u,v\}$ | (con-double-directions) | 唯一的方向重复处 | `shared_groupAltered` 析取 |

### 4.2 gadget 层（小域）

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $f$ | $f(x,y)=(x^3,y)$ | lem:gadget | 非线性坐标、保两轴 | `cubeMap` |
| $Y$ | $\F_s^2\setminus\bigcup_{d\in\F_s^*}\ell_d$ | lem:gadget | gadget 点集 | `retainedPoints a` |
| $5$ | 每条非删除线的 $Y$ 点数下界 | lem:gadget | 外部情形的"每线 5 例外边" | `OriginalLineDensity` 的 `5 ≤` |
| $s/8$ | 每条线的 $f(Y)$ 点数下界 | lem:gadget | 内部/无穷远情形的强制 | `8 * card ≥ s` |
| $a+b/2\le s$ | 加权预算 | (con-weighted-budget) | gadget 刚度的门槛 | `2*L.card + B.card ≤ 2*s` |
| $D=3$ | gadget 处 linecover 的形状常数 | lem:gadget | 三次曲线交线数 | `uniform_linecover_probability 3 …` |
| $\delta=1/4$ | gadget 处存活下界 | lem:gadget | $s/8$ 的因子 | `(1/4 : ℝ)` |
| $\rho_0=1/100$ | gadget 处 pencil 缺口 | lem:gadget | $1+3\rho_0s<s/8$ | `(1/100 : ℝ)` |
| $1/8$ | 新坐标形状数 $\times$ 交点界 | lem:gadget 证明 | $\mu/2\ge5$ | `exp(-q/2048)` 链 |
| $2048$ | 原坐标尾指数分母 | Lean 独有 | $\exp(-q/2048)$ | `GadgetOriginalDensity` |

### 4.3 incidence 层（绝对常数）

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $\kappa$ | $\in(0,1/10)$，**绝对**；Lean 取 $10^{-10}$ | thm:incidence | incidence 节省指数 | `savingExponent := 1/10000000000` |
| $Q$ | 绝对门槛 | thm:incidence | | `incidenceThreshold` |
| $c_0$ | $1/(9\cdot2^{57})$ | (inc-common-witnesses) | 四锚点见证常数 | `witnessConstant` |
| $H$ | $16U^3q^{1/2}$ | (inc-degree-cutoffs) | 度上界 / 全线帽 | Pruning |
| $d$ | $q^{1/2}/(8U^2)$ | (inc-degree-cutoffs) | 度下界 | Pruning |
| $n,V$ | $q^{1/2}$；$\frac{2}{c_0}U^{39}$ | (inc-graph-parameters) | 抽取参数 | `graphScale U = 9·2^58·U^39` |
| $C_m$ | $(13\cdot3^m-5)/2$ | (inc-scalar-exponents) | 标量覆盖指数 | ScalarCoverExpressions |
| $2^{20}V^{22}$ | 抽取扩张界 | (inc-extracted-expansion) | | Walk* |
| $K=2^{23}V^{24}$ | 近似子域排陣参数 | incidence 证明末 | $K=q^{o(1)}$ | `expansionScale` |
| $127942,527,42,7$ | `LargeEnough` 指数 | Lean 独有 | 显式 $o(1)$ 核算 | `Incidence.Parameters.LargeEnough` |

### 4.4 linecover 层

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $D$ | 任意正整数（形状/试验常数） | lem:linecover | 万能常数 | `DeletionProcess F D δ` |
| $\delta$ | $>0$ 存活下界 | lem:linecover | | `δ` |
| $\rho$ | $\in(0,1)$ pencil 缺口 | lem:linecover | | `ρ` |
| $2q$ | 结论 2 的未覆盖余量 | lem:linecover | 平衡 $E_L$ 界 | `missed ≤ 2q` |
| $h$ | $10(D+1)$ | 证明 | 贪心步数、指数预算 | `let h := 10*(D+1)` |
| $H_0$ | $2Dh$ | 证明 | 形状-交点帽 | |
| $C_0$ | $DH_0$ | 证明 | 单试验 $P_0$ 贡献界 | |
| $t$ | $\lceil A\log q\rceil$，$A>5/c_0'$ | 证明 | 样本长度 | `logarithmicSampleSize A q` |
| $c_0'$ | $\min\{\delta^2/(16D^2C_0^2),\delta/(16C_0)\}$ | (lc-tuple-tail) | tuple 尾常数 | `tupleTailConstant D (10*(D+1)) δ` |
| $T$ | $q^{1/2-\kappa/3}$ | 低并发 | 轻/重点分界 | |
| $R$ 阈值 | $q^{1/2+\kappa/4}$ | 两情形分界 | | |
| $\epsilon$ | $\kappa/10$ | 证明 | 计数误差指数 | `savingExponent / 10` |

### 4.5 selection 层

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $K$ | $K(D)$，$K\ge6$ | thm:selection | 池大小 | `compatible_selection_uniform` 给 `6 ≤ K` |
| $C$ | $2D^3$ | (sel-constants) | 每对禁忌方程数 | `equationBound`-类 |
| $c_1$ | $1/(4C)$ | (sel-constants) | 大小范围分界 | `selectionCutoff` |
| $\alpha$ | $1/(2C)$ | (sel-constants) | 块大小 | `densityChunkCount` 相关 |
| $J_0$ | $\lceil4D/\alpha+1\rceil$ | (sel-chunk-count) | 块数上界 | |
| $\gamma$ | 使 $2(\alpha+2C)\gamma\le2^{-J_0-1}$ | (sel-gamma-choice) | | `densityRate` |
| $\delta_1$ | $2^{-J_0-1}$ | (sel-gamma-choice) | 可行密度下界，**不依赖 $K$** | |
| $A_K$ | $(eD/c_1)C_*K^2$ | (sel-large-count) | 证书计数系数 | `selectionLargeCoefficient` |
| 选择条件 | $2CeDC_*K^2 2^{-(K-3)}\le1/2$ 且 $A_Ke^{2-K\delta_1}<1/2$ | (sel-small-K)(sel-large-K) | $K$ 的两条约束 | `exists_selection_pool_size` |

### 4.6 环境放置层

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $m=(s-1)^2$ | 每候选删除线数 | con-deletion-count | | `deletedLines` 方向切片 |
| $\delta$ | $\exp(-4K(s-1))$ | con-pool-properties | 环境存活率 | `ambientDeletionDelta s K` |
| $\rho$ | $\delta/10$ | con-pool-properties | | `δ/10` |
| $\frac{2K(s-1)}q$ | 精确线概率和 | (con-exact-line-probability) | linecover 假设 3 | |
| $5$ | 组数帽（第 3 条） | con-pool-properties (3) | 外部情形 | `PoolThin … ≤ 5` |
| $QF$ | $\lceil10/\delta\rceil+1$ | Lean 独有（组装） | 强制缝隙 $q>10/\delta$ | `QF := ⌈10/δ⌉₊ + 1` |

### 4.7 最终覆盖层

| 符号 | 值/约束 | 出处 | 角色 | Lean |
|---|---|---|---|---|
| $hgap$ | $1+\rho q<\delta q/2$ | con-forced-pencil | 强制顶点数缝隙 | `hgap` 显式假设 |
| $z\in\{1,2\}$ | $|I_d|$ | 无穷远情形 | | `groupAltered_multiplicity_le_two` |
| $2s\le2(s-1)$ | 双组矛盾 | (con-two-group-lower) 合并 | | `two_group_resource_budget_impossible` |
| $h_p\le s-1$ | 内部点删除线帽 | (con-internal-pencil-size) | | `card_deletedPencil_le_of_mem_placedSubplane` |
| $2+(h_p-1)\le s$ | 内部点预算 | 证明 | gadget 触发 | |
| $5h_p$ vs $5(h_p-1)$ | 外部点收支 | 证明 | | `not_isCover_of_finite_outside_placedSubplanes` |

---

## 五、开放问题与可信度审查

### 5.1 论文自身陈述的边界

1. **无数值阈值**："The result is asymptotic; the proof does not give a numerical threshold."（引言）$s_0$、$n_0(s)$ 都是非构造性的存在量词；Lean 同样只给存在性（`Q = QS+QL+QT+…` 是**符号**门槛，其数值不有效可算——`incidenceThreshold` 甚至用 `Classical.choose` 定义）。
2. **适用范围窄**：秩 $r=s^n+1$ 需要 $s\equiv2\pmod3$ 的大素数、$n$ 大奇数。$r-1=q$ 是素数幂但 $r$ 本身远超既有正面结果的适用范围（$r\ge10$ 时的交情形此前无结果）。
3. **各部大小不均**：每部 $V_d$ 的顶点数 = $1$（普通线 $q$ 条中该方向每条一个）+ $\sum_{i:d\in S_i}s$ 个特殊顶点，不同部不同——这正是 Lean 命名 `WholeUnbalancedPaper` 的含义。balanced（每部恰 $q+1$、无孤立点）被让给伴生论文。
4. **Lovász 型匹配下降问题不受影响**：论文引言明确区分——"They exclude a prescribed matching-reduction procedure, whereas Theorem~\ref{thm:main} violates the covering inequality itself."

### 5.2 证明层面的开放问题（论文隐含、未明说）

[推测] 以下从证明结构读出，论文未逐一列出：

1. **把素数门槛变一致是 Lean 先行**：论文的 $s_0$ 与 Lean 条目 B 的一致门槛 $P$（`exists_threshold_goodGadget` 的 $P=Q+N+2048$）在能力上等价——论文其实**可以**直接写一致门槛（gadget 引理本来就是"每个大合格素数都有好 gadget"），Lean 版本甚至更干净。这提示论文行文选择了更弱的表述但证明是逐素的。
2. **阈值对 $s$ 的依赖是否可以消除**（即 $n_0$ 取绝对常数）：证明中依赖 $s$ 的只有 $K$（选择池大小）与派生的 $\delta$、门槛——$K$ 依赖 $s^2$ 量级的 $D$，故 $n_0(s)$ 本质上要吃 $\delta^{-1}=e^{4K(s-1)}$。[推测] 想要绝对 $n_0$ 需要 $K$ 不随 $s$ 指数增长，而 selection 定理的 $K$ 对 $D$ 的依赖（$2CeDC_*K^22^{-(K-3)}\le1/2$）只给出 $K=O(\log D)$，从而 $\delta^{-1}=e^{4K(s-1)}=D^{O(s)}$——门槛随 $s$ 多项式偏大但确实依赖 $s$。
3. **偶数次能否做**：$n$ 偶时存在阶 $s^{n/2}$ 的真子域，$q^{1/3}$ 界失效，incidence 定理不可用。[推测] 需要一个对"含中等子域的域"成立的 incidence 替代或对子域的显式处理——论文与 Lean 都未触及。
4. **$s\equiv1\pmod3$ 能否做**：立方映射不再是置换，$f$ 失去双射性。需要别的置换多项式保持两条平行类且次数小。[推测] $x^k$ 型要求 $\gcd(k,s-1)=1$；非单项式置换（如 Rédei 函数）会有更高的"交线次数"$D$，linecover 的指数预算是否吃得下未知。
5. **中间秩**：交情形 $r\ge10$ 在本文之外的具体秩（$r-1$ 不是 $s^n$ 型）没有给出任何信息。
6. **树覆盖推论的平衡版本**：推论的染色在"多部相交时任选一色"，构造的染色是否可以有界度、颜色类是否可以平衡——未讨论。

### 5.3 可信度审查清单

**论文侧**：
- 每个定量步骤的中间量都在正文显式写出（罕见地完整：连 $c_0=1/(9\cdot2^{57})$、$2^{20}V^{22}$、$19/4$ 这类指数都给出），无明显跳步。
- 概率论证的"选择顺序"被反复显式声明（linecover 结尾、selection 结尾、placement 结尾三处），且相互一致。
- 已知的两个外部依赖（伴生论文附录 A 的三个引理；BKT/Petridis/Gowers/Haxell 的文献方法）都被明确引用而非重造。
- 潜在弱点（对照 Lean 后消失/仍存）：
  - linecover 结论 2 的"coverPencil 计数在覆盖被清洗后仍成立"（删去恰好作为删除形状的线）——Lean 的 `cleanLines` 机制显式处理，一致。
  - selection 大范围的"$\delta_1$ 不依赖 $K$"是全文最微妙的常数解耦——Lean 把它做成 `densityRate D` 类独立常数，成立。
  - 双组情形的"每个附加顶点合计贡献 ≤1"依赖轴方向不外溢——Lean 用 `lineResources_disjoint_other_of_axis_subset` + `shared_groupAltered_axes_subset` 显式封口，成立。

**Lean 侧**：
- 零新公理（grep 全目录 `^axiom` 为 0）、零 sorry；permitted axioms 只有 propext / Quot.sound / Classical.choice 三项标准配置。
- 两条 main 定理（∃-变体与 ∀-全称版）都组装完成；∀-版还给出显式违反条款 `(r-1) * matchingNumber H < coverNumber H`。
- 覆盖率：论文 4 个技术节全部有对应 Lean 模块（见 3.5 表，28+42+35+10+64 个文件的粒度）；唯一缺口是树覆盖推论（cor:tree-cover）。
- Lean 陈述与论文陈述的差异全部朝"更规范"方向：量词次序固定、常数具体化、概率变有限律、$O(\cdot)$ 变显式指数。未发现 Lean 陈述弱于论文且论文依赖该强度的地方——反而 Lean 的条目 B（一致素数门槛 + 任意奇数次）**强于**论文主定理的文字表述。
- [推测] 残余风险：Mathlib 引脚 `d13f23b…` 与 toolchain v4.34.1 的可复现性取决于该 commit 的可用性；`incidenceThreshold` 等用 `Classical.choose` 定义的常数意味着即便编译通过，门槛数值也不可读出。

### 5.4 对"反推思维链"笔记的可用钩子

供后续撰写第一人称反推笔记时使用的"从结论倒推"锚点：

1. 从 $\tau(H)=q+1$ 倒推：交性 ⇒ 上界免费 ⇒ 全部重量在"排除 $\le q$ 覆盖"⇒ 排除需要一个**刚性结构**迫使任何小覆盖退化 ⇒ 退化目标选"几乎铅笔"⇒ 证明"几乎铅笔"需要 incidence 节省 ⇒ incidence 需要子域小 ⇒ 奇次数入场。
2. 从"例外边必须与普通边相交"倒推：删除线必须由例外边的**普通坐标**定义；从"例外边彼此相交"倒推：标签必须由 **$f$ 坐标**定义；两个坐标系靠 $f$ 保持两轴缝合。
3. 从"三情形穷尽"倒推：预算会计的三种失败模式（少 1、差 2s、差 5）各自反推出 gadget 的三个结论（$\le s$ 线刚度、加权刚度、每线 5 点）——gadget 引理的形状是**由**下游三情形的需求**倒装**出来的。
4. 从"选择与估计解耦"倒推：独立池 + 事后选择 + 包含转移，是"随机性服务估计、组合性服务相交"的标准解耦模式。
5. 从 Lean 的模块名倒推论文的隐藏步骤：`OffPencilThin`、`DeletionSeparated`、`LineCapable`、`DominationTrace`、`LargeEnough` 这五个名字各自对应论文里一句话的完整展开。

---

## 附：素材来源文件清单

| 文件 | 用途 |
|---|---|
| `E:\math\preprints\A-Counterexample-to-Rysers-Covering-Conjecture-September-23-2026\build\paper.tex` | 引言、主定理、策略、推论 |
| `…\build\incidence.tex` | 定理 2.1 及其四个引理 |
| `…\build\linecover.tex` | 鞅引理、linecover 引理 |
| `…\build\selection.tex` | domination 引理、selection 定理 |
| `…\build\construction.tex` | gadget 引理、放置、超图、最终覆盖 |
| `…\README.md` | 引用信息 |
| `E:\math\lean\formalization.yaml` L52–54, L1470–1476 | 两个 Lean 条目 |
| `E:\math\lean\ComparatorChallenges\RyserCovering.json` / `RyserOddExtensions.json` | permitted axioms |
| `E:\math\lean\OAI\Combinatorics\Ryser\`（约 200 文件、27012 行） | 全部 Lean 取证；重点精读：Construction/{Main,ActualHypergraph,GadgetExistence,AmbientPoolExistence,GadgetDefinitions,GadgetGood,GadgetAlgebra,Hypergraph,Intersection,SelectedHypergraph,LabelAction,DeterministicCover,InfiniteCover,ExceptionalCover,GadgetConsequences,GroupPlacement,PoolThinProbability,AmbientDeletionNumerics,DirectionSets,DeletionLines,OddGadgets}、LineCover/{Main,Definitions,Deletion,Rigidity}、Incidence/{Parameters,Uniform}、Selection/{Main,Definitions}、Domination/Main、Field/{ExtensionSubfields,OddSubfields}、Hypergraph/{Definitions,Cover,Infinitude}、OddExtensions.lean、根 Main.lean |
| `E:\math\lean\lean-toolchain` / `lakefile.lean` | v4.34.1 / Mathlib @ d13f23b |



