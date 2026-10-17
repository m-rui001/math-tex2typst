# 从计数猜想到指数集行插值：Nagata 平面曲线猜想反推笔记

队列第 89 行号，条目 Nagata's Conjecture for Plane Curves（2026-09-23）。
论文目录 `preprints/Nagatas-Conjecture-for-Plane-Curves-September-23-2026`。
本笔记是我做这项研究时的私房记录：正文素材只取自该目录 `build/` 下的 `.tex`，Lean 侧只顺登记项与 import 链取证。
写法上我要保留弯路本身，包括那些只在文本缝隙里露了一行的防守性句子，因为它们正是思路的化石。

## 0 素材实测清单与登记

先登记我实际量到的东西，后面所有行号引用都以此为坐标。测量在 `E:\math` 下用 `find` 与 `wc` 完成，未执行任何 git 命令。

论文目录全名（供覆盖审计）：`preprints/Nagatas-Conjecture-for-Plane-Curves-September-23-2026`，队列第 89 行号。

| 文件（相对 `build/`） | 字节 | 行数 |
| --- | --- | --- |
| `sections/01-reductions.tex` | 16286 | 387 |
| `sections/03-limits.tex` | 14771 | 379 |
| `sections/02-elliptic.tex` | 13465 | 343 |
| `sections/04-interpolation.tex` | 12337 | 337 |
| `sections/introduction.tex` | 7992 | 143 |
| `sections/consequences.tex` | 3996 | 84 |
| `figures/slice-profile.tex` | 2699 | 63 |
| `main.tex` | 1885 | 50 |
| 合计 | 73431 | 1786 |

八个 `.tex` 共 73431 B，与我按 `find -name '*.tex' -exec wc -c {} +` 得到的 total 一致（再用 `cat` 聚合复核一次也是 73431）。`main.tex:29` 的 `\title{Nagata's conjecture for plane curves}`、`main.tex:30` 的 `\author{OpenAI}`、`main.tex:31` 的 `\date{September 23, 2026}` 给出题名、作者与日期，`main.tex:42` 到 `main.tex:47` 的六行 `\input` 固定了章节顺序：introduction、01-reductions、02-elliptic、03-limits、04-interpolation、consequences。这个顺序对我反推思维链很关键，因为它把"约化"排在"椭圆"之前，而把最组合的"插值"排在最后。

`build/references.bib` 存在，实测 7356 B。按派单约束我只登记它的存在，没有把它当正文论证来源，也没读它。`typst/` 目录里有 `main.typ`、`refs.bib`、`refs.original.bib`、`fig/`、`main.pdf`，均非素材。`main.pdf`（446667 B）我没有打开，语料加密，`pdftotext` 一律禁用。

登记侧三行（`lean/formalization.yaml`）逐字如下：

```
1346	    - comparator_config: ComparatorChallenges/Nagata.json
1347	      declaration: OAI.Nagata.nagata_conjecture
1348	      file: OAI/AlgebraicGeometry/PlaneCurves/Nagata.lean
```

`lean/ComparatorChallenges/Nagata.json` 实测 466 B、16 行，里面 `theorem_names` 列了三项：`OAI.Nagata.Workers.W30.exists_positive_degree_equation_of_homogeneous_cycle`、`OAI.Nagata.nagata_conjecture`、`OAI.Nagata.nagata_conjecture_coordinates`；`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice`；`enable_nanoda` 为 `false`。

`lean/OAI/AlgebraicGeometry/PlaneCurves/` 整目录实测 117 个 `.lean`、1646239 B。派单警告过不要漫游，我的做法是只从 `Nagata.lean` 的 import 行走：它只 import `FixedCurveSections` 与 `FullTarget`（`Nagata.lean:1` 与 `Nagata.lean:2`），第二层是 `GeometricCollision`、`MarkedCubic`、`BasisNoncancellation`、`CubicEquations`、`Incidence`、`SquareReduction`，第三层我只按语句需要点开 `UniversalReduction`、`Rows`、`ScaledMatrices`。清单与字节数在第 18 节。派单里点名的 `TorusCharts.lean`、`ChartJets.lean`、`ThetaSeries.lean`、`QuotientSections.lean`、`CubicMap.lean`、`SectionKernels.lean`、`TorusConfigurations.lean`、`Configuration.lean`、`ThetaProducts.lean` 只有 `ChartJets.lean` 通过 `Incidence.lean:1` 进入我的视野，其余没有出现在我读的语句里，我没有打开它们。

## 1 初始动机与猜想

我最早的入手点是 `introduction.tex:22` 到 `introduction.tex:29` 那段纯计数，因为它是全文唯一一处不依赖任何几何的论证，也是所有做这个问题的人的第一课。

平面 $d$ 次齐次形式的系数个数是 $\binom{d+2}{2}$（`introduction.tex:23`）。要求在一个点上重数至少 $m$，就是要求局部 Taylor 展开里总次数小于 $m$ 的系数全为零，条件数 $\binom{m+1}{2}$（`introduction.tex:24`）。$r$ 个点的齐次版本给出的线性方程组是

$$
\binom{d+2}{2}\ \text{个未知数},\qquad r\binom{m+1}{2}\ \text{个条件}.
$$

把两边的首项写出：左边约 $d^{2}/2$，右边约 $r m^{2}/2$，两相平衡处正是 $d=m\sqrt r$（`introduction.tex:25`）。我读到这里时的第一反应跟所有人一样：条件对 very general 点应当是无关的，于是 $d<m\sqrt r$ 时解空间为空，猜想就是"数一下再加一般性"。$d=m\sqrt r$ 这个尺度在计数层面是临界的，$d$ 与 $m$ 同阶时条件数与未知数个数之比正好趋于 $1$。

我把这个天真读法写成我的初始猜想 $C_{0}$：对 very general 的 $r$ 元组，重数条件在 $\binom{d+2}{2}\le r\binom{m+1}{2}$ 之外没有额外相关，因此 Nagata 不等式 $d\sqrt r>\sum m_i$ 应当由秩的一般下界直接给出。

$C_{0}$ 有三个我当时没看到的软肋，文本里各留了一处痕迹。

第一处是端点。`introduction.tex:28` 用一句话把我打回：九个点时非零三次曲线永远存在。九点的情形 $r=9$、$d/m=3=\sqrt 9$ 恰好落在临界尺度上，此时计数两边都是 $\binom{5}{2}=10$ 对 $9\binom{4}{2}=54$ 这种量级完全不匹配，但解空间非空。这正是"条件数小于未知数个数并不能保证无关性"的教科书反例，也是定理断言的严格不等式不可能从 $r=9$ 起步的原因（`introduction.tex:29`）。我要证的第一个版本因此必须是 $r\ge 10$。

第二处是历史的重量。`introduction.tex:7` 到 `introduction.tex:9` 交代 Nagata 提出这个问题是为了 Hilbert 第十四问题，并自己证了平方情形 $r\ge 16$（`introduction.tex:8`），本文要的是 $r\ge 10$ 且允许重数不等（`introduction.tex:9`）。我起初以为"允许重数不等"只是措辞上的加强，后来在第 5 节会看到它是把循环乘积归化拉进来的唯一通道。

第三处是已知最好结果的形状。`introduction.tex:58` 到 `introduction.tex:66` 给了我可比较的坐标：Roe 用无限近点 specializes 得到齐次情形的一致估计 $d>m(\sqrt{r-1}-\pi/8)$（`introduction.tex:59`），Eckl 的 Seshadri 估计与 Ciliberto--Dumitrescu--Miranda--Roe 对平面线性系统的分析在十点情形给出 $d/m\ge 117/37$（`introduction.tex:63` 到 `introduction.tex:66`）。$117/37\approx 3.16216$ 而 $\sqrt{10}\approx 3.16228$，差距在小数点后第四位。这个数字让我意识到，任何只到有理数下界的路线都拿不到 $d\sqrt r>\sum m_i$，因为 $r$ 非平方时 $1/\sqrt r$ 是无理数，而所有退化方法的产物都是有理数。

于是我的初始猜想被我自己改写成 $C_{1}$：先证明"如果失败，则存在对所有构型都成立的齐次重数系统 $\mathsf U_r(d,m)$"，再对这一个对象做解析攻击。改写完成后我遇到了第一个真正的困难：$\sqrt r$ 这个无理数必须从某个解析极限里长出来，而代数几何的常规操作（特化、退化、线性系统）全部保持有理数。我当时的猜测是让它从某个超越对象的周期里出现，第 10 节里它确实从 $\tau\to 0^{+}$ 的 theta 乘积里出现，但出现的位置跟我预想的不同。

还有一个初始动机我把它记在这里，因为后面再没提起：`introduction.tex:11` 说先在工作域 $\C$ 上证明，`consequences.tex:10` 到 `consequences.tex:17` 再把结论搬到任意不可数特征零代数闭域。我起初以为这是收尾的技术活，实际上它决定了我必须把 exceptional union $E_r$ 做成由 $\mathbb Q$ 上的极小式子定义的对象（`01-reductions.tex:35` 的 "all defined over $\mathbb Q$"），否则域比较根本没法做。

## 2 尝试过的错误路线及失败原因

这一节是我走过的死路的清单。每条都写我为什么上当、在哪个具体计算上崩掉、以及文本里哪一句话暴露了作者也踩过同一个坑。

路线 A：把秩的一般下界当证明。我以为对固定 $(d,\mathbf m)$，$A_{d,\mathbf m}$ 是真闭子簇就够了，取可数并即得 very general 点。崩掉的地方是"真"这个字：$A_{d,\mathbf m}$ 由 Taylor 系数矩阵的满列余子式定义（`01-reductions.tex:59`），而要证明它真，需要构造一个非零多项式，这件事本身等价于原问题。`01-reductions.tex:66` 到 `01-reductions.tex:73` 给出的解法我起初看不起，觉得太粗：取 $2r$ 个在 $\mathbb Q$ 上代数无关的复数当仿射坐标。后来才明白这一步是唯一能把"真"变成"存在点避开所有闭集"的操作，且它同时给出 $U_r\setminus E_r$ 非空。这条路线的失败原因：闭子簇的性质（是否真）对一般点是循环论证，只有把 $E_r$ 一次性做成可数并且有理定义，才既能选点又能换域。

路线 B：只用齐次重数 $m_i=m$。Nagata 原文和 Roe、Eckl、CDMR 的结果都是齐次形式，我照抄了这个简化。崩掉的地方在第 5 节：循环乘积归化要求从违反 $d_0\sqrt r\le\sum m_i$ 的一般系统出发，构造 $d=rd_0$、$m=\sum m_i$ 的齐次系统（`01-reductions.tex:86` 到 `01-reductions.tex:95`）。如果一开始就只允许齐次违反，$m=\sum m_i$ 这步会变成 $m=rm$，即 $d/m=d_0/m$ 不变但 $r$ 倍放大后的比值 $d/m=r d_0/(rm)=d_0/m$ 什么都没换来；真正起作用的是 $\sum_i m_i$ 与 $d_0\sqrt r$ 的比较被搬到了 $d/m$ 与 $\sqrt r$ 的比较上（`01-reductions.tex:92`）。这条路线的失败原因：不等重数是归化的燃料，把 $r$ 个不同重数一次性吃掉，才得到"$\mathsf U_r(d,m)$ 对每个构型成立"这种极强的对象。我在第 4 节会看到它换来的代价：$d$ 被放大 $r$ 倍，之后的解析论证里所有量都要跟着放大。

路线 C：无限近点 specialize。这是 Roe 的路线，它的产物 $d>m(\sqrt{r-1}-\pi/8)$ 里 $\sqrt{r-1}$ 说明它把九个点上的 Cayley--Bacharach 损失吸收进了根号里。我试过把它加强到端点：崩掉在 $\pi/8$ 这种来自圆内接的几何粗估上，它本质上是一个"用某个具体测试曲线套出上界"的对偶论证，精度被测试曲线族限制住。`introduction.tex:67` 说这类界解释了"在每个固定的非平方 $r$ 处控制任意大的重数"的重要性，我读成作者承认这条路线封顶在有理数。失败原因：特化与退化族产生的下界是行列式的整数关系，永远是有理数；无理数 $\sqrt r$ 进不来。

路线 D：把 $B$ 取成高次曲线。归化之后我需要一个载体曲线 $B$ 来承载碰撞，第 6 节的必要正规多项式对任意光滑 $k$ 次曲线都成立（`01-reductions.tex:104` 到 `01-reductions.tex:131`），所以我先试了 $k\ge 4$。崩掉在两处。第一处是维度恒等式：`03-limits.tex:302` 用到 $\dim \W_\tau=\binom{d+2}{2}-9\binom{m+1}{2}$，它的证明要求每个系数块都是完备线性系统，`02-elliptic.tex:317` 明确说前 $m+1$ 个块的次数与维数都是 $h$。$k\ge 4$ 时限制映射 $H^0(\Pp^2,\mathcal O(d))\to H^0(B,\mathcal O_B(d))$ 有 $G_B$ 倍出的核，块维数不再等于次数，theta 的剩余类基（`02-elliptic.tex:175`）也失效。第二处是低位排除：`01-reductions.tex:357` 的引理给的是 $d>3m$，一般 $k$ 只给 $d>km$，而当 $\sqrt r$ 与 $k$ 之间只剩一点空隙时，我根本不知道 $d/m$ 是否大于 $k$。失败原因：$k=3$ 是唯一同时满足"平面模型由完备线性系给出"和"$d>3m$ 自动成立（因为 $3=\sqrt 9$ 是最后一个被排除的平方）"的次数。

路线 E：把核向量沿 $\tau$ 连续搬运。极限矩阵论证最自然的做法是让 $\ker J_\tau$ 里非零向量随 $\tau$ 走，取 $\tau\to 0^{+}$ 的极限，直接得到 $B_0$ 有核。崩掉的地方在归一化因子：`03-limits.tex:148` 到 `03-limits.tex:152` 造的基里塞了 $\tau^{-x_0K}$，`03-limits.tex:371` 直说这些因子可能趋于 $0$ 或 $\infty$。也就是说基向量的范数在 $\tau\to 0$ 时失控，我在同一坐标系里讲不清"某个单位向量的列组合始终在核里"。作者在这里做的退让是全文我最佩服的一处：`03-limits.tex:373` 到 `03-limits.tex:377` 明说核的存在对每个固定 $\tau$ 单独由引理给出，矩阵比较只发生在数值矩阵层面，"no continuous choice of kernel vectors, or algebraic family of plane embeddings across $\tau=0$, is required"。失败原因：跨 $\tau$ 搬运核向量需要一个在 $\tau=0$ 延拓的平面嵌入族，而 $X_\tau=\C^{*}/\tau^{\Z}$（`02-elliptic.tex:115`）的模 $\log\tau\to-\infty$，极限是 $\C^{*}$，它在任何射影曲线之外；这条路的正确版本是稳定映射，代价太大。

路线 F：只靠总数比较。我一度以为 $\lvert\mathcal I\rvert$ 与 $\lvert\mathcal S\rvert$ 的大小关系就够了。两边我复算过：$\lvert\mathcal I\rvert=\sum_{b=0}^{m-1}q(m-b)=q m(m+1)/2$（`03-limits.tex:100`），$\lvert\mathcal S\rvert=\binom{d+2}{2}-9\binom{m+1}{2}$（`03-limits.tex:302`）。差是

$$
\lvert\mathcal I\rvert-\lvert\mathcal S\rvert=\tfrac12\left(r m^{2}+r m-d^{2}-2 d\right)
$$

（推导：把 $q=r-9$ 与 $\binom{m+1}{2}$ 展开合并）。在 $d\le m\sqrt r$ 时右边首项非负，$r\ge 5$ 时一次项也非负，所以行数不少于列数。我于是以为矩阵单射成立，但方向完全相反：行多列少只说明方程组可能过定，它推不出某个具体矩阵单射，因为 $B_0$ 的行是特定单项式 $K^{\ell}J^{b}$ 在 $\mathcal S$ 上的限制，是否张满 $\C^{\mathcal S}$ 是插值问题。`04-interpolation.tex:14` 把满列秩翻译成"这些单项式的张成能插值 $\mathcal S$ 上任意函数"，`04-interpolation.tex:133` 干脆写"To exclude the kernel, a total count of exponent pairs is not enough"。失败原因：计数只给必要条件，满秩要靠按行插值的构造性论证。

路线 G：用最大行来控制插值。改做逐行插值时我先猜只要 $\max_K N_K\le m$。`04-interpolation.tex:25` 到 `04-interpolation.tex:28` 提醒我：逐行修正时先处理的行数进入 $K$ 的次数，当前行的点数进入 $J$ 的次数，两个约束是耦合的，所以只控最大行或者只控总点数都不够。我用一个四点小例核算过：$\mathcal S$ 有两行各 $m$ 点时 $K$ 方向需要次数 $1$，若有 $q(m-1)+1$ 行都是 $m$ 点则次数预算 $q(m-1)$ 刚好爆掉。失败原因：插值空间 $\mathcal P_{q,m}$ 是单项式的矩形截断（`04-interpolation.tex:41`），它的形状是"随 $b$ 增大而缩短"的杨图，行分布必须整体装进这个杨图。

路线 H：让平方情形的论证直接吃非平方。平方情形的证明（`01-reductions.tex:253` 到 `01-reductions.tex:329`）里，$j<m$ 时次数比较是 $\deg L^{d-kj}=k(d-kj)\le k^{2}(m-j)=r(m-j)$（`01-reductions.tex:305`），非平方时 $k$ 不是整数，这个不等式左边只能取 $3(d-3j)$ 而右边需要 $r(m-j)$，差号方向变成取决于 $d/m$ 是否 $\le r/3$。对 $r\ge 10$、$d/m<\sqrt r$，$r/3>\sqrt r$ 成立，所以我确实有 $3(d-3j)<r(m-j)$ 的余量，但余量是实数，而零点个数是整数：$9(m-j)$ 个规定零点只要求次数 $\ge 9(m-j)$，多出来的 $r-9$ 个零点必须靠额外的点和碰撞来产生。失败原因：非平方带来的空隙是实数级的，必须用"额外 $q=r-9$ 个点碰撞"把整数误差吃掉，这正是第 12 节全部机器存在的原因。

## 3 关键转折点

转折一：把"一般点"换成"所有构型"。`01-reductions.tex:20` 定义的 $\mathsf U_r(d,m)$ 说的是"对 $U_r$ 里每个元组都存在非零形式"。我第一次读到 `01-reductions.tex:96` 那句"The construction applies at every tuple"时愣住了：循环乘积的产物在每个点上都成立，于是我从"存在一族坏点"升级到"存在一个对所有构型都成立的系统"。这一步把我面对的空间从 $U_r$ 的闭子集补集换成了一个具体的线性系统，代价是重数被 $r$ 倍放大，收益是之后可以自由选择构型。第 6 节里我果然开始自由选 $B$、选 $a_i$、选法向位移 $c_i$，全部由 `01-reductions.tex:121` 那句"For every choice of distinct points and arbitrary vectors"授权。

转折二：发现"任选法向位移"是免费的。`01-reductions.tex:148` 到 `01-reductions.tex:149` 明确写"The vectors $c_i$ are arbitrary complex normal vectors; no compatibility among them is required"。我一开始以为这是谦虚的话。把它当武器之后，平方情形的整个证明就出来了：$h^{0}(B,M)=\binom{k+2}{2}-1=(k^{2}+3k)/2<k^{2}=r$（`01-reductions.tex:287`），所以求值映射

$$
H^{0}(B,M)\longrightarrow\bigoplus_{i=1}^{r}M_{a_i}
$$

不是满的，我可以选 $c=(c_i)$ 落在像外（`01-reductions.tex:291`）。而一旦 $F$ 在每个标记纤维上等于 $f_m(w-c_i)^{m}$（`01-reductions.tex:320`），比较 $w^{m-1}$ 系数就得到 $(f_{m-1}(a_i))_i=-m f_m(c_i)_i$（`01-reductions.tex:324`），右边按构造不在像里，左边必须在。两条最高次系数就把平方情形连同等号一起吃掉。我看到这里的感觉是：等号的困难在 $w^{m}$ 与 $w^{m-1}$ 这两项上，剩下的项根本不重要。

转折三：把法向坐标换掉，即 $w=\sigma_P v$。`02-elliptic.tex:31` 到 `02-elliptic.tex:33` 用 $\sigma_P$ 把 $A\to M$ 拉成 $w=\sigma_P v$，并在 `02-elliptic.tex:91` 定义 $\widetilde F(v)=\sigma_P^{-m}F(\sigma_P v)$。这一步的效果是"九个零位移"从假设变成了空间本身的定义：`02-elliptic.tex:60` 写"The nine zero displacements are now built into $\W$"。原本 $f_j$ 要带 $(m-j)P$ 的零点（`01-reductions.tex:345`），换坐标后前 $m+1$ 个系数块统统落在同一个次数 $h=3(d-3m)$ 的丛上（`02-elliptic.tex:245` 与 `02-elliptic.tex:317`）。我第一次算这个统一次数时没意识到它有多重要，直到第 13 节要写极限矩阵的列指标集：列区间长度全部等于 $h$（`03-limits.tex:263`），多边形才可能是相似族 $\mathcal D_\lambda=\lambda\mathcal D_1$（`04-interpolation.tex:172`）。

转折四：无理数从 $\tau\to0^{+}$ 的基里出来，曲线本身不提供它。我需要某处的实数参数扮演 $\sqrt r$，候选有三：模 $\tau$、点的位置指数 $x_i$、丛的乘子。文本选的是第三与第二个的组合：`02-elliptic.tex:299` 给出 $A=D(0,-\tau^{\rho_{*}})$，$\rho_{*}=3(\sqrt r-3)$（`02-elliptic.tex:238`）。于是 $\sqrt r$ 出现在 $A$ 的乘子里，而乘子决定了 Laurent 指数的区间端点 $U_j$（`03-limits.tex:234`）。我在 `03-limits.tex:247` 读到"These parameters are irrational"时才完全明白布局：$U_j$ 里 $\sqrt r$ 的系数是正整数 $d-3j$，其余部分有理，因为 $\Delta\in\mathbb Q$。无理性的功能被 `03-limits.tex:252` 的 $U_j\notin\Z$ 精确表达：指数区间 $(U_j,U_j+h)$ 的端点不落在整数上，于是整数点个数恰好是 $h$，行计数不会有端点歧义（`02-elliptic.tex:256` 那句"Rationality of $\Delta$ will keep the Laurent exponent intervals away from integral endpoints"是对称的另一半）。

转折五：把多边形收缩 $\lambda<1$，再用 $(d,m)$ 的公倍数吸收整数端点误差。这是我最喜欢的一个转折，因为它把"严格不等式"这一逻辑条件变成了"有空隙可收缩"这一几何条件。`introduction.tex:138` 到 `introduction.tex:142` 的表述是：$d/m$ 是有理数而 $r$ 非平方，所以 $d/m<\sqrt r$ 是严格的，缝隙允许收缩多边形；取原曲线的公倍数即可吸收行计数里的整数端点误差。具体形式在 `04-interpolation.tex:99` 与 `04-interpolation.tex:256`：先取 $\lambda$ 使 $\rho+\Delta\rho/9<\lambda a-9(1-\lambda)$，再要求 $q(1-\lambda)m\ge 1$。我起初以为 $\lambda$ 的选取与放大 $(d,m)$ 是两件事，读到 `04-interpolation.tex:320` 那句"replace $(d,m)$ by a common positive integral multiple large enough to satisfy (scaling)"才明白：$\lambda$ 只依赖 $r$、$d/m$、$\Delta$，放大 $(d,m)$ 时 $\lambda$ 完全不动，动的只有 $m$，于是 $q(1-\lambda)m\ge 1$ 是唯一可被公倍数满足的条件。整数端点误差 $+1$ 由 $q(1-\lambda)m$ 吸收（`04-interpolation.tex:285`）。

转折六：反证的方向。`04-interpolation.tex:324` 到 `04-interpolation.tex:329` 收尾时给出对撞：每个固定 $\tau$ 上 $J_\tau$ 有核（`03-limits.tex:47`），而所有充分小的 $\tau>0$ 上 $J_\tau$ 单射（`04-interpolation.tex:298`）。我一开始以为需要一个"极限处 $\tau=0$ 的论证"，实际只要两者在同一个 $\tau$ 上矛盾，所以整条链里没有任何一处需要在 $\tau=0$ 取值。这一点在第 2 节路线 E 里我已经吃过教训。

## 4 最终思路与最初设想的差异

我把最终链条写成一串，再和我的 $C_{0}$ 对比：$\mathsf U_r(d,m)$（全体构型）$\to$ 正规束多项式 $F(w)=\sum f_j w^{j}$ $\to$ 平方情形两条最高次系数 $\to$ 三次曲线九个零位移 $\to$ $d>3m$ $\to$ 换纤维坐标得 $\W_\tau$ $\to$ 定点碰撞得 $J_\tau$ 有核 $\to$ 归一化 theta 基得 $B_0=(K^{\ell}j^{b})$ $\to$ 多边形外包与水平切片 $\to$ 逐行插值得满列秩 $\to$ 公倍数放大 $\to$ 矛盾。

差异一：起点的"计数"退化成唯一一次的使用。`introduction.tex:23` 的系数计数在最终证明里出现两次：一次是猜尺度 $d=m\sqrt r$，一次是 `consequences.tex:69` 到 `consequences.tex:72` 证 Seshadri 常数的上界 $t\le 1/\sqrt r$，那里用的还是"条件数不超过 $r\binom{n+1}{2}$、而 $\binom{e_n+2}{2}$ 更大"。中间所有环节都不再依赖计数，而依赖重数条件之间的具体代数关系。我最初的 $C_{0}$ 把计数当引擎，最终它只是标尺。

差异二：我预想的"用一条测试曲线套上界"没有出现，取而代之的是"用一族曲线做矛盾"。平方情形用的测试对象是 $B$ 上的求值映射（`01-reductions.tex:294`），非平方情形用的是 $q$ 个点在一条坐标盘里的碰撞（`03-limits.tex:52`）。前者是线性代数的余维论证，后者是解析的一致收敛论证，两者都不涉及某个具体高重数曲线。

差异三：我猜 $\sqrt r$ 会从周期或模空间里出现，实际它从丛的乘子里出现。$A=D(0,-\tau^{\rho_{*}})$（`02-elliptic.tex:299`）把 $\rho_{*}=3(\sqrt r-3)$ 写进了一个平凡度丛的 transition 常数里，`02-elliptic.tex:304` 还特别强调"保留这些 $\tau$ 的幂次原样写出来，不把它们换成同构的表示"。这个保留是全文最微妙的一步：同构类相同但乘子不同的两个丛，给出的 Laurent 区间端点不同，因而整数点分布不同。我最初完全没料到"表示方式"会有数学内容。

差异四：我原本以为解析部分是"取极限"，实际是"逐点存在加数值矩阵比较"。`03-limits.tex:373` 到 `03-limits.tex:377` 与 `04-interpolation.tex:328` 到 `04-interpolation.tex:329` 两处重复声明"碰撞在每个固定曲线上做，不需要同时选择核向量"。我把它读成作者对自己上一版论证的更正。

差异五：定理陈述比我预期的强。`main.tex:36` 到 `main.tex:40` 的摘要强调不等式对所有曲线同时成立，包括可约与非约化曲线，`04-interpolation.tex:336` 也重申结论包含可约与非约化的有效曲线。我的初始设想一直停留在既约约化曲线，因为重数条件是对约化点提的。Lean 侧把这个差别写得很硬：`Nagata.lean:17` 的 docstring 说"no square-only, equal-multiplicity, degree, or reducedness restriction is added"，`Nagata.lean:65` 到 `Nagata.lean:67` 又重复"reducible curves and repeated components remain quantified"。

差异六：$r\ge 10$ 的必然性我原本归因于"$\sqrt{10}$ 是第一个非平方临界值"，实际更朴素：$r\ge 10$ 同时保证 $q=r-9\ge 1$（碰撞需要额外点，`01-reductions.tex:378` 那句"this is possible because $r\ge 10$"）与 $h^{0}(B,M)<r$ 在平方情形可用（`01-reductions.tex:287` 在 $k\ge 4$ 时成立）。两个需求恰好都卡在 10。

差异七：最终证明需要一个我没设想过的"缩放引理"。`04-interpolation.tex:255` 的条件 $q(1-\lambda)m\ge 1$ 在 $(d,m)$ 放大时线性增长，而所有其他量（$\rho$、$\rho_{*}$、$\Delta$、$\lambda$、$x_i$、$\eta$）在公倍数下不变（`02-elliptic.tex:268` 到 `02-elliptic.tex:272`）。这种"只放大一个量、其余冻结"的结构是解析几何里少见的奢侈，它来自整条链只用 $d/m$ 与 $m$ 两个数。

后面第 5 节到第 17 节逐段展开这些差异的技术内容，第 18 节是 Lean 侧登记与 import 链，第 20 节是数值台账。前向引用只做三次：第 2 节指向第 5、6、10、12、13 节，第 3 节指向第 6、12、13 节，第 4 节指向第 5 到第 20 节，全部有实节。

## 5 通用重数系统与循环乘积

$\mathsf U_r(d,m)$ 在 `01-reductions.tex:20` 到 `01-reductions.tex:28` 用一行公式定义：对 $U_r$ 里每个元组 $(p_1,\dots,p_r)$ 都存在非零 $d$ 次齐次形式 $S$，使得 $\mult_{p_i}(S)\ge m$ 对全部 $i$ 成立。我把它当"黑箱"用之前先确认三件事。

第一件：$U_r$ 本身是 $(\Pp^{2}_{\C})^{r}$ 去掉所有对角线（`introduction.tex:13`），所以"点互异"是唯一约束，允许共线，允许落在一条低次曲线上。这点在 `03-limits.tex` 的碰撞里被反复利用，因为碰撞后的 $q$ 个点全部落在同一条坐标线 $y=0$ 上（`02-elliptic.tex:341`）。

第二件：重数的定义。`introduction.tex:16` 到 `introduction.tex:17` 说点是局部环里形式的阶，`01-reductions.tex:10` 到 `01-reductions.tex:15` 补充了框架无关性：换局部平凡化等于乘一个单位，阶不变；代数阶与全纯阶一致；全纯坐标变换保持阶。这条不变性是 `01-reductions.tex:61` 那句"Invariance of order makes these rank conditions agree on overlaps"的依据，也是第 6 节里我用全纯坐标 $(\zeta,t)$ 做极限时不担心定义漂移的依据。

第三件：闭性。$A_{e,\mathbf n}$ 由 Taylor 系数矩阵的满列余子式定义（`01-reductions.tex:53` 到 `01-reductions.tex:62`），矩阵有 $\binom{e+2}{2}$ 列（`01-reductions.tex:55`），元素是点坐标的整系数多项式（`01-reductions.tex:57`）。存在非零形式等价于列秩不满（`01-reductions.tex:58`）。我特别记下 `01-reductions.tex:60` 那句"if there are fewer rows than columns, the condition is automatic"：行数不足时 $A_{e,\mathbf n}=U_r$ 是全体，这类指标对是"真正存在系统"的候选，其余指标对定义真闭集。

引理 `01-reductions.tex:32` 到 `01-reductions.tex:48` 的结构我复述成三段。第一段构造 $E_r$：取所有真 $A_{e,\mathbf n}$ 的并（`01-reductions.tex:65`），可数（`01-reductions.tex:66`）。第二段证补集非空：在每个真 $A_{e,\mathbf n}$ 上选一个 $\mathbb Q$ 上非零的极小式（`01-reductions.tex:67`），取 $2r$ 个 $\mathbb Q$ 代数无关复数当坐标（`01-reductions.tex:69`），逐个可选成功是因为可数域的代数闭包仍可数（`01-reductions.tex:71`）。第三段是循环乘积：设坏元组在 $E_r$ 外，则 $A_{d_0,\mathbf m}=U_r$（`01-reductions.tex:75`）；对 $\mathbf m$ 的每个循环移位各取一个非零形式并相乘（`01-reductions.tex:78` 到 `01-reductions.tex:81`），阶相加因为初始 Taylor 项之积非零（`01-reductions.tex:82`），得到

$$
d=r d_0,\qquad m=\sum_{i=1}^{r}m_i,\qquad \frac{d}{m}=\frac{r d_0}{\sum_i m_i}\le\sqrt r,
$$

其中最后一步正是违反假设 $d_0\sqrt r\le\sum m_i$ 的改写（`01-reductions.tex:91` 到 `01-reductions.tex:95`）。

我对这一步的细节核对了两处。一是 $m>0$：`01-reductions.tex:90` 说违反假设使 $m>0$，我确认这是因为若所有 $m_i=0$ 则 $d_0\sqrt r\le 0$ 与 $d_0\ge 1$ 矛盾。二是幂次封闭：$\mathsf U_r(d,m)$ 蕴含 $\mathsf U_r(Nd,Nm)$（`01-reductions.tex:45`），来自把形式取 $N$ 次幂（`01-reductions.tex:97`），这是第 16 节放大 $(d,m)$ 的合法来源。

最后我要指出 `01-reductions.tex:47` 那句"to prove Theorem 1.1 for a fixed $r$, it suffices to rule out every $\mathsf U_r(d,m)$ with $d/m\le\sqrt r$"在逻辑上的分量：它把"对 very general 点成立"换成了"对每个构型都不存在"，此后我再不需要碰 $U_r$ 的拓扑，只需对每个 $(d,m)$ 单独导出矛盾。第 6 节之后全文都在做这件事。

## 6 正规束上的必要多项式

载体曲线的选取自由来自 `01-reductions.tex:104`：取 $B\subseteq\Pp^{2}$ 光滑不可约、次数 $k\ge 1$，固定一个非零齐次方程 $G_B$，令

$$
L=\mathcal O_B(1),\qquad M=L^{k},
$$

那么 $G_B$ 把 $B$ 在 $\Pp^{2}$ 里的正规丛识别为 $M$，文本用有效 Cartier 除子的公式引 Stacks Tag 0B3P（`01-reductions.tex:110`）。局部框架 $e$ 下 $t=G_B/e^{k}$ 把法向量与"对 $t$ 的导数"认同（`01-reductions.tex:112`）。我在 `01-reductions.tex:114` 到 `01-reductions.tex:117` 核对了一个容易出错的事：$f_j$ 是 $L^{d-kj}$ 的截面时，$f_j(a)w^{j}$ 对 $w\in M_a$ 取值在 $L_a^{d}$，所以多项式 $F$ 本质上是 $\Tot(M)$ 上 $L^{d}$ 拉回的截面，各项都在同一个值丛里，写法则依赖框架。这句话解释了为什么第 13 节的极限矩阵可以用标量表达式来做。

命题 `01-reductions.tex:119` 到 `01-reductions.tex:131` 的结论是：若 $\mathsf U_r(d,m)$ 成立，则对 $B$ 上任意互异点 $a_1,\dots,a_r$ 与任意 $c_i\in M_{a_i}$，存在非零多项式

$$
F(w)=\sum_{j=0}^{\lfloor d/k\rfloor}f_j w^{j},\qquad f_j\in H^{0}(B,L^{d-kj}),
$$

在每个 $(a_i,c_i)\in\Tot(M)$ 处重数至少 $m$，且系数可取代数截面。它的证明我拆成六个动作，因为第六个动作（保重数）差点被我漏掉。

动作一：造移动点。对每个 $i$ 在 $a_i$ 附近选仿射图与标准框架，$t_i$ 的微分非零（光滑性），所以可以选仿射切向量 $V_i$ 使 $dt_i(V_i)=c_i$（`01-reductions.tex:138` 到 `01-reductions.tex:139`）。令 $p_i(s)=a_i+sV_i$（`01-reductions.tex:142`），则 $p_i(s)$ 关于 $s$ 有理、$s$ 足够小时互异，并且 $\lim_{s\to0}t_i(p_i(s))/s=c_i$（`01-reductions.tex:146`）。这里的自由度我数了一遍：$c_i$ 是复数（法向纤维是一维），$V_i$ 只需满足一个线性条件，因此总可以选到。

动作二：在 $\C(s)$ 上解线性方程组。"在 $p_i(s)$ 处重数至少 $m$"对 $d$ 次形式的系数给出 $\C(s)$ 上的齐次线性方程组（`01-reductions.tex:151`）。它必须有非零解：否则某个满列余子式是非零有理函数，在一般复数 $s$ 处列秩满，与 $\mathsf U_r(d,m)$ 矛盾（`01-reductions.tex:153` 到 `01-reductions.tex:155`）。我在这个反证上停了很久，因为它用到"对每个构型都有解"这一强假设，是转折一的具体兑现。

动作三：清分母并取最低阶。把非零有理解清分母，再除以多项式系数的最大公 $s$ 幂次，得到有限阶的多项式族

$$
S(s)=\sum_{\alpha\ge0}s^{\alpha}S_{\alpha},\qquad S_0\ne 0
$$

（`01-reductions.tex:157` 到 `01-reductions.tex:163`），它对一般 $s$ 满足重数要求。注意 $S_0\ne0$ 是关键，否则整族为零。

动作四：沿 $B$ 分解。对每个非零 $S_\alpha$ 提出 $G_B$ 的最大幂次：$S_\alpha=G_B^{j_\alpha}R_\alpha$，$0\le j_\alpha\le\lfloor d/k\rfloor$（`01-reductions.tex:166` 到 `01-reductions.tex:170`）。$R_\alpha$ 次数 $d-k j_\alpha$ 且 $R_\alpha|_B\ne0$，依据是 $B$ 的齐次理想由 $G_B$ 生成（`01-reductions.tex:171`）。

动作五：按对角线求和。令 $u=\min_{S_\alpha\ne0}(\alpha+j_\alpha)$，取

$$
F(w)=\sum_{\alpha+j_\alpha=u}(R_\alpha|_B)\,w^{j_\alpha}
$$

（`01-reductions.tex:175` 到 `01-reductions.tex:179`）。非空且各项指数 $j_\alpha$ 互异（因为 $\alpha+j_\alpha=u$ 固定），故 $F\ne0$。我第一次读时以为求和指标是 $j$，实际是满足 $\alpha+j_\alpha=u$ 的 $\alpha$，一个对角线切片；这个细节保证 $F$ 非零。

动作六：识别成法向极限并传重数。局部取 $(\zeta,t)$ 为曲面坐标（$\zeta$ 是 $B$ 上坐标的扩张，`01-reductions.tex:186` 到 `01-reductions.tex:188`），$r_\alpha(\zeta,t)$ 是 $R_\alpha$ 在框架 $e^{d-kj_\alpha}$ 下的标量表达式。代入 $t=sw$ 并除以 $s^{u}$：

$$
\Phi(s,\zeta,w)=\sum_{S_\alpha\ne0}s^{\alpha+j_\alpha-u}w^{j_\alpha}r_\alpha(\zeta,sw)
$$

（`01-reductions.tex:192` 到 `01-reductions.tex:196`）。所有 $s$ 指数非负，故 $\Phi$ 全纯延拓到 $s=0$，其值正是 $F$（`01-reductions.tex:197` 到 `01-reductions.tex:200`）。框架变换 $e'=a(\zeta,t)e$ 给出 $t'=a^{-k}t$、截面标量乘 $a^{-d}$，代 $t=sw$ 后在 $s=0$ 处变成 $w'=a(\zeta,0)^{-k}w$ 与 $F'=a(\zeta,0)^{-d}F$（`01-reductions.tex:203` 到 `01-reductions.tex:210`），恰好是 $M$ 与 $L^{d}$ 拉回的变换律，所以 $F$ 是内蕴对象。$\zeta$ 的扩张方式改变在 $s=0$ 处退化为 $B$ 上的坐标变换（`01-reductions.tex:212`），因为它含因子 $t=sw$。

传重数：$\zeta_i(s)=\zeta(p_i(s))$ 与 $w_i(s)=t_i(p_i(s))/s$ 全纯延拓到 $s=0$，值分别是 $a_i$ 与 $c_i$（`01-reductions.tex:218` 到 `01-reductions.tex:224`）；把 $\Phi$ 平移到提升后的动点

$$
\Psi_i(s,\xi,\omega)=\Phi\bigl(s,\zeta_i(s)+\xi,\;w_i(s)+\omega\bigr)
$$

（`01-reductions.tex:226`）。对一般非零 $s$，$t=sw$ 是局部双全纯、乘 $s^{-u}$ 是乘非零常数，所以重数假设给出

$$
\partial_\xi^{a}\partial_\omega^{b}\Psi_i(s,0,0)=0\qquad(a,b\ge0,\ a+b<m)
$$

（`01-reductions.tex:233` 到 `01-reductions.tex:237`）。每个表达式在 $s=0$ 全纯且对一般非零 $s$ 为零，故在 $s=0$ 也为零，而这就是 $F$ 在 $(a_i,c_i)$ 的 $m$ 阶条件（`01-reductions.tex:238` 到 `01-reductions.tex:240`）。

我把这套机器总结成一句话：先在移动点上解方程组，再取 $s=0$ 的最低阶切面，最后用"全纯且对一般 $s$ 为零"把微分条件搬到极限上。第三步到第六步里没有任何代数几何的重器，全靠 `01-reductions.tex:14` 那句"代数阶与全纯阶一致"作许可证。

有一处我核算过才算放心：$F$ 的最高可能次数是 $\lfloor d/k\rfloor$，因为 $G_B^{j}$ 整除 $S_\alpha$ 时 $kj\le d$（`01-reductions.tex:169`）。第 7 节里 $j\le\lfloor d/k\rfloor\le m$ 这条链的第一个不等号就是它。

## 7 平方情形的两条最高次系数

命题 `01-reductions.tex:253` 到 `01-reductions.tex:257`：$r=k^{2}$、$k\ge4$ 时不存在正整数 $(d,m)$ 满足 $d\le km$ 且 $\mathsf U_r(d,m)$。

预备事实两条。非零线丛截面的零点除子次数等于丛的次数，故零度丛有非零截面当且仅当它平凡（`01-reductions.tex:245` 到 `01-reductions.tex:247`）。正 genus 的光滑复射影曲线 $\Pic^{0}(B)$ 是复环面，其任意固定阶元素的子群有限，故挠子群可数（`01-reductions.tex:249` 到 `01-reductions.tex:251`，引 Stacks Tag 0C1Z）。

选点。取光滑 $k$ 次曲线 $B$，例如 Fermat 曲线，其 genus 为 $(k-1)(k-2)/2>0$，$\deg M=k^{2}=r$（`01-reductions.tex:263` 到 `01-reductions.tex:265`）。选互异 $a_1,\dots,a_r$ 使 $P=\sum a_i$ 对应的零度丛

$$
A=M(-P)
$$

非挠（`01-reductions.tex:267`）。可行性论证我逐句核对：固定前 $r-1$ 个点、动最后一点；$a\mapsto\mathcal O_B(a)$ 在正 genus 曲线上单射，因为两个不同单点若线性等价会给出恰有一个单极点的非常值亚纯函数，即次数 1 到 $\Pp^{1}$ 的映射，从而曲线有理（`01-reductions.tex:271` 到 `01-reductions.tex:275`）。动一点给出不可数多个不同丛，而挠丛可数，另外要避开的限制只有有限个重合（`01-reductions.tex:276`）。

选位移。正合列

$$
0\to\mathcal O_{\Pp^{2}}\xrightarrow{\;G_B\;}\mathcal O_{\Pp^{2}}(k)\to\mathcal O_B(k)\to0
$$

配上 $H^{1}(\Pp^{2},\mathcal O_{\Pp^{2}})=0$（Stacks Tag 01XT，`01-reductions.tex:285`）给出

$$
h^{0}(B,M)=\binom{k+2}{2}-1=\frac{k^{2}+3k}{2}<k^{2}=r,
$$

于是求值映射 $H^{0}(B,M)\to\bigoplus_{i}M_{a_i}$ 的像不填满，取 $c=(c_i)$ 在像外（`01-reductions.tex:287` 到 `01-reductions.tex:295`）。这里我把 $(k^{2}+3k)/2<k^{2}$ 单独解了一次：等价于 $3k<k^{2}$，即 $k\ge4$。$k=3$（$r=9$）时两边都是 $9$，不等号失效，而这正是九个点上有三次曲线的老故事；$k=2$ 时 $5>4$ 也失效。这个代数量让我确信命题 $k\ge4$ 的假设是精确的，与我此前猜的"技术上需要 $k$ 大一点"无关。

反证主体。设 $j$ 是 $F$ 的最大非零指数，$j\le\lfloor d/k\rfloor\le m$（`01-reductions.tex:298` 到 `01-reductions.tex:299`）。若 $j<m$：对局部纤维坐标求 $j$ 次导，最大性使结果与纤维坐标无关，等于 $j!f_j$（`01-reductions.tex:300` 到 `01-reductions.tex:301`）；求导最多降 $j$ 阶，所以 $f_j$ 在每个 $a_i$ 处基底消没阶至少 $m-j$（`01-reductions.tex:303`）。而

$$
\deg L^{d-kj}=k(d-kj)\le k^{2}(m-j)=r(m-j)
$$

（`01-reductions.tex:304` 到 `01-reductions.tex:306`）。不等号与所要求零点个数 incompatible：截面零点总次数不能超过丛的次数，所以必须有等号 $d=km$，此时去掉零点得 $A^{m-j}=L^{k(m-j)}(-(m-j)P)$ 的非零截面（`01-reductions.tex:308` 到 `01-reductions.tex:311`）。$A$ 非挠且 $m-j>0$，故 $A^{m-j}$ 是非平凡零度丛，无非零截面（`01-reductions.tex:312`）。于是 $j<m$ 不可能。

剩下 $j=m$ 与 $d=km$，此时 $f_m$ 是非零常数。在每个标记纤维上 $F$ 限制成首项系数为 $f_m$ 的 $m$ 次多项式，在 $c_i$ 处有 $m$ 重零，故 $F|_{M_{a_i}}(w)=f_m(w-c_i)^{m}$（`01-reductions.tex:315` 到 `01-reductions.tex:321`）。比较 $w^{m-1}$ 系数：

$$
\bigl(f_{m-1}(a_i)\bigr)_i=-m f_m (c_i)_i
$$

（`01-reductions.tex:322` 到 `01-reductions.tex:325`）。左边是 $f_{m-1}\in H^{0}(B,M)$ 的求值，落在像里；右边是非零标量 $-m f_m$ 乘 $c$，像在外（`01-reductions.tex:326` 到 `01-reductions.tex:328`）。矛盾。

我在这一节学到的方法论有两点。第一，最高次项与次高次项承担全部信息：$w^{m}$ 项定出 $d=km$ 与 $f_m$ 常数，$w^{m-1}$ 项定出求值像的成员资格，其余 $f_j$ 完全没用上。第二，"选 $c$ 在像外"这个自由度是维数赤字 $r-h^{0}(B,M)$ 的直接产物，而赤字 $(k^{2}-3k)/2$ 在 $k=4$ 时是 $2$，已经足够。平方情形因此在 $r=16$ 就完全成立，比 Nagata 原文的 $r\ge16$（`introduction.tex:8`）用的是同一个门槛，但这里的论证只在 $k\ge4$，与我第 8 节要处理的 $r\ge10$ 形成对照。

第 17 节还要用到 $r=k^{2}$ 情形的另一面：$N_r=\sqrt r H-\sum E_i$ 严格 nef 且 $N_r^{2}=0$。平方时 $\sqrt r=k$ 是整数，类的整系数性让它落在 $\NS$ 里；非平方时它只在 $\NS\otimes\R$ 里，`introduction.tex:77` 提到 Ciliberto--Miranda--Roe 2026 已在每个 $r\ge10$ 非常一般点构造出无理平零 nef 射线，但不决定等权多点 Seshadri 常数（`introduction.tex:78` 到 `introduction.tex:81`）。这个对比告诉我，本文真正的新内容在"$\sqrt r\,H-\sum E_i$ 里那个等权系数"上。

## 8 九个零位移与 $d>3m$

非平方情形的全部 machinery 从一小段计算开始，写在 `01-reductions.tex:335` 到 `01-reductions.tex:353`。取 $k=3$、九个互异点 $a_1,\dots,a_9$ 且位移取零，$P=\sum_{i\le9}a_i$，并把系数表补零成 $f_j=0$（$j>\lfloor d/3\rfloor$）。在 $(a_i,0)$ 处按纤维变量展开，重数至少 $m$ 意味着

$$
f_j\in H^{0}\bigl(B,L^{d-3j}(-(m-j)P)\bigr)\qquad(0\le j<m)
$$

（`01-reductions.tex:343` 到 `01-reductions.tex:347`）。理由只有一句：局部基底坐标 $\zeta$ 下 $\zeta^{a}w^{j}$ 的系数在 $a+j<m$ 时必须为零（`01-reductions.tex:348` 到 `01-reductions.tex:349`），故 $f_j$ 在 $P$ 的每一点有阶至少 $m-j$。

我把这条式的意义重写了三遍才接受：$w^{j}$ 项的 $j$ 越大，被要求零点越少，而它的丛次数越小（因为 $d-3j$）。两项刚好互相抵消：

$$
\deg L^{d-3j}(-(m-j)P)=3(d-3j)-9(m-j)=3(d-3m),
$$

与 $j$ 无关（`01-reductions.tex:351` 到 `01-reductions.tex:353`）。这个恒等式是第 9 节换坐标的动机，也是"取三次曲线"的深层原因：只有 $k^{2}=3k$ 不对、而 $k^{2}=9$ 与 $k=3$ 之间差 $6$ 恰好被 $3\times$（次数损失）匹配。我按一般 $k$ 复算过：$\deg L^{d-kj}(-(m-j)k^{2}\text{ 点})=k(d-kj)-k^{2}(m-j)=k(d-km)$ 也与 $j$ 无关，所以恒等式对任何 $k$ 都成立，$k=3$ 的特权在第 2 节路线 D 里说过的完备性上，与此处无关。这一点我在草稿里写错过一次，以为平衡是三次曲线独有，核对后改成一般 $k$ 都平衡。

引理 `01-reductions.tex:355` 到 `01-reductions.tex:359`：$r\ge10$ 且 $\mathsf U_r(d,m)$ 成立则 $d>3m$。两个案子。

案子一 $d<3m$：取光滑三次曲线与九个零位移点，再补到 $r$ 个互异基底与任意后续位移（`01-reductions.tex:362` 到 `01-reductions.tex:364`）。$F$ 出现的每个指数都 $<m$，而该指数按上面被要求至少 $9(m-j)$ 个零点，但

$$
\deg L^{d-3j}=3(d-3j)<9(m-j)
$$

（`01-reductions.tex:367` 到 `01-reductions.tex:370`）。不等号化简后是 $d-3j<3m-3j$，即 $d<3m$，与 $j$ 无关，所以每个系数都是零截面，与命题给的 $F\ne0$ 矛盾。我特别记下"与 $j$ 无关"这个事实：它意味着不存在某个中间阶侥幸存活。

案子二 $d=3m$：九个点的选取升级为让 $A=L^{3}(-P)$ 非挠，方法与平方情形相同（`01-reductions.tex:374` 到 `01-reductions.tex:376`）。然后补到 $r$ 个互异基底，并给第十个点选非零向量 $c_{10}\in M_{a_{10}}$，可行性正是 $r\ge10$（`01-reductions.tex:376` 到 `01-reductions.tex:378`）。前九个零位移使 $j<m$ 的系数落在 $A^{m-j}$，非平凡零度丛，故全零；于是 $F(w)=f_m w^{m}$，$f_m$ 非零常数（`01-reductions.tex:380` 到 `01-reductions.tex:384`）。它在 $(a_{10},c_{10})$ 非零，不可能有重数 $\ge m\ge1$，矛盾（`01-reductions.tex:385` 到 `01-reductions.tex:386`）。

这一小节里我改动过的错误设想是"等号 $d=3m$ 应当由 $d<3m$ 的论证加一个极限步骤处理"。实际它需要一个额外的非零位移点，而 $r\ge10$ 的全部作用就在这里。平方情形同样在等号 $d=km$ 上用了"像外"的 $c$，两处结构完全平行：等号处必须动用一次自由度。第 11 节里我还要第三次看到这个平行，因为 $h>0$ 等价于 $d>3m$，而 $h$ 是之后所有次数正的丛的次数。

## 9 把九个规定零点做进空间里

第 8 节留下的东西是一串必要条件 $f_j\in H^{0}(B,L^{d-3j}(-(m-j)P))$。把它们当约束处理很难，因为约束随 $j$ 变；把它们做进空间的定义里就容易，因为定义完的块次数全部相同。这就是 `02-elliptic.tex:18` 到 `02-elliptic.tex:105` 的内容。

设定在 `02-elliptic.tex:21` 到 `02-elliptic.tex:28`：$d,m$ 是任意满足 $d>3m$ 的正整数，$B$ 光滑三次，$L=\mathcal O_B(1)$、$M=L^{3}$，九个互异点构成 $P$，$\sigma_P$ 是 $\mathcal O_B(P)$ 的典范截面（零点除子为 $P$），并写

$$
A=M\otimes\mathcal O_B(-P),\qquad T=L^{d-3m},\qquad u_0=\lfloor d/3\rfloor .
$$

于是 $\deg A=0$、$\deg T=3(d-3m)>0$（`02-elliptic.tex:29`）。乘 $\sigma_P$ 给出丛映射 $A\to M$，记作 $w=\sigma_P v$，在 $B\setminus P$ 上可逆（`02-elliptic.tex:30` 到 `02-elliptic.tex:33`）。系数空间分两段定义（`02-elliptic.tex:36` 到 `02-elliptic.tex:43`）：

$$
V_j=\begin{cases}H^{0}(B,T\otimes A^{m-j}),&0\le j\le m,\\[1mm]
\sigma_P^{\,j-m}H^{0}(B,L^{d-3j}),&m<j\le u_0,\end{cases}
$$

负幂表示对偶幂。第二段的目标丛是对的，因为

$$
L^{d-3j}\otimes\mathcal O_B((j-m)P)=T\otimes A^{m-j}
$$

（`02-elliptic.tex:45` 到 `02-elliptic.tex:48`）。我手工验了一遍：右边 $=L^{3}\otimes\mathcal O(-P)^{m-j}\otimes L^{d-3m}=L^{d-3j}\otimes\mathcal O((j-m)P)$，成立。乘 $\sigma_P^{j-m}$ 单射，可在 $B\setminus P$ 上验证（`02-elliptic.tex:49`）。

$\W$ 是 $\Tot(A)$ 上取值在 $T\otimes A^{m}=L^{d}(-mP)$ 拉回里的多项式截面

$$
\widetilde F(v)=\sum_{j=0}^{u_0}g_j v^{j},\qquad g_j\in V_j
$$

（`02-elliptic.tex:50` 到 `02-elliptic.tex:55`）。有限维性的理由写在 `02-elliptic.tex:56` 到 `02-elliptic.tex:58`：系数块是紧曲线上截面空间，不同纤维幂次使和为直和。

关键的一句在 `02-elliptic.tex:60`："The nine zero displacements are now built into $\W$"。于是剩余的 $q=r-9$ 个点只需提普通重数，且提在标量纤维坐标 $1$ 处。命题 `02-elliptic.tex:64` 到 `02-elliptic.tex:73`：设 $r\ge10$、$d>3m$、$\mathsf U_r(d,m)$ 成立，按上述取 $B,P,A,\W$，在 $B\setminus P$ 内一个坐标盘上取全纯框架，则对该盘中任意 $q$ 个互异点 $b_1,\dots,b_q$，存在非零 $\widetilde F\in\W$ 在每个 $(b_\alpha,1)$ 处重数至少 $m$。

证明的四步我逐一对应到文本。第一步用第 6 节的命题，点取 $a_1,\dots,a_9,b_1,\dots,b_q$，在 $a_i$ 处位移取零，在 $b_\alpha$ 处取"框架中标量坐标 $1$ 那个向量乘 $\sigma_P$ 的像"（`02-elliptic.tex:76` 到 `02-elliptic.tex:80`）；这里用到的正是命题允许任意法向量。第二步得 $F(w)=\sum f_j w^{j}$，$f_j\in H^{0}(B,L^{d-3j})$，带所需重数（`02-elliptic.tex:82` 到 `02-elliptic.tex:86`）。第三步由九零点条件，$j<m$ 时 $f_j$ 沿 $(m-j)P$ 消没（`02-elliptic.tex:88`），于是

$$
\widetilde F(v)=\sigma_P^{-m}F(\sigma_P v)=\sum_{j=0}^{u_0}f_j\sigma_P^{\,j-m}v^{j}
$$

跨过 $P$ 延拓，规定的零点把 $\sigma_P$ 的负幂抵消，系数正好是 $V_j$ 的形式（`02-elliptic.tex:90` 到 `02-elliptic.tex:96`）。第四步说 $\widetilde F\ne0$，因为纤维替换在 $B\setminus P$ 上可逆（`02-elliptic.tex:96` 到 `02-elliptic.tex:97`）。保序的理由写在 `02-elliptic.tex:99` 到 `02-elliptic.tex:104`：$w=\sigma_P v$ 在 $b_\alpha$ 附近是非奇异曲面坐标变换，$\sigma_P^{-m}$ 在局部框架里是全纯单位的乘法，两者都保持通常消没阶，并把位移点送到 $(b_\alpha,1)$。

我在这一节记下一个逻辑要点，它在 `02-elliptic.tex:12` 到 `02-elliptic.tex:16`：本节与第 12、13 节里 $H^{0}$ 表示全纯截面，而第 6 节给出的代数截面属于这些空间，所以排除全纯解就排除了必要的正规多项式。这是全纯机器能吃代数对象的唯一许可证，也是我读初稿时最容易忽略的一步。

## 10 乘性 theta、Laurent 递推与三次嵌入

解析部分的原材料在 `02-elliptic.tex:111` 到 `02-elliptic.tex:226`。我要的东西是：把 $D(n,\gamma)$ 的截面空间写成显式基，基元素在 $\tau\to0^{+}$ 时趋于 $z^{K}$ 型单项式，且我能跟踪每个基元素的 Laurent 支撑区间。乘性 theta 与剩余类基是经典内容，`introduction.tex:96` 与 `02-elliptic.tex:158` 都指到 Rosengren 的 arXiv 版第 1.2 节与练习 1.6.5，而文本声明"按论证需要的正规化把乘积恒等式、基公式与收敛估计都证一遍"（`02-elliptic.tex:98` 到 `02-elliptic.tex:99`）。我接受这个声明的理由在第 11 节末：真正被用到的是乘子，同构类不足以决定整数分布。

环面。$0<\tau<1$，

$$
X_\tau=\C^{*}/\tau^{\Z}\simeq\C/(2\pi\mathrm{i}\Z+(\log\tau)\Z)
$$

（`02-elliptic.tex:114` 到 `02-elliptic.tex:117`），一维连通紧复环面。丛。$n\in\Z$、$\gamma\in\C^{*}$，$D(n,\gamma)$ 由 $\C^{*}\times\C$ 模掉生成作用

$$
(z,t)\longmapsto(\tau z,\ \gamma z^{-n}t)
$$

（`02-elliptic.tex:119` 到 `02-elliptic.tex:124`）。覆盖空间框架下截面即满足 $f(\tau z)=\gamma z^{-n}f(z)$ 的全纯函数，普通乘法给出 $D(n,\gamma)\otimes D(n',\gamma')=D(n+n',\gamma\gamma')$（`02-elliptic.tex:126` 到 `02-elliptic.tex:133`）。

乘积。

$$
\Theta_\tau(z)=\prod_{p=0}^{\infty}(1-\tau^{p}z)\prod_{p=1}^{\infty}(1-\tau^{p}/z)
$$

（`02-elliptic.tex:137` 到 `02-elliptic.tex:141`）。收敛论证是每个紧致圆环上"因子减 $1$ 的绝对值之和"被几何级数控制（`02-elliptic.tex:142` 到 `02-elliptic.tex:145`），重排指标得 $\Theta(\tau z)=-z^{-1}\Theta(z)$（`02-elliptic.tex:147`）。零点恰为 $\tau^{\Z}$ 中的点，全部单重：每点恰有一个因子为零而其余乘积非零（`02-elliptic.tex:149` 到 `02-elliptic.tex:151`）。于是 $\Theta(z/a)$ 是 $D(1,-a)$ 的截面，除子是 $a$ 代表的点（`02-elliptic.tex:151` 到 `02-elliptic.tex:152`）；$n$ 个这样的截面相乘、参数之积取 $(-1)^{n}\gamma$，说明 $n>0$ 时 $D(n,\gamma)$ 次数为 $n$；张量与对偶给出所有整数 $n$，零度时用 $D(0,\gamma)=D(1,\gamma)\otimes D(1,1)^{-1}$（`02-elliptic.tex:153` 到 `02-elliptic.tex:156`）。

我核对过 $n=1$ 的乘子：$\Theta(\tau z)=-z^{-1}\Theta(z)$ 与 $f(\tau z)=\gamma z^{-n}f(z)$ 比对得 $n=1$、$\gamma=-1$，即 $D(1,-1)$，与 $a=1$ 时的 $D(1,-a)$ 一致。$D(1,1)$ 因此是"参数 $a=-1$"的情形，$\Theta(-z)$ 的除子代表 $-1\in\C^{*}$，这一点在第 11 节算 $A$ 的乘子时以 $(-1)^{m-j}$ 的形式回来找我。

引理（`02-elliptic.tex:162` 到 `02-elliptic.tex:178`）是这一节的核心。$n>0$ 时 $\dim H^{0}(X_\tau,D(n,\gamma))=n$；截面 $f(z)=\sum_{K}c_K z^{K}$ 的 Laurent 系数满足

$$
c_{K+n}=\gamma^{-1}\tau^{K}c_K,\qquad
c_{K+np}=c_K\gamma^{-p}\tau^{pK+np(p-1)/2}\quad(p\in\Z)
$$

（`02-elliptic.tex:168` 到 `02-elliptic.tex:172`）。每个模 $n$ 剩余类可自由指定一个系数，一次只指定一个非零起始系数就得到支撑在单个剩余类里的基。

我手算了递推的第二式：迭代第一式 $p$ 次，$c_{K+np}=c_K\gamma^{-p}\tau^{K+(K+n)+\cdots+(K+(p-1)n)}=c_K\gamma^{-p}\tau^{pK+n\cdot p(p-1)/2}$，与文本一致。$p<0$ 时同一迭代方向相反，指数公式仍成立，因为 $n p(p-1)/2$ 对负 $n p$ 的符号约定在文本里是统一按 $p\in\Z$ 写的。

收敛性（`02-elliptic.tex:186` 到 `02-elliptic.tex:195`）靠估计 $C\exp(-c p^{2}+C'\lvert p\rvert)$，$c>0$，来源是 $n>0$ 与 $\log\tau<0$；于是 Laurent 级数正规收敛并满足函数方程，$n$ 个自由系数加 Laurent 展开唯一性给出基断言。这条二次衰减是第 13 节所有估计的原型，那里换成显式指数 $ta+nt(t-1)/2$。

嵌入引理（`02-elliptic.tex:198` 到 `02-elliptic.tex:226`）说：任意 $\gamma\in\C^{*}$，$D(3,\gamma)$ 的完备截面空间把 $X_\tau$ 嵌入 $\Pp^{2}$ 为光滑不可约平面三次，$\mathcal O_{\Pp^{2}}(1)$ 拉回为 $D(3,\gamma)$。证明用了次数 $t\in\{1,2\}$ 的有效除子 $Q$：用 $Q$ 的 lifted 点（按重数）的 $t$ 个 theta 因子乘积是除子恰为 $Q$ 的截面，除以它把沿 $Q$ 消没的 $D(3,\gamma)$ 截面与某个 $D(3-t,\gamma')$ 截面认同，维数 $3-t$（`02-elliptic.tex:207` 到 `02-elliptic.tex:212`）。$t=1$ 给出无基点，两点情形给出分离，$Q=2p$ 时"沿 $p$ 消没"到"沿 $2p$ 消没"的维数跌落供出一个在 $p$ 处恰一阶的截面，它与在该点非零的截面之比导数非零，故映射是单射全纯浸入，紧性升级为嵌入（`02-elliptic.tex:214` 到 `02-elliptic.tex:220`）。Chow 定理把解析闭像变代数（`02-elliptic.tex:222`），像作为嵌入的连通紧曲面是光滑不可约，超平面丛拉回为三度的 $D(3,\gamma)$，故像为平面三次（`02-elliptic.tex:223` 到 `02-elliptic.tex:225`）。

我在这一段读出的设计意图是：整个第 10、11 节只依赖"$\mathcal O_B(1)$ 是完备的三度 theta 丛"。第 2 节路线 D 的失败点（$k\ge4$ 时完备性破）正是在这里致命：若 $\mathcal O_B(1)$ 的像只是 $H^{0}(B,\mathcal O_B(1))$ 的真子空间，第 13 节的列集合就不再等于完备线性系的 Laurent 支撑集，$\lvert\mathcal S\rvert=\dim\W_\tau$ 的恒等式作废。

## 11 曲线与标记点的解析选型

现在固定非平方 $r\ge10$ 与假想的 $\mathsf U_r(d,m)$（$d/m\le\sqrt r$）。$d/m$ 有理加上 $d>3m$ 给出 $3<d/m<\sqrt r$（`02-elliptic.tex:232`）。参数定义在 `02-elliptic.tex:234` 到 `02-elliptic.tex:246`：

$$
q=r-9,\qquad \rho=3(d/m-3),\qquad \rho_{*}=3(\sqrt r-3),\qquad
2\rho_{*}+\frac{\rho_{*}^{2}}{9}=q,
$$

以及 $h=3(d-3m)=m\rho>0$、$u_0=\lfloor d/3\rfloor\ge m$。我把最后一个恒等式自己展开验过：$\rho_{*}=3s-9$（记 $s=\sqrt r$）时 $2\rho_{*}+\rho_{*}^{2}/9=6s-18+(s^{2}-6s+9)=r-9$ 成立。这个等式在第 15 节还会以"切片高度区间长度 $=q(m\lambda-s)$"的形式出现一次，两处必须一致，我用它做了一次交叉校验。

$x_0=1/2$，取有理 $\Delta$ 满足 $0<\Delta<x_0$ 与 $\rho+\Delta\rho/9<\rho_{*}$（`02-elliptic.tex:248` 到 `02-elliptic.tex:254`）。文本说严格斜率差留出了选取区间，且 $\Delta$ 的有理性用来把 Laurent 指数区间远离整数端点（`02-elliptic.tex:255` 到 `02-elliptic.tex:257`）。我算了一下可行性：$\rho<\rho_{*}$ 已有空隙 $g=\rho_{*}-\rho=3(\sqrt r-d/m)>0$，取 $0<\Delta<9g/\rho$ 即满足第二式，同时 $\Delta<1/2$，所以这样的有理 $\Delta$ 存在。

九个实数 $x_i$ 满足

$$
0<x_i<x_0,\qquad \sum_{i=1}^{9}(x_0-x_i)=\Delta,\qquad
\eta=\frac{\sum_{i=1}^{9}x_i+\rho_{*}}{3},\qquad z_i=\tau^{x_i},\ z_0=\tau^{x_0}
$$

（`02-elliptic.tex:259` 到 `02-elliptic.tex:267`）。文本给的样例 $x_i=x_0-i\Delta/45$ 我代进去验算：$\sum_{i=1}^{9}(x_0-x_i)=\Delta\sum i/45=\Delta\cdot45/45=\Delta$，正确；最小者 $x_9=x_0-\Delta/5>0$ 由 $\Delta<1/2$ 保证。顺带得到第 12 节要用的 $\delta_P=\min_i\{x_0-x_i,1-(x_0-x_i)\}=\Delta/5$。

对 $\tau$ 的依赖方式我特别留意了：$\rho,\Delta,x_i,\eta$ 在 $(d,m)$ 同倍数放大时不变，而 $h,u_0$ 与系数空间依赖真实的对（`02-elliptic.tex:269` 到 `02-elliptic.tex:272`）。文本接着声明"在碰撞与随后的 $\tau$ 极限期间固定这一对"（`02-elliptic.tex:272`）。这就是第 3 节转折六与第 16 节放大的接口。

用嵌入引理把 $X_\tau$ 认成平面三次 $B$，全纯地 $L=\mathcal O_B(1)=D(3,\tau^{\eta})$、$M=L^{3}$（`02-elliptic.tex:274` 到 `02-elliptic.tex:278`）。$a_i$ 是 $z_i$ 代表的点，$P=\sum_{i\le9}a_i$；这些点与 $z_0$ 代表的点互异，理由是各指数落在 $(0,1)$ 内而两个 lift 代表同一点仅当指数差为整数（`02-elliptic.tex:279` 到 `02-elliptic.tex:282`）。覆盖空间框架下

$$
\Pi(z)=\prod_{i=1}^{9}\Theta(z/z_i)
$$

以 $P$ 为除子，给出 $\mathcal O_B(P)=D(9,-\tau^{\sum_i x_i})$ 的识别，典范截面 $\sigma_P$ 由 $\Pi(z)$ 表示（`02-elliptic.tex:284` 到 `02-elliptic.tex:293`）。我核对过这里的符号：每个因子 $\Theta(z/z_i)$ 属于 $D(1,-z_i)$，九个张量给 $D(9,(-1)^{9}\prod z_i)=D(9,-\tau^{\sum x_i})$，与文本一致，且 $(-1)^9=-1$ 是关键。

由 $3\eta=\sum_i x_i+\rho_{*}$ 得

$$
A=D(0,-\tau^{\rho_{*}}),\qquad \deg T=h,\qquad T\otimes A^{m}=L^{d}\otimes\mathcal O_B(-mP)
$$

（`02-elliptic.tex:297` 到 `02-elliptic.tex:301`）。$A$ 的乘子我算了两遍：$M=L^{3}=D(9,\tau^{3\eta})$，$\mathcal O_B(-P)=D(9,-\tau^{\sum x_i})^{-1}=D(-9,(-\tau^{\sum x_i})^{-1})$，张量给 $D(0,\tau^{3\eta}/(-\tau^{\sum x_i}))=D(0,-\tau^{3\eta-\sum x_i})=D(0,-\tau^{\rho_{*}})$，其中倒数与 $-1$ 合并成 $-1$ 用了 $(-1)^{-1}=-1$。$\sqrt r$ 就出现在这个乘子里。文本在 `02-elliptic.tex:303` 到 `02-elliptic.tex:305` 强调"保留写出来的 $\tau$ 幂，不做同构替换"，我之前把它当风格说明，第 13 节里它是必需的：$U_j$ 由乘子决定。

三次方程把 $B$ 的正规丛识别为 $M=L^{3}$，其微分在每点满射到法向纤维，所以覆盖空间框架里指定的每个标量都是第 6 节允许的位移，缩放的方程不影响这些选择（`02-elliptic.tex:307` 到 `02-elliptic.tex:313`）。这句把第 9 节"取标量坐标 $1$"的合法性钉死。所有构造都在每个固定 $\tau$ 上做，对 $\tau$ 的代数依赖不被要求（`02-elliptic.tex:313`）。

维数清单在 `02-elliptic.tex:315` 到 `02-elliptic.tex:320`：$\W_\tau$ 的前 $m+1$ 个系数块的次数与维数都是 $h$；$j>m$ 时维数是 $3(d-3j)$（当 $d-3j>0$），$d-3j=0$ 时为 $1$，后者用到 $H^{0}(B,\mathcal O_B)=\C$（$B$ 紧连通）。

局部图取在 $(z,v)=(z_0,1)$ 附近：

$$
z=z_0 e^{x},\qquad v=e^{y}
$$

（`02-elliptic.tex:323` 到 `02-elliptic.tex:326`），$x$-盘足够小以单射到 $B$ 并避开 $P$，$y$-盘足够小使 $e^{y}$ 单射。固定 $T\otimes A^{m}$ 的覆盖空间框架后标量表达式是

$$
\widetilde F(x,y)=\sum_{j=0}^{u_0}g_j(z_0 e^{x})e^{j y}
$$

（`02-elliptic.tex:329` 到 `02-elliptic.tex:335`），这里 $g_j(z)$ 表示其覆盖空间框架里的全纯函数，各项同丛。最后一击在 `02-elliptic.tex:337` 到 `02-elliptic.tex:343`：对每个固定 $\tau\in(0,1)$ 与足够靠近零的 $q$ 个互异位置 $\xi_1,\dots,\xi_q$，命题给出非零 $\widetilde F\in\W_\tau$ 在每个 $(x,y)=(\xi_\alpha,0)$ 处重数至少 $m$（$v=1$ 对应 $y=0$）。存在性逐点关于 $\tau$ 与位置元组，"碰撞不使用任何同时的截面选择"。我把这句话与第 2 节路线 E 放在一起读：作者两次拒绝同时选择，一次在核向量上，一次在截面上。

## 12 定点碰撞与 $J_\tau$ 的核

第 12 节做一件事：把 $q$ 个分散点的重数条件压缩成一点上的导数条件，并说明压缩后的线性映射必有核。`03-limits.tex:12` 到 `03-limits.tex:15` 先声明所有选择（$d,m,q,h,u_0$ 与 $\rho,\rho_{*},\Delta,x_i,x_0,\eta$）保持固定，碰撞在 $\tau$ 固定时发生，发生在 $\tau$ 的矩阵极限之前。这个次序是我在第 2 节路线 E 上摔过的位置。

标量表达式与映射。$F\in\W_\tau$ 系数为 $g_j$ 时

$$
H_F(x,y)=\sum_{j=0}^{u_0}g_j(z_0 e^{x})e^{j y}
$$

（`03-limits.tex:25` 到 `03-limits.tex:28`）。指标集与映射定义为

$$
\mathcal I=\{(\ell,b)\in\Z_{\ge0}^{2}:\ 0\le b<m,\ 0\le\ell<q(m-b)\},\qquad
(J_\tau F)_{\ell,b}=\partial_x^{\ell}\partial_y^{b}H_F(0,0)
$$

（`03-limits.tex:30` 到 `03-limits.tex:41`）。`03-limits.tex:42` 补了一句要紧的话：取这些导数时值丛用同一个固定局部框架表示。少了这句话，导数就不是坐标。

引理（`03-limits.tex:45` 到 `03-limits.tex:49`）：$\mathsf U_r(d,m)$ 成立则每个固定 $\tau\in(0,1)$ 上 $\ker J_\tau\ne\{0\}$。证明里我把三个技术点分开看。

第一点是紧性论证：取趋于零的互异元组序列 $(\xi_{1,\nu},\dots,\xi_{q,\nu})$，由第 9 节命题得非零 $F_\nu\in\W_\tau$；在有限维空间 $\W_\tau$ 里取基并把系数向量规格化成欧氏范数 $1$，子列收敛到单位向量，因而 $F_0\ne0$（`03-limits.tex:52` 到 `03-limits.tex:65`）。规格化能成立依赖系数块成直和（`03-limits.tex:62` 到 `03-limits.tex:63`），这是第 9 节直和断言的第二次兑现。基与图固定，系数收敛给 $H_{F_\nu}$ 及其所有导数的局部一致收敛。

第二点是逐 $b$ 的一元函数。令 $h_{b,\nu}(x)=\partial_y^{b}H_{F_\nu}(x,0)$、$h_{b,0}$ 同理（`03-limits.tex:67` 到 `03-limits.tex:71`）。在 $(\xi_{a,\nu},0)$ 处重数至少 $m$ 意味着 $\ord_{\xi_{a,\nu}}h_{b,\nu}\ge m-b$（`03-limits.tex:73` 到 `03-limits.tex:75`）。这里我核对过一个逻辑缺口：为什么重数 $m$ 会给出"对 $y$ 求 $b$ 阶导后在 $y=0$ 的一元函数有阶 $m-b$"？答案在第 6 节开头（`01-reductions.tex:12` 到 `01-reductions.tex:14`），$m$ 阶条件是全部 $a+b<m$ 的 Taylor 系数为零，把 $y$ 方向先抽出就是这些条件按 $b$ 分层。

第三点是 Rouché。若 $h_{b,0}\equiv0$，所需的射流自动全为零（`03-limits.tex:77` 到 `03-limits.tex:78`）；否则取以零为中心的小闭盘，含于坐标盘，使 $h_{b,0}$ 在盘内除零点外无零点、边界上无零点；$\nu$ 足够大时所有 $\xi_{a,\nu}$ 在盘内，边界上一致收敛使 $h_{b,\nu}$ 与 $h_{b,0}$ 在盘内零点计数相同（重数计），故

$$
\ord_0 h_{b,0}\ge q(m-b)
$$

（`03-limits.tex:80` 到 `03-limits.tex:88`）。对所有 $b<m$ 成立，恰是 $J_\tau F_0=0$。

`03-limits.tex:92` 到 `03-limits.tex:102` 给了这段的代数读法，我把它当作检验。设中心在 $(\xi_a,0)$、$Q(x)=\prod_{a=1}^{q}(x-\xi_a)$，把局部全纯函数写成 $\sum_{b\ge0}h_b(x)y^{b}$，则重数条件要求 $Q^{m-b}$ 整除 $h_b$（$b<m$）。中心碰撞后极限条件变成 $x^{q(m-b)}$ 整除 $h_b$，等价于属于 $(x^{q},y)^{m}$。条件个数

$$
\lvert\mathcal I\rvert=\sum_{b=0}^{m-1}q(m-b)=\frac{q m(m+1)}{2}.
$$

我用 $(x^{q},y)^{m}$ 的余维数对了一遍：按 $y^{b}$ 分层，第 $b$ 层要求 $x$ 幂次至少 $q(m-b)$，每层贡献 $q(m-b)$ 个单体条件，总和与 `03-limits.tex:100` 一致，也解释了行集为何是这样一个三角形：$b$ 越大要求的 $\ell$ 越少。文本在 `03-limits.tex:19` 到 `03-limits.tex:21` 把这段归入 fat point 极限条件的一般研究，并对比 Evain 的第 2、6 节，但声明"这里直接证所需的局部约束"。我登记为：局部约束的证明是自足的。

剩下的问题被 `03-limits.tex:102` 到 `03-limits.tex:104` 交代清楚：引理已对某个非零极限建立了这些条件，接下来要在适合 $\tau\to0^{+}$ 的基里算 $J_\tau$ 的矩阵。

## 13 归一化 theta 基与极限矩阵 $B_0$

这一节是全文计算最密的地方，我把它分成五块：公共图、归一化 theta 截面、系数空间的基、指标集 $\mathcal S$ 的维数恒等式、矩阵极限命题。

公共图。虽然环面在变，一个多圆盘对所有充分小的正 $\tau$ 都是合法图。取 $R$ 满足 $0<R<\pi/2$，并令

$$
\delta_P=\min_{1\le i\le9}\{x_0-x_i,\ 1-(x_0-x_i)\}>0
$$

（`03-limits.tex:110` 到 `03-limits.tex:114`）。要求 $|\log\tau|>2R$ 且 $\delta_P|\log\tau|>R$（`03-limits.tex:115`）。若 $z_0e^{x}$ 与 $z_0e^{x'}$（$\lvert x\rvert,\lvert x'\rvert<R$）代表 $X_\tau$ 同一点，则 $x'-x=a\log\tau+2\pi\mathrm{i}b$（$a,b\in\Z$），实部与虚部的界逼出 $a=b=0$，故盘单射地映到 $X_\tau$（`03-limits.tex:117` 到 `03-limits.tex:123`）。若盘里一点代表 $P$ 的点，其实部满足 $\operatorname{Re}x=(x_i-x_0+a)\log\tau$，绝对值至少 $\delta_P|\log\tau|>R$，矛盾，故盘避开 $P$（`03-limits.tex:124` 到 `03-limits.tex:129`）。覆盖空间框架在此平凡化 $A$，$v=e^{y}$ 对 $\lvert y\rvert<R$ 单射（`03-limits.tex:130` 到 `03-limits.tex:132`）。

我按第 11 节的样例取 $x_i=x_0-i\Delta/45$ 代进 $\delta_P$：$x_0-x_i=i\Delta/45\in(0,1/2]$，而 $1-(x_0-x_i)\ge1/2$，所以 $\delta_P=\Delta/5$（取 $i=9$）。$R<\pi/2$ 的作用是控制 $e^{x}$ 的虚部不绕圈，配合 $|\log\tau|>2R$ 让 $a\ne0$ 时实部太大。这两个条件是我在第 2 节路线 E 里想"沿 $\tau$ 建统一坐标"时缺失的东西：图的合法性对每个小 $\tau$ 成立，跨越 $\tau=0$ 不成立。

归一化 theta 截面（引理在 `03-limits.tex:136` 到 `03-limits.tex:160`）。固定 $n>0$、实 $\sigma$、复 $\epsilon$（$\lvert\epsilon\rvert=1$），置 $U=\sigma-x_0 n$ 并假设 $U\notin\Z$。对每个整数 $K\in(U,U+n)$，存在 $D(n,\epsilon\tau^{\sigma})$ 的截面 $s_{K,\tau}$：由 Laurent 递推生成，把 $z^{K}$ 系数设为 $\tau^{-x_0K}$、其余模 $n$ 剩余类设为零。这 $n$ 个截面成基，且在局部覆盖空间框架里

$$
s_{K,\tau}(z_0 e^{x})=\sum_{p\in\Z}\epsilon^{-p}\tau^{p(K-U)+np(p-1)/2}e^{(K+np)x}\ \longrightarrow\ e^{K x}
$$

（`03-limits.tex:146` 到 `03-limits.tex:152`），收敛在每个紧子集上一致，任意固定阶 $x$ 导数同样；并且 $\Pi(z_0 e^{x})\to1$ 带同样的全纯与导数一致收敛。

中间那步指数账我完整重做了一次，因为它是全节最容易写错符号的地方。递推给 $c_{K+np}=c_K\gamma^{-p}\tau^{pK+np(p-1)/2}$，$c_K=\tau^{-x_0K}$、$\gamma=\epsilon\tau^{\sigma}$，所以

$$
c_{K+np}=\tau^{-x_0K}\epsilon^{-p}\tau^{-\sigma p+pK+np(p-1)/2}
$$

（`03-limits.tex:168` 到 `03-limits.tex:170`）。再代 $z=\tau^{x_0}e^{x}$，单项式 $c_{K+np}z^{K+np}$ 的 $\tau$ 指数是 $-x_0K-\sigma p+pK+\frac{np(p-1)}2+x_0(K+np)=p(K-\sigma+x_0n)+\frac{np(p-1)}2=p(K-U)+\frac{np(p-1)}2$，与文本一致，$e^{x}$ 的幂是 $K+np$。

衰减估计。记 $a=K-U\in(0,n)$、$\delta=\min\{a,n-a\}>0$。$p=t\ge1$ 项的 $\tau$ 指数是 $ta+nt(t-1)/2$，$p=-t$ 项的是 $t(n-a)+nt(t-1)/2$，两者都 $\ge\delta t$（`03-limits.tex:174` 到 `03-limits.tex:184`）。二次增长给出每个固定 $\tau$ 在紧 $x$-盘上的正规收敛，允许逐项求导；在 $\lvert x\rvert\le R'$ 上所有 $p\ne0$ 项对 $c$ 阶导数的贡献被

$$
2e^{|K|R'}\sum_{t\ge1}(|K|+nt)^{c}\bigl(e^{nR'}\tau^{\delta}\bigr)^{t}
$$

控制，$\tau$ 足够小时括号内 $\le1/2$，于是和只依赖 $R',c,n,K$ 的常数乘 $\tau^{\delta}$，趋于零；$p=0$ 项就是 $e^{Kx}$（`03-limits.tex:185` 到 `03-limits.tex:197`）。这里我读出 $\tau^{-x_0K}$ 那个规格的用途：它把 $p=0$ 项的系数配成 $1$，使极限恰是 $e^{Kx}$。

乘积的收敛。置 $a_i=x_0-x_i\in(0,1)$，$\Theta(\tau^{a_i}e^{x})$ 的因子与 $1$ 的偏差绝对值总和在 $\lvert x\rvert\le R'$ 上被

$$
\frac{e^{R'}}{1-\tau}\bigl(\tau^{a_i}+\tau^{1-a_i}\bigr)
$$

控制（`03-limits.tex:199` 到 `03-limits.tex:207`）。九个指标求和得 $S_{R'}(\tau)\to0$。初等乘积不等式

$$
\Bigl\lvert\prod_\nu(1+u_\nu)-1\Bigr\rvert\le\exp\Bigl(\sum_\nu\lvert u_\nu\rvert\Bigr)-1
$$

对绝对可和族由有限乘积取极限得到，它把 $\lvert\Pi(z_0e^{x})-1\rvert$ 一致控制在 $\exp(S_{R'}(\tau))-1$ 内；乘积对每个 $\tau$ 在紧盘上正规收敛故表达式全纯，再在稍大一点的盘上用 Cauchy 导数估计，得到原盘上每个固定导数的收敛（`03-limits.tex:208` 到 `03-limits.tex:221`）。这个"大盘控制导数"的手法我抄下来备用，因为在原盘上逐项求导只给逐点信息。

系数空间的基。$0\le j\le m$ 时块丛是

$$
T\otimes A^{m-j}=D\bigl(h,(-1)^{m-j}\tau^{(d-3m)\eta+(m-j)\rho_{*}}\bigr)
$$

（`03-limits.tex:226` 到 `03-limits.tex:231`）。因 $\eta-3x_0=(\rho_{*}-\Delta)/3$，区间参数是

$$
U_j=\frac{h}{9}(\rho_{*}-\Delta)+(m-j)\rho_{*}
$$

（`03-limits.tex:232` 到 `03-limits.tex:235`）。$m<j\le u_0$ 且 $d-3j>0$ 时，源丛是

$$
L^{d-3j}=D\bigl(n_j,\tau^{(d-3j)\eta}\bigr),\qquad n_j=3(d-3j)=h-9(j-m)>0
$$

乘 $\Pi^{\,j-m}$，区间参数

$$
U_j=\frac{n_j}{9}(\rho_{*}-\Delta)
$$

（`03-limits.tex:237` 到 `03-limits.tex:246`）。两个 $U_j$ 的无理性我按文本提示验了：代入 $\rho_{*}=3(\sqrt r-3)$ 后，$\sqrt r$ 的系数是正整数 $d-3j$（第一式：$3(h/9+m-j)=3(d/3-j)=d-3j$；第二式：$3n_j/9=d-3j$），其余项因 $\Delta\in\mathbb Q$ 而有理，故 $U_j\notin\Z$（`03-limits.tex:247` 到 `03-limits.tex:255`）。这是第 3 节转折四的兑现点，也是"保留乘子表示"的真正用途：同构类相同的丛若把乘子写成 $\tau$ 的别的幂，$U_j$ 会平移整数，区间端点落进整数，整数个数就不再是 $h$。

指标集（`03-limits.tex:258` 到 `03-limits.tex:275`）：

$$
\begin{aligned}
\mathcal S=\;&\bigcup_{j=0}^{m}\{(j,K):K\in\Z,\ U_j<K<U_j+h\}\\
&\cup\bigcup_{m<j\le u_0,\ d-3j>0}\{(j,K):K\in\Z,\ U_j<K<U_j+n_j\}\\
&\cup\{(j,0):m<j\le u_0,\ d-3j=0\}.
\end{aligned}
$$

第三段除非 $3\mid d$ 否则空，否则只含 $(d/3,0)$；因 $d>3m$ 该对的 $j>m$（`03-limits.tex:276` 到 `03-limits.tex:278`）。基的构造按三种情形分别取归一化截面（必要时乘 $\Pi^{j-m}$，零度情形取常数 $1$），记所得纤维多项式为 $E_{j,K,\tau}$（`03-limits.tex:280` 到 `03-limits.tex:288`）。每个选择都是块的基；$j>m$ 时乘 $\Pi^{j-m}$ 单射因 $\Pi$ 在 $B\setminus P$ 非零，像按定义就是该块；不同 $v^{j}$ 成直和，故 $\{E_{j,K,\tau}\}_{(j,K)\in\mathcal S}$ 对每个 $\tau\in(0,1)$ 是 $\W_\tau$ 的基，无重复对，指标集与 $\tau$ 无关（`03-limits.tex:290` 到 `03-limits.tex:298`）。

维数恒等式（`03-limits.tex:300` 到 `03-limits.tex:310`）：

$$
\lvert\mathcal S\rvert=\dim\W_\tau=\binom{d+2}{2}-9\binom{m+1}{2}.
$$

我按文本给的路线自己求了和。$j$ 从 $0$ 到 $u_0$ 遍历 $d-3j>0$ 的块，维数 $3(d-3j)$，$d-3j=0$ 时补 $1$，总和是 $\binom{d+2}{2}$（例如 $d=3u_0$ 时 $9u_0(u_0+1)/2+1=(3u_0+2)(3u_0+1)/2$）。$j<m$ 的块因九零点条件每个减少 $9(m-j)$，其和为 $9\binom{m+1}{2}$。两边相减得恒等式；$d=3u_0+s$（$s=1,2$）的情形我也代了一遍，$s=2$ 时 $\sum 3(d-3j)$ 给出 $9(u_0+1)(u_0+2)/2=\binom{3u_0+4}{2}$，吻合。

标量表达式的极限：$H_{E_{j,K,\tau}}(x,y)\to e^{Kx+jy}$ 局部一致并带所有固定混合导数（`03-limits.tex:312` 到 `03-limits.tex:318`）。第一段是归一化 theta 乘 $e^{jy}$；第二段多出因子 $\Pi(z_0e^{x})^{j-m}\to1$ 带导数，指数 $j-m$ 固定；$K=0$ 的零度情形由同一乘积断言处理。$\mathcal S$ 有限，所以所有收敛可取在同一个更小的多圆盘上、对同一批充分小的 $\tau$ 成立（`03-limits.tex:323` 到 `03-limits.tex:326`）。这句"同一个更小盘"是后面能逐元素取极限的前提。

矩阵极限命题（`03-limits.tex:337` 到 `03-limits.tex:369`）。固定 $\mathcal I$ 与 $\mathcal S$ 的排序，$J_\tau$ 在基 $E_{j,K,\tau}$ 下的矩阵 $B_\tau$ 尺寸恒定，逐元素收敛到

$$
B_0=\bigl(K^{\ell}j^{b}\bigr)_{(\ell,b)\in\mathcal I,\ (j,K)\in\mathcal S}
$$

（`03-limits.tex:344` 到 `03-limits.tex:347`）。$B_0$ 满列秩则 $\tau$ 充分小时 $J_\tau$ 单射。证明里我要记一笔 $0^{0}$ 约定：$(B_\tau)_{(\ell,b),(j,K)}\to K^{\ell}j^{b}$，零阶导数贡献因子 $1$，$K=0$ 或 $j=0$ 时也如此（`03-limits.tex:361` 到 `03-limits.tex:363`）；$B_0$ 满列秩给出一个 $\lvert\mathcal S\rvert$ 阶非零子式，对应 $B_\tau$ 的子式收敛到它，故充分小 $\tau$ 也非零（`03-limits.tex:364` 到 `03-limits.tex:368`）。

命题后的一段是我最看重的方法论声明（`03-limits.tex:371` 到 `03-limits.tex:379`）：$\tau^{-x_0K}$ 可能趋于 $0$ 或 $\infty$，但对每个 $\tau>0$ 它们给出可逆基变换、保持秩；核的存在由引理在每个固定 $\tau$ 单独供出，命题只在显式基里比较数值矩阵；因此不需要核向量的连续选择，也不需要跨越 $\tau=0$ 的平面嵌入代数族。要推翻引理，只剩一件事：证明相应极限矩阵在 $(d,m)$ 的足够大公倍数下满列秩。这句话把接力棒交给第 14、15、16 节。

## 14 按水平行插值与两个行界

第 13 节末把问题降到一句纯组合的话上：单项式 $K^{\ell}J^{b}$（$0\le b<m$、$0\le\ell<q(m-b)$）在 $\mathcal S$ 上的限制是否张满 $\C^{\mathcal S}$（`04-interpolation.tex:9` 到 `04-interpolation.tex:14`），其中在 $(j,K)$ 处求值就是把 $J$ 换成 $j$（`04-interpolation.tex:12`）。`04-interpolation.tex:15` 到 `04-interpolation.tex:17` 说策略是先给出行分布的充分条件，再用多边形切片来验证它。

引理（`04-interpolation.tex:30` 到 `04-interpolation.tex:47`）：$q,m$ 为正整数，$S\subset\C^{2}$ 有限，坐标记 $(j,K)$；对每个出现的层高 $K$ 令 $N_K$ 为行大小。若

$$
N_K\le m,\qquad \#\{K:N_K\ge t\}\le q(m-t+1)\quad(1\le t\le m,\ t\in\Z),
$$

则每个 $S\to\C$ 的函数都是 $\mathcal P_{q,m}$ 中某多项式的限制，其中

$$
\mathcal P_{q,m}=\operatorname{span}_{\C}\{K^{\ell}J^{b}:0\le b<m,\ 0\le\ell<q(m-b)\}\subset\C[J,K].
$$

我先把两个行界的逻辑分工想清楚。第二个界（大行的个数）控制 $K$ 方向的次数预算，第一个界（单行大小）控制 $J$ 方向。`04-interpolation.tex:25` 到 `04-interpolation.tex:28` 明写：逐行插值时先处理的行数进入 $K$ 的次数，当前行的点数进入 $J$ 的次数，两者的耦合正是"只控最大行或只控总点数都不够"的理由。我用一个小例核算过这句话：设 $q=1$、$m=2$，若两行各有 $2$ 点，第二行处理时 $K$ 的次数需要 $1$，而 $\mathcal P_{1,2}$ 只给 $b=0$ 时 $\ell<2$、$b=1$ 时 $\ell<1$，第 $b=1$ 层的预算恰是 $1$，勉强够用；把行数加到 $3$ 就爆。这说明界是紧的。

证明构造性很强（`04-interpolation.tex:49` 到 `04-interpolation.tex:76`）。空集显然。否则把出现的层高按大小 $N_1,\dots,N_s$ 不增排列，即使有并列，前 $i$ 行的尺寸都至少 $N_i$，于是

$$
i\le\#\{K:N_K\ge N_i\}\le q(m-N_i+1)
$$

（`04-interpolation.tex:54` 到 `04-interpolation.tex:56`，即有序行界）。从 $0$ 多项式开始逐行匹配：处理第 $i$ 行时令

$$
Q_i(K)=\prod_{a=1}^{i-1}(K-K_a)
$$

空积为 $1$（`04-interpolation.tex:59` 到 `04-interpolation.tex:62`）。$Q_i(K_i)\ne0$，且该行上 $N_i$ 个第一坐标互异，一元插值给出次数不超过 $N_i-1$ 的 $p_i(J)$ 使 $Q_i(K_i)p_i(j)$ 恰为该行的修正量；加 $Q_i(K)p_i(J)$ 匹配该行并保持所有先行（`04-interpolation.tex:63` 到 `04-interpolation.tex:68`）。每一项单体满足 $b\le N_i-1<m$ 且

$$
\ell\le i-1<q(m-N_i+1)\le q(m-b)
$$

（`04-interpolation.tex:70` 到 `04-interpolation.tex:74`）。我验了最后那个不等号方向：$b\le N_i-1$ 给 $-b\ge 1-N_i$，于是 $m-b\ge m-N_i+1$，右端 $q(m-N_i+1)\le q(m-b)$ 成立，链路正确。

这里我要坦白一个我一度以为的漏洞：并列尺寸时 $i\le\#\{K:N_K\ge N_i\}$ 这个不等号看起来太弱，因为并列会让左边偏小。文本用"even when sizes are tied"（`04-interpolation.tex:52`）标注它靠不增排列保证：排在前 $i$ 的位置上，尺寸都 $\ge N_i$，所以至少有 $i$ 个层高满足 $N_K\ge N_i$。这是纯逻辑，不需额外假设。

第 15 节要证的只剩两个界对 $\mathcal S$ 成立，而手段是把 $\mathcal S$ 装进多边形再数水平切片（`04-interpolation.tex:78` 到 `04-interpolation.tex:81`）。

## 15 外包多边形与水平切片剖面

记号集中在 `04-interpolation.tex:84` 到 `04-interpolation.tex:96`：写 $a=\rho_{*}=3(\sqrt r-3)>0$，并设

$$
U_0=\frac{h}{9}(a-\Delta)+ma,\qquad X=\frac{j}{m},\qquad Y=\frac{K-U_0}{m},
$$

其中 $U_0$ 正是 $j=0$ 时指数区间的下端（`04-interpolation.tex:89`）。对 $0<\lambda\le1$ 与 $t_+=\max\{t,0\}$ 定义

$$
\mathcal D_\lambda=\{(X,Y)\in\mathbb R^{2}:X\ge0,\ -aX\le Y\le-aX+\lambda a-9(X-\lambda)_+\}.
$$

由 $\rho+\Delta\rho/9<a$（来自 `02-elliptic.tex:251` 到 `02-elliptic.tex:253`）可取 $0<\lambda<1$ 使

$$
\rho+\frac{\Delta\rho}{9}<\lambda a-9(1-\lambda)
$$

（`04-interpolation.tex:97` 到 `04-interpolation.tex:101`）。这个选取只依赖 $r$、比值 $d/m$ 与 $\Delta$（`04-interpolation.tex:102`），我在第 16 节放大 $(d,m)$ 时要用到它的不变性。文本预告了两个结论：缩放平移多边形的水平宽度至多 $m\lambda<m$；支撑长度至少 $s$ 的切片高度构成一段长度 $q(m\lambda-s)$ 的区间（`04-interpolation.tex:104` 到 `04-interpolation.tex:108`）。

引理（`04-interpolation.tex:110` 到 `04-interpolation.tex:122`）给 $\mathcal S$ 的定量外包：

$$
0\le X\le1+\rho/9,\qquad -aX+\Delta(X-1)_+\le Y\le-aX+\rho+(\Delta-9)(X-1)_+,
$$

并且该区域含于 $\mathcal D_\lambda$，故 $\mathcal S\subseteq m\mathcal D_\lambda+(0,U_0)$。我按三种 $j$ 各自验算了一遍，这是我最需要确认的地方，因为它把第 13 节的两套 $U_j$ 公式统一成一条折线。

情形 $j\le m$：区间是 $U_0-aj<K<U_0-aj+h$（`04-interpolation.tex:127` 到 `04-interpolation.tex:129`），除以 $m$ 且注意 $h/m=\rho$，得 $-aX<Y<-aX+\rho$，正是两个界的第一支（$(X-1)_+=0$，因为 $X\le1$）。

情形 $j>m$、$d-3j>0$：区间长度 $n=h-9(j-m)$，下端 $n(a-\Delta)/9$。恒等式

$$
\frac{n}{9}(a-\Delta)-U_0=-aj+\Delta(j-m),\qquad n=h-9(j-m)
$$

（`04-interpolation.tex:132` 到 `04-interpolation.tex:136`）我代了 $U_0=(h/9)(a-\Delta)+ma$ 验证：左端 $=(h-9j+9m)(a-\Delta)/9-(h/9)(a-\Delta)-ma=-j(a-\Delta)+ma=-aj+\Delta(j-m)$ 减去 $0$，等式成立。除以 $m$ 后即得第二支：下界 $-aX+\Delta(X-1)$；上界再加 $n/m=\rho-9(X-1)$，合并成 $-aX+\rho+(\Delta-9)(X-1)$。

情形零度块：唯一指数对是 $(j,K)=(d/3,0)$，此时 $j=m+h/9$，故

$$
X=1+\rho/9,\qquad Y=-a-\frac{\rho}{9}(a-\Delta)
$$

（`04-interpolation.tex:139` 到 `04-interpolation.tex:144`）。我把两个界分别代入这个点：下界 $-a(1+\rho/9)+\Delta\rho/9=-a-a\rho/9+\Delta\rho/9$，上界 $-a-a\rho/9+\rho+(\Delta-9)\rho/9=-a-a\rho/9+\Delta\rho/9$，两者相等，等于 $-a-(\rho/9)(a-\Delta)$，所以端点被包含（`04-interpolation.tex:145` 到 `04-interpolation.tex:146`）。这里我原先担心开区间与闭区域的错配会让这个点掉出去，算完发现它恰在两条折线的交点上，而区域的闭性救了它。

含于 $\mathcal D_\lambda$ 的验证（`04-interpolation.tex:148` 到 `04-interpolation.tex:162`）：下界至少 $-aX$ 是显然的。$X\le1$ 时由有序行界式的选取 $\lambda a-9(X-\lambda)_+\ge\lambda a-9(1-\lambda)>\rho$。$1\le X\le1+\rho/9$ 时把公共项 $-aX-9(X-1)$ 从两个上界里减掉，比较化为

$$
\rho+\Delta(X-1)\le\rho+\Delta\rho/9<\lambda a-9(1-\lambda),
$$

用的正是 $\lambda$ 的选取。整个区域含端点落在 $\mathcal D_\lambda$ 内。

切片剖面（`04-interpolation.tex:171` 到 `04-interpolation.tex:192`）。$\mathcal D_\lambda=\lambda\mathcal D_1$：把两个坐标同乘 $\lambda$ 代回定义即得（`04-interpolation.tex:194` 到 `04-interpolation.tex:196`）。$\mathcal D_1$ 的下边界是 $Y=-aX$，上边界分段为 $a(1-X)$（$0\le X\le1$）与 $(a+9)(1-X)$（$X\ge1$）（`04-interpolation.tex:197` 到 `04-interpolation.tex:203`），顶点是 $(0,0)$、$(0,a)$、$(1,0)$、$(1+a/9,-a(1+a/9))$（`04-interpolation.tex:204` 到 `04-interpolation.tex:208`）。非空水平切片是

$$
0\le X\le1-Y/a\ (0\le Y\le a),\qquad -Y/a\le X\le1-Y/(a+9)\ (-a(1+a/9)\le Y\le0),
$$

长度即 $w(Y)=1-Y/a$ 与 $w(Y)=1+Y/(a(1+a/9))$，其他高度为空；我在下支上用 $1+Y/a-Y/(a+9)=1+Y/(a(1+a/9))$ 验算了恒等（`04-interpolation.tex:217` 到 `04-interpolation.tex:219`）。两支都在 $Y=0$ 取最大长度 $1$（`04-interpolation.tex:219` 到 `04-interpolation.tex:220`）。把 $m\mathcal D_\lambda+(0,U_0)$ 的长度至少 $s$ 的高度解出两个线性不等式，得闭区间

$$
\bigl[U_0-a(1+a/9)(m\lambda-s),\ U_0+a(m\lambda-s)\bigr],
$$

长度 $(2a+a^{2}/9)(m\lambda-s)=q(m\lambda-s)$，因为 $a=3(\sqrt r-3)$ 蕴含 $2a+a^{2}/9=r-9=q$（`04-interpolation.tex:221` 到 `04-interpolation.tex:228`）。第 11 节我验过的同一个恒等式在这里第二次出现，两处必须一致，这正是我把它当作交叉校验的理由。端点检查：$s=m\lambda$ 时区间缩成单点 $U_0$，$s=0$ 时是多边形的整个垂直范围（`04-interpolation.tex:228` 到 `04-interpolation.tex:229`）。

关于 `04-interpolation.tex:166` 到 `04-interpolation.tex:169` 的约定我停了一下：有界区间的长度定义为端点差，单点集长度 $0$；要求长度为零时仍要求切片非空。这条约定是为了让 $s=m\lambda$ 的退化情形仍然有意义，配合引理里 $t=1$ 时的计数。

图（`figures/slice-profile.tex`，正文在 `04-interpolation.tex:232` 到 `04-interpolation.tex:244` 引它）我逐坐标核了一遍，发现它有意不按比例画。panel (a) 的填充是 $(0,0)\to(0,1)\to(1,0)\to(4/3,-4/3)$，而按引理的顶点公式 $(1+a/9,-a(1+a/9))$ 要等于 $(4/3,-4/3)$ 就得同时满足 $a=3$（横坐标）与 $a=1$（纵坐标）。panel (b) 的三角形是 $(-4/3,0)\to(0,1)\to(1,0)$，标注 $Y_-= -8/15$、$Y_+=2/5$、$s=3/5$：上支 $Y_+=a(1-s)$ 给 $a=1$，下支 $Y_-=-a(1+a/9)(1-s)$ 给 $a(1+a/9)=4/3$ 即 $a\approx1.1789$。两处不一致说明图是示意性的，与 caption 里 "drawn schematically with $a=\rho_{*}$ and $0<s<1$"（`04-interpolation.tex:235` 到 `04-interpolation.tex:242`）吻合。我最初的反应是以为自己的公式记号错位，回头对了一遍 `04-interpolation.tex:186` 到 `04-interpolation.tex:191` 才确认：是图的坐标被人为压缩了，纵轴在 panel (a) 用 $y=1.90$cm、panel (b) 用 $y=2.75$cm，横轴也不同尺度（`figures/slice-profile.tex:11` 与 `figures/slice-profile.tex:35`），所以视觉上不冲突。这条记录的价值在于：以后我读论文图时先分清"示意"与"按比例"，尤其是判断某个顶点是否落在整数上这类问题。

## 16 整数行计数、满秩与终局反证

从实数宽度到整数行数的桥在 `04-interpolation.tex:246` 到 `04-interpolation.tex:258`。对每个整数 $K$ 记 $N_K=\#\{j\in\Z:(j,K)\in\mathcal S\}$，只有有限多个非零（`04-interpolation.tex:246` 到 `04-interpolation.tex:249`）。文本明确交代：从长度到整数计数最多多一个端点，所以要用尺寸条件

$$
q(1-\lambda)m\ge1
$$

来吸收（`04-interpolation.tex:252` 到 `04-interpolation.tex:258`）。

引理（`04-interpolation.tex:259` 到 `04-interpolation.tex:268`）：若 $q(1-\lambda)m\ge1$，则 $\mathcal S$ 满足

$$
N_K\le m\ (K\in\Z),\qquad \#\{K\in\Z:N_K\ge t\}\le q(m-t+1)\ (1\le t\le m).
$$

第一个界：被表示的行的整数位置落在长度至多 $m\lambda<m$ 的区间内，其跨度至少 $N_K-1$，故 $N_K-1\le m\lambda<m$，整数性给 $N_K\le m$，单人行也覆盖（`04-interpolation.tex:270` 到 `04-interpolation.tex:275`）。第二个界：$N_K\ge t$ 需要非空切片长度至少 $t-1$；若 $t-1>m\lambda$ 则没有这样的行；否则整数高度落在长度 $q(m\lambda-t+1)$ 的闭区间里，而长度 $L\ge0$ 的区间至多含 $\lfloor L\rfloor+1\le L+1$ 个整数，于是

$$
\#\{K\in\Z:N_K\ge t\}\le q(m\lambda-t+1)+1=q(m-t+1)-q(1-\lambda)m+1\le q(m-t+1),
$$

最后一步用的正是尺寸条件（`04-interpolation.tex:276` 到 `04-interpolation.tex:290`）。多出来那个 $1$ 由整数端点承担，包括高度区间缩成单点时（`04-interpolation.tex:289` 到 `04-interpolation.tex:290`）。我把两种极端代入检查过：$t=1$ 时界变成 $\#\{K:N_K\ge1\}\le qm$，即非空行数不超过 $qm$，与 $s=0$ 时高度区间长度 $qm\lambda$ 加 $1$ 后不超过 $qm$ 相符（因 $q(1-\lambda)m\ge1$ 等价于 $qm-qm\lambda\ge1$）；$t=m$ 时界是 $\#\{K:N_K\ge m\}\le q$，即最大行不超过 $q$ 个，与 $s$ 接近 $m\lambda$ 时高度区间缩小的趋势一致。这两个极端我算过才敢相信一般式。

满秩命题（`04-interpolation.tex:295` 到 `04-interpolation.tex:308`）：$q(1-\lambda)m\ge1$ 时 $B_0$ 满列秩，故充分小正 $\tau$ 上 $J_\tau$ 单射。证明就是把插值引理用在 $S=\mathcal S$ 上，用整数行界验证它的两个假设；$B_0$ 的行向量是 $\mathcal P_{q,m}$ 中单体在 $\mathcal S$ 上的限制，故张满 $\C^{\mathcal S}$，秩为 $\#\mathcal S$；再由矩阵极限命题得单射。

定理的收尾（`04-interpolation.tex:310` 到 `04-interpolation.tex:337`）我按六步复述。一，由通用系统归化，只需排除所有 $d/m\le\sqrt r$ 的 $\mathsf U_r(d,m)$。二，平方情形由第 7 节解决，含等号。三，非平方时比值 $d/m$ 严格小于 $\sqrt r$，且第 8 节逼出 $d/m>3$。四，按 `02-elliptic.tex:250` 选 $\Delta$、按 `04-interpolation.tex:99` 选 $\lambda$，再用归化引理的幂次封闭把 $(d,m)$ 换成足够大的正整数公倍数以满足尺寸条件；比值不变，故 $\rho,\Delta,\lambda$ 都不变（`04-interpolation.tex:320` 到 `04-interpolation.tex:323`）。五，把前面所有构造施加到这唯一选定的一对上：第 9 节命题与第 12 节碰撞给出每个固定 $\tau$ 上 $J_\tau$ 的非零核，第 16 节满秩命题给出所有充分小正 $\tau$ 上的单射，矛盾（`04-interpolation.tex:324` 到 `04-interpolation.tex:327`）。六，碰撞已在每条固定曲线上完成，无需同时选择核向量（`04-interpolation.tex:328` 到 `04-interpolation.tex:329`）。

结句里我特别看重两点。一是 exceptional union 的归还方式：`04-interpolation.tex:332` 说归化引理供出同一个可数并 $E_r$ 与其外的严格不等式，同时对所有正次数与所有非负整数重数向量成立。二是结论的适用范围：该归化 concern 所有非零齐次形式，故结论包含可约与非约化有效曲线（`04-interpolation.tex:334` 到 `04-interpolation.tex:337`）。这与第 1 节我最初只考虑既约约化曲线的设想形成明确对照。

我复盘放大 $(d,m)$ 这一步的必要性：如果不放大，尺寸条件 $q(1-\lambda)m\ge1$ 可能对小的 $m$ 失败，此时整数端点误差就吸收不掉，行界可能差 $1$，插值引理的假设不成立。放大之所以合法，全靠归化引理里 $\mathsf U_r(d,m)$ 蕴含 $\mathsf U_r(Nd,Nm)$（`01-reductions.tex:45`），而解析侧的一切选型只依赖 $d/m$。这是我读到的最漂亮的一次"用自由度换精度"。

## 17 域的比较与多点 Seshadri 常数

解析证明在 $\C$ 上做，推广部分在 `consequences.tex` 全文 84 行里完成。我起初以为这一步要用某个把 $k$ 嵌入 $\C$ 的技巧，文本第 3 到 5 行直接排除了它："without embedding another field into $\C$"，并说明推论的写法参考了 Bansal--Majumder 关于复 Nagata 到不可数特征零代数闭域的讨论，而这里要带同时量词给出关联式论证（`consequences.tex:6` 到 `consequences.tex:9`）。

同时量词是关键。我把推论（`consequences.tex:10` 到 `consequences.tex:17`）写成命题再核对：存在一个可数真闭子集并，补集非空，在其外定理结论以同样的次数与重数约定成立。"$E_r$ 同时适配所有 $(d,\mathbf m)$"这件事必须跨域保持，否则换域后要重做选点。

证明的四步（`consequences.tex:19` 到 `consequences.tex:37`）。一，取第 5 节构造的 $\mathbb Q$ 定义关联子簇 $A_{d,\mathbf m}$，在仿射卡上由 Taylor 系数矩阵的满列余子式定义，同样的有理极小式在任意特征零域上定义它的基变换。二，凡 $d\sqrt r\le\sum_i m_i$，定理在 $\C$ 上说明该子簇是真闭的；于是它在 $\mathbb Q$ 上也真，并且在有理仿射卡上的非零极小式经域扩张后仍非零，故在 $k$ 上仍真。三，对所有可数多个违反对 $(d,\mathbf m)$ 排除这些子簇，剩下的每个元组满足全部断言的不等式。四，补集非空：在 $k$ 里取 $2r$ 个 $\mathbb Q$ 代数无关的仿射坐标，避开所有有理定义的真子簇与所有重合；不可数性保证存在，因为 $k$ 中由有限个元素生成的域在其代数闭包里的部分可数。

我把第二步的"真闭在基变换下保持"单独想了一遍：非零多项式在扩域后仍非零，这是域扩张忠实性的直接推论，文本用 "stays nonzero after field extension" 表述（`consequences.tex:28` 到 `consequences.tex:29`）。第四步的可数性论证与第 5 节里"可数域的代数闭包可数"是同一句话的两次使用，区别只在 $k$ 不可数提供选点余地。我补算了一句：$k$ 代数闭且特征零时，$\mathbb Q$ 上的代数无关 $2r$ 元组确实存在，因为所有次数有界的有理代数关系并起来可数，而不可数集不被可数个真闭子集覆盖。

Seshadri 部分。设 $X$ 是在被定理或推论覆盖的元组上对平面的 blowup，$H$ 是直线拉回，$E_1,\dots,E_r$ 是例外曲线（`consequences.tex:39` 到 `consequences.tex:42`）。nef 与严格 nef 按与每条不可约曲线的交非负、正来定义；多点 Seshadri 常数是

$$
\varepsilon(\mathcal O(1);p_1,\dots,p_r)=\sup\{t\ge0:\ H-t\textstyle\sum_i E_i\ \text{是 nef}\}
$$

（`consequences.tex:44` 到 `consequences.tex:49`）。推论（`consequences.tex:51` 到 `consequences.tex:57`）声明 $N_r=\sqrt r\,H-\sum_i E_i$ 严格 nef、$N_r^{2}=0$，并且 $\varepsilon=1/\sqrt r$。

正性：$X$ 上不可约曲线要么是例外曲线（与 $N_r$ 的交是 $1$），要么是平面不可约曲线的严格变换（交是 $d\sqrt r-\sum_i\mult_{p_i}C>0$）（`consequences.tex:59` 到 `consequences.tex:63`）。自交：$H^{2}=1$、$H\cdot E_i=0$、$E_i\cdot E_j=-\delta_{ij}$ 给出 $N_r^{2}=0$（`consequences.tex:63` 到 `consequences.tex:65`）。这两行是我第 1 节里"$\sqrt r$ 是实系数类"的具体含义：$r$ 非平方时 $N_r$ 一般不在 Neron-Severi 格里，只在它的实张量里，`introduction.tex:47` 明确说 $1/\sqrt r$ 在非平方时无理。

上界的方向我算得最仔细，因为它只用计数。给定正整数 $n$，令 $e_n=\lceil\sqrt r\,(n+1)\rceil$（`consequences.tex:68`）。次数 $e_n$ 的形式上，要求在每点重数至少 $n$ 至多给 $r\binom{n+1}{2}$ 个线性条件，而

$$
\binom{e_n+2}{2}>r\binom{n+1}{2}
$$

（`consequences.tex:69` 到 `consequences.tex:73`）。于是存在非零形式。若 $H-t\sum_i E_i$ 在 $t\ge0$ 时 nef，与这形式除子的严格变换相交得

$$
0\le e_n-t\sum_i\mult_{p_i}D\le e_n-trn
$$

（`consequences.tex:74` 到 `consequences.tex:79`），故 $t\le e_n/(rn)$，$n\to\infty$ 时趋于 $1/\sqrt r$（`consequences.tex:80` 到 `consequences.tex:83`）。我代了 $r=10$、$n=1$：$e_1=\lceil2\sqrt{10}\rceil=7$，$\binom{9}{2}=36$ 对 $10\binom{2}{2}=10$，条件数远小于未知数个数，非零七次形式存在，界给 $t\le7/10=0.7$，而 $1/\sqrt{10}\approx0.3162$。$n=9$ 时 $e_9=\lceil10\sqrt{10}\rceil=32$，$t\le32/90\approx0.3556$，逼近速度约 $O(1/n)$，与 $e_n/(rn)=(\sqrt r(n+1)+O(1))/(rn)$ 的展开一致。这一段是全文唯一计数仍然当引擎的地方，与第 1 节我那个 $C_{0}$ 形成对称：无曲线的一侧要靠机器，有曲线的一侧只要数。

我把第 17 节与第 1 节的差别总结成一句：$\varepsilon=1/\sqrt r$ 是定理的推论，与定理不等价，因为定理还给出严格正性与平方零自交，而 $C_{0}$ 式推理只能给下界一侧。

## 18 Lean 侧登记、import 链与语句层比对

登记三行我在第 0 节抄过。本节写我按 import 链读了什么、为什么停在那里、以及 Lean 语句与 tex 语句的对应关系。我没有运行 `lake build`，也没做全仓检索，下面所有结论只关于声明文本。

主登记记录我判定为 `formalization.yaml:1346` 到 `formalization.yaml:1348` 这一条，理由是它的 `file` 指向的模块名与本论文标题直接对应，`declaration` 是该模块里最顶层的猜想名，`comparator_config` 指向的 json 里 `solution_module` 又回指同一模块，三者自洽。同一 yaml 相邻条目（`1338` 到 `1344`、`1350` 到 `1356`）属于其他问题，与本篇无关，我只在读取窗口里看到它们，没有据其作任何判断。

`Nagata.lean` 实测 169 行、6759 B，只有两条 import（`Nagata.lean:1` 与 `Nagata.lean:2`）。文件结构是四个 section。

一是 `Nagata.Workers.W10` 里定义 `FullNagataCurves`（`Nagata.lean:19` 到 `Nagata.lean:27`），量词形状是：对每个 $r\ge10$ 存在 $E:\mathbb N\to\Set(\OrderedDistinctPoints\ r)$，每个 $E\ n$ 满足关联式闭且不等于全集，存在一点在所有 $E\ n$ 外，并且对所有 $C:\mathsf{EffectivePlaneCurve}$ 与所有 $m:\Fin r\to\mathbb N$，若逐点重数条件成立则 $\sum_i(m\ i:\mathbb R)<(\curveDegree C)\cdot\Real.sqrt\ r$。`Nagata.lean:31` 的 `fullNagata_iff_effectiveCurves` 把它与 `Nagata.FullNagata`（坐标形式）互推，右向用到 `Nagata.Workers.W30.equationIdealCycle` 与 `curveOfForm_cycle`、`curveMultiplicityAtLeast_iff_equation`（`Nagata.lean:45` 到 `Nagata.lean:49`）。

二是 `FullNagataEffectiveCurves`（`Nagata.lean:68` 到 `Nagata.lean:76`）把重数换成 `Nagata.W15.curveOrdinaryMultiplicity`，`Nagata.lean:78` 到 `Nagata.lean:80` 用一条 simp 把它与第一条等价，依据是 `curveMultiplicityAtLeast_iff_le_ordinaryMultiplicity`。

三是 `Nagata.W13` 里 `nagata_full : Nagata.FullNagata`（`Nagata.lean:102` 到 `Nagata.lean:109`）是全篇组装点：它调 `fullNagata_of_genuine_source_construction`，然后在假设里对 $r$、$d$、$m$、$\delta$、$x$ 等一长串参数（不少以 `_` 前缀忽略）交出 `CoefficientSpaces.source_fixed_scaled_construction`，最后一个实参是 $3(\Real.sqrt\ r-3)$，即 tex 里的 $\rho_{*}$（`02-elliptic.tex:237`）。这个"把 $\rho_{*}$ 当参数交给一个构造"的形状，正好对应我第 11 节里 $\rho_{*}$ 只作为乘子出现的作用。同节还有 `nagata_full_ordinary`、`nagata_full_classOrdinary`、`nagata_full_effectiveCurves`（`Nagata.lean:113`、`Nagata.lean:118`、`Nagata.lean:123`）。

四是最终的 `OAI.Nagata.nagata_conjecture`（`Nagata.lean:148` 到 `Nagata.lean:158`），即 json 登记的声明，其证明就是 `W13.nagata_full_effectiveCurves`；`nagata_conjecture_coordinates`（`Nagata.lean:162`）等于 `W13.nagata_full`。文件头 docstring 说明坐标形式与该陈述等价，有效曲线是"由齐次素理想给出的真正非零有限 cycle"，次数与通常局部重数与代表方程无关，重复分支保留其重数（`Nagata.lean:134` 到 `Nagata.lean:140`）。这三句恰好是我第 4 节差异五里读到的强化点的机器化版本。

import 链上我实际点开过的文件与实测字节（从 `Nagata.lean` 的 import 行逐级下推，共十二份，含只取名字的 `ChartJets.lean`）：

| 文件 | 字节 | 行数 | 我读到的语句位置 |
| --- | --- | --- | --- |
| `FixedCurveSections.lean` | 8545 | 168 | 第 20 行 `source_necessary_W_of_smooth_cubic_geometry`、第 93 行 `source_fixed_necessary_W`、第 138 行 `source_fixed_scaled_construction` |
| `FullTarget.lean` | 13176 | 282 | 第 27 行 `FullNagataOrdinary`、第 41 行 `fullNagata_iff_ordinary`、第 63 行 `FullNagataClassOrdinary`、第 121 行 `square_veryGeneral`、第 141 行 `square_veryGeneral_of_isSquare`、第 212 行 `fullNagata_of_nonsquare_interior_exclusion`、第 246 行 `fullNagata_of_genuine_source_construction` |
| `GeometricCollision.lean` | 12511 | 246 | 第 26 行 `source_collision_of_every_configuration`、第 76 行 `source_necessary_W_of_cubic_geometry`、第 190 行 `source_collision_of_universalSupport_and_cubic_geometry` |
| `MarkedCubic.lean` | 25979 | 489 | 第 25 行起 `rayPoint` 系列、第 56 行 `sourceAMultiplier`、第 113 行 `actualMarkedConfiguration`、第 208 行 `exists_actualMarkedChart` |
| `BasisNoncancellation.lean` | 23114 | 456 | 第 62 行 `sourceBasis_actualJetMatrix_eq_theta`、第 369 行 `genuineSourceJetMap_injective`、第 393 行 `genuine_source_geometric_contradiction` |
| `CubicEquations.lean` | 11930 | 269 | 第 117 行 `exists_actual_prime_cubic_generator`、第 226 行 `cubic_universalSupport_degree_gt`、第 260 行 `cubic_low_degree` |
| `Incidence.lean` | 13068 | 302 | 第 198 行 `supportLocus_iff_chart_minors`、第 228 行 `supportLocus_isConfigurationZariskiClosed`、第 264 行 `universal_reduction`、第 282 行 `strict_bound_of_no_universal` |
| `SquareReduction.lean` | 3932 | 94 | 第 27 行 `square_universalSupport_degree_gt`、第 72 行 `square_strict_inequality_outside_supportExceptionalUnion` |
| `UniversalReduction.lean` | 12553 | 296 | 第 85 行 `UniversalSupport`、第 120 行 `universalSupport_symmetrize`、第 149 行 `universalSupport_pow`、第 178 行 `supportExceptionalUnion`、第 183 行 `properSupportFamily_countable`、第 210 行 `universalEqualSupport_of_violation` |
| `Rows.lean` | 22872 | 557 | 第 14 行 `rowPositions`、第 19 行 `largeRows`、第 52 行 `row_card_le`、第 68 行 `largeRows_card_le`、第 137 行 `integer_rows_of_polygon`、第 196 行 `complexSet` |
| `ScaledMatrices.lean` | 5615 | 112 | 第 18 行 `exists_scaled_thetaJetMatrix_source_data`、第 71 行 `exists_scaled_thetaJetMatrix_injective`、第 87 行 `exists_scaled_thetaJetMatrix_kernel_obstruction` |
| `ChartJets.lean` | 29321 | 未取全 | 第 42 行 `def affineJetEntry`、第 82 行 `def planeJetMatrix`、第 96 行 `def coefficientEquation` |

tex 与 Lean 的层次对应我按第 5 到第 16 节顺序做了映射。第 5 节的 $\mathsf U_r(d,m)$ 对应 `UniversalReduction.lean:85` 的 `UniversalSupport`；循环乘积对应 `universalSupport_symmetrize`（`UniversalReduction.lean:120`），该名字的形状（置换与 $r.factorial$ 倍数）说明机器化时把"对每个循环移位取形式再相乘"改写成对称化；幂次封闭对应 `universalSupport_pow`（`UniversalReduction.lean:149`）；第 5 节的 $A_{e,\mathbf n}$ 闭性对应 `Incidence.lean:198` 与 `Incidence.lean:228`；`supportExceptionalUnion`（`UniversalReduction.lean:178`）与 `properSupportFamily_countable`（`UniversalReduction.lean:183`）对应 tex 里"同一个可数并"；第 7 节对应 `SquareReduction.lean:27` 与 `FullTarget.lean:121`；第 8 节对应 `CubicEquations.lean:260`；第 9 节对应 `GeometricCollision.lean:76` 与 `FixedCurveSections.lean:20`；第 12 节对应 `GeometricCollision.lean:26` 与 `GeometricCollision.lean:190`；第 13 节对应 `MarkedCubic.lean:56` 与 `BasisNoncancellation.lean:62`；第 14 到第 16 节对应 `Rows.lean:52`、`Rows.lean:68`、`Rows.lean:137` 与 `ScaledMatrices.lean:71`。

我停下来的地方也要写清楚。`Nagata.FullNagata`、`OrderedDistinctPoints`、`EffectivePlaneCurve`、`curveDegree`、`curveMultiplicityAtLeast`、`IsConfigurationZariskiClosed`、`Nagata.W15`、`Nagata.W16`、`Nagata.W25`、`Nagata.ProjectiveGeometry` 这些被 `Nagata.lean` 引用的名字都不在我点开的文件里定义，它们沿 import 图更上游，例如 `Incidence.lean:1` 到 `Incidence.lean:4` 带出的 `ChartJets`、`ChartMultiplicityBridge`、`Homogenization`、`UniversalReduction`，以及 `UniversalReduction.lean:5` 与 `UniversalReduction.lean:6` 带出的 `ArithmeticReduction`、`Avoidance`。我在这些文件上只做了带名字的定点查询（在点开的文件里 grep `def FullNagata`、`OrderedDistinctPoints :=`、`def EffectivePlaneCurve`，命中只在 `Nagata.lean` 与 `FullTarget.lean` 的自有定义上，上游命中为零），没有遍历 117 份文件，也没有打开 `TorusCharts.lean`、`ThetaSeries.lean`、`QuotientSections.lean`、`CubicMap.lean`、`SectionKernels.lean`、`TorusConfigurations.lean`、`Configuration.lean`、`ThetaProducts.lean`。

json 的三项 `theorem_names` 与 `Nagata.lean` 的关系：`nagata_conjecture` 在 `Nagata.lean:148`，`nagata_conjecture_coordinates` 在 `Nagata.lean:162`，第三项 `Workers.W30.exists_positive_degree_equation_of_homogeneous_cycle` 不在 `Nagata.lean` 内部，我只在该文件第 45 行看到同模块的 `equationIdealCycle` 被使用；它是更上游的 cycle 桥接结果，被 `Nagata.lean:45` 到 `Nagata.lean:51` 的论证形态所需要。`permitted_axioms` 只有 `propext`、`Quot.sound`、`Classical.choice`，即没有引入新公理；`enable_nanoda` 为 `false` 说明该题不走数值反例通道。

一个有价值的观察：Lean 侧把 very general 编码成 $\mathbb N\to\Set$ 的一族闭集加"逐 $n$ 不属于"（`Nagata.lean:21` 到 `Nagata.lean:24`），把 proper 编码成不等于全集。tex 里 `introduction.tex:18` 到 `introduction.tex:20` 那句 chosen simultaneously for all degrees and multiplicity vectors 在机器里就是这个 $E$ 对 $(d,\mathbf m)$ 的独立性，它只随 $r$ 变。我在第 16 节末尾读到 tex 的归还方式时已经预感到机器必须这样编码，否则同时量词在类型里没法表达。

## 19 数值复算、量纲检查与外部对照

这一节集中放我为了相信自己而做的复算。凡是我自己算的数，我都标"复算"，凡文本给的，我给行号。

复算一，尺度方程。$\binom{d+2}{2}=r\binom{m+1}{2}$ 展开成 $d^{2}+3d=r(m^{2}+m)$，首项比给出 $(d/m)^{2}\to r$，一次项给出修正 $d/m=\sqrt r+O(1/m)$。我用 $r=10$、$m=1$ 试：$\binom{d+2}{2}=10$ 无整数解（$d=3$ 给 $10$ 恰成立，即九个点的三次曲线的计数同型），$m=2$ 时 $r\binom{3}{2}=30$，$\binom{d+2}{2}=30$ 无整数解（$d=6$ 给 $28$，$d=7$ 给 $36$）。这说明计数层面根本没有整数解可依据，任何"数一下"的论证都无法给出严格不等式，与路线 F 的结论一致。

复算二，平方赤字。$r-h^{0}(B,M)=k^{2}-(k^{2}+3k)/2=(k^{2}-3k)/2$。$k=4$ 时赤字 $2$，$k=5$ 时 $5$，$k=3$ 时 $0$。赤字为 $0$ 正是 $r=9$ 的九点三次曲线现象，也是 `introduction.tex:28` 那句话的定量版本。我在第 7 节写"$k\ge4$ 是精确假设"就依据这张小表。

复算三，$\rho$ 与 $\rho_{*}$ 的关系。$d/m=3+\rho/3$ 与 $\sqrt r=3+\rho_{*}/3$，所以 $\rho_{*}-\rho=3(\sqrt r-d/m)$ 恰是我在第 11 节用来选 $\Delta$ 的空隙 $g$。$r=10$、$d/m=117/37$ 时 $\rho_{*}=3(\sqrt{10}-3)\approx0.4868$，$\rho=3(117/37-3)=18/37\approx0.4865$，空隙 $g\approx0.00044$。这组数让我直观感到 Eckl 与 CDMR 的有理界离终点有多近：$\Delta$ 必须选在 $9g/\rho\approx0.0082$ 之内，而第 15 节的 $\lambda$ 也要在 $1$ 附近留 $O(g)$ 的余量。这就是为什么"任意大重数"必须靠公倍数放大来喂尺寸条件。

复算四，$\lvert\mathcal I\rvert$ 与 $\lvert\mathcal S\rvert$ 的差。$\lvert\mathcal I\rvert-\lvert\mathcal S\rvert=\frac12(rm^{2}+rm-d^{2}-2d)$。取 $r=10$、$m=37$、$d=117$（对应 $117/37$）：$\lvert\mathcal S\rvert=\binom{119}{2}-9\binom{38}{2}=7021-6327=694$，$\lvert\mathcal I\rvert=\frac{1\cdot37\cdot38}{2}=703$，差 $9$。我检查了它正合公式：$\frac12(10\cdot1369+370-13689-234)=\frac12(13690+370-13923)=\frac{137}{2}$，不等于 $9$，说明我把 $q=r-9=1$ 代进 $\lvert\mathcal I\rvert$ 时用的是 $q$ 而公式展开用 $r$，重算 $\lvert\mathcal I\rvert-\lvert\mathcal S\rvert=703-694=9$ 与 $\frac12(qm(qm+q)-\dots)$ 的比较需要按 $q$ 展开。最终我用文本给的两个式子直接算数，得 $9$，并在第 2 节路线 F 里保留"行数不少于列数"的结论，把系数展开式当作近似式引用，暂不当作精确恒等式。这次算错让我把路线 F 的措辞改成"方向反了"，避免给出错的闭式。

勘误补记（接复算四，落在此处以便与前文对照）。那笔算错的病因为我后来定位到了：我把 $\binom{d+2}{2}$ 展开成 $\frac12(d^{2}+2d)$，正解是 $\frac12(d+1)(d+2)$，两者差 $\frac12(d+2)$，于是上面那句 $\frac{137}{2}$ 恰是错误展开式的产物（$117\cdot119=13923$，$14060-13923=137$）。按 $\lvert\mathcal S\rvert=\binom{d+2}{2}-9\binom{m+1}{2}$ 与 $\lvert\mathcal I\rvert=q\,m(m+1)/2$、$q=r-9$ 重算，闭式是
$$\lvert\mathcal I\rvert-\lvert\mathcal S\rvert=\frac{r\,m(m+1)-(d+1)(d+2)}{2},$$
推导里唯一一步是 $q+9=r$，即 $\mathcal I$ 的定义把那 $9\binom{m+1}{2}$ 项恰好吸收回去，所以最终式子里只剩 $r$。我用三个同时满足 $d>3m$ 与 $d/m<\sqrt r$ 的三元组核对：$(r,m,d)=(10,37,117)$ 给 $\frac12(14060-14042)=9$，与复算四直接数出的 $703-694=9$ 一致；$(13,4,14)$ 给 $\frac12(260-240)=10$，逐项算是 $\lvert\mathcal I\rvert=4\cdot4\cdot5/2=40$、$\lvert\mathcal S\rvert=120-90=30$；$(10,63,199)$ 给 $\frac12(40320-40200)=60$，逐项算是 $\lvert\mathcal I\rvert=2016$、$\lvert\mathcal S\rvert=20100-18144=1956$。
我要把这条修正的用途说清，免得它被误读成第 16 节的第二个证明：差值为正只说明集合计数不阻碍满秩，它给不出任何不等式方向上的推动，这正是第 2 节路线 F 记下的失败理由。前文"方向反了"的措辞我保留，因为当时判断的是总数比较这条路的可用性，那个判断与新闭式无冲突；新增的只是把当时不敢写的闭式写对，并把三个数字钉在这儿供后端复核。第 16 节的满秩靠的是两个行界逐行卡住 $N_K$，与总数比较无关，这一点在第 14 节末尾已经交代过。


复算五，$n_j$ 与折线上支。$n_j=h-9(j-m)$ 在 $j=u_0$ 时的值我按 $d=3u_0$ 与 $d=3u_0+1$ 分别代过：前者 $n_{u_0}=0$，落入零度块，后者 $n_{u_0}=3$，仍有区间 $(U_{u_0},U_{u_0}+3)$，含 $3$ 个整数因端点无理。这与 `03-limits.tex:276` 到 `03-limits.tex:278` 的"最后一段除非 $3\mid d$ 否则空"一致。

复算六，$\delta_P$。取样例 $x_i=x_0-i\Delta/45$，$x_0-x_i=i\Delta/45$，最大值 $i=9$ 给 $\Delta/5$，故 $\delta_P=\min_i\{i\Delta/45,\,1-i\Delta/45\}=\Delta/5$（因 $\Delta<1/2$ 使 $\Delta/5<0.1$，另一支都大于 $0.9$）。第 13 节的 $|\log\tau|>5R/\Delta$ 就是从 $\delta_P|\log\tau|>R$ 来的，我把它写成显式形式以便看出对 $\Delta$ 的敏感度：$\Delta$ 越小，允许的 $\tau$ 下限越高，而这与第 16 节放大 $m$ 无关，因为 $\tau$ 的门槛只碰 $\Delta$ 与 $R$。

复算七，图的尺度不一致，见第 15 节末。我把 panel (a) 与 panel (b) 的四个数值都解了一遍，确认它们对应两套不同的 $a$，于是接受 caption 的 "schematically"。

量纲检查三条。第一，$Y=(K-U_0)/m$ 与 $X=j/m$ 同为无量纲，多边形 $\mathcal D_\lambda$ 的所有系数（$a$、$9$）都乘在无量纲量上，其中 $9$ 来自 $k^{2}$（$k=3$），$a$ 来自 $k(\sqrt r-k)$。第二，尺寸条件 $q(1-\lambda)m\ge1$ 左边是"个数"，右边是 $1$，量纲一致；若我漏掉 $q$ 会破坏 $r=10$（$q=1$）以外的标度。第三，$h=m\rho$ 与 $n_j$ 都应是整数，我从 $\rho=3(d/m-3)$ 得 $m\rho=3(d-3m)$，整数性显式，这解释了 `02-elliptic.tex:245` 里两个写法并列的理由。

外部对照。我没有从外部来源取任何论证，只用它们核对问题陈述与历史坐标的说法。可核对链接列在下面，说明我核对到了什么程度。

关于 Nagata 本人与其猜想的常见表述，见 Masayoshi Nagata 的词条 <https://en.wikipedia.org/wiki/Masayoshi_Nagata>；我用它核对"这个问题与 Hilbert 第十四问题相关"这一句在公开材料中的通行性（tex 的位置在 `introduction.tex:7`），没有从该页取任何定理陈述。

关于平面上点列、fat points 与 Nagata 型问题的公开综述，我核对到 Harbourne 的会议材料 <https://www.math.unl.edu/~bharbourne1/NapConf.html>，标题是 Problems and Progress on Points in P2；它对应 tex 里 `introduction.tex:55` 到 `introduction.tex:62` 提到的 Ciliberto--Harbourne--Miranda--Roe 与 Harbourne 本人这条研究线。我只用它确认"这条线确实在研究 $\Pp^{2}$ 上点的线性系统与 Seshadri 型常数"，未据其引用具体定理号。

关于 Seshadri 常数与 Nagata 猜想在当代文献中的关联表述，检索另给出一篇 arXiv 预印本 Xeric varieties（<https://arxiv.org/html/2508.05560v1>），我打开过其摘要级内容，仅用来确认这类关联表述在近期文献中的存在，与本篇论证无关，不作为来源。

我要如实登记检索的失败面：我想外部核对 `introduction.tex:76` 引用的 Ciliberto--Miranda--Roe 2026 构造无理平方零 nef 射线这一条，以及 `03-limits.tex:331` 引用的 Dumnicki Proposition 13，两次网络检索都返回与主题无关的结果，我没找到可核对的公开页面。因此本篇里凡涉及这两条的说法，我都只按 tex 的原文位置转述，没有补充任何书目细节、年份或页码。同理，`03-limits.tex:20` 的 Evain 与 `02-elliptic.tex:159` 的 Rosengren 我也只按 tex 给的定位转述。文中出现的 Stacks Project 标签号（`01-reductions.tex:110` 的 Tag 0B3P、`01-reductions.tex:251` 与 `01-reductions.tex:285` 的 Tag 0C1Z、Tag 01XT）我只按 tex 抄录，没有自行查证标签内容。

## 20 数值台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\binom{d+2}{2}$ | 形式系数个数 $\sim d^{2}/2$ | introduction.tex:23 | 尺度猜测与 $\varepsilon$ 上界 | 首项失衡则 $d=m\sqrt r$ 不再是临界 |
| $r\binom{m+1}{2}$ | 条件数上限 $\sim rm^{2}/2$ | introduction.tex:24 | 同上 | 计数失去标度依据 |
| $d/m=\sqrt r+O(1/m)$ | 临界比值的修正 | 我的复算（introduction.tex:25） | 第 1 节 $C_{0}$ | 若把 $O(1/m)$ 当零会误判整数解存在 |
| $r\ge16$ | Nagata 自证的平方范围 | introduction.tex:8 | 历史对照 | 与本文 $r\ge10$ 的差无法解释 |
| $r\ge10$ | 本文范围 | introduction.tex:9 | 归化引理与 $q\ge1$ | $r=9$ 时九点三次曲线使等号成立 |
| $\sqrt{r-1}-\pi/8$ | Roe 的一致下界系数 | introduction.tex:59 | 说明有理界封顶 | 无理终点无从取得 |
| $117/37$ | 十点最优有理界（复算 $\approx3.16216$） | introduction.tex:64 | 第 19 节 $\Delta$ 选取 | 空隙 $g\approx0.00044$ 消失则 $\lambda$ 不可选 |
| $\mathsf U_r(d,m)$ | 对每个构型都成立的系统 | 01-reductions.tex:22 | 全文反证的主语 | 归化失效，无法自由选择构型 |
| $d_0\sqrt r\le\sum_i m_i$ | 违反假设 | 01-reductions.tex:41 | 循环乘积 | 比值不等式推不出 |
| $d=rd_0$ | 放大后的次数 | 01-reductions.tex:86 | 齐次化 | 公共重数无法合成为标量 |
| $m=\sum_i m_i$ | 公共重数 | 01-reductions.tex:88 | $d/m\le\sqrt r$ | 端点不等式反号 |
| $\mathsf U_r(Nd,Nm)$ | 幂次封闭 | 01-reductions.tex:45 | 第 16 节放大 | 公倍数不合法，尺寸条件无从满足 |
| $2r$ 个代数无关坐标 | 避开可数多个闭集 | 01-reductions.tex:69 | $U_r\setminus E_r$ 非空 | 补集可能空 |
| $\lfloor d/k\rfloor$ | 纤维次数上限 | 01-reductions.tex:126 | 平方情形 $j\le m$ | $j$ 可能超界使求导无效 |
| $u=\min_\alpha(\alpha+j_\alpha)$ | 最低阶切片 | 01-reductions.tex:175 | $F\ne0$ | 各项指数可能重合而相消 |
| $(k^{2}+3k)/2$ | $h^{0}(B,M)$ 的值 | 01-reductions.tex:288 | 求值像不满 | 赤字为负则选不出像外的 $c$ |
| $(k^{2}-3k)/2$ | 赤字（复算：$k=3$ 时为 $0$） | 01-reductions.tex:288 | $k\ge4$ 假设 | 九点三次曲线的反例回来 |
| $A=M(-P)$ 非挠 | 零度非平凡丛 | 01-reductions.tex:268 | 等号 $d=km$ 排除 | $A^{m-j}$ 可能有截面 |
| $k(d-kj)\le r(m-j)$ | 次数与零点数比较 | 01-reductions.tex:305 | $j<m$ 排除 | 不等号反方向则论证整体失效 |
| $f_m(w-c_i)^{m}$ | 纤维上的限制式 | 01-reductions.tex:320 | 次高项比较 | 无法定位 $f_{m-1}$ 的求值 |
| $-mf_m$ | 系数比较的标量 | 01-reductions.tex:324 | 与像外的 $c$ 矛盾 | 乘零常数则矛盾消失 |
| $L^{d-3j}(-(m-j)P)$ | 九个零位移后的系数丛 | 01-reductions.tex:345 | 换坐标定义 $V_j$ | 负幂无法抵消，$\widetilde F$ 不延拓 |
| $3(d-3m)$ | 与 $j$ 无关的次数 | 01-reductions.tex:352 | $T$ 的定义与块统一次数 | 多边形不再是相似族 |
| $d>3m$ | 低位排除结论 | 01-reductions.tex:358 | $\rho>0$、$h>0$ | 第 11 节所有正度丛消失 |
| $3(d-3j)<9(m-j)$ | 零度过载判据 | 01-reductions.tex:369 | $d<3m$ 案 | 系数可能非零 |
| $\widetilde F(v)=\sigma_P^{-m}F(\sigma_P v)$ | 纤维坐标替换 | 02-elliptic.tex:91 | 九零点内建 | 九个约束仍需逐条验证 |
| $V_j$ | 两段系数空间 | 02-elliptic.tex:37 | $\W$ 为直和 | 紧性论证无规格化基 |
| $\Theta(\tau z)=-z^{-1}\Theta(z)$ | 乘性 theta 变换 | 02-elliptic.tex:147 | $D(1,-a)$ 与 $\Pi$ 的符号 | $D(9,-\tau^{\sum x_i})$ 的负号错 |
| $c_{K+np}=c_K\gamma^{-p}\tau^{pK+np(p-1)/2}$ | Laurent 递推 | 02-elliptic.tex:170 | 归一化基与 $s_{K,\tau}$ | 极限不是 $e^{Kx}$ |
| $q=r-9$ | 碰撞点数 | 02-elliptic.tex:236 | 行界与高度区间 | 切片公式失去与 $a$ 的关系 |
| $\rho=3(d/m-3)$ | 斜率间隙 | 02-elliptic.tex:237 | $h=m\rho$ | $h$ 可能非正 |
| $\rho_{*}=3(\sqrt r-3)$ | 无理参数 $a$ | 02-elliptic.tex:238 | 乘子、多边形斜率 | 无理端点性质失效 |
| $2\rho_{*}+\rho_{*}^{2}/9=q$ | 我复算过的恒等式 | 02-elliptic.tex:239 | 切片高度区间长度 | 两处出现不一致，第 15 节崩溃 |
| $x_0=1/2$ | 图心指数 | 02-elliptic.tex:248 | $\delta_P$ 与单射性 | 盘可能与 $P$ 相交 |
| $\Delta$ | 有理间隙参数 | 02-elliptic.tex:251 | $U_j$ 非整与 $\lambda$ 余量 | 整数端点歧义回来 |
| $x_i=x_0-i\Delta/45$ | 九点样例 | 02-elliptic.tex:268 | $\sum(x_0-x_i)=\Delta$ 检查 | 和式条件不满足 |
| $\eta=(\sum_i x_i+\rho_{*})/3$ | 归一化指数 | 02-elliptic.tex:263 | $L=D(3,\tau^{\eta})$ | $A$ 的乘子不再是 $\tau^{\rho_{*}}$ |
| $A=D(0,-\tau^{\rho_{*}})$ | 平凡度丛的乘子表示 | 02-elliptic.tex:299 | $U_j$ 的区间端 | 换同构表示会平移整数 |
| $\mathcal I$ | 行数 $qm(m+1)/2$ | 03-limits.tex:100 | 尺寸与满秩目标 | 行集与理想 $(x^{q},y)^{m}$ 脱钩 |
| $Q^{m-b}\mid h_b$ | 碰撞前的局部条件 | 03-limits.tex:94 | 极限条件推导 | 无法得 $x^{q(m-b)}$ 整除 |
| $\delta_P=\Delta/5$ | 复算的避 $P$ 距离 | 03-limits.tex:112 | 公共图合法性 | 需 $\lvert\log\tau\rvert>5R/\Delta$ 才成立 |
| $U_j=\frac{h}{9}(\rho_{*}-\Delta)+(m-j)\rho_{*}$ | 低块区间端 | 03-limits.tex:234 | $\mathcal S$ 定义 | 折线下支斜率错 |
| $n_j=h-9(j-m)$ | 高块长度 | 03-limits.tex:240 | 折线上支斜率 $-a-9$ | 外包多边形不再相似 |
| $\lvert\mathcal S\rvert=\binom{d+2}{2}-9\binom{m+1}{2}$ | 列数（复算见第 19 节） | 03-limits.tex:303 | 满秩命题的目标 | 与 $\dim\W_\tau$ 脱钩，基计数失效 |
| $B_0=(K^{\ell}j^{b})$ | 极限矩阵 | 03-limits.tex:345 | 满秩与单射传递 | 逐元素极限不成立则 $J_\tau$ 单射无从传递 |
| $\tau^{-x_0K}$ | 可趋于 $0$ 或 $\infty$ 的规格化 | 03-limits.tex:371 | 每个 $\tau$ 上基可逆 | 需连续核向量，路线 E 复活 |
| $N_K\le m$ | 行大小界 | 04-interpolation.tex:35 | 插值引理第一假设 | $J$ 方向次数预算溢出 |
| $q(m-t+1)$ | 大行个数界 | 04-interpolation.tex:36 | 插值引理第二假设 | $K$ 方向次数预算溢出 |
| $U_0=\frac{h}{9}(a-\Delta)+ma$ | 竖移基准 | 04-interpolation.tex:86 | 缩放多边形定位 | 外包关系整体平移失效 |
| $\lambda a-9(1-\lambda)>\rho+\Delta\rho/9$ | $\lambda$ 的选取条件 | 04-interpolation.tex:100 | 外包引理 | 区域伸出 $\mathcal D_\lambda$ |
| $w(Y)$ 分段 $1-Y/a$ 与 $1+Y/(a(1+a/9))$ | 切片宽度剖面 | 04-interpolation.tex:176 | 超水平集区间 | 最大长度非 $1$ 则 $N_K\le m$ 失 |
| $(1+a/9,-a(1+a/9))$ | 多边形下顶点 | 04-interpolation.tex:207 | 图的示意性核对 | panel (a) 的两坐标无法同时满足 |
| $q(m\lambda-s)$ | 高度区间长度 | 04-interpolation.tex:191 | 第二行界 | 行数上界错一个因子 |
| $q(1-\lambda)m\ge1$ | 尺寸条件 | 04-interpolation.tex:256 | 吸收整数端点 $+1$ | 满秩命题失去前提 |
| $e_n=\lceil\sqrt r(n+1)\rceil$ | 上界测试次数 | consequences.tex:68 | $\varepsilon\le1/\sqrt r$ | 不等式反向则存在性失 |
| $N_r=\sqrt r\,H-\sum_i E_i$ | 严格 nef 且 $N_r^{2}=0$ | consequences.tex:52 | 引言的推论陈述 | 例外曲线交非 $1$ |
| $\varepsilon=1/\sqrt r$ | 多点 Seshadri 常数 | consequences.tex:55 | 摘要与引言 | 无理性与严格不等式脱钩 |
| $6759$ B | `Nagata.lean` 实测字节 | Nagata.lean:1 | 第 18 节 import 链起点 | 链断，无从定位链上文件 |
| $466$ B | `Nagata.json` 实测字节 | Nagata.json:2 | 主登记记录判定 | 三项声明名与文件对应不上 |

### 文末自检

字节实测、节号连续性与各项计数见交付报告。台账数据行数我另行 `grep` 计数登记。全文 `$` 计数与逐行奇偶我另行脚本核对，结果登记在交付报告里。禁串命中以派单列出的条目为准逐条 `grep`，命中数登记在交付报告里，本段不复述任何被检串的字形。表头两行按规格逐字，数据行的数学直接写在 `$` 里，绝对值用 `\lvert` 与 `\rvert`，整除用 `\mid`，未使用裸竖线、未使用占位短横。前向引用共三处（第 1 节、第 2 节、第 3 节指向第 4 节及以后），对应节均已写实文。

上面那句"共三处"是我早先只数了四个强制小节里的指向得到的，实测不符，在此更正并把计数落成脚本输出：全篇形如"第 $k$ 节"的交叉引用共 $104$ 处，其中指向前方小节（$k$ 大于所在节号）$33$ 处，指向后方 $67$ 处，指向本节自身 $4$ 处；$33$ 处前向指向的目标节号全部落在 $0$ 到 $20$ 的实存节内，无悬空。前向引用的分布按所在节统计为：第 $0$ 节 $1$ 处、第 $1$ 节 $2$ 处、第 $2$ 节 $4$ 处、第 $3$ 节 $2$ 处、第 $4$ 节 $5$ 处、第 $5$ 节 $3$ 处、第 $6$ 节 $2$ 处、第 $7$ 节 $2$ 处、第 $8$ 节 $2$ 处、第 $10$ 节 $4$ 处、第 $11$ 节 $4$ 处、第 $14$ 节 $1$ 处、第 $15$ 节 $1$ 处，合计 $33$ 处。这组数是本次收稿时用脚本重跑得到的，比我初稿的估计更细，我保留初稿那句原话，因为它的错本身就是这个笔记要记的东西之一：我习惯用手数三处然后相信它。
