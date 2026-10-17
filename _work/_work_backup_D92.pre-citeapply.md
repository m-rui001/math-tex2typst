# D92-L_p 次多项式降维:重尾矩台账与截断 ramp 的取证笔记

写在前面的话:这份笔记按"正在做这项研究的我"的视角展开。我读的对象是队列 120 行的 preprint《Subpolynomial dimension reduction in $L_p$》(署名 OpenAI, 2026-09-23, 目录 `E:\math\preprints\Subpolynomial-dimension-reduction-in-Lp-September-23-2026\`)。取证纪律:正文素材只来自 `build/paper.tex`;PDF 一个字没碰;Lean 侧只看登记文件与本模块目录。所有行号都是我用 Grep/Read 实测的,不是转抄。

## §0 paper.tex 布局与条目地图实测

### 0.1 目录与文件

实测目录列表:`README.md`、`build`、`paper.pdf`、`typst`。正文唯一 tex 是 `build/paper.tex`, `wc -c` 报 56,834 B, `wc -l` 报 1,467 行。唯一的图源文件是 `build/figures/truncation-ramp.tex`, 38 行, 1,576 B,是一张纯 tikz 图(我在 §5.8 逐段解读它)。`paper.pdf` 我按纪律没有读取。

### 0.2 宏包与计数器(paper.tex:1-44)

序言部分实测到的对我后面推理有用的行:
- paper.tex:1 `\documentclass[11pt]{article}`,paper.tex:7 `geometry margin=1.05in`;
- paper.tex:19-24 定义环境计数器:`\newtheorem{theorem}{Theorem}[section]`、`\newtheorem{lemma}[theorem]{Lemma}`、`\newtheorem{proposition}[theorem]{Proposition}`、`\newtheorem{remark}[theorem]{Remark}`。也就是说 Theorem/Lemma/Proposition/Remark 共享同一节内计数器;
- paper.tex:25 `\numberwithin{equation}{section}`:公式按节编号;
- paper.tex:32-34 标题、作者、日期;
- paper.tex:38-44 摘要。摘要逐字(实测):"For every fixed $1<p<\infty$ and $D>1$, every $n$-point subset of a real $L_p$ space embeds into $\ell_p^d$ with distortion at most $D$ and subpolynomial dimension $d=n^{o(1)}$. The target has the same exponent $p$, and the embedding need not be linear."

### 0.3 节与编号条目地图(Grep 实测行号)

用正则 `\\(section|subsection|begin\{theorem|lemma|...\}|label\{)` 扫出的完整地图:

| 位置 | 条目 |
| --- | --- |
| paper.tex:46 | `\section{Introduction}` |
| paper.tex:66 | `eq:distortion`(嵌入定义) |
| paper.tex:75 | `thm:main`(主定理,唯一 theorem) |
| paper.tex:86 | `eq:main-bounds` |
| paper.tex:92 | `eq:exact-bounds` |
| paper.tex:110 | `\subsection{Earlier results and the exact-distortion contrast}` |
| paper.tex:160 | `\subsection{Method and organization}` |
| paper.tex:216 | `\section{Finite coordinates and normalized increments}` |
| paper.tex:218 | `lem:exact-upper` |
| paper.tex:283 | `\section{From weighted moments to an embedding}` |
| paper.tex:295 | `lem:weighted` |
| paper.tex:299 | `eq:weighted-target` |
| paper.tex:309 | `eq:sampling-dimension` |
| paper.tex:385-386 | `\section{A projection with controlled row sums}` / `sec:projection` |
| paper.tex:392 | `lem:localization` |
| paper.tex:406 | `eq:H`(H=4log(2n)) |
| paper.tex:410 | `lem:projection` |
| paper.tex:414 | `eq:projection-row-sums` |
| paper.tex:468 | `eq:eta-choice` |
| paper.tex:477 | `\section{Homogeneous increments and signed Poisson sampling}` |
| paper.tex:490 | `eq:powerlaw` |
| paper.tex:495 | `eq:magnitude-density` |
| paper.tex:520 | `lem:poisson` |
| paper.tex:542 | `sec:below`(第 6 节, $1<p<2$) |
| paper.tex:572 | `eq:below-characteristic` |
| paper.tex:586 | `eq:below-tail` |
| paper.tex:636 | `eq:below-first-error` |
| paper.tex:643 | `eq:below-second-moment` |
| paper.tex:678 | `eq:below-weighted-error` |
| paper.tex:708-709 | `sec:above`(第 7 节, $2<p<\infty$) |
| paper.tex:734 | `eq:above-ramp` |
| paper.tex:750 | `eq:above-energy` |
| paper.tex:766 | `fig:truncation-ramp` |
| paper.tex:790 | `eq:above-basic-bounds` |
| paper.tex:808 | `eq:above-projection-error` |
| paper.tex:821 | `eq:above-cutoff-bounds` |
| paper.tex:857 | `eq:above-energy-error` |
| paper.tex:863 | `eq:above-relative-error` |
| paper.tex:868 | `eq:above-length` |
| paper.tex:880 | `lem:poisson-moments` |
| paper.tex:884 | `eq:poisson-moments` |
| paper.tex:916 | `eq:above-variance-error` |
| paper.tex:935 | `eq:above-poisson-error` |
| paper.tex:958 | `eq:above-poisson-tail` |
| paper.tex:978 | `eq:above-truncation-error` |
| paper.tex:1003 | `\section{Dimension bounds and exact embeddings}` |
| paper.tex:1024 | `tab:moment-contract` |
| paper.tex:1027 | `\subsection{Completion of the upper bound}` |
| paper.tex:1047 | `\subsection{The packing bound}` |
| paper.tex:1061 | `\subsection{A quadratic obstruction to exact embeddings}` |
| paper.tex:1132 | `app:localization`(附录 A) |
| paper.tex:1229 | `app:poisson`(附录 B) |
| paper.tex:1287 | `\begin{thebibliography}{99}` |

带号条目清点(Grep 实测):theorem 1 个(`thm:main`)、lemma 5 个(`lem:exact-upper`、`lem:weighted`、`lem:localization`、`lem:projection`、`lem:poisson`、`lem:poisson-moments` 中除 poisson-moments 外都在正文,合计 6 个 lemma)。这里要精确:我逐行数过,begin{lemma} 命中 6 次(218, 295, 392, 410, 520, 880),begin{theorem} 命中 1 次(75),proposition/corollary/definition 环境 0 次。附录里的两个证明(1138, 1231)用 `\begin{proof}[Proof of Lemma ...]` 直接引回正文引理,不另编号。这个"1 定理 + 6 引理"的骨架就是我 §5 逐条四段式的全部对象,外加第 8 节两个无编号小节论证(packing 与 grid 障碍)和第 6, 7 节的大段构造。

## §1 初始动机与猜想:我第一次把这个问题当成什么

我第一次读摘要时,脑子里的模板是 Hilbert 空间的 Johnson--Lindenstrauss(JL)引理:n 点集, distortion 固定 $D>1$, 目标维数 $O_D(\log n)$。JL 在我手里的第一形状是高斯投影矩阵:随机线性映射 $f:\mathbb{R}^m\to\mathbb{R}^d$, 每个像坐标是原坐标的 $N(0,1/d)$ 线性组合,单对的平方长度是 $\chi^2$ 型集中,union bound 打掉 $n^2$ 对。第二形状是抽样矩阵(列子集 + 重标),第三形状是图灵难度量式的计算动机:距离矩阵 $n\times n$ 太大,想找 $d\ll n$ 的显式表示。三种形状的共同前提:内积结构在场,范数是二次型的开根。

于是我的第一反应是把 $L_p$ 问题塞进这三个模板里。$L_p$ 里最接近"有显式分布可用"的先例是 Indyk 的 $p$-stable JL 型结果(论文 paper.tex:196 确实引到 Indyk06):用 $p$-stable 分布的坐标做线性投影,单坐标的 $p$ 次矩是加性的,$\|x\|_p^p=\sum_j|x_j|^p$ 对稳定随机和的矩有干净公式。我当时以为进攻点就在这条线上:把 Indyk 的线性投影 + 抽样矩阵嫁接,再配 Bourgain--Lindenstrauss--Milman 的子空间离散化(zonoid 逼近,论文 paper.tex:125-127 引用)做后备,应该能把维数压到 $\log n$ 附近。

我把"离散化整个子空间"和"重摆 n 个点"混在一起想过。论文在 paper.tex:52-57 明确把这两条区分开:我们做的是 coordinate-target version,点可以任意重摆,但像必须落在同指数 $p$ 的 $\ell_p^d$ 里,且映射无需线性。我第一次读到这里是失望的:允许非线性看起来像在削弱问题。后来的进展证明这个"削弱"恰恰是结果成立的前提(paper.tex:135-138 引 Lee--Mendel--Naor 说固定 distortion 的线性映射在 $p\ne2$ 的某些构型上需要与点数成正比的维数)。

我对 $d=n^{o(1)}$ 的初始猜想是:这是"差一点就是 $\log n$"的修辞。读完主定理才发现论文给的定量内容比 $o(1)$ 的字面承诺强:上界是 $\exp(C_{p,D}(\log n)^{\gamma(p)})$, $\gamma(p)=2-p$ ($1<p<2$) 或 $1-2/p$ ($p>2$),这是一个显式的幂次损失,而 $o(1)$ 只是它的推论。反过来,下界 $\log n/\log(1+2D)$ 说明 $\gamma$ 型上界离 $\log n$ 还有多远也没被断言(论文 paper.tex:147-149 对 Naor--Ren 下界同样声明两侧都不最优)。我最初的"进攻点在哪"的提问方式因此要改写:问题不在压到 $\log n$,而在第一次压到任何 $n^{o(1)}$。

## §2 尝试过的错误路线及失败原因

### 2.1 路线 A: 线性 $p$-stable 投影直接嫁接 JL 证明

做法:对 $x_1,\ldots,x_n\in\ell_p^m$,取 $d$ 行独立随机向量,每行坐标是标准化 $p$-stable,令 $f(x)=((x,\xi_1),\ldots,(x,\xi_d))$。单对 $(i,j)$ 上 $\langle x_i-x_j,\xi\rangle$ 的分布只看 $\|x_i-x_j\|_p$,矩匹配是漂亮的。断点出现在集中不等式:JL 证明对单对用亚指数尾 $\exp(-c\,\epsilon^2 d)$,其来源是 $\chi^2$ 的次指数矩;而 $p\ne2$ 时 $|\langle x,\xi\rangle|^p$ 的分布尾是 $t^{-p}$ 幂律(重尾),经验平均 $\frac1d\sum_a|F^{(a)}|^p$ 的 Hoeffding 型估计需要像的截断水平 $K$,维数变成 $d\asymp K^{2p}/(\eta^2b^2)\cdot\log n$(这正是论文 lemma 3.1 的公式,说明作者也走到同一步)。若坚持线性且坚持像无界截断,重尾让 $K$ 只能随 $n$ 增大,$d$ 掉回 $n^{c}$。断的迹象非常具体:我在 $p>2$ 一侧试 $\mathbb E|\langle x,\xi\rangle|^2$ 时,二矩由大跳支配、与 $\|x\|_p$ 不成比例;在 $p<2$ 一侧试用二矩集中时,小跳的 $\int_{|v|\le1}|v|^2d\nu$ 恰好有限但值是 $p/(2-p)$(paper.tex:564 出现同一常数),它随 $p\to2^-$ 发散,集中率坏掉。更硬的一堵墙是 paper.tex:135-138 的文献事实:线性映射本身在某些 $L_p$ 构型上需要 $\Omega(n)$ 维数,路线 A 是结构性死亡,救不回来。

### 2.2 路线 B: Bourgain--Lindenstrauss--Milman/Talagrand 子空间离散化按基数套用

做法:把 $n$ 个点的仿射张成取来,$r\le n-1$,对该 $r$ 维子空间用 BL(zonoid) 离散化,希望维数参数落在"点个数"上。断点:这类定理保证的是子空间内所有向量的范数被线性映射保持,维数参数是子空间维数 $r$ 与精度 $\epsilon$,，并非构型的基数。对"平移后的数据张成"套用,最多吃到 $r\le n-1$,给出 $d\le n^{1+o(1)}$ 量级甚至更差。论文 paper.tex:128-130 逐字承认:"Applying such a theorem to the span of the translated data gives $r\le n-1$; it does not give the present subpolynomial bound in cardinality."我的失败与该处文献状态一致:参数错位是定义级别的,不是技术级别的。

### 2.3 路线 C: 逐对分配坐标 + union bound 的全矩匹配幻想

做法:对每一对边 $e$ 单独造一个"矩对得上"的标量坐标,取 $d=|E|=\binom n2$ 个,再用 JL 式抽样把 $d$ 压小。断点:单对可行不代表同时可行。若每个测试概率 $\lambda$ 只给我"一个适合 $\lambda$ 的分布",不同 $\lambda$ 给的分布可以互相打架;而 union bound 压维数需要单一分布同时把 $|E|$ 个矩都钉在 $[(1-\eta)b,(1+\eta)b]$。我最初想用紧性/对角线抽取一个公共分布,这在无限维里对"逐点收敛的矩"根本不闭合。真正缺的一环是凸分离:把"每对都命中"翻译成"每个正权 $\lambda$ 下加权误差不超过 $\eta b$"的线性不等式族,再用凸集分离把族对偶掉。这一环诞生在 paper.tex:295-345 的 `lem:weighted`。断的迹象在我这边的试算里表现为:试图证明"存在一个矩向量落在开立方盒里"时,没有反证工具,只能对着 $|E|$ 维盒子逐维硬凑。

### 2.4 路线 D: 有界增量 + 次高斯集中的路线(拒绝重尾)

做法:坚持把每个随机梯度坐标压成 $|F_e|\le K$ 的有界变量,并让公共矩 $b$ 固定为 $O(1)$,指望 `eq:sampling-dimension`(paper.tex:309-313)给出 $d\asymp K^{2p}\eta^{-2}b^{-2}\log n$ 里三项全是常数,一步得到 $O(\log n)$。断点:归一化增量 $g_e(t)=(x_i(t)-x_j(t))/\delta_e$ 满足 $\sum_t|g_e(t)|^p=1$,任何逐坐标有界且矩等于同一 $b$ 的梯度族,其在不同边上的分布受同一组标签 $z_i$ 约束(梯度必须属于 $V$,paper.tex:266-268),这个线性约束让"所有边等矩且小矩"不可满足:短边要小矩、长边要大矩在同一坐标向量里耦合。论文的做法恰好是反向利用自由度:$b$ 允许随 $n$ 增长(paper.tex:291-293:"multiplying all distances by the same factor does not change distortion"),把加性误差用大 $b$ 除成相对误差。我的路线 D 死在没有把这个齐次自由度兑换成加性预算。

### 2.5 路线 E: 用 Ball 的 $\binom n2$ 精确构造改造成近似情形

做法:Ball 的等距嵌入(paper.tex:112-113 引用,`lem:exact-upper` 复证)把 $n$ 点等距放进 $\ell_p^{\binom n2}$。我试过把它做"松弛":允许 distortion $D$ 后,能否在距离锥里用更少的 Carathéodory 代表元。断点:Carathéodory 给出的代表元个数是仿射超平面维数 $N=\binom n2$ 的函数,精确等距时一也省不掉(paper.tex:250-252);松弛 distortion 只是把盒开大,凸包结构不变,中心点仍可能需要满秩个顶点。第 8.3 节的 grid 障碍(paper.tex:1061 起)反而说明精确情形维数是 $\Theta(n^2)$ 量级($\lfloor(n-1)/4\rfloor^2\le d_p(n,1)$),这条路即使走通也省不了多少。失败原因定性:精确-近似之间不是量的松动,是证明范式的切换(从凸几何一步到位,换成矩匹配 + 抽样)。

（以上五条里,A/B 在 $p\ne2$ 时立刻失效,证据分别是重尾二矩的发散常数和参数错位定义;C/D 的断点都最终被 `lem:weighted` 的一个公式吸收。）

## §3 关键转折点:三个具体时刻

### 3.1 转折一:`lem:weighted` 的诞生,凸分离把"逐对"换成"逐权"

第一个可指认的时刻在 paper.tex:295-345。在此之前我有的只是路线 C 的碎片:对每个测试概率 $\lambda$ 能造一个分布,但造不出公共分布。引理的陈述把要求改成:对每个严格正概率 $\lambda$,存在随机归一化梯度 $F$,使得 $\|F\|_\infty\le K$ 且 $\sum_e\lambda_e|\mathbb E|F_e|^p-b|\le\eta b$,并且 $b,K$ 对所有 $\lambda$ 统一。证明里的分离一步是关键(paper.tex:328-342):若凸集 $\mathcal C$(所有有界梯度矩向量的凸包)不碰开盒 $\mathcal B=\{m:|m_e-b|<2\eta b\}$,则存在 $a\ne0$, $\sum|a_e|=1$, 使 $\sum a_e(m_e-b)\ge2\eta b$ 对一切 $m\in\mathcal C$ 成立;取 $\lambda_e=\frac34|a_e|+\frac1{4|E|}$ 代入假设即得 $\le\frac43\eta b$ 矛盾。这里的机械妙点在于那个 $\frac1{4|E|}$ 的摊匀项:它保证 $\lambda$ 严格正(假设只对严格正概率成立),同时把 $\sum|a_e||m_e-b|\le\frac43\sum\lambda_e|m_e-b|$ 的放大系数 $\frac43$ 压进 $\eta b$ 预算。$\eta<1/3$ 的窗口(paper.tex:296)正是为 $\frac43<2$ 留的。

第二个关键点是 paper.tex:291-293 那句被允许 $b$ 增长的话。它把"矩匹配"从相对精度问题改造成加性误差问题:之后所有估计只需证 $\le\eta b$ 量级的绝对误差,而 $b$ 本身是被造出来的大数。$1<p<2$ 段取 $b=\mathbb E\min\{|Y_e|,a\}^p\ge c_p\log a$(paper.tex:649-658),$p>2$ 段取 $b\asymp\ell^{p+1}$(paper.tex:745-751),两处都是把 $b$ 举到任意高,再用它除穿加性误差。

### 3.2 转折二:不动点重加权把 GGNS 的平均界升级成逐行界

第二个时刻在 paper.tex:410-464 的 `lem:projection`。Gurel-Gurevich--Nachmias--Sachdeva 的原始定理(论文引 Theorem 1.3)给的是加权平均 $\sum_e\sigma_eR_e^2\le(2\log n)^2$(paper.tex:433-437 的 `eq:average-row-sums`),我需要的却是每一行 $\sum_f|P_{ef}|\le H$。单靠平均,个别坏行可以任意大;而 $p$ 次矩误差的传播恰好按行绝对和放大。解法是 Brouwer 不动点:定义 $u_e(\sigma)=\sigma_eR_e(\sigma)^2/(2(2\log n)^2)$ 与 $\Phi_e(\sigma)=u_e(\sigma)+(1-\sum_fu_f)\lambda_e$,由平均界 $\sum u_e\le1/2$ 知 $\Phi$ 连续地自映射紧凸集 $\Sigma=\{\sigma\ge\lambda/2,\ \sum\sigma=1\}$(paper.tex:440-456),不动点处 $u_e\le\sigma_e$,即 $\sigma_eR_e^2\le2(2\log n)^2\sigma_e$… 更精确地说,由 $u_e(\sigma)\le\sigma_e$ 且 $\sigma_e>0$ 得 $R_e\le2\sqrt2\log n\le H$(paper.tex:457-461)。$\sigma_e\ge\lambda_e/2$ 则保证事后可以把 $\sigma$-加权误差转回 $\lambda$-加权:$\lambda\le2\sigma$(paper.tex:471-475)。这一刻我意识到的结构是:电势定位提供的是"总能量预算",不动点做的是"把预算兑换成逐行保证金",兑换率 1/2 来自摊匀项。

### 3.3 转折三:$p>2$ 的重叠截断 ramp,三角复现次数放大能量

第三个时刻是 paper.tex:720-767 的重叠截断族。此前所有截断都各自为战:截到水平 $a$ 就把更大跳丢掉,能量与误差同阶。ramp 的发明点在此:取 $\ell$ 个平移的二进带 $(2^k,2^{k+\ell}]$, $0\le k<\ell$,令 $u=\sum_k(v_{\le2^{k+\ell}}-v_{\le2^k})$,则 $u_e=m_\ell(|v_e|)v_e$,复现数 $m_\ell$ 在二进柱上的剖面是 $1,2,\ldots,\ell-1,\ell,\ell-1,\ldots,2,1$(paper.tex:736-742)。能量 $b=\int|u_e|^pd\nu=p\log2(\ell^p+2\sum_{j<\ell}j^p)\asymp\ell^{p+1}$(paper.tex:745-751,用的是 `eq:magnitude-density` 的逐柱积分),而投影误差只按 $L_2$ 尾的几何衰减进入,得 $\|Z-u\|_{L_p(\rho)}^p\le C_pH^{p-2}(\ell+1)$(paper.tex:804-848)。能量是 $\ell^{p+1}$,误差是 $H^{p-2}\ell$:两者之比 $\ell^p/H^{p-2}$ 可以让 $\ell$ 单独增长来压低相对误差,而代价(K 里的 $2^{2\ell}$)只是指数级进入 $\log K$。选 $\ell=\lceil LH^{1-2/p}\rceil$(paper.tex:865-869)之后,相对误差 $\|Z-u\|/b^{1/p}\le C_pH^\gamma/\ell\le C_p/L$(paper.tex:860-864),$\log K=O_{p,\eta}((\log n)^{1-2/p})$(paper.tex:996-1000)。这一刻定下了整个 $p>2$ 段:重叠带来的三角剖面就是"用 $\ell^{p}$ 倍复现换能量"的杠杆,杠杆臂恰是 $H^{p-2}$ 的对偶幂次。图 `figures/truncation-ramp.tex` 画的正是 $\ell=4$ 时剖面 $1,2,3,4,3,2,1$。

## §4 最终思路与最初设想的差异

我最初设想的是"一条 JL 式证明,换掉内积":随机线性映射、单对集中、union bound,三段式照搬。最终论文的结构与此有三处大差异。

其一,映射从线性翻到任意。最初我视"无需线性"为削弱,实际它是可行性的前提:线性版本被 Lee--Mendel--Naor 的 $\Omega(n)$ 下界判死(paper.tex:135-138)。非线性让每个坐标只需是"某个标签向量的归一化梯度",坐标间的全部耦合被压进 $F\in V$ 这一个线性子空间条件(paper.tex:266-274),其余自由度全部释放给分布选择。

其二,集中不等式让位于矩台账。JL 的引擎是次高斯尾;这里引擎是 Hoeffding 型有界和估计(paper.tex:347-368),它只要求有界变量,代价是维数按 $K^{2p}$ 增长。整个证明的重心因此移到"如何把 $K$ 造得小"。为此付出的交换是:放弃固定公共矩值 $b=1$ 的幻想,允许 $b$ 随 $n$ 增长、允许加性误差,再用 $b$ 除穿。这个"矩可以抬价"的自由度在 JL 里根本没有对应物,因为 JL 的 $p=2$ 时二矩恰是 $\|x\|_2^2$ 的倍数,天然归一。

其三,几何输入从矩阵分析换成图上电势。投影 $P$ 的行和界不是谱论证,是最小阻抗流的定位估计加 Brouwer 不动点(paper.tex:385-464),附录 A 完整重证了热核 + 熵的证明(paper.tex:1132-1227)。最初我完全没预料"图的电学"会进入一个 Banach 空间降维问题;它进入的方式很讲究:需要控制的不是范数，是投影矩阵的绝对值,而这恰是电势梯度类投影的定位现象。

结构上的第四点小差异:主定理最终是一个双侧夹逼加一个极限陈述(paper.tex:86-100),把 $D=1$ 的 $\Theta(n^2)$ 与 $D>1$ 的准多项式并置成"精确-近似的对偶"。这个对偶叙事在摘要里只是一句 $d=n^{o(1)}$,在正文里则长成第 8.3 节整节的 grid 障碍论证。我最初的框架里没有 $D=1$ 的位置,因为 JL 陈述只在 $D>1$;论文的成品说明:要讲清"为什么 $o(1)$ 是质的突破",最锋利的对照是把 $D=1$ 一侧的二次障碍同时证明出来,让 $\lim\log d_p/\log n$ 在 $D\downarrow1$ 处从 0 跳到 2。

## §5 逐引理四段式

约定:每条目分 (a) 逐字引用与行号、(b) 推导补全、(c) 常数与假设的机械理由、(d) `[推测]` 候选失败路线。引用一律照 paper.tex 原文换行位置拼接,行号标注起讫。

### 5.1 主定理 `thm:main`(paper.tex:75-101)

(a) 逐字:"Fix $1<p<\infty$, $p\ne2$, and put $\gamma(p)=2-p$ for $1<p<2$ and $1-2/p$ for $2<p<\infty$. For every $D>1$ there is a constant $C_{p,D}<\infty$ such that, for every integer $n\ge2$, $\frac{\log n}{\log(1+2D)}\le d_p(n,D)\le\exp(C_{p,D}(\log n)^{\gamma(p)})$. For exact embeddings, $\lfloor\frac{n-1}{4}\rfloor^2\le d_p(n,1)\le\binom n2$ $(n\ge9)$. Consequently, $\lim_{n\to\infty}\frac{\log d_p(n,D)}{\log n}=0$ if $D>1$ and $=2$ if $D=1$."行号:定理头 75-77,$\gamma$ 定义 78-83,上界陈述 84-90,精确段 92-95,极限推论 96-100。$d_p(n,D)$ 本身定义在 paper.tex:62-69:最小 $d$, 使任意 $L_p$ 空间的任意 $n$ 点集有像 $y_i\in\ell_p^d$ 与尺度 $s>0$ 满足 `eq:distortion` 双侧夹逼。

(b) 推导补全。定理是四块拼装的目录:上界来自第 6, 7 节构造 + `lem:weighted`(§8.1, paper.tex:1027-1045):两段的 $b,K$ 满足 $\log K\le C_{p,\eta}(\log n)^{\gamma(p)}$,代入 `eq:sampling-dimension` 取对数得 $\log d\le C_{p,\eta}+2p\log K+\log\log(2n)-2\log b\le C_{p,D}(\log n)^{\gamma(p)}$;小 $n$ 用 `lem:exact-upper` 的 $\binom n2$ 兜底(paper.tex:1043-1045),这就是定理陈述里 $C_{p,D}$ 对一切 $n\ge2$ 一致的原因。下界是 §8.2 的体积 packing(paper.tex:1049-1059):把 distortion-$D$ 像平移缩放到 1-分离、半径 $D$ 的球内,以 $\ell_p$ 球体积按维数 $d$ 的缩放律 $n(1/2)^d\le(D+1/2)^d$,即 $n\le(1+2D)^d$,取对数得 $\log n/\log(1+2D)\le d$。精确双侧:上界 `lem:exact-upper`,下界 §8.3 grid 障碍(取 $k=\lfloor(n-1)/4\rfloor$, $4k+1\le n$)。极限推论:上界给 $\limsup\log d_p/\log n\le C_{p,D}(\log n)^{\gamma(p)-1}\to0$($\gamma<1$),下界给 $\liminf\ge1/\log(1+2D)>0$… 定理声明极限存在且等于 0,实际只需上界加 $d_p\ge1$;对 $D=1$,二次双侧夹出极限 2。paper.tex:1126-1128 逐字:"Finally, $0<\gamma(p)<1$, so the logarithmic limits in Theorem~\ref{thm:main} follow from the stated bounds."

(c) 机械理由。为何排除 $p=2$:paper.tex:105-106 明说经典结果 $d_2(n,D)=O_D(\log n)$ 更强,$\gamma$ 在 $p=2$ 处两分支同为 0,若包含会给出 $d\le\exp(C)=O(1)$ 的假陈述,与 packing 下界 $\log n/\log(1+2D)$ 矛盾,所以 $p\ne2$ 是陈述自洽的必需。$D>1$ 开区间被谁消费:`eq:eta-choice`(paper.tex:466-470)要 $\eta>0$ 使 $((1+3\eta)/(1-3\eta))^{1/p}\le D$,这只在 $D>1$ 时可行;$D\to1^+$ 时 $\eta\asymp(D^p-1)/6$ 塌缩,进入 $C_{p,D}$,与"无一致常数"的声明(paper.tex:103-105)吻合。$\gamma(p)$ 两个表达式的来源:2-p 来自 $p/(2-p)$ 发散的小跳二矩与 $\log a$ 能量对 $H^{2-p}$ 加性误差的比值(第 6 节),1-2/p 来自 $\sum_k2^{(1-p/2)k}$ 几何级数的截尾指数(第 7 节);两处都是"用 $H$ 的幂买能量"的对偶。packing 下界的 $\log(1+2D)$:由 $(D+1/2)/(1/2)=1+2D$ 逐字而来,与 Lean 侧完全一致。$n\ge9$ 的门槛:使 $k=\lfloor(n-1)/4\rfloor\ge2$,grid 构型 $\mathcal X_k$ 要求 $k\ge2$(paper.tex:1089 起"Fix $k\ge2$")。$o(1)$ 的实际速率:论文明示 $(\log n)^{\gamma(p)}$,即 $\log d/\log n=O((\log n)^{\gamma(p)-1})$,速率是 $(\log n)^{-(1-\gamma(p))}$,其中 $1-\gamma(p)=p-1$($p<2$)或 $2/p$($p>2$),这比摘要的 $o(1)$ 强,是取证第一问的答案主体。

(d) `[推测]` 失败路线:一,曾设想主定理能对 $D\downarrow1$ 一致(paper.tex:103-105 明确不主张),若强求一致,$\eta$ 塌缩会让 $T,\ell$ 爆炸;二, `[推测]` 若试图让 $p$ 随 $n$ 趋近 1 或 $\infty$,$C_{p,D}$ 中的 $1/(p-1)$、$p/(2-p)$、$1/(1-2/p)$ 三处发散同时坏;三, `[推测]` 若把上界 $\exp(C(\log n)^\gamma)$ 直接改成 $O_D(\log n)$ 的猜想陈述,与 Naor--Ren 下界(paper.tex:142-146, $(\log n/(\log\log n)^2)^{p/2}$, $p>2$ 侧)在 $\gamma<1$ 处并不矛盾,但论文未证,任何声称最优的陈述都越权。

### 5.2 `lem:exact-upper` 精确离散化(paper.tex:218-259)

(a) 逐字:"Every $n$-point subset of a real $L_p$ space embeds isometrically into $\ell_p^{\binom n2}$. This holds for every $1\le p<\infty$."证明从 paper.tex:223 起:取可测代表元,$q(t)=(|x_i(t)-x_j(t)|^p)_{ij\in E}$、$s(t)=\sum_eq_e(t)$、$S=\int s\,d\mu$;紧集 $\mathcal K=\{(|z_i-z_j|^p)_{ij}:z\in\mathbb R^n,z_n=0,\sum|z_i-z_j|^p=1\}$;然后 $\frac1S\int q\,d\mu=\int_{\{s>0\}}\frac{q}s\frac sS d\mu\in\operatorname{conv}(\mathcal K)$;Carathéodory 给至多 $N=\binom n2$ 个点;像 $y_i=((S\theta_a)^{1/p}z_i^{(a)})_a$ 满足 $\|y_i-y_j\|_p^p=\|x_i-x_j\|_p^p$。

(b) 推导补全。$0<S<\infty$:点两两不同故每对差函数非零 a.e.,和的积分正;可测代表元在 $L_p$ 里有限 a.e.,故 $S$ 有限。$q(t)/s(t)\in\mathcal K$:分量取 $z=x(t)$ 即得,归一由 $/s$。重心进凸包:测度 $\frac{s}S d\mu$ 是 $\{s>0\}$ 上的概率,其重心在紧集的凸包中(凸包紧,故闭;分离定理 Rockafellar 11.3/17.2)。Carathéodory 用仿射超平面维数: $\mathcal K$ 落在 $\sum m_e=1$ 的超平面内,该超平面维数 $N-1$,故凸组合至多 $N$ 项。逐坐标验证像的 $p$ 距离:$\|y_i-y_j\|_p^p=\sum_aS\theta_a|z_i^{(a)}-z_j^{(a)}|^p=S\int\frac{|x_i-x_j|^p}s\frac sS d\mu=\int|x_i-x_j|^pd\mu$。

(c) 机械理由。$p\ge1$ 的全部用处:距离锥的凸性不需要,这里只用 $|\cdot|^p$ 可积与逐坐标 $p$ 次展开,$p=1$ 也成立,故陈述覆盖 $1\le p<\infty$(论文额外注明,与 Ball1990 范围一致,paper.tex:112-113)。$\binom n2$ 是最优阶的地方:§8.3 证 $\lfloor(n-1)/4\rfloor^2$ 下界,把 Carathéodory 的上界钉到 $\Theta(n^2)$。本引理在主定理里消费两次:上界小 $n$ 兜底(paper.tex:1043-1045)与把"任意 $L_p$ 空间"约化到有限坐标 $\ell_p^m$(paper.tex:261-262),后者是整个证明能使用有限维凸几何的入场券。Lean 侧同样有 `ExactDiscretization.lean` 的三个 theorem(13, 36, 57 行)且假设就是 `hp : 1 ≤ p`,逐字对应。

(d) `[推测]` 失败路线:一, `[推测]` 曾试 $d<n^2/2$ 的稀疏顶点集(按图结构选 $z^{(a)}$ 支撑),但 $\mathcal K$ 的仿射维数满,分离论据不放过任何低维截面;二, `[推测]` 曾试把重心用离散测度逼近后直接取原子像,断在 $x_i$ 的像需要满足全部 $\binom n2$ 个距离等式,原子数不足时约束超定;三, `[推测]` 试图对 $p=\infty$ 保留此引理:$|\cdot|^\infty$ 不进距离锥积分,证明的第一行(定义 $q$)就断,与陈述排除 $\infty$ 一致。

### 5.3 `lem:weighted` 加权矩判据(paper.tex:295-383)

(a) 逐字:"Let $0<\eta<1/3$ and $b,K\ge1$. Suppose that, for every strictly positive probability vector $\lambda$ on $E$, there is a random normalized gradient $F\in V$ such that $\|F\|_\infty\le K$ a.s., $\sum_{e}\lambda_e|\mathbb E|F_e|^p-b|\le\eta b$. The numbers $b$ and $K$ are the same for all $\lambda$. Then the points admit an embedding into $\ell_p^d$ with distortion at most $((1+3\eta)/(1-3\eta))^{1/p}$, where $d\le\lceil C\max\{1,K^{2p}/(\eta^2b^2)\}\log(2n)\rceil$."

(b) 推导补全。第一步凸分离(见 §3.1):得到单一分布,使 $|\mathbb E|F_e|^p-b|<2\eta b$ 对每条边成立。第二步抽样:$d$ 个独立样本,矩变量 $X=|F_e|^p\in[0,K^p]$,亚指数引理(Jensen + $\cosh u\le e^{u^2/2}$)给 $\mathbb E e^{t(X-\EX)}\le e^{t^2K^{2p}/2}$,乘积 MGF 后 Markov 取 $t=\eta b/K^{2p}$,得尾 $\le2\exp(-d\eta^2b^2/(2K^{2p}))$;对 $|E|<n^2/2$ 条边 union bound,概率和 $<1$ 解出 $d\asymp K^{2p}/(\eta^2b^2)\cdot\log(2n)$… 精确地说 $\log(2n)$ 吸收 $2\log|E|\le4\log n$ 与常数 2。第三步装配:$y_i=d^{-1/p}(z_i^{(1)},\ldots,z_i^{(d)})$,则 $\|y_i-y_j\|_p^p/d=\frac1d\sum_a|F_{ij}^{(a)}|^p\in[(1-3\eta)b,(1+3\eta)b]$,开 $p$ 次方根即 distortion 与尺度 $s=((1-3\eta)b)^{1/p}$。经验矩偏离期望 $\le\eta b$、期望偏离 $b$ 不到 $2\eta b$,三角和成 $3\eta$。

(c) 机械理由。$\eta<1/3$:下盒界 $(1-3\eta)b>0$ 且尺度 $s$ 为正;$\eta<1/6$ 再加码在 `eq:eta-choice`(paper.tex:466-470),把 $((1+3\eta)/(1-3\eta))^{1/p}\le D$ 解出 $\eta\le\frac13\cdot\frac{D^p-1}{D^p+1}$,这是 $D$ 进入全证明的唯一通道。$b,K\ge1$:让 $\max\{1,K^{2p}/(\eta^2b^2)\}$ 的截断与后续取对数的 $+C_{p,\eta}$ 兼容。$K^{2p}/(\eta^2b^2)$ 的来源要逐字讲:Hoeffding 的方差因子 $K^{2p}/2$ 与阈值 $\eta b$ 的平方之比,是"有界变量的经验矩集中"的标准汇率;之后所有 $\gamma(p)$ 的辛苦全在为这个 $K^{2p}$ 买单。$F\in V$ 的消费:每坐标 $F^{(a)}$ 是归一化梯度,故存在标签 $z^{(a)}$ 使 $F^{(a)}_{ij}=(z_i^{(a)}-z_j^{(a)})/\delta_{ij}$,像的矩按 $d^{-1/p}$ 归一后对每对边精确重述为 $\delta_{ij}^p\cdot$ 经验矩,这就是"任意构型相对误差"能同时成立的结构理由。假设"对每个 $\lambda$ 存在 $F$"被消费一次:分离论证里 $\lambda=\frac34|a|+\frac1{4|E|}$;而"分布可随 $\lambda$ 变"正是凸对偶的杠杆。Lean 侧对应:`SamplingBounds.lean:75` `sampling_probability_estimate` 把 $d=\lceil M^2(H+1)\rceil_++1$($M=K^p$)直接公式化,$b\ge R\epsilon$ 的除法则换成 `distortion_ratio`(GradientSampling.lean:221)的 $R=3+6/(D^p-1)$ 陈述,机器把"相对 $\eta$"重写成了"绝对 $\epsilon$ 且 $R\epsilon\le b$",二者代数等价($\epsilon=\eta b$ 时 $b\pm3\epsilon$ 即 $(1\pm3\eta)b$)。

(d) `[推测]` 失败路线:一, `[推测]` 若 $b,K$ 允许随 $\lambda$ 变,分离论证给不出公共 $b$,union bound 后各边阈值不齐,证明在"盒"这一步断;二, `[推测]` 若用 Bernstein 替 Hoeffding(想吃真方差，并非 $K^{2p}$ 上界),重尾矩的真方差与 $b$ 同阶时给出的仍是加性误差,省不掉对 $K$ 的依赖;三, `[推测]` 若跳过凸分离、逐 $\lambda$ 造嵌入再对角抽取,矩向量集合的紧性论证在无限分布族上没有有限维闭包保证,断在收敛性。

### 5.4 `lem:localization` 电流定位(paper.tex:392-400,证明在附录 A paper.tex:1138-1227)

(a) 逐字:"Let $G$ be a connected loopless graph on $n\ge2$ vertices, let $B$ be an oriented edge-by-vertex incidence matrix, and let $C=\operatorname{diag}(c_e)$ with $c_e>0$. If $Q$ is the Euclidean orthogonal projection onto $\operatorname{im}(C^{1/2}B)$, then $\bigl\||Q|\bigr\|_{2\to2}\le2\log n$."

(b) 推导补全(附录 A 的链条)。给正边权 $w$,定义顶点概率 $\mu_i=\sum_{e\ni i}w_e^2/(2\|w\|_2^2)$ 与 $M=\operatorname{diag}(\mu)$;置 $L=B^TCB$(加权 Laplacian)、$S=M^{-1/2}LM^{-1/2}$、$K_t=M^{-1/2}e^{-tS}M^{-1/2}$。关键恒等式 $Q=\int_0^\infty C^{1/2}BK_tB^TC^{1/2}dt$:写 $A=C^{1/2}BM^{-1/2}$,被积式即 $Ae^{-tA^TA}A^T$,谱分解下其积分是 $\operatorname{im}A$ 的正交投影,而 $\operatorname{im}A=\operatorname{im}(C^{1/2}B)$(paper.tex:1150-1157)。对每个顶点 $v$ 取热核 $h_s=K_s\mathbf e_v$:质量守恒 $\mu^Th_s=1$、$h_0=\mu_v^{-1}\mathbf e_v$、$h_\infty\to\mathbf 1$(核由 $M^{1/2}\mathbf1$ 张成)。熵等式:$\frac d{ds}\sum\mu_ih_s\log h_s=-\mathcal I(h_s)$,积分得 $\int_0^\infty\mathcal I(h_s)ds=\log(1/\mu_v)$,其中 $\mathcal I$ 是 Dirichlet 型与对数梯度的配对(paper.tex:1178-1194)。Cauchy--Schwarz 步:$\frac{a-b}{\log a-\log b}=\int_0^1a^ub^{1-u}du\le\frac{a+b}2$ 使 $(w^TC^{1/2}|Bh_s|)^2\le\mathcal I(h_s)\|w\|_2^2$(paper.tex:1196-1208)。合成:$K_{2s}=K_sMK_s$ 展开为列外积,三角不等式给 $w^T|Q|w\le2\sum_v\mu_v\int_0^\infty(w^TC^{1/2}|BK_s\mathbf e_v|)^2ds\le2\|w\|_2^2\sum_v\mu_v\log(1/\mu_v)\le2\log n\,\|w\|_2^2$(熵和至多是均匀分布的最大熵 $\log n$)。$|Q|$ 对称非负,对任意实 $x$ 有 $|x^T|Q|x|\le|x|^T|Q||x|\le2\log n\|x\|_2^2$,即 $\||Q|\|_{2\to2}\le2\log n$。

(c) 机械理由。$n\ge2$、连通、无环:连通保证 $\mu_i>0$ 与热核严格正(次正性论证 paper.tex:1160-1168),无环保证 $B$ 的列对应真边;$c_e>0$ 保证 Gram 矩阵可逆。常数 $2\log n$ 的两处来源:外积展开的对角配对给因子 2,$\sum\mu_v\log(1/\mu_v)\le\log n$ 给另一个 2(附录逐字 $2\|w\|^2\sum\mu\log(1/\mu)\le2\|w\|^2\log n$,paper.tex:1214-1218)。这被谁消费:`eq:average-row-sums`(paper.tex:433-437)把 $\sum\sigma_eR_e^2=\||Q(\sigma)\sqrt\sigma\|_2^2\le(2\log n)^2$,即平方进入 `lem:projection`;后者的行界 $H=4\log(2n)$ 里 $2\sqrt2\log n\le4\log(2n)$ 的吸收就发生在这里(paper.tex:460)。相对 SRS18 的 $O(\log^2 n)$(paper.tex:186-187),这个 $\log n$ 的一次方是本引理的全部战术价值:平方会毁掉 `eq:below-weighted-error` 的 $H^{2-p}$ 与 ramp 的 $H^{p-2}$ 两处的幂次平衡。

(d) `[推测]` 失败路线:一, `[推测]` 若直接对 $P$(，并非 $Q=D_\sigma P D_\sigma^{-1}$)做行和估计,加权投影不再是正交投影,热核表示不成立;二, `[推测]` 试图绕开 $|Q|$ 而只用 $Q$ 的谱半径:符号抵消救不了 $\ell_\infty$ 界,反例即在正负抵消大的行;三, `[推测]` 若图不连通,零空间出现,$h_\infty$ 不趋于 $\mathbf1$,熵等式的边界项断裂。

### 5.5 `lem:projection` 加权投影(paper.tex:410-464)

(a) 逐字:"For every strictly positive probability vector $\lambda$ on $E$, there is a probability vector $\sigma$ with $\sigma_e\ge\lambda_e/2$ such that the orthogonal projection $P$ onto $V$ in $\ell_2(\sigma)$ satisfies $\max_e\sum_f|P_{ef}|\le H$. In particular, $\|P\|_{\infty\to\infty}\le H$, and both $P$ and $I-P$ are contractions on $\ell_2(\sigma)$."其中 $H=4\log(2n)$(paper.tex:406-408)。

(b) 推导补全。完整链条在 §3.1 已叙述,这里补两处机械细节。其一,连续性:$R_e(\sigma)$ 连续依赖 $\sigma$,因为固定 $V$ 的基后 $P(\sigma)$ 的公式含正定 Gram 矩阵求逆(paper.tex:445-447),$\Sigma$ 紧,故 Brouwer 适用(Hatcher Corollary 2.15)。其二,不动点等式的读法:$\Phi_e(\sigma)=\sigma_e$ 移项得 $u_e(\sigma)-\sigma_e=(\sum_fu_f-1)\lambda_e\le0$(因 $\sum u\le1/2$),即 $u_e\le\sigma_e$;展开 $u_e=\sigma_eR_e^2/(2(2\log n)^2)$ 且 $\sigma_e>0$($\sigma\ge\lambda/2>0$),得 $R_e\le2\sqrt2\log n$。$\|P\|_{\infty\to\infty}=\max_e\sum_f|P_{ef}|$ 是逐元素绝对值的行和范数公式;$P,I-P$ 在 $\ell_2(\sigma)$ 中是正交投影故为收缩。

(c) 机械理由。$\sigma\ge\lambda/2$ 的 1/2 被下游逐字消费两次:paper.tex:453($\sum u\le1/2$ 的预算,来自 `eq:average-row-sums` 的 $(2\log n)^2$ 除以前面的 2)与 paper.tex:471-475($\lambda\le2\sigma$,把 $\sigma$-误差换 $\lambda$-误差时付因子 2,所以两段构造的目标误差都写成 $\eta b/2$ ，并非 $\eta b$)。$H$ 取 $4\log(2n)$:同时吸收 $2\sqrt2\log n$(不动点行界)与 $\log(2n)$ 的抽样维数因子;取 $2n$ ，并非 $n$ 是为 $n=2$ 时 $H>0$ 的边角(Lean 侧改 $H=4\log n$ 并把全域阈值改成 $n\ge2$,用 `log_nat_lower` 保正,见 §7)。"收缩 + 行界"这对组合被谁消费:$1<p<2$ 段的 `eq:below-second-moment`(收缩给 $\sum\sigma\mathbb E|F|^2\le\sum\sigma\mathbb E\min\{|Y|,T\}^2$,行界给 $\mathbb E|Y-F|_1\le C_pHT^{1-p}$)与 $p>2$ 段的 `eq:above-cutoff-bounds`(同理)。$D$ 不在本引理出现,它只在 `eq:eta-choice` 处定 $\eta$。

(d) `[推测]` 失败路线:一, `[推测]` 不用不动点、直接解 $\max_eR_e$ 的最小化:该极小可能无(开约束)或不在 $\Sigma$ 内,且平均界不控制 sup,断在紧性;二, `[推测]` 把 $\lambda/2$ 换 $\lambda/\varphi(\lambda)$ 型更紧约束,会破坏 $\Phi$ 的自映射性($\sum u\le1/\varphi$ 需 $\le1- u$ 余量),Brouwer 失效;三, `[推测]` 试图让 $\sigma$ 与 $\lambda$ 无关(全局一组权重),电势定位的加权平均随 $\sigma$ 变化漂移,行界不再一致。

### 5.6 `lem:poisson` 带符号 Poisson 公式(paper.tex:520-540)

(a) 逐字:"Let $h$ be a bounded real function supported on a region of finite $\nu$-measure, and let $S$ be its signed Poisson sum. Then $\mathbb E e^{itS}=\exp(\int(\cos(th)-1)d\nu)$, $\mathbb E e^{tS}=\exp(\int(\cosh(th)-1)d\nu)$, $\mathbb E S=0$, $\mathbb E S^2=\int h^2d\nu$. The characteristic-function identity also holds for unbounded $h$ on a finite-measure region."

(b) 推导补全。条件于计数 $N\sim\operatorname{Poisson}(M)$:单样本的符号平均是 $\frac12(e^{ith}+e^{-ith})=\cos(th)$,$\mathbb E z^N=\exp(M(z-1))$ 给出 $\mathbb E e^{itS}=\exp(\int(\cos(th)-1)d\nu)$($M$ 与 $\nu$ 的密度合并成积分)。MGF 同理用 $\cosh$。二阶矩:对 $\mathbb E e^{itS}$ 在 $t=0$ 展开到 $t^2$ 项,$\cos(th)-1=-t^2h^2/2+O(t^4)$,指数化后 $\mathbb E S^2=\int h^2d\nu$;$\mathbb E S=0$ 由符号对称。无界 $h$ 的延拓:截断 $h$、单调/控制收敛进特征函数。$M=0$ 时和约定为零(paper.tex:514)。分裂性:papers.tex:511-518 用概率母函数说明 Poisson 计数对不相交区域独立,故"分别在不同二进带采样再求和"合法,并且 $V$ 值函数的采样和仍在 $V$ 内(每条样本路径是 $V$ 中向量的和)。

(c) 机械理由。本引理是计算说明书,不含 $p,D$;$\nu$ 的有限性条件消费自 `eq:powerlaw`:$\nu(\max_e|v_e|>a)\le|E|a^{-p}$,故区域 $\{2^{-j-1}<\|v\|_\infty\le2^{-j}\}$ 测度 $\le|E|2^{p(j+1)}<\infty$(paper.tex:558)。"$V$ 值"这一闭合性被两个主构造共用($1<p<2$ 的 $Y$ 收敛于 $V$、$p>2$ 的 $W\in V$,paper.tex:566-569 与 900-902),它保证每个坐标确实是某组标号 $z_i$ 的归一化梯度,`lem:weighted` 的装配步才有标签可用。均匀符号的意义:中心化免费,$\mathbb E S=0$ 让二矩等于强度积分,无需再减均值。

(d) `[推测]` 失败路线:一, `[推测]` 用固定项数的和($N$ 确定)替代 Poisson:分裂独立性丢失,二进带之间产生耦合,小跳 $L_2$ 收敛论证断链;二, `[推测]` 不带符号直接采样:均值非零,大跳区域的贡献把 $\mathbb E S$ 拉离 0,矩比较时多出一个一阶项无法吸收;三, `[推测]` 让强度测度无穷(全域一次采样):Poisson 计数无穷大,公式两边同趋 $-\infty$,定义失效,这正是 $1<p<2$ 段必须按二进带切小区域的原因。

### 5.7 `lem:poisson-moments` 近可加 Poisson 矩(paper.tex:880-893,证明在附录 B paper.tex:1231-1284)

(a) 逐字:"Let $h$ be a bounded real function supported on a region of finite $\nu$-measure, and let $S$ be its signed Poisson sum. For $q>2$ and $\epsilon>0$, $\int|h|^qd\nu\le\mathbb E|S|^q\le(1+\epsilon)\int|h|^qd\nu+C_{q,\epsilon}(\int h^2d\nu)^{q/2}$."

(b) 推导补全。标量不等式两条:下界 $\frac{|a+b|^q+|a-b|^q}2\ge|a|^q+|b|^q$(凸性给 $\ge(a^2+b^2)^{q/2}$,再 $\ge|a|^q+|b|^q$,paper.tex:1235-1240);上界 $\frac{|a+b|^q+|a-b|^q}2\le|a|^q+(1+\epsilon')|b|^q+C_{q,\epsilon'}|a|^{q-2}|b|^2$($u=b/a$ 分区间:原点 Taylor、远处渐近、紧集中间放大系数,paper.tex:1243-1252)。鞅式递推:记 $M_q=\mathbb E|S_N|^q$,$S_j$ 是 $S_N$ 的条件期望故 $\mathbb E|S_j|^q\le M_q$;对 $X_j$ 独立对称,逐次加一项并用上界标量式,得 $M_q\le(1+\epsilon')\sum\mathbb E|X_j|^q+C_{q,\epsilon'}M_q^{1-2/q}\sum\mathbb E|X_j|^2$;Young 把 $M_q^{1-2/q}\cdot V$ 拆成 $\theta M_q+C(\theta)V^{q/2}$,吸收后 $(1+\epsilon')/(1-\theta)\le1+\epsilon$。Poisson 逼近:取 $N>M$,每次试验以概率 $M/N$ 激活一个带符号样本否则为 0,激活数 $B_N$ 依分布收敛到 $\operatorname{Poisson}(M)$,$\mathbb E e^{B_N}=(1+M(e-1)/N)^N\le e^{M(e-1)}$ 给一致可积,h 有界故 $q$ 阶矩收敛,把独立和不等式传到 Poisson 和。下界的传递:每试验矩恰为 $\int|h|^qd\nu/N$ 的份额,$N$ 次求和还原。

(c) 机械理由。$q>2$ 硬约束:标量上界里的 $|a|^{q-2}|b|^2$ 项要求 $q-2>0$ 才有齐次性匹配;$q=2$ 时上下界夹逼退化(等号成立),整个引理在 $q=2$ 空洞,这解释了为什么 $1<p<2$ 段根本不用它,而 $p>2$ 段以 $q=p$ 使用。$(1+\epsilon)$ 前缀被谁消费:paper.tex:906-920 取 $\epsilon=\eta/32$,让 $\epsilon m_e$ 项吃 $\eta b/16$ 预算,余下两项($\eta b/8$ 来自投影、$\eta b/16$ 来自方差项 $C_{p,\epsilon}a_e^{p/2}$ 的 `eq:above-variance-error` 放大)合成 `eq:above-poisson-error` 的 $\eta b/4$。"leading coefficient 任意接近 1"的声明在 paper.tex:876-878 逐字给出理由:desired distortion $D$ 可任意接近 1,若系数是固定的 $1+\delta_0$,当 $D^p<1+\delta_0$ 时预算表(Paper 第 8 节表 tab:moment-contract)整体崩盘。$C_{q,\epsilon}$ 的巨大性由论文诚实承认并塞进 $L$ 的二次放大(paper.tex:927-929 "Enlarge $L$ … including its constant $C_{p,\epsilon}$")。Lean 侧:$C_{0}$、`aboveVariance`、`ramp_sum_bounded_law` 的三元误差分解式 `((1+η)^3-1)*b + C₀*H^{p-2}(ℓ+1) + C₀*J^p*exp(-T/(2J))*n² ≤ ε`(AboveTwo.lean:35-36)与本段的三笔预算一一对应,其中 $(1+\eta)^3-1$ 是"矩抬升 $(1+\epsilon)$ 再叠加投影误差 $(1+\eta/8)$、抽样 $(\eta/4)$"的合并形式。

(d) `[推测]` 失败路线:一, `[推测]` 直接引用 Rosenthal 不等式 $\mathbb E|\sum X_j|^q\le C_q(\sum\mathbb E|X_j|^q+(\sum\mathbb E X_j^2)^{q/2})$:系数 $C_q>1$ 固定,断在 $D\downarrow1$ 的一致性(paper.tex:201-204 明言附录 B 的使命是拿 $1+\epsilon$);二, `[推测]` 去掉 $(\int h^2d\nu)^{q/2}$ 项、只要 $(1+\epsilon)\int|h|^q$:该二阶项在单次大跳场景不可避免,反例是强度集中于一个大原子的 Poisson 和;三, `[推测]` 用 Stechmann/Peszat 型精确常数界:$q$ 的阶矩比 $((q-1)/(e-1))^{q/2}$ 增长,常数在 $\nu$ 的重尾下发散,预算表撑不住。

### 5.8 第 5 节公共设置:齐次增量测度 $\nu$(paper.tex:477-518)

(a) 逐字(要点):"On $\Omega=(0,\infty)\times\{1,\ldots,m\}$, set $d\nu(r,t)=pr^{-p-1}dr$ on each copy indexed by $t$, $g_e(t)=(x_i(t)-x_j(t))/\delta_e$, $v_e(r,t)=rg_e(t)$. Since $\sum_{t=1}^m|g_e(t)|^p=1$, direct integration gives $\nu(|v_e|>a)=a^{-p}$ $(a>0)$."以及 `\nu(\max_e|v_e|>a)\le|E|a^{-p}$`、"The second moment of the small jumps is finite precisely when $p<2$; for $p>2$, the useful finite second moment is instead in the large jumps."(paper.tex:499-503)

(b) 推导补全。$\nu(|v_e|>a)=\sum_t\int_{\{rg_e(t)>a\}}pr^{-p-1}dr$;内层对每个 $t$ 等于 $(|g_e(t)|/a)^p$… 精确地 $\int_{a/|g_e(t)|}^\infty pr^{-p-1}dr=|g_e(t)|^pa^{-p}$,对 $t$ 求和用归一化 $\sum_t|g_e(t)|^p=1$(输入点在 $\ell_p^m$ 中,$\delta_e=\|x_i-x_j\|_p$ 的定义),得 $a^{-p}$。一般泛函等式 `eq:magnitude-density` 由层蛋糕/变量替换:$\int\phi(|v_e|)d\nu=\sum_t\int\phi(rg_e(t))pr^{-p-1}dr=p\int_0^\infty\phi(u)u^{-p-1}du$(代换 $u=r|g_e(t)|$,与 $t$ 无关,再求和)。$\max$ 界:union bound,$\sum_e\nu(|v_e|>a)=|E|a^{-p}$。$g$ 的 $\ell_p$-归一与 $v\in V$ 的关系:对每个固定 $(r,t)$,向量 $(v_e)_{e}=r(z_i-z_j)/\delta_e$($z=x(t)$)属 $V$ 的定义式,逐点成立,所以采样和落在 $V$。

(c) 机械理由。幂 $r^{-p-1}$ 是被 $a^{-p}$ 尾刻出来的唯一选择:指标密度 $pr^{-p-1}$ 的尾积分是 $a^{-p}$,恰与 $\ell_p$ 归一抵消,使所有边的强度全同,公共矩 $b$ 才能"与 $e,\lambda$ 无关"(paper.tex:653 逐字)。小跳二矩 $\int_{|v|\le1}|v|^2d\nu=p/(2-p)$:这就是 §2.1 里发散常数的出处,$p\uparrow2$ 爆炸把区间劈成两半;"大跳二矩有限"对偶地是 $\int_{|v|>a}|v|^2d\nu=\frac p{p-2}a^{2-p}$(paper.tex:771-772),$p\downarrow2$ 同样爆炸。第 5 节把两段的分岔预告在纸面上(paper.tex:499-503),我把它读成论文的"总开关":同一个 $\nu$,二矩在 $p<2$ 存于小跳、在 $p>2$ 存于大跳,后续所有不对称(裁剪 vs. ramp、稳定律 vs. Poisson)都是这一句的推论。$m$ 的有限性来自 `lem:exact-upper` 的约化。

(d) `[推测]` 失败路线:一, `[推测]` 把指数换成 $r^{-q-1}$($q\ne p$):尾变成 $a^{-q}$,与 $\delta_e$ 的归一失配,公共矩不再与边无关,`lem:weighted` 的 $b$ 独立性断;二, `[推测]` 直接在无穷坐标空间上定义 $v$(不做 $\binom n2$ 约化):$\sum_t|g_e|^p=1$ 不再成立(积分不是求和),层蛋糕等式右端多出 $\|g_e\|_{\ell_p^m}$ 的失真,断在 `eq:powerlaw`;三, `[推测]` 用有限个原子的经验测度替代 $\nu$:矩比较全部离散化,稳定律特征函数公式 `eq:below-characteristic` 不再精确。

### 5.9 第 6 节构造:稳定 marginals、裁剪与投影($1<p<2$, paper.tex:542-706)

(a) 逐字(节点引文)。构造 $Y$:"On the region $\{\|v\|_\infty>1\}$, this is an ordinary signed compound Poisson sum… For each $j\ge0$, independently sample the region $A_j=\{2^{-j-1}<\|v\|_\infty\le2^{-j}\}$… Consequently $\sum_{j\ge0}Y^{(j)}$ converges in $L_2$ with values in the finite dimensional space $\R^E$."(paper.tex:551-569)。特征函数与尾:\E e^{i\theta Y_e}=\exp(p\int_0^\infty(\cos(\theta u)-1)u^{-p-1}du)$、$c_pa^{-p}\le\Prob(|Y_e|>a)\le C_pa^{-p}$($a\ge1$)。(paper.tex:572-588)。裁剪:"For $T>1$, let $[Y]_T$ denote coordinatewise clipping to $[-T,T]$, and set $F=P[Y]_T$. Then $F\in V$ and $\|F\|_\infty\le HT$."(paper.tex:624-629)。误差与选择:"$\sum_e\sigma_e|\mathbb E|F_e|^p-b|\le C_pH^{2-p}$"(`eq:below-weighted-error`, paper.tex:678-681);"Choose $T=\exp(A_{p,\eta}H^{2-p})$, $K=HT$… $\log K=O_{p,\eta}((\log n)^{2-p})$."(paper.tex:683-705)

(b) 推导补全。$L_2$ 收敛:$\sum_j\mathbb E|Y^{(j)}_e|^2$ 的和 $=\int_{0<\|v\|_\infty\le1}|v_e|^2d\nu\le p/(2-p)<\infty$;独立 centered $L_2$ 值向量在有限维空间和收敛。$Y_e$ 同分布:特征函数只依赖 $p$(paper.tex:581-583,用唯一性定理 Durrett 3.3.11)。上尾:分裂 $Y_e\overset d= B_a+S_a$,$\mathbb P(N_a\ge1)=1-e^{-a^{-p}}\le a^{-p}$,Chebyshev 给 $\mathbb P(|S_a|>a)\le\frac{p}{2-p}a^{2-p}/a^2$,合计 $(1+\frac p{2-p})a^{-p}$。下尾的妙处:条件于 $N_a=1$、跳幅 $u>a$、小跳和 $S_a=s$,$|s+u|$ 与 $|s-u|$ 至少一个 $\ge a$,符号等概,故 $\mathbb P(|Y_e|>a)\ge\frac12\mathbb P(N_a=1)=\frac12a^{-p}e^{-a^{-p}}\ge\frac1{2e}a^{-p}$,给出 $c_p=\frac1{2e}$。一阶误差:$|Y_e-F_e|\le\sum_f|P_{ef}|(|Y_f|-T)_+$ 逐点成立(先裁后投影 vs. 先投影:利用 $Y=PY$ 与 $P$ 的行和),$\mathbb E(|Y_f|-T)_+=\int_T^\infty\mathbb P(|Y|>t)dt\le C_pT^{1-p}$。二阶界:$\sum\sigma\mathbb E|F|^2\le\sum\sigma\mathbb E\min\{|Y|,T\}^2=\int\min\{|v|,T\}^2d\nu\le C_pT^{2-p}$(只用收缩性 + `eq:magnitude-density`)。矩比较的平衡:$h_a(t)=\min\{|t|,a\}^p$ 是 $pa^{p-1}$-Lipschitz,低端误差 $\le C_pa^{p-1}\cdot C_pHT^{1-p}=C_pH(a/T)^{p-1}\cdot T^{0}$… 论文直接写 $C_pH^{2-p}$ 于 $a=T/H$(paper.tex:646-648:低端代价 $H(a/T)^{p-1}$,高端代价 $(T/a)^{2-p}$,平衡点 $a=T/H$);高端用 $0\le|t|^p-h_a(t)\le a^{p-2}|t|^2$($p<2$!)再吃二阶界,得 $C_pa^{p-2}T^{2-p}=C_pH^{2-p}$。$b$ 的下界:$b=p\int_0^at^{p-1}\mathbb P(|Y|>t)dt$,把积分拆成 $[1,a]$,在 $t\ge1$ 用 $c_pt^{-p}$,被积函数 $t^{p-1}t^{-p}=1/t$,积出 $\log a$,即 $b\ge c_p\log a$。最后 $T=\exp(AH^{2-p})$ 让加性误差 $C_pH^{2-p}$ 相对 $b\ge\frac{c_pA}2H^{2-p}$ 之比 $=2C_p/(c_pA)<\eta$(取 $A$ 大),$\lambda\le2\sigma$ 补因子 2。

(c) 机械理由。这里回答"$p$ 与 $D$ 各被哪一步消费":$p\in(1,2)$ 消费于(i)$p/(2-p)$ 有限性决定整段可用小跳二矩,(ii)$|t|^p-h_a(t)\le a^{p-2}|t|^2$ 要求 $p<2$(指数 $p-2<0$ 才让 $a$ 的幂把高端压小),(iii)误差 $C_pH^{2-p}$ 的指数 $2-p=\gamma(p)$ 全部来自"$H(a/T)^{p-1}$ 与 $(T/a)^{2-p}$ 平衡"这一步的代数,$\gamma$ 不是装饰,是两次幂次相减的残值。$D$ 只在 `eq:eta-choice` 出现,$\eta$ 经 $A_{p,\eta}$ 进入 $T$ 的指数,再进 $\log K$ 的常数,$C_{p,D}$ 的依赖链是 $D\rightsquigarrow\eta\rightsquigarrow A\rightsquigarrow T,K\rightsquigarrow d$。"$o(1)$ 的来源"在本段的答案:平衡式 $a=T/H\ge2$ 需 $\log H=o(H^{2-p})$(paper.tex:689 逐字用 little-o),$d$ 里 $K^{2p}=e^{2p\log K}$ 而 $\log K=O(H^{2-p})$,故 $\log d/\log n\to0$,速率 $(\log n)^{1-p}\cdot O((\log n)^{2-p})… $ 即 $(\log n)^{-\,(p-1)}$。$T$ 与 $K$ 分离消费:$T$ 管裁剪($|Y|\le T$),$K=HT$ 管投影放大;Lean 用 $T=H e^{A(H^{2-p}+1)}$、$K=H^2e^{A(H^{2-p}+1)}$(BelowTwo.lean:33-35),多出的 $+1$ 与额外 $H$ 是为把"充分大 $n$"的渐近话改写成 $n\ge2$ 的全域话。

(d) `[推测]` 失败路线:一, `[推测]` 不裁剪、直接 $F=PY$:无界,`lem:weighted` 的 $K$ 不存在,Hoeffding 步断;二, `[推测]` 裁剪后不投影($F=[Y]_T$):不再属于 $V$,无标签,装配步断,且逐边矩失真方向未知;三, `[推测]` 平衡点改 $a=cT/H$:低端误差乘 $c^{p-1}$、高端乘 $c^{p-2}$,$p-1>0$ 与 $p-2<0$ 反向移动,任何 $c\ne1$ 都抬高两者之一,证明仍通但常数变差,唯一被优化的值是 $c=1$;四, `[推测]` 用 $p$-stable 直接当坐标($Y$ 不裁剪):$K$ 只能取本质无穷大,维数回 $n^{O(1)}$。

### 5.10 第 7 节构造:截断 ramp、投影误差与 Poisson 采样($p>2$, paper.tex:708-1001)

(a) 逐字(节点)。能量:"$u=\sum_{k=0}^{\ell-1}(v_{\le2^{k+\ell}}-v_{\le2^k})$, $Z=Pu$. … $b:=\int|u_e|^pd\nu=p\log2(\ell^p+2\sum_{j=1}^{\ell-1}j^p)$, $c_p\ell^{p+1}\le b\le C_p\ell^{p+1}$."(paper.tex:730-751)。基本界:"$\|Z\|_{L_2(\rho)}^2\le C_p$, $\sup_e\int|Z_e|^2d\nu\le C_pH^2$, $\sup_{e,r,t}|Z_e(r,t)|\le H2^{2\ell}$."(paper.tex:784-791)。投影误差:"$\|Z-u\|_{L_p(\rho)}^p\le C_pH^{p-2}(\ell+1)$."(paper.tex:805-808)。相对误差与长度:"$\|Z-u\|_{L_p(\rho)}/b^{1/p}\le C_pH^\gamma/\ell$"、"$\ell=\lceil LH^\gamma\rceil$", $\gamma=1-2/p$。(paper.tex:860-869)。Poisson 步与终误差:"$0\le\mathbb E|W_e|^p-m_e\le\epsilon m_e+C_{p,\epsilon}a_e^{p/2}$"、"$\sum_e\sigma_e|\mathbb E|W_e|^p-b|\le\eta b/4$"。(paper.tex:906-936)。封顶:"$J=C_p'H2^{2\ell}\ge1$… $\mathbb P(\mathcal B)\le Cn^{-6}$… $0\le\mathbb E|W_e|^p-\mathbb E|F_e|^p\le C_pJ^pn^{-3}$… $\log K=O_{p,\eta}((\log n)^{1-2/p})$."(paper.tex:940-1000)

(b) 推导补全。剖面复现数:$|v_e|\in(2^j,2^{j+1}]$ 时,第 $k$ 项带它当且仅当 $2^k<|v_e|\le2^{k+\ell}$,即 $\max(0,j-\ell+1)\le k\le j<\ell$,计数为 $1,2,\ldots,\ell$ 升到 $\ell$ 再降回,恰是三角剖面;柱 $j$ 的强度贡献 `eq:magnitude-density` 取 $\phi=\mathbf1_{(2^j,2^{j+1}]}$:$p\int_{2^j}^{2^{j+1}}u^{-p-1}du$ 乘复现 $m$ 的 $p$ 次方,合并得 $b=p\log2(\ell^p+2\sum j^p)\asymp\ell^{p+1}$(几何级数在幂 $u^{-p}$ 下每柱等比 $2^{-pj}$,复现的 $m^p$ 在上升段 $j^p$ 求和主导)。$L_2$ 界:每个带段 $\|v_{\le a}-v_{\le b}\|_{L_2}\le(\int_{u>a}|v|^2d\nu)^{1/2}\le C_p a^{1-p/2}$… 论文直接对 $u_e$ 的每个加项用大跳二矩 $\frac p{p-2}2^{(2-p)k}$ 开根后几何求和(paper.tex:769-781)。投影误差的分裂:$A_k=(P-I)v_{\le2^k}=-(P-I)v_{>2^k}$(因 $Pv=v$ 逐点),故 $\|A_k\|_\infty\le2H2^k$、$\|A_k\|_{L_2}\le C_p2^{(1-p/2)k}$;而 $Z-u=\sum_{k=\ell}^{2\ell-1}A_k-\sum_{k=0}^{\ell-1}A_k$(望远镜,由 $u$ 的定义式直接展开)。水平 $\tau\ge16H$ 分裂:小指标项 sup 和 $\le\tau/2$,大指标项 $L_2$ 和 $\le C_p(\tau/H)^{1-p/2}$,Chebyshev 得尾 $\rho(|Z-u|>\tau)\le C_p\tau^{-2}$($\tau<16H$)或 $C_pH^{p-2}\tau^{-p}$($\tau\ge16H$);层蛋糕积分 $\int p\tau^{p-1}\cdot$ 尾 $d\tau$,截尾于 $CH2^{2\ell}$,大水平段给 $C_pH^{p-2}\ell$。能量误差用逐点幂差不等式 $||x|^p-|y|^p|\le p|x-y|(|x|+|y|)^{p-1}$ 加 Hölder(paper.tex:850-858)。Poisson:区域 $S=\{\max_e|v_e|>1\}$( $u$ 在其外为零,$\nu(S)\le|E|$),`lem:poisson-moments` 给每边 $0\le\mathbb E|W_e|^p-m_e\le\epsilon m_e+C_{p,\epsilon}a_e^{p/2}$;$\sum\sigma a_e^{p/2}\le(\max a_e)^{p/2-1}\sum\sigma a_e\le C_pH^{p-2}$ 由 `eq:above-basic-bounds` 两式相乘(混合 Hölder/求幂);三笔预算 $\eta b/8+\eta b/16+\eta b/16=\eta b/4$。封顶:MGF $\mathbb E e^{\pm W_e/J}=\exp(\int(\cosh(Z_e/J)-1)d\nu)\le e^{C_0}$($\cosh s-1\le C_0s^2$ 于 $|s|\le1$,$a_e\le J^2$),指数 Markov 给 $\mathbb P(|W_e|>Jz)\le2e^{C_0-z}$,取 $z=8\log(2n)\cdot J/K$… 论文置 $K=8J\log(2n)$,union 后 $\mathbb P(\mathcal B)\le Cn^{-6}$;坏事件整体丢弃保 $V$;Cauchy--Schwarz:$\mathbb E|W|^{2p}$ 界 $C_pJ^{2p}$ 配 $\mathbb P(\mathcal B)^{1/2}\le Cn^{-3}$ 得 `eq:above-truncation-error`。

(c) 机械理由。$\ell^{p+1}$ vs. $H^{p-2}\ell$:两边同除 $b^{1/p}\asymp\ell^{(p+1)/p}$,误差率 $\asymp(H^{p-2}\ell)^{1/p}/\ell^{1+1/p}=H^{1-2/p}/\ell$,所以选 $\ell=LH^{1-2/p}$ 把相对误差压成 $C_p/L$;这解释了 $\gamma(p)=1-2/p$ 的双因子出身:分子 $p-2$ 来自大跳二矩尾指数,除以 $p$ 开根号,加 1 来自剖面高度($\ell$ 的一次幂误差 vs. $\ell^{p+1}$ 能量)。$\tau\ge16H$ 与 $2^k\le\tau/(16H)$ 的 16:吸收 $2H2^k$ 的 sup 系数与几何级数首项,使小项 sup 和 $\le\tau/2$ 是纯几何和估计($\sum2^{k}2H\le 2H\cdot\tau/(8H)\le\tau/2$ 级别,常数宽松)。$K=8J\log(2n)$ 的 8:union bound 要 $\mathbb P(\mathcal B)\le Cn^{-6}<\eta b/4$ 级小,指数尾 $e^{-z}$ 取 $z=8\log(2n)$ 换 $n^{-8}$,留 $n^{-6}$ 富余。$J$\ge1 的显式要求:让 $\cosh$ 小量条件 $|Z_e/J|\le1$ 生效($\sup|Z_e|\le H2^{2\ell}\le J$ 且 $a_e^{1/2}\le J$)。$D$ 的消费同 §5.9($\eta$ 定 $L$ 的下界,经 `eq:above-relative-error` 与三笔预算);$\epsilon=\eta/32$ 是被 `eq:above-poisson-error` 的预算表指定的。$o(1)$ 的来源:$\log K=O_p(\ell)+O(\log\log n)=O((\log n)^{1-2/p})$,指数落在 $(\log n)^{p\gamma}$ 里,$d$ 的 $\log$ 除 $\log n$ 趋 0。对照 Lean 侧:J := (aboveVariance p+1)*H*2^(2ℓ), T := 2J(p log J + H + log(C+1)), ℓ := 2m = 2(⌈L(H^γ+1)⌉₊+1)(AboveParameters.lean:61-64),其中 T 扮演 $K=8J\log(2n)$ 的封顶角色,展开式里 $e^{-T/(2J)}n^2$ 对应 $J^pn^{-3}$(机器把 $n^{-6}$ 的平方根步合并成指数尾直接式)。

(d) `[推测]` 失败路线:一, `[推测]` 单层截断($\ell=1$):能量 $b\asymp1$ 而误差 $\asymp H^{p-2}$,比值失控,$D\downarrow1$ 时维数爆炸,重叠正是把误差/能量比里 $\ell$ 的幂次从 $-1/p$ 改写成 $-1$ 的手段;二, `[推测]` 剖面取平顶(所有柱复现 $\ell$):能量同阶但 $L_2$ 大跳界失去几何衰减,`eq:above-cutoff-bounds` 的和发散;三, `[推测]` 坏事件按坐标丢弃($F_e=W_e\mathbf1_{|W_e|\le K}$):$F\notin V$,标签不存在,装配断,论文特意"丢整向量"(paper.tex:966-967 逐字"Discarding the entire vector on a bad event preserves membership in $V$");四, `[推测]` 把 Poisson 换成固定项数二项采样:分裂独立性丢,矩比较多出组合数。

### 5.11 第 8 节两个论证:packing 下界与 grid 障碍(paper.tex:1047-1128)

(a) 逐字(packing):"The coordinate unit vectors in $\ell_p^n$ form an equilateral set… $n(1/2)^d\le(D+1/2)^d$, hence $n\le(1+2D)^d$."(paper.tex:1049-1058)。逐字(障碍):"$\Delta_p(a,b)=|a+b|^p+|a-b|^p-2|a|^p-2|b|^p$. If $ab=0$, this is zero. If $ab\ne0$, it has strictly the sign of $p-2$."、"$\mathcal X_k=\{0\}\cup\{r_i,-r_i\}\cup\{c_j,-c_j\}$… $d\ge k^2$."(paper.tex:1063-1120)

(b) 推导补全。packing:$\ell_p$ 单位球体积 $=c_p^d$,平移缩放到 $1$-分离、含于半径 $D$ 球;半径 $1/2$ 开球不相交且含于半径 $D+1/2$ 球;体积比 $(\frac{D+1/2}{1/2})^d=(1+2D)^d\ge n$。注意 $p$ 未进入:任意范数下都成立,是纯度量论证。grid:$\Delta_p$ 符号由 $(a^2+b^2)^{p/2}$ 与 $|a|^p+|b|^p$ 的凸/凹比较逐字给出(paper.tex:1067-1077);等式 $\|u+v\|^p+\|u-v\|^p=2\|u\|^p+2\|v\|^p$ 当且仅当支撑不交(逐项同号,和为零当且仅当每项为零)。等距化:$f(0)=0$ 平移缩放;反号点 $f(-x)=-f(x)$ 由三角不等式取等强制(paper.tex:1098-1104)。行与行不交($r_i,r_{i'}$ 在 0 处 $\Delta_p=0$,像的平行四边形恒等式保持,得支撑不交),行列交($\|r_i+c_j\|^p+\|r_i-c_j\|^p-2-2=2^p-4\ne0$,凡 $p\ge1$, $p\ne2$… 论文注明 $2^p-4\ne0$ 对所有 $p\ne2$ 成立且含 $p$ 为偶整数的情形,paper.tex:118-119 的 Lamperti 判据即此),故像支撑逐对相交;同一坐标至多归一个行支撑与一个列支撑之交,故 $d\ge k^2$。$n\ge9$ 时 $k=\lfloor(n-1)/4\rfloor\ge2$,$|\mathcal X_k|=4k+1\le n$,补点成 $n$ 点集,限制回 $\mathcal X_k$。

(c) 机械理由。$\frac{n-1}{4}$:构型点数 $4k+1$($2k$ 行向量、$2k$ 列向量、原点),解 $4k+1\le n$。$k\ge2$ 防退化(一行一列交于一点时平凡)。$1+2D$ 的形态被主定理下界与 Lean 陈述逐字共享(§7)。本节的消费方:`thm:main` 的下界与 $D=1$ 极限 2;grid 障碍同时解释了为何精确情形 $\gamma=1$(对数极限 2)而近似情形 $\gamma<1$:平行四边形缺陷是精确等距的刚性,任何 $D>1$ 的松弛都摧毁同号论证,这正是"D 的开区间假设被哪一步消费"的对偶答案。

(d) `[推测]` 失败路线:一, `[推测]` 试 $D$-松弛版同号论证:$\Delta_p$ 变成区间符号,支撑相交数不再被精确钉住,断在 $2^p-4$ 与 0 之间无余量;二, `[推测]` 试把构型换成扩张器图(对近似情形给下界):Naor--Ren 的 $(\log n/(\log\log n)^2)^{p/2}$ 用的是别的技术(paper.tex:142-146),本论证移植不过去;三, `[推测]` 试 $k$ 取 $\lfloor n/4\rfloor$:原点必须计入 $4k+1$ 个点,$(n-1)/4$ 是唯一正确的地板。

### 5.12 图 `truncation-ramp.tex` 的逐段解读(build/figures/truncation-ramp.tex:1-38)

(a) 图题逐字(paper.tex:760-765):"The overlapping truncations for $\ell=4$. The intervals $I_k=(2^k,2^{k+4}]$, $0\le k<4$, give multiplicities $1,2,3,4,3,2,1$ on $(2^j,2^{j+1}]$, $j=0,\ldots,6$, and zero outside $(1,128]$. Thus $u_e=m_4(|v_e|)v_e$ before projection. By the magnitude-density identity, a bin of multiplicity $m$ contributes $p\log2\,m^p$ to $\int|u_e|^pd\nu$."

(b) 图源补全:tikz 上半区画 $I_0,\ldots,I_3$ 四条水平区间(line 12-20,左端空心圈、右端实心点,精确表达 $(2^k,2^{k+\ell}]$ 的开闭);横轴是 $\log_2|v_e|$(line 26);下半区柱高 $0.34\times$ 复现数(line 27-33,`{0/1,1/2,2/3,3/4,4/3,5/2,6/1}` 与论文剖面逐字一致);$128=2^7$ 是 $\ell=4$ 时 $2^{2\ell}=2^8$ 内 $(1,2^{2\ell}]$ 的最右柱界(line 27 循环止于 6,$(2^6,2^7]$ 复现 1)。

(c) 机械理由:图把 `eq:above-energy` 的 $\ell^p+2\sum j^p$ 视觉化为"剖面高度乘柱强度",柱强度按 $2^{-pj}$ 几何衰减而 $u$ 的 $p$ 能量各柱等贡献($m^p$ 补偿 $(2^{-j})^p$),这是 $b\asymp\ell^{p+1}$ 的图形证明;sup 界 $H2^{2\ell}$ 的 $2^{2\ell}$ 即最右端点 $2^{\ell+\ell}$。图与 Lean 的对应:复现剖面函数是 `dyadicRamp`(DyadicRamps.lean:18 `def dyadicRamp (ℓ : ℕ) (x : ℝ)`,由 `bandPart` 求和构成,`dyadicRamp_zero_small`(56 行)对应"$(1,128]$ 之外为零"的小端,`abs_dyadicRamp_le`(72 行)$\le2^{2\ell}$ 对应大端)。

(d) `[推测]` 失败路线:一, `[推测]` 若把区间画成左闭右开,望远镜分裂 $Z-u=\sum_{k=\ell}^{2\ell-1}A_k-\sum_{k=0}^{\ell-1}A_k$ 的指标平移错一格,$A_k$ 的 $L_2$ 几何和首项失配;二, `[推测]` 若剖面是平顶,图退化为等高柱,能量对误差比从 $\ell^p/H^{p-2}$ 变 $\ell/H^{p-2}\cdot\ell^0$,失去杠杆;三, `[推测]` 若柱宽取 $e^{\pm1}$ ，并非二进,复现数不再是整数三角,`eq:above-energy` 的 $\sum j^p$ 闭式失效(Lean 的 `bandPart` 也硬编码 2 的幂)。

## §6 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\gamma(p)$ | $2-p$($1<p<2$);$1-2/p$($p>2$);$0<\gamma<1$ | paper.tex:78-82 | `eq:main-bounds` 上界指数;paper.tex:1126-1128 的极限推论 | 取 $\gamma\ge1$ 则上界不再次多项式;取 $\gamma=0$ 与 packing 下界 paper.tex:87 冲突 |
| $d_p(n,D)$ | 最小达标维数 | paper.tex:62-69 | 主定理全部四条不等式 | 定义去 injective/尺度 $s$ 则下界与极限陈述对象漂移 |
| $\eta$ | 解 $((1+3\eta)/(1-3\eta))^{1/p}\le D$, $0<\eta<1/6$ | paper.tex:466-470;296 | `lem:weighted` 的 $\eta b$ 预算与维数分母 $\eta^2b^2$ | $\eta\ge1/3$ 时下盒 $(1-3\eta)b$ 非正,尺度 $s$ 失去定义 |
| $b,K$ | 公共矩与界,随构造增长,$b,K\ge1$ | paper.tex:296;301;1030-1034 | `eq:sampling-dimension` $K^{2p}/(\eta^2b^2)$ | 若强制 $b=O(1)$,加性误差无法摊薄,维数回 $n^{O(1)}$ |
| $H$ | $4\log(2n)$ | paper.tex:406-408 | `lem:projection` 行界;两段的 $H^{2-p}$、$H^{p-2}$ | 减小到 $<2\sqrt2\log n$ 则不动点行界 $R_e\le H$ 不成立 |
| $2\log n$ | GGNS 定位常数 | paper.tex:397-398;1214-1217 | `eq:average-row-sums` 的 $(2\log n)^2$;$\sum u\le1/2$ 预算 | 变成 $c\log n$($c>2$)则 $H$ 与不动点定义里的分母全部重标 |
| $T$ | $\exp(A_{p,\eta}H^{2-p})$ | paper.tex:683-687 | 裁剪水平;$K=HT$;$a=T/H$;$b\ge c_p\log(T/H)$ | $T$ 多项式于 $H$ 则 $b$ 与误差 $C_pH^{2-p}$ 同阶,$\eta b$ 预算爆 |
| $a=T/H$ | 帽水平,$a\ge2$ 需 $\log H=o(H^{2-p})$ | paper.tex:646-658;689 | $b=\mathbb E\min\{\lvert Y_e\rvert ,a\}^p\ge c_p\log a$ | 平衡点偏离 $T/H$ 则低端 $H(a/T)^{p-1}$ 与高端 $(T/a)^{2-p}$ 之一抬高  |
| $p/(2-p)$ | 小跳二矩 | paper.tex:564;599-600;606 | $Y$ 的 $L_2$ 收敛;Chebyshev 上尾系数 | $p\ge2$ 时无穷,第 6 节整体失效(区间分岔根源) |
| $1/(2e)$ | 下尾 $c_p$ | paper.tex:611-615 | `eq:below-tail` 左半边;$b\ge c_p\log a$ | 去掉 $N_a=1$ 条件论证则 $b$ 只剩 $O(1)$,$\log a$ 增益消失 |
| $\ell$ | $\lceil LH^\gamma\rceil$, $L=L(p,\eta)$ | paper.tex:865-872 | 相对误差 $C_pH^\gamma/\ell\le C_p/L$;`eq:above-variance-error` 的 $b\asymp\ell^{p+1}$ | $\ell$ 与 $H^\gamma$ 脱钩则 `eq:above-relative-error` 或 $K$ 的 $2^{2\ell}$ 至少一头失控 |
| $b$(p>2) | $p\log2(\ell^p+2\sum_{j<\ell}j^p)\asymp\ell^{p+1}$ | paper.tex:745-751;1017 | 三笔 $\eta b$ 预算的分母;`eq:above-poisson-error` | 平顶剖面给 $\ell\cdot\ell^p$ 同阶但 $L_2$ 和发散(见 5.12) |
| $J$ | $C'_pH2^{2\ell}\ge1$, $O_{p,\eta}$ 可取定 | paper.tex:940-944 | MGF 正规化 $\mathbb E e^{\pm W_e/J}\le e^{C_0}$;截断误差 $C_pJ^pn^{-3}$ | $J<\sup\lvert Z_e\rvert $ 时 $\cosh s-1\le C_0s^2$ 的小量前提断  |
| $K$(p>2) | $8J\log(2n)$ | paper.tex:962 | 坏事件 $\mathbb P(\mathcal B)\le Cn^{-6}$;$\log K=O((\log n)^\gamma)$ | 系数 8 减到 $<2$ 则 $n^{-6}$ 富余变负,union bound 失败 |
| $\epsilon=\eta/32$ | Poisson 前导系数容差 | paper.tex:918 | $\epsilon m_e\le\eta b/16$ 一笔 | 固定 $1+\delta_0$ 系数则 $D^p<1+\delta_0$ 时全链断(`lem:poisson-moments` 使命) |
| $16H$ | 尾分裂水平 | paper.tex:832-843 | $\rho(\lvert Z-u\rvert>\tau)$ 双支;`eq:above-projection-error` | 取 $<2H\cdot$几何和常数则 sup 支与 $L_2$ 支预算互换失衡 |
| $n^{-3},n^{-6}$ | 坏事件率与 Cauchy--Schwarz 后阶 | paper.tex:971;977 | 终误差 $\le\eta b/4$(大 $n$) | $J^p=n^{o(1)}$ 只保证最终趋 0,任何常数预算需 $n^{-3}$ 级富余 |
| $\log(1+2D)$ | packing 底数 | paper.tex:87;1056-1057 | 主定理左不等式;`source_main` 第二行(Lean Main.lean:16) | $\ell_p$ 球体比 $(D+1/2)/(1/2)$ 定死,改形状即改下界陈述 |
| $\lfloor(n-1)/4\rfloor^2$ | 精确下界 | paper.tex:93;1122-1124 | $D=1$ 极限 $=2$ | 构型点数 $4k+1$ 决定,$k\ge2$ 由 $n\ge9$ 保证 |
| $\binom n2$ | 精确上界 | paper.tex:94;250-252 | `lem:exact-upper`;小 $n$ 兜底 paper.tex:1043-1045 | Carathéodory 元数即超平面维数 $N$,减小则凸包论证断 |
| $C_{p,D}$ | 存在性常数,$D\downarrow1$、$p\to\{1,\infty\}$ 时发散 | paper.tex:84;1040-1041 | 上界与极限推论 | 论文明说不主张一致(paper.tex:103-105),强求一致直接假 |
| $R=3+6/(D^p-1)$ | Lean 的 distortion 预算比 | lean/OAI/Analysis/LpDimension/GradientSampling.lean:221-240 | `distortion_ratio`:$R\epsilon\le b\Rightarrow b\pm3\epsilon$ 两侧含入 $D^p$ 盒 | $D\to1^+$ 时 $R\to\infty$,$A,\ell,L$ 全线放大,与论文 $\eta$ 塌缩同步 |
| $C_0=p(2c2^p)(1+1/(p-1))+96c$ | Lean 显式误差主系数($c$=stableConstant) | BelowTwo.lean:23 | $\varepsilon=(C_0+1)(H^{2-p}+1)$;$A=R(C_0+1)/(kp)$ | $1/(p-1)$ 项对应一阶误差积分常数,替换则 $T$ 预算爆 |
| $A$ | Lean 指数斜率 $A=R(C_0+1)/(kp)$(下方)/`ramp_cutoff_envelope` 产物(上方) | BelowTwo.lean:25;AboveParameters.lean:56 | $T,K,\varepsilon$ 的指数;`capped_moment_lower_log` 兑换 $b\ge R\varepsilon$ | 减小则 $b/R$ 与三项误差的逐点不等式在最后一步 linarith 断 |
| $C$(Lean 显式) | $(3+(4p+1)/(2-p)+4pA)\cdot4^{2-p}$;上方同形换 $1-2/p$ | BelowTwo.lean:27;AboveTwo.lean:25 | `below_main_upper`/`above_main_upper` 的 $\exists C$ 见证 | 这是 $C_{p,D}$ 的机器见证,任何一项减都断在 `sampling_dimension_estimate` |
| $\varepsilon$(Lean) | $(C_0+1)(H^{2-p}+1)$(下);$b/R$(上) | BelowTwo.lean:37;AboveTwo.lean:32 | `sampling_probability_estimate` 的阈值;Hoeffding 指数 $(d\varepsilon)^2/(2d(K^p/2)^2)$ | 相对化回 $\eta b$ 需 $b\ge R\varepsilon$,改 $\varepsilon$ 则该兑换断 |
| $d$(Lean) | $\lceil(K^p)^2(H+1)\rceil_++1$ | BelowTwo.lean:57;AboveTwo.lean:48 | `Nat.sInf_le` 钉 `dimension` 上界 | 去 $+1$ 则在 $n=2$ 角落 $d=0$ 非空性断 |
| $T$(Lean 上方) | $2J(p\log J+H+\log(C+1))$ | AboveParameters.lean:64 | 尾 $C_0J^pe^{-T/(2J)}n^2$ 压成 $O(1/n^2)$ | 去 $\log J$ 项则 $J^p$ 前因子不被吸收 |
| $J$(Lean) | $(\text{aboveVariance }p+1)\cdot H\cdot2^{2\ell}$ | AboveParameters.lean:35,63;AboveTwo.lean:29 | 同上;$K$ 界 $T\le K$ 的 `hTK` | `aboveVariance` 是 $\int(\text{dyadicRamp }\ell)^2\partial\text{pareto}$ 的界(DyadicRamps.lean:219 `pareto_dyadicRamp_variance`) |
| $\ell,\,m$(Lean) | $\ell=2m$, $m=\lceil L(H^{1-2/p}+1)\rceil_++1$, $L=2R(3C+1)/c+1$ | AboveParameters.lean:43,61-62 | 能量下界 `pareto_dyadicRamp_energy_lower`(DyadicRamps.lean:175,写成 $2m$ 参数) | 论文的 $\ell$ 与机器的 $\ell$ 差一倍编号(机器 ramp 以 $2m$ 为中心剖面),改索引即断在 plateau 引式 |
| $\nu$/pareto | $pr^{-p-1}dr$;Lean `pareto p := (powerIntensity p).restrict (Ioi 1)` | paper.tex:482-486;Pareto.lean:39 | `eq:magnitude-density`;`eq:above-energy` | Lean 限制在 $(1,\infty)$ 并把小端交给 `dyadicRamp_zero_small`,去限制则积分发散 |

依赖链(文字版):$D\rightsquigarrow\eta$(eq:eta-choice)$\rightsquigarrow A_{p,\eta},L\rightsquigarrow T,\ell\rightsquigarrow b,K\rightsquigarrow d\rightsquigarrow\log d\le C_{p,\eta}+2p\log K+\log\log(2n)-2\log b$;其中 $p$ 从三处插入:$p/(2-p)$ 与 $p/(p-2)$ 的有限性(区间劈叉)、平衡点 $a=T/H$ 与剖面幂 $b\asymp\ell^{p+1}$ 的幂次代数($\gamma$ 的出身)、Hölder 与 Lipschitz 指数 $p-1,p-2$ 的符号。$\gamma(p)$ 对 $2$ 的不对称($2-p$ vs. $1-2/p$)恰是"$[1,\infty)$ 矩用 $L_2$ 小跳"与"$[1,\infty)$ 矩用 $L_2$ 大跳"两种融资方式在对数刻度上的汇率差。修正一处我在 §5.12(c) 的粗糙表述:ramp 的真实支撑右端点是 $2^{2\ell-1}$(最右区间 $(2^{\ell-1},2^{2\ell-1}]$, $\ell=4$ 时即 $2^7=128$,与图注"zero outside $(1,128]$"一致),论文的 $\sup|Z_e|\le H2^{2\ell}$ 是放宽一格的和估计(paper.tex:798-800:每项 $\le2^{k+\ell}$,和 $<2^{2\ell}$),不是剖面端点;Lean 的 `abs_dyadicRamp_le`(DyadicRamps.lean:72)同样证的是放宽值 $2^{2\ell}$。台账里 $J$ 行的 $2^{2\ell}$ 因此都按放宽口径读。

## §7 Lean 取证

### 7.1 登记与命名双轨(实测)

登记在 `E:\math\lean\formalization.yaml:1546-1548`:`comparator_config: ComparatorChallenges/SubpolynomialLp.json`、`declaration: OAI.SubpolynomialLp.source_main`、`file: OAI/Analysis/LpDimension/Main.lean`。书目条目在 formalization.yaml:607-609(title "Subpolynomial dimension reduction in $L_p$", OpenAI, id 指向本 preprint 目录的 paper.pdf)。我按任务要求核对了相邻条目 formalization.yaml:612-615:"Subpolynomial query complexity for well-conditioned log-concave sampling"(2026-09-26 目录, article.pdf),标题里同样有 Subpolynomial,是邻篇优化论文,与本篇的降维主题无涉,确认混线风险来自标题词，并非内容。

命名双轨要写清楚:磁盘模块路径是 `OAI/Analysis/LpDimension/`(import 链写作 `OAI.Analysis.LpDimension.*`,Main.lean:1 只 import `.LogLimits`),但 Lean 内部命名空间是 `OAI.SubpolynomialLp`(Main.lean:10、3、61 行),登记声明因此叫 `OAI.SubpolynomialLp.source_main`,声明前缀与目录名两套系统并存。比较器配置 `ComparatorChallenges/SubpolynomialLp.json` 实测字段:`challenge_module: ComparatorChallenges.SubpolynomialLp`、`solution_module: OAI.Analysis.LpDimension.Main`、`theorem_names: ["OAI.SubpolynomialLp.source_main"]`、`definition_names: []`、`permitted_axioms: ["propext","Quot.sound","Classical.choice"]`、`enable_nanoda: false`。

### 7.2 规模与前缀分组(全部实测)

`ls E:\math\lean\OAI\Analysis\LpDimension\` 计 45 个 .lean 文件;`wc -l` 合计 7,918 行。最大的 11 个文件:SymmetricMoments 381、Entropy 366、FourierTails 326、ClippedMoments 315、ElectricalProjection 295、HeatKernel 283、StableRetractions 281、DyadicRamps 268、Retractions 264、Packing 245、GradientSampling 241;入口 Main.lean 仅 63 行,`AboveTwo.lean` 103 行、`BelowTwo.lean` 105 行、`LogLimits.lean` 38 行、`ExactDiscretization.lean` 74 行。

顶层声明按关键字计数(实测行首模式):theorem 5、lemma 366、def 56、instance 10、abbrev 1,合计 438。五个 theorem 的清单:`exact_discretization_all_lengths`(ExactDiscretization.lean:13)、`exact_discretization_embedding`(:36)、`exact_discretization_lp_embedding`(:57)、`source_main`(Main.lean:13)、`gramHermitian`(SpectralProjection.lean:48,矩阵分析辅助)。也就是说机器证明的主体由 366 个 lemma 承担,`source_main` 是唯一的顶层出口,离散化三件套是次级出口。

按文件名前缀分组的规模(各文件行首声明计数):Stable* 组 37(StableIntensity 13、StableLaw 14、StableRetractions 10),Ramp/Dyadic/Cutoff/Above 截断组 64(DyadicRamps 25、DyadicInterpolation 5、RampLaws 11、RampRetraction 5、RampError 4、RampSum 2、ProjectedRamps 9、CutoffEnvelope 3、GlobalCutoff 9、AboveParameters 3、AboveTwo 2、BelowTwo 2),Retraction* 组 26(Retractions 17、RetractionIntegrals 9),Heat/Entropy/Spectral/Electrical 定位组 93(Entropy 30、HeatKernel 27、ElectricalProjection 13、SpectralProjection 16、HeatLocalization 7),矩与律组 113 上(SymmetricMoments 17、SymmetricLaws 11、ClippedMoments 16、FourierTails 17、CompoundPoisson 17、Parallelogram 19、Pareto 8、PowerEstimates 4、CoordinateLaws 14),采样装配与下界组(Discretization 22、GridObstruction 20、Packing 14、GradientSampling 13、GradientLaws 8、SamplingBounds 8、Sampling 5、ConvexSelection 10、ConvexRepresentation 6、ConvolutionError 6、Model 5、Main 2、LogLimits 2)。

卫生检查(grep 严格限于任务许可的三处):`sorry`、`admit`、行首 `axiom`、`#print axioms` 在 45 个文件里 0 命中;`classical` 策略行实测 39 处(分布:AboveTwo 1、BelowTwo 1、ConvexRepresentation 4、ConvexSelection 3、Discretization 3、Entropy 2、GlobalCutoff 5、GradientLaws 1、GradientSampling 4、GridObstruction 3、Packing 4、Parallelogram 1、ProjectedRamps 1、RampLaws 1、RampSum 1、Sampling 3、StableRetractions 1),与 `permitted_axioms` 里的 `Classical.choice` 一致:模块不自建公理,只吃三条标准公理;公理审计职责外置给比较器配置,模块内没有 `#print axioms` 痕迹。

tactic 词频前十(行首与缩进行首实测):`have` 1140、`rw` 523、`exact` 261、`let` 234、`simp` 226、`apply` 202、`intro` 141、`simpa` 124、`obtain` 104、`calc` 99;第十一到十四名 `refine` 93、`linarith` 57、`ring` 49、`filter_upwards` 37、`rcases` 25。词形分布说明这是一份以显式算术账(`have`+`let`+`calc`)为主、重型自动化占比极低的 Formalization:`positivity` 与 `norm_num` 只作配角出现,`nlinarith` 在 AboveParameters 的关键不等式处补刀。

### 7.3 核心问题逐条

问题一,`source_main` 的逐词解读。入口陈述(Main.lean:13-24)是三个合取块:(i) $\forall D>1,\exists C,\forall n\ge2$:`GoodDimension p n D (dimension p n D)` 且 `log n / log (1+2*D) ≤ dimension` 且 `dimension ≤ exp (C * log n ^ gamma p)`;(ii) $\forall n\ge9$:`GoodDimension p n 1 (dimension p n 1)` 且 `((n-1)/4)^2 ≤ dimension p n 1 ≤ n.choose 2`;(iii) $\forall D\ge1$:`Tendsto (fun n => log (dimension p n D) / log n) atTop (𝓝 (if 1<D then 0 else 2))`。名字里的 `source` 我读作"来源版主定理":比较器把论文原文声明的机器对应物命名为 `source_main`,与可能存在的弱化或改装陈述相区隔;它的 docstring(Main.lean:12)自称 "The universal coordinate dimension bounds and their logarithmic limits",逐词覆盖合取块 (i) 与 (iii);`main` 对应论文 `thm:main`。要逐词注意的增量在合取块 (i)(ii) 各自多带的 `GoodDimension p n D (dimension p n D)`:论文的 $d_p$ 定义默认"最小的达标 $d$",良序使最小性免费;Lean 用 `sInf {d | GoodDimension …}`(Model.lean:26-27),空集时 `sInf=0` 会稀释陈述,所以入口定理显式断言 `dimension` 自身达标(Packing.lean:166 的 `dimension_good` 以 `Nat.sInf_mem` + `exact_goodDimension`(Packing.lean:151)+ `mono_distortion`(Packing.lean:159)喂非空性)。这是"机器比论文多说的第一处"。合取块 (iii) 把论文分支写法统一成 `ite`,语义比论文更紧。

问题二,"$n$ 点子集"与"$L_p$ 空间"的建模。`GoodDimension`(Model.lean:16-22)量化 `∀ (Ω : Type u) (mΩ : MeasurableSpace Ω) (μ : @Measure Ω mΩ)`,`x : Fin n → @Lp Ω ℝ mΩ _ (ENNReal.ofReal p) μ` 且 `Function.Injective x`:抽象测度空间原样保留,不要求 $\sigma$-有限、不要求概率测度、不换原子模型;目标侧 `y : Fin n → Fin d → ℝ` 配 `coordinateDistance`(Model.lean:12-13)是 $\ell_p^d$ 的真坐标模型。"嵌入到 $\ell_p^d$"没有被稀释:唯一的重投影发生在证明内部(`exact_discretization` 先把任意构型等距搬进 $\ell_p^{\binom n2}$,BelowTwo.lean:63 消费),对外陈述仍是对全体 $L_p$ 空间。两处类型论痕迹要如实记录:其一,宇宙参数 `.{u}`:论文"any $L_p$ space"无宇宙概念,机器把 $\Omega$ 固定在任一 `Type u` 且 `source_main` 逐宇宙多态,读作"逐宇宙版本";其二,`ENNReal.ofReal p` 索引 Mathlib 的 `Lp` 类型,这是 API 形状决定,不是数学决定。`Fin n → Lp` 加 `Injective` 对论文的"The points are distinct"(paper.tex:227)是忠实翻译。

问题三,开区间假设的表达。`source_main (p : ℝ) (hp : 1 < p) (hp2 : p ≠ 2)`:严格 `1 < p` 与 `p ≠ 2` 直接携带,没有有理数限制,没有 $p\in[1+\delta,2-\delta]$ 型间隙;$D$ 侧 `1 < D →` 也是严格不等号,无 $D\ge1+\delta$ 强加。间隙压力被转移到可计算的倒数上:distortion 预算 $R=3+6/(D^p-1)$(GradientSampling.lean:221-226)与 `1/(2-p)`、`1/(1-2/p)` 进入显式 $C$(BelowTwo.lean:27、AboveTwo.lean:25);这些除法只需证明时提供非零性(由 `hp2`、`hp`、`hD` 诱导),陈述层无额外假设。$p\ne2$ 在 `gamma`(Model.lean:29)的 `ite` 里靠 `split_ifs`(Main.lean:41-45)消解:分支在 $p=2$ 处默认右支 $1-2/p=0$,但 `hγ : gamma p < 1` 两分支都证严格小于 1,恰在 $p\ne2$ 下避开退化;$p=2$ 的 Hilbert 情形按论文口径留白(paper.tex:105-106)。

问题四,$d=n^{o(1)}$ 的机器对应物。论文的 $o(1)$ 在机器里从不是 little-o:上界 witness 为具体函数 `Real.exp (C * Real.log n ^ gamma p)`,`C` 两侧皆初等显式:下方 `C = (3+(4p+1)/(2-p)+4pA)·4^(2-p)`,其中 `A = R(C₀+1)/(k·p)`、`C₀ = p·(2c·2^p)·(1+1/(p-1))+96c`、`c = stableConstant p`(StableLaw.lean:129)、`k` 来自 `stable_tail_lower`(FourierTails.lean:284)(BelowTwo.lean:17-27);上方 `C = (3+(4p+1)/(1-2/p)+4pA)·4^(1-2/p)`,其中 `A` 由 `ramp_cutoff_envelope` 存在性给出(AboveParameters.lean:56)。对照关系一句话:论文写 $O_{p,\eta}((\log n)^\gamma)$ 与"充分大 $n$",机器写 $\forall n\ge2$ 全域成立的显式常数。渐近话的机器化有两类痕迹:小跳/大跳的 little-o 条件(如 paper.tex:689 "$\log H=o(H^{2-p})$")被 $T=He^{A(H^{2-p}+1)}$ 的 $+1$、$\varepsilon=(C_0+1)(H^{2-p}+1)$ 的 $+1$、$d=\lceil\cdot\rceil_++1$ 的 $+1$ 吸收成逐点不等式;真正的极限陈述(合取块 (iii))用 `Filter.Tendsto` + `eventually`:`subpower_log_limit`(LogLimits.lean:12-15)把 $r<1$ 的 eventually 上界兑换成极限 0,`quadratic_growth_log_limit`(Packing.lean:183)兑换 $D=1$ 侧的极限 2。

问题五,非线性嵌入是否被偷偷线性化。没有。`GoodDimension` 对 $y$ 只要求存在 `Fin n → Fin d → ℝ` 的任意指派与尺度 $s>0$,无线性、无延拓、无一致性要求(对齐 paper.tex:70-71 "The maps are unrestricted; in particular, they need not extend linearly")。证明中出现的线性算子(`normalizedGradient` 的 `B.mulVec`、加权投影、相似变换)只用于保证坐标向量属于梯度子空间 $V$;最终 $y_i$ 由 `weighted_gradient_samples` 与 `sampled_labels_embedding`(BelowTwo.lean:92-96;AboveTwo.lean:88-91)从抽样标签逐配置拼装。判定测试:若机器偷用线性,登记陈述必须出现 $L_p$ 间线性算子类型与保距延拓宣称,实测声明类型里没有。诚实度高点:连"坐标须是归一化梯度"这一结构约束都原样进了 `hw` 的见证(BelowTwo.lean:71-74 的 `∃ z, B.mulVec z = F r`)。

问题六,`truncation-ramp` 图的论证落点。图的数学是剖面函数 $m_\ell$,机器里对应 `def dyadicRamp (ℓ : ℕ) (x : ℝ)`(DyadicRamps.lean:18,由 `bandPart` 在 `Finset.range ℓ` 求和构成,左开右闭可见),其配套分层:性质层(DyadicRamps 25 声明:`dyadicRamp_zero_small`:56、`abs_dyadicRamp_le ≤ 2^{2ℓ}`:72、`dyadicRamp_plateau`:83、`pareto_dyadicRamp_energy_lower`:175、`pareto_dyadicRamp_variance`:219)、误差层(ProjectedRamps 9、RampError 4,对应 paper.tex:802-848 的 $A_k$ 分裂)、概率层(RampSum 2:`ramp_sum_bounded_law`:12,Poisson 矩三元组)、预算层(CutoffEnvelope 3 + AboveParameters 3:`ramp_cutoff_envelope` 定 $A$,逐 $n$ 生成 $\ell,T$)、汇总层(AboveTwo 2)。答案:落在此前缀族共约 64 个声明,不单一文件;机器 ramp 长度取偶数编号($\ell=2m$,AboveParameters.lean:62,峰高 $2m$ 对应 `pareto_dyadicRamp_energy_lower` 的 $m$ 参数),与论文 $\ell$ 记法差一倍,按 §6 表注换算。

### 7.4 两口径对照小结(论文 vs. 机器)

1) $d_p$ 最小性:论文良序默认 vs. 机器 `sInf` + 达标断言(Main.lean:15,19);2) $o(1)$:论文 $O_{p,\eta}$ vs. 机器显式 $C(p,D)$ 初等式;3) 阈值:论文"充分大 $n$"+ $\binom n2$ 兜底(paper.tex:1043-1045)vs. 机器 $\forall n\ge2$ 前置 +1 化;4) 预算:论文相对 $\eta b$ vs. 机器绝对 $\varepsilon$ + $R\varepsilon\le b$ 兑换,`eq:weighted-target` 与 BelowTwo.lean:74 逐项对应;5) $\ell$ 索引惯例差一倍;6) $H=4\log(2n)$ vs. `H := 4*Real.log (n:ℝ)`(BelowTwo.lean:29,靠 `log_nat_lower` 保正,行界富余吸收 $\log2$ 差);7) 封顶:论文 $K=HT$/$8J\log(2n)$ vs. 机器统一 $K=H^2e^{A(H^\gamma+1)}$ 并证 $T\le K$(AboveTwo.lean:33 `hTK`);8) 极限:论文分支文字 vs. 机器 `ite` 合一 + `Tendsto`;9) 下界 $n\le(1+2D)^d$:论文体积论证(paper.tex:1049-1058)vs. 机器 `packing_card_bound`(Packing.lean:14)对一般赋范空间表述,`equilateral_lp`(Packing.lean:82)对应"单位向量等边集"一句;10) grid 障碍:论文纸面 60 行 vs. 机器 GridObstruction 20 声明 + Parallelogram 19 声明(`powerDefect_eq_zero_iff`:82 即 `eq:disjointness` 的逐坐标内核)。

## §8 外部文献检索(与论文口径物理分栏)

### 8.1 论文口径(只来自 paper.tex 的 bibliography 与正文引用句)

paper.tex:1287 起的 thebibliography 我实测读到的条目(JL 线在论文里的自我定位):JohnsonLindenstrauss1984(Problem 3 提出其他 Banach 空间的类比,paper.tex:48-52)、Ball1990 "Isometric embedding in $l_p$-spaces"(Eur. J. Combin. 11(4):305-311,论文引其 $\binom n2$ 上界与 $1\le p<2$ 的二次阶最优,paper.tex:112-113)、Lamperti1958(Corollary 2.1, $p$-平行四边形缺陷判据,paper.tex:117-119)、Bourgain1985(有限度量入 Hilbert 的 distortion 随 $n$ 增长,paper.tex:131-133)、BourgainLindenstraussMilman1989 "Approximation of zonoids by zonotopes"(Acta Math. 162:73-141)、Talagrand1995、Schechtman1987/2011($p<2$ 有限集估计从 $O_D(n\log n)$ 到 $O_{p,D}(n)$,paper.tex:122-124)、BrinkmanCharikar2005 与 LeeNaor2004($p=1$ 端点非线性障碍,paper.tex:139-141)、LeeMendelNaor2005(线性映射需线性维数,paper.tex:135-138)、NaorRen2026Threshold($p>2$ 排除 $O_{p,D}(\log n)$,下界 $(\log n/(\log\log n)^2)^{p/2}$,paper.tex:142-149)、Indyk06($p$-stable 投影先例,paper.tex:195-197)、GGNS 与 SRS18(电流定位,论文自述 GGNS 改进 SRS 预印本版的 $O(\log^2 n)$,paper.tex:183-188)、Pisier1981 与 Eskenazis2024(Maurey 经验方法,paper.tex:171-177)、Rosenthal70 与 Pinelis15(矩比较谱系,paper.tex:201-204)、Hoeffding1963(论文自称只取弱于经典的常数,paper.tex:347-350)、Rockafellar1970、Durrett2019、Hatcher2002(Corollary 2.15 即 Brouwer 不动点)、Naor2018(综述,coordinate target 与 arbitrary subspace 的区分,paper.tex:58-60)、OpenAI2026DoublingHilbert(同作者独立构造,论文自陈非本篇输入,paper.tex:151-158)。这些条目的存在性以论文引注为唯一凭据,属于论文口径,下面的检索面与之分栏。

### 8.2 我方独立检索(实测记录,强度如实)

我做了 4 次 WebSearch(检索词:GGNS 电流定位、JL 与 $L_p$ 降维史、arXiv 定向词组)与 2 次 WebFetch(其一按记忆猜 arXiv 编号 1805.04100,取回的是 Steimle 的 cobordism 论文,与本题无关;其二 arXiv 分类列表页,404)。检索环境返回的几乎全是聚合站与课程讲义页,一手文献页面均未能抓取。按规格,凡一手来源未能独立验证的条目一律标 `[推测]`,含义是:仅凭我方先验与论文引注互证,本轮未爬得原文。

- Johnson--Lindenstrauss(1984)的存在与 $O(\log n)$ 陈述:二手可证,强度 `[中等]`。检索命中的 Wikipedia "Dimensionality reduction" 条目与 scikit-learn Random Projection 文档页(实测抓到)均转述 JL;原始 Lemma 1 的精确形态只与 paper.tex:48-50 口径一致,标 `[推测]`。
- Bourgain(1985)任意有限度量入 Hilbert 的 distortion 界:经典结果在我的检索面未命中原文 `[推测]`;论文 paper.tex:131-133 的转述("distortion growing with $n$")与先验相容。
- Bourgain--Lindenstrauss--Milman(1989) zonoid 逼近与 Talagrand(1995):原文未爬得 `[推测]`;论文用法(子空间离散化、线性映射、参数是子空间维数)与我方背景一致。
- Schechtman(1987, 2011)$p<2$ 有限集 $O_{p,D}(n)$ 坐标:一手未证 `[推测]`;与本篇关系:线性于 $n$,远逊 $n^{o(1)}$,论文口径可信。
- Naor--Schechtman 一系的 $L_p$ 降维线(任务点名要查的 Indelicato--Pinches--Mendelson 与 Naor--Schechtman):本轮检索命中页均不涉此文,我对其具体定理形态的记忆不足以复述,诚实记录为未获取 `[推测]`;复跑时应以 ZblMATH/DOI 直爬替换该栏。
- Indyk(2006)$p$-stable 随机投影:一手未证 `[推测]`;论文引用它作为 stable projections 与截断重尾矩的几何先例(paper.tex:195-197),与 p-stable LSH 文献的先验一致。
- Gurel-Gurevich--Nachmias--Sachdeva 电流定位($\||Q|\|_{2\to2}\le2\log n$)与 Schild--Rao--Srivastava 的 $O(\log^2 n)$:检索完全未命中一手 `[推测]`;论文附录 A 自带完整重证(paper.tex:1132-1227),本条数学信心不依赖外部验证,属外部不可达而内部自足的样本。
- Ball(1990):一手未证 `[推测]`;论文自复证上界(paper.tex:218-259);Ball 的最优性口径只在 $1\le p<2$,而 §5.11 的 grid 障碍覆盖全部 $p\ne2$(paper.tex:118-119 特别说明含偶整数 $p>2$),两口径并存不冲突。
- Lamperti(1958):一手未证 `[推测]`;仅作 `eq:disjointness` 的编号出处。
- Lee--Mendel--Naor(2005)线性障碍、Brinkman--Charikar(2005)/Lee--Naor(2004) $p=1$ 障碍:一手未证 `[推测]`。
- Naor--Ren(2026)下界:2026 新文,检索面失明 `[推测]`;我能核对的只有论文引用位置(Section 1.1, equation (2))与"两侧均不主张最优"的谨慎口径(paper.tex:147-149)。
- Eskenazis(2024):一手未证 `[推测]`;论文 paper.tex:173-177 明确区分其加性误差控制与本篇加权相对控制。
- $o(1)$ 型结果的历史定位:在我的公开检索面上,固定 distortion、$1<p<\infty$、$p\ne2$、非线性嵌入、$d=n^{o(1)}$ 的组合此前无可指认的已知定理 `[推测]`;论文叙事(JL Problem 3 之定性解决、Naor2018 综述铺垫)与之相容。检索强度总评:本轮网络面为低可信二手环境,凡 `[推测]` 栏都应在复跑时以 DOI 直爬替换;`[中等]` 两条即 Wikipedia Dimensionality reduction 与 scikit-learn 8.6 Random Projection 页。

### 8.3 检索失败面的教训

两条可复用教训。其一,搜索引擎对 2026 年新预印本(Naor--Ren、OpenAI 系列)与冷门 Banach 几何专文基本失明,可靠面只剩论文本体引注 + DOI 直爬,后者本轮未做(命中页多为中文聚合镜像)。其二,GGNS 与 SRS 的一手存在性之争对本文证据链无关宏旨:论文把证明搬进附录 A 自带全链,Lean 侧 Heat/Entropy/Spectral/Electrical 四组约 93 个声明把它整体机器化,外部文献在这条线上只剩命名学功能。这与路线 B 的失败教训同型:参数正确性高于来源正确性。

