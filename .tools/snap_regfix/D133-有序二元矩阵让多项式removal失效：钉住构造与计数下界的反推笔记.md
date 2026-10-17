# D133 有序二元矩阵让多项式 removal 失效：钉住构造与计数下界的反推笔记

队列行 97，论文题 *Polynomial removal fails for ordered binary matrices*，署名 OpenAI，日期 2026-09-25。正文唯一来源是
`preprints/Polynomial-removal-fails-for-ordered-binary-matrices-September-25-2026/build/`，布局为 `build/paper.tex` 加
`build/sections/*.tex`，共 8 个 `.tex`、合计 39,620 B。我按 `paper.tex` 的实际 `\input` 顺序读，这个顺序和文件名前缀对不上，
本身就是第一条线索（见第 1 节第 (c) 段与第 20 节）。

## 0 我最初押注的方向

写这篇笔记的时候，我手里已经有一个 $66\times 66$ 的固定 pattern 和一列 $n_h\times n_h$ 的 host，我的目标只是把
"多项式界成立"这个信念推进成一个可证的东西，或者把它撞碎。撞碎它的是我自己列的第一批极端例子。

我的出发点是一份很朴素的信念：既然有序情形只有有限多个 forbidden pattern，而每一个 pattern 的拷贝密度一旦被正距离压住，
那么压制函数应该来自某次有限的正则性分解，分解的层数是 $H$ 的函数，于是形状必然是 $\epsilon^{-C_H}$。
Alon--Fischer--Newman 在忽略行列序的版本里确实给出了多项式查询数的检测器，我把这条经验直接当成了定理。

我把这个信念写成 paper 里的正式陈述。逐字引用 `sections/01-introduction.tex:24-26`：

> The polynomial ordered binary matrix-removal conjecture asserts that for each fixed $H$ there are constants $c_H,C_H>0$ such that, for every
> integer $n\ge1$, every $0<\epsilon<1$, and every binary $n\times n$ matrix $A$,

同一段下面的显示式我按原文重排成 `$N_H(A)\ge c_H\epsilon^{C_H}n^{2k}$`，条件是 `$\operatorname{dist}_H(A)\ge\epsilon$`。
四个量词的次序我要盯住：$c_H,C_H$ 只许依赖 $H$，$n$ 与 $\epsilon$ 全自由。这意味着反例只需一个 $H$ 与一条趋于无穷的深度序列。
于是我的第一个动作就是把 $H$ 的大小钉死成一个具体数字，好让后面所有常数都能被机械核算。
`sections/01-introduction.tex:31` 逐字：

> We disprove this conjecture with an explicit pattern of size $66$.

这一句在我最初的计划里本应是"我们证明 $66$ 够用"，最终变成"我们只需要一个 $66$"。差别是整个证明的性质。

## 1 把陈述拆成四个可攻击的零件

我把 paper 的语言拆成四个零件，逐个写下它们在 Lean 里的对应物，因为一个陈述如果没法被机器原样写出，它多半藏了歧义。

零件一是"有序拷贝"。逐字引用 `sections/01-introduction.tex:5-8`：

> For a fixed binary $k\times k$ matrix $H$, an \emph{ordered copy} of $H$ in a binary $n\times n$ matrix $A$ is a choice

紧接着的显示式是 `$r_1<\cdots<r_k,\qquad c_1<\cdots<c_k$`，再由 `sections/01-introduction.tex:10-11` 给出匹配条件
`$A(r_i,c_j)=H(i,j)$ for every $i,j\in[k]$`，那里还补了一句 `$[k]=\{1,\ldots,k\}$`。逐字引用 `sections/01-introduction.tex:11-12`：

> Thus a copy matches the zeros as well as the ones, and the row and column choices are independent.

这两句是全部难点的来源。"matches the zeros as well as the ones" 是 induced 语义；
"the row and column choices are independent" 把有序图的单一顶点序劈成两条独立序。
`sections/01-introduction.tex:76-78` 专门把后者和 Gishboliner--Tomon 的分类划清界限，逐字：

> The polynomial induced removal classification for ordered graphs of Gishboliner and Tomon~\cite[Theorem~1.1]{GishbolinerTomon2022} concerns a
> different model, with a single vertex order and symmetric adjacency.

零件二是 $N_H(A)$ 与 $H$-free，逐字引用 `sections/01-introduction.tex:12-13`：

> Write $N_H(A)$ for the number of such copies and call $A$ \emph{$H$-free} if $N_H(A)=0$.

零件三是距离。逐字引用 `sections/01-introduction.tex:20-21`：

> where the minimum is over binary $n\times n$ matrices. Every cell may be changed, in either direction.

`in either direction` 这六个字是我一开始最不喜欢、最后最感激的一句。$0\to1$ 与 $1\to0$ 都合法，意味着修复一次编辑可能凭空造出新的拷贝。

零件四是归一化，`sections/01-introduction.tex:16-18` 给出显示式，我按原文排成
`$\operatorname{dist}_H(A)=\frac1{n^2}\min_{B\text{ is }H\text{-free}}|\{(r,c)\in[n]^2:A(r,c)\ne B(r,c)\}|$`。
分母是 $n^2$，是"格子数"，与行、列两条轴对称；这个分母选择决定了后面 $m^2/n^2=d_h^{-2}$ 一步没有任何余地。

Lean 侧四个零件我都在 `Model.lean` 里找到了原样对应：`BinaryMatrix n := Fin n → Fin n → Bool`、
`IncreasingMap k n := {f : Fin k → Fin n // StrictMono f}`、`orderedCopies` 用
`∀ i j, A ((rc.1).val i) ((rc.2).val j) = H i j` 做 filter，`copyCount` 取 `Finset.card`，`HFree` 写成 `copyCount H A = 0`，
`hammingDistance` 是 `A rc.1 rc.2 ≠ B rc.1 rc.2` 的 `Finset.filter .card`。值得单独一提的是 `fixedMinEdits`：
它把 $\min$ 实现为 `Finset.univ.image (fun B => if HFree fixedH B then hammingDistance A B else n * n + 1).min'`。
那个 $n^2+1$ 是哨兵值，作用是保证不可行候选永不当选，因为真距离的上界恰好是 $n^2$。
纸面公式里没有这个哨兵，Lean 必须补，否则 `min'` 的非空性证明 (`by simp`) 与"最小值真的是距离"这两件事会搅在一起。

## 2 我撞的第一面墙：order-free 的正则性直觉

我的第一条错误路线是把无序情形的 machinery 原样搬来。设想的剧本是这样：host 里拷贝密度小，先把行列两条轴各做若干次等分，
得到一个粗粒度分块，然后用正则性引理说"绝大多数块对是伪随机的"，再用计数引理给出拷贝。这条路在 binary 与 induced 语义下会死两次。

死法之一：二元伪随机性极强。`sections/02-construction.tex:186-194` 的赋值表把变元位置之间几乎所有入口都定成阈值判断，
一个 $m\times m$ 的块对里的入口值完全由该对所属的两个类决定；换言之分块本身就是模型的一部分，
随机性无处可住。想在这样的结构上做正则性分解，等于对着自己的构造声明它不存在。

死法之二：也是 paper 明确记录的既有事实。逐字引用 `sections/01-introduction.tex:73-75`：

> Polynomial bounds also hold for finite families closed under row permutations, or under column permutations by transposition~\cite[Theorem~1.5]{AlonBenEliezer2020}.

这句话给我的错误路线判了刑：多项式界在"对置换封闭"的那一类里是定理。
我的 pattern 恰恰在最不闭的一格里，即 $P=\begin{pmatrix}1&0\\1&1\end{pmatrix}$ 的行置换与列置换都逃出它自己生成的族。
我在草稿纸上写过"也许可以取正规闭包然后宣称闭包有限"，这一步是假的：闭包会把 $P$ 的两个置换版都拉进来，
而每一个置换版都会解锁一条独立的传播方向，反例反而更强。paper 没写这个尝试，我把它记下来，因为它是"为什么必须固定 $P$ 而不许对称化"的最直接理由。

第三条相关死法来自 `sections/01-introduction.tex:80-86`，逐字：

> Nonpolynomial lower bounds were already known for ternary hosts: Fischer and Rozenberg obtained them for a fixed two-symbol $2\times2$ pattern, with row and column order ignored~\cite{FischerRozenberg2007}.

我最初打算直接借用 Fischer--Rozenberg 的三符号 host，只加一条"把第三符号用 $0,1$ 编码"的翻译。
逐字引用 `sections/01-introduction.tex:86`：

> symbol in the host matrix; our construction uses only $0$ and $1$.

编码一步过不去。原因我现在能讲清楚：三符号构造里的"第三符号"承担的是 *wildcard* 语义，
即"这一格对 $H$ 的贡献可自由选择"；induced 语义禁止 wildcard，每一格都必须与 pattern 的对应入口相等，
于是把 wildcard 拆成两个符号一定会在某一侧造出真的拷贝或真的破坏。这个观察直接把我推向 paper 的第二个既有结果，
即 `sections/01-introduction.tex:88-91`，逐字：

> A particularly relevant positive result is the polynomial lower bound for matrices containing many entry-disjoint copies of a fixed

这里 "pattern~\cite[Theorem~1.2]{AlonBenEliezer2020}. It yields a small set of cells meeting all existing copies when the copy density is small." 是同一句的后半。

## 3 我撞的第二面墙：把命中集当成修复集

顺着上一条线索，我写下了一个自认为很自然的引理："存在一个小格子集合与所有现有拷贝相交，把它全部翻转，host 就变成 $H$-free。"
前半句在 entry-disjoint 情形是定理，后半句是我加的，而它彻底错。

错在翻转会造成新拷贝，并且造成的新拷贝与旧拷贝可以完全不相交。paper 把这件事放在一条 remark 里，逐字引用
`sections/03b-count.tex:73-74`：

> Changing the $m$ entries of $\mathcal L_h$ from $1$ to $0$ destroys every original copy, but creates new ones.

`but creates new ones` 是我那条错误路线的死刑判决书。判决的执行细节在 `sections/03b-count.tex:74-81`，逐字：

> Indeed, fix a leaf index $p$ and put $d=p\bmod 2$. In mode $W_{h,d}^+$, choose the leaf row in $R_h^+(p)$ and any dummy row. Choose, in this order, a column in $C_{h-1}^+(\pi(p))$ and the leaf column in $C_h^+(p)$. These rows and columns have the required order. Their body is now

显示式按原文是 `$\begin{pmatrix}1&0\\1&1\end{pmatrix}:$`。再逐字引用 `sections/03b-count.tex:82-84`：

> the upper-left entry is the unchanged parent--child entry, the upper-right entry is the changed leaf diagonal, and the lower entries are dummy incidences.

这段读三遍才能体会它狠在哪里：新拷贝的身体里，被我改动的那一格恰好是 $P$ 里必须为 $0$ 的那一格，
而改动把它从 $1$ 变成 $0$，也就是改动 *促成* 了 $P$。翻转一条对角线，等于把旧拷贝的命脉剪断、同时给新拷贝铺好轨道。
我原先的计划里"命中集大小 $\Rightarrow$ 修复集大小"这一步没有任何补救余地，因为两个集合可以同阶而完全不相交。

paper 把这条裂缝写成一句对照，逐字引用 `sections/01-introduction.tex:92-94`：

> Changing those cells can create new copies. Our construction makes this distinction explicit: all original copies meet a set of $2^h$ cells, while any binary repair changes at least $4^h$ cells.

$2^h$ 与 $4^h$ 是两个不同的量级，这个比值 $2^h$ 就是我这条错误路线能造成的损失上限，也是我必须放弃它的原因。

## 4 我撞的第三面墙：按类抽样的损失

错误路线二让我确信距离必须用概率语言下界，于是我先试的是"按类抽样"：把每条轴分成若干大小 $m$ 的类，
独立地以某概率选类、再在类内选点。这条路我算过一次就废了，因为损失挂在类数上。

关键的账是这样的。逐字引用 `sections/01-introduction.tex:119-123`：

> positions, whose entries against the tree positions are all $1$ in the original host. Each axis is partitioned into classes of equal size $m=2^h$. For every cell needed to keep the sampled anchors, dummy incidences and root values unchanged, its row and column are selected with probability $m^{-2}$. Summing over the actual edited cells

后面还有 `sections/01-introduction.tex:124-127`，逐字：

> shows that fewer than $m^2$ changes leave a suitable selection. All other entries may have changed; avoidance of $H$ itself forces the contradictory propagation in the edited matrix. This cellwise sampling argument avoids a loss depending on the number of classes and gives the inverse-square distance in Theorem~\ref{thm:main}.

`avoids a loss depending on the number of classes` 这十二个单词记录了被禁的那条路线。
类数是多少？`sections/02-construction.tex:155-157` 逐字：

> There are $6hs$ anchor groups on each axis. The variable positions form $2h+1$ disjoint sets of size $m$: two signs at each depth below $h$, and one set of leaves.

一条轴上的类数是 $6hs+2h+1=384h+2h+1=386h+1$，加上 dummy 组凑成 `sections/02-construction.tex:160` 的
`$n=d_hm,\qquad d_h=6hs+2h+2=386h+2$`。按类抽样时，"某一类被选中"的概率是 $1$，
"某个具体格子被选中"的概率就退化成"该类被抽中且类内该位置被抽中"，两步相乘会在分母上再乘一个类数，
于是 $m^{-2}$ 变成 $m^{-2}d_h^{-1}$ 量级，距离下界从 $d_h^{-2}$ 掉到 $d_h^{-3}$ 甚至更糟。
逐格 (`cellwise`) 抽样的好处正是：每个格子只在自己的类里被选一次，`sections/04-distance.tex:60-61` 逐字：

> There is only one choice in each size-$m$ class, so each cell occurs in this calculation once.

这一句是我全部三次尝试里唯一一句"如果删掉就整条断掉"的句子。它也解释了为什么 Lean 侧要另起一套纯计数的抽样机器
（第 22 节）。

## 5 三次撞墙之后剩下的硬约束

把上面三条错误路线的残骸排成一列，我手里剩下的约束非常少，我把它们逐条列出来，因为它们就是最终构造的骨架：

- 语义限制：拷贝必须匹配 $0$。任何"跳过某格"的设计都不合法，因此每一格入口都得能被 $A$ 与 $B$ 分别算出。
- 修复限制：允许双向改动，因此任何"翻掉一批格子"的论证必须证明改动不会造出新拷贝；
  第 3 节的 remark 说这件事在结构上做不到，于是必须走"拷贝必然存在"的正向论证。
- 计数限制：距离下界必须来自逐格抽样，类数只能出现在 $d_h$ 这个线性因子里，不许进入指数的分母。
- 组合限制：矛盾必须在有限步内出现，因此需要一个能沿结构单向传递的信息；paper 用的信息是一位比特。
- 尺寸限制：模式数、锚组数与类数都要写成 $h$ 的线性函数，否则 $n=d_hm$ 这一步会多出一层指数。

第五个约束最不起眼，却直接决定 $s=64$。逐字引用 `sections/02-construction.tex:155-160` 那三行里的最后一行：

> n=d_hm,\qquad d_h=6hs+2h+2=386h+2.

$d_h$ 要恰好等于 $386h+2$，就要 $6hs+2h+2=386h+2$，即 $6s+2=386$，$s=64$ 唯一确定。
$s$ 一旦定为 $64$，$\eta$ 的位数 $5$ 与替换块行数 $32$ 都由第 6 节的两条边界推出来。
所以 $66$ 这个数没有审美成分：它是"距离指数正好是 $-2$"与"类数是 $h$ 的线性函数"两条约束联立的解。

## 6 锚 $S$：位数 $5$、行数 $32$ 与那五个全字

`sections/02-construction.tex:11-14` 逐字：

> Set $s=64$.  For $0\le a<32$ and $1\le b\le5$, let

显示式按原文排成 `$\eta_b(a)=\left\lfloor a/2^{5-b}\right\rfloor\bmod 2$`，然后
`sections/02-construction.tex:15-16` 逐字：

> so $(\eta_1(a),\ldots,\eta_5(a))$ lists the five-bit words in lexicographic order.  Define $S\in\{0,1\}^{[s]\times[s]}$ by

替换式按原文是 `$S(u,v)=\eta_{v-59}(u-33)$` 在 `$33\le u\le64,\ 60\le v\le64$` 时取，
否则取 `$\mathbf 1[u\ne v]$`。逐字引用 `sections/02-construction.tex:38`：

> We call $S$ the \emph{anchor} and $P$ the \emph{body} of $H$.

三个数字的机械理由如下。$b$ 的上界 $5$ 与 $a$ 的上界 $32$ 联立给出 $2^5=32$ 个互不相同的五位字，
所以 $S$ 的第 $60$ 到 $64$ 列、第 $33$ 到 $64$ 行这块 $32\times 5$ 区域是"所有五位字逐行列出"。
这个区域的列宽被定成 $5$，直接对应 `sections/03-pinning.tex:73-76` 那条打不碎的引理里的"五列"。
行高被定成 $32$，因为需要 $\sum_{j=0}^{3}\binom{5}{j}=26<32$ 这个不等号有 $6$ 的余量（第 13 节算这笔账）。
索引偏移 $u-33$、$v-59$ 只是把 $33\le u$、$60\le v$ 翻译成 $0\le a<32$、$1\le b\le5$。
Lean 侧 `Model.lean` 的 `anchor64` 把同一件事用 0-基写下：
判断条件是 `32 ≤ u.val ∧ 59 ≤ v.val`，取值是 `etaBit (u.val - 32) (v.val - 58)`，
其中 `etaBit a b := decide (((a / (2 ^ (5 - b))) % 2) = 1)`。
两个偏移 $32$ 与 $58$ 与纸面的 $33$、$59$ 恰好差 $1$，`1 ≤ b ≤ 5` 变成 `0 ≤ v.val-58 ≤ 4`。
这条 0-基/1-基翻译是全模块最容易写错的地方，我在第 23 节记它的爆炸半径。

## 7 模式表 $T$：六行数组的每个格子都要给理由

`sections/02-construction.tex:117-120` 逐字：

> To specify which rows and columns have these roles, define a set $T$ of $6h$ indices, called \emph{modes}. Each mode specifies two row sets and two column sets as follows, where $1\le i\le h$ and $d\in\{0,1\}$:

表格按原文四列排：

$V_i^+$ 配 $\mathsf R_1=R_i^+,\ \mathsf R_2=R_{i-1}^+,\ \mathsf C_1=C_*,\ \mathsf C_2=C_{i-1}^+$；
$V_i^-$ 配 $R_{i-1}^-,\ R_i^-,\ C_*,\ C_{i-1}^-$；
$W_{i,0}^+$ 配 $R_{i,0}^+,\ R_*,\ C_{i-1}^+,\ C_{i,0}^+$；
$W_{i,1}^+$ 配 $R_{i,1}^+,\ R_*,\ C_{i-1}^+,\ C_{i,1}^+$；
$W_{i,0}^-$ 配 $R_{i,0}^-,\ R_*,\ C_{i,0}^-,\ C_{i-1}^-$；
$W_{i,1}^-$ 配 $R_{i,1}^-,\ R_*,\ C_{i,1}^-,\ C_{i-1}^-$。

逐字引用 `sections/02-construction.tex:131-133`：

> The $V$ modes pair consecutive row levels with a dummy column; the $W$ modes pair consecutive column levels with a dummy row and fix the child parity.

这张表是我反推时花最多时间的地方，因为它每一格都是被迫写下的。四个理由：

1. 每行必须有恰好两个行集与两个列集：$P$ 只有两行两列，身体需要两个行位置与两个列位置。
2. 两个 $\mathsf R_j$ 必须不相交，两个 $\mathsf C_j$ 必须不相交。逐字引用 `sections/02-construction.tex:134-135`：
   "For each $t$, its two row sets are disjoint and its two column sets are disjoint."
   不相交是赋值规则二能成立的前提，见 `sections/02-construction.tex:179-180`：
   "The disjointness of the two role sets makes both instructions unambiguous."
3. $V$ 行的两个列集必须含 $C_*$：传播要靠 dummy 列供给 $P$ 的左列两个 $1$。
   逐字引用 `sections/04-distance.tex:110-111`："The dummy incidences supply the left column of ones."
   $W$ 行的两个行集必须含 $R_*$，理由对称，见 `sections/04-distance.tex:129`：
   "Here the bottom rows are unchanged dummy incidences."
4. $W$ 行要带奇偶 $d$：`sections/03b-count.tex:50-51` 用到 "$p\equiv q\equiv d\pmod 2$" 才能把 $\pi(p)\le b\le\pi(q)$
   强化成 $p\le q$。去掉奇偶限定，这一步只剩 $\pi$ 层面的信息，拷贝计数会乘上一个 $2$ 的因子而泄漏。

关于第 4 点我要多留一句。$R_{i,d}^\sigma$ 的定义在 `sections/02-construction.tex:61-63`，逐字：

> For $1\le i\le h$ and $d\in\{0,1\}$, the sets $R_{i,d}^\sigma,C_{i,d}^\sigma$ are the corresponding unions restricted to node indices $p\equiv d\pmod2$.

$V$ 行不带 $d$ 而 $W$ 行带 $d$ 的不对称，是从传播方向读出来的：$V$ 传播的是"行侧"的值，
它的两个行位置分别在 $R_i^\sigma$ 与 $R_{i-1}^\sigma$，父子关系已经由 $\pi$ 定死；
$W$ 传播的是"列侧"的值，两个列位置分别在 $C_{i-1}^\sigma$ 与 $C_{i,d}^\sigma$，父索引与子索引之间差一个因子 $2$，
必须靠奇偶把 $2$ 补回去。$6h$ 这个数因此是 $2\cdot h+4\cdot h$，两项分别归 $V$ 与 $W$。

模式的排序也被写进定义。逐字引用 `sections/02-construction.tex:141-142`：

> Fix the order of modes by increasing $i$, with the six modes at depth $i$ ordered as

后面的显示式按原文是 `$V_i^+,\ V_i^-,\ W_{i,0}^+,\ W_{i,1}^+,\ W_{i,0}^-,\ W_{i,1}^-$`。
Lean 把这条次序压成了一个算术编码：`Host.lean:21-22` 的 `level t := t.val / 6 + 1` 与 `kind t := t.val % 6`，
`Mode (h) := Fin (6 * h)` 在 `Host.lean:16`。纸面的六项列表在这里变成 $0$ 到 $5$ 的余数，
`Host.lean:97` 的 `kind_lt` 提供 `kind t < 6`。

## 8 树的递归序与反号：四条等价式的机械推导

`sections/02-construction.tex:42-46` 逐字：

> Fix $h\ge1$ and put $m=2^h$.  At depth $i$ the full binary tree has nodes indexed by $p\in\{0,\ldots,2^i-1\}$, with children $2p,2p+1$. For $0\le i<h$, each node has two disjoint row blocks $R_i^-(p),R_i^+(p)$ and two disjoint column blocks $C_i^-(p),C_i^+(p)$, each of size $m/2^i$.

块的尺寸 $m/2^i$ 与节点数 $2^i$ 相乘恒为 $m$，所以每层的每个符号并起来都是大小 $m$ 的一类。
这条恒等式支撑了 `sections/04-distance.tex:49-52` 那段均匀性核算，我把它单独写出来，因为它是 $m^{-2}$ 的全部来源。

叶子上两个符号同名，逐字引用 `sections/02-construction.tex:47-50`：

> At depth $h$ it has one row block and one column block of size $1$; we give each of these two names:

显示式按原文是 `$R_h^-(p)=R_h^+(p),\qquad C_h^-(p)=C_h^+(p)$`。下一句是整套构造里我最看重的一句限定，
逐字引用 `sections/02-construction.tex:52-54`：

> Apart from these named equalities, all row blocks are disjoint, and all column blocks are disjoint.  Their positions are called \emph{variable} positions.

`Apart from these named equalities` 是矛盾发生的位置本身：叶子上 $x_h^+=x_h^-$、$y_h^+=y_h^-$，
于是第 11 节末段的两个断言落在同一格。这个设计如果只写成"叶子只有一份"，
赋值表里 $\mathbf 1[p\le q]$ 与 $\mathbf 1[p<q]$ 的分裂就会无处安放，见 `sections/02-construction.tex:197-202`。

序的定义在 `sections/02-construction.tex:67-73`，逐字（前四行）：

> Order the variable rows recursively.  At an internal node, place its minus block, then its two subtrees in child order $0,1$, and then its plus block.  At a leaf place its single block once.  Order variable columns by the same recursion with the signs reversed: the plus block comes before the subtrees and the minus block after them.

最后半句 `the plus block comes before the subtrees and the minus block after them` 与行的
`place its minus block, then its two subtrees ... and then its plus block` 严格反号。
为什么要反号，我在第 9 节给出唯一可用的答案：$P$ 的四个入口要同时被"行方向"与"列方向"各解锁一半，
两条轴的序若同号，其中一条轴的传播会永远推不动。

四条等价式在 `sections/02-construction.tex:80-92` 的 `eq:tree-orders`。我把它们逐条抄成行内式：

- `$R_i^+(p)<R_{i-1}^+(a)\iff \pi(p)\le a$`
- `$R_{i-1}^-(a)<R_i^-(p)\iff \pi(p)\ge a$`
- `$C_{i-1}^+(b)<C_i^+(q)\iff \pi(q)\ge b$`
- `$C_i^-(q)<C_{i-1}^-(b)\iff \pi(q)\le b$`

证明只有一句，逐字引用 `sections/02-construction.tex:93-96`：

> Indeed, the subtrees rooted at depth $i-1$ occur consecutively in increasing node order.  A child block lies between the two blocks of its own parent, including when that child is a leaf.  Comparing its parent index with $a$ or $b$ proves all four equivalences.

`including when that child is a leaf` 这六个字里藏着一条必须单独证的边界情形。
我把四条等价式自己重推一遍，用的完全是"子树按节点序连续排布"这一件事：
以第一条为例，深度 $i-1$ 的节点 $a$ 的两棵子树（$2a$ 与 $2a+1$）排在 $R_{i-1}^+(a)$ 之前，
而 $R_{i-1}^-(a)$ 排在最前，所以 $R_i^+(p)$ 落在 $R_{i-1}^+(a)$ 之前 $\iff p$ 是 $\le 2a+1$ 的某个孩子
$\iff \pi(p)\le a$。第二条同理，minus 块在父节点最末，于是 $\pi(p)\ge a$。
列侧把 minus/plus 的位置互换，两个不等号方向同时翻转，得到第三、四条。
Lean 里这四条被拆成 `TreePositions.lean:177`、`:199`、`:221`、`:243` 四个单向引理，
并在 `OrderedHost.lean:139`、`:147`、`:155`、`:163` 重新以 `Position` 层面表述。
拆成单向是因为 Lean 要用来的是单向蕴含，等价式的另一半在机器证明里是浪费。

序的机器实现比纸面递归硬得多。`TreePositions.lean:16` 把序键定成
`OrderKey := ℕ ×ₗ ℕ ×ₗ ℕ ×ₗ ℕ ×ₗ ℕ`，即五元字典序键；
`:18` 是 `key endpoint phase tie cls coordinate`，`:21` 是 `earlyKey depth blockSize node cls coordinate`，
`:24` 是 `lateKey remaining blockSize node cls coordinate`，`:27` 是 `leafKey h coordinate`，
`:31` 是 `orderKey (column : Bool) (h : ℕ)`，`:42-43` 用 `rowKey`/`columnKey` 把 `column` 这个 Bool 实例化。
也就是说"反号"在这套代码里是同一个 `orderKey` 函数的两个 Bool 分支，纸面上两句对称的自然语言描述
在机器侧被压缩成一个参数。五元键里 `endpoint` 记 minus/plus（内部节点时是早还是晚），
`phase` 记"父块之前/之后"，`tie` 是防碰撞的保险位，`cls` 记类，`coordinate` 记类内坐标。
`orderKey_injective`（`:62`）保证键唯一，`:73` 用它造出 `positionOrder`。
`key_lt_iff_endpoint_le_of_tie_lt`（`:84`）则是那条"比较父索引"的机器版本。
`leafKey_lt_lateKey_parent`（`:109`）与 `earlyKey_parent_lt_leafKey`（`:114`）两个引理
正是纸面 `including when that child is a leaf` 的实现。

## 9 关键转折：$P$ 是一把只能单向转的锁

转折发生在我把 `sections/02-construction.tex:101-109` 那两句"初等限制"抄到纸上之后。逐字（前两句）：

> Two elementary restrictions explain the body roles we use. For binary values $a,b$,

两个显示式按原文排成 `$\begin{pmatrix}1&a\\1&b\end{pmatrix}\ne P\iff b\le a$` 与
`$\begin{pmatrix}a&b\\1&1\end{pmatrix}\ne P\iff a\le b$`。第三句 `sections/02-construction.tex:110-112`：

> We will supply the fixed ones with a dummy column in the first array and a dummy row in the second. The first restriction passes a value between consecutive row levels; the second passes it between consecutive column levels.

最后一句是整篇论文的发动机，逐字引用 `sections/02-construction.tex:113-115`：

> In either inequality, knowing that the smaller entry is $1$ forces the larger entry to be $1$, while knowing that the larger entry is $0$ forces the smaller entry to be $0$.

我要把这里的方向性拆干净，因为它决定 $6h$ 个模式为什么非有不可。第一个数组的两个自由格是 $(1,2)$ 位的 $a$ 与 $(2,2)$ 位的 $b$。
若 $b>a$，则 $(a,b)=(0,1)$，数组是 $\begin{pmatrix}1&0\\1&1\end{pmatrix}=P$，拷贝出现。
所以 $H$-free 强制 $b\le a$：上入口 $a$ 是"大"的一侧，下入口 $b$ 是"小"的一侧，
$b\le a$ 意味着 *信息只能从小的推向大的吗*？不，恰好相反：$a=1$ 不逼出 $b=1$，而 $b=1$ 逼出 $a=1$。
让我用 paper 自己的话把这条方向钉住：知道小的那个是 $1$，就把大的那个也钉成 $1$；
知道大的那个是 $0$，就把小的那个钉成 $0$。信息因此沿"$1$ 逆流向上传、$0$ 顺流向下传"的方向走。
这正是"锁只能单向转"的意思，也是转折点的实质：我要造的东西比一个不对称的 pattern 更窄，
它是一条 *只能沿一个方向传一位比特* 的导线，导线的方向由行的序与列的序共同决定。

第二个数组完全对偶：$(a,b)=(1,0)$ 给出 $P$，所以 $H$-free 强制 $a\le b$，
$a$ 在左上是小的那一侧，$b$ 在右上是大的那一侧，同样的单向流，只是搬到了列方向。

有了这把锁，两条轴的序反号有更深的缘由，审美成分在这里退场。逐字引用 `sections/01-introduction.tex:107-113`：

> The host has rows and columns indexed by a binary tree, with a plus block and a minus block at each internal node on each axis. At each leaf, the two blocks on each axis coincide. One root entry is $1$ and the other is $0$. Avoiding $P$ in the designated bodies propagates these values down a common path, first to the next row level and then to the next column level. At the leaves the two signs share their positions, so they cannot retain opposite values.

这段是策略的完整叙述，我在第 11 节把它逐格展开成机器可核对的形式。

## 10 逐引理 I：$H$ 的显式形状与它在机器里的八行代码

(a) 原文逐字。`sections/02-construction.tex:24-25`：

> Let $e_1,e_2$ be the first two standard basis vectors of $\mathbb R^s$. The fixed pattern and its lower-right block are

`eq:pattern-definition` 的显示式按原文排成
$H=\begin{pmatrix}S&e_1&e_2\\ e_1^{\mathsf T}&1&0\\ e_2^{\mathsf T}&1&1\end{pmatrix}$，
$P=\begin{pmatrix}1&0\\1&1\end{pmatrix}$，$k=s+2=66$。
`sections/02-construction.tex:38`：

> We call $S$ the \emph{anchor} and $P$ the \emph{body} of $H$.

`sections/01-introduction.tex:33-35` 给出主定理的开头：

> There is a fixed binary $66\times66$ matrix $H$ with the following property. For every integer $h\ge1$, put

后面紧跟显示式，我按原文排成 $n_h=(386h+2)2^h,\ \epsilon_h=(386h+2)^{-2}$。

(b) 中间步骤补齐。我要把"$H$ 的下右角真是 $P$"这件事自己算一遍，否则后面所有引用 $P$ 的论证都悬空。
$H$ 的第 $65$ 行在前 $64$ 列是 $e_1^{\mathsf T}$，第 $65$ 列是 $1$，第 $66$ 列是 $0$；
第 $66$ 行在前 $64$ 列是 $e_2^{\mathsf T}$，第 $65$ 列是 $1$，第 $66$ 列是 $1$。
于是右下角的 $2\times2$ 子块按行列次序读出来是 $(1,0)$ 与 $(1,1)$，正是 $P$ ✓。
第二块要算的是 $H$ 里 $1$ 的总数，用于核对"行有 $58$ 个 $1$"那一界。$S$ 贡献 $64^2$ 格，
其中 $e_1,e_2$ 两列贡献 $1$ 与 $1$，$e_1^{\mathsf T},e_2^{\mathsf T}$ 两行贡献各 $1$，右下角再贡献 $3$。
Lean 侧这段写在 `Model.lean` 的 `fixedH` 里，它把 $66$ 拆成 `Fin 66` 并分四支：
两支走 `anchor64`，两支走 `decide ((v.val = 64 ∧ u.val = 0) ∨ (v.val = 65 ∧ u.val = 1))`（对应 $e_1,e_2$ 两列），
`decide ((u.val = 64 ∧ v.val = 0) ∨ (u.val = 65 ∧ v.val = 1))`（对应 $e_1^{\mathsf T},e_2^{\mathsf T}$ 两行），
最后一支 `decide (u.val = 65 ∨ v.val = 64)`。我把这支真值表逐格验过：
$(64,64)$ 处 $v.val=64$ 为真故取 $1$，$(64,65)$ 两处都假故取 $0$，$(65,64)$ 处 $u.val=65$ 为真故取 $1$，
$(65,65)$ 处 $u.val=65$ 为真故取 $1$，四个值 $(1,0;1,1)$ 与纸面的 $P$ 逐格相同 ✓。
这条核对很便宜，但它把"$P$ 在机器里靠一个或式实现"这件事钉住了，
`HostAnchorRigidity.lean:152` 的 `Dummy` 与 `:20` 的 `positionMode` 都建立在同一个真值表上。

(c) 常数与指数的机械理由。$s=64$ 由第 5 节的 $6s+2=386$ 唯一确定；
$k=s+2=66$ 的加 $2$ 恰好是身体需要的两行两列，加第三行会让锚与身体的关系失去单向性；
$n_h$ 的因子 $2^h=m$ 来自每条轴都是 $d_h$ 个大小 $m$ 的类，这是 `eq:matrix-size` 的直接推论；
$\epsilon_h$ 的指数 $-2$ 来自距离的分母是 $n^2$，与第 11 节的 $m^2/n^2$ 相消后只剩 $d_h^{-2}$。
$e_1,e_2$ 选标准基向量这件事没有自由度：身体的两行必须与锚的 $64$ 列有一个可识别的对应，
而"恰好一个 $1$"是唯一能同时被行方向与列方向读出的形状。

(d) 失败路线。[推测] 第一条：把身体取成 $\begin{pmatrix}1&1\\1&0\end{pmatrix}$ 或对 $P$ 施行列置换。
两条传播不等式中有一条会翻向，第 11 节的归纳会把值推回根而失去矛盾，整条链在 $V_i^+$ 那一步断。
[推测] 第二条：把 $S$ 的下右块取成 $6$ 列的 $32\times6$ 全字表。$64^2$ 的列预算立刻不够，
$d_h$ 变成 $390h+2$ 之类，更要命的是第 13 节里 $\sum_{j\le3}\binom{6}{j}=42>32$，打不碎性的余量转为负数。
[推测] 第三条：给 $H$ 附上标签或权重的辅助结构，让拷贝定义"宽松一点"。
`orderedCopies` 只接受 `Bool` 等式，任何附加结构在机器侧都要重新编码为入口值，纸面省事而机器侧多花一整层引理。

## 11 逐引理 II：Proposition（距离），把 $m^2$ 与 $d_h^{-2}$ 之间的每一步补齐

(a) 原文逐字。`sections/04-distance.tex:12-17` 是命题本体：

> Let $h\geq 1$, let $m=2^h$, and let $A=A_h$ be the matrix constructed above, of order $n=d_hm$, where $d_h=386h+2$.  Every $H$-free binary $n\times n$ matrix differs from $A$ in at least $m^2$ entries. Consequently $A$ is $d_h^{-2}$-far from being $H$-free.

`sections/04-distance.tex:20-21` 开启反证：

> Fix an arbitrary binary matrix $B$ differing from $A$ on a set $E$ of $M<m^2$ cells.  We will find a copy of $H$ in $B$.

`sections/04-distance.tex:24-26` 给出划分：

> On each axis, partition the positions into the anchor groups, the dummy group, the variable classes at levels $0,\ldots,h-1$ for each sign, and the one shared leaf class.  All these classes have size $m$.

`sections/04-distance.tex:27-28` 补一句关键限定：

> In particular, the leaf class occurs once in this partition, despite its two sign names.

`sections/04-distance.tex:30-31` 与 `:35-36` 给出抽样：

> Choose $z$ uniformly from $\{0,\ldots,m-1\}$ and put

> Thus $a_i$ indexes the ancestor at level $i$ of leaf $z$, and $\lfloor a_i/2\rfloor=a_{i-1}$.

显示式我按原文排成 $a_i=\lfloor z/2^{h-i}\rfloor\ (0\le i\le h)$。
`:41-44`：

> uniformly within their blocks, using a single shared choice on each axis at the leaf: $x_h^+=x_h^-$ and $y_h^+=y_h^-$.

`:46-47`：

> Conditional on $z$, all choices in distinct groups are independent, including choices on opposite axes.

`:49-52` 是均匀性的核算：

> Each variable choice is uniform on its size-$m$ class.  Indeed, a fixed node at depth $i$ is selected with probability $2^{-i}$, and its block has size $m/2^i$, so each position in that class is selected with probability $1/m$.

`:54-59` 给出逐格概率，显示式按原文是
$\Pr(r\text{ and }c\text{ are selected})=m^{-2}$，条件是"该格至少有一端是锚或 dummy，或两端都在根层"。
`:60-61`：

> There is only one choice in each size-$m$ class, so each cell occurs in this calculation once.

`eq:cellwise-bound` 在 `:63-66`，我按原文排成
$\Pr(\text{some selected cell of these types belongs to }E)\le |E|/m^2<1$。
`:71-72` 与 `:73-75`：

> For each mode $t$, its selected anchor positions form the matrix $S$ in $B$.

> They precede all selected non-anchor positions, and their entries to the selected positions in $\mathsf R_j(t)$ and $\mathsf C_j(t)$ are the prescribed vectors $e_j$.

`:82-84`：

> Therefore any ordered pair of selected rows in $\mathsf R_1(t),\mathsf R_2(t)$ and ordered pair of selected columns in $\mathsf C_1(t),\mathsf C_2(t)$ whose entries in $B$ form

后面是显示式 $P$，然后 `:84`：

> complete these anchors to a copy of $H$.

`:87-89` 是根值 `eq:root-bits`，按原文排成 $B(x_0^+,y_0^+)=1,\ B(x_0^-,y_0^-)=0$。
`:91-92` 是归纳目标 `eq:propagation-bits`：

> We claim that the same two equalities hold at every level:

`:96-97` 起归纳：

> Assume they hold at level $i-1$, where $1\leq i\leq h$. For $V_i^+$ use rows $x_i^+,x_{i-1}^+$ and columns $y_*,y_{i-1}^+$.  For $V_i^-$ use rows $x_{i-1}^-,x_i^-$ and columns $y_*,y_{i-1}^-$.  These are in their designated sets and in the required order because the chosen nodes are parent and child.

`:110-111`：

> The dummy incidences supply the left column of ones.  Avoiding $P$ forces

`:116`：

> To carry these values to level-$i$ columns, put $d=a_i\bmod 2$.

`:117-119`：

> For $W_{i,d}^+$ use rows $x_i^+,x_*$ and columns $y_{i-1}^+,y_i^+$; for $W_{i,d}^-$ use rows $x_i^-,x_*$ and columns $y_i^-,y_{i-1}^-$.  Again these positions have the required order and membership.

`:129-131`：

> Here the bottom rows are unchanged dummy incidences.  Avoiding $P$ forces exactly \eqref{eq:propagation-bits} at level $i$, completing the induction.

`:133-135` 与 `:136-138` 收尾：

> At level $h$, the two asserted values in \eqref{eq:propagation-bits} concern the same cell, since the leaf positions were shared.  This contradiction proves that $B$ contains $H$.

> Since every matrix with fewer than $m^2$ changes has this property and $n=d_hm$, the normalized distance is at least $m^2/n^2=d_h^{-2}$.

(b) 中间步骤补齐。我按七个缺口依次填。

缺口一：为什么每类的大小恰好是 $m$。锚组的大小是 $m$，由 `sections/02-construction.tex:151` 那句
"Each group has size $m$." 给出；dummy 组的大小是 $m$，见 `:64-65`；
第 $i$ 层某符号的类 $R_i^\sigma=\bigcup_pR_i^\sigma(p)$ 有 $2^i$ 个块、每块 $m/2^i$ 格，乘积 $m$，即 `:60` 的
"Each of these sets has size $m$."；叶子那一类有 $2^h=m$ 个大小 $1$ 的块，乘积还是 $m$。
四类来源合起来才让 `eq:cellwise-bound` 的分母是同一个 $m^2$，只要有一类的大小写成 $m/2$，
概率核算就会分裂成两个量级，$<1$ 那一步立刻失效。

缺口二：为什么 $a_i$ 是均匀分布且 $\lfloor a_i/2\rfloor=a_{i-1}$。$z$ 在 $\{0,\dots,m-1\}$ 均匀，
$a_i=\lfloor z/2^{h-i}\rfloor$ 把区间 $[0,m)$ 均分成 $2^i$ 段，每段长 $2^{h-i}=m/2^i$，所以 $a_i$ 均匀于 $\{0,\dots,2^i-1\}$。
而 $\lfloor\lfloor z/2^{h-i}\rfloor/2\rfloor=\lfloor z/2^{h-i+1}\rfloor=a_{i-1}$，这是整除的向下取整可结合律，
机器侧对应 `TreePositions.lean:198` 的 `ancestor_parent`，其假设是 `hi : i < h`，即父层关系只在内部节点处出现，
叶子层没有父。

缺口三：为什么"根层的两端"必须一起保护，而其他层不用。$V_i^\sigma$ 与 $W_{i,d}^{\pm}$ 的四次使用里，
读到的值都是 $B$ 中某一对 $(x,y)$ 的入口，而这些对除了根层的两对以外，全是靠"$B$ 必须避开 $P$"逼出来的，
与 $A$ 的原始取值无关。根层的两个值则必须从 $A$ 借来，借的前提是这两格没被改动，
故 $M$ 的预算要为它俩付概率代价。逐字引用 `sections/04-distance.tex:5-7`：

> We choose one path through the tree on each axis, with the same node indices, so that its root entries and sampled anchor and dummy incidences are unchanged. All other entries between variable positions may change freely.

`with the same node indices` 是我读漏过一次的地方：两条轴必须用同一个 $z$ 生成同一串祖先索引 $a_i$，
否则 $V_i^+$ 用到的列位置与 $W_{i,d}^+$ 用到的行位置分属不同路径，第 11 节的两段归纳就接不上。

缺口四：为什么选中一对 $(r,c)$ 的概率是 $m^{-2}$ ，并非 $m^{-1}$。$r$ 的选取与 $c$ 的选取在条件于 $z$ 时独立
（`:46-47` 的 "including choices on opposite axes"），而 $z$ 只决定类而不决定类内坐标，
故 $\Pr(r)=\Pr(c)=1/m$ 且二者独立，乘积 $m^{-2}$。两端同在根层的情形同理：$x_0^\pm$ 与 $y_0^\pm$
分属两条轴，仍独立。要提防的是两端同轴的情形，本文的论证里根本没用到，所以 $m^{-2}$ 就够了。

缺口五：为什么选出的锚在 $B$ 里仍构成 $S$。赋值规则一在 `sections/02-construction.tex:170-171`：

> Between anchor groups $\widehat R_t(u)$ and $\widehat C_{t'}(v)$, put $S(u,v)$ if $t=t'$ and put $0$ otherwise.

同一模式内的 $64\times64$ 子块因此逐格等于 $S$，而这些格子的两端都在"受保护类型"里，
$B$ 与 $A$ 在此相同。同理 `:173-178` 的规则二保证非锚行 $r\in\mathsf R_j(t)$ 对该模式 $64$ 个锚列组的取值是
$e_j^{\mathsf T}$，非锚列同理给出 $e_j$。于是 `:82-84` 那句"补成一个拷贝"是纯机械的：
$64$ 行锚给 $S$，身体两行对锚列给 $e_1^{\mathsf T},e_2^{\mathsf T}$，身体两列对锚行给 $e_1,e_2$，
身体 $2\times2$ 给 $P$，六块拼起来逐格等于 $H$。这里我特意核对了次序：所有锚位置在所有非锚位置之前
（`:147-148` 的 "Before all variable and dummy positions on each axis, place an anchor block for each mode"），
所以 $r_1<\cdots<r_{66}$ 里前 $64$ 个正好是锚。

缺口六：四次"避开 $P$"的推理各自用了哪个不等式。第一段 $V_i^+$ 用行 $x_i^+,x_{i-1}^+$、列 $y_*,y_{i-1}^+$，
身体是 $\begin{pmatrix}1&B(x_i^+,y_{i-1}^+)\\1&1\end{pmatrix}$，与第一个初等限制比对，$a=B(x_i^+,y_{i-1}^+)$、$b=1$，
$H$-free 给 $b\le a$ 即 $1\le a$，所以 $a=1$ ✓。$V_i^-$ 用行 $x_{i-1}^-,x_i^-$、列 $y_*,y_{i-1}^-$，
身体 $\begin{pmatrix}1&0\\1&B(x_i^-,y_{i-1}^-)\end{pmatrix}$，$a=0$、$b=B(\cdot)$，$b\le a$ 逼 $b=0$ ✓。
$W_{i,d}^+$ 的身体 $\begin{pmatrix}1&B(x_i^+,y_i^+)\\1&1\end{pmatrix}$ 用第二个初等限制，$a=1$、$b=B(x_i^+,y_i^+)$，
$a\le b$ 逼 $b=1$ ✓。$W_{i,d}^-$ 的身体 $\begin{pmatrix}B(x_i^-,y_i^-)&0\\1&1\end{pmatrix}$，$a=B(\cdot)$、$b=0$，
$a\le0$ 逼 $a=0$ ✓。四个方向我全部列出来，是因为 paper 只写"forces"，
读者极容易把 $V_i^-$ 与 $W_{i,d}^-$ 的 $0$ 推成 $1$ 推。

缺口七：次序为什么自动成立。$V_i^+$ 要 $x_i^+<x_{i-1}^+$，由 `eq:tree-orders` 第一条与 $\pi(a_i)=a_{i-1}\le a_{i-1}$ ✓；
$V_i^-$ 要 $x_{i-1}^-<x_i^-$，由第二条与 $\pi(a_i)=a_{i-1}\ge a_{i-1}$ ✓；
$W_{i,d}^+$ 要 $y_{i-1}^+<y_i^+$，由第三条与 $\pi(a_i)=a_{i-1}\ge a_{i-1}$ ✓；
$W_{i,d}^-$ 要 $y_i^-<y_{i-1}^-$，由第四条与 $\pi(a_i)\le a_{i-1}$ ✓。
列方向用 dummy 列在前，依据是 `sections/02-construction.tex:72-73` 那句 "Place $R_*$ after all variable rows and $C_*$ before all variable" 加上下一行的 "columns."，
所以 $y_*<y_{i-1}^+$ 与 $y_*<y_{i-1}^-$ 都成立；行方向 $R_*$ 在所有变元行之后，
所以 $x_i^+<x_*$、$x_i^-<x_*$ 成立。这两条"dummy 位置"的次序是 `eq:body-modes` 里把 $C_*$ 放 $\mathsf C_1$、
把 $R_*$ 放 $\mathsf R_2$ 的全部理由，位置选错一个就把整段归纳废掉。

(c) 假设、常数、指数的机械理由。$h\ge1$ 用于 $m=2^h\ge2$，否则根层与叶子层重合，
第 11 节的归纳退化为一步，$B(x_0^+,y_0^+)$ 与 $B(x_0^-,y_0^-)$ 会落在同一格的两条路上；
严格不等号 $M<m^2$ 不可改成 $M\le m^2$，因为 `eq:cellwise-bound` 只给 $\le|E|/m^2$，
取 $|E|=m^2$ 时右端 $=1$，"存在一个避开一切改动的选取"无从推出；
$|E|=M$ 的记号在 paper 里出现一次就不再使用，机器侧改用 `GuardContainment.lean:130` 的
`path_guard_frequency` 直接对频数求和；$d_h^{-2}$ 这个指数完全由"$n^2$ 归一化 $\times$ 每格概率 $m^{-2}$"决定，
把每格概率改成类概率就要多乘一个 $d_h^{-1}$，见第 4 节；根值的两个方向 $1$ 与 $0$ 各自只出现一次，
所以 $P$ 的两个初等限制都被用到，缺一个方向就只有一半传播。

机器侧对位：`OrderedRepairDistance.lean:20` 的 `hammingDistance_ge` 带假设 `hh : 1 ≤ h`，
与纸面 $h\ge1$ 同步；`CanonicalCopyBound.lean` 与它共同构成 `Main.lean:1-2` 的前两条 import。
距离链的完整入口是 `Main.lean:23-24`：

```lean
  intro B hfree
  exact OrderedHost.hammingDistance_ge hh B hfree
```

也就是纸面那句"Fix an arbitrary binary matrix $B$"在机器里变成一个被 `intro` 接住的变量，
`hfree` 对应 `sections/04-distance.tex:83-84` 的反设。

(d) 失败路线。[推测] 第一条：把归纳目标写成"整条路径上所有 $x_i^\sigma,y_i^\tau$ 的入口都不变"，
需要保护的格子数是 $\Theta(h^2)$ 量级，概率预算 $|E|/m^2$ 变成 $|E|h^2/m^2$，$M<m^2$ 的门槛被推高到 $m^2/h^2$，
距离下界随之掉一个 $h$ 因子。paper 只保护 $2h+1$ 类里被选中的格，代价恰好是 $m^{-2}$。
[推测] 第二条：把两条轴的抽样种子分开取，$z$ 与 $z'$ 独立。根值传播仍然成立，
但 $W_{i,d}$ 的奇偶 $d=a_i\bmod2$ 在两条轴上不再一致，第 17 节里 $p\equiv q\pmod2$ 那一步先在第 11 节断掉。
[推测] 第三条：用概率方法证"存在拷贝"时先对 $z$ 取期望再用 Jensen 推出某处非零，
这条路在机器侧要把 `Finset` 上的求和与实数上的极限混写，`SamplingDistance.lean` 的存在性版本
（它 import `Model` 与 `SamplingAvoidance`）说明最终选的是纯频数论证。

## 12 逐引理 III：Lemma（anchor-properties），$58$、$48$、$16$ 三个数的出处

(a) 原文逐字。`sections/03-pinning.tex:20-27`：

> The rows of $S$ are pairwise distinct, as are its columns. Every column has at most one zero in the first $32$ rows, and every row has at most one zero in the first $32$ columns. Each row has at least $58$ ones and each column has at least $48$ ones. Finally, the restrictions of rows $33,\ldots,64$ to columns $60,\ldots,64$ are the $32$ distinct binary words of length five.

证明的两段在 `:31-33` 与 `:35-37`，逐字（各取首句）：

> The replacement in the definition of $S$ does not meet the first $32$ rows or the first $59$ columns. In the first $59$ columns, each of rows $1,\ldots,59$ has its own distinguishing zero, while rows $60,\ldots,64$ consist entirely of ones. The latter five rows are distinct in the replacement block.

> Each of the first $59$ columns has exactly one zero, in its own row. The last five columns are distinct because they are distinct coordinates on the list of all binary words of length five.

`:38-43` 给出行列数的核算：

> Each has exactly $16$ zeros, all in the replacement block, so it also differs from every earlier column and has $48$ ones. The remaining assertions follow directly from the location and definition of that block.

(b) 中间步骤补齐。四个数我全部重算，因为它们后面各被消费一次。

替换块的确切形状是行 $33$ 到 $64$、列 $60$ 到 $64$，共 $32\times5$。块里 $(u,v)$ 位的值是
$\eta_{v-59}(u-33)$，即把 $a=u-33\in[0,32)$ 写成五位字后从高位到低位取第 $v-59$ 位。
$\eta_1$ 对应 $2^4$ 位、$\eta_5$ 对应 $2^0$ 位，因此列 $60$ 到 $64$ 依次是最高位到最低位，
lexicographic 次序因此成立，这正是 `sections/02-construction.tex:15-16` 那句话的内容。

行 $1$ 到 $32$：前 $59$ 列里 $\mathbf1[u\ne v]$ 给出恰好一个零（在第 $u$ 列），后 $5$ 列落在 $\mathbf1[u\ne v]$
分支上（因为 $v\ge60>32\ge u$），所以全 $1$，共 $59+5=64$ 个 $1$。
行 $33$：前 $59$ 列贡献 $58$ 个 $1$（零在第 $33$ 列），后 $5$ 列是 $\eta_b(0)=(0,0,0,0,0)$，贡献 $0$，共 $58$ ✓。
这一行是 $58$ 这个下界的取等行，所以"至少 $58$"最紧。行 $u$（$34\le u\le64$）：
前 $59$ 列贡献 $58$，后 $5$ 列贡献 $a=u-33$ 的五位汉明重量，范围 $1$ 到 $5$，
故行 $u$ 有 $59$ 到 $63$ 个 $1$，全部 $\ge58$ ✓。综合得"每行至少 $58$ 个 $1$"，且行互异：
行 $1$ 到 $59$ 各在自己的列有唯一零，行 $60$ 到 $64$ 在前 $59$ 列全 $1$，只能靠替换块区分，
而替换块里这 $5$ 行对应 $a=27,\dots,31$，即 $11011_2$ 到 $11111_2$，互异 ✓。

列 $1$ 到 $59$：零恰在自身行，其余 $63$ 格为 $1$，故有 $63$ 个 $1$。
列 $60$ 到 $64$：行 $1$ 到 $32$ 落在 $\mathbf1[u\ne v]$ 分支，全 $1$，贡献 $32$；
行 $33$ 到 $64$ 是替换块，即坐标 $\eta_b$ 在全体 $32$ 个字上的取值，一半 $1$ 一半 $0$，贡献 $16$ 个 $1$、$16$ 个零。
合计 $48$ ✓，取等在最后五列。这五个零全部位于替换块内，故前 $32$ 行里这五列没有零，
"每列在前 $32$ 行至多一个零"因此对全部 $64$ 列成立 ✓。行方向对称成立。

每列在前 $32$ 行至少有 $31$ 个 $1$：$32$ 格减去至多 $1$ 个零 ✓。这个数在第 15 节被用了两次，
一次否掉变元列，一次让两根锚列在前 $32$ 行必有公共的 $1$。

机器侧对位：`AnchorProperties.lean` 只有 4,593 B，它 import `Model`，即所有结论直接压到 `anchor64` 与 `etaBit`
的计算上；`Model.lean` 里 `anchor64` 的判断写作 `if 32 ≤ u.val ∧ 59 ≤ v.val`，与纸面"$33\le u\le64$ 且 $60\le v\le64$"
是同一段的 0-基写法。我在第 23 节把这类偏移的爆炸半径单独记。

(c) 机械理由。$58=64-6$，$6$ 是行 $33$ 失去的格数：$1$ 个对角零加 $5$ 个替换块零，
这解释了为什么行数下界取 $33$ 起始；$48=32+16$，两项分别来自 $\mathbf1[u\ne v]$ 段与全字表段；
$16=2^5/2$ 是单坐标在半数取值上的均衡；$32=2^5$ 与五位字一一对应，把 $b$ 的上界 $5$ 与 $a$ 的上界 $32$ 锁在一起；
"至多一个零"这种弱陈述足够，因为后面只用到 $32-1=31>32/2$ 这一条半密度，把界改紧不会让任何一步变容易。

(d) 失败路线。[推测] 第一条：把替换块挪到前 $32$ 行之内，让每行有一个零的密度被双重削弱，
"每列在前 $32$ 行至少 $31$ 个 $1$"退化到 $24$，第 15 节里"至多四个 $1$"就不再多于锚列密度，
变元列的排除失败，钉住引理断在 `sections/03-pinning.tex:130-132`。
[推测] 第二条：把坐标位数降到 $4$、字数降到 $16$，第 13 节的 $26$ 会涨过 $16$，打不碎性立刻消失。
[推测] 第三条：直接令 $S$ 为 Hadamard 型稠密矩阵，行列互异与密度都能满足，
但五位全字表这个"完备性"来源没了，`lem:nonanchor-traces` 与引理之间的接口（第 15 节第二段）
就失去可用的反例字，只能退回按模式穷举。

## 13 逐引理 IV：Lemma（nonanchor-traces），$26$、$27$、$32$ 的余量账

(a) 原文逐字。`sections/03-pinning.tex:73-77`：

> For any five distinct non-anchor columns of $A_h$, the non-anchor rows do not realize all $32$ binary words on those columns.

证明四段，逐字取 `:80-81`、`:85-91`、`:93-96`：

> If one of the five columns is a dummy column, its entry is one in every non-anchor row, so the conclusion is immediate. Otherwise all five columns are variable. Partition them according to their classes $C_i^\sigma$, counting the common leaf class only once.

> Within each such class, order the selected columns by node index (and arbitrarily within a node block). The entry rules for $A_h$ show that the ones of a variable row form a suffix in each class in which that row is nonzero. A non-leaf row is nonzero in at most two classes: its own level and sign, and the preceding level with the same sign. A leaf row is nonzero in at most three classes: the common leaf class and the two signs at level $h-1$.

> A class containing $a$ selected columns has at most $a$ distinct nonempty suffixes. Across all classes there are therefore at most five such suffixes. The trace of a variable row is a union of at most three of them, giving at most

显示式按原文是 $\sum_{j=0}^3\binom{5}{j}=26$，随后 `:100-101`：

> The dummy rows contribute at most one additional trace. Thus at most $27<32$ words occur.

(b) 中间步骤补齐。六个缺口。

缺口一，dummy 列的入口为什么在每一非锚行都是 $1$。赋值规则三的前半句
（`sections/02-construction.tex:182-183`）"Between non-anchor positions, put $1$ whenever the row or column is dummy."
直接给出。dummy 行也在此列，所以 dummy 行对这五列的 trace 恒为全 $1$ 字，至多一个新 trace ✓。

缺口二，"按类划分，公共叶类只数一次"。类是 $C_i^\sigma$（$i<h$，两个符号）与叶类 $C_h^+=C_h^-$。
若把叶类的两个名字各数一次，$j\le3$ 的子集数会按 $6$ 个原子重算成 $\sum_{j\le3}\binom6j=42>32$，
整条引理崩掉。`counting the common leaf class only once` 那半句是数值上唯一说得通的写法。

缺口三，"ones 构成一个后缀"的含义。在第 $i$ 层某符号类里，被选列按节点索引排序；
一个行 $R_i^+(p)$ 对 $C_i^+(q)$ 的值是 $\mathbf1[p\le q]$，为 $1$ 的列恰是索引 $\ge p$ 者，
即排序后的一段后缀；$R_i^-(p)$ 对 $C_i^-(q)$ 是 $\mathbf1[p<q]$，为 $1$ 的是索引 $>p$ 者，也是后缀。
跨层同理：$R_i^+(p)$ 对 $C_{i-1}^+(q)$ 是 $\mathbf1[\pi(p)\le q]$，$R_i^-(p)$ 对 $C_{i-1}^-(q)$ 是 $\mathbf1[\pi(p)<q]$。
注意"后缀"是对节点索引序而言，与列的全局序无关，本节的计数只关心 trace 作为 $5$ 元子集是哪一段，
所以列的类内全局次序完全不参与。这一点 paper 没写，我原先在这里绕了很久。

缺口四，"至多两个类 / 至多三个类"的穷举。非叶行 $R_i^\sigma(p)$（$i<h$）：
规则二的第一、二行让它对 $C_i^\sigma$ 可能非零，规则三的第三、四行让它对 $C_{i-1}^\sigma$ 可能非零；
对另一符号的类恒为 $0$（表里没有对应行），对其他层也为 $0$（"putting $0$ in every case absent from the table"）。
共 $2$ 类。叶行 $R_h^+(p)=R_h^-(p)$：对 $C_h^+=C_h^-$ 走 $\mathbf1[p\le q]$（规则三第一行取 $i=h$），
对 $C_{h-1}^+$ 走 $\mathbf1[\pi(p)\le q]$（第三行取 $i=h$），对 $C_{h-1}^-$ 走 $\mathbf1[\pi(p)<q]$（第四行取 $i=h$），
共 $3$ 类 ✓。这里第二行（$R_i^-$ 对 $C_i^-$，$0\le i<h$）在 $i=h$ 被排除，正是
`sections/02-construction.tex:197-198` 那句 "The first two lines ... have disjoint ranges of blocks because the second excludes the shared leaves." 的作用。

缺口五，从"$a$ 列有至多 $a$ 个非空后缀"到 $\sum_{j\le3}\binom5j$。把每个类的每个非空后缀看成一个原子，
原子总数 $=\sum_{\text{类}}a_{\text{类}}=5$。一行的 trace 是它非零的类中各取一个后缀再并起来，
非零类数 $\le3$，故 trace 是至多 $3$ 个原子的并。把"至多 $3$ 个原子的子集"当作候选，个数是
$\binom50+\binom51+\binom52+\binom53=1+5+10+10=26$ ✓；不同的子集可能并出同一个 trace，
那只让实际个数更少，方向安全。dummy 行再加至多 $1$ 个，得 $27<32$ ✓。

缺口六，为什么恰好是"五"列。上界 $26$ 里的 $5$ 来自 $b$ 的上界，即替换块的列数；
不等号 $27<32$ 的余量 $5$ 恰好等于 $32-27$。若身体需要六行六列，原子数变 $6$，
$\sum_{j\le3}\binom6j=42$，与 $2^6=64$ 比仍有 $22$ 余量，看似可行，但 $s$ 就必须重解
$6s+2=386$，$d_h$ 与 $n_h$ 的表达式全变。这个连锁我记在第 24 节。

机器侧对位：这一引理被拆成两层。抽象层在 `DirectNonshattering.lean`（12,501 B，只 import `Mathlib`），
其中有 `not_surjective_of_card`（`:44`）、`not_surjective_five`（`:75`）、`exists_missing_word`（`:87`）、
`not_surjective_of_constant_column`（`:100`）、`not_surjective_selected_columns`（`:112`）、
`matrix_missing_word`（`:216`）、`matrix_missing_word_of_class_cover`（`:248`）。
`not_surjective_of_constant_column` 对应缺口一，`matrix_missing_word_of_class_cover` 对应缺口五的"类覆盖"结构。
接口层在 `HostNonshattering.lean`（7,170 B，import `Host` 与 `DirectNonshattering`），
再往下是 `HostAnchorPinning.lean:156` 的 `actual_nonshattering`，它的参数类型是 `cs : Fin 5 → Position h`，
"五"在机器侧以 `Fin 5` 的形式被硬编进签名。

(c) 机械理由。"$\le3$ 个类"这条界来自叶行的三种非零可能，是构造给的，与 $h$ 无关；
"至多 $a$ 个非空后缀"依赖类内按节点索引排序后阈值有 $a$ 个非平凡取值，若规则三是严格不等号 $p<q$，
阈值数会少 $1$，界只会更松；$27<32$ 用掉 $5$ 的余量，允许 dummy 行的那一个额外 trace，
并把"至多"与"恰好"之间的差别吸收掉；$32$ 本身来自 $\eta$ 的位数 $5$，两处 $5$ 是同一个数，
这是本节与第 10 节之间唯一的硬耦合。

(d) 失败路线。[推测] 第一条：把 trace 的候选数按"$\prod_{\text{类}}(a_{\text{类}}+1)$"来算，
得 $\le3^5=243$，比 $32$ 大得多，引理直接证不出；原子化再加"取至多 $3$ 个"是本题唯一的省法，
我最初的草稿就写在这个错误版本上。[推测] 第二条：允许叶类按两个符号名分别计入，见缺口二，
$42>32$，打不碎性失效，`DirectNonshattering.lean:75` 的 `not_surjective_five` 就没法用纯势论证结束。
[推测] 第三条：想给"五列里有两列同类"单独设一条更紧的界以省下 $26$ 的松劲，
这条路会把类划分变成带重数的划分，`matrix_missing_word_of_class_cover` 的类覆盖假设就得重写，
收益仅是常数级的余量，代价是一整层新引理。

## 14 逐引理 V：Lemma（mode-incidences），"至多四个模式"要逐条数出来

(a) 原文逐字。`sections/03-pinning.tex:46-52` 是命题，方括号标题在 `:46` 写作
`\begin{lemma}[Incidence with the modes]`，正文如下：

> A variable position on either axis belongs to designated sets of at most four modes. Consequently, against any collection containing at most one representative of each anchor group on the opposite axis, a variable position has at most four entries equal to one.

证明的穷举清单在 `:55-59`：

> Consider a non-leaf row in $R_i^\sigma(p)$. The only possible modes are $V_i^\sigma$, $V_{i+1}^\sigma$, and $W_{i,d}^\sigma$, where $d=p\bmod2$; modes whose level is outside $1,\ldots,h$ are omitted. A leaf row belongs to $V_h^+$, $V_h^-$, and the two modes $W_{h,d}^+$, $W_{h,d}^-$. There are at most four in either case.

列侧清单在 `:61-66`：

> For a non-leaf column in $C_i^\sigma(p)$, the possible modes are $V_{i+1}^\sigma$, $W_{i+1,0}^\sigma$, $W_{i+1,1}^\sigma$, and $W_{i,d}^\sigma$, again omitting undefined levels. A leaf column belongs only to $W_{h,d}^+$ and $W_{h,d}^-$. For each participating mode, the entries to its anchor groups form one unit vector. This proves the last assertion as well.

(b) 中间步骤补齐。paper 只给了清单，没给推导，我把 $eq:body-modes$ 的八格表逐条对照一遍。
行侧：位置在 $R_i^\sigma$ 作为 $\mathsf R_1$ 出现在 $V_i^\sigma$（$+$ 号情形）与 $W_{i,d}^\sigma$；
作为 $\mathsf R_2$ 出现在 $V_{i+1}^\sigma$（$+$ 号时 $\mathsf R_2(V_{i+1}^+)=R_i^+$ ✓）与 $V_i^-$（$\mathsf R_2(V_i^-)=R_i^-$ ✓）。
把 $V$ 与 $W$ 两种符号各自对齐，非叶行的候选恰是 $\{V_i^\sigma,V_{i+1}^\sigma,W_{i,d}^\sigma\}$，三个；
$h$ 是最大层，$V_{h+1}^\sigma$ 不存在，所以 $i=h$ 只剩两个。
叶行 $R_h^+=R_h^-$：$V_h^+$（$\mathsf R_1$）、$V_h^-$（$\mathsf R_2$）、$W_{h,d}^+$、$W_{h,d}^-$（都是 $\mathsf R_1$），四个 ✓。

列侧：$C_i^\sigma$ 作为 $\mathsf C_2$ 出现在 $V_{i+1}^\sigma$（$\mathsf C_2(V_{i+1}^+)=C_i^+$ ✓）与 $W_{i+1,d}^\sigma$（$\mathsf C_2=C_{i,d}^+$）；
作为 $\mathsf C_1$ 出现在 $W_{i+1,0}^\sigma$ 与 $W_{i+1,1}^\sigma$（这两个模式的 $\mathsf C_1$ 都是整块 $C_i^\sigma$，与奇偶无关）。
这里我一开始数成三个，漏掉了"$\mathsf C_1$ 不受奇偶限制"这一条：$eq:body-modes$ 里 $W_{i,d}^+$ 的 $\mathsf C_1$ 一格写的是
$C_{i-1}^+$ 整块，只有 $\mathsf C_2$ 才带下标 $d$。正因为 $\mathsf C_1$ 不带奇偶，
同一列会被两个不同奇偶的模式同时认领，界从 $3$ 涨到 $4$。纸面那句
"$W_{i+1,0}^\sigma$, $W_{i+1,1}^\sigma$" 是四个模式里最容易被读者省掉的一对。

第二句"至多四个入口为 $1$"的化简：给定对侧一族至多每锚组一个代表，某变量位置 $x$ 对这一族的取值，
只在 $x$ 参与的那些模式的锚组上非零；对每个参与模式，$x$ 若在该模式的 $\mathsf R_j$ 或 $\mathsf C_j$ 里，
就对该模式的 $64$ 个锚组给出 $e_j$，即 $64$ 格里恰一个 $1$；不同模式的锚组彼此分开，
所以至多 $4$ 个模式贡献至多 $4$ 个 $1$。这条"贡献计数可加"依赖赋值规则一里"$t\ne t'$ 时取 $0$"，
见 `sections/02-construction.tex:170-171`。

机器侧对位：这一引理在 `ModeIncidence.lean` 里被完全抽象化，模式被重新编码成
`Mode := ℕ × Kind`（`:20`），`Kind` 是 `:15` 的 `inductive`，与 `Host.lean:16` 的 `Fin (6*h)` 是两套编码。
抽象层给出 `rowIncident`（`:27`）、`colIncident`（`:34`）、四个 `Finset` 清单
`internalRowModes`（`:43`）、`leafRowModes`（`:48`）、`internalColModes`（`:53`）、`leafColModes`（`:58`），
以及四条势界 `card_internalRowModes_le`（`:124`）、`card_leafRowModes_le`（`:131`）、
`card_internalColModes_le`（`:136`）、`card_leafColModes_le`（`:144`），再合成
`card_row_incident_le_four`（`:149`）与 `card_col_incident_le_four`（`:165`）。
最后一步 `card_ones_le_of_mode_bound`（`:181`）把"模式数 $\le4$"转成"$1$ 的个数 $\le4$"，
输出 `card_row_ones_le_four`（`:205`）与 `card_col_ones_le_four`（`:218`）。
`HostModeIncidence.lean`（7,464 B，import `Host` 与 `ModeIncidence`）负责把 `Fin (6h)` 翻译成 `ℕ × Kind`。
这套双编码说明我在纸面上随手写下的"至多四个"在机器里要付四个 `Finset` 清单加四条势界。

(c) 机械理由。"$4$"这个数是行侧 $3$ 与列侧 $4$ 的上确界，真正起作用的是列侧那条；
它必须严格小于 $31$（第 12 节的锚列密度），余量 $27$ 极宽，所以 $4$ 就算涨到 $10$ 也不影响第 15 节，
但 $4$ 本身是清单给出的精确上界，改成 $5$ 会让 `leafRowModes` 的势界证明多一条分支；
"每模式贡献一个 $1$"依赖 $e_j$ 是标准基，若身体行的锚签名有两个 $1$，
同一模式就能贡献 $2$，$4$ 会变成 $8$；"模式层级越界即略去"处理 $i=1$ 时 $V_0$ 不存在与 $i=h$ 时 $V_{h+1}$ 不存在两端，
纸面一句 `modes whose level is outside $1,\ldots,h$ are omitted` 就把边界收干净，
`Host.lean:88` 与 `:92` 的 `level_pos`（"$1\le level t$"）与 `level_le`（"$level t\le h$"）在机器侧承担同样职责。

(d) 失败路线。[推测] 第一条：把 $eq:body-modes$ 里 $W_{i,d}^+$ 的 $\mathsf C_1$ 也写成奇偶受限的 $C_{i-1,d}^+$，
模式数降到 $3$，看着更省，代价是第 11 节 $W_{i,d}^+$ 用到的列 $y_{i-1}^+$（父层，奇偶未定）不再落在 $\mathsf C_1$ 里，
传播第一步就断，钉住引理失去可用的身体。[推测] 第二条：跳过抽象层，直接在 `Host` 上穷举 $6h$ 个模式，
分支数随 $h$ 线性增长，`ModeIncidence.lean` 那四个 `Finset` 清单就得改成关于 `Fin (6*h)` 的归纳，
机器侧多一整层。[推测] 第三条：把"至多四个 $1$"直接改成"至多四个非零模式"来陈述，
省掉 `card_ones_le_of_mode_bound`，但第 15 节要比的是 $1$ 的个数与密度 $31$，
模式数与 $1$ 个数之间的这一步换算不能省。

## 15 逐引理 VI：Lemma（anchor-rigidity），三段式钉住的全部算盘

(a) 原文逐字。`sections/03-pinning.tex:106-111`，方括号标题 `:106` 是
`\begin{lemma}[Anchor rigidity]`：

> Every ordered copy of $S$ in $A_h$ uses the row and column anchor groups of a single mode $t$. On each axis it uses exactly one position from each of that mode's $64$ groups, in their prescribed order.

开头的 Twins 论证 `:114-118`：

> Fix an ordered copy of $S$. Two positions in a single anchor group have identical entries throughout $A_h$. By Lemma~\ref{lem:anchor-properties}, the copy therefore uses at most one position from any one anchor group. The same reasoning shows that it uses at most one dummy position on each axis.

二择一 `:120-126`：

> Suppose that at most $32$ selected rows and at most $32$ selected columns are anchors. Since all anchors precede all non-anchor positions, the last $32$ selected rows and the last five selected columns are non-anchor positions. Their entries give all $32$ binary words by Lemma~\ref{lem:anchor-properties}, contrary to Lemma~\ref{lem:nonanchor-traces}. Hence more than $32$ selected positions are anchors on at least one axis.

稠密分支 `:128-134`：

> Assume first that more than $32$ selected rows are anchors. In particular the first $32$ selected rows are anchors. No selected column can be variable: Lemma~\ref{lem:mode-incidences} would give at most four ones in these rows, whereas each column of $S$ has at least $31$ ones in its first $32$ rows. There are consequently at least $63$ selected anchor columns, since at most one selected column is dummy.

同模式 `:136-139`：

> Any two selected anchor columns have a common one among the first $32$ selected rows: each has at most one zero there. They must therefore belong to the same mode, because entries between anchor groups of different modes are zero. Write $t$ for this common mode.

行也归入 $t$ `:140-143`：

> Every selected anchor row also belongs to $t$. Indeed an anchor row of another mode would be zero on the at least $63$ selected anchor columns and would have at most one one in the entire copy, contradicting Lemma~\ref{lem:anchor-properties}.

排除 dummy `:145-151`：

> A selected dummy column is now impossible: its entries to the selected anchor rows of mode $t$ contain at most one one, because its entries to that mode form either a unit vector or the zero vector. This again contradicts the density of the first $32$ rows of $S$. Thus all selected columns are anchors of mode $t$. Any non-anchor row has at most one one against those columns, so every selected row must also be an anchor of $t$.

对称分支 `:153-159`：

> If instead more than $32$ selected columns are anchors, the same argument applies with the axes interchanged. All properties used after the preceding case distinction are symmetric in the axes: entries between different anchor modes are zero, the first $32$ rows and columns of $S$ each contain at most one zero in the relevant restriction, all its rows and columns have more than one one, and Lemma~\ref{lem:mode-incidences} holds on both axes.

收尾 `:161-163`：

> There are $64$ selected positions on each axis and only $64$ anchor groups in mode $t$. No group is repeated, so every group is used. Their order in the construction is their order in the copy.

本节的方法论也写在文件头，`sections/03-pinning.tex:12-15`：

> The anchor matrix $S$ has two complementary features. Its lower-right corner contains every binary word of length five. We will show that non-anchor rows cannot realize all these words on five non-anchor columns.

紧接着那句被断行的结论我按原文写作 "This will force more than $32$ positions on at least one axis of any copy to be anchors."，
再后面 `:16-18`：

> The dense first $32$ rows and columns, contrasted with the sparse variable-to-anchor incidences and the zero entries between different modes, will then force the whole copy into one mode.

(b) 中间步骤补齐。这一引理我拆成七个断点逐个补。

断点一，"同一锚组内两点全同"。取 $r,r'\in\widehat R_t(u)$。对任意列 $c$：
若 $c$ 在某锚组 $\widehat C_{t'}(v)$，赋值规则一给出 $A(r,c)=A(r',c)=S(u,v)$；
若 $c$ 非锚，规则二给出该列对 $r$ 与 $r'$ 都取同一个值（是否为 $1$ 只取决于 $c$ 落在 $\mathsf C_j(t)$ 与否）；
规则三管不到锚行。所以两行完全相同。于是若拷贝在同一锚组取两点，$S$ 就有两行相同，与
`lem:anchor-properties` 的"行互异"矛盾。dummy 位置之间也两两全同（对锚列取同一个 $e_j$ 或同一个零向量，
对非锚列取 $1$），故至多一个 dummy ✓。机器侧这一层单独成文，`HostTwins.lean`（5,214 B，import `Host`）。

断点二，为什么"后 $32$ 行"和"后 $5$ 列"这两个数字能同时用。若两条轴的锚数都 $\le32$，
则每轴至少 $32$ 个被选位置是非锚。行侧取后 $32$ 个（都是非锚，因锚在最前），列侧取后 $5$ 个（同理）。
$S$ 的第 $33$ 到 $64$ 行在后 $5$ 列上给出全部 $32$ 个五位字，这与 `lem:nonanchor-traces` 冲突 ✓。
这里"后 $32$ 行"要成立需要 $64-32=32$ 个非锚行，恰好是"锚数 $\le32$"的推论，一步不多一步不少。

断点三，$63$ 这个数。$64$ 个被选列里，变量列被 $31>4$ 否掉，dummy 至多 $1$，故锚列 $\ge63$ ✓。
若 $S$ 的列密度只是"前 $32$ 行至少 $5$ 个 $1$"，这条推理完全失效，所以 $31$ 与 $4$ 的差距是本引理的燃料。

断点四，"两根锚列必有公共的 $1$"到"同一模式"。两根锚列在前 $32$ 行各至多一个零，即各至少 $31$ 个 $1$；
$31+31=62>32$，所以存在某一行两者同时为 $1$。若两列分属不同模式 $t\ne t'$，
则规则一给出它们之间所有入口为 $0$，与这个公共的 $1$ 冲突，故两根锚列同模式 ✓。
这一步要求至少有 $2$ 根锚列，$63\ge2$ 对 $h\ge1$ 恒成立。

断点五，"锚行也归入 $t$"。取一根异模式 $u\ne t$ 的锚行 $r$：它对 $63$ 根 $t$-模式锚列全为 $0$（规则一），
而对唯一可能的另外一根异模式锚列（若存在）至多贡献 $1$；所以 $r$ 在整个拷贝里至多一个 $1$。
而 $S$ 的每行至少有 $58$ 个 $1$（`lem:anchor-properties`），"至多一个"与"至少 $58$"矛盾 ✓。
注意 paper 这里只写 "more than one one"，把 $58$ 弱化成 "$>1$"。弱化是安全的，
因为 $64$ 根锚列里已有 $63$ 根被清零，剩下 $1$ 格无论取何值都追不回密度。

断点六，"dummy 列不可能"。dummy 列对 $t$-模式锚行的取值由规则二给出：
要么某个 $e_j$（恰一个 $1$），要么零向量（$0$ 个 $1$）。而 $S$ 的前 $32$ 行每行至少 $31$ 个 $1$，
dummy 列只能再补至多 $1$，$63$ 根同模式锚列加上它仍撑不住密度 ✓。
随后"任何非锚行对那 $63$ 列至多 $1$ 个 $1$"由 `lem:mode-incidences` 的列侧版本给出
（非锚行对至多每锚组一个代表的列族至多 $4$ 个 $1$，此处更粗的界已足够），所以每个被选行都是 $t$ 的锚 ✓。

断点七，次序。$64$ 个被选位置要用满 $64$ 个组且互不重复，故是一一对应；
组的先后由构造固定，所以"拷贝里的次序"与"组的次序"同构，$S$ 的行标号 $u=1,\dots,64$
必须按组序排列。`OrderedHost.lean:74` 的 `row_anchor_strictMono` 与 `:84` 的 `column_anchor_strictMono`
承担这条机器化，`:93` 的 `row_anchor_lt_nonanchor` 则把"锚在前"写成可用的不等式。

机器侧的分工在这条链上最清楚。`HostAnchorRigidity.lean`（12,653 B，本模块最大）给位置贴模式标签：
`positionMode`（`:20`）、`positionGroup`（`:25`）、`modeLabel`（`:147`）、`Dummy`（`:152`），
再给选中集合的唯一性四条：`selected_anchor_rows_unique`（`:175`）、`:187`、`:200`、`:212`，
以及 `selected_cross_mode`（`:225`）、`selected_nonanchor_row_unit`（`:237`）、
`selected_nonanchor_column_unit`（`:252`），最后 `mode_constant_of_dense_core`（`:268`）就是断点四与断点五的合体。
`HostAnchorPinning.lean`（9,058 B）把它拼成可被消费的形态，其中 `ColumnSparse`（`:31`）与 `RowSparse`（`:37`）
是两个对称的稀疏性谓词，`mode_constant_of_prefix`（`:43`）与 `mode_constant_of_no_shattering`（`:62`）
分别对应断点二与断点四，`GroupsMonotone`（`:89`）对应断点七，
出口是 `representatives_of_mode_constant`（`:96`）、`representatives_of_no_shattering`（`:137`）、
`representatives_of_sparse`（`:172`）。我特别注意 `:137` 与 `:172` 是两条平行出口，
说明"打不碎"与"稀疏"这两条入口在开发过程中被分别打通过，纸面只保留了合成后的单一路径。
抽象层在 `AnchorPatternBridge.lean`（6,154 B）与 `AnchorPatternFixed.lean`（3,150 B），
二者共用 `namespace Problem348.AnchorBridge`（分别在 `:14` 与 `:14`），文件头 docblock 写道
"Group uniqueness and no-shattering give pinning criteria independent of the host construction."，
而 `AnchorRigidity.lean`（8,539 B，`namespace Problem348.AnchorRigidity` 在 `:12`）与
`AnchorRigidityFixed.lean`（5,681 B，同一命名空间在 `:8`）又构成本节结论的第二套编码。

(c) 机械理由。$32$ 这个阈值同时出现在三处，且三处含义不同：
$S$ 的行数下界取等行、打不碎性里的字数 $2^5$、以及"至少一根轴过半是锚"的过半线 $32=64/2$。
把 $32$ 改成 $33$ 会让断点二的"后 $32$ 行"变成"后 $31$ 行"，$S$ 的替换块就只有 $31$ 行，全字表不再完备；
改成 $31$ 会让两条轴都可能刚好不过半，二择一失去落点。$63$ 依赖"至多一个 dummy"，
而后者依赖 dummy 位置两两全同，所以这条链上 dummy 的排他性是 $63$ 的唯一支柱。
$58$ 被弱化成 "$>1$"，说明 `lem:anchor-properties` 里 $58$ 与 $48$ 两个数只服务于密度比较，
真正参与硬比较的是 $31$ 与 $4$。

(d) 失败路线。[推测] 第一条：不设 $S$ 的五列全字块，直接靠密度把拷贝逼进单一模式。
密度论证只能给出"大部分是锚"，无法排除 $32$ 行非锚的极端配置，
断点二失去反例字来源，于是 `HostAnchorPinning.lean:43` 那条出口必须换成按模式数 $6h$ 的穷举，随 $h$ 线性爆炸。
[推测] 第二条：让不同模式之间的锚组入口取 $\mathbf1[u\ne v]$ ，并非 $0$，
跨模式的"公共 $1$"不再矛盾，断点四直接失效，整个钉住段崩塌，
`HostAnchorRigidity.lean:34` 的 `host_cross_mode` 就没法陈述。[推测] 第三条：
把"锚在前"改成"锚在后"以让身体先出现，则断点一的 Twins 论证与断点七的次序都要重写，
而第 11 节的"身体补成拷贝"里 $r_1<r_2$ 的可达性依赖 $C_*$ 在最前，改动会牵连距离段。

## 16 逐引理 VII：Corollary（body-roles），签名把角色钉成一格

(a) 原文逐字。`sections/03-pinning.tex:166-173`，标题在 `:166` 写作 `\begin{corollary}[The two body roles]`：

> In every ordered copy of $H$ in $A_h$, the first $64$ rows and columns are anchor representatives of one mode $t$. Its two body rows belong respectively to $\mathsf R_1(t),\mathsf R_2(t)$, and its two body columns belong respectively to $\mathsf C_1(t),\mathsf C_2(t)$.

证明 `:176-184`：

> Apply Lemma~\ref{lem:anchor-rigidity} to the copy's prefix $S$. The two body rows must have entries $e_1^{\mathsf T}$ and $e_2^{\mathsf T}$ against these anchor columns. An anchor row of another mode gives the zero vector; an anchor row of mode $t$ gives a row of $S$, which has more than one one. Thus neither body row is an anchor. By the definition of the entries between non-anchor positions and anchor groups, the vector $e_j^{\mathsf T}$ occurs exactly on $\mathsf R_j(t)$, for $j=1,2$. The two designated sets are disjoint. The column argument is identical.

(b) 中间步骤补齐。三处要补。

第一处，"must have entries $e_1^{\mathsf T}$ and $e_2^{\mathsf T}$" 的来源是 $H$ 本身：
$eq:pattern-definition$ 里 $H$ 的第 $65$ 行前 $64$ 格是 $e_1^{\mathsf T}$、第 $66$ 行前 $64$ 格是 $e_2^{\mathsf T}$，
而前 $64$ 列已经被钉成 $t$ 模式的 $64$ 个锚组代表（按组序），所以拷贝的后两行对这 $64$ 列的 trace 必须逐格等于
$e_1^{\mathsf T}$、$e_2^{\mathsf T}$。这一步与赋值规则无关，纯粹是 $H$ 的形状规定的。

第二处，排除"身体行是锚"用了两个分支：异模式锚行给零向量（$64$ 个 $0$，$e_j^{\mathsf T}$ 需要 $1$ 个 $1$，不符）；
同模式锚行给 $S$ 的某一行，而 `lem:anchor-properties` 说每行至少 $58$ 个 $1$，远超 $e_j^{\mathsf T}$ 的 $1$ 个。
paper 这里写 "more than one one"，是 $58$ 的极弱化身，只要 $\ge2$ 就够。
非锚、非 dummy 的行（即变元行）由规则二给 $e_j^{\mathsf T}$ 或零向量，所以只有落在 $\mathsf R_j(t)$ 才给 $e_j^{\mathsf T}$，
于是角色被钉死。dummy 行的 trace 呢？规则二管所有非锚行，dummy 行也在此列，
而它不属于任何 $\mathsf R_j(t)$（$\mathsf R_j(t)$ 的取值范围是变元块与 $R_*$ 本身），所以 dummy 行给零向量，
与 $e_j^{\mathsf T}$ 不符，也被排除 ✓。这一小步 paper 略过，我把它补上，
因为它保证"至多一个 dummy 位置"的松弛不会漏出入口。

第三处，不相交的必要性。$e_1^{\mathsf T}$ 与 $e_2^{\mathsf T}$ 是两个不同的向量，
若 $\mathsf R_1(t)$ 与 $\mathsf R_2(t)$ 有交，规则二在那一格上就自相矛盾，
这正是 `sections/02-construction.tex:179-180` 那句 "The disjointness of the two role sets makes both instructions unambiguous."
要防的事。机器侧 `Host.lean:131` 的 `rowRole_disjoint` 与 `:141` 的 `colRole_disjoint` 把这条写成谓词，
`Host.lean:27` 的 `rowRole` 与 `:40` 的 `colRole` 是纸面 $\mathsf R_j(t),\mathsf C_j(t)$ 的 Lean 化身。

机器侧对位：`BodyRoles.lean`（2,901 B）把这条推论做成一个具名引理族：
`anchor64_row_ne_body_signature`（`:34`）、`anchor64_col_ne_body_signature`（`:42`）、
`zero_ne_body_signature`（`:49`）、`copy_body_row_signature`（`:55`）、`copy_body_col_signature`（`:64`）。
它的文件头 `:6` 写着 "Exact body signatures and extraction of body roles"，`:8` 写着
"All signatures refer to `fixedH`, including its zero entries."。这两句解释了 `:11` 那个奇怪的命名空间名
的语义（签名层），解释不了那个数字尾缀，我在第 23 节把它的残迹单独登记。
`BodyExtension.lean`（5,167 B，import `Model`）与 `HostRoleExtraction.lean`（6,156 B，import `Host` 与 `BodyRoles`）
把签名提升到"补成完整拷贝"的层面，后者是 `PinnedHostCopy.lean` 的上游。

(c) 机械理由。"$>1$ 个 $1$"这个界必须比签名里的 $1$ 个数（恰 $1$）严格大，
所以 $S$ 的行密度只要 $\ge2$ 就够用，$58$ 是超额供给；$j=1,2$ 的两侧对称说明
$e_1,e_2$ 的选取没有偏向，任何两个不同的标准基向量都行，但必须不同，
否则身体两行会落进同一个角色集合；"次序 $r_1<r_2$"仍留在模式的定义里
（`sections/02-construction.tex:136-139` 那句 "The order conditions remain part of this definition; the two role sets need not precede one another as entire sets."），
本推论只给出成员关系，成员关系与次序一起才等于模式条件。

(d) 失败路线。[推测] 第一条：把身体两行的签名取成 $e_1^{\mathsf T}$ 与 $e_1^{\mathsf T}$（同一角色）。
两个身体行就会落进同一个集合，第 17 节的四种模式分析里"两行的索引层次"塌成一层，
$P$ 的单向传播失去可依赖的行序，归纳断在第一步。[推测] 第二条：靠 $S$ 的密度直接区分锚行与身体行，
不引入签名概念。这条路在纸面可行，在机器侧要为每个 $u$ 单独证一行不等于 $e_j^{\mathsf T}$，
`anchor64_row_ne_body_signature` 那种 `Fin 64 → Fin 2` 的双参数穷举就变成 $64\times2$ 条引理。
[推测] 第三条：把 dummy 行的排除留给读者。若 $A$ 的 dummy 行恰好与某个 $e_j^{\mathsf T}$ 相容，
拷贝就可能把身体行放在 dummy 组，第 17 节 $V_i^\sigma$ 里 $y_*$ 与 $R_*$ 的分工立刻失配。

## 17 逐引理 VIII：Proposition（copy-count），四种模式逐一排除与 $m n^{2k-2}$

(a) 原文逐字。`sections/03b-count.tex:8-14`：

> For every integer $h\geq 1$, every ordered copy of $H$ in $A_h$ maps the pattern entry $(s+1,s+1)$ into

集合按原文排成 $\mathcal L_h=\bigcup_{p=0}^{m-1}R_h^+(p)\times C_h^+(p)$。`:15-21`：

> In particular, $|\mathcal L_h|=m$ and

`eq:copy-bound` 按原文排成 $N_H(A_h)\le m n^{2k-2}$ 与 $N_H(A_h)/n^{2k}\le 2^{-h}/d_h^2$。
方法交代在 `:4-6`：

> The body restrictions from Corollary~\ref{cor:body-roles} leave only one possible source of copies: the two signs share the same positions at the leaves.  We now locate that source at a fixed entry of the pattern.

以及 `:25-34`：

> By Corollary~\ref{cor:body-roles}, the last two rows and columns of an $H$-copy lie in the prescribed body sets of a single mode.  Their entries must form

后面是显示式 $P$，随后 `:31-34`：

> We check the four kinds of modes, using the order equivalences \eqref{eq:tree-orders} and the entry rules \eqref{eq:variable-entries}.  Write $\pi(p)=\lfloor p/2\rfloor$ for the parent index of a node.

四个模式逐一。`:36-40`：

> In mode $V_i^+$, let $p$ be the child-level row index, $a$ the parent-level row index, and $b$ the parent-level column index.  The order of the two rows gives $\pi(p)\leq a$.  The bottom-right entry of $P$ gives $a\leq b$.  Consequently $\pi(p)\leq b$, so the top-right entry is $1$, a contradiction.

`:42-45`：

> In mode $V_i^-$, use the same names for the node indices at the same levels.  The row order gives $\pi(p)\geq a$, while the top-right entry $0$ gives $a\geq b$.  Thus $\pi(p)\geq b$, and the bottom-right entry is $0$, again a contradiction.

`:47-51`：

> In mode $W_{i,d}^+$, let $p,q$ be the child-level row and column indices, and let $b$ be the parent-level column index.  The column order gives $b\leq\pi(q)$, and the top-left entry $1$ gives $\pi(p)\leq b$.  Since $p\equiv q\equiv d\pmod 2$, it follows that $p\leq q$.  The top-right entry is therefore $1$, contrary to $P$.

`:53-59`：

> Finally, in mode $W_{i,d}^-$, the column order gives $\pi(q)\leq b$, and the top-right entry $0$ gives $\pi(p)\geq b$.  The common parity implies $p\geq q$.  If $i<h$, the top-left entry is $\mathbf 1[p<q]=0$, which is impossible.  If $i=h$, that entry is instead $\mathbf 1[p\leq q]$, because the leaf blocks are shared.  It can be $1$ only when $p=q$.  This places the top-left entry of the body, namely $(s+1,s+1)$ in $H$, in $\mathcal L_h$.

计数段 `:61-68`：

> Each leaf block has size $m/2^h=1$, so $\mathcal L_h$ contains exactly $m$ cells.  For each such cell, fix the images of row $s+1$ and column $s+1$ of $H$.  There are at most $n^{k-1}$ choices for the other row indices and at most $n^{k-1}$ choices for the other column indices; requiring increasing orders and the prescribed entries can only reduce these numbers.  This proves the first inequality in \eqref{eq:copy-bound}.  Since $n=d_hm$ and $m=2^h$, division by $n^{2k}$ gives the second.

(b) 中间步骤补齐。我要先把四个身体的四格取值全列出来，纸面只写了被用到的那一格。

$V_i^+$：行 $r_1\in R_i^+$（索引 $p$）、$r_2\in R_{i-1}^+$（索引 $a$），列 $c_1\in C_*$、$c_2\in C_{i-1}^+$（索引 $b$）。
四格取值：$(r_1,c_1)=1$（dummy 列）、$(r_2,c_1)=1$（dummy 列）、$(r_1,c_2)=\mathbf1[\pi(p)\le b]$（表第三行）、
$(r_2,c_2)=\mathbf1[a\le b]$（表第一行）。$P$ 要求 $(r_2,c_2)=1$ 即 $a\le b$，要求 $(r_1,c_2)=0$ 即 $\pi(p)>b$。
行序给 $\pi(p)\le a$，三段 $\pi(p)\le a\le b$ 与 $\pi(p)>b$ 矛盾 ✓，与 paper 的写法一致。

$V_i^-$：行 $r_1\in R_{i-1}^-$（索引 $a$）、$r_2\in R_i^-$（索引 $p$），列 $c_1\in C_*$、$c_2\in C_{i-1}^-$（索引 $b$）。
四格：$(r_1,c_2)=\mathbf1[a<b]$（表第二行，$i-1<h$ 故适用），$(r_2,c_2)=\mathbf1[\pi(p)<b]$（表第四行）。
$P$ 要求 $(r_1,c_2)=0$ 即 $a\ge b$，要求 $(r_2,c_2)=1$ 即 $\pi(p)<b$；行序给 $\pi(p)\ge a$，
于是 $\pi(p)\ge a\ge b$ 与 $\pi(p)<b$ 矛盾 ✓。这里 strict 与非 strict 的差别正好落在关键一格，
纸面那句 "the bottom-right entry is $0$" 用的是 $\pi(p)\ge b$ 推 $\neg(\pi(p)<b)$ ✓。

$W_{i,d}^+$：行 $r_1\in R_{i,d}^+$（索引 $p$）、$r_2\in R_*$，列 $c_1\in C_{i-1}^+$（索引 $b$）、$c_2\in C_{i,d}^+$（索引 $q$）。
四格：$(r_1,c_1)=\mathbf1[\pi(p)\le b]$（表第三行），$(r_1,c_2)=\mathbf1[p\le q]$（表第一行），
下面一行两格都是 $1$（dummy 行）。$P$ 要 $(r_1,c_1)=1$、$(r_1,c_2)=0$；列序给 $b\le\pi(q)$。
$b\le\pi(q)$ 与 $\pi(p)\le b$ 合成 $\pi(p)\le\pi(q)$，加上 $p\equiv q\pmod2$ 得 $p\le q$
（$p,q$ 同奇偶时 $\lfloor p/2\rfloor\le\lfloor q/2\rfloor$ 等价于 $p\le q$），于是 $(r_1,c_2)=1$，矛盾 ✓。

$W_{i,d}^-$：行 $r_1\in R_{i,d}^-$（索引 $p$）、$r_2\in R_*$，列 $c_1\in C_{i,d}^-$（索引 $q$）、$c_2\in C_{i-1}^-$（索引 $b$）。
四格：$(r_1,c_1)$ 在 $i<h$ 时是表第二行的 $\mathbf1[p<q]$，在 $i=h$ 时改用表第一行（叶块共享）得 $\mathbf1[p\le q]$；
$(r_1,c_2)=\mathbf1[\pi(p)<b]$（表第四行）。$P$ 要 $(r_1,c_2)=0$ 即 $\pi(p)\ge b$，要 $(r_1,c_1)=1$；列序给 $\pi(q)\le b$。
$\pi(p)\ge b\ge\pi(q)$ 加同奇偶得 $p\ge q$。$i<h$ 时 $\mathbf1[p<q]=0$，矛盾 ✓；
$i=h$ 时 $\mathbf1[p\le q]$ 与 $p\ge q$ 同时成立只可能在 $p=q$ ✓。

这最后一步是全篇最细的地方，我把 $i=h$ 的两种表行为对照清楚：
表第二行的深度范围写作 "$0\le i<h$"（`sections/02-construction.tex:189`），表第一行是 "$0\le i\le h$"（`:188`），
所以叶对叶的入口只被第一行覆盖，值恒为 $\mathbf1[p\le q]$，与 `sections/02-construction.tex:201-202` 那句
"In particular, the entry between leaf blocks of indices $p,q$ is always $\mathbf 1[p\le q]$." 吻合。
于是 $(s+1,s+1)$（$H$ 里 $P$ 的左上格，值为 $1$）必须落在 $(R_h^+(p),C_h^+(p))$，$p$ 唯一确定，
$\mathcal L_h$ 的大小是 $m$ 个互不相同的格 ✓。

计数段我核一遍量纲：锚 $64$ 行加 $64$ 列，身体 $2$ 行加 $2$ 列，故 $k=66$、$2k=132$。
固定身体行 $s+1$ 与身体列 $s+1$ 的像之后，其余行标号至多 $n^{k-1}$、其余列标号至多 $n^{k-1}$，
相乘得 $m\cdot n^{2k-2}$ ✓；除以 $n^{2k}$ 得 $m/n^2=2^h/(d_h^2 2^{2h})=2^{-h}/d_h^2$ ✓。
纸面那句 "requiring increasing orders and the prescribed entries can only reduce these numbers"
是说 $n^{k-1}$ 这个松界比严格递增序列的数量还大，方向安全。

机器侧对位：`CanonicalCopyBound.lean`（1,389 B）只有四条：`anchor64Pinned`（`:17`）、
`matching_copy_leaf`（`:21`）、`canonical_copyCount_le`（`:28`）、`canonical_copyDensity_le`（`:33`），
它 import `OrderedAnchorRigidity` 与 `OrderedHostCopy`，是本模块里最短的出口之一。
`matching_copy_leaf` 对应上面"$p=q$"那一步，`anchor64Pinned` 对应第 15 节的钉住结论，
命名里的 `canonical` 与纸面 `Canonical row--column sampling` 那条推论同源。
计数层在 `CopyBound.lean`（`card_le_card_mul_pow` 在 `:15`、`normalized_count_le` 在 `:51`），
抽象出"$|\text{拷贝}|\le|\mathcal L|\cdot n^{2k-2}$"与"除以 $n^{2k}$"两件事，
`CopyBoundFixed.lean` 负责把它实例到 `fixedH`。`PinnedHostCopy.lean`（4,969 B，
import `HostRoleExtraction`、`HostCopyBound`、`ModeLocalization`）是钉住与计数之间的胶水，
它的 `ModeLocalization` 依赖指向 `ModeLocalization.lean`（2,644 B，只 import `Mathlib`）这第三条抽象轨道。

(c) 机械理由。指数 $2k-2$ ，并非 $2k$：一格被钉死在 $m$ 个位置里，省下整整一份 $n^2$；
$|\mathcal L_h|=m$ 用到叶块大小 $m/2^h=1$，这条恒等式与第 8 节的"块大小 $m/2^i$"是同一条，
$h$ 换成别的值就断；$p\equiv q\pmod2$ 这一步把 $\pi$ 层面的不等式抬回 $p,q$ 层面，
没有奇偶限定就只能得到 $\pi(p)=\pi(q)$，对应的格数是 $2m$，$N/n^{2k}$ 会多出 $2$ 的因子，
$\epsilon_h2^{-h}$ 仍是同阶，故这里的损失是常数级，纸面带上奇偶限制是免费的严谨；
$(s+1,s+1)$ 的选取有硬性约束，它必须是 $P$ 里值为 $1$ 而两个方向都能被序卡住的那格，
即左上格。换成 $(s+2,s+2)$（值也是 $1$）会得到同样的叶对角线；换成 $(s+1,s+2)$（值为 $0$）
则 $p<q$ 与 $p\ge q$ 无法同时成立，矛盾会更早出现而失去钉位置的能力。

(d) 失败路线。[推测] 第一条：不钉到具体一格，只证"拷贝的行必含叶"。
那样得到的是 $N\le n^{2k-1}$ 量级，$N/n^{2k}\le 1/n$，与 $\epsilon$ 的关系里丢一个 $m$ 的因子，
距离与拷贝之比无法压到 $2^{-h}$，第 19 节末段的极限比较会变成 $(386h+2)^{2C-1}2^{-h/2}$ 这类失败形状。
[推测] 第二条：把叶对角线的 $m$ 格当成 $2m$ 格（两个符号名各数一次），
与第 13 节缺口二同一种错，纸面上"$|\mathcal L_h|=m$"立刻不成立。

## 18 逐引理 IX：Remark（hitting-not-repair），同一格从 $1$ 的命脉换成 $0$ 的轨道

(a) 原文逐字。声明行 `sections/03b-count.tex:72`：

> \begin{remark}\label{rem:hitting-not-repair}

正文首句 `sections/03b-count.tex:73-74`：

> Changing the $m$ entries of $\mathcal L_h$ from $1$ to $0$ destroys every original copy, but creates new ones.

构造指令 `sections/03b-count.tex:74-78`：

> Indeed, fix a leaf index $p$ and put $d=p\bmod 2$. In mode $W_{h,d}^+$, choose the leaf row in $R_h^+(p)$ and any dummy row. Choose, in this order, a column in $C_{h-1}^+(\pi(p))$ and the leaf column in $C_h^+(p)$. These rows and columns have the required order. Their body is now

显示式在 `sections/03b-count.tex:80`，按原文排成 `$\begin{pmatrix}1&0\1&1\end{pmatrix}:$`，与 `sections/02-construction.tex:34` 定义的 $P$ 是同一件东西。逐字引用 `sections/03b-count.tex:82-84`：

> the upper-left entry is the unchanged parent--child entry, the upper-right entry is the changed leaf diagonal, and the lower entries are dummy incidences.

收尾两句 `sections/03b-count.tex:84-87`：

> Choosing one position from every anchor group of this mode completes a new copy of $H$, since all anchor entries and signatures are unchanged. Thus an original-copy hitting set need not provide an $H$-free repair.

纸面把它登记为 remark，我按引理的规格拆它，因为第 3 节那条错误路线的判词就在这八行里，而它判的对象超出我个人的失误：它判掉的是整类"命中集即修复集"的论证在二元 induced 语义下的可行性。

(b) 中间步骤补齐。先把记号收齐。$m=2^h$（`sections/02-construction.tex:42`），$\pi(p)=\lfloor p/2\rfloor$（同文件 `:77`），叶块共享名字 $R_h^-(p)=R_h^+(p)$、$C_h^-(p)=C_h^+(p)$（同文件 `:49-51`），改动集合是 $\mathcal L_h=\bigcup_{p=0}^{m-1}R_h^+(p)\times C_h^+(p)$ 且 $\lvert\mathcal L_h\rvert=m$（`sections/03b-count.tex:11-15`）。深度 $h$ 的块大小为 $1$（`sections/02-construction.tex:47`），所以这 $m$ 个乘积确实是 $m$ 个单格，没有一块内含多格。

第一步，旧拷贝为什么全灭。第 17 节按 `sections/03b-count.tex:53-59` 得到任一旧拷贝的身体模式只能是 $W_{h,d}^-$，且 $(s+1,s+1)$ 这格落在 $\mathcal L_h$。$H$ 在 $(s+1,s+1)$ 处的值是 $P$ 的左上角 $1$（`sections/02-construction.tex:30-34`）。改动把 $\mathcal L_h$ 的每格置 $0$，于是每个旧拷贝至少断掉一格的值。旧拷贝全灭，`sections/03b-count.tex:73` 的前半句成立。

第二步，新拷贝的四格逐一代入。取 $r_1$ 为 $R_h^+(p)$ 中那一格，$r_2$ 为 dummy 行块 $R_*$ 中任一格，$c_1$ 为 $C_{h-1}^+(\pi(p))$ 中任一格，$c_2$ 为 $C_h^+(p)$ 中那一格。行的序：$R_*$ 排在所有变元行之后（`sections/02-construction.tex:72`），故 $r_1<r_2$ 无条件成立，与 $p$ 无关。列的序用 `sections/02-construction.tex:86-87` 的等价式，取 $i=h$、$q=p$、$b=\pi(p)$，得 $C_{h-1}^+(\pi(p))<C_h^+(p)\iff\pi(p)\ge\pi(p)$，右端恒真。

顺手把 $c_1$ 的深度位置夹出来。若 $c_1$ 取自 $C_{h-1}^+(b)$ 而 $b>\pi(p)$，序条件 $\pi(p)\ge b$ 失败；若 $b<\pi(p)$，序条件通过，但 $$(r_1,c_1)$$ 的值按 `sections/02-construction.tex:190` 那条 $\mathbf 1[\pi(p)\le q]$（其中 $q$ 是列块的节点标号）为 $0$，身体的左上对不上 $P$。两头一夹只有 $b=\pi(p)$，remark 写出 $C_{h-1}^+(\pi(p))$ 是算出来的结果，候选列块唯一。

四格的值。$(r_1,c_1)$ 是 $R_h^+(p)$ 对 $C_{h-1}^+(\pi(p))$，用 `sections/02-construction.tex:190` 的 $\mathbf 1[\pi(p)\le q]$ 代 $q=\pi(p)$ 得 $1$，且这格在 $C_{h-1}^+$ 里、不在 $\mathcal L_h$ 内，改动碰不到它，正是原文 "unchanged parent--child entry"。$(r_1,c_2)$ 是叶对角格本身，原值按 `sections/02-construction.tex:188` 的 $\mathbf 1[p\le q]$ 为 $1$，改动后为 $0$，即 "changed leaf diagonal"。$(r_2,c_1)$ 与 $(r_2,c_2)$ 的行属于 dummy 块，按 `sections/02-construction.tex:182` 的规则一律为 $1$，即 "lower entries are dummy incidences"。四格合起来是 $\begin{pmatrix}1&0\1&1\end{pmatrix}=P$ ✓，`sections/03b-count.tex:78` 那句 "Their body is now" 到此落地。

第三步，把身体补成完整的 $H$。模式 $W_{h,d}^+$ 的四组角色是 $\mathsf R_1=R_{h,d}^+$、$\mathsf R_2=R_*$、$\mathsf C_1=C_{h-1}^+$、$\mathsf C_2=C_{h,d}^+$（`sections/02-construction.tex:126`）。归属四条我都在前两步验过，其中 $r_1\in\mathsf R_1$ 需要 $p\equiv d\pmod2$，这就是原文先写 "put $d=p\bmod2$" 的理由。接着对 $1\le u\le s$ 从 $\widehat R_{W_{h,d}^+}(u)$ 任取一格、对 $1\le v\le s$ 从 $\widehat C_{W_{h,d}^+}(v)$ 任取一格。锚块整体排在所有变元与 dummy 位置之前（`sections/02-construction.tex:147`），同模式的组按 $u$ 与 $v$ 递增排列且每组大小 $m$（同文件 `:149-151`），故两条轴各自递增，$66+66$ 个位置的序合法。锚对锚：$t=t'$ 时值为 $S(u,v)$、否则为 $0$（同文件 `:170-171`），我全部取同一个 $t$，于是左上 $64\times64$ 块正是 $S$。非锚行对锚列：$r_j\in\mathsf R_j(t)$ 给出 $e_j^{\mathsf T}$（同文件 `:173-176`），所以 $r_1$ 那行是 $e_1^{\mathsf T}$ 再接 $(1,0)$，$r_2$ 那行是 $e_2^{\mathsf T}$ 再接 $(1,1)$。非锚列对锚行：$c_j\in\mathsf C_j(t)$ 给出 $e_j$（同文件 `:176-178`）。与 `sections/02-construction.tex:26-36` 的 $H$ 并排逐块相等 ✓，`sections/03b-count.tex:85-86` 那句 "all anchor entries and signatures are unchanged" 指的就是这两条规则都不看非锚位置。

第四步，新拷贝的量级。锚组共 $2s=128$ 个、每组 $m$ 格可选，$R_*$ 与 $C_{h-1}^+(\pi(p))$ 里还各给 $m$ 个选择，所以固定 $p$、只用 $W_{h,d}^+$ 一个新拷贝族就有 $m^{130}$ 量级的取法。$d$ 由 $p$ 的奇偶决定，$p$ 有 $m$ 个，改动 $2^h$ 格换来至少 $m^{131}$ 个新拷贝的候选。这一步是我自己数出来的，纸面只用到"存在"这一弱形式。

(c) 机械理由。为什么落在 $W_{h,d}^+$ 而 $W_{h,d}^-$ 造不出。旧拷贝在 $W_{h,d}^-$，那里叶列是角色 $\mathsf C_1$（`sections/02-construction.tex:127`），叶对角格坐在身体的左上，$P$ 要 $1$，改动把它置 $0$ 是破坏；$W_{h,d}^+$ 把叶列放在角色 $\mathsf C_2$（同文件 `:126`），同一格因此坐在身体的右上，$P$ 要 $0$，改动是促成。更进一步，minus 模式即使不动 $\mathcal L_h$ 也造不出这条拷贝：$r_1\in R_h^-(p)$ 对 $c_2\in C_{h-1}^-(b)$ 走 `sections/02-construction.tex:191` 的严格不等式 $\mathbf 1[\pi(p)<q]$，$b=\pi(p)$ 时值为 $0$，而序条件 $\pi(p)\le b$（同文件 `:88-89`）又容得下 $b=\pi(p)$，两个条件一交就漏掉唯一的候选。plus 与 minus 在这里的差别只剩表格线的 $\le$ 与 $<$，同一格在 $+$ 模式读作 $0$、在 $-$ 模式读作 $1$，根源是两条轴的递归序反号（`sections/02-construction.tex:67-71`）。remark 是这个设计选择在末端的兑现，第 9 节那把单向锁正是它的动力学版本。

为什么 $d=p\bmod {}2$ 非写不可。$R_{i,d}^\sigma$ 与 $C_{i,d}^\sigma$ 是把并限制到 $p\equiv d\pmod2$ 得到的（`sections/02-construction.tex:61-63`），$W$ 模式的两组变元角色共享同一奇偶，$r_1$ 与 $c_2$ 才能落在同一个 $p$ 上。跳过奇偶会出现 $r_1\in R_{h,0}^+$ 而 $c_2\in C_{h,1}^+$，叶对角关系根本不存在，改动集合与角色集合脱钩。

为什么用 dummy 行而不用 dummy 列。$R_*$ 在所有变元行之后、$C_*$ 在所有变元列之前（`sections/02-construction.tex:72-73`），两个相反方向正是第 9 节那两句初等限制的物理实现：$W$ 模式配 dummy 行，行的序自动满足，序的全部压力压在列上，于是 $(c_1,c_2)$ 的先后能携带 $\pi(q)$ 与 $b$ 的比较信息。换成 $V$ 模式配 dummy 列，列的序自动满足，信息只能在行方向流动，而 $V_i^{\pm}$ 的两组列角色是 $C_*$ 与 $C_{i-1}^{\pm}$（同文件 `:124-125`），其中没有叶块的位置，改动 $\mathcal L_h$ 对 $V$ 模式的身体毫无作用。remark 挑 $W_{h,d}^+$ 是角色表逼出来的唯一选择。

为什么 remark 只需要"新拷贝存在"。它的用途是把命中集与修复集两个概念分离，量级对照已经写在 `sections/01-introduction.tex:93-94`：所有旧拷贝与 $2^h$ 格相交，而任何二元修复至少改 $4^h$ 格，后半句由 `sections/04-distance.tex:14-15` 的 $m^2$ 提供。$2^h$ 与 $4^h$ 之比 $2^h$ 是主定理唯一需要的信息，纸面不去数新拷贝个数，我上面 $m^{131}$ 的估算属于多余的强度，多余之处在 (b) 第四步已标注。

机器侧对位。$4^h$ 那一侧被无条件钉住：`OrderedRepairDistance.lean:20-23` 的 `hammingDistance_ge` 结论写作 $(2^h)^2$ 不大于 hammingDistance，`OrderedRepairDistance.lean:18-19` 的 docstring 明说 no pinning premise 也一并省去，`HostRepairDistance.lean:83` 是同一条针对 canonical host 的版本。造新拷贝这一侧我能找到的最接近声明在 `BodyExtension.lean`：`appendTwo_matches_fixedH`（`BodyExtension.lean:60`）说"一个锚加上两行两列的四格就能复现固定 pattern 的每一格"，`not_HFree_of_anchor_body`（同文件 `:90`）是它的正面用法，两条合起来正是 (b) 第三步的形状；`BodyExtension.lean:1` 只 import `Model`，而它的唯一直接消费者是 `GuardedFrame.lean:1`，后者在 `GuardedFrame.lean:61` 用 `not_HFree_of_anchor_body` 把一个锚框架加四格身体直接判成非 $H$-free，`GuardedFrame` 再被 `GuardedPath.lean` 与 `HostAnchorFrames.lean` 消费。这条链是否真的走到 `Main.lean:2` 的 `OrderedRepairDistance` 分支我没有逐跳核对，第 21 节只登记 `Main.lean:1-4` 的直接四条。`GuardedPath.lean:135` 的 `repair_hits_guards` 是"任何修复必须碰受保护格"，与 remark 构成反方向的一对：一边给修复的下界，一边给命中的无效性。

(d) 失败路线。[推测] 第一条：把改动迭代下去，第 $j$ 轮消掉当时的拷贝，赌它有限收敛。每轮重新付出至少 $m^2$ 的量级（`sections/04-distance.tex:15`），而 remark 显示新拷贝恰好长在刚改过的那 $m$ 格上，第二轮的命中集与第一轮的改动集重合，我找不到任何单调量可依赖，"步数上界"这种证明没有骨架。

[推测] 第二条：只保留 $N_H(A_h)>0$ 而把这条 remark 删掉。主定理的 $\epsilon$-far 陈述仍然要用 `sections/04-distance.tex:14-15` 的 $m^2$，删不掉；更糟的是 removal 的语义会被读者按 entry-disjoint 的正定理去理解，即 `sections/01-introduction.tex:88-91` 那种"与所有现存拷贝相交的小集合"，两个概念在本文语义下差 $2^h$ 倍，删掉 remark 等于把这个差别藏起来。

[推测] 第三条：把 host 升到三符号，让"翻转"失去二义性。`sections/01-introduction.tex:85-86` 承认已有例子用第三种符号而本文只用 $0$ 与 $1$；三符号下可以把 $1$ 改成 $2$ 而不必动任何 $0$ 的位置，remark 的机制消失，代价是模式不再二元。机器侧 `Main.lean:15` 的类型是 `BinaryMatrix n`，这类改动先撞类型层，第 10 节列出的 `Model.lean` 真值表要整套重写。

## 19 逐引理 X：主定理的拼装与 canonical sampling 的指数

(a) 原文逐字。`sections/05-conclusion.tex:4-5`：

> The construction uses the same $66\times 66$ pattern $H$ at every depth. The two preceding estimates now give the required counterexamples.

`:8-11` 是代入，首句：

> For each integer $h\geq1$, set

显示式按原文排成 $\epsilon_h=d_h^{-2}=(386h+2)^{-2},\ n_h=d_h2^h$。`:13-14` 与 `:20`：

> Proposition~\ref{prop:distance} shows that every $H$-free binary matrix differs from $A_h$ in at least $m^2=\epsilon_h n_h^2$ entries.

> These statements prove the asserted construction sequence.

中间那条显示式（`:17-18`）按原文是 $N_H(A_h)/n_h^{132}\le\epsilon_h2^{-h}$。极限比较在 `:22-26`：

> Now fix arbitrary real numbers $c,C>0$.  As $h$ tends to infinity,

显示式按原文排成 $N_H(A_h)/(\epsilon_h^C n_h^{132})\le(386h+2)^{2C-2}2^{-h}\to0$。`:28-31` 收尾：

> Choose an integer $h$ for which the right-hand side is less than $c$.  Then $0<\epsilon_h<1$, the matrix $A_h$ is $\epsilon_h$-far from being $H$-free, and

后半句（`:31`）按原文写作 $N_H(A_h)<c\epsilon_h^C n_h^{132}$。抽样推论 `:36-43` 的开头：

> Fix $h\ge1$ and an integer $0\le q\le n_h$. Consider a tester that chooses a uniformly random $q$-element row set $R\subseteq[n_h]$ and, independently, a uniformly random $q$-element column set $C\subseteq[n_h]$. It rejects only if the induced submatrix $A_h[R,C]$, with the inherited orders, contains an ordered copy of $H$. Then

显示式（`:42`）按原文排成 $\Pr(\text{reject on }A_h)\le\epsilon_h2^{-h}q^2$，随后 `:44-47`：

> and the rejection probability is zero when $q<66$. For every fixed $\rho\in(0,1]$, rejection probability at least $\rho$ requires

显示式按原文排成 $q\ge\sqrt{\rho}\,\epsilon_h^{-1/2}2^{h/2}$，再后面 `:49-51`：

> hence $q\ge\exp(\Omega(\epsilon_h^{-1/2}))$ along the sequence $\epsilon_h$ as $h\to\infty$. Here $q$ is the sample size on each axis; the induced submatrix has $q^2$ entries.

证明 `:55-62`：

> By Proposition~\ref{prop:copy-count}, every copy of $H$ in $A_h$ uses a cell of $\mathcal L_h$, and $|\mathcal L_h|=2^h$. For each fixed cell $(r,c)$, independence gives $\Pr((r,c)\in R\times C)=(q/n_h)^2$. Rejection implies that $R\times C$ meets $\mathcal L_h$, so the union bound gives

显示式按原文排成 $\Pr(\text{reject on }A_h)\le 2^h(q/n_h)^2=\epsilon_h2^{-h}q^2$。收尾 `:64-67`：

> If $q<66$, the sampled submatrix cannot contain $H$. Rearranging the probability bound gives the necessary sample size, and $\epsilon_h^{-1/2}=386h+2$ gives its exponential growth along the stated sequence.

(b) 中间步骤补齐。三处要自己走一遍。

代入步：$m^2=(2^h)^2$，$\epsilon_h n_h^2=d_h^{-2}d_h^2 2^{2h}=2^{2h}=m^2$ ✓，
所以第 11 节结论"至少 $m^2$ 个改动"逐字化成"至少 $\epsilon_h n_h^2$ 个改动"，归一化后正是
$\operatorname{dist}_H(A_h)\ge\epsilon_h$。拷贝步：第 17 节给 $N/n^{132}\le 2^{-h}/d_h^2=\epsilon_h2^{-h}$ ✓，
其中 $132=2k=2\cdot66$。极限步我按 paper 的写法核算：
$N_H(A_h)/(\epsilon_h^C n_h^{132})\le\epsilon_h^{1-C}2^{-h}=((386h+2)^{-2})^{1-C}2^{-h}=(386h+2)^{2C-2}2^{-h}$ ✓。
指数 $2C-2$ 可以任意正，但 $2^{-h}$ 是几何衰减，多项式乘几何趋于 $0$。
取整 $h$ 使右端 $<c$ 之后还要检查 $0<\epsilon_h<1$：$d_h=386h+2\ge388>1$，
故 $\epsilon_h=d_h^{-2}\in(0,1)$ ✓。这一步 paper 只写 "Then $0<\epsilon_h<1$"，把验证留给读者，
机器侧必须显式给出不等式。

抽样步的两处细节。$|\mathcal L_h|=2^h$ 与第 17 节的 $m=2^h$ 同一个数 ✓。
union bound 只用到"$R\times C$ 与 $\mathcal L_h$ 相交"这一必要条件，
因此界对任何每格概率不超过 $(q/n_h)^2$ 的抽样都成立，纸面用均匀独立抽样使等号成立。
$q<66$ 那条是纯尺寸论证：$q\times q$ 的子矩阵装不下 $66\times66$ 的 pattern，拒绝概率恒为 $0$，
所以任何正的 $\rho$ 都要求 $q\ge66$，与后面解出的不等式相互印证。
把 $\Pr\le\epsilon_h2^{-h}q^2$ 与 $\rho$ 比较，解出 $q^2\ge\rho\,\epsilon_h^{-1}2^{h}$，开方得
$q\ge\sqrt\rho\,\epsilon_h^{-1/2}2^{h/2}$ ✓。最后一步我补全：$\epsilon_h^{-1/2}=d_h=386h+2$，
反解 $h=(\epsilon_h^{-1/2}-2)/386$，于是
$2^{h/2}=\exp\bigl(\tfrac{\ln 2}{2}\cdot\tfrac{\epsilon_h^{-1/2}-2}{386}\bigr)$，
一次项给出 $\exp(\Omega(\epsilon_h^{-1/2}))$ ✓，$\sqrt\rho$ 是常数因子，
前置的 $\epsilon_h^{-1/2}$ 多项式因子被指数吸收。

机器侧与纸面的差别值得单独记。`Main.lean:11` 先建立序列版本 `counterexample_sequence`，
`Main.lean:19` 用 `SequenceAssembly.counterexample_sequence_of_integer_bounds` 把整数界拼成实数陈述，
`Main.lean:21` 交出 witness `Construction.hostMatrix (OrderedHost.rowIndex h) (OrderedHost.columnIndex h)`，
即把 `Host.lean:72` 那条按位置定义的 `host` 沿两条 `Position h ≃ Fin (size h)` 同构搬成 `BinaryMatrix (size h)`。
`OrderedHost.lean:21` 的 `size (h) := (386 * h + 2) * 2 ^ h` 与纸面 $n_h$ 同步，
`:34` 与 `:39` 的 `rowIndex`、`columnIndex` 是纸面 "Identify each resulting ordered axis with $[n]$"
（`sections/02-construction.tex:163`）的机器实现。
`Main.lean:26` 的 `no_polynomial_removal_bound` 由 `:34` 那句
`exact no_polynomial_removal_bound_of_sequence counterexample_sequence` 一步得到，
后者在 `Consequence.lean:16`。真正的分析部分在 `Asymptotics.lean:20` 的
`exists_depth_polynomial_decay (c C : ℝ) (hc : 0 < c)`，它取 `k` 满足 `C ≤ k`，
再用 `tendsto_pow_const_div_const_pow_of_one_lt (2 * k)` 与常数 `(388 : ℝ) ^ (2 * k)`。
这三处都是纸面一行极限里藏着的动作：把任意实指数 $2C-2$ 上浮到偶数整数 $2k$，
把 $386h+2$ 放大成 $388h$（依赖 $h\ge1$ 时 $2h\ge2$），最后交给 $h^{2k}/2^h\to0$。
我还注意到 `Asymptotics.lean:20` 的假设里没有 $0<C$，而纸面 `:22` 明写 "arbitrary real numbers $c,C>0$"：
机器版本弱一个假设，因为 `Real.rpow` 对任意实指数有定义、`exists_nat_ge C` 对任意实数成立，
`Consequence.lean` 那层替 `Main.lean:27` 的 `0 < C` 付了一次搬运费。

(c) 机械理由。$h\ge1$ 在三处被吃：叶块大小 $m/2^h=1$、根值与叶值分居不同层、$386h+2\le388h$；
$132$ 是 $2k$ 的展开，写死在 `Main.lean:17` 与 `:32`，任何 $k$ 的改动都要同时改这两处；
$2^{-h}$ 与 $\epsilon_h$ 相乘的形状决定"$\epsilon^{C}$ 换不动 $2^{-h}$"这件事，
若把 $\epsilon_h$ 改成 $d_h^{-3}$，距离门槛变严而拷贝界不变，比较式变成 $(386h+2)^{3C-3}2^{-h}$，仍趋于 $0$，
所以 $\epsilon_h$ 的指数 $-2$ 在否定多项式界时并非唯一可行选择；
差别只在抽样推论里可见：那里要 $\epsilon^{-1/2}$，$-2$ 给出 $\epsilon_h^{-1/2}=d_h$ 的一次增长，
$-3$ 会给出 $\epsilon_h^{-1/2}=d_h^{3/2}$，指数下界反而更强，纸面取 $-2$ 是让距离与拷贝两个陈述共用一个 $d_h^{-2}$；
$66$ 这个门槛来自 pattern 边长，纯尺寸；$\rho\in(0,1]$ 只出现在 $\sqrt\rho$ 这个常数里。

(d) 失败路线。[推测] 第一条：想让同一列 $A_h$ 同时给出"$\epsilon$-far 而无拷贝"，即把 $N_H(A_h)=0$ 当目标。
第 17 节已经说明拷贝非零且集中在 $\mathcal L_h$，把它们全清掉就落入第 18 节的陷阱，距离界反噬。
[推测] 第二条：把 $n_h$ 设成 $d_h^2 2^h$ 之类更大的式子，归一化里多出的 $d_h$ 让 $\epsilon_h$ 与 $n_h$ 的关系
不再由 $d_h^{-2}$ 给出，$2^{-h}$ 相对 $n^{2k}$ 的衰减优势被稀释，最后的极限比较在 $C$ 大时失败。
[推测] 第三条：在抽样推论里改用二阶矩（second moment）争取更强下界。
本题拷贝只集中在 $m$ 格上，二阶矩与一阶矩同阶，得不到超过 $\epsilon^{-1/2}$ 的结论，
还要额外证明 $\mathcal L_h$ 内各格事件的相关结构；`CanonicalCopyBound.lean:33` 的
`canonical_copyDensity_le` 走的是最省的一阶路线，这也说明纸面那句 union bound 是刻意选择。

## 20 机器侧 I：登记面、目录面、json 面与 tex 面各有四套名字

这一节登记我实际看到的对不上之处，不做评判，只把四套命名并列。

第一套是登记面。`lean/formalization.yaml:1326-1328` 三行原文如下：

```yaml
    - comparator_config: ComparatorChallenges/MatrixRemoval.json
      declaration: OAI.Problem348.no_polynomial_removal_bound
      file: OAI/Combinatorics/MatrixRemoval/Main.lean
```

第二套是 json 面。`lean/ComparatorChallenges/MatrixRemoval.json` 全文 350 B，我整读过，字段与值为
`challenge_module` 取 `ComparatorChallenges.MatrixRemoval`、`solution_module` 取
`OAI.Combinatorics.MatrixRemoval.Main`、`theorem_names` 是单元素列表
`OAI.Problem348.no_polynomial_removal_bound`、`definition_names` 是空列表 `[]`、
`permitted_axioms` 取 `propext`、`Quot.sound`、`Classical.choice` 三条、`enable_nanoda` 取 `false`。
第三套是目录面：`OAI/Combinatorics/MatrixRemoval/`，六十一 个 `.lean`。
第四套是代码面：文件里的命名空间根是 `OAI` 下的 `Problem348`（`Main.lean:9`），
子命名空间有 `Problem348.Construction`（`Host.lean:11`、`CanonicalModeEntries.lean:6`、
`CanonicalHorizontal.lean:7`、`HostAnchorFrames.lean:13`）、`Problem348.OrderedHost`
（`CanonicalCopyBound.lean:13`）、`Problem348.AnchorBridge`（`AnchorPatternBridge.lean:14` 与
`AnchorPatternFixed.lean:14`）、`Problem348.AnchorRigidity`（`AnchorRigidity.lean:12` 与
`AnchorRigidityFixed.lean:8`）、`Problem348.GuardedPath`（`GuardedPath.lean:13` 与 `GuardedFrame.lean:10`）、
`Problem348.BodySignatures52`（`BodyRoles.lean:11`）、`Problem348.Construction.HostSampling`
（`GuardContainment.lean:12`）、`Problem348.AnchorGroups`（`AnchorGroups.lean:15`）、
`Problem348.CopyBound`（`CopyBound.lean:11`）、`Problem348.DirectNonshattering`（`DirectNonshattering.lean:17`）
等。

对齐结果：`declaration` 与 json 的 `theorem_names` 逐字一致 ✓；`file` 与 json 的 `solution_module`
一致（点号换斜杠）✓；`comparator_config` 与 json 的 `challenge_module` 一致 ✓。
断点在别处：登记的声明前缀是 `Problem348`，路径段是 `MatrixRemoval`，json 文件名也是 `MatrixRemoval`，
同一个 theorem 因此有三个候选称呼面。紧邻的条目可以做对照，`formalization.yaml:1322-1324` 的
`OAI.MatrixMultiplication.complex_rectangular_omega_lt_523_div_250` 与它自己的文件
`OAI/LinearAlgebra/MatrixMultiplication/Main.lean` 命名段完全对齐，说明队列里存在两种约定，
本篇落在"编号命名"那一支。

`definition_names` 是空列表，这一条最扎眼。`Model.lean` 里实际有十一条具名定义，
带行号登记：`BinaryMatrix`（`:11`）、`IncreasingMap`（`:13`）、`orderedCopies`（`:15`）、
`copyCount`（`:21`）、`HFree`（`:24`）、`hammingDistance`（`:27`）、`etaBit`（`:32`）、
`anchor64`（`:35`）、`fixedH`（`:41`）、`fixedMinEdits`（`:55`）、`fixedDistance`（`:62`）。
其中 `fixedH`、`copyCount`、`fixedDistance` 三个名字直接出现在 `Main.lean:16-17` 与 `:31-33` 的语句里，
也就是说它们是被登记的那个定理的公开陈述的一部分，json 却宣称没有定义名。
我倾向于读成"约定是只登记 theorem，公开的定义名靠 `Main.lean` 的语句自解释"，
但这个读法让 `definition_names` 这个字段在本篇恒空，比较器拿不到任何关于 `BinaryMatrix` 语义的信息。

`permitted_axioms` 三条与 `Classical.choice` 的必然性对得上：`Model.lean:55` 的 `fixedMinEdits`
用了 `classical` 与 `Finset.min'`，`Main.lean:8` 有 `noncomputable section`，
`orderedCopies` 与 `hammingDistance` 也各自带 `classical`（`Model.lean:16`、`:28`）。
`enable_nanoda` 取 `false` 我无法从材料里解释，登记在第 25 节。

tex 面有自己的一套对不上。`paper.tex:41-46` 的输入次序是
`01-introduction`、`02-construction`、`04-distance`、`03-pinning`、`03b-count`、`05-conclusion`，
即文件名前缀与最终节号交错。按 `paper.tex:20` 起的 `\newtheorem` 与 `\numberwithin{equation}{section}`，
实际节号是：Introduction 为 §1、Construction 为 §2、Distance 为 §3（来自 `04-distance.tex`）、
Copies are confined to the leaf diagonal 为 §4（来自 `03-pinning.tex`，标签 `sec:copies` 在 `:2`）、
`03b-count.tex` 第 1 行是 `\subsection{Every copy uses a diagonal leaf cell}`，故它不新开节，
仍在 §4 内，Conclusion 为 §5。所以 `03-pinning.tex` 是 Section 4、`04-distance.tex` 是 Section 3，
`03b-count.tex` 是 Section 4 的一个子节。开头我说这个次序是第一条线索，理由在此：
前缀记录的是写作次序，`\input` 记录的是最终陈述次序，两者恰好把 `03` 与 `04` 互换。
支持这个读法有一句纸面证据，`sections/01-introduction.tex:115` 与 `:129-131`：

> We first prove the distance bound in Section~\ref{sec:distance}.

> The copy bound concerns the unedited host and requires locating every copy, beyond the designated anchors used in the distance proof.

"先证距离"是把 `04-distance` 提到 `03-pinning` 前面的直接动机：距离论证只需要"存在被指定的锚代表"这一弱事实
（第 11 节的 `:71-75`），拷贝论证需要"每一个拷贝都被钉住"这一强事实，
先弱后强是叙述顺序，先强后弱是发现顺序。`03b-count.tex` 这个半号文件名则记录了一次拆分：
它原本应当在 `03-pinning.tex` 里，被单独切出去时又留在 §4 的编号里，前缀因此带 `b`。
第 1 节里那个 "(c) 段" 的悬念在这里落地：距离的分母是 $n^2$，而 `paper.tex` 的输入次序把距离放在锚之前，
读者要先接受一个"尚未证明拷贝存在"的距离下界，这正是零件三最容易读错的点。

## 21 机器侧 II：`Main.lean` 的四条 import 与六十一 个文件的分工

`Main.lean` 只有 1,320 B、41 行，是全模块最小的文件。它 import 四条（`:1-4`）：
`CanonicalCopyBound`、`OrderedRepairDistance`、`SequenceAssembly`、`Consequence`。
登记的那条声明 `no_polynomial_removal_bound` 在 `Main.lean:26`，语句是
`∀ c C : ℝ, 0 < c → 0 < C → ∃ n : ℕ, 1 ≤ n ∧ ∃ ε : ℝ, 0 < ε ∧ ε < 1 ∧ ∃ A : BinaryMatrix n, ...`，
证明体 `:34` 一句话：`exact no_polynomial_removal_bound_of_sequence counterexample_sequence`。
同文件 `:11` 的 `counterexample_sequence` 才有实质内容，`:19-24` 的 proof term 是

```lean
  apply SequenceAssembly.counterexample_sequence_of_integer_bounds
  intro h hh
  refine ⟨Construction.hostMatrix (OrderedHost.rowIndex h) (OrderedHost.columnIndex h), ?_,
    OrderedHost.canonical_copyCount_le h⟩
  intro B hfree
  exact OrderedHost.hammingDistance_ge hh B hfree
```

这五行告诉我四件纸面没说的事。第一，`Main.lean` 的 `namespace Problem348` 里只放两个定理，
`:36` 关闭 `Problem348`、`:38` 是一个裸 `end`（关闭 `:8` 的 `noncomputable section`）、`:40` 关闭 `OAI`。
第二，witness 的构造发生在 `Main.lean:21`，它把位置层面的 `Construction.hostMatrix`
与两条序同构 `OrderedHost.rowIndex`（`OrderedHost.lean:34`）、`columnIndex`（`:39`）绑在一起，
即纸面"Identify each resulting ordered axis with $[n]$"这一步在机器里是一次显式搬运。
第三，`OrderedHost.canonical_copyCount_le h` 与 `OrderedHost.hammingDistance_ge hh B hfree`
是两条已经证好的界，`hh : 1 ≤ h` 被显式传给后者，说明距离侧确实需要 $h\ge1$。
第四，`Main.lean` 依赖的 `Construction` 命名空间来自 `Host.lean:11`，模块里根本没有 `Construction.lean` 文件。

按 import 关系，六十一 个文件分成三层，我把链条写全，因为纸面完全看不见这三层。
纯抽象层有十五 个文件，判据是"不 import 本模块任何文件"：`Model`、`AnchorFrames`、`AnchorGroups`、
`AnchorPatternBridge`、`AnchorRigidity`、`Asymptotics`、`CopyBound`、`DirectNonshattering`、
`ModeIncidence`、`ModeLocalization`、`PathPropagation`、`SampledPath`、`SamplingAvoidance`、
`ThreeSeedSampling`、`TreePositions`。它们只 import `Mathlib`，其中 `Model` 提供语言，
其余提供与 host 无关的引理骨架。
host 层以 `Host`（`Host.lean`，命名空间 `Problem348.Construction`）为根，
向下挂 `HostTwins`、`HostRootLeaf`、`HostTreeOrder`、`HostBodyModes`、`HostBodyOrder`、
`HostVerticalLocalization`、`HostModeIncidence`、`HostAnchorGroups`、`HostAnchorFrames`、
`HostAnchorRigidity`、`HostAnchorPinning`、`HostNonshattering`、`HostRoleExtraction`、
`HostCopyBound`、`HostSampledPath`、`HostSampledSelection`、`HostRepairDistance`、
`HostSampling`、`HostSamplingCompatibility`、`Host` 本身，共二十 个 `Host*` 前缀文件（实测计数）。
`Ordered*` 前缀有七 个：`OrderedHost`、`OrderedAnchorGroups`、`OrderedAnchorRigidity`、
`OrderedBodyLocalization`、`OrderedHostCopy`、`OrderedSampledSelection`、`OrderedRepairDistance`；
`Anchor*` 前缀也有七 个；`Canonical*` 三个（`CanonicalCopyBound`、`CanonicalHorizontal`、
`CanonicalModeEntries`）；`Guard*` 三个（`GuardedPath`、`GuardedFrame`、`GuardContainment`）；
`Sampled*` 与 `Path*` 各两个；剩下的 `Body*`、`Copy*`、`Mode*`、`Sequence*`、`Asymptotics`、
`Consequence`、`Direct*`、`Selected*`、`Main` 各成小簇。

两条主链我沿 import 走完。拷贝侧：
`Main` 到 `CanonicalCopyBound` 到 `OrderedAnchorRigidity` 到 `HostAnchorPinning` 到
`HostAnchorRigidity`、`AnchorRigidityFixed`、`AnchorPatternFixed`、`HostNonshattering`，
再分叉到 `AnchorProperties`（到 `Model`）、`HostTwins`（到 `Host`）、`DirectNonshattering`、
`AnchorPatternBridge`；另一支 `SelectedAnchorSparsity` 到 `HostModeIncidence` 到 `ModeIncidence`；
`OrderedAnchorGroups` 到 `OrderedHost` 与 `HostAnchorGroups`。
`Main` 到 `OrderedHostCopy` 到 `OrderedBodyLocalization` 与 `PinnedHostCopy`，
后者到 `HostRoleExtraction`（到 `BodyRoles`）、`HostCopyBound`（到 `CopyBoundFixed` 到 `CopyBound`）、
`ModeLocalization`。
距离侧：`Main` 到 `OrderedRepairDistance` 到 `OrderedSampledSelection` 与 `HostRepairDistance`，
后者到 `HostSampledSelection` 与 `HostSamplingCompatibility`；
`HostSampledSelection` 到 `HostAnchorFrames`、`HostSampledPath`、`HostRootLeaf`、`GuardedPath`、
`SamplingDistance`，而 `SamplingDistance` 到 `Model` 与 `SamplingAvoidance`；
`HostSamplingCompatibility` 到 `HostSampling`、`HostSampledPath`、`GuardContainment`，
`HostSampling` 到 `Host` 与 `ThreeSeedSampling`，`GuardContainment` 到 `HostSampling` 与 `GuardedPath`。
装配侧：`Main` 到 `SequenceAssembly`（只到 `Model`）与 `Consequence`（到 `Model` 与 `Asymptotics`）。

分工的读法：`SequenceAssembly.lean` 的五条（`HostBounds` 在 `:15`、`fixedMinEdits_ge_of_repairs` 在 `:20`、
`fixedDistance_ge_of_integer_bound` 在 `:34`、`copyDensity_le_of_integer_bound` 在 `:54`、
`counterexample_sequence_of_integer_bounds` 在 `:71`）把纸面"$m^2$ 个改动"与"$\epsilon n^2$ 个改动"
这两句话之间的实数化手续集中一处；`Asymptotics.lean` 只有一条 `exists_depth_polynomial_decay`（`:20`），
`Consequence.lean` 只有一条 `no_polynomial_removal_bound_of_sequence`（`:16`）。
也就是说，全模块 61 个文件里，与"最终否定多项式界"这一步直接相关的代码不到六 千字节的量级，
其余全部服务于把 $A_h$ 的每一格入口与每一次序比较变成可判定命题。

## 22 机器侧 III：三粒种子如何替换概率论

纸面的距离证明用了概率语言：一个均匀的 $z$，加上"条件于 $z$ 时各不同组之间独立"，
得到每格概率 $m^{-2}$（`sections/04-distance.tex:46-59`），再做一次 union bound（`:63-66`）。
这条路线在机器侧被整段替换。文件 `ThreeSeedSampling.lean`（8,990 B，只 import `Mathlib`）
在 `:6` 的 docblock 里写着标题 "Three-seed sampling for the tree-matrix repair argument"，
`:9` 紧跟一句 "Three uniform seeds suffice: a common leaf, a row seed and a column seed."。
`:74` 定义 `Seeds (m : ℕ) := Fin m × (Fin m × Fin m)`，`:146` 的 `card_seeds` 给出
`Fintype.card (Seeds m) = m ^ 3`。

替换的核心是把"独立"换成"纤维基数恰好"。`:18` 的 `mix` 与 `:33` 的 `splitMix` 是一对互逆操作，
后者上方的注释（`:32`）写着 "The output of the mixer and the two unused coordinates determine both seeds."，
即 `mix` 是一个双射的两半；`:52` 的 `fiberOfEquiv` 把任意等价 $X\simeq Y\times Z$ 的纤维写成可数形式；
`:64` 的 `card_mix_fiber` 上方注释（`:63`）写着 "Every level-class position occurs equally often in the pair of seeds."。
真正把 $m^{-2}$ 落地的是 `:206` 与 `:212` 两条，注释分别是
"Every variable-row / anchor-column cell has exactly m seed preimages."（`:205`）与
"Every anchor-row / variable-column cell has exactly m seed preimages."（`:211`）。
三粒种子共 $m^3$ 个，每格恰有 $m$ 个原像，概率 $m/m^3=m^{-2}$ ✓，与纸面完全同值，
但陈述形式从"独立同分布"换成了"纤维基数"，union bound 也就换成频数求和。
支撑它的还有 `:118` 的 `card_row_fiber`、`:128` 的 `card_column_fiber`、`:138` 的 `card_both_fiber`，
以及 `:153` 的 `level_factor`、`:158` 的 `mixCast`、`:172` 的 `atLevel`
（注释 `:171`："The class-coordinate selected at depth i by a common leaf and an axis seed."）、
`:192` 的 `atLevel_node`、`:198` 的 `ancestor_parent`。

最值得记的是一次被留在代码里的降级尝试。`:111` 的 `splitBoth` 上方注释（`:110`）写着
"Two independent axis seeds, with the common-leaf coordinate unused."，
`:77` 的 `splitRow` 与 `:94` 的 `splitColumn` 把三粒种子拆成两条轴各自的版本，
`:179` 之后有一条注释 "Root selections depend only on the corresponding axis seed."（原文在 `:179`）。
这套东西存在的唯一理由，我认为是要把"只用两粒种子会失去什么"这件事算清楚：
去掉公共叶子 $z$，两条轴的祖先索引串 $a_i$ 就各自独立，
纸面 `:5-6` 那句 "with the same node indices" 失效，
第 11 节里 $V_i^+$ 用的行对与 $W_{i,d}^+$ 用的列对不再落在同一条路径上，归纳接不上。
`splitBoth` 因此是一份"两粒种子版本"的活文档，而 `:192` 的 `atLevel_node` 与 `:198` 的 `ancestor_parent`
是把公共叶子的必要性钉死所必需的两条结构事实。这条降级尝试我在第 11 节的 (d) 段作为 [推测] 记过一次，
机器侧的证据比我的推测更硬。

guard 词汇是第二处替换。纸面说"固定一个避开所有相关改动的选取"（`:67` 那句
"Fix a selection avoiding all such changes."），机器侧把它变成一个三元谓词族：
`GuardContainment.lean:19` 的 `RowChosen`、`:23` 的 `ColChosen`、`:27` 的 `GoodCell`，
出口 `:47` 的 `FrameChosen.cell_good` 与 `:121` 的 `PathChosen.guard_good`，
以及 `:130` 的 `path_guard_frequency`。`SamplingAvoidance.lean`（7,832 B，只 import `Mathlib`）
提供抽象的"避开"陈述，`SamplingDistance.lean`（3,449 B，import `Model` 与 `SamplingAvoidance`）
把它接到 `fixedDistance`，最后 `OrderedRepairDistance.lean:28` 的 `sampledSelection_guard_frequency`
与 `:20` 的 `hammingDistance_ge` 交付 `Main.lean:24` 所需的那条文。
`GuardedPath.lean` 与 `GuardedFrame.lean` 承担路径与锚框的"被守住"结构，
其中 `GuardedFrame.lean:16` 的 `namespace AnchorFrame` 嵌在 `:10` 的 `Problem348.GuardedPath` 之内。
纸面上 `frame` 与 `guard` 两个词一次都没出现（除了 `:67` 的 "selection"），
这套词汇完全是机器侧为"避开改动集合"造的中间层。
`HostAnchorFrames.lean`（10,722 B）与 `AnchorFrames.lean`（6,643 B）分别给 `Host` 层与抽象层的
序坐标：`AnchorFrames.lean:19` 注释 "Coordinates for the row order: anchors, variables, dummy."，
`:25` 是 "Coordinates for the column order: anchors, dummy, variables."，
`:99` 与 `:104` 是 "The anchor region is an initial segment of the complete row axis." 与列轴版本。
这两句把纸面 `sections/02-construction.tex:147-148` 那句
"Before all variable and dummy positions on each axis, place an anchor block for each mode"
变成可判定的初始段性质，也正是第 11 节"锚在身体之前"所依赖的那条。

## 23 机器侧 IV：0-基与 1-基、化石常量、双轨与三套模式编码

先登记索引约定的爆炸半径。纸面全文用 $[k]=\{1,\ldots,k\}$ 的 1-基
（`sections/01-introduction.tex:11`），机器侧全部换成 `Fin` 的 0-基。三处翻译并列：

- 纸面 `sections/02-construction.tex:20` 的 $\eta_{v-59}(u-33)$ 配条件 $33\le u\le64$、$60\le v\le64$，
  机器侧 `Model.lean:35` 的 `anchor64` 写作条件 `32 ≤ u.val ∧ 59 ≤ v.val`、取值 `etaBit (u.val - 32) (v.val - 58)`。
  偏移各减 $1$，`etaBit`（`:32`）的除法 `a / (2 ^ (5 - b))` 与纸面 $\lfloor a/2^{5-b}\rfloor$ 同形，
  `% 2` 对 `\bmod 2`。
- 纸面 $H$ 的两条身体行是 $e_1^{\mathsf T}$、$e_2^{\mathsf T}$（第 $65$、$66$ 行），
  机器侧 `Model.lean:41` 的 `fixedH` 里对应的判据是 `u.val = 64`、`u.val = 65`。
- 纸面的 $32\times5$ 替换块是行 $33$ 到 $64$，机器侧是 `u.val` 从 $32$ 起，即 $32$ 行编号 $32$ 到 $63$。

改动半径我列五个落点：`AnchorProperties.lean` 里所有"第一 $32$ 行"这类界要跟着移动；
`BodyRoles.lean:34` 与 `:42` 的两条 `anchor64_row_ne_body_signature`、`anchor64_col_ne_body_signature`
直接把 $e_j$ 的下标与 `Fin 64` 的编号挂钩；`CanonicalCopyBound.lean:21` 的 `matching_copy_leaf`
参数类型是 `r c : Fin 66 → Position h`，$66$ 与 $(s+1,s+1)$ 的对应即 `u.val = 64`；
`Host.lean:14` 的 `AnchorPosition (h) := Fin (6 * h) × Fin 64 × Fin (2 ^ h)` 把 $64$ 写死；
`Main.lean:17` 与 `:32` 的指数 $132$ 依赖 $k=66$ 的平方。
这五处里最脆的是 `matching_copy_leaf`，因为它同时吃 $66$、叶索引 $p$ 与 $(s+1,s+1)$ 三个约定。

化石常量：`BodyRoles.lean:11` 与 `:73` 的命名空间是 `Problem348.BodySignatures52`。
我用 `52`、`Signature`、`signature` 三个词扫过这个文件，`52` 只在这两行出现，
其余命中全是语义正常的行（`:6` 的 docblock、`:8` 的签名说明、`:33`、`:41`、`:49`、`:55`、`:64` 的注释与定理名）。
也就是说 $52$ 是一个只活在名字里的数字，文件内没有任何一条语句用到它。
我的候选解释有三条，全部标记 [推测]。第一条：早期版本里锚的边长曾取 $52$，
于是 $d_h=6\cdot52h+2h+2=314h+2$，命名保留旧尺寸。第二条：$52$ 是某条中间界（例如
"每行至少 $48$ 个 $1$ 再加 $4$ 个模式"）的合计数，后来被拆成 `AnchorProperties` 与 `ModeIncidence` 两条，
界本身消失了而名字留下。第三条：$52$ 纯粹是开发过程中的目录序号或试验编号，与内容无关。
我倾向前两条之间，但材料不足以下判断，登记在第 25 节。

另一处化石在 `AnchorFrames.lean`：`:12` 打开 `Problem348.AnchorFrames`，`:151` 关闭它，
而 `:150` 是 `end Orders`，说明中间有一个 `Orders` 内层命名空间，我的 `^namespace` 扫描漏掉了它的开启动行
（缩进或点号写法），这属于我取证手法的一个盲点，记下来以免下次再犯。

双轨与三套编码，是我在 61 个文件里反复看到的现象，我列全：

1. 模式的三种编码：`Host.lean:16` 的 `Mode (h) := Fin (6 * h)`（带 `level` 与 `kind` 两个解码函数，`:21` 与 `:22`）；
   `ModeIncidence.lean:20` 的 `Mode := ℕ × Kind`（`Kind` 是 `:15` 的归纳类型）；
   `HostAnchorRigidity.lean:20` 的 `positionMode` 与 `:147` 的 `modeLabel` 又是 `Position h → Option (Mode h)` 的第三种视角。
2. `VariablePosition` 的同义重复：`Host.lean:13` 与 `TreePositions.lean:15` 都写
   `Fin (2 * h + 1) × Fin (2 ^ h)`，两处是各自的 `abbrev`，无共享定义。
3. 钉住的四层：抽象 `AnchorRigidity.lean`（`:12`）与 `AnchorPatternBridge.lean`（`:14`）、
   实例化 `AnchorRigidityFixed.lean`（`:8`，与前者同命名空间）和 `AnchorPatternFixed.lean`（`:14`，同理）、
   host 层 `HostAnchorRigidity.lean` 与 `HostAnchorPinning.lean`、`Ordered*` 层 `OrderedAnchorRigidity.lean`。
   纸面上这一切是引理 `lem:anchor-rigidity` 的一段证明。
4. 打不碎性的两层：`DirectNonshattering.lean`（`:17`，十条定理从 `class_injective_of_surjective` 到
   `matrix_missing_word_of_class_cover`）与 `HostNonshattering.lean`；
   纸面上是 `lem:nonanchor-traces` 的一段。
5. 抽样路径的四层：`SampledPath.lean`、`HostSampledPath.lean`、`SampledPathOrder.lean`、
   `OrderedSampledSelection.lean`，加上 `GuardedPath.lean` 的 guard 版本与 `ThreeSeedSampling.lean` 的种子版本。
6. 身体角色的三处落点：`BodyRoles.lean`（签名层）、`BodyExtension.lean`（扩展到完整拷贝）、
   `HostRoleExtraction.lean`（host 层提取），纸面上是 `cor:body-roles` 一句 "The column argument is identical."。

我的读法是：双轨各有其职，把"与 host 无关的组合骨架"和"与位置编码有关的判定"分开，
好让 `Host` 层每次改动（例如换一种序键写法）不牵动抽象层的证明。
代价是纸面上三行散文，在机器里是六 个文件与两套模式编码。

## 24 最终思路与最初设想的差异

把第 0 节的我和现在的我并排，差别有八处，我按重要性排。

差异一，问题的方向被我搞反了。我以为要多算一层正则性才能证明界存在，实际要证的是
"任何 $c_H,C_H$ 都被一条深度序列击败"。前者的输入是 $H$，后者的输出是 $H$；
于是工作重心从"设计论证"变成"设计一个对象"，纸面 `thm:main` 的全部困难都在选 $H$ 上。

差异二，自由参数其实没有自由度。我最初以为 $66$ 是一个被试出来的数，
第 5 节的核算说明它是 $6s+2=386$ 的解，而 $386$ 又来自"每条轴的类数必须写成 $h$ 的线性函数"这一条。
同样，$P$ 的不可对称化、$e_1,e_2$ 必须不同、dummy 的两条放置方向（$R_*$ 在末、$C_*$ 在首）
都是被约束逼出来的。一个反例的构造里，能被"审美"影响的成分比我预想的少得多。

差异三，距离与拷贝两条论证的技术等级不同。我原以为两者难度相当，实际距离侧只需要
"存在一组合法的锚代表与一条合法的路径"（第 11 节），拷贝侧需要"每一个拷贝都长这样"（第 15 到第 17 节），
后者要动用密度、打不碎性、Twins、序四种工具。paper 把距离放前面（`paper.tex:43`）是叙述策略，
开发顺序大概相反，这与第 20 节的前缀证据一致。

差异四，我把"拷贝少"当目标，实际目标是"拷贝少而距离大"，两者之间的比值才是反例。
单纯拷贝少很容易做到（$H$-free 的 host 拷贝数是 $0$），难的是同时 $\epsilon$-far。
第 18 节的 remark 说明这个张力落在概念层，超出技术细节：命中集与修复集在二元 induced 语义下不同集合。

差异五，概率论证在机器侧完全消失。纸面有 `Pr`、"uniformly"、"independent"、"union bound" 四处概率语汇
（`sections/04-distance.tex:30`、`:41-47`、`:58`、`:65`），机器侧对应的是 `Fintype.card`、`mix`、
`card_atLevel_row_fiber` 与 `path_guard_frequency`。数学内容相同（每格 $m^{-2}$），
陈述语言完全不同。这是我第一次见到"概率只是速记"这件事被如此干净地执行。

差异六，序的实现方式。纸面用一句递归（`sections/02-construction.tex:67-71`）就把两条轴的序讲完，
机器侧要五元字典序键 `OrderKey`（`TreePositions.lean:16`）、四个构造函数（`:18`、`:21`、`:24`、`:27`）、
一个 `Bool` 参数区分行列（`:31`）与一条 `orderKey_injective`（`:62`）。
递归在纸上是免费的，在机器上是十行定义加六条比较引理。

差异七，反例的量化顺序。我最初把 conjecture 读成"给定 $H$，界是否存在"，
最终陈述要求 $n$ 与 $\epsilon$ 一起被 adversary 选，而 $h$ 是我们挑的。
`Main.lean:26` 的 `∀ c C, ∃ n, ∃ ε, ∃ A` 就是这个次序的机器化，
纸面 `:24-26` 的四个量词与它一一对应。多出来的 `1 ≤ n`（`Main.lean:28`）是纸面没有的显式非空条件。

差异八，最终产物的形状。我以为会得到一族 pattern 或一个参数化构造，实际得到的是一个具体的 $66\times66$
布尔矩阵加上一个深度参数。第 20 节那些命名与顺序的错位，恰恰是"一个对象被反复修剪到最后形状"的痕迹。

## 25 还开着的口子与取证自检

我按"能否用现有材料判定"分两类。

材料内可判定但 paper 未写的，我已经在第 10 到第 19 节补齐，包括：$58$ 的取等行是 $S$ 的第 $33$ 行、
$48$ 的取等列是第 $60$ 到 $64$ 列、`fixedH` 右下角的真值表、
列侧模式清单里那两个由 $\mathsf C_1$ 不带奇偶带来的额外模式、
打不碎性中原子集合并计数与"按类乘积"计数之间的区别、$W_{h,d}^-$ 在 $i=h$ 时改用赋值表第一行、
dummy 行的 trace 为零向量因而不可能是身体行、以及 $\epsilon_h^{-1/2}=386h+2$ 到
$\exp(\Omega(\epsilon_h^{-1/2}))$ 的换元。这些在 tex 里都是省略句，在机器里都是具名引理。

材料内不能判定的，我列六条。
第一，`BodySignatures52` 的 $52$ 来源（第 23 节三条 [推测]）。
第二，`AnchorFrames.lean:150` 的 `end Orders` 对应的开启动行，我的取证手法漏扫。
第三，`MatrixRemoval.json` 里 `enable_nanoda` 取 `false` 的动机，字段本身没有说明，
`definition_names` 为空的处理约定也没有旁证。
第四，$66$ 是否为最小可行边长。我能证明"$6s+2=386$ 决定了 $s$"，
前提是 $d_h$ 必须恰好等于 $386h+2$；而 $386$ 只被要求"线性且使 $\epsilon_h^{-1/2}$ 与 $d_h$ 同阶"，
更小的 $s$ 配合更小的 $d_h$ 系数在纸面上未被排除。
第五，$27<32$ 的余量能否被压。若打不碎性的候选 trace 数从 $26$ 降到某个更小的值，
$S$ 的五列块或许能缩到四列，进而 $s$ 与 $d_h$ 全变，这条链我在第 13 节 (d) 段算过一次，结论是收益仅常数级。
第六，机器侧比纸面少一个假设（`Asymptotics.lean:20` 无 $0<C$），是否应当回写进 tex；
这属于两处表征的取舍，我没有材料判断作者的意图。

取证与落盘的自检。我一共读了七个 `.tex`：`paper.tex` 与六个 `sections`，
`figures/tree-orders.tex` 只在 `02-construction.tex:98` 的 `\input{figures/tree-orders}` 处被引用，
内容是 TikZ 分片，按规格不作为信息源。全过程未接触任何 PDF，未跑 `pdftotext`，未执行任何版本管理命令，
未读取本模块之外的 Lean 代码，未对整个 `lean` 仓做递归检索。
素材目录、`INDEX.md`、队列台账、派单文件与其它编号笔记我一格未动。
落盘手法是首次整写一次，之后一律在文件末尾追加，
追加过程中我发现前段有规格禁止的字符与句式残留，处理方式是就地做字符级替换，
被替换的那几处不含任何信息，长度只增不减，也没有删除任何已落盘内容。
写作前段我确实把三处被禁字符带进了基线，这是本轮的手法失误，
记录在此以免下一轮重复；自查用的字符串我按规格以指代方式书写，没有把它们原样抄进笔记。
数学定界符全部成对，节号从 $0$ 起连续无断，台账在下节。

## 26 台账：符号、数值与断点

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $s$ | $64$ | sections/02-construction.tex:11 | 锚 $S$ 的边长与 $6hs$ 个锚组 | 第 5 节 $6s+2=386$ 失解，$d_h$ 全变 |
| $k=s+2$ | $66$ | sections/02-construction.tex:35 | 主定理的 $n_h^{132}$ 与推论的 $q<66$ | 第 19 节两处 $132$ 与 $66$ 失去同步 |
| $P$ | 四格 $(1,0;1,1)$ | sections/02-construction.tex:34 | 两次初等限制与四种模式的排除 | 第 9 节的单向锁失效，归纳断在第一步 |
| $e_1,e_2$ | 标准基向量 | sections/02-construction.tex:24 | 身体行与锚列之间的签名 | 第 16 节的角色提取给出零向量分支 |
| $\eta_b(a)$ | $\lfloor a/2^{5-b}\rfloor\bmod 2$ | sections/02-construction.tex:13 | $S$ 的替换块与 $32$ 个五位字 | 第 12 节的 $16$ 与 $48$ 同时失守 |
| $m$ | $2^h$ | sections/02-construction.tex:42 | 全部类的大小与 $n=d_hm$ | 第 11 节的 $m^{-2}$ 与 $m^2$ 门槛同时崩 |
| $m/2^i$ | 深度 $i$ 的块大小 | sections/02-construction.tex:46 | 均匀性核算 $2^{-i}\cdot 2^i/m$ | 第 11 节缺口一的概率不再是 $1/m$ |
| $6h$ | 模式总数 | sections/02-construction.tex:118 | 锚组数 $6hs$ 与 $d_h$ 的线性项 | 第 5 节的 $d_h$ 与第 14 节的清单同步失败 |
| $6hs$ | 每轴锚组数 | sections/02-construction.tex:155 | 类数与 $n$ 的核算 | 第 4 节按类抽样的损失项改写 |
| $2h+1$ | 每轴变元类数 | sections/02-construction.tex:156 | $d_h$ 的 $2h$ 项与叶类单数 | 第 11 节的划分不再是等大 |
| $d_h$ | $386h+2$ | sections/02-construction.tex:160 | $n_h$ 与 $\epsilon_h$ 的公共因子 | 第 19 节的代入 $m^2=\epsilon_h n_h^2$ 断 |
| $n$ | $d_hm$ | sections/02-construction.tex:160 | 距离归一化与拷贝分母 | 第 11 节末段的 $m^2/n^2$ 不再等于 $d_h^{-2}$ |
| $R_*$ | 大小 $m$ 的 dummy 行块 | sections/02-construction.tex:64 | $W$ 模式的 $\mathsf R_2$ 与新拷贝底行 | 第 11 节 $W$ 分支失去恒为 $1$ 的下行 |
| $C_*$ | 大小 $m$ 的 dummy 列块 | sections/02-construction.tex:64 | $V$ 模式的 $\mathsf C_1$ 与新拷贝左列 | 第 11 节 $V$ 分支失去恒为 $1$ 的左列 |
| $C_{i,d}^\sigma$ | 奇偶受限的并 | sections/02-construction.tex:62 | $W$ 模式的奇偶 $d$ | 第 17 节 $p\equiv q\pmod 2$ 那步断 |
| 次序 $V_i^+,V_i^-,W_{i,0}^+,\ldots$ | 每层六项 | sections/02-construction.tex:144 | 锚组的排列与 `kind t` 的余数 | 第 7 节末的 `Host.lean:22` 解码错位 |
| $R_i^+(p)<R_{i-1}^+(a)$ | 等价于 $\pi(p)\le a$ | sections/02-construction.tex:82 | $V_i^+$ 的行序与 $W$ 分支 | 第 11 节归纳的前提之一消失 |
| $C_{i-1}^+(b)<C_i^+(q)$ | 等价于 $\pi(q)\ge b$ | sections/02-construction.tex:86 | $W_{i,d}^+$ 的列序 | 第 17 节 $b\le\pi(q)$ 失去依据 |
| $\mathbf1[p\le q]$ | 叶对叶恒取值 | sections/02-construction.tex:202 | $W_{h,d}^-$ 的 $p=q$ 结论 | 第 17 节 $\mathcal L_h$ 变成空集 |
| 至多 $1$ 个零 | 前 $32$ 行内每列 | sections/03-pinning.tex:23 | $31$ 这个密度与公共 $1$ 的存在 | 第 15 节断点四失效 |
| $58$ | 每行的 $1$ 数下界 | sections/03-pinning.tex:25 | 身体行须排除锚行身份 | 第 16 节弱化成 $>1$ 之前失去取等行 |
| $48$ | 每列的 $1$ 数下界 | sections/03-pinning.tex:26 | 列互异与密度 | 第 12 节的 $31$ 与第 15 节的清零失效 |
| $16$ | 后五列各自的零数 | sections/03-pinning.tex:41 | $48=32+16$ 的核算 | 第 12 节的列数下界改写到 $47$ |
| $31$ | 每列前 $32$ 行的 $1$ 数 | sections/03-pinning.tex:132 | 否掉变元列（对比 $4$） | 第 15 节断点三失去燃料 |
| $4$ | 每变元模式的个数 | sections/03-pinning.tex:49 | 稀疏性 $4<31$ | 第 14 节的清单与第 15 节的清零 |
| $26$ | $\sum_{j\le3}\binom5j$ | sections/03-pinning.tex:98 | 打不碎性的候选 trace 数 | 第 13 节的 $27<32$ 变成 $42>32$ |
| $27$ | 加上 dummy 行的 trace | sections/03-pinning.tex:101 | 与 $32$ 的最终比较 | 第 13 节缺口五与第 15 节断点二 |
| $32$ | 二择一的过半线 | sections/03-pinning.tex:126 | 至少一根轴过半是锚 | 第 15 节断点二的行数列数错配 |
| $63$ | 同模式锚列的下界 | sections/03-pinning.tex:134 | 锚行归入 $t$ 的清零论证 | 第 15 节断点五失效 |
| $1$ 个 dummy | 每轴至多 | sections/03-pinning.tex:118 | $64$ 减 $1$ 得 $63$ | 第 15 节断点三的算术 |
| $m^{-2}$ | 受保护格的入选概率 | sections/04-distance.tex:58 | `eq:cellwise-bound` 的分母 | 第 11 节缺口四的独立性 |
| $M<m^2$ | 改动数的严格门槛 | sections/04-distance.tex:21 | union bound 的 $<1$ | 第 11 节 (c) 段的等号情形 |
| $m^2$ | 距离的绝对下界 | sections/04-distance.tex:15 | `prop:distance` 的结论 | 第 19 节的 $\epsilon_h n_h^2=m^2$ 代入 |
| $d_h^{-2}$ | 归一化距离下界 | sections/04-distance.tex:16 | `thm:main` 的 $\epsilon_h$ | 第 19 节的 $\epsilon_h\in(0,1)$ 验证 |
| $1$ 与 $0$ | 根层两个入口值 | sections/04-distance.tex:89 | 归纳的种子 | 第 11 节缺口三的保护清单 |
| $\mathcal L_h$ | $m$ 个叶对角格 | sections/03b-count.tex:13 | 拷贝计数与新拷贝的位置 | 第 17 节 $\lvert\mathcal L_h\rvert=m$ 与第 18 节 |
| $m/2^h=1$ | 叶块大小 | sections/03b-count.tex:61 | $\mathcal L_h$ 的势 | 第 17 节 (c) 段的计数 |
| $mn^{2k-2}$ | 拷贝数上界 | sections/03b-count.tex:17 | $N_H(A_h)/n^{2k}$ 的分子 | 第 19 节的 $2^{-h}/d_h^2$ |
| $2^{-h}/d_h^2$ | 拷贝密度 | sections/03b-count.tex:20 | `thm:main` 的第二个不等式 | 第 19 节的极限比较 |
| $\epsilon_h2^{-h}$ | 与 $\epsilon$ 挂钩的密度 | sections/01-introduction.tex:43 | 主定理陈述与抽样界 | 第 19 节代入 $\epsilon_h=d_h^{-2}$ |
| $2^h$ 与 $4^h$ | 命中集与修复集之比 | sections/01-introduction.tex:94 | 第 3 节错误路线的判决 | 第 18 节 remark 失去量化对照 |
| $(386h+2)^{2C-2}2^{-h}$ | 趋于 $0$ | sections/05-conclusion.tex:25 | 击败任意 $c,C$ | 第 19 节 (b) 的极限步 |
| $\epsilon_h2^{-h}q^2$ | 拒绝概率上界 | sections/05-conclusion.tex:42 | 抽样推论的核心 | 第 19 节的 union bound |
| $q<66$ | 拒绝概率为 $0$ | sections/05-conclusion.tex:44 | 尺寸下界 | 第 19 节 (b) 的抽样步细节 |
| $\sqrt{\rho}\epsilon_h^{-1/2}2^{h/2}$ | 样本量必要条件 | sections/05-conclusion.tex:47 | 推论的显式形式 | 第 19 节 (b) 的开方 |
| $\exp(\Omega(\epsilon_h^{-1/2}))$ | 样本量增长率 | sections/05-conclusion.tex:49 | 与 canonical 检测器的对照 | 第 19 节 (b) 的换元 |
| `386 * h + 2` | Lean 的 `size` | OrderedHost.lean:21 | `Main.lean:21` 的 witness | 与纸面 $d_h$ 脱钩则 `Main.lean:14` 不符 |
| `Fin (6 * h)` | 模式编码 | Host.lean:16 | `level`、`kind` 与锚组下标 | `Host.lean:97` 的 `kind t < 6` 断 |
| `level t = t.val / 6 + 1` | 层的解码 | Host.lean:21 | `HostBodyModes` 与 `level_le` | `Host.lean:92` 的 $level t\le h$ 断 |
| `Fin (2 * h + 1) × Fin (2 ^ h)` | 变元位置编码 | Host.lean:13 与 TreePositions.lean:15 | 序键与类索引 | 第 23 节双轨之一断裂 |
| `ℕ ×ₗ ℕ ×ₗ ℕ ×ₗ ℕ ×ₗ ℕ` | 五元字典序键 | TreePositions.lean:16 | `positionOrder` 与四条序比较 | `TreePositions.lean:62` 的单射断 |
| `Fin (6 * h) × Fin 64 × Fin (2 ^ h)` | 锚位置编码 | Host.lean:14 | 锚组、组内标号与类内坐标 | `OrderedHost.lean:74` 的 strictMono 断 |
| `decide (u.val = 65 ∨ v.val = 64)` | $P$ 的机器化 | Model.lean:41 的 `fixedH` | 第 10 节的真值表核对 | `BodySignatures52` 的两条签名引理断 |
| `32 ≤ u.val ∧ 59 ≤ v.val` | 替换块的 0-基判据 | Model.lean:35 | `AnchorProperties.lean` 全部界 | 第 23 节的偏移链条断 |
| `n * n + 1` | `fixedMinEdits` 的哨兵 | Model.lean:59 | `fixedDistance` 与 `Main.lean:16` | `SequenceAssembly.lean:20` 的非空与最小性断 |
| `Fin 5 → Position h` | 五列的签名类型 | HostAnchorPinning.lean:156 | `actual_nonshattering` 与钉住 | 第 13 节的 $26$ 与第 15 节断点二 |
| `m ^ 3` | 种子空间大小 | ThreeSeedSampling.lean:146 | 每格 $m$ 个原像给出 $m^{-2}$ | 第 22 节的纤维计数断 |
| `exactly m seed preimages` | 每格原像数 | ThreeSeedSampling.lean:206 | `GuardContainment` 的频数求和 | 第 22 节的替换整体失效 |
| `path_guard_frequency` | 受保护格的频数 | GuardContainment.lean:130 | `sampledSelection_guard_frequency` | `OrderedRepairDistance.lean:20` 断 |
| `exists_depth_polynomial_decay` | 极限比较 | Asymptotics.lean:20 | `no_polynomial_removal_bound_of_sequence` | `Main.lean:34` 无法结束证明 |
| `no_polynomial_removal_bound` | 登记的声明 | formalization.yaml:1327 | `Main.lean:26` | 第 20 节的三套命名失去锚点 |
| `OAI/Combinatorics/MatrixRemoval/Main.lean` | 登记的文件 | formalization.yaml:1328 | 比较器的 `solution_module` | 第 20 节的目录面与登记面对不上 |
| `definition_names` | 空列表 | ComparatorChallenges/MatrixRemoval.json:7 | 比较器可见的定义集 | 第 20 节关于 `fixedH` 等名字的读法 |
