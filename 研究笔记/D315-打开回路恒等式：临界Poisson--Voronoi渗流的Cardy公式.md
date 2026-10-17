# D315 打开回路恒等式：临界 Poisson--Voronoi 渗流的 annealed Cardy 公式

研究笔记 · 主线2（非 Lean 队列）· 派单编号 D315 · 角色：正在做这项研究的我

## §0 登记与取材范围

本笔记对应派单 D315，row=139，bytes=276257，thin=no。素材目录与行号登记如下，两条逐字照抄 wave.txt 给定的字段：

preprints/Cardys-formula-for-critical-Poisson-Voronoi-percolation-September-23-2026

其他队列第 139 行号

论文标题是 Cardy's formula for critical Poisson--Voronoi percolation（paper.tex:50），署名 OpenAI，日期 September 23, 2026（paper.tex:51-52）。摘要只有一句话：在有界 Jordan 四边形里证明 annealed 交叉概率的 Cardy 公式，从而证明该模型 conformal invariance 猜想的交叉概率形式（paper.tex:55-60）。我的笔记就以这句话为靶心：把"证什么"和"到底靠什么证出来"两层拆开，按我做研究时的真实顺序记下来。

取材说明。build 下共 11 个 .tex，总字节 276,257：paper.tex 2,640、00-introduction.tex 18,379、01-fields.tex 22,544、02-probability.tex 29,304、03-plugs.tex 37,151、04-affine.tex 33,399、05-pins.tex 33,821、06-actual-arcs.tex 46,079、07-nondegeneracy.tex 12,829、08-observable.tex 38,494、math-glyph-unicode.tex 1,617。属厚档，我按规格只取主干：paper.tex 与 00-introduction.tex 全文；01 至 08 各节的定理陈述区与证明骨架开头；06、08 的行数用 wc -l 量得（911、770 行），08 的末尾 95 行（676-770）直接读过。用模式检索定位了各节主定理的行号与题头文字（01:137、01:402、03:9、03:502、04:385、05:534、06:254、07:12、08:172、08:318、08:587），这些行的引用内容我逐字见过。其余未读区段（01 的 143-401、02 的 100 行以后、03 的 91-501 与 508 以后、04 的 91-384、05 的 81-533、06 的 61-911、07 全节正文、08 的 81-675）里的一切判断，我在 §13 集中标 [推测] 并说明为什么不足。typst/ 分片按规格不算来源；README.md 只当索引；paper.pdf 一律未碰。

本节把"我"的研究过程重建出来。凡是论文文本直接支撑的，我给出行号；凡是我根据技术选择反推的动机与失败体验，我标注它是反推，并且尽量挂在具体条文上。这一节的最后 5,000 字符之内不会出现任何超出上面两条登记的登记信息，两条登记就是本节的全部户口。

## §1 初始动机与猜想

我要做的事，起点在引言第 6-8 行就能读到：Cardy 在 1992 年用共形场论预言临界二维渗流的交叉概率由标记区域的共形参数决定；Smirnov 在三角格点上把它证了出来；Schramm 的问题 2.12 问的是 Voronoi 渗流对应的 conformal invariance 定理（00-introduction.tex:3-8）。我选的目标是 annealed 交叉概率这一支：先对泊松几何平均，再对颜色平均，极限落在 $F(x)$ 上。引言说得很克制，"with no regularity assumption on the boundary beyond the Jordan property"（00-introduction.tex:9-10），边界只要求 Jordan。这句话是我全部难度的来源：三角格点上 Smirnov 的证明吃的是等边三角形的对称性，而我这里连底图都是随机的，三角形只是仿射像，边界还可能是处处不可求导的 Jordan 曲线。

模型的写法我照抄引言（00-introduction.tex:14-26）：把定向平面等同 $\mathbb C$，取强度 $\varepsilon^{-2}$ 的齐次泊松点过程 $\eta=X_\varepsilon$，每个站点 $v$ 的 Voronoi 胞元 $\mathcal V_v=\{z:\lvert z-v\rvert\le\lvert z-u\rvert\ \text{for every }u\in\eta\}$ 是闭集；颜色与点独立，各以 $1/2$ 概率黑白；$\mathcal B_\varepsilon$ 是黑胞元并。交叉事件 $\mathcal C_\varepsilon(D;a,b,c,d)$ 定义为 $\mathcal B_\varepsilon\cap\overline D$ 里存在一个连通子集同时碰到弧 $ab$ 与弧 $cd$（00-introduction.tex:30-32）。注意我用的交叉是"闭胞元并中的连通集"，这是全平面 annealed 律下的事件；$\mathbb P^{\eta}$ 表示给定几何的条件颜色律，$\mathbb E_{\mathrm{sp}}$ 表示固定图上独立公平颜色的平均（00-introduction.tex:22-26）。主定理就是

$$\lim_{\varepsilon\downarrow0}\mathbb P\bigl(\mathcal C_\varepsilon(D;a,b,c,d)\bigr)=F(x):=\frac{\int_0^x[u(1-u)]^{-2/3}\,\mathrm d u}{\int_0^1[u(1-u)]^{-2/3}\,\mathrm d u}=\frac{\Gamma(2/3)x^{1/3}}{\Gamma(1/3)\Gamma(4/3)}\,{}_2F_1\!\left(\tfrac13,\tfrac23;\tfrac43;x\right),\qquad(00\text{-}00-introduction.tex:41\text{-}49)$$

其中 $x$ 是把 $a,c,d$ 映到 $0,1,\infty$ 的 Riemann 映射在 $b$ 处的 Carathéodory 边界值（00-introduction.tex:32-36）。

我最初对这件事的猜想其实很朴素：把 Smirnov 的色切换恒等式原样搬到 Delaunay 三角化上，然后走 Compactness + 边界唯一性的老路。引言 106-108 行替我把这个想法的死因写得很体面："The challenge is to obtain an analytic relation that survives the irregular embedding."搬到随机仿射几何里，恒等式会在每一块三角形上沾上形变误差，误差能不能在宏观尺度上消掉，完全是另一件事。Beffara 在周期三角化细分的工作里把色切换恒等式和嵌入的几何缺陷分离开来（00-introduction.tex:108-113），他处理的极限与三角格一致、只差一个由初始嵌入决定的实线性变换；我的几何是 Poisson--Delaunay，没有周期结构可依。于是我给自己定的第一问题是：先找一个在任何三角化上都精确成立的代数对象，再看它在随机几何里剩什么。

还有一个我必须从一开始就摆明的边界：本定理只管交叉概率的极限，不断言界面律收敛，也不断言任意 Jordan 区域的 quenched 极限（00-introduction.tex:52-57）。矩形上有前人给出的条件方差集中，配合 annealed 极限可以推出 quenched $L^2$ 收敛（00-introduction.tex:62-64 与 200-252），我会把这条推论的证明骨架单独核对，见 §12。

## §2 我试过（并且必须放弃）的几条路线

这一节是反推的路线史。我把每条路线挂回论文里能找到的条文证据：凡论文文本直接说明该路线不可行的地方，我给行号；凡是我从最终构造反推出"当初为什么先想到这条、又卡在哪"的地方，我明说这是反推。它们对应引言 118-178 行逐步交代的真实构造顺序。

路线甲：在 Delaunay 图上直接定义离散全纯观测量。反推动机：Smirnov 范式的第一反应，逢随机平面图先造离散调和函数。死因有据：每个三角形只是参考等边三角形的保向实仿射像，仿射把复线性部分与反线性部分混在一起；引言 133-141 行正是这么处理的：对每条边分解出两项，复线性项加权重和记作 $U_P(f)$，反线性项记作 $Q_P(f)$，"Thus $Q$ records the departure from equilateral geometry"（00-introduction.tex:140-141）。也就是说，直接全纯化得到的对象满足的方程里含一个由几何缺陷 $Q$ 驱动的非齐次项，而 $Q$ 在一般 Poisson--Delaunay 几何里逐边都不消失。这条路走不通的点，在于我没法先把 $Q$ 控制成 $o(1)$：它本身就是我要打开的对象。

路线乙：只用闭合回路上的精确恒等式加平移性，直接推出宏观弧上的近似关系。这条路线我起初很舍不得，因为它免费：闭合恒等式是精确的，平移性又是泊松律送的。论文给了两条明确的墙。第一，闭合求和只控制整条闭 rim：稳态让 $Q$ 的宏观闭合和变小（00-introduction.tex:144-146，"Stationarity makes the corresponding macroscopic closed-rim sums of $Q$ small. The main task is to open that identity"），而我需要的是对穿过测试函数支撑集的开放子弧成立 $\max_P\lvert Q_P(f)-aV_P(f)\rvert\to0$；03-plugs.tex 开头第 3-5 行逐字承认："The closed estimate \eqref{fields:closed} does not directly control a proper subarc of a rim."。第二，把闭合恒等式"打开"到子弧需要端点条件化，而条件化在 annealed 测度下会把一个随构型变化的正概率除到任意小；03-plugs.tex 的 limit-order 约定（第 30-39 行）为此专门写明：允许有限模式的正条件概率任意小，但凡是声称 $Ch$ 量级的一致界，只用固定的有限归一化短模板获得。换言之，我不能在证明里对构型相关的拟合概率做除法。

路线丙：对每条 rim 的子弧，用路径长度来控制场量的和。死因写在引言 174-177 行，且是原话级别的警告："the fields are signed, so a small change in their coefficients is not controlled by a path-length estimate."我的 $U,Q,V$ 都是带符号（带复相位）的边和，长弧上大量近 cancels 之后，剩下的量对系数扰动极其敏感；路径长度只约束绝对值和，约束不了带符号和。要补上这块，引言给的是三件工具：确定性空间细化、近返回界、以及 §3 的正交恒等式（00-introduction.tex:176-178）。我后来在 06-actual-arcs.tex 开头（第 5-6 行）确认了这个分工："The second step requires a separate control of signed sums and completes bulk transport."

路线丁：条件于弧的邻域构型，拟合一个局部模型再归一化。反推动机： quenched 工具箱（Ahlberg--Griffiths--Morris--Tassion 与 Vanneuville）看起来足够，为什么不条件化着用？死因其一在 02-probability.tex:61-64，论文对手推自引用式地划了适用范围："These assertions do not give crossing lower bounds for arbitrary conditioned point processes."我条件化之后的点过程恰恰属于"任意的"那一类。死因其二在 00-introduction.tex:167-173：局部几何与颜色已经选定了这条弧，比较必须保留这份条件化；论文给出的替代方案是"unnormalized subprobabilities dominated by the original law; there is no division by a configuration-dependent fitting probability"，我在 06-actual-arcs.tex:40-49 读到实现它的引理：一个被 $\nu$ 控制的次概率 $\lambda\le C\nu$ 经过强制核 $K$ 之后仍被 $(C/q)\nu$ 控制，全程不除任何小概率。这条路线的放弃换来的是 §8 的受控比较装置。

路线戊：把 $a$ 先算出来再说。反推动机：既然极限关系形如 $Q_P\approx aV_P$，最好先确认 $a$ 的身份。死因是有比它更便宜的事：引言 186-188 行明说 "The scalar $a$ need not be identified: once $1-a\ne0$, it disappears from the limiting Cauchy--Riemann equation."我要的只是 $1-2\operatorname{Re}a>0$（从而 $1-a\neq0$），这是 §9 一整节（07-nondegeneracy.tex）唯一的目标。识别 $a$ 的要求被我降级为排除退化，成本从"精确计算"降到"一个严格不等式"。

这些弯路有一个共同形状：每条路线都在拿"精确的离散世界"换"近似的连续世界"时付了双倍价钱。我真正的转机出现在把价钱付对地方之后：精确性全部留在有限恒等式里（§3），近似性全部集中在一个待定标量 $a$ 上（§5 到 §9）。

[探针行] 落盘协议第 0 步的单行追加，用于复量字节。

## §3 精确层：回路组件与正交场

先把随机几何全部扔掉，看 01 节的世界。取定向球面上一个有限简单三角化 $T$，顶点携带独立公平颜色；对偶图 $\Gamma$ 是穿过每个三角形内部的三价图；一条对偶边，当它穿过的原边两端颜色不同时称为被占用。每个对偶顶点处被占用的边数或者为 0 或者为 2，于是占用子图是若干条两两无公共顶点的简单回路的并（01-fields.tex:12-17）。这套画面初看平淡，但在这里发生了一件我此后反复回头的支撑：占用子图的律恰好是 $\Gamma$ 的全部偶子图上的均匀分布。论证是个双计数（01-fields.tex:19-26）：在原边上规定自旋翻转的位置；从某个顶点出发可以回收全部自旋，当且仅当每条原环上翻转数为偶；球面上面边界已经生成整个圈空间，所以只需检查三角形面，而这正是对偶侧的偶度条件。每个容许规定恰好对应两个着色（整体互换颜色）。"顶点上的公平颜色"与"偶子图上的均匀分布"从此是同一个律，代价只是两行双计数，收益是对相关函数做组合手术的权利：概率变成计数，我可以用"沿一条路径 toggle"这样的操作去搬动它。

第二件本钱：恒等式的坐标取为配对 $\lambda=(L,C)$，回路的几何侧只携带一半信息。对每条占用回路 $L$，把它的全部点连同顶点删干净，取剩余拓扑图 $\Gamma\setminus L$ 的每个连通分量 $C$；两个端点都被删掉的未占用边可以单独构成一个分量（01-fields.tex:28-32）。在配对上定义 $H_\lambda(m)=\mathbf 1_{\{m\in C\}}$，$m$ 取对偶边内部点；记 $H(m)=(H_\lambda(m))_\lambda$，$K(m,n)=\langle H(m),H(n)\rangle$，内积为 $\mathbb E_{\mathrm{sp}}\sum_\lambda F_\lambda\overline{G_\lambda}$，$\mathbb E_{\mathrm{sp}}$ 固定三角化只对颜色平均，索引集在每个构型内部单独取（01-fields.tex:34-46）。四面体对偶 $K_4$ 的插图把删除约定画得很硬：粗红回路 $L$ 与它的空心顶点只是参考，实际已被删掉；左图剩下一个含对偶顶点的分量，右图剩下两个孤立的开放边分量（01-fields.tex:48-94）。引言用声明级语气重申了这件事：保留包含孤立开放边在内的完整组件标签，是 Section fields 那条精确正交恒等式成立的唯一前提（00-introduction.tex:128-131）。我如果按 $L$ 的几何侧打标，或者按"边被占用"打标，拿到的只会是个启发式；$(L,C)$ 配对把启发式变成等式。

然后是给协方差命名的引理，Two defects（01-fields.tex:96-101）：对两个不同的边内部点 $m,n$，把对偶边在这两点细分，取在 $m,n$ 处奇度、其余顶点偶度、且均匀的那些子图；$K(m,n)$ 恰好等于该双缺陷系综中回路的期望条数，同一边上的两点也适用。证明骨架（01-fields.tex:104-120）我读了两遍才跟住：连通有限图上，边界为给定偶集 $D$ 的子图族，若非空，是圈空间的一个仿射平移；沿连接两个规定缺陷的一条路径做 toggle 就给出这种平移。特别地，偶系综与双缺陷系综的基数相同，细分一条边不改变基数。双缺陷系综内部结构清楚：普通顶点占用度为 0 或 2，两个标记顶点占用度为 1，所以恰有一条简单缺陷路径加若干条互不相交的回路。固定候选回路 $L$：一旦 $L$ 被占用，$L$ 的每个顶点处三条边中必有一条不占用，缺陷路径因此只能待在 $\Gamma\setminus L$ 里；$L$ 能在缺陷系综中出现，当且仅当 $m,n$ 落在删去 $L$ 后的同一分量中；若落在一起，取该分量内一条固定路径 toggle，就在"含 $L$ 的偶子图"与"含 $L$ 的双缺陷子图"之间建立双射。协方差 $K(m,n)$ 由此翻译成"给定两个打洞点同属一个删剩分量时存活回数的期望"，正交恒等式里每个因子都有这种组合含义。之后我带权重进场时，可以指望的只有符号相消，没有不等式估计。

回到全平面。有限恒等式与几何的接口在引言 133-144 行：每个三角形是参考等边三角形在一个保向实仿射映射下的像；该映射的复线性部分与反线性部分把每条顺时针边向量拆成两项；对光滑测试函数 $f$，取 $P$ 右侧紧邻三角形中属于 $P$ 的那条边的贡献，按三角形质心处的 $f$ 加权；线性项的总和记 $U_P(f)$，反线性项的总和记 $Q_P(f)$，$V_P(f)=U_P(f)+Q_P(f)$ 是加权切向位移。$Q$ 记录了对等边几何的全部偏离（00-introduction.tex:133-141）。每条闭 rim 满足 $V_P(1)=0$：切向总量精确归零，这是多边形闭合的直接推论。正交性则给每个 Fourier 场一份独立的二阶矩恒等式，求和跑遍包括孤立开放边在内的全部组件标签（00-introduction.tex:141-144）。我在 01-fields.tex:137-142 用模式检索定位到 Finite orthogonality 的题头：对不同三角形 $t,u$，$\langle Z_t,Z_u\rangle=0$，$\lVert Z_t\rVert^2=3/4$。每个三角形挂一个由它相邻的三条对偶边内部的 $H$ 坐标拼出的量 $Z_t$，正交并且范数平方恰为 $3/4$。构造与证明在 01:143-401 的未读区间；[推测] 手法应当就是双缺陷 toggle：$t\ne u$ 时两者共享的坐标至多经由一条对偶边，三角形内部颜色翻转的对称性掐灭交叉项，$3/4$ 这个数只能来自归一化约定。我不把没读到的推导写成已得。

01 节的收口我在检索里看到题头：Closed-sum tail（01-fields.tex:402-407），对固定有界盒 $B$ 与每个 $a>0$，全平面间距 $\varepsilon$ 模型有 $\lim_{\varepsilon\downarrow0}\mathbb E\sum_{P\text{ a rim},\ P\subset B,\ \operatorname{diam}(P)\ge a}(\ast_P)\to0$ 形状的结论，求和项的具体形状被我的检索窗口截断；[推测] 依引言 144-146 行的复述（稳态让 $Q$ 的宏观闭 rim 和变小），$(\ast_P)$ 大概率是 $Q_P$ 的全变差或其平方，证明工具是个场各自的二阶矩恒等式加平移性。我只记行号与这个方向，不抄我没见到的式子。

## §4 已知概率输入：我能合法调用什么、不能贪什么

02 节把"别人的定理"集中登记一次，我读它的方式是先问每条估计之后会在我哪里被消耗。记号：$1\le r\le R$，$A_j(r,R)$ 是方形环 $[-R,R]^2\setminus(-r,r)^2$ 上的 $j$ 臂事件；$j$ 为偶时臂色循环交替，$j$ 为奇且大于 1 时是 $j-1$ 条交替臂加一条黑臂，且黑臂的胞元不碰其他臂；$A_1$ 是一条黑臂的存在；各臂的路径可以取成占用站点集两两不交（02-probability.tex:11-21）。写 $\alpha_j(r,R)=\mathbb P(A_j)$，$p_j^\eta(r,R)=\mathbb P^{\eta}(A_j)$。

Established input 命题（02-probability.tex:23-49）三条。其一，固定长宽比的矩形上两种颜色都有正的下界交叉概率，对尺寸一致；对固定缓冲矩形链的有限族，淬火下界在例外几何事件之外成立，例外概率 $O_\gamma(R^{-\gamma})$，任意多项式衰减。其二，对每个固定 $j\ge1$ 有 $\mathbb E[p_j^\eta(r,R)^2]\le C_j\alpha_j(r,R)^2$（02:37-40），条件概率的二阶矩被 annealed 概率平方控制。其三，幂律 $\alpha_1\le C(r/R)^{c_1}$、$\alpha_5\le C(r/R)^2$、$\alpha_4\le C(r/R)^{1+c_4}$（02:43-46）。出处在 02:51-60 逐条挂账：箱体交叉下界归 Tassion，淬火版本归 Ahlberg--Griffiths--Morris--Tassion，annealed 标度关系、拟乘法与五臂出自 Vanneuville 2019，全平面估计用 Vanneuville 2025 的定理 1.2 到 1.4，例外几何的任意多项式估计是其命题 3.14 加有限粘连；三个幂分别对应其 (3.1)、命题 3.4(iii) 与命题 6.2。

我在读完出处清单后特意停了一下，因为 02:61-64 有一句范围警告：应用命题 3.14 时只用固定相对网格间距与固定有限缓冲形状表，最小尺寸条件靠放缩满足；这些断言对任意条件化点过程不给出交叉下界。这句话直接封死了我路线丁里"条件化后接着用现成淬火估计"的贪念。之后整个证明对"条件化"三个字都保持警戒，06 节的受控强制核（见 §8）就是这种警戒的产物。

第二条工具是 Reimer 型不等式在固定几何下的初等化（02-probability.tex:66-98）。在有限公平比特乘积空间里，$A\mathbin\square B$ 表示存在互相分离的坐标集分别见证 $A$ 与 $B$，结论 $\mathbb P(A\mathbin\square B)\le\mathbb P(A)\mathbb P(B)$。证明是切片：Reimer 的公平比特不等式写作 $\lvert A\mathbin\square B\rvert\le\lvert A\cap\overline B\rvert$，$\overline B$ 是逐位取补的像；对构型对 $(x,y)$ 按二者相同的坐标集 $K$ 与公共值切片，切片外两位互补，$x$ 的分离见证限制到切片上同时见证两个受限事件，Reimer 在切片内给出计数界，求和得 $2^n\lvert A\mathbin\square B\rvert\le\lvert A\rvert\,\lvert B\rvert$（02:91-94）。有界区域几乎必然只碰有限多个 Voronoi 胞元，所以条件于几何的有界渗流检验确实住在有限比特乘积上。02:100 处我读到的最后一行是"No annealed disjoint-occurrence product bound is asserted"，[推测] 下文应当是解释 annealed 侧由于几何与颜色纠缠不能直接套用逐位对称，后续使用都回到固定几何切片。这条不等式在我手里的消费点很具体：05 节的门试验要在互相分离的环形领圈里做多次独立试验（05-pins.tex:69-73），臂事件两两分离见证，BK 加 Reimer 才能把"多个试验同时成功"压成单试验概率的乘积；$\alpha_4$ 幂严格大于 1 则直接供给那个 $CM^{-1-c}$ 衰减里的 $c$。$\alpha_5\le C(r/R)^2$ 我目前只看到它在近返回控制里出现的位置（00-introduction.tex:176-177 的三件套之一），细节在未读区间，[推测]。

三条幂律里我最在意 $\alpha_4$ 的 $1+c_4$：二臂 $c_1$ 太松，四臂刚好跨过可求和的门槛，五臂给平方。整个 pin 密度论证的预算就是靠这个梯度做的：低阶臂用于供给结构，高阶臂用于压制坏事件，边界情形留给门半径之间的巨大间隙（$10^4$ 倍，见 §7）去吸收。

## §5 打开闭合恒等式：plug 的图纸与 bulk transport 的目标

现在的核心问题有了精确形式：闭合恒等式只跑满整条闭 rim，我需要它对穿过 $\operatorname{supp} f$ 的开放子弧成立，而且是在随机几何上、以概率收敛的方式。03 节把最终目标先亮出来，让我之后每一步都知道在还什么债。

Bulk transport 定理（03-plugs.tex:9-21）：从任何 $\varepsilon\downarrow0$ 序列中可抽取子列与一个只依赖该子列的复数 $a$，满足 $\operatorname{Rea} a<1/2$，并且对每个 bulk patch、每个 $f\in C_c^\infty(B(x,R))$（要求 $\overline B(x,6R)$ 落在 patch 内），有
$$\max_{P:\,P\not\subset B(x,4R)}\lvert Q_P(f)-aV_P(f)\rvert\xrightarrow[\varepsilon\to0]{\mathbb P}0\qquad(03\text{-}03-plugs.tex:14\text{-}17),$$
最大值跑遍一切不整体含于 $B(x,4R)$ 的 rim；局部检验可以在概率趋于 0 的几何例外事件上置零；子列与标量对所有 patch 和测试公共。注意陈述里 $a$ 的出身：它属于子列。全平面几何遍历与否我无权引用，所以先把"每个子列都有一个 $a$"当合同，再在 §9 与 §10 里证明极限函数与子列无关。

随后是全书我最感激的一个约定（03-plugs.tex:30-39）：比较尺度 $h$ 先固定，再做微观极限 $\varepsilon\downarrow0$，此时模式和图案都是固定的有限个；之后才沿一列可数的 $h\downarrow0$。一个固定模式的条件概率允许任意小；凡是声称一致于 $Ch$ 的量，一律改由固定的归一化短模板提供，公共常数只依赖模板族。这个约定把我路线乙里"除以拟合概率"的冲动提前掐灭，也让我在 §8 读受控强制核时明白它为什么必须长成"次概率被原测度控制"的样子。

plug 类型的图纸（03-plugs.tex:48-72）是纯确定性的：两组同心门环 $[a_1,b_1]\subset$ 内侧、$[a_2,b_2]\subset$ 外侧，截断半径 $m$，约束 $10<a_1<b_1<m/10$、$10m<a_2<b_2$；闭 Jordan 盘 $O\subset\operatorname{int}H$，$\overline B(0,b_2)\subset\operatorname{int}O$；一条保向带形图 $\Phi:[-12,12]\times[-3,3]\to\R^2$，落在 $O$ 与 $H$ 内分别等价于 $\lvert u\rvert\le3$ 与 $\lvert u\rvert\le8$，中央截面 $\Phi(\{0\}\times[-3,3])$ 严格在 $B(0,a_1)$ 内；两个窗口 $I_B=[-.3,.3]$、$I_W=[-1.8,-1.4]$ 各带一个正整数 rank。图纸不 impose 任何度量正则性（03:72 末行："No metric regularity of the Jordan disks or chart is imposed."）。我读到这行时停了一会儿：允许任意歪扭的 Jordan 盘与带形图，代价是之后所有比较都通过"贴合检验"进行，收益是 pin 可以在真实 rim 上按实际走向密集落位，几何不许我挑好看的 plug。plug 的状态 $\sigma$ 就是 $O$ 内的着色点数据；网格尺度取 $\rho_{\varepsilon,h}=\sqrt{h\varepsilon}$（03:74-79），一条边称为 retained，若它属于某个外接圆半径不超过 $\rho_{\varepsilon,h}$ 的 Delaunay 三角形；retained 判定只看顶点周围 $2\rho_{\varepsilon,h}$ 的领圈，mesh 引理保证固定局部系统的边几乎必然全部 retained（03:80-86）。$\sqrt{h\varepsilon}$ 这个几何平均很有意思：比 $\varepsilon$ 粗、比 $h$ 细，retained 概念在微观网格与比较尺度之间垫了一层缓冲，让"边存在"这类查询在两个尺度之间对扰动免疫。

03 节的产品是 state cochain 命题（检索定位在 03:502-507）：对每个固定连接器（含其两端真实端图），存在定义在两端状态上的函数 $i_e^\varepsilon(\sigma_s,\sigma_t)$，使 $\widehat m_s+\widehat j_e-i_e^\varepsilon=o_{L^1}(1)$ 一类的分解成立；完整公式的后半截在我未读的行区间里，[推测] 它把沿固定圈的连接器和贡献配成一个小和的 1-上循环。引言 155-165 行给了这段话的概念版本：保留端点附近落在 plug 里的局部着色构型，用分离的双色走廊把 plug 接成闭合实验；环绕回路把路径钉在同一对接触上；右侧不存在第二条单色路径这个条件，迫使内外构型改变时贡献保持一致；对固定连接器做条件重采样，得到两端点状态的函数，其对固定圈的总和很小。闭合与插中间 plug 的比较把这个函数分解成"仿射位移 + 两个局部端点势 + 受控余项"，前半句归 §6。精确层交给我两样东西：计数双射的自由度，和场的正交分解。两者距离 Cardy 公式都很远。§5 才会出现把这些本钱花出去的姿势；在那之前，§4 先划清我能合法引用的已知概率估计的边界。（此过渡段在追加 §4 时被锚点吞掉一次，按落盘协议不得改写前文，故在文档此处逐字重登，勘误见 §14。）

## §6 仿射部分与端点势：准加法如何逼出一个标量

04 节的开场把舞台限定成一个有限归一化菜单（04-affine.tex:8-13）：真实摆放只允许菜单元缩放后在 $h\Z^2$ 上的平移，辅助的平移与旋转副本也许可用；固定 $h$ 后取子列使各类型的准入稳定。只要有任何类型准入，就选定一个参考类型连同它的颜色翻转。我特别欣赏空菜单情形的处理：所有合格端点上的比较都是空谈，索性令 $a_h^V=1$、$a_h^Q$ 取任意有界值，合同自动满足。数学写作里这种"退化分支给个便宜的定值"的约定，让我确认作者把子列对角化的账算得很干净，因为 §8 里 $a_h^V\equiv1$ 会反复出现。

固定 stubs（04-affine.tex:15-33）是纯拓扑接线：每个类型在障碍外固定两条互不相交的 stub，把出发港接到向东的水平带、到达港接到向西的水平带；出口截面落在一个大正方形对边中点，横向坐标 $v$ 向上递增。构造法是在障碍与正方形之间放一个 Jordan 环，按循环序匹配两个附着区间，再画乘积式的延伸；横向次序在东出口沿正边界方向、在西出口逆着它，恰好配好出发港与到达港的需求；然后带形笔直向外延伸。所有后续可能承载图改变的区域内，预先固定 stub 的局部段与正边距；之后扩大出口正方形只用直线延伸。类型连同 stub 一起旋转。这些布置都要满足 chart-stability 引理的局部模板假设。我读这段的感受是：作者在防一件很具体的事故，即"为了比较而重画走廊，把要测的量本身画变了"。stub 的直线延伸段是零成本区域，弯曲只发生在 plug 内部，于是长度才能当作唯一的自由参数。

Affine straight means 命题（04-affine.tex:35-45）：对 $X=Q,V$ 存在标量 $a_h^X$ 对 $h$ 一致有界，使所用可数族里每条固定直线运输满足 $\mathbb E_\mu i_e^\varepsilon=a_h^X(z_t-z_s)+o(1)$；同一标量适用于参考型的平移、共同旋转与颜色翻转；两个场与可数多个 $h$ 可同时选定。

证明骨架（04-affine.tex:47-90）是一条准加法方程。把相同的未旋转参考拷贝用固定 stub 和直线间隙放在一条水平线上，中心间距 $\ell h$，$\ell>D$ 固定充分大；记 $A_\varepsilon^X(\ell)=\mathbb E_\mu i_e^\varepsilon$。经由未使用 stub 的一条远端互补连接器，把长度 $(\ell+r)h$ 的运输与"中间插入一个参考拷贝"得到的两段运输闭合进同一个环：common-closure 引理给 $A_\varepsilon^X(\ell+r)=A_\varepsilon^X(\ell)+A_\varepsilon^X(r)+o(1)$，$\ell,r>D$（04:51-58）。平移与旋转整个实验（连同 root 次序）保持律不变，两个场作为向量一起旋转；若条件平均或门破平约定在摆放处被单独选定，其搬运版本是另一个合法的定义性完备化，门一致性与 state cochain 命题把两种选法比到 $o_{L^1}(1)$ 精度，因此协方差对这个精度就够用；颜色互换同样保律。比值 $A_\varepsilon^X(\ell)/h$ 在 $D+1\le\ell\le\ell\le D+4$ 的上极限里一致有界（这些运输归一化尺寸有界、带一致缓冲的短完备化），更大长度各自有界但不必一致（04:68-73）。之后是可数化：标准路线由网格端点对、有限类型与整数扭转决定，长度集加上正整数取有理张成，得可数加法子群 $\mathcal L$；沿 $\varepsilon$ 对全体 $\ell\in\mathcal L$、$\ell>D$ 提取 $A_\varepsilon^X(\ell)/h$ 的极限，极限函数 $A$ 在两参数都超过 $D$ 时加法；用小 $x$ 与足够大 $u$ 定义 $\widetilde A(x)=A(u+x)-A(u)$，两个候选 $u,v$ 的比较只用 $A(u+x)+A(v)=A(u+v+x)=A(v+x)+A(u)$，与选择无关；固定有理 $u\in(D+1,D+4)$ 内给小 $x$ 公共界，加法性随之给出零处连续（04:74-90）。[推测] 90 行之后的收口是标准流程：可数子群上加法且局部有界推出线性 $x\mapsto cx$，再由旋转协方差把实线性提升为复数乘法，$c$ 即 $a_h^X$；我没读到那段原文，只按命题陈述反推最小必需步骤。

端点势命题（检索定位 04:385-390）把 state cochain 函数拆成三件：对每个准入的出发或到达摆放与类型，存在中心化的状态函数 $\phi_s^{X,+}$、$\phi_t^{X,-}$，满足 $\lVert\phi_s^{X,+}\rVert_{L^2(\mu_s)}\le C_{\rm short}h$ 一类的界。[推测] 完整分解应写成 $i_e^\varepsilon(\sigma_s,\sigma_t)=a_h^X(z_t-z_s)+\phi_s^{X,+}(\sigma_s)+\phi_t^{X,-}(\sigma_t)+\text{余项}$，长连接器的几何只进受控确定余项（04:3-6 的原话级支持："the geometry of a long connector enters only a controlled deterministic remainder"）。我注意 $L^2$ 界恰比 $h$ 同阶：端点势是 $O(h)$ 的局域误差，将来在宏观弧上做 $O(1/h^2)$ 个 pin 的拼接时，平方可和性会替我把它们吃掉；我把这一节读成一句话：把"弧"的统计问题翻译成"一对有限维状态上的函数"的表示论问题，剩下的全是估计。（此句在追加 §6 时被锚点吞掉一次，按协议在下一节开始前逐字重登，勘误见 §14。）

## §7 有限菜单与密集 pin：把 plug 打到真实 rim 上

05 节的任务陈述（05-pins.tex:1-16）：造一个有限归一化菜单，它的每个成员作为局部端点模型沿每条相关宏观 rim 密集出现，任何足够大的子弧都含一个可用端点；这些模型供端点势命题使用。几何常数与 $\beta,\beta'>0$ 与 plug 尺度 $h$ 无关。摆放只许在公共框架下取菜单成员缩放后沿 $h\Z^2$ 的平移，两种颜色都收。极限顺序延续旧合同：先 $\varepsilon\to0$（$h$ 固定）再 $h\to0$。定义 $r_h=h^{1-\kappa}$，$0<\kappa<1$（05:13），$\kappa$ 留到 06 节再选小。子弧直径阈值取 $h$ 的次幂，并非 $h$ 本身，说明作者预期"小于 $r_h$ 的弧段"会真实存在且需要单独处理，[推测] 那是近返回事故最可能咬人的尺度。

Qualified pin 的定义（05-pins.tex:20-53）是全文信息密度最高的一页，我把它按四条件拆开记。数据：rim $P$ 上一点 $p$，网格中心 $z$ 满足 $\lvert p-z\rvert\le h$，一个摆放好的菜单类型和它的 root ranks。(i) 三层环绕门回路，规定环带 $[a_kh,b_kh]$，$k=1,2,3$；前两层就是 plug 自己的门；第三层要求 $a_3>100b_2$，作用是隔离一条有序中央子弧 $\Delta$：$P$ 对 $B(z,a_3h)$ 的所有访问都落在 $\Delta$ 内，且 $\operatorname{diam}\Delta\le2b_3h$。这一条让我想起引言 157-158 行的"Surrounding circuits restrict the path to the same two contacts"：门即围栏，比较时路径换不了端点。(ii) 标称图里 $P$ 的有序遍历沿水平中线从 $u=-8$ 之前走到 $u=8$ 之后，横向误差与纵向回头都小于 $0.1$；$\Delta$ 位于 $\lvert u\rvert<1$，标记点在 $u=0$ 附近；对 $H$ 没有其他访问；贴合检验具有 exact-fit 引理的闭极限性质。(iii) 一个规定的局部制备：用挂在此图、此摆放、此颜色上的辅助种子，只把对面带里现有点从黑改白，点构型不动，贴合好的黑遍历保持不变；内状态 $\sigma'$ 属于集合 $G$，所选类型准入；黑 root 在 $u=-1.7$ 与 $u=1.7$ 附近含实际遍历的顶点，误差小于 $0.05$，并沿实际遍历在 root 窗口内连接；两条黑侧通道同样由实际遍历提供；全部路径 retained。(iv) 对白色单独地，两条普通侧检验概率，条件于 $\sigma'$ 以及真实点几何，各自至少 $\beta$。

(iii) 与 (iv) 里我最感激 (iv) 的措辞："conditional on $\sigma'$ and the actual point geometry"。05:55-59 的按语直接解释了强度：这比 $G$ 里的 annealed 倾向条件更强，为的是在保留真实点几何的同时允许外部白强制；黑侧通道不需要对应的淬火下界，因为它们已经摆在 $P$ 上。这精确呼应我路线丁的教训：条件化之后的世界不能引用现成淬火估计，于是构造把"需要淬火下界的位置"预先改造成"必然成立的位置"（黑侧由 rim 自身供货），只把真正要下界的白侧检验写进定义。数字 $0.1$ 与 $0.05$ 都是安全裕量：横向近乎平、root 靠近窗口中心，留给 Jordan 带形图的歪斜余地由 (ii) 的封闭性条件兜住。

门的参数（05-pins.tex:61-75）值得抄进台账：以 $h$ 为单位，取整数 $n$ 与大常数 $M$，$A_1=30$，$B_i=MA_i$，$A_{i+1}=10^4B_i$，$L=B_n$。每个试验环带内取略缩进的原边界圈，检验"四条分离臂且两色齐备"；检验用分离环形领圈里的 retained 图，局部密度或网格失败记为正例，于是不同试验使用标记泊松过程的互相独立限制。mixed-four 引理给每条试验的极限概率界 $CM^{-1-c}$。$10^4$ 这个级差我读成"防火墙预算"：环与环之间留四个数量级，领圈独立性与边界效应就都用间隙吸收；$M^{-1-c}$ 里的 $c$ 来自 §4 的四臂幂 $1+c_4$。05:77-80 还有一条几何观察：rim 若在中心距 1 内有一点且延伸出试验范围之外，它除自身颜色的臂外还自动供一条对向臂，因为标记点与试验之外的对面邻点同属一个对向簇（rim 引理）。免费的对向臂，这正是"在真实 rim 上做试验"相对"在人工回路上做试验"的红利。

密度命题（检索定位 05:534-539）：存在有限归一化菜单与固定 $\beta,\beta'>0$，使每个 $\overline B(x,6R)$ 可用的 bulk patch 里，在 $\varepsilon\to0$ 再 $h\to0$ 的有序极限下概率趋于 1，$\overline B(x,2R)$ 内任何延伸到 $B(x,4R)$ 之外的 rim 上、直径至少 $r_h$ 的子弧都含合格 pin（命题后半句在我未读的行里，[推测] 收口是 pin 的两条通道与门回路的相容性陈述，供 06 节逐段拼接用）。这正是 §7 密集落 pin 前必须先有本节的原因，引言 164-166 行也这么自证："Sections plugs and affine construct this endpoint transport before it is used on a random arc."（此句在追加 §7 时被锚点吞掉一次，按协议在本节开始前逐字重登，勘误见 §14。）

## §8 回到真实弧：受控强制与带符号和

06 节开头把任务切成两步（06-actual-arcs.tex:1-6）：先把固定连接器的规则转移到原随机构型里的弧上，并保留分配好的制备端点状态；再从弧贡献过渡到光滑权重。第二步需要独立的带符号和控制，bulk transport 在那里收口。我读这一节的姿态因此始终带着两个问题：每一步比较动了哪些坐标、符号和靠什么相消。

对角化在 06:8-16 一次付清：固定一列 $h\downarrow0$，从任意微观序列出发，把 §6 的子列选择对这些 $h$ 同时做完；菜单的网格平移、代表元、整数缠绕类都是可数表，每个 $h$ 下准入可稳定（类型只有有限个）；此后所有微观极限都走这一条子列。$a_h^Q$ 对 $h$ 一致有界、$a_h^V=1$ 被点名重申。每个 qualified pin 都带着指定的贴合检验、类型、rank 与 §7 分配的制备状态进场，"No comparison below changes that assigned state"（06:21）：比较全程不动端点状态，这是 §7 定义里 (iii)(iv) 两条能反复复用的前提。

弧上的场量记号（06:23-36）有个不起眼但我认为关键的约定。有序两 pin $s,t$，记 $D_s=B_s=\overline B(z_s,m_sh)$ 为摆放好的截断球，定义
$$I_X(P;s,t)=X_P(\mathbf 1_{D_s})+\sum_{\substack{e\ \text{on the forward arc }p_s\to p_t\\ \text{right tag of }e\notin D_s\cup D_t}}X_P(e),\qquad X\in\{Q,V\},\qquad(06\text{:}27\text{-}31)$$
第一项是整个起点截断质量，包含 $p_s$ 之前的部分。06:34-36 的按语：这一约定让拼接精确。我核对过逻辑：若首段取"从 $p_s$ 起"，两弧拼接时在交界球内会出现"前弧取剩、后弧跳过"的两套口径；整球入首段后，$(s,m)+(m,t)$ 与 $(s,t)$ 的差别只剩中间球的分配方式，而球的质量是 $O(h)$ 级局部量（§6 端点势的同阶界），拼接误差可算。把记账约定写进定义，并非写在引理里，是这类长证明能自洽的朴素诀窍。

带条件的比较靠一条测度论引理撑腰（06:40-59，dominated forcing kernel）。设定：$\nu$ 是构型概率测度，$Z$ 为 retained 数据，$\nu_z$ 为其正则条件律；$H$ 是 retained 数据的可测集，$p(z)=\nu_z(W)\ge q>0$ 在 $H$ 上成立；核 $K$ 固定 $Z$ 且满足 $\nu_zK_z=\nu_z(\cdot\mid W)$。结论：若次概率 $\lambda\le C\nu$ 且支撑在 $H$ 上方，则 $\lambda K\le(C/q)\nu$（06:49）。我在黑板上验算过这条：$\lambda K$ 对测试 $g$ 的作用写成 $\int\!\nu_zK[g]\,\lambda(\mathrm d z)$，被积函数不超过 $(C/q)\,\nu_z[g]$（因 $\lambda\le C\nu$ 且 $K$ 相对条件化除 $\nu_z(W)\ge q$），积分回 $\nu$。全程没除过任何构型相关的拟合概率，只除了先验给的下界 $q$，而 $q$ 就是 §7 定义里 (iv) 的 $\beta$：白侧检验概率至少 $\beta$，条件于真实点几何，这条定义级下界终于在这里兑现。单调增强版本（06:51-59）更贴构造：若条件于 $Z=z$ 时剩余坐标是有限 $Z$ 可测外部站点集 $I(z)$ 上的乘积自旋律 $\pi_z$ 与补充数据 $\tau_z$ 的张量积，$W$ 只依赖 $Z$ 与 $I(Z)$ 上自旋且对这些自旋白单调，则 $K$ 可以选成只把 $I(Z)$ 里现成黑站改白、固定 $Z$ 与一切补充坐标，这正是 §7 (iii) 制备"只改色不动点"的抽象原型。

Transport on a real arc 命题（检索定位 06:254-259）：对 $X=Q,V$ 同时、对每条含于 $\overline B(x,2R)$ 的 qualified 有序弧 $s\to t$（要求 $\lvert z_s-z_t\rvert\ge R/3$ 且互补 rim 伸出 $B(x,4R)$ 之外），不等式 (actual:arc) 成立；命题主体的式子在我未读的行区间，[推测] 其形状为 $\lvert I_Q(P;s,t)-a_h^Q(\cdots)\rvert$ 与 $\lvert I_V(P;s,t)-a_h^V(\cdots)\rvert$ 在概率上小于 $R$ 乘某模板小量，因为 §6 的仿射均值恰好作用在 $z_t-z_s$ 上，且阈值 $R/3$ 与定理里 $B(x,4R)$ 的开口条件匹配。拼接部分 [推测] 用直径阈值 $r_h$ 把长弧切成 §7 的 pin 段，每段调用 §6 的连接器规则，段间误差由截断球约定吸收。

从弧回到光滑权重，就是引言 174-178 行预告的带符号和战争："the fields are signed, so a small change in their coefficients is not controlled by a path-length estimate. Deterministic spatial refinement, a near-return bound, and the orthogonality identity supply that control."三件武器的分工我按已读文本能给的就位证明：确定性空间细化对应 $h$ 网格上摆放的微调，把系数扰动转成 pin 重选，重选代价由有限菜单的稠密性（§7）支付；近返回界 [推测] 来自 §4 的臂幂（五臂平方界是标准近返回成本），排除弧在自己邻域里打转造成的重复计数；正交恒等式（§3）把剩余带符号二阶矩拆成逐三角形 $\lVert Z_t\rVert^2=3/4$ 的和，长度只进入非负计数，这才让"路径长"第一次能为"符号和"作证。有限菜单加密集性，就是我路线乙里"对开放子弧做比较"的载体：任何宏观子弧都能切成 $O(\operatorname{diam}/r_h)$ 个带 pin 的段。（此句在追加 §8 时被锚点吞掉一次，按协议在本节开始前逐字重登，勘误见 §14。）

## §9 非退化：1-2Re a 严格为正

07 节全文 281 行，我只从检索里拿到命题题头（07-nondegeneracy.tex:12-17）：Nondegeneracy，每个从前述运输构造中得到的标量 $a$ 都满足 $1-2\operatorname{Rea}a>0$。别正文我一节未读，下面把"为什么这一句话值得单开一节"按已读文本推理，证明内部一律标 [推测]。

先把 $a$ 的三重身份对齐。§5 的 bulk transport 定理已经在结论里附带了 $\operatorname{Rea}a<1/2$（03-plugs.tex:12），而 $1-2\operatorname{Re}a>0$ 与之是同一不等式的移项；07 节的命题陈述说"每个从构造得到的标量"，说明它承担的是把 §5 陈述里的这个约束从"抽取子列时的宣称"落实为"构造对象确实满足的性质"。阅读顺序声明（00-introduction.tex:318-321）支持这一解读：§7 excludes its degenerate scalar，然后 §8 constructs the holomorphic limit。为什么顺序不能倒？引言 186-188 行给了答案的形状："The scalar $a$ need not be identified: once $1-a\ne0$, it disappears from the limiting Cauchy--Riemann equation."而 00:181-182 更直白："In particular, the coefficient $1-a$ needed by the observable is nonzero."观测量在极限方程里要除以 $1-a$ 或者以 $1-a$ 为系数配平，除法的合法性必须在造 observable 之前登记。$1-2\operatorname{Re}a>0$ 比 $1-a\ne0$ 强，多出来的那半平面约束 [推测] 正是让 §8 的边界值问题落在正确象限（交叉概率是实值且单调）所需。

运输关系与 $1-a$ 的 algebra 我可以从定义直接复算：$V_P=U_P+Q_P$（00-introduction.tex:140-141）。在极限里 $Q_P(f)\approx aV_P(f)$，于是 $U_P(f)\approx(1-a)V_P(f)$。$U$ 是复线性部分，只有它进入全纯结构的方程；$1-a=0$ 意味着线性部分在关系式里消失，观测量将不再满足任何一阶椭圆关系。非退化命题排除的就是这个。[推测] 证明机制：对闭 rim 的正交二阶矩恒等式（§3 的 $\lVert Z_t\rVert^2=3/4$）与 $V_P(1)=0$ 联立，若 $\operatorname{Re}a\ge1/2$，则 $Q$ 场在某测试下的能量与 $V$ 场的能量比违反 Cauchy--Schwarz 加正交性给出的绝对常数界；也可能经由 §10 的 closing triangle 配置反证，先取一条特定几何与特定着色模式得到 $a$ 的显式约束再传播到全部子列。两种我都无法从已读行确认，07:18-281 是空白区。

我对这一节的位置感做个诚实总结：全证明里 $a$ 只在三处露面，§5 定理的陈述（03:11-16）、§6 仿射均值（经 $a_h^Q$）、§9 与 §10 的极限方程消元。作者不需要算出 $a$，这个降级决定（我路线戊放弃的形态）是整个架构能轻下来的关键：待定量被压缩进一个开半平面约束，其余一切由正交恒等式和边界唯一性接管。台账里我给 $1-2\operatorname{Re}a>0$ 记了一行，位置挂在两个我真实读过的行号（03:12 与检索到的 07:16-17），未读证明正文这件事在 §13 的空白清单里排队。

三件武器的分工我按已读文本能给的就位证明：确定性空间细化对应 $h$ 网格上摆放的微调，把系数扰动转成 pin 重选，重选代价由有限菜单的稠密性（§7）支付；近返回界 [推测] 来自 §4 的臂幂（五臂平方界是标准近返回成本），排除弧在自己邻域里打转造成的重复计数；正交恒等式（§3）把剩余带符号二阶矩拆成逐三角形 $\lVert Z_t\rVert^2=3/4$ 的和，长度只进入非负计数，这才让"路径长"第一次能为"符号和"作证。06 节余下 650 行我未读，[推测] 内容即这三件武器的展开与 §5 定理 03:14-17 的收口，因为 03:23 白纸黑字："The transport estimate is completed in Section actual-arcs."（此段为追加 §9 时被锚点吞掉的原 §8 末段，逐字重登，勘误见 §14。）

## §10 观测量：closing triangle 上的三角值场

08 节任务（08-observable.tex:1-12）：造一个观测量，它的一个边界系数恰等于目标交叉概率；用 bulk transport 证明其极限全纯。路线分两步，先在多边形 Jordan 四边形的逼近圆盘上取自由交叉极限，再把该交叉与任意 Jordan 区域的闭胞元事件比较。本节所有随机离散区域都从点几何选出、与颜色独立（08:10-12）。这最后一句是 §7 教训的延续：区域若依赖颜色，条件化就把 §4 的适用范围警告引爆。

第一步的引擎是 Ordered polygonal approximation 引理（08:16-25）：多边形 Jordan 区域 $D$ 带有限标记边界点按循环序给定，概率趋于 1 时 Delaunay 三角化含一条简单原回路，其边界与选定的标记顶点按序、按 Fréchet 距离收敛到 $D$ 的标记边界；回路内部三角化与全平面三角化在 $D$ 内任何固定紧集上一致（对一切足够细的好逼近）。证明（08:27-52）我在 winding 提取那一步停留最久：沿 $\partial D$ 走一圈记录被碰到的胞元站点，相邻站点以原边相连，得一条闭原游走，对固定内点的绕数为 1；抽出返回环并收缩，得绕数可加的简单回路分解；保留对内饰正绕数的那条，保留其边的原始循环时刻。被丢弃的时间段两端物理位置趋于一起；边界单性迫使该段的参数长度趋于零，除非它趋于整整一圈，而后者会把全部保留时刻挤进一个边界点的邻域、与正绕数矛盾。有限确定性破平保证可测。内部由回路内三角形填充，mesh 与局部确定估计给内部一致。这段是纯几何拓扑操作，没有一处用渗流概率，我认为这就是它能对"任意条件化点过程"免疫的原因，也解释了引言 296-307 行为什么专门点名 Jordan--Schoenflies（Moise 定理 10.4）、Antoine 对简单弧的推广与 Radó 收敛定理。

closing star 构造（08:54-62）：在离散圆盘里先只保留三个标记顶点 $v_0,v_1,v_2$，分别逼近 $a,c,d$（正序），下标模 3；对包含端点的边界弧 $v_iv_{i+1}$ 扇入外部顶点 $s_i$，加接缝三角形 $s_{i-1}s_iv_i$，最后用顶点为 $s_0,s_1,s_2$ 的三角形 $t_*$ 封闭外部：球面简单三角化做成。附加顶点取独立公平颜色；外部三角形上不需要任何 Euclid 权重。$t_*$ 上，取 $n_i$ 为穿过 $s_{i-1}s_i$ 的对偶辐条上一点，赋标签 $w_i=\omega^i$，$\omega=\exp(2\pi\mathrm i/3)$（08:65-66 与 00:256），并特别注明这个次序与 $t_*$ 处正循环序相反。对偶边内部点 $m$ 处，条件于几何 $\eta$ 定义
$$F_m^\eta=4\sum_{i=0}^2w_iK(m,n_i)=4\mathbb E_{\mathrm{sp}}\bigl[w_*H_{\lambda_*}(m)\bigr]\qquad(08\text{:}68\text{-}71).$$
第二个等号的验证（08:73-78）我逐字跟过：不用 $t_*$ 的墙在三个 $n_i$ 处有相同的组件指标，其贡献被 $\sum_iw_i=0$ 杀掉；$t_*$ 被普通墙占用时，令 $i$ 为其缺失端口、$\lambda_*$ 为该墙加经缺失端口到达的分量，置 $w_*=w_i$；$t_*$ 未被使用则整体贡献为零。观测量沿对偶边内部常值，故可写 $F_e^\eta$。这个"三角值、由三条对偶辐条的关联函数加权和"的定义，把我 §3 攒下的 $K(m,n)$ 组合语义原封搬进复平面：$F$ 吃的是组件指标的内积，吐的是 $\{w_0,w_1,w_2\}$ 凸包里的点。

Triangular observable 命题（检索定位 08:172-177）：$F_m^\eta$ 属于顶点为 $w_0,w_1,w_2$ 的闭三角形；在内饰边界弧 $v_iv_{i+1}$ 的 fan 探针 $s_iu$ 处，它落在边 $[w_i,w_{i+1}]$ 上；对 $i=0$、$u$ 为逼近 $b$ 的标记顶点时，该边上 $w_1$ 的系数（句子在我窗外截断）[推测] 恰是该离散区域的黑交叉概率。引言 183-186 行的概念版本与此咬合："a component observable at this closing triangle records which boundary connection occurs. One of its boundary coefficients is exactly the crossing probability."凸包陈述加系数陈述合起来就是 Carleson 技巧：把 Cardy 问题装进等边三角形的线性边值问题（00:75-78 提到 Carleson 的 representation 正是我们论证终点那个边值问题）。Holomorphy 命题（检索定位 08:318-322）只有一句：Lemma probe-compactness 的每个极限 $F$ 在 $D$ 内全纯。它吃的输入按引言 186-188 行是"正交性加运输关系给出的围道相消"：运输把 $Q$ 场换成 $aV$ 场，$V_P(1)=0$ 于闭 rim，$1-a\neq0$ 由 §9 供，于是极限对光滑检验的围道积分为零，Morera 型论证落地。08:81-171、178-317、323-586 的正文我未读，[推测] 其中包含探针紧致性引理、系数等于交叉概率的双向论证、以及 boundary-uniqueness 引理把极限边值问题锁死为"共形映射到等边三角形"的唯一解（引言 190-193 行点名 Proposition observable、Proposition holomorphy、Lemma boundary-uniqueness 三件套）。

## §11 最后两公里：闭胞元事件的挤压与积分恒等式

全平面 annealed 极限现在在多边形区域上是自由胞元路径的交叉概率。还欠两件事：把"多边形"换成"任意 Jordan"，把"自由路径"换成"闭胞元并中的连通集"。Fixed-buffer Jordan comparison 命题（检索定位 08:587-592）就是这一步的官方合同：任意有界 Jordan 区域、正序四标记，闭黑胞元并交 $\overline D$ 中连通交叉的 annealed 概率（后半句在我窗外，[推测] 断言其极限等于同一 $\mathcal C(x)$）。引言 194-196 行的概念版本："A deterministic comparison at fixed buffers in a Schoenflies chart then transfers this crossing law to the exact closed-cell event in arbitrary Jordan domains."我把 08:676-770 的论证逐行读完，它由三个 paragraph 环境组成，恰好三段论。

第一段（08:678-708），连通闭胞元交叉生成了有限的原链。先复核局部有限性的加强版：在固定紧邻域上到最近站点的距离取有限最大（有限覆盖或与任一固定站点比较），碰该邻域的胞元其核落在由此得到的有界扩大内，Poisson 局部有限性只留下有限多这样的胞元（0678-684）。交叉集若不闭就取闭包：黑胞元并在局部是闭集的局部有限并，闭包仍黑、仍连通、仍在 $\overline D$ 内、仍碰两条目标弧；记这个紧连通集为 $K$。每个碰 $K$ 的黑胞元 $C_j$ 给非空相对闭集 $E_j=K\cap C_j$，有限覆盖；关联图连通，否则把集合分成两簇无交成员会给出 $K$ 的一个分离（0690-0695）。于是从左接触胞元到右接触胞元有有限触碰链。沿 Voronoi 边相接的胞元有相邻站点；只在一个 Voronoi 顶点相接的两胞元，Poisson 一般位置给出该顶点恰三胞元、其核成 Delaunay 三角形，那两站点仍相邻（0698-0702）。链因此给出一条黑的全平面原顶点链，覆盖闭胞元事件允许的纯顶点接触；细网格下核与边任意接近 $K$，对链的每条边用 $K$ 中的胞元接触点定位：两相邻核都靠近该点，其直 Delaunay 边也靠近（0703-0707）。0707 行落点："This justifies the proximity without any convexity assumption on $D$."我读到这行的确有点后怕，凸性假设本来会在 Jordan 边界凹凸不平时悄悄失效，而纯顶点接触的处理把闭胞元约定与原图邻接缝起来，靠的只是一般位置加三价性。

第二段（0709-734），链包含对 easier 盘的交叉。平方坐标下链留在 $[0,1]^2$ 一个小扩大内，起点严格在 easier 盘之左、终点严格在其右；链的允许高度带与 easier 盘整个上、下边界弧不相交；带内一条固定竖直中条落在逼近盘内部，左右边界弧邻域分居中条两侧。这些断言全部带严格裕量，对已固定的多边形与离散逼近保持（0709-718）。组合论证我完整复述，因为它是全证明最便宜也最容易被跳过的平面拓扑：链与盘边界是同一原图中的路径，只能共顶点或共边相遇；链要先到左边界接触、后到右边界接触，取首个右接触，再取它之前最后的左接触，中间无边界访问；共享的边界边会带来边界端点顶点、也是访问；子路径两端分居中条两侧故穿过中条；避开一条简单边界环路的连通路径不可能在环的内外之间移动；子路径因此在内部，两端落在闭盘的左右顶点弧上，去重后得黑交叉（0720-734）。harder 盘那侧 [推测] 是对称论证，把"链"换成"盘内的自由路径"、用补弧的白交叉走同一套首末接触逻辑，我没读到那半页原文。

第三段（0736-755），极限顺序。记 $p^-_{\varepsilon,\delta},p^+_{\varepsilon,\delta}$ 为固定的 harder/easier 离散盘的自由交叉概率，$p_\varepsilon(D;a,b,c,d)$ 为所求闭胞元概率。两条逐路径比较加上消失的几何例外给
$$p^-_{\varepsilon,\delta}-o(1)\ \le\ p_\varepsilon(D;a,b,c,d)\ \le\ p^+_{\varepsilon,\delta}+o(1)\qquad(08\text{:}742\text{-}744),$$
其中 $\delta$ 与确定多边形在微观极限期间固定；外侧由多边形结果收敛到 $\mathcal C(x^-_\delta),\mathcal C(x^+_\delta)$；随后收缩缓冲，选取多边形逼近误差比坐标裕量更快消失；标记边界按序按 Fréchet 收敛，闭 Jordan 共形收敛给 $x^\pm_\delta\to x$；$\mathcal C$ 在 $(0,1)$ 连续，两侧夹住所求极限为 $\mathcal C(x)$（0746-0755）。这段就是我 §5 里 limit-order 约定的宏观回声：缓冲先固定、微观极限先走、最后才收 buffer，三层顺序与 plug 那套 $h$ 先固定后 $\varepsilon\to0$ 同构。

收口只剩特殊函数（08:758-770）：
$$\int_0^1u^{-2/3}(1-u)^{-2/3}\,\mathrm d u=\frac{\Gamma(1/3)^2}{\Gamma(2/3)},\qquad \int_0^xu^{-2/3}(1-u)^{-2/3}\,\mathrm d u=3x^{1/3}\,{}_2F_1(1/3,2/3;4/3;x),$$
第二个恒等式靠把二项式级数在 $[0,x]$ 上逐项积分，再用 $\Gamma(4/3)=\Gamma(1/3)/3$，代入 (observable:beta) 恰得 (eq:cardy)；配上 Fixed-buffer Jordan comparison，Theorem cardy 在所述全平面 annealed 律与闭胞元约定下证毕（0765-770）。我在等边三角形边值问题里解出的 $\mathcal C$ 与这个 Beta 型积分的相等，正文放在 [推测] 未读的 boundary-uniqueness 引理里；引言 75-78 行把 Carleson 的名字挂在"等边三角形内线性边值"的 representation 上，两半信息互指。

## §12 矩形上的淬火推论与思路差异

推论（00-introduction.tex:200-218）：固定非退化开矩形 $D$、四角正序、$ab,cd$ 为选定的对边，$x_D$ 为其共形参数，$Q_\varepsilon(\eta)=\mathbb P^{\eta}(\mathcal C_\varepsilon(D;a,b,c,d))$，几何律记 $\mathbb P_{\mathrm{geom},\varepsilon}$，则 $\mathbb E_{\mathrm{geom},\varepsilon}\lvert Q_\varepsilon-F(x_D)\rvert^2\to0$，进而对每个 $t>0$ 有 $\mathbb P_{\mathrm{geom},\varepsilon}(\lvert Q_\varepsilon-F(x_D)\rvert>t)\to0$；这些极限逐网格使用几何律，跨网格不做耦合。

证明（00:220-252）我当作对自己工具箱的一次验收读完。第一句是事件同一性：几乎必然只有有限多个 Voronoi 胞元碰 $\overline D$，每个被裁进 $\overline D$ 的胞元闭且凸；有限个这种胞元的并的每个连通分支都是道路连通的（沿相交胞元链拼接过心线段）。于是几何几乎必然、着色任意时，我的连通集交叉事件与 Vanneuville 2025 定义 1.1 的连续闭胞元交叉事件一致（00:222-228）。第二句是方差集中：保向等距后写 $\overline D=[-w,w]\times[-h,h]$，选定边竖直；$\varepsilon^{-1}$ 放缩把强度 $\varepsilon^{-2}$ 全平面泊松送成单位强度、矩形送成 $[-\lambda R,\lambda R]\times[-R,R]$，$\lambda=w/h$、$R=h/\varepsilon$；Voronoi 胞元与条件公平着色与这个相似交换，Vanneuville 定理 1.3 给绝对常数 $\alpha>0$ 与 $C_\lambda<\infty$ 使 $0<\varepsilon\le h$ 时 $\operatorname{Var}_{\mathrm{geom},\varepsilon}(Q_\varepsilon)\le C_\lambda(\varepsilon/h)^\alpha$（00:229-241）。第三句是平方分解：$m_\varepsilon=\mathbb P(\mathcal C_\varepsilon)$ 满足 $\mathbb E_{\mathrm{geom},\varepsilon}Q_\varepsilon=m_\varepsilon$（全期望公式），主定理给 $m_\varepsilon\to F(x_D)$，故 $\mathbb E\lvert Q_\varepsilon-F\rvert^2=\operatorname{Var}(Q_\varepsilon)+\lvert m_\varepsilon-F\rvert^2\to0$；Markov 收尾（00:242-251）。淬火结论的范围因此只有"固定矩形 + $L^2$ 收敛"，比 annealed 定理窄得多，跟引言 52-57 行的免责正好对榫。

最终思路与最初设想的差异，我列五条，每条都能回指已读文本。其一，我原以为证明的主件是一个离散全纯函数，实际主件是一对带几何缺陷的场 $Q,V$ 与一条把它们联起来的标量关系，全纯性推迟到 §10 的 closing triangle 才出现，代价是必须先买到非退化（00:180-188）。其二，我原以为会全程用淬火条件化，实际"annealed 优先"贯穿到底：比较用被原测度控制的次概率进行，除法被禁止（00:171-173、06:40-49）。其三，我原以为几何误差要靠曲率或形状正则性压制，实际靠的是稳态加正交恒等式：$V_P(1)=0$ 于每条闭 rim（00:144），二阶矩按 $\lVert Z_t\rVert^2=3/4$ 逐三角形分摊（01:137-142）。其四，我原以为极限对象需要被识别，实际只需被边界值问题唯一性锁定，$a$ 不进答案（00:186-193）。其五，我原以为正方形格 bond 版本会作引理，论文明说该定理未被使用（00:84-86）。读完全稿我给自己的一句话总结：Cardy 公式在这里是先被"打开"的，回路恒等式的闭合性被 plug 一层层剖成可比较的开弧，剩下全纯性、边界值、特殊函数三步反而都是熟路。

## §13 未读区间与推测清单

厚档取规把取证压在 15 次调用内，我只能覆盖定理陈述与证明骨架。所有没读的部分在这里建档，正文中每一处 [推测] 都受这张表约束，列出"哪些行区间空白、空白里的结论靠什么支撑"。

一、01-fields.tex 第 143 至 401 行：$Z_t$ 的构造细节、正交恒等式的证明、Closed-sum tail 求和项全文都缺失。我在 §3 只引用了题头（137-142）与被截断的陈述开端（402-407）。若 toggle 双射并非实际工具，§3 里"每个因子都有组合含义"的机制句失效，引用的结论本身不受影响。

二、02-probability.tex 第 100 行以后：annealed 侧 disjoint-occurrence 讨论的下文、local arm 与 mesh 估计的推导（§5、§7、§8 引用的 lemma mesh、lemma mixed-four、lemma rim 的确切陈述）全部未读。我只在正文点名引理名与被引用位置；陈述本身是 [推测]。

三、03-plugs.tex 第 91 至 501 行与 508 行以后：状态集 $G$ 的定义、准入规则、双色走廊的几何、common-closure 引理的陈述与证明、state cochain 命题的完整公式。§5 的 $i_e^\varepsilon(\sigma_s,\sigma_t)$ 叙述与 §6 对 $o_{L^1}(1)$ 的使用都受这段空白限制，我仅在检索可见的 502-507 行引用了公式首行 $\widehat m_s+\widehat j_e-i_e^\varepsilon=o_{L^1}(1)$。

四、04-affine.tex 第 91 至 384 行：仿射均值命题的收口（加法且局部有界如何推出线性、旋转协方差如何把实线性升为复乘）、chart-stability 引理、端点势命题证明大部。§6 已把这条收口明确标为 [推测]。

五、05-pins.tex 第 81 至 533 行：门试验的概率计算、pin 密度的构造、$\beta'$ 的消费点（命题里有 $\beta,\beta'$ 两个参数，我只见 $\beta$ 在定义 (iv) 出现，$\beta'$ 用途未读）。

六、06-actual-arcs.tex 第 61 至 911 行：real-arc 运输命题的主体不等式、确定性细化引理、近返回界、bulk transport 的收口步骤。§8 末段"三件武器"的分工映射来自引言 174-178 行，属陈述级转述。

七、07-nondegeneracy.tex 第 18 至 281 行：整节证明空白。§9 只有命题句、它在架构中的位置感与两种机制猜测，均未升格为事实。

八、08-observable.tex 第 81 至 171 行、178 至 317 行、323 至 586 行：探针紧致性引理、系数等于交叉概率的完整论证、boundary-uniqueness 引理、多边形自由交叉极限的构造（含 $\mathcal C$ 的定义与 (observable:beta) 公式本体）。§10 与 §11 引用 $\mathcal C(x)$ 处只到我在 676-770 行窗口内逐字所见。

九、文献学：references.bib 未读，所有引文按论文正文点名转述，页码与定理号只抄正文给出的。

关于纪律的两条自查。其一，正文引用的位置全部是本会话真实 Read 或检索输出的行号，检索定位的条目我都在句内注明"检索定位"或给出可见行区间；文末台账的位置栏只允许出现在我逐行读过的窗口内。其二，推测句都在子句级带 [推测] 标记；当一条推测被用于支撑一句结论时，我补写了"无法从已读行确认"的字样，没有把空白区的内容伪装成通读结果。

## §14 勘误

本节按落盘协议登记已成文的失误。按协议不得改写已落盘内容，以下条目只做说明，修订一律以"应作"给出读法。违例串此处只以类别名指代，避免逐字复写。

一、文风类：两字转折连接词及其扩展形态，全稿命中两处，一处在 §7 讨论 $r_h$ 阈值取次幂的句子，一处在 §8 讨论记账约定写入位置的句子。两处均属禁用转折结构，应分别改读为"取 $h$ 的次幂、并非 $h$ 本身"与"写进定义、无须写在引理里"。除这两处外，四字过渡套语、长停顿号与五列表表头之外的其余禁串类别自查为零。

二、符号类：§6 引用 $A_\varepsilon^X(\ell)/h$ 有界范围的不等式时多打了一个链式项，成文为四段链，应作 $D+1\le\ell\le D+4$，指 04-affine.tex 第 68 至 70 行的同阶界。

三、措辞类：§5 有一处中英混用动词（impose），应作"不强加"；所指为 03-plugs.tex 第 72 行"No metric regularity ... is imposed"的翻译。

四、结构类：追加 §4、§6、§7、§9 四次操作中，锚点选择不当各切断了上一节的一个收尾过渡段，共四段。四段均已在紧随的下一节开头逐字重登并带行内说明；正文在文件中的物理次序因此与最初落盘次序有偏移，内容与编号未动。前向引用自查：§2 指向 §12、§5 指向 §8 与 §9、§6 指向 §7、§9 指向 §10 与 §13、§10 指向 §3 与 §9、§11 指向 §5 与 §9、§13 覆盖全部 [推测]，均有实体小节对应。

## §15 符号台账

全文唯一五列表。数据行位置栏全部出自本会话逐行读过的窗口：paper.tex 全文、00-introduction.tex 全文、01 至 06 与 08 的已读区间（01:1-120、02:1-100、03:1-90、04:1-90、05:1-80、06:1-60、08:1-80、08:676-770）。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\eta=X_\varepsilon$ | 强度 $\varepsilon^{-2}$ 齐次泊松 | sections/00-introduction.tex:14-15 | $\mathcal V_v$ 与 $\mathcal C_\varepsilon$ 的定义 | 微观极限失去参数载体 |
| $\mathcal V_v$ | $\lvert z-v\rvert\le\lvert z-u\rvert$ 闭胞元 | sections/00-introduction.tex:17-19 | 黑区 $\mathcal B_\varepsilon$ | §11 闭胞元事件换定义 |
| $\mathcal C_\varepsilon(D;a,b,c,d)$ | 连通集碰弧 $ab$ 与 $cd$ | sections/00-introduction.tex:30-32 | 主定理左侧 | 全命题对象漂移 |
| $x$ | $a,c,d$ 映至 $0,1,\infty$ 时 $b$ 的像 | sections/00-introduction.tex:32-36 | $F(x)$ 的自变量 | 定理两端共形参数失锚 |
| $F(x)$ | 核 $[u(1-u)]^{-2/3}$ 的归一积分 | sections/00-introduction.tex:43-45 | Theorem cardy 目标值 | Cardy 预测整体改写 |
| ${}_2F_1$ 表达式 | $\Gamma(2/3)x^{1/3}/(\Gamma(1/3)\Gamma(4/3))$ | sections/00-introduction.tex:46-48 | 末尾积分恒等式 | 08:758-767 代回断链 |
| $\mathbb P^{\eta}$、$\mathbb E_{\mathrm{sp}}$ | 条件颜色律、固定图颜色平均 | sections/00-introduction.tex:22-26 | 一切二阶矩恒等式 | §3 内积无载体 |
| 颜色 $1/2$ 公平 | 与 $\eta$ 独立 | sections/00-introduction.tex:20-21 | 偶子图均匀律双计数 | §3 第一件本钱作废 |
| $\lambda=(L,C)$ | 回路加分量配对标签 | sections/01-fields.tex:28-34 | $H_\lambda(m)=\mathbf 1_{\{m\in C\}}$ | 正交恒等式退化启发式 |
| $\langle F,G\rangle$ | $\mathbb E_{\mathrm{sp}}\sum_\lambda F_\lambda\overline{G_\lambda}$ | sections/01-fields.tex:39-43 | $K(m,n)$ 与两场恒等式 | §3 精确层全线失效 |
| $K(m,n)$ | 双缺陷系综存活回路期望条数 | sections/01-fields.tex:96-101 | 观测量 $F_m^\eta$ 的定义 | 08:68-71 两式衔接断裂 |
| 删除约定 | 连顶点删净 $L$，孤立开边自成分量 | sections/01-fields.tex:29-31 | 四面体插图两面板对照 | 组件计数与图 01:48-94 失配 |
| $U_P$、$Q_P$、$V_P$ | 线性项、反线性项、加权和 $V_P=U_P+Q_P$ | sections/00-introduction.tex:133-141 | 运输关系全部陈述 | §5 目标式无定义 |
| $V_P(1)=0$ | 闭 rim 切向总量精确零 | sections/00-introduction.tex:144 | §10 围道相消 | 极限方程失去齐次侧 |
| $Q_P(f)-aV_P(f)\to0$ | 概率收敛、一致于出领圈 rim | sections/00-introduction.tex:146-151 | bulk transport 定理 | §8 真实弧命题断头 |
| $\operatorname{Re}a<1/2$ | 抽取子列附带标量约束 | sections/00-introduction.tex:147 与 03-plugs.tex:10-12 | 非退化命题同不等式 | §9 与 §5 陈述脱钩 |
| $1-2\operatorname{Re}a$ | 严格为正 | sections/00-introduction.tex:180-181 | 系数 $1-a\neq0$ | 观测量除以零风险 |
| 交叉下界 (i) | 例外概率 $O_\gamma(R^{-\gamma})$ | sections/02-probability.tex:26-34 | 缓冲矩形链的淬火供给 | §7 白侧 $\beta$ 界无从嫁接 |
| (ii) 淬火二阶矩 | $\mathbb E[p_j^\eta{}^2]\le C_j\alpha_j^2$ | sections/02-probability.tex:37-40 | 条件检验的均方控制 | 门试验概率换算断裂 |
| $\alpha_1$ 幂 | $C(r/R)^{c_1}$ | sections/02-probability.tex:43-45 | 臂谱低端 | 供给结构失去基础指数 |
| $\alpha_4$ 幂 | $C(r/R)^{1+c_4}$ | sections/02-probability.tex:45-47 | $CM^{-1-c}$ 中的 $c$ | §7 试验族不可求和 |
| $\alpha_5$ 幂 | $C(r/R)^2$ | sections/02-probability.tex:44-46 | 近返回界 [推测消费点] | §8 三件套缺一角 |
| Reimer 乘积界 | $2^n\lvert A\mathbin\square B\rvert\le\lvert A\rvert\,\lvert B\rvert$ | sections/02-probability.tex:91-95 | 分离领圈独立试验 | §7 门概率乘法失效 |
| 适用范围警告 | 任意条件化点过程无交叉下界 | sections/02-probability.tex:61-64 | 路线丁封死的依据 | §8 受控核设计动机消失 |
| 极限顺序约定 | $h$ 先固定、后 $\varepsilon\to0$、再 $h\downarrow0$ | sections/03-plugs.tex:30-39 | 全部 $o(1)$ 与 $Ch$ 声称 | 分母出现拟合概率 |
| 门环参数 | $10<a_1<b_1<m/10$、$10m<a_2<b_2$ | sections/03-plugs.tex:53-55 | qualified pin 的前两层门 | §7 三层围栏缺原型 |
| 带形图 | $\Phi:[-12,12]\times[-3,3]$ | sections/03-plugs.tex:59-65 | 名义遍历与窗口坐标 | $0.1$ 与 $0.05$ 误差失去单位 |
| 窗口 $I_B$、$I_W$ | $[-.3,.3]$ 与 $[-1.8,-1.4]$ | sections/03-plugs.tex:66-69 | root rank 定义 | 状态函数两端无落点 |
| $\rho_{\varepsilon,h}$ | $\sqrt{h\varepsilon}$ | sections/03-plugs.tex:77-79 | retained 边判据 | mesh 免疫力丧失 |
| 仿射均值 | $\mathbb E_\mu i_e^\varepsilon=a_h^X(z_t-z_s)+o(1)$ | sections/04-affine.tex:39-41 | 端点势分解 | §8 拼接误差不可控 |
| 准加法 | $A(\ell+r)=A(\ell)+A(r)+o(1)$ | sections/04-affine.tex:55-57 | 可数子群提取极限 | 标量 $a_h^X$ 无法定出 |
| 空菜单约定 | $a_h^V=1$、$a_h^Q$ 任取有界 | sections/04-affine.tex:11-13 | 运输定理退化分支 | §5 最大值口径悬空 |
| $r_h$ | $h^{1-\kappa}$，$\kappa$ 后选小 | sections/05-pins.tex:12-16 | 子弧分割粒度 | §8 长弧切段失效 |
| 第三层门 | $a_3>100b_2$、$\operatorname{diam}\Delta\le2b_3h$ | sections/05-pins.tex:28-31 | 中央子弧隔离 | 比较时端点漂移 |
| 遍历拟合误差 | 横向与回头 $<0.1$ | sections/05-pins.tex:33-35 | 标称图水平中线 | stub 标准路线无法衔接 |
| root 位置 | $u=\pm1.7$ 附近、误差 $<0.05$ | sections/05-pins.tex:42-45 | 黑 root 与侧通道 | 连接器端窗对不上 |
| $\beta$ | 白侧条件概率下界 | sections/05-pins.tex:46-50 | 强制核分母 $q$ | 06:49 的 $(C/q)\nu$ 断裂 |
| 门半径梯 | $A_1=30$、$B_i=MA_i$、$A_{i+1}=10^4B_i$ | sections/05-pins.tex:64-68 | 领圈独立性防火墙 | 试验相关性混入乘积 |
| 试验界 | 极限概率 $\le CM^{-1-c}$ | sections/05-pins.tex:73-75 | 密度命题的期望计数 | §7 稠密性不成立 |
| $I_X(P;s,t)$ | 首截断球整球入和 | sections/06-actual-arcs.tex:26-36 | 弧段拼接精确性 | §8 分段累加误差扩散 |
| 强制核界 | $\lambda K\le(C/q)\nu$ | sections/06-actual-arcs.tex:44-50 | 比较全程不被归一化 | 条件除法卷土重来 |
| 单调制备 | 只改 $I(Z)$ 内黑为白、定点其余坐标 | sections/06-actual-arcs.tex:51-59 | §7 条件 (iii) 的抽象原型 | 外 force 动几何毁条件化 |
| $\omega$ | $\exp(2\pi\mathrm i/3)$ | sections/00-introduction.tex:256 | 标签 $w_i$ 与 $\sum_iw_i=0$ | 08:73-78 杀项失灵 |
| $F_m^\eta$ | $4\sum_{i=0}^2w_iK(m,n_i)$ | sections/08-observable.tex:68-72 | 三角值观测量 | 边界系数即概率断链 |
| 闭包链论证 | 有限触碰链、顶点接触算相邻 | sections/08-observable.tex:686-707 | 闭胞元到原图链转化 | §11 第一段整体失效 |
| 中条穿越 | 首右接触前最后左接触 | sections/08-observable.tex:720-733 | easier 盘交叉提取 | 挤压上界断供 |
| 挤压式 | $p^-_{\varepsilon,\delta}-o(1)\le p_\varepsilon\le p^+_{\varepsilon,\delta}+o(1)$ | sections/08-observable.tex:737-745 | Jordan 域转移 | 主定理停留多边形 |
| Beta 积分 | $\Gamma(1/3)^2/\Gamma(2/3)$ | sections/08-observable.tex:760-761 | $F$ 的归一化 | Cardy 两表达失配 |
| 超几何积分 | $3x^{1/3}{}_2F_1(1/3,2/3;4/3;x)$ | sections/08-observable.tex:762-764 | eq:cardy 右端 | 级数逐项积分断步 |
| 方差集中 | $\operatorname{Var}(Q_\varepsilon)\le C_\lambda(\varepsilon/h)^\alpha$ | sections/00-introduction.tex:237-241 | 淬火推论 | §12 的 $L^2$ 收敛断供 |
| 放缩界面 | $\lambda=w/h$、$R=h/\varepsilon$ | sections/00-introduction.tex:232-234 | 相似与胞元着色交换 | 推论引用外部定理失据 |
| bulk patch | 图与图卡一致概率趋一、权重只用一致块 | sections/00-introduction.tex:279-290 | 所有运输陈述的场地 | §5 定理失去定义域 |
| 有限比特切片 | 固定几何下有界检验住在 $\{0,1\}^n$ | sections/02-probability.tex:95-98 | Reimer 约化适用条件 | §4 乘积界最后环断裂 |
| $K_4$ 对照图 | 四面体对偶两面板删除示范 | sections/01-fields.tex:88-93 | 组件标签口径校准 | §3 配对坐标失去图示锚点 |
| patch 三环 | $R$、$4R$、$6R$ 嵌套球 | sections/03-plugs.tex:12-16 | 运输定理开口条件 | §8 最大值跑量口径悬空 |
| stub 出口 | 大正方形对边中点、横向 $v$ 向上 | sections/04-affine.tex:19-21 | 连接器标准路线 | §6 长度集与整数扭转无法计数 |
