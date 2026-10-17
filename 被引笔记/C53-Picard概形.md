# C53 Picard 概形（arXiv:math/0504020）

## 0 取证边界

- arXiv id：`math/0504020`
- 原文题名（逐字）：The Picard scheme
- 作者（API 署名，逐字）：Steven L. Kleiman
- 发表年月：2005-04-01
- 素材目录：`E:\math\被引素材/math_0504020`
- 主 tex 清单（实测）：
  - `main.tex`，325849 字节 / 6614 行
- 本语料引用它的稿号与 bib key（登记不解读）：
  - D318（bib key `Kleiman2005`）
  - D385（bib key `Kleiman2005`）
- 取证薄读之处：本轮按规格 §2 的 10 次上限读了 `main.tex` 的七个跨度，
  分别为行 1140--1539（导言的构造纲要与比较定理及其证明前半）、
  行 1950--2249（LinSys 表示定理与主定理及其前段证明）、
  行 2620--2919（存在性三定理 Mumford/Grothendieck/Artin 与群概形基本引理）、
  行 2920--3219（Pic$^0$ 的拟射影/射影与 Poincar\'e 族、几种替代证明）、
  行 3250--3449（切空间定理与平滑推论）、
  行 4080--4279（数值等价定理与有界性引理）、
  行 4500--4699（tau 分量有限性与 Hilbert 多项式分量），
  外加对 `eg:Mumford` 位置串的行 2440--2639。
  全部位置串以这些真实行号为准。
- 记法说明：素材 preamble 声明 `\IPic` 系列写作 I + `\!Pic`，
  本文一律展开为 `\operatorname{Pic}`；
  `\mc O`、`\mc L`、`\mc F` 展开为 `\mathcal O`、`\mathcal L`、`\mathcal F`；
  `\tu H^i`、`\tu T_0` 展开为 `\mathrm H^i`、`\mathrm T_0`；
  `\bb Z`、`\bb Q`、`\bb R`、`\bb C` 展开为 `\mathbb Z`、`\mathbb Q` 等；
  `\I P(\mc Q)`、`\IHilb`、`\IDiv`、`\IQuot` 展开为 `\mathbb P(\mathcal Q)`、
  `\operatorname{Hilb}`、`\operatorname{Div}`、`\operatorname{Quot}`；
  `\Pic_{(X/S)\et}`、`\Pic_{(X/S)\fppf}`、`\Pic_{(X/S)\zar}` 分别写作
  `\operatorname{Pic}_{(X/S)_{\text{\'et}}}`、
  `\operatorname{Pic}_{(X/S)_{\text{fppf}}}`、
  `\operatorname{Pic}_{(X/S)_{\text{Zar}}}`；
  `\amalg` 保持 `\amalg`；
  `\vf`、`\varphi`、`\phi` 各自按其出现的数学含义保留希腊字母。
  素材中的 AMS 字体内部名 `\fam\msbfam\tenmsb` 一类一律不落正文。

## 1 问题的原型与本文的构造纲要

素材把整篇论文的动机锁定在 Abel 定理的代数几何推广上。对光滑射影曲线
$X/k$，$\deg\colon \Pic^0(X)\to \mathbb Z$ 的核同构于 Jacobian 簇
$J(X)$，其上的 Abel 映射把 $n$ 个点的形式和送到线丛
$\mathcal O_X(p_1+\dotsb+p_n)\otimes \mathcal O_X(-q_1-\dotsb-q_n)$；
经典 Abel 定理断言：两个零因子 $\sum n_i p_i$ 与 $\sum n_i' p_i'$ 给出同构的
线丛当且仅当所有正规化 Abelian 积分之和相等（`main.tex:414-429` 附近）。
从 Riemann 到 Jacobi 再到 Castelnuovo、Severi、Weil，一路的困难是把
"线丛族"作为代数对象参数化；Mumford 在讲义
Mumford Lectures on Curves on an Algebraic Surface（Lects. 19--21）
里首次对光滑射影曲面给出完整构造。
Grothendieck 的做法（本文主题）是把参数化问题化为一个函子的表示问题。

素材给出的固定设定在 `main.tex:1222-1223`：
取定一个 separated 有限型映射
$$f\colon X\to S.$$
对所有 $S$-概形 $T$ 记 $X_T:=X\times_S T$，投射记为
$f_T\colon X_T\to T$。绝对 Picard 函子定义为
`main.tex:1274-1279`：
$$\operatorname{Pic}_X(T):=\operatorname{Pic}(X_T).$$
绝对 Picard 函子在 Zariski 拓扑下从来不是分离的（`main.tex:1292-1302`）：
取 $T:=\mathbb P^1_X$ 与 $\mathcal N:=\mathcal O_T(1)$，
对角映射 $X\to X\times_S X$ 给出 $f_T$ 的截面 $g$，$gf_T=1_T$，故
$f_T^*\mathcal N$ 非平凡；然而存在 Zariski 覆盖 $T'\to T$ 使
$\mathcal N|T'$ 平凡，于是 $\operatorname{Pic}_X(T)$ 中有一个非零元素
在 $T'$ 上消失。这与可表示函子必是 fpqc 层相矛盾。

素材的构造纲要（`main.tex:1140-1156`）分两步：先局部化，把绝对函子
转成三种相对 Picard 函子（Zariski、\'etale、fppf 三层化）；
再用 Hilbert 概形的开子概形之商覆盖局部化函子，把每个开子函子表示化，
最后按 EGA I (0, 4.5.5) 的胶水定理把 $\operatorname{Pic}_{X/S}$
拼出来。整套论证不需要 fpqc，只用 étale；这也是本文与
Grothendieck FGA 摘要的一个具体差别。

## 2 四个相对 Picard 函子与比较定理

素材 `main.tex:1311-1318` 定义相对 Picard 函子：
$$\operatorname{Pic}_{X/S}(T):=\operatorname{Pic}(X_T)\big/\operatorname{Pic}(T),$$
并把它在 Zariski、\'etale、fppf 三种 Grothendieck 拓扑下的相关化层分别记作
$$\operatorname{Pic}_{(X/S)_{\text{Zar}}},\quad
\operatorname{Pic}_{(X/S)_{\text{\'et}}},\quad
\operatorname{Pic}_{(X/S)_{\text{fppf}}}.$$
于是得到一个五段自然映射链
$$\operatorname{Pic}_X\to \operatorname{Pic}_{X/S}\to
\operatorname{Pic}_{(X/S)_{\text{Zar}}}\to
\operatorname{Pic}_{(X/S)_{\text{\'et}}}\to
\operatorname{Pic}_{(X/S)_{\text{fppf}}}.$$
其中最后三层已经都是相应拓扑下的层，且它们既是 $\operatorname{Pic}_X$
的相关化层，也是 $\operatorname{Pic}_{X/S}$ 的相关化层。

局部表示定理（`main.tex:1350-1361`）说明：当 $T=\operatorname{Spec}(A)$
局部时前三层重合 $\operatorname{Pic}_X(A)\cong\operatorname{Pic}_{X/S}(A) \cong\operatorname{Pic}_{(X/S)_{\text{Zar}}}(A)$；
$A$ 代数闭剩余域的 Artin 局部环时
$\operatorname{Pic}_X(A)\cong\operatorname{Pic}_{(X/S)_{\text{\'et}}}(A)$；
$A$ 为代数闭域 $k$ 时
$\operatorname{Pic}_X(k)\cong\operatorname{Pic}_{(X/S)_{\text{fppf}}}(k)$。
反例（`main.tex:1364-1375`）：$X\subset \mathbb P^2_{\mathbb R}$ 由
$$X:\ u^2+v^2+w^2=0$$
给出。$X(\mathbb R)=\varnothing$ 但 $X_{\mathbb C}\cong\mathbb P^1_{\mathbb C}$，
$\varphi^*\mathcal O(1)$ 定义
$\operatorname{Pic}_{(X/\mathbb R)_{\text{\'et}}}(\mathbb R)$
中不在 $\operatorname{Pic}_{(X/\mathbb R)_{\text{Zar}}}(\mathbb R)$ 像里的元素，
说明 Zariski 与 \'etale 相关化不同构。

比较定理（`main.tex:1384-1399`）是第二节的骨架。假设
$$\mathcal O_S\cong f_*\mathcal O_X\quad\text{普遍成立},$$
即任意 $S$-概形 $T$ 都有 $\mathcal O_T\cong f_{T*}\mathcal O_{X_T}$。
\tu 1. 自然映射全是单射：
$$\operatorname{Pic}_{X/S}\hookrightarrow
\operatorname{Pic}_{(X/S)_{\text{Zar}}}\hookrightarrow
\operatorname{Pic}_{(X/S)_{\text{\'et}}}\hookrightarrow
\operatorname{Pic}_{(X/S)_{\text{fppf}}}.$$
\tu 2. 若 $f$ 有截面则三层全部同构；若截面只在 Zariski 局部存在，
则后两层同构；若截面只在 \'etale 局部存在，则末层同构。

Part 1 的证明骨架（`main.tex:1454-1481`）依赖关键引理
`lm:fff`（`main.tex:1413-1420`）：在 $\mathcal O_S\cong f_*\mathcal O_X$
假设下，$\mathcal N\mapsto f^*\mathcal N$ 是从 $S$ 上局部自由有限秩层
范畴到 $X$ 上同类范畴的全忠实函子，其本质像由满足
$f_*\mathcal M$ 局部自由且 $f^*f_*\mathcal M\to\mathcal M$
是同构者 $\mathcal M$ 组成。证明用了三段自然同构（`main.tex:1425-1427`）：
$$\mathcal N\cong\mathcal N\otimes f_*\mathcal O_X\cong
\mathcal N\otimes f_*f^*\mathcal O_S\cong f_*f^*\mathcal N,$$
第一式靠余态射 $f$，第二式靠 $\mathcal O_X=f^*\mathcal O_S$，
第三式靠投射公式。

对 Part 1 的应用：取 $\lambda\in\operatorname{Pic}_{X/S}(T)$，
$\lambda$ 在 $\operatorname{Pic}_{(X/S)_{\text{fppf}}}(T)$ 中为零意味着
存在 fppf 覆盖 $p\colon T'\to T$ 使 $p_X^*\mathcal L\cong f_{T'}^*\mathcal N'$，
于是由引理 $f_{T'*}p_X^*\mathcal L\cong\mathcal N'$。$p$ 平坦给出
$p^*f_{T*}\mathcal L\cong f_{T'*}p_X^*\mathcal L$，因此 $f_{T*}\mathcal L$
可逆且 $f_T^*f_{T*}\mathcal L\to\mathcal L$ 是同构（两者在忠实平坦
$p$ 拉回后成立），故 $\lambda=0$。

Part 2 的关键是刚化（rigidification）引理（`main.tex:1490-1513`）：
若 $f$ 有截面 $g$，$\operatorname{Pic}_{X/S}(T)$ 同构于
$(\mathcal L,u)$ 同构类群，其中 $\mathcal L$ 是 $X_T$ 上的可逆层，
$u\colon\mathcal O_T\cong g_T^*\mathcal L$。构造 $\mathcal L:= \mathcal M\otimes(f_T^*g_T^*\mathcal M)^{-1}$给出满射；
另一方向靠 $g_T^*f_T^*=1$。自动同构引理（`main.tex:1515-1531`）：
在普遍 $\mathcal O_S\cong f_*\mathcal O_X$ 假设下，
$\operatorname{Aut}(\mathcal L,u)$ 平凡：
$$v\in\operatorname{Hom}(\mathcal L,\mathcal L)
=\mathrm H^0(\mathcal{S}\!\operatorname{hom}(\mathcal L,\mathcal L))
=\mathrm H^0(\mathcal O_{X_T})=\mathrm H^0(\mathcal O_T),$$
中间式靠可逆层的自同态层与 $\mathcal O_{X_T}$ 自然同构，末式靠假设。
$g_T^*v=1$ 推出 $v=1$。层化论证收尾。

## 3 相对有效除子与线性系表示

第三节的对象是相对有效（Cartier）除子函子 $\operatorname{Div}_{X/S}$
与"以 $\mathcal L$ 为代表的线性系"函子
$\operatorname{LinSys}_{\mathcal L/X/S}$。素材 `main.tex:1948-1954`
给出后者的定义：
$$\operatorname{LinSys}_{\mathcal L/X/S}(T):=\{\,D\subset X_T
\text{ 相对有效除子}\mid
\mathcal O_{X_T}(D)\simeq \mathcal L_T\otimes f_T^*\mathcal N,
\ \mathcal N\in\operatorname{Pic}(T)\,\}.$$
形式上它与 $\operatorname{Pic}_{X/S}$ 定义同型（都是"商掉 $\operatorname{Pic}(T)$"），
只是把可逆层换成有效除子；区别在于 $\operatorname{Div}_{X/S}$ 天生是
Zariski 层，且落在 $\operatorname{Hilb}_{X/S}$ 的开子概形里（`th:repDiv`，
`main.tex:1837`）。

核心表示定理（`main.tex:1963-1968`）：

**定理 3.1（LinSys）** 设 $X/S$ 真、平坦，其几何纤维整；
$\mathcal L$ 是 $X$ 上的可逆层；$\mathcal Q$ 是
§3 里为 $\mathcal F:=\mathcal L$ 构造的
$\mathcal O_S$-模。令 $L:=\mathbb P(\mathcal Q)$。则 $L$ 表示
$\operatorname{LinSys}_{\mathcal L/X/S}$。

$\mathcal Q$ 的关键性质是相对伴随同构（`main.tex:1982-1984`）：
$$\mathcal{H}\!\operatorname{om}(\mathcal Q_T,\mathcal N)\cong
f_{T*}(\mathcal L_T\otimes f_T^*\mathcal N),$$
其中 $\mathcal N$ 是 $T$ 上的任意可逆层；此同构把
$\sigma\in\mathrm H^0(X_T,\mathcal L_T\otimes f_T^*\mathcal N)$
换成映射 $u\colon\mathcal Q_T\to\mathcal N$。

证明链条露出中间式（`main.tex:1970-2030`）：
给定 $D\in\operatorname{LinSys}_{\mathcal L/X/S}(T)$，先固定 $\mathcal N$
（唯一性由引理 `lm:fff` 得），$D$ 由
$\sigma\in\mathrm H^0(X_T,\mathcal L_T\otimes f_T^*\mathcal N)$
定义；$\sigma$ 经上述同构对应到 $u\colon\mathcal Q_T\to\mathcal N$。
逐点判 $u$：$t\in T$ 时 $D_t$ 是 $X_t$ 上的除子，
$\sigma_t\in\mathrm H^0(X_t,\mathcal L|X_t)$ 非零；
$\mathcal N\otimes k_t$ 是一维 $k_t$-向量空间，$u\otimes k_t$ 满，
Nakayama 给出 $u$ 逐点满，从而全局满。
由 EGA II 4.2.3 满射 $u$ 定义唯一 $S$-映射 $p\colon T\to L$。
反过来 $p\colon T\to L$ 由拉回 tautological $\alpha\colon \mathcal Q_L\to\mathcal O(1)$得$\mathcal Q_T\to\mathcal N$；
再经同构回读 $\sigma$，逐纤维 $\sigma_t\neq 0$，
$X_t$ 整故 $\sigma_t$ 正则，$\sigma$ 定义相对有效除子 $D$。
两端互逆。

Abel 映射（`main.tex:2135-2145`）由 $\operatorname{Div}_{X/S}\to \operatorname{Pic}_{X/S}$，$D\mapsto\mathcal O_{X_T}(D)$；
若 $\operatorname{Pic}_{X/S}$ 可表示则 Abel 映射升为概形映射
$\mathrm A_{X/S}\colon\operatorname{Div}_{X/S}\to\operatorname{Pic}_{X/S}$。
习题 PQ-Abel（`main.tex:2147-2153`）在 $\operatorname{Pic}_{X/S}=P$
存在并有万有线丛 $\mathcal P$ 时给出 $\mathbb P(\mathcal Q)= \operatorname{Div}_{X/S}$作为$P$-概形。这条同构是第 5 节 Poincar\'e
族存在性的直接依据。

## 4 主定理：Picard 概形的存在与局部有限型

主定理（`main.tex:2155-2166`）：

**定理 4.1（Main）** 设 $f\colon X\to S$ 在 $S$ 上 Zariski 局部投影，
平坦，几何纤维整。
\tu{(1)} $\operatorname{Pic}_{X/S}$ 存在，在 $S$ 上分离且局部有限型，
表示 $\operatorname{Pic}_{(X/S)_{\text{\'et}}}$。
\tu{(2)} 若 $S$ 是 Noether 且 $X/S$ 投影，则
$\operatorname{Pic}_{X/S}$ 是一族开子概形的不交并，每个开子概形是
开拟射影 $S$-概形的递增并。

证明前段（`main.tex:2168-2247`）在 $S$ 上做 Noether 归约后展开。
按 Yoneda 把 $P:=\operatorname{Pic}_{(X/S)_{\text{\'et}}}$ 视为函子，
给定 $\phi\in\mathbb Q[n]$ 定义
$$P^\phi\subset P$$
为下面预层的 \'etale 相关化层，其 $T$-点由 $X_T$ 上满足
$$\chi(X_t,\mathcal L_t^{-1}(n))=\phi(n),\quad\forall\,t\in T$$
的可逆层 $\mathcal L$ 代表。适定性的关键：上同调与平坦基变换可交换
（Hartshorne Algebraic Geometry, Prop. III 9.3, p. 255），故对任意 $p\colon T'\to T$
有对每个 $t'\in T'$、$i$、$n$：
$$\mathrm H^i(X_{t'},\mathcal L_{t'}^{-1}(n))=
\mathrm H^i(X_{p(t')},\mathcal L_{p(t')}^{-1}(n))\otimes_{k_t}k_{t'}.$$
固定一个 $T\to P$，用 \'etale 覆盖 $p\colon T'\to T$ 与
$\mathcal L'$ 表示，令
$${T'}^\phi:=\{t'\in T'\mid \chi(X_{t'},
\mathcal L_{t'}^{-1}(n))=\phi(n)\}.$$
由 EGA III$_2$ 7.9.11 ${T'}^\phi\subset T'$ 开；
$p$ \'etale 保证 $T^\phi:=p({T'}^\phi)$ 开，
且 ${T'}^\phi=p^{-1}(T^\phi)$：包含 $\supset$ 用第三个 \'etale 覆盖
$T''\to T'\times_TT'$ 把两个拉回粘起来，$\chi$ 沿 $t'\to t''\to t_1'$
保持不变。$T^\phi$ 表示 $P^\phi\times_PT$，验证 $R$-点即可（对
$R\to T$ 走两次 \'etale 覆盖）。让 $\phi$ 变：${T'}^\phi$ 两两不交、
覆盖 $T'$，${T}^\phi$ 亦然；据 EGA I (0, 4.5.4), p. 103，
若每个 $P^\phi$ 可用递增开拟射影子拼出，则 $P$ 是它们的商空间，
就是所求的不交并分解。

后段（`main.tex:2249` 之后按素材走向）固定 $\phi$、$m\in\mathbb Z$，
构造 $P^\phi_m$：由 $\mathcal L$ 与 $m$ 决定的"足够正"的截面
生成开子层，把 $P^\phi_m$ 用 $\operatorname{Hilb}_{X/S}$
的商概形 $\operatorname{Quot}$ 的局部嵌入表示；
每一步用到第 3 节 LinSys 表示定理与 EGA I (0, 4.5.5), p. 106
的 fpqc 胶水。分离性由对角映射可表性沿 fppf 层的同胚性得到。

素材在 `main.tex:4531-4534` 复述主定理两条内容：
"存在、局部有限型"与"表示 $\operatorname{Pic}_{(X/S)_{\text{\'et}}}$"。
习题 `ex:0sec`（`main.tex:2078-2089`）指出：在 $\operatorname{Pic}_{X/S}$
存在与 $\mathcal O_S\cong f_*\mathcal O_X$ 普遍两个前提下，
对 $T$ 上可逆层 $\mathcal L$ 有唯一子概形 $N\subset T$ 与 $N$ 上可逆层
$\mathcal N$ 使 $\mathcal L_N\cong f_N^*\mathcal N$，$N$ 在
$\operatorname{Pic}_{X/S}$ 分离时是闭子概形。
这是 Abel 映射纤维的绝对刻画。

## 5 Mumford 反例与三条存在性定理

主定理要求几何纤维整。素材 `main.tex:2450-2586` 记 Mumford 反例：
$S:=\operatorname{Spec}\mathbb R[\![t]\!]$，$X\subset\mathbb P^2_S$
由非齐次方程
$$x^2+y^2=t$$
定义，$f\colon X\to S$ 是结构映射。
一般纤维 $X_\sigma$ 是 $\operatorname{Frac}\mathbb R[\![t]\!]$ 上
非退化圆锥曲线；特殊纤维 $X_0$ 是共轭直线对 $x+iy=0$ 与 $x-iy=0$，
拓扑上是不可约、几何连通的。因此 $f$ 平坦（依引理 `lm:ctn` (iii)$\Rightarrow$(i)），
$\mathcal O_S\cong f_*\mathcal O_X$ 普遍成立（`ex:gc&r`），
然而 $\operatorname{Pic}_{X/S}$ 不存在。

对偶方向：把基换到 $S':=\operatorname{Spec}\mathbb C[\![t]\!]$，
令 $X':=X\times_S S'$。$f_{S'}$ 有截面 $g'$，如
$$x=\sqrt{-1},\quad y=\sqrt{1+t}=1+\tfrac12 t-\tfrac18 t^2+\dotsb.$$
于是四个相对 Picard 函子在 $X'/S'$ 上相等（由比较定理）。
$\operatorname{Pic}_{X'/S'}$ 存在但不分离，其具体形如
$$\operatorname{Pic}_{X'/S'}\cong\coprod_{n\in\mathbb Z}S_n',$$
每个 $S_n'$ 是"把 $S'$ 的闭点重复无限多次"得到的：对 $a+b=n$
取 $S'_{a,b}\cong S'$ 一份，把所有这些 $S'_{a,b}$ 在闭点外粘起来。
$S'_{a,b}$ 参数化一般纤维 $X'_\sigma$ 上度为 $n$ 的线丛往特殊纤维退化时
在第一根线上度 $a$、在第二根线上度 $b$ 的那一族退化。复共轭交换两根线，
也交换 $S'_{a,b}$ 与 $S'_{b,a}$。

不存在性的关键论证（`main.tex:2486-2493`）：若 $\operatorname{Pic}_{X/S}$
存在，基变换律（`ex:bschg`）给出
$\operatorname{Pic}_{X/S}\times_S S'=\operatorname{Pic}_{X'/S'}$。
$S'_{a,b}$ 与 $S'_{b,a}$ 的闭点互为共轭，被映到 $\operatorname{Pic}_{X/S}$
的同一个点，落在这个点的仿射开邻域 $U$；$U$ 在 $\operatorname{Pic}_{X'/S'}$
中的原像 $U'$ 应当仿射（$U$、$S$、$S'$ 都仿射）。当 $a\neq b$ 时
两闭点在 $U'$ 中不同，落在同一个仿射开里就与 $S'_{a,b}$ 与 $S'_{b,a}$
只在闭点外粘合这一构造矛盾。故 $\operatorname{Pic}_{X/S}$ 不存在。

素材在 `\operatorname{Pic}_{X'/S'}` 具体表示上（`main.tex:2495-2585`）
把万有层显式给出：$X'$ 正则（在
$\mathbb P^2_{\mathbb C}\times\mathbb A^1_{\mathbb C}$ 中
$x^2+y^2=t$ 定义光滑曲面），所以约化曲线都是有效除子。
取三根线 $L:x=\sqrt{-1}y,t=0$；$M:x=-\sqrt{-1}y,t=0$；
$A$ 是上面 $g'$ 的像。令
$$\mathcal P'_{a,b}:=\mathcal O_{X'}(bL+nA),\quad n=a+b.$$
沿 $X'_\sigma$、$M$、$L$ 分别限制度数依次是 $n$、$b$、$a$
（第三式靠 $\mathcal O(L)\otimes\mathcal O(M)\cong\mathcal O$，
理想 $(L+M)$ 由 $t$ 生成）。这些 $\mathcal P'_{a,b}$ 在
$X'\times_{S'}\coprod S_n'$ 上粘成 $\mathcal P'$。
给定 $\mathcal L$，按 $\chi(\mathcal L_t)-1=n$ 分类，
$T_{a,b}$ 由"$\mathcal L|L_t$ 度 $a$、$\mathcal L|M_t$ 度 $b$"与
一般纤维开子概形 $T_\sigma$ 之并给出；在 $T_{a,b}$ 上
$\mathcal M:=\mathcal L^{-1}\otimes(1\times\tau)^*\mathcal P'_{a,b}$
满足 $\mathrm H^1(X'_t,\mathcal M_t)=0$、
$\mathrm H^0(X'_t,\mathcal M_t)=k_t$（Serre 显式计算
EGA III$_1$ 2.1.12），于是 $u\colon f_T^*\mathcal N\to\mathcal M$
沿 $T_{a,b}$ 是同构。粘起来 $\coprod q_{a,b}$ 给出 $q\colon T\to\coprod S_n'$，
唯一。

三条 refine 主定理的存在性定理（`main.tex:2628-2813`）：

**定理 5.1（Mumford）** $X/S$ 投影、平坦，几何纤维约化连通；
通常纤维的不可约分支几何不可约。则 $\operatorname{Pic}_{X/S}$ 存在。

**定理 5.2（Grothendieck 泛表示）** $X/S$ 真，$S$ 整。
则存在非空开 $V\subset S$ 使 $\operatorname{Pic}_{X_V/V}$ 存在、
表示 $\operatorname{Pic}_{(X_V/V)_{\text{fppf}}}$，且是开拟射影子概形
的不交并。

**推论 5.3** $S=\operatorname{Spec}k$，$X$ 完备。
则 $\operatorname{Pic}_{X/k}$ 存在、表示 $\operatorname{Pic}_{(X/k)_{\text{fppf}}}$，
是不交开拟射影并。

**定理 5.4（Raynaud 相对表示）** $S$ 整，$X'\to X$ 是真 $S$-概形之间的
满射。则存在非空开 $V\subset S$ 使
$$\operatorname{Pic}_{(X_V/V)_{\text{fppf}}}\to
\operatorname{Pic}_{(X'_V/V)_{\text{fppf}}}$$
由有限型拟仿射映射表示。

**定理 5.5（Artin 代数空间版）** $f\colon X\to S$ 平坦、真、有限呈现，
且 $f_*\mathcal O_X$ 与基变换可交换（"dimension zero 上同调平坦"）。
则 $\operatorname{Pic}_{X/S}$ 作为代数空间存在，在 $S$ 上局部有限呈现。

Mumford 例子说明 scheme 版不成立；Artin 定理说明把"scheme"放宽到
"algebraic space"就成立，两者正好卡在同一段假设上。素材在
`main.tex:2819-2833` 讨论过 Artin 定理是否形式蕴含主定理：一般情形未明；
在域上，群层结构的代数空间自动是群概形（Artin 1966 Lem. 4.2, p. 43），
所以推论 5.3 由定理 5.5 直接给出。

## 6 恒等分支 Pic$^0$：拟射影、射影、切空间

第五节从抽象群概形性质起（`main.tex:2851-2911` 引理 `lem:agps`）：
域 $k$ 上局部有限型群概形 $G$ 分离（对 $\alpha(g,h)=gh^{-1}$ 的原像
$\alpha^{-1}e$ 就是 $G\times G$ 中对角，闭）；
$G$ 若有几何约化开子概形则平滑（乘平移把平滑开子集移到每一点）；
$G^0$ 开且闭、有限型、几何不可约，形成 $G^0$ 与扩域可交换。
证明用 `EGA IV 4.5.14` 保证基变换保持连通、`EGAI 6.1.9` 保证
局部 Noether 空间的连通分支开；
约化后取仿射平滑开 $U$，$\alpha(U\times U)=G^0$ 说明
$G^0$ 拟紧，加上局部有限型得有限型。

拟射影/射影定理（`main.tex:2935-2940`）：

**定理 6.1** $S=\operatorname{Spec}k$，$X/k$ 投影、几何整。则
$\operatorname{Pic}^0_{X/k}$ 存在且拟射影。若 $X/k$ 还几何正规，则
$\operatorname{Pic}^0_{X/k}$ 射影。

拟射影部分靠 $k$ 代数闭时 $\operatorname{Pic}^0_{X/k}$ 落在
平滑、几何不可约、有限型的开子概形里，习题 `ex:q-proj` 给出
"域上平滑有限型群概形 $\implies$ 拟射影"。
射影部分的证明骨架（`main.tex:2941-2984`）：Chevalley-Rosenlicht
结构定理说 $k$ 上约化连通有限型群概形是 Abel 簇模线性群。
Lie-Kolchin 说可解线性代数群三角化，非平凡时含 $\mathbb G_m$ 或
$\mathbb G_a$；$\operatorname{Pic}_{X/k}$ 交换故可解。
剩下只要证明任意 $k$-映射 $t\colon T=\mathbb A^1\setminus\{0\}\to (\operatorname{Pic}^0_{X/k})_{{\operatorname{red}}}$常值。由比较定理，$t$由
$X\times T$ 上可逆层 $\mathcal L$ 定义；$X\times T$ 整故
$\mathcal L=\mathcal O(D)$。沿一般纤维限制为平凡，
$(\varphi)+D$ 限制到平凡；取截面 $s\colon X\to X\times T$，
$E:=s^*((\varphi)+D)$ 是 $X$ 上的除子，$p^*E$ 与 $(\varphi)+D$
作为 cycle 一致，作为除子也一致（$X\times T$ 正规，
Altman–Kleiman Prop. (3.10), p. 139）。故 $\mathcal L=p^*\mathcal O(E)$，
$t$ 常值。

Poincar\'e 族推论（`main.tex:2986-3033`）：$k$ 代数闭、$X$ 投影整，
$P:=\operatorname{Pic}^0_{X/k}$，$\mathcal P$ 限制到 $X_P$ 的 Poincar\'e 层。
则存在 $X_P/P$ 上的相对有效除子 $W$ 使
$$\mathcal O_{X_P}(W-(W_0\times P))\cong\mathcal P\otimes f_P^*\mathcal N,$$
$W_0$ 是 $0\in P$ 上的纤维，$\mathcal N$ 是 $P$ 上的可逆层。
证明用 Serre 定理 EGA III$_1$ 2.2.1 找到 $N$ 使
$R^if_{P*}\mathcal P(n)=0$ 对 $i>0$、$n\ge N$；
选取 $\lambda$ 使 $\mathcal O_X(n)$ 对应，
乘以 $\lambda$ 给出 $P\cong P'$ 把 $0$ 映到 $\lambda$，
$(1\times q)^*\mathcal P'\cong\mathcal P(n)\otimes f_P^*\mathcal N$。
第 3 节的 $\mathbb P(\mathcal Q)=\operatorname{Div}_{X/S}$ 说明
$\mathcal Q|P'$ 局部自由、秩 $\dim\mathrm H^0(\mathcal O_X(n))\ge 1+\dim P$，
Serre 生成定理（Mumford Lectures p. 148）给出满射
$\mathcal Q|P'\to\mathcal O_P(m)$，即 Abel 映射在 $P'$ 上的截面 $h'$，
取 $W':=(1\times h')^{-1}$ 万有除子，回拉 $W$。

切空间定理（`main.tex:3265-3270`）：

**定理 6.2** $S=\operatorname{Spec}k$；$\operatorname{Pic}_{X/k}$ 存在、
表示 $\operatorname{Pic}_{(X/k)_{\text{\'et}}}$。则
$$\mathrm T_0\operatorname{Pic}_{X/k}=\mathrm H^1(\mathcal O_X).$$

证明（`main.tex:3271-3408`）的核心是把切空间用对偶数环
$k_\varepsilon:=k[\varepsilon]/(\varepsilon^2)$ 上的 $k$-点描述：
$$\mathrm T_eP=P(k_\varepsilon)_e=\ker\bigl(P(\rho)\colon P(k_\varepsilon)
\to P(k)\bigr),$$
其中 $\rho\colon k_\varepsilon\to k$ 是自然投影。加法用
$k_{\varepsilon,\varepsilon'}$ 与三个同态
$\sigma_1,\sigma_2,\sigma\colon k_{\varepsilon,\varepsilon'}\to k_\varepsilon$
搬过来：$\alpha:=P(\sigma)\circ\pi^{-1}\colon P(k_\varepsilon)_e\times P(k_\varepsilon)_e\to P(k_\varepsilon)_e$。
群概形的情形证明 $\alpha$ 同时也是乘法映射（$\pi$、$P(\sigma)$ 都群同态，
$\alpha(m,n)=\alpha(m,e)\cdot\alpha(e,n)$，$\alpha(m,e)=m$，
$\alpha(e,n)=n$）。

对 $P=\operatorname{Pic}_{X/k}$ 用截断指数正合列：
$$0\to\mathcal O_X\to\mathcal O_{X_\varepsilon}^*
\to\mathcal O_X^*\to 1,$$
第一段 $b\mapsto 1+b\varepsilon$；有截面 $a\mapsto a+0\cdot\varepsilon$，
故长正合列分裂为短正合：
$$0\to\mathrm H^1(\mathcal O_X)\to\mathrm H^1(\mathcal O_{X_\varepsilon}^*)
\to\mathrm H^1(\mathcal O_X^*)\to 1.$$
$\operatorname{Pic}_{X/k}$ 表示 $\operatorname{Pic}_{(X/k)_{\text{\'et}}}$，
后者是 $T\mapsto\mathrm H^1(\mathcal O_{X_T}^*)$ 的相关化层，
得到交换方框（`main.tex:3371-3375`）
$$\begin{CD}
\mathrm H^1(\mathcal O_{X_\varepsilon}^*) @>>> \mathrm H^1(\mathcal O_X^*)\\
@VVV @VVV\\
\operatorname{Pic}_{X/k}(k_\varepsilon) @>>> \operatorname{Pic}_{X/k}(k).
\end{CD}$$
两个水平核之间有 $v\colon\mathrm H^1(\mathcal O_X)\to \mathrm T_0\operatorname{Pic}_{X/k}$；$k_\varepsilon$-自同态
$\mu_a(\varepsilon)=a\varepsilon$ 保证 $v$ 是 $k$-线性。
用扩域把 $k$ 化为代数闭；垂直映射按 `ex:Alr` 同构，故 $v$ 是同构。

推论（`main.tex:3421-3440`）：$\dim\operatorname{Pic}_{X/k} \le\dim\mathrm H^1(\mathcal O_X)$，等号当且仅当在$0$平滑，
此时处处平滑；特征 0 时由 Cartier 定理恒平滑
（`main.tex:3442-3450`）。

## 7 数值等价、tau 分量与 Hilbert 多项式分量

第六节把 $P^\tau$（tau 分量）与 $P^\phi$（按 Hilbert 多项式的分支）
的有限性归到数值等价定理上。素材 `main.tex:4085-4116`：

**定理 7.1（numeq）** $S=\operatorname{Spec}k$ 代数闭，$X$ 投影，
$\mathcal L$ 是 $X$ 上可逆层。以下等价：
\tu{(a)} $\mathcal L$ 与 $\mathcal O_X$ $\tau$-等价；
\tu{(b)} $\mathcal L$ 与 $\mathcal O_X$ 数值等价；
\tu{(c)} 族 $\{\mathcal L^{\otimes p}\mid p\in\mathbb Z\}$ 有界；
\tu{(d)} 对任意 $X$ 上的凝聚层 $\mathcal F$，$\chi(\mathcal F\otimes\mathcal L)=\chi(\mathcal F)$；
\tu{(e)} 对任意整闭曲线 $Y\subset X$，$\chi(\mathcal L_Y)=\chi(\mathcal O_Y)$；
\tu{(f)} 对任意 $p\in\mathbb Z$，$\mathcal L^{\otimes p}(1)$ 丰沛；
$X$ 不可约时再加上：\tu{(g)} 对任意 $(p,n)$，
$\chi(\mathcal L^{\otimes p}(n))=\chi(\mathcal O_X(n))$；
$X$ 不可约、$\dim X=r\ge 2$ 时再加上：\tu{(h)} 令 $\ell:=c_1\mathcal L$、
$h:=c_1\mathcal O_X(1)$，则
$$\int \ell\,h^{r-1}=0,\qquad \int\ell^2 h^{r-2}=0.$$

证明按 `main.tex:4117-4224` 建立蕴含链：
$$(c)\Rightarrow(a)\Rightarrow(d)\Rightarrow(e)\Leftrightarrow(b)
\Rightarrow(c)\Rightarrow(f)\Rightarrow(b);$$
$$(d)\Rightarrow(g)\Rightarrow(h)\Rightarrow(b);\qquad
(g)\Rightarrow(b)\ \text{当}\ \dim X=1.$$
$(c)\Rightarrow(a)$：有界定义给出 $T$ 有限型与 $X_T$ 上 $\mathcal M$；
鸽巢原理找到 $p_1\neq p_2$ 使 $\mathcal L^{\otimes p_1}$ 与
$\mathcal L^{\otimes p_2}$ 落在 $T$ 的同一连通分支；令 $m=p_1-p_2$，
$\mathcal L^{\otimes m}$ 代数等价于 $\mathcal O_X$。
$(c)\Rightarrow(f)$：EGA II 4.5.8 与 EGA III$_1$ 4.7.1 给出邻域 $U$
使 $\mathcal M_u(n)$ 丰沛；$T$ 拟紧取有限个 $U$ 的 $n$ 之积 $N$。
$(a)\Rightarrow(d)$：$n\mapsto\chi(\mathcal F\otimes\mathcal L^{\otimes n})$
是多项式；把 $\mathcal L$ 换成 $\mathcal L^{\otimes m}$；沿
连通 $T$ 用 EGA III$_2$ 7.9.5 常值。
$(e)\Leftrightarrow(b)$：Riemann--Roch $\chi(\mathcal L_Y)= \deg(\mathcal L_Y)+\chi(\mathcal O_Y)$。
$(f)\Rightarrow(b)$：$0\le\deg(\mathcal L_Y^{\otimes p}(1))= p\deg(\mathcal L_Y)+\deg(\mathcal O_Y(1))$对所有$p$，故
$\deg(\mathcal L_Y)=0$。
$(g)\Rightarrow(h)$：写
$$\chi(\mathcal L^{\otimes p}(n))=\sum_{0\le i,j\le r}
a_{ij}\binom{p+i}{i}\binom{n+j}{j},$$
$a_{ij}=\int\ell^i h^j$ 当 $i+j=r$；$(g)$ 给出 $i\ge 1$ 时
$a_{ij}=0$，$r\ge 2$ 时 $(h)$ 落定。
$(h)\Rightarrow(b)$：对 $r$ 归纳，$r=2$ 用 Hodge 指数定理；
$r\ge 3$ 时对整闭曲线 $Y\subset X$ 取 $n$ 使
$\mathcal I_{Y,X}(n-1)$ 由全局截面生成，
一般纤维 $H_\eta$ 几何不可约（Zariski 主定理 I.6.3, p. 30），
投射公式给出 $\int\ell_1 h_1^{r-2}=n\int\ell h^{r-1}=0$、
$\int\ell_1^2 h_1^{r-3}=n\int\ell^2 h^{r-2}=0$，归纳得
$\mathcal L_H$ 数值平凡，$Y\subset H$ 再投射公式给 $\int\ell[Y]=0$。
$(b)\Rightarrow(c)$：用引理 `lem:hp` 找到一致的 $m$ 使每个数值平凡的
$\mathcal N$ 是 $m$-正则；取 $\phi(n):=\chi(\mathcal O_X(n))$、
$M:=\phi(m)$、$\mathcal F:=\mathcal O_X(-m)^{\oplus M}$；
$\operatorname{Quot}^\phi_{\mathcal F/X/k}$ 有限型，其万有商在去掉非可逆
轨迹的开子概形上给出有界族。

引理 `lem:bd`（`main.tex:4234-4241`）给出关键的一致上界：
$X$ 投影、$\dim X=r$，$\mathcal F$ 凝聚，则存在 $B_{\mathcal F}$ 使对任意
数值平凡的 $\mathcal L$：
$$\dim\mathrm H^0(\mathcal L\otimes\mathcal F(n))
\le B_{\mathcal F}\binom{n+r}{r},\quad \forall\,n\ge 0.$$
证明（`main.tex:4242-4278`）：$r=0$ 时 $B_{\mathcal F}= \dim\mathrm H^0(\mathcal F)$。$r\ge 1$：短正合列
$0\to\mathcal F'\to\mathcal F\to\mathcal F''\to 0$ 给出
$B_{\mathcal F}=B_{\mathcal F'}+B_{\mathcal F''}$；
滤过化归到 $\mathcal F=\mathcal O_X(p)$；
$(\ell+h)$ 上的除子论据 $0\le\int h^{r-1}[D] =\int h^{r-1}\ell+p\int h^r$且$\int h^{r-1}\ell=0$、
$\int h^r>0$ 逼出 $p\ge 0$，得 $\mathrm H^0(\mathcal L(-1))=0$；
超平面截 $0\to\mathcal L(n-1)\to\mathcal L(n)\to\mathcal L_H(n)\to 0$，
按 $r$ 归纳得 $\dim\mathrm H^0(\mathcal L_H(n)) \le B\binom{n+r-1}{r-1}$；差分不等式配
$\binom{n+r-1}{r}+\binom{n+r-1}{r-1}=\binom{n+r}{r}$ 完成对 $n$ 归纳。

**定理 7.2（Ptaufin）** $f\colon X\to S$ 在 $S$ 上 Zariski 局部投影、
平坦、几何纤维整。则 $\operatorname{Pic}^\tau_{X/S}$ 是开且闭的群子概形、
有限型，与基变换可交换；若 $X/S$ 还投影、$S$ Noether，则
$\operatorname{Pic}^\tau_{X/S}$ 拟射影。

证明（`main.tex:4519-4587`）关键：基变换可交换来自 `ex:bschg` 与
引理 `lem:Gtauk`；只需证明开。取 $\operatorname{Pic}_{X/S}$ 的仿射开 $U$
与 étale 覆盖 $T\to U$，$T^\tau\subset T$ 由"$M_t$ 与 $\mathcal O_{X_t}$
$\tau$-等价"定义（`ex:teq`），是 $\operatorname{Pic}^\tau$ 的原像。
$T$ 有限型只有有限个连通分支；对每个 $(p,n)$，
$t\mapsto\chi(\mathcal M_t^{\otimes p}(n))$ 沿连通分支常值；
numeq 定理给出 $T^\tau$ 开闭。

**推论 7.3（torgp）** $S$ Noether，$f$ 局部投影、平坦、几何纤维整。
每个 $s\in S$、$k_s'$ 为 $k_s$ 代数闭包，商群
$$\operatorname{Pic}^\tau_{X_{k_s'}/k_s'}(k_s')\big/
\operatorname{Pic}^0_{X_{k_s'}/k_s'}(k_s')$$
有限，阶有界。

证明（`main.tex:4589-4612`）：由 `prp:pic0` $\operatorname{Pic}^0$ 在
$\operatorname{Pic}^\tau$ 中开，阶就是 $\operatorname{Pic}^\tau$ 的
连通分支数；`Ptaufin` 保证有限型；EGA IV$_3$ 9.7.9 说分支数在
非空开子集上常值；Noether 归纳给全局有界。

**定理 7.4（Pphifin）** $X/S$ 投影、平坦、几何纤维整。给定
$\phi\in\mathbb Q[n]$，令 $\operatorname{Pic}^\phi_{X/S}\subset \operatorname{Pic}_{X/S}$由满足$\chi(\mathcal L(n))=\phi(n)$
对所有 $n$ 的 $\mathcal L$ 组成。$\operatorname{Pic}^\phi$ 两两不交、
覆盖、开且闭、有限型、与基变换可交换；$S$ Noether 时拟射影。

证明（`main.tex:4643-4659`）："本情形比 `Ptaufin` 简单，因为所论层
按假设已同 Hilbert 多项式，无需 numeq 也无需 `lem:hp`"。

反例（`main.tex:4691-4699` 的 `eg:Pphifin`）：几何纤维可约时
`Pphifin` 会失效。取 $S=\operatorname{Spec}k$、$X$ 为两根不交线的并。
对 $(a,b)\in\mathbb Z^2$ 令 $\mathcal L_{a,b}$ 在第一根线上度 $a$、
第二根线上度 $b$。Riemann--Roch 给
$$\chi(\mathcal L_{a,b}(n))=(a+b)+2n+1,$$
所以 $\phi$ 只锁 $a+b$ 一个自由度，$\operatorname{Pic}^\phi$ 内部
仍带一个离散的 $\mathbb Z$-参数，不再是有限型。这是主定理要求几何纤维
整的第二条独立证据（第一条是 Mumford 例子）。

## 8 与本语料的接缝

本稿登记语料中引用它的两处：

- **D318** 以 bib key `Kleiman2005` 使用本素材；
  最可能对口的结论是主定理（本文 §4 的定理 4.1）与
  推论 5.3（完备 $k$-概形的 Picard 概形是不交开拟射影并）。
  D318 若引用"Picard 概形存在，局部有限型"这一层事实，
  直接对应本文 §4；若引用"$\operatorname{Pic}^0_{X/k}$ 是 Abel 簇"
  这一层，对应本文 §6 的定理 6.1 与其证明中的 Chevalley--Rosenlicht
  论证。
- **D385** 同以 bib key `Kleiman2005` 使用本素材；
  从 bib key 无法判定引用哪一条。可参考的候选还有 §7 的定理 7.2
  （$\operatorname{Pic}^\tau$ 是开且闭、有限型群子概形）与推论 7.3
  （$\operatorname{Pic}^\tau/\operatorname{Pic}^0$ 有限阶有界），
  这两条是"N\'eron--Severi 群是有限生成"这类陈述的标准入口。

读法约定：D318、D385 若把 Picard 概形写作
$\operatorname{Pic}_{X/k}$、$\operatorname{Pic}^0_{X/k}$、
$\operatorname{Pic}^\tau_{X/k}$、$\operatorname{Pic}^\phi_{X/k}$，
本稿的四个记号逐字对应；D318、D385 若把"$X/S$ 几何纤维整"写作
"geometrically integral"，本稿在 §4 主定理的假设位置对应
`main.tex:2155-2157`。D318、D385 若引用"$\operatorname{Pic}_{X/S}$
表示 $\operatorname{Pic}_{(X/S)_{\text{\'et}}}$"这一层，
本稿对应 `main.tex:2159-2160`；若引用
"$\mathrm T_0\operatorname{Pic}_{X/k}\cong\mathrm H^1(\mathcal O_X)$"，
本稿对应 `main.tex:3265-3270` 的定理 6.2。
所有位置串都指素材目录 `E:\math\被引素材/math_0504020\main.tex` 里的真实行号。
