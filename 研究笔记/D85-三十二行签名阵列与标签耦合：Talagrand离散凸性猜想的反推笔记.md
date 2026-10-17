# D85 三十二行签名阵列与标签耦合：Talagrand 离散凸性猜想的反推研究笔记

对象：`E:\math\preprints\Talagrands-discrete-convexity-conjecture-September-23-2026\`，署名 OpenAI，日期 2026-09-23，标题 "Talagrand's discrete-convexity conjecture"，`main.tex:26` 的 pdfsubject 写明它是 "A positive solution to Talagrand's Research Problem 13.3.2"。
Lean 侧登记：`E:\math\lean\formalization.yaml:1574-1576`（comparator / declaration / file 三条），书目条目在 `formalization.yaml:632-634`。

## §0 取证口径与材料边界

### 0.1 布局实测与阅读纪律

这一篇的 tex 源在 `build/source/`，不在常见的 `build/`，属于本仓库的第二类布局；同级还有 `typst/` 分片源。我按警告只读 tex，一个 PDF 字节都没碰，`paper.pdf` 全程未被打开，`typst/` 目录也未读。为防口径漂移，先把实测的字节数与行数写死在这里：

| 文件 | 行数（实测 `wc -l`） | 字节（实测 `wc -c`） |
| --- | --- | --- |
| `build/source/main.tex` | 49 | 1615 |
| `build/source/sections/00_intro.tex` | 173 | 8095 |
| `build/source/sections/01_covering.tex` | 185 | 5996 |
| `build/source/sections/02_weights.tex` | 208 | 7959 |
`build/source/sections/03_density.tex` 84 行 / 3042 字节，`build/source/references.tex` 84 行 / 3193 字节，`build/source/figures/coupling.tex` 26 行 / 1091 字节；全套 tex 共 809 行、30991 字节。字节与我事先实测的数字逐项吻合，说明仓库自那次实测以来没有改动过源。

因为正文体量只有约三万一千字节，我在建完条目地图之后把四节连同一张图、连同参考文献全部完整读了一遍。条目地图是这样扫出来的：`\label` 命中 20 处，带号环境（`theorem`/`lemma`/`proposition`/`corollary`/`definition`）实际只有 4 个被启用，`main.tex:14-21` 声明了 theorem/proposition/lemma/corollary/definition/remark 六个计数器并 `\numberwithin{equation}{section}`，可是全文没有一处 `\begin{definition}` 与 `\begin{remark}`：例外集 $E_k(\mathcal D)$ 的定义直接挂在 `equation` 环境里（`00_intro.tex:8-14`，标签 `eq:exceptional-definition`），注记性的话都写成正文段落。这本身是个信号：作者刻意把编号资源留给"能被引用的东西"，而把定义塞进无号叙述，说明他预期读者按方程回跳，并非按定义号回跳。

四个带号条目连同其位置：`thm:main`（`00_intro.tex:43-52`）、`cor:two-union`（`00_intro.tex:109-118`，带证明 `120-132`）、`lem:covering`（`01_covering.tex:13-29`，带证明 `31-185`）、`prop:half-density`（`02_weights.tex:10-14`，带证明 `16-208`）。`03_density.tex` 里只有一个 `\label{eq:all-good-rows}`（第 15 行）与 `\begin{proof}[Proof of Theorem~\ref{thm:main}]`（第 9 行）：主定理的证明被整节占用，这节的角色是"把常数 $L$ 消掉"，没有新的带号命题。

### 0.2 同族论文的输入边界

`references.tex` 里有 12 条书目，其中 `OpenAIThreshold26`（`references.tex:48-53`）是同一天发布的姊妹篇 "Integral and fractional expectation thresholds are equivalent"，`cor:two-union` 的证明在 `00_intro.tex:129` 直接引用它的 Theorem 1.1。我这一篇的取证只覆盖上面这 809 行 tex 与 `E:\math\lean\OAI\Combinatorics\DiscreteConvexity\` 的 36 个 `.lean` 文件；姊妹篇的 tex 与 Lean 目录（`OAI/Combinatorics/ExpectationThreshold/`）我一行都没读，两者互为非输入。凡涉及姊妹篇内容的判断，我在下文一律标 `[推测]` 或明确写成"从本篇引用句反推"。

### 0.3 摘要原文与它的字面结构

摘要在 `main.tex:36-42`，逐字是：

> We prove Talagrand's discrete-convexity conjecture.
> There is a universal integer $k$ such that, whenever an arbitrary family has
> Bernoulli product measure at least $1-1/k$, the sets not contained
> in a union of $k$ members admit a cover of total cost at most $1/2$
> at the same density.

五个短语各自锁定一个技术件：`universal integer $k$` 锁定常数台账；`arbitrary family` 锁定"无单调性假设"这条硬约束（`00_intro.tex:55` 明写 "The family $\mathcal D$ is arbitrary; no monotonicity is assumed."）；`sets not contained in a union of $k$ members` 是 `eq:exceptional-definition`；`total cost at most $1/2$` 是 $c_\rho(\mathcal G)\le1/2$；`at the same density` 是最难的一条，它要求覆盖代价的密度参数就是原始的 $p$，不许退化到 $p/C$。最后这半句是全文结构的答案：`01_covering` 与 `02_weights` 合起来只给出 $q/L$ 密度的覆盖，"$1/2$ 的代价"在这两步里已经到手，"同一密度"整条约束是 `03_density` 一节的存在理由。

本行只补登记：本笔讽事的论文目录为 preprints/Talagrands-discrete-convexity-conjecture-September-23-2026，在 .tools/lean_queue.txt 队列第 125 行号（目录名由本笔自己在 §0 写明，本行不改前文）。

## §1 初始动机与猜想：我第一次把这道题当成什么问题

### 1.1 我的第一归类：一个凸松弛问题

第一次读到 "discrete-convexity" 这个名字，我把它归到"凸松弛"那一栏。理由是名字本身：`00_intro.tex:28-34` 的原文类比说，Gaussian 版的问题是"一个紧的 balanced 集合的有限个和，能否以维数无关的方式装下一个 Gaussian 测度至少 $1/2$ 的凸集"，而"balanced means closed under multiplication by scalars of absolute value at most one"。看到"和""凸集""标量收缩"这套词，我的直觉是：离散侧的对应物应该是把 $k$ 个集合的并当成一次"Minkowski 和"的操作（并只是表象，真正该有的是和所带的凸结构），于是问题的形状应该是"给 $\mathcal D$ 取 $k$ 次并 Closure，得到一个抽象凸几何里的 $\mathcal D^{+k}$，然后问 $E_k(\mathcal D)$ 相对于这个 Closure 有多大"。这个归类让我把进攻点押在"给 $k$ 次并找一个抽象凸性公理"上，也就是打算证某种类 Farkas 的对偶。

第二条并行的直觉把它归成"耦合/运输"问题：既然结论要求"同一密度"，而 $k$ 个独立 $\mu_p$ 样本的并的密度是 $1-(1-p)^k$，比 $p$ 大得多，那么任何用 $k$ 个样本造覆盖的做法都会把密度抬高；我猜需要某种把抬高的密度"运"回 $p$ 的耦合，而且我下意识以为那是一层最优运输的论证。

第三条直觉，也是最后活下来的那条，来自 `c_\rho(\mathcal G)=\sum_{I\in\mathcal G}\rho^{|I|}$ 这个式子（`00_intro.tex:20-22`）。它的每一项恰好是 $\mu_p$ 下包含 $I$ 那一柱的概率，所以 `00_intro.tex:25-26` 说这样的覆盖用 union bound  witnesses $\mu_p(\mathcal A)\le1/2$。我把这一句读成：所谓 "$p$-small" 就是"存在一个显式的、按 $p$ 定价的外覆盖"，问题真正难的是**显式性**，不是测度论。这一点决定了我后面所有的进攻方向：要造的对象是一族具体的子集（generator），带一个能被求和控制的代价。

### 1.2 我以为进攻点在哪：先做单调情形，再用压缩

坦白说我第一反应是：这道题的难点应该只在"任意族"这半句上，标准修法是先对 increasing（单调/up-set）族证明，然后用压缩（shifting / down-set 化）把任意族推到单调族，代价是某种"最多不增"的论证。我甚至排好了顺序：(i) 对单调 $\mathcal D$ 用 Talagrand 的 two-point 或者 Kruskal-Katona 型下界拿到 $E_k$ 的结构；(ii) 对一般族用 shifting 保测度地单化；(iii) 密度回收靠对 $p$ 求导。

押的第二条进攻点是"从 Gaussian 侧移植"：`references.tex:29-33` 引的 Hua-Song-Tudose 已经把 Gaussian 凸性解决了并给出一个离散推论（`00_intro.tex:79-82`：三个并，覆盖密度 $p^C$）。我以为正确路线是把他们的连续证明离散化，把 $k$ 定成某个由 Gaussian 常数反推的量级。

押的第三条是"分数化先行"：`00_intro.tex:87-95` 介绍了 fractional smallness（给非负系数 $a_I$ 使 $\sum_{I\subseteq S}a_I\ge1$ 而 $\sum p^{|I|}a_I\le1/2$），Li 已经把分数版本解决。我以为剩下的活儿就是"rounding"，即把分数覆盖取整成整数覆盖，于是主攻方向是随机取整加 Lovász 型上界。

### 1.3 我读到的第一处让我改主意的句子

`00_intro.tex:15` 那句轻描淡写的话："The members in a tuple may repeat and need not be disjoint."（元组里的成员可以重复，也不必不相交。）它把 shifting 路线判了死刑一半：允许重复并意味着 $E_k$ 的判定量是"是否存在 $k$ 项（可重复）覆盖 $S$"，这是纯粹的 $k$-覆盖存在性，压缩操作会改变重复元组的并的测度结构，而 shifting 通常保的是单集合的大小分布，并非 $k$ 元并的分布。这条线索在后面 `03_density.tex:51-56` 得到呼应：那里的关键等式 $E_{32}(\mathcal F)=E_{32L}(\mathcal D)$ 靠的是"把 $32L$ 个 $\mathcal D$ 的成员分成 32 组、每组 $L$ 个"这种纯粹的重新分组，而重新分组之所以合法，正是因为允许重复与不要求不相交。可见正文里那个等式之所以是恒等而不必带 $\subseteq$，全靠 `00_intro.tex:15` 那句许可。

## §2 尝试过的错误路线及失败原因

这一节写我自己的三条错路。它们在本篇 tex 里没有直接痕迹，我是从正文的结构反推"为什么这条路一定走不通"，再把我当时的推理拆开。凡属我的重构，并非论文的明示，句子都写成第一人称，并在末尾标注是断在哪一句。

### 2.1 错误路线一：先证单调情形再用 shifting 单化任意族

我的打算：对 increasing 族 $\mathcal D$ 建立 $E_k$ 的覆盖，然后对任意 $\mathcal D$ 做一次压缩 $\mathcal D\mapsto\mathcal D^{*}$，使得 $\mu_p(\mathcal D^{*})\ge\mu_p(\mathcal D)$、且 $E_k(\mathcal D^{*})$ 的覆盖能拉回 $E_k(\mathcal D)$。

断点一（断在 `00_intro.tex:54-55`）。原文只给了两行就切断了这条路："The constant is independent of $N$, $p$, and $\mathcal D$. The family $\mathcal D$ is arbitrary; no monotonicity is assumed." 这两句的位置在定理陈述之后立即出现，说明作者预期有人会去试单调化，先把它堵上。断的迹象在证明本体：`02_weights.tex` 整节从 $f=\mathbf 1_{\mathcal F}$ 出发（`02_weights.tex:17-18`），把 $\mathcal F$ 当成 $\{0,1\}^N$ 上的**任意**指标函数做 biased Fourier 展开；`02_weights.tex:121-124` 的签名恒等式 $0=\sum_{U\subseteq S}(-1)^{|U|}b(U)^{32}$ 里根本没有出现 $\mathcal F$ 是 up-set 的任何推论。既然中间步骤对任意 $f\in\{0,1\}$ 值函数成立，任何"先单化"的额外工作都是白付的代价。

断点二（断在 `00_intro.tex:172-173`，即 `00_intro.tex` 末段那句总结）。策略段明确写道："This exact coupling is what permits arbitrary families and returns the covering cost to $p$." 这句话把"任意族"与"密度回收"绑成同一个技术件，两个都由耦合处理。也就是说：任意性不是靠单化消除的，是靠**行与行相关但每行边缘律恰好是 $\mu_p$** 消除的。我原来的方案里，压缩后的族 $\mathcal D^{*}$ 与 $E_k(\mathcal D^{*})$ 的覆盖只能在 $q>p$ 定价；密度回收要独立解决，而这两件事在耦合路线里是同一件事，分不开。

断点三（测度论上的硬伤）。$E_k$ 的定义（`00_intro.tex:10-13`）里判据是 $\forall D_1,\ldots,D_k\in\mathcal D,\ S\nsubseteq D_1\cup\cdots\cup D_k$。压缩把一个集合换成"更靠左"的同尺寸集合，于是单个 $D_i$ 的像与 $k$ 个像的并之间只有偏序关系，包含关系 $S\subseteq\bigcup D_i$ 在压缩下可以双向变动：压缩后的元组可能覆盖掉原本没被覆盖的 $S^{*}$，而原本被覆盖的 $S$ 的单化像可能逃出去。断的迹象是：如果我这条路成立，论文里就该出现一条"$E_k$ 在压缩下单调"的引理，而 36 个 Lean 文件里没有对应的东西（`Model.lean:54-58` 的 `exceptional` 定义直接是 `Finset.univ.filter`，全篇没有任何 `shifting`、`compression`、`downset` 的字样）。

### 2.2 错误路线二：把 Gaussian 凸性的证明直接离散化

我的打算：沿 Hua-Song-Tudose 的连续证明，把"平衡集 + $k$ 次和 + 凸集测度 $\ge1/2$"逐项翻译成格上的对应物，$k$ 从连续侧的常数反推。

断点一（断在结论的形状上）。连续侧的结论允许密度损失：`00_intro.tex:79-82` 说他们的离散推论给的覆盖密度是 $p^C$。$p^C$ 与 $p$ 的差距在 $p\to0$ 时是指数级的，而摘要要求 "at the same density"。这条差异说明：从 Gaussian 侧移植过来的机器天生给不出同一密度，移植的终点比目标弱得太多。断的迹象还有一处更硬的：`00_intro.tex:82` 里的 $p^C$ 是 $p$ 的**幂**，而 `03_density.tex:57-58` 用的回收方式把 $q/L$ 变成 $q/L=p$，是**除以常数**。幂律损失与常数因子损失之间没有已知的桥，前者不是后者的特例，所以连续侧的参数即使 $C$ 无限逼近 $1$ 也接不上本篇的机制。

断点二（断在"任意族"上）。连续侧的"凸集"在离散侧对应 increasing 族加某种闭合性，这一层翻译本身就要求单调；这与 2.1 的失败同因。反推的证据是：`00_intro.tex:83-85` 提到 Ascoli-He-Park-Talagrand 的 "threshold reformulation" 只能处理若干 graph-containment 性质，即那些天然单调的情形。凡是靠"并 closure 的抽象凸性"来推进的表述，覆盖面都受限于单调类。

断点三（断在 $N$ 无关性的来源）。Gaussian 侧维数无关靠的是高斯测度的旋转不变性；离散侧没有任何东西能替代旋转。本篇给出的替代品是 `02_weights.tex:60-68` 的 Parseval 不等式 $\sum_U q^{|U|}w(U)\le1$，它对整个超立方体的**全部** $2^N$ 个 Fourier 系数求和，故与 $N$ 无关。这条界完全不需要从连续世界借几何。我当时押错了：真正的维数无关来源是正交性，不是几何对称性。（此判断在 Lean 侧有支撑：`FiniteParseval.lean` 全文件 80 行只做"有限实和的 Parseval"，没有出现任何对称群操作。）

### 2.3 错误路线三：分数覆盖 + 随机取整

我的打算：先用 Li 的分数结论拿到 cost $\le1/2$ 的分数覆盖，再用随机取整（Lovász 或 $\lVert a\rVert_\infty$ 型舍入）得到整数覆盖，密度损失只取常数因子。

断点一（断在 `cor:two-union` 的存在本身）。这条路线确实可行，但它给出的结论就是 `00_intro.tex:109-118` 的推论：$\mu_p(\mathcal D)>\frac12$ 推出 $E_2(\mathcal D)$ 是 $(p/C)$-small，$C=50\cdot512^4$（`00_intro.tex:131`）。也就是说取整路线的天花板是"两个并 + 密度 $p/C$"，与"同一密度 $p$ + $k=2^{75}$ 个并"是两个方向的交易，取整路线在其中一边永远付常数。反推的痕迹在 `00_intro.tex:134-135`：作者特意加了一句对照："Theorem~\ref{thm:main} retains the original cost parameter $p$ while allowing a larger universal number of unions." 这一句是写给正打算用取整路线的人看的：你换到的东西在另一侧。

断点二（断在整数化的方向选择）。`00_intro.tex:126-128` 的推论证明里有一步 "Capping each coefficient at one preserves coverage and does not increase cost."，那是把分数系数往**下**截断，保持覆盖性；而要从分数覆盖得到整数覆盖，需要的是往**上**取整，向上取整会破坏 $\sum_{I\subseteq S}a_I\ge1$ 之外的代价约束，破坏的方式由姊妹篇的定理接管。本篇正文对此只留了一句引用，没有任何取整引理，`grep` 在 Lean 侧同样找不到 rounding 相关命名（`OAI/Combinatorics/DiscreteConvexity/` 内 `round` 零命中）。断的迹象是：如果主定理的证明走过分数路线，`prop:half-density` 的假设里就该出现系数族 $a_I$；实际假设是 `02_weights.tex:12` 的单一条件 $\mu_q(\mathcal F)\ge1/2$，其余全从 $f=\mathbf 1_{\mathcal F}$ 内部构造。

断点三（断在 $1/2$ 的阈值位置）。分数版本的量化障碍（`00_intro.tex:96-98` 说 Li 通过"包含概率被 $p^{|I|}$ 控制的测度的量化障碍"解决）是**测度型**结论，它的输出是"$E_2$ 有分数覆盖"，而本篇需要的输出是"$E_{32}$ 里的每个 $S$ 含有某个便宜 generator"，这是一个逐点结构命题。断的迹象：`02_weights.tex:194-207` 的收尾用的是反证，假设 $S$ 不含 generator，然后逐 bin 数出 $\sum w(U)^{16}<2^{-32}$，与 `eq:exceptional-weight-bound` 冲突。这个反证只在有**逐点下界** $2^{-32}$ 时才成立；分数覆盖给不了逐点下界，只给全局可行对偶。

### 2.4 错误路线四（附带一条更小的）：把 $k$ 当成 $O(\log N)$ 或让 $k$ 依赖 $p$

我曾假设"通用整数 $k$"的"通用"只指不依赖 $N$，而允许依赖 $p$；毕竟摘要里 $k$ 与 $p$ 出现在同一句但语法上 $k$ 先于 $p$。断在 `00_intro.tex:54`："The constant is independent of $N$, $p$, and $\mathcal D$." 三件套齐全。另外 `03_density.tex:10` 把 $k$ 定成 $32L=2^{75}$ 之后再分 $Lp<1$ 与 $Lp\ge1$ 两个 case（`03_density.tex:23`、`03_density.tex:61`），正是为了处理 $p$ 与 $1/L$ 的相对位置；如果允许 $k$ 依赖 $p$，第二个 case 就不必存在，因为直接取 $L>1/p$ 便落入 case 1。case 2 的存在本身就是"$k$ 必须先于 $p$ 定下来"的证据。

## §3 关键转折点：三步里哪一步是转折，以及它诞生的一刻

### 3.1 我的定位：转折在 weights 一节，具体在"逐点消失"那四行

covering 一节是工具，density 一节是收尾，weights 一节才是转折所在。理由要从三步各自的"可替代性"来看。

`01_covering.tex` 的引理是一条纯粹的初等计数陈述，它把"很多条同尺寸边"变成"便宜的覆盖"。它的输入输出格式都很干净（假设只有 `01_covering.tex:17-18` 的 $|\mathcal H|\rho^r\le2^{h+1}$，结论只有 `01_covering.tex:25-28` 的 $c_\rho(\mathcal G)\le3\cdot2^{-h}$），而且作者特意声明它是自包含的（`01_covering.tex:11` "the argument below is self-contained"；`00_intro.tex:161-162` "the lemma here is proved in full"）。这种"格式干净、可被任何论证调用"的部件通常是被调用的一方，而被调用的一方不可能是转折。

`03_density.tex` 只有 84 行，全文一个带号命题都没有，两条 case 的机制都是标签抽样与强制行，没有任何必须新发明的东西：唯一真正需要新想法的是"行之间不许独立"这一条，而这一条是被 weights 一步的产出形式逼出来的（见 3.4）。

weights 一节 208 行，占了 tex 正文的三分之一以上，而且它同时改变了问题的类型。在它之前，"$\mu_p(\mathcal D)\ge1-1/k$"是一条关于集合测度的假设；在它之后，这条假设变成"一列非负数 $w(U)$ 满足全局和界 $\sum q^{|U|}w(U)\le1$"（`02_weights.tex:60-68`），而结论"$E_{32}(\mathcal F)$ 被覆盖"变成"每个 $S\in E_{32}(\mathcal F)$ 都满足 $\sum_{\varnothing\ne U\subseteq S}w(U)^{16}\ge2^{-32}$"（`02_weights.tex:73-75`）。把两侧都翻译成权重不等式之后，covering 那条引理才能咬进来。这个翻译动作是本篇唯一的范式转变，其余全是执行。

### 3.2 转折诞生的一刻：从 $\sum(-1)^{|U|}b(U)^{32}=0$ 到"不许非负"

我把诞生的一刻定在 `02_weights.tex:103-108` 这六行。逐字是：

> \[
>  \sum_{x\in\{0,1\}^{32\times N}}\nu_S(x)
>  \prod_{j=1}^{32}f(x_j)=0.
> \]
> This uses pointwise vanishing of the product on the support of $\nu_S$;
> nonnegativity of the signed masses is unnecessary.

第一行是那个恒等式：带符号的测度 $\nu_S$ 对 $f$ 的 32 次乘积求和等于 0。第二行是全篇信息密度最高的一句。它的意思是：以前这类签名算子论证（Friedgut 的签名乘积算子，`00_intro.tex:147-150`；Ellis-Filmus-Friedgut 的禁止构型，同处）在把 $\sum\nu\prod f=0$ 拆成正负两部分时，需要 $\nu$ 的符号信息可控，也就是需要"签名测度非负"或"签名测度符号已知"这一类条件。这里作者看穿了：不需要。因为支撑集本身已经足够。`02_weights.tex:99-102` 说的是同一件事的另一半："Since $R(0,\ldots,0)=0$, every array with nonzero $\nu_S$-weight has a $1$ in each column of $S$. The sets represented by its rows therefore have union containing $S$. By the definition of $E_{32}(\mathcal F)$, these rows cannot all lie in $\mathcal F$."

这一刻的心理内容我可以复现：签名测度 $R(y)=P(y)-(1-q)^{32}(-1)^{\sum y_j}$（`02_weights.tex:85-87`）在 $y=(0,\ldots,0)$ 处恰好为 0，这个恰好是设计出来的（$P(0,\ldots,0)=(1-q)^{32}$，减数在 $\sum y_j=0$ 时也是 $(1-q)^{32}$）。设计动机本来只是"要取消全零列"。取消全零列之后，落在支撑里的每个阵列在 $S$ 的每一列都至少有一个 1，于是 32 行的并包含 $S$。而 $S\in E_{32}(\mathcal F)$ 的定义（`00_intro.tex:10-13`）说的正是"任何 32 个 $\mathcal F$ 成员的并都不包含 $S$"。两条一夹，支撑上 $\prod_j f(x_j)$ 逐点为 0。符号条件被结构条件替代了。这一步之后，任意族（不需要单调）自动成立，而且不需要任何压缩。

这就是转折。它同时解决了两个我原以为彼此无关的问题：任意族问题与符号可控问题。原以为是两个包袱，实际是同一个包袱，因为取消全零列这个针对偶数行的设计，天然把支撑集压到"每列都有 1"那一侧，而那正是例外集的定义侧。

### 3.3 转折的第二半：为什么是 16 次方，以及它跟 $h$ 的二元一次关系

签名恒等式给的是 $\sum_{U\subseteq S}(-1)^{|U|}b(U)^{32}=0$（`02_weights.tex:122-124`），移出空项后用三角不等式得到 32 次方绝对值之和的下界 $2^{-32}$（`02_weights.tex:127-131`）。因为 $b^{32}=(b^2)^{16}=w^{16}$，下界落在 $w$ 的 16 次方上。

真正精妙的是这个幂次与 covering 引理的接口。`02_weights.tex:30-32` 提前点明："In a bin where $w(U)\le2^{-h}$, fewer than $2^{12h}$ terms contribute at most $2^{-4h}$ to the sum of sixteenth powers. This is the gap exploited by Lemma~\ref{lem:covering}." 我核对过这个 gap 的算术：bin 里 $w\le2^{-h}$，所以 16 次方 $\le2^{-16h}$；若这个 bin 里落在 $S$ 中的成员数 $<2^{12h}$，则该 bin 对 $\sum w^{16}$ 的贡献 $<2^{12h}\cdot2^{-16h}=2^{-4h}$。反过来看，如果 $\sum w^{16}\ge2^{-32}$ 而每个 bin 贡献都 $<2^{-4h}$，就得对所有 bin 求和；实测原文给的是 $\sum_{r\ge1}\sum_{h\ge64r}2^{12h}2^{-16h}=\frac{16}{15(2^{256}-1)}<2^{-32}$（`02_weights.tex:199-205`，标签 `eq:bin-power-sum`）。

而 covering 引理吃的假设恰好是"$S$ 含有 $\ge2^{12h}$ 条边"（`01_covering.tex:22-24`），即它的反面。所以 16 与 12 这两个数字不是各自独立的常数，它们是一对互补的指数：16 来自签名恒等式的幂次，12 来自要求 $2^{(12-16)h}$ 可求和且求和要小到压过 $2^{-32}$。$12<16$ 是必要条件，$12$ 越大则引理结论覆盖的目标族越小（越容易覆盖），而 $16$ 由行数 32 折半而来。这里有一个真实的权衡，我在 §5.4(c) 把这个权衡量化。

### 3.4 转折的第三半：$L$ 是主动欠下的债

`prop:half-density` 的结论是 $E_{32}(\mathcal F)$ 是 $(q/L)$-small，$L=2^{70}$（`02_weights.tex:11-13`）。我最初把 $L$ 读成技术损失，读完 `03_density.tex` 才确认它是故意欠的债，而且是给最后一步留的接口。case 1 的标签耦合（`03_density.tex:24-35`）造出 $L$ 个 $\mu_p$ 行，其并的密度是 $q=Lp$；把它塞进 `prop:half-density` 得到 $(q/L)$-small，即 $(Lp/L)=p$-small，密度精确回到 $p$（`03_density.tex:57-58`）。所以 $L$ 必须同时是"造行数"与"除掉的因子"。一个常数扮演两个角色，才让最后一步变成三行算式。这是我在最初的设想里完全没预料到的结构：我以为密度回收是修补，实际它是把前面的弱点设计成刚好可修补的形状。

由此也解释了 density 一节为什么能这么短：它不需要新想法，只需要 $q/L=p$ 这一个恒等式加上 `eq:all-good-rows` 的 union bound。而 union bound 不需要行独立（`03_density.tex:20` "Independence between rows is not required."），这一句是全篇最省的一笔，也是耦合能存在的逻辑前提。

## §4 最终思路与最初设想的差异

### 4.1 差在密度的位置：从补丁变成骨架

我最初的排序是：核心是 $E_k$ 的覆盖，密度只是陈述里的参数，最后再对齐。实际结构相反：整篇是围绕"密度必须精确等于 $p$"组织的。三段式里第三段决定前两段的输出格式：`prop:half-density` 必须把损失写成"除以一个固定的 $L$"，并非"除以一个依赖 $N$ 的量"或"乘上 $p$ 的某个幂"，否则 `03_density.tex:47-49` 那个 $q/L=p$ 就写不出来。结论形式的自由度被最后一步反向锁死，前面的引理是被倒着设计出来的。`00_intro.tex:164-173` 那段策略总结把顺序讲成正向的（先 covering、再 weights、再 density），我读完的感受是这个顺序只是阅读顺序，发现顺序很可能相反。

### 4.2 差在 $1/2$ 的角色：从目标变成余量

我以为 $1/2$ 是被证的目标（小性定义为 $\le1/2$，`00_intro.tex:23-24`），要一路卡着它走。实际它在中间被大幅超付：`02_weights.tex:189-192` 算出总代价 $\le\frac1{64}+\frac{6}{2^{64}-1}<\frac12$，第一项是 $2^{-6}$ 对上 $\frac12$，第二项约 $2^{-62}$ 对上余下的 $\frac12-2^{-6}$。真正在意的中间阈值是 $h\ge64$（`01_covering.tex:15`）与 $2^{-64|U|}$（`02_weights.tex:138`），$1/2$ 只在两端出现，一端是 `eq:exceptional-weight-bound` 的 $2^{-32}$（那才是必须超过的硬线），另一端是 `Small` 的定义。$1/2$ 之所以能取 $\frac12$ 而不用更小，机制理由见 §5.2(c)：它必须严格小于 1，才能把 $b(\varnothing)^{32}=\mu_q(\mathcal F)^{32}$ 的下界与 bin 求和的上界区分开；而它恰好取 $\frac12$ 是沿用 Talagrand 原文 smallness 定义（`00_intro.tex:23-24`，分数版本 `00_intro.tex:92` 同样是 $\frac12$）。

### 4.3 差在通用整数 $k$ 的来源：$2^{75}$ 是乘出来的

我原以为 $k$ 是某处最优化问题的解（比如把某个指数不等式取等）。实际 `03_density.tex:10` 写的是 $k=32L$，其中 32 来自 `prop:half-density` 的行数（`02_weights.tex:76`），$L=2^{70}$ 来自 `02_weights.tex:11`。$L$ 的 70 又是从 bin 求和与 $2^{-6}$ 那些余量里凑出来的一个足够大的 2 的幂。Lean 侧 `DensityConstants.lean:26-27` 把 $32\cdot2^{70}=2^{75}$ 证成一行 `rw [show (32 : ℕ) = 2 ^ 5 by decide, ← pow_add]`：这条定理的形式就告诉你，$k$ 是 2 的幂相乘的结果，指数 75 没有独立意义。这与 Gaussian 侧那个待定的绝对常数 $C$（`00_intro.tex:81-82` 的 $p^C$）在气质上完全不同。

### 4.4 差在我对耦合的想象：逐坐标标签，不是全局构造

我预期的耦合是某种全局重排或者运输解。实际 `03_density.tex:24-31` 的构造是：每个坐标 $i$ 独立抽一个标签 $J_i\in\{0,1,\ldots,L\}$，$\mathbb P(J_i=0)=1-Lp$，$\mathbb P(J_i=j)=p$，然后 $R_j=\{i:J_i=j\}$。这是最朴素的多项式分配，一行一色，标签 0 是弃用色。巧妙之处全在验证：单行看，成员指示是独立 Bernoulli-$p$，故 $R_j\sim\mu_p$；并起来看，坐标属于 $R$ 当且仅当标签非零，概率 $Lp=q$，故 $R\sim\mu_q$（`03_density.tex:31-35`）。$1-Lp$ 必须非负，这就是 case 1 的分界 $Lp<1$ 的全部理由。图 `figures/coupling.tex:1-26` 用三行、$3p<1$ 画了同一机制，第 14 行标注弃用色质量 $1-3p$，第 15 行三列各标 $p$。

case 2（`03_density.tex:61-83`）是另一套：每坐标先均匀选一个强制行，该坐标必进这一行，其余行以概率 $t=\frac{p-1/L}{1-1/L}$ 独立追加。于是每行边缘仍是 $\mu_p$（`03_density.tex:71-74` 验算 $\frac1L+(1-\frac1L)t=p$），而并恒等于 $[N]$。这个 case 的结论是 $E_k(\mathcal D)=\varnothing$（`03_density.tex:81-83`），空族以零代价 small（Lean 侧 `Basic.lean:102-104` 的 `small_empty`）。所以我原以为的"密度回收是难点"在这里被拆成两个都很容易的 case：一个用 $q/L=p$ 的代数，一个用并恰好是全空间的退化。设计上没有第三层困难。

### 4.5 差在我对任意族的担忧方式

我以为处理任意族的代价是要牺牲 $k$ 的量级或密度的精确性。实际处理方式是：全程只用 $f\in\{0,1\}$ 这一个性质。`02_weights.tex:17` 写 $f=\mathbf 1_{\mathcal F}$，Parseval 那步（`02_weights.tex:66`）用到 $\mathbb E[f(X)^2]=\mu_q(\mathcal F)$，这只需 $f^2=f$；签名恒等式那步只需 $\prod_j f(x_j)$ 在支撑上逐点为 0。两处都不碰 $\mathcal F$ 的序结构。Lean 侧把这个特点刻进命名：`Model.lean:64-66` 的 `familyIndicator` 是一个 `if cubeSet x ∈ D then 1 else 0`，`Basic.lean:187-190` 的 `familyIndicator_sq` 是关于 $f$ 的唯一性质，全文没有 `Monotone`、`IsUpSet` 之类的假设（我按 `Monotone`、`UpSet`、`shifting`、`compression`、`round` 五个词在 36 个文件里各 grep 一次，全部零命中）。这与我最初设想的"任意性要靠额外工作消除"完全相反：任意性是靠选对只用值域性质的证明而自动免单的。

## §5 逐引理四段式

约定：(a) 段是 tex 逐字引用（保留原文换行与 LaTeX 宏），(b) 段把论文跳过的中间步骤补出来，(c) 段逐个假设、常数、指数、阶给出机械理由并指明被谁消费，(d) 段列 2 到 3 条我怀疑被试过的失败路线，一律前缀 `[推测]`。行号一律指 `build/source/` 下的文件。

### 5.1 `thm:main`（`sections/00_intro.tex:43-52`）

#### (a) 逐字引用

```
43 \begin{theorem}
44 \label{thm:main}
45 Set $k=2^{75}$. For every integer $N\ge1$, every $p\in(0,1)$, and every
46 family $\mathcal D\subseteq2^{[N]}$,
47 \[
48 \mu_p(\mathcal D)\ge1-\frac1k
49 \quad\Longrightarrow\quad
50 E_k(\mathcal D)\text{ is }p\text{-small}.
51 \]
52 \end{theorem}
```

紧随其后的两句限定（`00_intro.tex:54-55`）："The constant is independent of $N$, $p$, and $\mathcal D$. The family $\mathcal D$ is arbitrary; no monotonicity is assumed." 证明本体在 `03_density.tex:9-84`，以 `\begin{proof}[Proof of Theorem~\ref{thm:main}]` 起头。

#### (b) 推导补全

第 0 步（定常数）。`03_density.tex:10` 设 $L=2^{70}$、$k=32L$，于是 $k=32\cdot2^{70}=2^{5}\cdot2^{70}=2^{75}$。这一步只是记号，真正的约束在后面。

第 1 步（失败预算）。假设 $\mu_p(\mathcal D)\ge1-1/k$，即 $1-\mu_p(\mathcal D)\le1/k$。乘 $L$ 得 $L(1-\mu_p(\mathcal D))\le L/k=2^{70}/2^{75}=1/32$。这就是 `eq:all-good-rows`（`03_density.tex:14-19`）里 $\ge1-\frac Lk=\frac{31}{32}$ 的来源：union bound 对 $L$ 个事件 $\{R_j\notin\mathcal D\}$ 求和，每个概率都是 $1-\mu_p(\mathcal D)$，用 $L$ 倍，并非一倍，是因为要 $L$ 行同时落在 $\mathcal D$ 内。

第 2 步（分界）。以 $Lp$ 与 $1$ 的大小分 case。分界的机械理由：case 1 要用弃用色概率 $1-Lp$（`03_density.tex:27`），它必须落在 $[0,1]$；case 2 要用 $t=\frac{p-1/L}{1-1/L}$（`03_density.tex:64`），它必须落在 $[0,1)$，即 $p\ge1/L$。两 case 恰好在 $Lp=1$ 处互补，且 `03_density.tex:83` 明说 "This construction also covers the boundary $Lp=1$, when $t=0$"。

第 3 步（case 1 的三层传递）。(i) 标签耦合造出 $R_1,\ldots,R_L$，每行 $\sim\mu_p$，并 $R\sim\mu_q$，$q=Lp$。(ii) 定义 $\mathcal F=\{D_1\cup\cdots\cup D_L:D_j\in\mathcal D\}$（`03_density.tex:41-44`），在 `eq:all-good-rows` 事件上 $R\in\mathcal F$，故 $\mu_q(\mathcal F)\ge31/32\ge1/2$（`03_density.tex:47-50`）。(iii) 对 $\mathcal F$ 用 `prop:half-density` 得 $E_{32}(\mathcal F)$ 是 $(q/L)$-small。

第 4 步（并的重新分组同构）。`03_density.tex:51-56`：把 $32L$ 个 $\mathcal D$ 成员分成 32 组每组 $L$ 个，先组内取并（得 $\mathcal F$ 的 32 个成员）再组间取并，与直接把 $32L$ 个取并，是同一个集合。正反两个方向都成立，故 $E_{32}(\mathcal F)=E_{32L}(\mathcal D)$ 是恒等。这里必须允许重复与不必不相交（`00_intro.tex:15`），因为"重复某个 $L$ 元组 32 次"这种操作在 case 2 里也要用（`03_density.tex:79-81`）。

第 5 步（密度回收）。$q/L=(Lp)/L=p$，故 $(q/L)$-small 就是 $p$-small，摘要里 "at the same density" 兑现。

第 6 步（case 2）。由 `eq:all-good-rows`，存在一个结果使 $L$ 行全在 $\mathcal D$；这些行的并已覆盖 $[N]$（构造保证，`03_density.tex:75-76`）。把该 $L$ 元组重复 32 次，得到恰好 $k=32L$ 个 $\mathcal D$ 成员并起来为全集。于是任何 $S\subseteq[N]$ 都被这个 $k$ 元组覆盖，$E_k(\mathcal D)=\varnothing$（`03_density.tex:81-82`），空族以零代价 small。

#### (c) 假设、常数、指数、阶的机械理由

$N\ge1$：只在 Lean 侧作为 `Fin N` 非空的便利假设出现（`Main.lean:61-62` 带 `_hN : 1 ≤ N`，下划线前缀说明证明里从未使用它）。$p\in(0,1)$ 开区间：`02_weights.tex:44-45` 需要 $0<q<1$ 才能让 $\mu_q$ 有全支撑、从而 $2^N$ 个正交函数构成基；$p=0$ 时 $\mathcal D$ 只能是 $\{\varnothing\}$ 一侧的退化，$p=1$ 同理，把区间开掉最省事。

$1-1/k$ 这个形状：它必须同时满足两条不等式。第一条 $L/k\le1/2$，因为 `eq:all-good-rows` 的产出要喂给 `prop:half-density`，后者假设是 $\mu_q(\mathcal F)\ge1/2$（`02_weights.tex:12`）；$L/k=1/32$ 满足。第二条 $L/k<1$，因为 case 2 需要全行失败概率和严格小于 1 才能断言存在一个全好的结果；Lean 里这一条被显式写出：`Main.lean:54` 传参 `(hbudget.trans_lt (by norm_num : (1 / 32 : ℝ) < 1))`。$1/k$ 型假设的深层理由是它可直接与 union bound 相加：$L$ 行各花 $1/k$，总预算 $L/k$，而 $k$ 是 $L$ 的常数倍，于是预算是常数 $1/32$。若假设写成 $\mu_p(\mathcal D)\ge1-\varepsilon$ 而 $k$ 依赖 $\varepsilon$，结论就不是通用整数了。

$2^{75}$ 这个数：由 $32\times2^{70}$ 相乘得到。32 的消费方是 `prop:half-density` 的行数（`02_weights.tex:76` 的 32 行阵列）与 `eq:exceptional-weight-bound` 的 $2^{-32}$ 阈值（它等于 $b(\varnothing)^{32}$ 在 $b(\varnothing)\ge1/2$ 时的下界）；$2^{70}$ 的消费方是 `02_weights.tex:135` 的 $\rho=q/L$ 与 `02_weights.tex:140-145` 的算式 $\rho^r=q^r2^{-70r}\le2^{-6r}q^rw(U)$（此处用到 $2^{-70r}\le2^{-64r}\cdot2^{-6}$，即 $w(U)\ge2^{-64|U|}$ 正是 $\mathcal G_0$ 的入选条件）。70 相对 64 只多 6，恰好让 $2^{-6}$ 变成 $\mathcal G_0$ 的预算；70 也必须大到让 case 1 的 $1-Lp\ge0$ 在 $p$ 很小时可用，这一分工由 case 划分自动处理。$2^{75}$ 的余量极大，任何把 $k$ 改小到 $O(1)$ 的尝试都会同时破坏 $L/k\le1/2$ 与 $h\ge64r$ 的推导。

$1/2$ 在结论侧：由 `00_intro.tex:23-24` 的定义 "$\mathcal A$ is \emph{$p$-small} if it has a cover $\mathcal G$ with $c_p(\mathcal G)\le1/2$"。它的数值意义是严格小于 1，因为 $\sum\rho^{|I|}$ 是某个 union bound 的原像；$\le1/2$ 才能在 `02_weights.tex:189-192` 用 $2^{-6}+\frac{6}{2^{64}-1}<\frac12$ 这种超付余量收尾。

两个 $1/2$ 会师的位置：假设侧的 $1/2$（`prop:half-density` 的 $\mu_q(\mathcal F)\ge1/2$）在 `02_weights.tex:127-131` 被消费，因为 $b(\varnothing)=\mu_q(\mathcal F)$（`02_weights.tex:26` 与 `02_weights.tex:128` 的 $2^{-32}\le b(\varnothing)^{32}$）；结论侧的 $1/2$ 在 `eq:bin-cost-sum` 之后被消费。两个 $1/2$ 数值相同、角色无关，这是我在初读时混淆过一次的地方。

正选择子推论里 $k$ 的二次出现（`00_intro.tex:68-69`：$\{S:\phi(S)\ge k^2M\}$ 是 $p$-small）：$k^2$ ，并非 $k$，因为 Markov 只给到 $\mu_p\{D:\phi(D)<kM\}\ge1-1/k$（`00_intro.tex:70-71`），而要让 $\phi(S)\ge k^2M$ 不被 $k$ 个 $D$ 的并覆盖，需要每个 $D$ 的 $\phi$ 值都 $<kM$，于是 $k$ 个并的 $\phi$ 值由次可加性至多 $k\cdot kM=k^2M$（`00_intro.tex:72-74`）。$k^2$ 的阶完全由 $k$ 个成员与 $kM$ 阈值相乘而来，没有别的内容。

#### (d) 候选失败路线

`[推测]` 失败路线一：试图让 $k$ 依赖 $p$ 以压缩常数。断点在 case 2 的存在性论证，它要求先固定 $k$ 再对 $p$ 分界；若 $k=k(p)$，则 $Lp<1$ 与 $Lp\ge1$ 的分界点会随 $p$ 滑动，`03_density.tex:64` 的 $t$ 定义失去意义。

`[推测]` 失败路线二：试图用 $k$ 个独立的 $\mu_p$ 行直接做 case 1。断点在密度：独立行的并有密度 $1-(1-p)^L$，只在 $Lp\ll1$ 时接近 $Lp$，$p$ 稍大就冲到 1，此时 `prop:half-density` 给的 $q/L$ 与 $p$ 完全脱钩。标签耦合的作用正是把每行边缘恰好 $\mu_p$ 与并恰好 $\mu_{Lp}$ 两件事在 $Lp<1$ 全域内同时钉住，case 2 用强制行钉住 $Lp\ge1$ 那半。

`[推测]` 失败路线三：试图在 case 1 里把 $\mathcal F$ 取成 $\mathcal D$ 本身而不做 $L$ 元并 closure。断点在 `03_density.tex:51-56` 的重新分组同构：不取并 closure，$E_{32}(\mathcal D)$ 与 $E_{32L}(\mathcal D)$ 之间没有可写下的关系，$k=32L$ 与 32 行之间的链断掉。

### 5.2 `eq:exceptional-definition` 与 $p$-small（`sections/00_intro.tex:4-26`）

#### (a) 逐字引用

```
 4 Let $[N]=\{1,\ldots,N\}$, and let $\mu_p$ be the probability measure
 5 on $2^{[N]}$ under which each coordinate is present independently with
 6 probability $p\in(0,1)$. For a family $\mathcal D\subseteq2^{[N]}$ and
 7 an integer $k\ge1$, define
 8 \begin{equation}
 9 \label{eq:exceptional-definition}
10 E_k(\mathcal D)
11 =\bigl\{S\subseteq[N]:
12   S\nsubseteq D_1\cup\cdots\cup D_k
13   \text{ for all }D_1,\ldots,D_k\in\mathcal D\bigr\}.
14 \end{equation}
15 The members in a tuple may repeat and need not be disjoint.
```

```
17 A family $\mathcal G\subseteq2^{[N]}$ \emph{covers} a family
18 $\mathcal A$ if every $S\in\mathcal A$ contains some $I\in\mathcal G$.
19 For $\rho\in(0,1)$, write
20 \[
21 c_\rho(\mathcal G)=\sum_{I\in\mathcal G}\rho^{|I|}.
22 \]
23 We say that $\mathcal A$ is \emph{$p$-small} if it has a cover
24 $\mathcal G$ with $c_p(\mathcal G)\le1/2$.
25 Since $\mu_p\{S:I\subseteq S\}=p^{|I|}$, such a cover witnesses
26 $\mu_p(\mathcal A)\le1/2$ by a union bound.
```

#### (b) 推导补全

包含方向要盯紧：覆盖的定义是 $I\subseteq S$（generator 在目标里面），而例外集的定义是 $S\nsubseteq\bigcup D_j$（目标在并外面）。这两个方向合起来给出全篇的力学：$S$ 不含任何便宜 generator，说的是 $S$ 内部没有可指望的小结构；$S$ 不被 $k$ 个 $\mathcal D$ 成员覆盖，说的是 $S$ 外部的 $k$ 次并都不够大。`02_weights.tex:99-102` 把后者翻译成阵列支撑条件（每列至少一个 1），`02_weights.tex:194-207` 把前者翻译成 $\sum_{U\subseteq S}w(U)^{16}$ 的上界，中间用签名恒等式对接。

$p$-small 的测度含义（`00_intro.tex:25-26`）：$\mu_p\{S:I\subseteq S\}=p^{|I|}$ 是逐坐标独立性的直接推论，$|I|$ 个坐标都得出现。于是 $c_p(\mathcal G)\le1/2$ 通过 union bound 给出 $\mu_p(\bigcup_{I\in\mathcal G}\{S:I\subseteq S\})\le1/2$，而覆盖性说 $\mathcal A$ 含于该并。注意这里 $\mathcal G$ 不必属于 $\mathcal A$，也不必与 $\mathcal D$ 有关系，它只是定价为 $p$ 的一族小集合。

$E_k$ 的单调性：`00_intro.tex:121-124` 在推论证明里顺手写了 "it is a nonempty proper increasing family: $\mathcal D\ne\varnothing$，so $\varnothing\notin E_2(\mathcal D)$，and the defining obstruction is preserved by taking supersets"。补出这一步：若 $S\in E_k(\mathcal D)$ 且 $S\subseteq S'$，设 $S'\subseteq\bigcup_jD_j$，则 $S\subseteq\bigcup_jD_j$，矛盾，故 $S'\in E_k(\mathcal D)$。$\varnothing\in E_k(\mathcal D)$ 当且仅当 $\mathcal D=\varnothing$（空并是 $\varnothing$，包含 $\varnothing$）。这条单调性只在 `cor:two-union` 里被消费（要套 Li 的分数结论，那里需要对 up-set 陈述）；主定理的路径完全不使用它，这正与任意族的口径一致。

#### (c) 机械理由

$k\ge1$：$k=0$ 时 0 个成员的并是 $\varnothing$，$E_0(\mathcal D)$ 就是所有非空 $S$，太大且无意义；$k=1$ 是相交性特例，论文不需要。$k$ 以 $\mathcal D$ 的成员数计数、以可重复元组实现，这一点在 Lean 里是 `Model.lean:44-46` 的 `unionTuple {k : ℕ} (f : Fin k → Finset α) := Finset.univ.biUnion f`：函数定义域是 `Fin k`，天然允许重复值。`Model.lean:48-58` 的 `unionFamily` 与 `exceptional` 都从 `Finset.univ`（全部 `Fin k → Finset α` 函数）里 filter，因此可重复不是额外许可，是定义的默认结果。

$\rho\in(0,1)$ 与 $c_\rho$：$\rho=1$ 时代价退化成基数，任何非空覆盖都贵；$\rho=0$ 时所有非空 generator 免费，结论空。开区间把两端排除。$c_\rho$ 用 $\rho^{|I|}$ 而不加别的权：因为它的经济含义必须等于柱集概率，否则 `00_intro.tex:25-26` 那句 union bound 不成立。

$\le1/2$：见 §5.1(c)。补一条：$1/2$ 与分数版本的 $1/2$ 一致（`00_intro.tex:92` 的 $\sum_{I\subseteq[N]}p^{|I|}a_I\le\frac12$），所以分数小性与整数小性用同一个阈值，这是 `cor:two-union` 能在两者之间搭桥的前提。

#### (d) 候选失败路线

`[推测]` 失败路线一：把覆盖方向取反（要求 $S\subseteq I$ ，并非 $I\subseteq S$）。那变成用 $\mathcal A$ 的上界覆盖，与 $E_k$ 的"$S$ 逃出于 $k$ 次并"毫无结构关系，签名恒等式那一步（只有 $U\subseteq S$ 才在求和里出现）直接失效。

`[推测]` 失败路线二：要求 generator 属于 $\mathcal D$ 或要求 $\mathcal G\subseteq\mathcal A$。那会让 `02_weights.tex:135-139` 的 $\mathcal G_0$（一切 $w(U)\ge2^{-64|U|}$ 的 $U$）超出可用范围，因为 $w$ 的支撑是整个幂集。

`[推测]` 失败路线三：把 $E_k$ 定义成不被不相交的 $k$ 个成员覆盖。那么 `03_density.tex:51-56` 的重新分组同构失败（组内 $L$ 元并之后组间不再不相交），$k=32L$ 这一整条链断掉。

### 5.3 `prop:half-density`（上）：权重定义与全局界（`sections/02_weights.tex:10-69`）

`prop:half-density` 是全篇最长的一节，我按它的四个小标题拆成三组四段式，并按"先给定义与第一条界、再交代它调用的工具、最后给签名界与组装"的顺序排版：本节（5.3）处理权重定义与全局界（`02_weights.tex:16-69`），下一节（5.4）处理被调用的 `lem:covering`，第 5.5 节回到 `prop:half-density` 的例外集下界（`71-132`）、覆盖构造（`134-192`）与覆盖性验证（`194-207`）。

#### (a) 逐字引用（命题本体与权重定义）

```
10 \begin{proposition}\label{prop:half-density}
11 Let $L=2^{70}$. For every integer $N\ge1$, every $q\in(0,1)$, and every
12 $\mathcal F\subseteq 2^{[N]}$ satisfying $\mu_q(\mathcal F)\ge1/2$,
13 the family $E_{32}(\mathcal F)$ is $(q/L)$-small.
14 \end{proposition}
```

```
17 Identify subsets of $[N]$ with their indicator vectors and write
18 $f=\mathbf 1_{\mathcal F}$. For $U\subseteq[N]$, define
19 \begin{equation}\label{eq:weights-definition}
20  b(U)=(1-q)^{|U|}
21  \sum_{z\in\{0,1\}^{U}}(-1)^{\sum_{i\in U}z_i}
22  \mathbb E[f(z,Y)],
23  \qquad w(U)=b(U)^2,
24 \end{equation}
25 where $Y$ has independent Bernoulli-$q$ coordinates on $[N]\setminus U$.
26 In particular, $b(\varnothing)=\mu_q(\mathcal F)$.
```

预埋伏笔的一段（`02_weights.tex:28-32`）：

```
28 We will compare a global bound on the weights with a lower bound on
29 their sixteenth powers over subsets of each exceptional set.
30 In a bin where $w(U)\le2^{-h}$, fewer than $2^{12h}$ terms contribute
31 at most $2^{-4h}$ to the sum of sixteenth powers. This is the gap
32 exploited by Lemma~\ref{lem:covering}.
```

偏傅里叶基与全局界（`02_weights.tex:35-68`）：

```
35 We use the standard biased Fourier basis
36 \cite[Section~8.4]{ODonnell14}, with its normalization made explicit here.
37 Under the product law $\mu_q$, the functions
38 \[
39  \chi_U(x)=\frac{\prod_{i\in U}(q-x_i)}{[q(1-q)]^{|U|/2}},
40  \qquad U\subseteq[N],
41 \]
42 are orthonormal: each standardized coordinate has mean zero
43 and variance one, and the coordinates are independent. Since $0<q<1$, the measure has
44 full support; these $2^N$ orthonormal functions form a basis of the
45 $2^N$-dimensional space of real functions on the cube.
```

```
59 Consequently, Parseval's identity yields
60 \begin{equation}\label{eq:global-weight-bound}
61  \begin{aligned}
62  \sum_{U\subseteq[N]}q^{|U|}w(U)
63  &=\sum_{U\subseteq[N]}(1-q)^{|U|}\widehat f(U)^2\\
64  &\le\sum_{U\subseteq[N]}\widehat f(U)^2
65  =\mathbb E[f(X)^2]
66  =\mu_q(\mathcal F)\le1.
67  \end{aligned}
68 \end{equation}
69 This calculation holds for all $q\in(0,1)$.
```

#### (b) 推导补全（权重定义到全局界）

第一步，把 `eq:weights-definition` 认成带偏导数。$b(U)$ 是 $\mathbb E[f]$ 对 $U$ 中坐标做"0/1 差分"再乘 $(1-q)^{|U|}$：对单坐标 $i$，$(1-q)(\mathbb E[f\mid x_i=0]-\mathbb E[f\mid x_i=1])$ 就是 $(-1)^{z_i}$ 加权和的形式；$U$ 上逐坐标相乘给出那个 $(-1)^{\sum_{i\in U}z_i}$。$U=\varnothing$ 时空和只有一个项、$(-1)^0=1$，$(1-q)^0=1$，故 $b(\varnothing)=\mathbb E[f]=\mu_q(\mathcal F)$，与 `02_weights.tex:26` 吻合。

第二步，正交性验证。单坐标 $X\sim$ Bernoulli-$(q)$，$\mathbb E[q-X]=q-q=0$；$\mathbb E[(q-X)^2]=q^2\cdot(1-q)+(1-q)^2\cdot q=q(1-q)$，除以 $q(1-q)$ 后方差为 1。乘积归一化 $[q(1-q)]^{|U|/2}$ 使 $\mathbb E[\chi_U^2]=1$，而 $U\ne V$ 时至少一个坐标落在对称差里、其因子期望为 0，故 $\mathbb E[\chi_U\chi_V]=0$。$2^N$ 个两两正交的单位向量在 $2^N$ 维空间里构成基（`02_weights.tex:43-45` 特意交代全支撑，因为正交族要成基必须两两可分，全支撑保证 $\langle g,\chi_U\rangle=0$ 对所有 $U$ 蕴含 $g=0$）。

第三步，$\widehat f(U)$ 与 $b(U)$ 的换算法则。关键单坐标恒等式在 `02_weights.tex:47-50`：$\mathbb P(X_i=z_i)(q-z_i)=q(1-q)(-1)^{z_i}$。核对：$z_i=1$ 时左边 $=q(q-1)=-q(1-q)$，右边 $=-q(1-q)$；$z_i=0$ 时左边 $=(1-q)q$，右边 $=q(1-q)$。把 $\chi_U(x)=\prod_{i\in U}(q-x_i)/[q(1-q)]^{|U|/2}$ 代入 $\widehat f(U)=\mathbb E[f(X)\chi_U(X)]$，对 $U$ 中坐标求和时每个坐标贡献一个 $q(1-q)(-1)^{z_i}$，共 $[q(1-q)]^{|U|}$；除以 $[q(1-q)]^{|U|/2}$ 余 $[q(1-q)]^{|U|/2}$，再与 $b(U)$ 定义里的 $(1-q)^{|U|}$ 合并：$[q(1-q)]^{|U|/2}/(1-q)^{|U|}=(q/(1-q))^{|U|/2}$。这正是 `02_weights.tex:57` 那个 $\left(\frac{q}{1-q}\right)^{|U|/2}b(U)$。

第四步，`eq:global-weight-bound`。$\widehat f(U)^2=\left(\frac{q}{1-q}\right)^{|U|}b(U)^2=\left(\frac{q}{1-q}\right)^{|U|}w(U)$，故 $(1-q)^{|U|}\widehat f(U)^2=q^{|U|}w(U)$，这是 `02_weights.tex:62-63` 那一等号。随后丢掉 $(1-q)^{|U|}\le1$ 得 $\le$ 号（`02_weights.tex:64`，这一步是把带权 and 无权 Parseval 折中的地方，代价是丢掉 $(1-q)^{|U|}$ 这个小因子，收益是右边变成纯 Parseval 和）。Parseval 给 $\sum\widehat f(U)^2=\mathbb E[f^2]$；$f$ 是指标故 $f^2=f$，$\mathbb E[f]=\mu_q(\mathcal F)\le1$。

补一条我特别核对过的：`02_weights.tex:69` "This calculation holds for all $q\in(0,1)$." 这句是在说全局界不含任何 $q$ 的下界要求，因此后面 $\rho=q/L$ 无论多小都能用同一条界。这正是密度回收能任意除 $L$ 的前提。

#### (c) 假设、常数、指数、阶的机械理由

$L=2^{70}$：它出现在结论 $(q/L)$-small 里，同时在证明中被消费两次（`02_weights.tex:135` 的 $\rho=q/L$ 与 `02_weights.tex:142-145` 的 $2^{-70r}\le2^{-64r}\cdot2^{-6r}$ 那步实际上要求 $70=64+6$）。所以 70 不是自由参数，它由"bin 下限指数 64"与"直取预算指数 6"相加得到。$L$ 必须**恰好**是 $2^{70}$ 才能让 `03_density.tex:47-49` 的 $q/L=p$ 与 `03_density.tex:10` 的 $k=32L$ 同时成立；改成 $2^{71}$ 会让 $\mathcal G_0$ 的预算变成 $2^{-7}$（更松，无害），但会让 $k=32\cdot2^{71}=2^{76}$ 并迫使 `00_intro.tex:45` 改数；改成 $2^{69}$ 则 $2^{-69r}\le2^{-64r}2^{-6r}$ 变成 $2^{-69r}\le2^{-70r}$，假，`eq:outright-cost` 的 $2^{-6}$ 立刻失效。

$\mu_q(\mathcal F)\ge1/2$：被 `02_weights.tex:127-131` 消费，通过 $b(\varnothing)=\mu_q(\mathcal F)$ 给出 $b(\varnothing)^{32}\ge2^{-32}$。阈值必须是 $\frac12$ 才能产出 $2^{-32}$ 这个与 $2^{256}$ 比较的量；若假设是 $\mu\ge1/3$，下界变 $3^{-32}\approx2^{-50.7}$，而 bin 上界仍是 $\frac{16}{15(2^{256}-1)}\approx2^{-251.6}$，仍有余量，所以 $\frac12$ 并非唯一可行阈值。$\frac12$ 之所以被选中，是因为 `03_density.tex:48-49` 那边 union bound 天然给出 $31/32\ge1/2$，而 $1/2$ 同时是 `Small` 的定义常数与 Talagrand 原文 smallness 的常数，三个 $\frac12$ 复用同一个数字最省。

$E_{32}$ 的 32：见 §5.5 的 (c)。

$\chi_U$ 的归一化 $[q(1-q)]^{|U|/2}$：分母带 $1/2$ 次方是因为 $\chi_U^2$ 要恰好等于 $\prod_{i\in U}(q-x_i)^2/[q(1-q)]^{|U|}$，其期望为 1。若去掉归一化，Parseval 那步会多出 $\prod q^{|U|}(1-q)^{|U|}$ 因子，$w$ 的定义也要跟着改。作者把归一化显式写出（`02_weights.tex:36` "with its normalization made explicit here"），说明他知道这是容易踩空的一步。

丢掉 $(1-q)^{|U|}$ 的方向选择：`02_weights.tex:64` 的 $\le$ 是往大方向丢，代价是全局界变成无量纲的 1，好处是不再依赖 $q$。若保留 $(1-q)^{|U|}$，后面 $\sum_U\rho^{|U|}\cdot(\cdot)$ 里会出现 $(1-q)$ 与 $\rho$ 的混合，$\mathcal G_0$ 的预算估计要重做。

#### (d) 候选失败路线

`[推测]` 失败路线一：直接用无偏傅里叶基（$\pm1$ 值、乘积测度 $\mu_{1/2}$）。断在 `02_weights.tex:47-50` 那条单坐标恒等式，它只在带偏基下给出纯符号 $(-1)^{z_i}$；无偏基会留下 $(q-1/2)$ 型因子，$b(U)$ 与 $\widehat f(U)$ 之间不再有干净的幂次关系。

`[推测]` 失败路线二：取 $w(U)=|\widehat f(U)|$ ，并非 $b(U)^2$。断在 Parseval 那步只能给 $\sum|\widehat f|^2\le1$，无法给 $\sum q^{|U|}w(U)\le1$ 这种带 $q^{|U|}$ 定价的形式；而 generator 的代价正是 $q^{|U|}$，权重必须与代价同价格才能比。

`[推测]` 失败路线三：用超收缩（hypercontractivity）或 Bonami 引理替代 Parseval 来控高次幂和。断在方向：需要的是**高次幂的下界**（每个例外集上），而收缩不等式给上界；把它用在 $\mathcal F$ 的补集上会引入单调性假设，违反任意族口径。

### 5.4 `lem:covering`（`sections/01_covering.tex:13-29`）及其四个标号式

#### (a) 逐字引用

```
13 \begin{lemma}\label{lem:covering}
14 Let \(X\) be a finite set, let \(0<\rho<1\), and let \(r,h\) be integers
15 with \(1\le r\le h\) and \(h\ge64\). Suppose that
16 \(\mathcal H\subseteq\binom{X}{r}\) satisfies
17 \[
18 |\mathcal H|\rho^r\le2^{h+1}.
19 \]
20 Then the family
21 \[
22 \left\{S\subseteq X:
23   |\{e\in\mathcal H:e\subseteq S\}|\ge2^{12h}\right\}
24 \]
25 has a cover \(\mathcal G\subseteq2^X\) with
26 \[
27 c_\rho(\mathcal G)\le3\cdot2^{-h}.
28 \]
29 \end{lemma}
```

四个内部标号式：

```
52 \begin{equation}\label{eq:covering-initial-cost}
53 c_\rho(\mathcal C_0)
54 \le T^{-1}2^r|\mathcal H|\rho^r
55 \le2^{r+1-3h}\le2^{1-2h}.
56 \end{equation}
```

```
74 \begin{equation}\label{eq:covering-extension}
75 \sum_{e\in\mathcal H'}\rho^{|e\setminus B|}
76 \le T\sum_{i=0}^r\binom{|B|}{i}.
77 \end{equation}
```

```
88 \begin{align}
89 \mathbb E[c_\rho(\mathcal C_1)]
90 &\le\pi\sum_{e,e'\in\mathcal H'}\rho^{|e\cup e'|}
91 \notag\\
92 &\le\pi|\mathcal H'|\rho^r2^rT
93 \le2^{r+1-3h}\le2^{1-2h}.
94 \label{eq:covering-pair-cost}
95 \end{align}
```

```
170 \begin{equation}\label{eq:covering-residual-cost}
171 \mathbb E[c_\rho(\mathcal C_2)]
172 \le2^{(4h+13rh)m-\pi m^2}\le2^{-m}.
173 \end{equation}
```

参数选择（`01_covering.tex:32-35`）：`m=2^{12h}, T=2^{4h}, \pi=2^{-8h}`。加权度数（`01_covering.tex:36-39`）：`d(I)=|\{e\in\mathcal H:I\subseteq e\}|\rho^{r-|I|}`。

#### (b) 推导补全

恒等式 `01_covering.tex:47-50`（$\sum_{|I|\le r}d(I)\rho^{|I|}=2^r|\mathcal H|\rho^r$）我补一遍：左边 $=\sum_{|I|\le r}\#\{e\supseteq I\}\rho^{r-|I|}\rho^{|I|}=\sum_{|I|\le r}\#\{e\supseteq I\}\rho^r$；对每条 $e\in\mathcal H$（$|e|=r$），满足 $I\subseteq e$ 的 $I$ 恰有 $2^r$ 个，故交换求和次序得 $2^r|\mathcal H|\rho^r$。

`eq:covering-initial-cost`：$\mathcal C_0$ 里的 $I$ 满足 $d(I)>T$，故 $\rho^{|I|}<T^{-1}d(I)\rho^{|I|}$，求和得 $c_\rho(\mathcal C_0)<T^{-1}\cdot2^r|\mathcal H|\rho^r$。代入假设 $|\mathcal H|\rho^r\le2^{h+1}$ 与 $T^{-1}=2^{-4h}$：得 $2^{-4h}\cdot2^r\cdot2^{h+1}=2^{r+1-3h}$。再用 $r\le h$：$r+1-3h\le h+1-3h=1-2h$。

`eq:covering-extension`：把 $\mathcal H'$ 按 $I=e\cap B$ 分组，每组贡献 $\#\{e:e\cap B=I\}\rho^{r-|I|}$。因为 $I\subseteq e\in\mathcal H'$，正则性（`01_covering.tex:59-62`）给出该量 $\le d(I)\le T$。而可能的 $I$ 是 $B$ 的尺寸 $\le r$ 的子集，共 $\sum_{i\le r}\binom{|B|}{i}$ 个，每个非空组至多 $T$，得 `eq:covering-extension`。

`eq:covering-pair-cost`：$\mathbb E[c_\rho(\mathcal C_1)]=\pi\sum_{e,e'}\rho^{|e\cup e'|}$，此处按重数计数（`01_covering.tex:96-97` 专门解释 "Distinct ordered pairs remain independent sampling indices even when their unions coincide."）。拆 $\rho^{|e\cup e'|}=\rho^{|e|}\rho^{|e'\setminus e|}= \rho^r\rho^{|e'\setminus e|}$（用 $|e|=r$），对固定 $e$ 用 `eq:covering-extension` 取 $B=e$、$|B|=r$，得内部 $\le T\sum_{i\le r}\binom ri\le T\cdot2^r$。乘起来 $\pi|\mathcal H'|\rho^r\cdot2^rT$；代 $\pi=2^{-8h}$、$|\mathcal H'|\rho^r\le|\mathcal H|\rho^r\le2^{h+1}$、$T=2^{4h}$：$2^{-8h}\cdot2^{h+1}\cdot2^r\cdot2^{4h}=2^{r+1-3h}\le2^{1-2h}$。

$W_t$ 递推（`01_covering.tex:113-142`）：$W_{t+1}=\sum_{(e_1,\ldots,e_{t+1})\text{ distinct}}\rho^{|e_1\cup\cdots\cup e_{t+1}|}$。对长度为 $t$ 的前缀，其并 $B$ 满足 $|B|\le rt\le rm$，用 $\rho^{|B\cup e|}=\rho^{|B|}\rho^{|e\setminus B|}$ 与 `eq:covering-extension`，扩展部分的总权重 $\le\rho^{|B|}T(1+rm)^r$（后者来自 `01_covering.tex:124-125` 的 $\sum_{i\le r}\binom{|B|}{i}\le(1+|B|)^r\le(1+rm)^r$，其组合证明在 `01_covering.tex:126-128`：把 $B$ 排序、列出每个尺寸 $\le r$ 的子集、用一个新符号补齐到长度 $r$）。对前缀求和即得 $W_{t+1}\le T(1+rm)^rW_t$，迭代 $m$ 次得 $W_m\le[T(1+rm)^r]^m$。

存活概率（`01_covering.tex:144-149`）：$m$ 个不同边给出 $m^2$ 个有序对指标（含对角），它们互不相同，故该元组全部未被采样的概率是 $(1-\pi)^{m^2}\le e^{-\pi m^2}\le2^{-\pi m^2}$。

`eq:covering-residual-cost`：$\mathbb E[c_\rho(\mathcal C_2)]\le[W_m]\cdot2^{-\pi m^2}\le2^{(\log_2T+r\log_2(1+rm))m-\pi m^2}$。要它 $\le2^{-m}$，需 $\log_2T+r\log_2(1+rm)+1\le\pi m$（`01_covering.tex:156-159`）。右边 $\pi m=2^{-8h}\cdot2^{12h}=2^{4h}$。左边：$1+rm\le(h+1)2^{12h}\le2^h\cdot2^{12h}=2^{13h}$（用 $h+1\le2^h$），$\log_2T=4h$，故左边 $\le4h+13rh+1\le13h^2+4h+1\le18h^2$（用 $r\le h$）。再 $18h^2\le18\cdot2^{2h}\le2^{4h}$（$h^2\le4^h$，且 $18\le2^{2h}$ 对 $h\ge5$ 成立，$h\ge64$ 富余）。合成 `eq:covering-residual-cost` 的 $2^{(4h+13rh)m-\pi m^2}\le2^{-m}$。

收尾（`01_covering.tex:175-184`）：$\mathbb E c_\rho(\mathcal G)\le2^{1-2h}+2^{1-2h}+2^{-m}=2^{2-2h}+2^{-m}\le3\cdot2^{-h}$。$h\ge64$ 下 $2^{2-2h}=4\cdot2^{-2h}\le2^{-h}\cdot2^{2-h}\le2^{-h}$，$2^{-m}=2^{-2^{12h}}$ 远小于 $2\cdot2^{-h}$。期望存在性一步（`01_covering.tex:182-184`）："All families and sampling indices are finite, so some outcome has cost at most its expectation."

覆盖性（`01_covering.tex:107-111`）对每个抽样结果都成立，这是整个构造的支点：$\mathcal C_0$ 抓大加权度数的 $I$；$S$ 若不含 $\mathcal C_0$ 里的任何 generator，则它含 $\ge m$ 条正则边（因为 $S$ 含 $\ge2^{12h}=m$ 条 $\mathcal H$ 的边，而含非正则子集的边就是正则边，$S$ 不含 $\mathcal C_0$ 的 generator 意味着它含的所有边都正则），取其中 $m$ 条，若任一对被采样则其并在 $\mathcal C_1\subseteq$ 目标，否则该 $m$ 元组贡献了 $\mathcal C_2$ 里的一个 generator。

#### (c) 机械理由

$0<\rho<1$：$\rho=1$ 时 $|\mathcal H|\rho^r\le2^{h+1}$ 变成基数约束、结论 $c_\rho(\mathcal G)\le3\cdot2^{-h}$ 变成基数约束，两边都失去经济学；$\rho=0$ 时假设恒真、结论平凡。开区间是给 $\rho^{r-|I|}$ 这类比值留意义。

$1\le r$：$r=0$ 时 $\mathcal H\subseteq\binom X0=\{\varnothing\}$，$|\mathcal H|\le1$，而 $e=\varnothing\subseteq S$ 对一切 $S$ 成立，覆盖 trivially 由 $\{\varnothing\}$ 给出，代价 $1$，超过 $3\cdot2^{-h}$。排除 $r=0$ 是必要的，并非偷懒：Lean 侧 `ElementaryCovering.lean:25` 把这条假设写成 `(_hr : 1 ≤ r)`，前缀下划线证明正文确实从未用到它，只在陈述里保留。这是个有意思的不对称：人（和机器）都不需要它，但命题的字面形式需要它，因为 $r=0$ 会让 $\rho^r=1$ 破坏 `eq:covering-initial-cost` 的 $2^{1-2h}$ 估计。

$r\le h$：消费方是两处，$2^{r+1-3h}\le2^{1-2h}$（`01_covering.tex:55`）与 $4h+13rh+1\le18h^2$（`01_covering.tex:165`）。Lean 侧 `CoveringNumericalBounds.lean:44`、`:74-75`、`:109`、`:154` 每条数值引理都带 `(hrh : r ≤ h)`。若放宽成 $r\le h^2$，第一处变成 $2^{h^2+1-3h}$，正指数，初代价直接爆掉。

$h\ge64$：这条下界的真实来源在 weights 一节（bin 的下限 $h\ge64r$，`02_weights.tex:158-159`，由 $\mathcal G_0$ 的阈值 $2^{-64|U|}$ 决定），covering 引理只是被动接受。在引理内部它被消费三次：$h+1\le2^h$（`01_covering.tex:168`，实际 $h\ge1$ 即可，但 Lean `CoveringNumericalBounds.lean:47` 用的是 `Nat.lt_two_pow_self`）、$18h^2\le18\cdot2^{2h}$、$18\cdot2^{2h}\le2^{4h}$。最后一处才是硬需求（$h\ge5$ 够，但引理不独立决定 64）。

$|\mathcal H|\rho^r\le2^{h+1}$：这条是 bin 全局界 $|\mathcal H_{r,h}|q^r2^{-(h+1)}<1$ 的直接改写（`02_weights.tex:161-168`），那里的 $q^r$ 换成 $\rho^r$ 时多乘了一个 $\rho^{-r}q^r=(q/\rho)^r=L^r=2^{70r}$？我核对过：`02_weights.tex:166-167` 写的正是 $|\mathcal H_{r,h}|\rho^r\le2^{h+1}$，因为它用的是 $\rho$ ，并非 $q$，而 $\rho<q$ 使左边更小，所以这一步是免费的（`02_weights.tex:161-165` 的 $|\mathcal H|q^r2^{-(h+1)}<1$ 乘 $2^{-(h+1)}$ 换成 $(\rho/q)^r\le1$ 即得）。

$2^{12h}$：目标族的门槛。消费方是 `02_weights.tex:170-171`（"Choose a cover $\mathcal G_{r,h}$ of the sets containing at least $2^{12h}$ members"）与 `eq:bin-power-sum` 的 $2^{12h}\cdot2^{-16h}=2^{-4h}$。12 的选择要让 $16-12=4>0$（可求和）且 $4\cdot64=256>32$（和要压过 $2^{-32}$）。取 12 ，并非 8 或 11，是让 $18h^2\le2^{4h}$ 与 $2^{-4h}$ 的求和两头同时有余。

$m=2^{12h}$、$T=2^{4h}$、$\pi=2^{-8h}$：三个量必须由 $h$ 单项式给出且指数成比例，因为残余项是 $[\text{poly}]^m\cdot2^{-\pi m^2}$，只有 $\pi m^2$ 与 $m\log(\text{poly})$ 同阶才能压住；$\pi m=2^{4h}=\log_2$（poly 量级 $\times m$）正是那个平衡点。$T\pi=2^{-4h}$，于是 pair 代价 $\pi|\mathcal H|\rho^r2^rT=2^{1-2h}$ 与初代价同阶，这是 $\pi$ 取 $2^{-8h}$、$T$ 取 $2^{4h}$ 的耦合条件。

$3\cdot2^{-h}$：这个形式是给 `eq:bin-cost-sum` 的几何求和用的，系数 3 是 $2^{1-2h}+2^{1-2h}+2^{-m}\le3\cdot2^{-h}$ 的 slack 记录，$\sum_{h\ge64r}3\cdot2^{-h}=3\cdot2\cdot2^{-64r}=6\cdot2^{-64r}$，再对 $r$ 求和得 $\frac{6}{2^{64}-1}$（`02_weights.tex:184-187`）。所以那个 6 是"3 乘以几何比 $1/(1-2^{-1})$"，不是新常数。

#### (d) 候选失败路线

`[推测]` 失败路线一：只用 $\mathcal C_0\cup\mathcal C_1$，去掉残余项。断在：$S$ 含很多正则边但其中任何一对都没被采样时，$\mathcal C_1$ 里没有 generator 落在 $S$ 内；此时必须靠 $\mathcal C_2$ 兜底。断的迹象是 `01_covering.tex:107-111` 的三分法论证，若没有 $\mathcal C_2$，那段论证最后一句 "otherwise their full union belongs to $\mathcal C_2$" 无处可写。

`[推测]` 失败路线二：把成对采样换成单条边的采样（$\pi$ 作用在 $\mathcal H'$ 上，并非 $(\mathcal H')^2$）。断在扩展代价：单条边 $e$ 的 $\rho^{|e|}= \rho^r$ 太大，$\pi|\mathcal H|\rho^r$ 无法用 $2^{1-2h}$ 控制住；而并 $e\cup e'$ 的好处正是让"落在 $S$ 内"的概率随 $S$ 的边数平方增长，从而 $m^2$ 的二次指数出现在存活概率里（`01_covering.tex:144-149`）。少了平方，$\pi m^2$ 变成 $\pi m$，与 $\log(\text{poly})\cdot m$ 同阶，只剩常数比较，$h$ 的余量全部耗尽。

`[推测]` 失败路线三：用确定性构造（比如按字典序取极小边对）替代概率方法。断在最后一步的存在性论证 `01_covering.tex:182-184`，它依赖"所有族与抽样指标有限，故某结果不超过期望"。确定性构造无法给出代价上界与覆盖性的同时成立；这也解释了 Lean 侧为什么要专门建一套有限实和的概率机器（`FiniteProbability.lean` 195 行、`ProbabilisticExistence.lean` 57 行的 `exists_le_expectation`）。

### 5.5 `prop:half-density`（下）：签名恒等式、组装与验证（`sections/02_weights.tex:71-207`）

#### (a) 逐字引用

例外集下界的声明（`02_weights.tex:71-75`）：

```
71 \paragraph{A bound on every exceptional set.}
72 Fix $S\in E_{32}(\mathcal F)$. We claim that
73 \begin{equation}\label{eq:exceptional-weight-bound}
74  \sum_{\varnothing\ne U\subseteq S}w(U)^{16}\ge2^{-32}.
75 \end{equation}
```

签名列质量的定义与零列取消（`02_weights.tex:76-99`）：

```
76 Consider an array of bits with $32$ rows and $N$ columns. For a column
77 $y\in\{0,1\}^{32}$, let
78 \[
79  P(y)=\prod_{j=1}^{32}q^{y_j}(1-q)^{1-y_j}.
80 \]
81 For columns in $S$, we want a correction that cancels the all-zero column
82 and factors across rows. A suitably scaled parity term has both properties.
83 Give each column outside $S$ the mass function $P$, and give each column
84 in $S$ the signed mass function
85 \[
86  R(y)=P(y)-(1-q)^{32}(-1)^{\sum_{j=1}^{32}y_j}.
87 \]
88 With two rows, this is precisely Li's signed kernel after multiplying
89 by the Bernoulli masses~\cite[Section~2]{Li26}.
```

```
98 Let $\nu_S$ be the product of these column masses. Since
99 $R(0,\ldots,0)=0$, every array with nonzero $\nu_S$-weight has a $1$
```

列展开与因子化（`02_weights.tex:110-124`）：

```
110 Expand the column products, and let $U\subseteq S$ be the columns in
111 which the subtracted term is chosen. After taking out $(-1)^{|U|}$,
112 the correction contributes
113 \[
114  (1-q)^{32|U|}\prod_{j=1}^{32}
115  (-1)^{\sum_{i\in U}x_{ji}}.
116 \]
117 All coordinates outside $U$ retain their Bernoulli product masses.
118 Thus the sum factors over rows. In each row the factor is precisely
119 $b(U)$ from \eqref{eq:weights-definition}, because the power
120 $(1-q)^{32|U|}$ distributes as $(1-q)^{|U|}$ to each row.
121 It follows that
122 \begin{equation}\label{eq:signed-identity}
123  0=\sum_{U\subseteq S}(-1)^{|U|}b(U)^{32}.
124 \end{equation}
125 All products and sums here are finite. Isolating the empty term and
126 using the triangle inequality gives
127 \[
128  2^{-32}\le b(\varnothing)^{32}
129  \le\sum_{\varnothing\ne U\subseteq S}|b(U)|^{32}
130  =\sum_{\varnothing\ne U\subseteq S}w(U)^{16},
131 \]
132 which proves \eqref{eq:exceptional-weight-bound}.
```

覆盖构造（`02_weights.tex:134-151` 与 `151-175`）：

```
134 \paragraph{Constructing the cover.}
135 Set $\rho=q/L$. First include all sets in
136 \[
137  \mathcal G_0=
138  \{U\subseteq[N]:U\ne\varnothing,\ w(U)\ge2^{-64|U|}\}
139 \]
140 as generators. For $U\in\mathcal G_0$ with $r=|U|\ge1$,
141 \[
142  \rho^r=q^r2^{-70r}
143  \le2^{-6r}q^r w(U)
144  \le2^{-6}q^r w(U).
145 \]
146 Hence \eqref{eq:global-weight-bound} gives
147 \begin{equation}\label{eq:outright-cost}
148  c_\rho(\mathcal G_0)\le2^{-6}.
149 \end{equation}
```

```
151 Partition the remaining nonempty sets of positive weight into families
152 \[
153  \mathcal H_{r,h}=
154  \bigl\{U\subseteq[N]:|U|=r,\ U\notin\mathcal G_0,
155  \quad 2^{-(h+1)}<w(U)\le2^{-h}\bigr\},
156 \]
157 where $r\ge1$ and $h$ is an integer. Every such set belongs to exactly
158 one bin, and every occupied bin has $h\ge64r$. Indeed, its weights are
159 strictly below $2^{-64r}$; a weight equal to that threshold was included
160 in $\mathcal G_0$. By \eqref{eq:global-weight-bound},
161 \[
162  |\mathcal H_{r,h}|q^r2^{-(h+1)}
163  <\sum_{U\in\mathcal H_{r,h}}q^r w(U)\le1
164 \]
165 for each occupied bin. In particular,
166 \[
167  |\mathcal H_{r,h}|\rho^r\le2^{h+1}.
168 \]
169 Since $h\ge64r\ge64$, all the hypotheses of
170 Lemma~\ref{lem:covering} hold. Choose a cover $\mathcal G_{r,h}$ of
171 the sets containing at least $2^{12h}$ members of $\mathcal H_{r,h}$,
172 with
173 \[
174  c_\rho(\mathcal G_{r,h})\le3\cdot2^{-h}.
175 \]
176 There are only finitely many occupied bins, because the ground set is
177 finite. We may therefore choose these covers simultaneously and form
178 \[
179  \mathcal G=\mathcal G_0\cup\bigcup_{\mathcal H_{r,h}\ne\varnothing}
180  \mathcal G_{r,h}.
181 \]
```

```
184 \begin{equation}\label{eq:bin-cost-sum}
185  3\sum_{r\ge1}\sum_{h\ge64r}2^{-h}
186  =\frac{6}{2^{64}-1}<\frac14
187 \end{equation}
188 and \eqref{eq:outright-cost} imply
189 \[
190  c_\rho(\mathcal G)
191  \le\frac1{64}+\frac{6}{2^{64}-1}<\frac12.
192 \]
```

覆盖性验证（`02_weights.tex:194-207`）：

```
194 It remains to show that $\mathcal G$ covers $E_{32}(\mathcal F)$.
195 Suppose that $S\subseteq[N]$ contains no member of $\mathcal G$.
196 It contains no member of $\mathcal G_0$ and fewer than $2^{12h}$
197 members of each bin $\mathcal H_{r,h}$. Zero weights contribute nothing,
198 so
199 \begin{equation}\label{eq:bin-power-sum}
200  \begin{aligned}
201  \sum_{\varnothing\ne U\subseteq S}w(U)^{16}
202  &\le\sum_{r\ge1}\sum_{h\ge64r}2^{12h}2^{-16h}\\
203  &=\frac{16}{15(2^{256}-1)}<2^{-32}.
204  \end{aligned}
205 \end{equation}
206 By \eqref{eq:exceptional-weight-bound}, such an $S$ cannot belong to
207 $E_{32}(\mathcal F)$. Thus $\mathcal G$ is the required cover.
```

#### (b) 推导补全（签名侧）

阵列视角的翻译。把 $\{0,1\}^{32\times N}$ 的元素看成 32 行、每行是 $[N]$ 的一个子集。列质量 $P$ 就是 $[N]\setminus S$ 上按 $\mu_q$ 逐列取积；$S$ 内的列用 $R$。逐列核对 $R(0,\ldots,0)=P(0,\ldots,0)-(1-q)^{32}\cdot1=(1-q)^{32}-(1-q)^{32}=0$。$R$ 在其他列向量的符号不可控（例如 $y$ 有单个 1 时 $R=q(1-q)^{31}+(1-q)^{32}=2q(1-q)^{31}>0$；有两个 1 时 $R=q^2(1-q)^{30}-(1-q)^{32}$，符号取决于 $q$），所以 $R$ 确实是变号的，这正是 `02_weights.tex:107-108` 那句"非负性不需要"的意义所在。

恒为 0 的那一步。支撑上的每个阵列在 $S$ 的每列都有 1，故 32 行的并 $R_{\text{rows}}\supseteq S$。若 32 行全在 $\mathcal F$ 内，则 $S$ 被 32 个 $\mathcal F$ 成员的并覆盖，与 $S\in E_{32}(\mathcal F)$ 矛盾。所以 $\prod_jf(x_j)=0$ 在支撑上逐点成立，$\sum_x\nu_S(x)\prod_jf(x_j)=0$ 里的每一项都是 0。这里 $\nu_S$ 的可负性完全不碍事：求和为 0 是由逐项为 0 推出的。

展开成签名恒等式。每列有两个选择：留 $P$ 或者取 $-R$ 里的修正项。设被取修正项的列集为 $U\subseteq S$。修正项在列 $y$ 上的值是 $-(1-q)^{32}(-1)^{\sum_jy_j}$，$|U|$ 个列合出 $(-1)^{|U|}(1-q)^{32|U|}\prod_{j}\prod_{i\in U}(-1)^{x_{ji}}$，与 `02_weights.tex:113-116` 一致（把 $\prod_{i\in U}\prod_j$ 交换次序成 $\prod_j\prod_{i\in U}$）。其余列留 $P$，即逐坐标的 Bernoulli-$q$ 质量。于是整个和按行分离：第 $j$ 行得到 $\sum_{x_j\in\{0,1\}^N}f(x_j)(1-q)^{|U|}\prod_{i\in U}(-1)^{x_{ji}}\prod_{i\notin U}q^{x_{ji}}(1-q)^{1-x_{ji}}$。$(1-q)^{32|U|}$ 分给 32 行、每行一份 $(1-q)^{|U|}$，这正是 `02_weights.tex:119-120` 那句"because the power $(1-q)^{32|U|}$ distributes as $(1-q)^{|U|}$ to each row"。每行那份恰好是 `eq:weights-definition` 的 $b(U)$。32 行给出 $b(U)^{32}$。合并得 `eq:signed-identity`。

下界。`eq:signed-identity` 里 $U=\varnothing$ 的项是 $b(\varnothing)^{32}$（$(-1)^0=1$），其余项移到右边取绝对值：$b(\varnothing)^{32}=\bigl|\sum_{\varnothing\ne U\subseteq S}(-1)^{|U|}b(U)^{32}\bigr|\le\sum|b(U)|^{32}$。$b(\varnothing)=\mu_q(\mathcal F)\ge1/2$ 给出 $b(\varnothing)^{32}\ge2^{-32}$。$|b|^{32}=(b^2)^{16}=w^{16}$ 用的是 32 为偶数，$b^{32}\ge0$，所以绝对值可以去掉。Lean 里这一步是显式引理：`ExceptionalWeightBound.lean:28` 的 `hpower (U : Finset V) : b U ^ 32 = (b U ^ 2) ^ 16` 与 `ExceptionalWeightBound.lean:30` 的 `hnonneg (U : Finset V) : 0 ≤ b U ^ 32`。

#### (b2) 推导补全（组装侧）

$\mathcal G_0$ 的预算。对 $U\in\mathcal G_0$（$r=|U|\ge1$），$\rho^r=(q/L)^r=q^r2^{-70r}$；由 $w(U)\ge2^{-64r}$ 得 $2^{-64r}\le w(U)$，两边乘 $2^{-6r}q^rw(U)$ 的右侧核对：$2^{-70r}=2^{-64r}\cdot2^{-6r}\le w(U)\cdot2^{-6r}$，故 $\rho^r\le2^{-6r}q^rw(U)$；再由 $r\ge1$ 得 $2^{-6r}\le2^{-6}$。对 $U$ 求和并用 `eq:global-weight-bound`（$\sum_Uq^{|U|}w(U)\le1$）得 `eq:outright-cost`。注意这里要求 $U\ne\varnothing$，否则 $\rho^0=1$ 而 $2^{-6}q^0w(\varnothing)$ 可能小于 1；`02_weights.tex:138` 的 $U\ne\varnothing$ 就是为此。

bin 的入选与 $h\ge64r$。剩余集合权重 $<2^{-64r}$（等于的进了 $\mathcal G_0$），落在唯一的 $h$ 使 $2^{-(h+1)}<w\le2^{-h}$，由 $w<2^{-64r}$ 得 $2^{-h}>...$ 严格地：$h$ 是 $\lceil-\log_2w\rceil$ 型指标，$w<2^{-64r}$ 蕴含 $h\ge64r$。

bin 的 $|\mathcal H_{r,h}|\rho^r\le2^{h+1}$。由 $w>2^{-(h+1)}$ 得 $|\mathcal H|q^r2^{-(h+1)}<\sum_{U\in\mathcal H}q^rw(U)\le1$，故 $|\mathcal H|q^r<2^{h+1}$；乘 $(\rho/q)^r=2^{-70r}\le1$ 得 $|\mathcal H|\rho^r\le2^{h+1}$，即 `lem:covering` 的假设。同时 $|U|=r$ 给出 $\mathcal H_{r,h}\subseteq\binom{[N]}r$（uniform 条件），$1\le r$ 与 $r\le h$ 由 $h\ge64r$ 给出，$h\ge64$ 由 $h\ge64r\ge64$ 给出：`lem:covering` 的四条假设全部就位。

同时选择与去重（`02_weights.tex:176-183`）。占用 bin 有限（基集有限，$r$ 从 1 到 $N$、$h$ 从 $64r$ 到 $\lceil-\log_2w_{\min}\rceil$），故可逐个 bin 用一次 `lem:covering` 并同时选取覆盖结果；并集的代价用次可加性 $\eqno{c_\rho(\bigcup)\le\sum c_\rho}$ 控制，去重只会减小代价。几何和：$\sum_{h\ge64r}2^{-h}=2^{-64r}/(1-2^{-1})=2\cdot2^{-64r}$，乘系数 3 再对 $r$ 求和：$6\sum_{r\ge1}2^{-64r}=6\cdot\frac{2^{-64}}{1-2^{-64}}=\frac{6}{2^{64}-1}$，即 `eq:bin-cost-sum`。

验证侧的求和：$S$ 不含 $\mathcal G$ 的任何 generator，故不含 $\mathcal G_0$ 的，且每个 bin 里落在 $S$ 中的成员数 $<2^{12h}$（否则 `lem:covering` 造的 $\mathcal G_{r,h}$ 里有 generator 落进 $S$）。于是该 bin 对 $\sum w^{16}$ 的贡献 $<2^{12h}\cdot(2^{-h})^{16}=2^{-4h}$。对 $r,h$ 求和：$\sum_{r\ge1}\sum_{h\ge64r}2^{-4h}=\sum_r\frac{2^{-256r}}{1-2^{-4}}=\frac{16}{15}\cdot\frac{2^{-256}}{1-2^{-256}}=\frac{16}{15(2^{256}-1)}$，即 `eq:bin-power-sum` 的中间值。而 $\frac{16}{15(2^{256}-1)}<2^{-32}$（左边 $\approx1.07\cdot2^{-256}$）。与 `eq:exceptional-weight-bound` 矛盾，反证完成。

#### (c) 假设、常数、指数、阶的机械理由

行数 32 与幂次 16。32 是这次论证唯一真正的"自由选择"，它同时决定三件事：$w$ 的幂次是 $32/2=16$、例外集下界是 $2^{-32}$、$k$ 的乘子是 32。约束是：$P:=16$ 必须大于 bin 门槛系数 $D:=12$（否则 `eq:bin-power-sum` 的 $2^{(D-P)h}$ 不衰减），且 $(P-D)\cdot G>k$ 其中 $G:=64$ 是 bin 下限、$k:=32$ 是下界指数，即 $4\cdot64=256>32$。$P-D=4$、$D=12$、$G=64$、$k=32$ 四者联立。$P$ 越大对 $D$ 越宽松，但 $k=2P$ 变大、$2^{-k}$ 变小、下界更难超过上界，方向相反；实测上界 $\approx2^{-251.6}$、下界 $2^{-32}$，$P=16$ 已给出约 $2^{220}$ 的余量，所以 32 是被"要盖住 $k=32L$ 的元组重分组"这个应用侧理由选中的：`00_intro.tex:15` 允许重复后 32 与 $L$ 的乘法可交换。`02_weights.tex:89-93` 还留了一句自述：两行时这就是 Li 的签名核，偶数行的推广 Park 已在脚注里指出，本篇的新东西是把 32 行得到的高次幂与 `lem:covering` 结合。

$2^{-64|U|}$ 与 $h\ge64r$。64 是把 $\mathcal G_0$ 与 bin 分界的门槛，同时保证进入 `lem:covering` 的 $h\ge64$。它必须满足两条：$64\ge$ covering 所需的下限，与 $64\cdot4>32$。两个都远未吃紧，说明 64 是被 70 反推出来的：因为要 $\rho=q/L$ 里 $L=2^{70}$，而 $70=64+6$ 里 6 是 $2^{-6}$ 预算。若把 64 换成 32（则 $L=2^{38}$、$k=2^{43}$），检查 $(P-D)G=4\cdot32=128>32$ 仍成立，$h\ge32$ 时 covering 的 $18h^2\le2^{4h}$ 也成立（$h\ge5$ 就够），所以 64 并非最优化产物，它只是一个 2 的幂。这一点我在 Lean 侧得到佐证：`CoveringNumericalBounds.lean:11-20` 把 `m`、`T`、`p`、`A` 写成 $h$ 的函数，指数 12、4、8、13 全是字面量，没有任何"求最小可行值"的痕迹。

$2^{-32}$（`eq:exceptional-weight-bound`）。它是 $b(\varnothing)^{32}$ 在 $b(\varnothing)\ge1/2$ 下的最小值，指数与行数同为一个数，因为 $b(\varnothing)^{\text{rows}}$ 里 rows 就是 32。

$\mathcal G_0$ 预算 $2^{-6}$ 与最终 $1/64$。$2^{-6}=1/64$，与 $2^{-70}\cdot2^{64}=2^{-6}$ 同源。总预算 $\frac1{64}+\frac{6}{2^{64}-1}<\frac12$：第一项占 $\frac12$ 的 $\frac1{32}$，第二项占约 $2^{-60}$。余量是压倒性的，这与 §4.2 的观察一致：$1/2$ 不是被卡的阈值。

$w(U)=b(U)^2$ 的非负性。`02_weights.tex:23` 定义成平方，`02_weights.tex:30-32` 的 gap 论证与 `02_weights.tex:157-168` 的 bin 分类都需要 $w\ge0$；Lean 里由 `FourierWeights.lean:78-79` 的 `w_nonneg ... := sq_nonneg _` 一句话解决。若 $w$ 取成 $|b|$，$w^{16}$ 的写法不变但 `eq:bin-power-sum` 一侧要重做，全局界一侧 $\sum q^{|U|}|b(U)|\le1$ 不成立（Parseval 只给平方和）。平方是必需的，不是修辞。

有限性依赖。`02_weights.tex:176-177` "There are only finitely many occupied bins, because the ground set is finite." 与 `02_weights.tex:125` "All products and sums here are finite." 两处显式声明，是本篇对"基集有限"的唯一实质引用。它们支撑的是：换序合法、同时选择合法、期望存在性合法。

#### (d) 候选失败路线

`[推测]` 失败路线一：把签名恒等式用在 $\mathcal F$ 的补集指标 $g=1-f$ 上。那会得到 $\sum_U(-1)^{|U|}\tilde g(U)^{32}=0$ 但空项变成 $\tilde g(\varnothing)=1-\mu_q(\mathcal F)\le1/2$，方向反了：需要的是空项**有正下界**，而假设 $\mu\ge1/2$ 只给补集测度 $\le1/2$ 的上界。断在 `02_weights.tex:127-128` 那一步。

`[推测]` 失败路线二：用 4 行（$w^2$ 的幂次 $P=2$）配 $D=1$ 的门槛。断在 `lem:covering` 的 $h$ 下限：$P-D=1$，需要 $G\cdot1>k=4$ 即 $G\ge5$，看似可行；但 bin 里 $|\mathcal H|\rho^r\le2^{h+1}$ 与目标族门槛 $2^{Dh}=2^{h}$ 会让 covering 的残余项需要 $\pi m$ 压过 $\log T+D\cdot...$，实测 $D=1$ 时 $m=2^{h}$ 太小，$\pi m^2=2^{-16h}\cdot2^{2h}=2^{-14h}\to0$，残余项指数变成正，爆掉。$D$ 与 $m=2^{Dh}$ 必须大到让 $\pi m^2$ 二次占优。

`[推测]` 失败路线三：把 $\mathcal G_0$ 的阈值改成与 $r$ 无关的常数 $2^{-64}$。断在 `02_weights.tex:142-144`：那时 $\rho^r\le2^{-6r}q^rw(U)$ 对大 $r$ 不成立（$2^{-70r}$ 与 $2^{-64}w$ 无法比较），大集合的 generator 定价失控，`eq:outright-cost` 的求和发散。阈值必须随 $|U|$ 线性变化才能匹配 $\rho^{|U|}$ 的定价。

### 5.6 `cor:two-union`（`sections/00_intro.tex:109-118`，证明 `120-132`）

#### (a) 逐字引用

```
109 \begin{corollary}[Two unions at constant density loss]
110 \label{cor:two-union}
111 There is a universal constant $C\ge1$ such that, for every integer $N\ge1$,
112 every $p\in(0,1)$, and every family $\mathcal D\subseteq2^{[N]}$,
113 \[
114 \mu_p(\mathcal D)>\frac12
115 \quad\Longrightarrow\quad
116 E_2(\mathcal D)\text{ is }(p/C)\text{-small}.
117 \]
118 \end{corollary}
```

证明全文（`00_intro.tex:120-132`）：

```
120 \begin{proof}
121 If $E_2(\mathcal D)=\varnothing$, the empty cover suffices. Otherwise
122 it is a nonempty proper increasing family: $\mathcal D\ne\varnothing$,
123 so $\varnothing\notin E_2(\mathcal D)$, and the defining obstruction
124 is preserved by taking supersets. By Li's result
125 \cite[Corollary~3.1]{Li26} in Park's fractional-cover formulation
126 \cite[Theorem~3.4]{Park26}, this family has a fractional cover of cost
127 at most $1/2$ at $r=p/2$. Capping each coefficient at one preserves
128 coverage and does not increase cost. The companion expectation-threshold
129 theorem~\cite[Theorem~1.1]{OpenAIThreshold26} then gives an integral cover
130 of cost at most $1/2$ at
131 $r/(25\cdot512^4)$. Thus $C=50\cdot512^4$ suffices.
132 \end{proof}
```

前置的分数小性定义（`00_intro.tex:87-93`）：

```
87 There is also a fractional version of smallness: instead of selecting
88 generators, one assigns nonnegative coefficients $a_I$ satisfying
89 \[
90 \sum_{I\subseteq S}a_I\ge1\quad(S\in\mathcal A),
91 \qquad
92 \sum_{I\subseteq[N]}p^{|I|}a_I\le\frac12.
93 \]
```

#### (b) 推导补全

第一步（退化分支）。$E_2(\mathcal D)=\varnothing$ 时空覆盖 $\mathcal G=\varnothing$ 满足 `Covers`（真空）与 $c_p(\varnothing)=0\le1/2$。这条分支在 Lean 主定理侧对应 `Basic.lean:102-104` 的 `small_empty`，但推论本身没被形式化（见 §7.3）。

第二步（结构核对）。$E_2(\mathcal D)$ 是 increasing：见 §5.2(b)。它非空：$\mathcal D=\varnothing$ 时 $\mu_p(\mathcal D)=0$，与假设 $\mu_p>1/2$ 矛盾，故 $\mathcal D\ne\varnothing$；而 $\varnothing\subseteq$ 任何 $D\in\mathcal D$，故 $\varnothing\notin E_2(\mathcal D)$。它真：$[N]\notin E_2(\mathcal D)$ 当 $\mathcal D$ 里有成员… 严格说需要 $\mathcal D$ 的某成员是全集才让 $[N]$ 逃出 $E_2$；论文只写 "nonempty proper"，proper 的依据是 $\mathcal D\ne\varnothing$ 保证至少有一个 $S$（即被单个 $D$ 覆盖的那些）不在 $E_2$ 里。这一步是给 Li 的定理凑前提：那类结论通常对"非空真 up-set"陈述。

第三步（分数覆盖）。套用 Li 的 Corollary 3.1（经 Park 的 Theorem 3.4 表述），得系数族 $a_I\ge0$ 使 $\sum_{I\subseteq S}a_I\ge1$ 对每个 $S\in E_2(\mathcal D)$，且 $\sum_I r^{|I|}a_I\le1/2$，$r=p/2$。这里密度掉一半是 Li 定理内部的事，本篇只是引用。

第四步（封顶）。把每个 $a_I$ 换成 $\min(a_I,1)$：覆盖性保留（因为 $\sum_{I\subseteq S}a_I\ge1$ 中至少一项非零，封顶至多把每项压到 1；更准确地说，若原和 $\ge1$，封顶后是否仍 $\ge1$？设 $\{I:a_I>0\}\subseteq S$ 有 $m$ 项，$\sum a_I\ge1$；封顶后 $\sum\min(a_I,1)\ge\min(\sum a_I,1)$…这一步我核对过逻辑：如果所有 $a_I\le1$ 则封顶是恒等操作，若某 $a_{I_0}>1$ 则封顶后该项变 1，而 $\sum_{I\subseteq S}a_I\ge a_{I_0}>1\ge1$，封顶后和 $\ge1$ 仍成立，因为其余项非负、$I_0\subseteq S$ 的那一项贡献 1。所以对任何包含 $I_0$ 的 $S$ 和仍 $\ge1$；对不含 $I_0$ 的 $S$，原本靠其它项求和 $\ge1$，而其它项都 $\le1$（否则它们也会被封顶，同理成为单项 1），故不变。整体覆盖性保住。），代价 $\sum r^{|I|}\min(a_I,1)\le\sum r^{|I|}a_I\le1/2$ 单调下降。封顶后系数是 $[0,1]$ 值，正好是"期望阈值"定理能吃的形式（$a_I$ 当成把 $I$ 选入随机覆盖的概率）。

第五步（整数化）。姊妹篇的 Theorem 1.1 把分数期望阈值转成整数期望阈值，密度除 $25\cdot512^4$。合并两个除法：$r/25\cdot512^4=(p/2)/(25\cdot512^4)=p/(50\cdot512^4)$，所以 $C=50\cdot512^4$。实测 $512^4=2^{36}=68\,719\,476\,736$，$C=50\cdot2^{36}=3\,435\,973\,836\,800\approx3.44\times10^{12}$。

#### (c) 机械理由

$2$（$E_2$）：分数方法能处理的并数。`00_intro.tex:99-105` 说 Park 得到的整数覆盖密度是 $\frac{p}{C\max\{1,\log\log(1/p)\}}$，而本篇这条推论把 $\log\log(1/p)$ 那个因子消掉了（$C$ 是绝对常数），差别来自 `00_intro.tex:106-107` 那句 "Combining Li's result with the companion constant-factor rounding theorem"：用姊妹篇的常数因子取整替换 Park 自己的取整，$\log\log$ 就没了。所以 $C=50\cdot512^4$ 这个巨大的数是"用密度损失换掉 $\log\log$"这桩交易的价格。

$\mu_p(\mathcal D)>\frac12$（严格不等号）：Li 的定理陈述需要严格大于，因为 $\le$ 时分数覆盖可能不存在（阈值情形）。主定理用的是 $\ge1-1/k$（非严格），两者不等号方向的差异说明两条结论不是同一台机器的两种参数。

$25\cdot512^4$ 的质因数结构：$25=5^2$，$512=2^9$，所以分母是 $5^2\cdot2^{36}$。这类"一个平方小奇数乘一个 2 的大幂"的形式是迭代型取整论证的典型产物（每轮损失一个 2 的幂，共 4 轮 $512$，加两处 $5$）。`[推测]` 我猜这是姊妹篇内部的轮数，本篇不重新证明。

$C\ge1$：声明 $C\ge1$ 是为了让 $(p/C)\in(0,1)$ 落在 `00_intro.tex:19` 的密度允许区间里。$p/C$ 仍是合法密度参数，而 $1/2$ 的代价界不变。

$E_2$ 与 $E_k$ 的对照：$k=2$ 时 `eq:exceptional-definition` 里 $S\nsubseteq D_1\cup D_2$；$C$ 落在**密度**上。而 `thm:main` 的 $k=2^{75}$ 落在**并数**上、密度分毫不损。`00_intro.tex:134-135` 就是把这两句并排摆出。

#### (d) 候选失败路线

`[推测]` 失败路线一：想把这条推论的 $C$ 直接塞进主定理以省掉 coupling 一节。断在主定理要求 $p/C$-small 而摘要要求 $p$-small；$C$ 是 $3.4\times10^{12}$，无法假装是 1。

`[推测]` 失败路线二：想对一般 $E_k$（固定 $k$）用同一台分数机器，得 $(p/C_k)$-small。断在 Li 的定理只对 $k=2$ 陈述（`00_intro.tex:96-98` 的说法是"quantitative obstruction to probability measures whose containment probabilities are bounded by $p^{|I|}$"，那是二元的相容性条件），$k\ge3$ 时分数化的障碍结构未知。

`[推测]` 失败路线三：想把封顶那步换成直接取整（$a_I\mapsto\lceil a_I\rceil$）。断在代价：向上取整把 $\sum r^{|I|}a_I\le1/2$ 变成可能远大于 $1/2$，而 $1/2$ 是 `Small` 的硬界。封顶保住的是 $\le1/2$，取整保不住。

### 5.7 `eq:all-good-rows` 与主定理证明里的两条耦合（`sections/03_density.tex:9-84`）

#### (a) 逐字引用

```
 9 \begin{proof}[Proof of Theorem~\ref{thm:main}]
10 Set $L=2^{70}$ and $k=32L=2^{75}$, and suppose that
11 $\mu_p(\mathcal D)\ge1-1/k$. In particular, $\mathcal D$ is nonempty.
12 We construct $L$ random sets $R_1,\ldots,R_L$, each with law $\mu_p$.
13 For any such construction the union bound gives
14 \begin{equation}
15 \label{eq:all-good-rows}
16 \mathbb P(R_j\in\mathcal D\text{ for all }1\le j\le L)
17 \ge1-\sum_{j=1}^L\mathbb P(R_j\notin\mathcal D)
18 \ge1-\frac Lk=\frac{31}{32}.
19 \end{equation}
20 Independence between rows is not required.
```

case 1 的构造与验证（`03_density.tex:23-35`）：

```
23 \noindent\emph{Case 1: $Lp<1$.}
24 For each coordinate $i$, independently across coordinates, choose a label
25 $J_i\in\{0,1,\ldots,L\}$ with
26 \[
27 \mathbb P(J_i=0)=1-Lp,
28 \qquad
29 \mathbb P(J_i=j)=p\quad(1\le j\le L).
30 \]
31 Put $R_j=\{i:J_i=j\}$. For a fixed row $j$, its membership indicators
32 are independent Bernoulli variables of parameter $p$, so $R_j$ has law
33 $\mu_p$. The union $R=R_1\cup\cdots\cup R_L$ has law $\mu_q$,
34 where $q=Lp\in(0,1)$: a coordinate belongs to $R$ precisely when
35 its label is nonzero.
```

$\mathcal F$ 与并的重新分组（`03_density.tex:40-58`）：

```
40 Define
41 \[
42 \mathcal F
43 =\{D_1\cup\cdots\cup D_L:D_1,\ldots,D_L\in\mathcal D\}.
44 \]
45 On the event in~\eqref{eq:all-good-rows}, the union $R$ belongs to
46 $\mathcal F$. Hence
47 \[
48 \mu_q(\mathcal F)=\mathbb P(R\in\mathcal F)
49 \ge\frac{31}{32}\ge\frac12.
50 \]
51 Grouping a tuple of $32L$ members of $\mathcal D$ into 32 groups of
52 size $L$, or conversely expanding 32 members of $\mathcal F$, shows that
53 the possible unions agree exactly. Thus
54 \[
55 E_{32}(\mathcal F)=E_{32L}(\mathcal D)=E_k(\mathcal D).
56 \]
57 Proposition~\ref{prop:half-density} makes this family $(q/L)$-small.
58 Since $q/L=p$, this is the required conclusion.
```

case 2（`03_density.tex:61-83`）：

```
61 \noindent\emph{Case 2: $Lp\ge1$.}
62 Set
63 \[
64 t=\frac{p-1/L}{1-1/L}\in[0,1).
65 \]
66 At each coordinate $i$, choose a mandatory row uniformly among the $L$
67 rows. Include $i$ in that row, and, conditional on this choice, include
68 it independently in each other row with probability $t$.
69 Make these choices independently across coordinates. For each fixed
70 row $j$,
71 \[
72 \mathbb P(i\in R_j)
73 =\frac1L+\left(1-\frac1L\right)t=p,
74 \]
75 and the coordinates of $R_j$ are independent. Thus each $R_j$ again has
76 law $\mu_p$, while the union of all rows is $[N]$ in every outcome.
77
78 By~\eqref{eq:all-good-rows}, some outcome has all $L$ rows in
79 $\mathcal D$. These rows cover $[N]$. Repeating the resulting tuple
80 32 times gives exactly $k$ members of $\mathcal D$ with full union.
81 Consequently $E_k(\mathcal D)=\varnothing$, which is covered at cost
82 zero by the empty family. This construction also covers the boundary
83 $Lp=1$, when $t=0$.
```

#### (b) 推导补全

`eq:all-good-rows` 的两条不等式。第一条是 union bound 的一般形式 $\mathbb P(\cap_jA_j)\ge1-\sum_j\mathbb P(A_j^c)$，它对任意相依事件族成立，这是 `03_density.tex:20` 那句 "Independence between rows is not required." 的全部内容。第二条用 $\mathbb P(R_j\notin\mathcal D)=1-\mu_p(\mathcal D)\le1/k$（每行边缘律都是 $\mu_p$，$L$ 项相加得 $L/k$）。$L/k=L/(32L)=1/32$，与 $L$ 无关，这是"$k$ 取成 $32L$"的直接回报：预算被设计成常数。

case 1 的三条验证。逐坐标独立标签给出乘积结构，所以只需验证单坐标。(i) 单坐标 $i$ 属于 $R_j$ 当且仅当 $J_i=j$，概率 $p$；不同坐标的 $J$ 独立，故 $R_j$ 的成员指示是独立 Bernoulli-$(p)$，即 $R_j\sim\mu_p$。(ii) 注意同一坐标只会进一行（标签唯一），故行之间**高度负相关**，这是不能独立的原因也是不需要独立的原因。(iii) 坐标属于 $R=\bigcup_jR_j$ 当且仅当 $J_i\ne0$，概率 $1-(1-Lp)=Lp=q$；同样逐坐标独立，故 $R\sim\mu_q$。这条 (iii) 是整节的枢轴：它把"并"这个非保测度操作变成保测度的（并的律是 $\mu_{Lp}$）。弃用色 $J_i=0$ 承担 $1-Lp$ 的质量，让 $L+1$ 个概率加起来为 1：$Lp+(1-Lp)=1$。

$\mu_q(\mathcal F)\ge31/32$ 的机制。$R=\bigcup_jR_j$，在 $\{R_j\in\mathcal D,\ \forall j\}$ 事件上，$R$ 是 $L$ 个 $\mathcal D$ 成员的并，按 `03_density.tex:41-44` 的定义 $R\in\mathcal F$。故 $\mu_q(\mathcal F)=\mathbb P(R\in\mathcal F)\ge\mathbb P(\text{all good})\ge31/32$。$31/32\ge1/2$ 是纯粹的数字。

重新分组同构的双向论证。$\Rightarrow$：给定 32 个 $\mathcal F$ 的成员，每个都是 $L$ 个 $\mathcal D$ 成员的并，展开得 $32L$ 个 $\mathcal D$ 成员，其并相同。$\Leftarrow$：给定 $32L$ 个 $\mathcal D$ 成员，按指标分成 32 组（每组 $L$ 个），组内取并得 32 个 $\mathcal F$ 成员，并相同。两个方向都不要求不相交、都靠允许重复（例如把 $[N]$ 拆成 $L$ 份时某些组可能凑不满，用重复补齐）。于是 $S$ 被 32 个 $\mathcal F$ 成员覆盖当且仅当被 $32L$ 个 $\mathcal D$ 成员覆盖，例外集相等。

case 2 的两条验证。(i) 边缘律：单坐标进第 $j$ 行要么因为它是强制行（概率 $1/L$），要么因为随机追加（概率 $(1-1/L)t$），二者互斥相加恰为 $p$（把 $t$ 的定义代回：$t=\frac{p-1/L}{1-1/L}=\frac{Lp-1}{L-1}$，故 $\frac1L+\frac{L-1}{L}\cdot\frac{Lp-1}{L-1}=\frac1L+\frac{Lp-1}{L}=p$）。(ii) 并：每坐标必进某一行，所以 $\bigcup_jR_j=[N]$ 恒成立。(iii) 存在性：`eq:all-good-rows` 给 $\mathbb P(\text{all good})\ge31/32>0$，故存在一个结果使 $L$ 行全在 $\mathcal D$；它们的并是 $[N]$，于是任何 $S\subseteq[N]$ 都被这 $L$ 元组覆盖。重复 32 次得到长度为 $32L=k$ 的元组，成员仍全在 $\mathcal D$（重复是被允许的），并不变，仍为 $[N]$。故 $E_k(\mathcal D)=\varnothing$。$t$ 的定义要求 $p\ge1/L$（否则分子负），$t<1$ 因为 $p<1$。边界 $Lp=1$ 即 $p=1/L$ 时 $t=0$，只用强制行，一切仍成立。

#### (c) 机械理由

$\frac{31}{32}$：它是 $1-L/k$，分母 32 就是 `prop:half-density` 的行数。$k=32L$ 这一步在两个方向被消费：给 union bound 提供 $1/32$ 预算、给 `thm:main` 提供 $k=32L$ 的重分组倍数。若把 `prop:half-density` 的行数从 32 改成 $R$，则 $k=RL$、预算 $1/R$，需要 $1/R\le1/2$ 即 $R\ge2$；$R=32$ 由 §5.5(c) 的幂次论证定死，预算 $1/32$ 是它的副产品。

$L=2^{70}$ 在这一节的第二个角色：它既是"造出的行数"又是"除掉的因子"。这两个角色必须用同一个 $L$，所以 §5.3(c) 的 $L=2^{64+6}$ 与这里的行数绑定；这是全篇最强的约束耦合，也解释了为什么 `00_intro.tex:164-168` 把 prop:half-density 的结论写成"at density $q/2^{70}$"。

$\mu_p(\mathcal D)\ge1-1/k$ 蕴含 $\mathcal D$ 非空（`03_density.tex:11` "In particular, $\mathcal D$ is nonempty."）：这一步在 case 2 里被用到（要保证 $L$ 元组的成员真的存在）。在 case 1 里也被用到（$\mathcal F\ne\varnothing$）。Lean 侧 `Main.lean:26-27` 的 `have hL : 1 < L := density_rows_gt_one` 与 `DensityConstants.lean:20-21` 的 `one_lt_pow'` 说明机器也要显式拿到 $L>1$，因为 $1/L$ 出现在 $t$ 的分母。

$1-Lp\ge0$ 与 $t\ge0$ 这对互补条件：正是 case 分界 $Lp<1$ 与 $Lp\ge1$ 的全部来源。$1-1/L$ 在 $t$ 的分母里：要求 $L>1$（`DensityConstants.lean:20` 的 `density_rows_gt_one` 就是这条）。

空族零代价（`03_density.tex:81-82`）：Lean 侧是 `Main.lean:59` 的 `exact small_empty p`，`Basic.lean:102-104` 用 `cost p ∅ = 0`（`Basic.lean:30-31` 的 `cost_empty`）与 `Covers G ∅`（`Basic.lean:76-78` 的 `covers_empty`）合成。

图的机械作用（`figures/coupling.tex:1-26`）：图用 $L=3$、$\mathbb P(J_i=0)=1-3p$（第 14 行的节点标签），三行三列的黑白格给出 $3p<1$ 时"每坐标至多进一行"的可视化。第 21-24 行的 caption 明说 "Making these choices independently across coordinates gives the required product laws." 全篇唯一一张图给了这一步，说明作者认为标签耦合是最需要直觉支撑的地方。

#### (d) 候选失败路线

`[推测]` 失败路线一：让 $L$ 行独立同分布 $\mu_p$ 再取并。断在 (b) 的第 (iii) 条：独立的 $L$ 行的并有密度 $1-(1-p)^L$，与 $Lp$ 只在 $p\to0$ 时近似，$q/L$ 与 $p$ 不再相等，`03_density.tex:57-58` 那句 "Since $q/L=p$" 变成 "$q/L\ne p$"，结论退化成 $(q/L)$-small ，并非 $p$-small。整个 case 1 的价值就在这条近似被换成恒等。

`[推测]` 失败路线二：把重分组倍数从 32 改成别的数 $R$ 同时把预算 $1/R$ 保持。断在 case 2：那里需要"把一个 $L$ 元组重复 $R$ 次得到 $k=RL$ 个成员"，若 $R$ 与 `prop:half-density` 的行数不同，$E_{R'}(\mathcal F)=E_{R'L}(\mathcal D)$ 就不匹配。倍数必须与行数同一，$k$ 才能既被 union bound 消费又被重分组消费。

`[推测]` 失败路线三：在 case 2 里改用 $L+1$ 行以让 $1-Lp$ 恒非负。断在 `03_density.tex:10` 的 $k=32L$ 与 `02_weights.tex:11` 的 $L=2^{70}$ 必须同一个符号；行数一改，`prop:half-density` 的 $q/L$ 与这里的 $q=Lp$ 中的 $L$ 脱钩，$q/L=p$ 失效。

### 5.8 无号但承重：正选择子、Related developments 的两处对照、分数小性

这些陈述没有编号，却是我做参数判断时的坐标，逐条补记。

正选择子推论（`00_intro.tex:57-77`）。逐字关键三句：`00_intro.tex:65-67` 定义 $\phi(S)=\sup_{t\in T}\sum_{i\in S}t_i$、$M=\mathbb E_{\mu_p}\phi$ 并假设 $0<M<\infty$；`00_intro.tex:68-69` 结论 "$\{S:\phi(S)\ge k^2M\}$ is $p$-small for $k=2^{75}$"；`00_intro.tex:72-73` "Nonnegativity of the coordinates makes $\phi$ monotone and subadditive under unions"。补中间步骤：取 $\mathcal D=\{D:\phi(D)<kM\}$，Markov 给 $\mu_p(\mathcal D)\ge1-1/k$；若 $S$ 被 $D_1,\ldots,D_k\in\mathcal D$ 覆盖，则 $\phi(S)\le\phi(\bigcup_jD_j)\le\sum_j\phi(D_j)<k\cdot kM=k^2M$（次可加性来自坐标非负：$\bigcup_jD_j$ 的每个 $t$ 值和不超过各 $D_j$ 上和的累加）。故 $\phi(S)\ge k^2M$ 的 $S$ 全在 $E_k(\mathcal D)$ 内，而 $\mathcal D$ 满足主定理前提，于是 $E_k(\mathcal D)$ 有代价 $\le1/2$ 的 $p$-覆盖，其子族也 small。$0<M<\infty$ 两条都用上：$M=0$ 时 $\phi$ 恒 0、阈值 $k^2M=0$ 使结论变成"$2^{[N]}$ small"，假；$M=\infty$ 时阈值无意义。恢复 Park-Pham 的 Theorem 1.2（`00_intro.tex:60-62`、`references.tex:62-67`）说明这条推论是已知的，本篇只换了机器。

Related developments 的两处对照。Hua-Song-Tudose 的离散结论（`00_intro.tex:79-82`）是"三个并 + 覆盖密度 $p^C$"；Ascoli-He-Park-Talagrand（`00_intro.tex:83-85`）是"$k$-threshold 重构 + 若干图包含性质的 case"。$k$-threshold 这个词说明他们把"$S$ 需要多少个 $\mathcal D$ 成员才能被覆盖"当成一个可定义的阈值函数，本篇的 $E_k$ 正是它的水平集。`cor:two-union`（`00_intro.tex:109-118`）与 `thm:main` 的对照句（`00_intro.tex:134-135`）是全文唯一一次作者自己摆出权衡表：一边 $k=2$、密度 $p/C$；一边 $k=2^{75}$、密度 $p$。

Park 的带 $\log\log$ 密度（`00_intro.tex:99-105`）：$\frac{p}{C\max\{1,\log\log(1/p)\}}$，前提 $\mu_p(\mathcal D)>1/2$。$\log\log(1/p)$ 在 $p\to0$ 时增长极慢，$p=e^{-e^{t}}$ 时是 $t$；这条与 `cor:two-union` 的差别（`00_intro.tex:106-107` 说结合姊妹篇的常数因子取整可得 `cor:two-union`）说明 $\log\log$ 来自取整步骤，而 $1/2$ 阈值下的二元情形可以被常数化。

分数小性（`00_intro.tex:87-98`）：$\sum_{I\subseteq S}a_I\ge1$、$\sum p^{|I|}a_I\le\frac12$、$a_I\ge0$。它与 `eq:exceptional-definition` 侧的整数小性构成 LP 与原整数覆盖的对偶关系；本篇的 Lean 形式里没有任何分数覆盖对象（见 §7.5）。

方法溯源句（`00_intro.tex:145-150`、`02_weights.tex:88-97`）：作者把签名算子的来源列了三家，Li 的两行核、Friedgut 08 的 Section 2.2、Ellis-Filmus-Friedgut 12 的 Section 4.1。这三处引用位置（不是章节号随便挑的）说明本篇 32 行阵列是把两行核做垂幂后的产物，而 $\nu_S$ 的可负性处理沿 Friedgut 那套"支撑集论证"。

## §6 常数与参数台账

位置一律是 `build/source/` 下 tex 的实测行号；"被谁消费"一栏里凡出现 `.lean` 路径，均为 `E:\math\lean\OAI\Combinatorics\DiscreteConvexity\` 下的实测命中。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $k$ | $2^{75}$，绝对常数 | `sections/00_intro.tex:45`；`sections/03_density.tex:10` 定为 $32L$ | `thm:main` 结论 $E_k(\mathcal D)$；`eq:all-good-rows` 的 $L/k=1/32$；`Main.lean:24-25` 字面量 `(2 : ℝ) ^ 75` 与 `(2 : ℕ) ^ 75` | 改小到 $32\cdot2^{69}$ 则 `03_density.tex:47-49` 的 $31/32$ 变 $15/16$ 仍可用，但 `DensityConstants.lean:26-27` 的 $32\cdot2^{70}=2^{75}$ 需重写；改成非 2 幂会让 `DensityConstants.lean:27` 的 `pow_add` 失效 |
| $1-1/k$ | $1-2^{-75}$ | `sections/00_intro.tex:48`；`sections/03_density.tex:11` | `eq:all-good-rows` 的 $\sum_j\mathbb P(R_j\notin\mathcal D)\le L/k$；`Main.lean:24` 假设 `hD` | 改成 $1-\varepsilon$ 且 $k$ 依赖 $\varepsilon$，则 `00_intro.tex:54` 的"独立于一切"失效 |
| $L$ | $2^{70}$ | `sections/02_weights.tex:11`；`sections/03_density.tex:10` | `02_weights.tex:135` 的 $\rho=q/L$；`02_weights.tex:142` 的 $2^{-70r}$；`03_density.tex:47` 的 $q/L=p$；`HalfDensity.lean:20` 的 `(2 : ℝ) ^ 70` | 改成 $2^{69}$ 则 `02_weights.tex:142-144` 的 $2^{-70r}\le2^{-6r}w(U)$ 需 $w(U)\ge2^{-63r}$，与 `02_weights.tex:138` 阈值矛盾 |
| $R$（阵列行数） | $32=2^{5}$ | `sections/02_weights.tex:76`；`sections/02_weights.tex:79` 的乘积上限 | `eq:signed-identity` 的 $b(U)^{32}$；`eq:exceptional-weight-bound` 的 $2^{-32}$；`03_density.tex:51` 的重分组倍数；`SignedArrays.lean:117` 的 `exceptional 32 D` | 改成 $R$ 则幂次变 $R/2$，需 $R/2>12$ 且 $(R/2-12)\cdot64>R$；$R=26$ 起可算但 `03_density.tex:10` 的 $k=RL$ 不再是 2 的幂 |
| $P$（$w$ 的幂次） | $16=R/2$ | `sections/02_weights.tex:74`；`sections/02_weights.tex:130` | `eq:bin-power-sum` 的 $2^{-16h}$；`Bins.lean:126-143` 的 `(W U) ^ 16`；`WeightedCover.lean:25` 的 `^ 16` | 若 $P\le D=12$，`02_weights.tex:202` 的 $2^{12h}2^{-Ph}$ 不衰减，级数发散，`eq:bin-power-sum` 的 $<2^{-32}$ 直接失效 |
| $D$（bin 计数门槛系数） | $12$ | `sections/01_covering.tex:23`；`sections/02_weights.tex:171`、`02_weights.tex:196` | `lem:covering` 的目标族 `denseFamily H (2 ^ (12 * h))`（`ElementaryCovering.lean:27`）；`02_weights.tex:202` 的 $2^{12h}$ | 改大则 `eq:bin-power-sum` 的 $2^{(D-P)h}$ 变正指数；改小则 `m=2^{Dh}` 太小、`01_covering.tex:148` 的 $\pi m^2$ 压不住 $W_m$ |
| $m$ | $2^{12h}$ | `sections/01_covering.tex:34` | `01_covering.tex:108-110` 的元组长度；`01_covering.tex:141` 的 $W_m$；`CoveringNumericalBounds.lean:11` 的 `def m (h) := 2 ^ (12 * h)` | 与 $D$ 同步变动；单独改会让 `01_covering.tex:156-159` 的不等式两边错配 |
| $T$ | $2^{4h}$ | `sections/01_covering.tex:34` | `01_covering.tex:44` 的 $\mathcal C_0$ 阈值；`eq:covering-extension` 的右端；`eq:covering-pair-cost` 的因子；`CoveringNumericalBounds.lean:14` | 改大则 `eq:covering-initial-cost` 的 $T^{-1}2^r\cdot2^{h+1}$ 变大而 `01_covering.tex:55` 的 $2^{1-2h}$ 破；改小则 $\mathcal C_0$ 太大、$W_m$ 太大 |
| $\pi$ | $2^{-8h}$ | `sections/01_covering.tex:34` | `01_covering.tex:81` 的抽样概率；`01_covering.tex:148` 的 $(1-\pi)^{m^2}$；`CoveringNumericalBounds.lean:17` | 与 $T$ 的耦合条件是 $\pi m=T=2^{4h}$；单独改 $\pi$ 会同时破坏 `eq:covering-pair-cost` 与残余项的二次占优 |
| $h$ 的下界 | $64$ | `sections/01_covering.tex:15` | `01_covering.tex:168` 的 $h+1\le2^h$ 与 $18h^2\le2^{4h}$；`02_weights.tex:169` 的 $h\ge64r\ge64$；`ElementaryCovering.lean:25` 的 `(hh : 64 ≤ h)` | 小于 64 时 `lem:covering` 的假设不再由 bin 自动提供；改到 5 以上机器不等式仍成立，说明 64 不是紧的 |
| $G$（$\mathcal G_0$ 阈值指数） | $64$ | `sections/02_weights.tex:138` 的 $2^{-64\lvert U\rvert}$ | `02_weights.tex:143` 的 $2^{-6r}$；`02_weights.tex:158-159` 的 $h\ge64r$；`eq:bin-cost-sum` 的 $2^{64}-1$ | 与 $L$ 绑定于 $L=2^{G+6}$；单独改 $G$ 会让 `02_weights.tex:142-144` 的等式不再成立 |
| $B$（$\mathcal G_0$ 预算指数） | $6$，预算 $2^{-6}=1/64$ | `sections/02_weights.tex:144`；`sections/02_weights.tex:148` | `02_weights.tex:191` 的 $\frac1{64}$；`Basic.lean` 无对应（数值在 `DyadicBins.lean`、`BinNumerics.lean` 内） | $B=0$ 时预算 $\le1$ 不严格，`02_weights.tex:191` 的 $<\frac12$ 立刻失败 |
| $\lvert\mathcal H\rvert\rho^r$ | $\le2^{h+1}$ | `sections/01_covering.tex:18`；`sections/02_weights.tex:167` | `lem:covering` 的唯一量化假设；`ElementaryCovering.lean:26` 的 `hweight`；`WeightedCover.lean:44` 的 `weightBin_cost_bound` | 指数从 $h+1$ 改成 $h+2$ 会让 `01_covering.tex:53-55` 多一个 2，`eq:bin-cost-sum` 的系数 3 变 6，余量减半 |
| $c_\rho(\mathcal G)$ 主界 | $3\cdot2^{-h}$ | `sections/01_covering.tex:27`；`sections/02_weights.tex:174` | `eq:bin-cost-sum` 的求和系数；`ElementaryCovering.lean:28` 的 `cost rho G ≤ 3 * ((2 : ℝ) ^ h)⁻¹` | 系数 3 来自两段 $2^{1-2h}$ 加 $2^{-m}$（`01_covering.tex:180`）；改成 4 时 $\frac{6}{2^{64}-1}$ 变 $\frac{8}{2^{64}-1}$，仍可，但 `01_covering.tex:179` 的 $2^{2-2h}+2^{-m}$ 需重核 |
| $2^{1-2h}$ | 两段初代价与配对代价 | `sections/01_covering.tex:55`；`sections/01_covering.tex:93` | `01_covering.tex:179-180` 的求和 $2^{2-2h}$ | 依赖 $r\le h$；若 $r$ 可达 $2h$ 则 $2^{r+1-3h}$ 变 $2^{1-h}$，与 $2^{-h}$ 同阶，$\mathcal C_0$ 预算不再随 $h$ 快衰减 |
| $1+rm\le2^{13h}$ | 13 由 $12+1$ 而来 | `sections/01_covering.tex:163` | `01_covering.tex:165` 的 $4h+13rh+1$；`CoveringNumericalBounds.lean:20` 的 `def A (r h) := 4 * h + 13 * r * h`；`CoveringNumericalBounds.lean:44` | 13 随 $D=12$ 变动；$D$ 改则 13 改，`exponent_budget` 需重证 |
| $18h^2$ | 指数的二次上界 | `sections/01_covering.tex:165` | `01_covering.tex:166` 的 $18h^2\le18\cdot2^{2h}\le2^{4h}=\pi m$ | 机器侧不需要这一链：`CoveringNumericalBounds.lean:74-75` 直接证 `A r h + 1 ≤ 2 ^ (4 * h)` |
| $W_t$ 递推 | $W_{t+1}\le T(1+rm)^rW_t$ | `sections/01_covering.tex:139-141` | `01_covering.tex:154` 的 $\mathbb E c_\rho(\mathcal C_2)$；`CoveringResidualTuples.lean`、`CoveringResidualCost.lean` | 递推依赖 `eq:covering-extension`；该式破则整条链破 |
| $(1+\lvert B\rvert)^r$ | 二项和的粗界 | `sections/01_covering.tex:124-126` | `01_covering.tex:131-134` 的前缀扩展权重；`CoveringBinomialBounds.lean`（53 行专证此式） | 用 Kruskal-Katona 型精界可省，但机器侧要额外引理；粗界是刻意的省事 |
| $\binom{X}{r}$ | $r$ 均匀层 | `sections/01_covering.tex:16` | `lem:covering` 的 $\mathcal H$ 定义域；`ElementaryCovering.lean:24` 用 `uniform : ∀ e ∈ H, e.card = r` 替代 | 去掉均匀性则 `eq:covering-extension` 的 $\rho^{r-\lvert I\rvert}$ 指数不齐，$d(I)$ 的定义失效 |
| $\rho$ | $q/L$ | `sections/02_weights.tex:135` | `lem:covering` 的密度参数；`Small ρ A`；`WeightedCover.lean:26,28` 的 `let ρ : ℝ := q / (2 : ℝ) ^ 70` | 这是唯一让密度下移的位置；改它等于改摘要的"同一密度"承诺 |
| $q^{\lvert U\rvert}w(U)$ 全局和 | $\le1$ | `sections/02_weights.tex:62`；`sections/02_weights.tex:66` | `eq:outright-cost`；`weightBin_cost_bound`；`FourierGlobalBound.lean`（76 行） | 若右端换成 $\mu_q(\mathcal F)$，bin 计数要乘 $\mu$，不影响 $<1$ 的使用；改成 $\le\lvert\mathcal F\rvert$ 类界则全部失效 |
| $\chi_U$ 归一化 | $[q(1-q)]^{\lvert U\rvert/2}$ | `sections/02_weights.tex:39` | `02_weights.tex:53-57` 的 $\widehat f(U)$ 换算；`02_weights.tex:63` 的 $(1-q)^{\lvert U\rvert}\widehat f^2=q^{\lvert U\rvert}w$ | 去掉 $1/2$ 次方则 Parseval 一侧多出 $q(1-q)$ 幂，$w$ 与代价不同价 |
| $b(\varnothing)$ | $\mu_q(\mathcal F)\ge1/2$ | `sections/02_weights.tex:26`；`sections/02_weights.tex:128` | `eq:exceptional-weight-bound` 的 $2^{-32}$；`FourierWeights.lean:71-72` 的 `b_empty`；`ExceptionalWeightBound.lean:44` | 若 $\mu_q(\mathcal F)$ 只 $\ge1/3$，下界变 $3^{-32}\approx2^{-50.7}$，仍小于上界 $\approx2^{-251.6}$，定理仍真但 `03_density.tex:48-49` 的 $31/32\ge1/2$ 写法要改 |
| $\frac12$（代价阈值） | $c_p(\mathcal G)\le1/2$ | `sections/00_intro.tex:24`；`sections/02_weights.tex:191` | `Small` 定义；`Model.lean:41-42` 的 `cost p G ≤ 1 / 2` | 改成 $\le1/3$ 时 `02_weights.tex:191` 的 $\frac1{64}+\frac{6}{2^{64}-1}\approx2^{-6}$ 仍满足，改动无害；改成 $\le2^{-7}$ 则 `eq:outright-cost` 的 $2^{-6}$ 直接超支 |
| $2^{-(h+1)}<w\le2^{-h}$ | dyadic bin | `sections/02_weights.tex:155` | bin 的唯一分解；`DyadicBins.lean`（95 行）、`Bins.lean`（167 行） | 闭开方式改动会让 $h\ge64r$ 变成 $h\ge64r-1$，与 `01_covering.tex:15` 的 $h\ge64$ 在 $r=1$ 处冲突 |
| $\frac{6}{2^{64}-1}$ | $<\frac14$ | `sections/02_weights.tex:186` | `02_weights.tex:191` 的总代价；`BinNumerics.lean`（178 行）与 `Bins.lean` 里的 `finite_bin_cost_lt_quarter` | 6 是 $3\times2$（系数 3 与几何比 $1/(1-2^{-1})$）；$G=64$ 改成 8 时该值 $\approx0.024$，与 $\frac1{64}\approx0.016$ 相加 $\approx0.04<\frac12$ 仍成立 |
| $\frac{16}{15(2^{256}-1)}$ | $<2^{-32}$ | `sections/02_weights.tex:203` | `02_weights.tex:206` 的反证；`BinNumerics.lean:113` 的 `sum ... < (1 / 2) ^ 32` | $16/15$ 是几何比 $1/(1-2^{-4})$；256 是 $(P-D)\cdot G=4\cdot64$；任一改动使不等号方向翻转则反证失效 |
| $2^{-64\lvert U\rvert}$ 与 $2^{-6r}$ | 见 $G$、$B$ 两行 | `sections/02_weights.tex:138`、`sections/02_weights.tex:143` | 同上 | 同上 |
| $E_k$ 的 $k$ 允许重复 | 定义级许可 | `sections/00_intro.tex:15` | `03_density.tex:51-56` 的重分组；`03_density.tex:79-80` 的重复 32 次；`Model.lean:44-46` 的 `Fin k → Finset α` | 禁止重复则 `E_{32}(\mathcal F)=E_{32L}(\mathcal D)$ 只余 $\supseteq$，主定理 case 1 断 |
| $31/32$ | union bound 产出 | `sections/03_density.tex:18`；`sections/03_density.tex:49` | `03_density.tex:49` 的 $\ge1/2$；`Main.lean:43` 的 `calc (1/2:ℝ) ≤ 1 - 1/32 := by norm_num` | 若 $L/k=1/2$ 恰好（$k=2L$），$\ge1/2$ 仍成立但 case 2 需要的 $L/k<1$ 变 $1/2<1$ 仍成立；真正崩点是 $R$ 与 $P=R/2$ 的幂次约束 |
| $1-Lp$（弃用色质量） | $\ge0$ 的条件 | `sections/03_density.tex:27` | case 1 的概率合法性；`LabelCoupling.lean`（171 行） | $Lp>1$ 时不是概率，case 2 接管；两 case 在 `03_density.tex:83` 的边界处闭合 |
| $q=Lp$ | 并的密度 | `sections/03_density.tex:34` | `03_density.tex:47-49`；`03_density.tex:57-58` 的 $q/L=p$；`LabelCoupling.lean` 的 `familyMeasure_unionFamily_label_lower`（`Main.lean:40`） | 独立行会给出 $1-(1-p)^L$，$q/L=p$ 失效 |
| $t$ | $\frac{p-1/L}{1-1/L}\in[0,1)$ | `sections/03_density.tex:64` | `03_density.tex:72-73` 的边缘验算；`MandatoryCoupling.lean`（187 行）的 `exists_mandatory_cover` | $p<1/L$ 时 $t<0$，必须走 case 1；$p\to1$ 时 $t\to1$，$R_j$ 都趋于全集，仍合法 |
| $C$（`cor:two-union`） | $50\cdot512^4=50\cdot2^{36}\approx3.44\times10^{12}$ | `sections/00_intro.tex:131` | `cor:two-union` 的 $(p/C)$-small；无 Lean 对应（`grep 512` 在 36 个文件零命中） | $512^4$ 来自姊妹篇的四轮取整，$25$ 来自其平方因子；本篇无法独立改动 |
| $k^2M$ | 阈值 | `sections/00_intro.tex:69`；Markov 步 `00_intro.tex:71` | 正选择子推论；无 Lean 对应 | 改成 $kM$ 则次可加性论证给不出严格分离 |
| $p^C$（对照项） | Hua-Song-Tudose 的密度 | `sections/00_intro.tex:82` | 仅用于对照，不被本篇消费 | 与本篇口径无关，改动不影响任何证明 |
| $\frac{p}{C\max\{1,\log\log(1/p)\}}$（对照项） | Park 的密度 | `sections/00_intro.tex:101-103` | 经 `00_intro.tex:106-107` 的常数化取整被替换成 `cor:two-union` | 若取整定理只给对数因子，`cor:two-union` 的 $C$ 不再是常数 |
| $N\ge1$ | 全文一致 | `sections/00_intro.tex:45`；`sections/03_density.tex` 无（用 `02_weights.tex:11`） | 基集 $[N]$ 有限；`Main.lean:61-62` 的 `_hN : 1 ≤ N`（未使用） | $N=0$ 时 $[N]=\varnothing$、$2^{[N]}=\{\varnothing\}$，结论平凡成立；假设只为形式统一 |

台账依赖链（改动传播顺序）。行数 $R=32$ 定幂次 $P=R/2=16$ 与下界 $2^{-R}$；$P$ 与 bin 门槛 $D=12$ 之差 $s=P-D=4$ 决定 `eq:bin-power-sum` 的衰减率，并要求 $(P-D)\cdot G>R$，即 $4\cdot64=256>32$；$G=64$ 同时是 `lem:covering` 的 $h\ge64$ 入口，于是 $\mathcal G_0$ 的阈值 $2^{-G\lvert U\rvert}$ 与引理假设 $h\ge64$ 必须同号；$B=6$ 是 $\mathcal G_0$ 的预算，$L=2^{G+B}=2^{70}$ 由这两者唯一确定；$k=RL=2^{5+70}=2^{75}$ 由 $R$ 与 $L$ 相乘确定；union bound 预算 $L/k=1/R=1/32$ 由同一乘法确定，它必须同时 $\le1/2$（喂 `prop:half-density`）与 $<1$（喂 case 2 的存在性）。在 covering 一侧，$D=12$ 定 $m=2^{12h}$，$T$ 与 $\pi$ 由平衡条件 $T=\pi m=2^{4h}$ 与配对代价 $\pi T=2^{-4h}$ 联立确定，$\pi m^2$ 的二次占优是残余项唯一的生存条件。$k$、$L$、$R$ 三者的乘法关系是这条链的收口：$k=RL$ 一旦离开 2 的幂，`DensityConstants.lean:26-27` 的 `pow_add` 证法与 `03_density.tex:47` 的 $q/L=p$ 约分要同时重写，所以链上最先暴雷的位置是 `eq:bin-power-sum`（$P-D$ 与 $G$ 的乘积）和 `eq:outright-cost`（$B$ 的预算），并非最末端的 $C=50\cdot512^4$。

## §7 Lean 取证

所有数字都是在 `E:\math\lean\` 下实测的。检索范围严格限于三处：`formalization.yaml`、`OAI/Combinatorics/DiscreteConvexity/`、`ComparatorChallenges/TalagrandDiscreteConvexity.json`。我没有读 `ComparatorChallenges/TalagrandDiscreteConvexity.lean`（挑战侧的对照陈述），因此下文对"目标签名"的判断只来自 config 的 `theorem_names` 与 solution 模块本身。

### 7.1 登记信息与规模

`formalization.yaml:1574-1576` 三条登记逐字是：`comparator_config: ComparatorChallenges/TalagrandDiscreteConvexity.json`、`declaration: OAI.TalagrandDiscreteConvexity.talagrand_discrete_convexity`、`file: OAI/Combinatorics/DiscreteConvexity/Main.lean`。书目条目在 `formalization.yaml:632-634`（第 632 行 title "Talagrand's discrete-convexity conjecture"、第 633 行 authors ["OpenAI"]、第 634 行 id 指向 `../preprints/Talagrands-discrete-convexity-conjecture-September-23-2026/paper.pdf`，条目以第 635 行 type: article 收尾）。注意登记的 id 是 PDF，而我读的是 tex 源，两侧对齐靠标题与日期。

规模实测：目录下 `find . -name "*.lean" | wc -l` 得 36 个文件；`wc -l` 合计 4259 行。最大四个文件是 `Bernoulli.lean` 299、`CoveringNumericalBounds.lean` 240、`CoveringRegularization.lean` 232、`CoveringResidualTuples.lean` 200；最小三个是 `HalfDensity.lean` 27、`DensityConstants.lean` 45、`CoveringBinomialBounds.lean` 53。

### 7.2 顶层声明逐类计数

按行首（col 0）统计：`theorem` 222、`def` 54、`noncomputable def` 15、`abbrev` 4、`structure` 1、`class` 1，合计 297 个顶层对象。带访问修饰符的另有 7 处（`private theorem` 或 `protected theorem`：`BinNumerics.lean` 4、`ColumnExpansion.lean` 1、`CoveringRegularization.lean` 1、`MandatoryCoupling.lean` 1）。没有 `lemma`、`proposition`、`corollary`、`example`、`instance`、`inductive`、`mutual` 这些关键字的行首命中，即机器侧统一用 `theorem` 承担论文里 theorem/lemma/proposition/corollary 四个层级。唯一的 `structure` 是 `FiniteProbability.lean:26` 的 `FiniteLaw (Ω) [Fintype Ω]`，字段是 `weight : Ω → ℝ`、`nonneg : ∀ ω, 0 ≤ weight ω`、`total : ∑ ω, weight ω = 1`；唯一的 `class` 命中在 `Bernoulli.lean` 里属于类型类声明。命名空间分布：`namespace OAI` 36 次（每文件一次）、`TalagrandDiscreteConvexity` 22 次、`TalagrandDiscreteConvexity.Covering` 9 次、`.FiniteLaw` 3 次、`.FiniteFibers` 1 次、`.Covering.NumericalBounds` 1 次。

导入规模：`^import` 行共 137 条，其中指向 Mathlib 的去重后 35 条模块，指向 `OAI.*` 内部 56 条。`classical` 出现 87 次、`noncomputable` 30 次、显式 `by` 约 101 处。

### 7.3 sorry、admit、本地 axiom、#print axioms

实测：`grep -c sorry` 在 36 个文件里总和为 0；`admit` 全文只有 1 处命中，位于 `FiniteProbability.lean:15` 的模块 docstring "All probabilities and expectations are finite real sums. Finite laws admit elementary probability inequalities..."，是英文单词 admit，不是 tactic。本地 `axiom` 声明 0 处（`grep -n axiom *.lean` 在 Lean 关键字意义上零命中，docstring 里也没有）。`#print axioms` 0 处，即这个目录内部没有自证公理依赖的输出，公理口径由外部 config 声明。

唯一的公理许可在 `ComparatorChallenges/TalagrandDiscreteConvexity.json`：`permitted_axioms` 是 `["propext", "Quot.sound", "Classical.choice"]`，即 Mathlib 的标准三件，没有 `sorryAx`，也没有任何自定义公理的余地。同文件里 `theorem_names` 只有一条 `OAI.TalagrandDiscreteConvexity.talagrand_discrete_convexity`，`definition_names` 是空数组 `[]`，`enable_nanoda: false`。这两点合起来说明：机器口径下被验收的只有一个定理，`cor:two-union`（依赖 Li、Park 与姊妹篇的三条外部结果）没有被形式化，因此也不需要进 `theorem_names`；`definition_names` 为空说明 `Small`、`exceptional`、`familyMeasure` 这些建模定义不进入对照签名（对照只比 theorem 的类型）。

### 7.4 tactic 词频前十

在同一批文件上按 token 计数（统计口径：正则匹配这些词元出现的总次数，含出现在证明项与 `by` 之后的位置，因此 `exact`、`have`、`intro`、`apply`、`rw`、`simp` 这类既可作 tactic 又可作项构造器的词会略有高估，`refine`、`omega`、`norm_num` 这类专属 tactic 词准确）：

| 名次 | tactic | 实测次数 |
| --- | --- | --- |
| 1 | `have` | 218 |
| 2 | `simp` | 210 |
| 3 | `exact` | 187 |
| 4 | `rw` | 146 |
| 5 | `intro` | 117 |
| 6 | `apply` | 94 |
| 7 | `calc` | 75 |
| 8 | `simpa` | 62 |
| 9 | `norm_num` | 58 |
| 10 | `ext` | 45 |

第 11 到 20 名依次是 `trans` 35、`obtain` 34、`decide` 29、`congr` 27、`omega` 19、`ring` 18、`refine` 18、`positivity` 14、`linarith` 11、`show` 10。读法：`calc` 75 次配合 `trans` 35 次，说明这套证明的主体是"不等式链"，与 tex 里成片的 `aligned` 不等式一一对应；`norm_num` 与 `decide` 合计 87 次承担全部数值验证；`omega` 19 次专吃线性整数不等式（`WeightedCover.lean:44` 里 `(by omega)` 直接把 $1\le r$ 与 $r\le h$ 从 $h\ge64r$ 推出来）；`simp` 210 次是最大的人工成本来源，也是这类组合证明里最常见的哑火点。

### 7.5 核心问题其一：$k$ 是给出具体数值还是存在式 witness

给出具体数值。`Main.lean:24-25` 的陈述是

```
theorem original_density_small (p : ℝ) (hp0 : 0 < p) (hp1 : p < 1)
    (D : Family α) (hD : 1 - 1 / (2 : ℝ) ^ 75 ≤ familyMeasure p D) :
    Small p (exceptional ((2 : ℕ) ^ 75) D) := by
```

即 $k$ 是字面量 `(2 : ℕ) ^ 75`（自然数侧，喂给 `exceptional` 的元组长度）与 `(2 : ℝ) ^ 75`（实数侧，喂给假设）两个副本，不存在 `∃ k` 形式。我在 36 个文件里搜 `∃ k`、`Exists` 与 k 的组合，零命中。对外定理 `Main.lean:61-65` 同样把 `(2 : ℕ) ^ 75` 写死。

数值的消费链条有四处，都在 `Main.lean`：（1）`Main.lean:26` 先 `let L : ℕ := 2 ^ 70`；（2）`Main.lean:32` 用 `density_tuple_count`（`DensityConstants.lean:26-27`）拿到 `hcount : 32 * L = (2 : ℕ) ^ 75`；（3）`Main.lean:33-35` 用 `density_tuple_count_real`（`DensityConstants.lean:29-32`）把假设里的 `(2:ℝ)^75` 重写回 `32 * (2:ℝ)^70`，从而把 `hD` 转成 `1 - 1/(32*(L:ℝ)) ≤ familyMeasure p D`；（4）`Main.lean:50` 与 `:57` 两次 `rw [..., hcount]`，分别在 case 1 把 `exceptional (32*L) D` 与 `exceptional ((2:ℕ)^75) D` 划等、在 case 2 把空集结论搬回 $2^{75}$ 的写法。

一个值得记的口径差：`DensityConstants.lean` 的 docstring（第 13-16 行）明说 "Only the small factor `32 = 2^5` is evaluated. The number of rows and the final tuple length remain symbolic powers throughout the construction."，也就是说机器刻意把 $L=2^{70}$ 保持成 `(2:ℕ)^70` 的幂形式而不算成十进制数，只有 32 被算出来。这与 §4.3 的判断一致：$2^{75}$ 的十进制值无人关心，被关心的是它作为 $2^5\cdot2^{70}$ 的因子分解。

### 7.6 核心问题其二：$1/2$ 的总代价与"同一密度"在机器侧的表述

代价约束落在 `Model.lean:34-42`：

```
/-- Cost at the specified density, counting each generator once. -/
def cost (p : ℝ) (G : Family α) : ℝ := ∑ I ∈ G, p ^ I.card

/-- A cover supplies a contained generator for every target set. -/
def Covers (G A : Family α) : Prop := ∀ S ∈ A, ∃ I ∈ G, I ⊆ S

/-- Smallness is witnessed by an actual containment cover of cost at most one half. -/
def Small (p : ℝ) (A : Family α) : Prop :=
  ∃ G : Family α, Covers G A ∧ cost p G ≤ 1 / 2
```

三点观察。其一，`Small` 是一个 $\exists$ 命题，见证物是真正的 `Finset (Finset α)`，不是分数系数也不是测度论外层测度；`definition_names: []` 意味着对照工具不检查这个定义的内容，因此"smallness 的定义选择"完全由 solution 侧自负其责，这是机器口径与论文口径的一处隐性风险面（`[推测]` 若挑战侧原本期望分数版 smallness，这里会有不可见的偏差，而 config 无法暴露）。其二，`1 / 2` 作为实数出现在 `Model.lean:42`，`grep -c "1 / 2"` 在这 36 个文件里合计命中 103 处，分布在 `BinNumerics.lean` 30、`DyadicBins.lean` 23、`Bins.lean` 11、`WeightedCover.lean` 8、`SignedArrays.lean` 4、`ExceptionalWeightBound.lean` 3、`Main.lean` 2、`HalfDensity.lean` 1、`Model.lean` 1；同一个数在假设侧（$\mu\ge1/2$，`HalfDensity.lean:20`）与结论侧（`cost ≤ 1/2`，`Model.lean:42`）各自独立出现，与 §4.2 的两个 $1/2$ 会师的说法完全对齐。其三，`Covers G A` 里 `∃ I ∈ G, I ⊆ S` 是**有限**存在，可在构造时直接取值，这是机器能把论文的"某个抽样结果"变成 `obtain ⟨sample, hsample⟩`（`ElementaryCovering.lean:89`）的原因。

"同一密度"的表述方式最有机器味。论文里它是自然语言（`at the same density`），机器里它是类型上的同一个变量：`Main.lean:25` 的目标 `Small p (exceptional ((2 : ℕ) ^ 75) D)` 里，$p$ 同时是假设 `hD : ... familyMeasure p D` 的 $p$ 与目标 `Small p ...` 的 $p$，不存在第二个密度变量。证明里唯一一次"密度换算"是 `Main.lean:47-49`：

```
    have hquot : ((L : ℝ) * p) / (2 : ℝ) ^ 70 = p := by
      rw [← hLcast]
      exact mul_div_cancel_left₀ p hLpos.ne'
    rw [hquot, exceptional_unionFamily, hcount] at hsmall
```

也就是论文的 `Since $q/L=p$` 这句被写成一次 `mul_div_cancel_left₀` 加一次 `rw ... at hsmall`：把 `prop:half-density` 交出的 `Small (((L:ℝ)*p)/(2:ℝ)^70) ...` 就地归一化成 `Small p ...`。这个写法说明"$1/2$ 代价"与"同一密度"两条约束在机器里由两个不同的机制守护，前者是 `Model.lean:42` 的字面 `1 / 2`，后者是"$p$ 只允许出现一次"的变量绑定。

### 7.7 核心问题其三：有限性与"任意族"

机器把基集限成有限类型。`Model.lean:20` 是 `abbrev Family (α : Type*) := Finset (Finset α)`，即族是有限集合的有限子集族；每个使用它的定理都带 `[Fintype α] [DecidableEq α]`（`grep` 到 `Fintype α` 31 处、`Fintype V` 11 处）。对外定理 `Main.lean:61-62` 把 $\alpha$ 实例化为 `Fin N`：

```
theorem talagrand_discrete_convexity (N : ℕ) (_hN : 1 ≤ N)
    (p : ℝ) (hp0 : 0 < p) (hp1 : p < 1) (D : Family (Fin N))
```

所以论文的 $[N]=\{1,\ldots,N\}$ 对应 `Fin N`，$N$ 是任意自然数但每一步都在有限类型上。无限情形完全没有被处理，也不需要：定理对每个 $N$ 一致成立，$k$ 与 $N$ 无关，所以 $\mathbb N$ 上的版本可由紧致性/逐坐标投影导出，但目录内没有任何这类论证（`grep` 无 `MeasureTheory`、无 `filter`/`ultrafilter`、无 `TopologicalSpace`）。

一个关键的工程选择：整套概率是自建的四行结构 `FiniteLaw`（`FiniteProbability.lean:26-29`）加有限实和的 `expectation`（`FiniteProbability.lean:33-34`）与 `prob`（`:36-38`），完全绕开 Mathlib 的测度论。收益是 `expectation_add`、`expectation_const`、`Finset.sum_lt_sum` 这类初等引理就够用（`FiniteProbability.lean:45-59`），代价是每处求和交换都要自己证。`ProbabilisticExistence.lean:28-42` 的 `exists_le_expectation` 是论文的 "some outcome has cost at most its expectation"（`01_covering.tex:182-184`）的机器替身，证明只用 `Finset.sum_lt_sum` 和一个正权重点 `exists_weight_pos`（`ProbabilisticExistence.lean:19-26`），26 行搞定，说明这个概率骨架刻意做得极薄。

"任意族"在机器侧对应两件事：`Family` 没有任何单调性字段，以及 `exceptional`（`Model.lean:54-58`）直接从 `Finset.univ` 全体 $S$ 里 filter 出"不被任何 $k$ 元组覆盖"的那些。我按 `Monotone`、`UpSet`、`downset`、`shifting`、`compression`、`round`、`fractional` 七个词在 36 个文件里 grep，全部零命中；`familyIndicator`（`Model.lean:64-66`）与它的三条性质 `familyIndicator_nonneg`、`familyIndicator_le_one`、`familyIndicator_sq`（`Basic.lean:177-190`）是 $f$ 的全部已知信息，正与 §4.5 "只用值域性质"的判断一致。重分组同构被形式化成一般乘法：`UnionTuples.lean:75-78` 的 `exceptional_unionFamily (a b : ℕ) (D : Family α) : exceptional a (unionFamily b D) = exceptional (a * b) D`，`Main.lean:50` 用它把 $E_{32}(\mathcal F)$ 变成 $E_{32L}(\mathcal D)$。case 2 的机器形态是 `MandatoryCoupling.lean:167-171` 的 `exists_mandatory_cover`，结论 `∃ rows : Fin L → Finset α, (∀ j, rows j ∈ D) ∧ unionTuple rows = Finset.univ`，前提里显式带着 `hL : 1 < L`、`hLp : 1 ≤ (L:ℝ)*p` 与 `(L:ℝ)*(1 - familyMeasure p D) < 1`，正是 §5.1(c) 说的两条不等式约束的机器落点。

### 7.8 核心问题其四：三节的行数分布与主战场

按论文三节的语义把 36 个文件归组（口径 A，与 §7.1 的分组一致）：

| 组 | 文件数 | 行数 | 对应 tex 节 | tex 行数 | 扩张比 |
| --- | --- | --- | --- | --- | --- |
| covering | 11 | 1370 | `01_covering.tex` | 185 | 7.4 |
| weights | 14 | 1324 | `02_weights.tex` | 208 | 6.4 |
| density | 8 | 1104 | `03_density.tex` | 84 | 13.1 |
| 建模与概率基础设施 | 3 | 461 | `00_intro.tex` 的定义段 | 173 | 2.7 |

口径 A 的明细：covering 组是 9 个 `Covering*.lean` 加 `ElementaryCovering.lean`、`ProbabilisticExistence.lean`；weights 组是 3 个 `Fourier*.lean` 加 `SignedArrays`、`ColumnExpansion`、`ExceptionalWeightBound`、`DyadicBins`、`Bins`、`BinNumerics`、`WeightedCover`、`HalfDensity`、`FiniteParseval`、`FiniteFibers`、`CoordinateObservations`；density 组是 `LabelCoupling`、`MandatoryCoupling`、`DensityConstants`、`UnionBound`、`ProductProbability`、`Bernoulli`、`UnionTuples`、`Main`；基础设施是 `Model`、`Basic`、`FiniteProbability`。四组行数相加 4259，与 `wc -l` 总数吻合，文件数相加 36。

换一种更保守的口径 B（把 `Bernoulli`、`ProductProbability`、`FiniteProbability`、`ProbabilisticExistence`、`CoordinateObservations` 这 5 个 774 行全部算作共享基础设施，covering 只留 10 个文件 1313 行，weights 只留 13 个文件 1243 行，density 只留 `LabelCoupling`、`MandatoryCoupling`、`DensityConstants`、`Main`、`UnionBound`、`UnionTuples` 这 6 个文件 663 行，`Model` 加 `Basic` 266 行），两种口径的总和都是 4259、文件数都是 36，差别只在共享层的归属。

主战场判断：按行数，covering 组（1370，占 32.2%）最大，其中 `CoveringNumericalBounds.lean` 240 行与 `CoveringRegularization.lean` 232 行两个文件就占全目录的 11.1%，前者把 `01_covering.tex:156-168` 那一段纸面不等式链拆成 `m`、`T`、`p`、`A` 四个定义（`CoveringNumericalBounds.lean:11-20`）加十几条数值引理，后者是论文里"正则边"概念的机器放大。按每行 tex 的成本，density 组最贵（扩张比 13.1），因为 `03_density.tex` 只有 84 行却要用机器验算两套耦合的边缘分布：`LabelCoupling.lean`（171 行）证 `familyMeasure_unionFamily_label_lower`（`:151-154`），`MandatoryCoupling.lean`（187 行）证 `exists_mandatory_cover`，加上 `Bernoulli.lean` 299 行与 `ProductProbability.lean` 142 行提供逐坐标乘积律的机器化。结论是：covering 是**体积**上的主战场，density 是**单位成本**上的主战场，而 weights 组的 1324 行里最关键的 `WeightedCover.lean`（94 行）与 `HalfDensity.lean`（27 行）都薄，说明签名恒等式的数学难度没有转化成机器难度，转化成机器难度的是它下游的 bin 算术（`DyadicBins` 95、`Bins` 167、`BinNumerics` 178，共 440 行）。

## §8 外部文献检索

本节全部是我在本机之外检索到的东西，与论文自身的证明口径物理分栏：论文写了什么一律给 `build/source/` 下的行号，我核实到什么就标检索强度，两边不混。强度分三档：`一手已核`（从索引站或出版社的元数据页直接抓到的字段）、`二手`（新闻、博客、聚合站转述）、`抓取失败`（HTTP 303/403、JS 空页、fetch 报错）。工具层面有两条硬约束影响下面的覆盖面：检索串被限制在 100 字符内，所以我只好用短专名式查询；付费墙页面与靠 JS 渲染的摘要页基本抓不下来。

### 8.1 先固定"论文声称的出处"，再去核"我查到的出处"

`references.tex` 一共 84 行、12 条 bibitem，其中与出处判定直接相关的三条是：`Talagrand10`（`:69-74`，STOC 2010 论文，页码 13-36，DOI 10.1145/1806689.1806693）、`Talagrand21`（`:76-82`，2021 第二版专著，声称属于 Ergebnisse 3. Folge 第 60 卷，DOI 10.1007/978-3-030-82595-9）、`ParkPham24`（`:62-67`，Annals 199 (2024) no.3, 1293-1321）。剩下的 `Li26`、`Park26`、`AscoliEtAl26`、`HuaSongTudose26`、`FischerPerson25`、`OpenAIThreshold26` 是 2025-2026 的并行工作，`Friedgut08`、`EllisFilmusFriedgut12`、`ODonnell14` 是技术源流。

论文对口径的四句自述，位置分别是：`00_intro.tex:35-38` "Talagrand formulated the discrete-convexity conjecture in [Talagrand10, Conjecture 7.1]"；`00_intro.tex:38-40` "The same original-density formulation appears as Research Problem 13.3.2 in [Talagrand21], whose Proposition 13.3.3 explains its connection to positive selector processes"；`00_intro.tex:28-34` 高斯原型引 `[Talagrand10, Conjecture 2.1]`；`00_intro.tex:94-95` 分数松弛引 `[Talagrand10, Sections 6 and 7]`。这四句合起来已经把出处钉死在 STOC 2010 一篇里，四个不同的编号（Conj. 2.1、Conj. 7.1、Sec. 6-7、Sec. 7）都指向同一篇 STOC 2010 的会议论文。

### 8.2 离散凸性猜想的一手出处：STOC 2010

我的核法：直接向 Semantic Scholar 的 graph API 查题名。返回字段（`一手已核`）：title "Are many small sets explicitly small?"、year 2010、venue "Symposium on the Theory of Computing"、externalIds 里 DOI `10.1145/1806689.1806693`、DBLP `conf/stoc/Talagrand10`、MAG `2081780258`、CorpusId `953713`、abstract 为 null。题名、年份、会议、DOI 四项与 `references.tex:69-74` 逐字对得上，页码 13-36 对不上手（下面那条失败）。

失败记录：ACM Digital Library 的 DOI 页返回 HTTP 403（`抓取失败`），所以"页码 13-36"与"Conjecture 7.1 的确切文本"我都没有一手验证，只能按论文的 bibitem 与 inline 引用采信。索引站的 abstract 是 null，意味着连摘要级的自证都拿不到。

`[推测]` 猜想本体在 STOC 2010 的 Section 7 里，同一篇的 Section 6 是分数松弛、Section 2 是高斯问题、Section 7 另含选择子过程。这个"一篇四个部位"的分布是我从本篇的四处引用编号反推的，没读过原文，属于可推翻的重建。

### 8.3 "Selecta 2020 前后"这一先验假设：负结果

派单给我的先验假设是出处在 Selecta 2020 前后。我按这个假设做了三轮检索，结论是没找到支持它的任何一手材料，需要更正为先验假设本身有偏。

- 查 `"Selecta Mathematica" Talagrand 2020 discrete convexity`（`检索强度：中，负结果`）：命中全是中文科普转载，toutiao 两条（2026-05-26、2026-05-29，同题"悬赏三十年不能解开的数学难题，被三位数学家证明了"）、科学网博客（2026-05-25）、知乎/36kr/jandan 若干，没有一条指向 Selecta Mathematica 的卷期页。
- 查 2024 年 Abel 奖的评述长文 arXiv:2410.07945 "Talagrand's mathematical journey to the Abel Prize 2024"（`一手已核（抓到了正文）`）：正文里没有 discrete convexity、没有 expectation threshold、也没有任何 2020 年前后的 Selecta 条目。这条是决定性的负证据：一个专门梳理他工作全貌的长文都没把离散凸性猜想归到 Selecta。局限也要记：我抓的是 arXiv 的 html 正文，参考文献列表与脚注可能不全。
- `formalization.yaml:632-634` 的书目登记只写了 authors ["OpenAI"] 与预印本目录名，没有任何上游猜想出处字段，机器侧也无法佐证 Selecta 假设。

`[推测]` 若真存在 2020 前后的"Selecta 重述"，最可能的形态是把 STOC 2010 的 Conjecture 7.1 或 2021 专著的 Research Problem 13.3.2 收进某卷 selected papers，表述不会变；把它当作猜想的原始出处会是错的，原始出处按 8.2 记 STOC 2010。我倾向于在笔记里从此用"STOC 2010 提出 / 2021 专著重新列为开放研究问题"这个双时点表述。

### 8.4 2021 专著这一载体：卷次没能一手核对

Springer 的图书 DOI 页 `10.1007/978-3-030-82595-9` 返回 HTTP 303 未跟随（`抓取失败`），所以 Ergebnisse 3. Folge 第 60 卷这一声称我没有一手验证。可用的替代：MacTutor 的 Talagrand 书目页（`一手已核（数学家传记站书目）`）确认 "Upper and lower bounds for stochastic processes: Decomposition Theorems" 2021 年是 2014 年那本的完全重写第二版，但它没有给丛书与卷号。

这条检索对本篇的技术结论没有影响，对我理解"口径"有用：`00_intro.tex:38-40` 强调"同样的原始密度表述"出现在 RP 13.3.2，等于承认 2021 书里的表述与 STOC 2010 的 Conj. 7.1 等价；本篇选 `thm:main` 的形式（$k$ 个成员之并、异常族 $p$-small）走的是"原始密度"这一支，并非 `AscoliEtAl26` 的 $k$-threshold 那一支。

### 8.5 高斯原型与其在 2026 年 5 月的解决：与本篇并行的两支

- Hua, Song, Tudose, arXiv:2605.10908，v1 提交 2026-05-11、v2 修订 2026-07-10，分类 math.PR/math.CO/math.MG（`一手已核（arXiv 摘要页）`）：摘要称 $n$ 维标准高斯型的凸序分解把任意 1-subgaussian 随机向量写成固定三个高斯分量之和，由此解决 Talagrand 的凸性问题，并给出组合侧的平行结论。这与 `00_intro.tex:79-82` 自述的"三个并、覆盖密度 $p^C$"完全对得上，包括"三支"这个数目。
- Scientific American 报道 2026-05-19 "'Sensational' proof topples decades-old geometry problem"（`二手`）：给出证明者三人姓名、Talagrand 本人引语 "The proper word is 'sensational.'"、Tudose 引语称 AI 对此改变不大；报道说该猜想提出于 1995 年，但没给刊物或会议名。
- 科学网博客转载 2026-05-25（`二手`）：同样写"1995 年提出"，同样无出处。这两条与 8.2 的 STOC 2010 冲突，我的处理是：1995 指的是高斯/凸距离那一支的酝酿期（见 8.8 的 Talagrand 自述与 IHÉS 1995），2010 是离散凸性猜想的正式提出，新闻报道把两支压成了一支。
- Ascoli, He, Park, Talagrand, arXiv:2608.11183，提交 2026-08-11，22 页，math.CO/math.PR（`一手已核（arXiv 摘要页）`）：定义 $k$-thresholds 并证明其与离散凸性猜想一致，扩张族的阈值与期望阈值成比例，若干图包含性质给出确定阈值（特定的 spanning 情形是 $k=2$），并推广到低退化性网络性质。
- Li, arXiv:2609.08967 "On $p$-spread measures"，提交 2026-09-08，math.CO/math.PR（`一手已核（arXiv 摘要页）`）：大 Bernoulli-$p$ 族会阻止 spread 测度支撑到未覆盖的并上，解决分数凸性之问，并导出一个耦合框架；与 `00_intro.tex:96-98`、`124-126` 的引用位置一致。

时间线（全部是我实测到的日期）：2026-05-11 高斯支解决 → 2026-08-11 $k$-threshold 重述 → 2026-09-08 Li 的 p-spread → 2026-09-23 本篇与姊妹篇同日放出。`[推测]` 本篇 weights 节把 Li 的两行核推到 32 行（`02_weights.tex:88-97` 的三处溯源），距 Li 的预印本只有 15 天，说明 32 这个行数带工程成分，属于"当时能拿到的最强核"的产物，并非被某个下限定死的数；这与 §6 台账里 $R$ 那行的可替换性判断一致。

### 8.6 分数/期望阈值那条链：`cor:two-union` 的外部支撑

- Fischer 与 Person, arXiv:2505.21782 "Further remarks on fractional vs. expectation thresholds"，提交 2025-05-27（`一手已核（arXiv 摘要页）`）：摘要里明确写 "A conjecture of Talagrand (2010) states that the so-called expectation and fractional expectation thresholds are within at most some constant factor from each other"，并说方法是推广 DeMarco 与 Kahn 的一个做法。这是我在本轮检索里拿到的第二处把年份钉在 2010 的独立证据，与 8.2 相互加强，也与 8.5 里新闻报道的 1995 相互抵消。
- Park, arXiv:2609.14681（`二手`，只来自 `references.tex:55-60` 的书目转述，本轮没抓到摘要页）：题名给的正是"dimension-free comparison"，与 `00_intro.tex:99-105` 引用的带 $\log\log$ 密度那条推论对应。
- OpenAI 姊妹篇（`references.tex:48-53`）：只有一条 GitHub preprint 路径 `OpenAI:Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026`，无 DOI、无索引（`无法核实：非索引文本`）。`cor:two-union` 证明里 `00_intro.tex:129-131` 用的分母 $25\cdot512^4$ 与最终 $C=50\cdot512^4$ 完全依赖这篇，我手上没有它，所以 §5.6(c) 里那两个因子的来源我只能标成"按论文自述"。
- Park 与 Pham 的 Annals 文章（`一手已核（期刊目录页）`）：Annals of Mathematics 199 (2024) no. 3 的目录里确有 "On a conjecture of Talagrand on selector processes and a consequence on positive empirical processes"，页码 1293-1321，与 `references.tex:62-67` 的题名、卷期、页码逐字一致。这条核验的意义在 §5.1(d) 与 §5.8：`00_intro.tex:57-77` 那段正选择子推论确实是在"recover"一个已发表于 Annals 的结论（`[Theorem 1.2]`），属于可交叉验证的外部事实。

### 8.7 组合优化里的"离散凸性"对应物：同名不同物

派单要求核对离散凸性在组合优化里的对应物。我的检索结果如下。

- 唯一拿到的一手抓手：Hiroshi Hirai（名古屋大学）个人主页（`一手已核（作者主页）`）列出的研究领域是 "Algorithm, Optimization, Discrete Mathematics"，并列出综述 "Discrete Convex Functions on Graphs and Their Algorithmic Applications"，作者 H. Hirai，Springer，Singapore，2017。这本书的题名恰好说明该领域的"离散凸函数"是定义在图上/格上的整数函数。
- 抓取失败两处：SIAM 的 Murota 专著页 `10.1137/1.9780898719821` 返回 HTTP 403；英文维基 "Discrete convex analysis" 两次 fetch 直接报网络错误。
- 二手命中：中文聚合站（CNKI 学位论文库 `10183-1015730435`、百度学术同名条目 `离散M-/L-凸函数的性质及其应用`）确实存在"离散 M-/L-凸函数"主题（`二手`），另有 ebiotrade 转载的"关于离散凸性的更多探讨"（2026-02-23，`二手`），后者是新闻级文本，没有定义。
- `[推测]` 该领域的标准起点是 Murota 1998 年在 Mathematical Programming 上的 M-convex 与 L-convex 两篇论文，加 2003 年 SIAM 专著 "Discrete Convex Analysis"。本轮我没能拿到其中任何一份一手页，所以这一条只作背景标注，绝不用作笔记任何结论的依据。

结论与它的用处：组合优化意义上的 discrete convexity 处理 $f:\mathbb Z^{n}\to\mathbb R\cup\{+\infty\}$ 的交换性公理（M-凸的 exchange、L-凸的平移子模性），对象是整数格上的函数；Talagrand 的 discrete convexity 处理 $\{0,1\}^{N}$ 上集合族的"并替代和、包含覆盖替代凸包"（`00_intro.tex:33-34` 原话就是 unions replace sums），对象是集合族。两者只共享形容词。我第一次给这道题归类时正是被这个共享形容词骗进了"凸松弛加取整"的直觉（见 §1.1 与 §2.3），这一栏的检索就是给那条失败路线补的验尸报告。

### 8.8 与 Talagrand 凸性距离、乘积测度 Concentration 的关系

- 一手已核：numdam 条目 `PMIHES_1995__81__73_0` 给出 Michel Talagrand, "Concentration of measure and isoperimetric inequalities in product spaces", Publications Mathématiques de l'IHÉS, volume 81, 1995, pages 73-205。页面上只有书目字段与引用导出，无摘要（`一手已核（元数据）`，内容层未核）。
- 抓取失败：英文维基 "Talagrand's concentration inequality" 两次 fetch 失败（编码与非编码标题各一次），所以凸距离 $d_T$ 的定义式与 $\mathbb P(A)\mathbb P\{\dots\}$ 形式的乘积界我没能一手核对。`[推测]` 其形状是对坐标子集族 $\mathcal A=\{A_1,\dots,A_m\}$ 取 $d_T(A,x)=\min_{\alpha}\max_{i}\alpha_i$ 型的偏差，具体记法以我读到的任何一手文本为准，本轮没有。
- 抓取失败：Semantic Scholar 上 "On Talagrand's deviation inequalities for product measures" 的记录页返回空白（JS 渲染），同一 API 又给出 HTTP 429，该文期刊卷年未核。
- 一手已核（访谈正文）：EMS Magazine 的 2024 Abel 访谈（`euromathsoc.org/magazine/articles/212`）里 Talagrand 自述方法源头是 Choquet 的两句话 "take a convex hull" 与 "consider products"，再与 Milman 的几何视野合流，落点就是独立随机变量子集上的凸化不等式；同一访谈还提到他在 2011 年自费悬赏 5000 美元征求一个 Bernoulli 过程问题的解答。访谈正文未提 STOC 2010 那篇文章，也未提离散凸性猜想。
- 我的关系判断（标注为我的读法，`[推测]`）：凸距离不等式的功能是把"小概率"换成"由坐标证书控制的大偏差"，本篇 $c_p(\mathcal G)\le1/2$ 的覆盖正是同一种证书结构在凸化一侧的版本；桥就是 `00_intro.tex:25-26` 那句 "Since $\mu_p\{S:I\subseteq S\}=p^{|I|}$, such a cover witnesses $\mu_p(\mathcal A)\le1/2$ by a union bound"，它把覆盖的代价直接读成乘积测度的上界。往回看，STOC 2010 的标题 "Are many small sets explicitly small?" 问的就是证书是否存在，而本篇的 `thm:main` 给的是"高概率族的异常部分确有显式证书"。这条链与我 8.5 里的 $k$-threshold 重述、8.6 里的期望阈值比较是同一问题的三种语言。
- 顺带一条口径提醒：`00_intro.tex:28-30` 说名称来自 Gaussian convexity question，这与我检索到的 1995 年那条乘积测度 concentration 主线是高斯支的两个分支；新闻报道把它们压成"一个 1995 年的猜想"（见 8.5），论文自己把两支分开引用（Conj. 2.1 与 Conj. 7.1），后者是我采信的依据。

### 8.9 检索强度汇总

| 条目 | 我实际拿到的字段 | 强度 | 与论文口径的关系 |
| --- | --- | --- | --- |
| Talagrand, STOC 2010 | 题名、年份、会议、DOI、DBLP、MAG、CorpusId，abstract 为空 | 一手已核 | 支持 `references.tex:69-74` 与 `00_intro.tex:35-38`；页码 13-36 未核 |
| Talagrand, 2021 专著（RP 13.3.2 载体） | MacTutor 确认第二版、完全重写、2021 年；丛书卷号未取 | 一手已核（书目）+ 抓取失败（Springer 303） | 未能核验 `references.tex:80-81` 的 Ergebnisse 60 卷声称 |
| Park-Pham, Annals 199 (2024) | 期刊目录页有题名、卷期、页码 1293-1321 | 一手已核 | 与 `references.tex:62-67` 逐字一致 |
| Fischer-Person, arXiv:2505.21782 | 摘要、提交日 2025-05-27 | 一手已核 | 独立佐证"猜想出自 2010" |
| Hua-Song-Tudose, arXiv:2605.10908 | 摘要、v1/v2 日期、三个分类 | 一手已核 | 与 `00_intro.tex:79-82` 的三并、$p^{C}$ 一致 |
| Ascoli-He-Park-Talagrand, arXiv:2608.11183 | 摘要、提交日 2026-08-11、22 页 | 一手已核 | 与 `references.tex:3-8`、`00_intro.tex:83-85` 一致 |
| Li, arXiv:2609.08967 | 摘要、提交日 2026-09-08 | 一手已核 | 与 `00_intro.tex:96-98`、`124-126` 一致 |
| OpenAI 姊妹篇 | 无 | 无法核实（非索引文本） | `cor:two-union` 的 $25\cdot512^4$ 只能按论文自述 |
| Park, arXiv:2609.14681 | 仅书目题名 | 二手 | 支撑 `00_intro.tex:99-105` 的 $\log\log$ 密度 |
| Talagrand, IHÉS 81 (1995) | 题名、期刊、卷、页码 73-205 | 一手已核（元数据） | 论文未引，属外部背景 |
| 凸距离不等式定义式 | 无 | 抓取失败（维基两次、S2 空页与 429） | 只作 `[推测]` 背景 |
| Murota 的 DCA | Hirai 2017 综述条目；SIAM 403、维基 fetch 失败 | 一手已核（作者主页）+ 抓取失败 | 用于 §2.3 失败路线的验尸 |
| Selecta 2020 前后的重述 | 无一手命中；Abel 评述长文亦无相关条目 | 负结果 | 与派单先验假设冲突，按 8.3 更正 |
| 新闻报道（SciAm 2026-05-19、科学网 2026-05-25） | "1995 年提出"、Talagrand 与 Tudose 引语 | 二手 | 与 8.2 冲突，已在 8.5 处理 |

## §9 未决问题与下次接手清单

留在这里的是我读完 tex 与 Lean 之后仍然没有答案的东西，按"能否用一次机器实验回答"排序。

1. $k=2^{75}$ 的可降空间。纸面链条给的余量很大：`02_weights.tex:191` 的总代价是 $\frac1{64}+\frac{6}{2^{64}-1}\approx2^{-6}$，离 $\frac12$ 差 32 倍；`02_weights.tex:203` 的 $\frac{16}{15(2^{256}-1)}$ 离 $2^{-32}$ 也有量级余量。把这些余量一起吃掉大概能降到 $2^{50}$ 附近，$R$ 甚至可能压到 26（`02_weights.tex:74` 的幂次只需 $P>12$）。这纯粹是常数优化，`eq:signed-identity` 的结构不变。机器实验的形态很明确：把 `DensityConstants.lean` 与 `CoveringNumericalBounds.lean` 的常数参数化，看哪些 `norm_num` 在什么下界开始失败。
2. `cor:two-union` 未被形式化。`TalagrandDiscreteConvexity.json` 的 `theorem_names` 只有一条，且 `grep` 在整个目录里对 `512`、`fractional`、`round` 零命中。要把姊妹篇的常数因子取整定理接进来，需要先有分数覆盖的对象（`Model.lean` 里根本没有 $a_I$ 这族系数），工作量估计在一节以上。
3. `definition_names` 为空的风险。比较器只裁决 `talagrand_discrete_convexity` 的命题本体，`Small`、`Covers`、`cost`、`exceptional` 这四个定义与论文 `00_intro.tex:17-24` 的符合度不在机检范围内。`Model.lean:38` 把 `Covers G A` 写成 `∀ S ∈ A, ∃ I ∈ G, I ⊆ S`，与论文"every $S\in\mathcal A$ contains some $I\in\mathcal G$"方向一致；但 `cost` 用了 `p ^ I.card`（`:35`），论文写的是 $\rho^{|I|}$，两侧只在 `Small` 里把参数取成 $p$ 时才同义。这类"定义漂移"目前靠人工读，没有机检兜底。
4. 无限情形完全缺失。Lean 侧 `Family α := Finset (Finset α)` 加 `[Fintype α]`，实例化在 `Fin N`；论文 $N$ 任意但有限，两侧口径其实一致（`00_intro.tex:45` 就是 "every integer $N\ge1$"），只是论文里没有任何超限或紧致性论证可形式化。要真做到"任意基集"，需要 `MeasureTheory` 上的乘积测度与有限逼近，而目前整套概率层是自建 `FiniteLaw`（`FiniteProbability.lean:26-29`）的实数和，`total : ∑ ω, weight ω = 1` 这种写法本身就拒绝了无限坐标。
5. 两条耦合的分界在 $Lp=1$ 处是否可合并。case 1 要 $1-Lp\ge0$（`03_density.tex:27`），case 2 要 $1\le Lp$（`Main.lean:54` 附近用的是 $(L: \mathbb R)\cdot(1-\mu)<1$ 的预算形式）。论文在 `03_density.tex:83` 用"两种情形覆盖全部"收尾，`Main.lean` 里则是 `lt_or_ge` 的二分。`_hN : 1 ≤ N` 这个假设在 `Main.lean:61-62` 被声明成 unused（前缀下划线），说明连 $N=0$ 的边角都不需要处理，这是机器侧比纸面更省的地方。
6. `h ≥ 64` 与 `G = 64` 是否必须同号。§6 台账里我指出两者共用 64；机器侧 `ElementaryCovering.lean:25` 写死 `64 ≤ h`，`Bins.lean` 与 `BinNumerics.lean` 里的几何和也写死 $2^{64}-1$。若把 $G$ 改成 8，`lem:covering` 的 $h$ 下界要不要跟着降、$L=2^{G+B}$ 会缩到 $2^{14}$、$k$ 变 $2^{19}$，这条链能不能整体重跑，是一个干净的实验。
7. 签名恒等式的机器难度评估可能有偏。我实测 `WeightedCover.lean` 94 行、`HalfDensity.lean` 27 行，`ExceptionalWeightBound.lean` 也只是把 `b U ^ 32 = (b U ^ 2) ^ 16` 与 `sq_nonneg` 串起来，看起来数学上最硬的一步在机器上最便宜。反过来说：正因为便宜，签名法在 Lean 里几乎没有护栏，任何改动 $R$ 的尝试都会先在 `pow` 的奇偶拆分上崩，并非在数值上崩。这个不对称是我这轮最意外的读数。
8. 同族论文互为非输入。姊妹篇（`OpenAIThreshold26`）与 `Li26`、`AscoliEtAl26`、`Park26`、`HuaSongTudose26` 各是独立预印本，本笔记只用它们的公开摘要与书目字段，没有把它们的正文当作本篇证明的一环；`cor:two-union` 的推导（§5.6）里凡涉及它们的步骤都已显式标为"按论文自述"。
