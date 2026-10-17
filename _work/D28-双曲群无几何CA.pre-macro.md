# D28 反推思维链：一个没有几何 CAT(0) 作用的双曲群

对象论文：A hyperbolic group with no geometric CAT(0) action，preprint 目录
E:\math\preprints\A-hyperbolic-group-with-no-geometric-CAT0-action-September-25-2026\，
正文 build\sections\01-07.tex 共 2,659 行（01: 180，02: 137，03: 671，04: 533，05: 591，06: 477，07: 70，我实测 wc -l）。
形式化：preprint 目录下没有 lean\（我逐层 ls 确认）；按任务约束改用主仓库 E:\math\lean\，
实测目录为 OAI\Geometry\HyperbolicGroups\ 与 ComparatorChallenges\HyperbolicObstruction.lean，全部数字见 §10。
素材：E:\math\研究笔记\素材\双曲群无几何CAT0作用-素材.md，487,103 字节、6,777 行（我分 16 段读完全文；
写作前后各复核一次 wc，期间文件未再增长）。素材 A-0.2 记录了并发写入历史（110,969 → 157,262 字节阶段差），
所以本笔记所有素材行号以下表最终态为准。
PDF：paper.pdf 加密，规则禁用 pdftotext，我未使用；全部引文出自 .tex 源码并抽查复核行号。
外部思维链材料：E:\math\reasoning_traces\ 的 16 个条目没有一个匹配本论文标题或关键词（hyperbolic、CAT0、
geometric action 三轮 grep 皆零命中），没有 summary。下文凡涉及"作者当时怎么想"，除论文正文自述外全是
文本证据重建，一律带 [推测]。

记号约定：N 是字母表规模。论文取 S_n = {a_1, a_1^{-1}, …, a_n, a_n^{-1}}，N = 2n
（02-model.tex:42-45，逐字 "S_n=\{a_1,a_1^{-1},\ldots,a_n,a_n^{-1}\},\qquad N=2n"）。
三个随机参数 f = 2−α，p = 3−β，0 < α, δ < 1，7α < β < 1（02:47-50）。
模板图 Γ 的 32 条边叫核心字段；90 个四字母表的每条表行有 2 个核心字段加 2 个新字段。
凡我自己算出的数字标 [计算]；凡论文没写而素材补的推导标 [补]；凡从文本反推作者动机标 [推测]。

## 0 我进场时手里有什么

我现在在做这篇论文的反推笔记。进场前我以为自己会看到三类东西之一：
一个密度模型 d 略过 1/6 的随机群变体（Ollivier–Wise 那条线），
一个 Rips–Sela 式短正合列把某个病商群塞进双曲群，
或者一个带性质 (T) 的双曲群加 Izeki–Nayatani 非线性谱隙直接杀掉 CAT(0) 作用。
读完目录和 01-introduction.tex 前 20 行，三条全错。论文定理 1.1 逐字是：

```tex
There exist a finite connected two-dimensional aspherical simplicial complex $K$ and a constant $C<\infty$
with the following properties.
(i) Every combinatorial edge loop of length $\ell$ in the universal cover of $K$ bounds a disk diagram
with at most $C\ell$ triangular faces.
(ii) The group $\pi_1K$ admits no geometric action on a proper complete $\CAT(0)$ space.
In particular, $\pi_1K$ is word-hyperbolic, and no finite simplicial complex homotopy equivalent to $K$
admits a locally $\CAT(0)$ geodesic length metric inducing its given topology. Consequently, no such
model admits a compatible locally $\CAT(-1)$ geodesic length metric.
```
（01-introduction.tex:6-13，我在 build 源码逐字复核，enumerate 环境里的 (i)(ii) 排版本笔记压平。）

这个形态我进场前完全没料到：合取支 (i) 是一个正向的组合几何性质（线性 Dehn 函数），
合取支 (ii) 是对一切 proper complete CAT(0) 空间的否定，两者同在一个群上成立。
它回答的问题形态是 Gromov 的实现问题（realization problem）（01:19-31 给了三个公开问题坐标：
Raussen–Skau 访谈里 Gromov 自述"花了很多年找负曲率几何实现"（01:19-25）；
Baumslag–Myasnikov–Shpilrain 1999 问题表 H11；Stark 2025 综述 Open Problem 2.15；
Duchesne–Simon 2026 年 3 月预印本 Question W）。
几何作用一词论文在 01:4 就钉死定义：proper、cocompact 的等距作用，且有限复形的度量模型必须用
给出复形原拓扑的测地长度度量。我后文会反复回来敲这条限定，因为 Lean 的 formalization
（§10 差异表 D1）在 proper 的写法上和常见 Bornology 版本有出入。

初始猜想记录（留给 §13 对照用）：我猜无 CAT(0) 作用的证明要靠群自身的不变量
（挠、(T)、边界拓扑），而填充不等式只是副产品。读完 §5-§6 之后这条被彻底推翻：
不变量路线在论文里一次都没出现，排除作用的全部力气花在"极限构型的有限几何矛盾"上，
填充不等式反道是与排除同一次抽样构造的共存结论。
语料与队列登记：本篇研究的语料目录为 preprints/A-hyperbolic-group-with-no-geometric-CAT0-action-September-25-2026，在队列中占队列第 18 行号；§14 补表与 §15 起重述节的全部位置证据都取自该目录 build 下的 .tex 文件。

## 1 我先走的四条错误路线，和它们各自的机械失败原因

路线一：经典障碍（挠元、无限阶根、性质 T）直接阻断 CAT(0) 作用。
失败原因（可落地）：定理 1.1 要求 K 单连通覆叠可缩，asphericity 有限复形的 π₁ 无挠是标准推论
（素材 3.5 第 5 条确认论文全文没写 torsion 这个词，我也 grep 过 01-07.tex：零命中）；
而双曲 + (T) 群在 CAT(0) 上的障碍要么需要目标空间额外正则性，要么只否定有限维 cubulation，
拿不到"任意维 proper complete CAT(0)"这一强度。Brady–Crisp 2007 只做到排除二维目标
（01:48-59 逐字："Their conclusions rely on constraints on translation lengths in two-dimensional
targets. Theorem 1.1 excludes geometric CAT(0) actions in every dimension."），
论文自己把"全维度"当增量声明，等于告诉我经典障碍路线的天花板。
路线二：cubulation / virtually special 反证。
失败原因：这条路线给出的是正向行动机，不是负向障碍；论文正文里 special、cubulation、RD3 零出现
（素材 3.5 第 6 条 + 我复核）。Ollivier–Wise 只以密度模型工具身份出现（01:40-46），
并且紧跟一句限定："the relations used here must enforce an additional obstruction"。
[推测] 作者写这句时是在排除一条他知道别人会走的路：密度小于 1/6 的随机群几乎必然 cubulate，
所以密度模型本身造不出反例，必须往关系里加额外阻断。
路线三：直接套 Izeki–Nayatani 框架的非线性谱隙 + Toyoda 型一致谱界。
失败原因（论文自述，非我猜）：01:73-92 的 lineage 段逐字说 Toyoda 的谱界只对
"a prescribed finite family of geodesically complete CAT(0) spaces admitting proper cocompact actions,
with constants depending on that family"成立；而本文的假想目标是"呈现已知之后才被选出来的作用"
（"Here a hypothetical target and its action can be chosen after the finite presentation is known"）。
量化方向错了：现成定理要求先给目标族后建图，本文要求对后选目标一致成立。这条失败原因直接催生了
§5 的三件套（位移界、TV 耦合、Sturm 归纳均值）作为自建统一性来源。
路线四（我自己的误判）：以为构造是单实例。
失败原因：定理 1.1 的存在性若由单个随机实例实现，就需要在该实例上证明严格度量等式
（后文 ⟨M_A, M_B⟩ = −1 这种等号）；抽样统计只给 o(1)，单实例上任何 ε 界都漏。
论文用 §7 对角线序列把"每个固定测试在足够大的 j 成立"打包成一条确定序列，
再在乘积/超滤里取极限把 o(1) 洗成 0。我最初想跳过 §7，读完 prop:completion-no-action
（07:35-42）才明白排除只能发生在子列层面："Suppose, more generally, that infinitely many G_j
admitted such actions."（07:37 逐字）。

## 2 论文的四个真实转折点

转折一，双重要求（01:95-97 逐字）：
> The construction must satisfy two requirements: its relations must be sparse enough to preserve
> hyperbolicity and asphericity, yet impose enough metric constraints to exclude geometric actions
> on proper CAT(0) spaces.
这句话把全文切成三块：稀疏性归 §3（图与线性填充），度量约束归 §5-§6（能量与锥矛盾），
§4（采样）负责让约束对"后选的作用"仍然有效。[补] 我核对过 §2 模板的选取顺序与这句一致：
先设计几何（Fano 入射图 + 加倍 + 一条松边），再设计概率（四个 Bernoulli 阵列），
01:98-111 那段模板流水正是按这个次序写的（素材 3.4 第 8 条）。

转折二，选择顺序（04-sampling.tex:3-8 与 05-energy.tex:3-8）：
> The relations will be tested against an action chosen after all the tables have been sampled.
> We therefore prove statements about total variation of finite distributions on table matches.
> These statements do not refer to a target metric space.（04:3-7）
> The order is important: we first obtain a bound on every generator displacement using the
> pointwise relative counts in the six-letter table. Only then do we use total variation estimates
> for action-dependent functions.（05:5-8）
[补] 颠倒顺序在机械上是错的：TV 估计要求被积函数一致有界，一致有界性又来自位移界，
位移界的证明只用非负权重（05:161-164："This uses only nonnegative weights, and therefore holds
even when the weights were chosen from an action after the table was revealed"）。
三句话在三个文件里各说一遍，作者显然怕读者混序。

转折三，闭包 U 的诞生（04:105-112 逐字）：
> The purpose of this enlargement is to make every further extension increase the critical exponent.
> For example, if I consists of two fields in one fan F_i, then completing that fan leaves the
> exponent unchanged: h(I) = 2 = h(E(F_i)).
先给目的再给一个让朴素做法失效的具体例子，这是全文最接近思维链自白的一段。
两条字段在同一条 fan 里时，把整个 fan 补进来指数不变，朴素耦合会漏掉"免费扩张"，
整数间隙 h(U∪V) − h(U) ≥ 1 就没了，Star 构造的方差控制随之失效。

转折四，省略一条边（02:12-16 定义逐字）：
> Both representatives over a point are joined to each incident line, with one exception:
> the edge $Y_D$--$CD$ is omitted. The edge $e_0=X_D$--$CD$ is called the loose edge.
我读完 §6 才回收这条边的全部重量：正是 Y_D–CD 的缺失让 D 处只剩两条完整线
（"the full lines at D are AD, BD"，06:116 附近），M_D = h_AD ⊕ h_BD 才有良定义；
而 CD 与 X_D 的松边给出与 mid(X_C,Y_C) 垂直方向的第二边，供 §5 末三元中点测试。
[推测] 一条边换一个矛盾，这是全文设计密度最高的一步；素材 2.35(d) 给的判断与我一致：
若 Y_D–CD 保留，D 处三条完整线需要三个 ⊕ 相加，而 ⊕ 无结合律（06:26-27 逐字限定
"no associativity or cancellation law will be used"），整条轴论证当场断掉。

## 3 模型层复原（论文 §2，02-model.tex）

### 3.1 入射模板与数据表

def:template（02:5-17）把 Fano 平面 PG(2, F₂) 的七个点认作 F₂³ 的非零向量，
线是二维子空间的三个非零向量；加倍四个点 A = e₁, B = e₂, C = e₃, D = e₁+e₂+e₃
（"No three of these four points are collinear"，02:10，[计算] 我在 F₂³ 里逐一验过：
A+B=e₁+e₂ 不是 D，A+C、B+C 同理，故四点中任三点不共线 ✓，这保证后面任意三点型六边形存在）。
二部图 Γ 的顶点：7 个 X_i、4 个 Y_i（A,B,C,D 各一）、7 条线，共 18 个。
数据账本（02:19-28 逐字）：

```tex
Each $F_i$ is connected. At $A,B,C$ it is $K_{2,3}$, at $D$ it is $K_{2,2}$, and at each of the
other three points it is a three-edge star. Let $g=7$ and $k_i=|E(F_i)|$. Thus
$(k_i)_i=(6,6,6,4,3,3,3),\qquad \sum_i k_i=31,\qquad |E(\Gamma)|=32$.
The graph has $18$ vertices. Its cycle rank is $15$; the sum of the cycle ranks of the fans is $7$.
```

[计算] 全部复核通过：A,B,C 处 fan 有 2 个代表 × 3 条线 = 6 边（K_{2,3} ✓）；
D 处 X_D 连 AD,BD,CD 三线、Y_D 只连 AD,BD，删 CD 后 F_D 用 X_D,Y_D 对 AD,BD 共 4 边（K_{2,2} ✓），
且论文明说 "CD is not a vertex of F_D"；三个未加倍点各 3 边星。
Σk_i = 3·6 + 4 + 3·3 = 31 ✓，加松边 e₀ 得 32 ✓。
圈秩：Γ 连通（06 节六边形覆盖论证隐含），32 − 18 + 1 = 15 ✓。
fan 圈秩和：K_{2,3} 秩 = 6 − 5 + 1 = 2，三个共 6；K_{2,2} 秩 = 4 − 4 + 1 = 1；星秩 0；合计 7 ✓。
论文接着说 "We will first impose the cycles within the fans, then use a smaller graph of cycle
rank 8 to impose the remaining core relations"，[计算] 8 = 15 − 7 ✓，对应 §2.3 的宏观图 B
（把 Fano 入射图的 D–CD 边细分一次，15 个顶点 22 条边，22 − 15 + 1 = 8 ✓，02:93-97 逐字给出）。

字段、方向与核心六边形（02:36-38）：字段就是记录坐标，每条边位置一个字段，全部字段同字母表取值；
核心六边形由三个不共线点、三条连线、每个点上一个代表（六条入射都在）构成，
"the all-X choice is always permitted"；三条连续边至多含每个 fan 两个字段、松字段不属于任何 fan
（02:38 逐字），[补] 这条就是后面 admissible 定义 (i) 情形的几何来源。

### 3.2 四个独立 Bernoulli 阵列（def:tables，02:53-62）

逐字要点（我把四类压成四行，原文是 enumerate (i)-(iv)）：
(i) 每个点 i 一个由 S_n^{E(F_i)} 索引的阵列，每个元组以概率 N^{f−k_i} 入选，入选元组加类型叫 fan
出现 b；(ii) 由 S_n^{E(Γ)} 索引，每个完整核心元组以概率 N^{p−gf−1} 打标记；顶出现 a 是打了标记
且七个限制都是入选 fan 的元组；a → b 表示 b 是 a 七个槽之一。
(iii) 对 Γ 的每条无向非回溯二边路径 τ（选定序与方向）给一个独立四字段表：前两坐标是 τ 的两个核心
字段，后两坐标是新坐标；每行概率 N^{−2−δ}；关系词读 τ 再绕闭合路径接两个新字母。
(iv) 独立六字段阵列，S_n⁶ 中每个词以概率 N^{−3−δ} 入选，其词直接作关系。
(02:61 逐字) "All included rows in (iii) and (iv) are imposed, not only rows matching some top
occurrence. We call them decorations; their lengths are 2h, with h ∈ {2,3}."

[计算] 指数合法性：p − gf − 1 = (3−β) − 7(2−α) − 1 = −12 − (β−7α) < 0（02:67-69 逐字同式 ✓），
所以每项都是真概率。90 张四字母表的来源（02:64 逐字）：
"the eleven point-representative vertices contribute 10·C(3,2) + C(2,2) = 31 two-edge paths;
the line degrees are 5,5,4,5,5,5,3, contributing 59 more."
我复核：10 个 3 价点代表（7 个 X_i 加 Y_A,Y_B,Y_C）贡献 30，Y_D 二价贡献 1，共 31；
线顶点度数总和应等于边数 32：5+5+4+5+5+5+3 = 32 ✓（[补] 度数 4 的那条线正是 CD：
它连 C 的两个代表和 D 的 X_D，Y_D 被删边，3 + 1 = 4）；
ΣC(deg,2) = 5·10 + 6 + 3 = 59 ✓；31 + 59 = 90 ✓。

期望数账本（02:72-86 逐字转写）：每类 fan 有 N^{k_i} 个候选元组，入选期望 N^f；
固定核心元组要标记加七个独立 fan 条目，扇区共 31 字段：
N^{32} · N^{p−7f−1} · Π_i N^{f−k_i} = N^{32+p−7f−1+7f−31} = N^p ✓（[计算] 指数合并我逐项验过）。
四字母表期望 N^{2−δ}，六字母表期望 N^{3−δ}。02:81-86 的官方解读：
"Thus the expected exponents are just below 2 for fans and squares, and just below 3 for tops
and hexagons. ... The correlation between top occurrences is the reason that their shared fan
costs must be counted only once."
[补] 这句是 §3 图论里"共享 fan 成本只记一次"约定的出处；顶出现之间通过共同 fan 槽相关，
但顶标记相互独立（02:70 逐字 "top occurrences are correlated ... top marks remain independent"）。

### 3.3 群、二维复形 P 与 C₂ 商

字母呈现以 a₁,…,a_n 为生成元；每个入选 fan 与每个顶出现，把其图中所有闭路标签强加为关系；
装饰词也强加（02:89）。二维 CW 复形 P 的构造（02:91-104）：从字母 bouquet（顶点 o）出发；
对每个类型 i 的 fan 出现 b，贴 F_i 的锥（apex 记 b，每个顶点 v 一条径向边 r_{b,v}，
每条 fan 边给一个三角形：一条字母边两条径向边）；对每个顶出现 a，取细分过的宏观图 B
（Fano 入射图把 D–CD 细分一次），点顶点 i 映到 a 第 i 槽的 fan apex，线顶点与细分点全映到 o，
被细分的例外入射映到 r_{b_D,X_D} 接松字母边（02:101-103 逐字），贴 B 的锥；最后贴所有装饰多边形。
P 是二维的、有限的。

lem:model-presentation（02:106-115）逐字结论：
> The complex $P$ has the fundamental group of the letter presentation above. In particular,
> it has a quotient isomorphic to $C_2$.
[补] 证明机制三步：锥粘贴按 van Kampen 只商掉 π₁H 的像的正闭包、不添生成元；
fan 三角形把 fan 边换成过 apex 的径向路径，闭核心走路里 X_i/Y_i 的进出抵消，剩下宏观图闭路；
D 处唯一未被替换的边是松边，配 r_{b_D,X_D} 恰好还原例外入射。C₂ 商：Γ 与每个 fan 二部 ⇒
闭走路词长为偶；装饰长 4 与 6 也是偶；每个生成元映到 C₂ 非单位元即为满同态。
[机械理由] 这个 C₂ 商在 §7 是无限性论证的承重墙（χ(P̃) = |G|χ(P) = 1 强迫 |G| = 1 与之矛盾）。

rem:model-finite（02:117-119）逐字：
> The cone description records occurrences, not just relator words. If the same fan occurs in
> several tops, its cone is attached only once. A top occurrence has its own cone, and a decoration
> occurrence has its own disk.
[补] 这条约定在 §3 的重数计数里被消费：同一 fan 出现在多个顶里，锥只贴一次，但每个顶有自己的锥，
所以图的面积按"出现"计、成本按"不同出现"计，边界估计才不至于重复收费。

### 3.4 主模式 M 与 admissible 字段集

master pattern（02:122-124）：取一个顶出现连同七个 fan 槽，再加 90 条二边路径各自四字母表的一行；
该行的两个核心坐标与对应核心字段认同，两个闭合坐标新增；六字母阵列不在 M 内。
match 是 M 的字段赋值使所有需要的表项都在（含顶标记）；match 集记 Ω_n，非空时带均匀测度。
[计算] 字段数：32 个核心字段 + 2×90 个新字段 = 212，"Its 32+2·90 fields include the shared core
fields only once"（02:124 逐字）；Lean 的 Field := Edge ⊕ (TwoPath × Fin 2)，
card_fields = 212 用 decide 机器验证（Template.lean:36-40，我实测该行存在）。
行/成本数：7 fan 阵列 + 1 顶标记 + 90 四字母 = 98 行（Lean Row := Fin 7 ⊕ (Unit ⊕ TwoPath)，
card_rows = 98，IncidenceTemplate.lean:14-18 ✓ 与我的分解一致）。

def:admissible（02:126-133）逐字：
> A set of fields is admissible if it is either (i) a set of at most three distinct core fields
> containing at most two fields of each fan, or (ii) a set of at most two fields of a single square
> decoration in M. The loose core field does not count against any fan quota.
02:135 预告用途："(i) includes all three-edge half-paths of core hexagons. It also includes two
F_C fields together with the loose field, the combination that will produce the decisive midpoint
identity. (ii) includes every two-edge half-path in a decoration square."
[补] 三元中点、六边形半路、方形二步，§5 的三大度量测试各自认领一条 ✓。
02:137 收尾一句关键：match 有锚点后按路径读词给群元，闭路标签由 lem:model-presentation 与方形
关系全部平凡，故赋值与路径无关；"For any action and basepoint, it gives a corresponding
configuration of orbit points."（逐字）。轨道实现的出处就在这里，后面 §5.5 的 Γ̂ 轨道图只是
把这条延长到加中点之后的图。

（本篇 §3 覆盖素材 2.1-2.10；素材 2.2 的 figures/fano-template、figures/fans 两个 tikz 文件
我打开核对过与正文数据一致，无额外数字。）

## 4 图论层复原（论文 §3，03-diagrams.tex，671 行）

### 4.1 定理 3.1（thm:diagram）

(a) 逐字（03:10-15）：
```tex
Fix sufficiently small positive $\alpha,\beta,\delta$ with $\beta>7\alpha$, and put $f=2-\alpha$
and $p=3-\beta$. As $n\longrightarrow\infty$, the probability tends to one that $P$ is aspherical
and its letter presentation satisfies a linear disk isoperimetric inequality.
```
同节边界约定（03:4-8）逐字："All constants in this section may depend on the fixed incidence
template and on the fixed parameters, but not on $n$."，"occurrence" 定义为入选元组连同表类型。
(b) 三段式纲领（03:27-33 转写）：先对每个有界不同出现集给概率界；再把磁盘与球面图正规化，
使该界同时控制胞腔的重复拷贝；最后用平面分离子把大图切成有界 fragment 逐块求和。
同一估计两用：线性填充 + 万覆叠中无非零二维胞链（asphericity）。
(c) [机械理由] 指数的出处在 03:17-25 逐字给死：
```tex
The expected occurrence counts in Section~\ref{sec:model} have exponents $2-\alpha$, $3-\beta$,
and $h-\delta$ for fans, tops, and decorations of length $2h$. The local incidence geometry
compares these with the values $2$, $3$, and $h$. After shared fan costs have been accounted
for, the differences $\alpha$, $\beta-7\alpha$, and $\delta$ supply the strictly positive margin
in the boundary estimate.
```
这是 β−7α 的官方出处：fan 亏 α、top 亏 β、装饰亏 δ，top 的七个 fan 槽若各付 α 则净余 β−7α。
[计算] 所以 7 就是 g（fan 数），这条不等式与 β = 8α 的取法（04:463）合起来让 β−7α = α，
三个余量 {α/5 型、α、δ} 只差一个 1/5 因子，κ 的对称性由此来。
(d) [推测] 失败路线一：不正规化直接对有界"不同出现"求和。03:36-38 明说 rank 引理数的是不同出现，
而图可以反复用同一出现，界对拷贝失效；作者用两级正规化（顶 apex 的三角形归并成简单顶多边形、
fan apex 循环 link 无重复径向标签）补上这个洞。失败路线二：whp 语句若允许参数随 n 变，
fragment 阈值会失控，rem:quantifiers（03:664-671，全引见 4.6）专门把这条写死。

### 4.2 引理 3.3（diagram:rank，重合秩）

(a) 逐字（03:56-64）：
```tex
For each fixed integer $M$, with probability tending to one the following holds simultaneously
for every collection of at most $M$ distinct occurrences that contains all fan slots of its tops.
If the collection has $s$ tops and $u$ fans, then
 R\le (p-7f)s+fu+\sum_e(h_e-\delta),
where the sum is over its decorations and $2h_e\in\{4,6\}$ is the length of decoration $e$.
```
R 是无符号重合秩：字段位置数减去不同底层生成元数，字母与逆字母同值（03:49-55）。
(b) [补] 证明全链条（03:66-96，我把两处指数拆开对账）：固定表类型、fan 槽入射、
以及位置到无符号值类的分划（对固定 M 只有有限种）。设位置数 J。给一个秩 R 的模式贴字母
至多 C_M·N^{J−R} 种（每类选一个生成元，再逐位置选符号，符号因子由 M 控制）。
只数各表内互异出现，于是所需 Bernoulli 试验独立，入选概率的指数是
(p−7f−1)s + Σ_b(f−k_b) + Σ_e(h_e−δ−2h_e)。
[计算] 位置恒等式 J = s + Σ_b k_b + Σ_e 2h_e（每个顶贡献 1 个松字段，每个 fan 贡献 k_b，
每个装饰贡献 2h_e），相加得期望上界
C_M N^{(p−7f)s + fu + Σ_e(h_e−δ) − R}：
s 项 (p−7f−1)+1 = p−7f ✓；fan 项 Σk_b + Σ(f−k_b) = fu ✓；
装饰项 2h_e + (h_e−δ−2h_e) = h_e−δ ✓。三处逐项相消。
若 (★) 失败则该指数为负，固定规模下指数只有有限个，期望求和趋 0，Markov 论证给 whp ✓。
（03:88 逐字 "If Equation~\eqref{diagram:rank-bound} fails, this exponent is negative. There are
finitely many exponents to consider for the fixed size bound, so summing these expectations
proves the assertion."）
(c) [机械理由] "contains all fan slots of its tops" 的强制保留（03:31-33 逐字 "We retain every
fan slot of a top occurrence when making a collection of occurrences, even if a diagram uses only
some of those slots. This convention is essential to the counting argument."）服务于两处：
期望账里顶的 fan 成本按 7 个整槽收（否则 fu 项漏收）；layer-cake 用到 t_a ≥ j ⇒ w_b ≥ j
的传导（4.3）。共享 fan 只进 Σ_b 一次，正是相关性只收一次费的设计（02:86 呼应）。
(d) [推测] 失败路线：若允许同一 fan 出现在多个顶时被多张顶"部分使用"而不保留空槽，
顶成本 p−7f−1 就不再是下界，指数对账崩；论文坚持整槽保留，说明这条被想清楚过。
另一风险：R 若按有符号字母定义，符号因子进指数，界坏 C_M 常数；用无符号值类把符号剥离，
[补] 这是标准的 Antoniuk–Friedgut–Łuczak 手法（03:44-47 自陈 lineage）。

### 4.3 正规化、权重与 layer-cake（diagram:existence / normal-form / weighted-rank）

diagram:existence（03:127）：任何零伦词与非零二维胞链都有面积最小的初等图（03:144-160 定义：
有限个定向多边形 + 边反向配对成球面；内部面映到 fan 三角形、顶锥三角形或装饰盘；
坍缩区域与自由相消零代价）。diagram:normal-form（03:184）：可把最小图正规化到上述两条性质
且保持 prescribed 提升二维链。[补] 素材 2.12 的核对：正规化两步各消一类可约配置，
顶 apex 处消"同出现可约对"，fan apex 处消"重复径向标签"；我不再重复其逐段引文。
记号账（03:300-330）：T、Q、E = 选中顶多边形、fan 三角形、装饰盘数，A = T+Q+E；
t_a = 顶 a 的选中多边形数，t_e = 装饰重数；对 fan 出现 b：
r_b = 其上被表示的 apex 实例数，m_b = max_{a→b} t_a，S_b = Σ_{a→b} t_a，w_b = max{r_b, m_b}，
J_b = b 上部分实例数，P*_b = 该 fan 处被选松边数（非 D 型恒零）。逐字（03:324-330）：
"All fan slots of every selected top are included in these definitions, whether or not a polygon
of that top visits the fan. In particular \sum_b S_b = 7T."
[计算] ΣS_b = 7T：每个顶多边形有 7 个槽、每槽一个 fan，T 个顶多边形共 7T 次槽计数 ✓。
I = fragment 内部两条字母边的接触数（径向接触不计）；B_raw、B_rad 为边界字母/径向边数，
B = B_raw + B_rad。

(a) diagram:weighted-rank 逐字（03:343-351）：
```tex
Suppose Equation~\eqref{diagram:rank-bound} holds for collections of at most $8A$ occurrences.
Then I\le pT+f\sum_b(w_b-S_b)+\sum_e(h_e-\delta)t_e.
```
(b) [补] layer-cake 全推导（03:353-390）：给 b 的每个 fan 字段权重 w_b、a 的松字段权重 t_a、
e 的每字段权重 t_e。合法性：正规化 link 使 fan 字段在实例处至多用一次 ⇒ 重数 ≤ r_b ≤ w_b；
简单顶多边形用松边至多一次 ≤ t_a ≤ w_b（槽保留约定）；装饰拷贝每字段一次。
对每个整数 j ≥ 1，把 rank 不等式用于权重 ≥ j 的位置集合：这是合格收集
（t_a ≥ j ⇒ 对每个 a→b 有 w_b ≥ m_b ≥ t_a ≥ j，整槽闭合 ✓ 保留空槽的第二处消费），
规模 ≤ T + (7T+Q) + E ≤ 8A ✓ [计算]（8A 的出处）。对 j 求和：一个无符号类内
Σ(权重 − max) 即该类贡献，得 weighted-coincidence（03:370-376）
Σ_C (Σ_v wt(v) − max_v wt(v)) ≤ (p−7f)T + fΣ_b w_b + Σ_e(h_e−δ)t_e。
每个内部字母接触连接两个不同位置，把接触记账到"非该类最大权位置"的另一端：端点存在，
不同接触用不同实际边拷贝，故任一端点被记 ≤ 其重数 ≤ 其权重 ⇒ 左端控制 I。
右端用 ΣS_b = 7T 改写 fΣw_b = fΣ(w_b − S_b) + f·7T，与 (p−7f)T 合并成 pT + fΣ(w_b−S_b) ✓。
(c) [机械理由] "at most 8A"：接触界对 fragment 面积 A 自指（A 进规模约束也进结论）。
[补] 素材 2.13 指出这是把 rank 引理的固定 M 换成实现先定的一个大 M（≥ 全图最大 fragment
面积的 8 倍）后确定性使用。
(d) [推测] 失败路线：接触图若有环，朴素森林计数失效；03:391-393 逐字
"This argument allows arbitrary cycles and repetitions in the contact graph. It charges side
copies, and does not require the contacts to form a forest." 主动宣告避开了这条。

### 4.4 引理 3.5（diagram:apex，扇顶局部账）

(a) 逐字（03:396-405）：
```tex
For every fan occurrence $b$ in a fragment,
 \sum_{z\mapsto b}d_z+2(w_b-S_b) \le \frac12\left(\sum_{z\mapsto b}q_z+P_b^*\right)+2J_b.
Moreover 2\sum_bJ_b\le B_{\rm rad}.
```
(b) [补] 两个情形（03:406-491）。情形一 w_b = r_b ≥ m_b：简单顶多边形在该 fan 至多一个 turn
⇒ S_b ≥ Σd_z ⇒ 左端 ≤ Σ_{z→b}(2 − d_z)。逐个实例付费：完全 link、d_z=0 需至少 4 个 fan 三角形
（付 ½·q_z ≥ 2 ✓）；完全 link、d_z=1 时三角形排成 link 上两个不同 port 间的路径，通常 ≥ 2 条边，
唯一例外是过 port X_D 的路可以只 1 条边，此时其顶 turn 的松边由 P*_b 补付（[补] P*_b
非零仅 D 型的用武之地）；d_z ≥ 2 时 2 − d_z ≤ 0 免付。部分 link（d_z=0）付 3/2、d_z=1 付 1，
统一由误差项 2J_b 吸收。情形二 w_b = m_b > r_b：取达到 m_b 的顶 a₀，称其 turn 为 dominant；
非 dominant 选中面每个至多一个 turn ⇒ y ≤ S_b − m_b；代数恒等式
Σd_z + 2(m_b − S_b) = x + y − 2(S_b − m_b) ≤ x − y（03:432-434 逐字）。
完全 link 的循环 turn 表中 dominant-to-dominant 相邻界面数 ≥ dominant 数减其它数，
每个界面至少供一个选中三角形 ⇒ x − y ≤ ½(Σq_z + P*_b) +（部分实例误差 2J_b 吸收）。
径向误差：每个部分实例的 link 至少缺一步，缺口对应径向边界边，双计数得 2ΣJ_b ≤ B_rad。
(c) [机械理由] "simple top polygon has at most one turn at this fan" 是情形一 S_b ≥ Σd_z 的前提，
而这正是 normal-form 把顶多边形压成简单宏圈的原因（同一宏圈两次过同一 fan 可拆开，
与最小性矛盾 [补]）。P*_b 只在 D 型非零，又一次回收例外入射的特殊地位。
(d) [推测] 失败路线：若 fan 的 K_{2,3} 换成度更大的配置，d_z=1 的路径长下界 2 可能破
（port 组合更多），局部付费表要重排。证据：论文专门点名 X_D 例外，说明按 port 组合逐条验过。

### 4.5 引理 3.6（diagram:fragment）：κ 与 C₀ = 1/κ

(a) 逐字（03:493-502）：
```tex
Put \kappa=\min\{\beta-7\alpha,\alpha/5,\delta\}>0. If Equation~\eqref{diagram:rank-bound} holds
for collections of at most $8A$ occurrences, then every fragment of area $A$ satisfies
 A\le C_0B,\qquad C_0=\frac{1}{\kappa}.
```
(b) [补] 完整代数链（我逐步核对，无跳步）。把 apex-bound 对 b 求和并用 ΣS_b = 7T 与
"每个简单顶多边形至少三个 turn"（Σd_z ≥ 3T）得 nominal-apex（03:510-512）：
3T + 2(W−7T) ≤ ½(Q + P*) + 2ΣJ_b，其中 W = Σ_b w_b。
contact-bound 右端改写 [计算]：pT + fΣ(w_b−S_b) + Σ(h_e−δ)t_e
= (p−7f)T + fW + Σh_e t_e − δE（用 ΣS_b = 7T）
= [3T + 2(W−7T) + Σ_e h_e t_e] − Δ，
Δ := (β−7α)T + αW + δE。验证：3T + 2W − 14T + Σh_et_e − (β−7α)T − αW − δE
= (3−β)T + (2−α)W − 14T + 7αT + Σh_et_e − δE = (p−7f)T + fW + Σh_et_e − δE ✓（逐项吻合）。
于是 I ≤ ½(Q+P*) + 2ΣJ_b + Σh_e t_e − Δ = R_raw/2 − Δ + 2ΣJ_b，
这里 R_raw = Q + P* + Σ_e 2h_e t_e 是原始边拷贝总数 ✓ [计算] ½R_raw = ½(Q+P*) + Σh_et_e。
又 B_raw = R_raw − 2I（每条内部接触吃掉两份原始边，其余落边界），代入：
B_raw = R_raw − 2I ≥ R_raw − (R_raw − 2Δ + 4ΣJ_b) = 2Δ − 4ΣJ_b。
Δ ≥ κA 的来源（03:515-523）：每个被表示 fan-apex 实例处选中三角形至多 5 个 ⇒ Q ≤ 5Σ_b r_b ≤ 5W
（r_b ≤ w_b），故 αW ≥ αQ/5 ≥ κQ（κ ≤ α/5）；T、E 项分别用 κ ≤ β−7α 与 κ ≤ δ ✓。
最后链（03:530-536 结构）：2κA ≤ 2Δ ≤ B_raw + 4ΣJ_b ≤ B_raw + 2B_rad ≤ 2B，
倒数第二步用 2ΣJ_b ≤ B_rad（apex 引理第二句），末步 B = B_raw + B_rad ≥ ½(B_raw + 2B_rad) ✓
[计算] 逐不等式我都回代验过，得 A ≤ B/κ。
(c) [机械理由] α/5 的 5 与 "at most five selected triangles at a represented fan-apex instance"
锁死 [计算]：若该局部上界是 L，κ 的中间项应是 α/L；素材 5.2.1 声明论文未证 1/5 最优，
我的复核是：K_{2,3} 的实例 link 有 6 步，选中 6 步全员的圈可被锥盖约掉 ⇒ 至多 5，
[推测] 这就是 5 的组合出处（论文没写成一句话）。
(d) [推测] 失败路线：Δ 若用 αQ 入账会要求 Q 的直接余量而模板只给 Q ≤ 5W；作者让 αW
在 nominal-apex（左端 2W）与 Δ（αW）两处分账，[补] 分账错配则 W 被重复收费、链断。

### 4.6 引理 3.7（diagram:separator）与总装

(a) 逐字（03:556-562）：
```tex
For every $D<\infty$ and $\eta>0$ there is an integer $K=K(D,\eta)$ such that the vertices of any
finite planar multigraph of maximum degree at most $D$ can be partitioned into sets of size at
most $K$, with at most $\eta$ times the total number of vertices edges crossing between sets.
```
(b) [补] 证明（03:564-588）：去环后用简单图的 Lipton–Tarjan 分离子，|V| = q 时找到 ≤ c√q 个顶点
的分离集，余部各 ≤ 2q/3，可取 c = 2√2（逐字引 LiptonTarjan1979 Corollary 2）。
在一切 >K 的集合内递归；每个被摘分离子升为单例部分。对规模 q 的递归集合里每个现存顶点
摊 c/√q 的电荷；固定原顶点所在集合尺寸按 ×2/3 递减直到 ≤K，倒读电荷序列 ≤
(c/√K)Σ_j(√(2/3))ʲ = c/((1−√(2/3))√K)。摘除的分离子总数 ≤ CA/√K，C = c/(1−√(2/3))
[计算] c = 2.828427…，1−√(2/3) = 0.183503…，C = 15.41（与素材同值）。
最终部分间的每条跨越边以某个被摘顶点为端点，度界 D 使跨越边数（含重边）≤ DCA/√K；
取 K 使 DC/√K ≤ η ✓。不连通图逐分量处理。
(c) [机械理由] 总装（03:590-616）：参数先定 ⇒ κ、C₀ 正常数；选 η 使 2C₀η ≤ ½ [计算] 即 η ≤ κ/4；
D = 15 的出处逐字（03:601-604）："Fan triangles have three sides, decorations have at most six,
and simple top polygons have at most fifteen."（对偶图最大度 = 面的最大边数，
简单顶多边形边数由宏图 B 的 15 个顶点封顶 [计算]）。
[计算] K ≥ (DC/η)² = (15×15.41×4/κ)² = (924.6/κ)²，素材给的 (924/κ)² 与我的复算一致。
rank 事件对 ≤ 8K 出现成立（每 fragment ≤ K 面），此后纯确定性：
Σ fragment 边界 ≤ B₀ + 2ηA（内部跨越边被计两次），求和 A ≤ C₀(B₀+2ηA) ⇒
A(1 − 2C₀η) ≤ C₀B₀ ⇒ A ≤ 2C₀B₀ ≤ 2C₀ℓ（盘图 B₀ ≤ ℓ；球面问题 B₀ = 0 ⇒ A = 0 ⇒ 胞链为零）。
展开成字母填充（03:632-660）：每个 fan 模板定点 + 各顶点到定点长 ≤ 2 的路，
apex 映回 bouquet 顶点、径向边换成路标签词；fan 三角形边界成 fan 内长 ≤ 5 的闭路 [计算]
1+2+2；顶多边形边界成 Γ 拷贝内闭路、展开长 ≤ 30 [计算] 15 边 × 2；
长 ≤ 30 的闭路按重复顶点拆成 ≤ 30 个简单圈、每面换 ≤ 30 个关系盘 ⇒ 面积 ≤ 30·2C₀ℓ = 60C₀ℓ
[计算] ⇒ C = 60C₀ = 60/κ。
asphericity 收尾逐字（03:620-630 结构）：H₂(P̃;Z) = 0，单连通二维 CW，若有首个非零同伦群
Hurewicz 定它为非零同调（引 Hatcher Theorem 4.32），故弱可缩、Whitehead 定理（Theorem 4.5）
给可缩。[补] "P 无三维胞腔"是隐含前提 ✓。
(d) [推测] 失败路线一：用 GH 极限替代组合分割需要空间侧一致紧性，本文全程在图侧工作正是
绕开它；路线二：分离子递归若不单例化，摘除点会再进递归、电荷重复计，03:571-572 逐字
"make every removed separator vertex a singleton part" 是显式修补。
量词边界（rem:diagram:quantifiers，03:664-671 全逐字）：
```tex
The separator threshold is chosen after the positive parameters are fixed and before $n$ tends to
infinity. No uniform bound as $\alpha,\beta,\delta\longrightarrow0$ is asserted or required.
For each fixed parameter choice, the single finite-collection event in Lemma~\ref{diagram:rank}
controls all disk words and all cellular two-cycles simultaneously.
```
（本段覆盖素材 2.11-2.15。）

## 5 采样层复原（论文 §4，04-sampling.tex，533 行）

### 5.1 本节目的（04:3-8 逐字）

```tex
The relations will be tested against an action chosen after all the tables have been sampled.
We therefore prove statements about total variation of finite distributions on table matches.
These statements do not refer to a target metric space. In particular, they will apply
simultaneously to all uniformly bounded functions on the relevant assignments, including functions
obtained from a subsequently chosen action.
```
[机械理由] "do not refer to a target metric space" 是路线三失败（§1）的直接补丁：
所有统计陈述只在有限表上成立，度量侧后接。

### 5.2 条件测试、成本表与主模式均值

(a) sample:def-test（04:32-35 逐字）：
```tex
A conditional test is a triple $(I,e,t)$ with $I\subseteq\mathcal F$, $e\in\mathcal F\setminus I$,
$I\cup\{e\}$ admissible, and $t$ a positive integer.
```
成本表（04:41-47 原样重排）：

| 表项 ρ | c_ρ(θ) | 临界值 c_ρ |
|---|---|---|
| fan i | k_i−2+α | k_i−2 |
| top mark | 12+β−7α | 12 |
| four-letter entry | 2+δ | 2 |

[计算] 与 §3.2 概率对账：N^{f−k_i} = N^{−(k_i−2+α)}（f = 2−α）✓；
N^{p−gf−1} = N^{−(12+β−7α)} ✓（02:68 同式）；N^{−2−δ} ✓。六字母表不在成本表内（不属于 M）。
(b) h 函数与主模式均值（04:50-63 逐字）：
```tex
h_\theta(W)=|W|-\sum_{\rho:E_\rho\subseteq W}c_\rho(\theta),\qquad h(W)=h_0(W).
h(\mathcal F)=212-(17+12+180)=3,\qquad
\E|\Omega_n|=N^{h_\theta(\mathcal F)}=N^{3-\beta-90\delta}.
```
[计算] 17 = Σ(k_i−2)（31−14），12 = top mark 临界成本，180 = 90×2 四字母成本 ✓；
θ 版：17+7α + 12+β−7α + 90(2+δ) = 29+β+180+90δ = 209+β+90δ，212−该值 = 3−β−90δ ✓。
[补] 素材 5.3.2 指出、我也独立算到：α 在指数里完全相消（17+7α 与 12+β−7α 相加即 29+β），
α 只活在局部余量 κ 里，主匹配存在性只看 β+90δ < 3（prop:sampling 证明里逐字
"β+90δ<3"）✓。"The expectation is exact: each assignment uses one entry from each of the
distinct arrays, so all of its inclusion requirements are independent."（04:63-66 逐字）
h 的次模性（04:54-58）：每个固定 E_ρ 的示性函数 W ↦ 1_{E_ρ⊆W} 是超模的，c_ρ ≥ 0，
故 −Σ 项次模、|W| 模、h 次模 ✓ [补]。

### 5.3 预算引理（sample:lem-budget）

(a) 逐字（04:68-76）：
```tex
For every $W\subseteq\mathcal F$, $h(W)\geq\min\{2,|W|\}$.
If $S$ is admissible and $S\subseteq W$, then $h(W)\geq |S|$.
```
(b) [补] 证明机制（04:77-103，全账重走）：先只看核心部分，a_i = W 在 F_i 中的字段数、
ℓ = 松字段指标。顶 mark 未入账前指数为 Σ_i(a_i − (k_i−2)·1_{a_i=k_i}) + ℓ ≥ Σ_i min{a_i,2} + ℓ
[计算]（每个 fan：满员扣 k_i−2 净得 ≥2，不满员不扣得 a_i）。
顶 mark 只对完整核心收，此时核心指数 32−17−12 = 3 ✓（与 h(M) 的核心部分一致 [计算]）。
加四字母新字段：加一个新鲜的 +1；加满一对 +2 并可扣 2（当该表两核心字段也在 W 内）；
每对新鲜字段净贡献非负 ✓。|W| < 2 核心字段时什么成本都扣不了，h(W) = |W| ✓。
admissible 的四字母情形规模 ≤ 2，由第一式接管 ✓。
(c) [机械理由] 两式各自的去向：h(W) ≥ min{2,|W|} 供 A=∅ 分支（5.5 末段 h(V_j) ≥ 2）；
h(W) ≥ |S| 供 e ∉ U 与整数间隙（5.4）。
(d) [推测] 失败路线：若 admissible 放宽到三个同 fan 字段，Σmin{a_i,2} 与 |S| = 3 冲突，
第二式当场破。[补] 素材 2.17 同判断：admissible 的"每 fan 至多两字段"就是为预算引理而设。

### 5.4 闭包 U（本文最像思维链的一段）

(a) 逐字（04:104-135，含例与定义）：
```tex
The purpose of this enlargement is to make every further extension increase the critical exponent.
For example, if $I$ consists of two fields in one fan $F_i$, then completing that fan leaves the
exponent unchanged: $h(I)=2=h(E(F_i))$.
Once the fan fields have been included, adjoining both fresh fields of any square whose two core
fields lie in that fan also leaves the exponent unchanged.
In general, $|I|\leq2$, and every entry support has at least three fields, so $h(I)=|I|$.
Choose an inclusion-maximal set $U\supseteq I$ such that $h(U)=|I|$.
e\notin U,\qquad h(U\cup V)-h(U)\geq1\quad\text{for every nonempty }V\subseteq\mathcal F\setminus U.
```
(b) [补] 两条性质的来源（04:128-135）：e ∉ U 由预算第二式施于 I∪{e}：
若 e ∈ U 则 h(U) ≥ |I|+1 与 h(U) = |I| 矛盾 ✓；整数间隙：U 的任一真超集指数 ≥ |I|（预算第二式
施于 I），而 U 是极大的等号集，故真超集 ≥ |I|+1 [计算]（指数为整数的理由：临界成本全是整数，
04:136-137 逐字 "all critical exponents are integers"）✓。
(c) [机械理由] "every entry support has at least three fields"：fan 最小支持 k_i ≥ 3、
top mark 支持 32、四字母支持 4，所以 |I| ≤ 2 时 h(I) = |I| 自动 ✓。
闭包同时吃掉两类"免费扩张"（补 fan、带两核心字段的四字母新鲜对），
[补] 这正是 04:105-112 例子列举的全部两类，素材 2.17 与我一致。
(d) [推测] 失败路线：不做闭包、直接以 I 为公共集耦合，重叠型可出现零间隙（免费扩张），
方差和里就有不趋 0 的项，引理 4.3 的一致 o(1) 崩。证据：闭包的定义方式（极大等号集）
只为消灭零间隙而存在，没有别的用途。

### 5.5 星、重叠规则与条件计数

[补] 星的构造（04:141-165）：t 个有序 M 拷贝、把 U 内各字段认同（U 内支撑的表项也认同），
其它表项每支保留一份；要求赋值"逐字段单射"：s ∉ U 的 t 个分支值两两不同，
跨字段可同值（"Values in different fields may coincide" 逐字）。两个后果（逐字）：
非 U 支撑的表项拷贝是不同元组（至少一坐标在 U 外）；固定一支后另一支的非 U 支撑表项
不等于固定支的对应项。于是所计随机变量都是"去掉已条件化试验后的不同 Bernoulli 试验之积"✓。
[补] 重叠型（04:166-182）：两星之间精确指定哪些数组项重合；单射性使每个字段的等式给出
两支变量间的部分匹配，不同数组可用不同匹配，但并集仍须是部分匹配，
否则同一字段的两个不同支值被强迫相等 ✓；等式从不比较不同坐标字段，即使数值相同
（"even if their numerical letter values happen to be equal" 逐字，[补] 素材 2.20(c) 强调的
"跨字段可同值"与此互证）。
(a) 计数规则（04:184-199 两式逐字）：
```tex
fraction of pairs having the specified overlap ~ ≤~ C_tN^{-q}
C_t N^{-q+C}
```
[补] 第一式：揭示第一赋值；若重叠型钉住第二赋值中 q 个未定变量，每字段 ≤ t 个变量、
不放回均匀选（可能避一个已钉值），受控选择数 N^{r−q_s} 除以无约束 (N−a)_r（a ∈ {0,1}）
⇒ 概率 ≤ C_t N^{−q_s}，逐字段相乘 ✓。第二式：重合的非条件表项总实际成本 C 时，
联合入选概率 / 各自概率之积 = N^{+C}（回收成本），其余试验独立 ⇒ 相对方差贡献 ≤ C_t N^{−q+C}。
无重合非条件表项的对协方差为零，即使数值重合但不凑成公共表项 ✓。
(b) 三个应用（04:207-256）：单拷贝 M ⇒ Var|Ω_n|/(E|Ω_n|)² = o(1)（sample:eq-single-concentration，
共享集 W 的 q = |W|、回收成本 ≤ W 内表项成本、临界超出 ≥ h(W) > 0）；
E Z_N = N^{|U|}(N)_t^d N^{−C_U(θ)−tC_out(θ)}（sample:eq-star-mean 逐字）；
lem:conditional-counts 的 a_N = ((N−1)_{t−1})^d N^{−(t−1)C_out(θ)}（分支固定为 match 后的
延拓条件均值，与 σ 无关）与 b_N = N^{|U|}(N)_t^{d−1} N^{−C_U−tC_out}（叶钉值计数），
两者相对方差一致 o(1)。
(c) [补] 叶超出账（04:305-360，我最细核的一段）：重叠记 W、A = W∩U、V_j = 支 j 的 U 外字段、
m(W) = e-变量数；可实现的叶重叠里 e-变量只能对同名钉值，不产生指派罚金 ⇒ q = |W| − m(W)。
h_⋆(W) 用星上的临界成本（U 内表项计一次、其它逐支计）。A ≠ ∅ 时分离记账
（star-submodular，04:326-330 逐字不等式）：h_⋆(W) ≥ h(A) + Σ_j[h(U∪V_j) − h(U)]，
首项 ≥ 1（预算引理），和项各 ≥ 1（closure-gap）；每支至多一个被钉 e-变量 ⇒
超出 h_⋆(W) − m(W) ≥ 1 ✓。A = ∅ 时不同支的表项变量不相交，h_⋆(W) = Σ_j h(V_j)；
活跃支含至少一个公共表项全支持，支持 ≥ 3 字段 ⇒ |V_j| ≥ 3 ⇒ h(V_j) ≥ 2，
扣每支至多 1 个钉叶仍正 ✓。参数摄动保号（有限个型）✓。
[机械理由] "This argument is applied to supports of shared entries, not to arbitrary nonempty
field subsets"（04:355-356 逐字）：V_j 不是任意集，是公共表项支持的一部分，界才够。
(d) [推测] 失败路线一：若允许跨字段同值参与匹配（把数值相等当表项相等），
部分匹配的并集论证失效、q 的账变小、罚金不够。作者的字段级/数值级二分（04:180-182）
就是防这个。失败路线二：t = 1 时延拓计数恒 1（04:296-297 逐字 "If $t=1$, the extension count
is identically one and there is no variance to estimate"），[补] 作者特意写出退化分支，
说明单字段边际（prop:sampling 证明里 (∅,e,1) 测试）走的是同一条耦合、不需方差。

### 5.6 耦合引理（sample:lem-coupling）三条性质

(a) 逐字（04:368-378）：存在 t 个 match 的概率律使
```tex
(i) their restrictions to $I$ agree identically;
(ii) every branch marginal has total-variation distance $o(1)$ from $\mu_N$;
(iii) the law of $(\sigma_1(e),\ldots,\sigma_t(e))$ has total-variation distance $o(1)$
from the uniform product law on $S_n^t$.
```
(b) [补] 归一化机制（04:379-434 全链）：取"现存单射星"上的均匀律。
D_N = Σ_{σ∈Ω}|A_σ − a_N|，条件方差界 + Cauchy–Schwarz ⇒ 逐 σ 的 E[|A_σ−a_N| | σ∈Ω] = o(a_N)，
乘入选概率求和 ⇒ E D_N = o(λ_N a_N)，Markov ⇒ D_N = o(λ_N a_N)；
L_N/λ_N → 1 in probability ⇒ Z_N/(L_N a_N) → 1，特别 Z_N > 0 whp；
Σ_σ |A_σ/Z_N − 1/L_N| ≤ D_N/Z_N + |L_N a_N/Z_N − 1| → 0 ⇒ 分支边际 TV → 0 ✓。
I 上恒等：支间在 U ⊇ I 上精确相同（非 TV，是恒等）✓。叶：B_b 版同法给
叶分布对 (N)_t 个两两不同清单上均匀律的 TV → 0；最后一步换到 S_n^t 乘积均匀律：
独立均匀清单出现重复的概率 ≤ C(t,2)/N → 0 [计算]（t 固定）✓ 三步接好。
(c) [机械理由] 三个性质分别被消费的位置（素材 2.22(c) 与 2.28(c)，我独立核对）：
(i) 在 lem:conditional-test 里"the vector h_I has the same value in every branch"；
(ii) 在边长趋 1、能量归一搬运（05 节）；(iii) 在叶函数（对 e-标签的依赖）的控制。
[补] 04:438-443 逐字承认分工："The two marginal conclusions of the coupling serve different
purposes."（B9 边界声明）。
(d) [推测] 失败路线：若星不要求单射，A_σ 的条件均值 a_N 依赖 σ 的重复模式，
"uniformly in σ" 失效，归一化对每个 σ 不一致。证据：注入性在引理陈述里被写进定义
且 04:241 逐字 "Its conditional mean is independent of $\sigma$"。

### 5.7 余量、t_max 与参数选择（04:444-466）

[补] 逐字链："All critical overlap margins above are at least one. Each shared trial is charged
once to its occurrence in the first star, which has at most t copies of each array entry.
Since β>7α, all cost increments are positive. Replacing critical costs by actual costs therefore
increases any recovered-cost sum by at most t[7α+(β−7α)+90δ] = t(β+90δ)."
[计算] 括号里的账：θ=0 成本换 θ 成本的增量，fan 项共 7α（七槽），top 项 β−7α，
四字母 90δ，相加 = β+90δ ✓ 与 closure 的 98 = 8+90 分解一致（β=8α ⇒ β+90δ = 8α+90δ）。
"Conditioning removes trials and can only decrease this bound; a single master match is covered
by t=1." 逐字。对有限测试族取 t_max：条件 t_max(β+90δ) < 1/2 保住每个余量 ≥ 1/2 ✓；
"take β=8α and then take α,δ sufficiently small"（逐字）✓。
边界声明（B8）逐字（04:464-466）："The parameters are held fixed while N tends to infinity.
In particular, none of the variance arguments asserts uniformity for unbounded t at a single
fixed choice of parameters."
(d) [推测] 失败路线：想对 t → ∞ 一致成立再单次取极限。作者明说方差论证不支持；
§5 的条件测试因此永远"先 limsup_ν 后 t→∞"（见 6.4），次序是这里注册的约束。

### 5.8 六字母表与 Chernoff（04:468-490）

(a) [补] Q_{rq}(u,v) = #{(s₁,…,s₆) ∈ D_N : s_r = u, s_q = v}，固定 1 ≤ r < q ≤ 6。
逐字："Each such count is a sum of N^4 independent Bernoulli variables of parameter
N^{−3−δ}, and so has mean N^{1−δ}."（自由位置 4 个 ⇒ N⁴ 项；均值 N⁴·N^{−3−δ} = N^{1−δ} ✓
[计算]）。ε_N = N^{−(1−δ)/4}，界
2exp(−ε_N²N^{1−δ}/3) = 2exp(−N^{(1−δ)/2}/3) [计算]，对 15N² 个 (r,q,u,v) 并界
[计算]（C(6,2)=15 个位置对 × N² 个字母对）：指数衰减压过任何多项式（只要 1−δ>0）⇒ 逐字结论
```tex
\max_{r<q}\max_{u,v\in S_n}\left|\frac{Q_{rq}(u,v)}{N^{1-\delta}}-1\right|=o(1)
```
"with probability tending to one. No independence between these different counts is needed."
（sample:eq-six-pair，逐字。）
(c) [机械理由] δ < 1 的双重生死：均值 N^{1−δ} 要趋无穷、ε_N 要趋 0，都需 1−δ > 0；
Lean 里显式假设 hδ : δ < 1（SixCounts.lean:105，素材 4.5 与我在 §10 复核）。
[推测] 六字母数目 6 的最低性我按素材 5.2.4 复算：k 字母表给 k−2 自由位置、成本 N^{−3−δ}
（6 字母的入选概率），一般化需 (k−2)−(k/2−1−δ)… 论文未做此一般化，[补] 素材的算法
（N⁴ 对数 × N^{−3−δ} = N^{1−δ} → ∞；五字母只 N³·N^{−3−δ} → 0 不够）与我一致，
论文原话没有"因为 6 所以 6"（素材 3.5 第 14 条）。

### 5.9 命题 4.5（prop:sampling）与量词收尾

(a) 逐字（04:493-510，压缩排版）：
```tex
For any finite family $\mathcal T$ of conditional tests, there is a neighborhood of the critical
parameters such that every sufficiently small fixed positive $(\alpha,\beta,\delta)$ in that
neighborhood with $\beta>7\alpha$ has the following properties as $N\to\infty$. With probability
tending to one, the master pattern has a nonempty set of matches, its count is
$|\Omega_n|=(1+o(1))N^{3-\beta-90\delta}$, every single-field marginal of its uniform law $\mu_N$
is $o(1)$ in total variation from the uniform law on $S_n$, and every test in $\mathcal T$ has
the coupling of Lemma~\ref{sample:lem-coupling}. The six-letter counts also satisfy
Equation~\eqref{sample:eq-six-pair}. All these properties concern only the tables and are
independent of any choice of action or metric space.
```
(b) [补] 证明装配（04:512-522）：把 (∅,e,1)（每字段一个）加入 T；对这种测试预算引理强迫
U = ∅，其单支星恰是 master match ⇒ 叶结论给单字段均匀 ✓；参数满足全部有限重叠余量、
β+90δ < 3、δ < 1 ⇒ 三组事件求交 ✓。
[计算] β+90δ<3 与 E|Ω| = N^{3−β−90δ} 非空性一致 ✓。
(c) 注记 sample:rem-diagonal（04:524-533）逐字：
```tex
Proposition~\ref{prop:sampling} is compatible with Theorem~\ref{thm:diagram}: for each finite
family of tests, choose positive parameters sufficiently small for that family and the theorem,
then the diagram fragment threshold, and finally $N$. The diagram and sampling events then hold
simultaneously with probability tending to one. Lemma~\ref{lem:completion-diagonal} constructs
the deterministic diagonal sequence used below, with parameters tending to zero and every fixed
test valid in the limit.
```
量词次序在此锁死：参数 → fragment 阈值 → N。与 07-completion.tex:2 "keeping the order of all
choices explicit" 及 01:113-124（"a finite list of statistical tests is fixed before choosing
the sampling parameters"）三处互锁（素材 3.1 第 3 条）。
(d) [推测] 失败路线：若先选 N 再定参数，whp 语句随参数变、diagram 事件的 M（rank 引理的规模界）
也随参数变，无法与抽样事件求交。rem 的存在就是防这个读法。
（本段覆盖素材 2.16-2.23。）

## 6 能量层复原（论文 §5，05-energy.tex，591 行）

### 6.1 顺序声明与切锥工具箱（05:3-33）

(a) 逐字（05:3-8，全文最关键的程序句之一）：
```tex
The sampling statements in Proposition~\ref{prop:sampling} concern finite tables alone. In this
section they will be applied to functions obtained from an isometric action chosen after those
tables are known. The order is important: we first obtain a bound on every generator displacement
using the pointwise relative counts in the six-letter table. Only then do we use total variation
estimates for action-dependent functions.
```
记号（05:10-32 逐字要点）：完备切锥 T_xX、顶点 0、log_x y 长度 d(x,y) 方向为测地方向；
欧氏度量锥内 ⟨u,v⟩ = (‖u‖²+‖v‖²−d(u,v)²)/2 = ‖u‖‖v‖cos∠(u,v)（角截断于 π）；
"Multiplication of a vector by a nonnegative real number always means radial dilation.
No additive vector-space structure on a cone is assumed."；
工具清单逐字："We will use strong convexity of squared distance, first variation, the
flat-triangle equality theorem, and the tangent-cone theorem for CAT(0) spaces; see
[Chapters II.1-II.3, in particular II.2.9-II.2.10, II.3.6, and II.3.19 of BH1999].
These results do not require properness."，比较角不等式
```tex
d(y,z)^2 \ge d(x,y)^2+d(x,z)^2-2\ip{\log_x y}{\log_x z}.   (energy:log-comparison)
```
(b) [补] log-comparison 的来路（原文只一句带过）：欧氏比较三角形余弦定理给等式；
CAT(0) 中 ∠_x(y,z) ≤ ∠^#_x(y,z)（BH II.3.1 型单调），cos 在 [0,π] 递减 ⇒ cos∠ ≥ cos∠^# ⇒
右端变小 ⇒ ≥ 成立 ✓。截断于 π 保证余弦单调可用。
(c) [机械理由] "do not require properness" 为 §5 全程（X_ν 只在最初几何作用里 proper，
极限空间 Z 不 proper，B6/B10）与 §7 铺垫。不假设锥是向量空间，配合 §6 的 ⊕ 定义（7.1 节），
全文所有"加法"只发生在角度 < π 的欧氏扇形内。
(d) [推测] 失败路线：先 TV 后位移界，被积函数一致界无处取（M 来自位移界），
$2M²η 不趋 0。证据是 "The order is important" 的直接命令句。

### 6.2 引理 5.1（energy:minimizer）：最小点、零重心、方差不等式

(a) 逐字（05:44-62）：
```tex
Let an infinite finitely generated group $G$ act properly and cocompactly by isometries on a
proper complete $\CAT(0)$ space $X$. For a finite symmetric generating alphabet $S$, counted with
its given multiplicities, the function $E(x)=\frac1{|S|}\sum_{s\in S}d(x,sx)^2$ has a minimizer
and its minimum is positive. At any minimizing basepoint, the vectors $v_s=\log_x(sx)$ satisfy
 \frac1{|S|}\sum_{s\in S}\ip{h}{v_s}\le0 \quad(h\in T_xX).   (energy:zero-barycenter)
Equivalently, $0$ is their barycenter, and
 \frac1{|S|}\sum_{s\in S}d(h,v_s)^2 \ge \norm{h}^2+\frac1{|S|}\sum_{s\in S}\norm{v_s}^2.
   (energy:variance)
```
(b) [补] 存在性（05:66-83）：取最小化列 x_j、紧基本域 C（GC = X），g_j 使 y_j = g_jx_j ∈ C。
能量有界界住每个位移 d(x_j,sx_j)（S 有限）⇒ 界住共轭位移 d(y_j,(g_jsg_j⁻¹)y_j)
（等距把共轭还原：d(g_jx_j, g_j s x_j) = d(x_j, sx_j) ✓）。properness：C 的固定半径闭邻域紧，
把 C 映入该邻域的元素只有有限个 ⇒ 每个 s 的共轭 g_jsg_j⁻¹ 只有有限可能 ⇒ 对角子列使
共轭生成元组整体常值、y_j → y ∈ C ✓；固定一个 g_{j₀} 搬回原字母表即得原 tuple 的最小点。
正值性：E ≡ 0 ⇒ G 有不动点；proper 作用的稳定子有限、有限群在 CAT(0) 上有不动点 ⇒ G 有限，
反设矛盾 ✓。一阶变分（05:85-106）：测地线 x_t 初速 h，右导数公式
d/dt|_{0+} d(x_t,y)² = −2⟨h, log_x y⟩；自变量取 2t 再乘 2 ⇒ 系数 −4：
```tex
0\le\left.\frac{d}{dt}\right|_{0+}\frac1{|S|}\sum_s d(x_{2t},sx)^2
 =-\frac4{|S|}\sum_s\ip{h}{v_s}.
```
对称字母表重标（s ↦ s⁻¹ 施加等距）使 Σd(x,sx_{2t})² 与 Σd(x_{2t},sx)² 平均相同 ✓。
variance 不等式由余弦展开 + zero-barycenter 逐项搬出；取 h = 0 知 0 也最小化平均平方距离 ✓。
归一化（05:109-123）：x 的最小能量正 ⇒ 度量整体缩放 (1/√E_min) 使
```tex
\frac1N\sum_{s\in S_n}\norm{v_s}^2=1   (energy:normalization)
```
对全字母表 S_n（N = 2n 个带符号字母）成立，"Rescaling preserves completeness, properness,
and the CAT(0) condition" 逐字 ✓。无限性由 χ(P̃) = |G|χ(P) 论证（同 7.2 节，首次出现在此）。
(c) [机械理由] "counted with its given multiplicities"：E 是平均，分母 |S| 与字母重复方式必须
同语；字母表对称（含逆）是重标步的前提，也是 6.3 里 d(x,a⁻¹x) = d(x,ax) 的地基。
归一取整个 S_n ，并非任意生成集：对称性自动、且与 §4 的均匀边际同一集合 ✓。
(d) [推测] 失败路线一：G 有限则引理失效（正值性崩），作者专门用 χ 论证把"每个 G_j 无限"
钉死（07:28-31 与 2.25(b)8 同一招）。失败路线二：S 无限则"每个 s 有限可能"的对角线断链，
05:68 逐字 "since $S$ is finite" 是自我确认。
Lean 对应：EnergyOrbit 结构把"最小点/能量 1/界 M"作为数据字段（ConditionalStar.lean:88-96），
exists_of_geometric 给 M = 8 显式常数（:222，我实测该行存在，§10）。

### 6.3 引理 5.2（energy:displacement-bound）：25 的两条来历

(a) 逐字（05:125-135）：
```tex
Suppose the six-letter table has pointwise relative error at most $\varepsilon<1$ in the counts
for positions $1$ and $k$, for every $2\le k\le6$. Then every action normalized as in
Equation~\eqref{energy:normalization} satisfies
 \max_{s\in S_n}\norm{v_s}^2 \le25\frac{1+\varepsilon}{1-\varepsilon}.
The bound is independent of the action.
```
(b) [补] 全链（05:137-164）：条件分布点态界
Pr(k 位 = b | 1 位 = a) = Q_{1k}(a,b)/Σ_{b'}Q_{1k}(a,b') ≤ (1+ε)N^{1−δ}/((1−ε)N·N^{1−δ})
= ((1+ε)/(1−ε))·(1/N) ✓（分母用下界对 N 个 b 求和；非空性同此）。
关系 a⁻¹ = s₂⋯s₆：d(x,a⁻¹x) = d(x,ax)（左乘等距）⇒ ‖v_a‖ = ‖v_{a⁻¹}‖；
三角不等式 ‖v_a‖ ≤ Σ_{k=2}⁶‖v_{s_k}‖，Cauchy–Schwarz（5 项）⇒ ‖v_a‖² ≤ 5Σ‖v_{s_k}‖² ✓。
对"首字母 a 的行"取平均（权重 = 条件分布，非负），每个条件平均 ≤ (1+ε)/(1−ε)·(1/N)Σ_b‖v_b‖²
= (1+ε)/(1−ε)（归一）⇒ 5×5 = 25：**第一个 5 是 Cauchy–Schwarz，第二个 5 是 k=2..6 五个条件平均** ✓。
(c) [机械理由] 为什么用六字母表的点态相对计数，并非 TV 逼近：点态界对每个 (a,b) 成立，
条件分布界不依赖任何独立性；权重 ‖v_b‖² 是"表揭示后才选定的作用"给的，逐字辩护：
"This uses only nonnegative weights, and therefore holds even when the weights were chosen from
an action after the table was revealed."（05:161-164。）这就是 6.1 顺序声明的执行位置。
(d) [推测] 失败路线：只有"平均每行"误差界时个别 b 的 Q(a,b) 可爆，界失去一致性，
M 无处可取。证据：假设逐字写成 "for every 2 ≤ k ≤ 6" 且用 sample:eq-six-pair 的双 max。
ε ≤ 1/2 时右端 ≤ 75，取 M = √75 即可（论文不写显式 M；[计算] 我的数），
Lean 直接钉 M = 8（8² = 64 ≥ 25·(1+ε)/(1−ε) 在其固定 ε 下成立，见 §10 D14）。

### 6.4 径向恒等式、Sturm 归纳均值与一致条件测试

(a) 径向恒等式逐字（05:168-181）：
```tex
\norm{[u,v]_t}^2 =(1-t)\norm u^2+t\norm v^2-t(1-t)d(u,v)^2.   (energy:radial-identity)
```
三角证明逐字要点：端点之一是顶点则直接；角距 < π 时线段落在两射线之间的欧氏扇形内；
角距 ≥ π 时线段过顶点，‖[u,v]_t‖ = |(1−t)‖u‖−t‖v‖ 给出同一恒等式 ✓ [计算] 两种情形我各自
展开验证平方后相同。引理 5.3（energy:cone-mean，05:190-226）逐字：
```tex
In a complete $\CAT(0)$ metric cone, $u\mapsto\ip{h}{u}$ is concave along every geodesic, for
fixed $h$. Suppose a finite probability distribution of vectors $V$ has barycenter $0$ and
$\E\norm V^2=1$. If $V_1,\ldots,V_t$ are independent samples and
$m_1=V_1,\qquad m_j=[m_{j-1},V_j]_{1/j},$
then $\E\norm{m_t}^2\le\frac1t$ (energy:inductive-mean). For any deterministic list
$V_1,\ldots,V_t$ one also has $\frac1t\sum_{j=1}^t\ip{h}{V_j}\le\ip{h}{m_t}$ (energy:mean-concavity).
```
(b) [补] 凹性推导：强凸性 d(h,[u,v]_t)² ≤ (1−t)d(h,u)²+td(h,v)²−t(1−t)d(u,v)² 与径向恒等式
在恒等式 2⟨h,w⟩ = ‖h‖²+‖w‖²−d(h,w)² 中相减，二次项全部消掉 ⇒ ⟨h,·⟩ 沿测地线凹 ✓（逐字
"The quadratic terms cancel, proving concavity."）。归纳均值：记 a_j = E‖m_j‖²，
m_j = [m_{j−1},V_j]_{1/j} 用凹性于顶点 0 与 h = m_{j−1} 型比较（[补] 素材 2.27 的递推）
a_j ≤ (1−1/j)²a_{j−1} + (1/j)²·1 − (1/j)(1−1/j)·(交叉项下界) [补]，配合重心为零的
E⟨m_{j−1},V_j⟩ ≤ 0 得 a_j ≤ (1−1/j)²a_{j−1} + 1/j²，展开归纳 a_t ≤ 1/t ✓
[计算] 递推代入：设 a_{j−1} ≤ 1/(j−1)，则 a_j ≤ (1−1/j)²/(j−1) + 1/j² = (j−1)/j² + 1/j²·1
= (j−1)/j² + 1/j² = j/j² = 1/j ✓ 恰好闭合。mean-concavity 由逐段凹性望远镜。
引文归属（05:216-226）：Sturm inductive means [Definition 4.6 and Theorem 4.7, proof (a)]，
及 Gigli–Nobili 2021。
(c) [机械理由] 1/j 权重是归纳均值的定义性选择（新样本权重 1/j，[补] 保证 m_t 对样本置换
的对称性与 1/t 界同时成立）；Sturm 原文在 Wasserstein 空间，此处只取其 CAT(0) 特例。
(d) [推测] 失败路线：若样本间不独立（耦合只给 TV），界 E‖m_t‖² ≤ 1/t 不再直接成立；
作者的办法是对独立均匀叶先证、再用 TV 把期望差搬到耦合律上（引理 5.4 证明），
次序是"先独立后搬运"。证据：05:244 附近对 (energy:inductive-mean) 适用性的逐字限定
"Under independent uniform leaves, Equation~\eqref{energy:inductive-mean} applies by
Equations~\eqref{energy:variance} and~\eqref{energy:normalization}."

引理 5.4（lem:conditional-test，05:246-295）四段：
(a) 逐字：
```tex
Let $I$ and $\{e\}$ be disjoint sets of fields with admissible union. For each $\nu$, let $h_I$
be a function of the labels on $I$ with values in $T_{x_\nu}X_\nu$, and suppose $\norm{h_I}\le B$
for a constant independent of $\nu$ and the match. For either fixed choice $\sigma(s)=s$ or
$\sigma(s)=s^{-1}$,
 \limsup_{\nu\to\infty}\mathbb E_{\mu_\nu}\ip{h_I}{v_{\sigma(e)}}\le0.
```
序列前提（05:228-243）：一列使 prop:sampling 结论对每个固定测试、每个固定 t 以误差趋 0 成立
的表实现；几何作用假设有、归一最小基点 x_ν；Lemma energy:displacement-bound 给绝对常数 M
使 ‖v_s‖ ≤ M 对所有字母、所有充分大实现成立（energy:uniform-bound，逐字含
"All statements about the limit are unchanged by discarding finitely many instances.
The actions, their spaces, and the functions in the next lemma may depend on the complete
table instances."）。
(b) [补] 证明机制（05:258-295）：h_I 各分支同值（耦合性质 (i)）；对分支向量 v_{σ(e_j)} 取
归纳均值 m_t；mean-concavity 给 (1/t)Σ⟨h_I,v_{σ(e_j)}⟩ ≤ ⟨h_I,m_t⟩ ≤ B‖m_t‖
（末步只用范数界，逐字 "it does not assume that h_I is independent of the leaves"）。
独立均匀叶下 E‖m_t‖² ≤ 1/t [计算] 配合 Jensen 给 E‖m_t‖ ≤ 1/√t；
换到耦合律：‖m_t‖ ≤ M（半径 M 闭球的凸性，球内点的凸组合仍 in 球），
TV 搬运给 E‖m_t‖² 变动 ≤ 2M²η_{ν,t}、每个标量测试变动 ≤ 2BMη_{ν,t}，合起来
E_{μ_ν}⟨h_I,v_{σ(e)}⟩ ≤ B√(1/t + 2M²η_{ν,t}) + 2BMη_{ν,t} ✓ 逐字显示式。
先 limsup_ν（固定 t，η→0）得 ≤ B/√t，再 t→∞ 得 ≤ 0 ✓。次序不可交换：η_{ν,t} 只对固定 t
趋 0（B8 的正是这条，[补] 素材 2.28(b) 与我的独立结论一致）。σ(s) = s⁻¹ 的合法性：
对称字母表、‖v_{s⁻¹}‖ = ‖v_s‖、h_I 只依赖 I 标号，逐分支换逆不改变耦合（05:266-267 逐字
"Applying the fixed inversion σ preserves this assertion"）。
(c) [机械理由] 假设 "independent of ν and the match" 双重排除：h_I 若依赖叶或依赖实现，
凹性搬不动、TV 搬运的界不 uniform。M 的存在性（非显式）来自 6.3 右端对 ε ≤ 1/2 一致有界。
(d) [推测] 失败路线：h_I 由整条 match 决定（例如取全图重心向量）则性质 (i) 失效；
陈述里那句界限定量就是这条路的墓碑。

### 6.5 乘积度量与超滤极限（05:297-328）

(a) 逐字要点：Γ̂ = Γ 加上每条规定二边路径在装饰方块里的互补二边路（新中点顶点彼此不同）。
match 给一致轨道实现：锚点 x_ν，路 s₁,…,s_k 送到 s₁⋯s_kx_ν；核心闭路是关系、
装饰方块关系保证补路一致；固定每点一条路 ⇒ 轨道点距锚 ≤ LM（L 只依赖 Γ̂）。
```tex
d_\nu((y_m),(z_m))^2 =\frac1{|\Omega_\nu|}\sum_{m\in\Omega_\nu}d(y_m,z_m)^2   (energy:product-metric)
```
有限乘积完备 CAT(0)；非主超滤下的 pointed metric ultralimit Z：完备性引 BH Lemma I.5.53，
CAT(0) 引 Corollary II.3.10(2)；逐字收尾："Neither properness nor a dimension bound for Z
is needed."（B10）中点与定比分点在乘积里逐坐标取、在 Z 里由测地线唯一性对应 ✓。
(b) [补] 为什么必须乘积+超滤：E_{μ_ν} 是对 matches 的平均，单个 X_ν 内"平均平方距离"
无几何意义；折成 ℓ² 乘积后平均平方距离恰是乘积距离平方，§5 所有估计在同一空间内对话 ✓。
Γ̂ 顶点数 = 18 +（二边路径数）[推测]（论文未写总数，素材 3.5 第 1 条同判）；
有界性 d(x_ν, s₁⋯s_kx_ν) ≤ Σ‖v_{s_i}‖ ≤ (路长)M ✓ [计算]。
(c) [机械理由] 超滤，并非 GH 极限：X_ν 无一致 doubling/properness 可用（B6：后续乘积与极限
不必 proper，properness 只用于原始几何作用）；主超滤会退化为单实现、o(1) 变固定 ε ✓。
(d) [推测] 失败路线：想让角随 ultralimit 运输是错的，作者 05:506-507 逐字拒绝
"without any assumption that angles commute with ultralimits"（B11）；
6.7 的分数点技巧是给这条路线上锁。

### 6.6 路径下界、四边形不等式与六边形刚性

(a) 引理 5.5（energy:path-bounds）逐字：
```tex
Every edge in $\widehat\Gamma$ has length one in $Z$. Every two-step path using two distinct
fields of one decoration square has squared endpoint distance at least two. More generally, a
path of $k\le3$ distinct core fields whose field set is admissible has squared endpoint distance
at least $k$.
```
引理 5.6（energy:quadrilateral）逐字：
```tex
d(z_1,z_3)^2+d(z_2,z_4)^2+4d(m,n)^2 \le\sum_{i=1}^4d(z_i,z_{i+1})^2, \qquad z_5=z_1.
```
（m = mid(z₁,z₃)，n = mid(z₂,z₄)；"equality between the two diagonal-square sum and the
side-square sum forces the diagonal midpoints to coincide" 逐字。）
(b) [补] 边长趋 1：乘积度量 d_ν² = (1/N)Σ_m‖v_{s(m)}‖²，单字段边际 TV = o(1) + 界 0 ≤ ‖v‖² ≤ M²
⇒ |E‖v_{s(m)}‖² − (1/N)Σ_s‖v_s‖²| ≤ 2M²·o(1)，后者恰为 1（归一）✓。
两步以上归纳：d(u₀,u_k)² ≥ d(u₀,u_{k−1})² + ‖v_{a_k}‖² − 2⟨h_I,v_{a_k}⟩（log-comparison，
顶点 u_{k−1}），h_I = log 前段积、只依赖前 k−1 个标号、‖h_I‖ ≤ (k−1)M ✓，
引理 5.4 给 limsup E⟨h_I,v⟩ ≤ 0；k = 1,2,3 逐步 ≥ 1,2,3 ✓。
"Every prefix of the field sets in the statement is admissible, so the conditional test is
available at each step" 逐字（前缀封闭性）。"Distinct fields here need not carry distinct
numerical letter values" 逐字（与 5.5(c) 的字段/数值二分呼应）。
四边形不等式 [补]：三次 CN（对 m 于 z₂、z₄；再对 d(m,n) 用 CN 于 z₂,z₄）代入化简即得；
我按素材 2.30(b) 逐步重算，移项无误 ✓。装饰方块：边 1、对角 ≥ 2（path-bounds）⇒
2+2+4d(m,n)² ≤ 1+1+1+1 ⇒ 对角恰 2、公共中点重合 ⇒ two-step-equality
```tex
d(u,w)^2=2 \quad\text{for every nonbacktracking two-edge core path }u,v,w.
```
逐字含"Every such path was assigned a decoration table, including paths whose two fields lie
in the same fan."（05:402-403。）
(c) [机械理由] k ≤ 3 是 admissible 规模上限的硬顶（[推测] 由 def:admissible (i) 的 ≤3 决定，
§6 只需六边形三边半路 ✓）；fan 内二边路也建表是 two-step-equality 覆盖全部二边路的唯一理由。
(d) [推测] 失败路线：admissible 前缀不封闭 ⇒ 归纳断链；只对"外部"二边路建表 ⇒ fan 内
二边路没有 TV 控制、d² ≥ 2 无从谈起。两处各有一句逐字防御（prefix 句、including 句）。

六边形链（05:405-492）[补] 全账：核心六边形顶点 z₀..z₅，循环分离 1 的对距离² = 1、
分离 2 的 = 2（two-step-equality）、三边半路（每 fan 至多两字段，admissible）分离 3 的 ≥ 3。
对 (z₀,z₁,z₃,z₄)：边平方和 1+2+1+2 = 6（z₄→z₀ 分离 2 ✓ 我核对循环指标），对角各 ≥ 3 ⇒
全部取 3、d(m,n) = 0；(z₁,z₂,z₄,z₅) 同理 ⇒ 三对对面共中点 c，r² = 3/4，r = √3/2（energy:radius）。
引理 5.7（energy:hexagon-flatness）：对 u = log_c z_i、v± = log_c z_{j(j+3)}，
log-comparison 给 ⟨u,v±⟩ ≥ r² − ½d²；两规定距离和恰 3 = 4r²（分离检查 (s,3−s) ∈
{(1,2),(2,1),(3,0)} 我逐条验过 ✓）⇒ 下界和 = 0，与 antipodal-products（⟨u,v⁺⟩+⟨u,v⁻⟩ ≤ 0，
由 ∠(v⁺,v⁻) = π 的三角论证）夹出等号 ⇒ 角 = 比较角 ⇒ flat-triangle 定理 ⇒
中心三角形全平坦且
```tex
\ip{\log_c z_i}{\log_c z_j}=r^2-\frac12d(z_i,z_j)^2.   (energy:hexagon-products)
```
引理 5.8（energy:common-center）"All core hexagons have the same center c"：
[补] 传递链三级：(i) 只用 X 时非共线三点 = F₂³ 的基，i ↦ i+j 初等变换保线 ij 与第三点、
新旧六边形共享对面 (X_k, ij) ⇒ 中心同（对面中点）；置换+初等行变换生成一切基变换 ✓；
(ii) Y 换 X：未变两点代表之一与其对面 = 公共对面 ⇒ 中心同；(iii) 覆盖性：每个 X_i、每条线、
每个 Y_i（含 Y_D：它有两条完整线可用，被删的只是 Y_D–CD 这条边）都在某核心六边形里 ✓。
[推测] 失败路线：换掉 Fano 平面（其它 7 点配置）则 GL₃(F₂) 传递性断、公共中心无法传递；
证据是证明通篇用 basis/elementary-additions over F₂ 的语言（素材 2.31(d) 同判）。
[机械理由] r = √3/2 是被夹出的（下界 3 与四边形的上界和 6），不是选取；
[计算] 后续全部余弦值（−1/4、1/2、1/4、2a+b = π）都从 r² = 3/4 派生，牵一发动全身。

### 6.7 三元中点测试与命题 5.9（prop:configuration）

(a) 逐字设置（05:494-507）：
```tex
$H_0=CD,\ p=X_C,\ q=Y_C,\ z=X_D,\ J=\operatorname{mid}(p,q).$
The following argument gives an angle statement in $Z$ without any assumption that angles
commute with ultralimits.
```
[补] 取过 C 的另一线 H ≠ H₀（Fano 每点 3 线 ✓）：核心四圈 (p,H₀,q,H) 边 1、对角² = 2 ⇒
引理 5.6 给 J = mid(H₀,H)、d(H₀,J)² = ½、d(H₀,z) = 1（ternary-radii，CD 到 X_D 是 Γ 的边）。
三字段 {p,q,z}：p,q 是 F_C 两字段（同 fan 2 个合法）、z 是松字段（不占 fan 配额）⇒
admissible ✓ 引理 5.4 可用：h_I = log_{H₀}(J 的实现) 只依赖那两个 F_C 字段、‖h_I‖ ≤ M ✓。
分数点 J_a（H₀→J 的 a 分点）、z_b（H₀→z 的 b 分点），log-comparison 取平均 + limsup ≤ 0：
```tex
d(J_a,z_b)^2\ge a^2d(H_0,J)^2+b^2d(H_0,z)^2=\frac{a^2}2+b^2.   (energy:fractional-angle)
```
⇒ 每个比较角 ≥ π/2；令 a,b ↓ 0 在 Z 内事后算角 ⇒
```tex
\angle_{H_0}(J,z)\ge\frac\pi2.   (energy:ternary-angle)
```
逐字："Only distances of fixed-fraction points passed through the ultralimit; the angle was
computed afterwards in the limiting space."（05:545-547。）
(b) 命题 5.9（05:554-580）逐字要点：存在完备 CAT(0) 空间 Z、由 Γ 核心顶点编号的构形、
点 c ∈ Z 使：(1) 每核心边长 1、每非回溯二边核心路平方 2、每三条不同 admissible 字段的
核心路平方 ≥ 3；(2) 每核心六边形三对对面中点 = c、所有核心顶点距 c 为 r = √3/2、
同一六边形任两顶点中心三角形平坦且内积由 hexagon-products 给；(3) d(H₀,J)² = ½、
d(H₀,X_D) = 1、∠_{H₀}(J,X_D) ≥ π/2，附 "More precisely, all the fractional-point
inequalities in Equation~\eqref{energy:fractional-angle} hold."
证明一句装配（05:583-591）：minimizers + uniform bound + product 构造 + path-bounds +
装饰方块论证给第一条；hexagon-flatness + common-center 给第二条；固定分数点论证给第三条。
(c) [机械理由] Z 只写 complete CAT(0)，不写 proper、不写有限维（与 6.5 末句一致）；
"More precisely" 附句是为 §6.3 例外恒等式的三角夹逼预留精确分数点集（素材 2.36(d) 与我
同判：没有它整条 §6 崩）。
(d) [推测] 失败路线：直接对 X_ν 的角度取一致下界再极限，需要角与 ultralimit 交换（一般假）；
作者同一段落里写了两遍"不交换角"（05:506-507 与 05:545-547），[补] 素材 3.3 把这两句
分别登记为 B11，我同意这是全节最容易被误读的点。
（本段覆盖素材 2.24-2.32。）

## 7 障碍层复原（论文 §6，06-obstruction.tex，477 行）

我把这一节读成一次方法论约束的执行：开篇 B12（06:8-9 逐字 "The tangent cone is not assumed to be a
vector space, so we specify the meaning of its sums and use concavity whenever an additive inequality
is required."）声明切锥上两向量运算要么落进角度小于 π 的欧氏扇形，要么由度规定义推出。我逐条检查
全节，每次加法不等式确实二者居其一（06:30-31 再次自陈此纪律）。

### 7.1 锥加法（geom:cone-addition，06:22-25）与标量积凹性（geom:sum-concavity，06:35-41）

(a) 逐字：`u\oplus v=2\operatorname{mid}(u,v)`，随后 "This operation is commutative, but no
associativity or cancellation law will be used."（B13）。凹性：`\ip{w}{u\oplus v}\geq \ip{w}{u}+\ip{w}{v}`，
原文说明 "apply concavity at the midpoint of u,v and use homogeneity under radial dilation. This is an
inequality in a general cone; we will not replace it by an equality without establishing rigidity."
(b) 完整推导：内积是极化式（06:16-18）⟨u,v⟩=(‖u‖²+‖v‖²−d(u,v)²)/2，纯距离。energy:cone-mean 给出
v↦⟨h,v⟩ 沿测地线凹；在 u,v 的中点 m 处取凹值得 ⟨w,m⟩≥(⟨w,u⟩+⟨w,v⟩)/2，再乘 2 并用径向伸缩齐性
⟨w,δ₂m⟩=2⟨w,m⟩ 即得。扇形内（夹角 θ<π）⊕ 退化为普通加法：中点 2 倍即平行四边形对角线。[计算]
(c) 机械理由：B13 禁结合律/消去律，因为任何 (u⊕v)⊕w=u⊕(v⊕w) 改写都在偷偷把 T 当向量空间；全节
每个 ⊕ 只出现两次。不等号方向也锁死：≥ 保凸，方向反了 7.3 的 0 下界不再成立。
(d) [推测] 失败路线一：把 ⟨w,·⟩ 当线性泛函处理，需要每个等式先前置刚性；能量层没准备。失败路线二：
在 Z 的切锥上引入向量空间结构，B6/B10 说极限空间不 proper，无任何附加结构可用。

### 7.2 方形刚性 geom:square（06:51-82）

(a) 逐字："Let $p_0,p_1,p_2,p_3$ be points of a $\CAT(0)$ space, with indices taken modulo four.
Suppose d(p_i,p_{i+1})=1, d(p_0,p_2)=d(p_1,p_3)=\sqrt{2}. Their convex hull is a unit Euclidean square,
in the indicated cyclic order. In particular, the two diagonals have the same midpoint."
(b) 证明四步（06:63-82）：o=mid(p₀,p₂)；CN 平方凸性给 d(o,p₁)²≤½、d(o,p₃)²≤½；夹逼
√2=d(p₁,p₃)≤d(p₁,o)+d(o,p₃)≤√2 全等 ⇒ o 同时是 p₁,p₃ 中点；d(o,p₁) 的等号是三角形内部比较等号 ⇒
(p₁,p₀,p₂) 平（平三角原则出处 06:43-49 逐字引 BH II.2.9、Ex II.2.10(1)、Ballmann I.3.13(ii)）；四顶点
轮跑同法 ⇒ 每个三角平 ⇒ 每角 π/2 ⇒ 四边形角定理（06:78-80 逐字引 BH II.2.11）角和 2π ⇒ 单位欧氏方块。
(c) 机械理由："边 1、对角 √2" 正是采样层两步步平方闭合（energy:two-step-equality）的像；√2·√2 夹逼
是唯一能同时逼出共中点与平坦性的不等式，对角若为 √2+ε 夹逼断链。
(d) [推测] 失败路线一：跳过夹逼直接用角和公式，需先知道各角，循环论证。失败路线二：只要共中点不要
平坦性，则 7.6 的横截方块读不出 d_Q(q₀,m)=½ 的精确值。

### 7.3 线内积与 fan 恒等式（06:102-187）

(a) geom:line-products 逐字：`\ip{h_H}{h_{H'}}=-\frac14 for distinct lines H,H'`。geom:fan-sums 逐字
（06:121-133）：`M_i=x_i\oplus y_i=h_H\oplus h_{H'} whenever H,H' are distinct full lines at i. Each
sum displayed here is computed in a nondegenerate Euclidean sector. Moreover, \ip{x_i}{y_i}=-\frac14,
\ip{M_i}{h_H}=\ip{M_i}{h_{H'}}=\frac12`。full 定义逐字（06:114-116）："A line through a doubled point
$i\in\{A,B,C,D\}$ is called full at $i$ if it is adjacent to both $X_i$ and $Y_i$. All lines through
$A,B,C$ are full; the full lines at $D$ are $AD,BD$." geom:nonnegative 逐字（06:182-186）：
`\ip{M_A}{M_B}\geq\norm{h_{AB}}^2+\ip{h_{AB}}{h_{BC}}+\ip{h_{AC}}{h_{AB}}+\ip{h_{AC}}{h_{BC}}=0`。
(b) 推导：两不同线 H,H′ 交于 i，取 j∈H、k∈H′ 使 (i,j,k) 不共线，X 代表元给核心六边形 ⇒ prop:configuration
的中心三角平，d(H,H′)=√2，半径 r=√3/2 ⇒ 极化 ⟨h_H,h_{H'}⟩=(¾+¾−2)/2=−¼。fan 恒等式（06:136-169）：
4-环 X_i,H,Y_i,H′ 边 1 对角 √2 ⇒ 7.2 ⇒ 公共中心 J_i；△c,H,H′ 平 ⇒ 中线公式 d(c,J_i)²=r²−¼·2=¼；另一侧
CN 给 d(c,J_i)²≤½·¾+½·¾−¼·d(X_i,Y_i)²=¼ ⇒ 夹逼等号 ⇒ c,X_i,Y_i 平 ⇒ x_i⊕y_i=2log_cJ_i=h_H⊕h_{H′}=:M_i，
‖M_i‖=1；余弦律给 ⟨x_i,y_i⟩=−¼；h_H,h_{H′} 夹角 cos=(−¼)/(¾)=−⅓，arccos(−⅓)<π ⇒ 扇形合法 ⇒
⟨M_i,h_H⟩=‖h_H‖²+⟨h_{H′},h_H⟩=¾−¼=½。nonnegative：M_A=h_{AB}⊕h_{AC}、M_B=h_{AB}⊕h_{BC}，sum-concavity
两次 ⇒ ¾−¼−¼−¼=0。[计算]
(c) 机械理由：full 定义是配对前提，只有同时邻 X_i、Y_i 的线能拼 4-环；A,B,C 各过 3 条 Fano 线全 full，
D 因 Y_D–CD 缺失（松边）只剩 AD,BD 两条 full，恰好够一次配对。geom:nonnegative 的加法锁死三线
AB,AC,BC 两两不同，否则某一项变 ‖·‖²=¾、和不再是 0。
(d) [推测] 失败路线一：对 D 处非 full 线写 fan 恒等式，4-环不存在。失败路线二：用结合律把 M_A、M_B
合并化简，B13 禁止。

### 7.4 例外入射恒等式 geom:exceptional（06:199-293）

(a) 逐字（06:207-221）："The vectors $M_C,x_D$ lie in a Euclidean sector in $T$, and
$h_0=M_C\oplus x_D$. Within this sector, \ip{M_C}{x_D}=-\frac12, \ip{M_C}{h_0}=\frac12,
\ip{h_0}{x_D}=\frac14." 设置 06:199-205：H₀=CD, h₀=h_{CD}, p=X_C, q=Y_C, z=X_D, J=mid(p,q)；
"The missing edge from $Y_D$ to $H_0$ is responsible for the asymmetry used in the next lemma."
(b) 九步：①C 处跑 7.3 构造 ⇒ d(H₀,J)²=½、d(c,J)²=¼（06:226-229）；②两步步 ⇒ d(H₀,z)=1，
p,H₀,z 与 q,H₀,z 两条给 d(p,z)²=d(q,z)²=2；③三元中点结论 ∠(J,H₀,z)≥π/2 ⇒ d(J,z)²≥½+1=3/2；
④J 是中点的 CN 反方向 d(J,z)²≤½·2+½·2−¼·1=3/2（d(p,q)=1）⇒ 夹逼 ⇒ △H₀Jz 在 H₀ 处直角平；
⑤B₀=[J,z] 上距 J 参数 1/3 的点：d(H₀,B₀)²=(2/3)²·½+(1/3)²=1/3；⑥向 c 的 CN：
d(c,B₀)²≤⅔·¼+⅓·¾−(2/9)(3/2)=1/6+1/4−1/3=1/12（06:260-264 逐字链）；⑦三角夹逼
√3/2=d(H₀,c)≤d(H₀,B₀)+d(B₀,c)≤1/√3+1/(2√3)=√3/2 ⇒ 全等 ⇒ B₀∈[H₀,c] 且 △cJz 平（内部比较等号）；
⑧扇形 (j,x_D) 内 B₀ 向量=⅔j+⅓x_D；d(c,H₀)=3d(c,B₀) ⇒ h₀=3log_cB₀=2j+x_D=M_C⊕x_D（06:275-281）；
⑨范数 ¾=1+¾+2⟨M_C,x_D⟩ ⇒ ⟨M_C,x_D⟩=−½；扇形内对两侧配对：⟨M_C,h₀⟩=1−½=½，⟨h₀,x_D⟩=−½+¾=¼。
(c) 机械理由：参数 1/3 唯一。[计算] 我验算：取参数 θ 时 d(H₀,B₀)²=(1−θ)²/2+θ²、d(c,B₀)² 由 CN 给出，
只有 θ=1/3 让两段距离之和恰等于 √3/2（1/√3+1/(2√3)=√3/2），把三角不等式夹成等式；这是直角三角形斜边
三等分点。松边的作用是让 p、q 与 z 的两条两步步存在而 Y_D 方向缺席，不对称正来自此处。
(d) [推测] 失败路线一：不引入 B₀ 直接断言 h₀、M_C、x_D 共线；共线恰是 ⑤-⑧ 的输出，预设即循环。
失败路线二：用消去律从 h₀=M_C⊕x_D 反解 M_C，B13 禁。

### 7.5 半圆与对径 geom:antipodal（06:297-355）

(a) 逐字："The unit vectors $M_C,M_D$ are antipodal in $T$: d_T(M_C,M_D)=2, \ip{M_C}{M_D}=-1."
(b) 证明：①路径 Y_D,H,X_D,H₀ 用 F_D 的两字段加松字段，是 admissible 三步步 ⇒
d(Y_D,H₀)≥√3=d(Y_D,c)+d(c,H₀)，反向由三角不等式取等 ⇒ 线段穿 c ⇒ y_D 与 h₀ 方向对径；
②定义 a=arccos(1/√3)、b=arccos(1/3)（06:318-320），2a+b=π（[计算] cos2a=2/3−1=−1/3=cos(π−b)）；
例外乘积给 d_Σ(M̂_C,ĥ₀)=a（cos=½）、d_Σ(ĥ₀,x̂_D)=b（cos=¼）；③fan-products 给
d_Σ(x̂_D,ŷ_D)=arccos(−⅓)=π−b，M_D 方向平分该弧（两加元等长）⇒ d_Σ(x̂_D,M̂_D)=a；④拼接
ĥ₀,x̂_D,ŷ_D 长 b+(π−b)=π 且端点对径 ⇒ 它整体是极小弧，x̂_D 处两侧都可测地延拓；⑤于是
M̂_C,ĥ₀,x̂_D,M̂_D 是 Σ 内长 a+b+a=π 的局部测地线，Σ 是 CAT(1) ⇒ BH II.1.4(2) 给全局极小 ⇒ 端点对径。
(c) 机械理由：端点让步逐字（06:348-353）："including the endpoint case of length exactly $\pi$.
Equivalently, apply the short local-geodesic assertion to every strict initial subarc and pass to the
endpoint by continuity of distance." 标准引文要求严格短于 π，长度恰 π 必须走子弧+连续。平分弧那步
要求两加元等长 [计算]，否则 M̂_D 不在弧中点、两半角不再都是 a、总长不再是 π。
(d) [推测] 失败路线一：直接对长 π 的局部测地线套用 II.1.4(2) 原文，前提不满足。失败路线二：用距离
凸性证 d_T=2，缺方向空间信息，接不上轴分裂那步。

### 7.6 总矛盾 prop:no-configuration（06:359-477）

(a) 逐字："No complete $\CAT(0)$ space contains the configuration asserted in
Proposition~\ref{prop:configuration}."
(b) 十二步：①假设存在，⟨M_A,M_B⟩≥0 已在 7.3；②M_C=h_{AC}⊕h_{BC}、M_D=h_{AD}⊕h_{BD}，四线两两不同
⇒ sum-concavity ⇒ ⟨M_C,h_{AD}⟩≥−½、⟨M_C,h_{BD}⟩≥−½；③夹逼 −1=⟨M_C,M_D⟩≥两项和≥−1 ⇒ 全等，
对称交换也得（06:380-385）；④轴表逐字（06:389-395）：行 M_C·(½,½,−½,−½)，行 M_D·(−½,−½,½,½)；
⑤对径射线成过锥顶的完整直线 ℓ；每列向量到 ℓ 两端角为 a 与 π−a，两弧拼接极小 ⇒ 其欧氏锥是等距平坦
半平面 ⇒ 向量落在平行 ℓ 的完整线上（06:397-405）；⑥平行集积分解逐字（06:407-408）："The parallel-set
product decomposition [BH II.2.14] now applies in $T$; it requires no properness." ⇒ P(ℓ)=ℝ×Q，
0=(0,q₀)，M_C=(1,q₀)，M_D=(−1,q₀)；⑦平坦半平面内向 ℓ 投影给轴坐标=⟨·,M_C⟩ ⇒ 逐字（06:420-423）
h_{AC}=(½,u)、h_{BC}=(½,u′)、h_{AD}=(−½,v)、h_{BD}=(−½,v′)，各点到 q₀ 距离 [计算] √(¾−¼)=1/√2；
⑧线间锥距平方 2 ⇒ 积度量 ⇒ d_Q(u,u′)=d_Q(v,v′)=√2、交叉四项全 1（06:430-436）；⑨M_C=h_{AC}⊕h_{BC}
⇒ 中点 (½,q₀) ⇒ q₀=mid(u,u′)，同法 q₀=mid(v,v′)；⑩u,v,u′,v′ 按循环序满足 7.2 ⇒ Q 内以 q₀ 为中心的单位
平方块；对边中点 m=mid(u,v)、m′=mid(u′,v′) ⇒ d_Q(q₀,m)=d_Q(q₀,m′)=½、d_Q(m,m′)=1；⑪M_A=h_{AC}⊕h_{AD}
=δ₂(0,m)、M_B=δ₂(0,m′)（06:466-468），δ₂ 是原锥 T 内伸缩、加倍一切距离；⑫‖M_A‖=‖M_B‖=1（(0,m) 在 T
内范数平方=½²·4/4=¼，倍增为 1 [计算]）、d_T(M_A,M_B)=2 ⇒ ⟨M_A,M_B⟩=−1，与①矛盾。
(c) 机械理由：两处免责声明逐字：B14（06:456-457）"This square lies in the transverse factor only; no
planar realization of the original incidence configuration has been assumed."；B15（06:469-470）"Here
$\delta_2$ is dilation in the original cone $T$; no cone structure on $Q$ is needed." 我的读法：矛盾
发生在横截因子 Q 里，与把 Fano 模板画进平面无关；δ₂ 只在 T 上作用，Q 甚至不必是锥。交叉项 d_Q=1 的
算术 [计算]：1=2−(½−(−½))²，两个 ½ 来自⑦，差 1 来自线不同，缺一环就凑不出方块边长。
(d) [推测] 失败路线一：跳过⑥直接在 T 内做坐标分解，没有 II.2.14 就没有积结构。失败路线二：在 Q 内
用锥均值证 ⟨M_A,M_B⟩，凹向不对且 Q 无锥结构。失败路线三：把 Q 的方块误读回原图并宣称构形可平面实现，
正是 B14 点名的误区。

（本段覆盖素材 2.33-2.37。）

## 8 完成层复原（论文 §7，07-completion.tex，70 行）

### 8.1 对角序列 lem:completion-diagonal（07:4-33）

(a) 陈述要点逐字（07:5-12）：存在实现序列 n_j→∞、参数 α_j,β_j,δ_j→0，使 (i) P_j aspherical 且有线性
字母盘填充，(ii) master match 集非空且单边边缘 TV→均匀，(iii) 对每个 admissible (I,{e}) 与固定 t，
common-I 耦合两个 TV 误差沿序列→0，(iv) 六字母对计数相对误差一致→0；结尾 "The groups $G_j=\pi_1P_j$
are infinite."
(b) 过程：阶段 j 要全部 1≤t≤j 的 admissible 测试（有限清单）；选 ε_j 同时对 prop:sampling 与
thm:diagram 够用且 ε_j<1/(400j)（07:15）；定 α_j=δ_j=ε_j、β_j=8ε_j（07:17-18）⇒ β_j>7α_j；主指数
3−β_j−90δ_j=3−98ε_j>0；逐字（07:21-23）j(β_j+90δ_j)=98jε_j<98/400<½ ⇒ 清单内每个 overlap 余量保住。
固定参数后 thm:diagram 的 proof 选出有限 fragment threshold（可依赖 j）；重合不等式概率→1；对同一参数
prop:sampling 给有限采样性质概率→1；选 n_j>n_{j-1} 使全好且误差 ≤1/j 的概率为正；取该交集中一个实现。
逐字（07:26）："No comparison between the fragment threshold and $n$ is needed before fixing the
parameters and threshold." 这是 B5/B8 的执行示范。
(c) 机械理由：无穷性走 χ 逐字（07:28-32）："Each $G_j$ has a quotient $C_2$ by Lemma lem:model-presentation.
If it were finite, its universal cover would be a finite contractible CW complex, and multiplicativity
of Euler characteristic would give 1=\chi(\widetilde P_j)=|G_j|\chi(P_j). Since $\chi(P_j)$ is an
integer, this forces $|G_j|=1$, contrary to the quotient." 400 无数学内容 [计算]：任何大于 98·2 的数
都行，Lean 版直接换 1000（见 §10）。98=8+90（β 系数 8 加 90 张四字母表各 1）。
(d) [推测] 失败路线一：先定全局 threshold 再选统一 n_j，rem:quantifiers（03:664-671）禁止。失败路线二：
用无挠性证无穷，论文未证无挠（未述清单第 5 条），只有 C₂ 商这一条路。

### 8.2 无作用命题 prop:completion-no-action（07:35-42）

逐字（07:39）："The action spaces, their dimensions, and their local geometries are allowed to vary."
证明骨架：设无穷多 G_j  admit 几何作用 ⇒ 取子列逐个定一个作用 ⇒ 对角序列全部固定测试极限仍成立 ⇒
按能量归一化（无穷性保证能量正）⇒ 位移界与 lem:conditional-test 对这些作用一致成立 ⇒ prop:configuration
给极限构型 ⇒ prop:no-configuration 排除 ⇒ 只有有限个能 admit。排除发生在子列层面；论文没有断言 G_j
两两不同构（未述第 7 条）。[机械理由] 作用可任选仍能传递，靠的是 bounded-test 的点对点界与 TV 耦合，
被积对象不依赖具体作用；对应 01:86-89 的"目标在呈现已知后才可任选"。

### 8.3 填充转移 lem:completion-transfer（07:45-58）

动机句逐字（07:45）："We record the filling transfer because the conclusion is about edge loops in a
finite simplicial complex, rather than just words in a presentation." 三块：①Hatcher 2C.5 给同维有限
单纯同伦模型 K；同伦等价提升到万覆盖 ⇒ K̃ 可缩。②呈现无关性：新→旧代入 φ 词长 ≤L；M 界住旧关系子
代入形 ψ(r) 的新呈现填充面积；D 界住零词 bψ(φ(b))⁻¹ 的填充面积；三个表都有限 ⇒ 常数存在；新零词长 ℓ
⇒ 旧词长 ≤Lℓ ⇒ 填旧再换关系胞至多 MC_old·Lℓ，边界代入再 +Dℓ ⇒ 新常数 MC_old·L+D。③作用到 K 的
最大树呈现（非树边=生成元、三角面=关系子）：K 内零伦边环插入固定树的有界路径 ⇒ 词线性填 ⇒ 每个关系子
换回三角面、树路径相消 ⇒ 面积 ≤Cℓ；K̃ 内边环投到 K 的零环，盘图携选定边界提升抬上去。

### 8.4 thm:main 证明与注记 7.4（07:60-70）

六步：①prop:completion-no-action 给 P_j，字母呈现线性盘界（thm:diagram）+ 8.3 ⇒ 二维 K（P_j 二维、
同维构造，07:61 逐字 "Since $P_j$ has dimension two, the same-dimension construction gives a
two-dimensional $K$"）；②π₁K=G_j 无作用；③线性 Dehn ⇔ word hyperbolic（07:61 引 BH
III.H.2.5(5)/2.7/2.9）；④设 L≃K 有相容 locally CAT(0) 测地长度量：L 紧 ⇒ 完备局部紧；万覆盖配诱导
长度量、覆盖映射局部等距（I.3.25）；完备性显式论证逐字（07:63）："a Cauchy sequence upstairs projects
to a convergent sequence downstairs; sufficiently short connecting paths force a tail into one sheet
over an evenly covered neighborhood of the limit, where it converges"；Cartan-Hadamard（II.4.1(2)）⇒
覆盖全局 CAT(0)；局部紧 + Hopf-Rinow（I.3.7）⇒ proper；deck 作用自由、真、余紧；⑤π₁L≅G_j 给几何
作用，矛盾；⑥CAT(−1) 即 CAT(0)（II.1.12(1)）⇒ locally CAT(−1) 一并排除。注记 7.4 逐字（07:68-70）：
"The argument makes no curvature assumption on the random complexes $P_j$. ... Nor is a common filling
constant needed for the diagonal sequence: only the constant for the single chosen finite complex
appears in Theorem thm:main."

（本段覆盖素材 2.38-2.41。）

## 9 常数与参数账目表（素材五 5.1 全表保留，敏感度栏照录）

| 记号 | 值/定义 | 来源 | 作用 | 敏感度 |
| --- | --- | --- | --- | --- |
| α | 小正参，fan 指数余量 | 03:18-19（f=2−α）；04:462 | 控 fan 期望出现 N^{2−α} vs 几何值 2 | 只需 α>0、7α<β，取多小都行，不敏感 |
| β | =8α（规定取法） | 04:463；07:18 | top 指数余量；定 β−7α=α | 8 非最优；任何 7<c<… 均可，8 让 β−7α=α 最简 |
| δ | 小正参，长装饰余量 | 03:21（h−δ）；04:463 | 六字母/2h 装饰余量 | 同 α，不敏感 |
| κ | min{β−7α, α/5, δ} | 03 rank/fragment 段；Fragment.lean:20 | 单位面积最小边界收益 | 1/5、7 皆粗化界，未证最优 |
| C₀ | =1/κ | 03 separator 段 | 分离子预算与面积界比例因子 | 与 κ 反比，α→0 爆炸 |
| D | =15 | 03-diagrams.tex | 每顶点最大 face 数 | 模板属性（deg≤7 与 fan 结构），可精确验 |
| 面积界 | ≤60C₀ℓ | thm:diagram 证明尾 | 线性填充常数 C | 60=4·15 [补]，论文不追常数 |
| c | 2√2 | 03 separator 段 | 平面分离子常数 | Lean 完全不用（D17），非本质 |
| K | ≥(924/κ)² | 03 separator 段 | 递归终止阈值 | 粗界拼装；Lean 对应 144c²≤K |
| |F| | 212=32+2·90 | 02；Template.lean:40 | field 总数，一切指数基数 | 精确、decide 可判 |
| |R| | 98=7+1+90 | 02；IncidenceTemplate.lean:18 | row 总数 | 精确 |
| Σk_i | 31；Σ(k_i−2)=17 | 02 | 核心指数 32−17−12=3 | 精确 |
| h(F) | 212−(17+12+180)=3 | 04 sample:eq-h | 主匹配期望量级 N³ | 精确；分配由模板唯一决定 |
| E\|Ω\| | N^{3−β−90δ} | sample:eq-master-mean | 主匹配非空 | α 完全消掉：(17+7α)+(12+β−7α)=29+β |
| t_max(β+90δ) | <1/2 | 04:460；SamplingStage.lean:52 | 每个 overlap 余量 ≥1/2 | 关键约束；Lean 显式 98=8+90 |
| 3−β_j−90δ_j | >0 | 07:20 | 对角序列主计数仍正 | ε_j<1/400 保证 |
| 位置对数 | 15 无序/30 Lean 有序 | 04:470；SixCounts.lean:21 | 六字母并界规模 | 差 2 倍被 Chernoff 常数吸收 |
| union 规模 | 15N² | 04 Chernoff 段 | 全部 (r,q) 与偏移同时好 | 精确 |
| ε_N | N^{−(1−δ)/4} | 04 | 相对误差阈值 | 需 δ<1 ⇒ Lean 显式 hδ |
| Chernoff 指数 | /3（论文）vs 4（Lean） | 04；Chernoff.lean:84 | 尾概率 | 常数无关本质 |
| E[six-pair] | N^{1−δ} | 04 | 每对均匀 | 需 δ<1 |
| M | 存在性（论文）/8（Lean） | 05；ConditionalStar.lean:222 | 使 B√(1/t+2M²η)+2BMη→0 | 8 任一可行常数 |
| 25(1+ε)/(1−ε) | 位移逐点上界 | 05；MetricProduct.lean:431(25R) | 合法化 bounded-test | 25=5×5（5 字母×CS） |
| r | √3/2 | 05 hexagon 段 | 余弦和论证输入 | 边长和 6、\|3−s\| 检查唯一确定 |
| −1/4 | ⟨h_H,h_{H'}⟩ | 06:108-112 | nonnegative：¾−¼−¼−¼=0 | 精确 |
| ½,¼,−½ | 例外乘积 | 06:216-219 | 例外恒等式输入 | 精确 |
| a,b | arccos(1/√3), arccos(1/3), 2a+b=π | 06:318-321 | 局部测地长 π ⇒ 对径 | 精确可验 |
| d(H₀,B₀)² | 1/3；d(c,B₀)²=1/12；参数 1/3 | 06 exceptional 段 | h₀=M_C⊕x_D | 精确；Lean exceptionalRadius=1/2 |
| ε_j | <1/(400j)；98jε_j<98/400<½ | 07:15,22 | 一次满足全部有限测试 | 400 可换（Lean 用 1000） |
| L,M,D（转移） | 代入长/旧词代入面积/校准词面积 | 07:53 | 呈现常数无关性 | 新常数 MC_old·L+D |
| 双曲常数 | L=18，K=3L²C，3(112K)+2 | IndexedFillingValue.lean:6705-6710 | BH 隐含链显式化 | 论文没给这些数 |
| N | \|S_n\|（论文）/2(n+1)（Lean） | 02:42-45；TableSelection.lean:60 | 唯一趋参 | 群结构无关（D12） |

5.2 禁止写入的十条"最优性"主张（逐条素材照录）：κ 最优与 1/5 可改进性；β>7α 中 7 的最优与临界情形；
D=15、60C₀ℓ 常数最优；六字母（，并非五/七）必要 [推测] N⁴·N^{−3−δ}=N^{1−δ}→∞ 而五字母 N^{−δ}→0 不够
[计算]；25 与 M 不可改进；极限构型唯一性；G_j 无挠/gd=2/不可 cubulate/非虚特殊；K 大小有效；不同 j
给不同构群；BH 引用常数数值化（论文没给，Lean 反而给了）。

（本节覆盖素材 5.1 与 5.2。）

## 10 Lean 取证（按我的实测修正）

实测目录：E:/math/lean/OAI/Geometry/HyperbolicGroups（preprint 根目录无 lean/；formalization.yaml 指认
此处）。我的命令实测：422 个 .lean；57,027 行；import 1,299 行（Mathlib 422、目录内 877、其他外部 0）；
sorry 0；axiom 声明 0（词形 "axiom" 5 处全在注释）；native_decide 0；interval_cases 0；decide 332、
omega 423、linarith 406、norm_num 323、positivity 125、nlinarith 195、fin_cases 86、ring 208、calc 93、
rcases 473、simp 2088、rw 2969、exact 3238、have 4660（词边界计数；素材 4.2 的 decide 340/fin_cases 76
是含复合标识符的口径差异，我保留自己的数并注明方法）。顶层声明按 kind：theorem 544、lemma 2349、
def 1044、abbrev 244、structure 55、instance 104、inductive 14、class 0，和 4,357；单一复合正则给
4,354，差 3 行是同行双前缀。[计算]

定位：formalization.yaml:97-100（标题/日期）与 :1230-1232（declaration: OAI.HyperbolicObstruction.main，
file: OAI/Geometry/HyperbolicGroups/Main.lean）。ComparatorChallenges/HyperbolicObstruction.json 344 B，
permitted_axioms=[propext, Quot.sound, Classical.choice]，enable_nanoda false。规格文件
HyperbolicObstruction.lean 163 行、:154 `theorem main : MainStatement.{u} := by sorry`（规格自带 sorry，
真实证明在 Main.lean:15，全文件 35 行，仅额外 import CompactLocalCATGeometric）。

必须订正素材的两处。其一（素材 D2）：素材 §1.3 引的 GeometricAction 写成 Bornology.IsBounded 形态且
归行号 62-68，不准；spec 与 Basic.lean 一致，实测全文逐字：`structure GeometricAction (G X : Type*)
[Group G] [MetricSpace X]`，字段 `act : G →* (X ≃ᵢ X)`；`proper : ∀ C : Set X, IsCompact C →
{g | ∃ x ∈ C, act g x ∈ C}.Finite`；`cocompact : ∃ C, IsCompact C ∧ ∀ x, ∃ g, ∃ y ∈ C, act g y = x`
（spec:108-112）。我在全目录 grep 'Bornology' 与 'IsBounded' 各 0 处。其二：素材 4.3 点名的 Fan.lean、
Splitting.lean、Barycenter.lean、SixTable.lean 经 ls 实测均不存在；SixTable 只是
IndexedFillingValue.lean:5247 的 namespace；II.2.14 分裂内容在 CATZeroFurther.lean 与切锥模块内完成。

论文范围 vs Lean 覆盖（我复测后确认的关键差异）：NoGeometricCATZeroAction := ∀ X, Nonempty X →
ProperSpace X → CompleteSpace X → CATZero X → IsEmpty (GeometricAction G X)（Basic.lean:116-118）；
CATZero=CN 不等式+整段测地线（:94-98）、CATNegOne=cosh 中点刻画（:100-105，故 cosh⇒CN 需自证：
IndexedFillingValue.lean:6760+ 四步 CurvatureComparison）；MainStatement（:145-151）无维度子句（D8），
"同伦模型上无 locally CAT(0)"只 CAT(−1) 版进入形式化、Cartan-Hadamard/deck 一步被
exists_finite_aspherical_hyperbolic_noAction（:6745-6746 注释自认 deliberately omits）绕开（D7）；
β>7α 在 Lean 里非严格（StarVariance.lean:108 7*α≤β）；对角数值换成 samplingParameter m=1/(1000(m+1))、
stageError m=1/(m+4)、(k+1)(8φ+90φ)≤½；字母表 SymmetricAlphabet=Fin(n+1)×Bool（N=2(n+1)，采样/能量
模块无 Equiv.Perm，证明 §4-§5 只用"大有限字母表+近均匀"）；六字母位置对 30 有序（SixCounts.lean:21）、
Chernoff 除 4；位移界 25R（MetricProduct.lean:425-431，PiLp 2、factor 1/√card）；能量最小元与归一化被
打包成结构体 EnergyOrbit（ConditionalStar.lean:88-96），:222 钉 M=8；面积项多一类 V
（ActualFragment.lean:22 defectConstant·(T+Q+E+V)≤Br+Bd），defectConstant=min(β−7α)min(α/5)δ
（Fragment.lean:20）与 κ 逐字同；分离子无 Lipton-Tarjan，自建 weighted_tree_centroid
（TreeCentroid.lean:21，注释 "not a planar-separator assumption"）、budget 16cn/√K−8c√n
（SeparatorBudget.lean:14）、cutoff 144c²≤K（SeparatorCutoff.lean:14）；双曲常数 L=18、K=3L²C、
3(112K)+2（finalFinite_hyperbolic :6721）；模板计数全 decide（Template.lean:24 32 边、:34 90 两路、
:40 212 字段、:113 核心指数 17；IncidenceTemplate.lean:18 98 行）；MetricHexagon.lean 510 行含 25 个
noncomputable section、Vertex=Fin 11⊕Fin 7、Adjacent 排除 (10,4)（松边）、中心对在 Fin 44 上
fin_cases+decide（:165/:172/:177）；fullLines=[{0,1,2},{0,3,4},{1,3,5},{2,4}]（CATZeroFurther.lean:182）
与我复算的"ABC 全满、D 缺 CD"一致；Exceptional.lean:18 exceptionalRadius=1/2、:35-37 坐标
excC=(2,4)、excY=(9,4)、excD=(3,4)、:145 impossible_sequence:False；我全目录 grep 'angle' 0 处，B11 的
"只用距离"在形式化里被彻底贯彻。[实测]

（本节覆盖素材 四；头条数字与素材一致，细节以我口径为准。）

## 11 与姊妹论文的机制对照（外部证据，不进入本文逻辑）

素材 A 块是另一篇"Artin 群无几何 CAT(0) 作用"的取证，我把它当风格对照。那篇给单个显式群：116=3+3·37+2
个生成子（引言逐字 "This gives 3+3\cdot37+2=116 generators"：三角形 T=⟨a,b,c⟩ 的 3 个、三个 B₄₀ 辫块各
37 个、哨兵 d,e 共 2 个），Artin 标签只取 {2,3,∞}；哨兵 m_de=∞、对 a,b,c 全 2 ⇒ amalgam 正规形双向证
C_G(d)∩C_G(e)=T。数值核心是辫比值 R₃=(ℓ((s₁s₂)³)/3ℓ(s₁²))²≥143/513>¼（k=20）；[分析] 我核对阈值敏感度：
不等式形状 (3k−4)/((k−1)(k−2))<¼ 即 k²−15k+18>0，k=14 已过、k=13 失败，论文取 20 余量约 6，理由未述。
比值>½ ⇒ 扇区角 θ<π/3 ⇒ 六射线总角 Ω<2π ⇒ Digne 反射坐标的等边三角形仿射作用 ⇒ 外盖帽
ε=½(1−sin(Ω/4)) ⇒ Gersten 球面计数 0 ⇒ 不几何 CAT(0)。其 Lean：20 文件、9,419 行、945 条行首声明、
sorry 0、toolchain v4.34.1（素材 A-5.3 口径，我未亲测该目录，作外部证据引用）。两篇策略差异我总结为：
那篇是"一个群、一次作用、平移长度障碍"，常数 143/513 是单点命门；本篇是"一列随机群、任意维度任意作用
全体排除"，常数（κ、60C₀）只需存在且 B1 主动放弃有效性。对照只进本节，不改变本文任何判断。

## 12 边界声明与论文未述清单

作者自置的 15 条边界（位置+内容，全表素材 3.3）：B1 01:15 存在性论证、无有效规模；B2 01:171-172 填充
常数可依赖所选呈现；B3 01:175 常数归属固定有限呈现；B4 01:175 whp=参数先固定再 N→∞；B5 01:175 有限测试
极限与对角选择必须区分；B6 01:180 后续乘积与极限不必 proper，properness 只用于原始几何作用；B7 01:180
新构造估计一律自证；B8 04:464-466 方差论证不对无界 t 一致；B9 04:438-440 耦合两个边缘结论分工不同；
B10 05:327-328 Z 不需要 properness 与维数界；B11 05:506-507 不假设角与超极限交换；B12 06:8-9 切锥不必
是向量空间；B13 06:26-27 不用 ⊕ 的结合/消去；B14 06:456-457 横截方块非平面实现；B15 06:469-470 δ₂ 只在
T 中、不需要 Q 的锥结构。另有两条技术性让步：BH II.1.4(2) 端点情形的替代论证（06:348-353，见 7.5(c)）；
fragment threshold 与 n 免比较声明（07:26，见 8.1(b)）。07:45 转移动机句与 07:68-70 注记 7.4 也属边界
声明，已分别在 8.3、8.4 逐字录入。
论文未述 14 条（终稿引用必须标 [推测] 或声明"论文未述"）：Γ̂ 顶点总数一句话（[计算] 定义给 7+4+7=18 顶点、
32 边）；κ 中 1/5、7 的最优与 β=7α 临界；为何选 Fano/F₂³ 模板；C₀、D、60C₀ℓ 最优性；无挠/gd/同调维数/
与已知 CAT(0) 群准等距；cubulation/虚特殊/RD3；G_j 两两不同构；任何数值实验或代码；有效上界；与
Wise/Agol 路线比较；写作历史与版本迭代；§6 矛盾在 CAT(−1) 下是否单独成立（07:65 只走传递一步）；Z 的
凸性与正则性；六字母位置数的必然性 [计算] N⁴·N^{−3−δ}=N^{1−δ}、五字母 N^{−δ}→0、七字母冗余，论文无此句。

## 13 最终思路与最初设想的差异

我进场时猜的是"找一个显式群，用拟等距不变量（边界、分离对、RD 类性质）挡掉 CAT(0)"。实际路线是
实现问题形态：群由随机表生成，障碍在一切潜在作用空间内部由"能量极小⇒超积极限构型⇒锥内刚性矛盾"
建立。差异我列五条：其一，排除对象是任意维、任意局部几何的全部作用（01:48-59 明确强于 Brady-Crisp 的
同维限制），而我预想的是针对单个给定 CAT(0) 复形；其二，承担证明的是参数分层（α,β,δ）与极限次序
（有限测试、对角序列），不存在单点数值命门，这与姊妹篇的 143/513 结构相反；其三，障碍是度量刚性的
（方格、半圆、积分裂），组合性质只管概率；其四，纯存在性、无有效规模（B1），我预设的"写出一个群"落空；
其五，矛盾发生在子列层面，连 G_j 互不同构都未断言。素材 5.3 三条提示我全部采纳：采样链不需要群结构
（D12）；α 在主指数中结构性消掉（§9 表 E|Ω| 行）；Lean 覆盖严格小于论文陈述（§10），终稿凡说"已形式化"
必须精确到 MainStatement 的子句。

（本篇全部落盘完毕。覆盖对照：素材一→§0-2；素材 2.1-2.10→§3；2.11-2.15→§4；2.16-2.23→§5；
2.24-2.32→§6；2.33-2.37→§7；2.38-2.41→§8；素材三→分散于 §1-2、8、12；素材四→§10；素材五
5.1/5.2→§9、5.3→§13；素材 A 块→§11。）

## 14 台账补表

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $N=2n$ | $\lvert S_n\rvert=2n$，唯一趋参 | 02-model.tex:44 | 四表全部 $N$ 幂概率；04-sampling.tex:501 匹配计数 | 字母表规模改义则 05-energy.tex:120 归一化失去含义，位移上界 $25$ 与 $N$ 脱钩 |
| $f=2-\alpha$ | 扇表指数 | 02-model.tex:48 | 02-model.tex:56 扇含概率 $N^{f-k_i}$；02-model.tex:74 扇期望 $N^f$ | 取 $f=2$ 与几何值重合，03-diagrams.tex:24 的 $\alpha$ 余量归零，03-diagrams.tex:496 的 $\kappa=\min$ 掉到 $0$ |
| $p=3-\beta$ | top 表指数 | 02-model.tex:48 | 02-model.tex:57 标记概率 $N^{p-gf-1}$；02-model.tex:78 top 期望 $N^p$ | $\beta-7\alpha$ 号反则 02-model.tex:68 的 $-12-(\beta-7\alpha)$ 变大，03-diagrams.tex:62 首项 $(p-7f)s$ 转正，图计数散 |
| $0<\alpha,\delta<1$，$7\alpha<\beta<1$ | 参数带宽 | 02-model.tex:49 | 03-diagrams.tex:496 保证 $\kappa>0$；04-sampling.tex:460 重叠余量 | $\beta\le7\alpha$ 时 03-diagrams.tex:24 的差集项塌，03-diagrams.tex:524 的 $\kappa$ 换项后面积收益断供 |
| $g=7$ | 扇槽数 | 02-model.tex:19 | 02-model.tex:57 的 $p-gf-1$；02-model.tex:78 的 $N^{32}N^{p-7f-1}\prod_i N^{f-k_i}=N^p$ | $g$ 与 $7$ 脱钩则 02-model.tex:68 常数 $-12$ 要重算，03-diagrams.tex:62 的 $(p-7f)$ 系数错 |
| $(k_i)=(6,6,6,4,3,3,3)$ | 七扇边数向量 | 02-model.tex:21 | 02-model.tex:56 逐型 $N^{f-k_i}$；03-diagrams.tex:82 的 $\sum_b(f-k_b)$ | 单分量改动即坏 $\sum_i k_i=31$，02-model.tex:78 化简不成 $N^p$ |
| $\sum_i k_i=31$，$\lvert E(\Gamma)\rvert=32$ | 核心字段与松散边分开计 | 02-model.tex:22 | 02-model.tex:78 主期望；02-model.tex:124 $\mathcal M$ 字段 $32+2\cdot90$ | 松散边 $e_0$（02-model.tex:14）的 $-1$ 丢则 02-model.tex:57 概率指数错，04-sampling.tex:501 漂移 |
| 18 顶点、圈秩 $15$、扇秩和 $7$ | $\Gamma$ 的秩数据 | 02-model.tex:24 | 02-model.tex:96 图 $B$ 的秩 $8$ 对应 $15-7$ | 秩数对不上则 02-model.tex:104 的 top 锥挂载基数错，03-diagrams.tex:62 的 $s$ 计数与 §7 收尾脱节 |
| $N^{-2-\delta}$ | 90 张方块表逐行概率 | 02-model.tex:58 | 02-model.tex:80 期望 $N^{2-\delta}$；03-diagrams.tex:21 的 $h-\delta$ 列 | $\delta\ge1$ 则 04-sampling.tex:476 前提坏，$\varepsilon_N=N^{-(1-\delta)/4}$ 停摆 |
| $N^{-3-\delta}$ | 六字母表含概率 | 02-model.tex:59 | 04-sampling.tex:474 的 $Q_{rq}$ 均值 $N^{1-\delta}$ | 改 $N^{-4-\delta}$ 则 $N^4\cdot N^{-4-\delta}\to0$，05-energy.tex:146 逐前缀非空坏，位移界断 |
| $h\in\{2,3\}$，装饰长 $2h$ | 四、六字母两种 | 02-model.tex:61 | 03-diagrams.tex:64 的 $2h_e\in\{4,6\}$；03-diagrams.tex:87 的 $J=s+\sum_b k_b+\sum_e2h_e$ | 添 $h=4$ 则 03-diagrams.tex:21 期望指数与几何值之差变向，03-diagrams.tex:90 的 $\sum_e(h_e-\delta)-R$ 号乱 |
| $90=31+59$ | 二径路数：$10\binom{3}{2}+\binom{2}{2}=31$ 加线度 $5,5,4,5,5,5,3$ 贡献 $59$ | 02-model.tex:64 | 02-model.tex:122 主图案每路配一行；04-sampling.tex:455 的 $t(\beta+90\delta)$ | $90$ 改则 07-completion.tex:22 的 $98\varepsilon_j=\beta_j+90\delta_j$ 系数不同步，对角序列坏 |
| $\mathcal M$ 字段 $212=32+2\cdot90$ | 共享核字段只计一次的约定 | 02-model.tex:124 | 04-sampling.tex:501 的 $\lvert\Omega_n\rvert=(1+o(1))N^{3-\beta-90\delta}$ | 重复计则期望指数要重推，04-sampling.tex:503 均匀边缘断，05-energy.tex:246 条件检验失定义 |
| 允许字段族：核字段 $\le3$ 且每扇 $\le2$；或单方块 $\le2$ | 两族检验的公共定义 | 02-model.tex:129 | 05-energy.tex:252 条件检验式；07-completion.tex:9 对角清单 | 放宽到每扇 $3$ 字段则 02-model.tex:38 三步路径配额失守，02-model.tex:135 中点恒等式组合失控 |
| $R\le(p-7f)s+fu+\sum_e(h_e-\delta)$ | 重合秩上界 | 03-diagrams.tex:62 | 03-diagrams.tex:90 期望 $C_MN^{(p-7f)s+fu+\sum_e(h_e-\delta)-R}$ | 上界松 $1$ 则 03-diagrams.tex:92 反例模式的指数可非负，03-diagrams.tex:94 求和断 |
| $\kappa=\min\{\beta-7\alpha,\alpha/5,\delta\}$ | 单位面积最小边界收益 | 03-diagrams.tex:496 | 03-diagrams.tex:501 的 $C_0=1/\kappa$；03-diagrams.tex:524 的 $\Delta\ge\kappa A$ | $1/5$ 放宽到 $1/4$ 则 03-diagrams.tex:539 的 $2\kappa A\le2\Delta$ 起常数链重排，03-diagrams.tex:658 界变大 |
| $C_0=1/\kappa$ | 面积对边界比例因子 | 03-diagrams.tex:501 | 03-diagrams.tex:593 吸收条件 $2C_0\eta\le1/2$；03-diagrams.tex:612 的 $A\le C_0(B_0+2\eta A)$ | $\alpha\to0$ 使 $C_0$ 爆炸，03-diagrams.tex:594 固定有限检验的 $\eta$ 不够小，递归终止失 |
| $\Delta\ge\kappa(T+Q+E)=\kappa A$ | 三类分块收益合计 | 03-diagrams.tex:524 | 03-diagrams.tex:539 的 $2\kappa A\le2\Delta$ | 丢 $T,Q,E$ 任一类则 03-diagrams.tex:613 的 $A\le2C_0B_0$ 吸收不成 |
| $D=15$ | 分隔引理的 face 度上界 | 03-diagrams.tex:594 | 03-diagrams.tex:618 单图内面 $\le2C_0\ell$ | 改大则 03-diagrams.tex:658 的 $60C_0\ell$ 系数换，定理的 $C$ 见证要重跑（07-completion.tex:55） |
| $A\le2C_0B_0$ | 吸收后总面积不等式 | 03-diagrams.tex:613 | 03-diagrams.tex:618 边界 $\ell$ 图面数 $2C_0\ell$；03-diagrams.tex:658 终界 $60C_0\ell$ | 系数翻倍则 03-diagrams.tex:658 的 $60$ 拼装断，线性填充陈述失去出处 |
| $\langle u,v\rangle=(\lVert u\rVert^2+\lVert v\rVert^2-d_T(u,v)^2)/2$ | 锥内积由距离定义 | 06-obstruction.tex:17 | 06-obstruction.tex:20 角截断到 $\pi$；06-obstruction.tex:36 超可加式 | 截断规则改动则内积符号失序，06-obstruction.tex:164 的下界作废 |
| $u\oplus v=2\operatorname{mid}(u,v)$ | 锥上对径中点加法 | 06-obstruction.tex:23 | 06-obstruction.tex:122 $M_i=x_i\oplus y_i$；06-obstruction.tex:157 $x_i\oplus y_i=2\log_c J_i$ | 06-obstruction.tex:26-27 声明不用结合消去，若暗中结合则 06-obstruction.tex:280 三重等式推链断 |
| $\langle w,u\oplus v\rangle\ge\langle w,u\rangle+\langle w,v\rangle$ | 超可加（凹性侧） | 06-obstruction.tex:36 | 06-obstruction.tex:164 $\langle h_H\oplus h_{H'},h_H\rangle$ 下界 | 06-obstruction.tex:28-29 欧氏扇区前提要角距 $<\pi$，06-obstruction.tex:162 判据不查则 06-obstruction.tex:175 起各恒等式作废 |
| $a=\arccos(1/\sqrt3)$，$b=\arccos(1/3)$ | 两角，弧长参数 | 06-obstruction.tex:319 | 06-obstruction.tex:331 $d_\Sigma(\widehat x_D,\widehat y_D)=\arccos(-1/3)=\pi-b$；06-obstruction.tex:399 逐向量重算 | 两角值改则 06-obstruction.tex:333 平分方向无据，对径判据丢，06-obstruction.tex:359 命题前提缺 |
| $h_0=M_C\oplus x_D=3\log_c B_0$ | 例外入射恒等式链 | 06-obstruction.tex:280 | 06-obstruction.tex:207 引理输出；06-obstruction.tex:359 命题输入 | 链上任一段断则 §6 的构型矛盾无，07-completion.tex:41 的排除引用断 |
| $M_A=h_{AB}\oplus h_{AC}$，$M_B=h_{AB}\oplus h_{BC}$ | 扇恒等式对 | 06-obstruction.tex:175 | 06-obstruction.tex:371 $M_C=h_{AC}\oplus h_{BC}$ 接力 | 失其一则 06-obstruction.tex:437 中点表述无效，06-obstruction.tex:466 的 $\delta_2(0,m)$ 等式无源 |
| $t(\beta+90\delta)$ | 实际代价对临界代价的替换上界 | 04-sampling.tex:455 | 04-sampling.tex:460 的 $t_{\max}(\beta+90\delta)<1/2$ | 余量跌到 $1/2$ 以下则 05-energy.tex:246 条件检验的公共 $I$ 组比较断 |
| $\beta=8\alpha$ | 规定取法，使 $\beta-7\alpha=\alpha$ | 04-sampling.tex:463 | 07-completion.tex:18 的 $\beta_j=8\varepsilon_j$ | 两处不同步则 07-completion.tex:15 的 $\varepsilon_j$ 跑出 04-sampling.tex:494 的参数邻域 |
| $\varepsilon_N=N^{-(1-\delta)/4}$ | 相对误差阈值 | 04-sampling.tex:477 | 04-sampling.tex:481 尾概率 $2\exp(-\varepsilon_N^2N^{1-\delta}/3)$ | 阈值降得过快则并界压不住指数项，04-sampling.tex:487 的 $\max$ 收敛断 |
| $15N^2$ | 并界规模：$\binom{6}{2}=15$ 个位置对乘 $N^2$ 个字母对 | 04-sampling.tex:483 | 04-sampling.tex:487 一致 $o(1)$；05-energy.tex:127 逐点误差前提 | $\delta<1$（04-sampling.tex:517）坏则均值 $N^{1-\delta}$ 与尾指数双失，05-energy.tex:142 的窗口成空转 |
| $Q_{rq}(u,v)$：$N^4$ 个 $\operatorname{Bern}(N^{-3-\delta})$ 之和，均值 $N^{1-\delta}$ | 六字母两位计数 | 04-sampling.tex:474 | 05-energy.tex:142 $(1-\varepsilon)N^{1-\delta}\le Q_{1k}(a,b)$；05-energy.tex:156 $\lVert v_a\rVert^2\le5\sum_{k=2}^6\lVert v_{s_k}\rVert^2$ | 均值涨率改 $O(1)$ 则 05-energy.tex:146 逐前缀非空坏，05-energy.tex:130 的 $25$ 界断 |
| $\lvert\Omega_n\rvert=(1+o(1))N^{3-\beta-90\delta}$ | 主匹配计数 | 04-sampling.tex:501 | 04-sampling.tex:503 单字段边缘 $o(1)$ 均匀；07-completion.tex:20 指数为正 | $\beta+90\delta\ge3$ 则期望归零，$\Omega_n$ 可空，05-energy.tex:252 检验无底 |
| $\frac1N\sum_{s\in S_n}\lVert v_s\rVert^2=1$ | 能量归一 | 05-energy.tex:120 | 05-energy.tex:161 逐条件均值；05-energy.tex:130 位移界 | 改常数 $c$ 则 05-energy.tex:237 一致界与 05-energy.tex:289 的 $B$ 按比例漂 |
| $\max_s\lVert v_s\rVert^2\le25\frac{1+\varepsilon}{1-\varepsilon}$ | 位移逐点上界 | 05-energy.tex:132 | 05-energy.tex:237 一致界；05-energy.tex:289 $B\sqrt{1/t+2M^2\eta_{\nu,t}}+2BM\eta_{\nu,t}$ | $\varepsilon<1$（05-energy.tex:127）失守则 $B$ 无界，05-energy.tex:284 检验衰减断 |
| $\mathbb{E}\lVert m_t\rVert^2\le1/t$ | 归纳均值，单位方差 Sturm 界 | 05-energy.tex:202 | 05-energy.tex:289 的 $1/t$ 根号项；05-energy.tex:554 构型命题 | $t$ 分支均值不趋零则 §6 极限构型拿不到，06-obstruction.tex:122 恒等式缺左边 |
| $\lVert[u,v]_t\rVert^2=(1-t)\lVert u\rVert^2+t\lVert v\rVert^2-t(1-t)d(u,v)^2$ | 锥上径向恒等式 | 05-energy.tex:173 | 05-energy.tex:211-213 凹凸性推导；05-energy.tex:205 均值凹性 | 该式靠 05-energy.tex:176-179 的扇区与过顶点两情形拼装，前提坏则 05-energy.tex:206 不等号方向不可控 |
| $\frac1t\sum_{j=1}^t\langle h,V_j\rangle\le\langle h,m_t\rangle$ | 均值凹性 | 05-energy.tex:206 | 05-energy.tex:271-286 分支比较 | 反向则 05-energy.tex:284 的 $2M^2\eta_{\nu,t}$ 损失项符号错，05-energy.tex:289 整体界散 |
| $j(\beta_j+90\delta_j)=98j\varepsilon_j<98/400<1/2$ | 对角序列的余量核算 | 07-completion.tex:22 | 04-sampling.tex:460 的 $t_{\max}$ 条款；07-completion.tex:15 取参 | $400$ 改到 $196$ 以下则不过半，07-completion.tex:9 的 $1\le t\le j$ 耦合清单坏 |
| $\varepsilon_j<1/(400j)$，$\alpha_j=\delta_j=\varepsilon_j$，$\beta_j=8\varepsilon_j$ | 一次满足全部有限检验 | 07-completion.tex:17 | 07-completion.tex:20 的 $3-\beta_j-90\delta_j>0$；04-sampling.tex:493 命题前提 | 三式不同换则 07-completion.tex:36 的大 $j$ 结论漂，07-completion.tex:41 排除失效 |
| $1=\chi(\widetilde P_j)=\lvert G_j\rvert\chi(P_j)$ | 欧拉示性式乘法性 | 07-completion.tex:30 | 07-completion.tex:12 的 $G_j$ 无穷；05-energy.tex:116 排除 $\lvert G\rvert=1$ 分支 | 缺 02-model.tex:107 的 $C_2$ 商则平凡群排不掉，05-energy.tex:119 归一化失去正性前提 |
| 新填充常数 $MC_{\rm old}L+D$ | 呈现转移界 | 07-completion.tex:53 | 07-completion.tex:55 最大树呈现；07-completion.tex:61 双曲性收尾 | $L,M,D$ 任一无穷则 01-introduction.tex:9 的 $C\ell$ 陈述失出处 |
| 线性 Dehn 函数等价词双曲 | 收尾引用 | 07-completion.tex:61 | 01-introduction.tex:12 "In particular" 句；01-introduction.tex:13 的 $\CAT(-1)$ 传递 | 等价引用断则定理的双曲性句失去出处，题目里的有限模型结论悬空 |

视角差异勘误：本表与第 1150 行的旧表是同一批常数的两本账。旧表按素材 5.1 的口径登记出处、作用与敏感度，回答"这个常数能被放宽到什么程度"；本表按推导链口径登记被谁消费与改动后果，回答"放宽之后哪一步先塌"。旧表的 32 条数据行与表头一字未动，本表与其重叠的条目取值全部一致，只是把旧表里 "03:18-19"、"04 Chernoff 段"这类速记位置展开成 build 目录内的全文件名加行号，便于复查。两本账并存的收益：敏感度栏说"不敏感"的地方（比如 $1/5$、Chernoff 分母、$400$ 换成别的数），本表给出具体的断链深度，说明不敏感是有前提的，前提就是消费它的检验清单恰好有限。

## 15 几何作用假设的形式化与矛盾对象

我把"无几何 CAT(0) 作用"这句口头假设落成符号：要否定的对象是一个等距作用 $G\times X\to X$，$X$ 是完备度量空间，满足 $X$ 是 proper 的、$X$ 是 $\operatorname{CAT}(0)$ 的、作用真且不因子（properly discontinuous and cocompact），$G=\pi_1K$ 有限生成（05-energy.tex:44-46）。不因子性给出紧集 $C$ 使 $GC=X$，真性说把 $C$ 搬进紧邻域内的群元只有有限个，两条合用才撑得起最小化子列的回收。

论文的记号约定（05-energy.tex:10-20）：$T_xX$ 是 $X$ 在 $x$ 的完备切锥，锥顶记 $0$；$\log_xy\in T_xX$ 满足 $\lVert\log_xy\rVert=d(x,y)$，方向为 $x$ 到 $y$ 的测地线方向；欧氏锥内 $\langle u,v\rangle=(\lVert u\rVert^2+\lVert v\rVert^2-d(u,v)^2)/2$，非零向量时 $\langle u,v\rangle=\lVert u\rVert\lVert v\rVert\cos\angle(u,v)$，角截断在 $\pi$；非负实数乘向量一律指径向位似 $\delta_a$，$au=\delta_a(u)$（06-obstruction.tex:13-15），锥上没有任何加法结构被假定（05-energy.tex:19-20）。比较几何的全部输入是不等式
$d(y,z)^2\ge d(x,y)^2+d(x,z)^2-2\langle\log_xy,\log_xz\rangle$（05-energy.tex:28-31）。

能量与一阶变分（05-energy.tex:44-107）：有限对称生成集 $S$ 按重数计，$E(x)=\frac1{|S|}\sum_{s\in S}d(x,sx)^2$；$E$ 取到最小值且最小值为正；最小化基点 $x$ 处 $v_s=\log_x(sx)$ 对一切 $h\in T_xX$ 满足 $\frac1{|S|}\sum_{s\in S}\langle h,v_s\rangle\le0$，等价于 $0$ 是它们的质心，并且
$\frac1{|S|}\sum_{s\in S}d(h,v_s)^2\ge\lVert h\rVert^2+\frac1{|S|}\sum_{s\in S}\lVert v_s\rVert^2$（05-energy.tex:54-62）。存在性证明的链条：取最小化序列 $x_j$ 与 $y_j=g_jx_j\in C$，$E(x_j)$ 有界推出每个 $d(x_j,sx_j)$ 有界，从而 $d(y_j,(g_jsg_j^{-1})y_j)$ 有界；properness 使 $C$ 的任意固定半径邻域闭包紧，于是每个 $s$ 的 $g_jsg_j^{-1}$ 只剩有限多取值，取子列使共轭生成元组恒定、$y_j\to y\in C$，则 $g_{j_0}^{-1}y$ 取到原族的 infimum；能量为零会令全部生成元定一点，而 proper 作用的点稳定子有限，最小值正（05-energy.tex:66-83）。

一阶变分的算式（05-energy.tex:86-103）：设 $x_t$ 是自 $x$ 出发、初速 $\lVert h\rVert$ 的测地线，交叉测地线中点凸性给
$d(x_t,sx_t)^2\le\frac12d(x_{2t},sx)^2+\frac12d(x,sx_{2t})^2$；对对称字母表平均，右端两项在"第二距离作用 $s^{-1}$、同时 $s$ 换成 $s^{-1}$"下平均值不变，最小性与一阶变分给
$0\le\left.\frac{d}{dt}\right|_{0+}\frac1{|S|}\sum_sd(x_{2t},sx)^2=-\frac4{|S|}\sum_s\langle h,v_s\rangle$；可表示向量在完备切锥中稠密，连续性把质心不等式推广到一切 $h$。

有穷排除与归一（05-energy.tex:109-120，07-completion.tex:28-32）：若 $G$ 有限，则 $\widetilde P$ 是有穷可缩复形，欧拉示性式乘法性 $1=\chi(\widetilde P)=\lvert G\rvert\chi(P)$ 强制 $\lvert G\rvert=1$，与商 $G\twoheadrightarrow C_2$（02-model.tex:106-107）矛盾。故一切几何作用都可度量归一：重标定 $X$ 的度量使最小化基点处 $\frac1N\sum_{s\in S_n}\lVert v_s\rVert^2=1$，重标定保持完备性、properness 与 $\operatorname{CAT}(0)$ 条件（05-energy.tex:122-123）。定理末尾的传递链（07-completion.tex:63-65）：若同伦于 $K$ 的有限复形 $L$ 携带相容的局部 $\operatorname{CAT}(0)$ 测地长度度量，则 $\widetilde L$ 携提升长度度量、覆盖映射局部等距，完备性由柯西列下降论证，Cartan-Hadamard 给全局 $\operatorname{CAT}(0)$，局部紧加 Hopf-Rinow 给 proper，deck 群 $\pi_1L\cong G_j$ 的等距作用几何，矛盾；局部 $\operatorname{CAT}(-1)$ 度量的排除只多一步 $\operatorname{CAT}(-1)$ 蕴含 $\operatorname{CAT}(0)$。

## 16 四张表的伯努利指数逐条落纸面

字母表 $S_n=\{a_1,a_1^{-1},\ldots,a_n,a_n^{-1}\}$，$N=2n$（02-model.tex:43-44）；指派不要求用不同字母，也自由约化不作要求（02-model.tex:45-46）。参数 $f=2-\alpha$，$p=3-\beta$，$0<\alpha,\delta<1$，$7\alpha<\beta<1$（02-model.tex:47-49）。

表 (i)：对每个点 $i$，指标集 $S_n^{E(F_i)}$ 的伯努利阵把每个元组以概率 $N^{f-k_i}$ 纳入；纳入元组连同类型 $i$ 是扇出现 $b$（02-model.tex:56）。候选元组有 $N^{k_i}$ 个，扇期望 $\mathbb E= N^{k_i}\cdot N^{f-k_i}=N^f$（02-model.tex:73-74）。表 (ii)：指标集 $S_n^{E(\Gamma)}$，完整核元组以概率 $N^{p-gf-1}$ 被标记；top 出现 $a$ 是被标记、且限制到每个 $F_i$ 都是已纳入扇的元组，记 $a\to b$ 于"$b$ 是 $a$ 的七个槽之一"（02-model.tex:57）。固定核元组成为 top 要标记加七个独立扇条目，扇合计占 $31$ 个字段，top 期望
$N^{32}\cdot N^{p-7f-1}\cdot\prod_i N^{f-k_i}=N^p$（02-model.tex:74-79）。表 (iii)：$\Gamma$ 的每条无向不回退二径路 $\tau$ 选定序与向，配四字段阵列，前两坐标取 $\tau$ 上的两个核心字段、后两坐标新取，每行以概率 $N^{-2-\delta}$ 纳入；relator 读 $\tau$ 带定向号再接两个新字母绕回闭合路（02-model.tex:58）。表 (iv)：独立六字段阵列，$S_n^6$ 中每个词以概率 $N^{-3-\delta}$ 纳入，其词是 relator（02-model.tex:59）。(iii) 与 (iv) 纳入的行整体施为关系，只与 top 匹配的行才施为是不成立的读法；这些行叫装饰，长度 $2h$，$h\in\{2,3\}$（02-model.tex:61）。

合法性核算：$p-gf-1=3-\beta-7(2-\alpha)-1=-12-(\beta-7\alpha)<0$（02-model.tex:66-69）；扇概率指数 $f-k_i\le(2-\alpha)-3=-1-\alpha<0$ 因 $\min_ik_i=3$（向量 $(k_i)$ 见 02-model.tex:21，左侧比较是我算的 [计算]）；$N^{-2-\delta}$ 与 $N^{-3-\delta}$ 显然合法。同表内不同数值元组独立；top 出现之间共享扇槽导致相关，top 标记保持独立（02-model.tex:69-70）。共享出现的相关正是"公共扇成本只记一次"的理由（02-model.tex:84-86）。

期望尺寸一览：方块表期望 $N^{2-\delta}$，六字母表期望 $N^{3-\delta}$（02-model.tex:80-81）；扇与方块的期望指数贴着几何值 $2$，top 与六边形贴着 $3$，缺口 $\alpha$、$\beta-7\alpha$、$\delta$ 就是图估计里的正余量来源（02-model.tex:81-86 与 03-diagrams.tex:18-25）。路径计数：十一个点代表顶点贡献 $10\binom32+\binom22=31$ 条二径路，七条线的度 $5,5,4,5,5,5,3$ 贡献 $5\binom52+\binom42+\binom32=50+6+3=59$ 条，合计 $90$ 张方块表（02-model.tex:64，末式展开 [计算]）。

主图案：$\mathcal M$ 取一个 top 出现带七个扇槽，再对 $90$ 条二径路各取其方块表的一行匹配，行内两个核坐标与对应核心字段认同、两个闭合坐标取新；六字母阵列在 $\mathcal M$ 之外（02-model.tex:121-122）。匹配是给 $\mathcal M$ 的字段指派使一切所需表条目（含 top 标记）都在场，匹配集 $\Omega_n$，非空时携均匀概率律；字段总数 $32+2\cdot90=212$，共享核字段只计一次（02-model.tex:124）。允许字段集两族：至多三个互异核心字段且每个扇至多两个字段；或单个方块装饰的至多两个字段；松散核心字段不占扇配额（02-model.tex:126-132）。第一族覆盖核心六边形的全部三边半路，也覆盖 $F_C$ 两字段加松散字段的组合，后者产出决定性中点恒等式（02-model.tex:135）。匹配的群赋值：定锚点后把顶点标为沿任选锚路径读出的词，闭路标签经 Lemma model-presentation 与方块 relator 全部平凡，于是顶点标注与路径无关；任给作用与基点，它就给出轨道点构型（02-model.tex:137）。

## 17 重合秩不等式的三段显示计算

字段位置的定义（03-diagrams.tex:47-55）：对 top、扇、装饰出现的有限集合，位置由三部分组成：每个 top 的松散字段一个、每个类型 $i$ 扇出现的 $k_i$ 个、每个装饰的全部字段；同一扇出现占据多个 top 的槽时其字段只计一次。无号重合秩 $R=\text{位置数}-\text{站上位置的互异底字母数}$，字母与逆字母共享无号值。

秩引理陈述（03-diagrams.tex:56-66）：每个固定整数 $M$，以趋于 $1$ 的概率，一切含 $s$ 个 top、$u$ 个扇、至多 $M$ 个互异出现且带全扇槽的集合满足
$R\le(p-7f)s+fu+\sum_e(h_e-\delta)$，
求和跑过其装饰，装饰长度 $2h_e\in\{4,6\}$。

证明的三段算式（03-diagrams.tex:68-95）。第一段，数模式：固定表类型、扇槽结合方式、字段位置按无号值的分划（$M$ 固定时只有有限多选择），设位置数 $J$；给秩 $R$ 的模式配字母至多 $C_MN^{J-R}$ 种：每类选一个底字母，再给位置配号，符号因子仅依赖 $M$。第二段，算概率：只数在各表内互异的出现选择，所需伯努利试验独立，其积的 $N$ 指数为
$(p-7f-1)s+\sum_b(f-k_b)+\sum_e(h_e-\delta-2h_e)$，
共享扇在第二和只出现一次。第三段，合并：由 $J=s+\sum_bk_b+\sum_e2h_e$，被选中模式的出现期望至多
$C_MN^{(p-7f)s+fu+\sum_e(h_e-\delta)-R}$。
若秩不等式失败该指数为负；固定规模界下可出现的指数只有有限多个，把期望求和即得断言。

我此刻对这条链的理解（[推测] 的读法）：指数里的 $-s$ 抵掉标记概率的 $-1$、$-2h_e$ 抵掉方块行的 $-2$，于是每个 top 净贡献 $p-7f$、每个被复用的扇净贡献 $f$、每个装饰净贡献 $h_e-\delta$，$R$ 从总额里扣掉真实约束数；$\beta>7\alpha$ 保证 $p-7f=3-\beta-14+7\alpha=-11-(\beta-7\alpha)<0$（末式 [计算]），这比旧账里"增量全正"的说法更贴近纸面。

## 18 面积界与平面分隔子的不等式全链

分块（fragment）引理（03-diagrams.tex:493-544）：设
$\kappa=\min\{\beta-7\alpha,\ \alpha/5,\ \delta\}>0$，
若秩不等式对至多 $8A$ 个出现的集合成立，则每个面积 $A$ 的分块满足
$A\le C_0B,\qquad C_0=\frac1\kappa$。
证明骨架：记 $W=\sum_bw_b$、$P^*=\sum_bP_b^*$；简单 top 多边形至少三个转角，把 apex 估计求和并用槽和恒等式得
$3T+2(W-7T)\le\frac{Q+P^*}{2}+2\sum_bJ_b$；
接触计数右端可重写为 $3T+2(W-7T)+\sum_eh_et_e-\Delta$，其中
$\Delta=(\beta-7\alpha)T+\alpha W+\delta E$；
表示化扇-apex 实例上选定三角形至多五个，故 $Q\le5\sum_br_b\le5W$，推出
$\Delta\ge\kappa(T+Q+E)=\kappa A$；
分块原始边拷贝总数 $R_{\rm raw}=Q+P^*+\sum_e2h_et_e$，两式合并得内点数
$I\le\frac{R_{\rm raw}}{2}-\Delta+2\sum_bJ_b$；
由 $B_{\rm raw}=R_{\rm raw}-2I$ 与部分链不等式收束为
$2\kappa A\le2\Delta\le B_{\rm raw}+4\sum_bJ_b\le B_{\rm raw}+2B_{\rm rad}\le2B$。
$\alpha/5$ 的 5 正来自"扇-apex 至多五个选定三角形"这一步（03-diagrams.tex:520-522），这是我复盘时才看清的出处。

分隔子引理（03-diagrams.tex:556-588）：每个 $D<\infty$、$\eta>0$，存在 $K=K(D,\eta)$，使任意最大度 $\le D$ 的有限平面图顶点可分成尺寸 $\le K$ 的块，块间 crossing 边数至多顶点总数的 $\eta$ 倍。证明链：去重边后对简单底图用平面分隔子定理，$q$ 顶点图有大小 $\le c\sqrt q$ 的分隔集，切除后两半各至多 $2q/3$，可取 $c=2\sqrt2$；对一切尺寸 $>K$ 的集合递归执行，切除的分隔顶点各自单例化。给尺寸 $q$ 的递归集合的每个顶点记入账 $c/\sqrt q$；固定原顶点所在集合尺寸序列在降到 $K$ 前每步至多乘 $2/3$，倒读其总入账至多
$\frac{c}{\sqrt K}\sum_{j\ge0}\bigl(\sqrt{2/3}\bigr)^j=\frac{c}{(1-\sqrt{2/3})\sqrt K}$；
原图 $A$ 顶点时被切除的分隔顶点总数 $\le CA/\sqrt K$，$C=c/(1-\sqrt{2/3})$；每条块间边以被切除顶点为端点，度界把重数计数压到 $DCA/\sqrt K$；取 $K$ 使 $DC/\sqrt K\le\eta$；不连通图逐分支处理。

定理拼装（03-diagrams.tex:590-662）：先固定参数使 $\kappa,C_0$ 为正，取 $\eta>0$ 满足 $2C_0\eta\le\frac12$，以 $D=15$ 代入分隔子引理得有限阈值 $K$；秩引理对至多 $8K$ 个出现以概率趋 1 成立，此后纯确定性。正规图的内面邻接对偶图最大度 $15$：扇三角形 3 边、装饰至多 6 边、简单 top 多边形至多 15 边；把 $A$ 个内面分成尺寸 $\le K$ 的分块，切断至多 $\eta A$ 个接触；各分块边界长之和至多 $B_0+2\eta A$（$B_0$ 为数与外面多边形接触的常数），对每个分块用分块引理并求和：
$A\le C_0(B_0+2\eta A),\qquad\text{故}\qquad A\le2C_0B_0$；
圆盘图的外词长 $\ell$ 给 $B_0\le\ell$，于是内面数 $\le2C_0\ell$。球图 $B_0=0$ 强制 $A=0$，故 $\widetilde P$ 上无非零胞腔二维圈，$H_2(\widetilde P;\mathbb Z)=0$；单连通二维 CW 若有首个非零同伦群会被 Hurewicz 映到非零同调，矛盾，于是弱可缩，Whitehead 给出可缩（03-diagrams.tex:620-632）。

展开回字母呈现（03-diagrams.tex:634-658）：每个扇模板定点并给每个顶点固定路径，路径长 $\le2$；扇三角形边界变成长 $\le5$ 的闭路，top 多边形边界变成其 $\Gamma$ 副本内展开长 $\le30$ 的闭路（例外点在 $X_D$ 路径后接松散边），装饰边界不变；长 $\le30$ 的闭路擦除自由回消后按重复顶点拆成至多 $30$ 个简单圈，每个展开面在有限循环呈现里至多 $30$ 个 relator 圆盘填充；替换正规图的全部面，外词不变，得允许自由折的圆盘图，面积
$\le60C_0\ell$
（$60=2\cdot30$，其中 $2$ 来自 $A\le2C_0B_0$ 的边界系数，此拆解 [计算]）。量词次序备注（03-diagrams.tex:664-671）：分隔阈值在参数固定之后、$n\to\infty$ 之前选定；参数 $\alpha,\beta,\delta\to0$ 的一致界既未声称也不需要。

## 19 成本表、预算函数与耦合归一化的不等式串

成本记号（04-sampling.tex:38-48）：对 $\theta=(\alpha,\beta,\delta)$，条目 $\rho$ 的纳入概率写成 $N^{-c_\rho(\theta)}$，临界成本 $c_\rho=c_\rho(0)$；三类条目逐行是：扇 $i$ 成本 $k_i-2+\alpha$、临界 $k_i-2$；top 标记成本 $12+\beta-7\alpha$、临界 $12$；四字母条目成本 $2+\delta$、临界 $2$。预算函数
$h_\theta(W)=\lvert W\rvert-\sum_{\rho:\,E_\rho\subseteq W}c_\rho(\theta),\qquad h(W)=h_0(W)$，
$N^{h_\theta(W)}$ 恰是"$W$ 上支撑的一切所需条目都在场"的赋值期望数（04-sampling.tex:49-55）。子模性：每个 $E_\rho$ 固定的示性函数 $1_{\{E_\rho\subseteq W\}}$ 超模且 $c_\rho\ge0$，故 $h$ 子模（04-sampling.tex:56-58）。主期望：
$h(\mathcal F)=212-(17+12+180)=3,\qquad\mathbb E\lvert\Omega_n\rvert=N^{h_\theta(\mathcal F)}=N^{3-\beta-90\delta}$，
等式精确的原因是每个赋值在每张不同表各取一行、全部纳入要求独立（04-sampling.tex:59-66）；其中 $17=\sum_i(k_i-2)$、$180=90\cdot2$（拆解 [计算]，与旧账 Σk_i 行一致）。

预算引理（04-sampling.tex:68-99）：每个 $W\subseteq\mathcal F$ 满足
$h(W)\ge\min\{2,\lvert W\rvert\}$，
且当允许集 $S\subseteq W$ 时 $h(W)\ge\lvert S\rvert$。证明先只看核部分：$a_i$ 为 $W$ 落在 $F_i$ 的字段数、$\ell\in\{0,1\}$ 为松散字段示性，扣除 top 标记前指数
$\sum_i\bigl(a_i-(k_i-2)\,1_{\{a_i=k_i\}}\bigr)+\ell\ \ge\ \sum_i\min\{a_i,2\}+\ell$；
标记只在核完整时扣，此时指数 $32-17-12=3$（04-sampling.tex:86-87）。再对方块的新字段：加一个则指数 $+1$，加两个则 $+2$，而成本 $2$ 仅在该行两个核字段也在场时才可扣，每对净贡献非负；$W$ 的核字段不足两个时无任何条目可扣，$h(W)=\lvert W\rvert$。

重叠余量（04-sampling.tex:448-466）：全部临界重叠余量至少 $1$；共享试验记到第一颗星，其每条目至多 $t$ 份拷贝；$\beta>7\alpha$ 令一切成本增量严格正，临界换实际最多抬升
$t\bigl[7\alpha+(\beta-7\alpha)+90\delta\bigr]=t(\beta+90\delta)$；
条件化只删试验、只缩界；单个主匹配对应 $t=1$。有限检验族取最大 $t_{\max}$（空族记 1），约束
$t_{\max}(\beta+90\delta)<\frac12$
使一切重叠余量至少 $1/2$；取法 $\beta=8\alpha$ 再令 $\alpha,\delta$ 足够小即可，且参数先固定、$N\to\infty$，方差不一致性于无界 $t$（04-sampling.tex:463-466）。

耦合引理（04-sampling.tex:368-433）：每个固定条件检验与足够小实际参数，以概率趋 1 存在 $t$ 个匹配 $(\sigma_1,\ldots,\sigma_t)$ 的联合律，满足（1）限制到 $I$ 逐点相同；（2）每支边缘与 $\mu_N$ 全变差距离 $o(1)$；（3）$(\sigma_1(e),\ldots,\sigma_t(e))$ 的律与 $S_n^t$ 均匀积律全变差距离 $o(1)$。归一化五连：记 $L_N=\lvert\Omega_n\rvert$、$\lambda_N=\mathbb EL_N$、指定支的期望条目数 $a_N$、偏差和 $D_N=\sum_{\sigma\in\Omega_n}\lvert A_\sigma-a_N\rvert$；条件方差界加 Cauchy-Schwarz 给逐 $\sigma$ 一致
$\mathbb E\bigl[\lvert A_\sigma-a_N\rvert\mid\sigma\in\Omega_n\bigr]=o(a_N)$，
乘在场概率求和得 $\mathbb ED_N=o(\lambda_Na_N)$，Markov 转为概率意义 $D_N=o(\lambda_Na_N)$；由 $\mathbb E\lvert\Omega_n\rvert/\lvert\Omega_n\rvert\to1$ 的单点集中、$Z_N=\sum_{\sigma}A_\sigma$ 与 $\lvert Z_N-L_Na_N\rvert\le D_N$ 得 $Z_N/(L_Na_N)\to1$ 从而 $Z_N>0$；逐支权重偏差
$\sum_{\sigma\in\Omega_n}\left\lvert\frac{A_\sigma}{Z_N}-\frac1{L_N}\right\rvert\le\frac{D_N}{Z_N}+\left\lvert\frac{L_Na_N}{Z_N}-1\right\rvert\to0$。
叶侧：$\mathcal B_N$ 为长 $t$ 的互异有序字母表，$\lvert\mathcal B_N\rvert=(N)_t$，$\mathbb E\sum_{b\in\mathcal B_N}\lvert B_b-b_N\rvert=o((N)_tb_N)$，同一归一化把 $(N)_t,b_N$ 代入即得边缘分布趋均匀；iid 均匀表列重复概率至多 $\binom t2/N$，互异条件下的律恰为 $\mathcal B_N$ 上均匀。

六字母计数（04-sampling.tex:468-490）：$\mathcal D_N\subseteq S_n^6$ 为独立六字母表，位置对 $1\le r<q\le6$ 与字母 $u,v$ 计
$Q_{rq}(u,v)=\#\{(s_1,\ldots,s_6)\in\mathcal D_N:\ s_r=u,\ s_q=v\}$，
它是 $N^4$ 个参数 $N^{-3-\delta}$ 的独立伯努利之和，均值 $N^{1-\delta}$；固定 $0<\delta<1$ 取 $\varepsilon_N=N^{-(1-\delta)/4}$，二项 Chernoff 给
$\mathbb P\bigl(\lvert Q_{rq}(u,v)-N^{1-\delta}\rvert>\varepsilon_NN^{1-\delta}\bigr)\le2\exp\bigl(-\varepsilon_N^2N^{1-\delta}/3\bigr)$；
对 $15N^2$ 个位置对与字母对求并，得
$\max_{r<q}\max_{u,v\in S_n}\left\lvert\frac{Q_{rq}(u,v)}{N^{1-\delta}}-1\right\rvert=o(1)$。
我手算的指数账 [计算]：尾概率是 $2e^{-N^{(1-\delta)/2}/3}$，压过任意 $N^{-2}$ 幂，$\delta<1$ 的全部用途就在这一比较。命题打包（04-sampling.tex:493-522）：任取有限条件检验族 $\mathcal T$，临界参数邻域内每个足够小的正 $(\alpha,\beta,\delta)$（$\beta>7\alpha$）使四事以概率趋 1 同时成立：$\Omega_n$ 非空、$\lvert\Omega_n\rvert=(1+o(1))N^{3-\beta-90\delta}$、均匀律 $\mu_N$ 的单字段边缘与 $S_n$ 均匀全变差 $o(1)$、$\mathcal T$ 中每检验有上述耦合；六字母计数满足并界式；附加约束 $\beta+90\delta<3$ 与 $\delta<1$ 在证明末尾点名（04-sampling.tex:517）。

## 20 从能量最小元到条件检验：两重极限的交换

顺序声明（05-energy.tex:3-8）：采样命题只谈有穷表，本节把它们用在选择作用之后得到的函数上；次序是先靠六字母表的逐点计数拿到每个生成元的位移一致界，再允许全变差估计进入。这句话原文只有 "The order is important" 一个命令句，我把依赖方向写成不等式链。

位移界（05-energy.tex:125-164）：设六字母表在位置 $1$ 与 $k$ 的计数逐点相对误差 $\varepsilon<1$（$2\le k\le6$），则一切归一化作用满足逐窗夹逼
$(1-\varepsilon)N^{1-\delta}\le Q_{1k}(a,b)\le(1+\varepsilon)N^{1-\delta}$；
对 $b$ 求和得出：以 $a$ 开头的行非空，且其第 $k$ 位条件律逐点上界 $\frac{1+\varepsilon}{1-\varepsilon}\cdot\frac1N$；行 $(a,s_2,\ldots,s_6)$ 的关系是 $a^{-1}=s_2\cdots s_6$，由 $d(x,a^{-1}x)=d(x,ax)$、三角不等式与 Cauchy-Schwarz 得
$\lVert v_a\rVert^2\le5\sum_{k=2}^6\lVert v_{s_k}\rVert^2$；
对以 $a$ 开头的行取平均、套条件上界与归一化 $\frac1N\sum_{s}\lVert v_s\rVert^2=1$，五个条件均值各至多 $\frac{1+\varepsilon}{1-\varepsilon}$，于是
$\max_{s\in S_n}\lVert v_s\rVert^2\le25\,\frac{1+\varepsilon}{1-\varepsilon}$，
此界与具体作用无关；推导只用非负权重，所以权重在表揭晓后由作用选出也成立。$25=5\times5$ 的拆解（5 个 relator 字母乘 Cauchy-Schwarz 常数 5）与我旧账口径一致。

锥上均值三件套（05-energy.tex:166-226）。径向恒等式：完备 $\operatorname{CAT}(0)$ 欧氏锥内
$\lVert[u,v]_t\rVert^2=(1-t)\lVert u\rVert^2+t\lVert v\rVert^2-t(1-t)\,d(u,v)^2$，
端点含锥顶时直接验证；否则两射线角 $<\pi$ 时线段是扇内欧氏段，角 $\ge\pi$ 时线段过锥顶且 $\lVert[u,v]_t\rVert=\bigl\lvert(1-t)\lVert u\rVert-t\lVert v\rVert\bigr\rvert$ 给出同一恒等式。标量积凹性：固定 $h$，$u\mapsto\langle h,u\rangle$ 沿每条测地线凹，由 $d(h,\cdot)^2$ 的强凸性与恒等式 $2\langle h,u\rangle=\lVert h\rVert^2+\lVert u\rVert^2-d(h,u)^2$ 作差得到。归纳均值：概率分布 $V$ 质心为 $0$、$\mathbb E\lVert V\rVert^2=1$，独立样本 $V_1,\ldots,V_t$ 配 $m_1=V_1$、$m_j=[m_{j-1},V_j]_{1/j}$，则
$\mathbb E\lVert m_t\rVert^2\le\frac1t$；
任意确定列表另有均值凹性 $\frac1t\sum_{j=1}^t\langle h,V_j\rangle\le\langle h,m_t\rangle$。递推核算：质心方差不等式给 $\mathbb E[d(u,V_j)^2\mid u]\ge\lVert u\rVert^2+1$，强凸性令 $a_j=\mathbb E\lVert m_j\rVert^2$ 满足
$a_j\le\bigl(1-\frac1j\bigr)^2a_{j-1}+\frac1{j^2}$，
$a_1=1$ 起归纳得 $a_j\le\frac1j$（末步 $a_j\le(1-\frac1j)a_{j-1}\le\frac{j-1}{j}\cdot\frac1{j-1}=\frac1j$ 的验算 [计算]）。

一致条件检验（05-energy.tex:228-295）：取表实例序列 $\nu$ 使对每个固定检验、每个固定 $t$ 的采样误差趋零，设其群有几何作用、基点取归一化最小元，$\Omega_\nu$ 非空、$\mu_\nu$ 均匀；位移界给绝对常数 $M$ 使 $\lVert v_s\rVert\le M$ 对全部大实例的全体字母成立。设 $I$ 与 $\{e\}$ 不相交、并为允许集，$h_I$ 是 $I$ 上标签到 $T_{x_\nu}X_\nu$ 的函数、$\lVert h_I\rVert\le B$ 逐 $\nu$ 逐匹配一致；固定 $\sigma(s)=s$ 或 $\sigma(s)=s^{-1}$，结论是
$\limsup_{\nu\to\infty}\mathbb E_{\mu_\nu}\langle h_I,v_{\sigma(e)}\rangle\le0$。
证明：耦合给 $t$ 支在 $I$ 相同、支边缘距 $\mu_\nu$ 至多 $\eta_{\nu,t}$、叶联合距均匀积至多 $\eta_{\nu,t}$，$\eta_{\nu,t}\to0$；对每支同一的 $h_I$ 用均值凹性得逐 tuple
$\frac1t\sum_{j=1}^t\langle h_I,v_{\sigma(e_j)}\rangle\le\langle h_I,m_t\rangle\le B\lVert m_t\rVert$；
独立叶下由质心与归一化适用 $\mathbb E\lVert m_t\rVert^2\le\frac1t$；耦合下半径 $M$ 球凸给 $\lVert m_t\rVert\le M$，全变差比较令二阶矩期望至多漂移 $2M^2\eta_{\nu,t}$、每个标量积期望至多漂移 $2BM\eta_{\nu,t}$，合并
$\mathbb E_{\mu_\nu}\langle h_I,v_{\sigma(e)}\rangle\le B\sqrt{1/t+2M^2\eta_{\nu,t}}+2BM\eta_{\nu,t}$；
先固定 $t$ 取 $\nu$ 的上极限、再 $t\to\infty$，全部误差只含 $B,M$，结论对作用相关函数一致。两重极限的次序即逻辑结构：$\eta_{\nu,t}\to0$ 对固定 $t$ 成立、速度无妨，$t\to\infty$ 压在 $\nu$ 之后才能把 $\frac1t$ 挤成零。

## 21 锥内 $\oplus$ 恒等式与半圆矛盾逐条落定

舞台：$T$ 取公共六边形中心 $c$ 处的完备切锥，构型来自 Proposition prop:configuration（05-energy.tex:554），§6 要证它在完备 $\operatorname{CAT}(0)$ 空间中不可能存在（06-obstruction.tex:4-9）。每条线 $H$ 给一向量 $h_H$，模全为 $r$（06-obstruction.tex:100）；两条不同线 $H,H'$ 必同在一个核心六边形上：取交点 $i$、在 $H$ 上取 $j\ne i$、在 $H'$ 上取 $k\ne i$、三点不共线全用 $X$ 代表即可（06-obstruction.tex:102-106），中心三角形平坦（依构型命题）且 $d(H,H')=\sqrt2$，余弦式落地为
$\langle h_H,h_{H'}\rangle=-\frac14\quad(H\ne H'\ \text{两线})$（06-obstruction.tex:108-112）。过倍点 $i\in\{A,B,C,D\}$ 的线若同时邻接 $X_i,Y_i$ 称在 $i$ 满：$A,B,C$ 的过线全满，$D$ 处满线为 $AD,BD$（06-obstruction.tex:114-116）。

扇恒等式（06-obstruction.tex:118-169）。结论：每 $i\in\{A,B,C,D\}$ 有单位向量 $M_i$ 使
$M_i=x_i\oplus y_i=h_H\oplus h_{H'}$（$H,H'$ 取遍 $i$ 处任意两不同满线），
每个和都在非退化欧氏扇内计算，并且 $\langle x_i,y_i\rangle=-\frac14$、$\langle M_i,h_H\rangle=\langle M_i,h_{H'}\rangle=\frac12$。证明链四步：四边形 $X_i,H,Y_i,H'$ 边长全 $1$、对角线全 $\sqrt2$，由方形刚性引理是平正方形，中心 $J_i$ 同为 $X_iY_i$ 与 $HH'$ 的中点；平三角形 $c,H,H'$ 的中线给
$d(c,J_i)^2=r^2-\frac14d(H,H')^2=\frac14$，
从而 $r^2=\frac34$、$r=\frac{\sqrt3}{2}$（此反推 [计算]，与旧账 $r$ 行口径一致）；$c,X_i,Y_i$ 的平方距离凸性右端
$\frac12d(c,X_i)^2+\frac12d(c,Y_i)^2-\frac14d(X_i,Y_i)^2=\frac14$
与上值相等，故凸性取等、$c,X_i,Y_i$ 平坦，在锥中取中点得
$x_i\oplus y_i=2\log_cJ_i=h_H\oplus h_{H'}$；
余弦律给 $\langle x_i,y_i\rangle=-\frac14$；$h_H,h_{H'}$ 的角距为 $\arccos\bigl(-\frac13\bigr)<\pi$，在该欧氏扇内
$\langle h_H\oplus h_{H'},\,h_H\rangle=\lVert h_H\rVert^2+\langle h_{H'},h_{H'}\rangle=\frac34-\frac14=\frac12$。

非负下界（06-obstruction.tex:171-187）：$M_A=h_{AB}\oplus h_{AC}$、$M_B=h_{AB}\oplus h_{BC}$，对两因子套用超可加 $\langle w,u\oplus v\rangle\ge\langle w,u\rangle+\langle w,v\rangle$（06-obstruction.tex:35-38），三线 $AB,AC,BC$ 互异，逐项代入得
$\langle M_A,M_B\rangle\ge\lVert h_{AB}\rVert^2+\langle h_{AB},h_{BC}\rangle+\langle h_{AC},h_{AB}\rangle+\langle h_{AC},h_{BC}\rangle=\frac34-\frac14-\frac14-\frac14=0$
（末式的四项数值展开 [计算]，论文只写 $=0$）。后续要把 $M_A,M_B$ 压成对径、内积 $-1$，矛盾即闭。

例外入射（06-obstruction.tex:197-293）：记 $H_0=CD$、$h_0=h_{CD}$、$p=X_C$、$q=Y_C$、$z=X_D$，$J$ 为 $p,q$ 中点；缺边 $Y_D$--$H_0$ 提供不对称。三分点 $B_0$ 的凸性估算
$d(c,B_0)^2\le\frac23d(c,J)^2+\frac13d(c,z)^2-\frac29d(J,z)^2=\frac23\cdot\frac14+\frac13\cdot\frac34-\frac29\cdot\frac32=\frac1{12}$；
三角不等式被两端精确夹住：
$\frac{\sqrt3}{2}=d(H_0,c)\le d(H_0,B_0)+d(B_0,c)\le\frac1{\sqrt3}+\frac1{2\sqrt3}=\frac{\sqrt3}{2}$，
故全程取等：$B_0$ 落在 $[H_0,c]$ 上按序排列，$c,J,z$ 的平性来自内比较取等。记 $j=\log_cJ$，含 $j,x_D$ 的欧氏扇内指向 $B_0$ 的向量是 $\frac23j+\frac13x_D$，共线加 $d(c,H_0)=3d(c,B_0)$ 给出三重等式
$h_0=3\log_cB_0=2j+x_D=M_C\oplus x_D$；
扇内范数恒等式
$\frac34=\lVert h_0\rVert^2=1+\frac34+2\langle M_C,x_D\rangle$
压出 $\langle M_C,x_D\rangle=-\frac12$，再与两加数分别配对得例外乘积三件套。

半圆与对径（06-obstruction.tex:295-355）。结论 $d_T(M_C,M_D)=2$、$\langle M_C,M_D\rangle=-1$。证明：取 $D$ 处任一满线 $H$，路 $Y_D,H,X_D,H_0$ 用 $F_D$ 两字段加松散字段，恰为允许三步路，故
$d(Y_D,H_0)\ge\sqrt3=d(Y_D,c)+d(c,H_0)$，
反向不等式平凡、取等使 $Y_D$ 到 $H_0$ 的线段穿过 $c$，$y_D,h_0$ 方向对径。令 $\Sigma$ 为 $Z$ 在 $c$ 的完备方向空间、戴帽记方向，定义
$a=\arccos\frac1{\sqrt3},\qquad b=\arccos\frac13$，
两角均在 $\bigl(0,\frac\pi2\bigr)$ 内且 $2a+b=\pi$（可代值验算 [计算]）。例外乘积给 $d_\Sigma(\widehat{M_C},\widehat{h_0})=a$、$d_\Sigma(\widehat{h_0},\widehat{x_D})=b$，两弧在例外引理的欧氏扇内首尾相接成该扇的方向弧；扇恒等式给
$d_\Sigma(\widehat{x_D},\widehat{y_D})=\arccos\bigl(-\tfrac13\bigr)=\pi-b$，
而 $M_D=x_D\oplus y_D$ 的两加数等长，其方向平分此弧，$d_\Sigma(\widehat{x_D},\widehat{M_D})=a$。拼接 $\widehat{h_0},\widehat{x_D},\widehat{y_D}$ 弧长 $b+(\pi-b)=\pi$、端点对径，故为最短弧，且在 $\widehat{x_D}$ 处测地延续；于是
$\widehat{M_C},\ \widehat{h_0},\ \widehat{x_D},\ \widehat{M_D}$
是 $\Sigma$ 内的局部测地：$\widehat{h_0}$ 处的延拓落在第一扇内，$\widehat{x_D}$ 处的延拓落在刚构造的最短半圆内，总长 $a+b+a=\pi$。$\Sigma$ 是 $\operatorname{CAT}(1)$，BH II.1.4(2) 把局部测地升为全局最短（恰长 $\pi$ 的端点情形由距离连续性对每个严格初段子弧取极限补足，06-obstruction.tex:348-353）；端点 $M_C,M_D$ 对径，模为一给锥距 $2$ 与内积 $-1$。剩下的乘积分解 $\mathbb R\times Q$、$h_{AC},h_{BC},h_{AD},h_{BD}$ 第二坐标铺平正方形、对边中点把对径从 $M_C,M_D$ 传到 $M_A,M_B$（06-obstruction.tex:188-195 与 357-477），与 $\langle M_A,M_B\rangle\ge0$ 正面相撞，构型不存在。

## 22 对角序列的两组不等式与填充转移界

对角构造（07-completion.tex:14-26）：第 $j$ 步请求主图案内全部允许检验 $I,\{e\}$ 且 $1\le t\le j$，这是一张有限清单；取 $\varepsilon_j>0$ 小到同时适配 Proposition prop:sampling 与 Theorem thm:diagram，并要求 $\varepsilon_j<\frac1{400j}$，令
$\alpha_j=\delta_j=\varepsilon_j,\qquad\beta_j=8\varepsilon_j$。
三笔验算：$\beta_j>7\alpha_j$ 即 $8\varepsilon_j>7\varepsilon_j$；主计数指数 $3-\beta_j-90\delta_j=3-98\varepsilon_j>0$ 因 $\varepsilon_j<\frac1{400j}\le\frac1{400}$（合并 [计算]）；重叠条款 $j(\beta_j+90\delta_j)=98j\varepsilon_j<\frac{98}{400}<\frac12$，恰是 04-sampling.tex:460 的 $t_{\max}=j$ 版本。参数与分块阈值固定后，巧合不等式与采样事件各自概率趋 1；取 $n_j>n_{j-1}$ 使全交事件概率为正且一切请求误差 $\le\frac1j$，在其中选一个实现。$G_j$ 无穷（07-completion.tex:28-32）：商 $G_j\twoheadrightarrow C_2$ 保证非平凡；若 $G_j$ 有限则 $\widetilde P_j$ 有穷可缩，
$1=\chi(\widetilde P_j)=\lvert G_j\rvert\chi(P_j)$
迫使 $\lvert G_j\rvert=1$，矛盾。无作用归约（07-completion.tex:38-41）：反设无穷多 $G_j$ 有几何作用，取到该子列并对每个作用选基点归一化；无穷性使最小能量严格为正，位移界与条件检验引理对这些作用一致成立，Proposition prop:configuration 造出极限构型，§21 的刚体链排除之，故至多有限个 $G_j$ 能作用，无作用的实例存在。

转移界（07-completion.tex:47-57）：设 $P$ 有穷连通、$\widetilde P$ 可缩，$\pi_1P$ 的有穷呈现有线性盘填充不等式。取互逆群认同的代入系统 $\phi,\psi$；$L$ 界住各 $\phi(b)$ 的词长，$M$ 界住有穷多个代入旧 relator $\psi(r)$ 在新呈现里的填充面积，$D$ 界住 $b\psi(\phi(b))^{-1}$ 的填充面积；三张清单有穷且都是零词，界存在。新零词长 $\ell$ 代入成长至多 $L\ell$ 的旧词，旧常数 $C_{\rm old}$ 填充再换 relator 胞元花至多 $MC_{\rm old}L\ell$ 个新胞元，边界代入再花 $D\ell$，新填充常数
$\le MC_{\rm old}L+D$。
最大树呈现：生成元对应非树边、relator 对应三角面；$\widetilde K$ 中长 $\ell$ 的零伦闭路插固定树路后成 $\le\ell$ 的零词，线性填充、逐面换三角面、树路对消带线性开销，图至多 $C\ell$ 个三角面；投影回 $K$ 的提升使同一界在万铺盖里成立。收尾（07-completion.tex:60-66）：取无作用实例 $P_j$，其字母呈现有线性盘界，转移引理产出同维二维 $K$；线性 Dehn 函数与词双曲等价（BH III.H 引文，07-completion.tex:61）给出 $\pi_1K$ 双曲；若同伦 $L$ 有相容局部 $\operatorname{CAT}(0)$ 测地长度度量，则 $\widetilde L$ 完备、Cartan-Hadamard 全局 $\operatorname{CAT}(0)$、Hopf-Rinow proper，deck 作用几何，与 $\pi_1L\cong G_j$ 无作用矛盾；$\operatorname{CAT}(-1)$ 情形经 $\operatorname{CAT}(-1)\Rightarrow\operatorname{CAT}(0)$ 一并排除。我在 §15 里写过的那句限定在这里闭环： curvature 假设只出现在假想作用空间内，随机复形 $P_j$ 全程不受任何曲率要求（07-completion.tex:68-70），对角序列也不共享填充常数，进入定理的只有被选那一个有穷复形的 $C$。
