# D76 非平凡 Markov 型迫使超反身：我怎么把"p>1"读成一条必须造出的弹道行走

对象论文：`Nontrivial Markov Type Forces Superreflexivity`（2026-09-23，OpenAI）。
TeX 源：`E:\math\preprints\Nontrivial-Markov-Type-Forces-Superreflexivity-September-23-2026\build\`，主文件 `main.tex` 实测 1021 行、43478 字节；`references.tex` 4115 字节（16 条文献）；正文在第 455-465 行 `\input` 了一个图 `figures/chart-transport.tex`，纯示意，不承载论证。下文所有引文行号都是 `main.tex:行号`，逐字核对过。
Lean：`E:\math\lean\OAI\Analysis\MarkovType\`，实测 212 个 `.lean` 文件、`wc -l` 合计 27339 行，零 `sorry`，零自定义 `axiom`；中心仓库条目两处：`E:\math\lean\formalization.yaml:462-464`（论文书目，type: article）与 `formalization.yaml:1302-1304`（comparator 配置 `ComparatorChallenges/MarkovType.json`，被认证声明 `OAI.MarkovSuperreflexivity.hasNontrivialMarkovType_iff_hasEquivalentUCNorm`，入口文件 `OAI/Analysis/MarkovType/Main.lean`，实测 43 行）。
本篇与 D72（L1 的 Daugavet 子空间精确渐近模数）只在"Banach 空间几何+渐近一致凸性"这个学科标签下相邻：D76 的全部机制围绕 Markov 型不等式与超反身性的刻画，D72 围绕 Daugavet 性质下的模数计算，两条线不共享任何输入；写作期间我没有读 D72 的稿子，也不引用其任何结论。同样，`D13-有界树宽图的L1嵌入.md`（割测度+粒子+锚的树分解嵌入线）与 `D26-加倍Hilbert子集无双Lipschitz有限维嵌入.md`（doubling 集反例的微分流水线）都不是本篇输入：D13 处理固定图族的 L1 失真上界，本篇处理 Banach 目标空间的结构性质；D26 造的是度量空间反例，本篇造的是 Banach 空间反证。三篇共享的只有"有限表示性"这个词的两种不同用法，我在正文里不复述任何一篇的推导。

记号与论文一致：$X$ 是实 Banach 空间，$\|\cdot\|$ 是原范数，$N$ 是 $c_{00}$ 上的序范数，$b_i$ 是第 $i$ 个坐标向量，$\cS$ 是字母集，$h_s$ 是直线上的定向同胚，$\TV$ 是全变差距离。论文定理环境用同一计数器（`main.tex:14-21`），所以编号是跨节连续的：Theorem 1.1、Lemma 2.1、Proposition 2.2、Lemma 2.3、Lemma 3.1、Proposition 3.2、Lemma 4.1、Lemma 4.2，共 8 个编号条目（1 定理+4 引理+2 命题+附录与主定理各一段带标题证明；`definition` 环境声明了但全文没有使用，定义都以行文给出）。关键未编号论证我另列：§1 的策略段（`main.tex:144-185`）、§2.3 的失真传递段（`main.tex:270-278`）、§2.4 主证明（`main.tex:335-351`）、§5 的 Step 1-5 行走装配（`main.tex:624-825`）、附录 A 的 Step 1-4 范数构造（`main.tex:841-1015`）。

## 0 我进场时手里有什么

论文的靶子一句话（`main.tex:58-64`，abstract 逐字）：

```tex
We prove that every real Banach space with Markov type $p>1$ is
superreflexive. Together with the known converse, this characterizes
superreflexivity by nontrivial Markov type. This answers Naor's question:
every real Banach space with nontrivial Markov type admits an equivalent
uniformly smooth norm.
```

主定理的正式陈述（`main.tex:90-93`）：

```tex
\begin{theorem}\label{thm:main}
Every real Banach space with Markov type $p$ for at least one $p>1$
is superreflexive.
\end{theorem}
```

三个输入定义我要先把量化钉死，因为后面每一步都在动它们。平稳可逆（`main.tex:68-73`）：有限状态链 $(Z_t)_{t\geq0}$，转移矩阵 $P$，初始分布 $\pi$，条件是 $\pi_iP_{ij}=\pi_jP_{ji}$ 对一切 $i,j\in S$。Markov 型（`main.tex:74-79`，即 `eq:markov-type`，76 行起）：范数空间 $X$ 具 Markov 型 $p>0$、常数 $0<K<\infty$，若对每个这样的链、每个 $f:S\to X$、每个整数 $t\geq1$，

```tex
 \E\norm{f(Z_t)-f(Z_0)}^p
 \leq K^p t\,\E\norm{f(Z_1)-f(Z_0)}^p.
```

超反身（`main.tex:80-88`）： admits 一个等价一致凸范数；等价指 $a\|x\|\le|x|\le b\|x\|$，一致凸指对每个 $\epsilon\in(0,2]$ 存在 $\delta>0$ 使 $|x|,|y|\le1,\ |x-y|\ge\epsilon$ 蕴涵 $|(x+y)/2|\le1-\delta$。注意一致凸定义里 $\epsilon$ 的定义域被截在 $(0,2]$，这个 2 是单位球上两点距离的自然上限，它在我核对 Lean 口径时成为一个实质的对齐点（第 13 节）。

量化结构写清楚是：$\forall X\,[\,(\exists p>1)(\exists K>0)\,\mathrm{MT}(p,K,X)\Rightarrow\text{超反身}\,]$。$p$ 与 $K$ 都是存在量词、写在蕴含前件里，所以我在反证时可以任意固定一个满足 $1<p\le 2$ 的 $p$（Markov 型对 $p$ 是向下封闭的：$L^p$ 范数单调性给出若具型 $p$ 则具型 $q<p$、常数不改 $K$，这一步论文没写，是我自己按 Jensen 核实的标准事实，属于常识，并非论文结论）。真正的自由度在于：我手里只有一个对所有平稳可逆链一致的 $p$ 阶线性上界，$X$ 的任何具体表示都不能用。

背景段（`main.tex:95-124`）给出的版图，我进场时按"哪些能借、哪些是陷阱"分了两栏。能借的：James--Enflo 刻画 `eq:superreflexive-characterization`（`main.tex:127-134`），"$X$  admits 等价一致凸范数 ⟺ 每个有限表示于 $X$ 的 Banach 空间自反"；有限表示性定义在 `main.tex:135-138`：对每个有限维 $E\subseteq Y$ 与每个 $\eta>0$ 存在单射线性 $T:E\to X$ 使 $\|T\|\|T^{-1}\|<1+\eta$。其余外部工具论文只点名三个：Hahn--Banach、有限 Ramsey 定理、有限维 Goldstine（`main.tex:139-142`，且声明 Goldstine 会被现证，确实在附录 Step 1 里现证了）。是陷阱的：Rademacher 型这条直觉路被 James 的经典反例直接封死（`main.tex:110-113`）："Ordinary Rademacher type, which controls sums with independent random signs, does not suffice for this conclusion: James constructed nonreflexive spaces of Rademacher type $2$"。Mendel--Naor 的 Markov 凸性（`main.tex:106-108`）是"共享过去再独立演化"的链比较，比平稳强得多，论文的定位句是 Theorem 1.1 确定了"普通 Markov 型单独能检测到什么"，这句话我读作：证明里不能偷偷用任何超出平稳可逆的假设。

Naor 问题的位置（`main.tex:119-124`）：NPSS 证明了 $p$ 次幂型一致光滑蕴涵 Markov 型 $p$（$1<p\le2$），Pisier 的幂型 renorming 定理给每个超反身空间某个非平凡 Markov 型，且 Markov 型在等价范数下不变；Naor 问（[Naor, Question 4]）是否存在具非平凡 Markov 型但没有等价一致光滑范数的空间。由于"等价一致光滑范数存在"与"等价一致凸范数存在"都恰好刻画超反身（论文引 Pisier），Theorem 1.1 把问题回答为否，同时补全刻画。我一开始以为这篇要亲手造光滑范数，读完 `main.tex:121-124` 才发现造范数这活完全外包给了经典定理，这是第一个让我调整预期的地方。补记（修补批）：文末新增的《台账补表》《视角差异勘误》《本节自检》三小节，位置栏全部出自 `E:\math\preprints\Nontrivial-Markov-Type-Forces-Superreflexivity-September-23-2026\build\` 下的 main.tex、references.tex 与 figures/chart-transport.tex，PDF 与 typst 分片一概没采信；Lean 侧本轮只回读队列一处，即 `.tools/lean_queue.txt` 的队列第 91 行号逐字等于目录名 Nontrivial-Markov-Type-Forces-Superreflexivity-September-23-2026，与本节首段那条 build 路径同源。

## 1 我先试过的三条路，以及它们各自卡死的机械位置

### 1.1 路线甲：把 Markov 型当上界，直接测树

Markov 型不等式的左边是 $t$ 步位移的 $p$ 阶矩，右边是线性 $t$。想把 James--Enflo 的反面用掉，就得先造一个"违背线性"的链。Bourgain 的树刻画（`main.tex:102-103`）说超反身 ⟺ 有限完全二叉树的可嵌入性失真发散，我最初的计划是：反设 $X$ 不超反身，则某个有限表示于 $X$ 的 $Y$ 里深度 $n$ 的二叉树失真一致有界；把"从根向随机叶子走"的链搬进去，$t$ 步位移就是叶子的深度函数。这条路卡死在两个机械位置。其一：根到叶的下行随机游走不是可逆链（父到子的转移测度与子到父不对称），Markov 型不等式根本不覆盖它；把它 symmetrize 成图上简单随机游走后，可逆性有了，但位移立刻退化：可逆马尔可夫链的势函数增量是鞅差，$\E\|Z_t-Z_0\|^2$ 至多线性增长，在 Hilbert 空间里恰好是 $\sqrt t$ 量级的位移，而 Hilbert 空间具 Markov 型 2，任何 $p\le2$ 的 Markov 型都不排斥平方根增长。要让 $p$ 阶矩违背 $K^p t$，位移必须以正概率呈线性弹道，树失真给出的"根叶距离有界"是 $O(1)$ 失真下的对数结构，给不出弹道。其二：即使失真界拿到了，它控制的是叶间距离，而 Markov 型只看得见一条轨迹的两端。这两点合起来意味着：树的路线天然停在"对数"和"平方根"的量级上，跨不到"$n^p$ vs $n$"的那道坎。这一段是我自己的路线评估，论文没有讨论过树路线的失败，我标 [推测] 于任何超出上面量级论证的细节。

### 1.2 路线乙：把它当型不等式用

Markov 型测试所有平稳可逆链，其中包括 $\{-1,+1\}$ 上的 Bernoulli 移位这类"独立增量"链。取 $f$ 为坐标和映射就能从 `eq:markov-type` 推出 $X$ 有 Rademacher 型 $\min(p,2)$ 及其常数。我认真想过只靠型理论推反射性：型 $p>1$ 的空间难道不自反吗。答案是否，而且论文在 `main.tex:110-113` 就把这堵墙立在我面前：James 1978 构造了非反射但 Rademacher 型 2 的空间。机械原因我后来想明白了：型不等式对独立符号增量族成立，而独立增量链的可逆平稳测度是乘积测度，位移是"无漂移"的，它测不出空间里"几乎单调"的序列结构；James 空间的失败模式恰恰是准单调序列上的泛函达不到上确界，这种结构独立符号扰动完全看不见。Markov 型比 Rademacher 型强的地方只剩一条：它还测试带强依赖、带停留结构的链。所以任何证明必须用到链的依赖结构，也就是把"非自反"翻译成某个有限链上带记忆的行走。这个判断后来和论文的策略段完全对上了（`main.tex:144-157`：从非超反身造 $c_{00}$ 上 spreading 范数 $N$，相邻同符号系数合并保范或至少不增，正是把"准单调结构"编码进范数的 Brunel--Sucheston 手法）。

### 1.3 路线丙：亲手造一致光滑范数

第三条试过的路是把 Markov 型不等式取遍所有链、写成对 $f$ 的 supremum，然后照 NPSS 的逆向（光滑 ⟹ 型）去造范数：比如令 $|x| = \sup\{\ldots\}$ 或走 Pisier 的光滑模数积分。卡死点：NPSS 方向用的核心工具是对自由滤迹鞅的极大不等式，而我手里的不等式只对平稳可逆链成立，一个自由滤迹的鞅差序列没有理由保持可逆性；这正是 Mendel--Naor 要引入 Markov 凸性（带分叉历史的链）的原因（`main.tex:106-108` 的对比我读作有意点出这个缺口）。手上没有分叉条件，鞅路线就是断的。于是我把"造范数"这个目标整个放弃，换成反证：只要证明非超反身 ⟹ 存在某个平稳可逆链违背 `eq:markov-type`，具体范数的存在性让 James--Enflo--Pisier 的经典等价去兜底。论文策略段第一句就是这个口径（`main.tex:145`："We argue by contradiction"）。

### 1.4 关键转折：违规者必须是"边上的弹道"

三条路都指向同一个必要条件：要违背 Markov 型，需要在某个平稳可逆链上造一个量，其 $p$ 阶矩按 $n^p$ 增长而单步成本保持 $O(1)$。我最初以为这就是造一个有漂移的链，随即发现状态链里漂移是幻觉：可逆平稳链中任何势 $f:S\to X$ 的单步期望增量为零（对 $i$ 求和 $\pi_i\sum_jP_{ij}(f(j)-f(i))$，用细致平衡换序即得零和），所以 $\E\|f(Z_n)-f(Z_0)\|^p$ 想达到 $n^p$ 必须让"每步增量"本身在范数下有长轨迹的相干性。范数空间不是 $\R$，鞅差可以同向叠加而不抵消，这正是 Banach 几何进场的缝隙。真正把缝隙撑开的是论文的 marked chain 装置（`main.tex:229-243`）：标签 $g$ 定义在有向边集 $\mathcal E$ 上、只要求奇性 $g(e^*)=-g(e)$，而**不要求** $g(e)=f(e^+)-f(e^-)$。我在读到 `main.tex:175-177` 那句 "An edge label need not be the difference of values assigned to its two chart states" 时停了一下：这就是弹道的来源，边上自由度绕过了状态势的零漂移定律。而它绕过去之后必须还债：Markov 型只认状态势。论文还债的方式是格提升（`main.tex:180-182` 与 Lemma 2.3 证明）：把走过的有向边数记成 $\Z^r$ 的整点坐标，势 $\Phi(z,a)=\sum a_jg(e_j)$ 在内部恰以 $g(e)$ 为增量，在边界被拒的转移变成停留，可逆性保持，代价是 $n$ 步内不撞边界的概率 $\alpha_R\to1$。读到这里我的整个图景定型了：证明等于三块积木，(甲) 从非超反身榨出一个合并收缩的 spreading 范数 $N$；(乙) 在 $N$ 下造一个平稳可逆 marked chain，使 $n$ 步边标签和以概率 $\ge3/20$ 范数 $\ge n/24$；(丙) 格提升把 (乙) 塞进 Markov 型不等式，得 $(3/20)(n/24)^p\le K^p n$，$p>1$ 时两边对 $n$ 的增长率矛盾。$p>1$ 在全文只出现一次，就在最后这条不等式上；前面所有构造对任意 $p>0$ 都成立。这个"延迟使用假设"的形态和我路线甲乙丙里假设会被反复使用的直觉完全相反，是我这次读下来最大的结构调整。

## 2 §2 的三输入骨架与最终矛盾：先把账算平

论文把归因写得很干净（`main.tex:189-192`）："The reduction has three inputs. Lemma 2.1 supplies an ordered norm from nonsuperreflexivity, Proposition 2.2 constructs a walk in that norm, and Lemma 2.3 transfers the Markov type inequality to its odd edge labels." 我把三个输入的陈述逐字对齐（行号即 `main.tex`）：

Lemma 2.1（`main.tex:207-220`）：若实 Banach 空间 $X$ 不超反身，则存在 $c_{00}$ 上的范数 $N$ 满足 (i) spreading 不变（`eq:spreading`，200-204 行：$N(\sum_{i=1}^ma_ib_i)=N(\sum a_ib_{k_i})$ 对 $k_1<\cdots<k_m$，即插入删除零项保范）；(ii) 相邻合并收缩（`eq:merge`，213-216 行：把 $a_i,a_{i+1}$ 换成 $a_i+a_{i+1}$ 后 $N$ 不增）；(iii) 每个初始坐标 span 装备 $N$ 后以任意接近 1 的失真线性嵌入 $X$。

Proposition 2.2（`main.tex:245-258`）：设 $N$ 是 spreading 不变且相邻合并收缩的范数。对每个整数 $n\ge1$，存在有限平稳可逆 marked chain 与取值于有限坐标 span 的奇标签 $g$，使每条边 $N(g(e))=1$，且对链的前 $n$ 条边 $E_1,\ldots,E_n$，

```tex
 \Prob\left\{N\left(\sum_{i=1}^n g(E_i)\right)
                 \geq\frac n{24}\right\}\geq\frac3{20}.
```

`main.tex:260-262` 特别注明：链和坐标维数可以依赖 $n$，数值常数 $1/24,3/20$ 不依赖。

Lemma 2.3（`main.tex:280-292`）：设 $V$ 具 Markov 型 $p$、常数 $K$；对满足 `eq:edge-balance`（$\pi(e^-)q(e)=\pi(e^+)q(e^*)$，237-239 行）的有限 marked chain 与奇标签 $g:\mathcal E\to V$，前 $n$ 边满足 `eq:odd-markov`（286-289 行）$\E\|\sum_{i=1}^n g(E_i)\|^p\le K^p n\,\E\|g(E_1)\|^p$；标签的有限 span 若有限表示于具 Markov 型 $(p,K)$ 的空间，结论同样成立。

主证明（`main.tex:337-351`）只把三块拼起来：反设 $X$ 具型 $p>1$、常数 $K$ 且不超反身；Lemma 2.1 给 $N$；对每个 $n$ 用 Proposition 2.2 得链与 $g$；把 Lemma 2.3 的第二口径（经有限 span 的失真传递，`main.tex:270-278$ 解释缩放下嵌入后常数 $(1+\eta)K$ 再令 $\eta\downarrow0$）用到 $V=(\mathrm{span},N)$ 上，$N(g(e))=1$ 使右边 $=K^p n$，左边按 `eq:contradiction`（345-349 行）：

```tex
 \frac3{20}\left(\frac n{24}\right)^p
 \leq\E N\left(\sum_{i=1}^n g(E_i)\right)^p
 \leq K^p n.
```

`main.tex:350`："$n$ 是任意的、$K$ 固定，这与 $p>1$ 矛盾"。我自己核对增长率：左边 $\frac{3}{20\cdot24^p}n^p$，右边 $K^pn$，比值按 $n^{p-1}$ 发散，所以固定 $p,K$ 后取 $n>(K^p\cdot20\cdot24^p/3)^{1/(p-1)}$ 即矛盾。这个数论文没写，我按它反推出的依赖率：所需 $n$ 对 $K$ 的敏感度是 $K^{p/(p-1)}$，对 $p\downarrow1$ 指数爆炸，这解释了为什么整条线在 $p=1$ 处必然断掉。$p=1$ 时左边线性、右边线性，只能得到常数比较 $3/(20\cdot24)\le K$，即 Markov 型 1 对任何具常数 $K\ge1/160$ 的空间都无信息；这与常识一致：每个空间都具 Markov 型 1（三角不等式+平稳增量对可逆链给出 $\E\|f(Z_t)-f(Z_0)\|\le t\,\E\|f(Z_1)-f(Z_0)\|$，见 [推测] 我的补证）。所以"$p>1$"这一字之差承载了定理的全部刚性，而证明把这份刚性延迟到最后一步使用，前四个节的机器全是 $p$ 无关的。

`main.tex:353-358` 收尾登记了三件纪律：所有链有限且从可逆平稳测度起步；链的大小与到 $X$ 的嵌入可以随 $n$ 变；只有 $K$ 必须一致。然后说"剩下就是构造 Proposition 2.2 的行走，而 Lemma 2.1 的证明推迟到附录"。我的阅读顺序照论文的依赖走：先 §3 的有限序平均（Lemma 3.1）与可逆 chart 传输（Proposition 3.2），再 §4 的约化字与两级引理（Lemma 4.1、4.2），再 §5 装配（Proposition 2.2 的 Step 1-5），附录 A（Lemma 2.1 的构造）逻辑上在装配之前、位置上在最后，我把它放在装配之前拆（第 9 节），因为它只被 $N$ 的三条性质供料，装配阶段只消费这三条性质。Lemma 2.3 的格提升比这两块都短，我按 tex 顺序先拆它（第 5 节），但把它的"为什么必须是 marked chain"留在 1.4 已经交代。

## 3 先钉底座：有限 marked chain 的术语层（tex 229-243）

逐字引 `main.tex:231-243`：

```tex
A \emph{finite marked chain} has a finite state set
$S$ and a finite set of oriented edges $\mathcal E$. An edge $e$ has
source $e^-$, target $e^+$, and reverse $e^*$, where star is an involution
and $(e^*)^-=e^+$, $(e^*)^+=e^-$. The probability of choosing $e$ from
its source is $q(e)$, with $\sum_{e:e^-=z}q(e)=1$ for every state $z$.
We require a probability distribution $\pi$ satisfying
\begin{equation}\label{eq:edge-balance}
 \pi(e^-)q(e)=\pi(e^+)q(e^*).
\end{equation}
The state chain is then stationary and reversible when started in $\pi$.

Marks allow several distinct edges between the same states.
A labeling $g$ is \emph{odd} if $g(e^*)=-g(e)$ for every edge.
```

四个设计决定逐个问"为什么是这个形状"。第一，转移概率写在边上（$q(e)$，出边总和为 1）而不在状态对 $(i,j)$ 上：mark 允许两状态间多条边（`main.tex:242`），于是"选哪条边"和"去哪个状态"解耦，标签可以挂边上而状态链照常马尔可夫。第二，细致平衡取边形式 `eq:edge-balance`：把"边被选中的平稳测度 $\pi(e^-)q(e)$ 在取反下不变"作为公理。我验证过它恰是状态链细致平衡对每条边的提升：把同 $(i,j)$ 的边求和即回 $\pi_iP_{ij}=\pi_jP_{ji}$，反之不然，所以边版严格更强、也正好是 Lemma 2.3 证明里逐边验证可逆性所需的形式。第三，star 是对合且源汇互换，允许自反边（$e^*=e$）；`main.tex:243` 的奇性对自反边直接强制 $g(e)=0$，Lemma 2.3 证明 `main.tex:298` 正这样处理（"A fixed point of star has label zero and is given displacement zero"）。第四，奇性 $g(e^*)=-g(e)$ 是标签层对可逆性的镜像：走 $e$ 记 $+g(e)$，走 $e^*$ 记 $-g(e)$，同一段轨迹倒着走的标签和恰好反号，格提升的势函数才能全局定义。

候选失败路线核对 [推测]：我试过把标签定义成状态函数差 $g(e)=f(e^+)-f(e^-)$（coboundary），那么 $\sum g(E_i)=f(Z_n)-f(Z_0)$ 直接落在 Markov 型不等式里，Proposition 2.2 的全部构造就不必要了。停住点：`main.tex:175-177` 明确声明标号"need not be the difference of values"，而 1.4 的零漂移定律给出原因，coboundary 标签在可逆链下的位移至多是鞅差量级（$p$ 阶矩线性），撞不出 $n^p$ 下界，弹道必须住在边的商自由度里。

## 4 失真传递段（tex 270-278）：常数为什么能带着 $(1+\eta)$ 走

逐字引 `main.tex:270-278`：

```tex
The Markov type inequality passes to normed spaces finitely representable
in its target, with the same constant. More precisely, only the span of
the finitely many values of $f$ needs to admit embeddings with distortion
arbitrarily close to $1$. After scaling such an embedding $T$, we have
\[
 \norm{x}\leq\norm{Tx}_X\leq(1+\eta)\norm{x},
\]
so applying \eqref{eq:markov-type} in $X$ gives its counterpart in the
original target with constant $(1+\eta)K$. Let $\eta\downarrow0$.
```

补完中间步骤：设 $V$ 有限维、$\|x\|\le\|Tx\|_X\le(1+\eta)\|x\|$。在 $X$ 中对链 $f'=T\circ f$ 用 `eq:markov-type`：$\E\|Tf(Z_t)-Tf(Z_0)\|_X^p\le K^p t\,\E\|Tf(Z_1)-Tf(Z_0)\|_X^p$。左端用下界 $\ge\E\|f(Z_t)-f(Z_0)\|^p$，右端用上界把 $(1+\eta)^p$ 提到外面，得 $V$ 上常数 $(1+\eta)K$。$\eta$ 任意性收掉。这段的两个隐含前提我都核了：其一，$T$ 只定义在 $f$ 取值张成的有限 span 上，这正是"only the span of the finitely many values"的意思，也解释了 Proposition 2.2 里"$g$ 在有限坐标 span 中"（`main.tex:248-249`）是定理陈述的一部分，并非技术噪音；其二，把 $T$ 缩放至下界恰为 1 总做得到。Lemma 2.1 (iii) 的"初始坐标 span 以失真 $1+\eta$ 嵌入 $X$"在这里被消费；标签只用到前 $B$ 个坐标（chart 取值于 $\{1,\ldots,B\}$），有限性有保证。

常数账：$\eta$ 的消耗是全额的，一次失真传递花 $(1+\eta)K$；附录 Step 3 构造 $N$ 时失真已经吃了 $(1+\eta)^3$（`main.tex:977`）。两处都不进主不等式的显式常数，反证里靠 $\eta\downarrow0$ 归零，所以 $24$、$3/20$ 这些数值和嵌入失真完全解耦。这也是"链与嵌入可依赖 $n$"（`main.tex:261-262`、353-355）不破坏 $K$ 统一性的原因：失真只是任意小的乘性扰动，矛盾对任何固定 $K$ 仍成立。

## 5 Lemma 2.3（奇边标签）：格提升的逐字重建

`(a)` 陈述逐字（`main.tex:280-292`）：

```tex
\begin{lemma}[Odd edge labels]\label{lem:edge-labels}
Suppose $V$ is a normed space of Markov type $p$ with constant $K$.
For a finite marked chain satisfying \eqref{eq:edge-balance}, let
$g:\mathcal E\to V$ satisfy $g(e^*)=-g(e)$.
If $E_1,\ldots,E_n$ are its first $n$ edges, with initial state distributed
as $\pi$, then
\begin{equation}\label{eq:odd-markov}
 \E\norm{\sum_{i=1}^n g(E_i)}^p
 \leq K^p n\,\E\norm{g(E_1)}^p.
\end{equation}
The same conclusion holds if the finite span of the labels is finitely
representable in a space of Markov type $p$ with constant $K$.
```

`(b)` 证明重建（`main.tex:294-333`，逐句对位）。第一步，商掉方向：每个二元星轨道 $\{e,e^*\}$ 选代表 $e_j$，$1\le j\le r$，取 $\Z^r$ 坐标向量 $u_j$；$e_j$ 位移 $+u_j$，$e_j^*$ 位移 $-u_j$，星不动点位移 $0$。$r=0$ 时所有标签恒零、无事可证（`main.tex:299`），这个退化分支 Lean 侧要单独走，我回查过。第二步，取整数 $R>n$，$Q_R=\{-R,\ldots,R\}^r$。提升链状态集 $S\times Q_R$：从 $(z,a)$ 先按原规则选边 $e$（概率 $q(e)$），再尝试格移动 $\pm u_j$，若出界则原地停留。第三步，可逆性验证：$\pi\otimes\operatorname{Unif}(Q_R)$ 下，被接受的转移 $(z,a)\to(z',a+u_j)$ 的边测度 $=\pi(z)q(e)\cdot\frac{1}{|Q_R|}=\pi(z')q(e^*)\cdot\frac{1}{|Q_R|}$，恰等于反边测度，靠的正是逐边的 `eq:edge-balance`；被拒绝的转移全是自环，自环的细致平衡恒显然。所以"rejections add only self-loop probabilities"（`main.tex:306`）的机制是：拒绝不产生任何非对角质量，不破坏已有平衡。第四步，势 $\Phi(z,a)=\sum_1^r a_jg(e_j)$（`main.tex:311`）。接受 $e_j$ 时增量 $g(e_j)$；接受 $e_j^*$ 时增量 $-g(e_j)=g(e_j^*)$，奇性在此兑现；拒绝时增量 $0$。单步期望成本 $\le\E\|g(E_1)\|^p$（`main.tex:315`，拒绝贡献 $\|0\|^p=0$）。第五步，耦合：初始格点在 $Q_{R-n}$ 内时任意 $n$ 步序列每坐标至多移动 $1$、永不出界，全部接受；用"同一列候选边直到首次拒绝"把提升行走钉在原 marked 行走上，内部事件与原轨迹独立（原轨迹随机性只在选择边，格点随机性来自均匀初始坐标），概率即 `main.tex:322` 的

```tex
 \alpha_R=\left(\frac{2(R-n)+1}{2R+1}\right)^r\longrightarrow1.
```

我核了这个分式：边长 $2R+1$ 的格立方体内，"$n$ 步不触界"的起点集合是边长 $2(R-n)+1$ 的内立方，坐标独立均匀，比值取 $r$ 次方。在该事件上 $\|\Phi(\text{终})-\Phi(\text{初})\|=\|\sum_1^ng(E_i)\|$。于是提升势的 $n$ 步期望成本 $\ge\alpha_R\E\|\sum g(E_i)\|^p$（`main.tex:324-325`）。第六步，对 $\Phi$ 用 `eq:markov-type`（$t=n$）得 `main.tex:328-329` 的夹逼式，令 $R\to\infty$ 收出 `eq:odd-markov`。末口径由第 4 节失真传递接上，"enlarging the cube does not enlarge the span of the labels"（`main.tex:332`）保证提升链的势仍住在同一有限维 $V$ 里。

`(c)` 常数与阶数的机械理由。$R>n$ 必须严格：若 $R=n$，内立方退化成边长 $1$ 的单点集，$\alpha_R=(2R+1)^{-r}\to0$（当 $r$ 随构造增长），事件救不回来；正确用法是先把链与 $r$ 固定，再让 $R\to\infty$，两个极限的次序不可交换，这是全引理唯一的分析性动作。每步格位移的 $\ell^\infty$ 范数 $\le1$ 决定了 $n$ 的裕量恰好够。$p$ 次幂只出现在成本记账上：接受/拒绝二择一时用逐点界，并非 Minkowski，所以 $p$ 可以是任何正数；`main.tex:281` 只写"Markov type $p$"、不带 $p>1$，与 1.4 的"延迟使用假设"吻合。$\E\|g(E_1)\|^p$ 里 $E_1$ 从平稳测度取：`eq:edge-balance` 保证一步边分布就是 $\pi(e^-)q(e)$，这正是 Markov 型不等式右端的分布。

`(d)` 三条候选失败路线与机制性停住点。其一，用环面 $\Z^r/M\Z^r$ 做无拒绝提升：转移处处接受、可逆性依旧、$\alpha_R$ 消失，但 $\Phi$ 模掉 $M\Z^r$ 后不再是 $V$ 值良定义函数，比较 $\|\Phi(\text{终})-\Phi(\text{初})\|_V$ 与 $\|\sum g(E_i)\|_V$ 的那一步失效，绕环的圈会吞掉范数下界 [推测]。其二，无限格 $S\times\Z^r$ 直接提升：Markov 型按定义（`main.tex:68`）只覆盖有限链，无限链没有资格进不等式，`eq:markov-type` 的期望也无从定义（无限状态上的平稳测度未必可归一化）；有限化的全部成本就是 $\alpha_R$，这是论文用 30 行换掉的东西。其三，放弃奇性、给 $e$ 与 $e^*$ 独立标签：势增量在倒走时不再是 $-g(e)$，$\Phi$ 与边和脱钩；同时同一几何边的两个方向携带不同位移向量后，$\pi\otimes\operatorname{Unif}$ 的逐边平衡验证断链。若想让标签"几乎奇"（差一个 coboundary），可以，但 coboundary 部分按 1.4 只贡献鞅差量级，另一部分仍可奇化处理，这条归约论文没写，属于我自己的延伸，标 [推测]。

`(补)` 回看 Proposition 2.2 陈述里的三要素：odd 被势定义消费，有限 span 被失真传递消费，单位边范数 $N(g(e))=1$ 被主证明的右边 $\E\|g(E_1)\|^p=1$ 消费（`main.tex:344` 的 $K^pn$ 就是代进去的结果）。无冗余。

## 6 Lemma 3.1（有限序平均）：Ramsey 用来抹平子元组分布

`(a)` 陈述逐字（`main.tex:377-386`）：

```tex
\begin{lemma}[Finite order averaging]\label{lem:order-averaging}
For every finite ordered set $\Lambda$ and every $\epsilon>0$, there
are an integer $B$ and a probability distribution $\nu$ on charts such
that, whenever $A,A'$ are increasing subtuples of $\Lambda$ of the
same length,
\begin{equation}\label{eq:subtuple-TV}
 \TV\bigl(\operatorname{Law}_\nu(C(A)),
          \operatorname{Law}_\nu(C(A'))\bigr)<\epsilon.
\end{equation}
\end{lemma}
```

chart 定义在 `main.tex:371-373`：有限有序集 $\Lambda$ 到 $\{1,\ldots,B\}$ 的严格增单射；$\TV(\mu,\mu')=\frac12\sum_x|\mu(x)-\mu'(x)|$（375 行）。

`(b)` 证明重建（`main.tex:388-426`）。把所有等长子元组比较对 $(A_\rho,A'_\rho)$ 排成 $1\le\rho\le R$，$R=0$ 时（$\Lambda$ 只有 0 或 1 个点）结论平凡。公共长度记 $m_\rho$，$T_{B,m}$ 是 $\{1,\ldots,B\}$ 里增元组集合。对每个 chart $C$ 造向量 $v_C=(\delta_{C(A_\rho)}-\delta_{C(A'_\rho)})_{\rho=1}^R\in W_B=\bigoplus_{\rho=1}^R\ell_1(T_{B,m_\rho})$，和范数。目标转化：若 $\conv\{v_C\}$ 含范数 $<\epsilon$ 的向量，其凸系数即 $\nu$；第 $\rho$ 个分量恰是 $\nu$ 下 $C(A_\rho)$ 与 $C(A'_\rho)$ 的律之差（带符号测度），其 $\ell_1$ 范数 $=2\TV$，所以每个分量的界 $\le$ 总范数 $<\epsilon$ 给 $\TV<\epsilon/2<\epsilon$。反证路线：设 $\conv\{v_C\}$ 到 $0$ 距离 $\ge\epsilon$，有限维凸集分离给出 $\|f\|\le1$ 的对偶泛函在所有 $v_C$ 上 $\ge\epsilon$。$\ell_1$ 和空间的 dual 是逐分量 $\ell_\infty$：$f$ 是一族 $f_\rho:T_{B,m_\rho}\to[-1,1]$。取 $\delta>0$ 使 $R\delta<\epsilon$。按 bin 染色：对每个 arity $m$，把 $T_{B,m}$ 中元组按"$f_\rho$ 落在哪个宽 $\delta$ 的箱（$\rho$ 遍历 $m_\rho=m$）"染色，颜色数 $\le(2/\delta+1)^R$ 上界，只依赖 $R,\delta$，对一切容许函数族一致。容许染色图案的总数对给定 $B$ 有限（颜色表与定义域都有限），所以对充分大的 $B$ 逐 arity 嵌套应用有限 Ramsey（`main.tex:411-414`："supplies a single sufficiently large $B$ such that, for every such collection of functions, there is a set $H\subseteq\{1,\ldots,B\}$ of size $|\Lambda|$ homogeneous for all these colorings"），存在一个 $H$ 同时对所有容许图案单色。把 $\Lambda$ 增映到 $H$ 得 chart $C$：每个 $\rho$ 下 $C(A_\rho),C(A'_\rho)$ 是 $H$ 里同 arity 元组、同色，$|f_\rho(C(A_\rho))-f_\rho(C(A'_\rho))|<\delta$，于是

```tex
 \abs{\langle f,v_C\rangle}
 \leq\sum_{\rho=1}^R
 \abs{f_\rho(C(A_\rho))-f_\rho(C(A'_\rho))}
 \leq R\delta<\epsilon,
```

与分离性 $\ge\epsilon$ 矛盾。

`(c)` 数值理由。$\ell_1$ 和范数：对偶是逐分量 sup，泛函验证只需要每个 $f_\rho$ 各自 $\le1$，这是把"$\nu$ 同时混合 $R$ 对分布"翻译成"一个向量靠近零"的最省事范数。宽度 $\delta$ 的箱：单色强制两元组落入同一箱，差的保证上界恰是箱宽；$R\delta<\epsilon$ 是把 $\epsilon$ 预算在 $R$ 个比较对之间平均分配，因为 $f$ 的界按分量各吃 $1$。"$H$ 的基数 $=|\Lambda|$"：要装得下整个 chart 像，$\Lambda$ 的每个元素都要有像。颜色数对函数一致有界是整个论证的命门：Ramsey 数可以天文数字地依赖颜色数与 $|\Lambda|$，但不许依赖 $f_\rho$ 的具体取值（连续统里选不出有限子集）。$B$ 的大小此后完全自由，这正是 Proposition 2.2"链大小可依赖 $n$"里"大小"的来源之一。

`(d)` 三条候选失败路线。其一，均匀随机 chart（从所有增单射里等概率挑）：停住点是 $C(A)$ 的律本质依赖 $A$ 在 $\Lambda$ 里的间隙结构，$A=(\lambda_1,\lambda_2)$ 与 $A'=(\lambda_1,\lambda_3)$（中间隔一个点多一个自由点）的像分布在高跨度极限下发散，TV 有正下界，与 $\epsilon$ 任意小冲突；均匀测度不混合，必须靠 Ramsey 挑出的非均匀 $\nu$ [推测：下界数值论文未给]。其二，用超滤子/遍历平均造有限可加不变测度替代 $\nu$：Markov 型只认有限链上的真概率分布，有限可加测度进不了 `eq:markov-type` 的期望。其三，只混合 Proposition 3.2 实际用到的那些对（$\rho$ 限定在 $D_s$ 的像结构上）：理论上可行、能省 Ramsey 数，但论文把 $\rho$ 跑遍所有等长子元组对，一次买断所有未来比较；我核对过这不多花任何逻辑成本（$R$ 有限），只是常数浪费，标 [推测]。

## 7 Proposition 3.2（可逆 chart 传输）：把平均引理装进可逆链

`(a)` 陈述逐字（`main.tex:432-445`）：

```tex
\begin{proposition}[Reversible chart transport]\label{prop:chart-transport}
Let $\Lambda$ be a finite ordered set, and let
$T_s:D_s\to R_s$ be order-preserving bijections between its subsets,
indexed by a nonempty finite set $\cS$ with a fixed-point-free involution
$s\mapsto s^{-1}$ and $T_{s^{-1}}=T_s^{-1}$.
For every $\epsilon>0$, there are an integer $B$ and a finite stationary
reversible marked chain on charts $C:\Lambda\to\{1,\ldots,B\}$ whose
successive edge letters are independent and uniform in $\cS$.
At every stationary step $(C,s,C')$,
\[
 C'(a)=C(T_s(a))\quad(a\in D_s)
\]
holds simultaneously with probability at least $1-\epsilon$.
\end{proposition}
```

`(b)` 证明重建（`main.tex:447-497`）。先用 Lemma 3.1 拿 $B,\nu$。匹配条件 `eq:chart-match`：$C'(a)=C(T_s(a))$ 对一切 $a\in D_s$。对每个逆对代表 $s$，把两个独立 chart $(C,C')\sim\nu\otimes\nu$ 改耦合成 $\lambda_s$，使匹配概率 $\ge1-\epsilon$。耦合的机械做法论文当场给出（`main.tex:469-472`）：同有限集上两律 $\mu,\mu'$，在对角点 $(a,a)$ 放质量 $\min\{\mu(a),\mu'(a)\}$，余量任意耦；匹配概率 $=1-\TV(\mu,\mu')$。这里两律是 $C(T_s(D_s))$（$\Lambda$ 的子集 $T_s(D_s)$ 在 chart 下的像元组律）与 $C'(D_s)$；由 `eq:subtuple-TV`，$|D_s|=|T_s(D_s)|$（$T_s$ 是双射）、同长度、且 $T_s(D_s)$ 与 $D_s$ 都是增元组（order-preserving 保序），两律 TV $<\epsilon$。先耦元组、再按条件分布补全整张 chart，得 $\lambda_s$。逆字母用反射：$\lambda_{s^{-1}}(C,C')=\lambda_s(C',C)$（476-479 行），成功概率不变。丢零测 chart、$C_0\sim\nu$；每步独立均匀取字母 $s$，再从 $\lambda_s(C,C')/\nu(C)$ 抽 $C'$、记边 $(C,s,C')$。第一步边缘是 $\nu$，条件概率和为一（488 行）。平稳边测度 $(1/|\cS|)\lambda_s(C,C')$（`eq:chart-edge-mass`，490-492 行），在 $(C,s,C')^*=(C',s^{-1},C)$ 下不变（493 行），因为 $\lambda_{s^{-1}}(C',C)=\lambda_s(C,C')$ 且字母均匀。于是边形式细致平衡成立、字母独立均匀、平稳步失败率 $\le\epsilon$。

`(c)` 结构理由。无不动点对合：star 需要每条边有唯一反向边且字母取逆，$\cS$ 带不动点的话 $s=s^{-1}$ 的边要自匹配，`eq:chart-match` 与 $T_s=T_s^{-1}$ 的约束在无不动点条件下最干净；后面 Lemma 4.1 的用例 $\cS=\{u,v,u^{-1},v^{-1}\}$ 天然满足。字母独立均匀是 Step 5 漂移计算 $\E\ell\ge n/2$ 的前提（依赖的字母序列约化字长没有现成公式）。边测度 $(1/|\cS|)\lambda_s$ 里的 $1/|\cS|$ 就是字母均匀性；若字母非均匀，平衡在 $s$ 与 $s^{-1}$ 间要各自带 $\pi_\cS(s)$，可以但白费。$\epsilon$ 在陈述里是每步失败概率上界，装配里升级为 $n\epsilon=1/10$ 的 union bound 预算（`main.tex:807`），所以这里 $\epsilon$ 必须任意小、不许有绝对下界。

`(d)` 失败路线。其一，把 $\lambda_s$ 做成确定转移 $C'=\Phi_s(C)$：可逆性要求 $\Phi_s$ 保 $\nu$ 测度且 $\Phi_{s^{-1}}=\Phi_s^{-1}$，而匹配条件只约束像元组、通常凑不出全局保测双射，停在"细致平衡"验证；概率耦合是绕过保测性的唯一省事通道，靠的正是 min-mass 耦合引理（`main.tex:469-472`）。其二，$\epsilon=0$ 精确匹配：要求两律相同，Lemma 3.1 只给 TV 接近，一般 $|D_s|\ne|D_s|$ 的像集结构有别，精确相等做不到；论文把误差留在成功概率里，装配阶段才用 union bound 买单。其三，对 $s$ 与 $s^{-1}$ 独立耦两份：$\lambda_{s^{-1}}\ne\lambda_s$ 的反射，平衡验证断在 `eq:chart-edge-mass` 的不变性一步；反射定义 $\lambda_{s^{-1}}(C,C')=\lambda_s(C',C)$ 是免费的强约束，不采用是浪费 [推测：论文未讨论该分支]。

## 8 §4：约化字、ping-pong 同胚与两级引理

`(a)` Lemma 4.1 陈述逐字（`main.tex:520-534`）：

```tex
\begin{lemma}\label{lem:action}
There are increasing homeomorphisms $h_s:\R\to\R$ such that
\begin{align}
 h_s(y+1)&=h_s(y)+1, & h_{s^{-1}}&=h_s^{-1},\label{eq:periodic-action}\\
 h_s(\R\setminus\cA_{s^{-1}})&=\cA_s,
 & |h_s(y)-y|&<2.\label{eq:pingpong}
\end{align}
For a word $w=s_1\cdots s_k$, write
$h_w=h_{s_1}\circ\cdots\circ h_{s_k}$, with $h_\varnothing$ the identity.
If $w$ is nonempty and reduced, then
\begin{equation}\label{eq:interior}
 h_w(0)\in\operatorname{int}(\cA_{s_1});
\end{equation}
in particular, $h_w(0)\notin\Z$.
\end{lemma}
```

前置数据（`main.tex:508-518`）：$\cS=\{u,v,u^{-1},v^{-1}\}$；区间 $[\alpha_s,\beta_s]\subset(0,1)$ 长度为正、闭包两两不交；$\cA_s=\bigcup_{j\in\Z}[\alpha_s+j,\beta_s+j)$。

`(b)` 构造重建（`main.tex:536-559`）。正字母 $s$ 的 $h_s$ 由三点表确定，段上线性：

```tex
 y&\alpha_{s^{-1}}&\beta_{s^{-1}}&\alpha_{s^{-1}}+1\\ \hline
 h_s(y)&\beta_s-1&\alpha_s&\beta_s.
```

两个斜率都正（分子分母同号：$\beta_{s^{-1}}-\alpha_{s^{-1}}>0$ 对应 $\alpha_s-(\beta_s-1)>0$）。按 $h_s(y+1)=h_s(y)+1$ 延到全直线，$h_{s^{-1}}:=h_s^{-1}$。集合恒等式：补区间 $[\beta_{s^{-1}}+j,\alpha_{s^{-1}}+j+1)$ 线性映到 $[\alpha_s+j,\beta_s+j)$，两端点对齐（表里前两行/后两行各管一端），所以 $h_s(\R\setminus\cA_{s^{-1}})=\cA_s$ 对正字母成立；取补与逆得负字母版本。位移界：差函数 $h_s(y)-y$ 在折点处取值 $\beta_s-1-\alpha_{s^{-1}}\in(-2,0)$、$\alpha_s-\beta_{s^{-1}}\in(-1,1)$、$\beta_s-\alpha_{s^{-1}}-1\in(-2,0)$；折点间线性、周期延拓，故 $|h_s(y)-y|<2$ 逐点成立；逆同胚的位移界由 $y=h_s(x)$ 换元即回 $|h_s(x)-x|<2$。`eq:interior`：$0$ 落在所有弧闭包之外（$\alpha_s>0$、$\beta_{s^{-1}}-1<0$ 故 $0\in[\beta_{s^{-1}}-1,\alpha_{s^{-1}})$，属于补集内部）。从右往左读约化字 $w=s_1\cdots s_k$：$h_{s_k}(0)\in\operatorname{int}\cA_{s_k}$（$0$ 在 $\R\setminus\cA_{s_k^{-1}}$ 的内部，$h_{s_k}$ 把该开集映成 $\operatorname{int}\cA_{s_k}$，同胚保内部）；设 $h_{s_{i+1}\cdots s_k}(0)\in\operatorname{int}\cA_{s_{i+1}}$，约化性给 $s_{i+1}\ne s_i^{-1}$，闭包不交蕴含该点在 $\R\setminus\cA_{s_i^{-1}}$ 内部，再作用 $h_{s_i}$ 落入 $\operatorname{int}\cA_{s_i}$。归纳到 $i=1$ 证毕；$\operatorname{int}\cA_{s_1}$ 与 $\Z$ 不交给出 $h_w(0)\notin\Z$。

`(c)` 数值理由。位移常数 2：由弧全在 $(0,1)$ 且周期 1 决定，端点差的下确界就是 2（$\alpha\to0^+$、$\beta\to1^-$ 时逼近），取不到等号因为长度严格为正；而 Step 2 需要 $|h_w(0)|<2n$（`main.tex:693-694`）与 landmark 裕量 $\pm2n$ 严格匹配，所以这个 2 会被原样抄进 $\Lambda$ 的定义。为什么四个字母（两个生成元），并非一个：$|\cS|=2$（$\{u,u^{-1}\}$）时约化字长是 $\Z$ 上对称随机游走，期望位移 $\sim\sqrt n$，$\Prob\{\ell\ge n/4\}$ 没有一致正下界，Step 5 的 $1/4$ 报废；自由群两生成元的约化字有正漂移（每步以概率 $3/4$ 增长、$1/4$ 缩短，期望 $+1/2$），弹道性全靠 $\cS$ 是四元素。闭包不交：`eq:interior` 的归纳每跳都要用"$\cA_{s_{i+1}}$ 与 $\cA_{s_i^{-1}}$ 隔正距离"，若只要求内部不交，边界点可能把归纳打断；正长度：弧空了就全崩。半开口径 $[\alpha+j,\beta+j)$：保证 $\{\cA_s\}$ 平移互不相交且与 Lemma 3.1 的 landmark 计数一致。

`(a2)` Lemma 4.2 陈述逐字（`main.tex:585-591`）：

```tex
\begin{lemma}[Two levels]\label{lem:two-levels}
Let the reduced form of $w$ have length $\ell>0$, with $n_+$ positive
letters and $n_-$ negative letters. For every $j\in\Z$,
\begin{equation}\label{eq:two-levels}
 c_w(j)=-n_-,\qquad c_w(h_w(0)+j)=n_+.
\end{equation}
\end{lemma}
```

`(b2)` $\chi$ 系统重建（`main.tex:561-583` + 593-605）。$\chi_s(y)=\one_{\cA_s}(y)-\one_{\{s\text{ negative}\}}$（`eq:chi`，563-565 行）。补集恒等式 $\one_{\cA_{s^{-1}}}(h_s^{-1}(y))=1-\one_{\cA_s}(y)$（567-569 行）代入得反号律 `eq:chi-cancellation`：$\chi_{s^{-1}}(h_s^{-1}(y))=1-\one_{\cA_s}(y)-(1-\one_{\{s\text{ neg}\}})=-\chi_s(y)$。这里逐项验证：负指示 $\one_{\{s^{-1}\text{ neg}\}}=1-\one_{\{s\text{ neg}\}}$，常数部分 $-\one_{\{s^{-1}\text{ neg}\}}=-(1-\one_{\{s\text{ neg}\}})$，两部分的 $1$ 相消，恰好是"减 1"设计的全部动机。$c_w(y)=\sum_1^k\chi_{s_i}(y_{i-1})$，$y_i=h_{s_i}^{-1}(y_{i-1})$（`eq:c-word`，575-578 行），终点 $y_k=h_w^{-1}(y)$。周期性 $c_w(y+1)=c_w(y)$ 由 $\chi$ 周期与 `eq:periodic-action`。约化不变性：删一对相邻逆字母 $s,s^{-1}$，贡献 $\chi_s(y)+\chi_{s^{-1}}(h_s^{-1}(y))=0$ 且终点不动（581-583 行）。两级：约化字 $t_1\cdots t_\ell$，从整数 $j$ 出发，归纳"每步起点在 $\cA_{t_i}$ 外"（起步在外：整数不在任何弧闭包内；保持：起点在 $\cA_{t_i}$ 外 $\Rightarrow$ 逆像 $\in\cA_{t_i^{-1}}$ $\Rightarrow$ 与 $\cA_{t_{i+1}}$ 不交 $\Rightarrow$ 下一步还在外），所有指示为 $0$，$\chi$ 只剩负字母的 $-1$，和 $=-n_-$。从 $h_w(0)+j$ 出发，第 $i$ 步起点 $=h_{t_i\cdots t_\ell}(0)+j\in\operatorname{int}\cA_{t_i}$（`eq:interior` 用于后缀字），指示全 1，和 $=\ell-n_-=n_+$。交错布局（`main.tex:607-613`）：$z=h_w(0)-\lfloor h_w(0)\rfloor\in(0,1)$，点列 $j<z+j<j+1$ 上取值 $-n_-$ 与 $n_+$ 交替。

`(c2)` 为什么水平是 $-n_-$ 与 $n_+$：间距 $U-V=n_++n_-=\ell$ 恰为约化字长，这是"位移以约化长度计量"的会计基；两端幅度各 $\le\ell$ 是 Step 4 里 $|V|\le\ell$ 补贴估算的前提。若不减 1（$\chi_s=\one_{\cA_s}$），两级成 $0$ 与 $\ell$，$|V|\le\ell$ 照样成立但 `eq:chi-cancellation` 变成 $\chi_{s^{-1}}(h_s^{-1})+\chi_s=1$，删除相邻逆字母会多出常数项、约化不变性破产，$c_w$ 就依赖原字，并非约化字，Step 3 的 `eq:F-cocycle` 与 Step 5 的漂移计算脱钩。这个"减 1"是全论文最小最关键的符号设计。

`(d)` 失败路线。其一，用圆 $\R/\Z$ 上的旋转替代直线同胚：周期化后 $h_s$ 不再有"$\R\setminus\cA_{s^{-1}}$ 映到 $\cA_s$"的双侧结构（补集像被同一周期吞掉一半的直观变成严格的：旋转保测，$\cA$ 测度 $<$ 补测度的映射不存在），停在集合恒等式；[推测]。其二，弧的闭包只内部不交：`eq:interior` 归纳在边界卡住，两级引理对"起点恰落边界"的例外字失效，而随机字母下踩边界概率虽零、离散 chart 里 landmark 却是有限点集，例外会变成正概率。其三，取 $w$ 恒等于约化前原字做两级：$n_+,n_-$ 按原字计，间距变原字长，Step 5 概率事件 $\{\ell\ge n/4\}$ 换不到约化长度的漂移界，线性位移 $n/24$ 的账全乱。

## 9 §5 装配：Proposition 2.2 的 Step 1-5 全账

Step 0（`main.tex:624-632`）：$D_k=N(\underbrace{1,-1,\ldots}_{k\text{ pairs}})>0$（正性最终来自附录 `eq:nondegenerate`），次可加 $D_{k+l}\le D_k+D_l$：把 $k+l$ 对数组拆成前段与后段两个数组之和（坐标不重叠），各自按 spreading 不变与三角不等式计。推论 $D_L\le 2D_{L/2}$（`main.tex:798`）。

Step 1（`main.tex:636-682`）：$L=8(n+1)$、$\epsilon=\frac1{10n}$（639-640 行）。landmark 集 `eq:landmarks`：全部 $\alpha_s+j,\beta_s+j$（$0\le j<L$）并上全部 $h_w(0)+j$（$|w|\le n$，$-2n\le j\le L+2n$），重合点计一次。$|w|\le n$ 覆盖：约化不变性让长字像等于短字像，内部事件的任意轨迹只需长度 $\le n$ 的字；裕量 $\pm2n$ 与位移界 $|h_w(0)|<2n$ 对齐。$T_s=h_s|_{D_s}$，$D_s=\{a\in\Lambda:h_s(a)\in\Lambda\}$，逆即 $T_{s^{-1}}$（order-preserving 由 $h_s$ 单调）。Proposition 3.2（配 $\epsilon$）给 chart 链；good 转移即 `eq:chart-match`（`eq:good`，666-668 行），每步成功率 $\ge1-\epsilon$。标签 `eq:labels`：正字母 $g(C,s,C')=\sum_{j=0}^{L-1}(b_{C(\alpha_s+j)}-b_{C(\beta_s+j)})$，负字母按奇性 $g(C,s,C')=-g(C',s^{-1},C)$。单步范数 `eq:one-step-norm`：$N(g)=D_L$。我补的机械核对：$\alpha_s+j<\beta_s+j<\alpha_s+j+1$（弧在 $(0,1)$ 内）给出 $2L$ 个坐标点系数严格交错 $+1,-1,+1,-1,\ldots$，spreading 不变恰把该数组化成定义 $D_L$ 的标准数组；无论 good 与否，chart 单调就保证交错，这正是 Step 1 不需要任何事件条件就有 $N(g)=D_L$ 的原因。

Step 2（`main.tex:686-722`）：设全 good 轨迹，$w=s_1\cdots s_n$ 约化长 $\ell>0$；$m=\lfloor h_w(0)\rfloor$，$z=h_w(0)-m\in(0,1)$（`eq:interior`）。$|h_w(0)|<2n$ 由位移界逐步三角：$|h_{s_i}(y)-y|<2$ 复合 $n$ 次，得 $-2n\le m\le2n-1$。秩对 `eq:rank-pairs`：$r_j=C_0(j)$、$t_j=C_0(z+j)$，$L/4\le j\le3L/4$；$j$ 与 $z+j=h_w(0)+(j-m)$ 都在 $\Lambda$（$j-m\in[L/4-2n+1,3L/4+2n]\subset[-2n,L+2n]$ 因 $L/4=2(n+1)>2n$），且 $r_j<t_j<r_{j+1}$。追踪 $y_i$：整数族闭式 $y_i=h_{s_i^{-1}\cdots s_1^{-1}}(0)+j$、交错族 $y_i=h_{s_{i+1}\cdots s_n}(0)+j-m$（我从 $y_i=h_{s_1\cdots s_i}^{-1}(y_0)$ 用 $h$ 的群律与周期化推的，与 `main.tex:705-711` 逐字一致；字长 $\le n$、平移在裕量内，全部落在 $\Lambda$）。界 `eq:transport-bounds`：$j-2n<y_i<j+1+2n$（每步位移 $<2$），该区间对 $j\in[L/4,3L/4]$ 整体含于 $(0,L)$（两端：$L/4-2n=2>0$，$3L/4+2n+1<L$ 因 $L/4>2n$）。goodness + $h_{s_i}(y_i)=y_{i-1}$ 给传递秩恒等式 `eq:transport-rank`：$C_i(y_i)=C_{i-1}(y_{i-1})=\cdots=C_0(y_0)$。

Step 3（`main.tex:726-761`）：$G=\sum_1^ng(C_{i-1},s_i,C_i)$，前缀 $F(k)=\sum_{a=1}^kG_a$，$F(0)=F(B)=0$（每个标签系数和为零）。半开区间恒等式（734-737 行）$\sum_{a\le C(y)}(b_{C(\alpha)}-b_{C(\beta)})_a=\one_{[\alpha,\beta)}(y)$：单调 chart 下 $C(\alpha)\le C(y)\iff\alpha\le y$。在传递秩 $C_0(y_0)$ 处求值：正步贡献 $\one_{\cA_{s_i}}(y_{i-1})$（用 $C_{i-1}$ 读标签、$y_{i-1}\in(0,L)$ 截窗口，恰得 $j=0..L-1$ 的弧指标和）；负步在 $C_i$ 读（奇性定义使然），贡献 $-\one_{\cA_{s_i^{-1}}}(y_i)=\one_{\cA_{s_i}}(y_{i-1})-1$（补集恒等式，需 $y_i\in(0,L)$）。两式合写 $\chi_{s_i}(y_{i-1})$，故 `eq:F-cocycle`：$F(C_0(y_0))=c_w(y_0)$。把 `eq:two-levels` 分别代 $y_0=j$ 与 $y_0=z+j$（后者用整数平移 $j-m$），得 `eq:F-levels`：$F(r_j)=V:=-n_-$、$F(t_j)=U:=n_+$、$U-V=\ell$。

Step 4（`main.tex:765-801`）：取 $a=L/4$、$b=3L/4$，切割序列 $0,r_a,t_a,r_{a+1},\ldots,t_{b-1},r_b,B$ 上 $F$ 取值 $0,V,U,V,\ldots,U,V,0$，相邻块和（表中给出）为 $V,\ell,-\ell,\ldots,\ell,-\ell,-V$，内对有 $b-a=L/2$ 个。逐块求和替换按"反复相邻合并"（Lemma 2.1 (ii) 的块版，`main.tex:223-224` 已声明）是收缩的：$N(G)\ge N(V,\ell,-\ell,\ldots,-\ell,-V)$。估算一：该数组 $\ge\ell D_{L/2}-|V|D_1$，做法是把 $(\ell,-\ell,\ldots)$ 段与 $(V,0,\ldots,0,-V)$ 段视为相加（$F(B)=0$ 保证尾块符号 $-V$ 与内段衔接不产生额外项），用 $N(X+Y)\ge N(X)-N(Y)$，$N(\ell,-\ell,\ldots,\ell,-\ell)=\ell D_{L/2}$（spreading+齐次），$N(V,\ldots,-V)=|V|D_1$（spreading），再 $|V|=n_-\le\ell$。估算二：只在单个 $r_j$ 或 $t_j$ 处切，得 $(V,-V)$ 或 $(U,-U)$：$N(G)\ge\max\{|V|,U\}D_1\ge\frac\ell2D_1$（$\max\{|V|,U\}\ge(U-V)/2=\ell/2$）。合并：对非负 $A,B$ 有 $\max\{A-B,B/2\}\ge A/3$（`main.tex:797$ 的初等事实：$B\le 2A/3$ 时第一者 $\ge A/3$，否则第二者 $\ge A/3$）；取 $A=\ell D_{L/2}$、$B=\ell D_1$，得 $N(G)\ge\frac\ell3D_{L/2}\ge\frac\ell6D_L$（`eq:linear-displacement`，799-801 行）。

Step 5（`main.tex:805-824`）：失败概率 $\le n\epsilon=1/10$（平稳+union bound）。字母独立均匀：约化字长过程在 $\ell>0$ 时期望增量 $+1/2$（四个字母恰一个抵消当前字尾，$3/4-1/4$），$\ell=0$ 时 $+1$，故 $\E\ell\ge n/2$；又 $0\le\ell\le n$，$\frac n2\le\E\ell\le\frac n4\cdot1+n\cdot\Prob\{\ell\ge n/4\}$（低事件贡献 $\le n/4$ 按概率 $\le1$、高事件按 $\ell\le n$），解出 $\Prob\{\ell\ge n/4\}\ge1/4$。交事件概率 $\ge1/4-1/10=3/20$，其上 $N(G)\ge\frac{n/4}6D_L=\frac{nD_L}{24}$。除以 $D_L>0$ 归一，Proposition 2.2 落定：$1/24=\frac1{6\cdot4}$，$3/20=\frac14-\frac1{10}$。

`(c)` 全局数值账：$\epsilon=\frac1{10n}$ 的 10 只为凑 $1/4-\frac1{10}=\frac3{20}>0$ 且留 $1/20$ 余量；任何 $\epsilon$ 使 $n\epsilon<1/4$ 都行，论文挑了最圆的小数。$L=8(n+1)$：既要 $L/4>2n$（传输界含于 $(0,L)$）又要 $L$ 被 4 整除（$a,b$ 取整秩）；$8(n+1)$ 是同时满足两件事的最小 4 倍数（$n+1$ 的 $+1$ 覆盖 $n$ 的小值情形，$n\ge1$ 时 $L\ge16$）。$n+1$ ，并非 $n$：$n=1$ 时 $L=16$、窗口裕量核对不借力。

`(d)` 装配层的候选失败路线。其一，landmark 忘了 $\pm2n$ 裕量：$y_i$ 可能出 $\Lambda$，`eq:transport-rank` 左端 $C_i(y_i)$ 无定义，传递恒等式当场断。其二，用期望直接接 $N(G)$：$N(G)\ge\ell D_L/6$ 只在 good 且 $\ell>0$ 的轨迹成立，若跳过事件分解改取 $\E N(G)\ge\frac{D_L}6\E\ell$ 再套 Markov 型，需要 $N(G)^p$ 的下界，而 $\E N(G)^p$ 对非负变量可由单事件 $\ge P\cdot(\text{下界})^p$，论文的 $3/20\cdot(n/24)^p$ 恰是这条路最省的写法；改成 Jensen 反向会得 $p<1$ 型的不等号方向错误 [推测]。其三，正负步在同一个 chart（比如 $C_{i-1}$）读标签：负步的 $-1$ 补偿项 $\one_{\cA_{s_i}}(y_{i-1})-1$ 来自在 $C_i$ 读+补集恒等式，统一在 $C_{i-1}$ 读会让 `eq:F-cocycle` 的 $\chi$ 结构退化为 $\one$ 结构，两级引理的 $-n_-$/$n_+$ 对账不成立。

## 10 附录 A（Lemma 2.1 的构造）：Brunel--Sucheston 手法的有限数组版

`(a)` 陈述即第 2 节所引 Lemma 2.1（`main.tex:207-220`），附录开头声明其血统（`main.tex:833-838`）：spreading model 与 subdivision 两步 follow the approach of Brunel and Sucheston，经典结论记录为 [Theorem 2.2, Ostrovskii]"每个非自反 Banach 空间有限表示一个带 equal-sign-additive 基的空间"，论文自我定位："We give the finite-array construction of the norm properties needed here."

`(b)` 起点与 Step 1（`main.tex:842-893`）。由 James--Enflo（`eq:superreflexive-characterization`）取有限表示于 $X$ 的非自反 $Y$；$Y\subseteq Y^{**}$ 典范嵌入下选 $v\in B_{Y^{**}}$、$d>0$ 使 $\dist(v,Y)>d$。非自反在这里兑现的方式：$B_Y$ 在 $Y^{**}$ 范数拓扑下不闭，所以存在闭距离正的点，$d$ 可取任意小于该距离的值。对每个 $M\ge1$ 归纳造 $y_1,\ldots,y_M\in B_Y$、$f_1,\ldots,f_M\in B_{Y^*}$ 满足 `eq:triangle`：$f_i(y_j)=0$（$j<i$）、$|f_i(y_j)-d|\le M^{-1}$（$j\ge i$）。归纳第 $i$ 步：$E=\Span\{y_1,\ldots,y_{i-1}\}$，限制映射 $Y^{**}\to(E^\perp)^*$ 是商映射（核为 $E$ 的典范像）：$E^\perp\subseteq Y^*$ 上的有界泛函由 Hahn--Banach 保范延到全 $Y^*$，而有限维给出 $(E^\perp)^\perp=E$。于是商范数 $=\|$ 限制的范数 $=\|v|_{E^\perp}\|=\dist(v,E)\ge\dist(v,Y)>d$，可取 $f_i\in B_{Y^*}\cap E^\perp$ 使 $v(f_i)=d$（缩放+变号）。有限维 Goldstine：$(v(f_1),\ldots,v(f_i))$ 属于 $\{(f_1(y),\ldots,f_i(y)):y\in B_Y\}$ 的闭包，否则分离泛函给某 $f\in\Span\{f_1,\ldots,f_i\}$ 满足 $v(f)>\sup_{B_Y}f=\|f\|$、与 $\|v\|\le1$ 矛盾；故可取 $y_i\in B_Y$ 使 $|f_h(y_i)-v(f_h)|\le M^{-1}$（$h\le i$）。倒序读：对下标递减子列 $i_1>\cdots>i_m$，$f_{i_j}$ 消灭第 $j$ 项之后的一切（$h>j\Rightarrow i_h<i_j\Rightarrow f_{i_j}(y_{i_h})=0$），在前 $j$ 项上各近似 $d$，所以 $\|f_{i_j}\|\le1$ 给出

```tex
 d\max_{1\leq j\leq m}\abs{\sum_{h=1}^j a_h}
 -\frac1M\sum_{h=1}^m|a_h|
 \leq\norm{\sum_{h=1}^m a_h y_{i_h}}
 \leq\sum_{h=1}^m|a_h|,
```

我补的中间步：固定取到 $\max$ 的 $j^*$，$f_{i_{j^*}}(\sum_h a_hy_{i_h})=f_{i_{j^*}}(\sum_{h\le j^*}a_hy_{i_h})=d\sum_{h\le j^*}a_h+O(M^{-1}\sum_{h\le j^*}|a_h|)$，取绝对值、$\|\cdot\|\ge|\pm f(\cdot)|$、上界用 $\|y\|\le1$ 三角。`eq:finite-prefix` 就是"前缀和受范数控制"的有限骨架，$d$ 是它的强度。

Step 2（`main.tex:897-937`）：固定 $k$，对每个 $m\le k$ 取 $[-1,1]^m$ 网格 mesh $\le k^{-2}$（最大模范数），把倒序数组的增 $m$ 子列按"其网格系数的范数四舍五入进宽 $k^{-1}$ 的箱"染色，颜色数有限且只依赖 $k$、不依赖 $M$；对 $m=1,\ldots,k$ 逐 arity 嵌套 Ramsey（每次细化前一 arity 的单色集，细化保持已有单色性），$M=M_k\ge k^3$ 足够大时得到全单色的 $(x_1^{(k)},\ldots,x_k^{(k)})$。同 arity 两元组、系数 $a\in[-1,1]^m$：先舍入到网格（范数差 $\le$ 箱宽 $k^{-1}$），再做两次网格近似的 $\ell_1$ 误差经 `eq:finite-prefix` 上界传入，论文合计 $k^{-1}+2mk^{-2}\le3k^{-1}$（`main.tex:911-912`）。对全体有理系数元组对角取列，加共同的 $\ell_1$ Lipschitz 界（$|N(x)-N(y)|\le\sum|x_i-y_i|$ 型，由上界与三角给出），得极限 $N_0(a)=\lim_k\|\sum a_ix_i^{(k)}\|$；追加零兼容性、spreading、范数公理逐项过极限；`eq:N0-bounds`：$d\max_j|\sum_{i\le j}a_i|\le N_0(a)\le\sum|a_i|$；`eq:nondegenerate`：每个系数 $a_i=$ 相邻两前缀之差 $\Rightarrow N_0\ge\frac d2\max_i|a_i|$；由构造，$a\mapsto\sum a_ix_i^{(k)}$ 给出每个固定坐标 span 到 $Y$ 失真 $\to1$ 的线性嵌入。

Step 3（`main.tex:941-978`）：细分算子 $F_{\boldsymbol J}a$：把 $a_i$ 换成 $J_i$ 份 $a_i/J_i$。单调性 `eq:dilation-monotone`（$J_i\le M_i\Rightarrow N_0(F_{\boldsymbol M}a)\le N_0(F_{\boldsymbol J}a)$）的证明我逐步复算：在第 $i$ 段 $M_i$ 个位置里均匀随机选 $J_i$ 个、放 $a_i/J_i$、其余放零；每个实现的数组都由 $F_{\boldsymbol J}a$ 插零得来，$N_0$ 值不变（spreading）；实现的均值恰为 $F_{\boldsymbol M}a$（每位置被选概率 $J_i/M_i$）；凸性给 $N_0(\text{mean})\le\mathbb E\,N_0(\text{realization})=N_0(F_{\boldsymbol J}a)$。于是 $\{N_0(F_{\boldsymbol J}a)\}$ 按分量序单调不增且下有界（`eq:nondegenerate` 给出 $N_0(F_{\boldsymbol J}a)\ge\frac d2\max|a_i|$），多元指标集按分量序有向（取分量 max），极限 `eq:N-definition` 良定义。前缀界过细分不变（原前缀出现在块末），`eq:prefix-bounds` 对 $N$ 成立；一致收敛给 (iii) 第一步：选 $J$ 使 $F_J$ 以失真 $<1+\eta$ 嵌入 $N$ 的 $m$ 维 span 进 $N_0$ 的 $mJ$ 维 span，再近似进 $Y$、再进 $X$，三重失真 $(1+\eta)^3$（`main.tex:977`）。

Step 4（`main.tex:982-1014`）：变重数细分不变性 `eq:subdivision-invariance`：夹逼 $N_0(F_{rJ_-}a)\le N_0(F_rF_{\boldsymbol J}a)\le N_0(F_{rJ_+}a)$（`eq:dilation-monotone`，因 $F_rF_{\boldsymbol J}$ 把 $a_i$ 分成 $rJ_i$ 份），$r\to\infty$ 两端同趋 $N(a)$。同符号合并保范：相邻非零同号且有理比的 $(a_i,a_{i+1})$，细分成等份数小片后，"两片各自细分"与"两片之和细分到总片数"给出同一数组，用不变性即 $N(\ldots,a_i,a_{i+1},\ldots)=N(\ldots,a_i+a_{i+1},\ldots)$；连续性扩到全部同号对，零由 spreading 处理。任意相邻合并（(ii)）：固定其余系数与 $s=a_i+a_{i+1}\ne0$，$\varphi(t)=N(\ldots,t,s-t,\ldots)$ 凸；对 $t$ 在 $0$ 与 $s$ 之间，$t$ 与 $s-t$ 同号于 $s$，由上段 $\varphi$ 在该闭区间恒等于合并值 $c$；若区间外 $\varphi(t)<c$，把较近的区间端点写成 $t$ 与较远端点的凸组合，凸性会把该端点压到 $c$ 以下、与恒等矛盾（`main.tex:1010-1012` 的原话机械展开），故 $\varphi\ge c$ 全域。$s=0$ 令 $s\to0$。`eq:merge` 证毕。

`(c)` 参数取值的机械理由。$M^{-1}$：三角阵列的近似精度，随 $M\to\infty$ 消失，进 `eq:finite-prefix` 的误差行；取 $M_k\ge k^3$ 使 $1/M\le k^{-3}$ 被 $k^{-1}$ 支配，对角化时三套小量（舍入 $k^{-1}$、网格扰动 $2mk^{-2}$、阵列 $1/M$）统一按 $k^{-1}$ 收敛 [推测：$k^3$ 的指数只为方便，任何 $\ge k$ 的高次皆可，论文未论证阈值唯一]。$k^{-2}$ 网格配 $k^{-1}$ 箱：箱比网格粗，保证范数差可分离。$d$ 只以比值出现：全部估计对 $(N,d)$ 齐次，最终矛盾不依赖 $d$ 数值。$\frac d2$ 不能改成 $d$：单系数是两个前缀之差。$(1+\eta)^3$ 的 3：细分嵌入、$Y$ 内近似、$X$ 内有限表示三步各吃一份。

`(d)` 失败路线。其一，直接用超滤子/超幂取 spreading model（教科书式 Brunel--Sucheston 现代写法）：结论同款，但 Lean 侧要超滤子库+非构造极限，且 (iii) 的显式嵌入链（$(1+\eta)^3$ 账）要走 Łoś 式论证反而更长；论文自称"the finite-array construction"（`main.tex:839`）正是为此 [推测]。其二，跳过 Step 3 直接拿 $N_0$：$N_0$ 只有同符号保范合并、没有任意相邻合并收缩 (ii)，正负相邻对（正是行走标签的主形态）在 $N_0$ 下无从压缩，Step 4 的数组对账当场断；细分极限买到的是"$\varphi$ 在含 $0,s$ 的区间上恒常"这一凸性弹药。其三，仿 James 定理用单个不 attainment 泛函一步造范数：得到的是标量前缀不等式，没有 spreading 不变性，chart 重排坐标的灵活性（Step 1 把 $\alpha_s+j,\beta_s+j$ 任意摆放）全部失去。

## 11 机制专题：四个我坚持要拆开的问题

其一，非超反身到底供了什么结构。全程没有出现 $\ell_1^n$ 的嵌入，也没有出现大深度二叉树。链路的实际顺序：$\neg$超反身 $\xrightarrow{\text{James--Enflo}}$ 有限表示的非自反 $Y$ $\xrightarrow{v\in B_{Y^{**}},\ \dist(v,Y)>d}$ 极限点不 attainment $\xrightarrow{\text{附录}}$ $c_{00}$ 上 spreading、合并收缩、有限表示于 $X$ 的 $N$。被行走真正消费的只有两条性质：合并收缩（Step 4 的块压缩）与经 `eq:nondegenerate` 传递的 $D_k>0$（`eq:prefix-bounds` 是它们的母不等式）。我的解读 [推测]：这是 James 定理（反射性 ⟺ 有界闭集上泛函 attainment 型判据）的失败模式"数组化"，$f_i(y_j)$ 三角阵列就是 $\dist(v,Y)>0$ 的有限骨架；"大 $\ell_1^n$ 或大树"在这篇里的替身是压缩数组 $(V,\ell,-\ell,\ldots,\ell,-\ell,-V)$ 在 $N$ 下按 $\ell D_{L/2}$ 计重，同符号可加性（Step 4 前半，精确保范）就是 equal-sign-additive 基的原文照搬。

其二，$p>1$ 用在哪。全文唯一一处：`main.tex:350` 那句"这与 $p>1$ 矛盾"，即 `eq:contradiction` 两侧增长率对决 $(3/20)(n/24)^p\le K^pn$。上游所有构造（Lemma 2.1/3.1/4.1/4.2、Prop 3.2、格提升）对任何 $p>0$ 逐字成立，Lemma 2.3 陈述里连 $p$ 的范围都不提。第 2 节算过的临界 $n$：$n>(20\cdot24^pK^p/3)^{1/(p-1)}$，$p\downarrow1$ 时爆炸，与"$p=1$ 每个空间自动具型、无信息"一致。Lean 把这一处单独封装成 `PowerGrowth.lean:40` 的 `not_forall_power_le_linear (c := (3/20)/24^p)`：幂增长对线性的胜利，抽样核对里全库唯一消费 `1 < p` 于矛盾终点的引理。

其三，一致光滑范数的构造是显式的吗。答案：不是本篇的任务（我进场时误以为是）。论文把"超反身 ⟹ 等价一致光滑范数"整段外包给 NPSS+Pisier（`main.tex:115-124`），自身只对反方向负责；对接用的是"等价一致凸存在 ⟺ 等价一致光滑存在 ⟺ 超反身"的经典三重等价（论文引 Pisier）。本篇内部唯一构造性 renorming 发生在障碍侧（附录 $N$），手法是有限 Ramsey+对角列，非超滤子、非显式超幂，有限维 Goldstine 现证（`main.tex:876-881`），可以叫它"初等化的超积论证"。与初始设想的差异：我原以为 Naor 问题的答案是"从 Markov 型常数造光滑模数"，实际交付的是"造一个违背 Markov 型的有限链见证"，光滑范数的存在性从头到尾没被显式触碰。

其四，与已知反向的接口。数学接口：NPSS 定理（幂型 $q$ 一致光滑 $\Rightarrow$ Markov 型 $q$，$1<q\le2$）+ Pisier（超反身 $\Rightarrow$ 某个 $q>1$ 幂型光滑等价范数）+ Markov 型在等价范数下的显然不变性（`main.tex:118-119`）。Lean 接口实测：`PisierPowerRenorming.lean:14` 的 `exists_power_smooth_equivalentNorm` 从 `HasEquivalentUCNorm` 造出 $q=(1+r)/2\in(1,2]$、`SymmetricPowerSmooth`、`PowerSmooth`、模数界 `smoothnessModulus N.p t ≤ C*t^q` 与 `UniformSmooth` 一体的等价范数；`SmoothMarkovType.lean:38` 的 `markovTypeWith_of_symmetricPowerSmooth` 交常数 $K=64D$；`Main.lean:28-36` 组装成 `HasEquivalentUCNorm.hasNontrivialMarkovType`（需 `[CompleteSpace X]`）；`Main.lean:38-41` 的 iff 封两向。$q$ 取 $(1+r)/2$：在有限上 $L_2$ 型指数 $r$ 与幂型 $q$ 之间留严格间隙供 `finiteUpperL2_extrapolate_dyadic` 消耗 [推测：具体分配由 DyadicInterpolation 一系文件决定]。$64$ 来自偶/奇步拆分（`rcases Nat.even_or_odd'`）的粗化累加，tex 无此数，属形式化对文献常数的自足复算。

## 12 检索线与论文内容的口径分开登记

以下属我上网检索与教科书常识的整理，论文没说的话我不替它说。原始定义线：Markov 型由 Ball 1992 在 Lipschitz 扩张问题引入（论文 `main.tex:96-97` 同引一篇文献，口径吻合）；NPSS 2006 证幂型光滑推 Markov 型（论文引文同）。$L_p$ 型空间：教科书结论是 $L_p$（$p\ge2$）经 2 型幂光滑具 Markov 型 2（NPSS 推论）；提示词提到的 Naor--Schechtman 对 $L_p$ 型空间 Markov 型的后续工作，本轮检索环境（中文索引为主）未命中原文，定理形态我不作断言，标 [推测]。组合 Markov 型：Matoušek 把目标换成一般度量空间、以图语言重述并服务 Lipschitz 扩张，与本篇共享"平稳可逆"内核；`references.tex` 十六篇里没有 Matoušek 条目，可核对；其组合版与 Banach 版等价细节我未验证，[推测]。Markov cotype：与 Markov 型对偶的 cotype 概念在 Naor--Schechtman 一系中出现、关联不含大 $\ell_1^n$ 的结构；本篇不走 cotype 路线，结构供给全程用 spreading model，两条线在"非超反身的证据形式"上分岔。renorming 经典：超反身 ⟺ 等价一致凸范数存在（Enflo 1972；James 1972 的有限表示刻画），⟺ 等价一致光滑范数存在（对偶+局部反射标准论证，Pisier 1975 鞅刻画）；论文 `main.tex:121-124` 与 `eq:superreflexive-characterization` 把它们当现成事实引用，与教科书一致。Ribe program：Naor 2012 综述（[Naor]，Question 4 出处）把"线性几何性质的度量刻画"列为纲领主题，Theorem 1.1 是"度量性质刻画线性性质"的完成态样本；检索命中的 IHES 2014 nonlinear spectral calculus 与 arXiv:2412.20900 属外围版图，无技术交集。本环境检索命中的科普词条（超自反巴拿赫空间、Reflexive space、Per Enflo 词条）与论文口径一致、无增量。

## 13 Lean 取证：实跑数字与错口清单

实测口径全部限定在 `E:\math\lean\OAI\Analysis\MarkovType\` 与 `formalization.yaml`，命令当场所跑。规模：`.lean` 文件 212 个，`wc -l` 合计 27339 行；顶层声明行（`^theorem/^lemma/^def/^abbrev/^structure/^class/^instance/^example/^noncomputable def/^private def/^private theorem` 前缀）1905 行，其中 theorem+lemma 1392 行；`sorry` 出现 0 次；自定义 `axiom` 声明 0 条。comparator 白名单公理（`E:\math\lean\ComparatorChallenges\MarkovType.json` 逐字）：`propext`、`Quot.sound`、`Classical.choice`；`enable_nanoda: false`；被认证定理名恰一条：`OAI.MarkovSuperreflexivity.hasNontrivialMarkovType_iff_hasEquivalentUCNorm`。tactic 频次（`grep -oh` 全目录）：`have ` 2207、`simp` 1770、`exact ` 978、`intro` 870、`linarith` 311、`calc` 298、`obtain` 282、`classical` 279、`omega` 243、`refine` 242、`ring` 193、`norm_num` 155、`induction` 107、`constructor` 84、`cases ` 67、`rcases` 51、`nlinarith` 80、`by_contra` 42、`positivity` 39、`measure_theory` 0（期望全为有限和，与 tex 有限链口径吻合）。抽样文件行数：`Main.lean` 43、`FiniteWalk.lean` 107、`LatticeLift.lean` 226、`WordReduction.lean` 236、`FiniteRamsey.lean` 242、`TwoLevels.lean` 147、`ChartAveraging.lean` 117、`OddEdgeTransfer.lean` 40、`OrderedNormConstruction.lean` 24。中心仓库条目行号实测：`formalization.yaml:462-464`（书目），`formalization.yaml:1302-1304`（comparator+入口 `OAI/Analysis/MarkovType/Main.lean`）。

入口文件 5 条定理：`MarkovTypeWith.hasEquivalentUCNorm`（正向主定理，`by_contra`+`orderedNorm_of_not_hasEquivalentUCNorm`+`not_coordinatesRepresentable` 三拍）、`HasNontrivialMarkovType.hasEquivalentUCNorm`、`HasMarkovType.two_hasEquivalentUCNorm`（$p=2$ 特化）、`HasEquivalentUCNorm.hasNontrivialMarkovType`（`[CompleteSpace X]`）、`hasNontrivialMarkovType_iff_hasEquivalentUCNorm`。骨架对位：`FiniteChains.lean:14-22` 的 `FiniteReversibleChain`（$\pi,P$ 加非负、行和 1、细致平衡字段）对位 `main.tex:68-73`；`stateCost`（`FiniteChains.lean:30-33`）把 $\E$ 编成对 `StatePath S n = Fin (n+1) → S` 的显式和；`MarkovTypeWith/HasMarkovType/HasNontrivialMarkovType` 在 `FiniteChains.lean:34-43`；`FinitelyRepresentable.lean:12-17` 的 $\|z\|\le\|Tz\|\le(1+\eta)\|z\|$ 对位 `main.tex:135-138`（单射性由下界自动）；`RenormingBasic.lean:50-59` 的 `UniformConvex` 把 $\epsilon\in(0,2]$ 编成 `0<ε ∧ ε≤2`、中点 `(1/2 : ℝ) • (x + y)`，对位 `main.tex:83-88`；`LatticeLift.lean` 的 `lift_edge_balance` 与 `liftPotential_increment_accepted/_rejected`（121/193/204 行）复刻格提升两笔账；`FiniteWalk.lean:76` 的 `finiteWalk (N) (n) (0<n) : Nonempty (FiniteWalkWitness N n)` 是 Prop 2.2 的机器形，witness 字段 `odd/support_bound/unit/escape` 四件套对位陈述四要求；`WeightedEvents.lean:170` 显式登记恒等式 `1/4 - n*(1/(10n)) = 3/20`；`MarkovObstruction.lean:13` 的 `not_coordinatesRepresentable` 内部走 `not_all_walk_moment_bounds`+`finiteWalk`+`markov_moment_bound`，正是 §2.4 的拼装；`FiniteRamsey.lean` 自带 `FiniteRamseyBound` 归纳（import 只有 Finset 三件+omega，Mathlib 没有现成有限 Ramsey，故手搓），对位 `main.tex:411`。

错口清单（论文 vs Lean，逐条实测）：
(1) 状态集：tex "on a set $S$"（任意有限集），Lean 只对 `Fin m` 量化（`FiniteChains.lean:35`）。双共轭等价，但 chart 链被重编码为 `ConcreteChartState ν` 等具体类型（`FiniteWalk.lean:84-89`），这层编码不便宜。
(2) 完备性：tex 主语是 Banach 空间，Lean 正向只要求 `NormedAddCommGroup + NormedSpace ℝ`、不读 `CompleteSpace`；完备性集中在 iff 反向（Pisier 链）。Lean 正向严格强于论文口径，实赋范空间也被覆盖。
(3) $p,K$ 正性：tex 写在定义语里，Lean 做成 `MarkovTypeWith` 的开头 conjunct（`0 < p ∧ 0 < K ∧ ...`），取常数须同时交正性证明（`SmoothMarkovType.lean:41-42` 的 anonymous constructor 三元组即在交账）。
(4) $\alpha_R$ 闭式：tex `main.tex:322` 显式给 $\left(\frac{2(R-n)+1}{2R+1}\right)^r\to1$；`LatticeLift.lean` 中 `grep alpha|innerCube|interior` 零命中，$R$ 以 `ℕ` 进入立方体坐标，内部事件账改由 `eventMass_mono` 型质量单调性（`FiniteWalk.lean:82`）完成，Lean 无该分式引理。形式化选择"有限裕量+单调性"替代"极限论证"，语义可互推，句法无对应物。
(5) 标号支撑：tex "in a finite coordinate span"，Lean 编成 `coordinateBound := B` 字段+`normalizedChartEdgeLabel_supportedBelow` 引理，散文约束变可判定字段。
(6) 范数与半范数：论文口径 norm，Lean 的 `EquivalentNorm X` 携 `p : Seminorm ℝ X` 加双边界 `lower_bound/upper_bound`，下半界 $a\|x\|\le N.p\ x$、$a>0$ 补回正定性；逻辑等价、类型层不同。另外 `RenormingBasic.lean` 有 `uniformConvex_of_subsingleton` 处理零空间退化，论文行文默认 $X\ne0$，无冲突。
(7) 反向常数：tex 只说 NPSS 给出 Markov 型 $p$，不带数值；Lean 交显式 $K=64D$（`SmoothMarkovType.lean:23` 的 `stateCost C f q n ≤ 64*D*n*stateCost C f q 1`）。论文是存在性口径，Lean 是带常数口径，机器信息严格更多。
(8) 定理切分粒度：tex 把 Lemma 2.3 证完即用，Lean 拆 `OddEdgeTransfer.lean` 两条（`of_near_isometric_embeddings` 先编失真传递、`odd_edge_bound_of_embeddings` 再编奇标签不等式，14/26 行），对应 tex 的 270-278 段与 280-333 段各一；主证明三拍在 Lean 中是 `MarkovObstruction.lean` 一条定理体内完成。

## 14 常数与参数台账

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
|---|---|---|---|---|
| $p$ | 任意 $1<p\le2$（型向下封闭可归一） | main.tex:74,91 | `eq:markov-type` 与 `eq:contradiction` 的 $n^p$ | 取 $p=1$：main.tex:350 两侧同为线性，矛盾消失 |
| $K$ | 固定有限正数，可被放大 $(1+\eta)$ | main.tex:74,278 | Lemma 2.3 右端、主矛盾 | 允许随 $n$ 增长：main.tex:348-350 的 $n\to\infty$ 吸收失效 |
| $1/24$ | 绝对常数 $=1/(3\cdot2\cdot4)$ | main.tex:255,799-822 | `eq:contradiction` 左端；FiniteWalk.lean:66 | 因子 3 来自 main.tex:797、2 来自 798、4 来自 818，动其一须同步改表 |
| $3/20$ | 绝对常数 $=1/4-1/10$ | main.tex:256,820 | `eq:contradiction`；WeightedEvents.lean:170 | 预算 $n\epsilon\ge1/4$ 时交事件概率非正，Step 5 报废 |
| $L$ | $8(n+1)$，随 $n$ 线性 | main.tex:639 | 标签窗口、$[L/4,3L/4]$、$D_L$ | 改 $8n$：$n=1$ 时 $L/4=2n$，`eq:transport-bounds` 的 $(0,L)$ 严格含性断 |
| $\epsilon$ | $1/(10n)$ | main.tex:640 | Prop 3.2 匹配率、$n\epsilon=1/10$ | 不带 $1/n$：坏步概率不随 $n$ 收缩，$3/20$ 无出处 |
| $D_k$ | $N(1,-1,\ldots,k\text{ 对})>0$，次可加 | main.tex:627-632 | Step 4 两估算、归一化 | 次可加断则 $D_L\le2D_{L/2}$ 断，24 的因子 2 丢失 |
| $R$ | 任意整数 $>n$，$R\to\infty$ | main.tex:301,331 | $Q_R$、$\alpha_R$ | $R\le n$：内立方单薄，内部事件概率趋零 |
| $r$ | 星轨道数，依赖链 | main.tex:296 | $\alpha_R$ 指数、$\Z^r$ 秩 | $r$ 无穷：提升链不有限，Markov 型拒收 |
| $\alpha_R$ | $((2(R-n)+1)/(2R+1))^r\to1$ | main.tex:322 | $n$ 步成本下界、极限步 | 事件独立性断则乘积形式断（Lean 无闭式，见错口 (4)） |
| $B$ | Ramsey 级巨数，论文未显式界定 | main.tex:379,437 | chart 值域、坐标维数 | 要求多项式界：FiniteRamsey.lean 的归纳界拒绝，无已知路线 |
| $\delta$ | 箱宽，$R\delta<\epsilon$ | main.tex:404 | Lemma 3.1 染色与分离矛盾 | 箱宽依赖具体 $f_\rho$：颜色数失去一致有界，Ramsey 无从施加 |
| $\ell$ | 约化字长，$\E\ell\ge n/2$ | main.tex:586,812-818 | $N(G)\ge\ell D_L/6$、$\{\ell\ge n/4\}$ | 字母集缩到 2 元：期望增量归零、$\ell\sim\sqrt n$，$1/4$ 归零 |
| $n_+,n_-$ | $\ell=n_++n_-$，$U-V=\ell$ | main.tex:586,758-761 | 两级水平 $V=-n_-$、$U=n_+$ | 改 $\chi$ 的减 1：约化不变性断，`eq:F-cocycle` 对不上 |
| $v,d$ | $v\in B_{Y^{**}}$，$\dist(v,Y)>d>0$ | main.tex:844-845 | `eq:triangle`、`eq:N0-bounds`、$d/2$ | $Y$ 自反：这样的 $v$ 不存在，附录全线断 |
| $M_k$ | $\ge k^3$ | main.tex:904-905 | Step 2 的 Ramsey 抽取 | 降到 $k$：$1/M$ 误差压不进 $3k^{-1}$ 归一 [推测：论文未论证阈值唯一] |
| 网格/箱 | mesh $k^{-2}$、箱宽 $k^{-1}$、合成差 $3k^{-1}$ | main.tex:898-911 | 染色有限性、$N_0$ 良定义 | mesh 改 $k^{-1}$：扰动项变 $2mk^{-1}$，$3k^{-1}$ 崩 |
| $\eta$ | 任意小，$\eta\downarrow0$ | main.tex:273-278,970-978 | $(1+\eta)K$ 与 $(1+\eta)^3$ 失真 | 固定 $\eta$：常数变厚但矛盾结构不变（增长率不依赖它） |
| $64D$ | Lean 反向常数 | SmoothMarkovType.lean:23,52 | `markovTypeWith_of_symmetricPowerSmooth` | tex 无此数（错口 (7)）；改动只影响 Lean 端 $K$ 的实例化 |

依赖链（台账纵向读法）：固定 $p,K$ 后反证先选 $n$；$n$ 定 $L=8(n+1)$ 与 $\epsilon=1/(10n)$，$\epsilon$ 定 Prop 3.2 的匹配预算、$L$ 定 landmark 集 $\Lambda$ 与裕量 $\pm2n$；$\Lambda$ 进 Lemma 3.1 出 $B,\nu$（Ramsey 数不可控但有限），$B$ 封顶坐标维数与标签支撑；约化字过程供 $\ell$ 的漂移 $+1/2$，尾概率换 $\{\ell\ge n/4\}$ 的 $1/4$，与坏步 $1/10$ 相减成 $3/20$；Step 4 两估算经 $D_L\le2D_{L/2}$ 合成 $1/6$，与 $1/4$ 相乘成 $1/24$；Lemma 2.3 的格提升再引入 $R,r,\alpha_R$，极限把 $(3/20)(n/24)^p\le(1+\eta)^pK^pn$ 交给 $\eta\downarrow0$；$p>1$ 在唯一一处开火，$n>(20\cdot24^pK^p/3)^{1/(p-1)}$ 越界即矛盾，$X$ 超反身；一致光滑范数由经典三重等价（NPSS+Pisier）从超反身端领出，$q=(1+r)/2$ 与 $64D$ 是 Lean 端把这份领取具体化的代价。台账里 $1/24$ 与 $3/20$ 是全文数值的汇聚点：上游吃 Step 4/Step 5 的六次不等式放大，下游只喂一个增长率对比；粗糙到 24 这个量级毫无妨碍，[推测] 作者大概率先以占位常数走通再回填数值。

## 15 加深一：§1 策略段（main.tex:144-185）的逐句对账

第 8 行我把"§1 的策略段（`main.tex:144-185`）"列进关键未编号论证清单，此后 10 节里只引用过它的两个残句（175-177、180-182），整段从未逐字拆过。这是笔记自己登记的缺口，优先补。它是全文唯一一段以散文形式给出完整证明拓扑的文字，后面所有节都在执行它的一句话任务，所以我按"每句 ⇒ 兑现位置"的口径拆。

`(a)` 逐字引用（`main.tex:144-185`，整段照录）：

```tex
\paragraph{Proof strategy.}
We argue by contradiction. The James--Enflo characterization supplies
a nonreflexive space finitely representable in a nonsuperreflexive one.
From it we construct a spreading norm $N$ on
finite sequences for which summing consecutive entries is contractive.
This is a concrete version of the equal-sign-additive construction of
Brunel and Sucheston
\cite{BrunelSucheston1974,BrunelSucheston1975,BrunelSucheston}.
Equal-sign additivity means that merging adjacent coefficients of the
same sign preserves the norm.
The finite-representability formulation and related graph-embedding
applications appear in \cite{Ostrovskii,OstrovskiiRandrianantoanina}.
We include the precise version and
its finite-representability proof in Appendix~\ref{app:norm}.

For each time $n$, the central task is a finite reversible walk with
unit edge labels, changing sign under reversal, whose sum has norm at
least $n/24$ with probability at least $3/20$. Before normalization,
the labels are sums of signed differences of standard basis vectors
in finite coefficient sequences. Their prefix sums are signed indicators
of unions of intervals. A reduced word acting on the
line makes selected prefix sums of the total label alternate between
two levels separated by its reduced length. Consecutive summation converts
these oscillations into a lower bound proportional to the reduced length,
measured in units of the common one-step label norm. Finite Ramsey averaging supplies
increasing charts from a finite set of real points to coefficient indices,
with matching marginal laws, so this
ordered motion can occur along reversible transitions.
The transition letters are independent and uniform; their reduced length
is proportional to $n$ with a fixed positive probability.

An edge label need not be the difference of values assigned to its two
chart states; a marked transition may carry a nonzero label even when
the chart state does not change. A finite lattice lift records traversed
oriented edges as
integer coordinates. Its potential has exactly the required increments
away from the boundary, and rejected boundary moves keep the lifted
chain reversible. Section~\ref{sec:reduction} proves this transfer and
reduces Theorem~\ref{thm:main} to the finite-walk target.
Section~\ref{sec:finite-lemmas} constructs chart transport,
Section~\ref{sec:action} constructs the two prefix levels, and
Section~\ref{sec:walks} assembles the walk and proves its displacement.
```

`(b)` 逐句兑现链，中间步骤补齐。第一句（145 "We argue by contradiction"）的兑现体在 `main.tex:337-338`，反设对象是"型 $p>1$ 且非超反身"二元合取，这条路线我在 1.3 交代过其来由。第二句（145-146）James--Enflo 提供"非自反且有限表示于该空间"的 $Y$：其机理是把 `eq:superreflexive-characterization`（127-134）反向读，$X$ 无等价一致凸范数，则存在 $Y$ 有限表示于 $X$ 且不自反；再往下一层，非自反在附录兑现为 $v\in B_{Y^{**}}$ 与 $\dist(v,Y)>d>0$（`main.tex:844-845`），这一步我从 `Y` 不自反 $\Leftrightarrow$ $B_Y$ 在 $Y^{**}$ 范数拓扑下不闭推出，与附录开头一致。第三句（147-148 "spreading norm" 与 "summing consecutive entries is contractive"）就是 Lemma 2.1 的 (i)(ii)：`eq:spreading`（200-204）给插入删除零项保范，`eq:merge`（213-216）给相邻合并单调不增；"summing consecutive entries"的块版在 223-224 声明（划分成连续区间的每块换成块和仍收缩）。第四、五句（149-153）把血统挂到 Brunel--Sucheston 的 equal-sign-additive，并当场给出释义："merging adjacent coefficients of the same sign preserves the norm"，注意这里动词是 preserves，对应附录 Step 4 的同符号保范段（`main.tex:994-1004`，同号且有理比先经细分保范、连续性扩界），而 (ii) 的混合符号合并只剩不等号；两者差别的中间步骤在凸性论证：固定 $s=a_i+a_{i+1}$，$\varphi(t)=N(\ldots,t,s-t,\ldots)$ 凸，同号窗口内 $\varphi$ 恒等于合并值，异号时窗口退化，只剩端点比较，因此只有 $\le$。第六句起（159-161）声明全篇中心任务：每个时刻 $n$ 要造"单位边标号、反号对称、和以概率 $\ge3/20$ 范数 $\ge n/24$"的有限可逆行走，这三件正是 Proposition 2.2 陈述（245-257）的三行公式；"For each time $n$"预告了链随 $n$ 变（260-262）。162-163 "Before normalization, the labels are sums of signed differences of standard basis vectors"：未归一标签形如 $\pm b_i$ 差之和，兑现于 `eq:labels`（672-675），每条边是 $L$ 对 $(b_{C(\alpha_s+j)}-b_{C(\beta_s+j)})$。163-164 "Their prefix sums are signed indicators of unions of intervals"：中间步骤我补在两点，一是恒等式 $\sum_{a\le C(y)}(b_{C(\alpha)}-b_{C(\beta)})_a=\one_{[\alpha,\beta)}(y)$（734-737），增 chart 下 $C(\alpha)\le C(y)<C(\beta)\iff\alpha\le y<\beta$，前缀和因此把"坐标系数累加"翻译成"实轴上区间示性"；二是负字母在 $C_i$ 读数、按补集恒等式 $\one_{\cA_{s^{-1}}}(h_s^{-1}(y))=1-\one_{\cA_s}(y)$（567-569）改写，于是每个字母的贡献恰是 $\chi_{s_i}(y_{i-1})$（749-752），累加器 $F$ 的前缀值就是"带符号的区间并示性"在秩点处的取值。164-166 "A reduced word acting on the line makes selected prefix sums ... alternate between two levels separated by its reduced length"：兑现是 `eq:two-levels`（758-761）$F(r_j)=V=-n_-$、$F(t_j)=U=n_+$、$U-V=\ell$；"reduced"之所以能出现在陈述层，中间环节是消去不变性：`eq:chi-cancellation`（571-573）给 $\chi_{s^{-1}}(h_s^{-1}(y))=-\chi_s(y)$，相邻互逆字母对 $y_i$ 轨迹与 $c_w(y)$ 双双无影响（582-583），故 $c_w$ 只依赖约化字，约化不变的 $c_w$ 与两级计数（593-605）合起来才让"separated by its reduced length"字面成立；"selected"指 $L/4\le j\le3L/4$ 的窗口秩对（695-698）。166-168 "Consecutive summation converts these oscillations into a lower bound proportional to the reduced length, measured in units of the common one-step label norm"：切割序列的块和数组 $(V,\ell,-\ell,\ldots,\ell,-\ell,-V)$（770-781）经 `eq:linear-displacement`（799-801）给 $N(G)\ge(\ell/6)D_L$；"in units of"量纲账：原始口径 $N(G)\ge(\ell/6)N(g(e))$（单步 $N(g)=D_L$，679-682），两边除以 $D_L$ 才成单位标号版，这就是策略句把归一推迟到最后一次的说法来源，也是证明开头 625-626 "We first construct labels with a common nonzero norm and normalize them at the end" 的兑现。168-171 "Finite Ramsey averaging supplies increasing charts ... with matching marginal laws"：Lemma 3.1（377-386）的 `eq:subtuple-TV` 就是 matching marginal laws，Prop 3.2（432-445）把等边缘律经 min-mass 耦合（469-472）装进可逆链；"so this ordered motion can occur along reversible transitions"点明因果方向：先有保序运动学（§4 的两级结构），再买动力学许可（可逆性），买法就是 chart 平均。172-173 "The transition letters are independent and uniform; their reduced length is proportional to $n$ with a fixed positive probability"：兑现于 808-818，$\{\ell\ge n/4\}\ge1/4$ 与 $n,K,N$ 无关，"fixed"指这个无关于。175-182 段（marked 自由度与格提升）我在 1.4 与第 5 节已拆，此处只登记策略句与实现句的对应：175-177 对应 242-243 与 266-268，177-181 对应 294-333。183-185 的路线图在 `\section` 行号上逐节对得上（187、360、499、617）。

`(c)` 假设、常数、指数的机械理由。其一，反证为何必需：`eq:markov-type`（74-79）是对全部有限平稳可逆链的全称上界，正向构造等价范数要穿过"由矩不等式到模量"的量化鸿沟，文中没有这座桥；反证只需存在一条违规链，量化方向（全称改存在）恰与 Markov 型的定义形态匹配。145-146 的 $Y$ 与 844-845 的 $v,d$ 说明非超反身供的是"极限点不 attainment"这一结构，结构转成行走违规是全文唯一的因果通道。其二，$3/20$ 与 $n/24$ 为何在策略段就已写死（159-161）：数值在 Step 4/Step 5 组装完就已确定（$1/24=\tfrac13\cdot\tfrac12\cdot\tfrac14$ 的三个因子分别在 797、795、816-818；$3/20=\tfrac14-\tfrac1{10}$ 在 820），策略段提前引用的是终值，说明作者写作顺序与构造顺序相反，[推测] 与第 14 节末段"占位常数回填"的判断互证。其三，Markov 型常数与超反身模量之间的量化接口，在这一段话的层面看是零：策略段不含 $K$，也不含任何模量符号；全文唯一的对接点是增长率对决（345-350），即"对一切 $n$ 成立"对上"型 $p>1$"。$K$ 进入不等式的位置在 Lemma 2.3 右端（286-289）与主证明（348），而超反身侧的模量由 121-124 外包给 NPSS+Pisier 的经典等价，正向（$K$ 到凸模量）不存在显式公式，[外部推断] 这一点从 Lean 侧的常数流向也能旁证：形式化里 $K=64D$ 只出现在反向（光滑到型，`SmoothMarkovType.lean:23`），正向障碍链全程只消费 $K$ 的固定性。少一份常数会断的位置逐一登记：概率底数 $3/20$ 若被换成随 $n$ 衰减的量 $\delta_n$，`eq:contradiction` 左端变 $\delta_n(n/24)^p$，当 $\delta_n\ge c\,n^{1-p}$ 失败时线性右端不再被压倒，矛盾在 350 行就地熄灭；位移底数 $1/24$ 若换成随 $n$ 趋零的 $c_n$，同样在 346-348 的幂次比较里失去 $n^p$ 主项；$U-V=\ell$（761）里若是原字长，并非约化长，Step 5 的 $+1/2$ 增量（810-812）对不上账，因为漂移公式只对约化过程成立；窗口 $[L/4,3L/4]$（695、766）若不含裕量 $[-2n,L+2n]$（650）之半，`eq:transport-bounds`（715-718）的"整体含于 $(0,L)$"断，`eq:transport-rank`（720-722）随之断。其四，策略段对 $p$ 一字不提（144-185 通篇无 $p$），此非疏漏，恰是"延迟使用假设"的陈述层证据：定义只要求 $p>0$（74），构造层全部对 $p>0$ 逐字成立，与第 11 节其二相互印证。

`(d)` 候选失败路线。其一 [推测]，把"prefix sums are signed indicators of unions of intervals"读成闭区间惯例：恒等式 734-737 在 $y=\beta$ 处左端为 $0$（$b_{C(\alpha)}$ 与 $b_{C(\beta)}$ 同时进入前缀、互相抵消），若意图取 $[\alpha,\beta]$ 则该点示性应为 $1$，两级计数（593-605）里边界秩的取值当场与 745-748 的 $-\one_{\cA_{s_i^{-1}}}(y_i)$ 补偿式打架；tex 738 "This explains the half-open interval convention" 是对这条错路的显式拦截。其二 [推测]，在策略段就把 $p\le2$ 写进假设：定义域是 $p>0$（74），定理只要求"at least one $p>1$"（91），若我代读时顺手加 $p\le2$，陈述变成"型 $p\in(1,2]$"，需要额外走一次向下封闭归约，而论文正文没有这步（我按第 0 节的口径自己核过 Jensen 论证），加了反而在 350 行的临界 $n$ 表达式上引入无来由的分支。其三 [推测]，把"measured in units of the common one-step label norm"提前实现：在 Step 1 就把每条标签除以各自的 $N(g)$，则 Step 4 数组 $(V,\ell,-\ell,\ldots)$ 里的整数系数 $V,\ell$ 被逐边常数污染，`eq:compressed`（779-781）的 spreading 归并（各 $\ell D_{L/2}$ 计重）不再成立，$1/6$ 与 $1/24$ 全部失去出处；证明开头 625-626 把归一压到结尾，正是避开这一岔路。

## 16 加深二：Proposition 2.2 陈述（main.tex:245-262）的逐格拆解

第 9 节拆了 prop:walks 的证明（Step 1-5），但这个标签的陈述本身在笔记里只以转述出现（第 2 节"对每个 $n$ 用 Proposition 2.2 得链与 $g$"、1.4 的(乙)块）。陈述是被消费最多的接口（主证明、Lemma 2.3、失真传递都从它取件），逐字补拆。

`(a)` 逐字引用（`main.tex:245-262`）：

```tex
\begin{proposition}[A finite walk with linear displacement]\label{prop:walks}
Let $N$ be a spreading invariant norm on $c_{00}$ for which merging
adjacent entries is contractive. For every integer $n\geq1$, there are
a finite stationary reversible marked chain and an odd labeling $g$
in a finite coordinate span such that
\[
 N(g(e))=1\qquad\text{for every edge }e,
\]
and, for the first $n$ edges $E_1,\ldots,E_n$ of the stationary chain,
\begin{equation}\label{eq:unit-walk}
 \Prob\left\{N\left(\sum_{i=1}^n g(E_i)\right)
                 \geq\frac n{24}\right\}\geq\frac3{20}.
\end{equation}
\end{proposition}

The construction occupies Sections~\ref{sec:finite-lemmas}--\ref{sec:walks}.
The chain and coordinate dimension may depend on $n$; the numerical
constants do not.
```

`(b)` 量词解剖与消费链。陈述形如：$\forall N$（spreading invariant 且相邻合并收缩）$\forall n\ge1$ $\exists$ 有限平稳可逆 marked chain $\exists$ 奇标号 $g$（住有限坐标 span）满足两行条件。逐格登记读者：假设里的两条 $N$ 性质在证明内分别于 678-682（spreading 给单步 $N(g)=D_L$）、631-632（spreading+三角给 $D_{k+l}\le D_k+D_l$）、777-779（合并收缩给块和替换 $N(G)\ge N(\text{压缩数组})$）被消费，Lemma 2.1 的 (iii)（嵌入 $X$）不出现在本命题里，它在主证明 340-341 与失真传递 270-278 才交货：命题本身是纯 $c_{00}$ 组合几何陈述，一个 $X$ 字都不见，这是"延迟使用假设"的第二处结构证据。"$n\ge1$ 全体"被 342 行"For each $n$，apply Proposition \ref{prop:walks}"逐点取用；"finite stationary reversible"被 Lemma 2.3 的 `eq:edge-balance` 前提（282）取用；"odd"被提升的势一致性（297-298、313）取用，同时它使负字母定义（676-677）成为对边取值的合法延拓；"in a finite coordinate span"被 270-273 的"only the span of the finitely many values"取用，具体维数是 Prop 3.2 输出的 $B$，累加器窗口 $0\le k\le B$ 与 $F(B)=0$（730-732）就是有限性的现场。单位条件 $N(g(e))=1$ 对每条边成立，我补一步中间推论：结合奇性，自反边（$e^*=e$）会被强制 $g(e)=0$（243），与 $N(g(e))=1$ 矛盾，所以满足陈述的链必然没有星不动边，Proposition 3.2 的 chart 边 $(C,s,C')^*=(C',s^{-1},C)$ 恰好在构造层排除了它（无不动点对合，434-435）。这一点与 Lemma 2.3 保留 298 行的自反边特判并不冲突：转移引理面向带 marks 的一般 marked chain（可有自反边、其标签恒零），本命题交付的特例链没有这种边，引理覆盖面比陈述宽是刻意的分工。`eq:unit-walk` 到 `eq:contradiction` 之间我补一行(tex 在 345-347 一步写入)：对非负随机变量 $Y=N(\sum g(E_i))$，$\E Y^p\ge\Prob\{Y\ge n/24\}\cdot(n/24)^p\ge(3/20)(n/24)^p$，事件指示下界法，不经 Jensen。

`(c)` 常数、指数的机械理由。$1$（单位标号）：由 822-824 全体除以 $D_L$ 得到，$D_L>0$ 的根据在附录 `eq:nondegenerate`（932 与 627-632 的衔接，第 9 节 Step 0 已核）；取等号是构造的自然产物，逻辑上只需 $\le1$，因为 RHS 是 $\E N(g(E_1))^p$；真正要紧的是所有边共用同一个常数，Step 4 的数组计重才有 $N(G)\ge(\ell/6)D_L$ 这种单一方程。$n/24$：$24=3\cdot2\cdot4$，因子分别出自 797 的 $\max\{A-B,B/2\}\ge A/3$、798-800 的 $D_L\le2D_{L/2}$、816-818 的阈值 $n/4$；对 $N$ 的齐次性使 $1/24$ 与 $D_L$ 无关，归一后全文数值与 $N$ 的具体尺度彻底解耦。$3/20$：$\Prob\{\text{all good}\}\ge1-n\epsilon=9/10$（805-807）、$\Prob\{\ell\ge n/4\}\ge1/4$（813-818），交事件用 $P(A\cap B)\ge P(A)+P(B)-1$ 得 $3/20$；预算上限可算：$n\epsilon<1/4$ 是交事件为正的临界，$\epsilon=1/(10n)$ 留了 $1/20$ 余量，任何满足该临界的 $\epsilon$ 都可行。$p$ 不出现在陈述里：violation 的 $p$ 依赖全部推迟到 350 行的增长率对决，与第 11 节其二、本节 (b) 的"纯组合几何"读法一致。若把 $3/20$ 或 $n/24$ 改为依赖 $n$：346-348 的两端失去幂差，350 的矛盾蒸发，这就是 260-262 "the numerical constants do not" 一句所守的闸口，也是 Markov 型常数（$K$）与超反身性之间唯一量化接口的准确形状：不需要模量、不需要链尺寸的界，需要的只是概率与位移两个底数的 $n$-无关性。$n\ge1$ ，并非 $n$ 充分大：主证明需要在每个 $n$ 有点态陈述（342 的"For each $n$"），且 $n=1$ 时 $L=16$、$\epsilon=1/10$ 各件仍在定义域内（639-640），弱化成 $\exists n_0\,\forall n\ge n_0$ 逻辑上也够（350 只需一列 $n\to\infty$），[推测] 全文表述选强口径是为了让 261-262 的依赖声明覆盖最小情形。

`(d)` 候选失败路线。其一 [推测]，把量词顺序写成 $\exists$ 链 $\forall n$：一张固定链配单位奇标号时，Lemma 2.3 的 `eq:odd-markov` 对这条链的一切 $n$ 同时成立，$\E N(\sum_1^n g(E_i))^p\le K^pn$，永远撞不出 $n^p$ 下界；violation 只能是链族的渐近现象，260-262 的"may depend on $n$"是这条错路的显式围栏（另见第 17 节其一并）。其二 [推测]，在 Step 1 之前逐边归一：见 15 `(d)` 其三，数组整数系数被毁，779-781 断。其三 [推测]，把"$g$ 住有限坐标 span"读作可省略的技术修饰：去掉它，270-278 的失真传递失去定义域（$T$ 只需在标签张成的有限维上存在，`main.tex:271-272`），Lemma 2.1 (iii) 的"每个初始坐标 span 嵌入 $X$"就不再够用，需要 $N$ 的完备化整体嵌入 $X$，并非超反身空间里这样的等距嵌入根本不存在，链条断在 343-344 的"applied through the finite span of these labels"。

## 17 我走过的错路（追加条目）

### 17.1 以为存在一张"万能违规链"

我在把 1.4 的(乙)块抄成公式时，顺手把量词写成了 $\exists$ 一条链 $\forall n$：仿佛构造一次弹道行走，此后所有时刻通用。必然失效的具体理由（不靠论文文本也能独立成立）：对任何固定的有限 marked chain 与单位奇标号，Lemma 2.3（`main.tex:280-333`）的证明只用到 `eq:edge-balance`，格提升对这张链的每个 $R$ 都成立，令 $R\to\infty$ 得 $\E N(\sum_1^n g(E_i))^p\le K^pn$ 对一切 $n$ 一致成立，违规链作为单体不存在；而主证明要的恰是"对每个 $n$ 存在（可能不同的）链"（342-344），矛盾来自把一列链的 $n$ 阶矩下界 $(3/20)(n/24)^p$ 与同一 $K$ 的线性上界并置（345-350）。反证文本在 `main.tex:247`（"For every integer $n\geq1$, there are"）与 260-262（链与坐标维数可依赖 $n$、数值常数不可）。

### 17.2 极限顺序倒着取

拆 Lemma 2.3 时我试过先让 $n\to\infty$（固定 $R$）再收 $\alpha_R$，想着"反正 $R$ 最终任意大"。失效位置可以精确到行：提升定义在 $S\times Q_R$（301-303），内部事件要求初值在 $Q_{R-n}$（316-317），一旦 $n\ge R$，$2(R-n)+1$ 非正，闭式 $\alpha_R$（322）失去概率含义，324-325 的下界 $\alpha_R\E\|\sum g(E_i)\|^p$ 无从谈起；几何理由同样硬：格点被关死在有限立方体里时 $\Phi$ 的像集 $\{\sum_ja_jg(e_j):a\in Q_R\}$ 有界，任意两步势差 $\le$ 该直径，$n$ 步位移的任意阶矩都被常数一致控制，根本不会线性增长，被拒绝的转移只是停留（303-304、306），"rejections add only self-loop probabilities"。正确次序是 284/301 的 "For an integer $R>n$" 先行、331 的 "Let $R\to\infty$" 收尾，先固定链与 $r$。第 5 节 (c) 已记过"两个极限不可交换"，这次是它咬到我本人。

### 17.3 想从反证里榨出显式光滑模量

我曾以为 Theorem 1.1 的定量含量是"给定 $p,K$ 造出凸模量 $\delta(\epsilon)$ 的界"，于是试图沿 797/800/820 的常数链把 $1/24$、$3/20$ 代进 James--Enflo 反向、追踪每一步的量化损失。该路线必然断在三个文本位置：`main.tex:121-124`（光滑范数的存在性整段外包给 NPSS+Pisier，正文只引用、不构造）、`main.tex:139-142`（外部工具清单里没有模量计算）、`main.tex:379` 与 437-438（$B$ 由 Ramsey 定理存在性给出，全文无任何界）。矛盾结构（350）只消费"$n$ 任意"这一条信息，对常数优化不做任何回报；[外部推断] 想给 $K$ 到模量的显式换算，据我所知的路线只能走 NPSS 鞅正方向的逆命题，而该逆命题在文献里无一般结果。教训与第 11 节其三口径相同：交付物是违规链族，不是模量。

### 17.4 拿非平稳链去试 Markov 型

装配失败率账时（805-807），我想过把 union bound 换成"选一个最坏的初始 chart 起步"，省掉平稳性。这在引用点上直接越权：`eq:markov-type`（74-79）的主语是 68-73 意义下平稳可逆的链，$\pi_iP_{ij}=\pi_jP_{ji}$ 是入场券；Lemma 2.3 右端 $\E N(g(E_1))^p$ 的分布 $\pi(e^-)q(e)$（284-289）也只在平稳起步时才是单步边分布，非平稳下格提升的 $\pi\otimes\operatorname{Unif}(Q_R)$ 平衡验证（304-306）断链，主证明在 343-344 调用转移引理时资格不足。论文的"stationarity and the union bound"（807）六个字里 stationarity 在前，顺序即逻辑：平稳性把每步失败率一致压到 $\epsilon$，union bound 才有可乘的齐次预算。

## 18 台账续行

两表分工声明：以下数据行承接 §14 原表表头五栏（`符号 / 数值或增长率 / 位置(文件:行) / 被谁消费 / 若改动断在哪一步`），§14 已登的 19 行原样不动、此处一律不重复；新行只补 §15--§17 加深时新点名的量，全部来自 tex 侧，故位置栏一律 `main.tex:行号`。

| $Q_R$ | 格立方体 $\{-R,\ldots,R\}^r$，边长 $2R+1$，$R>n$ | main.tex:301 | 提升链状态空间与内立方 $Q_{R-n}$（316-322） | 取 $R\le n$：$Q_{R-n}$ 空，$\alpha_R$ 分子 $2(R-n)+1$ 非正，324-325 下界无源，331 的极限失去对象 |
| $\Phi(z,a)$ | 势 $\sum_{j=1}^r a_jg(e_j)$，接受边增量 $g(e)$、拒绝边增量 $0$ | main.tex:311-315 | 全证明唯一有资格进 `eq:markov-type` 的 $S\times Q_R$ 上状态函数（326-329） | 让拒绝边也携带 $g(e)$：增量依赖所选边、$\Phi$ 不再是状态函数，326 的引用越权，断在调用行 |
| $u_j$ 位移指派 | $e_j\mapsto u_j$、$e_j^*\mapsto -u_j$、星不动边 $\mapsto 0$ | main.tex:295-298 | 格坐标数 $r$ 的来源与势-标签一致性（313） | 删 298 特判：自反边奇性已强制 $g(e)=0$（243），非零位移使势增量与边标签脱钩，313 的记账断 |
| $N(g(e))=1$ | 全体边严格等范数，由 822-824 除以 $D_L$ 实现 | main.tex:251 | eq:odd-markov 右端恰为 $K^pn$（344）；结合奇性排除自反边 | 逐边归一（先除后装配）：Step 4 整数系数数组被毁，`eq:compressed`（779-781）断；只留上界 $\le1$ 则不坏，等号是构造产物 |
| $\lvert\cS\rvert=4$ | 字母集 $\{u,v,u^{-1},v^{-1}\}$，独立均匀 | main.tex:508-509,808-812 | Step 5 条件期望增量 $+1/2$（810-812）与尾概率 $1/4$（816-818） | 缩到 $2$ 字母：$\ell>0$ 时增量为 $0$，约化长变简单对称游动，818 尾界随 $n$ 衰减，$3/20$ 归零 |
| $\chi_s(y)$ | 示性组合 $\one_{\cA_s}(y)-\one_{\{s\ \mathrm{negative}\}}$ | main.tex:563-565 | `eq:F-cocycle`（749-752）与 `eq:F-levels`（758-761） | 去掉负字母的减一：`eq:chi-cancellation`（571-573）不成立，743-748 的补集补偿无机制，$U-V=\ell$ 退成原字长，17.2 式的全账乱 |
| $D_1$ | 单对数组范数 $N(1,-1)$，同时充当误差项与主项 | main.tex:789,795 | 估算一 $\ell(D_{L/2}-D_1)$ 与估算二 $(\ell/2)D_1$ 经 797 合并成 $\ell D_{L/2}/3$ | 把 797 的 $\max\{A-B,B/2\}\ge A/3$ 换成任一单项：$D_1$ 接近 $D_{L/2}$ 时估算一非正、$D_1$ 极小时估算二失效，$1/6$ 与 $1/24$ 同时断源 |
| 内对数 $L/2$ | $b-a=3L/4-L/4=L/2$ 个 $(\ell,-\ell)$ 块 | main.tex:777-780 | `eq:compressed` 的 $\ell D_{L/2}$ 计重 | 窗口收窄到 $[\theta L,(1-\theta)L)$：内对数 $(1-2\theta)L$，$D_L\le(1-2\theta)^{-1}D_{(1-2\theta)L}$ 重走 798 的次可加归纳，$1/24$ 同步劣化但矛盾结构不变 |
| min-mass 耦合 | 对角质量 $\min\{\mu(a),\mu'(a)\}$，匹配概率 $=1-\TV(\mu,\mu')$ | main.tex:469-472 | Prop 3.2 成功率 $\ge1-\epsilon$（经 `eq:subtuple-TV` 382-384） | 换任意耦合：匹配概率不再由 TV 控制，`eq:subtuple-TV` 无法兑现，$\epsilon=1/(10n)$（639-640）预算断源，$3/20$（820）随之断 |
| 区间惯例 $[\alpha,\beta)$ | 前缀和恒等式右端的示性集合 | main.tex:734-738 | `eq:F-cocycle`（749-752）与两级取值的边界一致性 | 改闭区间：$y=\beta$ 处恒等式两边取值相反（左端两坐标抵消为 $0$），567-569 补集式与 745-748 负步补偿同时错位 |

## 台账补表

旧的两张表（第 14 节与第 18 节）都是"先有符号、再找它被谁用"，我按符号去查消费点，于是同一符号的多处调用被压进同一行。这一轮我换成反向列法：一行只服务一个调用点，第一格写被消费的量化对象，第四格写它喂进去的那一次调用（尽量给到 main.tex 的行区间），第五格写这次调用失手的文本位置。同一定量因此会出现多次（$D_1$、$\ell$、$\epsilon$ 各占数行），我不再去重，因为去重正是旧表信息丢失的地方。

全部位置栏出自我在 build 目录下逐行读过的三个 tex：`main.tex`（`wc -l` 实测 1020 行）、`references.tex`（实测 99 行）、`figures/chart-transport.tex`（实测 14 行，仅示意、不承载论证）。行号是 awk 定点打印核对过的，一批约四十行，登记在本节末尾自检。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| 细致平衡 $\pi_iP_{ij}=\pi_jP_{ji}$ | 逐对 $(i,j)$ 恒等，无数值量级 | main.tex:72 | `eq:markov-type`(74-79) 的主语资格与 807 的 $n\epsilon$ 并集界 | 换非可逆链：807 与 326 两处调用同时越权（17.4 的失效点） |
| $K^p t$ | 右端对时刻严格线性 | main.tex:78 | `eq:contradiction` 右端(348) 与 350 的增长率对比 | 上界改 $t^{\theta}$、$\theta>1$：350 两侧同阶，矛盾整体消失 |
| 等价范数双侧界 $a\lVert x\rVert\le\lvert x\rvert\le b\lVert x\rVert$ | $a,b>0$ 固定，比值 $b/a$ 即失真 | main.tex:82 | 118 的等价不变性、121-124 对 Naor 问题的关闭 | 只留上界：118 断，218 的 (iii) 失去可配对的失真口径 |
| $\epsilon\in(0,2]$ 的截断 | 定义域上限恰为 2 | main.tex:83 | 127-134 刻画左端、122-124 引经典三重等价 | 放宽上限：定义与单位球几何脱钩，与 Lean 端 `0<ε ∧ ε≤2` 的登记分岔（第 13 节） |
| $\lVert T\rVert\lVert T^{-1}\rVert<1+\eta$ | 失真随 $\eta$ 任意接近 1 | main.tex:138 | 271-273 的传递前提、970-978 的 (iii) 交付 | 要求 $=1$：978 的 $\eta\downarrow0$ 无对象，附录 Step 3 全线报废 |
| 三输入分工句 | 定性，登记调用次序 | main.tex:192 | 189-192 把 2.1、2.2、2.3 串成一条 | 次序颠倒（先 2.3 后 2.2）：338-344 的引用无对象可消费 |
| "边标签非点位差"提示段 | 定性，给出提升动机 | main.tex:176 | 295-333 的格提升与 673-677 的标号定义 | 若标签本就是点位差：295-333 整块冗余，装配链平白多一环 |
| `eq:spreading` 插零不变 | 坐标位置无关，只依赖顺序 | main.tex:201 | 632 次可加、679-681 全边等范数、923 与 966 的极限继承、1002 的零系数 | 只对等长插入成立：680 的 $D_L$ 随 chart 值域位置漂移 |
| `eq:merge` 相邻合并 | 单向不增（$\le$） | main.tex:214 | 777-781 的压缩数组 | 改成等号：1004-1013 的凸性论证只覆盖同符号情形，异符号块合并断 |
| (iii) 初始坐标张成空间可嵌入 | 失真 $1+o(1)$，维数随 $n$ | main.tex:218 | 341 的主证明调用、271-278 的传递 | 只对固定维数成立：342 的"每个 $n$"失效，矛盾无源 |
| 行和归一 $\sum_{e:e^-=z}q(e)=1$ | 严格等号 | main.tex:235 | 240 的平稳可逆、486-488 的条件概率求和 | 放松为 $\le1$：488 的求和为一断，Prop 3.2 的链不闭合 |
| `eq:edge-balance` | 边级细致平衡 | main.tex:238 | 240、283 的前提、304-306 的提升平衡 | 只写状态级平衡：305 的 $\pi\otimes\operatorname{Unif}(Q_R)$ 无账可记，可逆性断 |
| 奇标号 $g(e^*)=-g(e)$ | 逐边严格反对称 | main.tex:243 | 676-677 负标签、297-298 位移指派、313 增量记账 | 允许偶分量：313 的增量与所选方向脱钩，$\Phi$ 不再是状态函数 |
| $N(g(e))=1$ | 全体边同一范数（归一前为 $D_L$） | main.tex:251 | 344 的右端 $\E N(g(E_1))^p$、822-824 的除法 | 只给上界 $\le1$：824 的等号除法失效，$1/24$ 退成未知常数 |
| $n/24$ 与 $3/20$ 同处一式 | 两个绝对常数并列 | main.tex:256 | 346 一次性消费两数 | 任一改动：256 与 346 需同步，否则命题陈述与主矛盾分家 |
| 缩放双侧 $\lVert x\rVert\le\lVert Tx\rVert_X\le(1+\eta)\lVert x\rVert$ | 下界取 1、上界 $1+\eta$ | main.tex:275 | 278 的 $(1+\eta)K$、344 的调用 | 下界也留裕量 $(1-\eta)$：278 常数变 $(1+\eta)/(1-\eta)$，极限步需重做 |
| `eq:odd-markov` 右端 | $K^p n\,\E N(g(E_1))^p$ | main.tex:288 | 347-348 的中间不等式 | 多出维数因子：350 的线性对 $n^p$ 对比断 |
| 星轨道代表 $u_j$ | $r$ 个坐标，$1\le j\le r$ | main.tex:296 | 301 的 $Q_R$ 维数、311 的势、322 的指数 | $r$ 随 $n$ 增长：322 要 $R$ 超指数才收敛，331 的极限步断 |
| 提升状态空间 $S\times Q_R$ | 规模 $\lvert S\rvert(2R+1)^r$，随 $R$ 的 $r$ 次幂增长 | main.tex:302 | 306-307 的有限平稳可逆断言、326 的调用资格 | 换成整格 $\Z^r$：链不有限，定义主语(68) 拒收 |
| 拒绝边只加自环质量 | 增量为 0、测度不改 | main.tex:306 | 307 的可逆断言、315 的单步成本上界 | 拒绝也走一步：315 的上界无源，右端成本失控 |
| 同提议边耦合到首次拒绝 | 内事件概率 $\alpha_R$ | main.tex:319 | 320-321 的独立性、325 的下界 | 另起随机源：322 的乘积形式无出处，325 的 $\alpha_R$ 因子断 |
| $\alpha_R=((2(R-n)+1)/(2R+1))^r$ | 趋于 1，裕量随 $R$ 线性 | main.tex:322 | 325 与 328 的下界、331 取极限 | $R\le n$：分子非正（17.2 的失效位置），下界无源 |
| `eq:contradiction` 右端 | $K^p n$ | main.tex:348 | 350 的 $p>1$ 唯一开火处 | 右端带 $n\log n$ 时 350 仍成立；带 $n^p$ 时全断 |
| $\TV(\mu,\mu')=\frac12\sum_x\lvert\mu(x)-\mu'(x)\rvert$ | 半因子 | main.tex:375 | 402 的"至多半范数"兑换、472 的匹配概率 | 去掉 $1/2$：402 兑换率翻倍，404 的 $R\delta<\epsilon$ 需重算 |
| $W_B=\bigoplus_{\rho}\ell_1(T_{B,m_\rho})$ | 分量和范数 | main.tex:397 | 400-402 的凸包判据、416-419 的对偶界 | 换 $\ell_\infty$ 求和：419 的求和界与 402 的 TV 兑换同时错位 |
| 颜色数只依赖 $R,\delta$ | 与 $B$、与具体 $f_\rho$ 无关 | main.tex:409 | 411-414 的 Ramsey 抽取 | 颜色数依赖 $B$：Ramsey 前提破坏，$B$ 无法自指地放大 |
| Prop 3.2 的逐点同时匹配 | 概率 $\ge1-\epsilon$ | main.tex:442 | 466-468 的耦合、496 的单步失败率、665-668 的 goodness | 只在边缘分布意义成立：719-722 的秩传递断 |
| 对角质量 $\min\{\mu(a),\mu'(a)\}$ | 匹配概率 $=1-\TV$ | main.tex:471 | 472、467-468、480-481 的逆测度 | 换任意耦合：`eq:subtuple-TV`(383) 兑现不了，$\epsilon$ 预算断源 |
| 逆字母测度 $\lambda_{s^{-1}}(C,C')=\lambda_s(C',C)$ | 与 $\lambda_s$ 同成功率 | main.tex:478 | 493 的边测度不变性、240 的可逆 | 不对称：493 断，Lemma 2.3 失去引用资格(283) |
| `eq:chart-edge-mass` $=\frac1{\lvert\cS\rvert}\lambda_s(C,C')$ | 均匀字母权重 | main.tex:491 | 493 的不变性、808-812 的独立均匀 | 字母非均匀：811 的"四字母恰一抵消"失效，$\E\ell\ge n/2$ 无出处 |
| 单步失败率至多 $\epsilon$ | $\epsilon=1/(10n)$ 前置 | main.tex:496 | 807 的 $n\epsilon=1/10$、820 的 $3/20$ | 失败率不随步一致：并集界需逐个求和，1/10 预算失控 |
| $\cA_s=\bigcup_j[\alpha_s+j,\beta_s+j)$ | 半开、周期 1、闭包互不相交 | main.tex:517 | 563-564 的 $\chi_s$、745-748 的补集补偿、737 的示性 | 改闭区间：568 在端点处两边同为 1，`eq:chi-cancellation`(572) 断 |
| $h_s(y+1)=h_s(y)+1$ 与 $h_{s^{-1}}=h_s^{-1}$ | 周期 1、逆配对 | main.tex:523 | 580-581 的 $c_w$ 周期性、545-546 的延拓 | 去周期：577 的求和跨整数平移无定义，589 只在一个基本区间成立 |
| $\lvert h_s(y)-y\rvert<2$ | 严格小于 2 | main.tex:525 | 693-694 的 $\lvert h_w(0)\rvert<2n$、712-713 归属、716 裕量 | 写成 $\le2$：694 上界变 $2n$，710 的 $j-m$ 触界，716 的严格含性断 |
| `eq:interior` $h_w(0)\in\operatorname{int}(\cA_{s_1})$ | 严格内点，蕴 $h_w(0)\notin\Z$ | main.tex:531 | 603-604 第二级全 1、694 的 $0<z<1$、611 交错 | 只在外闭包：611 的 $j<z+j<j+1$ 可退化，700 的严格交错断 |
| 三断点仿射值 $\beta_s-1,\alpha_s,\beta_s$ | 两段斜率皆正 | main.tex:542 | 545 正斜率、548-549 补区间恰映到弧、551-552 位移界 | 首值改 $\beta_s$：541 行的单调性反（映回同一弧），524 的集合恒等式断 |
| 补集示性恒等式 | 逐点 $1$ 减 | main.tex:568 | 571-573 的 $\chi$ 反对称、743-748 的负步补偿 | 弱化为不等式：572 的 $-\chi_s$ 断，760 的 $U-V=\ell$ 退成原字长 |
| 反向递推 $y_i=h_{s_i}^{-1}(y_{i-1})$ | 沿字逆向行走 | main.tex:576 | 579 终点 $y_k=h_w^{-1}(y)$、703-711 两族闭式、749-752 | 改正向：706 与 710 的字序反，721 的秩等式取到错误的 chart 时刻 |
| 约化不变性（末点与 $c_w$ 同不变） | 删相邻逆字母，两值不改 | main.tex:582 | 594 的归约替换、753-754 的"$G$ 保留全部 $n$ 个原标签" | 删此条：758-761 只对原字成立，$\ell$ 与 $n$ 脱钩，Step 5 概率账作废 |
| `eq:two-levels` | 两级取值 $-n_-$ 与 $n_+$ | main.tex:589 | 758-761 的 $V,U$、772-774 的块和行 | 任一级符号翻转：774 的 $\pm\ell$ 变同号，779-781 的交替数组与 789 的减端点账同时断 |
| 交错点 $j<z+j<j+1$ | 两级互穿 | main.tex:611 | 697-698 的 $t_j$、700 严格交错、770-774 切点表 | $z=0$：611 退化，700 的 $r_j<t_j$ 断，内对数 $L/2$ 归零 |
| $D_{k+l}\le D_k+D_l$ | 次可加 | main.tex:632 | 798 的 $D_L\le2D_{L/2}$、800 的 $\ell D_L/6$ | 次可加断：因子 2 丢，$1/24$ 变未知 |
| $L=8(n+1)$ | 随 $n$ 线性，$+1$ 兜住 $n=1$ | main.tex:639 | 648-651 landmark 窗、695 与 777 的 $[L/4,3L/4]$、799-800 | 取 $8n$：$n=1$ 时 $L/4=2$，716-718 的 $(0,L)$ 严格含性断 |
| $\epsilon=1/(10n)$ | 与 $n$ 反比 | main.tex:639 | 669 的单步 goodness、807、820 | 取 $1/(4n)$：820 的 $3/20$ 归零，256 与 346 同时失据 |
| landmark 的 $\lvert w\rvert\le n$ 与 $\pm2n$ 裕量 | 集合规模随 $n$ 多项式 | main.tex:650 | 699 的归属、712-713、716 | 裕量取 0：710 的 $j-m$ 越界，698 的 $t_j$ 无 chart 秩 |
| $D_s=\{a\in\Lambda:h_s(a)\in\Lambda\}$ | $\Lambda$ 上的部分序双射 | main.tex:659 | 656-658 的 Prop 3.2 输入、667 的逐点范围 | 取全 $\Lambda$：$h_s(a)\notin\Lambda$ 处 667 右端无定义 |
| `eq:good` 秩等式 | 与 442 同式，字母换成 $h_s$ | main.tex:667 | 719-722 传递、740-748 贡献计算 | 只在多数 $a$ 成立：741 的示性兑换断，`eq:F-cocycle`(751) 断 |
| `eq:labels` 的窗口 $\sum_{j=0}^{L-1}$ | 每标签 $2L$ 个非零系数 | main.tex:674 | 679-681 等范数、735-737 前缀恒等式、740-742 | 上限改 $L+1$：737 在 $y=L$ 处示性错，743-748 的边界补偿断 |
| 负标签由奇性倒推 $g(C,s,C')=-g(C',s^{-1},C)$ | 与正标签同范数 | main.tex:677 | 743-748 的负步贡献、679-680 的两类同值 | 直接按 $C_{i-1}$ 定义：721 的秩等式时刻错，$F$ 不再是 $c_w$ |
| `eq:one-step-norm` $N(g)=D_L$ | 好坏步同值 | main.tex:680 | 822-824 归一化、251 的单位化 | 取值依赖 goodness：251 的全边等范数断，344 右端成随机量 |
| $m=\lfloor h_w(0)\rfloor$，$z=h_w(0)-m$ | $-2n\le m\le2n-1$ | main.tex:691 | 710 的位移 $j-m$、694 的 $0<z<1$ | 不取整：710 非整移，$z+j\notin\Lambda$，698 无定义 |
| $r_j<t_j<r_{j+1}$ | 严格交错 | main.tex:700 | 770-774 切点表、779-781 交替数组 | 同秩：出现零长块，777 的内对数 $L/2$ 缩水，789 计重错 |
| `eq:transport-bounds` $j-2n<y_i<j+1+2n$ | 窗口宽 $1+4n$ | main.tex:716 | 718 落入 $(0,L)$、743 与 746 的示性可读 | 窗口宽超过 $L$：743 的 $y_i\in(0,L)$ 断，负步贡献无法兑换 |
| `eq:transport-rank` 三段等式 | 跨 $n$ 步归纳 | main.tex:721 | 740-742、749-752 | 只有单步：$C_i(y_i)=C_0(y_0)$ 的归纳断，753 的标量化散架 |
| 标签总系数和为 0 | $F(0)=F(B)=0$ | main.tex:732 | 770-774 表首末列、787-790 端点误差 | 非零和：末块除 $-V$ 外还有漂移项，789 的 $\ell D_{L/2}-\lvert V\rvert D_1$ 断 |
| 前缀-示性恒等式 | 半开区间惯例 | main.tex:736 | 740-748 两类贡献、751 | 改闭区间：$y=\beta$ 处两端取值互反，745-748 的减一补偿错位 |
| `eq:F-cocycle` | 标量化 $F(C_0(y_0))=c_w(y_0)$ | main.tex:751 | 756-761 两级代入、772-774 | 若 $F$ 依赖代表元：758 的引理应用断，$\ell$ 无范数下界 |
| $U-V=\ell$ | 两级差恰为约化长 | main.tex:760 | 772-774 块和、789 与 795 两估算 | 用原字长：789 计重虚高，822 的 $nD_L/24$ 不成立 |
| $a=L/4$，$b=3L/4$ | 居中窗口 | main.tex:766 | 777 的内对数 $L/2$、795 的分区 | 不对称取窗：716-718 的一侧裕量不足，700 的交错断 |
| 末块非空 $r_b<t_b\le B$ | 依赖 chart 值域上界 | main.tex:783 | 779-781 数组合法性、787 端点扣除 | 末块空：774 的 $-V$ 列与 $B$ 列合并，732 的 $F(B)=0$ 无处安放 |
| 估算一 $\ell(D_{L/2}-D_1)$ | 可正可负 | main.tex:789 | 797 与估算二合成 | 单独使用：$D_1$ 接近 $D_{L/2}$ 时下界非正，800 无源 |
| 估算二 $\max\{\lvert V\rvert,U\}D_1\ge\frac\ell2D_1$ | 单项保底 | main.tex:795 | 797 | 去掉：797 的 $A/3$ 合成断，$1/6$ 与 $1/24$ 同时断源 |
| $\max\{A-B,B/2\}\ge A/3$ | 纯数值引理 | main.tex:797 | 798-800 | 换成 4 或 2：800 系数变，822 的 24 同步改，256 与 346 需重登 |
| `eq:linear-displacement` $N(G)\ge\ell D_L/6$ | 位移下界 | main.tex:800 | 821-822 | 常数 6 改 1：Step 5 归一化与 24 号脱钩 |
| 漂移 $+1/2$（正长）与 $+1$（零长） | 四字母中恰一个抵消 | main.tex:812 | 813 的 $\E\ell\ge n/2$ | 字母集缩到 2 元：正长时增量为 0，818 尾界随 $n$ 衰减 |
| $\frac n2\le\E\ell\le\frac n4+n\Prob\{\ell\ge n/4\}$ | 截尾均值兑换 | main.tex:816 | 818 的 $1/4$ | 丢掉 $0\le\ell\le n$(813)：816 的上界无源 |
| $\frac3{20}=\frac14-\frac1{10}$ | 两预算相减 | main.tex:820 | 821-822、256、346 | 任一预算变号：交事件概率非正，Step 5 报废 |
| 归一化除法 | 全体标签同除 $D_L$ | main.tex:823 | 251 的 $N(g(e))=1$ | 先归一后装配：780-781 的整数系数数组毁掉，789 断 |
| 分离量 $\dist(v,Y)>d$ | 严格正 | main.tex:845 | 861 的 $M^{-1}$ 逼近、872 商范数、889 与 926 下界 | $Y$ 自反：这样的 $v$ 不存在，附录全线断（与 127-134 的反证入口同命） |
| 下三角正交 $f_i(y_j)=0$（$j<i$） | 逐条 | main.tex:860 | 885-888 逆序读取、889 前缀和 | 正交方向反：889 的最大前缀和变最大后缀和，$N_0$ 下界口径整个换掉 |
| 商范数等于 $\dist(v,E)$ | 等号 | main.tex:872 | 874-875 取 $f_i$ | 只留不等式：861 的 $d$ 保不住，Step 1 归纳断 |
| Goldstine 逼近误差 $M^{-1}$ | 逐点 $1\le h\le i$ | main.tex:877 | 889 的 $M^{-1}\sum\lvert a_h\rvert$ 项、911 的额外误差 | 误差随 $i$ 增长：911 的 $3k^{-1}$ 崩，919 的极限无定义 |
| 合成差 $k^{-1}+2mk^{-2}\le3k^{-1}$ | 随 $k$ 衰减 | main.tex:911 | 916-921 对角极限、923 的 spreading | mesh 改 $k^{-1}$：扰动项变 $2mk^{-1}$，911 断，926 无从继承 |
| $M=M_k\ge k^3$ | 阈值 | main.tex:904 | 902 颜色数有限下的 Ramsey 抽取 | 降到 $k$：861 的 $1/M$ 压不进 911 的归一 |
| `eq:N0-bounds` | $d\max_j\lvert\sum_{i\le j}a_i\rvert\le N_0(a)\le\sum_i\lvert a_i\rvert$ | main.tex:926 | 959-965 的继承、936-937 的嵌入 | 上界丢：917 的共同 $\ell_1$ Lipschitz 界无源，929 的一致收敛断 |
| `eq:nondegenerate` $N_0(a)\ge\frac d2\max_i\lvert a_i\rvert$ | 系数是前后缀差 | main.tex:933 | 936-937 失真趋 1、973-974 的相对误差 | 丢此下界：973 的一致相对误差降级为一致绝对误差，970 的 $F_J$ 嵌入失真断 |
| `eq:dilation-monotone` | $N_0(F_{\boldsymbol M}a)\le N_0(F_{\boldsymbol J}a)$（$J_i\le M_i$） | main.tex:947 | 956-958 极限存在、988-995 夹逼 | 单调向反：957 极限不存在，985 的细分不变性断 |
| $N(a)=\lim_J N_0(F_Ja)$ | 单调极限 | main.tex:957 | 962-965 界继承、966-968 的 spreading 与一致收敛 | 沿子列取：987-995 的 $J_-,J_+$ 夹逼只给不等式，985 的等号断 |
| `eq:prefix-bounds` | 与 $N_0$ 同式的前缀界 | main.tex:964 | 1000-1002 的同符号合并、Step 4 的 $V,U$ 与范数挂钩 | 丢下界：789 与 795 两侧同时断源，$\ell$ 进不了范数 |
| 复合失真 $(1+\eta)^3$ | 三跳（$F_J$、$N_0$ 张成空间、$X$） | main.tex:978 | 218 的 (iii)、341 的主证明调用 | 少一跳：970-977 的三层分解缺一，(iii) 交不出失真口径 |
| `eq:subdivision-invariance` | 等号，含变重数 | main.tex:985 | 998-1002 的同符号合并保范 | 只等重数成立：999 的"合并成总块数"写法断，1002 的连续性延拓无从起始 |
| 凸函数在区间上取常数则外值不低于该常数 | 定性凸性事实 | main.tex:1010 | 1013 的 `eq:merge`（$s\ne0$） | 若 $t\mapsto N(\ldots,t,s-t,\ldots)$ 仅下半连续：1011-1012 的端点反证断 |
| $s\to0$ 收尾 | 极限补 $s=0$ 情形 | main.tex:1014 | `eq:merge` 的全情形覆盖 | 缺此步：含零相邻对的合并不在结论内，777-781 的窗口边界块断 |
| 图的秩标注 $C(T_s(a_i))=C'(a_i)$ | 三点示意，与正文同式 | figures/chart-transport.tex:13 | 458-463 的 caption、453-454 的图引用 | 图注与 442 式不一致：正文自足，caption 在 462-463 已声明三点仅示意 |
| 引文键 `BrunelSucheston1974` 的印年 | 卷 7、(1973)、294-299 | references.tex:18 | 149-151 的策略段与 833-835 的附录声明所引键 | 键与印年不符：书目字段口径差，论证链上无消费点，我在勘误里另登 |
| James 型 2 反例条目 | 卷 30、(1978)、1-13 | references.tex:48 | 110-113 对 Rademacher 路线的封堵 | 换来源：110-113 的一句话论断失去引文，路线乙在我这里重新打开 |
| Naor 综述条目 | 卷 7、(2012)、167-233 | references.tex:72 | 119-124 的 Question 4 定位、abstract 61-63 | 换成非综述来源：120 行的 [Question~4] 无页可指，abstract 的作答句落空 |
| NPSS 条目 | 卷 134、(2006)、165-197 | references.tex:78 | 115-117 的正向、121-124 的关闭 | 换文献：116 的幂光滑推幂型 Markov 型无出处，反向半边失去 tex 端对应 |

### 视角差异勘误

两张旧表与新表的差别集中在五处：键的粒度、表头写法、位置栏来源、常数的拆法，以及我在复核行号时撞出来的几处文本口径差。逐项登记。

一、键的粒度。第 14 节与第 18 节以符号为键，一个符号一行，多处调用被压进同一格里的一串顿号。新表以消费点为键，同一符号允许在若干行各占一次（$\epsilon$ 出现在位置栏 main.tex:442、main.tex:496、main.tex:639 的三行里；$\ell$ 出现在 main.tex:760、main.tex:812、main.tex:816 三行里），换来的是最后一格能指到失手那一行的邻行。代价是三张表的行数不可相加：新表 88 条、第 14 节 19 条、第 18 节 10 条，覆盖的量化对象高度重叠。

二、表头写法。规格要的分隔行在每段横线两侧各留一个空格，第 14 节原表写的是无空格压缩形，第 18 节的续行表整张没有表头行，10 条数据行直接挂在段落之后。台账按"表头下数据行"的口径计数时只认第 14 节的 19 条，缺口正是这样来的。旧表我一个字一行都没动，新表自带规格的逐字表头。

三、位置栏来源。旧两表的位置栏混用 tex 与 Lean 文件（`SmoothMarkovType.lean:23`、`FiniteWalk.lean:66`、`WeightedEvents.lean:170` 这类）。新表位置栏一律落在 build 目录内的三个 tex 上：main.tex、references.tex、figures/chart-transport.tex；Lean 侧的数字一行没进新表，只在消费关系栏以第 13 节的口径转引。本轮 Lean 侧复核量控制在最小，见本节自检最后一条。

四、常数的拆法。第 14 节把 $1/24$ 按因子来源拆成三处（797、798、818）；新表按消费路径拆成一串（639、667、700、766、777、789、795、797、800、812、816、820、823）。两表数值一致，新表多登记了 landmark 与 goodness 这两个上游，粒度更细、行数更多。

五、复核行号时撞出来的口径差，如实登记：
1. 行数。§0 首段旧稿记 main.tex "实测 1021 行"，本轮 `wc -l` 给 1020；references.tex 我实测 99 行、4115 字节，与旧稿记的字节数吻合；figures/chart-transport.tex 实测 14 行、548 字节。差一拍来自末尾换行的计数口径（数换行符的工具给 1020，逐行编号的读取工具会把最后的空行也编上号）。我以 1020 登记，旧稿那句话原样保留。
2. 图与正文同式。figures/chart-transport.tex:13 的标注写作 $C(T_s(a_i))=C'(a_i)$，main.tex:442 写作 $C'(a)=C(T_s(a))$，两式只差书写方向。§0 旧稿判该图"纯示意、不承载论证"，与我逐字读过第 13 行的结果相容，caption 在 462-463 自证三点仅示意。新表仍给它一行，登记的是"图与正文同式"这一条事实。
3. 引文键与印年。references.tex:15 的键是 BrunelSucheston1974，同一块的第 18 行印的是卷 7、(1973)、294-299；正文 149-151 与 833-835 引的都是这个键。书目字段与年份标签对不上，论证链上没有消费点，我不推测原因。
4. 我自己新行的两处误指（已就地改在本轮新增行内）。$\epsilon=1/(10n)$ 的位置栏落盘时写 main.tex:640，awk 复核显示 640 行只有 \] 定界符，公式实为 639；归一化除法写 main.tex:824，824 行只剩 "proposition."，除法句在 823。改后 639 同时服务 $L$ 与 $\epsilon$ 两行，那是 Step 1 把两式写在同一行的结果。另外位置栏 main.tex:302 那行的第二格初稿写成一句含混的"规模与某范数无关"，我改成了 $\lvert S\rvert(2R+1)^r$ 的增长率表述。
5. 反引号口径。新表 88 行里有 28 行含反引号，我逐行看过，包住的全是 tex 的公式标签名（`eq:markov-type`、`eq:contradiction` 一类），数学表达式一律裸写成 `$...$`，与旧表的 Lean 文件名反引号用法同源。

### 本节自检

下面每一项都是落盘后当场所跑的结果，没跑过的检查我不写进来。

1. 素材口径。位置栏只用了 build 目录下三个 tex：main.tex（`wc -l` 实测 1020 行、43478 字节）、references.tex（实测 99 行、4115 字节）、figures/chart-transport.tex（实测 14 行、548 字节）。三个文件都逐行或按行号定点打印读过，PDF 一个没开，typst 分片没采信，图分片只当示意处理。
2. 位置栏覆盖。88 条数据行共 88 个位置格、87 个互异位置（main.tex:639 被 $L$ 与 $\epsilon$ 两行共用），分布为 main.tex 83 处、references.tex 4 处、figures/chart-transport.tex 1 处；引用的最大行号 1014，没有越界。行号用 awk 定点打印逐条核对，批次记在上一小节第五项第 4 条，两处误指与一处含混表述已改在我自己新增的三行内。
3. 表格结构。两行表头按规格逐字匹配（python 精确串比对命中）；数据行 88 条，每行竖线个数构成的集合是 {6}；空单元格与以横线充数的占位格 0 个。绝对值与范数在新表内一律写成 `\lvert \rvert` 与 `\lVert \rVert`，单元格里没有裸竖线，这一条由上一项的竖线计数同时兜住。
4. 文字扫描。对整个新增区（新表加两张小节）跑了逐串计数，规格里点名的各条禁用结构命中全为 0；长破折号命中 0；双连字符只出现在规格指定的分隔行内，共 5 次；`\(` 与 `\)` 我一次没用，成对要求平凡满足；整行分隔符与 emoji 未使用，小节标题没有复述各自的首句。
5. 体量。追加前 98996 字节，写完本小节前的中间态 121634 字节，规格下限 70000 满足，旧稿体量只增未减。终稿字节数与行数在交付报告里由同一脚本复测给出。
6. 前向引用。本节只引用第 0 节、第 13 节、第 14 节、第 17 节（含 17.2、17.4）以及本次新增的《台账补表》《视角差异勘误》《本节自检》，文件里都真实存在；没有指向尚未写出的章节。
7. 未做与越界声明。Lean 端数字本轮没有重新取证，第 13 节的实测口径在新表里只以转引形式出现，位置栏没有一条来自 Lean 仓；队列文件 `.tools/lean_queue.txt` 我只回读了第 91 行一处，其余队列与台账文件没有打开；没有运行任何版本控制命令；Write 工具调用次数 0，全部落盘走 Edit；旧稿的每一个字、两张旧表与 §0 首段那句 1021 行的旧记录都原样在位。
8. 一处流程偏差。本轮首次落盘（第一次 Edit 追加）发生在第 14 次工具调用，落在规格要求的 16-30 窗口之前。取证实际用了 13 次调用，我在核对完行号后提前一步动了笔。登记在此，交付报告同样如实复述。
