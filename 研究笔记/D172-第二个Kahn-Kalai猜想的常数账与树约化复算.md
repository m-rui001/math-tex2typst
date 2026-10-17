# D172 第二个 Kahn--Kalai 猜想：一份从常数账倒推的复算笔记

## 0 取证登记与边界

本篇对象是队列第 146 行号那一篇，目录名逐字为 `preprints/The-second-Kahn-Kalai-conjecture-September-24-2026`（日期后缀 `September-24-2026` 照抄，未做任何改动）。`.tools/lean_queue.txt:146` 的原文是 `The-second-Kahn-Kalai-conjecture-September-24-2026`，它的上一行是队列第 145 行、下一行是队列第 147 行，两行都不是本篇对象。

仓库里另有一篇笔记在开头顺带提到过"第二个 Kahn--Kalai 猜想"。那一篇的对象另有其文，我这一篇与它无关：我没读它，也不引用它的任何结论。本篇的边界钉在这里，正文每一句都落在下列七个 tex 的行号上。

Lean 侧登记取自 `.tools/records.txt:142`（记录序号 1482）：`ComparatorChallenges/SecondKahnKalai.json`，declaration `OAI.LeanBlast.SecondKahnKalai.secondKahnKalaiBounds`，file `OAI/Combinatorics/GraphThreshold/Main.lean`。这条登记只用于第 15 节的对照，正文的数学内容一律以 tex 为准。

七个 tex 的 `wc -c` 实测（在 `build/source` 下，与派单给的清单完全一致，合计 $39434$ B）：

- `main.tex` $1598$ B，`references.tex` $4134$ B；
- `sections/introduction.tex` $10017$ B，`sections/resampling.tex` $5687$ B；
- `sections/trees.tex` $11542$ B，`sections/graphs.tex` $5200$ B；
- `figures/outside-label.tex` $1256$ B。

探针落盘后两次 `wc -c` 均为 $1108$ B。取证只走 tex，`pdftotext` 与任何 PDF 都没碰过，typst 分片也没读。Lean 侧只读了 records 那一行、`lean/ComparatorChallenges/SecondKahnKalai.json`，加上对 `lean/ComparatorChallenges/SecondKahnKalai.lean` 与 `lean/OAI/Combinatorics/GraphThreshold/Main.lean` 两个单文件的定点 grep，没对整个 lean 仓做递归搜索，没跑任何 git 命令。需要如实登记一处取证缺口：定点 grep 的窗口只给出 `Main.lean` 的第 $19$ 到 $55$ 行与第 $63$ 到 $75$ 行，第 $56$ 到 $62$ 行的原文我压根没读到，因此第 15 节涉及该区间的说法一律标 `[推测]`。

正文结构照 `main.tex:49-52` 的 `\input` 顺序：`introduction`（$189$ 行）、`resampling`（$149$ 行）、`trees`（$280$ 行）、`graphs`（$127$ 行），最后 `references`。符号宏在 `main.tex:23-31` 一次性定义：$\mathbb P$、$\mathbb E$、$p_{\mathrm c}$、$p_{\mathrm E}$、示性函数 $\mathbf 1$、$\mathcal T$、$\mathcal U$、$\operatorname{Ch}$、$\mathrm e$。定理与引理共享同一计数器并按节编号（`main.tex:19-21`），这个细节在第 15 节解释 Lean 侧命名时有用。

## 1 初始动机，以及我一上手以为它会是什么东西

我手里最先有的只有 abstract（`main.tex:40-47`）。它的说法是：对每个 $h\ge1$ 条边、顶点数不超过 $n$ 的有限简单图 $H$，$G(n,p)$ 含有一个 $H$ 的 ordinary copy 的阈值至多为 $C\,p_{\mathrm E}(n,H)(1+\log_2 h)$，$C$ 绝对；$p_{\mathrm E}(n,H)$ 是使 $H$ 的每个子图的期望 copy 数都不小于 $\tfrac12$ 的最小密度（`main.tex:45-46`）。

我一开始以为这会是个"两步拼"的东西：第一步用 Park--Pham 或 FKNP 那类抽象阈值定理把 $p_{\mathrm c}(\mathcal F)$ 压到 $q(\mathcal F)$ 或 $q_f(\mathcal F)$ 乘一个 log；第二步证图论侧的比较 $q_f(\mathcal F_H)=O(p_{\mathrm E}(n,H))$，两步一接，结论就有了，log 从抽象定理来。这个预期并不是凭空来的：`introduction.tex:105-115` 已经交代 Mossel--Niles-Weed--Sun--Zadik 用一个修改过的阈值 $\widetilde p_{\mathrm E}$ 拿到了单个 log，而 `introduction.tex:113-115` 说由对称性 $\widetilde p_{\mathrm E}$ 恰等于 $q_f(\mathcal F_H)$，于是"只差一个比较"这个读法看上去顺理成章。我还预计正文主要在处理那个比较。

结果 `introduction.tex:96-99` 一句话把我原先打算借的桥拆掉了：integral 与 fractional 阈值在公共 $\tfrac12$ 预算下只差绝对常数（引文 `OpenAIThresholdEquivalence2026` 的 Theorem 1.1），紧接着写"This comparison is contextual; the proof below does not use it."。作者连用都不肯用，说明这条路有我不想见的东西。我把这句话当作整篇复算的起点：先把方向账算清楚，再决定自己该怎么走。第 3 节就是这笔方向账。

至于为什么值得做，我自己的动机有三层，都能在 tex 里落地。第一层是它给"$p_{\mathrm E}$ 这类一阶动量约束到底卡住了多少"一个定量答案：$p_{\mathrm E}\le p_{\mathrm c}\le 2048\,\mathrm e^{50}p_{\mathrm E}(1+\log_2 h)$，两头都显式（`introduction.tex:30` 与 `introduction.tex:35-38`）。第二层是 log 省不掉：`introduction.tex:59-61` 的完全匹配例子给出 $p_{\mathrm E}(n,H)=\Theta(1/n)$ 而 $p_{\mathrm c}(n,H)=\Theta(\log n/n)$，`introduction.tex:63-64` 说 Hamilton 圈有同样的对数间隙，所以任何一致比较都必须留一个 log。第三层是常数：这篇的 $2048\,\mathrm e^{50}$ 与 $6144\,\mathrm e^{50}$ 全部写出（`introduction.tex:37`、`introduction.tex:41`、`graphs.tex:120-125`），而我看到的 Lean 登记（第 15 节）要的正是带常数的形式，所以我复算时把每个常数都当作会被逐字检验的对象来对待，只当它会被检验，不假定它会被改善。

还有个一开始就读错的地方，值得记下来。`introduction.tex:11-12` 定义 $N(G,F)$ 为 $G$ 中与 $F$ 同构的子图个数，`introduction.tex:12-13` 特别注明"These are ordinary copies: additional edges between the chosen vertices are allowed."。我第一遍按嵌入（embedding）去算，把 $M(F)$ 当成 $(n)_{v(F)}$；到 `graphs.tex:24-25` 才看到 $M(F)=N(K_n,F)=(n)_{v(F)}/\lvert\operatorname{Aut}(F)\rvert$，`graphs.tex:26-28` 解释说除以自同构群正是让每个 ordinary copy 只数一次，$M(I,F)$ 同样数 copy 数。嵌入与 copy 差一个 $r!$ 型的商，这个差别会一路传到 copy 比恒等式（`graphs.tex:32-34`）与极大化目标（`graphs.tex:53-55`），所以我从第 8 节起把 $M$ 一律按 copy 读。

## 2 两个阈值的定义、$\tfrac12$ 归一化，与定理形状的算术

定义在 `introduction.tex:17-23`：

$$
p_{\mathrm c}(n,H)=\inf\{p\in[0,1]:\mathbb P(N(G(n,p),H)>0)\ge\tfrac12\},
$$

$$
p_{\mathrm E}(n,H)=\inf\Bigl\{p\in[0,1]:\mathbb E N(G(n,p),F)\ge\tfrac12\ \text{对每个}\ F\subseteq H\Bigr\}.
$$

`introduction.tex:25-27` 说两个下确界都取得到，理由是相关的概率与期望连续、约束只有有限多个、且 $p=1$ 满足全部约束。我按这三句各自核了一遍：$p\mapsto\mathbb P(N(G(n,p),H)>0)$ 是 $p$ 的 polynomial（边数至多 $\binom n2$ 个因子），故连续；子图 $F$ 只到同构类、而 $H$ 的边子集只有 $2^h$ 个，故约束有限；$p=1$ 时 $G(n,1)=K_n$，只要 $v(H)\le n$ 就含 $H$。这里 `introduction.tex:28` 单独抽出单边约束给出 $p_{\mathrm E}(n,H)>0$，这一点在第 11 节判断"$r<1$ 分支是否非空"时我还会用到：$H$ 有 $h\ge1$ 条边，单边子图 $F$ 的期望是 $\binom n2 p$，要求它 $\ge\tfrac12$ 就给 $p_{\mathrm E}\ge 1/(2\binom n2)$，于是 $p_{\mathrm E}$ 有非零下界，$2048\,\mathrm e^{50}p_{\mathrm E}$ 这类乘积的 $\min\{1,\cdot\}$ 截断才不是摆设。

`introduction.tex:29-30` 给出 $p_{\mathrm E}\le p_{\mathrm c}$：若 $H$ 出现的概率至少 $\tfrac12$，则每个 $F\subseteq H$ 出现的概率也至少 $\tfrac12$，从而其期望计数至少 $\tfrac12$。我的读法是：这行的全部内容是"事件单调 + 概率 $\tfrac12$ 蕴含期望 $\tfrac12$"，它给的是同一侧的 $\tfrac12$，后面第 3 节的方向账全靠它。

$\tfrac12$ 与 $1$ 的归一化差别在 `introduction.tex:47-51`。Kahn--Kalai 原文用期望计数 $1$；换成 $\tfrac12$ 时，每个 $r\ge1$ 条边的子图的期望正比于 $p^r$，约束改变 $2^{1/r}\le2$，故 $p_{\mathrm E}$ 至多差因子 $2$，猜想形式不变。我把这笔账写成不等式：设 $p_{\mathrm E}^{(1)}$ 是预算 $1$ 的版本，则 $p_{\mathrm E}^{(1)}\le p_{\mathrm E}\le 2p_{\mathrm E}^{(1)}$？方向要小心。预算从 $\tfrac12$ 抬到 $1$ 会让约束更严，所以 $p_{\mathrm E}^{(1)}\ge p_{\mathrm E}$；而单边子图 $r=1$ 时 $2^{1/1}=2$ 是最大伸缩，故 $p_{\mathrm E}^{(1)}\le 2p_{\mathrm E}$。结论是 $p_{\mathrm E}\le p_{\mathrm E}^{(1)}\le 2p_{\mathrm E}$。tex 只写了"差一个介于 $1$ 与 $2$ 之间的因子"，与我复算一致。`references.tex:49-54` 是 Kahn--Kalai 原文（2007）。

定理（`introduction.tex:32-43`）的形状是

$$
p_{\mathrm c}(n,H)\le\min\{1,\;2048\,\mathrm e^{50}\,p_{\mathrm E}(n,H)(1+\log_2 h)\},\qquad h=e(H)\ge1,
$$

以及推论 $p_{\mathrm c}\le 6144\,\mathrm e^{50}p_{\mathrm E}\log_2 n$。推论的算术在 `graphs.tex:123-125`：$h\le\binom n2\le n^2$ 且 $n\ge2$，故 $1+\log_2 h\le 3\log_2 n$，$C=6144\,\mathrm e^{50}=3\cdot 2048\,\mathrm e^{50}$。我自己代一个数检验：$n=2$ 时 $h\le1$，$1+\log_2 h\le1$，$3\log_2 n=3$，余量 $3$ 倍；$n=4$ 时 $h\le6$，$1+\log_2 6\approx3.585$，$3\log_2 4=6$，余量仍约 $1.68$ 倍。$2048$ 与 $6144$ 的 $3$ 倍关系与 `graphs.tex:125` 逐字对应。$\mathrm e^{50}\approx5.18470\times10^{21}$，故 $2048\,\mathrm e^{50}\approx1.0618\times10^{25}$，$6144\,\mathrm e^{50}\approx3.1855\times10^{25}$。这两个数字大得离谱，我在第 12 节把它们的来源逐项拆开看，越拆越觉得它们各自都还有余量，只是没人打算在这里做优化。

记号约定在 `introduction.tex:186-189`：无下标的 $\log$ 是自然对数；对有限集 $X$ 与 $0\le\rho\le1$，$\mu_\rho$ 是 $X$ 的独立随机子集测度，每个元素以概率 $\rho$ 入选。全文所有"密度"都通过 $\mu_\rho$ 说话，$X$ 在图论侧取 $X=\binom{[n]}2$（`graphs.tex:40-41`）。这里我一开始把 $\mu_\rho$ 的下标读成"边数"，回头看 `introduction.tex:187-189` 才改过来。

## 3 失败路线一：抽象阈值机器直接压过来，被方向账卡住

我第一次动手是把 $\mathcal F_H$（含 $H$ 一份 copy 的边集族）丢进抽象机器。`introduction.tex:70-83` 把这套东西讲齐了：cover 是 $\mathcal G\subseteq 2^X$ 使每个 $F\in\mathcal F$ 包含某个 $S\in\mathcal G$，密度 $p$ 下的代价是 $\sum_{S\in\mathcal G}p^{\lvert S\rvert}$；integral 期望阈值 $q(\mathcal F)$ 是存在代价 $\le\tfrac12$ 的 cover 的最大 $p$；fractional cover 给权重 $w_S\ge0$，要求每个 $F$ 满足 $\sum_{S\subseteq F}w_S\ge1$，代价 $\sum_S w_S p^{\lvert S\rvert}$，由此得 $q_f(\mathcal F)$，预算同样 $\tfrac12$（`introduction.tex:74-79`）。union bound 与期望给 $q(\mathcal F)\le q_f(\mathcal F)\le p_{\mathrm c}(\mathcal F)$（`introduction.tex:80-83`）。

抽象侧的战绩也在这里：Talagrand 提出 fractional 表述并用 spread 概率测度做对偶描述（`introduction.tex:85-86`，`references.tex:96-101`）；ALWZ 在向日葵工作里发展 fragment 方法，站在 LSZ 的正则性观点上（`introduction.tex:87-89`）；FKNP 证 $p_{\mathrm c}(\mathcal F)=O(q_f(\mathcal F)\log\ell)$，$\ell$ 取 $2$ 与 $\mathcal F$ 中最小元最大边数的较大者（`introduction.tex:89-93`）；Park--Pham 用最小 fragment 论证把 $q_f$ 换成 $q$，解决了抽象 Kahn--Kalai 猜想（`introduction.tex:93-95`，`references.tex:82-87`）。

我算的第一个量是 $\ell$。$\mathcal F_H$ 的最小元是极小的"含一份 $H$ copy"的边集，大小是 $h$ 量级（ordinary copy 只要求选出 $v(H)$ 个点与 $H$ 的 $h$ 条边），所以 $\log\ell\asymp\log h$，正好是目标形状里的 $\log_2 h$。这一步让我一度以为已经赢了：抽象定理给 $p_{\mathrm c}(\mathcal F_H)=O(q(\mathcal F_H)\log h)$，只要 $q(\mathcal F_H)=O(p_{\mathrm E}(n,H))$ 就收工。

卡住的位置在 `introduction.tex:101-104`，原文只两句：对含 $H$ 一份 copy 的边集族 $\mathcal F_H$，某单个子图的全部 copy 就构成一个 cover，故 $p_{\mathrm E}(n,H)\le q(\mathcal F_H)$，"and the abstract theorem alone does not give the desired bound in terms of $p_{\mathrm E}(n,H)$."。我把这四条已知不等式排成一条链：

$$
p_{\mathrm E}(n,H)\;\le\;q(\mathcal F_H)\;\le\;q_f(\mathcal F_H)\;\le\;p_{\mathrm c}(n,H),
$$

抽象机器能证的是"顶端被中段控制"，我要的是"顶端被底端控制"，而链里 $q$ 与 $p_{\mathrm E}$ 之间的箭头方向恰好朝外。$2048$ 与 $\mathrm e^{50}$ 再怎么调也救不了方向。这笔账做完，第 1 节那个"两步拼"的预期就废了，`introduction.tex:96-99` 拒绝用 integral/fractional 等价也变得可以理解：那条等价说的是抽象族之间 $q$ 与 $q_f$ 的常数差，它把链的中段合并，对底端 $p_{\mathrm E}$ 无能为力。

我再确认一次 $p_{\mathrm E}\le q(\mathcal F_H)$ 的证明细节，免得自己冤枉了这条路。取 $H$ 的一个固定子图 $F$，把 $K_n$ 里所有 $F$ 的 copy 当作 $\mathcal G$：任何含 $H$ 的边集当然含某个 $F$ 的 copy，所以 $\mathcal G$ 是 cover。它的代价是 $N(K_n,F)p^{\lvert E(F)\rvert}=M(F)p^{r}$。要让这代价 $\le\tfrac12$，需 $p\le(2M(F))^{-1/r}$；而 $\mathbb E N(G(n,p),F)=M(F)p^{r}$，所以 $\mathcal G$ 的代价恰是 $F$ 的期望计数，$\tfrac12$ 预算两边完全对齐。对每个 $F$ 都成立的 $p$ 的上确界就是 $p_{\mathrm E}$，而 $q$ 允许 cover 用任意集合族、并且只要求存在一个 $F$ 使族够小，故 $q$ 可以显著更大。这条验证的结论是：$p_{\mathrm E}$ 与 $q$ 之间差的不是常数，是"cover 可以自由选择用哪个 $F$、并且可以拼贴非 copy 的集合"这种自由度。抽象定理看不到这个自由度，图论侧必须自己造。

## 4 失败路线二：搬 MNSZ 的修正期望阈值，被参数不对口卡住

第二条路是 $\widetilde p_{\mathrm E}$。`introduction.tex:105-111` 写出 MNSZ 的版本：

$$
\widetilde p_{\mathrm E}(n,H)=\min\{p:\mathbb E N(G(n,p),F)\ge N(H,F)/2\ \text{对每个}\ F\subseteq H\},
$$

他们用这个参数拿到单个 log。`introduction.tex:112-113` 解释因子 $N(H,F)$ 的含义：含住 $H$ 就自动供出它全部 $F$ 的 copy。`introduction.tex:113-115` 接着说由对称性这个参数等于 $q_f(\mathcal F_H)$（引 `references.tex:17-21` 的 DKP25 的 Equation (1)），而"把它与 $p_{\mathrm E}(n,H)$ 比较"才是额外的图论问题。

我在这条路上算的第一个量是每个约束的右端比值。$N(H,F)$ 是 $H$ 里 $F$ 的 copy 数，$\mathbb E N(G(n,p),F)=M(F)p^{r}$，于是 $\widetilde p_{\mathrm E}$ 的单约束解是 $(2N(H,F)/M(F))^{-1/r}$，而 $p_{\mathrm E}$ 的单约束解是 $(2/M(F))^{-1/r}$。两者之比是 $N(H,F)^{-1/r}$。`graphs.tex:33` 的 copy 比恒等式在 $I=H$ 时给出 $\mathbb P(F_0\subseteq\boldsymbol I)=M(H,F)/M(F)$，对均匀 copy $\boldsymbol I$ 求和得 $\mathbb E N(\boldsymbol I,F)=N(H,F)=M(H,F)\mathbb P(F_0\subseteq\boldsymbol I)/M(F)\cdot M(F)$，化简后 $N(H,F)=M(H,F)\mathbb P(F_0\subseteq\boldsymbol I)$。所以 $N(H,F)$ 通常远大于 $1$，$N(H,F)^{-1/r}$ 通常小于 $1$，即 $\widetilde p_{\mathrm E}\le p_{\mathrm E}$ 一侧的方向才是我想要的。

我原本以为拿到 $\widetilde p_{\mathrm E}\le p_{\mathrm E}$ 就能收尾：把 MNSZ 的单 log 结论套在 $\widetilde p_{\mathrm E}$ 上，再用上式换成 $p_{\mathrm E}$。卡住的第二点是 `introduction.tex:105-111` 只声明 MNSZ 给出"用 $\widetilde p_{\mathrm E}$ 表达的单 log"，也就是 $p_{\mathrm c}=O(\widetilde p_{\mathrm E}\log(\cdot))$ 型结论，而我需要的是 $p_{\mathrm c}$ 被 $p_{\mathrm E}$ 控制。$\widetilde p_{\mathrm E}\le p_{\mathrm E}$ 的上界方向对这条代入毫无帮助：把 $p_{\mathrm E}$ 换成更大的量会让上界变松，我要的是让上界含 $p_{\mathrm E}$ 且不含 $\widetilde p_{\mathrm E}$。真正需要的方向是 $\widetilde p_{\mathrm E}\ge c\,p_{\mathrm E}$ 型，即把 $N(H,F)$ 那一侧吸收进密度里，而它正是 `introduction.tex:114-115` 说的"额外的图论问题"。

DKP25Cases 在那条线上做到哪儿了，`introduction.tex:122-127`：当 $q$ 使 $H$ 的所有子图在密度 $q$ 下期望计数都至少 $1$ 时，对所有作为 clique、圈或有界度树的测试图 $F$，有 $N(H,F)\le\mathbb E N(G(n,\min\{1,Lq\}),F)$；$L$ 对 clique 与圈是绝对的，对树依赖于度界。我把这条读成一个"测试图族受限"的引理：它只对你愿意检验的 $F$ 属那三类时成立。$q$ 的约束集是 $H$ 的全部子图，一旦 $H$ 含一个既非 clique、非圈、也非有界度树的子图，这条代入就在该子图上断掉。$L$ 依赖度界这点也意味着：拿它去证"对所有 $H$ 一致"的定理，$L$ 会随 $H$ 的最大度跑掉，而结论里的 $C$ 必须绝对。这条路在我手里就停在 $L$ 的这个量上。

再看 DKP25 的 rooted-extension 分解给的东西，`introduction.tex:117-121`：$q_f(\mathcal F_H)=O(p_{\mathrm E}(n,H)\log^2 n)$，从而 $p_{\mathrm c}(n,H)=O(p_{\mathrm E}(n,H)\log^3 n)$；另外当 $p_{\mathrm E}(n,H)<1/(3n)$ 时他们已建立猜想的单 log 界。我读到这里做了两个动作。一是把 $\log^3$ 拆开：两个 log 来自 rooted-extension 分解把 $H$ 一层层长出来时的每层代价，第三个 log 来自抽象定理（FKNP 那条 $\log\ell$）。二是注意 $1/(3n)$ 这个门槛：$p_{\mathrm E}<1/(3n)$ 意味着 $H$ 的所有子图在很稀的密度就够期望，对应稀疏目标；完全匹配例子里 $p_{\mathrm E}=\Theta(1/n)$（`introduction.tex:59-61`）正好卡在门槛的同量级侧，所以那条已证情形连匹配这个最经典的例子都吃不下。$\log^3$ 与"稀疏情形已证"这两句合起来给我的信号是：分解式的路线天花板就在多出的两个 log 上，沿着它改良只是把 $\log^3$ 磨成 $\log^2$，而 `introduction.tex:128-133` 说 Tran 已经做到 $q_f=O(p_{\mathrm E}\log(2e(H)))$、把一般包含损失降到 $O(\log^2(2e(H)))$。也就是说，走"抽象 + 比较"这条大道，截至本文之前的最好结果是两个 log，本文要的是把那第二个 log 干掉。这笔账让我把第 3、4 两条路一起放弃，转去读 `introduction.tex:145-184` 的方法谱系。

## 5 失败路线三：同一个 $W$ 带来的依赖，以及逐节点 union bound 的死法

读完 `resampling.tex` 之后，我以为局部重采样的账已经够了：`resampling.tex:71-73` 给出失败概率 $\mathrm e^{-9m}$，`resampling.tex:74-81` 给出测度失真 $\mathrm e^{11m}\nu_b$，两者都只跟容量 $m$ 有关。于是我按"每个节点各抽一个独立随机集"的朴素版本先把概率叠起来算，再回头看 `trees.tex:84-85` 那句 "All nodes use the same set $W$"，才发现自己算的是另一个东西。这一节记两条：一条是我原本的独立版本怎么死的，另一条是作者用同一个 $W$ 时必须处理的相关性从哪里来、又被什么挡回去。

### 5.1 独立版本：密度账与节点数账

`trees.tex:171-188` 的成功输出是一个被剪过、被重加权过的子树，其每条保留弧上的标签换成 $T_b=A_v(b)\setminus W$。要在 $G(n,p)$ 里坐实一条完整路径的标签并集，最后必须把过程中所有用过的随机集并进同一个边集：`trees.tex:267-276` 的做法是预抽 $4s$ 份 $\mu_\rho$ 的独立样本再取并，并集的分布是 $\mu_{r_*}$，$r_*=1-(1-\rho)^{4s}\le 4s\rho$（`trees.tex:271`）。这一步在独立版本里会变成 $r_{**}=1-(1-\rho)^{4s\cdot(\text{用过的随机集份数})}\le 4s\cdot(\text{份数})\cdot\rho$。份数若是节点数，结论就废了：`graphs.tex:82-85` 构造的树在第 $i$ 层的节点是 $H_i$ 的 copy，节点数至多 $M(H_i)=(n)_{v(H_i)}/\lvert\operatorname{Aut}(H_i)\rvert$（`graphs.tex:24-25`），粗界 $M(H_i)\le n^{v(H_i)}\le n^{h}$，于是 $p$ 要带一个 $n^{h}$ 型因子。这不是常数没调好，是量级错。

份数若是层数 $k$，看起来还活着：`graphs.tex:77-78` 的嵌套给出 $\lvert H_{i-1}\rvert<\lvert H_i\rvert/17$，所以 $h=\lvert H_k\rvert>17^{k-1}\lvert H_1\rvert\ge 17^{k-1}$，即 $k\le 1+\log_{17}h$（本篇 tex 没写这条界，$k\le1+\log_{17}h$ 是我自己的推导，用来给下面的因子定量）。$4s\rho k$ 相对 $4s\rho$ 多出 $k$，而 $s\le 1+\log_2\ell_k\le 1+\log_2 h$（$\ell_k\le e(H)=h$ 见 `graphs.tex:46-47`），于是最终密度里出现 $(\log h)(\log_{17}h)$，也就是 $(\ln h)^2/(\ln 2\cdot\ln 17)$。这恰好是 `introduction.tex:128-133` 说的 Tran 留下的 $O(\log^2(2e(H)))$ 一般包含损失，数量级完全对得上。所以"每层一份独立样本"这条路不是算错，是它天花板就在第二个 log 上；要单 log，就得让所有层共用同一份 $W$，代价是必须处理随之而来的相关性。

### 5.2 共用 $W$ 时，失败概率 $\mathrm e^{-9m}$ 挡不住节点数

再核一遍 union bound 死得多干脆。固定 $W$，$d_v(W)$ 是节点 $v$ 上局部失败的概率（`trees.tex:86-87`）。`resampling.tex:71-73` 只给 $\mathbb P(\text{local failure})\le\mathrm e^{-9m}$，这里 $m$ 是该节点 outgoing 层的容量。第 8 节的层次构造把容量按 $16$ 倍几何增长（`graphs.tex:89-92`），最底层 $\ell_1\ge1$（`graphs.tex:46`），而 `trees.tex:224` 的 $m_i(t)=\lfloor\ell_i/2^t\rfloor$ 在迭代过程中会落到 $1$。取 $m=1$，单节点失败概率上界 $\mathrm e^{-9}\approx1.23\times10^{-4}$。想对全部节点求和，就需要 $\mathrm e^{-9}$ 小于节点数的倒数，而节点数上界是 $n^{h}$ 量级、下界也常常是多项式级，$\log(n^h)/9$ 可以任意大。这条 union bound 不是差一个常数，是差任意大的指数。

`trees.tex:106-120` 的势函数就是用来绕开节点数的。我在纸上把它的定义抄了一遍才接受它的设计：$D_v(W)=0$ 在叶子上（`trees.tex:107`），在 outgoing 层为 $s$ 的节点上

$$
D_v(W)=\frac{d_v(W)+\sum_{b\in\operatorname{Ch}(v)}t_{vb}(W)D_b(W)}{\epsilon_s},\qquad\epsilon_s=\mathrm e^{-m_s},
$$

逐字对应 `trees.tex:109-111` 与 `trees.tex:98`。它的好处是：坏节点的判定 $D_v>1$ 用反向归纳自下而上（`trees.tex:112-120`），一次失败沿路径向上乘一个 $\epsilon_s^{-1}=\mathrm e^{m_s}$，节点数从头到尾没进入估计。我核对 `trees.tex:112-120` 的归纳细节：若 $v$ 坏且其子节点中坏的那些已有 $D_b>1$，则 `trees.tex:110` 的分子至少 $d_v+\sum_{b\text{ bad}}t_{vb}>\epsilon_s$，最后一步用的是 `trees.tex:89-91` 的 $d_v(W)+\sum_b t_{vb}(W)=1$ 与 `trees.tex:100-103` 的好节点判据 $\sum_{b\text{ good}}t_{vb}(W)\ge1-\epsilon_s$ 失败。两句一接：坏子的 $t$ 质量 $>1-\sum_{b\text{ good}}t_{vb}\ge\epsilon_s-d_v$，加上 $d_v$ 正好 $>\epsilon_s$。这里 $d_v$ 项的参与是必要的，否则当 $d_v$ 本身把 $\epsilon_s$ 吃掉时判据会漏。

### 5.3 相关性从哪一条来

真正的技术障碍在取期望那一步。`trees.tex:145-149` 给出

$$
\mathbb E D_v(W)\le\mathrm e^{-8m_s}+\mathrm e^{12m_s}\sum_{b\in\operatorname{Ch}(v)}\nu_v(b)\,\mathbb E D_b(W),
$$

我最初以为它可以写成 $\mathbb E[d_v]+\sum_b\mathbb E[t_{vb}D_b]$ 然后把 $t_{vb}$ 用 $\nu_v(b)$ 代入。$t_{vb}(W)$ 是"局部非失败且 target 为 $b$"的概率（`trees.tex:87`），它的期望确实不超过 $\mathbb P(\text{target}=b)$，但在同一个 $W$ 下 $t_{vb}(W)$ 与 $D_b(W)$ 是同一批 Bernoulli 坐标的函数，$\mathbb E[t_{vb}D_b]=\mathbb E[t_{vb}]\mathbb E[D_b]$ 没有任何理由成立。$W$ 共用一次，这条相关性就跑不掉；`trees.tex:150` 那句 "This step controls the dependence caused by reusing $W$." 指的就是这个位置。

我在这个坑上试了两种做法，都算过一遍。第一种是试图论证相关性方向有利，从而把 $\mathbb E[t_{vb}D_b]$ 直接放成 $\mathbb E[D_b]$ 乘一个小于 $1$ 的系数。直觉是：$W$ 偏大时分母 $Z(Y)=\sum_d\nu_d\rho^{-\lvert A_d\rvert}\mathbf 1_{\{A_d\subseteq Y\}}$（`resampling.tex:31-33`）里的质量更大、保留的 $T=A_b\setminus W$ 更小，于是局部失败更少、子树势也小，二者负相关。我没能把这个直觉变成不等式，因为它依赖 $W$ 的哪些坐标偏大，而 $Z$ 看的是 $A_b$ 内部的坐标、$D_b$ 看的是 $A_b$ 外部的坐标（下一段），两组坐标在 $\mu_\rho$ 下独立，"负相关"根本没有可写的事件基础。这个失败让我明白作者为什么要绕一条更机械的路。

第二条就是 `trees.tex:124-142` 的支撑集论证，我复算后认为它是全文最省事也最关键的一步：对固定孩子 $b$，把进入 $b$ 的标签缩写成 $A_b$，则整棵 $b$ 子树里的每个标签都与 $A_b$ 不交，因为每个这样的标签都落在一条穿过进入 $b$ 那条弧的路径上（`trees.tex:126-127`）；而一个节点上的转移只查看 $\bigcup_{b}\!A_b$ 上的 $W$ 归属（`resampling.tex:56-57`，`trees.tex:127-128`），所以由 $D_b$ 的递归定义，$D_b(W)$ 只依赖 $A_b$ 之外的坐标（`trees.tex:128-129`）。`figures/outside-label.tex:19-21` 的图注逐字写着 "Every label below $b$ avoids $A_v(b)$. Hence $D_b(W)$ uses only $W\setminus A_v(b)$."，图的说明文字（`figures/outside-label.tex:24-27`）就是这段论证的图示；同一节 `figures/outside-label.tex:27` 还留了一句 "labels on different branches may overlap"，这是告诉我：能拿到的独立性只有"避开 $A_b$"这么多，跨分支的坐标重合是不能指望的。`trees.tex:132-134` 特别强调这个论断是对固定的输入树上每个节点说的，在任何剪枝或以 $W$ 为条件的操作之前，我认为这句是防自己滑进循环论证的护栏。

拿到支撑集形状以后，`resampling.tex:74-81` 的失真不等式 $\mathbb E[\mathbf 1_{\{\text{target}=b,\,Z(Y)\ge\mathrm e^{-10m}\}}f(W)]\le\mathrm e^{11m}\nu_b\,\mathbb E f(W)$ 恰好要求 $f$ 只依赖 $W\cap(X\setminus A_b)$（`resampling.tex:75`），于是可以直接取 $f=D_b$。`trees.tex:138-141` 先把 $t_{vb}(W)\le\mathbb P(\text{target}=b,\ Z(Y)\ge\mathrm e^{-10m_s}\mid W)$ 塞进指示函数，`trees.tex:143-144` 再乘上 $\epsilon_s^{-1}=\mathrm e^{m_s}$，$\mathrm e^{11m_s}\cdot\mathrm e^{m_s}=\mathrm e^{12m_s}$ 就是 `trees.tex:148` 那个 $12$ 的全部来历；$d_v$ 那一路是 $\mathrm e^{-9m_s}\cdot\mathrm e^{m_s}=\mathrm e^{-8m_s}$，即 `trees.tex:147` 的 $8$。常数 $11$ 与 $9$ 来自 `resampling.tex:72` 与 `resampling.tex:80`，两个 $+m_s$ 来自同一个 $\epsilon_s^{-1}$。这笔账我逐字对过，没有隐藏的因子。

## 6 失败路线四：把 Tran 的耦合猜想当黑箱，被倾斜后验卡住

`introduction.tex:137-143` 交代了另一条我试过的路：Tran 在第 4 节提了一个耦合猜想，它能把 successive conditional extensions 吸收进去、只对数抽样代价付一次；作者表态他们不证那个猜想，改用的做法是"keep all possible extension histories in a tree and reduce every level with the same random set. Disjointness along a history supplies the precise control of dependence that this reuse requires."。我一开始把这段话读得太轻，以为"付一次对数代价"这件事靠耦合的黑箱性质就能拿到，于是先试着自己写一个耦合。

设 $\boldsymbol I_i$ 是 $H_i$ 的均匀 copy，$\boldsymbol I_{i+1}$ 是在包含固定 $S_0$（$H_i$ 的一个 copy）条件下的均匀 copy，$H_i$ 与层次构造（`graphs.tex:76-79`）一致。我想要的耦合是：存在一个 $a$-spread 的分布，使得从它抽一次就能同时供出整条链 $\boldsymbol I_1,\ldots,\boldsymbol I_k$ 的增量标签。卡住这个想法的第一句是 `resampling.tex:44-45`："At a specified $W$, however, only the source is guaranteed to have its original law $\nu$; the target law may differ."。也就是说，固定 $W$ 以后，源还按 $\nu$ 走，目标按 `resampling.tex:29-34` 的后验

$$
\frac{\nu_b\rho^{-\lvert A_b\rvert}\mathbf 1_{\{A_b\subseteq Y\}}}{Z(Y)}
$$

走。$\rho^{-\lvert A_b\rvert}$ 这个倾斜因子是关键：两个标签若大小差 $t$，后验权重差 $\rho^{-t}$。$t$ 最大可到容量 $m$，而 $\rho$ 在第 10 节会取成 $\rho=4\mathrm e^{50}\sigma$，$\sigma=128q$ 又远小于 $1$，于是 $\rho^{-m}$ 可以任意大，全靠 $Z(Y)$ 归一化把它压回概率。任何"保留边际分布"的耦合命题都得先把这个倾斜处理掉，而 `resampling.tex:67-68` 把 $Z(Y)<\mathrm e^{-10m}$ 直接划进失败事件、`resampling.tex:77-80` 用 $\mathrm e^{10m}$（即 $1/\mathrm e^{-10m}$）去界 $1/Z$ 再吃一个 $(1+a/\rho)^m\le\mathrm e^{m}$（`resampling.tex:146-147`），合起来才是 $\mathrm e^{11m}$。我读到这里承认：耦合语言里的"吸收增量"在这套算账下等价于"付出 $\mathrm e^{11m}$ 的失真并承认失败事件"，黑箱并没有省掉什么，只是把同一笔账藏在别处。这就是这条路停下的位置，卡住的量是 $Z(Y)^{-1}$ 与 $\rho^{-\lvert A_b\rvert}$ 的组合。

第二句让我彻底改弦更张：`introduction.tex:180-181` 说 "Iteration needs only logarithmically many successful draws."。付一次对数代价的意思被换成了"只需对数多次成功抽样"，量级完全相同，但对象从"分布之间的耦合"变成"抽样次数"，后者是能用 `trees.tex:259-265` 的等待时间论证直接算的东西。我的理解是：作者绕开了耦合猜想，把它的结论用树的形式重述，代价是要在第 10 节处理"失败的尝试不改变树"（`trees.tex:217-218`）与"条件于全部过去下次抽样仍是 $\mu_\rho$"（`trees.tex:219-220`）这两件琐碎但必须写清楚的事。

### 6.1 顺手算的一处：整条路径的 spread 会带上层数因子

我在同一时期还试过更省事的方案：不管树，直接把 $\mathcal A=\bigcup_{(v,b)\in P}A_v(b)$（记号 $\mathcal U(P)$ 见 `trees.tex:16-19`）当作一个随机集，宣称它 $\sigma$-spread，然后一次重采样解决。这个念头死在 `trees.tex:25-26`：那里明确写 "no spread assumption is made on the distribution of a full path"，连假设都不给。我自己把假设的失效程度算了定量版，结论比我预期温和：路径分布并非不 spread，只是常数被层数污染。

设每层条件律都 $\sigma$-spread（`graphs.tex:94-112` 证的就是这个逐层版本），$J\subseteq X$ 非空、$\lvert J\rvert=t$。$J$ 落在路径并集里的方式是把 $J$ 分配到 $k$ 层：有序分拆数 $k^t$；对每个分拆，链式法则逐层用条件 spread，乘出 $\sigma^{\sum t_i}=\sigma^{t}$。两型一合，$\mathbb P(J\subseteq\mathcal U(P))\le(k\sigma)^{t}$，即路径分布是 $(k\sigma)$-spread。这一步全是我自己的推导，tex 里没有对应记号，`trees.tex` 与 `graphs.tex` 都没给出路径分布的任何 spread 常数。要命的是 $k\sigma$ 里的 $k$：把 `trees.tex:31` 假设的"每层 $\sigma$-spread"换成"路径 $(k\sigma)$-spread"来一次性用局部引理，$a$ 就变成 $k\sigma$，于是 $\rho=\mathrm e^{50}a$ 与最终密度 $16\mathrm e^{50}a(1+\log_2\ell_k)$ 各带一个 $k$，与 5.1 的每层独立版本殊途同归：又是 $(\ln h)^2/(\ln 2\cdot\ln 17)$ 那个二次损失。$k\le1+\log_{17}h$ 用 `graphs.tex:78` 的 $1/17$ 收缩，$\log_2\ell_k\le\log_2 h$ 用 `graphs.tex:47`。

由此我认定这篇的结构选择是：spread 必须在层上逐层记录，绝不能合并成路径上的一个常数。`trees.tex:59-62` 的 reduction 引理把每层各自的 $\alpha_j$ 带在假设里，`trees.tex:68` 的输出把每层各自的 $\alpha_j/(1-\mathrm e^{-m_j})$ 带在结论里；`trees.tex:239-243` 再把这个逐层参数迭代 $t$ 次写成 $\alpha_i(t)=\sigma\prod_{u=0}^{t-1}(1-\mathrm e^{-\lfloor\ell_i/2^u\rfloor})^{-1}$。$k$ 因子在整条链上无处出现，因为没有任何一步把不同层的 spread 常数相乘。这段读完，我原来的"一次到位"方案就归到失败路线里了，剩下的工作是接受"每层各记各的 spread、每轮尝试各乘一个 $(1-\mathrm e^{-\cdot})^{-1}$"，然后证明那些乘子的总和收敛，这是第 11 节的内容。

## 7 三个转折点的定位，以及一处底数算术

我把转折点的标准定为"我某条失败路线死掉的地方，正文在哪里给了正面替代"。按这个标准只有三处。第一处是 `graphs.tex:50-113` 的比值极大化：第 3、4 节我卡在 $p_{\mathrm E}$ 与 $q(\mathcal F_H)$、$q_f(\mathcal F_H)$ 的方向账上，而这一节从头到尾没有出现过 $q_f$，它只用 `graphs.tex:60-61` 那一条一阶动量约束 $M(S)q^r\ge\tfrac12$，也就是 $p_{\mathrm E}$ 自己的定义。第二处是 `resampling.tex:37-45` 的后验密度恒等式与 `resampling.tex:47-51` 的两条包含关系：第 6 节我卡在倾斜后验 $\rho^{-\lvert A_b\rvert}$ 上，这里给的是把 $Z(Y)$ 当作 $\mu_\rho$ 的密度这一事实本身。第三处是 `trees.tex:106-120` 的势函数与 `trees.tex:124-129` 的支撑集论证：第 5 节我卡在节点数与相关性上，这两段分别把两者消掉。

`introduction.tex:145-184` 的"策略与谱系"小节其实就是这三处的顺序预告，`introduction.tex:147-159` 讲极大化，`introduction.tex:165-172` 讲贝叶斯重采样，`introduction.tex:174-181` 讲树上同时约化，`introduction.tex:182-184` 讲装配。`graphs.tex:5-6` 说比值极大化与条件增量论证取自 Tran 的第 3 节和 Lemma 3.1，只是把常数调到配得上容量的 $16$ 倍分离；`graphs.tex:7-8` 又说下面的 copy 计数恒等式同样出现在 MNSZ22 的 Equation (5)。`resampling.tex:18-19` 把植集与后验重采样归给 MNSZ 的第 2.1 到 2.3 节，并声明本文新增的是与容量相关的失败估计与对目标标签之外坐标的测度界（`resampling.tex:20-22`）。`introduction.tex:160-163` 再往上游追两步：条件化那一步的前身在 LSZ 的 large-link 论证（Claim 29）与 ALWZ 从极大违反核里抽 spread-link（Lemma 2.4）。这四条归属我都按 `references.tex` 核对过条目存在：Tran 在 `references.tex:103-108`，MNSZ 的两篇在 `references.tex:63-73`，LSZ 在 `references.tex:56-61`，ALWZ 在 `references.tex:4-8`。

### 7.1 copy 比恒等式干了我原先没指望它干的事

恒等式在 `graphs.tex:32-34`：$\boldsymbol I$ 是 $[n]$ 上 $I$ 的均匀 copy，$F_0$ 是边子集 $F\subseteq I$ 的任一固定 copy，则

$$
\mathbb P(F_0\subseteq\boldsymbol I)=\frac{M(I,F)}{M(F)},\qquad M(F)=N(K_n,F),\quad M(I,F)=N(I,F)
$$

（记号定义 `graphs.tex:20-23`，空边集约定 $M(\varnothing)=M(I,\varnothing)=1$ 在 `graphs.tex:29`）。证明在 `graphs.tex:35-37`：置换对称让概率与 $F_0$ 的选取无关，把这份概率对所有 $M(F)$ 个 copy 求和，数的是每个 $\boldsymbol I$ 里含的 $M(I,F)$ 份 copy。我把它写成双重计数：左边对 $F_0$ 求和是 $\mathbb E N(\boldsymbol I,F)=M(I,F)$，右边是 $M(F)\mathbb P(F_0\subseteq\boldsymbol I)$，两式相等即恒等式。三件事是它一并供出的。

一是把极大化目标变成纯计数比：`graphs.tex:54` 的 $R_\sigma(I,S)=\sigma^{-\lvert S\rvert}\mathbb P(S_0\subseteq\boldsymbol I)$ 在代入恒等式后成为 $\sigma^{-r}M(I,S)/M(S)$，`graphs.tex:63-65` 的放缩因此只用两个事实，$M(I,S)\le\binom{h_I}{r}$（`graphs.tex:61`）与 $M(S)q^r\ge\tfrac12$（`graphs.tex:60-61`）。二是让分子为零与否成为可判定的：`graphs.tex:103-104` 说若 $\mathbb P(S_0\cup J\subseteq\boldsymbol I)>0$，则 $S_0\cup J$ 同构于 $H_i$ 的某个边子集 $U$，于是极大性可以用在 $U$ 上；若分子为零，`graphs.tex:111-112` 说界是显然的。这个二分只有 copy 语义才给得出：嵌入语义下 $S_0\cup J$ 可能是同一 copy 的两种标号。三是把 ordinary copy 归一化摆到明面，`introduction.tex:183-184` 那句 "with the ordinary-copy normalization explicit" 指的就是 `graphs.tex:20-37` 这一整块。我在第 1 节承认自己一开始把 $M$ 读成嵌入数，那会让 $\binom{h_I}{r}$ 这一界变成 $(h_I)_r$，后面第 8.2 节的 $128$ 账就会多出一个 $r!$，怎么调常数都收不住。

### 7.2 一处底数账

$1+\log_2 h\le 3\log_2 n$ 的验证我重算了两遍才对上余量。$h\le\binom n2=n(n-1)/2<n^2/2$ 给出 $\log_2 h<2\log_2 n-1$，所以 $1+\log_2 h<2\log_2 n\le 3\log_2 n$，$n\ge2$ 时 $\log_2 n\ge1$ 保证最后一步。`graphs.tex:123-124` 写的是 $h\le\binom n2\le n^2$，比我这条弱一点（丢了那个 $-1$），但配上 $1+\log_2 h\le 3\log_2 n$ 完全够用：$n=2$ 时左边 $\le1$、右边 $=3$；$n=4$ 时左边 $\le1+\log_2 6\approx3.585$、右边 $=6$；$n=8$ 时左边 $\le1+\log_2 28\approx5.807$、右边 $=9$。余量从 $3$ 倍收窄到 $1.55$ 倍，始终 $\ge1.5$，这就是 `graphs.tex:125` 那个 $C=6144\,\mathrm e^{50}=3\cdot2048\,\mathrm e^{50}$ 里的 $3$。至于 $\ln$ 与 $\log_2$ 的换算，`introduction.tex:186` 定下无下标的 $\log$ 是自然对数，而全文出现的带底对数只有 $\log_2$：`introduction.tex:37`、`introduction.tex:41`、`trees.tex:38`、`trees.tex:213`、`trees.tex:274`、`graphs.tex:120`。换算只影响我对数级的观感，$\log_2 x=\ln x/\ln2$，$\ln2\approx0.6931$，所以凡是写着 $\log_2(\cdot)$ 的地方都比自然对数大 $1.4427$ 倍；第 5 节我算 $(\ln h)^2/(\ln2\cdot\ln17)$ 时用的就是这个换底。$\ln 17\approx2.8332$，故 $\log_{17}h=\ln h/2.8332$。

## 8 转折点 A：`graphs.tex` 的比值极大化，与 $128$、$17$、$16$ 这笔常数账

### 8.1 起手：删孤立点与 $q$ 的固定

`graphs.tex:9` 定下两个记号：$q=p_{\mathrm E}(n,H)$，$\sigma=128q$。后面 `trees.tex:48-49` 会说层次构造给出的树满足 $\sigma=128p_{\mathrm E}(n,H)$ 与 $\ell_k\le e(H)$，两个量正好接上。

`graphs.tex:9-18` 做了第一件外科手术：删掉 $H$ 以及随后每个图的孤立点，把图与它的边集等同。理由在 `graphs.tex:11-14`：含 $H$ 的事件不变，因为非孤立部分的任一 copy 都能靠再选若干顶点扩成 $H$ 的 copy，依据是 $n\ge\lvert V(H)\rvert$ 且 copy 无需导出。这一句让我确认第 1 节那处的普通 copy 读法是对的：若 copy 要求导出，多选的顶点会带进额外边、破坏导出性，扩展就断在 `graphs.tex:13-14`。`graphs.tex:15-16` 给出后续所有极大化的约束来源：下面用到的每条边子集，在其关联顶点上都是原 $H$ 的子图，所以它在密度 $q$ 下的期望至少 $\tfrac12$；`graphs.tex:17-18` 补一句在这整个删除过程中 $q$ 始终是按原图 $H$ 定义的阈值，不许中途重算。我认为这两句合起来是全文方向账的落点：约束集是原 $H$ 的全部边子集，$q$ 一旦定下就锁死，之后每一步用的都是这同一批不等式，没有任何一步需要 $q_f$。

### 8.2 极大化与 $128$ 的余量

`graphs.tex:51-58`：对当前非空边集 $I\subseteq H$，取边子集 $S\subseteq I$ 极大化

$$
R_\sigma(I,S)=\sigma^{-\lvert S\rvert}\mathbb P(S_0\subseteq\boldsymbol I),
$$

允许 $S=\varnothing$、其值为 $1$（`graphs.tex:56`），并固定一个确定的破绑规则（`graphs.tex:57-58`）。`graphs.tex:60-66` 是全部放缩：记 $h_I=\lvert I\rvert$、$r=\lvert S\rvert>0$，用 $M(S)q^r\ge\tfrac12$ 与 $M(I,S)\le\binom{h_I}{r}$，得

$$
R_\sigma(I,S)\le 2\binom{h_I}{r}(q/\sigma)^r=2\binom{h_I}{r}128^{-r}.
$$

我核对等号那一步：$(q/\sigma)^r=(q/(128q))^r=128^{-r}$，$q>0$ 由 `introduction.tex:28` 保证，所以这步合法。再用 $\binom{h_I}{r}\le(\mathrm e h_I/r)^r$，在 $r\ge h_I/17$ 时 $h_I/r\le17$，于是（`graphs.tex:67-71`）

$$
R_\sigma(I,S)\le 2(17\mathrm e/128)^r<1.
$$

数值上 $17\mathrm e=46.2108$，$17\mathrm e/128=0.36102$，$r=1$ 时最松，$2\times0.36102=0.72204<1$；$r$ 越大越松，$r=2$ 已降到 $0.26067$。结论（`graphs.tex:72`）是极大化的前驱必满足 $\lvert S\rvert<\lvert I\rvert/17$，因为 $\varnothing$ 的值是 $1$，任何值 $<1$ 的候选都抢不到最大。

$128$ 的余量我按"最小可接受值"倒着算。要让 $2(17\mathrm e/\sigma_0)^1<1$，需 $\sigma_0>34\,\mathrm e=92.4216$；$\sigma_0=128$ 的余量是 $128/92.4216\approx1.385$。若把 $128$ 换成 $96$，$34\,\mathrm e<96$ 仍成立，放缩不断；换成 $64$ 则 $2\cdot17\,\mathrm e/64=1.4441>1$，$r=1$ 的情形当场失效。$\sigma_0$ 的上界则由 $17$ 那一分档决定：分档阈值取 $c'$ 时要求 $2(c'\mathrm e/128)^1<1$，即 $c'<128/(2\,\mathrm e)=23.53$，所以 $c'$ 最大能取到 $23$，$17$ 是这一区间里的一个取值。tex 没解释为何挑 $17$，只解释了这个 $17$ 必须与树的 $16$ 倍分离相配（`graphs.tex:5-6` 那句"常数调到配得上容量的 $16$ 倍分离"）。我按 $17=16+1$ 读，把 $128$ 取 $2^7$ 读作"方便被 $16$、$2$、$4$ 整除且大于 $34\,\mathrm e$ 的最省选择"，这一段属于 `[推测]`，依据只是 `graphs.tex` 里没有任何关于取优的说明。

### 8.3 层与容量：$17$ 换来 $16$

`graphs.tex:74-79` 反复选取直到达到空集，把嵌套序列反写为

$$
\varnothing=H_0\subset H_1\subset\cdots\subset H_k=H,\qquad\lvert H_{i-1}\rvert<\lvert H_i\rvert/17.
$$

树的建造在 `graphs.tex:80-86`：根为空集；从已达到的 $H_{i-1}$ 的 copy $S_0$ 出发，孩子取所有包含 $S_0$ 的 $H_i$ 的 copy，分布取均匀，连到孩子 $I_0$ 的弧标 $I_0\setminus S_0$；`graphs.tex:84-85` 说这样的孩子总是存在，因为 $[n]$ 上任何 $H_{i-1}$ 的 copy 都能扩成 $H_i$ 的 copy；`graphs.tex:85-86` 说不同的历史保持为不同的节点。路径标签两两不交、并集是 $H$ 的一份 copy（`graphs.tex:86-87`）。容量账在 `graphs.tex:88-92`：

$$
\ell_i=\lvert H_i\rvert-\lvert H_{i-1}\rvert>0,\qquad\ell_{i+1}>16\lvert H_i\rvert\ge16\ell_i.
$$

我把中间那步独立验算：$\ell_{i+1}=\lvert H_{i+1}\rvert-\lvert H_i\rvert>\lvert H_{i+1}\rvert-\lvert H_{i+1}\rvert/17=(16/17)\lvert H_{i+1}\rvert$，而 $\lvert H_{i+1}\rvert>17\lvert H_i\rvert$ 给出 $(16/17)\lvert H_{i+1}\rvert>16\lvert H_i\rvert$；末项 $\lvert H_i\rvert\ge\ell_i$ 是 $\lvert H_{i-1}\rvert\ge0$ 的直接结果。于是 $17$ 与 $16$ 是同一枚硬币的两面：严格不等号 $<\lvert H_i\rvert/17$ 恰好让分离系数取到严格大于 $16$，配得上 `trees.tex:34` 的 $\ell_{i+1}\ge16\ell_i$。$\ell_1\ge1$ 与 $\ell_k\le e(H)=h$ 在 `graphs.tex:45-47`：前者是正整数，后者因为最深一层的标签是 $H\setminus H_{k-1}$ 的边集、大小不超过 $\lvert H_k\rvert=h$。

顺带把我第 5 节用的层数界坐实：$\lvert H_i\rvert>17\lvert H_{i-1}\rvert$ 归纳给 $\lvert H_i\rvert>17^{i-1}\lvert H_1\rvert\ge17^{i-1}$，取 $i=k$ 得 $h=\lvert H_k\rvert>17^{k-1}$，故 $k<1+\log_{17}h$。tex 没写这条，我按推导用。

### 8.4 条件 spread 与 $128q$ 的出处

`graphs.tex:94-102`：在节点 $S_0$ 处记随机增量标签为 $A$。若 $J\cap S_0\ne\varnothing$ 则 $\mathbb P(J\subseteq A)=0$（`graphs.tex:95-96`），因为 $A$ 是 $I_0\setminus S_0$；否则对 $H_i$ 的均匀 copy $\boldsymbol I$，

$$
\mathbb P(J\subseteq A)=\frac{\mathbb P(S_0\cup J\subseteq\boldsymbol I)}{\mathbb P(S_0\subseteq\boldsymbol I)}.
$$

我验过这个比式：$A$ 的律是 $\boldsymbol I$ 在条件 $S_0\subseteq\boldsymbol I$ 下的增量，故事件 $\{J\subseteq A\}$ 在条件化后等价于 $\{S_0\cup J\subseteq\boldsymbol I\}$，且 $J\cap S_0=\varnothing$ 保证两者不冲突。`graphs.tex:104-109` 用极大性：$H_{i-1}$ 在 `graphs.tex:53-55` 的意义下极大，故

$$
\sigma^{-(\lvert S_0\rvert+\lvert J\rvert)}\mathbb P(S_0\cup J\subseteq\boldsymbol I)\le\sigma^{-\lvert S_0\rvert}\mathbb P(S_0\subseteq\boldsymbol I),
$$

移项即 $\mathbb P(J\subseteq A)\le\sigma^{\lvert J\rvert}$（`graphs.tex:110-111`），与 `resampling.tex:10-13` 的 $a$-spread 定义对 $a=\sigma$ 逐字一致。`graphs.tex:111-112` 补掉分子为零的情形。这里我要专门记一笔自己犯过的错：第一遍我以为 `graphs.tex:95-96` 那句多余的分类讨论是保险起见的废话，因为 $a$-spread 定义允许概率为零。重读 `resampling.tex:11-12` 才确认条件是对全部非空 $J\subseteq X$ 一致量化，与 $S_0$ 相交的 $J$ 也在其中，所以那一句是在补全集上的量化漏洞，删不得。

### 8.5 装配：$2048$ 出现在哪一行

`graphs.tex:115-122`：把 `trees.tex:29-46` 的树覆盖定理用在 `graphs.tex:39-48` 的树上，$\sigma=128q$，$\ell_k\le h$，于是

$$
r=\min\{1,\;2048\,\mathrm e^{50}q(1+\log_2 h)\}
$$

这份 Bernoulli 边集以概率至少 $\tfrac23$ 含一份 $H$ 的 copy。$2048=16\cdot128$ 正是 `trees.tex:38` 的 $16\,\mathrm e^{50}\sigma$ 代入 $\sigma=128q$；`graphs.tex:123-125` 再用 7.2 的 $1+\log_2 h\le3\log_2 n$ 得 $C=6144\,\mathrm e^{50}$。$\tfrac23$ 与 `introduction.tex:19` 定义 $p_{\mathrm c}$ 时用的 $\tfrac12$ 之间还有一步单调性：事件 $\{N(G(n,p),H)>0\}$ 关于 $p$ 单调（`introduction.tex:25-27` 的连续性论证依赖同一件事），$p=r$ 处概率已达 $\tfrac23\ge\tfrac12$，故下确界 $p_{\mathrm c}\le r$。tex 把这句当作显然，`main.tex:40-47` 的 abstract 直接给结论；我在第 15 节会看到 Lean 侧把这一小步摊成了几行。

## 9 转折点 B：`resampling.tex` 的后验恒等式，与局部引理的常数逐项复算

### 9.1 spread 定义里我漏读的两个自由度

`resampling.tex:8-13` 给 $a$-spread 的定义：对一切非空 $J\subseteq X$，$\mathbb P(J\subseteq A)\le a^{\lvert J\rvert}$。真正的信息量在 `resampling.tex:14-16`：分布允许由一个有限指标族 $(A_b)_{b\in B}$ 承载，不同指标可以有相同标签，标签可以为空，权重 $\nu_b>0$ 且 $\sum_b\nu_b=1$。我第一遍把"标签可以重复"当成排版上的宽容，后来在 `trees.tex:12-14` 看到同一件事被重申（不同节点或弧可以带相同标签，节点绝不因标签相同而被合并），才意识到这是树构造的前提：`graphs.tex:82-83` 的孩子是"所有包含 $S_0$ 的 $H_i$ 的 copy"，这些 copy 的增量 $I_0\setminus S_0$ 完全可能彼此相等，而它们必须是不同的孩子才能保住均匀分布。$\nu_b>0$ 的严格正也在 `resampling.tex:16` 写死，`trees.tex:11` 那句"删掉零权孩子"是同一件事的另一面。

### 9.2 恒等式：$Z$ 是 $\mu_\rho$ 之下 $Y$ 的密度

转移的三步在 `resampling.tex:26-36`：源 $c$ 按 $\nu$ 抽，令 $Y=W\cup A_c$；目标 $b$ 按后验

$$
\frac{\nu_b\rho^{-\lvert A_b\rvert}\mathbf 1_{\{A_b\subseteq Y\}}}{Z(Y)},\qquad
Z(Y)=\sum_{d\in B}\nu_d\rho^{-\lvert A_d\rvert}\mathbf 1_{\{A_d\subseteq Y\}};
$$

保留碎块 $T=A_b\setminus W$。`resampling.tex:37` 一行就说清 $Z(Y)>0$：取 $d=c$ 时 $A_c\subseteq Y$ 且 $\nu_c>0$。我认为这行是必要的，否则整个后验在 $Y$ 上不总为正。

`resampling.tex:38-45` 是这条路线真正的转折点，我把它单独验算了一遍。设 $W\sim\mu_\rho$ 且与源独立。固定源 $c$，植并 $Y=W\cup A_c$ 在给定 $A_c$ 下的分布是"$A_c$ 之内全有、之外按 $\mu_\rho$"，于是对任何 $Y\supseteq A_c$，其质量是 $\mu_\rho(Y)\rho^{-\lvert A_c\rvert}$（因为 $\mu_\rho(Y)=\rho^{\lvert A_c\rvert}(1-\rho)^{\lvert Y\setminus A_c\rvert}$ 而 $\mu_\rho$ 在 $A_c$ 上的因子 $\rho^{\lvert A_c\rvert}$ 被换成 $1$），$Y\not\supseteq A_c$ 时质量为零。合起来正是 $\mu_\rho(Y)\rho^{-\lvert A_c\rvert}\mathbf 1_{\{A_c\subseteq Y\}}$，与 `resampling.tex:40-41` 逐字一致。对 $c$ 按 $\nu$ 平均，得 $Y$ 的律相对 $\mu_\rho$ 的密度是 $\sum_c\nu_c\rho^{-\lvert A_c\rvert}\mathbf 1_{\{A_c\subseteq Y\}}=Z(Y)$。Bayes 反推 $b$ 的后验即 `resampling.tex:29-34`。我特意验了 $Z$ 的归一化：$\mathbb E_{Y\sim\mu_\rho}[Z(Y)]=\sum_c\nu_c\rho^{-\lvert A_c\rvert}\mathbb P(A_c\subseteq Y)=\sum_c\nu_c\rho^{-\lvert A_c\rvert}\rho^{\lvert A_c\rvert}=1$，确实是个密度，这一步 tex 没写，是我为确认自己没有误读而补的。

`resampling.tex:44-45` 的那句转折是全篇最容易被略过又最不能略过的：在指定 $W$ 时，只有源保证还是原来的律 $\nu$，目标的律可以与 $\nu$ 不同。我的失败路线四（第 6 节）就是没把这句话当回事。反过来，`trees.tex:193-195` 恰恰把这句话当工具用了，见 10.5。

### 9.3 两条包含关系与它们的消费点

`resampling.tex:47-51` 对任何正概率转移给出 $T\subseteq A_c\cap A_b$ 与 $A_b\subseteq W\cup T$。我自己验：目标为正概率蕴含 $A_b\subseteq Y=W\cup A_c$，故 $T=A_b\setminus W\subseteq A_c$，又 $T\subseteq A_b$，得第一条；第二条由 $A_b=(A_b\cap W)\cup(A_b\setminus W)\subseteq W\cup T$。`resampling.tex:52-53` 说第一条用来靠源比较碎块以保 spread，`resampling.tex:53-55` 说第二条让我们从 $W$ 与碎块恢复被选目标，而树里那个目标还决定保留哪个孩子及其后续（`resampling.tex:55-56`）。`resampling.tex:56-57` 补了第三条技术性质：整个转移（含碎块）只在 $\bigcup_{b}A_b$ 上查看 $W$ 的归属，`trees.tex:127-128` 直接引用它来定 $D_b(W)$ 的支撑集。

第一条包含还有个我在 `resampling.tex` 里找了半天才发现的消费点，在证明的 `resampling.tex:107-108`：$\lvert T\rvert>m/2$ 推出 $\lvert A_c\cap A_b\rvert>m/2$，靠的正是 $T\subseteq A_c\cap A_b$。也就是说失败事件的第二个分量能被写成关于交集大小的事件，这条包含在引理自己的证明里就用了一次，在树里又用了一次。

### 9.4 局部引理：假设、失败事件、以及 $50$、$10$、$9$、$11$ 四个数

`resampling.tex:59-83` 的假设是 $\lvert A_b\rvert\le m$、$\nu$ 为 $a$-spread、$0<\rho<1$、$a/\rho\le\mathrm e^{-50}$。失败事件是两个分量的并：$Z(Y)<\mathrm e^{-10m}$ 或 $\lvert T\rvert>m/2$（`resampling.tex:66-69`），结论 $\mathbb P(\text{local failure})\le\mathrm e^{-9m}$（`resampling.tex:71-73`），外加对目标之外函数的失真界 $\le\mathrm e^{11m}\nu_b\,\mathbb E f(W)$（`resampling.tex:74-81`）。

第一分量：`resampling.tex:87-92` 用密度身份把概率写成期望，$\mathbb P(Z<\mathrm e^{-10m})=\mathbb E_{Y\sim\mu_\rho}[Z(Y)\mathbf 1_{\{Z(Y)<\mathrm e^{-10m}\}}]\le\mathrm e^{-10m}$。这一行我起初以为是 Markov 的套话，写完才发现它的前提正是 9.2 验过的 $\mathbb E[Z]=1$，两件事缺一不可。

交集分布 `resampling.tex:96-102`：固定 $b$，$R=\lvert A_c\cap A_b\rvert$，$c\sim\nu$，则对 $0\le r\le m$（含平凡的 $r=0$）

$$
\mathbb P(R=r)\le\sum_{\substack{J\subseteq A_b\\\lvert J\rvert=r}}\mathbb P(J\subseteq A_c)\le\binom mr a^r.
$$

我数一下中间的过计数：满足 $A_c\cap A_b=J$ 的 $c$ 全体被 $\{J\subseteq A_c\}$ 覆盖，而 $\lvert A_b\rvert\le m$ 使这样的 $J$ 只有 $\binom mr$ 个，每个概率用 spread 放成 $a^r$。$r=0$ 时右端是 $1$，所以那句"含平凡情形"是在省一次分情况。

第二分量：`resampling.tex:104-108` 先把 $1/Z$ 界成 $\mathrm e^{10m}$，再对固定对 $(c,b)$ 用 $A_b\subseteq W\cup A_c$ 等价于 $A_b\setminus A_c\subseteq W$、概率 $\rho^{\lvert A_b\setminus A_c\rvert}$。我复算这里与后验权 $\rho^{-\lvert A_b\rvert}$ 的合并：

$$
\rho^{-\lvert A_b\rvert}\cdot\rho^{\lvert A_b\setminus A_c\rvert}=\rho^{-\lvert A_c\cap A_b\rvert},
$$

因为 $\lvert A_b\rvert-\lvert A_b\setminus A_c\rvert=\lvert A_b\cap A_c\rvert$。这正是 `resampling.tex:112-114` 那个只含交集的幂次的来历，第一遍我自己写成了 $\rho^{\lvert A_b\rvert}\rho^{-\lvert A_c\cap A_b\rvert}$，多出整整一个 $\rho^{\lvert A_b\rvert}$，导致后面所有余量估算都对不上，直到重做这一步才顺。于是（`resampling.tex:110-118`）

$$
\mathbb P(Z\ge\mathrm e^{-10m},\ \lvert T\rvert>m/2)\le\mathrm e^{10m}\sum_{r>m/2}\binom mr(a/\rho)^r\le\mathrm e^{10m}2^m\mathrm e^{-25m}.
$$

最后一步用 $a/\rho\le\mathrm e^{-50}$ 与 $r>m/2$：$(a/\rho)^{m/2}\le\mathrm e^{-25m}$，配上 $\sum_{r>m/2}\binom mr\le 2^m$。合起来（`resampling.tex:120-125`）是 $\mathrm e^{-10m}+\mathrm e^{-(15-\log2)m}\le\mathrm e^{-9m}$，$m\ge1$。我的数值检验：$\log2=0.6931$，$15-\log2=14.307$，两边除以 $\mathrm e^{-9m}$ 得 $\mathrm e^{-m}+\mathrm e^{-5.307m}\le1$，$m=1$ 时左端 $0.3679+0.0050=0.3728$，余量 $2.7$ 倍；$m$ 越大越松。真正的瓶颈是 $10$ 那个分母切割，$\mathrm e^{-10m}$ 项只能再吃回 $\mathrm e^{m}$，于是 $9=10-1$；交集项 $14.3$ 远比 $9$ 强，$2^m$ 与 $25$ 之间差着 $25-\log2-10=14.3$ 的净余量。

失真界 `resampling.tex:127-147` 的三行放缩我按同一顺序验：先 $\mathrm e^{10m}$ 界 $1/Z$，再把 $f$ 与 $\mathbf 1_{\{A_b\setminus A_c\subseteq W\}}$ 拆开（后者只用 $A_b$ 内的坐标，与只依赖 $A_b$ 外的 $f$ 独立，见 `resampling.tex:129-130`），合并幂次得 $\sum_c\nu_c\rho^{-\lvert A_c\cap A_b\rvert}$，再用 `resampling.tex:96-102` 放成 $\sum_{r=0}^m\binom mr(a/\rho)^r=(1+a/\rho)^m\le\mathrm e^m$（`resampling.tex:146-147`）。$10+1=11$ 就是 `resampling.tex:80` 的 $\mathrm e^{11m}$。这里 $a/\rho\le\mathrm e^{-50}$ 让 $(1+a/\rho)^m\le\mathrm e^{0.19m}$，比 tex 用的 $\mathrm e^m$ 强得多；也就是说 $11$ 可以换成 $10.2$，$9$ 可以换成 $9.8$。这些数没有被优化过，我按"够用就好"记录，属于 `[推测]`，依据是 `resampling.tex` 全篇没有任何常数取优的注释。

`resampling.tex:20-22` 明说本文在 MNSZ 的构造上新加两样：与容量相关的失败估计（$\mathrm e^{-9m}$ 这一条）和目标标签之外的测度界（$\mathrm e^{11m}$ 这一条）。这两样恰好对应第 5 节的两个坑：前者进 `trees.tex:147` 的 $\mathrm e^{-8m_s}$，后者进 `trees.tex:142` 的 $f=D_b$。

## 10 转折点 C：`trees.tex` 的剪枝势函数，以及同一个 $W$ 为什么够用

### 10.1 命题的输入输出

`trees.tex:29-46` 的树覆盖定理假设：不交概率树、$k\ge1$ 层、每层 $\sigma$-spread、正整数容量满足 $\ell_{i+1}\ge16\ell_i$，取 $r=\min\{1,16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)\}$，结论是 $\mathbb P_{W\sim\mu_r}(\exists P,\ \mathcal U(P)\subseteq W)\ge\tfrac23$。这里 $\mathcal U(P)=\bigcup_{(v,b)\in P}A_v(b)$（`trees.tex:16-19`）。`trees.tex:11-15` 的定义里"所有叶同深"这一条我起初当作美观，读到 `trees.tex:22`（一层容量指该层全部标签大小至多 $m$）与 `trees.tex:183-185`（成功输出保持同深度）才承认它是迭代时"层号对齐"的前提。

`trees.tex:56-74` 的单轮约化引理：输入 $k$ 层、容量 $m_1,\ldots,m_k$ 满足 $m_{j+1}\ge16m_j$、第 $j$ 层 $\alpha_j$-spread 且 $\alpha_j\le a$、$\rho=\mathrm e^{50}a<1$；给定 $W\sim\mu_\rho$ 时，一个确定程序以概率至少 $\tfrac34$ 成功，成功时输出同层数的不交概率树 $\mathcal T'$，使第 $j$ 层容量 $\lfloor m_j/2\rfloor$、spread 为 $\alpha_j/(1-\mathrm e^{-m_j})$（`trees.tex:67-68`），且每条 $\mathcal T'$ 的路径 $Q$ 都能配上 $\mathcal T$ 的一条路径 $P$ 满足 $\mathcal U(P)\subseteq W\cup\mathcal U(Q)$（`trees.tex:69-72`）。注意假设 $\rho=\mathrm e^{50}a$ 与 `resampling.tex:63-64` 的条件 $a/\rho\le\mathrm e^{-50}$ 恰好取等：$a/(\mathrm e^{50}a)=\mathrm e^{-50}$。这不是巧合，是让局部引理的可用性顶到边界，从而 $a$ 可以取到最大、$\rho$ 可以取到最小。

### 10.2 剪枝规则与 $\epsilon_s$ 预算

`trees.tex:79-94` 先把分析对象钉在输入树上：所有 $d_v(W)$、$t_{vb}(W)$ 都是固定输入树的 child law 上的量，在剪枝或条件化之前定义（`trees.tex:92-93`）。$d_v+\sum_b t_{vb}=1$（`trees.tex:89-91`）是后面所有算式的账本。剪枝自下而上：叶为好；outgoing 层为 $s$ 的节点 $v$ 为好当且仅当 $\sum_{b\text{ good}}t_{vb}(W)\ge1-\epsilon_s$，$\epsilon_s=\mathrm e^{-m_s}$（`trees.tex:98-103`），成功即根为好（`trees.tex:104`）。

我为什么接受这个判据：$\epsilon_s$ 是"允许丢掉的转移质量"，取值 $\mathrm e^{-m_s}$ 比局部失败概率 $\mathrm e^{-9m_s}$ 松 $8$ 个 $m_s$ 的量级，因此判据通常自动满足；一旦不满足，说明坏子的 $t$ 质量合计超过 $\epsilon_s$，这正是势的分子里要收的信息。

### 10.3 势的上界求和

`trees.tex:106-111` 定义 $D_v$，$D_v(W)>1$ 对坏节点成立（`trees.tex:112-120`，我在 5.2 已逐句验过）。对期望的递推 `trees.tex:145-149` 是

$$
\mathbb E D_v(W)\le\mathrm e^{-8m_s}+\mathrm e^{12m_s}\sum_{b\in\operatorname{Ch}(v)}\nu_v(b)\,\mathbb E D_b(W),
$$

其中 $8=9-1$、$12=11+1$，两个 $-1$ 都来自 $\epsilon_s^{-1}=\mathrm e^{m_s}$（`trees.tex:143-144`）。`trees.tex:151-156` 用"孩子权重合为一"反向归纳得

$$
\mathbb E D_v(W)\le\sum_{j=s}^k\exp\Bigl(12\sum_{h=s}^{j-1}m_h-8m_j\Bigr).
$$

我按归纳写了一遍：设对层 $s+1$ 的孩子成立，则乘 $\mathrm e^{12m_s}$ 并把内和的下标前移到 $s$，再加 $\mathrm e^{-8m_s}$ 正好补上 $j=s$ 那一项；叶子上 $D\equiv0$ 起归纳。根处（`trees.tex:157-164`）$\mathbb P(o\text{ bad})\le\mathbb E D_o\le\sum_{j=1}^k\exp(12\sum_{h<j}m_h-8m_j)$。

几何增长给 $\sum_{h<j}m_h\le m_j/15$：$m_{j-i}\le m_j/16^i$，求和 $1/16+1/16^2+\cdots=(1/16)/(1-1/16)=1/15$，这个 $15$ 是 $16$ 的直接产物。指数因此至多 $(12/15-8)m_j=-7.2m_j$，tex 在 `trees.tex:165-168` 放松为 $\sum_{m\ge1}\mathrm e^{-7m}<1/4$，理由是诸 $m_j$ 为互异正整数（严格增长即得）。数值：$\mathrm e^{-7}/(1-\mathrm e^{-7})=1/(e^{7}-1)=9.137\times10^{-4}$，对 $1/4$ 的余量约 $274$ 倍；若按 $-7.2$ 算则是 $1/(e^{7.2}-1)=7.47\times10^{-4}$。

我顺手算了这条链上最早失效的分离系数：要求 $12/(c-1)-8<0$，即 $c>2.5$。取 $c=3$ 时 $12/2-8=-2$，$\sum_{m\ge1}\mathrm e^{-2m}=1/(e^2-1)=0.1565<1/4$ 仍然过；$c=2.6$ 时指数 $-3$、和 $1/(e^3-1)=0.0524$ 也过。所以 $16$ 在势这一环上纯属富余。真正需要整数 $c$ 的是 `trees.tex:234-235` 的 $\lfloor16x\rfloor\ge16\lfloor x\rfloor$（整数倍才成立：右边是整数且不超过左边），以及 `graphs.tex:91` 那个由 $17$ 换出的严格 $16$。至于为什么把定理写成 $16$ 倍分离，tex 没给理由，`[推测]` 的理由是它与 `graphs.tex` 的 $1/17$ 分档同源于 $128$ 那一族 $2$ 的幂，配套改小要同时动 `graphs.tex` 与 `trees.tex` 两处，收益只是常数。

### 10.4 输出树与容量取整

`trees.tex:171-188`：成功时从好根出发，在 outgoing 层 $j$ 的好节点 $v$ 上令 $\gamma_v(W)=\sum_{b\text{ good}}t_{vb}(W)\ge1-\epsilon_j$（`trees.tex:174-176`），保留所有 $t_{vb}(W)>0$ 的好孩子、赋权 $t_{vb}(W)/\gamma_v(W)$、把进入标签换成 $T_b=A_v(b)\setminus W$，递归下去。`trees.tex:183-185` 说深度不变是因为保留的非叶节点处 $\gamma_v>0$；`trees.tex:185-187` 说标签是旧标签的子集，故仍不交，且保留弧上 $A_v(b)\subseteq W\cup T_b$ 给出恢复关系；`trees.tex:187-188` 说保留孩子的 $t_{vb}>0$ 蕴含 $\lvert T_b\rvert\le\lfloor m_j/2\rfloor$。最后这步我确认过：$t_{vb}>0$ 意味着该转移非局部失败，故 $\lvert T_b\rvert\le m_j/2$，整数性再给向下取整。`trees.tex:202-204` 补一句：所有 $t_{vb}(W)$ 确定地定义了整个构造，源与目标只是分析权重用的辅助随机变量。这句话回答了我 5.1 里"独立版本"的另一个隐患：程序本身不含抽取源与目标的额外随机性，因而可以谈"给定 $W$ 时的确定输出"。

### 10.5 spread 靠源传，不靠目标

`trees.tex:190-201` 的新 child law 是联合转移在"$E_v$（局部非失败且目标为好）"之下的目标边际。spread 的估计绕开目标、走源：`trees.tex:193-195` 用 `resampling.tex:48-49` 的第一条包含 $T\subseteq A_v(c)$，并强调"unconditioned source has law $\nu_v$ even at fixed $W$"（正是 `resampling.tex:44-45` 那半句），于是对非空 $J\subseteq X$，

$$
\mathbb P(J\subseteq T\mid E_v,W)\le\frac{\mathbb P_{c\sim\nu_v}(J\subseteq A_v(c))}{\gamma_v(W)}\le\frac{\alpha_j^{\lvert J\rvert}}{1-\epsilon_j}\le\Bigl(\frac{\alpha_j}{1-\mathrm e^{-m_j}}\Bigr)^{\lvert J\rvert}.
$$

我把中间那步的机制写清楚：事件 $\{J\subseteq T\}$ 含在源事件 $\{J\subseteq A_v(c)\}$ 里，对固定的 $W$ 源仍按 $\nu_v$ 走，而条件化在 $E_v$ 上至多把概率放大 $1/\mathbb P(E_v\mid W)=1/\gamma_v(W)$。$1-\epsilon_j$ 来自 `trees.tex:175` 的 $\gamma_v\ge1-\epsilon_j$。这一步是整个第 10 节里唯一用到"源的律在固定 $W$ 下不变"的地方，我在 5.3 找不到有利相关性的那个缺口，作者的做法是把要证的事换成关于源的、与 $W$ 无关的陈述，从而让相关性根本不出场。$\epsilon_j=\mathrm e^{-m_j}$ 的放大因子在迭代里会被 `trees.tex:239-243` 的乘积吸收，那是第 11 节的内容。

## 11 迭代的账：$4$、$s$、Markov 与预抽并集

`trees.tex:209-215` 起手取 $a=4\sigma$，$\rho=\mathrm e^{50}a$，$s=\lfloor\log_2\ell_k\rfloor+1$，并在 $r<1$ 的分支下声明 $0<\rho<1$。我把这三个量的相互约束排成一条链。$r=\min\{1,16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)\}<1$ 给出 $16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)<1$，而 $\rho=4\,\mathrm e^{50}\sigma$，于是

$$
\rho=\frac{r}{4(1+\log_2\ell_k)}\le\frac r4<1,
$$

因为 $\log_2\ell_k\ge0$。`trees.tex:215` 那句 "In particular $0<\rho<1$" 就压在这一步上；我第一遍写成 $\rho\le r$，检查 $r=16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)$ 与 $\rho=4\,\mathrm e^{50}\sigma$ 的比值才发现漏了因子 $4(1+\log_2\ell_k)$。另一头，`trees.tex:210` 说 $r=1$ 时结论立见：$\mu_1$ 是全集，$\mathcal U(P)\subseteq X$ 恒成立，概率为 $1\ge\tfrac23$。所以全文只处理 $r<1$。第 2 节我说过 $q>0$ 由单边约束 $q\ge1/(2\binom n2)=1/(n(n-1))$ 给出，代进来 $16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)\ge2048\,\mathrm e^{50}/(n(n-1))$，于是当 $n\gtrsim\sqrt{2048\,\mathrm e^{50}}\approx1.03\times10^{13}$ 时这个乘积必然大于 $1$，$r$ 被截断成 $1$、界退化为 $p_{\mathrm c}\le1$；只有 $n$ 足够大（也就是 $q$ 足够小）时 $r<1$ 分支才真正吃重，$n\ge2$ 的前提在 `introduction.tex:33` 写明。这一句 tex 没写，是我为了确认两个分支都不是空转做的算术。

`trees.tex:216-220` 的迭代协议是三句话：用新的独立 $\mu_\rho$ 样本反复尝试；失败的尝试让当前树不变；成功的尝试就换上引理给的 $\mathcal T'$；并且条件于全部过去，下一次抽样的律仍是 $\mu_\rho$。我在 5.1 已经用过"失败尝试树不变"这条：同一份 $W$ 重跑必然得到同样的好坏判定，所以重试必须换新样本。`trees.tex:219-220` 的"条件律不变"则是将来做等待时间论证的合法性凭据，它依赖当前树在给定全部过去时是确定的，而这由 `trees.tex:202-204` 的确定性构造保证。

### 11.1 容量取整与零容量前段的缝合

`trees.tex:222-226`：$t$ 次成功后原第 $i$ 层容量是 $m_i(t)=\lfloor\ell_i/2^t\rfloor$，用的是 $\lfloor\lfloor x\rfloor/2\rfloor=\lfloor x/2\rfloor$。我验过这条恒等式：设 $x=n+\theta$，$n\in\mathbb Z$，$0\le\theta<1$，左边 $=\lfloor n/2\rfloor$，右边 $=\lfloor n/2+\theta/2\rfloor$；$\theta/2<1/2$ 而 $n/2$ 的小数部分只可能是 $0$ 或 $1/2$，故右边不会跨过整数。

`trees.tex:227-233` 处理容量为零的层：零容量的层构成一个前缀段，每次成功后沿该段任选一条路径、保留其末端以下的子树、删掉这一段；已承诺的标签都是空集，故保留子树的每条路径添上选定的空前缀即成完整路径；恢复保证与保留节点上的全部界都保持不变；若一层不剩就只剩根；并固定一个破绑规则。我核对过这段的前提：`trees.tex:183-185` 说输出树深度不变，`trees.tex:8-11` 说所有叶同深，所以每个节点在每层都还有孩子，"任选一条路径"永远选得出来。$\gamma_v>0$ 又保证保留下来的非叶节点不会突然变叶。零容量的含义是该层所有标签大小至多 $\lfloor m_j/2\rfloor=0$，即全是空标签，于是缝合进去的弧确实不带边，恢复关系 $\mathcal U(P)\subseteq W\cup\mathcal U(Q)$ 不会因为缝合而失去依据。

`trees.tex:233-235` 断言剩下的正容量仍满足 $m_{i+1}(t)\ge16m_i(t)$，凭据是 $\lfloor16x\rfloor\ge16\lfloor x\rfloor$。这条只在整数倍时成立，这一点在第 10 节我核对过：右边是整数且不超过 $16x$，故不超过左边的下取整。

### 11.2 spread 参数：那个 $4$ 是怎么来的

`trees.tex:237-243`：$t$ 次成功后原第 $i$ 层的合法 spread 参数是

$$
\alpha_i(t)=\sigma\prod_{u=0}^{t-1}\Bigl(1-\mathrm e^{-\lfloor\ell_i/2^u\rfloor}\Bigr)^{-1}.
$$

`trees.tex:244-245` 说这乘积里的正整数 $\lfloor\ell_i/2^u\rfloor$ 互不相同。我按 $x\ge1$ 时 $\lfloor x/2\rfloor<x$ 验证：一旦某项为 $\ge1$，下一项严格变小，直到落入零容量前段被缝合掉，因此同一层上出现的整数两两不同。这条不同性是 $4$ 得以出现的全部理由，它跟 $16$ 倍分离无关。

`trees.tex:245-251` 把全体正整数上的无穷乘积压住：

$$
\sum_{m=1}^{\infty}-\log(1-\mathrm e^{-m})\le\frac{1}{1-\mathrm e^{-1}}\sum_{m=1}^{\infty}\mathrm e^{-m}=\frac{\mathrm e^{-1}}{(1-\mathrm e^{-1})^2}<\log4.
$$

我逐项复算。$-\log(1-x)\le x/(1-x)$（对 $0<x<1$，由 $-\log(1-x)=\int_0^x(1-t)^{-1}\,dt\le x/(1-x)$），取 $x=\mathrm e^{-m}$ 并用 $1-\mathrm e^{-m}\ge1-\mathrm e^{-1}$ 得第一号不等式；$\sum_{m\ge1}\mathrm e^{-m}=\mathrm e^{-1}/(1-\mathrm e^{-1})$ 得等号；数值上 $\mathrm e^{-1}=0.36788$、$1-\mathrm e^{-1}=0.63212$、$(0.63212)^2=0.39958$，商为 $0.92067$，而 $\log4=1.38629$，余量 $1.506$ 倍。也就是说 $a$ 取到 $\mathrm e^{0.92067}\sigma=2.5108\sigma$ 就已够用，tex 取 $a=4\sigma$，富余 $1.593$ 倍。`trees.tex:252` 收束为 $\alpha_i(t)\le4\sigma=a$，`trees.tex:252-255` 说明初始树满足这些界、引理在每次成功后归纳保持它们，故每次完成前的尝试条件成功概率至少 $\tfrac34$。这里 $\alpha_i(t)\le a$ 与引理假设 $\alpha_j\le a$（`trees.tex:60-61`）对接，$\rho=\mathrm e^{50}a$ 也因此在每一轮都保持 $<1$。

### 11.3 成功次数、等待时间与预抽

$2^s>2^{\log_2\ell_k}=\ell_k$（因为 $s=\lfloor\log_2\ell_k\rfloor+1>\log_2\ell_k$），所以 $s$ 次成功后 `trees.tex:224` 在每一层都为零，树被约化到只剩根。`trees.tex:258-259` 说把成功约化的恢复关系 `trees.tex:70-72` 逐次复合，这些抽样之并就含住原树某条路径的标签。

等待时间的账在 `trees.tex:260-265`：每一次下一成功的条件尾部分布被成功概率 $\tfrac34$ 的几何变量控制，故期望至多 $4/3$，总期望次数至多 $4s/3$，Markov 给"$4s$ 次以内完成"的概率至少 $2/3$。我按 Markov 复核：$\mathbb P(N>4s)\le\mathbb E N/(4s)\le(4s/3)/(4s)=1/3$，故 $\mathbb P(N\le4s)\ge2/3$。这里 $4s$ 与 $4/3$ 的比是 $3$，恰好等于 $1/(1/3)$，取整余量正好卡在 Markov 上：若把预抽次数改成 $3s$，结论就只剩 $\mathbb P\ge1/3$，定理里的 $\tfrac23$ 会退化。$\tfrac23$ 这个数在 `trees.tex:42-45` 与 `graphs.tex:122` 都以 $\ge\tfrac23$ 出现，它相对 $p_{\mathrm c}$ 定义里 $\tfrac12$ 的余量是 $1/6$（第 8.5 节末的单调性一步靠它）。

`trees.tex:267-276` 预抽 $4s$ 份 $\mu_\rho$ 独立样本，"包括过程最终不会用到的那些"，取并 $W_*$，其律为 $\mu_{r_*}$，$r_*=1-(1-\rho)^{4s}\le4s\rho=16\,\mathrm e^{50}\sigma s\le16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)=r$。这一步我起初读得草率，后来承认那句"包括不会用到的那些"是关键：若只对实际用到的样本取并，用的份数本身是随机、且依赖于样本结果的停时，并集的律就无法写成 $\mu_{r_*}$，尾部的 $1-(1-\rho)^{4s}$ 也不成立。$1-(1-\rho)^{4s}\le4s\rho$ 是 Bernoulli 并界（补集形式 $(1-\rho)^{4s}\ge1-4s\rho$）。$s\le1+\log_2\ell_k$ 来自 $\lfloor\cdot\rfloor+1$。最后 `trees.tex:276-277` 用单调性把 $\mu_{r_*}$ 换到 $\mu_r$，$r_*\le r$ 时可用标准耦合 $W_*\subseteq W$ 逐样本实现。

顺带确认 $a=4\sigma$ 时 $\rho$ 与最终系数的关系：$\rho=4\,\mathrm e^{50}\sigma$，$4s\rho\le4(1+\log_2\ell_k)\cdot4\,\mathrm e^{50}\sigma=16\,\mathrm e^{50}\sigma(1+\log_2\ell_k)$。我在第 5 节独立版本里担心的 $k$ 因子在这里根本不出现，$4s\rho$ 只跟 $s$ 有关，跟层数 $k$ 无关。

## 12 常数总账：把 $2048\,\mathrm e^{50}$ 拆回它的全部来源

从 $q$ 到结论的每一级倍数我都列成一笔流水。起点 $q=p_{\mathrm E}(n,H)$（`graphs.tex:9`）。第一级 $\sigma=128q$（`graphs.tex:9`），来源是 `graphs.tex:63-71` 的 $R_\sigma(I,S)\le2\binom{h_I}{r}128^{-r}$ 与分档 $r\ge h_I/17$，需要 $\sigma/q>34\,\mathrm e=92.4216$，$128$ 是满足它的 $2$ 的幂里最小的（$64$ 时 $2\cdot17\,\mathrm e/64=1.4441>1$ 直接崩）。第二级 $17$ 换 $16$：`graphs.tex:78` 的 $\lvert H_{i-1}\rvert<\lvert H_i\rvert/17$ 经 `graphs.tex:91` 变成 $\ell_{i+1}>16\ell_i$，供 `trees.tex:34` 与 `trees.tex:58` 使用。第三级 $a=4\sigma$（`trees.tex:212`），来源是 `trees.tex:245-251` 那个不等式 $\mathrm e^{-1}/(1-\mathrm e^{-1})^2=0.92067<\log4$，实际阈值 $2.5108$，富余 $1.593$ 倍。第四级 $\rho=\mathrm e^{50}a=4\,\mathrm e^{50}\sigma=512\,\mathrm e^{50}q$（`trees.tex:61`、`trees.tex:213`），$\mathrm e^{50}$ 是 `resampling.tex:63-64` 的条件 $a/\rho\le\mathrm e^{-50}$ 取等，而这个 $50$ 的作用是让 `resampling.tex:116-117` 的 $(a/\rho)^{m/2}\le\mathrm e^{-25m}$ 大过 $\mathrm e^{10m}2^m$；把 $50$ 换小，只要 $25>10+\log2$ 即 $50>2(\log2+10)=21.39$ 就还能闭合，$50$ 的富余接近 $2.3$ 倍。第五级 $r=16\,\mathrm e^{50}\sigma s$ 的 $16$ 来自 $4s\le4(1+\log_2\ell_k)$ 与 $\rho$ 的系数 $4$ 相乘（`trees.tex:272-274`）。合起来 $16\cdot128=2048$，故 $r=\min\{1,2048\,\mathrm e^{50}q(1+\log_2 h)\}$（`graphs.tex:120`），最后 $\log_2$ 换算给 $6144=3\cdot2048$（`graphs.tex:125`、7.2）。

我拿这些级数做了三个反事实试验，看每处改动断在哪一步。把 $128$ 改成 $64$：断在 `graphs.tex:70`，$r=1$ 时 $R_\sigma(I,S)$ 可以大于 $1$，`graphs.tex:72` 的"$\lvert S\rvert<\lvert I\rvert/17$"失效，整个嵌套构造起不来。把 $16$ 倍分离改成 $8$ 倍（相应把分档改成 $9$、$\sigma_0$ 取 $64$）：`trees.tex:165-168` 只需 $\sum_{h<j}m_h\le m_j/7$，指数 $12/7-8=-6.286<0$、$\sum_{m\ge1}\mathrm e^{-6.286m}=1/(e^{6.286}-1)=0.00192<1/4$ 都过；$\lfloor8x\rfloor\ge8\lfloor x\rfloor$ 也过；$2(9\,\mathrm e/\sigma_0)^1<1$ 要 $\sigma_0>18\,\mathrm e=48.92$，取 $64$ 可行，于是最终系数可以降到 $8\cdot64=512$。这条试验我标 `[推测]`：tex 从未声称 $2048$ 可优化，我只验证"$8$ 倍分离加 $64$"在我复算到的每一处代入都不等号保持，没做全文检查是否有别处隐式用了 $16$。把 $4$ 改成 $3$：$\alpha_i(t)\le3\sigma$ 需要 $3>\mathrm e^{0.92067}=2.5108$，成立，于是 $a=3\sigma$、$\rho=3\,\mathrm e^{50}\sigma$、$4s\rho\le12\,\mathrm e^{50}\sigma(1+\log_2\ell_k)$，系数降到 $12\cdot128=1536$。这三笔试验共同指向：$2048$ 与 $\mathrm e^{50}$ 都是富余常数组，而定理形状 $p_{\mathrm c}\le C\,p_{\mathrm E}(1+\log_2 h)$ 里的 $\log_2 h$ 才是结构性部分，动它就动第 5 节与第 6 节算出的那两个 log 之一。

$2048\,\mathrm e^{50}\approx1.0618\times10^{25}$、$6144\,\mathrm e^{50}\approx3.1855\times10^{25}$、$\mathrm e^{50}\approx5.18470\times10^{21}$ 这三个数值按 `introduction.tex:45`（$\mathrm e$ 是自然对数的底）核对过写法。

## 13 最终思路与最初设想差在哪

装配线本身在 `introduction.tex:174-184` 就写完了：`trees.tex` 把约化同时施在固定树的每个节点上，一个递归定义的势控住"太多延续失败"的概率，目标弧之下所有标签都避开该弧的标签，于是局部的测度变换估计适用于整个后代势；这一步容许同一个 $W$ 在付受控条件化代价的同时把每层容量减半；迭代只需对数多次成功抽样；`graphs.tex` 造出层次并把普通 copy 归一化写清楚，最后套用树覆盖定理。我复算完这段，把最初的设想与最终看到的差异归成五条。

差异一，$q_f$ 全程不出场。我以为正文的主体是比较引理，实际正文里 $q_f$ 只在 `introduction.tex:76-79`、`introduction.tex:81-83`、`introduction.tex:91-95`、`introduction.tex:113-115`、`introduction.tex:117-121`、`introduction.tex:128-129` 出现，全在史话段落；`graphs.tex`、`resampling.tex`、`trees.tex` 三节里没有一处。真正用的约束是 `graphs.tex:60-61` 的 $M(S)q^r\ge\tfrac12$，即 $p_{\mathrm E}$ 自己的定义式。第 3 节那条方向账因此是决定性的：与其修 $q$ 与 $p_{\mathrm E}$ 的间隙，不如绕开 $q$。

差异二，$p_{\mathrm E}\le p_{\mathrm c}$ 被反过来当规格用。`introduction.tex:30` 那句在原文里是给下界，我在树定理里发现它的用法是定义"必须带 $\tfrac12$ 预算的那种分布族"：`graphs.tex` 极大化的目标 $R_\sigma$ 里的 $\sigma$ 与 `graphs.tex:61` 的 $\tfrac12$ 预算是同一族约束的两半，第 10.5 节的 spread 传递也靠这一族给 $\mathbb P(J\subseteq A_v(c))\le\alpha_j^{\lvert J\rvert}$。抽象定理把 $\tfrac12$ 变成 cover 代价，本文把 $\tfrac12$ 直接留在计数约束里。

差异三，log 的来源从"fragment 数"换成"容量减半次数"。我预期 log 来自 FKNP 的 $\log\ell$ 或 Park--Pham 的最小 fragment 论证（`introduction.tex:89-95`），实际 log 来自 `trees.tex:213` 的 $s=\lfloor\log_2\ell_k\rfloor+1$ 与 `trees.tex:271-274` 的 $4s\rho$：每轮成功把每层容量折半，折到零就把整棵树约化到只剩根。$\ell_k\le h$（`graphs.tex:47`）是这条链唯一用到图论的地方。

差异四，随机对象比我预想的更少。我以为构造里要抽源、抽目标、抽每层的随机集，实际 `trees.tex:202-204` 声明整个约化由 $t_{vb}(W)$ 确定地给出，源与目标只是分析权重的辅助变量；`resampling.tex:38-45` 的后验解释只在取期望时用一次。真正确定的随机性只有两处：$W\sim\mu_\rho$ 的每次尝试（`trees.tex:216-217`）与最后的预抽并（`trees.tex:267-268`）。

差异五，"paying the log once" 的具体形态。`introduction.tex:137-140` 说的是耦合猜想会做到的事，正文给出的替代是同一个 $W$ 加不交性：`trees.tex:126-129` 与 `figures/outside-label.tex:19-21` 那一句话的图注就是它的全部内容。我第 5 节的两种独立化方案各自多付一个 $k$，而本文的写法让 $k$ 完全不进入密度账，只进入层数（层数在 $r$ 的表达式里被 $\log_2\ell_k$ 取代）。

最后核一遍前向引用是否落地：第 5.1 节提到的"预抽 $4s$ 份"在第 11.3 节展开；第 6.1 节承诺的乘积收敛证明在第 11.2 节；第 8.4 节引用的 spread 传递在第 10.5 节；第 2 节提到的 $r<1$ 分支讨论在第 11 节开头；第 7.2 节的底数账在第 8.5 节被消费；第 1 节与第 8.1 节关于普通 copy 的两处互相指认，分别是 `graphs.tex:24-28` 与 `graphs.tex:11-14`。第 14 节是符号台账，第 15 节是 Lean 侧对照，第 16 节是未决清单。

## 14 符号台账

全文只这一张表。位置列指 tex 文件与行号；带"自算"字样的行是我自己的推导，正文里已声明过其依据行。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $p_{\mathrm c}(n,H)$ | 使 $\mathbb P(N(G(n,p),H)>0)\ge\tfrac12$ 的下确界 | introduction.tex:18-19 | 定理左端 introduction.tex:35-37 | 预算从 $\tfrac12$ 挪走会同时改 `graphs.tex:122` 的 $\tfrac23\to\tfrac12$ 传递与第 2 节的 $p_{\mathrm E}\le p_{\mathrm c}$ |
| $p_{\mathrm E}(n,H)$，记作 $q$ | 每个子图期望计数 $\ge\tfrac12$ 的最小密度 | introduction.tex:20-22，graphs.tex:9 | 一阶动量约束 graphs.tex:60-61 | 预算换成 $1$ 时 `graphs.tex:64` 的因子 $2$ 消失，$\sigma/q$ 门槛从 $34\,\mathrm e$ 降到 $17\,\mathrm e$ |
| $h=e(H)$ | $h\ge1$，出现在 $\log_2 h$ | introduction.tex:33-34，graphs.tex:120 | 最终 $r$ 的对数因子 | 用 $\log_2 n$ 代替要过 `graphs.tex:123-124` 的 $h\le\binom n2$，系数由 $2048$ 变 $6144$ |
| $N(G,F)$ | ordinary copy 数，允许多余边 | introduction.tex:11-13 | 两个阈值的定义 | 改成诱导 copy 则 `graphs.tex:11-14` 的补点扩展失效，删孤立点那步起不来 |
| $\mathcal F_H$ | 含一份 $H$ copy 的边集族 | introduction.tex:101-102 | 方向账 $p_{\mathrm E}\le q\le q_f\le p_{\mathrm c}$ | 抽象定理只把顶端由中段控制，方向朝外，第 3 节即死在此 |
| $q(\mathcal F)$ 与 $q_f(\mathcal F)$ | cover 与 fractional cover 在代价 $\tfrac12$ 下的最大 $p$ | introduction.tex:74-79 | 史话 introduction.tex:80-95 | 正文三节一次未用，删去不影响任何不等式 |
| $\widetilde p_{\mathrm E}(n,H)$ | 约束右端为 $N(H,F)/2$ | introduction.tex:107-111 | MNSZ 的单 log 结论 | 与 $p_{\mathrm E}$ 的单约束解差 $N(H,F)^{-1/r}$，第 4 节卡在方向 |
| $2^{1/r}\le2$ | 归一化伸缩率 | introduction.tex:49-51 | 猜想在两种预算下等价 | 若 $r$ 可任意小则失效，`introduction.tex:49` 已限定 $r\ge1$ |
| $\Theta(1/n)$ 与 $\Theta(\log n/n)$ | 完全匹配的 $p_{\mathrm E}$ 与 $p_{\mathrm c}$ | introduction.tex:59-61 | 对数不可省的理由 | 删掉此例则 $\log$ 因子的必要性只余 `introduction.tex:63-64` 的 Hamilton 圈说法 |
| $1/(3n)$ | DKP 已证单 log 的门槛 | introduction.tex:121 | 失败路线二的适用边界 | $p_{\mathrm E}=\Theta(1/n)$ 与它同量级，第 4 节据此判定连匹配都吃不下 |
| $L$ | clique 与圈上绝对，树依赖度界 | introduction.tex:125-127 | DKP25Cases 的测试图代入 | 让 $H$ 的最大度增长则 $L$ 随之走，结论要求的绝对 $C$ 无法闭合 |
| $a$-spread | $\mathbb P(J\subseteq A)\le a^{\lvert J\rvert}$ 对一切非空 $J$ | resampling.tex:10-13 | 局部引理假设 resampling.tex:60-61 | 量化范围一收窄，`graphs.tex:95-96` 那条 $J\cap S_0\ne\varnothing$ 的分支就没处安放 |
| $\nu_b>0$ 与 $\sum_b\nu_b=1$ | 指标族权重，标签可重名可为空 | resampling.tex:14-16 | $Z(Y)>0$ 见 resampling.tex:37 | 允许零权则该正性论证断，`trees.tex:11` 的删零权孩子也无从谈起 |
| $\rho^{-\lvert A_b\rvert}$ | 后验倾斜因子，$\rho$ 可远小于 $1$ | resampling.tex:29-34 | 后验解释与失真界 | 去掉它 `resampling.tex:38-45` 的密度身份即失，第 6 节的耦合无从谈起 |
| $Z(Y)$ | $\sum_d\nu_d\rho^{-\lvert A_d\rvert}\mathbf 1_{\{A_d\subseteq Y\}}$，是 $\mu_\rho$ 之下 $Y$ 的密度 | resampling.tex:31-45 | resampling.tex:87-92 与 resampling.tex:104 | $\mathbb E[Z]=1$ 一坏，$\mathrm e^{-10m}$ 那一项的 Markov 型估计就失据 |
| $\mathrm e^{-50}$ | $a/\rho$ 的上限，在 $\rho=\mathrm e^{50}a$ 处取等 | resampling.tex:63-64，trees.tex:61 | $\mathrm e^{-25m}$ 见 resampling.tex:116-117 | 降到 $21.4$ 以下则 `resampling.tex:122` 的 $\mathrm e^{-(15-\log2)m}$ 变号 |
| $\mathrm e^{-10m}$ | 分母切割线 | resampling.tex:67，resampling.tex:104 | 失败事件第一分量 | 收紧到 $\mathrm e^{-9m}$ 则 `resampling.tex:120-124` 的 $\mathrm e^{-9m}$ 目标失去余量 |
| $m/2$ | 碎块大小阈值 | resampling.tex:68，resampling.tex:107-108 | $\lvert T_b\rvert\le\lfloor m_j/2\rfloor$ 见 trees.tex:187-188 | 阈值抬到 $m/2+\delta$ 则容量无法折半，迭代次数失去界 |
| $\mathrm e^{-9m}$ | 局部失败概率 | resampling.tex:71-73 | $\mathbb E D_v$ 的 $\mathrm e^{-8m_s}$ 项见 trees.tex:147 | 放松到 $\mathrm e^{-m}$ 级则 `trees.tex:165-168` 的 $1/4$ 立不住 |
| $\mathrm e^{11m}\nu_b$ | 目标之外函数的测度失真 | resampling.tex:74-81 | `trees.tex:142` 取 $f=D_b$ | 失去 $f$ 只依赖 $A_b$ 之外的前提，`trees.tex:124-129` 的支撑集论证就白做 |
| $\binom mr a^r$ | 交集大小的尾分布 | resampling.tex:96-102 | resampling.tex:116 与 resampling.tex:143 两处 | $r=0$ 那项若另议，`resampling.tex:96` 的"含平凡情形"要拆成两段 |
| $\mu_\rho$ | $X$ 上的独立子集测度 | introduction.tex:187-189 | 全篇所有抽样 | 换成非乘积测度则 `resampling.tex:129-130` 的独立性拆分失效 |
| $k$（层数） | $k<1+\log_{17}h$，自算 | graphs.tex:77-79 | 第 5.1 与 6.1 节的反例账 | 该界只用来定量说明多付的 $\log$，正文结论不含 $k$ |
| $\mathcal U(P)$ | 路径标签之并 | trees.tex:16-19 | 覆盖事件 $\mathcal U(P)\subseteq W$ | 定义一改，`trees.tex:69-72` 与 `trees.tex:258-259` 的复合就失去对象 |
| $16$ | 容量分离系数 | trees.tex:34，trees.tex:58 | $\sum_{h<j}m_h\le m_j/15$ 见 trees.tex:165-166 | 只用于势的指数与 $\lfloor16x\rfloor\ge16\lfloor x\rfloor$；理论下界约 $c>2.5$，见第 12 节 |
| $15$ | 由 $16$ 来的几何级数和 | trees.tex:166 | 指数 $12\cdot(1/15)-8=-7.2$ | 分离系数变 $c$ 则改为 $1/(c-1)$，$12/(c-1)<8$ 是唯一硬条件 |
| $8$ 与 $12$ | 势递推的两个指数 | trees.tex:147-148 | 求和界 trees.tex:152-156 | $12=11+1$、$8=9-1$ 全由 `resampling.tex` 两个常数加 $\epsilon_s^{-1}$ 决定，改动要同步 |
| $\epsilon_s=\mathrm e^{-m_s}$ | 剪枝允许丢掉的质量 | trees.tex:98，trees.tex:110 | $\gamma_v\ge1-\epsilon_j$ 见 trees.tex:175 | 放大到与 $\mathrm e^{-9m_s}$ 同量级则 spread 分母与 $D_v>1$ 同时崩 |
| $\lfloor m_j/2\rfloor$ | 单轮后的容量 | trees.tex:67-68 | $m_i(t)=\lfloor\ell_i/2^t\rfloor$ 见 trees.tex:224 | 折半比例改小则 $s$ 变大，最终 $\log$ 系数按倒数放大 |
| $\alpha_j/(1-\mathrm e^{-m_j})$ | 单轮后的 spread 参数 | trees.tex:68 | 乘积 $\alpha_i(t)$ 见 trees.tex:239-243 | 分子若换成路径级常数，$k$ 因子回来，见第 6.1 节 |
| $4$ | 无穷乘积 $\prod_m(1-\mathrm e^{-m})^{-1}<4$ | trees.tex:245-252 | $a=4\sigma$ 见 trees.tex:212 | 实际阈值 $\mathrm e^{0.92067}=2.5108$，取 $3$ 可让系数降到 $1536$，见第 12 节 |
| $\tfrac34$ | 单轮尝试成功概率 | trees.tex:64-65 | 期望等待 $4/3$ 见 trees.tex:260-263 | 若只到 $\tfrac12$ 则 $4s$ 次预抽的概率降到 $\tfrac12$，$\tfrac23$ 崩 |
| $s=\lfloor\log_2\ell_k\rfloor+1$ | 所需成功次数 | trees.tex:213 | 预抽 $4s$ 见 trees.tex:267-268 | $2^s>\ell_k$ 一坏，容量不会全部归零 |
| $4s\rho\le r$ | 并集密度与定理参数 | trees.tex:271-274 | 单调性 trees.tex:276-277 | 失去 $s\le1+\log_2\ell_k$ 就要重估 $r$ 的定义 |
| $\tfrac23$ | 存在被覆盖路径的概率 | trees.tex:42-45 | graphs.tex:122 与 $p_{\mathrm c}$ 的 $\tfrac12$ | Markov 余量恰好 $1/3$，见第 11.3 节 |
| $M(F)=(n)_{v(F)}/\lvert\operatorname{Aut}(F)\rvert$ | $K_n$ 里 $F$ 的 copy 数 | graphs.tex:24-25 | copy 比恒等式 graphs.tex:32-34 | 按嵌入计数会多 $\lvert\operatorname{Aut}(F)\rvert$ 因子，$\binom{h_I}{r}$ 那一步失效 |
| $M(I,S)\le\binom{h_I}{r}$ | $I$ 内 $S$ 的 copy 数不超过边子集数 | graphs.tex:61 | $R_\sigma$ 的上界 graphs.tex:64 | 普通 copy 语义下成立；诱导语义或嵌入语义都需另乘因子 |
| $128$ | $\sigma/q$ | graphs.tex:9 | graphs.tex:65 与 graphs.tex:70 | 小于 $34\,\mathrm e=92.4216$ 即断，$64$ 已在 $r=1$ 处崩 |
| $17$ | 极大化的分档除数 | graphs.tex:67，graphs.tex:72，graphs.tex:78 | $\ell_{i+1}>16\ell_i$ 见 graphs.tex:91 | 可放大到 $23$（需 $\sigma/q$ 相应放大），缩小则层数增多 |
| $\sigma=128q$ | 树定理的 spread 输入 | graphs.tex:9，trees.tex:49 | $r$ 的系数 graphs.tex:117-120 | 与 $16$ 相乘才出 $2048$，任一处改都要重跑第 12 节流水 |
| $2048=16\cdot128$ | 定理主系数 | introduction.tex:37，graphs.tex:120 | abstract 的 $C$，main.tex:44 | 只在 `graphs.tex:70` 与 `trees.tex:274` 两处被引用 |
| $6144=3\cdot2048$ | $\log_2 n$ 版本的 $C$ | introduction.tex:41，graphs.tex:125 | 推论 | 因子 $3$ 来自第 7.2 节的底数账，余量实测 $1.5$ 倍 |

## 15 Lean 侧对照：只读那一行登记与两个单文件

`.tools/records.txt` 的物理第 $142$ 行以字段 $1482$ 开头，整行内容是 `1482 | ComparatorChallenges/SecondKahnKalai.json | declaration: OAI.LeanBlast.SecondKahnKalai.secondKahnKalaiBounds | file: OAI/Combinatorics/GraphThreshold/Main.lean`。派单里说的 records 第 $1482$ 行对应的是这个行首字段，物理行号是 $142$，我把两种读法都记下来，免得自己按物理行号去找时误判成取证失败。

`lean/ComparatorChallenges/SecondKahnKalai.json` 共 $14$ 行：`challenge_module` 是 `ComparatorChallenges.SecondKahnKalai`，`solution_module` 是 `OAI.Combinatorics.GraphThreshold.Main`，`theorem_names` 只列 `OAI.LeanBlast.SecondKahnKalai.secondKahnKalaiBounds`，`definition_names` 是空数组，`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice` 三条，`enable_nanoda` 为 `false`。空 `definition_names` 与 tex 的对应我可以读出一点意思：新增谓词 `SecondKahnKalaiBounds` 记在 challenge 模块（`lean/ComparatorChallenges/SecondKahnKalai.lean:58`），解侧只交一条 theorem，这跟 tex 把 $p_{\mathrm c}$ 与 $p_{\mathrm E}$ 的定义放在 `introduction.tex:17-23`、正文只交一条定理（`introduction.tex:32-43`）在结构上是同一取向。

challenge 文件里按定点 grep 看到的定义清单：`bernoulliWeight` 第 $15$ 行、`bernoulliExpectation` 第 $19$ 行、`bernoulliProbability` 第 $23$ 行、`graphOfEdges` 第 $32$ 行、`edgeCount` 第 $36$ 行、`expectedCopies` 第 $39$ 行、`containmentProbability` 第 $44$ 行、`criticalThreshold` 第 $49$ 行、`expectationThreshold` 第 $52$ 行、`logTwo` 第 $56$ 行、`SecondKahnKalaiBounds` 第 $58$ 行，以及同名 stub 定理第 $65$ 到 $68$ 行、其体是 `sorry`。这套定义与 tex 的对应相当直白：`bernoulliProbability` 对 $\mathbb P_{W\sim\mu_p}$，`graphOfEdges` 把边集映成简单图、对 `introduction.tex:13-15` 的 $G(n,p)$，`expectedCopies` 对 $\mathbb E N(G(n,p),F)$，`expectationThreshold` 对 `introduction.tex:20-22`，`criticalThreshold` 对 `introduction.tex:18-19`，`edgeCount` 对 $h=e(H)$。tex 用 $X=\binom{[n]}2$（`graphs.tex:40-41`）作底集，Lean 用 `Finset (Edge n)`（第 $23$ 行与第 $32$ 行），是同一件事的两种写法。

解侧 `lean/OAI/Combinatorics/GraphThreshold/Main.lean` 的 `secondKahnKalaiBounds`（第 $25$ 到 $65$ 行）我能读到的骨架与 tex 对应如下。$q$ 取 `expectationThreshold n H`（第 $29$ 行），正性走 `expectationThreshold_pos`（第 $30$ 行），正是 `introduction.tex:28` 那句单边约束。第 $31$ 到 $33$ 行用 `exists_graphRepresentationWithConstraints` 与 `expectationThreshold_attained` 把 $q$ 换成具体图表示 $E$ 并取出全部约束 `hEconstraint`，对应 `introduction.tex:25-27` 的下确界取得到与 `graphs.tex:15-16` 的每条边子集在 $q$ 下期望至少 $\tfrac12$。第 $35$ 到 $37$ 行的 `exists_spread_orbit_tree (Equiv.Perm (Fin n)) E q hq hEnonempty` 把 `graphs.tex:39-48` 的层次引理整体打包，置换群 `Equiv.Perm (Fin n)` 是 `graphs.tex:35-37` 那句置换对称论证的形式化载体，也就是说 7.1 节的 copy 比恒等式在 Lean 侧是构造的一部分、独立引理的地位没有保留。第 $38$ 到 $39$ 行给出 `hm : 0 < m (k - 1)` 与 `hmh : m (k - 1) ≤ edgeCount H`，对 `graphs.tex:45-47` 的 $\ell_1\ge1$ 与 $\ell_k\le h$，差别在标号从 $0$ 起。第 $40$ 到 $42$ 行同时写两个密度：`p` 用 `min 1 (2048 * Real.exp 50 * q * (1 + logTwo (edgeCount H : ℝ)))`，`pTree` 用 `min 1 (16 * Real.exp 50 * (128 * q) * (1 + Real.logb 2 (m (k - 1) : ℝ)))`，两式与 `graphs.tex:120` 和 `trees.tex:38` 逐字对齐；这里有一处书写不一致我要记下：同一个底数 $2$ 的对数，在 `p` 里用 challenge 模块自定义的 `logTwo`（其定义 `Real.log x / Real.log 2` 在第 $56$ 行），在 `pTree` 里用 `Real.logb 2`，两者数学相同，而第 $45$ 到 $46$ 行的 `treeSamplingParameter_le_graphParameter` 必须把它们认成同一个量，该引理的证明体我没读。第 $47$ 到 $49$ 行调用 `tree_covering` 并传入 $128q$ 作 spread 参数，得 `2 / 3 ≤ bernoulliProbability pTree T.CoveredBy`，即 `trees.tex:41-45`；第 $50$ 到 $54$ 行用 `bernoulliProbability_mono_parameter` 把密度从 `pTree` 抬到 `p`，附带的集合单调论证（第 $53$ 行 `rintro W W' hWW'` 之后把路径并往大里放）对 `trees.tex:276-277` 的 by monotonicity；第 $55$ 行的 `hevent` 把 `T.CoveredBy` 换成 `containmentProbability n p H`；第 $63$ 到 $64$ 行用 `(by norm_num : (1 / 2 : ℝ) ≤ 2 / 3)` 与三段传递接起来，第 $65$ 行再交 `graphThresholdParameter_le_vertexBound`，对应 `graphs.tex:123-125` 的 $1+\log_2 h\le3\log_2 n$ 与 $\min\{1,\cdot\}$ 截断。第 $67$ 到 $69$ 行的 `secondKahnKalai : FullStatement` 只把 `secondKahnKalaiBounds` 组装成全称陈述，`FullStatement` 在第 $23$ 行即 `SecondKahnKalaiStatement.{u}`，`universe u` 在第 $21$ 行，命名空间 `LeanBlast.SecondKahnKalai` 在第 $19$ 行。

三处我不能核对，如实登记。第一，`Main.lean` 的第 $56$ 到 $62$ 行在那次定点 grep 的窗口之外，`hevent` 之后到第 $63$ 行之间的推导原文我没读到，故"$\tfrac23$ 如何变成 $p_{\mathrm c}\le p$"在 Lean 侧的确切写法标 `[推测]`，缺口原因是取证调用预算，与文件是否缺失无关。第二，`tree_covering` 与 `exists_spread_orbit_tree` 所在模块内部我没有读（边界只允许那一条登记、其指向的模块文件与 comparator json），所以 `trees.tex:106-120` 的势函数、`trees.tex:245-251` 的无穷乘积在 Lean 里是否逐项存在，我无法判定。第三，`permitted_axioms` 三条与 tex 的对应只能按内容猜：`Classical.choice` 大概被 `introduction.tex:25-27` 的下确界与 `graphs.tex:57-58`、`trees.tex:233` 的两处固定破绑规则用到，`propext` 与 `Quot.sound` 我看不出对应点，整条标 `[推测]`，依据只有 json 的第 $8$ 到 $12$ 行。另需说明：`enable_nanoda` 与公理清单对我判定这条登记是否覆盖本文没有判别作用，归属只按 json 第 $4$ 到 $6$ 行的定理名与陈述对齐。

## 16 未决、缺口，以及本篇所有 `[推测]` 的清单

先声明一条方法性的坦白：这篇 tex 通篇没记载任何失败尝试，七个文件里带"未用、未证、限于"性质的句子只有 `introduction.tex:99`（那条等价不使用）、`introduction.tex:101-104`（抽象定理单独不够）、`introduction.tex:121`（DKP 只在 $p_{\mathrm E}<1/(3n)$ 证到）、`introduction.tex:125-127`（$L$ 依赖度界）、`introduction.tex:137-143`（Tran 的耦合猜想未被采用）、`trees.tex:25-26`（不对整条路径假设 spread）、`resampling.tex:44-45`（固定 $W$ 时目标律会变）。第 3 到第 6 节的五条失败路线是我以这些句子为锚点、加上自己复算的常数级数重构出来的思维过程，属于研究笔记性质的记录，整体标 `[推测]`；我按"每条失败都要指出被哪个量卡住"的要求写，不把它们当作论文内容引用。

其余 `[推测]` 与缺口逐条列明，并说明信息为何不足。第一，第 8.2 节关于 $128$ 取 $2$ 的幂、$17=16+1$ 的动机：tex 只在 `graphs.tex:5-6` 说了常数要配得上容量的 $16$ 倍分离，没有取优说明。第二，第 10.3 节关于 $16$ 倍分离为何不取更小整数：我算出势只需 $c>2.5$，tex 无解释。第三，第 11.2 节与第 12 节的 $4$ 与 $\mathrm e^{50}$ 的富余：我只复算了不等式闭合的阈值，没有任何依据判断作者是否知道这些阈值。第四，第 12 节的"$8$ 倍分离配 $64$"反事实：只在第 10.3 节列出的代入点上验证过，未做全文核查，所以"系数可优化"这件事本身是 `[推测]`。第五，第 5.1 与 6.1 节的 $k<1+\log_{17}h$ 与路径分布是 $(k\sigma)$-spread：两条都是我的推导，tex 无对应记号，它们的作用是定量说明第二个 log 的来源，进不了正文任何一个证明。第六，第 8.2 节我一度怀疑极大化的 $S$ 可能为空、从而嵌套在第 $0$ 步退化成 $H_1=\varnothing$；`graphs.tex:60` 的 $r=\lvert S\rvert>0$ 应当是在声明这事不会发生，但 tex 没给对应的下界计算，我按 $h_I\le17$ 试了 $h_I=1$ 与 $h_I=17$ 两个边界都算不出 $R_\sigma(I,S)>1$，认定是我自己的算法太粗，此处信息不足，结论正确性我完全交给 `graphs.tex:72` 与 `graphs.tex:74-79` 的原文，不另加主张。第七，$\min\{1,\cdot\}$ 何时真正生效，我在第 11 节只做了量级估算（$n\gtrsim10^{13}$），tex 未讨论，属自算。第八，`Main.lean:56-62` 的取证缺口见第 15 节。第九，`logTwo` 与 `Real.logb 2` 在 `Main.lean:40-42` 的混用是否被某条引理显式调和，我没读到 `treeSamplingParameter_le_graphParameter` 的证明体，见第 15 节。

还有两件我打算下一步做、这次没做完的事。一件是把 `trees.tex:29-46` 的定理陈述与 `graphs.tex:39-48` 的引理陈述逐条比对，确认 $\sigma=128q$、$k\ge1$、$\ell_1\ge1$ 这三处在 Lean 侧由 `exists_spread_orbit_tree` 的返回结构一次性给出：`Main.lean:35-37` 的 `obtain` 绑出了 `hk`、`hdisjoint`、`hcapacity`、`hspread`、`hpositive`、`hgrowth`、`hlast`、`hpath` 八项，我猜 `hgrowth` 与 `hlast` 是分离与末层界，未核。另一件是把第 12 节流水里 $\mathrm e^{50}$ 的最小可接受值真正跑完整：把 `resampling.tex:63-64` 的 $\mathrm e^{-\alpha}$ 记作参数，`resampling.tex:116-117` 要求 $\alpha/2>10+\log2$，`trees.tex:147-148` 又把 $\alpha$ 传成 $8$ 与 $12$，这条链我只做到前一半，因为它只影响常数、不影响 $1+\log_2 h$ 的形状，而后者才是我要保住的东西。






