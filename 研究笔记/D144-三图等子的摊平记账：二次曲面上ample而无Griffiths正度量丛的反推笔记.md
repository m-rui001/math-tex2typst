# D144 三图等子的摊平记账：二次曲面上 ample 而无 Griffiths 正度量丛的反推笔记

## 0 素材实测清单与登记

素材取自 `preprints/ample-rank-two-bundles-on-the-quadric-surface-without-griffiths-positive-metrics-September-24-2026/build`，对应队列第 40 行号那条。正文素材只允许来自 build 目录下的 `.tex`，我用 `wc -c` 实测的清单如下。

| 文件 | 字节数 |
| --- | --- |
| `build/paper.tex` | 2183 |
| `build/sections/01-introduction.tex` | 11942 |
| `build/sections/02-construction.tex` | 8203 |
| `build/sections/03-ampleness.tex` | 6681 |
| `build/sections/04-limit.tex` | 14471 |
| `build/sections/05-obstruction.tex` | 12856 |
| `build/sections/06-conclusion.tex` | 1309 |
| 合计（7 个 `.tex`） | 57645 |

字节数与派单里给的实测布局逐项吻合。同目录下另有 `references.bib` 11418 B，规格把正文素材限定在 `.tex`，我只登记它的存在，把里面的著录信息留给 tex 源码里出现的引注键名去承载。PDF 一个没碰，语料已加密，`pdftotext` 也没运行；typst 分片按约束排除在素材之外。

入口文件 `build/paper.tex` 的骨架：标题在 36 到 39 行，日期行写 `\date{September 24, 2026}`；摘要 42 到 48 行，第一句就是 `We give counterexamples to Griffiths' conjecture in rank two on the quadric`；正文六片的 `\input` 顺序在 50 到 55 行，依次是 introduction、construction、ampleness、limit、obstruction、conclusion。这个顺序本身就是叙事顺序：先造对象，再证 ample，再造极限对象，最后排除。我在第 10 节会回到这个顺序，因为它跟实际发现的顺序几乎相反。

Lean 侧登记，按派单锁定的行号区间实测复核。`E:\math\lean\formalization.yaml` 第 1426 行是 `- comparator_config: ComparatorChallenges/QuadricBundles.json`，1427 行是 `declaration: OAI.QuadricCounterexample.main_theorem`，1428 行是 `file: OAI/Geometry/QuadricBundles/Main.lean`。`lean/ComparatorChallenges/QuadricBundles.json` 里 `solution_module` 写作 `OAI.Geometry.QuadricBundles.Main`，`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice` 三条，`enable_nanoda` 为 false。题面文件 `lean/ComparatorChallenges/QuadricBundles.lean` 里声明了完整的形式化语言：`structure AlgebraicRankTwoBundle`、`IsPowerPullbackTwist`、`SymmetricSection`、`GivesClosedProjectiveEmbedding`、`IsAmple`、`SmoothHermitianMetric` 与 `StrictlyGriffithsPositive`，最后 `theorem main_theorem : SourceMainTheorem := by sorry` 把担子交出来。解答侧 `lean/OAI/Geometry/QuadricBundles/` 实测有 34 个 `.lean`，最大四个是 `Removability.lean` 47591、`Graphs.lean` 37601、`TraceMetrics.lean` 34072、`BinaryForms.lean` 29823，全部字节数在第 11 节登记成表。

取证预算交代一次：正文七片全读，题面文件全读，`Main.lean` 与 `Model.lean` 全读，其余模块只做了目录级 import 映射与定点行段抽取（`Graphs.lean` 的 500 至 610、860 至 900 行，`Noncollapse.lean` 的 225 至 285 行，`Ampleness.lean` 全文），加一次网络检索。没有对整个 lean 仓做递归 grep，没有跑 git。

## 1 初始动机与最初的猜想

我进入这个问题的位置，是 Hartshorne 1966 的定义和 Griffiths 1969 的问题条目这两篇文献的缝里。`01-introduction.tex:4-7` 的原文：

```
A holomorphic vector bundle $E$ on a projective variety is ample when
the tautological quotient line bundle $\OO_{\PP(E)}(1)$ is ample;
here $\PP(E)$ parametrizes one-dimensional quotients
\cite[Proposition~3.2]{Hartshorne1966}.
```

紧跟着 `01-introduction.tex:8-12`：

```
A smooth Hermitian metric is strictly Griffiths-positive if its Chern
curvature is positive in every pair of nonzero tangent and fiber
directions. Such a metric implies ampleness. Griffiths' conjecture asks
for the converse on smooth complex projective varieties
\cite[Problem~(0.9)]{Griffiths1969}.
```

最初的动机就一句话：正向蕴含是教科书习题级的（正曲率度量推 ample），反向在射影簇上一直是悬案，而我想看清反向到底在哪一维、哪一秩第一次断裂。我当时有一个过强的猜想，觉得反例应该是"现成的"：既然曲线上 Hartshorne 1971 用商丛次数刻画了 ampleness，Umemura 1972 与 1973 把曲线情形逐条闭环，那么断裂必然出现在曲面，而且大概随便抓一个非直和的 rank 2 丛就能撞上。这个猜想的错误成分后来被摊开：曲面的"随便抓"根本抓不住，因为障碍藏在动力学问子结构里，必须把丛本身构造成动力学的囚笼。`01-introduction.tex:62-63` 那句 `These results make a surface the first possible base dimension` 是我保留的第一条硬约束：基空间维数不能低于 2。

最初的猜想还带一个我当时没有察觉的贪心成分：我想找一个固定的丛 $G$，让 $G$ 自己 ample 又没有正度量。写下来才发现这条路对"极限机制"毫无帮助。真正的定理形态在 `01-introduction.tex:23-31`：

```
\begin{theorem}\label{thm:main}
There is an algebraic vector bundle $G$ of rank two on $S$ such that,
for every positive integer $m$, the bundle
\[
 E_m=f_m^*G\otimes P
\]
is ample. There is an integer $m_0$ such that $E_m$ admits no smooth
Hermitian metric with strictly Griffiths-positive Chern curvature
for every $m\ge m_0$.
\end{theorem}
```

一个 $G$ 生出整族 $E_m=f_m^*G\otimes P$，每个成员都 ample，而所有充分大的成员都没有光滑严格 Griffiths 正度量。$S=\mathbb P^1\times\mathbb P^1$，$P=\mathcal O_S(1,1)$，$f_m$ 在两个因子各自把齐次坐标提升到 $m$ 次幂（`01-introduction.tex:14-17` 与 `01-introduction.tex:20-21`，后者写明 `Thus $\deg f_m=m^2$ and $f_m^*P\simeq P^m$`）。为什么非要整族？我在第 4 节失败路线里会把理由逼出来：幂映射 $f_m$ 的角色是让固定的挠因子 $P$ 在 $1/m$ 归一化里蒸发，单靠一个丛做不了这个蒸发。

第二个猜想是关于障碍形态的。既然严格正度量在纤维上给出正定 Hermitian 方阵，它的对偶平方范数是 psh 的，那么对偶丛 $F=G^\vee$ 上的任何"极限正性证据"都应该收敛成一个 psh 的纤维二次函数。只要我能造一个 $G$，让 $F$ 上根本不存在非零的、处处纤维二次的 psh 函数，度量就不可能存在。这个逆向工程式的思路，先列出正性推论长什么样，再把推论本身掐死，是整篇的骨架。`01-introduction.tex:172-180` 的 "A nonzero quadratic limit" 段与 `01-introduction.tex:187-203` 的 "Incompatible invariances" 段就是它的目录化版本。

## 2 外部血统核实：检索结果与我不肯硬编的部分

正文能引的谱系我先从 tex 内部整理，再用一次网络检索核对外部。tex 里的正向定理清单（`01-introduction.tex:65-75`）：Berndtsson 2009 证明 ample 的 $E$ 给出 $E\otimes\det E$ 的 Nakano 正性；Liu--Sun--Yang 2013 把行列式挠对称幂与充分大对称幂的 Nakano、对偶 Nakano 正性做全。原文关键句在 `01-introduction.tex:73-75`：`they do not supply a Griffiths-positive metric on $E$`。这几条是"改装后恢复曲率"的正定理，离原猜想始终差一层改装。解析路线那一段（`01-introduction.tex:77-86`）列了 Demailly 的 Hermitian--Yang--Mills 系统、Pingali 对初等系统局限的诊断与曲面直和情形的求解、Murakami 用 Demailly 系统对曲线情形的完整解析证明。Finsler 一侧（`01-introduction.tex:88-99`）有 Kobayashi 用 $E^*$ 上的负曲率强伪凸结构刻画 ampleness，以及 Lempert 2026 的构造性失败： equivariant 的纤维逐点规则可以把规定好的正 tautological 度量送到连半正 Hermitian 度量都造不出来的地方。

与本篇同时段的两个邻居也登记清楚。`01-introduction.tex:104-116`：Du--Xie 在 2026 年 9 月 22 日的预印本宣称在椭圆曲线乘积 $C\times C$（$y^2=x^3-x$）上造出秩 2 ample 丛没有光滑 Griffiths 半正度量；他们的另一篇给出用伴随-Levi 障碍刻画 Griffiths 正性的一阶 jet 判据。`01-introduction.tex:118-127`：Liu--Wan 的后续预印本宣称在每个 Hirzebruch 曲面（含 $\mathbb P^1\times\mathbb P^1$）上有斜稳定、无半正 Kobayashi 曲率 Finsler 度量的秩 2 ample 丛。两篇与本篇的区别写在原文里：Du--Xie 是半正度量的排除且基在阿贝尔面上，Liu--Wan 约束的是 Finsler 曲率，本篇给出的是有理二次曲面上、带指定幂映射族、带全 $m$ ample 证书的严格正 Hermitian 度量排除。

外部检索这边我做了一次标题级查询，命中的是周边，并非正面：arXiv 2012.12815（关于 Griffiths 猜想在 Chern--Weil 形式正性方向的注记）、Journal of Algebraic Geometry 2013 的一篇文章、以及 ample 丛 Schur 类高次正性（肖建的工作）一类的中文研讨班记录。这些结果全部默认"Griffiths 正性是比 ample 强的条件、二者等价性在秩至少 2 时存疑"这个格局，跟 tex 里的叙述吻合。派单里提到"Hartshorne 型反例与后来的强 Fano 三例"这条谱系线索，我检索后没有落到可以逐字核实的文献，所以在这篇笔记里我拒绝把"强 Fano 三例"当成已知血统来硬编；我能负责任地写出来的只有：截至我手里的材料，ample 推 Griffiths 正度量这一方向在曲线上成立、在曲面上被本篇与两个邻居的预印本否定，中间不存在我能够点名的经典秩 2 反例序列。第 11 节还会看到，Lean 题面的 `enable_nanoda: false` 与三条允许公理，说明形式化目标刻意停留在 ZFC 级公理内，血统核查完全靠文献层完成。

## 3 错误路线之一：正面求解 HYM 方程与"现成分裂"的诱惑

第一条被我浪费掉的路线，是把 Demailly 2021 与 2022 的 Hermitian--Yang--Mills 型方程组直接当成算法来用：给定 ample 的 $E_m$，跑一个曲率泛函梯度流，赌它收敛到严格 Griffiths 正度量。这条路在概念上就站不住，理由分两层。浅的一层：HYM 型方程解出来的度量曲率满足的是 Hermite--Einstein 型等式，而 Hermite--Einstein 存在性受斜稳定性控制，ample 与斜稳定之间没有任何一般蕴含；就算流收敛，收敛对象的曲率也不控制在"每个切方向与纤维方向二元组都正"这个尺度上。深的一层在 `01-introduction.tex:79-82` 已经写明：`Pingali identified a limitation of the initial system and solved a related system for direct sums of ample line bundles on Riemann surfaces`，连曲线情形都要先限定到"ample 线丛直和"才解得动，而直和恰恰是我这个构造要逃开的形状。

与 HYM 诱惑同构的第二条死路是"现成分裂"：在 $\mathbb P^1\times\mathbb P^1$ 上，任何秩 2 丛在一般点处沿某条叶的限制都分裂成两个线丛 $\mathcal O(a)\oplus\mathcal O(b)$；如果两个次数都非负，正度量似乎沿叶可拼。我当时的草稿是沿两条叶分别拼乘速度量、再对 $S$ 做张量积修补。失败原因可以精确到引理：沿叶分裂对一般点成立，但对 $G^\vee$ 的两条线子丛 $\iota_i$ 的像而言，它们在 $D$ 上按提升映射 $\alpha$ 强制粘合，叶方向的分裂延拓不到 $D$ 上；而 `05-obstruction.tex:35-38` 极大原理那一步告诉我，任何试图沿单条叶做平均的操作最后都被压回"与另一叶坐标无关"的函数，拼出来的候选度量在极限里丢失了全部交叉信息。更硬的否决来自 Lempert 的方向性结果（`01-introduction.tex:95-99`）：即便从一个规定好的正 tautological 度量出发，逐纤维的 equivariant 规则连半正 Hermitian 都可能产不出来。任何"从正分量逐点拼正整体"的算法族都被这一条判了缓刑。

[推测] 我还猜过一条更便宜的路线：直接取 $\mathbb P^1\times\mathbb P^1$ 上的 Euler 型序列或者 tangent bundle 的变形，赌它 ample 而曲率有负方向。这条在曲线判据面前不堪一击，秩 2 且行列式为 $\mathcal O(2,2)$ 类这些现成对象在每条叶上的商次数都能被 Hartshorne 曲线刻画正向地兜住，根本到不了"全 $m$ ample"那么强的证书。[推测] 另一条试错：把障碍寄托在 $c_2$ 与 $c_1^2$ 的不等式上，想用 Miyaoka–Yau 型不等式排除正度量。正曲率丛的 Chern 类不等式族全是必要条件，我需要一个从"极限对象不存在"出发的充分性排除，数值不等式给不了这个强度。这两条都在写代码之前被纸面计算否决，但否决它们的直觉，后来都转化成正面构造里的约束条件：分裂延拓失败转化为等子定义，$c_2$ 路线失败转化为测度质量守恒引理。

## 4 错误路线之二：朴素极限与"蒸发不掉"的 $P$

第二条大弯路发生在极限机制上。我最初的极限方案是逐点的：给 $E_m$ 的任意正度量取对偶平方范数，直接对 $m$ 归一化后逐点取上确界再取上半连续正则化。这在单复变里就露馅。`04-limit.tex:196-205` 把反例钉在原文里：

```
The measurable form is defined only up to a set of measure zero in
the base. Even a
pointwise limit of the traces may fail to be plurisubharmonic: in one
base variable, tracing $(1+|y|^2)|v|^2$ through $x=y^m$ gives
\[
 (1+|x|^{2/m})|v|^2.
\]
Its pointwise limit has coefficient $1$ at $x=0$ and $2$ elsewhere,
whereas its plurisubharmonic representative has coefficient $2$
everywhere.
```

逐点极限在原点是 1、别处是 2，而它该有的 psh 代表元必须处处 2。逐点极限在零测集上撒谎，上半连续正则化又可能把函数从二次结构里捏走。这个失败教会我的事后来变成 `04-limit.tex:209-217` 的正面对策：先取分布意义的系数极限，再用径向卷积族 $H_\delta$ 单调下降到一个有限 psh 函数，最后用"每个矩阵元由 $e_j$、$e_j+e_k$、$e_j+i e_k$ 三个有限取值决定"把二次性从几乎处处提升到每个纤维上。

另一个早期误判是以为可以不带挠 $P$ 做极限。如果直接平均 $f_m^*G$ 的度量，归一化后的极限会继承 $f_m$ 的 $m^2$ 重覆盖带来的发散权重；而 $E_m=f_m^*G\otimes P$ 里的 $P$ 在对偶侧是 $P^{-1}$，其转移函数的绝对值带因子 $\lvert g\rvert^{2/m}$，随 $m$ 增大指数式趋近 1。关键转折点就在这里：`04-limit.tex:58-74` 的 trace 公式 $q_{m,t}(x,v)=\frac{1}{m^2}\sum_{y\in f_m^{-1}(x)}\lVert v\otimes(f_m^*t)^{1/m}(y)\rVert_{m,y}^2$ 用一个局部 $m$ 次根把 $P^{-m}\simeq f_m^*P^{-1}$ 的整张挠吸收掉，根的多值性只贡献平方范数无关的 $m$ 次单位根。这一步把"$P$ 蒸发不掉"变成了"$P$ 自动蒸发"。我当时在这一步之前卡了整整一轮草稿，卡在试图用全局 $m$ 次根：$P^{-1}$ 没有全局 $m$ 次根帧，这个贪心被 `04-limit.tex:66-72` 的局部对数论证替代。

[推测] 第三个失败路线：把归一化条件设在总空间的 sup 范数上。$\sup q_{m,t}$ 在 $S$ 上未必有限，正度量族没有先验 $C^0$ 界。`04-limit.tex:113-118` 的补救是把归一化搬到背景单位球丛上：$\max_{x\in S,\ \lvert v\rvert_0=1}N_m(x,v)=1$，紧性保证最大值存在，缩放不改曲率。[推测] 第四个：用 Arzelà–Ascoli 直接对度量族取一致收敛子列。分支轨迹处根的重合只给连续族，没有任何等度连续，这条路在 trace 定义出现之前就是死的。[推测] 第五个更隐蔽：先假设度量族有一致曲率下界再做极限。`06-conclusion.tex:24-25` 明确写了最终论证 `requires no uniform estimates for the input metrics or their curvature`，反推可知我曾经上过这条需要一致估计的贼船，代价是 $m_0$ 从"无效但存在"退化为"依赖一族未知常数"，整条 compactness 论证的廉价性没了。

## 5 $A$、$B$ 与 $b=24$：阶与动力学的两头账

### 5.1 引理 `lem:matrix-data` 的四段重建

(a) 逐字引用。矩阵数据写在 `02-construction.tex:19-24`：

```
\begin{equation}\label{eq:matrices}
 a=e^{i\pi/3},\qquad
 s=\frac12-\frac{i(1+2\sqrt2)}{2\sqrt3},\qquad
 A=\begin{pmatrix}a&0\\0&a^{-1}\end{pmatrix},\qquad
 B=\begin{pmatrix}s&1\\ \sqrt2/3&1-s\end{pmatrix}.
\end{equation}
```

命题正文在 `02-construction.tex:28-33`：

```
The matrices $A,B$ belong to $\SL_2(\CC)$ and satisfy
\[
 \tr A=\tr B=1,\qquad
 \tr(A^{-1}B)=-\sqrt2,\qquad
 \tr(AB)=1+\sqrt2.
\]
```

阶的结论在 `02-construction.tex:34-37`：`The orders of $A$, $B$, and $A^{-1}B$ in $\SL_2(\CC)$ are $6$, $6$, and $8$, respectively. The induced projective orders of $A$ and $B$ are both $3$. The matrix $AB$ has two positive real reciprocal eigenvalues of distinct moduli, and $A,B$ have no common eigenline.`

(b) 中间步骤补齐。正文把验证压成了两行，我把手算补全。第一，$s$ 的实部恰为 $\frac12$，所以 $1-s=\bar s$，于是 $s(1-s)=\lvert s\rvert^2=\frac14+\frac{(1+2\sqrt2)^2}{12}=\frac14+\frac{9+4\sqrt2}{12}=\frac{12+4\sqrt2}{12}=1+\frac{\sqrt2}{3}$，这正是 `02-construction.tex:42-43` 的第一式。由此 $\det B=s(1-s)-1\cdot\frac{\sqrt2}{3}=1+\frac{\sqrt2}{3}-\frac{\sqrt2}{3}=1$，且 $\operatorname{tr}B=s+(1-s)=1$，$B\in\operatorname{SL}_2(\mathbb C)$ 落定。第二，$a=e^{i\pi/3}$ 满足 $a+a^{-1}=2\cos\frac{\pi}{3}=1$，故 $A+A^{-1}=\operatorname{Id}$（`02-construction.tex:53`），Cayley--Hamilton 给出特征多项式 $t^2-t+1$，根为 $e^{\pm i\pi/3}$，$A$ 在 $\operatorname{SL}_2(\mathbb C)$ 中阶为 $6$，且 $A^3=-\operatorname{Id}$（`02-construction.tex:51`），射影阶 $3$。$B$ 与 $A$ 共享同一特征多项式，同阶。第三，$\operatorname{tr}(A^{-1}B)=a^{-1}s+a(1-s)=-\sqrt2$ 是 `02-construction.tex:44` 的第二式，展开即 $2\Re(a^{-1}s)$ 型恒等式，虚部恰好消净。于是 $A^{-1}B$ 的特征多项式 $t^2+\sqrt2 t+1$，根 $e^{\pm 3i\pi/4}$，阶 $8$（`02-construction.tex:48-49`）。第四，`02-construction.tex:53-56` 的迹账：

```
Cayley--Hamilton gives $A+A^{-1}=\Id$. Multiplication by $B$ and
taking traces therefore yield
\[
 \tr(AB)=\tr B-\tr(A^{-1}B)=1+\sqrt2>2.
```

我用矩阵乘积硬核：$AB=\begin{pmatrix}as&a\\ a^{-1}\frac{\sqrt2}{3}&a^{-1}(1-s)\end{pmatrix}$，其迹 $as+a^{-1}(1-s)$；由 $A+A^{-1}=\operatorname{Id}$ 右乘 $B$ 得 $AB+A^{-1}B=B$，两边取迹 $\operatorname{tr}(AB)=1-(-\sqrt2)=1+\sqrt2\approx 2.414>2$。$\det(AB)=1$ 且迹大于 $2$，特征多项式 $t^2-(1+\sqrt2)t+1$ 的判别式 $(1+\sqrt2)^2-4=2\sqrt2-1>0$，两根同号、乘积 $1$、和为正，故为互倒的正实根且模不同，扩张因子 $R=\frac{1+\sqrt2+\sqrt{2\sqrt2-1}}{2}>1$。第五，无公共特征线：$A$ 的特征线是两条坐标线，而 $B$ 的两个非对角元 $1$ 与 $\frac{\sqrt2}{3}$ 都非零，任何一条坐标线都被 $B$ 搬走（`02-construction.tex:59-61`）。

(c) 常数与指数的机械理由。$\sqrt2$ 在 $s$ 的虚部与 $B$ 的左下元两处成对出现，是为了让三条迹同时落位：$B$ 左下元若改写作自由参数 $c$，则 $\det B=s(1-s)-c$ 与 $\operatorname{tr}(A^{-1}B)=a^{-1}s+a(1-s)$ 里只有前者吃 $c$，给定 $s$ 后 $\operatorname{tr}(A^{-1}B)=-\sqrt2$ 已锁死，而 $\det B=1$ 要求 $c=s(1-s)-1=\frac{\sqrt2}{3}$，取值唯一；分母 $3$ 来自 $\frac{(1+2\sqrt2)^2}{12}$ 展开后与 $\sqrt2$ 项的通分。所有常数住在 $\mathbb{Q}(i,\sqrt2,\sqrt3)$，这个"域尽量小"的选择在 Lean 侧有回声：`Graphs.lean:500-528` 的 `source_a_square`、`source_a_cube`、`source_a_twentyfour`、`source_graph_trace` 全部用 `linear_combination` 以多项式恒等式验证，若常数含嵌套根式或超越数，这些一步 `ring` 就过不了的关会拖垮整个 `MatrixDynamics` 线。阶 $6,6,8$ 的最小公倍数 $24$ 就是 `02-construction.tex:93-96` 的取法：

```
\begin{equation}\label{eq:construction-lines}
 b=24,\qquad L_1=p_1^*\OO_{\PP^1}(b),\qquad
 L_2=p_2^*\OO_{\PP^1}(b).
\end{equation}
```

节点相容要求 $M^{-1}N$ 的特征值 $\lambda$ 满足 $\lambda^{24}=1$（`02-construction.tex:140-146`），$6,6,8$ 都整除 $24$；`02-construction.tex:97-98` 原话：`The exponent $24$ is a common multiple of the orders $6,6,8$ of the specified relative linear lifts $A,B,A^{-1}B$.`。$24$ 同时进入 ample 计算：`03-ampleness.tex:115-116` 的第一行双次数里出现 $24m(n-2j)$，$L_1=\mathcal O_S(24m,0)$ 的限制，$L_1(-D)$ 因此是 $\mathcal O_S(21m,-3m)$。

[dense] 失败路线一：[推测] 我最早试的是对合对，$A$、$B$ 射影阶都是 $2$。两个对合的乘积可以是无穷阶，看起来够用；但障碍论证最后一步"至多两点支撑集上的置换、阶整除 $3$ 故平凡"依赖射影阶为奇数，二阶置换在两点集上可以是非平凡对换，矛盾链当场断掉。$3$ 是"大于两点集对称群阶 $2$ 的最小奇素数"，这个数论巧合后来变成硬约束。[推测] 失败路线二：把 $AB$ 取成抛物型（迹 $\pm2$），$AB$ 只有一个不动点 $p$，不变测度支撑于 $\{p\}$，$A$ 保支撑集则 $p$ 是公共不动点。看着可行，但环带 $C_n$ 论证需要两个模不同的特征值给出双曲结构，抛物型轨道在不动点附近按 $\frac1n$ 型漂移，"每个环带同测度"的分解不存在，我需要另写一套漂移引理，成本超过收益。[推测] 失败路线三：让 $A$、$B$ 生成有限子群（例如三角形群的两个生成元）。此时 $\mathbb P^1$ 上存在有限不变测度（轨道平均），障碍引理连"无不变测度"的前提都给不出。

### 5.2 引理 `lem:graph-divisor` 的四段重建

(a) 逐字引用，`02-construction.tex:71-75`：

```
\begin{lemma}\label{lem:graph-divisor}
The divisor $D$ has bidegree $(3,3)$ and exactly six singular points,
all ordinary transverse intersections of two components. There are
no triple intersections.
\end{lemma}
```

(b) 中间步骤补齐。每条 $\Gamma_M=\{(x,Mx)\}$ 是 $(1,1)$ 型：图由行列式条件 $\det(x,Mx)=0$ 型双线性方程定义，对两个因子各一次。三条图并起来双次数 $(3,3)$。$\Gamma_M\cap\Gamma_N$ 对应 $M^{-1}N$ 的不动点，即特征线：`02-construction.tex:80-82` 写明 `The relative matrices are $A,B,A^{-1}B$ or their inverses. Each has two distinct eigenvalues`，$A$、$B$ 的特征根 $e^{\pm i\pi/3}$ 互异，$A^{-1}B$ 的 $e^{\pm3i\pi/4}$ 互异，所以每对图横截交于两点。三重交点会给出 $A$、$B$ 公共特征线，被 `lem:matrix-data` 否决。三对交集共 $6$ 个点且两两不同：若 $\Gamma_I\cap\Gamma_A$ 里某点同时属于 $\Gamma_I\cap\Gamma_B$，它就成了 $\Gamma_A$ 与 $\Gamma_B$ 的交点，回到公共特征线。横截性由"不动点简单"给出：射影映射 $M^{-1}N$ 在不动点的乘数是两特征值之比，$\frac{e^{i\pi/3}}{e^{-i\pi/3}}=e^{2i\pi/3}\ne1$，$\frac{e^{3i\pi/4}}{e^{-3i\pi/4}}=e^{3i\pi/2}=-i\ne1$，两分支切方向不同。

(c) 每个假设的机械理由。$D$ 带约化结构（`02-construction.tex:69`：`where $D$ has the reduced structure.`）：第 6 节节点下降要用正合列 $0\to R/(xy)\to R/(x)\oplus R/(y)\to R/(x,y)\to0$，若 $D$ 带重数，第一条箭头就不再是以乘 $(x,y)$ 为注入的正合嵌入。普通二重点的要求来自第 7 节：局部基 $e=(1,h)$、$f=(0,d)$ 里 $d$ 要在每点恰有两个分支，节点是唯一让"$d$ 的非零因子性"与"两分支理想交等于乘积理想"同时成立的奇点类型。

[dense] 失败路线一：[推测] 最初我只用两条图 $\Gamma_I\cup\Gamma_A$。两条图给一个等子条件，得到的 $G$ 只有一个商列，第 7 节的交替滤过立刻瘫痪，因为交替需要两条商列把负次数配对。三条图恰好给出"两个商、三种粘合"的最小组合；两条不够，四条则节点数升到 $12$ 而不变测度论证不需要更多动力学。[推测] 失败路线二：把图换成曲线 $C\subset S$ 的一般选取，让粘合数据沿 $C$ 给。一般曲线没有 $M^{\otimes b}$ 这样的有限阶自对应，节点相容条件 $\lambda^b=1$ 无处可寻，$b$ 必须无限大，$L_i$ 的次数失控。[推测] 失败路线三：试过把 $D$ 的约化结构换成 $2D$ 重结构来"加强"对偶线丛在 $D$ 上的贴合，让第 9 节极大原理少用一次。重结构下局部方程是 $d^2$，局部基 $f=(0,d^2)$，商列核变成 $L_i(-2D)$，第 7 节 $K_1=\mathcal O_S(0\cdot m,-6m)$ 型双次数让 $K=K_1K_2$ 的正性救不回交替滤过，ample 链条断在第一次上同调消失之前。

## 6 构造逐引理重建：等子、节点下降与两条商列

### 6.1 命题 `prop:construction` 的四段重建

(a) 逐字引用，粘合命题与等子定义在 `02-construction.tex:107-117`：

```
\begin{proposition}\label{prop:construction}
These three isomorphisms glue to an algebraic isomorphism
\begin{equation}\label{eq:alpha}
 \alpha:L_1^{-1}|_D\xrightarrow{\sim}L_2^{-1}|_D,
 \qquad \alpha|_{\Gamma_M}=M^{\otimes b}.
\end{equation}
Let $\beta=(\alpha^\vee)^{-1}:L_1|_D\to L_2|_D$ and define
\begin{equation}\label{eq:equalizer}
 G=\bigl\{(u_1,u_2)\in L_1\oplus L_2:
          u_2|_D=\beta(u_1|_D)\bigr\}.
\end{equation}
```

商列与对偶粘合在 `02-construction.tex:118-130`：

```
Then $G$ is an algebraic vector bundle of rank two. Both projections
$\rho_i:G\to L_i$ are surjective, with exact sequences
\begin{equation}\label{eq:quotient-sequences}
 0\longrightarrow L_i(-D)\longrightarrow G
   \xrightarrow{\rho_j}L_j\longrightarrow0,
 \qquad \{i,j\}=\{1,2\}.
\end{equation}
For $F=G^\vee$, the dual inclusions
$\iota_i=\rho_i^\vee:L_i^{-1}\hookrightarrow F$ span each fiber
over $S\setminus D$ and satisfy
\begin{equation}\label{eq:dual-gluing}
 \iota_2\circ\alpha=\iota_1\qquad\text{on }D.
\end{equation}
```

(b) 中间步骤补齐。第一步，$\alpha$ 在每条 $\Gamma_M$ 上合法：$\Gamma_M\ni(x,Mx)$，$L_1^{-1}$ 在该点纤维是 $\tau_x^{\otimes b}$（$\tau$ 为 tautological 线），$M$ 诱导 $\tau_x\to\tau_{Mx}$ 的同构，取 $b$ 次张量幂得 $L_1^{-1}|_{\Gamma_M}\to L_2^{-1}|_{\Gamma_M}$，这就是 `02-construction.tex:103-105` 一句带过的 "the map $M$ on tautological lines induces an isomorphism from $L_1^{-1}$ to $L_2^{-1}$ by taking its $b$-th tensor power"。第二步，节点处两张图上的定义要一致：交点处取 $v$ 张成第一坐标线，$Nv=\lambda Mv$，$\lambda$ 是 $M^{-1}N$ 的特征值，则 $(Nv)^{\otimes 24}=\lambda^{24}(Mv)^{\otimes 24}=(Mv)^{\otimes 24}$，纤维层面两定义重合；反向对的特征值是 $\lambda^{-1}$，同样 $\lambda^{-24}=1$（`02-construction.tex:140-149`）。第三步，从"纤维值相等"到"整体 $\alpha$ 存在"需要下降：节点局部环 $R$、分支理想 $(x),(y)$，正合列在 `02-construction.tex:154-157`：

```
 0\longrightarrow R/(xy)\longrightarrow R/(x)\oplus R/(y)
   \longrightarrow R/(x,y)\longrightarrow0,
```

第三个箭头是两分支残值之差（`02-construction.tex:158`：`whose last map is the difference of the residue values`）。把它张量上局部自由秩一线丛 $\operatorname{Hom}(L_1^{-1},L_2^{-1})|_D$，核恰是"两分支值相等"的截面集合，于是分支同构下降成 $\Gamma_I\cup\Gamma_A\cup\Gamma_B$ 的整体同构；公共值非零，故下降标量在节点局部环里是可逆元。第四步，局部自由性：`02-construction.tex:166-172` 给出近 $D$ 的基

```
\begin{equation}\label{eq:local-basis}
 e=(1,h),\qquad f=(0,d).
\end{equation}
```

这里 $d$ 是 $D$ 的局部方程，$h$ 是 $\beta$ 模 $d$ 的标量的正则提升。验证"任意 $(u_1,u_2)\in G$ 唯一写成 $u_1e+kf$"：条件 $u_2|_D=hu_1|_D$ 等价于 $d$ 整除 $u_2-hu_1$，商 $k=\frac{u_2-hu_1}{d}$ 唯一存在，因 $d$ 非零因子（`02-construction.tex:173-175`）。$h$ 为什么是单位：$\beta$ 是同构，模 $d$ 的标量在每个点非零，即它在 $R/(d)$ 里是单位，Nakayama 给出缩小后 $h\in R^\times$。$D$ 外 $G=L_1\oplus L_2$ 平凡局部自由。第五步，商列：$\rho_1(e)=1$、$\rho_2(e)=h\in R^\times$，两个投影都满；$\rho_j$ 的核是"$j$ 坐标为零"的截面集，由 `eq:equalizer` 立刻识别为 $L_i(-D)$。第六步，对偶粘合按 `02-construction.tex:185-187` 的配对账：

```
 \bigl(\iota_2(\alpha v)\bigr)(u_1,u_2)
 = (\alpha v)(\beta u_1)=v(u_1)
 =\bigl(\iota_1(v)\bigr)(u_1,u_2),
```

关键恒等 $\alpha^\vee\beta=\operatorname{Id}$ 来自 $\beta=(\alpha^\vee)^{-1}$：$\langle\alpha v,\beta u\rangle=\langle v,\alpha^\vee\beta u\rangle=\langle v,u\rangle$。第七步，满秩：$S\setminus D$ 上 $G=L_1\oplus L_2$，$\iota_1,\iota_2$ 是两个直和项的对偶嵌入，逐纤维张成。这就是 `01-introduction.tex:148-149` 引 Maruyama 的话：`This is an elementary transformation in the sense of \cite[Introduction, (0.1)]{Maruyama1986}.`

(c) 每个假设的机械理由。等子写法把验证压到节点邻域的一个正合列上；分别给 Cech 转移则要逐开集验证转移方程且要处理 $D$ 的补集上无定义的数据。$G$ 定义在 $L_1\oplus L_2$ 内部，天然是子丛，局部基论证顺带给出挠自由，省掉独立验证。$b$ 进 tautological 的 $b$ 次幂：$b$ 若不是 $6,6,8$ 的公倍数，$\alpha$ 在节点上的两个定义相差 $\lambda^{b}\ne1$，同构拼不出来；$b$ 若取 $48$，一切照跑，只把第 7 节的 $24m(n-2j)$ 翻倍，阈值 $n-1\ge 3m$ 更富余，说明 $24$ 是最小可行值而论证对倍数是稳健的。$\{i,j\}=\{1,2\}$ 的交错写法是伏笔：$\rho_j$ 的核带 $(-D)$、商是另一条 $L_j$，第 7 节交替滤过吃的正是"每步只输一个 $(-\widetilde D)$"。$S\setminus D$ 上张成、$D$ 上按 $\alpha$ 重合，这两句是给第 8 节 trace 极限准备的：极限函数在 $F$ 的每条线子丛上取值，图的粘合把两条线的取值绑成同一个 $a_\bullet$（第 9 节）。

[dense] 失败路线一：[推测] 我最早直接给 $2\times2$ 转移矩阵值的 Cech 1-上循环来定义 $G$，把图粘合塞进转移函数。失败在同时碰到两条图的开集：转移函数在那里要求 $\alpha$ 越过 $D$ 延伸，而 $\alpha$ 只在 $D$ 上有定义，上循环方程无解。等子写法把奇性集中在 $D$ 上并用 $L_i(-D)$ 吸收。[推测] 失败路线二：用 Serre 型构造从理想层倒推 $G$。算过一次 Chern 类账：$\det G=\mathcal O_S(24,24)$，$D^2=(3,3)\cdot(3,3)=18$，初等变换公式给 $c_2(G)=D^2=18$（在 $G\subset L_1\oplus L_2$ 情形 $c_2=c_1(L_1)c_1(L_2)-[\Gamma]$ 型交错和恰好落在 $18$）。Serre 存在性给的是子丛而商在节点处带挠，修挠过程重建的正是初等变换，绕一圈回到原点。[推测] 失败路线三：[推测] 试图把等子条件从 $D$ 挪到两条平行超曲面上以便用直和分解。挪动之后 $G$ 变成真的直和，第 9 节里"两条线子丛张成"与"图上重合"两个条件同时把 $H_x$ 按死的作用消失，直和丛本身到处都有正度量（分量线丛 $\mathcal O(b,0)$、$\mathcal O(0,b)$ 各自正），整篇归零。粘合必须发生在真除子上，这是本构造的存在论位置。

## 7 完备性证明逐引理重建：交替滤过与 very-ampleness 证书

### 7.1 命题 `prop:ampleness` 的总账

(a) 逐字引用，`03-ampleness.tex:10-15`：

```
\begin{proposition}\label{prop:ampleness}
For every positive integer $m$, the bundle
$E_m=f_m^*G\otimes P$ is ample. More precisely,
$\OO_{\PP(E_m)}(n)$ is very ample for every even integer $n$ with
$n-1\geq3m$.
\end{proposition}
```

谱系定位在 `01-introduction.tex:35-37`：`The ampleness assertion has a quantitative certificate: Proposition~\ref{prop:ampleness} proves that $\OO_{\PP(E_m)}(n)$ is very ample for every even $n$ with $n-1\geq3m$.`

(b) 中间步骤补齐。证明的开场把记号全部摊开（`03-ampleness.tex:19-23`）：$V=f_m^*G$、$\widetilde L_i=f_m^*L_i$、$\widetilde D=f_m^*D$、$K_i=\widetilde L_i(-\widetilde D)$、$K=K_1\otimes K_2$。拉回后的商列 `03-ampleness.tex:25-29`：

```
\begin{equation}\label{eq:pullback-quotients}
 0\longrightarrow K_i\longrightarrow V\longrightarrow
 \widetilde L_j\longrightarrow0,
 \qquad\{i,j\}=\{1,2\}.
\end{equation}
```

正合性保持的理由原文只给半句（`03-ampleness.tex:30-31`）：`These sequences remain exact because their original quotients are locally free.` 我补全：商 $\widetilde L_j$ 局部自由使列局部裂开，局部裂开的正合列张量任何拉回仍正合。次数账：$\widetilde L_1=\mathcal O_S(24m,0)$、$\widetilde D=\mathcal O_S(3m,3m)$，故 $K_1=\mathcal O_S(21m,-3m)$，同理 $K_2=\mathcal O_S(-3m,21m)$（`03-ampleness.tex:32-34`），于是

```
 K=\OO_S(18m,18m),\qquad
 \OO_S(\widetilde D)=\OO_S(3m,3m).
```

（`03-ampleness.tex:37-38`）。两个 $-3m$ 在乘积里互相抵消，$K$ 两方向皆正，这是全文次数账的心脏。收尾的嵌入论证：$W=\operatorname{Sym}^nV\otimes P^{n-1}$（`03-ampleness.tex:109-111`）全局生成后，相对 Veronese $\mathbb P(V)\to\mathbb P(\operatorname{Sym}^nV)$ 把一个商线 $\ell$ 送到 $\ell^{\otimes n}$，tautological 拉回是 $\mathcal O_{\mathbb P(V)}(n)\otimes\pi^*P^{n-1}$；再复合 $S$ 用 $P=\mathcal O_S(1,1)$ 的嵌入与 Segre，`03-ampleness.tex:157-161` 的账：

```
 \bigl(\OO_{\PP(V)}(n)\otimes\pi^*P^{n-1}\bigr)
       \otimes\pi^*P
 =\bigl(\OO_{\PP(V)}(1)\otimes\pi^*P\bigr)^n.
```

最后一步用 $\mathbb P(E_m)=\mathbb P(V\otimes P)\simeq\mathbb P(V)$ 且 $\mathcal O_{\mathbb P(E_m)}(1)=\mathcal O_{\mathbb P(V)}(1)\otimes\pi^*P$。由"Hartshorne 判据：某次幂 very ample 推出 tautological 线丛 ample"（`03-ampleness.tex:7-8` 引 `Corollary~2.5 and Proposition~3.2` of Hartshorne1966），命题闭合。

(c) 机械理由。$n$ 必须偶：滤过每两步消耗 $\operatorname{Sym}$ 的两个次数并留下 $K^j\otimes\operatorname{Sym}^{n-2j}V$，$n$ 偶时残束是 $K^{n/2}$ 纯线丛，滤过彻底线丛化；$n$ 奇则残下 $K^{(n-1)/2}\otimes V$，对秩 2 丛做生成提升要动 $V$ 自己的上同调，链条不干净。阈值 $n-1\ge3m$ 的来源：九个双次数 `03-ampleness.tex:115-118`：

```
 &(18mj+n-1,\;18mj+24m(n-2j)+n-1),\\
 &(18mj+24m(n-2j)-3m+n-1,\;18mj-3m+n-1),\\
 &(9mn+n-1,\;9mn+n-1).
```

原文点破唯一危险项（`03-ampleness.tex:119-120`）：`Every entry is nonnegative: the only possibly negative contribution is $-3m$, and it is offset by $n-1$.` 逐项核对：第二行的两个 $-3m$ 是全表仅有的负源，最小配置在 $j=0$：$(24mn-3m+n-1,\ n-1-3m)$，于是 $n-1\ge3m$ 恰好封底；$18mj+24m(n-2j)$ 对 $0\le j\le n/2-1$ 的最小值在 $j=n/2-1$ 处为 $18m(n/2-1)+48m=9mn+30m$，早已安全。第三行是 $K^{n/2}$：$18m\cdot\frac n2=9mn$。第二个封底环节是上同调：对 $c,t\ge0$，$\mathcal O_S(c,t)$ 由单项式乘积全局生成且 $H^1(S,\mathcal O_S(c,t))=0$，走两张贴图 $H^1(\mathbb P^1,\mathcal O(c))=0$ 加 Künneth（`03-ampleness.tex:122-126`）。提升引理：$0\to U\to Z\to Q\to0$ 中 $U,Q$ 皆全局生成且 $H^1(U)=H^1(Q)=0$，上同调序列给出 $H^1(Z)=0$ 且 $Q$ 的每个整体截面升到 $Z$，升后的生成元加 $U$ 的生成元逐纤维张成（`03-ampleness.tex:127-133`）。从最内层线因子出发逐层应用，$W$ 全局生成。

[dense] 失败路线一：[推测] 最初我只用一条商列做标准滤过，因子是 $K_1^j\otimes\widetilde L_2^{\,n-j}\otimes P^{n-1}$，双次数 $(21mj+n-1,\ 24mn-27mj+n-1)$。第二坐标在 $j=n$ 处塌成 $-3mn+n-1$，要非负得 $n-1\ge3mn$，对 $n\ge2$ 无解。负次数沿单链线性累积是这条路线的死因；交替使用两条商列把负项配对成 $K$ 的正项，负源被永久锁在单个 $-3m$。[推测] 失败路线二：[推测] 想过 $n=3m+1$ 直接取最小阈值。$m$ 为偶数时 $3m+1$ 是奇数，偶性要求把它顶到最近偶数，账反而复杂；Lean 侧的解法可作旁证：`Ampleness.lean:12-13` 取 `let t := 3*m+1` 与 `let e := 2*t-1`，实际用 $n=2t=6m+2$，此时 $n-1=6m+1\ge3m$ 宽松过关。论文选"任意满足阈值的偶数"这个陈述形状，就是为了把 parity 的琐碎性从定理里抹掉。[推测] 失败路线三：用 Nakai--Moishezon 在三维 $\mathbb P(V)$ 上直接验 $\mathcal O_{\mathbb P(V)}(1)\otimes\pi^*P$ 的正性：对曲线类的交数要逐类算，$\mathbb P(V)$ 上的曲线分水平与垂直两类，垂直类要沿 $D$ 的六个节点分层，计算量爆炸且没有证书产出。`01-introduction.tex:35` 强调 "quantitative certificate"，说明作者路线最终选择了构造性生成，并非数值判据，这条数值路线在我手里就是那个被放弃的平行版本。

### 7.2 节点上滤过的局部自由性：$kf$ 基变换账

(a) 逐字引用，`03-ampleness.tex:88-92`：

```
Each step uses just one of the locally split sequences
\eqref{eq:pullback-quotients}, so it remains valid when the two kernel
lines have the same fiber image. Concretely, in the pulled-back basis
$e,f$ of~\eqref{eq:local-basis}, the kernels are generated by
$k=de-hf$ and $f$, with $h$ a unit. For $n=2$ the filtration is
```

与 `03-ampleness.tex:99-105`：

```
 kf=\frac{d}{h}ke-\frac1h k^2.
```

原文随后说 `The coefficient $-1/h$ is a unit, so $kf$ extends to a basis of $kV$. Both inclusions therefore have locally free quotients. This verification uses no smoothness of $d=0$ and applies at nodes and to nonreduced pullbacks of the divisor.`（`03-ampleness.tex:102-105`）

(b) 中间步骤补齐。先核对两个核的生成元：在局部基 $e=(1,h)$、$f=(0,d)$ 下，$\rho_1(u_1e+\kappa f)=u_1$，核由 $f$ 生成；$\rho_2(u_1e+\kappa f)=u_1h+\kappa d$，为零当且仅当 $u_1=td$、$\kappa=-th$，核由 $k=de-hf$ 生成。$n=2$ 的滤过写作 $\mathcal O(kf)\subset kV\subset\operatorname{Sym}^2V$：$kV$ 由 $ke,k^2$ 生成（$V$ 有基 $e,k$，注意 $e,k$ 也是 $V$ 的基，因 $k\equiv de\ \bmod f$ 且变换矩阵 $\begin{pmatrix}d&-h\\0&1\end{pmatrix}$ 作用于 $(e,f)$ 后配合 $f$ 可逆回换）。商 $\operatorname{Sym}^2V/kV$ 由 $e^2$ 的类生成且为自由秩 1：任意单项 $e^2,ef,f^2$ 模 $kV$，$ef$ 与 $f^2$ 都落在 $kV$（各含因子 $f$? $ef$ 不含；这里要细账：用 $f=\frac{1}{d}(k+hf)$... 在 $d$ 非零因子的分式环里回解），原文用局部裂开论证把这条细节归入"usual symmetric-power filtration"（`03-ampleness.tex:51-56`）：局部截面 $k'$（核生成元）与提升 $e'$（商生成元）给 $\operatorname{Sym}^rV'$ 的单项式基，含 $k'$ 的单项式恰成核。$kV/\mathcal O(kf)$ 的自由性则要 $kf$ 能扩成 $kV$ 的基：从恒等式 $kf=\frac dh ke-\frac1h k^2$，$(ke,k^2)$ 到 $(kf,k^2)$ 的过渡矩阵行列式为 $-\frac1h$，单位，故 $(kf,k^2)$ 是基，商由 $kf$ 的类的补方向生成，自由。这正是"$-1/h$ 是单位"一句的全部职能。$f=(0,d)$ 在 $d$ 不可约（光滑点）时可进一步化简，但节点处 $d=xy$ 可约、拉回后甚至非既约，上面这本账对任意 $d$ 成立，这就是原文最后强调 "uses no smoothness of $d=0$" 的所指：滤过在 $f_m^*D$ 的分支轨迹重数上也站得住。

(c) 机械理由。"每一步只用一条局部裂开列"（`03-ampleness.tex:88-89`）是使滤过在 $D$ 上存活的关键结构：若某一步同时对两条商列取信息，就要比较 $K_1$ 与 $K_2$ 在同一纤维里的像，而它们在 $D$ 上按 $\alpha$ 重合，比较会引入 torsion。只用一条列时，另一条列的信息通过下一层的 $K$ 吸收回来，交错恰好消化重合。$W$ 里的挠子丛论证依赖 $e,k$ 为基这一事实，它等价于 $h$ 是单位，回溯到第 6 节下降里"公共值非零"那条。

[dense] 失败路线一：[推测] 我曾在光滑假设下做滤过，即先用 $D_{\mathrm{sm}}$ 外的滤过再延拓。延拓步需要 $\operatorname{Sym}^rV$ 对 $D$ 的饱和性验证，本质等价于直接做节点账，多绕了整整一节。[推测] 失败路线二：[推测] 试图用 Jordan--Hölder 型分解 Sym 幂避开局部账：在一般点处 $V$ 沿商列分裂，取分裂的滤过层。一般点上的分裂延不到 $D$，因为分裂张量与 $\alpha$ 不相容；$n=2$ 的 $kf$ 账就是延拓失败的最小反证，我把它转正成构造。[推测] 失败路线三：把 $n$ 提到 $O(m^2)$ 以换掉节点验证：阈值松了，$\mathcal O_{\mathbb P(E_m)}(n)$ 的 very-ampleness 陈述变弱（证书形状 $n-1\ge3m$ 是线性窗口，二次窗口让"全 $m$ ample"的计算意义打折），而滤过在节点处的局部自由性无论如何都要证，躲不掉。

### 7.3 幂映射族与 $P$ 的蒸发伏笔

(a) 逐字引用，`02-construction.tex:193-196`：

```
\begin{equation}\label{eq:power-maps}
 f_m\bigl([z_0:z_1],[w_0:w_1]\bigr)
   =\bigl([z_0^m:z_1^m],[w_0^m:w_1^m]\bigr).
\end{equation}
```

以及 `02-construction.tex:197-202`：`This is finite of degree $m^2$, and $f_m^*\OO_S(r,t)\simeq\OO_S(mr,mt)$. In particular, $f_m^*P\simeq P^{\otimes m}$. The bundles in the theorem are \begin{equation}\label{eq:family} E_m=f_m^*G\otimes P. \end{equation}`

(b) 中间步骤补齐。有限性：每因子 $[z_0:z_1]\mapsto[z_0^m:z_1^m]$ 是 $\mathbb P^1\to\mathbb P^1$ 的 $m$ 次映射，纤维恰 $m$ 点计重数，乘积纤维 $m^2$ 点。拉回公式在 Picard 群上的作用由 $\deg$ 决定：$\Pic(S)=\mathbb Z\oplus\mathbb Z$，$f_m^*$ 乘 $m$。$P$ 蒸发伏笔的对偶形态：$E_m^\vee=f_m^*F\otimes P^{-1}$，而固定同构 $f_m^*P^{-1}\simeq P^{-m}$（`04-limit.tex:59`）让 $P^{-1}$ 在对偶侧以 $P^{-m}$ 出现，第 8 节的 $m$ 次根帧吸收的就是这个 $m$。

(c) 机械理由。为什么 $G$ 的幂拉回是"坐标取 $m$ 次幂"这种最粗的映射：一是它对 $\Pic$ 的作用是对角乘法，次数账透明；二是它沿坐标点分歧，分歧轨迹与 $D$ 的一般位置可控，第 8 节的分支轨迹论证只需要"多重集连续依赖"，对 $f_m$ 由 $y^m=x$ 的根集连续性直接给（`04-limit.tex:82-85`）。三是 $f_m^*G$ 保持"三图粘合"血统：$\widetilde D$ 仍是 $(3m,3m)$，第 9 节的图关系原样拉回。

[dense] 失败路线一：[推测] 试过自同构群里的映射代替幂映射：$\Aut(\mathbb P^1\times\mathbb P^1)$ 元素对 $\Pic$ 作用平凡，$P$ 蒸发不了，极限会拖着非平凡挠转移因子。[推测] 失败路线二：[推测] 试过 Lattès 型商映射（由 $A$、$B$ 生成的群轨道构造）。它动力学上诱人，但拉回 $\Pic$ 的倍数作用不干净，$K_1=\mathcal O(21m,-3m)$ 这类账不再整，第 7 节阈值报废；而且 Lattès 映射的分歧集是 Cantor 型，第 8 节的分歧集极性与连续多值论证会失效。[推测] 失败路线三：把族改成 $f_m^*G$ 不带 $P$。$E_m^\vee=f_m^*F$ 的 trace 没有可吸收的转移因子，归一化后极限继承 $f_m$ 的重数发散，第 9 节质量账 $2\pi b$ 的来源（负线丛 $\mathcal O(-b)$ 的参考度量）也随之丢失。

## 8 极限对象逐引理重建：trace、归一化、系数极限与逐点代表元

### 8.1 命题 `prop:limit` 的陈述与四步路线图

(a) 逐字引用，`04-limit.tex:11-27`：

```
\begin{proposition}\label{prop:limit}
Let $G$ be a holomorphic vector bundle of positive rank on
$S=\PP^1\times\PP^1$, and put $F=G^\vee$.  Suppose that
$f_m^*G\otimes P$ admits a smooth strictly Griffiths-positive Hermitian
metric for infinitely many positive integers $m$.  Then there is a
function
\[
q:F\longrightarrow [0,\infty)
\]
which is plurisubharmonic on the total space, is not identically zero,
and has the following property: for every $x\in S$ there is a finite
positive semidefinite Hermitian form $H_x$ on $F_x$ such that
\[
q(x,v)=H_x(v,v)\qquad(v\in F_x).
\]
In particular, this fiberwise assertion holds at every base point.
\end{proposition}
```

路线图在 `04-limit.tex:6-8`：`The argument has four steps: trace the dual norms, normalize and extract their coefficient limit, prove that the limit is nonzero, and recover its intrinsic plurisubharmonic representative.`

(b) 中间步骤补齐。四步分别对应下面的 8.2、8.3 与 8.4、8.5、8.6。先登记两个全局选择。第一，命题对任意正秩丛 $G$ 陈述，把"极限机器"与"具体构造"解耦，$G$ 的特殊性只在第 9 节使用；这是为了让第 8 节可复用而做的模块化。第二，对偶化：正度量住在 $E_m$ 上，psh 的平方范数住在 $E_m^\vee$ 上，而 $E_m^\vee=f_m^*F\otimes P^{-1}$，极限对象自然落在 $F$ 上。`01-introduction.tex:184-186` 里那句警告值得逐字记下：`Here noncollapse and the assertion on \emph{every} fiber require separate arguments: the graph relations lie over a divisor and cannot be read from an almost-everywhere representative.` 全篇 8.5 与 8.6 小节就是这句警告的还债。

(c) 机械理由。假设的形态"无穷多个 $m$"是最弱可证形态：结论只造一个 $q$，输入只需一列趋于无穷的 $m$；把假设加强成"所有 $m$"会让命题离第 10 节的反证结构更远。值域 $[0,\infty)$ 与逐纤维半正定：正定在极限里容许降秩，`06-conclusion.tex:21-22` 的总结句 `The limit in the proof is permitted to lose rank, but not to vanish identically or to lose its quadratic structure at any base point.` 把三条底线一次说清。

[dense] 失败路线一：[推测] 我第一版把命题陈述成"极限是某个度量的对偶范数"，想在极限上继续做度量几何。降秩纤维上逆矩阵不存在，所有需要 $h^{-1}$ 的账（包括 Lean 侧 `Model.lean:155-160` 那条 `StrictlyGriffithsPositive` 定义里的 $(h_z)^{-1}$ 项）在极限层全部断掉；后来把极限降级为"函数"，度量结构只在输入侧使用。[推测] 失败路线二：[推测] 想让 $q$ 直接由逐点极限给出并自动 psh，被 `04-limit.tex:198-205` 的 $(1+\lvert x\rvert^{2/m})\lvert v\rvert^2$ 反例否决，第 4 节已记。[推测] 失败路线三：[推测] 假设无穷列可换成整族一致有界度量族再运算子。族无先验界，归一化前 $\sup q_{m,t}$ 失控，这条路最终变成 8.3 的归一化引理，属于错了但错得有用的那种。

### 8.2 对偶 psh 判据与 Hessian 恒等式

(a) 逐字引用，`04-limit.tex:41-49`：

```
so that $h=\Id$ and its first derivatives vanish there.  Along a
holomorphic disk with coordinate $\zeta$, write the Hermitian curvature
as $iC\,d\zeta\wedge d\bar\zeta$.  In the convention used here,
\[
C=-\frac{\partial^2h}{\partial\zeta\,\partial\bar\zeta}
\]
at the normal point.  Thus, for a holomorphic section $s$ along the disk,
\begin{equation}\label{eq:limit-dual-hessian}
\frac{\partial^2}{\partial\zeta\,\partial\bar\zeta}\|s\|^2
=\|D'_{\partial/\partial\zeta}s\|^2-\langle Cs,s\rangle.
\end{equation}
```

(b) 中间步骤补齐。法坐标架下 $\partial\bar\partial\lVert s\rVert^2$ 的经典展开：$\lVert s\rVert^2=h_{\alpha\bar\beta}s^\alpha\bar s^\beta$，对全纯截面沿盘求混合导两次，在法点处 $h=\operatorname{Id}$、$\partial h=0$，只剩 $\partial\bar\partial h$ 项与 $\partial s$ 的范数项，即 $\lVert D's\rVert^2-\langle Cs,s\rangle$。对偶丛的 Griffiths 曲率带反号：纤维方向配对时 $\Theta_{F}$ 与 $\Theta_{E}$ 互为对偶表示，`01-introduction.tex:227` 写明 `The dual has the opposite Griffiths sign.`，于是严格正度量的对偶满足 $-\langle Cs,s\rangle\ge0$ 对全纯盘截面，从而 $\frac{\partial^2}{\partial\zeta\partial\bar\zeta}\lVert s\rVert^2\ge\lVert D's\rVert^2\ge0$，对偶平方范数沿每条全纯盘次调，即总空间 psh。把盘取为总空间中由 $(x,v)$ 曲线抬升的全纯截面，判据覆盖 $F$ 的开集，原文补一句 "Applying this calculation to the section of the pulled-back bundle defined by any disk in its total space proves the assertion"（`04-limit.tex:52-53`），并给了三处古典出处（`04-limit.tex:53-56`：Umemura 1973 的 Remark 1.3 与 Lemma 1.7、Raufi 2015 第 2 节、Forstneric--Kusakabe 的 Proposition 2.6）。

(c) 机械理由。$C=-\partial\bar\partial h$ 的负号完全由曲率约定决定（`01-introduction.tex:213`：`We use the curvature convention of \cite{Demailly2021}.`）；换成 $+\partial\bar\partial h$ 约定时第 9 节测度质量 $2\pi b$ 的符号要同步翻转，`04-limit.tex:43`、`05-obstruction.tex:104-106` 的 negative of the Chern curvature 句、`05-obstruction.tex:236-237` 的 $i\partial\bar\partial$ 约定三处是同一枚硬币，动一处断两处。法架存在只需光滑度量的局部规范，不需要任何曲率估计，这是第 10 节"无一致估计"结论的微观对应。

[dense] 失败路线一：[推测] 曾试图绕开对偶，直接在 $E_m$ 上对度量矩阵 $h_m$ 取系数极限：正定性在逐点极限下不保，特征值可塌到 $0$ 而矩阵元无界，弱紧需要双侧界，只有下侧没有上侧。改走对偶后平方范数天然次调、有下界 $0$，8.3 的归一化再补上界，两头才合拢。[推测] 失败路线二：[推测] 用 $\bar\partial$-Laplacian 的 Green 核表示 $\log\lVert s\rVert^2$ 想拿定量估计：需要度量族的一致 $\partial\bar\partial$ 界，回到第 4 节第五条失败路线的死点。

### 8.3 trace 定义、$m$ 次根与分支轨迹正则性

(a) 逐字引用，`04-limit.tex:62-66`：

```
\begin{equation}\label{eq:limit-trace}
q_{m,t}(x,v)
=\frac{1}{m^2}\sum_{y\in f_m^{-1}(x)}
\bigl\|v\otimes(f_m^*t)^{1/m}(y)\bigr\|_{m,y}^2,
\end{equation}
```

根帧的合法性在 `04-limit.tex:67-72`：`The root in this expression is local on the source.  Indeed, in a local frame $s$ of $P^{-1}$ the section $f_m^*t$ has the form $\eta(y)s^m$, with $\eta$ holomorphic and nowhere zero.  A local holomorphic logarithm of $\eta$ gives the root $\exp((\log\eta)/m)s$.  Two choices differ by an $m$-th root of unity, which does not change the squared norm.` 跨分支连续性在 `04-limit.tex:83-85`：`The unordered multiset of roots of $y^m=x$ varies continuously with $x$, counting coalescing roots with their multiplicities.` 可删性在 `04-limit.tex:91-97`：

```
In a local total-space chart, the inverse image of the branch locus
under the bundle projection $F|_U\to U$ is an analytic set, contained in
$\{z_1z_2=0\}$ after choosing affine
coordinates on the two base factors. It is therefore pluripolar.
The trace is locally bounded above there by continuity, so the
removable-singularities theorem for plurisubharmonic functions
```

(b) 中间步骤补齐。逐项拆账。系数 $\frac{1}{m^2}$：一般纤维恰 $m^2$ 点，平均化使 $q_{m,t}$ 与单点范数同尺度，为 8.4 的归一化不随 $m$ 爆炸先上保险；"the sum counts multiplicities"（`04-limit.tex:66`）让分歧点处求和仍等于 $m^2$ 项计重数，权重连续依赖 $x$。根帧：$t$ 是 $P^{-1}$ 在 $U$ 上不消没的全纯帧，$f_m^*t$ 是 $f_m^*P^{-1}$ 的帧，经固定同构 $f_m^*P^{-1}\simeq P^{-m}$（`04-limit.tex:59`）写成局部 $P^{-1}$ 帧的 $m$ 次幂形态 $\eta\cdot s^m$；$\eta$ 无零点且 $U$ 可缩，局部全纯对数存在。给 $v\in F_x$：$f_m^*F$ 在 $y$ 处的纤维就是 $F_{f_m(y)}=F_x$，$v$ 逐点代入取范数 $\lVert\cdot\rVert_{m,y}$，再张量根帧值落入 $(f_m^*F\otimes P^{-1})_y=(E_m^\vee)_y$。平方范数对 $m$ 次单位根不变，$q_{m,t}$ 良定义；逐分支是 psh（全纯映射 $(x,v)\mapsto(y(x),v\otimes(f_m^*t)^{1/m}(y(x)))$ 复合对偶范数），有限正权和保持 psh。连续性与可删性两条腿：多值根的重数化连续给跨分支连续，连续给局部上方有界；分支集原像包含在 $\{z_1z_2=0\}$ 解析集内故极性；psh 可删奇点定理（Demailly CADG 卷一 Thm 5.24）给出唯一 psh 延拓且上极限值等于连续 trace。帧变换律 `04-limit.tex:102-105`：$t'=gt$ 时 $q_{m,t'}=\lvert g\rvert^{2/m}q_{m,t}$，指数 $\frac2m$ 的来源是根帧乘 $\eta^{1/m}$、范数平方吃 $\lvert\eta\rvert^{2/m}$，两因子各贡献一次一半。

(c) 机械理由。$\{z_1z_2=0\}$ 的形态：$f_m$ 在每因子的分歧集是 $\{0,\infty\}$ 的像，仿射坐标里恰为坐标超平面；延拓定理同时吃"解析（故极）"与"上方有界"两条假设，缺一条都不能把 psh 从开集搬到全体。归一化函数 $N_m(x,v)=q_{m,t}(x,v)\lvert t(x)\rvert_0^{-2/m}$（`04-limit.tex:108-110`）：换帧时分子乘 $\lvert g\rvert^{2/m}$，背景范数 $\lvert t\rvert_0$ 随 $t'=gt$ 同因子变化，商整体良定义；紧单位球丛 $\{x\in S,\ \lvert v\rvert_0=1\}$ 上 $N_m$ 连续正，最大值存在；平方范数乘正常数不改曲率张量号，遂可安排

```
\max_{x\in S,\ |v|_0=1}N_m(x,v)=1.
```

（`04-limit.tex:116-118`）。齐次性推得局部界（`04-limit.tex:120-122`）$0\le q_{m,t}(x,v)\le\lvert t(x)\rvert_0^{2/m}\lvert v\rvert_0^2$；$\lvert t\rvert_0^{2/m}\to1$ 局部一致，所以各 $H_m$ 的算子范数在紧集一致，这是弱紧的全部输入。

[dense] 失败路线一：[推测] trace 之前我先试"逐纤维期望"：借覆盖流的调和测度做积分。$f_m$ 的纤维是有限集，伪积分的定义立刻依赖附加度量，帧律不再干净，$\lvert g\rvert^{2/m}$ 换出杂项；有限和是唯一让帧律呈纯幂形的选择。[推测] 失败路线二：[推测] 根帧曾想全局化：$\Pic(\mathbb P^1\times\mathbb P^1)=\mathbb Z\oplus\mathbb Z$ 无挠，$P^{-1}$ 的全局 $m$ 次根帧对象不存在，粘贴要吃 Čech 上同调障碍；而局域论证只要"每点附近有根"，全局化是白付的钱。[推测] 失败路线三：[推测] 分支集上我一度手工补值（取上确界）再证延拓；可删定理直接给"唯一延拓且上极限吻合"，手工补值反而破坏上半连续的自动性，属重复施工。

### 8.4 分布系数极限与转移律

(a) 逐字引用，误差估计在 `04-limit.tex:150-155`：

```
\left|\left\langle
\bigl(|g|^{2/m}-1\bigr)T^*H_mT,\Phi
\right\rangle\right|
\le C_K\|\Phi\|_{L^1}
\sup_K\bigl||g|^{2/m}-1\bigr|\longrightarrow0.
```

变换律原文在 `04-limit.tex:141-145`：`let $v=T(x)w$ be a holomorphic change of bundle coordinates and let $t'=gt$.  The original matrices satisfy \[ H'_m=|g|^{2/m}T^*H_mT. \]` 对角抽取在 `04-limit.tex:130-132`：`Weak compactness in $L^2$ and a diagonal subsequence on a countable collection of charts and compact exhaustions give distributional limits $H$ for all the coefficient matrices.`

(b) 中间步骤补齐。流程五拍。第一拍：每个全纯标架里 $q_{m,t}(x,v)=v^*H_m(x)v$，8.3 的局部界给 $H_m$ 按算子范数在紧子集一致 $\le C$，即 $L^\infty_{\mathrm{loc}}$ 单位球内分布族。第二拍：可数标架图集配可穷紧开集序列，对角抽取给全部系数矩阵的分布极限 $H$，落在 $L^\infty_{\mathrm{loc}}$。第三拍：Hermit 性与半定性过极限的写法（`04-limit.tex:134-138`）：对每个 $c\in(\mathbb{Q}+i\mathbb{Q})^r$ 与非负试验函数，$c^*Hc\ge0$ 逐条传，稠密性收拢成单一全测集上的矩阵不等式。第四拍：转移律取极限，误差被 `04-limit.tex:156-157` 那句吸收进 $C_K$：`Here the local matrix bound and the boundedness of $T$ are absorbed into $C_K$.` 三因子相杀：$\sup_K\lvert\lvert g\rvert^{2/m}-1\rvert\to0$（$g$ 无零点、$K$ 紧、固定对数分支、$\frac2m\log\lvert g\rvert\to0$ 一致），$\lVert H_m\rVert\le C_K$，$\Phi$ 的 $L^1$ 范数固定。第五拍：乘固定光滑矩阵 $T,T^*$ 保分布收敛，换基坐标同理，$H'=T^*HT$ a.e.，$H$ 是 $F$ 上取半正 Hermitian 值的几乎处处系数截面，奇异 Hermite 度量的语言里它就是那个度量。

(c) 机械理由。必须走到分布：$q_{m,t}$ 只有 $L^\infty_{\mathrm{loc}}$ 界与次调性，无等度连续，$C^0$ 拓扑无收敛子列（第 4 节第四条失败路线的正式还账点）。$(\mathbb{Q}+i\mathbb{Q})^r$ 可数：矩阵半正定是闭条件，检验集可数才能对角化；试验函数光滑紧支，为 8.5 里"对固定 $\chi cc^*$ 配对"预留同一种拓扑。$L^1$ 出现在配对界：只剩 $L^\infty$ 界的弱紧，其对偶范数是 $L^1$。$\frac2m$ 的两副面孔要分清：对 $q_{m,t}$ 是帧律乘子，对 $N_m$ 被背景范数精确除尽，极限层只剩 $T^*HT$ 的纯张量律，$P$ 至此彻底蒸发。

[dense] 失败路线一：[推测] 我先试 $L^2$ 强紧：Rellich 要梯度界，psh 族的 $\partial$ 界只有分布意义，$i\partial\bar\partial q_{m,t}\ge0$ 作为正当前只给测度范数不给 $H^1$ 半范数，强紧落空，退回弱。[推测] 失败路线二：[推测] 抽取顺序一度弄反：先定坐标变换 $T$ 再抽列，换标架就重抽，无穷次"再抽"追杀对角线；正确顺序是把全部可数紧集与全部标架排成一张表一次抽尽，`a diagonal subsequence on a countable collection of charts and compact exhaustions` 这句就是事故疤痕。[推测] 失败路线三：[推测] 帧因子 $\lvert g\rvert^{2/m}$ 想在函数层面当一阶小量直接丢弃：$\frac2m\log\lvert g\rvert$ 乘上 $q_{m,t}$ 后在 $q$ 大处仍大，逐点丢弃非法；它只在分布配对里被 $H_m$ 的界压死，这解释了误差账为什么写成对 $\Phi$ 的配对。

### 8.5 非坍缩：极大子列、次均值与固定体积底线

(a) 逐字引用，核心不等式 `04-limit.tex:186-190`：

```
\begin{equation}\label{eq:limit-noncollapse}
\int\chi(x)c^*H_m(x)c\,dx
\ge\int_{B(x_m,\varrho)}u_m(x)\,dx
\ge\frac12\operatorname{Vol}(B(0,\varrho)).
\end{equation}
```

前置链条：`Choose maximizing unit vectors $(x_m,v_m)$ in \eqref{eq:limit-normalization}.`（`04-limit.tex:162-163`），子列收敛到 $(x_*,v_*)$，固定标架里 $c_m\to c\ne0$，`Thus the nonnegative plurisubharmonic function $u_m(x)=c^*H_m(x)c$ satisfies $u_m(x_m)\ge\tfrac12$ for large $m$.`（`04-limit.tex:178-180`）。

(b) 中间步骤补齐。三段账。连续性替换段（`04-limit.tex:169-172`）：算子界 $\lVert H_m\rVert\le C$ 给 $\lvert c^*H_m(x_m)c-c_m^*H_m(x_m)c_m\rvert\le C\lvert c-c_m\rvert(\lvert c\rvert+\lvert c_m\rvert)\to0$，本质是半正定双线性型的 Cauchy--Schwarz 界。归一化传递段（`04-limit.tex:174-176`）：$c_m^*H_m(x_m)c_m=\lvert t(x_m)\rvert_0^{2/m}\cdot1$，右侧 $\to1$ 因 $\lvert t\rvert_0$ 在固定紧邻域上下有界离零，于是 $u_m(x_m)\to1$，吞一半余量得 $\ge\frac12$。次均值段：$u_m$ 非负次调，$\int_{B(x_m,\varrho)}u_m\ge u_m(x_m)\operatorname{Vol}(B(0,\varrho))\ge\frac12\operatorname{Vol}(B(0,\varrho))$；半径四层嵌套 `04-limit.tex:181-185`：$\varrho$ 满足 $B(x_*,4\varrho)$ 在 chart 内，$\chi$ 支撑在 $B(x_*,3\varrho)$、平台在 $B(x_*,2\varrho)$，$m$ 大时 $B(x_m,\varrho)\subset B(x_*,2\varrho)$，故 $\int_{B(x_m,\varrho)}u_m\le\int\chi\,c^*H_mc$。左端是 $H_m$ 对固定光滑矩阵值试验函数 $\chi cc^*$ 的配对，弱极限保 $\ge$，得 $\langle H,\chi cc^*\rangle\ge\frac12\operatorname{Vol}(B(0,\varrho))>0$。

(c) 机械理由。$\frac12$ 只是 $1$ 与"趋于 $1$"之间的任意松弛；$\varrho$ 固定不随 $m$ 动是命门，动了体积底线随 $m$ 归零，极限不等式右端变 $0$，非零性拿不到。四半径层级各自封顶一处嵌套，少一层断一个箭头；$4\varrho$ 那层保证 chart 合法，$3\varrho$ 与 $2\varrho$ 之间留 $\chi$ 的磨平台阶，$\varrho$ 承受 $x_m$ 的漂移余量。$c\ne0$ 由极大子列极限 $(x_*,v_*)$ 在单位球丛上给出，紧性在本节只用这一次。

[dense] 失败路线一：[推测] 非零论证第一版想逐点取值 $c^*H(x_*)c=1$：分布极限只在 $L^1_{\mathrm{loc}}$ 意义存在，逐点评估非法，$H(x_*)$ 无定义；这是把弱拓扑当强拓扑用的典型事故，改写成配对不等式才成立。[推测] 失败路线二：[推测] 次均值先用过球面平均 $\fint_{\partial B}$ 形态：边界圆要先确认在 chart 内，等价于体积平均加 $\chi$ 平台，还多一层逼近，换平台函数后省掉。[推测] 失败路线三：[推测] 曾想对"所有方向 $c$"一致抽取：方向不可数，对角线排不下；其实一个方向的严格不等式就够非零，"全方向一致非零"是贪心，被砍掉后它的残值由 8.6 的逐纤维结构接管。

### 8.6 卷积单调下降、极化恒等式与逐点二次代表元

(a) 逐字引用。卷积族 `04-limit.tex:219-225`：

```
Work in a coordinate and bundle
chart $U$, and let $\rho$ be a nonnegative smooth radial function on
$\CC^2$, supported in the unit ball and of integral one.  Put
\[
\rho_\delta(y)=\delta^{-4}\rho(y/\delta),\qquad
H_\delta=H*\rho_\delta,\qquad
q_\delta(x,v)=v^*H_\delta(x)v,
\]
```

径向均值恒等式 `04-limit.tex:249-253`：

```
\begin{equation}\label{eq:limit-radial-means}
(u*\rho_\delta)(x)
=|\mathbb S^3|\int_0^1
M_u(x,\delta s)\phi(s)s^3\,ds.
\end{equation}
```

极化恒等式 `04-limit.tex:273-277`：

```
2\operatorname{Re}(H_\delta)_{jk}
&=q_\delta(x,e_j+e_k)-q_\delta(x,e_j)-q_\delta(x,e_k),\\
2\operatorname{Im}(H_\delta)_{jk}
&=q_\delta(x,e_j)+q_\delta(x,e_k)-q_\delta(x,e_j+i e_k).
```

重建公式 `04-limit.tex:299-302`：

```
u(p)=\lim_{\varepsilon\downarrow0}
\frac{1}{\operatorname{Vol}(B(p,\varepsilon))}
\int_{B(p,\varepsilon)}u.
```

(b) 中间步骤补齐。五环。环一：$q_{m,\delta}(x,v)=\int q_{m,t}(x-y,v)\rho_\delta(y)\,dy$（`04-limit.tex:227-230`）对固定 $\delta$ 光滑且 psh：被积函数是全纯平移 $(x,v)\mapsto(x-y,v)$ 的复合，正权平均保 psh；固定 $\delta$ 时 $H_m\to H$ 的分布收敛把卷积系数连同任意阶导数逐点送到 $H_\delta$ 的导数，因为求导只是换用核的导数作试验函数，Levi 矩阵逐点收敛，$i\partial\bar\partial q_{m,\delta}\ge0$ 过极限。环二：界 $0\le q_\delta\le C\lvert v\rvert^2$（`04-limit.tex:240-242`）。环三：单调性，写 $\rho(y)=\phi(\lvert y\rvert)$，极坐标得球均值 $M_u(x,\delta s)$ 的加权积分，$u$ 次调则 $M_u(x,\cdot)$ 随半径不降，权重 $\phi(s)s^3$ 不依赖 $\delta$，卷积随 $\delta$ 不降；对 $u=q_{m,t}(\cdot,v)$ 逐 $v$ 应用，再在两个固定半径处 $m\to\infty$，得 $H_{\delta_1}(x)\le H_{\delta_2}(x)$（$0<\delta_1<\delta_2$，Hermitian 序）。环四：$\delta\downarrow0$ 单调不升、下有界 $0$、上有界（环二），极限 $q_U$ 有限且 psh（次均值过极限，或 Demailly CADG 卷一 Thm 5.4）；纤维二次性由极化恒等式抢救：每个 $(H_\delta)_{jk}$ 被 $q_\delta$ 在 $e_j$、$e_j+e_k$、$e_j+ie_k$ 的取值线性决定，$\delta\to0$ 时这些值有限收敛到 $q_U$ 的对应值，拼出逐点矩阵 $\widehat H_U(x)$，且 $q_U(x,v)=v^*\widehat H_U(x)v$ 对每个 $v$；半定性由 $q_U\ge0$；a.e. 处 $\widehat H_U=H$ 由近似恒等收敛。环五：重叠。两标架的 $\widehat H$ 经 $H'=T^*HT$ 在补集上一致，逐纤维向量一致，Fubini 换成总空间 a.e. 一致；局部有界 psh 函数由 a.e. 值决定，依据即重建公式；于是 $q_U$ 粘成整体 $q$。非零：8.5 的 $\langle H,\chi cc^*\rangle\ge\frac12\operatorname{Vol}(B(0,\varrho))$ 经 $\widehat H_U=H$ a.e. 传到 $q$，`04-limit.tex:303-305`：`Its coefficients represent the original measurable form almost everywhere, so \eqref{eq:limit-noncollapse} implies $q\not\equiv0$.`

(c) 机械理由。$\delta^{-4}$：底空间实四维，体积归一需四阶 Jacobian；指数错则 $\int\rho_\delta=1$ 破，单调性论证的"权重与 $\delta$ 无关"失真。径向假设：单调性只吃 $\rho(y)=\phi(\lvert y\rvert)$ 与球均值单调；非径向核要比族内两卷积得动重排不等式，原文用 "for any fixed nonnegative radial kernel"（`04-limit.tex:245-246`）把核类整个收编。先固定 $\delta$ 再 $m\to\infty$ 的次序不能倒：导数配对里试验函数依赖 $\delta$，倒序拿不到逐点 Levi 收敛。三个方向 $e_j,e_j+e_k,e_j+ie_k$ 是极化的最小完备组：Hermitian 矩阵 $r^2$ 个实自由度由这 $O(r^2)$ 个二次取值线性决定，缺 $e_j+ie_k$ 组就丢虚部。上半连续加次均值给重建公式，双有界保证局部可积供 Fubini。

[dense] 失败路线一：[推测] 代表元第一版用 psh 上确界包络：它保上半连续但破坏纤维二次性，包络对两个方向的相加性没有保障；极化路线把"函数结构"换成"矩阵元由有限取值决定"，二次性才对正则化免疫。[推测] 失败路线二：[推测] 曾想跳过卷积，宣布"次均值逐点定义 $H(x)$"：$H$ 只是 a.e. 截面，先选代表元再谈逐点是空的；必须让光滑化把"每个 $x$ 处有定义"作为结论生产出来。[推测] 失败路线三：[推测] 重叠一致性最初交给"两 psh 代表元只在极集上不同"的唯一性定理：要另付局部可积与极集结构的账；a.e. 相等、局部有界、usc 三件套更原始，引用更薄。`04-limit.tex:309-314` 的 `rmk:canonical-limit` 声明 $q$ 只代表分布极限、不断言对除子限制的收敛，正是这条贪心被砍后打的界桩：第 9 节因此把图关系直接代入这个处处定义的 $q$ 本身。

## 9 障碍逐引理重建：从两条叶到一个不变测度的死亡

### 9.1 引理 `lem:ruling-reduction`：极大原理把 $q$ 压成单变量半范数

(a) 逐字引用，`05-obstruction.tex:13-25`：

```
\begin{lemma}\label{lem:ruling-reduction}
Let $G$ be the bundle of Proposition~\ref{prop:construction}, and put
$F=G^\vee$. Suppose that $q:F\to[0,\infty)$ is finite,
plurisubharmonic, not identically zero, and a Hermitian quadratic form
on every fiber. Then there is a finite, nonnegative, nonzero
plurisubharmonic function $a_\bullet$ on $\OO_{\PP^1}(-b)$, a Hermitian
positive semidefinite quadratic on each fiber, such that
\[
 a_\bullet(Mx,M^{\otimes b}v)=a_\bullet(x,v)
 \qquad(M=A,B)
\]
for every $x\in\PP^1$ and $v\in\OO(-b)_x$.
\end{lemma}
```

图恒等式在 `05-obstruction.tex:46-50`：

```
\begin{equation}
 \label{eq:seminorm-graph-identities}
 a_1(x,v)=a_2(Mx,M^{\otimes b}v),
 \qquad M\in\{\Id,A,B\}.
\end{equation}
```

非零论证在 `05-obstruction.tex:52-58`：

```
Indeed, if it were zero, then for every $x\notin D$, the form $H_x$
would vanish on each of two spanning lines.  The inequality
\[
 |H_x(v,w)|^2\leq H_x(v,v)H_x(w,w)
\]
would then force $H_x=0$.
```

(b) 中间步骤补齐。链条四拍。第一拍，把 $q$ 用 $\iota_i$ 拉回：$q\circ\iota_i$ 是 $\mathcal O_{\mathbb P^1}(-b)$ 第 $i$ 因子上的非负 psh 纤维二次函数。第二拍，独立性：固定 $x_i$ 与 $v$，让另一坐标在互补 $\mathbb P^1$ 上动，得非负次调函数；$\mathbb P^1$ 紧致，次调则上界定，极大原理钉死为常数（`05-obstruction.tex:37-38`：`It is constant by the maximum principle.`），于是值只依赖 $(x_i,v)$，记为 $a_i(x_i,v)$，良定义。第三拍，$a_i$ 自身的 psh：任取另一因子一点，$a_i$ 实现为 $q$ 对全纯嵌入 $\mathbb P^1\ni x_i\mapsto\iota_i(x_i,v(x_i))$ 的拉回，psh 沿全纯映射下降保持（`05-obstruction.tex:40-42`）。第四拍，图恒等式：在 $\Gamma_M$ 上 $\iota_2\alpha=\iota_1$ 是 `eq:dual-gluing`，而 $\alpha=\ M^{\otimes b}$ 在 $\Gamma_M$ 上，代入 $q$ 的逐点相等给出 `eq:seminorm-graph-identities`；$M=\operatorname{Id}$ 那式把 $a_1,a_2$ 焊成同一个 $a_\bullet$。非零：设 $a_\bullet\equiv0$；对 $x\notin D$，$F_x$ 被两条 $\iota_i$ 的像线张成，$H_x$ 在两条线上半范数为零，半正定双线性型的 Cauchy--Schwarz $|H_x(v,w)|^2\le H_x(v,v)H_x(w,w)$ 把交叉项也钉零，$H_x=0$ 在整个 $S\setminus D$ 上；$q$ 在 $F$ 的满测集（$D$ 的原像是余维 2 实解析集）上为零，非负 psh 加小球次均值给 $q\equiv0$，矛盾（`05-obstruction.tex:58-61`）。$M=A,B$ 两式即所需不变性。

(c) 机械理由。极大原理要求另一坐标在紧致 $\mathbb P^1$ 上动，两条叶的紧性是 $\mathbb P^1\times\mathbb P^1$ 给的几何红利；换成 $\mathbb C^2$ 底，次调函数可以非常数。$x\notin D$ 的排除是硬边界：$D$ 上两像线重合，张成失败，Cauchy--Schwarz 只能给一维信息；好在 $S\setminus D$ 满测，非负 psh 由满测集值决定，这是 8.6 重建公式的孪生。$M^{\otimes b}$ 的指数 $b$ 必须与构造侧的 $b=24$ 同值：$\alpha|_{\Gamma_M}=M^{\otimes b}$ 的 $b$ 传到这里，变一个数第 6 节的粘合与这里的不变性同时断。"$a_\bullet$ 非零但可降秩"：全篇从 8 到 9 传递的都是半定对象，正定版本在第 4 节第一条失败路线里已经死掉。

[dense] 失败路线一：[推测] 最初我对 $q$ 直接开极大原理想让 $q$ 本身在 $S$ 上为常数：$q$ 在纤维方向不是次调的常数对象，纤维平移方向 psh 无界，假设根本不满足；只能沿线子丛拉回后单变量用。[推测] 失败路线二：[推测] 曾想跳过 $\operatorname{Id}$ 图直接联 $A$、$B$ 两式得 $a_1$ 的 $A$、$B$ 不变性：跳过 $\operatorname{Id}$ 则 $a_1$ 与 $a_2$ 仍是两个函数，$A$-不变写在 $a_1\to a_2$ 之间、$B$-不变写在 $a_1\to a_2$ 之间，合成的 $A^{-1}B$ 不变绕不开"$a_1=a_2$"这条桥，而桥恰是 $\Gamma_I$。三条图在这里各司其职，$\Gamma_I$ 是同步器。[推测] 失败路线三：[推测] 非零论证我试过只用"极限保留归一化 $\max=1$"：$q$ 逐点非零需要 $H$ 的逐点评估，分布极限无此工具；满测集反证加次均值这条迂回路才是合法弹药，代价是要先有 8.6 的处处代表元。

### 9.2 引理 `lem:seminorm-curvature`：半范数的对数曲率与质量 $2\pi b$

(a) 逐字引用，`05-obstruction.tex:80-102`：

```
\begin{lemma}[Logarithmic curvature of a squared seminorm]
\label{lem:seminorm-curvature}
Let $L$ be a holomorphic line bundle on a connected Riemann surface $C$.
Suppose that $a_\bullet:L\to[0,\infty)$ is finite, plurisubharmonic, and
not identically zero, and that its restriction to every fiber is a
Hermitian positive semidefinite quadratic form.  In a nonvanishing
holomorphic frame $e$ on $U\subset C$, write
\[
 a_\bullet(z,w e(z))=u_e(z)|w|^2.
\]
Then $\log u_e$, with the value $-\infty$ allowed, is subharmonic and
locally integrable.  The local measures $\ddc\log u_e$ define a positive
Radon measure $\mu$ on $C$.

If a holomorphic bundle automorphism $\widetilde T:L\to L$ covers an
automorphism $T:C\to C$ and satisfies
$a_\bullet\circ\widetilde T=a_\bullet$, then $T^*\mu=\mu$.
If $C=\PP^1$ and $L=\OO_{\PP^1}(-b)$ with $b\geq1$, then
\begin{equation}
 \label{eq:seminorm-curvature-mass}
 \mu(\PP^1)=2\pi b.
\end{equation}
\end{lemma}
```

(b) 中间步骤补齐。 mollify 拍：$u_\delta=u*\rho_\delta+\delta>0$ 光滑，$(u*\rho_\delta)(z)\lvert w\rvert^2$ 对 $(z,w)$ psh（全纯平移平均），加 $\delta\lvert w\rvert^2$ 保持，Levi 矩阵在 $w=1$ 处是 `05-obstruction.tex:127-131` 的 $2\times2$：

```
 \begin{pmatrix}
  (u_\delta)_{z\bar z} & (u_\delta)_z\\
  (u_\delta)_{\bar z} & u_\delta
 \end{pmatrix}
```

psh 给行列式非负，直接除出 `05-obstruction.tex:134-136`：

```
 (\log u_\delta)_{z\bar z}
 =\frac{u_\delta(u_\delta)_{z\bar z}
             -|(u_\delta)_z|^2}{u_\delta^2}\geq0.
```

$f_\delta=\log u_\delta$ 次调。单调下降拍：径向卷积是非负圆均值加权，均值随半径升，$u_\delta\downarrow u$、$f_\delta\downarrow\log u$（`05-obstruction.tex:140-147`）。可积性先于分布导数拍：设 $u(z_0)>0$，$f_\delta\le C_0$（局部有界）且 $f_\delta(z_0)\ge\log u(z_0)$，圆次均值对半径积分得 `05-obstruction.tex:156-158`：

```
 \int_{B(z_0,R)} f_\delta\,dA
 \geq \pi R^2\log u(z_0).
```

负部账 `05-obstruction.tex:161-163`：

```
\begin{equation}
 \label{eq:log-negative-part}
 \int_{B(z_0,R)} f_\delta^-\,dA
 \leq \pi R^2\bigl(C_0-\log u(z_0)\bigr).
\end{equation}
```

$f_\delta^-$ 随 $\delta$ 降而升、正部有界 $C_0$，单调收敛给 $\log u\in L^1$ 且 $f_\delta\to\log u$ 于 $L^1$。传播拍：令 $\Omega$ 为"某局部对数权可积"的点集；换标架 $e'=ge$ 时 $\log u_{e'}=\log u_e+\log\lvert g\rvert^2$（`05-obstruction.tex:174-176`），$\log\lvert g\rvert^2$ 调和，$\Omega$ 与标架无关；$\Omega$ 开且非空（$u\not\equiv0$ 给一点 $u>0$）；边界点 $x$ 处取 $B(x,4r)$ 覆盖，$\Omega\cap B(x,r)$ 内有开盘，其上 $u>0$ a.e.，选 $z_0$ 使 $u(z_0)>0$，$B(z_0,2r)$ 闭包在chart内且含 $x$ 的邻域，`eq:log-negative-part` 在放大盘上成立，$x\in\Omega$；$\Omega$ 又闭，连通性给 $\Omega=C$。 glue 拍：每盘上 $C_0-f_\delta$ 单调升向可积函数，$L^1$ 收敛，次调性过极限，$i\partial\bar\partial\log u$ 是正分布即正 Radon 测度；标架变换的调和项使 $i\partial\bar\partial\log u_e$ 与 $i\partial\bar\partial\log u_{e'}$ 相容，得整体 $\mu$。不变性拍：$\widetilde T(e(z))=c(z)e'(Tz)$，$u_e=\lvert c\rvert^2u_{e'}\circ T$，取 $i\partial\bar\partial$ 并与全纯微分同胚的拉回交换，$\mu=T^*\mu$，拉回定义在 `05-obstruction.tex:212-215`：

```
 \int_C\varphi\,d(T^*\mu)
   =\int_C(\varphi\circ T^{-1})\,d\mu.
```

质量拍：参考度量 $h_0$ 由 $\mathbb C^2$ 标准范数诱导，tautological 仿射帧 $e(z)=(1,z)^{\otimes b}$ 下 $u_0(z)=h_0(e(z),e(z))=(1+\lvert z\rvert^2)^b$；$\Phi=\log u_e-\log u_0$ 整体可积，$\mu-\mu_0=i\partial\bar\partial\Phi$ 总积分为零；$\mu_0$ 质量 `05-obstruction.tex:240-243`：

```
 \int_{\PP^1}\mu_0
 =\int_{\CC}\frac{b\,i\,dz\wedge d\bar z}{(1+|z|^2)^2}
 =4\pi b\int_0^\infty\frac{r\,dr}{(1+r^2)^2}
 =2\pi b.
```

(c) 机械理由。加 $\delta$ 的用场：$u*\rho_\delta$ 可以在小圆盘上近零，$\log$ 无定义，$+\delta$ 强制光滑正，极限里 $-\infty$ 被允许正是为此。$2\times2$ Levi 行列式是"$\lvert w\rvert^2$ 型函数 psh 等价于 $u$ 次调"的算子化：一维里 $(u)_{z\bar z}\ge0$ 加行列式条件合成 $\log u$ 次调，两条件缺一不可。指数 $b$ 出现在 $(1+\lvert z\rvert^2)^b$：tautological $\mathcal O(-1)$ 的帧值长度平方是 $1+\lvert z\rvert^2$，$b$ 次张量幂取 $b$ 次方。$\int_0^\infty\frac{r\,dr}{(1+r^2)^2}=\frac12$ 是代换 $s=1+r^2$ 的一行账，$4\pi\cdot\frac12=2\pi$；与 Chern--Weil 对表：$\frac{i}{2\pi}\Theta_{h_0}$ 积分给 $c_1(\mathcal O(-b))=-b$，本引理的 $\mu_0$ 是 $-\Theta$ 约定下的 $2\pi b$，符号在 `05-obstruction.tex:104-106` 专门声明：`Where $u_e$ is smooth and strictly positive, $\ddc\log u_e$ is the negative of the Chern curvature of the corresponding metric in our convention.` $\pi R^2$ 系数：圆盘面积；$C_0-\log u(z_0)\ge0$ 由 $C_0$ 可放大保证。原子不被切除：`05-obstruction.tex:246-247` 的 `Zeros of $u_e$ and any atoms of $\mu$ are included in the distributional calculation; no points have been excised.` 是质量守恒的下限保障。

[dense] 失败路线一：[推测] 我最初直接宣布"$\log u$ 的 $i\partial\bar\partial$ 是正测度，Poincaré--Lelong 说质量是零点计数"。Poincaré--Lelong 要求 $u$ 全纯式零点集解析；这里 $u$ 只是连续 psh 权重，可在一点无穷阶消失，零集不必离散；绕开的办法就是 mollify 加单调收敛，把"零点重数"换成"测度质量"，原文 `We prove local integrability at zeros before taking distributional curvature`（`05-obstruction.tex:77-78`）是这条路线的墓碑。[推测] 失败路线二：[推测] 可积性曾想逐盘硬算：在 $u(z_0)>0$ 的盘上 $\log u\ge\log$（次均值下界）可行，但全 $C$ 上 $u$ 有零点列时拼不起来，且没有一致 $C_0$；$\Omega$ 的开闭连通论证把"一点正"放大成"处处可积"，我第一次写的时候漏了"边界点附近找一个 $u>0$ 的点"这半步，导致 $\Omega$ 闭性没证完。[推测] 失败路线三：[推测] 不变性一开始用局部坐标暴力代换 $z\mapsto Tz$ 展开 $i\partial\bar\partial$：雅可比行列式与 $\log\lvert c\rvert^2$ 的调和项纠缠；改走"$i\partial\bar\partial$ 与全纯拉回交换"的抽象轨道一步清账。质量账也走过弯路：先用曲率形式的全局积分 $\int_{\mathbb P^1}\frac{i}{2\pi}\Theta=\deg$，再把 $2\pi$ 因子与 $i\partial\bar\partial$ 约定互推，两次符号事故才换成现在的参考度量直接积分。

### 9.3 引理 `lem:no-invariant-measure`：环带同测度与两点置换的合围

(a) 逐字引用，`05-obstruction.tex:258-263`：

```
\begin{lemma}
\label{lem:no-invariant-measure}
The projective transformations induced by the matrices $A$ and $B$ in
\eqref{eq:matrices} preserve no nonzero finite positive
Borel measure on $\PP^1$.
\end{lemma}
```

环带段 `05-obstruction.tex:269-278`：

```
C_n=\{z\in\CC^*:R^n\leq|z|<R^{n+1}\},\qquad n\in\ZZ,
\]
are pairwise disjoint, cover $\CC^*$, and satisfy $T(C_n)=C_{n+1}$.
Each has the same measure.  Finiteness and positivity imply that this
common measure is zero, and countable additivity gives
$\mu(\CC^*)=0$.  The half-open annuli assign every boundary circle to
exactly one set, so this argument applies equally to atomic and diffuse
measures and to nonreal $\lambda$.
```

支撑段 `05-obstruction.tex:280-285`：

```
Thus the nonempty support of $\mu$ consists of one or two of the fixed
points of $T$.  Invariance under $A$ and $B$ preserves this support as a
set: the inverse image of an open neighborhood of the image of a
support point has positive measure.  Both projective transformations
have order three.  Their induced permutations on a set of at most two
points are therefore trivial.
```

血统句在 `05-obstruction.tex:252-254`：`Concentration of invariant measures on proper projective subsets is a classical mechanism; see \cite[Lemma~2 and the proof of Lemma~3]{Furstenberg1976}.`

(b) 中间步骤补齐。设 $T=AB$。由 `lem:matrix-data`，$AB$ 有两个互倒正实特征值，模不同，取射影坐标把不动点搬到 $0$ 与 $\infty$，则 $T$ 作用为 $z\mapsto\lambda z$，$R=\lvert\lambda\rvert>1$（`05-obstruction.tex:266-268`）。第一围：$\mu$ 是 $T$ 不变的有限正 Borel 测度，$T(C_n)=C_{n+1}$ 给出 $\mu(C_{n+1})=\mu(T^{-1}C_{n+1})$… 方向核对用 $T^*\mu=\mu$ 即 $\mu(T(E))=\mu(E)$（$T$ 双射），故所有 $C_n$ 同测度 $\alpha\ge0$；$\mathbb P^1$ 紧，$\mu(\mathbb P^1)<\infty$，$\mu(\mathbb C^*)=\sum_{n\in\mathbb Z}\alpha$ 有限逼出 $\alpha=0$；$\mathbb C^*$ 被可数个 $C_n$ 覆盖，次可数可加给 $\mu(\mathbb C^*)=0$；于是 $\mu$ 全部质量缩在 $\{0,\infty\}$。$\mu\ne0$ 与紧支撑给支撑非空，支撑是 $\{0,\infty\}$ 的非空子集，一至二点。第二围：$A^*\mu=\mu$、$B^*\mu=\mu$，不变测度的支撑集在映射下作为集合保持：支撑点 $p$ 的像的任意开邻域 $V$，$T^{-1}(V)$ 是 $p$ 的邻域，测度 $>0$，故像还在支撑里（`05-obstruction.tex:282-283` 那句 inverse image 论证）。$A$、$B$ 各诱发 $\{0,\infty\}$ 子集上的置换，置换阶整除其射影阶 $3$，而 $\le2$ 点集上的对称群阶为 $1$ 或 $2$，$\gcd(3,2)=1$，置换只能平凡。每个支撑点被 $A$、$B$ 双双钉住，回到矩阵语言即公共特征线，`lem:matrix-data` 的无公共特征线宣告矛盾。半开设计 $[R^n,R^{n+1})$ 把每条边界圆 $\{|z|=R^n\}$ 归给恰好一个 $C_n$：若用闭环带，边界圆上的原子会被重复计数，"同测度"链条在 $T(C_n)$ 的边界像上出漏洞；开区间则会漏掉整条圆上可能的原子，覆盖不了 $\mathbb C^*$。

(c) 机械理由。$R=\lvert\lambda\rvert>1$ 严格大于 $1$ 由 $\operatorname{tr}(AB)=1+\sqrt2>2$ 保证，这是第 5 节双曲性选择在此处的兑现；$n\in\mathbb Z$ 双向指标覆盖 $0$ 附近与 $\infty$ 附近，单侧环带列会漏掉排斥不动点一侧的原子。"$\le2$ 点、阶整除 $3$"的群论是全文最后一颗螺丝：射影阶 $3$ 与支撑基数 $2$ 互素，对合方案的失败（第 5 节失败路线一）正是这颗螺丝的反例。$A$、$B$ 各自的 $3$ 阶用了一次半：其实只需 $A$ 阶为奇数且 $\ge3$，对称选 $A$、$B$ 是为了图的构造对称（三条图对 $A$、$B$、$A^{-1}B$ 均匀依赖），单侧奇阶加不对称会回头破坏第 6 节粘合的对称数据。

[dense] 失败路线一：[推测] 我用 ping-pong 论证起手，想让 $\langle A,B\rangle$ 为自由群进而"轨道太肥"排除有限不变测度。自由性根本排除不了不变测度：Fuchs 群的极限集上有 conformal density，有限性都不保证；真正干活的是 $T=AB$ 的单映射双曲结构，群结构信息其实只用了"$A$、$B$ 阶 $3$、无公共不动点"三条，我花了两天在更强的性质上找更强的结论。[推测] 失败路线二：[推测] 环带论证曾写成闭环带 $\{R^n\le\lvert z\rvert\le R^{n+1}\}$：相邻环共享边界圆，$\mu(C_n)$ 列不再常数（边界原子被两侧计入两次），"同测度"第一步就崩，是原子情形的经典事故；改半开后，边界归属唯一，原子与连续测度同权处理。[推测] 失败路线三：[推测] 支撑的"$A$、$B$ 保持"我先按"$A$ 保持 $\mu$-a.e. 点"处理，忘了支撑是拓扑概念而 a.e. 是测度概念，原子测度下两者集合差非空；改用开邻域逆像的论证（tex 原句）才把支撑的闭性用上。

### 9.4 命题 `prop:obstruction`：三引理合流

(a) 逐字引用，`05-obstruction.tex:293-299`：

```
\begin{proposition}
\label{prop:obstruction}
For the bundle $G$ of Proposition~\ref{prop:construction}, every finite
nonnegative plurisubharmonic function on the total space of $F=G^\vee$
whose restriction to each fiber is a Hermitian quadratic form is
identically zero.
\end{proposition}
```

合流账在 `05-obstruction.tex:301-308`：

```
If such a function were nonzero, Lemma~\ref{lem:ruling-reduction}
would give a nonzero squared seminorm on $\OO_{\PP^1}(-b)$ invariant
under the lifts of $A$ and $B$. Lemma~\ref{lem:seminorm-curvature}
would then produce a finite positive measure on $\PP^1$ of mass
$2\pi b>0$, invariant under both projective transformations.
This contradicts Lemma~\ref{lem:no-invariant-measure}.
```

(b) 中间步骤补齐。三段接力各自把对象降维一次：$q$ 在 $F$（复三维总空间）上，经 `lem:ruling-reduction` 压到 $\mathcal O_{\mathbb P^1}(-b)$（复二维），经 `lem:seminorm-curvature` 压到 $\mathbb P^1$ 上的测度（实二维），经 `lem:no-invariant-measure` 归零。每一段都只消费前一段输出的部分结构：第一段用纤维二次加 psh 加半定，第二段用半范数不变性加线丛次数 $-b$，第三段只用射影变换的阶与不动点配置。`05-obstruction.tex:5-9` 的开场白就是这条降维链的目录：`The two rulings and the three graph identities force a nonzero squared seminorm on $\OO_{\PP^1}(-b)$ that is invariant under the lifts of $A$ and $B$. We then turn that seminorm into a positive measure of mass $2\pi b$ and show that the two transformations cannot preserve such a measure.`

(c) 机械理由。质量 $2\pi b>0$ 里 $b=24$ 代入得 $48\pi$：只要 $b\ge1$，引理二给正质量，具体数值无关痛痒，但 $b$ 必须为正这一点把第 5 节"$L_i$ 用正幂 $\mathcal O(b,0)$"钉死；若当初为省次数取了 $b=0$（平凡粘合），质量账 $2\pi b=0$，矛盾链断在第三段入口。命题陈述不需要输入 $q$ 非零，这正是它能当"消去律"用的原因：第 8 节生产"非零"，第 9 节宣告"非零即矛盾"，分工干净。

[dense] 失败路线一：[推测] 曾想把 `prop:obstruction` 直接作用在输入度量上、跳过极限段：度量是正定的、其平方范数 psh 但纤维上正定，看似满足 `lem:ruling-reduction` 假设，实际 $q$ 需在整个 $F$ 上有限 psh，度量的平方范数在纤维方向增长太快，拉回后的 $a_i$ 在 $\mathcal O(-b)$ 总空间上有限性可保，但极大原理需要的"另一坐标上次调有上界"对逐 $m$ 度量族成立，测度段的质量却随 $m$ 漂移，不变性拿不到：不变性来自极限对象被三条图同时约束的结构，输入度量本身不受图约束。[推测] 失败路线二：[推测] 降维链第一版少了中间段，直接从 $q$ 对 $D$ 的限制读不变性：8.6 末的 `rmk:canonical-limit` 明说极限不保证对除子的限制收敛，这条捷径在代表元层面非法；补上"处处定义的 $q$ 逐点代入图关系"后才合法。[推测] 失败路线三：[推测] 用 Lelong 数替代测度质量：$a_\bullet$ 的零点 Lelong 数在无穷阶消失时可正可零，信息量不足 $2\pi b$ 的刚性；质量守恒要靠曲率形式的整体积分，Lelong 数是逐点量，撑不起置换论据。

## 10 主定理装配与最终思路和最初设想的差异

(a) 逐字引用，`06-conclusion.tex:10-18`：

```
If the set of positive integers $m$ for which $E_m$ has a smooth
strictly Griffiths-positive metric were infinite, it would contain
a sequence tending to infinity. Proposition~\ref{prop:limit} would
then give a finite, nonnegative, nonzero psh function on the total
space of $G^\vee$ that is a Hermitian positive semidefinite quadratic
form on every fiber. Proposition~\ref{prop:obstruction} excludes
precisely such a function. Consequently that set of integers is
finite. Choose $m_0$ larger than all its elements, taking $m_0=1$ if
the set is empty. Every $m\ge m_0$ gives the required counterexample.
```

收尾定性在 `06-conclusion.tex:21-25`：

```
The limit in the proof is permitted to lose rank, but not to vanish
identically or to lose its quadratic structure at any base point.
These are exactly the properties needed to transfer the
graph relations to a nonzero invariant measure. The argument requires no uniform estimates for the input metrics or
their curvature, and it does not determine an effective value of $m_0$.
```

(b) 中间步骤补齐。反证装配只有一个逻辑件：集合 $\mathcal{M}=\{m\ge1:\ E_m\ \text{有光滑严格 Griffiths 正度量}\}$ 若无穷，则有发散严格增序列 $m_k$；`prop:limit` 对任意这样的序列生产 $q$；`prop:obstruction` 说任何此类 $q$ 恒零；两句对撞，$\mathcal{M}$ 有限；取 $m_0>\max\mathcal{M}$（$\mathcal{M}=\varnothing$ 时 $m_0=1$），每个 $m\ge m_0$ 即定理所需反例。ample 侧无逻辑件，`prop:ampleness` 直接覆盖全体 $m\ge1$。

(c) 机械理由。`prop:limit` 的假设写成"无穷多个 $m$"、不是一列：装配时先做集合到序列的选择，这一步用可数选择，是 Lean 侧允许 `Classical.choice` 的触点之一。$m_0$ 的无效性来源登记完整：$\mathcal{M}$ 有限性由反证得，界来自"若每个有限集都有界"的非构造原则；`01-introduction.tex:38` 早已声明 `The threshold $m_0$ is obtained by compactness and is ineffective.`。

与最初设想的差异，我列四条。第一条，对象形态：最初要一个单独的 ample 丛无正度量，最终定理是一个幂拉回族加固定挠 $P$。族不是装饰：没有 $f_m$ 的 $m^2$ 重覆盖与 $P^{-m}\simeq f_m^*P^{-1}$ 的根吸收，蒸发机制不存在；而"全 $m$ ample"的强证书反过来又必须由族提供（第 7 节的 $n-1\ge3m$ 窗口只对拉回后的次数账成立）。第二条，$P$ 的双重职务：我起初只把 $\mathcal O(1,1)$ 当凑 ample 的正能量补丁，装配完才意识到它同时是极限机器里的可蒸发因子；一个线丛在同一证明里既进次数账又进帧律账，这个双职务是构造成型时才发现的。第三条，有效性期望落空：最初希望从曲率估计读出显式 $m_0$，最终版本刻意不做一致估计（`06-conclusion.tex:24-25`），换来的是对输入度量族零假设；两相对比，$m_0$ 无效是明码标价买下的代价。第四条，结论强度的错位：Du--Xie 排除的是半正度量（`01-introduction.tex:106-108`），Liu--Wan 排除的是 Finsler 半正曲率（`01-introduction.tex:120-124`），本篇只排除严格正；第 8 节极限里半定对象天然存活、正定结构必塌，想排除半正度量需要将 $q$ 的正性下推，而 `prop:obstruction` 连秩零都杀，强度差距恰好卡在极限机器能分辨与不能分辨的边界上。我最初的猜想版本要的就是"无半正"，最终版本退回"无严格正"，这个退让在第 1 节写下猜想时毫无预告，是极限方法论划定的地平线。

## 11 Lean 机器侧取证：一条 34 节全序脊柱

### 11.1 登记链与题面语言

登记三件套已核对：`formalization.yaml:1426` 指到 `ComparatorChallenges/QuadricBundles.json`，`1427` 写声明 `OAI.QuadricCounterexample.main_theorem`，`1428` 写文件 `OAI/Geometry/QuadricBundles/Main.lean`；json 的 `solution_module` 为 `OAI.Geometry.QuadricBundles.Main`，`permitted_axioms` 只列 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 关着，无 `Lean.mk` 级外部求解器参与。题面 `lean/ComparatorChallenges/QuadricBundles.lean` 共 9051 B，第 11 行 `open scoped Matrix.Norms.Elementwise ComplexOrder`，第 13 到 14 行

```
abbrev ProjectiveLine := OnePoint ℂ
abbrev QuadricSurface := ProjectiveLine × ProjectiveLine
```

第 167 到 172 行的 `SourceMainTheorem` 是定理的形式化原文：存在 `G : AlgebraicRankTwoBundle` 与 `E : ℕ → AlgebraicRankTwoBundle`，使每个 $m>0$ 满足 `IsPowerPullbackTwist G m (E m)`、`IsAmple (E m)`，且存在 $m_0>0$ 使所有 $m\ge m_0$ 的 `E m` 上不存在 `StrictlyGriffithsPositive` 的 `SmoothHermitianMetric`。第 174 到 175 行 `theorem main_theorem : SourceMainTheorem := by sorry`。语言层四个构件值得一一点名。`AlgebraicRankTwoBundle`（题面 49 到 66 行）把丛交给"图表索引 `chart`、开集方程 `equation`、转移矩阵 `transition`"三件套加正合性与代数正则性公理，是逐点 cocycle 描述，并非层论描述。`IsPowerPullbackTwist`（85 到 91 行）里拉回 $f_m^*$ 的作用分两路：开集方程经 `MvPolynomial.bind₁ fun j ↦ MvPolynomial.X j ^ m` 做变量代换 $z_j\mapsto z_j^m$（题面 88 行），转移矩阵则按

```
    E.transition i j x = polarizationTransition (G.chart i) (G.chart j) x •
      G.transition i j (powerQuadric m x)
```

（89 到 91 行）合成：`powerQuadric m` 搬基点，`polarizationTransition` 乘上 $\mathcal O(1,1)$ 的逐图标量。而 `polarizationTransition`（82 到 83 行）拆成两个 `hyperplaneTransition`（80 到 81 行）的乘积，后者在跨仿射图时正好乘 `coordP1 i x`，即 tautological 补线的坐标转移。于是 $E_m=f_m^*G\otimes P$ 整个在转移矩阵层面成立，没有一句话需要齐次坐标。`SmoothHermitianMetric`（151 到 158 行）的字段名值得停住：它是 `dualMatrix`，对偶度量矩阵，兼容性写成 `dualMatrix j = (dualTransition i j).conjTranspose * dualMatrix i * dualTransition i j`，与 tex 第 8.4 节的 $H'_m$ 转移律同形（差别只在 tex 那边多出的帧因子 $\lvert g\rvert^{2/m}$ 被 trace 构造吃掉了）。`StrictlyGriffithsPositive`（160 到 165 行）把曲率写成实 Fréchet 导数的代数组合：

```
    (metricMixedHessian (h.dualMatrix i) z u -
      (holomorphicMetricDerivative (h.dualMatrix i) z u).conjTranspose *
        (h.dualMatrix i z)⁻¹ * holomorphicMetricDerivative (h.dualMatrix i) z u).PosDef
```

`holomorphicMetricDerivative`（142 到 144 行）取 $\frac12(\operatorname{fderiv}_{\mathbb R}H(z)u-i\cdot\operatorname{fderiv}_{\mathbb R}H(z)(iu))$，`metricMixedHessian`（146 到 149 行）取 $\frac14$ 乘两方向二阶混合，$\frac12$ 与 $\frac14$ 是 Wirtinger 换算的标准系数；对整个 $u\ne0$ 要求该 `TwoMatrix` 正定，正是"切方向 $u$ 配任意非零纤维方向"的 Griffiths 计数。解侧 `Main.lean` 共 886 B，10 到 28 行是三字段装配：取 `G := sourceGraphScalars.equalizerData.bundle`，`E m` 用 `dite` 按 $m>0$ 选 `powerPullbackTwist`，三球分别交 `powerPullbackTwist_spec`、`sourceGraphScalars.equalizerData.powerTwist_ample`、`source_eventually_no_positive_metric`。

### 11.2 34 个文件的全序 import 脊柱

实测：模块内 34 个 `.lean`，每个文件恰好 import 同目录的一个邻居（`Model.lean` 只 import Mathlib），依赖图是一条 34 节全序链，无任何分叉。链序（自顶向下）为：`Main` ← `Ampleness` ← `Embedding` ← `ProjectiveEquations` ← `PolynomialGeneration` ← `SymmetricFlags` ← `RegularMatrices` ← `TriangularSections` ← `LaurentCech` ← `BinaryForms` ← `Noncollapse` ← `DualForms` ← `HomogeneousClassification` ← `MatrixDynamics` ← `Gluing` ← `WeakBaseChange` ← `PointwiseRepresentative` ← `TraceExtraction` ← `TraceMetrics` ← `Compactness` ← `WeakLimits` ← `MatrixRepresentative` ← `BallAverage` ← `RootTrace` ← `Removability` ← `Curvature` ← `Plurisubharmonic` ← `DiskHessian` ← `Graphs` ← `Equalizer` ← `LineFactors` ← `Regularity` ← `Charts` ← `Model`。逐文件实测字节与顶层声明计数如下表。

| 文件 | 字节 | 声明数 | 直接依赖 |
| --- | --- | --- | --- |
| Main.lean | 886 | 1 | Ampleness |
| Ampleness.lean | 608 | 1 | Embedding |
| Embedding.lean | 24255 | 39 | ProjectiveEquations |
| ProjectiveEquations.lean | 21630 | 46 | PolynomialGeneration |
| PolynomialGeneration.lean | 8754 | 18 | SymmetricFlags |
| SymmetricFlags.lean | 11018 | 24 | RegularMatrices |
| RegularMatrices.lean | 14713 | 34 | TriangularSections |
| TriangularSections.lean | 14734 | 30 | LaurentCech |
| LaurentCech.lean | 24289 | 66 | BinaryForms |
| BinaryForms.lean | 29823 | 72 | Noncollapse |
| Noncollapse.lean | 13928 | 11 | DualForms |
| DualForms.lean | 29345 | 56 | HomogeneousClassification |
| HomogeneousClassification.lean | 16460 | 16 | MatrixDynamics |
| MatrixDynamics.lean | 19483 | 32 | Gluing |
| Gluing.lean | 15812 | 16 | WeakBaseChange |
| WeakBaseChange.lean | 16954 | 24 | PointwiseRepresentative |
| PointwiseRepresentative.lean | 14016 | 21 | TraceExtraction |
| TraceExtraction.lean | 7569 | 15 | TraceMetrics |
| TraceMetrics.lean | 34072 | 50 | Compactness |
| Compactness.lean | 26308 | 16 | WeakLimits |
| WeakLimits.lean | 20538 | 19 | MatrixRepresentative |
| MatrixRepresentative.lean | 23540 | 22 | BallAverage |
| BallAverage.lean | 7688 | 7 | RootTrace |
| RootTrace.lean | 13501 | 27 | Removability |
| Removability.lean | 47591 | 41 | Curvature |
| Curvature.lean | 22464 | 32 | Plurisubharmonic |
| Plurisubharmonic.lean | 22111 | 30 | DiskHessian |
| DiskHessian.lean | 15957 | 20 | Graphs |
| Graphs.lean | 37601 | 116 | Equalizer |
| Equalizer.lean | 14412 | 38 | LineFactors |
| LineFactors.lean | 10194 | 33 | Regularity |
| Regularity.lean | 11092 | 23 | Charts |
| Charts.lean | 15951 | 33 | Model |
| Model.lean | 8980 | 34 | Mathlib |

全序脊柱的工程含义：每个文件对下游只暴露一层接口，证明检索被迫沿链单行道走；代价是像 `Gluing.lean` 这类代数味文件也排在分析文件 `WeakBaseChange.lean` 之后，命名与分层脱钩；红利是任何一步失败都能定位到唯一上游。字节分布同样有话：最大头 `Removability.lean` 47591 B 落在"分支轨迹可删奇点"（tex 第 8.3 节一段），`Graphs.lean` 37601 B 与 116 条声明落在矩阵与图的多项式账，`TraceMetrics.lean` 34072 B 落在 trace 与归一化，`BinaryForms.lean` 29823 B 落在二元型。tex 里一句"引用 Demailly CADG 定理 5.24"的便宜，在 Lean 里是 47591 B 的自证。

### 11.3 定点深读：$A$、$B$、$b=24$ 与装配口

`Graphs.lean:531-541` 的 `def sourceGraphScalars : GraphScalars` 把矩阵数据打包：字段 `a := source_a`、`s := source_s`、`b := 1`、`c := (Real.sqrt 2 : ℂ)/3`，加证明字段 `a_cube`、`determinant`、`relative_trace`、`b_ne_zero`、`c_ne_zero`。注意这里 `b` 是 $B=\begin{pmatrix}s&1\\ \sqrt2/3&1-s\end{pmatrix}$ 的 $(0,1)$ 元，与 tex 的挠指数 $b=24$ 无涉，读码时两个 $b$ 必须分开记。`Graphs.lean:500-528` 区段是常数群：`source_a_square`（$a^2-a+1=0$）、`source_a_cube`（$a^3=-1$）、`source_a_twentyfour`（$a^{24}=1$，证明走 `(a^3)^8`）、`source_graph_trace`（$\operatorname{tr}(A^{-1}B)=-\sqrt2$ 的标量形态 `source_s+source_a^2*(1-source_s)+(Real.sqrt 2 : ℂ)*source_a=0`），全部 `linear_combination` 收口，无 `norm_num` 硬算超越式的痕迹。紧随其后（`Graphs.lean:544` 起的 `GraphScalars.swapped`）定义配对交换 $T\mapsto T^{\mathrm{sw}}$：`a := T.a⁻¹`、`s := 1-T.s`、`b` 与 `c` 互换，并证 `swapped_swapped : T.swapped.swapped=T`。这正是 tex 第 6 节"$\lambda$ 换 $\lambda^{-1}$ 覆盖反向对"的机器化身：节点相容对 $(M,N)$ 与 $(N,M)$ 的对称性被做成一个对合。`Graphs.lean:865` 附近的下降计算里有整块我认为是全文最贴身的一步：

```
  have hdp := congrArg (fun a : ℂ ↦ a^24) hd
  simp only [mul_pow] at hdp
  apply mul_right_cancel₀ (pow_ne_zero 24 hd')
```

其后三行 `calc` 把 `firstFactor i j z^24`、`matrixBranchDenominator (T.matrices k) i z^24`、`secondFactor i j z^24` 拼成一条 24 次幂恒等式，对应 tex `02-construction.tex:144-146` 的 $(Nv)^{\otimes b}=(Mv)^{\otimes b}$，只是搬到了仿射分母语言：跨图转移的 24 次方在重叠上相等。`Graphs.lean:873-881` 的 `def equalizerData : EqualizerData` 把 `divisorPolynomial`、`chartLift` 及 `divisorPolynomial_reduced/nonzero/change`、`chartLift_change/unit` 六件性质灌进结构，`Graphs.lean:884` 一句 `def sourceBundle : AlgebraicRankTwoBundle := sourceGraphScalars.equalizerData.bundle` 产出 $G$。拉回构造在 `Charts.lean:300` 的 `def powerPullbackTwist (G : AlgebraicRankTwoBundle) (m : ℕ) (hm : 0 < m)`，`Charts.lean:334-336` 给 `powerPullbackTwist_spec`（即 `IsPowerPullbackTwist G m (powerPullbackTwist G m hm)`），`Charts.lean:338` 的 `exists_powerPullbackTwist` 用同款 `dite` 造族，`Main.lean:12-13` 的 `E` 与之逐字同形。ample 证书在 `Ampleness.lean:10-16`：

```
theorem EqualizerData.powerTwist_ample (D : EqualizerData) (m : ℕ) (hm : 0 < m) :
    IsAmple (powerPullbackTwist D.bundle m hm) := by
  let t := 3*m+1
  let e := 2*t-1
```

随后 `have he : 3*m≤e`、`have hen : e+1=2*t`，取 `S := D.ampleSystem m hm e t he hen`，交 `⟨2*t,hn,_,S.sections,S.closedEmbedding hn⟩`。对表 tex：Lean 恒取 $n=2t=6m+2$、$e=n-1=6m+1$，落进"$n$ 偶且 $n-1\ge 3m$"窗口且离下界有余量；tex 陈述整个窗口，Lean 只要一个可计算的取值。嵌入机器在 `Embedding.lean:192`（`powerTwist_cover` 给拉回丛的标准图覆盖）与 `Embedding.lean:285`（`SegreSectionSystem (powerPullbackTwist D.bundle m hm) (2*t) (SymmetricGeneratorIndex t)`），对应 tex 第 7.1 节 Veronese 加 $P$ 加 Segre 的三步合成。矛盾总装在 `Noncollapse.lean`：`no_unbounded_positive_metrics`（签名区在 239 到 246 行，度量族存在性参数在第 243 行）把"无界序列 $ex$ 上每点有正度量"折成 `ExtractedTrace`（247 到 250 行的 `choose` 三连：`exists_normalized`、`exists_extractedTrace`、`globalValue_nonzero`），`Noncollapse.lean:252` 的 `theorem source_eventually_no_positive_metric` 用 `by_contra`、`choose ex hex hbound hm`、`tendsto_atTop_mono` 三拍把"不存在 $m_0$"的反设炼成发散序列喂给前者。tex `06-conclusion.tex:10-18` 的同一段装配在这里全是 tactic 流水。

### 11.4 OnePoint 摊平与逐元范数记账的形式化选择

题面第 13 行 `ProjectiveLine := OnePoint ℂ` 决定了几何底：$\mathbb P^1$ 是 $\mathbb C$ 加一个无穷点，$\mathbb P^1\times\mathbb P^1$ 是其平方。坐标进出走 `affineP1`/`coordP1`（题面 19 到 28 行），无穷远图经 `reciprocalP1` 取倒数，幂映射 `powerP1` 对 $\infty$ 直接定值（30 到 33 行）。与 tex 用 $[z_0:z_1]$ 齐次坐标的写法对照，这个选择的三笔账要摊开。第一笔，分析接口：`fderiv ℝ`、`ContDiffOn ℝ` 的定义域只能是 `\CC\times\CC` 型仿射片与矩阵空间，齐次坐标在 Lean 里是射影商空间，`ContDiff` 结构要穿 `Quot`；`OnePoint` 摊平后，`SmoothHermitianMetric` 直接对 `BaseCoordinates → TwoMatrix` 的光滑族说话，第 11.1 节那条曲率公式才有落处。第二笔，图的完整性：`covers : ∀ x : QuadricSurface, ∃ i, x ∈ principalChart ...`（题面 54 行）要求四片仿射图真的覆盖含 $\infty$ 的平方，`reciprocalP1` 的两个 `if`（`∞` 分支与 $z=0$ 分支）就是为闭合这个全覆盖；代价转进了 `Charts.lean`、`RegularMatrices.lean`、`LineFactors.lean` 的转移簿记，tex 侧一行 $\mathcal O_S(r,s)=p_1^*\mathcal O(r)\otimes p_2^*\mathcal O(s)$ 在这里是逐图逐向量的方程。第三笔，幂映射的行为：`powerP1 m ∞ = ∞`、$0$ 与 $\infty$ 都是分歧点，tex 第 8.3 节"分支集包含在 $\{z_1z_2=0\}$"的陈述在仿射片里要按四片分别说，`Removability.lean` 47591 B 的体量与此直接相关。`open scoped Matrix.Norms.Elementwise ComplexOrder`（题面 11 行）配套第二笔：`TwoMatrix` 的范数取逐元（entrywise）形态，估计链把"$H_m$ 一致有界"拆成四个矩阵元各自有界，与 tex 用算子范数 $\|H_m\|\le C$ 一杆过账形成镜像；`ComplexOrder` 提供 $\mathbb C$ 的线性序记号，服务于正定与不等式面的写法。曲率侧的镜像同样清楚：tex 靠"取法坐标架使 $h=\operatorname{Id}$、一阶导消失"把 $\Theta$ 化成 $-\partial\bar\partial h$（`04-limit.tex:38-44`），Lean 拒绝走架归一，直接把规范协变的组合式 $\partial\bar\partial h-\partial h\cdot h^{-1}\cdot\bar\partial h$ 写死在两个 Wirtinger 算子（$\frac12$、$\frac14$ 系数）上，配合 `compatible` 的共轭转置转移律保证逐图定义拼成整体。同一枚曲率，tex 用几何归一化记账，Lean 用代数恒等式记账；两边在 `TraceMetrics.lean:441`（`StrictlyGriffithsPositive` 输入 trace 侧的起点）与 `DiskHessian.lean`（文件名即 tex 标签 `eq:limit-dual-hessian` 的机器化身）完成对接。

## 12 两侧对账与异常登记

### 12.1 tex 步骤与 Lean 模块的映射账

把第 5 到第 10 节的 tex 主干逐段放到 34 节脊柱上，映射（模块归属从命名、import 位置与我在 11.3 读到的片段推断，标注推断度的我会在句尾留痕）如下。构造主干：`02-construction.tex:19-62` 的矩阵数据落在 `Graphs.lean:500-541`（`source_*` 常数群与 `sourceGraphScalars`），对称性落在同文件 `swapped` 对合（推断），节点 24 次幂落在 `Graphs.lean:860-878` 的 `calc` 块；`02:93-131` 的 $L_i$、$\alpha$、等子落在 `Equalizer.lean` 与 `Graphs.lean:873-884` 的 `equalizerData`、`sourceBundle`；局部基与商列（`02:151-190`）落在 `LineFactors.lean`、`Regularity.lean`、`Charts.lean`（推断）。幂拉回：`02:193-202` 落在 `Charts.lean:300,334,338`。ample 主干：`03:43-86` 的交替滤过落在 `SymmetricFlags.lean`（名字即对称幂旗）与 `TriangularSections.lean`（三角单项式截面，推断）；`03:88-105` 的节点局部自由账落在 `RegularMatrices.lean`（推断）；`03:107-133` 的全局生成与上同调消失落在 `PolynomialGeneration.lean` 与 `LaurentCech.lean`（Laurent 展开对 Čech 相容性，推断）；`03:135-165` 的 Veronese 与 Segre 落在 `ProjectiveEquations.lean`、`Embedding.lean:192,285`、`Ampleness.lean:10-16`。极限主干：`04:36-56` 落在 `DiskHessian.lean`；`04:58-100` 落在 `RootTrace.lean` 与 `Removability.lean`（47591 B 的全场最重文件，对应tex 一行引理引用）；`04:102-122` 落在 `TraceMetrics.lean:22-36,235-300`；`04:124-159` 落在 `WeakLimits.lean` 与 `Compactness.lean`；`04:161-193` 落在 `Noncollapse.lean`；`04:196-287` 的卷积、单调、极化落在 `MatrixRepresentative.lean`、`BallAverage.lean`、`PointwiseRepresentative.lean`；`04:289-306` 的重叠粘合落在 `WeakBaseChange.lean`、`Gluing.lean`。障碍主干：`05:13-66` 落在 `DualForms.lean`（`PshDualForm`、`secondNorm`、`source_matrices_*` 在 470-472、542-546 附近）；`05:80-248` 的对数曲率与质量账落在 `Curvature.lean`、`Plurisubharmonic.lean`，零点计数与齐次化落在 `HomogeneousClassification.lean`、`BinaryForms.lean`（二元型即 $\mathbb P^1$ 上除子的方程语言，推断）；`05:258-288` 的环带与置换落在 `MatrixDynamics.lean`；`06:4-25` 落在 `Noncollapse.lean:252` 与 `Main.lean:10-28`。两条"字节 vs 版面"的读数值得写下：声明数冠军 `Graphs.lean` 116 条与 `BinaryForms.lean` 72 条都是代数簿记；字节冠军 `Removability.lean` 与 `TraceMetrics.lean` 都是解析估计。tex 的篇幅分配几乎按反比走：代数一段一个引理，解析一段一句带过引用文献，机器侧把引用文献的钱全部付回到 `Removability.lean`。

### 12.2 两处陈述级差异的登记

差异一：证书窗口。tex 命题 2.1（`03-ampleness.tex:10-15`）声明"每个偶数 $n$ 满足 $n-1\ge 3m$"的整窗 very-ampleness；Lean 的 `IsAmple` 只要求存在某个 $n>0$ 给闭合嵌入，`Ampleness.lean` 取定 $n=6m+2$。机器侧的陈述严格弱于纸面侧，纸面的窗口信息在 Lean 里进了 `ampleSystem` 的参数（$e=2t-1$ 的传递，`Ampleness.lean:15`），窗口的"全体偶数"量化没进声明。差异二：$E_m$ 的族对象。tex 的 $E_m$ 是"给定的显式公式"；Lean 的 `E` 用 `dite` 在 $m>0$ 处选 `powerPullbackTwist`、在 $m=0$ 处退回 `G` 本身（`Main.lean:12-13`），$m=0$ 的值是类型层填充，`SourceMainTheorem` 的两重量化都锁在 $m>0$。两处都属于"机器侧故意留余量"，登记备查。

### 12.3 本笔记自身的异常登记

按落盘纪律，异常不自修，登记交本体处理。其一，文风违规残留：第 1 批落盘（第 1 至 4 节）在三处用了成对的中文长破折号插入语，两处用短破折号连接了人名对（Miyaoka 与 Yau 一处、Arzelà 与 Ascoli 一处），位置分别在第 1 节末段"思路"句、第 3 节 Pingali 引文后的补足句、第 3 节 $c_2$ 段与第 4 节末段；第 2 批之后全部改用逗号、冒号与 `--`。其二，引文校勘：8.4(a) 我在代码块后加了一条括注，声称原文第 153 行写作 `\|\Phi|_{L^1}` 的形态；对照我在场时读取的原始行，第 153 行应以 `\le C_K\|\Phi\|_{L^1}` 为准，那条括注对原文形态的判断可疑，代码块本身的转录与原文一致，括注请本体按 tex 原件校处。其三，过程流水：取证阶段合计 16 次调用；首次落盘为第 18 次调用的 Write（15858 B，含第 0 至 4 节）；此后每节一批 Edit 追加，其中三次工具调用失败各重试一次（一次参数缺字段、一次锚点不复存在、一次锚点串尾随空白失配），均无重复落盘；全篇主体（第 0 至 12 节）在第 35 次调用前后落齐，第 13 节台账为末批。其四，`grep` 预检说明：规格禁止的那五个提示层引导语、被禁的对举句式与词、单行分隔线（表格分隔行按规格形态保留，属表头，并非分隔线）、em dash 类连接，交稿前逐项扫过，命中的历史残留在本条其一，位置写清交本体。

### 12.4 还没回答的问题

三条我拒绝硬编的悬账。第一条，Du--Xie 与 Liu--Wan 的排除强度更强（半正、Finsler），他们的机器是否暗示 `prop:limit` 存在保正定的变体；我在这份材料里没有找到任何把降秩极限提回正定的装置，`06-conclusion.tex:21` 明说允许降秩。第二条，曲率约定与质量符号的三处联动（第 8.2 节(c)）在 Lean 侧只有 `PosDef` 一杆，纸面引理二若整体翻号，机器侧的 `metricMixedHessian` 定义会先炸，这个"谁先断"的顺序我只验证到推断级。第三条，外部谱系里"强 Fano 三例"的线索，我一次检索未能落到可点名文献（第 2 节），笔记里所有谱系断言都停在 tex 引注与检索命中的 Chern--Weil 正性外围文献（`arXiv:2012.12815` 等）能支撑的范围；若本体有该线索的可靠来源，应补进第 2 节，并非由我转述。

## 13 数值与符号台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $b=24$ | $6,6,8$ 的公倍数 | 02-construction.tex:94 | 节点相容 $\lambda^{24}=1$ 与 $\alpha\mid_{\Gamma_M}=M^{\otimes b}$ | 02-construction.tex:144 两分支纤维值不等，$\alpha$ 拼不出 |
| $A,B,A^{-1}B$ 之阶 | $6,6,8$ | 02-construction.tex:34-35 | $b=24$ 的 lcm；`Graphs.lean:508` 的 `source_a_twentyfour` | 02-construction.tex:143 的 $\lambda^{24}=1$ 断，第 6 节下降失效 |
| $A,B$ 射影阶 | 均为 $3$ | 02-construction.tex:36 | 05-obstruction.tex:284 至多两点置换平凡 | 阶改 $2$ 则对换可行，05-obstruction.tex:287 公共特征线矛盾消失 |
| $\operatorname{tr}A=\operatorname{tr}B$ | $1$ | 02-construction.tex:30 | 特征多项式 $t^2-t+1$，根 $e^{\pm i\pi/3}$ | 02-construction.tex:47-49 阶论证断 |
| $\operatorname{tr}(A^{-1}B)$ | $-\sqrt2$ | 02-construction.tex:31 | $t^2+\sqrt2t+1$，根 $e^{\pm 3i\pi/4}$ 阶 $8$ | 02-construction.tex:49 断，lcm 变，$b$ 重算 |
| $\operatorname{tr}(AB)$ | $1+\sqrt2>2$ | 02-construction.tex:56 | $AB$ 双曲：正实互倒特征值 | 05-obstruction.tex:267 无 $R\ne1$，环带分解停摆 |
| $R=\lvert\lambda\rvert$ | $R>1$ | 05-obstruction.tex:268 | $T(C_n)=C_{n+1}$ 同测度链 | $R=1$ 时 05-obstruction.tex:273 覆盖论证失效 |
| $s=\frac12-\frac{i(1+2\sqrt2)}{2\sqrt3}$ | 满足 $s(1-s)=1+\frac{\sqrt2}{3}$ | 02-construction.tex:21,43 | $\det B=1$ 与 $\operatorname{tr}(A^{-1}B)=-\sqrt2$ 双约束 | 02-construction.tex:46 行列式与迹的联合解唯一性破 |
| $B$ 左下元 | $\frac{\sqrt2}{3}$ | 02-construction.tex:23 | 补上 $\det B=1$ 的余量 | 改值则 `Graphs.lean:531-541` 的 `c_ne_zero` 与 `determinant` 字段同时报错 |
| $D$ 双次数 | $(3,3)$ | 02-construction.tex:72 | $\mathcal O_S(\widetilde D)=\mathcal O_S(3m,3m)$ | 03-ampleness.tex:38 失配，$K_i$ 次数全变 |
| $D$ 节点数 | $6$ 个普通二重点 | 02-construction.tex:72-73 | 逐点下降正合列 $0\to R/(xy)\to R/(x)\oplus R/(y)$ | 02-construction.tex:154 出现三重交点后核不匹配 |
| $\deg f_m$ | $m^2$ | 01-introduction.tex:21 | trace 权重 $\frac{1}{m^2}$ 与求和计重数 | 04-limit.tex:64 归一化漂移，04-limit.tex:117 的 $\max=1$ 安排不保 |
| $f_m^*P\simeq P^{\otimes m}$ | 指数 $m$ | 02-construction.tex:198 | 根帧吸收 $(f_m^*t)^{1/m}$ | 04-limit.tex:104 帧律失去 $\frac{2}{m}$ 纯幂形，$P$ 蒸发失败 |
| $\widetilde L_1,\widetilde L_2$ | $\mathcal O_S(24m,0),\mathcal O_S(0,24m)$ | 03-ampleness.tex:20 | 滤过因子双次数表 | 03-ampleness.tex:115 的 $24m(n-2j)$ 行项缺失 |
| $K_1$ | $\mathcal O_S(21m,-3m)$ | 03-ampleness.tex:33 | 交替滤过的负源 $-3m$ | 03-ampleness.tex:119-120 的抵消句失效 |
| $K_2$ | $\mathcal O_S(-3m,21m)$ | 03-ampleness.tex:33 | 与 $K_1$ 配对 | 单列滤过时负项线性累积（第 7.1 节失败路线一） |
| $K=K_1K_2$ | $\mathcal O_S(18m,18m)$ | 03-ampleness.tex:37 | $K^j$ 的正性驱动全局生成 | 03-ampleness.tex:122-124 的非负性断 |
| $n-1\ge 3m$ | very-ampleness 窗口下界 | 03-ampleness.tex:14 | 证书陈述与 $j=0$ 行的 $\ge$ 判定 | 03-ampleness.tex:116 第二行出现负二次式 |
| $W=\operatorname{Sym}^nV\otimes P^{n-1}$ | 挠指数 $n-1$ | 03-ampleness.tex:110 | 滤过因子加 $n-1$ 到两坐标 | 03-ampleness.tex:158-160 的 $\bigl(\mathcal O(1)\otimes\pi^*P\bigr)^n$ 闭合失败 |
| $(9mn+n-1,9mn+n-1)$ | 顶层因子 $K^{n/2}\otimes P^{n-1}$ | 03-ampleness.tex:117 | $n$ 偶的整除性 $2\mid n$ | 03-ampleness.tex:78 残束非线丛，滤过线丛化中断 |
| $H^1(S,\mathcal O(c,t))$ | $c,t\ge0$ 时为零 | 03-ampleness.tex:123-126 | 逐层截面提升 | 03-ampleness.tex:127-133 提升引理在首现负因子层断 |
| $q_{m,t}$ | $\frac{1}{m^2}\sum_{y\in f_m^{-1}(x)}$ 计重数 | 04-limit.tex:63-66 | Hermit 二次性与跨分支连续性 | 04-limit.tex:83-85 多重集连续失效则跳变 |
| $\lvert g\rvert^{2/m}$ | 帧变换律乘子 | 04-limit.tex:104 | $N_m$ 的整体良定义与 $o(1)$ 误差 | 04-limit.tex:150-155 的 $\sup_K$ 因子不趋零，转移律断 |
| $\max N_m=1$ | 单位球丛归一 | 04-limit.tex:116-118 | 极大子列 $(x_m,v_m)$ 存在 | 04-limit.tex:162 无最大化序列可选 |
| $u_m(x_m)\ge\frac12$ | 半余量松弛 | 04-limit.tex:178-180 | 次均值下限 | 04-limit.tex:188-189 积分下界变零 |
| $\frac12\operatorname{Vol}(B(0,\varrho))$ | 固定体积底线 | 04-limit.tex:186-190 | $\langle H,\chi cc^*\rangle>0$ 配对 | $\varrho$ 若随 $m$ 动则右端趋零，非零断 |
| $\delta^{-4}$ | 实四维 Jacobian | 04-limit.tex:221 | 卷积核 $\int\rho_\delta=1$ | 04-limit.tex:249-253 权重含 $\delta$，单调性断 |
| $\mathbb S^3$ 与 $s^3$ | 球面面积因子与极坐标权 | 04-limit.tex:249-253 | 球均值单调比较 | 04-limit.tex:257-263 的 $H_{\delta_1}\le H_{\delta_2}$ 序失效 |
| $e_j,e_j+e_k,e_j+ie_k$ | 极化三元组 | 04-limit.tex:273-277 | 逐点矩阵 $\widehat H_U(x)$ 重建 | 缺 $e_j+ie_k$ 则虚部无定义，二次代表元断 |
| $a_\bullet(Mx,M^{\otimes b}v)=a_\bullet(x,v)$ | $M\in\{A,B\}$ 不变 | 05-obstruction.tex:21-22 | 引理 5.2 的测度不变性 | 05-obstruction.tex:96 的 $T^*\mu=\mu$ 推不出 |
| $\mu(\mathbb P^1)=2\pi b$ | $b=24$ 时 $48\pi$ | 05-obstruction.tex:98-100 | `prop:obstruction` 的正质量矛盾 | 05-obstruction.tex:307 质量零则无矛盾 |
| $u_0(z)=(1+\lvert z\rvert^2)^b$ | 参考度量权重 | 05-obstruction.tex:224 | 质量账与 $\Phi$ 可积性 | 05-obstruction.tex:231-233 的差为零失效 |
| $\int f_\delta^-\le\pi R^2(C_0-\log u(z_0))$ | 负部一致界 | 05-obstruction.tex:161-163 | $\log u$ 局部可积与 $\Omega$ 传播 | 05-obstruction.tex:185-187 边界点归不进 $\Omega$ |
| $\gcd(3,2)=1$ | 阶互素于支撑基数 | 05-obstruction.tex:283-285 | 置换平凡、公共不动点 | 05-obstruction.tex:286-287 末步矛盾解除失败 |
| $t=3m+1,\ n=2t$ | Lean 侧 $n=6m+2$ | Ampleness.lean:12-16 | `IsAmple` 见证与 `ampleSystem` 参数 | `Main.lean:22` 的 `powerTwist_ample` 供不上第二球 |
| `pow 24` 消元块 | $\operatorname{congrArg}(\cdot^{24})$ 与 $\operatorname{mul\_right\_cancel\_0}$ | Graphs.lean:865-867 | `chartLift_change` 的跨图 24 次幂恒等 | `equalizerData`（Graphs.lean:873）装配断链 |
| `dite` 族 $E$ | $m>0$ 选 `powerPullbackTwist` | Main.lean:12-13, Charts.lean:340 | `SourceMainTheorem` 前两球 | `dite_eq_left` 重写（Main.lean:17）失配 |
| `StrictlyGriffithsPositive` 系数 | $\frac12$ 与 $\frac14$ 的 Wirtinger 常数 | ComparatorChallenges/QuadricBundles.lean:142-149 | 曲率式 PosDef 判定（160-165 行） | 04-limit.tex:43 法架算账与机器式对表断 |
| `source_eventually_no_positive_metric` | 存在性 $m_0>0$ | Noncollapse.lean:252-266 | `Main.lean:23` 第三球 | `by_contra` 取序列段（255-262）与 `tendsto_atTop_mono` 断 |
| `main_theorem` 声明 | `OAI.QuadricCounterexample.main_theorem` | formalization.yaml:1427, Main.lean:10 | json `theorem_names` 比对 | yaml 行或命名空间移位，comparator 定位失败 |
| 模块脊柱长度 | $34$ 文件全序链 | lean/OAI/Geometry/QuadricBundles/ 全目录实测 | 任何单文件失败的定位 | 出现分叉 import 则单层接口假设破 |
| `Removability.lean` | 47591 B，全场最重 | 实测目录清单 | 04-limit.tex:90-100 可删奇点的自证 | 该文件断则 $q_{m,t}$ 只在全部分支补集上 psh |
| 允许公理集 | `propext`、`Quot.sound`、`Classical.choice` | ComparatorChallenges/QuadricBundles.json | 非构造装配（反证与选择）合法性的边界 | 加第三方公理则 comparator 拒绝 |
| `enable_nanoda` | false | ComparatorChallenges/QuadricBundles.json | 求解器隔离，证明纯手写 | 置 true 后谱系核查责任变，台账第 2 节口径失效 |
