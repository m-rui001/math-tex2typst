# D61 选择无 P 时间带计数也不捕获 P：我把分离做成了"支持长度与秩解耦"这一件事

对象论文：`Choiceless polynomial time with counting does not capture polynomial time`（2026-09-23，OpenAI，署名作者字段就是 OpenAI）。
TeX 源码：`E:\math\preprints\Choiceless-polynomial-time-with-counting-does-not-capture-polynomial-time-September-23-2026\build\`。装配文件是 `main.tex`（55 行），正文分片在 `sections\` 下九个：`00-introduction`(233 行)、`01-history`(112 行)、`02-structures`(204 行)、`03-support`(273 行)、`04-base-logic`(358 行)、`05-hf-transfer`(402 行)、`06-coding`(362 行)、`07-separation`(44 行)、`08-linear-algebraic-logics`(114 行)，合计 2102 行 TeX、顶层 `\section` 8 个与 `\subsection` 21 个、`proof` 环境 21 个；另有 `references.bib`(324 行) 与 `figures\`（`proof-map.tex`、`unit-face.tex` 两个分片）。`01-history.tex` 没有独立的顶层 `\input`，它被嵌在 `00-introduction.tex:134` 里、处在 `\subsection{Background and the obstruction to rank-dependent arguments}` 之下，这个安排本身就是论文的一个自白，我在第 3 节回到它。
编号条目一共 21 条（`main.tex:17-23` 让 theorem/lemma/proposition/corollary/definition/remark 共用同一个计数器，所以它们是一个连续序列）：Theorem 1 = `thm:main`、Proposition 2 = `prop:query-ptime`、Corollary 3 = `cor:linear-algebraic-logics`、Lemma 4 = `lem:universe-size`、Proposition 5 = `prop:opposite-answers`、Lemma 6 = `lem:H-automorphisms`、Lemma 7 = Sparse cochains、Proposition 8 = Small-orbit support bound、Corollary 9 = `cor:transitive-support`、Lemma 10 = Boundary of a box subset、Proposition 11 = Base counting equivalence、Lemma 12 = Extending a partial flow、Proposition 13 = Quantitative homogeneity、Theorem 14 = Transfer through small supports、Lemma 15 = Extension counts、Lemma 16 = Representation、Lemma 17 = Transfer of atomic facts、Lemma 18 = A bijection extending retained assignments、Lemma 19 = `lem:trace-size`、Lemma 20 = `lem:state-exactness`、Lemma 21 = `lem:substitution-width`。论文里没有 definition 环境，定义都以散文给出，这一点我在第 16 节当作风险项记账。
Lean：中心仓库 `E:\math\lean\formalization.yaml` 第 312-314 行登记了这篇（title/authors/id，`id` 指向 `../preprints/.../paper.pdf`），第 1006-1008 行给出比对条目：`comparator_config: ComparatorChallenges/ChoicelessPolynomialTime.json`、`declaration: OAI.CPTSeparation.main`、`file: OAI/ModelTheory/Choiceless/Separation.lean`。入口模块 `Separation.lean` 只有 28 行，它 import `QueryMachine`，实际证据铺在 `OAI/ModelTheory/Choiceless/` 的 26 个 `.lean` 文件、18461 行里。全部实测数字与错口清单在第 13 节。

记号约定与论文一致，我下面引用 TeX 时行号形如 `03:114` 表示 `03-support.tex` 第 114 行。$\CPT$ 在论文里恒带计数、且对 HF 秩无界（`00:23-24`），这条约定是整篇的存在理由，我不敢在任何地方偷偷削弱它。$L$ 是网格边长，$N=N_L=|A_b|$，$q$ 是轨道大小指数，$M=\lfloor L^{7/4}\rfloor$ 是计数句的变元名预算，$m$ 是程序自身的变元名常数，$s$ 是支持长度。

## 0 我进场时手里有什么，以及我一开始猜错的地方

我带着一个很具体的先入之见进场：这一类"选择无 P 时间"的下界，历史上是靠**秩**（rank）来组织的。Cai-Fürer-Immerman 那条线（CFI 1992）把全局奇偶性障碍藏进局部 gadget，Dawar-Richerby-Rossman 那条线把 hereditarily finite 对象按秩分层，每层给一个支持界。所以我最初的猜想形状是：只要证明"秩 $<r$ 的对象看不出这对结构"，再让 $r$ 慢慢长，就能逼近全形式。

论文第一段就把这个形状否掉了（`00:23-24`）：

```tex
In particular, $\CPT$ here always includes
counting and has no imposed bound on the rank of its sets.
```

而且 `01:39-44` 把理由写成了硬事实：

```tex
Dawar, Richerby and Rossman showed that the preordered CFI query obtained from ordered base graphs is
definable without counting, while even counting does not suffice if set
rank is restricted to $o(\log n/\log\log n)$, where $n$ is the input
size~\cite[Theorems~17 and~40,
2007 author version]{drr2008}. In particular, their lower bound for every
fixed rank cannot by itself yield a separation for the full formalism.
```

"their lower bound for every fixed rank cannot by itself yield a separation for the full formalism"这句我在第一遍读时滑过去了，第二遍才停下来：一个对所有**固定** $r$ 成立的下界，对一个秩随输入增长的程序集合完全无约束力。$\CPT$ 程序是解释程序，它的状态是逐层商集，每层的元素是上一层元素的集合，秩按层数增长；层数是多项式的（受 $B(N)$ 控制），所以程序的秩是 $\Theta(\mathrm{poly}(N))$ 级别、随输入走的量。固定秩的下界给不出任何 asymptotic 排斥。这就是论文小节标题 "the obstruction to rank-dependent arguments"（`00:133`）的字面所指，也是 `01-history` 被塞进这个 subsection 的原因：history 那一节的职责就是把我原本会走的那几条路逐条判死。

第二个先入之见也错了。我以为分离查询要长成图论的样子（CFI 那种），结果它是一个非常直白的有限域线性方程组相容性查询，词表只有八个二元关系，而且论文刻意**不加任何 promise**（`01:21-22`）：

```tex
The query here is a particular linear-consistency problem over
$\mathbb F_3$, defined without a promise on the input structure.
```

我读出的动机是：加 promise 的话，"这个查询属于 P"就要变成"promise 判定属于 P ∩ 查询本身"，`Proposition 2` 的干净陈述（$O(n^4)$ 循环 + 高斯消元）会脏掉。而 `00:74-77` 那三条约定（重复方程无害、空和为 0、无方程的系统相容）就是把 promise 补成全集定义的技术手段。

第三个先入之见，也是我最初最舍不得放的：我以为带计数的形式系统至少能"数出"轨道结构，从而把 $H$ 的作用看出一个不变量来。这在 `01:63-66` 有前例可参照：

```tex
Functional lower bounds expose different limits. Rossman proved that
CPT with counting cannot construct the set of hyperplanes of an input
finite vector space over a fixed finite
field~\cite[Theorem~6.1, author version]{rossman2010}.
```

Rossman 的那个对象（输入向量空间的超平面集合）恰好就是一个线性代数对象，而本文的查询也是线性代数对象；差别在 Rossman 是**函数式**下界（构造不出某个集合），本文是**布尔式**下界（判不出某个查询）。`01:73` 明确把这条区分摆出来："These are functional obstructions, not nondefinability of a Boolean query." 我的任务因此不能直接引用 Rossman，必须自己造一个二元查询，并且证明它在 P 里。

本文登记：对象论文目录 `preprints/Choiceless-polynomial-time-with-counting-does-not-capture-polynomial-time-September-23-2026`，在 `.tools/lean_queue.txt` 队列第 61 行号；正文取材只取自该目录 `build/` 下的 `.tex`，Lean 侧只取 `OAI/ModelTheory/Choiceless/Separation.lean` 与其比对条目。

## 1 分离查询 $Q$：逐字定义、量化顺序与我读错的地方

`00:34-38` 定死字段与词表：

```tex
Throughout, let $\mathbb F=\mathbb F_3$.  Fix the binary relational vocabulary
\[
 \tau=\{\mathsf{Ed},\mathsf{Cf},\mathsf{EB},\mathsf{VB},
             \mathsf I,\mathsf Z_0,\mathsf Z_1,\mathsf Z_2\}.
\]
```

（a）八个符号全是二元关系，`00:39` 说明 $\mathsf Z_\delta$ 的下标跑 $\mathbb F$ 的三个元素。域与索引集在 `00:41-45`：

```tex
 Y=\{y\in A:\mathsf{Ed}(y,y)\},\qquad
 X=\{a\in A:\mathsf{Cf}(a,a)\},\qquad
 X_t=\{a\in X:\mathsf{VB}(t,a)\}\quad(t\in X).
```

（b）补一步：$Y$、$X$ 用对角线刻画，意味着 $\mathsf{Ed}$、$\mathsf{Cf}$ 在目标结构里就是两个类型的"身份谓词"（`02:131-132` 说它们是边原子与构型原子的对角）。$X_t$ 由 $\mathsf{VB}(t,a)$ 定义，读作"$a$ 与 $t$ 在同一个顶点块里"。所以 $X_t$ 是含 $t$ 的那个块，而且 $t\in X_s\Rightarrow X_t=X_s$，因为 $\mathsf{VB}$ 在实现里是等价关系；`00:46-47` 却声明"No disjointness or equivalence-relation assumption is imposed here. In particular, $X$ and $Y$ may overlap."（c）这条免 promise 姿态的机械理由：查询要在**所有**有限 $\tau$-结构上有定义，包括那些 $\mathsf{VB}$ 不自反、$\mathsf{Ed}$ 与 $\mathsf{Cf}$ 重叠的退化结构；把网格结构需要的那些性质写成 hypothesis，查询就只在部分输入上有定义，`Proposition 2` 与后面的"同一对结构大小相同"都要重新解释。我核对过：本文的**下界**只用 $A_{b^0},A_{b^1}$ 这两个良态结构，查询在别处怎么表现其实无关，但定义域的完整性是 `Theorem 1` 那句 "on all finite structures in the fixed vocabulary $\tau$" 的字面要求。[推测] 作者宁可付这个代价也要保住"all"，是因为 BGS 猜想的历史陈述（`01:15-17`）用的就是全称形式，一个带 promise 的反例会被读成未答。

（a）系数在 `00:48-53`，逐字：

```tex
 C(y,a)=\sum_{\substack{x\in Y\\\mathsf I(a,x)}}
          \ \sum_{\substack{\delta\in\mathbb F\\
                              \mathsf Z_\delta(y,x)}}\delta
       \qquad(y\in Y,\ a\in X).
```

（b）两层和：外层跑 $a$ 通过 $\mathsf I$ 选中的边原子 $x$，内层跑在 $(y,x)$ 上成立的 $\mathsf Z_\delta$，把 $\delta$ 加起来。（c）`00:54-55` 补一句"If several of the relations $\mathsf Z_\delta(y,x)$ hold, all their contributions are included."，于是在退化结构里 $C(y,a)$ 是至多三个 $\delta$ 之和，仍然良定义。在良态网格结构里 `02:138-140` 把 $\mathsf Z_\delta$ 定义为"式 (eq:edge-difference) 恰等于 $\delta$"，每个对 $(y,x)$ 只有一个 $\delta$ 成立，所以 $C$ 就退化成那个群差。（d）我试过两条省事的替代写法：把 $C$ 定义成"唯一满足 $\mathsf Z_\delta$ 的 $\delta$"，或者定义成 $\sum_\delta \delta\cdot[\mathsf Z_\delta]$ 之外的 $\sum_\delta 1$。第一条在退化输入上部分定义（可能三个都不成立，也可能多个同时成立），要额外写选择，而"选择"正是这个形式系统禁止的东西，与全文的立场冲突；第二条丢掉 $\delta$ 的权，$Q$ 就不再检测群结构。[推测] 这两条都不是作者写的，我不当作论文内容。

（a）未知数族在 `00:57-60`：

```tex
Introduce two separate families of unknowns,
$(\lambda_a)_{a\in X}$ and $(\mu_y)_{y\in Y}$.  Thus even when $a=y$,
$\lambda_a$ and $\mu_y$ are different unknowns.  The system defining our
query has the equations
```

方程族是 `00:61-63` 的归一化与 `00:70-72` 的相容性，中间夹一个行测试 `00:65-68`：

```tex
 \text{there exist $a\in X_t$ and $x\in Y$ with
          $\mathsf I(a,x)$ and $\mathsf{EB}(y,x)$,}
```

```tex
 \sum_{a\in X_t}\lambda_a=1\qquad(t\in X)
```

```tex
 \mu_y=\sum_{a\in X_t}\lambda_a C(y,a).
```

（b）量词形状要说清楚：对每个 $t\in X$ 一条归一化方程；对每个三元组 $(t,y)$（$t\in X$、$y\in Y$）满足行测试时一条相容方程。所以方程数是 $|X|$ 加上 $|X|\cdot|Y|$ 个候选行，与 `00:105` 的 $n+n^2$ 对上。$\lambda,\mu$ 是 $|X|+|Y|\le 2n$ 个未知数（`00:104`）。"even when $a=y$"这句是关键：$X,Y$ 可以重叠，但未知数按**角色**分家，所以系数矩阵的两个列块互不共享变量。（c）为什么要有行测试：没有它，$y$ 与 $t$ 的块不相邻时方程 $\mu_y=\sum\lambda_a C(y,a)$ 也照样写，而 $C(y,a)$ 里对不相邻的 $y$ 也是良定义（可能恒 0），于是 $\mu_y$ 会被钉成 0 却同时被别的行钉成非 0，平白产生不可行性；那种不可行性与电荷障碍无关，会污染 `Proposition 5` 的方向。行测试把方程限制在"真正挨着的 $(t,y)$"上。（d）候选失败路线：把 $\mu_y$ 消掉、只留 $\lambda$，得到的系统是 $\sum_a \lambda_a=1$ 加上一堆 $\sum_a \lambda_a(C(y,a)-C(y',a))=0$。这在良态输入上与 $Q$ 等价，但在退化输入上会引入空方程 $0=0$ 与恒等式，量词结构变形；更要紧的是 `Proposition 5` 反证里 $\mu_{y_e}$ 是承载散度的角色，去掉它就要重写那段求和。另一条候选：把归一化右端从 $1$ 改成自由常数，那样任何零解都可行，查询退化成永真。$1$ 这个右端是"电荷守恒"的挂钩，动不得。

## 2 主定理与 P 时间一侧

（a）`00:81-86`：

```tex
\begin{theorem}\label{thm:main}
The query $Q$ on all finite structures in the fixed vocabulary $\tau$ of
eight binary relations is isomorphism-invariant and decidable in
deterministic polynomial time, but is not definable in full choiceless
polynomial time with counting.
\end{theorem}
```

`00:88-91` 立刻交代它兑现的是哪个猜想：

```tex
Theorem~\ref{thm:main} confirms the noncapture conjecture of Blass,
Gurevich and Shelah for the full counting formalism; its historical
formulation is discussed below. We first record the ordinary algorithmic
upper bound. The rest of the paper proves the choiceless lower bound.
```

（b）这句话里的 "does not capture" 我要按描述复杂度的口径钉住，不能按日常语义读。`00:26-30` 给了定义：

```tex
To say that this formalism \emph{captures polynomial time} on unordered
finite structures means that every isomorphism-invariant polynomial-time
query, in every fixed finite relational vocabulary, is definable by a
program of the formalism.
```

所以"不捕获"= 存在一个固定有限词表 $\tau$ 和一个 $\tau$ 上的同构不变 P 查询不被任何程序定义。反证逻辑是 $\neg\forall$ 变 $\exists\neg$：论文造 $\tau$ 与 $Q$（正面），再证 $Q\notin\CPT$（`07` 节用 $\neg$ 的定义性）。这两个方向合起来才否掉 capture。$Q$ 本身属于 P 只是"它在 P 里"，而它**不被定义**才是"捕获失败"。我最初把这两件事混着想过一遍，写下来的时候要分开。

（c）三个承重项各不可省。"fixed vocabulary"：$\tau$ 的八个符号写死在 `00:35-37`，程序也固定，$L$ 才允许长；若允许词表随 $L$ 变，程序可以用一个关系符号直接编码电荷。"isomorphism-invariant"：`Proposition 2` 的第一段（`00:98-102`）专门证它。"full choiceless ... with counting"：`01:43-44` 说这是全文最强的一侧，所有下界都必须在无秩界、带计数的前提下活下来。（d）候选弱化路线与停住点：把 counting 去掉（只留纯 CPT）会容易得多，但答不了 BGS 1997 那条明确猜想（`01:15-17`）；把"full"换成"rank $<r$"就是 DRR 已有的结果（`01:41-43`），且 `01:43-44` 直说它不够；把 $Q$ 换成"某个固定的 CFI 查询"，则撞上 `01:39-40` 的正结果（预序化 CFI 查询不需要计数就可定义）。

`Proposition 2`（`00:93-96`）：

```tex
\begin{proposition}\label{prop:query-ptime}
The query $Q$ is isomorphism-invariant and decidable in deterministic
polynomial time from an ordered encoding of its input structure.
\end{proposition}
```

证明 `00:104-109`：

```tex
If the input has $n$ elements, there are at most $2n$ unknowns and
$n+n^2$ equations.  All coefficients and tests can be computed by
polynomially many loops over the input universe; for example, a direct
implementation uses $O(n^4)$ operations over the fixed field.  Gaussian
elimination then decides consistency in polynomial time
\cite[Sections~14.4--14.5]{shoup2009}. Any input order
may be used to list the rows and columns: changing it does not change
consistency.
```

补一步算账：$C(y,a)$ 朴素算要外层 $|Y|\cdot|X|$ 个对、每个对做 $O(n^2)$ 次查表，这是 $O(n^4)$ 的来源；行测试对 $(t,y)$ 是 $O(n^2)$ 个对、每对 $O(n^2)$ 次查 $(\mathsf I\wedge\mathsf{EB})$，同量级。高斯消元在 $2n$ 个未知数、$n+n^2$ 条形如 $n^2\times 2n$ 的矩阵上是 $O((n^2)^{2}\cdot 2n)$ 级别，仍然多项式，被前面的 $O(n^4)$ 预处理盖住。$2n$、$n+n^2$、$O(n^4)$ 这三个数就是台账里 P 侧的三项。最后一句"Any input order may be used"是这个命题的全部要点：算法**允许**用序，答案**不依赖**序。这一句和第 0 节那个"程序不能用序"是同一枚硬币的两面，也是我后来理解整篇文章的入口。

`Corollary 3`（`00:123-127`）：

```tex
\begin{corollary}\label{cor:linear-algebraic-logics}
On nonempty finite $\tau$-structures, $Q$ is definable in both
$\mathrm{FPS}_3$ and $\mathrm{FPR}_3$. Consequently neither of these
logics is contained in $\CPT$.
\end{corollary}
```

这里我读错过一次：`Consequently` 那半句的推理依赖 $Q$ 在 $\CPT$ 里**不**可定义，所以它其实是 `Theorem 1` 的直接推论，而 `00:131` 那句"The nonempty witnesses constructed below give both noncontainments."是在提醒读者：$A_{b^0},A_{b^1}$ 这对见证结构同时也给出**非包含**。注意限定语 "On nonempty finite $\tau$-structures"（`00:124`），配合 `00:120-121` 的"so that the matrix index sets in its proof are nonempty"。空结构上矩阵没有行列索引，$\mathrm{FPS}_3$/$\mathrm{FPR}_3$ 的算子在那里的语义要么部分定义要么需要一个约定，作者干脆把这句话限制在非空类上。代价是 $\mathrm{FPS}_3\not\subseteq\CPT$ 这条结论只在"非空结构上的查询"这个语境内成立；论文用词是 "neither of these logics is contained in $\CPT$"，我按非空类读，标 [推测] 作者未必在意全域/非全域这点差别。

## 3 第二条死路：用群的非交换性本身

支持定理要用的 automorphism 群 $H$ 是中心扩张，商 $C_F$ 交换、核 $K$ 中心。我一开始的直觉是：非交换群的作用本身就足以把轨道撑大，从而小轨道的对象必然被少数坐标钉住；这在很多群作用论证里成立。`01:59-61` 直接把这条直觉关掉：

```tex
These results show why
the lower-bound argument must exploit the particular action of its
nonabelian group, rather than noncommutativity alone.
```

正面上游是 `01:51-58`：Abu Zaid-Grädel-Grohe-Pakusa 在预序类的小诱导子结构自同构群为 **Abel** 时给出选择无典范化，Lichter-Schweitzer 把诱导群扩到二面群与循环群。二面群是非交换的。所以"群非交换"这件事在文献里已经被证明不足以产生下界；机械地说，非交换性只保证存在交换子，不保证交换子落在**能检测对象的**那个子群里，也不保证交换子的值域有可数的面支撑。`00:169-171` 给出本文实际的机制：

```tex
This is the
role of the nonabelian group; central flows alone do not supply this
argument.
```

我把它读成一个双向的失败清单：只用中心的 $K$（散度为 0 的标量流）给不出稀疏性，只用交换的 $C_F$（面平移）也给不出。真正的引擎是 $C_F$ 上的对易式取值在 $K$ 里，而 $K$ 的元素是按边的，于是"轨道大小"这个纯群论量被翻译成"$K$ 的余维数"，再翻译成"多少个面有非零旋度"。这个翻译链条在第 5 节逐条走。

第三条死路我也试过，属于策略层面：直接引用 Shelah 2000 的声称。`01:24-30`：

```tex
Shelah's early work claimed noncapture for counting extensions of
choiceless computation~\cite[Introduction and Section~4]{shelah2000}.
Later accounts continued to state the capture problem as open, from
Blass, Gurevich and Shelah~\cite[Section~7]{bgs2002} through the 2025
work of Dawar, Gr{\"a}del, Kullmann and Pago~\cite[Section~2.2]{dawarGraedelKullmannPago2025}.
We give a separate proof for the explicit query above; Shelah's claim is
not a theorem input to this argument.
```

"not a theorem input" 这句我要按字面尊重：Shelah 的声称既不当前提也不当前人已完成的下界，本文的 `Theorem 1` 是自足的。这决定了我下面所有引理的验证都不能靠"文献里有"来免单。同时 `01:26-28` 那句"later accounts continued to state the capture problem as open"到 2025 年仍然如此，是本文新颖性的定位点，也是我对"确认猜想"这句宣传保持警惕的理由：猜想陈述（`01:15-17`，1997 版前言第 3 页）与本文的 $Q$ 之间的对应关系，靠的是"full counting formalism 不捕获 P"这个共同对象，并非任何显式的翻译。

## 4 第四条死路：先在原子上造预序，再跑 CFI 算法

`01:67-73` 把这条路也钉死：

```tex
Pago proved that no such program constructs, on every hypercube with
$N$ vertices, a total preorder with classes of size
$O(\log N)$~\cite[Theorem~2 and Corollary~3, full version]{pago2021}.
The latter statement also excludes encodings from which the preorder can
be recovered in CPT. It obstructs the route of first constructing a fine
preorder and then applying the preordered CFI algorithm.
```

我的原始计划正是这个被 obstruct 的计划：$\CPT$ 里最难的动作是给原子排序，若能给一个粗预序（类大小 $O(\log N)$），CFI 型算法就把无序问题降成有序问题。Pago 的陈述把"直接构造"和"构造出可恢复它的编码"两种都排除，所以我连绕道都不行。机械原因很清楚：$\CPT$ 的运算与输入自同构交换，一个 total preorder 的类如果比 $H$ 的某个轨道细，它就被某个非平凡自同构破坏；而要让类的规模小到 $O(\log N)$，必须切到比自然轨道细得多的层次。

由此推出本文必须采用的正面策略：不去分类、不去排序，是**证明程序看不出差异**。这是"counting equivalence"这一技术定位的来源，也是 `00:176-182` 那段的读法。我把这个转折记为整篇的方向变更：从"造不变量"变成"造等价"。

## 5 网格结构与边群：$A_b$ 到底由什么组成

`02:11-21`：

```tex
For an integer $L\ge2$, let $G=(V,E)$ be the box grid with
\[
 V=\{0,\ldots,L-1\}^3.
\]
Each edge is oriented in its positive coordinate direction.  Put
$\epsilon_{ve}=1$ if $v$ is the head of $e$, $\epsilon_{ve}=-1$ if it is
the tail, and $\epsilon_{ve}=0$ otherwise.  The incidence map is
\[
 \partial:\mathbb F^E\longrightarrow\mathbb F^V,
 \qquad (\partial z)_v=\sum_{e\in E}\epsilon_{ve}z_e.
\]
```

（b）规模账：$|V|=L^3$。平行于坐标对 $(i,j)$ 的单位正方向面有 $3\binom{3}{2}=3$ 个方向选法，每个方向 $L^2(L-1)$ 个面，故 $|F|=3L^2(L-1)$；边数 $|E|=3L^2(L-1)$（每个方向 $L-1$ 层每层 $L^2$ 条边）。内部点 $d(v)=6$，面上点 $4$，棱上点 $3$，角点 $2$，$L\ge2$ 时最小为 $2$，故 `02:37` 的 $d(v)\ge1$ 成立且很松。$|F(e)|$：一条边属于几个单位面？三个坐标方向里除去 $e$ 的方向还剩两个方向，每个方向上 $e$ 所在的那一层两侧各一个面（内部边）或一个（边界边），最多 $4$，故 `02:33-35` 的 $|F(e)|\le4$。$f(v)=|F(v)|$：过 $v$ 的面，每个坐标方向选两个（$v$ 两侧），每个方向 $\binom{2}{2}\cdot\ldots$；直接数：过 $v$ 的单位面由"含 $v$ 的坐标对方向 $\{i,j\}$"与"$v$ 在第三个方向上的邻位选择"共同决定，共 $3\cdot 2\cdot 2=12$，即 $f(v)\le12$。这三个常数 $4,12,6$ 是后面所有指数的地基。

`02:39-45`：

```tex
For vectors in $\mathbb F^2$, define the alternating form
\[
 \omega((a,b),(a',b'))=ab'-ba'.
\]
The edge groups use the standard finite Heisenberg multiplication
\cite[Section~2.1]{gurevichHadani2009}, with the face-boundary signs
specifying its alternating form.
```

（a）群律在 `02:46-53`：

```tex
The group $P_e$ attached to an edge $e$ has underlying set
$(\mathbb F^2)^{F(e)}\times\mathbb F$.  Its elements are written $(u,z)$,
where $u=(u_f)_{f\in F(e)}$, and its product is
\begin{equation}\label{eq:edge-product}
 (u,z)(u',z')=
 \left(u+u',\ z+z'+\frac12
          \sum_{f\in F(e)}c^f_e\omega(u_f,u'_f)\right).
\end{equation}
Here $1/2=2$ in $\mathbb F_3$.
```

（b）结合律补完：记 $B_e(u,u')=\frac12\sum_f c^f_e\omega(u_f,u'_f)$。左式的第三坐标 $((u,z)(u'))(u'')$ 是 $z+z'+B_e(u,u')+z''+B_e(u+u',u'')$，右式 $(u,z)((u',z')(u''))$ 是 $z+z''+z'+B_e(u',u'')+B_e(u,u'+u'')$。由 $\omega$ 双线性，$B_e$ 在每个变量上线性，故 $B_e(u,u')+B_e(u,u')+B_e(u',u'')=B_e(u,u')+B_e(u',u'')+B_e(u,u')+B_e(u,u'')$……这里我要停一下把两边写开：左 $=B_e(u,u')+B_e(u,u'')+B_e(u',u'')$，右 $=B_e(u',u'')+B_e(u,u')+B_e(u,u'')$，逐项相同，故结合律成立，正如 `02:54-59` 一句话带过的那样。单位元 $(0,0)$ 靠 $B_e(u,u)=0$（交错形式在特征 3 下仍满足 $\omega(u,u)=0$，因为它是 $ab'-ba'$ 直接代入）。逆 $(u,z)^{-1}=(-u,-z)$：$B_e(u,-u)=-B_e(u,u)=0$。`02:62-65` 给出群差的最后一坐标：

```tex
 z'-z-\frac12\sum_{f\in F(e)}c^f_e\omega(u_f,u'_f).
```

（c）$\frac12$ 这个因子的作用：它让 $B_e$ 对称化，从而 $\omega$ 的交错性刚好抵消，交换子落在中心 $\mathbb F$ 上。$\mathbb F_3$ 里 $1/2=2$，$2\cdot 2=1$。类二幂零、交换子取值为 2 倍辛形；这里 $\mathbb F_3$ 上"标准 Heisenberg 乘律"的说法就是 `02:43-45` 引用的那个来源。为什么必须是 $\mathbb F_3$：`01:21` 说查询是 $\mathbb F_3$ 上的线性相容性；$\mathbb F_2$ 上 $\frac12$ 不存在，而 $\mathbb F_3$ 是最小的可用域。这也让 $|P_e|=3^{2|F(e)|+1}$，指数里的 $2|F(e)|+1$ 就是"$u$ 有 $2|F(e)|$ 个 $\mathbb F$ 分量、$z$ 有 1 个"。（d）候选失败：若把 $P_e$ 取成 Abel 群（去掉 $B_e$），则 $C(y,a)$ 就是 $z'-z$，群差不再检测面坐标，程序可能靠 $\mathsf Z_\delta$ 直接数出面平移的轨道；同时 $H$ 的交换子部分恒零，第 5 节 `Proposition 8` 里"旋度非零的面数 $\le a$"这一步失去来源，支持界变成 $O(|F|)$ 级别。若换更大的域 $\mathbb F_p$，$N$ 的指数常数全变，但 $\omega$ 的机制不变，所以 $p$ 的选取纯粹是为了与查询域一致。[推测] 论文没讨论过换域的影响。

原子的定义在 `02:69-83`：

```tex
Fix $b=(b_v)_{v\in V}\in\mathbb F^V$.  The universe of $A_b$ is the
disjoint union of two kinds of atoms.  There is an \emph{edge atom}
$(e,u,z)$ for each edge $e$ and each $(u,z)\in P_e$.  At each vertex $v$
there is a \emph{configuration atom} for every tuple
\[
 a=\bigl(v,((u_e,z_e))_{e\ni v}\bigr)
\]
satisfying
\begin{equation}\label{eq:configuration}
 \begin{aligned}
 u_{e,f}&=u_{e',f}
       &&\text{for the two edges $e,e'$ of each face $f\in F(v)$ at $v$},\\
 \sum_{e\ni v}\epsilon_{ve}z_e&=b_v.
 \end{aligned}
\end{equation}
The coordinates in these descriptions label atoms; they are not members
of the atoms as sets.  The two kinds of atoms are tagged so they are
disjoint.
```

"The coordinates ... label atoms; they are not members of the atoms as sets." 这句我起初当修辞，后来才看出它是承重句：$\CPT$ 的对象是原子上的 hereditarily finite 集，若原子本身是集合（比如 $(e,u,z)$ 真是一个有序对集合），程序就能对它做 $\in$-分解、取出坐标、从而获得 $\mathbb F_3$ 上的算术与序；把原子做成真正的原子（urelement）就把这条路堵住了。整篇下界的合法性有一大半压在这一句上。

（a）`Lemma 4`（`02:104-115`）：

```tex
\begin{lemma}\label{lem:universe-size}
For each $L\ge2$, the size of $A_b$ is independent of $b$ and equals
\begin{equation}\label{eq:universe-size}
 N_L=\sum_{e\in E}3^{2|F(e)|+1}
       +\sum_{v\in V}3^{2f(v)+d(v)-1}.
\end{equation}
In particular,
\[
 L^3\le N_L\le (3^{10}+3^{29})L^3.
\]
Every vertex has at least one configuration atom.
\end{lemma}
```

（b）证明补完在 `02:116-126`，我把每步的量化对上：$e$ 上的状态数 $=|P_e|=3^{2|F(e)|+1}$。顶点 $v$：$f(v)$ 个面各给一个 $\mathbb F^2$ 值（因为同一面上两条边的面坐标被 `eq:configuration` 第一行等同），$u$ 部分贡献 $3^{2f(v)}$；$z$ 部分是一个含 $d(v)$ 个未知数的线性方程 $\sum\epsilon_{ve}z_e=b_v$，其中某个系数 $\pm1\ne0$，故解空间是 $\mathbb F^{d(v)}$ 中一个超 affine 子集，大小 $3^{d(v)-1}$，且对每个 $b_v$ 都一样（这正是"与 $b$ 无关"的全部理由）。两者独立，乘起来。下界 $L^3$：只用顶点项里 $v$ 至少贡献 $3^{2f(v)+d(v)-1}\ge 3^{2\cdot2+2-1}=3^{5}>1$ 一项？不对，`02:124` 说"$L^3$ 个顶点、$3L^2(L-1)\le 3L^3$ 条边"，下界其实是每项都 $\ge1$、求和项数至少 $L^3$（顶点个数），所以 $N_L\ge L^3$。上界：边项 $\le 3L^3\cdot 3^{2\cdot4+1}=3^{10}L^3$，顶点项 $\le L^3\cdot 3^{2\cdot12+6-1}=3^{29}L^3$。$3^{10}$ 与 $3^{29}$ 这两个常数就这样从 $|F(e)|\le4$ 与 $f(v)\le12,d(v)\le6$ 里掉出来。（c）"$N=\Theta(L^3)$"在 `03:273` 被显式消费，用来把 $2L(q\log_3N+1)^2$ 写成 $O_q(L(1+\log L)^2)$。（d）候选失败：若想给每个顶点固定个数个构型原子（比如只留一个"零构型"），$N$ 就变成 $O(L^3)$ 且常数更小，但 `eq:configuration` 的相容性就不再被 $\mathsf{VB}$ 块完整表达，第 5 节里"$H$ 作用保持构型"仍然成立，而 `Lemma 15`（面型精确计数）会失去它要数的东西。另一条：让 $b$ 参与计数（某些 $b_v$ 使顶点无构型），$N$ 就会依赖 $b$，`Proposition 5` 前那句"两个结构同大小"（`02:153-154`）就断了，而计数等价比较的前提正是同样大小的两个结构。

`02:128-145` 把 $\tau$ 的实现钉下来，其中 `02:142-145`：

```tex
Thus $\mathsf I$ goes from configurations to edge atoms; it is not made
symmetric.  The coordinate labels used to construct $A_b$ are not extra
symbols in its input vocabulary.  In particular, no ordering of the grid
or of its blocks is supplied to a program.
```

$\mathsf I$ 单向是刻意的：若对称化，程序就能沿 $\mathsf I$ 双向游走，构型与边的对应会暴露更多结构，`Lemma 10`（box 子集的边界）那套计数论证要重做。[推测] 这个方向。

## 6 相反答案：`Proposition 5` 的散度求和

（a）`02:156-160`：

```tex
\begin{proposition}\label{prop:opposite-answers}
For every $L\ge2$, the structure $A_{b^0}$ satisfies $Q$ and
$A_{b^1}$ does not.  More generally, $Q(A_b)$ implies
$\sum_{v\in V}b_v=0$ in $\mathbb F$.
\end{proposition}
```

电荷向量在 `02:149-152`：取定任一顶点 $v_*$，$b^0=0$，$b^1=\mathbf 1_{v_*}$。$v_*$ 是任取的（"Fix any vertex"），这个自由选择只发生在**构造**侧、不发生在程序侧，所以合法。

（b）正向：$A_{b^0}$ 每个顶点有一个全零坐标的构型（所有面坐标 0、所有 $z_e=0$，散度 $=0=b_v$，合法）。给它权重 $\lambda_a=1$、其余 0，归一化成立。对 $y=(e,u,z)$ 令 $\mu_y=-z$。`02:174-177`：零权构型在 $e$ 上选中的邻居是 $(e,0,0)$，由 `eq:edge-difference` 群差末坐标为 $0-z=-z$（$u=0$ 时辛项为 0），故 $\mu_y=\sum_a\lambda_a C(y,a)=-z$ 成立。

反向：`02:180-198` 的关键在于**不假设** $\lambda$ 选出一个构型。原文 `02:180-181`：

```tex
The weights
$\lambda_a$ are arbitrary field elements; we do not assume that they
select a configuration.
```

每条边只在本段证明里取零原子 $y_e=(e,0,0)$（选择者是我，不是程序）。对 $e\ni v$、$a\in X(v)$ 有 $C(y_e,a)=z_e(a)$，于是查询给出 $\mu_{y_e}=\sum_{a\in X(v)}\lambda_az_e(a)$ 与 $\sum_{a\in X(v)}\lambda_a=1$。乘 $\epsilon_{ve}$ 对 $e\ni v$ 求和：

```tex
 \sum_{e\ni v}\epsilon_{ve}\mu_{y_e}
 =\sum_{a\in X(v)}\lambda_a
       \sum_{e\ni v}\epsilon_{ve}z_e(a)
 =b_v\sum_{a\in X(v)}\lambda_a=b_v.
```

（c）第一个等号把 $\epsilon_{ve}$ 塞进 $\lambda_a$-求和里（有限和可换序，$\mathbb F$ 上成立）；第二个等号正是 `eq:configuration` 第二行。再对 $v$ 求和：$\sum_v\sum_{e\ni v}\epsilon_{ve}\mu_{y_e}$，一条有向边恰有一个头一个尾，$\epsilon$ 贡献 $+1$ 与 $-1$，逐边相消，得 $0=\sum_v b_v$。$b^1$ 给 $1$。这就是 `00:148-152` 那段 overview 里"each edge enters one vertex and leaves another"的严格版。（d）两条候选失败路线与停住点：其一，若把权重限制成"每顶点恰选一个构型"（即 $\lambda_a\in\{0,1\}$ 且和为 1 的 0-1 解），论证照样成立、甚至更快，但查询就从"线性相容性"变成"存在一个逐顶点选择使得某方程组成立"，这属于 NP ，并非显然的 P，`Proposition 2` 的高斯消元通道直接废掉。这条是最容易犯的错，也是我把 `02:180-181` 那句当作全文第二重要句子的原因：field-valued 权重是"相容性"这个 P 性质能够存活的条件。其二，若 $\partial$ 的余因子不全为 $0$（比如图有孤立顶点，$d(v)=0$），$v$ 项求和没有东西可消，$\sum b_v=0$ 的推导仍然成立但正向解的构造要重新检查；论文用 $d(v)\ge1$（`02:37`）排除了这种情况。

`02:201-205` 收尾把后续要用的两条不变量登记：

```tex
The remainder of the argument shows that a fixed choiceless computation
cannot distinguish these two structures when $L$ is sufficiently large.
The equality of their universe sizes and the fixed binary vocabulary
will be used throughout that argument.
```

"fixed binary vocabulary"与"equal universe sizes"就是台账里的两项。我至此手里有：一个 P 查询 $Q$，一对同大小、同词表、答案相反的结构。剩下的全部工作是证明任何固定程序在 $L$ 足够大时给同一个答案。转折点已经出现两次：一次是从"按秩分层"转到"按轨道大小分层"（第 0、3 节），一次是从"造不变量"转到"造计数等价"（第 4 节）。接下来第 7 节进入支持定理，那是把群论换成稀疏性的地方，也是我打算花最多笔墨的一节。

## 7 支持定理：`Proposition 8`，全文唯一与秩无关的量化

`03:3-7` 开宗明义：

```tex
The automorphisms used in this section have two parts. Face translations
form an abelian quotient, but their commutators produce central flows on
edges. This interaction constrains the stabilizer of an object with a small
orbit. We will turn that constraint into a short tuple of atoms whose
pointwise stabilizer in the central flow subgroup fixes the object.
```

（a）群 $H$ 在 `03:22-40` 建起来：

```tex
For $a,a'\in C_F$, define an edge vector
\[
 B(a,a')=\frac12\sum_{f\in F}\omega(a_f,a'_f)c^f\in K.
\]
```

```tex
\begin{equation}\label{eq:H-product}
 (a,k)(a',k')=(a+a',k+k'+B(a,a')).
\end{equation}
```

```tex
\begin{equation}\label{eq:H-commutator}
 [(a,k),(a',k')]=\left(0,\sum_{f\in F}
                  \omega(a_f,a'_f)c^f\right).
\end{equation}
```

（b）$B(a,a')\in K$ 要用一步验证：$\partial B(a,a')=\frac12\sum_f\omega(a_f,a'_f)\partial c^f=0$，靠 `02:28-30` 的 $\partial c^f=0$。这一步同时解释 $B$ 为何取在 $K$ 里，并非取在 $\mathbb F^E$ 里：只有取值在核里，`eq:H-product` 才把 $C_F\times K$ 关成一个群。交换子逐项算：$(a,k)(a',k')(a,k)^{-1}(a',k')^{-1}$，第一坐标因加法交换而消掉；第二坐标 $k+k'+B(a,a')-k-B(a',k)=B(a,a')-B(a',k)$……这里 $k$ 那部分与 $B$ 无关，实际只剩 $B(a,a')-B(a',a)=-2B(a',a)=2B(a,a')$，而 $B(a,a')=\frac12\sum\omega c^f$，故 $2B(a,a')=\sum_f\omega(a_f,a'_f)c^f$，正是 `eq:H-commutator`。特征 3 下 $-2=1$，写出来就是 $\omega(a,a')-\omega(a',a)=2\omega(a,a')$，与论文的系数一致。（c）$\frac12$ 在 $B$ 里的唯一功能就是让交换子系数干净地变成 $\omega$ 的一次，并非二次；它同时保证 `02:49-52` 的群律结合。（d）候选失败路线：把 $B$ 改成取值在 $\mathbb F^E$ ，并非 $K$，`eq:H-product` 就不再闭合，因为第二坐标之和的散度是 $\frac12\sum\omega(a_f,a'_f)\partial c^f$，这项为 0 全靠边界闭链性质；一旦换掉 $c^f$ 的构造（比如用无符号边界），散度不为 0，$H$ 塌成 $C_F\times\mathbb F^E$ 的直积，交换子落在非中心的位置，第 (c) 步的"isotropy 推 t≤a"整个失效。[推测] 这条是我从结构上排除的，论文没写。

`03:42-56` 给作用与 `Lemma 6`：

```tex
\begin{equation}\label{eq:H-edge-action}
 \left(u+(a_f)_{f\in F(e)},\;
 z+k_e+\frac12\sum_{f\in F(e)}c^f_e\omega(a_f,u_f)\right).
\end{equation}
```

```tex
\begin{lemma}\label{lem:H-automorphisms}
For every $b\in\mathbb F^V$, the action just defined is by automorphisms of
$A_b$. On its central subgroup $K$, the action adds $k_e$ to each edge
coordinate $z_e$ and leaves all face coordinates unchanged.
\end{lemma}
```

（b）"这是个作用"的依据在 `03:48-50`：限制到一条边 $e$ 上，映射 $(a,k)\mapsto\big((a_f)_{f\in F(e)},k_e\big)$ 是 $H\to P_e$ 的同态，而作用是左乘。我把同态那步写开：需 $B(a,a')$ 在 $e$ 上的值等于 $\frac12\sum_{f\in F(e)}c^f_e\omega(a_f,a'_{f})$，与 `eq:edge-product` 的 $B_e$ 一致，因为 $c^f_e=0$ 当 $f\notin F(e)$。同态成立则左乘是作用，`02:138-140` 的 $\mathsf Z_\delta$ 由群差定义，而 `(hg)^{-1}(hg')=g^{-1}g'`（`03:76`）保证它不变。（c）散度变化的表达式在 `03:62-66`：

$$ (\partial k)_v+\frac12\sum_{f\ni v}\Big(\sum_{e\ni v}\epsilon_{ve}c^f_e\Big)\omega(a_f,u_f). $$

第一项是 $\partial k=0$（$k\in K$）；第二项的内层和 $\sum_{e\ni v}\epsilon_{ve}c^f_e=(\partial c^f)_v=0$。两个零来自两个不同的恒等式，这就是为什么 $K=\ker\partial$ 与"面是闭链"两条都要用；少任何一条，$H$ 就不保 $A_b$。（d）候选失败：让 $H$ 直接作用为 $P_e$ 的左乘而不做中心扩张，即取 $H=C_F\times\mathbb F^E$，则 $k$ 不再是无散度流，构型的散度被改成 $b_v+(\partial k)_v\ne b_v$，作用越出 $A_b$。第二条：只用 $K$（$a=0$ 的子群）作群，则 `Lemma 6` 成立、$A_b$ 保持，但交换子恒为 0，`Proposition 8` 里"$U$ 各向同性"这个约束根本不存在。`00:169-171` 那句 "central flows alone do not supply this argument" 就是这个停住点。

$K$-支持的定义在 `03:84-89`：

```tex
A tuple $\alpha$ of atoms is a \emph{$K$-support} of an object
$x$ if every element of the pointwise stabilizer
\[
 K_\alpha=\{k\in K:k\cdot\alpha_i=\alpha_i\text{ for every }i\}
\]
fixes $x$. The empty tuple is permitted and has stabilizer $K$.
```

`03:93-98` 把"短支持"翻译成稀疏边集：中心元素 $k$ 固定 $e$ 上的边原子当且仅当 $k_e=0$；$K$ 中的稳定子是向量子空间，故可用 $K$ 上的线性方程描述。这段是 `Lemma 7` 存在的唯一理由。"空元组允许"这条约定在 `Corollary 9` 的 padding 里被消费（`03:269-272`）。

（a）`Lemma 7`（`03:114-119`）：

```tex
\begin{lemma}[Sparse cochains]\label{lem:sparse-cochain}
Let $\ell\in\mathbb F^E$ have nonzero curl on exactly $t$ faces of the
$L\times L\times L$ box. There is a vertex function $\varphi$ such that
$r=\ell-\partial^{\mathsf T}\varphi$ is supported on at most $2Lt$ edges.
In particular, if $t=0$, then $\ell$ is a gradient.
```

旋度与梯度的定义在 `03:100-108`：$(D\ell)(f)=\sum_ec^f_e\ell_e$；$\partial^{\mathsf T}\varphi$ 在从 $v$ 到 $w$ 的边上取值 $\varphi(w)-\varphi(v)$；加一个梯度不改旋度（$\partial c^f=0$），也不改 $K$ 上的泛函 $k\mapsto\sum_e\ell_ek_e$（因为 $\sum_e(\partial^{\mathsf T}\varphi)_ek_e=\sum_v\varphi_v(\partial k)_v=0$）。最后这个"不改泛函"是 `Proposition 8` 使用本引理时的合法性凭据。

（b）三步前缀和我要补中间步骤。第一步 $\varphi_1(i,j,k)=\sum_{a=0}^{i-1}\ell_1(a,j,k)$，其梯度在方向 1 的边上取 $\varphi_1(i+1,j,k)-\varphi_1(i,j,k)=\ell_1(i,j,k)$，所以 $r^{(1)}_1=0$。方向 2、3 的坐标被改动了，但 $12$、$13$ 型面的旋度被保留成"$r^{(1)}_2$ 沿 $i$ 方向的差分"，即 `03:131-135` 那两行。第二步选 $i_0$：$L$ 个 $i=$const 切片划分 $23$ 型面（每个 $23$ 面恰在一个 $i$-切片里），鸽巢给出某片有 $t_0\le t_{23}/L$ 个非零 $23$ 旋度。$\varphi_2(i,j,k)=\sum_{b=0}^{j-1}r^{(1)}_2(i_0,b,k)$ 与 $i$ 无关，故它的梯度在方向 1 的边上取 0，于是 $r^{(2)}_1=0$ 仍然成立；在方向 2 的边上（沿 $j$）取 $r^{(1)}_2(i_0,j,k)$，故 $r^{(2)}_2(i_0,j,k)=0$。第三步 $\varphi_3(i,j,k)=\sum_{c=0}^{k-1}r^{(2)}_3(i_0,0,c)$ 与 $i,j$ 无关，故 $r_1=r_2(i_0,j,k)=0$ 保持，且 $r_3(i_0,0,k)=0$。在 $i=i_0$ 片上 $23$ 旋度恒等式 `03:157-159` 成为 $r_3(i_0,j+1,k)-r_3(i_0,j,k)=(D\ell)_{23}(i_0,j,k)$，而 $j=0$ 处 $r_3=0$，所以沿一条 $j$-线，$r_3$ 只在遇到非零旋度之后才可能非零；一个非零旋度最多让 $L$ 个位置非零（它之后的整条尾段，尾段长 $\le L$），故该片 $r_3$ 支撑 $\le Lt_0$，方向 2 坐标全零，此片支撑 $\le Lt_0$。把该片沿 $i$ 常值延拓到 $L$ 片：每片 $\le Lt_0$，共 $\le L^2t_0\le Lt_{23}$。这里我要停一下核对：`03:164-165` 写的是"slice 含至多 $Lt_0$ 个非零边坐标"，常值延拓乘 $L$ 得 $L^2t_0$；而我上面说"每片 $\le Lt_0$"，其实常值延拓后非零值只出现在 $i_0$ 那一列的复制上，$L$ 个片各 $\le Lt_0$，总 $\le L^2t_0$，与论文一致。第三步的差分：$r_2(i,j,k)-r_2(i_0,j,k)$ 是 $i_0$ 与 $i$ 之间那些 $12$ 旋度的带符号和，一个非零 $12$ 旋度位于某条 $(j,k)$ 线的两个相邻 $i$ 之间，最多出现在 $L$ 个这样的和里（它下面所有 $i$ 的累加里都出现一次？），论文给"至多 $Lt_{12}$ 个方向 2 坐标与其复制片值不同"。我按论文口径接受这个计数并核对量级：$t_{12}$ 个非零面，每个面影响沿 $i$ 方向的一整列（$L$ 条边），故 $\le Lt_{12}$ 条边被改动。方向 3 同理 $\le Lt_{13}$。合起来 $|\mathrm{supp}\,r|\le L^2t_0+L(t_{12}+t_{13})\le Lt_{23}+Lt_{12}+Lt_{13}=Lt\le2Lt$。（c）$2Lt$ 里的 2 是纯粹的宽松：真实界是 $Lt$，写成 $2Lt$ 让 $t=0$ 时"$\ell$ 是梯度"这条特例与主句同一个量词形状（支撑 $\le 0$）。$t=0$ 的推论在盒子上是对的（盒子可缩，旋度零即梯度），这一点在 $L\ge2$ 且区域是整块 box 时成立；若换成挖洞的区域就不成立，本文不需要。$L$ 这个一次因子来自"$t$ 个面每个最多拖出一条长度 $L$ 的线"，所以 $2Lt$ 是"$t$ 的线性"乘"$L$ 的一次"，两处都不能再优化成 $O(t)$：一条线本来就有 $L$ 条边。（d）候选失败路线：用 Hodge 分解直接取 $r$ 为调和部分加正交补，在一般复形上会给出支撑 $\le$（面上非零旋度的邻域并），最坏是 $O(L^3)$ 级别，并非 $O(Lt)$，因为一个面的邻域是常数个边、$t$ 个面的邻域并是 $O(t)$；听起来比 $Lt$ 更好？[推测] 但那条路要先把 $r$ 拉回 $\ell-\partial^{\mathsf T}\varphi$ 这个特定形状（即要求减掉的是**梯度**，以保证 $K$ 上的泛函不变），Hodge 分解给出的修正项不保证是梯度；论文这个三步前缀和构造恰好让所有修正都是显式梯度。第二条候选：只用二维切片论证、不做 $i_0$ 的鸽巢，$23$ 部分的界会退化为 $L^2t_{23}$，最后 $|\mathrm{supp}\,r|$ 变成 $O(L^2t)$，代进 `Proposition 8` 后支持长度多出因子 $L$，第 8 节的宽度 $O(L^{3/2}\mathrm{polylog})$ 会变 $O(L^{5/2}\mathrm{polylog})$，越过 $M=L^{7/4}$ 而使得整个 homogeneity 假设 `eq:homogeneity-width` 永远不成立。这是我最想记下的一处：那个 $i_0$ 鸽巢省下的一个 $L$，是 7/4 这个指标准许范围内的关键。

（a）`Proposition 8`（`03:183-191`）：

```tex
\begin{proposition}[Small-orbit support bound]\label{prop:small-orbit-support}
Let $N=|A_b|$, let $q\ge0$, and let $x$ be a hereditarily finite object
over the atoms of $A_b$. If its $H$-orbit has size at most $N^q$, then
$x$ has a $K$-support consisting of at most
\[
 2L(q\log_3 N)^2
\]
edge atoms. The support may be empty.
\end{proposition}
```

（b）证明的链条我逐环写：$S=\operatorname{Stab}_H(x)$，$U$ 是 $S$ 在投影 $H\to C_F$ 下的像，$K_0=S\cap K$。由正合序列 $1\to K_0\to S\to U\to1$ 得 $|S|=|U||K_0|$，于是 $[H:S]=[C_F:U][K:K_0]=3^{a+d}$，配合 $|\mathrm{orb}(x)|=[H:S]\le N^q$ 得 `eq:stabilizer-codimension`：$a+d=\log_3[H:S]\le q\log_3N=:h$。$W=\operatorname{Ann}(K_0)\le K^*$，$\dim W=d$。每个 $\lambda\in W$ 用某个 $\ell\in\mathbb F^E$ 表示（`03:205-208`：$K^\perp=\operatorname{im}\partial^{\mathsf T}$，两边维数都是 $\operatorname{rank}\partial$，故包含即相等）。固定 $\lambda,\ell$，对 $u,u'\in U$ 取提升 $h,h'\in S$，则 $[h,h']\in S\cap K=K_0$，$\lambda$ 在其上为 0；由 `eq:H-commutator` 交换子的 $K$-分量是 $\sum_f\omega(u_f,u'_f)c^f$，代入 $\lambda$（用 $\ell$ 表示）得 $\sum_f(D\ell)(f)\omega(u_f,u'_f)=0$。于是 $U$ 关于 $C_F$ 上分块交错形（第 $f$ 块系数 $(D\ell)(f)\omega$）各向同性。设非零系数面数 $t$，形秩 $=2t$，因为每个非零块的 $\omega$ 秩 2 且各块占据 $C_F$ 的**不同面坐标**；`03:219-220` 特别强调这不需要 $\{c^f\}$ 在 $K$ 中线性无关，秩是在 $C_F$ 上算的，而 $c^f$ 只出现在 $K$-分量里。标准维数论证（`03:223-230`，引 `cameron2000classical`）：$n$ 维空间上秩 $2t$ 的交错形，其各向同性子空间余维 $\ge t$；商掉根子空间（维 $n-2t$）后像落在自己的正交补里，故像维 $\le t$，原子空间维 $\le(n-2t)+t=n-t$。这里 $n=\dim C_F$，各向同性子空间是 $U$，$a=\operatorname{codim}U$，故 $a\ge t$。代回 `Lemma 7`：每个 $\lambda$ 有支撑 $\le 2La$ 的共链代表。取 $W$ 的一组基（$d$ 个），支撑并 $T$，$|T|\le2Lad\le2Lh^2$。$k\in K$ 若在 $T$ 上为 0 则杀掉 $W$ 的每个基元，故杀 $W$，对偶给出 $k\in K_0$，于是 $k$ 固定 $x$。每条 $e\in T$ 取一个边原子，固定它就等价于 $k_e=0$。（c）这里我要把 $2Lad\le 2Lh^2$ 的松弛度算清楚：$a+d=h$ 时 $ad\le h^2/4$，所以真实界是 $Lh^2/2$，论文写 $2Lh^2$，宽松了 4 倍。为什么留这么多余量：$h=q\log_3N$ 本身是上界，并非等式，$W$ 的基选取任意，两处都各吃一点常数；论文显然不想让任何常数成为瓶颈。$q\ge0$ 可以为 0，此时 $h=0$、$T=\varnothing$、空元组是支持（`03:89` 那条约定在此被消费）。$d=0$ 时基空、$T$ 空，`03:238` 明写"This includes $d=0$"。（d）候选失败路线：其一，把轨道大小界换成 $|\mathrm{orb}(x)|\le N^q$ 里的 $N$ 换成 $|H|$，得到 $a+d\le q\log_3|H|=O(q\log|F|)$，形式上更"群论"，但 `Corollary 9` 需要的是与 $N$（结构大小）挂钩的量，因为程序的输出真值只能以 $N$ 的多项式来表达规模；换成 $|H|$ 后 $s$ 里的 $\log N$ 变成 $\log L$，差别只在对数的常数，勉强能救。真正的停住点在第二处：$|H|=3^{2|F|+|E|-rank\partial}$，而 $\log_3|H|$ 与 $\log_3 N$ 都是 $\Theta(\log L)$ 级别（$|F|,|E|=\Theta(L^3)$ 时 $\log|H|=\Theta(\log L)$？不，$|F|=\Theta(L^2)$，$\log_3|H|=\Theta(\log L)$，$\log_3N=\Theta(\log L)$。两者同阶。所以我这条"失败"其实是等价的，应当划掉，写成我一度以为它不同阶。[推测] 论文没讨论这个替换。其二，若跳过 `Lemma 7` 而直接用 $W$ 的原始代表 $\ell$（可能满支撑 $|E|$），$|T|\le d|E|=O(L^3\cdot h)$，$s$ 变成 $O(L^3h)$，代进 `eq:homogeneity-width` 得 $7r\sim L^3$，$M=L^{7/4}$ 完全不够，比较直接失效。稀疏化是**不可替代**的一步。

`03:247-248` 是这一节我最看重的一句：

```tex
The argument used $x$ only through its stabilizer subgroup $S\le H$.
Its rank plays no role in the support bound.
```

`Corollary 9`（`03:254-265`）把它推到整个 membership-transitive 族：

```tex
\begin{corollary}\label{cor:transitive-support}
Let $\mathcal X$ be an $H$-invariant, membership-transitive finite family
of hereditarily finite objects over $A_b$, and suppose
$|\mathcal X|\le N^q$ for some fixed $q\ge0$. Every object in
$\mathcal X$, including every recursive constituent of each of its
members, has a $K$-support of length at most $2L(q\log_3N)^2$.
All these supports can be padded to the common positive length
\begin{equation}\label{eq:support-length}
 s=\left\lceil2L(q\log_3N+1)^2\right\rceil+1
   =O_q\bigl(L(1+\log L)^2\bigr).
\end{equation}
\end{corollary}
```

（b）"$\mathcal X$ 有限、$H$-不变"给出每个成员的轨道 $\le|\mathcal X|\le N^q$，`Proposition 8` 逐个可用；"membership-transitive"把递归成员一起装进来，这是把"一个对象"升级成"一棵对象树"的唯一手段，也是我后面第 10 节能用它圈住整段计算的原因。（c）$+1$ 与 $+1$ 的两处（$(q\log_3N+1)^2$ 里的 $+1$、尾的 $+1$）分别服务两件事：前者保证 $q=0$ 时仍有 $(1)^2$ ，并非 0，让 padding 的下限为正；后者保证 $s\ge1$，即支持元组长度是**正**整数（`Theorem 14` 要 $s$ 为正整数，`05:30`）。padding 的合法性在 `03:269-272`：往支持里加原子只会缩小逐点稳定子，故仍是支持；$L\ge2$ 保证有原子可加。（d）候选失败：若族只是 $H$-不变而**不** membership-transitive，递归成员的轨道可能远大于族的轨道？不，递归成员的轨道仍 $\le N^q$（它自己的轨道是 $H$-轨道，而 $x$ 的成员 $y\in x$ 满足 $h\cdot y\in h\cdot x$，所以 $y$ 的轨道被 $x$ 的轨道的成员关系控制，大小 $\le|\mathrm{orb}(x)|$）。[推测] 真正的理由不是轨道大小，是**域 $D_i$ 的定义**要求"x 及其传递闭包中每个对象都有 $\le s$ 的支持"（`05:40-42`），transitivity 是让整棵树落进同一个族的语法条件。这条我记在错口清单里。

## 8 原子层面的计数等价与齐性：`Proposition 11`、`Proposition 13`

`04:4-9` 声明本节两件事：

```tex
We now prove two facts
about this action.  First, a bounded number of variables cannot distinguish
the two charge assignments.  Second, within either structure, equality of
sufficiently wide counting types determines a \(K\)-orbit.  The second fact
will let us transport the supports of hereditarily finite sets.
```

分析用展开 $\bar A_b$ 在 `04:16-41`：类由 $(e,u)$ 与 $(v,(u_f)_{f\in F(v)})$ 指标；"an edge class leaves only $z$ unspecified, and a configuration class leaves all incident $z$-coordinates unspecified"；类大小分别 $3$ 与 $3^{d(v)-1}$；固定一个类标签的线性序（对所有电荷赋值同一个），导出原子上预序 $\preceq$；再加三个关系

```tex
 \mathsf D_\delta((e,u,z),(e',u',z'))
 \quad\Longleftrightarrow\quad e=e'\ \text{and}\ z'-z=\delta,
```

而 $04:38-41$ 是要害：

```tex
Every element of \(K\) preserves the expansion.  The larger group \(H\)
need not preserve it.  Crucially, the preorder and the relations
\(\mathsf D_\delta\) are tools for this proof and are not part of the input
to a choiceless program.
```

我读这段时卡了很久：为什么只给 $K$ 保持就够了。答案是分工：程序看到的是 $A_b$（无展开），我们要证的是"$C^M$ 句子看不出 $b^0$ 与 $b^1$"，这个"看不出"是在展开结构上证的；展开只放大公式语言，若在放大的语言里都看不出，在原语言里更看不出。而 $K$ 保持展开正是 `Proposition 13` 那句"等类型 $\Rightarrow$ 同 $K$-轨道"的前提（轨道要在放大的语言里仍可分辨，否则齐性结论会破坏类型相等）。$H$ 不保持展开没关系，因为 `Proposition 8` 已经用完 $H$ 了，两条时间线分开。$C^h$ 的定义在 `04:43-48`：一等逻辑带等词、普通量词与**精确计数**量词 $\exists^{=a}$，至多 $h$ 个变元名；$a$ 可为任意非负整数；公式长度与这些整数常数对 $L$ 无需一致。最后这句"Formula length and these integer constants need not be uniform in $L$"给了 `Proposition 13` 证明里 $\theta_h$ 用 $h$ 这个类前原子数作常数、以及 `04:316-318`"the numerical constants and its length may depend on the chosen assignments"的许可。变元名数才是受 $M$ 约束的量。

（a）`Lemma 10`（`04:60-67`）：

```tex
\begin{lemma}[Boundary of a box subset]
\label{lem:box-boundary}
Set \(c=1-2^{-1/3}>0\).  If \(\varnothing\ne R\subseteq V\) and
\(|R|\le L^3/2\), then
\[
 |\delta_G R|\ge c|R|^{2/3}.
\]
\end{lemma}
```

（b）Loomis-Whitney 那段我补中间步：$a_{ij},b_{ik},d_{jk}$ 是三个坐标对投影的示性函数，$|R|\le\sum_{i,j,k}a_{ij}b_{ik}d_{jk}$（每个 $(i,j,k)\in R$ 在三个投影里都有对应指标，故被和式覆盖至少一次）。对 $i,j$ 固定、$k$ 求和：$\sum_k b_{ik}d_{jk}\le(\sum_k b_{ik}^2)^{1/2}(\sum_k d_{jk}^2)^{1/2}=(L^{1/2})(L^{1/2})$? 更准的写法是 Cauchy-Schwarz 给 $\sum_{i,j}(\sum_k b_{ik}d_{jk})^2$……论文 `04:71-76` 的中间项是 $A^{1/2}\big(\sum_{i,j}(\sum_k b_{ik}d_{jk})^2\big)^{1/2}$，这一步是对 $i,j$ 的外层 Cauchy-Schwarz（把 $a_{ij}$ 看作一个因子，$1$ 看作另一个因子，得 $(\sum a_{ij})^{1/2}=A^{1/2}$）；再对内部平方和使用 Cauchy-Schwarz：$(\sum_k b_{ik}d_{jk})^2\le(\sum_k b_{ik}^2)(\sum_k d_{jk}^2)$，对 $i,j$ 求和，$\sum_{i,j}b_{ik}^2 d$……得 $\le BD$，故整体 $\le(ABD)^{1/2}$。三个投影各 $\le L^2$，所以 $ABD\le|A||B||D|$；由 $|R|^2\le ABD\le(\max)^{ }$ 得至少一个投影 $\ge|R|^{2/3}$。取该投影（设为 $ij$-面方向的投影，$A$ 个），它指标 $A$ 条"平行于第三个坐标轴的坐标线"与 $R$ 相交。每条线是长度 $L$ 的路。全落在 $R$ 内的线最多 $|R|/L$ 条（每条至少 $L$ 个点，互不相交）。其余至少 $A-|R|/L$ 条线同时含 $R$ 与 $R^c$ 的点，故各贡献至少一条边界边，不同线给出不同边：$|\delta_GR|\ge A-|R|/L\ge|R|^{2/3}-|R|/L$。而 $|R|\le L^3/2\iff |R|^{1/3}\le 2^{-1/3}L\iff |R|/L\le2^{-1/3}|R|^{2/3}$，故 $|\delta_GR|\ge(1-2^{-1/3})|R|^{2/3}$。（c）$c=1-2^{-1/3}\approx0.2063$。$2/3$ 这个指数是三维等周/投影不等式的直接输出（$|R|^{2/3}$ 是三维体积对应的二维面积标度），换维度就换指数：$L\times L$ 方格给 $|R|^{1/2}$。$L^3/2$ 这个阈值唯一用途是把 $|R|/L$ 压成 $2^{-1/3}|R|^{2/3}$；换成任何 $\theta L^3$ 都会把 $c$ 改成 $1-\theta^{1/3}$。（d）候选失败：用连续等周不等式的离散版本（edge-isoperimetric inequality on the grid）也能给 $|\delta R|\ge c'|R|^{2/3}$，且常数更好，但证明要重排不等式与压缩法，比 Loomis-Whitney 长；论文 `04:56-58` 说"we include its short proof"，取舍是篇幅。第二条：若直接在三维里用 $|R|^{2/3}$ 而没有 $|R|\le L^3/2$ 的限制，$|R|/L$ 与 $|R|^{2/3}$ 的大小关系反号（当 $|R|>L^3/2$ 时 $|R|/L>L^{2}\cdot2^{-1/3}$……），界会翻向，所以 `Lemma 12` 后半"存在大小 $\le L^3/2$ 的失败分量"这条 totality 论证是必需的。

$M=\lfloor L^{7/4}\rfloor$（`04:92-94`）出场，随后 `04:95-105` 的巨人分量断言与 `eq:small-components`：

```tex
 \sum_R |R|
 \le c^{-3/2}\sum_R|\delta_G R|^{3/2}
 \le c^{-3/2}(2|T|)^{3/2}
 \le c^{-3/2}(12M)^{3/2}=o(L^3).
```

补一步：由 `Lemma 10`，$|R|\le(c^{-1}|\delta_GR|)^{3/2}=c^{-3/2}|\delta_GR|^{3/2}$。第二号用 $\sum_R|\delta_GR|\le2|T|$（每条被删的边至多是两个分量的边界）与 $\sum a_i^{3/2}\le(\sum a_i)^{3/2}$。第三号 $|T|\le6M$（下面 `Proposition 11` 的证明给理由）。量级检查：$(12L^{7/4})^{3/2}=12^{3/2}L^{21/8}$，$21/8=2.625<3$，故 $o(L^3)$。**7/4 的第一次承重：$3\alpha/2<3\iff\alpha<2$。** `04:108-113` 补两条：每个分量都 $\le L^3/2$ 会导致左边 $=L^3$，矛盾；两个分量不能都过半，故巨人唯一；删更多边时新巨人含于旧巨人。这最后一条单调性在 `Proposition 11` 的"删一个位置后旧巨人含于新巨人"里被反向使用，注意方向别读反。

（a）`Proposition 11`（`04:124-129`）：

```tex
\begin{proposition}[Base counting equivalence]
\label{prop:base-equivalence}
For all sufficiently large \(L\), the expansions
\(\bar A_{b^0}\) and \(\bar A_{b^1}\), where
\(b^0=0\) and \(b^1=\mathbf1_{v_*}\), satisfy the same \(C^M\) sentences.
\end{proposition}
```

（b）`04:130-189` 的证明是 Immerman-Lander 计数博弈 + CFI 搬电荷，但 `04:121-122` 声明"we construct the required bijections and prove formula preservation directly; no game characterization is needed as a premise"，所以 `Proposition 11` 的依赖只是构造。逐环：相容赋值 = 存在 $t\in\mathbb F_3^E$ 与巨人里的 $w$ 使 `eq:defect-flow` $\partial t=b^1-b^0-\mathbf1_w=\mathbf1_{v_*}-\mathbf1_w$ 成立，且每个被赋值原子与其配对原子只差所在边上 $z$ 加 $t_e$。空赋值用 $t=0,w=v_*$ 相容。右端总和 $1-1=0$，$\partial$ 的像恰是零和向量（`Lemma 12` 证明里给的树论证），所以解存在。相容赋值保住每个原子式：同一边上共同加 $t_e$ 保住原始差 $z'-z$（从而保住 $\mathsf D_\delta$）与校正差 $\tfrac12\sum c^f_e\omega$（$u$ 未变，故辛项不变，$\mathsf Z_\delta$ 保住），保住"某边状态是否是某构型的指定邻居"，保住块关系、预序、对角谓词与等词。删一个位置仍相容（触及边集缩小，旧巨人含于新巨人）。剩 $\le M-1$ 个位置时构造**全论域上的一个双射**：按整块（边块与顶点构型块）划分论域；块 $J$ 配 $T_J=T\cup\{$该边或该顶点的星$\}$，$|T_J|\le6M$（$6M$ 来自 $|T|\le6M$ 再加一个至多 6 条边的星，论文用同一个 $6M$ 记号宽松吸收）。巨人里选 $w_J$；$w,w_J$ 同在 $G\setminus T$ 的巨人里，用一条路径上的带符号向量 $p_J$（支撑在 $T$ 外）满足 $\partial p_J=\mathbf1_w-\mathbf1_{w_J}$；令 $t_J=t+p_J$，则 $t_J$ 在旧触及边上与 $t$ 一致，且 $\partial t_J=\mathbf1_{v_*}-\mathbf1_{w_J}$。$J$ 是顶点 $v$ 的构型块时，删星使 $v$ 孤立，故 $v\ne w_J$，于是 $(\partial t_J)_v=b^1_v-b^0_v$，正是"用 $t_J$ 平移把 $A_{b^0}$ 的构型双射到 $A_{b^1}$ 的构型"所需条件；面坐标不受影响。把这些块双射并起来，就是扩大相容赋值的见证 $t_J,w_J$。公式归纳：量词处先丢掉该变元的旧赋值（剩 $\le M-1$），构造的双射把所有让体式同真的扩张配起来，故保住普通量词与所有精确计数量词，含计数 0。

这里 $6M$ 的账要重算一遍：至多 $M$ 个被赋值位置，边原子触 1 条边、构型原子触 $d(v)\le6$ 条边，故 $|T|\le6M$。`04:132-133` 正是这句。（c）为什么"每个块用**不同**的平移"是允许的：论域双射不必与 $t$ 全局一致，只要在**保留位置**上与 $t$ 一致，而一致性由 $t_J|_{T}=t|_T$（即 $p_J$ 支撑在 $T$ 外）保证。为什么 $w_J$ 要在 $G\setminus T_J$ 的巨人里，并非 $G\setminus T$ 的巨人里：因为 $t_J$ 要在 $T_J$ 外的边上无约束地提供 $\mathbf1_{v_*}-\mathbf1_{w_J}$ 的散度，若 $w_J$ 被 $T_J$ 的删除切断，路径 $p_J$ 就不存在。（d）候选失败路线：其一，全局用一个 $t$（$\partial t=\mathbf1_{v_*}-\mathbf1_{w}$）而不分块。那要求 $w$ 落在每个块 $J$ 的 $G\setminus T_J$ 巨人里；当 $J$ 是某顶点 $v$ 的构型块且 $v=w$ 时，$(\partial t)_v=b^1_v-b^0_v-1$，平移会把该块构型的散度改成 $-1$，映射不到对面结构，双射失败。分块 + 每块自带 $w_J$ 正是为了让"被删星孤立的那个 $v$"永远不等于 $w_J$。其二，把 $p_J$ 换成任意满足 $\partial p_J=\mathbf1_w-\mathbf1_{w_J}$ 的向量而不要求支撑在 $T$ 外：那会改动保留位置的 $z$，破坏已建立的同真性。论文 `04:164-165` 那句 supported outside $T$ 是承重的。

`04:194-197` 为 `Lemma 12` 铺垫：两个元组现在在**同一个**展开里，规定的偏移要扩成无散度向量，唯一障碍是某个剩余分量上净流量非零。

（a）`Lemma 12`（`04:199-214`）：

```tex
\begin{lemma}[Extending a partial flow]
\label{lem:partial-flow}
Let \(T\subseteq E\) and \(\sigma\in\mathbb F_3^T\)。  There is
\(k\in\ker\partial\) with \(k|_T=\sigma\) if and only if, for every component
\(U\) of \(G\setminus T\),
\begin{equation}\label{eq:component-balance}
 R_U:=\sum_{v\in U}\sum_{\substack{e\in T\\e\ni v}}
                      \epsilon_{ve}\sigma_e=0.
\end{equation}
If an extension does not exist, there is a nonempty failing component
with
\[
 |U|\le L^3/2,\qquad |U|\le(|T|/c)^{3/2}.
\]
\end{lemma}
```

（b）充分性用生成树免掉秩计算：$\sigma$ 在 $T$ 外补 0，要在 $E\setminus T$ 上造散度 $-\partial\sigma$ 的向量；连图上 $\partial$ 的像恰是零和向量集；生成树上把非树边设 0、从叶往根回代，叶处散度唯一决定其树边值，零和条件保证根处自动满足。逐分量做，孤立顶点当一元树。$R_U$ 正是"$-\partial\sigma$ 在 $U$ 上的总和应为 0"写开的形式。必要性：$k$ 无散度 $\Rightarrow$ 每个分量上 $\sum_{v\in U}(\partial k)_v=0$，而 $(\partial k)_v$ 在 $U$ 上求和只剩跨界边的贡献。所有 $R_U$ 之和为 0（每条 $T$ 边的两个 $\pm$ 端点抵消），故若失败则至少两个分量失败，其中一个 $\le L^3/2$。其边界 $\delta_GU\subseteq T$，`Lemma 10` 给 $|T|\ge|\delta_GU|\ge c|U|^{2/3}$，即 $|U|\le(|T|/c)^{3/2}$。（c）$(|T|/c)^{3/2}$ 的 $3/2$ 是 $2/3$ 的倒数，与 `eq:small-components` 的 $3/2$ 同源。（d）候选失败：若 $G$ 有割点或分量很多，"$\partial$ 的像=零和向量"在**每个连通分量**上单独成立，所以连通性假设已由"对每个分量单独做"覆盖，我不需要额外条件；真正会断的是把 $T$ 换成**顶点集**删除（那时边界的计数与 $R_U$ 的定义都要重做）。[推测]

（a）`Proposition 13`（`04:232-242`），本节最难的一条：

```tex
\begin{proposition}[Quantitative homogeneity]
\label{prop:base-homogeneity}
Let \(r\ge1\), and suppose
\begin{equation}
\label{eq:homogeneity-width}
 7r+7(6r/c)^{3/2}+1\le M.
\end{equation}
If two \(r\)-tuples in the same \(\bar A_b\) have equal \(C^M\)-types, then
some \(k\in K\) maps the first tuple to the second.  The corresponding
statement for empty tuples holds without any width hypothesis.
\end{proposition}
```

（b）方向一（类型相等 $\Rightarrow$ 分量一致）：每个预序类用两个变元名可定义，$\theta_h(x):=\exists^{=h}y\,(y\preceq x\land\neg(x\preceq y))$，$h$ 是严格更早类里的原子数；类非空故不同类给不同 $h$。于是对应坐标同块、同面坐标模式。触及边 $|T|\le6r$（一个位置最多 6 条边）。出现（occurrence）的定义在 `04:255-257`：$e\in T$ 上的一个状态出现，或者是元组坐标里的边原子，或者是元组里某个构型在 $e$ 上的状态；后者是满足 $\mathsf I(a_i,y)$ 与其指定边类谓词的唯一 $y$。任两个出现之间的原始差用 $\mathsf D_\delta$ 测。名字用量：$r$ 个元组名 + 2 个邻居名 + 1 个在类计数谓词里复用的名，即 $r+3$，`eq:homogeneity-width` 特别许可它（$7r+\ldots+1\ge r+3$ 对 $r\ge1$ 成立）。类型相等使每个对应出现对同原始差，故每边有良定义的 $\sigma_e$。

方向二（构造判别公式）：设 $\sigma$ 不可扩到 $K$，取 `Lemma 12` 的失败分量 $U$，$|U|\le(6r/c)^{3/2}$。对每个 $v\in U$ 在第一个赋值里任取构型 $g_v^0$，$h_{v,e}^0$ 其在边 $e$ 上的邻居（这些选定构型在内部边的两端**可以不一致**，这是刻意的）。边界边 $e\in\delta_GU\subseteq T$ 上取一个出现 $o_e^0$。公式存在量词 $g_v,h_{v,e}$（以及当出现来自元组构型时的邻居名 $y_e$），合取三件事（`04:289-299`）：(i) $g_v,h_{v,e}$ 在选定原子的类里且 $\mathsf I(g_v,h_{v,e})$；(ii) 内部边上两个 $h_{v,e}$ 的原始差等于 $h^0_{v,e}$ 两者的原始差，用 $\mathsf D_{z(h^0_{w,e})-z(h^0_{v,e})}(h_{v,e},h_{w,e})$；(iii) 边界边上 $h_{v,e}$ 与选定出现的原始差等于原差，用 $\mathsf D_{z(h^0_{v,e})-z(o^0_e)}(o_e,h_{v,e})$。$T$ 中两端都在 $U$ 内的边当内部边处理（`04:312-313`）。$U$ 内选定构型的散度证据：`04:280-282` 说公式保住原始差，故新见证在内部边两端有相同的标量变化，对 $U$ 求散度和时相消。$g_v^0$ 与 $g_v$ 都是 $v$ 处构型，散度都是 $b_v$，故 $\sum_{e\ni v}\epsilon_{ve}d_{v,e}=0$；内部边给两端变化相等，边界边给 $d_{v,e}=\sigma_e$；对 $v\in U$ 求和，内部贡献两两相消（注意"两端都在 $U$"的 $T$ 边也在这里相消），剩下 $\sum_{v\in U}\sum_{e\in\delta_GU}\epsilon_{ve}d_{v,e}$ 加上 $T$ 内部边的 0，等于 $R_U$ 的相反数？论文 `04:325-326` 直接写"gives $R_U=0$，contrary to the choice of $U$"。（c）为什么必须 $g_v^0$ 在内部边两端不一致也无妨：不一致时 $h^0_{v,e}\ne h^0_{w,e}$，公式 (ii) 保住它们的差 $z(h^0_{w,e})-z(h^0_{v,e})$，于是新见证的 $d_{v,e}=d_{w,e}$ 仍然成立（因为 $z(h_{w,e})-z(h_{v,e})=z(h^0_{w,e})-z(h^0_{v,e})$ 且 $h^0_{w,e}=h^0_{v,e}+\Delta$，$d$ 之差为 0）。这条不一致性是设计上的自由，不是漏洞；若强行要求选定构型跨边相容，就得先证明这样的相容选取存在，而 $b_v$ 全为 0 时存在、$b^1$ 时未必。$7|U|$ 的来源：$|U|$ 个构型名 + 至多 $6|U|$ 个内部状态名 + $|\delta_GU|\le6r$ 个边界出现名，$6|U|+|U|=7|U|$。总名数 $r+7|U|+6r+1$：注意 $|U|$ 前面论文写成 $7|U|$（`04:333`），于是 $r+7|U|+6r+1\le7r+7(6r/c)^{3/2}+1$。这里 $r+6r=7r$ 与 $7|U|\le7(6r/c)^{3/2}$ 两处合起来正好是 `eq:homogeneity-width` 左端。（d）候选失败路线：其一，不用展开、直接在 $A_b$ 里写判别公式。$\mathsf D_\delta$ 是"原始差"，而 $A_b$ 只有"校正差"$\mathsf Z_\delta$；两者相差一个辛项 $\frac12\sum c^f_e\omega(u_f,u'_f)$。要求 $u$ 相同才能等同，而 $u$ 相同的条件需要预序类谓词 $\preceq$。所以展开里的 $\preceq$ 与 $\mathsf D_\delta$ 二者共同扮演"把校正差拆成原始差"的角色，去掉任一个，`04:260-262` 那段"任两个出现的原始差可测"就不能做。其二，把 $U$ 换成任意分量，并非**失败**分量：判别式在非失败分量上真值相同，得不出矛盾。其三，把名数估算里的 $6|U|$ 误算成 $|U|$（以为每个顶点一个状态名），`eq:homogeneity-width` 左端会小 $6(6r/c)^{3/2}$，从而允许更大的 $r$；但公式确实要为每条入边单独命名一个状态，$6|U|$ 不能降。

`04:340-358` 是本节收口，也是全文常数选择的总账：

```tex
For the support scale used below, fix \(q,m\) first and put
\[
 s=\left\lceil2L(q\log_3 N+1)^2\right\rceil+1,
 \qquad N=\Theta(L^3).
\]
Uniformly for \(1\le r\le\max\{2,m\}s\), the left side of
\eqref{eq:homogeneity-width} is
\[
 O_{q,m}\bigl(L^{3/2}(1+\log L)^3\bigr)=o(L^{7/4}).
\]
Consequently Proposition~\ref{prop:base-homogeneity} applies throughout
that range when \(L\) is sufficiently large. The same choice of \(L\)
ensures \(\max\{4,m+1\}s\le M\), the separate width requirement for
extending atom types in the hereditary-set comparison below.
The exponent \(7/4\) simultaneously ensures \(M^{3/2}=o(L^3)\) for the
giant-component estimate and \(L^{3/2}(1+\log L)^3=o(M)\) for homogeneity
at the support scale. Any fixed exponent strictly between
\(3/2\) and \(2\) would meet these asymptotic requirements.
All these conclusions hold for fixed \(q,m\), chosen before \(L\).
```

我把 $7/4$ 的三重承重算了一遍，全对上：巨人分量要 $M^{3/2}=o(L^3)\iff\frac{3\alpha}{2}<3\iff\alpha<2$；齐性要 $s^{3/2}=O(L^{3/2}(\log L)^3)=o(L^\alpha)\iff\alpha>\frac32$；`Theorem 14` 的两个假设要 $\max\{4,m+1\}s\le M$，即 $\alpha>1$（自动）。于是 $\alpha\in(3/2,2)$，$7/4$ 是这个区间的中心（几何上 $1.75$）。这段是全文我最喜欢的地方：它把一个看起来神秘的分数还原成三个不等式的交集。**顺序铁律**："fix $q,m$ first"、"chosen before $L$"（`04:340`、`04:358`）。$m$ 是程序的变元名常数、$q$ 是轨道指数；一旦 $m$ 依赖 $L$，$s$ 与 $M$ 的关系就失去意义，因为 $M$ 的定义里没有 $m$。我最初想反过来取 $L$ 再取程序，那是错的：程序必须固定，$L$ 是渐近变量，$q,m$ 都由程序给。

## 9 从原子类型到 hereditarily finite 集：`Theorem 14` 与其三条引理

`05:4-16` 交代这一节的职责与血统：

```tex
A
choiceless computation also constructs sets of atoms, sets of such sets, and
objects of unbounded finite rank.  We now show how small supports let us
transfer bounded-variable counting formulas on a domain containing all these
objects.  The domain itself will be countably infinite; every object in it
is nevertheless hereditarily finite.  The counting argument below respects
this distinction.
```

方法血统归给 BGS `Sections~8--9`（molecule/form）与 DRR `Section~8`（计数化），`05:14-16` 声明"我们给出完整的量化论证，含被表示值的精确计数"，即这节的**新内容**只在定量。

（a）`Theorem 14`（`05:26-46`）：

```tex
\begin{theorem}[Transfer through small supports]
\label{thm:hf-transfer}
Let $A_0,A_1$ be nonempty finite structures in the same binary relational
vocabulary, and let $K_i\leq\operatorname{Aut}(A_i)$ for $i\in\{0,1\}$.
Let $s,m,M$ be positive integers satisfying
\[
 \max\{4,m+1\}s\leq M.
\]
Assume the following two properties.
\begin{enumerate}
\item $A_0$ and $A_1$ satisfy the same $C^M$ sentences.
\item In each $A_i$, any two tuples of length at most
      $\max\{2,m\}s$ with the same $C^M$ type lie in the same $K_i$ orbit.
\end{enumerate}
For $i\in\{0,1\}$, let $D_i$ consist of the objects $x$ in
$\mathrm{HF}(A_i)$ such that $x$ and every object in its transitive closure
have a $K_i$-support of length at most $s$.  Equip $D_i$ with membership,
an atom predicate, and the relations of $A_i$, interpreted as false on
arguments containing a non-atom.  Then $D_0$ and $D_1$ satisfy the same
$C^m$ sentences.
\end{theorem}
```

（b）$\max\{4,m+1\}s\le M$ 这一条唯一条件是从后面两处反解出来的：`05:394-397` 明写"等式迁移要 $4s\le M$、论域双射要 $(m+1)s\le M$"，$4s$ 来自 `Lemma 17` 证明里要同时扩 $(\alpha,\beta,\gamma,\zeta)$ 四段分子（`05:237` "This is the step requiring $4s\leq M$"），$(m+1)s$ 来自 `Lemma 18` 的 $(r+2)s\le(m+1)s\le M$（`05:316-317`）。假设 1 用 $C^M$、结论用 $C^m$，$M\gg m$ 是必要的：$M$ 要在原子上强到能定出 $K$-轨道（`Proposition 13` 的 $7r+7(6r/c)^{3/2}+1$），而 $m$ 只由程序决定。（c）"$D_i$ 可数、内含全部原子与全部纯 HF 集、对 $K_i$ 不变"这三条在 `05:52-55` 一并给出；$K_i$-不变性的论证是"$\alpha$ 支持 $x$ $\Rightarrow$ $g\alpha$ 支持 $gx$"。"基关系在有非原子参数时取假"这个约定在 `05:43-44`，它与 `05:255-258` 的"基关系若任一参数是集则假"一致，是 `Lemma 17` 最后一句的依据。原子谓词在本文具体实现里可定义：`05:64-65` 给 $\mathsf{Ed}(x,x)\lor\mathsf{Cf}(x,x)$。（d）候选失败路线：其一，把 $D_i$ 换成"秩 $\le r$ 且支持 $\le s$"。那正是 DRR 的做法，`Theorem 14` 会变成对每个固定 $r$ 成立的陈述，`01:43-44` 判它不够；此处必须让 $D_i$ 无秩界、只截支持，而"截支持"能成立是因为 `Proposition 8` 与秩无关。其二，把假设 2 的"$\le\max\{2,m\}s$"改成"$\le s$"。`Lemma 18` 在 $r\le m-1$ 时需要 $(r+2)s\le ms$ 位置的齐性，$r=1$ 时就要 $2s$，所以 $\max\{2,m\}$ 里的 $2$ 是**恰**为表示引理（`Lemma 16` 用 $2s$ 齐性，`05:396-397`）和 $m$ 小的时候保留的；若 $m=1$（程序只用一个变元名，理论可能），$\max\{2,m\}=2$ 仍然给出 $2s$，把 $2$ 换成 $1$ 会让 `Lemma 16` 的"同类型分子被同一 $g$ 携带"断掉。

（a）`Lemma 15`（`05:78-92`）："Extension counts"：若 $P,P'$ 同 $C^M$ 型且 $|P|+d\le M$，则对每个被实现的长 $|P|+d$ 型 $\rho$，扩出 $\rho$ 的 $\gamma$ 个数两边相等。

（b）核心是 `05:101-109` 的"型可被单个 $C^M$ 公式隔离"：取 $\rho$ 的代表，对**每个**型不同于 $\rho$ 的元组选一个区分公式（必要时取否），把它们合取。有限合取，因为在两个**有限**结构里实现型只有有限个（`05:74-76` 强调这点，尽管每个型记录无穷多公式）。自由变元落在前 $a+1$ 个位置、变元名数仍 $\le M$。然后 $\exists^{=h}x_{a+1}\theta_\rho$ 在 $P$ 真、由前缀同型在 $P'$ 真，故 $h$ 相同。$d>1$ 时对前 $a+d-1$ 投影归纳、把两层有限数相乘。（c）$|P|+d\le M$ 是"名字够用"的唯一出现形式；$h=0$ 与 $a=0$ 被 `05:117-119` 特别包含，空前缀跨结构时的相等就是句 equivalence。（d）候选失败：若允许**未实现**的 $\rho$，隔离合取要跑遍无穷多候选（公式集合无限），合取不有限，$\theta_\rho$ 不存在。`05:81-82` 那句"All types in the next lemma are realized in $A_0$ or $A_1$"就是这个约束，位置在 `05:74`。另一条：想用 $C^{a+1}$ ，并非 $C^M$ 隔离型，那要求 $M\ge a+1$ 且型在 $C^{a+1}$ 层次已可分；本文的 $M$ 远大于 $a$，所以直接用 $M$ 更省事，代价是假设里到处出现 $M$。

`Lemma 16`（`05:157-165`，Representation）给出分子/molecule 语法：$s$ 个原子形式 $c_1,\ldots,c_s$；集形式是有限的 $(\psi,\rho)$ 对，$\rho$ 是长 $2s$ 的实现型；求值 `eq:hf-atomic-form` $c_j*\alpha=\alpha_j$ 与 `eq:hf-set-form` $\phi*\alpha=\{\psi*\beta:(\psi,\rho)\in\phi,\ \beta\in A_i^s,\ \operatorname{tp}_M(\beta,\alpha)=\rho\}$。equivariance $g(\phi*\alpha)=\phi*(g\alpha)$。反方向归纳 hereditary 秩，$x=\phi*\alpha$ 的构造里 $\phi=\{(\psi_y,\operatorname{tp}_M(\beta_y,\alpha)):y\in x\}$；关键一句 `05:185-187`："Homogeneity for tuples of length $2s$ supplies an element $g\in K_i$ mapping the second tuple to the first. In particular $g$ fixes $\alpha$." 这里消费了 `Theorem 14` 假设 2 在长度 $2s$ 上的实例。"$\mathsf{Set}(u)$ 且 $\forall w(w\in u\leftrightarrow\ldots)$" 里的 $\forall$ 跑遍 $D_i$，所以论域必须对成员传递，否则会漏掉域外的成员；`05:154-155` 与 `05:171-173`、`05:270-273` 反复用这条传递性，我把"论域 $D_i$ 成员传递"记为 `Theorem 14` 之下最容易被读者忽略的承重项。`Lemma 17`（Transfer of atomic facts）证等式与属于的迁移，用到 $3s$ 与 $4s$ 位置的型扩张；`Lemma 18`（`05:283-289`）在 $r\le m-1$ 时造 $f:D_0\to D_1$ 双射，把"标签 $(\phi,\tau)$ 的值集"按重叠关系分类，每类两边等势（分子数 $n$ 等、纤维大小 $h$ 等，值集大小 $n/h$）。`05:354-358` 特别声明这个选择"no effective choice is being assumed"，用外部枚举取第一个标签来定。这一段是全文唯一一处**元层面**使用选择，而它发生在证明外部、不在程序内部；我把这条区分视为整篇能否站住的检查点之一，`05:268-269` 那句"The construction is a mathematical comparison; it is not required to be definable or executable by a choiceless program."是它的正面声明。

## 10 把整段计算装进被比较的域：`Lemma 19`、`Lemma 21`

解释刻画是外部输入。`06:23-49` 给二元词表版本的解读：$\delta,\eta,\rho_R$ 是带 Härtig 量词的一阶无参公式；$D=\{(a_1,a_2)\in V^2:\delta\}$；$\sim$ 是**包含 $\eta$ 的最小等价关系**；$R([\bar a],[\bar b])$ 当且仅当某对等价代表满足 $\rho_R$。`06:47-49`："the interpretation is defined even when $\eta$ itself is not an equivalence relation or $\rho_R$ is not constant on classes." 程序的规模条件在 `06:57-59`：$h+\sum_{j=1}^h|V(A_j)|$ 被固定多项式界住，$h\ge1$，halt 句在 $A_1$ 首次测试。`06:63-65` 提醒"absence of parameters"只禁止依赖输入的 distingulished 元组、不禁止公式里的自由元组变元，这条区分我起初读反了。

Kuratowski 对 $\langle a,b\rangle=\{\{a\},\{a,b\}\}$（`06:76-82`），论文补了注入性论证：成员之交是 $\{a\}$、之并是 $\{a,b\}$，$a=b$ 时仍然定出 $b$。编码 $S_C=\{\langle a_1,a_2\rangle:(a_1,a_2)\text{ 代表 }C\}$，$e_j(C)=\langle[j],S_C\rangle$，$[j]=\{[0],\ldots,[j-1]\}$。`06:96-98`："The payload records the whole class, so its construction does not choose a representative." 这一句与第 9 节末的选择问题连读才有效果：整个编码避开选择，是因为论文**刻意**把整类装进 payload，而没有去选一个代表元（选代表元正是 $\CPT$ 禁止的动作）。

（a）`Lemma 19`（`06:100-104`）：

```tex
\begin{lemma}\label{lem:trace-size}
For either input, the input atoms, all vertex codes up to halt, and all
objects recursively occurring as members of those codes belong to an
$H$-invariant transitive family of at most $9B^3$ objects.
\end{lemma}
```

（b）逐项把 `06:105-117` 的账复算一遍。单层：域对至多 $B^2$，每对贡献 Kuratowski 码与两个内层集，至多 3 个对象，共 $3B^2$；乘以 $B$ 个阶段得 $B\cdot 3B^2$。类至多 $B$ 个，payload 各 1 个对象（$B$ 个），带标签的对 $\langle[j],S_C\rangle$ 再加至多 $3B$（外层对 + 两个包装），所以"类"部分 $4B$，$B$ 层共 $B\cdot4B$。序数标签及其成员跨阶段至多 $B+1$。输入原子至多 $B$。合计 $B(3B^2+4B)+2B+1$。$B\ge2$ 时 $\le 3B^3+4B^2+2B+1\le3B^3+4B^3/2+\ldots$；具体核对：$B\ge2$ 时 $4B^2\le2B^3$、$2B+1\le B^3$（$B=2$ 时 $5\le8$ ✓），故总 $\le6B^3\le9B^3$。论文给 $9B^3$，宽松约 $1.5$ 倍。（c）$H$-不变的论证在 `06:119-125`：输入自同构保住固定解释公式的真值（含 Härtig），故置换域对、生成的等价类、输出关系，归纳置换顶点码，且固定每个纯序数。"fixes every pure ordinal"这条是编码把阶段信息塞进 von Neumann 序数的直接后果：序数是**纯**集合、与原子无关，所以任何自同构逐点固定它们，于是"阶段 $j$"这个信息对程序可见、对对称性不可破。这是我认为最漂亮的一处工程选择：它让码 $e_j(C)$ 在不同阶段之间天然互异，而不需要引入任何序。（d）候选失败：若不加 $[j]$ 标签、只用 $S_C$，不同阶段的同一 payload 会碰撞，注入性失效；若改用"阶段号 $j$ 的某个原子编码"，就得为阶段准备原子，破坏 $H$-不变。若把 $9B^3$ 换成 $B^3$，`07:17` 的"$9B^3\le N^q$"要重写，$q$ 的下限随之变动；由于 $q$ 是任选的、$N\ge L^3$ 增长，小常数在这里无所谓，所以我判断 $9$ 只是求和的整数余量。

`06:128-136` 把 `Lemma 19` 接到 `Corollary 9`：选 $q\ge1$（依赖 $P$）使 $9B^3\le N^q$ 对充分大 $N$ 成立，于是传递 trace 族的每个 $H$-轨道 $\le N^q$，`Corollary 9` 给统一长度 $s$ 的 $K$-支持，整个族（含 payload、所有对包装、所有序数标签）落在 $\mathcal D_b$ 里。最后一句是这一节的顶点：

```tex
No bound on the rank of a code has been imposed: its nesting depth
may grow throughout the computation.
```

公式精确性（`Lemma 20`）与宽度（`Lemma 21`）是同一节的两侧。`06:159-166` 的 Härtig 翻译：

```tex
 \bigvee_{n=0}^{B}
 \left[
  \bigl(\exists^{=n}x\,(U(x)\wedge\chi_1^*)\bigr)
  \wedge
  \bigl(\exists^{=n}y\,(U(y)\wedge\chi_2^*)\bigr)
 \right].
```

$B+1$ 个析取肢，因为两个被数集合都 $\le B$。`06:196-199` 的 $\mathsf{Reach}_{B^2}$ 恰是生成的等价关系，因为路径图至多 $B^2$ 个点（域对个数），连通路径长 $\le B^2-1$；`06:186-195` 的归纳把 $\mathsf{Reach}_t$ 写成"长 $\le t+1$ 的路"。$\mathsf{Sing},\mathsf{Double},\mathsf{OP},\mathsf{Ord}_i$ 四个式子（`06:205-232`）用 $\forall w(w\in u\leftrightarrow\ldots)$ 精确刻画包装，靠论域传递性保证不漏成员；`06:252-253` 强调"stage subscripts ... are syntactic indices, not additional free variables"，这正是 `Lemma 21` 能给出与阶段数无关的宽度界的前提。

（a）`Lemma 21`（`06:299-307`）：

```tex
\begin{lemma}\label{lem:substitution-width}
Suppose predicates in a relational formula $T$ are replaced by formulas
whose free variables are among their displayed argument variables and
whose free-variable measure is at most $w$. Capture-avoiding substitution
produces a formula of free-variable measure at most
$\max\{\operatorname{fw}(T),w\}$. This allows repeated arguments and
unused displayed argument variables. Moreover a formula of measure at
most $w$ can be renamed to use at most $w+1$ variable names.
\end{lemma}
```

宽度定义在 `06:292-296`：$\operatorname{fw}(\theta)=\max_\xi|\operatorname{FV}(\xi)|$，跑遍子公式，且**外部约束的变元若在 $\xi$ 内自由出现就算进 $\xi$**（`06:295-297`）。这个非标准的"相对子公式"计数是整条引理成立的形状。（b）替换的两类子公式分别处理：插入副本内部的子公式，其自由变元与原 counterpart 相同，只是显示参数被实际变元替换，**识别会减少而不增加**数目；模板继承的子公式不多得自由变元，因为插入式公式的自由变元全在被替换原子的参数之中。取 $\max$ 就出来了。改名那半：$w+1$ 个名字的调色板，自顶向下维护"该节点自由变元到名字的单射赋值"；连接词处限制到子节点自由变元；绑定 $Qx\xi$ 时父自由变元至多 $w$ 个，故调色板剩一个可用名给 $x$；若 $x$ 在 $\xi$ 中不自由则绑定是 vacuous，子节点沿用父赋值。（c）为什么是 $w+1$ 而 $w$：需要给"当前绑定的那个变元"留一个不属于父自由变元集的名字，父自由变元 $\le w$ 个，故 $w+1$ 够用；若只用 $w$，当节点恰有 $w$ 个自由变元且要绑新元时无名可用。这个 $+1$ 直接进 `06:357` 的 $m=\max\{2,w+1\}$。（d）候选失败路线：其一，若替换式的自由变元**超出**显示参数（例如模板里漏了一个外部常数变元），"$\max$" 就变成"相加"，$B^2$ 层展开会把宽度推到 $O(B^2)$ 甚至 $O(w\cdot B^2)$，$m$ 随之依赖 $B$（依赖 $N$），`Theorem 14` 的假设 2 里 $\max\{2,m\}s$ 就会大到破坏 `eq:homogeneity-width`。`06:340-341` 那句"with all free variables among their displayed arguments"就是这条防线的检查点。其二，若 $\mathsf{Reach}_t$ 的阶段下标真的变成自由变元（`06:252-253` 否掉了），宽度会随 $t$ 累积，`07:16` 的"$m$ from the syntax"就不存在。其三，用 HTP 或 de Bruijn 索引把改名自动化，是工程做法，并非数学改进，论文的归纳论证本身已经把 capture 处理干净（`06:309-310`）。

`06:357-362` 收口：$m=\max\{2,w+1\}$，展开后的状态/halt/output 公式全在 $C^m$ 里，与 $N$、$B$、阶段号无关；计数量化里的整数常数与公式长度**可以**依赖 $B$ 与阶段。最后一句"these are formulas used to compare two runs; they are not an additional nonuniform program."是我认为全文第三重要的免责声明（前两条是 `01:29-30` 与 `04:38-41`），它挡住"你是不是偷偷塞了一条非一致建议"这个质问。

## 11 分离证明 `Theorem 1`：`07` 的 44 行装配

`07:15-19` 的顺序是关键：

```tex
Choose its polynomial bound $B=B(N)$ and the constant $q$
from the trace bound, and choose the constant $m$ from the syntax.
Take $L$ sufficiently large that the trace bound $9B^3\le N^q$ and
the width estimates below hold, and put $M=\lfloor L^{7/4}\rfloor$.
```

$P\to(B,q,m)\to L\to M$，$B,q,m$ 全在 $L$ 之前定。`07:24-31` 把四件输入拼起来：`Proposition 11` 给 base $C^M$ 等价（`Theorem 14` 假设 1），`Proposition 13` 给长 $\le\max\{2,m\}s$ 元组的齐性（假设 2，宽度 $O_{q,m}(L^{3/2}(1+\log L)^3)=o(L^{7/4})$），另有 $\max\{4,m+1\}s\le M$，三者恰好是 `Theorem 14` 的全部假设，故两个支撑域在所有 $C^m$ 句上相等。`07:33-39` 是终局：

```tex
Use the same $B$, ordinal indices, and syntactic definitions on both
sides. Up to the earlier halt stage both sets of state definitions are
exact. At that stage the common translated halt sentence is true on
one side, hence also on the other; thus both computations halt there.
Their common translated output sentence has the same truth value on
both sides. No deciding interpretation program can therefore give
opposite answers on the two structures.
```

补一步"earlier halt stage"的逻辑：设两侧 halt 阶段分别为 $h_0,h_1$，取 $h=\min\{h_0,h_1\}$。$j<h$ 时两侧状态定义都精确，翻译后的 halt 句 $\psi_h$ 是一个 $C^m$ 句，在一侧真（它就是那侧真 halt 的那个 $j$? 需 $h$ 是某侧的 halt 阶段），由域等价在另一侧也真，故另一侧也在 $h$ halt。于是 $h_0=h_1$。再取 output 句，同真假。这个 min 论证论文压成三句，我在纸上写了七行才对上。[推测] 论文把 $h$ 的存在性当作显然。若 $h_0\ne h_1$，则较小者那侧的 halt 句在另一侧也该真，与另一侧更早 halt 矛盾（halt 是 absorbing 的：程序 halt 后不再进入新状态，所以"$j$ 时 halt"在 $j$ 之后不再为假？）这里我需要小心：halt 句在 $j$ 之后是否保持为真，论文没有单独论证；`07:34-36` 用"up to the earlier halt stage both sets of state definitions are exact"回避了它，即我只在**两侧都还没 halt** 之前使用精确性，然后一次性在 min 处对齐，不需要 halt 的持久性。这与我上面写的 $\min$ 论证一致。

## 12 `Corollary 3` 的线性代数逻辑一侧，与外部检索所得

`08:12-114` 证 $Q$ 在 $\mathrm{FPS}_3$ 与 $\mathrm{FPR}_3$ 里可定义。机制我摘三步。第一步把系数模 3 用计数项写出：$d_\delta(y,a)=\#x(Y(x)\wedge\mathsf I(a,x)\wedge\mathsf Z_\delta(y,x))$，然后 $C_r(y,a)\equiv\exists\eta\le 3n\,(d_1+2d_2=3\eta+r)$，$\eta$ 是数变元；$d_1+2d_2\le3n$ 保证这个"模 3 等于 $r$"的说法在一阶算术项里可写。第二步用全元组域 $D=A^2\times\{0,1\}$ 造矩阵 $M_{ij}$（四种 tagged 情形，`08:49-56`），零填充无害，"an empty $X_t$ still gives $0=1$"（`08:63`）这句我在第 1 节讨论免 promise 时预期的隐患在这里被正面处理掉：空块产生 $0=1$ 行，系统自动不可行，而这恰好符合 $Q$ 在无约束时的语义（$\sum_{a\in\varnothing}\lambda_a=0\ne1$）。第三步：solvable 算子要布尔矩阵与全 1 右端，`08:69-86` 用 $D\times\{0,1,2,3\}$ 的四列标签 $x^1_j,x^2_j,z_j,v_j$ 把系数 $-C$ 拆成两个 0/1 列之和，$\mathbf1_{\neg N(i)}v_i$ 吸收右端，$x^1_i+z_i=1$ 与 $x^2_i+z_i=1$ 逼出 $x^1=x^2$，最后"$Mx^1=b$"。rank 一侧（`08:88-106`）用 $\Theta_0$（$M$ 加零列）与 $\Theta_+$（再附 $b$ 的若干相同副本），$D$ 非空使副本张成与单列相同，得 $Q(A)\iff\operatorname{rk}_3(\Theta_0)=\operatorname{rk}_3(\Theta_+)$。`08:110-113` 把空输入单独交代：$A=\varnothing$ 时 $Q$ 为真（无方程即相容，回到 `00:75-76` 的约定），而 `Corollary 3` 只在非空类上陈述，两者不冲突。

检索所得，与上面的论文内容分开陈述，我不把它当论文结论。我查到的公开条目里最贴近这条技术线的是 [Choiceless polynomial time, counting and the Cai-Fürer-Immerman graphs](https://scholars.duke.edu/publication/1433697)，即本文 `01:18-20` 引用的 bgs2002，它的标题本身说明"CFI 图 + 计数 + 选择无"这个三元组在 2002 年就已经是公认的可能分离来源，而本文给的正是这个方向上的一个具体线性相容查询；同一条检索还给出 [Polynomial-Time Axioms of Choice and Polynomial-Time Cardinality](https://m.zhangqiaokeyan.com/journal-foreign-detail/0704066237924.html)，印证"选择公理在多项式时间层面的失败"与"$\mathsf{Card}$ 作为基本运算"是同一批文献里的两个侧面。[推测] 公开检索未能直接给出"BGS 非捕获猜想已被确认"的第二来源；我的判断是本文（2026-09-23）相对这些公开条目是超前的，读者不应期待别处已有同一证明。`01:27-28` 引用的 Dawar-Grädel-Kullmann-Pago 2025 把 capture 问题在 2025 年仍列为 open，这条是我能核对到的最晚的公开状态描述。[推测] 关于本文与 `shelah2000` 声称的关系，公开检索给我的只有 [Shelah's publication list](https://shelah.logic.at/paper-list/) 这种条目级信息，无法判定其证明是否覆盖 full counting 形式系统，因此我完全按论文 `01:29-30` 的口径处理：不引它、不依赖它。

## 13 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\mathbb F=\mathbb F_3$ | 3 元素域，$1/2=2$ | `00:34`; `02:53` | $P_e$ 的群律、$C(y,a)$、$\mathsf Z_\delta$、$\mathsf D_\delta$、`08` 的模 3 | 特征 2 时 `eq:edge-product` 的 $\tfrac12$ 不存在，`eq:H-commutator` 的系数关系变形，`Proposition 5` 的 $b_v=1$ 与 $0$ 的可区分性仍在但辛项失去对称化余地 |
| $\lvert\tau\rvert=8$ | 常数 8 个二元关系 | `00:35-37`; `00:82` | `Theorem 1` 的"fixed vocabulary"、`05:28` 的"same binary relational vocabulary" | 把 $\preceq,\mathsf D_\delta$ 放进 $\tau$ 会让 `04:38-41` 的"不是程序输入"失效，齐性变成程序可见信息 |
| $d(v)$、$\lvert F(e)\rvert$、$f(v)$ 上限 | $6,4,12$ | `02:33-35` | $N_L$ 上下界、$\lvert T\rvert\le6M$、$7\lvert U\rvert$、$6r$ | 换成 $k$-正则图则 $6\to k$，`eq:homogeneity-width` 左端的 $7r,7(\cdot)$ 同步放大 |
| $N_L$ | $L^3\le N_L\le(3^{10}+3^{29})L^3$ | `02:106-113` | $N=\Theta(L^3)$（`03:273`、`04:343`）、$\log_3N$ | 若上下界系数变，$s$ 与 $M$ 的比较只吃 $\log$ 常数；若 $N$ 不是 $\Theta(L^3)$，$s=O_q(L(1+\log L)^2)$ 整条改写 |
| $h=q\log_3N$ | $a+d\le h$ | `03:199-201` | `Proposition 8` 的 $2Lh^2$ | $h$ 变大则 $s$ 按平方放大，直接顶穿 `eq:homogeneity-width` |
| $s$ | $\lceil2L(q\log_3N+1)^2\rceil+1=O_q(L(1+\log L)^2)$ | `03:261-263`; `04:341-343` | `Proposition 11/13`、`Theorem 14` 两个假设、`07:21-22` | 去掉 $+1$ 则 $q=0$ 或 $d=0$ 时 $s=0$，`Theorem 14` 要正整数、padding 论证（`03:269-272`）断 |
| $M$ | $\lfloor L^{7/4}\rfloor$ | `04:92-94`; `07:18` | 巨人分量、`Proposition 13`、`Theorem 14` 前提 | 取 $\alpha$：需 $\alpha<2$（`eq:small-components` 要 $M^{3/2}=o(L^3)$）且 $\alpha>3/2$（齐性要 $s^{3/2}=o(M)$）；`04:356-357` 自证 $(3/2,2)$ 内任取皆可 |
| $c$ | $1-2^{-1/3}\approx0.2063$ | `04:62` | `Lemma 10`、`Lemma 12`、`Proposition 13`、`eq:small-components` | 任何 $c'<c$ 都还成立但界更弱；$c=0$ 时 `Lemma 12` 的 $\lvert U\rvert\le(\lvert T\rvert/c)^{3/2}$ 无界，`Proposition 13` 宽度失控 |
| 指数 $2/3$ 与 $3/2$ | Loomis-Whitney 与其反解 | `04:65,71-76`; `04:101,212` | `eq:small-components`、`Lemma 12`、`eq:homogeneity-width` | 换成二维网格是 $1/2$ 与 $2$，$M$ 的容许区间随之变，$7/4$ 失效 |
| $6M$ | 触及边数上限 | `04:96`; `04:132-133`; `04:161` | `eq:small-components`、`Proposition 11` | 构型原子触及边数由 $d(v)\le6$ 给，$6\to k$ 时 $(12M)^{3/2}$ 变 $(2kM)^{3/2}$ |
| $7r+7(6r/c)^{3/2}+1$ | 齐性所需变元名数 | `04:236-237`; `04:333` | `Proposition 13` | 少算一个 $6\lvert U\rvert$（`04:328-331`）就允许过大的 $r$，判别公式实际超宽，类型相等不再矛盾 |
| $2Lt$ | 稀疏共链支撑 | `03:116-117` | `Proposition 8` 每基元 $2La$ | 无 $i_0$ 鸽巢（`03:140-142`）则退化为 $O(L^2t)$，$s$ 多出因子 $L$，越过 $M$ |
| $2Lh^2$ | 支持长度（真实 $Lh^2/2$，因 $ad\le h^2/4$） | `03:188`; `03:237` | `Corollary 9`、`07` | 收紧成 $Lh^2/2$ 不影响任何渐近；写宽是为 $q=0,d=0$ 免特判 |
| $B=B(N)$ | 固定多项式界，$B\ge2$ | `06:67-70`; `07:15` | `Lemma 19`、Härtig 翻译的 $n\le B$、$\mathsf{Reach}_{B^2}$ | $B$ 若依赖结构，并非只依赖 $P$，`07:33` 的"same $B$ on both sides"失效 |
| $9B^3$ | trace 族大小 | `06:103`; `07:17` | `06:128-130` 选 $q$、`Corollary 9` | 求和项 $B(3B^2+4B)+2B+1$（`06:114`）在 $B\ge2$ 时 $\le6B^3$，写 $9B^3$ 是余量；改成 $<B^3$ 会断在 payload 与包装的计数 |
| $q$ | 整数 $q\ge1$，$9B^3\le N^q$ | `06:128-129`; `07:15-17` | `Proposition 8` 的 $N^q$ | $q$ 若依赖 $L$ 则 $s$ 不再是 $O_q$ 类，`04:340` 的"先定 $q,m$"铁律断 |
| $w=w(P)$, $m=\max\{2,w+1\}$ | 只依赖程序的宽度常数 | `06:353`; `06:357` | `Lemma 21` 改名、`Theorem 14`、`07:16` | 替换式自由变元一旦越出显示参数（`06:340-341`），$w$ 变 $O(B^2)$，$m$ 依赖 $N$，全域失效 |
| $\max\{4,m+1\}s\le M$ | `Theorem 14` 唯一数值前提 | `05:31-33`; `04:352-353`; `07:29` | `Lemma 17` 的 $4s$、`Lemma 18` 的 $(r+2)s$ | $4$ 来自四段分子 $(\alpha,\beta,\gamma,\zeta)$（`05:235-237`）；删一次扩型就省一个 $s$，但等式迁移随之断 |
| $\max\{2,m\}s$ | 齐性使用长度 | `05:37`; `07:27` | `Lemma 16` 的 $2s$、`Lemma 18` 的 $ms$ | 把 $2$ 换成 $1$ 则 `Lemma 16` 反方向表示不存在 |
| $B+1$ 与 $B^2$ | Härtig 析取肢数、路径长度上限 | `06:159-166`; `06:196-199` | `Lemma 20` 精确性 | $B^2$ 若写成 $B$，$\mathsf{Reach}_B$ 可能小于生成等价关系，商语义 `06:42-46` 不再被精确定义 |
| $O(n^4)$、$2n$、$n+n^2$ | P 侧账 | `00:104-107` | `Proposition 2`、`Theorem 1` 前半 | 这些是论文唯一的显式算法复杂度，改动只影响 P 侧效率、不影响下界 |
| 电荷 $b^0,b^1$ | $b^1=\mathbf1_{v_*}$，$\sum_vb_v=1$ | `02:149-152` | `Proposition 5`、`Proposition 11` 的 `eq:defect-flow` | 换成 $\sum b_v\ne0$ 的任意 $b$ 仍可行，但 `eq:defect-flow` 的 $\mathbf1_{v_*}-\mathbf1_w$ 形状要改成 $\partial t=b^1-b^0-\mathbf1_w$ 且需零和条件仍成立 |
| $3^{d(v)-1}$ | 顶点 $v$ 处配置类大小，$d(v)\ge1$ 时非空 | `04:26-27`; `02:120-123` | `Proposition 11`、`Proposition 5` 在配置层两侧对齐 | 若 $d(v)=0$ 则指数 $d(v)-1$ 变负、配置类空，`02:37` 的 $d(v)\ge1$ 破，两侧同层无从对齐 |
| $3^{2\lvert F(e)\rvert+1}$、$3^{2f(v)+d(v)-1}$ | 单边状态数与单点配置数的求和项 | `02:107-108`; `02:117-120` | `lem:universe-size` 里 $N_L$ 上下界的两个和式 | 指数里 $2\lvert F(e)\rvert$ 或 $2f(v)$ 少计一项，$3^{10}+3^{29}$ 的前因子缩水，$N=\Theta(L^3)$ 的常数随之变 |
| $L^3$ 顶点、$3L^2(L-1)\le3L^3$ 边 | 网格规模，$N_L$ 求和的两段基数 | `02:124`; `04:53` | `lem:universe-size` 的上下界、$s$ 与 $M$ 对 $L$ 的标度 | 网格取 $k$ 维时顶点数变 $L^k$，`04` 的 $2/3$ 与 $3/2$ 两指数随维改写，$M$ 的容许 $\alpha$ 区间平移 |
| $\lvert\delta_G R\rvert\ge c\rvert R\rvert^{2/3}$ | 边界下界，前提 $\lvert R\rvert\le L^3/2$ | `04:62-65`; `04:86` | `eq:small-components`、`Lemma 12` 的巨人分量论证 | 去掉 $\lvert R\rvert\le L^3/2$ 门槛后取 $R=V$，边界 $=0$ 而右端 $cL^2>0$，不等式被推翻，巨人分量唯一性断 |
| $c^{-3/2}(12M)^{3/2}=o(L^3)$ | 全体小分量边界和的总上界 | `04:102-104`; `04:109` | `Proposition 11` 里仅一个大分量的矛盾 | $M=L^\alpha$ 一旦 $\alpha\ge2$，$(12M)^{3/2}$ 不再 $=o(L^3)$，`04:109` 的两大分量矛盾消失 |
| $O_{q,m}(L^{3/2}(1+\log L)^3)=o(L^{7/4})$ | 齐性所需变元名的总宽度增长率 | `04:346-348`; `07:28` | `Theorem 14` 前提 $\max\{4,m+1\}s\le M$ | 若 $s$ 多带一个 $L$ 因子则宽度升为 $L^{5/2}$，超 $L^{7/4}$，`Proposition 13` 的判别式不再被 $M$ 吸收 |
| $4s\le M$ | 等式迁移那一步单独占用的宽度 | `05:238`; `05:395` | `Lemma 16` 反方向表示、`Theorem 14` 的分子四段 | 删任一段分子则 $4$ 降为 $3$，等式迁移在保留位上不再强制 $x'=x'_j$（`05:364`） |
| 秩 $2t$、$t\le a$、像维 $\le n-t$ | 交错形式限制到 $K_0$ 的秩与其半维界 | `03:217`; `03:224-232` | `Proposition 8` 每基元的 $2La$ | 若非退化维数写成 $t$ 则半维界失效，$t\le a$ 推不出，`2La` 支撑界失去来源 |
| $\lvert T\rvert\le6r$ | 齐性论证里被触及边数，对 $M$ 版 $\le6M$ 的实例化 | `04:255`; `04:329` | `eq:homogeneity-width` 左端 $7(6r/c)^{3/2}$ | $d(v)\le6$ 若变 $k$ 则 $6r\to kr$，`Lemma 12` 的 $\lvert U\rvert\le(kr/c)^{3/2}$ 同步放大，宽度界重写 |
| $M-1$ | 逐次扩流时剩余可用位置数 | `04:155`; `04:185` | `Lemma 12` 的逐步双射构造 | 预算若记成 $M$ 则在最后一步越界，`04:155` 的至多 $M-1$ 位置剩余不成立，扩流在该步断 |
| $r+3$ | 齐性宽度 $7r+\cdots$ 之内实际许可的变元名数 | `04:265`; `04:234-237` | `Proposition 13` 的类型相等论证 | 名字少于 $r+3$ 则 witness 与状态原子无法各占一名，`04:333` 的 $r+7\lvert U\rvert+6r+1$ 记账错位 |
| $(r+2)s\le(m+1)s\le M$ | 扩张保留赋值时用的位置预算链 | `05:316`; `05:294`; `05:397` | `Lemma 18` 的双射、`Theorem 14` 全域一致 | 若 $r$ 越过 $\max\{2,m\}$ 则 $(r+2)s$ 可能 $>M$，`05:341` 的有限计数求和失去上界 |

依赖链一条：$d(v)\le6,|F(e)|\le4,f(v)\le12$ 决定 $N_L=\Theta(L^3)$，$N_L$ 决定 $\log_3N=\Theta(\log L)$，与 `Lemma 7` 的 $2Lt$ 一起给出 $s=O_q(L(1+\log L)^2)$；$s$ 乘 $r\le\max\{2,m\}$ 后进 `eq:homogeneity-width` 的左端 $7r+7(6r/c)^{3/2}+1$，该项按 $s^{3/2}=O(L^{3/2}(\log L)^3)$ 增长，必须 $\le M=L^\alpha$，这给出 $\alpha>3/2$；$M$ 同时进入 `eq:small-components` 的 $(12M)^{3/2}=o(L^3)$，这给出 $\alpha<2$；$\alpha=7/4$ 落在两者之间。另一支：$P$ 给 $B$，$B$ 给 $9B^3$，$9B^3$ 给 $q$，$q$ 给 $s$，两支在 $\max\{4,m+1\}s\le M$ 处汇合。所以 $\alpha$ 一动，两支同时收紧；$B$ 与 $w$ 只从 $P$ 出，是"程序先于网格"这条顺序的数值体现。$c$ 与两个指数 $2/3,3/2$ 处在两支的交界上：它们同时决定 $(12M)^{3/2}$ 与 $(6r/c)^{3/2}$，因此**改维度会同时改两支的容许 $\alpha$ 区间**，这是我认为台账里最紧的一条隐藏耦合。

## 14 Lean 取证

实测（全部在 `E:\math\lean` 下用 grep/wc 跑出的数字，无估算）。登记：`formalization.yaml:312-314` 条目与 `formalization.yaml:1006-1008` 比对条目（config `ComparatorChallenges/ChoicelessPolynomialTime.json`，declaration `OAI.CPTSeparation.main`，file `OAI/ModelTheory/Choiceless/Separation.lean`）。JSON 白名单 `permitted_axioms: [propext, Quot.sound, Classical.choice]`，`enable_nanoda: false`。

规模：入口 `Separation.lean` 28 行，目录内 `.lean` 文件 26 个，总 18461 行；单文件行数区间 28（`Separation.lean`）到 1264（`Flows.lean`），其余大户 `Flows` 1264、`Definability` 1131、`Grid` 1121、`Reachability` 1115、`Forms` 1107、`Counting` 1009、`Operational` 1009、`Interpretations` 982、`Hereditary` 894、`Stack` 824、`Traces` 819、`Simulation` 816、`Support` 819、`Bounds` 648、`Model` 641、`Counters` 614、`GaussMachine` 604、`Gaussian` 574、`Observers` 524、`QueryMachine` 455、`LowerBound` 480、`TableMachine` 328、`Matrix` 373、`Evaluation` 172、`FullLanguage` 214。

顶层声明按关键字计数（`^<kw> ` 形式）：theorem 376、lemma 337、def 444、abbrev 67、structure 22、inductive 24、instance 22、noncomputable def 24、example 1、opaque 0、axiom 0；namespace 213。合 994 个定理/引理级声明与 559 个定义级声明。

`sorry` 出现次数在 `OAI/ModelTheory/Choiceless/` 全目录为 0；`admit`、`native_decide` 各 0；`#print axioms` 与 `#eval` 在此目录 0 次（因此公理洁净度只在外部 comparator 检查里保证，源码内无自检）。比对桩 `ComparatorChallenges/ChoicelessPolynomialTime.lean` 共 560 行，其 `theorem main` 在第 549 行、第 554 行是 `sorry`（挑战侧待证声明，与 solution 模块同签名，这是仓库惯例，不算本文破口）。

公理实际落点：无 `axiom` 声明；`Classical.choice` 用于 `Bounds.lean:167`、`Counting.lean:332,335,381,388`、`Forms.lean:423,899`；`Classical.decEq` 作 local instance 在 `Definability.lean:11,407,661,820,920` 与 `LowerBound.lean:25,104,169,251,294`；`Classical.propDecidable` 与 `propext` 在 `Grid.lean:568,577,578`。全部落在 JSON 白名单内。

tactic 频次（按行首 tactic 位置统计，前 15）：have 1372、exact 627、simp 504、intro 440、apply 421、rw 386、obtain 321、refine 167、induction 155、change 130、cases 112、rcases 111、funext 82、ext 41、congr 40。低频：subst 28、clear 4、omega 4、norm_num 4、suffices 3、rfl 3、ring 1、generalize 1、rename_i 1、show 1；为零的有 constructor、calc、linarith、positivity、norm_cast、decide、abel、trivial、revert、beta_reduce、unfold_projs、classical、let_fmc。这一分布说明形式化几乎不靠自动化求解器（`omega/linarith/norm_num` 合计仅 12 次），组合性论证基本手工完成。

论文与 Lean 的错口清单，我按严重度排：
1. 形式化的下界对象与论文的"解释程序"不同构。`Model.lean:559-561` 的 `FullCPT.EvaluationDefinable` 用 `Program Symbol` + `evaluationAccepts time space`（`Model.lean:553-556`，含 `P.run rel h`、`flag st .halt`、`(P.occurring rel h).card ≤ space.eval`）；真正被证否的是 `query_not_polynomial_observed_HF`（`Observers.lean:512-514`，针对 `Operational.Machine` + `Observer`），再经 `evaluationAccepts_compile`（`Evaluation.lean:153-156`）搬回 `FullCPT.Program`。我在该目录内没有找到任何把"解释程序"（论文 `06:23-65`，依赖 gkps2015/gsw2020）与这个操作机模型等价的声明。论文的 `01:106-107` 明说解释刻画是"an external input"，而 Lean 里没有对应的外部输入或公理；这意味着 `OAI.CPTSeparation.main` 的第三个分量所否定的对象，与 `Theorem 1` 字面否定的对象之间的关系在 Lean 侧未被陈述。[推测] Lean 的 machine 模型是作者对 CPT 的另一套等价定义，等价性未入库。这是我认为最大的一处错口。
2. 网格参数错位：`Support.lean:453` 用 `Vertex (n) := Fin (n+1) × Fin (n+1) × Fin (n+1)`，边/面分别按 `Fin n × Fin (n+1)²` 等（`Support.lean:455-469`）。所以论文的 $L$ 对应 Lean 的 $n+1$，论文假设 $L\ge2$ 对应 Lean 的 `hn : 1 ≤ n`（`Bounds.lean:195`、`Flows.lean:981,1068`）。渐近式里 `Bounds.lean:380` 写 `2*L*(q*Real.logb 3 (C*L^3))^2`，其中 $L$ 是实数化的 $n+1$。凡在论文里读 $L$ 的地方，Lean 里要读 $n+1$。
3. $N$ 的处理：论文 `Lemma 4` 给 $N_L$ 的**精确**公式（`02:106-109`）；Lean 侧我看到的是 `atomSizeConstant*(L^3)` 型上界进入 `Real.logb 3 N`（`Bounds.lean:380`、`Bounds.lean:546` 的 `atomSizeConstant`），未见与 `eq:universe-size` 逐项相等的声明。论文里"与 $b$ 无关"这条在 `Proposition 5` 前被显式使用的等大小事实，Lean 用上下界与 `hN : N = Fintype.card` 类假设替代。[推测] 精度损失不影响渐近，但 `Lemma 4` 这一条在 Lean 里对应物较弱。
4. 支持长度 padding：论文 $s=\lceil2L(q\log_3N+1)^2\rceil+1$ 有两处 $+1$（`03:262-263`）；Lean `Bounds.lean:301` 写 `⌈2*(n+1:ℝ)*(q*Real.logb 3 N)^2⌉₊`，**内层无 $+1$、外层无 $+1$**。论文的两个 $+1$ 分别保证 $q=0$ 时非退化与 $s\ge1$（`Theorem 14` 要 $s$ 为正整数）。Lean 侧靠别处假设（如 `hNpos`、`hbdd`）补偿。这是一处可核对的形状差异。
5. $q$ 的数域：论文"fix an integer $q\ge1$"（`06:128`）、"let $q\ge0$"（`03:184`）；Lean `Bounds.lean:198,283` 用 `(q : ℝ) (hq : 0 ≤ q)`，实数 $q$、可取 0。Lean 更一般，但也因此与论文的整数 $q$ 陈述不同形。
6. 齐性宽度：论文 `eq:homogeneity-width` 是 $7r+7(6r/c)^{3/2}+1\le M$，Lean `Flows.lean:983,1068`、`Forms.lean:1060` 逐字一致（`boxConstant := 1 - 2^(-1/3)`，`Flows.lean:241`）；但 `Counting.lean:975` 出现一个更弱的宽度假设 `7*Fintype.card J < M`，是同一目录里的第二套（较松）宽度 notions，我在 Lean 侧没能把它对应到论文任何一处。[推测] 它是原子计数比较的中间版本。
7. $M$：Lean `Bounds.lean:363` `palette (L : ℝ) := ⌊L^((7:ℝ)/4)⌋₊` 与论文 `M=⌊L^{7/4}⌋` 一致；`Bounds.lean:376,380,392` 额外给出 $s=o(L^{7/6})$ 这一论文没写的中间阶（论文只写 $O_q(L(1+\log L)^2)=o(L^{7/4})$）。Lean 在这里比论文精细。
8. 论文 `Corollary 3`（$\mathrm{FPS}_3$、$\mathrm{FPR}_3$ 可定义，整节 `08-linear-algebraic-logics.tex`）在此目录内**没有对应**：以 `FPS|FPR|Solvability|solvability|RankOperator|rankOperator` 在 `OAI/ModelTheory/Choiceless/` 全目录 grep，命中文件数 0。P 侧（`Proposition 2`）则由 `QueryMachine.lean` + `GaussMachine.lean` + `TableMachine.lean` + `Gaussian.lean` + `Matrix.lean` 承担，`Separation.lean:15-24` 组装出 `OrdinaryPolynomialTime`（定义在 `Model.lean:630`）。
9. Lean 有论文没有的加强阶梯：`LowerBound.lean:9` `query_not_cutoff_HF`、`:296` `cumulative_cutoff_agrees_on_some_box`、`:363` `query_not_cumulative_cutoff_HF`、`:468` `query_not_polynomial_cumulative_HF`，是逐步放宽机器资源的四个版本；`Theorem 1` 只用最后那个。这些在 tex 里没有对应段落，读 tex 会低估形式化的工作量。
10. `Proposition 13` 对应的 Lean 名是 `quantitative_homogeneity`（`Flows.lean:1066`）与 `quantitative_homogeneity_shift`（`:981`），`Proposition 11` 走 `Bounds.lean:302-325` 的组装，`Theorem 14` 的对应物在 `Bounds.lean` 里由 `trace_supported`（`:195`）、`invariant_family_hereditarily_supported`（`:206`）与 `eventual_bounds`（`:546` 处被用）供料；`Lemma 19` 的 $9B^3$ 在 `Reachability.lean:214` 与 `Bounds.lean:198,623`。命名基本可对齐，但论文里 `Theorem 14` 是**独立定理**，Lean 里我没找到与其完全同形的单条 `theorem`，它的陈述被拆成若干假设入口。

## 15 与 D41、D56 的分界：同为"布尔复杂度"名声下的三种不同对象

D41（敏感度与块敏感度的超二次分离）与 D56（depth-three 布尔电路的平方根指数下界）都在布尔函数本身上做组合下界：对象是 $\{0,1\}^n$ 上的函数或其电路表示，度量是块/敏感度、深度、门数，方法是把一个具体函数的局部结构枚举干净再证全局不等式。D61 完全不在这个层面。它的对象是**有限关系结构的同构不变类**，度量是"公式的变元名数"（$C^h$ 里的 $h$）与"程序的状态大小"（$B$），下界的形状是渐近的：对每个固定程序存在 $L_0$ 使 $L>L_0$ 时两侧同答案。所以 D61 里没有任何一个具体输入上的硬计算，$9B^3$、$2Lt$、$7r+7(6r/c)^{3/2}+1$ 都是"用来喂给一个 $\forall$ 的"，并非被反驳的目标。第二条分界在方法：D41/D56 靠组合枚举与归纳，D61 靠群表示（Heisenberg 型类二群 $H$、交错形的各向同性维数论证）加上模型论比较（有限变元计数句的 back-and-forth 型双射）。第三条分界更实在：D41/D56 的下界是**无条件且精确**的（给定规模给下定理），D61 的下界是 $o(\cdot)$ 型的，它的成立依赖 $\alpha\in(3/2,2)$ 这个开区间里三个渐近不等式同时成立；一旦谁想把常数写死到具体 $L$，`07:18` 的"Take $L$ sufficiently large"就没有可核验的内容。我不会把 D41 或 D56 的任何推导搬进本文，两者共用词汇表也几乎为零：布尔电路里的"深度"与 HF 集合论里的"秩"是不同东西，本文第 0 节那条"秩无界"讲的是后者。

## 16 待定问题与分岔回看

我留着的七个问题，按我能否自己回答排序。第一，`Theorem 1` 的"full"到底多 full。论文 `00:21-24` 用"established equivalent formulation by interpretation programs"把语义外包给 gkps2015/gsw2020；我没有在 tex 里看到对"多项式界"的精确形式，只在 `06:57-59` 看到 $h+\sum_j|V(A_j)|$ 被固定多项式界住这一条。若某套 CPT 定义按"递归出现对象数"计（`00:18-19` 的措辞），两套界是否等价我不敢断。[推测] 论文押注它们等价。第二，`03:238` 那句 $2Lad\le2Lh^2$ 的真实系数是 $1/2$，我第 7 节算过；若把 `Proposition 8` 收紧，$\alpha$ 区间下界会从 $3/2$ 往下移吗？答：不会，下界由 $s^{3/2}$ 的 $L^{3/2}$ 决定，而 $s$ 对 $L$ 的一次性来自 `Lemma 7` 的 $2Lt$，与 $h^2$ 的常数无关。所以常数的松紧在这里不承重，这是回看之后我唯一确定能立刻答的。第三，$v_*$ 的任意选取：`02:149` "Fix any vertex $v_*$"，若 $v_*$ 取在角上（$d=2$）与取在内部（$d=6$），$N_L$ 不变（`Lemma 4` 已含），但 `Proposition 11` 里 $w=v_*$ 的空赋值相容性、以及巨人里的路径 $p_J$ 长度，都会随 $v_*$ 位置变；tex 只说"充分大 $L$"，没量化这个依赖。[推测] 无实质影响，但这是我愿意在 Lean 里核的一处。第四，`Corollary 3` 的"非空"限制与 `$Q(\varnothing)$ 为真`"之间，$\mathrm{FPS}_3$ 的算子在空结构上的语义我查不到 tex 内的说明；若某文献把 solvability 算子在空指标集上定义为真，`08:5` 的限制就不必要。第五，`05:354-358` 的外部枚举选择：它是元层选择，但"选择"正是选择无理论要审的动作；`01:12-14` 引用 BGS 的动机句"rather than arbitrary choices of an ordering"，而本文证明自身用了 $\mathbb N$ 上枚举的选取。我认为这合法（证明在 ZFC 里做、程序在 CPT 里跑），但论文没有一段把这个层次差别说透，这是我的一个不满。第六，`01:75-82` 关于 Pago 2023 的"假设不同，故其论证不 Establish 本文意义上的不可定义性"这条评断是我全文最依赖的一段他人工作边界声明，我无法独立核对 XOR 电路那侧的技术假设，我只能按论文口径接受并标注。第七，全文没有一条 definition 环境：`main.tex:18-21` 注册了 definition 与 remark 两个共享计数器的环境，正文一次都没用，于是 $K$-支持（`03:84-89`）、molecule 与 form（`05:132-155`）、membership-transitive（`03:250-252`）、giant component（`04:96-97`）、charge（`02:77-83` 的散度右端）这些承重术语只以散文出现。后果落在 Lean 比对上：该目录有 444 个 `def` 与 67 个 `abbrev`，却没有任何编号锚点可与之对齐，我在第 14 节只能靠名字猜对应物（`IsGiant`、`palette`、`boxConstant`、`quantitative_homogeneity`），这类比对的可核验度明显低于定理对定理的那类。[推测] 作者不注册 definition 环境是为了让 21 条编号条目全部是可引用的断言，并非让目录里出现一批没人引用的名字；代价就是术语没有地址。

回看分岔：如果第 3 节那次"只用中心流 $K$"没有被我否掉，我会走到 `Proposition 8` 里 $U=\{0\}$、$a=0$、$t\le0$、`Lemma 7` 给出支撑 0 的退化结论，即只有满轨道 $\le1$ 的对象（$H$-不变对象）有短支持，那只能排除定义**平凡**查询的程序。如果 `Lemma 7` 的 $i_0$ 鸽巢缺失，$s$ 多一个 $L$，齐性宽度 $O(L^{9/2}\mathrm{polylog})$，$M=L^{7/4}$ 永远不够，第 8 节整个塌掉，此时唯一出路是把 $\alpha$ 推到 $\ge9/2$，而那与 $M^{3/2}=o(L^3)$ 的 $\alpha<2$ 直接冲突。这个冲突说明 $i_0$ 那一步不是优化，是可行性条件，我最初把它当成"论文顺手做的常数改进"是读错了。

## 17 离场清点

我带走的形状：一个把"轨道大小"当唯一复杂度度量、把"秩"彻底赶下台的支持定理，加上一台用 von Neumann 序数当阶段标签、用整类 payload 避开代表选择的编码机。`00:203-211` 的最后一段（先定程序与 $q,m$、再取 $L$）是我认为整篇最容易被误读成非一致性的地方，而 `06:360-362` 那句免责声明把它的辩护压缩到了极限。

我核过、且愿意署名的数字：tex 侧 9 个分片、2102 行正文、21 条编号条目（Theorem 2 条、Proposition 5 条、Corollary 2 条、Lemma 12 条，共用一个计数器）、`proof` 环境 21 个、无 definition 环境、无 remark 与 example 环境；`main.tex` 55 行、`references.bib` 324 行、`figures\` 两个 tikz 分片。Lean 侧 26 个文件、18461 行、theorem 376、lemma 337、def 444、abbrev 67、structure 22、inductive 24、instance 22、noncomputable def 24、example 1、axiom 0、opaque 0、sorry 0、`#print axioms` 0 次、tactic 频次最高为 have 1372 与 exact 627。

我承认最薄弱的三处：第 9 节对 `Lemma 18` 的处理只有摘述，$n/h$ 等势那段（`05:324-343`）我只复核到"纤维同大小"就停了，没有把 $h$ 的分型求和逐项展开，若那里出错 `Theorem 14` 的双射不成立；第 12 节对 `08` 节 solvability 编码的复述是压缩的，$x^1,x^2,z,v$ 四列如何恰好拼出 $-C$ 我只验证到"系数为 0 或 1"这一层；第 15 节与 D41/D56 的分界是就对象与度量作的分类，没有逐一核对三篇共用的任何技术引理，因此它是口径声明，不含验证成分。另有两处我无法在 tex 内闭环：解释刻画的多项式资源定义（第 16 节问题一）与 halt 判据在两侧对齐时是否需要持久性（第 11 节末我的 min 论证）。这两条我留给下一轮，且下一轮第一件事应该是把 `06:57-59` 与 gsw2020 的 Theorem 18 原文对齐，并非继续往 `05` 节深挖。
