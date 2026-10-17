# D102 度量 k-median 的单指数恢复与有界价格严格性：精确预算算法的反推笔记

## 0. 这份笔记的边界条件与读法约定

队列行号 114。论文目录 E:\math\preprints\Single-Exponential-Recovery-and-Bounded-Price-Strictness-for-Metric-k-Median-September-24-2026。我能读的正文素材只有 build\sections\ 下的 .tex 分片，按字节降序是 sampling.tex 31494、imports.tex 29765、completion.tex 26772、refinement.tex 17612、local.tex 16537、introduction.tex 15093；派单只点名了这六片，但我用 wc 补全后发现还有 assembly.tex 8398、strictness.tex 9736、surplus.tex 9560、preliminaries.tex 6145，共十片、171112 字节。题名 Single-exponential recovery and bounded-price strictness for metric k-median。摘要主线：对度量 k-median 给出一个精确预算恢复算法，它对"在给定 anchor 解中没有准确、可区分代理"的比较簇数目只有单指数依赖；在多项式有界直径的正整数度量上，只要总代理误差足够小、这类簇只有对数多个，就在多项式时间内得到 (1+2/e+epsilon) 近似。

Lean 侧我只被允许查三样东西：formalization.yaml 第 1258--1260 行的注册三件套（comparator_config = ComparatorChallenges/KMedianRecovery.json；declaration = OAI.MetricKMedianRecovery.global_application；file = OAI/Combinatorics/KMedianRecovery/Main.lean），书目条目在 577--579 行（只有标题和 pdf 路径，我没有也不该去读 pdf），以及模块目录本身和那个 json。查重提示说派单前的自动匹配把 D80（均值对策博弈的支撑预算递归）和 D47 标成了可能相关；我核对过，KMedianRecovery 这条注册项与 mean payoff games 没有任何结构交集，那是假阳性，本笔记不引用、不沿用任何既存笔记的措辞。

以下全部正文引用只来自 build 下 .tex；凡我用到论文外部知识的句子，都会当场标注"外部推断"。思维链是反推的：我只能从文本留下的接缝（"The normalized promise matters"、"The algorithm need not recognize this index"、"Our suffix-maximum and complementary-slack argument is an alternative self-contained proof"这类自我声明）倒推作者在哪里碰过壁。凡是倒推不出来的，我用 [推测] 起头明确降级为候选解释，不冒充实录。

## 1. 初始动机与最初猜想

### 1.1 我进场时手里的问题

度量 k-median 的目标是在 |D|+|F| 个点的有理度量里开至多 k 个设施最小化总连接成本。introduction.tex:7-12 逐字定义：

> \[
>  \operatorname{cost}(S)=\sum_{p\in D}d(p,S),\qquad
>  d(p,S)=\min_{s\in S}d(p,s),
>  \qquad
>  \operatorname{opt}_k=\min_{1\le|S|\le k}\operatorname{cost}(S).
> \]

我读这篇稿子前对领域状态的想象（外部推断，基于 Jain-Vazirani 2001、Charikar-Guha-Tardos-Shmoys 2002、Arya et al. 2004 这条经典线与 2025 年 Cohen-Addad 等 (2+epsilon) 报告的公开信息）：k-median 的近似比长期贴着 2 以下走，LP 舍入加 bi-point rounding 把 1.637 级别的结果立住了，但那条路线的技术入口是松弛解的整数间隙；而局部搜索路线天然停在 3+epsilon。一个"多项式时间、因子严格低于 2、且对任意有理度量成立"的随机化算法，如果只用组合工具（局部搜索锚定 + 采样恢复），就是我认为这篇稿子想宣称的事。

### 1.2 最初猜想的表述（后被文本纠正）

只看题名和摘要主线时，我给出的第一版猜想是三句话：

猜想 A：存在一个"anchor 恢复"原语，输入一个已知的 good 解 S，输出改善到 (1+2/e+epsilon) 倍的解，运行时间是 exp(单指数) 在某个参数上，那个参数是 k。

猜想 B："有界价格严格性"是在描述 facility location 的对偶价格有界，即每次开设施付的 lambda 有常数上限。

猜想 C："精确预算"指恢复过程输出恰好 k 个设施。

introduction.tex:17-24 一开场就把 A 的落点改了道：

> This paper develops two tools for respecting that budget.  The first
> recovers a good solution from an anchor that represents all but a small
> number of comparison clusters accurately.  Its running time is single-exponential
> in the number of exceptions, making logarithmically many exceptions
> tractable.  The second gives an elementary proof of bounded-price
> strictness for one fixed execution of a facility-opening process.

单指数依赖的对象是"例外比较簇的数目 m"，完全不是 k。这个区别不是修辞性的：introduction.tex:205-208 明确写道

> The $k^{O(k)}$ dependence in these FPT bounds does not become polynomial
> merely by setting $k=O(\log N)$.  The distinction addressed by our
> recovery theorem is the dependence on the number of bad comparison
> clusters, under its stated proxy promise.

我把这句当作对猜想 A 第一版（沿 FPT 惯例把恢复复杂度记在规模 k 上）的直接否定来接受。设 k = c log N 时 k^{O(k)} = N^{O(c log log N)}，是准多项式，并非多项式；要让"对数多个例外"真的可处理，指数里必须只剩例外数 m，即 intro 77-82 行的

>  \exp(O(M_0))\operatorname{poly}(N)\log(2/\zeta).

猜想 B 也被 intro 104-119 行的执行段改写：lambda 是"一次固定执行的正规开设施付款"，有界价格指 lambda <= T*P_C 这个比较条件（P_C 是该簇在比较解下的成本），"严格性"指在价格有界时被服务簇的预算和严格小于朴素对偶界 lambda+2P_C，改进量为 c(T)/2 乘 P_C。价格本身没有全局上界，有界的是价格相对簇成本的比值。猜想 C 的"恰好 k"同样不准：所有定理都写 |S|<=k（introduction.tex:67、145），预算是上限约束，靠"移除 m 个原设施、至多补 m 个新设施"的配对来守恒（intro 238-241 行的证明概览），补不满就留白，绝不超过。

### 1.3 为什么"代理"与"锚"是这篇的语言核心

intro 28-39 行给出全部词汇：固定比较解 O（大小 h、成本 P），客户端按最近设施分簇（C_i, P_i, 平局用固定优先序），anchor 是给定的同大小可行集 S；好中心 i 配一个两两互异的代理 phi_i 属于 S，承诺是总代理指派成本不超过 P_g + mu*P（ref:proxy-hypothesis 即 introduction.tex:59-63）：

>  \sum_{i\ \mathrm{good}}\sum_{p\in C_i}d(p,\phi_i)
>  \le P_g+\mu P,
>  \qquad m:=|\{i:i\ \mathrm{bad}\}|\le L_0\log N.

摘要里的"准确、可区分的代理"就拆成这两半：准确 = 代理指派只比簇内最优贵 mu*P；可区分 = 代理两两互异、由局部搜索的球几何保证（见第 3 节 anchoring）。坏簇定义成"没有这样的代理"的簇，其数目 m 正是单指数依赖的参数。

## 2. 我先走错的三条路线（按文本接缝反推）

### 2.1 错路一：把恢复复杂度记在 k 上，照抄 FPT 的 k^{O(k)}

外部推断：CGKLL2019 那类 FPT 恢复用 leader 采样 + 球的枚举，球的候选半径对每个簇单独枚举，得到 k^{O(k)}。反推失败原因：若算法真正枚举的半径菜单对 h 个簇逐一展开，每个簇 O(log(N)) 个菜单档，菜单选择数就是 (log N)^h = exp(O(k log log N))；即使 h=O(log N) 也超出多项式。文本给出的解法在 intro 224-227："A population radius... Large menu indices can occur only at disjoint client sets whose total comparison cost pays for them. Their total probability loss is thus exp(-O(m))"。也就是半径菜单不再逐簇枚举，改为一个由总成本决定的"群体半径"，高档半径只可能落在两两不交的客户端集合上，而这些集合的比较成本总和给高档数封顶，于是枚举成本被摊销到坏簇数 m 上。[推测] 候选失败路线：如果强行保留逐簇菜单但只限制 m 个簇枚举，其余簇仍要猜球，复杂度里会残留 (log N)^{h-m}，h-m 个 good 簇的球选择照样爆炸；所以必须证明 good 簇根本不需要猜球，它们由代理直接代表。anchoring 定理（local.tex）产出的正是"good 簇的代理球半径 r_i <= t*sep_i、球内至多拥挤例外"的结构，这是单指数化的前置条件。

### 2.2 错路二：在原始度量上构造代理，然后整体舍入归一化

intro 88-92 逐字：

> The normalized promise matters.  Theorem~\ref{ref:recovery} does not
> assert that the proxies of an arbitrary original metric retain their
> accuracy after distances are capped and rounded.  The general-metric
> application below instead constructs its anchors \emph{after}
> normalization and proves a separate transfer of the final cost bound.

失败机制我可以精确复算：d_M(x,y) = min{C, max{1, ceil(d/u)}}（preliminaries.tex:87），floor 到 1 会把原度量里所有 <u 的距离拍平。代理承诺 D_g <= P_g + mu*P 是原度量距离的和；舍入后同一批边的距离被抬到 1 的整数倍，两半和的相对误差被加性项 |簇| 个 1 污染，mu*P 量级可能整个被吞掉，尤其当 P 很小而簇数很大时。于是作者的做法是在归一化实例上用局部搜索现场重建锚与代理（Theorem loc:anchoring 的假设只有整数距离下界 1 与直径多项式上界），只在最后用 Lemma pre:rounding 把成本界逐点搬回原度量，搬的是"解的成本"，并非"代理的精度"。这是两条不同的稳健性：解成本对舍入的扰动是乘性 (1+epsilon_0) 可控的，精度不等式却不可移植。

### 2.3 错路三：对所有猜测做联合界，把失败概率摊薄成常数

我的默认习惯：猜测层数一多，就给每层分 zeta/层数，再 union bound。文本三次强调反着做：preliminaries.tex:116-118 "return the feasible output with the least original cost. It is at least as good as the output of the correct guess, so no union bound over guesses is needed"；assembly.tex:147-150 "The algorithm need not recognize this index or its success event: its returned minimum is no worse than this candidate. Only this one call must succeed, so there is no union-bound loss over the other indices"。机制：只要最终动作是"取所有候选的最小原成本"，任一猜测命中即整体命中，失败事件被必然包含。前提是候选集是"取 min"合并且每个候选都可行、成本可计算；一旦哪一步想用"多数投票"或者"要求算法自己识别哪个候选成功"，这个技巧立刻失效。[推测] 候选失败路线：若在恢复调用内部用 union bound 摊薄抽样失败（每步 1/(m+1) 之类），失败参数 zeta 会被乘进指数成本 exp(O(m log(1/zeta)))，单指数形状被破坏；completion/refinement 里"保存每个前缀、取最便宜候选"（intro 229-230 "Saving every prefix"）正是用取最小替代联合界的同一手法在时间轴上的投影。

## 3. preliminaries.tex 逐条反推：归一化模型与舍入迁移

### 3.1 非平凡情形与记号（preliminaries.tex:16-41）

(a) 逐字（16-23 行）：

> We assume $F\ne\varnothing$ and $k\ge1$. ... When $k\ge |F|$, opening
> every facility is optimal. When $k\ge n$, choose
> a nearest available facility for each client; ... We may consequently restrict the
> nontrivial analysis to
> \begin{equation}\label{pre:nontrivial}
>  1\le k<n,\qquad k\le |F|.
> \end{equation}

(b) 推导：k>=|F| 时全开是可行且每个 d(p,F) 都达到下界，显然最优。k>=n 时给每个客户端单独配最近设施，并集 <=n<=k 个，逐点下界同时取等。剩下的情形 1<=k<n 且 k<=|F|。第 24-27 行的补齐约定：任何不足数的解都能从 F 补设施不加成本，所以"恰好 h 中心"与"至多 h 中心"的比较可以随意互换；这条约定在 assembly 的 Lemma asm:sensitive（"every cluster ... nonempty"用重路由论证）和 local.tex 的 padding 观察里被反复消费。第 38-41 行的平局规则："When the reference set is enlarged only by adding points, its old points retain their relative priority. Thus the clients assigned to any fixed subset of old points can only disappear from that subset." 机制：单调扩张参考集时，旧簇只减不增，这是后面 refinement 段"两层停止规则之间同一批簇的占比只朝一个方向变化"的前提（intro 246-250："The latter client set can only shrink"）。
(c) 机械理由：为什么限制 1<=k<n -- 若 k>=n，opt 平凡；若 k=0 不在定义域（求和从 1<=|S|）。N=n+|F| ，并非 n 出现得多，因为直径界和 log(N+2) 要同时看到设施点。log 写成 log(N+2) 是为了 N=1 时不爆炸（N>=2 实际成立，但 +2 让 log 恒 >1，M_0、L 的定义在极小实例上仍为正整数）。
(d) [推测] 候选失败路线：允许 D 与 F 共享位置却仍用"distinct 索引点距离 >=1"归一化会在同一位置的 client/facility 对上把 0 距离抬成 1，若不在 pre:rounding 里先分离副本，opt 会被人为抬高 n 倍。文本的处理正是 preliminaries.tex:84 "Separate client and facility copies when a point serves both roles"，反证这条错路真实存在过。另一条 [推测]：若把 opt 定义成恰好 k 个设施，k>|F| 时不可行，整条归约要分支；用 <=k 加补齐约定就绕开了。

### 3.2 Lemma pre:rounding（度量舍入与迁移，preliminaries.tex:50-128）

(a) 逐字（50-62 行）：

> \begin{lemma}[Metric rounding and transfer]\label{pre:rounding}
> Fix rational $0<\varepsilon_0\le1$. Suppose a polynomial-time algorithm for the bounded
> integral instances just described always returns at most $k$ facilities
> of cost at most $5\operatorname{opt}_k$, and, with probability at least
> $1-p$, returns cost at most $A\operatorname{opt}_k$, where $A\le5$.
> Then ... always returns ... $5(1+\varepsilon_0)\operatorname{opt}_k$ and, with
> probability at least $1-p$, ... $A(1+\varepsilon_0)\operatorname{opt}_k$.
> The bounded integral distances needed are at most
> $\lceil20n^2/\varepsilon_0\rceil+1$.

证明里三个关键公式（76-88 行）：

>  M\le P^*\le nM.                                              (pre:M-range)
>  u=\frac{\varepsilon_0M}{n},\qquad
>  C=\lceil20n^2/\varepsilon_0\rceil+1.
>  d_M(x,y)=\min\{C,\max\{1,\lceil d(x,y)/u\rceil\}\},\qquad d_M(x,x)=0.

以及 98-102 行：

> The original optimum, evaluated in $d_M$, has cost at most $P^*/u+n$.
> Thus for the correct guess the new optimum $Q^*$ satisfies
>  Q^*\le P^*/u+n\le n^2/\varepsilon_0+n.                    (pre:rounded-optimum)

(b) 补中间步骤。猜 M：M 取"某个固定最优解里实际被指派到的最大 client-facility 距离"，它必须是输入里出现过的距离，所以候选数 <=n|F|。pre:M-range 左端：最优指派里每个 client 的距离 <=M，故 P* = sum <= nM；右端：被选中的最大边 M 本身是某 client 的贡献，故 P*>=M。缩放：任何原距离 d 的边舍入后满足 d/u <= d_M(x,y) <= d/u + 1（ceil 加一、max/min 只可能抬高，且选中边距 cap 远的不会被 cap，见下），故原最优在 d_M 下成本 <= P*/u + n（每条边至多加 1，共 n 条边）。用 M<=P*<=nM：P*/u <= nM·n/(epsilon_0·M) = n^2/epsilon_0，得 pre:rounded-optimum。迁移方向反过来：算法输出 T 在 d_M 下成本 <=5Q*。要把 T 的每个 client 从"舍入指派"搬回"原度量最近指派"，必须知道舍入指派里没有边被 cap 成 C。这里我补出文本压掉的不等式：5Q* <= 5(n^2/epsilon_0 + n)。因 n>=1、epsilon_0<=1 有 5n <= 5n^2 <= 5n^2/epsilon_0，所以 5Q* <= 10n^2/epsilon_0 < 20n^2/epsilon_0 + 1 = C。这就是常数 20 的全部出处：它只需是 5 的两倍余量，同时给严格不等号留出 +1。于是每条被选边 d_M < C，cap 未激活，ceil 只抬高不压低：d(x,y) <= u·d_M(x,y)，对整条指派求和再换成原最近指派（只会更省）：原成本 <= u·(舍入成本) <= 5u·Q* <= 5(u·P*/u + un) = 5(P* + epsilon_0·M) <= 5(1+epsilon_0)P*（再用 M<=P*）。成功事件同理把 5 换成 A。最后枚举所有 M 猜测、取原成本最小者：正确猜测在列，所以无需对 n|F| 个猜测做联合界；失败概率保持 1-p 不变，这就是 lemma 陈述里 p 不被放大的原因。
(c) 逐项机械理由：epsilon_0 必须"在外部算法被调用前固定"（preliminaries.tex:47-48 "It is fixed before the surplus algorithm is invoked"），因为 C 是 epsilon_0 的函数，直径界反过来进入采样段的全部半径菜单；assembly.tex:18-19 解释 epsilon_0=gamma/16 的职能正是"fixes the polynomial distance bound in Lemma pre:rounding before the external surplus construction is invoked"。max{1,...} 给出正整数性：恢复定理的 promise 要求 distinct 索引点距离为正整数（intro 55-56），0 距离会让"距离比例采样"里权重为 0 的点无法被采。cap 至 C 给出多项式直径：恢复段 exp 因子只依赖 m，但采样每步的失败概率与半径档数相关，档数由 log(直径) 控制，直径多项式即档数 O(log N)。n 与 N 混用要小心：误差项 un 用了 n（边数），直径界用 N（点数），文本全程分得很清。
(d) [推测] 候选失败路线一：不设 cap、只做放大舍入（rounding up 到 u 的倍数），直径会变成 P*/u = O(n^2/epsilon_0)·M/u 级别的原距离比值，在有理输入比特很长时是指数级大，采样段的多项式时间立刻破产；cap 是直径进入多项式的唯一通道。[推测] 候选失败路线二：猜"最小边"或猜 P* 的 2 的幂，并非猜实际出现的距离 M，pre:M-range 两端都会失效（M 若不是某条真实边，M<=P* 未必成立），迁移里 M<=P* 一步断链。[推测] 候选失败路线三：对每个猜测只跑一次并在无法验证时输出失败标志，就需要 1-p 变成 1-p/|guesses|，运行时间被 |guesses| 乘进去；"取最小候选"改成"验证-拒绝"会强制引入对 Q* 的验证器，而 Q* 的验证需要知道 opt，循环依赖。

### 3.3 因子五兜底的角色（preliminaries.tex:125-128）

(a) 逐字：

> The factor-five requirement in Lemma~\ref{pre:rounding} is supplied by
> always retaining a local-search fallback; see Lemma~\ref{loc:swap}.
> The algorithm eventually returns the cheapest of its feasible candidates.
> This ensures that failure of a sampling event never causes unbounded cost.

(b) 这里"5"与 A 无关：兜底候选永远在候选池里，所以无条件界 = 兜底界；界 5 的数学出处在 loc:swap 的 17/5=3.4<=5（下节）。兜底同时喂给 pre:rounding 的"always 5opt"假设，让概率结论与期望结论能用同一池候选写出（assembly 194-201 的期望拆分正是"成功界 + 6·zeta·opt 的失败质量"）。
(c) 为什么系数停在 17/5 ，并非 3+epsilon：局部搜索经典分析要宽度 6 换 1 得到 3+epsilon；这里只用宽度 5 的对称交换加"至多 u 倍移除权"的加权论证，换来 3.4 这个略松但推导只用成对交换的数。作者要的目标并非最优兜底常数；兜底与锚定共用同一个 Lemma loc:swap 才是取舍理由。
(d) [推测] 候选失败路线：若兜底与恢复候选用不同的局部搜索宽度，两处引理都要重证；统一成 width-5 显然是省工的正确选择。

## 4. local.tex 逐条反推：加权交换与锚定定理

### 4.1 width-5 局部最优与精确下降（local.tex:20-52）

(a) 定义逐字（20-26）：

> A set $S\subseteq F$ of size $r$
> is a \emph{width-$5$ local optimum} if no exchange removing at most five
> facilities and adding at most five facilities produces a set of size $r$
> with strictly smaller cost.  We also use exchanges whose resulting set is
> nonempty and has fewer than $r$ facilities: any such set can be padded to
> size $r$ by restoring removed facilities, without increasing its cost or
> the width of the exchange.

引理 loc:descent（28-34）：整数距离 <=B 且 B 多项式时，从任意非空初始 r 集出发多项式时间到 width-5 局部最优。

(b) 推导（36-52）：交换对数 O(N^5·N^5)=O(N^10)，逐个评估成本 O(N)。下降性：整数成本且初值 <=nB，每次严格改进至少减 1，改进次数 <=nB，所以总时间 O(nB·N^10)，B 多项式即多项式。43-51 行的补齐观察是逻辑闭合的关键：加权论证会产生"结果集大小 <r"的交换，这些交换不在定义的改进集里；作者证明任何此类交换 T，把 S\T 中 r-|T| 个被移除设施放回来得到 r 大小的集，它离 S 仍是 <=5 移除 <=5 添加、成本不高于 cost(T)，故被标准局部最优排除。"恢复被移除设施"成本不升是因为超集支配。
(c) width=5 的机械理由：完全在 loc:swap 里定死。大图像类 t>5 时用的是"1 换 1"权重 1/(t-1)，小类用一次性移除 t 个槽；t<=5 保证单交换在定义域内；u=6/5 是 t/(t-1) 在 t=6 的最大值。若宽度降到 3，小类枚举断在 t=4；若宽度升到 6，成本里交换对数升到 N^12 但没有别的好处。整数假设只买时间：5-8 行" The bounded integral distance assumption is needed only for the polynomial running time of exact local descent. The geometric arguments apply to any finite metric." 这正是能在归一化实例上跑局部搜索、结论却以纯几何形式迁移回原度量的底气。
(d) [推测] 候选失败路线：若允许交换改变大小（例如 1 换 0）而重新定义局部最优为"不许减少大小"，那么恢复段用完 m 个移除后回填设施的操作不再受局部最优保护，代理保护性（下节 nu(i) 存活论证）需要重写。另一条：用加权随机局部搜索（近似改进判据）替代精确下降，会引入新的失败概率层，破坏"兜底候选无条件存在"。

### 4.2 Lemma loc:swap：保护代理的加权交换（local.tex:77-184）

(a) 陈述逐字（77-92）：

> \begin{lemma}[Weighted swap bound]
> \label{loc:swap}
> Under the preceding hypotheses, if $S$ is a width-$5$ local optimum and
> $u=6/5$, then
> \begin{equation}
>  S_b+uS_g\le (1+2u)P_b+uD_g.
>  \label{loc:strong-swap}
> \end{equation}
> Consequently,
> \begin{equation}
>  \operatorname{cost}(S)\le uD_g+(1+2u)P_b.
>  \label{loc:swap-bound}
> \end{equation}
> In particular, for any comparison set $O$ of size at most $|S|$,
> $\operatorname{cost}(S)\le(17/5)P\le5P$.
> \end{lemma}

(b) 补中间步骤。记号（54-75 行）：O 大小 h<=|S|，分 good/bad，代理集 Phi（g 个互异），q=|S\Phi|=|S|-g>=h-g=m（98-100 行）。m=0 时全体走代理，S_g<=D_g，两式直接成立（101-103）。m>0 时核心构造：每个 bad 中心 i 记住最近设施 nu(i)（用于路由），再独立定义图像 psi(i)：nu(i) 未受保护就取 nu(i)，受保护就任取一个未保护设施（106-110）。这个"路由用最近、配对用图像"的分离是 Gupta-Tangwongsan 论证里被牺牲自由度的地方，作者用两层映射把它赎回。图像类大小 t：小类（t<=5）做单个交换（移除 t 个槽、加入全类）；大类拆成 |I| 个 1 换 1 交换、每个权重 1/(t-1)（121-124）。槽的存在性：大类每类要 t-1 个辅助槽，总量 m-a，可用未保护非图像设施 q-a >= m-a（113-117）。移除权统计：每个 bad 中心加入权和恰为 1；小类槽移除权 1；大类槽被类内 t 个交换各以 1/(t-1) 移除，权和 t/(t-1)<=6/5=u（130-136）。保留性质（139-147）：任何不加 i 的交换都不移除 nu(i)：若 nu(i) 受保护显然；否则 nu(i)=psi(i) 是 i 的图像槽，小类移除该槽的交换必加全类含 i，大类交换从不碰图像槽，异类槽互斥。路由成本：p 属于 bad 簇时，在"加 i"的交换里改挂 i，变化 d_p^* - s_p；其余交换里若旧设施被移除，改挂 nu(i)，三角不等式两步（153-158）：d(p,nu(i)) <= d_p^* + d(i,nu(i)) <= d_p^* + d(i,s(p)) <= 2d_p^* + s_p。加 i 的权和是 1，其余交换的移除权和 <=u，所以 p 的加权变化上界是 (d_p^*-s_p) + u·2d_p^*（文本 159-167，注意旧设施恰好也是被移除又加回时更省，上界只松不假）。good 簇：旧设施被移就走受保护代理 phi_i，变化 d(p,phi_i)-s_p >= 0，加权 <= u(d(p,phi_i)-s_p)。全部相加、用"每个交换真实成本变化 >=0"：0 <= (P_b - S_b) + 2uP_b + u(D_g - S_g)，即 loc:strong-swap。u>=1 使 S_b+S_g <= S_b+uS_g，得 loc:swap-bound。全 bad：D_g=0，cost(S) <= (1+12/5)P = 3.4P。
(c) 常数机械理由：u=6/5 唯一来源是 t/(t-1) 在最小大类 t=6 的取值；1+2u = 17/5 是"每个 p 支付 2 次 d_p^* 的绕路 + 1 次自身簇成本"。为何 good 侧乘 u 而 bad 侧乘 1+2u：good 簇只做"被移除才走代理"的被动重路由，暴露面是移除权 u；bad 簇主动加入中心、付出 2d_p^* 的三角绕行。loc:swap-bound 是后文一切的母不等式：cost(S)<=5P 给兜底，m=0 情形给锚定的 V_i 总和界 6P（4.3 节），P_b<=P/10 时给 1.432P（loc:small-bad-cost）。
(d) [推测] 候选失败路线一：若只设一个映射 psi 同时用于路由与配对，psi(i) 可能远离 i，路由界 d(p,psi(i)) <= 2d_p^* + s_p 不再成立（nu(i) 的"最近"性质才是第二步不等式的弹药），cost(S)<=5P 直接退化。[推测] 候选失败路线二：保护 Phi 意味着交换不能动代理；若某 bad 中心的 nu(i) 全在 Phi 里而不引入"任取未保护设施"的 psi 兜底，配对步骤在 q>=m 但"未保护近邻"可能为空的极端下断链；文本 109-110 行的"take any unprotected facility"就是为了堵这个洞。[推测] 候选失败路线三：把权重全设 1（不区分大小类）需要宽度 >=m 的交换，局部最优性对超宽交换没有保证。

### 4.3 Theorem loc:anchoring：在任意固定精度下造代理（local.tex:197-383）

(a) 陈述逐字（197-225）：

> \begin{theorem}[Anchoring]
> \label{loc:anchoring}
> Let $S$ be a width-$5$ local optimum, and let $O$ be a comparison set
> with $2\le h=|O|\le|S|$ and $P=\operatorname{cost}(O)>0$.  Suppose $b>0$
> satisfies
> \begin{equation}
>  b\left(\ell+
>    \bigl|\{i\in O:n_i\operatorname{sep}_i<b\bigr|\right)
>  \le10P.
>  \label{loc:scale-condition}
> \end{equation}
> For every fixed $\mu\in(0,1]$, there is a partition
> $O=O_g\mathbin{\dot\cup}O_b$ and distinct proxies $\phi_i\in S$ for
> $i\in O_g$ such that, with $m=|O_b|$,
> \begin{equation}
>  \sum_{i\in O_g}\sum_{p\in C_i}d(p,\phi_i)
>  \le P_g+\mu P,
>  \qquad m\le C_\mu\frac{P}{b},
>  \label{loc:anchoring-conclusion}
> \end{equation}
> where the finite constant
> \begin{equation}
>  J_\mu=\left\lceil\frac{40}{\mu}\right\rceil,
>  \qquad
>  C_\mu=10+\frac{600}{\mu}\,2^{J_\mu-1}
>  \label{loc:anchoring-constant}
> \end{equation}
> depends only on $\mu$.
> \end{theorem}

(b) 证明补步。V_i = sum_{p in C_i}(s_p + d_p^*)（229-231），全 bad 用 loc:swap-bound 得 sum V_i = cost(S)+P <= 6P（loc:V-bound，233-236）。"短"中心：n_i·sep_i < b（含空簇）。阈值族 t_a = (mu/100)·2^{-a}，a < J_mu；阈值 t 下 good = 不短且 V_i <= t·b。对固定非短 i，使 i 变 bad 的阈值满足 t_a·b < V_i，几何级数尾和 <= 2V_i（245-246）。求和换序（我把 247-251 的不等式链补全）：sum_a t_a·b·(m_a + ell) <=（短中心与非短中心的分离）2·ell·sum_a t_a·b + 2·sum_{i nonshort} V_i <= 2·ell·b·(mu/100)·2 <（用 scale-condition: b·ell<=10P）(4mu/100)·... 精确地：sum_a t_a b <= 2·(mu/100)·b <= (mu/50)·10P = mu·P/5，乘 2·ell 前缀与 ell·|{short}|<=10P/b... 逐字重算：sum_{a} t_a b (m_a + ell) <= 2(mu/100)b(q_0+ell) + 2 sum V_i。第一项里 q_0 对应"短中心即使 V_i 小也算 bad"的补偿、ell 是每阈值固定的设施盈余；b(q_0+ell)<=10P 故第一项 <= (mu/5)P；第二项 <=12P；总 <= (12+mu/5)P，与 247-251 完全一致。J_mu >= 40/mu 使均值 <= (mu/40)(12+mu/5)P <= (61/200)muP < muP/2。取达到均值的 t=t_a：tb(m+ell) <= muP/2，且 t <= mu/100 <= 1/100（loc:selected-threshold）。计数：非短 bad 必有 V_i > tb，故 m <= q_0 + sum_i V_i/(tb) <= (10+6/t)·P/b；t >= t_{J-1} = (mu/100)·2^{-(J-1)} 即 6/t <= (600/mu)·2^{J-1}，得 C_mu。代理：good 的 phi_i 取 i 的最近 S 设施，r_i=d(i,phi_i)。n_i·r_i <= V_i <= tb（因为 r_i <= d(i,s(p)) <= d_p^*+s_p 逐点求和），r_i <= t·sep_i（loc:proxy-distance 281-286）。开球 B_i 半径 sep_i/4 互斥：两半径和 <= d(i,j)/2，双隶属违三角（291-295）。互异代理随之成立，且"拥挤球"（含 >=2 个 S 设施）数 <= |S| - (h-m) = m+ell（297-304：good 球 h-m 个各含 >=1 设施，多出的设施总数 |S|-(h-m)）。误差三笔（308-370）：拥挤球：总超支 <= n_i r_i <= tb，合计 tb(m+ell) <= muP/2。单设施球里"未挂自己代理"的 p：其 S 设施在球外故 d_p^*+s_p >= sep_i/4，超支 <= r_i <= 4t(d_p^*+s_p)，合计 <= 4t·sum V_i <= 24tP。"挂自己代理"的 p：1 换 1 交换 phi_i -> i 由局部最优得 loc:incoming-swap：sum_{A_i}(s_p - d_p^*) <= r_i|I_i|；外来者 p 属于别的簇 j，d_p^*+s_p >= d(i,j) - r_i >= (1-t)sep_i，故 r_i <= t/(1-t)·(d_p^*+s_p)；每 p 至多对一个受偿代理"外来"（代理互异 + 指派唯一），合计 <= t/(1-t)·sum V_i <= 6t/(1-t)·P... 文本写成 6tP/(1-t)。三笔合并：D_g - P_g <= muP/2 + (24t + 6t/(1-t))P；t<=1/100 时 24t+6t/(1-t) <= 24t+6.07t < 31t，文本放大到 36t <= (9/25)mu < mu/2（379-380，36t 用了 6t/(1-t)<=12t 的粗化，因 1-t>=1/2）。于是 D_g <= P_g + muP。
(c) 常数机械理由：10P 与 6P 的比值决定 12+mu/5 里的 12；40/mu 来自要 mu/40·(12+...) <= 1/2 一侧（(12+0.2)/40=0.305<1/2，留了一倍裕度）；600/mu·2^{J-1} 里 600 = 6·100，6 是计数式 (10+6/t) 的 6 与 1/t 的最大值组合。C_0 = C_{1/100} = 10+60000·2^{3999}（loc:main-count-constant 386-390）：mu=1/100 时 J=4000、600/mu=60000。这个天文数字在复杂度上毫无威胁，因为它只进 M_0 = ceil(4C_0 L/xi) 的常数因子，exp(O(M_0)) 里的 O 被它吞掉；真正致命的是它不进 log N。sep_i 的定义要求 h>=2（189 行），所以 h=1 分支在 assembly 里走"全 bad"通道（loc 408-410 明说）。scale-condition 的左端 b(ell+q_0) 是"设施盈余 + 短簇数"的联合预算：b 是分离尺度，assembly 会把 b=beta·P 代入使左端为 0（每簇 n_i sep_i >= beta P >... 恰好在阈值下）。loc:small-bad-cost（400-407）：P_b<=P/10 时代入 loc:swap-bound 与 D_g<=P_g+0.01P：cost(S) <= (6/5)(P-P_b+0.01P)+(17/5)P_b；右端对 P_b 递增（系数 11/5），在 P_b=P/10 取最大值 (6/5)(1.01-0.1)P+2.2·0.1P = 1.212P+0.22P = 1.432P < 1.6P。这条推论说明：坏簇成本占比小的时候 anchor 本身已近 1.6 因子，恢复段只需处理"坏簇少但贵"的几何。
(d) [推测] 候选失败路线一：阈值族若取算术网格 t_a = mu·a/J，几何尾和不再收敛到 2V_i ，是 J 的倍数，m 的计数界多出 J 因子、单指数里掺进 mu 依赖的幂。[推测] 候选失败路线二：省略"短中心"概念，只用 V_i 阈值，则 n_i·sep_i 小的簇会以大球半径混进 good 集，拥挤球互斥论证（半径 sep_i/4）失效，代理互异无法保证；摘要里"可区分（distinguishable）"三个字对应的正是 q_0 这一侧。[推测] 候选失败路线三：把 incoming-client 交换写成 1 换 1 却允许 |S| 减少，需要局部最优对非保大小交换也封闭；文本在 loc:descent 的补齐观察（43-51）就是为了让这类交换合法化，若没做这步，loc:incoming-swap（341-354）在 h=|S| 且移除后填不回的场景断链。

## 5. sampling.tex 逐条反推：群体半径、三菜单与单指数损失摊销

### 5.1 段落定位与我进场时的错误默认（sampling.tex:1-53）

(a) 开篇逐字：

> This section constructs the prefixes used by the recovery algorithm.  Its
> input is a real solution $S$, an upper bound $M_0$ on the number of bad
> comparison centers, and guesses for two integers $P$ and $m$.  The comparison
> solution, its partition, and its proxies are used only in the analysis.

以及 18-20 行的自我声明：

> The population radii and
> their amortized menu cost are what make the dependence on the number
> of bad clusters single-exponential.

(b) 输入清单值得逐个数：算法只拿 S、M_0、猜测 (P,m)。它不知道 O、好坏划分、代理、S_0（35-47 行）。非代理集 S_0 = S \ {phi_i : i good}，|S_0| = m 恰好成立（代理互异且 |S|=|O|），48-50 行处理 m=0：代理铺满 S，promise 直接给 cost(S)<=1.01P，实验不必启动。kappa=10^{-6} 是主恢复用值，几何与概率引理允许任意固定 0<kappa<=1 以便 refinement 段复用（51-53 行）。
(c) 机械理由：为什么 m 也要猜：M_0 是上界而真实 m 未知，r^0(w) 的定义含 P/m；猜大 m 只会让半径菜单整体缩小，采样仍在跑，只是每个成功前缀的结构引理不成立；正确猜测在枚举列表里，配合"取最便宜候选"免联合界（5.5 节）。为什么"交错进行"球添加与移除（9-11 行），而 CGLSS 原文分段做（16-17 行外部对照）：移除不依赖球，交错让引导过程每步都只有一个进展变量 |A|+|Q| 加一，2m 步停表变得平凡；分段版本要在两段间传递停止量，前缀保存数量翻维度。
(d) [推测] 候选失败路线一：先移除后采球的两段式若保留，第二段采球时 H 已不含被移除中心，客户端参考距离突变，W(H) 的上界引理 sam:sampling-mass 要重证且失去 3.42P 这个常数形状（移除后球内点数不再由初始 S 控制）。[推测] 候选失败路线二：不设 m=0 早退，让实验在 m=0 时跑 0 步，枚举与补全分支要多处理空球集退化，文本选择在 48-50 行直接短路。

### 5.2 可计算半径 r^0 与其求和界（sampling.tex:56-107）

(a) 定义与引理逐字（60-63、66-88）：

>  r^0(w)=\min\{q\ge0:q|\mathcal D(w,q)|\ge P/m\}.    (sam:r0-definition)
>  r^0(w)=\min_{1\le j\le n}\max\{d_j,P/(mj)\}>0.     (sam:r0-formula)
>  r^0(w_i)&\le(a+2)\bar d_i+\frac{2P}{mn_i},\\
>  \sum_{i\in A}n_i r^0(w_i)
>  &\le(a+2)\sum_{i\in A}P_i+\frac{2|A|}{m}P
>  \le(a+4)P.                                        (sam:leader-radius-sum)

(b) 公式 (sam:r0-formula) 的推导补步：正向，对每个 j，q_j = max{d_j, P/(mj)}：球 D(w,q_j) 至少含前 j 近点（d_j 是第 j 近距离），且 q_j·j >= P/m，可行。反向，任何可行 q 记 j=|D(w,q)|>=1（含 w 自身零距），则 d_j<=q 且 P/(mj)<=q（可行性即 q·j>=P/m），故 q_j<=q。两个方向夹出最小值相等，同时给出最小值可达与闭球满足定义不等式。求和界补步：leader w_i 距 i 不超过 a·dbar_i。簇内至少 n_i/2 个点满足 d_p* <= 2dbar_i（否则这些点自身距离和超过 P_i = n_i·dbar_i，dbar_i=0 时全体为 0 也成立）。这些点在 (a+2)dbar_i 半径内（w_i 到 i 加 i 到 p 两段）。取 q = (a+2)dbar_i + 2P/(m n_i)：球至少含 n_i/2 个点，q·(n_i/2) >= (a+2)dbar_i·n_i/2 + P/m... 等等，这里要保证 q·|D| >= P/m：q >= 2P/(m n_i) 且 |D| >= n_i/2，乘积 >= P/m，可行，所以 r^0(w_i) <= q。乘 n_i 求和：sum n_i·[(a+2)dbar_i + 2P/(m n_i)] = (a+2)sum P_i + 2|A|P/m <= (a+2)P + 2P（不同 leader 属不同坏簇，|A|<=m，sum P_i <= P）。a=1.2 时 5.2P，a<=3/2 时 <=5.5P。
(c) 机械理由：r^0 是"人口半径"：到 w 距离乘球内点数达到 P/m 的最小半径。它把"总成本 P 分给 m 个坏簇"这一全局信息压进每个点的可计算量；(a+2) 里 2 的来源是"半数近点"引理（Markov 型：一半以上超 2dbar 则和超 P_i），+a 是 leader 自身的偏移。2P/(m n_i) 是球数下界 n_i/2 折算的余量，出现因子 2 ，并非 1 正因为只有一半人口。主恢复里 a=1.2（leader 取自 N_i(1.2)），5.2 这个数字随后进入 W(H) 界的 5.2kappa P 与 theta 系数的 kappa r^0 项。
(d) [推测] 候选失败路线一：用开球定义 r^0 则最小值未必可达，公式证明里"闭球满足定义不等式"一句失去，后续所有 R>=r^0 方向的推理要加 eps 极限。[推测] 候选失败路线二：若 r^0 用 P ，并非 P/m（全局半径），单簇小簇的 r^0 被大簇抬高，sam:leader-radius-sum 的 (a+4)P 变成 hP 量级，半径菜单彻底失控；除以 m 是"坏簇均摊"思想的第一个落点。

### 5.3 叶虚拟点与平局规则（sampling.tex:109-175）

(a) 逐字（110-112、126-142）：

> Adjoin a permanent point $\delta_\infty$ at distance $\Delta$ from every
> original point.  For each selected pair $(w_i,R_i)$ with $R_i>0$, adjoin
> a distinct leaf $\delta_i$ at $w_i$ with edge length $R_i$.
> ...
> d(x,\delta_i)=d(x,w_i)+R_i,\qquad
>  d(\delta_\infty,\delta_i)=\Delta+R_i.
> If $R_i\ge d(w_i,O)$, then $d(x,\delta_i)\ge d(x,O)$ for every original
>  point $x$. ... There is a fixed assignment rule, independent of $O,S_0$,
>  and $Q$, such that after any state in which further operations only add
>  leaves, the client set assigned to any fixed subset of surviving original
>  centers can only shrink.

(b) 补步：先对原点点做完全图最短路度量并挂 delta_infty（长 Delta），经 delta_infty 的路径两段边和 2Delta >= 任何原距离，原距离不变；再挂叶（叶上经 w_i 绕路恒等于直边加 R_i，最短路径度量自动给出 d(delta_i,delta_j)=R_i+d(w_i,w_j)+R_j）。R_i >= d(w_i,O) 时 d(x,delta_i) = d(x,w_i)+R_i >= d(x,w_i)+d(w_i,O) >= d(x,O)（距离到集 1-Lipschitz）。优先序：原设施固定序，permanent dummy 殿后，叶按创建时间；客户端取"序中最先的最近参考点"。加叶不改变旧候选的距离与相对序，所以已经选了"固定旧中心子集之外"的点不会因为新增候选跳进该子集。
(c) 机械理由：叶 delta_i 是"球的替身"：算法之后可以真的移除 i 所在的原设施，而参考距离 d(p,delta_i) 恰好等于"仍在球里时经由 w_i 走 R_i"的上界，使采样期间 H 永远非空、W(H) 良定义（delta_infty 保证非空，170-175 行）。平局规则的"子集单调收缩"是 refinement 双停止的引信：J_s 集合随球添加只缩不涨，因此 I(H)=sum over R^* 的存量单调下降，停止量 I <= kappa P 一旦达成不再破坏。这条引理刻意"独立于 O,S_0,Q"，所以同一规则可以事先写进算法、事后用于分析任何（包括算法不知道的）子集。
(d) [推测] 候选失败路线一：若 delta_infty 距离取 Delta/2，经 dummy 的路径可以缩短原距离、度量扩张失败；取 Delta 是最小安全值（两段 2Delta >= Delta >= 任意原距离）。[推测] 候选失败路线二：若平局按"最近叶优先"，加叶会重新分配旧簇，sam:dummy-metric 的收缩性质失去，refinement 段"第一停止时的占比在第二停止时只减"的比较断链。

### 5.4 三菜单半径实验与摊销引理（sampling.tex:177-324）

(a) 菜单逐字（182-203，节选）：

>  M_\kappa&=\lceil10/\kappa\rceil+1,&
>  J_{\kappa,m}&=1+\lceil2m/\kappa\rceil,\\
>  E_\kappa&=\min\{e\in\mathbb Z_{\ge0}:(1+\kappa)^e\ge10\}.
> Choose one of the following three menus with probability $1/3$ each.
> \item[(1)] Choose $j$ uniformly from $\{1,\ldots,M_\kappa\}$ and set $R=j\kappa q$.
> \item[(2)] If $\Lambda\ne\varnothing$, let $D_\Lambda=d(w,\Lambda)$,
>       choose $e$ uniformly from $\{0,\ldots,E_\kappa\}$, and set
>       $R=D_\Lambda/(1+\kappa)^e$. ...
> \item[(3)] Choose $j\in\{1,\ldots,J_{\kappa,m}\}$ with probability
>        \frac{2^{-j}}{\sum_{u=1}^{J}2^{-u}} and set $R=j\kappa q$.

正确半径定义（210-213）：r <= R <= (1+kappa)r + kappa r^0(w)。摊销引理结论（243-258）：

>  \sum_{\text{third menu}}\frac rq\le\frac{10m}{9},
>  \qquad
>  \sum_{\text{third menu}}j
>  \le\left(\frac{10}{9\kappa}+1\right)m.                (sam:third-menu-budget)
>  c_\kappa^m\,
>  2^{-(10/(9\kappa)+1)m}=\exp(-O_\kappa(m)).             (sam:menu-probability)

(b) 推导补步。三分 prescribe 规则：r<=10q 走菜单 1（j = max{1,ceil(r/(kappa q))}：R >= r 且 R <= r + kappa q；j <= ceil(10q/(kappa q))+1 = 10/kappa+1 <= M_kappa 用 r<=10q；r=0 时 j=1 也落在 R>=0 一侧）；r>10q 且 D_Lambda<=10r 走菜单 2（历史正确球给出 D_Lambda>=r，最大 e 使 D/(1+k)^e >= r：则 R >= r 且 R < (1+kappa)r）；r>10q 且 D_Lambda>10r 走菜单 3（j=ceil(r/(kappa q))，可行性由下论证）。第三菜单互斥性证明补每一步：设 a 先 b 后、有公共客户端 p，则 d(w_a,w_b) <= q_a+q_b < (r_a+r_b)/10（第三菜单意味着 q < r/10，严格）。r 对 w 是 1-Lipschitz 经 O：|r_a - r_b| <= d(w_a,w_b) < (r_a+r_b)/10，解出 9/11 < r_a/r_b < 11/9。b 步时 a 的叶仍在（引理假设"先前叶全程保留"），故 D_Lambda(b) <= d(w_b,w_a) + R_a <= (r_a+r_b)/10 + (1+kappa)r_a + kappa q_a < [1/10 + (11/9)(1 + kappa + kappa/10)] r_b；kappa<=1 时 <= 0.1 + (11/9)(2.1) = 2.678 < 3 r_b < 10 r_b，与 b 走第三菜单的前提 D_Lambda(b) > 10 r_b 矛盾。所以 D(w_a,q_a) 与 D(w_b,q_b) 不交（用客户端球，不需要环境空间里几何球不交）。预算：第三菜单时球 D(w,q) 内每个 p 满足 d_p* >= r - q > 0.9r，且 |D(w,q)| >= P/(mq)（r^0 的人口不等式），不交球合并进总和：P = sum_p d_p* >= 0.9 sum_{三} r·|D(w,q)| >= (0.9P/m) sum r/q，约 P 得第一个界。j = ceil(r/(kappa q)) <= r/(kappa q)+1，对至多 m 项求和得第二个界；再验 10m/(9k)+1 <= 2m/k+1 <= J_{kappa,m}（kappa<=1, m>=1）。概率：菜单先选中 1/3；菜单 1、2 单档概率 >= c_kappa = min{1/(3M), 1/(3(E+1)), 1/3}；菜单 3 单档 >= (1/3)·2^{-j}/(1-2^{-J}) 的归一化……文本口径：归一化和 < 1 故 (1/3)·2^{-j}/sum... 精确为 (1/3)·2^{J-j}/(2^J-1) >= (1/3)·2^{-j}·2^J/(2^J) >= ... 用 sum_{u=1}^{J} 2^{-u} < 1 得概率 = 2^{-j}/(sum)/3 > (1/3)2^{-j}。连乘并用 sum j <= (10/(9k)+1)m 得 (sam:menu-probability)。
(c) 机械理由：三菜单各堵一个场景。菜单 1 管"r 与 q 可比"的常规情形，档数只依赖 kappa；菜单 2 管"r 大但已有叶在附近"，用相对比值几何下降避开绝对档数；菜单 3 管"r 大且无近邻叶"，这是唯一档数随 m 增长的菜单，于是所有概率损失都发生在第三菜单上，而第三菜单被互斥性 + 人口不等式摊销。10 这个门限出现在三处（r<=10q、D<=10r、(1+k)^E>=10）是同一个常数让三分完备：10 > (1+kappa)+kappa... 实为分析自由，(1+k)^E>=10 让菜单 2 至少能从 D<=10r 降到 r 上方。互斥性证明里 0.1+(11/9)(2.1)<3<10 的宽裕说明 10 可以降到 4 左右仍成立，作者取 10 是为了让三个门限共用一个数。kappa=10^{-6} 时 M_kappa 约 10^7、E_kappa=ln10/ln(1+1e-6) 约 2.3e6，全是只依赖 kappa 的常数档；J_{kappa,m} = 1+2m·10^6 是唯一随 m 的档数。
(d) [推测] 候选失败路线一：没有菜单 2、只用菜单 1+3 的绝对半径：r>10q 时若历史球覆盖 w 附近，绝对档 ceil(r/(kappa q)) 可能超 J（大 r/q 但小间隙的真实几何）， prescribe 半径不在菜单内、概率为零；相对下降正是为"已有叶近邻"场景省档数。[推测] 候选失败路线二：互斥论证若改用"球内点数乘半径 >= P/m 且球半径和 <= 间隙"式的纯几何 packing，在非均匀度量空间（如图上度量）没有不交环境球可用；文本特意写 "no ambient space containing whole geometric balls is needed"，反证作者试过环境球版本并放弃。[推测] 候选失败路线三：若允许移除球（叶会消失），"先前叶全程保留"假设失效，菜单 2 的 D_Lambda>=r 与互斥矛盾论证同时断链；实验规则 4（348 行）"超过 m 球或 m 移除即终止"从结构上保证叶只增。

### 5.5 自适应引导轨迹定理（sampling.tex:326-426）

(a) 结论逐字（381-386）：

>  \rho^{2m}c_\kappa^m
>        2^{-(10/(9\kappa)+1)m}
>  =\exp(-O_{\kappa,\rho}(m)).                    (sam:guided-likelihood)

(b) 这是整节的似然引擎，我把比率法补细：把 (客户,模式[,菜单,档]) 全写入历史。固定引导支持的中间历史 gamma：引导规定事件 E_gamma（某模式 + 某合格客户集），其真实概率 p_gamma >= rho。真实分布条件到 E_gamma 后与引导条件分布相同（引导"按真实条件律抽"，(ii) 条），所以对单个合格客户，真实概率 = 引导条件概率 · p_gamma。逐步连乘：每步贡献因子 >= rho；球添加再乘 prescribe 档位概率（>= c_kappa 或 c_kappa 2^{-j}）。沿长度 <=2m 的终止轨迹，真实柱概率 >= exp(-O(m)) · 引导柱概率。终止引导历史两两是前缀-free（停止后不再抽），对应真实柱不交；求和：引导以概率 1 停止，故真实命中某终止柱的总概率 >= 右端。关键句（414-419）："This summation does not select one fixed sequence of leaders"，免掉了"猜整条轨迹"的 m! 或 (log N)^m 爆炸。有限比特实现（421-425）：每基本转移概率被 dyadic 抽样保到 1/2 以下乘子，<=2m 步乘 2^{-2m}，仍是 exp(-O(m)) 形状。
(c) 机械理由：rho 只需与实例无关的常数，因为指数里 log(1/rho) 乘 m 仍是 O(m)；若 rho 随 N 缩小（例如 rho=1/log N），exp(O(m log log N)) 再次非多项式，这就是引理陈述强调 "a number rho in (0,1] independent of the instance size" 的原因。引导可以"看整段增广历史甚至看 O"，因为比率论证对任何适应度都成立，它只要求引导的抽取与真实抽取同分布；这给了后续 refinement 段用比较解定义停止规则的合法出口，算法侧零成本。
(d) [推测] 候选失败路线一：若改成事先固定 leader 序列再逐一实现，柱求和被 m 个 leader 的 (n choose m) 猜测替代，单指数破功；自适应引导 + 柱不交正是为了把"猜序列"变成"跑实验"。[推测] 候选失败路线二：若真实与引导的抽样律只是接近，并非严格条件同分布（例如引导按未加权均匀抽），比率 p_gamma 变成带漂移的乘子链，rho^{2m} 界需要 KL 累积量控制，实现复杂度爆炸。[推测] 候选失败路线三：若失败概率用 Chernoff 对整条链一次性估计，要求引导非适应；文本用逐步条件比率才换来分段停止（多阶段引导，377-379 行 "several successive stages"）。

### 5.6 近客户端引理、停止量与采样质量（sampling.tex:428-552）

(a) 逐字（436-447、488-492、496-506）：

>  |N_i(a)|\ge(1-1/a)n_i,\qquad
>  d(i,H)\le a\bar d_i+
>               \frac{T_i(a)}{(1-1/a)n_i}.              (sam:general-near-bound)
>  d(i,H)\le1.02\bar d_i+\frac{60T_i}{n_i},\qquad
>  d(p,H)\le1.85d_p^*+\frac{60T_i}{n_i}\quad(p\in C_i\setminus N_i).  (sam:far-client-bound)
>  T_{\rm near}(H)\le\kappa P,
>  \qquad I(H)\le\kappa P.                              (sam:stopping-rule)
>  W(H)\le3.42P+61T_{\rm near}(H).                       (sam:weight-bound)
>  \rho_\kappa=\frac{\kappa}{2(3.42+61\kappa)}>0.        (sam:progress-constant)

(b) 逐条补推。一般界：超过 a·dbar 的点数 < n_i/a（否则和 > P_i），故 N_i(a) 至少 (1-1/a)n_i 个；取其中参考距离最小者 <= T_i(a)/|N_i(a)|，经它到 i 再三角。主参数 a=1.2：|N_i| >= n_i/6。1.02 变体：取 1.02=51/50，{d_p* <= 1.02 dbar} 至少 n_i(1-1/1.02)=n_i/51 个且含于 N_i，其最小者参考距 <= 51T_i/n_i <= 60T_i/n_i；d(i,H) <= 1.02dbar + 51T_i/n_i <= 1.02dbar+60T_i/n_i。远客户端：d(p,H) <= d_p* + d(i,H) <= d_p* + 1.02dbar + 60T_i/n_i；p 不在 N_i 意味着 d_p* > 1.2dbar，故 1.02dbar < (1.02/1.2)d_p* = 0.85d_p*，合计 1.85d_p* + 60T_i/n_i。采样质量（512-551）：good 客户端因代理全存活（Q 含于 S_0、代理在 S_0 外）贡献 <= P_g+0.01P。已覆盖坏簇（524 行）：逐点 d(p,H) <= d_p*+r_i+R_i；对 C_i 求和：P_i + n_i r_i + n_i R_i；n_i r_i <= 1.2P_i（leader 在 N_i 内故 r_i=d(w_i,i)<=1.2dbar_i）；n_i R_i <= (1+kappa)n_i r_i + kappa n_i r^0(w_i) <= 1.2(1+kappa)P_i + kappa·5.2P（用 5.2P 求和引理）；合计 (3.4+1.2kappa)P_i + 5.2kappa P。未覆盖坏簇：近者 T_i、远者 1.85d_p*+60T_i/n_i 逐点求和（远点数 <= n_i）得 1.85P_i + 61T_i；空簇零贡献。三堆合并、P_g+P_A+P_B=P：W <= P_g+0.01P+(3.4+1.2k)P_A+5.2kP+1.85P_B+61T_near <= (3.41+6.4k)P + 61T_near < 3.42P+61T_near（k=1e-6 时 3.41+6.4e-6 < 3.42；0.01 与 3.4 合成 3.41）。进展概率：T=kappaP 破时球模式且采到 near 并集的概率 = T/(2W) >= kappaP/(2(3.42P+61kappaP)) = rho_kappa；T 达标而 I 破时 I/(2W) > kappa/(2(3.42+61kappa))（用 W <= (3.42+61kappa)P）。
(c) 机械理由：1.02 与 1.2 之间的空档是"near 集合在两个截止参数下都可靠"的余地：1.02<1.2 保证 {<=1.02dbar} 严格内嵌 N_i(1.2)，60 与 51 的余量吸收取整；1.85 = 1+1.02/1.2 精确等式（466-468 行逐字给出）。61 = 60+1 是远点求和的 +T_i 合并。3.42 是 3.41+6.4e-6 的进位；这个数进入 rho_kappa 与最终 1.97 因子链（5.3 与 3.42 分别管停止与质量）。progress 事件要求"采到的 near 客户端所在簇 i 在 B 中且此前未覆盖"：near 并集恰按 B 求和（479-485），唯一簇指派由固定最近规则给出。
(d) [推测] 候选失败路线一：停止量若用 P_i ，并非 T_near（成本，并非距离），移除后已覆盖簇的存量成本仍留在总和中，T 不再随球添加单调下降，2m 步停表证明（每个操作使 |A|+|Q| 加一）之外的"停滞"分支无法排除。[推测] 候选失败路线二：若 near 截止取 a=1.01 贴近 1.02，|N_i| >= (1-1/1.01)n_i ≈ 0.0099n_i，60T_i/n_i 型系数要膨胀到 ~101T_i/n_i，采样质量的 61 常数恶化并传染 W 界；1.2 与 1.02 的距离是系数的定价。[推测] 候选失败路线三：若 W(H)=0 不提前终止而继续抽样，抽样分布未定义（339-340 行的第 (1) 步显式处理）；这个退化分支若漏掉，定理陈述里"the client distribution is defined"（550-551）无法闭合。

### 5.7 成功前缀定理与实现细节（sampling.tex:554-675）

(a) 结论逐字（558）：

> one run of the
> actual experiment has, with probability at least $\exp(-C_\kappa m)$ for
> an absolute constant $C_\kappa<\infty$, a recorded prefix with the
> following properties

三条性质 (i)(ii)(iii)（561-583）分别交付：球的正确半径与半径和 <=5.2P；两个停止量 <= kappa P；代理存活 + 覆盖/远客户端界可用。
(b) 引导构造：停机条件即 sam:stopping-rule；第一式破就条件到"球模式且 near 并集"，采到 w 落在唯一未覆盖坏簇 i，按 prescribe 半径加球加叶；第二式破就条件到"移除模式且挂 R^* 的点"，删对应 S_0 中心。引理 sam:sampling-mass 给两事件同一 rho_kappa；引理 sam:probability 把整条自适应轨迹折成 exp(-O_{k,rho}(m))。每步 |A|+|Q| 增一，上界 m+m=2m，引导必停。空坏簇永远留在 B 里但 T_i=0、N_i 空，从不触发除 n_i 的步骤。枚举与精度（620-665）：P 在 1..nDelta 整数范围、m 在 1..min{M_0,h}，直径多项式使范围多项式；r^0 由排序加取 min 多项式比特；相对菜单依赖链每步只加"一个原距离比特 + kappa 常数"，2m 步仍多项式比特；dyadic 抽样用 b 位（2^{-b} <= p_j/2）实现精确分布的下半保真，无拒绝循环期望。放大（667-675）：重复 exp(O_k(M_0))log(1/zeta) 次覆盖全部保存前缀的补全检查。
(c) 机械理由：2m 步预算 = m 球 + m 移除，正是"每坏簇至多一球、每 S_0 成员至多一删"的悲观上界；前缀保存 2m+1 个状态使完成段可以事后挑最优，而不需要算法认识停止谓词（671-674 行明说 "without ever recognizing the analytical stopping conditions"）。m=0 候选就是 S 本身（627 行），闭合枚举。
(d) [推测] 候选失败路线一：若每个前缀独立跑完成再选优，时间与完成段的 exp(O(m)) 相乘产生 exp(O(m))·(2m) 仍可，但概率放大层数 (2m) 倍使 zeta 依赖变差；保存全部前缀、完成一次扫全部是更干净的摊销，反过来做会浪费常数但不出错，说明此选择是效率性，并非正确性。[推测] 候选失败路线二：若成本猜测 P 用 2 的幂网格，sam:r0-definition 里的 P/m 偏差 2 倍会传染正确半径的上下界（R <= (1+k)r + k r^0 变成 R <= (1+k)r + 2k r^0 等），全部常数链 5.2、3.42 重推。[推测] 候选失败路线三：dyadic 抽样若不做（用浮点），引导比率论证里"条件同分布"失效，rho^{2m} 只是名义概率，定理的实现条款 "polynomial-time implementation using a bounded number of random bits"（388-389）不成立。

## 6. completion.tex 逐条反推：蓝红绿分色、子模代理与 1.97 因子

### 6.1 段落分工与我最初的误读

我起初以为完成段是采样段的例行收尾（"把球翻译成设施"）。读完 local/采样两段的 promise 结构才明白分工：采样段保证存在一个高概率前缀（球、叶、移除就位），完成段的任务是把这个前缀变成真实解且**不超出 h 个设施**、同时**只用到前缀本身**（不给 O、划分、代理）。完成段还要吃掉两类"目的地"：有代理或有球的坏簇的移除可以直接指向代理/球心（子模世界），而"坏且无球"的簇的移除必须真实指向那些没有球包围的 O 中心（蓝块 DP 世界）；1-19 行的路线图逐字确认了这个分工，并点明蓝块目的地优化是把"无球中心"从子模选择里剥离的关键改造（14-16 行 "The blue destination optimization below separates centers without sampled balls from the remaining submodular choices"）。

### 6.2 Lemma comp:partition-max：带显式误差的范畴连续贪心（completion.tex:34-152）

(a) 陈述逐字（34-49）：

> \begin{lemma}[Categorical continuous greedy with explicit error]
> \label{comp:partition-max}
> Let $g$ be a normalized, monotone, submodular function given by an exact
> value oracle, and let $E$ have a partition into $a$ parts.  For every
> $0<\varepsilon<1-1/e$, a randomized algorithm uses
> $\operatorname{poly}(|E|,a,1/\varepsilon)$ oracle calls and returns a
> feasible $X$ satisfying
> \[
>  \mathbb E[g(X)]\ge(1-1/e-\varepsilon)
>        \max\{g(Y): |Y\cap E_j|\le1\text{ for all }j\}.
> \]
> ... In particular, one obtains the factor $0.62$; more generally,
> for every fixed rational $\theta>1/e$ with $\theta<1$, one obtains
> expected gain at least $1-\theta$ times the maximum.

(b) 我把 CCPV 证明在本例的落点补全。多线性扩展梯度：G(x)=E[g(R_x)]，对 e 属于 E_j 的偏导恰是"其余部件按 x 抽、本部件不抽时 e 的边际"的期望（comp:categorical-derivative）。方向存在性：固定可行最优 O_g，次模望远镜 g_max - g(R_x) <= sum_{e in O_g} Delta_e g(R_x)，再用"删掉同部件元素只增边际"（部件内至多一元素故 R_x 与 R_x\E_j 在 e 的边际上，e 在 R_x 中时左项为 0、右项非负，不等式仍立）得 comp:derivative-direction：sum_j max_{e in E_j} partial_e G >= g_max - G。步数 T = 2 的幂 >= a^2/tau；每步对 Q_0=Tq 个导数各取 L=ceil(Q_0 a^2/(4tau^3)) 个样本均值；边际样本方差 <= M_1^2/4（有界 [0,M_1] 变量），切比雪夫给误差 > tau M_1/a 的概率 <= (M_1^2/4)/(tau^2 M_1^2/a^2) = a^2/(4tau^2) ... 要 <= tau/Q_0：L >= Q_0 a^2/(4 tau^3) 正是解出式。新鲜样本 + 条件成立 -> 全对概率 >= 1-tau（自适应无碍）。选定方向误差：估计偏导与真偏导差 <= tau M_1/a，每部件取最大，误差翻倍给 2tau M_1（comp:estimated-direction）。离散积分误差：耦合 x 与 x+uv 的范畴抽样，每部件以概率 u 换象；他部件变化概率 <= au，边际在 [0,M_1] 内期望漂移 <= auM_1，对 a 个选中坐标乘积再对 u 从 0 到 1/T 积分得 a^2 M_1/T^2（与步衰减合并写成 (g_max - G - 3tau M_1)/T）。递推：G(x^{(T)}) >= (1-(1-1/T)^T)(g_max - 3tau M_1) >= (1-1/e-3tau)g_max（(1-1/T)^T <= 1/e 且 M_1 <= g_max）。估计失败事件概率 tau，其上增益非负，无条件期望 >= (1-tau)(1-1/e-3tau)g_max >= (1-1/e-4tau)g_max；取 tau <= epsilon/4。比特/实现：部件抽样用一枚 [0,T-1] 均匀整数（分母全为 T），dyadic。0.62：1-1/e > 0.6321，误差 < 0.0121 即可。
(c) 机械理由：a^2/tau 步数与 a^2 方差项相乘给总 oracle 数 poly(|E|,a,1/epsilon)，进入 2^{b}poly(N) 级预算时无威胁，因为部件数 a=|A|<=m。为什么需要"填不满的部件可以随意填"（46-47 行）：完成段真实约束是"每球至多选一设施"，但解出的 X 可能部分球空置；填补不降 g（单调）且基数上每球只多开一设施，正好卡在预算 a+c=m 内。theta 版（"1-theta 倍最大增益"）是给 comp:completion 的凸组合 theta Psi(empty) + (1-theta) Psi(X*) 准备的接口。
(d) [推测] 候选失败路线一：不加误差显式界、直接引用 CCPV 的渐近陈述，1.97 与 1+2/e+epsilon 两个数值因子无法闭合（完成段要的是可代入 theta=0.38 的硬界）。[推测] 候选失败路线二：用双线性扩展（每部件独立抽到质量 t 的"分数并"），并非范畴扩展，导数解释里"本部件不抽"换成"本部件已按分数占位"，方向选择出现部件内冲突，partition 可行性破。[推测] 候选失败路线三：oracle 用截断经验均值（中位数法）省样本，随机比特数下降但"每次新鲜样本"的条件化论证要改成 martingale 版本；作者选最朴素的切比雪夫版，[推测] 是因为比特界本来就被 exp(O(m)) 淹没。

### 6.3 蓝块 DP 与红绿子模代理（completion.tex:154-321）

(a) 关键逐字（175-178、195-200、235-240）：

> Set $a=|A|$, $c=m-a$, and $r=m-|Q|$.
> The completion removes $r$ more original facilities and adds at most
> $a+c=m$ real destinations.
>  C(U)=\min_{x\in F}\sum_{\ell\in U}
>        \min_{\substack{s\text{ blue}\\label(s)=\ell}}
>               w'_s d(s,x).                             (comp:blue-block)
>  \Psi(X)=K+\sum_{p\in D}\min\{d(p,H),d(p,X)\}
>   +\operatorname{small}_{b_{\mathrm{red}}}
>        \{w'_s d(s,Z\cup X):s\text{ red}\}.             (comp:surrogate)

(b) 预算恒等式补一步：完成时再从 R^*（|R^*|=|S_0|-|Q|=m-|Q|=r）里删 r 个，新增 <= a（每球一设施，含填补）+ c'<=c（蓝 DP 目的地 <= 块数 <= c）个，得 |U'| <= h-|Q|-r+a+c = h-m+m = h（comp:cardinality 266-269）。蓝 DP 精确性：任何按标签到目的地的分派把 [b] 划分为 <= t 个非交块，每块费用 >= C(块)；反之 D(t,[b]) 的每层最小值都有存证目的地实现；取 min over t<=c 即恰选每标一删、至多 c 目的地的最优。复杂度 2^b poly + c3^b：子集枚举 O(2^b)、转移 sum_{V} 3^b 经典分解。色事件概率（398-414）：指定红/绿/蓝 <= 2r 个中心上色，独立 1/2、1/4、1/4 概率给 >= 4^{-2m}；b 个蓝标签两两互异（dyadic 每标概率 >= 1/(2b)）条件概率 >= b!(2b)^{-b} >= (2e)^{-b}（log b! >= blogb-b+1）。红绿代理的子模性证明我补两处跳步：基础节省 = max(0, max_x [d(p,H)-d(p,x)])，"固定报价的最大值"是标准次模；红色项 small_q = qC - V_q(X)，V_q 用层计数积分表示，被积函数 min(q, |{s: v_s >= t}|) 中每个 x 在层 t 覆盖固定红心集合，新覆盖数与剩余额度都随已选集增大而不增，逐层单调次模、积分保序（v_s 的定义把 d(s,Z∪X) 写成 max 报价形式）。
(c) 机械理由：三色是"目的地类型"的哈希：绿保留（不删）、红走子模世界（目的地是代理或球）、蓝走 DP 世界（目的地是无球的 O 中心、真实距离精确计价）。为什么蓝必须离开子模：无球坏簇的目的地 i 不在任何 E_i 里（E 只含球内设施的拷贝），若塞进子模代理，报价集缺 i 元素、K 项消失，comp:client-charges 里 i 属于 B 的 c_p = d_p* 无从兑现。b_red+b_blue=r 的枚举数 r+1<=m+1 线性。K 作为常数加进 Psi 不影响次模性（对 X 是常数）。small_q 里 q=b_red 是"猜中该删哪些红心"的规模：颜色事件只保证指定红集合可行，最优解可能选别的红心，small 取 q 小者使两条路径都可计价。
(d) [推测] 候选失败路线一：三色概率 1/4 若均分两色（红蓝各 1/2），指定 2m 个中心的事件概率 2^{-2m} 反而更差；1/4 配 b 枚举把最优摊到所有计数上，作者用 (2e)^{-b} 与 4^{-2m} 拼出总 exp(-O(m))。[推测] 候选失败路线二：若蓝 DP 允许一个目的地服务多个标签（不分组），C(U) 的定义就把它折进 min_x，块结构省掉后 DP 塌成 assignment 问题但失去精确性（同一 x 被两类目的地复用会低估）。[推测] 候选失败路线三：若把叶 delta_i 也放进 Z 之外另设报价，代理化 dummy 的"距离被真实设施达成或改进"（274-279 行）失去，实现步骤 cost(U_X) <= Psi(X) 在球内点无处安放。

### 6.4 Theorem comp:completion 与 comp:recovery：1.92 到 1.97 到 1+2/e 的接口（completion.tex:323-577）

(a) 陈述逐字（359-363）：

>  \mathbb E[\operatorname{cost}(U)]
>        \le 2I+\sum_{p\in J}c_p+\sum_{p\notin J}b_p.     (comp:completion-bound)

以及恢复定理数值（531-542）：

>  &\le\left[1+0.38(2+10^{-6})1.2+0.01
>                  +63\cdot10^{-6}+0.38\cdot5.2\cdot10^{-6}\right]P\\
>  &=1.922065432P<1.94P.
>  \Pr\{\operatorname{cost}(U)\le1.97P\}
>  \ge 1-\frac{1.94}{1.97}=\frac3{197}.

(b) 逐式补。c_p/b_p 的三分：J 内客户端（还挂在待删设施 s 上）按 c_p 计价（good 走代理距离；已覆盖走 d_p*+theta(r_i+R_i)；未覆盖走 d_p*）；J 外走 b_p = theta·d(p,H) + (1-theta)min{d(p,H),d(p,X*)}。混合距离 M_s（comp:mixed-distance 387-397）的 theta 加权结构就是把"子模端两评估点 X=empty 与 X=X* 的凸组合"逐目的地拼出来：theta 份来自 empty 端（球目的地经 leaf：d(s,Z∪empty)=d(s,Z) 含叶，即 theta(d(s,w_i)+R_i)），1-theta 份来自 X* 端（真球心 i：(1-theta)d(s,i)），good 代理绿保所以单端 d(s,phi_i)，B 类走蓝 DP 单端 d(s,i)。向每个 J_s 内的 p 报自己簇：good 时 M_s <= d(p,H)+d(p,phi_i)（d(s,Z∪X)>= 经 p 三角），已覆盖时 M_s <= d(p,H)+c_p（展开即 387-447 的链），未覆盖时 M_s <= d(p,H)+d_p*；于是 sum w'_s M_s <= I + sum_J c_p（387 行的"一次取 min 对所有客户通用"是免费的松弛）。基础项：J 上两份 I，J 外恰是 b_p。合并 (convex surrogate)：E[cost] <= theta Psi(empty)+(1-theta)Psi(X*) <= 2I + sum_J c_p + sum_{notJ} b_p。
最终数值链：good 堆 <= P_g+0.01P <= 1.01P 部分（P_g 并入系数 1）；A 堆 sum [P_i + theta·n_i((2+k)1.2dbar + k r^0)] 系数 1+0.38·1.2·(2+1e-6)=1.912000456 支配三堆（1 与 1.85 都小于它）；B 堆 <= 1.85P_B+61T_B；两个 I 各 kappa P（I<=kappa P）：63kappa P = 61k+2k；theta·k·5.2P 来自 r^0 求和。总 (1.912000456+0.01+0.000063+0.0000019760)P=1.922065432P < 1.94P。Markov（547-552）：非负成本、E<=1.94P，cost <= 1.97P 概率 >= 1-1.94/1.97 = 3/197；再乘采样柱 exp(-O_k(m)) 与色/标事件 exp(-O(m))，条件性成立故无需独立假设（557-559）。放大：枚举 P in [1,nDelta]、m in [1,min(M0,h)]，正确猜测的每 guess 重跑 ceil(exp(CM0)log(1/zeta)) 次，全败概率 <= zeta；输出取全候选（含 S 兜底）原成本最小者，无条件界由兜底给。
(c) 机械理由：theta=0.38 的选取要同时 theta>1/e（partition-max 可行，误差 theta-1/e 传给引理）与 1+0.38·2.4·1.2 = 1.912... < 1.94 < 1.97（Markov 端差 3/197 非零）。1/e≈0.36788，0.38 留 0.0121 裕量恰好喂饱"因子 0.62"的表述；成本系数对 theta 线性增，theta 越接近 1/e 系数越小（极限 1+1.2·2/e·... ≈1+2.4/e≈1.883），但误差界 theta-1/e 需要 >0 才能跑引理，所以 0.38 是"能写成一个简单两位小数、又在 Markov 里留出 0.03 间距"的折中，真正的优化留给 refinement 段。为什么 1.97 ，并非 1.94：Markov 要把期望界换成高概率界，1.94/1.97 给 1.5% 成功率/次，乘 exp(-O(m)) 事件后仍是 exp(-O(m))。1.97 与 assembly 的 2-gamma 衔接：gamma<=3/100 保证 1.97<=2-gamma。b_p<=c_p 三条（365-368）让 J 内外计价可以互换粗化，这是 refinement 段重排停止规则时"估计式不随划分改变"的保险丝。
(d) [推测] 候选失败路线一：theta=1/e 恰好取等，partition-max 的 epsilon 需要为 0、oracle 数无穷；任何严格不等号都够但必须可计算地严格，0.38 是把"有理且可验证 >1/e"内化进常数。[推测] 候选失败路线二：若完成段不保留 S 兜底而只信子模输出，蓝 DP 分支 K=无穷（丢标）时输出可能为空解，1.01P 的 m=0 论证链断。[推测] 候选失败路线三：若 Markov 换 Chernoff（逐轨迹有界成本方差），需要成本的上界支撑 <1.97P 的先验，循环依赖；文本只用非负性，这是"期望界 -> 概率界"的最便宜转换。

## 7. refinement.tex 逐条反推：两级停止与 1+2/e+epsilon 的会计

### 7.1 参数表与两段的边界（refinement.tex:1-34）

(a) 逐字（22-27）：

> \begin{equation}\label{ref:parameters}
>  a_1=1+\mu,\qquad a_2=\frac32,\qquad
>  q=1-\frac1{a_1}=\frac{\mu}{1+\mu},\qquad
>  \kappa=\mu^3,
>  \qquad \frac1e<\theta\le\frac1e+\mu,
> \end{equation}

以及 14-16 行的任务声明：

> the task here is to obtain it under the explicit proxy promise with single-exponential dependence on the number
> of bad clusters.

(b) 与采样段的参数对照：主恢复用 a=1.2、kappa=10^{-6}、theta=0.38；精化段把近集参数做成一族：N_i^1 用 a_1=1+mu（贴合代理误差 mu P 的量级）、N_i^2 用 a_2=3/2（贴合半径和引理里 a<=3/2 时 5.5P 的上界，故 11/2 P）。q 是近集人口比例 mu/(1+mu)；kappa=mu^3 把停止误差压到 mu 的三次方，使累计抽样/半径误差 O(kappa+kappa/q)=O(mu^2)（345-347 行逐字："the linear error comes from the proxies, $a_1-1$, and $\theta-1/e$"）。mu<=min{1/4, epsilon/12}（introduction.tex:51-54）。
(c) 机械理由：为什么 linear 项只剩三个：mu（代理误差）、a_1-1=mu（leader 近集放宽一挡）、theta-1/e<=mu（子模端损失）：这三项每一项都各带一个线性系数（2、2、2P 各一），合成 2/e+6mu 里的 6（见 7.3 的展开）。kappa 必须是 mu 的高次幂：它乘以 1/q≈1/mu 变成 kappa/q≈mu^2，仍是高阶小量；若 kappa 取 mu^2，停止误差经 1/q 放大后是 mu，与代理误差同阶、常数吃紧。
(d) [推测] 候选失败路线一：两级近集若共用 a=1.2，q=1-1/1.2=1/6 与 mu 脱钩，误差链里 1/q 是绝对常数 6，看似更好，但第一级 leader 距 i 只有 1.2dbar，good 端 a_1 型估计 d(i,H)<=a_1 dbar+... 需要 N_i^1 与近集定义一致，mu 很小时 1.2>1+mu 使 J 内/外分组的比较（x_i 与 f_i 的关系）失去贴合度。[推测] 候选失败路线二：theta 直接取 1/e+mu/2 之类更贴的值可省常数，但 theta 必须是有理数且可验证 >1/e（1/e 无理），区间 (1/e, 1/e+mu] 内取有理数正是 26-27 行写 "theta is rational" 的原因；实现层面这条不失败，只是记账必须带区间，并非等号。

### 7.2 Lemma ref:two-stage：同一盲采样里的两级停止（refinement.tex:36-191）

(a) 结论关键逐字（88-97）：

>  J\subseteq J^0,\qquad
>  \sum_{p\in J}d(p,H)\le\kappa P,\qquad
>  \sum_{\substack{i\in B:n_i>0\\ f_i<1/3}}
>        \sum_{p\in N_i^2}d(p,H)\le\kappa P.          (ref:second-stop)
>  \sum_{i\in A}n_i r^0(w_i)\le\frac{11}{2}P.          (ref:radius-sum)

(b) 我把两级的运行逻辑补成一张流程图。第一级与采样段 sam 定理同构：T(H)=sum over B 的 N_i^1 距离、I(H)=sum over S_0\Q 的 J_s 距离；T 破则球步（leader 条件到 N_i^1），T 达标 I 破则移除步，双达标停，记状态 H^0。第二级：不再删任何原设施；合格中心固定为 H^0 时刻 f_i<1/3 的非空 i in B^0；只要"末项和"超 kappa P 就继续给合格未覆盖中心加球（leader 在 N_i^2）。W 界补步（127-145）：未覆盖簇逐簇 (1+a_1)P_i + T_i/q（用 near-bound ref:near-bound，来自 sam:near-clients 的一般式）；已覆盖簇逐点 d_p*+(2+kappa)a_2 dbar + kappa r^0：系数 1+(2+kappa)a_2 = 1+3+2e-6·1.5≈4.000003；加上 a_1-1=mu 与 (11/2)kappa（两阶段 leader 都满足 r_i<=a_2 dbar，半径和引理给 (a+4)P 的 5.5P，乘 kappa 得 (11/2)kappa P）：4.000003+0.25+5.5e-3 < 6。good 客户端代理存活 <= P_g+mu P 并入系数 1。于是 W <= 6P + T/q，进展概率 >= T/(2(6P+T/q)) >= kappa/(2(6+kappa/q)) = rho_mu（T>kappa P 时）；I 破时 I/(2W)，用 W<=6P+kappa P/q 同下界。第二级权重单调：参考集只增（球与叶），距离逐点下降，且"旧选择之间序不变"（sam:dummy-metric 的收缩性质）给出 J ⊆ J^0；W(H) <= W(H^0) <= (6+kappa/q)P，进展事件概率再 >= rho_mu。步数：每步删新 S_0 成员或覆盖新坏簇，总量 <=2m。关键句（180-183）：所有叶跨阶段存活，sam:radius-budget 对整条轨迹只施一次，两级共享同一半径摊销预算。引导可在观测不到的 H^0 处切换阶段（188-190），因为 sam:probability 允许引导看整个增广历史；真实过程照旧盲采、保存所有前缀。
(c) 机械理由：1/3 这个 f 阈值在两头各用一次：第二级合格集 {f_i<1/3} 之外剩下的簇（f_i>=1/3）在计费里享受"J 内客户占至少 1/3"的便利（其 J 外客户 <=(2/3)n_i 个，见 7.3），两头对偶出 5/3+2mu/3<=2 与 1+(2/3)a_1 两个系数。J^0 到 J 的收缩是"用第一停时刻的占比 f_i 界定第二停时刻的 x_i"的唯一通道（279-280 行逐字 "this coefficient estimate uses the fraction at the first stop and the inclusion $J\subseteq J^0$"）：第二级只加球不删设施，所以 x_i = |C_i∩J|/n_i <= f_i。R^* 的定义固定在 H^0（删除集最终化），让完成段的 J 与蓝 DP 的候选池在同一时刻定义。
(d) [推测] 候选失败路线一：若第二级也允许移除，J 不再收缩于 J^0，x_i 与 f_i 脱钩，ref:second-coefficient 的 3f_i+(1-f_i)(1+mu) 一步断链，1+2theta 系数退化回 1+2theta a_2，1+2/e 形状丢失。[推测] 候选失败路线二：若两级共享一个停止规则（比如只用 T_near<=kappa P），就没有"H^0 处删除集已定"的事实，完成段的 R^* 与 I 双处计价（2I 项）需要按最终状态重推，误差项从 kappa 级涨回常数级。[推测] 候选失败路线三：若 f_i 阈值取 1/2，合格集缩小、J^0\J 段质量界 (2/3)a_1 换成 (1/2)a_1 更好，但 {f_i<1/3} 与 {f_i>=1/3} 的分组覆盖所有簇是恒等的，真正的约束在系数 3f_i+... 需要 f_i<=1/3 配 a_2=3/2 得 3f_i<=1；阈值 1/3 恰是 3·(1/3)+1=2 里让两项配平的位置，改 1/2 就得改 a_2，连锁重推。

### 7.3 Lemma ref:charges：分组计费与 2/e 的显式出现（refinement.tex:193-348）

(a) 结论逐字（225-228）：

>  \left(1+2\theta a_1+\mu+11\kappa+\frac\kappa q\right)P
>  \le (1+2/e+6\mu)P.                                  (ref:explicit-bound)

(b) 五组簇逐组补推。good：b_p <= d(p,H) <= d(p,phi_i)、c_p=d(p,phi_i)，总 <= P_g+muP（系数 1 + 误差 mu）。一级覆盖 A^1：J 内 c_p=d_p*+theta(r_i+R_i)；J 外 b_p 被 d_p*+theta(r_i+R_i) 控制（d(p,H)<=d_p*+r_i+R_i 且 min{d(p,H),d(p,X*)}<=d(p,H)，theta 凸组合 <= 上限）；r_i<=a_1 dbar、R_i<=(1+kappa)r_i+kappa r^0 给出 r_i+R_i<=(2+kappa)a_1 dbar+kappa r^0，theta 乘后并入：C_i^chg <= (1+2theta a_1)P_i + theta kappa a_1 P_i + theta kappa n_i r^0(w_i)（ref:first-covered；2theta a_1 来自 r_i 与 R_i 各贡献一个 a_1 级项，R_i 的主项 (1+kappa)r_i 折进第二个 a_1）。二级覆盖 A^2：J 内 x_i 份额用球计费 r_i<=a_2 dbar；J 外用 X* 端报价 i 加第一停在 H^0 的 near-bound 估计 b_p<=d_p*+theta(a_1 dbar+T_i/(q n_i))；合并系数 theta(2a_2 x_i+(1-x_i)a_1)，再证 2a_2 x+(1-x)a_1 <= 3f_i+(1-f_i)(1+mu) <= 5/3+2mu/3 <= 2（用 2a_2-a_1=2-mu>0 把 x 换成上界 f）；得 C_i^chg<=(1+2theta)P_i+theta kappa a_2 x_iP_i+theta kappa x_i n_i r^0+T_i/q。剩余大簇 f_i>=1/3：J 内 d_p*；J^0\J 内 b_p<=d(p,H)<=d(p,H^0)（记 E_i^+）；J^0 外至多 (2/3)n_i 个客户用 d_p*+a_1 dbar+T_i/(q n_i)（near-bound 全簇版），合计 (1+(2/3)a_1)P_i+T_i/q+E_i^+。剩余小簇 f_i<1/3（未进 A^2 的合格簇）：J 内 d_p*；J 外 N_i^2 里保 d(p,H)（记 E_i^-，求和被第二停界住）；J 外 N_i^2 外的客户 d_p*>a_2 dbar 把 dbar 换成 (2/3)d_p*（因 dbar<d_p*/1.5=(2/3)d_p*），得 (1+(2/3)a_1)d_p*+T_i/(q n_i)。求和：主系数统一为 1+2theta a_1（其余组系数分别 1、1+2theta、1+(2/3)a_1，都 <= 它：前者因 a_1>=1、theta>1/e>1/3 使 2theta>=2/3 且乘 a_1 更宽）；T_i/q 组求和 <= kappaP/q（不交子集）；半径误差 <= 7theta kappa P（A^1+A^2 合并、x_i<=1、ref:radius-sum）；E^++E^-+两组可忽略基础 <= 2kappaP+2kappaP；2I<=2kappaP。总计 (1+2theta a_1+mu+11kappa+kappa/q)P。最后展开：2theta a_1<=2(1/e+mu)(1+mu)=2/e+(2/e)mu+2mu+2mu^2；kappa/q=mu^2(1+mu)<=mu^2+mu^3；加 mu 与 11mu^3 得 2/e+(3+2/e)mu+3mu^2+12mu^3；mu<=1/4 时 3mu^2+12mu^3<=(3/2)mu，3+2/e+1.5<6。证毕 (1+2/e+6mu)P。
(c) 机械理由：2/e 从哪出来：它是 2theta a_1 的下界侧主项，theta 接近 1/e 是子模 (1-1/e) 增益的镜像：完成段 E[cost]<=theta·Psi(empty)+(1-theta)·Psi(X*)，(1-theta) 乘在"完美目的地 X* 的报价"上，报价系数是 2（每客户 r_i+R_i 两项），所以偏差项恰是 2theta a_1 P_A 型。对比主恢复：theta=0.38 时 1+2·0.38·1.2=1.912；这里 theta≈1/e、a_1≈1 把同一表达式压到 1+2/e≈1.7358，说明 2/e 不是外来常数，是 2·(子模损失率)·(leader 近集伸缩率) 的乘积。q=mu/(1+mu) 出现在 1/q 放大的所有 T_i 项；mu 取 epsilon/12 时 6mu=epsilon/2，给 Markov 留另一半 epsilon（369-372：单次成功概率 >= epsilon/(2(1+2/e+epsilon))）。
(d) [推测] 候选失败路线一：二级覆盖若省掉（一级用 1.2 近集直接给所有覆盖簇计费），系数是 1+2theta a_2≈1+3·0.736=3.2 级别，1+2/e 崩溃；两级近集 a_1/a_2 与覆盖阶段绑定正是让"贵客户群"享受更贴的 a_1。[推测] 候选失败路线二：x_i 若按最终状态定义但用 f_i 上界时忘了 J⊆J^0（7.2 的收缩性质），x_i<=f_i 不成立，3f_i 替换步骤非法。[推测] 候选失败路线三：若 11kappa 里的 4kappa 基础误差合并进 7theta kappa（更精的会计能省几个 mu^3），无失败风险，但文本选 11 这个显式和，[推测] 是为了让 3mu^2+12mu^3<=(3/2)mu 的验证一眼可查。

### 7.4 Theorem ref:recovery 的组装与适用边界（refinement.tex:350-407）

(a) 逐字（362-374）：

>  \mathbb E[\operatorname{cost}(\widehat S)]
>  \le(1+2/e+6\mu)P
>  \le(1+2/e+\varepsilon/2)P.
> ...
> One full trial consequently succeeds with
> probability $\exp(-O_{\mu,\varepsilon}(m))$.

(b) 三事件串联：正确 (P,m) 猜测下两级引导前缀概率 exp(-O_mu(m))（ref:two-stage）；完成颜色标签事件 exp(-O(m))（comp:completion）；条件期望界 (1+2/e+eps/2)P 上 Markov 给条件成功概率 eps/(2(1+2/e+eps))（非负成本足够，无需方差）。乘积仍是 exp(-O_{mu,eps}(m)) 形状（常数随 eps 变）。枚举 P in 1..nDelta、m<=min{h, floor(L_0 log N)}，重复 exp(O(L_0 log N))log(1/zeta) = N^{O(1)}·log(1/zeta) 次：这里单指数 exp(c·L_0 log N) = N^{c L_0} 是多项式当且仅当 cL_0 是**固定**常数，即指数里的 log 底必须配 m<=L_0 log N 的线性；任何 exp(O(m log m)) 型残留都会变成 N^{O(log log N)} 而破坏多项式时间。取最便宜候选收尾，S 保留（m=0 时 (1+mu)P 直接够）。
(c) 393-406 行是本节也是全篇摘要主线的精确落点：loc:anchoring 供给 mu P 精度与 C_mu P/b 计数；要得到 L_0 log N 需要 P/b=O(log N)，assembly 的敏感分支里 b=beta P，恰 P/b=1/beta=O(1)·L/xi；低敏感分支不提供对数计数界，那里只剩 "the fixed improvement below 2"（403-406），即摘要里两个结论的分工。h=O(log N) 时可全 bad 声明（401-402）。
(d) [推测] 候选失败路线一：若精化定理也想服务低敏感分支（P/b 无对数界、m 可到 C_0/xi 级），exp(O(m)) 不再是 N 的多项式，(1+2/e+eps) 只在对数簇数下成立；文本把两分支的界分开陈述正是承认这一失效。[推测] 候选失败路线二：若枚举不含 m 猜小、只用 M_0 上限，r^0 定义里 P/M_0 偏小、半径菜单整体偏移，(sam:upward-radius) 的 prescribe 三分在 r 与 10q 的判界处失效（q 变小使更多事件落进菜单 2/3，预算仍成立但常数链 ref:weight 的 6 变差）。

## 8. strictness.tex 逐条反推：后缀最大值、两段互补松弛与 c(T)

### 8.1 术语的精确含义与我对"严格性"的第一次误判

"有界价格严格性"在本篇的精确含义我起初理解反了两次。第一次以为是"对偶价格 lambda 有绝对上界"；第二次以为是"价格函数对设施数单调"。strictness.tex:37-42 的结论式给出唯一正确的读法：

>  \lambda\le TP_C
>  \quad\Longrightarrow\quad
>  \sum_{p\in C}\alpha_p
>  \le \lambda+\left(2-\frac{c(T)}2\right)P_C.        (str:conclusion)

前提"价格有界"指**比值** lambda/P_C <= T；结论"严格性"指朴素界 lambda+2P_C（来自 imp:comparison 的簇版本 sum alpha <= |H|lambda+2cost(H) 的单体）被**一致地**收紧 c(T)/2·P_C，收紧量与 |C| 无关、与簇是谁无关（43 行："The set $C$ need not be a cluster of the algorithm or of an optimal solution"）。26-29 行定义全部常数：

>  B=T+2,\qquad \rho=\frac{1}{200B},\qquad
>  c(T)=\frac{\rho^2}{100}>0.                          (str:constants)

3-15 行的诚实声明要先记账：这个现象本身是既有工作（CGLS2026 附录 B 的 factor-revealing 分析，JMS 对偶拟合框架下的 gap 1/[4(7+3T)]），更强；本篇的贡献是一个**不同的初等证明**（后缀最大值加两段松弛），外加"迁移到固定有效序列重放"的接线（14-15 行），并且故意保留小 gap（"We retain a small explicit gap because that is sufficient for the payment argument"）。

### 8.2 Lemma str:strictness 逐段四段式

(a) 输入假设逐字（31-33）：

>  v^2\le\frac{c(T)}{6(T+2)}.                            (str:v-condition)

历史性质（66-70）：z_p <= t·d(p,Q_p^-)、alpha_p <= Kz_p、t·d(p,Q_p^+) <= Kz_p（t=1-delta、K=1+v^2），加"该步之后距离不增"；无超投标（74-78）str:no-overbid。

(b) 五段证明我全部补中间步。第一段（后缀不等式）：按重放中删除步给 C 的 q 个客户排 1..q；r_{jp}（81-88）对固定 j 随 p 增大不增：同步删除内恒等，之后 t·d(j,Q^-_p)/K <= z_j 由历史性质、再之后开集只增。关键下界 r_{jp} >= A_p - d_j（104-112）：先由三角与 K>=1 得 r_{jp} >= a_p-d_p-d_j；对 s>=p 用单调性 r_{js} >= r_{jp}... 方向：a_s-d_s-d_j <= r_{js} <= r_{jp}（j<p<s 时"j 对 s 步的 r"<= "j 对 p 步的 r"），取 s 使 a_s-d_s 达后缀最大 A_p。str:no-overbid 里 j<p 的项（不活跃）至少 [r_{jp}-d_j]_+ >= [A_p-2d_j]_+（用 K>=1）；j>=p 全部活跃、贡献 [a_p-d_j]_+。丢掉 C 外客户得 str:suffix。第二段（两段松弛与恒等式）：归一化 sum d=1、lambda<=T。E_p 定义（128-130）。str:suffix 两边对 [x]_+=x+[-x]_+ 展开：左 = (q-p+1)a_p + (p-1)A_p - D_{p-1}·... 精确展开我复算为 (q-p+1)a_p+(p-1)A_p-2D_{p-1}+(1-D_{p-1})... 与 E_p 差 (p-1)(A_p-a_p+d_p)（即 envelope 右端首项），两个正部残量 sum_{j>=p}[d_j-a_p]_+、sum_{j<p}[2d_j-A_p]_+ 移过去得 str:slack-envelope；再把 A_p 换成 a_p-d_p（后缀最大在 s=p 的取值）得 str:slack-truncation，其右端 sum_j[d_j-a_p]_+ = F(a_p) 是全指标和。恒等式 str:slack-identity 我逐项核对：sum_p D_{p-1}=sum_j (q-j)d_j、sum_p (p-1)d_p=sum_j (j-1)d_j，两和相加 = (q-1)sum_j d_j = q-1（每个 d_j 的系数 (q-j)+(j-1)=q-1），故 Ebar = lambda+1+(q-1)/q - sum a_p = lambda+2-1/q-sum a_p。第三段（小赤字三推论）：设 Delta=lambda+2-sum a_p<c。envelope 首项非负 + 恒等式给 0<=Ebar=Delta-1/q<c（str:small-deficit），于是 1/q<c、q>1/c。F 凸减：mean a_p <= lambda+2-1/q < B，Jensen + truncation 给 F(B/q) <= F(mean a) <= Ebar < c（str:jensen）。小集质量 str:small-set-mass：|J|<=2rho q 时 sum_{j∈J}d_j <= |J|B/q + F(B/q) < 2rho B + c = 1/100+c<1/50（每个 d_j <= 其超过 B/q 部分 + B/q；超部分总和 <= |全集|·... 取 J 全集上界 F）。第四段（尾部指标）：{d_j>2B/q} 的个数 < cq/B（每个对 F(B/q) 贡献 >B/q）；{E_j>1/10} 的个数 <10cq（均值 <c）。r=floor(rho q)：尾部 r 个指标不落于两例外集之并，因 r/q >= rho-1/q > rho-c > (10+1/B)c；末步验证：B>2、rho=1/(200B)<1/400，(11+1/B)c < 12c = 12rho^2/100 < rho（rho<100/12·... 即 rho < 8.33，恒真；实质用 12rho^2/100<rho ⟺ rho<25/3）。取 s 在尾部使 d_s<=2B/q、E_s<=1/10。后缀 <=rho q 个小集质量 <1/50：D_{s-1}>49/50。(q-s+1)d_s <= r·2B/q <= 2rho B = 1/100。E_s 定义移项：q(a_s-d_s)=lambda+1+D_{s-1}-(q-s+1)d_s-E_s > lambda+1+0.98-0.01-0.10 = lambda+1.87（str:tail-large）。第五段（早段区间逼出松弛）：I=[ceil(rho q), floor(2rho q)]；p in I 时前缀 p-1<=2rho q 个小集，D_{p-1}<1/50，丢两项非负、留 -E_p：q(a_p-d_p) < lambda+1.02（str:early-small）。且 p<=2rho q < (1-rho)q+1 <= q-r+1 <= s，故 A_p >= a_s-d_s。合并：E_p >= (p-1)(A_p-a_p+d_p) > (p-1)(1.87-1.02)/q = 0.7(p-1)/q。取整验证（222-228）：x=rho q>4 时 |I|>x-1>x/2、p-1>=ceil(x)-1>x/2。Ebar >= (1/q)sum_{p∈I}E_p > 0.7·(x/2)(x/2)/q^2 = 0.175rho^2 > rho^2/100 = c，与 str:small-deficit 矛盾。得 sum a_p <= lambda+2-c。末段（回最终预算）：alpha_p <= Kz_p = K^2 a_p；K^2-1=2v^2+v^4<=3v^2（v<=1）；sum alpha <= K^2(sum a) <= K^2(lambda+2-c) = (lambda+2-c)+(K^2-1)(lambda+2-c) <= lambda+2-c+3v^2 B <= lambda+2-c+c/2（str:v-condition：3v^2 B <= 3·c/(6B)·B = c/2）。乘回 P_C（a、alpha、lambda 全除过 P_C）：sum alpha_p <= lambda+(2-c/2)P_C。
(c) 机械理由：c(T) 的形状 rho^2/100 = 1/[100·(200B)^2] 是 Theta(T^{-2})：矛盾链里 0.175rho^2 对 c 的比较要求 c < 0.175rho^2，取 c=rho^2/100 留 17 倍裕度；rho 里的 200 = 2·100 服务于小集质量式里 2rho B = 1/100 这个固定小数（rho=1/(200B) 使 2rho B 恰为 0.01）。B=T+2 是归一化后 lambda+2 的先验上界（对偶比较的"全支付"端）。t=1-delta 与 K=1+v^2 把 z 与 alpha 夹在 K 倍内，末段 K^2 放大恰好由 v 条件吸收，这是 v 出现在假设里的唯一原因：严格性本体只关于 a_p，v 负责把 a_p 界转回 alpha_p 界。q>1/c 的分支去哪了：|C|=1 时任何 alpha_p <= Kz_p <= ... 单客户预算界 lambda+2P_C 减去任何正 gap 不显然；反证法里 q 大是结论（小赤字迫使 q>1/c>4/rho），若 q 小则 str:small-deficit 的 1/q<c 直接违例，矛盾更早，所以"客户数少"这一情形被 1/q 项自动排除，这是"gap 与 |C| 无关"（uniformly in the number of clients，intro 262-263）的实现机制。
(d) [推测] 候选失败路线一：若照搬 CGLS2026 附录 B 的 factor-revealing LP，本篇要额外证明它的对偶在本重放下仍有序变量与首连约束（9-11 行明说那些前提在有限对偶下不需要，但迁移到"最终有效序列+自由开设施+见证超集+同时阶段更新"仍需逐条核对）；作者改走初等路线正是为了绕开"外部 LP 的最优性依赖搜索阶段，并非最终重放"的接缝。[推测] 候选失败路线二：后缀不等式若只用 A_1（全局后缀最大）替代逐步 A_p，早段区间与尾部的分离失效：E_p 的包络需要"从 p 出发的未来最大"才能同时被尾部 s 抬高、被早段 p 压低。[推测] 候选失败路线三：若 str:no-overbid 取"后步"状态，并非前步（活跃集已缩小），r_{jp} 的单调性证明在 j 与 p 同步删除的场合断链（86-88 行专门为同步删除定义 r_{jp}=z_p）。

### 8.3 严格性在全篇被消费的位置

surplus.tex 的两处调用（见第 10 节）是 c(T) 唯一的用户：小价格分支对**所有**非空簇用 lambda<=2<=T P_i（正整数度量 P_i>=1 供分母下界）；正常分支只对 B_T={bad: lambda<=T P_i} 用。摘要里"总代理误差足够小、簇只有对数多个"的语汇在此对应物是："价格相对簇成本有界"的部分坏簇，其成本份额 Q>P/20 时支付端拿到 cQ/2 的改进。两处共同点：严格性把"付给开设施的 lambda"与"客户预算的收取"之间的 2 倍连接系数压到 2-c/2，同时 lambda 全额保留在右端（intro 117-119："Crucially, the entire opening payment lambda remains available"），这正是它敢用于总支付链的原因。

## 9. imports.tex 逐条反推：外部证书、一次重放供给全部不等式

### 9.1 本节的真实身份与我起初的误判

我第一次把 imports.tex 当作"相关工作转述"。读完后修正：它是全篇唯一与外部算法交互的接口层，声明了两件不能自证的事：其一，对数盈余构造（CGLSS2026 之 arXiv:2503.10972v2，2026-05-19 版）作为黑盒给出"h 个付费正规设施 + 至多 L 个自由副本"或"小价格纯正规"两种输出之一（imp:cglss）；其二，本篇把该黑盒的**一次最终执行**重放出来，从同一条历史同时导出预算不等式、无超投标、最终对偶、支付与比较五套式子。8-9 行逐字：

> We use its logarithmic-surplus construction and its robust dual analysis.
> The strictness proof below will be applied to the resulting certificate.

108-114 行的方法论声明最关键：

> Before that verification, we prove what follows from any valid-sequence
> output of either form. Fix its final price and copy lengths and replay
> only its returned sequences. The preceding interpolation search is not
> part of this history.

"搜索历史不是历史"：插值搜索里设施被删、价格被改、副本被挪，那些中间执行不产生任何被引用的不等式；只有最终序列的确定性重放才同时给出三套结论（intro 104-105 与 253-259 也反复强调"one final price, one set of final copy lengths, and the budgets of one actual replay"）。

### 9.2 开设施定义与外部定理（imports.tex:11-106）

(a) 逐字（13-17、44-63 节选、83-98）：

> Fix a sufficiently small rational
> $v\in(0,1/6)$ and put
>  \delta=3v,\qquad K=1+v^2,\qquad \lambda=2f>0
>  \tau_j&=z &&(j\in A_W,\ d(i,j)>vz),\label{imp:near-bids}\\
>  z\le\tau_j&\le\min\{Kz,(1-\delta)d(j,W)\}
>        &&(j\in A_W,\ d(i,j)\le vz),\label{imp:bid-cap}
> \sum_{j\in A_W}[\tau_j-(1-\delta)d(i,j)]^+
>  &+\sum_{j\in I_W}[(1-\delta)d(j,W)-(1-\delta)d(i,j)]^+
>  \ge\lambda-n\eta,                        (imp:opening-payment)
> \sum_{j\in A_W}[\tau_j-d(i_0,j)]^+
>  +\sum_{j\in I_W}[\tau_a-2d(i_0,j)-d(i_0,a)]^+
>   \le\lambda                             (imp:opening-dual)
> \item A solution of $\eta$-valid sequences with exactly $h$ distinct
> regular facilities and at most $L=O_v(\log N)$ free copies...
> \item A solution of $0$-valid sequences containing only regular
> facilities, at price $f=N^{-2}$, with at most $h$ facilities.

(b) 定义逐条拆：A_W 是相对见证集 W 的活跃集（z < (1-delta)d(j,W)）；近旁客户（距新设施 <=vz）的出价可上调但不超过 Kz 与自身缩放连接距的较小者，远处客户出价钉死在 z。上调窗口 [z,Kz] 与近旁半径 vz 的组合就是"每个开设施只激活得了它近旁的人"的机关（191-201 行：预算上调的客户立即转不活跃，因为 (1-delta)d(j,Q∪{i}) <= (1-delta)vz < z <= tau_j，其中 (1-3v)v >= v-3v^2... 精确：z-(1-delta)vz = z(1-(1-3v)v) = z(1-v+3v^2) >= 0，且 tau_j >= z 严格大于缩放新距离）。有效性：每条目是自由副本或对某见证超集 W ⊇ 实际前缀的 eta-可开正规设施；终止极大性要求对**实际**末集不存在 0-可开的未开正规设施（eta>0 时极大性仍按精确 0 口径，76-78 行）。价格 f 与副本长度的二分搜索以 eta=2^{-N} 精度执行。
(c) 机械理由：lambda=2f 的 2 是 JMS 传统（连接放大系数 2 的对偶价格）；K=1+v^2 的指数式增长让阶段数 O(log Z/log K)=O_v(log N)。imp:opening-dual 里 i_0 遍历 F 同时检验自由副本：副本只增大被减距离（63-65 行），检验正规设施自动覆盖。两分支的分工：正常分支给"恰 h 付费 + L 免费"结构，小价格分支（f=N^{-2}）是插值下端点不可达时的替代解，其支付式不带容差 eta（因为 0-valid）。
(d) [推测] 候选失败路线一：若见证 W 允许比实际前缀小（非超集），上调窗口论证失效：预算上调的客户可能距 W 远而距实际 Q 近，196-201 的"立即不活跃"断链。[推测] 候选失败路线二：若极大性也放宽到 eta（对实际集无 eta-可开设施），无超投标不变量的反证段（244-279）里构造的 0-可开见证不再矛盾，不变量失守；文本死守"exact 0-openable"措辞（76-78 行）不是偶然。

### 9.3 Lemma imp:surplus-history：五套不等式同源（imports.tex:116-510）

(a) 五套结论逐字（135-178，编号节选）：

>  z_p&\le(1-\delta)d(p,Q_{t(p)}^-),\label{imp:active-threshold}\\
>  \alpha_p&\le Kz_p,\label{imp:final-cap}\\
>  (1-\delta)d(p,Q_{t(p)}^+)&\le\alpha_p\le Kz_p.   (imp:post-removal)
>  \sum_{j\notin I_t}[z_p-d(i,j)]^+
>  +\sum_{j\in I_t}[(1-\delta)d(j,Q_t^-)-d(i,j)]^+
>  \le\lambda.                                      (imp:no-overbid)
>  \sum_{p\in D}[\alpha_p-2d(i,p)]^+\le\lambda
>  \qquad(i\in F).                                  (imp:dual)
>  (1-\delta)\operatorname{cost}(U)+h(\lambda-N\eta)
>        \le\sum_{p\in D}\alpha_p,                  (imp:payment)
>  (1-\delta)\operatorname{cost}(U)+r\lambda
>        \le\sum_{p\in D}\alpha_p.                  (imp:small-payment)
>  \sum_{p\in D}\alpha_p
>        \le |H|\lambda+2\operatorname{cost}(H).    (imp:comparison)

(b) 无超投标不变量（226-279）我把反证补全：B_i = sum_A [z-d(i,j)]_+ + sum_I [c_j-d(i,j)]_+（c_j=(1-delta)d(j,Q)）。初始：所有活跃客户 z=1、距离 >=1，全为零。开设施步单调：旧不活跃 c_j 不增、活跃留任 z 不变、转不活跃者新 c_j <= 其出价（<= z，出价上调只发生在 vz 近旁且其新缩放距离 < z 如 9.2(b)）。自由开设施无预算上调同结论。阶段更新步：极大序列后用旧活跃集 A 定义 b_j(t)=min{t,c_j}（z<=t<=Kz），B_i(t) 连续、B_i(Kz) 即更新后不变量值。若某未开设施 i 违例 B_i(Kz)>lambda：取首次越界 t_* 与首个越界者 i（Q 内设施 B_i(t)=0 恒成立，因 c_j<=... 对 j 活跃 z<=c_j 与 d(i,j)：i 已开则活跃客户 z <= c_j <= (1-delta)d(j,Q) 而 d(i,j) <= d(j,Q)... 实际论证用 i 在 Q 时每项 [b_j-d(i,j)]_+ =0，因 b_j<=c_j=(1-delta)d(j,Q)<=d(j,Q)，而活跃客户 z<=c_j 同）。对 i 出价 tau_j=b_j(t_*)（近旁）或 z（远处）：远客户需要 b_j-z <= delta d(i,j)：b_j(t_*)<=Kz 故左边 <= v^2 z；远即 d(i,j)>vz，delta d(i,j) > 3v·vz = 3v^2 z >= v^2 z（258-266 行的 3v^2z 出处）。近客户用 b_j 自身成立。不活跃客户 [c_j-(1-delta)d(i,j)]_+ >= [c_j-d(i,j)]_+。于是支付侧 >= B_i(t_*)=lambda >= lambda-n·0。对偶侧：tau_a <= c_a 与三角给 tau_a - d(i_0,a) - 2d(i_0,j) <= c_j - d(i_0,j)（270-274），活跃 tau_j <= b_j(t_*)，故 imp:opening-dual 左端 <= B_{i_0}(t_*) <= lambda 对一切 i_0：i 是 0-可开未开设施，与极大性矛盾。不变量得证于恰好所需的"实际原子边界"状态。支付势（281-319）：cal P = sum_I(beta_j-(1-delta)d(j,Q)) - r_Q(lambda-n eta) 初始 0、各步不减（开正规设施时新增的活跃转不活跃者新松弛 >= 其出价贡献、总和 >= lambda-n eta；自由开不降；阶段更新新不活跃松弛恰 0），终止给 imp:virtual-payment。最终对偶（321-489）逐行核对：冻结定义 d(i,h) <= (1+3v)z/2；D^*={alpha_j > 2d_j} 按删除步排序、平局按最终预算非降（该规则专为 386-390 行 c_j=alpha_j>=alpha_k 服务）。pre-freeze 行：被正规开设施 h 移除的 k 之前，任何贡献者不可能预算上调（上调需 d(h,j)<=vz，而 2d_j >= 2d(i,h)-2d(h,j) > (1+v)z >= Kz >= alpha_j 违 D^*，其中第一个 > 用冻结前 d(i,h)>(1+3v)z/2）；故 alpha_k=z，套无超投标。阶段更新移除：用更新后边界，alpha_k=c_k<=Kz；同更新不活跃 j>=k 有 c_j=alpha_j>=alpha_k（平局规则）。求和无冻结者时 telescope 计数：预算系数 m、距离系数 q+2(m-q)+(q-1)=2m-1。有冻结开设施时：先证每个 j in A∩D^* 恰在此开设施被移除且 alpha_j=b_j：若留活跃，之后所有见证含 h，出价被 (1-delta)d(j,h) 封顶，而 2d_j >= 2d(j,h)-(1+3v)z > (1+9v^2)d(j,h) > alpha_j（用 (1+3v)(1-3v)=1-9v^2），与 alpha_j>2d_j 矛盾。三类行 R/P/T 求和：距离系数表 R: 2m-1、T: 2m-t、P: 2m-p，全部 <=2m，除以 m 收工。自由副本首冻结（448-455）：P 置空、T=A∩D^*，只用实际不变量加三角行，不要求见证或开设施对偶：这就是 454-455 行"supplies the free first-freezing case omitted by the invocation of an opening-dual condition in the cited proof"的落点。投影与基数（491-500）：副本投回宿主不增距，|U|<=h+L；投回重合不减付费数 h（498-499）。imp:comparison 由逐簇 alpha_p <= 2d(i,p)+[alpha_p-2d(i,p)]_+ 求和加 imp:dual。
(c) 机械理由：为什么 imp:small-payment 的 r lambda 项"可以整段丢掉"（171-172 行）：小价格分支 lambda=2/N^2、r<=h<=N，支付项 r lambda <= 2/N 是 o(1)，surplus 段把它当 c/200 级误差处理。为什么无超投标要在"实际"边界，并非见证边界成立：严格性段的 str:no-overbid 用的正是实际前缀 Q_p^-；见证超集只出现在开设施合法性里。为什么 Kz 上限出现两处（final-cap 与 post-removal 夹逼）：严格性段只需要 alpha_p <= K z_p 与 a_p=z_p/K 的配对，K^2 因子在那里被 v 条件吸收。
(d) [推测] 候选失败路线一：直接引用源文 Lemma A.2 的最终对偶会漏"首个冻结开设施是自由副本"这一情形（源文以开设施对偶条件覆盖正规开设施），本篇 448-455 行补的正是这个洞；若缺它，surplus 段对 B_T 簇求 imp:comparison 时预算向量与对偶向量可能不同源，"All three conclusions therefore refer to the same budget vector"（intro 258-259）不成立。[推测] 候选失败路线二：排序若平局按任意序，阶段更新同组移除的 c_j=alpha_j>=alpha_k 不再保证，pre-freeze 行的双重计数出现负余量。[推测] 候选失败路线三：若用搜索期历史（带删除与价格变动）重放，无超投标不变量在"设施撤除"步不封闭（不活跃客户的 c_j 会回升），支付势 cal P 单调性断。

### 9.4 参数落地与相位计数（imports.tex:512-634）

(a) 关键逐字（521-531、589-605、618-627）：

> Initialize at $f=N^{-2}$ and retain the source's
> upper price $4nM$...
> At this upper endpoint, the first opening in an unmerged execution
> satisfies $nKz\ge\lambda=8nM$ ... The upper-endpoint solution
> therefore has one facility, as required
> to bracket $h\ge2$.
> Replace the fixed disabling length $10M$ used for
> free copies in the source's Section~3.5 by $20NM$.
>  KZ\le\frac{37}{36}(M+8NM)<10NM<(1-\delta)20NM.
> The total payment error in the normal branch is
>  e=hN\eta\le N^2 2^{-N}.                               (imp:precision)

(b) 上端点夹断的推导补全：lambda=2f=8nM；首个开设施要在活跃客户出价里凑够支付，n 个客户每人至多 Kz，故 nKz >= lambda 意味某活跃客户... 文本论证：所有活跃出价 <= Kz，支付 <= nKz；若 z <= M 则 nKz <= nM(1+v^2)... 反证给 z > M：z<=M 时最大支付 n·M·K <= nM(1+1/36)<8nM=lambda，无法开任何设施，序列只能以阶段更新推到 z>M。z>M 时任何客户距任何设施 <=M<z，首个开设施使全体不活跃；后续总支付（切换费）<= nM < lambda，不再开设施：上端点解恰 1 个设施。下端点 f=N^{-2}：不测支付只测基数，<=h 就直接返回小价格解。失能长度：任何活跃边界 z <= M+lambda <= Z（无超投标取 i 任意：[z-d(i,j)]_+ <= lambda）；KZ <= (37/36)(M+8NM)（v<1/6 时 K=1+v^2<37/36）< 10NM < (1-delta)20NM（delta=3v<1/2 给 (1-delta)>1/2），故 20NM 长的副本既不能激活客户、也不能触到任何 <=Kz 的出价帽、还不改变不活跃连接距：长度搜索的该端点"只剩标签效应"。相位上界：z 从 1 几何涨到 Z，O(log Z/log K)=O_v(log N) 个活跃相位；每相位至多 3 个自由副本（merge 的性质），L=O_v(log N) 对全部目标 h 统一。精度序（618-634）：e<=v<=vP 对 N>=N_v；更小的 N 划入 k<=2L 分支（那里恢复全 bad 声明处理），故常数可定序为：局部/严格性常数先取、再取 v、再放大 L，链条单向。
(c) 机械理由：20NM 对 10M 的放大买的是"与 n、|F| 无关的统一失能"：源文 10M 只管距离维度，本篇里副本还参与无超投标的出价帽比较，需要压过 KZ 这个 lambda 诱导的上界；37/36 与 10 之间的余量被 N>=3 兜住。插值端点的付费数区分（576-587）：零长副本与宿主几何重合但付费计数差一，源文两处端点恒等式不能当付费数等式用，必须逐端点显式测 h；"变化一不会从 <h 跳到 >h"给整数夹逼。
(d) [推测] 候选失败路线一：保留 10M 失能长度，当 lambda 接近 8NM 级时 KZ 可能超 (1-delta)10M，长度端点开始干扰可开性测试，相位数上界与 L 的一致性失去。[推测] 候选失败路线二：二分精度若取 eta=2^{-N}/2 之类更细值不坏，粗于 eta/2 则参数迁移的 n eta 累积违 imp:payment 的 h(lambda-N eta) 形式（535-538：价格差 eta/2 变 lambda 差 <= eta <= n eta 用的是 n>=1）。[推测] 候选失败路线三：把小 N 情形交给"预处理表"，并非 k<=2L 分支会破坏统一算法陈述（概率界对全部 N 同形），文本的分支归并（630-633）是自洽的唯一低成本方案。

## 10. surplus.tex 逐条反推：低敏感分支与 10P 标尺的拼装

### 10.1 定参顺序与命题陈述（surplus.tex:11-55）

(a) 逐字（13-39、41-55）：

> Set $T=200C_0$ and $c=c(T)$ as in Lemma~\ref{str:strictness}.
>  v\le\min\left\{\frac1{12},\frac{c}{1000}\right\},
>  \qquad v^2\le\frac{c}{6(T+2)},
>  \qquad \delta=3v.                        (sur:parameter-choices)
>  N^2 2^{-N}\le v,\qquad 2/N\le c/200.      (sur:size-threshold)
> With these fixed parameters, suppose $k>2L$ and
>  \operatorname{opt}_{k-2L}\le(1+\xi)\operatorname{opt}_k.   (sur:sensitivity)
> Put $h=k-L$. ...
>  \operatorname{cost}(S)
>  \le\left(2-\frac{c}{100}\right)\operatorname{opt}_h
>  \le\left(2-\frac{c}{100}\right)(1+\xi)
>        \operatorname{opt}_k.               (sur:conclusion)

(b) 定参链：C_0（锚定）-> T=200C_0 -> c=c(T)（严格性）-> v 同时满足三条件（1/12 给标尺 10P 收尾、c/1000 给除 (1-delta)、v^2 条件给 K^2 回预算）-> N_* 让两小量指数衰减到位 -> L 抬到 >= N_*。54 行" The algorithm does not need to test Equation~\eqref{sur:sensitivity}"呼应 assembly 的双盲结构。
(c) 机械理由：T=200C_0 的 200 服务于后面 P/25 一步（m lambda <= 8C_0 P 除以 T 得 8/200=1/25）；v<=1/12 在 b(L+N_short)<=10P 的尾部 (19/24)e<=19vP/24<=19P/288 与 11/6+1/28 之和远小于 10 里只用了 1/12 的 2% 裕度，1/12 真正被吃紧处是 delta=3v<=1/4 保证 (1-delta)>=3/4（后见除法段）；2/N <= c/200 喂小价格分支的 h lambda <= 2/N <= c/200·P。
(d) [推测] 候选失败路线一：若 T 取小于 8C_0·(25/3) 之类，被排除坏簇的总成本界 P/25 恶化到与 P/10 同量级，Q>P/20 的比较断链。[推测] 候选失败路线二：N_* 若不设，小 N 上 e<=vP 失效（N^2 2^{-N} 先升后降，N=2 时 1/2>v），必须或者设阈值或者把小 N 划给恢复分支；文本选了后者加 L 抬升的合并方案。

### 10.2 证明主干：两分支、双色短簇与 dichotomy（surplus.tex:57-231）

(a) 标尺拼装逐字（163-171）：

>  b(L+N_{\rm short})
>  &\le\left(\frac{19}{12}+\frac\xi4\right)P+\frac{19}{24}e
>  \le10P.                                    (sur:anchoring-scale)
> Since $|S|-h=L$, Equation~\eqref{sur:anchoring-scale} is precisely the
> scale hypothesis of Theorem~\ref{loc:anchoring} with tolerance $1/100$.

以及坏价（177-179）、求和改进（206-210）：

>  m\lambda=8mb\le8C_0P.                        (sur:bad-price)
>  \sum_p\alpha_p
>  \le h\lambda+2P-\frac c2Q
>  \le h\lambda+\left(2-\frac c{40}\right)P.    (sur:summed-gain)

(b) 我把最密的几处补步。局部搜索衔接（61-67）：U 补到 k 个、以它为起点跑 width-5 下降得 |S|=k、cost(S)<=cost(U)：起点非空由 U 非空（h>=2）。小价格分支：每非空簇 P_i>=1（正整数度量）而 lambda=2/N^2<=2<=T P_i（T=200C_0>=200>2 绰余）；str:strictness 逐簇：sum alpha over C_i <= lambda+(2-c/2)P_i；(1-delta)cost(U) <= sum alpha <= h lambda + (2-c/2)P <= (2-c/2+c/200)P；再 (1-delta) 除法：cost(U) <= [2-c/2+c/200+(2-c/100)delta]P... 文本口径把 delta 项合并：c/200+(2-c/100)delta <= c/200+6v <= 11c/1000 < 49c/100 = c/2-c/100，移项即 cost(U) <= (2-c/100)P。正常分支价格比较（119-129）：payment 与 |H| 比较拼 (h-|H|)lambda <= 2cost(H)+e；H 取 k-2L=h-L 中心最优：L lambda <= 2(1+xi)P+e。短簇双色法（132-160）：b=lambda/8；对每个短中心固定最近异中心 nu(i)；独立两着色，取"自己第一色且 nu(i) 第二色"的短中心集 R，每短中心入选概率 1/4，期望论证给某着色 |R|=N'>=N_short/4；R 内无 i 有 nu(i) in R（颜色互斥），故 O\R 非空、每 i in R 的客户重路由到 nu(i) 增 <b：cost(O\R)<=P+bN'；代入价格比较（|H|=h-N'）：lambda N' <= 2P+2bN'+e；2b=lambda/4 移项 (3/4)lambda N' <= 2P+e；乘 4：lambda N_short <= (32/3)P+(16/3)e。合并：b(L+N_short) = (lambda/8)(L+N_short) <= (1/8)(2(1+xi)P+e+(32/3)P+(16/3)e) = (19/12+xi/4)P+(19/24)e <= (11/6+1/24+19v/24)P <= 10P 绰裕（xi<=1）。这正是 loc:anchoring 的 scale-condition：b·(ell+q_0) <= 10P，ell=|S|-h=L、q_0=#{n_i sep_i<b}<=N_short（短定义一致：b 同值）。锚定 mu=1/100：代理误差 0.01P、m<=C_0 P/b=C_0·8P/lambda -> m lambda <= 8C_0 P。 dichotomy：P_b<=P/10 走 loc:small-bad-cost 的 1.432P；否则 B_T 圈出"价格有界"的坏簇：被排除者逐个 P_i<lambda/T，总 < m lambda/T <= 8C_0P/(200C_0)=P/25；Q >= P_b-P/25 > P/10-P/25 = 3P/50 > P/20。逐簇预算：B_T 成员 lambda+(2-c/2)P_i、其余（含空簇）lambda+2P_i、good 亦 lambda+2P_i：sum alpha <= hlambda+2P-(c/2)Q <= hlambda+(2-c/40)P。与 payment 对消 hlambda：(1-delta)cost(U) <= (2-c/40)P+e。除 (1-delta)：需 e/P+(2-c/100)delta <= c/40-c/100=3c/200；e/P<=v、delta=3v、(2-c/100)<=2：v+6v=7v<=7c/1000<1.5c/100=3c/200。得 cost(U)<= (2-c/100)P。最后 P=opt_h<=opt_{h-L}<=（sensitivity 单调链）(1+xi)opt_k：注意 opt_h<=opt_{k-L} 不直接，用 h=k-L>h-L=k-2L 且 opt 随预算增大不增：opt_h<=opt_{k-2L}... 方向：opt 对 k 递减，h=k-L 的 opt_h <= opt_{h-L}=opt_{k-2L} <= (1+xi)opt_k ✓（226-227 行逐字 "P=\operatorname{opt}_h\le\operatorname{opt}_{h-L}"）。
(c) 机械理由：为什么先局部搜索再比较（61-67 与 174 行锚定都作用于 S 而支付链作用于 U）：cost(S)<=cost(U) 只借下降性；锚定要求 S 是 width-5 局部最优（loc:anchoring 假设）；支付链要求 U 的历史证书。S 同时承担"局部最优锚"与"最终候选"两个身份，一条 cost(S)<=cost(U) 把两半缝合，这是 completion 与 refinement 分工之外"surplus 与 strictness 分工"的第四处文本接缝：surplus 段用严格性改进的是**支付-预算**链（总成本），refinement/completion 用恢复改进的是**指派-目的地**链，assembly 里两链按敏感/不敏感二选一。b=lambda/8 把"短簇数"与"盈余设施数"折进同一个 10P 标尺：8 让 m lambda = 8mb 系数干净。
(d) [推测] 候选失败路线一：短簇若不用双色法而直接全体重路由，O\R 可能为空（全体互为最近邻的成对簇）且重路由互相冲突（i 的路由目标 nu(i) 也被删）；双色一刀切出无环子集，概率法给 1/4 系数，是 Alon-Yuster 式标准修复，缺它则 cost(O\R)<=P+bN' 的 N' 只能取 1。[推测] 候选失败路线二：锚定容差若取 mu=1/10（，并非 1/100），1.432 变成 (6/5)(1.1)+(11/5)P_b/P 界恶化，小坏成本分支与 2-c/100 的比较需要 c<... 裕度反噬；mu 同时进 C_0（=10+60000·2^{3999} 由 40/mu 得 4000）与 0.01 误差项，1/100 是把两边都写成一串干净小数的最大圆整。[推测] 候选失败路线三：若对 B_T 也要求 str:strictness 的 C 非空正成本之外再要求"簇是算法簇"，引理 43 行的普适性被浪费；反过来说明该引理为何刻意对任意非空 C 证明。

## 11. assembly.tex 逐条反推：敏感度二分、M_0 与最终常数链

### 11.1 定序与敏感基数引理（assembly.tex:8-76）

(a) 逐字（13-17、32-49、113-116）：

>  \gamma=\min\{3/100,c/100\},\qquad
>  \xi=\varepsilon_0=\gamma/16,\qquad
>  \sigma=\gamma/4.                             (asm:constants)
> Suppose $k>2L$, $0<\xi\le1$, and
>  \operatorname{opt}_{k-2L}>(1+\xi)\operatorname{opt}_k.
> Put $\beta=\xi/(4L)$. There is an integer $h'$ with
> $k-2L<h'\le k$ such that
>  \operatorname{opt}_{h'-1}\ge(1+\beta)\operatorname{opt}_{h'},
>  \qquad
>  \operatorname{opt}_{h'}\le(1+\xi)\operatorname{opt}_k.   (asm:sensitive-ratios)
>  n_i\operatorname{sep}_i\ge\beta P,
>  \qquad \operatorname{sep}_i=d(i,O\setminus\{i\}).         (asm:separation)
>  M_0=\left\lceil\frac{4C_0L}{\xi}\right\rceil,
>  \qquad\text{failure parameter }\zeta.                     (asm:count-bound)

(b) 乘积论证补全：2L 个比值 opt_{r-1}/opt_r（k-2L<r<=k）之积 = opt_{k-2L}/opt_k > 1+xi。log 求和 > log(1+xi) >= xi/2（0<=xi<=1 时 log(1+x)>=x/2 于 x<=1：积分 1/(1+t)>=1/2）。若所有比值 < 1+beta，和 < 2L·log(1+beta) < 2L beta = xi/2，矛盾；故存在 >=1+beta 者，取最大指标 h'。h' 之后所有比值 < 1+beta，其积 <= (1+beta)^{2L} < exp(2L beta)=exp(xi/2)<=1+xi（末步 0<=xi<=1 时 e^{xi/2}<=1+xi：凸函数在 0 与 1 端点验证）。opt_{h'} = opt_{h'}/opt_k · opt_k... 由 h' 之后比值积 <1+xi 即 opt_{h'} <= (1+xi)opt_k ✓。分离：删 i 保留其余指派，客户改挂最近他中心 j，增 <= n_i·sep_i（每客户经 i 到 j 的三角：d(p,j) <= d_p* + d(i,j)，取 min_j 得 d(p,O\{i}) <= d_p*+sep_i），成本 <= P+n_i sep_i >= (1+beta)P（h' 的敏感比），故 n_i sep_i >= beta P；空簇 n_i=0 违此式，所以"该最优没有空簇"（74-75 行逐字）。h'>=k-2L+1>=2 保证 sep_i 良定义。
(c) 机械理由：4C_0L/xi 的来源：m <= C_0 P/b，取 b=beta P 得 m <= C_0/beta = 4C_0 L/xi，ceil 进 M_0。同时 xi=gamma/16=eps0 定死舍入直径；gamma<=3/100 使 2-gamma >= 1.97 接住 comp:recovery 因子，gamma<=c/100 使低敏感分支 (2-c/100) <= (2-gamma)。"200C_0"（asm 第 10-11 行 T=200C_0）复用 surplus 段的 T，保证 c=c(T) 一致。
(d) [推测] 候选失败路线一：beta 若取 xi/L（不除 4），尾部积 (1+beta)^{2L}<e^{2xi} 与 1+xi 不兼容，h' 的第二不等式断；beta=xi/4L 是让 2L beta = xi/2 严格半程的对称取法。[推测] 候选失败路线二：分离式若只有 n_i sep_i >= beta P/2 之类松弛，M_0 要翻倍，恢复的 exp(O(M_0)) 常数变差但不致命；致命的是若 sep 定义混入"到 S 的距离"则与锚定的 scale-condition 失配。

### 11.2 双分支候选池与定理 main 的收尾（assembly.tex:78-206）

(a) 逐字（139-150、167-201 节选）：

> m\le C_0P/b=C_0/\beta=4C_0L/\xi\le M_0.
>  1.97P\le1.97(1+\xi)\operatorname{opt}_k
>  \le(2-\gamma)(1+\xi)\operatorname{opt}_k
> The algorithm need not recognize this index or its success event:
> its returned minimum is no worse than this candidate. Only this
> one call must succeed, so there is no union-bound loss over the
> other indices.
>  (2-\gamma)(1+\xi)(1+\varepsilon_0)
>   =(2-\gamma)(1+\gamma/16)^2
>   \le2-\gamma/2.
>  \mathbb E\operatorname{cost}(S)
>  \le (2-\gamma/2)\operatorname{opt}_k
>               +6\zeta\operatorname{opt}_k
>  \le(2-\gamma/4)\operatorname{opt}_k
>  =(2-\sigma)\operatorname{opt}_k.

(b) 全链我按候选池清点：候选一 = opt 宽 5 局部最优 S_k（无条件 3.4P<=5P 界，loc:descent 给多项式）。k<=2L 时：对 S_k 施加 comp:recovery，全 bad 声明（m=k<=2L=M_0 供给值、代理条件空转，101-103 行），1.97<=2-gamma 完成。k>2L 时：低敏感候选 = sur:low-sensitivity 目标 h=k-L 的解（确定性 (2-c/100)(1+xi)opt_k）；高敏感候选 = 对每个 h' in {k-2L+1,...,k}（至多 2L 个、至多 N 个基数选择）算 S_{h'} 并对其调 comp:recovery（M_0=ceil(4C_0L/xi)、失败参 zeta）。高敏感情形下 asm:sensitive 给 h' 与分离 b=beta P：scale-condition 左端 = b(ell+#{n_i sep_i<b})，ell=|S_{h'}|-h'=0、计数 =0（分离使无短簇），不等式 0<=10P 成立（133-136 行"the left side of the scale condition is zero"）；loc:anchoring 容差 1/100 供代理与 m<=4C_0L/xi<=M_0；该 h' 的恢复调用以概率 1-zeta 给 1.97P <= 1.97(1+xi)opt_k <= (2-gamma)(1+xi)opt_k。时间：两 M_0 皆 O(log(N+2))、基数选择 <=N、局部搜索与 surplus 多项式、恢复调用按 comp:recovery 多项式（其 exp(O(M_0)) 在 M_0=O(log N) 下是 N 的固定幂，注意固定幂的指数里含 C_0、xi 等**先于** L 固定的常数，28-30 行"There is no dependence of C_0,T,c,gamma,xi, or eps0 on L"是防循环定义的句子）。定理 main 迁移：pre:rounding 以 eps0=gamma/16 搬运 (2-gamma)(1+xi)=（xi=eps0 同值！xi 与 eps0 都取 gamma/16，15-16 行）(1+gamma/16)，积为 (2-gamma)(1+gamma/16)^2；展开 2-(3/4)gamma-(15/128)gamma^2-(1/256)gamma^3 <= 2-gamma/2 ✓（丢二次三次正项后 3/4 >= 1/2）。失败概率：取 zeta <= min{(N+2)^{-ceil a}, gamma/24}，正确舍入猜测的候选超界概率 <= zeta <= (N+2)^{-a}；对全部舍入猜测取原成本最小故无联合界（189-191 行）。期望：E <= (2-gamma/2)opt + 6 zeta opt <= (2-gamma/2+gamma/4)opt = (2-gamma/4)opt = (2-sigma)opt，用无条件转移界 5(1+eps0)<6 与 zeta<=gamma/24 ✓（194-201 行）。
(c) 机械理由：sigma=gamma/4 是"期望版"比"高概率版"松一档的代价（gamma/2 到 gamma/4 之间塞 6 zeta）；zeta 的双约束各管一头：(N+2)^{-ceil a} 管概率陈述、gamma/24 管期望陈述；xi=eps0=gamma/16 一行三用（敏感度阈值、舍入误差、以及 M_0 的分母）。候选池里"未知 h' 的全部基数都试"是双盲的最后一块：算法既不知道自己在哪个分支，也不需要知道敏感 h' 是哪个。
(d) [推测] 候选失败路线一：若对 2L 个 h' 的恢复调用做独立性假设再用联合界，zeta 摊薄要求每次 2L 分之一，exp(O(M_0))log(2L/zeta) 重复次数带 log L 因子，仍可多项式但 1-zeta 的"仅一次调用必须成功"论证（147-150）说明作者宁可免掉它。[推测] 候选失败路线二：若 gamma 不设 <=3/100，1.97 <= 2-gamma 可能违例，恢复分支的候选劣于兜底 5P 但仍可能超 (2-gamma)(1+xi)；gamma<=c/100 则保证两分支界同形可合并取 min。[推测] 候选失败路线三：若低敏感候选是随机化的（复用恢复），确定性 (2-c/100) 优势失去，期望界的拆分会重复计费一次 zeta；sur:low-sensitivity 全程无采样失败事件正是为这条确定性。

## 12. 关键转折点重建

以下七个节点是我从文本接缝倒推的转折链。凡是文本自证的（有逐字句支撑）我直陈；凡是需要想象"作者此前卡在哪"的，一律 [推测] 起头并给出文本证据落点。

转折一：复杂度记账的对象从"规模"迁到"例外数"。introduction.tex:19-21 的 "single-exponential in the number of exceptions, making logarithmically many exceptions tractable" 与 205-208 对 k^{O(k)} 的否定配对出现，说明这条界线是被撞过之后画下的：[推测] 早期版本把恢复时间写成 exp(O(h log h)) 或 (log N)^{O(h)} 一类，随后发现 h=O(log N) 救不回来，才把定理改写成"以 m 为参数、m<=L_0 log N 为假设"的形态，并倒过来要求锚定段（loc:anchoring）产出的计数界恰好只含 m。

转折二：半径菜单从"逐簇枚举"到"人口半径 + 摊销"。sam:radius-budget 的整条互斥论证（sampling.tex:263-311）在既有恢复构造里没有对应物；18-20 行 "The population radii and their amortized menu cost are what make the dependence on the number of bad clusters single-exponential" 是作者自封的分界线。[推测] 在此之前，高档半径的枚举次数按 直径档数 的 球数 次方计，直径多项式时该项为 (log N)^{O(m log N)} 级；r^0 把"该点配多大的球"变成由 P/m 定义的可计算量后，第三菜单的 r/q 总和被 10m/9 一刀定死，概率损失才塌缩成 2^{-O(m)}。

转折三：舍入与锚定的先后次序被反转。intro 88-93（"The normalized promise matters... constructs its anchors after normalization"）是对"先在原度量取代理、再整体搬走"这条自然路线的显式否定。[推测] 作者最初打算让 pre:rounding 同时搬运成本界与代理精度，随后在 max{1, ceil(d/u)} 的拍平效应前放弃：搬成本只需逐边乘性与 u 加性误差，搬精度却要保两半和的相对关系，后者不成立；于是局部搜索被推迟到归一化实例上执行，锚定定理也因此被迫独立成篇（它不需要 O 最优、只需 P>0 与 scale-condition，见 local.tex:15-16 的自我说明）。

转折四：目的地二分，蓝出子模。completion.tex:14-16 的 "The blue destination optimization below separates centers without sampled balls from the remaining submodular choices" 标记了另一处结构发明：[推测] 若把无球的坏簇目的地也塞进子模代理（如 CGLSS 原文的球-代理二分），这些中心没有报价元素可挂，K 项与 X* 的对应报价 c_p=d_p* 就无处安放；把 Alon-Yuster-Zwick 的颜色标注改造成"蓝标签 + 子集 DP 精确计价"，才既保住预算 a+c=m 又保住计费式 (comp:completion-bound)。

转折五：1.92 与 1+2/e 之间隔着一次"停止时刻换参数"。refinement.tex:14-16 明说本节用"two-stage guide and a sharper accounting of client charges"。对照两段的计费（comp:recovery 的全程 1.2 近集与 theta=0.38；ref:parameters 的 a_1、a_2、kappa=mu^3、theta≈1/e）可反推：[推测] 一级停止点 H^0 被引入时，作者需要的并非更多随机步；H^0 提供的是"删除集已定、J 只缩不涨"的快照，使二级覆盖簇的 J 内份额 x_i<=f_i 可用；这一步把覆盖簇系数从 1+2theta a_2 拉到 1+2theta a_1，theta 又能贴着 1/e 走，1+2/e 的形状才出现。

转折六：严格性证明换了引擎。strictness.tex:3-15 承认 CGLS2026 附录 B 的 factor-revealing 分析给出更强的 gap，本篇"是一个不同的初等证明"。换引擎的动机文本里可读出两条：一是需要该不等式对"一次固定最终重放"成立（含自由开设施、见证超集、同时阶段更新），LP 家族的最优性论证绑在搜索参数族上；二是只要小 gap 够用（"We retain a small explicit gap because that is sufficient for the payment argument"，14-15 行）。后缀最大加两段互补松弛（str:tail-large 与 str:early-small 的对撞）不依赖 |C|，这是"uniformly in the number of clients"（intro 262-263）的兑现方式。

转折七：双盲合并。asm:integral 证明与 sur:low-sensitivity 的 54 行都强调算法不测试分支条件；assembly.tex:4-6 的 "The distinction between the cases is used only to analyze the candidates"。[推测] 这是对"先判敏感度再走分支"式设计的否定：判定 opt_{k-2L} 与 (1+xi)opt_k 的关系需要知道 opt，两分支候选因此只能全算再取 min；配合"只有那一次调用必须成功"的无联合界论证（assembly.tex:147-150），分支不确定性被整体消解。

## 13. 最终思路与最初设想的差异清单

我把进场时的三个猜想（1.2 节）与落盘后的定论逐条对账：

猜想 A（恢复时间单指数于 k）：错。对象是比较簇中的例外数 m（intro 19-21、77-82），且定理形态是"promise 假设 + m<=L_0 log N"，不是无条件关于输入的界。附带差异：恢复因子 (1+2/e+epsilon)P 中的 P 是比较解成本，而全局应用只拿到 2-sigma；摘要的 (1+2/e+epsilon) 只在归一化正整数度量的 promise 场景内成立（intro 88-93 与 ref 403-406 双重限定），且一般度量上的确定性 (1+2/e+epsilon) 属于另一篇同伴论文（intro 136-140，外部对照）。

猜想 B（有界价格 = lambda 绝对有界）：错。有界的是比值 lambda/P_C <= T；"严格性"是预算和界 lambda+2P_C 被一致收紧 (c(T)/2)P_C，且整个 lambda 留在右侧供支付（str:conclusion 与 intro 117-119）。另一个反直觉点：c(T) 随 T 二次倒数级缩小（rho=1/(200(T+2))、c=rho^2/100），T=200C_0 被选得极大（2^{约4003} 量级），本篇却靠"只需要一个非零常数"活下来：C_0 进 M_0 只改 exp 常数与多项式次数，不改多项性。

猜想 C（精确预算 = 输出恰 k 个）：半错。所有输出都是至多 k（至多 h），预算守恒靠"至多移除 m 个、至多补 m 个"的配对不等式 comp:cardinality，配合补齐约定（preliminaries.tex:24-27）与兜底候选 S 的存在。"精确"体现在每一步的计数恒等 |S_0|=m、r=m-|Q|、a+c=m 上，是"账目精确"，并非"输出规模恰好"。

第四处意外差异：我预设"采样恢复"与"盈余构造"是两条独立近似路线的竞争；成品结构却是主从嵌套：盈余（外部）给低敏感分支一个确定性 (2-c/100) 候选，恢复（内部）给高敏感分支一个 1.97 候选，二者都不到 2、由取 min 合并；(1+2/e+epsilon) 精化根本不进全局链（它只服务 promise 场景）。摘要把两句话并排写，实际是"一个定理族 + 一个算法"的关系。

## 14. 外部推断：文献锚点与一次诚实的检索记录

按规格，正文素材不足处我做了网络检索。三条查询（主题：k-median 常数 2/e 与局部搜索史、Charikar-Li 1.637 与伪近似、CGLSS 2+epsilon STOC 2025）在本机可访问的索引里只命中周边文献（会议讲座页、综述 PDF、学者主页），没有检索到题名论文或 arXiv:2503.10972 的正文级条目。以下文献定位因此全部标注为外部推断，依据只有两类：tex 自身的引用键（我可以逐字引用其出现位置），以及我对引用键所指公开文献的既有知识；检索未证实之处我明确说未证实。

外部推断 1（引用键在场，内容靠常识补）：introduction.tex:157-170 给出方法谱系：LP 舍入 CharikarGuhaTardosShmoys2002、原始-对偶与拉格朗日 JainVazirani2001、对偶拟合贪心 JMS2002 与 JainEtAl2003、有界交换局部搜索 Arya2004、伪近似约减与双点舍入 LiSvensson2016、ByrkaEtAl2017、GowdaEtAl2023、迭代随机舍入 ByrkaEtAl2026。就 2/e 而言，公开史上 k-median 局部搜索的 3+epsilon（Arya et al.）与其前 3+2epsilon（Charikar-Guha-Jain-Meyerson-Tardos 系）里的 2epsilon 不是这里的 2/e；本篇的 2/e 按我在 7.3 节的复算来自 2·theta·a_1 在 theta->1/e、a_1->1 时的极限，即子模 (1-1/e) 损失的镜像，intro 197-200 逐字承认："Their leader/ball construction and submodular savings formulation explain the appearance of the 1-1/e gain"，锚定文献是 CGKLL2019。
外部推断 2（同上口径）：连续贪法与分划舍入引 Vondrak2008 与 CCPV2011（intro 201-203；comp:partition-max 的证明结构即多线性化加离散积分，与 CCPV 定理 1.1 和 3.3 节的引用一致，completion.tex:17-19）。距离比例采样引 ArthurVassilvitskii2007（sampling.tex:14-15，k-means++ 的 D^2 采样传统在此降级为按当前距离线性加权）。颜色标注引 AlonYusterZwick1995（completion.tex:187-188）。局部搜索最近设施路由分析引 GuptaTangwongsan2008（local.tex:10-11）。disjoint-region 与外来客户分析引 CohenAddadSchwiegelshohn2017 与 CGLSS2026 的 4.1.1 节（local.tex:12-16）。"Li 的单指数恢复"这一派单措辞，我在全部 tex 里没有找到对应引用键；最接近的公开物是 CGKLL2019 的 FPT 恢复与 DLP2026（intro 203-204 提到的 DaiLiPeng2026）。我把该措辞按外部推断处理为"CGKLL 系恢复构造的单指数化改造"，不冒充论文明说过的话。
外部推断 3：题名里"有界价格严格性"的既有量化，strictness.tex:4-7 自己给出：CGLS2026 附录 B 推论 2 的 factor-revealing gap 1/[4(7+3T)]，其框架是 JMS 对偶拟合。该 gap 随 T 一次倒数级缩小，比本篇 c(T)=Theta(T^{-2}) 更强；本篇换初等证明是方法论选择（8.1 节末），我未检索到该附录内容，按引用键在场采信。

## 15. Lean 注册与取证记录（限定范围）

formalization.yaml 第 1258-1260 行的注册三件套逐字：

>     - comparator_config: ComparatorChallenges/KMedianRecovery.json
>       declaration: OAI.MetricKMedianRecovery.global_application
>       file: OAI/Combinatorics/KMedianRecovery/Main.lean

即被机器核验的命题是 global_application，对应 assembly.tex:142-155 的 Theorem main:theorem（全局应用：恒常数 sigma、概率界 (|D|+|F|+2)^{-a}、期望界同形），而摘要主线的 (1+2/e+epsilon) 恢复定理（ref:recovery）不在声明名单里：[推测] 这是刻意选择的"最外层算法保证"单点注册，内部定理族通过链式引理汇入。书目条目位于 577-579 行，按派单我只确认其存在（标题加 pdf 路径），未读 pdf。

ComparatorChallenges/KMedianRecovery.json 全文要点：challenge_module 为 ComparatorChallenges.KMedianRecovery；solution_module 为 OAI.Combinatorics.KMedianRecovery.Main；theorem_names 恰一项 OAI.MetricKMedianRecovery.global_application；definition_names 为空；permitted_axioms 为 propext、Quot.sound、Classical.choice（无随机性公理：概率语义必然以确定性比特机模型内化）；enable_nanoda 为 false。

模块目录 OAI/Combinatorics/KMedianRecovery/ 的子目录为 Algorithms、Branching、Encoding、Geometry、Machines、Recovery、Refined、Sampling、Strictness，外加 Main.lean 与 Model.lean。Main.lean 第 21 行逐字：

> theorem global_application : globalApplicationClaim := BitMachine.BinaryGlobalOuter.algorithm_guarantee

[推测]（依据导入清单，并非深读证明）子目录与 tex 分片的对应：Sampling 对 sampling.tex、Recovery 与 Branching 对 completion 的前缀完成与 Markov 放大、Refined 对 refinement.tex、Strictness 对 strictness.tex、Geometry 对 local/sampling 的度量扩张与叶几何（ExecutionClusterCostOne 一项对应 str 段簇成本）、Algorithms/Machines/Encoding 对"多项式时间随机算法"的比特机编码（GlobalRawFairExperiment、GlobalOuterProbability 两文件名正好对应采样公平实验与全局外层概率），Model.lean 承载 globalApplicationClaim 的陈述层。允许的三条公理都是数学库常态，未见额外随机性公设，与 sampling.tex:649-665 的 dyadic 有限比特实现条款相互印证：形式化选择把随机性做成确定性比特机上的显式随机带，这正是 tex 里 "Every random draw can be made using a bounded polynomial number of fair bits"（completion.tex:45-46）的 Lean 侧镜像。

与 D80 的假阳性排除：D80 的主题是均值对策博弈的支撑预算递归；本模块的 Branching 目录是"分支完成计费"（SuccessfulCompletionCharge 一类文件名），两处"预算/分支"语汇同形而数学对象无交集。注册项的 json、目录、三件套均已核对完毕。

## 16. 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| n, N | n=\lvert D \rvert, N=\lvert D \rvert+\lvert F \rvert | introduction.tex:15 | 直径界、log(N+2)、M_0、概率界 (N+2)^{-a} | N 换 n 后设施侧距离无界，sam 枚举界 P<=nDelta 与 imp 相位计数 Z 失配 |
| C_0 | 10+60000·2^{3999} | local.tex:386-390 | asm:count-bound 的 M_0、sur 的 T=200C_0 | mu 变大时 J_mu 指数塌缩，C_mu P/b 的对数计数不成立 |
| mu（锚定精度） | 主链 1/100；refinement 用 mu∈(0,min{1/4,eps/12}] | local.tex:208; introduction.tex:51-54 | loc:anchoring 的 D_g<=P_g+muP; ref:parameters 全族 | mu>1/4 时 3mu^2+12mu^3<=(3/2)mu 与 5/3+2mu/3<=2 两处失衡 |
| J_mu, C_mu | ceil(40/mu); 10+(600/mu)2^{J_mu-1} | local.tex:218-223 | 阈值平均 tb(m+ell)<=muP/2 与 m<=C_mu P/b | 几何尾 2V_i 依赖倍率 1/2，改算术网格则计数界出 J 因子 |
| T | 200C_0 | assembly.tex:10; surplus.tex:18 | str:strictness 的 c(T)；sur:bad-price 的 m lambda/T<=P/25 | T<8C_0·25/3 时 Q>P/20 断，summed-gain 回不到 2-c/100 |
| B, rho, c(T) | T+2; 1/(200B); rho^2/100 | strictness.tex:26-29 | v 条件、sur 除法 7v<=7c/1000、gamma<=c/100 | 小集质量 2rhoB=1/100 与 0.175rho^2>c 的常数配平被破坏 |
| v, delta, K | v<=min{1/12,c/1000}, v^2<=c/(6(T+2)); delta=3v; K=1+v^2 | surplus.tex:21-25; imports.tex:14-17 | 上调窗口 vz、无超投标 3v^2z、KZ<=37/36·Z、严格性 K^2-1<=3v^2 | v>=1/6 时 (1-delta)>1/2 与 3v^2 比较失效；v 大了 e<=vP 也断 |
| lambda=2f; 小价格 lambda | lambda=2/N^2（下端点） | imports.tex:17; imports.tex:165 | imp:payment/small-payment、sur 短簇 b=lambda/8 | 下端点抬价则 lambda<=2<=T P_i 不再自动，小价格分支严格性全免失效 |
| eta, e | eta=2^{-N}; e=hN eta<=N^2 2^{-N} | imports.tex:87,621 | imp:payment 的 h(lambda-N eta)、sur 的 e<=vP | eta 粗于二分精度则参数迁移不产出 eta-valid 序列（imports.tex:534-543） |
| L | O_v(log(N+2)), L>=max{1,N_*} | surplus.tex:33-39; assembly.tex:24-27 | 目标 h=k-L、M_0、k<=2L 分支、概率界 log(2/zeta)=O_a(log(N+2)) | L 若依赖 xi 或 C_0，参数定序成环（assembly.tex:28-30 明禁） |
| N_* | 使 N^2 2^{-N}<=v 且 2/N<=c/200 | surplus.tex:27-30 | 小价格分支 h lambda<=c/200·P；正常分支 e<=vP | 不设阈值则小 N 上 e<=vP 失败，须整体改走 k<=2L 全 bad 通道 |
| xi, eps_0 | 同为 gamma/16 | assembly.tex:15-16 | pre:rounding 的 C=ceil(20n^2/eps_0)+1、beta=xi/(4L)、M_0 分母 | xi 独立于 eps_0 后乘积 (2-gamma)(1+xi)(1+eps_0)<=2-gamma/2 展开断 |
| gamma, sigma | min{3/100,c/100}; gamma/4 | assembly.tex:14-16 | 1.97<=2-gamma、(2-c/100)<=(2-gamma)、期望 6zeta<=gamma/4 | gamma>3/100 时 comp:recovery 的 1.97 不被接住 |
| beta, b | xi/(4L)；高敏感 b=beta P | assembly.tex:38,131 | asm:separation n_i sep_i>=betaP、m<=C_0/beta=4C_0L/xi | (1+beta)^{2L}<e^{xi/2}<=1+xi 的半程配平失效则 h' 第二不等式断 |
| M_0 | ceil(4C_0 L/xi) | assembly.tex:113-116 | comp:recovery 的 exp(O(M_0))poly(N)log(2/zeta) | M_0 增长快于 O(log N) 则单指数不再多项式 |
| kappa（采样） | 10^{-6}（主）；mu^3（精化） | sampling.tex:51-52; refinement.tex:25 | W<=3.42P+61T_near、rho_kappa、ref 误差 O(mu^2) | kappa 与 mu 脱钩时 11kappa+kappa/q 不能吸收进 6mu |
| M_kappa, E_kappa, J_{kappa,m} | ceil(10/kappa)+1; min{e:(1+kappa)^e>=10}; 1+ceil(2m/kappa) | sampling.tex:184-187 | 三菜单 prescribe 的档位可行域、2^{-sum j} 预算 | 10 这个三门限不齐则某情形无 prescribe 菜单、概率为零 |
| r^0(w) | min{q: q·\lvert D(w,q) \rvert>=P/m}；求和 <=5.2P（a=1.2）/5.5P（a<=3/2） | sampling.tex:60-62,86-87 | sam:weight-bound 的 5.2 kappa P、ref:radius-sum 的 11/2 | 用 P 代替 P/m 则小簇半径爆、leader 求和界 (a+4)P 失效 |
| 近集常数 1.2, 1.02, 60, 1.85 | a=1.2; 51/50; 60>51; 1.85=1+1.02/1.2 | sampling.tex:442-448,459-469 | covered 界 3.42、far 界 1.85P_B、comp:main-endpoint | 1.02>=1.2 时 N_i 嵌套断；60 小于 51 则取整余量断 |
| rho_kappa, rho_mu | kappa/(2(3.42+61kappa)); kappa/(2(6+kappa/q)) | sampling.tex:504; refinement.tex:152 | 引导每步进展概率、rho^{2m} 单指数似然 | 3.42 或 6 恶化则 rho 缩小，log(1/rho)·m 仍 O(m) 但 zeta 放大层变厚 |
| theta | 主 0.38；精化 1/e<theta<=1/e+mu（有理） | completion.tex:495; refinement.tex:26 | partition-max 误差 theta-1/e、系数 1+0.38·2.4·1.2=1.912、ref 的 2 theta a_1 | theta=1/e 时 oracle 数无穷；theta>0.38 则 1.94 界与 Markov 余量断 |
| 0.62 | 1-1/e-eps, eps<0.0121 | completion.tex:47,149-150 | partition-max 的具体化接口 | 1-1/e≈0.6321 裕量不足 0.0121 时该行断 |
| 1.94, 1.97, 3/197 | 期望界 1.922065432P<1.94P；Markov 目标 1.97P | completion.tex:540-552 | asm:integral 的 1.97<=2-gamma | 1.94/1.97 之比贴 1 则单试成功概率 3/197 缩小、重复层数增 |
| 1.432 | (6/5)(1.01-0.1)+2.2·0.1 | local.tex:400-407; surplus.tex:181-187 | 二分 P_b<=P/10 支路 | P_b 阈值 1/10 抬高分支界；c<1 使 1.432<2-c/100 恒真 |
| b | lambda/8 | surplus.tex:133 | sur:bad-price m lambda=8mb<=8C_0 P、sur:anchoring-scale 的 10P | b 换 lambda/4 则 3/4 移项系数变号，短簇价格比较断 |
| C（舍入 cap） | ceil(20n^2/eps_0)+1 | preliminaries.tex:82 | 5Q*<=10n^2/eps_0+n*... <C 的免 cap 迁移 | cap 常数降到 5 与 10 之间时 5Q*<C 不再恒真，被 cap 边复活 |
| width-5, u=6/5, 17/5 | u=max_t t/(t-1)（t=6）；1+2u=17/5<=5 | local.tex:20-21,80-91 | 兜底 5opt（pre:rounding 假设）、锚定 V 和 6P、loc:swap-bound | 宽度降 3 则小类枚举断；u 若取 1 则大类权重不存在 |
| zeta | <=min{(N+2)^{-ceil a}, gamma/24} | assembly.tex:182-185 | 概率界 (N+2)^{-a} 与期望尾部 6 zeta<=gamma/4 | 只留 (N+2)^{-a} 则期望界多出 gamma/4 缺口 |
| Delta, Z | 直径 Delta 多项式；Z=M+8NM | sampling.tex:109; imports.tex:596-598 | 叶距离公式、相位 O_v(log N)、失能长度 20NM | Delta 不设多项式界则枚举 P<=nDelta 与失能比较同时失控 |
| $\bar d_i$（簇均值） | $\bar d_i=P_i/n_i$（$n_i>0$），空簇约定 $\bar d_i=0$ | sampling.tex:32-34,98-101 | 近集阈值 $a\bar d_i$、leader 距 $r_i\le a\bar d_i$、半数近点引理 | 空簇均值无定义则 $N_i=\varnothing$ 的约定断，$T_i$ 对 $n_i$ 的除法要分支 |
| $V_i$（簇双权重） | $V_i=\sum_{p\in C_i}(s_p+d_p^*)$，$\sum_i V_i=\operatorname{cost}(S)+P\le6P$ | local.tex:230-236 | good 判据 $V_i\le t_ab$、几何尾和 $2V_i$、计数 $m\le q_0+\sum_i V_i/(tb)$ | 全 bad 代入 loc:swap-bound 一步断则 $\le6P$ 换成对 $\operatorname{opt}$ 的依赖，阈值平均断链 |
| $t_a$, $m_a$ | $t_a=(\mu/100)2^{-a}$，$0\le a<J_\mu$ | local.tex:242-244 | 阈值平均 $\sum_a t_ab(m_a+\ell)\le(12+\mu/5)P$、选中 $tb(m+\ell)\le\mu P/2$ | 公比若不再是 $1/2$，几何尾和不再是 $2V_i$，常数 $12+\mu/5$ 全部重算 |
| 拥挤球与互异代理 | 球半径 $\operatorname{sep}_i/4$ 互斥；拥挤球数 $\le\lvert S\rvert-(h-m)=m+\ell$ | local.tex:288-303 | 第一笔超支 $tb(m+\ell)\le\mu P/2$；代理两两互异的几何来源 | 半径常数超过 $\operatorname{sep}_i/2$ 则两球可交，互异性与"至多一个受偿代理"同时失效 |
| $E_p$, $\overline E$（严格性松弛） | $E_p=\lambda+1+D_{p-1}+(p-1)d_p-qa_p$；$\overline E=\lambda+2-1/q-\sum_p a_p$ | strictness.tex:129-130,149-151 | 小赤字矛盾 $0\le\overline E=\Delta-1/q<c$；区间下界 $\overline E>0.175\rho^2$ | 系数恒等式 $(q-j)+(j-1)=q-1$ 依赖 $D_{p-1}$ 的精确定义，改记号即断 |
| $N_i^z$, $x_i$, $f_i$ | $N_i^z=\{p\in C_i:d_p^*\le a_z\bar d_i\}$；$f_i=\lvert C_i\cap J^0\rvert/n_i$，$x_i=\lvert C_i\cap J\rvert/n_i\le f_i$ | refinement.tex:29-31,83,254 | 两级 leader 归属、$x_i\le f_i<1/3$、系数 $3f_i+(1-f_i)(1+\mu)\le5/3+2\mu/3\le2$ | $J\subseteq J^0$ 失去则 $x_i\le f_i$ 非法，$1+2\theta$ 分支退化回 $1+2\theta a_2$ |
| $I$（完成基准项） | $I=\sum_{p\in J}d(p,H)\le\kappa P$，误差段贡献 $2I\le2\kappa P$ | refinement.tex:202-205,331-334 | comp:completion-bound 的两份基准项；$11\kappa$ 显式和的最后两格 | 若 $I$ 改按第二停终态重推则 $\le\kappa P$ 不再有存证时刻，$2\kappa P$ 项失控 |

台账核对说明：表头五列与分隔行按规格逐字；每行五格均有实义内容；绝对值一律 \lvert \rvert 书写；"若改动断在哪一步"优先给具体断链的编号式，找不到编号锚的写机制句。

## 17. 收尾自检记录

规格自检（落盘后执行）：字节数、^## 节序、台账表头与空行、中文破折号残留四项见本笔记最后一次编辑的报告。素材合规声明：全部正文引文出自 build 下十个 .tex 分片，未使用 pdftotext、未读取任何 PDF；Lean 侧只读了注册三件套所在行段、ComparatorChallenges/KMedianRecovery.json、模块目录清单与 Main.lean；未读任何其他 D## 笔记；网络检索结果均标为外部推断且未进入逐字引文。

## 18. 草稿纸重算之一：舍入迁移的不等式链全文字化

第 2.2 节和第 3.2 节里我用 ASCII 草草写过的几段比较，这一节全部搬进数学模式。我先在草稿纸上把 Lemma pre:rounding 的输入抄成一列：给定有理 $0<\varepsilon_0\le1$（preliminaries.tex:51）；整数实例上多项式时间算法对每个直径受限的正整数度量输出 $\le k$ 个设施；无条件界 $\operatorname{cost}\le5\operatorname{opt}_k$；成功事件界 $\operatorname{cost}\le A\operatorname{opt}_k$，其中 $A\le5$、成功概率 $\ge1-p$（preliminaries.tex:52-54）。要证的是原度量上 $5(1+\varepsilon_0)\operatorname{opt}_k$ 与 $A(1+\varepsilon_0)\operatorname{opt}_k$ 两件套，且所需整数距离 $\le\lceil20n^2/\varepsilon_0\rceil+1$（preliminaries.tex:60-61）。

猜量与它的合法域：$M$ 取输入中出现过的某个正 client--facility 距离，候选数 $\le n\lvert F\rvert$（preliminaries.tex:72-73）。猜对时 $M$ 是某个固定最优解里最大被指派距离，于是两端同时闭合：左端 $M\le P^*$，因为那条最长的边本身就是和 $P^*=\sum_{p}d(p,S^*)$ 的一项；右端 $P^*\le nM$，因为每项 $\le M$ 共 $n$ 项。逐字写成 pre:M-range（preliminaries.tex:76-78）：
\[
 M\le P^*\le nM.
\]
两个尺度：
\[
 u=\frac{\varepsilon_0 M}{n},\qquad C=\left\lceil\frac{20n^2}{\varepsilon_0}\right\rceil+1
\]
（preliminaries.tex:81-82），舍入度量 $d_M(x,y)=\min\{C,\max\{1,\lceil d(x,y)/u\rceil\}\}$、$d_M(x,x)=0$（preliminaries.tex:87-88）。我在草稿纸上给单边三明治：由 $\lceil\cdot\rceil$ 的性质 $d/u\le\lceil d/u\rceil<d/u+1$；$\max\{1,\cdot\}$ 只会抬高（当 $d/u<1$ 时把值抬到 $1\le d/u+1$ 仍成立）；$\min\{C,\cdot\}$ 若触发 cap 则把值抬到 $C>d/u+1$ 或原样保留，两种都不减小下界 $d/u\le d_M(x,y)$，上界一侧对未 cap 边保留 $d_M<d/u+1$。分析里真正用的是上界方向（把原最优的每条边换进 $d_M$）与下界方向（把 $d_M$ 的解搬回原度量）各一次。

正向迁移（原最优进入舍入世界）：原最优解在 $d_M$ 下逐边至多加 $1$，共 $n$ 条边：$P^*_M\le P^*/u+n$；新最优只更省，故 $Q^*\le P^*/u+n$（pre:rounded-optimum, preliminaries.tex:98-101）。把 $u$ 代入第一个比值：
\[
 \frac{P^*}{u}=P^*\cdot\frac{n}{\varepsilon_0 M}\le nM\cdot\frac{n}{\varepsilon_0 M}=\frac{n^2}{\varepsilon_0},
 \qquad Q^*\le\frac{n^2}{\varepsilon_0}+n.
\]
逆向迁移前我必须先排除 cap，这一步 tex 压成一句 "The assumed algorithm's output has rounded cost at most $5Q^*<C$"（preliminaries.tex:103），我在草稿纸上补全成四行：输出在 $d_M$ 下成本 $\le5Q^*$；
\[
 5Q^*\le\frac{5n^2}{\varepsilon_0}+5n\le\frac{5n^2}{\varepsilon_0}+\frac{5n^2}{\varepsilon_0}=\frac{10n^2}{\varepsilon_0}<\frac{20n^2}{\varepsilon_0}+1\le C,
\]
第一步用 $Q^*$ 上界，第二步用 $n\ge1$ 得 $5n\le5n^2$、用 $\varepsilon_0\le1$ 得 $5n^2\le5n^2/\varepsilon_0$，第三步留常数 $20>10$ 的一倍余量与 ceiling、加一。总成本严格小于 $C$ 而每条边非负，故每条被选边 $d_M<C$，cap 未激活，于是 $\lceil\cdot\rceil$ 只抬高：$d(x,y)\le u\,d_M(x,y)$（preliminaries.tex:107-108）。逐边乘回、再换成原度量最近指派（只会更省）：
\[
 \operatorname{cost}_{\text{原}}(T)\le u\cdot5Q^*\le u\left(\frac{P^*}{u}+n\right)\cdot5=5P^*+5un=5P^*+5\varepsilon_0 M\le5P^*+5\varepsilon_0 P^*=5(1+\varepsilon_0)P^*,
\]
末步用 pre:M-range 的另一端 $M\le P^*$（preliminaries.tex:110-113）。成功事件把 $5$ 换成 $A$ 走同一条链（preliminaries.tex:113-114）。

免联合界的机制我写成一条不等式：设 $T_M$ 为猜测 $M$ 时的输出，最终输出 $T=\arg\min_M\operatorname{cost}_{\text{原}}(T_M)$，则对正确的 $M^*$ 恒有 $\operatorname{cost}(T)\le\operatorname{cost}(T_{M^*})$，于是 $\Pr\{\operatorname{cost}(T)>5(1+\varepsilon_0)P^*\}\le\Pr\{\operatorname{cost}(T_{M^*})>\cdot\}\le p$，失败概率原样穿过 $n\lvert F\rvert$ 个猜测（preliminaries.tex:116-118）。前提是每个 $T_M$ 都可行且成本可精确计算，这在整数有界实例上成立。

平凡情形我也顺手全部符号化（preliminaries.tex:16-23）：$k\ge\lvert F\rvert$ 时开全集 $S=F$ 逐点达下界 $d(p,F)$；$k\ge n$ 时取指派集 $S=\bigcup_p s_p$、$\lvert S\rvert\le n\le k$、$\operatorname{cost}(S)=\sum_p d(p,F)$ 恰为逐点下界之和；所以非平凡域是 $1\le k<n$ 且 $k\le\lvert F\rvert$（pre:nontrivial, preliminaries.tex:21-23）。补齐约定：$\lvert S\rvert<r$ 时可加设施不加成本，故 $\operatorname{opt}_r$ 定义里 $1\le\lvert S\rvert\le r$ 与"恰好 $r$"在比较中可互换（preliminaries.tex:24-27）。全局落点：$\varepsilon_0=\gamma/16$（assembly.tex:15-16），于是无条件迁移界 $5(1+\varepsilon_0)\operatorname{opt}_k<6\operatorname{opt}_k$（assembly.tex:180）；我在草稿纸上核数：$\gamma<1$ 给出 $\varepsilon_0<1/16$，$5(1+1/16)=5.3125<6$，这个 $6$ 随后只出现在期望账 $6\zeta\operatorname{opt}_k$ 里。

## 19. 草稿纸重算之二：加权交换与锚定的常数链

width-5 局部最优的定义式我先前只用文字复述（第 4.1 节），现在写成：$S$、$\lvert S\rvert=r$，对所有 $R\subseteq S$、$A\subseteq F$ 满足 $\lvert R\rvert\le5$、$\lvert A\rvert\le5$、$\lvert(S\setminus R)\cup A\rvert=r$ 的交换有 $\operatorname{cost}((S\setminus R)\cup A)\ge\operatorname{cost}(S)$（local.tex:20-23）。运行时间账：交换对数 $\sum_{i\le5}\sum_{j\le5}\binom Nr\binom Nj=O(N^{10})$（local.tex:37-39），每步评估 $O(N)$ 成本；整数成本势能在 $[0,nB]$ 内（初始解成本 $\le nB$ 因每点距离 $\le B$），每次严格改进至少 $-1$，改进轮数 $\le nB$，总时间 $O(nB\cdot N^{10}\cdot N)=O(nB\,N^{11})$，$B$ 多项式即多项式（loc:descent, local.tex:36-42）。补齐观察写成不等式：交换结果 $T$、$\lvert T\rvert<r$ 时 $\lvert S\setminus T\rvert\ge r-\lvert T\rvert$，放回任意 $r-\lvert T\rvert$ 个被移除设施得 $T'\supseteq T$、$\lvert T'\rvert=r$、$\operatorname{cost}(T')\le\operatorname{cost}(T)$、且 $T'$ 与 $S$ 的差异仍是 $\le5$ 删 $\le5$ 加（local.tex:44-51）。

loc:swap 的推导我按"权重书"逐条重演。记号（local.tex:58-75）：$\Phi=\{\phi_i:i\in O_g\}$、$g=\lvert O_g\rvert$、$m=\lvert O_b\rvert$、$q=\lvert S\setminus\Phi\rvert$。槽存在性：
\[
 q=\lvert S\rvert-g\ge h-g=m
 \qquad(\text{local.tex:98-99}),
\]
用到 $\Phi$ 两两互异（$\lvert\Phi\rvert=g$）与 $h\le\lvert S\rvert$。$m=0$ 时全客户端走代理：$S_g\le D_g$，两式平凡（local.tex:101-103）。$m>0$ 时对每个 $i\in O_b$ 记最近设施 $\nu(i)$ 与图像 $\psi(i)\in S\setminus\Phi$（local.tex:105-110）。设非空图像类数 $a$、类 $I$ 大小 $t$：小类（$t\le5$）做单个交换，移除 $t$ 个槽、加入全类，权重 $1$；大类拆成 $t$ 个 1 换 1 交换、每个权重 $1/(t-1)$。辅助槽需求 $\sum_{\text{类}}(t-1)=m-a$，可用非图像未保护设施 $q-a\ge m-a$（local.tex:112-117）。移除权和：小类槽权重 $1$；大类槽被同类的 $t$ 个交换各以 $1/(t-1)$ 移除，合计
\[
 \frac{t}{t-1}\le\frac65=u
 \qquad(\text{local.tex:134-135}),
\]
$t\ge6$ 时 $t/(t-1)$ 最大在 $t=6$ 取 $6/5$；这就是 $u=6/5$ 的全部出处。每个坏中心加入权和恰 $1$（小类一次权重 1，大类 $t$ 次各 $1/(t-1)$）。保存性（local.tex:140-147）：不加 $i$ 的交换不动 $\nu(i)$。

逐客户变化上界：$p\in C_i$、$i\in O_b$，"加 $i$" 的交换里改挂 $i$、变化 $d_p^*-s_p$；其余交换里若旧设施被移除改挂 $\nu(i)$，三角链逐字：
\[
 d(p,\nu(i))\le d_p^*+d(i,\nu(i))\le d_p^*+d(i,s(p))\le d_p^*+(d_p^*+s_p)=2d_p^*+s_p
 \qquad(\text{local.tex:153-158}),
\]
中间步用 $\nu(i)$ 是 $i$ 的最近设施、末步用 $d(i,s(p))\le d(i,p)+d(p,s(p))$。加权后 $p$ 的上界是 $(d_p^*-s_p)+u\cdot2d_p^*$（local.tex:159-162）。$p\in C_i$、$i\in O_g$：只可能被动改挂受保护代理，$d(p,\phi_i)-s_p\ge0$，加权 $\le u(d(p,\phi_i)-s_p)$（local.tex:169-173）。所有客户相加并用每个交换真实变化非负：
\[
 0\le(P_b-S_b)+2uP_b+u(D_g-S_g)
 \iff S_b+uS_g\le(1+2u)P_b+uD_g
 \qquad(\text{local.tex:179-181}),
\]
$u\ge1$ 得 $\operatorname{cost}(S)=S_g+S_b\le uD_g+(1+2u)P_b$（loc:swap-bound）。全 bad（$D_g=0$、$P_b=P$）：$\operatorname{cost}(S)\le(1+2u)P=\frac{17}{5}P=3.4P\le5P$（local.tex:90-91）；这里我注意到 $17/5$ 其实是紧的，$5$ 只是 pre:rounding 要的名义界。

锚定定理的常数我在草稿纸上逐项重排。$V_i=\sum_{p\in C_i}(s_p+d_p^*)$、$q_0=\lvert\{i\in O:n_i\operatorname{sep}_i<b\}\rvert$（local.tex:229-232）。求和恒等式 $\sum_i V_i=\sum_p s_p+\sum_p d_p^*=\operatorname{cost}(S)+P$，代入全 bad 界 $\le5P+P=6P$（loc:V-bound, local.tex:233-236）。阈值族 $t_a=(\mu/100)2^{-a}$、$0\le a<J_\mu$（local.tex:242）。固定非短 $i$：它在 $t_a$ 下为 bad 当且仅当 $V_i>t_a b$；满足 $t_a b<V_i$ 的 $t_a$ 构成几何列，尾和 $<2V_i$（公比 $1/2$ 的级数 $\sum_{k\ge1}2^{-k}=1$ 乘 $V_i$ 再放宽）。换序求和（loc:threshold-average, local.tex:247-251）逐项：
\[
 \sum_{a=0}^{J_\mu-1}t_ab(m_a+\ell)
 \le2(\mu/100)b(q_0+\ell)+2\sum_{i\in O}V_i
 \le2\cdot\frac{\mu}{100}\cdot10P+12P
 =\left(12+\frac{\mu}{5}\right)P,
\]
第一项用 scale-condition $b(\ell+q_0)\le10P$（loc:scale-condition, local.tex:202-206），第二项用 $\sum V_i\le6P$。均值：$J_\mu\ge40/\mu$ 给出
\[
 \frac1{J_\mu}\sum_a(\cdot)\le\frac{\mu}{40}\left(12+\frac{\mu}{5}\right)P=\left(\frac{12}{40}+\frac{1}{200}\right)\mu P=\frac{61}{200}\mu P<\frac{\mu P}{2},
\]
我在草稿纸上核对 $61/200=0.305<1/2$ 的裕度：这是 $\mu\le1$ 时 $(12+\mu/5)/40\le12.2/40=0.305$。取达到均值的 $t=t_a$：$tb(m+\ell)\le\mu P/2$、$0<t\le\mu/100\le1/100$（loc:selected-threshold, local.tex:263-266）。计数：非短 bad 有 $V_i>tb$，故
\[
 m\le q_0+\frac{\sum_i V_i}{tb}\le\frac{10P}{b}+\frac{6P}{b}=\left(10+\frac6t\right)\frac Pb
 \le\left(10+\frac{600}{\mu}2^{J_\mu-1}\right)\frac Pb=C_\mu\frac Pb
 \qquad(\text{local.tex:271-274, 219-221}),
\]
末步用 $t\ge t_{J_\mu-1}=\frac{\mu}{100}2^{-(J_\mu-1)}$。$\mu=1/100$ 时 $J_\mu=\lceil4000\rceil=4000$、$C_0=10+60000\cdot2^{3999}$（loc:main-count-constant, local.tex:386-389）；我在草稿纸上估 $\log_2 C_0\approx3999+\log_2 60000\approx4005.6$，这个数进 $M_0=\lceil4C_0L/\xi\rceil$ 只改多项式次数，不进 $\log N$。

代理几何：$r_i=d(i,\phi_i)$、逐点 $r_i\le d(i,s(p))\le d_p^*+s_p$ 得 $n_ir_i\le V_i\le tb$、$r_i\le t\operatorname{sep}_i$（loc:proxy-distance, local.tex:279-286）。球 $B_i=\{x:d(i,x)<\operatorname{sep}_i/4\}$ 两两不交：两半径和 $\le d(i,j)/2$，公共点违三角（local.tex:287-295）。拥挤球数 $\le\lvert S\rvert-(h-m)=m+\ell$（local.tex:297-303）。误差三笔（local.tex:307-370）：拥挤球合计 $\le tb(m+\ell)\le\mu P/2$；单设施球错挂者逐点 $\le r_i\le4t(d_p^*+s_p)$、合计 $\le4t\sum V_i\le24tP$；受偿外来者用 loc:incoming-swap $\sum_{p\in A_i}(s_p-d_p^*)\le r_i\lvert I_i\rvert$（local.tex:343）与 $d_p^*+s_p\ge(1-t)\operatorname{sep}_i$ 得 $r_i\le\frac{t}{1-t}(d_p^*+s_p)$、合计 $\le\frac{t}{1-t}\sum V_i\le\frac{6t}{1-t}P$。合并：
\[
 D_g-P_g\le\frac{\mu P}{2}+\left(24t+\frac{6t}{1-t}\right)P\le\frac{\mu P}{2}+36tP\le\frac{\mu P}{2}+\frac{9}{25}\mu P<\mu P
 \qquad(\text{local.tex:373-380}),
\]
我在草稿纸上补 $36t$ 的来源：$t\le1/100<1/2$ 时 $\frac1{1-t}\le2$（粗化），$24t+12t=36t$；$36\mu/100=0.36\mu$。小坏成本分支逐位：$\operatorname{cost}(S)\le\frac65(P-P_b+0.01P)+\frac{17}{5}P_b$，右端对 $P_b$ 的斜率 $-\frac65+\frac{17}{5}=\frac{11}{5}>0$，在 $P_b=P/10$ 取最大
\[
 \frac65(1-0.1+0.01)P+\frac{17}{5}\cdot\frac P{10}=1.092P+0.34P=1.432P<1.6P
 \qquad(\text{loc:small-bad-cost, local.tex:400-407}).
\]

## 20. 草稿纸重算之三：人口半径、三菜单与 $\exp(-O_\kappa(m))$ 的逐位摊销

这一节我在草稿纸上把 sampling 段的所有常数重算一遍，基准取正文自己钉死的 $\kappa=10^{-6}$（sampling.tex:495）。

半径 $r^0$ 的可计算性。定义 $r^0(w)=\min\{q\ge0:q\lvert\mathcal D(w,q)\rvert\ge P/m\}$，其中 $\mathcal D(w,q)=\{p\in D:d(w,p)\le q\}$（sam:r0-definition, sampling.tex:57-63）。我把这个下确界写成显式形式：若客户到 $w$ 的距离排序为 $d_1\le\cdots\le d_n$（含 $w$ 到自身的 $0$），则 $r^0(w)=\min_{1\le j\le n}\max\{d_j,\,P/(mj)\}$（sam:r0-formula, sampling.tex:69-72）。我双向验证过一次：取 $q_j=\max\{d_j,P/(mj)\}$，闭球 $\mathcal D(w,q_j)$ 至少含 $j$ 个点，故 $q_jj\ge P/m$ 可行；反过来若 $q$ 可行且 $j=\lvert\mathcal D(w,q)\rvert$，则 $j\ge1$、$d_j\le q$、$P/(mj)\le q$，两个 $\max$ 分支都 $\le q$。由此 $r^0$ 只是排序加取 $\min$，位长多项式（sampling.tex:632-634）。

领袖半径和。假设 $A\subseteq\mathcal B$ 中每个 $i$ 选出领袖 $w_i\in C_i$ 且 $r_i=d(w_i,i)\le a\bar d_i$，$a>0$，则
\[
 r^0(w_i)\le(a+2)\bar d_i+\frac{2P}{mn_i},\qquad
 \sum_{i\in A}n_ir^0(w_i)\le(a+2)\sum_{i\in A}P_i+\frac{2\lvert A\rvert}{m}P\le(a+4)P
 \qquad(\text{sampling.tex:77-85}),
\]
末步用不同领袖属不同坏簇，故 $\sum_{i\in A}P_i\le P$、$\lvert A\rvert\le m$。我在草稿纸上代 $a=1.2$ 得 $a+2=3.2$、$a+4=5.2$，与正文写的 $5.2P$ 逐位一致；$a\le3/2$ 时放宽为 $5.5P$（sampling.tex:86-87）。系数 $3.2$ 的来历我也核了：簇内至少 $n_i/2$ 个点满足 $d_p^*\le2\bar d_i$，否则它们自己的距离和就超 $P_i$；$\bar d_i=0$ 时全簇距离为零，断言同样成立（sampling.tex:98-101）。这些点到领袖的距离 $\le d_p^*+r_i\le2\bar d_i+a\bar d_i=(a+2)\bar d_i$，再多给 $2P/(mn_i)$ 的半径时其人口至少 $n_i/2$，乘上半径恰好越过 $P/m$，这就是定义里的可行见证。

叶扩展与参考集。度量在 $D\cup F$ 上的直径记 $\Delta$，加一个到所有原点距离 $\Delta$ 的永久点 $\delta_\infty$，并对每个选出的 $(w_i,R_i)$（要求 $R_i>0$）在 $w_i$ 处挂一条长 $R_i$ 的叶子，$\Lambda=\{\delta_i:i\in A\}$、$H=(S\setminus Q)\cup\Lambda\cup\{\delta_\infty\}$、$\mathcal F_i=\{x\in F:d(w_i,x)\le R_i\}$（sam:reference, sampling.tex:109-121）。我按正文的构造核对距离公式：先做原度量点的完全图并接 $\delta_\infty$，过 $\delta_\infty$ 的路径两段长 $2\Delta$ 无法缩短任何原距离，取最短路度量后挂叶即得 $d(x,\delta_i)=d(x,w_i)+R_i$、$d(\delta_\infty,\delta_i)=\Delta+R_i$，两叶之间 $d(\delta_i,\delta_j)=R_i+d(w_i,w_j)+R_j$（sampling.tex:144-153）。距离到集合的函数是 $1$-Lipschitz，所以 $d(x,O)\le d(x,w_i)+d(w_i,O)\le d(x,\delta_i)$（sampling.tex:154-156），这正是 $R_i\ge d(w_i,O)$ 时叶子压不动真实设施的原因。固定序（设施按预定序、永久 dummy 在最后、叶按创建时间）下的最近点指派规则，使任何固定存活原点子集的客户集只会缩小（sam:dummy-metric, sampling.tex:138-141, 160-168）。我在草稿纸上写下这条单调性的用途：$W(H)=\sum_{p\in D}d(p,H)$（sampling.tex:172-174）随叶子增加不升，所以引导过程的概率估计与实际的贪心指派规则互不干扰。

三菜单。给定 $w$ 与 $q=r^0(w)$，整数族为 $M_\kappa=\lceil10/\kappa\rceil+1$、$J_{\kappa,m}=1+\lceil2m/\kappa\rceil$、$E_\kappa=\min\{e\in\mathbb Z_{\ge0}:(1+\kappa)^e\ge10\}$（sampling.tex:183-188），三个菜单各以 $1/3$ 概率被选中：菜单 (1) 均匀取 $j\in\{1,\ldots,M_\kappa\}$ 令 $R=j\kappa q$；菜单 (2) 在 $\Lambda\ne\varnothing$ 时令 $D_\Lambda=d(w,\Lambda)$、均匀取 $e\in\{0,\ldots,E_\kappa\}$、$R=D_\Lambda/(1+\kappa)^e$，$\Lambda=\varnothing$ 则该菜单未定义并结束本次运行；菜单 (3) 以概率 $2^{-j}/\sum_{u=1}^{J_{\kappa,m}}2^{-u}=2^{J_{\kappa,m}-j}/(2^{J_{\kappa,m}}-1)$ 取 $j$ 并令 $R=j\kappa q$（sampling.tex:189-203）。$\kappa=10^{-6}$ 时我在草稿纸上算：$M_\kappa=10^7+1$；由 $(1+10^{-6})^e\ge10$ 取对数得 $e\ge\ln10/\ln(1.000001)=2.302585\ldots/9.999995\times10^{-7}=2\,302\,590.9\ldots$，故 $E_\kappa=2\,302\,591$；$J_{\kappa,m}=1+2m\times10^{6}$。菜单 (1)(2) 的分支数只依赖固定的 $\kappa$，菜单 (3) 有 $O_\kappa(m)$ 个条目（sampling.tex:204-206），这个不对称就是后面要用 $2^{-j}$ 加权把大 $j$ 的代价摊掉的动机。

正确半径的处方。分析上称 $R$ 在 $w$ 处正确，若对 $r=d(w,O)$ 有 $r\le R\le(1+\kappa)r+\kappa r^0(w)$（sam:upward-radius, sampling.tex:210-213）。三种情形我逐个复核：$r\le10q$ 用菜单 (1)、$j=\max\{1,\lceil r/(\kappa q)\rceil\}$，则 $r\le R\le r+\kappa q$，含 $r=0$；$r>10q$ 且 $D_\Lambda\le10r$ 用菜单 (2)、取满足 $D_\Lambda/(1+\kappa)^e\ge r$ 的最大 $e\le E_\kappa$，由 $r\le D_\Lambda\le10r\le(1+\kappa)^{E_\kappa}r$ 知这样的 $e$ 存在且给出 $r\le R\le(1+\kappa)r$；$r>10q$ 且 $D_\Lambda>10r$ 用菜单 (3)、$j=\lceil r/(\kappa q)\rceil$（sampling.tex:217-226）。第一条处方落在宣称的范围内是因为 $j\kappa q\le r+\kappa q$；第二条我多验了一步：最大化 $e$ 意味着 $(1+\kappa)^{e+1}>D_\Lambda/r$，故 $R=D_\Lambda/(1+\kappa)^e<(1+\kappa)r$ 的下界方向由 $R\ge r$ 与 $R<(1+\kappa)r$ 夹住（sampling.tex:227-233）。这些都只是分析用的处方，算法不测试 $S_0$ 归属、不识别比较簇、也没有依赖比较的停止条件（sampling.tex:353-355）。

第三菜单的互斥。取两次第三菜单加法，前者早于后者，下标 $a,b$。若有公共客户则 $d(w_a,w_b)\le q_a+q_b<(r_a+r_b)/10$，两处严格号来自第三菜单必有 $q<r/10$；到 $O$ 的距离 Lipschitz 给 $\lvert r_a-r_b\rvert<(r_a+r_b)/10$，于是 $9/11<r_a/r_b<11/9$（sampling.tex:263-273）。早加的叶在后续仍是可用竞争者，故
\[
 D_\Lambda\le d(w_b,w_a)+R_a<\left[\frac1{10}+\frac{11}{9}\left(\frac{11}{10}+\frac{11\kappa}{10}\right)\right]r_b\le\left(0.1+\frac{24.2}{9}\right)r_b=2.788\ldots\,r_b<3r_b<10r_b
\]
（sampling.tex:276-283）。我在草稿纸上把括号里的数手算成 $11/9\cdot2.2=24.2/9=2.6888\ldots$，加 $0.1$ 得 $2.7888\ldots$，裕度 $3-2.789$ 全靠 $\kappa\le1$；这与分支前提 $D_\Lambda>10r_b$ 矛盾，所以第三菜单加法对应的闭球 $\mathcal D(w,r^0(w))$ 两两不交（sam:radius-budget 陈述部分, sampling.tex:240-242）。

预算与概率。由定义 $q\lvert\mathcal D(w,q)\rvert\ge P/m$ 和不交性，正文给出（sam:third-menu-budget, sampling.tex:243-249）
\[
 \sum_{\text{third}}\frac rq\le\frac{10m}{9},\qquad
 \sum_{\text{third}}j\le\left(\frac{10}{9\kappa}+1\right)m,
\]
我在草稿纸上把第二式与 $j=\lceil r/(\kappa q)\rceil$ 对上：$j\le r/(\kappa q)+1$，除以 $\kappa$ 后用第一式，再加条目数 $\le m$。第一式的 $10/9$ 我理解成几何级数 $1/(1-1/10)$ 的摊法：每次第三菜单加法占用一块人口质量 $q\cdot n/\!(P/m)\ge1$，而半径比被夹在 $9/11$ 与 $11/9$ 之间，累加时以 $1/10$ 的相对损失收敛。据此每个处方的第三菜单指标都不超 $J_{\kappa,m}$（sampling.tex:250-251）。菜单概率方面，$j$ 的权重 $2^{J_{\kappa,m}-j}/(2^{J_{\kappa,m}}-1)=2^{-j}/(1-2^{-J_{\kappa,m}})>2^{-j}$，乘上 $1/3$ 的菜单选择与某个 $c_\kappa\in(0,1]$，得整条处方的乘积
\[
 \prod(\text{菜单与条目})\ge c_\kappa^m\,2^{-(10/(9\kappa)+1)m}=\exp(-O_\kappa(m))
 \qquad(\text{sam:menu-probability, sampling.tex:251-258}).
\]
$\kappa=10^{-6}$ 时 $10/(9\kappa)+1=1\,111\,112.33\ldots$，我在草稿纸上记成 $1.12\times10^{6}$，$\log_2$ 意义下每步约 $1.1\times10^{6}$ 比特的运气。加上引导过程的每步条件概率 $\ge\rho$（sam:probability 的 (i)(ii)，sampling.tex:361-373）与至多 $2m$ 步（每步让 $\lvert A\rvert+\lvert Q\rvert$ 增一、上界 $2m$，sampling.tex:604-610），正文得到
\[
 \rho^{2m}c_\kappa^m2^{-(10/(9\kappa)+1)m}=\exp(-O_{\kappa,\rho}(m))
 \qquad(\text{sam:guided-likelihood, sampling.tex:381-385}).
\]
我对这一步的概率结构多核了一次：终端引导历史构成前缀自由族，它们在实际历史树里的柱集因此两两不交，求和时不需要挑一条固定的领袖序列，是对所有由引导生成的客户历史做积分（sampling.tex:411-419）。有限随机比特实现里，每个基本转移的概率从下方被保留 $1/2$，至多 $2m$ 个因子把界改成最多 $2^{-2m}$ 倍（sampling.tex:421-425, 649-665），仍写成 $\exp(-O_{\kappa,\rho}(m))$ 的形状。

质量与停止。近客集 $N_i(a)=\{p\in C_i:d_p^*\le a\bar d_i\}$ 满足 $\lvert N_i(a)\rvert\ge(1-1/a)n_i$ 与 $d(i,H)\le a\bar d_i+T_i(a)/((1-1/a)n_i)$（sam:general-near-bound, sampling.tex:436-441）。主截断 $a=1.2$ 下（sam:far-client-bound, sampling.tex:444-448）
\[
 d(i,H)\le1.02\bar d_i+\frac{60T_i}{n_i},\qquad
 d(p,H)\le1.85d_p^*+\frac{60T_i}{n_i}\quad(p\in C_i\setminus N_i),
\]
其中 $60$ 来自用截断 $1.02=51/50$ 再算一次人口：$\{p:d_p^*\le1.02\bar d_i\}$ 至少 $n_i/51\ge n_i/60$ 个成员（sampling.tex:459-462）；$1.85=1+1.02/1.2$ 我手算 $1.02/1.2=0.85$（sampling.tex:463-468）。停止量 $T_{\rm near}(H)=\sum_{i\in B}\sum_{p\in N_i}d(p,H)$、$I(H)=\sum_{s\in R^*}\sum_{p\in J_s}d(p,H)$，$R^*=S_0\setminus Q$，规则 $T_{\rm near}\le\kappa P$ 且 $I\le\kappa P$（sam:stopping-quantities 与 sam:stopping-rule, sampling.tex:478-492）。总权重链我逐段代过（sam:sampling-mass 证明, sampling.tex:512-549）：好客户 $\le P_g+0.01P$；已覆盖坏簇用 $d(p,H)\le d_p^*+r_i+R_i$（sampling.tex:517-520）配合 $r_i\le1.2\bar d_i$ 与领袖半径和，得 $\le(3.4+1.2\kappa)P_A+5.2\kappa P$；未覆盖簇自身 $\le1.85P_i+61T_i$。合并时我按系数取最大的方式重算：$P_g+P_A+P_B=P$，三类系数 $1$、$3.4+1.2\kappa$、$1.85$ 的最大者是 $3.4+1.2\kappa$，于是
\[
 W(H)\le(3.4+1.2\kappa)P+0.01P+5.2\kappa P+61T_{\rm near}(H)=(3.41+6.4\kappa)P+61T_{\rm near}(H)<3.42P+61T_{\rm near}(H),
\]
末步是 $6.4\times10^{-6}<0.01$（sam:weight-bound, sampling.tex:497）。推进概率我按单调性重算：$T>0$ 时 $T/(3.42P+61T)$ 对 $T$ 递增，故 $T_{\rm near}>\kappa P$ 时球模式事件概率
\[
 \frac{T}{2W(H)}\ge\frac{T}{2(3.42P+61T)}>\frac{\kappa}{2(3.42+61\kappa)}=\rho_\kappa
 \qquad(\text{sam:progress-constant, sampling.tex:500-506, 541-543}),
\]
另一支用 $W(H)\le(3.42+61\kappa)P$ 与 $I>\kappa P$ 得 $I/(2W(H))>\rho_\kappa$（sampling.tex:545-549）。$\kappa=10^{-6}$ 时我在草稿纸上算 $\rho_\kappa=10^{-6}/(2\cdot3.420061)=1.4619\ldots\times10^{-7}$，即 $1/3$ 的模式选择已经把 $1/2$ 吃进分母。放大段是重复实验 $\exp(O_\kappa(M_0))\log(1/\zeta)$ 次，漏掉全部成功前缀的概率 $\le\zeta$，每次运行只存 $2m+1$ 个状态，完成过程可以逐一检查这些状态并把最便宜的可行输出与回退解 $S$ 一起保留（sampling.tex:667-675）。枚举范围 $1\le P\le n\Delta$、$m\in\{1,\ldots,\min\{\lfloor M_0\rfloor,h\}\}$ 与 $m=0$ 候选直接取 $S$（sampling.tex:623-630），我在草稿纸上确认这两条在整实例上是多项式规模，而 $M_0=O(\log N)$ 才是把 $\exp(O_\kappa(m))$ 变成多项式的那一步（sampling.tex:667-668）。

## 21. 草稿纸重算之四：子模完成段与 $1.922065432$ 的逐位对账

完成段我把两处最容易看错的算术拆开重算：范畴连续贪心的误差预算，以及最终系数 $1.922065432$ 的每一位来源。

子模设定与目标。$g:2^E\to\mathbb R_{\ge0}$ 归一（$g(\varnothing)=0$）、单调（$U\subseteq V\Rightarrow g(U)\le g(V)$）、子模（$g(U\cup\{e\})-g(U)\ge g(V\cup\{e\})-g(V)$，$U\subseteq V$、$e\notin V$），记 $\Delta_eg(U)=g(U\cup\{e\})-g(U)$，$e\in U$ 时取值 $0$；划分约束是 $E=E_1\sqcup\cdots\sqcup E_a$ 中每块至多选一个元（completion.tex:23-32）。引理 comp:partition-max 断言：给定精确值 oracle、$0<\varepsilon<1-1/e$，用 $\operatorname{poly}(|E|,a,1/\varepsilon)$ 次 oracle 调用返回可行 $X$ 且 $\mathbb E[g(X)]\ge(1-1/e-\varepsilon)\max\{g(Y):\lvert Y\cap E_j\rvert\le1\ \forall j\}$（completion.tex:34-50）。我在草稿纸上核最后一句：$1-1/e>0.6321$，故只要误差 $<0.0121$ 就得到 $0.62$；反过来任取有理 $\theta>1/e$ 就得到因子 $1-\theta$，本文后段用 $\theta=0.38$，即 $1-\theta=0.62$，$0.38-1/e=0.38-0.3678794\ldots=0.0121206>0$（completion.tex:149-151, 495）。这条数值链我记成一个对照表：$M_1=\max_{e\in E}g(\{e\})$ 用 $q=\lvert E\rvert$ 次调用求出，若 $E=\varnothing$ 或 $M_1=0$，子模加伸缩给出 $g(Y)\le\sum_{e\in Y}g(\{e\})=0$，结论平凡（completion.tex:53-58）。

导数与方向。独立范畴抽样：在每块内以概率 $x_e$ 选 $e$、剩余概率选空，得可行随机集 $R_x$ 与 $G(x)=\mathbb E[g(R_x)]$， multilinearity 给 $\partial_eG(x)=\mathbb E[\Delta_eg(R_x\setminus E_j)]$，$e\in E_j$（comp:categorical-derivative, completion.tex:60-68）。对被积函数我用 $0\le\Delta_eg\le M_1$。固定可行最优 $O_g$ 时 $g_{\max}-g(R_x)\le\sum_{e\in O_g}\Delta_eg(R_x)\le\sum_{e\in O_g}\Delta_eg(R_x\setminus E_{j(e)})$，第二处不等号在 $e\in R_x$ 时左项为 $0$ 所以仍成立（completion.tex:69-77），取期望后得 $\sum_{j=1}^a\max_{e\in E_j}\partial_eG(x)\ge g_{\max}-G(x)$（comp:derivative-direction, completion.tex:78-82）。

步数、样本数与误差。取 dyadic $\tau$ 满足 $\min\{\varepsilon/8,1/16\}\le\tau\le\min\{\varepsilon/4,1/8\}$、位长 $O(\log(2/\varepsilon))$，$T$ 是 $\ge a^2/\tau$ 的最小 $2$ 的幂（completion.tex:84-86）。$Q_0=Tq$ 次导数估计，每次取 $L=\lceil Q_0a^2/(4\tau^3)\rceil$ 个独立样本的均值；每个样本方差 $\le M_1^2/4$，Chebyshev 给误差超 $\tau M_1/a$ 的概率 $\le\tau/Q_0$，逐点条件成立故 union bound 给出全部估计准确的事件概率 $\ge1-\tau$（completion.tex:94-105）。我在草稿纸上代 $Q_0=Tq$ 验一次 Chebyshev：均值方差 $\le M_1^2/(4L)$，阈值 $\tau M_1/a$，概率比 $\le M_1^2/(4L)\cdot a^2/(\tau^2M_1^2)=a^2/(4L\tau^2)$，取 $L=Q_0a^2/(4\tau^3)$ 即得 $\tau/Q_0$，与正文一致。在该事件上 $\nabla G(x^{(t)})\cdot v^{(t)}\ge g_{\max}-G(x^{(t)})-2\tau M_1$（comp:estimated-direction, completion.tex:106-110）。

积分误差我按耦合重算：把 $x$ 与 $x+uv$ 的范畴抽样耦合，只有额外质量 $u$ 被用掉时该块结果才变，每块变化概率 $\le u$；对某一块自己的导数而言，其它块变化的概率 $\le au$，而被积函数在 $[0,M_1]$ 内，故期望变化 $\le auM_1$。对 $a$ 个选中坐标求和并对 $0\le u\le1/T$ 积分，正文写成
\[
 G(x^{(t+1)})-G(x^{(t)})\ge\frac{g_{\max}-G(x^{(t)})-2\tau M_1}{T}-\frac{a^2M_1}{T^2}\ge\frac{g_{\max}-G(x^{(t)})-3\tau M_1}{T}
 \qquad(\text{completion.tex:112-127}),
\]
末步我核过：$\int_0^{1/T}auM_1\,du=aM_1/(2T^2)$，乘 $a$ 个坐标得 $a^2M_1/(2T^2)\le a^2M_1/T^2$，再用 $T\ge a^2/\tau$ 把 $a^2M_1/T^2\le\tau M_1/T$ 吸收进 $2\tau\to3\tau$。从 $G(0)=0$ 迭代（completion.tex:128-133）：
\[
 G(x^{(T)})\ge\bigl(1-(1-1/T)^T\bigr)(g_{\max}-3\tau M_1)\ge(1-1/e-3\tau)g_{\max},
\]
我在草稿纸上验 $(1-1/T)^T\le1/e$：$1-1/T\le e^{-1/T}$ 两边取 $T$ 次方。最后乘上失败概率的 $(1-\tau)$（失败时收益仍非负，故无条件期望仍受此下界）：
\[
 (1-\tau)(1-1/e-3\tau)g_{\max}\ge(1-1/e-4\tau)g_{\max}\ge(1-1/e-\varepsilon)g_{\max}
 \qquad(\text{completion.tex:134-142}),
\]
$4\tau\le4\cdot\varepsilon/4=\varepsilon$（$\tau\le\varepsilon/4$ 分支）；$\tau\le1/8$ 分支只在 $\varepsilon$ 大时起作用，我用 $0<\varepsilon<1-1/e$ 保证 $1-1/e-4\tau\ge0$。随机比特：所有范畴概率分母都是 $T$，每块一次 $\{0,\ldots,T-1\}$ 均匀整数即 $\log_2T$ 个公平比特（completion.tex:143-146）。

蓝块与红代理的计数。固定 $\lvert S\rvert=\lvert O\rvert=h\ge1$、好中心的单射代理 $\phi_i$、坏数 $m>0$、$S_0$ 为未用作代理的 $m$ 个设施；前缀含 $Q\subseteq S_0$ 与 $A$ 上每点一球 $\mathcal F_i=\{x\in F:d(w_i,x)\le R_i\}$，$i\in\mathcal F_i$，$B$ 为剩余坏中心，$a=\lvert A\rvert$、$c=m-a$、$r=m-\lvert Q\rvert$（completion.tex:156-175）。我在草稿纸上把完成段的人数账算清：还要移除 $r$ 个原设施、最多添加 $a+c=m$ 个真实终点，这就是 comp:completion 输出至多 $h$ 个真实设施的原因（completion.tex:176-178, 352-354）。颜色：$S\setminus Q$ 中每点独立取绿/红/蓝，概率 $1/2$、$1/4$、$1/4$，两个公平比特足够；枚举 $b_{\rm red}+b_{\rm blue}=r$ 的所有非负计数，颜色候选不足的分支丢弃（completion.tex:180-185）。蓝标签：固定 $b=b_{\rm blue}>0$，每个蓝候选独立取 $[b]$ 中标号，用 $\{0,\ldots,2^{\lceil\log_2b\rceil}-1\}$ 的均匀整数取模加一实现，每个标号概率 $\ge1/(2b)$（completion.tex:190-194）。块成本 $C(U)=\min_{x\in F}\sum_{\ell\in U}\min_{s\text{ blue},\operatorname{label}(s)=\ell}w'_sd(s,x)$，缺标号即 $+\infty$，同时存最小化见证 $x$ 与每标号一个移除候选（comp:blue-block, completion.tex:195-202）。子集 DP：$D(0,\varnothing)=0$、$D(t,U)=\min_{\varnothing\ne V\subseteq U}(C(V)+D(t-1,U\setminus V))$，其它零块状态置 $+\infty$，空族上的 $\min$ 也置 $+\infty$，取 $K=\min_{1\le t\le c}D(t,[b])$，$K=\infty$ 则丢弃该分支；$b>0,c=0$ 不可行，$b=0$ 时 $K=0$（completion.tex:203-215）。复杂度我用 $\sum_{V\subseteq U}1$ 的规模核过：块成本至多 $2^b\operatorname{poly}(N)$，DP 额外 $O(c3^b)$ 次算术（completion.tex:216-217），因为 $(t,U)$ 层里对非空子集的枚举总量是 $\sum_{s\le b}\binom bs2^s=3^b$。精确性论证是双向的：任何可行路由按终点划分标号，成本 $\ge$ 对应块最小和；反过来每个有限划分有存下的见证实现其值；不同标号选不同移除（一个候选只有一个标号），不同块可共用终点，只会减少开出的设施数（completion.tex:218-224）。复制集合 $E=\bigsqcup_{i\in A}E_i$、$E_i=\{(i,x):x\in\mathcal F_i\}$ 的大小 $\le a\lvert F\rvert\le N^2$，到子集的距离按底层设施解释，球相交不做等同（completion.tex:226-229, 461-462）。

完成不等式。comp:completion 里我先把四个量抄进草稿纸：$R^*=S_0\setminus Q$、$J=\bigcup_{s\in R^*}J_s$、$I=\sum_{p\in J}d(p,H)$、$X^*=\{(i,i):i\in A\}$；客户计费 $c_p$ 按三类分别是 $d(p,\phi_i)$（$i$ 好）、$d_p^*+\theta(r_i+R_i)$（$i\in A$）、$d_p^*$（$i\in B$），$b_p=\theta d(p,H)+(1-\theta)\min\{d(p,H),d(p,X^*)\}$（comp:client-charges, completion.tex:334-351）。结论是工作 $\exp(O(m))\operatorname{poly}(N,1/(\theta-1/e))$、存在概率 $\ge\exp(-O(m))$ 的颜色与标号事件，事件内每次实现都满足
\[
 \mathbb E[\operatorname{cost}(U)]\le2I+\sum_{p\in J}c_p+\sum_{p\notin J}b_p
 \qquad(\text{comp:completion-bound, completion.tex:359-363}),
\]
并且 $b_p\le c_p$ 对好客户与 $A$ 中客户成立、$b_p\le d(p,H)$ 对 $B$ 成立（completion.tex:364-368）。证明链条我按四段复核：其一，对可行计数分支调用 comp:partition-max（误差取 $\le\theta-1/e$）并保留最便宜构造解含回退 $S$，由最优性得 $\mathbb E[\operatorname{cost}(U)]\le\mathbb E[\Psi(X)]\le\theta\Psi(\varnothing)+(1-\theta)\Psi(X^*)$（comp:convex-surrogate, completion.tex:371-383）。其二，混合距离 $M_s$ 对三类终点取最小：$d(s,\phi_i)$、$(1-\theta)d(s,i)+\theta(d(s,w_i)+R_i)$、$d(s,i)$（comp:mixed-distance, completion.tex:387-397）；前两类要求 $s$ 红、第三类要求蓝、第一类用到的代理要求绿，要求彼此相容因 $R^*\subseteq S_0$ 而代理都在 $S_0$ 外，被指定颜色的点至多 $2r\le2m$ 个，故事件概率 $\ge4^{-2m}$（completion.tex:398-405）。其三，指定蓝标号互异的概率 $\ge b!(2b)^{-b}\ge(2e)^{-b}$，我用 $\log(b!)\ge\int_1^b\log x\,dx=b\log b-b+1$ 复核：$b\log b-b+1\ge-b\log(2e)$ 等价于 $(b+1)\log b\ge b\log2-1$，$b=1$ 时左 $0$ 右 $-0.306$ 成立，$b$ 增大时左端增长更快；蓝的指定移除按终点分组至多 $\lvert B\rvert=c$ 块，所以对 comp:blue-block 与 DP 可行，$K$ 至多指定蓝计费 $\sum w'_sM_s$（completion.tex:407-420）。其四，指定红子集在 $X=\varnothing$ 与 $X=X^*$ 两点处都可用，凸组合加 $K$ 至多 $\sum_{s\in R^*}w'_sM_s$（comp:removal-comparison, completion.tex:422-434）。最后一步我把三角不等式代进去：对 $p\in J_s\cap C_i$ 把 $p$ 自己的簇作为终点报给 $M_s$，好情形与未覆盖情形给 $M_s\le d(p,H)+d(p,\phi_i)$ 与 $M_s\le d(p,H)+d_p^*$，覆盖情形
\[
 M_s\le(1-\theta)d(s,i)+\theta(d(s,w_i)+R_i)\le d(p,H)+(1-\theta)d_p^*+\theta(d_p^*+r_i+R_i)=d(p,H)+c_p
\]
（completion.tex:435-447）；$M_s$ 对 $J_s$ 全体客户只需取一次，却不超过每个报价，求和得 $\sum w'_sM_s\le I+\sum_{p\in J}c_p$；凸组合的基础项在 $J$ 上再贡献至多 $I$、在补集上恰为 $b_p$，合并即 comp:completion-bound（completion.tex:448-454）。

恢复定理的数值链。comp:recovery 假设 $\sum_{i\text{ good}}\sum_{p\in C_i}d(p,\phi_i)\le P_g+0.01P$、$m\le M_0$，结论是只知 $S,M_0,\zeta$ 的算法以概率 $\ge1-\zeta$ 返回大小 $\le h$、成本 $\le1.97P$ 的真实解，运行时间 $\exp(O(M_0))\operatorname{poly}(N)\log(2/\zeta)$；$m=0$ 时 $S$ 自身成本 $\le1.01P$（completion.tex:470-494）。$m>0$ 时取 $\kappa=10^{-6}$、$\theta=0.38$，成功前缀给 $I\le\kappa P$、$\sum_{i\in B}T_i\le\kappa P$ 与 $r_i\le1.2\bar d_i$、$R_i\le(1+\kappa)r_i+\kappa r^0(w_i)$、$\sum_{i\in A}n_ir^0(w_i)\le5.2P$、$d(p,H)\le1.85d_p^*+60T_i/n_i$（comp:main-endpoint, completion.tex:499-516）。覆盖坏簇的合计我逐项代：
\[
 \sum_{i\in A}\left[P_i+\theta n_i\bigl((2+\kappa)1.2\bar d_i+\kappa r^0(w_i)\bigr)\right],
\]
其中 $r_i+R_i\le(2+\kappa)r_i+\kappa r^0(w_i)\le(2+\kappa)1.2\bar d_i+\kappa r^0(w_i)$（用 $R_i\le(1+\kappa)r_i+\kappa r^0$），$\sum_iP_i=P_A$、$\sum_in_i\bar d_i=P_A$、$\sum_in_ir^0(w_i)\le5.2P$（completion.tex:518-524）。剩余坏簇按 $J$ 内 $\le d_p^*$、$N_i\setminus J$ 用 $T_i$、其余用 $1.85d_p^*+60T_i/n_i$ 分类，合起来 $\le1.85\sum_{i\in B}P_i+61\sum_{i\in B}T_i$，$61=1+60$ 我核过：近客自身的 $T_i$ 加上远客的 $60T_i/n_i$ 乘至多 $n_i$ 人（completion.tex:525-529）。于是条件期望
\[
 \mathbb E[\operatorname{cost}(U)]\le2\kappa P+P_g+0.01P+\sum_{i\in A}\left[P_i+\theta n_i((2+\kappa)1.2\bar d_i+\kappa r^0(w_i))\right]+1.85\sum_{i\in B}P_i+61\kappa P,
\]
我把系数全部摊到 $P$ 上，用 $\sum_{i\in A}P_i\le P$、$\sum_{i\in B}P_i\le P$、$P_g\le P$ 中受 $P_g+P_A+P_B=P$ 约束的最大者：
\[
 \left[1+0.38(2+10^{-6})1.2+0.01+63\cdot10^{-6}+0.38\cdot5.2\cdot10^{-6}\right]P=1.922065432P<1.94P
 \qquad(\text{completion.tex:531-541}).
\]
我在草稿纸上按位核：$0.38\cdot1.2=0.456$，$0.456\cdot2.000001=0.912000456$；$0.38\cdot5.2=1.976$，故末项 $1.976\times10^{-6}=0.000001976$；$2\kappa+61\kappa=63\kappa=0.000063$；累加 $1+0.912000456+0.01+0.000063+0.000001976=1.922065432$，与正文逐位相同。覆盖系数 $1.912000456$ 同时压住好系数 $1$ 与未覆盖系数 $1.85$，这一步在正文里被写成一句注（completion.tex:543-545）。输出成本非负，Markov 给
\[
 \Pr\{\operatorname{cost}(U)\le1.97P\}\ge1-\frac{1.94}{1.97}=\frac3{197}=0.015228\ldots
 \qquad(\text{completion.tex:547-552}),
\]
我在草稿纸上验 $1.97-1.94=0.03$、$0.03/1.97=3/197$。三个概率相乘：采样 $\exp(-O_\kappa(m))$、颜色与标号 $\exp(-O(m))$、Markov 的常数 $3/197$，放大为 $\exp(-Cm)$（$C$ 为绝对常数，$\kappa$ 已固定且 $m\ge1$）；它们对每个成功前缀都是条件界，所以前缀形状与所需颜色之间无需独立性假设（completion.tex:553-559）。算法侧只枚举 $1\le m\le\min\{M_0,h\}$ 与整数成本猜测 $1\le P\le n\Delta$，每个猜测重复 $\lceil\exp(CM_0)\log(1/\zeta)\rceil$ 轮，取所有前缀与所有猜测中最便宜者含回退 $S$；正确猜测的每轮失败率 $\le1-\exp(-Cm)\le1-\exp(-CM_0)$，$T$ 轮独立重复把漏检概率压到 $\le e^{-T\exp(-CM_0)}\le\zeta$（completion.tex:561-578）。这里我在草稿纸上补一句：独立性只用在同一猜测的重复实验之间，前缀与颜色的相关已经由条件化解决。所有分支（含错误猜测）都受 $|Q|>m$、球数 $>m$、空设施球、不可能计数的剔除，并满足 comp:cardinality 的大小约束，因此预算在每个结果上都成立（completion.tex:573-578）。

## 22. 草稿纸重算之五：后缀恒等式、$0.175\rho^2$ 矛盾与 $2-\gamma/2$

这一节的草稿纸我折成三栏：左栏 strictness 的标量化与矛盾，中栏 surplus 的两处除法，右栏 assembly 的 $\gamma$ 展开。三栏的常数必须互相对得上，所以我按栏逐个重算。

左栏：strictness 的常数与结论。str:constants 给 $B=T+2$、$\rho=\frac1{200B}$、$c(T)=\frac{\rho^2}{100}>0$，附加条件 $0\le\delta<1$、$0<v\le1$、$v^2\le\frac{c(T)}{6(T+2)}$；结论是对任意正则设施 $i$ 与正成本非空客户集 $C$（$P_C=\sum_{p\in C}d(i,p)$）有 $\lambda\le TP_C\Rightarrow\sum_{p\in C}\alpha_p\le\lambda+(2-\frac{c(T)}2)P_C$（str:constants 与 str:conclusion, strictness.tex:24-44）。我在草稿纸上把 $B$ 代成算法侧的值：正文取 $T=200C_0$、$C_0=10+60000\cdot2^{3999}$（surplus.tex:12-18），于是 $B=200C_0+2$、$\rho=\frac1{200(200C_0+2)}$，$\rho<1/400$ 的检查就是 $B>2$ 的直接推论（strictness.tex:189-190）。标量化步骤把成本、相位、预算全除 $P_C$，此后 $\sum_jd_j=1$、$\lambda\le T$（strictness.tex:124-127）。$q=\lvert C\rvert$ 个客户按固定重放中的移除步编号，$Q_p^-$ 是移除步前的已开集、$z_p$ 是该状态的相位值，$d_p=d(i,p)$、$a_p=z_p/K$、$K=1+v^2$、$t=1-\delta$；重放性质 $z_p\le t\,d(p,Q_p^-)$、$\alpha_p\le Kz_p$、$t\,d(p,Q_p^+)\le Kz_p$ 加上该步之后距离不增（str:history-used, strictness.tex:62-71），步前不减价给出 $\sum_{j\text{ active}}[z_p-d(i,j)]_++\sum_{j\text{ inactive}}[t\,d(j,Q_p^-)-d(i,j)]_+\le\lambda$（str:no-overbid, strictness.tex:74-78）。对 $j<p$ 定义 $r_{jp}$：已失活时取 $t\,d(j,Q_p^-)/K$，同原子步移除时取 $z_p$；固定 $j$ 时它随 $p>j$ 不增，我在草稿纸上把三段都走了一遍：同一步内是常数，之后第一个步由 str:history-used 给 $t\,d(j,Q_p^-)/K\le z_j$，再往后开集只增（strictness.tex:81-94）。失活情形由扩展度量上的三角不等式给 $r_{jp}\ge\frac tK(d(p,Q_p^-)-d(p,j))\ge a_p-\frac tK(d_p+d_j)\ge a_p-d_p-d_j$，同步情形由 $r_{jp}=z_p\ge a_p$（strictness.tex:96-103）。设 $A_p=\max_{s\ge p}(a_s-d_s)$，单调性给 $r_{jp}\ge r_{js}\ge a_s-d_s-d_j$ 对每个 $s\ge p$，故 $r_{jp}\ge A_p-d_j$；$j<p$ 的贡献 $\ge[A_p-2d_j]_+$（$K\ge1$），$j\ge p$ 在步前都活跃、贡献 $\ge[a_p-d_j]_+$，丢掉 $C$ 外的客户得后缀不等式（str:suffix, strictness.tex:104-122）
\[
 \sum_{j\ge p}[a_p-d_j]_++\sum_{j<p}[A_p-2d_j]_+\le\lambda\qquad(1\le p\le q).
\]
松弛量定义为 $E_p=\lambda+1+D_{p-1}+(p-1)d_p-qa_p$、$D_{p-1}=\sum_{j<p}d_j$（str:slack-definition, strictness.tex:126-130）。我用 $[x]_+=x+[-x]_+$ 展开后缀式，正文得到两层下界（str:slack-envelope, strictness.tex:131-138）
\[
 E_p\ge(p-1)(A_p-a_p+d_p)+\sum_{j\ge p}[d_j-a_p]_++\sum_{j<p}[2d_j-A_p]_+\ge(p-1)(A_p-a_p+d_p)\ge0,
\]
另一条先把 $A_p$ 换成下界 $a_p-d_p$ 再展开，得 $E_p\ge\sum_{j\ge p}[d_j-a_p]_++\sum_{j<p}[2d_j+d_p-a_p]_+\ge\sum_j[d_j-a_p]_+=:F(a_p)$（str:slack-truncation, strictness.tex:139-145）。恒等式那一步我在草稿纸上重算了系数：在 $\sum_p(D_{p-1}+(p-1)d_p)$ 中 $d_j$ 出现 $(q-j)$ 次与 $(j-1)$ 次，和为 $q-1$，于是
\[
 \overline E=\frac1q\sum_{p=1}^qE_p=\lambda+1+\frac{q-1}{q}\sum_jd_j-\sum_pa_p=\lambda+2-\frac1q-\sum_pa_p
 \qquad(\text{str:slack-identity, strictness.tex:146-151}),
\]
这里 $\sum_jd_j=1$ 是关键，我特意核了归一化没漏。反证设 $\Delta=\lambda+2-\sum_pa_p<c$，则 $0\le\overline E=\Delta-1/q<c$，进而 $1/q<c$、$q>1/c>4/\rho$（str:small-deficit, strictness.tex:153-163）；$1/c=100/\rho^2>4/\rho$ 等价于 $25>\rho$，我在草稿纸上代 $\rho<1/400$ 验过。$F$ 凸且不增，$\sum_pa_p\le\lambda+2-1/q\le T+2=B$，Jensen 给
\[
 F(B/q)\le F\!\left(\frac1q\sum_pa_p\right)\le\frac1q\sum_pF(a_p)\le\overline E<c
 \qquad(\text{str:jensen, strictness.tex:164-171}),
\]
我在草稿纸上把 $\le\overline E$ 的来源指回 str:slack-truncation 的最右端。小集合质量随之封住：$\lvert J\rvert\le2\rho q$ 时
\[
 \sum_{j\in J}d_j\le\lvert J\rvert B/q+F(B/q)<2\rho B+c=\frac1{100}+c<\frac1{50}
 \qquad(\text{str:small-set-mass, strictness.tex:172-177}),
\]
每点 $d_j\le B/q+[d_j-B/q]_+$、和式第二项 $\le F(B/q)$，$2\rho B=2B/(200B)=1/100$ 这一步我算了两遍，$B$ 正好消掉。尾指标：$d_j>2B/q$ 的指标少于 $cq/B$ 个（每个对 $F(B/q)$ 贡献 $>B/q$），$E_j>1/10$ 的少于 $10cq$ 个（均值 $<c$），取 $r=\lfloor\rho q\rfloor$ 后尾部长度 $r$ 大于两个例外集之并，因为
\[
 \frac rq\ge\rho-\frac1q>\rho-c>(10+1/B)c,
\]
末步我用 $B>2$、$\rho<1/400$、$c=\rho^2/100$ 化成 $12\rho^2/100<\rho$（strictness.tex:179-191）。于是存在 $s\in\{q-r+1,\ldots,q\}$ 使 $d_s\le2B/q$、$E_s\le1/10$（str:tail-index, strictness.tex:191-194）；尾部至多 $r\le\rho q$ 个指标，套用质量封住得 $D_{s-1}>49/50$，又有 $(q-s+1)d_s\le r(2B/q)\le2\rho B=1/100$，整理 str:slack-definition：
\[
 q(a_s-d_s)=\lambda+1+D_{s-1}-(q-s+1)d_s-E_s>\lambda+1+0.98-0.01-0.10=\lambda+1.87>\lambda+1.8
 \qquad(\text{str:tail-large, strictness.tex:195-202}).
\]
早段取整数区间 $I=\{\lceil\rho q\rceil,\ldots,\lfloor2\rho q\rfloor\}$，$p\in I$ 时前缀至多 $2\rho q$ 个指标，用 $E_p,d_p\ge0$ 与质量界得 $q(a_p-d_p)=\lambda+1+D_{p-1}-(q-p+1)d_p-E_p<\lambda+1.02$（str:early-small, strictness.tex:204-214）；每个 $p\in I$ 都在 $s$ 前，$p\le2\rho q<(1-\rho)q+1\le q-r+1\le s$（strictness.tex:215-216），故 $A_p\ge a_s-d_s$，代入 str:slack-envelope 的第一层下界：
\[
 E_p\ge(p-1)(A_p-a_p+d_p)>(p-1)\cdot\frac{1.8-1.02}{q}>\frac{0.7(p-1)}q
 \qquad(\text{strictness.tex:217-221}).
\]
我在草稿纸上把取整单独算了一遍，令 $x=\rho q>4$：$\lvert I\rvert=\lfloor2x\rfloor-\lceil x\rceil+1>x-1>x/2$、$p-1\ge\lceil x\rceil-1\ge x-1>x/2$（strictness.tex:222-228），于是
\[
 \overline E\ge\frac1q\sum_{p\in I}E_p>\frac{0.7}{q^2}\cdot\frac x2\cdot\frac x2=0.175\rho^2>\frac{\rho^2}{100}=c
 \qquad(\text{strictness.tex:229-234}),
\]
与 str:small-deficit 冲突，故 $\sum_pa_p\le\lambda+2-c$。收尾换算回预算：$\alpha_p\le Kz_p=K^2a_p$，$v\le1$ 时 $K^2-1=2v^2+v^4\le3v^2$，所以
\[
 \sum_p\alpha_p\le K^2\sum_pa_p\le\lambda+2-c+(K^2-1)B\le\lambda+2-c+3v^2B\le\lambda+2-\frac c2
 \qquad(\text{strictness.tex:238-247}),
\]
末步正是 $v^2\le\frac{c}{6(T+2)}=\frac{c}{6B}$ 给出 $3v^2B\le\frac c2$；我在草稿纸上把这条与 str:v-condition 对照，确认分母里的 $T+2$ 就是 $B$，两处不是巧合。乘回 $P_C$ 即 str:conclusion。

中栏：surplus 的两处除法。参数选取是 $C_0=10+60000\cdot2^{3999}$、$T=200C_0$、$c=c(T)$、$v\le\min\{1/12,c/1000\}$、$v^2\le\frac{c}{6(T+2)}$、$\delta=3v$、$0<\xi\le1$，再取 $N_*$ 使 $N\ge N_*$ 时 $N^22^{-N}\le v$、$2/N\le c/200$，公共整数 $L\ge\max\{1,N_*\}$ 且阶为 $O_v(\log(N+2))$（sur:parameter-choices 与 sur:size-threshold, surplus.tex:12-39）。低敏感结论是 $\operatorname{cost}(S)\le(2-\frac c{100})\operatorname{opt}_h\le(2-\frac c{100})(1+\xi)\operatorname{opt}_k$，$h=k-L$（sur:conclusion, surplus.tex:41-55）。未合并分支我按逐字代入复核：$\lambda=2/N^2$、$P_i\ge1$ 故 $\lambda\le2\le TP_i$，对每个非空簇用 str:strictness，$(1-\delta)\operatorname{cost}(U)\le h\lambda+(2-c/2)P\le(2-c/2+c/200)P$，其中 $h\lambda\le2/N\le c/200\le(c/200)P$（surplus.tex:74-90）。除法我重新推了一遍：$\operatorname{cost}(U)\le(2-c/100)P$ 等价于 $2-c/2+c/200\le(2-c/100)(1-\delta)$，整理即
\[
 \frac c{200}+\left(2-\frac c{100}\right)\delta\le\frac c{200}+6v\le\frac{11c}{1000}<\frac{49c}{100}=\frac c2-\frac c{100}
 \qquad(\text{surplus.tex:91-96}),
\]
我用 $\delta=3v$ 把 $(2-c/100)\delta\le2\delta=6v$，再用 $v\le c/1000$ 得 $6v\le6c/1000$，左端 $c/200=5c/1000$，合起来 $11c/1000$；$49c/100=490c/1000$，裕度极大。正常分支的 $e=hN\eta$、$\eta=2^{-N}$ 我核过：$hN\le N^2$ 故 $e\le N^22^{-N}\le v\le vP$（surplus.tex:102-105）。支付与对偶不等式 (sur:payment-dual) 与任意真实集的 $\sum_p\alpha_p\le\lvert H\rvert\lambda+2\operatorname{cost}(H)$（sur:any-H, surplus.tex:106-118）合并、丢掉非负连接项得 $(h-\lvert H\rvert)\lambda\le2\operatorname{cost}(H)+e$（sur:price-comparison, surplus.tex:119-123）。取 $H$ 为 $h-L$ 中心的最优解，$\lambda L\le2(1+\xi)P+e$（sur:surplus-price, surplus.tex:124-130）。短簇计数我按抽样论证重算：$b=\lambda/8$，$i$ 短当 $n_i\operatorname{sep}_i<b$；两色独立染色、取第一色且指定近邻 $\nu(i)$ 为第二色的短中心，每个短中心被选概率 $1/4$，故某染色给 $N'=\lvert R\rvert\ge N_{\rm short}/4$，且 $\nu(i)\notin R$，重路由增量每簇 $<b$，$\operatorname{cost}(O\setminus R)\le P+bN'$（surplus.tex:132-151）。代 sur:price-comparison：$\lambda N'\le2P+2bN'+e$，用 $2b=\lambda/4$ 得 $(\lambda-\lambda/4)N'\le2P+e$，即
\[
 \lambda N_{\rm short}\le4\lambda N'\le4\cdot\frac43(2P+e)=\frac{32}{3}P+\frac{16}{3}e
 \qquad(\text{sur:short-price, surplus.tex:152-160}),
\]
我在草稿纸上把 $1/(\lambda-2b)=1/(3\lambda/4)=4/(3\lambda)$ 与 $\lambda N'\le2P+e$ 相乘，再乘 $4$，$4\cdot\frac43\cdot2=\frac{32}{3}$ 对得上。缩放条件：
\[
 b(L+N_{\rm short})=\frac{\lambda L}{8}+\frac{\lambda N_{\rm short}}8\le\frac{2(1+\xi)P+e}{8}+\frac{(32/3)P+(16/3)e}{8}=\left(\frac{19}{12}+\frac\xi4\right)P+\frac{19}{24}e\le10P
 \qquad(\text{sur:anchoring-scale, surplus.tex:161-169}),
\]
系数我逐项加：$P$ 项 $\frac28+\frac{32}{24}=\frac14+\frac43=\frac{19}{12}$，$e$ 项 $\frac18+\frac{16}{24}=\frac18+\frac23=\frac{19}{24}$，$\xi$ 项 $2\xi/8=\xi/4$；末步用 $\xi\le1$、$e\le vP$、$v\le1/12$，我在草稿纸上算 $P$ 的系数 $\le19/12+1/4=22/12=11/6$，$e$ 项换 $v$ 后 $\le\frac{19}{24}\cdot\frac1{12}=0.066\ldots$，合起来 $\le1.90P$，正文写 $10P$ 是刻意留的粗界，因为下一段只用到缩放条件的形式。锚定给出互异代理与 $P_g+P/100$、$m$ 满足 $m\lambda=8mb\le8C_0P$（sur:bad-price, surplus.tex:173-179）。二分为：$P_b\le P/10$ 时 $\operatorname{cost}(S)\le\frac65(P_g+P/100)+\frac{17}{5}P_b\le1.432P<(2-\frac c{100})P$，$c<1$ 由 str:constants 来（surplus.tex:180-187），这与我左栏 §19 的 $1.432$ 完全同源。否则 $P_b>P/10$，被排除在 $\mathcal B_T=\{i\text{ bad}:\lambda\le TP_i\}$ 外的坏簇满足 $P_i<\lambda/T$，故
\[
 \sum_{\substack{i\text{ bad}\\i\notin\mathcal B_T}}P_i\le\frac{m\lambda}T\le\frac{8C_0P}{200C_0}=\frac P{25},\qquad Q>\frac P{10}-\frac P{25}=\frac{3P}{50}>\frac P{20}
 \qquad(\text{surplus.tex:189-200}),
\]
我在草稿纸上算 $1/10-1/25=5/50-2/50=3/50=0.06>0.05$。$\mathcal B_T$ 中每簇非空正成本可用 str:strictness，其余用 sur:any-H 的簇版本 $\sum_{p\in C_i}\alpha_p\le\lambda+2P_i$（含空簇），求和：
\[
 \sum_p\alpha_p\le h\lambda+2P-\frac c2Q\le h\lambda+\left(2-\frac c{40}\right)P
 \qquad(\text{sur:summed-gain, surplus.tex:201-210}),
\]
末步是 $\frac c2\cdot\frac{3P}{50}=\frac{3c}{100}P\ge\frac{c}{40}P$（$0.03>0.025$）。$h\lambda$ 全额相消后 $(1-\delta)\operatorname{cost}(U)\le(2-\frac c{40})P+e$，第二次除法我照左栏的办法整理成
\[
 \frac eP+\left(2-\frac c{100}\right)\delta\le v+6v\le\frac{7c}{1000}<\frac{3c}{200}=\frac c{40}-\frac c{100}
 \qquad(\text{surplus.tex:211-222}),
\]
$7c/1000<3c/200=15c/1000$ 我核过；剩下 $\operatorname{opt}_h\le\operatorname{opt}_{h-L}\le(1+\xi)\operatorname{opt}_k$ 完成 sur:conclusion 的第二指（surplus.tex:223-227）。

右栏：assembly 的 $\gamma$ 展开。常数是 $\gamma=\min\{3/100,c/100\}$、$\xi=\varepsilon_0=\gamma/16$、$\sigma=\gamma/4$，故 $0<\gamma<1$，且 $C_0,T,c,\gamma,\xi,\varepsilon_0$ 都不依赖 $L$（asm:constants, assembly.tex:10-30）。敏感基数引理里 $\beta=\xi/(4L)$，我用两条对数界 $\log(1+\xi)\ge\xi/2$（$0\le\xi\le1$）与 $\log(1+\beta)<\beta$ 复核 asm:product-bound：
\[
 (1+\beta)^{2L}<\exp(\xi/2)\le1+\xi
 \qquad(\text{assembly.tex:52-58}),
\]
我在草稿纸上算 $2L\log(1+\beta)<2L\beta=\xi/2$，第二条取 $e^{\xi/2}\le1+\xi$（对 $\xi\in(0,1]$ 成立，我在 $\xi=1$ 处核：$1.6487\le2$）。$2L$ 个比值 $\operatorname{opt}_{r-1}/\operatorname{opt}_r$（$k-2L<r\le k$）之乘积 $>1+\xi$，故存在比值 $\ge1+\beta$，取最大这样的指标 $h'$，其后比值都 $<1+\beta$、乘积至多 $(1+\beta)^{2L}<1+\xi$（空乘积记 $1$），两条 asm:sensitive-ratios 同时到手（assembly.tex:59-66）。分离性：把 $i$ 的客户全挂到最近其它最优中心，得 $(h'-1)$ 心解成本至多 $P+n_i\operatorname{sep}_i$，与 $\operatorname{opt}_{h'-1}\ge(1+\beta)P$ 合并即 $n_i\operatorname{sep}_i\ge\beta P$，特别地该最优解无空簇（asm:separation, assembly.tex:68-76）。整实例候选 asm:integral：先算 width-5 局部最优 $S_k$ 作候选（成本 $\le5\operatorname{opt}_k$），$k\le2L$ 时对 $S_k$ 用 comp:recovery 取 $M_0=2L$、把每簇都宣布为坏、代理条件空置，得 $1.97\operatorname{opt}_k$，而 $1.97\le2-\gamma$ 因 $\gamma\le3/100$（assembly.tex:92-107）。$k>2L$ 时除 sur:low-sensitivity 候选外，对每个 $k-2L<h'\le k$ 算 width-5 局部最优 $S_{h'}$ 并以
\[
 M_0=\left\lceil\frac{4C_0L}{\xi}\right\rceil
 \qquad(\text{asm:count-bound, assembly.tex:110-119})
\]
调 recovery；低敏感时 (sur:low-sensitivity) 确定性给 $(2-c/100)(1+\xi)\operatorname{opt}_k\le(2-\gamma)(1+\xi)\operatorname{opt}_k$（assembly.tex:121-127）；高敏感时用 asm:sensitive 的 $h'$、$b=\beta P$，asm:separation 说明该尺度下无短中心、锚定的缩放左端为零，于是
\[
 m\le\frac{C_0P}{b}=\frac{C_0}{\beta}=\frac{4C_0L}\xi\le M_0,
 \qquad 1.97P\le1.97(1+\xi)\operatorname{opt}_k\le(2-\gamma)(1+\xi)\operatorname{opt}_k
 \qquad(\text{assembly.tex:129-146}),
\]
我在草稿纸上把 $C_0/\beta=4C_0L/\xi$ 与 $M_0$ 的天花板对上，$\lceil\cdot\rceil$ 只为整数性。两个基数界都是 $O(\log(N+2))$，基数至多 $N$ 种选择，恢复调用多项式，保留 $S_k$ 给无条件 $5$ 倍界（assembly.tex:152-157）。最后回到原理性度量：以 $\varepsilon_0=\gamma/16$ 用 pre:rounding 迁移，成功因子
\[
 (2-\gamma)(1+\xi)(1+\varepsilon_0)=(2-\gamma)\left(1+\frac\gamma{16}\right)^2
 =2-\frac34\gamma-\frac{15}{128}\gamma^2-\frac1{256}\gamma^3\le2-\frac\gamma2
 \qquad(\text{assembly.tex:161-178}),
\]
我手工展开校核：$(1+\gamma/16)^2=1+\gamma/8+\gamma^2/256$，乘 $(2-\gamma)$ 得 $2+\gamma/4+\gamma^2/128-2\gamma-\gamma^2/8-\gamma^3/256$，$\gamma$ 项 $1/4-2=-3/4$，$\gamma^2$ 项 $1/128-1/8=1/128-16/128=-15/128$，与正文逐位相同；末步只需 $\frac34\gamma\ge\frac12\gamma$，剩下两项负贡献留裕度。无条件界 $5(1+\varepsilon_0)\operatorname{opt}_k<6\operatorname{opt}_k$（assembly.tex:179-180）。给定 $a>0$ 取 $0<\zeta\le\min\{(N+2)^{-\lceil a\rceil},\gamma/24\}$，$\log(2/\zeta)=O_a(\log(N+2))$，超 $(2-\gamma/2)\operatorname{opt}_k$ 的概率 $\le\zeta\le(N+2)^{-a}$；期望分段：
\[
 \mathbb E\operatorname{cost}(S)\le(2-\gamma/2)\operatorname{opt}_k+6\zeta\operatorname{opt}_k\le(2-\gamma/4)\operatorname{opt}_k=(2-\sigma)\operatorname{opt}_k
 \qquad(\text{assembly.tex:182-201}),
\]
我在草稿纸上把 $\gamma/24$ 的来历点破：要求 $6\zeta\le\gamma/4$ 正是 $\zeta\le\gamma/24$，两处数字是同一件事的两种写法。
