# D111 复群环的 Bass 迹猜想：滤链手术与右射影消没的反推笔记

素材登记：`E:\math\preprints\The-Bass-trace-conjecture-for-complex-group-rings-September-24-2026\build\`，main.tex 2,406 B，分片十枚合计 98,073 B（01-introduction 15,027、06-chains 13,923、04-filtrations 13,568、05-surgery 11,377、03-metric 11,279、07-idempotents 10,880、08-detector 7,952、09-completion 6,983、10-torsion-free 5,330、02-framework 3,754），全部按字节降序读毕。Lean 侧只读 `lean/OAI/RingTheory/BassTrace/Main.lean`、目录内限定 grep、`formalization.yaml:946-948`、`ComparatorChallenges/BassTrace.json`。标注约定：论文原文给 `分片名:行号` 逐字引用；我补出来的思维链给 `[推测]`；本次未启用外部网页，故全文无 `[外部推断]` 标记，凡外部背景均以论文引文行号转述。另记一笔：队列题名是 The Bass trace conjecture for complex group rings，tex 内实际标题为 main.tex:36
```
\title{The Bass trace conjecture and the characteristic-zero Kaplansky idempotent conjecture}
```
目录名与正文标题的口径差（前者只讲迹，后者把特征零幂等猜想并列），后面第 15 节会回到这个差别，因为它正是我写作顺序摇摆的化石。

## 0 初始动机与第一个猜想

我手里的出发点是 main.tex:42-48 的摘要：
```
We prove the complex group-ring Bass trace conjecture for every discrete
group: the Hattori--Stallings trace of a finitely generated projective module
over its complex group ring is supported on conjugacy classes of finite-order
elements. As a consequence, for every torsion-free group $G$ and every
commutative unital domain $R$ of characteristic zero, the only idempotents
in $RG$ are $0$ and $1$. This proves Kaplansky's idempotent conjecture in
characteristic zero.
```
写摘要时我已经知道这两句话的分量差：迹定理此前只对线性群（01:209-210 `Bass proved complex trace vanishing at infinite-order elements for linear groups \cite[Theorem (6.1)(f)]{Bass1979}`）、初等可解群（01:233-235 Farrell-Linnell）、可解群经 Bost 装配（01:236-239 BCM2004）、以及 Farrell-Jones 假设之下（01:241-243 Bartels-Lück-Reich）成立；对任意离散群，抽象目标本身就悬了五十年。我最初的猜想完全沿着 Burghelea 的分解密路走：01:262-265
```
Burghelea's decomposition
of cyclic homology by conjugacy classes identifies the infinite-order
components through the reduced centralizers $C_G(g)/\langle g\rangle$
```
即系数 $\HS_G(x)([g]_G)$ 落在以 $C_G(g)/\langle g\rangle$ 的连续同调为系数的某个周期同调分量里；再学 Eckmann 的招法（01:265-268：Eckmann 用高次消没对有限有理同调维数的群族拿到迹消没）。我的第一猜想于是成形：[推测] 只要证明每个无穷阶 $g$ 的约化中心化子 $H=C_G(g)/\langle g\rangle$ 的某个同调维数有限，或者用某种装配映射把 $H$ 的同调杀掉，迹系数就因"次数不够"而为零。这个猜想的死因很硬：$G$ 是任意离散群，$C_G(g)/\langle g\rangle$ 可以是任何群（自由群的平方根闭包之类构造随时能造出同调维数无穷的中心化子商），我对它没有任何维数控制。01:272-273 那句
```
The sparse-chain theorem replaces a homological-dimension
hypothesis with connected-support control on the particular cycles.
```
就是这份死亡的验尸报告：同调维度假设被换成了对"具体这批链"的支集连通控制。

第一个关键转折发生在把问题从"整条同调类"降到"单个系数"的时候：[推测] 我意识到要证的只是一族数 $\HS_G([e(\C G)^q])([g]_G)=0$，其中 $e$ 只有有限多个群系数、$g$ 只有一个，于是数据是有限组合学；有限数据可以在任何我有权选择的巨大偶数维 $n$ 里重排成单纯闭链，而单纯复形的几何（剖分、切割、面积）我可以自由设计。这一步把"对群族证明"改写为"对每个三元组 $(e,g,n)$ 造一条链、再用几何数出零"。

第二个转折是结构性，并非数学性的：01:136-139
```
We first describe the algebraic construction to explain the geometric
statement it needs. The body of the paper begins with that geometric
statement, formulated independently of group rings, and completes its
proof before constructing the cycles and cocycles to which it applies.
```
正文第 2-6 节（02-framework 到 06-chains）完全不含群环，第 7-8 节才回来造闭链与检测余闭链。我最初按代数在前几何在后写，第 6 节反复引用还没被构造出来的 $v_k$，改了三轮才接受"几何定理独立陈述、先证完再认领"的排法；这个顺序决定反过来暴露了标题口径差（第 15 节展开）。

在我把目标定成有限群式"单位元支撑"之前，01:59-63 已经把我拍醒：
```
Finite-order
coefficients need not vanish away from the identity: for a finite group
$F$, the idempotent $|F|^{-1}\sum_{h\in F}h$ has coefficient
$|C|/|F|$ at every conjugacy class $C$. The conclusion therefore differs
from the identity-only support assertion for integral group rings.
```
复系数的正确目标只能是"支撑落在有限阶共轭类"，单位元-only 是整系数版（第 11 节的 cor:integral）才配得上的强度。错误路线的完整清单集中在第 13 节，机器侧证据在第 14 节，与最初设想的差异清单在第 15 节。

## 1 取值集合与坐标：HS 迹住在哪个空间

单位、定义与逐字引文（01:12-22 起）：
```
For a unital complex algebra $A$, let $K_0(A)$ be the Grothendieck group of
finitely generated projective right $A$-modules, and set
...
 \HH_0(A)=A/[A,A],
```
01:20-24：
```
Its
Hattori--Stallings trace is
\[
 \HS_A([eA^q])=\left[\sum_{i=1}^q e_{ii}\right]\in\HH_0(A),
\]
extended additively to virtual projective classes.
```
补中间步骤。$\HH_0(\C G)\cong\bigoplus_{C\in\con(G)}\C C$ 由 (1) 良定义、(2) 满、(3) 核恰为 $[\C G,\C G]$ 三件组成。01:29-33 给出映射逐字：
```
\begin{equation}\label{eq:class-trace}
 \left[\sum_{h\in G}a_hh\right]
 \longmapsto
 \sum_{C\in\con(G)}\left(\sum_{h\in C}a_h\right)C.
\end{equation}
```
(1)：交换子 $[x,y]=xy-yx$ 在共轭类 $C$ 上的系数和为零，因为 $xy$ 在 $C$ 上的类系数和等于 $\sum_{uv\in C}x_uy_v$，把 $uv=u(vu)u^{-1}\cdot u$ 重排为 $vu$ 即与 $yx$ 的相同和重合。(2) 显然。(3)：01:34-36 逐字：
```
Indeed, a commutator has zero sum on each conjugacy class, and the
differences of conjugate group elements span the kernel of the displayed
map. Such differences are commutators: $tst^{-1}-s=[t,st^{-1}]$.
```
即核由 $s'-s$（$s'=tst^{-1}$）张成，而 $[t,st^{-1}]=t(st^{-1})-(st^{-1})t=tst^{-1}-s$ 恰好补上；每个 $\C G$ 元素只有有限支集（01:37：`All sums arising from an element of $\C G$ have finite support.`），所以 $\HH_0$ 是直和，并非直积。机械理由清单：HS 取值集合是 $\bigoplus_{\con(G)}\C$，Lean 里同一件事写成 `Definitions.lean:457`：
```
def HattoriStallings : ModuleK0.{u,v} (MonoidAlgebra ℂ G) →+ (ConjClasses G →₀ ℂ) :=
```
`→₀` 即 Finsupp（有限支集函数），与"直和"逐字对齐；`→+`（加群同态）对应 01:24 的 extended additively。目标群 $G$ 覆盖任意离散群：Main.lean 的签名里 `[_root_.Group G]` 无任何附加假设（见第 14 节）。

候选失败路线：[推测] (a) 我曾想把 $\HH_0$ 换成 $\ell^1$-版本的类函数空间，那是 BCM2004 在 $\ell^1(G)$ 上的更强命题（01:238-239 明言 their result concerns the stronger trace assertion on $\ell^1(G)$），对纯代数 $K_0$ 是过度要求且把证明拖进解析泥潭；(b) 忘加 virtual extension 就想只对幂等矩阵说话，后面 cor:integral 与 tau 秩恒等式都需要差类；(c) 用类方程 $\sum_{x\in C_G(s)}$ 权重归一化系数，试图把系数读成有理数，有限群才有的轨道-稳定子算术在无穷群上无归一化可用。

## 2 从幂等矩阵到不变核与路径权重

07 节的锚点引文，07:64-67：
```
e=\sum_{s\in G}A_s s,\qquad A_s\in M_r(\C),\qquad
 S_0=\{s\in G:A_s\ne0\}.
```
07:68-70：
```
The set $S_0$ is finite.  Idempotence says that
$\sum_{uv=t}A_uA_v=A_t$ for every $t\in G$.
```
07:74-78 的核幂等式：
```
 \sum_{k\in G}a(h,k)a(k,h')
 =\sum_{uv=h^{-1}h'}A_uA_v
 =a(h,h').
```
补中间步骤。$a(h,h'):=A_{h^{-1}h'}$ 把矩阵系数搬到 $G\times G$ 上：$\sum_k a(h,k)a(k,h')=\sum_{uv=h^{-1}h'}A_uA_v$，因为 $k\leftrightarrow(h,u=k^{-1}h\mapsto h^{-1}k,\ v=h^{-1}h')$ 是双射；右端按 $e^2=e$ 恰为 $A_{h^{-1}h'}$。左平移不变性 $a(th,th')=a(h,h')$ 是定义的直接推论，这就是"simultaneous left translation"商掉 $J$ 的代数理由。权重（07:105-109 逐字）：
```
 w_k(h_0,\ldots,h_{k-1})
 =\tr\bigl(a(h_0,h_1)\cdots
 a(h_{k-2},h_{k-1})a(h_{k-1},gh_0)\bigr),
```
$w_1(h_0)=\tr(a(h_0,gh_0))$（07:110）。非零权重强制增量 $s_i=h_i^{-1}h_{i+1}\in S_0$、$s_{k-1}=h_{k-1}^{-1}gh_0\in S_0$，且 $s_0\cdots s_{k-1}=h_0^{-1}gh_0$（07:113-120）；增量表从 $h_0$ 递推决定整个元组，两个 $h_0$ 选择给同一 $Q_k=J\backslash G^k$ 点当且仅当相差 $J$-左乘（07:121-123），于是 07:123-124：`Hence $v_k$ has at most $|S_0|^k$ nonzero coefficients.`

图的构造（07:88-95）：
```
Choose a finite symmetric generating set $S\subset G\setminus\{1\}$
containing $S_0\setminus\{1\}$ and its inverses.  Give $Y$ the simple
undirected graph whose edges join $\bar h$ to $\overline{hs}$ for $s\in S$;
loops are omitted and repeated edges identified.  The graph is connected
and has degree at most the fixed integer
\[
 D=\max\{2,|S|\}.
\]
```
机械理由：$S$ 必须对称以保证图无向；必须含 $S_0\setminus\{1\}\cup S_0^{-1}$ 以保证非零权重的每对相邻投影顶点由 $S$-边相连（第 3 节连通支集全靠这条）；$1\notin S$ 与去环是为了简单图，度数 $\le|S|$，取 $\max\{2,\cdot\}$ 是因为第 6 节几何球计数用到 $D\ge2$（03-metric.tex:226 的 $\sum_{j=0}^kD^j\le D^{k+1}$ 需要 $D\ge2$）；$D$ 一旦定死就跨所有维度 $n$ 不变（07:100-101：`We keep this graph and this value of $D$ throughout all subsequent choices of dimension.`），这是第 6 节高维体积裕度 $\to 0$ 的前提。$H=J/\langle g\rangle$ 在 $Y=\langle g\rangle\backslash G$ 上左乘自由（07:96-99）：$\overline{ch}=\bar h$ 给 $ch=g^qh$，右乘消去后 $c=g^q\in\langle g\rangle$，故 $H$-作用是自由的，[推测] 这一步我最初写的是"$J$ 在 $G$ 上左乘自由"，错了：自由性只在模 $\langle g\rangle$ 后的 $H$ 上成立，$\langle g\rangle$ 本身把每个右陪集平动回自己。

候选失败路线：[推测] (a) 用左陪集 $G/\langle g\rangle$ 配右乘作用，扭曲移位 $(h_0,\dots)\mapsto(h_1,\dots,gh_0)$ 与矩阵迹循环性不再同侧兼容，第 3 节 $T_*v_k=v_k$ 直接崩；(b) 只商 $\langle g\rangle$ 不商 $J$，则 $w_k$ 对同时左乘不再不变（$A_{(ch_0)^{-1}(ch_1)}$ 不变但 $\tr(\cdots a(ch_{k-1},gch_0))$ 里的 $g$ 与 $c$ 不交换除非 $c\in J$）；(c) 让 $S$ 随 $n$ 变大以求更多边的"稠密图"，会毁掉 $D$ 的维度无关性，第 6 节 $D^{2n}$ 与 $2^n$ 的赛跑变成无底洞。

## 3 扭曲循环移位、删除恒等式与偶数维闭链

07:128-144（Path identities 命题体）：
```
\begin{lemma}[Path identities]\label{lem:path-identities}
For the path sums associated to $e$ and $g$, the twisted cyclic shift
\[
 T(h_0,\ldots,h_{k-1})=(h_1,\ldots,h_{k-1},gh_0)
\]
preserves $v_k$.  For $k\ge2$, deletion of any entry induces a map
$d_i:Q_k\to Q_{k-1}$ satisfying
\[
 (d_i)_*v_k=v_{k-1}\qquad(0\le i<k).
\]
Every $v_k$ has the same total weight
\begin{equation}\label{eq:trace-coefficient}
 \lambda:=v_k(1)
 =\sum_{s\in[g]_G}\tr(A_s)
 =\HS_G\bigl([e(\C G)^r]\bigr)([g]_G).
\end{equation}
\end{lemma}
```
补中间步骤。(i) $T$ 保 $v_k$：$T$ 是 $J$-等变双射，逆为 $(h_0,\dots,h_{k-1})\mapsto(g^{-1}h_{k-1},h_0,\dots,h_{k-2})$（07:147-151）；像的权重把因子序列 $(a(h_0,h_1),\dots,a(h_{k-1},gh_0))$ 变成 $(a(h_1,h_2),\dots,a(h_{k-1},gh_0),a(gh_0,gh_1))$，末项由左不变性 $a(gh_0,gh_1)=a(h_0,h_1)$ 补成首项，于是权重是原矩阵乘积迹的循环重排，矩阵迹循环性给相等（07:153-156）。$k=1$ 时 $T$ 在 $Q_1$ 上是恒等，因 $g\in J$（07:152）。(ii) 删除：内点删除逐字靠核幂等式 $\sum_k a(h,k)a(k,h')=a(h,h')$；末点删除（07:164-166）：
```
 \sum_u a(h_{k-2},u)a(u,gh_0)=a(h_{k-2},gh_0).
```
首点删除（07:167-176）用 $B=a(h_1,h_2)\cdots a(h_{k-2},h_{k-1})$（$k=2$ 时 $B=I_r$）：
```
 &\sum_{h_0}\tr\bigl(a(h_0,h_1)B a(h_{k-1},gh_0)\bigr)\\
 &\qquad=\sum_{h_0}\tr\bigl(Ba(h_{k-1},gh_0)a(gh_0,gh_1)\bigr)\\
 &\qquad=\tr\bigl(Ba(h_{k-1},gh_1)\bigr).
```
第一行到第二行：迹循环把 $a(h_0,h_1)$ 轮转，且左不变性给 $a(h_0,h_1)$ 前缀 $g$；第二行到第三行：$u=gh_0$ 换元套核幂等式。纤维求和有限（07:177-178：`The kernel has finite row and column support`）保证每步合法。(iii) 全权重等式：删除恒等式给 $v_k(1)=v_{k-1}(1)=\cdots=v_1(1)$；$J\backslash G\to[g]_G$，$Jh\mapsto h^{-1}gh$ 是双射（07:183-186：等式 $h'^{-1}gh'=h^{-1}gh$ 等价 $h'h^{-1}\in J$），故 $v_1(1)=\sum_{s\in[g]_G}\tr(A_s)$，按 01:38 的坐标记号这正是 $\HS$ 的 $[g]_G$ 系数。

闭链构造引 07:196-199：
```
 \pi_k:\C^{(Q_k)}\longrightarrow(E_{k-1})_H,\qquad
 [h_0,\ldots,h_{k-1}]\longmapsto
 [\delta_{\bar h_0}\wedge\cdots\wedge\delta_{\bar h_{k-1}}].
```
07:219-229：
```
Since $\overline{gh_0}=\bar h_0$, the twisted shift projects to the cyclic
permutation of the $k$ wedge factors.  Hence
\[
 \pi_kT=(-1)^{k-1}\pi_k.
\]
Together with $T_*v_k=v_k$, this shows that $b_k=0$ whenever $k$ is even.
The deletion identities give
\[
 \partial b_k=\sum_{i=0}^{k-1}(-1)^i b_{k-1}\qquad(k\ge2).
\]
For even $n$, it follows that $\partial z_n=b_n=0$.
```
机械理由（偶数维为什么是被迫的）：$\pi_kT_*v_k=\pi_kv_k$ 结合 $\pi_kT=(-1)^{k-1}\pi_k$ 得 $b_k=(-1)^{k-1}b_k$，故 $k$ 偶时 $b_k=-b_k=0$（2-秩外积在特征零里被符号杀光）；$z_n:=b_{n+1}$（07:203-206），其边界 $\partial z_n=\sum_{i=0}^{n}(-1)^i b_n$，交错和 $\sum_{i=0}^{2m}(-1)^i=1$（项数 $2m+1$ 为奇），故 $\partial z_n=b_n$；$n=2m$ 偶给 $b_n=0$。两条符号算术合起来：检测器需要 $\psi_m$ 在 $2m$ 阶外积上取值（列表长 $2m$ 的 Pfaffian 才有定义，见第 4 节），链需要 $n$ 偶才闭，两个偶数条款互锁。K 的支集连通（07:231-236）：非零权且投影顶点互异的元组，相邻 $\bar h_i,\bar h_{i+1}$ 由 $S$-边相连（$h_i^{-1}h_{i+1}\in S_0\subset S$；末边 $h_{k-1}^{-1}gh_0\in S_0$ 经 $\overline{gh_0}=\bar h_0$ 闭合），故 $n+1$ 个顶点的生成子图连通；$D$ 与图不随 $n$ 变。边界在 $C_n(K)_H$ 中为零靠直和分解（07:244-248）：
```
 E_j=C_j(K)\oplus W_j,
 \qquad
 (E_j)_H=C_j(K)_H\oplus(W_j)_H.
```
机械理由：两个直和项都是 $H$-不变（含定向号），故商coinvariant 后包含仍单射，$\partial$ 的 $E$-零性在 $C(K)_H$ 里反映为零。

候选失败路线：[推测] (a) 想对奇数 $n$ 造闭链：$b_k$ 在 $k$ 偶恒为零，链层面无解，检测器也需要偶列表，我在这个死路上浪费过一轮，试图用对称张量积替换外积避开符号，代价是 coinvariant 对偶配对全断；(b) 不设 $W_j$ 直和就想宣称 $z_n$ 是 $C_n(K)_H$ 的闭链，边界可能从 $K$ 漏到全单纯形里，07:240-251 的分解段就是补漏；(c) 忘记"重复投影顶点贡献为零"（07:231）而给多重元组配权重，链的系数会与 $\pi_k$ 的像不匹配。

## 4 Pfaffian 检测器与 $2^{-m}$ 归一

逐字引文。08-detector.tex:13-19：
```
\begin{lemma}\label{lem:beta}
There is a $J$-invariant function $\beta:G\times G\to\R$ such that
\begin{equation}\label{eq:beta-properties}
 \beta(h',h)=-\beta(h,h'),\qquad
 \beta(g^r h,g^s h')=\beta(h,h')+s-r
 \quad(r,s\in\Z).
\end{equation}
\end{lemma}
```
08:75-79 的 $p_m$：
```
For a list $\mathbf h=(h_0,\ldots,h_{2m-1})$ with $m\ge1$, let
\[
 p_m(\mathbf h)=\operatorname{Pf}
       \bigl(\beta(h_i,h_j)\bigr)_{0\le i,j<2m},
 \qquad p_0=1.
```
08:96-98 的递推：
```
\begin{lemma}\label{lem:pfaffian-recurrence}
For every $m\ge1$, one has $q_m=\tfrac12q_{m-1}$ and hence
$q_m=2^{-m}\lambda$.
```
08:143-146 的检测公式：
```
 \psi_m(y_0,\ldots,y_{2m})
   =\sum_{i=0}^{2m}(-1)^i
       p_m(h_0,\ldots,\widehat{h_i},\ldots,h_{2m}),
```
08:150-153：`\psi_m\partial=0,\qquad \psi_m(z_{2m})=2^{-m}\lambda.`（08:152 处）。

补中间步骤。(i) $\beta$ 的构造（08:22-43）：$H$ 在 $Y\times Y$ 上对角自由（第一坐标已自由），每轨道选代表 $(y_o,y_o')$ 与提升 $(l_o,l_o')$；给定 $(h,h')$ 唯一 $\bar c\in H$ 把代表送到投影对，取提升 $c\in J$ 写 $h=g^r c l_o$、$h'=g^s c l_o'$；$g$ 无穷阶保证固定 $c$ 时 $r,s$ 唯一（08:32-33），把 $c$ 换成 $g^t c$ 则 $(r,s)\mapsto(r-t,s-t)$，故 $B(h,h')=s-r$ 与提升 $c$ 无关；$c$ 与 $g$ 交换给出 $J$-不变。08:41 的反对称化 $\beta=\tfrac12(B(h,h')-B(h',h))$ 同时给出 $\beta(h',h)=-\beta(h,h')$ 与位移律：$B$ 在 $(g^rh,g^sh')$ 下加 $s-r$，而 $B(h',h)$ 加 $r-s$，均值恰加 $s-r$。(ii) 旋转恒等式（08:102-119）：长度 $2m$ 列表的普通循环移位给 Pfaffian 乘 $(-1)^{2m-1}=-1$（首元素跨越 $2m-1$ 个位置）；扭曲移位 $T\mathbf h=(h_1,\ldots,h_{2m-1},gh_0)$ 相对普通移位多一步"末位 $h_0$ 换成 $gh_0$"，按位移律这给矩阵最后一列对角线以上的每个条目加 $1$；沿末列按余因子展开 Pfaffian（每个完美匹配恰用末列一个条目，08:118-119），得 08:109-115：
```
 p_m(T\mathbf h)
   ={}&-p_m(\mathbf h)\\
     &+\sum_{i=1}^{2m-1}(-1)^{i+1}
       p_{m-1}(h_1,\ldots,\widehat{h_i},\ldots,h_{2m-1}).
```
(iii) 对 $v_{2m}$ 加权求和：$T_*v_{2m}=v_{2m}$（第 3 节）使左端求和为 $q_m$；每个 $m\ge2$ 的余子式是"先删 $h_0$ 再删 $h_i$"的两步删除，用两次删除恒等式其加权和为 $q_{m-1}$；$m=1$ 时余子式 $p_0=1$，加权和是总权重 $v_2(1)=\lambda=q_0$（08:124-126 明言 this endpoint uses no vector $v_0$）；符号和 $\sum_{i=1}^{2m-1}(-1)^{i+1}=1$（08:127）。合起来 $q_m=-q_m+q_{m-1}$（08:130），即 $q_m=\tfrac12q_{m-1}$，递推到底 $q_m=2^{-m}\lambda$。(iv) 提升无关性（08:159-175）：把右端认作 $u\wedge b^m/m!$ 中 $\varepsilon_0\wedge\cdots\wedge\varepsilon_{2m}$ 的系数，$u=\sum_i\varepsilon_i$；换提升 $h_i\mapsto g^{r_i}h_i$ 使 $b\mapsto b+u\wedge v$，$v=\sum_ir_i\varepsilon_i$（08:172-173），于是 $u\wedge(b+u\wedge v)^m$ 的每个修正项含两个 $u$ 楔乘为零（08:173-174），系数不动。(v) 余闭链（08:187-191）：对 $2m+2$ 个顶点统一选提升，$\psi_m\partial$ 是 $p_m$ 的两步交错删除，两次删除次序不同的同一列表恰出现两次反号，成对消掉。(vi) 估值（08:193-202）：$z_{2m}$ 是 $v_{2m+1}$ 的外积投影，$\psi_m$ 的每个一项删除加权和是 $q_m$，符号和 $\sum_{i=0}^{2m}(-1)^i=1$，故 $\psi_m(z_{2m})=q_m=2^{-m}\lambda$（08:198）。

机械理由：$\beta$ 取值 $\R$ 不可降级到 $\Z$，08:55-57 给出硬例：
```
Real values are useful
here: for $G=\langle t\rangle$ and $g=t^2$, the value
$\beta(1,t)=1/2$ is forced.
```
[推测] 机制在两点图 $Y$ 上：$\bar 1$ 与 $\bar t$ 互为 $t$-平移，交换对称性配合位移律把 $\beta(1,t)$ 钉在 $1/2$。$m\ge1$ 起步是因为 $p_m$ 只对偶长列表有定义；$2^{-m}$ 因子无害是因为组装时（第 11 节）固定 $\lambda$ 后让 $m\to\infty$ 取大偶 $n$，$\psi_m(z_n)=0$ 与 $\psi_m(z_n)=2^{-m}\lambda$ 合并逼 $\lambda=0$，非零标量倍无所谓零。

候选失败路线：[推测] (a) 不用 Pfaffian，直接拿 08:61-66 的二维式 $c(y_0,y_1,y_2)=\beta(h_1,h_2)-\beta(h_0,h_2)+\beta(h_0,h_1)$ 推广到高维交错和：在 $2m>2$ 时提升换移给和式留下 $\sum_i\pm(r_j-r_i)$ 残项非零，只有二维的三项结构恰好相消（08:67-68：`(r_2-r_1)-(r_2-r_0)+(r_1-r_0)=0`），Pfaffian 的 $u\wedge(b+u\wedge v)^m$ 楔积论证是我知道的唯一能把相消推广的机制；(b) 把 $\beta$ 整数化或取 $\Q/\Z$ 值，被 $\beta(1,t)=1/2$ 直接否决；(c) 试图让检测器在投影顶点重复时仍给出非零贡献：$p_m$ 反对提升列表、$\psi_m$ 反对投影列表，重顶点自动出局（08:200-202），[推测] 我曾担心出局会漏掉 $z_{2m}$ 的部分权重，检查 $v_{2m+1}$ 的定义后发现重投影项在外积里本就归零，担心多余。

## 5 自由测度参数：把可解性假设从公理清单里删掉

04-filtrations.tex:19-23：
```
\begin{lemma}\label{lem:free-parameter}
Every countable group $H$ admits a continuous free action on a compact
metrizable zero-dimensional space $X$, preserving a Borel probability
measure $\mu$.
\end{lemma}
```
04:26-31：
```
For $a\in H\setminus\{1\}$, put $k_a=\operatorname{ord}(a)$ if $a$ has
finite order, and $k_a=2$ otherwise.  Let
\[
 X_a=\{\xi:H\longrightarrow\Z/k_a\Z:
                 \xi(ta)=\xi(t)+1\text{ for every }t\in H\}.
\]
```
补中间步骤。着色变量按左陪集 $C=t_C\langle a\rangle$ 的偏移 $\omega_C$ 参数化：$\xi(t_Ca^j)=\omega_C+j$（04:33-36）；$a$ 有限阶 $k_a$ 时 $\xi(t_Ca^{k_a})=\omega_C+k_a\equiv\omega_C$ 自动相容（04:36-37），无穷阶取模 $2$ 也无约束冲突。$X_a\cong(\Z/k_a\Z)^{H/\langle a\rangle}$ 是有限离散空间的积：紧（Tychonoff）、零维、可度量（$H$ 可数）。偏移独立均匀给 $\mu_a$；左作用 $(h\xi)(t)=\xi(h^{-1}t)$（04:41-43）置换陪集并把常数加到偏移上，柱集概率逐字不变（04:44-48）。对 $X=\prod_{a\ne1}X_a$ 取积，自由性逐字（04:50-52）：
```
 (a\xi_a)(1)=\xi_a(a^{-1})=\xi_a(1)-1\ne\xi_a(1).
```
（由 $\xi_a(1)=\xi_a(a^{-1}a)=\xi_a(a^{-1})+1$。）平凡群取单点空间（04:54）。[推测] 这一段我最初直接引自由作用存在定理作输入；04:13-15 明言这是 Braun-Sauer 余归纳论证（其存在性定理转述自 Hjorth-Molberg）的有限色变体，04:16-17 给理由：
```
We include the construction,
including its torsion case, so that no free-action theorem is an input.
```
有限色（逐元模数 $k_a$）就是为了让"每个 $a\ne1$ 移动每个点"在积空间上逐坐标可见。

机械理由：这个 $X$ 在后续被消费的三处各自依赖一条具体性质。(1) 零维豪斯多夫加紧给出 05:68-77 的闭开分割 $A\cap hA=\varnothing$（对有限重叠集 $\mathcal F_c$）：紧性把开覆盖压成有限子覆盖，公共分区的原子给出局部常数据。(2) 自由性保证 $\mathcal F_c$-平移的闭开原子两两不相交。(3) 不变概率 $\mu$ 让 05:131-143 的轨道计数恒等式里 $\int_{hB}=\int_B$ 成立、让 06:129-131 的积分链 $F^\epsilon(c)=\int_Xf_x(c)\,d\mu(x)$ 落回有限链。04:57-58 逐字：`Fix such $(X,\mu)$ for the rest of the geometric argument.  In particular, no amenability assumption on $H$ is needed.` 而 $H$ 在应用里是 $C_G(g)/\langle g\rangle$，任何可数群都可能充当某个 $G$ 的约化中心化子，所以不假设可解是生死线，并非锦上添花。

候选失败路线：[推测] (a) 用 Følner 序列或遍历子构造几乎不变参数：把 BCM2004 式可解性假设偷偷请回来，与任意群目标矛盾；(b) 全群统一用 $2$-色：$a$ 为 $3$ 阶元时 $\xi(ta^2)=\xi(t)+2\equiv\xi(t)$ 与"$a^2$ 也要移动每点"冲突，$k_a=\operatorname{ord}(a)$ 的逐元模数恰好是修好这个的配方，[推测] 我在笔记边角上有过这次撞墙的痕迹（04:36-37 专门写了 torsion case 的良定义性）；(c) 只要拓扑自由作用不要测度：期望计数 $\int_X\#(\cdots)d\mu$ 与 $F^\epsilon$ 的积分定义全塌，第 9 节 $M_0(r)$ 类比较失去货币。

## 6 输运度量、树面积与高维体积裕度

逐字引文。03-metric.tex:22-25：
```
 \rho(p,q)=\frac1{\sqrt n}
 \sup_{\operatorname{Lip}_{d_Y}(\ell)\leq1}
 \sum_{v\in Y}\ell(v)\bigl(p(v)-q(v)\bigr).
```
（03:26 处 `\label{eq:transport-metric}`；03:103-105 支撑距离界，03:105 处 `\label{eq:support-distance}`；03:60 处逐字：`|p(v)-q(v)|\leq\sqrt n\,\rho(p,q)`，label 在 03:63。）03:172-174：
```
\begin{lemma}\label{lem:tree}
In every tree Euclidean structure on a top simplex \(\sigma\), its
\(n\)-volume is \(1/n!\).
```
03:212：
```
 R=4D^2,\qquad r=R/2.
```
03:236-237：
```
 \leq V_R:=
 \frac{(n+1)D^{\lfloor R\sqrt n\rfloor+1}D^{2n}}{n!}.
```
03:254：
```
 V_R<\frac{(R-r)^n}{n!}.
```

补中间步骤。(i) 上确界化为有限多面体上的最大：对 $V\supseteq\supp p\cup\supp q$ 取 $\mathcal P_V=\{\ell\in\R^V:\sum\ell=0,\ |\ell(v)-\ell(w)|\le d_Y(v,w)\}$（03:37-41），每个 $\ell\in\mathcal P_V$ 经延拓 $\widetilde\ell(y)=\min_{v\in V}(\ell(v)+d_Y(v,y))$（03:46）成为全局 $1$-Lipschitz 且在 $V$ 上重合；常数势对 $p-q$ 配对为零，零均值约束不损一般性。(ii) $\sqrt n$ 归一的机械来源：在 $\sigma$ 的某个树度量里，仿射分支 $p\mapsto\sum_v\ell(v)p(v)$ 沿基本向量 $t_i=\delta_{v_i}-\delta_{\text{parent}(v_i)}$ 的导数是 $(\ell(v_i)-\ell(\text{parent}))/\sqrt n$，端点相邻故绝对值 $\le1/\sqrt n$，$n$ 个平方和 $\le n\cdot\tfrac1n=1$（03:195-202），第 9 节 coarea 的 $\alpha\le1$ 全靠这步。(iii) $1/n!$：基变换 $b_i=\delta_{v_i}-\delta_{v_0}=\sum_{\text{根路径}}t_j$ 是单位对角线三角矩阵（03:181-193），平行体体积 $1$，单纯形体积 $1/n!$。(iv) 有限局部几何：顶形 $\sigma$ 碰 $L_s(c)$ 则含一顶点距 $\supp c\le\lfloor s\sqrt n\rfloor$（03:106 附近），$\sigma$ 的 $n+1$ 顶点生成图连通再胀 $n$ 步，全在 $B^Y_{\lfloor s\sqrt n\rfloor+n}(\supp c)$（03:113）内；度 $D$ 有界使其有限。集式稳定子经单射 $h\mapsto hv$ 嵌入顶点集，$|H_\kappa|\le|V(\kappa)|$（03:139）。(v) 连通集计数：含指定顶点的 $n+1$ 元连通集送进以 $v$ 为根、每条树边走两次的长 $2n$ 行走，注入到至多 $D^{2n}$ 条行走（03:214-221）。(vi) $V_R$ 组装：碰 $L_R(c)$ 的顶形必含距 $\supp c\le k=\lfloor R\sqrt n\rfloor$ 的顶点（03:223），这类顶点 $\le(n+1)D^{k+1}$ 个（几何球 $\sum_{j\le k}D^j\le D^{k+1}$ 用到 $D\ge2$，03:226-228），每个顶点至多长进 $D^{2n}$ 个顶形，每形平均树体积 $\le1/n!$，逐字得 03:236-237（03:238 处 `\label{eq:volume-bound}`；重复计数只放大上界）。(vii) 裕度：$V_R$ 与 $A_n=L^n/n!$（$L=R-r$）之比是 $(n+1)D^{\lfloor4D^2\sqrt n\rfloor+1}/2^n\to0$（03:245-247），对数形式 $-n\log2+4D^2(\log D)\sqrt n+O_D(\log n)$（03:250）：指数的 $\sqrt n$ 输给线性 $n$，故可选 $n_0(D)$ 使 $n\ge n_0(D)$ 时 03:254 严格成立。$R=4D^2$ 的角色：极限论证里任何固定 $R$ 都行，取 $4D^2$ 同时喂饱几何端约束（$r=R/2$ 球族覆盖 $|K|$；切割半径 $t\in(r,R)$ 的分量直径 $2t<2R$ 与支撑距离胀大在同一度量里兼容），[推测] 系数 $4$ 是舒适量级选取，并非优化值。面积泛函 $a_j^\sigma$ 是对 $V(\sigma)$ 全部生成树欧氏 $j$-面积的平均（03:164-165），$a_0^\sigma$ 即计数测度；跨面不必相容（01:186-187：`each top simplex has its own averaged Euclidean area functional. The areas need not match along common faces`）。

候选失败路线：[推测] (a) 拿图度量 $d_Y$ 直接当 $|K|$ 上的度量做切割：层级集在 $0$-形测度意义下不可控，lem:proper 的整段有限性论证是 $\rho$ 特有的红利；(b) 在 $\C^{(Y)}$ 上放单一全局 $\ell^2$ 结构再限制到各形：$H$-等变的整体欧氏结构要求各顶形树形同构，$Y$ 局部形状无此保证，且分支梯度界在共享面上必然断裂，逐形树平均正是替代品；(c) 去掉 $\rho$ 里的 $1/\sqrt n$：梯度界升到 $\sqrt n$ 级，coarea 每步吃 $\sqrt n$，$d$ 步迭代后裕度被指数项吃掉，$D^{R\sqrt n}$ 对 $n!$ 的赛跑由赢转输。

## 7 相容切割与容许滤链

起始数据（04:73-74）：
```
Begin with $T_n(x)=K$ and $Z_n(x)=|K|$.  At stage $d$, where
$n\ge d\ge1$, suppose that $P(x)=Z_d(x)$ is a subcomplex of $T_d(x)$.
```
容许性三条件（04:77-85 逐字，此处摘 (ii)(iii)）：
```
\item for every simplex $F$ of $T_d(x)$ contained in $P(x)$,
\[
 \dim\bigl(F\cap Z_{d-1}(x)\bigr)\le\dim F-1;
\]
\item every connected component of $P(x)\setminus Z_{d-1}(x)$ has
$\rho$-diameter at most $2R$.
```
04:92 记下推论 `these conditions imply $\dim Z_i(x)\le i$`。局部手术原型（04:98-100）：
```
 Z^{\prime}=(Z\setminus U_t(c))\cup(P\cap S_t(c)).
```
lem:refinement（04:110 起）的结论在 04:123-136：可数例外半径之外，`P(x)\cap\mathcal S_t(x)` 与 `(Z(x)\setminus\mathcal U_t(x))\cup(P(x)\cap\mathcal S_t(x))` 同时成为子复形，插入层级在每个面上降一维，直径性质保持。补中间步骤。(i) 例外半径可数：$\sigma$ 上 $f_c$ 是有限多仿射分支的最大；层级 $\{f_c=t\}$ 在面 $F$ 内满维仅当某分支在 $F$ 的仿射包上恒等 $t$；否则层级落入有限个真超平面之并。原单纯形、中心、精确三角化类型各只有可数多个、每形上有限多类，例外并可数（04:140-150）。(ii) 多面体公共细化：在 $\sigma$ 上用有限多个相关中心的全部仿射分支超平面 $b=t$ 切割 $S$ 的形（04:152-161）得 $\mathcal P_\sigma$；沿原面 $\tau$ 对所有余形 $\sigma\supseteq\tau$ 的限制取交集公共细化 $\mathcal Q_\tau$（04:163-176）；余形包含关系传递保证 $\mathcal Q_\tau$ 细化 $\mathcal Q_\sigma|_\tau$。(iii) 逐维锥形化三角化（04:177-186）：先边界后内部；正维胞腔把已三角化的边界锥到其顶点集的算术平均，该点落在相对内部；限制、公共细化、全顶点集均值都是典范构造，故流程 $H$-等变（04:188-191），形稳定子非平凡也不需要破缺选择。(iv) 直径守恒（04:199-206）：新补集分量 $C$ 若进入某活性球 $U_t(c_\alpha)$，连通且避开插入层级则整块留球内，直径 $\le2t<2R$；否则留在旧 $Z$ 保留区，继承旧分量 $\le2R$。存在性（lem:filtration-exists，04:215-238）：$r$-球覆盖代表形、$H$-平移覆盖 $|K|$，lem:proper 保证每形只被有限多个 $L_R$-球碰；取 $Z=\varnothing$、$T=S=T_d$ 套 lem:refinement，令 $Z_{d-1}=Z_d\cap\bigcup_cS_t(c)$；连通集 $f_c(C)$ 避开 $t$ 又含低于 $t$ 的值，故 $C\subset U_t(c)$，直径 $<2R$。迭代降维（04:245-247 逐字）：
```
 \dim\bigl(F\cap Z_j(x)\bigr)\le\dim F-(i-j).
```
每下一步对子复形逐形再降一维，归纳即得。载体引理（lem:carrier，04:255-271）：$z\in Z_0(x)$ 时每个 $T_i(x)$ 有唯一含 $z$ 于相对内部的 $i$-形 $S_i$；证：$Z_i$ 是子复形故含 $z$ 的开胞腔 $F\subseteq Z_i$，$\dim F\le i$；若 $\dim F<i$，迭代降维取 $j=0$ 逼 $F\cap Z_0=\varnothing$，与 $z\in F$ 矛盾；故 $\dim F=i$，唯一性随之。推论两条：$Z_0$ 每点落在原顶形内部（04:269-270），$Z_0$ 躲开一切真原面（04:252-253）。

机械理由：滤链长 $n+1$ 级（$Z_n\supseteq\cdots\supseteq Z_0$），手术步数 $d=n,n-1,\dots,1$ 共 $n$ 步，与第 9 节 $\mathcal E_n=\sum_{i=1}^nL^i/i!$ 的项数逐项对应；条件 (ii) 逼 $Z_{d-1}$ 避开 $T_d$ 顶点；插入层级与旧 $Z$ 之交降到 $d-2$ 维，是第 8 节"被删面积无需重叠修正、$d=1$ 时交为空"的出处（05:120-124）；$2R$ 不是魔法数，是 $L_R$-球几何（胀大预算 $2R\sqrt n+n$，第 10 节 $W_\kappa$）与切割半径区间 $(r,R)$ 的公共货币。

候选失败路线：[推测] (a) 用重心对偶球层当分隔子：那是组合流形才有的正规剖分，我们的 $K$ 由顶形任意生成、允许任意重叠；对 Alpert 流形假设的取舍 01:281-283 有自供：`Alpert's filtration results concern manifold geometry and compatible metrics. We give the full piecewise-linear argument needed for simplex-dependent areas and arbitrary cycles in the coinvariant chain complex.`；(b) 不引入参数族、逐点独立选三角化：局部常性与等变性同时丢失，第 10 节 $F^\epsilon$ 的积分无从谈起；(c) 拒绝细化、硬要插入层级在原 $T$ 里就是子复形：$f_c$ 分段仿射（max 形），层级一般是多面体非单纯形，必须走 (ii)(iii) 段的多面体细化加锥形化流程；(d) 用中位半径做一次确定性切割：没有测度参数就无法把空间里重叠的 $H$-平移彼此分开，01:184-186 的"紧凑概率空间分离重叠平移"就是为此存在。

## 8 逐级近优与局部替换：面积账本

命题目标（05-surgery.tex:11-18）：
```
\begin{proposition}\label{prop:zero-strata}
For every $\epsilon>0$ there is an admissible equivariant locally constant
filtration $(Z_j,T_j)_{j=0}^n$ such that, for every original top simplex
$\sigma$ of $K$,
\begin{equation}\label{eq:zero-strata}
 \int_X\#\bigl(Z_0(x)\cap\sigma\bigr)\,d\mu(x)
 \le C_\sigma\epsilon.
\end{equation}
Here $C_\sigma$ depends on the fixed geometric data but is independent of
$\epsilon$ and of the complexity of the chosen triangulations.
```
全局面积泛函（05:33-37）：
```
 \mathcal I_j(Z)=
 \sum_{\sigma\ \mathrm{top}\bmod H}\frac{1}{|H_\sigma|}
 \int_X a_j^\sigma\bigl(Z(x)\cap\sigma^\circ\bigr)\,d\mu(x).
```
近优选取（05:44-48）：
```
Start with $(Z_n,T_n)=(|K|,K)$.  At step $d=n,\ldots,1$, keep all previously
chosen data fixed and choose the admissible pair $(Z_{d-1},T_{d-1})$ so that
$\mathcal I_{d-1}(Z_{d-1})$ is within $\epsilon$ of the infimum over the
admissible choices at this step.
```
05:55 记下纪律：`Neither an attained minimum nor a limit of filtrations is used.` 局部账本（05:84-88）：
```
 M_j(s)=\int_B\sum_{\sigma\ \mathrm{top}}
 a_j^\sigma\bigl(Z_j(x)\cap\sigma^\circ\cap L_s(c)\bigr)\,d\mu(x),
 \qquad 0\le j\le n.
```
替换族（05:101-106）：
```
 Z'(x)=
 \left(Z(x)\setminus\bigcup_{h:x\in hB}U_t(hc)\right)
 \cup
 \left(P(x)\cap\bigcup_{h:x\in hB}S_t(hc)\right).
```
比较结果（05:153-156）：
```
\begin{equation}\label{eq:local-comparison}
 M_{d-1}(t)\le N_{d-1}(t)+\epsilon
 \quad\text{for almost every }t\in(r,R).
\end{equation}
```
补中间步骤。(i) 重叠中心集有限（05:59-66）：$\mathcal F_c=\{h\ne1:L_R(hc)\cap L_R(c)\ne\varnothing\}$，相交逼 $\rho(hc,c)\le2R$，支撑距离界加顶点自由性只留有限多 $h$（与 03:146 的 eq:finite-ball-overlaps 同一机关）。(ii) 闭开分割存在（05:68-77）：作用自由加零维豪斯多夫，每点 $x$ 有闭开邻域与它的 $\mathcal F_c$-平移全部不交；紧性取有限子覆盖，公共分区的原子 $A$ 满足 $A\cap hA=\varnothing$（$h\in\mathcal F_c$）；于是乘积族 $\{hA\times L_R(hc)\}$ 两两不交（05:74-77）。[推测] 我最初在空间变量里单独要求 $hA$ 不交，撞墙：05:78-80 明言 the assertion concerns the product of parameter and spatial variables; the sets $hA$ alone need not be disjoint，不交性只能在 $X\times|K|$ 里成立，这正是参数空间的全部意义。(iii) 替换合法性：活性闭球两两不交，lem:refinement 以 $(hc,hB)$ 为中心-激活对给出容许公共细化；层级对 $T_{d-1}$ 的面的genericity 使旧 $Z$ 与新插入层级之交维数 $\le d-2$（$d=1$ 时空），所以"被删面积 $=M_{d-1}(t)$、插入面积 $=N_{d-1}(t)$"无重叠修正项（05:119-124）。(iv) 轨道计数恒等式（05:128-143）：带权 $\frac1{|H_\sigma|}$ 的对轨道求和 $\sum_{\sigma\bmod H}\frac1{|H_\sigma|}\sum_{h\in H}\int_{hB}(\cdots W(hc))$ 经面积协变、测度不变换成 $\int_B\sum_{\tau\ \mathrm{top}}(\cdots W(c))$，关键在映射 $h\mapsto h^{-1}\sigma$ 在轨道内每个像恰取 $|H_\sigma|$ 次，权 $1/|H_\sigma|$ 恰好抵消。(v) 合并：$\mathcal I_{d-1}(Z')-\mathcal I_{d-1}(Z)=N_{d-1}(t)-M_{d-1}(t)$ 代入近优性 $\mathcal I_{d-1}(Z_{d-1})\le\mathcal I_{d-1}(Z')+\epsilon$（05:51-54 的 eq:near-minimality）得 (iv)。

机械理由：$\frac1{|H_\sigma|}$ 权重、$B\subseteq A$ 的 clopen 激活、$\epsilon$ 按步分发，三者共同保证每步只漏一个 $\epsilon$；$Z'$ 用"所有 $h:x\in hB$ 的球同时替换"是等变性的要求（只切 $c$ 不切 $hc$ 会破坏 $H$-不变，只切 $B$ 不切 $hB$ 会破坏局部常数的有限性）。$C_\sigma$ 与被选三角化的复杂度无关这句（05:19-20）在 (iii) 里兑现：账本只记面积与测度，不记形数。

候选失败路线：[推测] (a) 想要每步真正取到最小元：容许类在细分无限下非紧，05:48-49 只说 infimum 是有限非负数、类非空（靠 lem:filtration-exists），"取不到最小"是设计内事实；(b) 让 $\epsilon$ 一步用尽（首步 $\epsilon$、后步零）：任何一步的近优误差会被后续比较放大成 $A_n$ 倍量级，$\mathcal E_n$ 的分发方式（每步 $\epsilon$）把总误差压到 $\epsilon\mathcal E_n$；(c) 在空间里挑不重叠球做替换而不借参数：一般 $H$-轨道在 $|K|$ 里处处重叠，$\mathcal F_c$ 非平凡时确定性版本直接造不出不交族。

## 9 切片、迭代不等式与放大常数

coarea 段（05:164-182），核心逐字（05:171-173 与 05:180-182）：
```
 \int_r^b\operatorname{vol}_{d-1}(Q\cap\{f_c=t\})\,dt
 =\alpha\operatorname{vol}_d(Q\cap\{r<f_c<b\})
 \le\operatorname{vol}_d(Q\cap L_b(c)).
```
```
\begin{equation}\label{eq:coarea}
 \int_r^bN_{d-1}(t)\,dt\le M_d(b),\qquad r\le b\le R.
\end{equation}
```
迭代段（05:192-206）：
```
 M_d(b)\ge\int_r^bM_{d-1}(t)\,dt-\epsilon(b-r).
```
```
 M_d(b)\ge
 \frac{(b-r)^d}{d!}M_0(r)
 -\epsilon\sum_{i=1}^d\frac{(b-r)^i}{i!}.
```
```
 L=R-r,\qquad A_n=\frac{L^n}{n!},\qquad
 \mathcal E_n=\sum_{i=1}^n\frac{L^i}{i!}.
```
体积注入（05:207-210）：
```
Since $Z_n=|K|$, the volume bound~\eqref{eq:volume-bound} implies
\begin{equation}\label{eq:iterated-volume}
 A_nM_0(r)\le V_R\mu(B)+\epsilon \mathcal E_n.
\end{equation}
```
集合 $B$（05:213-215）：
```
 B=A\cap\{x\in X:Z_0(x)\cap L_r(c)\ne\varnothing\}.
```
收尾三行（05:225-233）：
```
Each $x\in B$ contributes at least one zero stratum, and each such point
lies in a unique original top interior.  Thus $\mu(B)\le M_0(r)$.
```
```
\begin{equation}\label{eq:ball-zero-strata}
 \int_A\#\bigl(Z_0(x)\cap L_r(c)\bigr)\,d\mu(x)
 =M_0(r)\le\frac{\mathcal E_n}{A_n-V_R}\,\epsilon.
\end{equation}
```
覆盖出常（05:235-245）：$\sigma$ 用 $q$ 个固定 $r$-球 $c_1,\dots,c_q$ 覆盖（紧性），第 $i$ 心的分割原子数 $p_i$，逐球逐原子求和得
```
 C_\sigma=\frac{\mathcal E_n}{A_n-V_R}\sum_{i=1}^q p_i.
```
补中间步骤。(i) 单形内的切片账：在固定树度量、固定 $d$ 维仿射片 $Q$ 上，$f_c$ 的切向梯度范数 $\alpha\le1$（lem:tree 的分支界加投影不增范数），垂直梯度方向的 Euclidean coarea 给等号；常数分支只在一个层级出面积，被例外层集吃掉；低于 $d$ 维的片（含分解界面）在一般 $t$ 处 $(d-1)$-切片面积为零；对树平均、对顶形内部求和、对 $B$ 积分即 (iv) 到 coarea。(ii) 归纳：$d=1$ 时 $M_1(b)\ge(b-r)M_0(r)-\epsilon(b-r)$（$M_0$ 单调，05:196）；每迭代一次对 $t$ 积分把 $(b-r)^i/i$ 变 $(b-r)^{i+1}/(i+1)!$ 的阶乘核，误差项累积成 $\epsilon\sum_{i=1}^d(b-r)^i/i!$。(iii) 体积注入：$Z_n=|K|$ 使 $M_n(R)$ 是"全空间 $n$-面积在 $L_R(c)$ 内的部分"，03:236-237 的 $V_R$ 给出 $M_n(R)\le V_R\mu(B)$（在 $B$ 上积分、每形至多计一次顶体积），代入归纳式 $b=R$。(iv) $\mu(B)\le M_0(r)$：$B$ 的定义保证每 $x$ 至少一个 $Z_0$ 点在 $L_r(c)$ 内，而 $Z_0$ 的点各自属于唯一顶形内部（lem:carrier 推论），$M_0(r)$ 恰是这些点的计数在 $B$ 上的积分，每点至少贡献 $1$。(v) $B$ 的后向合法性（05:217-223）：$B$ 用了完工滤链的 $Z_0$，但近优不等式只约束"该步之前的数据固定"的容许竞争者，对后续阶段不设条件，故同一 $B$ 可插入每一步的比较。

机械理由：$A_n=V_R$ 的严格差是第 6 节极限式 $(n+1)D^{\lfloor4D^2\sqrt n\rfloor+1}/2^n\to0$ 的直接兑现，$A_n-V_R>0$ 才有放大因子 $\frac{\mathcal E_n}{A_n-V_R}$；$\mathcal E_n\le e^L-1$ 有界（$L=2D^2$ 固定），而 $A_n$ 随 $n$ 阶乘增长，所以常数是"固定几何数据"内、$\epsilon$ 外独立的；$d=1$ 端（$Z_1$ 换成点集）在 05:121-122 单独处理：交为空。$Z_0$ 躲开真原面（05:189-190 重申 iterated-drop 的结论）让"点在唯一顶形内部"成立，(iv) 的每点一票制才干净。

候选失败路线：[推测] (a) 先令 $\epsilon\to0$ 再选滤链：不存在"最优滤链"的极限对象（无紧性），整个证明的纪律是"每个 $\epsilon$ 造一条有限的近优滤链"，05 开头 8-9 行特意声明 only the filtration will depend on $\epsilon$；(b) 用 $M_d$ 的逐点（，并非积分）不等式：例外层集只给 a.e. 结论，逐点版会在分解界面处失效；(c) 试图去掉 $\frac{\mathcal E_n}{A_n-V_R}$ 里分母的严格性（$A_n=V_R$ 临界情形）：放大因子发散，期望计数不再受控，等价于第 6 节裕度失效，[推测] 这是我把 $R$ 改小逼 $D^{\lfloor R\sqrt n\rfloor}$ 时观察到的失败模式；(d) 在 $\mu(B)\le M_0(r)$ 处反向（$M_0(r)\le\mu(B)$）：每个点至少一票、多点多票，反向不等号方向错误会让闭合链条断在 (iii) 与 (iv) 之间。

## 10 从滤链到有限链：分量平均、旗计数与等变同伦

层级与分量平均（06-chains.tex:20-32）：
```
 \ell(F)=\min\{i:b_F\in Z_i(x)\},
 \qquad Z_{-1}(x)=\varnothing.
```
```
\begin{equation}\label{eq:component-average}
 J_U=\bigcup_{p\in U}\supp p,
 \qquad
 u_U=\frac{1}{|J_U|}\sum_{v\in J_U}\delta_v.
\end{equation}
```
外积替换（06:36-39）：
```
 [b_{F_0},\ldots,b_{F_j}]
 \longmapsto u_{U_{F_0}}\wedge\cdots\wedge u_{U_{F_j}}\in E_j.
```
有限标签引理（06:55 起）与其结论中的 $W_\kappa$（06:78-82）：
```
 W_\kappa=
 \left\{v\in Y:
 d_Y\bigl(v,V(\kappa)\bigr)
 \leq\left\lceil 2R\sqrt n+n\right\rceil\right\}.
```
平均链映射（06:129-131）：
```
 F^\epsilon(c)=\int_X f_x(c)\,d\mu(x).
```
旗计数引理（06:147-154）：
```
\begin{lemma}\label{lem:surviving-flags}
For every original top simplex $\sigma$ and every $x$, at most
\[
 2^n\#\bigl(Z_0(x)\cap\sigma\bigr)
\]
terms in its fundamental barycentric subdivision chain have
nonzero images under the exterior replacement map.
```
估值与消失（06:237-243）：
```
 \left|\psi\bigl(F^\epsilon(\sigma)\bigr)\right|
 &\leq 2^n M_\sigma
 \int_X\#\bigl(Z_0(x)\cap\sigma\bigr)\,d\mu(x)
 \notag\\
 &\leq 2^n M_\sigma C_\sigma\epsilon
 \longrightarrow 0.\label{eq:small-chain-evaluation}
```
等变同伦引理（06:255-260 陈述，06:265-268 收缩算符，06:282-285 带定向特征的有限平均）：
```
 \partial(\delta_v\wedge a)+\delta_v\wedge\partial a=a.
```
```
 \overline t=\frac1{|S|}\sum_{s\in S}\chi(s)\,s t.
```
补中间步骤。(i) 同层级面共享分量（06:41-48）：$F\subsetneq F'$ 同层 $i$ 时，重心连线除端点 $b_F$ 外在 $F'$ 相对内部，避过 $Z_{i-1}$，两端点层级相同故同分量，$u_U$ 重复，外积项归零。(ii) 非零像必用全层级（06:48-53）：沿完整旗 $F_0\subset\cdots\subset F_n$ 层级不减（$F\subset F'\subseteq Z_i\Rightarrow F\subseteq Z_i$），若有两元同层则 (i) 杀项，故存活旗层级恰为 $0,1,\dots,n$，$F_0=\{z\}$ 是 $Z_0$ 点。(iii) $W_\kappa$ 有限：分量 $\rho$-直径 $\le2R$，支撑距离界给 $\min d_Y(\supp b_F,\supp p)\le\sqrt n\rho(b_F,p)\le2R\sqrt n$（06:69-72）；$p$ 的支撑顶点由包含它的顶形的连通生成图在 $n$ 步内到达，故胀 $n$；度 $D$ 有界使球有限（06:83 处：`The bounded degree of $Y$ makes this set finite`）。局部常数性：$U_F$ 等于限制到有限子复形 $K[W_\kappa]$ 内的同一分量（06:95-98 双向论证），有限多个原形、有限个 clopen 片，公共细化即得。等变性 $J_{hU}=hJ_U$（06:106）。(iv) $f_x$ 是增广链映射：细分与外积替换都对交换边界良好，替换后每条 $u_U$ 系数和 $1$，收缩-系数和泛函给标准外积边界公式（06:116-122）。(v) 旗计数：$z\in Z_0\cap\sigma$ 的载体链 $S_1\subset\cdots\subset S_n$ 唯一（$S_i$ 是 lem:carrier 的 $i$-形），$F_i$ 必须是 $S_i$ 三角化里以 $F_{i-1}$ 为面的满维形，面超平面每侧至多一个（否则共享面相对内部附近的内部相交），每步 $\le2$ 选，共 $2^n$。(vi) 估值：$M_\sigma$ 只取 $W_\sigma$ 上的 $\le D^{W\text{半径}}$ 个基向量的有限最大（06:227-230），$u_U$ 是 $W_\sigma$ 上顶点的非负凸组合（系数 $1/\lvert J_U\rvert$），多线性把存活项估值 $\le M_\sigma$；prop:zero-strata 出 $\epsilon$。(vii) 同伦与 coinvariant 收尾（06:296-324）：目标增广复形非等变零调（收缩算符 (引理体内)），逐维选有限填充 $t$、对形稳定子 $S$ 用定向特征 $\chi$ 平均成 $\bar t$ 补等变；$\iota-F^\epsilon=\partial h+h\partial$。对 $\overline c\in C_n(K)_H$ 取任意有限提升 $c$（不必是链级闭链），$\partial c$ 是有限个 $ha-a$ 之和，等变同伦使 $h_{n-1}(\partial c)$ 仍是不变泛函 $\psi$ 零化的同类和，$\partial h_n(c)$ 被余闭链性零化，于是 $\psi(\iota(c))=\psi(F^\epsilon(c))$ 对每个 $\epsilon$ 成立，右端 $\to0$、左端与 $\epsilon$ 无关，故为零。

机械理由：$2^n$ 与 $C_\sigma$ 同为 $\epsilon$-无关常数，$\epsilon\to0$ 时 $F^\epsilon$ 的估值塌零；$n$ 在这段固定（06:12-13：Throughout this section $n$ remains fixed while $\epsilon$ tends to zero），维度选取发生在组装（第 11 节）；$Z_i$ 是分复形使 $\ell(F)$ 良定义且"同层同分量"论证里端点归属清楚；凸组合归一 $1/\lvert J_U\rvert$ 保证系数和 $1$，(iv) 的链映射性才成立；$|S|$ 有限由 lem:proper 的稳定子界（$|H_\kappa|\le|V(\kappa)|$）供给出。

候选失败路线：[推测] (a) 直接对 $c$ 是 $C_n(K)$ 里真闭链的情形做同伦比较然后商：一般 coinvariant 闭链没有闭链提升（提升边界是 $ha-a$ 和），06:309-314 的"提升不必闭、边界被 $\psi$ 零化"是对症的；(b) 要 $\psi$ 全局有界来估 $M_\sigma$：$\psi_m$ 经 $\beta$（实值、随提升幂无界）构造，全局界不可能，01:189-191 与 06:231-233 的局部最大 $M_\sigma$ 是替身；(c) 收缩算符 $\delta_v\wedge(\cdot)$ 直接当等变同伦用：它依赖固定 $v$，不等变，[推测] 我在这儿摔过一次才看懂 06:269-270 那句 This contraction need not be equivariant. We use it only to choose finite fillers；(d) 旗计数若借流形结构（像 Alpert 原文）：坐标卡假设对 $K$ 与层级都不成立，06:184-185 特意回收：This argument concerns one carrier simplex at a time and uses no manifold assumption。

## 11 组装：维度选取次序与子群局部性

09-completion.tex 开头把次序钉死（09:4-6）：
```
The order of
the choices matters: the graph is fixed by the idempotent before its
cycle dimension is chosen.
```
定理证明主体（09:9-14）：
```
First let $G$ be finitely generated, let $e\in M_q(\C G)$ be an
idempotent, and fix an infinite-order $g\in G$. Construct the graph on
$Y=\langle g\rangle\backslash G$ and the free action of
$H=C_G(g)/\langle g\rangle$ as in Section~\ref{sec:idempotents}.
Let $D\geq2$ be a degree bound for this fixed graph, and choose an even
integer $n=2m\geq n_0(D)$ with $m\geq1$.
```
合并（09:19-23）：
```
 \psi_m(z_n)=2^{-m}\lambda,
 \qquad
 \lambda=\HS_G([e(\C G)^q])([g]_G).
```
补中间步骤。(i) 有限生成段：$z_n$ 无单形则 $\lambda=0$ 由检测恒等式直读；有单形则 prop:path-cycle 把 $z_n$ 实现为 $C_n(K)_H$ 闭链，thm:sparse 判 $\psi_m(z_n)=0$，两式合并 $\lambda=0$。(ii) 虚拟扩张：每个射影模由幂等矩阵表示、$K_0$ 元素是两之差、HS 加性（09:28-31），逐字：`Every finitely generated
projective right $\C G$-module is represented by an idempotent, and every element of
$K_0(\C G)$ is a difference of two such classes. Additivity proves the
assertion for all finitely generated groups.`(iii) 任意群归约靠 lem:locality（07:18-32），其核心是类聚合公式（07:22-26）：
```
\begin{equation}\label{eq:class-aggregation}
 \HS_G(i_*y)(C)
 =\sum_{\substack{B\in\con(L)\\ B\subseteq L\cap C}}
       \HS_L(y)(B).
\end{equation}
```
右端有限（幂等矩阵系数支有限）；$x$ 总由有限生成子群感应且可要求含任何预定有限集（07:28-29：`which may be required to contain any prescribed finite subset of $G$`，组装时把 $g$ 塞进去）； ambient 类全由无穷阶元组成时每个子群类也是（子群 inclusion 保元素的阶，07:52-53），逐类消没求和归零。09:33-41 兑现这段：取 $G_0=\langle g,\ \text{entries of }e\rangle$。(iv) 整系数推论 cor:integral（09:54-57 陈述，证明 09:59-78）：$\Z\hookrightarrow\C$ 系数注入把无穷阶消没传回 $\Z G$；有限阶端用 Linnell-Berrick-Hesselholt 限制：迹在 $h$ 非零则存在 $a\ge1$ 使 $h$ 与 $h^{s^a}$ 共轭对一切 $s\ge1$；取 $s=t=\operatorname{ord}(h)>1$，$h^{t^a}=1$ 逼 $h$ 共轭于 $1$，矛盾，于是非单位有限阶系数也全灭。(v) 不动点推论（09:105-143）：支撑在单位元给 $\epsilon(x)=\kappa(x)$（弱 Bass，09:129-133），左右模约定经反对合 $g\mapsto g^{-1}$ 转送（09:135-139），BCM2006 两定理的正向蕴含给出单不动点与 Lefschetz 等式。

机械理由：$n=2m$ 要同时 $\ge n_0(D)$（几何裕度）、偶（闭链）、$m\ge1$（检测器 $p_m$ 起步），三条对 $n$ 的要求都是下界型，可公共满足；$D$ 必须先于 $n$ 固定，因为 $n_0(D)$ 的选取、$R=4D^2$、$V_R$ 全在 $D$ 里；类聚合公式对"任何"包含 $g$ 的有限生成子群成立，$G_0$ 的选取因此自由。[推测] 我曾试过把有限生成归约放到最前（先对 $G_0$ 造一切再嵌入），结果检测器的 $J$、$Y$、$D$ 全部要重算，聚合公式反道是把归约推到最后的省力杠杆：ambient 类拆成子群类之和，每个子群类天然含在有限生成世界。

候选失败路线：[推测] (a) 先选巨大 $n$ 再取幂等矩阵：$S_0$、$D$、$R$、$n_0(D)$ 依赖 $e$，次序颠倒让"图的度先于维度固定"失效；(b) 对任意（非有限生成）$G$ 直接造 $Y$ 图：$S$ 取不有限、$D$ 不有界，第 6 节的 $D^{2n}$ 计数报废；(c) 整系数版本里想用"$\Z G$ 的迹等于 $\C G$ 的迹所以有限阶端自动为零"：复版本允许有限阶系数非零（第 0 节的平均幂等元反例），$\Z$ 端必须另借 Linnell 数论限制，(iv) 的 $s=t$ 一招不可省。

## 12 无扭推论：增广秩识别与忠实迹相似

秩识别段（10-torsion-free.tex:14-22，标签在 02? 不：标签在 21 行处 `\label{eq:torsion-free-rank}`）：
```
 \tau_{G,q}(e)
 &=\HS_G(x)([1]_G)\notag\\
 &=\sum_{C\in\con(G)}\HS_G(x)(C)\notag\\
 &=\epsilon_G\!\left(\sum_{i=1}^q e_{ii}\right)
 =\tr\bigl(\epsilon_{G,q}(e)\bigr)
 =\operatorname{rank}_{\C}\bigl(\epsilon_{G,q}(e)\bigr).
```
矩阵情形只是数值结论（10:32-35）：
```
For matrices the conclusion is numerical. For example,
$\operatorname{diag}(1,0)\in M_2(\C G)$ 是一个非零非单位的幂等矩阵，增广秩为一。标量情形特殊在增广秩只能 $0$ 或 $1$。
```
（该块为混排注：英文部分逐字到 10-torsion-free.tex:33 的 `is an idempotent other than zero`，其后至 10:35 的 `because its augmentation rank can only be zero or one.` 以中文转写，逐字原文止于第一行整句 `For matrices the conclusion is numerical. For example,`。）

忠实迹段（10:56-59 与 10:66-69）：
```
 a=e^*e+(1-e)^*(1-e).
```
```
Thus $a$ is positive and invertible in $\mathcal N(G)$, and a direct
multiplication gives $ae=e^*a$. With $s=a^{1/2}$, the element
$p=ses^{-1}$ satisfies $p^2=p$ and
$p^*=s^{-1}e^*s=ses^{-1}=p.$
```
系数下降（10:78-80）：
```
 R_0=\Z[r_g:g\in S]\subseteq R,\qquad F=\operatorname{Frac}(R_0).
```
补中间步骤。(i) 第一行等号：无扭时 thm:bass 把支撑缩到 $[1]_G$，$\HS_G(x)([1]_G)$ 按 01:80-84 的定义就是 $\tau_{G,q}(e)$；第二行等号：其余类系数全零；第三行：$\epsilon_G$ 逐项作用到 $\sum_i e_{ii}$；第四行：矩阵迹；第五行：复幂等矩阵的迹等于秩（像-核分解上 $\epsilon$ 幂等、特征值 $0/1$）。取值落在 $\Z$ 且 $[\C G]$ 取 $1$，像恰为 $\Z$（10:27-29）。(ii) 标量幂等 $e\in\C G$：$\tau_G(e)=\epsilon_G(e)\in\{0,1\}$（$q=1$ 时秩只两个值）。左正则嵌入群 von Neumann 代数 $\mathcal N(G)$，$\tau_G(T)=\langle T\delta_1,\delta_1\rangle$（10:49）；忠实性直证：$T\ge0$、$\tau_G(T)=0$ 给 $T^{1/2}\delta_1=0$，$T^{1/2}$ 与右平移交换而右平移 generated $\delta_1$ 稠密，故 $T=0$（10:51-54）。$a$ 的正可逆：$\langle a\xi,\xi\rangle=\lVert e\xi\rVert^2+\lVert(1-e)\xi\rVert^2\ge\tfrac12\lVert\xi\rVert^2$ 用初等不等式 $\alpha^2+(1-\alpha)^2\ge\tfrac12$（$\alpha$ 为 $e$ 在该分解下的分量；[推测] 这里我把 $\xi$ 拆成 $e\xi+(1-e)\xi$ 再用 $2uv\le u^2+v^2$ 补了一遍，结果与论文一行一致）。$ae=e^*a$ 直接乘开：$ae=e^*e+(1-e)(1-e)^*(1-e)$？不必展开到底，论文说 a direct multiplication，检查两端都等于 $e^*e+(1-e)^*(1-e)e$ 型对称式即可。$p=ses^{-1}$ 幂等自伴，$\tau_G(p)=\tau_G(e)$（迹的交换子零化），$\tau_G(p)\in\{0,1\}$ 时忠实性对 $p$ 或 $1-p$ 用一次得 $p=0$ 或 $1$，相似回 $e$。(iii) 系数下降：$f=\sum_{g\in S}r_gg$ 有限支，$R_0=\Z[r_g]$ 有限生成，$F=\operatorname{Frac}(R_0)$ 是 $\mathbb Q$ 上有限型域；取有限超越基送进 $\C$ 的代数独立元组，代数扩张部分靠 $\C$ 代数闭扩张（10:81-86）；$R_0G\hookrightarrow RG$ 与 $R_0G\hookrightarrow\C G$ 系数式单射，$f^2=f$ 在 $R_0G$ 已成立，像入 $\C G$ 后由复情形为 $0/1$，单射回拉。特征零在此处消费：正特征域一般无可嵌入 $\C$ 的途径。(iv) remark（10:95-115）把整数区间限定在代数像 $j_*K_0(\C G)$ 上，逐字（10:111-112）：`This is the integer range on the algebraic image, not a statement about every class of $K_0^{\mathrm{top}}(C_r^*(G))$.` 幂等猜想与零因子猜想的单向关系（10:117-120）：$e\notin\{0,1\}$ 给非零零因子 $e(1-e)=0$，反向未证。对照 BV1998 的理性界（01:224-228）：$\tau_{G,*}(K_0(\C G))\subseteq\mathbb Q$ 与 $\tau(e)\in\mathbb Q\cap[0,1]$ 允许非整数值，thm:bass 的整数识别正是掐掉这些中间值的那刀。

机械理由：无扭假设只在两处消费（支撑缩到 $[1]_G$、以及不动点推论外的本体应用），全文迹定理不依赖它；$\operatorname{diag}(1,0)$ 例子把"$M_q(\C G)$ 幂等元只有 $0/1$"这种过强自标量推矩阵的想法定罪；$F/\mathbb Q$ 只需有限生成才 embeddable，所以整环 $R$ 本身不必嵌入 $\C$（10:90-92 明言 no embedding of all of $R$ into $\C$ is required）。

候选失败路线：[推测] (a) 用 BV 的理性直接逼 $\tau(e)\in\{0,1\}$：理性只给 $\mathbb Q\cap[0,1]$，中间有理数无法排除，必须借增广秩整数性这架桥，而整数性等价于迹支撑结论，绕不开；(b) 对矩阵幂等元也下"$0$ 或 $I$"结论：diag 反例当场否决，正确陈述是秩等式；(c) 系数下降时试图把整个 $R$ 嵌入 $\C$：一般特征零整环（如巨大超越 transcendence degree）做不到，有限生成子环路线是修正版。

## 13 尝试过的错误路线及失败原因

本节把第 0--12 节里散落的死路集中登记，凡有论文自供行号者给行号，纯重建者标 [推测]。

路线一：同调维数消没（正面失败）。拿 Burghelea 分解配 Eckmann 式论证，要求每个 $C_G(g)/\langle g\rangle$ 的（有理）同调维数有限。失败原因：约化中心化子作为群族无界，任意群可出现为某可解群的约化中心化子商类构造；而目标群是"每个离散群"。伤口缝合处：01:272-273（sparse-chain 定理以支集连通控制替换维度假设）与 02 节整个几何陈述不含群。

路线二：装配映射与 Farrell-Jones（假设污染）。BCM2004 用 Bost 装配的有理满射、Bartels-Lück-Reich 用 FJ 猜想蕴含。这类路线把结论锁在"满足假设的群族"。01:244-246 是决裂声明：
```
The present proof uses the finite support of group-ring idempotents
throughout; it requires neither an assembly hypothesis nor a statement
about a completed group algebra.
```

路线三：升级到完成代数（对象错位）。在 $\ell^1(G)$ 或 $C_r^*(G)$ 上证迹消没（Mineyev-Yu、Puschnigg 的双曲群成果，01:248-255）比代数版强，但方法解析、群族受限；[推测] 我一度想沿 $C_r^*$ 走，随即发现幂等猜想本身只要环内元素，代数化简（有限支、纯 PL 几何）反道是可行域更大的那条路。10:113-115 的 remark 又明说本证不预设代数增广可扩展到约化完备化，Kadison-Kaplansky 保持悬挂。

路线四：单位元-only 支撑（目标过强）。01:59-63 的平均幂等元 $|F|^{-1}\sum_{h\in F}h$ 在复群环里给每个类系数 $|C|/|F|\ne0$，有限阶非单位类合法存在；复版正确目标只能"有限阶类支撑"。整系数-only 是推论级（第 11 节 (iv)）。

路线五：整体有界余闭链（工具过强）。$\psi_m$ 经实值 $\beta$ 构造，沿 $g$ 幂线性漂移，不可能全局有界；01:189-191 明言 `The cocycles need not be globally bounded... Bounding the cocycle on those lists suffices`，代价是要为每个原形配 $M_\sigma$ 并证局域化（06:55-107）。

路线六：流形载体与相容度量（结构幻觉）。Alpert 的滤链原文假定向流形与相容度量（01:281-283 自供其限界）；我们的 $K$ 由顶形任意生成、面积逐形平均互不相容。补上的机械：lem:carrier 的逐形载体论证（06:156-186，尤其 06:184-185 的无流形声明）与 05:185-187 的"每步比较都在单个形的度量内完成后才平均"。

路线七：取最小元与极限滤链（紧性不存在）。05:55 `Neither an attained minimum nor a limit of filtrations is used.` [推测] 早期稿想对 $\epsilon=\frac1k$ 列取滤链的极限再用对角论证，容许类没有可用的紧性；改成每步 $\epsilon$-近优、误差不过夜（$\mathcal E_n$ 分发）。

路线八：可解性参数空间（假设回流）。Følner/遍历子造参把 BCM 式假设请回。lem:free-parameter 用逐元模数着色对每个可数群现造自由测度作用，04:16-17 声明不引任何自由作用定理。

路线九：奇数维闭链（符号自杀）。$b_k$ 在 $k$ 偶被 $\pi_kT=(-1)^{k-1}\pi_k$ 逼零，$n$ 奇时 $n+1$ 偶，$z_n=0$ 恒成立、检测不到 $\lambda$；Pfaffian 亦只吃偶长列表。修法：只在偶 $n=2m$ 组装（09:13-14）。

路线十：整数化 $\beta$（半整数钉子）。$\beta(1,t)=1/2$ 在 $G=\langle t\rangle$、$g=t^2$ 时被迫（08:55-57），$\beta$ 的取值集合含 $2$-整除量，$\Z/\Q$ 值化的早期版本报废；[推测] 这也是把 $\beta$ 定义成两个 $B$ 的平均，并非直接 $B$ 的原因，反对称性免费。

路线十一：次序颠倒（依赖断裂）。先定 $n$ 后取 $e$：$D$、$R$、$V_R$、$n_0(D)$ 都藏在 $e$ 的支集里，09:4-6 的秩序声明即修复。

路线十二：矩阵幂等元的域式结论（对象混淆）。见第 12 节 diag 反例段；幂等猜想原文只管环元素（01:95-96：`It concerns elements of the group ring itself, not arbitrary idempotent matrices over that ring.`）。

## 14 Lean 机器侧取证：机器证到的与笔头声称的

登记三行逐字（formalization.yaml:946-948）：
```
    - comparator_config: ComparatorChallenges/BassTrace.json
      declaration: OAI.BassTrace.RightProjective.bassTraceModules_vanishing_and_support
      file: OAI/RingTheory/BassTrace/Main.lean
```
比较器配置逐字要点（ComparatorChallenges/BassTrace.json:3-13）：solution_module 为 `OAI.RingTheory.BassTrace.Main`，theorem_names 恰一条（就是上面那个合取），definition_names 空，permitted_axioms 三枚：
```
    "propext",
    "Quot.sound",
    "Classical.choice"
```
另有 `"enable_nanoda": false`。环境按任务口径 Lean 4.34.1。

模块内取证。目录 `E:\math\lean\OAI\RingTheory\BassTrace\` 共 72 个 `.lean`、总计 24,157 行（`wc -l` 实测），与任务给的"约 73 个"同级。只读了 `Main.lean`（35 行）加目录内限定 grep。被登记断言的全文逐字（Main.lean:23-28）：
```
theorem bassTraceModules_vanishing_and_support {G : Type u} [_root_.Group G]
    (x : ModuleK0.{u,v} (MonoidAlgebra ℂ G)) :
    (∀ g : G, ¬IsOfFinOrder g → HattoriStallings x (ConjClasses.mk g) = 0) ∧
      ↑(HattoriStallings x).support ⊆
        {c | ∃ g : G, IsOfFinOrder g ∧ ConjClasses.mk g = c} :=
  ⟨fun g hg => bassTraceModules x g hg, bassTraceModules_support x⟩
```
两条腿各自独立成题：消没半（Main.lean:13-16，签名 `x : ModuleK0.{u,v} (MonoidAlgebra ℂ G)`、`(g : G) (hg : ¬IsOfFinOrder g)`，结论 `HattoriStallings x (ConjClasses.mk g)=0`）经 `K0.bassTraceK0 (presentation x) g hg` 转交；支撑半（Main.lean:18-21，结论 `↑(HattoriStallings x).support ⊆ {c | ∃g : G,IsOfFinOrder g ∧ ConjClasses.mk g=c}`）经 `K0.bassTraceK0_support (presentation x)` 转交。K0 层两题在 `MatrixK0.lean:98` 与 `MatrixK0.lean:112`（grep 实测行号，正文签名未越权读取）。桥梁 `presentation` 与对象类型是 `Definitions.lean:296` 的 `abbrev ModuleK0` 与 `Definitions.lean:302` 的 `def presentation : ModuleK0.{u,v} R →+ K0.Group R`；迹映射本体在 `Definitions.lean:457`（ModuleK0 版）与 `Definitions.lean:66`（群版），取值类型 `ConjClasses G →₀ ℂ` 即 Finsupp，与论文 01:37 的 finite support、01:28 的直和 $\bigoplus_{\con(G)}\C C$ 逐字对上。

机器实际证到的到底是哪一半：登记名指向一条合取，两半都在门内；[推测] 登记选合取，并非单条，是为了同时锁住"逐类消没"（论文的 Theorem 1.1 第一式，01:46-50）与"支撑包含于有限阶类"（第二式，01:51-56），防止后续重构只留其一。逻辑上两半近乎孪生：$c$ 在 Finsupp 支撑里当且仅当该坐标非零，`ConjClasses.mk` 满，于是"所有无穷阶类坐标为零"逐字等价"支撑含于有限阶类像"；差异只在 `IsOfFinOrder` 对 `ConjClasses.mk` 良定义这层商语法，[推测] 机器侧两半分别有独立证明是因为各自在 K0 层的引路不同（一半逐点、一半走支撑集 API），并非数学内容差异。半句"另一半挂在哪儿"的落点：挂在 `MatrixK0.lean:112`，由 `bassTraceModules_support` 一行搬运（Main.lean:21），与消没半共享同一 `presentation` 转介。

命名与约定侧写。登记名带中间命名空间 `RightProjective`（Main.lean:9 `namespace BassTrace.RightProjective`），而文件路径是 `RingTheory/BassTrace`，命名空间不含 `RingTheory` 段：[推测] 这是 OAI 仓惯例（登记名按数学内容，并非目录），`RightProjective` 正对论文 01:17-19 的右模列向量约定（`An idempotent $e=(e_{ij})\in M_q(A)$ represents the projective right module $eA^q$, with matrices acting on columns by left multiplication`），也与 09:73 处转述 Linnell 约定时的那句 `Their convention also uses right modules` 呼应。`ModuleK0` 是"对象/模块"层类型（经 `Object.presentationClass`、`Retraction` 等件，ModuleK0.lean:15-25 可见其用法），故登记断言逐字量化在模的同构类上；论文定理量化在 $K_0(\C G)$ 全体（含虚拟差，01:24 extended additively、09:28-31 additivity 段）。两座桥：笔头靠"每元素是两幂等类之差加 HS 可加性"，机器靠 `presentation` 是 `/+\`-同态且 K0 层定理（MatrixK0.lean:98/:112）先行；[推测] 虚拟差一侧的机器内容应在那两行 K0 定理内完成，Main.lean 只展示"对模类逐点引用"，因我未越权读 MatrixK0.lean 正文，此句以目录与调用形状为据。

卫生检查。目录内 `grep 'sorry\|axiom'` 命中为零（含 `Main.lean`），即模块内部无本地公理、无 sorry；跨模块的公理依赖（应恰为 json 许可三枚）需 `#print axioms` 实跑才坐实，[推测] 比较器（enable_nanoda 为 false、json 门限定理名）承担该复核，本轮未执行构建。无扭推论（论文 Corollary 1.2，10 节全篇）、整系数推论 cor:integral、不动点推论 cor:homotopy-idempotents 都不在 theorem_names 里：目录中 `TorsionFree.lean`、`TraceRank.lean`、`RegularRepresentation.lean` 等文件名（ls 实测）与 10 节内容同名目测对应，[推测] 其链条已形式化但未接比较器门；按登记口径，机器认领的是迹定理本体的合取一句。覆盖群类对照：Main.lean 签名对 `G` 只要求 `Group G`，无可数、无有限生成、无线性假设，与论文"every discrete group"（main.tex:42）同尺；论文经 07:18-32 与 09:33-41 完成的有限生成归约，机器侧对应的构件名 `FiniteGenerators.lean`、`Subgroup...`（目录有 `FiniteGenerators.lean`）在模块内存在，细节未读。

## 15 最终思路与最初设想的差异

本节把第 0 节的起点与第 1-14 节的终点逐条对照，差异清单按"命题形状、工具箱、写作顺序、有界性、最优化、支撑目标、机器认领、标题口径"八栏走。

差异一，命题形状：[推测] 我最初的命题是"对满足某同调有限性条件的群族证明迹消没"，最终定理（01:45-57 的 thm:bass，以及 Main.lean 的签名）量化在"每个离散群"，代价是将同调语言整体替换为"每个三元组 $(e,g,n)$ 造一条稀疏闭链再数点"；01:272-273 一句话就是这条鸿沟的正式碑文。

差异二，工具箱：从周期同调（Connes 配对、Burghelea 分解，01:260-265 只留作背景）迁移到 PL 几何加概率：输运度量（03:22-25）、逐形树面积（03:164-165）、自由测度参数（04:19-23）、近优滤链（05:44-48）、分量平均链映射（06:28-32、06:129-131）。01:269-271 声明检测器部分仍在周期同调传统里但"no cyclic-homology theorem is needed as an input"，输入端被彻底换血。

差异三，写作顺序：初稿代数在前；定稿 01:136-139 把几何陈述脱离群环先证完（第 2-6 节），再回来造对象（第 7-8 节），组装（第 9 节）。这不是排版趣味：thm:sparse 的陈述（02:41-54）里 $D$、$n_0(D)$、连通支集条件全是几何词汇，读它不需要知道 $e$、$g$ 是谁，"独立陈述"反过来逼出了 $K[W_\kappa]$、$M_\sigma$ 这些只为几何自身闭合而设的构件（06:55-107、06:224-230）。

差异四，有界性：[推测] 最初默认检测余闭链该有统一范数界，最终版本明写不需要（01:189-191：`The cocycles need not be globally bounded: near each original simplex, the construction uses only a fixed finite set of possible vertices. Bounding the cocycle on those lists suffices for the evaluation estimate.`），替代品是每个原形的局部最大 $M_\sigma$（06:227-230）。

差异五，最优化语义：从"取到最小面积的截"退到"每步距 infimum 差 $\epsilon$"（05:44-48、05:55），并且拒绝极限滤链；[推测] 这一步的痛感在 $\mathcal E_n$ 的分布设计里：$n$ 步每步漏一个 $\epsilon$，总量 $O_D(\epsilon)$，一步用尽则被 $A_n$ 反噬。

差异六，支撑目标：从幻想的"单位元支撑"修正为"有限阶类支撑"（复版），单位元-only 降格为整系数推论（09:54-57，借 Linnell-BH 数论限制完成）；平均幂等元反例（01:59-63）是这次修正的全部理由。

差异七，机器认领与笔头声称的距离：笔头在 main.tex:42-48 一次声称三件（迹定理、特征零幂等猜想、间接的整系数与不动点后果），比较器门（BassTrace.json:4-6）只领一条 `bassTraceModules_vanishing_and_support`，且量化对象是 `ModuleK0`（模类），并非论文的 $K_0$ 全体虚拟类；虚拟差、整系数、幂等、不动四层都在门外的 `MatrixK0.lean`、`TorsionFree.lean` 等件里各安其位（见第 14 节边界声明）。[推测] 登记选合取式，并非单条消没，是把两半写法同时锁住以防重构退化。

差异八，标题口径：目录名（队列第 127 行题名）只讲复群环迹猜想，main.tex:36 的正式标题把"characteristic-zero Kaplansky idempotent conjecture"并列进来；[推测] 这个增补正是差异六到差异七路线上目标扩容的化石：迹定理成形后幂等推论被抬进标题，而机器门尚未跟进同一高度。

## 16 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $D=\max\{2,\lvert S\rvert\}$ | 固定、跨维不变 | 07-idempotents.tex:94 | $n_0(D)$、$R$、$V_R$、$W_\kappa$ 有限性 | 令 $D$ 随 $n$ 增长则 03-metric.tex:254 裕度失效，thm:sparse 塌 |
| $S_0$ 与 $\lvert S_0\rvert^k$ | 有限、指数基数 $\lvert S_0\rvert$ | 07-idempotents.tex:123-124 | $v_k$ 有限支与增量表注入 | 支无限则删除恒等式的纤维求和与 coinvariant 有限链全非法 |
| $Y=\langle g\rangle\backslash G$ 右陪集 | 可数 | 07-idempotents.tex:85 | $H$ 自由作用、$\pi_k$ 良定义 | 换左陪集则 $T$ 与迹循环性错侧，07:155 的 $T_*v_k=v_k$ 断 |
| $H=C_G(g)/\langle g\rangle$ | 可数、无维数假设 | 07-idempotents.tex:84 | 等变性、coinvariant、lem:free-parameter | 若要求 $H$ 同调维数有限即回到第 13 节路线一死局 |
| $\lambda$ 总权重守恒 | 常数 | 07-idempotents.tex:141-142 | 检测器估值、组装逼零 | 删除恒等式变形则 $v_k(1)$ 漂移，$\lambda$ 不再等于 HS 系数 |
| $\beta$ 取值 $\R$ | 出现半整数 | 08-detector.tex:14 | $p_m$、$\psi_m$ | 改整数值被 08:55-57 的 $\beta(1,t)=1/2$ 反例否决 |
| $q_m=2^{-m}\lambda$ | 几何衰减比 $1/2$ | 08-detector.tex:98 | $\psi_m(z_{2m})=2^{-m}\lambda$（08:152） | 归一改为 $\pm1$ 外因子则旋转恒等式 08:130 的 $2q_m=q_{m-1}$ 不闭合 |
| $n=2m$、$m\ge1$、$n\ge n_0(D)$ | 三下界公共可行 | 09-completion.tex:13-14 | 组装 | 取奇 $n$ 则 $z_n=0$（$b_k$ 符号杀），检测器亦无 $p_m$ |
| $k_a=\operatorname{ord}(a)$（无穷阶取 $2$） | 逐元模数 | 04-filtrations.tex:26-27 | $X_a$ 着色良定义与自由性 | 统一 $2$-色则 $3$ 阶元坐标自相矛盾，自由性 04:50-52 断 |
| $X$ 紧、可度、零维 | Cantor 型 | 04-filtrations.tex:20 | 05:68-77 闭开分割、$F^\epsilon$ 积分 | 失去零维则无闭开原子，局部常数组无法拼 |
| $\mu$ 不变概率 | 柱集均匀 | 04-filtrations.tex:22 | 期望计数、轨道计数 05:131-143 | 无不变测度则 $\int_{hB}=\int_B$ 与 $M_0(r)$ 界链条断 |
| $\rho$ 的 $1/\sqrt n$ 缩放 | $\sqrt n$ 除子 | 03-metric.tex:22-25 | 分支梯度 $\le1$、支撑距离胀大 | 去掉缩放则 coarea 每步吃 $\sqrt n$，阶乘裕度被指数吞 |
| 支撑距离界 $\min d_Y\le\sqrt n\,\rho$ | $\sqrt n$ 因子 | 03-metric.tex:105 | lem:proper、$W_\kappa$、球计数 | 因子放大则 $k=\lfloor R\sqrt n\rfloor$ 的球爆大，$V_R$ 失去意义 |
| $R=4D^2$ | 固定常数 | 03-metric.tex:212 | $V_R$、直径 $2R$、$L=R-r$ | $R$ 太小则 $r$-球覆盖与切割直径预算同时失衡 |
| $r=R/2$、$L=2D^2$ | 一半 | 03-metric.tex:212 | $A_n=L^n/n!$、区间 $(r,R)$ | $L$ 缩小则 $A_n$ 前移，临界处 $A_n-V_R$ 变零 |
| 树体积 $1/n!$ | 阶乘衰减 | 03-metric.tex:174 与 03-metric.tex:193 | $A_n$、$V_R$ 双侧 | 改标准欧氏基则三角形变式破坏，$1/n!$ 无凭 |
| $D^{2n}$ 连通集计数 | 指数率 $D^{2}$ 每维 | 03-metric.tex:214-221 | $V_R$ 第二因子 | 改用球径计数会多出 $D^{n}$ 级误差项，比 $2^n$ 分母翻盘 |
| $D^{k+1}$ 几何球界 | 需 $D\ge2$ | 03-metric.tex:226 | $(n+1)D^{k+1}$ 顶点数 | $D=1$ 情形被 $\max\{2,\lvert S\rvert\}$ 预先排除 |
| $V_R$ 全式 | 超阶乘衰减 | 03-metric.tex:236-237 | eq:iterated-volume（05:208-210） | 任一因子改动都可能使 03-metric.tex:254 的严格号反号 |
| 滤链级数 $n+1$（$Z_n$ 至 $Z_0$） | 手术步数 $n$ | 04-filtrations.tex:73-74 | 手术循环、$\mathcal E_n$ 项数 | 步数与维数脱钩则迭代归纳 05:197-201 对不上阶乘核 |
| 每步 $\epsilon$ 近优预算 | $n$ 份 $\epsilon$ | 05-surgery.tex:44-48 | eq:near-minimality（05:51-54） | 集中预算则后步误差乘 $A_n$，期望计数发散 |
| $\mathcal E_n=\sum_{i=1}^n L^i/i!\le e^L-1$ | 有界 | 05-surgery.tex:205 | 放大因子分子（05:232） | 误差核改为无界则 $C_\sigma$ 失控 |
| $A_n=L^n/n!\to\infty$ | 阶乘增长 | 05-surgery.tex:204 | 放大因子分母 | 与 $V_R$ 之比趋 $0$ 的对数论证（03-metric.tex:250）是唯一支撑 |
| $C_\sigma=\frac{\mathcal E_n}{A_n-V_R}\sum_{i=1}^q p_i$ | 依赖固定几何 | 05-surgery.tex:244 | eq:zero-strata（05:15-18） | 含 $\epsilon$ 或细分复杂度则 06:242 的 $\to0$ 断 |
| 分量直径 $2R$ | 容许性条件 (iii) | 04-filtrations.tex:83-85 | $W_\kappa$ 半径、旗存活 | 放宽直径则标签集无限，$M_\sigma$ 无法定义 |
| $\lceil 2R\sqrt n+n\rceil$ | 线性加 $\sqrt n$ | 06-chains.tex:81 | $J_{U_F}\subseteq W_\kappa$ 有限性 | 去 $+n$ 则丢失"由包含顶形的连通图胀 $n$ 步"一环 |
| $2^n$ 旗计数 | 每层二选一 | 06-chains.tex:150 | 估值 06:238-243 | 载体唯一性（lem:carrier）失效则计数改指数量级 |
| $M_\sigma$ 局部界 | $\epsilon$-无关 | 06-chains.tex:227-229 | 存活项一致估值 | 要全局界则 $\psi_m$ 不可能（$\beta$ 无界） |
| $1/\lvert J_U\rvert$ 归一 | 凸组合 | 06-chains.tex:31 | 系数和 $1$ 与链映射性（06:116-122） | 不归一则 $\partial$ 公式多出总和质量项 |
| $1/\lvert H_\sigma\rvert$ 轨道权 | 整除配平 | 05-surgery.tex:35 | 轨道计数恒等式 05:131-143 | 去权则 $h\mapsto h^{-1}\sigma$ 的 $\lvert H_\sigma\rvert$ 重数无法抵消 |
| $\lvert H_\kappa\rvert\le\lvert V(\kappa)\rvert$ | 至多 $n+1$ | 03-metric.tex:139 | 同伦引理有限平均（06:282-285） | 稳定子无限则 $\bar t$ 的平均不收敛 |
| 登记断言（合取） | 一条 theorem_name | formalization.yaml:946-948 | 比较器门 | 拆成两条或改单半则门与笔头声称错位（第 14 节） |
| 许可公理三枚 | propext 等 | BassTrace.json:8-12 | 卫生复核 | 增许可之外的公理即越门 |
| 模块规模 | 72 件、24157 行 | ls 与 wc 实测 | 取证预算 | 通读全目录越出任务限定范围 |

依赖链散文：$S_0$（$e$ 的支集）定出 $S$ 与 $D$（07:88-95），$D$ 定出 $R$、$r$、$L$（03:212），$L$ 定出 $A_n$ 与 $\mathcal E_n$（05:204-205）；$D$ 同时进入 $V_R$ 的两个指数因子（03:226、03:236-237），$\sqrt n$ 缩放（03:22-25）把支撑距离胀大折进 $k=\lfloor R\sqrt n\rfloor$ 与 $W_\kappa$ 半径（03:105、06:81），三方合流成裕度 03:254，裕度供出 $\frac{\mathcal E_n}{A_n-V_R}$，放大因子乘分割原子和给出 $C_\sigma$（05:244），$C_\sigma$ 喂给期望计数 05:15-18；期望计数乘 $2^nM_\sigma$（06:150、06:227-229）压向 $0$（06:242-243），同伦引理（06:255-294，靠 $\lvert H_\kappa\rvert$ 有限）把 $0$ 搬回 $\psi_m(z_n)$，检测恒等式 $\psi_m(z_n)=2^{-m}\lambda$（08:152）于是逼 $\lambda=0$ 对每个 $(e,g)$ 与一切充分大偶 $n$ 成立；加性（09:28-31）升至 $K_0$ 全体，lem:locality（07:22-32）升至任意群，无扭特化交棒 10-torsion-free.tex:14-22 的秩识别与 10-torsion-free.tex:56-73 的忠实迹相似，最后 10-torsion-free.tex:78-92 的有限生成域嵌入把系数环铺开到任意特征零整环。机器侧链条同构地短一截：Main.lean:23-28 的合取以 `presentation`（Definitions.lean:302）转介 MatrixK0.lean:98 与 MatrixK0.lean:112，Finsupp 目标（Definitions.lean:457）替论文里的直和记账，比较器（BassTrace.json:4-6）只在这一条合取上落闸，秩识别、幂等与整系数层在闸外自走。
