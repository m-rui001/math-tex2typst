# Barnette 猜想素材：Paired states and Hamiltonian cycles in cubic bipartite planar graphs

> 论文：OAI:Paired-states-and-Hamiltonian-cycles-in-cubic-bipartite-planar-graphs-September-24-2026
> TeX 源：`E:\math\preprints\Paired-states-and-Hamiltonian-cycles-in-cubic-bipartite-planar-graphs-September-24-2026\build\paper.tex`（837 行，全文单文件，无 sections 拆分）
> Lean 源：`E:\math\lean\OAI\Combinatorics\Hamiltonian\`（31 个文件，共 8936 行，命名空间 `OAI.Barnette` / `Barnette.Network`）
> 本文件用途：为"第一人称反推思维链"笔记提供素材。所有 LaTeX 引用照抄 TeX 源码。

---

## 一、定理总览

### 1.1 主定理精确陈述

论文摘要与主定理（TeX 原文）：

```latex
\begin{abstract}
We prove Barnette's conjecture: every finite simple cubic bipartite planar
\(3\)-vertex-connected graph has a Hamiltonian cycle.
\end{abstract}
```

```latex
\begin{theorem}\label{thm:main}
Every finite simple undirected graph that is cubic, bipartite,
planar, and \(3\)-vertex-connected has a Hamiltonian cycle.
\end{theorem}
```

这是**完整 Barnette 猜想的 unconditional 证明**，不是部分结果也不是条件结果。摘要直接声称 "We prove Barnette's conjecture"。四个假设缺一不可，论文 Introduction 逐一定义：

- cubic：每点度数 3；
- bipartite：顶点二部划分，两部内部无边；
- 3-vertex-connected：至少 4 个顶点，删去任意至多两个顶点仍连通；
- Hamiltonian cycle：每点恰经过一次的圈。

注意论文第 54-55 行的限定："We consider finite simple undirected graphs throughout the main statement."——有限、简单、无向。

### 1.2 与 Barnette 猜想历史的关系

TeX 原文（Introduction）：

```latex
Barnette's conjecture, recorded by Gr\"unbaum in the 1969 Waterloo
proceedings \cite{Barnette1969}, asserts that every cubic bipartite polyhedral
graph is Hamiltonian, where polyhedral means planar and
\(3\)-vertex-connected.
```

即"polyhedral = planar + 3-vertex-connected"，论文的 Theorem 1.1 与猜想完全同义（"polyhedral graph"换成展开的定义）。此前部分结果（论文列出的谱系）：

- Goodey (1975)：所有面为四边形或六边形的情形；
- Feder–Subi (2006)：面三染色中一类面可任意大、另两类只有四/六边形；
- Kardoš (2020)：Barnette–Goodey 猜想（面长至多 6，不要求二部）；
- Schnieders (2025, Corollary 1.13)：面长至多 8 的情形。

论文声称 "We remove the face-size restriction within the full 3-connected bipartite class."——即在完整类上去掉面长限制。

### 1.3 两个推论（超出 Barnette 本身的输出）

**Corollary 4.x（edge-avoidance）**（TeX 原文）：

```latex
\begin{corollary}\label{cor:edge-avoidance}
For every graph \(G\) satisfying Theorem~\ref{thm:main} and every
edge \(e\in E(G)\), there is a Hamiltonian cycle of \(G\) avoiding \(e\).
\end{corollary}
```

论文指出这是 Barnette 猜想的**已知等价全局加强**（Kelmans，经 Hertel [Corollary 3, Hertel2005] 与 Gorsky–Steiner–Wiederrecht [Theorem 4.3, GSW2023] 解释）。论文不是引用它作为假设，而是**直接证出了这个加强**：Theorem 2.2 的划分定理允许"指定任意一条面边的端点进同一类"，其对偶效应就是避开那条边。

**Corollary（Pfaffian P4-Hamiltonian）**：

```latex
\begin{corollary}[Prescribed paths in Pfaffian graphs]\label{cor:pfaffian-paths}
Let \(G\) be a finite simple undirected graph that is cubic,
\(3\)-vertex-connected, Pfaffian, and bipartite. Every path on four
vertices (three edges) in \(G\) is contained in a Hamiltonian cycle.
In other words, \(G\) is \(P_4\)-Hamiltonian; in particular, it is
Hamiltonian.
\end{corollary}
```

这一条通过 GSW2023 的 Theorem 4.16（Barnette 猜想 ⟺ 三次 3-连通 Pfaffian 二部图的 P4-Hamiltonicity）把结论推广到**非平面**的 Pfaffian 三次 3-连通二部图。注意这一步是纯引用：论文没有自己证 Pfaffian 那部分，只是"我们的 Theorem 1.1 建立了 GSW 的条件 (i)，其 (i)⟹(v) 直接适用"。论文还提醒 "Every planar graph is Pfaffian \cite[Theorem~4.6]{GSW2023}"。

### 1.4 "paired states" 的确切定义（核心概念）

这是全文最需要精确定义的地方。设定（TeX 第 174-237 行）：

- 所有嵌入在球面上；选定外落后在平面里工作；
- 球面三角剖分（sphere triangulation）：连通、简单、至少 4 顶点、每个面的边界是 3-圈；
- separating triangle（分离三角形）：两侧都有（严格）顶点的 3-圈；
- spanning forest：允许孤立点的无圈支撑子图；单点图算树。

**计数引理**（TeX eq:counts，对所有无分离三角形前提前的讨论都成立）：

```latex
\begin{equation}\label{eq:counts}
 \#\{\text{white faces}\}=k,\qquad
 \abs{E(T)}=3k,\qquad \abs{V(T)}=k+2.
\end{equation}
```

其中 k 是黑面数（含选为外面的 t_0）。写 A = 黑面集合去掉 t_0（|A| = k-1），X = 非根顶点集（|X| = k-1）。**黑面与非根顶点一样多**是整个构造的算术基石。

**state（态）**：

```latex
A \emph{state} is a bijection \(r:A\longrightarrow X\) with
\(r(t)\in V(t)\), where \(V(t)\) is the vertex set of the
triangle \(t\).
```

即：给每个（非外的）黑三角指定它的一个顶点，且每个非根顶点恰被指定一次。这是面–顶点关联的完美匹配，论文说这就是 **Tutte state**（Tutte trinity 理论，现代处理见 Hine–Kálmán HK2018），并强调 "We prove all state properties needed here"——不引用 Kauffman clock theorem，不用顶点三染色。

**pair（配对态）**：

```latex
A \emph{pair} is an ordered pair of states
\((r,s)\) such that \(r(t)\ne s(t)\) for every \(t\in A\).
Equivalently, a pair consists of two edge-disjoint perfect
matchings in the bipartite incidence graph on \(A\) and \(X\).
```

两个态在每个黑三角都做**不同**选择；等价说法是关联二部图（左边 A、右边 X）中两条边不相交的完美匹配。

### 1.5 证明策略一页图（Introduction 第 84-157 行的自述）

论文自述的路线（这是后面逐引理的骨架）：

1. **对偶化**：原图 G 的球面对偶 T = G* 是三角剖分，G 的二部性给 T 的面黑白染色（每条边两侧异色）。Hamiltonicity ⟺ 三角剖分顶点分成两个**导出树**（APSW2016 Lemma 5 / Stein 1971 Theorem 2.2 的形式）。
2. **两个 disjoint states**（Proposition 3.1）：无分离三角形时，用容量 (2,1,2) 的整数流 + 密度不等式 e(U) - b(U) ≤ 2|U| - 4 造出一对 state。
3. **Disk identity**（Lemma 4.1）：state 双射强制有向圈的 δ-和为 ±3。
4. **加权消去**（Lemma 5.1 + Proposition 5.2）：对指数和 Z(x) = Σ i^{J(r,s)} e^{x ω(s)} 做两种分组。固定 s 分组：Q_s 有圈的项成对相消（相位差 ±2 ⟹ i^J 变号，实权重相同）。固定 D（无向边集）分组：每个圈贡献一个一阶零点，spoke circulation 权重保证逆时针定向 L_+(C) - L_-(C) > 0，最少圈数的组相位一致、幅度为正，Z 的对应 Taylor 系数非零。于是必存在 Q_s 是森林的 pair。
5. **白面树**（Lemma 6.1, 6.2）：森林态 Q_s 每个连通分量恰含一根；删掉的 spoke 的对偶构成白面上的树；第二次用 disk identity 证明选边集 P 无圈；补对偶是连通 2-正则图 = 单个 Jordan 曲线，其两侧标号给出两个导出树。
6. **分离三角形粘合**（Section 7）：沿分离三角形把 T 切成两块，各加盖成球面三角剖分，归纳求解；cap 上的染色由 3 | (B-W) 的整除性延拓；prescription 使两块在共享三角形上的划分一致，树沿一个点或一条边粘合。

论文特别声明两点（第 158-166 行）：

```latex
Two established matching constructions help place these steps in
context. The passage between incidence matchings and plane trees
is related to Temperley's correspondence and its weighted extension
by Kenyon, Propp, and Wilson \cite{KPW2000}. Regrouping two matchings
by their union cycles is familiar from the double-dimer model
\cite[Lemma~1]{Kenyon2014}. We use this regrouping together with the
separate fixed-second-state cancellation and positive-circulation
argument proved here; neither cited correspondence is an input to
those conclusions.
```

即 Temperley 对应与 double-dimer 重排只是**背景类比，不是逻辑输入**——论文自己重造了这两个轮子。第 168-170 行还声明：论证是纯存在性的（有限加权和），不给出多项式时间算法，对图阶与面长无界。

### 1.6 关键的整体结构洞察（反推入口）

**为什么去找一对 state？** 反推链：Hamilton 圈 ⟸ 补对偶是连通 2-正则图 ⟸ 选边集 P 在每个面恰选一条边且 P 无圈、|P| = k ⟸ P_0 的边来自一个森林态 Q_s（每条从"第三顶点"规则得到）⟸ 需要存在 Q_s 无圈的 pair ⟸ 用复指数和的两种分组消去所有带圈的 pair ⟸ 消去需要 disk identity（相位）+ spoke circulation（实权重排序）⟸ pair 的存在本身需要最大流/密度不等式。

也就是说全文的"引擎"是：**把组合存在性问题（存在森林态的 pair）转成一个非零多项式/幂级数系数问题**——有限和 Z(x) 若恒为零则所有 Taylor 系数为零；但按 D 分组算出的最低阶系数严格为正，矛盾。这是 BKR-style / Lee–Yang style 的"用复相位逼出实结构"的手法在图论里的直接应用。

---

## 二、逐引理带批注重构

> 本节按论文顺序逐条重构。每条含：(a) 精确陈述（TeX 原文）；(b) 证明机制逐步推导；(c) 每个假设/常数的机械性理由；(d) [推测] 候选失败路线。编号沿用论文：第 2 节 setup、第 3 节 pairs、第 4 节 disk、第 5 节 cancellation、第 6 节 trees、第 7 节 assembly。

### 2.1 Lemma 2.1（lem:duality）：补对偶的树性

**(a) 陈述**（TeX 原文）：

```latex
\begin{lemma}\label{lem:duality}
Let \(M\) be a connected graph embedded on the sphere.
The duals of the edges complementary to a spanning tree of \(M\)
form a spanning tree of \(M^*\). More generally, the duals of the
edges complementary to a spanning forest of \(M\) form a
connected spanning subgraph of \(M^*\).
\end{lemma}
```

**(b) 证明机制，逐步**：

1. 设 T 是 M 的支撑树。把 T 在球面嵌入里**收缩**成一个点。收缩是面保持的：树内部每条边的两侧属于同一个面，收缩后那些面合并边界但不消失。
2. 收缩删掉的恰好是对应的对偶边（每条树边与其对偶边相交一次，收缩后交叉消失）。剩下的平面图连通（一点加上所有非树边仍连通），其对偶连通。
3. 数边：非树边条数 |E(M)| - |V(M)| + 1。由 Euler 公式 |V| - |E| + |F| = 2，这等于 |F(M)| - 1 = |V(M*)| - 1。连通 + 边数 = 顶点数 - 1 ⟹ 树。
4. Forest 情形：把森林延拓成支撑树（加边），其补对偶包含原森林的补对偶作为子图，而树的补对偶是支撑树，故森林的补对偶是连通支撑子图。

**(c) 机械性理由**：

- "connected graph embedded on the sphere"——不需要 3-连通：对偶可能有环或重边，但引理只谈边数与连通性，环/重边不碍事。这正是论文第 186-187 行声明 "The plane graphs used for intermediate dual constructions may have loops or parallel edges" 的原因。
- Forest 情形（连通而非无圈）是后面真正用的版本：6.2 节里 E(T)∖P 的对偶要**连通 2-正则**，连通来自此引理，2-正则来自每个面恰有两条未选边——引理的 forest 版恰好覆盖"P 是 forest 而非 tree"的情况。
- 边数恒等式 |E|-|V|+1 = |F|-1 只在 M 连通时成立，所以假设里 connected 不可去。

**(d) [推测] 失败路线**：

- [推测] 若 M 不连通，补对偶边数变为 |E|-|V|+c（c 为分量数），恒等式破缺，结论只在每个分量内成立。构造中 H（spoke 图）必须先证连通（6.1 节专门证了），否则白面树不存在。
- [推测] 若在非球面（如高亏格曲面）嵌入，Euler 公式修正，边数不再是 |V(M*)|-1，树性失败。
- [推测] "收缩保持面"在树有孤立点/平凡情形（单点图是树，补对偶是整个对偶图）需要单独核对；引理陈述未排除 |V|=1，此时 |F|-1 = |E|-1+... 其实 Euler 给 |F| = |E|+1，仍自洽，但证明里"收缩成一点"是恒等操作，对偶边一条不删，结论变成 M* 本身是树——这要求 M 恰有一个面，与 |E|=|V|-1+? 一致性需查。这是引理的退化情形，正文未讨论。[推测] Lean 形式化中这类退化情形必须显式处理（见第三节）。

### 2.2 Theorem 2.2（thm:partition）：核心划分定理

**(a) 陈述**（TeX 原文）：

```latex
\begin{theorem}\label{thm:partition}
Let \(T\) be a sphere triangulation whose faces are colored black
and white so that each edge has one incident face of each color.
For any facial triangle \(t_0\) and any edge \(e_0\) of \(t_0\),
the vertex set admits a partition into two sets, each inducing
a tree, such that the endpoints of \(e_0\) are in one set and
the third vertex of \(t_0\) is in the other.
\end{theorem}
```

**(b) 机制总览**：无分离三角形时直接构造（3-6 节），有分离三角形时沿分离三角形切分归纳（第 7 节）。注意假设里没有"无分离三角形"——它只在中间构造里假设，最终用归纳消去。

**(c) 假设的机械性理由**：

- 面二染色（每边两侧异色）：由对偶图的 Euler 性（对偶图每个顶点度 3 ⟹ 对偶图二部 ⟺ 原图每面长偶 ⟺ 这里自动成立？不对——注意这是**定理的输入**，不是自动的。在最终应用（thm:main 证明）里，染色来自原图 G 的顶点二部性）。在 Lean 里（Main.lean 第 15 行）它以参数 `black : V → Prop` 加 `hb : ∀ e, black (N.tail e) ↔ ¬ black (N.head e)` 的形式进入。
- "each inducing a tree"：**导出**树，即 T[U] 包含两端都在 U 的每一条边。论文第 99-101 行特别强调 "Here an induced tree includes *every* edge between its vertices, so connectedness alone is insufficient."——这是 APSW 划分形式的关键点，连通性不够。
- prescription（e_0 端点同类、第三点异类）：完全是为了 Corollary edge-avoidance 与第 7 节粘合服务。没有 prescription，归纳法无法在分离三角形处拼接。

**(d) [推测] 失败路线**：

- [推测] 若面染色不真（某边两侧同色），state 的方向性 δ 与 disk identity 全部失效。
- [推测] 若 T 有 4 个以上顶点但出现"面的边界是 3-圈但可能重复"（非简单三角剖分），A 与 X 的双射可能不存在。论文把 simple 写进 sphere triangulation 定义。
- [推测] prescription 的可满足性：e_0 的两个端点在最终 Jordan 曲线同侧 ⟺ e_0 被选中。选边机制通过白面树的根 y_0（e_0 对面的白三角）实现，若 e_0 不在任何黑三角……不可能，每条边恰属一个黑面一个白面。所以 prescription 总可实现，但其"唯一性"不可保证（同一划分可有多个）。

### 2.3 Proposition 3.1（prop:pairs）：pair 的存在（流论证）

**(a) 陈述**：

```latex
\begin{proposition}\label{prop:pairs}
If \(T\) has no separating triangle, then a pair of states exists.
\end{proposition}
```

**(b) 证明机制，完整推导**：

**第一步：化归到度二子图。** 关联二部图 B：左边 A（黑面），右边 X（非根顶点），边 = 关联。pair = B 中两条边不相交的完美匹配。B 的度二支撑子图每个分量是偶圈，圈沿二部性交替染色即拆成两个完美匹配，且这两匹配在任何顶点处取不同的边——但注意：这给出的两个匹配在**每条边处**不相交（度二子图每点恰两条边，交替分给两个匹配，每个匹配每点恰一条，两条不同的边），所以两个态自动 disjoint。故只需 B 有度二支撑子图。

**第二步：Hall 型条件（eq:flow）。**

```latex
\begin{equation}\label{eq:flow}
 \sum_{t\in A}\min\bigl(2,\abs{V(t)\cap S}\bigr)\ge2\abs S
 \qquad(S\subseteq X).
\end{equation}
```

用最大流验证：源→X 容量 2，X→A 的关联边容量 1，A→汇容量 2。对割把 S ⊆ X 放在源侧、把 A 的一部分放源侧的极小化：把与 S 关联的 A 尽量放源侧可省容量，最小割容量为

```latex
 2(\abs X-\abs S)+
 \sum_{t\in A}\min\bigl(2,\abs{V(t)\cap S}\bigr).
```

要让值为 2|X|（即源侧全收），需 eq:flow。整数最大流（Ford–Fulkerson）给出流值 2|X| = 2|A|，每个顶点饱和：X 侧每点流出 2（度二），A 侧每点流入 2（度二）。

**第三步：流条件的几何等价（eq:density）。** 令 U = V(T)∖S（含三根），e(U) = T[U] 边数，b(U) = 顶点全在 U 中的实际黑面数（含 t_0，贡献 0）。若黑三角在 U 中有 j 个顶点，则 V(t)∩S 有 3-j 个，min(2, 3-j)：j=0 时 2，j=1 时 2，j=2 时 1，j=3 时 0。短缺（相对 2）为 max(0, j-1)：j=3 时短缺 2？不对——逐个算：贡献 2-min(2,3-j) = max(0, j-1)。j=0: 0, j=1: 0, j=2: 1, j=3: 2。

另一边：T[U] 中**每条边**恰有一个黑面入镜。若边两端都在 U，其黑面贡献相对 2 的短缺为：黑面有 j 个顶点在 U……关键换算（TeX 原文）：

```latex
If a black triangle
has \(j\) vertices in \(U\), its shortfall from two is
\(\max(0,j-1)\). This is its number of edges in \(T[U]\), minus
one if \(j=3\). Since each edge has exactly one black incident
face, \eqref{eq:counts} shows that \eqref{eq:flow} is equivalent to
\begin{equation}\label{eq:density}
 e(U)-b(U)\le2\abs U-4.
\end{equation}
```

推导：2|X| = 2(k-1)，2|S| = 2(k-1-|U|+3) = 2(k+2-|U|)... 等等，|X| = k-1，|U| = |V| - |S|，|V| = k+2，|X|+|S| = ... 让我认真算：eq:flow 是 Σ min(2, |V(t)∩S|) ≥ 2|S|。左边的"短缺形式"：Σ_t [2 - min(2,|V(t)∩S|)] ≤ 2|A| - 2|S|，即 Σ_t max(0, j_t - 1) ≤ 2(k-1) - 2|S|。

右方：j_t - 1（当 j_t ≥ 1）= (T[U] 中该黑三角的边数) - (j_t=3 时多算的 1)。T[U] 每条边恰属一个黑面（因为黑面覆盖每条边恰一次——每边一黑一白）。所以 Σ_{t: j_t≥1}（该三角在 U 中的边数）= e(U)，再减去 j_t=3 的黑面数 b(U)（含 t_0，但 t_0 的贡献按原文 "Include t_0 in the sum in eq:flow, with contribution zero" 特殊处理：t_0 不在 A 里，j=3 时 max(0,3-1)=2？不对——原文说 t_0 贡献零，而 t_0 全顶点在 U。所以 b(U) 里的 t_0 那项在"减一"账目上：max(0,j-1) 对 j=3 是 2，而边数 3 减 1 是 2，一致。含 t_0 的总账：Σ max(0,j_t-1) = e(U) - b(U)，其中 b(U) 是**全部**实际黑面（顶点全在 U 的），t_0 计入 b(U) 但不计入左边 Σ？原文说 "Include t_0 in the sum with contribution zero"——t_0 的贡献按 eq:flow 算是 min(2, 0)=0（因为 t_0 ∉ A，A 不含 t_0，所以 |V(t_0)∩S| = 3-3 = 0，min = 0，短缺 2？这里有点绕：eq:flow 的求和范围是 A，不含 t_0。把 t_0 以贡献 0 加入求和（即人为补上 t_0 那项 = 0），于是左边含 t_0 项 = Σ_{t∈A} min(...) + 0。短缺恒等式：含 t_0 的 Σ [2 - min(2,|V(t)∩S|)] = e(U) - b(U)，t_0 的短缺 = 2 - 0 = 2 = 3 边 - 1 黑面 ✓。于是 e(U) - b(U) = 2|A| + 2 - 2... 总结：eq:flow ⟺ e(U) - b(U) ≤ 2|U| - 4，其中 4 = 2·3 - 2（三根 + Euler）。具体代数：2|A| - 2|S| + 2 = 2(k-1) - 2(k+2-|U|) + 2 = 2|U| - 4。✓

**第四步：密度不等式的证明（eq:component + eq:face-defect）。** 对 T[U] 的连通分量 K（p ≥ 4 顶点，m 边，f 面，继承球面嵌入）：

1. K 的三角面 ⟺ 实际三角面（顶点在 K 里的 T 的真实面）。微妙方向：K 的一个三角面由 3-圈围成；3-圈不分离（无分离三角形假设！），故一侧是 T 的实际面；K 在圈外那侧还有顶点（K ≥ 4 顶点），所以 K 的这个面只能在"实际面"那侧。反过来实际面内部无顶点无边。
2. 非三角区域 d ≥ 4。设 b', w' 为该区域内 T 的原始黑白面数。**符号边计数**：

```latex
 3(b'-w')=\sum_{j=1}^{d}\sigma_j,\qquad
 \sigma_j\in\{-1,1\}.
```

每个 T 原始面边界长 3，黑面 +1 白面 -1 计边。区域内部边两侧一面黑一面白，贡献抵消（含重边、含区域内有其它分量的情形——因为那些分量不改变"边两侧异色"）。于是 |3(b'-w')| ≤ d，即 |b'-w'| ≤ d/3。加上整除性：3 | (b'-w')。分情形（TeX）：

```latex
For \(d=4\), parity and divisibility by three force the signed
sum to be zero. For \(d=5\), its absolute value is at most
three. For \(d\ge6\), use \(d/3\le d-4\).
```

d=4：3(b'-w') ∈ {-4..4} ∩ 3Z = {-3,0,3}，又 Σ σ_j 有 4 项 ∈ {-4,-2,0,2,4}，交集只有 0。d=5：|Σ| ≤ 5 且 Σ σ_j 奇偶 = 5 mod 2 奇，3(b'-w') ∈ {-3,3}，即 |b'-w'| ≤ 1 = d - 4。d ≥ 6：|b'-w'| = |Σ|/3 ≤ d/3 ≤ d-4。合并即 eq:face-defect：

```latex
 \lvert b'-w'\rvert\le d-4.
```

3. 区域划分 T 的所有原始面，色平衡总账：w - b = Σ_{非三角区域}(b' - w')（三角区域内黑白面数相等）≤ Σ (d-4)。
4. 面长恒等式：2m = Σ边界长 = (三角面贡献 3(b+w)) + Σ_{非三角}(d)。用 3 = 4 - 1：三角贡献 = 4(b+w) - (b+w)，故 2m = 4f - (b+w) + Σ(d-4) ≥ 4f - 2b（因为 w - b ≤ Σ(d-4) ⟹ -(b+w) + Σ(d-4) ≥ -b - w + w - b = -2b）。
5. Euler：p - m + f = 2 ⟹ f = 2 - p + m，代入 2m ≥ 4(2-p+m) - 2b ⟹ 0 ≥ 8 - 4p + 2m - 2b ⟹ m - b ≤ 2p - 4（eq:component）。

**第五步：拼装。** 含根分量：三顶点时是 t_0 本身，m=3, b=1, m-b=2 = 2·3-4 ✓。其余分量用弱界 m - b_act ≤ 2p（p ≥ 4 由 eq:component 减 4；p ≤ 3 由简单性：p=2 需重边、p=3 且非 t_0 的分量在无分离三角形假设下无法形成 3-圈分量……原话 "for smaller \(p\) from simplicity"）。求和得 eq:density，从而 eq:flow，从而 pair 存在。

**(c) 假设与常数的机械性理由**：

- **无分离三角形**：用在 K 的三角面 ⟺ 实际面那一步（3-圈必须不分离）。这是本命题唯一用到它的地方。[推测] 若有分离三角形，K 的某个三角面两侧都有顶点，b(U) 低估，eq:density 失效——第 7 节的归纳正是绕这个。
- **容量 (2,1,2)**：2 是"每个态用每顶点一次、共两个态"；1 是"两个态不能选同一条关联"（disjoint 性）。外层边（源→X、A→汇）容量 2 允许两个态各用一次。
- **p ≥ 4 与 p ≤ 3 分开处理**：Euler 推导需要 f ≥ 1 个真实面结构；p=3 的分量是 3-圈，在无分离三角形假设下只能是实际面 t_0。
- **2|U| - 4 中的 4**：来自 2·(根数 3) - 2（t_0 的记账）+ Euler 常数。本质是平面密度界：导出子图的面亏格。

**(d) [推测] 失败路线**：

- [推测] U = V∖S 中 S 任取都行吗？eq:flow 对一切 S ⊆ X 要求，而 U 含根。若 S 含根，U 不含根，e(U) 记账里 t_0 不再全在 U，b(U) 定义变化——所以流论证强制 U ⊇ 根，即割的最小化只在 S ⊆ X 上做。若攻击者想让 pair 不存在，必须在含根的 S 上违反 Hall 条件；但源→根边不在图里（根不是 X 的元素），根根本不受容量约束。结构上 pair 的存在性是"根不动、非根全动"。
- [推测] K 的"区域内部含其它分量"情形：符号边计数在那些分量的边界上也应抵消，但若分量共享……分量不共享边（不同分量），共享的只有"区域边界穿过另一分量"的拓扑纠缠，内边仍两侧异色抵消。Lean 形式化里这可能是个隐藏难点（见第三节 DiskRegions.lean）。
- [推测] d=5 情形用了 |Σ| ≤ 5 给 |b'-w'| ≤ 1；若区域边界有重复边（桥），d 计重复侧数，σ_j 仍每侧 ±1，论证不变；但"简单性 ⟹ p≤3 分量无 3-圈分量"对重边图不成立——三角剖分本身 simple，无碍。

### 2.4 Lemma 4.1（lem:disk）：Disk Identity——全文的技术心脏之一

**(a) 陈述**：

```latex
\begin{lemma}[Disk identity]\label{lem:disk}
Let \(r\) be a state. In each \(t\in A\), choose one edge
directed from \(r(t)\) to another vertex of \(t\).
Every simple directed cycle in the chosen edges avoids the
roots. Its \(\delta\)-sum is \(-3\) if it is counterclockwise,
and \(3\) if it is clockwise.
\end{lemma}
```

其中 δ 的定义（TeX 354-359 行）：对相邻 v, w，δ(v,w) = +1 若边 vw 的黑面在从 v 到 w 行进方向的左侧，否则 -1。反称；有界黑面的逆时针侧权重为 1。

**(b) 证明机制，逐步**：

1. 选边都从 r(t)（非根）出发指向别的顶点，非根才有出边，根无出边 ⟹ 有向圈不含根。
2. 圈的圆盘内无根（根在外面上）。设 h = 圈长，I = 严格内部顶点数，B, W = 圆盘内黑白面数，l = 边界边中黑面在圆盘内的条数。两条计数（eq:disk-counts）：

```latex
\begin{equation}\label{eq:disk-counts}
 B+W=2I+h-2,\qquad 3(B-W)=2l-h.
\end{equation}
```

第一条是三角剖分圆盘的 Euler 公式：F = B + W（把圆盘当补上圆盘面的球面：V = I + h，E = 3(B+W) + h ... 实际标准公式：对圆盘三角剖分 2I + h - 2 = B + W，可由球面 Euler 加外围面导出）。第二条是符号边计数：3(B - W) = (黑面边数) - (白面边数) = 内边两侧抵消后只剩边界：黑面在盘内的边界边 +1，白面在盘内的 -1，即 2l - h（h 条边界边，l 条黑面在内、h-l 条白面在内：+l - (h-l) = 2l - h）。

3. **state 的额外恒等式**（eq:matching-disk）：

```latex
\begin{equation}\label{eq:matching-disk}
 B=I+l.
\end{equation}
```

双射记账：每个严格内部顶点被 r 匹配到盘内一个关联黑面（该顶点的黑面在盘内：顶点严格内部 ⟹ 其关联面全在盘内）。每个边界顶点被匹配到其**出边**的黑面——出边是圈上的边，其黑面恰在 l 计数的情形下在盘内（边界边的黑面要么在盘内要么在盘外，出边的黑面在盘内 ⟺ 该边计入 l）。反方向：盘内每个黑面恰匹配到一个顶点（内部或边界）。无重复计数：r 是双射，且每个黑面至多提供一条选边（每 t 恰选一条边）。

4. 联立：B = 2I + h - 2 - W 与 3(B-W) = 2l - h 及 B = I + l。推 2l - h = 3(B - W)。把 B - W 用 B = I + l 代入 B - W = ... 直接：3(B-W) = 2l - h 与 B = I + l 联立 + Euler：B + W = 2I + h - 2。三式联立解：由 3(B-W) = 2l-h 与 B-W = B - (2I+h-2-B) = 2B - 2I - h + 2 = 2(I+l) - 2I - h + 2 = 2l - h + 2。所以 3(2l - h + 2) = 2l - h ⟹ 6l - 3h + 6 = 2l - h ⟹ 4l - 2h + 6 = 0 ⟹ 2l - h = -3。✓ 即逆时针 δ-和（= 2l - h：圈上每条边从 r(t) 出发方向……论文说"counterclockwise traversal"时每条边黑面在左侧，δ-和 = Σδ = l - (h - l) = 2l - h = -3）。

   等等，仔细核对符号：δ(v,w) = +1 若黑面在左侧。逆时针行进时圆盘在左侧，黑面在盘内的边 δ=+1，黑面在盘外的 δ=-1，和 = l - (h-l) = 2l - h = -3。所以**逆时针圈 δ-和 = -3**，顺时针 = +3。与陈述一致。这也解释了 5.3 节 eq:J 里"counterclockwise cycle contributes -1 to J"（J = δ-和/3）。

**(c) 常数的机械性理由**：

- **±3**：不是凑的——是 3(2l-h+2) = 2l-h 的解 2l-h = -3，系数 3 来自三角形面长。若面是四边形（四角化），同样的推导给 4(2l-h+2)=2l-h ⟹ 2l-h = -8/3，非整数 ⟹ 四角剖分里这种 state-圈结构根本不存在。±3 是三角剖分特有的。
- **圈避开根**：只有非根发出选边。这保证了圆盘内无根，Euler 记账干净。
- **state 双射**：eq:matching-disk 是 state 独有的，任意定向圈没有。论文第 401-403 行明确警告：

```latex
The matching condition in \eqref{eq:matching-disk} is essential.
The conclusion need not hold for arbitrary oriented cycles
of the triangulation.
```

**(d) [推测] 失败路线**：

- [推测] 若圈不是 simple（论文要求 simple directed cycle），圆盘记账会重数化，2I+h-2 失效。
- [推测] 若圈经过外面（含根区域），l 的定义（黑面在盘内）与 B = I + l 中边界顶点匹配到盘内黑面的论证断裂——根顶点无出边但可被圈"经过"吗？不会，圈不含根。但边界顶点的匹配对象是否一定在盘内？匹配对象是 r(边界顶点所在黑面)？不——是"边界顶点被 r 匹配到的黑面"，r 把黑面匹配到顶点，边界顶点 v 的入镜黑面 r⁻¹(v) 可能在盘外！重新读论文：eq:matching-disk 的论证是"每个盘内黑面匹配到盘内顶点（内部直接在、边界经 l 情形）"，而"每个内部顶点匹配到盘内黑面"。边界顶点的匹配黑面**不**计入 B 除非是出边黑面在盘内（即 l 情形）。所以 B = I + l 的正确读法：B = (匹配到内部顶点的盘内黑面) + (匹配到边界顶点且在盘内的黑面)。第一项 = I 吗？内部顶点 v 的匹配黑面 r⁻¹(v) 关联 v，必在盘内（v 严格内部，其关联面全在盘内），且不同内部顶点不同黑面（双射）。第二项 ≤ l，且盘内黑面若匹配到边界顶点必经边界边……这里有个 gap 候选：盘内黑面匹配到边界顶点，该黑面与边界顶点关联，黑面在盘内 ⟹ 其与 v 的关联边是边界边且黑面在盘内 ⟺ 该边计入 l 且 v 是该边……的哪端？l 是"边界边黑面在盘内"的条数，与顶点匹配一一对应需要：盘内黑面匹配到边界顶点 v ⟺ 存在恰一条计入 l 的边界边关联 v？若 v 关联两条盘内黑面（v 的两条边界边黑面都在盘内），v 只被匹配一次，那 l 计 2 而贡献 1？——但注意双射的另一侧：l 条边中每条边的黑面是被谁匹配的？论文原文："A boundary vertex is matched to the black face of its outgoing cycle edge, which lies inside in exactly the \(l\) counted cases."——即**只看出边**：边界顶点 v 的匹配黑面 = r⁻¹(v)，但论文断言它等于出边的黑面？不，原文说的是边界顶点匹配到的黑面（=出边黑面？）在盘内恰好 l 次。Hmm，r⁻¹(v) 不必关联出边。让我重新读：盘内黑面 f 匹配到顶点 r(f)。若 r(f) 是边界顶点，f 关联 r(f)，f 在盘内 ⟹ f 与圈的关系…… 这个双向计数其实要求：盘内黑面 f，r(f) ∈ 圈顶点 ⟹ f 的某条边是圈边界边且黑面（f 自己）在盘内。f 在盘内、关联边界顶点 v ⟹ f 至少一条边是边界边？f 是三角形，顶点 v 在圈上，f 的另两点呢——若都在盘内，f 有两条边入盘……f 与边界相交只能沿边界边（盘内面不会跨越边界），所以 f 恰有一条边界边（若两条则第三边是弦，弦端点都在圈上，弦内部在盘内——可能！f 有一条边是弦？那 f 不跨界……总之 f 的边界边数 ≥ 1）。这条边界边黑面在盘内 ⟹ 计入 l。反向：计入 l 的边界边 e，其盘内黑面 f 匹配 r(f)；需要 r(f) 是边界顶点且该对应无重复。r(f) 关联 f，f 只有一个边界顶点（另一边是弦的情形除外）……
  这个记账在论文里是压缩的（"Conversely every black face in the disk is matched to an interior or boundary vertex. There is no double counting: the state is a bijection and at most one chosen edge comes from each black face."）。[推测] 边界顶点关联两条计入 l 的边界边（两侧黑面都在盘内）时，l 计 2 但该顶点只贡献 1，会有 gap；补救是：此时圈在该顶点处的两条邻边的黑面都在盘内，出边黑面在盘内，但记账是黑面→顶点方向：黑面 f₁ (左侧) 与 f₂ (右侧) 都在盘内，各匹配某顶点；f₁ 匹配的顶点若不是边界顶点就矛盾（f₁ 只关联边界顶点 v 于圈上）……细节值得在精读时用小例子验证。Lean 的 StateDisk.lean 应该展开了这个论证（483 行，是最大的文件之一），见第三节。
- [推测] 圈绕"重边"——三角剖分 simple，无重边，安全。

### 2.5 Proposition 5.2（prop:forest-state）：存在 Q_s 为森林的 pair——全文主引擎

**(a) 陈述**：

```latex
\begin{proposition}\label{prop:forest-state}
Whenever at least one pair exists, some pair \((r,s)\) has
\(Q_s\) a forest.
\end{proposition}
```

其中 Q_s 的定义（TeX 407-410 行）：

```latex
For a state \(s\), let \(Q_s\) be the spanning subgraph of
\(T\) consisting of the edge opposite \(s(t)\) in every
\(t\in A\). These edges are distinct, since every edge of
\(T\) has a unique black incident face.
```

Q_s：在每个黑三角 t 里取 s(t) 的**对边**（不与 s(t) 关联的那条边）。

**(b) 机制总述**：定义 Z(x)（eq:Z），证 Z 恒为零会推出矛盾——先消去所有 Q_s 带圈的项（任意权重都行的引理 5.1），再证 Z 非零（选特殊权重的引理 5.3 + 引理 4.1）。

**Setup（J 与 Z）**：对 pair (r,s)，在 t 中定向边 r(t)→s(t)。X 每点一进一出（r、s 都是双射：出边以 s 为头、以 r 为尾？——每个顶点 v ∈ X 恰是一条定向边的头（s(t)=v 的 t 唯一）与一条的尾（r(t)=v 的 t 唯一）），边集 D 是 X 上点不相交圈的并；边作为无向边也互不相同（每边属唯一黑面）。J(r,s)（eq:J）：

```latex
 J(r,s)=\frac13\sum_{t\in A}\delta(r(t),s(t))
 \quad\hbox{is an integer}.
```

整数性：D 的每个圈由引理 4.1 给 δ-和 = ±3（圈是有向的、由 pair 定向边组成，是"chosen edges"的 simple directed cycle——每 t 恰一条选边 r(t)→s(t)，圈 simple 因为边互异且顶点度 2）。J = Σ圈 (±1) ∈ Z。Z(x)：

```latex
\begin{equation}\label{eq:Z}
 Z(x)=\sum_{(r,s)\ {\rm pair}}
             \ii^{J(r,s)}\exp\bigl(x\omega(s)\bigr).
\end{equation}
```

ω(s) = Σ_t a(t, s(t))，a 是待选实数权重（先任意，后特选）。

**引理 5.1（lem:cancel）**——固定 s 分组消去：

```latex
\begin{lemma}\label{lem:cancel}
For fixed \(s\) with cyclic \(Q_s\), the terms of
\eqref{eq:Z} having second state \(s\) sum to zero.
\end{lemma}
```

证明逐步：
1. 若 s 无 partner，无事可做（没有项）。
2. **只用 s** 选 Q_s 的一个简单无向圈 C（选择不依赖 r，这是关键——对合要作用在每个 partner 上是同一个）。
3. 对 partner r，记 u(t) = t 中非 r(t)、非 s(t) 的第三顶点，把对边定向 r(t)→u(t)。每点出度 ≤ 1（r 双射 ⟹ 每 v 至多是一条对边的尾……v 是 r(t) 的 t 唯一）。C 必须被这些对边**定向遍历**：C 的每个顶点处两条 C-边需不同尾，若某顶点的两条边都以它为尾则矛盾？原文："The chosen cycle must be directed: its edges need distinct tails at all its vertices."——即在 C 的每个顶点 v，C 的两条边分属两个黑面 t₁, t₂（C 的边 = 某黑面内 s(t) 的对边），对边定向尾是 r(t)；若两条边尾都是 v 则 r(t₁)=r(t₂)=v 违反双射。故每点恰一条边尾在此点 ⟹ C 上对边首尾相接成有向圈。特别地圈上无根（根非 X 元素、不能是 r(t) 的值……根不发出对边且根不在 C 上因为尾都是 X 元素——原文 "In particular it contains no root"）。
4. **对合**：在提供 C 的黑面上把 r(t) 换成 u(t)，其余不动，得 r̃。沿圈轮换顶点 ⟹ 双射保持；仍是 s 的 partner（u(t) ≠ s(t) ✓）。再作用一次还原。无不动点（每个改动三角形 r(t) ≠ u(t)？r(t) ≠ u(t) 因为 u(t) 是"第三"顶点 ✓——等等，改动发生在提供 C 的 t 上，r(t) 与 u(t) 不同恒成立）。
5. **相位变号**：改动三角形上 δ(u(t), s(t)) - δ(r(t), s(t)) = 2δ(r(t), u(t))（三条循环方向的 δ 关系：δ 是反称且在每个三角形上三个方向和为…… 原式直接给）。对定向对边圈用引理 4.1：对边圈 C 定向后的 δ-和 = ±3，而 J(r̃,s) - J(r,s) = (1/3)Σ 改动处 δ 差 = (1/3)·2·(±3) = ±2。
6. 于是 i^{J(r̃,s)} = i^{J(r,s)±2} = -i^{J(r,s)}。exp(xω(s)) 因 s 固定不变。对合配对相消，s 项总和为零。

**引理 5.3（lem:circulation）**——spoke 权重存在性：

```latex
\begin{lemma}\label{lem:circulation}
There are real numbers \(a(t,v)\) on the spokes of \(H_0\)
such that every counterclockwise simple spoke cycle has
strictly positive weight, where center-to-vertex traversal
has weight \(a(t,v)\) and reverse traversal its negative.
\end{lemma}
```

H_0：每个有界黑三角形内放中心，连三根 spoke 到顶点；允许孤立点（根若不邻任何有界黑三角？根总是邻的……"allowing isolated vertices" 指某些顶点可能不在任何 spoke 上？X 顶点都在。孤立点指中心不连任何——不会。保守起见照抄）。

证明逐步：每个连通分量单独做。对每个有界面 F 规定其**左边界环流**为 +1（沿面逆时针走一圈权重 1），无界面规定为 -(有界面数)。对每个有界面 F，在连通平面**对偶**中取 F 到无界面的一条简单路径，路径每跨一条对偶边 e（即原边 e），给 e 反对称权重：离开 F 贡献 +1、进入下一面 -1。路径中间面贡献抵消（+1 与 -1 相邻相消），只有 F 端净 +1。对所有有界面求和：每条原边获得权重 = (其右侧路径数相关)…… 最终每个面边界的环流等于规定值。于是任何逆时针简单 spoke 圈的权重 = 圈内部所含分量面数 > 0（内部面边界环流求和，内边抵消）。没有有界面的分量无圈，无需非零权重。

[批注] 这就是" circulations on a planar graph = 面上取势函数的差"：本质是给每条边赋 coboundary 使每面边界流为规定值。存在性由 H₁ = 0（平面圆盘拓扑）保证——论文用对偶路径显式构造，避免引用同调。**Lean 对应：Circulation.lean (253 行) + FlowCircuits.lean (360 行)**。

**非零性（5.3 小节）**——按无向边集 D 分组：

1. pair 的 D（r(t)→s(t) 边的无向并）决定每个 t 中选的边（每边属唯一黑面 ⟹ 每个黑三角至多一条 D-边；每个 t 恰一条因为 r,s 双射给出 t 一条边）。组的元素 = D 各圈的独立定向选择：尾给 r(t)、头给 s(t)。需验证每种定向都给双射：圈上每点一进一出，故"头映射"s 与"尾映射"r 都是 X 上的双射 ✓。
2. 对 D 的圈 C，L_+(C) = 逆时针定向时 Σ a(t, head)，L_-(C) 顺时针。claim（eq:positive-difference）：

```latex
 L_+(C)-L_-(C)>0.
```

   论证：逆时针遍历 C，把每条边 v→w 换成两-spoke 路线 v→t(中心)→w（Fig (b)）。spoke 权重和 = a(t,w) - a(t,v) = a(t,head) - a(t,tail)。闭 spoke 曲线总权重 = L_+(C) - L_-(C)。
   **这条 spoke 曲线简单且逆时针**——论文花了整段：每黑三角至多一条 D-边 ⟹ 不同 detour 内部不交、中心互异、共享的原顶点只是 C 的相邻顶点；原边与 detour 围成的子盘不含第三角 z；滑动是过简单曲线的 isotopy（第三角 z 若出现在 C 别处也不破坏）；逐边滑动保持逆时针。然后引理 5.3 给正性。
3. 圈的 J 贡献：逆时针 -1、顺时针 +1（引理 4.1）。组贡献（eq:group-product）：

```latex
 \prod_{C\subset D}
 \left(-\ii\exp(xL_+(C))+\ii\exp(xL_-(C))\right).
```

4. 每因子在 x=0 有**恰一阶**零点：-i + i = 0 但一阶导 -iL₊ + iL₋ = i(L₋-L₊) ≠ 0。c(D) = D 圈数，首个非零 Taylor 系数在 c(D) 次，为（eq:leading-coefficient）：

```latex
 (-\ii)^{c(D)}
       \prod_{C\subset D}\bigl(L_+(C)-L_-(C)\bigr).
```

   推导：∏(-i e^{xL₊} + i e^{xL₋}) = ∏ i e^{xL₊}(e^{x(L₋-L₊)} - 1)·(-1)？分解：-i e^{xL₊} + i e^{xL₋} = i(e^{xL₋} - e^{xL₊})。xⁿ 系数：∏ i · [x^{c(D)}] ∏ (e^{xL₋ᶜ} - e^{xL₊ᶜ})，最低阶来自每因子取一阶项 (L₋-L₊)x：系数 i^{c(D)} ∏(L₋-L₊)·(-1)？e^{xL₋} - e^{xL₊} = (L₋ - L₊)x + O(x²)，系数 = i^{c(D)} ∏(L₋-L₊)。而论文写 (-i)^{c(D)} ∏(L₊-L₋)：(-i)^c ∏(L₊-L₋) = (-1)^c i^c (-1)^c ∏(L₋-L₊) = i^c ∏(L₋-L₊) ✓ 一致。
5. **汇合**：至少有一组（pair 存在）。最小圈数 c_min 的组们相位同为 (-i)^{c_min}、幅度严格正（正性 claim）；圈更多的组在该次数无项。故 Z 的 c_min 阶系数 ≠ 0。但引理 5.1 已消去所有 Q_s 带圈的项 ⟹ 若所有 pair 的 Q_s 都带圈则 Z ≡ 0，所有系数为零，矛盾。故存在 Q_s 为森林的 pair。∎

**(c) 假设与常数的机械性理由**：

- **i 的幂**：J/3 ∈ {-1,+1} 每圈，i^{±1} = ±i；对合翻 ±2 ⟹ 变号。用 i 而非 -1 的原因：单圈贡献是 i 的奇次幂，两定向的相位差恰好 π（差 2 次 i 幂），而**实权重部分不翻**——如果直接用 ±1 权重，消去引理照样成立（(-1)^{J±2}？J±2 时 (-1)^{J} 不变！所以必须用 i：i^{J+2} = -i^J 而 (-1)^{J+2} = (-1)^J）。这是 i 不可换 ±1 的机械理由。
- **先任意权重再特选**：消去引理 5.1 对一切 a 成立（exp(xω(s)) 只依赖 s）；非零性需要 spoke 正性。这种"两阶段权重"让消去与非零解耦。
- **最低次数 c_min**：为什么只需要最低次？因为不同 c(D) 的组在不同次数出现系数，最低次的系数只由 c_min 组贡献，同相位同正号 ⟹ 不相消。高次组可能有别的相位，但那不影响 c_min 次系数。
- **exp(xω(s)) 与 x 参数**：x 是形式变量/实变量，Z(x) 是关于 x 的指数多项式，其 Taylor 系数是有限和。"若 Z 恒为零则系数全零"只需要逐系数考察，甚至不需要解析性——有限和即可。
- **D 分组时"每个黑三角至多一条 D-边"**：保证 spoke detour 互不纠缠（简单性）——若一个三角有两条 D-边，两条 detour 共享中心，曲线非简单。
- **pairs 的等价刻画（两态在每 t 不同）**：保证 D 无自环（r(t) ≠ s(t) ⟹ D-边是 t 的真边非退化）。

**(d) [推测] 失败路线**：

- [推测] **L₊ = L₋ 的可能**：若 C 逆时针与顺时针 spoke 闭曲线其实同向（比如 C 只有一条边？不可能，圈长 ≥ 3 且 D-边都在不同黑面……圈长 ≥ 3），或 spoke 曲线自交（两 detour 通过共享**顶点** v 相触但不交叉——论文处理了"共享原顶点只是 C 的相邻顶点"）。若 C 的两个不同顶点 u, w 的 detour 都要滑过对方……detour 内部互不相交由"每三角至多一 D-边"保证，但 detour 与**未滑动的其他 C-边**可能相交？滑动的最终曲线是全部 detour 的并，中间步骤论文用"successive slides preserve counterclockwise orientation"带过。若失败，正性 claim 断，非零性论证垮——但可能可以用拓扑度/绕数直接证：spoke 闭曲线绕内部面数 > 0，不需要简单性只需绕数。[推测] 这是可修复类失败。
- [推测] **c_min 组的幅度同为正但相位的 (-i)^{c_min} 可能不是实正**：不影响非零（非零不需要实正，只需同号）。注意 (-i)^{c_min} ∏ 正数 ≠ 0 恒成立，无论 c_min 奇偶。所以这步稳。
- [推测] **对合在 s 亦带同圈时**：改动 r 不动 s，Q_s 不变，无冲突。但若 C 同时也是某 pair 的 D-圈？D-边 r(t)→s(t)，Q_s-边是 s(t) 的对边（另一条边），同一黑面里两条不同边，不冲突。稳。
- [推测] **存在性问题 vs 实数权重依赖选择公理**：引理 5.3 的权重由对偶路径选择而来，Lean 里非构造性选择（Classical.choice 在 permitted axioms 里）。
- [推测] **有限和 Z(x) 在 x→0 的 Taylor 展开**：Z 是 exp 的有限和，整函数，逐系数读出没问题。若把 exp 换成形式幂级数也可以。无失败风险，但 Lean 里需要形式化"指数形式幂级数的系数提取"（PairPolynomials.lean, 450 行——大概就是这个）。

### 2.6 第 6 节：从森林态到两个导出树

**Lemma 6.1（lem:root-components）**：

```latex
\begin{lemma}\label{lem:root-components}
For a pair \((r,s)\) with \(Q_s\) a forest, every component of
\(Q_s\) contains exactly one of the three roots.
\end{lemma}
```

证明：Q_s 的边定向为 r(t) → 第三顶点 u(t)（不是 s(t)！注意 6 节开头："Orient its edges from r(t) to the third vertex."——第三顶点是 u(t)，即非 r(t) 非 s(t) 的那个）。出度：X 上 1（每 v 是唯一 t 的 r(t)……等等，r(t) 给尾，所以每 v ∈ X 恰一出边；根出度 0——但根可以是 u(t) 即头的目标）。分量有 q 点、a 根：总出度 = q - a（每个非根贡献 1）；树有 q - 1 条边，每边贡献 1 出度 ⟹ q - a = q - 1 ⟹ a = 1。孤立点情形包含在内（q=1, a=1）。

[批注] 这里 Q_s 是森林所以边数 = q - 1 per component；若 Q_s 有圈则 q - a = q - 1 不再成立（圈上点出度也是 1 但边数 > 点数 - 1），a=1 失效——所以必须有森林性。

**6.1 小节：白面上的树**。

1. H = **全部**黑中心（含 t_0）的 spoke 图。H 连通：T 的每条边可绕经其黑中心（边 vw 与其黑面中心 c：v→c→w 两根 spoke）。H 的面 ⟺ 白三角：spoke 把黑三角分三瓣；删去 T 原边后每个白三角与相邻三瓣连通；原顶点阻止进一步合并。
2. 删去 spoke (t, s(t))（t ∈ A）后剩：Q_s 的边各被黑中心细分 + t_0 中心的三根 spoke 到根。**Q_s 每分量恰一根**（引理 6.1）⟹ 加上 t_0 的中心后每分量通过中心连通成树，整体是 H 的支撑树。（细分不改变树性；t_0 中心是"枢纽"连接三个根分量。）
3. 引理 2.1（duality）：删掉的对偶 spoke 在白三角上构成支撑树。
4. 白面树以 y_0（e_0 跨过去的白三角，即 t_0 对面）为根；每条树边指派给**离 y_0 较远的端点**——每个白三角除 y_0 恰被指派一次（树的自然定向）。
5. 选边规则：spoke (t, s(t)) 邻接两个白三角（t 中与 s(t) 关联的两条边的另一侧白面）；取其被指派的那个白三角，选中 t 中 bordering 该白三角且关联 s(t) 的那条边。最后加选 e_0。
6. P = 选中集，P₀ = P∖{e₀}。每黑面恰选一（每 t 选的是 (t,s(t)) 对应边）、每白面恰选一（指派唯一性）。不同黑面的选择不同 ⟹ |P| = k（k 黑 + k 白面各选一次但每边至多属一黑一白…… |P| = k 因为黑面选择互不相同共 k-1 个 + e_0 = k）。
7. P₀ 每条边从 s(t) 方向定向（在其黑三角内）。

**Lemma 6.2（lem:P-forest）**：

```latex
\begin{lemma}\label{lem:P-forest}
The selected set \(P\) is a forest.
\end{lemma}
```

证明逐步：
1. P₀ 中无向简单圈必为**有向**圈（每顶点出度 ≤ 1：每 v ∈ X 至多作为一个黑三角的 s(t)？——s 是双射，每 v 恰一个 t 以 v 为 s(t)，但 P₀ 的边来自 (t, s(t)) 的选择，从 s(t) 出发定向 ⟹ 出度 ≤ 1，根出度 0）。
2. 对该圈用盘内数据 B, W, h, l（state s）。**额外计数**（eq:selection-count）：

```latex
\begin{equation}\label{eq:selection-count}
 B-W=2l-h.
\end{equation}
```

   论证：盘内每个面恰有一条选中边，黑 +1 白 -1 记号。内部完全在盘内的选中边贡献一次 +1 一次 -1（其黑面与白面都在盘内）相消——包括两端都在边界上的弦（弦两侧面都在盘内）。边界边全被选中（圈的边都是 P₀ 的边），其黑面在盘内 +1 否则 -1，合计 +l - (h-l) = 2l - h。而盘内面的贡献 = B - W。故 B - W = 2l - h。
3. 但三角剖分符号计数给 3(B - W) = 2l - h（引理 4.1 的第一条 eq:disk-counts，与 state 无关）。联立 ⟹ 2l - h = 0。可圈的 δ-和 = ±3 ≠ 0（引理 4.1，现在 state 是 s）⟹ 矛盾。P₀ 无圈。
4. P₀ 出度非根 1、根 0，同引理 6.1 的计数得每分量恰一根（P₀ 是森林）。
5. e₀ 连接两个不同根（e₀ 的两端点是根，根不同 ⟹ 不同分量）⟹ 加 e₀ 保无圈。P 是森林。

[批注] 这个证明的妙处：eq:selection-count 与 eq:disk-counts 第二式**同形不同源**——前者来自"每面恰选一边"，后者来自"面长 3"。同形迫使 2l-h = 0，而 state-匹配恒等式（引理 4.1）说有向圈必 2l-h = ±3。两把尺子夹死。

**收尾（Jordan 曲线论证）**：

1. E(T)∖P 的对偶边构成支撑对偶子图：连通（引理 2.1，P 是森林）且 2-正则（每面有 3 边、选中 1、未选 2 ⟹ 对偶图每顶点度 2）。顶点数 2k > 2 ⟹ 单个简单圈。
2. 把对偶圈画成与每条对应原边横穿一次、避开原顶点的 Jordan 曲线。曲线把球面分成两侧，给 T 的每个顶点标号（在哪侧）。
3. 边两端同标号 ⟺ 边 ∈ P（未选边跨曲线一次 ⟹ 两端异侧；选中边不跨 ⟹ 同侧）。两侧标号都出现（2k > 2 个对偶顶点…… 两侧非空）。
4. 森林 P 的分量数 = (k+2) - k = 2（顶点数减边数）。每分量标号常数（分量内的边同侧），故每标号恰一分量。两类各诱导一棵树（导出性：类内边的标号同 ⟹ 都在 P 中 ⟹ 都在树里——这正是"induced"的来路）。
5. t_0 处唯一同标号边是 e₀ ⟹ prescription 满足。∎ Theorem 2.2（无分离三角形情形）。

**(c) 机械性理由**：

- **为什么出度定向用 u(t)（第三顶点）而不是 s(t)**：Q_s 的边是 s(t) 的对边，自然尾是 r(t)、头是 u(t)——这样出度计数干净（r 双射）。若用 s(t) 定向，头尾都对不上双射。
- **2k > 2**：k ≥ 2 ⟺ 至少两个黑面 ⟺ 至少 4 个顶点（三角剖分定义）。
- **导出性的来源**：同标号边全在 P 中 ⟺ 类的导出子图 = 树。若只证"两类连通"而不证导出，Jordan 论证恰好免费给出导出——这是选 Jordan 曲线方案（而非直接树构造）的原因。
- **白面树根 y_0 的选择**：由 prescription 反推——e₀ 被选 ⟸ e₀ 是 t_0 处唯一同标号边 ⟸ 白面树在 y_0 处不指派（y_0 是根）⟸ y_0 跨 e₀。链条严格。

**(d) [推测] 失败路线**：

- [推测] **对偶 2-正则子图是"单个"圈的论证**：连通 + 2-正则 ⟹ 圈的不交并；单个需要连通，而连通来自引理 2.1 的 **forest 版**（P 森林 ⟹ 补对偶连通）。若 P 有圈，补对偶不连通，Jordan 曲线断裂。
- [推测] **"每面恰两条未选边"依赖每面恰 3 边**：三角剖分 simple 保证；若有重边/环，面长记账崩。
- [推测] **弦情形（eq:selection-count）**：两端在边界上的选中弦两侧面都在盘内，贡献相消——若弦的某一侧面不在盘内（弦在盘外？不可能，弦端点在圈上，弦作为 T 的边要么进盘要么出盘，两侧对称），安全。

### 2.7 第 7 节：分离三角形与最终组装

**Theorem 2.2 完整证明（归纳 + 粘合）**：

1. 对顶点数归纳。无分离三角形：用上面构造。
2. 有分离 3-圈 C：沿 C 切成两片，每片用 C 上的三角形**加盖**成球面三角剖分。两片都 simple、≥ 4 顶点、比 T 小。
3. **面染色延拓到 cap**：一侧的原始黑白面数 B, W，符号边计数使 3(B-W) = 三条边界符号之和（每 ±1）。被 3 整除 ⟹ 三个符号全等（和 ∈ {-3,3}）⟹ 该侧所有边界边的黑面同侧。cap 三角形反色放置。
4. 先对含 prescription 面 t₀ 的片用归纳（带 e₀）。该片 cap 上两个树标号都出现（单色三角形成导出树中的圈，矛盾）——cap 的三条边标号：cap 三个顶点不全同标号。prescribe 同标号边给另一片，用归纳。重命名标号使两片在共享三角形一致。
5. 同标号的两棵导出树交成连通子树（一点或一边带端点），并集是树，且在 T 中导出（两片内部之间无 T-边）。prescription 保持。∎

**Theorem 1.1 的证明**：

1. G 满足四假设，球面嵌入。**无 1-或 2-边割**：若割 δ(S) ≤ 2，两侧各 ≥ 3 顶点（三次 + 简单：单点至少 3 条跨边；两点至少 4 条），则删一侧至多两个跨边端点使图不连通，违反 3-顶点连通。
2. 对偶 T = G* **simple**：对偶环或对偶重边对 = Jordan 曲线穿过 1 或 2 条原边各一次 = 1-或 2-边割（两侧非空，因每条被穿边的端点分居两侧）。
3. 三次 ⟹ T 每面边界游程长 3，simple 中即三角形。Euler：|V(T)| = 2 + |V(G)|/2 ≥ 4。
4. G 的二部性染 T 的面。用 Theorem 2.2 得划分，两类导出树（森林）。每三角形恰一条类内边（树类不能含全部三顶点）。**E(T)∖P 的对偶边在 G 中连通**（引理 2.1）且每顶点度 2（每面恰两未选边）⟹ 单个支撑圈 = Hamilton 圈。∎

[批注] Hamilton 圈的顶点集是 G 的顶点 = T 的面；"对偶子图 2-正则"翻译到 G 里是"每顶点两条圈边"。"支撑"来自对偶图连通。"单个"来自连通 + 2-正则。

**(c) 机械性理由**：

- **无小边割**的论证方向：3-顶点连通 ⟹ 无小边割（对三次图二者等价——这是三次图上 vertex/edge 连通的经典关系，论文内嵌证明了一次）。
- **对偶 simple**：这一步在 Lean 里对应 ExactDual.lean（"exact dual" 的构造可能就是为了让对偶自动 simple 而设计的桥接——见第三节）。
- **cap 染色的整除性论证**：3 | (B-W) 且 |Σσ| ≤ 3 ⟹ Σσ = ±3 ⟹ 全同号。与 2.3 节 d=4 情形同款整除性戏法。

**(d) [推测] 失败路线**：

- [推测] **归纳中"两片都 simple"**：分离 3-圈在 T 中无弦（弦会连接两侧？弦两端都在 C 上，弦要么是 C 的边要么在 T 中连接 C 的两顶点的另一条路——simple 三角剖分中 C 的顶点对之间已有边即 C 自身边，无重边 ⟹ 无弦）。cap 加边后 simple 保持。但片内可能出现"面的边界是 3-圈但该 3-圈有重复"？不会。真正要小心的是片的面数 ≥ 4 与 state 定义域非空——k-1 ≥ 1 ⟺ k ≥ 2 ⟺ 片 ≥ 4 顶点 ✓。
- [推测] **粘合处导出性**：两树沿共享三角形交于一点或一边；并集在 T 中导出需要"T 中无横跨两片内部的边"——分离 3-圈的定义保证（两侧严格分）。但若 T 中存在一条边连接片 A 内部点与片 B 内部点，它必穿过 C……嵌入上不可能。安全，但 Lean 里需要显式（Gluing.lean, 303 行）。
- [推测] **标号重命名的协调**：两片归纳给的划分在 cap 上由 prescription 唯一化了吗？prescription 只固定"同标号边是哪条"，不固定哪个标号叫黑——所以可重命名。若 prescription 需求冲突（片 B 的 prescription 边与片 A 的已选边在 cap 上不同标号），需要先解片 A 才知道 cap 的标号模式，再 prescribe 片 B——论文的顺序正是如此（"Apply induction first to the piece containing t₀... Prescribe the same-label edge of the cap in the other piece"）。逻辑顺序依赖，无循环。

### 2.8 引理间的依赖图（论文侧）

```
thm:partition (完整)
 ├─ 无分离情形: prop:pairs ← lem:duality(边数), eq:counts
 ├─ prop:forest-state ← prop:pairs(至少一个 pair)
 │    ├─ lem:cancel ← lem:disk
 │    ├─ lem:circulation (独立)
 │    └─ 非零性 ← lem:disk, lem:circulation
 ├─ lem:root-components ← (森林性)
 ├─ 白面树构造 ← lem:duality, lem:root-components
 ├─ lem:P-forest ← lem:disk (两次), eq:counts
 ├─ Jordan 曲线收尾 ← lem:duality(forest 版)
 └─ 分离三角形归纳 ← 上述全部 (用于片)
thm:main ← thm:partition, lem:duality, (对偶 simple 论证)
cor:edge-avoidance ← thm:partition (prescription)
cor:pfaffian-paths ← thm:main + [GSW2023, Thm 4.16] (纯引用)
```

---

## 三、Lean 取证

> 源：`E:\math\lean\OAI\Combinatorics\Hamiltonian\`，31 个文件共 8936 行。挑战配置：`E:\math\lean\ComparatorChallenges\BarnetteHamiltonian.json`。
> **注意**：`E:\math\lean\formalization.yaml`（185 个条目）中**没有**本论文的条目（grep "Barnette"/"Hamiltonian"/"OAI.Barnette" 均无结果）——本形式化只通过 ComparatorChallenges JSON 登记。这是取证时的一个异常点。

### 3.1 挑战配置与 axiom

`BarnetteHamiltonian.json` 全文：

```json
{
  "challenge_module": "ComparatorChallenges.BarnetteHamiltonian",
  "solution_module": "OAI.Combinatorics.Hamiltonian.Main",
  "theorem_names": ["OAI.Barnette.main"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false
}
```

permitted axioms 只有 Lean 三标准公理（命题外延、商的泛性、经典选择），**无任何附加公理**。`enable_nanoda: false`。最终定理 `OAI.Barnette.main : MainStatement.{u}`，对任意宇宙层级 u 一致。

### 3.2 顶层陈述（Model.lean，50 行）

```lean
structure PlaneEmbedding (G : SimpleGraph V) where
  point : V → ℝ × ℝ
  point_injective : Function.Injective point
  arc : ∀ (v w : V), G.Adj v w → Path (point v) (point w)
  arc_injective ... arc_reverse ... arc_avoids_vertices ...
  interiors_disjoint : ... arc v w h t = arc x y k s → (v = x ∧ w = y) ∨ (v = y ∧ w = x)

def Planar (G) : Prop := Nonempty (PlaneEmbedding G)
def ThreeVertexConnected (G) : Prop :=
  4 ≤ Fintype.card V ∧ ∀ S : Finset V, S.card ≤ 2 → (G.induce {v | v ∉ S}).Connected
def HasHamiltonianCycle (G) : Prop :=
  ∃ v : V, ∃ p : G.Walk v v, p.IsHamiltonianCycle
def MainStatement : Prop :=
  ∀ V [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj],
    G.IsRegularOfDegree 3 → G.IsBipartite → Planar G →
      ThreeVertexConnected G → HasHamiltonianCycle G
```

要点：
- **平面性是纯拓扑定义**（ℝ×ℝ 中无交叉弧线嵌入），完全不涉及组合平面性或 Jordan 曲线定理。论文的一句话 "fix a sphere embedding" 在 Lean 里是一个六字段结构。
- Hamiltonicity 用 Mathlib 的 `Walk.IsHamiltonianCycle`；3-顶点连通显式带 `4 ≤ card V`。
- 四个假设一一对应论文 Theorem 1.1。注意 Lean 版本**不含** "simple" 独立假设——SimpleGraph 本身无环无重边。

### 3.3 核心代数对象：Network 与 Duality（Network.lean）

```lean
structure Network (V E) where tail : E → V; head : E → V
def gradient : (V → ℝ) →ₗ[ℝ] (E → ℝ), f ↦ (e ↦ f (head e) - f (tail e))
def boundary : (E → ℝ) →ₗ[ℝ] (V → ℝ)  -- 关联矩阵转置乘向量
structure Duality : Prop where
  connected : N.graph.Connected
  dual_connected : D.graph.Connected
  cycles_eq_cuts : N.boundary.ker = D.gradient.range
  dual_cycles_eq_cuts : D.boundary.ker = N.gradient.range
```

**这是全文最重要的取证发现：平面对偶被完全同调化。** 论文中的"球面对偶 T = G*"在 Lean 中不存在为图对象；存在的是**同一个边集 E 上两个网络 N（primal 顶点 V）与 D（dual 顶点 F）的线性代数关系**：N 的圈空间（boundary 的核）= D 的割空间（gradient 的像），加上两个 Euler 恒等式（`Duality.euler: card V + card F = card E + 2`）。所有"对偶"推理（对偶图 simple、对偶面是三角形、补对偶连通）都变成实向量空间维数与支撑集计数。

`duality_of_orth_card`：只要两图连通、顶点数满足 Euler、且 N.boundary(D.gradient f) = 0 对一切 f（正交性），即得 Duality——用 `Submodule.eq_of_le_of_finrank_eq` 从维数相等推出子空间相等。**正交性代替了对偶性**。

### 3.4 拓扑→代数的桥：格点走廊构造（Traces → SquareGrid → Corridors → MinorModel → BranchPartition → Rectangle → ExactDual）

这是 Lean 里论文完全没有的部分——论文只需要"取对偶"，Lean 必须从拓扑嵌入构造出代数对偶。链条（每步都是定理）：

1. **Traces.lean（260 行）**：把嵌入的弧切成三段。常数 **1/3、2/3**：`branch v = {point v} ∪ ⋃_{d.fst = v} curve d '' [0, 1/3]`（顶点的"枝"），`core d = curve d '' [1/3, 2/3]`（边的"芯"）。三个关键不交性：`branch_disjoint`（不同顶点的枝不交——弧只在端点附近相遇，1/3 截断保证）、`core_disjoint`（不同边的芯不交——无交叉嵌入）、`branch_core_disjoint`。然后 `uniform_thickening`：**有限个互不相交紧集存在统一的正距离 δ**，使各 δ-加厚互不相交（对每对用 `exists_thickenings`，再取有限最小值）。这一步替代了所有 Jordan 曲线/邻域论证。
2. **SquareGrid.lean（189 行）**：ℤ×ℤ 的 δ-方格。`cells δ K = {z | cell δ z ∩ K ≠ ∅}`（与 K 相遇的格子）。`cells_finite`（紧集只遇有限格）、`cells_disjoint`（加厚不交 ⟹ 格子集不交）、`cells_connected`（K 连通 ⟹ 格子集在格图上连通——用有限闭覆盖 + preconnected 的标准论证，`reachable_of_common_point` 处理两格共享一点的情形）。
3. **Corridors.lean（96 行）**：`CorridorModel G H`：每顶点一个连通有限 branch、每 dart 一个连通有限 corridor、互不相交、incident_meets（枝与芯相接）。`exists_lattice_corridor_model`：取 δ = ε/2，把枝/芯"栅格化"到 SquareGrid 上。**若尔当曲线定理被"有限紧集一致加厚 + 整数格覆盖"替代**——这正是提示词猜测的"格点走廊构造"，以代码证实。
4. **MinorModel.lean（279 行）**：`WalkSelection.CleanConnection`（最短路径最小化得"干净"通道），把每个 branch 沿走廊长到相邻 branch（`grownBranch`，两两不交、相邻性保持），得 `MinorModel G SquareGrid.graph`：**G 是整数格图的 minor**。
5. **Rectangle.lean（316 行）**：`RectangularDual.primal n m`：Fin(n+1)×Fin(m+1) 网格上的显式网络；`dual n m`：面 = `Option (Fin n × Fin m)`（外面对应 none）上的显式网络，**同一条边集** Edge n m（水平边 ⊕ 竖直边），tail/head 显式给出。`grid_duality`：`(primal n m).Duality (dual n m)`——由 `orthogonal`（boundary ∘ gradient = 0，两个二重和换序抵消）+ 卡片计数 + `duality_of_orth_card`。`lattice_minor_in_rectangle`：格图 minor 可塞进足够大的 (2r)×(2r) 方形（`finite_subset_box`：有限格点集有界）。
6. **ExactDual.lean（125 行）**：汇合点 `exists_exact_dual (E : PlaneEmbedding G) (hG : Connected)`：

```lean
theorem exists_exact_dual (E : PlaneEmbedding G) (hG : G.Connected) :
    ∃ (P : Network V G.edgeSet) (F : Type) (_ : Fintype F) (D : Network F G.edgeSet),
      P.Realizes G ∧ P.Duality D := by
  obtain ⟨M⟩ := E.exists_lattice_minor_model
  obtain ⟨r, ⟨M'⟩⟩ := RectangularDual.lattice_minor_in_rectangle M
  exact (RectangularDual.grid_duality (2*r) (2*r)).graphMinor hG _ _ M'
```

`Realizes G M := ∀ e, s(M.tail e, M.head e) = e.val`（网络 N 的边**恰是** G 的边集元素）。`Duality.graphMinor`（经 `Duality.minor`，CappedDuality/Quotients 的商推前）把格点对偶沿 minor 模型拉回：**G 的对偶 D 作为一个 Network F G.edgeSet 存在且满足线性代数 Duality**。

[取证批注] 论文证明 Theorem 1.1 时"取球面对偶"是一个不经意的动作；Lean 里它值 **约 1800 行**（Traces+SquareGrid+Corridors+MinorModel+BranchPartition+Rectangle 的主体）。这是"论文一句带过、Lean 被迫展开"的最大缺口，且方向与直觉相反：难点不在对偶组合，而在**从拓扑嵌入提取代数对偶而不使用 Jordan 曲线定理**。

### 3.5 彩色对偶与态（ColoredDual.lean、TriangleSystem.lean）

- `TriangleSystem A V`：抽象"三角形系统"——`vertex : A → Fin 3 → V`，每三角形三个角、`edge_unique`（两个三角形共享两条边则相等）。这是论文"三角剖分"的纯组合骨架，剥离一切拓扑。
- `State T X := {c : A → Fin 3 // Injective (fun t => vertex t (c t)) ∧ range = X}`——即论文的 state（双射 + 每三角选自己的角）。
- `Partner r s := ∀ t, r.value t ≠ s.value t`——pair 的 disjoint 条件。
- `oppositeGraph s`：Q_s 的抽象版本（两顶点相邻 ⟺ 存在 t 二者都不是 s 选的角）。
- `indexDelta i j = if i = j then 0 else if j = i+1 then 1 else -1`：δ 的组合版本（Fin 3 上的循环方向指标）。`thirdIndex i j = -(i+j)`：第三角。
- `ColoredDual`（结构体，8 个字段）：`duality + simple + dual_simple + cubic + black + coloring + face : ∀ v, D.Triangle (N.star v) + oriented`。**注意命名反转**：`black : V → Prop` 染的是 **N（原图 G）的顶点**，即对偶三角剖分 D 的**面**；论文的"黑面 t"= Lean 的"黑色顶点 v ∈ V 及其关联对偶三角形 `D.Triangle (N.star v)`"。整个 state 机器作用在 `M.Black root = {v : V // black v ∧ v ≠ root}`（黑顶点去根）与 `nonroots = 对偶顶点减根面三角形的角` 上——`nonroots_card` 证 |nonroots| = |Black root|，即论文 eq:counts 的 |A| = |X| = k−1（经 `black_dual_card: card F = #black + 2` 与 Euler）。

### 3.6 Disk identity 的同调化（StateDisk.lean 483 行 + Circulation.lean + Bonds.lean + FlowCircuits.lean）

论文 Lemma 4.1（δ-和 = ±3）在 Lean 里变成一条**割计数定理** `state_disk_delta`：

```lean
theorem state_disk_delta ... :
    ∃ (A : Finset V) (c : ℝ), A.Nonempty ∧ root ∉ A ∧ (c = 1 ∨ c = -1) ∧
      D.cycleFlow C = c • N.gradient (fun v => if v ∈ A then 1 else 0) ∧
      N.cut A = D.cycleEdges C ∧
      (N.cut A).card = 2 * (N.blackCut black A).card + 3 ∧
      N.blackDelta D black C = -3*c
```

解读与论文的字典：
- 有向对偶圈 C ⟹ `cycleFlow C`（沿圈 +1 的环流，Bonds.lean）。
- 圈是 N 中的割：`N.cut A = D.cycleEdges C`，且 c = ±1（`cycle_cut_scalar`：圈流 = c·指示函数梯度）。**"圆盘内部" = A（割的一岸），不再有几何圆盘！**
- `2l − h = −3` 变成 `(cut A).card = 2 * (blackCut A).card + 3`（blackCut = 割边中黑端点在 A 侧者 = l，割边数 = h）。
- `B = I + l`（匹配恒等式）变成 `state_disk_count`: `(A.filter black).card + (cut A).card = (regionVertices D A).card + (blackCut A).card`——**证明是纯有限集合双射计数**（state_disk_count 的证明：M ∪ Z = U、M ∩ Z = J 的像，四次卡片恒等式），替代论文的"内部顶点匹配到盘内黑面"论证。`mixed_corner_on_boundary`（圈上顶点必经割边）与 `Duality.vertex_flow_circuit`（去点连通 ⟹ 对偶梯度是 N-环流）是关键辅助。
- Euler 部分：`disk_boundary_imbalance` 组合 `region_euler`（DiskRegions.lean：区域网络的 Euler 恒等式，来自 `region_cycles_eq_range` + 维数计算）与三次计数，由 **omega** 收尾。**论文的"Euler 公式 + 符号边计数"在 Lean 里是圈空间维数公式 `dim_cycles: finrank ker + card V = card E + 1` 的应用**——Euler 公式本身不出现，它是 Duality.euler 的推论。
- `blackDelta black C = Σ_i ∇(1_black)(edge i) · arcSign(edge i)(vertex i)`：论文 δ-和的同调版本（黑指示函数的梯度与圈流的配对）。`blackDelta_cut` 算出 = c·(2·blackCut − cut)，与计数联立得 = −3c。

**权重（论文 Lemma 5.3 spoke circulation）的同调替代**：`whiteCharge black root := (黑点 0 / 白点 1) − root 处减 #白`。`boundary_of_sum_zero`（和为零的位势在 boundary 值域内——用 `range_internal_boundary` + ConnectedFibers，纯线性代数）给出 **α : E → ℝ 使 N.boundary α = whiteCharge**。论文"在每面放中心、连 spoke、用对偶路径造环流"的整个几何构造被这**一个显式位势的梯度**替代。正性变成：

```lean
-- ColoredDual.StateCycle.signed
theorem signed (α : E → ℝ) (hα : N.boundary α = whiteCharge M.black root) :
    (C.delta = -3 ∧ 0 < C.slope α) ∨ (C.delta = 3 ∧ C.slope α < 0)
```

其中 slope = Σ α(e)·cycleFlow(e) = c·#{A 中白顶点}（`whiteCharge_cut_integral`），白点数为正由 `white_positive_of_boundary`（若 A 全黑则 cut = blackCut ⟹ cut = 2·cut + 3 矛盾）。**论文的 L₊ > L₋（逆时针更重）与 δ-和 = −3 的"负相关"在 Lean 里是：delta = −3 ⟺ slope > 0，同一条链 `paired_sign`（Forest.lean 156-163）给出，配对方法完全是割/流配对，无任何等距同伦。**

### 3.7 消去与非零性（CycleReversal.lean、PairPhases.lean、PairPolynomials.lean、Forest.lean）

- **指数和变成 ℂ[X] 多项式**。论文 Z(x) = Σ i^J e^{xω(s)} 在 Lean 里是 `term w P = C(phase (rawIndexSum ...)) * stateWeight w P.right`，其中 `stateWeight w s = ∏_t (1 + w t (s t) X)`（`linearProduct`）。e^{xL} 的"一阶零点"变成 `cycleRightWeight − cycleLeftWeight = X · divX(…)`（`cycle_difference_eq_X_mul_divX`），即**多项式代数替代复指数分析**——无需收敛性/Taylor 定理，只需 `divX`（除以 X 的形式操作）。
- `phase n := Complex.I ^ (n / 3)`；`phase_add_six: phase (n+6) = -phase n`（对应论文 i^J 的 ±2 变号）；`phase_sum`（3 整除时分乘积）。
- **固定第二态消去**（论文 Lemma 5.1）：CycleReversal.lean 构造 `OppositeCycle`（从无圈性得圈坐标）、`changedCorners`/`reverse`（对合）、`reversal_involutive`、`reversal_ne`（无不动点）；PairPhases.lean `reverse_rawIndexSum_diff`、`reverse_phase`、**`fixed_second_state_cancels {M} [AddCommGroup M] [Module ℂ M]`**——消去引理直接对任意 ℂ-模里的系数化目标陈述（权重多项式是特例）。
- **按组聚合**（论文按 D 分组）：Lean 用 `Group := {Q : Pair // Q.third = P.third}`（第三角映射相同的一组对）与 `GroupIndex := range third`；`orient b`（对每个 CycleClass 翻转 bool）遍历组的 2^{#cycles} 个定向。`group_sum_product`：

```lean
(∑ Q : P.Group, term w Q.val) =
  ∏ c, C (phase (P.cycleDelta c)) * (P.cycleRightWeight w c - P.cycleLeftWeight w c)
```

- **最低次数非零**（论文 c_min 论证）：`common_phase_sum_ne_zero`——通用引理：非空指标集 s，c : D → ℕ（组号 = `Fintype.card (CycleClass d.representative.next)`，即 D 的圈数！），p d 的常数项为正实数 a d，则 Σ C((-i)^{c d})·(X^{c d}·p d) ≠ 0。证明：取 c 最小的 d₀，第 m 次系数 = (−i)^m·(Σ_{c d = m} a d) > 0。**组合背景被完全剥离成一个自足的多项式引理**。
- `cycle_factor_witness`：若 (delta = −3 ∧ slope > 0) ∨ (delta = 3 ∧ slope < 0)，则因子 = (−i)·X·q，q 常数项 = ±slope > 0——**论文的 eq:leading-coefficient 到位**。
- `forest_pair_of_disk_circulation`：反证——若所有 pair 的 oppositeGraph 均带圈，`sum_second_states`（按第二态 fiber 分解）逐项用 `fixed_second_state_cancels` 归零，与 `total_sum_ne_zero` 矛盾。论文 Proposition 5.2 完成。
- **抽象层与网络层的桥**（Forest.lean）：`PermutationCoordinates`（置换圈的坐标化，n+3 ≥ 3 且 minimalPeriod ≠ 1,2——保证圈长 ≥ 3）、`pairedCycle`（pair 的 next-置换圈 → StateCycle）、`pairedCycle_delta/slope`（δ-和与 slope 的换基）、`opposite_disk`（对边圈的 disk identity，两方向，经 reversal）。最后：

```lean
theorem forest_pair (hex : Nonempty ((M.system root).Pair (M.nonroots root))) :
    ∃ P, ((M.system root).oppositeGraph P.right).IsAcyclic := by
  obtain ⟨α,hα⟩ := N.boundary_of_sum_zero (whiteCharge M.black root) (whiteCharge_sum ...)
  exact Pair.forest_pair_of_disk_circulation hex (fun _ C r => M.opposite_disk C r α hα)
    (M.weights α root) (fun P c => M.paired_sign P c α hα)
```

### 3.8 pair 的存在：gadget + Hall（BMatching.lean 432 行）

**论文 Prop 3.1 的最大流在 Lean 里不存在。** 替代构造：

1. `gadget R : Left R → Right R → Prop`，其中 `Left R = (A×Fin2) ⊕ Inc R`、`Right R = (B×Fin2) ⊕ Inc R`、`Inc R = {z : A × B // R z.1 z.2}`。gadget 边：左 (a,k) ↦ 关联边（a 为第一坐标）、关联边 ↦ 右 (b,k)（b 为第二坐标）、关联边 ↦ 关联边。**这是"容量 2-1-2 流网络"的组合影子**：左外顶点容量 2（A×Fin2 两份）、右外顶点容量 2、关联边作为中间节点。
2. `gadget_hall`：从容量条件 `∀ S, 2|S| ≤ Σ_b min 2 #(S 中 R-邻 b)` 直接**组合计数**推出 Hall 条件 |L| ≤ |N(L)|（左右两边的计数分解 `count_sum`/`count_prod`，加 `incidence_fiber` 纤维计数，omega 收尾）。**没有流、没有增广路径、没有 Ford–Fulkerson。**
3. `gadget_matching`：调用 **Mathlib 的 Hall 定理** `Fintype.all_card_le_filter_rel_iff_exists_injective`，得 Left ≃ Right 的完美匹配。
4. `data_of_gadget` + `FactorData`：从匹配提取 2-正则二部关系 Q（`data_two_factor`：每行每列恰 2）。
5. `regular_matching` 两次剥离：先用 `regular_hall`（n-正则 ⟹ 完美匹配）取 f，再在 Q∖f（每行每列恰 1，仍 Hall）中取 g。`two_matchings`：**f, g : A ≃ B，R a (f a)、R a (g a)，f a ≠ g a**。
6. `pair_nonempty`：R = 关联关系（nonroots ↔ Black root），f、g 转成两个态 r、s，f a ≠ g a 逐点给出 Partner。**论文的"度二子图按二部圈交替染色拆两个匹配"被反向执行：先造 2-因子再剥离两个匹配。**

### 3.9 容量条件 = 密度不等式（MinorDuality.lean、Contraction.lean、DiskRegions.lean）

论文 eq:flow/eq:density 的 Lean 对应物是 `capacity_full`：

```lean
theorem capacity_full ... (root) (hbroot : black root) (S : Finset F)
    (hr : ∀ i, (face root).corner i ∉ S) :
    2*S.card ≤ ∑ v ∈ univ.filter black, min 2 #{i | (face v).corner i ∈ S}
```

由 `induced_density`（密度不等式，U := Sᶜ 方向）+ `capacity_identity`（逐三角形 min-记账恒等式：`three_corner_count` 的 2^3 分类 + `edges_in_count`/`all_corners`）+ `black_dual_card` + omega 拼出。而 `induced_density` 落在 Contraction.lean 的 **rim（边岸）机器**上：

- `inducedNetwork U`（D 上 U 的导出网络）、`regions`（补边的网络）、`regionQuotient`（按连通分量收缩）。
- `regionShore`（N 侧的岸）、`rim`（岸与外界的边数）、`blackRim`、`regionBalance`。
- `rim_cut_count`/`cut_le_rim`/`rim_ge_three`：3-边连通 ⟹ rim ≥ 3；`rim_three_cut`/`rim_three_no_internal`：rim = 3 的区域无内部结构（**这是 TrivialThreeCuts 的用武之地——分离三角形的对应物**）；`rim_defect (b d β) (hb : b ≤ d) (hd : 4 ≤ d)`：通用数值引理（对应论文 |b'−w'| ≤ d−4 的骨架）。
- `region_density`：单区域的密度界；`induced_density`：求和过所有区域。
- `region_euler`（DiskRegions.lean 252）：区域网络 Euler 恒等式，由 `region_cycles_eq_range`（区域圈空间 = 对偶梯度像）+ `region_dim_cycles` + `regionCycleMap_injective` 得到——**又是维数计算，无几何**。

[取证批注] 论文证明 eq:density 用的"K 的三角面 ⟺ 实际面"（依赖无分离三角形）+ 非三角区域符号边计数（|3(b'−w')| ≤ d 的整除性分析），在 Lean 里重组为：**rim/岸的组合计数 + rim_defect 数值引理 + 3-边连通与 TrivialThreeCuts**。论文假设"无 separating triangle"，Lean 假设 "ThreeEdgeConnected + TrivialThreeCuts"——二者在对偶语言下同义（对偶三角剖分的分离 3-圈 ⟺ 原图非平凡 3-边割），但 **Lean 从未提"分离三角形"**，全部在 N 侧（原图）以边割语言进行。

### 3.10 组装：强归纳 + 加盖 + 粘合（Gluing.lean、ThreeCuts.lean、CappedDuality.lean）

主引擎 `matching_strong`（Gluing.lean 244-291，对 |V| 强归纳）：

```lean
private theorem matching_strong (n : ℕ) :
    ∀ ..., Fintype.card V = n → N.Duality D → N.Simple → cubic → ThreeEdgeConnected →
      ∀ black, coloring → ∀ e : E,
      ∃ P : Finset E, e ∈ P ∧ (∀ v, ((N.star v).filter (· ∈ P)).card = 1) ∧
        (N.restrict (Pᶜ)).graph.Connected
```

- **结论已是 "Hamilton 圈语言"**：P 是每点恰一条关联边的边集（完美匹配！），补 Pᶜ 连通（+ 三次 ⟹ 2-正则 ⟹ 单圈）。论文的"两个导出树"在 Lean 里**从不出现**；划分定理被绕过，直接输出匹配 + 连通补。且比论文多了处方 `e ∈ P`（= Corollary edge-avoidance 的加强版直接作为归纳不变量）。
- 情形一（`N.TrivialThreeCuts`）：`make_coloredDual`（ThreeCuts.lean 101：由 Duality + 3-边连通造 simple 对偶、对偶面三角形、定向面 `oriented_face`——后者用 `FlowCircuit.proportional`：支撑相同的最小环流成比例，比例 c = ±1，反向时用 `Triangle.reverse`）→ `irreducible_matching`：取 root = e 的黑端点、i 使 e = face root 的第 i 边、`forest_pair` 给森林对、`recover_connected_complement`（ForestMatching.lean 375：recovery_matching 给 P + 每点一条 + selectNet 白树无圈 + selected_forest 加 sink 无圈 + `Duality.complement_connected`）。
- 情形二（非平凡 3-割 A）：`cap_duality`（CappedDuality.lean 148：`N.cap A` = 把 A 收缩成附加点 none 的加盖网络 `Option A`，由 `Duality.minor` 得其对偶存在）；对两半分别用归纳假设（卡片严格递减 `cap_card_lt`：card (Option A) < card V，需 2 ≤ Aᶜ.card）；**关键粘合**：`cap_matching_boundary` 给出割边中恰一条 c ∈ P，用它 prescribe 另一半（`cap_matching_boundary_at`），使两半的匹配在割边上**一致**（`cap_glue_agrees`），然后 `cap_glue_matching`（逐点 star 计数 = 1）与 `cap_glue_connected`（连通性：`delete_vertex_connected`——2-正则连通图去一点仍连通，用于去掉 cap 点 none 的桥接；再经割边 d 桥接两半，`cross` 分类讨论）。
- **与论文第 7 节的对照**：论文沿分离三角形切成两个三角剖分、分别求"两个导出树"、在 cap 三角形上按 prescription 重命名标号粘合；Lean 对 N 的 3-边割加盖、分别求**匹配**、用"割边上恰一条被选中且两边一致"粘合。**论文的树粘合（"交于一点或一边"）在 Lean 里是边集并 + star 计数**，没有树对象。
- 收尾（Main.lean）：`matching_complement_two`（Gluing.lean 26：三次 + 每点恰一 P-边 ⟹ Pᶜ 限制图 2-正则）+ `SimpleCycle.cycle_at_of_connected_two`（CappedDuality.lean 187：连通 2-正则图存在 Hamilton 圈，经 Mathlib `IsCycles.exists_cycle_toSubgraph_verts_eq_connectedComponentSupp`）→ `HasHamiltonianCycle`。`main` 的其余部分：3-顶点连通 ⟹ 3-边连通（`cut_card_three`，CutSpaces.lean 51，经 `region_card_le_cut` 与 `boundary_cover_of_threeConnected`）、二部性 → black/coloring（Main.lean 71-81，Fin 2 染色的 omega 推理）、`cubic_bipartite_order: 6 ≤ card V`（Network.lean 210——**非空性来源**，两邻域不相交至少 6 点）。

### 3.11 模块依赖链（import 顺序与行数分层）

```
Model → Network → (Quotients) → CutSpaces → FlowCircuits → Bonds →
MinorDuality ← Contraction ← DiskRegions → StateDisk → Circulation →
TriangleSystem → ColoredDual → PairPhases ← CycleReversal → PairPolynomials →
Forest ← ForestMatching → ThreeCuts → CappedDuality → Gluing →
BranchPartition → Rectangle → Corridors ← SquareGrid ← Traces ← MinorModel →
ExactDual → Main
```

（按 import 语句实际排列；近似分层：**代数基础层** Network/Quotients/CutSpaces/FlowCircuits/Bonds ≈ 1500 行；**计数/密度层** Contraction/DiskRegions/MinorDuality ≈ 1000 行；**态与消去层** TriangleSystem/CycleReversal/PairPhases/PairPolynomials/ColoredDual/StateDisk/Circulation/Forest ≈ 2400 行；**匹配层** BMatching/Matching/ForestMatching ≈ 1350 行；**拓扑桥** Traces/SquareGrid/Corridors/MinorModel/BranchPartition/Rectangle/ExactDual ≈ 1700 行；**组装层** ThreeCuts/CappedDuality/Gluing/Main ≈ 1050 行。）

### 3.12 论文 vs Lean 的差异总表

| 论文对象/论证 | Lean 对应 | 性质 |
|---|---|---|
| 球面嵌入、外 face | `PlaneEmbedding`（ℝ×ℝ 弧线） | 显式拓扑结构 |
| 球面对偶 T = G* | `Network F E` + `Duality`（圈空间=割空间） | **同调化，无对偶图对象** |
| Jordan 曲线 / 圆盘 / 内外 | 割 `cut A`、一岸 `A`、`regionVertices` | 完全消除 |
| 选外 face、根 | `root := blackEndpoint black e`（处方边的黑端点） | 处方边优先 |
| state / pair | `TriangleSystem.State` / `Partner` | 同构 |
| eq:counts（\|A\|=\|X\|=k−1） | `nonroots_card`, `black_dual_card`, `cubic_cards` | 线性代数卡片 |
| 最大流–最小割（Prop 3.1） | gadget + Mathlib Hall + 两次 regular_matching | **流消失** |
| 密度不等式 eq:density | `capacity_full` ← `induced_density` + rim 机器 | 边割语言 |
| 无 separating triangle | `ThreeEdgeConnected + TrivialThreeCuts` | 改述 |
| Disk identity（圆盘 Euler+匹配记账） | `state_disk_delta`（割计数 cut = 2·blackCut + 3） | 割计数 |
| Lemma 5.3 spoke circulation | `whiteCharge` 位势 + `boundary_of_sum_zero` | **单一位势的梯度** |
| L₊ > L₋（detour 等距同伦） | `StateCycle.signed`（slope = c·#白点 > 0） | 流配对，无同伦 |
| 指数和 Z(x)、Taylor 系数 | ℂ[X] 多项式、`divX`、`common_phase_sum_ne_zero` | 代数化 |
| 固定 s 消去（Lemma 5.1） | `fixed_second_state_cancels` + `reversal_involutive` | 同构 |
| 按 D 分组、c_min | `GroupIndex`（按 third 分组）+ 圈数最小的组 | 同构 |
| 白面树（Temperley 型） | `QNet`/`addSink`/`augQ` + `Duality.complement_connected` | 加 sink 的抽象森林 |
| 两个导出树 + Jordan 标号 | **不存在**；直接输出完美匹配 P + 补连通 | **结构性删除** |
| 分离三角形切分、cap 染色整除性 | `cap A = Option A` 网络 + `cap_duality`（`Duality.minor`） | 商网络 |
| 树沿点/边粘合 | `cap_glue_matching`（star 计数）+ `cap_glue_connected` | 边集并 |
| Corollary edge-avoidance | 归纳不变量 `e ∈ P`（内置） | 强化版直接证出 |
| Corollary Pfaffian（GSW Thm 4.16） | **未形式化** | 纯文献推论 |

### 3.13 论文看不出、只在 Lean 里暴露的结构细节

1. **"两个导出树"整个中间层被跳过**：论文的叙述主线（Theorem 2.2 划分 → Jordan 曲线两侧标号 → 导出性）在 Lean 中不存在。Lean 直接证"完美匹配 + 连通补"，导出性/Jordan 论证的全部工作由 `Duality.complement_connected`（补无圈 ⟹ 补连通，纯线性代数：`conserved_supported_acyclic`）承担。这说明划分定理是论文的**叙事选择**而非逻辑必需。
2. **对偶构造的真实成本**：约 1700 行的格点走廊机器在论文中是"取对偶"四个字。且设计上刻意避免 Jordan 曲线定理——用"有限紧集一致加厚 + 整数格覆盖 + minor 推前"。
3. **流结构消失**：论文 Prop 3.1 的最大流最小割在 Lean 中是 gadget-Hall 纯组合计数。真正保留"流"身份的是 `boundary_of_sum_zero`（位势的边界分解，来自 Quotients.lean 的 `range_internal_boundary`——它本质是 E → ℝ 上 boundary 值域 = internal 商空间的正交补的对偶这一 Hodge 型分解）。
4. **TrivialThreeCuts 是隐藏的关键假设**：`state_capacity`/`capacity_full` 需要"3-割必是单点岸"（rim_three_no_internal）。论文中它的角色由"无 separating triangle"承担，但论文证明 eq:density 时只在"K 的三角面 ⟺ 实际面"一处使用；Lean 里它还出现在 rim 机器的多处。二者的精确对应（分离 3-圈 ⟺ 非平凡 3-边割，经平面对偶）在 Lean 中不显式出现——因为对偶从来不是图，这层翻译无从谈起，直接以边割假设工作。
5. **圈长 ≥ 3 的反复出现**：`PermutationCoordinates` 要求 minimalPeriod ∉ {1,2}（`next_next_ne` 由 partner 条件 + edge_unique 推出）；`CycleCoordinates` 的 n+3 结构处处把"圈"参数化为 Fin(n+3)。论文的"simple directed cycle"在 Lean 里有三种化身：置换圈（Pair.next）、CycleCoordinates（抽象圈坐标，FlowCircuits.lean 232）、Network 圈流——三者间的换算是大量引理的内容。
6. **每处 omega 收尾的卡片恒等式**是论文中"Euler 公式 + 数数"的真实形态：`disk_boundary_imbalance` 一行 omega 背后是 `region_euler`（维数计算）+ `cubic_region_count` + `cubic_black_region_count` 三个引理。
7. **`oriented_face` 的 ±1 选择**：对偶面三角形的"定向"不是给定的，而是从"支撑相同的环流成比例"中选出的（比例 c = ±1，若 c = −1 就用 `Triangle.reverse` 反向）。论文假设面上有逆时针方向；Lean 证明可以选出一个使弧符号匹配的定向。
8. **e ∈ P 的处方进入方式**：root 取为处方边的黑端点，recovery 时 `removed_at_black` 在 root 的 star 里保留的恰是 `face root` 的第 i 条边 = 处方边（`he0 : matchingEdge P hd root = face root edge i`）。论文的 e₀ prescription 在 Lean 是"删边集合在 root 处留哪条"的选择。
9. **`cubic_bipartite_order`（6 ≤ card V）**：论文从未提这个下界；Lean 需要它来从连通性取非空顶点（实际上是为 `obtain ⟨v⟩ := h.connected.nonempty` 一类的非空性服务，以及 star 非空）。两邻域不相交（二部 + 无三角形）至少 3+3 点。
10. **Main.lean 的最终组装只有 86 行**：全部重量在前面 29 个文件里；最终定理从 `exists_exact_dual` 拿到 (N, D)，把二部染色转成 `black : V → Prop`，把 3-顶点连通转成 3-边连通，然后一句 `hd.hamiltonian N D ...` 收工。

---

## 四、常数与参数表

| 常数/参数 | 出现位置 | 论文/Lean | 机械性理由 |
|---|---|---|---|
| **3**（面长、圈长、delta ±3、割 = 2·blackCut + 3） | 全文 | 全部 | 三角剖分定义；disk identity 的解 2l−h = −3 来自 3(B−W) = 2l−h 与 B = I+l 联立；若面是 d-边形恒等式变为 d(2l−h+2) = 2l−h，一般无整数解 |
| **±3 的相位 i^{±1} = ±i** | eq:Z、phase 定义 | `phase n = I^(n/3)`，`phase_three`/`phase_neg_three` | 圈贡献 J = ±1 ⟹ 相位差 ±2 次 i 幂 ⟹ 对合翻号；用 ±1 权重则 (−1)^{J±2} = (−1)^J 不翻号——**i 是使固定 s 消去成立的最小选择** |
| **2**（外围容量；圈数；δ-变号 2；blackCut 前的系数） | eq:flow、lem:cancel | gadget 的 Fin 2、`phase_add_six` (+6 = −1) | 两个态各用每顶点一次；δ-和差 = 2·(单边 δ) ；割边中黑面在岸内者每条贡献 ±2 中的 1 |
| **1/3、2/3**（弧的三分点） | Traces.lean `third`/`twoThirds` | Lean 独有 | 把弧切成"端部 0–1/3（枝）+ 中段 1/3–2/3（芯）"，使不同弧的枝只在公共端点相遇、芯完全分离；任何 0 < a < b < 1 且 b < 1/2 类似的数都行，1/3, 2/3 是对称自然选择 |
| **δ = ε/2**（格距） | Corridors.lean | Lean 独有 | δ < ε 保证相遇格子的 cell 直径 < ε，从而落入加厚不交区 |
| **k、k−1、k+2**（黑面数、非根数、顶点数） | eq:counts | `black_dual_card: card F = #black + 2`、`cubic_cards: E = 3·B, V = 2·B` | Euler：V − E + F = 2 代入 E = 3F/2（每边一黑一白、每面 3 边）得 V = F/2 + 2 |
| **2\|U\| − 4**（密度界 eq:density） | Prop 3.1 | `induced_density` | 2·(3 根) − 2（t₀ 记账）+ Euler 常数 2 的合并 |
| **d − 4**（非三角区域缺陷） | eq:face-defect | `rim_defect (hb : b ≤ d) (hd : 4 ≤ d)` | \|3(b'−w')\| ≤ d 加整除性：d=4 ⟹ 0，d=5 ⟹ ≤1，d ≥ 6 ⟹ d/3 ≤ d−4 |
| **6 ≤ card V** | — | `cubic_bipartite_order` | 二部 + 简单 + 三次：任一点与其邻居 3 点异部，两邻域不交 |
| **4 ≤ card V**（3-连通定义内） | Model.lean | 同 | 排除 K₃ 等退化 |
| **card (Option A) < card V**（归纳递减） | cap_card_lt | Lean 独有 | 需 2 ≤ Aᶜ.card（割两岸各 ≥ 2 点），cap 顶点数 = |A| + 1 |
| **2·c(D) 与 c_min** | eq:leading-coefficient | `common_phase_sum_ne_zero` 的最小 c | 每圈因子恰一阶零点 ⟹ 组的首非零次数 = 圈数 |
| **\|P\| = k（每点恰一匹配边）** | 6.1 节 | `matching_complement_two` | 每面恰选一边 ⟺ 每个原图顶点（= 面）恰匹配一条 |

---

## 五、开放问题与可信度审查

### 5.1 声称与证明之间的缝隙（论文侧）

1. **spoke 闭曲线的简单性**（5.3 节，eq:positive-difference）：论文用一整段论证"detour 互不相交、逐边滑动是过简单曲线的 isotopy"，这是全文**唯一**真正用到平面拓扑的地方，也是写得最紧的地方。潜在缝隙：
   - C 的两个相邻 detour 在共享顶点 v 处相触——论文以"共享原顶点只是 C 的相邻顶点"处理，但"相触不交叉"的严格化（局部绕数）未给出；
   - "sliding the edge across that subdisk is an isotopy through simple curves. This remains true if the third corner occurs elsewhere on C"——若第三角 z 在 C 的另一条边附近，滑动路径可能与那条边靠近；论文一句话带过。
   - **Lean 的处理方式反证了这一步的可修性**：Lean 完全绕开（白电荷位势 + 流配对），说明该缝隙有干净的替代路线；但也意味着**论文的这一节没有独立的形式化验证**——若读者只读论文，此处是最需要自行补证明的点。
2. **eq:matching-disk（B = I + l）的记账**：论文用三行完成双向计数（"A boundary vertex is matched to the black face of its outgoing cycle edge..."）。如第二节 2.4(d) 所析，边界顶点关联两条盘内黑面的情形需要辨析——正确的读法是"盘内黑面 → 顶点"方向（每个盘内黑面恰匹配一个顶点，且该顶点或严格在盘内、或是经由计入 l 的边界边的唯一边界角），Lean 的 `state_disk_count` 用 M∩Z 与割边的对应把这一步做成了严格双射，**支持论文计数正确**，但论文文本确实跳过了这个 case。
3. **"导出树"与 Jordan 标号**（6.2 节收尾）：Jordan 曲线把顶点按侧标号、同标号边 ⟺ 选中——这里隐含用了"对偶圈与每条原边恰交叉一次且不经过顶点"的画法存在性（论文："Draw its edges crossing just their corresponding primal edges, once transversely, and avoiding all primal vertices"）。存在性平凡但需要论证（对偶子图在曲面上的正则邻域）。Lean 不需要这步（没有 Jordan 曲线）。
4. **cap 上的"两个标号都出现"**（第 7 节）：论证是"单色三角形成导出树中的圈"。注意 cap 三角形的第三点在另一侧片内——若三点同标号且导出，则该导出树含三角形，矛盾。正确，但依赖"导出"性——如果只有连通性就漏了。论文在此处对"导出"的强调是必要的。
5. **存在性 vs 复杂度**：论文明确声明无多项式构造。加权消去是纯存在性（矛盾论证），对想找算法的读者是死路。[推测] 权重 α（白电荷）其实给出了一个候选算法骨架（找 pair → 找森林态 → 直接构造匹配），但论文未讨论。
6. **GSW 引用的单向性**：Corollary pfaffian-paths 依赖 GSW2023 Theorem 4.16 的 (i)⟹(v) 方向。这是文献依赖，非本论文证明；若 GSW 的等价表有误，此推论受连坐（主定理不受）。

### 5.2 声称与证明之间的缝隙（Lean 侧）

1. **`formalization.yaml` 无条目**：本形式化只出现在 ComparatorChallenges 目录。若该 yaml 是仓库的正式"已形式化论文目录"，则本论文**尚未入册**——取证时应注明状态差异（可能因为刚完成、或 comparator 尚未跑通）。[推测] JSON 的存在表明已有挑战配置，缺 yaml 条目更像是登记滞后。
2. **依赖 Mathlib 的两个重定理**：Hall 定理（`Fintype.all_card_le_filter_rel_iff_exists_injective`）与 `IsCycles.exists_cycle_toSubgraph_verts_eq_connectedComponentSupp`。permitted axioms 只限制了本项目新增公理，Mathlib 内部 axiom 使用（应该也只有三标准公理）默认信任。这是标准做法，但取证报告应写明。
3. **`Classical.choice` 的广泛使用**：`open scoped Classical` 遍布各文件，`DecidableEq` 全部经典化；`Classical.choose`（matchingEdge、GroupIndex.representative、cap 边的选取）使构造非计算。主定理是纯存在性命题，无碍。
4. **未形式化的部分**：论文的 Corollary 2（Pfaffian）、第 1 节的历史等价性（Kelmans/Hertel）、全部背景动机。Lean 主定理**强于**论文主定理的直证路径（edge-avoidance 内置），弱于论文的中间定理（Theorem 2.2 划分定理本身没有 Lean 对应物——没有"两个导出树"的陈述）。
5. **TrivialThreeCuts 与无分离三角形的对应未被形式化**：Lean 从不需要翻译这层（全程边割语言），因此论文第 7 节的"分离三角形"论证与 Lean 的"cap"论证是**两条独立验证的路线**，二者的一致性靠读者自己确认。这实际上是形式化的加分项（交叉验证），但意味着不能拿 Lean 直接"检查"论文第 7 节的每一个字。
6. **归纳结构差异**：论文对顶点数归纳是叙述性的（"Induct on the number of vertices"），Lean 的 `matching_strong` 是显式 `Nat.strong_induction_on`，且结论（匹配 + 连通补）比论文的（划分 + 粘合）强。两处的归纳假设形状不同：Lean 归纳假设里带着处方边 e（可以是割边），这对应论文"Apply induction first to the piece containing t₀, with its specified edge e₀"——**Lean 的处方边在第二半是 c（cap 边界匹配边），与论文的"同标号边"处方对应**。

### 5.3 [推测] 后续笔记可用的"反推"切入点

1. 从 `HasHamiltonianCycle` 反推：为什么是"匹配 + 连通补"而不是"树划分"？——因为 2-正则连通 + 三次 ⟺ 匹配，匹配的对偶面（每面选一边）正好是论文的白/黑选边；划分定理是这条路的几何重述。
2. 从 `state_disk_delta` 的 `2·blackCut + 3` 反推 disk identity：把"圆盘内"换成"割的岸"，l = blackCut、h = cut，−3 = 2l − h 立即重现；再问匹配记账（B = I+l）在岸语言里是什么——M ∪ Z = U 的双射。
3. 从 `whiteCharge` 反推 Lemma 5.3：为什么一个位势的梯度就够？因为正性只需"圈流配对 = 岸上白点数"，而白点数 > 0 由 cut = 2·blackCut + 3 的奇性保证。论文的 spoke 几何是同一配对的画法。
4. 从 `forest_pair` 反推 Proposition 5.2 的必要性：若无森林态，全部项消去 ⟹ Z ≡ 0；但 c_min 组系数正。这条"多项式系数非零 ⟹ 存在性"是全文的引擎，且在 Lean 里被剥成三个自足引理（cancels / witness / common_phase）。
5. 从 `exists_exact_dual` 反推论文的第一步：没有 Jordan 曲线定理时"取对偶"值 1700 行——说明 Barnette 方向的任何后续工作若要形式化，格点走廊机器是可复用的公共基础设施。

### 5.4 总体可信度评估

- **Lean 形式化完整覆盖主定理**：从 PlaneEmbedding 到 HasHamiltonianCycle 无缺口、无 sorry（基于声明清单与关键文件通读；permitted axioms 仅三标准公理）。[批注] 我未逐一运行 `#print axioms OAI.Barnette.main`（环境无 Lean 工具链调用记录），此判断基于文件结构与关键证明通读；如需绝对确认应运行 comparator 或 `#print axioms`。
- **论文与 Lean 的核心恒等式一一对应**：eq:counts ↔ black_dual_card/cubic_cards；eq:flow ↔ capacity_full；disk identity ↔ state_disk_delta；正性 ↔ StateCycle.signed；消去 ↔ fixed_second_state_cancels；非零 ↔ common_phase_sum_ne_zero；粘合 ↔ cap_glue_*。**没有发现论文声称而 Lean 缺失的实质性步骤**；差异都是 Lean 侧更细（对偶构造、圈坐标化）或换了语言（树 → 匹配、同伦 → 流配对、指数 → 多项式）。
- **最薄弱点（论文侧可读性）**：5.3 节的 detour 同伦论证；**最薄弱点（对读者）**：第 6 节双向记账与第 7 节 cap 染色的压缩叙述。这些都有 Lean 侧独立路线背书。

---

### 附：本素材的文件出处速查

- 论文：`E:\math\preprints\Paired-states-and-Hamiltonian-cycles-in-cubic-bipartite-planar-graphs-September-24-2026\build\paper.tex`（837 行）、`build\triangle-figure.tex`、`README.md`
- Lean：`E:\math\lean\OAI\Combinatorics\Hamiltonian\`（31 文件 8936 行）；挑战配置 `E:\math\lean\ComparatorChallenges\BarnetteHamiltonian.json`；`E:\math\lean\formalization.yaml`（无本条目）
- 外部文献（论文引用，未核验原文）：Barnette1969、Tutte1946、APSW2016、GSW2023、Goodey1975、FederSubi2006、Kardos2020、Schnieders2025、Stein1971、Tutte1975、HK2018、FF1956、KPW2000、Kenyon2014
