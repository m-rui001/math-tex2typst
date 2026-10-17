# D280 研究笔记：SLE 精确豪斯多夫规范函数的双重对数修正

## §0 派单与登记

这一篇对应 2026 年 9  26 日的预印本《An explicit exact Hausdorff gauge for SLE》，副标题是 A regular formula from quantitative tails and dense visits。我的任务是反推它背后真实的思维链，用第一人称把"我"如何一步步走到那个 $r^d(\log\log(1/r))^{(2-d)/2}$ 公式的过程重建出来。正文素材全部来自 `preprints/An-explicit-exact-Hausdorff-gauge-for-SLE-September-26-2026/build/` 下的 `.tex` 文件：main、abstract、introduction、geometry、local-laws、mesh-tails、retained-mass、ribbon、dense-cover 九份主干，外加 macros 与三份图形 tikz 源码（captions 里三条图注我逐条读入了）。build 目录下不存在 source 分片版式，我用 find 探过；`typst/` 分片按规格不作来源，README 只当索引，refs 目录下没有 `.tex`，这些都没有给我提供任何正文素材。论文没有 Lean 形式化要求，按规格第 3 条我完全没碰 lean 相关目录。凡是我从 tex 里读不出来的环节，我会标 `[推测]` 并说明缺口在哪，不硬编。

先交代我拿到这个问题时的处境。固定 $0<\kappa<8$，记 $d=1+\kappa/8$，$p=2-d=1-\kappa/8$。Beffara 早就把弦状 $\mathrm{SLE}_\kappa$ 的豪斯多夫维数钉在 $d$ 上（introduction 第 7-8 行引的 beffara2008 主定理），Rezaei 又证明了 $d$ 维豪斯多夫测度本身是零（abstract 第 6-7 行进引的 rezaei2018 定理 1.1）。维数定理只给出临界幂，临界幂处的测度退化，说明真正悬而未决的是临界幂之上的对数修正项。Schramm 在问题清单里问过 SLE 迹的 sigma-finite 豪斯多夫测度问题，并顺手猜了一个候选 $r^d\log\log(1/r)$（introduction 第 28-33 行，schramm2007 的 Problem 7.1）。我最初的立场很朴素：既然前一篇同伴论文（openai2026exact，introduction 第 34-41 行提到的"矩积分加有限不规则批次"构造）已经用相当非显形的办法解决了存在性，那么把规范函数写成某个正则闭式，大概率就是 Schramm 猜的那个指数一的版本，至多做点指数微调。这一篇成品恰恰把这个猜想否定了：定理 1.1 的规范函数里对数修正的幂是 $p/2$ 区间 $(0,1/2)$ 内的数，而推论（introduction 第 92-98 行的 cor:larger-gauge）宣布 Schramm 的指数一候选在任何正时间紧段上都不 sigma-finite。写下这些时我意识到，我的思维链重建必须回答的核心问题是：$p/2$ 这个幂从哪里长出来，指数一的直觉又是在哪一步被掐断的。

两份登记挂在 §0 末尾：

取材目录：preprints/An-explicit-exact-Hausdorff-gauge-for-SLE-September-26-2026
队列行号：其他队列第 104 行号

## §1 初始动机与第一个错误路线

把问题拆开看，豪斯多夫测度 $\mathcal H^h$ 是对所有直径不超过 $\delta$ 的可数覆盖取下确界再令 $\delta\downarrow0$（introduction 第 17-21 行的公式 hausdorff-definition），它优化的是空间覆盖，曲线参数化下的有序分割是另一套长度概念，这两点在第一节就被我反复咀嚼。正有限性天然是两半场：下界要在迹上支撑一个测度，让每个小球的质量至多 $h(r)$ 乘常数；上界要给出一族空间覆盖，让总 $h$-代价有界。半场用的都是有限网格量，用法却相反，这个不对称性后来支配了整篇论文的架构。

我最初走的第一条错误路线是"把同伴论文的非显形规范函数正则化"。同伴论文的构造是先把矩积分确定系数、再对半径取全体下确界（introduction 第 36-38 行引的 openai2026exact 公式 (5.8) 与 (6.4)），这种通过下确界定义的规范函数带着不规则批次的毛刺，我一开始以为正则闭式只是它的某种光滑化近似，把批次毛刺抹平就得到干净公式。这个想法在两个地方碰壁。第一，抹平毛刺没有任何机制保证两条豪斯多夫不等式仍然成立：下界那边测度的小球上界是逐球验证的，规范函数在个别半径上被放大一点， ball 上界就可能崩；上界那边覆盖代价是逐球求和的，规范函数被缩小一点同样会破坏期望界。第二，也是更致命的，我在推演 Schramm 候选时发现指数一根本过不了量级检验。尝试的直觉是经典的重对数律类比：把 $d$ 维内容看成约 $\log(1/r)$ 个尺度上近独立贡献之和，重对数律给涨落 $\sqrt{2\log\log n}$ 量级，照此"修正"应当是对数子的平方根，可 Schramm 的启发式（我猜他按香肠面积的二阶矩发散来放大危险）指向指数一。两种启发式各执一词，说明我手里没有定量尾，只有象征性算账。真正推进发生在放弃"正则化近似"思路、改问"哪类定量估计能同时钉死两条不等式"之后。论文引言第 43-47 行也印证了这个姿态：本文从有限尺度的定量估计直接证两条豪斯多夫不等式，停止律、质量、覆盖三条论证都不从同伴论文进口任何证明结果，两个精确规范函数之间的关系留作开放问题。

## §2 关键转折点：定量尾决定对数幂

转折点是先把两个量级问题想清楚，再去猜公式。我需要的第一件事是一个积分密度的大偏差尾。设 $A$ 是存活域里带固定自由护圈的圆盘，$W_e(z)$ 是把 Green 密度 $M_t(z)=R_t^{-p}\sin^{a_0}\theta_t(z)$（$a_0=8/\kappa-1$）在该点第一次活体接近距离 $e$ 处冻结、永不接近则取零之后的停止权重，则

$$\mathbb P\left\{\int_A W_e(z)\,dA(z)>u\right\}\le C\exp(-cu^{2/p}),\qquad u\ge u_0,$$

单位尺度坐标下成立，常数对许可的过去与最终网格一致（mesh-tails 第 93-97 行的公式 mesh:normalized-tail；introduction 第 142-146 行给了同族的网格形式 $\mathbb P\{\int_A W_{r_f}>C\delta^{-p}\}\le C\exp(-c\delta^{-2})$，公式 mesh:tail-equation）。我盯着 $\exp(-cu^{2/p})$ 看了很久：尾巴的幂是 $2/p$，那么想要逐尺度可和的对数损失，阈值上的对数因子幂必然与 $2/p$ 互逆。算一遍就通：在 $r=2^{-k}$ 尺度取删除阈值 $Dr^d(\log k)^{p/2}$（retained-mass 第 87-91 行），超过阈值的期望质量被 $\exp(-cD^{2/p}\log k)$ 型尾巴压成 $k^{-cD^{2/p}}$（retained-mass 第 94-97 行的公式 retain:bad-square，其中 $\beta=cD^{2/p}$），只要 $D$ 够大使 $\beta>1$ 就可和（retained-mass 第 163 行）。等价地看，$(\log k)^{p/2}$ 是尾巴幂 $2/p$ 的"可和原像"。而 $k$ 与 $\log(1/r)$ 同阶，$\log k$ 就是 $\log\log(1/r)$ 的量级，公式 $h(r)=r^d(\log\log(1/r))^{p/2}$（introduction 第 59-61 行公式 gauge）至此在下界半场完全确定。

上界半场给出同一幂的另一种证法。蛇形带密集访问实验（rc:dense）说：在共形半径 $r$ 的标记点周围，$2m+1$ 根竖strand 的蛇形带用 $N\le Cm^2$ 步（ribbon 第 748-750 行）以至少 $c\exp(-Cm^2)$ 的倾斜条件概率（ribbon 第 693-696 行公式 rc:dense-probability）造出归一化香肠质量 $\ge cr^d m^p$（ribbon 第 698-703 行公式 rc:dense-mass）。覆盖层取 $m_n=\lfloor c_0\sqrt{\log n}\rfloor$（dense-cover 第 152 行），单次试验失败被逐条件期望迭代压成 $(1-n^{-1/2})^{J_1-J_0+1}\le C\exp(-c\sqrt n)$（dense-cover 第 219-224 行公式 cover:failure），成功质量阈值随之变成 $b_1r_j^d(\log n)^{p/2}$（dense-cover 第 196-200 行公式 cover:adapted-success），而 $\log n$ 与 $\log\log(1/r_j)$ 同阶，因为 $r_j=e^{-T_0j}$ 且 $j$ 在 $n/3$ 到 $2n/3$ 之间。两条半场在同一幂 $p/2$ 上会师，这比我最初依赖的任何启发式都硬：指数一候选在这里死于双重对数幂只有 $p/2$、它严格小于一，比值 $h(r)/g(r)\to0$ 使每个 $\mathcal H^g$-有限集都是 $\mathcal H^h$-零集（introduction 第 99-106 行推论证明），正测度段不可能被这样的集合可数覆盖。我的第一直觉（闭式应当长得像 Schramm 候选）至此被彻底推翻，推翻它的证据全部来自两个可计算的量级机制。

## §3 技术地基之一：粗糙过去之后的边界几何

在两台机器开建之前，我先要说服自己原料是干净的。这里的原料是：一条已经走过的粗糙迹之后，存活域里还能不能有可靠的"访问"与"支撑"语言。geometry 一节从 Rohde--Schramm 的连续迹定理出发（geometry 第 14-16 行），只谈边界几何，不重建迹的存在性。我最初的错误路线是在这里直接引用带连续边界的 Carathéodory 定理而不验证前提，被自己卡住了：迹可以有任意自交，存活域边界可以贴着物理点代表多个 prime end。补证分三层。

第一层是连续延拓（geom:extension，geometry 第 20-72 行）。闭下半平面与迹像的并在交点处局部连通，我手写了一遍"交点取各自相对邻域并起来、单侧点先躲开另一闭集"的逐点论证（第 42-45 行），再把补分支加回去得到填充集局部连通：给定直径指标，均匀局部连通给出尺度 $\delta$，两点若相距小于 $\delta$ 且离原闭集超过 $2\delta$ 就沿线段同分支，否则取最近点用长至多 $2\delta$ 与 $3\delta$ 的线段接过去、再在 $A$ 内以小连通集接拢（第 48-62 行）。Torhorst 边界定理随后把局部连通传给 $\partial D$，连续性定理与 prime end 定理给出球面拓扑下的闭半平面连续延拓（第 66-71 行）。这一段给我的教训是：凡"显然"的边界陈述在这种允许自交的迹几何里都要重推一遍，论文里老老实实写了局部坐标版本（第 48-49 行）。

第二层是新端点唯一 prime end（geom:fresh-tip，geometry 第 74-129 行）。核心观察是 $K\setminus\{a\}$ 连通：$A\setminus\{a\}$ 由下半平面与 $\eta[0,T)$ 在 $0$ 处相接而成，每个填充分支去掉 $a$ 后仍与它相接（第 84-101 行），其中"边界含于单点集的非空真开分支在穿孔球面上既开又闭"这句排除（第 90-92 行）我起初想跳过，检查后发现它恰是防止 $a$ 代表多个 prime end 的命门。反证的后半是 Jordan 曲线分离论证（第 105-120 行）：两个不同圆参数若有同一像 $a$，取穿孔简单 crosscut，其像为含于 $D\cup\{a\}$ 的 Jordan 曲线，两段圆弧各取一个非 $a$ 边界像落在 $J$ 两侧，同属 $K\setminus\{a\}$，与 $J\cap K=\{a\}$ 矛盾。还有一处我差点漏掉：开圆弧恒映为 $a$ 的情形由 Schwarz 反射解析延拓加单射性排除（第 111-113 行）。

第三层把几何接到 Loewner 参数上。geom:first-hit-access（geometry 第 131-157 行）说首次圆盘命中给径向访问线段 $(a,z]\subset D_\tau$，归一化后像为从 $0$ 到模长 $1$ 的连续路径；它附带一个我后来反复使用的吞没约定：球心被吞没时球仍离迹，则开球整体同刻被吞没，之后迹再长也进不来（第 159-162 行）。geom:smooth-driver（第 164-261 行）证明光滑紧 slits 的前缀族由连续 driver 生成：我先怀疑 kernel 收敛到闭包一致收敛需要什么，答案是均匀局部弧连通（第 181-189 行）加上小 crosscut 的 Cauchy--Schwarz 球面长度估计 $C/\sqrt{\log(1/\delta)}$（第 194-198 行）。Herglotz 型表示 $h(z)=z-\int_{\mathbb R}d\nu(x)/(z-x)$、$\nu(\mathbb R)=m$（第 221-224 行）让我确认容量严格增：$m=0$ 给出恒等映射，与非常值弧矛盾（第 225-227 行）。测度支撑收缩到 $U(s)$ 用了外 Gronwall 面积定理 $\sum_{j\ge1}j\lvert b_j\rvert^2\le1$（第 243-244 行）配合 $\zeta=\pm2$ 处 Cauchy--Schwarz 得 $\lvert Q(U(s)\pm2\epsilon)-U(s)\rvert<3\epsilon$（第 245-246 行），于是无穷小转移是 $h(z)=z-m/(z-U(s))+o(m)$（第 251-253 行），Loewner 方程 $\partial_tg_t=2/(g_t-U(t))$ 落定（第 256-259 行）。

有了这些，逐点 slit 支撑（geom:slit-support，geometry 第 267-347 行）就是 driver 邻域跟踪：确定性 driver $U$ 的一致邻域内任何扰动，只要生成连续迹，其 hull 必进给定开管 $N$ 并命中终点邻域 $V$。我起初以为可以直接引用 Tran--Yuan 的一般支撑定理（论文第 263-265 行确实注明这是特例），但要的开管形式与 crosscut 顺序声明需要自己拼：前向 Loewner ODE 的连续依赖给紧矩形内远离 slits 处的 hull 包含（第 295-307 行），反向 ODE 给逆变换局部一致收敛，再用"若扰动迹避开小球则整球被吞没"的连通分支矛盾逼出命中（第 326-334 行）；最后 Brown 运动在连续函数 $U/\sqrt\kappa$ 的一致邻域内有正概率，经多边形逼近与桥约束证明（第 338-343 行）。重启版本 geom:restart-support（第 349-389 行）把一切搬回物理域。它在结尾明说：不同过去上的一致正下界仍需单独论证（第 387-388 行），这句就是我后来在 §8 被迫搞出紧致性机器的事前预告。

## §4 技术地基之二：停止 Green 倾斜与物理定位

第二块地基是单点律，local-laws 一节。设 $\zeta=J^{-1}(z)$，$Z_t=g_t(\zeta)-\sqrt\kappa B_t=X_t+iY_t$，半径钟 $s=\log(R_0/R_t)$ 满足 $ds=4Y_t^2/\lvert Z_t\rvert^4\,dt$（local-laws 第 61 行），密度 $M_t=R_t^{-p}\sin^{a_0}\theta_t$，$a_0=8/\kappa-1$，其布朗系数 $\sqrt\kappa a_0X_t/\lvert Z_t\rvert^2$ 受 $CR_t^{-p}\sin^{a_0}\theta_t/\lvert Z_t\rvert$ 控制（第 64-77 行）。有限停止倾斜律（ll:finite-tilt，第 80-143 行）我读了两遍才确认它只用在有限停时上：先在角离开 $(1/N,\pi-1/N)$、$Y$ 落到 $1/N$ 以下或 Loewner 时间达 $N$ 处截断，Girsanov 合法因为 $|X_t|/|Z_t|^2\le N/2$（第 106-110 行），倾斜生成元 $\mathcal L^*=\frac\kappa8\partial_\theta^2+\cot\theta\,\partial_\theta$（第 94-96 行），Lyapunov 函数 $V_b=\sin^{-b}\theta$ 满足 $\mathcal L^*V_b\le\frac{\kappa b}{8}V_b$（第 117-121 行），端点在有限半径时不可达，于是截断定律不丢概率，单调逼近得 $\mathbb E[M_{\tau_u}\mathbf 1_{\{\tau_u<\infty\}}]=M_0$。物理钟恒等式 $d\log Y_s/ds=-\frac12\sin^{-2}\theta_s$、$dt/ds=Y_s^2/(4\sin^4\theta_s)$（第 129-134 行）是我后面所有"参数时间有限性"推理的发动机。

一致逆角矩（ll:inverse-angle，local-laws 第 145-207 行）我起初准备抄 Gegenbauer 显式范数，后来发现谱论证加插值估计就够：不变测度 $\pi(d\theta)=c_\kappa\sin^{8/\kappa}\theta\,d\theta$，换 $v=\cos\theta$ 后算子对称，正交多项式特征值 $\lambda_m=\frac\kappa8m^2+m$（第 174-177 行），$[-1/2,1/2]$ 内取 $m+1$ 个分隔小区间、Lagrange 插值给 $\lVert P_m\rVert_\infty\le\exp\{C(m+1)\log(m+2)\}$（第 178-185 行），核 $k_s$ 在 $s\ge u_0$ 一致有界（第 188-190 行）。第 204-206 行自己注明这替代了显式多项式范数公式，也替代了 lawlerwerness2013 的引理 2.9 的引用需求，我把它当作"能少引就少引"原则的示范。

接近概率三件套（ll:approach，第 243-308 行）：半径层面 $\mathbb P\{\tau_u<\infty\}\le Ce^{-pu}\sin^{a_0}\theta_0$（第 249-253 行）；Euclidean 层面 $\mathbb P\{S_\varepsilon(z)<\infty\}\le CM_0(z)\varepsilon^p$（第 255-259 行），推导里 Koebe 不等式 $\operatorname{dist}\le R\le4\operatorname{dist}$（第 26-30 行）用了一次、半径必早过 $8\varepsilon$ 用了第二次；一阶矩恒等式 $\mathbb E[M_{S_\varepsilon}\mathbf 1_{\{S_\varepsilon<\infty\}}]=M_0$（第 260-264 行）靠 $R\ge\delta_t>\varepsilon$ 给出的界 $\varepsilon^{-p}$ 配可选停时。迹间隙恒等式 $\delta_t=\min\{\operatorname{dist}(z,\partial D_0),\operatorname{dist}(z,\eta[0,t])\}$（第 231-234 行）把"清除停时"翻译成"迹的第一次活体接近"，这正是 §5 里 $W_r$ 的定义依据。中心寿命有限（ll:finite-clock，第 310-356 行）我起初以为是摆设，读到第 339-355 行才明白它是下界构造正一阶矩的命脉：取 $b=a_0$ 时 $\mathcal L^*V_{a_0}=pV_{a_0}$，$e^{-ps}V_{a_0}(\theta_s)$ 是非负局部鞅，Borel--Cantelli 对任意 $\eta<1/4$ 给 $\sin^{-4}\theta_s\le Ce^{4\eta s}$（第 349-350 行），配合 $Y_s\le Y_0e^{-s/2}$（第 351 行），积分 $\int_0^\infty Y_s^2/(4\sin^4\theta_s)\,ds$ 有限，于是 $T^*(z)<\infty$ 几乎必然，全程只用有限停定律，不碰无穷未来 sigma 域上的密度。

避开实轴（ll:near-real，第 360-451 行）是覆盖层清理误差的弹药：$\mathbb P\{\operatorname{dist}(v,\gamma)<\varepsilon\}\le C\varepsilon^c$ 对 $1/2\le|v|\le2$。实心 $x$ 的碰撞钟 $h$ 下 $\log|X|=\log|x|+(2-\kappa/2)h+\sqrt\kappa\widetilde B_h$（第 385-387 行），半圆内比值 $|D_t(w)/X_t|\le\delta$ 时 $\frac{d}{dh}\log|D_t(w)|\le-2+C\delta$（第 391-395 行），取 $\mu=4-\kappa/2-C\delta>0$，负漂移布朗上穿 $H=\log(\delta|x|/(4\varepsilon))$ 概率 $\exp(-2\mu H/\kappa)$，得失败概率 $C\varepsilon^{2\mu/\kappa}$（第 396-408 行）。中途我必须处理"迹是否可能整段停在实轴"：容量参数化的生成迹在非常值时间区间上不能全在 $\mathbb R$，因为只加实点不改变填充 hull、违背容量严格增（第 415-418 行），这句我起初想当然跳过，被反例检验逼回来。

矩形能量引理（ll:rectangle，第 460-513 行）是我没见过的把戏：命中 dyadic 子矩形概率至多 $C_02^{-\alpha k}$ 的随机集碰水平集 $\{u=H\}$ 的概率被 $C\frac E{H^2}\exp(-cH^2/E)$ 控制。嵌套均值界 $|u_{Q_k}-u_Q|\le C\sqrt{(k+1)E}$（第 477-479 行）靠反射加环形区域 Poincaré 加 Cauchy--Schwarz；$N=\lfloor c_1H^2/E\rfloor$ 之后每层跳变至少 $c_2H/j^2$，Poincaré 限定坏父矩形数不超过 $CEj^4/H^2$，求和得双指数尾巴（第 492-510 行）。把它嫁接到共形定位（ll:localization，第 515-588 行）：条带坐标 $z=e^{v+i\phi}$，截断函数 $U=\min\{H,\log^+(\lvert F(e^{v+i\phi})-q\rvert/r)\}$，单叶性使能量至多 $2\pi H$（第 545-550 行），路径假设给每个 $v<0$ 截面带零点，$A(v)$ 的 Cauchy--Schwarz 传播把均值压到 $H/2$ 以下直到 $v\le bH$，dyadic 矩形命中概率由 ll:near-real 给 $C2^{-\alpha k}$，最后左半边无穷多 slab 的和被 $\sum_jE_j\le2\pi H$ 收敛掉，得 $\mathbb P\{F(\gamma[0,\sigma_{L^b}])\not\subset B(q,Lr)\}\le CL^{-c}$（第 523-533 行）。这个估计对窄颈域一致、不需要边界连续模，是 §8 传递局部化的核心。

吞没引理（ll:swallowing，第 592-676 行）只管 $\kappa>4$：钟 $h=-\log(Y/Y_0)$、$P=X/Y$ 的生成元 $\mathcal G=\frac\kappa4(1+P^2)\partial_P^2+2P\partial_P$（第 606-608 行），取 $\beta<1-4/\kappa$、$V=(1+P^2)^{\beta/2}$，无穷远极限 $\rho=2\beta+\kappa\beta(\beta-1)/4<\beta$（第 617-619 行），Gronwall 得 $\mathbb EV(P_h)\le Ce^{\lambda h}V(P_0)$（第 623-626 行），单位区间 sup 版本（第 636-640 行）使 $\mathbb ET_z^{\beta/2}\le C$（第 648-655 行），再证 $T_\infty=T_z$ 排除时间改造假终点（第 656-662 行），最后 hull 高度界 $2\sqrt t$ 与 driver 极值水平界（第 665-672 行）把 $\mathbb P\{\sigma_A\le T_z\}\le CA^{-c}$ 钉死。条件物理圆盘法则（ll:disk-rule，第 678-722 行）把 localization 与 swallowing 串起来：首次圆盘命中的新鲜端点提供访问路径，映射到半平面后 $CL^{-c}$ 的"活体外逃"概率成立，常数对已画过的过去一致（第 712-721 行）。我在这里第一次看清 $\kappa\le4$ 与 $\kappa>4$ 的分工源头：前者靠 Green 递减恒等式，后者靠"进圈就大概率被吞"。

## §5 网格尾，一：$\kappa\le4$ 的括号估计

现在两台机器共用的定量尾（mesh:tail）登场。设 $W_r(z)=M_{\tau_r(z)}(z)\mathbf 1_{\{\tau_r(z)<\infty\}}$（mesh-tails 第 58-60 行），命题断言 $\mathbb P\{\int_AW_{r_f}\,dA>C\delta^{-p}\}\le C\exp(-c\delta^{-2})$ 对 $r_f\le\delta\le\delta_0$，常数对最终网格 $r_f$ 一致（第 75-88 行）。从网格形式到归一化形式 $\mathbb P\{\int_AW_e>u\}\le C\exp(-cu^{2/p})$ 的换算（第 92-111 行）我逐步核对过：点式界 $W_e\le e^{-p}$ 给确定上界 $C_{\rm d}e^{-p}$，$u\ge u_0=C_0\delta_0^{-p}$ 时取 $\delta=(C_0/u)^{1/p}$，$e\le\delta$ 用网格尾、$e>\delta$ 事件为空。空间放大 $R$ 倍时密度乘 $R^{-p}$ 面积乘 $R^2$，阈值变 $uR^d$，这个缩放记账在 §7 逐球验证里还要再用。

$\kappa\le4$ 的主战场是异步起始的括号。Schramm--Sheffield 在 SLE$_4$ 与高斯自由场协方差计算里用过 Dirichlet Green 递减（mesh-tails 第 187-189 行），但他们的两点同起同止，这里每个点按自己的首次接近时刻起停，我一开始直接套他们的引理，卡死在"起始时刻不同的点对"上；补救是把重叠区间指派给晚出发的点 $z$，于是 $w$ 在 $z$ 的出发时刻仍活着、且离自己出发时边界的距离不超过 $r$、域又在缩小，所以 $w$ 距 $D_{\tau_r(z)}$ 边界不超过 $r$（第 228-231 行）。Green 递减恒等式 $-\partial_tK_t(z,w)=4\frac{Y_t(z)}{|Z_t(z)|^2}\frac{Y_t(w)}{|Z_t(w)|^2}$（第 212-216 行）与系数界 $|b_t(z)|\le Cr^{-p}Y_t(z)/|Z_t(z)|^2$（第 200-203 行）相乘并在重叠区间积分，得对偶界 $Cr^{-2p}K_{D_{\tau_r(z)}}(z,w)$（第 221-224 行）。随后是边界层占领引理（mesh:layer，第 122-174 行）：对距边界不超过 $r$ 的层，$\int K_D(z,w)\,dA(w)\le Cr^2$ 对任意单连通域无光滑性要求。它的证明我读时眼前一亮：先证靠边 $r$ 的点出发有绝对概率 $\eta$ 在 $Ar^2$ 内离开 $D$，机制是"强迫绕行回路"：一段矩形竖穿、沿固定环线绕 $\overline B(0,2)$ 逆时针一圈、再横穿同一矩形，两条穿越相交产生绕数 $1$ 的闭子路径（图注见 captions 第 2-3 行；tikz 源 brownian-circuit 第 20-45 行画的正是这条蓝橙双穿线）；$D^c$ 连通、碰 $\overline B(0,1)$、无界，回路必撞上它。然后进入边界层 $E_r$ 时分块计长 $Ar^2$、每块成功概率不低于 $\eta$，期望块数不超过 $1/\eta$，Green 占领恒等式收尾（mesh-tails 第 155-173 行）。有了层界，$\int K$ 对 $w$ 积分给 $Cr^2$，再对 $z$ 积分、配对两种次序，路径式括号界 $\int_0^\infty\lvert\int_Ab_t(z)\,dA(z)\rvert^2dt\le Cr^{2-2p}$（第 240-245 行）落定。

随机 Fubini 那段（第 250-291 行）是我核验最严的地方：$N_t(z)=M_t^{(qr)}(z)-M_t^{(r)}(z)$ 的终值恒等式 $N_\infty=\int_A(W_{qr}-W_r)\,dA$ 需要先证 $M_\infty^{(s)}=W_s$：无接近时半径钟下 $R$ 恒高于 $s$，ll:approach 的终端零断言使零延拓在 killing 处连续，有接近时过程冻结在 $W_s$；一致界 $Cr^{-p}$ 允许局部化后有界收敛，$L^2$ 随机 Fubini 或简单空间逼近加 Itô 等距完成互换（第 276-288 行）。指数鞅不等式接上括号界得 slab 尾 $\mathbb P\{\int_A(W_{qr}-W_r)>x\}\le\exp(-cx^2/r^{2-2p})$（第 295-299 行），它明确允许空间积分里每个点起始时刻不同（第 300-301 行）。求和（第 303-324 行）取 $r_j=r_0q^j$ 恰好终结于 $r_f$、$r_0\in(q\delta,\delta]$，$x_j=\delta^{-p}/(j+1)^2$，例外概率 $\exp(-c\delta^{-2}q^{-2(1-p)j}/(j+1)^4)$，指数序列除固定幂先有正下界后几何增长，总和压回 $Ce^{-c'\delta^{-2}}$，域外 $S_N\le C'\delta^{-p}$。$\kappa\le4$ 一侧到此完工。

## §6 网格尾，二：$\kappa>4$ 的自适应窗口

$\kappa>4$ 时上一节的办法失灵：我起初继续硬压括号，试了两页纸就发现缺的是"进圈后大概率被吞"这种概率信息，这正是 §4 末尾物理圆盘法则的接口。先立一个初等集中化引理（win:concentration，mesh-tails 第 334-424 行）：允许测试的先后顺序由曲线自己决定，只要同格窗口的时间区间互不相交。不相交性是免费的：$z$ 窗口运行期间另一格心 $w$ 不能开工，否则 $|z-w|<R+r\le2R<3R$（第 375-380 行）。自适应枚举按"剩余停时取最小"排队，指标在该时刻可测，两个开工时刻不会并同（第 381-386 行），每步用条件 Hoeffding（$Y_k$ 条件振幅至多 $K$、$\mathbb E[Y_k\mid\mathcal F_{\sigma_k}]\le\mu_k$）迭代得 $\mathbb E\exp(\theta\sum_kZ_k)\le\exp(NK^2\theta^2/8)$（第 388-403 行）；无穷等待时该窗输出为零、后续全零，论证原样通过（第 404-408 行）。位移 $\xi\in[0,a)^2$ 平均加 Jensen 加 Tonelli 去掉格近似，MGF 界 $\mathbb E\exp(\lambda\int_D(Y-\mu)\,dA)\le\exp(CK^2\lambda^2R^2)$，优化 $\lambda$ 得尾 $\exp(-cb^2/(K^2R^2))$（第 410-423 行）。全程无独立性假设，这条我在笔记里特别标出，因为后面失败事件估计全靠它。

主证明（第 426-590 行）：层级 $r_j=r_0q^j$，外圈半径 $L_jr_j$、$L_j=L_*q^{-\varepsilon j}$，$\varepsilon<1-p$ 保证 $L_jr_j\le L_*\delta\le1/3$ 恒成立（第 455-461 行）。每个窗口三输出：下一接近指标 $H_j$、归一化密度 $V_j=r_j^pW_{r_{j+1}}H_j$、坏外逃指标 $B_j$；条件上均值依次 $\mu^H_j=C(qr_j)^pW_{r_j}$、$\mu^V_j=r_j^pW_{r_j}$、$\mu^B_j=C_*L_j^{-c_*}I_{r_j}$（第 486-493 行），前两个来自 ll:approach，第三个来自圆盘法则。层级容差 $b_j=(r_j/\delta)^p/(j+1)^2$ 代入窗口尾，指数满足 $\frac{b_j^2}{(L_jr_j)^2}\ge\frac{\delta^{-2}}{L_*^2}\frac{q^{-2(1-p-\varepsilon)j}}{(j+1)^4}$（第 511-520 行）对 $j$ 可和，总例外 $C\exp(-c\delta^{-2}/L_*^2)$，与 $n$、$r_f$ 无关。被窗口漏掉的接近必发生在一次活状态下的外逃之后，得点式 $I_{r_{j+1}}\le H_j+B_j$ 与 $W_{r_{j+1}}\le r_j^{-p}V_j+C(qr_j)^{-p}B_j$（第 528-538 行），积分后是递推 $S_{j+1}\le S_j+\alpha_jA_j+e_j$、$A_{j+1}\le C_1S_j+\alpha_jA_j+e_j$，其中 $\alpha_j=C_2L_*^{-c_*}q^{\varepsilon c_*j}$、$e_j=C_3\delta^{-p}/(j+1)^2$（第 539-561 行）。收尾用了个我起初没想到的合并变量 $U_j=\max(S_j,A_j/\Lambda)$、$\Lambda\ge\max(1,2C_1)$、先定 $L_*$ 使 $\alpha_0\le1/2$，迭代 $U_j\le(U_0+\sum_ie_i)\exp(\Lambda\sum_i\alpha_i)\le C\delta^{-p}$（第 562-589 行）。两个递推若分开处理会互相放大，合并后只差一个可和乘子，这个技巧我在 §9 迭代密集访问时还要借鉴。

## §7 下界半场：删方块、留质量、逐球验证

网格尾到手后，下界按 retained-mass 一节的路线施工。固定紧含于 $\mathbb H$ 的闭盘 $K$ 与自由护圈 $\delta_K$，测度 $\nu_e^T(dz)=\mathbf 1_K(z)W_e(z)\mathbf 1_{\{\tau_e(z)\le T\}}\,dA(z)$（retained-mass 第 18-21 行）。这里有个我起初没意识到的坑：正一阶矩要的是"有限物理时间内完成倾斜接近"的概率，把中心寿命有限（ll:finite-clock）翻译成可积下界。对整数 $m$ 取半径钟层级 $\rho_m(z)$（$R=R_0e^{-m}$），当 $R_0e^{-m}\le e$ 时 Koebe 保证 $\tau_e\le\rho_m$，一阶矩恒等式给出 $\mathbb E[W_e\mathbf 1_{\{\tau_e\le T\}}]\ge M_0(z)\mathbb P_z^{*,m}\{\rho_m\le T\}$（第 42-51 行）；右端对 $m$ 递减，极限 $q_T(z)$ 由引理 ll:finite-clock 得 $q_T(z)\uparrow1$（第 54-61 行），单调收敛积分出 $\mathbb E\nu_e^T(K)\ge\int_KM_0q_T\,dA$（第 66-69 行）。二阶矩由归一化尾积分直接给，于是 $\inf_{e}\mathbb E\nu_e^T(K)\ge m_0>0$、$\sup_e\mathbb E[\nu_e^T(K)^2]\le m_2$（第 29-34 行）。Brown 缩放把实验搬进任何指定容量区间：空间缩放 $c=\sqrt{\Delta/T}$ 使一阶矩变 $c^dm_0$、二阶矩变 $c^{2d}m_2$，比值 $m_0^2/m_2$ 纹丝不动（第 74-79 行），Paley--Zygmund 的成功概率因此与区间长度无关。

删除阶段：$e_N=2^{-N}$，边长 $l=2^{-k}$ 的 dyadic 方块在 $\nu_N(Q)>H_k=Dl^d(\log k)^{p/2}$ 时定为超标（第 84-91 行）。我先质疑过阈值为何带对数因子、不带行不行，答：不带对数时尾巴 $\exp(-cu^{2/p})$ 对 $k$ 求和不可和，恰在 $(\log k)^{p/2}$ 处反解出 $\beta=cD^{2/p}>1$。支撑超标块贡献的必要事件是 $E_Q$：$\sigma_Q$ 为首个命中 $\partial B(z_Q,10l)$ 时刻，中心若在其前或当刻被吞没，则大圆盘同刻整体被吞、之后进不去（第 102-119 行），这是 geometry 第 159-162 行吞没约定的直接兑现；$\mathbb P(E_Q)\le Cl^p$（第 122-123 行）。在 $E_Q$ 上条件于停止过去，物理坐标下未来密度形式不变，$A_Q=B(z_Q,2l)$ 内用尺度 $2l$ 的归一化尾（时间截断只删贡献），得条件尾 $\mathbb P\{\nu_N(Q)>ul^d\mid\mathcal F_{\sigma_Q}\}\le C\exp(-cu^{2/p})$（第 130-142 行），对 $u=D(\log k)^{p/2}$ 积分乘进门概率 $Cl^p$，得超标期望 $\le Cl^{p+d}k^{-\beta}$（第 93-98 行）。$k$ 层方块数至多 $Cl^{-2}$，幂在 $p+d=2$ 处相消，损失期望 $\le C\sum_{k\ge k_0}k^{-\beta}$（第 157-162 行），先取 $D$ 令 $\beta>1$ 再取 $k_0$ 令总和不超过 $m_0/2$（第 163-164 行），保留测度 $\widehat\nu_N=\mathbf 1_{E_N^c}\nu_N$ 满足 $\mathbb E\widehat\nu_N(K)\ge m_0/2$，Paley--Zygmund 出 $\mathbb P\{\widehat\nu_N(K)\ge a_*\}\ge p_*$（第 166-176 行）。

极限阶段我把两处小心处记了下来。其一，逐球验证绕开了"网格边界质量"的麻烦：给定小 $r$ 取固定 dyadic 边长 $l\in[r,2r)$，开球 $B(x,r)$ 只碰该层有数个方块，$\widehat\nu_N(B(x,r))\le CDl^d(\log\log(1/l))^{p/2}\le C'h(r)$，Portmanteau 传给弱极限 $\nu(B(x,r))\le C'h(r)$（第 202-215 行）；对每个 $x,r$ 都成立，于是 $\nu$ 无原子、且 $\nu^*(U)\le Ch(\operatorname{diam}U)$，可数次可加对迹覆盖求和给 $\mathcal H^h(K\cap\gamma([0,T]))\ge\nu(K)/C>0$（第 220-229 行）。其二，limsup 事件概率至少 $p_*$：$\bigcup_{N\ge n}$ 递减到 limsup（第 186-188 行），路径上取子列弱收敛，无需可测选择（第 192-195 行）。正性铺满每个正时间区间靠重启：$[s,t]$ 分 $n$ 个确定性容量段，段起点 $t_i$ 处水动力映射 $g_{t_i}-\sqrt\kappa B_{t_i}$ 把未来变成普通半平面演化、容量时间恰为 $u$，随机时间改变相不存在（第 236-242 行）；每段成功概率条件于过去至少 $p_*$，全败概率 $(1-p_*)^n\to0$（第 244-258 行）；可测性用有理球有限覆盖的可数族处理（第 259-263 行），有理区间求交得单一天概率一等式对全体真实 $s<t$ 成立（第 264-266 行）。

节末的预极限香肠命题（retain:sausage）是我为上界备的第二件弹药：$X_e(J)=e^{-p}\operatorname{Area}\{z:\operatorname{dist}(z,\gamma(J))<e\}$，对确定性区间 $J=[s,t]$ 有 $\lim_{a\downarrow0}\limsup_{e\downarrow0}\mathbb P\{X_e(J)<a\}=0$（第 274-287 行）。证明不经过极限测度：对 $\nu_{e/2}^T(K)$ 直接用 Paley--Zygmund 得成功概率 $p_{\rm s}$，配合 $W_{e/2}\le Ce^{-p}$ 与支撑在 $e/2$ 邻域内翻译成香肠面积下界（第 294-304 行）；分割 $J$ 为 $n$ 槽，$n$ 个确定性区间上的导数上下界 $b\le|F_i'|\le L$ 除概率 $\eta$ 外成立（第 306-316 行），半平面网格取 $\lambda e$ 小到像距离压回物理 $e$，Jacobian 至少 $b^2$ 保质量（第 317-324 行），$\limsup_e\mathbb P\{X_e<a_{n,\eta}\}\le\eta+(1-p_{\rm s})^n$（第 328-331 行）。节末声明只覆盖确定性区间、随机通过先做可数穷举选有限有理区间清单（第 338-346 行），这条限定决定了 §8 里所有"无条件减尾"的合法性。

## §8 上界的地基：蛇形带一步的一致性

上界需要一个"比寻常尺度携带更多香肠面积"的局部事件，构造是蛇形带：单位速曲线 $\sigma$、曲率不超 $1/10$、嵌入带 $P(s,x)=\sigma(s)+xn(s)$、$|x|\le1$，起点起 $0\le s\le4$ 竖直，$\epsilon=1/50$（ribbon 第 48-58 行）。许可过去的定义苛刻而必要：首个到达 $s=k$、此前留在 $|x|<\epsilon$、只在带基碰实轴、终点偏移 $\lvert x_a\rvert\le\epsilon/4$（第 60-66 行）。目标是 rc:step：存在只依赖 $\kappa$ 与带常数的 $q,c,v_0$，对每个许可过去与每个 $0<v<v_0$，条件概率至少 $q$ 完成"下一个 $s=k+1$ 首穿、段内留 $k-1/4<s<k+1$、$|x|<\epsilon$，且中段区 $P((k+1/3,k+2/3)\times(-\epsilon,\epsilon))$ 内归一化香肠质量至少 $c$"（第 68-86 行）；半宽 $\ell$ 的带截断变 $v_0\ell$、下界变 $c\ell^d$（第 87-88 行）。我起初以为逐点支撑定理加重启推论自动给出一致的 $q$，读完 geometry 第 387-388 行的免责声明才确认必须自建一致机件，卡点在三处：新端点唯一 prime end 的连续访问、逆映射在无边界连续模情形的一致控制、香肠质量沿映射传递。

向导 $\alpha(t)=P(k+t,x_a(1-4t)_+)$ 接中心线到无穷（第 96-99 行），间隙界 $\operatorname{dist}(\alpha(t),\partial D)\ge c\min(t,1)$（第 104-107 行）的证明用了带嵌入性：非局部过去进不了前方坐标球（第 109-111 行）。中途点 $w=P(k+1/2,0)$ 的角正弦下界 $\sin\arg g(w)\ge s_*>0$（第 117-119 行）我起初想用共形半径硬算，改成调和测度路线后豁然：向导把 $D$ 分成两侧 prime end 弧；从 $w$ 出发先在小自由球内落到选定一侧，再沿带走到偏移 $\pm1/2$、退回 $s=k-1/2$ 的横向矩形，矩形内过去的纵向穿越（取后边末次到前边首次之间那段连通链）把两个横向端隔开，任何横穿必碰过去（第 121-136 行）；于是两条 prime end 弧的调和测度各有绝对下界，半平面坐标下就是 $\arg g(w)/\pi$ 与其补（第 148-151 行）。这条论证对带芯内部的过去不作任何正则性要求（第 152 行），正是我需要的粗粒度。

紧致性引理（es:guide-compactness，第 185-308 行）的命门是均匀端点塌缩：若 $\beta_n([0,h_n])$ 触到模长 $\varepsilon$，取 $T_n=\log(r_0/(Ch_n))\to\infty$、截断位势 $U_n=\min\{T_n,\log^+(\lvert F_n(e^{v+i\phi})-a_n\rvert/(Ch_n))\}$，能量 $\le2\pi T_n$（第 254-265 行）；每个 $v<\log\varepsilon$ 截面有零点（导引弧段本身），角向 Cauchy--Schwarz 加一维 Poincaré 把 $U_n$ 的 $L^2$ 锚定传播到固定矩形（第 279-293 行），而 $\log K$ 上 $U_n=T_n$ 有固定面积，$\lvert\log K\rvert T_n^2\le C_{J,\varepsilon}2\pi T_n$ 矛盾（第 297-302 行）。Hurwitz 补上 $a\notin F(\mathbb H)$（第 304-308 行）。小像半圆引理（es:good-semicircle，第 310-375 行）给拼接用：$A=\log L$，每个低于 $\log b_0$ 的单位对数 slab 内有 $B$ 使上半圆像 $\le r\exp\{-A+\pi\sqrt{2A}\}$（第 321-325 行），扇区版本加常数 $6$（第 327-332 行），$A\ge64$ 时双双小于 $r/4$（第 333 行）；工具是 Koebe 四分之一定理推出 $\log\lvert F-a\rvert$ 按双曲距离 $2$-Lipschitz，扇区到 $iB$ 双曲距 $\cosh d\le65/8<\cosh3$（第 356-371 行）。几何拼接段（第 377-404 行）说明竖段、半圆段、导引段依次接入，转角在开邻域内磨圆，局部一致收敛足以传递全部严格通过限制。

rc:step 的证明是反证加五步转移（第 420-673 行），我按自己的理解重排其骨架。第一步：若一致断言失败，取坏数据列与 $v_n<1/n$，平移使尖点有界，坐标图 $Q_n(u,x)=P_n(k_n+u,x)$ 在 $V=[-1/2,3/2]\times[-1,1]$ 上一致收敛到 $Q$（第 421-433 行），紧致性引理给 $F_n\to F$（第 433-437 行）；关键是"一个普通参数面 SLE $\gamma$ 供全部 $n$ 使用"，各 $F_n\circ\gamma$ 恰好是各自状态的条件下延拓律（第 439-443 行），不需要各状态间任何联合关系。第二步：固定竖穿事件 $E_b$（高度 $b$ 在 $Ab^2$ 内达成、实部小于 $b/4$）概率 $q_0$ 与 $b$ 无关（Brown 缩放），再取 $L$ 使 $\log L\ge64$、$CL^{-c}<q_0/2$（第 460-470 行）；像定位事件 $G_n$ 满足 $\mathbb P(E\setminus G_n)\le CL^{-c}$，$\mathbb P(E\cap G_n)\ge q_0/2$（第 493-503 行）。第三步： witnesses 集合 $C$ 由带边距 $\delta$ 的紧集 $V_\delta,P_\delta,M_\delta,O_\delta$、紧矩形 $K_j$ 与有理时刻三元组枚举成可数并，不依赖 $n$（第 513-559 行）；每个 $E$ 中样例经薄管拼接给出 $q(\omega)=\mathbb P(C\mid\mathcal F_\tau)(\omega)>0$（第 580-584 行）；截 $q_1$ 得 $\mathbb P(E\cap G_n\cap C)\ge q_2=q_1q_0/4$（第 587-594 行）。第四步：有限子族保留后，$\delta/(4K)$ 一致误差把 witnesses 转移到第 $n$ 图，竖段坐标 $u_n<1/4$、终点 $u_n>1$ 逼出首穿 $u_n=1$ 处 $|x_n|<\epsilon/4$，中段区间 $J=[t_-,t_+]$ 落进第 $n$ 中段区带正裕度（第 599-628 行）。第五步：$c_*\le|F_n'|\le C_*$ 于 $K_{2j}$，香肠转移不等式 $v_n^{-p}\operatorname{Area}\ge c_*^2\lambda^p(\lambda v_n)^{-p}\operatorname{Area}(N_{\lambda v_n}(\gamma(J)))$（第 630-648 行），确定性区间清单上的 retain:sausage 是无条件估计，可正当地从 $\mathbb P(E\cap G_n\cap C)$ 里减掉（第 650-656 行），余下概率 $\ge q_2/2$ 对大 $n$ 超过 $1/n$，矛盾收官。我事后特别核对：辅助 witnesses 可以看 $t_{\rm out}$ 之后的尾段，真正的步事件在首穿时可测、迭代时尾段整个丢掉（第 661-667 行），一致性由此闭合。

## §9 密集访问：指数 $e^{-Cm^2}$ 与质量 $r^dm^p$ 的会算

密集访问命题（rc:dense，ribbon 第 677-704 行）把一步变全局。规格化后标记点 $w=g(z)$ 在上单位半圆、$\operatorname{Im}w=y\ge s_0$；取 $w'$ 横向平移 $s_0/4$、盘 $\mathcal D$ 半径 $s_0/20$（第 707-713 行）；盘内放 $2m+1$ 根高 $2h_0$（$h_0=s_0/200$）的竖段、等距排布、两端以交替外半圆缝合、蛇形穿越，最后一段竖直上行延到无穷（第 715-726 行）；带半宽 $\ell=h_0/(C_0m)$，非相邻直通段间距相当于 $h_0/m$ 远大于 $\ell$、转弯半径至少 $10\ell$，嵌入性自查通过（第 729-740 行）。步数 $N=\lceil s_{\rm out}/\ell\rceil+1$，$s_{\rm out}=O(m)$、$\ell\asymp m^{-1}$ 得 $N\le Cm^2$，而盘内完整中段区至少 $cm^2$ 个（第 742-750 行）。图注把这套布局写成了两张示意图（captions 第 9-11 行，serpentine-ribbon 源第 49-87 行标了 $\ell=h_0/(C_0m)\asymp m^{-1}$、$N\asymp m^2$ 与橙色离散中段标记）。

 prescribed 物理网格 $v\le r\delta_m$ 换算成参数网格 $\eta=\lambda v/r$，$\delta_m$ 满足 $\lambda\delta_m<\min\{v_0\ell,\chi/2\}$（第 761-781 行），于是每一步的 rc:step 在同一个 $\eta$ 上可用，这是"全部测试共享一个物理网格"的出处，也是覆盖层能向单一香肠测度记账的前提。初始竖直缝步有缩放无关的正概率 $q_{\rm init}$，其后每步条件概率至少 $q$，逐条件期望迭代 $\mathbb P(E_\eta)\ge q_{\rm init}q^N\ge c\exp(-Cm^2)$（第 786-800 行）；成功时盘内不相交中段区贡献 $\ge cm^2\ell^d\asymp m^{2-d}=m^p$ 的归一化面积（第 801-807 行），共形面积变化乘回 $cr^d$（第 809-814 行），质量式 $cr^dm^p$ 到手。这里的幂次账我反复验算：$\ell^d$ 来自带半宽 $d$ 维伸缩，$m^2$ 来自段数，$m^2\cdot m^{-d}=m^{2-d}=m^p$，正是要喂给 $\sqrt{\log n}$ 选 $m_n$ 的那只口袋。

收尾三件小事各拦过一次路。其一，成功路径全程困在"盘加连接器细邻域加末端短桩"构成的障碍内，障碍补集连通，故每个前缀填充 hull 都含于障碍（第 815-827 行），标记点与它周围固定球经"竖直到高度 $2$、横移到 $\pm3$、下沉到实轴小区间"的路线始终与 prescribed 迹保持正间隙（第 828-841 行），两条 Brown 追踪路线给两侧边界弧调和测度一致下界，角正弦 $\ge s_1$、参数共形半径 $\ge c_1$、物理半径 $\ge c_2r$，取 $C_1>1/c_2$ 留足余量，半径截断 $\rho$ 在成功之前不会到（第 842-849 行）。其二，倾计算账：成功停时 $T$ 处 $M_T/M_0\ge s_1^{a_0}$（第 851-860 行），有限停止换律（先截确定性容量视界再放开）给倾斜概率 $\ge s_1^{a_0}$ 乘普通概率（第 861-866 行）。其三，第 866-868 行强调所有测试都对着已生成的有限停时香肠，不借助任何极限标记点访问，这与 §7 的"只取有限停定律"姿态首尾呼应。至此上界的三件弹药（一步一致概率、密集访问概率与质量、预极限香肠下尾）齐备，只等覆盖层把它们兑换成 $\mathcal H^h$ 期望界。

## §10 覆盖层：向单一香肠测度记账

dense-cover 一节做最后的兑换。整条迹 $\Gamma=\gamma([0,\infty))$ 的平面香肠定义随机测度 $\mu^v(A)=v^{-p}\int_A\mathbf 1_{\{\operatorname{dist}(w,\Gamma)<v\}}\,dA(w)$，截断版 $\mu_t^v$ 把 $\Gamma$ 换成 $\gamma([0,t])$，恒有 $\mu_t^v\le\mu^v$（dense-cover 第 14-22 行）。这层不等式是全文我最满意的一根轴心：质量验证用截断 sausage 在停时端点完成，记账却开在整条迹上，不等号方向刚好让两端无缝对接。

先立全局充要量：引理（lem:cover-charge）断言 $\sup_{0<v\le1}\mathbb E\mu^v(B(0,R))\le C_R$（第 94-101 行）。证明分两层：$y=\operatorname{Im}w>Av$（$A>8e$ 固定）时，访问几何加单点界给 $\mathbb P\{\operatorname{dist}(w,\Gamma)<v\}\le Cv^pM_0(w)$（第 105-111 行）；剩下 $-v<y\le Av$ 的薄层面积 $\le C_Rv$，Tonelli 得 $\mathbb E\mu^v\le C_Rv^{1-p}+C\int M_0$，边界积分 $\int_{-R}^R\int_0^R(2y)^{-p}\,dy\,dx$ 收敛恰因 $p<1$（第 113-125 行）。我最初把这条界当成技术性副产品，后来明白它才是"整条迹一次算清"的实体：定理的空间期望不经受逐时间区间求和（introduction 第 86-90 行明说），靠的就是这个一致 $C_R$。访问几何引理（第 76-92 行）补上必要事件：方格被迹访问蕴含活体半径掠过 $Lr_n$（$L=16$ 够用），被吞没而未先Meet圆盘则整盘进被吞分支，对 $\kappa>4$ 同样成立，因为它谈的是迹本身。

主命题（prop:dense-cover-upper，第 128-388 行）的流程我按五个开关来记。开关一是尺度布置：$T_0>1+\log C_1$ 定 $r_j=e^{-T_0j}$，取 $J_0=\lfloor n/3\rfloor$、$J_1=\lfloor2n/3\rfloor$、$m_n=\lfloor c_0\sqrt{\log n}\rfloor$（第 146-153 行），$T_0$ 的不等式保证成功质量在 $S_{j+1}$ 之前生成、半径截断 $r/C_1$ 落在测试窗口外（第 189-191 行）。开关二是确定性网格：$v_n$ 取 $\min_{J_0\le j\le J_1}\varepsilon(e^{-1}r_j,m_n)$ 的一半并满足 $v_n\le2^{-n}$、逐半递减（第 158-169 行），这里 dense 命题"截断只依赖 $m$ 与常数、对停止状态一致"的性质（第 71-74 行）兑现成"所有中心、所有层级共用一个物理网格"，是我在 §9 反复强调的接口的终点。开关三是逐条件概率链：单中心 $z$ 用 $\mathbb P_z^*$ 只到有限钟层；角好事件条件概率 $\ge1/2$（eq:cover-angle 加 Markov，第 180-183 行），密集访问给成功条件概率 $\ge c\exp(-Cm_n^2)$，选 $c_0$ 使 $Cc_0^2<1/2$ 后下界变成 $n^{-1/2}$（第 206-211 行）；失败事件 $F_n(z)=\cap_jA_{n,j}^c$ 被逐条件期望压成 $(1-n^{-1/2})^{J_1-J_0+1}\le C\exp(-c\sqrt n)$，第 225 行注明测试间与中心间都不需独立性。开关四是回到原律：候选盘按终末香肠 $\mu^{(n)}(D_j(z))\ge b_1r_j^d(\log n)^{p/2}$ 界定（第 227-232 行）；被访问且无候选的方格蕴含 $F_n(z)$ 加活体半径掠过 $Lr_n$，先用 eq:cover-one-point 再用有限换律恒等式 eq:cover-finite-tilt，得 $\mathbb P\{\text{访问且无候选}\}\le Cr_n^pM_0(z)e^{-c\sqrt n}$（第 233-254 行），全部换律发生在有限共形半径层，这条纪律我在每个用到它的地方都核了一遍。开关五是记账：候选盘按半径降序贪心选不相交族，被弃盘含于所选盘的同心三倍盘，$r_n/r_{J_1}\to0$ 使三倍盘覆盖全部有候选的方格（第 259-269 行）；一致估计 $h(6C_3r_j)\le Cr_j^d(\log n)^{p/2}$ 加候选资格加不相交性，把所选盘的总代价压在 $C\mu^{(n)}(B(0,R+1))$ 内（第 270-285 行）；补上的漏网方格期望代价 $C_Kr_n^{-2}r_n^d(\log n)^{p/2}r_n^pe^{-c\sqrt n}=C_K(\log n)^{p/2}e^{-c\sqrt n}\to0$，幂次相消又是 $d+p=2$（第 287-298 行）。最大直径 $\delta_n=\max\{6C_3r_{J_0},\sqrt2r_n\}\to0$（第 299-302 行），Fatou 给 $\mathbb E\mathcal H^h(\gamma([0,T])\cap K)\le C_R$ 对 $T$ 与 $K$ 一致（第 337-350 行）。

可测性小段（第 314-335 行）我起初想跳过，自检时发现它是 Fatou 步的前提，回来补读：固定 $v$ 的香肠积分用有理时间下确界可测，候选指示有限族、贪心序确定，$\mathcal H^h$ 用有理开球有限并覆盖的可数族计算，闭迹避开确定紧集的事件可测。最后的整体化：$K_q=\overline B(0,R)\cap\{\operatorname{Im}\ge1/q\}$、$E_q=\gamma([0,q])\cap K_q$ 递增并到 $\Gamma\cap\overline B(0,R)\cap\mathbb H$，连续从下加单调收敛搬期望（第 352-372 行）；实轴部分用 $O_R(r^{-1})$ 个长 $r$ 区间覆盖，代价 $O_R(r^{d-1}(\log\log(1/r))^{p/2})\to0$ 因 $d>1$（第 373-380 行）。定理证明就是 §7 正性事件与本命题事件的交（第 390-396 行）。我复盘时给覆盖层总结了一句口号：概率机器产质量、几何贪心产覆盖、单测度产记账，三者靠"$\mu_t^v\le\mu^v$ 加有限换律"焊接。

## §11 最终思路与最初设想的差异，以及留下的口子

写到这里可以摊开对比。我最初设想的是"给 Schramm 候选找靠山"：正则闭式应长得像 $r^d\log\log(1/r)$，同伴论文的非显形构造只是它的粗糙化。成品把我三个预设逐一改掉。第一，对数幂是 $p/2\in(0,1/2)$，由尾 $\exp(-cu^{2/p})$ 的可和反演（下界）与 $e^{-Cm^2}$ 概率在 $m_n\asymp\sqrt{\log n}$ 处的兑换（上界）双路确定，Schramm 的指数一被推论否定：$h/g\to0$ 使 $\mathcal H^g$ 在每段正测度迹上都不可 sigma-finite（introduction 第 92-106 行）。第二，构造路线从"正则化近似"换成"有限尺度定量估计直接证两条不等式"，不进口同伴论文的定理；两个精确规范函数之间的关系仍开放（introduction 第 46-47 行原文承认），我也就照实留着这个 `[推测]` 级别的空白：从本文构造反推 openai2026exact 第 (5.8)、(6.4) 式规范函数的对数幂，需要同时比较覆盖下确界与批次结构，素材不足，不硬编。第三，下界与上界的局部事件方向相反：下界删"质量太大"的方块防小球越界，上界要"香肠比寻常多"的密集访问造覆盖元，我在 §2 记下这个不对称时没预料到它最后表现为两台机器的删除线与加强线互为镜像。

方法边界的自查我也标 `[推测)` 太粗，这里分两类说清。素材内可证的边界：$\kappa\le4$ 与 $\kappa>4$ 的分裂是结构性的，前者吃 Green 递减恒等式的单调性（mesh-tails 第 212-216 行），后者吃吞没概率（ll:disk-rule），两边在 $\kappa=4$ 交棒；尾巴幂 $2/p$ 在 $p\to0$（即 $\kappa\to8$）时趋于无穷，删除阈值的对数因子 $(\log k)^{p/2}$ 同时退化，$h$ 向 $r^2$ 靠拢，可本文全部一致常数（$\delta_0$、$u_0$、$v_0$、$L_0$）都依赖固定 $\kappa$，定理陈述也固定 $\kappa$（introduction 第 69 行"on one event"对单一参数值），$\kappa=8$ 端点是否成立素材里没有答案。素材外推的部分我明确标 `[推测]`：$0<\kappa<8$ 之外弦状迹本身触及实轴乃至失去连续迹（Rohde--Schramm 的连续迹定理覆盖范围即 geometry 第 14-16 行引用的那个），ll:near-real 证明里的 $\mu=4-\kappa/2-C\delta>0$（local-laws 第 396-397 行）恰在 $\kappa\to8$ 处消失，这提示避开实轴的输入门槛与本文参数区间同一命脉，但把它说成"障碍"超出 tex 素材已证内容。

相关工作的接口再记三笔，防止日后误读。其一，自然参数化一侧的规范函数带负幂：Holden--Yuan 的 $r^d(\log\log(1/r))^{-(d-1)}$ 作用在有序分割的变分上（introduction 第 115-118 行），本文正幂 $+p/2$ 作用在任意空间覆盖上（第 119-123 行），两个对数修正符号相反、对象不同，本文论证不依赖二者任一与 $\mathcal H^h$ 的等同（第 122-123 行原文），我把这行免责声明当作防止"统一两种长度"式过度解读的护栏。其二，Rezaei--Zhan 的多点接近界与自然长度矩有限（introduction 第 148-150 行）允许任意接近半径，但没给积分停止密度的定量尾，本文新增的是对过去与最终网格双一致的单条尾（第 151-153 行）。其三，Tran--Yuan 逐点支撑不提供粗糙过去上共同的条件下界（第 196-198 行），这句话直接解释了 §8 一整节紧致性机器的存在理由。覆盖策略的谱系也照实记：Rezaei 的维数证明已用密集占据、停止历史后条件估计、紧致性与指定螺旋通过（introduction 第 187-189 行、第 218-222 行），本文的增量是把对数律的定量版本（$m^2$ 步概率与 $m^p$ 质量）插进同一骨架，并用贪心不相交盘把覆盖代价钉在单一有限网格香肠测度上。

## §12 收尾量级复核：十二个我重新算过一遍的数字

交稿前我把全文反复引用的常数与幂次逐个重验，以下按"数字、出处、我复核的路径"记录。这些条目是给自己看的，行号仍指 tex 原文。

其一，$q\le1/(8\mathrm e)$ 的出处与原因。ll:approach 的 Euclidean 接近界要求 $\varepsilon\le\delta_0/(8\mathrm e)$（local-laws 第 254 行），推导链是：$S_\varepsilon$ 有限时 Koebe 给 $R_{S_\varepsilon}\le4\varepsilon$，活半径必更早掠过 $8\varepsilon$，而 $R_0\ge\delta_0\ge8\mathrm e\varepsilon$ 使对应半径钟至少为 $1$（第 292-295 行），逆角矩一致界恰在 $s\ge u_0=1$ 一档生效（第 145-150 行）。$8\mathrm e$ 里真正的信息是"$8$ 来自 Koebe 的四倍乘二、其余留给 $u_0=1$ 的余量"，mesh-tails 第 72-73 行、retained-mass 第 26-27 行、第 107-110 行与 ribbon 第 449-451 行的同型条件全由此派生。

其二，访问几何里 $L=16$ 的出处。迹访问边长 $r$ 的方格蕴含活体半径掠过 $Lr$：若中心被吞没而未先接触 $\overline B(z,2r)$，整盘进被吞分支；否则首次接触前夕活半径至多 $8r$（Koebe 反向），连续性逼出更早的 $16r$  crossing（dense-cover 第 79-90 行）。同段把"迹距小于 $v$"归到 $16v$ 的半径掠过，且声明论证的对象是迹本身、对填充 hull 不自动成立、$\kappa>4$ 不例外（第 90-92 行），我确认 §10 漏格界只消费迹版本。

其三，$T_0>1+\log C_1$。半径从 $r_j$ 缩到 $e^{-1}r_j$ 用一整格钟，密集访问承诺在半径落到 $r/C_1$ 之前完成（ribbon 第 687-689 行），$e^{-T_0}<1/C_1$ 等价于 $T_0>\log C_1$，再加一保证质量在 $S_{j+1}$ 端点前进入截断 sausage（dense-cover 第 148 行、第 189-191 行）。这解释层级间距为何定成 $r_j=e^{-T_0j}$ 的指数几何列。

其四，角度截断的 $1/2$。eq:cover-angle 把一致逆角矩搬成条件期望界（dense-cover 第 37-41 行），Markov 选取充分大的固定截断使角好概率条件于 $S_j$ 全历史至少 $1/2$（第 180-183 行）；成功下界 $c\exp(-Cm_n^2)$ 由此乘上 $1/2$ 再调常数，最终以 $n^{-1/2}$ 现身（第 206-211 行）。

其五，联合可测版本。$\tau_r,W_r,I_r$ 对 $(z,\omega)$ 的联合可测性先在紧存活子集局部化、再穷尽（mesh-tails 第 62-67 行）；窗口引理把输出与上均值的联合可测列为明文假设（第 351-352 行）；ribbon 一侧第一退出与死亡时刻经紧局部化获得可测版本（第 479-482 行）。我最初以为这段可以一句带过，重读 §5 随机 Fubini 后确认：空间积分写成 $N_t=\int_Ab_t(z)\,dA(z)$ 的前提恰在这里。

其六，规范函数的有界倍率伸缩。固定 $L$ 时 $h(Lr)/h(r)\to L^d$（retained-mass 第 10-12 行），双重对数在缩放下半径不变，所以一切紧内域的坐标更换只付常数倍；§7 逐球界与 §10 一致估计 $h(6C_3r_j)\le Cr_j^d(\log n)^{p/2}$（dense-cover 第 270-274 行）都只消费这条有界倍率，从不假装 $h$ 精确齐次。

其七，slab 求和的指数账。$x_j=\delta^{-p}/(j+1)^2$ 代入 $\exp(-cx_j^2/r_j^{2-2p})$，用 $r_j=r_0q^j$、$r_0\le\delta$ 得指数 $\delta^{-2}q^{-2(1-p)j}/(j+1)^4$（mesh-tails 第 310-319 行）；$(j+1)^4$ 来自 $x_j$ 的平方，"指数序列除固定幂先降后升、有正最小值"是几何级数求和的托词，我数值代入 $q=1/(8\mathrm e)$、$p=1/2$ 验过单调转折点存在。

其八，$\kappa>4$ 的指数账。$b_j^2/(L_jr_j)^2$ 展开为 $\delta^{-2}L_*^{-2}(r_0/\delta)^{2p-2}q^{-2(1-p-\varepsilon)j}(j+1)^{-4}$（第 511-520 行），比 slab 版多出 $q^{2\varepsilon j}$ 的让步，代价是 $L_*^{-2}$，这就是 $L_*$ 必须先固定、$\delta_0$ 后取的调度顺序的算术根源；递推里 $r_j^{-p}b_j=\delta^{-p}/(j+1)^2$ 恰好干净（第 557-559 行），$q^{-p}$ 全被吸收进常数。

其九，$e^{-Cm^2}$ 兑换 $(\log n)^{p/2}$ 的双向账。概率方向：$c\exp(-Cm_n^2)\ge n^{-1/2}$ 当 $Cc_0^2<1/2$（第 206-208 行）；质量方向：$m_n^p$ 与 $(\log n)^{p/2}$ 同阶用到 $m_n\ge(c_0/2)\sqrt{\log n}$ 的大 $n$ 下限（第 196-201 行），两处 $\sqrt{\log n}$ 是同一个 $m_n$ 的两次消费，我核对过 floor 与初值有限剔除不破坏阶。

其十，缩放指数的三连。空间缩放 $c$：密度 $R^{-p}$ 乘 $c^{-p}$、面积乘 $c^2$，积分密度净乘 $c^{2-p}=c^d$（mesh-tails 第 108-111 行）；带半宽 $\ell$：归一化质量乘 $\ell^{2-p}=\ell^d$（ribbon 第 671-672 行）；蛇形带总质量 $m^2\ell^d$ 配 $\ell\asymp m^{-1}$ 得 $m^{2-d}=m^p$（第 801-805 行）。三处的公共基因都是"香肠归一化幂 $-p$ 与面积幂 $+2$ 之差 $d$"。

其十一，$p<1$ 与 $d>1$ 的两次压轴。充要量引理的边界层积分 $\int_0^R(2y)^{-p}dy$ 收敛当且仅当 $p<1$（dense-cover 第 117-125 行），实轴零测的覆盖代价 $r^{d-1}(\log\log(1/r))^{p/2}\to0$ 依赖 $d-1>0$（第 373-378 行）；这两个不等式在参数侧等价于 $0<\kappa<8$ 的开区间两端，是全篇唯一直接触碰参数范围边界的两处硬依赖，§11 的端点讨论以它们为准。

其十二，事件交的顺序。定理证明取 §7 正性事件、本命题全时估计事件、以及推论所在事件之交（dense-cover 第 390-396 行、introduction 第 69-85 行），每处都是可数交（有理区间、整数半径、整数盒子），我确认没有一层需要选择公理式的不可测交，正性事件的可测性已在 retained-mass 第 259-266 行以有理球族解决。

## §13 歧路与死胡同总清单

先申明性质：tex 素材只呈现成品定理，不记录失败尝试，下面每条"我走过的死胡同"属于第一人称叙事性重构，全部 `[推测]` 级；但我给每条都钉一个它在成品里被堵上的痕迹行号，保证重构有出处、不编造事实。

死胡同之一：无条件引用带连续边界的 Carathéodory 延拓定理。堵痕：geometry 第 31-72 行整段在补局部连通与填充论证，第 445 行（local-laws）与第 457-458 行明写"不需要边界连续模"，第 179-181 行（es:guide-compactness 前的导语）再强调紧致性论证只需要导引上的控制。成品对"边界正则性"的过敏程度反过来证明这条路确实先撞过墙。

死胡同之二：把 Rezaei--Zhan 的多点接近界直接当网格尾用。堵痕：introduction 第 148-153 行先列他们的定理、再点名本文新增成分是"定量 $e^{-cu^{2/p}}$ 尾加对过去与最终网格的一致"；mesh-tails 第 4-7 行把"最终网格一致性"说成整节的本质特征。若旧引理够用，这两处免责声明不会有。

死胡同之三：对历史族做朴素紧致性来把逐点支撑升为一致下界。堵痕：geometry 第 387-388 行宣布一致下界"仍需单独论证"；ribbon 第 8-9 行直言固定光滑模板的正概率在通过数增多时不够用；成品给出的替代是三重保险：许可过去的窄类（第 60-66 行）、带裕度 $\delta$ 的闭条件 witnesses 与有理时刻（第 513-559 行）、先定 $L$ 后选局域化尺度的顺序（第 460-470 行）。我推测真正的坑在"闭包收敛会吞掉严格不等号"，因为第 514-516 行专门把裕度写进紧集定义、第 599-617 行用 $\delta/(4K)$ 量化转移误差。

死胡同之四：在覆盖层假设各中心各层级测试相互独立。堵痕：dense-cover 第 224-225 行"测试间与中心间都不需要独立性"，mesh-tails 第 330-332 行"不针对试验位置的排列作条件"。两处都对着同一个假想敌开火，说明有人（我）先想过伯努利式试验串。

死胡同之五：把全时空间期望拆成逐时间区间界再求和。堵痕：introduction 第 86-90 行明文否定该做法；成品的路线是 $\mu^v$ 整迹单调性加 $K_q$ 穷尽（dense-cover 第 20-22 行、第 352-372 行），且 $C_R$ 与 $T$、$K$ 无关（第 346-350 行）。若逐段求和可行，"$C_R$ 与时间截断无关"就不是要被强调的性质。

死胡同之六：用共形半径径直当 Euclidean 距离。堵痕：ll:approach 推导里 $8\varepsilon$ 与 $8\mathrm e\varepsilon$ 的两次 Koebe 换手（local-laws 第 290-295 行）、访问几何里 $L=16$ 的松弛（dense-cover 第 85-90 行）、以及 eq:cover-one-point 只在 $\rho\le e^{-1}R_S$ 时启用（第 43-49 行）。这三处"留一格钟"的纪律是对过度直接的翻译的修补。

死胡同之七：在随机区间上条件地使用香肠下尾。堵痕：retain:sausage 只声明确定性区间（retained-mass 第 280 行），第 338-346 行说明随机通过要先经可数穷举选有限有理清单、再减无条件例外；ribbon 第 33-36 行同样写明"不把该估计条件于指定通过、也不直接用于随机区间"。成品绕行的姿态比绕行本身更有信息量：直接条件化会破坏"$a,e_0$ 可提前固定"，§8 第五步的减法就没了落点。

死胡同之八：指望上下界共用同一个带指数一对数修正的规范函数。堵痕：推论 cor:larger-gauge 的存在本身（introduction 第 92-106 行）。一条比值趋零的引理把整个候选类送入"不可 sigma-finite"，这种干净利落的否定通常是作者对自家旧猜想的葬礼，我把它读作叙事上的自传痕迹。 `[推测]` 标注范围：以上"读作"均属动机重构，不含定理内容层面的新增断言。

## §14 勘误与自检

勘误一（违例字符的处置）：首轮落盘后按类别做全文检索，发现 §2 有一处禁令表第二类中的四字过渡套语，已就地替换为同义的"等价地看"；这是本文件唯一一次对已落盘正文的字符级改动，已在交付报告单独申报。改后复测，禁令表三类（两字转折连接词、四字过渡套语、单字符长停顿号）及表内其余条目全文命中数均为 $0$。长破折号类：全文人名连接用 `--`、区间用 `-`，未使用任何单字符长停顿号。

勘误二（文字性误植清单，均不影响数学含义，按规格不回改）：§0 首句"2026 年 9  26 日"漏"月"字，应读"9 月 26 日"；§1 末段"ball 上界"系"小球上界"的未清洗混排；§2"竖strand"应读"竖直弦段"（ribbon 第 715-716 行的 $2m+1$ 根竖段）；§4 一处"range"应读"值域"；§8 起反复出现的 witnesses 系指 §8 第三步的可测见证事件（ribbon 第 537-559 行的 $C$ 族）；§9 段首 prescribed 系"给定的"；§10"未先Meet圆盘"应读"未先接触圆盘"；§12"半径掠过 $16r$ crossing"多写一个英文词；§11 一处方括号误写为左方右圆（"推测"标记的第二个字符），应读作常规 `[推测]` 标记；prime end、driver、slit、hull、slab、Koebe、Poincaré、Gegenbauer、Hurwitz、Tonelli、Fatou、Portmanteau、Paley--Zygmund 等术语按数学笔记习惯保留原文，不视为误植。

自检记录：一，每次追加后立即执行字节量测与禁令串检索，探针（在 §0 末尾追加登记行并复量）显示落盘功能正常，字节从 8,148 增至 8,190。二，行内公式全部 `$...$` 成对；表格数学不套反引号；表内数学的限定算子一律 `\mid`、绝对值一律 `\lvert\rvert`、范数一律 `\lVert\rVert`，覆盖正文与台账。三，小节编号 §0 至 §15 连续递增、动笔前已排定、落盘后未对调；前向引用（§5、§7、§8、§9、§10、§11、§12）所指小节均真实存在于本文件。四，全文 LF 换行；无整行三横线分隔符；无表情符号与勾号；无装饰性加粗列表；无聊天残留与能力声明。五，`[推测]` 共两处体系：§11 的两处素材不足声明与 §13 的清单性质申明，均附理由。六，台账见 §15，位置栏全部来自本会话真实 Read 过的 `文件:行`，未用到未读来源。

补记：上文勘误一写下"唯一一次"之后，交付前的全文复测又在 §12 第二条发现一处禁令表第一类里的双字转折搭配，已就地替换为迂回写法；这是对本文正文的第二次也是最后一次字符级修改，"唯一一次"当改读为"共两次、均在交付报告申报"。替换与复测之后，禁令表全部条目（含两类连接词与套语、单字符长停顿号、整行分隔符、表情符号勾号）在本文的命中数均为 $0$。

## §15 台账

下面是本笔记唯一的一份五列台账，逐行登记从 tex 里读出的符号、数值或增长率、真实读取位置、消费方与改动后果；行号对应 `build/` 下源文件的物理行。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $d=1+\kappa/8$ | $1<d<2$ | build/sections/introduction.tex:55-57 | 规范函数主幂与全部幂次记账 | 上下两半场的相消点同时失配 |
| $p=2-d=1-\kappa/8$ | $0<p<1$ | build/sections/introduction.tex:56 | 尾指数 $2/p$ 与边界层积分收敛 | 删方块可和性与充要量引理失效 |
| $a_0=8/\kappa-1$ | $\kappa<8$ 时为正 | build/sections/local-laws.tex:18 | 密度形状与 Lyapunov 族 | 逆角矩与寿命论证改形 |
| $h(r)=r^d(\log\log(1/r))^{p/2}$ | 小半径处递增 | build/sections/introduction.tex:59-61 | 定理全部断言的标的 | 主定理整条重写 |
| $g(r)=r^d\log\log(1/r)$ | $h(r)/g(r)\to0$ | build/sections/introduction.tex:93-100 | 推论的非 sigma-finite 判定 | Schramm 候选的否定悬空 |
| $\mathcal H^h(\gamma([s,t]))$ | 正有限 a.s. | build/sections/introduction.tex:71-74 | 定理前半 | §7 与 §10 任一改动即断 |
| $\mathbb E\mathcal H^h(\Gamma\cap\overline B(0,R))$ | $\le C_{\kappa,R}<\infty$ | build/sections/introduction.tex:75-79 | 定理空间期望段 | §10 的 Fatou 链 |
| $M_t(z)=R_t^{-p}\sin^{a_0}\theta_t(z)$ | 鞅并零延拓 | build/sections/local-laws.tex:65-67 | 停止权重与全部倾斜律 | §5、§7、§10 连锁断裂 |
| $M_t$ 的布朗系数 | $\le CR_t^{-p}\sin^{a_0}\theta_t/\lvert Z_t\rvert$ | build/sections/local-laws.tex:73-76 | 括号估计 | $\kappa\le4$ 网格尾断裂 |
| $ds=4Y_t^2\lvert Z_t\rvert^{-4}dt$ | 半径钟 | build/sections/local-laws.tex:61 | 倾斜生成元推导 | 角扩散表示整体失效 |
| $\mathcal L^*=\frac{\kappa}{8}\partial_\theta^2+\cot\theta\,\partial_\theta$ | 端点不可达 | build/sections/local-laws.tex:94-98 | 有限倾斜律一致性 | 换律全部失去依据 |
| $\pi(d\theta)=c_\kappa\sin^{8/\kappa}\theta\,d\theta$ | 不变测度 | build/sections/local-laws.tex:160-162 | 谱展开与核界 | 逆角矩一致界断 |
| $\lambda_m=\frac{\kappa}{8}m^2+m$ | 谱隙至少 $1$ | build/sections/local-laws.tex:174-177 | $k_s$ 在 $s\ge u_0$ 有界 | 一致逆角矩断 |
| $\mathbb P\{\tau_u<\infty\}\le Ce^{-pu}\sin^{a_0}\theta_0$ | 半径接近 | build/sections/local-laws.tex:249-253 | Euclidean 换算与漏格界 | 接近三件套全链断 |
| $\mathbb P\{S_\varepsilon<\infty\}\le CM_0\varepsilon^p$ | $p$ 次幂 | build/sections/local-laws.tex:255-259 | 进门概率 $\mathbb P(E_Q)\le Cl^p$ | §7 超标期望与 §10 卸载断 |
| $\mathbb E[M_{S_\varepsilon}\mathbf 1_{\{S_\varepsilon<\infty\}}]=M_0$ | 一阶矩恒等 | build/sections/local-laws.tex:260-264 | 正质量与回到原律 | §7 的 $m_0$ 无从谈起 |
| $\delta_t=\min\{\operatorname{dist}(z,\partial D_0),\operatorname{dist}(z,\eta[0,t])\}$ | 活区间上 | build/sections/local-laws.tex:231-234 | 清除停时的迹翻译 | $W_r$ 定义失效 |
| $T^*(z)<\infty$ | a.s. | build/sections/local-laws.tex:310-313 | $q_T(z)\uparrow1$ | §7 正一阶矩断 |
| $\mathbb P\{\operatorname{dist}(v,\gamma)<\varepsilon\}\le C\varepsilon^c$ | $1/2\le\lvert v\rvert\le2$ | build/sections/local-laws.tex:361-367 | 矩形能量引理命中假设 | 共形定位断流 |
| $\mathbb P\{\mathcal X\cap\{u=H\}\ne\varnothing\}\le C\frac{E}{H^2}e^{-cH^2/E}$ | 能量尾 | build/sections/local-laws.tex:466-471 | 定位命题 | §8 第二步转移断 |
| $\mathbb P\{F(\gamma[0,\sigma_{L^b}])\not\subset B(q,Lr)\}\le CL^{-c}$ | 对 $F$ 一致 | build/sections/local-laws.tex:523-533 | 圆盘法则与 $G_n$ 估计 | §6、§8 双断 |
| $\beta<1-4/\kappa$ | $\kappa>4$ 可选 | build/sections/local-laws.tex:611-619 | 吞没矩界 | 圆盘法则第一成分断 |
| $\mathbb P\{\sigma_A\le T_z\}\le CA^{-c}$ | $A\ge2$ | build/sections/local-laws.tex:597-601 | 圆盘法则第二成分 | $\kappa>4$ 网格尾断 |
| $\mathbb P\{\sigma<\infty,z\in D_\sigma\mid\mathcal F_\tau\}\le CL^{-c}$ | 条件物理盘法则 | build/sections/local-laws.tex:692-695 | 窗口坏外逃均值 $\mu^B_j$ | §6 递推断 |
| $\mathbb P\{\int_A W_{r_f}>C\delta^{-p}\}\le Ce^{-c\delta^{-2}}$ | 网格尾 | build/sections/mesh-tails.tex:78-82 | 归一化尾 | 下界与窗口两侧同断 |
| $e^{-cu^{2/p}}$ | $u\ge u_0=C_0\delta_0^{-p}$ | build/sections/mesh-tails.tex:93-97 | 阈值 $(\log k)^{p/2}$ 反解 | 对数幂与可和性断 |
| $W_e\le e^{-p}$ | 首次活接近点式界 | build/sections/mesh-tails.tex:99-105 | 粗网格空事件论证 | 尾换算链断 |
| $\int_{\{\operatorname{dist}\le r\}}K_D(z,w)\,dA(w)\le Cr^2$ | 边界层占领 | build/sections/mesh-tails.tex:130-134 | 括号界 | $\kappa\le4$ 尾断 |
| $\int_0^\infty\lvert\int_A b_t(z)\,dA(z)\rvert^2dt\le Cr^{2-2p}$ | 路径式括号 | build/sections/mesh-tails.tex:240-245 | slab 尾 | $\kappa\le4$ 求和断 |
| $\exp(-cx^2/r^{2-2p})$ | 允许异步起始 | build/sections/mesh-tails.tex:295-301 | $x_j=\delta^{-p}/(j+1)^2$ 求和 | §5 收尾断 |
| $\mathbb E\exp(\lambda\int_D(Y-\mu)\,dA)\le\exp(CK^2\lambda^2R^2)$ | 窗口 MGF | build/sections/mesh-tails.tex:354-358 | 三输出集中化 | §6 例外概率断 |
| $\alpha_j=C_2L_*^{-c_*}q^{\varepsilon c_*j}$，$e_j=C_3\delta^{-p}/(j+1)^2$ | 双可和 | build/sections/mesh-tails.tex:553-561 | $U_j$ 一致迭代 | $\delta^{-p}$ 界断 |
| $\inf_e\mathbb E\nu_e^T(K)\ge m_0>0$，$\sup_e\mathbb E[\nu_e^T(K)^2]\le m_2$ | 比值 $m_0^2/m_2$ 缩放不变 | build/sections/retained-mass.tex:29-34 | Paley--Zygmund | 正概率事件断 |
| $H_k=Dl^d(\log k)^{p/2}$ | 删除阈值 | build/sections/retained-mass.tex:87-91 | 超标块期望 | 逐球界与 $\nu$ 断 |
| $\beta=cD^{2/p}>1$ | 可和指标 | build/sections/retained-mass.tex:94-97 | 损失总和 $\le m_0/2$ | 保留一阶矩断 |
| $\nu(B(x,r))\le C'h(r)$ | Portmanteau 传递 | build/sections/retained-mass.tex:208-215 | $\mathcal H^h\ge\nu(K)/C>0$ | 下界半场终结于此 |
| $(1-p_*)^n\to0$ | 容量段重启 | build/sections/retained-mass.tex:256-258 | 全区间正性 a.s. | 定理前半断 |
| $\lim_{a\downarrow0}\limsup_{e\downarrow0}\mathbb P\{X_e(J)<a\}=0$ | 预极限香肠 | build/sections/retained-mass.tex:281-285 | 步证明无条件减尾 | §8 质量传递断 |
| $q,c,v_0$；半宽 $\ell$ 时 $v_0\ell$、$c\ell^d$ | 一致步常数 | build/sections/ribbon.tex:68-89 | 密集访问迭代 | §9、§10 连锁断 |
| $\sin\arg g(w)\ge s_*>0$ | 调和测度论证 | build/sections/ribbon.tex:117-152 | 紧致性引理前提 | §8 一致机件断 |
| $E_n\le2\pi T_n$，$\lvert\log K\rvert T_n^2\le C_{J,\varepsilon}2\pi T_n$ | 能量矛盾 | build/sections/ribbon.tex:262-302 | 端点均匀塌缩 | 极限向导非简并性断 |
| $\sup_{0<\theta<\pi}\lvert F(Be^{i\theta})-a\rvert\le r\exp\{-A+\pi\sqrt{2A}\}$ | $A=\log L\ge64$ 时小于 $r/4$ | build/sections/ribbon.tex:322-334 | 拼接路线 | 步证明局域化断 |
| $q_2=q_1q_0/4$ | witnesses 联合概率 | build/sections/ribbon.tex:587-594 | 有限子族转移 | 反证收尾断 |
| $N\le Cm^2$，$\ell=h_0/(C_0m)$，$2m+1$ 根弦 | 步数与半宽 | build/sections/ribbon.tex:729-750 | $e^{-Cm^2}$ 指数 | 概率质量会算断 |
| $c\exp(-Cm^2)$ 与 $cr^dm^p$ | 密集访问对 | build/sections/ribbon.tex:693-703 | 覆盖开关三 | §10 成功下界断 |
| $\mu_t^v\le\mu^v$ | 截断单调 | build/sections/dense-cover.tex:20-22 | 单测度记账 | 覆盖焊接断 |
| $m_n=\lfloor c_0\sqrt{\log n}\rfloor$，$Cc_0^2<1/2$ | 选参 | build/sections/dense-cover.tex:152 | $n^{-1/2}$ 成功下界 | 失败尾 $\sqrt n$ 档断 |
| $\mathbb P_z^*(F_n(z))\le Ce^{-c\sqrt n}$ | 逐条件期望迭代 | build/sections/dense-cover.tex:219-224 | 漏格界与清理代价 | 覆盖完备性断 |
| $\sup_{0<v\le1}\mathbb E\mu^v(B(0,R))\le C_R$ | 依赖 $p<1$ | build/sections/dense-cover.tex:94-101 | 期望一致界 | Fatou 步断 |
| $O_R(r^{d-1}(\log\log(1/r))^{p/2})\to0$ | 依赖 $d>1$ | build/sections/dense-cover.tex:373-378 | 实轴部分零测 | 全迹期望断 |
| $r_j=e^{-T_0j}$，$T_0>1+\log C_1$ | 几何尺度带余量 | build/sections/dense-cover.tex:148-153 | 开关一与开关四 | 成功时间窗与质量端点断 |
| $\mathbb P\{\text{访问且无候选}\}\le Cr_n^pM_0(z)e^{-c\sqrt n}$ | 漏格概率 | build/sections/dense-cover.tex:244-253 | 清理期望代价 | 上界的逐格覆盖断 |
| $c_*^2\lambda^p a_*$，$c_*\le\lvert F_n'\rvert\le C_*$ | 转移质量阈值 | build/sections/ribbon.tex:630-656 | 步质量下界 | §8 第五步断 |

## §16 边界几何章重读之一：球面闭包、填充包络与新鲜尖端的唯一素端

这一章是全文最早被我跳过、最后一轮才回头逐行读的部分，理由很实在：它一行数字都不给，读起来像在补拓扑课的漏。`geometry.tex:9` 第一句把本章所有闭包改在球面拓扑里取；`geometry.tex:10-12` 定下填充包络的口径，连续曲线连同它把目标点隔开的那些分支一起构成包络，存活域是朝目标点走的分支；`geometry.tex:12-17` 声明两件事，一是采用连续迹描述（素材引 Rohde--Schramm 定理 5.1），二是本章只谈这条迹的边界几何、与其存在性无关，区域标记性由 Loewner 映射的复合与布朗强马尔可夫拼出。把"与存在性无关"写在前面是自我保护：下界半场对迹的用法只到边界访问层面为止，见 §7。

连续扩张引理（`geometry.tex:20-29`）设 $\eta:[0,T]\to\overline{\mathbb H}$ 连续、$\eta(0)=0$，$D$ 为 $\mathbb H\setminus\eta[0,T]$ 的无界分支且是迹的存活单连通域，则均匀化 $F:\mathbb H\to D$ 从闭上半平面按球面拓扑连续扩张；边界参数指定素端，不同参数可有同一物理像。证明分三段。第一段摆出 $A=(\widehat{\mathbb C}\setminus\mathbb H)\cup\eta[0,T]$ 与 $K=\widehat{\mathbb C}\setminus D$（`geometry.tex:33-37`），用"紧区间在连续映射下的像是局部连通连续统"（素材引 Pommerenke 第 2 章 2.2 节第 19 页），并逐点验证两部分在 $0$ 相接处与单侧点处的局部连通性，得 $A$ 为局部连通连续统（`geometry.tex:38-46`）。第二段是纯几何的填充论证（`geometry.tex:48-62`）：给定目标直径，一致局部连通性给出尺度 $\delta$，使 $A$ 中距离小于 $\delta$ 的点可由直径受控的连通子集相接；若 $x,y$ 属填充集、$|x-y|<\delta$ 且 $\operatorname{dist}(x,A)>2\delta$，连线段避开 $A$ 且留在 $x$ 的填充分支里；否则取最近点 $a,b\in A$，两段 $[x,a]$、$[y,b]$ 长度分别不超过 $2\delta$ 与 $3\delta$，且 $|a-b|\le 6\delta$，再缩小 $\delta$ 后在 $A$ 内接上。$K$ 因此局部连通，素材此处引了一篇 2017 年文献第 2 节引理 2.4（第 7 页）。第三段用 Torhorst 边界定理推出 $\partial D$ 局部连通，再由连续定理与素端定理收尾（`geometry.tex:66-72`）。

新鲜尖端引理（`geometry.tex:74-82`）才是我真正要的：若 $a=\eta(T)\in\mathbb H\cap\partial D$ 且 $a\notin\eta[0,T)$，则恰有一个边界参数映到 $a$，Loewner 均匀化下它就是当前驱动点，任何在 $D$ 中趋于 $a$ 的访问都趋向同一素端。第一步说明 $A\setminus\{a\}$ 连通，再说明每个填充分支 $V$ 有 $\overline V\setminus\{a\}$ 连通：$V$ 在穿孔球面里稠密，而 $\partial V$ 必含 $a$ 以外的点，因为非空真开分支若边界含于单点集，就在连通的穿孔球面中既开又闭，只能等于整个穿孔球面（`geometry.tex:85-94`）。于是 $K\setminus\{a\}$ 连通，并且这段论证容许过去在 $a$ 之外任意自交（`geometry.tex:102-103`）。第二步换到盘里做分离：若 $u\ne v$ 两个圆周参数同像 $a$，取盘内简单横截，其像是含于 $D\cup\{a\}$ 的 Jordan 曲线 $J$，横截内部单叶映进 $D$；任一开圆弧不可能恒映 $a$，否则 $F-a$ 跨过该弧的 Schwarz 反射给出在某区间上消失的解析延拓，与单叶性冲突；在两条弧上各取一点不同于 $a$ 的边界像，它们分居 $J$ 两侧、同属 $K\setminus\{a\}$，而 $J\cap K=\{a\}$，与 $K\setminus\{a\}$ 连通矛盾（`geometry.tex:106-120`）。补这一节的直接收益是 §18 的驱动连续性：尖端原像收敛只靠这里的唯一性，别的工具一件没用。

## §17 边界几何章重读之二：首次触盘的访问、一条吞噬约定与免长度界的定位段

首次触盘访问引理（`geometry.tex:131-143`）是我在 §7 逐球验证里默默使用却一直没写下来的那一条。设闭球 $\overline{B(z,r)}$ 含于初始存活域，$\eta$ 记未来迹，$\tau$ 为其首次抵达 $\partial B(z,r)$ 的时间；若 $\tau<\infty$ 且 $z$ 属于存活域 $D_\tau$，记 $a=\eta(\tau)$，则线段 $(a,z]\subset D_\tau$ 并趋于当前尖端素端；再把 $g:D_\tau\to\mathbb H$ 归一化为送尖端到 $0$、送目标到无穷、并满足 $|g(z)|=1$，那么 $[a,z]$ 的像是一条从 $0$ 走到模 $1$ 的连续道路，且它的原像含在 $\overline{B(z,r)}$ 里。证明只有四句逻辑（`geometry.tex:145-157`）：开球与到 $\tau$ 为止的迹不交，它连通且含存活点 $z$，故整只落在同一存活分支，$(a,z]\subset D_\tau$ 到手；$a$ 此前没被访问过，否则那次访问就是更早的圆周接触；$a$ 与初始包络不交，靠的是闭球假设；于是 §16 的唯一素端引理把径向访问认作尖端素端，给出像道路在 $0$ 处的连续性。素材还补了一句"需要时可在首个模 $1$ 点截断"，并明确写下不需要任何边界连续模、也不需要长度界（`geometry.tex:154-157`）。

这句"不需要长度界"我读了三遍。它意味着定位段的质量完全由归一化条件 $|g(z)|=1$ 提供，谁去估 $g^{-1}$ 的像曲线长度都是多余劳动；§8 第五步里我只需要一个从 $0$ 出发、终点模为 $1$、原像被小球管住的连续集，素材在这里恰好给出全部，且给的比我原计划少用两个引理。`[推测]` 标注：素材没有写这条像道路会否反复穿越单位圆，我也只在"存在一条到模 $1$ 的道路"的层面用它，再多的几何信息属于超出素材的臆测，故不写。

紧接着的吞噬约定（`geometry.tex:159-162`）用的还是同一个分支论证：若一只球在其球心被吞噬的那一刻与迹不交，则它的整个内部都在那一刻被吞噬，此后迹在存活域内的生长不可能再进入该内部。这条约定解答了我在 §6 自适应窗口里搁置久的疑问，坏球能否被"一次性报废"：可以，而且报废的时刻精确到球心停时，之后不会复活；相应地 §5 的括号求和里，被扔掉的格子不需要再计入后续命中。两处合起来看，`geometry.tex:131-162` 这段三十行短文的真正功能是给随机侧的估计提供确定性的几何外壳，它把"访问"、"截断"、"报废"三件事统一到素端与分支这两个概念上，一个量化常数都不要。

## §18 边界几何章重读之三：光滑缝的驱动连续性、容量严格增与支撑塌到一点

光滑缝驱动引理（`geometry.tex:164-170`）说：设 $\beta$ 为紧致正则光滑简单弧，始于 $0$，初段竖直，其余部分在 $\mathbb H$ 内；把它的前缀以半平面容量 $2t$ 参数化，则存在紧区间上的连续弦向 Loewner 驱动生成这些前缀。证明的第一层是收敛性（`geometry.tex:172-177`）：先用任意正则参数 $s$，前缀补集随 $s$ 变化按核收敛，故水动力归一化映射与逆映射局部一致收敛；包含整条缝的球之外做反射，还给出 Laurent 系数的收敛。第二层解释为何这族域有边界一致收敛（`geometry.tex:179-189`）：由闭下半平面与前缀构成的补集是一致局部连通的，甚至一致局部弧连通；简单紧弧上 $\beta$ 与其逆的一致连续性让邻近点由一致小的子弧相接，该子弧属于每个包含它们的前缀；离实线足够近的弧点落在一致短的初段上，因为每个闭的后段都有正高度；初段与下半平面通过 $0$ 相接。第三层是标准小横截论证（`geometry.tex:191-207`）：用固定的半平面到盘坐标安放逆映射，其球面面积积分不超过球面积；在某边界参数附近，对半径介于 $\delta$ 与 $\sqrt\delta$ 之间的圆所成横截积分，由 Cauchy--Schwarz 得不像的球面长至多 $C/\sqrt{\log(1/\delta)}$；横截两端像可在补集中用一致小直径的弧相连，于是所得 Jordan 曲线（端点像重合时就看像横截本身）在背离内部基点像的一侧截出小直径集，而基点像与补集一致分离（核收敛加参数区间紧性）；该边界参数处的盘帽落进那一小侧，边界一致连续性得证，内部一致连续性由局部一致收敛直接给出。

由此逆映射在闭盘上按球面度量一致收敛，尖端原像也收敛：任一聚点映到极限尖端，而极限尖端的原像唯一，靠的正是 §16；回到水动力半平面坐标即知尖端坐标 $U(s)$ 连续，$s=0$ 处由初段竖直得同一结论（`geometry.tex:207-212`）。第四层才是无穷小映射论证（`geometry.tex:214-228`）：$g_s$ 映出前缀，$s'>s$，逆转移 $h=g_s\circ g_{s'}^{-1}$ 把 $\mathbb H$ 映入自身并有展开 $h(z)=z-m/z+O(|z|^{-2})$；极大原理给 $\operatorname{Im}(h(z)-z)\ge0$，在有界增量包络外反射后用半平面调和表示写成 $h(z)=z-\int_{\mathbb R}d\nu(x)/(z-x)$，其中 $\nu\ge0$、$\nu(\mathbb R)=m$，$m$ 即容量增量；$m=0$ 时该表示强制 $h$ 恒等，对非平凡新增弧不可能，故容量严格增，其连续性来自 Laurent 系数收敛。

最后是支撑塌缩（`geometry.tex:230-249`）：$s'\downarrow s$ 时新增弧在 $g_s$ 下缩到 $U(s)$，因为任何趋于新鲜尖端的访问都有同一原像极限；$\nu$ 的支撑随之缩到 $U(s)$。素材给的初等方式是把新增包络围进 $U(s)$ 附近半径 $\epsilon$ 的半盘，其映出函数 $Q=h^{-1}$ 经反射延拓成 $|z-U(s)|>\epsilon$ 上规范化单叶函数，写作 $Q(U(s)+\epsilon\zeta)=U(s)+\epsilon(\zeta+\sum_{j\ge1}b_j\zeta^{-j})$，Gronwall 外部分定理给出 $\sum_{j\ge1}j|b_j|^2\le1$（素材在此引一本 2015 年教材的定理 3.2.1 与推论 3.2.2，第 37 至 38 页），$\zeta=\pm2$ 处再用 Cauchy--Schwarz 得 $|Q(U(s)\pm2\epsilon)-U(s)|<3\epsilon$；转移逆在这两个像之外的实射线上实解析，表示测度的支撑就被夹在其间。于是 $\mathbb H$ 紧子集一致地 $h(z)=z-m/(z-U(s))+o(m)$，反转转移、以容量 $2t$ 为参数即得 $\partial g_t(z)/\partial t=2/(g_t(z)-U(t))$，紧区间上的容量性与 $U$ 的连续性证完全引理（`geometry.tex:250-261`）。

补一段用途说明，因为这条引理在正文里被引用时只当作已知事实。它给出两样东西：容量沿光滑缝严格增且连续，于是"以前缀参数化"与"以容量参数化"可以互换；驱动 $U$ 连续，于是无穷小转移的表示测度支撑能塌到一点。§20 要谈的带一步把这两样都吃进去了：带类要求曲率至多 $1/10$、初段竖直，本质上是把缝塞进光滑模板类，好让本引理适用；而容量正规化 $\partial_tg_t=2/(g_t-\sqrt\kappa B_t)$ 在网格尾章是作为给定约定出现的（`mesh-tails.tex:13-14`），它的正当性恰恰落在这里。

## §19 边界几何章重读之五：逐点开管支撑、重启推论与那句明确的非一致性声明

逐点缝支撑引理（`geometry.tex:267-284`）是本章通向概率的唯一一扇门。素材先声明这条断言是缝支撑的特殊情形，并引了 Tran--Yuan 的定理 1.1 与推论 1.2，然后声明给出本处所需的开管形式的证明（`geometry.tex:263-265`）。陈述是：$\beta$ 同 §18，$q$ 是其末端点，$N$ 是整条缝在 $\overline{\mathbb H}$ 中的相对开邻域（含 $0$ 处的相对邻域），$V$ 是 $q$ 的开邻域，则弦向 $\mathrm{SLE}_\kappa$ 满足 $\mathbb P\{\text{存在 }t<\infty,\ \gamma[0,t]\subset N\ \text{且}\ \gamma(t)\in V\}>0$；再加上 $G_1,\ldots,G_m$ 是 $N$ 中两两不相交的横截、每个都把 $0$ 与所有后续横截及 $V\cap N$ 分隔，则在该事件上 $G_1,\ldots,G_m$ 的首次命中按这个顺序发生。素材在同一格里补了一句要命的话：这里断言的正概率逐点于缝与管，对不同缝或不同过去的一致正下界并未被声称（`geometry.tex:283-284`）。

证明的力学全在确定性一侧（`geometry.tex:287-336`）。取 $U$ 为该缝在 $[0,T]$ 上的驱动，声称 $U$ 的某个足够小的一致邻域强制所需的几何事件，只要扰动驱动生成的迹连续。设 $U_n\to U$ 一致、$K_n$ 是它们在 $T$ 时刻的包络：高度界 $\operatorname{Im}K_n\le2\sqrt T$ 与驱动极值的水平界把所有包络关进同一个有界矩形（`geometry.tex:290-293`）。对 $\overline{\mathbb H}\setminus\beta[0,T]$ 的每一点，其极限前向 Loewner 解在 $T$ 之前与驱动保持正距离；除 $0$ 以外的实点也如此，因为一条其余部分在 $\mathbb H$ 内的简单缝不吞噬这样的点，解可在存活的实区间上解析反射；ODE 的连续依赖给每个这种点整片存活邻域（对充分大的 $n$），再用矩形内、给定缝邻域之外的紧性得 $K_n\subset N$ 对大 $n$ 成立（`geometry.tex:295-307`）。反向 Loewner ODE 给出 $T$ 时刻逆映射的局部一致收敛：$\mathbb H$ 的紧子集上虚部离零有正下界，常规 ODE 稳定性可用，域随之按核收敛到 $\mathbb H\setminus\beta[0,T]$；由此对每个小 $r$ 有 $K_n\cap B(q,r)\ne\varnothing$ 对大 $n$ 成立，否则沿子列整只球存活，从固定内部基点穿过极限域到球内一点的紧通路连同该球会落进核里，把 $q$ 错当成核的内点（`geometry.tex:310-324`）。包络相交再推迹相交：取 $r$ 使 $\overline{B(q,2r)}\subset V\cap\mathbb H$，固定 $w\in B(q,2r)\setminus\beta[0,T]$；上方包络含性保证最终 $w\notin K_n$；若扰动迹避开 $B(q,2r)$，这只连通球落在补集的某分支中，而它与 $K_n$ 相交，那分支就被吞噬，整只球含 $w$ 都属于 $K_n$，矛盾；故迹访问 $V$，而每个更早的包络含于 $K_n$，迹在此之前留在 $N$ 中。素材强调这个反证式的序列论证供给我一个真实的正驱动容差（`geometry.tex:326-336`）。随机侧只剩一句：布朗运动在从 $0$ 出发的连续函数 $U/\sqrt\kappa$ 的每个一致邻域内都有正概率，由折线逼近、正的高斯增量概率与有限个区间上正的布朗桥约束概率得证；把它作用于驱动 $\sqrt\kappa B$ 并用几乎必然连续迹性质（`geometry.tex:338-343`）。横截的分隔性只是迫使 $N$ 内从 $0$ 到 $V$ 的连续道路按序命中它们，在 $N$ 内回折不构成障碍（`geometry.tex:344-346`）。

重启推论（`geometry.tex:349-371`）把上一条搬到停时之后：有限停时 $\tau$ 处固定一个实现的过去，条件续律 $\mathbb P_\tau$、存活域 $D$、$F:\mathbb H\to D$ 送 $0$ 到当前尖端素端、送 $\infty$ 到目标，并取其在 $\overline{\mathbb H}$ 上的球面连续扩张；给定连续简单道路 $\alpha:[0,1]\to\overline{\mathbb H}$，$\alpha(0)=0$、$\alpha((0,1])\subset\mathbb H$；若 $O$ 相对开于 $\overline D$ 且含 $F(\alpha[0,1])$，$V\subset D$ 是 $F(\alpha(1))$ 的开邻域，则重启的半平面迹 $\widetilde\gamma$ 满足 $\mathbb P_\tau\{\text{存在 }t<\infty,\ F(\widetilde\gamma[0,t])\subset O\ \text{且}\ F(\widetilde\gamma(t))\in V\}>0$，对演化的欧氏相似同样成立，而这个正概率可以依赖实现的过去、$\alpha$、$O$、$V$。证明就是把 $N=F^{-1}(O)$ 做成 $\alpha[0,1]$ 的相对开邻域（含 $0$ 处一个相对半盘），用一根短竖段进入 $\alpha((0,1])$ 所在的那一分支、多段线连通接到 $F^{-1}(V)$ 的点、在 $N$ 内去环磨角得到初段竖直的正则光滑简单缝，再在重启的布朗 Loewner 律下用 §19 前段的引理并映回； successive 物理前线的场合把 $O$ 取成带分隔横截的细管、把 $V$ 放到最后一根横截之外，即得次序（`geometry.tex:373-387`）。最后一句"对不同过去的一致下界仍需单独论证"（`geometry.tex:387-388`）与本章开头的分工声明（`geometry.tex:4-7`）互相咬合：几何章只管逐点，一致性整笔赊给后续章节的紧致性论证，账在 §20 结。

## §20 赊账的归还处：带章开头的三条输入、允许过去类与一步概率

本章开头的自述（`ribbon.tex:4-8`）与 §19 末句精确对榫：覆盖论证需要一次制造异常多香肠面积的访问，靠穿越窄蛇形带来构造，本质估计对带内已经画出的历史一致；而"对每个固定的光滑模板给一个正概率"在穿越次数增大时根本不够用。`ribbon.tex:13-36` 列出三条被调用的输入，形态都被预先削平。第一条是 §19 的重启支撑：光滑简单缝可在开管中被跟随并穿过按序的分隔横截，正概率，停止重启后同样成立。第二条是定位形态（`ribbon.tex:16-28`）：设 $F:\mathbb H$ 有到闭上半平面的球面连续扩张，并有一条从 $0$ 到模 $b_0$ 的访问道路、其像含于 $B(a,r/L)$，则对所有 $L\ge L_0$ 有 $\mathbb P\{F(\gamma[0,\sigma_{b_0L^b}])\not\subset B(a,r)\}\le CL^{-c}$，其中 $\sigma_u$ 是参数平面迹首次到达模 $u$ 的时刻，未达到时包含关系按无穷时间解释；$b,c,C,L_0$ 对映射与访问道路一致，且估计包含参数边界的访问。第三条是预极限香肠形态（`ribbon.tex:29-36`）：对每个确定的紧容量时间区间 $J$ 有正长度，$\lim_{a\downarrow0}\limsup_{v\downarrow0}\mathbb P\{v^{-p}\operatorname{Area}(N_v(\gamma(J)))<a\}=0$，并再次声明只用有限条确定性区间清单，不把这条下尾条件于指定通过、也不直接用于随机区间。`ribbon.tex:38-44` 交代了外部先例：Rezaei 的覆盖论证已经在停止历史之后使用条件界、紧致性以及穿过指定螺线与细管的道路（其第 3 节引理 3.1 与 3.3），本文要的是一条更强的东西，对带一步容许的每一过去都成立的一个概率界，外加一个针对这些过去的确定性小网格截断，迭代这个定量步给出密集访问的显式下界 $c\exp(-Cm^2)$。

带几何的口径写在 `ribbon.tex:48-58`：$\sigma:[0,\infty)\to\overline{\mathbb H}$ 单位速简单曲线、切向 Lipschitz、曲率至多 $1/10$、法向 $n$；$P(s,x)=\sigma(s)+xn(s)$（$s\ge0$、$|x|\le1$）是嵌入的闭带，$s>0$ 时落在 $\mathbb H$ 内，$s\to\infty$ 时逃离每个有界集，$0\le s\le4$ 段竖直且 $P(0,0)=0$；长为四的片上的坐标映射共用一个双 Lipschitz 常数；这些几何界属于允许类的一部分，并取定 $\epsilon=1/50$。允许的过去类在 `ribbon.tex:60-66`：任一停止弦向过去，首次到达 $s=k$（$k\ge1$）、到该停时前一直留在 $|x|<\epsilon$ 内、只在带基 $P(\{0\}\times(-\epsilon,\epsilon))$ 处接触实边界、终止于 $a=P(k,x_a)$ 且 $|x_a|\le\epsilon/4$；带的未来段在存活域 $D$ 内，其内部与过去不交且有沿带通向目标的路；上一局部片两侧核心之外的条带也如此。一步引理（`ribbon.tex:68-89`）的结论是三件事打包：存在只依赖 $\kappa$ 与固定带常数的 $q,c,v_0>0$，使对上述每一过去与每一确定性 $0<v<v_0$，条件概率至少 $q$ 地满足下一次首次跨越 $s=k+1$ 在有限时间发生且尖端偏移 $|x|<\epsilon/4$、从当前前线到该跨越的迹段 $\gamma_{\rm step}$ 在此之前留在 $k-1/4<s<k+1$、$|x|<\epsilon$ 之内、并且 $v^{-p}\operatorname{Area}(N_v(\gamma_{\rm step})\cap P((k+1/3,k+2/3)\times(-\epsilon,\epsilon)))\ge c$；三个常数对整个带与整个停止过去一致；半宽为 $\ell$ 的带里网格截断变成 $v_0\ell$、下界变成 $c\ell^d$。

## §21 保留质量章前段重读：有限时间的一阶矩、缩放不变的比值与半开分划

章的自述（`retained-mass.tex:4-7`）把这章分成两件相对独立的事：把一致网格尾变成一个具有所要求小球界的正测度，靠保留密度的子列弱极限拿下豪斯多夫下界；另外在本节末尾单独给一条预极限估计，供给带构造要用的香肠质量。`retained-mass.tex:8-13` 补了一句我此前没当回事的许可：对每个固定 $L\ge1$ 有 $h(Lr)/h(r)\to L^d$（$r\downarrow0$），两个值在小尺度上只差一个有界因子，于是在紧内部集上做共形换坐标是合法的。规范化 $h(r)=r^d(\log\log(1/r))^{p/2}$ 里的二重对数在这种比较下几乎不动，这正是 §7 的逐球界能在不同坐标之间搬运的原因；若修正项是 $(\log(1/r))^{p/2}$，比值 $h(Lr)/h(r)$ 会带上 $\bigl(\log L/\log(1/r)\bigr)$ 型的漂移，换坐标就没这么干净。

测度的安放在 `retained-mass.tex:17-27`：取定闭盘 $K\Subset\mathbb H$ 带固定自由领圈，$\delta_K=\operatorname{dist}(K,\partial\mathbb H)>0$，定义 $\nu_e^T(dz)=\mathbf 1_K(z)W_e(z)\mathbf 1_{\{\tau_e(z)\le T\}}\,dA(z)$；用 $K$ 的 $\delta_K/2$ 放大去套缩放后的尾，其允许的终距离包含 $0<e<\delta_K/2$；再取 $0<e_0\le\delta_K/(8\mathrm e)$，使它同时落进这个范围与接近引理对每个 $z\in K$ 的适用范围。目标是存在确定性有限 $T$ 使 $\inf_{0<e<e_0}\mathbb E\nu_e^T(K)\ge m_0>0$ 与 $\sup_{0<e<e_0}\mathbb E[\nu_e^T(K)^2]\le m_2<\infty$（`retained-mass.tex:28-34`）。二阶界由一致上尾缩放后积分直接得到，素材只强调一阶界要额外论证"倾斜接近所需的有限物理时间"（`retained-mass.tex:35-37`）。这段论证（`retained-mass.tex:39-51`）我现在读来是整章最朴素也最关键的一击：对整数 $m\ge1$，令 $\rho_m(z)$ 为活点共形半径首次达到 $R_0(z)e^{-m}$ 的时刻，$\mathbb P_z^{*,m}$ 为到 $\rho_m(z)$ 为止的有限中心化律；若 $R_0(z)e^{-m}\le e$，则该律下 $\tau_e(z)\le\rho_m(z)$，依据是 Koebe 不等式给出到边界的距离不超过共形半径，而初始边界比 $e$ 更远；于是有限停止密度恒等式给出 $\mathbb E[W_e(z)\mathbf 1_{\{\tau_e(z)\le T\}}]=M_0(z)\mathbb P_z^{*,m}\{\tau_e(z)\le T\}\ge M_0(z)\mathbb P_z^{*,m}\{\rho_m(z)\le T\}$。一致性使右端概率随 $m$ 递降，令 $q_T(z)=\lim_m\mathbb P_z^{*,m}\{\rho_m(z)\le T\}$，它就是 $T^*(z)=\lim_m\rho_m(z)$ 不超过 $T$ 的概率；有限时钟引理给 $q_T(z)\uparrow1$（$T\to\infty$）；这里初始均匀化取恒等，故该引理的 Loewner 时间就是原始容量时间（`retained-mass.tex:52-62`）。每个有限停止律下的概率是 $z$ 的可测核，$q_T$ 继承可测性，取递降极限并对 $K$ 积分得 $\mathbb E\nu_e^T(K)\ge\int_KM_0(z)q_T(z)\,dA(z)$，右端随 $T\to\infty$ 增至 $\int_KM_0(z)\,dA(z)>0$（`retained-mass.tex:63-72`）。素材在段尾特意写下"只在有限停止处使用密度恒等式"，这一句把我原来的一条错路堵死：我曾打算对 $T=\infty$ 直接取极限来省掉 $\rho_m$ 这一层，而无限时处的换律需要先有可积性，恰好是一阶矩本身要证的东西，循环就此显形。

`retained-mass.tex:74-79` 是旧台账只记了一行的那段缩放，现在把推导补齐：布朗标度把同一个实验放进每一个指定的初始容量区间（长 $\Delta>0$）；空间按 $c=\sqrt{\Delta/T}$ 缩放时，容量时间按 $c^2$、允许的网格截断按 $c$、积分密度按 $c^d$ 缩放，一阶矩下界变为 $c^dm_0$、二阶矩上界变为 $c^{2d}m_2$，比值 $m_0^2/m_2$ 原封不动。Paley--Zygmund 只吃这个比值，于是保留概率与所选区间长度无关，§7 里"对每个容量区间重启一次"的穷举才不会被概率衰减拖死。删块部分的框架在 `retained-mass.tex:81-86`：取确定性序列 $e_N=2^{-N}$、$\nu_N=\nu_{e_N}^T$，二进方块按半开取，在每一层构成分划，起始层 $k_0$ 留待后面固定，边长 $l=2^{-k}$（$k_0\le k\le N$）的方块按质量超标来声明。半开这个约定看着琐碎，作用是把层间边界重合彻底消掉，否则 $\nu_N$ 在共享边上的方块会被重复计入损失总和，旧台账那条"损失总和不超过 $m_0/2$"的减法就要多出一个修正项。

## §22 网格尾与覆盖两章开头的对账，附本轮缺陷申报

网格尾章的自述（`mesh-tails.tex:4-7`）一句话点明它是决定对数修正的那条估计，并把难点写在"对终网格一致"上：大阈值先在中间网格测试，剩余增量必须控制到任意指定的更细网格。这与 §2 我记录的关键转折点完全对应，也解释了 §5、§6 两节为何都要维护一个可递降的网格序列。参数与律的约定在 `mesh-tails.tex:9-18`：全程固定 $0<\kappa<8$，$p=1-\kappa/8$、$d=2-p$、$a_0=8/\kappa-1$，容量正规化取 $\partial_tg_t=2/(g_t-\sqrt\kappa B_t)$；本章考虑的初始域恰是普通半平面迹在有限停时的存活域及其欧氏相似，条件陈述一律指该域中带标记尖端与目标的普通弦向律。输入清单（`mesh-tails.tex:20-44`）比我原先记住的更长：密度 $M_t(z)=R_{D_t}(z)^{-p}\sin^{a_0}\theta_t(z)$ 在吞噬处零延拓；在 $z$ 到域边界距离有下号的区域上 $M_t(z)$ 是有界停止鞅，若更小的距离从未达到则终端贡献为零；活停时处、后续接近到距离 $u$（$u$ 小于当前到界距离的固定倍数）的概率至多 $Cu^pM_t(z)$，且该接近处的期望密度就是 $M_t(z)$；所有这些只用有限停止换律与单调穷举；$dB_t$ 的系数绝对值不超过 $CR_{D_t}(z)^{-p}\sin^{a_0}\theta_t(z)/|Z_t(z)|$，$Z_t(z)=G_t(z)-\sqrt\kappa B_t$，而 $G_t$ 已经把初始均匀化吃进去：初始域为 $J(\mathbb H)$ 时 $G_t=g_t\circ J^{-1}$。$\kappa>4$ 时盘法则再加一条（`mesh-tails.tex:45-50`）：闭球含于初始域时，首次圆周命中且 $z$ 仍活的条件下，下一次离开 $B(z,Lr)$ 时 $z$ 仍活的概率对足够大的 $L$ 至多 $CL^{-c}$，外盘不必自由。归一化与可测性的技术段在 `mesh-tails.tex:52-73`：平移后固定 $A=B(0,1)$ 且其一个固定放大含于初始域，故 $A$ 中所有点有统一的初始边界间隙 $\rho_{\rm col}>0$；对 $0<r<\rho_{\rm col}$ 定义 $\tau_r(z)$ 为首次活接近到距离 $r$（无则取无穷）、$W_r(z)=M_{\tau_r(z)}(z)\mathbf 1_{\{\tau_r(z)<\infty\}}$、$I_r(z)=\mathbf 1_{\{\tau_r(z)<\infty\}}$；这三个映射有联合可测版本，吞噬前由连续迹距离与连续 Loewner 映射得到，一般情形先在存活域的紧子集上局部化再穷举；有限接近上有 $\operatorname{dist}(z,\partial D_{\tau_r(z)})=r$，于是重启后的接近估计对更细距离 $qr$ 适用，只要 $0<q\le1/(8\mathrm e)$；整合尾命题的常数 $C,c$ 与 $0<\delta_0<\rho_{\rm col}$ 只依赖 $\kappa$ 与固定领圈（`mesh-tails.tex:75-77`）。我在这里发现 §12 复核清单的一个漏项：$1/(8\mathrm e)$ 这个数在 `mesh-tails.tex:72-73` 与 `retained-mass.tex:25-27` 各出现一次，两处必须相容，否则 $\nu_e^T$ 的 $e_0$ 会掉出接近引理的适用范围。

覆盖章的自述（`dense-cover.tex:5-10`）把整章压成四步：选出携带足够归一化香肠面积的不交圆盘，全部在同一个确定性网格上测量；其放大圆盘有统一的期望覆盖代价；被访问而它们漏掉的格子的代价趋于零；让这个界与时间截断、内部截断都无关，即得全时空间结论。测度定义在 `dense-cover.tex:12-22`：$\Gamma=\gamma([0,\infty))$，$\mu^v(A)=v^{-p}\int_A\mathbf 1_{\{\operatorname{dist}(w,\Gamma)<v\}}\,dA(w)$，香肠取在全平面；用 $\gamma([0,t])$ 替换 $\Gamma$ 得 $\mu_t^v$，于是 $\mu_t^v\le\mu^v$，单测度记账的全部单调性来自这一行。覆盖所用的停止估计（`dense-cover.tex:24-59`）给出显式初始密度 $M_0(z)=(2\operatorname{Im}z)^{-p}(\operatorname{Im}z/|z|)^{a_0}$、有限尺度倾斜律 $\mathbb P_z^*$、时钟 $-\log R_t(z)$ 每一单位上 $\sin^{-a_0}\theta$ 的条件期望不超过 $C$、$z$ 活着且 $\rho\le e^{-1}R_S(z)$ 时 $\mathbb P\{\tau_\rho(z)<\infty\mid\mathcal F_S\}\le C\rho^pM_S(z)$，并强调倾斜律下每个有限时钟水平都会被达到，有限停止恒等式写作 $\mathbb E[\mathbf 1_{\{S<\infty\}}M_S(z)X]=M_0(z)\mathbb E_z^*[X]$。密集访问命题的精确一致性（`dense-cover.tex:61-70`）我读得很慢，因为 §9 与 §10 的接头在这里：固定一个正角截断，存在 $b,c,C,C_2>0$、$C_1>1$ 与整数 $m_0$，使每个 $m\ge m_0$ 与每个 $r>0$ 配一个确定性 $\varepsilon(r,m)=r\delta_m>0$；在任何满足 $R(z)=r$ 且角正弦高于截断的状态，对每个指定的 $0<v\le\varepsilon(r,m)$，倾斜条件概率至少 $c\exp(-Cm^2)$ 地，在半径降到 $r/C_1$ 之前，未来迹在 $B(z,C_2r)$ 内造出归一化面积不低于 $br^dm^p$ 的 $v$-香肠。旧台账把 $c\exp(-Cm^2)$ 与 $cr^dm^p$ 记成一对，本节补上它们的共存条件：$v$ 必须被 $\varepsilon(r,m)$ 管住，这正是 §10 能在单一网格上记总账的前提。

缺陷申报（本轮追加内容的所有自伤，一律不回改，只登记）：一，体量带位，§16 实测 $3{,}795$ 字节、§17 实测 $2{,}685$ 字节低于目标带下沿，§19 实测 $5{,}106$ 字节、§20 实测 $4{,}556$ 字节高出上沿，均按派单要求申报。二，禁令字符类，§20 第三段有一处成对的单字符长停顿号（同一字符连写两次，位于"一条更强的东西"之后），落盘后复测全文该类字符命中两处，均属此一处，登记待机械清理通道处理，未做任何就地替换。三，英文残留与笔误，§19 重启推论段有 "successive 物理前线" 应读"逐段物理前线"；§20 末段有 "一致下icontinuous的" 一词属半截英文，应读作"在这个允许过去类上一致地有正下界"，其中半连续性的说法是笔误，不构成本笔记的数学断言。四，旧稿的 §14 勘误一与勘误二仍然有效，本轮未触碰 §0 至 §15 的任何字节。五，本轮素材读取窗口共九个文件段，全部落在 `build/` 下的 `.tex`，未使用书目文件、未执行任何版本管理命令，台账续表的位置栏逐条出自这些窗口，见 §23。

## §23 重建段与锚点事故申报：向导曲线的清距估计，以及本轮一次误删

先申报事故，再补内容，这个顺序与本节的性质相合。第三笔追加（把 §21、§22 落盘的那一笔）的锚点逐字取了 §20 最后一段的全文作为待替换文本，而新文本没有把这段原样回写，于是该段从盘上消失：§20 的字节由落盘后实测的 $4{,}556$ 变为 $3{,}501$，差额 $1{,}055$ 字节等于那段连同其前导空行。这属于删动已落盘内容，规格明令禁止，成因在我把"锚点取末段"错当成"末段可被新内容顶替"，正确做法是把锚点文本与新内容首尾相接一起写出。按规格我不搬动、不回填、不重排，只在文末以重建段的形式把丢失的主题重新写出，并声明它留在 §23，不回填进 §20。

连带三处指称要按更正读，§22 的清单本体不动：其一，§22 把成对长停顿号记在 §20 第三段，实测在 §20 第一段，即"一条更强的东西"之后那一处；其二，§22 说 §20 末段有半截英文残留，那个末段正是被误删的段落，残留已随段落离开正文，重建段按正确写法给出；其三，§22 记 §20 高出体量带上沿，那是删除前的实测，删除后 §20 落到带下沿之外，重建段的字节不计入 §20。

重建段（主题与行号窗口和被删那段一致，逐句重写）。向导曲线的构造写在 `ribbon.tex:96-113`：取 $\alpha(t)=P(k+t,x_a(1-4t)_+)$（$0\le t\le2$），再沿带中线延伸到无穷，得到一条从新鲜尖端出发、通向目标的简单访问道路。它的新鲜性由"下一次首次跨越前端"给出，而 §16 的唯一素端陈述把这条道路的初始访问与驱动素端认作同一个，这正是重启推论里 $F$ 把 $0$ 送到当前尖端素端的用法。其上成立 $\operatorname{dist}(\alpha(t),\partial D)\ge c\min(t,1)$ 与 $\lvert\alpha(t)-a\rvert\le Ct$（$0<t\le2$）。理由分三层：前端之后存在一片空白的局部坐标球，在向导前进固定距离之前其半径可取成与 $t$ 成正比、之后取定值；过去的非局部部分进不了这些球，一旦进去就与本带片内部相交，违背嵌入性；每只球因为连着未来带而属于存活分支。`ribbon.tex:91-94` 交代这段的定位：目标是对整个允许过去类同时拿到一个正概率与一个网格截断，先取得访问向导的一致共形控制，随后带一步的证明通过这些共形映射把内部香肠检验转移过去。我的读取窗口止于 `ribbon.tex:115`，那里只写下取 $w=P(k+1/2,0)$ 并把 $g:D\to\mathbb H$ 归一化为送尖端到 $0$，其后内容未读，故 $w$ 的用途留白，不做推测。

一点余味：几何章反复申明"不需要边界连续模，也不需要长度界"（`geometry.tex:154-157`），意思是能用唯一性与紧性解决的事就别去攒定量估计；本轮这次误删恰好是反面教材，锚点管理属于只能逐字回写、不能靠"大概一样"过关的那类动作。

## §24 台账续表

本节按派单要求续写台账。首格换成记号一列，全文那份标准表头仍然只有 §15 一处，因此 §15 开头"唯一的一份"这句应读作指标准表头那一份。下列每行的位置栏都出自本轮真实读取的九个窗口，窗口之外的行号一概不写。

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| 球面闭包约定 | 本章所有闭包取球面拓扑 | build/sections/geometry.tex:9 | 扩张与素端论证 | 穿孔球面连通性判据失效 |
| $A=(\widehat{\mathbb C}\setminus\mathbb H)\cup\eta[0,T]$，$K=\widehat{\mathbb C}\setminus D$ | 二者皆局部连通连续统 | build/sections/geometry.tex:33-46 | 连续扩张引理 | Torhorst 那一步断 |
| 填充论证尺度 $\delta$ | $\lvert a-b\rvert\le6\delta$，两段长 $2\delta$ 与 $3\delta$ | build/sections/geometry.tex:52-60 | $K$ 的一致局部连通 | 边界局部连通断 |
| 新鲜尖端的边界原像基数 | 恰为 $1$ | build/sections/geometry.tex:74-82 | 尖端坐标收敛 | §18 驱动连续性断 |
| $K\setminus\{a\}$ | 连通，容许 $a$ 之外任意自交 | build/sections/geometry.tex:96-103 | 横截分离反证 | 唯一素端证明第二段断 |
| 首次触盘的归一化 | $\lvert g(z)\rvert=1$，原像含于 $\overline{B(z,r)}$ | build/sections/geometry.tex:139-143 | §7 逐球验证的定位段 | 小球界跨坐标搬运失效 |
| 吞噬约定 | 球心被吞时整只内部同刻被吞 | build/sections/geometry.tex:159-162 | §6 坏球一次性报废 | 后续命中重复计费 |
| 光滑缝的容量参数化 | 容量严格增且连续，$U(s)$ 连续 | build/sections/geometry.tex:214-228 | 无穷小转移方程 | §22 所引正规化失据 |
| Gronwall 外部分界 | $\sum_{j\ge1}j\lvert b_j\rvert^2\le1$ | build/sections/geometry.tex:238-244 | 测度支撑塌到 $U(s)$ | 表示测度定位断 |
| 逐点开管支撑概率 | 仅为正，逐点于缝与管 | build/sections/geometry.tex:274-284 | 带一步的模板事件 | §8 一致性来源失凭 |
| $\operatorname{Im}K_n\le2\sqrt T$ | 配驱动极值水平界 | build/sections/geometry.tex:290-293 | 公共矩形紧性 | 包络含于 $N$ 断 |
| $K_n\cap B(q,r)\ne\varnothing$ | 对充分大的 $n$ | build/sections/geometry.tex:314-319 | 迹访问 $V$ 的推出 | 逐点支撑断 |
| 布朗桥约束概率 | 有限个区间上为正 | build/sections/geometry.tex:338-343 | 正驱动容差 | 概率一侧全空 |
| 重启正概率的依赖 | 可依赖过去、$\alpha$、$O$、$V$ | build/sections/geometry.tex:368-371 | §20 三条输入之一 | 带一步无从启动 |
| 定位形态的幂律 | $\mathbb P\{F(\gamma[0,\sigma_{b_0L^b}])\not\subset B(a,r)\}\le CL^{-c}$ | build/sections/ribbon.tex:20-28 | 步证明局域化 | §8 第二步断 |
| 预极限香肠下尾 | $\lim_{a\downarrow0}\limsup_{v\downarrow0}\mathbb P\{v^{-p}\operatorname{Area}(N_v(\gamma(J)))<a\}=0$ | build/sections/ribbon.tex:29-36 | 步质量下界 | 删块与质量传递同断 |
| 带类几何界 | 曲率不超过 $1/10$，$\epsilon=1/50$，$0\le s\le4$ 竖直 | build/sections/ribbon.tex:48-58 | 紧致性与允许过去类 | 一致常数无从谈起 |
| 过去末端偏移 | $\lvert x_a\rvert\le\epsilon/4$，首次到达 $s=k$ | build/sections/ribbon.tex:60-66 | 向导曲线起点 | 清距论证断 |
| 一步三元组 $q,c,v_0$ | 对整类过去一致 | build/sections/ribbon.tex:68-88 | 密集访问迭代 | §9 指数 $\exp(-Cm^2)$ 断 |
| 半宽 $\ell$ 的缩放 | 截断 $v_0\ell$，下界 $c\ell^d$ | build/sections/ribbon.tex:87-88 | 变宽带的质量 | 覆盖章尺度带对不上 |
| 向导清距 | $\operatorname{dist}(\alpha(t),\partial D)\ge c\min(t,1)$ | build/sections/ribbon.tex:104-107 | 局部坐标球空白 | 嵌入性论证断 |
| $h(Lr)/h(r)\to L^d$ | 小尺度只差有界因子 | build/sections/retained-mass.tex:10-13 | 紧内部集共形换坐标 | §7 逐球界搬运断 |
| $e_0$ 与领圈的比 | $0<e_0\le\delta_K/(8\mathrm e)$ | build/sections/retained-mass.tex:22-27 | 一阶矩下界 | 倾斜接近失效 |
| $q_T(z)=\lim_m\mathbb P_z^{*,m}\{\rho_m(z)\le T\}$ | 随 $T\to\infty$ 升至 $1$ | build/sections/retained-mass.tex:53-60 | $\mathbb E\nu_e^T(K)>0$ | 保留质量整体归零 |
| Koebe 双侧 | $\operatorname{dist}(z,\partial D)\le R_D(z)\le4\operatorname{dist}(z,\partial D)$ | build/sections/local-laws.tex:25-30 | 比较 $\tau_e\le\rho_m$ | 上一行的不等号方向反 |
| 缩放系数 $c=\sqrt{\Delta/T}$ | 界变 $c^dm_0$ 与 $c^{2d}m_2$，比值不变 | build/sections/retained-mass.tex:74-79 | 每个容量区间重启 | §7 穷举被概率衰减拖死 |
| 二进方块半开分划 | $e_N=2^{-N}$，边长 $l=2^{-k}$ | build/sections/retained-mass.tex:83-86 | 超标块损失总和 | 共享边重复计费 |
| 三数恒等式 | $p=1-\kappa/8$，$d=2-p$，$a_0=8/\kappa-1$ | build/sections/mesh-tails.tex:10-12 | 全章幂次记账 | 尾指数换算断 |
| 鞅的布朗系数界 | $CR_{D_t}(z)^{-p}\sin^{a_0}\theta_t(z)/\lvert Z_t(z)\rvert$ | build/sections/mesh-tails.tex:37-41 | 括号估计 | $\kappa\le4$ 网格尾断 |
| 领圈与阈值 | $\rho_{\rm col}>0$，$0<\delta_0<\rho_{\rm col}$ | build/sections/mesh-tails.tex:52-54 | 整合尾命题 | 尾界随 $K$ 漂移 |
| $\operatorname{dist}(z,\partial D_{\tau_r(z)})=r$ | 有限接近等式 | build/sections/mesh-tails.tex:68-71 | 重启估计对 $qr$ 适用 | 细网格递降断 |
| $\mu^v$ 的全平面香肠 | $v^{-p}\int_A\mathbf 1_{\{\operatorname{dist}(w,\Gamma)<v\}}\,dA(w)$ | build/sections/dense-cover.tex:14-19 | 单测度记账 | 实轴部分失配 |
| 截断单调 $\mu_t^v\le\mu^v$ | 由 $\gamma([0,t])\subset\Gamma$ | build/sections/dense-cover.tex:20-22 | 界与时间截断无关 | Fatou 步断 |
| 显式初始密度 | $M_0(z)=(2\operatorname{Im}z)^{-p}(\operatorname{Im}z/\lvert z\rvert)^{a_0}$ | build/sections/dense-cover.tex:28-31 | 有限停止恒等式 | 漏格界系数错 |
| $\varepsilon(r,m)=r\delta_m$ | 确定性网格上限 | build/sections/dense-cover.tex:64-70 | 单一网格测量合法化 | §10 记总账断 |
| 章序单向依赖 | 几何章排在局部律之前 | build/main.tex:29-35 | 全篇引用方向 | 前向引用悬空 |
| 摘要的三句承诺 | 正有限、期望有限、候选非 $\sigma$-有限 | build/sections/abstract.tex:3-9 | §11 差异段的对账基准 | 叙事与定理脱钩 |
| 缩写算子族 | 概率、期望、半平面、指示等九类 | build/macros.tex:1-12 | 素材排版 | 本稿已展开，仅影响素材 |
