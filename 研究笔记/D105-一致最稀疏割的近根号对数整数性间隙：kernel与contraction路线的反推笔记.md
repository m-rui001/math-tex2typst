# D105 一致最稀疏割的近根号对数整数性间隙：kernel 与 contraction 路线的反推笔记

队列行号 90。目录：E:\math\preprints\Near-square-root-logarithmic-integrality-gaps-for-uniform-sparsest-cut-September-24-2026\build\source。本笔记的正文素材全部来自 build\source\ 下的 tex 分片；Lean 侧证据限定在 formalization.yaml 第 1626--1628 行、书目 459 行附近、lean/OAI/Combinatorics/SparsestCut/ 模块目录本身与 ComparatorChallenges/UniformSparsestCut.json。上网检索得到的背景一律标注 [外部推断]。

## 1. 初始动机与起点：为什么盯上一致需求

我先承认起点很功利：Arora--Rao--Vazirani 给一致需求最稀疏割的半定规划做了 O(sqrt(log n)) 近似（main.tex:177-179），这个上界挂在那里十几年，配套的 Goemans--Linial 间隙下界却一直在 log log n 量级打转（main.tex:181-182 引 Devanur--Khot--Saket--Vishnoi 的 Omega(log log n)，main.tex:184-185 引 Kane--Meka 的 exp(Omega(sqrt(log log n)))）。一般需求那一侧，Khot--Vishnoi 已经推翻了常数间隙猜想（main.tex:194-195），Naor--Young 甚至拿到了紧的 Omega(sqrt(log n))（main.tex:197-198），Chang--Naor--Ren 补上匹配上界（main.tex:198-199）。于是问题自然成形：一致需求情形的根号 log n 上界到底是不是真的紧？也就是问间隙下界能不能也推到 sqrt(log n) 量级，只损失 log log n 的某个幂。

我最初的猜想比这弱。我以为能证的形式是：存在常数 delta>0 使一致需求间隙达到 (log n)^(1/2+delta) 不可能、而 (log n)^(1/2-delta) 可以用某种"简化版" Khot--Vishnoi 构造拿到。前半句就是 ARV 上界，后半句才是我要干的活。我以为难点只在把 Khot--Vishnoi 的四元数群例子"平均化"，让每条需求都相等。这个预期后来被证明在两个方向上都是错的：一，平均化根本不改变问题的本质难度，难度恰恰就出在"平均"二字上；二，最终拿到的指数恰好是 1/2 整，损失全部塞进 log log n 的三次幂（main.tex:110-113），这比我预想的 (log n)^(1/2-delta) 形式更贴近 ARV 基准，也更难解释。

为什么"一致需求"会让难度突变，main.tex:119-125 的开篇其实已经把逻辑摆清楚了：最稀疏割要找一个划分，使穿越容量相对被分开的需求尽量小；当每对顶点需求都是 1 时，分母只依赖两部分的尺寸（|B|(n-|B|)，main.tex:127-133 的式 (1)），于是一致间隙下界"需要一个阻碍，使所有点对上的平均距离无法被保持"。对比之下，GL 松弛（main.tex:141-146 的式 (2)）在一般需求下只需要控制"某些"点对（割对偶里每个割只按它穿越的边收费），而一致需求把权重均匀铺在全部点对上，最坏点对的信息被平均稀释掉了。这正是 Khot--Vishnoi 型构造失效的地方：它们的反例有恒定的膨胀、大的对径距离，坏在个别点对上；把这些坏点对平均摊到所有 O(n^2) 对上，平均距离立刻被大量"近邻"点对拉回正常值。所以我的第一反应，也是第一个真正的技术问题，是：能不能造一个负型半度量，它的**平均**距离就很大，同时**每一个**到 l1 的非扩张映射的平均距离都很小。后一个量化的"每个"是全部难点的来源。

## 2. 题名、摘要与主定理：逐字抄录

题名（main.tex:101-103）：

```
\title{Near-square-root logarithmic integrality gaps\\for uniform sparsest cut}
\author{OpenAI}
\date{September 24, 2026}
```

摘要（main.tex:107-114）逐字：

```
We construct uniform sparsest-cut instances whose Goemans--Linial
semidefinite integrality gap is at least
$c\sqrt{\log n}/(\log\log n)^3$ along a sequence $n\to\infty$.
The demand is one between every pair of distinct vertices, and the
capacities are nonnegative real numbers. This matches the
Arora--Rao--Vazirani upper bound up to a power of $\log\log n$.
```

"近根号对数"这个量的精确形式就是 sqrt(log n)/(log log n)^3，分子根号下是 log n 的一次半幂，分母是迭代对数的三次幂，两者都到 n 无穷沿一列子序列成立。注意摘要里没有说 n 取遍全体整数，只说 a sequence n to infinity，这在后面 reduction 复刻计数里是有余地的（我读到那儿再说）。

主定理 Theorem（main.tex:152-161，标签 thm:main）逐字：

```
There are an absolute constant $c>0$ and capacity instances $C^{(j)}$
on $n_j\to\infty$ vertices, with $\GL(C^{(j)})>0$, such that
\[
\frac{\OPT(C^{(j)})}{\GL(C^{(j)})}
\ge c\,\frac{\sqrt{\log n_j}}{(\log\log n_j)^3}
\]
for all sufficiently large $j$. The demand is one between every pair
of distinct vertices.
```

配套定义逐字（main.tex:127-133 与 137-150）：容量 C=(c_ij) 是 [n] 中不同无序点对上的对称非负数；一致最稀疏割最优值

```
\OPT(C)=\min_{\varnothing\ne B\subsetneq[n]}
\frac{\sum_{i\in B,\,j\notin B}c_{ij}}{|B|(n-|B|)}.        (eq:opt)
```

负型半度量定义为 d(i,j)=|x_i-x_j|^2（实 Hilbert 空间中的向量），满足全部三角不等式，允许不同点距离为零；Goemans--Linial 松弛

```
\GL(C)=\min\left\{
\sum_{i<j}c_{ij}d(i,j):\
\sum_{i<j}d(i,j)=1,\quad d\text{ is a negative-type semimetric}
\right\}.                                                  (eq:gl)
```

main.tex:147-150 说明：任何有限 Hilbert 构型可落进 R^n，所以这就是带三角不等式的通常平方欧氏 SDP；向量没有单位范数约束；割距离归一化后可行，因此 GL(C)<=OPT(C) 恒成立。约定段（main.tex:318-325）：所有对数是自然对数，c、C 是绝对常数且可逐处变化，m 取充分大整数，欧氏与 Hilbert 范数记 |·|、算子范数记 ||·||_op，A lesssim B 指 A<=CB，所有进 l1 的映射目标维数有限且任意，所有估计与该维数无关。

## 3. 主定理四段式拆解

### (a) tex 逐字引用与位置

陈述在 main.tex:152-161。策略总览在 main.tex:207-302：四个段落分别对应 directions/common parameter space（main.tex:219-236）、kernel 大全局距离小界面代价（main.tex:238-262）、contraction 同时约束（main.tex:264-284）、uniform copies 与 capacities（main.tex:286-302）。最后的间隙换算在 main.tex:296-302：

```
 \mathrm{gap}\gtrsim\frac{m}{\sqrt m(\log m)^{5/2}},
 \qquad \log n\asymp m\log m,
```

并说这给出 thm:main 里 log log n 的幂 3。

### (b) 推导补全：从 sqrt(m)/(log m)^(5/2) 到 sqrt(log n)/(log log n)^3

这步是论文只给结果、不给算术的地方，我把它补出来。设间隙 G(m) lesssim m/(sqrt(m) (log m)^(5/2)) = sqrt(m)/(log m)^(5/2)（这是 kernel/contraction 两片的净产出之比：全局平均距离 at least c m 对 contraction 平均 at most C sqrt(m)(log m)^(5/2)，见 main.tex:261-262 与 main.tex:276-279）。顶点数按 main.tex:235-236 是 |V| lesssim exp(C m log m)，复刻与 reduction 后 n 与 |V| 同对数阶（log n asymp m log m，main.tex:300），这里 asymp 表示双侧。于是

m log m asymp log n。两边取对数：log m + log log m + O(1) = log log n，故 log m = log log n - log log log n + O(1) lesssim log log n，且 m asymp log n/log m greater than or approx (log n)/(log log n)。代回：

sqrt(m) = (log n)^{1/2} (log m)^{-1/2} = sqrt(log n)/sqrt(log m)，
G lesssim sqrt(log n) / ( sqrt(log m) (log m)^{5/2} ) = sqrt(log n)/(log m)^3。

再用 log m lesssim log log n 得 G greater than or approx sqrt(log n)/(log log n)^3。幂 3 = 1/2 + 5/2 的分解完全来自 contraction 片的那个 (log m)^{5/2}（main.tex:271-279 的推导里 5/2 = 2 + 1/2：系数预算贡献 (log m)^2、好图表投影因子贡献 (log m)^{1/2}，两者相乘，见 main.tex:270-276）。而 (log m)^{-1/2} 那个因子是 m to n 换算本身免费送的。所以"3 次幂"这个数字在链条上没有任何自由余地：kernel 片出 sqrt(m) 与 1，contraction 片出 sqrt(m)(log m)^{5/2}，两边一除、换元一次，3 就固定了。这解释了我一开始为什么猜不出损失的形式：损失不在主项指数上，而全部在换元时 log m 相对 log log n 的那一层。

### (c) 机械理由：哪片承担哪一侧

GL 侧（分母上界）由 contraction 片承担：Proposition（contraction.tex:7-24）说对 prop:metric 造出的 (V,d) 与图表映射 v_s，任何满足 ||F(v)-F(w)||_1 <= d(v,w) 的 F:V to l1^D 都有 E_{theta,eta in T} ||F(v_1(theta))-F(v_1(eta))||_1 <= C sqrt(m)(log m)^{5/2}。也就是说**每一个** l1 非扩张映射在第一图表参数测度下的平均像距离都被压到 O(sqrt(m)(log m)^{5/2})，与目标维数 D 无关。OPT 侧（分子下界）由 kernel+repair+metric 三片承担：main.tex:261-262 说独立均匀参数 theta,eta in T=(-1,1)^m 的第一图表距离期望 at least c m。这个"cm"从哪长出来：kernel.tex 的 Lemma lem:kernel（kernel.tex:58-88）把希尔伯特特征的平方距离逼近为 c_* sqrt(m) |theta-eta|，而 T 内两点欧氏距离期望是常数阶 sqrt(m) 量级（theta,eta 在 (-1,1)^m 均匀独立，|theta-eta|^2 期望 2m/3 阶，故 |theta-eta| 期望 sqrt(m) 阶），乘上前面 sqrt(m) 得 m 阶。根号与线性两个因子各从一个计数环节长出来：sqrt(m) 来自特征映射把 m 维高斯特征按尺度积分时的幅度 m^{1/4}（kernel.tex:42 的 m^{1/4}E(...) 与 eq:kernel 前的 prefactor sqrt(m)，kernel.tex:49），第二个 sqrt(m) 来自参数立方体内点对距离的量纲。uniform 这个限定词约束的是最终容量实例的需求族：每一对不同顶点之间需求恰为 1（main.tex:111-112、134、159-160），容量允许任意非负实数、不假设正则性或度加权顶点测度（main.tex:134-135）。GL(C^{(j)})>0 这个附加条件是主定理陈述里的显式要求（main.tex:153-154），防止间隙是 0/0 式的空洞，reduction 片要负责产出它。

### (d) 候选失败路线 [推测]

[推测] 路线一（我最初押的）：直接拿 Khot--Vishnoi 四元数群商图例子，用 Cayley 图的边传递性论证"平均化免费"。失败点：KV 构造的 l1 不可嵌入性证据是最坏点对失真，CKN 已经在 main.tex:201-204 逐字点名他们的有界倍增例子的平均失真只有常数（"bounded-doubling examples have constant average distortion into a line, so their construction cannot yield a diverging uniform gap"，引 CKN09 Remark 1.1）。边传递性只保证每个点对的**存在性**论证可以平移，不控制所有点对的和。这条路线在第一步"证明平均距离大"就会断。

[推测] 路线二：走 l1 嵌入的下界谱方法，即用 Rabinovich 的平均失真框架但只造一个"典型点集"（比如图中所有点对里的大比例子集）来支撑失真。失败点：GL 的对偶容量可以对一切点对收费，任何只在子集上失真大的半度量都会被割锥对偶挑出便宜的割。论文 main.tex:286-294 的复刻技巧（保留 V 中**每个**顶点至少一份拷贝、拷贝间零距离）正是在防这个漏洞，说明朴素子集论证确实会漏。

[推测] 路线三：用 Novlin--Razin 型 [外部推断] 或 Kane--Meka 的伪随机多项式 Lipschitz 函数路线直接加一个负幂。失败点：KM13 给的 exp(Omega(sqrt(log log n))) 是 log n 的次多项式量级，要在其上再开平方根号 log n 需要全新的几何输入；他们的工具控制的是加强松弛的界，与基本 GL SDP 的 sqrt(log n) 目标之间隔着一整层"从伪随机到度量几何"的转换，而转换后平均化会再次吞掉最坏情形信息。

## 4. 第一条错误路线的正式墓志铭：为什么最坏点对论证在平均化下归零

我在 2026 年 8 月左右把 KV15 与 CKN 的论证并排重写了三遍。KV15 的骨架（[外部推断]，基于公开文献的记忆：四元数群上的双线性型给出常数膨胀但 l1 失真 log n 阶）依赖找一个测度，使大多数点对在商映射下坍缩，再用一个"远距离对径"事件；CKN 用 Heisenberg 群的科氏几何拿到 sqrt(log n) 失真，关键也是把失真事件集中在少数横跨不同尺度壳层的点对上。两篇文章的失真都按需求测度加权收费。一致需求固定测度为均匀对测度，坏事件占比 rho 时，平均距离的下界只能拿到 rho 乘对径距离；而 rho 一旦小到 o(1)，GL 侧的可行解（把商映射到线上的距离直接当半度量）就会把间隙拉回常数。这就是 main.tex:163-205 那节 "History and the uniform-demand obstacle" 用一句话点破的事：一致需求的相关量是"非扩张映射保持的平均距离"（main.tex:168-171），Linial--London--Rabinovich 的 l1 割分解（main.tex:165-168）与 Rabinovich 的平均失真框架（main.tex:169-171，Rab03、Rab08）把问题改写成：找一个负型半度量，它自身的平均距离大，且**每个** l1 contraction 的平均像距离小。"每个"和"平均"这两个词同时成立时，反例必须把失真压力铺满整个参数空间，并非制造坏事件。我的转折点就在这里：不再造"坏点对"，改为造"坏空间"，让任何非扩张映射在整个立方体上不得不压缩。这个转向决定了后面所有参数选择。

## 5. directions.tex：方向族引理（lem:directions）四段式

### (a) 逐字引用与位置

Section "Families of directions"（directions.tex:1-47，标签 dir:section）。引理原文（directions.tex:12-40）：

```
There is an absolute constant $C$ such that, for every sufficiently large
integer $m$, the following holds.  Set $N=m^6$ and $S=m^3$.  There are vectors
$g_{s,i}\in\R^m$ ... with these properties:
(1) dir:norms:  \frac{\sqrt m}{2}\le |g_{s,i}|\le 2\sqrt m; 每个族内方向两两不平行；
    N^{-1}\sum_i g_{s,i}g_{s,i}^T 的每个特征值属于 [1/2,2].
(2) dir:gaussian-approximation:  \sup_{|w|\le m^{42}}
    |(1/N)\sum_i g_{s,i}\sin\langle g_{s,i},w\rangle - w e^{-|w|^2/2}| \le 2/\sqrt m.
(3) dir:good-charts: 每个单位向量 v，至少 S/2 个指标 s 满足
    \max_i |\langle v,g_{s,i}\rangle| \le C\sqrt{\log m}.
```

其后 directions.tex:42-47 给概率论证的梗概（高斯向量给出这样的族；频率网 exp(O(m log m)) 个点，单个标量经验估计失败概率 at most exp(-cm^4)；单独的球面网加图表间独立性给出对每个方向的最后一条），完整证明在附录 app:directions。再后（directions.tex:50-73）固定一族，定义 u_{s,i}=g_{s,i}/sqrt m、J_s: R^m to R^N、(J_s theta)_i = <u_{s,i},theta>，伪逆 J_s^+=(J_s^TJ_s)^{-1}J_s^T，并记下 eq:pseudoinverse：||J_s||_op <= sqrt(2N/m)、||J_s^+||_op <= 2sqrt(m/N)、|J_s^+e_i| <= 4m/N。

### (b) 推导补全

三条性质各自喂给谁，我先在头脑里连线，再验证数量级。性质 2 是"经验高斯变换"：目标是用有限和 (1/N)Σ g sin<g,w> 近似 w e^{-|w|²/2}。注意 E_{g~N(0,I)}[g sin<g,w>] 恰好等于 w e^{-|w|²/2}（高斯特征函数 <g,w>~N(0,|w|²)，对 sin 求期望给出虚部，再对 g 取梯度即得 w 乘 e^{-|w|²/2}），所以这是无偏经验过程；|w| 截到 m^{42} 是因为 kernel 片里 |w|=|η-θ|/σ 的最大值就是 6√m/a = 6m^{40.5} < m^{42}（kernel.tex:163）。误差 2/√m 在 kernel.tex:164 被直接以 2log(b/a) 的形式使用：那里是把近似误差乘 dσ/σ 积分，(1/√m)·log(b/a)·√m 型--实际上 kernel 证明引的是 lem:directions 的界乘积分长度，得到 C log(b/a)=80 log m 级，被 log m 吸收。性质 3 的归一化换算：max_i|<v,u_{s,i}>| = max_i|<v,g_{s,i}>|/√m <= C√(log m/m)，正是 contraction.tex:236-240 用到的因子。为什么单方向的好概率这么高：对固定单位 v，<v,g_{s,i}> 是 N(0,1)，max over i<=N=m^6 个独立量的大小是 √(2 log N)=√(12 log m)≈3.5√(log m)，即"典型水平"就是 √(log m)，而性质 3 要求的恰是这个量级乘绝对常数；真正不显然的是存在一组样本同时让"几乎一半方向族"都命中。固定 s、固定 v 时这是尾部概率的网论证；对一切 v 同时成立需要球面网；而"至少 S/2 个 s"是对 s 求和：每个 s 独立的失败概率 p<=1/3（网加尾部），则坏图表数期望 <= S/3，Markov 得 >= S/2 好的概率非零。这个"半数"结构（不是全部）是后面 contraction 平均化的引擎（con:eq:good-chart-average 里那个 2/S 因子）。

伪逆三件套的机械验证：J_s^TJ_s = (1/m)Σ g g^T 特征值属于 [N/(2m), 2N/m]（dir:norms 第 3 部分除 m），故 ||J_s||_op = sqrt(2N/m)、||J_s^+||_op = sqrt(2m/N)（写成 2√(m/N) 是放大）。|J_s^+e_i| = |(J_s^TJ_s)^{-1}u_{s,i}| <= (2m/N)·2 = 4m/N ✓（directions.tex:71-73 逐字给出这条链）。

### (c) 机械理由

directions 片与 directions-proof 片的分工：正文只陈述并使用（directions.tex:50-51 强调"its every-direction guarantee is available before any contraction is chosen"，即方向在对手出招前定死，博弈顺序是先固定图表再考虑一切 contraction），附录 app:directions 承担全部概率存在性。S=m³ 与 N=m⁶ 的幂次选择：N 管每图表内逼近质量（经验过程误差 ~ √(log N / N)·放大项，N=m⁶ 让 1/√m 的界有余地同时把每图表标签维数抬高），S 管"半数好图表"的冗余（S=m³ 让 1/3 失败概率的 Markov 损失变成 2/S 常数）；两者一起进顶点计数 |V| <= exp(C m log m)（main.tex:235-236），log m 因子最终变成 log log n 的那一层。性质 1 的三个子句分别防：范数下界 1/2 级防退化投影（contraction.tex:199-200 用它取 |u|>=1/2 从而密度变差引理有 √m/λ 界）；不平行防界面超平面重合（contraction.tex:135-137：交集聚零测度，跳变 Δ_{i,k} 良定义）；特征值双边界防 J_s 秩亏。

### (d) 候选失败路线 [推测]

[推测] 路线一：只造一个图表（S=1），靠 N 巨大来同时逼近高斯变换与控制投影。断在性质 3：单一高斯向量集在某个特定方向 v（比如最大投影方向）上必然有 max_i|<v,g_i>| ~ √(log N)·(1+o(1)) 量级，并非 √log m 的"好"水平，contraction 的因子 √(log m/m) 换成 √(log N/m)，间隙里 5/2 次幂直接爆掉。半数论证本质需要多个近乎独立的图表。

[推测] 路线二：让性质 3 覆盖"所有 s"，并非常数比例。断在概率量级：max 统计是 √(log N) 阶，超过 C√log m 的概率对所有 s 同时压到 0 需要每图表失败概率 exp(-cS)，即 S 进指数，那 |V| 变成 exp(exp(Ω(m))) 级，log n 不再是 m log m 阶，最终换元给出的是双重对数的怪物，根号 log n 拿不到。

[推测] 路线三：用确定性构造（如几乎正交系、expander 图邻接向量）替换高斯采样。风险断在性质 2：sin 经验逼近对 w 的 m^{42} 半径球需要三阶以上矩的均匀控制与网论证，确定性系一般只有网半径 O(1) 级别的逼近，kernel.tex:163 的大半径会被逼成 τ 或 a 的重新校准，牵一发动全身。这只是我的偏好猜测，论文没有讨论。

## 6. kernel.tex：公共核与图表延拓四段式

### (a) 逐字引用与位置

Section "A Hilbert kernel with chart extensions"（kernel.tex:1-345，标签 ker:sec）。参数行（kernel.tex:13-17）：

```
 a=m^{-40},\qquad b=m^{40},\qquad
 \varepsilon=m^{-200},\qquad r=m^{-8},\qquad \tau=m^{-2000}.
```

kernel.tex:18-22 逐字解释："The numerical exponents only enforce separation of scales. The cutoffs $a,b$ approximate Euclidean distance; $\varepsilon$ controls the added Fourier components; $r$ is the tolerance for the angle repair; and $\tau$ is small enough to absorb every polynomial norm bound below. All choices are fixed powers of $m$, which is essential for the vertex count."

Hilbert 空间与特征映射（kernel.tex:34-44）：Hh = L_2([a,b]×R^m, dσ dγ_m; R^2) ⊕ ⊕_{s=1}^S ⊕_{i=1}^N L_2([a,b], dσ/σ; R^2)，p(theta) 的第一分量是 m^{1/4}E(<g,theta>/σ)（E(t)=(cos t, sin t)，gamma_m 是 R^m 标准高斯，kernel.tex:32），(s,i) 分量是 √ε E(<g_{s,i},theta>/σ)。内核算式 eq:kernel（kernel.tex:45-56）：

```
 \langle p(\theta),p(\eta)\rangle
 =\sqrt m\int_a^b e^{-|\eta-\theta|^2/(2\sigma^2)}\,d\sigma
  +\varepsilon\sum_{s,i}\int_a^b \cos(\langle g_{s,i},\eta-\theta\rangle/\sigma)\,d\sigma/\sigma.
```

Lemma lem:kernel（kernel.tex:58-88）：绝对常数 c_*=2∫_0^∞(1-e^{-1/(2t²)})dt>0；|theta|,|eta| <= 3√m 时 ||p(theta)-p(eta)|² - c_*√m|theta-eta|| <= m^{-37}。

Lemma ker:extension（kernel.tex:102-126）：每 s 有光滑 A_s: R^m to L(R^N,Hh)，A_s(theta)J_s = Dp(theta)；profile 界 |<A_s(theta)e_i, p(eta)>| <= C(m/N)log m；五个量（|p|, ||Dp||, ||D²p||, ||A_s||, ||DA_s|| 的算子范数）一致 <= m^{300}。

延拓定义 P_s（ker:P-definition，kernel.tex:227-231）：Q_s=I-J_sJ_s^+（象的正交补投影），P_s(x)=p(J_s^+x)+A_s(J_s^+x)Q_s x；在图表子空间上 P_s(J_s theta)=p(theta)、DP_s(J_s theta)=A_s(theta)（用 Q_sJ_s=0，kernel.tex:232-235）。舍入（ker:rounding，kernel.tex:237-242）X_s(theta)_i = τ⌊<u_{s,i},theta>/τ⌋；U=(-2,2)^m；扔掉阈值超平面后定义 V（ker:vertices，kernel.tex:246-250）。角条件 rep:eq:angle（kernel.tex:254-259）：平方距离满足全部三角不等式当且仅当 <Z_v-Z_z, Z_y-Z_z> >= 0 对所有三元组。

Lemma ker:angles（kernel.tex:262-283）三条结论：全局 ker:global-angle 是 <P_v-P_z,P_y-P_z> >= -r；局部 ker:local-angle 是同图表 v=(s,x), z=(s,x') 时 |<P_v-P_z,P_y-P_z>| <= L(m/N)||x-x'||_1，L=C_0 log m；舍入距离 ker:rounded-distance 是 ||P_{v_s(theta)}-P_{v_t(eta)}|² - c_*√m|theta-eta|| <= m^{-37}+m^{610}τ <= r/10。

### (b) 推导补全

c_* 的来历与因子 2。第一分量对平方距离的贡献：|m^{1/4}E(a)-m^{1/4}E(b)|² = √m·|E(a)-E(b)|² = √m·(2-2cos(a-b))；对 g 求高斯期望，<g,theta-eta>/σ ~ N(0, |Δ|²/σ²)，cos 的期望是 e^{-|Δ|²/(2σ²)}，于是第一分量给 √m∫_a^b(2-2e^{-|Δ|²/(2σ²)})dσ = 2√m∫_a^b(1-e^{-|Δ|²/(2σ²)})dσ。换元 σ=|Δ|t：= 2√m|Δ|∫_{a/|Δ|}^{b/|Δ|}(1-e^{-1/(2t²)})dt。截断到全区间后正好是 c_*√m|Δ|，c_* 定义里的 2 就是上面这个 2。截断误差两笔：小尺度 [0,a] 积掉 at most √m·2a（被积函数 <=2 乘区间长 a，实际 2√m·a 对应两个 1-项），kernel.tex:79-80 写作 2√m a + √m|Δ|²/b <= 2√m a + 36m^{3/2}/b，第二笔来自大尺度 [b,∞)：1-e^{-x}<=x 给 √m∫_b^∞ |Δ|²/(2σ²)·2 dσ = √m|Δ|²/b，|Δ|<=6√m 平方得 36m。附加 Fourier 分量对距离的贡献 at most 每分量 4·ε·(区间长度按 dσ/σ 积出 log(b/a))，共 4εSN log(b/a)（kernel.tex:82-83）。代数值：2√m·m^{-40}=2m^{-79/2}；36m^{3/2}·m^{-40}=36m^{-77/2}；4·m^{-200}·m^3·m^6·80log m=320m^{-191}log m（kernel.tex:84-86）。三项对大 m 都 <= m^{-37}/3 级，合并成 m^{-37} ✓。这里我核对出 S=m³、N=m⁶ 确被 320 那一项消费：4εSNlog(b/a) 里 SN=m⁹，80 来自 log(b/a)=80 log m。

A_s^0 的构造动机。想要的 profile 是 Dp 的 Gabor 型导数：对 theta 微分 eq:kernel 第一分量得 √m∫_a^b w e^{-|w|²/2} dσ/σ（kernel.tex:131-135，w=(η-θ)/σ；对 e^{-|η-θ|²/2σ²} 关于 θ 的梯度给出 (η-θ)/σ²·e^{…}，写成 w/σ 再换测度 dσ/σ，链在 tex 里是" Differentiation in $\theta$ of the Gaussian term"一句带过，我补了这一步）。lem:directions 性质 2 说 (1/N)Σ g_{s,i} sin<g_{s,i},w> 逼近 w e^{-|w|²/2}，而 sin 恰是 cos(<g_{s,i},θ>/σ) 对 θ 方向 g_{s,i} 的导数产出，所以把 profile 实现为辅助 (s,i) 分量上的函数 (m/N)ε^{-1/2}E'(<g_{s,i},θ>/σ)（kernel.tex:139-144）：它与 p(eta) 的 (s,i) 分量内积，用 E'·E 的点积恒等式（E'(t)·E(t') 的内积 = cos(t'-t)，因为 E'(t)=(-sin t, cos t)，<E'(t),E(s)>=cos(s-t)），√ε 与 ε^{-1/2} 相乘得 1，得 (m/N)∫ sin(<g_{s,i},w>)dσ/σ（ker:initial-profile，kernel.tex:146-151）。乘 J_s：A_s^0J_s 的列组合权重 (m/N)·g_{s,i}/√m，合成 √m∫(1/N)Σ g sin dσ/σ（kernel.tex:152-158），与目标 profile 只差 lem:directions 的误差。余项 R_s=Dp-A_s^0J_s 的配对界：|w|<=6√m/a < m^{42} 在 |θ|,|η|<=3√m 下成立（θ,η 在球内、σ>=a），经验逼近误差 2/√m 乘 √m（prefactor）再乘积分 80 log m 长度，得 C log m·|v|（ker:residual-profile，kernel.tex:172-176）；第二项梯度自身的范数被 εΣΣ|g|∫dσ/σ² <= 2εSN√m/a <= 1 压死（kernel.tex:165-170：∫_a^b dσ/σ² <= 1/a，Σ|g_{t,i}| <= SN·2√m 放成 2SN√m--tex 直接写 2εSN√m/a，即 Σ|g|<=SN·2√m 已吸收进常数）。关键的幅度账：A_s^0 振幅 (m/N)ε^{-1/2} 与特征振幅 √ε 相乘，profile 保留全额 m/N 强度而距离只贡献 ε--这就是 kernel.tex:92-95 那段"amplitude $\sqrt\varepsilon$ ... amplitude $\varepsilon^{-1/2}$ ... retain full strength despite the negligible contribution"的意思。延拓最终形 A_s = A_s^0 + R_sJ_s^+ = A_s^0(I-J_sJ_s^+) + DpJ_s^+（ker:A-definition，kernel.tex:177-181）：验证恒等式 A_sJ_s = A_s^0J_s + R_sJ_s^+J_s = A_s^0J_s + (Dp-A_s^0J_s)I = Dp ✓（用 J_s^+J_s=I_m，kernel.tex:182）。profile 合成：A_s^0 部分给 (m/N)log m 量级（sin 积分 ∫_a^b|sin|dσ/σ 放成 log(b/a) 乘常数，具体是 |<A_s^0e_i,p(eta)>| <= (m/N)·∫dσ/σ = 80(m/N)log m），R_sJ_s^+ 部分用 ker:residual-profile 乘 |J_s^+e_i| <= 4m/N，得 C log m·4m/N ✓ 合并为 (c) 的 C(m/N)log m。

范数阶梯（ker:strong-bounds 的 m^{300}）。kernel.tex:186-220：一阶二阶导在积分号下逐次合法，因为 a>0 使 1/σ 幂有界、高斯各阶矩有限。第一分量 j 阶平方多重线性范数 <= √m b a^{-2j}E|G|^{2j}（j=0,1,2；E|G|²=m，E|G|⁴=m(m+2)），j=2 时 m^{0.5+40+160+2.00…}=m^{202.5+}，开方 m^{101.25}，写 m^{110}；附加分量平方 <= εSN log(b/a)(2√m/a)^{2j}，j=2 开方约 m^{-29+40.5·2}--tex 直接宣布 ||D^j p|| <= m^{110}（kernel.tex:200-201），我有余地但懒得抠，反正离 300 远。A_s^0 算子范数 <= √N·(m/N)ε^{-1/2}√log(b/a)（算子 <= √N 乘最大列范数，kernel.tex:202），数值 m^{-2}·m^{100}·m^{9.5}≈m^{107.5}，取 m^{110}；DA_s^0 多乘 2√m/a，m^{147.5} 取 m^{150}（kernel.tex:211-212）。最后组合 ||A_s|| <= m^{110} + 1·2√(m/N)·(m^{110}+m^{110}·2√N·…) 级，一律放大到 m^{300}（kernel.tex:213-220），"ample polynomial slack"逐字：留三倍指数余量让 τ=m^{-2000} 一次吞完。

舍入误差链（ker:angles 证明）。|x-J_sθ| <= √N τ（每坐标舍入误差 <τ，kernel.tex:288-291 的 ker:rounding-errors）；|J_s^+x-θ| <= ||J_s^+||·|x-J_sθ| <= 2√(m/N)·√Nτ = 2√mτ ✓；|Q_sx| <= |x-J_sθ|（Q_s 是正交投影且 Q_sJ_sθ=0）<= √Nτ。特征误差（ker:feature-error）：|P_s(x)-p(θ)| <= ||A_s||·|Q_sx| + |p(J_s^+x)-p(θ)| <= m^{300}√Nτ + ||Dp||·2√mτ <= m^{300}(√N+2√m)τ <= m^{305}τ（用 √N=m³）。平方距离扰动：| |P_v-P_z|² - |p(θ)-p(η)|² | <= 2·(sup|p|)·(两误差和) 级 <= m^{610}τ（kernel.tex:301-303：两个 m^{305} 与 |p|<=m^{300} 相乘，指数 305·2 + …取整 610），m^{-2000}·m^{610}=m^{-1390}，加 m^{-37} 仍 <= r/10=m^{-9}/10 ✓（ker:rounded-distance 末不等式 kernel.tex:281，"follows directly from ker:parameters"）。

全局角：三点恒等式 2<v-z, y-z> = |v-z|²+|y-z|²-|v-y|²（kernel.tex:309-312 逐字），把三个 P-平方距离各换成 c_*√m|θ-η| 型项，误差 ±r/10 三笔共 3r/10；换成普通欧氏距离后的表达式 >=0（三角不等式），故 2<…> >= -3r/10，即 <…> >= -3r/20 >= -r ✓。

局部角：沿 x 到 x' 的线段积分。凸性给线段上每点 ξ 保持 |Q_sξ|<=√Nτ、|J_s^+ξ|<=3√m（kernel.tex:319-322）。精确微分恒等式（ker:DP-identity，kernel.tex:325-330）：DP_s(ξ)h = A_s(J_s^+ξ)h + DA_s(J_s^+ξ)[J_s^+h]Q_sξ；第二项算子范数 <= m^{300}·||J_s^+||·√Nτ 放成 2m^{300}√mτ <= m^{305}τ（kernel.tex:331-333，他们用了 |J_s^+h|<=1 的放大）。对端点 y 先换成 p(eta)，误差用 ker:feature-error 吸收：|<DP_s(ξ)e_i, P_y>| <= C(m/N)log m + 3m^{605}τ <= C'(m/N)log m（kernel.tex:336-340：m^{605}τ=m^{-1395} 相对 m/N=m^{-5} 完全可忽略）。对坐标增量求和 Σ|Δx_i| = ||x-x'||_1，选 C_0 足够大盖住 C'，得 ker:local-angle ✓。为什么局部界必须带 ||x-x'||_1 ，并非纯 -r：见下一节的 repair 动机。

### (c) 机械理由

kernel 片承担的是"OPT 侧原料"：它给 (V,P) 提供宏观距离 c_*√m|θ-η|（近似误差 r/10）与两角亏（全局 -r、局部 -L(m/N)||x-x'||_1），还给出跨图表零距离骨架（同一 theta 在不同图表的标签 P 值差 m^{305}τ，将由 repair 后距离 <= Cr 的 met:eq:macro 承担，main.tex:258-260 逐字："labels from different charts at the same parameter have distance at most $Cr$"）。r=m^{-8} 是 kernel 与 repair 的接口常数：kernel 把一切全局角亏压进 -r，repair 用尺度积分在 [0,r] 上买单。τ=m^{-2000} 的角色是"吸收一切多项式范数界"：最坏扰动 m^{610}τ=m^{-1390} 仍比 r=m^{-8} 小 1382 个量级，界面上邻标距离 δ~τ(m/N)log m=m^{-2005}log m 与 r 之比 log(r/δ)=1997 log m - log(C_0 log m)（metric.tex:59-61），1997 = 2000-8+5 恰好是 τ 指数减 r 指数加 N/m 指数，这是三个幂在 repair 对数里的公开会师。ε=m^{-200}：距离贡献 4εSNlog(b/a)~m^{-191} 级（可忽略），profile 贡献全额（乘 ε^{-1/2}），一个参数同时做到"不可见"与"全强度"靠的是振幅 √ε 对振幅 ε^{-1/2} 的配对。a,b=m^{∓40}：小尺度截断误差 2√m a、大尺度 36m^{3/2}/b 都 ≤m^{-37}，即 40 = 37 + 3/2 + 余量向上取整的痕迹；b 还决定 sin 积分的 log(b/a)=80log m，即所有 80、320 这类系数的来源。"uniform"对 kernel 片的约束：整个特征映射对全部 S 个图表共用同一个 p 与同一个 g（kernel.tex:4 只说 retain directions；kernel.tex:26-31 说 common feature map of θ），跨图表的同参数近邻性（main.tex:220-230 的 A common parameter space）正是需求均匀化时各图表约束能互相"咬合"的几何基础，若每图表各配一套特征，contraction 片的导数失配 con:eq:derivative-mismatch 就无从建立。

### (d) 候选失败路线 [推测]

[推测] 路线一：跳过 Fourier 辅助分量，直接用 Dp 的伪逆延拓 A_s = Dp·J_s^+。断在 profile：|<DpJ_s^+e_i, p(eta)>| 是 ||Dp||·|J_s^+e_i| ~ m^{110}·m/N 量级，并非 (m/N)log m，局部角界膨胀 m^{110}/log m 倍，界面距离 δ 失去比 r 小的地位，repair 的对数损失变成正幂，界面约束失效。论文的 kernel.tex:96-100 恰好点名"extension operators may have large norms"是允许的、要防的是 profile 内积。

[推测] 路线二：用单一尺度 σ=const 的高斯核替代尺度积分。断在 lem:kernel 的线性距离：单尺度给 1-e^{-|Δ|²/2σ²}，是小距离处的二次型，并非线性型，宏观距离不再是 √m|θ-η|，T 上平均距离从 m 掉到 √m·√m=… 形式全变，界面上的二次小距离更是彻底消失（界面跳变平方后是 τ²|u|² 级，并非 τ 级），contraction 片的跳变预算换不了对数结构。Schoenberg 尺度积分（main.tex:251-254、kernel.tex:26-28）是把二次距离掰成一次距离的唯一杠杆。

[推测] 路线三：把 τ 取成与 N 无关的固定网格（如 τ=m^{-100}）。断在 m^{610}τ <= r/10 需要 610+指数 <= 8 不可能，舍入扰动吞掉 r；除非把所有算子界重做到 O(polylog)，但那与 A_s^0 的 √N 列放大（kernel.tex:202）矛盾，m^{300} 这类松弛必须被某个 m^{-K} 压住，K 至少要 610+，这就是 2000 的由来。指数 2000 与 610 之间约 3 倍的余量是"固定幂"风格的自然产物。

## 7. repair.tex：三角修补引理（lem:repair）四段式

### (a) 逐字引用与位置

这一片标签很特别：\label{sec:repair} 与 \label{sec:metric} 同挂在 repair.tex:2-3 一节开头（"The finite negative-type semimetric"），而正文文件 metric.tex 是这一节的续篇。修补是主线的枢纽，引理 lem:repair（repair.tex:18-43）逐字：

```
Let a finite set $V$ be partitioned into charts. In each chart let
$\delta$ be a nonnegative multiple of an $\ell_1$ distance, and set
$\delta(v,w)=\infty$ for points in different charts.
Suppose that $r>0$ and Hilbert vectors $P_v$ satisfy
\langle P_v-P_z,P_y-P_z\rangle \ge-\min\{r,\delta(v,z),\delta(y,z)\}   (rep:eq:hypothesis)
Then there are Hilbert vectors $q_v$ such that
d(v,w)=|P_v-P_w|^2+|q_v-q_w|^2
is a negative-type semimetric. They satisfy
|q_v-q_w|^2 = 8\int_0^r(1-e^{-\delta(v,w)/l})\,dl \le 8r                 (rep:eq:distance)
If 0<\delta(v,w)\le r:  |q_v-q_w|^2 \le 8\delta(v,w)(1+\log(r/\delta(v,w)))  (rep:eq:local)
If $\delta(v,w)=0$, then $q_v=q_w$.
```

Gram 定义 rep:eq:gram（repair.tex:47-49）：⟨q_v,q_w⟩ = 4∫_0^r e^{-δ(v,w)/l} dl。

### (b) 推导补全

为什么假设长成 min{r, δ(v,z), δ(y,z)} 的形状：ker:angles 给 <P_v-P_z,P_y-P_z> >= -r（全局），且同图表时对 (v,z) 与 (y,z) 各给 |<…>| <= L(m/N)||x-x'||_1 = δ(v,z)、δ(y,z)（后者需交换内积两参数：取 y=v 或相应置换，metric.tex:42-45 会把这条链走完）。三条下界同时成立，取 min 即得 rep:eq:hypothesis。

q 的正定性两支柱（repair.tex:51-66）。第一：ℓ1 距离是平方 Hilbert 距离：单坐标 t↦1_{[b,t]} 进 L2 的平方距离是 |t-t'|（b 是有限个坐标值的下界），直和与缩放给出图表内 δ 的平方 Hilbert 性；跨图表 δ=∞ 使 e^{-δ/l}=0，Gram 块对角，正定性逐块保持。第二：对任意有限个 Hilbert 向量 h_v，核 e^{-|h_v-h_w|²/l} 半正定，因为 E cos(√(2/l)⟨G,h_v-h_w⟩) = e^{-|h_v-h_w|²/l}（高斯特征函数），cos 又是 (cos,sin) 配对的内积（repair.tex:57-59 逐字："the cosine is the inner product of the corresponding $(\cos,\sin)$ pairs"），这就是 Schoenberg 判据的有限形式。把两者接起来：δ 是图表内 ℓ1 距离的倍数，故存在辅助 Hilbert 向量 h_v 使 |h_v-h_w|²=δ(v,w)，于是 l 固定的核 e^{-δ(v,w)/l} 半正定；对 dl 积分保持半正定；乘 4 仍是 Gram 矩阵，可 Hilbert 实现。

角度补偿的核心不等式（repair.tex:68-83）。δ 满足三角不等式（ℓ1 倍数加 ∞ 跨图表：跨图表三元组若 δ(v,y)=∞ 结论平凡；若两点跨图表而第三点在两者之一图表内，δ(v,y)=δ(v,z)+δ(z,y) 型的 ∞ 算术成立，tex 逐字"including triples meeting different charts"）。对 a=δ(v,z)、b=δ(y,z)：

1 - e^{-a/l} - e^{-b/l} + e^{-δ(v,y)/l} >= 1 - e^{-a/l} - e^{-b/l} + e^{-(a+b)/l} = (1-e^{-a/l})(1-e^{-b/l})，

第一行用 δ(v,y) <= δ(v,z)+δ(z,y)=a+b 与 e^{-x} 递减；第二行是展开因式分解。设 t=min{r,a,b}，则 0<l<t 时每个因子 >= 1-e^{-1}，乘积 >= (1-e^{-1})²。而 ⟨q_v-q_z,q_y-q_z⟩ = ⟨q_v,q_v⟩-⟨q_v,q_z⟩-⟨q_z,q_y⟩+…按 Gram 展开恰是 4∫_0^r(1-e^{-a/l}-e^{-b/l}+e^{-δ(v,y)/l})dl（交叉项 ⟨q_v-q_z,q_y-q_z⟩ = (|q_v-q_z|²+|q_y-q_z|²-|q_v-q_y|²)/2 由 rep:eq:distance 生成同样积分），tex 直接由 rep:eq:gram 得 >= 4(1-e^{-1})²t >= t（repair.tex:81-83）。数值检查 4(1-e^{-1})²=4·(0.6321)²=1.598>=1 ✓ 这个"刚好 >=1"是设计余量最小的常数，若 4 换成 3 就破。于是对 Z_v=(P_v,q_v)（直和内积是两部和）：⟨Z_v-Z_z,Z_y-Z_z⟩ = ⟨P..⟩+⟨q..⟩ >= -t + t = 0，rep:eq:angle 成立，d 是负型半度量。这补上了 kernel 片的最后一块漏洞：P_v 自己的平方距离违反三角不等式，违反量被 min{r,δ,δ} 捕获并被 q 恰好抵消。

距离扰动（rep:eq:distance 与 rep:eq:local）。对角元 ⟨q_v,q_v⟩=4∫_0^r dl=4r，故 |q_v-q_w|²=2·4r-2·4∫e^{-δ/l}dl=8∫(1-e^{-δ/l})dl ✓（repair.tex:87-88）。上界 8r 由 1-e^{-x}<=1。局部：1-e^{-s}<=min{1,s} 给被积 <= min{1,δ/l}；∫_0^r min{1,δ/l}dl = ∫_0^δ 1 dl + ∫_δ^r δ/l dl = δ + δ log(r/δ) = δ(1+log(r/δ)) ✓（repair.tex:89-92 逐字给出该原函数）。δ=0 时被积恒 0，q_v=q_w（repair.tex:93-94）。

### (c) 机械理由

repair 片补的漏洞类型属于几何类别错误，并非数值瑕疵："近似满足三角不等式的平方距离"与"真正的负型半度量"之间隔着一个 rep:eq:angle 条件，直接投影（比如取 max 距离或加常数）会破坏宏观近似或把界面小距离抹平。为什么有界全局误差单独不行（main.tex:253-257 逐字）："The local angle estimate is indispensable: a bounded global error alone would overwhelm the tiny costs at cell interfaces."，机械地看：若只用 r 型修补，界面距离 d ~ δ + 8r 而 8r=8m^{-8} >> δ~m^{-2005}log m，界面跳变被修补淹没，contraction 的跳变预算 con:eq:jump-bound 变成 O(r) ，并非 O(τ(m/N)log²m)，系数预算 con:eq:coefficient-budget 从 C(m/N)(log m)² 变成 Cr/τ·…量级完全失控（r/τ=m^{1992}），√m 因子丢失，间隙退化。min{r,δ} 的"取小者"结构让修补费只在 δ~r 的对数邻域内支付 8δ(1+log(r/δ))，对数损失恰好是标题里 loglog 幂的来源之一（另见第 12 节台账）。修修补总量有界：|q_v-q_w|²<=8r 全局，所以宏观距离 c_*√m|θ-η| 的相对误差在最坏情况下是 8r/(c_*√m·r_scale)，对 θ,η~T 平均距离 √m/3 阶，绝对扰动 Cr 可忽略。log(r/δ) 在界面上 = O(log m)（metric.tex:59-61），于是 8δ(1+log(r/δ)) = C τ(m/N)(log m)²，第二个 log 因子（5/2 次幂里的 2）就是从这一步长出来的：kernel 出 (m/N)log m（一个 log），repair 再乘 (1+log(r/δ))~log m（第二个 log）。

### (d) 候选失败路线 [推测]

[推测] 路线一：不用尺度积分，直接加各向同性修正 q_v = c·v 的线性嵌入。断在 rep:eq:angle 的三元组结构：线性嵌入给的是欧氏平方距离（负型且角非负）但幅度是 |v-z| 的二次型，要盖住 -t 需要按 -⟨P..⟩ 逐三元组定制的向量，不存在单一低维实现；尺度积分的聪明处在于核 1-e^{-δ/l} 自动按"以 z 为顶点的角"局部化。

[推测] 路线二：把 r 直接取小（比如 r=m^{-2005} 对齐界面尺度）。断在 ker:global-angle 的达成成本：全局角亏由舍入误差 m^{610}τ 与截断 m^{-37} 决定，压 r 要么重做 kernel 全部幂次（m^{-37} 已经贴着 b=m^{40} 的极限），要么让修补积分上限 r 变小同时 δ 相对变大，log(r/δ) 变负、rep:eq:local 假设 0<δ<=r 失效，跨图表的 min 结构崩掉。r 必须严格介于 m^{-37} 型全局误差与 m^{-2005} 型界面尺度之间，m^{-8} 是这条缝里的任取。

[推测] 路线三：允许半度量违反少数三角不等式然后交给 SDP 的松弛（去掉三角约束的纯负型 SDP）。断在命题外部的事我没法从 tex 验证，但 [外部推断] 无三角约束的平方欧氏松弛间隙已知更大（ARV 需要三角型约束才有 √log n 上界），且 GL(C)<=OPT(C) 的可行性论证（main.tex:149-150："Cut distances are feasible after normalization"）依赖割距离满足三角不等式归一化后仍在松弛内，改松弛会同时改掉要打败的对象，定理失去意义。

## 8. metric.tex：负型半度量汇总（prop:metric）四段式

### (a) 逐字引用与位置

metric.tex:1-31 的 Proposition prop:metric：对充分大 m，V（ker:vertices）承载负型半度量 d，图表映射 v_s 在 U 上几乎处处定义，满足四条：宏观 met:eq:macro ||d(v_s(θ),v_t(η)) - c_*√m|θ-η|| <= Cr（r=m^{-8}）；相邻 met:eq:adjacent ||x-x'||_1=τ ⇒ d((s,x),(s,x')) <= Cτ(m/N)(log m)²；尺寸与直径 met:eq:size-diameter |V|<=exp(Cm log m)、diam(V,d)<=Cm；平均 met:eq:average 独立均匀 θ,η∈T 时 E d(v_1(θ),v_1(η)) >= cm。且 N=m⁶、τ=m^{-2000}（metric.tex:31）。片尾 metric.tex:97-101 逐字警告：

```
The macroscopic comparison \eqref{met:eq:macro} does not make the
interface constraints redundant: its additive error $O(r)=O(m^{-8})$
is far larger than the interface bound $O(m^{-2005}(\log m)^2)$ in
\eqref{met:eq:adjacent}.
```

### (b) 推导补全

定义 d(v,w)=|(P_v,q_v)-(P_w,q_w)|²（met:eq:definition，metric.tex:47-49）。宏观：|q_v-q_w|²<=8r（rep:eq:distance）加 ker:rounded-distance 的 m^{-37}+m^{610}τ<=r/10，三角不等式合并 |d - c_*√m|θ-η|| <= r/10+8r <= Cr ✓（metric.tex:50-52）。

相邻：ker:local-angle 取 y=v 给 |<P_v-P_z,P_v-P_z>| <= δ(v,z)，即 |P_v-P_z|² <= δ(v,z)=L(m/N)‖x-x'‖₁（metric.tex:54）。‖x-x'‖₁=τ 时 δ=C₀τ(m/N)log m = C₀m^{-2005}log m < r=m^{-8} ✓（metric.tex:56-58）。log(r/δ) = log(m^{-8}) - log(C₀m^{-2005}log m) = 1997 log m - log(C₀ log m) = O(log m)（metric.tex:58-61；2005-8=1997）。rep:eq:local 给 |q_v-q_w|² <= 8δ(1+O(log m)) <= Cτ(m/N)(log m)²，与 |P_v-P_w|²<=δ 合并得 met:eq:adjacent ✓。

顶点计数：阈值超平面 <u_{s,i},θ>=kτ 交 U：|θ|<2√m（U 的对角半长），|u_{s,i}|<=2（dir:norms 上界除 √m），故 |kτ| = |<u,θ>| < 4√m，每族 |k| <= 8√m/τ，总 H <= N(1+8√m/τ)（metric.tex:65-70）。超平面 arrangement 的满维区域数 <= Σ_{j=0}^m C(H,j)（Zas75，metric.tex:71-77，归纳证明一句话：新超平面上被旧超平面切出的新区域数不超过其诱导 arrangement 区域数）。标签在区域内恒定（舍入函数在区域内各坐标 floor 常数），区域与凸立方 U 的交连通（凸交凸），所以每图表标签数 <= 区域数；|V| <= S·Σ_{j<=m}C(H,j) <= exp(Cm log m)，因为 H <= m^{2004.5} 是 m 的固定幂：Σ_{j=0}^m C(H,j) <= (eH/m)^m = exp(m(1+log H - log m)) = exp(O(m log m)) ✓（metric.tex:78-81）。

直径：diam(U)=4√m（对角 (2,2,…,2)-(-2,…,-2) 的欧氏长），met:eq:macro 给 d <= c_*√m·4√m+Cr = O(m) ✓（metric.tex:82-84）。

平均：E|θ-η|²=2m/3（每坐标差方差 2·Var(U(-1,1))=2/3，metric.tex:88）；|θ-η|<=2√m（T 的对角半长 √m，差 <=2√m）。下界 E|θ-η|>=√m/3 的中间步骤（tex 只给结论，我补）：在 x∈[0,4m] 上 √x >= x/(2√m)（√ 的凹弦在 x=4m 处的切线型下界，等价于 √x(1-√x/(2√m))…直接验证：√x - x/(2√m) = √x(1-√x/(2√m)) >= 0 当 √x <= 2√m ✓）。取期望：E|θ-η| >= E|θ-η|²/(2√m) = (2m/3)/(2√m) = √m/3 ✓（metric.tex:91）。再 met:eq:macro：E d >= c_*√m·√m/3 - Cr = c_*m/3 - Cm^{-8} >= cm（大 m）✓（metric.tex:92-94）。

### (c) 机械理由

metric 片在链条上的位置：它是 kernel+repair 原料的"出厂检验单"，四条性质恰好是下游两片各自要的全部接口。contraction 片消费 met:eq:macro（给 con:eq:chart-close 与 con:eq:macro-variation）与 met:eq:adjacent（给 con:eq:jump-bound）；reduction 片消费 met:eq:size-diameter 与 met:eq:average（进 red:weighted-bounds 四连）。片尾警告（metric.tex:97-101）说明为什么两条距离估计互不蕴含：宏观 additive 误差 m^{-8} 与界面尺度 m^{-2005}(log m)² 之间隔着约 2000 个量级，若 met:eq:macro 的误差能细化到界面，整个 contraction 论证（靠界面跳变小来限制分布性梯度的系数）就塌了。"uniform"在 metric 片的体现：met:eq:macro 对所有图表对 (s,t) 一致成立（"whenever the labels are defined"），同参数跨图表距离 <= Cr 是后来"每个 contraction 被全部图表约束"（main.tex:287-288）的几何前提，因为均匀需求要求所有顶点对（含跨图表）都在同一套距离语言里被收费。met:eq:size-diameter 的 diam<=Cm 是 reduction 里期望扰动引理"取值于 [0,Cm] 的函数在积测度 TV<=2/m² 下期望变化 <=2C/m"的直接输入。

### (d) 候选失败路线 [推测]

[推测] 路线一：省掉 arrangement 计数，用"每坐标独立舍入"直接给 |V| <= (每坐标格数)^N。断在格数：N=m⁶ 个坐标每格 8√m/τ=m^{2000.5} 个，得 |V| <= exp(N·2000.5·log m)=exp(Ω(m⁷ log m))，log n 变 m⁷ 阶，换元后间隙只剩 (log n)^{1/2}/(loglog n)^3 里的 sqrt 项被 m=m^{…} 重标成 (log n)^{1/14} 级，根号彻底丢失。arrangement 的区域数按 m（维度），并非 N（坐标数）计数，是 |V| <= exp(Cm log m) 的全部机密。

[推测] 路线二：让 E d 的平均用 diam 界反推（比如先证 diam>=cm 再假设平均 ~ diam）。断在凸体里平均距离与直径差 √m 因子：T 内 E|θ-η|~√m 而 diam~√m 同阶是因为测度铺满体；换成低维集中测度则平均可远小于直径，reduction 的 TV 扰动只花 O(1/m)，但 met:eq:average 本身对测度选择敏感。tex 用 E|θ-η|² 与 sup|θ-η| 的凹性夹逼（metric.tex:86-91）正是把这一步做死。

[推测] 路线三：把 d 直接取 |P_v-P_w|²（未修补）当作"近似半度量"塞进对偶引理。断在 lem:duality 的可行性 F_t(i)=(t_S 1_S(i))：它要求 d 真支配某个 ℓ1 距离之和；未修补的 P-距离可能小于某些割组合，primal-dual 的弱对偶链（red:primal 约束 Σt_Sδ_S<=d）从第一步就没有意义。负型半度量的三角不等式与平方 Hilbert 性两个性质在对偶引理里分别被 primal 可行域界定（三角）与 GL 归一化向量（red:dual-objective 后段，reduction.tex:86-92）消费，缺一个都断。

## 9. contraction.tex：一致 contraction 上界（prop:contraction）四段式

### (a) 逐字引用与位置

Section "Contractions into $\ell_1$"（contraction.tex:1-291，标签 sec:contraction）。命题 prop:contraction（contraction.tex:7-24）逐字要点：设 (V,d) 与 v_s 来自 prop:metric，U=(-2,2)^m、S=m³、N=m⁶；存在绝对常数 C 使每个满足 ||F(v)-F(w)||₁<=d(v,w) 的 F:V→ℓ1^D（D 任意有限）服从

```
  \E_{\theta,\eta\in T}\|F(v_1(\theta))-F(v_1(\eta))\|_1
  \le C\sqrt m\,(\log m)^{5/2}.            (con:eq:contraction)
```

引理 con:lem:cube（contraction.tex:32-42）：T=(-1,1)^m 上 C¹ 实值 h，θ,η 独立均匀，则 E|h(θ)-h(η)| <= E|∇h(θ)|，证明用 Maurey--Pisier 高斯旋转法（contraction.tex:44-74，引 Pis86）。总梯度界 con:eq:total-gradient（contraction.tex:272-278）：Σ_{α=1}^D|∇H_{1,α}(θ)| <= C√m(log m)^{5/2}，其中系数预算 con:eq:coefficient-budget（contraction.tex:184-189）Σ_α|b_{s,i,α}(θ)| <= C(m/N)(log m)²，跳变界 con:eq:jump-bound（contraction.tex:139-144）||Δ_{i,k}(x)||₁ <= Cτ(m/N)(log m)²，好图表平均 con:eq:good-chart-average（contraction.tex:249-256）带 2/S 因子。

### (b) 推导补全

骨架五步，我把每步的常数流补出来。

第一步：几乎处处定义 f_s(θ)=F(v_s(θ))，U 外、阈值超平面上与 ∂U 上置 0（contraction.tex:79-84；V 有限故 f_s 有界紧支撑）。met:eq:macro 立即给两条：同参数跨图表 ||f_s(θ)-f_1(θ)||₁<=Cr（con:eq:chart-close，因 d(v_s(θ),v_1(θ))<=c_*√m·0+Cr）；同图表 ||f_s(θ)-f_s(η)||₁<=c_*√m|θ-η|+Cr（con:eq:macro-variation）。

第二步平滑：ρ 偶、非负、支撑 (-1,1)、∫ρ=1；λ=m^{-2}；κ_λ 为张量积核；H_s=f_s*κ_λ（contraction.tex:95-100）。支撑检验：θ∈T̄ 时 κ_λ(θ-·) 的支撑在每坐标 ±λ 内，离 ∂U 距离至少 1-λ>0，落在 U 内 ✓（contraction.tex:101-103）。平滑误差（con:eq:smoothing-error）：‖H_s(θ)-f_s(θ)‖₁ <= ∫κ_λ(y)‖f_s(θ-y)-f_s(θ)‖₁dy <= c_*√m·√mλ + Cr = c_*mλ+Cr，位移欧氏长 <=√mλ= m^{-3/2}（contraction.tex:107-114 用 mλ+r，与我的 mλ 一致因为 √m·√m=m）。导数失配（con:eq:derivative-mismatch）：∂_jH_s-∂_jH_1 = (f_s-f_1)*∂_jκ_λ；f_s-f_1 在 R^m 上 ℓ1 范数 a.e. <= Cr（U 外两者皆 0，contraction.tex:115-116）；‖·‖₁ <= Cr·∫|∂_jκ_λ| = Cr·λ^{-1}‖ρ'‖_{L1} <= Cr/λ = Cm^{-6}。

第三步：界面跳变与分布性梯度。界面超平面 Q_{i,k}={x:<u_i,x>=kτ}（contraction.tex:126-130）；两侧标签差 τe_i ⇒ met:eq:adjacent ⇒ 跳变 ||Δ_{i,k}||₁ <= Cτ(m/N)(log m)²（con:eq:jump-bound，contraction.tex:137-144）。不平行性（lem:directions 第 1 条）保证超平面交集的 (m-1) 维测度为 0，Δ 值 a.e. 良定义（contraction.tex:134-137）。分布性梯度公式 con:eq:distributional-gradient（contraction.tex:148-153）：Df_{s,α} = Σ_{i,k}(u_i/|u_i|)Δ_{i,k,α}·H^{m-1}|_{Q_{i,k}∩U}，证明是逐胞分部积分：胞内 f 常数无贡献，共享面上两侧合并为跳变乘单位法向，低维交集零测，检验函数在 ∂U 附近消失（contraction.tex:154-161）。θ∈T 时 κ_λ(θ-·) 是 U 内光滑检验函数，卷积得 ∇H_{s,α}(θ)=Σ_i u_{s,i}b_{s,i,α}(θ)（con:eq:gradient-representation），b 的显式 con:eq:coefficient-formula：b_{s,i}(θ)=(1/|u_{s,i}|)Σ_k∫_{Q_{i,k}∩U}κ_λ(θ-x)Δ_{i,k}(x)dH^{m-1}。

第四步：系数预算。固定 u、θ，Z 有密度 κ_λ(θ-·)，h 为 <u,Z> 的密度。coarea：h(t)=(1/|u|)∫_{<u,x>=t}κ_λ(θ-x)dH^{m-1}（contraction.tex:192-198）。|u|>=1/2（dir:norms 除 √m）给出某坐标 |u_j|>=1/(2√m)（contraction.tex:199-201）。条件化：固定 Z 的其余坐标，<u,Z> 是一维密度 ρ 经平移（可反射）与缩放 λ|u_j| 的副本，导数 L1 范数 ‖ρ'‖₁/(λ|u_j|)；对其余坐标混合（mixture）保持该 BV 界：∫|h'|<= C√m/λ（con:eq:density-variation，contraction.tex:202-210；√m 来自 1/|u_j|<=2√m）。逐区间比较（contraction.tex:212-218）：τh(kτ) <= ∫_{kτ}^{(k+1)τ}h + τ∫_{kτ}^{(k+1)τ}|h'|，求和得 τΣ_k h(kτ) <= 1 + Cτ√m/λ <= 2（con:eq:lattice-bound；τ√m/λ = m^{-2000}·m^{0.5}·m² = m^{-1997.5} → 0）。收尾：|b_{s,i}(θ)| 的 ℓ1（对 α）<= (1/|u_i|)Σ_k∫κ·||Δ||₁dH^{m-1}，用 con:eq:jump-bound 提到和号外：<= Cτ(m/N)(log m)²·(1/|u_i|)·Σ_k∫_{Q_{i,k}}κdH^{m-1} = Cτ(m/N)(log m)²·(1/|u_i|)·Σ_k h(kτ)·|u_i|/|u_i|--coarea 恒等式 Σ_k h(kτ)|u|… 精确地：Σ_k∫_{Q_{i,k}}κdH^{m-1} = |u|Σ_k h(kτ) <= |u|·2/τ；除以 |u_i| 再乘 τ·C(m/N)(log m)²/τ 型系数（jump 自带 τ），得 Σ_α|b| <= 2C(m/N)(log m)²·(1/|u|)·|u|/τ·τ… 我把 tex 的账重放一遍：b 的定义带 1/|u|；∫_{Q}κ‖Δ‖dH = ‖Δ‖·(|u|h(kτ)) 逐 k 求和 = ‖Δ‖|u|Σh(kτ) <= Cτ(m/N)(log m)²·|u|·2/τ = 2C(m/N)(log m)²·|u|；再乘 1/|u| 得 con:eq:coefficient-budget ✓（核非负且支撑在 U 内保证绝对值可穿和号，contraction.tex:225-229）。

第五步：合图表。固定 θ∈T、分量 α，a_α=∇H_{1,α}(θ)≠0。dir:good-charts 对单位方向 a_α/|a_α| 给出至少 S/2 个图表 s 使 max_i|<a/|a|,u_{s,i}>| <= C√(log m/m)。对这些 s，由 con:eq:gradient-representation：|a_α| = |Σ_i b_{s,i,α}u_{s,i}| <= max_i|<â,u_i>|·Σ_i|b_{s,i,α}| + |∇H_{s,α}-a_α|（把 a 投影到自身方向：|a| = <a, â> <= Σ_i b_{s,i,α}<u_{s,i},â>| + <∇H_{s,α}-a, â>，逐步展开即 contraction.tex:242-245）。对好图表求和并用 |好集|>=S/2 放大：|a| <= (2/S)Σ_{全部 s}(√(log m/m)Σ_i|b| + |∇H_{s,α}-a_α|)（con:eq:good-chart-average；a=0 平凡）。这一步就是 main.tex:281-284 强调的"favorable charts may depend on the scalar component and parameter; the proof averages over charts before summing the components"：先按 α 平均掉图表依赖，再对 α 求和，好集选择权就被无害化。

对 α 求和 con:eq:good-chart-average：第一项 (2/S)Σ_s√(log m/m)·Σ_{i,α}|b_{s,i,α}| <= 2√(log m/m)·N·C(m/N)(log m)² = 2C√m(log m)^{5/2}（用预算逐 θ 一致）；第二项 (2/S)Σ_sΣ_α|∇H_{s,α}-∇H_{1,α}| <= (2/S)·S·Cmr/λ = 2Cm^{-5}（contraction.tex:261-269 用"欧氏范数 <= 坐标绝对和"把 Σ_α|∇H_{s,α}-∇H_{1,α}| <= Σ_j‖∂_jH_s-∂_jH_1‖₁ <= m·Cr/λ）✓ 得 con:eq:total-gradient：Σ_α|∇H_{1,α}(θ)| <= C√m(log m)^{5/2} + Cm^{-5} <= C√m(log m)^{5/2}。

第六步：con:lem:cube 逐分量应用再求和：E‖H_1(θ)-H_1(η)‖₁ = Σ_αE|H_{1,α}(θ)-H_{1,α}(η)| <= Σ_αE|∇H_{1,α}| = EΣ_α|∇H_{1,α}| <= C√m(log m)^{5/2}（Fubini/Tonelli：θ↦Σ|∇| 可积因为界逐点成立）。回到 f_1：E‖f_1(θ)-f_1(η)‖₁ <= 上界 + 2·C(mλ+r) = +2C(m^{-1}+m^{-8})，吸收（contraction.tex:287-290）。f_1(θ)=F(v_1(θ)) a.e.（阈值超平面零测），con:eq:contraction ✓。

con:lem:cube 本身的中间步骤我补全（contraction.tex:47-74）：Ψ 逐坐标应用 ψ(t)=2Φ(t)-1，把高斯变均匀（概率积分变换），Ψ(G),Ψ(G') 独立均匀于 T。旋转 Y(t)=cos t·G+sin t·G'，Y'(t)=-sin t·G+cos t·G'：联合分布 N(0,I)⊗N(0,I) 在 O(2) 旋转下不变，故每时刻 Y(t),Y'(t) 仍独立标准高斯。d/dt h(Ψ(Y(t))) = <∇h(Ψ(Y)), DΨ(Y)Y'>；给定 Y(t) 时 Y' 仍是 N(0,I)，故 E[|<v,Y'>| | Y] = E|<v,G'>| = |v|·E|G'_1| = |v|√(2/π)（v=DΨ(Y)ᵀ∇h(Ψ(Y))；tex 写 √(2/π)|DΨ^T∇h| 正是这一条，一维标准高斯绝对期望 √(2/π)）。|DΨᵀz| <= sup|ψ'|·|z| = √(2/π)|z|（对角 Jacobian，ψ'(t)=2φ(t)<=√(2/π)，等号在 t=0），条件期望 <= (2/π)|∇h(Ψ(Y(t)))|。微积分基本定理：|h(Ψ(G))-h(Ψ(G'))| <= ∫_0^{π/2}|d/dt|dt；取期望、Tonelli 交换；每时刻 Ψ(Y(t)) 均匀于 T，右端 = ∫_0^{π/2}(2/π)E|∇h(θ)|dt = (π/2)(2/π)E|∇h| = E|∇h| ✓。常数 1 恰好闭合，没有余量也没有亏损，这是我认为全篇最漂亮的一步：旋转法把"两均匀点差"与"梯度一阶矩"用长度 π/2 的弧与 √(2/π) 的两次出现（条件绝对期望乘 Jacobian sup）精确抵消。

### (c) 机械理由

contraction 片承担间隙的 GL 侧（分母）：它把"每个 ℓ1 contraction 在第一图表均匀参数测度下的平均像距离"钉死在 C√m(log m)^{5/2}。√m 与 (log m)^{5/2} 分别从哪里长出来：√m 来自系数预算里 N·(m/N)=m 与好图表因子 1/√m 的乘积（第五步第一项 m·√(log m/m)=√m√(log m)）；(log m)^{5/2} = (log m)²（跳变预算，内含 kernel 的 1 个 log 加 repair 的 1 个 log）×(log m)^{1/2}（dir:good-charts 的 max 统计尾部）。λ=m^{-2} 的双面角色：平滑误差 mλ=m^{-1} 要小（相对 √m(log m)^{5/2} 显然），导数失配 Cr/λ=m^{-6} 也要小（相对预算 m/N·(log m)²=m^{-5}(log m)² 需 m^{-6}·… 检查 con:eq:total-gradient 第二项 Cmr/λ=Cm^{-5}：预算和的第一项已是 √m(log m)^{5/2} >> m^{-5}，λ=m^{-2} 让 mr/λ=m^{-5} ，并非 m^{+?}：若 λ=m^{-1} 则 mr/λ=m^{-6} 也行，若 λ=m^{-4} 则 mλ=m^{-3} 仍小但 Cr/λ=m^{-4}、mr/λ=m^{-3} 开始吃 m^{-3} 项，仍 < √m(log m)^{5/2}。其实约束来自第二步支撑：λ<1 即可。选 m^{-2} 是让两头各留平方余量，纯工程。）D 无关性：所有求和先对 α 逐点做（预算逐 θ 含 Σ_α，好图表平均逐 α），最后一步 con:lem:cube 对每个标量分量独立适用再求和，任何环节不出现 D 的倒数或对角化，ℓ1 的可分性（分量求和）正是维度无关的本质。

### (d) 候选失败路线 [推测]

[推测] 路线一：不 smoothing，直接对 f_s 的分布性梯度做图表平均。断在 |∇H_{s,α}-∇H_{1,α}| 型失配没有对应物：f_s-f_1 是 a.e. 小的 ℓ1 值函数，但它的分布性导数携带界面测度，跨图表相减的法向量不同（u_{s,i}≠u_{t,j}），失配界无从谈起；卷积核把"值小"放大成"导数小除以 λ"是唯一的桥梁。若跳过，con:eq:good-chart-average 第二项变成无穷大（测度对测度不可比）。

[推测] 路线二：用 Poincaré 不等式（球体或立方体上的标准 L2 Poincaré）替代 con:lem:cube。断在常数与阶：标准 Poincaré 给 E(Var) 型 L2 控制，sqrt(E|h-h̄|²) <= C·sqrt(E|∇h|²) 只管 L2 平均，转到 L1 平均要乘 √D（逐分量 L2 到 L1 的和对 ℓ1 范数的期望引入 √D），维度无关性破产。Maurey--Pisier 旋转法给出的是逐分量的 L1 对 L1，无维数损失，这是 [外部推断]（Pisier 的 rotation 方法在度量嵌入文献里的招牌用途恰是维数无关的一阶矩比较）。

[推测] 路线三：把"至少半数好图表"改成"每个 contraction 自适应选图表"（即允许图表依赖 α、θ、F 的任意结构）。tex 已经是这种被动形式（main.tex:281-283），若反过来让构造方事后按 F 调图表，博弈顺序变成先有 F 后有图表，dir:good-charts 的网论证需要针对 F 的可数化，而 F 的目标维数与分量取值不可数，union bound 直接崩。固定图表先于 contraction 是整个"同时约束"策略的承重墙（directions.tex:50-51）。

## 10. reduction.tex：从度量障碍到一致需求容量（lem:duality 与复刻）四段式

### (a) 逐字引用与位置

Section "Exactly uniform demands"（reduction.tex:1-226，标签 sec:reduction）。割锥对偶 lem:duality（reduction.tex:11-33）逐字要点：d 是 [n]（n>=2）上满足三角不等式的平方 Hilbert 半度量；a,b>0 使

```
\frac1{n^2}\sum_{i,j}d(i,j)\ge a,\qquad
\frac1{n^2}\sum_{i,j}\|F(i)-F(j)\|_1\le b
```

对每个有限维 ℓ1 值 contraction F 成立（red:averages），则存在不同点对上的非负容量使需求恰为 1 且 OPT(C)>=1、0<GL(C)<=b/a（red:gap-lemma）。复刻段（reduction.tex:109-198）：权重 w_v=Pr[v_1(θ)=v]（θ 均匀于 T）；M=m^m+m²|V|，k_v=1+⌊Mw_v⌋，Ṽ 为拷贝集，n=|Ṽ|（reduction.tex:139-146）；TV 界 red:tv：‖μ-w‖_TV<=|V|/M<=1/m²、‖μ⊗μ-w⊗w‖_TV<=2/m²；均匀化双界 red:uniform-metric（平均 d>=c'm）与 red:uniform-contraction（平均像 <=C'√m(log m)^{5/2}）；间隙 red:m-gap：OPT/GL >= c''√m/(log m)^{5/2} 且 GL>0；尺寸 red:size：m log m <= log n <= Km log m；结尾换算（reduction.tex:220-226）(√log n)/(loglog n)³ <= √K·√m/(log m)^{5/2}。

### (b) 推导补全

对偶引理逐段补。原始 LP（red:primal）：变量 t_S（S∈𝕊=非空真子集族），目标 Σ|S|(n-|S|)t_S，约束 Σ_S t_Sδ_S(i,j)<=d(i,j)（i<j）。可行域有界性：每个 S 至少分离一对 (i,j)，约束给 t_S<=d(i,j)（reduction.tex:60-62），闭有界故最优达到。弱对偶到强对偶：有限维 LP，原始可行（t=0）有界、对偶可行（c≡1 时割和=|S|(n-|S|) 恰好满足 >=，reduction.tex:77），Slater 不需要，基本对偶定理即可。原始-contraction 桥：F_t(i)=(t_S1_S(i))_{S∈𝕊}∈ℓ1^{|𝕊|}，‖F_t(i)-F_t(j)‖₁=Σ_S t_Sδ_S(i,j)<=d(i,j) 恰是约束集 ⇒ F_t 是 contraction；其 unordered 对距离和 = Σ_S t_S·#{i<j 被 S 分离} = Σ_S t_S|S|(n-|S|) = 目标 ✓（reduction.tex:55-59）。con:eq:contraction 型假设对一切 contraction 成立 ⇒ 原始最优 <= (1/2)Σ_{i,j}‖F(i)-F(j)‖₁ = (n²b-对角 0)/2 <= n²b/2（reduction.tex:59 的 n²b/2：有序和 2Σ_{i<j}+0<=n²b）。强对偶 ⇒ 最优对偶 C 满足 Σ_{i<j}c_{ij}d(i,j)<=n²b/2（red:dual-objective）。对偶约束 Σ_{i∈S,j∉S}c_{ij}>=|S|(n-|S|) 对一切 S ⇒ 每个割的容量/需求比 >=1 ⇒ OPT(C)>=1（reduction.tex:84）。GL 侧：D=Σ_{i<j}d(i,j)>=n²a/2（有序和/2 同前）且 D>0（若 D=0 则平均 <a 矛盾）；d(i,j)=|z_i-z_j|² ⇒ z_i/√D 给归一化半度量 d/D，Σ_{i<j}d/D=1 ✓，负型与三角在缩放下不变 ✓，张成维数 <=n 可落 R^n ✓（reduction.tex:86-92），GL(C)<=Σc·d/D<=(n²b/2)/(n²a/2)=b/a ✓。

GL>0 的树论证（reduction.tex:94-106），我补中间不等式：正容量图不连通则某连通分量 S 的割容量和为 0 < |S|(n-|S|) 违反对偶约束，故连通；取生成树 𝓣，γ=min_{e∈𝓣}c_e>0。任一可行 SDP 距离阵 d'（Σ_{i<j}d'=1，负型半度量）：对每对 (i,j)，树路径 i=v_0,…,v_k=j 与三角不等式给 d'(i,j)<=Σ_{e∈path}d'(e)（平方 Hilbert 距离的三角是 |·| 型：√d'(i,j)<=Σ√d'(e)<=√(k·Σd'(e))，平方后 d'<=kΣd'… 这里 tex 直接写"triangle inequalities along tree paths imply 1=Σd'<=binom(n,2)Σ_𝓣d'"，其机械内容是把每对距离用路径上树边距离之和支配后，Σ_{i<j} 换 Σ_{e∈𝓣}：每条树边 e 至多被 binom(n,2) 对的路径使用（松到每对至多用每边一次，共 binom(n,2) 对），故 Σ_{i<j}d'(i,j)<=Σ_{i<j}Σ_{e∈P(i,j)}d'(e)<=binom(n,2)Σ_{e∈𝓣}d'(e) ✓（用 √d 三角的次可加性平方放大时被 binom 吸收，tex 把这步并成一句话）。于是目标 Σ_{i<j}c_{ij}d'(i,j)>=γΣ_{e∈𝓣}d'(e)>=γ/binom(n,2)>0 ✓（1<=binom·Σ_𝓣d' 移项）。注意这一步是"允许零距离"（semimetric）带来的真实漏洞修补：原 d 可能有零对，若正容量图不连通，GL 最小值可以贴着 0 而被 b/a 的空洞上界伪装成间隙。

复刻段补账：Σ_vw_v=1（v_1(θ) 的像分布），e_v=k_v-Mw_v=1-{Mw_v}∈(0,1]，E₀=Σe_v∈(0,|V|]，n=Σ_vk_v=Σ_v(Mw_v+e_v)=M+E₀ ✓（reduction.tex:153-158）。μ_v-w_v=(e_v-E₀w_v)/n：μ_v-w_v=k_v/n-w_v=(k_v-nw_v)/n=(k_v-(M+E₀)w_v)/n=(e_v-E₀w_v)/n ✓。TV：(1/2)Σ|e_v-E₀w_v|/n <= (1/2)(Σe_v+E₀)/n = E₀/n <= |V|/M <= 1/m²（M>=m²|V|）✓（reduction.tex:159-171）。积测度差写成 (μ-w)⊗μ+w⊗(μ-w) 套 TV 乘积不等式 ‖μ⊗μ-w⊗w‖_TV<=‖μ-w‖·(‖μ‖+‖w‖)=2/m² ✓。取值 [0,Cm] 的函数期望差 <= 2·(2/m²)·Cm… tex 说 at most 2C/m（reduction.tex:177-178），我算 TV 界配全变差定义：|E_μ⊗μ g-E_w⊗w g|<=‖·‖_TV·(sup-inf)<=（2/m²）·2Cm=4C/m，常数吸进 C ✓。于是 d-平均 >= cm-4C/m>=c'm（m 大）✓；contraction-平均 <= C√m(log m)^{5/2}+4C·…(‖F(v)-F(z)‖₁<=d(v,z)<=diam<=Cm 给值域 [0,Cm]) ✓。拷贝压缩：d̃ 让同顶点拷贝零距离，任何 contraction F̃ 在拷贝上取值相同，k_v>=1 保证 V 全顶点在场，诱导 F:V→ℓ1 仍 contraction（因 d̃ 的原像是 d）✓（reduction.tex:187-191）。这回答 main.tex:286-291 的设计动机：测度近似（把 w 变 μ）与顶点全覆盖（每点至少一拷贝）不可兼得的矛盾，用 +1 与 m²|V| 的对偶定价解决：m²|V| 项控 TV（|V|/M<=1/m²），m^m 项把 log n 抬到 m log m 保证换算方向（reduction.tex:136-138 逐字："the term $m^2|V|$ controls the measure error, while $m^m$ ensures the lower bound on $\log n$"）。

最后换算：M<=n<=M+|V|（E₀<=|V|），log M=max(m log m, 2log m+log|V|)+O(1)，log|V|<=Cm log m ⇒ log n ∈ [m log m - O(1), (C+2)m log m+O(1)]，吸收进 K ⇒ red:size ✓（reduction.tex:213-218）。loglog n>=log m（log n>=m log m 取 log）；√log n<=√K√m(log m)^{1/2}；相除得 (√log n)/(loglog n)³ <= √K√m(log m)^{1/2}/(log m)³ = √K√m/(log m)^{5/2}，与 red:m-gap 的 c''√m/(log m)^{5/2} 合并 ⇒ gap>=c‾(√log n)/(loglog n)³，c‾=c''/√K ✓。一列实例取 m→∞ 的整数列即得 n_j 与 thm:main（GL(C^{(m)})>0 由对偶引理末段保证，demand=1 由对偶约束保证，容量非负由 LP 变量约束保证）。

### (c) 机械理由

reduction 从哪种实例造哪种实例：从"一个带概率测度 (V,w) 的负型半度量 + 全部 contraction 的加权平均上界"造出"精确一致需求 n=|Ṽ| 的容量实例"。方向是平均失真框架（LLR95 Section 4、Rab08 Section 1.3，reduction.tex:7-9 逐字引用这两处节号）的对偶化：割锥里每条割收费 = 单位需求铺满所有对。metric 与 repair 两片补的漏洞类型再总结一次：repair 补"角亏"（几何类别：近似负型到真负型），metric 补"计数与平均"（把几何事实翻译成 reduction 接口四件套）；而 reduction 自身补"均匀化"（测度类别：w 到 μ 的 TV 桥与拷贝坍缩）与"正性"（LP 类别：GL>0 的树论证）。1/m² 的 TV 预算怎么定的：期望扰动 O(C/m) 必须 < cm 与 C√m(log m)^{5/2}（两个主项都是 m 的正幂或 √m·polylog），任何 m^{-1-δ} 的 TV 都行，m^{-2} 是取整方便；反过来 M 若不含 m^m 项，log n 的下界只有 log(m²|V|) 的下界 = Ω(log|V|)，而 |V| 的下界没有现成引理（区域数上界不等于标签数下界），换算可能反过来亏掉根号，m^m 是买保险。

### (d) 候选失败路线 [推测]

[推测] 路线一：跳过拷贝，直接对 (V,w) 用带需求的对偶（需求=d(i,j) 的加权稀疏割）。断在定理目标本身：那样得到的是"某需求分布"的实例，并非一致需求；main.tex:124-125 已把一致情形说成需要阻碍平均距离保持，加权对偶把不均匀性转嫁给需求、被 OPT 分母吸收，间隙定义直接换对象。

[推测] 路线二：k_v=⌈Mw_v⌉（不用 +1 floor）。断在 e_v∈[0,1) 时 n=M-E₀ 与 μ-w 公式同样工作，但零权重顶点（其他图表独有标签）k_v=0 被删除，"所有图表约束 contraction"的前提（main.tex:290-292）消失，contraction-平均上界仍然成立（它只需要第一图表），可是 d-平均的下界依赖 v_1 像集=第一图表顶点，似乎不塌？塌在别处：F̃ 诱导 F 时要求每个 v 在场才有"从 Ṽ 的 contraction 限制到 V 的 contraction"的完整链条，缺顶点时 d̃ 在 Ṽ 上的三角与负型仍好，但引理 lem:duality 的输入要 (Ṽ,d̃) 全体，其他图表顶点缺席后 contraction 平均界其实还是对 V 的全部 contraction 成立（因为 V 中第一图表之外仍是子集问题），风险是 w-支撑外顶点对 F 的约束用不上、平均上界被高估，即可能 F̃ 的像平均比 C√m(log m)^{5/2} 大。tex 的措辞（reduction.tex:134-135）"Every chart vertex must remain present, even if its weight is zero: its distance constraints still restrict contractions on the first chart"确认这条线正是 +1 的存在理由；我的推测路线二是把这句话当装饰删掉，断在 contraction 上界不再对"诱导出的 F"适用。

[推测] 路线三：用光滑测度（直接对 θ 均匀，并非离散化拷贝）配连续版本的割锥对偶。断在 lem:duality 的有限性依赖：𝕊 有限、LP 强对偶、最优达到、binom(n,2) 计数全是有限集语言；连续化需要半顶定锥对偶的闭性论证（割锥无穷维版本的正性问题），而且 GL>0 的树论证在无"图"结构时失去抓手。[外部推断] 连续割锥对偶在文献中通常以紧算子或极限论证出现，代价是把 n 换成"规模参数"，thm:main 需要的恰是显式顶点数。

## 11. directions-proof.tex 与 figures/construction.tex：概率实现的账与全链 DAG

### (a) 逐字引用与位置

附录 Section "Gaussian directions: the probabilistic proof"（directions-proof.tex:1-149，标签 app:directions），是 lem:directions 的完整证明；开头逐字（directions-proof.tex:5-7）"Choose all the $g_{s,i}$ independently with the standard Gaussian distribution on $\R^m$. We show that the required events hold simultaneously with probability tending to one"。核心工具：高斯恒等式 dir:gaussian-identities（directions-proof.tex:11-15）、范数尾部 dir:gaussian-norm-tail <= 2e^{-cm}（directions-proof.tex:24-27）、Hoeffding 型有界变量估计 dir:bounded-concentration 2exp(-cnu²/B²)（directions-proof.tex:33-36，引 Hoe63，并补了 Taylor+指数 Markov 的自足证明，directions-proof.tex:37-42）、截断偏差 dir:truncation-bias <= e^{-c'm}（directions-proof.tex:47-53）、两个网：球面 1/8-网 |V|<=17^m 与半径 m^{42} 球的 m^{-3}-网 |W|<=(1+2m^{45})^m=exp(O(m log m))（directions-proof.tex:65-73）、协方差部分 ‖M_s-I‖<= (1-2/8)^{-1}(1/8+e^{-c'm})<1/2（directions-proof.tex:108-112）、性质 3 部分：坏图表概率 2Ne^{-50log m}=2m^{-44}（directions-proof.tex:126-128）、至少 S/2 坏的概率 <= 2^S(2m^{-44})^{S/2}（directions-proof.tex:133-135）、半径 1/m 球面网 (1+2m)^m（directions-proof.tex:136-137）、净点转移 |<v-v₀,g_{s,i}>|<=2/√m 与最终常数 C=11（directions-proof.tex:139-145）。图：figures/construction.tex 全文是 tikz；六个 box 的标题逐字（第 10、37、44、48、55、60 行）：One parameter cube U=(-2,2)^m（Directions for every chart are fixed before the contraction F）、Hilbert features + triangle repair: negative-type d on all of V（附两条距离界 d(v_s(θ),v_t(θ))<=Cr 与 ‖x-x'‖₁=τ 时 d<=Cτ(m/N)(log m)²）、Large metric average（First-chart law，E d>=cm）、Small average for every contraction（All charts constrain the smoothed gradients，E‖…‖₁<=C√m(log m)^{5/2}）、Uniform measure on copies; at least one copy of every vertex（Copies of a vertex have distance zero. All original chart constraints survive）、Cut-cone duality: capacities with unit demand on every distinct pair（OPT(C)>=1, 0<GL(C)<=C₁(log m)^{5/2}/√m）。caption 在 main.tex:304-316。

### (b) 推导补全

union bound 的三方会师（对应正文 directions.tex:43-45 的两句话）。固定 (s,v,w) 的标量偏差概率 2e^{-cN/m²}：B=2√m（截断后 |<v,G>sin<G,w>|<=|G|<=2√m），u=1/(2√m)，nu²/B²=N·(1/4m)/(4m)=N/(16m²)，n=N=m⁶ 得指数 c·m⁴，与正文"failure probability ... at most exp(-cm^4)"逐字吻合。总事件数：S 个族 × |V|·|W| 个网点对 = m³·17^m·exp(Cm log m) = exp(O(m log m))，远小于 e^{cm⁴} ⇒ 全体同时成立概率趋 1 ✓（directions-proof.tex:74-76：failure probability tends to zero, since N/m²=m⁴）。从网到球：向量值偏差在 W 上 <=4/(7√m)（内积被 1/8-网控制范数放大 8/7：若对一切 v₀∈V 有 |<x,v₀>|<=4/(7√m)·…，标准引理 ‖x‖<=max_{v₀}|<x,v₀>|/(1-ρ)·… tex 写"bounds on inner products with a $1/8$-net control the Euclidean norm with factor $8/7$"，即 (1-1/8)^{-1}=8/7 ✓）；Lipschitz 延拓：截断经验向量函数对 w 是 4m-Lipschitz（导数算子范数 <= 截断 |g_{s,i}|² 的平均 <=4m），目标 w e^{-|w|²/2} 是 2-Lipschitz（其导数 I-ww^T 型，范数有界 1…tex 取 2 留余地），网距 m^{-3} 补差 (4m+2)m^{-3}；总账 4/(7√m)+e^{-c'm}+(4m+2)m^{-3} <= 2/√m（4/7+o(1)<=2）✓ 得 dir:gaussian-approximation。

协方差：截断 <v,G>² 有界 4m，期望与 1 之差用 C-S：(E<v,G>⁴)^{1/2}Pr{|G|>2√m}^{1/2} = √3·(2e^{-cm})^{1/2} <= e^{-c'm}（directions-proof.tex:98-102）；u=1/8，union over s 和 v∈V：失败 2·m³·17^m·e^{-c'm⁴/64·…}→0；对称矩阵网引理 ‖A‖<= (1-2ρ)^{-1}max_v|<Av,v>|（ρ=1/8 给因子 4/3）：(1/8+e^{-c'm})·4/3 < 1/2 ✓。回到原样本：全部 SN=m⁹ 个 g 满足 dir:norms 的概率 >= 1-2m⁹e^{-cm}→1（directions-proof.tex:117-119），该事件上截断恒等（|G|<=2√m 的样本不被改动），前两个结论自动继承；不平行"holds almost surely"（零测集论证，directions-proof.tex:120-121）。

性质 3（最讲究的一段）：固定单位 v、单族 s：max_i|<v,g_{s,i}>| 是 m⁶ 个 N(0,1) 的最大绝对值，一维尾部 Pr{|Z|>10√log m}<=2e^{-50log m}=2m^{-50}，union over i 得 2m^{-44}（directions-proof.tex:124-128）。关键句（directions-proof.tex:130-132）："Before any conditioning, these bad-index events are independent across s"，因为其余三条性质 conditioning 后引入图表相关性，而这一条用未条件化的独立性。坏指标数 >= S/2 的概率：至少 S/2 个各自概率 2m^{-44} 的独立事件同时，界 2^S·(2m^{-44})^{S/2}（组合数 ≤2^S 乘特定 S/2 子集全坏概率）✓（directions-proof.tex:133-135）。对半径 1/m 的网（点数 (1+2m)^m=exp(m log(2m))）union：(2m)^m·2^S·(2m^{-44})^{m³/2} → 0 极快 ✓。净点转移：|<v-v₀,g>|<=|v-v₀||g|<=(1/m)·2√m=2/√m<=√log m·(1/10 级余量)，10√log m+2/√m<=11√log m，故 C=11（directions-proof.tex:139-145）。我数出这条性质用了双重网（先 s-union 再球面网），而正文梗概（directions.tex:45-46）说"A separate sphere net and independence across charts"，吻合。

图的 DAG 语义：construction.tex 的箭头（第 33-35、40-42、52-53、57-58、62 行）给出六层依赖：cube→charts→(features+repair)→(large average ∥ small average)→copies→duality；两个 average box 并列（-3.9 与 +3.9 坐标）强调它们是同一 (V,d) 上的两个反向不等式，只有合流到 copies 后才生成间隙。caption 的免责声明（main.tex:307-314）逐字要点：Drawn lengths do not represent d、same-parameter labels are O(r) apart、First-chart averages use independent uniform θ,η∈T，All charts constrain contractions。

### (c) 机械理由

方向与方向的分工再钉一遍：directions.tex 只负责"存在且可固定"（陈述+使用+博弈顺序声明），directions-proof.tex 负责把"同时性"拆成三类事件的并：经验逼近类（性质 1 范数、2、协方差特征值，走截断+Hoeffding+双网 Lipschitz 延拓），几何一般位置类（不平行，a.s.），以及方向一致类（性质 3，走坏指标独立性+球面网+净点转移）。第三类不能并入前两类的原因：前两类的事件 conditioning 在"样本落在范数好集"后跨 s 不再独立，而性质 3 的 2^S·p^{S/2} 界本质用逐 s 独立；tex 在 directions-proof.tex:130-132 与 145-146 两次点出 this argument uses independence only for the unconditioned Gaussian samples。为什么 m^{-44} 与 S=m³ 的组合恰好：需要 (2m^{-44})^{S/2}·2^S·(2m)^m → 0，即 S·44·log m/2 >> m log(2m)，S=m³ 时左边 ~22m³log m >> m log m，余量指数级；S=m² 也够，S=m(log m)^{-1} 才临界，选 m³ 与 N 同族多项式风格一致。

### (d) 候选失败路线 [推测]

[推测] 路线一：对性质 3 用"先条件化范数事件再算坏指标独立"。断在条件化破坏跨 s 独立性（高斯向量在范数事件上不再独立，方向分布有轻微相互信息），2^S p^{S/2} 的界失去成立基础；tex 反而把范数事件留到最后 intersect（directions-proof.tex:117-121、146），顺序是有讲究的。

[推测] 路线二：把 m^{42} 半径球换成全空间一致逼近。断在 dir:truncation-bias 之后的 Lipschitz 常数 4m：|w| 无界时 w e^{-|w|²/2} 的 Lipschitz 仍 2 但经验函数的网必须随 |w| 增长，|W| 爆炸成 e^{Ω(m·42 log m)}…其实 m^{42} 网已 exp(O(m log m))，全空间不可网化；而 m^{42} 是 kernel 使用端 |w|<=6√m/a 的像（kernel.tex:163），半径是被下游钉死的，没有自由度。

[推测] 路线三：用 Bernstein 替代 Hoeffding（有界变量换次指数矩）。不失败但也不获益：这里 B=2√m、u=1/(2√m)、方差实际 ~1，Bernstein 给 exp(-c·Nu²/(σ²+Bu/3))=exp(-c·m⁶·(1/4m)/(1+O(1)))=exp(-cm⁵)，比 m⁴ 好一阶，但瓶颈本就不在此（union 计数 exp(O(m log m))），换不动任何指数。这是我复盘时问"5/2 还能不能压成 1"时发现的一个死胡同：附录的集中度选择对最终 loglog 幂没有影响。

## 12. 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| m | 趋于无穷的大整数（唯一渐近参数） | main.tex:320 | 全部两片参数族的根；n=exp(Theta(m log m)) | 一切 m^{-K} 型吸收同时失效，thm:main 只剩常数间隙 |
| N = m^6 | 每图表方向数 | directions.tex:14; metric.tex:31 | lem:directions 的经验逼近与伪逆列界 4m/N | N/m^2=m^4 是 union 预算；降到 N=m^(2+o(1)) 时 exp(-cm^4) 变 exp(-c m^o(1))，网计数 exp(O(m log m)) 吞不掉 |
| S = m^3 | 图表数 | directions.tex:14 | con:eq:good-chart-average 的 2/S；半数好集性质 3 | S 降到 O(m) 时 2^S(2m^-44)^(S/2) 与 (2m)^m 的 union 不再趋零 |
| a = m^-40 | 尺度积分下端 | kernel.tex:15 | 截断误差 2 sqrt(m) a；半径 m^42=6 sqrt(m)/a；int d sigma^(-2) <= 1/a | 指数小于 37+1/2 时 lem:kernel 的 m^-37 破 |
| b = m^40 | 尺度积分上端 | kernel.tex:15 | 截断误差 36 m^(3/2)/b；log(b/a)=80 log m | 指数小于 37+3/2 时同破；80 进 320 m^-191 log m 的系数 |
| eps = m^-200 | Fourier 分量振幅平方 | kernel.tex:15 | 距离贡献 4 eps S N log(b/a) ~ m^-191；梯度界 2 eps S N sqrt(m)/a <= 1 | eps 放大则宏观误差破 m^-37；缩小则 A_s^0 的 eps^(-1/2) 范数升（有 m^300 余量，真约束在前向） |
| r = m^-8 | 角亏公差与修补积分上限 | kernel.tex:15; metric.tex:15; repair.tex:35 | rep:eq:gram 的 [0,r]；ker:global-angle；met:eq:macro 的 Cr | r 小于界面 delta ~ m^-2005 log m 时 rep:eq:local 的 0<delta<=r 反向失效；r 大于 m^-37 时 ker:rounded-distance 的 r/10 破 |
| tau = m^-2000 | 舍入网格 | kernel.tex:15; metric.tex:31 | 扰动 m^610 tau <= r/10；界面 delta=C0 tau (m/N) log m；con:eq:lattice-bound 的 tau sqrt(m)/lambda | tau 指数 K<619 时 m^(610-K)<=m^-9 不成立，舍入吞 r；K 增只买保险不伤结论 |
| lambda = m^-2 | 平滑尺度 | contraction.tex:97 | 平滑误差 m lambda=m^-1；失配 Cr/lambda；密度变差 sqrt(m)/lambda | lambda 放大则 m lambda 吃主项；缩小到 lambda < m^-6.5 polylog 级时 Cmr/lambda 吃 sqrt(m)(log m)^(5/2) |
| c_* = 2 int_0^inf (1-e^(-1/(2t^2))) dt | 绝对正常数 | kernel.tex:62 | 宏观距离系数 c_* sqrt(m)；平均 c_* m/3 | 定义中的 2 来自平方差展开的双交叉项；改尺度测度 d sigma 会把它变成别的幂的距离 |
| C0, L = C0 log m | 局部角亏斜率 | kernel.tex:269-270 | delta 定义（metric.tex:36-38）；ker:local-angle | C0 若带 m 的正幂，界面 log^2 结构变成 log 的高幂，5/2 变 |
| m^300 | 五量范数阶梯（p, Dp, D2p, A_s, DA_s） | kernel.tex:117-123 | 特征误差 m^305 tau、距离扰动 m^610 tau（kernel.tex:296-303） | 任何放大 P 需 tau 指数 >= 2P+8+余量；300 与 2000 的约 3 倍比是配套设计 |
| 1997 = 2000 - 8 + 5 | log(r/delta) 的主系数 | metric.tex:58-61 | rep:eq:local 的 1+log(r/delta) ~ O(log m)，产生第二个 log 因子 | tau 或 r 指数改动直接改写 1997，但只动常数不动 log m 阶 |
| 跳变界 C tau (m/N) (log m)^2 | 界面 ℓ1 代价 | contraction.tex:139-144; metric.tex:18-21 | 系数预算 con:eq:coefficient-budget | 少一个 log 则 5/2 的 2 缺一；多则间隙幂恶化，loglog 的 3 变 |
| 预算 C (m/N) (log m)^2 | 逐 theta 系数 ℓ1 和 | contraction.tex:184-189 | con:eq:total-gradient 第一项 N 乘预算乘 sqrt(log m / m) | coarea 的 lattice-bound（tau sum h(k tau) <= 2）破则此项带 1/tau 灾难 |
| 好图表因子 C sqrt(log m / m) | 投影 sup 归一化 | contraction.tex:236-240；源 directions.tex:33-38 | 总梯度的 sqrt(m) 来源 | dir:good-charts 若退化为全 S 个（不可能）无影响；若 max 统计带 log N=6 log m 则常数进 (log m)^(5/2) 仍 5/2；若性质 3 只剩 o(S) 个坏，平均因子 1/占比 爆预算 |
| 半数 2/S | 好集放大因子 | contraction.tex:249-256 | 移除 alpha、theta 依赖后再求和 | 性质 3 的 S/2 改 S/2-o(S) 需带占比倒数，union 界方向变 |
| 旋转常数 sqrt(2/pi) 两次乘 pi/2 等于 1 | 一阶矩不等式常数 | contraction.tex:53-73 | con:eq:cube 恰好无损失 | psi 的 Jacobian 与一维绝对期望各出 sqrt(2/pi)，弧长 pi/2 补成 1；任换参数化则常数偏离但阶不变 |
| E theta-eta 平方 = 2m/3 与下界 sqrt(m)/3 | T 上平均距离 | metric.tex:86-94 | met:eq:average 的 cm | 凹性弦下界 sqrt(x) >= x/(2 sqrt(m)) 依赖 sup 距离 2 sqrt(m)；换测度两端同变 |
| H <= N(1+8 sqrt(m)/tau)，区域数 sum C(H,j) | 排列计数 | metric.tex:63-81（引 Zas75） | met:eq:size-diameter 的 exp(Cm log m) | 按坐标盒计数变 exp(Omega(m^7 log m))，log n 换算把 1/2 次根号压成 1/14 |
| M = m^m + m^2 \lvert V\rvert | 复刻总量 | reduction.tex:139-146 | TV <= 1/m^2（red:tv）与 log n >= m log m（red:size） | 去 m^m：log n 下界失去引理支撑；去 m^2 \lvert V\rvert：TV 不趋零，均匀化失败 |
| k_v = 1 + floor(M w_v)，e_v 属于 (0,1] | 拷贝数 | reduction.tex:142, 153-158 | n = M+E0；mu-w 显式公式 | +1 删除则零权重图表顶点消失（reduction.tex:134-135 逐字禁止） |
| 4(1-e^(-1))^2 >= 1 | 角度补偿闭合系数 | repair.tex:78-83 | 角 >= -t 与 q-角 >= t 相消 | Gram 系数 4 低于约 2.5 时补偿不闭合，d 失去三角不等式 |
| gap_m = c'' sqrt(m)/(log m)^(5/2) | m-参间隙 | reduction.tex:204-209 | 换元段 | 它是 a/b = c'm 除 C' sqrt(m)(log m)^(5/2) 的直接商，任何一片松动都在这里汇合 |
| log n 介于 m log m 与 K m log m | 规模换算 | reduction.tex:211-226; main.tex:298-302 | 最终 (sqrt log n)/(loglog n)^3 的不等式方向 | 上界失效则根号 log n 变低幂；下界失效则无法声称子列趋无穷 |
| 失败概率 exp(-c m^4) 对网 exp(O(m log m)) | 同时性预算 | directions.tex:42-46; directions-proof.tex:63-76 | lem:directions 全部性质的交集非空 | 两侧幂次相等时性质 2 退化；这是 S、N 幂差的真实约束 |
| $\sqrt\varepsilon$ 与 $\varepsilon^{-1/2}$ 振幅配对 | 距离贡献 $4\varepsilon SN\log(b/a)$，profile 全额 $m/N$ | kernel.tex:92-93; kernel.tex:139-144 | ker:profile 的 $C(m/N)\log m$ 与 lem:kernel 误差账 | 配对拆散则 profile 幅度带 $\sqrt\varepsilon$，局部角亏斜率 $L=C_0\log m$ 被 $\varepsilon$ 幂污染，repair 假设失效 |
| $\sup_{\lvert w\rvert\le m^{42}}$ 逼近半径 | $m^{42}>6\sqrt m/a$，即 kernel.tex:163 的 $w=(\eta-\theta)/\sigma$ 全域 | directions.tex:27; kernel.tex:163 | dir:gaussian-approximation 供 lem:kernel 求导端使用 | 半径低于 $6\sqrt m/a$ 时余项 $R_s$ 的界 ker:residual-profile 失去经验逼近支撑，$C\log m$ 无从谈起 |
| $2\log(b/a)=160\log m$ | 经验误差 $2/\sqrt m$ 乘尺度积分长度 | kernel.tex:164; kernel.tex:15 | ker:residual-profile 的 $C\log m$ | 若 $\log(b/a)$ 带 $m$ 的正幂，$L$ 不再是 $C_0\log m$，界面项 $L(m/N)\lVert x-x'\rVert_1$ 改形，repair 对数结构瓦解 |
| $8r=8m^{-8}$ | 修补向量对总距离上界 | repair.tex:35; metric.tex:15 | met:eq:macro 的 $Cr$ 与 diam $Cm$ 吸收 | 若 $r$ 提到 $m^{-2005}$ 级则 rep:eq:local 前提 $0<\delta\le r$ 反向断裂；若压至 $m^{-37}$ 以下则 ker:rounded-distance 的 $r/10$ 破 |
| $4(1-e^{-1})^2=1.598\ldots\ge1$ | 角补偿闭合系数（全篇余量最小处） | repair.tex:78-82 | $\langle q_v-q_z,q_y-q_z\rangle\ge t$ 盖住 $-t$ | Gram 前置系数降到 $2.5$ 以下时相消不闭合，$Z_v=(P_v,q_v)$ 失去 rep:eq:angle，$d$ 不再是负型 |
| $\sqrt{2/\pi}$ 两见乘 $\pi/2$ 弧长 | con:eq:cube 总常数恰等于 $1$ | contraction.tex:63-71 | $\mathbb E\lvert h(\theta)-h(\eta)\rvert\le\mathbb E\lvert\nabla h(\theta)\rvert$ 的维数无关闭合 | 换 $\psi$ 之外的分布函数参数化则两因子不再互抵，出现 $(2/\pi)$ 型常数亏损，阶不变 |
| $2Ne^{-50\log m}=2m^{-44}$ 与 $2^S(2m^{-44})^{S/2}$ | 单族坏概率与半数坏族概率 | directions-proof.tex:126-135 | dir:good-charts 对一切单位方向的同时性 | $S$ 掉到 $O(m)$ 时 $(2m)^m$ 网 union 吞不掉，性质 3 的球面一致失效，$2/S$ 平均引擎停机 |
| $\tau\sqrt m/\lambda=m^{-1997.5}$ | 格点求和的可忽略尾项 | contraction.tex:220-223 | $\tau\sum_k h(k\tau)\le2$ 即 con:eq:lattice-bound | 若 $\lambda$ 取小于 $m^{-2}$ 的幂致该项不趋零，预算带 $1/\tau$ 灾难，$Cm(\log m)^2$ 系数预算爆掉 |
| $n=M+E_0$ 与 $0<E_0\le\lvert V\rvert$ | 复刻总数等于总量加地板误差和 | reduction.tex:153-158 | red:tv 的 $\lVert\mu-w\rVert_{\mathrm{TV}}\le\frac{\lvert V\rvert}{M}\le m^{-2}$ | 去 $+1$ 则 $e_v$ 可取零、零权顶点缺席；改 $\lfloor Mw_v\rfloor$ 为四舍五入则 $E_0$ 符号不定，$\mu-w$ 显式式崩 |

## 13. Lean 取证：mainGap  chains 与规模簇表

### 13.1 注册三件套与书目（formalization.yaml 第 1626--1628 行，书目约 459 行）

逐字三行：

```
      comparator_config: ComparatorChallenges/UniformSparsestCut.json
      declaration: OAI.UniformSparsestCut.mainGap
      file: OAI/Combinatorics/SparsestCut/Main.lean
```

书目条目（约 459 行处）只有标题 "Near-square-root logarithmic integrality gaps for uniform sparsest cut"、作者 OpenAI、id 指向 ../preprints/Near-square-root-logarithmic-integrality-gaps-for-uniform-sparsest-cut-September-24-2026/ 下同名 pdf、type article。按纪律我没有打开任何 pdf。

ComparatorChallenges/UniformSparsestCut.json 全文 14 行：challenge_module 为 ComparatorChallenges.UniformSparsestCut，solution_module 为 OAI.Combinatorics.SparsestCut.Main，theorem_names 恰一项 OAI.UniformSparsestCut.mainGap，definition_names 为空数组，permitted_axioms 为 propext、Quot.sound、Classical.choice 三件套，enable_nanoda 为 false。也就是说该挑战不要求定义级匹配、允许经典选择公理、不动用 NaNoda 自动化。

### 13.2 主定理链簇（本次实际读过的文件）

模块共 62 个 .lean、10862 行、537155 字节（wc -lc 一命令取得，全清单见 13.3 簇表）。我按 Main.lean 的引用面反向只精读了五个文件：Main.lean（60 行）、Model.lean（38 行）、Logarithms.lean（84 行）、UniformMetric.lean（89 行），加 ContractionBounds.lean:72-75 与 PivotFamily.lean:146-200、KernelApprox.lean:57-151、UniformReplication.lean、CutDuality/FiniteDuality 的存在性 grep（只到签名与常数定义行，未通读）。链条逐字对上 tex 的地方：

Main.lean:14-22 的 mainGap 陈述：存在 c>0、n : N -> N、每 j 的 Capacity (n j)、n 趋于无穷、每 j 的 0 < glValue (C j)、以及 finally（∀ᶠ j in atTop）c * sqrt(log n)/(log(log n))^3 <= OPT (C j)/glValue (C j)。这与 thm:main 的"沿一列 n_j"、GL>0、幂 3 全部一致；Capacity（Model.lean:9-13）是带非负、对称、零对角三性质的 Fin n -> Fin n -> R 矩阵，OPT（Model.lean:22-23）是 cutRatio 的 sInf，cutRatio 分母正是 B.card * (n - B.card)（Model.lean:18-20），NegativeType（Model.lean:25-27）逐字复刻 main.tex:137-140：平方欧氏距离（EuclideanSpace R (Fin n)，对应"可落 R^n"）加三元组三角不等式；Feasible 要求 pairSum d = 1（Model.lean:29-30，对 sum_{i<j} d = 1）。

证明脚本的常数装配（Main.lean:24-27）：alpha := KernelApprox.cstar/6（tex 平均下界 c_*m/3 的安全版，Cr 误差吸收成 /6）、beta := SourceContraction.C+1、最终 c := alpha/(beta * sqrt 4030)。eventual 条件（Main.lean:29-37）要求 d 充分大使得 Nonempty (PivotFamily.PFamily d)（lem:directions 的概率实现，PivotFamily.lean:200 的 pivot_directions_exist 给出 ∀ᶠ m, Nonempty (PFamily m)；其存在性引理 PivotFamily.lean:152 的失败预算多项式是 6 m^3 exp(-m) + 2/m^20 < 1，对应附录的 union bound 但用确定性网计数）、3000 <= d（tex"充分大"的显式化）、1 <= log d（Logarithms.weight_pos 的前提）、SourceContraction.H <= d 与 4*SourceWeighted.D <= d（平滑与阈值常数被 d 支配）、SourceMetric.C₀+1 <= alpha * d（修补常数 C₀ 线性可吸收，正是 tex hlow 不等式 cstar/6·d <= cstar/3·d - C₀·p d 8 - eps 中 p d 8 = d^{-8} <= 1 的账）。

规模换算的 Lean 形态（UniformMetric.lean:45-62）：M := d^d + d^2 * Fintype.card (V f)，n := Replication.n M w，界 d^d <= n <= d^(4030 d)。这精确解释 tex 的两个神秘数字：tex 的 M = m^m + m²|V| 与 red:size 的 K，Lean 里 K 落地为 4030，且 size_upper（UniformMetric.lean:15-28）证明 d^d + d² v + v <= d^(4030 d)（在 v <= d^(4025 d) 时；|V| <= d^(4025d) 由 SourceCount.card_bound 供应，即 tex met:eq:size-diameter 的 exp(Cm log m) 的显式 C=4025 版）。Logarithms.lean:13 的 weight x = sqrt x * (log x)^2 * sqrt (log x) 就是 sqrt m (log m)^{5/2}，一个乘法分量的字面拆分（(log x)^2 来自跳变预算，sqrt (log x) 来自好图表因子，第 9 节 (c) 的分解在 Lean 里是语法级同构）。RateComparison.bound（Logarithms.lean:35-57）证 sqrt(log n)/(loglog n)^3 <= sqrt 4030 * d / weight d，即 tex reduction.tex:220-225 的换算；gap_of_gl（Logarithms.lean:58-78）把 1 <= OPT、gl <= beta * weight d/(alpha * d) 合成目标不等式，是 tex 最后三行的代数壳。

UniformMetric.lean:30-83 的 instance_exists 是 reduction 第 2 节的完整对应物：SourceWeighted.weighted_instance（reduction.tex:120-131 的 red:weighted-bounds 四连，WeightedMetric.lean:56）、Replication.n/rep 与 epsilon := 4*(D*d)*card(V)/M <= 1（tex 的 TV 界 1/m² 与期望扰动 2C/m 在此合并成一个总量差 epsilon，且 p d 8 = d^{-8} 就是 Cr）、UniformReplication.estimates（reduction.tex:177-198 的拷贝均匀化两界）、cut_cone_duality（reduction.tex:11-107 的 lem:duality，签名见 CutDuality/FiniteDuality 簇）一次性产出 n、C、1<=OPT C、0<glValue C、glValue C <= (C+1)*weight d/(cstar/6 * d)。SourceContraction.C 的显式值（ContractionBounds.lean:73）：2*(cstar+C0) + pi*(1100000000 + C0*H) + 1：pi 与 11 亿是 con:lem:cube 旋转论证里 sqrt(2/pi) 常数的放大包装，与第 9 节 (b) 第六步"常数恰好闭合"的账不冲突（Lean 选了保守显式常数）。KernelApprox.lean:57 的 cstar := 2 * ∫ t in Ioi 0, profile t 与 tex kernel.tex:62 同式，其两侧夹（KernelApprox.lean:119 全区间等式、151 截断误差 2a + r²/b）逐字是 lem:kernel 证明的两笔。

被迫偏离规格之处在此说明：任务允许精读"与主定理链直接对应的簇"，我读到的链上文件是 Main/Model/Logarithms/UniformMetric 四个加三处签名级抽查（ContractionBounds、PivotFamily、KernelApprox）；ContractionAverage.lean、MetricKernel.lean、WeightedMetric.lean 我只 grep 到使用行（如 ContractionAverage.lean:21-23 带 PFamily 参数的 integral_bound、Metric.lean:10 起 SourceMetric 命名空间与 hdiam/havg 假设名），未通读，下文簇表对它们的角色判定按命名、规模与 import 链推断，不算精读证据。

另有一条取证意外收获：GapEstimates.lean:9-10 的 docstring 自述其定理是"Section 7 of *Constant-factor hardness of uniform sparsest cut* by OpenAI"的数字估计，同文件的 completeness_ratio/soundness_contradiction 服务的是另一篇硬结论度论文，只是共享了 OAI.UniformSparsestCut 命名空间。把它的 10^12、40000、22 等常数误当本论文的台账会全盘错位，所以 13.3 表里我把它标为"非链上（他文共享命名空间）"。

### 13.3 规模簇表（行/字节来自 wc -lc 单命令；角色列为按命名与规模对齐的推断）

| 簇 | 文件(行/字节) | 推断角色 |
| --- | --- | --- |
| 入口与模型 | Main(60/2830), Model(38/1230), Logarithms(84/3939) | 主定理装配、OPT/GL 定义、log 换算。已精读 |
| 方向族 | PivotFamily(211/11689), DirectionFamily(201/10431), DirectionAsymptotics(217/10974), DirectionInterpolation(152/8076), Directions(291/15082), FiniteNets(122/5246) | lem:directions 与其概率附录：PFamily 结构、网、渐近尾。PivotFamily 签名级抽查 |
| 核与特征 | KernelApprox(184/7758), CommonKernel(128/5961), MetricKernel(218/12487), Profiles(348/19923), SliceCoefficients(137/6415), SliceIntegration(98/5479), ProductSlice(135/7463) | kernel.tex 的 p、eq:kernel、c_* 与 Fourier profile。KernelApprox 签名级抽查 |
| 图表几何 | ChartKernel(98/4595), ChartLinear(202/8845), ChartAngles(191/10719), ChartMetric(178/9061), RoundedCharts(321/15934), ConcreteCells(156/8366), CellInterface(363/18180), EuclideanCells(164/8925) | ker:rounding、cells、两角估计（ChartAngles 有 cstar*q 距离式，grep 见 48-69 行）|
| 三角修补 | TriangleRepair(473/22728), Semimetrics(193/8336), Mollifier(156/7987), Smoothing(128/6980) | rep:eq:gram 尺度积分与 q 的正定性；Mollifier/Smoothing 推断服务 contraction 平滑段 |
| 度量汇总 | Metric(155/8277), WeightedMetric(151/8051), UniformMetric(89/4274), VertexCount(75/3069), VertexMeasure(96/5540), LabelCount(129/5562), LatticeDensity(125/6127) | prop:metric 四件套与 \lvert V\rvert 计数。Metric/WeightedMetric/UniformMetric 签名或局部精读 |
| contraction 主链 | ContractionCore(106/6325), ContractionAverage(91/4900), ContractionBounds(212/10912), GradientBudget(267/14044), CoordinateSplit(99/4367), InterfaceStep(582/31293), CubeGeometry(165/7859), CubePoincare(133/6682), CubeTransfer(145/8534) | prop:contraction：跳变、系数预算、旋转不等式（InterfaceStep 582 行为全模块最大单文件，推断对应 contraction.tex 最长段落）|
| 高斯工具 | GaussianTools(514/24591), GaussianCDF(144/7199), GaussianNonparallel(116/5057), GaussianPoincare(155/8372) | 附录概率论证与分析机件；Nonparallel 推断对应不平行性 |
| 复刻与权重 | Replication(172/9233), UniformReplication(78/3914), WeightNormalization(79/2921), WeightReplacement(171/7616), WeightReplication(133/5978), FiniteWeights(168/6844) | reduction.tex:139-198 拷贝与权重桥。UniformReplication 局部读 |
| 对偶 | CutDuality(134/6050), CutSums(165/6047), FiniteDuality(214/9451), FiniteGraph(128/5048), GapReduction(192/7996), PositiveKernels(164/6769), Parameters(211/10158) | lem:duality 的 LP 机器与参数表（Parameters 推断存放 a、b、eps、r、tau 的指数）。签名级 grep |
| 非链上 | GapEstimates(57/2456) | docstring 自述属另一论文（常数因子难度），共享命名空间，勿入账 |

推断依据声明：除 13.2 列出的精读文件与 grep 到签名/常数行的文件外，其余 40 余个文件我只统计了行列，未读内容；"推断角色"列的置信度按三个信号排序：文件内出现 cstar/PFamily/weight 等链上符号（grep 证据）> 文件名词缀与 tex 分节名的对位（Chart-Angles 对 ker:angles 等）> 行数量级与 tex 段落长度的相关性（InterfaceStep 对 contraction 长证明）。这是命名与规模对齐推断，不是阅读证据。

## 14. 关键转折点与最终思路对最初设想的全部偏离

把这条反推链收拢，我有四个转折点和六处偏离需要如实登记。

转折点一（问题改写）：从"给 GL 松弛造反例图"改口为"造一个负型半度量并控制它上面所有 ℓ1 contraction 的平均像距离"。这一步在 tex 里是 main.tex:169-175 与 209-217 两段：一致需求的相关量是 contraction 保持的平均距离，最终再走割锥对偶回容量。改写之后，"图"这个对象一度完全消失（kernel 到 reduction 的中途只有有限度量空间 (V,d)），容量 C^{(j)} 是最后一步的对偶产物。我最初以为要先有图再分析它的松弛，方向整个反了。

转折点二（对手先手固定）：意识到"每个 contraction"无法逐一验证后，我把希望放在"让 contraction 自己把结构暴露出来"。论文的实现是 main.tex:230-231 那句"方向是固定在任何 contraction 选定之前"加上 dir:good-charts 的半数好图表：不需要知道 F 是什么，任何固定方向在半数图表里投影都小。con:eq:good-chart-average 用 2/S 平均把 F 对 α、θ 的自适应选择权缴械（contraction.tex:257-259 逐字点出这个动机）。这把我原来的"对角化所有 F"的枚举幻想换成博弈顺序论证。

转折点三（界面 vs 全局的双层误差）：ker:angles 把角亏分成"全局 -r"与"局部 -L(m/N)‖x-x'‖_1"两层，repair 用 min{r, δ, δ} 只买小者。我一开始按单层误差设计（全 r），第 7 节 (c) 算过账：单层修补会把界面距离从 m^{-2005}(log m)² 抬到 m^{-8}，跳变预算放大 m^{1997} 级，整个 contraction 界退化。双层结构不是审美选择，是被 m^{-8} 与 m^{-2005} 之间的 1997 个数量级逼出来的。

转折点四（均匀化靠拷贝坍缩）：main.tex:289-294 的"同一顶点拷贝距离为零，拷贝上的测度恰均匀，推前只近似原测度"把"精确一致需求"与"第一图表测度"的矛盾拆成两个各管一头的方法：+1 保底（顶点在场、约束保留）与 floor 误差 TV<=1/m²（测度近似）。我在第 4 节墓志铭里烧掉的"子集/坏事件"路线，正是被这个技巧在原理上替代：不再挑点，是配平重量。

对最初设想的偏离清单（对照第 1 节的两条预期）：其一，损失形态：我预期 (log n)^{1/2-delta}，实际拿到指数恰好 1/2、全部代价进 (loglog n)^3；台账里 3=5/2+1/2 的分解说明这几乎是唯一可能的形态。其二，反例对象：我预期"图加度数技巧"，实际容量由 LP 对偶产生，主理对象是 semimetric；tex 还特意在 main.tex:134-135 强调不需要正则性假设（对比早期按度数定义一致间隙的写法）。其三，代数 vs 概率：我预期构造性显式族，实际方向族是高斯采样加 union bound（app:directions），"显式"只到存在性。其四，凸性角色：我预期 Poincare/凸几何不等式给 dimension 因子，实际 con:lem:cube 用 Maurey--Pisier 旋转把维数损失精确清零（第 9 节 (b) 那个常数 1 的闭合）。其五，修补机制：我预期投影或截断保三角，实际是 Schoenberg 尺度积分加 Gram 矩阵的构造性修正，且界面上的对数损失 (1+log(r/delta)) 恰是 (log m)^2 的一半来源。其六，"uniform"约束的位置：我预期它约束生成过程（比如要求图正则），实际它只约束最终需求矩阵（每对不同顶点需求恰 1，容量任意非负实数），中间一切对象都不需要均匀性。

还有一处我至今没有完全消化的余量：Lean 装配（Main.lean:24、UniformMetric.lean:73-75）把平均距离下界取成 cstar/6 * d，而 tex 里是 c_*m/3 减 Cr：/6 是为把 C₀·d^{-8} 与总量差 eps 一起塞进去的安全系数；tex 陈述与 Lean 陈述在绝对常数层面有一整层"取半"惯例差，阅读时不要把 c_*m/3 当成紧界。

## 15. 未闭合的问题（写给下一个季度）

1. (loglog n)^3 可否降为 (loglog n)^2 或更低：分解 3=5/2+1/2 中 5/2 来自跳变预算乘好图表因子。跳变预算里 repair 的对数损失 (1+log(r/delta)) 在界面上是 1997 log m 的 O(log m)，若把尺度积分上限从 r 改成带 delta 依赖的截断（比如 min{r, delta log 级别}），可能省一个 log；但 rep:eq:angle 的补偿恰好要积到 r 才能盖住全局 -r 角亏，动一边就塌第 7 节 (b) 的相消。我没有找到不动 ker:angles 双层结构的省法。
2. 一般需求 Omega(sqrt(log n))（Naor--Young）与一致需求本结果的中间地带：bounded-doubling 例子在 CKN09 Remark 1.1 处被排除（main.tex:201-205），本构造的倍增性如何：V 上 d 的 ball 体积按 cell 结构估计，我没算，[推测] 应是指数倍增（m 维立方体网格的拷贝版），那意味着一致间隙与倍增族的平均失真之间还有一块无人区。
3. Kane--Meka 的 exp(Omega(sqrt(loglog n)))（main.tex:183-186）与本文 sqrt(log n)/(loglog n)^3 在 n 的同一尺度上谁大：取 log n = exp(t) 比较 t^{1/2}/(log t)^3 与 e^{sqrt(t)/2}… 后者（KM）是 e^{Ω(√(loglog n))}=e^{Ω(√t)}，对大 t 远小于 t^{1/2}/(log t)^3? 错的方向想反了：e^{√t/2} 对 t 增长比 t^{1/2} 快，但这里 t=loglog n，KM 给 exp(Ω(√(log log n))) = exp(Ω(√(log m))) 而本文给 exp(Ω(√m/log m))（因 √log n~√(m log m)）。本文指数 m^{1/2} 远大于 KM 的 (log m)^{1/2}，即本结果在基本 GL 松弛上碾压式强于 KM；KM 的价值在加强松弛的下界（main.tex:185-187 也这样声明），两者不可直接比大小。这个快速换算让我确认自己没有把两条定理的层级搞混。
4. Lean 侧：mainGap 已把存在性、正性 GL>0、finally 间隙全部内建（13.2），但 PivotFamily 的存在用的是"6 m^3 e^{-m} + 2/m^20 < 1"这类逐步显式常数（PivotFamily.lean:152），比 tex 的 exp(-cm^4) 记账风格更笨重也更可验；若有人想把 4030 与 4025 这两个显式指数推回最优，需要同时动 VertexCount 簇与 size_upper，规模不小。我判断这属于"形式化副产品级的常数优化"，不影响任何渐近声明。
5. 复刻段的 m^m 保险：若 |V| 的下界（存在至少 exp(c m log m) 个不同标签）能被证明，m^m 项可删，log n 的换算区间不变；tex 没有 |V| 下界引理，我的 arrangement 下界尝试（[推测]）在区域相交 U 是否非空处断链：并非每族超平面都切进 (-2,2)^m，方向范数下界只保证阈值间距 tau 极小，区域数下界貌似可得，但我没做，留给后续。

## 16. 渐近换算的草稿纸重放：把第 3 节 (b) 的文字链条全部排成数学

旧稿第 3 节 (b) 里我用半 ASCII 写法带过了主定理的换算，这一节把它逐张卡片重算，每张对应我在草稿纸上重写的一次。起点是 main.tex:298--301 给出的两行换算：$\mathrm{gap}\gtrsim\frac{m}{\sqrt m(\log m)^{5/2}}$ 与 $\log n\asymp m\log m$。我先约定记号：$G(m)$ 指 $m$-参间隙的下界形态 $\frac{\sqrt m}{(\log m)^{5/2}}$；$\lesssim$ 即 main.tex:323 逐字定义的 $A\lesssim B$ 表示 $A\le CB$（$C$ 绝对）。

第一张卡片：分式的分子分母对消。$\frac{m}{\sqrt m(\log m)^{5/2}}=m^{1/2}(\log m)^{-5/2}=\frac{\sqrt m}{(\log m)^{5/2}}$，其中分子 $m$ 来自 met:eq:average 的期望下界 $\mathbb E d(v_1(\theta),v_1(\eta))\ge cm$（metric.tex:29），分母的 $\sqrt m(\log m)^{5/2}$ 来自 prop:contraction 的 con:eq:contraction：$\mathbb E_{\theta,\eta\in T}\|F(v_1(\theta))-F(v_1(\eta))\|_1\le C\sqrt m(\log m)^{5/2}$（contraction.tex:18--21）。两者相除：$\frac{cm}{C\sqrt m(\log m)^{5/2}}=\frac{c}{C}\sqrt m(\log m)^{-5/2}$，这正是 reduction.tex:204--208 的 red:m-gap：$\frac{\operatorname{OPT}(C^{(m)})}{\operatorname{GL}(C^{(m)})}\ge c''\frac{\sqrt m}{(\log m)^{5/2}}$ 且 $\operatorname{GL}(C^{(m)})>0$。

第二张卡片：$m$ 与 $n$ 的对数关系。red:size（reduction.tex:213--218）给出 $m\log m\le\log n\le Km\log m$。我对两边取对数走两遍。下侧：$\log\log n\ge\log(m\log m)=\log m+\log\log m$，故 $\log m\le\log\log n$。上侧：$\log\log n\le\log m+\log\log m+\log K+o(1)$，移项得 $\log m\ge\log\log n-\log\log\log n-O(1)$。再解出 $m$：由 $\log n\asymp m\log m$ 有 $m\asymp\frac{\log n}{\log m}$，于是 $\sqrt m\asymp(\log n)^{1/2}(\log m)^{-1/2}$。我在草稿纸上核对这一步时一度写成 $m\asymp\frac{\log n}{\log\log n}$，随后自查发现这只对"代入后"成立：$\log m$ 本身渐近于 $\log\log n$（差一层 $\log\log\log n$），所以把 $\log m$ 换成 $\log\log n$ 只能给双侧夹逼的方向，正式链条里我保留 $\log m$ 到最后一步再放缩。

第三张卡片：代回间隙。$G\gtrsim\sqrt m(\log m)^{-5/2}\asymp(\log n)^{1/2}(\log m)^{-1/2}(\log m)^{-5/2}=(\log n)^{1/2}(\log m)^{-3}$。这里 $3=\frac12+\frac52$ 的分解一目了然：$\frac52$ 由 contraction 片供应（其内部再分为 $(\log m)^2$ 的系数预算乘 $(\log m)^{1/2}$ 的好图表因子，见第 9 节 (b) 第五步与 main.tex:270--276），$\frac12$ 由换算 $\sqrt m\asymp(\log n)^{1/2}(\log m)^{-1/2}$ 免费提供。最后用 $\log m\le\log\log n$ 即 $(\log m)^{-3}\ge(\log\log n)^{-3}$，得 $G\gtrsim\frac{\sqrt{\log n}}{(\log\log n)^3}$。反方向的组装在 reduction.tex:221--225 逐字给出：$\frac{\sqrt{\log n}}{(\log\log n)^3}\le\sqrt K\,\frac{\sqrt m}{(\log m)^{5/2}}$，与 red:m-gap 合并即 $\frac{\operatorname{OPT}(C^{(m)})}{\operatorname{GL}(C^{(m)})}\ge\frac{c''}{\sqrt K}\cdot\frac{\sqrt{\log n}}{(\log\log n)^3}$，对照 thm:main（main.tex:152--161）读出主定理常数 $c=\frac{c''}{\sqrt K}>0$，实例列取 $n_j=n(m_j)$，$m_j\to\infty$ 沿整数列。

第四张卡片：幂 3 的不可移动性验证。我试着在草稿纸上问：若 contraction 界只有 $\sqrt m(\log m)^2$（好图表因子免掉），链条会给出 $G\gtrsim(\log n)^{1/2}(\log m)^{-5/2}\gtrsim\frac{\sqrt{\log n}}{(\log\log n)^{5/2}}$，幂从 $3$ 恶化回 $\frac52$；若再免掉 repair 的对数损失使预算只剩 $\sqrt m(\log m)^{3/2}$，则 $(\log m)^{-2}$，最终幂 $2$。这里我说的换元结构意味着：最终 $\log\log n$ 的幂 $=1$（来自 $\sqrt m$ 换算的 $\frac12$）加上 contraction 界对数幂 $+\frac12$ 的净和，$3$ 被两侧各钉死一半，没有任何一处出现自由的 $\delta$。这与第 1 节我最初猜的 $(\log n)^{1/2-\delta}$ 形态完全不同：指数 $\frac12$ 是精确值，全部代价走对数层。补充一个小自查：$m$ 充分大时 $\log m\ge1$（Lean 侧 Logarithms.lean:13 的 $\mathrm{weight}(x)=\sqrt x(\log x)^2\sqrt{\log x}$ 就是 $\sqrt x(\log x)^{5/2}$ 的因子字面拆分，我在第 13 节已登记），所以 $(\log m)^{-1/2}\le(\log\log n)^{-1/2}$ 的放缩方向单调安全，无需分段。

第五张卡片：与 ARV 基准的对照写法。main.tex:177--179 逐字给出上界 $O(\sqrt{\log n})$，本结果下界 $\Omega\!\left(\frac{\sqrt{\log n}}{(\log\log n)^3}\right)$，两式之比 $\frac{(\log\log n)^3}{1}\to\infty$ 即"只差一个 $\log\log n$ 的幂"的量化含义（main.tex:113--114："matches the Arora--Rao--Vazirani upper bound up to a power of $\log\log n$"）。而历史线（第 2 节已抄录）上的 DKSV06 给 $\Omega(\log\log n)$（main.tex:181），KM13 给 $\exp(\Omega(\sqrt{\log\log n}))$（main.tex:184）；比较对数：$\log\!\left(\frac{\sqrt m}{(\log m)^{5/2}}\right)\asymp\frac12\log m$ 对 $\log\exp(\Omega(\sqrt{\log m}))=\Omega(\sqrt{\log m})$（用 $\log\log n\asymp\log m$ 同尺），前者按 $m$ 增长快得多，这是第 15 节第 3 条换算的严格化重写。

## 17. kernel 误差三笔账的全数学重排

旧稿第 6 节 (b) 我用手算记了三笔误差，这里全部落进数学模式并把来源行号钉死。参数行 kernel.tex:13--17：$a=m^{-40}$，$b=m^{40}$，$\varepsilon=m^{-200}$，$r=m^{-8}$，$\tau=m^{-2000}$。

第一笔，高斯主项。内核算式 eq:kernel（kernel.tex:45--56）的主部 $\langle p(\theta),p(\eta)\rangle$ 给出平方距离 $|p(\theta)-p(\eta)|^2=2\langle p,p\rangle$ 型展开，主块贡献（kernel.tex:49--50）：
\[
\sqrt m\int_a^b\Bigl(2-2e^{-|\eta-\theta|^2/(2\sigma^2)}\Bigr)\,d\sigma .
\]
我验证这一步：分量是 $m^{1/4}E(\cdot)$，$E(t)=(\cos t,\sin t)$（kernel.tex:32），故单尺度平方差 $m^{1/2}\lvert E(s)-E(t)\rvert^2=\sqrt m(2-2\cos(s-t))$；对 $g\sim\gamma_m$ 取期望，用 dir:gaussian-identities 第一条 $\mathbb E\cos\langle G,w\rangle=e^{-|w|^2/2}$（directions-proof.tex:12），取 $w=\frac{\eta-\theta}{\sigma}$，即 $e^{-|\Delta|^2/(2\sigma^2)}$，其中 $\Delta=\eta-\theta$。换元 $\sigma=|\Delta|t$：
\[
2\sqrt m\int_a^b\bigl(1-e^{-|\Delta|^2/(2\sigma^2)}\bigr)\,d\sigma=2\sqrt m\,|\Delta|\int_{a/|\Delta|}^{b/|\Delta|}\bigl(1-e^{-1/(2t^2)}\bigr)\,dt .
\]
与 kernel.tex:62 的定义 $c_*=2\int_0^\infty(1-e^{-1/(2t^2)})\,dt>0$ 对照，全区间值就是 $c_*\sqrt m|\Delta|$。收敛性两笔（kernel.tex:73--74）：$t\to0$ 时被积函数趋 $0$，$t\ge1$ 时用 $1-e^{-x}\le x$ 得被积 $\le\frac1{2t^2}$，可积。

第二笔，截断误差。假设区间两端的缺口（kernel.tex:78--80）：
\[
2\sqrt m\,a+\frac{\sqrt m\,|\theta-\eta|^2}{b}\;\le\;2\sqrt m\,a+\frac{36m^{3/2}}{b},
\]
其中 $|\Delta|^2\le36m$ 来自 $|\theta|,|\eta|\le3\sqrt m$（kernel.tex:64 的球条件）：$|\Delta|\le|\theta|+|\eta|\le6\sqrt m$。代入 $a,b$：$2\sqrt m\cdot m^{-40}=2m^{-79/2}$，$36m^{3/2}\cdot m^{-40}=36m^{-77/2}$。我在草稿纸上确认大尺度那笔的因子 $\frac12$ 去哪了：kernel.tex:79 直接写 $\frac{\sqrt m|\Delta|^2}{b}$，来自 $1-e^{-x}\le x$ 乘 $\sqrt m\int_b^\infty\frac{|\Delta|^2}{2\sigma^2}\cdot 2\,d\sigma=\frac{\sqrt m|\Delta|^2}{b}$，$2$ 与 $\frac12$ 相消，链上无余数。

第三笔，Fourier 辅块。eq:kernel 第二部每分量内积绝对值 $\le2$（余弦），差的两倍乘振幅平方 $\varepsilon$：每分量 $\le4\varepsilon$，对 $\frac{d\sigma}{\sigma}$ 积分得 $\log(b/a)$，对 $SN$ 个指标求和（kernel.tex:82--83）：
\[
4\varepsilon SN\log(b/a)=4\cdot m^{-200}\cdot m^3\cdot m^6\cdot\log m^{80}=320\,m^{-191}\log m,
\]
我逐字复算：$SN=m^3\cdot m^6=m^9$，$\log(b/a)=\log(m^{40}\cdot m^{40})=80\log m$，$4\cdot80=320$，$m^{-200}\cdot m^9=m^{-191}$，与 kernel.tex:84--86 逐字一致。

三笔合并（kernel.tex:84--87）：$2m^{-79/2}+36m^{-77/2}+320m^{-191}\log m\le m^{-37}$。我核对指数次序：$-\frac{79}{2}=-39.5<-37$，$-\frac{77}{2}=-38.5<-37$，$-191\log$ 阶最富余；$m^{-38.5}$ 与 $m^{-37}$ 之间余 $m^{1.5}$，所以 $36$ 与 $320\log m$ 这类多项式对数因子全被吃掉。这就是 lem:kernel 的结论 ker:distance：$\bigl||p(\theta)-p(\eta)|^2-c_*\sqrt m|\theta-\eta|\bigr|\le m^{-37}$。

舍入侧再补一笔（旧稿写成 ASCII）：ker:rounded-distance（kernel.tex:277--282）的误差 $m^{-37}+m^{610}\tau$。代 $\tau=m^{-2000}$：$m^{610}\tau=m^{-1390}$，和式 $\le m^{-37}+m^{-1390}\le\frac{r}{10}=\frac{m^{-8}}{10}$，末步 kernel.tex:304--305 逐字说 "follows directly from ker:parameters"：$m^{-37}\le m^{-8}/10$ 即 $m^{-29}\le\frac1{10}$，$m$ 大时成立。$610$ 的来源我在第 6 节 (b)推过：$|P_{v_s(\theta)}-p(\theta)|\le m^{300}(2\sqrt m+\sqrt N)\tau\le m^{305}\tau$（kernel.tex:296--299，用 $\sqrt N=m^3$），平方距离扰动 $=O(\sup|p|\cdot\text{误差})$ 两级，$|p|\le m^{300}$（ker:strong-bounds，kernel.tex:117--123），故 $m^{300}\cdot m^{305}\tau$ 记作 $m^{610}\tau$（kernel.tex:301--303）。这条链我如今全部用数学模式重写，各指数 $300,305,610,2000$ 之间的账以不等式 $610-2000=-1390\le-9$ 收尾。

## 18. contraction 预算链的逐步重算：常数的行军路线

旧稿第 9 节 (b) 的六步我这次每一步都写成显式不等式，数字来源全钉在 contraction.tex 的行号上。设定：$\lambda=m^{-2}$（contraction.tex:96），$r=m^{-8}$，$\tau=m^{-2000}$，$\frac{m}{N}=m^{-5}$，$U=(-2,2)^m$，$T=(-1,1)^m$。

第一步，平滑误差。支撑检验：$\theta\in\overline T$ 时 $\kappa_\lambda(\theta-\cdot)$ 的位移每坐标 $\le\lambda$，欧氏长 $\le\sqrt m\lambda=m\cdot m^{-2}=m^{-3/2}$（contraction.tex:108--109）。代入 con:eq:macro-variation $\|f_s(\theta)-f_s(\eta)\|_1\le c_*\sqrt m|\theta-\eta|+Cr$（contraction.tex:88--91）并对核积分：
\[
\|H_s(\theta)-f_s(\theta)\|_1\le c_*\sqrt m\cdot\sqrt m\lambda+Cr=c_*m\lambda+Cr=C(m\lambda+r)=C(m^{-1}+m^{-8}),
\]
即 con:eq:smoothing-error（contraction.tex:110--114），我复核 $\sqrt m\cdot\sqrt m\lambda=\sqrt m\cdot m\cdot m^{-2}=m^{-1}\cdot m=m^{0}\cdot m\cdot m^{-2}$：正确读法是 $\sqrt m\cdot(\sqrt m\lambda)=m\lambda=m^{-1}$。

第二步，导数失配。$\|\partial_jH_s-\partial_jH_1\|_1\le Cr\int_{\R^m}|\partial_j\kappa_\lambda|=Cr\lambda^{-1}\|\rho'\|_{L_1}\le\frac{Cr}{\lambda}=Cm^{-8}\cdot m^{2}=Cm^{-6}$（con:eq:derivative-mismatch，contraction.tex:118--122；$\int|\partial_j\kappa_\lambda|=\lambda^{-1}\|\rho'\|_{L_1(\R)}$ 在 contraction.tex:105--106）。对全部分量与坐标求和给 $\sum_{\alpha=1}^D|\nabla H_{s,\alpha}(\theta)-\nabla H_{1,\alpha}(\theta)|\le\sum_{j=1}^m\|\partial_jH_s-\partial_jH_1\|_1\le Cmr/\lambda=Cm\cdot m^{-6}=Cm^{-5}$（contraction.tex:261--269，tex 在 279 行逐字注 $mr/\lambda=m^{-5}$）。

第三步，界面跳变。相邻标签差 $\tau e_i$，met:eq:adjacent 给 con:eq:jump-bound：$\|\Delta_{i,k}(x)\|_1\le C\tau\frac{m}{N}(\log m)^2=Cm^{-2005}(\log m)^2$（contraction.tex:139--144）。我在草稿纸上把 $m^{-2005}$ 单独圈出：$\tau\frac mN=m^{-2000}\cdot m^{-5}=m^{-2005}$，与 metric.tex:99 警告行的 $O(m^{-2005}(\log m)^2)$ 逐字同值；宏观误差 $O(r)=O(m^{-8})$ 与它相差 $m^{1997}$ 量级，这正是第 8 节 (c) 双层结构讨论的算术底。

第四步，密度变差与格点求和。coarea：$h(t)=\frac1{|u|}\int_{\langle u,x\rangle=t}\kappa_\lambda(\theta-x)\,d\mathcal H^{m-1}(x)$（contraction.tex:194--198）。$|u|\ge\frac12$（dir:norms 除以 $\sqrt m$）给出某坐标 $|u_j|\ge\frac1{2\sqrt m}$（contraction.tex:199--201）。一维副本的导数 $L_1$ 范数 $\frac{\|\rho'\|_{L_1}}{\lambda|u_j|}\le\frac{C}{\lambda}\sqrt m=C\sqrt m\cdot m^{2}=Cm^{5/2}$，混合保持（con:eq:density-variation，contraction.tex:207--210）。逐区间比较 $\tau h(k\tau)\le\int_{k\tau}^{(k+1)\tau}h+\tau\int_{k\tau}^{(k+1)\tau}|h'|$ 求和：
\[
\tau\sum_{k\in\mathbb Z}h(k\tau)\le1+C\tau\sqrt m/\lambda=1+C\cdot m^{-2000}\cdot m^{1/2}\cdot m^{2}=1+Cm^{-1997.5}\le2,
\]
即 con:eq:lattice-bound（contraction.tex:220--224）。我在草稿纸上算 $-2000+\frac12+2=-1997.5$，这笔尾项是全篇最"过分"的余量，tex 也只用它到 $\le2$。

第五步，系数预算。con:eq:coefficient-formula（contraction.tex:173--179）取 $\ell_1$（对 $\alpha$）：$\sum_\alpha|b_{s,i,\alpha}(\theta)|\le\frac1{|u_{s,i}|}\sum_k\int_{Q_{i,k}\cap U}\kappa_\lambda(\theta-x)\|\Delta_{i,k}(x)\|_1\,d\mathcal H^{m-1}$。跳变界提到和号外（kernel 非负核，contraction.tex:225--229），coarea 恒等式把 $\sum_k\int_{Q_{i,k}}\kappa\,d\mathcal H^{m-1}=|u|\sum_k h(k\tau)\le|u|\cdot\frac2\tau$ 送回：
\[
\sum_\alpha|b_{s,i,\alpha}(\theta)|\le\frac{C\tau\frac mN(\log m)^2}{|u|}\cdot|u|\cdot\frac2\tau=C\frac mN(\log m)^2=Cm^{-5}(\log m)^2,
\]
即 con:eq:coefficient-budget（contraction.tex:184--189），每 $\theta\in T$ 逐点成立且与 $D$ 无关。

第六步，合图表与总梯度。固定 $\theta,\alpha$，$a_\alpha=\nabla H_{1,\alpha}(\theta)\ne0$；dir:good-charts 归一化后（$u_{s,i}=\frac{g_{s,i}}{\sqrt m}$，故 $\max_i|\langle\hat a,u_{s,i}\rangle|\le\frac{C\sqrt{\log m}}{\sqrt m}=C\sqrt{\frac{\log m}{m}}$，contraction.tex:236--240）至少 $\frac S2$ 个图表可用。con:eq:good-chart-average（contraction.tex:249--256）：$|a_\alpha|\le\frac2S\sum_{s=1}^S\Bigl(C\sqrt{\frac{\log m}{m}}\sum_i|b_{s,i,\alpha}(\theta)|+|\nabla H_{s,\alpha}(\theta)-a_\alpha|\Bigr)$。对 $\alpha$ 求和，第一项：$\frac2S\sum_s C\sqrt{\frac{\log m}{m}}\cdot N\cdot C\frac mN(\log m)^2=2C\sqrt{\frac{\log m}{m}}\cdot m(\log m)^2=2C\sqrt m(\log m)^{5/2}$，我的账：$N\cdot\frac mN=m$，$m\cdot\sqrt{\frac1m}=\sqrt m$，$\log$ 幂 $2+\frac12=\frac52$ 中 $\frac12$ 来自根号、$2$ 来自预算；第二项 $\frac2S\sum_s Cmr/\lambda=2Cm^{-5}$（contraction.tex:261--269）。相加即 con:eq:total-gradient $\sum_{\alpha=1}^D|\nabla H_{1,\alpha}(\theta)|\le C\sqrt m(\log m)^{5/2}+Cm^{-5}\le C\sqrt m(\log m)^{5/2}$（contraction.tex:272--279）。

第七步，回函数值。con:lem:cube 逐分量（con:eq:cube：$\mathbb E|h(\theta)-h(\eta)|\le\mathbb E|\nabla h(\theta)|$，contraction.tex:37--41）对每个 $\alpha$ 用一次再求和：$\mathbb E\|H_1(\theta)-H_1(\eta)\|_1=\sum_\alpha\mathbb E|H_{1,\alpha}(\theta)-H_{1,\alpha}(\eta)|\le\sum_\alpha\mathbb E|\nabla H_{1,\alpha}|=\mathbb E\sum_\alpha|\nabla H_{1,\alpha}|\le C\sqrt m(\log m)^{5/2}$（Tonelli 合法：界逐点成立）。$f_1$ 侧加 $2C(m\lambda+r)=2C(m^{-1}+m^{-8})$ 吸收（contraction.tex:287--290，$m\lambda=m^{-1}$ 逐字在 289 行）。闭合成 con:eq:contraction：$\mathbb E_{\theta,\eta\in T}\|F(v_1(\theta))-F(v_1(\eta))\|_1\le C\sqrt m(\log m)^{5/2}$（contraction.tex:17--22）。复盘 $\lambda$ 的双约束：$\max\{m\lambda,\frac{mr}\lambda\}=\max\{m^{-1},m^{-5}\}$ 都远小于 $\sqrt m(\log m)^{5/2}$；若 $\lambda=m^{-4}$ 则 $\frac{mr}\lambda=m^{-3}$ 仍可、$m\lambda=m^{-3}$ 仍可，真约束只剩支撑条件 $\lambda<1$，选 $m^{-2}$ 是两头各留平方余量的工程决定，与第 9 节 (c) 的判断一致。

## 19. reduction 对偶与复刻算术的数学重排

旧稿第 10 节 (b) 的 LP 与复刻账我这次全部写成式子，行号对照 reduction.tex。

对偶引理侧（lem:duality，reduction.tex:11--33）。原始问题 red:primal（reduction.tex:44--54）：最大化 $\sum_{S\in\mathcal S}|S|(n-|S|)t_S$，约束 $\sum_S t_S\delta_S(i,j)\le d(i,j)$（$i<j$）、$t_S\ge0$，其中 $\delta_S(i,j)=|\mathbf 1_S(i)-\mathbf 1_S(j)|$（reduction.tex:38）。桥映射 $F_t(i)=(t_S\mathbf 1_S(i))_{S\in\mathcal S}\in\ell_1^{|\mathcal S|}$ 满足 $\|F_t(i)-F_t(j)\|_1=\sum_S t_S\delta_S(i,j)\le d(i,j)$，故是 contraction；其无序对距离和恰为目标值（reduction.tex:55--59）。由 red:averages 的第二条 $\frac1{n^2}\sum_{i,j}\|F(i)-F(j)\|_1\le b$（reduction.tex:20--21）得原始最优 $\le\frac12\sum_{i,j}\|F(i)-F(j)\|_1\le\frac{n^2b}{2}$（对角为零，reduction.tex:59--60）。有界性：任一被 $S$ 分离的对给出 $0\le t_S\le d(i,j)$（reduction.tex:60--62），闭球内取最优。对偶 red:dual（reduction.tex:66--75）：最小化 $\sum_{i<j}c_{ij}d(i,j)$，约束 $\sum_{i\in S,j\notin S}c_{ij}\ge|S|(n-|S|)$、$c_{ij}\ge0$；$c_{ij}\equiv1$ 可行（割和恰 $=|S|(n-|S|)$，reduction.tex:77）。强对偶给最优 $C$ 满足 $\sum_{i<j}c_{ij}d(i,j)\le\frac{n^2b}{2}$（red:dual-objective，reduction.tex:80--83）。割约束改写为 $\frac{\sum_{i\in S,j\notin S}c_{ij}}{|S|(n-|S|)}\ge1$ 对一切 $S$，逐字即 $\operatorname{OPT}(C)\ge1$（reduction.tex:84）。GL 侧：$D=\sum_{i<j}d(i,j)\ge\frac{n^2a}{2}>0$（reduction.tex:86，$a$ 来 red:averages 第一条 $\frac1{n^2}\sum_{i,j}d(i,j)\ge a$）；$d(i,j)=|z_i-z_j|^2$ 缩到 $\frac{d(i,j)}{D}$ 满足归一化 $\sum_{i<j}\frac dD=1$，张成维数 $\le n$ 可落 $\R^n$（reduction.tex:87--90），于是 $\operatorname{GL}(C)\le\frac{\sum c_{ij}d(i,j)}{D}\le\frac{n^2b/2}{n^2a/2}=\frac ba$（reduction.tex:91--92）。

$0<\operatorname{GL}(C)$ 的树账（reduction.tex:94--106）：正容量图连通否则某分量 $S$ 的割和 $=0<|S|(n-|S|)$ 违约束；生成树 $\mathcal T$，$\gamma=\min_{\{i,j\}\in\mathcal T}c_{ij}>0$；任一可行 $d'$ 沿树路径的 $\sqrt{d'}$ 三角给 $1=\sum_{i<j}d'(i,j)\le\binom n2\sum_{\{i,j\}\in\mathcal T}d'(i,j)$（reduction.tex:100--103 逐字），于是目标 $\sum_{i<j}c_{ij}d'(i,j)\ge\gamma\sum_{\mathcal T}d'\ge\frac{\gamma}{\binom n2}>0$（reduction.tex:104）。我在草稿纸上验证中间放大：每对 $(i,j)$ 的路径至多用每条树边一次，$\sum_{i<j}\sum_{e\in P(i,j)}d'(e)\le\sum_{e\in\mathcal T}\binom n2 d'(e)$，因为至多 $\binom n2$ 对经过固定 $e$，链闭合。

复刻侧（reduction.tex:109--198）。权重 $w_v=\Pr_{\theta\in T}[v_1(\theta)=v]$（reduction.tex:114--118），四连 red:weighted-bounds（reduction.tex:122--131）：$|V|\le\exp(Cm\log m)$，$\operatorname{diam}(V,d)\le Cm$，$\sum_{v,z}w_vw_zd(v,z)\ge cm$，$\sum_{v,z}w_vw_z\|F(v)-F(z)\|_1\le C\sqrt m(\log m)^{5/2}$。总量 $M=m^m+m^2|V|$，拷贝 $k_v=1+\lfloor Mw_v\rfloor\ge1$，$n=|\widetilde V|$（reduction.tex:139--146）。地板误差 $e_v=k_v-Mw_v=1-\{Mw_v\}\in(0,1]$（reduction.tex:155），$E_0=\sum_ve_v\in(0,|V|]$，$n=M+E_0$；推前测度 $\mu_v=\frac{k_v}n$ 满足
\[
\mu_v-w_v=\frac{k_v-nw_v}{n}=\frac{k_v-(M+E_0)w_v}{n}=\frac{e_v-E_0w_v}{n}\qquad(\text{reduction.tex:157--159}).
\]
TV 账（约定 $\|\mu-w\|_{\mathrm{TV}}=\frac12\sum_v|\mu_v-w_v|$，reduction.tex:160--161）：
\[
\|\mu-w\|_{\mathrm{TV}}\le\frac1{2n}\Bigl(\sum_ve_v+E_0\sum_vw_v\Bigr)=\frac{E_0}{n}\le\frac{|V|}{M}\le\frac1{m^2},
\]
末步用 $M\ge m^2|V|$（red:tv，reduction.tex:162--171）。积测度：$\|\mu\otimes\mu-w\otimes w\|_{\mathrm{TV}}=\|(\mu-w)\otimes\mu+w\otimes(\mu-w)\|_{\mathrm{TV}}\le2\|\mu-w\|_{\mathrm{TV}}\le\frac2{m^2}$（reduction.tex:169--175）。取值于 $[0,Cm]$ 的函数期望差 $\le\frac2{m^2}\cdot Cm=\frac{2C}m$（reduction.tex:177--178）。两侧均匀化：$\frac1{n^2}\sum_{x,y}\widetilde d(x,y)=\sum_{v,z}\mu_v\mu_zd(v,z)\ge cm-\frac{2C}m\ge c'm$（red:uniform-metric，reduction.tex:180--186）；contraction 侧函数 $\|F(v)-F(z)\|_1\le d(v,z)\le Cm$ 同得 $\frac1{n^2}\sum_{x,y}\|\widetilde F(x)-\widetilde F(y)\|_1\le C'\sqrt m(\log m)^{5/2}+\frac{2C}m\le C''\sqrt m(\log m)^{5/2}$（red:uniform-contraction，reduction.tex:192--198）。拷贝压缩：$\widetilde d((v,h),(z,k))=d(v,z)$（reduction.tex:147--148），同顶点拷贝零距离迫使任何 contraction 在拷贝上取同值，$k_v\ge1$ 保证 $V$ 全顶点在场，诱导的 $F$ 仍是 $\ell_1$ 值 contraction（reduction.tex:187--191）。

汇合：lem:duality 吃 $a=c'm$、$b=C''\sqrt m(\log m)^{5/2}$ 吐 red:m-gap $\frac{\operatorname{OPT}(C^{(m)})}{\operatorname{GL}(C^{(m)})}\ge c''\frac{\sqrt m}{(\log m)^{5/2}}$ 与 $\operatorname{GL}(C^{(m)})>0$（reduction.tex:200--209），其中 $\frac{b}{a}=\frac{C''}{c'''}\sqrt m(\log m)^{5/2}\cdot\frac1m=\frac{C''}{c'''}\frac{(\log m)^{5/2}}{\sqrt m}$ 的倒数即间隙，我在草稿纸上把这一步写成 $\frac{a}{b}=\frac{c'm}{C''\sqrt m(\log m)^{5/2}}=\frac{c'}{C''}\cdot\frac{\sqrt m}{(\log m)^{5/2}}$ 以免倒错方向。规模 $M\le n\le M+|V|$：$\log n\ge\log M\ge m\log m-O(1)$ 且 $\log n\le\log(2M)\le\max(m\log m,\;2\log m+\log|V|)+O(1)\le Km\log m$（用 $\log|V|\le Cm\log m$），即 red:size $m\log m\le\log n\le Km\log m$（reduction.tex:213--218）。最后两行代数：$\log\log n\ge\log m$（由 $\log n\ge m\log m$ 取对数）与 $\sqrt{\log n}\le\sqrt{Km\log m}=\sqrt K\sqrt m(\log m)^{1/2}$，相除
\[
\frac{\sqrt{\log n}}{(\log\log n)^3}\le\sqrt K\,\frac{\sqrt m(\log m)^{1/2}}{(\log m)^3}=\sqrt K\,\frac{\sqrt m}{(\log m)^{5/2}},
\]
与 red:m-gap 合并即 thm:main，常数 $c=\frac{c''}{\sqrt K}$（reduction.tex:221--226），这条链在 §16 第三张卡片已从反向再核一遍。

## 20. directions-proof 尾概率与网计数：附录算术的全数学重排

附录 app:directions（directions-proof.tex:1--149）我这次按事件类别把每条概率写成显式表达式，逐条对行号。

高斯底料两条。矩母：$\mathbb E e^{t|G|^2}=(1-2t)^{-m/2}$（$t<\frac12$，directions-proof.tex:21--22）推出范数尾部 $\Pr\{|G|\notin[\frac{\sqrt m}2,2\sqrt m]\}\le2e^{-cm}$（dir:gaussian-norm-tail，directions-proof.tex:24--27）。恒等式组 dir:gaussian-identities（directions-proof.tex:11--15）：$\mathbb E\cos\langle G,w\rangle=e^{-|w|^2/2}$ 与 $\mathbb E[G\sin\langle G,w\rangle]=we^{-|w|^2/2}$，第二条由第一条对 $w$ 求导（tex 用分部积分微分方程 $\phi'(t)=-t\phi(t)$，$\phi(0)=1$）。

Hoeffding 型引理 dir:bounded-concentration（directions-proof.tex:33--36）：$|X_j|\le B$ 独立，$0<u\le B$ 时 $\Pr\{|\frac1n\sum_j(X_j-\mathbb E X_j)|>u\}\le2\exp(-\frac{cnu^2}{B^2})$；自足证明的账（directions-proof.tex:37--42）：$\mathbb E e^{t(X_j-\mathbb E X_j)}\le e^{Ct^2B^2}$（$|t|\le\frac1{2B}$），取 $t\asymp\frac u{B^2}$ 指数 Markov。

标量偏差代入。截断后 $|\langle v,G\rangle\sin\langle G,w\rangle\mathbf 1_{\{|G|\le2\sqrt m\}}|\le2\sqrt m$ 给 $B=2\sqrt m$，取 $u=\frac1{2\sqrt m}$（须 $u\le B$：$\frac1{2\sqrt m}\le2\sqrt m$ 即 $m\ge\frac14$ ✓），$n=N=m^6$：
\[
\frac{Nu^2}{B^2}=\frac{m^6\cdot\frac1{4m}}{4m}=\frac{m^6}{16m^2}=\frac{m^4}{16},
\]
故单点失败概率 $\le2e^{-c\frac{m^4}{16}}=2e^{-c'm^4}$（directions-proof.tex:60--63 写 $2e^{-cN/m^2}$，$N/m^2=m^4$ 逐字在 76 行）。截断偏差（dir:truncation-bias，directions-proof.tex:47--53）：$\bigl|\mathbb E[G\sin\langle G,w\rangle\mathbf 1_{\{|G|\le2\sqrt m\}}]-we^{-|w|^2/2}\bigr|\le\mathbb E[|G|\mathbf 1_{\{|G|>2\sqrt m\}}]\le e^{-c'm}$，C--S 用 $\mathbb E|G|^2$ 有限乘尾部 $2e^{-cm}$ 开方。

网计数。$|\mathcal V|\le17^m$（单位球 $\frac18$-网），$|\mathcal W|\le(1+2m^{45})^m=\exp(O(m\log m))$（半径 $m^{42}$ 球的 $m^{-3}$-网，directions-proof.tex:65--73；打包论证：$\frac18$-网用 $17^m$ 是把球体积比 $(1+2\cdot8)^{m/1}$ 型粗放的具名常数，我在草稿纸上按 $(1+2/\rho)^m$ 公式核对 $\rho=\frac18$ 得 $17^m$，一致）。union over $(s,v,w)$：$m^3\cdot17^m\cdot(1+2m^{45})^m\cdot2e^{-c'm^4}\to0$，指数阶 $m^4$ 对 $m\log m$，安全。

从网到球与 Lipschitz 延拓。内积界经 $\frac18$-网放大 $\frac87$：$|x|\le\frac{\max_{v_0\in\mathcal V}|\langle x,v_0\rangle|}{1-\frac18}$，网点上标量偏差界 $\frac1{2\sqrt m}$（即 concentration 的 $u$）遂升级为向量偏差 $|x|\le\frac87\cdot\frac1{2\sqrt m}=\frac4{7\sqrt m}$（directions-proof.tex:77--79 逐字"bounds on inner products with a $1/8$-net control the Euclidean norm with factor $8/7$"，$(1-\frac18)^{-1}=\frac87$，我把这条读作 $\frac4{7\sqrt m}$ 的全部来历）。经验函数对 $w$ 的 Lipschitz：$\le$ 截断 $|g_{s,i}|^2$ 均值 $\le4m$；目标 $w\mapsto we^{-|w|^2/2}$ 是 $2$-Lipschitz；网距 $m^{-3}$：
\[
\frac4{7\sqrt m}+e^{-c'm}+(4m+2)m^{-3}\le\frac2{\sqrt m}
\]
（directions-proof.tex:87--90），我的验算：$\frac47<2$ 余量巨大，$(4m+2)m^{-3}=O(m^{-2})\ll m^{-1/2}$。得 dir:gaussian-approximation 的 $\frac2{\sqrt m}$。

协方差块。$\langle v,G\rangle^2\mathbf 1_{\{|G|\le2\sqrt m\}}\le4m$，期望偏离 $1$：$\bigl(\mathbb E\langle v,G\rangle^4\bigr)^{1/2}\Pr\{|G|>2\sqrt m\}^{1/2}=\sqrt3\cdot(2e^{-cm})^{1/2}\le e^{-c'm}$（$\mathbb E\langle v,G\rangle^4=3$，directions-proof.tex:98--104）。取 $u=\frac18$：$\frac{Nu^2}{B^2}=\frac{m^6\cdot\frac1{64}}{4m}=\frac{m^5}{256}$ 级尾，union over $s$ 与 $\mathcal V$ 趋零。对称矩阵网引理 $\|A\|_{\mathrm{op}}\le(1-2\rho)^{-1}\max_{v\in\mathcal V}|\langle Av,v\rangle|$（$\rho=\frac18$，directions-proof.tex:113--115）给
\[
\|M_s-I_m\|_{\op}\le\frac1{1-\frac28}\Bigl(\frac18+e^{-c'm}\Bigr)<\frac12,
\]
特征值落 $[\frac12,\frac32]\subset[\frac12,2]$，dir:norms 第三句闭合（directions.tex:23--24）。

性质 3 段。单族单方向：$\Pr\{\max_i|\langle v,g_{s,i}\rangle|>10\sqrt{\log m}\}\le2Ne^{-50\log m}=2m^6\cdot2m^{-50}$… tex 在 directions-proof.tex:125--128 逐字给 $2Ne^{-50\log m}=2m^{-44}$：一维尾 $\Pr\{|Z|>10\sqrt{\log m}\}\le e^{-50\log m}=m^{-50}$（高斯尾 $2e^{-t^2/2}$ 的 $2$ 并入 union），对 $N=m^6$ 求和得 $2m^6\cdot m^{-50}=2m^{-44}$。半数坏：未条件化时跨 $s$ 独立（directions-proof.tex:130--132 逐字），$\Pr\{\ge S/2\ \text{bad}\}\le2^S(2m^{-44})^{S/2}$（directions-proof.tex:133--135）。半径 $\frac1m$ 球面网 $|\mathcal N|\le(1+2m)^m$ union：$(1+2m)^m\cdot2^{m^3}\cdot(2m^{-44})^{m^3/2}$，对数 $\le m\log(2m)+m^3\log2-\frac{m^3}2(44\log m-\log2)\to-\infty$ 极快。净点转移：$|v-v_0|\le\frac1m$ 时 $|\langle v-v_0,g_{s,i}\rangle|\le\frac1m\cdot2\sqrt m=\frac2{\sqrt m}$（directions-proof.tex:139--143），$10\sqrt{\log m}+\frac2{\sqrt m}\le11\sqrt{\log m}$（$\frac2{\sqrt m}\le\sqrt{\log m}$ 于大 $m$），故 tex 宣布 $C=11$（directions-proof.tex:144）。最后与范数事件（全 $SN=m^9$ 样本，$1-2m^9e^{-cm}\to1$，directions-proof.tex:117--119）、不平行事件（a.s.，directions-proof.tex:120--121）相交，引理闭合。我重算这条链时确认：union 预算真正被消费的两处是 $\frac{m^4}{16}$（性质 2 与协方差）与 $\frac{m^3}2\cdot44\log m$（性质 3），网数 $\exp(O(m\log m))$ 同时喂不饱任何一侧，与第 5 节 (b) 的定性叙述逐项对应。

## 21. 修补与界面的对数算术：repair、metric 与旋转常数的显式重排

旧稿第 7、8 节里那些 $\delta$、$\log(r/\delta)$ 的口头账，这次全部写成数学并核对到行号。记 $\Delta$ 表示内积 $\langle P_v-P_z,P_y-P_z\rangle$ 那类角量、$\delta=\delta(v,z)$ 图表内距离。

Gram 构造（rep:eq:gram，repair.tex:47--49）：$\langle q_v,q_w\rangle=4\int_0^re^{-\delta(v,w)/l}\,dl$，约定 $e^{-\infty}=0$（repair.tex:46）。正定性两根：单坐标 $t\mapsto\mathbf 1_{[b,t]}$ 进 $L_2$ 给平方距离 $|t-t'|$（repair.tex:50--54），故图表内 $\ell_1$ 倍数 $\delta$ 是平方 Hilbert 距离；对 Hilbert 向量 $h_v$，$e^{-|h_v-h_w|^2/l}=\mathbb E\cos(\sqrt{2/l}\,\langle G,h_v-h_w\rangle)$ 半正定（repair.tex:56--59），余弦即 $(\cos,\sin)$ 配对内积，Schoenberg 判据的有限形式；$\int_0^r(\cdot)\,dl$ 保持半正定，Gram 可实现。

距离公式（rep:eq:distance，repair.tex:33--36）：对角元 $\langle q_v,q_v\rangle=4\int_0^rdl=4r$（repair.tex:87），于是
\[
|q_v-q_w|^2=2\cdot4r-2\cdot4\int_0^re^{-\delta/l}\,dl=8\int_0^r\bigl(1-e^{-\delta(v,w)/l}\bigr)\,dl\le8r .
\]
我在草稿纸上把因式分解核心（repair.tex:70--78）重写：取 $a=\delta(v,z)$、$b=\delta(y,z)$，三角不等式给 $\delta(v,y)\le a+b$，$e^{-x}$ 递减给
\[
1-e^{-a/l}-e^{-b/l}+e^{-\delta(v,y)/l}\;\ge\;1-e^{-a/l}-e^{-b/l}+e^{-(a+b)/l}\;=\;(1-e^{-a/l})(1-e^{-b/l}),
\]
右端恒等式是我当场展开验证的：$(1-e^{-a/l})(1-e^{-b/l})=1-e^{-a/l}-e^{-b/l}+e^{-(a+b)/l}$ ✓。设 $t=\min\{r,a,b\}$，$0<l<t$ 时 $e^{-a/l}\le e^{-1}$、$e^{-b/l}\le e^{-1}$，乘积 $\ge(1-e^{-1})^2$，故
\[
\langle q_v-q_z,q_y-q_z\rangle=4\int_0^r\bigl(1-e^{-a/l}-e^{-b/l}+e^{-\delta(v,y)/l}\bigr)\,dl\;\ge\;4(1-e^{-1})^2\,t .
\]
数值闭合：$1-e^{-1}=0.6321\ldots$，平方 $=0.3996\ldots$，乘 $4$ 得 $1.598\ldots\ge1$（repair.tex:81--83 直接写 $\ge t$）。角配对恒等式我顺手复核：$\langle q_v-q_z,q_y-q_z\rangle=\frac12(|q_v-q_z|^2+|q_y-q_z|^2-|q_v-q_y|^2)$，代 rep:eq:distance 恰得上述被积式 ✓。合成：$\langle Z_v-Z_z,Z_y-Z_z\rangle=\Delta+|q\text{部角}|\ge -t+1.598\,t>0$，rep:eq:angle（kernel.tex:256--259）成立，$Z_v=(P_v,q_v)$（repair.tex:84--85）。

局部界（rep:eq:local，repair.tex:37--41）：$1-e^{-s}\le\min\{1,s\}$，原函数我在草稿纸上重推：
\[
\int_0^r\min\{1,\delta/l\}\,dl=\int_0^\delta1\,dl+\int_\delta^r\frac\delta l\,dl=\delta+\delta\log\frac r\delta=\delta\Bigl(1+\log\frac r\delta\Bigr),
\]
乘 $8$ 即 rep:eq:local（repair.tex:88--92 逐字给出同一原函数）；$\delta=0$ 时被积恒零，$q_v=q_w$（repair.tex:93--94）。

界面代入（metric.tex:54--63）。$\delta=C_0\tau\frac mN\log m$，代数字：$\tau\frac mN=m^{-2000}\cdot m^{-5}=m^{-2005}$，$\delta=C_0m^{-2005}\log m<r=m^{-8}$（差 $1997$ 个 $\log m$）。对数比逐字（metric.tex:58--61）：
\[
\log\frac r\delta=-8\log m-\log\bigl(C_0m^{-2005}\log m\bigr)=1997\log m-\log(C_0\log m)=O(\log m),
\]
我验算常数 $1997=2005-8$，而 $2005=2000+5$ 由 $\tau$ 指数加 $N/m$ 指数拼成，与前向三幂 $2000,8,5$ 的会师叙述（第 6 节 (c)）一致。合成相邻界（met:eq:adjacent，metric.tex:17--21）：$d((s,x),(s,x'))=|P_v-P_z|^2+|q_v-q_w|^2\le\delta+8\delta(1+O(\log m))\le C\tau\frac mN(\log m)^2=Cm^{-2005}(\log m)^2$。宏观界（met:eq:macro，metric.tex:10--15）：$\bigl|d(v_s(\theta),v_t(\eta))-c_*\sqrt m|\theta-\eta|\bigr|\le\frac r{10}+8r\le Cr$，第一项 ker:rounded-distance、第二项 rep:eq:distance。

平均与凹性一步（metric.tex:86--94，旧稿 ASCII 处）：$\mathbb E|\theta-\eta|^2=\frac{2m}3$（每坐标差方差 $=2\operatorname{Var}(U(-1,1))=\frac23$），$|\theta-\eta|\le2\sqrt m$（$T$ 对角半长 $\sqrt m$）。在 $x\in[0,4m]$ 上 $\sqrt x\ge\frac x{2\sqrt m}$（等价 $\sqrt x(1-\frac{\sqrt x}{2\sqrt m})\ge0$），取期望：$\mathbb E|\theta-\eta|\ge\frac{\mathbb E|\theta-\eta|^2}{2\sqrt m}=\frac{2m/3}{2\sqrt m}=\frac{\sqrt m}3$ ✓（metric.tex:91）。再 $\mathbb E d\ge c_*\sqrt m\cdot\frac{\sqrt m}3-Cr=\frac{c_*}3m-Cm^{-8}\ge cm$ 得 met:eq:average（metric.tex:92--94）。直径：$\operatorname{diam}(U)=\sqrt{(4)^2m}=4\sqrt m$ 代 macro 给 $\operatorname{diam}(V,d)\le4c_*m+Cr\le Cm$（metric.tex:82--84）。顶点计数：$H\le N(1+8\sqrt m/\tau)$（metric.tex:65--70，$\frac{8\sqrt m}\tau=8m^{2000.5}$），$\sum_{j=0}^m\binom Hj\le(\frac{eH}m)^m=\exp(O(m\log m))$，乘 $S=m^3$ 不变阶（metric.tex:78--81）。

旋转闭合（con:lem:cube 内部，contraction.tex:47--74）：$\psi(t)=2\Phi(t)-1$，$\sup|\psi'|=\sqrt{2/\pi}$（$\psi' = 2\varphi$ 在 $0$ 取最大 $2\cdot\frac1{\sqrt{2\pi}}=\sqrt{\frac2\pi}$）；条件化 $\mathbb E[|\langle v,Y'\rangle|\mid Y]=|v|\,\mathbb E|G_1'|=|v|\sqrt{2/\pi}$（$\mathbb E|G_1'|=\sqrt{2/\pi}$ 一维半正态均值）。两处相乘 $\frac2\pi$，弧长 $\int_0^{\pi/2}dt=\frac\pi2$：
\[
\E|h(\theta)-h(\eta)|\le\int_0^{\pi/2}\frac2\pi\,\E|\nabla h(\Psi(Y(t)))|\,dt=\frac2\pi\cdot\frac\pi2\cdot\E|\nabla h(\theta)|=\E|\nabla h(\theta)|,
\]
常数 $\frac2\pi\cdot\frac\pi2=1$ 精确闭合（contraction.tex:67--71），这解释台账行"$\sqrt{2/\pi}$ 两见乘 $\pi/2$ 弧长"：两个 $\sqrt{2/\pi}$ 因子（Jacobian 与半正态均值）合成 $\frac2\pi$，被 $\frac\pi2$ 抵消。我在草稿纸上曾试 $t\in[0,\pi]$ 加倍弧长，立刻发现旋转周期与独立性要求 $Y(t),Y'(t)$ 各自标准高斯只随 $\cos t,\sin t$ 参数化保持（联合分布由 $O(2)$ 不变性），任意区间长度只改常数不改阶，最终 tex 取 $\frac\pi2$ 恰好覆盖两端点 $\Psi(G),\Psi(G')$ 的连续形变路径，一步到位。
