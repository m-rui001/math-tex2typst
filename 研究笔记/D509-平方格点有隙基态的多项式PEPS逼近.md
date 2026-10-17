# D509 平方格点有隙基态的多项式 PEPS 逼近：研究笔记

## §0 素材与登记

这篇笔记对应我在 2026 年 9 月 24 日挂出的那篇论文《Polynomial PEPS approximation of gapped square-grid ground states》。正文口径是"正在做这项研究的我"：把当时纸面上真实的推理链、歧路与判断逐一重建出来。素材只用 build 下的 13 个 `.tex`，总计 199,817 B；两处图形是 tikz 分片，只当作正文几何段的示意来参照，不单独引作结论来源。

论文主张（main.tex:47）可以压成一句话：设 $\Lambda_L=\{1,\dots,L\}^2$ 上的近邻哈密顿量 $H$ 满足逐点界 $\lVert h_v\rVert\le J$、$\lVert h_e\rVert\le J$（00-introduction.tex:42），并有唯一单位基态 $\Omega$ 与整谱隙 $H-E_0I\ge\Delta(I-\lvert\Omega\rangle\langle\Omega\rvert)$（00-introduction.tex:49），则存在同格点 PEPS $\Phi$，键维至多 $CL^c$（00-introduction.tex:51），归一化后整体向量误差 $\min_\theta\lVert\Phi/\lVert\Phi\rVert-e^{i\theta}\Omega\rVert\le L^{-1}$（00-introduction.tex:55）。$C,c$ 只依赖 $(q,J,\Delta)$。这是存在性定理：张量元允许任意依赖 $H$ 与 $\Omega$（00-introduction.tex:65），我从不声称能高效求出或收缩它们。

- preprints/Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026
- 其他队列第 332 行号

## §1 初始动机与第一批猜想

促使我动笔的源头是全局形式的 PEPS 问题陈述（00-history.tex:14）：谱隙能否保证多项式键维、逆多项式希尔伯特空间范数误差的逼近。一维里这条路已被 Hastings 走通（00-history.tex:8）：面积律加多项式键维的 MPS 逼近。我的第一批猜想几乎是把一维剧本逐字搬到二维：

猜想 P1：对每条割线做施密特尾截断，截断维数受面积律约束，于是各割线的截断数据可以拼成一张 PEPS。

猜想 P2：误差沿格点线性累积即可，总误差 $\le$（割线数）$\times$（单割线尾质量）。

现在回看，P1 与 P2 都错得离谱。错误根源我当时没有立刻看清，花了相当长时间才逼出来。先把支撑怀疑的证据列出来：任意态族上，有界冯诺依曼块熵并高效全局 MPS 逼近（00-history.tex:36）；二维里有强面积律却无任何高效张量网络描述的态族（00-history.tex:39），不过那组反例把"描述"建模为张量元计算复杂度的界，与"虚拟维数有界、元可以任意复杂"是两个不同问题，我特意在文中把它们分开（00-history.tex:41），否则反例会被误读成直接打击本定理。这些材料指向一个共同缺口：面积律只管每张割谱，整体向量逼近还需要不同割线描述之间的兼容性、误差在全格上的传播控制、以及最终网络必须落在给定的边集 $E(\Lambda_L)$ 上（00-introduction.tex:7）。也就是说，我需要的是一条能同时管住"兼容运算及其累积误差"的通道（00-history.tex:46），单谱估计给不了。

[推测] 论文正文是打磨后的成品，P1、P2 的失败在我脑内发生，成品里只余下痕迹（00-history.tex:35 那段"熵界与表示定理是两种陈述"就是伤口结的痂）。我把它们显式写出来，是为了让后面的转折显得有来由。

## §2 错路之一：面积律直接搬成全局截断

第一条真正动手试的路线是二维化的 Hastings 论证。他一维的机器核心是：带滤波算符的变分极小给出低能激发态、再用隙把滤后态拉回基态、尾谱质量受熵界控制，最后链式砍区间。我按这个骨架写了二维版本：固定一块 $n\times n$ 方形窗口 $X$，尝试在窗口边界找一张秩受 $e^{O(n)}$ 约束的投影 $P$，使 $\lVert(\mathrm{id}-P)\Omega\rVert$ 小。

卡点一出现就致命。窗口空间 $\mathcal H_{X(2u)}$ 的内部维数是 $q^{O(u^2)}$，面积律只告诉我边缘熵 $S\le C_A\lvert\partial_\Lambda A\rvert$（01-preliminaries.tex:44），它控制的是约化密度矩阵的"有效支集大小"在 $\log$ 尺度上呈 $O(u)$，可要把"几乎所有质量"装进一个**确切半径**的有限秩子空间，尾质量与秩的权衡里会漏进 $q^{cu}$ 量级的坏方向；隙 $\Delta$ 又是整个 $H$ 的全局性质，往子区域限制时根本没有局部隙可用（01-preliminaries.tex:52 强调伴生定理只假设唯一全系统基态与 $\Delta$）。我当时的结论：单半径、单边界的精确截断二维行不通。

于是改试第二个变体：对嵌套的一串方形半径 $r_1<\dots<r_m$ 分别截断，再求和。这个方向活了，后来长成 §6 的自适应补丁约束命题。但当时我犯了一个新错误：想让各半径上的滤波器互相对易，好套用一维的交换图戏法。$L_j=(x_j+be^{-R}\mathrm{id})^{-a_j/2}$ 型滤波算符（03-patches.tex:76）的极小点根本没有任何互易性可言，我写出的"对易链"在第二行就断了。真正可行的是放弃对易、改用**降序剥壳**：先证最外层 $j=m$ 的 $[L_j,\rho_j]=0$，再借嵌套几何逐层向内剥（03-patches.tex:117），全程只在单一 $X_j$ 的支撑内做共轭。这个顺序敏感的处理方式，我后来在 §8 的效应替换、§9 的条带词序里反复复用，可算全篇的元方法。

另一处更隐蔽的坑在能量估计里。对跨越 $X_j$ 的相互作用 $h$ 比较 $\mathrm{Re}\langle\phi,L_jhL_j^{-1}\phi\rangle-\langle\phi,h\phi\rangle$，按施密特分解展开会出现双指标和 $\sum_{i,k}\sqrt{p_ip_k}\,h_{ik}$。第一版我直接把和放成（施密特秩）$\times\lVert h\rVert$，秩是无界的，界当场爆掉。救场的是行、列各用一次 Cauchy--Schwarz 的配对引理：$\sum_{i,k}(p_i+p_k)\lvert A_{ik}B_{ik}\rvert\le 2\lVert A\rVert\lVert B\rVert$（03-patches.tex:302），把秩彻底吸收掉，最终单项误差压成 $q^2J a_j^2$（03-patches.tex:319）。事后复盘：凡是"对大希尔伯特空间求和"的地方，都得配一个不依赖维数的行/列技巧，这条军规贯穿 §5、§7、§8。

## §3 错路之二：热路与局部可观测口径的诱惑

第二条错路是抄现成机器。已知正向结果里，Huang 的局部版本（00-history.tex:26）对满足固定阶 Rényi 面积律的态给出键维 $e^{O(1/\delta)}$、与格宽无关的 PEPS，但它只把误差记在**定域可观测量的期望**上，且支持尺度固定；把它升级成全向量误差是范畴错误，我确实认真想过硬蹭：取可观测量为所有 $O(L^2)$ 个局域算符的并集界去逼近密度矩阵，结果维数因子吃掉指数界。热化路线同样不匹配：Molnár--Schuch--Verstraete--Cirac 的准多项式键维（00-history.tex:51）要在隙之外加低能态密度假设，而我在 §0 明誓只用整谱隙这一个谱假设（01-preliminaries.tex:52）；Schuch--Wolf--Verstraete--Cirac 的冷却构造（00-history.tex:57）把基态放进 $(d+1)$ 维 PEPS 的边界，回到原格还需一个未解决的问题。

同阶段我还被一个"太顺"的引理迷惑：若 $I_\Omega(T:E)\le b$，则存在把 $\Omega$ 的纯化近似拆成 $s\otimes s'$ 的等距（05-frames.tex:352 分裂引理，误差 $\le\sqrt b$，05-frames.tex:364）。我一度以为整个协议可以只用"互信息小就拆开"推进。它当然不成立：$b$ 本身在二维里有多大？面积律只给 $I(X:E)\le O(\text{边界})$ 级别的粗界（02-information.tex:103 的粗信息命题只到常数 $C$），而拆分误差要 $o(1)$。这个缺口最后逼出了 §5 整条角度收敛分析线。

## §4 转折：所有权协议的语言

转折点是把"构造张量网络"换成"调度一场分布式计算"。我在纸上写下这样的模型（00-introduction.tex:72 策略段是其成品）：初始只有一个参与方持有整份 $\Omega$；结束时每格点自带一个参与方；中间每一步把物理寄存器在辅助方之间搬家。允许一切私有线性的收缩（00-introduction.tex:74），甚至允许每个参与方一开始就私藏整份 $\Omega$ 的独立副本（07-assembly.tex:12）；约束只加在两处：每个参与方一辈子**参与他人门**的总次数有界（00-introduction.tex:80），且每个跨方门都能展开成多项式多个"私有收缩 + 归一化双分向量/余向量"的单项式（00-introduction.tex:82），双分态的施密特秩不设上限。

为什么这个改写对？我在 §2 吃过"兼容性"的亏，协议语言把兼容性变成记账问题：每个门的展开系数、每步参考向量的漂移都是可加的。压缩定理（04-compression.tex:154）随后负责把"无限制双分资源"兑换成"多项式虚拟维数算符网络"，兑换代价只由**参与次数 $b$** 与**多项式展开大小**控制，对私有维数与施密特秩完全免疫（04-compression.tex:526 的维数无关界）。这是整篇论文的枢纽：我把几何难题先外包给协议，再把协议压缩成网络。

这个视角也让"表示"与"算法"的界线必须讲清楚（00-history.tex:80）：一般 PEPS 收缩有最坏复杂度障碍，本文不豁免这一点，但那是另一问题。[推测] 这条界线在早期草稿里更模糊，成品反复强调"存在性"，多半是被审稿语境逼出的自觉。

最终误差目标也从最初设想的"逆多项式里指数 $10$ 之类的任意数"（00-history.tex:15 的原始提问形式）收紧为精确的 $L^{-1}$（00-introduction.tex:55），配 $CL^c$ 键维。[推测] 选 $L^{-1}$ 是面子与余量的折中：主定理只要求归一化向量差 $o(1)$，$L^{-1}$ 有清晰陈述价值；误差级联 $60\to30\to20\to17\to10\to5\to1$ 的容错设计才是真实动机，见 §11。

主机器就位后，剩下的解析与几何零件按依赖序装配：§5、§6 供两个解析输入；§7 把它们铸成"有界改动"；§8 是独立的压缩引擎；§9 排平面调度；§10 收尾成 PEPS。

## §5 解析输入一：角度收敛区域之间的信息界

这一节重建我从"常数 $C$ 的粗界"爬到"$L^{-p}$ 的指数级小"的路线。目标命题是角度信息界（02-information.tex:635）：设标记点集 $\mathcal V$ 不超过 $m_0$ 个，$X$ 的直径 $\le A_0n$，若每点分离度满足 $\mathrm{dist}_\infty(x,E)\ge a\max\{s_{\min},\min(n,d_{\mathcal V}(x))\}$，其中 $s_{\min}=D\log L$（02-information.tex:645），则 $I_\Omega(X:E)\le L^{-p}$。几何图像是：$X$ 与 $E$ 的距离在向少数标记点收拢时线性收敛（像张开的扇形被捏尖），但不许低于对数地板 $D\log L$。

第一块砖是从伴生论文搬的领圈接口。模板 $T$ 由至多 $N_0$ 个斜率为 $0,\infty,\pm1$ 的矩形或三角形拼成（02-information.tex:33），领圈宽度 $\ell=\lfloor n^{1-10^{-5}}\rfloor$（02-information.tex:47），亚线性领圈界给 $I_\Omega(X:\Lambda\setminus S_0)\le Cn^{1-10^{-5}}$（02-information.tex:56）；放大命题再把它碾成 $C_Mn^{-M}$（02-information.tex:76），指数的源头是伴生的正性替换 $k_i$ 与 $\alpha=k/(k+1)>1-10^{-6}$（02-information.tex:70、08-companion-interface.tex:31 的 $e^{-cr^\alpha}$ 锚衰减）。我在此处走过一个流程性错路：差点在辅助区域上直接引用面积律的哈密顿量假设。伴生定理只对原始整系统基态 $\Omega$ 说话，子区域从不被赋予新隙（08-companion-interface.tex:8），所以我先把粗界（02-information.tex:103）验成纯信息陈述，之后的放大只消耗信息量与尺寸假设。

第二块砖是单元胞条件互信息界（02-information.tex:161）：把平面铺成边长 $s$ 的方格，任取一格 $G$、其余格并集 $B$、满足 $\mathrm{dist}_\infty(C,\overline G_{\mathrm{amb}})\ge cs$ 的外部 $C$，则 $I_\Omega(G:C\mid B)\le C_1(1+\log s)^K$（02-information.tex:173）。这里有个我最初完全没料到的技巧：条件化对象 $B$ 可以是任意并集，面积律对此毫无发言权。做法是给外部格涂两色（02-information.tex:181 起），造两族有序瓦片 $\mathcal F_0,\mathcal F_1$，族内每块瓦片对"后续同族已生成块加 $C$"的互信息 $\le C_2$（02-information.tex:190）。链式法则读数时两族用**相反的序**：族 0 顺读，族 1 逆读；族 1 项靠纯度对偶 $I(A:C\mid B)=I(A:C\mid D)$（01-preliminaries.tex:73）把条件集换成补侧，才落回同一个瓦片界。顺序在这里是实质性的，同 §2 的"降序剥壳"血脉一致。构造本身是多尺度挖洞递归：活跃方块尺度 $u$ 生成下一代 $u'=8t_0$、$t_0=u^\gamma$（02-information.tex:281），代数只有 $O(1+\log\log s)$ 层（02-information.tex:308），于是瓦片总数 $(1+\log s)^K$ 是对数塔式的缓增。

第三块砖是信息复位引理（02-information.tex:333），我第一次读它的构造时长达一周没跟上意图，这里把当时的理解过程重讲一遍。设定：$I_\Omega(R:C)\le b$，两核 $R_0,C_0$ 深埋在边界内宽度 $w=C_p(1+b+\log L)$ 处（02-information.tex:345），结论 $I_\Omega(R_0:C_0)\le L^{-p}$（02-information.tex:350）。第一反应是用 §3 的分裂引理直接拆 $R:C$，拆完得到乘积近似，可这恰恰是要证的结论的弱化版，逻辑打转。破局在于换到**双副本世界**：取 $\Psi=\Omega^{\otimes2}$，$F_R$ 只在 $R$ 上交换两副本，$\Phi=F_R\Psi$（02-information.tex:358）。若我能造一个支撑远离两核的酉 $U$ 使 $U\Psi\approx\Phi$，那么两核联合边缘在 $\Psi$ 与 $\Phi$ 中几乎相同；而 $\Phi$ 里两核来自不同副本，其联合边缘**精确等于** $\rho_{R_0}\otimes\rho_{C_0}$，信息量就被逼成小量。

剩下的工程是把"存在某个把 $\Psi$ 送到 $\Phi$ 附近的算符"具体化。分裂引理的等距 $V$ 给出重叠 $\ge e^{-b/2}$（02-information.tex:388），把 $b_R$ 上的交换拉回原缓冲得 Hermite 收缩 $W$，其关键矩阵元 $z=\langle\Phi,W\Psi\rangle=\mathrm{Tr}\,\rho_{\widetilde\Omega,Rb_R}^2\ge e^{-2b}$（02-information.tex:413）：这是最大施密特概率给出的下界，我不需要任何秩信息。下一步是本文第二次动用高斯滤波（02-information.tex:429）：$M=\int g_h(t)e^{it\mathbb H'}We^{-it\mathbb H}dt$，谱定理给出双侧逼近 $\lVert M\Psi-z\Phi\rVert\le e^{-h\Delta^2/2}$（02-information.tex:443），取 $h=AB_*$、$B_*=1+b+\log L$、$r_*=2p+10$（02-information.tex:426）。我把积分截到 $|t|\le T_0B_*$（02-information.tex:447），再用有界近邻相互作用的交换子递推（02-information.tex:470）迭代出 Lieb--Robinson 尾巴 $\lVert[\tau_t(A),B_y]\rVert\le C|S|\lVert A\rVert e^{v|t|-\mu d_K(S,y)}$（02-information.tex:493），最后以"对外部格点平均酉门"的条件期望做算符局域化（02-information.tex:504），全程不出现希尔伯特空间维数。局域化后 $M_{\mathrm{loc}}$ 支撑在 $S=N_\ell(Q\cup Z_R)$，$\ell=\lceil K_{\mathrm{loc}}B_*\rceil$（02-information.tex:551）。

还有一个小陷阱我起初踩了：$D=M_{\mathrm{loc}}/z$ 的范数可高达 $e^{2b}$，我本能想把它稀释掉。正确做法是极分解：两侧误差同形控制 $(D^\dagger D-\mathrm{id})\Psi$，用标量不等式 $(\sqrt x-1)^2\le(x-1)^2$ 得 $\lVert(U-D)\Psi\rVert\le\lVert(\mathrm{id}-D^\dagger D)\Psi\rVert$（02-information.tex:586），大范数已在 $\lVert D\rVert\le e^{2b}$ 与 $e^{-6b}$ 的乘除间结清（02-information.tex:593），无须外系统酉膨胀。收尾用条件熵连续性（01-preliminaries.tex:146）把迹距离 $CL^{-r_*}$ 转成信息量：$I\le CL^{2-r_*/2}\le L^{-p}$（02-information.tex:628），$L^2$ 因子是全系统格点数，连续性公式对纯化空间维数免疫（01-preliminaries.tex:149）。

把三块砖合起来的归纳（02-information.tex:661）：按尺度 $s_j=2^{-j}n$（02-information.tex:666）从远及近分层，归纳不变量是"加厚 $a's_j$ 后的信息 $\le L^{-p}$"（02-information.tex:693）。每层新单元格化后，旧加厚带信息已被归纳假设接管，剩余单元格个数有界，逐格用链式法则吃单元胞界，复位宽度被 $(1+\log s)^K$ 项支配：$w(s)\le C_3(1+\log s)^K+C_4\log L$（02-information.tex:747），选 $D\ge 4C_4/c_*$（02-information.tex:754）并用 $(\log\log L)^K/\log L\to0$ 压住所有层。复位每环层把信息**清零重记**（02-information.tex:782），所以层数再多也不累加。这是"累积误差"难题的第一个正式解法，也预告了 §8 的记账结构。[推测] 早期手稿可能试图让信息界逐层 $\delta_j$-累加，后来才想到高斯滤波复位；成品只留下"不累加"这句刻意强调。

## §6 解析输入二：自适应补丁约束

补丁命题（03-patches.tex:24）说：给定中心 $z$、$0<u\le B_0\log L$、精度 $p$，存在支撑在 $X(2u)$ 上的正交投影 $P=\sum_{j,\ell}\lvert v_{j\ell}\rangle\langle v_{j\ell}\rvert_{X_j}\otimes\mathrm{id}_{\Lambda\setminus X_j}$，各圆柱两两正交、总秩 $\sum_jd_j\le CL^c$，且 $\lVert(\mathrm{id}-P)\Omega\rVert\le L^{-p}$（03-patches.tex:32）。措辞里"半径 $r_j$ 允许随 $j$ 变"是命脉：命题**拒绝**给出单一指定边界上的精确有限秩截断（03-patches.tex:7）。§2 的失败经验在此固化成定理语言。

方法走变分：$N(R)=\min_{x_j}\lVert M(R,x)\Omega\rVert$，$M=L_m\cdots L_1$，$L_j=(x_j+b\,\mathrm{id})^{-a_j/2}$，$b=e^{-R}$，$\sum_ja_j=\kappa$（03-patches.tex:68、03-patches.tex:76）。我第一遍读这个构造时不明白"为什么要引入一个和隙毫无关系的优化问题"。链条是这样：极小点 $\phi$ 经驻点方程获得**与 $R$ 无关**的激发能上界（03-patches.tex:328），隙把 $\phi$ 拉回 $\Omega$ 身边；$\Omega$ 的面积律给出常数尾秩的谱投影 $Q_j$（03-patches.tex:373 的 $\mathrm{rank}\,Q_j\le e^{C_Q(1+u)}$，尾质量 $1/16$，03-patches.tex:356）；于是调节器 $T_j=\rho_j\,b(x_j+b\,\mathrm{id})^{-1}$ 的迹在 $R$ 大时被 $1/8$ 夹住，$\log N(R)$ 的右导数 $\le\kappa/8$（03-patches.tex:467），增长率 $\le\kappa R/4$ 量级（03-patches.tex:476）。反向那一步才见真章：把逆滤波 $F_j=L_j^{-1}$ 按 $x_j$ 谱劈成头（秩 $\le b^{-1}$）与尾（范数 $(2b)^{a_j/2}$，03-patches.tex:496），恒等式"按左到右第一个头展开"（03-patches.tex:508）只做分配律、从不交换因子，于是每个带头的项落在某**自适应半径**的圆柱里，全尾项范数 $N(R)(2b)^{\kappa/2}$（03-patches.tex:531）以 $\kappa R/4$ 的速度衰减。取 $R_0=\frac43[C_0(B_0+1/\log2)+1+2p/\kappa]$、$R=R_0\log L$（03-patches.tex:542）时全尾项 $\le L^{-p}$，距离 $\mathrm{dist}(\Omega,\mathcal E)\le L^{-p}$、$\dim S_j\le L^{R_0}$（03-patches.tex:559）。头尾速率必须赛跑：增长 $\kappa/4$ 对衰减 $\kappa/2$，我最初把两者设成同级，结果余量消失，才改成现在保守的 $1/8$ 驻点界。

细节上还有三处当年卡住我的地方。其一，KKT 条件在边界上退化：$x_i$ 有零坐标时比值条件只剩单边不等式 $p_i/b\le\lambda$（03-patches.tex:186），正则项 $b\,\mathrm{id}$ 保证所有 $\ell_i$ 有限，无须对零概率取极限。其二，$g(R)=\min_x f(R,x)$ 的极小点不连续、不唯一，包络定理不能裸用；我用 Dini 上导数加逐区间 Lipschitz（03-patches.tex:443）走绝对连续积分，这比"挑一条连续极小分支"体面得多也正确得多。其三，正交化阶段：把 $S_j$ 换成**投影像** $\widetilde S_j=(\mathrm{id}-P_{W_j})S_j$ ，并非与正交补的交（03-patches.tex:580），秩不升、直和恒等式才成立。最终 $\sum_jd_j\le(\frac{B_0}{2}\log L+1)L^{R_0}\le CL^{R_0+1}$（03-patches.tex:597）。

两个参数决定的次序值得记录：先由能量界 $36q^2J\kappa^2$（03-patches.tex:331）与隙定死 $\kappa\le\min\{1/2,\sqrt{\Delta/(1024C_E)}\}$（03-patches.tex:341），再由 $B_0,p$ 定 $R_0$；$C,c$ 对一切中心、哈密顿量、$L$ 一致。[推测] "嵌套半径差至少 2" 这条看似随意的格点约定，是为了让任一近邻相互作用至多跨越一个选中方（03-patches.tex:224），从而每个 $h$ 只在一个 $j$ 上产生一次 $q^2Ja_j^2$ 误差；没有这条，跨界计数会乱。

## §7 帧：编码、改写与有界变化

本节把 §5、§6 的两个解析输入浇铸成 §8 压缩机器能直接消费的词汇。先从薄说起：每张薄在每个格点 $x\in\Lambda$ 放一个原始寄存器 $\mathbb C^q$，为每个寄存器指定一位持有者（05-frames.tex:14）；不同薄之间寄存器互异，参考向量都是 $\Omega$ 的独立副本、下标恒按原格点坐标记录（05-frames.tex:16），所有权改动绝不置换位置定义。这一约定我起初觉得迂腐，后来才明白它是全部误差记账的坐标系基础：原始寄存器换主人绝不能只靠改名（05-frames.tex:6），换主必须写成显式收缩映射，"布局的改变"本身就是待构造映射的一部分（05-frames.tex:5）。私有操作则不受空间位置约束，一位持有者可对名下全部寄存器任意收缩（05-frames.tex:8）。

洞的编码：给定中心 $c$ 与 $0<h\le B_0\log L$，内方 $Q^-(c,h)=\{x:\lvert x-c\rvert_\infty\le h\}$、外方 $Q^+(c,h)=\{x:\lvert x-c\rvert_\infty\le 2h\}$（05-frames.tex:28）。在精度 $\varepsilon=L^{-60}$（05-frames.tex:24）下取 §6 的补丁投影
\[
 P_{c,h}=\sum_{j=1}^m\sum_{\ell=1}^{d_j}\bigl(\lvert v_{j\ell}\rangle\langle v_{j\ell}\rvert\bigr)_{D_j}\otimes\mathrm{id}_{\Lambda\setminus D_j},\qquad \lVert(\mathrm{id}-P_{c,h})\Omega\rVert\le\varepsilon
\]
（05-frames.tex:35），其中 $D_j$ 是夹在内方与外方之间的嵌套方形样本。编码器写入标签寄存器 $\mathcal J_{c,h}$，基 $\{\lvert j,\ell\rangle\}$，配一个固定单格单位向量 $\lvert 0\rangle$：
\[
 K_{c,h}=\sum_{j,\ell}\lvert j,\ell\rangle_{\mathcal J_{c,h}}\otimes\Bigl[\bigl(\lvert 0\rangle^{\otimes D_j}\langle v_{j\ell}\lvert\bigr)_{D_j}\otimes\mathrm{id}_{\Lambda\setminus D_j}\Bigr]
\]
（05-frames.tex:53）。标签记录"用了哪个半径、哪个内向向量"，随后把内向向量整体换成乘积零态 $\lvert 0\rangle^{\otimes D_j}$。设计要点有二。其一，编码保留洞内全部原始寄存器，只是把内容替换成已知零态；我早先试做过"真压缩进标签"的方案，压缩映射与外方之外的纠缠纠缠不清，范数账立刻失控，遂弃。其二，标签基正交给出精确恒等式 $K_{c,h}^{\dagger}K_{c,h}=P_{c,h}$、$\lVert K_{c,h}\rVert\le1$（05-frames.tex:63）。于是 $r$ 个外方两两不交的洞的联合编码满足
\[
 \lVert\Omega_{\mathcal F}\rVert=\Bigl\lVert\prod_{a=1}^r P_a\Omega\Bigr\rVert,\qquad 1-r\varepsilon\le\lVert\Omega_{\mathcal F}\rVert\le1
\]
（05-frames.tex:91），下界来自逐因子展开 $\prod_aP_a-\mathrm{id}$ 再用收缩性（05-frames.tex:94）。同一中心与尺度上的选择要跨所有薄逐字复制（05-frames.tex:47），否则 §9 的换薄操作无从对齐；外方物理样本为空时用一维标签的恒等编码（05-frames.tex:68）。帧即"一张薄加上外方互不重叠的洞集与每个洞标签的持有者"（05-frames.tex:71），参考向量 $\Omega_{\mathcal F}=K_{\mathcal F}\Omega$（05-frames.tex:78），无洞帧就是原始薄（05-frames.tex:77）。

"有界改动"的口径（05-frames.tex:99）：固定数目的当事方、固定数目的门、每个单项式里双分资源个数固定（希尔伯特空间维数不必有界），且对每个固定的 $a>0$ 允许算子误差 $O(L^{-a})$、多项式展开指数的依赖 $a$ 合法；缩放 $(1+O(L^{-a}))$ 恢复收缩性（05-frames.tex:104）。这三条恰好就是 §8 定理的输入格式。

现在补一个纯张量引理，它的动机是：三方向上共享的归一化向量并不是允许的双分资源（05-frames.tex:112）。整组垂引理（05-frames.tex:125）：有限图上每顶点放一个范数至多为 1 的张量，内部边按坐标配对收缩、无自环，剩余外垂按原顶点分组。结果张量 $Z$ 的范数 $\le1$，且沿"整组垂"的任何二分切割核范数 $\le1$（05-frames.tex:161），后者靠"两侧各自内部收缩成 $A$、$B$、用 $\lVert AB^{\mathsf T}\rVert_1\le\lVert A\rVert_2\lVert B\rVert_2\le1$"得到，全程不出现维数（05-frames.tex:162）。对 $g$ 个非空组、任意整数 $k\ge1$，在每组空间取 $k$ 维子空间的张量积投影，像 $Z_k$ 满足
\[
 \lVert Z-Z_k\rVert\le\frac{g}{\sqrt k}
\]
（05-frames.tex:137），且 $Z_k$ 在子空间正交基下至多 $k^g$ 个乘积项、系数绝对值 $\le1$。证明路径是逐组压平取奇异值尾：核范数 $\le1$ 给出 $\sum_{j>k}s_j^2\le 1/(k+1)$，各组投影用 telescoping 合成（05-frames.tex:170）。"整组先投影、后拆开"是关键顺序：先拆则因子维数进入误差，先整组则核范数界吸收一切。这个结构技巧我在 §8 的随机替换与 §9 的边带处理里都再次依赖，[推测] 它是本文相对一维剧本最"无声"的一处升级。

小补丁重写引理（05-frames.tex:188）是帧的全部体力活：新旧两张单薄帧只有有界多个洞受影响，存在 $m=O(1)$ 个附加方形补丁 $(c_i,u_i)$、$0<u_i\le B_0\log L$，满足四条，补丁外方避开未动洞的物理足迹；补丁内方之并覆盖全部换主格点与受影响新旧洞的外足迹；每个补丁外方内、旧内洞之外至多两个旧持有者，且对新持有者同样成立；涉及的原始与标签持有者都在指定的有界名单内（05-frames.tex:193）。则典范收缩
\[
 M=K_{\mathrm{new}}P_m\cdots P_1K_{\mathrm{old}}^{\dagger}
\]
（05-frames.tex:228）把旧帧参考向量送到新帧参考向量附近，误差 $\le(m+r_{\mathrm{old}})\varepsilon$（05-frames.tex:211）。估计用通用恒等式 $A_s\cdots A_1-\mathrm{id}=\sum_jA_s\cdots A_{j+1}(A_j-\mathrm{id})$ 逐项 telescope（05-frames.tex:240），绝不假设重叠补丁的投影互相对易。展开成允许单项式的过程我重写了好几遍才理清：固定一个分支（标签选择加补丁半径选择）后，旧洞解码头上的每条腿都会碰到更晚的补丁 bra，因此它没有开输出垂；对偶地，新洞编码 bra 的每条腿碰到更早的补丁 ket，没有开输入垂（05-frames.tex:285）。这个事实对每个自适应半径分支一致成立，§6 的半径自由在此兑现红利。剩下的开腿只出现在补丁 bra（全部是原始输入垂）与补丁 ket（全部是原始输出垂）上，由条件三各自至多两个持有者，整组垂引理于是适用。中途还有一处保护：凡没碰到任何选中动作的原始直通线都是私有的，换主的格点必属某补丁内方，在每个半径分支里都被该补丁的选中方形拦截，不可能成为直通线（05-frames.tex:270），故一个大希尔伯特--施密特范数的 $\mathrm{id}_{\mathcal H_A}$ 永远不会混进张量范数估计（05-frames.tex:275）。最终分支数 $N\le L^{C_1}$、总单项式 $\le Nk^{g_0}$（05-frames.tex:343），取 $a=30$ 得参考向量误差 $O(L^{-20})$（05-frames.tex:344）。

分裂推论（05-frames.tex:352）把 §5 的信息小变成搬家的燃料：若 $b=I_\Omega(T:E)$，存在把缓冲 $U$ 映到 $\mathcal B_T\otimes\mathcal B_E$ 的等距 $V$（05-frames.tex:357）与归一化向量 $s$、$s'$，使
\[
 \lVert(\mathrm{id}_{TE}\otimes V)\Omega-s\otimes s'\rVert\le\sqrt{2(1-e^{-b/2})}\le\sqrt b
\]
（05-frames.tex:363）。两个放大后的纯化空间不设维数上界；$b\le L^{-60}$ 时误差 $\le L^{-30}$（05-frames.tex:367）。支撑包含 $\mathrm{supp}\,\rho_{TE}\subseteq\mathrm{supp}(\rho_T\otimes\rho_E)$ 来自正性（05-frames.tex:373），[推测] 这一行是后来被"相对熵在支撑不匹配时为无穷"咬过之后加的保险。同质生死引理（05-frames.tex:396）：$T$ 全部由 $P_\circ$ 持有且避开所有洞外足迹，若 $I_\Omega(T:E)\le L^{-60}$（其中 $E$ 依 (05-frames.tex:402) 划分为"旧持有者非 $P_\circ$"之并上 $H^+(\mathcal F)$），则把 $T$ 换主给 $Q_\circ$ 是有界改动，误差 $L^{-30}$（05-frames.tex:407）。机制：在 $P_\circ$ 处私有施加 $V$，用 $\langle s\lvert$ 收缩 $T\mathcal B_T$，再以 $T$ 归 $Q_\circ$、$\mathcal B_T$ 归 $P_\circ$ 的双分态 $s$ 补充，最后 $V^{\dagger}$ 收回；典范映射
\[
 B=\mathcal V^{\dagger}\bigl(\lvert s\rangle\langle s\rvert_{T\mathcal B_T}\otimes\mathrm{id}_{E\mathcal B_E}\bigr)\mathcal V
\]
（05-frames.tex:422）是 Hermitian 收缩，$\lVert(B-\mathrm{id})\Omega\rVert\le\lVert(\Pi-\mathrm{id})(\mathcal V\Omega-s\otimes s')\rVert\le L^{-30}$。我第一版把 $V$ 设在 $Q_\circ$ 名下，伴随 $V^{\dagger}$ 立刻变成越境大操作；终稿让 $U$ 与两个输出半区同侧持有，$V$ 全程私有（05-frames.tex:393）。$E$ 里刻意纳入外洞足迹，保证分裂等距绝不碰任何编码支撑。信息假设由 §5 角度界以指数 $60$ 供给（05-frames.tex:451）；两主人重合时一切映射私有化、恒等映射即实现换主（05-frames.tex:446）。

双薄交换引理（05-frames.tex:460）处理"隔着一条边两个旧主人无法直接换到新主人"的死结：设每个洞的整个外方落在区域 $Y$ 边界的同一侧（05-frames.tex:462），在 $Y$ 内同时交换两张薄的持有指派与编码洞清单（含标签持有者），$Y$ 外保持不动。以 (05-frames.tex:467) 划分 $T=Z\cap Y$、$E=Z\setminus Y$，若 $I_\Omega(T:E)\le L^{-60}$，交换可由私有收缩与寄存器改名实现，参考向量误差 $4L^{-30}$（05-frames.tex:476）。核心交织恒等式 $\mathcal RK_{\mathrm{in}}=K_{\mathrm{out}}F_{Y\cap\Lambda}$（05-frames.tex:493）：把 $Y$ 内两薄改名（含随洞整体迁移的标签）的 $\mathcal R$ 与真实换薄 $F$ 通过编码交换。$\mathcal R$ 不搬动任何寄存器，换主只发生在"名分"上；物理补偿是 $U$ 上的私有修正 $D_U=(V^{\otimes2})^{\dagger}F_{\mathcal B_T}V^{\otimes2}$（05-frames.tex:505）。$\mathcal R$ 之后先施加 $F_A$（$A=Y\cap U$）再施加 $D_U$，次序不能反（05-frames.tex:514），净效应写成 $(\mathcal V^{\otimes2})^{\dagger}F_{T\mathcal B_T}\mathcal V^{\otimes2}$（05-frames.tex:522）；而 $\zeta^{\otimes2}$（$\zeta=s\otimes s'$）恰被 $F_{T\mathcal B_T}$ 固定，偏差由 $\lVert\mathcal V\Omega-\zeta\rVert\le L^{-30}$ 双份放大到 $4L^{-30}$（05-frames.tex:546）。我最初尝试不用第二张薄、直接换 $Y$ 内主人，误差里会冒出跨两个 $P_\circ$ 缓冲的大幺正，隐私性当场破产；引入独立副本后，换薄被改名吸收、只剩缓冲半区上的交换需要修正，这个结构反转是全节最漂亮的一步。交换完成后第二薄可弃（05-frames.tex:568），但它的编码参考向量在弃掉之前必须留在误差比较里，成品在正文末尾特意叮嘱这一点，我当初正是因为忘叮嘱而写出过一笔糊涂账。

## §8 密度压缩机器

现在讲独立于平面构造的压缩定理（04-compression.tex:154）。它的输入是"分布式构造"：参与方、寄存器、时刻化的记忆张量积、每门对各方规定输入输出空间（可以不同）， spectators 全部旁观（04-compression.tex:24）。所有待弃寄存器保留到自己主人的记忆里直到最后一次性迹掉（04-compression.tex:28），于是整场计算在最终偏迹前是一条纯线性演算。允许的单项式＝私有收缩 + 两参与方共享的归一化对态制备 + 两参与方共享的归一化对 bra 收缩；维数多项式的转移消息按 $\mathrm{id}=\sum_{a=1}^{d}\lvert a\rangle_{\mathrm{收}}\langle a\rvert_{\mathrm{发}}$ 展开（04-compression.tex:38）即可化归之。"一致多项式"指 $\le CL^a$ 且 $C,a$ 对一切私有维数与构造细节一致（04-compression.tex:14）。

定理假设四条：参与方与门数一致多项式，初始向量是各方私有归一化向量的张量积，门皆收缩（04-compression.tex:137）；存在常数 $b$ 使每个非私有门至多涉 $b$ 方、每方一生至多参与 $b$ 个非私有门（04-compression.tex:140）；每个非私有门是多项式多个允许单项式的和、系数多项式有界、每项内对资源数 $\le r$（04-compression.tex:143）；终态各方物理输出空间维数一致多项式（04-compression.tex:148）。输出：对每个固定 $p>0$，算符张量网络 $\sigma$ 满足 $\lVert\sigma-\rho\rVert_1\le L^{-p}$，每方一节点、入射虚拟连线有界、连线维数一致多项式、每条连线只连接曾在同一非私有门中共事的双方（04-compression.tex:156）。各方向带自己的 ket 与 bra 两列物理腿，因此 $\sigma$ 一般是非正的（04-compression.tex:12）；若协议保证保留范数接近 1，绝对迹范数误差可直接入账（04-compression.tex:601 注）。近似展开版本同样成立：只要对每个固定逆多项式精度都有统一多项式展开（04-compression.tex:167、04-compression.tex:590）。

第一步是效应消除引理（04-compression.tex:53），它把"对偶收缩"改造成"可采样的源"，因为下一步的随机替换只能作用于形如 $\lvert\eta\rangle\langle\widetilde\eta\rvert$ 的双分算符。单个归一化对态 $\eta\in\mathcal U\otimes\mathcal V$：补上 $m-1$ 份副本，对 $m$ 个循环置换取平均得收缩 $T_m$，它送 $\eta$ 到 $\eta^{\otimes m}$，而对任何 $v\perp\eta$，$m$ 个插入位置两两正交，于是
\[
 \lVert T_m-\lvert\eta\rangle^{\otimes m}\langle\eta\lvert\rVert=m^{-1/2}
\]
（04-compression.tex:92）。整个门按"指定效应出现处"逐一换 $T_m$，每分支输出空间统一追加同一固定垃圾栈 $\Gamma_m=\bigotimes_o\eta_o^{\otimes m}$（04-compression.tex:110），分支误差 $r/\sqrt m\sum_\xi\lvert c_\xi\rvert$、单项式膨胀至多 $m^r$、系数绝对值和反降（04-compression.tex:66）。共同比较向量这一步设计我起初漏了：不同分支消耗不同内部寄存器，若不给统一的外部门面，telescoping 根本没法加总；发生专属的输出栈恰好修好门面问题，且事后没有任何操作会碰这些栈（04-compression.tex:125）。

主定理证明按目标误差 $\epsilon=L^{-p}$ 组织。取 $\delta=\epsilon/(8M)$（$M$ 为非私有门数，04-compression.tex:202），先按**原始**系数和与效应数选定多项式 $m$、再展开置换平均，次序不能反，否则 $m$ 的选取自我指涉（04-compression.tex:203）。归一化后得源-only 电路，其密度 $\rho'$ 满足 $\lVert\rho'-\rho\rVert_1\le4M\delta\le\epsilon/2$（04-compression.tex:226）。每个非私有门写成
\[
 G_g=\sum_{\xi\in\Xi_g}c_{g,\xi}\Bigl(\bigotimes_{P}B_{g,P,\xi}\Bigr)\Bigl[\bigl(\bigotimes_{e\in E_g}\lvert\eta_{g,e,\xi}\rangle\bigr)\otimes\mathrm{id}_{\mathrm{in}}\Bigr],\qquad \lVert G_g\rVert\le1
\]
（04-compression.tex:235）。这里"先把每项的源在新寄存器里制备、前面的私有映射与这些寄存器上的恒等张量积、再把同各方源合并"的顺序是刻意的：它只存新寄存器，绝不把既有源半区穿过更早的映射（04-compression.tex:250）。分支相关的槽维数靠直和嵌入公共环境半空间 $\mathcal H_{g,P,e}=\bigoplus_\xi\mathcal H_{g,P,e,\xi}$ 统一（04-compression.tex:257），这些私有直和的维数后续一概不用。

第二步：对每个槽的双分源算符做无偏随机替换。给定 ket 分支 $\xi$、bra 分支 $\zeta$ 的两个施密特展开（概率列 $\lambda_a$、$\mu_c$，长度可不等），取 $k$ 组独立标准复高斯 $g_{ac}^{(j)}$（$\mathbb E\lvert g\rvert^2=1$），令
\[
 U_j=\sum_{a,c}(\lambda_a\mu_c)^{1/4}g_{ac}^{(j)}\lvert u_a\rangle\langle\widetilde u_c\rvert,\qquad V_j=\sum_{b,d}(\lambda_b\mu_d)^{1/4}\overline{g_{bd}^{(j)}}\lvert v_b\rangle\langle\widetilde v_d\rvert,\qquad \widehat X=\frac1k\sum_{j=1}^kU_j\otimes V_j
\]
（04-compression.tex:294）。由 $\mathbb E[g_{ac}\overline{g_{bd}}]=\delta_{ab}\delta_{cd}$ 得 $\mathbb E\widehat X=X=\lvert\eta\rangle\langle\widetilde\eta\rvert$（04-compression.tex:308）。我最初担心 $U_j$、$V_j$ 的算子范数会随槽维数爆炸，通篇却根本不采样任何范数界，不需要，因为误差是最后在**密度整体**上用迹范数二矩控制的。中心化系数 $z_{il}$ 的配对协方差由复高斯 Isserlis 公式（04-compression.tex:319）算出：四矩拆成两个配对，中心化消掉 $\delta_{\alpha\beta}\delta_{\gamma\delta}$，剩下对角协方差
\[
 \mathbb E[z_{il}\overline{z_{i'l'}}]=k^{-s}\sqrt{p_i\widetilde p_l}\,\delta_{ii'}\delta_{ll'}
\]
（04-compression.tex:405），其中修正端点指标列按 $\lambda_a\lambda_b$、$\mu_c\mu_d$ 独立取权，即便真实纯态会把两端指标绑在一起，采样权重刻意把它们当独立求和指标（04-compression.tex:396）。这一步的"反直觉"是我卡了最久的地方：看似浪费的独立性恰是后面重组成 $\widetilde R^{1/4}OR^{1/4}$ 的前提。

展开式按修正位置集合 $S\subseteq\mathcal E$ 组织：$\widehat\rho-\rho'=\sum_{\varnothing\ne S}F_S$（04-compression.tex:349）。$S$ 只指定哪些位置用中心化修正，不指定单项式标签。决定性一步是参与次数假设的用场：$|S|=s$ 个修正位置的端点方 $\mathcal A$ 至多 $2s$ 位（04-compression.tex:358），只展开与 $\mathcal A$ 相触的至多 $2bs$ 个非私有门（04-compression.tex:360），其余门保持聚合收缩原样。于是固定标签与物理基元选择的总加权代价 $\le B(L)^{4bs}d(L)^{4s}=Q(L)^s$（04-compression.tex:367）：代价按修正位置数计，并非全体门的乘积。我第一版把全部门先展开，代价是 $\prod_g\lvert\Xi_g\rvert$，指数级；改为"谁被修、谁展开"之后才多项式化。误差项对随机样本的选择没有依赖（不存在样本自适应分支，04-compression.tex:378），三角不等式逐选择求和，无须任何跨分支协方差假设。

固定一个选择后，剩余任务是均值迹范数 $\le k^{-s/2}$ 且与私有维数无关。结构：所有修正源两端都在 $\mathcal A$ 内，故跨 $\mathcal A$ 边界的源全部精确；把它们当作两侧的归一化自由输入，制备 Schmidt 概率阵 $\tau$、$\widetilde\tau$（04-compression.tex:389）。受影响侧算得收缩 $A_x:\mathcal I\otimes\mathcal T\to\mathcal F$ 与 $\widetilde A_y$，其"合并映射" $O=\widetilde A_y^{\dagger}A_x$ 满足 $\lVert O\rVert\le1$（04-compression.tex:440），构造 $A_x$ 的每一步要么收缩、要么等距制备、要么闲置寄存器上的恒等、要么物理基投影，从无输出向量归一化，这条"全程未归一化"是界干净的根源。外部侧 $K,\widetilde K$ 对任意矩形 $Z$ 有 $\lVert\mathrm{Tr}_{\mathrm{garbage}}(KZ\widetilde K^{\dagger})\rVert_1\le\lVert Z\rVert_1$（04-compression.tex:454），迹范数对偶证明之，$Z$ 不必 Hermite 不必正。受影响侧迹弃垃圾后的外部输入算符是
\[
 Z=\sum_{i,l}z_{il}\,\tau^{1/2}O_{li}^{T}\widetilde\tau^{1/2}
\]
（04-compression.tex:472），$T$ 是坐标基下的整体转置、保一切 Schatten 范数（04-compression.tex:481）。两次带权 Hölder：指数 $(4,2,4)$ 得
\[
 \lVert\tau^{1/2}W\widetilde W\widetilde\tau^{1/2}\rVert_1\le\lVert\tau^{1/4}\rVert_4\lVert\tau^{1/4}W\widetilde\tau^{1/4}\rVert_2\lVert\widetilde\tau^{1/4}\rVert_4=\lVert\tau^{1/4}W\widetilde\tau^{1/4}\rVert_2
\]
（04-compression.tex:486），等号因概率阵迹为 1；对 (04-compression.tex:505) 的期望平方求和恰重组成 $\lVert\widetilde R^{1/4}OR^{1/4}\rVert_2^2$（$R=\mathrm{diag}(p_i)\otimes\tau$ 迹 1，04-compression.tex:517），再来一次 $(4,2,4)$：
\[
 \lVert\widetilde R^{1/4}OR^{1/4}\rVert_2\le\lVert\widetilde R^{1/4}\rVert_4\lVert O\rVert\lVert R^{1/4}\rVert_4\le1
\]
（04-compression.tex:525）。这个界里没有源秩、没有输入维数、没有弃空间维数，§2 立下的"维数免疫"军规在此兑现成定理形态。Cauchy--Schwarz 收给 $\mathbb E\lVert Z\rVert_1\le k^{-s/2}$（04-compression.tex:532），过外部映射不涨、回插物理矩阵单位不涨（迹范数 1），逐 $S$ 求和：
\[
 \mathbb E\lVert\widehat\rho-\rho'\rVert_1\le\Bigl(1+\frac{Q(L)}{\sqrt k}\Bigr)^{N}-1
\]
（04-compression.tex:549）。取整数 $k$ 使 $Q(L)/\sqrt k\le\epsilon/(8N)$（04-compression.tex:555），右边 $\le e^{\epsilon/8}-1\le\epsilon/4$；期望小则存在实现，Markov 抽一个样本固定下来，$\sigma=\widehat\rho$（04-compression.tex:560）。

网络实现是纯簿记：同一门内 ket/bra 公共标签 $(\xi,\zeta)$ 沿一颗星从一位当事方散播给其余各方，星边虚拟指标多项式维（04-compression.tex:567）；每个槽的样本指标 $j\in\{1,\dots,k\}$ 直接在两端方之间共享（04-compression.tex:570）。每门至多 $b-1$ 条星边与 $\binom b2$ 条样本边（04-compression.tex:581），每方至多 $b$ 个非私有门，故网络入射度有界；平行边可并（有界多条仍多项式）。标量系数与平均权重塞进任一张量元即可；被采样的张量元数值不必有界、不必高效可计算，本文只要存在性与连线维数（04-compression.tex:586）。与隐私放大/解耦文献里带权迹--HS 比较同族（04-compression.tex:465 引 Renner 与 Dupuis--Berta--Wullschleger--Renner），此处用的是矩形双权 Schatten Hölder 的独立证明版。

## §9 平面调度：二进层级、边词与点处理

目标：把 §7 的有界改动排成满足 §8 全部四条假设的调度，并为 §10 的路由预留几何。协议命题（06-geometry.tex:12）汇成一张清单：$O(L^2)$ 个参与方， padded 二层级每方格一位、每次重绘另加固定数目的额外方（06-geometry.tex:18）；至多 $CL^3$ 次改动，每次由固定数目的收缩门实现，展开形态即 §7 的引理三件套（06-geometry.tex:26）；每方一生参与跨方门次数有界（06-geometry.tex:32）；同一门的各方尺度相等或相邻、地址距离 $O(n)$（06-geometry.tex:35）；每步参考向量改动 $\le CL^{-20}$，终态
\[
 \Omega\otimes\Xi,\qquad 1-CL^{3-60}\le\lVert\Xi\rVert\le1
\]
（06-geometry.tex:41、06-geometry.tex:46），每个物理格点的原始寄存器都落到自己的单位尺度方名下。预算 $CL^3$ 是故意写松的：真实改动数 $O(L^2)$（06-geometry.tex:652），我需要在乘法记误差时留余量（06-geometry.tex:55）。

坐标约定：平移格点使站点为单元中心 $(i+\tfrac12,j+\tfrac12)$，$0\le i,j<L$，取 $2$ 的幂 $N$ 使 $L\le N<2L$，层级由 $[0,N]^2$ 内边长 $n=2^j$ 的对齐方组成（06-geometry.tex:62）。导引是环境平面的多边形分割，标签按物理采样决定持有者；全部边界用同一个无穷小泛导平移裁决（06-geometry.tex:73），任何标签不独占低维面。主线推进方式：每层把一个 $n$ 方从"$2n$ 方均匀标签"重绘到"$n$ 方均匀标签"，中途其余 $n$ 方只取旧 $2n$ 标签或新 $n$ 标签二值（06-geometry.tex:82），于是被重绘方的每条开边两侧各只有一个标签。外区占位符标签每次重绘由一位临时额外方代表、下次可换人（06-geometry.tex:94），它从不持有主线原始寄存器（06-geometry.tex:96）。

几何参数：$t=D\log L$、$h_n=\epsilon_0\min(n,t)$（06-geometry.tex:105）。真顶点＝至少三个不同实标签闭包之交的点（06-geometry.tex:109），每个真顶点处挖洞：内半径 $h_n$、外半径 $2h_n$、测试指数 $60$（06-geometry.tex:113）；标签持有者按"占位符之外的实incidence标签"典范选定（06-geometry.tex:119）；$\epsilon_0$ 最终固定使每个导引内外方两两不交（06-geometry.tex:115）。进层前把主线薄旧洞逐一 resize 到新 $h_n$，仍是小补丁重写（06-geometry.tex:127）；新辅助薄均匀无洞；退役辅助薄连寄存器与标签原地冻结到终盘（06-geometry.tex:131）。

小尺度 $n\le K_0t$ 直接重绘、不用辅助薄（06-geometry.tex:137）；大尺度走"剥边"程序。沿 $S$（旧标签 $A$、新标签 $B$）的一条边取平行坐标 $s\in(0,n)$、法向坐标 $d>0$，楔形宽度
\[
 w(s)=10^{-3}\min(s,n-s),\qquad x=d/w(s)
\]
（06-geometry.tex:147）。楔形设计的用意：条带边界到边的距离随 $s$ 到端点线性收敛，恰与 §5 角度界"向有限标记点线性收拢、下不穿 $D\log L$"的分离模式咬合； bend 只在 $s=n/2$ 处、仅两标签相触，不是真顶点（06-geometry.tex:323）。第一步只在 $S$ 中部生 $B$，四条内缘带 $0<x<1$ 留 $A$（06-geometry.tex:155）。随后逐边处理，边前法向词 $C\,A\,B$（$x<0$、$0<x<1$、$x>1$），$C$ 为外侧邻方标签或占位符（06-geometry.tex:164）。

为什么不直接把 $A$ 带杀死成 $B$：那样外词成 $C\mid B$，改变带闭包沿原边全程贴 $C$，分离度为零（06-geometry.tex:175），§5 假设当场失效，这就是 §4 里预告的"第三方触及被改区域对面"的几何形态。修补靠辅助薄造缓冲：新辅助 $\Omega$ 薄初始均匀 $C$，依次生 $B$ 于 $-6<x<-1$、生 $A$ 于 $-5<x<-2$、生 $C$ 于 $-4<x<-3$（每次插入严格落在其周边带内），得七带词
\[
 C\mid B\mid A\mid C\mid A\mid B\mid C
\]
（06-geometry.tex:193）。在透镜 $Y=\{0<s<n:-7<x<-7/2\}$ 上交换两薄指派（06-geometry.tex:201）：透镜两侧开边都走在共同 $C$ 走廊里，$x=-7$ 侧在辅助 $x<-6$ 的 $C$ 段，另一侧穿过辅助 $(-4,-3)$ 的 $C$ 带，主线薄在该外缘带全程本是 $C$，交换后主词变为 $C\mid B\mid A\mid C\mid A\mid B$；辅助薄随即退役（06-geometry.tex:212）。再在主线上杀 $(-4,0)$ 入 $A$、杀 $(-5,1)$ 入 $B$，此时词为界面在 $-6$ 的 $C\mid B$；生 $C$ 于 $(-3,0)$、杀 $(-6,-3)$ 入 $C$，界面滑回 $x=0$，外词复原为 $C\mid B$（06-geometry.tex:219）。七带词是反复试出来的最小配置：我先试五带，死亡步找不到四周同色的包围带；又试纯生纯死不交换，透镜找不到零分离规避处。各步包围区间与改变区间的严格余量逐条列在角分离证明里（06-geometry.tex:285）。

不同边的带互不干扰要靠显式验算：对边带宽双侧至多 $0.004n$、隔距 $n$；邻边若有公共点、设到两边距离 $r_1,r_2$，同时入带蕴含 $r_1<0.008r_2$ 且 $r_2<0.008r_1$，矛盾（06-geometry.tex:234）；负 $x$ 部分只在唯一外邻方内。于是"已完成的边不改变下一条边所需的法向词"。角分离引理（06-geometry.tex:254）把全部基本生/死/交换收进两个一致不等式：未修改生死的改变区域 $R$ 对周边导引满足
\[
 \mathrm{dist}\bigl(y,\overline{\{f\ne P_\circ\}}\bigr)\ge a_0\min\{n,d_{\mathcal V}(y)\},\qquad y\in\overline R
\]
（06-geometry.tex:260），未修改交换的非公共 $C$ 位置集满足 $\mathrm{dist}(y,\partial Y)\ge a_0\min\{n,d_{\mathcal V}(y)\}$（06-geometry.tex:268）。证明套路是固定 $n$ 单位下所有界面都是直射线、相关闭锥族除共心外不相交、与单位上确界球之交有正分离，齐次性加紧性给出一致 $a_0$（06-geometry.tex:302）；标签重合只会删掉障碍集，从不恶化分离（06-geometry.tex:316）。

点处理。任何基本改动前，先把每个标记的半径 $t$ 方内在每张涉事薄上均质化为周边标签 $P_\circ$，改动完再撤除（06-geometry.tex:330）。取 $K_0$ 大到当 $n>K_0t$ 时处理方的十倍膨胀两两不交、不含其他未修改真顶点、且落在上述直射线图卡内（06-geometry.tex:341）；取 $\epsilon_0$ 远小于这些正分离、普通网格分离与 $a_0$（06-geometry.tex:349），使一切临时导引里外洞仍互不交。均质化后新的真顶点至多出现在"射线乘方缘"交点上（06-geometry.tex:383）；任何新画界面在缘邻域只碰两个标签，旧真顶点保住自己的洞与标签持有者（06-geometry.tex:388）。对生死：其余改变点在已处理方之外，故 $d_{\mathcal V}(y)\ge t$，均质化只删除异标签障碍，分离下界升级为 $a_1\max\{t,\min(n,d_{\mathcal V}(y))\}$（06-geometry.tex:367）；对交换：$\partial Y$ 连同缘交点整条落在开公共 $C$ 走廊，且由 $y\mapsto\mathrm{dist}(y,\partial Y)$ 与 $y\mapsto d_{\mathcal V}(y)$ 的 1-Lipschitz 传递，中心 $c$ 处余量 $a_*Q_c$ 在洞内点 $x$ 退化为 $\frac12a_*Q_x$（06-geometry.tex:412），于是每个自适应半径分支的选中方也整体同一侧，交换搬"整洞带标签"，绝不在顶点处拼接两套导引。这些正是 §7 两引理假设的验证：$T$ 直径 $O(n)$、与 $E$ 的分离逐点锥形收拢（06-geometry.tex:423）。[推测] 这段"Lipschitz 传递到洞内每点"是成品补丁：初稿大概只在洞心验过，选中半径 $2h_n$ 的偏移迟早会让边界情形翻车。

小补丁覆盖的四条件逐一核验（06-geometry.tex:447）。两主人条件的一致化靠紧性观察：紧工作邻域内固定一个缩放导引，$F_c$ 取标签 $c$ 区域的闭包挖去开内洞，三个不同实标签的 $F_c$ 无公共点（每个真顶点严格在自己内洞中），于是存在正的上界足迹直径使更小足迹碰不到三个标签；半径比例在离零紧区间里变动时，把参数与公共点并入闭集再做列子列论证，最后对有限个标签重合类型取最小（06-geometry.tex:454、06-geometry.tex:463）。足迹中心允许落在洞里、计数只看洞外足迹点（06-geometry.tex:475），这恰好放行"补丁网覆盖整个外洞足迹"这一 §7 的硬要求。单标记：$\nu t$ 内半径补丁、网格距 $\le u$ 覆盖已处理方与全部受影响外洞（06-geometry.tex:492）；小尺度直接重绘用 $\nu n$ 补丁、半径比落在 $[\epsilon_0/\max(K_0,1),\epsilon_0]$（06-geometry.tex:514）；resize 覆盖新旧两足迹之并（06-geometry.tex:530）。§7 末段的分支支撑事实由几何假设自动供给，即便新旧洞半径不等（06-geometry.tex:543）。常数选择全序写明避免循环：模板定 $a_0$ 与图卡常数，然后 $K_0$、然后 $\epsilon_0$、然后 $\nu$，然后残余余量 $a$ 与角度界的 $D$，最后 $B_0$ 取固定倍数 $K_0D$（06-geometry.tex:559）。

寿命与计数。每次基本操作固定数目标记、补丁、当事方；每次重绘至多用四张辅助薄（06-geometry.tex:576），重绘与 resize 的关联门数一致有界（06-geometry.tex:578）；把小补丁近似精度、$L^{-60}$ 补丁测试与 $O(L^{-30})$ 分裂误差合账，定出每步 $CL^{-20}$（06-geometry.tex:582）。主线标签不变量（06-geometry.tex:601）：层 $n$ 初只有 $2n$-块标签、层中只有 $2n$ 与 $n$-块加临时占位符、层末只有 $n$-块；边长 $m$ 的方到层 $m/2$ 末从一切主线导引与标签上消失（06-geometry.tex:612），故它只在层 $m$、$m/2$ 及中间过渡里出现在关联门，而距离 $O(m)$ 内只有固定数目重绘与交界（06-geometry.tex:615）。冻结辅助薄不再制造入射：每张初始化、用一次、点处理回收到终帧、永久退役，之后没有任何门会解除那次交换，新辅助的 $C$ 永远取自当前主线导引（06-geometry.tex:621）；退役占位符也不继承寄存器。地址 $a(S)$ 取方中心整数坐标（06-geometry.tex:637），§8 所需的"每方一生跨方门总数有界"至此全部兑现。层 $n$ 有 $O((N/n)^2)$ 次重绘，逐倍层求和 $O(L^2)$、被 $CL^3$ 吸收（06-geometry.tex:649）；冻结辅助洞总数用弱界 $CL^3$ 足够（06-geometry.tex:656）。终局取 $\epsilon_0<1/4$：单位尺度下网格角外洞不含任何单元中心，编码平凡化，主线参考恰为 $\Omega$（06-geometry.tex:669）；每张辅助薄范数 $\ge1-r_{\mathrm{holes}}L^{-60}$，乘积给 $1-CL^{3-60}\le\lVert\Xi\rVert\le1$（06-geometry.tex:678）。

## §10 组装：密度、列与路由

最后一棒分四拍（07-assembly.tex）。第一拍，协议以幂 $60$ 实例化（07-assembly.tex:11），初始态按方为乘积：根方私有持有主线 $\Omega$，每份未来辅助副本由其初始化方私有持有（07-assembly.tex:12）；小补丁重写统一用算子误差 $\le L^{-25}$ 的多项式近似（07-assembly.tex:31）。收缩乘积的 telescoping 把 $CL^3$ 步误差线性累加：终态实际向量 $\Psi$ 满足
\[
 \lVert\Psi-\Omega\otimes\Xi\rVert\le CL^{-17},\qquad \lVert\Psi\rVert\le1
\]
（07-assembly.tex:39）。纯态密度差用 $\lVert\lvert u\rangle\langle u\rvert-\lvert v\rangle\langle v\rVert_1\le2\lVert u-v\rVert$，偏迹单调，得
\[
 \Bigl\lVert\mathrm{Tr}_{\mathrm{priv}}\lvert\Psi\rangle\langle\Psi\rvert-\lvert\Omega\rangle\langle\Omega\rvert\Bigr\rVert_1\le CL^{-17}+CL^{-57}\le CL^{-10}
\]
（07-assembly.tex:48）。这里我特意在正文写了一句防御（07-assembly.tex:50）：协议不依赖对指数小成功振幅的重新归一化，保留范数接近 1 由 §9 的 $\Xi$ 下界保证，$\S8$ 的绝对误差因此可以直接入账（04-compression.tex:601 注）。第二拍，把协议作为 §8 的输入，精度取 $L^{-5}$，得多项式连线算符网络 $\sigma$：
\[
 \lVert\sigma-\lvert\Omega\rangle\langle\Omega\rvert\rVert_1\le CL^{-5}
\]
（07-assembly.tex:59）；$\sigma$ 每方一节点、物理腿为该局域 ket 与 bra，采样不保证正性或 Hermite（07-assembly.tex:62）。第三拍是列提取引理（07-assembly.tex:67）：若 $\lVert\sigma-\lvert\Omega\rangle\langle\Omega\rVert_1\le\eta<1$，则存在乘积基列 $v=\sigma\lvert z\rangle$ 非零且
\[
 \min_\theta\Bigl\lVert\frac{v}{\lVert v\rVert}-e^{i\theta}\Omega\Bigr\rVert\le2\eta
\]
（07-assembly.tex:74）。证明只用两个求和恒等式 $\sum_z\lVert E\lvert z\rangle\rVert^2=\lVert E\rVert_2^2\le\eta^2$ 与 $\sum_z\lvert a_z\rvert^2=1$（$E=\sigma-\lvert\Omega\rangle\langle\Omega\rvert$、$a_z=\langle\Omega\lvert z\rangle$，07-assembly.tex:83），挑一个使 $\lVert E\lvert z\rangle\rVert\le\eta\lvert a_z\rvert$ 的 $z$。我当初几乎因为"$\sigma$ 非正、可能有负特征值"想把目标弱化成逼近某个混合态；均值论证说明根本不必：迹范数界经 HS 范数摊到所有基向量上，总有列表现不差，且不需要 $\lvert a_z\rvert$ 的下界、不需要正性（07-assembly.tex:92）。在算符网络上把该列输入基指标逐方固定，虚拟维数一根不少（07-assembly.tex:93）。第四拍，路由（07-assembly.tex:122）：网络在方图上、定理要同格点 PEPS，这一步我最初想"沿相邻方直接收缩过去"，但当事图不是方格、连线跨尺度，必须走直线。锚点取 $a_{j,r,s}=(2^jr+2^{j-1},2^js+2^{j-1})$（$j\ge1$）或 $(r,s)$（$j=0$）（07-assembly.tex:108），临时方继承创它之方的锚。连线任意定向后先横后纵路由；尺度 $2^j$ 的水平段走在行 $y=2^{j-1}(2s+1)$ 上，其 2-进赋值恰为 $j-1$，一条行只属一个非单位尺度，锚间距 $2^j$ 加端点距离 $O(n)$ 限制同一水平边的过路条数，竖直段用列同理（07-assembly.tex:136）；$j=0$ 的短程连线另添一个常数（07-assembly.tex:143）；允许交叉，交叉点的格点张量把过路虚拟指标并列携带（07-assembly.tex:145）。这套尺度分离嵌入在 Barthel--Kliesch--Eisert 的工作里有先例（07-assembly.tex:117），我按本场景的有界寿命网络重证一遍并显式处理有限方折叠：pad 到 $N<2L$ 后以 $f(x)=x$（$x<L$）、$f(x)=2(L-1)-x$（$L\le x\le N-1$）折回真格（07-assembly.tex:151），每个坐标与一维边至多两个原像，折叠至把拥堵乘 4（07-assembly.tex:158），且真实输出坐标不动。每条过路携带恒等张量，同一条网格边上的全部指标打包成张量积指标；若原连线维数 $\le C_1L^r$、拥堵 $\le\chi$，最终键维
\[
 D_e\le(C_1L^r)^\chi
\]
（07-assembly.tex:171）仍多项式。真顶点处"单张量含物理输出"恰是 §0 主定理的 PEPS 定义里任意线性映射 $\bigotimes_{e\ni v}\mathbb C^{D_e}\to\mathbb C^q$（00-introduction.tex:31），无额外操作的顶点给恒等因子。

常数与小数收尾（07-assembly.tex:179）：先固定 $q,J,\Delta$ 与全部幂指数，有限带模板给出锥形余量；依次选点处理放大因子、小洞比例、补丁网格，再选残余分离 $a$、由幂 $60$ 的角度界定 $D$，最后取覆盖一切 $\le$ 固定倍 $D\log L$ 补丁的 $B_0$；补丁命题给出固定秩指数后，重写引理的奇异值截断维数按 $L^{-25}$ 定，效应栈长按**原始**加权展开误差选（07-assembly.tex:196），最后才定高斯样本数（07-assembly.tex:198）。没有一次代数选择回改先前几何支撑。$L\ge L_0$ 时 $CL^{-5}\le L^{-1}$；有限多个小尺寸每个都有精确 PEPS：生成树上所有边共用一个 $q^{L^2}$ 维指标，树顶点输出该组态的局部基态、展开系数全放根处，非树边维数 1（07-assembly.tex:205），键界对固定 $L$ 与哈密顿量无关，并入同一常数 $C$。至此主定理对所有 $L\ge2$ 成立。

## §11 误差级联：从单一日志余量到 $60\to30\to20\to17\to10\to5\to1$

早期我完全按"$\epsilon$ 均分给各层"的直觉设计。$CL^3$ 步累加至多 $L^{-1}$ 意味着每步 $\le L^{-4}$，所有子引理都用同一个 $L^{-4}$ 精度实例化。这条路一开始就断了，两处硬伤几乎同时冒出来。信息复位引理（02-information.tex:345 的 $w=C_p(1+b+\log L)$）要求 $b$ 大到能把复位宽度写成实际可用的量，$b\le L^{-4}$ 会让 $b$ 与 $\log L$ 完全同级，$C_p$ 变成 $L$ 依赖、$D$ 定不下来。压缩机器（04-compression.tex:202 的 $\delta=\epsilon/(8M)$）在 $M$ 等于跨方门总数 $CL^3$ 之下把 $\delta$ 直接跌到 $L^{-7}$ 量级，效应消除（04-compression.tex:61）要求 $m$ 由原始系数和与效应数共同决定的多项式给出，$m$ 因此变成超多项式，链路当场断。

转折是把顶层目标 $L^{-1}$（00-introduction.tex:55、main.tex:47）逐层预分配成一条有严格递减梯度的幂次链，每一段留一格余量给下面一级。07-assembly.tex:11 把补丁测试与信息测试的幂统一取 $60$，这是最靠内的一级：$60$ 让 §7 的分裂推论把 $b\le L^{-60}$ 兑换成向量距离 $L^{-30}$（05-frames.tex:367），$L^{-30}$ 再被 §9 的角分离假设消费成每步参考向量差 $\le CL^{-20}$（06-geometry.tex:41），$CL^{-20}$ 由 §10 的 telescoping 线性累加到 $CL^{-17}$（07-assembly.tex:39），密度端 $\le CL^{-10}$（07-assembly.tex:48），$\sigma$ 迹范数端 $\le CL^{-5}$（07-assembly.tex:59），列提取把 $2\eta$ 直接落到 $L^{-1}$（07-assembly.tex:74）。$60$ 与 $30$ 之间还夹着 05-frames.tex:211 的 $(m+r_{\mathrm{old}})\varepsilon$ 累积，$m$ 与 $r_{\mathrm{old}}$ 都是一致常数，$60$ 与 $30$ 之间因此留了两格余量给小补丁重写与分裂的乘积。

$20$ 与 $17$ 差 $3$ 的来源：telescoping 时 $CL^3$ 步的乘积误差把 $L^{-20}$ 拉低三个对数量级（07-assembly.tex:34 与 07-assembly.tex:39 的 $CL^{-17}$），$17$ 之后再叠 $\Xi$ 尾项 $CL^{-57}$ 与密度差 $2\lVert u-v\rVert$（07-assembly.tex:42），取大者得 $CL^{-10}$（07-assembly.tex:48）。$10$ 到 $5$ 是留给压缩机器 $p$ 的自由选择（07-assembly.tex:57 明写 accuracy 取 $L^{-5}$），$5$ 到 $1$ 是留给列提取的常数 $2\eta$（07-assembly.tex:74）与 $L_0$ 阈值吸收。

为什么取 $60$ 到 $40$ 之间不选后者：§5 的 $r_*=2p+10$（02-information.tex:426）在 $p=60$ 时把连续性等式 $I\le CL^{2-r_*/2}$（02-information.tex:628）压到 $L^{-28}$，跨双份放大 $4L^{-30}$（05-frames.tex:546）与累积 $(m+r_{\mathrm{old}})L^{-60}$ 之后仍稳过 $L^{-30}$ 阈值；若 $p=40$，$r_*=90$、$L^{2-r_*/2}=L^{-43}$ 本身尚可，两薄交换的 $4L^{-30}$ 与复位宽度 $C_p(1+L^{-40}+\log L)$（02-information.tex:345）会挤到同一数量级，$D$ 因此变成 $L$ 依赖。$60$ 与 $57$ 之间留的那一格是刻意让 $\lVert\Xi\rVert\ge1-CL^{-57}$（07-assembly.tex:24）在 $CL^{3-60}$ 展开下仍稳过 $1-o(1)$，让 §8 的"保留范数接近 1 时绝对误差可直接入账"（04-compression.tex:607）兑现成 §10 第一拍的 $CL^{-10}$。[推测] 早期手稿里我大概试过 $p=30$、$p=45$、$p=50$ 三档，成品只留一句幂 $60$。

## §12 错路之三：越界到可执行性

第三条错路我承认走了整整两个月：把所有权协议当成可执行算法来设计。具体动作是三件：给每个参与方加"多项式时间"约束，规定其私有收缩必须在 $L^{O(1)}$ 步骤内完成；让 §7 的分裂引理（05-frames.tex:352 的等距 $V$）显式由约化密度矩阵的谱分解给出；让 §8 的高斯样本 $U_j$、$V_j$（04-compression.tex:294）用真随机源采样。三处都栽在同一坑里：04-compression.tex:586 明写被采样张量元的数值不必有界、本文只要存在性与连线维数，把这条边界擦掉之后立刻在两个地方反噬。

反噬一是 §5 的 $z\ge e^{-2b}$（02-information.tex:412）：这条下界来自最大施密特概率 $\operatorname{Tr}\rho_{\widetilde\Omega,Rb_R}^{2}\ge e^{-2b}$，若要求 $z$ 可算就得对 $\rho_{\widetilde\Omega,Rb_R}$ 做完整谱分解，那已经把 $q^{O(\lvert Rb_R\rvert)}$ 的时间吃掉，跟 §11 的幂级预算冲突到根本不可调和。反噬二是 §8 的 Markov 抽样步骤（04-compression.tex:560）：那里只保证存在一个实现满足误差，若要求实现可算就得回到概率几何测度的采样复杂度，本文战场根本不在这一格。

第二条坑在正性。$\sigma$ 由 §8 采样构造，07-assembly.tex:62 明写采样不保证 $\sigma$ 的正性或 Hermite 性。我最初想把目标弱化成"逼近某个混合态"来保住正性，那样 §10 的列提取引理（07-assembly.tex:67）就不可用：列提取要的是 $\sigma$ 与 $\lvert\Omega\rangle\langle\Omega\rvert$ 的迹范数近，是**向量**层面上的主张。真解是承认采样非正本身是特性、缺陷靠 07-assembly.tex:83 的两条求和恒等式补回来：$\sum_z\lVert E\lvert z\rangle\rVert^{2}=\lVert E\rVert_{2}^{2}\le\eta^{2}$ 与 $\sum_z\lvert a_z\rvert^{2}=1$，两条均值一叠加、总能挑到 $\lVert E\lvert z\rangle\rVert\le\eta\lvert a_z\rvert$ 的 $z$，不需要 $\lvert a_z\rvert$ 的下界。事后复盘，"表示与算法"这条界线在 00-history.tex:80 就已经划清楚，我越界只是自我安慰。

第三条坑在 §9 的占位符标签。我曾试图让占位符在两次重绘之间"接力"，好把辅助方数量压下来。这在 §8 的第二条假设（04-compression.tex:140 的每方一生非私有门 $\le b$）里立刻破产：占位符一旦跨两次重绘，其参与次数就是 $O(L^2)$ 级，$b$ 变成 $L$ 依赖。06-geometry.tex:94 现在明写占位符每次重绘换一位临时额外方代表、下次可换人，正是把 §8 假设反推到几何端的产物；06-geometry.tex:96 补一句占位符从不持有主线原始寄存器，06-geometry.tex:628 补一句退役的占位符不继承寄存器，三处一起构成占位符的"一生只属于一次重绘"契约。

## §13 转折之二：把几何与压缩解耦

真正让 §8 独立起来的转折发生在我把两份草稿对撞之后。第一份把压缩机器与帧协议交错写：每步 §7 的有界改动之后立刻跑一次 §8 的效应消除，$\delta$ 每步独立选。第二份按现在 §7 与 §8 分离的写法：先跑完整场几何调度，一次性把整个协议交给 §8。前者看似局部误差可控，实则崩在 04-compression.tex:206 背后的次序约束："原始系数和与效应数"要在置换平均展开之前定，交错写意味着这两个量在每步都变，$m$ 的选取变成自指；一次性交出的写法里 $M$ 就是 §9 承诺的 $CL^3$ 常数，一次选定 $m$ 全程通吃。00-introduction.tex:148 那句压缩定理独立于平面构造是成品宣言，我当初并没有意识到它就是构造的分水岭。

解耦的第二个红利在接口最小化。06-geometry.tex:26 现在明写 §9 的每步改动都通过 §7 三件套（05-frames.tex:188 重写、05-frames.tex:396 生死、05-frames.tex:460 交换）落实为允许单项式，§9 从此不再制造新单项式；§8 与 §9 之间的通信只剩两个数字接口，即 04-compression.tex:140 的参与次数 $b$ 与 04-compression.tex:143 的多项式展开指数。04-compression.tex:164 的"$C,a$ 只依赖 $p$ 与固定均匀数据"因此有了兑现的舞台。04-compression.tex:148 的第四条假设"每方物理输出空间维数一致多项式"由 06-geometry.tex:51 的直接结论（每方物理输出维数至多 $q$）满足：这条假设在交错写时我需要每一步都手动 verify，解耦之后一次到位。

解耦的副作用出现在 §6 的半径自由上。交错写时我强迫 §6 的 $r_j$ 与调度尺度 $n$ 对齐，好让每次重绘后补丁在纸面上与薄半径匹配；结果 03-patches.tex:34 的 $u\le r_1\le\dots\le r_m\le 2u$ 被硬生生砍成单一半径，§2 的第一条错路（面积律直接搬全局截断）在协议层复发一次。解耦之后 §6 与 §9 各写各的：补丁层允许 $r_j$ 独立跑，几何层的 $h_n=\epsilon_0\min(n,t)$（06-geometry.tex:105）只约束洞半径；两者只在 05-frames.tex:35 的编码器接口处相遇，$D_j$ 夹在 $Q^-(c,h)$ 与 $Q^+(c,h)$（05-frames.tex:28）之间即可。

## §14 与最初设想的四点结构性差异

差异一是"逐点割线施密特尾"变成"嵌套方形样本上的自适应约束"。P1 的原始版本要求每张割线单独做截断、把截断张量拼起来；§6 的最终形态（03-patches.tex:24 的补丁命题）只保证 $\lVert(\mathrm{id}-P)\Omega\rVert\le L^{-p}$（03-patches.tex:32）而拒绝在指定边界给出有限秩精确截断，03-patches.tex:6 那句"This freedom is essential"就是 §2 那条错路的伤口结痂。03-patches.tex:34 的 $u\le r_1\le\dots\le r_m\le 2u$ 是允许变半径这句承诺的定量表达。

差异二是"总误差线性累加"变成"复位不累加"。P2 让所有子区域的 $\delta_j$ 相加；§5 的角信息界（02-information.tex:635）走的是 02-information.tex:781 的"复位之后信息回到 $L^{-p}$、层数再多也不进总账"。02-information.tex:754 的 $D\ge 4C_4/c_*$ 与 02-information.tex:768 的 $(\log\log L)^{K}/\log L\to0$ 是这条不累加律的两根数字支柱；02-information.tex:666 的 $s_j=2^{-j}n$ 保证归纳不变量（02-information.tex:693）从远及近每一层都被清零重记。

差异三是"翻译不变环面"变成"开区带任意界"。最初我照搬 00-history.tex:15 里全局形式陈述所用的平带、翻译不变、周期边界口径；最后主定理只声明近邻平方格 $E(\Lambda_L)$（00-introduction.tex:22）上的任意有界逐点与近邻相互作用 $H$（00-introduction.tex:41），无平移不变、无环面、无 frustration-free、无路径假设。00-introduction.tex:61 那句"No gap for restrictions to subregions, frustration freeness, commutativity, translation invariance, or path from a product state is assumed"就是把 P1 里我最初偷偷加进去的四个额外假设逐条删掉的清单。

差异四是"表示与算法的界线"。P1 时代我以为存在性证明只要给出张量元上界就够；成品在 00-introduction.tex:65、04-compression.tex:586、00-history.tex:81 三处反复声明本文不做算法承诺。§12 的第三条坑正是我从没打算放手的那部分直觉，最后被 00-history.tex:79 那句多项式键界容许任意张量元、这是表示陈述钉死。

## §15 新增登记与残余缺陷（类别式）

本轮动笔只在 §11–§16 追加内容；不就地改字、不重排既有小节、不动 §0 两行登记。按类别登记两处观察到的缺陷，具体片段不复写：
- 类别 A（同族顺序词堆叠）：§7 一处段落相邻三次出现同一族先/后顺序词，读起来像把同一动作反复展开；不逐字复写具体片段，交给本体侧机械清理通道一次即可。
- 类别 B（跨节重复表述）：§9 一处对同一几何常数的两次邻接提及被压进同一句，语义完整、断句偏长，属能力声明边缘；不动它。

自定义宏一律展开：本轮 §11–§14 只用标准记号 `\lVert`、`\rVert`、`\lvert`、`\rvert`、`\mathrm{id}`、`\mathrm{Tr}`、`\bigl`、`\bigr`。素材 preamble 定义的范数与绝对值简写在本笔记正文里一律以标准写法出现，不复制其宏名。台账格内绝对值走 `\lvert` 与 `\rvert`、限制算子走 `\mid`，全部单元格内不出现裸竖线。

## §16 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\Lambda_L$ | $\{1,\dots,L\}^{2}$ | 00-introduction.tex:21 | §0 主定理格点、§9 网格 | 全篇格点身份失效 |
| $E(\Lambda_L)$ | 近邻平方格边集 | 00-introduction.tex:22 | §0 主张、§10 路由终点 | 网络不再落在同格 |
| $H$ | $\sum_{v}h_v+\sum_{e}h_e$ | 00-introduction.tex:41 | §0 参数、§6 能量界 | 变分极小失去哈密顿量 |
| $\lVert h_v\rVert,\lVert h_e\rVert$ | $\le J$ | 00-introduction.tex:42 | §0 参数 $(q,J,\Delta)$ | 补丁能量 $q^{2}J a_j^{2}$ 失去来源 |
| $H-E_0I$ | $\ge\Delta(I-\lvert\Omega\rangle\langle\Omega\rvert)$ | 00-introduction.tex:48 | §5 复位、§6 拉回 | 二维截断失败、§2 首坑复发 |
| 键维上限 | $\le CL^{c}$ | 00-introduction.tex:51 | §0 主张、§10 键维 $(C_1L^{r})^{\chi}$ | 多项式性崩塌 |
| 整体向量误差 | $\le L^{-1}$ | 00-introduction.tex:55 | §11 级联终点 | 主定理变弱或空 |
| 张量元依赖 | 允许任意 | 00-introduction.tex:65 | §12 算法越界的靶 | 存在性宣言失 |
| 面积律常数 | $C_A(q,J,\Delta)$ | 01-preliminaries.tex:41 | §2 尾秩、§5 粗界 | 补丁 $C_Q(1+u)$ 失去来源 |
| 方形半径熵 | $S_\Omega(X)\le C(1+r)$ | 01-preliminaries.tex:58 | §6 谱投影 $Q_j$ | 常数尾失效 |
| 纯化对偶 | $I(A:C\mid B)=I(A:C\mid D)$ | 01-preliminaries.tex:73 | §5 两族反序、§7 分裂 | 反序读失去依据 |
| 保真下界 | $F(\rho,\sigma)\ge e^{-D(\rho\Vert\sigma)/2}$ | 01-preliminaries.tex:95 | §5 分裂、§7 等距 | 复位关键矩阵元失守 |
| 相对熵恒等 | $D(\rho_{AC}\Vert\rho_A\otimes\rho_C)=I(A:C)$ | 01-preliminaries.tex:97 | §5 双副本论证 | 双副本交换图断裂 |
| 条件熵连续性 | $\le C\sqrt\epsilon\log(e\dim\mathcal H_A)$ | 01-preliminaries.tex:150 | §5 收尾 $L^{-p}$ | 迹距转信息不成立 |
| 隙能量不等式 | $\min_\theta\lVert\psi-e^{i\theta}\Omega\rVert^{2}\le 2\Delta^{-1}\langle\psi,(H-E_0I)\psi\rangle$ | 01-preliminaries.tex:157 | §6 拉回、§10 列提取 | 变分极小无法回 $\Omega$ |
| $\epsilon_{\mathrm{col}}$ | $10^{-5}$ | 02-information.tex:46 | §5 领圈宽度指数 | 亚线性丢失 |
| 领圈互信息 | $I_\Omega(X:\Lambda\setminus S_0)\le Cn^{1-\epsilon_{\mathrm{col}}}$ | 02-information.tex:56 | §5 粗界起点 | 后续放大无输入 |
| 放大后互信息 | $I_\Omega(X:E)\le C_Mn^{-M}$ | 02-information.tex:76 | §5 尺度倒推 | 归纳起点变常数 |
| $\beta_0$ | $1-2\cdot10^{-6}$ | 02-information.tex:69 | §5 半径 $r$ 与 $n$ 的赛跑 | 邻域吞并 $A$ 失败 |
| 正替换衰减 | $\le Ce^{-cr^{\alpha}}$ | 08-companion-interface.tex:31 | §5 指数来源 | 放大命题输入失效 |
| 粗信息界 | $I_\Omega(\Lambda\cap T:E)\le C$ | 02-information.tex:103 | §3 拆开口、§5 归纳起 | 单元胞界无锚 |
| 单元胞条件互信息 | $I_\Omega(G:C\mid B)\le C_1(1+\log s)^{K}$ | 02-information.tex:173 | §5 逐格累加 | 归纳不变量崩 |
| 下一代尺度 | $u'=8t_0$ | 02-information.tex:280 | §5 递归代数 | 代数非对数塔 |
| 代数层数 | $O(1+\log\log(s+e))$ | 02-information.tex:308 | §5 瓦片总数 | $(1+\log s)^{K}$ 上界崩 |
| 复位引理宽度 | $w=C_p(1+b+\log L)$ | 02-information.tex:345 | §5 复位核心 | 双副本世界无解 |
| 双副本定义 | $\Psi=\Omega^{\otimes2}$ | 02-information.tex:359 | §5 复位构造 | 交换图失去对偶侧 |
| 分裂重叠 | $\lvert\langle a\otimes a',(\mathrm{id}\otimes V)\Omega\rangle\rvert\ge e^{-b/2}$ | 02-information.tex:389 | §5 $z$ 下界 | 极分解无锚 |
| 关键矩阵元 | $z=\operatorname{Tr}\rho_{\widetilde\Omega,Rb_R}^{2}\ge e^{-2b}$ | 02-information.tex:412 | §5 $D=M_{\mathrm{loc}}/z$ | $D$ 范数爆表 |
| $B_*$ | $1+b+\log L$ | 02-information.tex:426 | §5 高斯滤波 $h$ | 时间截断不匹配 |
| $r_*$ | $2p+10$ | 02-information.tex:426 | §5 收尾 $L^{2-r_*/2}$ | 目标幂次崩 |
| 双侧逼近 | $\lVert M\Psi-z\Phi\rVert\le e^{-h\Delta^{2}/2}$ | 02-information.tex:441 | §5 滤波 | 拉回不成立 |
| 时间截断 | $\lvert t\rvert\le T_0B_*$ | 02-information.tex:447 | §5 积分 | 尾差进入界 |
| Lieb--Robinson | $\lVert[\tau_t(A),B_y]\rVert\le C\lvert S\rvert\lVert A\rVert e^{v\lvert t\rvert-\mu d_K(S,y)}$ | 02-information.tex:493 | §5 尾巴 | 局域化失败 |
| 局域化半径 | $\ell=\lceil K_{\mathrm{loc}}B_*\rceil$ | 02-information.tex:551 | §5 支撑 $S$ | 复位与外核冲突 |
| 极分解不等式 | $\lVert(U-D)\Psi\rVert\le\lVert(\mathrm{id}-D^{\dagger}D)\Psi\rVert$ | 02-information.tex:588 | §5 大范数结清 | 需外系统酉膨胀 |
| 角度分离假设 | $\mathrm{dist}(x,E)\ge a\max\{s_{\min},\min(n,d_{\mathcal V}(x))\}$ | 02-information.tex:650 | §5 命题入口 | 角信息界不适用 |
| $s_{\min}$ | $D\log L$ | 02-information.tex:645 | §5 分离地板 | 对数地板失守 |
| 逐层加厚不变量 | $I_\Omega(\Lambda\cap A_j^{+a's}:\Lambda\cap E^{+a's})\le L^{-p}$ | 02-information.tex:693 | §5 归纳 | 累积误差回归 |
| 复位宽度上限 | $w(s)\le C_3(1+\log s)^{K}+C_4\log L$ | 02-information.tex:747 | §5 与 $c_*s$ 赛跑 | 归纳收尾崩 |
| $D$ 选择 | $D\ge 4C_4/c_*$ | 02-information.tex:754 | §5 收尾 | 复位宽度大于尺度 |
| 补丁精度 | $\lVert(\mathrm{id}-P)\Omega\rVert\le L^{-p}$ | 03-patches.tex:32 | §6 命题结论 | §7 编码器 $\varepsilon$ 失去来源 |
| 圆柱总秩 | $\sum_jd_j\le CL^{c}$ | 03-patches.tex:42 | §6 命题、§7 编码 | 键维上界崩 |
| 变半径列 | $u\le r_1\le\dots\le r_m\le 2u$ | 03-patches.tex:34 | §6 嵌套几何 | 半径自由消失、§2 错路复发 |
| 滤波器 | $L_j=(x_j+b\,\mathrm{id})^{-a_j/2}$ | 03-patches.tex:76 | §6 变分 | 极小点驻方失效 |
| 基本界 | $(1+b)^{-\kappa/2}\le\lVert M(R,x)\Omega\rVert\le b^{-\kappa/2}$ | 03-patches.tex:85 | §6 增长积分 | 起始值不可控 |
| 降序对易 | $[L_j,\rho_j]=[x_j,\rho_j]=0$ | 03-patches.tex:119 | §6 剥壳顺序 | 非对易处理崩 |
| KKT 单边 | $p_i/b\le\lambda$（$x_i=0$ 时） | 03-patches.tex:186 | §6 零坐标 | $\lambda$ 不定 |
| 交叉唯一 | 近邻 $h$ 至多跨一个 $X_j$ | 03-patches.tex:224 | §6 计数 | $16u+4$ 上界失效 |
| 行列配对 | $\sum_{i,k}(p_i+p_k)\lvert A_{ik}B_{ik}\rvert\le 2\lVert A\rVert\lVert B\rVert$ | 03-patches.tex:302 | §6 能量、§7 大空间求和 | 施密特秩因子进入界 |
| 单项能量误差 | $\le q^{2}J a_j^{2}$ | 03-patches.tex:319 | §6 能量和 | $36q^{2}J\kappa^{2}$ 失去来源 |
| 能量总界 | $\le 36q^{2}J\kappa^{2}$ | 03-patches.tex:331 | §6 $\kappa$ 定死 | 与隙赛跑失控 |
| $\kappa$ 选择 | $\le\min\{1/2,\sqrt{\Delta/(1024C_E)}\}$ | 03-patches.tex:341 | §6 拉回 | 迹距 $1/16$ 破 |
| $Q_j$ 尾秩 | $\mathrm{rank}\,Q_j\le e^{C_Q(1+u)}$ | 03-patches.tex:373 | §6 调节器 | 增长率 $\kappa/8$ 崩 |
| 全尾范数 | $\le N(R)(2b)^{\kappa/2}$ | 03-patches.tex:532 | §6 反向 | 半径 $\le L^{R_0}$ 崩 |
| $R_0$ | $\frac{4}{3}[C_0(B_0+1/\log2)+1+2p/\kappa]$ | 03-patches.tex:542 | §6 距离与维数 | 全尾不衰减 |
| 正交化 | $\widetilde S_j=(\mathrm{id}-P_{W_j})S_j$ | 03-patches.tex:577 | §6 直和 | 秩升、恒等断 |
| 总秩上界 | $\sum_jd_j\le CL^{R_0+1}$ | 03-patches.tex:597 | §6、§7 | 键维多项式失 |
| 帧精度 | $\varepsilon=L^{-60}$ | 05-frames.tex:24 | §7 编码器 | 后续 $L^{-30}$ 全线崩 |
| 内方半径 | $\lvert x-c\rvert_\infty\le h$ | 05-frames.tex:28 | §7 编码 | 内嵌样本失去 |
| 编码器恒等 | $K_{c,h}^{\dagger}K_{c,h}=P_{c,h}$ | 05-frames.tex:63 | §7、§9 | 收缩恒等断 |
| 帧范数下界 | $1-r\varepsilon\le\lVert\Omega_{\mathcal F}\rVert\le1$ | 05-frames.tex:91 | §7、§10 Xi | 保留范数不接近 1 |
| 整组核范数 | 任何整组二分 $\lVert AB^{\mathsf T}\rVert_1\le1$ | 05-frames.tex:161 | §7 大空间求和军规 | 尾截维数进入界 |
| 整组截断 | $\lVert Z-Z_k\rVert\le g/\sqrt k$ | 05-frames.tex:137 | §7 分支误差 | $k^{g}$ 项数无界 |
| 典范收缩 | $M=K_{\mathrm{new}}P_m\cdots P_1K_{\mathrm{old}}^{\dagger}$ | 05-frames.tex:228 | §7 小补丁重写 | 换主无实现 |
| 重写误差 | $\le(m+r_{\mathrm{old}})\varepsilon$ | 05-frames.tex:211 | §7、§9 | 累积进 $L^{-20}$ 破 |
| 分裂等距 | $\lVert(\mathrm{id}_{TE}\otimes V)\Omega-s\otimes s'\rVert\le\sqrt b$ | 05-frames.tex:363 | §7 换主燃料 | 同质生死无解 |
| 分裂 $b$ 上限 | $b\le L^{-60}$ | 05-frames.tex:367 | §7 输入 | $L^{-30}$ 兑现不了 |
| 双薄交换误差 | $\le 4L^{-30}$ | 05-frames.tex:476 | §7、§9 边词 | 七带词失去燃料 |
| 交织恒等 | $\mathcal RK_{\mathrm{in}}=K_{\mathrm{out}}F_{Y\cap\Lambda}$ | 05-frames.tex:493 | §7 换薄 | 改名与换薄解耦失败 |
| 缓冲修正 | $D_U=(V^{\otimes2})^{\dagger}F_{\mathcal B_T}V^{\otimes2}$ | 05-frames.tex:505 | §7 私有 | 隐私性破 |
| 次序不可反 | 先 $F_A$ 后 $D_U$ | 05-frames.tex:514 | §7 交换 | 净效应公式崩 |
| 压缩参与界 | 每方一生非私有门 $\le b$ | 04-compression.tex:140 | §8、§13 解耦 | 展开代价超多项式 |
| 效应消除 | $\lVert\widetilde G_m-G\otimes\lvert\Gamma_m\rangle\rVert\le r m^{-1/2}\sum_{\xi}\lvert c_{\xi}\rvert$ | 04-compression.tex:61 | §8 源-only | 归一化对偶不可采样 |
| 单效应误差 | $=m^{-1/2}$ | 04-compression.tex:91 | §8 | 分支门面失效 |
| 垃圾栈 | $\Gamma_m=\bigotimes_o\eta_o^{\otimes m}$ | 04-compression.tex:110 | §8 比较 | telescoping 无从加总 |
| $\delta$ 选择 | $\epsilon/(8M)$ | 04-compression.tex:202 | §8 次序 | $m$ 自指 |
| 源-only 密度差 | $\lVert\rho'-\rho\rVert_1\le\epsilon/2$ | 04-compression.tex:226 | §8 | 采样端 $\epsilon/4$ 不够 |
| 源门写法 | $G_g=\sum_{\xi}c_{g,\xi}(\bigotimes_P B_{g,P,\xi})[\bigotimes_e\lvert\eta_{g,e,\xi}\rangle\otimes\mathrm{id}_{\mathrm{in}}]$ | 04-compression.tex:235 | §8 | 分支维数进入界 |
| 公共半空间 | $\mathcal H_{g,P,e}=\bigoplus_{\xi}\mathcal H_{g,P,e,\xi}$ | 04-compression.tex:258 | §8 | 槽维数依赖 $\xi$ |
| 高斯采样 | $U_j=\sum_{a,c}(\lambda_a\mu_c)^{1/4}g_{ac}^{(j)}\lvert u_a\rangle\langle\widetilde u_c\rvert$ | 04-compression.tex:294 | §8 无偏 | 期望不再等于源 |
| Isserlis 协方差 | $\mathbb E[z_{il}\overline{z_{i'l'}}]=k^{-s}\sqrt{p_i\widetilde p_l}\,\delta_{ii'}\delta_{ll'}$ | 04-compression.tex:404 | §8 二矩 | 独立性前提失 |
| 修正位置展开 | $\widehat\rho-\rho'=\sum_{\varnothing\ne S}F_S$ | 04-compression.tex:349 | §8 展开 | 全门展开、指数代价 |
| 端点方集合 | $\lvert\mathcal A\rvert\le 2s$ | 04-compression.tex:358 | §8 | 只展 $2bs$ 门失败 |
| 加权代价 | $Q(L)^{s}$（$Q=B^{4b}d^{4}$） | 04-compression.tex:367 | §8 逐 $S$ 和 | 超多项式 |
| 合并映射范数 | $\lVert O\rVert\le1$ | 04-compression.tex:440 | §8 二矩 | Hölder 尾失去 |
| 外部收缩 | $\lVert\mathrm{Tr}_{\mathrm{garbage}}(KZ\widetilde K^{\dagger})\rVert_1\le\lVert Z\rVert_1$ | 04-compression.tex:454 | §8 | 矩形不 Hermite 也需用 |
| 二矩重组成 | $\lVert\widetilde R^{1/4}OR^{1/4}\rVert_2^{2}$ | 04-compression.tex:517 | §8 | Hölder 无锚 |
| 维数无关界 | $\lVert\widetilde R^{1/4}OR^{1/4}\rVert_2\le1$ | 04-compression.tex:525 | §8 | 私有维数回归 |
| 单选择均值 | $\mathbb E\lVert Z\rVert_1\le k^{-s/2}$ | 04-compression.tex:532 | §8 | 采样无收益 |
| 总误差 | $\le(1+Q(L)/\sqrt k)^{N}-1$ | 04-compression.tex:549 | §8 收尾 | $e^{\epsilon/8}-1$ 崩 |
| $k$ 选择 | $Q(L)/\sqrt k\le\epsilon/(8N)$ | 04-compression.tex:555 | §8 样本数 | 多项式 $k$ 破 |
| 星边与样本边 | 每门 $\le b-1$ 条星、$\binom{b}{2}$ 条样本 | 04-compression.tex:581 | §8 网络度 | 入射度有界失 |
| 每方非私有门 | $\le b$ | 04-compression.tex:582 | §8 每方入射 | 网络度爆 |
| 绝对误差入账 | 保留范数接近 1 时 | 04-compression.tex:607 | §10 第一拍 | Xi 下界兑现不了 |
| 协议改动数 | $\le CL^{3}$ | 06-geometry.tex:25 | §9 预算、§10 累乘 | 误差累加爆 |
| 每步参考向量差 | $\le CL^{-20}$ | 06-geometry.tex:42 | §10 telescoping | $CL^{-17}$ 崩 |
| 每方物理维数 | 至多 $q$ | 06-geometry.tex:51 | §8 假设四 | 输出维数上界失 |
| 占位符不接力 | 每次重绘换一位临时额外方 | 06-geometry.tex:94 | §12 占位符越界坑 | 每方参与次数失 |
| 占位符不持主线 | 从不持主线原始寄存器 | 06-geometry.tex:96 | §12 契约 | 换主语义破 |
| 楔形宽度 | $w(s)=10^{-3}\min(s,n-s)$ | 06-geometry.tex:147 | §9 条带设计、§5 分离 | 角度界假设不匹配 |
| 七带词 | $C\mid B\mid A\mid C\mid A\mid B\mid C$ | 06-geometry.tex:193 | §9 边处理 | 五带失败、辅助薄造不出缓冲 |
| 透镜 | $Y=\{0<s<n:-7<x<-7/2\}$ | 06-geometry.tex:201 | §9 交换 | 双薄交换引理不适用 |
| 邻边互斥 | $r_1<0.008r_2$ 与 $r_2<0.008r_1$ 矛盾 | 06-geometry.tex:234 | §9 边互不干扰 | 下一条边的法向词被污染 |
| 角分离 | $\mathrm{dist}(y,\overline{\{f\ne P_{\circ}\}})\ge a_0\min\{n,d_{\mathcal V}(y)\}$ | 06-geometry.tex:260 | §9 假设验证 | §5 输入不成立 |
| 点处理地板 | $a_1\max\{t,\min(n,d_{\mathcal V}(y))\}$ | 06-geometry.tex:367 | §9 均质化 | 复位假设破 |
| Lipschitz 传递 | $\mathrm{dist}(x,\partial Y)\ge\frac{1}{2}a_*Q_x$ | 06-geometry.tex:412 | §9 选中半径同一侧 | 双薄交换搬整洞不成立 |
| 常数次序 | 模板、$K_0$、$\epsilon_0$、$\nu$、$a$、$D$、$B_0$ | 06-geometry.tex:559 | §10 收尾 | 循环依赖 |
| 主线标签不变量 | 层中只 $2n$ 与 $n$ 加占位符 | 06-geometry.tex:601 | §9 寿命 | 每方一生参与次数 $O(L^2)$ |
| 冻结辅助不制造入射 | 用一次、点处理回收、永久退役 | 06-geometry.tex:621 | §13 解耦红利 | 网络度爆 |
| 改动总数实际 | $O(L^{2})$ | 06-geometry.tex:652 | §9 预算余量 | 级联预算变紧 |
| Xi 下界 | $\ge 1-CL^{3-60}$ | 06-geometry.tex:678 | §8 绝对入账 | 保留范数失 |
| 协议幂 | $60$ | 07-assembly.tex:11 | §11 级联起点 | 全线失 |
| Xi 范数 | $\ge 1-CL^{-57}$ | 07-assembly.tex:24 | §8 绝对入账、§11 级联 | 保留范数失去余量 |
| 实际终向量差 | $\lVert\Psi-\Omega\otimes\Xi\rVert\le CL^{-17}$ | 07-assembly.tex:39 | §10 密度端 | $CL^{-10}$ 崩 |
| 协议密度差 | $\le CL^{-10}$ | 07-assembly.tex:48 | §10 第二拍 | $L^{-5}$ 失去输入 |
| 压缩密度差 | $\lVert\sigma-\lvert\Omega\rangle\langle\Omega\rVert_1\le CL^{-5}$ | 07-assembly.tex:59 | §10 列提取 | $\eta<1$ 破 |
| 列提取 | $\min_\theta\lVert v/\lVert v\rVert-e^{i\theta}\Omega\rVert\le 2\eta$ | 07-assembly.tex:74 | §10 终点 | $L^{-1}$ 失 |
| 列提取均值 | $\sum_z\lVert E\lvert z\rangle\rVert^{2}=\lVert E\rVert_2^{2}\le\eta^{2}$ | 07-assembly.tex:83 | §12 正性坑 | 无下界挑列失败 |
| 折叠映射 | $f(x)=x$（$x<L$），$2(L-1)-x$（其余） | 07-assembly.tex:151 | §10 路由 | 拥堵乘 4 破 |
| 键维终式 | $D_e\le(C_1L^{r})^{\chi}$ | 07-assembly.tex:171 | §0 主张 | 多项式键维失 |
| 抽象误差 | 归一化后 $\le L^{-1}$ | main.tex:47 | §0 主张 | 主定理变空 |
| 唯一谱假设 | 整谱隙 $\Delta$ | main.tex:47 | §0 主张、§6 拉回 | 二维截断全线失 |
