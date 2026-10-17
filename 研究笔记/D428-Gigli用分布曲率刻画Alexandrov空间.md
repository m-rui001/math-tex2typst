# D428 · Gigli 用分布曲率刻画 Alexandrov 空间（研究笔记）

## §0 本单登记与取材基线

这一单我面对的是 preprints 库里第 251 行那篇论文的 LaTeX 源码包，目录日期后缀照抄。落笔前先把取材边界钉死：正文素材只从该目录 build 子树下的 `.tex` 取，PDF 一律不碰，typst 分片不计入来源，README 只当索引。build 下 `.tex` 合计 187,347 字节，属于厚素材，所以我先 `ls` 量出每个文件的字节，再对主干章节用分段 offset 读，没整篇顺序读完就动笔。

我实际读到的骨架是这样：main 文件只有 1,685 字节，标题、摘要与最后那条等价性证明的收束都在它里面；preamble 2,932 字节，除定理环境与 cleveref 配置外，还定义了一批自定义命令，分别覆盖合成里奇下界记号、测试函数与测试向量场类、Hessian 算子、散度、支撑、容量、测地线族、模型正弦与模型余切、两个数集、一个弱收敛箭头和一个微分记号。按要求，这些命令在本笔记里全部展开成标准 LaTeX 写法，任何位置都不复现命令名本身，连"我拒绝照抄这些命令"这类交代里也只用类别描述。introduction 11,300 字节给出猜想原文、测试类与曲率泛函定义和文献脉络；preliminaries 15,195 字节给二阶梯度演算、逼近、弱 Hessian 与 Bochner 测度、容量归一化、局部体积与运输事实；forward 50,497 字节证正向；heat-index 54,046 字节把张量下界变成热正则指标不等式；frames 41,042 字节沿路径建标架并把指标界升级成径向 Hessian 测度界；comparison 9,371 字节把 Hessian 界送到每条测地线、再局部到整体得 Alexandrov 下界。figures 下一个 tikz 源文件 1,279 字节画逆向链条，我把它当作结构线索。

登记两行挂在 §0 末尾，逐字照抄：

preprints/Giglis-distributional-curvature-characterization-of-Alexandrov-spaces-September-24-2026

其他队列第 251 行号

## §1 初始动机与猜想

我在光滑流形上熟悉的那条等价是：截面曲率有下界，等价于测地三角形满足相应的下比较。Gigli 想把这条等价搬进合成曲率的世界：一个只给了里奇下界加上无穷小希尔伯特性（也就是二次 Cheeger 能量）的空间上，他定义了一个分布意义下的曲率张量，作用在整体测试类里，形式上是把两个弱协变导数、两个散度和一个换位子对某个测试函数 $f$ 做带权积分。他随后猜想在维数不小于 2 时，"这个分布张量在每个二维方向上不小于 $\kappa$"应当等价于"这个空间是维数为 $n$、曲率下界为 $\kappa$ 的 Alexandrov 空间"。我一开始就明白：Gigli 自己的构造只给出了张量的代数对称性与张量性，它本身并没有把张量的下界跟三角形比较连起来，这中间的缺口就是整篇论文要填的东西。

我的第一个直觉是把抽象不等式翻译成能算的东西。测试函数类里的元素要求：属于 $L^2$ 生成元的定义域、有一个有界且整体 Lipschitz 的代表、并且它自己的 Laplace 算子还落在 $W^{1,2}$ 里。测试向量场是有限个形如 $a_j\nabla b_j$ 的和。目标张量不等式的样子是

\[
R(X,Y,Y,X)(f)\ \ge\ \kappa\int_M f\bigl(\lvert X\rvert^2\lvert Y\rvert^2-\langle X,Y\rangle^2\bigr)\,\mathrm{d}m,
\]

对所有 $X,Y$ 取自测试向量场类、所有非负 $f$ 取自测试函数类成立。右边那个 $\lvert X\rvert^2\lvert Y\rvert^2-\langle X,Y\rangle^2$ 正是二维平行四边形面积的平方，也就是截面方向 $\lvert X\wedge Y\rvert^2$，这个量我在正向里会反复用到。参考测度我按 Gigli 的原样取成精确的 Hausdorff 测度 $m=\mathcal{H}^n_d$，取成一个跟它等价的测度在这里不够用，原因我在 §8 展开。

## §2 整体架构与两条方向

我把论文的逻辑读成一个环，正向与逆向各自是半圈。正向 (A)⇒(B)：先靠 Alexandrov 到合成里奇那一套（Petrunin、Zhang--Zhu、Kuwae--Machigashira--Shioya 给的曲率维数与无穷小希尔伯特性；含带边界情形的完整非约化版本记在 Kapovitch--Ketterer--Sturm 里），把 (B) 前半的度量测度内容拿到手，剩下要证的就是那条分布张量不等式。逆向 (B)⇒(A) 才是重头，链条在 figures 那张 tikz 里画得很清楚：整体分布截面下界 → 固定终端路径上的热指标不等式 → 径向 Hessian 界作为一个带符号测度 → 有界整体距离改造 → 沿每条测地线的模型 ODE → 三角形比较与全局 $\mathrm{CBB}(\kappa)$。我把这三段认作三个关键转折，分别对应 heat-index、frames、comparison；正向单独对应 forward。main 文件里那四行收束证明就是把这些定理名字串起来：正向引用 forward 的曲率定理，逆向先引 heat-index 的指标不等式，再由 frames 把指标转成分布 Hessian 比较，最后由 comparison 得到 Alexandrov 下界和维数 $n$。

我在架构上给自己定了一条纪律：凡是只依赖非塌陷 $\mathrm{RCD}$ 框架的事实，我在 preliminaries 里一次性说清形式，之后按用到处再展开特殊定理，比如调和分裂、切锥连续性、热核、变曲率那几块都是在用到的地方陈述的。这样做的代价是正文里到处埋引用，好处是每一步的前提都写在离它最近的地方，出了问题能立刻定位。

## §3 错误路线与失败原因

第一条我试过去、但根本走不通的路，是在正则子集上算一个经典张量再取极限。光滑情形里截面下界本来就是逐点张量不等式，我本能地想：Alexandrov 空间去掉奇异集后是光滑的，能不能在光滑开集上验证 Gigli 泛函退化成经典曲率、再逼近回去。它卡住的原因有三层。其一，空间没有整体图册，奇异点集带分层结构，"去掉奇异集"这件事本身依赖尚未证明的正则性。其二，这里的张量只是对整体测试类定义的分布泛函，从来没有假设存在一个经典曲率张量。其三，Lebedeva--Petrunin 那套弱曲率张量是用带共同截面下界的光滑逼近取弱极限得到的，那是另一套框架，跟本文的整体测试类泛函对不上，不能直接借。我为什么还会先想到它，只能标 [推测]：光滑情形太自然，让人下意识往逐点上靠。

第二条死路是把测试场限制成紧支撑。我一贯的习惯是用紧支撑光滑对象先算，再逼近到全局。可是这里参考测度 $m=\mathcal{H}^n$ 的总质量可能无穷，常数函数 $1$ 未必落在测试函数类里，于是"紧支撑"和"整体"这两个需求打架。preliminaries 专门有一条 remark 处理它：一个紧支撑测试梯度，只要乘一个在其支撑上等于 1 的测试截断，就变成整体测试向量场，往后凡是用到"裸梯度"的地方都得在这个意义下局部化。这条补丁让我意识到，正逆向都必须守住整体测试类，不能偷懒降到紧支撑。

第三条我撞上的墙，是想把径向 Hessian 的分布界直接沿测地线积成距离函数的凹性。光滑情形里 $\operatorname{Hess}(d^2/2)$ 的界积分一次就给出 $r$ 的二阶比较，看起来顺理成章。障碍在 Brena--Gigli 讲清楚的那处正则性缺口：一个只有分布意义的 Hessian 上界，要变成沿路径的凸性/凹性陈述，需要额外正则性，一般给不出。正因如此，从 Hessian 界到每条测地线那一步不能自己硬做，得外包给那篇配套论文的一般弱 Hessian 定理（见 §7），配套定理的前提只要求 $F$ 有界且整体 Lipschitz、$G$ 有界连续，压根不碰 $F$ 的 $L^2$ Hessian。

第四条错路是以为"几乎处处有欧氏切空间"就够用。非塌陷给出几乎每点切模都是 $n$ 维欧氏空间，我据此以为随便挑 $n$ 个测试函数的梯度就能在路径上张成标架。可路径是整体对象，它可能在某个内部时刻正好穿过那处零测坏集。也就是说，逐点正则不保证逐时刻标架。修好这件事要动用一整套：一个可数调和标架族，让秩亏的集合只有零 $(n-1)$ 维 Hausdorff 测度；容量与Hausdorff content 估计把坏集压成零容量；路径规避引理说明几乎每条整体路径都躲开它；再靠 Deng 的沿每条测地线切锥连续性定理把内部时刻的正则性补上。这一段我在 §6 详细写。

第五条错路跟热指标直接相关：想对热核取对数，一步得到 Riccati 型演化。真算下去就发现，终端时刻附近既有 $1$ 除粘度参数这种反粘度项在发散，Bochner 不等式里那些奇异测度项也在发散，直接取 $\log$ 根本控不住。论文的办法是配一前一后两个热因子、归一到给定终端密度，让它们的乘积满足连续性方程，再靠作用量恒等式把速度项强收敛起来，最后用一个单边一致下界把终端前的加速度误差压住（见 §5）。

## §4 前向：积分构型与平方配凑

正向要证的是 forward 那节的主定理：设 $(M,d)$ 是完备的 $n$ 维 Alexandrov 空间、曲率下界 $\kappa$、$n\ge2$、$m=\mathcal{H}^n_d$，则 $(M,d,m)$ 是 $\mathrm{RCD}((n-1)\kappa,n)$、测度满支撑，且那条张量不等式对全体非负测试函数与全体测试向量场成立。

度量测度那半我直接引用：曲率维数与无穷小希尔伯特性来自 Petrunin 与 Zhang--Zhu，再叠加 Kuwae--Machigashira--Shioya 的二次 Sobolev 结构；含带边界情形的完整非约化整体陈述由 Kapovitch--Ketterer--Sturm 记录，它只要 $\mathcal{H}^n$ 局部有限，不要紧性也不要总质量有限。把 $K=(n-1)\kappa$ 记下来后，整节都在用由此得到的 $\mathrm{RCD}$ 演算，所有协变导数一律按弱协变导数理解。

真正要啃的是张量不等式。我的打法是比较两个能量：一族短流沿径向方向的作用量，与这些流末端测度之间的最优运输作用量。取有限多个梯度方向，给它们配一个在 $u\mapsto -u$ 下不变的有限概率律，$A=\nabla u_A$、$B=\nabla u_B$ 相互独立抽取。这样有中心化 $\mathbb{E}A=0$ 与 $\mathbb{E}\lvert A-B\rvert^2=2\,\mathbb{E}\lvert A\rvert^2$。最该记住的例子是把律取成均匀分布在 $U,-U,V,-V$ 上：符号对称把能量展开里的奇次项全部抵消，混合对则恰好留住 $U,V$ 张成的截面表达式 $\lvert U\wedge V\rvert^2$。我用一般有限律，是因为计算只依赖独立性与符号对称这两件事，逐点构造反而出不来。

对固定非负紧支撑 Lipschitz 的 $f$ 与梯度的常数组合 $C$，写 $L_C=-\operatorname{div}(fC)=-\langle\nabla f,C\rangle-f\operatorname{div}C$，它是有界紧支撑函数。$\int f=0$ 是平凡情形，故设 $\int f>0$。几何比较给出"$2$ 倍平均径向作用减去平均配对作用"的一个下界；上界要靠对偶运输计算，先产生一个度量径向加速度的误差项，再用二阶端点修正把误差消掉，之后平均就把上界认成曲率项加一个非负平方。核心代数落在 forward 的配凑平方引理上：

\[
2\,\mathbb{E}\,K_{0A}-\mathbb{E}\,K_{AB}=\tfrac{1}{6}\,\mathbb{E}\,R(A,B,B,A)(f)+\tfrac{1}{2}\,\mathbb{E}\!\int f\,\bigl\lvert \nabla q_{AB}+\nabla_{A}(B-A)\bigrvert^{2}.
\]

这里 $q$ 属于 $d^2/2$ 那一类径向系数，且 $q_{0A}=0$。左边是两条能量之差，右边第一项是 $\tfrac{1}{6}$ 倍的 Gigli 张量在 $(A,B,B,A)$ 上对 $f$ 的取值，第二项是带 $f$ 权的非负平方。我看到这条恒等式时才算踏实：截面下界要成立，只需让那个非负平方任意小、再让比较不等式把它夹住。剩下的平方靠"在有限个局部化块上分别选取 Sobolev 对偶势"压小，也就是靠梯度测试的局部选取让误差趋零。整个推导里那条分部积分恒等式只用到 $q\in W^{1,2}$、不给 $q$ 指定 Hessian，这对只在分布层面出现的对象至关重要。

有了梯度方向上的不等式，正性与张量性把它推广到测试系数，局部逼近加穷竭再回到整体测试类，极限次序在那节末尾的一条 remark 里钉死。我把这一段整体看成"把 Alexandrov 的三角形比较拆进运输展开里"：几何侧与运输侧界住同一个能量差，平均消掉低阶项，端点修正把幸存的系数认成曲率项加非负平方误差，局部梯度测试再把误差任意压小。用到的只有测试演算提供的弱导数，没有偷偷借一个经典张量。

## §5 逆向之一：热正则化指标不等式

逆向从假设 (B) 出发，记 $K=(n-1)\kappa$。目标是把张量下界翻译成沿校准测地线的指标不等式。我固定一个有界、整体 Lipschitz、在紧集外为常数的函数 $u$，对它做 inf-卷积

\[
\Phi_t(x)=Q_tu(x)=\inf_{y}\Bigl\{u(y)+\frac{d^{2}(x,y)}{2t}\Bigr\},\qquad 0<t\le1,
\]

完备性保证下确界能取到。我要的是 $\Phi_1$ 的分布 Hessian 的一个上界，且右端沿这个 inf-卷积的极小路径来评估。

可试验的场取 $Y_t=\sum_{j=1}^{q}a_j(t)\nabla g_j$，系数 $a_j$ 在 $[\delta,1]$ 上光滑、$g_j$ 是紧支撑测试函数，于是 $Y_t=\nabla g_t$。一条测地线 $\gamma$ 若被 $u$ 校准，指的是 $\Phi_1(\gamma_1)=u(\gamma_0)+\tfrac{1}{2}d^2(\gamma_0,\gamma_1)$。热指标定理的主干是这样：存在一个在某个 $m$-零集外定义的 Borel 指定 $S:x\mapsto S(x)\in\operatorname{Geo}(M)$，满足 $S(x)_1=x$ 且校准；对非负紧支撑 Lipschitz 的 $f$ 写 $\pi_f=S_{\#}(fm)$，它有均匀有界速度、在每个 $[\delta,1]$ 上有界压缩。于是对紧支撑测试梯度 $Z$ 与端点条件 $Y_\delta=0$、$Y_1=Z$ 的试验场，成立

\[
H_{\Phi_1}(Z,Z)(f)\le\int_{\operatorname{Geo}(M)}\int_{\delta}^{1}\Bigl(\bigl\lvert \partial_tY+\nabla_{v}Y\bigr\rvert^{2}-\kappa\,\lvert Y\wedge v\rvert^{2}\Bigr)(\gamma_t)\,\mathrm{d}t\,\mathrm{d}\pi_f(\gamma).
\]

要强调的是这个路径指定与它的速度都不依赖 $Z$、不依赖试验场、也不依赖终端密度，后面 frames 那节正要靠这个公共终端指定在终端点取遍试验能量的下确界。

真正的新招是那个双因子。我配一个前向热势与一个后向密度因子、按给定终端密度归一，放进 entropic 插值框架（Leonard、Gigli--Tamanini）。两者乘积满足连续性方程。对对数势做演化得到一条 Riccati 恒等式，里面含反粘度 $1/c$ 的项彼此抵消。剩下的加速度误差必须一路一致控制到终端时刻，Bochner 不等式里那些奇异测度项也要一起管住。有粘度的中间估计写成：试验场满足 $Y_\delta=0$ 时

\[
H_{\phi_1^{c}+c\log f}(Y_1,Y_1)(f)\le\int_{\delta}^{1}\!\!\int \rho_t^{c}\Bigl(\bigl\lvert \partial_tY+\nabla_{v_c}Y\bigr\rvert^{2}-\kappa\,\lvert Y\wedge v_c\rvert^{2}\Bigr)\,\mathrm{d}m\,\mathrm{d}t+\varepsilon_c,
\]

其中 $\varepsilon_c\to0$。证明把 Riccati 演化从 $\delta$ 积到 $T<1$，初值配对为零，曲率项用假设 (B)，再靠 $2H_\theta(D_cY,Y)-\lvert H_\theta Y\rvert^2\le\lvert D_cY\rvert^2$ 收口，这里 $D_cY=\partial_tY+\nabla_{v_c}Y$。终端左端用一阶弱 Hessian 表达式去配对，靠端点迹的强局部 $L^2$ 收敛把两项都拉回 $L^1$。极限的次序是硬的：先 $c\downarrow0$，再让 $0<\lambda\downarrow0$ 去掉正终端扰动 $\lambda\bar f$。次序错一步，那些发散项就会漏回来。

奇异测度那关我不敢含糊。preliminaries 里 Bochner 测度不充电零 $2$-容量的集合，Sobolev 乘子要用准连续代表来评估；有界 Sobolev 乘子在强 $W^{1,2}$ 收敛、共同界与共同紧支撑下取子列，在零极集外收敛，控制收敛就能对固定的局部 Bochner 测度作积分。这一段是在乘奇异测度时才补进来的。分析输入则是一串热估计：Bakry 单边、反向 Poincaré、Laplace 估计、Li--Yau 推论，再加终端时刻的核比值、密度与低 Laplace 控制、后向 Fokker--Planck，以及带权二阶估计与那条加权 Bochner 恒等式。零粘度运输极限靠对数热极限、带一致矩尾的曲线紧合、作用量恒等式与其极限等式、公共校准路径与速度收束。作用量恒等式给我密度加权范数下速度的强收敛，而二次指标能量要的正是这个强收敛。

## §6 逆向之二：沿 exceptional time 的标架与径向 Hessian 界

热指标不等式把分布 Hessian 用全局试验场的能量界住了，可要把它变成真正能积分的径向比较，我得先解决标架问题。背景是一个满支撑非塌陷的 $\mathrm{RCD}(K,n)$ 空间，$m=\mathcal{H}^n$、$n\ge2$。前面几小节只用这套环境假设，它们的路径演算与试验逼近适用于具有有界位置、有界速度、在整段区间上压缩一致有界的最优测地线方案；截面张量下界只在径向应用那小节通过热指标定理进入。

困难在于：热指标界右端沿"固定终端"的校准测地线取值，要把 Jacobi 试验插进去，就必须在几乎每条校准测地线上、每个正时刻都持有标架。我在 §3 第四条错路里已经吃过亏：逐点正则不够。写 $\mathcal{R}_n$ 为那类点集，它的每个测度切空间都是归一化的 $n$ 维欧氏空间；非塌陷给出 $m(M\setminus\mathcal{R}_n)=0$、切模维数几乎处处为 $n$，再配上局部体积界与在紧区域上常数一致的局部 Poincaré。

修复的核心是可数调和标架命题。它给出一个可数紧支撑测试函数族 $\{g_j\}$、一个 $2$-容量为零的集合 $N$，以及 $\mathcal{R}_n\setminus N$ 中一个满足 $\mathcal{H}^{n-1}(S)=0$ 的 Borel 集 $S$，使得在 $\mathcal{R}_n\setminus(N\cup S)$ 的每一点，$\{\nabla g_j\}$ 里有 $n$ 个成员用共同的精确 Sobolev 代表算出的 Gram 矩阵正定；所有有限 Gram 矩阵在 $N$ 外半正定、秩不超过 $n$；任何预先指定的可数紧支撑测试函数族都能并进去。这个命题靠两条 content 估计撑起来：第一条说若局部 Hausdorff content 满足 $\mathcal{H}^{s}_\infty(E\cap B(x,r))=o(r^{s})$ 对每个 $x\in E$ 沿充分小的二进半径成立，就推出 $\mathcal{H}^{s}(E)=0$；第二条把一可数测试梯度族的 Gram 矩阵秩亏集的 content 用它的 Sobolev 能量压住。有了这两条，容量估计与有界压缩路径估计就能把异常集清掉，路径规避引理说明几乎每条整体的、有界速度且有界压缩的路径同时躲开那个零容量极集与那个 $\mathcal{H}^{n-1}$-零秩亏集，而 Deng 沿每条测地线切锥连续性的定理补上所有内部时刻的正则。平行输运我按 Caputo--Gigli--Pasqualetto 在非塌陷设定下沿测试方案的构造来拿，再在选定的标架里用有限维 Sobolev 常微分方程构造并逼近热指标要用的 Jacobi 试验。整个近似是逐路径的，只依赖一个可数的全局试验目录，我并没有去假设某个平行场的积分密度定理，这一点让工作量小了一大截。

把这些拢起来得到径向 Hessian 界。先把模型正弦 $\mathfrak{s}_\kappa$ 定义为 $\mathfrak{s}_\kappa''+\kappa\mathfrak{s}_\kappa=0$、$\mathfrak{s}_\kappa(0)=0$、$\mathfrak{s}_\kappa'(0)=1$ 的解。定理说：取定 $R_\kappa>0$，若 $\kappa>0$ 要求 $R_\kappa\sqrt{\kappa}<\pi/2$；对每个 $p\in M$，记 $r=d(p,\cdot)$、$q=r^2/2$，则对每个紧支撑测试梯度 $Z$，$\operatorname{Hess}q(Z,Z)$ 在 $B(p,R_\kappa)$ 上是一个带符号 Radon 测度，它关于 $m$ 的奇异部分非正，并且

\[
\operatorname{Hess}q(Z,Z)\le\Bigl(\lvert Z_{\parallel}\rvert^{2}+r\,\frac{\mathfrak{s}'_{\kappa}(r)}{\mathfrak{s}_\kappa(r)}\,\lvert Z_{\perp}\rvert^{2}\Bigr)m,
\]

其中 $\lvert\nabla q\rvert=r$ 几乎处处成立，在 $\{r>0\}$ 上 $Z_{\parallel}=\langle Z,\nabla q\rangle\,\nabla q/r^{2}$、$Z_{\perp}=Z-Z_{\parallel}$，在 $r=0$ 处右端系数按 $\lvert Z\rvert^2$ 解释；这个测度不等式对球上每个非负紧支撑 Lipschitz 权都成立，半径 $R_\kappa$ 与 $p$ 无关。

证明的骨架我这样理解：先用一个固定试验（比如 $Y_t=(t-\delta)Z/(1-\delta)$，能量记 $E_0$）从热指标界里提出一个测度，考察泛函 $f\mapsto\int E_0 f\,\mathrm{d}m-\operatorname{Hess}q(Z,Z)(f)$。公共终端指定在这里是命门：右端是对"关于终端点 $x$ 的函数"积分，不在若干条终于 $x$ 的路径之间取平均；这些路径的速度在重新加权下保持一致，因为它们与测试梯度的配对就是同一些测试函数沿路径的导数。有界压缩、有界速度、每个固定试验场的 $L^2$ 协变导数一起保证 $E_Y\in L^1_{\mathrm{loc}}$。随后在终端点把这个可数试验能量族取下确界，就得到上面那条带符号测度界。我特别在意的是它给的是"测度"界、奇异部分非正，并非某个 $L^2$ 张量界，这正好对上下一步弱 Hessian 定理的胃口。

## §7 逆向之三：从 Hessian 界到每条测地线与全局比较

最后一段要把径向 Hessian 测度界变成沿每条测地线的微分不等式，再变成三角形比较。唯一的新分析输入是那篇配套论文的一般弱 Hessian 定理。它的表述我照前提抄清：设 $(M,d,m)$ 是满支撑 $\mathrm{RCD}(K,N)$、$1<N<\infty$，$F$ 有界且整体 Lipschitz，$G$ 有界连续；若对每个紧支撑测试函数 $g$ 与每个非负 $h\in\operatorname{Lip}_c(M)$ 有 $H_F(\nabla g,\nabla g)(h)\le\int h\,G\,\lvert\nabla g\rvert^2\,\mathrm{d}m$，那么每条常速极小测地线 $\sigma$（长度 $\ell$）在 $(0,1)$ 上分布意义满足 $(F\circ\sigma)''\le\ell^2\,G\circ\sigma$。这里既不要求 $F$ 的 $L^2$ 可积、也不要求 $F$ 有 $L^2$ Hessian；配套证明与非塌陷假设、截面曲率假设都无关，用的还是同一个非正 Laplace 与同一套原始测试类。这解释了我为什么在 §3 第三条错路里放弃硬积分：那一关就交给这条定理。

改造后的模型距离定义为 $\mathfrak{m}_\kappa(r)=\int_0^r\mathfrak{s}_\kappa(s)\,\mathrm{d}s$，按符号分三支：

\[
\mathfrak{m}_\kappa(r)=\begin{cases}(1-\cos(\sqrt{\kappa}\,r))/\kappa,&\kappa>0,\\[2pt] r^{2}/2,&\kappa=0,\\[2pt] (\cosh(\sqrt{-\kappa}\,r)-1)/(-\kappa),&\kappa<0.\end{cases}
\]

它满足 $\mathfrak{m}_\kappa'=\mathfrak{s}_\kappa$ 与 $\mathfrak{s}'_\kappa=1-\kappa\,\mathfrak{m}_\kappa$。有了它我可以把无界的模型距离在远处压平。取一个光滑不增的截断 $\theta$，在 $[0,a^2/2]$ 上为 $1$、在 $[b^2/2,\infty)$ 上为 $0$，令 $\chi(0)=0$、$\chi'(q)=\theta(q)\,\mathfrak{s}_\kappa(\sqrt{2q})/\sqrt{2q}$、$F_p=\chi(q)$，那个商在零处用幂级数光滑延拓。于是 $F_p$ 有界、整体 Lipschitz、在 $B_b(p)$ 外为常数，它未必属于 $L^2(m)$，可有界加有界梯度正是这条弱 Hessian 定理要的假设。弱链式给出

\[
H_{F_p}(Z,Z)(h)=H_q(Z,Z)(h\chi'(q))+\int h\,\chi''(q)\,\langle\nabla q,Z\rangle^{2}\,\mathrm{d}m .
\]

这一步只涉及 $q$ 的一阶导数，所以对分布 Hessian 也成立；局部截断把第一项留在 $B_{R_*}(p)$ 内。对 $r>0$ 记 $Z_r=\langle\nabla q,Z\rangle/r$，由 $r$ 的 Lipschitz 界得 $\lvert Z_r\rvert\le\lvert Z\rvert$。用上节的 Hessian 比较与 $\chi'\ge0$，右端被 $\int h\,[A(r)\lvert Z_r\rvert^2+B(r)(\lvert Z\rvert^2-\lvert Z_r\rvert^2)]\,\mathrm{d}m$ 控制，其中 $A(r)=\theta(r^2/2)\,\mathfrak{s}'_\kappa(r)+r\theta'(r^2/2)\,\mathfrak{s}_\kappa(r)$、$B(r)=\theta(r^2/2)\,\mathfrak{s}'_\kappa(r)$，两者连续延拓满足 $A(0)=B(0)=1$、在 $r\ge b$ 处归零。因为 $\theta'\le0$、$\mathfrak{s}_\kappa\ge0$ 于 $[0,b]$，所以 $A\le B$：把距离压平添的是一个非正的径向项。$H_q(Z,Z)$ 的非正奇异部分乘上 $\chi'$ 仍非正。于是有界连续函数 $G_p(x)=\theta(r(x)^2/2)\,\mathfrak{s}'_\kappa(r(x))$ 全局给出那条 Hessian 假设，且在 $r<a$ 上等于 $\mathfrak{s}'_\kappa(r)=1-\kappa F_p$。

把这些喂进弱 Hessian 定理：对每条落在 $B_a(p)$ 里、长度为 $\ell$ 的测地线 $\sigma$，$y(t)=\mathfrak{m}_\kappa(d(p,\sigma_t))$ 满足 $y''+\kappa\ell^2 y\le\ell^2$。取周长小于 $a$ 的三角形 $[pxy]$，$\sigma$ 是它从 $x$ 到 $y$ 的一条边，沿两条过顶点路线的三角不等式保证 $d(p,\sigma_t)<a$，于是模型不等式整条边都成立。曲率 $\kappa$ 二维模型里的比较三角形在此尺度存在，对应边 $\bar\sigma$ 由模型余弦定律给 $\bar y(t)=\mathfrak{m}_\kappa(d(\bar p,\bar\sigma_t))$，$\bar y''+\kappa\ell^2\bar y=\ell^2$ 且 $\bar y$ 与 $y$ 同端点值，退化三角形由连续性同样成立。令 $h=y-\bar y\in H^1_0(0,1)$，则 $-h''-\kappa\ell^2 h\ge0$。用负部 $h_-$ 检验得 $\lVert (h_-)'\rVert_2^2\le\kappa\ell^2\lVert h_-\rVert_2^2$。若 $\kappa\le0$ 这直接逼出 $h_-=0$；若 $\kappa>0$，尺度选择给 $\kappa\ell^2<\pi^2$，Dirichlet Poincaré 给同一结论。$\mathfrak{m}_\kappa$ 严格增，所以 $d(p,\sigma_t)\ge d(\bar p,\bar\sigma_t)$，即每边都满足点在边上比较。

局部到整体我按四点到全局那条路走。固定 $o$，取 $r>0$ 使 $20r<a$。点在边上比较让短铰链的比较角对任一径向参数不增，其极限定义出角度且不小于比较角，相邻角不等式来自模型粘贴引理。对 $B_r(o)$ 里四点 $p,x,y,z$，在 $(p,z)$ 上取 $w$ 使 $d(p,w)<r$，从 $w$ 到这些点的径向腿长不超过 $3r$，所以每个用来比较的三角形周长至多 $12r<a$。把方向 $wp$ 插进 $wx$ 与 $wy$ 之间做角度三角不等式，所得项与 $wz$ 配成两个相邻角和、各自不超过 $\pi$；每个比较角不超过对应真实角，故三个比较角之和不超过 $2\pi$。令 $w\to p$，比较角连续就得局部四点不等式，这是把 AKP 里那个逆定理逐点定域化，所有线段都是环境里的极小线段，不需要任何度量球的凸性。由局部四点判据得 $M$ 局部 $\mathrm{CBB}(\kappa)$，再用完备性与长度空间的全球化定理得全局 $\mathrm{CBB}(\kappa)$。维数收尾很简单：$m=\mathcal{H}^n$ 在有界集上有限且满支撑，故每个非空有界球都有正的有限 $n$ 维 Hausdorff 测度、进而 Hausdorff 维数为 $n$，可数控竭给 $\dim_{\mathcal H}M=n$。

## §8 最终思路与最初设想的差异

我把最终证明跟动笔前的直觉逐条对齐，差异几乎每一步都有。

第一条，参考测度。我起初以为任何与 $\mathcal{H}^n$ 等价的测度都行，反正合成里奇条件对测度的等价类不敏感。真正做逆向时才发现必须取精确的 $\mathcal{H}^n$：非塌陷结构、几乎处处 $n$ 维欧氏切空间、切模维数为 $n$、局部体积 $c\,r^{n}\le m(B_r(x))\le C\,r^{n}$ 这一串全都系于精确测度；维数结论本身也要靠"$\mathcal{H}^n$ 在每个非空有界球上正且有限"才能数出 $\dim_{\mathcal H}M=n$。取等价测度会把尺度与这些界一起弄丢。

第二条，测试类的原型。Gigli 给的原始测试函数类要求有界整体 Lipschitz 代表加上 $\Delta f\in W^{1,2}$，测试向量场是有限个 $a_j\nabla b_j$。我一开始想把它缩到紧支撑，或退到某个正则开集上的经典张量，两条都被 §3 挡回来了。定理既不是正则子集上经典张量的陈述，也不是对紧支撑场的限制，它是对整体测试类成立的分布陈述。

第三条，非约化与带边界。正向引用 Alexandrov 到 $\mathrm{CD}$ 那一套时，我用的是对任意 $\kappa$、含带边界 Alexandrov 空间都成立的非约化版本，它只要 $\mathcal{H}^n$ 局部有限；逆向把非约化 $\mathrm{CD}$ 当假设，于是引用那些写成 $\mathrm{RCD}^*$ 的分析结果时既不改动 $K$ 也不改动 $N$。这个约定我在 preliminaries 里反复确认过。

第四条，试验目录可数。我原担心要把 Jacobi 试验做成连续族、需要一个平行场的积分密度定理。落定的版本只要一个可数的全局试验目录，逼近逐路径进行；公共终端指定让下确界在终端点上取，省掉连续族的整套机器。

第五条，最后一步是模块化的。从 Hessian 界到每条测地线那步整个外包给配套论文的一般弱 Hessian 定理，它对所有满支撑 $\mathrm{RCD}(K,N)$、$1<N<\infty$ 成立，连塌陷空间也算，证明只用到有界测度改变与一条闭的加权 Bochner 不等式，跟我这篇的刻画或标架构造没有依赖关系。我把这层独立性当作架构上的安全垫，正文只以精确前提复述它。

第六条，范围与对照。这里解决的是 $n\ge2$，一维曲线情形本就退化。平滑设定里 Ketterer--Mondino 用支撑在低维可求积集上的熵不等式刻画截面与中间 Ricci 下界，而我这边的运输计算把满维密度与 Gigli 的分布张量配对，两套胃口不同。前向与逆向拼起来才是 main 里那四行收束。frames 前两小节那套标架与逐路径试验构造另有独立适用面：在满支撑非塌陷 $\mathrm{RCD}(K,n)$、$m=\mathcal{H}^n$、整数 $n\ge2$ 上，对位置、速度、压缩都在相关区间内有界的最优测地线方案成立，可数全局试验目录做逐路径逼近。

## §9 量级与极限次序自查

这一节不证新东西，只把各步的常数、量级与取极限的顺序再钉一遍，免得把形式对而量级错的东西当成定理收下。

前向那条平均恒等式里，$\tfrac{1}{6}$ 与 $\tfrac{1}{2}$ 两个系数我核对过出处：配凑平方给出 $K_{AB}=\tfrac12\int_0^1\bigl[P(C_s,C_s;D,D)-\int f\lvert Q_s+\nabla_{C_s}D\rvert^2\bigr]$，再用 $T=\mathbb{E}P(A,A;A,A)$、$S=\mathbb{E}P(A,A;B,B)$、$H=\mathbb{E}P(A,B;A,B)$ 三个平均量，靠独立性与符号对称杀掉随机场出现奇数次的项、靠可交换性合并其余，四阶展开整理出 $\tfrac16\mathbb{E}R(A,B,B,A)(f)$ 与非负平方 $\tfrac12\mathbb{E}\int f\lvert\nabla q_{AB}+\nabla_A(B-A)\rvert^2$。这两个数具体为何落在 $\tfrac16$ 与 $\tfrac12$，我只追到"由展开的组合系数而来"这一层，再细的算账我标 [推测]，因为正文把它当作已算完的引理引用。决定成败的定性事实是：幸存误差是带正权 $f$ 的平方，于是局部梯度测试能把它压到任意小，剩下的是把夹逼两头接上。

热指标里的极限顺序是硬的。有粘度估计的余项 $\varepsilon_c\to0$；Riccati 演化从 $\delta$ 积到 $T<1$ 时初值配对为零，加速度误差靠 $\lVert e_c\rVert_{L^1(\delta,1)}$ 对一切 $T<1$ 同界一致压住；终端处理是先固定 $c$ 令 $T\uparrow1$，再令 $c\downarrow0$，最后令 $0<\lambda\downarrow0$ 去掉正终端扰动 $\lambda\bar f$。次序一颠倒，反粘度项或终端扰动就会漏回不等式。二次指标能量要的是速度在密度加权范数下的强收敛，这一步由作用量恒等式与其极限等式给出，弱收敛在这里不够用。Bochner 侧的量级我用 preliminaries 那条 $\lVert H_g\rVert_2^2\le\lVert\Delta g\rVert_2^2+\max\{-K,0\}\lVert\nabla g\rVert_2^2$ 与 Bakry 梯度界 $\lVert\nabla g_t\rVert_\infty\le\lVert\chi\rVert_\infty e^{-Kt}\lVert\nabla(\zeta g)\rVert_\infty+\lVert\nabla\chi\rVert_\infty\lVert\zeta g\rVert_\infty$ 兜底。

标架那节的量级是几何测度的：秩亏集满足 $\mathcal{H}^{n-1}(S)=0$、极集的 $2$-容量为零，content 判据沿二进半径 $\mathcal{H}^{s}_\infty(E\cap B(x,r))=o(r^{s})$ 就够；径向定理的半径 $R_\kappa$ 与 $p$ 无关，$\kappa>0$ 时要 $R_\kappa\sqrt{\kappa}<\pi/2$。

比较那节的尺度链要一格扣一格：从 frames 给的 $R_*=R_\kappa$ 出发取 $0<a<b<R_*$，$\kappa>0$ 时再要 $b<\pi/(2\sqrt{\kappa})$；局部化取 $r$ 使 $20r<a$，四点论证里每个三角形周长至多 $12r<a$；Poincaré 逼零靠 $\kappa\ell^2<\pi^2$。这些不等式彼此咬合，任何一格放太松，都会在 $\kappa>0$ 那一支让比较三角形不存在。我把 $r=0$ 处系数解释为 $\lvert Z\rvert^2$、以及 $\mathfrak{m}_\kappa$ 严格增这两点单独确认过，它们保证测度界与点到边比较在退化处也站得住。

## §10 几处支撑引理的细读

我把前向的误差消除与逆向的终端一致性这两处最容易被略过的支撑引理单独读一遍，因为它们决定整条估计能不能收尾。

前向在配凑平方之后，还剩一个带权 $f$ 的非负平方 $\tfrac12\mathbb{E}\int f\,\lvert\nabla q_{AB}+\nabla_A(B-A)\rvert^2$ 要靠局部选取压小。forward 第 915 行那条权重半凹逼近引理，用有限多个梯度方向上的 Sobolev 对偶势在半凹意义下逼近 $f\ge0$，从而把配对系数拆开处理；紧接着第 978 行那条"有限个梯度选择的逼近"把概率律收窄到有限支撑，使 $\mathbb{E}$ 成有限和，独立性与符号对称仍旧够用。到第 1086 行，固定梯度族上系数连续，保证 $R(\cdot)$ 的取值随梯度强 $L^2$ 收敛而连续；第 1171 行再把局部逼近升级到强二阶导收敛。这几步合力把"梯度方向不等式"抬到"整体测试类不等式"，最后第 1255 行的 remark 把极限次序钉死。我核对时的担心是穷竭与局部逼近会不会互相打架，preliminaries 第 53 到 86 行那条逼近引理给了界与 $R$ 无关的截断 $\chi_R$，正是它让我敢在紧区域上强 $L^2$ 逼近 Hessian 而不丢常数。

逆向这边，热指标界对每个满足 $Y_\delta=0$、$Y_1=Z$ 的试验场给右端能量，可要让下确界在终端点上取，就得有一批全局端点条件一致的试验。frames 第 548 行那条"带指定全局端点的可数试验"把可数标架族 $\{\nabla g_j\}$ 的梯度组合成端点落在指定 $Z$ 上的试验场，靠的是标架在终端的秩；第 654 行终端梯度迹引理确认这些试验在终端点的速度迹与 $Z$ 一致，于是公共校准路径（heat 第 1218 行那条）在不同终端密度下给出同一条终于 $x$ 的路径与同一个速度。我把这两条连起来读才明白 §6 里那句"公共终端指定是命门"的分量：右端确实只是关于 $x$ 的函数 $E_Y(x)$，路径不平均、速度不漂移，取遍可数试验的下确界才保得住非正奇异部分。一旦终端迹对不上，下确界会把不同速度的能量混在一起，测度界的符号就守不住。

我还特意回看了 preliminaries 第 198 到 214 行的弱 Hessian 定义 $H_F(Y,Y)(\xi)$，它写成两项积分、只要求 $\nabla F$、$\operatorname{div}(\xi Y)$、$\nabla_YY$ 局部 $L^2$ 且 $Y,\xi$ 有界，对固定的 $Y,\xi$ 在 $F$ 的弱局部 $W^{1,2}$ 收敛下连续。正因为这个定义先于任何 $L^2$ 张量存在，frames 那条测度界才能只声明"带符号 Radon 测度、奇异部分非正"，而 comparison 的弱 Hessian 定理也才敢只吃"$F$ 有界整体 Lipschitz、$G$ 有界连续"。这三处的定义口径必须完全对齐，差一点就会让某一步的检验函数类不闭合。

## §11 信息不足与 [推测] 汇总

这一节把 build 层素材留白、我不愿硬编的地方集中登记，凡推断都标 [推测] 并说清为什么不足。

署名与归属：main 与 preamble 的作者字段都是机构署名，真实作者身份无法从源码断定，我一个字也不猜，凡涉及"谁做的"一律留空。

一般有限概率律：forward 只说计算仅依赖独立性与符号对称，却没解释为何不直接把律取成 $U,-U,V,-V$ 上的均匀分布。[推测] 取一般律是为了让"有限个梯度选择"逼近引理在把律收窄到有限支撑时仍保持封闭，源码没给这条额外理由，我只能标出动机缺口。

配凑系数 $\tfrac16$、$\tfrac12$ 的组合来源：我只读到"由四阶展开与平均组合而来"，逐项计数在这份 build 里没有铺开，[推测] 它们来自 $T,S,H$ 三个平均量在可交换与符号对称下的配对数，精确计数我复现不出。

配套定理的证明内容：weight:every-geodesic 背后的有界测度改变与闭加权 Bochner 不等式不在这份 build 里，我拿到的只是它被复述的接口，因此当 oracle 使用；其内部结构 [推测]、且明确超出单篇取材范围。

Deng 切锥连续性定理的精确陈述：源码在 §6 用到处引用它补内部时刻的正则，我给的是它承担的角色，完整前提写在另一篇里，[推测] 其结论足以把 $\mathcal{H}^{n-1}$-零秩亏之外的每个内部时刻纳入公共标架。

带边界 Alexandrov 空间在逆向一侧：正向靠 Kapovitch--Ketterer--Sturm 覆盖任意 $\kappa$ 含带边界的非约化，逆向我只看到完备性加长度空间走全球化，没有边界专项处理。[推测] 边界情形被逆向的局部四点判据自动吞掉，理由是比较全用环境里的极小线段、不依赖任何球的凸性，源码未把这点单列。

外部定理的版本编号：intro 末尾声明外部结果按其在文献中的编号引用、必要时用版本注记说明与已刊编号的差异，所以正文里像 Theorem 2.9、Corollary 2.10 这类号可能不等同于已刊号，我只照抄源码给出的号，不去远端核对。

极限次序 remark：fwd:limit-order 我只从 §9 的量级与章节结构推知次序为"局部逼近、穷竭、回到全局类"，逐条极限没全读，标 [推测]。

顺手把"这条等价若成立必须先有什么"记下来，免得日后误改前提。逆向若成立，先要非塌陷（即精确 $m=\mathcal{H}^n$）供逐时刻标架与 $n$ 维欧氏切锥，先要一条把分布 Hessian 界转成曲线二阶不等式的一般定理，先要模型距离能被压平成有界整体 Lipschitz，先要比铰链比较角单调继而四点到全局。前向若成立，先要 Alexandrov 三角形比较能给出短流能量的四阶展开，先要运输展开与几何比较界住同一个能量差，先要端点二阶修正把径向加速度误差消干净。这些必要条件我都在正文相应处找到了对应构造，缺一处整条链就断，这也是下面台账把每步"若改动断在哪一步"逐行钉住的原因。

## §12 前向：我试过的候选与运输展开的量级

把正向当成一次真正的搜索来复盘，我先后设想过三条比较能量的路子，只有积分构型这条走得通。

候选一是最朴素的"直接比两条短流"：给定梯度方向，各自跑一个有界紧支撑测试场 $S_A$（forward 第 94 到 95 行说这类场带界散度、提供二阶修正），比较它们的作用量。它卡在配对系数上，Hessian 系数只在 $L^2$ 意义存在，两个裸作用量相减的低阶项不收敛，逼我去把这些作用量对"被运输的密度"做积分，让展开里出现一个一阶可估的插值密度，才谈得上和固定的 $L^2$ 系数配对。这也是 intro 第 152 到 164 行反复强调"展开对被运输密度积分"的原因。

候选二是单参数展开，不做符号对称。它卡在奇次项：只沿一个场 $A$ 扰动时，能量展开里 $A$ 的奇数次幂项留下来，把截面表达式污染掉。我改成在 $u\mapsto -u$ 不变的有限律上取平均，用第 80 到 84 行那条中心化 $\mathbb{E}A=0$、$\mathbb{E}\lvert A-B\rvert^2=2\mathbb{E}\lvert A\rvert^2$，奇次项一次性全消，混合对 $A,B$ 才干净地给出 $\lvert A\wedge B\rvert^2$。为什么恰好要成对的 $A,B$ ，并非一族彼此正交的场，我只能标 [推测]：源码的算账只用到独立性与符号对称，看不出它对正交性有额外要求。

候选三是把截断做在测试场，并非密度上，直接要求场紧支撑。它跟 §3 第二条死路同一个下场：$m=\mathcal{H}^n$ 总质量可能无穷时常数不在测试函数类，紧支撑与整体测试类打架。最后走通的版本是"几何侧的四阶构型不等式给下界、对偶运输给上界"。第 232 行那条四阶构型不等式把"$2$ 倍平均径向作用减平均配对作用"从 Alexandrov 三角形比较里按短流参数的四阶量提出来；为什么领头阶落在四阶，并非二阶，[推测] 是截面曲率本身是度量的二阶层量、而平均又消掉一阶与三次，源码没把这条阶数账单独写出来。

上界这边，第 381 行的最优密度一阶变分给出插值密度随势的一阶导，第 562 行的对偶展开与径向亏量把上界拆成曲率项加一个径向加速度误差，误差再交回第 691 行那条配凑平方（我在 §4、§9 已细读）收拾。我印象最深的是整套估计的不对称：下界纯粹几何、上界纯粹运输，两边界的是同一个能量差，平均把低阶抹平，端点修正把幸存系数认成 Gigli 张量加非负平方。这个"两边夹一个共同差"的结构，是我判断正向有没有证完的最硬标尺。

## §13 逆向：热指标这一步我绕过的弯

逆向第一步要把张量下界换成沿校准测地线的指标不等式，这里我设想过几个都失败的方案，失败点各不相同。

失败一是只用一个前向热因子。$Q_tu$ 本身给出一个光滑化的势，可它的终端测度由 $u$ 决定、并不是我后来要的那种"以 $f\,\mathrm{d}m$ 为终端密度"的方案。指标不等式的右端必须是对某个满足终端条件的运输方案的积分，单前向因子给不出正确的终端权。修法是再配一个后向密度因子、按给定终端密度归一，落进 entropic 插值框架（intro 第 166 到 176 行明说了这套 Leonard、Gigli--Tamanini 的用法），两因子的乘积满足连续性方程，于是 $\pi_f=S_{\#}(fm)$ 有界速度、在每个 $[\delta,1]$ 上有界压缩。

失败二是对合并后的势直接取对数走 Riccati，指望一步到位。真算下去，$\phi_1^c+c\log f$ 里那 $1/c$ 的反粘度项在终端附近发散，Bochner 不等式带出来的奇异测度项也跟着发散，第 737 行那条反粘度抵消与第 779 行的正测度分裂，说的正是这两个 $1/c$ 项在两因子结构里互相抵消、抵消后剩下的正部要单独成测度来管。我一开始漏掉了后向因子，就根本看不到这对抵消。

失败三是把终端时刻的极限当成可以随便取。第 872 到 884 行的有粘度估计给余项 $\varepsilon_c\to0$，可它只保证 $T<1$ 时的界，终端左端要用一阶弱 Hessian 表达式配端点迹（第 889 到 893 行的 $2H_\theta(D_cY,Y)-\lvert H_\theta Y\rvert^2\le\lvert D_cY\rvert^2$ 收口），极限次序先固定 $c$ 令 $T\uparrow1$、再 $c\downarrow0$、再 $\lambda\downarrow0$。次序错一步，反粘度或终端扰动就漏回不等式。这条我在 §9 已经钉过，这里补上它是被哪个失败方案逼出来的。

失败四最隐蔽：我以为弱收敛的速度就够算右端。可右端能量是二次的 $\lvert\partial_tY+\nabla_vY\rvert^2$，速度只弱收敛的话二次配对会丢下极限的不等号方向。热指标靠第 1098 行起那条作用量恒等式与其极限等式，把速度提升到密度加权范数下的强收敛，二次能量才站得住；这也解释了为什么要把公共校准路径（第 1218 行）单独立出来，多条终于同一点的路径若被平均，速度就不再一致。

绕完这几个弯我才认下最终形态：一个校准 $u$ 决定一族公共终端路径，两因子连续性方程给方案，Riccati 加反粘度抵消给逐时刻不等式，作用量恒等式给强收敛，奇异 Bochner 测度靠准连续乘子与容量兜底。它跟我最初"取个热核的对数就完事"的设想差了一整层运输结构。

## §14 哪些是外借的、哪些是这篇新造的

写到收尾，我要把整篇的证据来源分成两堆，因为这直接决定某处改动会波及多远。

外借的分析底座有这些：Alexandrov 到合成里奇那一套曲率维数与无穷小希尔伯特性（Petrunin、Zhang--Zhu、Kuwae--Machigashira--Shioya），以及带边界情形的非约化整体版本（Kapovitch--Ketterer--Sturm）；非塌陷给 $n$ 维欧氏切空间与几乎处处切模维数 $n$（DPG 那条）；沿测试方案的平行输运（Caputo--Gigli--Pasqualetto）；沿每条测地线的切锥连续性（Deng）；四点到全局的 Alexandrov 判据与全球化（AKP）；分布曲率张量的代数性质与张量性（Gigli 原著那条 Proposition）；还有配套论文那条一般弱 Hessian 定理。这些我都在相应小节按精确前提复述、不去重证，改它们等于改外部文献。

这篇新造的四块，正好对应四个关键转折：正向把 Alexandrov 三角形比较拆进被运输密度的四阶展开、用符号对称平均与平方配凑把幸存系数认成 Gigli 张量加非负平方；热指标那节用双因子连续性方程与 Riccati 反粘度抵消，把张量下界换成沿校准路径的指标不等式；标架那节用可数调和标架、content 与容量、逐路径逼近，把指标界升级成径向 Hessian 带符号测度界；比较那节把模型距离压平成有界整体 Lipschitz 再喂进配套定理，落到四点到全局。这四块任何一块的前提被改，等价性的对应半边就断，这也是台账逐行标"若改动断在哪一步"的用意。

关于塌陷与非塌陷的分工我特意厘清一次：frames 前两小节只用满支撑非塌陷 $\mathrm{RCD}(K,n)$、$m=\mathcal{H}^n$、整数 $n\ge2$ 这套环境，对位置、速度、压缩在相关区间内有界的最优测地线方案都成立，截面下界只在径向那一小节通过热指标进入；所以标架与逐路径试验这套机器本身有独立适用面，不绑死在刻画猜想上。塌陷空间只在最后一步被配套定理接纳，那条定理对一切满支撑 $\mathrm{RCD}(K,N)$、$1<N<\infty$ 成立，含塌陷；可它上游的 heat-index、frames 全都要非塌陷与精确 Hausdorff 测度，所以整条逆向里塌陷的出现范围被夹得很死。

关于 $\mathrm{RCD}$ 与 $\mathrm{RCD}^*$：preliminaries 交代召回的分析结果在 $\mathrm{RCD}^*$ 下同样成立，而本文在主定理的非约化假设下使用它们；逆向把非约化 $\mathrm{CD}$ 当假设，于是引用写成 $\mathrm{RCD}^*$ 的结果时既不改动 $K$ 也不改动 $N$。维数参数上 $N=n$ 配 $m=\mathcal{H}^n$ 才触发非塌陷，这条我在 §8 已强调，它和局部体积界、切模维数、维数结论是一条线上的三件事。带边界情形在正向由非约化版本覆盖，逆向我依赖完备加长度空间走全球化，边界没单列处理，[推测] 因四点判据全程只用环境极小线段而自动兼容。把这层"外借与新造"的边界画清，我才有把握说：这篇真正推进的，是把 Gigli 那个只有代数对称性的分布张量，接上了三角形比较这条几何命脉。

## §15 从初读到定形的思维时间线

这一节不复述证明，只记录我脑子里这套论证被推翻与重建的顺序，以及若它哪里出错我会先查哪。

第一段信念是"截面曲率应当逐点成立"。我几乎下意识地在光滑开集上验证 Gigli 泛函退化、再取弱极限。它在第一次碰非光滑时就散了：没有图册、没有经典张量、弱极限那套是另一框架。散了之后我被迫接受一个改述：分布张量对整体测试类的取值本身才是对象，比较几何得从它内部长出来。这个观念切换是后面所有构造的起点，我在 §3、§8 反复确认它。

第二段信念是"紧支撑就够"。它在我想用常数函数配对时崩掉，逼出 §3 第二条里那条截断 remark。我由此学会把每个裸梯度都当局部对象处理，全局类是硬约束、不能图省事。

第三段信念是"a.e. 正则等于路径正则"。它在标架问题上崩得最彻底：路径会在某个内部时刻撞进零测坏集。我于是把"可数试验目录加容量加路径规避加切锥连续性"当成一整块来读，读完才明白 §6 里那个 $\mathcal{H}^{n-1}(S)=0$ 的秩亏集与零容量极集是被同一批引理一起压掉的，任何一环缺了，终端下确界就不是对单个 $x$ 的能量函数。

第四段信念是"热核取对数一步到位"。它在终端奇异性上崩掉，逼出双因子、反粘度抵消与作用量强收敛这条我完全没预料到的链。到这里我的方法论已经变了：凡遇发散，先找一个能让发散项成对抵消的结构，再谈极限次序。§5、§13 就是这条方法的落地。

第五段信念是"分布 Hessian 界能自己积成测地线凹性"。它撞在 Brena--Gigli 的正则性缺口上，我把整步交给配套定理。交出去之后我才敢回头做模型距离压平，因为配套定理只吃有界整体 Lipschitz 的 $F$，§7 的 $\chi$ 构造正是为这个接口量身做的。

回看这五段，真正的新东西不在任何单独估计里，而在"把度量的二阶信息先转成运输/热的能量配平、再转成测度界、最后才碰几何比较"这条转译链上。若让我假设它某处出错并先查，顺序会是：第一查前向那个非负平方的局部压小是否真能在穷竭下保持一致界（这是 §10、§12 的软肋）；第二查热指标的极限次序 $T\uparrow1$、$c\downarrow0$、$\lambda\downarrow0$ 有没有被偷偷交换（§9、§13 反复钉过）；第三查标架公共终端指定下的速度一致性，一旦平均了终于同一点的多条路径，二次能量就塌（§13 失败四）；第四查配套定理接口在 $\kappa>0$ 时 $b<\pi/(2\sqrt{\kappa})$ 与 Poincaré 的 $\kappa\ell^2<\pi^2$ 是否同一尺度（§7、§9 咬合处）。这四查覆盖了整条链最脆的四节，我把它们当作日后复审的入口。

## §16 运输与热两侧的量级怎么落地

概念讲完，我把两个最容易虚的环节按量级重过一遍，让"界得住"变成"数得过来"。

先是局部体积与压缩这一头。非塌陷给每个紧区域、每个充分小的上半径上 $c\,r^{n}\le m(B_r(x))\le C\,r^{n}$，常数对区域内中心一致；上界是非塌陷密度界，下界来自 Bishop--Gromov 加满支撑。这条是我敢把"关于 $x$ 的能量函数"当成 $L^1_{\mathrm{loc}}$ 对象的地基：径向能量 $E_Y(x)$ 在球内可积，靠的就是它加上方案的速度有界、压缩有界。我在 preliminaries 第 298 到 300 行特别记下：有界压缩只在已证得正时刻压缩估计的子区间上使用，Dirac 端点处我不假设有界压缩。这个保留很实在，终端若是单点测度，密度比会炸，热指标那节才把一切压缩估计都关在 $[\delta,1]$ 上、$\delta>0$。

再看两因子的对数量级。前向势 $\phi_t^c$ 与后向密度 $\rho_t^c$ 的对数势给出 Hamilton--Jacobi 型关系，初值配对在 $t=\delta$ 处归零，于是 Riccati 演化从 $\delta$ 积起时左端只剩终端项。终端时刻的核比值把 $\rho$ 与 $f$ 的比控制在有界带正下界，密度与低 Laplace 那条估计把 $\rho\,\Delta b$ 型余项统一压进 $\int_\delta^1\!\int_E\rho\,\lvert\Delta b\rvert^2$ 与其配对的 $\int\int\rho\lvert\ell_t\rvert^2$ 的几何平均，令 $\delta$ 固定时随粘度衰减到零。我在 heat 第 860 到 869 行读到这段收尾：Sobolev 余项在 $(\delta,1)$ 上按绝对值估，剩下的测度贡献用 $\lVert e_c\rVert_{L^1(\delta,1)}$ 从下方界住，丢掉非负项后同一误差对一切 $T<1$ 成立。这条 $\lVert e_c\rVert_{L^1(\delta,1)}$ 是我判断"加速度误差是否真的一致可控"的量化抓手，只要它随 $c$ 有界，终端极限就不虚。

Bochner 奇异测度那侧的量级我按准连续与容量来记：$\Gamma_2(g)$ 有两个版本，一个带 $\lvert H_g\rvert^2$、一个带 $(\Delta g)^2/N$，我从两者分别用或取凸组合，绝不用把两个平方项系数都写成 $1$ 的那种不等式；Bochner 测度不充电零 $2$-容量集，Sobolev 乘子要用准连续代表评估。有界 Sobolev 乘子在强 $W^{1,2}$ 收敛、共同界、共同紧支撑下取子列在零极集外收敛，配控制收敛就能把分部积分从测试乘子扩到有界 Sobolev 乘子，也让"几乎处处下界"提升到准连续代表在零极集外成立。这一段是在 heat 那节乘奇异测度时才必须补的，我把它当作把测度界喂进带权估计前的固定工序。把这些数一遍之后，我对 §5、§6 的定性叙述就有了可对表的量级底。

## §17 main 收束证明与六节点链条的对应

main 末尾只有四行收束，我要核对它跟正文六节点链条是不是真的一一对上，免得某行把一件重活轻描淡写带过。

正向那两行说：若 (A) 成立，Alexandrov 到 RCD 那定理给出以 $\mathcal{H}^n$ 为参考测度、满支撑的 $\mathrm{RCD}((n-1)\kappa,n)$；前向曲率定理再给出所述分布截面曲率不等式，于是 (B) 成立。这里第一行其实压缩了两件外部重活，曲率维数与无穷小希尔伯特性，它把 (B) 前半整块从源码搬走，我在 forward 第 20 到 27 行读到它对任意 $\kappa$ 含带边界都成立、只要 $\mathcal{H}^n$ 局部有限。第二行才是这篇自证的部分。

逆向那两行说：在 (B) 下，热指标定理给出指标不等式，径向 Hessian 定理把它变成分布 Hessian 比较，加权比较定理给出 Alexandrov 下界 $\kappa$ 与维数 $n$，于是 (A) 成立。它把 figures 那张 tikz 的六个方框（整体分布截面下界、热指标不等式、径向 Hessian 带符号测度界、有界整体距离改造、每条测地线的模型 ODE、三角形比较与全局 $\mathrm{CBB}$）压成三个定理调用。我核对了压缩是否无损：热指标定理吃掉第一、二框，径向 Hessian 定理吃掉第三框，加权比较那节里 distance-modification 吃第四框、every-geodesic 吃第五框、alexandrov 吃第六框。所以四行没漏框，只是把同节里相邻的框合并叙述。

我还确认维数结论藏在倒数第二个环节之内，并非额外补的：比较那节末尾用"$\mathcal{H}^n$ 在每个非空有界球上正且有限、进而维数为 $n$"收尾，收束证明里那句"维数 $n$"就是引它。满支撑与测度则来自非塌陷底座，全程一致。这样看下来，main 的四行是正文链条的忠实摘要，没有哪一行偷偷借了没在前文出现的引理。

## §18 哪几条外部结果是承重的

把参考文献按"承重节点"排一遍，能让我判断改哪条会牵动多远。这些引用我都是从 introduction 与 preliminaries 的实际 \cite 记号里读到的，不另找来源。

合成里奇底座靠 Lott--Villani 与 Sturm 两篇独立工作把熵沿 Wasserstein 测地线的凸性变成 $\mathrm{CD}(K,N)$，再由 Ambrosio--Gigli--Savar\'e 用二次 Cheeger 能量挑出黎曼类得 $\mathrm{RCD}(K,\infty)$；Ambrosio--Gigli--Mondino--Rajala 把参考测度放宽到有界集有限并去掉原定义里加强的熵条件。这三块撑起张量得以定义的那个希尔伯特式 Sobolev 演算，缺任何一个，测试类与曲率泛函都不成立。

把 Alexandrov 与曲率维数条件连起来的是 Petrunin 与 Zhang--Zhu，黎曼结构由 Kuwae--Machigashira--Shioya 的二次 Sobolev 理论供，含带边界的非约化整体陈述记在 Kapovitch--Ketterer--Sturm 的 Theorem 2.9 与 Corollary 2.10。这几条是正向第一行的全部依赖。分布张量本身、它的对称性与张量性、以及本篇要证的猜想，都在 Gigli 原著，尤其 Conjecture 1.1 与那条给出 $R(aX,\cdot,\cdot,\cdot)(f)=R(X,\cdot,\cdot,\cdot)(af)$ 的命题；它给了张量、却没给张量下界与三角形比较的桥，那座桥正是本文。

非塌陷给 $n$ 维欧氏切空间与局部体积界，这条在 DPG；沿测试方案的平行输运在非塌陷设定下来自 Caputo--Gigli--Pasqualetto；沿每条测地线切锥连续来自 Deng，它把标架在内部时刻的正则补上。平滑对照来自 Ketterer--Mondino 用低维可求积集上的熵不等式刻画截面与中间 Ricci；Lebedeva--Petrunin 用共同截面下界的光滑逼近取弱极限得另一套弱张量；Brena--Gigli 讲清弱 Hessian 与曲率张量的测度表示、并指出从分布 Hessian 界到凸性的正则性障碍，直接解释了本篇为何要把最后一步外包；Er\"os--Kunzinger--Ohanyan--Vardabasso 在 $C^1$ 度量上有局部的分布到 Alexandrov 比较。二阶梯度、准连续代表与容量这套分析演算取自 Gigli 的演算论文与 Savare；测试方案与 Sobolev 连续性方程取自 Gigli 的微分结构与其与 Han 的合作；$c$-凸势下测地线唯一性取自 Gigli--Rajala--Sturm；二阶微分公式与好截断取自 Gigli--Tamanini，那也是我们 entropic 框架的出处之一；正则拉格朗日流取自 Ambrosio--Trevisan；entropic 插值的另一出处是 Leonard；四点到全局的几何判据与全球化取自 Alexandrov 几何教科书 AKP 的相应定理；而把径向 Hessian 带符号测度界转成每条测地线二阶不等式的那条一般定理，来自配套论文的 Theorem 1.1。

我按承重程度这样排序：动 Alexandrov 到 $\mathrm{CD}$ 或 Gigli 张量定义，正向第一行与泛函本身一起塌；动 DPG 或 Deng 或 CGP，标架与逐路径试验整块塌；动 AKP 的四点到全局，几何收尾塌；动配套定理，逆向最后一步塌、且只能靠重证那条弱 Hessian 定理补回。反过来，运输四阶展开、双因子热指标、可数调和标架这三块是本篇自造，找不到别处替。把这条依赖图画出来之后，我对"哪一处最脆"和"改哪条要重证哪片"就有了可操作的清单，它也正是下面台账逐行的骨架。

## §19 若我是审稿人会先追问的几处

我把自己摆到审稿位，逼问几个最会被挑的地方，再看源码给的答能否自洽。

第一问：把 (B) 的张量不等式限制在原始全局测试类里，会不会太弱、漏掉真实截面信息？我的回答是靠张量性本身。那条 $R(aX,Y,Z,W)(f)=R(X,Y,Z,W)(af)$ 说明 $R$ 在各槽对测试函数是局部的，而测试向量场是有限和 $\sum a_j\nabla b_j$，配 Lemma 里梯度、散度、协变导数都在 $L^2$ 且有界，加上逼近与连续度两件事，就足以让在测试类上成立的界代表整个张量的符号。正向正是用逼近加穷竭回到全局类，逆向则全程就在这两类上假设 (B)，两边口径一致。

第二问：为何限定整数 $n\ge2$？截面曲率需要一个二维方向 $\lvert X\wedge Y\rvert^2$，$n=1$ 时这个量恒为零、三角形比较平凡，逆向标架的可数目录也要 $n\ge2$ 才有秩可言。源码从摘要到主定理都写明 $n\ge2$，我不越界去推一维。

第三问：逆向有没有暗循环用到正向或本篇标架构造？配套定理那步我特意读它的前提复述：它对所有满支撑 $\mathrm{RCD}(K,N)$、$1<N<\infty$ 成立，证明只用有界测度改变与闭加权 Bochner，不碰刻画猜想也不碰本篇标架，所以把径向 Hessian 界喂给它不构成循环。剩下的热指标与标架都在非塌陷、精确 $\mathcal{H}^n$ 上自足。

第四问：参考测度取成与 $\mathcal{H}^n$ 双 Lipschitz 等价会不会仍逼出 Alexandrov？我认为不会。非塌陷的 $n$ 维欧氏切空间、局部体积 $c\,r^{n}\le m(B_r(x))\le C\,r^{n}$、以及"$\mathcal{H}^n$ 在每个非空有界球上正且有限从而维数为 $n$"这三件都精确系于 $m=\mathcal{H}^n$；换成等价测度，尺度一变，(B) 里 $(n-1)\kappa$ 与维数参数 $n$ 的对应就失真。这条我在 §8、§11 已标为必守。

第五问：满支撑是不是可省的装饰？省不得。Bishop--Gromov 的体积下界与"每个非空有界球有正测度"都要满支撑，否则维数论证与局部体积两头都空。

第六问最该老实说：符号取向。源码给的是对应 $\nabla_X\nabla_Y-\nabla_Y\nabla_X-\nabla_{[X,Y]}$ 的约定，于是 (B) 写成 $R(X,Y,Y,X)(f)\ge\kappa\int f(\lvert X\rvert^2\lvert Y\rvert^2-\langle X,Y\rangle^2)$。我没有在这个 build 里逐字验一个经典模型（例如常曲率球面）来对表这个正负号与 $\kappa$ 的方向，只能标 [推测]：按 Gigli 原著与这里一致地取非正 Laplace，符号应与球面截面向上相容。这是全篇我唯一无法在源码内闭环自检的一点，落在此处交代清楚。

## §20 台账

下表把本笔记各步的记号、界与量级登记下来，位置栏一律是本会话真正读出的文件行区间；单元格里的数学直接书写，模长用带定界的记号以免出现裸竖线，绝对值与范数各用其专用写法。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $n\ge2$ | 整数维下界 | `main.tex:9-16` | 主等价与逆向标架秩 | 一维无截面方向、可数目录无秩可言 |
| $\kappa\in\mathbb R$ | 任意实曲率下界 | `introduction.tex:65-67` | 模型 ODE 三支与半径 $R_\kappa$ | 正负分支错配、比较三角形不存在 |
| $K=(n-1)\kappa$ | 里奇常数替换 | `forward.tex:4-18` | 正向曲率定理前提 | 里奇与截面对应断、(B) 前半失效 |
| $m=\mathcal{H}^n_d$ | 精确 Hausdorff 测度 | `preliminaries.tex:276-286` | 非塌陷切空间与维数收尾 | 等价测度丢尺度、维数数不出 |
| 满支撑 | $\operatorname{supp}m=M$ | `introduction.tex:111-119` | Bishop--Gromov 体积下界 | 有界球可零测、全球化断 |
| $\operatorname{Test}(M)$ | 有界整体 Lipschitz 代表加 $\Delta f\in W^{1,2}$ | `introduction.tex:31-43` | 曲率泛函定义域 | 常数不在类、正向全局化断 |
| $\operatorname{TestV}(M)$ | 有限和 $\sum a_j\nabla b_j$ | `introduction.tex:31-43` | 测试场配对 | 无限和使积分不收敛 |
| $R(X,Y,Z,W)(f)$ | 分布四阶泛函 | `introduction.tex:47-58` | 全部张量不等式 | 符号约定反、比较方向翻转 |
| 张量性 | $R(aX,Y,Z,W)(f)=R(X,Y,Z,W)(af)$ | `preliminaries.tex:44-51` | 由梯度扩到测试系数 | 界不局部、测类信息不足 |
| $\lvert X\wedge Y\rvert^2$ | $\lvert X\rvert^2\lvert Y\rvert^2-\langle X,Y\rangle^2$ | `forward.tex:50-51` | 右端权与正向平方 | 非负性丢、夹逼无下界 |
| Hessian 界 | $\lVert H_g\rVert_2^2\le\lVert\Delta g\rVert_2^2+\max\{-K,0\}\lVert\nabla g\rVert_2^2$ | `preliminaries.tex:64-67` | 逼近引理强 $L^2$ 收敛 | 逼近无一致界、穷竭断 |
| 好截断 | $\chi_R$ 于 $B_R$ 上为 $1$、界与 $R$ 无关 | `preliminaries.tex:59-62` | 局部逼近与极限次序 | 界随 $R$ 爆、取不到全局类 |
| $\operatorname{Cap}_2$ | 归一化 $2$-容量 | `preliminaries.tex:233-237` | Bochner 测度不充极集 | 奇异测度失控、热指标发散 |
| 弱 Hessian | $H_F(Y,Y)(\xi)$ 写成两项积分 | `preliminaries.tex:198-214` | 径向界与配套接口 | 定义口径不齐、检验类不闭合 |
| 局部体积界 | $c\,r^{n}\le m(B_r(x))\le C\,r^{n}$ | `preliminaries.tex:276-286` | $E_Y\in L^1_{\mathrm{loc}}$ | 能量不可积、下确界无定义 |
| $\mathcal{G}$ | 紧支撑有界 Laplace 梯度族 | `forward.tex:54-56` | 有限概率律抽样 | 抽样不合法、平均恒等式断 |
| 中心化 | $\mathbb{E}A=0,\ \mathbb{E}\lvert A-B\rvert^2=2\mathbb{E}\lvert A\rvert^2$ | `forward.tex:80-84` | 奇次项抵消 | 截面项被奇次污染 |
| $L_C$ | $-\operatorname{div}(fC)$ 有界紧支撑 | `forward.tex:87-90` | 能量展开配对 | 不可积、展开发散 |
| 二阶修正场 | $S_A$ 带界散度 | `forward.tex:94-95` | 短流端点修正 | 径向加速度误差消不净 |
| 配凑平方 | $K_{AB}=\tfrac12\int_0^1[P(C_s,C_s;D,D)-\int f\lvert Q_s+\nabla_{C_s}D\rvert^2]$ | `forward.tex:691-712` | 上界认成曲率加平方 | 平方不非正、误差不消 |
| 平均系数 | $\tfrac16\mathbb{E}R(A,B,B,A)(f)+\tfrac12\mathbb{E}\int f\lvert\cdot\rvert^2$ | `forward.tex:691-712` | 曲率与误差分离 | 曲率项混进误差 |
| 分部积分 | $\int\langle L_DC-L_CD,\nabla q\rangle=\int f\langle\nabla_DC-\nabla_CD,\nabla q\rangle$ | `forward.tex:715-765` | 不给 $q$ 指定 Hessian | 分布对象无法配对 |
| $\Phi_t=Q_tu$ | $\inf_y\{u(y)+d^2(x,y)/2t\}$ | `heat-index.tex:8-9` | 校准测地线定义 | 下确界不取、路径不存在 |
| 试验场 | $Y_t=\sum_j a_j(t)\nabla g_j$ 于 $[\delta,1]$ | `heat-index.tex:24-29` | 指标右端能量 | 端点迹无定义、下确界混速度 |
| 校准等式 | $\Phi_1(\gamma_1)=u(\gamma_0)+\tfrac12 d^2(\gamma_0,\gamma_1)$ | `heat-index.tex:37-39` | 公共终端指定 | 终端条件不对、路径被平均 |
| 指标不等式 | $H_{\Phi_1}(Z,Z)(f)\le\int\!\int(\lvert\partial_tY+\nabla_vY\rvert^2-\kappa\lvert Y\wedge v\rvert^2)$ | `heat-index.tex:63-69` | 径向界取终端下确界 | 二次能量弱收敛丢号 |
| 双因子 | 前向势乘后向密度解连续性方程 | `introduction.tex:166-176` | $\pi_f=S_{\#}(fm)$ 终端权 | 终端密度不对、方案不成 |
| 反粘度抵消 | $\lVert e_c\rVert_{L^1(\delta,1)}$ 对一切 $T<1$ 同界 | `heat-index.tex:860-869` | 加速度误差一致控制 | 终端极限发散 |
| 有粘度估计 | 余项 $\varepsilon_c\to0$ | `heat-index.tex:872-884` | 零粘度次序 $c\downarrow0$ | 反粘度项漏回不等式 |
| 二次收口 | $2H_\theta(D_cY,Y)-\lvert H_\theta Y\rvert^2\le\lvert D_cY\rvert^2$ | `heat-index.tex:889-893` | Riccati 上界闭合 | 右端无二次控制 |
| 终端配对 | 端点迹强局部 $L^2$ 收敛 | `heat-index.tex:899-911` | 左端拉回 $L^1$ | 终端值取不出 |
| 可数标架 | $\mathcal{H}^{n-1}(S)=0$、$\operatorname{Cap}_2(N)=0$ | `frames.tex:48-61` | 逐时刻秩与共同代表 | 路径撞坏集、标架缺时刻 |
| content 判据 | $\mathcal{H}^{s}_\infty(E\cap B(x,r))=o(r^{s})$ 推出 $\mathcal{H}^{s}(E)=0$ | `frames.tex:69-78` | 秩亏集压成零测 | 坏集非零、路径规避失效 |
| 模型正弦 | $\mathfrak{s}_\kappa''+\kappa\mathfrak{s}_\kappa=0$、$\mathfrak{s}_\kappa(0)=0$、$\mathfrak{s}_\kappa'(0)=1$ | `frames.tex:718-725` | 径向界系数与模型距离 | 系数比例错、比较尺度乱 |
| 径向界 | $\operatorname{Hess}q(Z,Z)\le(\lvert Z_{\parallel}\rvert^2+r\frac{\mathfrak{s}'_\kappa}{\mathfrak{s}_\kappa}\lvert Z_{\perp}\rvert^2)m$ | `frames.tex:740-746` | 距离改造喂配套定理 | 奇异部分符号丢、测度界不成立 |
| 公共终端 | 右端为关于 $x$ 的 $E_Y(x)$、不平均 | `frames.tex:759-792` | 终端取下确界保号 | 混速度、非正奇异部失效 |
| 配套弱 Hessian | $(F\circ\sigma)''\le\ell^2\,G\circ\sigma$ | `comparison.tex:15-35` | 径向界到测地线 ODE | 分布界积不成凹性 |
| 模型距离 | $\mathfrak{m}_\kappa(r)=\int_0^r\mathfrak{s}_\kappa$ 分三支 | `comparison.tex:47-57` | 压平成有界 Lipschitz $F_p$ | $F_p$ 无界、配套前提不满足 |
| 弱链式 | $H_{F_p}(Z,Z)(h)=H_q(Z,Z)(h\chi')+\int h\chi''\langle\nabla q,Z\rangle^2$ | `comparison.tex:96-101` | 全局 Hessian 界 | 一阶导对不上、界外溢 |
| 系数比较 | $A\le B$、压平添一个非正径向项 | `comparison.tex:111-120` | $G_p$ 全局合法 | 全局界超出 $\kappa$ |
| 模型 ODE | $y''+\kappa\ell^2 y\le\ell^2$、$y=\mathfrak{m}_\kappa(d(p,\sigma_t))$ | `comparison.tex:148-152` | 点到边比较 | 比较三角形不存在 |
| Poincaré 逼零 | $\lVert(h_-)'\rVert_2^2\le\kappa\ell^2\lVert h_-\rVert_2^2$ | `comparison.tex:172-178` | $h_-=0$ 得点边比较 | $\kappa>0$ 支不塌、比较方向留不住 |
| 维数收尾 | $\dim_{\mathcal H}M=n$ | `comparison.tex:224-229` | (A) 的维数结论 | 维数落空、(A) 不成立 |
| 主等价 | 条件 (A) 与 (B) 互推 | `main.tex:27-37` | 收束证明四行 | 任一定理缺、对应半边断 |
| 逆向六框 | 下界、热指标、Hessian 测度、距离改造、模型 ODE、全局 CBB | `figures/proof-route.tex:7-18` | 逆向结构图 | 任一框改序、依赖关系乱 |
| 非约化含边界 | Alexandrov 到 RCD 对任意 $\kappa$ 成立 | `introduction.tex:102-104` | 正向第一行 | 带边界情形没底座、(B) 前半断 |
| 曲率维数来源 | Petrunin、Zhang--Zhu、KMS 三处 | `introduction.tex:97-101` | 正向度量测部分 | 合成里奇与三角形脱钩 |
| Bakry 梯度界 | $\lVert\nabla g_t\rVert_\infty\le\lVert\chi\rVert_\infty e^{-Kt}\lVert\nabla(\zeta g)\rVert_\infty+\lVert\nabla\chi\rVert_\infty\lVert\zeta g\rVert_\infty$ | `preliminaries.tex:120-129` | 逼近的一致有界 | 梯度失控、Hessian 收敛断 |
| 两版 Bochner | 带 $\lvert H_g\rvert^2$ 版与带 $(\Delta g)^2/N$ 版 | `preliminaries.tex:218-227` | 测度界系数选取 | 误用合式系数一、估计发散 |
| 准连续乘子 | 强 $W^{1,2}$ 子列在零极集外收敛 | `preliminaries.tex:239-254` | 乘奇异 Bochner 测度 | 分部积分扩不到 Sobolev 乘子 |
| 测地线唯一 | 取 $c=d^2/2$ 进入 $c$-超微分的测地线唯一 | `preliminaries.tex:291-293` | $\pi_f$ 的动力学映射 | 终端指定不唯一、公共路径塌 |
| 二阶微分公式 | 对 $H^{2,2}$ 与 $H_C^{1,2}$ 适用 | `preliminaries.tex:314-318` | 沿路径的二阶导 | 积分恒等式升不到逐时刻 |
| 流压缩界 | 常数为负散度积分的指数 | `preliminaries.tex:325-334` | 短流与 $[\delta,1]$ 压缩 | 有界压缩没保证、$E_Y$ 不可积 |
| 改造半径链 | $0<a<b<R_*$ 只依赖 $\kappa$ 与 $R_*$ | `comparison.tex:63-75` | $F_p,G_p$ 全局定义 | $\kappa>0$ 支越过 $\pi/(2\sqrt{\kappa})$ |
| 连续余弦律 | $\bar y''+\kappa\ell^2\bar y=\ell^2$ 且同端点值 | `comparison.tex:154-168` | 构造 $h=y-\bar y$ | 边值不对、Poincaré 无从下手 |
| 四点角和 | 三个比较角之和不超过 $2\pi$ | `comparison.tex:209-212` | 局部四点判据 | 四点不等式不闭合、局部 CBB 断 |
| 切锥连续角色 | Deng 定理补内部时刻正则 | `introduction.tex:185-186` | 标架逐时刻成立 | 内部时刻坏集没清、公共目录缺 |
| 平行输运来源 | 非塌陷下沿测试方案由 CGP 供 | `introduction.tex:187-188` | 有限维 ODE 近似 Jacobi | 试验场端点迹无法构造 |
| 模型距离关系 | $\mathfrak{s}'_\kappa=1-\kappa\,\mathfrak{m}_\kappa$ | `comparison.tex:56-57` | $G_p=1-\kappa F_p$ 于 $B_a$ | 配套定理右端对不上 |
| 非正 Laplace 约定 | $\int\langle\nabla f,\nabla h\rangle\,\mathrm{d}m=-\int(\Delta f)h\,\mathrm{d}m$ | `introduction.tex:26-29` | 二阶演算全局记号 | 符号取反、张量约定翻转 |
| 弱换位子 | $[X,Y]=\nabla_XY-\nabla_YX$ | `introduction.tex:45-46` | 曲率泛函末项 | 换位子错、末项失配 |
| 交换对称 | $R(X,Y,Z,W)=-R(Y,X,Z,W)=R(Z,W,X,Y)$ | `preliminaries.tex:46` | 截面项提取 | 对称性丢、平均失效 |
| 二阶张量界 | $X\in L^2(TM)\cap L^\infty(TM)$、$\nabla X\in L^2$、$\operatorname{div}X\in L^2$ | `preliminaries.tex:30-36` | 泛函各项可积 | 项不可积、定义崩 |
| 局部 doubling | $m(B_{2r})\le C\,m(B_r)$ | `preliminaries.tex:272-273` | 容量与 content 估计 | doubling 丢、坏集压不住 |
| 端点条件 | $Y_\delta=0,\ Y_1=Z$ | `heat-index.tex:60-62` | 指标右端下确界 | 端点不符、速度迹对不上 |
| 校准路径 | $S(x)_1=x$、$S(x)\in\operatorname{Geo}$ 于 $m$-零集外 | `heat-index.tex:50-52` | 公共终端指定 | 终端不唯一、路径被平均 |
| 终端密度归一 | 后向因子在 $t=1$ 处配成 $f\,\mathrm{d}m$ | `heat-index.tex:77-80` | $\pi_f$ 终端权 | 终端权不对、方案不闭合 |
| 半周限制 | $R_\kappa\sqrt{\kappa}<\pi/2$ | `frames.tex:734-735` | 模型正弦正性与径向界 | $\mathfrak{s}_\kappa$ 变号、系数发散 |
| 测度切空间 | 每支切空间皆归一化欧氏 $\mathbb{R}^n$ 之点集 $\mathcal{R}_n$ | `frames.tex:23-25` | 非塌陷体积与切模维数 | $\mathcal{R}_n$ 零测、标架全缺 |
| 二阶修正场界 | 有界散度 $\operatorname{div}S_A$ 且 $\nabla S_A\in L^2$ | `forward.tex:94-95` | 端点二阶修正 | 修正项不收敛、误差不消 |
| 短流方向随机 | $A=\nabla u_A,\ B=\nabla u_B$ 独立抽自 $u\mapsto-u$ 律 | `forward.tex:70-74` | 中心化与奇次抵消 | 独立性丢、截面项污染 |
| 曲率泛函可积 | 各项为 $L^2$ 因子乘有界因子 | `introduction.tex:59-60` | 全局测试类上定义 | 项不可积、泛函无意义 |
| 弱 Hessian 混合 | 极化由 $H_F(\cdot,\cdot)$ 定出 $H_F(Y_1,Y_2)$ | `preliminaries.tex:206-207` | 截面双线性读法 | 极化缺、混合值无定义 |
| 准连续下界提升 | 于 $m$-零极集外成立 | `preliminaries.tex:250-254` | 乘奇异测度 | 提升失败、符号丢 |
| Hausdorff 维数 | 有界球有正有限 $\mathcal{H}^n$、$\dim_{\mathcal H}M=n$ | `comparison.tex:224-229` | (A) 的维数结论 | 维数落空、(A) 不成立 |

本笔记自 §0 至 §20 各编号节连同文末台账构成全文，各步记号、界与量级均已并入上表。
