# D74 任意极化曲面上的极大 Seshadri 常数：我把定性 Nagata--Biran 反推成一条有限插值通道

对象论文：`Maximal Seshadri constants on arbitrary polarized surfaces`（2026-09-23，OpenAI）。
TeX 源码：`E:\math\preprints\Maximal-Seshadri-Constants-on-Arbitrary-Polarized-Surfaces-September-23-2026\build\sections\`，分片平铺 `introduction.tex`、`jets.tex`、`node.tex`、`compression.tex`、`lattice.tex`、`nef.tex`，另有 `figures/compression`、`figures/triangle` 两张插图，主文件 `main.tex` 只 26 行、`preamble.tex` 33 行。
Lean：中心仓库 `E:\math\lean\formalization.yaml` 第 427、429 行登记论文，第 1330--1332 行登记形式化，入口模块 `OAI/AlgebraicGeometry/Seshadri/Main.lean`，被认证的唯一声明是 `OAI.MaximalSeshadri.Geometry.maximalSeshadriConstants`；comparator 配置 `ComparatorChallenges/MaximalSeshadriConstants.json`，允许公理 `propext`、`Quot.sound`、`Classical.choice`。整个 Seshadri 目录 421 个 `.lean` 文件，我实测的细节放在第 14 节。
背景与检索：第 16 节单独交代，与论文内容分开写，凡我未能从 tex 或 Lean 核实的外部信息都标 [推测]。

记号与论文对齐：$S$ 是光滑整复射影曲面，$L$ 是 ample 线丛，张量幂用加法记号，$H=L^2$。$\boldsymbol p=(p_1,\ldots,p_r)$ 是互异点组，$\pi:Y\to S$ 是这些点的爆破，$E_1,\ldots,E_r$ 是例外曲线。$U_r=\{(p_1,\ldots,p_r)\in S^r:p_i\ne p_j\text{ for }i\ne j\}$。$\mathcal T=(\C^*)^2$ 是代数环面，$\mathcal M(\Omega)$ 是指数落在 $\Omega\cap\Z^2$ 里的 Laurent 单项式张成空间。下文引用形如 `intro:31` 指 `introduction.tex` 第 31 行，`jets:38`、`node:15`、`comp:57`、`lat:101`、`nef:107` 同理。

## 0 我进场时手里有什么

我先把手里的定量陈述逐字钉住，因为后面每一步都得回头看它。多点 Seshadri 常数的定义写在 `intro:7-10`：

```tex
 \varepsilon(S,L;\mathbf p)
 =\inf_C\frac{L\cdot C}{\sum_{i=1}^r\mult_{p_i}C},
```

$C$ 跑遍至少碰到一个点的整曲线。紧接着 `intro:12-15` 给了等价的 nef 刻画：

> If $\pi:Y\to S$ is the blow-up of these points, with exceptional curves $E_1,\ldots,E_r$, the same constant is the largest $\lambda\ge0$ for which $\pi^*L-\lambda\sum_iE_i$ is nef. Here a real divisor class is \emph{nef} if it has nonnegative intersection with every integral curve.

我要强调这里 nef 是对实除子类、对每条整曲线取的，不是对可除子类、不是只对某族曲线。后面第 14 节会看到 Lean 把这个"对每条整曲线"落成了 `PointBlowup.BoundaryNef`，一条数值判据，形式口径完全咬合。

主定理是 `intro:31-44`：

```tex
\begin{theorem}\label{thm:main}
For every smooth integral complex projective surface $S$ and every ample
line bundle $L$ on $S$, there is an integer $r_0=r_0(S,L)$ with the following
property. For each integer $r\ge r_0$, there is a countable union
$Z_r$ of proper Zariski-closed subsets of $U_r$, with nonempty complement,
such that for every $\mathbf p\in U_r\setminus Z_r$ the class
\[
 \pi^*L-\sqrt{\frac{L^2}{r}}\sum_{i=1}^r E_i
\]
is nef on the blow-up at $\mathbf p$. Consequently,
\[
 \varepsilon(S,L;\mathbf p)=\sqrt{\frac{L^2}{r}}.
\]
\end{theorem}
```

量化顺序我逐层拆开，因为它决定我要证的到底是什么：

$$\forall S\,\forall L\ \text{ample},\ \exists r_0,\ \forall r\ge r_0,\ \exists Z_r\ (\text{可数真 Zariski 闭并},\ \complement\ne\emptyset),\ \forall \boldsymbol p\in U_r\setminus Z_r:\ \pi^*L-\sqrt{L^2/r}\textstyle\sum E_i\ \text{nef}.$$

有三个细节很容易被顺读滑过去，我进场时先把它们挑明：

第一，$\sqrt{L^2/r}$ 在不等式里是上界那一侧，也就是 `intro:19-21` 的 `eq:upper-bound`：

```tex
 \varepsilon(S,L;\mathbf p)\le\sqrt{\frac Hr};
```

论文在 `intro:22` 明说这个上界有"an elementary jet-count proof"，落在 `nef:171` 的 Lemma `lem:sesha-upper`。所以定理真正要证的是反方向 $\varepsilon\ge\sqrt{H/r}$，即在 very general 点处那条平方为零的边界类 $\pi^*L-\sqrt{H/r}\sum E_i$ 是 nef。即硬的是下界，"显然"的是上界；我下面所有力气都花在把上界抬成等式。第 1 节专门说这件事为什么显然、门槛 $r_0$ 又卡在哪个非显然的地方。

第二，结论断言的是边界类 nef，$D_0^2=0$（在 `nef:127` 我实测到这个平方数）。`intro:49-52` 特意解释这比"常数等于某数"更强：它排除任何一条次数与总重数之比低于数值界的曲线，即便那些重数互不相等。齐次 jet 测试只处理"每点等重数 $m$"的情形，而曲线可以有不等重数，这个缺口由 `nef` 分片末尾的扰动论证填，我会在第 10、11 节拆它。

第三，"very general"被定义成失败集落在 $U_r$ 的可数真 Zariski 闭子集并里（`intro:28-29`），而 $r_0$ 允许依赖 $(S,L)$。这两条合起来是我能对整个曲面做统一处理的前提：我不需要显式点，只需要在每个 Zariski 开条件里各取一个见证元组，再用 Baire 交出同时满足可数多个条件的 generic 点。来源登记：台账本轮续写的坐标全部落在本地语料目录 `preprints/Maximal-Seshadri-Constants-on-Arbitrary-Polarized-Surfaces-September-23-2026` 的 `build/sections/` 六片 tex 上，本条目在队列第 84 行号，PDF 分片全程未读。

## 1 哪一侧"显然"，以及门槛 $r_0$ 到底卡在哪一步

先做机械核对，把上界为什么"便宜"讲清楚，这直接决定我后面要把劲往哪边使。Lemma `lem:sesha-upper`（`nef:171-204`）的证明我只需维数计数。设 $A=\pi^*L$、$E=\sum E_i$，若 $A-\lambda E$ nef，取 $0<\alpha<\sqrt{H/r}$、$m_k=\lceil k\alpha\rceil$。Riemann--Roch 给 $h^0(S,kL)\ge\frac H2k^2+O(k)$（`nef:186-188`），而 $r$ 个点 $m_k$ 阶 jet 的靶维数是 $r\binom{m_k+1}2=\frac{r\alpha^2}2k^2+O(k)$（`nef:190-193`）。因为 $r\alpha^2<H$，对一切充分大 $k$ 求值核非零，得到一个有效除子 $F_k\sim kA-m_kE$；nef 逼出 $0\le(A-\lambda E)\cdot F_k=kH-\lambda r m_k$（`nef:196-199`），令 $k\to\infty$ 得 $\lambda\le H/(r\alpha)$，再令 $\alpha\uparrow\sqrt{H/r}$ 得 $\lambda\le\sqrt{H/r}$。

我读完这段的结论是：上界是"空间太大、点条件太少、逼出一个不该有的截面"这种纯粹鸽笼式论证，它对每个固定点组都成立，跟 generic 无关。反过来，$\ge$ 方向要求的是"某个截面根本不存在"，这是关于整个线性系的否定性命题，鸽笼给不出来，因为它只数维数不数结构。这就是我要另起一套机制的根本原因。

门槛 $r_0$ 从哪一步冒出来，我在通读后才定位清楚，它不在上界证明里（那里没有 $r_0$），而在 `lattice` 分片的两个地方。一是 Lemma `lem:direction`（`lat:204-253`）里那句"length $dj(W-a_0)>\frac{dR}{4(1+T)}$，which exceeds $2$ for every sufficiently large $r$"：只有当这个开区间 $I_r$ 的长度超过 $2$ 时，我才能保证它落进一个奇数 $i$，从而把 $u=(i,j)$ 配成 primitive 向量。二是 `lem:direction` 里要求 $R=\sqrt{rH}$ 足够大以使 $a_*=(R-i/d)/j$ 落回开区间 $(a_0,W)$。两处下限都只依赖固定数据 $d,H,T$，于是 $r_0$ 只依赖 $(S,L)$，符合定理要求。

我要把这条因果链讲透，因为它是我整个设计里最容易误解的一点。$\sqrt{H/r}$ 这个数值界本身不含 $r_0$，$r_0$ 是"我能不能把三角形 $P_t$ 的形状调到一个整数格方向上"这件事的门槛：小 $r$ 时区间太窄、装不下那个奇数，我的构造就断供，定理于是只对充分大 $r$ 陈述。这不是"估计不够精细"的问题，是我这套有限群测试机制的固有定义域。

## 2 我试过的死路，以及 jets 分片的两块基石

### 2.1 三条我推了一遍就废掉的路线

**死路一：直接搬 Alexander--Hirschowitz。** 我最初的直觉是，这题本质是"一般位置点列的插值维数"，正是 AH 定理的地盘。`intro:122-126` 替我把这条路堵死，原文说这份 uniformity 与 AH 的渐近 postulation 定理不同，"where the degree threshold depends on a fixed bound for the point multiplicities"。机械停住点：我的 $m$ 要跑遍所有满足 $m>k\sqrt{H/r}$ 的正整数，$m$ 无上界；AH 给的是"固定重数上界时关于次数充分大"，量词方向恰好相反，我需要的正是它假设里被固定的那个量。这条路线连命题陈述都对不上，不是精度问题。[推测：AH 的多项式插值奇点结构也难以给出单射这种整体否定性。]

**死路二：靠辛打包稳定性。** `intro:73-83` 交代 Biran 的稳定性定理与 Buse--Hind--Opshtein 的强打包稳定性，然后一句 "symplectic packing stability alone does not fix the required complex structure" 判死。机械停住点：辛打包是在某个辛形变类里塞等径球，而我要的是固定复曲面 $S$ 的爆破上那个具体复除子类的 nef 性，辛通道根本碰不到复结构。`intro:80-83` 引 Eckl 说明打包的代数解释需要 Kähler 形式，反向并不自动。[推测：辛方法对有理类有效，对一般型的极化 $L$ 没有对应陈述。]

**死路三：平方子列加 Roé 搬运。** `intro:85-96` 里 Harbourne 的结果覆盖所有使 $rL^2$ 为平方数的充分大 $r$，对这些平方值 intersect 可数个开 loci 可得等式；Roé 的 transfer 则在曲面含一个达到极大 one-point 常数的点时给出极大界。我一度想沿"平方子列稠密 + 极限"补全所有 $r$。机械停住点：平方 $rL^2$ 只是稀疏子列，$\sqrt{H/r}$ 在子列上取值，与"每个充分大整数 $r$"差一整段空隙；而 Roé 搬运需要"某个点的 one-point 常数极大"这一额外几何输入，一般极化曲面给不出。`intro:102-103` 的宣言 "Our argument treats arbitrary ample polarizations and all integers beyond one threshold directly" 正是在和这些"子列/带前提"的旧法划界。Di Rupo--Serrano 的 $r=9$ 与 Xu 的 $r=16$ 型固定点数结果（`intro:105-112` 引 Dionne--Roth、Laface--Ugaglia 为同类问题）处理的是定曲面定 $r$ 的精确值，与统一 eventual 最大化是另一问，我在第 16 节再展开这条检索线。

排除这三条后，形态被倒逼出来：必须构造性地、对每个大 $r$ 直接把上界抬成等式，且见证点靠 generic ，并非显式。于是剩下的问题就是"怎么在不写点的前提下证明某个高重数截面不存在"，答案是把整件事搬进代数环面做有限插值。

### 2.2 jets 分片：把"单项式满秩"搬回"函数满秩"

`jets` 分片不产生新几何，它只负责一件事：让我可以在"初始单项式"这种离散对象上算，再把结论还原回解析函数。这是我从连续/离散两边来回穿行的第一块跳板。

**(a) 逐字陈述。** Lemma `lem:rank-persistence`（`jets:38-50`）：

```tex
\begin{lemma}[Persistence of a finite jet test]\label{lem:rank-persistence}
Let $m,r,N$ be positive integers and let $q_1,\ldots,q_r$ be distinct
points of an open subset $U\subset\C^2$.  For $1\le i\le N$ and
$0\le s<s_0$, let $f_{i,s}$ be holomorphic on $U$.  Suppose that, as
$s\downarrow0$, every derivative of $f_{i,s}$ of total order less than
$m$ at each $q_j$ converges to the corresponding derivative of $f_{i,0}$.
If the jet matrix of $f_{1,0},\ldots,f_{N,0}$ has column rank $N$, then
the jet matrix of $f_{1,s},\ldots,f_{N,s}$ also has column rank $N$ for
all sufficiently small positive $s$.
```

**(b) 推导。** jet 矩阵是 $r\binom{m+1}2$ 行、$N$ 列（`jets:23-24`），列满秩 $N$ 等价于一个 $N\times N$ 子式非零。假设把每个低阶导数在每点都逐点收敛地搬过去，那个非零子式的每个 entry 都是有限个导数的组合，随 $s\downarrow0$ 连续收敛到极限子式的对应 entry。非零复数是开条件，故极限非零推出 $s$ 充分小时子式非零，列秩仍是 $N$。末句"convergence locally uniformly on $U$ suffices"是把假设减弱到局部一致收敛，靠多圆盘 Cauchy 积分公式把导数收敛从函数收敛提上来（`jets:55-56`）。整段证明就一步：满秩由单个非零 minors 见证，非零在收敛下保持。

**(c) 为何是这些值。** $m,r,N$ 全正整数：$N$ 是我要塞进测试的函数个数，$r\binom{m+1}2\ge N$ 才有满列秩可能，但这只是先验约束，引理本身不要求它、只在给定满秩时保持。$s_0$ 只是"存在充分小正数"的记号，数值不重要，重要的是"充分小"这个 open 结论。收敛阶严格"total order less than $m$"是因为 $m$ 阶 jet 商 $\mathcal O/\mathfrak m^m$ 只记到 $<m$ 阶导数，多一个都不需要。

**(d) 候选失败路线。** [推测] 若我只知逐点收敛、不知局部一致，Cauchy 估计断链，导数不必然收敛，minors 就不保证连续。[推测] 若允许 $q_j$ 随 $s$ 移动并可能在极限里碰撞，则不同点会并成一个、行数掉下 $N$，满秩失去；所以 `lem:rank-persistence` 把 $q_j$ 钉死为 $U$ 中固定互异点是必须的。[推测] 若极限矩阵只列满秩，并非满 $N\times N$ 子式，则没有单个非零 minors 可跟，连续性论证无从锚定。

**(a) 逐字陈述。** Proposition `prop:initial-transfer`（`jets:82-97`）是真正干重活的搬运引理：

```tex
\begin{proposition}[Transfer from initial monomials]
\label{prop:initial-transfer}
Let $F\subset\C\{x,z\}$ be a finite-dimensional complex vector space
of convergent holomorphic germs, and let $t>0$.  The set $E_t(F)$ has
exactly $\dim F$ elements, and $F$ admits a basis whose initial exponents
are these distinct elements.

Let $r,m$ be positive integers.  If the monomial space
\[
 \Span_{\C}\{X^\alpha Z^\beta:(\alpha,\beta)\in E_t(F)\}
\]
has an injective order-$m$ jet test at some distinct points
$q_1,\ldots,q_r\in\T$, then representatives of $F$ on a common
neighborhood of the origin have an injective order-$m$ jet test at
distinct points arbitrarily close to the origin.
```

**(b) 推导。** 四步。第一步选基：在 $F$ 里取最小初始指数 $e_1$，$e_1$ 位系数是 $F$ 上非零线性泛函，取它等于 1 的 $f_1$，进它的余维 1 核继续；$N$ 步后得严格递增初始指数、初始系数全 1 的基，任意非零组合里第一个系数非零的基元提供不被抵消的初始项，故 $E_t(F)=\{e_1,\ldots,e_N\}$、恰 $\dim F$ 个。第二步单权分离：设 $M=1+\max_i(\alpha_i+t\beta_i)$，取小 $\eta>0$，令 $t'=t+\eta$，使每个 $e_i$ 成为 $f_i$ 里按权 $(1,t')$ 唯一最小项；$M$ 以上老权的项新权也 $\ge M$ 因第二指数非负，非初始有限项里"老权更大"或"老权相等但第二指数更大"两种情形都在小 $\eta$ 下保持严格（`jets:124-131`）。第三步膨胀：$g_{i,s}(X,Z)=s^{-\lambda_i}f_i(sX,s^{t'}Z)$，$\lambda_i=\alpha_i+t'\beta_i$；逐一致收敛到 $X^{\alpha_i}Z^{\beta_i}$，其证据是每个支撑指数满足 $\alpha+t'\beta-\lambda_i\ge0$、仅 $e_i$ 处取等，于是重标主项级数 $\sum|c|s_0^{\alpha+t'\beta-\lambda_i}R^{\alpha+\beta}=s_0^{-\lambda_i}\sum|c|(s_0R)^\alpha(s_0^{t'}R)^\beta<\infty$（`jets:153-160`），可和主项证一致收敛，再套稍大多圆盘上的 Cauchy 公式提出任意有限阶导数收敛。第四步搬运：极限单项式在 $q_j$ 有单射测试，`lem:rank-persistence` 把满秩传给 $g_{i,s}$；$D_s(X,Z)=(sX,s^{t'}Z)$ 可逆，像 $p_j=D_s(q_j)$ 互异趋原点，拉回保消灭阶，$s^{-\lambda_i}$ 只是换基标量，于是 $F$ 在 $p_1,\ldots,p_r$ 有单射 $m$ 阶测试。

**(c) 为何是这些值。** $M=1+\max$ 的 $+1$ 是把阈值抬过所有有限个 $e_i$ 的权，保证"$\ge M$"是严格脱离初始带；$\eta>0$ 存在是因为受影响的指数只有有限个（$M$ 以下），每个只压一条严格不等式，有限交非空。$s$ 取实正数、$t'$ 可无理：`jets:186-188` 明说"weights and the positive real dilation parameter need not be rational"，这是它比一般 Newton 多面体论证更灵活之处，因为膨胀 $s^{t'}Z$ 对任意实 $t'>0$ 在 punctured 邻域仍有意义。关键不变量：`jets:183-185` 强调 $t'$ 只分离那些用 $t$ 选出的初始项、指数本身不动，所以"初始指数落在某固定图内"这条界在整个搬运中被保持，这正是后面 `node` 分片能用 $kQ_t$ 控住一切的接口。

**(d) 候选失败路线。** [推测] 若不把"用 $t$ 选初始项"和"用 $t'$ 分离"拆成两步，直接令 $t'=t$，则同权不同第二指数的并列项无法被单一方程分离，基的初始项不唯一、$E_t(F)$ 大小不控。[推测] 若 $f_i$ 只是形式级数，并非收敛级数，重标主项级数不绝对收敛，一致收敛与导数收敛全断；所以命题假设里 $\mathcal C\{x,z\}$（收敛）是硬的。[推测] 若测试点 $q_j$ 固定在环面，并非允许搬到原点附近，则 $D_s(q_j)\to0$ 只是"趋近"，要保证 $p_j$ 落进同一坐标邻域并互异，需 $s$ 足够小，这一步若跳过，拉回映射不定义在公共邻域上。

`node`、`compression`、`lattice` 三片都靠 `prop:initial-transfer` 把离散的单项式测试还原成曲面截面测试，所以这块基石先立住，后面我才能只在指数图 $\Z^2$ 的凸多边形上做组合估计。

## 3 node 分片(a)：先造一条带节点的 ample 除子

`node` 分片干两件活：先在 $S$ 上钉死一条只有一个普通节点、其余光滑的整除子 $V\in|dL|$，再用它把任意截面的初始指数控在一个四边形里。第一件事是 Lemma `lem:node`。

**(a) 逐字陈述。** `node:15-21`：

```tex
\begin{lemma}[A nodal ample divisor]
\label{lem:node}
Let $S$ be a smooth integral complex projective surface and let $L$ be an
ample line bundle.  There exist a positive integer $d$, an integral divisor
$V\in|dL|$, and a point $p\in V$ such that $V$ is smooth away from $p$ and
has two smooth transverse analytic branches at $p$.
\end{lemma}
```

**(b) 推导。** 取 $e>0$ 使 $eL$ very ample，把 $S$ 嵌入 $\PP^N$，令 $p=[1:0:\cdots:0]$。$X_1,\ldots,X_N$ 的限制生成 $\mathcal I_p\otimes\mathcal O_S(eL)$（`node:26-29`）：$p$ 外至少一个非零，$p$ 邻域里它们与 $X_0$ 的比值生成极大理想，因为嵌入是闭浸入。这些生成元给出到 twisted Rees 代数 $\bigoplus_n\mathcal I_p^n\otimes\mathcal O_S(neL)$ 的满射，取相对 Proj 得闭浸入 $X=\operatorname{Bl}_pS\hookrightarrow S\times\PP^{N-1}$（投影自 $p$ 的图的闭包），第二因子拉回的 $\mathcal O(1)$ 是 $\mathcal O_X(e\pi^*L-E)$。把第一因子也嵌进 $\PP^N$，very ample 的 $\mathcal O(1,1)$ 限制为

$$\mathcal A=\mathcal O_X(2e\pi^*L-E),\qquad \mathcal A^{\otimes2}=\mathcal O_X(4e\pi^*L-2E)\ \text{very ample}.$$

$X$ 光滑整射影，Bertini 说最后一线性系里一般除子 $\widetilde V$ 光滑且整，还可要求它横截交 $E$ 于两点（`node:52-64`）：$\mathcal A|_E\simeq\mathcal O_{\PP^1}(1)$，其截面限制生成整个 bundle，乘积给出 $H^0(X,\mathcal A^{\otimes2})\to H^0(E,\mathcal O_{\PP^1}(2))$ 满射，"$E$ 上两个不同零点"是非空开条件。令 $d=4e$、$V=\pi(\widetilde V)$，推下除子类得 $V\in|dL|$，$V$ 整因 $\widetilde V$ 整。爆破在 $E$ 外是同构，故 $V$ 在 $p$ 外光滑；局部爆破坐标 $(a_0,u_0)\mapsto(a_0,a_0u_0)$、$E=\{a_0=0\}$，横截 $E$ 的曲线以 $a_0$ 为局标，其像是光滑分支，两点给出两个不同切向，故两支在 $p$ 光滑横截。

**(c) 为何是这些值。** $e$ 的存在来自 ample 某次幂 very ample，这是定理只假设 $L$ ample（不假设 very ample）时唯一能起手的量。$\mathcal A=\mathcal O_X(2e\pi^*L-E)$ 的系数 $2e$ 是"$-E$ 一次补偿 $e\pi^*L$ 的例外拉回"再叠 $\mathcal O(1,1)$，$-E$ 的系数恰为 $1$ 是因为 blow-up 里理想 $\mathcal I_p\mathcal O_X=\mathcal O_X(-E)$。$d=4e$ 不是随手：要 $\widetilde V\cap E$ 是 $\PP^1$ 上 $\mathcal O(2)$ 的两个截面零点，$\mathcal A|_E=\mathcal O(1)$ 的二次幂才给到 $H^0(\mathcal O(2))$ 的满射，故用 $\mathcal A^{\otimes2}$，push-forward 消掉 $-2E$ 留下 $4e$，$d$ 就被迫是 $4e$。为什么非要两个分支横截：$V$ 局部方程要写成 $\tau=u(x,z)\,xz$（`node:81-84`，$u(0,0)\ne0$），两支是坐标轴，才有后面的权 $(1,t)$ 指数序可用；一个分支或高阶切点都退化不出 $xz$ 这个模型。$T>1$ 由 `node:88-93` 的 `eq:weight-range` $(1+t)^2>d^2Ht$ 定，只要 $t>T$ 就自动成立，可行性来自左边 $t^2$ 主导右边一次 $d^2Ht$。

**(d) 候选失败路线。** [推测] 若直接对 ample 的 $L$ ，并非某幂 $eL$ 用 Bertini，$|L|$ 未必无基点甚至未必非空，闭浸入与相对 Proj 的整条 Rees 构造都起不来。[推测] 若只取 $\mathcal A$ 而不平方，限制到 $E$ 只有 $\mathcal O(1)$，其截面零点是一个，并非两个，$V$ 只碰到一支，节点模型 $xz$ 无法出现。[推测] 若 $S$ 非整，`node:126-129` 那句"用 $V$ 的整体性但不声称其节点解析 germ 不可约"会失效：$D\cap V$ 可能含整条代数分支，$\ell_x,\ell_z$ 的有限性论证崩掉。

## 4 node 分片(b)：四边形指数界 prop:quadrilateral

这是把"截面消灭阶"翻译成"$\Z^2$ 里落在某凸四边形"的核心引理，后面一切组合估计都建立在它给的 $kQ_t$ 上。

**(a) 逐字陈述。** `node:110-120`，配 `node:95-102` 的图定义：

```tex
\begin{proposition}[The quadrilateral bound]
\label{prop:quadrilateral}
For the surface, line bundle, nodal divisor, coordinates and frame fixed
above, every integer $k\ge1$, every $t>T$, and every nonzero
$s\in H^0(S,kL)$ satisfy
\[
 \nu_t(s)\in kQ_t.
\]
Moreover, $H^0(S,kL)$ has a basis with pairwise distinct initial exponents
in $kQ_t$; the basis is empty if this section space is zero.
\end{proposition}
```

其中 `node:95-102`：$c=1/d$、$W=dH$、$a=Wt/(1+t)$、$b=W/(1+t)$、$Q_t=\conv\{(0,0),(a,0),(c,c),(0,b)\}$；$\nu_t(f)$ 是按 $(\alpha+t\beta,\beta)$ 定序的首个非零 Taylor 指数。

**(b) 推导。** 先设 $\operatorname{div}(s)=D$ 不含 $V$，写局函数 $f(x,z)$。$f(x,0)$、$f(0,z)$ 不恒零，因 $D\cap V$ 是整曲线 $V$ 的真闭子集故有限，恒零分支会把整条解析支塞进有限集（`node:123-129`）。令 $\ell_x=\ord_0f(x,0)$、$\ell_z=\ord_0f(0,z)$、$v=\nu_t(f)$ 的权，纯项给 $\ell_x\ge v$、$\ell_z\ge v/t$，消灭阶在两支上可加，于是

$$v\Bigl(1+\frac1t\Bigr)\le\ell_x+\ell_z=I_p(D,V)\le D\cdot V=kdH=kW.$$

故 $v\le kW/(1+1/t)=kWt/(1+t)=ka$，配合 $\ell_z\ge v/t$ 得 $\nu_t(s)\in k\Delta_t$，$\Delta_t=\conv\{(0,0),(a,0),(0,b)\}$（因 $a=tb$）。一般 $s$：设 $D$ 里 $V$ 的重数 $j$，除以定义截面得 $s=\tau^j\rho$，$\rho\in H^0(nL)$、$n=k-jd$，$\operatorname{div}(\rho)=R$ 不含 $V$；$nH=L\cdot R\ge0$ 给 $n\ge0$。$n=0$ 时 ampleness 逼 $R=0$、$\rho$ 是非零常数。指数序与加法相容故乘积下初始指数相加，单位初始指数 $(0,0)$，`eq:node-unit` 的 $\tau$ 首项是 $xz$ 给 $\nu_t(\tau)=(1,1)$，故 $\nu_t(s)=(j,j)+\nu_t(\rho)$；归一化 $\nu_t(s)/k=(n/k)\cdot\nu_t(\rho)/n+(jd/k)(c,c)$，两系数非负和为一（$jd/k=j d/k$，$n/k=(k-jd)/k$，和 $=1$；且 $(c,c)=(1/d,1/d)$，$jd\cdot(c,c)=(j,j)$），凸组合落在 $Q_t$。最后限制到解析坐标卡在全局截面上单射（identity theorem），对有限维 germ 空间套 `prop:initial-transfer` 得具互异初始指数的基。

**(c) 为何是这些值。** $a=tb$ 保证 $\Delta_t$ 是直角边在轴上的三角形，$v\le ka$ 与 $\ell_z\ge v/t$ 两条界正好把它框住。$Q_t$ 第四个顶点 $(c,c)$ 来自 $\tau=xz$ 每乘 $V$ 给 $(1,1)$、归一化后是 $(c,c)=(1/d,1/d)$，即"一份 $V$"占 $dL$ 的 $1/d$。`node:105-108` 说 `eq:weight-range` 等价于 $c/a+c/b>1$，正是 $(c,c)$ 严格越过 $(a,0)$--$(0,b)$ 连线、使 $Q_t$ 真是四边形，并非三角形的条件；少了它 $Q_t$ 塌成 $\Delta_t$，节点贡献 $(c,c)$ 就被丢掉。$kQ_t$ 的 $k$ 是齐次：$s\in H^0(kL)$ 与 $kdH=D\cdot V$ 一致缩放，$W=dH$ 是每单位 $k$ 的交数预算。$t>T$ 不是任意：$a=Wt/(1+t)\nearrow W$、$b=W/(1+t)\searrow0$，随 $t$ 连续变形状，这正是第 8 节 `lat` 分片里 `lem:direction` 要用的"连续可调形状"。

**(d) 候选失败路线。** [推测] 若 $D$ 含 $V$ 却不剥掉 $\tau^j$，交数 $I_p(D,V)$ 变成无穷（两支重合），$v(1+1/t)\le\infty$ 无界，界失效；剥离正是为回到"$R$ 不含 $V$"。[推测] 若用固定权 $t=1$ ，并非 $(1,t)$，则 $\ell_x,\ell_z$ 都只给 $v$ 的同一种约束，得不到 $\Delta_t$ 的斜边；两个不同权 $(1,t)$ 才把两支消灭阶分开。[推测] 若 $S$ 非射影，identity theorem 仍给单射，但没有 $H^0$ 有限维与 Riemann--Roch，`prop:initial-transfer` 的应用前提就断，这也是全篇假设射影的原因之一。

## 5 compression 分片：把对角切片压回原点高度

`node` 给我四边形 $kQ_t$，但四边形不是标准三角形、不能直接套格点重数估计。`compression` 分片用一个环面坐标改变加"对角切片压缩"，把 $kQ_t$ 的单射测试还原到面积 $k^2H/2$ 的三角形 $kP_t$。

**(a) 逐字陈述。** 切片引理 `comp:15-29` 与压缩命题 `comp:57-62`：

```tex
\begin{lemma}[Diagonal slices]\label{lem:slices}
For $-b\le q\le a$, the slice of $Q_t$ on the line
$\alpha-\beta=q$ has length in the $\beta$ coordinate equal to
\[
 \ell_t(q)=
 \begin{cases}
 c(1+q/b),&-b\le q\le0,\\[2pt]
 c(1-q/a),&0\le q\le a.
 \end{cases}
\]
There are no slices outside this interval, and
\[
 P_t=\{(q,h):-b\le q\le a,\ 0\le h\le\ell_t(q)\}.
\]
\end{lemma}
```

```tex
\begin{proposition}[Diagonal compression]\label{prop:compression}
Let $k,m,r$ be positive integers.  If $\mathcal M(kP_t)$ has injective
order-$m$ jets at some $r$ distinct points of $\T$, then
$\mathcal M(kQ_t)$ has injective order-$m$ jets at some $r$ distinct
points of $\T$.
\end{proposition}
```

**(b) 推导。** 切片：用 `eq:weight-range` 等价式 $c(a+b)>ab$ 说明 $(c,c)$ 越过 $(a,0)$--$(0,b)$ 连线；换坐标 $(q,\beta)=(\alpha-\beta,\beta)$ 后 $Q_t$ 四顶点循环序是 $(0,0),(a,0),(0,c),(-b,b)$。$0\le q\le a$ 时切片从 $\beta=0$ 到 $c(1-q/a)$；$-b\le q\le0$ 时从 $\beta=-q$ 到 $c+\frac{c-b}bq$，端点相减即 $\ell_t(q)=c(1+q/b)$，$P_t$ 正是这顶棚下区域。压缩：用环面坐标 $(x,z)=(u,v/u)$，单项式 $x^\alpha z^\beta$ 变 $u^qv^\beta$，$q=\alpha-\beta$。每个非空整切片 $q$ 的基是 $u^qv^{\beta_q^-}(v-1)^h$，$0\le h\le\beta_q^+-\beta_q^-$，因展开 $(v-1)^h$ 给出从 $v$ 连幂的上三角换基、对角全 1。由 `lem:slices`，$h\le\beta_q^+-\beta_q^-\le k\ell_t(q/k)$，故每对 $(q,h)$ 落进 $kP_t\cap\Z^2$。取给 $\mathcal M(kP_t)$ 单射测试的 $r$ 点 $(u_i,y_i)$；对正参数 $s$ 作代换 $v=1+sy$ 并把第 $h$ 号除 $s^h$，得 $u^q(1+sy)^{\beta_q^-}y^h\to u^qy^h$（$s\to0^+$），局部一致带各阶导收敛。极限单项式张成 $\mathcal M(kP_t)$ 的子空间故列满秩，`lem:rank-persistence` 把满秩传给左边函数，它们恰是 $\mathcal M(kQ_t)$ 某基的重标拉回。原环面对应点是 $(u_i,(1+sy_i)/u_i)$，互异，坐标映射 Jacobian 行列式 $s/u\ne0$ 保消灭阶，于是 $\mathcal M(kQ_t)$ 单射。

**(c) 为何是这些值。** 切片变量 $q=\alpha-\beta$ 沿 $(1,1)$ 方向，因为压缩要"保对角切片长度、把下端挪到高度 0"，这正是把四边形 $Q_t$ 变成同面积顶棚 $P_t$ 的位移。$P_t=\conv\{(-b,0),(a,0),(0,c)\}$ 面积 $c(a+b)/2=(1/d)(dH)/2=H/2$，不依赖 $t$；这条不变量 `lat` 分片直接引用（`intro:146-148`："$\operatorname{area}(P_t)=H/2$ makes the torus jet threshold exactly $\sqrt{H/r}$"）。代换 $v=1+sy$ ，并非别的形变，是因为 $(v-1)$ 在测试点处 $\to0$ 时才把 $(v-1)^h$ 压成 $y^h$ 单项、且 Jacobian $s/u$ 非零保消灭阶；系数 $1+sy$ 在 $s$ 小、$|sy|<1/2$ 时离零，保证 Laurent 负幂仍全纯收敛（`comp:110-111`）。$h\le k\ell_t(q/k)$ 里的 $1/k$ 来自"第 $q$ 片"对应 $kP_t$ 里的 $q/k$ 归一高度。

**(d) 候选失败路线。** [推测] 若压缩保的是竖直切片，并非对角切片，面积不变量 $H/2$ 仍可能在，但重数估计要用的是"竖直范围"（`lat:18-19` 定义 vertical range），对角压缩恰好把竖直范围做成 $\ell_t$ 顶棚，竖切会把这两件事解耦、得不到第 6 节要的形状。[推测] 若代换用 $v=1+s^2y$，Jacobian 变 $2s\cdot s/u$ 仍非零、但极限基的标量归一化对不上 $h$ 阶，`lem:rank-persistence` 假设的逐导数收敛里会出现 $s$ 依赖的发散项。[推测] 若 $\beta_q^-,\beta_q^+$ 之间不连续（凸性破），三角换基的"$0$ 到 $\beta^+-\beta^-$ 全整数"就不成立，$(q,h)$ 集与 $kP_t$ 的格点集对不齐，无法断言极限单项式落在 $\mathcal M(kP_t)$。

推论 `cor:surface-transfer`（`comp:137-157`）把 $\mathcal M(kP_t)$ 环面单射一步抬成 $H^0(S,kL)$ 曲面单射：$H^0(S,kL)=0$ 时结论平凡，否则 `prop:compression` 给 $\mathcal M(kQ_t)$ 环面测试，在节点坐标卡平凡化 $L$ 把截面当解析 germ，`prop:quadrilateral` 给出初始单项落在 $kQ_t$ 的基，其张成在刚造的环面元组上单射，`prop:initial-transfer` 搬到卡内互异点。至此，我只要在一个三角形 $kP_t$ 上造出环面单射测试，就能整条还原回曲面。剩下的全部难度，浓缩成"怎么在 $kP_t$ 上找到 $r$ 个点让 $m>k\sqrt{H/r}$ 的 jet 测试单射"，这是 `lattice` 分片的活。

## 6 lattice 分片(a)：三角形上的单点重数估计

`lattice` 分片的终点是：把 $r$ 个点取成环面 $\mathcal T$ 的一个有限子群 $G$，然后对 $G$ 的每个陪集分量用"单个点 $(1,1)$ 处的重数不超过某数"这一初等估计。承担这个估计的是 Lemma `lem:triangle-multiplicity`。

**(a) 逐字陈述。** `lat:22-30`：

```tex
\begin{lemma}\label{lem:triangle-multiplicity}
Let $\rho>0$, and let $\Delta\subset\R^2$ be a triangle of area
$\rho^2/2$ and vertical range $\rho$.  Every nonzero Laurent polynomial
$F\in\C[U^{\pm1},Z^{\pm1}]$ whose exponent support is contained in
$\Delta$ satisfies
\[
 \ord_{(1,1)}F\leq\rho.
\]
\end{lemma}
```

vertical range 在 `lat:18-19` 定义为"投到第二坐标轴的长度"。

**(b) 推导。** 对落在竖直投影里的高度 $y$，记 $\ell(y)$ 为切片水平长度，三顶点高 $y_0\le y_1\le y_2$、$y_2-y_0=\rho$。三高互异时 $\ell$ 从 $y_0$ 处 0 线性升到 $y_1$ 处最大再线性降到 $y_2$ 处 0；两高重合时有一条水平边、只剩一段线性。两种情况都是"面积 $=\frac12\cdot$竖直范围$\cdot$最大切片"，故最大切片 $=\rho$。更精：$0\le e\le\rho$ 时 $\{y:\ell(y)\ge e\}$ 是长 $\rho-e$ 的区间（端点 $y_0+\frac e\rho(y_1-y_0)$ 与 $y_2-\frac e\rho(y_2-y_1)$，`lat:49-53`）。写 $F=\sum_q f_q(U)Z^q$，$e$ 是各行 $f_q$ 在 $U=1$ 的最小消灭阶，除以 $(U-1)^e$ 得 $F=(U-1)^eD$、$D(1,Z)\ne0$。$f_q=(U-1)^e d_q$ 的水平跨度恰为 $e$ 加 $d_q$ 的跨度（乘积首末系数非零），故 $D$ 出现的高度处 $\ell(q)\ge e$，于是 $e\le\rho$ 且 $D$ 的高度跨 $\le\rho-e$。置 $U=1$，$D(1,Z)$ 指数跨 $\le\rho-e$，乘 $Z$ 幂成普通多项式 degree $\le\rho-e$，故 $\ord_{(1,1)}D\le\ord_1D(1,Z)\le\rho-e$，乘积消灭阶相加给 $\ord_{(1,1)}F\le\rho$。末尾 `lat:89-91` 强调所有跨与阶都是整数，$\rho$、顶点、平移向量都不需整数性。

**(c) 为何是这些值。** 面积 $\rho^2/2$ 配竖直范围 $\rho$ 不是巧合：$\frac12\rho\cdot\rho=\rho^2/2$，正是"最大切片 $=\rho$"的解，这条把"面积"与"竖直范围"绑成同一个尺度 $\rho$，而 $kP_t$ 面积 $k^2H/2$、竖直范围经 `subgroup-test` 换算成 $k\sqrt{H/r}$ 时 $\rho^2/2$ 自动对上。为什么 Laurent ，并非普通多项式：指数有负，$U$ 可取负幂；证明里除以 $(U-1)^e$ 后"所有 $d_q$ 仍是 Laurent 多项式"（`lat:66-67`）就靠这点。$e$ 取"各行在 $U=1$ 的最小阶"，并非整体阶，是因为把 $(U-1)^e$ 提出后要保证 $D(1,Z)\ne0$，即至少一个 $d_q(1)\ne0$，不同 $Z$ 幂线性无关（`lat:65-66`）。为什么用竖切，并非任意方向：$U=1$ 代入只对"第一坐标消灭"敏感，竖切把重数拆成"水平方向的 $(U-1)$ 幂"与"竖直方向的 $Z$ 多项式次数"两个独立预算，正好各 $\le\rho$。

**(d) 候选失败路线。** [推测] 若三角形竖直范围换成 $\rho$ 但面积给 $\rho^2/4$，最大切片变 $\rho/2$，$e$ 与竖直跨之和失去 $\rho$ 的平衡，$\ord\le\rho$ 可能不成立。[推测] 若允许顶点带任意平移但把 $e$ 定义成整 $F$ 在 $(1,1)$ 的阶，并非各行最小阶，提 $(U-1)^e$ 时 $Z$ 方向也会同时降阶，跨长不等式破。[推测] 若 $\Delta$ 退化成四边形或两顶点同高但非水平边（`lat:40-42` 的"水平边"假设没满足），"$\ell$ 单峰"不成立，面积公式与 $\rho-e$ 区间长都失据；引理因此硬要求是三角形。

## 7 lattice 分片(b)：有限子群当测试点，prop:subgroup-test

这是全篇把"连续形状"钉成"离散格"的中枢：给定一个方向 $u$，造出恰有 $r$ 个点的子群，让每阶 $m>k\sqrt{H/r}$ 的测试自动单射。

**(a) 逐字陈述。** `lat:101-113`：

```tex
\begin{proposition}\label{prop:subgroup-test}
Let $H>0$, let $r$ be a positive integer, and let $P\subset\R^2$ be a
triangle of area $H/2$.  Suppose there is a primitive vector $u\in\Z^2$
such that
\[
 \max_{\xi\in P}\det(u,\xi)
 -\min_{\xi\in P}\det(u,\xi)=\sqrt{rH}.
\]
Then there is a subgroup $G\subset\T$ of exactly $r$ distinct points
such that, for all positive integers $k,m$ with
$m>k\sqrt{H/r}$, the order-$m$ jet test on $\mathcal M(kP)$ at $G$ is
injective.
\end{proposition}
```

**(b) 推导。** 把 $u$ 补成整基 $(u,v_0)$、$\det(u,v_0)=1$，令 $v=rv_0$、$M=\Z u+\Z v$ 是指标 $r$ 的子格。特征 $\chi_\eta(x,z)=x^{\eta_1}z^{\eta_2}$，$G=\{p:\chi_\eta(p)=1,\ \forall\eta\in M\}$。$X=\chi_u$、$Y=\chi_{v_0}$ 是环面坐标（指数矩阵 unimodular），$G=\{(X,Y):X=1,Y^r=1\}$，在 $\C$ 上恰 $r$ 点。反设非零 $f\in\mathcal M(kP)$ 在 $G$ 每点阶 $\ge m$。对 $g\in G$ 令 $(\tau_gf)(p)=f(gp)$，沿 $G$ 平均投影到陪集 $\eta+M$：$f_\eta=\frac1r\sum_g\chi_\eta(g)^{-1}\tau_gf$，恰为 $f$ 中指数落在 $\eta+M$ 的单项和（因 $\frac1r\sum_g\chi_{\xi-\eta}(g)$ 在 $\xi-\eta\in M$ 时为 1、否则 0，`lat:147-153`）。每个 $f_\eta$ 仍每点 $\ge m$、支撑仍在 $kP$，取其一非零。乘 $\chi_{-\eta}$ 保局部阶、把支撑移进 $M$：$\chi_{-\eta}f_\eta=F(U,Z)$，$U=\chi_u$、$Z=\chi_v=Y^r$。$(x,z)\mapsto(U,Z)$ 在恒等元局部可逆（$(X,Y)\mapsto(X,Y^r)$ 导数 $\operatorname{diag}(1,r)$），复反函数定理给小邻域全纯双射，故 $\ord_{(1,1)}F=\ord_{(1,1)}(\chi_{-\eta}f_\eta)\ge m$。设 $N$ 列为 $u,v$，$\det N=r$，$F$ 支撑在 $\Delta=N^{-1}(kP-\eta)$，面积 $k^2H/(2r)$（`lat:183`），第二坐标 $N^{-1}\xi=\det(u,\xi)/r$ 故竖直范围 $k\sqrt{rH}/r=k\sqrt{H/r}$。对 `lem:triangle-multiplicity` 取 $\rho=k\sqrt{H/r}$（因 $\Delta$ 面积 $=\rho^2/2$ 且竖直范围 $=\rho$），得 $\ord_{(1,1)}F\le k\sqrt{H/r}<m$，与 $\ge m$ 矛盾。

**(c) 为何是这些值。** 条件 $\max_P\det(u,\cdot)-\min_P\det(u,\cdot)=\sqrt{rH}$ 被 $\rho=k\sqrt{H/r}$ 消费：$\det(u,\cdot)$ 在 $P$ 上的跨度 $\sqrt{rH}$，经 $N^{-1}$ 的第二坐标除以 $r$ 后成 $\sqrt{rH}/r=\sqrt{H/r}$，再乘 $k$ 就是 $\rho$，于是 $m>k\sqrt{H/r}$ 恰卡在重数上界外侧。指标 $r$ 来自 $v=rv_0$（把 $v_0$ 拉 $r$ 倍使 $\det(u,v)=r$）与"$Y^r=1$ 有 $r$ 根"，两条独立给出 $|G|=r$。primitive $u$ 保证 $u$ 能补成 $\det=1$ 的整基，从而 $M$ 真为指标 $r$ 子格；$u$ 若不带互质坐标则补不成 unimodular 基、坐标 $X=\chi_u$ 不再是环面自同构。平均投影用 $\frac1r$ 归一化是滤出单个陪集的标准 Fourier 系数，靠 $r$ 次单位根正交。面积 $H/2$ 是 `compression` 分片辛苦保住的不变量，这里直接喂进来。

**(d) 候选失败路线。** [推测] 若 $G$ 取成方格 $\mu_r\times\mu_r$（$r^2$ 点），并非秩 1 子群，点数对不上 $r$，重数预算会被平方级放大、$\rho$ 与 $\sqrt{H/r}$ 脱钩；论文 `intro:151-152` 明说"$G$ 不必是方格"、是两方程之核，正是为把点数压到恰 $r$。[推测] 若跳过"复反函数定理局部可逆"直接用 $(X,Y)\to(X,Y^r)$，它在整个环面上 $r$ 对 1、非单射，$\ord_{(1,1)}$ 的等式只在局部成立，`lat:175-176` 特意声明"只用到局部可逆"。[推测] 若 $\eta$ 选成让所有 $f_\eta=0$，$f=\sum f_\eta$ 被迫 $f=0$、与反设非零矛盾，所以"取一非零分量"这步总是可用。

## 8 lattice 分片(c)：每个大整数配到一个格方向

`prop:subgroup-test` 是条件式的：它要求存在 primitive $u$ 使 $\det(u,\cdot)$ 在 $P$ 上跨度恰为 $\sqrt{rH}$。`lem:direction` 负责证明"每个充分大 $r$ 都能找到这样的 $u$ 和 $t$"，门槛 $r_0$ 正是在这里落地。

**(a) 逐字陈述。** `lat:204-209`：

```tex
\begin{lemma}\label{lem:direction}
Fix $d,H>0$ and $T>1$, and define $P_t$ as above for $t>T$.
For every sufficiently large integer $r$ there are $t>T$ and a primitive
vector $u\in\Z^2$ such that the range of $\det(u,\cdot)$ on $P_t$ has
length $\sqrt{rH}$.  The threshold depends only on $d,H,T$.
\end{lemma}
```

**(b) 推导。** 记 $W=dH$、$a_0=WT/(1+T)$，$t\in(T,\infty)$ 时 $a=Wt/(1+t)$ 连续双射跑遍 $(a_0,W)$。给 $R=\sqrt{rH}$ 足够大，取 $j$ 为不超过 $R/(2W)$ 的最大的 2 的幂，则 $\frac{R}{4W}<j\le\frac{R}{2W}$、$jW<R$。开区间 $I_r=(d(R-jW),d(R-ja_0))$ 长度 $dj(W-a_0)>\frac{dR}{4(1+T)}$，$r$ 大时超过 2，故含一奇整数 $i>0$；$j$ 是 2 幂而 $i$ 奇，$u=(i,j)$ primitive。$I_r$ 的定义给 $a_*=(R-i/d)/j\in(a_0,W)$，取唯一 $t>T$ 使 $a=a_*$。由 $b=W-a$ 得 $i/d+ja=R$、$i/d-jb=R-jW>0$。三个顶点 $\det$ 值：$\det(u,(-b,0))=jb$、$\det(u,(a,0))=-ja$、$\det(u,(0,1/d))=i/d$，最小 $-ja$、最大 $i/d$，跨度 $i/d+ja=R=\sqrt{rH}$。

**(c) 为何是这些值。** $j$ 取 2 的幂是为让 $u=(i,j)$ 自动 primitive：只要 $i$ 奇，$\gcd(i,2^k)=1$。$j\le R/(2W)$ 且 $>R/(4W)$ 保证 $jW<R$（使 $i/d-jb>0$、最大点确是 $i/d$ ，并非别的）同时 $I_r$ 有正下界。$I_r$ 长度 $>2$ 是"必含一个整数"的保险量：开区间长度超 2 保证含整数，且要求含的是奇数，所以实际用"长度 $>2$ 时奇偶整数都会出现"。下界都只依赖 $d,H,T$，$r_0$ 因此只依赖固定数据。$t$ 靠 $a$ 单调可逆从 $a_*$ 反解，$a\in(a_0,W)$ 的开性保证 $t>T$ 有限存在。`lat:236` 的 $b=W-a$ 用了 $a+b=W=dH$ 这条 `node`/`compression` 里的老关系。

推论 `cor:torus-test`（`lat:255-271`）把两者合流：先固定 $r$、用 `lem:direction` 选 $t$ 和 $u$，`area(P_t)=H/2` 让 `prop:subgroup-test` 一次产出对所有 $(k,m)$ 同时成立的 $G$。论文明说"$r_0$，然后 $t,G$，都在 $k,m$ 之前选定"（`lat:270`），这句量化顺序正是 `intro:122` 强调的"$r$ 门槛要对任意大 jet 阶 work"。

**(d) 候选失败路线。** [推测] 若允许 $j$ 非 2 幂，$i$ 奇不再保证 $\gcd(i,j)=1$，$u$ 可能不 primitive、`prop:subgroup-test` 的前提破。[推测] 若把 $I_r$ 长度下界 $\frac{dR}{4(1+T)}$ 里的 4 换成更大常数，区间变窄、可能不含整数，$r_0$ 被推高甚至无穷，说明"2 幂 $j$ + 长度 2"是使区间宽到能落整数又保住 $jW<R$ 的折中。[推测] 若不要求 $t$ 与 $u$ 先于 $k,m$ 固定，而让 $u$ 依赖 $m$，则回到"每对 $(k,m)$ 各自证 generic"的老路，`cor:torus-test` 的"单个 $G$ 覆盖全部 $k,m$"失效，`lem:jet-open` 的可数交也无从谈起。

## 9 nef 分片(a)：单射测试是开条件，Baire 交出 very general

前面每一对 $(k,m)$ 我都能造出一个见证元组，但那个元组依赖 $(k,m)$。`lem:jet-open` 负责把可数多个"某对 $(k,m)$ 单射"合并成"在 very general 元组上全部单射"，这是从构造性见证跨到 generic 陈述的唯一一跃。

**(a) 逐字陈述。** `nef:9-19`：

```tex
\begin{lemma}[The open locus of an injective jet test]\label{lem:jet-open}
Let $S$ be a smooth integral complex projective surface, let $L$ be a line
bundle, and let $r,k,m$ be positive integers. In the configuration space
\[
 U_r=\{(p_1,\ldots,p_r)\in S^r:p_i\ne p_j\text{ for }i\ne j\},
\]
the tuples at which the order-$m$ jet test on $H^0(S,L^{\otimes k})$
is injective form a Zariski-open subset. If each test in a countable
collection with fixed $S,L,r$ is injective at some tuple, then all those tests are
simultaneously injective at very general tuples. Their common locus is
nonempty.
\end{lemma}
```

**(b) 推导。** jet 丛 $\mathcal J_{k,m}=q_{1*}(q_2^*L^{\otimes k}\otimes\mathcal O_{S\times S}/\mathcal I_\Delta^m)$，局部自由 rank $\binom{m+1}2$：对角线是正则嵌入、法丛 $\Omega_S^1$，逐层商推到 $S$ 上是 $L^{\otimes k}\otimes\operatorname{Sym}^j\Omega_S^1$、rank $j+1$，$0\le j<m$，求和 $\binom{m+1}2$；加厚对角线在 $S$ 上有限故推进精确。写 $\operatorname{pr}_i:U_r\to S$，代数丛映射 $H^0(S,L^{\otimes k})\otimes\mathcal O_{U_r}\to\bigoplus_i\operatorname{pr}_i^*\mathcal J_{k,m}$，纤维核恰是"每点消灭阶 $\ge m$"的截面。$n=h^0>0$ 时非单射由 $n\times n$ 子式局部切出，$n=0$ 时处处单射，两种下单射轨迹 Zariski 开、单个见证元组使其非空。解析与代数有限 jet 在复点一致，故前面解析搬运得到的元组在此是合法见证。$U_r$ 光滑既约，真代数闭集在复流形里内部为空，可数个非空单射开集的补是无处稠密切闭，$U_r(\C)$ 局部紧 Hausdorff 是 Baire 空间，故交非空且稠密，按构造是 $U_r$ 可数真 Zariski 闭并的补。

**(c) 为何是这些值。** rank $\binom{m+1}2$ 是二维 $<m$ 阶 jet 的个数，与 `jets:23` 的行数一致，是 $J^m$ 靶维数的代数版本。"$S,L,r$ 固定、只对 $(k,m)$ 取可数族"是 Baire 成立的前提：可数才对得上无处稠密集的 Baire 定理，若需要不可数多个开集交非空就会失效。Baire 需要局部紧 Hausdorff 所以用 $U_r(\C)$ 的解析拓扑，并非纯 Zariski 拓扑，`nef:59-66` 把 Zariski 闭与解析无处稠密对接起来。这里 $L$ 只写 line bundle、不需 ample（`nef:11`），说明该引理是纯开性论证，ample 的用量全在别的引理里。

**(d) 候选失败路线。** [推测] 若在特征 $p$ 或非既约 $U_r$ 上做，"真闭集内部为空 + Baire"失效，very general 的存在性丢；论文 `cor:fields` 只在特征 0 扩域正因如此。[推测] 若单射见证元组对每个 $(k,m)$ 存在但全落在不同的小闭集里、无法同时避免，Baire 保证的是"同时避免可数个闭集"的 generic 点存在，前提是每个闭集真、每个开集非空，两者缺一 Baire 交可能空。[推测] 若解析与代数 jet 不一致（例如无穷 jet 或形式邻域），前面解析构造的元组就不是代数开集的见证，`nef:54-57` 那句一致性检查正是补这个接口。

## 10 nef 分片(b)：正平方除子的充分大倍是有效的

现在只剩把"每点等重数 $m$ 的单射测试"升成"每条曲线都不违反数值界"的 nef。这一步要先把一个"越过边界的正平方有理除子"变成有效除子，工具是 Riemann--Roch，即 Lemma `lem:positive-square`。

**(a) 逐字陈述。** `nef:73-80`：

```tex
\begin{lemma}[Effective multiples of a positive-square divisor]
\label{lem:positive-square}
Let $Y$ be a smooth integral complex projective surface, let $A$ be a
nef real divisor class, and let $D$ be a rational Cartier divisor.
If $D^2>0$ and $A\cdot D>0$, then
$H^0(Y,\mathcal O_Y(kD))\ne0$ for every sufficiently large positive
integer $k$ divisible by the denominators of $D$.
\end{lemma}
```

**(b) 推导。** 取 $q$ 使 $qD$ Cartier，$k$ 跑 $q$ 的正倍数。Serre 对偶给 $h^2(Y,\mathcal O_Y(kD))=h^0(Y,\mathcal O_Y(K_Y-kD))$。$k$ 大时 $A\cdot(K_Y-kD)=A\cdot K_Y-kA\cdot D<0$（因 $A\cdot D>0$）。有非零截面的除子线性等价于有效除子，有效除子与 nef 类 $A$ 交非负，故 $h^0(Y,\mathcal O_Y(K_Y-kD))=0$，即 $h^2=0$。曲面 Riemann--Roch 给

$$h^0(Y,\mathcal O_Y(kD))\ge\chi(Y,\mathcal O_Y(kD))=\frac{k^2D^2-kD\cdot K_Y}2+\chi(Y,\mathcal O_Y)>0$$

对充分大 $k$，因 $D^2>0$ 主导。

**(c) 为何是这些值。** $A\cdot D>0$ 与 $D^2>0$ 是 Hovanskii--Khovanskii--Askhenazi--Teissier 型不等式的曲面特例，但论文这里只需一个方向：$A\cdot D>0$ 把 $K_Y-kD$ 的 $A$-交打成负，从而 $K_Y-kD$ 不有效、$h^2$ 消失；$D^2>0$ 让 $\chi$ 随 $k^2$ 正增长压过 $-kD\cdot K_Y$ 的线性项。"$k$ 可被 $D$ 的分母整除"是把有理 Cartier 除子升成真 line bundle $\mathcal O_Y(kD)$ 的必要条件，否则 $\mathcal O_Y(kD)$ 无定义、RR 无从谈起。$A$ 是实类而 $D$ 有理，$A\cdot D>0$ 是实数比较，允许 $A$ 非整，这恰是 `homogeneous-nef` 里 $A=\pi^*L$ 与实系数扰动 $D$ 共存的需要。$h^1$ 全程不出现，因为我只用 $h^0\ge\chi-h^2$，$\chi$ 与 $h^2$ 都有下界与消没，$h^1$ 被留在不等号左边吸收。

**(d) 候选失败路线。** [推测] 若 $A\cdot D\le0$，$h^2$ 不消没，$h^0\ge\chi$ 可能仍负、证不出有效性；论文在 `homogeneous-nef` 里专门维护 $A\cdot D>0$ 就是为了此引理可用。[推测] 若 $D^2=0$，$\chi$ 只线性于 $k$，$k^2D^2$ 项消失，正性失去，这正是为什么 `homogeneous-nef` 要把 $D_0^2=0$ 的边界类先做 $\delta C$ 与 $s$ 扰动、抬到 $D^2>0$ 才套本引理。[推测] 若 $Y$ 非光滑或非既约，Serre 对偶与 $K_Y$ 的表述要重做，RR 的 $\chi(\mathcal O_Y)$ 常数项也可能变号。

## 11 nef 分片(c)：齐次测试推出 nef，prop:homogeneous-nef

这是把全篇合拢的最后一块几何。它证明：只要对所有 $m>kw$ 都没有等重数截面，边界类 $D_0=\pi^*L-w\sum E_i$ 就 nef。难点在于测试只覆盖"每点重数都等于 $m$"的齐次情形，而 nef 要防的是任意重数分布的坏曲线。

**(a) 逐字陈述。** `nef:107-120`：

```tex
\begin{proposition}[Homogeneous tests imply nefness]
\label{prop:homogeneous-nef}
Let $S$ be a smooth integral complex projective surface, let $L$ be
ample, and let $p_1,\ldots,p_r$ be distinct points. Put
$H=L^2$ and $w=\sqrt{H/r}$. Suppose that, for all positive integers
$k,m$ with $m>kw$, no nonzero section of $L^{\otimes k}$ vanishes to
order at least $m$ at every $p_i$. On the blow-up
$\pi:Y\to S$ of these points, with exceptional curves $E_i$, the real
divisor class
\[
 D_0=\pi^*L-w\sum_{i=1}^rE_i
\]
is nef.
\end{proposition}
```

**(b) 推导。** 取代表 $L$ 的 Cartier 除子仍记 $L$，写 $A=\pi^*L$、$E=\sum E_i$。$A$ nef，$A^2=H$、$A\cdot E_i=0$、$E_i\cdot E_j=-\delta_{ij}$、$D_0^2=H-w^2r=0$。若 $D_0$ 非 nef，有整曲线 $C$ 使 $D_0\cdot C<0$；因 $D_0\cdot E_i=w>0$，$C$ 非例外，$A\cdot C=L\cdot\pi_*C>0$。对小正有理 $\delta$：$(D_0-\delta C)^2=-2\delta D_0\cdot C+\delta^2C^2>0$ 且 $A\cdot(D_0-\delta C)=H-\delta A\cdot C>0$。固定 $\delta$，由连续性取有理 $s>w$ 足够接近 $w$ 使 $D=A-sE-\delta C$ 满足 $D^2>0$、$A\cdot D>0$（$A\cdot D=H-\delta A\cdot C$ 与 $s$ 无关）。取充分大正整数 $k$ 可被 $s,\delta$ 分母整除，`lem:positive-square` 给有效 $F\sim kD$。因 $k\delta$、$m=ks$ 皆正整数，$F+k\delta C\sim kA-mE$ 有效。爆破恒等式 $\pi_*\mathcal O_Y(-mE)=\bigcap_i\mathcal I_{p_i}^m$ 加投影公式给 $L^{\otimes k}$ 的一个非零截面在每个 $p_i$ 消灭阶 $\ge m$。但 $m=ks>kw$，与假设矛盾。故 $D_0$ nef。

**(c) 为何是这些值。** $D_0^2=0$ 是"边界"的来源：$w=\sqrt{H/r}$ 正是使 $\pi^*L-wE$ 自交为零的唯一正系数，它就是 Seshadri 常数的数值候选。$\delta C$ 先做：把平方从 $0$ 抬成关于 $\delta$ 的正量（$-2\delta D_0\cdot C>0$ 因 $D_0\cdot C<0$），同时 $A\cdot(D_0-\delta C)$ 仍正。再对 $s$ 做：从 $s=w$ 推到某 $s>w$，使 $D=A-sE-\delta C$ 越过边界 $D_0$，且因为 $A\cdot D$ 不含 $s$、$s$ 靠近 $w$ 时 $D^2>0$ 靠连续性保住。两次扰动分工不同：$\delta$ 管自交正性与 $A$-交正性，$s$ 管"制造一个严格 $>w$ 的斜率"。$m=ks$、$k\delta$ 需整数是为把 $F+k\delta C\sim kA-mE$ 写成整系数有效类，才能经 $\pi_*\mathcal O_Y(-mE)$ 落回曲面截面的整重数 $m$。"不等重数"被吸收的机制：坏曲线 $C$ 的真实重数分布通过减去 $\delta C$ 转成齐次的 $mE$，最后 add back 的 $k\delta C$ 用有效 $F$ 兜住，齐次测试 $m>kw$ 因此否决了本来的不等重数曲线。$w$ 取严格大于，并非等于，靠 $s>w$ 提供 gap，让 $m=ks$ 严格越过 $kw$。

**(d) 候选失败路线。** [推测] 若跳过 $\delta C$ 只扰动 $s$，$D_0^2=0$ 附近 $D^2$ 关于 $s$ 是 $(A-sE)^2=H-s^2r$，$s>w$ 立刻使它 $<0$，进不了 `lem:positive-square`；$\delta C$ 提供的 $+2\delta|D_0\cdot C|$ 正是补偿项。[推测] 若坏曲线 $C$ 例外（某 $E_i$），$D_0\cdot E_i=w>0$ 已排除，所以第一步"$C$ 非例外"必须写死，否则 $A\cdot C=0$、$A\cdot(D_0-\delta C)$ 的维护失效。[推测] 若用 $s=w$ ，并非 $s>w$，$m=kw$ 不是整数或不严格越界，齐次假设只覆盖 $m>kw$、拿不到矛盾。

## 12 主定理装配与域扩张

thm:main 的证明在 `nef:206-227`，是把前面所有片拼起来的一句话链条，我按顺序复述并标注每步来源。选节点除子与参数（`sec:node`）；`cor:torus-test` 给出只依赖这些选择、从而只依赖 $(S,L)$ 的整数 $r_0$，使对每个 $r\ge r_0$ 有 $t>T$ 与 $r$ 点环面元组，对所有 $m>k\sqrt{H/r}$ 的 $(k,m)$ 单射。固定这样的 $r$，对每对 $(k,m)$ 用 `cor:surface-transfer` 得 $H^0(S,L^{\otimes k})$ 在某 $r$ 点元组上单射（元组可依赖 $k,m$）；`lem:jet-open` 让可数多个测试在 very general 元组同时成立；`prop:homogeneous-nef` 证 $\pi^*L-\sqrt{H/r}\sum E_i$ 在每个 such 元组 nef；与 `lem:sesha-upper` 合起来得等式。$r$ 在 $r\ge r_0$ 内任意，$r_0$ 先于 $k,m$ 定，故对所有充分大 $r$ 成立。

我把装配里最容易被略过的量化顺序再钉一次：$r_0$ 依赖 $(S,L)$ 但必须先于 $r$，$t,G$ 必须先于 $k,m$。若 $r_0$ 允许依赖 $m$，就退化成"每个 jet 阶各自取 generic"，Baire 可数性论证（`lem:jet-open`）对不可数族失效。这是 `intro:122` 那句"threshold must work for arbitrarily large jet orders"的落点。

推论 `cor:fields`（`nef:231-287`）把结论搬到不可数特征 0 代数闭域 $K$。我的读法是纯算术搬运：把射影方程与 $L$ 的有限胶合数据降到 $\Q$ 上有限生成子域 $F$，得 $S_0/F$ 与 $L_0$，base change 回 $(S,L)$，$H=L_0^2$ 域扩张不变。$F$ 可数、嵌入 $\C$，对 $(S_{0,\C},L_{0,\C})$ 取 thm:main 的 $r_0$。对每对 $m>aw$ 在 $U_{r,0}$ 上作求值映射，非单射轨迹 $B_{a,m}$ 由极大子式切出、闭、源为零时空；主部丛与这些子式同域扩张交换、$H^0$ 由平坦基变换交换。$B_{a,m}$ 在 $\C$ 上真（在 $A-wE$ nef 处，核中截面给 $aA-mE$ 有效、交 $A-wE$ 为 $aH-rmw<0$），故在 $F$、$K$ 上真。$Z_r=\bigcup B_{a,m,K}$ 可数真闭并，补含 $K$-点：$F(U_{r,0})$ 对可数 $F$ 有 $2r$ 超越度、可嵌进 $K$，取 $2r$ 个代数无关元并跨有限代数扩张延拓（$K$ 代数闭），得避开一切 $B_{a,m}$ 的 $K$-点。$Z_r$ 外所有齐次测试单射，`lem:positive-square`、`prop:homogeneous-nef`、`lem:sesha-upper` 只用曲面 RR、Serre 对偶、爆破理想恒等式，在 $K$ 上有效，给 nef 与匹配上界。

[推测] 这里"补含 $K$-点"依赖 $K$ 不可数（否则可数域上 generic 点可能无有理点），是定理陈述限定 uncountable 的机械原因；若 $K$ 可数代数闭如 $\overline{\Q}$，$2r$ 超越度嵌入不保证 $K$-点存在，这条推论就不覆盖，正文 thm:main 也只陈述复情形。

## 13 常数与参数台账

我把散在五片里的每一个符号、常数、指数、阶数拉进一张表，逐栏填满；凡是论文未在正文追踪其下游的，我在末栏写 [推测] 并说明未追踪。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $H=L^2$ | 固定正整数 | `intro:4`；`node:77` | 数值界 $\sqrt{H/r}$、$W=dH$、面积 $H/2$ | 改定义则 `eq:upper-bound`(`intro:20`) 与跨度 $\sqrt{rH}$(`lat:107`) 同错，thm:main 右端失效 |
| $r_0=r_0(S,L)$ | 依赖 $(S,L)$ 的门槛整数 | `intro:33`；`lat:256`；`nef:208` | thm:main 量化"所有 $r\ge r_0$" | 若 $r_0$ 依赖 $m$，`lem:jet-open` 可数 Baire 交(`nef:60`)失效 |
| $d=4e$ | 正整数 | `node:66` | $V\in\lvert dL\rvert$、$c=1/d$、$W=dH$ | 改 $d$ 使 `eq:weight-range`(`node:90`) $(1+t)^2>d^2Ht$ 变，$T$ 需重取 |
| $e$ | 使 $eL$ very ample 的幂 | `node:24` | Rees 代数与闭浸入构造 | 无 very ample 幂时 `lem:node` 的 Bertini 起步即断 |
| $T>1$ | 大到 $(1+t)^2>d^2Ht$ 的阈值 | `node:88`--`node:91` | 限定 $t>T$ | 取 $T\le1$ 时 $t$ 范围空，$a,b,c$ 图崩 |
| $c=1/d$ | 有理数 | `node:97` | $P_t$ 顶点、面积 $c(a+b)/2=H/2$ | 改 $c$ 使面积脱离 $H/2$，`lat:186` 的 $\rho$ 失配 |
| $W=dH$ | 正整数 | `node:97` | $a+b=W$，交数预算 $kdH=kW$ | 改 $W$ 断 `eq:branch-bound`(`node:136`) 的 $v(1+1/t)\le kW$ |
| $a=Wt/(1+t)$ | 随 $t$ 递增至 $W$ | `node:98` | $Q_t$ 顶点、界 $v\le ka$ | 改 $a$ 使 `lem:direction` 的 $a_*\in(a_0,W)$ 反解无解 |
| $b=W/(1+t)$ | 随 $t$ 递减至 $0$，满足 $a=tb$ | `node:98` | 残三角形 $\Delta_t$ 直角边 | 破 $a=tb$ 则 `eq:residual-triangle`(`node:150`) 不成立 |
| $\nu_t(f)$ | 按 $(\alpha+t\beta,\beta)$ 首非零指数 | `node:103`--`node:105` | `prop:quadrilateral`、`prop:initial-transfer` | 换序则 $E_t(F)$ 变、基不唯一 |
| $M=1+\max_i(\alpha_i+t\beta_i)$ | 正整数阈值 | `jets:117` | 界定分离权 $t'$ 的工作窗口 | 去 $+1$ 时边界项混入，$e_i$ 唯一最小失 |
| $t'=t+\eta$ | 略大于 $t$ 的分离权 | `jets:131` | 膨胀 $g_{i,s}$ | 令 $t'=t$ 则同权并列项不能分离 |
| $\ell_t(q)$ | 切片长度 $c(1+q/b)$、$c(1-q/a)$ | `comp:19`--`comp:23` | 压缩把 $(q,h)$ 落进 $kP_t$ | 公式错则 $h\le k\ell_t(q/k)$(`comp:87`) 断、压缩失效 |
| $\operatorname{area}(P_t)$ | $H/2$，不依赖 $t$ | `comp:8`--`comp:9`；`lat:201` | `subgroup-test` 的 $\Delta$ 面积 $k^2H/(2r)$ | 面积变则 $\rho^2/2$ 失配，`lat:28` 重数界失效 |
| $\sqrt{rH}$ | 行列式跨度目标值 | `lat:107` | 换算竖直范围 $\rho=k\sqrt{H/r}$ | 跨度不恰为 $\sqrt{rH}$ 则 $m>k\sqrt{H/r}$ 与 $\ord\le\rho$ 不再矛盾 |
| $j$ | 不超过 $R/(2W)$ 的最大 2 的幂 | `lat:214` | 使 $u=(i,j)$ primitive、$jW<R$ | 取非 2 幂则 $\gcd(i,j)$ 未必为 1，primitive 破 |
| $I_r$ 长度 | $dj(W-a_0)>dR/(4(1+T))$ | `lat:225`--`lat:227` | 超 $2$ 时含奇整数 $i$ | 长度 $\le2$ 无整数，$r_0$ 被推高甚至不存在 |
| $w=\sqrt{H/r}$，$m>kw$ | 临界斜率与越界阶 | `lat:111`；`nef:111` | `homogeneous-nef`、`cor:torus-test` | 取 $m=kw$ 非严格越界、拿不到矛盾 |
| $D_0^2$ | $=0$（边界类自交） | `nef:127` | 扰动 $\delta C$ 抬正平方 | 若 $D_0^2\ne0$ 则"边界"概念消失 |
| $\delta$ | 小正有理扰动 | `nef:133` | 使 $(D_0-\delta C)^2>0$ | 过大则 $A\cdot D>0$ 或 $D^2>0$ 破 |
| $s$，$m=ks$ | 有理 $s>w$，越界整数重数 | `nef:139`--`nef:150` | 齐次测试消费 $m>kw$ | $s\le w$ 时 $m\le kw$ 不触发假设 |
| $h^0(S,kL)$ | $\ge\frac H2k^2+O(k)$ | `nef:187` | `lem:sesha-upper` 维数计数 | 系数错则上界 $\sqrt{H/r}$ 推不出 |
| $r\binom{m+1}2$ | jet 靶维、矩阵行数 | `jets:23`--`jets:24`；`nef:33`；`nef:190` | `rank-persistence` 满秩、`jet-open` 局部自由 rank | 行数错则满秩判断与开性论证断 |
| $2r$ | $F(U_{r,0})$ 对 $F$ 的超越度 | `nef:273` | `cor:fields` 的 $K$-点存在性 | $K$ 可数时无 generic $K$-点 [推测：论文未追踪 $K$ 可数时是否仍部分成立] |
| $\rho>0$ | 三角形竖直范围，面积 $\rho^2/2$ | `lattice:23`--`lattice:24` | `lem:triangle-multiplicity` 的 $\ord_{(1,1)}F\le\rho$ | 面积与范围不同倍缩放则重数界失配，`prop:subgroup-test` 断 |
| $\varepsilon(S,L;\mathbf p)$ | $\inf_C$ 比值，全局上界 $\sqrt{H/r}$ | `introduction:8`--`introduction:9` | `thm:main` 的等式结论(`introduction:42`) | 分母漏算某个 $\mult_{p_i}C$ 则 `thm:main` 右端与 `lem:sesha-upper` 的计数同失配 |
| $E_1,\ldots,E_r$ | 例外曲线，$\pi^*L-\lambda\sum_iE_i$ 的减项 | `introduction:12`--`introduction:15` | 阈值 $\lambda$ 即常数本身，`thm:main` 的边界类(`introduction:38`) | 系数与 $\sum E_i$ 的等权约定不一致时常数的 nef 刻画失效 |
| $U_r$ | $S^r$ 去掉全部对角超曲面的开集 | `introduction:26` | very general 的量化域、`lem:jet-open` 的可数 Baire 交 | 允许重合点时 $\mult_{p_i}$ 分裂，`cor:fields` 的 generic 点无处可取 |
| $Z_r$ | $U_r$ 内可数多个真 Zariski 闭子集之并，余集非空 | `introduction:34`--`introduction:36` | `thm:main` 里逐 $r$ 排除的坏点集 | 余集允许为空时定理变空话，`cor:fields` 的见证元组取不到 |
| $J^m_{\boldsymbol q}$ | 映向 $\bigoplus_j\mathcal O_{q_j}/\mathfrak m_{q_j}^m$ 的 jet 映射 | `jets:14`--`jets:16` | `prop:subgroup-test` 与 `cor:torus-test` 的单射性判据 | 商模幂次写错时单射性与 $\mult\ge m$ 的等价(`jets:20`--`jets:22`)断 |
| $\mathfrak m_{q_j}^m$ | $q_j$ 处极大理想的 $m$ 次幂 | `jets:18`--`jets:19` | 局部框架无关性与双全纯不变性(`jets:29`--`jets:31`) | 换坐标后幂次不保持时 `lem:rank-persistence` 的导数假设失去依据 |
| 非零 $N\times N$ 子式 | 极限矩阵列秩 $N$ 的见证 | `jets:53`--`jets:54` | `lem:rank-persistence` 把满秩延续到小 $s$ | 极限秩亏时无子式可延续，node 分片那步膨胀失去线性代数支撑 |
| $f_{i,s}$ 族 | $s\downarrow0$ 时各阶导数收敛到 $f_{i,0}$ | `jets:41`--`jets:43` | `lem:rank-persistence` 的假设栏 | 逐点收敛不足时 Cauchy 估计(`jets:55`--`jets:56`)撑不起满秩延续 |
| $\chi_\eta(x,z)=x^{\eta_1}z^{\eta_2}$ | $\eta\in\Z^2$ 标定的环面特征 | `lattice:122`--`lattice:123` | 子群定义与 $f_\eta$ 的 $1/r$ 平均滤子 | 配对错时 `lattice:147`--`lattice:152` 的单位根求和不再挑出对应余集的指数，`prop:subgroup-test` 断 |
| $G=\{X=1,\;Y^r=1\}$ | 恰 $r$ 个不同点 | `lattice:125`--`lattice:133` | `cor:torus-test` 的测试点集 | 点数不足 $r$ 时跨度目标与 $Y^r=1$ 的根数不匹配，$m>k\sqrt{H/r}$ 这一档变弱 |
| $\operatorname{diag}(1,r)$ | $(X,Y)\mapsto(X,Y^r)$ 在 $(1,1)$ 的导数 | `lattice:167`--`lattice:169` | 逆函数定理给出局部双全纯，重数才传到 $F$(`lattice:172`--`lattice:173`) | 导数退化时局部可逆失效，重数从 $f$ 搬到 $F$ 的那一步断 |
| $N$，$\det N=r$ | 列向量为 $u,v$ 的整矩阵 | `lattice:178`--`lattice:183` | 把 $kP-\eta$ 拉到 $\Delta$，定面积 $k^2H/(2r)$ | $\det N$ 不为 $r$ 时面积与竖直范围同时错标，`lem:triangle-multiplicity` 的代入失效 |
| $a_0=WT/(1+T)$ | $a(t)$ 值域 $(a_0,W)$ 的下端 | `lattice:212` | `lem:direction` 反解 $t$、$I_r$ 的上端点 $d(R-ja_0)$ | $a_0$ 取错时 $a_*$ 落不进开区间，$t$ 选不出来，格方向配不上四边形 |
| $\det(u,(-b,0))=jb$ 三顶点值 | 依次 $jb$、$-ja$、$i/d$，最小 $-ja$ 最大 $i/d$ | `lattice:244`--`lattice:250` | 使 `prop:subgroup-test` 的跨度恰为 $R$ | 顶点顺序或符号反了则跨度成 $ja+i/d$，`cor:torus-test` 的测试子群造不出 |
| $\ell_x=\ord_0f(x,0)$，$\ell_z=\ord_0f(0,z)$ | 两分支截断阶，对应权重 $\ell_x$ 与 $t\ell_z$ | `node:131`--`node:134` | 分支可加性给出 $v(1+1/t)\le\ell_x+\ell_z$(`node:137`--`node:140`) | 只算单分支则 $v\le ka$ 失配，`eq:residual-triangle` 的包含关系破 |
| $\operatorname{colength}_{\C[[x,z]]}(f,xz)$ | 等于局部交数 $I_p(D,V)$ | `node:143`--`node:145` | 把解析算出的 $v$ 换成代数交数，喂给 `eq:branch-bound` | 局部环换掉则两种交数定义脱钩，$D\cdot V=kdH$ 的代数性失效 |

依赖链我按数据流写一句：$L$ 定 $H$，$H$ 与某 very ample 幂 $e$ 定 $d=4e$、$W=dH$、$T$；$T$ 与 $W$ 定四边形族 $Q_t$（$a,b,c$），$Q_t$ 的对角切片经 `comp` 定三角形 $P_t$（面积恒 $H/2$）；`lat` 把 $P_t$ 的形状经 $j$、$I_r$、$i$ 配到格方向 $u=(i,j)$，得跨度 $\sqrt{rH}$、经 $N^{-1}$ 定 $\rho=k\sqrt{H/r}$，把 $m>kw$ 里 $w=\sqrt{H/r}$ 钉成重数上界；`nef` 用 $w$、$D_0^2=0$、$\delta$、$s$、$m=ks$ 把齐次测试升成 nef，用 $h^0$ 计数与 $r\binom{m+1}2$ 定上界；`cor:fields` 用 $2r$ 超越度搬到 $K$。全链条里 $r_0$ 卡在 $I_r$ 长度 $>2$ 这一处，其余门槛都不引入新的 $r$ 下界。

## 14 Lean 取证

我实测的中心仓库数字，全部来自 `E:\math\lean\OAI\AlgebraicGeometry\Seshadri`：421 个 `.lean` 文件，56,552 行，2,550,574 字节。顶层声明（列首关键字计数）theorem 774、lemma 1226、def 553、abbrev 61、instance 105、structure 9，六类数学声明合计 2728；另有 namespace 1030、section 599、open 1217、variable 573 属组织性语句、不计入声明。sorry 出现 0 次，admit 0 次，无 `sorryAx`、无 `#print axioms`、文件内无自定义 `axiom` 声明。公理依赖只有 `Classical.choice`，我逐行核到 15 处出现、跨 12 个文件（`Cohomology/MixedGlobalExtension.lean:92`、`Cohomology/SurfaceH0Finite.lean:61`、`Cohomology/SurfaceH1Finite.lean:106`、`Geometry/AmpleFromCover.lean:71`、`Intersection/IdealProductDegree.lean:152`、`Projective/BertiniSection.lean:39` 与 `:62`、`Projective/CoprimeEmbedding.lean:29`、`Projective/FiniteAtlas.lean:120`、`Projective/LocalBertiniSection.lean:45` 与 `:68`、`Projective/ProjectiveCartier.lean:32` 与 `:55`、`Sheaves/AmpleFramedCover.lean:56`、`Sheaves/PowerExtension.lean:151`）；`propext`、`Quot.sound` 在源码里 0 处显式引用，仅在 comparator 里被许可。tactic 频次前段：`by` 5106、`have` 3925、`let` 3220、`rw` 2776、`exact` 2731、`apply` 1444、`intro` 1361、`change` 1298、`simp` 1237、`obtain` 1186、`refine` 646、`simpa` 627、`ext` 503、`show` 370、`omega` 178、`ring` 118、`constructor` 112、`congr` 112、`decide` 106、`trivial` 98、`nlinarith` 97、`calc` 79、`linarith` 75、`positivity` 71、`funext` 68、`cases` 68、`filter_upwards` 43、`rcases` 27、`norm_num` 26、`field_simp` 26、`abel` 21、`linear_combination` 18、`use` 10、`tauto` 6、`simp_all` 4、`aesop` 4。`omega`/`linarith`/`nlinarith`/`positivity` 合计约 300 多次，与这题把大量严格不等式（$jW<R$、$I_r$ 长度 $>2$、$m>kw$）交给算术决策器的风格吻合；组合学式的 $2$ 的幂、奇偶、区间落点更多靠 `omega`，几何不等式靠 `nlinarith`/`positivity`。

被认证的声明是 `Main.lean` 里 `OAI.MaximalSeshadri.Geometry.maximalSeshadriConstants`，签名：

```lean
theorem maximalSeshadriConstants (S : Surface) (L : LineBundle S.scheme)
    (hL : LineBundle.IsAmple S.scheme L) : EventualMaximalSeshadri S L := by
  obtain ⟨r₀,hr₀,h⟩ := S.eventual_very_general_curve_lower L hL
  ...
  exact ⟨⟨B,B.boundaryNef_of_curve_bound S L hL hrpos (hC p hp)⟩,
    S.seshadri_eq_of_curve_lower L hL hrpos p (hC p hp)⟩
```

与论文的错口我列出五条。第一，路线换形：论文正文按"jet 测试 → `prop:homogeneous-nef`"叙述，Lean 主证明体却把整套机藏在一个抽象接口 `eventual_very_general_curve_lower`（`Interpolation/AllCurveLowerBound.lean:120`）之后，先用它拿到"每条曲线比值下界"，再用 `boundaryNef_of_curve_bound`、`seshadri_eq_of_curve_lower` 收尾。`curve_lower_of_homogeneous_section_test`（同文件 `:23`）是论文"齐次测试推曲线界"的形式化对应，但论文里那条推理分散在 `prop:homogeneous-nef`，Lean 把它并进一个 `curve_lower` 谓词，叙事口径不同、数学内容我核对是对齐的。

第二，陈述目标是 `EventualMaximalSeshadri`（`Model.lean:394`），它同时要求"存在爆破使 `BoundaryNef`"与 `seshadriConstant S L r p = Real.sqrt ((selfIntersection S L)/r)`，比同仓库 `EventualSeshadriEquality`（`Definitions.lean:21`，只要求等式）更强，正好对上论文 `thm:main` 的"边界类 nef 且常数等式"双结论。

第三，very general 轨迹：Lean 写成 `Z : ℕ → Set (Configuration S r)`，逐 $n$ 要求 `IsClosed (Z n) ∧ Z n ≠ Set.univ`，且 `∃ p, ∀ n, p ∉ Z n`。论文要求的是"$U_r$ 中可数真 Zariski 闭子集并的补非空"。Lean 的 `IsClosed` 落在 `Configuration S r` 所携拓扑上，是否严格等于 Zariski 闭我未从声明名直接确证 [推测：Lean 里靠 `JetOpenness`/`VeryGeneralInterpolation` 把解析开性与 Zariski 开性对齐，但顶层谓词只写 `IsClosed`]。`Configuration S r` 是否强制 $p_i$ 互异（对应 $U_r$）我也未见显式标注 [推测：应藏在 `Configuration` 定义里，`Model.lean` 附近]。

第四，nef 的形式口径：`PointBlowup.BoundaryNef`（`Model.lean:384-390`）直接对每条 `IntegralCurve` 陈述 $0\le\deg_{\text{pullback}}C+\sqrt{H/r}\sum\deg_{E_i}C$，是论文"$\pi^*L-\lambda\sum E_i$ 对每条整曲线交非负"在 $\lambda=\sqrt{H/r}$ 处的数值化实例；论文把 nef 定义成对一切整曲线的实类判据，Lean 只在这一条边界类上实例化，范围更窄但对本定理够用，无实质削弱。

第五，域扩张推论：`Surface` 的 `structureMap` 目标写死为 `Spec (CommRingCat.of ℂ)`（`Model.lean:40`），主声明只在 ℂ 上陈述；`cor:fields` 需要的不可数代数闭特征 0 域 $K$，其降域与嵌入机器在 `Bertini/CountableSpecialization.lean` 里以 `field_embedding_over_countable`、`generic_field_embedding`（带 `[IsAlgClosed K] [Uncountable K]`）形式化存在，但我没有找到一条与 `cor:fields` 逐字对应的顶层曲面定理 [推测：$K$-版本的最终拼装未被认证，或藏在未列入 comparator 的模块里]。凡此，comparator 只认 `maximalSeshadriConstants` 一条。

## 15 机制对账：五个被点名的问题各自答案与出处

我把作业里要求重点拆解的几处机制，在此逐条给出"答案 + 出处 + 与台账的对应"，作为前面分散叙述的一次合拢核对，也方便回查我有没有把方向说反。所有行号对应第 13 节台账。

一、$\sqrt{L^2/r}$ 在哪一侧"显然"。答案是上侧：`eq:upper-bound`(`intro:20`) 断 $\varepsilon\le\sqrt{H/r}$，其证明 `lem:sesha-upper`(`nef:171`--`nef:204`) 只是 $h^0(S,kL)\ge\frac H2k^2+O(k)$ 对 $r\binom{m+1}2=\frac{r\alpha^2}2k^2+O(k)$ 的鸽笼维数计数，对每个固定点组都成立、与 generic 无关。真正要证的是下侧 $\varepsilon\ge\sqrt{H/r}$，即平方为零的边界类 $\pi^*L-\sqrt{H/r}\sum E_i$ 在 very general 点处 nef，这是 `prop:homogeneous-nef`。台账里 $H$、$r\binom{m+1}2$、$\frac H2k^2$ 三行对应这条上界链。

二、"充分大 $r$"的门槛 $r_0$ 从哪一步产生。不在上界证明里（那里没有 $r_0$），而在 `lem:direction`(`lat:204`--`lat:253`)：开区间 $I_r$ 长度 $dj(W-a_0)>\frac{dR}{4(1+T)}$ 须超过 $2$ 才能落进奇整数 $i$，且 $a_*=(R-i/d)/j$ 须落回 $(a_0,W)$；两处下限只依赖 $d,H,T$。第二处门槛是 `lem:jet-open`(`nef:60`) 的可数 Baire 交，要求见证元组族可数，从而逼出"$r_0,t,G$ 先于 $k,m$ 选定"的量化顺序（`lat:270`）。台账 $r_0$、$j$、$I_r$ 三行锁住这条。

三、node 分片在估什么。它用一条固定的带节点 ample 除子 $V\in|dL|$（`lem:node`）把任意截面 $s\in H^0(kL)$ 的首个非零 Taylor 指数 $\nu_t(s)$ 关进四边形 $kQ_t$：`prop:quadrilateral`(`node:110`--`node:188`) 的核心不等式是 $v(1+1/t)\le\ell_x+\ell_z=I_p(D,V)\le D\cdot V=kdH$，即交数预算 $W=dH$ 控制消灭权。节点两支写成 $\tau=u(x,z)xz$ 才让权 $(1,t)$ 有意义，第四顶点 $(c,c)=(1/d,1/d)$ 记的就是"一份 $V$"。台账 $d$、$c$、$W$、$a$、$b$、$\nu_t$ 六行对应。

四、lattice 分片在估什么。它在三角形 $kP_t$ 上取 $r$ 点环面子群 $G$ 做单点重数估计：`lem:triangle-multiplicity`(`lat:22`--`lat:92`) 给面积 $\rho^2/2$、竖直范围 $\rho$ 的三角形上 Laurent 多项式满足 $\ord_{(1,1)}F\le\rho$；`prop:subgroup-test`(`lat:101`--`lat:189`) 经 $\det N=r$ 把 $kP_t$ 映成 $\Delta$，其 $\rho=k\sqrt{H/r}$，于是 $m>k\sqrt{H/r}$ 与 $\ord\le\rho$ 相矛盾、测试单射。台账 $\rho^2/2$、$\sqrt{rH}$、$w=\sqrt{H/r}$、$m>kw$ 四行对应。

五、nef 分片证明哪个除子类 nef、compression 用什么变换、把 $H/r$ 变成什么。nef 分片证明的是边界类 $D_0=\pi^*L-w\sum E_i$（$w=\sqrt{H/r}$，$D_0^2=0$）nef：先把坏曲线 $C$ 以 $-\delta D_0\cdot C>0$ 抬成 $(D_0-\delta C)^2>0$、再以有理 $s>w$ 越过边界得 $D=A-sE-\delta C$，$D^2>0$、$A\cdot D>0$，`lem:positive-square` 用 RR 造有效 $F\sim kD$，add back $k\delta C$ 经 $\pi_*\mathcal O_Y(-mE)=\bigcap\mathcal I_{p_i}^m$ 落回 $L^{\otimes k}$ 齐次消灭截面，$m=ks>kw$ 触发矛盾。compression 分片 `prop:compression`(`comp:57`--`comp:133`) 用的变换是环面坐标换 $(x,z)=(u,v/u)$ 加上代换 $v=1+sy$ 的"对角切片压缩"：它把 $Q_t$ 每条对角切片长度 $\ell_t(q)$ 原样搬进 $P_t$、下端归到高度 0，从而把四边形 $kQ_t$ 的单射测试还原成三角形 $kP_t$ 的；三角形面积恒 $H/2$ 是关键不变量，`subgroup-test` 再经 $\det N=r$ 把 $H/r$ 变成 $\Delta$ 的面积 $k^2H/(2r)=\rho^2/2$，即阈值 $\rho=k\sqrt{H/r}$。台账 $\operatorname{area}(P_t)$、$\delta$、$s$、$D_0^2$ 四行对应。

## 16 背景与检索（与论文内容分开写）

这一节是我进场前后对这条研究线的检索所得与自带知识的整理，凡不能从我读过的 tex 或 Lean 直接核实的，我都标 [推测]，并且不把它当成论文结论。本轮联网检索命中的多是条目链接，并非可摘正文，实质性细节我未能全部核实，故以下多处依赖既有文献印象，可信度按 [推测] 计。论文 `intro` 的 Background 小节（`intro:59-113`）自己引用的名单是：Nagata、Syzdek--Szemberg、Strycharz--Szemberg、Biran、Buse--Hind--Opshtein、Eckl、Harbourne、Roé、Roé--Ross、Dionne--Roth、Laface--Ugaglia、Alexander--Hirschowitz、Dumnicki、CFKLRS、Gundlach；下面这条线之外的名字（Nakayama、Xu、Di Rupo--Serrano）不在论文引用清单里，是我检索带进来的，务必与论文口径隔离。

Seshadri 常数的原始定义（单点 $\varepsilon(L;x)=\inf_C L\cdot C/\mult_x C$）来自 Seshadri 为刻画ample性局部程度引入的量，多点版本把它放到爆破上，用"最大使 $\pi^*L-\lambda\sum E_i$ 为 nef 的 $\lambda$"来等价定义，这一点与本论文 `intro:12-15` 的口径一致，可放心对齐。Nakayama 的数值刻画方向：Nakayama 对伪有效锥与 nef 锥给出用交集数与 $\nu$-不变量描述的标准，[推测：本论文没有显式引 Nakayama，它把"nef 当对每条整曲线的判据"直接用，不需要 Nakayama 的完整数值定理；若把定理推广到高维或非光滑基，可能才需要 Nakayama 那类刻画，论文未追踪此边界]。

Nagata 平面猜想的部分结果与 $-K$ 负曲线问题：经典 Nagata 是关于 $\PP^2$ 中 $r\ge10$ 个一般点、$\deg C>m\sqrt r$ 的陈述，等价于爆破面上不存在与 $-K$ 交为正的坏曲线，即"$(-1)$-曲线/负曲线"随 $r$ 变化的问题。$r\le9$ 时爆破面的 Weyl 群有限、$(-1)$-曲线有限、$-K$ 接近 nef，Nagata 型陈述或是空真或容易；$r\ge10$ 起 Weyl 群无穷、负曲线消失，才是硬区。[推测：本论文 `intro:49-55` 明确把"平面情形 sharp 阈值 $r\ge10$ 与严格非齐次不等式"甩给同作者的姊妹篇 OpenAINagata2026，本篇只处理曲面 eventual 定性版本，所以我上面这条 $-K$ 负曲线线是背景，不是本篇在证的东西。] Xu 的工作：[推测：我检索到 Xu 有关于用 K-稳定性/alpha 或 delta 不变量在特征 0 一般点情形证 Nagata 猜想的预印本印象，但它不在本篇引用清单，也无法从我读过的 tex 或 Lean 核实其方法与本篇的异同，仅作线索保留，不得当作本篇前提。] Di Rupo--Serrano 的 $r=9$ 与平方数情形：[推测：我对这对具体作者与 $r=9$ 归属没有可靠记忆，检索亦未给可摘结论，仅知"$r=9$ 边界"与"$rL^2$ 为平方数时最大化"这两类是文献里反复出现的特殊值；本篇对平方数的处理口径来自 Harbourne `intro:85-92`，我把它放在论文一侧，不归给 Di Rupo--Serrano。]

Biran 的渐近 Seshadri 常数与 very general 点：Biran 在辛打包语境下证明足够多等径球的全填充稳定性，对闭合四流形上有理辛类成立，`intro:73-76` 引 Biran 1999、2001；渐近 Seshadri 常数 $\varepsilon_{\mathrm{asymp}}$ 与打包容量的对偶是这条线的一般框架。Buse--Hind--Opshtein 把稳定性推广到不等径小球、一切闭合辛四流形（`intro:76-79`）。Eckl 给代数化的 Kähler 表述（`intro:80-83`）。关键区别我已在前文用过：辛/拓扑稳定性不固定复结构，因此不直接给本篇所需的"固定复曲面爆破上的代数 nef 性"，[推测：辛方法给出的下界一般只到渐近或打包容量层面，把 $\sqrt{H/r}$ 在 every large $r$ 处取等这件事辛侧似乎做不到，但这属于外部判断，非论文结论]。

Seshadri 常性与 jet 分离/邻域压缩的关系：文献里 Seshadri 常数刻画线丛在一点分离 $m$-jets 的临界值（$L$ 在 $x$ 分离 $m$-jets 只要 $\varepsilon(L;x)>m$，这是 Ein--Lazarsfeld 型判据的印象）。[推测：具体常数阈值 $\varepsilon>m$ 还是 $\ge m+1$ 取决于整数化，我未在论文里核实其精确形式。] 本论文的"邻域压缩"专指 `compression` 分片那个对角切片压缩（把四边形 $Q_t$ 的切片下端平移到高度 0、保切片长），它是一个解析坐标重标加环面自同构的装置，与文献里泛指 jet 分离的"压缩"不是同一物，我不混用。`prop:initial-transfer` 与 `lem:rank-persistence` 合起来扮演的正是"初始单项式的 jet 单射 ⇔ 原函数空间的 jet 单射"这座桥，可视为本篇对"jet 分离判据"的重构式实现。我检索到的可定位外部锚点（Harbourne 的 points-in-$\PP^2$ 综述页、Wikipedia 的 Seshadri 与 Nagata 词条）只给到词条级定义，未给到能核对本篇常数指数的细节，故本节凡涉及具体数值归属一律 [推测]。

## 17 我自认最薄弱的三节

按我对这份反推稿的自查，最站不住的是第 8 节、第 14 节、第 16 节，理由各不同。

第 8 节（`lem:direction` 与 $r_0$ 落地）薄弱在我把"$j$ 取 2 的幂 + $I_r$ 长度 $>2$"读成门槛的唯一来源，但论文在 `lat:212-228` 只给了充分性方向的下界估计，没有给"若 $r$ 稍小构造就必然失败"的反例；我能确认门槛由这两处不等式产生，却不能确认它是紧致门槛，[推测：真正决定 $r_0$ 的或许还有 `cor:torus-test` 里"先固定 $r$ 再选 $t,u$"对 $r$ 的隐式依赖，论文未展开追踪]。

第 14 节（Lean 取证）薄弱在五条错口里第三、第五两条带 [推测]：`Configuration S r` 是否强制点互异、`IsClosed` 是否严格 Zariski 闭，我只核到顶层谓词的写法，没有逐一定位 `Configuration`、`JetOpenness`、`VeryGeneralInterpolation` 里把解析开性与 Zariski 开性、把 $U_r$ 与互异条件钉死的那几行；`cor:fields` 的 $K$-版本是否真未拼装，我只据"主声明在 ℂ、comparator 只认一条"推断。数字（421 文件、56,552 行、声明分类计数、公理 `Classical.choice` 15 处、tactic 频次、0 sorry）都是实测，可信；但错口的定性判断里有未穷尽模块阅读的部分。

第 16 节（背景检索）薄弱在最依赖外部记忆且联网检索未给可摘正文：Xu、Di Rupo--Serrano 两处我几乎全程 [推测]，Nagata 的 $-K$ 负曲线线、Biran 渐近常数线我也只到框架级。我把它们与论文引用名单严格分开，好处是不会串味，代价是这一节对读者的独立信息量最低，凡要据此判断论文新颖性，应以 `intro:85-113` 的自引名单为准，并非本节。

## 18 四段式加深(一)：`cor:torus-test`，把第 8 节遗留的量化顺序拆开

§17 里我对第 8 节的自我批评，核心是两点：一，$r_0$ 的门槛我只追到 `lem:direction` 内部的两条不等式，没确认它是不是紧致门槛；二，`cor:torus-test` 里"先固定 $r$ 再选 $t,u$"对 $r$ 的隐式依赖我只标了 [推测]，没有拆开验证。这一节就把 `cor:torus-test` 本身按四段式补全，(b) 段我把它引用 `prop:subgroup-test` 时在正文里被压缩掉的中间机制逐行展开，(c) 段逐条回答"量化顺序为什么必须这样排"。选它还有一个理由：它是 `lat` 分片最后一个产出物（`lat:255-271`），往外交给 `nef:206-227` 的 `thm:main` 装配，是第 7、8 两节的全部汇流点；这一环若有缝，前面所有单点估计都白搭。

### 18.1 (a) tex 逐字引用

结论本体，`lat:255-264`：

```tex
\begin{corollary}\label{cor:torus-test}
For the fixed parameters $d,H,T$ of Section~\ref{sec:node}, there is an
integer $r_0$ such that for every integer $r\geq r_0$ one can choose a
single $t>T$ and a subgroup $G\subset\T$ of $r$ distinct points for
which the following holds: for all positive integers $k,m$ satisfying
\[
 m>k\sqrt{H/r},
\]
the order-$m$ jet test on $\mathcal M(kP_t)$ at $G$ is injective.
\end{corollary}
```

证明全文只有五行，`lat:266-271`：

```tex
\begin{proof}
First fix $r$ and choose $t$ and $u$ by Lemma~\ref{lem:direction}.
The area of $P_t$ is $H/2$, so Proposition~\ref{prop:subgroup-test}
produces $G$ with the stated property simultaneously for all $k,m$.
Thus $r_0$, and then $t,G$, are chosen before these two jet parameters.
\end{proof}
```

它消费的两个前提。`lem:direction` 的陈述在 `lat:204-209`（第 8 节 (a) 已逐字引过，这里只重贴结论句 `lat:206-208`："there are $t>T$ and a primitive vector $u\in\Z^2$ such that the range of $\det(u,\cdot)$ on $P_t$ has length $\sqrt{rH}$"，以及门槛声明 `lat:208`："The threshold depends only on $d,H,T$"）。`prop:subgroup-test` 的陈述，`lat:101-113`：

```tex
\begin{proposition}\label{prop:subgroup-test}
Let $H>0$, let $r$ be a positive integer, and let $P\subset\R^2$ be a
triangle of area $H/2$.  Suppose there is a primitive vector $u\in\Z^2$
such that
\[
 \max_{\xi\in P}\det(u,\xi)
 -\min_{\xi\in P}\det(u,\xi)=\sqrt{rH}.
\]
Then there is a subgroup $G\subset\T$ of exactly $r$ distinct points
such that, for all positive integers $k,m$ with
$m>k\sqrt{H/r}$, the order-$m$ jet test on $\mathcal M(kP)$ at $G$ is
injective.
\end{proposition}
```

还有 `lat:273-276` 那句容易被略过的过渡："Corollary~\ref{cor:surface-transfer} now gives a surface configuration with the same injective jet test for each pair $k,m$. These configurations may depend on the pair." 它明说了曲面侧配置允许随 $(k,m)$ 变，环面侧的 $G$ 则不许。

### 18.2 (b) 推导补全：五行证明背后的每一环

第一步，量化入口。取定 $r\ge r_0'$，其中 $r_0'$ 是 `lem:direction` 证明内两条"充分大"（`lat:214` 的 $R=\sqrt{rH}$ 足够大与 `lat:228` 的 $I_r$ 长度超过 $2$）与 $r$ 为整数的交点产生的门槛；`lem:direction` 输出一个具体的 $t>T$ 与一个 primitive 的 $u=(i,j)\in\Z^2$，使得 $\det(u,\cdot)$ 在 $P_t$ 上的值域跨度恰为 $R=\sqrt{rH}$。这一步给出 corollary 里的 $t$，注意它随 $r$ 走。

第二步，面积核验。`lat:195-198` 定义 $P_t=\conv\{(-b,0),(a,0),(0,1/d)\}$，$a=dHt/(1+t)$，$b=dH/(1+t)$。以 $(0,1/d)$ 为 apex、底边在 $x$ 轴上从 $-b$ 到 $a$，底长 $a+b$、高 $1/d$，面积 $\frac12(a+b)\cdot\frac1d$。而 $a+b=dHt/(1+t)+dH/(1+t)=dH(t+1)/(1+t)=dH$，故面积 $=dH/(2d)=H/2$，这正是 `lat:199-200` 那句 "Every triangle in this family has area $H/2$, since $a+b=dH$" 的机械展开。$P_t$ 是三角形（三个仿射无关的顶点，$d>0$ 保证 apex 不在 $x$ 轴上），于是 `prop:subgroup-test` 的四条假设 $H>0$、$r$ 正整数、三角形、面积 $H/2$ 逐条对上，第五条跨度条件由第一步的 $u$ 供给。

第三步，`prop:subgroup-test` 内部被压缩的机制，即 corollary 那句 "produces $G$ with the stated property simultaneously for all $k,m$" 到底借了什么。按 `lat:116-133`：$u$ primitive，故可补成整基 $(u,v_0)$ 使 $\det(u,v_0)=1$（这是 `lat:116` 那步的全部依据，primitive 在这里被消费；若 $\gcd(i,j)=g>1$，任意整向量 $\xi$ 满足 $g\mid\det(u,\xi)$，永远凑不出 $\det=1$）。令 $v=rv_0$，$M=\Z u+\Z v$，则 $[\Z^2:M]=\lvert\det(u,v)\rvert=r$（`lat:117-120`）。$G$ 定义为 $M$ 中特征标同时取 $1$ 的公共核（`lat:125`）。在 unimodular 坐标 $X=\chi_u$、$Y=\chi_{v_0}$ 下（`lat:127-129`，指数矩阵行列式 $\pm1$ 故逆矩阵仍整），$G$ 写成 $\{(X,Y):X=1,\ Y^r=1\}$（`lat:131-132`），$Y$ 取 $r$ 次单位根、彼此不同，共 $r$ 个点（`lat:133`）。关键点：这个构造从头到尾只用了 $u$ 与 $r$，没碰 $k,m$，$G$ 一旦定下就对后续一切 $(k,m)$ 生效。

第四步，"同时性"为何对全体 $(k,m)$ 成立。反证框架（`lat:135-157`）：设某非零 $f\in\mathcal M(kP_t)$ 在 $G$ 每点消灭阶 $\ge m$。平移 $\tau_g f(p)=f(gp)$ 置换 $G$（$G$ 是子群，$gG=G$），每条 $\tau_gf$ 保持同样 prescribed vanishing（`lat:137-139`）。对每个陪集 $\eta+M$ 作特征标投影 $f_\eta=\frac1r\sum_{g\in G}\chi_\eta(g)^{-1}\tau_gf$（`lat:141`）；由正交关系 $\frac1r\sum_{g\in G}\chi_{\xi-\eta}(g)$ 在 $\xi-\eta\in M$ 时为 $1$、否则为 $0$（`lat:147-153`，靠 $r$ 次单位根求和 $\sum_{\ell=0}^{r-1}\zeta^\ell$ 为零当 $\zeta\ne1$），$f_\eta$ 恰是 $f$ 支撑落在 $\eta+M$ 的部分（`lat:143-144`）。各 $f_\eta$ 仍满足同一 prescribed vanishing 且支撑仍在 $kP_t$（`lat:155-156`），分量之和为 $f$，取一个非零分量（`lat:156-157`）。乘 Laurent 单项式 $\chi_{-\eta}$ 保局部阶、把支撑搬进 $M$（`lat:159-160`），得 $F(U,Z)$，$U=\chi_u$、$Z=\chi_v=Y^r$（`lat:163-165`）。$(X,Y)\mapsto(X,Y^r)$ 在 $(1,1)$ 处微分 $\operatorname{diag}(1,r)$ 可逆（`lat:168-169`），复反函数定理给出局部双全纯，于是 $\ord_{(1,1)}F\ge m$（`lat:172-174`）。最后一步是纯平面几何：$N$ 以 $u,v$ 为列，$F$ 的支撑落在 $\Delta=N^{-1}(kP_t-\eta)$（`lat:178-181`）；$\det N=r$ 故 $\operatorname{area}\Delta=k^2(H/2)/r$（`lat:183-184`，面积按 $1/\lvert\det N\rvert$ 缩放，$P_t$ 面积 $H/2$ 在这被第二次消费）；$N^{-1}\xi$ 的第二坐标是 $\det(u,\xi)/r$（`lat:184`，Cramer 法则：解 $N c=\xi$，$c_2=\det(u,\xi)/\det(u,v)$），所以竖直范围 $=\sqrt{rH}\cdot k/r=k\sqrt{H/r}$（`lat:185`，这里消费 `lem:direction` 给的精确跨度）；平移 $-\eta$ 不动两值（`lat:185-186`）。`lem:triangle-multiplicity` 以 $\rho=k\sqrt{H/r}$ 给 $\ord_{(1,1)}F\le k\sqrt{H/r}$（`lat:186-188`），与假设 $m>k\sqrt{H/r}$ 矛盾。整个链条里 $k$ 只以相似倍率进入支撑三角形（$kP_t$），$m$ 只以 $\ge m$ 进入反设，两者都不参与 $G$ 的构造，故同一 $G$ 对所有满足越界不等式的 $(k,m)$ 同时给出单射。

第五步，corollary 末句与后续接口。`lat:270` "Thus $r_0$, and then $t,G$, are chosen before these two jet parameters" 把量化顺序 $r_0\Rightarrow r\Rightarrow(t,u)\Rightarrow G\Rightarrow\forall(k,m)$ 明文化。往后，`lat:273-275` 经 `cor:surface-transfer` 把每个 $(k,m)$ 的环面测试搬回曲面配置（曲面侧允许依赖对），`nef` 分片再靠 `lem:jet-open`（`nef:9-20`）把逐对的单射性变成 $U_r$ 上开条件、可数交得 very general 点。开条件的可数交之所以能在一组固定的 $r$ 个点上进行，前提正是测试族 $\{(k,m)\}$ 不反向改动点集本身；这正是 corollary 必须把 $G$ 提到 $\forall k,m$ 之前的结构理由，对应 `intro:122` 强调的"$r$ 门槛要对任意大 jet 阶 work"。

### 18.3 (c) 每个假设、常数、指数的机械理由

其一，量化顺序 $\exists t\,\exists G\,\forall k,m$ 内嵌在三处。$t$ 必须在 $r$ 之后：`lat:234` 的 $a_*=(R-i/d)/j$ 由 $R=\sqrt{rH}$ 决定，$t$ 靠 $a=Wt/(1+t)$ 在 $(a_0,W)$ 上双射反解（`lat:212-213`），$r$ 变则 $R$ 变、$a_*$ 变、$t$ 变。固定一个 $t$ 服务所有 $r$ 不可能，因为 $\det(u,\cdot)$ 在固定 $P_t$ 上的跨度是 $P_t$ 与 $u$ 的确定数值，而要求它同时等于 $\sqrt{rH}$ 对无穷多个不同 $r$，直接矛盾。$G$ 必须在 $t$ 之后：`prop:subgroup-test` 的 $G$ 由 $u$（进而 $M$、陪集结构）与 $r$ 共同决定，而 $u$ 是在选定 $t$ 的那一步一起产出的。$G$ 又必须在 $k,m$ 之前：$G$ 的定义（`lat:116-132`）不含任何 $(k,m)$ 的输入，这是"同时性"的来源，并非额外要求；反过来说，若允许 $G$ 依赖 $(k,m)$，`lat:268-269` 那句 "simultaneously for all $k,m$" 就退化为逐对陈述，`nef:60` 附近对可数个 $(k,m)$ 取交的论证会失效（每一对的见证点集不同，交无可交）。

其二，面积 $H/2$ 为什么分毫不许动。它在证明里被消费两次：`lat:183-184` 给 $\operatorname{area}\Delta=k^2H/(2r)$（供给 `lem:triangle-multiplicity` 的面积输入），以及 `lat:185` 的竖直范围经 $\det N=r$ 折算成 $k\sqrt{H/r}$。三角形重数估计输出的界形如"范围或面积的函数"，而 `thm:main` 的上界侧（`lem:sesha-upper`，`nef:171-204`）给 $\varepsilon\le\sqrt{H/r}$；两侧要在同一个 $w=\sqrt{H/r}$ 上会师，全靠 $P_t$ 面积取 $H/2$ 使得 $\rho$ 恰好落在 $k\sqrt{H/r}$。台账里 `lat:186` 那行"面积变则 $\rho^2/2$ 失配"就是这个意思：面积若为 $\alpha\ne H/2$，重数界跟着动，$m>k\sqrt{H/r}$ 与 $\ord\le\rho$ 不再必然矛盾，反证断在 `lat:188`。

其三，"exactly $r$ distinct points" 的三重必要性。数值上 $\lvert G\rvert=[\Z^2:M]=r$，把 $v=rv_0$ 的因子 $r$ 去掉则指标为 $1$、$G$ 只剩单位元；群结构保证 $\tau_g$ 置换 $G$（`lat:137-138`），投影 $f_\eta$ 的求和与正交关系（`lat:141-153`）都以 $G$ 为群来写；互异性则匹配 $U_r$（配置空间开集）的定义与 $E=\sum_{i=1}^r E_i$ 的 $r$ 条互异例外除子，后面 `nef:265-267` 的交数 $aH-rmw$ 里那个 $r$ 与这里同一个。

其四，primitive 的必要性精确到一行：`lat:116` "Complete $u$ to an integer basis $(u,v_0)$ with $\det(u,v_0)=1$"。$\det(u,v_0)=1$ 可解当且仅当 $u$ 两坐标互素；$j$ 取 2 的幂、$i$ 取奇数（`lat:229-230`）是为在 $I_r$ 内自由选 $i$ 时也把互素锁死，若 $j$ 有奇素因子 $p$，则 $i$ 恰被 $p$ 整除的那些取值会让 $u$ 不 primitive，`lat:103` 的假设直接不可达。

其五，$t>T$ 的下界传导。$a_0=WT/(1+T)$ 是 $a$ 的下端（`lat:212`），它进入 $I_r$ 的右端点 $d(R-ja_0)$（`lat:222`）；$T$ 若放宽，$a_0$ 变小、区间右端外扩，方向引理本身反而更容易，但 $t>T$ 同时是 `node` 分片权重可行域 $(1+t)^2>d^2Ht$ 的门槛（台账 `node:88-91` 那行），$P_t$ 若脱离这个族，`comp` 分片压回原点的机制就没输入了，所以 corollary 继承 $T$ ，并非重取。

其六，$r_0$ 只依赖 $d,H,T$。`lat:208` 与 `lat:251-252` 两次声明门槛只吃固定数据；corollary 的 $r_0$ 是 `lem:direction` 门槛与 `prop:subgroup-test`（无新门槛，纯条件式）的叠加，再加"$r$ 取整"的自然下界，故 $r_0=r_0(S,L)$ 经 $d,e,H$ 落地。这是 `intro:33` 里 $r_0(S,L)$ 依赖模式的来源，也是台账 `$r_0$` 行"若 $r_0$ 依赖 $m$ 则 Baire 交失效"的上游保证。

### 18.4 (d) 候选失败路线

[推测] 路线一：让 $u$（从而 $G$）依赖 $(k,m)$。逐对见证看似更灵活，但 `lat:268` 的"一次产出"变没了，`nef:9-20` 与 `lem:jet-open` 需要的"固定 $r$ 个点之上、对所有 $(k,m)$ 的开条件交"失去公共基座，退回 §2 死路三里"每对各自 generic"的老结构，而那条路正是 `intro:102-103` 宣言要避开的。

[推测] 路线二：把 $j$ 换成 $\lfloor R/(2W)\rfloor$ 或最接近 $R/(3W)$ 的任意整数，省掉 2 的幂。$\gcd(i,j)=1$ 不再由奇偶自动给出，需要在宽约 $dR/(4(1+T))$ 的开区间里同时避开 $j$ 的一切素因子，区间长度对固定 $j$ 的素因子集未必够，`lat:229-230` 的存在性论证断掉，`prop:subgroup-test` 的 primitive 假设（`lat:103`）无从满足。

[推测] 路线三：把 $G$ 换成一般位置上任取 $r$ 个点，指望单点重数估计直接够用。子群身份在 `lat:137-153` 被用了两次（平移置换 $G$、陪集正交求和），任意点集既不能在特征标坐标下写成 $X=1,Y^r=1$，也没有把整条 $f$ 拆成支撑在陪集上的分量之和的机制，`lat:156-157` 的"取一个非零分量"随之无处可取。

这一节补完后，§17 对第 8 节的怀疑只剩原版那半句：门槛的紧致性论文确实没有陈述，`lat:214` 与 `lat:228` 给的都是充分方向的估计；而"$r$ 对 $t,G$ 的隐式依赖"现已拆明为显式链条 $r\Rightarrow R\Rightarrow(j,i)\Rightarrow a_*\Rightarrow t\Rightarrow u\Rightarrow G$，每一环的行号都在 `lat:212-236` 内，不存在第二条未追踪的通道。

## 19 四段式加深(二)：`cor:fields`，把第 14 节遗留的域扩张拆开

§17 承认第 14 节的第三条与第五条错口带 [推测]，其中第五条正是 `cor:fields`：我只核到"主声明在 ℂ、comparator 只认一条"，没有把论文的 $K$-版本证明逐行摊开对照 Lean 侧缺什么。这一节按四段式补上 (b) 段的中间步骤，(c) 段逐常数回答"不可数、代数闭、特征零三个假设各卡在哪一步"，(d) 段给候选失败路线，末段回接 Lean 对账。选它的第二个理由：`cor:fields` 是全文最后一个证明体（`nef:241-287`），它反过来消费 `thm:main`、`lem:jet-open`、`lem:sesha-upper` 三件成品，是把这张笔记前 12 节全部串成"跨域成立"的收口处。

### 19.1 (a) tex 逐字引用

陈述，`nef:231-240`：

```tex
\begin{corollary}\label{cor:fields}
Let $K$ be an uncountable algebraically closed field of characteristic
zero, let $S$ be a smooth integral projective surface over $K$, and let
$L$ be an ample line bundle on $S$. There is an integer $r_0=r_0(S,L)$
such that, for every $r\ge r_0$, outside a countable union of proper
Zariski-closed subsets of $U_r$, with nonempty complement, one has
\[
 \varepsilon(S,L;p_1,\ldots,p_r)=\sqrt{L^2/r}.
\]
\end{corollary}
```

证明的四个关键句。降域与取门槛，`nef:242-250`："Descend the projective equations and the finite gluing data for $L$ to a subfield $F\subset K$ finitely generated over $\mathbb Q$ ... these properties descend through field extension, and the finite-data descent and ampleness criteria are recorded in \cite[Tags 01ZM and 0D3C]{Stacks}. The field $F$ is countable and embeds into $\C$. Fix such an embedding and choose $r_0$ from Theorem~\ref{thm:main} for $(S_{0,\C},L_{0,\C})$. The intersection number $H=L_0^2=L^2$ is unchanged by field extension."

逐对构造坏 locus，`nef:252-263`："Fix $r\ge r_0$ and put $w=\sqrt{H/r}$. For every pair of positive integers $a,m$ with $m>aw$, form on $U_{r,0}=U_r(S_0)$ the evaluation map \[ H^0(S_0,L_0^{\otimes a})\otimes\mathcal O_{U_{r,0}} \longrightarrow \bigoplus_{i=1}^r\operatorname{pr}_i^*\mathcal J_{a,m} \] using the principal-parts construction in the proof of Lemma~\ref{lem:jet-open}. Its noninjectivity locus $B_{a,m}$ is closed, cut out by maximal minors, and is empty if the source space is zero. Principal parts and these minors commute with field extension, as does $H^0$ by flat base change \cite[Tag 02KH]{Stacks}."

真性论证，`nef:264-269`："Each $B_{a,m}$ is proper over $\C$: at a tuple where $A-wE$ is nef, with $A=\pi^*L_{0,\C}$ and $E=\sum_iE_i$, a section in the evaluation kernel would give an effective divisor of class $aA-mE$, whose intersection with $A-wE$ is $aH-rmw<0$. Thus $B_{a,m}$ is proper over $F$ and remains proper over $K$. The single threshold $r_0$ works for all these pairs."

通用点与收尾，`nef:271-286`："Let $Z_r=\bigcup_{a,m:\,m>aw}B_{a,m,K}$. This is a countable union of proper closed subsets. Its complement contains a $K$-point: the function field $F(U_{r,0})$ has transcendence degree $2r$ over $F$ and embeds over $F$ into $K$. Indeed, choose $2r$ algebraically independent elements of $K$ over the countable field $F$ and extend the resulting embedding of a rational function field across the finite algebraic extension, using that $K$ is algebraically closed. The resulting $K$-point maps to the generic point of $U_{r,0}$ and therefore avoids all the $B_{a,m}$. At every tuple outside $Z_r$, all the homogeneous jet tests are injective. The proofs of Lemma~\ref{lem:positive-square}, Proposition~\ref{prop:homogeneous-nef}, and Lemma~\ref{lem:sesha-upper} use only surface Riemann--Roch, Serre duality, and the blow-up ideal identity, and are valid over $K$. They give nefness of $\pi^*L-w\sum_iE_i$ and the matching upper bound, respectively."

### 19.2 (b) 推导补全：从降域到 $K$-点的每一步

第一步，降域的存在性。$(S,L)$ 由射影方程与 $L$ 的 Čech 转移函数（gluing data）这套有限数据给出：射影簇由齐次多项式有限生成，线丛由有限个开覆盖上的转移函数给出，全部系数落在 $K$ 的某个有限生成 $\Q$ 子域 $F=\Q(\text{有限多个系数})$ 里。对 $F$ 作基变换得到 $S_0/F$ 与 $L_0/F$，使得 $(S_0)_{K}\cong S$、$(L_0)_{K}\cong L$。"光滑、整、射影、ample"四个性质都沿域扩张下降回 $F$-形式，论文把出处钉在 Stacks 的 Tag 01ZM（有限呈现数据的下降）与 Tag 0D3C（族判据可检验性）两句上（`nef:245-247`）。这里 $K$ 代数闭且特征零保证基变换后几何性质良好（光滑下降需要扩张后仍光滑，即几何光滑）。

第二步，$F$ 可数且嵌入 $\C$。有限生成域：先取有限个超越元得 $\Q(x_1,\ldots,x_n)$，再有限代数扩张；前者是可数域的有理函数域、可数，有限扩张不增基数，故 $F$ 可数。又可数特征零域总能嵌进 $\C$（逐步把可数多个生成元送到 $\C$ 中代数无关或代数元位置上；$\C$ 对每个可数扩张足够大）。选定嵌入 $\iota:F\hookrightarrow\C$ 后，$(S_{0,\C},L_{0,\C})$ 满足 `thm:main` 的全部假设（光滑复射影曲面加 ample 线丛），取它的门槛 $r_0$。交点数不变性（`nef:250-251`）：$L_0^2$ 是相交数，域扩张不改交叉积（Riemann--Roch 欧拉示性不变），故 $H=L_0^2=L^2$ 三个写法同值，这保证 $w=\sqrt{H/r}$ 在 ℂ 侧与 $K$ 侧是同一个数。

第三步，逐 $(a,m)$ 造 $B_{a,m}$。$U_{r,0}=U_r(S_0)$ 是 $S_0^r$ 去掉一切对角线的开集，维数 $2r$。对每对正整数 $(a,m)$ 满足 $m>aw$，在 $U_{r,0}$ 上写求值态射：源是常秩 $h^0(S_0,aL_0)$ 的自由丛（平凡丛的直和），靶是逐点 $m$ 阶 jet 商丛 $\bigoplus_i\operatorname{pr}_i^*\mathcal J_{a,m}$ 的直和。$\mathcal J_{a,m}$ 按主部（principal parts）构造：在完备局部模 $\mathfrak m^m$ 意义下取 $aL_0$ 的截面到每点 $m$ 阶 jet，这是 `lem:jet-open` 证明里已经建好的机器（`nef:33` 附近台账行），靶局部自由、秩 $r\binom{m+1}{2}$。线性代数事实：向量丛之间态射的非单射 locus 由（源秩大小的）极大子式生成理想切割，是闭子概形；若 $h^0(S_0,aL_0)=0$，源丛为零，零到任何丛的映射单射，$B_{a,m}=\varnothing$（`nef:260-261`），闭且真自动成立。

第四步，与域扩张交换。主部构造只用有限生成的局部代数与 $\mathfrak m^m$ 的幂，系数在 $F$ 中，张量到任何扩张域后同形；子式是坐标环上的多项式函数，交换基变换显然；$H^0$ 的交换靠平展基变换定理（Tag 02KH：$S_0/F$ 射影、$\mathcal O$ 凝聚，$H^0(S_F,aL_F)\cong H^0(S_0,aL_0)\otimes_FF'$）。于是对每个中间域（$F\subset\C$ 经 $\iota$、$F\subset K$ 由包含），非单射 locus 都是同一个 $F$-闭子概形 $B_{a,m}\subset U_{r,0}$ 的基变换，$\C$ 侧与 $K$ 侧性质互通。

第五步，$\C$ 侧真性。设 $\C$ 上某点列（tuple）$\mathbf p=(p_1,\ldots,p_r)\in B_{a,m,\C}$。取爆破 $\pi:Y\to S_{0,\C}$ 于这 $r$ 点，例外除子 $E_i$，$A=\pi^*L_{0,\C}$、$E=\sum E_i$。核里非零截面等价于线性系 $\lvert aA\rvert$ 中在每个 $p_i$ 处重数 $\ge m$ 的除子，即类 $aA-mE$ 的有效除子。用交数公式：$A^2=H$（拉回保交）、$A\cdot E_i=0$（$E_i$ 竖直而 $A$ 来自拉回）、$E_i^2=-1$、$E_i\cdot E_j=0$（$i\ne j$，互异点），得 $E^2=-r$，于是
\[
 (aA-mE)\cdot(A-wE)=aA^2-aw(A\cdot E)-m(E\cdot A)+mwE^2=aH-rmw .
\]
论文 `nef:267` 直接写出结果 $aH-rmw<0$；代入 $w=\sqrt{H/r}$，$aH-rmw<aH-raw\cdot$……按假设 $m>aw$，故 $rmw>r\cdot aw\cdot w=aHw^2r/r$……核对：$rw^2=r(H/r)=H$，所以 $rmw>raw^2$ 不对，重算：$rmw>r(aw)w$，而 $aw\cdot rw=aHw^2=aH\cdot H/r\cdot r$……逐项来：$m>aw\Rightarrow rmw>raw\cdot w=ra\,w^2=ra\,(H/r)=aH$，即 $rmw>aH$，移项得 $aH-rmw<0$，与论文一致。nef 除子与有效除子交数非负（有效除子是曲线类的非负整系数和，nef 对每条曲线交 $\ge0$），若该 tuple 处 $A-wE$ 是 nef 的，类 $aA-mE$ 的有效截面给出负交数，矛盾。故 $B_{a,m,\C}$ 不含任何使 $A-wE$ 为 nef 的 tuple。论文由此一步跳到"proper"（`nef:264-268`），中间的真性判别沿用第 11 节 `prop:homogeneous-nef` 一带已建立的口径：$U_r$ 在 $\overline{U_r}=S^r$ 中的边界恰是各对角线，而列紧性失效只能发生在点上。[推测：从"避开边界 tuple"到"作为 $F$-概形真"的赋值判别在原文这里被压缩成一句，我按第 9--11 节的同一机制读，行号内未给出独立引理。]既然 $B_{a,m,\C}$ 真，且真性、闭性都是基变换不变量（properness 沿 fpqc 下降；closed immersion 稳定于基变换），$B_{a,m}$ 在 $F$ 上真、再基变换到 $K$ 上仍真（`nef:268$ 那句 "Thus $B_{a,m}$ is proper over $F$ and remains proper over $K$"）。逐对的门槛检查用的是同一个 $r_0$、同一个 $w$（`nef:269` "The single threshold $r_0$ works for all these pairs"），没有引入任何依赖 $a,m$ 的新下界。

第六步，可数并躲开。正整数对 $(a,m)$ 可数，每个 $B_{a,m,K}$ 是 $U_{r,0}$ 的真闭子集，$Z_r$ 为可数并（`nef:271-272`）。存在 $K$-点补外的论证纯域论：$F(U_{r,0})$ 是函数域，$\dim U_r=2r$ 给超越次数 $2r$（`nef:273-274`）；$K$ 不可数、$F$ 可数，故 $K$ 中存在 $F$ 上代数无关的 $2r$ 元组（否则 $K$ 被可数多个真代数簇的 $K$-点并覆盖，逐次取非零多项式避开即可构造；不可数在此消费一次：可数域上超越可数多项式集合之外非空需要不可数性）；在有理子域 $F(x_1,\ldots,x_{2r})$ 上定下嵌入像，$K$ 代数闭使有限代数扩张 $F(U_{r,0)}/F(x_1,\ldots,x_{2r})$（特征零下超越基扩张必有限，这是 char 0 的消费点之一）的嵌入可延拓（代数闭域对有限扩张无扩张 obstruction）；所得 $K$-点对应 $U_{r,0}$ 的通用点，通用点不在任何真闭子概形内，故避开一切 $B_{a,m}$。

第七步，收尾。在 $Z_r$ 之外的 tuple，全体 $m>aw$ 的齐次 jet 测试单射；论文点名三个引理（`lem:positive-square`、`prop:homogeneous-nef`、`lem:sesha-upper`）只用曲面 Riemann--Roch、Serre 对偶与爆破理想恒等式，这三样在任意域 $K$ 上逐字成立（RR 对光滑射影曲面是上同维数恒等式，Serre 对偶要 $\omega_S$，爆破理想 $\mathcal J^m$ 的乘积式在正则点成立），于是 $K$ 上 $\pi^*L-w\sum E_i$ 的 nef 性与 $\varepsilon\le\sqrt{H/r}$ 的上界同得，等式由构造另一侧给出（`nef:281-287`）。

### 19.3 (c) 三个域假设、常数 $2r$ 与每一处不可动的理由

不可数性只被消费一次，位置精确：`nef:274-276` 的"$2r$ 个代数无关元"。若 $K$ 可数，函数域嵌入不存在，通用点的 $K$-值不存在，$Z_r$（可数个真闭集的并）可以覆盖全部 $K$-点（典型例子：$\overline{\Q}^n$ 被可数多个超曲面覆盖），陈述里"补非空"这一句失去见证者，命题写法必须改成 schema 通用点语言，论文没有做这个改写。代数闭性消费两处：有限代数扩张上嵌的延拓（`nef:276-277`，否则 $K$-嵌入不一定存在）；以及降域侧几何性质（光滑、几何整）沿扩张保持。特征零消费两处：超越基扩张有限性（完全可生性，char 0 自动），以及第七步 RR/Serre 路线与上游 `lem:node` 的 Bertini 式论证（第 3 节）本来就要求 char 0；论文把这三个假设并列写进 `nef:232-233` 而不在证明里逐条回收，我的对应是上面这些行号。

$r_0=r_0(S,L)$ 在陈述里重新出现（`nef:234`），但它不是新门槛：证明是从 $(S_{0,\C},L_{0,\C})$ 继承 `thm:main` 的 $r_0$（`nef:249`），依赖模式经 $H=L_0^2$ 不变性（`nef:250-251`）回落到 $(S,L)$ 本身；台账 `$r_0$` 行"若 $r_0$ 依赖 $m$ 则 `lem:jet-open` 可数 Baire 交失效"的 $K$-侧同款是 `nef:269` 那句 single threshold。$w=\sqrt{H/r}$（`nef:252`）把 ℂ 侧的临界斜率原样搬进 $K$ 侧记号，$m>aw$ 的不等号严格性同台账 `$w$，$m>kw$` 行：取 $m=aw$ 时第五步 $aH-rmw<0$ 变 $=0$，与 nef 交数非负不再矛盾，$B_{a,m}$ 可能含边界点，真性断。$2r$（`nef:273`）恰是 $\dim U_r=2\cdot r$，超越次数差一分（比如取 $2r-1$ 个无关元）就嵌不下整个函数域，通用点无从指定。源为零时 $B_{a,m}=\varnothing$ 这一约定（`nef:260-261`）不是可有可无的修辞：$a$ 小时 $h^0$ 完全可能为零（例如 $a=1$ 且 $L$ 无截面），若不给约定，非单射 locus 的"极大子式"生成理想在无截面时定义不明。

### 19.4 (d) 候选失败路线

[推测] 路线一：把不可数改成"足够多 $K$-点"的其他公设，例如 $K$ 完备赋值域后用 Baire 拓扑论证。障碍在第七步之前的全部构造是纯代数的（ minors、主部、下降），Baire 论证要求拓扑与解析结构，而 `lem:jet-open` 侧的开性本来就是 Zariski 开，解析论证搬不进一般 $K$；论文选域论论证正是绕开这个（对照 §2 死路二里"辛/解析通道碰不到复结构"的同类失败）。

[推测] 路线二：跳过降域，直接在 $K$ 上复演 `thm:main` 的证明。第一块基石 `lem:node` 靠复解析/微分拓扑直觉起步（第 3 节：Bertini 加 very ample 幂），`lem:rank-persistence` 与 `prop:initial-transfer` 的收敛论证（`jets:52-57`、`jets:153-160` 的重标主项级数与 Cauchy 估计）依赖 $\C$ 的绝对值拓扑，一般 $K$ 上要么不可写要么需要非阿基米德替代，论文没走这条路，改用 minors 把"逐对开条件"翻译成代数闭集，再一次性降域借 $\C$ 的解析机器。

[推测] 路线三：让 $B_{a,m}$ 只遍历 $(k,m)$ 中 $k$ 有界的有限集，指望有限并不再需要可数并论证。但 `cor:torus-test` 与 `prop:homogeneous-nef` 的消费面是所有 $m>kw$ 的正整数对，$a$ 无界；截断 $a$ 后"齐次测试推出 nef"的判别不完备（第 11 节：nef 判别要对一切曲线类，对应曲线次数无界），得到的闭集并不了全部坏点，$Z_r$ 补中的点可能仍栽在未测试的 $(a,m)$ 上。

### 19.5 回接第 14 节的 Lean 对账

本轮核过的仓库锚点：书目在 `lean\formalization.yaml:427`（title 为 Maximal Seshadri constants on arbitrary polarized surfaces，authors 记 ["OpenAI"]，id 指向 preprints 目录）与其后两行；形式化登记在 `lean\formalization.yaml:1330-1332`，comparator_config 为 `ComparatorChallenges/MaximalSeshadriConstants.json`，declaration 为 `OAI.MaximalSeshadri.Geometry.maximalSeshadriConstants`，file 为 `OAI/AlgebraicGeometry/Seshadri/Main.lean`。对照本节结论：`Main.lean` 认证的是 ℂ 上的 `EventualMaximalSeshadri`（第 14 节已核：`Surface` 的 `structureMap` 目标写死 `Spec (CommRingCat.of ℂ)`，`Model.lean:40`），`cor:fields` 的三件套，降域到可数 $F$、$2r$ 无关元选取、有限代数扩张上嵌的延拓，在 `Bertini/CountableSpecialization.lean` 有机器件（`field_embedding_over_countable`、`generic_field_embedding`，带 `[IsAlgClosed K] [Uncountable K]`）但我仍未找到把它们拼成"曲面定理 `cor:fields`"逐字对应的顶层声明。§14 第五条的 [推测] 就此维持原判定并多一条依据：论文证明里被消费的 `cor:fields` 结构（19.2 第三、四步的 minors 与下降）在 Lean 侧没有对应的"非单射 locus 真性"声明被登记，缺的是这条，并非底层嵌入机器。comparator 只认 `maximalSeshadriConstants` 一条这一事实不变。

## 20 我走过的错路（续）：死路四到死路八

第 2 节的三条死路是入口处的路线级失败。这一节续记五处更细的、我在反推 `lat` 与 `nef` 分片时真实走岔过的点，每条给反证文本位置或机械失效理由。

**死路四：一个 $t$ 服务所有 $r$。** 装配 `cor:torus-test` 时我默认三角形族里挑一个"通用形状"的 $P_t$，之后每个 $r$ 只换 $u$。陈述句替我纠正：`lat:257-258` 写的是 "for every integer $r\geq r_0$ one can choose a single $t>T$"，"single" 的辖域是每个 $r$ 内部（对固定的 $r$ 只许选一个 $t$，用以覆盖全部 $(k,m)$），跨 $r$ 的统一定量不存在。机械失效：给定 $t$，三个顶点值 $\det(u,(-b,0))=jb$、$\det(u,(a,0))=-ja$、$\det(u,(0,1/d))=i/d$（`lat:243-249`）连 $u$ 一起把跨度锁成一个确定数，而 `lem:direction` 要求的跨度是 $\sqrt{rH}$（`lat:207-208`），两个不同 $r$ 给出两个不同目标值，一形一跨度不可能同时满足；就算允许每个 $r$ 换 $u$ 不换 $t$，`lat:212-213` 里 $a,b$ 由 $t$ 定死、跨度关于 $u$ 的最大可达值随 $R$ 增长的需求仍然没有解的空间，$a\in(a_0,W)$ 的开性是为反解 $t$ 预留的，不是为固定 $t$ 预留的。

**死路五：把 CFKLRS 的平面推论当前提。** `lem:node` 与 `prop:quadrilateral` 的加权图思路来自 Ciliberto--Farnik--Küronya--Lozovanu--Rué--Shramov 的可变 Newton--Okounkov 四边形（`node:8-11` 点名引用其 Section 5.1 与 Corollary 5.8），我一度以为任意极化曲面上的 nodal 界可以直接引该文献的平面情形推论。`node:11-13` 逐字关死："The nodal bound on an arbitrary polarized surface and the diagonal compression used here are proved directly; the plane corollary in that source is not a premise." 失效理由在对象层面也成立：该文献的推论在有理曲面或 toric 设置里造曲线类，任意 $(S,L)$ 上没有对应的 torus 作用与分母分解，引用会把未证假设搬进正文。

**死路六：不验证 primitive 就造 $G$。** `prop:subgroup-test` 证明的第一句（`lat:116`）"Complete $u$ to an integer basis $(u,v_0)$ with $\det(u,v_0)=1$" 我起初当平凡线性代数读过。反例机械：$u=(2,4)$，任意 $\xi\in\Z^2$ 有 $\det(u,\xi)=2\cdot\xi_2-4\cdot\xi_1\in 2\Z$，永远凑不出 $1$，补基无解；一般地 $\gcd(i,j)=g>1$ 时 $g$ 整除一切 $\det(u,\xi)$。补基断了，$M=\Z u+\Z v$（`lat:117-120`）不再是满秩子格（实则退化），$\det N=r$ 与面积折算（`lat:183-184`）失去定义，$G$ 只剩一条子环面、点数不是 $r$（`lat:131-133`）。这条错路教我把 `lem:direction` 里"2 的幂 $j$ + 奇 $i$"（`lat:229-230`）读成全链条最便宜的保险，并非装饰。

**死路七：以为 `cor:fields` 对 $\overline{\Q}$ 也顺路成立。** 我按"可数并躲开"的直觉，以为代数闭就够了、不可数是可以省略的富余假设。反证在证明自己的构造句里：`nef:274-276` 要"choose $2r$ algebraically independent elements of $K$ over the countable field $F$"，而 $\overline{\Q}$ 上任何元素都代数量、一个都选不出；$\overline{\Q}$ 可数，$Z_r$ 是可数个真闭集的并，纯集合论上可以盖满全部 $\overline{\Q}$-点（对每个 $B_{a,m}$ 的 $\overline{\Q}$-点逐个枚举再对角化避开是办不到的，因为要避开的闭集族本身可数且越来越密，通用值不存在）。陈述句 `nef:232-233` 把 uncountable 写进假设正为此。[推测：定理本身对可数 $K$ 是否失效论文未讨论，失效的确定是我引用的这条证明路线，可能的替法是放弃 $K$-点改说 schema 通用点，但那要重做 $\varepsilon$ 对非闭点的定义，超出论文范围。]

**死路八：拿一般位置 $r$ 点集替代子群 $G$。** 我在第 7 节初读时觉得"子群"只是 `prop:subgroup-test` 的技术口味，任意互异点应该一样做。子群身份在证明里至少被消费四处：`lat:137-138` 平移 $\tau_g$ 置换 $G$（要 $gG=G$，任意点集不闭合于平移）；`lat:141` 的投影 $f_\eta=\frac1r\sum_{g\in G}\chi_\eta(g)^{-1}\tau_gf$ 求和指标是群元（无群结构则式子无意义）；`lat:147-153` 正交关系 $\frac1r\sum_{g\in G}\chi_{\xi-\eta}(g)\in\{0,1\}$ 靠 $r$ 次单位根全和（任意点集给不出 $\{0,1\}$ 择边）；`lat:168-174` 把逐点重数搬到 $\ord_{(1,1)}$ 靠 $G$ 在坐标 $(X,Y)$ 下恰为 $\{X=1,\ Y^r=1\}$（`lat:131-132`）、含单位元且被 $(X,Y)\mapsto(X,Y^r)$ 收束。缺任一处，`lat:156-157` 的"取一个非零分量"与 `lat:186-188` 的三角形重数界都衔接不上，反证不闭合。

## 21 常数与参数台账（续行）

第 13 节表尾在 `$2r$` 行止。以下续行来自第 18、19、20 节的逐行重核，列序与五栏规格不变（`| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |`），不重复表头。

| $\operatorname{area}(\Delta)$ | $k^2H/(2r)$，按 $1/\lvert\det N\rvert$ 从 $k^2H/2$ 折下 | `lat:183-184` | `lem:triangle-multiplicity` 的面积输入（`lat:186-188`） | 面积口径错则重数界 $\rho$ 漂移，`lat:188` 的 $\ord\le k\sqrt{H/r}<m$ 矛盾不闭合 |
| $[\Z^2:M]$ | $=\lvert\det(u,v)\rvert=r$，靠 $v=rv_0$ | `lat:117-120` | $\lvert G\rvert=r$（`lat:131-133`）与投影平均的分母 $r$（`lat:141`） | 去掉因子 $r$ 则指标 $1$、$G$ 塌回单位元，测试点数不符 $U_r$ |
| $\operatorname{diag}(1,r)$ | $(X,Y)\mapsto(X,Y^r)$ 在 $(1,1)$ 处微分 | `lat:168-169` | 局部双全纯搬运 $\ord_{(1,1)}F\ge m$（`lat:172-174`） | 不可逆（$r=0$）则反函数定理失效，逐点重数与单点估计断链 |
| $\frac1r\sum_{g\in G}\chi_\eta(g)^{-1}\tau_g$ | 陪集投影，值在 $\{0,1\}$ 上择边 | `lat:141-153` | 分解 $f=\sum_\eta f_\eta$ 与非零分量选取（`lat:156-157`） | $G$ 非群则单位根全和不为零，正交关系失、分量支撑出 $kP$ |
| $aH-rmw$ | $m>aw$ 时严格为负，$rw^2=H$ | `nef:265-267` | $B_{a,m}$ 的 $\C$-侧真性（`nef:264-268`） | 取 $m=aw$ 则值为零、与 nef 交非负不矛盾，真性论证失效 |
| $B_{a,m}$ 空源约定 | $h^0(S_0,aL_0)=0$ 时 $B_{a,m}=\varnothing$ | `nef:260-261` | 可数并 $Z_r$ 的真性逐项检查（`nef:271-272`） | 无此约定则零源时极大子式理想定义悬空，闭性断 |
| Tags 01ZM 与 0D3C | 有限数据下降与 ampleness 可检验性 | `nef:245-247` | 降域 $(S_0,L_0)/F$ 存在性 | 降不下则嵌不进 $\C$，`thm:main` 的 $r_0$ 无从继承 |
| Tag 02KH | $H^0$ 沿平展基变换交换 | `nef:262-263` | $B_{a,m}$ 在 $\C$ 与 $K$ 两侧同源比较 | 不交换则空性与真性不是可转移性质，`nef:268` 两侧传递断 |
| $r_0$（`cor:fields` 侧） | 从 $(S_{0,\C},L_{0,\C})$ 继承，不新取 | `nef:249`；`nef:269` | 全体 $(a,m)$ 对统一生效 | $r_0$ 若随 $a$ 漂移，`lem:jet-open` 与 $Z_r$ 的可数交逐对换基座，齐次测试并不到一处 |

行号复核说明：本轮直接打开的三个分片里，`lat:116-120`、`lat:131-133`、`lat:141-153`、`lat:163-174`、`lat:178-188`、`lat:255-271`、`nef:231-240`、`nef:242-269`、`nef:271-287`、`node:8-13` 我都逐字看过再落行号；台账续行的"位置"栏全部出自这些区间。第 13 节原表的 24 行未被本轮任何追加触碰。
