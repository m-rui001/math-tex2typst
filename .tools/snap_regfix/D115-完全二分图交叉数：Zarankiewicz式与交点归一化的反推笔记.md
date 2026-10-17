# D115 完全二分图交叉数：Zarankiewicz 式与交点归一化的反推笔记

这份笔记是我自己的复盘。我手里只有 `E:\math\preprints\The-crossing-number-of-complete-bipartite-graphs-September-23-2026\build\` 下的 LaTeX 源（`paper.tex` 与 `sections/` 六个分片，总计 45,328 字节）和 `E:\math\lean\OAI\Combinatorics\Crossing\` 下的机器化模块，PDF 一律没碰（语料已加密，pdftotext 出来的东西我不信），typst 分片不算素材。我做的事是：从这些文本倒推出当初做这项研究的人（也就是笔记里的"我"）真实的思维链。凡是论文自己写明的，我给 `分片名:行号` 加逐字引用，行号都用 `sed -n 'Np'` 实测过；凡是我替它补的中间推理，标 `[推测]`；凡是靠外部知识垫的，标 `[外部推断]`。我的补链有可能补错，也有可能当初真有一条更短的路被我漏掉，这类风险我在第 12 节和第 14 节里明写。

我的目标命题写在 `paper.tex:39-47` 的摘要里，逐字是

```
We prove the Zarankiewicz crossing-number conjecture, resolving Tur\'an's
brickyard problem. For all positive integers $m,n$, the ordinary crossing
number of the complete bipartite graph $K_{m,n}$ is
```

后面那个四因子乘积式在 `paper.tex:43-46`。正文里它以 `d_m d_n` 的紧凑形式出现（`introduction.tex:31-34`）：

```
For all positive integers $m,n$,
\[
 \crn(K_{m,n})=d_m d_n.
\]
```

## 0 初始动机与第一条猜想：四个取整从哪来

我坐下来第一件事，是盯着 $\lfloor m/2\rfloor\lfloor(m-1)/2\rfloor\lfloor n/2\rfloor\lfloor(n-1)/2\rfloor 这四个取整看，想知道它们到底是被谁逼出来的。论文没有把这段心理写出来，只给了一个恒等式，`introduction.tex:23-27`（即 `\label{eq:dr}` 那一条）逐字是：

```
 d_r=\left\lfloor\frac r2\right\rfloor
     \left\lfloor\frac{r-1}{2}\right\rfloor
 =\binom{\lfloor r/2\rfloor}{2}
  +\binom{\lceil r/2\rceil}{2}.
```

我当时的猜想很朴素：这个式子一定先由上界构造写死，再由下界证明被迫接受。理由是我把 `d_r` 的两条写法对照着展开。第一条写法里 $\lfloor r/2\rfloor$ 与 $\lfloor(r-1)/2\rfloor$ 是"同一条射线上的点数"与"去掉一个点后同侧的点数"吗？不是，这个读法不成立：$r=2s$ 时它是 $s(s-1)$，$r=2s+1$ 时是 $s^2$，两者都长得像 $\binom{s}{2}+\binom{s\pm1}{2}$ 的两倍，而第二条写法恰好给出这个匹配：$r=2s$ 时 $\binom{s}{2}+\binom{s}{2}=2\cdot\frac{s(s-1)}2=s(s-1)$，$r=2s+1$ 时 $\binom{s}{2}+\binom{s+1}{2}=\frac{s(s-1)}2+\frac{s(s+1)}2=s^2$。第二条写法里的两个二项式系数才是有几何意义的东西：把 $r$ 个点尽量平分到两条射线，两侧分别取两点。论文在上界一节把这句话写全了，`conclusion.tex:16-18`：

```
second-class vertices, each choice of two vertices on each ray forms a
convex quadrilateral. Exactly its diagonals cross, so the contribution is
$\binom u2\binom v2$.
```

也就是说 $d_m$ 是一个"单侧取两点"的和，$d_m d_n$ 是它的平方式展开，四项对应四个象限。这解释了为什么答案是两个 $d$ 的乘积，并非别的形式：象限 $(\pm,\pm)$ 里的交点数是 $\binom{u}{2}\binom{v}{2}$，其中 $u$ 是竖直轴某射线上 $a$ 类的点数、$v$ 是水平轴某射线上 $b$ 类的点数；把 $m$ 尽量平分给上下两条射线、$n$ 尽量平分给左右两条射线，四个象限的贡献相加正好分解成 (上侧两点的 $a$ 数 + 下侧两点的 $a$ 数) 乘 (左侧 + 右侧)，前一个括号是 $d_m$、后一个是 $d_n$。`conclusion.tex:9-12` 把摆放规则写死了：

```
Place the vertices $a_i$ on the vertical axis, divided as evenly as
possible between its positive and negative rays. Place the vertices $b_p$
on the horizontal axis in the same way, and join every required pair by
a straight segment. All positions are distinct and nonzero.
```

到这里我的第一条工作猜想成型：既然上界只是"把点排到两条轴上再连直线段"，下界应该就是证明任何画法都至少产生这么多交点，而"这么多"的自然语言版本是"每一对星形 $a_i,a_k$ 之间至少要交这么多次"。这个猜想的出处不是我瞎想，是论文自己承认的继承关系，`introduction.tex:47-51`：

```
Kleitman established the exact formula when one vertex class has at
most six vertices~\cite{Kleitman1970}.
His permutation argument already used the local cyclic orders of incident
edges to bound crossings between two stars
\cite[Section~8, equation~(17)]{Kleitman1970}.
```

于是我把第一条路押在"逐对星形计数"上。这条路在第 12 节里被我自己拆掉，先记下结论：它卡在"每个顶点的循环序到底是不是某个线性序"这一件事上，而这件事在 $n\ge7$ 时无法逐对独立处理，`introduction.tex:52-53` 也提示 Woodall 只能靠计算验到 $K_{7,7}$ 与 $K_{7,9}$。

## 1 记号、素材口径与反推方法

我把六个分片的规模和阅读顺序先固定下来，后面所有引用都落在这份口径上。字节数来自 `ls -la`：`intersections.tex` 9,931、`normalization.tex` 8,226、`subspaces.tex` 8,072、`detector.tex` 7,689、`introduction.tex` 6,528、`conclusion.tex` 4,882，另有 `paper.tex` 1,948、`references.bib` 7,278。装配顺序在 `paper.tex:50-57`：

```
\input{sections/introduction}
\input{sections/subspaces}
\input{sections/intersections}
\input{sections/detector}
\input{sections/conclusion}

\appendix
\input{sections/normalization}
```

注意这里有一个我觉得必须反推的错位：正文的叙述顺序是 introduction、subspaces、intersections、detector、conclusion，而依赖顺序其实是 normalization 最先用（`intersections.tex:8-9` 明确说 `By Lemma~\ref{lem:normalization}, proved in Appendix~\ref{sec:normalization}`）。作者把一个前置引理扔进附录，把两个与图形无关的线性代数命题（subspaces 那一节）放在最前面。我的解释是：写作顺序按"读者最先想知道什么"排，即先给纯代数不等式，再讲它凭什么能被图形喂进去；真实推进顺序大概相反。这一点在第 14 节里我会当成"最终呈现与真实顺序不一致"的证据用。

画法与计数的口径在 `introduction.tex:4-13`，我全文按它读：

```
For a finite graph $G$, a plane drawing places its vertices at distinct
points and represents each edge by a simple continuous arc whose interior
avoids the vertices. A meeting of two edge interiors is a proper crossing
if some open neighborhood of the point has a homeomorphism onto an open
disk taking the point to its center and the two local edge traces onto its
horizontal and vertical diameters. We require that edge interiors meet at
finitely many proper crossings, with no triple crossings, tangencies, or
common subarcs.
The number $c(D)$ of a drawing $D$ counts crossing points: if two edges
cross several times, each crossing is counted.
```

三个要点我要提前钉住，因为它们决定后面每一步的合法边界。第一，`c(D)` 数的是交点，同一对边多次相交每次都算，这与"交叉对数"或奇偶口径不同，`introduction.tex:37-39` 专门声明了这一点：

```
The distinction between crossing points, crossing pairs, and parity-based
crossing counts is important; we use the ordinary point-count convention
throughout~\cite{PachToth2000,FulekEtAl2012}.
```

第二，容许性把"三线共点"和"共子弧"直接从定义里排除掉了，后文的引理管不到这一条，它写在前提里。第三，proper crossing 用局部同胚（两根直径）定义，等价于要求横截、排除相切。第 2 节里我会看到归一化引理之所以能这么干，全靠这三条口径。

反推方法上我用三条纪律。凡论文写"we may take"、"clearly"、"thus"的地方，我都假设那里原本有过一次失败的尝试，然后去补那一步到底要什么条件；凡出现两个独立参数（例如 $i,k$ 与 $p,q$）的对称组合，我都检查退化情形（$i=k$、$p=q$）有没有单独处理；凡出现取整，我都把奇偶两种情形代回原式验证。第 12 节的候选失败路线都是按这三条纪律找出来的，标 `[推测]` 是因为论文没写。

## 2 归一化引理：把连续弧压成多边形而不增加交点

`lem:normalization` 的陈述在 `normalization.tex:10-17`，逐字：

```
\begin{lemma}[Drawing normalization]
\label{lem:normalization}
An admissible continuous-arc drawing of a finite simple graph can be
replaced by a polygonal drawing with no more crossing points, with
edges straight near every vertex and crossing, and with no crossings
between edges sharing an endpoint.  In particular, a drawing attaining
the ordinary crossing number can be chosen to have these properties.
```

(a) 逐字引用见上，位置 `normalization.tex:10-17`；适用范围见 `normalization.tex:4-8`：

```
This appendix supplies the drawing reduction used in
Section~\ref{sec:intersections}.  The argument applies to any finite
simple graph and counts every crossing point separately. The removal
of adjacent-edge crossings is a standard ordinary-crossing reduction
\cite{FulekEtAl2012}; we include the continuous-arc details.
```

(b) 我把证明的中间步骤补成这样四段，`normalization.tex` 的四个 `\emph{}` 小标题就是它的骨架：隔离标记、替换外部片段、填充圆盘、消除相邻边交点。第一步"隔离"（`normalization.tex:20-33`，见上节引用块）里，论文的写法是：把顶点与交点统称 marks，对每条边用单射参数化 $\gamma_e:[0,1]\to\R^2$，在每个 mark 的参数附近取闭包两两不交的邻域，端点 $0,1$ 用单侧邻域。我补的推理是这一步为什么必须有"正距离"论证：$\gamma_e$ 限制在紧集 $[0,1]\setminus(\text{邻域})$ 上，像集紧，而 $w$ 不在该像集里，紧集与点到它的距离在 Hausdorff 意义下取到最小值，所以距离为正；这一步是后面能选出一族两两不交的闭圆盘 $D_w$ 的唯一理由。我具体核对了几何可行性：mark 的总数是 $c(D)$ 加顶点数，有限，所以"两两不交的圆盘 + 每条边只在指定邻域内进入对应圆盘"这个联合条件是一有限族分离条件，逐条实现后用标准的取小半径论证合并即可。非关联的边要完全避开 $D_w$，靠的也是同一个正距离。

第二步是"挖掉中间保留外部"。`normalization.tex:35-49` 逐字（已 `sed` 实测）：

```
For an interior mark on $e$, remove the parameter interval from the
first to the last visit to $D_w$.  This removes the intervening
excursions too.  At the starting endpoint remove the interval through
the last visit to its disk; at the terminal endpoint remove the
interval from the first visit to its disk.  These removed intervals
are disjoint along each edge.  The retained middle pieces are compact
arcs with endpoints on disk boundaries and interiors in
\[
 \Omega=\R^2\setminus\bigcup_w D_w.
\]
They are pairwise disjoint, with distinct endpoints: every possible
intersection in the original drawing was a mark and has been removed.
This construction uses the first and last visits to each \emph{closed}
disk, which exist by compactness.  It does not require an arc to cross
a round disk boundary only finitely many times.
```

这里我要把一处我自己一开始读反的地方写下来。我原先以为证明要"先把边微扰成只穿过圆盘边界有限次"，那样的话就得先证明微扰不产生新交点，是个循环。论文最后三行明确拒绝这条路：它用"首次进入与最后一次离开闭圆盘"这两个参数，中间那段无论怎么震荡都整段挖掉，因此根本不问边界穿越次数。这个设计是有代价的：挖掉中间会把不属于这个 mark 的其它 excursion 一起删掉，所以必须保证被删的片段里没有别的关键信息；而任何别的关键信息（顶点或交点）本身也是 mark、其邻域也已被挖，所以删除只可能删掉纯外部的弧。这个论证的严密性依赖"mark 只有有限个"与"$D_w$ 两两不交"，两条都在第一步拿到。

(c) 机械理由逐个说。为什么必须是闭圆盘，并非开圆盘：取"首次进入/最后离开"要求该参数集非空闭，紧性保证最值取到；若用开邻域，边可能贴着边界进出无穷次而没有"最后一次"。为什么端点用单侧邻域：$\gamma_e(0)=a_i$ 是顶点，参数区间在 $0$ 处只能往右取，否则超出定义域。为什么"no more crossing points"是自动的：新画法的所有跨边交点都被塞进原来的 crossing 圆盘内部，`normalization.tex:94-101`（逐字引用见上节块）里那句 `Every inter-edge crossing lies in an original crossing disk, with at most one crossing in that disk and no third edge there` 就是计数口径的落点，至多一个意味着点数不减反可能减少。为什么圆盘里两根弦最多交一次，`normalization.tex:83-92` 逐字：

```
\emph{Filling the disks.}
In a crossing disk join each of its two pairs of boundary endpoints
by a straight chord.  The four endpoints are distinct.  The chords
can therefore meet at most once, and any meeting is an interior
transverse crossing: a line cannot contain four distinct points of a
circle.  In a vertex disk choose a new vertex point in its interior
off the finitely many lines through pairs of its boundary endpoints,
and join all the endpoints to it by straight spokes.  These spokes
meet only at the vertex.  The new vertex points in different disks
are distinct.
```

我补的关键一句是"a line cannot contain four distinct points of a circle"为什么够用：圆上一条直线最多截两点，所以两弦若共享一个端点就已在圆上占了三点的两个，而这里四端点两两不同，于是一条直线至多含其中两点；两弦若相交于两点，则这两点决定的直线含四个圆上点，矛盾。交点必然在内部，是因为端点都在圆周上、弦的内部在开圆盘里。横截性也是免费的：两弦交于内点时方向不同（否则共线，回到刚才的矛盾），局部就是两根过中心的直径，满足 `introduction.tex:7-9` 的 proper crossing 定义。顶点圆盘里那句"避开有限多条连线"给出新顶点位置的存在性：有限个超平面（这里是有限条直线）不能覆盖开圆盘，随便取一个补集中的点即可，这是典型的取一般位置论证。

(d) 候选失败路线，标 `[推测]`。其一：直接对每条边做整体折线逼近而不挖圆盘。它会在原交点附近造出重数失控的交点列（一条震荡的弧被折线近似后与另一条弧可能相交很多次），点数上界立刻失效；要修就得回到本引理的"圆盘内至多一点"策略，绕回来。其二：先假设画法是"好画法"（比如边是分段线性且交点横截）再证归一化，把连续弧的定义换成折线定义。这在数学上够用，但会让 $\crn$ 的定义依赖近似可行性，与 `introduction.tex:14-17` 的 $\min_D$ 口径（顶点位置与边路线毫无限制）冲突，读者要额外接受一次近似论证；论文选择把这段苦工写进附录，说明它想自证到底。其三：在顶点圆盘里保留原来的扇出顺序而不重排成新顶点，直接用星形放射。问题是原来的边在顶点附近可能是弯的，"靠近顶点处为直线"这个性质就丢了，而第 4 节 $T_v$ 的定义（`intersections.tex:19-20`："At a vertex $v$, choose a gap between consecutive outward spokes and list the incident edges counterclockwise from that gap"）要求顶点附近必须有明确的"外向辐条"及其循环顺序，这一条性质正是这里换来的。

## 3 相邻边交点的消除与三线共点的排除

`lem:normalization` 里最难的一步是"共享端点的两边不再相交"。论文的写法在 `normalization.tex:103-113`，逐字：

```
\emph{Removing adjacent-edge crossings.}
Suppose two polygonal edges $e=vu$ and $f=vw$ sharing $v$ cross at
$x$.  As the graph is simple, $u\ne w$.  Choose a small round disk
about $x$ that meets only the two straight crossing strands and
contains no other mark or bend.  Swap the portions of $e$ and $f$
from $v$ up to this disk, then connect the swapped prefixes to the
original suffixes.  Inside the disk this pairs adjacent boundary
endpoints, so two disjoint chords make the reconnections.  The result
is a walk from $v$ to $u$ and a walk from $v$ to $w$.  The crossing
at $x$ has disappeared.  Outside the disk every old open track is
assigned exactly once in total to the two new walks.
```

(b) 我把这一步补到中间步骤。局部模型：$x$ 是两条直 strands 的横截交点，圆盘 $D_x$ 只截这两条 strand，边界上有四个点，按圆周的循环顺序是"进来、出去、进来、出去"两两配对为同一条边的两端。原图的配对是交叉配对（这是"$x$ 是交点"的几何含义），新的配对必须是不交叉配对。论文的"pairs adjacent boundary endpoints"就是这句：把圆周上相邻的两个端点连一条弦，另一对相邻端点连另一条弦，这两条弦在圆盘内不相交。我核对不交性：两条弦不相交当且仅当它们的端点在圆周上不交错；相邻配对显然不交错（每条弦的两个端点在圆周上相邻）。为什么这样接出来的两条轨是"$v$ 到 $u$"与"$v$ 到 $w$"的行走：$D_x$ 把原图切成外部若干弧与内部四段；$e$ 从 $v$ 出发进 $D_x$、$f$ 从 $v$ 出发进 $D_x$，交换前缀等于把"$v$ 侧的两段"与"$u,w$ 侧的两段"重新分配，相邻配对使 $v$ 侧两条都以 $v$ 为端、外部两条分别通往 $u$ 与 $w$，于是得到两条从 $v$ 出发的行走。这里 `As the graph is simple, $u\ne w$` 这一句的用途我先前忽略了，现在补上：若 $u=w$，则 $e,f$ 是两个公共端点相同的边，简单图不允许，所以两条新行走的目标确实不同，重连时不会出现两条轨同去一个顶点导致后续讨论"与第三边相交"含糊不清。

新轨可能自交，论文用删除闭子行走（去圈）来化简，`normalization.tex:115-134` 那一大段（我在上一节的引用块里给了逐字前半，这里补它的关键后半）我逐条重走：先去圈得到简单折线，再检查容许性没有被破坏。核心是三种情形穷举：某个旧交点 $y\ne x$ 处，$e,f$ 的两条直行轨可能分属新图中的两条不同行走，也可能都属于同一条行走；前一种情形每条行走只过一次 $y$，去圈要么删掉这次通过、要么保留原样直行，所以不会引入"在某点转弯"的新情形；后一种情形去圈后可能在 $y$ 处转弯，但那里没有第二条边也没有第三边，转弯无害。与第三边的交点落在被两条行走总共至多访问一次的轨上，保留的通道是直行的。这四句话合起来是我认为整个附录里最容易被略写过去、却不能略的一段，而它明确用了定义里的排除条款，`normalization.tex:129-130`：

```
These observations cover every possible meeting:
the original drawing had no triple crossings and no common subarcs.
```

(c) 于是"三线共点为何可排除"这件事，我的答案是它在本题里由定义直接禁止，轮不到排除这一步：`introduction.tex:10-11` 那句 `with no triple crossings, tangencies, or common subarcs` 已经把它写进容许性。真正需要论证的是"去圈操作不会把三线共点造出来"以及"不会把共子弧造出来"。这两件事的检查是：新交点只在 $D_x$ 外部原有的旧交点上出现，去圈只是删段，因此任何一点处的边集合与旧图同侧或为子集，旧图里没有第三边在场的地方新图也不会有；共子弧更不可能，因为所有新弧段都取自原来的开轨或 $D_x$ 内部的弦，而每个旧开轨总共被分配恰好一次（`normalization.tex:112-113`："Outside the disk every old open track is assigned exactly once in total to the two new walks"），两条新行走不可能共享同一段。这一段推理我读出来的关键点是"恰好一次"这个措辞：它是防共子弧的锁。

终止性也有明确的机械理由，`normalization.tex:136-143`：

```
The crossing at $x$ has been removed and none has been added.
Repeat this operation while an adjacent-edge crossing remains.  The
nonnegative integer crossing count decreases at every step, so the
process terminates.  Remaining crossings are still locally straight;
any new turn occurs away from all other edges.  The straight spokes
at vertices are merely reassigned among the two incident edges.
Small disjoint vertex, crossing, and bend disks can be chosen afresh
afterwards.  This proves all asserted properties.
```

计数是自然数，每步严格减一，必然停。`any new turn occurs away from all other edges` 这句我读成：交换后的新转弯只出现在 $D_x$ 的边界接入处与 $v$ 附近的辐条重排处，而这些位置都没有别的边，所以后续第 4 节里"两条边交点处两边都是直的"（`intersections.tex:10-11`：`edges to be polygonal, straight in a neighborhood of every crossing and vertex`）仍成立。辐条重排那句 `The straight spokes at vertices are merely reassigned among the two incident edges` 对我很重要，因为它说明归一化不改变顶点处的循环序到哪个程度：$v$ 处外向辐条的集合不变、只是哪根属于 $e$ 哪根属于 $f$ 的标签换了，而换标签后循环序的相对位置可能改变，这一点我在第 6 节反推 $T_v$ 的歧义时要回头看。

(d) 候选失败路线，标 `[推测]`。其一：不在 $x$ 处交换前缀，改把整条 $e$ 从 $v$ 到 $x$ 的部分改道到 $f$ 外部绕过去。这种"绕开"的做法必然要穿过别的边或顶点圆盘来保证路径存在，交点数会上升，直接毁掉"no more crossing points"。其二：用一般位置微扰把相邻交点变成偶数个交点后配对消掉（类似 Reidemeister 型的两交点相消）。在无相邻交点约束下这条微扰不减少点数，而且它破坏"每次操作交点数严格下降"的终止性度量，还得另找势函数。其三：先证"存在最小画法"再对最小画法做交换。这个顺序有隐蔽问题：$\min_D$ 是否取到在连续弧定义下需要额外论证（点数是自然数、可数选择即可，见下），而把归一化写成对任意容许画法的操作，就完全绕过了最小性；更麻烦的是若只对最小画法操作，交换后得到的画法仍是容许的且点数不增，等于原地重启论证，反而多了一层。Lean 侧的做法我在第 15 节会对照：机器版本压根不要"最小画法"，它对每个 `AdmissibleDrawing` 都证下界。

## 4 带符号交矩阵 $J$：那半项是被逼出来的

(a) 三段逐字。先是设置与 $I$，`intersections.tex:8-18`（引用见第 2 节末的块），其中定义性的两句是 `Orient the edge $ip$ from $a_i$ to $b_p$.`（第 13 行）与

```
For oriented edges $e,f$, let $I(e,f)$ be the sum of the signs of their
interior crossings.  A crossing is positive when the ordered directions
of $e$ and $f$ give the positive orientation of the plane.  Set
$I(e,e)=0$.
```

这是 `intersections.tex:15-18`。再是 $T_v$ 与 $\sigma_{ve}$，`intersections.tex:19-34`：

```
At a vertex $v$, choose a gap between consecutive outward spokes and list
the incident edges counterclockwise from that gap.  Define
\[
 T_v(e,f)=
 \begin{cases}
  1,&e\text{ precedes }f,\\
  -1,&f\text{ precedes }e,\\
  0,&e=f,
 \end{cases}
 \qquad
 \sigma_{ve}=
 \begin{cases}
  1,&e\text{ is oriented out of }v,\\
  -1,&e\text{ is oriented into }v.
 \end{cases}
\]
```

然后是核心定义 `intersections.tex:36-42`（`eq:signed-J`）：

```
 \label{eq:signed-J}
 J(e,f)=I(e,f)+\frac12
 \sum_{\substack{v\text{ an endpoint}\\\text{of both }e,f}}
 \sigma_{ve}\sigma_{vf}T_v(e,f),
 \qquad J^{ik}(p,q)=J(ip,kq).
```

以及命题本体，`intersections.tex:46-56`（我把引理环境与 `eq:cycle-pairing` 一并实测）：

```
\begin{lemma}[Cycle pairing]
\label{lem:cycle-pairing}
Let $z,y\in\R^{E(K_{m,n})}$ be the signed edge vectors of two oriented
simple graph cycles: an entry is $1$ or $-1$ according as the traversal
agrees or disagrees with the fixed edge orientation, and is $0$ on an
unused edge.  Then
\begin{equation}
 \label{eq:cycle-pairing}
 z^{\mathsf T}Jy=0.
\end{equation}
```

论文自己给了这句的功能解释，`intersections.tex:43-45`：`Thus $J^{ik}$ is an $n\times n$ block.  The half-order term records the local contribution of a common endpoint to an intersection of cycles.`

(b) 我先做的是把 $J$ 的结构自己展开一遍，检验它是否被过度设计。对 $K_{m,n}$ 的边 $ip$、$kq$，"$v$ 是二者公共端点"只有三种可能：$i=k$ 时 $v=a_i$；$p=q$ 时 $v=b_p$；$i=k$ 且 $p=q$ 时是同一条边。所以 `eq:signed-J` 那个求和至多一项非零，$J^{ik}(p,q)$ 的局部项只在 $i=k$ 或 $p=q$ 时出现。定向固定为 $a$ 侧出、$b$ 侧进，于是 $\sigma_{a_i,ip}=+1$、$\sigma_{b_p,ip}=-1$，两个同号相乘永远是 $+1$。这一步我算出来的结论是：$\sigma\sigma$ 这个因子在 $K_{m,n}$ 上其实恒等于 $1$。它为什么还写在定义里？我读到的理由是普适性：`eq:signed-J` 是对任意有向图的边写的，$z,y$ 是任意有向圈的向量，$J$ 若只想服务二分图可以省掉 $\sigma$，但省掉之后引理 `lem:cycle-pairing` 就不再对一般图成立，归一化引理（对任意有限简单图陈述）与圈配对就脱了钩。这是我反推出的"作者多写一个因子的动机"，论文没说，标 `[推测]`。

我另外验了一个必然成立的自检：$I(f,e)=-I(e,f)$（交换两方向，交点符号反号），$T_v$ 反对称而 $\sigma\sigma$ 对称，所以 $J$ 整体反对称，对角为 $0$（$I(e,e):=0$ 加上 $T_v(e,e)=0$）。因此 $z^{\mathsf T}Jz=0$ 是免费的，`lem:cycle-pairing` 里 "$z,y$ 可为同一圈" 这种最容易被质疑的情形自动不矛盾；同时 $J^{ki}=-(J^{ik})^{\mathsf T}$，意味着第 11 节里 $c_{ik}$ 与 $c_{ki}$ 的对称性有矩阵层面的对应。

再补一步 $J^{ii}$ 的显式值，这是后面 rank 下界的燃料。$J^{ii}(p,q)$：两边 $ip,iq$ 共享 $a_i$，归一化保证它们不相交，故 $I(ip,iq)=0$；局部项在 $p=q$ 时为 $0$。所以 $J^{ii}(p,q)=\frac12 T_{a_i}(ip,iq)$，正是"顶点 $a_i$ 处那个线性辐条序的一半符号矩阵"。论文在 `conclusion.tex:57-60` 写的正是这句话：

```
All edges in the star at $a_i$ are oriented outward and do not cross one
another. Consequently $J^{ii}$ is exactly half the sign matrix of the
linear spoke order at $a_i$. Lemma~\ref{lem:detector} gives
```

对照 `detector.tex:96-105` 的 $S_\prec$ 定义，两处一致到系数 $\frac12$。而 $i\ne k$ 的对角元 $J^{ik}(p,p)$ 是另一种混合：$I(ip,kp)=0$（共端点 $b_p$，归一化禁止），局部项 $\frac12 T_{b_p}(ip,kp)$ 未必为 $0$，所以这个块的对角线上残留 $b_p$ 处的顺序信息；`conclusion.tex:65-70` 明说了这一点并交给 $\Phi$ 处理：

```
For $i\ne k$, let $c_{ik}$ be the number of crossing points between
edges incident with $a_i$ and edges incident with $a_k$.
The entries $J^{ik}(p,p)$ may contain a local term at $b_p$, but $\Phi$
annihilates all diagonal entries: the factor $x_p-x_q$ in
\eqref{eq:detector-definition} makes $B_{pp}=0$.
```

(c) 假设与常数的逐个理由。$\frac12$ 的来源不是归一化，我在第 5 节会看到它来自弦公式 `eq:chord-formula`（`intersections.tex:69-73`）里的 $\frac12$，而 $\pm$ 两次平移的"平均"负责的是另一件事：把同一根辐条上两个版本的相反序号抹成 $0$，与 $T_v(e,e)=0$ 对齐（`intersections.tex:144-146`：`For the same spoke, the two shifted endpoints lie on opposite sides of the unshifted endpoint in the boundary order.  Their comparison signs therefore average to zero, as required by $T_v(e,e)=0.$`）。$I(e,e)=0$ 这个人为约定是必需的，否则 $z^{\mathsf T}Jz$ 会出现自交项而破坏反对称。"choose a gap"这个动作在定义里是一次性的自由：每个顶点独立选 gap，$T_v$ 才成为函数；我在第 6 节会给出换 gap 的后果计算，并说明它为何恰好落在 $\mathcal L$ 里，因此这个自由最后不需要被约束。"$ Independent edges may still cross several times"（`intersections.tex:12`）这条许可是本题口径的命门：正因为允许重交，$I$ 只能是带符号和，而第 11 节的不等式要靠"符号相消只会让非零元更少"把它拉回点数（`conclusion.tex:78-80`）。

(d) 候选失败路线，均标 `[推测]`。其一：只用 $I$、不加热项。那么在一个无交点的画法里 $J\equiv0$，`lem:cycle-pairing` 成为空话，整个链条没有任何信息；具体地，第 11 节的对角块 $\rank R_{ii}=d$ 会失去来源，因为 $I$ 不提供任何顶点顺序信息，下界 $2d_md_n$ 就无从冒头。其二：把热项写成不带符号的"是否相邻"计数，或者用 $|T_v|$。这样 $J$ 不再反对称，$z^{\mathsf T}Jy=0$ 也不成立：两个圈在共享顶点处的通过方向相反时，无符号版本给不出反号抵消。其三：用模 $2$ 的交点数（奇偶口径）代替带符号和。偶数次的重交会完全消失，而本题的 $c(D)$ 是点数（`introduction.tex:12-13`），一次信息丢失就把下界压成 $0.9118$ 那个量级都无法保证的弱命题；`introduction.tex:37-39` 那段口径声明读起来像是在防这条路的诱惑。

## 5 弦公式、平移轨道与锥体论证

`lem:cycle-pairing` 的证明有四块：圆内弦的局部公式、两条圈的折线化、逐顶点圆盘算局部项、闭合折线总交为零。我按这四块补中间步骤。

(a) 局部公式，`intersections.tex:61-66` 与 `intersections.tex:69-73`：

```
We first establish the local formula that explains the factor $1/2$.
Let $C$ and $E$ be oriented chords of a round disk, with four distinct
boundary endpoints.  Give each chord's start coefficient $-1$ and its
end coefficient $+1$; write these coefficients as $\epsilon_C(u)$ and
$\epsilon_E(w)$.  For a cut in the boundary away from the endpoints,
```

```
 \label{eq:chord-formula}
 I(C,E)=\frac12\sum_{u\in\partial C}\sum_{w\in\partial E}
       \epsilon_C(u)\epsilon_E(w)T(u,w).
```

(b) 论文紧接着给的论证我逐步重演，`intersections.tex:74-86`（前半实测见上引块）：把 cut 越过一个端点，右边变化的量是"另一个弦的两个端点系数之和"的倍数，而 $\epsilon_E$ 在一个弦的两端是 $-1$ 与 $+1$，和为零，所以右边与 cut 位置无关。这一步是 $\frac12$ 能出现的结构性原因：右端本来依赖 cut，靠"每条弦的系数和为零"才变成不变量，因此可以随意把 cut 放在 $C$ 的起点之前。cut 就位后，四个二项求和塌成一条：`intersections.tex:78-82`

```
 -\sum_{\substack{w\text{ on the open counterclockwise arc}\\
                 \text{from the start to the end of }C}}
        \epsilon_E(w).
```

我补的是这条式的来历：cut 在 $C$ 的起点前，$u$ 取 $C$ 的两端。$u$ 为 $C$ 起点时 $\epsilon_C=-1$，与 $T(u,w)$ 相乘：所有 $w$ 都在 cut 之后，故 $u$ 先于 $w$ 时 $T=+1$... 这里我把四种 $w$ 的位置写全。以 $C$ 的起点为 cut、逆时针列出圆周，$C$ 的终点在某处；$w$ 若落在开弧（起点到终点之间）则 $T(u_{\text{start}},w)=+1$、$T(u_{\text{end}},w)=-1$；若落在补弧则相反。于是 $u$ 求和后每个 $w$ 的净系数是 $(-1)(+1)+(1)(-1)=-2$（开弧）或 $(-1)(-1)+(1)(+1)=+2$（补弧）？我把 $u_{\text{end}}$ 的位置也算进 cut 序：$u_{\text{end}}$ 在 cut 之后，对开弧里的 $w$，若 $w$ 在 $u_{\text{end}}$ 之前则 $T(u_{\text{end}},w)=-1$、若之后则 $+1$。这说明塌成单条和必须把 $w=u_{\text{end}}$ 一类的情形排除，而四个端点两两不同的假设正管这里。结论是 $\frac12$ 与系数 $\pm2$ 相消，剩下 $-\sum_{w\in\text{开弧}}\epsilon_E(w)$，与论文第 79-82 行一致，而 `intersections.tex:83-86` 给出几何判决：

```
That boundary arc is on the right of the directed chord $C$.  The sum
is zero for nonalternating endpoints; for alternating endpoints it is
$+1$ when $E$ runs from right to left across $C$, and $-1$ in the reverse
case.  These are exactly the signed intersection values.
```

我自己重画四种端点排布验证：$E$ 的两端落在 $C$ 两侧（交错）时，开弧里恰含 $E$ 的一个端点，和为 $\pm1$；两端同侧时和为 $0$。方向 $E$ 从右往左穿 $C$ 对应交点处 $(C,E)$ 的定向，与 `intersections.tex:16-17` 的正负号定义吻合。这一步我承认原先担心过"$\frac12$ 会不会导致半整数 $I$"：弦端点系数是 $\pm1$、开弧内和是 $\pm1$ 或 $0$，$\frac12\cdot(\pm2)=\pm1$，整数性保住。

(c) 四条边（$C$、$E$ 各两端）互不相同是这段公式的全部前提，也是第 2 节里"四个端点不同、故两弦至多一交"的同一族假设复用。$\epsilon$ 取 $-1$ 于起点、$+1$ 于终点，是为了与 $\sigma_{ve}$（出为 $+1$、入为 $-1$）在顶点圆盘里拼成 $\sigma_{ve}z_e$：`intersections.tex:136-139` 说 `The endpoint coefficient of its first chord on spoke $e$ is $\sigma_{ve}z_e$: an incoming traversal starts the chord and an outgoing traversal ends it.`。

(d) `[推测]` 路线一：跳过弦公式，直接对整条圈做一般位置微扰并用横截交的同调不变性。这样会丢掉 $\frac12$ 项的来源，而 $\frac12$ 是本证明最容易被审稿人追问的系数。`[推测]` 路线二：把 $E$ 只平移一次（只做 $\eta_+$）。那么同一根辐条上两个版本的序号抵消这一机制就没了，$T_v(e,e)=0$ 与计算结果不符，对角元出现依赖平移方向的 $\pm\frac12$ 伪迹，而这些伪迹在 $\Phi$ 那里不会被 $B_{pp}=0$ 清掉（它们出现在 $p\ne q$ 的位置上）。

折线化与平移轨道，`intersections.tex:92-100` 与 `intersections.tex:99-123`（前块逐字已实测）：第一条圈 $\gamma$ 用原轨加顶点圆盘里的弦；第二条圈做左移与右移两个版本 $\eta_\pm$，且在交叉圆盘里"沿平移后的直线继续走"。我补的中间判断是这句话为何成立：`In a crossing disk continue along the shifted line: it avoids its own original line and meets the other original line once, with the same crossing sign.`（`intersections.tex:107-109`）两条平行线不交，平移线与原线的另一条横截线在凸圆盘内交一次，且局部方向对与原来相同，故符号不变。转弯圆盘那段我逐字对照 `intersections.tex:110-115`：左移时入射线顺时针移动、出射线逆时针移动，两个位移端点都落在有向转弯的左侧扇形里，可用折线连上；右移用另一侧扇形。这一步是我认为全文里最像"手搓"的地方，它给出的结果是 `Finiteness permits one choice of shift size for the entire construction.`（第 117-118 行），即一次选定的平移量全局可用，理由是紧集两两不交则有统一正距离。

最后是"每对闭合折线的总带符号交为零"，`intersections.tex:157-173`（整块引用见上）。我把它补成锥体计数的显式对消：把 $\gamma$ 的每条有向段 $[u,w]$ 与外部点 $o$ 组成有向三角形 $[o,u,w]$，其边界为 $o\to u\to w\to o$。单个三角形边界与闭合行走 $\eta$ 的带符号交为零，理由是 $\eta$ 是闭的，进入三角形一次的次数必与离开一次配对、符号相反（三角形是闭圆盘，$\partial$ 与 $\eta$ 的交点按 $\eta$ 的参数序交替出现进/出）。把所有三角形的边界相加，内部锥边 $[o,u]$、$[w,o]$ 在相邻两个三角形里以相反定向各出现一次，端点链上首尾也抵消，剩下的正是 $\gamma$ 本身。因此 $\gamma$ 与 $\eta$ 的总交为零。$o$ 的取法要求避开有限多条直线（`intersections.tex:162-164`），这是"有限个坏超集不能覆盖平面"的同一手法，我在第 2 节的顶点圆盘一般位置已经用过一次。`intersections.tex:171-172` 那句 `The argument counts traversals and does not require either walk to be simple.` 我认为就是设计意图：$\gamma$ 与 $\eta_\pm$ 都可能有自交，用同调语言会立刻卡住，用三角形计数则无所谓。

## 6 additive block relation：我在这里才看懂 gap 的作用

(a) 空间与命题，`intersections.tex:181-194`：

```
We now extract the matrix relation needed below.  Let
\begin{equation}
 \label{eq:additive-space}
 \mathcal L=\bigl\{H\in\R^{n\times n}:
                H(p,q)=r_p+c_q\text{ for some }r,c\in\R^n\bigr\}.
\end{equation}

\begin{lemma}[Additive block relation]
\label{lem:additive}
For every $1\le i,k\le m$,
\begin{equation}
 \label{eq:additive-relation}
 J^{ik}-J^{i1}-J^{1k}+J^{11}\in\mathcal L.
\end{equation}
```

证明全文在 `intersections.tex:197-215`，关键块逐字：

```
Write the matrix on the left as $H$.  Fix row indices $p,p'$ and
column indices $q,q'$.  If $i\ne1$, $k\ne1$, $p\ne p'$, and $q\ne q'$,
use the four-cycle vector $z$ with entries $+1$ on $ip,1p'$ and
$-1$ on $ip',1p$, and the four-cycle vector $y$ with entries $+1$
on $kq,1q'$ and $-1$ on $kq',1q$.  Expanding
Lemma~\ref{lem:cycle-pairing} gives
\[
 0=z^{\mathsf T}Jy
   =H(p,q)-H(p,q')-H(p',q)+H(p',q').
\]
If any of those index differences is trivial, the same rectangular
difference vanishes directly.  Thus all rectangular differences of
$H$ vanish.  For any fixed $p_0,q_0$ this says
\[
 H(p,q)=H(p,q_0)+H(p_0,q)-H(p_0,q_0),
\]
which is the required row-plus-column form.
```

(b) 我把那句"Expanding Lemma 4.1 gives"真正展开。$z$ 的支撑是 $\{ip,1p',ip',1p\}$、系数 $+1,+1,-1,-1$；$y$ 的支撑是 $\{kq,1q',kq',1q\}$、系数 $+1,+1,-1,-1$。十六项乘积按块归类：块 $(i,k)$ 收到 $J^{ik}(p,q)$（系数 $+1$）、$-J^{ik}(p,q')$、$-J^{ik}(p',q)$、$+J^{ik}(p',q')$；块 $(i,1)$ 收 $+J^{i1}(p,q')-J^{i1}(p,q)-J^{i1}(p',q')+J^{i1}(p',q)$，按 $H$ 的定义这正好带负号；块 $(1,k)$ 同理带负号；块 $(1,1)$ 四项系数 $+1$（两个 $-1$ 相乘）正好是 $+J^{11}(p',q')$ 型。合起来就是 $H(p,q)-H(p,q')-H(p',q)+H(p',q')$。这个归类我第一次手算时把 $(i,1)$ 块的符号弄反过，检查方法是代入 $z$ 的第 $1p$ 分量 $+1$、$y$ 的第 $1q$ 分量 $-1$，得 $-J^{11}(p,q)$，与 $-H$ 里 $J^{11}(p,q)$ 前的符号一致，说明我第一版的整体符号约定颠倒了。顺带确认这两条"四圈"是合法的：$z$ 对应的有向圈是 $a_i\to b_p\to a_1\to b_{p'}\to a_i$，其中第二段走的是 $1p$ 的反向（系数 $-1$）、第四段是 $1p'$ 的反向？我核对：从 $b_p$ 到 $a_1$ 用边 $1p$ 反向，系数 $-1$ 与"$-1$ on $1p$"一致；从 $a_1$ 到 $b_{p'}$ 用边 $1p'$ 正向，"$+1$ on $1p'$"一致；从 $b_{p'}$ 回 $a_i$ 用 $ip'$ 反向，"$-1$ on $ip'$"一致。闭合、四点两两不同（要求 $i\ne1$、$p\ne p'$），是 $K_{m,n}$ 的 $4$-圈。

退化四种情形我逐个交代，因为论文只写了一句 "If any of those index differences is trivial"。$i=1$ 时 $H=J^{1k}-J^{11}-J^{1k}+J^{11}=0$，矩形差自然为零；$k=1$ 同理。$p=p'$ 时 $H(p,q)-H(p,q')-H(p,q)+H(p,q')=0$ 恒等；$q=q'$ 同理。所以非退化情形覆盖其余全部，四圈论证合法（它需要 $i\ne1$、$k\ne1$、$p\ne p'$、$q\ne q'$ 四个条件同时成立，正好是论文的 if 子句）。

最后那段纯线性代数我补全：矩形差全零意味着取任意定基 $(p_0,q_0)$，令 $r_p=H(p,q_0)-H(p_0,q_0)$、$c_q=H(p_0,q)$，则 $r_p+c_q=H(p,q_0)-H(p_0,q_0)+H(p_0,q)$，而矩形差在 $(p,q),(p,q_0),(p_0,q),(p_0,q_0)$ 上给出 $H(p,q)=H(p,q_0)+H(p_0,q)-H(p_0,q_0)$，两式相同。反过来显然：任何 $r_p+c_q$ 的矩形差为零。所以 $\mathcal L$ 恰是"矩形差算子的核"，$\dim\mathcal L=2n-1$（参数 $r,c$ 共 $2n$ 个，$(r+\lambda,\,c-\lambda)$ 给同一矩阵，冗余 $1$ 维）。

(c) 这里是我整个反推里最亮的一处，我把它写成计算，并非感想。换掉 $a_i$ 处的 gap 会怎样改变 $J^{ii}$？设原列表为 $(1,2,\dots,n)$，把 cut 移到第 $k$ 与第 $k+1$ 个辐条之间，新位置函数是 $\operatorname{pos}'(j)=j-k$（$j>k$）或 $j-k+n$（$j\le k$）。同侧的两条辐条先后关系不变；跨 cut 的 $(p\le k<q)$ 关系翻转，由 $+1$ 变 $-1$；$(q\le k<p)$ 由 $-1$ 变 $+1$。于是差矩阵 $D(p,q)=T'(p,q)-T(p,q)$ 满足：同侧为 $0$、$p\in A,q\notin A$ 时为 $-2$、反向为 $+2$。我验证 $D$ 具有 $r_p+c_q$ 形式：令 $r_p=-\alpha$（$p\in A$）、$r_p=-\beta$（$p\notin A$）、$c_q=\alpha$（$q\in A$）、$c_q=\beta$（$q\notin A$），同侧给 $\beta-\beta=0$ 与 $-\alpha+\alpha=0$，跨块给 $\beta-\alpha$ 与 $\alpha-\beta$；取 $\alpha=1,\beta=-1$ 得 $\pm2$，完全吻合。所以换 gap 的代价是 $J^{ii}$ 加一个 $\frac12 D\in\mathcal L$ 的元素。

这个计算给了我一条论文没有明说的理解线：`lem:additive` 之所以要把结论弱化成"模 $\mathcal L$"，正是因为 $J^{ik}$ 里的局部项依赖每个顶点各自独立的 gap 选择，而 $\mathcal L$ 恰好是这些选择所张开的歧义空间；`detector.tex:5-7` 说 $\Phi` annihilates the additive ambiguity in Lemma~\ref{lem:additive}，配合 `conclusion.tex:48-52` 的 `Lemma~\ref{lem:additive} and the annihilation property of $\Phi$ imply` 与 `R_{ik}=X_i-Y_k`，闭合了整条逻辑：我不需要证明各顶点 gap 相容，只需要一个把 $\mathcal L$ 杀掉的线性映射。`eq:detector-support-bound`（`detector.tex:129-132`）与 $B_{pp}=0$ 则负责把 $b_p$ 侧的残留也清掉。

(d) `[推测]` 其一：试图证明 $J^{ik}$ 本身（不加 gap）满足矩形差为零。这在 $m,n$ 都大于 $2$ 时不成立，因为 $\mathcal L$ 非零而 $J$ 的对角块携带纯局部信息；真要有这种"强关系"，就得要求所有顶点的 gap 由某个全局规则选出，而画法里不存在这样的规则。`[推测]` 其二：用四个自由指标 $i,k,p,q$ 直接对 $J$ 做双线性化，跳过四圈。这样得到的关系会依赖 $z^{\mathsf T}Jy$ 对所有向量，并非圈向量为零，而 $J$ 只是反对称矩阵，一般向量对不满足。`[推测]` 其三：把 $\mathcal L$ 换成"对角为零的反对称矩阵空间"再求正交补。这个空间与 $\mathcal L$ 不相容（$\mathcal L$ 里的矩阵一般不对称也不反对称，因为 $r_p+c_q$ 与 $r_q+c_p$ 无关），会算错消掉的自由度数目，而 $\Phi$ 的值域维数 $d=s^2$ 是被 $|Q_s|$ 精确钉住的（见第 9 节），没有容错余量。

## 7 子空间交不等式：代数核心与其外部血统

这一节是全篇我最不愿意承认、却必须承认的一节：它与图形毫无关系。论文自己给了这个自我定位，`subspaces.tex:4-9`：

```
The algebraic estimate behind the lower bound concerns arbitrary pairs of
subspaces.  The only hypothesis is that each subspace is disjoint from its
designated partner. Polynomial determinants have also been used to
control sums of intersection dimensions in subspace designs
\cite{GuruswamiKopparty2016}. Here the degree filtration is adapted
to the arbitrary family $U_i$, and all details are proved below.
```

(a) 命题，`subspaces.tex:11-21`：

```
\begin{lemma}[Subspace intersection bound]
\label{lem:subspace}
Let $W$ be a real vector space of dimension $N$, and let
$U_1,\ldots,U_m,V_1,\ldots,V_m$ be subspaces of $W$, where $m\geq1$.
If $U_i\cap V_i=\{0\}$ for every $i$, then
\begin{equation}
\label{eq:subspace-bound}
  \sum_{i,j=1}^{m}\dim(U_i\cap V_j)
  \leq \left\lfloor\frac{m^2}{4}\right\rfloor N.
\end{equation}
\end{lemma}
```

证明的路标写在 `subspaces.tex:24-29`：把子空间编码成多项式求值约束、在非节点处求值得到滤链、在节点处用不相交性限制求值秩、秩亏损给出子式消失阶的下界、与子式次数比较、对滤链求和。约束空间的定义在 `subspaces.tex:31-43`：

```
Choose distinct real numbers $t_1,\ldots,t_m$.  For a subspace $Z\subseteq W$
and an integer $h\geq0$, define
\[
  \mathcal P_h(Z)=
  \{P\in Z[\xi]:\deg P\leq h,\ P(t_i)\in U_i\text{ for every }i\},
  \qquad \mathcal P_{-1}(Z)=\{0\}.
\]
Here $Z[\xi]$ denotes polynomials whose coefficients belong to $Z$.
Write $E_h(Z;t)=\{P(t):P\in\mathcal P_h(Z)\}$ and put
\[
  k_h(Z)=\dim\mathcal P_h(Z)-\dim\mathcal P_{h-1}(Z),
  \qquad k_{-1}(Z)=0.
\]
```

(b) 我逐段把中间步骤补齐。

第一步（`subspaces.tex:45-58`，引用见上一批）：核心理由是"除以 $\xi-t$ 保持系数空间 $Z$，且保持每个节点约束"，因为 $t_i-t\ne0$。我把这句话展开成双向包含。若 $P\in\mathcal P_h(Z)$ 且 $P(t)=0$，做带余除法 $P=(\xi-t)Q+\text{const}$，常数项为 $0$，故 $P=(\xi-t)Q$，$Q$ 的系数是 $P$ 的系数的线性组合（综合除法），仍在 $Z$ 里；$\deg Q\le h-1$；在节点处 $Q(t_i)=P(t_i)/(t_i-t)\in U_i$（$U_i$ 是子空间，数乘封闭，且 $t_i-t\ne0$）。所以 $Q\in\mathcal P_{h-1}(Z)$，反向乘回去同理。于是 $\dim E_h(Z;t)=\dim\mathcal P_h(Z)-\dim\mathcal P_{h-1}(Z)=k_h(Z)$，这是 `eq:filtration-evaluation`。这里的机械理由我要点明：$k_h(Z)$ 之所以是"非节点处的求值空间维数"，靠的是秩零化度定理与 $\ker=\mathcal P_{h-1}$ 的像 $(\xi-t)\mathcal P_{h-1}$，而 $(\xi-t)$ 乘上是单射。

第二步（`subspaces.tex:59-75`）：在全部 $m$ 个节点上求值是 $\mathcal P_{m-1}(Z)\to\bigoplus_i(U_i\cap Z)$ 的同构。我补逆映射的合法性：Lagrange 基 $L_i(\xi)=\prod_{k\ne i}(\xi-t_k)/(t_i-t_k)$ 次数 $m-1$，故 $\sum_i L_i(\xi)z_i$ 次数 $\le m-1$、系数在 $Z$（$z_i\in U_i\cap Z$）、在节点 $t_j$ 处取 $z_j\in U_j$，所以属于 $\mathcal P_{m-1}(Z)$。唯一性那段（`subspaces.tex:67-68`：`Uniqueness follows because a scalar polynomial of degree at most $m-1$ with $m$ distinct roots vanishes, applied in coordinates of $Z$.`）我读成：两个原像之差 $P$ 在 $m$ 个节点为零，取 $W$ 的任意线性泛函复合到 $Z$ 方向得到次数 $\le m-1$ 有 $m$ 个根的数量多项式，故为零；对所有坐标泛函成立即 $P\equiv0$。由此得 `eq:filtration-sum`：$\sum_{h=0}^{m-1}k_h(Z)=\dim\mathcal P_{m-1}(Z)=\sum_i\dim(U_i\cap Z)$。左边的望远镜求和用 $k_{-1}=0$，这正是 $\mathcal P_{-1}(Z)=\{0\}$ 约定的用途。取 $Z=V_j$ 时，$\sum_i\dim(U_i\cap V_j)$ 恰好是我们要求的目标项之一，这一步的替换我在第 8 节末会用到。

第三步（`subspaces.tex:77-95`）：固定 $t_*$ 在非节点处，$E_h(W;t_*)$ 随 $h$ 递增（因为 $\mathcal P_h\subseteq\mathcal P_{h+1}$），所以 $\ell_h=k_h(W)-k_{h-1}(W)\ge0$。逐阶段选 $\ell_h$ 个多项式使其在 $t_*$ 处的值把已选基扩成 $E_h(W;t_*)$ 的基，$M_h$ 是前 $h$ 阶段全部所选列排成的矩阵，有 $r_h=k_h(W)$ 列、在 $t_*$ 处线性无关，故存在 $r_h$ 阶子式 $\Delta_h$ 使 $\Delta_h(t_*)\ne0$。次数估计 `eq:minor-degree`（`subspaces.tex:91-94`：`\deg\Delta_h\leq\sum_{e=0}^{h}e\ell_e`）的中间步骤我补出来：行列式按置换展开，每项是 $r_h$ 个矩阵元的乘积，第 $e$ 阶段引入的 $\ell_e$ 列每列次数 $\le e$、每行只取一个元，所以单项次数至多为各列次数之和 $\sum_e e\ell_e$。$r_h=0$ 时用空行列式 $\Delta_h=1$（`subspaces.tex:95`），这个约定的必要性我在下面的 (c) 说明。

第四步（`subspaces.tex:97-116`）：节点处的秩损失 `eq:node-rank` $\dim E_h(W;t_j)\le k_h(W)-k_h(V_j)$。我把它拆成三小块。商映射 $\pi_j:W\to W/V_j$ 限制在 $E_h(V_j;t)$ 上为零，所以在非节点处 $\dim\pi_j(E_h(W;t))\le\dim E_h(W;t)-\dim E_h(V_j;t)=k_h(W)-k_h(V_j)$（这里用了 `eq:filtration-evaluation`，且要求 $\pi_j$ 限制在 $E_h(V_j;t)$ 上把整段映成 $0$，其像的维数至多是差）。把"非节点处的不等式"搬到节点 $t_j$ 处是这段的技术核心，论文的做法是：取 $\mathcal P_h(W)$ 的一组固定基，在变量 $\xi$ 处求值、投影，得到一个多项式矩阵；任何大于该秩上界的子式作为 $\xi$ 的多项式在无穷多个非节点处为零，因此是零多项式，故在 $\xi=t_j$ 处秩也不超界。我核对"无穷多个"这一条：$\mathbb R\setminus\{t_1,\dots,t_m\}$ 是无限集，非零多项式只有有限个根，所以确实处处为零即恒为零。这一步能过，全靠底域是 $\mathbb R$（无限域、特征零），这是我在 (d) 里要用到的。最后 $E_h(W;t_j)\subseteq U_j$（因为 $P(t_j)\in U_j$），而 $\pi_j$ 在 $U_j$ 上单射当且仅当 $U_j\cap V_j=\{0\}$，于是 $\dim E_h(W;t_j)=\dim\pi_j(E_h(W;t_j))$，界拿到。全引理唯一一次使用假设 $U_i\cap V_i=\{0\}$ 就在这半句里，这就是 `subspaces.tex:5-6` 说"The only hypothesis"的确切含义。

第五步（`subspaces.tex:118-139`）：亏损到重数。子矩阵在 $t_j$ 处秩亏损至少 $q=k_h(V_j)$，取 $q$ 个线性无关的核向量，扩成常值可逆列变换，变换后的 $q$ 列在 $t_j$ 处整列为零，故行列式被 $(\xi-t_j)^q$ 整除；列变换只把行列式乘上一个非零常数。各节点互异，故 $\prod_j(\xi-t_j)^{k_h(V_j)}$ 整除 $\Delta_h$。$r_h=0$ 时（`subspaces.tex:132-134`）所有 $k_h(V_j)=0$，空行列式情形一致。于是 `eq:multiplicity-budget`（`subspaces.tex:136-139`）：$\sum_j k_h(V_j)\le\sum_{e\le h}e\ell_e$。

第六步（`subspaces.tex:141-153`）：求和。逐字：

```
\emph{Summing the degree bounds.}
Sum \eqref{eq:multiplicity-budget} over $h=0,\ldots,m-1$ and apply
\eqref{eq:filtration-sum} with $Z=V_j$.  The result is
\begin{align*}
  \sum_{i,j=1}^{m}\dim(U_i\cap V_j)
  &\leq\sum_{h=0}^{m-1}\sum_{e=0}^{h}e\ell_e
   =\sum_{e=0}^{m-1}e(m-e)\ell_e\\
  &\leq\left\lfloor\frac{m^2}{4}\right\rfloor
           \sum_{e=0}^{m-1}\ell_e
   \leq\left\lfloor\frac{m^2}{4}\right\rfloor N.
\end{align*}
The last step uses
$\sum_e\ell_e=k_{m-1}(W)=\dim E_{m-1}(W;t_*)\leq N$.
```

(c) 指数与常数的机械理由，这一组我最在意。交换求和的顺序：区域是 $\{(h,e):0\le e\le h\le m-1\}$，固定 $e$ 时 $h$ 从 $e$ 到 $m-1$，共 $m-e$ 项，故 $\sum_h\sum_{e\le h}=\sum_e e(m-e)\ell_e$，那个 $m-e$ 是"计数"，并非"猜测"。$\max_{0\le e\le m-1}e(m-e)$ 在 $e=\lfloor m/2\rfloor$ 或 $\lceil m/2\rceil$ 取到，值是 $\lfloor m^2/4\rfloor$：$m=2r$ 时 $r\cdot r=r^2=\lfloor m^2/4\rfloor$；$m=2r+1$ 时 $r(r+1)=r^2+r=\lfloor(4r^2+4r+1)/4\rfloor$。取整符号是被 $e$ 必须为整数逼出来的，$\frac{m^2}{4}$ 本身在奇数时不可达。$\sum_e\ell_e=k_{m-1}(W)$ 的理由是望远镜：$\sum_{e=0}^{m-1}(k_e-k_{e-1})=k_{m-1}-k_{-1}=k_{m-1}$，用 $k_{-1}=0$；而 $k_{m-1}(W)=\dim E_{m-1}(W;t_*)\le\dim W=N$，因为求值空间是 $W$ 的子空间。空行列式约定的必要性：若 $r_h=0$ 却硬要用非空子式，$\Delta_h$ 无法定义，`eq:multiplicity-budget` 对 $h$ 求和时会漏项或除零。节点互异是 `eq:node-rank` 与整除论证的前提（各 $(\xi-t_j)^{q_j}$ 互素）。

`subspaces.tex:156-162` 那条 sharpness remark 我读成作者自证"常数没有余量"，逐字：

```
\begin{remark}
The constant in Lemma~\ref{lem:subspace} is sharp.  Write $W=P\oplus Q$
and divide the indices into groups of sizes $a=\lfloor m/2\rfloor$ and
$b=\lceil m/2\rceil$.  Set $(U_i,V_i)=(P,Q)$ in the first group and
$(U_i,V_i)=(Q,P)$ in the second.  Only pairs from different groups
contribute, and their total is $ab(\dim P+\dim Q)=\lfloor m^2/4\rfloor N$.
\end{remark}
```

我逐项核：第一组内 $i\ne j$ 时 $U_i\cap V_j=P\cap P=P$？不对，我重算。第一组 $(U_i,V_i)=(P,Q)$，第二组 $(U_i,V_i)=(Q,P)$。同组交叉：$i,j$ 同在第一组，$U_i\cap V_j=P\cap P=P$，非零。啊，这与"only pairs from different groups contribute"矛盾，说明我对 remark 的读法要修正：contributing 指的是"对 $\sum_{i,j}\dim(U_i\cap V_j)$ 有超出基线的贡献"这一说法不成立，该和式本身是同组也贡献的。我把总数按两种读法都算一遍。按字面构造：第一组大小 $a$、第二组大小 $b$，$a+b=m$，$ab=\lfloor m^2/4\rfloor$。$i$ 在第一组、$j$ 在第二组：$U_i=P,V_j=P$，交为 $P$，维数 $\dim P$，共 $ab$ 对；$i$ 在第二组、$j$ 在第一组：$U_i=Q,V_j=Q$，交为 $Q$，共 $ab$ 对、维数 $\dim Q$；同组对：第一组 $U_i\cap V_j=P\cap Q=0$（$W=P\oplus Q$ 保证 $P\cap Q=0$），第二组 $Q\cap P=0$。所以只有跨组对贡献，总值 $ab\dim P+ab\dim Q=ab(\dim P+\dim Q)=ab\,N=\lfloor m^2/4\rfloor N$。我先前把 $\bar V_j$ 的下标与组弄混了，修正后的验算与论文的 `Only pairs from different groups contribute` 完全一致。同时 $U_i\cap V_i$：第一组 $P\cap Q=0$，第二组 $Q\cap P=0$，假设成立。这一处我自己先算错再修正，我保留在笔记里，因为它是"这个常数确实被构造 saturate"的最直接证据。

(d) `[推测]` 其一：直接引用来路现成的 subspace design 引理而不重证。论文的 `all details are proved below`（`subspaces.tex:9`）与 `the degree filtration is adapted to the arbitrary family $U_i$`（同段）说明它认为现成版本的假设不匹配（现成版本通常要求 $\dim U_i+\dim V_j>\dim W$ 之类的全秩条件或对称双正交形式，这里只有逐对不相交）。这里我要用一条机器侧证据：`SubspaceIntersection.lean:50` 里机器化的第二条定理被命名为 `lemma2_1`，参数是 `(m N : ℕ)` 与 `U i ⊓ V i = ⊥`，结论是 `(∑ i, ∑ j, finrank ℝ ↥(U i ⊓ V j)) ≤ (m*m/4) * N`。这个名字泄露了血统：外部文献里那条就叫 Lemma 2.1。tex 侧则把它改写成本论文的 `lem:subspace` 并自证。我在第 15 节还会回到这条。`[推测]` 其二：把次数滤链换成单一 $\deg\le m-1$ 的整体计数。那样只能得到形如 $mN$ 的界（每个节点最多贡献 $N$），失去 $m^2/4$ 这个二次系数下界中的最优常数，最终 $d_md_n$ 的精确系数就换不来。`[推测]` 其三：在有限域或 $\mathbb C$ 的根为单位根的节点上做同样论证。有限域下"无穷多个非节点处为零"失效（`subspaces.tex:111-113` 的那一步立刻断），单位根方案则要把 $\ell_h,k_h$ 的定义搬到 $\mathbb C$ 上而维数翻倍，界里的 $N$ 口径会变。

## 8 从子空间到矩阵差：$d_m$ 里四个取整的落点

(a) 陈述，`subspaces.tex:164-181`（前两句引用见上块），逐字：

```
\begin{corollary}[Rank sum for differences]
\label{cor:rank-sum}
Let $X_1,\ldots,X_m,Y_1,\ldots,Y_m$ be real $d\times d$ matrices.
If $X_i-Y_i$ is invertible for every $i$, then
\begin{equation}
\label{eq:rank-sum}
  \sum_{\substack{1\leq i,j\leq m\\i\ne j}}
       \rank(X_i-Y_j)\geq2d_m d,
  \qquad
  d_m=\left\lfloor\frac m2\right\rfloor
      \left\lfloor\frac{m-1}{2}\right\rfloor.
\end{equation}
The sum is over ordered pairs of distinct indices.
\end{corollary}
```

证明与算术尾，`subspaces.tex:183-209`（前半见上批引用块），关键三块：

```
The map $v\mapsto(v,X_iv)$ identifies $\ker(X_i-Y_j)$ with
$U_i\cap V_j$.  Thus
\[
  \dim(U_i\cap V_j)=d-\rank(X_i-Y_j),
  \qquad U_i\cap V_i=\{0\}.
\]
Lemma~\ref{lem:subspace}, with $N=2d$, gives
```

```
  m^2-m-2\left\lfloor\frac{m^2}{4}\right\rfloor
  =\begin{cases}
      2r(r-1),&m=2r,\\
      2r^2,&m=2r+1,
    \end{cases}
  =2d_m.
```

(b) 中间步骤我全写出来。$W=\R^d\oplus\R^d$ 的维数是 $2d$，这就是 $N=2d$ 的出处；图 $U_i=\{(v,X_iv)\}$ 与 $V_j=\{(v,Y_jv)\}$ 的交是满足 $X_iv=Y_jv$ 的 $v$ 的提升，即 $\ker(X_i-Y_j)$ 的提升，故 $\dim(U_i\cap V_j)=\dim\ker(X_i-Y_j)=d-\rank(X_i-Y_j)$（秩零化度）。$i=j$ 时 $\ker(X_i-Y_i)=\{0\}$，即 $U_i\cap V_i=\{0\}$，这正是假设 $X_i-Y_i$ 可逆的唯一用途。求和换元：

$$\sum_{i,j}\rank(X_i-Y_j)=\sum_{i,j}\bigl(d-\dim(U_i\cap V_j)\bigr)=m^2d-\sum_{i,j}\dim(U_i\cap V_j)\ge m^2d-2d\lfloor m^2/4\rfloor=(m^2-2\lfloor m^2/4\rfloor)d.$$

对角项 $\rank(X_i-Y_i)=d$ 共 $m$ 个，去掉后剩 $\ge(m^2-2\lfloor m^2/4\rfloor-m)d$。我按 $m=2r$ 与 $m=2r+1$ 两种情形代回：偶时 $\lfloor m^2/4\rfloor=r^2$，$m^2-2r^2-m=4r^2-2r^2-2r=2r^2-2r=2r(r-1)$，而 $d_m=\lfloor r\rfloor\cdot\lfloor(2r-1)/2\rfloor=r(r-1)$，比值为 $2$；奇时 $\lfloor m^2/4\rfloor=r^2+r$，$m^2-m-2(r^2+r)=(4r^2+4r+1)-(2r+1)-(2r^2+2r)=2r^2$，$d_m=\lfloor(2r+1)/2\rfloor\lfloor 2r/2\rfloor=r^2$。两边一致，`=2d_m` 成立。论文 `subspaces.tex:197-200` 的写法 `The $m$ diagonal terms each equal $d$.  Removing them gives \eqref{eq:rank-sum}` 用的就是这个。

(c) 为什么最后要"去掉对角"，并非留着：留着的话右端是 $(m^2-2\lfloor m^2/4\rfloor)d$，量级 $\frac{m^2}{2}d$，比 $2d_md$（量级 $\frac{m^2}{2}d$）在数值上更大，但对第 11 节无用，因为我们要比的是"跨星形交点数"，对角块 $R_{ii}$ 的秩是 $d$ ，并非某个交点数（`conclusion.tex:60-63` 给的是 $\rank R_{ii}=d$），把对角留在不等式里会让左右口径错位。求和是有序对 ($i\ne j$)：`subspaces.tex:180` 那句 `The sum is over ordered pairs of distinct indices.` 是必需的口径声明，因为第 11 节的 $2c(D)$ 也按有序对计（每个交点被两个有序星形对看到，`conclusion.tex:90-91`）。$d_m$ 的四个取整在本题 $d_n$ 处的落点：$n=2s+1$ 时 $d_n=s^2=d$（`detector.tex:4-5` 写 `Suppose throughout this section that $n=2s+1$, where $s\geq1$, and put $d=s^2=d_n$`），$n=2r$ 时 $d_n=r(r-1)$；$\lfloor r/2\rfloor$ 与 $\lfloor(r-1)/2\rfloor$ 的差别正落在 $r$ 的奇偶上，$r$ 偶时两者不同（$r=2t$：$t$ 与 $t-1$），$r$ 奇时相同（$r=2t+1$：$t$ 与 $t$）。所以那两个"不同的取整"只在偶数情形产生 $-1$ 修正，这个修正的意义我在第 11 节的删除计数里再对一次账。

(d) `[推测]` 其一：跳过图 (graph) 构造，直接对矩阵用行空间与零空间的交来数维数。行的语言会把 $X_i-Y_j$ 变成 $2d\times 2d$ 的分块矩阵，界里的 $N$ 就变 $4d$，常数走样。`[推测]` 其二：把假设弱化成 $\rank(X_i-Y_i)\ge c$。那么 $U_i\cap V_i$ 只是 $d-c$ 维，`lem:subspace` 的前提 $U_i\cap V_i=\{0\}$ 直接不满足，节点处 $\pi_j$ 在 $U_j$ 上不单射（`subspaces.tex:114-115`），第 7 节第四步断掉。`[推测]` 其三：用迹或 Frobenius 内积造 Gram 矩阵来做同样的下界。Gram 路线给出的是半正定不等式，形如 $\sum\langle A_i,A_j\rangle$ 的界，而我们要的是"秩之和"这种非光滑量；这也是论文在 `introduction.tex:54-56` 里承认既有 SDP 下界只能给数值常数的同一原因。

## 9 两三角形插值：$Q_s$ 的形状是被归纳逼出来的

(a) 陈述，`detector.tex:13-30`（首两句实测见第 8 节末的块，这里给全）：

```
\begin{lemma}[Two-triangle interpolation]
\label{lem:triangular-basis}
For any pairwise distinct real numbers $x_1,\ldots,x_{2s+1}$, set
\begin{equation}
\label{eq:triangular-pattern}
  Q_s=
  \{(p,q):1\leq q<p\leq s+1\}
  \mathbin{\cup}
  \{(p,q):s+1<p<q\leq2s+1\}.
\end{equation}
The values at $(x_p,x_q)$ for $(p,q)\in Q_s$ determine uniquely a
polynomial of degree at most $s-1$ in each variable.
Equivalently, the $s^2$ vectors
\[
  h_{pq}=(x_p^a x_q^b)_{0\leq a,b<s},\qquad (p,q)\in Q_s,
\]
form a basis of $\R^{s^2}$, with the coordinates taken in any fixed order.
```

图 `detector.tex:31-34` 指向 `figures/triangular-grid`，我只核对口径：`Figure~\ref{fig:triangular-grid} shows the pattern $Q_s$ and the two eliminations in the inductive proof.`，两处 elimination 与我下面要写的两次因式分解对应。

(b) 归纳证明我完整重走一遍，因为它的指标变换最容易糊。空间维数：次数分别 $\le s-1$ 的多项式全体维数 $s\cdot s=s^2$；点数 $\lvert Q_s\rvert=\frac{s(s+1)}2+\frac{s(s-1)}2=s^2$（第一个三角是 $1\le q<p\le s+1$，即 $\binom{s+1}{2}$；第二个是 $s+1<p<q\le 2s+1$，指标从 $s+2$ 到 $2s+1$ 共 $s$ 个，取有序对 $p<q$ 得 $\binom{s}{2}$）。点数等于维数，所以单射即双射，只需证"在这些点上全为零则恒为零"。基础 $s=1$：$Q_1=\{(2,1)\}$（第二个三角要求 $2<p<q\le3$，空），$P$ 为常数，在一点为零即恒为零。

$s>1$ 的两次消去。第一次：第一个三角包含 $(s+1,q)$ 型 $s$ 个点（$1\le q\le s$），固定 $u=x_{s+1}$ 得 $P(x_{s+1},v)$ 是关于 $v$ 的、次数 $\le s-1$ 的多项式，有 $s$ 个互异根，故恒为零；于是 $(\xi_u-x_{s+1})$ 整除 $P$，商 $P_1$ 满足 $\deg_uP_1\le s-2$、$\deg_vP_1\le s-1$。第二次：剩下的点 $(x_p,x_1)$，$p=2,\dots,s$（第一个三角里 $q=1$ 的部分），由 $P_1(x_p,x_1)=\frac{P(x_p,x_1)}{x_p-x_{s+1}}=0$ 且 $x_p\ne x_{s+1}$，得 $P_1(u,x_1)$ 次数 $\le s-2$ 却有 $s-1$ 个互异根，恒为零，于是再提出 $(v-x_1)$，得 `eq:triangle-factorization`。剩余零点的刻画：$R(x_p,x_q)=0$ 对 $2\le q<p\le s$（第一个三角去掉 $p=s+1$ 那一行与 $q=1$ 那一列）与 $s+2\le p<q\le2s+1$（第二个三角整个保留，因为它本来就有 $p>s+1$，且 $q\ge2$）。

指标复位是我最想核的一步，论文只给了两句结论。令 $y$-元组为 $(x_{s+2},\dots,x_{2s+1},x_2,\dots,x_s)$，长 $s+(s-1)=2s-1$，正好是 $Q_{s-1}$ 需要的 $2(s-1)+1$ 个节点；显式地 $y_a=x_{s+1+a}$（$1\le a\le s$），$y_a=x_{a-s+1}$（$s+1\le a\le 2s-1$），后者取遍 $x_2,\dots,x_s$ 且不含 $x_1$，这个"不含 $x_1$"是我验算时发现的关键：若复位后允许 $x_1$ 出现，归纳假设的可用点集会包括已经被两次消去吃掉的列。取 $S(u,v)=R(v,u)$。
下三角 $1\le b<a\le s$：$S(y_a,y_b)=R(y_b,y_a)=R(x_{s+1+b},x_{s+1+a})$，两指标满足 $s+2\le s+1+b<s+1+a\le 2s+1$，落在 $R$ 已知的第二个区域，吻合。
上三角 $s<a<b\le 2s-1$：$S(y_a,y_b)=R(y_b,y_a)=R(x_{b-s+1},x_{a-s+1})$，指标满足 $2\le a-s+1<b-s+1\le s$，即 $2\le q<p\le s$，正是 $R$ 已知的第一区域。
两块合起来是 $Q_{s-1}$ 在 $y$-元组上的全部点，归纳假设给 $S=0$，故 $R=0$、$P=0$。$h_{pq}$ 版本与多项式版本的等价就是把 $P(u,v)=\sum_{a,b<s}\alpha_{ab}x_p^ax_q^b$ 看成 $\langle\alpha,h_{pq}\rangle$，$s^2$ 个求值向量线性无关等价于求值映射单射。

(c) 每个数字的理由：坐标范围 $0\le a,b<s$ 给出 $s^2$ 个坐标，这就是 $d=s^2$；两个三角的大小 $\binom{s+1}{2}$ 与 $\binom{s}{2}$ 相加恰好 $s^2$，一点不多一点不少，这个"恰好"是 $Q_s$ 形状的唯一定义性证据；节点数 $2s+1$ 之所以被固定，是因为第二次消去要留出 $p=2,\dots,s$ 共 $s-1$ 个点给 $\deg_u\le s-2$ 的多项式，同时又要 $s$ 个点给第一次消去，两次共用节点 $x_{s+1}$ 与 $x_1$；归纳的规模从 $2s+1$ 降到 $2s-1$，步长 $2$，与 $s$ 逐次减一对齐。$x_p$ 互异是全部"足够多互异根"论证的前提。多项式次数界 $s-1$ 与节点数 $2s+1$ 的关系（$s$ 个根压死 $s-1$ 次）在每次消去里都用一次，我用 $\dagger$ 标记：这里没有余量，多一个坐标或少一个节点都会让 $\lvert Q_s\rvert$ 与维数不等。

(d) `[推测]` 其一：用单个下三角 $\{1\le q<p\le n\}$（大小 $\binom n2$）配 $\binom n2$ 维空间。它规模不对：与 $d_n$ 的匹配要求二次量 $\approx n^2/4$，$\binom n2\approx n^2/2$ 会让值域矩阵变成 $\binom n2\times\binom n2$，第 11 节里 $2d_md$ 与秩和的量纲就错。`[推测]` 其二：把两次消去换成对 $Q_s$ 直接算 Vandermonde 型行列式。$h_{pq}$ 不是 Vandermonde 的行列（每列是两个变量的幂乘积的张量积切片），行列式没有闭式，只能证"非零"，而归纳恰好给出非零的构造性理由（每步除出的因子在该点集上非零，`detector.tex:63-64`：`At every point in the two remaining triangles the displayed factors are nonzero.`）。`[推测]` 其三：让 $s$ 的归纳同时跑奇偶两支以覆盖偶数 $n$。$2s+1$ 的奇数结构是复位 $(y_1,\dots,y_{2s-1})$ 的定义域本身，偶数时元组长度不是奇数，$Q_{s-1}$ 无从定义，归纳链在第一层就断。

## 10 rank detector：$\Phi$ 的四条设计约束怎么同时满足

(a) 陈述 `detector.tex:85-108`（引用见第 9 节前的实测块，这里逐字重贴关键段）：

```
\begin{lemma}[Rank detector]
\label{lem:detector}
Fix any pairwise distinct real numbers $x_1,\ldots,x_n$, where
$n=2s+1$ and $d=s^2$.  There is a linear map
$\Phi:\R^{n\times n}\longrightarrow\R^{d\times d}$ with the following
properties.
```

三条性质与末尾那句 `The same map has these properties for all orders simultaneously.`（第 107 行）我全实测过。定义 `detector.tex:112-124`：

```
  F(t)=\prod_{p=1}^{n}(t-x_p),\qquad
  h_{pq}=(x_p^a x_q^b)_{0\leq a,b<s},\\
  B_{pq}=\frac{x_p-x_q}{F'(x_p)F'(x_q)}
              h_{pq}h_{pq}^{\mathsf T},\qquad
  \Phi(H)=\sum_{p,q=1}^{n}H(p,q)B_{pq}.
\end{gathered}
\end{equation}
The factors $1/F'(x_p)$ are the classical barycentric weights for Lagrange
interpolation~\cite[Section~3, equation~(3.2)]{BerrutTrefethen2014}.
All denominators are nonzero because the nodes are distinct.
```

（注意上面最后一行的引用键我按原文写成了 `BerrutTrefethen2004`，实测行是 `interpolation~\cite[Section~3, equation~(3.2)]{BerrutTrefethen2004}`，此处不改动引用键。）

(b) 我按"四条约束同时满足"的角度把证明重排。约束清单：$\mathcal L$ 要被杀；对角要被杀；单个坐标矩阵要落在秩 $\le1$；每个 $S_\prec$ 要映成可逆。前两条由 $B_{pq}$ 的两个构件分别负责：秩一由 $h_{pq}h_{pq}^{\mathsf T}$ 这个外积负责（`detector.tex:125-126`：`The constant coordinate of $h_{pq}$ is $1$, so $B_{pq}$ has rank one when $p\ne q$, while $B_{pp}=0.$`，"常数坐标为 $1$"意味着 $h_{pq}\ne0$，故非零标量乘外积秩恰为 $1$），对角由因子 $x_p-x_q$ 负责。秩次可加给出 `eq:detector-support-bound`（`detector.tex:129-132`）：

```
  \rank\Phi(H)\leq
  \bigl|\{(p,q):p\ne q,\ H(p,q)\ne0\}\bigr|.
```

这条不等式是第 11 节把秩压成交点数的直接工具，我记下它有一个隐藏代价：它只数"非零元的个数"，所以若两个非零元的外积相互抵消，界变松但不失效；反过来若 $H(p,q)\ne0$ 而对应交点不存在，界就假。`conclusion.tex:78-80` 处理的就是这一点。

杀 $\mathcal L$ 的路线要先证 `eq:lagrange-vanishing`（`detector.tex:136-138`）。论文给的做法我补全最后一步：$F(t)/((t-x_p)F'(x_p))$ 是次数 $n-1$、在 $x_p$ 取 $1$、其余节点取 $0$ 的多项式（这是 Lagrange 基本多项式，分母正是 $F'(x_p)=\prod_{k\ne p}(x_p-x_k)$）。对任意 $\deg A\le n-1$，$A$ 减掉它的 Lagrange 插值组合后在 $n$ 个节点为零，故 $A(t)=\sum_pA(x_p)\frac{F(t)}{(t-x_p)F'(x_p)}$。比较 $t^{n-1}$ 系数：左端是 $A$ 的首项系数 $a_{n-1}$，右端每个分式的首项系数是 $\frac1{F'(x_p)}$（因为 $F(t)/(t-x_p)$ 首一、次数 $n-1$），故 $a_{n-1}=\sum_pA(x_p)/F'(x_p)$；当 $\deg A\le n-2$ 时 $a_{n-1}=0$，得恒等式。

接着把 $B_{pq}$ 的 $(a,b),(a',b')$ 元写开（`detector.tex:152-156`）：分子 $(x_p-x_q)x_p^{a+a'}x_q^{b+b'}$，指数 $a+a'\le 2s-2$，再乘 $(x_p-x_q)$ 时对 $x_p$ 的次数至多 $2s-1$、对 $x_q$ 的次数至多 $1+(2s-2)=2s-1$；而 $n=2s+1$ 使 $2s-1=n-2$，恰好落在恒等式的次数预算内。这句话我读成整个构造的"卡口"：把 $n$ 换成偶数 $2s$，预算 $n-2=2s-2$ 就不够那个多出来的 $1$ 次，除非同时把指数范围缩到 $a,b<s-1$，值域维数随之变成 $(s-1)^2$，与 $d_n=s(s-1)$ 依旧不等。$p$ 固定、把 $x_q$ 当变量套恒等式得 $\sum_qB_{pq}=0$，反向得 $\sum_pB_{pq}=0$（`detector.tex:161-164`），于是 $\Phi((r_p+c_q))=\sum_pr_p\sum_qB_{pq}+\sum_qc_q\sum_pB_{pq}=0$，性质 (i) 完成。

性质 (iii) 是我最喜欢的部分，它靠两次"加法等价"把 $S_\prec$ 变成支撑恰为 $Q_s$ 的矩阵 $H'$，`detector.tex:167-191`（前半实测见前面块）逐字含：

```
  S=\tfrac12\mathbf1\mathbf1^{\mathsf T}-H-\tfrac12I_n,
  \qquad \Phi(S)=-\Phi(H).
```

```
Subtract $1$ from each row of $H$ indexed by $p>s+1$, obtaining
$H'$.  The difference $H-H'$ is additive, so $\Phi(H')=\Phi(H)$.
Apart from diagonal entries, which $\Phi$ annihilates, the support
of $H'$ is exactly $Q_s$: its value is $+1$ on the first triangle
of \eqref{eq:triangular-pattern} and $-1$ on the second.
```

我逐条验：$H(p,q)=\mathbf 1_{q<p}$，$p\ne q$ 时 $(\frac12\mathbf1\mathbf1^{\mathsf T}-H)(p,q)$ 在 $p<q$ 给 $\frac12$、在 $q<p$ 给 $-\frac12$，吻合；$p=q$ 给 $\frac12$，再减 $\frac12I_n$ 归零，吻合；两项 $\frac12\mathbf1\mathbf1^{\mathsf T}$（取 $r_p=c_q=\frac12$）与 $\frac12I_n$（对角）都被 $\Phi$ 杀，所以 $\Phi(S)=-\Phi(H)$，吻合。行的修改：$p>s+1$ 时减 $1$，改动量在每行是常数列，形如 $r_p+0$，additive，吻合。支撑核对：$p\le s+1$ 时 $H'(p,q)=\mathbf 1_{q<p}$ 给出 $q<p\le s+1$、值 $+1$（第一个三角）；$p>s+1$ 时 $H'(p,q)=\mathbf 1_{q<p}-1$，对 $q<p$ 为 $0$、对 $q>p$ 为 $-1$、对 $q=p$ 为 $-1$（对角被杀），于是给出 $s+1<p<q$、值 $-1$（第二个三角），吻合。最后列变换：把 $Q_s$ 里的对排成列得到 $A_Q$（列是 $h_{pq}$），由 `lem:triangular-basis` 可逆，于是 `eq:detector-factorization`

```
  \Phi(S)=-A_Q D_Q A_Q^{\mathsf T},\qquad
  D_Q=\diag\left(
       H'(p,q)\frac{x_p-x_q}{F'(x_p)F'(x_q)}
       \right)_{(p,q)\in Q_s}.
```

对角元非零（$H'=\pm1$、节点互异使分子分母都非零），可逆性得证。重标号那段（`detector.tex:193-201`）我读成"$\Phi$ 只依赖节点集合，不依赖它们与指标集的顺序"：把 $\pi$ 代入自然序论证，和式里每项 $(x_{\pi(r)},x_{\pi(q)})$ 只是重排 $\Phi(S_\prec)=\sum_{p,q}S_\prec(p,q)B_{pq}$ 的求和指标，$F$ 是全体节点之积故不变，因此同一个 $\Phi$ 对所有序同时可用。

(c) 常数的逐个交代。$d=s^2$ 是 $h_{pq}$ 的坐标数，也是 $A_Q$ 的方角尺寸；$B_{pq}$ 的标量权重 $\frac{x_p-x_q}{F'(x_p)F'(x_q)}$ 里，$F'(x_p)$ 的每个是一次方（不是平方，因为 $(a,a')$ 两个指数之和已由 $1/F'(x_p)$ 线性控制，恒等式的分母结构就是单次），这一点在 Lean 里叫 `derivativeAtNode`，见 `RankDetector.lean:18-19` 的 `detectorWeight node p q = (node p-node q) / (derivativeAtNode node p * derivativeAtNode node q)`，与我这里的读法一致。$S_\prec$ 里的 $\pm\frac12$ 不是随意：第 4 节已经证明 $J^{ii}=\frac12T_{a_i}$，$\frac12$ 是拓扑侧传下来的，性质 (iii) 必须吸收这个尺度，而可逆性对非零标量免疫，所以 $\frac12$ 在此只影响 $\det\Phi(S_\prec)$ 的量值、不影响满秩。指数范围 $0\le a,b<s$ 与 $Q_s$ 的两次消去给出的次数下降 $\deg_uR,\deg_vR\le s-2$ 是同一套尺度，缩任何一边都会破坏 $\lvert Q_s\rvert$ 与 $s^2$ 的相等。

(d) `[推测]` 其一：让 $\Phi$ 直接是某个 $d\times n^2$ 矩阵的左乘而不借助外积结构。这样"每个坐标映到秩一"和"杀死 $\mathcal L$"这两个条件会变成解一个线性方程组，但可逆性条件是对每个序一族矩阵的行列式非零，是一个无限约束族（虽然序只有 $n!$ 个，仍然无法用线性代数解），外积加插值的结构把族约束降成一个归纳命题。`[推测]` 其二：用 $h_{pq}$ 的坐标范围 $a+b<s$（总次数界，并非逐变量次数界）。那样坐标数是 $\binom{s+1}{2}$，与 $d=s^2$ 不符，第 11 节的量纲 $2d_md$ 立刻错。`[推测]` 其三：把权重换成等距节点的对称差分系数。等距节点下 $F'(x_p)$ 变号交替，性质 (i) 的 $\deg\le n-2$ 论证仍然成立，但 (iii) 里 $D_Q$ 的符号与 $H'$ 的 $\pm1$ 不再匹配，行列式可能为零（节点算术对称会让某些 $Q_s$ 求值向量线性相关）。

## 11 合成：三个分支各自缺哪一块

(a) 上界一节我已经在第 0 节引过摆放与象限计数，这里补"三线共点"的处理，`conclusion.tex:19-29`（第 19-21 行的实测见第 0 节，后半）：

```
Summing over the quadrants and using \eqref{eq:dr} gives exactly
$d_m d_n$ crossings, provided no three segments concur in their interiors.

The positions can be chosen to ensure this condition. Three segments
concurrent in their interiors must have six distinct endpoints, since
segments with a common endpoint do not cross elsewhere. Their concurrence
is a proper polynomial condition on their axis intercepts: keeping two
segments fixed and varying an intercept of the third avoids their
intersection. There are only finitely many triples, and the product of
their nonzero defining polynomials cannot vanish on the open set of
permitted positions. Thus an admissible drawing achieves the stated count.
```

零因子情形 `conclusion.tex:35`：`If $m\le2$ or $n\le2$, this already proves equality by nonnegativity.`

下界奇数分支 `conclusion.tex:37-52` 与对角、跨块两把秩不等式 `conclusion.tex:57-77`，最后合成 `conclusion.tex:84-92`（逐字引用见前，含那句 `The last equality holds because each crossing belongs to exactly two ordered pairs of distinct first-class stars.`）。偶数分支 `conclusion.tex:93-110`：

```
\subsection{The even case}
We use the vertex-deletion count appearing in
Kleitman~\cite[Section~3, equations~(6)--(7)]{Kleitman1970} and
Woodall~\cite[Theorem~1 and Corollary~1.1]{Woodall1993}.
Let $n>2$ be even, and start again with a normalized minimum drawing $D$.
Delete each of its $n$ second-class vertices in turn. Each remaining
$K_{m,n-1}$ drawing has at least $d_m d_{n-1}$ crossings by the odd case.
Since the two edges at any crossing have distinct second-class endpoints,
that crossing remains in exactly $n-2$ of the deleted-vertex drawings.
Therefore
\[
 (n-2)c(D)\ge n d_m d_{n-1}=(n-2)d_m d_n,
\]
where the last identity follows directly from \eqref{eq:dr} for even $n$.
Division by $n-2$ and the upper bound \eqref{eq:upper} prove equality.
Together with the zero-factor cases, this completes
Theorem~\ref{thm:main}. \qed
```

(b) 我把 $R_{ik}=X_i-Y_k$ 的来源和"对角可逆"的用法补到底。由 `lem:additive`，$J^{ik}-J^{i1}-J^{1k}+J^{11}\in\mathcal L$；$\Phi$ 线性且杀 $\mathcal L$，故 $R_{ik}-R_{i1}-R_{1k}+R_{11}=0$。按 `conclusion.tex:45-47` 的 $X_i=R_{i1}$、$Y_k=R_{11}-R_{1k}$，得 $X_i-Y_k=R_{i1}-R_{11}+R_{1k}=R_{ik}$，吻合。取 $k=i$：$X_i-Y_i=R_{i1}-R_{11}+R_{1i}=R_{ii}$（用同一关系于 $(i,k)=(i,i)$），而 $R_{ii}=\Phi(J^{ii})=\Phi(\frac12T_{a_i})$ 可逆，因为 $\frac12T_{a_i}=S_{\prec_i}$ 恰是某个线性序 $\prec_i$（第 4 节末）的半符号矩阵，性质 (iii) 说它可逆。这就是 `cor:rank-sum` 假设 "$X_i-Y_i$ invertible" 的全部兑现过程，我此前一直奇怪为什么这个假设看起来"太贵"，现在明白它其实是每个顶点白送的：它只要求该星形的 $b$ 类辐条序是线性的，而这正是 gap 选出来之后 $T_v$ 的定义给的。

跨块一侧：$i\ne k$ 时 $R_{ik}=\Phi(J^{ik})$，其中对角元被 $B_{pp}=0$ 抹掉、非对角元 $J^{ik}(p,q)=I(ip,kq)$（两边无公共端点），故支撑包含在 $\{(p,q):p\ne q,\text{ 边 }ip\text{ 与 }kq\text{ 有交点}\}$ 里，配合 `eq:detector-support-bound` 得 $\rank R_{ik}\le c_{ik}$（`conclusion.tex:71-77` 的推理）。最后

$$2d_md\le\sum_{i\ne k}\rank R_{ik}\le\sum_{i\ne k}c_{ik}=2c(D)\ \Rightarrow\ c(D)\ge d_md=d_md_n.$$

双计数我按点验：归一化后没有相邻交点，所以任一交点属于两条边 $(i,p),(k,q)$ 且 $i\ne k$、$p\ne q$；它被 $(i,k)$ 与 $(k,i)$ 两个有序星形对各看见一次，故 $\sum_{i\ne k}c_{ik}=2c(D)$。$c_{ik}=c_{ki}$ 也来自同一事实（同一个点集），与第 4 节里 $J^{ki}=-(J^{ik})^{\mathsf T}$ 相呼应。

偶数分支的算术：$n=2r$ 时 $d_n=r(r-1)$、$d_{n-1}=d_{2r-1}=(r-1)^2$，检查 $n\,d_{n-1}=(n-2)d_n$ 即 $2r(r-1)^2=(2r-2)r(r-1)=2r(r-1)^2$，恒等，所以"the last identity follows directly from \eqref{eq:dr}"这句是可验的。重数 $n-2$ 的理由：一个交点由两条边确定，它们在 $b$ 类各有不同端点（不同 $p$，否则相邻），删掉 $n$ 个 $b$ 类顶点之一时该交点保留当且仅当删的不是这两个端点之一，故保留 $n-2$ 次。$n>2$ 的限制来自要除以 $n-2$，$n=2$ 已由零因子处理。

(c) 为什么 $m$ 与 $n$ 在最终证明里待遇不同，这一条我要写清楚：$\Phi$ 作用在 $n\times n$ 的块上，所以 $n$ 必须奇数（第 10 节的 $2s+1$ 卡口）；$m$ 只通过 `cor:rank-sum` 的不等式进入，那里的 $d_m=\lfloor m/2\rfloor\lfloor(m-1)/2\rfloor$ 是从 $\lfloor m^2/4\rfloor$ 与"去掉 $m$ 个对角项"这两步纯算术里掉出来的，对 $m$ 的奇偶没有任何额外要求。这就是为什么偶数性只需要在 $n$ 侧用删除补齐，而不必在 $m$ 侧再做一遍。指数与常数的落点：$d=s^2$（块的值域尺寸）、$2d_md$（下界左端）、$2c(D)$（上界右端）、$n-2$（删除重数）、$m$（对角项个数被去掉）；每一个都对应我在 (b) 里的一段验算。

(d) `[推测]` 其一：把上界构造里的"共点排除"省掉，直接说"一般位置显然可满足"。省掉之后 $d_md_n$ 只是"至多"，交点可能因三线共点而减少（共点会把三个两两交点合成一个点，而 $c(D)$ 数的是点），下界与上界就对不上；论文用有限个非零多项式之积在开集上不恒为零来闭合，这一步必须有。`[推测]` 其二：偶数分支改用删 $a$ 类顶点。那样要对 $K_{m-1,n}$ 用"偶数 $n$ 情形"，陷入自我循环（我们正是在证偶数 $n$），删 $b$ 类才能把问题降到已经证完的奇数 $n-1$。`[推测]` 其三：不做删除，直接对偶数 $n$ 造一个 $d=s(s-1)$ 尺寸的检测映射。第 10 节 (c) 的次数预算说明 $n\times n$ 块上"逐变量次数 $\le s-1$"与"预算 $n-2$"在 $n=2s$ 时无法同时成立；这条路大概会把我推回 $\mathcal L$ 之外的新歧义空间，而 `lem:additive` 只保证 $\mathcal L$。

## 12 尝试过的错误路线及失败原因

我把失败路线分两层写：第一层是"这项研究本身大概绕过的弯路"，它们的证据来自论文的措辞与结构错位，我标 `[推测]` 或 `[外部推断]`；第二层是"我自己在这份笔记的复算里真踩过的坑"，那些我在相应小节里就地登记了，这一节末尾集中回收。我不打算把这两层串成一条干净的进步曲线，因为它们本来交错。

路线一，逐对星形下界相加（`[推测]`，但它的存在有文本痕迹）。设想是：对每一对第一类顶点 $a_i,a_k$，由两处辐条序 $\sigma_i,\sigma_k$ 决定这两条星之间至少有多少个交点，再把 $\binom m2$ 对的局部下界相加。这条路的诱惑力来自双计数：归一化后每个交点恰好落在 $\{i,k\}$ 唯一一对无序星形对上，所以 $c(D)=\sum_{i<k}c_{ik}$ 是恒等式，只要每个 $c_{ik}$ 有非零下界就自动得到总量下界。它断在两个地方。第一处是"局部下界要成立就必须把两处的循环序都当成线性序"，而 $b_p$ 处的信息只能以循环序的形式读到：我在第 6 节算过，换 gap 会给 $J^{ii}$ 加一个 $\mathcal L$ 中的矩阵，也就是说"这个顶点的序到底是哪个线性序"在画法里没有客观答案。第二处更硬：即便每个 $c_{ik}$ 在给定两端序下都有下界 $f(\sigma_i,\sigma_k)$，$\sum_{i<k}f(\sigma_i,\sigma_k)$ 的最小值不等于"逐对取最小再相加"，因为 $m$ 个端序必须同时选取，逐对最小要求的是 $\binom m2$ 组相互独立的序对；论文的 $K_{m,n}$ 侧只有 $m$ 个自由度。`introduction.tex:52-53` 那句 `Woodall developed this approach through cyclic-order graphs and verified the cases $K_{7,7}$ and $K_{7,9}$ by computation~\cite{Woodall1993}.`（实测行 52-53）在我读来就是这条路线的边界证据：它能把 $n$ 固定住做有限枚举，却不能把 $m$ 也放开。这条路线留下的痕迹我在第 4 节已经指过：$J^{ik}(p,p)$ 处那个 $b_p$ 局部项就是这个问题的残骸，`conclusion.tex:67-69` 专门交代它被 $B_{pp}=0$ 抹掉，`detector.tex:126` 的 `while $B_{pp}=0$` 是它的墓碑。

路线二，把循环序约束交给半定规划或 flag algebra（`[外部推断]`，出处即论文的文献交代）。`introduction.tex:54-62` 逐字：

```
The rotation constraints later supported semidefinite lower bounds
\cite{deKlerkEtAl2006,deKlerkPasechnikSchrijver2007}, refined for fixed
part sizes by Brosch and Polak~\cite{BroschPolak2024}.
For balanced graphs, Balogh, Lidick\'y, Norin, Pfender, Salazar, and
Spiro obtained
\[
 \operatorname{cr}(K_{n,n})\ge0.9118\,d_n^2+o(n^4)
\]
using Razborov's flag-algebra method~\cite{Razborov2007,BaloghEtAl2023}.
```

失败原因得从这类方法的产出形态去找：松弛给的是带 $o(n^4)$ 的渐近常数与逐规模的数值证书，拿不到 $\lfloor m/2\rfloor\lfloor(m-1)/2\rfloor$ 这种逐点取整公式，也拿不到"$=$"。`0.9118` 与 `1` 之间的差不是技术余量，是方法类别的差异。我记下这一点，是因为它逼着我去找"精确常数的代数来源"，而精确常数最后来自 `eq:subspace-bound` 里 $\lfloor m^2/4\rfloor=\max_ee(m-e)$ 这个整数极值，见第 7 节 (c)。

路线三，只用无符号交点信息做组合计数（`[推测]`）。这条路想用 $c_{ik}$ 的直接定义加鸽笼，比如"两条星形的 $n$ 条边按两端序配对，交错对数就是交点数"。它在拓扑上是成立的（这正是路线一的局部引理），但它给不出全局一致性，且对"同一对边多次相交"的画法毫无约束；而本题的定义明确允许重交（`intersections.tex:12`：`Independent edges may still cross several times.`）。带符号的 $I(e,f)$ 恰恰是为了把重交折进线性代数：符号相消只会减少非零元个数，见 `conclusion.tex:78-80` 那句 `cancellation in the signed sum can only reduce the number of nonzero contributions`，无符号版本没有这个方向的单调性。

路线四，模 $2$ 或同调版本（`[推测]`）。圈与圈的模 $2$ 交数是良定义的、且不依赖定向，看起来比带符号交更省事。问题是它丢尺度：$z^{\mathsf T}Jy=0$ 之所以能推出秩不等式，是因为我们在 $\mathbb R$ 上有一个真实的矩阵 $J$，从而 $\Phi(J^{ik})$ 之间的加法关系是矩阵等式；模 $2$ 之后 $\Phi$ 的插值权重 $\frac{x_p-x_q}{F'(x_p)F'(x_q)}$ 无从定义（要除法），第 7 节里"在无穷多个非节点处为零"这一步也在有限域上崩掉（我在第 7 节 (d) 记过同一件事）。也就是说，模 $2$ 路线会在两个不同的地方各自断一次。

路线五，对 $m,n$ 双向归纳（`[推测]`）。删除计数本身很好用（第 11 节里它把偶数 $n$ 归到奇数 $n-1$），但如果想用它同时消化 $m$ 的偶数性，就要对 $K_{m-1,n}$ 用"$m$ 侧结论"，而 $m$ 侧结论里含 $d_m$ 的取整，归纳假设需要 $m-1$ 与 $m$ 两行 $d$ 值之间的算术关系；第 11 节 (c) 指出 $m$ 其实根本不需要归纳，因为 $d_m$ 出自纯矩阵定理。多算一份归纳只会让奇偶分支翻倍。

路线六，追求比"模 $\mathcal L$"更强的块关系（`[推测]`）。我一开始确实想过：能不能直接证 $J^{ik}$ 的某个规范化版本满足矩形差为零，从而 $\Phi$ 只需要在更小的空间上定义。第 7 节末尾那条 sharpness remark 告诉我这类"改进"没有余地：$\lfloor m^2/4\rfloor$ 被两组构造 saturate（我的验算在第 7 节 (c)），任何更强的代数关系都要么与该构造冲突，要么不能对所有 $U_i,V_i$ 成立。

第二层，我自己的复算坑，登记四条。第一，第 6 节 (b) 里我第一次展开 $z^{\mathsf T}Jy$ 时把 $(i,1)$ 块的四项符号整体弄反，反查方法是代回 $z_{1p}=+1$、$y_{1q}=-1$ 这一项。第二，第 7 节 (c) 我第一次读 sharpness 构造时以为同组对也贡献，重算 $P\cap Q=0$ 才纠正，说明我在读"$ab(\dim P+\dim Q)$"这类式子时倾向于跳过组的划分。第三，第 9 节 (b) 我第一次复位 $y$-元组时把 $y_{s+1}$ 当成 $x_1$，导致上三角校验里冒出 $q=1$ 的非法点；错在我把"剩下 $x_2,\dots,x_s$"按位置数成了 $s$ 个而实际是 $s-1$ 个。第四，第 10 节 (b) 我一度以为 $F'(x_p)$ 在 $B_{pq}$ 里应当出现两次（每指标各一），核对 `detector.tex:117-118` 后确认是 $1/F'(x_p)$ 与 $1/F'(x_q)$ 各一次、每个一次方，与我写的 $\deg\le n-2$ 预算吻合。这四条都在前文对应小节里留着，我没有回头删。

## 13 关键转折点

对我来说，转折是一次提问方式的更换，谈不上灵感。我先记录转折点之前卡住的样子：第 1 节到第 3 节的归一化做完以后，我手里有一个多边形画法、每个顶点一个（依赖 gap 的）线性序、以及每对边的带符号交。这时候我要的是一条能写成"$\sum\rank\ge2d_md$"的东西。我当时的想法是把 $J$ 当成一个广义邻接矩阵，然后指望它的秩或半正定性自己长出下界。这个想法的具体死法是：$J$ 是反对称矩阵，非零特征值成共轭对出现，$\rank J$ 是偶数、且完全可能被一堆零块压低，反对称矩阵的秩下界跟交点数之间没有我能用的不等式。也就是说，我原来要的东西不在 $J$ 里。

转折点是接受"拓扑侧只交出一条线性关系"这件事，并把它当作接口，并非当作结论。文本上有两处支撑，我读的时候正好是我想通的时刻，所以我把它当作证据。`introduction.tex:71-72`（实测在第 68-72 行块内）：`The resulting cycle pairing separates the topological information from the algebraic estimates.`；以及 `introduction.tex:106-116` 那段流程摘要（整块引用见第 0 节前的实测输出），里面 `The vanishing of algebraic intersections of closed plane curves makes these blocks additive modulo row-plus-column terms` 一句把接口写成"$\bmod$ 一个歧义空间"的形式。

有了这个接口，剩下的转折是三件具体的事，顺序我认为不能交换。

第一件：把"gap 的选取自由"翻译成"矩阵属于 $\mathcal L$"。这一步是我在第 6 节 (c) 用显式计算坐实的：换 gap 造成的差矩阵在跨 cut 的矩形块上是 $\pm2$、同侧是 $0$，而它确实写成 $r_p+c_q$。在此之前，$\mathcal L$ 在我看来只是证明 $z^{\mathsf T}Jy=0$ 展开后掉出来的东西；在此之后它有了含义，即"局部序的不确定性"。这个含义反过来解释了为什么 `detector.tex:5-7` 把"annihilates the additive ambiguity in Lemma~\ref{lem:additive}"列为第一条设计要求，措辞本身就是设计式的。

第二件：把"要证的是交点数下界"换成"要证的是秩下界"。枢纽是 `eq:detector-support-bound`（$\rank\Phi(H)\le$ 非零元个数）方向朝上、而 `cor:rank-sum` 方向朝下，两者在 $2c(D)$ 处对接（`conclusion.tex:84-89`）。这一步的代价是我必须让 $\Phi$ 同时满足四件不等价的事（第 10 节 (b) 的清单），而当时我并不知道四个条件能同时满足；论文在 `detector.tex:4-11` 用四句话把设计要求逐条列出，然后 `detector.tex:112` 才给出唯一的 $\Phi$，这种"先列约束再给构造"的写法通常是事后整理的标志，但它对读者是有用的：它告诉我这四条约束是彼此独立的，任何一条改动都要重做外积权重。

第三件：允许"$n$ 必须奇数"。这一步我心里抗拒过，因为定理对全体正整数成立，而证明把一个对称问题做成不对称。接受它的理由我在第 11 节 (c) 写过：$\Phi$ 作用在 $n\times n$ 块上，块尺寸与节点数绑定，插值预算（第 10 节 (b) 倒数第二段）把 $n=2s+1$ 钉死；$m$ 侧的取整来自 $\lfloor m^2/4\rfloor$ 与去掉 $m$ 个对角项的算术，对奇偶无要求，所以删除只需要补一边。补完以后偶数分支的算术 $2r(r-1)^2=(2r-2)r(r-1)$ 严丝合缝，这是我认为整个证明里最漂亮的一处"刚好"。

## 14 最终思路与最初设想的差异

差异我按能核对的写，共八条，每条都给出文本或计算的落点。

一，我最初以为这是一个"计数问题"，最终它是一个"表示问题"。最初的形态是"$c_{ik}$ 至少多少"，最终的形态是"存在一族 $d\times d$ 矩阵 $X_i-Y_k$，对角可逆、跨块秩被 $c_{ik}$ 控制"，而 $c_{ik}$ 只通过非零元个数进入。证据：`conclusion.tex:84-89` 那串不等式里，拓扑信息全部集中在 `eq:crossing-rank`，其余是纯代数。

二，我最初以为循环序（cyclic order）是核心对象，最终核心是线性序加上"它的不确定性构成一个可被杀死的空间"。`introduction.tex:49-51` 说 Kleitman 用的是 local cyclic orders，`introduction.tex:108-109` 说本文 `At each vertex, read the counterclockwise spoke order from a chosen gap`，即从循环序切出一个线性序；`lem:additive` 的 $\mathcal L$ 承接的正是"怎么切"。这条差异决定了整个证明的骨架。

三，我最初希望下界的常数从图形里出来，最终常数 $\lfloor m^2/4\rfloor$ 与 $\lfloor m/2\rfloor\lfloor(m-1)/2\rfloor$ 全部出自与图无关的代数，并且 sharpness 是代数侧的（`subspaces.tex:156-162`）。图形只贡献 $2d_md\le\sum\rank$ 与 $\sum\rank\le2c(D)$ 之间的对接。这跟 `subspaces.tex:4-6` 的自陈完全一致：`The algebraic estimate behind the lower bound concerns arbitrary pairs of subspaces.  The only hypothesis is that each subspace is disjoint from its designated partner.`

四，我最初以为奇偶两支会用同一件工具，最终偶数支用的是删除重数 $n-2$ 与一行取整恒等式，工具不同源（`conclusion.tex:93-110`）。我还注意到偶数支引用的正是历史文献里的删除计数，`conclusion.tex:95-97` 明确点名 `Kleitman~\cite[Section~3, equations~(6)--(7)]{Kleitman1970}` 与 `Woodall~\cite[Theorem~1 and Corollary~1.1]{Woodall1993}`，这条是旧技术，只有奇数支是新的。

五，我最初以为上界部分只是"回忆经典构造"，最终它必须自带一个一般位置论证。`conclusion.tex:19-29` 的 "provided no three segments concur" 与后面整段多项式条件说明，连上界都不是白送的；我最初把它当显然，是因为我下意识按"折线图"想，而 $c(D)$ 数点数的口径下共点会真的改变计数。

六，我最初以为"取最小画法"是证明的必要部分，最终它只是叙述装置。第 3 节 (d) 我记过一次，现在落实：真正被使用的只有归一化性质（多边形、局部直、无相邻交点）与下界对每个画法成立这两件事，`conclusion.tex:39-40` 说 `Choose a minimum drawing $D$ normalized as in Lemma~\ref{lem:normalization}`，但 `conclusion.tex:92` 的结论 $\crn(K_{m,n})\ge d_md_n$ 是由 $c(D)\ge d_md_n$ 与 $\crn$ 的最小定义直接得出；机器版本对此更直白，见第 15 节。

七，我最初以为 $m,n$ 在证明里对称，最终它们角色不同（第 11 节 (c)）。这个不对称是块矩阵 $J^{ik}$ 的索引方式决定的：$i,k$ 索引块、$p,q$ 索引块内坐标，$\Phi$ 只能作用在块内坐标上。

八，呈现顺序与依赖顺序错位（第 1 节）。装配是 introduction、subspaces、intersections、detector、conclusion、appendix normalization（`paper.tex:50-57`），而逻辑起点是 normalization，其次是 intersections 的 $J$，subspaces 与 detector 是两块独立的代数。我倾向认为真实推进顺序是 intersections 先行、代数后补，但这是 `[推测]`，支撑只有两处措辞：`intersections.tex:8-9` 对附录的回指，以及 `subspaces.tex:6-9`、`detector.tex:4-11` 那种"设计目标清单"式的写法（先列要什么、再给构造，通常是回头补的）。

顺带登记一条我这份笔记里的转录失误，按纪律不回改已落盘文本：第 10 节 (a) 的代码块里我把引用键打成了 `BerrutTrefethen2014`，而 `detector.tex:123` 的实测逐字是 `interpolation~\cite[Section~3, equation~(3.2)]{BerrutTrefethen2004}.`，键名应为 `BerrutTrefethen2004`（`introduction.tex:101-102` 也引同一文献的 Sections~2--3）。

## 15 Lean 机器侧取证：机器证到的与笔头声称的

我先把三个名字的对位关系钉住，因为这套命名在仓库里三处三个样子，不写清就会在复查时走错门。`E:\math\lean\formalization.yaml` 的第 966-968 行逐字（我用 `cat -n formalization.yaml | sed -n '964,970p'` 实测，第 964 行属于另一条 `OAI/Probability/BinarySweep/Main.lean`，第 970 行属于 `ComparatorChallenges/BorsukNine.json`，所以这三行是一个独立条目）：

```
    - comparator_config: ComparatorChallenges/BipartiteCrossing.json
      declaration: OAI.Zarankiewicz.mainTarget_proof
      file: OAI/Combinatorics/Crossing/Main.lean
```

登记名空间是 `OAI.Zarankiewicz`，目录名是 `Crossing`，比较器配置文件名是 `BipartiteCrossing`。三者的连接点在配置文件本身里，`ComparatorChallenges/BipartiteCrossing.json` 全文 340 字节，逐字含 `"solution_module": "OAI.Combinatorics.Crossing.Main"`、`"theorem_names": [ "OAI.Zarankiewicz.mainTarget_proof" ]`、`"permitted_axioms": [ "propext", "Quot.sound", "Classical.choice" ]`、`"enable_nanoda": false`，而 `"definition_names": []` 是空的。这条空值对我有实际意义：比较器只锁定定理名，不锁定任何定义名，所以 $MainTarget$ 这个 `def` 不在被比对的关键字清单里，它的角色要靠 Lean 自己的类型检查保证。名字层面我要提醒未来的自己：`Main.lean` 顶部 `namespace OAI` 套 `namespace Zarankiewicz`（`Main.lean:3-6`），而目录路径里那个 `Combinatorics/Crossing/` 与主题"完全二分图"没有名字上的对应；同层目录里另有别的挑战的模块，我只在本目录内取证，没有读任何相邻目录，`grep` 一律带 `OAI/Combinatorics/Crossing` 路径限定。

登记的入口声明是 `Main.lean:8-11`，逐字：

```
theorem mainTarget_proof : MainTarget := by
  intro m n hm hn
  obtain ⟨R⟩ := nonempty_balancedAxisRealization m n
  exact ⟨⟨R.drawing,R.crossingCount_eq⟩,crossing_lower_bound m n⟩
```

它四项就打完，说明 `MainTarget` 只是"$\exists$ 一个达到 $axisPairs$ 值的画法 $\wedge$ 每个画法都不低于该值"这个合取，`DrawingDefinition.lean:54-57` 逐字：

```
def MainTarget : Prop :=
  ∀ m n : ℕ, 0 < m → 0 < n →
    (∃ D : AdmissibleDrawing m n, crossingCount D = axisPairs m * axisPairs n) ∧
    (∀ D : AdmissibleDrawing m n, axisPairs m * axisPairs n ≤ crossingCount D)
```

这里立刻有第一条口径差：笔头的定理是 $\crn(K_{m,n})=d_md_n$（`introduction.tex:31-34`），机器定理是"逐 $m,n$ 的双分量陈述"，等式被拆成存在与下界两半，等号本身在 `Main.lean:13-22` 的 `ordinary_crossing_number_eq` 里另外证，靠的是 `ordinaryCrossingNumber := sInf (Set.range (@crossingCount m n))`（`DrawingDefinition.lean:52`）与两条引理 `CrossingIncidence.lean:11-18` 的 `crossingCount_attainment`（用 `csInf_mem`，需要一个见证画法来给出 range 非空）和 `ordinaryCrossingNumber_le_count`（`csInf_le'`）。也就是说：笔头写"$\min_D$"是省略了存在性，机器必须显式地从某个具体画法拿见证；而那个见证正是上界构造 $R.drawing$。我在第 3 节 (d) 猜"下界其实对每个画法成立、所以最小性只是叙述装置"，机器侧证实了这个猜法：`crossing_lower_bound (m n : ℕ) (D : AdmissibleDrawing m n)`（`EvenCrossingLowerBound.lean:39-40`）的量词是 $\forall D$，没有任何"取最小"的步骤。

定义口径还有一处我要落实。`AdmissibleDrawing`（`DrawingDefinition.lean:41-48`）只有三个字段：`crossings_finite`、`crossings_proper`（逐点要求 `ProperCrossing`，其定义 `DrawingDefinition.lean:32-36` 用 `OpenPartialHomeomorph` 把两轨映成两条坐标直径）、`no_triples`。笔头那句 "with no triple crossings, tangencies, or common subarcs"（`introduction.tex:10-11`）里的"共子弧"在机器里没有独立字段。我读出来的处理办法是：`crossings_proper` 对任何属于两条边内部的点都要求局部同胚到两直径，若两边共享一段弧，那段内部的点上两轨局部相同、不可能被同胚成互相垂直的直径，所以该性质被隐含地禁止。这条是我的读法，并非文件里的显式条款，标 `[推测]`；`no_triples` 则用集合等式 `edgeInterior e ∩ edgeInterior f ∩ edgeInterior g = ∅` 硬写了三重交。

下界的机器链条我按调用关系列出来，这条链与笔头的分节几乎一一对上，但有几处形状不同。入口 `crossing_lower_bound` 先 `rcases Nat.even_or_odd n`（`EvenCrossingLowerBound.lean:41`），偶数走 `even_successor_crossing_lower_bound`（同文件 10-37，它把 $n$ 写成 $(2s+1)+1$ ，并非 $2r$），奇数走 `odd_crossing_lower_bound`（`OddCrossingLowerBound.lean:9-23`）。偶数支的删除计数在机器里是 `sum_delete_crossingCount A hnorm : (∑ v : Fin ((2*s+1)+1), crossingCount (deleteRightVertex A v)) = ((2*s+1)+1-2)*crossingCount A`（`DeletionCount.lean:18-20`），取整恒等式是 `even_deletion_floor (s : ℕ) : (2*s)*axisPairs (2*s-1) = (2*s-2)*axisPairs (2*s)`（`DeletionCount.lean:31-32`），与笔头 `(n-2)c(D)\ge n d_md_{n-1}=(n-2)d_md_n`（`conclusion.tex:104-106`）同形；`hnorm : NoAdjacentCrossings D`（`RowCrossingCount.lean:10-12`）是重数 $n-2$ 成立的前提，因为若允许相邻交点，一个交点可能在删点时跟着两个端点一起消失、重数就不固定。奇数支 `odd_crossing_lower_bound` 先做四步数据获取：`polygonal_no_adjacent_locally_transverse D` 交出六元组 `(A,hcount,hpoly,hnorm,hstraight,htrans)`（`LocallyTransverseNormalization.lean:67`），再 `nonempty_vertexTruncation A.toContinuousDrawing hpoly` 与 `nonempty_truncatedSpokeCoordinates V hnorm`，最后 `rw [axisPairs_odd]` 把目标里的 $axisPairs(2s+1)$ 换成 $s*s$，再 `(C.odd_normalized_crossing_lower_bound ...).trans hcount`。这条正是笔头附录的分解，但机器把归一化的产出拆成四个独立 Prop：多边形性 `hpoly`、无相邻交点 `hnorm`、交点处局部直 `hstraight`、交点处局部横截 `htrans`，其中后两个分别定义在 `LocallyStraightNormalization.lean:14` 与 `LocallyTransverseNormalization.lean:9`；笔头 `lem:normalization` 一句话里含三件事（多边形、顶点与交点附近直、无相邻交点），横截性在笔头是从定义 inherited 的（`introduction.tex:7-9`），在机器里则被重新证了一遍并作为参数传给下界引理（`OddNormalizedLowerBound.lean:12-14` 的三个 `h*` 假设）。

核心一段是 `OddNormalizedLowerBound.lean:16-49`，它是笔头 `conclusion.tex:42-52` 与 `conclusion.tex:82-89` 的合体，我逐句对照。机器取 `let node : Fin n → ℝ := fun p => p.val`（第 16 行）并证 `hnode` 单射（第 17-21 行，用 `exact_mod_cast`），这是笔头的"with any one tuple of distinct nodes"的具体选择；`let i₀ : Fin m := ⟨0,hm⟩`（第 22 行）是笔头取指标 $1$ 的那颗基星；`H i k := rankDetector s node (edgeBlock C.cycleIntersectionMatrix i k)`（第 23 行）对应 $R_{ik}=\Phi(J^{ik})$；`X i := H i i₀`、`Y k := H i₀ i₀-H i₀ k`（第 24-25 行）与笔头逐字同形。第 26-32 行的 `hH` 用 `abel` 与 `rw [hh,zero_add]` 把 `additive_detector_relation` 转成 `H i k=X i-Y k`，这就是 $R_{ik}=X_i-Y_k$ 的机器版本；`diagonal_detector_isUnit`（第 33-36 行，其内容在 `VertexOrderDetector.lean:28-33`，内部再调 `lemma4_2 s hs node hnode hcard` 的第四个合取支）给出 `IsUnit (X i-Y i)`；`matrix_rank_sum_bound_product`（第 37 行，定义在 `IndexedMatrixRankSum.lean:25-29`）交出 $2\cdot axisPairs\,m\cdot(s*s)\le\sum_i\sum_{k\ne i}\rank(X_i-Y_k)$；第 38-46 行的 `hsum` 用 `offDiagonal_detector` 把左端逐项改写成 `rankDetector s node (V.intersectionBlock i k)` 的秩；第 47 行接 `ordered_detector_rank_le_twice_crossings`（`DetectorCrossingBound.lean:30-33`，结论是 $\le 2*\text{crossingCount}\,D$）；第 49 行 `nlinarith` 收尾。那个 `nlinarith` 干的正是笔头藏在 "so the rank sum is at most $2c(D)$"（`introduction.tex:121-123`）里的除以二，而 `2*crossingCount D` 的来源是 `sum_offDiagonal_rowCrossingCount`（`RowCrossingCount.lean:53-55`），它自己由 `rowCrossingCount_self`（同文件 31-38，用 `hnorm`）把对角行清掉后从 `sum_rowCrossingCount = 2*crossingCount D`（40-41）得来。笔头的双计数论证在第 11 节 (b) 我用文字复述过，机器版本给它的是一个显式的 Finset 等式，这条对应关系我认为是全篇最干净的一处。

代数侧的两处形状差异值得单独记。第一，`SubspaceIntersection.lean:12-14` 的 `subspace_intersection_bound` 结论是 `(∑ i, ∑ j, finrank ℝ ↥(U i ⊓ V j)) ≤ (m*m/4) * finrank ℝ W`，其中 `/` 是自然数除法即向下取整，与笔头 $\lfloor m^2/4\rfloor N$ 同值；而同文件第 50-54 行另有一条 `lemma2_1 (m N : ℕ) ... (hN : finrank ℝ W = N)`，结论写作 `(m*m/4) * N`。同一定理在机器里存了两份，一份内联维数、一份把 $N$ 作为参数并附假设 `hN`，后者那种"把维数拿出来当参数"的形状与外部文献里那条 Lemma 2.1 的表述习惯一致；结合 `subspaces.tex:6-8` 主动引用 subspace designs 文献，我判断这条代数核心是转译来的、然后被自证覆盖，机器命名 `lemma2_1` 与笔头 `Related determinant multiplicity arguments control sums of intersection dimensions in the theory of subspace designs`（`introduction.tex:85-87`）互为旁证。同理 `HalfOrderInvertibility.lean:23-27` 的 `lemma4_2` 把 `lem:detector` 的四条性质写成四合取（加法消去、对角消去、单元矩阵秩恰为 $1$、任意 `LinearOrder ι` 下半序矩阵可逆），第 32-33 行 `rw [C.cycleIntersectionMatrix_diagonal_block hnorm, C.leftHalfOrder_eq_halfOrder]` 就是把 $J^{ii}=\frac12T_{a_i}$ 接到 `halfOrderMatrix`。这里的机器版本比笔头更硬：笔头说 $\Phi(E_{pq})$ 在 $p\ne q$ 时秩为 $1$，机器的合取支写 `(rankDetector s node (Matrix.single p q 1)).rank = 1`，等号，并非不等号。
第二，节点选取的差异。笔头在 `subspaces.tex:31` 只要求"choose distinct real numbers"，`subspaces.tex:78` 再"fix $t_*$ outside the nodes"；机器 `SubspaceIntersection.lean:15` 直接令 `node : Fin m → ℝ := fun i => (i.val : ℝ)`，`SubspaceIntersection.lean:21-25` 另外证明 `∀ i, node i ≠ (-1 : ℝ)`（靠 `Nat.cast_nonneg` 加 `linarith`），因为机器把"外部求值点"固定成了 $-1$，`ell := columnIncrement U node ⊤ (-1)`（第 25 行）。这个固定让"取一般的 $t_*$"变成"取一个具体的、保证不是节点的点"，代价是要多证一句非节点；换来的是 `stage_degree_bound` 与 `total_degree_cost_le`（第 47-48 行）可以是可判定的引理调用，并非存在性选择。我读到的经验是：凡笔头出现"choose so that... avoid finitely many..."，机器侧几乎一定要改成显式常量加一条不等式证明，这类差异在归一化和 detector 里也反复出现（`VertexTruncation`、`TruncatedSpokeCoordinates` 是带证明的结构，`VertexOrderDetector.lean:18` 用 `LinearOrder.lift'` 把顶点圆盘上的几何序直接提升为 `Fin n` 上的 `LinearOrder`，取代笔头的"choose a gap"）。

上界一侧有一处我认为最重要的差异，它回答了我第 12 节路线六里"常数无余量"的疑问。笔头必须论证"三线段不共点"才能让 axis 构造恰好给出 $d_md_n$（`conclusion.tex:19-29`，多项式条件那段）。机器完全不走这条路：`BalancedAxisCrossingCount.lean:11-12` 把候选交点集定义成 `balancedRayPairs m ×ˢ balancedRayPairs n`，`BalancedRayPairs.lean:13-15` 显示 `balancedRayPairs r` 是"同在正射线上的两点"与"同在负射线上的两点"的并，`positiveRayIndices r` 与 `negativeRayIndices r` 的划分是 `i.val < r/2` 与其余（同文件 11-12），于是两侧大小是 $\lfloor r/2\rfloor$ 与 $\lceil r/2\rceil$，`balancedRayPairs_card : (balancedRayPairs r).card=axisPairs r`（第 68 行）就把笔头 `eq:dr` 的第二形式 $\binom{\lfloor r/2\rfloor}{2}+\binom{\lceil r/2\rceil}{2}$ 变成了集合划分的事实。真正的关键是 `crossingCount_le`（第 48-61 行）：先 `crossings_covered_by_candidates`（第 28-46 行）证明所有交点被候选对覆盖，再用 `Finset.card_biUnion_le` 与 `pairCrossings_card_le_one`（第 17-26 行，每个边对至多一个交点）得到 `crossingCount R.drawing ≤ axisPairs m*axisPairs n`，最后 `crossingCount_eq`（第 62-63 行）用 `Nat.le_antisymm R.crossingCount_le (crossing_lower_bound m n R.drawing)` 直接闭合等号。也就是说，机器把笔头那句"provided no three segments concur"的扰动论证彻底绕过了：它只需要"至多"，等号由下界免费补上。这与我第 14 节第五条的差异是同一件事的两面，而且它告诉我笔头上界那一节的共点讨论在逻辑上是可省的，属于"为了让读者看见具体画法"而写的内容。

最后是关于公理与完整性，我只能报告我实际测到的。`grep -rn 'sorry\|^axiom \|admit'` 在 `OAI/Combinatorics/Crossing` 目录内、限定 `--include=*.lean` 返回空；目录规模是 339 个 `.lean` 文件、20,617 行（`find . -name '*.lean' | xargs wc -l`）。配置文件允许的公理是 `propext`、`Quot.sound`、`Classical.choice` 三条，仓库里出现的用法与此相容：`open scoped Classical`（`DeletionCount.lean:7`、`RowCrossingCount.lean:7`）与 `classical` 策略（`BalancedAxisCrossingCount.lean:18` 等）。我没有在本仓构建或运行 `#print_axioms`，因此"实际公理集恰为该三条"我不能声称，我只能说没有发现超出清单的公理声明、也没有 `sorry`；`enable_nanoda: false` 我读作该挑战不允许外部判定过程，这是配置字段名加我的推断，标 `[推测]`。取证调用次数与落盘顺序我在交付报告里给数字，不在此自指。

## 16 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $d_r=\lfloor r/2\rfloor\lfloor(r-1)/2\rfloor$ | 增长 $\Theta(r^2)$ | paper.tex:43-46 | `thm:main` 与 `eq:upper` | 摘要与定理本体同时改 |
| $d_md_n$ | 增长 $\Theta(m^2n^2)$ | introduction.tex:31-34 | `lem:subspace` 的代入目标 | 第 8 节 (b) 的算术尾不闭合 |
| $\binom{\lfloor r/2\rfloor}{2}+\binom{\lceil r/2\rceil}{2}$ | 与 $d_r$ 恒等 | introduction.tex:26-27 | `conclusion.tex:19-20` 象限求和 | 象限分解失配，上界对不上 |
| `axisPairs r = (r/2)*((r-1)/2)` | 自然数除法即取整 | FloorArithmetic.lean:9 | 全部 Lean 侧目标式 | 主目标文字整体改写 |
| `axisPairs (2*r) = r*(r-1)` | 偶数形式 | FloorArithmetic.lean:19 | `even_deletion_floor`、`crossing_lower_bound` | 偶数支取整恒等式断 |
| `axisPairs (2*r+1) = r*r` | 奇数形式 | FloorArithmetic.lean:25 | `OddCrossingLowerBound.lean:16` | 奇数支 `rw [axisPairs_odd]` 断 |
| `diagonal_floor_identity`：$2d_m+m+2\lfloor m^2/4\rfloor=m^2$ | 恒等式 | FloorArithmetic.lean:31-32 | `MatrixRankSum.lean:44` | 第 8 节奇偶两支合并证明断 |
| $c(D)$ 的点计数口径 | 重交每次都算 | introduction.tex:12-13 | 第 11 节 `eq:crossing-rank` | 换成交叉对口径则秩界失效 |
| $I(e,f)$ 带符号和 | 取值在 $\mathbb Z$ | intersections.tex:15-18 | `eq:signed-J` | 去符号后 `lem:cycle-pairing` 不成 |
| $T_v$ 的 $\pm1$ 与 $0$ | 依赖所选 gap | intersections.tex:22-27 | `eq:signed-J` 热项 | 换 gap 产生 $\mathcal L$ 中元素 |
| $\sigma_{ve}=\pm1$ | 出为 $+1$ 入为 $-1$ | intersections.tex:29-33 | `eq:signed-J`，$K_{m,n}$ 下恒为 $+1$ 积 | 一般图定向改变则圈配对失配 |
| $\frac12$（热项系数） | 精确 $1:2$ | intersections.tex:38 | `J^{ii}=\frac12T_{a_i}`、`S_\prec` | 与 `eq:chord-formula` 的 $\frac12$ 脱钩 |
| $\mathcal L$（行加列空间） | 维数 $2n-1$ | intersections.tex:184-185 | `lem:additive`、`detector` 性质 (i) | gap 歧义无法被消去 |
| $z^{\mathsf T}Jy=0$ | 恒等式 | intersections.tex:53-56 | `lem:additive` 证明 | 整条接口断链 |
| marks 的有限性 | 顶点数加 $c(D)$ | normalization.tex:22-23 | 圆盘族两两不交 | 圆盘选取与正距离论证断 |
| $\Omega=\mathbb R^2\setminus\bigcup_w D_w$ | 开集 | normalization.tex:42-44 | 外部片段折线化 | 折线逼近的存在性论证断 |
| 交叉圆盘内至多一点 | 计数不增 | normalization.tex:98-99 | `lem:normalization` 结论 | "no more crossings" 失效 |
| $n-2$ 删除重数 | 精确 | conclusion.tex:101-102 | 偶数支除法 | 双计数等式与除法同时断 |
| $\lfloor m^2/4\rfloor$ | 增长 $\Theta(m^2)$ | subspaces.tex:18-20 | `cor:rank-sum` | 常数走样则 $2d_md$ 不成立 |
| $\mathcal P_h(Z)$ 的次数界 $h$ | 逐层 $+1$ | subspaces.tex:34-36 | `eq:filtration-evaluation` | 滤链与 $\ell_h$ 定义全断 |
| $k_h(Z)$、$k_{-1}=0$ | 非负整数 | subspaces.tex:41-43 | `eq:filtration-sum` 望远镜 | 求和起点错位 |
| $\ell_h\ge0$ | 由嵌套性 | subspaces.tex:80-82 | `eq:minor-degree` | 次数预算出现负项 |
| $\deg\Delta_h\le\sum_{e\le h}e\ell_e$ | 加权次数 | subspaces.tex:91-94 | `eq:multiplicity-budget` | 整除性论证失去上界 |
| $e(m-e)$ 的最大值 | $\lfloor m^2/4\rfloor$ | subspaces.tex:146-147 | 第 7 节末求和 | 换 $\frac{m^2}{4}$ 则整数极值不成立 |
| $N=2d$ | 恰为两倍 | subspaces.tex:195 | `cor:rank-sum` 应用 | 图构造的维数口径断 |
| $2d_md$ 与 $2c(D)$ | 同量纲 | conclusion.tex:84-89 | 下界闭合 | 系数 $2$ 改一处即差半 |
| $Q_s$ 的两三角 | $\lvert Q_s\rvert=s^2$ | detector.tex:18-21, 38-39 | `lem:triangular-basis`、`eq:detector-factorization` | 点数与维数不等则不可逆 |
| $h_{pq}$ 坐标 $0\le a,b<s$ | $s^2$ 个坐标 | detector.tex:26-28 | `eq:detector-definition` | 值域尺寸变，$d$ 走样 |
| $F'(x_p)$ 一次方权重 | 非零 | detector.tex:117-124 | $B_{pq}$、$D_Q$ | 分母为零或被平方则符号失配 |
| $x_p-x_q$ 因子 | 使 $B_{pp}=0$ | detector.tex:117-118, 126 | 对角消去、$J^{ik}(p,p)$ 抹除 | `eq:crossing-rank` 的支撑计数失配 |
| 次数预算 $2s-1=n-2$ | 卡口等式 | detector.tex:157-158 | `eq:lagrange-vanishing` 的应用 | 偶数 $n$ 下该等式不成立 |
| `rankDetector` 线性映射 | 目标维 $s^2$ | RankDetector.lean:25-29 | `OddNormalizedLowerBound.lean:23` | 非线性则 $R_{ik}=X_i-Y_k$ 无意义 |
| `lemma4_2` 四合取 | 四性质并列 | HalfOrderInvertibility.lean:23-27 | `VertexOrderDetector.lean:33` | 任一合取支缺失即缺设计约束 |
| `matrix_rank_sum_bound`：$2\cdot axisPairs\,m\cdot d$ | 下界 | MatrixRankSum.lean:16-19 | `IndexedMatrixRankSum.lean:25-29` | 量纲差 $2$ 倍 |
| `(m*m/4)*finrank ℝ W` | 自然数除法 | SubspaceIntersection.lean:12-14 | `matrix_rank_sum_bound` | 取整口径与笔头不一致 |
| `lemma2_1` 带 $N$ 与 `hN` | 同定理第二形态 | SubspaceIntersection.lean:50-54 | 外部文献形状对照 | 与笔头 self-contained 叙述冲突 |
| 机器固定外部求值点 $-1$ | 非节点常量 | SubspaceIntersection.lean:21-25 | `columnIncrement U node ⊤ (-1)` | 改点需重证非节点条件 |
| `node p = p.val` | $\mathrm{Fin}\ n\to\mathbb R$ | OddNormalizedLowerBound.lean:16-21 | `rankDetector` 调用 | 与 `Icc 1 (2*s+1)` 口径需桥接 |
| `2*crossingCount D` | 双计数 | DetectorCrossingBound.lean:30-33 | `nlinarith` 收尾 | 重数改 $1$ 则下界减半 |
| `NoAdjacentCrossings` | Prop 假设 | RowCrossingCount.lean:10-12 | `rowCrossingCount_self`、`sum_offDiagonal_rowCrossingCount` | 对角行非零则 $2c(D)$ 失配 |
| `pairCrossings_card_le_one` | 至多一点 | BalancedAxisCrossingCount.lean:17-26 | `crossingCount_le` | 候选覆盖失去上界 |
| `axisPairs r` 与 `balancedRayPairs` 大小 | 两侧 $\lfloor r/2\rfloor$、$\lceil r/2\rceil$ | BalancedRayPairs.lean:11-15, 68 | `crossingCandidates` 基数 | 划分失衡则 $d_r$ 第二形式断 |
| 允许公理三条 | `propext`、`Quot.sound`、`Classical.choice` | BipartiteCrossing.json 字段 | 比较器审计 | 超出即审计不过 |

依赖链的散文版我按"改一处会撞到哪里"来读。最底层是取整算术：`FloorArithmetic.lean` 的 `axisPairs` 与两条奇偶展开式，加上 `diagonal_floor_identity`，它们同时支撑笔头 `eq:dr` 的第二形式与机器 `balancedRayPairs_card`；动 $d_r$ 的定义会一路传到 `MainTarget` 的文字、`even_deletion_floor` 与 `matrix_rank_sum_bound` 的左端系数。往上一层是代数核心：`eq:filtration-evaluation` 与 `eq:minor-degree` 决定 `eq:multiplicity-budget`，后者与 `eq:filtration-sum` 合起来才产生 $\lfloor m^2/4\rfloor$，而 $N=2d$ 与"去掉 $m$ 个对角项"把 $\lfloor m^2/4\rfloor$ 兑换成 $2d_md$；这一层若把 $h$ 的次数界或 $k_{-1}=0$ 的约定改掉，`subspaces.tex:141-153` 的三重不等式链立刻断在中段。再往上是检测映射：$Q_s$ 的尺寸 $s^2$ 决定值域维数、$x_p-x_q$ 与 $F'(x_p)$ 决定消去性质与可逆性、$2s-1=n-2$ 决定 $\mathcal L$ 被杀；这四件事里任何一件改动，`eq:detector-factorization` 的非退化对角或 `eq:detector-support-bound` 就撑不住，第 11 节的两把秩界随之倒。最上层是拓扑输入：归一化四件套（`hpoly`、`hnorm`、`hstraight`、`htrans`）供出 $J$ 的定义合法、$z^{\mathsf T}Jy=0$ 供出模 $\mathcal L$ 关系、$J^{ii}=\frac12T_{a_i}$ 供出对角可逆、$c(D)$ 的点计数与无相邻交点供出 $\sum_{i\ne k}c_{ik}=2c(D)$。这条链的耦合方式是"每层只通过一个接口喂下一层"，这正是 `introduction.tex:71-72` 与 `introduction.tex:106-116` 反复强调的分离，也是我在第 13 节把转折点读成"把 $J$ 当结论改当成接口"的原因：一旦接受接口只有一条线性关系，改动某一层的常数就必然只在该层的接口处爆炸，而不会像我最初设想的那样"从图形一路传到常数"。

补记，关于本笔记里 Lean 片段的转录口径，我要把话说在前面以免未来的自己误读。`Main.lean:8-11`、`DrawingDefinition.lean:54-57`、`formalization.yaml:966-968`、`BipartiteCrossing.json` 那几处我在第 15 节里给的是逐字文本，可以拿去对文件。另有两处属于实例化形式，不是文件里的原句：第 15 节里 `sum_delete_crossingCount A hnorm` 后面那串求和等式，是把 `DeletionCount.lean:18-20` 的一般陈述代入 $D=A$、$n+1=(2s+1)+1$ 之后的形状，它的原样出现位置是 `EvenCrossingLowerBound.lean:20` 的 `rw [sum_delete_crossingCount A hnorm]` 这一行；同节里 `lemma4_2` 的四个合取支我是按 `HalfOrderInvertibility.lean:23-27` 逐条转述成中文短句再加一条逐字引号（`(rankDetector s node (Matrix.single p q 1)).rank = 1`），其余三支的措辞是我的。给这些标注口径差别，是因为反推笔记最容易在"引用"与"我用引用对象的语言重说一遍"之间滑坡，而我在这份稿子里确实滑了一次（第 10 节的引用键失误已在第 14 节末登记）。最后一件我没做也不能做的事：我没有构建这个 Lean 包，所以"该模块在 Lean 4.34.1 下编译通过、公理集恰为配置里的三条"我只能作为配置的声称转述，我自己的实测范围止于文件文本与目录内的检索命中。
