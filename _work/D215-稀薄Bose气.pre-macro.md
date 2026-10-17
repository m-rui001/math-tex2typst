# D215 固定势固定密度下稀薄 Bose 气体的均匀凝聚下限：我的思路复盘

这份笔记记录我围绕论文《A density-uniform condensate bound for dilute Bose gases》做研究时真实的思维链条。写法上我强迫自己按时间顺序走一遍：先承认最初想错了什么，再写转折点在哪一次推导里被逼出来，最后才写现在这条路线。凡是我手头材料撑不住的判断，我都标 `[推测]` 并写清缺口在哪。正文素材全部来自该论文 build 目录下的 `.tex` 文件，行号引用以 `build/` 为根。

## §0 登记与取材范围

本节先把登记做掉。派单编号 D215，任务是把「稀薄 Bose 气体的密度均匀凝聚下限」这一篇非 Lean 队列论文的反推笔记写完整。我的取材目录与队列行号如下两行，逐字登记：

preprints/A-density-uniform-condensate-bound-for-dilute-Bose-gases-September-27-2026

其他队列第 39 行号

允许引用的文件只有 `build/main.tex`（61 行）、`build/sections/` 下 introduction、history、setup、energy、localization、slab、atypical、defects、geometry、opening、comparison、conclusion 共 12 个 `.tex`，以及 `build/figures/endpoint-changes.tex`。`typst/` 分片与 `README.md` 一律不作正文来源。全文合计 148,243 字节，属于厚素材档，我按主干章节分段读，没有整篇顺序硬啃。定理编号我沿用 `.tex` 里的 `(1)` 到 `(34)` 式号，交叉引用时直接写式号，免得我自己重新编号之后前后对不上。

## §1 初始动机：我为什么盯住「固定势 + 固定密度」

我最开始的目标很朴素：想知道一个真正的多体事实，凝聚在数学上到底能不能在「物理相互作用不随粒子数改标度」的前提下站住。具体说，势 $v:\R^3\to[0,\infty)$ 有界、可测、径向、有限力程、几乎处处非零，这些都是硬约束；哈密顿量取 torus $\Lambda_L$ 上的周期化 $v_L$（见 introduction.tex:10-18）。密度 $\rho$ 与 $v$ 同时固定，再让 $L\to\infty$。我想要的是一个数 $c_*(v)>0$，使得只要 $0<\rho<\rho_*(v)$、$0\le T\le\rho^2$，常轨道占据份额 $\langle u_0,\gamma^{(1)}u_0\rangle/N$ 就有统一下界（main.tex:39-46 的摘要和 theorem 环境的原话）。

为什么这个组合值得单独做？我当时给自己讲的理由是：已知的强结论各自都让一个自由度溜走了。Gross--Pitaevskii 那一系让相互作用标度跟着 $N$ 跑；热力学能量渐近那一系只控能量，不控单个轨道占据（history.tex:28-38 与 57-71 分别记录了这两条线）。Sütő 的两步法处理的是真正的热力学极限，可它要求势的 Fourier 变换也非负，再加可积性与力矩条件（history.tex:73-82），这条限制我第一次看到就觉得不舒服：一个非负的球方势垒，它的 Fourier 变换会变号，于是 Sütő 的条件把这类最朴素的势排除在外。我想要的定理覆盖所有非负有界径向有限力程势，一个都不挑。温度窗口 $T\le\rho^2$ 是我后来才想明白该怎么选的，一开始我甚至不确定要不要把 $T$ 和 $\rho$ 耦合起来。

这里还有一个我特意不想含糊的点：零温态的唯一性。我要求定理陈述里连这个都闭合，所以正有限体积热核的保正性必须进来（introduction.tex:44-47 末尾那句「如证明末尾所示」指的就是 conclusion.tex:51-61 那一段）。这类小地方如果留着，整篇证明在别人手里就不算完整。

## §2 第一条错误路线：把 GP 极限 machinery 直接搬过来

我的第一反应是搬现成的。Lieb--Seiringer 证明了 GP 极限下完整凝聚（history.tex:29-31），Deuchert--Seiringer 处理了正温度均匀气体、散射长度取 $a_N=a_vL/N$，并控制了近似 Gibbs 极小化子的一粒子密度矩阵（history.tex:32-36）。再往后，Brennecke、Brooks、Caraci、Oldenburg 把基态完整凝聚推到 GP 区制之外（history.tex:42-44），Fournais 在增长盒子上做了联合稀释与体积极限（history.tex:45-46），Chong、Liang、Nam 用动能局加 Poincaré 型不等式给了更简洁的低能凝聚证明（history.tex:47-49），Junge 的低温正则 Gibbs 结果用 Neumann 盒、盒子尺寸与稀释极限耦合（history.tex:53-55）。

我在这一系结果上花了不少时间，失败得也很干脆。核心障碍是标度。对单位盒相互作用 $N^{2-2\kappa}v(N^{1-\kappa}x)$ 做回标度，固定势对应的密度是 $N^{3\kappa-2}$；想让密度固定，就得 $\kappa=2/3$，$\kappa<2/3$ 的那些区间把「稀释」与「粒子数增加」焊在一起（history.tex:50-53）。也就是说，这一系定理在密度趋零时势的强度也在变，它们给的下限是「跟着标度走的下限」，把我想要的固定 $c_*(v)$ 直接偷换了。我把 Fournais 定理与 Chong--Liang--Nam 的陈述逐条对照过，试图固定 $v$ 再取 $N$，结论是它们的前提根本不覆盖我的参数化。Junge 那篇的盒子尺寸耦合同样是结构性障碍：我要在每个固定 $\rho$ 处先取 $L\to\infty$，体积阈值可以依赖 $\rho$，凝聚常数绝不能。

`[推测]` 这一段失败过程论文里没有自述，上面的障碍分析是我从 history.tex 第 28-56 行的对比性陈述加上我自己的验算重建的；论文能证实的只有「这条线与本问题不同」这一层，具体我绕了几天无从考。

## §3 第二条错误路线：用能量渐近逼占据数

第二条路我押在能量上。想法很自然：若基态能量足够低，粒子就必须大量待动能小的轨道上，而动能间隙又给出占据集中度。工具箱里有 Dyson 硬球下界和 Lieb--Yngvason 的首阶稀薄渐近（history.tex:57-59），Lee--Huang--Yang 假势预言次阶修正，Fournais--Solovej 证明了对应的下界（history.tex:60-64），Basti 等人的上界达到同一系数（history.tex:64-67）。

这条路我推进到引理一步就撞墙。撞墙点其实论文自己也写透了：一粒子动能间隙随体积增大趋于零（history.tex:69-71）。能量渐近告诉你 $E/N\approx 4\pi a\rho$，它对「粒子在动量壳层间的分布」施加的约束是弱的：你可以把几乎同样的能量摊到很多个低动量模式上，让单个模式占据份额趋零。想从总能量读出一个模式的宏观占据，需要额外知道「集中」这件事本身，而这正是我要证的结论，循环了。我试过加熵约束、试过把 Fournais--Solovej 的凝聚核分解拿来直接读占据分布，都不行；能量方法给出的信息密度对这个问题不够。

这次失败留下一个真正有用的印象：可用的量必须是「正测度层面的比较」，即不依赖基态波函数结构、只依赖 Feynman--Kac 权重正性的东西。能量不等式当然还会用到，但只能用来说「某类坏事件概率小」，不能直接用来推占据。后来整个框架就是这个直觉的展开：主不等式长什么样，早在 introduction.tex:52-63 的「How the comparison works」小节里定死了，构造质量至少 $a>0$ 的测度 $\nu$，令 $f=\dd\nu/\dd\mu$ 二阶矩有界，Cauchy--Schwarz 给出 $a^2\le q_0\int f^2\dd\mu$，于是 $q_0\ge a^2/\int f^2\dd\mu$。从此刻起我的全部工作就是让 $\nu$ 存在且 $f$ 的二阶矩对 $\rho$ 一致有界。

本笔记初稿到这就近停顿一下，先把已写段落核对一遍再续写。

## §4 第一个真正的转折点：整个问题换成两个正测度的比较

从前两节的碰撞里挤出来的推进，是把「证明占据」改写成「构造一次测度变换」。我把这个转折完整写下来，因为它决定了后面所有章节的形状。

起点是 Feynman--Kac 的正性。正则配分函数写成闭路径族上的正权积分， symmetrizer 恰好进一次 trace 核：$k_T^{\mathrm{sym}}(X,Y)=\frac1{N!}\sum_\pi k_T(X,\pi Y)$，$Z_N=\int k_\beta^{\mathrm{sym}}(X,X)\dd X$，对标记坐标积分时不再带任何阶乘因子（setup.tex:14-19）。$q_0=\langle u_0,\gamma^{(1)}u_0\rangle/N$ 在 trace 里等于「把 $|u_0\rangle\langle u_0|$ 插入两个核之间再归一」，把它摊到 $N$ 个槽位上、每个槽位配 $1/N$，再把某个内端点换成独立积分点 $z$（$dz/V$），就得到一个总质量恰为 $q_0$ 的有限测度 $\mu$（opening.tex:9-17）。这里我核对过：dummy 点 $x$ 均匀落在 $Y_{i_0}$ 所在格内，添它不改变质量（opening.tex:16-17）。

反方向的构造是 $\nu$：在闭配置上选一对相距远的格 $(a,b)$，抽骨架、绕开不可用格、从结果简单路径的每格里挑一个合格槽位、循环重排它们的起点、把 $i_0$ 的内端开成 $z$、被选桥按精确归一化的相互作用条件律重采样。$\nu$ 的质量是底座接受概率，至少 $\upsilon/2$（opening.tex:46-49 与 104-106）。于是 $f=\dd\nu/\dd\mu$ 存在，问题塌缩成一句：证明 $\int f^2\dd\mu$ 对 $\rho,L,N,T$ 一致有界（comparison.tex:7-16 的命题陈述）。$q_0\ge(\upsilon/2)^2/C_v$ 就是全部。

为什么改动只发生在一块短的虚时间板里：取 $\delta=s^2$，小密度下 $\beta>2\delta$，因为 $\delta\le4K^2\rho^{-1}$ 而 $\beta\ge\rho^{-2}$（slab.tex:4-7）。板长相对 $1/T$ 始终可忽略（introduction.tex:70-72），板外核 $F(Y,S)=e^{-(\beta-\delta)H}P_{\mathrm{sym}}$ 的非负与置换不变性让我一次都不碰（slab.tex:8-13）。闭板测度 $P_{\mathrm{cl}}$ 写作式 (14)（slab.tex:20-23），规范置换与一粒子归一约定对齐 Ueltschi 附录 (A.1)、(A.8)-(A.10)、(A.12)-(A.18)（slab.tex:27-33）。

蓝图我按 introduction.tex:67-115 复述成一句话一串：边长 $s$ 的格、短端间隔离尺度 $r=\zeta\rho^{-1/3}$、合格粒子与可用格的双层测试（introduction.tex:76-86）、格路径骨架及其碰撞指数矩（introduction.tex:88-93）、绕行与起点循环重排（introduction.tex:94-97）、反向插入给二阶矩提供远端相消的底座（introduction.tex:99-107）、反向构型里用更严的格测试保住选择权重（introduction.tex:108-115）。这份蓝图后来每一块都比我想的难，下面逐块记账。

## §5 尺度与簿记：$s$、$r$、$m$、$\delta$ 和 torus 桥的提升约定

尺度是我在动手前必须先钉死的东西，因为几乎每条不等式的常数都声明「只依赖 $v$ 和已固定的截断，绝不依赖 $\rho,L,N,T$」（setup.tex:24-26）。格网取 $\mathcal G=(\Z/n\Z)^3$，$n=\lfloor L/(K\rho^{-1/2})\rfloor$，于是 $s\in[K\rho^{-1/2},2K\rho^{-1/2}]$，$M=n^3$，$m=N/M$ 满足 $\rho s^3/2\le m\le2\rho s^3$（setup.tex:28-34）。关键的双尺度分离：$s\asymp\rho^{-1/2}$ 让每格平均粒子数 $m\asymp\rho^{-1/2}\to\infty$（localization.tex:4-6），而更短的 $r=\zeta\rho^{-1/3}$ 只管端点间隔；$r/s\to0$ 且 $2r<\delta$（slab.tex:46-49）。密度带的选取 $\rho/2\le N/V\le2\rho$ 与 $\beta=T^{-1}$ 都在 setup.tex:21-22。

邻域簿记：并集 $U$ 含 $u$ 格，$|U|=us^3$，半径 $hs$ 邻域至多被 $C(h+2)^3u$ 格覆盖，torus 上也成立（setup.tex:36）。这条我后来发现出现在至少六处证明的常数堆里，属于「先证一次、到处报销」的类型。

torus 桥的提升约定是簿记里最阴的一处。定义：固定终点的代表元，把起点按所有方式提升，给每个提升配位移 $d_\ell$，权重 $k(d_\ell)=(4\pi\delta)^{-3/2}e^{-|d_\ell|^2/(4\delta)}$ 乘以生成元 $\Delta$ 的欧氏桥投影回 torus 的律，再对 $\ell\in\Z^3$ 求和（slab.tex:35-43）。所有「沿路径附近」的测试都读这个提升，路径逐点最近代表元不作数。这样定的好处在 slab.tex:81-83 兑现：$L$ 相对 $Rs$ 足够大时，$\mathrm{cut}_R$ 只放行最近提升，桥的比较从此在欧氏空间里做，周期性只在拒绝端出现。势的代表元也要挑处处非负、力程球外为零的 Borel 径向版本；零测集改动不动算子也不动路径积分，因为内时相对位置有密度（setup.tex:5-12）。$v$ 在 torus 公式里代指周期化 $v_L$，无穷空间范数永远读原势（setup.tex:10-12）。我在第一遍读到这里时以为这是可有可无的严谨，后来在 §8 的压缩不等式里才看清：没有提升约定，bin 分解的「绕环类互斥」就没法陈述。

## §6 能量层：占据代价、熵与加粒子的自由能增量

这一节是我保留能量方法的正确姿势：只用它给「坏事件」标价。三块基石全在 energy.tex。

第一块是 Neumann 格引理（energy.tex:18-35）。结论：边长 $b\ge b_0$ 的立方体 $Q$ 内，$\int_Q(|\nabla f|^2+v(x-y)|f|^2)\ge c_vb^{-3}\int_Q|f|^2$，即式 (1)；推出算子下界 $c_vb^{-3}\sum_Qn_Q\mathbf1_{\{n_Q\ge2\}}$，即式 (2)，同格两个粒子就必须付 $b^{-3}$ 量级的动能加势。证明里我拍案的是那个八分球技巧：取 $\nu>0$ 使 $A=\{x:v(x)\ge\nu\}$ 正测度，$b_0/2>R_v$，对每个 $y\in Q$ 在三个坐标方向独立选朝向，得到 $y+A$ 的八分球 $A_y\subset Q$，由径向对称其测度 $|A|/8=:a_v>0$（energy.tex:38-43）。再上尺度不变的 Sobolev--Poincaré，$\|f-f_0\|_6\le C\|\nabla f\|_2$，把 $|f_0|^2$ 夹在势能与动能之间（energy.tex:44-53）。配对时用 Neumann bracketing：按格切割构型空间、丢掉跨格相互作用、格内两两配对，$\lfloor j/2\rfloor\ge j/3$（energy.tex:55-66）。注意它把「势不恒为零」用成了「某个水平集正测度」，这是假设里非零条件的全部兑现处。

第二块是熵界式 (3)：$\alpha\operatorname{Tr}(\sum_i-\Delta_i)\sigma-TS(\sigma)\ge-Tj-C_\alpha T|\Omega|(V^{-1}+T^{3/2})$（energy.tex:69-79）。证明走周期热核对角 $K_t(0)\le C(V^{-1}+t^{-3/2})$、 Dirichlet  killing 只减对角、逸度 $e^{-1}$ 的理想 Bose 大配分函数、Gibbs 变分不等式（energy.tex:81-102）。$T^{3/2}$ 项后面被 $T\le\rho^2$ 碾死。

第三块是命题「粒子数自由能界」（energy.tex:104-179），我的主力：式 (4) $F_N\ge c_v\rho N$，式 (5) $F_{N+k}\ge F_N+c_v\rho k$，式 (6) $F_j^{(-W)}-F_{j-1}^{(-W)}\le C_v\rho$ 对任意有界 $W\ge0$ 一致。(4) 用边长 $(4/\rho)^{1/3}$ 的格切分，格数 $\le N/2$，式 (2) 给出 $\ge c_v\rho N$，熵损失除以 $\rho N$ 逐项趋零：$T/\rho\le\rho$、$VT^{5/2}/(\rho N)\le2\rho^3$（energy.tex:119-131）。$F_j/j$ 单调我用强次可加证的：对称态的边距熵序列 $S_i$ 凹，单粒子能不变、对能系数从 $(j-1)/2$ 降到 $(j-2)/2$ 且非负，得 $F_j/j\ge F_{j-1}/(j-1)$（energy.tex:132-150），引 Lieb--Ruskai 的定理 2（energy.tex:135-136）。(6) 是全文我最欣赏的一手：干脆在 symmetrized Feynman--Kac 里只留「新标签为不动点」的置换，$(j-1)!$ 对 $1/j!$ 归一，新粒子是一条自由 torus 环，归一后每个时刻均匀独立于旧轨，期望总相互作用 $\beta(j-1)\|v\|_1/V$，Jensen 给 $Z_j^{(-W)}\ge\frac{VK_\beta(0)}je^{-\beta(j-1)\|v\|_1/V}Z_{j-1}^{(-W)}$，再用 $K_\beta(0)\ge(4\pi\beta)^{-3/2}$ 和对 $t\log(C\rho t^{-3/2})$ 在 $t\le\rho^2$ 上求导定端点（energy.tex:157-178）。$W\ge0$ 让外势权重 $\ge1$，这就是「对吸引外场一致」的来源，我一开始完全没预料到加粒子的上界可以免掉对 $W$ 的一切控制。

至此能量层备齐。下面进入用 tilting 把这些自由能代价兑换成概率尾的机械。

## §7 定位层：双色分解、对角 tilting 与三类尾

localization.tex 的架构我要先膜拜一下它的统一性：所有尾估计都从同一个变分比较里拧出来。下界一侧，几何定位给倾斜态自由能代价的下控；上界一侧，对角 tilting 给同一代价上控于梯度误差加倾斜的归一化；两边夹住 $\log$ 指数矩的导数（localization.tex:9-16）。

两块引擎写在 lemma「Two-color localization and diagonal tilting」里。第一块式 (7)：$p^2+q^2=1$、乘法把一粒子形式域送进 $H^1_0(\Omega)$ 时，任意有限能对称态满足 $\mathcal F^{(-W)}(\sigma)+\operatorname{Tr}n_{|\nabla p|^2+|\nabla q|^2}\sigma\ge\sum_jw_j[\mathcal F^{(-W)}(\sigma_{\mathrm{in},j})+\mathcal F^{(-W)}(\sigma_{\mathrm{out},j})]-TH(w)$（localization.tex:18-36）。证明用一粒子等距 $f\mapsto(pf,qf)$ 的对称张量幂，按第一色数去相位，$j$ 扇区单位等价于 $\operatorname{Sym}^jL^2(\Omega)\otimes\operatorname{Sym}^{J-j}L^2(\Lambda_L)$，并且反复强调「没有额外的多重度或二项熵项」（localization.tex:56-63）；产品法则 $p\nabla p+q\nabla q=0$ 精确给出动能误差。几何定位加熵分解的源头是 Deuchert--Seiringer--Yngvason 第 3 节引理 3.1（localization.tex:50-53），但固定色数扇区的分解是他们没写的。第二块式 (8)：对平衡态做 $g=e^G$ 对角倾斜，$\mathcal F(\sigma)-F_N\le\mathbb E_g\sum_i|\nabla_iG|^2+T(2\mathbb E_gG-\log M_G)$（localization.tex:37-48）。证明走 $\tau=\Gamma^{1/2}g^2\Gamma^{1/2}/M_G$ 与 $\sigma$ 同非零谱（$B^*B$ 与 $BB^*$）、本征方程用 $g^2\psi$ 试出形式恒等式、再用有限分割逼近加相对熵在丢经典标签下的单调性收 $D(\tau\Vert\Gamma)\le2\mathbb E_gG-\log M_G$（localization.tex:78-109），Lieb--Ruskai 推论 (3.2) 在此第二次报销。

有了引擎，三层尾依次出炉。密度界式 (9) 到 (11)：$\phi_U(x)=e^{-d(x,U)/s}$，取 $D_0=H_0\rho$，得 $\mathcal F^{(-W)}(\sigma)-F_J^{(-W)}\ge(c_vD_0-C_v\rho-Cs^{-2})\mathbb E_\sigma n_{\phi_U}-C_vD_0^2|U|$，平衡态里 $\mathbb En_U\le C_v\rho|U|$，位置律里 $\log\mathbb E_Pe^{2\lambda n_{\phi_U}}\le C_v\lambda\rho|U|$（localization.tex:116-138）。技巧是把掩蔽层 $p_h$ 用余弦插值在 $[hs,(h+1)s]$ 上摊开，再按密度 $e^{-h}\dd h$ 对 $h$ 平均，使 $\int p_h^2e^{-h}\dd h\ge\phi_U$ 且梯度代价压成 $Cs^{-2}\phi_U$（localization.tex:142-173）。$\mathbb En_Q^2\le Cm^2$ 由指数 Markov 加 $2tP(n_Q>t)$ 积分得（localization.tex:188-192），这个二阶矩后面在转移引理里是命根子。

占据双侧尾式 (12)：存在 $0<b_-<1/4$、$b_+>4$，使任意指定 $u$ 格并集 $U$ 上「每格计数 $<2b_-m$」或「每格计数 $>b_+m/2$」的概率都 $\le Ce^{-cmu}$（localization.tex:200-210）。下侧的证明我先卡了很久：它要在每格中心 $s/4$ 半宽小方上放一个归一光滑 bump，等幅叠加成轨道 $\varphi$，$\|\varphi\|_\infty^2\le C/|U|$，然后用 $\psi\mapsto\binom{N-j+k}{k}^{1/2}P_{\mathrm{sym}}(\psi\otimes\varphi^{\otimes k})$ 往格外态里加 $k=\lfloor\eta\rho|U|\rfloor$ 个粒子，新标签赋值支撑互斥所以是等距，旧新支撑相距大于 $R_v$ 所以相互作用为零（localization.tex:218-244）。自由能一侧接式 (5) 下界、式 (6) 退回去 $j$ 步，$\eta$ 小、$K$ 大依次吃掉 $C_vk^2/|U|$ 与 $Ck/s^2$。最后对 $G=-\lambda n_\phi$ 解微分不等式：$f'(\lambda)=2\mathbb E_gn_\phi\ge c_v''\rho|U|$ 在 $f\le a\rho|U|$ 期间成立，从 $f(0)=0$ 推出 $f(1)\ge a\rho|U|$，即 $\mathbb Ee^{-2n_\phi}\le e^{-a\rho|U|}$（localization.tex:264-278）。我第一遍读这段以为循环使用了待证的下界，停下来写了三页验算才发现 $F_{N-j+k}$ 的下界走的是加粒子方向、与待估概率无涉。

隔离尾式 (13)：$r=\zeta\rho^{-1/3}$、$\lambda_0=r\sqrt\rho$，非隔离粒子数 $\ge k'$ 的概率 $\le\exp\{C_v\lambda_0\zeta^3\rho|S|-\lambda_0k'\}$（localization.tex:293-305）。 machinery 是把 $Q=\sum_\chi(n_\chi-1)_+$ 当计数器：非隔离粒子在 fine 立方体里有伙伴，$a\le2(n_\chi-1)_+$ 逐点成立；立方体可着色使同色互不相邻，把式 (9) 的证明里预留的一份 (2) 型能量按颜色分账（localization.tex:321-334）。$\zeta$ 在命题里最后才选小，所以这里的常数允许独立于 $\zeta$ 递减（localization.tex:302-304），这条「常数对 $\zeta$ 的无依赖」我起初以为是客套话，§9 里它决定五类失败的账能不能并拢。

## §8 轨迹失败的联合控制：辅助颜色、压缩不等式与式 (17)

单桥估计不够用这件事，我在 slab 层看 lemma「Single-bridge estimates」时已经领教：$\mathrm{cut}_R$ 的通过概率有绝对常数 $p_*>0$，任意固定轨迹的期望相互作用 $\le C_v$、中段 $[r,\delta-r]$ 只贡献 $C_v/\sqrt r$，带空间衰减的锚分测试 $\mathcal A^\pm$ 把期望压成 $C(v,D)[\mathcal A^-(S)+\mathcal A^+(E)]$（slab.tex:79-104）。它的证明细节：最近提升下桥写成直线插值加 $B_t-(t/\delta)B_\delta$，涨落 sup 有界事件概率固定，短时段失败概率 $Ce^{-cr}$（slab.tex:106-123）；密度界 $C(t')^{-3/2}$ 拆成 $t'\le1$ 用 $\|v\|_\infty$、$t'\ge1$ 用 $\|v\|_1$（slab.tex:124-133）；空间衰减一段用 $|u+b|^2\ge|u|^2/2-|b|^2$ 吸位移和力程（slab.tex:138-147）。可问题在「联合」：相互作用闭测度不使桥独立（introduction.tex:82-83 明说），我要同时控制指定格并集里所有失败计数 $J_U^{\mathrm{fail}}$ 的指数矩（atypical.tex:25-30 定义了三个失败判据与分箱）。

atypical.tex 的解法我读第一遍时完全没有跟上，第二次才按「记账」理解。第一步分箱：宏观失败按 $\lvert\text{提升最大距离}-\text{端点}\rvert\in(D_js,2D_js]$ 装箱，箱 $*$ 收纳「仅短时段失败」，参数 $h_j=D_j$、$b_j=D_j^2$、$b_*=r$（atypical.tex:55-63）；支撑域 $\Omega_j=\{d(x,U)<(2h_j+4)s\}$，$|\Omega_j|\le Ch_j^3|U|$（atypical.tex:64-80）。第二步单桥核上界式 (18)：$K_j(E,S)\le Ce^{-cb_j}p_j(E)p_j(S)[e^{c_1\delta\Delta_{\Omega_j}}](E,S)$。大位移走加宽高斯 $k_\delta\le Ce^{-ch_j^2}k_{c_1\delta}$，小位移靠 Brownian 桥最大值尾 $Ce^{-ch_j^2}$；箱 $*$ 用 $r$ 版同戏（atypical.tex:93-116）。Dirichlet 核之所以能替换自由核，因为保留提升的直线段距 $E$ 不超过 $2h_js$，管径 $s$ 内的路径投影进 $\Omega_j$，而扩散系数 $c_1$ 桥停留在管内的概率有固定 $q_*>0$，各项按绕环类互斥求和（atypical.tex:118-134）。这就是我 §5 末说的「没有提升约定就没法陈述」的兑现。

第三步是我最佩服的组装：把 $\prod_i(1+(e-1)\mathbf1_{\text{失败}})$ 展开后，给每个被标记标签分配一个辅助颜色，扩大一粒子空间 $\mathfrak h_e=L^2(\Lambda_L)\oplus\bigoplus_jL^2(\Omega_j)$，标记色粒子扛 $-c_1\Delta_{\Omega_j}+M_j$（$M_j=\kappa b_j/\delta$ 是能隙），所有与标记粒子相关的相互作用一律删掉（删相互作用增加正权，方向正确），嵌入 $v_ef=(f,(\sqrt{\eta_j}p_jf)_j)$，$\eta_j=e^{-\kappa b_j}$ 吸收式 (18) 前置因子（atypical.tex:138-178）。$\mathcal T=V_e^*e^{-\delta\mathbb H}V_e$ 逐点控制被测试的板核，Schatten Hölder 用共轭指数 $\beta/(\beta-\delta)$ 与 $\beta/\delta$ 把期望抬成 $\operatorname{Tr}\mathcal T^{\beta/\delta}/Z_N$ 的 $\delta/\beta$ 次幂，式 (19)（atypical.tex:192-208）。

嵌入范数大于 1 的赔偿走压缩不等式：写 $V_e=e^AU_e$，$a=\frac12\log(1+\sum_j\eta_jp_j^2)$，$U_e$ 是等距，于是 $\mathcal T=U_e^*XU_e$、$X=e^Ae^{-\delta\mathbb H}e^A$，min--max 给 $\lambda_k(\mathcal T)\le\lambda_k(X)$（atypical.tex:211-228）。引理「Trace bound for a Lipschitz sandwich」把 $X$ 的任意正幂 trace 压进 $e^{-\beta\widetilde{\mathbb H}}$，$\widetilde{\mathbb H}=\mathbb H-\sum_iW_0(x_i)$、$W_0=2a/\delta+c_1|\nabla a|^2$（atypical.tex:230-246）。证明是一条我很想学来的插值：$U_t=e^{f(t)A}e^{-t\mathbb H}e^A$、$f(t)=-1+2t/\delta$，对 $\|U_tx\|^2$ 求导时交叉项纯虚、$|\nabla_iy|^2-f^2|\nabla a|^2|y|^2$ 落地（atypical.tex:271-308）；外面幂 $U_t^{\otimes k}$ 限制到子空间抓 $E_1+\cdots+E_k$，部分和不等式经 $\sum_i(\log x_i-t)_+$ 表示与 $e^{qu}=\int(u-t)_+q^2e^{qt}\dd t$ 积分恒等式升级成全部 $q$ 次幂的迹界（atypical.tex:318-352）。热迹有限性先用 $M_j\to\infty$ 沿宏观箱、domain monotonicity 加 torus 热核界验过（atypical.tex:255-269），这类「先证紧再谈谱」的顺序我以前总随手跳过。

收尾是普通的配分函数比较。$0\le W_0\le\frac C\delta\sum_j\eta_j\mathbf1_{\Omega_j}$（Cauchy--Schwarz 一行验完，atypical.tex:368-378），$D$ 大再 $\rho$ 小使 $\|W_0\|_\infty\le\rho$（atypical.tex:380-383），于是 §6 的两条输入「增量 $\le C_v\rho$、密度 $\le C_v\rho|B|$」字字生效：对 $-W_0$ 强度求导吃密度界，按色占用数分解 $\operatorname{Sym}^N\mathfrak h_e$、每标记粒子挂一个 $e^{\beta C_v\rho(N-J)}$ 代价、色隙 $M_j/2$ 吸收剩余，标记色总和丢约束后按理想 Bose 大配分函数几何级数收拢（atypical.tex:384-435）。最终 $\log\mathbb E_{\mathrm{cl}}e^{J_U^{\mathrm{fail}}}\le[C_v\sum_jD_j^3e^{-\kappa D_j^2}+o_\rho(1)]\rho|U|$，式 (17)（atypical.tex:438-459）。我在此记下两个容易被略过的均匀性：$C_v,\kappa$ 不依赖 $D$ 与 $\zeta$；$o_\rho(1)$ 在温度与体积上一致（atypical.tex:48-51）。正靠 $\sum D_j^3e^{-\kappa D_j^2}$ 的高斯衰减而骨架侧 $\alpha$ 只对 $D$ 多项式衰减，§10 与 §14 的「先 $D$ 后 $\varepsilon$」顺序才走得通。

下一节的 defective 定义把 §7、§8 的三类尾加分数阈值 $\Delta_A$ 全部并成一个逐格指示器，那是联合失败账本的第一次总结算。

## §9 缺陷格：从闭测度到插入测度的转移

defects.tex 开场就把参数咬合写死：$\Delta_A=1000(2R_A+2R+20)^3$（defects.tex:9-10）。缺陷格的定义：端计数落在 $[2b_-m,b_+m/2]$ 之外，或至少 $\varepsilon/4$ 比例的槽位以阈值 $C_0-\Delta_A$ 不合格（defects.tex:10-14）。注意「实际内端点」这一约定贯穿本节所有对称测试（defects.tex:11），到 §12 的 (33) 时还要再兑现一次。

先补一块纯分析的：分离锚点上的分数和估计式 (21)。对任意两两相距超过 $r$、都距 $U$ 不超过 $Ds$ 的锚点集 $\mathcal D$，$\sum_{a\in\mathcal D}\mathcal A^-(a;\omega)\le C\int_0^{\delta/2}(w(t)+r^{-3})n_S(\omega(t))\dd t$，其中 $S$ 是 $(D+R_A)s$ 邻域的粗格覆盖、$|S|\le C(D+R_A+2)^3|U|$（defects.tex:16-34）。证明靠装球：$r/2$ 半径互斥球把半径 $u$ 球内锚点数限成 $C(1+u/r)^3$，按宽度 $\max(r,a_t)$ 的壳层求和高斯和（defects.tex:36-49）。特别要记的是它「逐路径成立、锚点可按任意可测规则自适应选取」（defects.tex:28-31），这句让我后面在 §12 列路径清单时敢把坏格当作已知量枚举。指数矩一侧：右端除以 $B_0=C(1+K^2/\zeta^3)$ 后看成 $n_S(\omega(t))$ 的平均，Jensen 加闭律时不变再加式 (11) 在 $\lambda=1/2$ 处取值，得矩 $\le\exp(C_v\rho|S|)$（defects.tex:56-71）。

命题「Specified defective cells」给式 (22)：选好 $D,\varepsilon$ 使 $\sum D_j^3e^{-\kappa D_j^2}$ 项 $\le10^{-4}b_-\varepsilon$，再选小 $\zeta$、大 $C_0>\Delta_A$，则存在 $q_{\mathrm{cl}}(\rho)\to0$，任何指定格集 $\mathcal U$ 全体缺陷的概率 $\le q_{\mathrm{cl}}^{|\mathcal U|}$（defects.tex:74-92）。证明的五类失败清单是我反复读的地方：给每个不合格槽位指派有序清单里的第一个失败原因（轨迹失败；端非隔离；起点非隔离；起端分数；终端分数），清单靠后的原因自动意味着宏观合规与锚点隔离，至少一类吃掉 $k'=\varepsilon b_-mu'/20$ 个槽位（defects.tex:103-109）。逐类对账：轨迹类吃式 (17)（defects.tex:113-120），端隔离吃式 (13)，起点隔离先把宏观合规的起点装进 $C(D+2)^3|U'|$ 覆盖再用式 (13) 于时刻 0（defects.tex:121-127），分数类用式 (21) 加指数 Markov、$C_0$ 大到压过 $\rho|S|/k'$ 比（defects.tex:129-141）。计数类的补贴来自式 (12)。子集枚举 $2^u$ 乘常数个原因，最后 $\lambda_0m\ge\frac12\zeta K^3\rho^{-1/3}\to\infty$ 吸收 $C_1^u$，$q_{\mathrm{cl}}=C_1e^{-c\lambda_0m/3}$（defects.tex:143-157）。这里 §7 末尾「常数对 $\zeta$ 无依赖」报销：$\zeta$ 在隔离类被选小时要同时管两个应用，若式 (13) 常数随 $\zeta\to0$ 爆炸，这个联立就散了。

命题「Transfer to an open insertion」式 (23) 是全场我最意外的一招：对任何对称板事件 $\mathcal E$，$\mu_{ab}(\mathcal E)\le\frac C{M^2}P_{\mathrm{cl}}(\mathcal E)^{1/4}$，四次根！（defects.tex:177-188。）机制：把 $\mu_{ab}$ 写成 $\frac1{NVZ_N}\operatorname{Tr}_{\mathrm{sym}}e^{-\beta H/2}a^*(\mathbf1_b)a(\mathbf1_a)U_{\mathcal E}$，两次 Hilbert--Schmidt Cauchy--Schwarz，第一次拆两个插入因子、$a^*(\mathbf1_a)a(\mathbf1_a)\le s^3n_a$ 与平移不变性 $\operatorname{Tr}e^{-\beta H}n_b=Z_Nm$ 控一边（defects.tex:190-220）；第二次把 $\operatorname{Tr}U_{\mathcal E}^*n_aU_{\mathcal E}$ 的伴随核换成未测试核、用逐点核不等式 $0\le U_{\mathcal E}P_{\mathrm{sym}}\le e^{-\beta H/2}P_{\mathrm{sym}}$ 换出 $Z_N\mathbb E_{\mathrm{cl}}[n_a\mathbf1_{\mathcal E}]$，配上 $\mathbb En_a^2\le Cm^2$（defects.tex:221-246）。归一 $\frac{s^3m}{NV}=\frac1{M^2}$ 恰好出来（defects.tex:246-249）。我起初把四次根当成技术噪音，读到 (33) 才懂：环境平均时缺陷事件要以 $\mu_{ab}$ 律出现，四次根把 $q_{\mathrm{cl}}$ 换成 $q=q_{\mathrm{cl}}^{1/4}$，而 $q\to0$ 已经够用，根号松紧无所谓，要紧的是 $M^{-2}$ 前因子与格对求和 $\le M^2$ 精确对冲。

## §10 独立的几何剧场：骨架、碰撞矩与确定性绕行

geometry.tex 前半我在纸上完全没用到气体，这是作者故意把几何独立性剥离成 §「Cell paths」第一小节的用意（introduction.tex:92-93 明说「established independently of the gas」）。设定：$\mathcal G_n=(\Z/n\Z)^3$，有序对 $(a,b)$ 提升位移 $(w,d_2,d_3)$ 满足 $\lceil n/10\rceil\le w\le\lfloor n/8\rfloor$、$|d_2|,|d_3|\le w$，称容许对；容许对占全体有序对的绝对比例 $\upsilon>0$（geometry.tex:24-33）。这个 $\upsilon$ 就是 §11 里接受质量 $\upsilon/2$ 的那个 $\upsilon$ 的第一半来源。

骨架生成器：两横向坐标各自 $v_i^{(q)}=c_{\rm vel}\sum_{\ell\ge0}2^{-\ell/4}U^{(q)}_{\ell,\lfloor(i-1)/2^\ell\rfloor]}$、$Z_t^{(q)}=\sum_{i\le t}v_i^{(q)}$，$c_{\rm vel}=(1-2^{-1/4})/2$（geometry.tex:43-51）；基顶点在时刻 $t$ 是 $(t,\lfloor td_2/w+Z^{(2)}_{\min(t,w-t)}\rfloor,\ldots)$，位移在前后两半镜像读取所以端点处自动归零，「固定端点又不条件化随机增量」（geometry.tex:35-41）。逐段最近邻展开：先走第一坐标一步，再补第二、第三坐标的带符号步，每段时间至多五步、每个水平至多五个列出现（geometry.tex:53-68）。这套 dyadic 块速度与 Häggström--Mossel 的对齐块漂移构造同源（history.tex:101-104）， unpredictable path 的总体思路归 Benjamini--Pemantle--Peres（history.tex:99-101）。

引理「Skeleton encounters」两条矩：独立骨架对 $\gamma,\gamma'$，$J_0$ 是双侧 $R_*$-邻域相遇计数，$\mathbb Ee^{\alpha J_0}\le C$、$\alpha=c_{\mathrm{hit}}/(1+R_*)^2$（式 (24)）；软距离和 $S_B=\sum_z\mathbf e^{-d_\infty(z,\gamma')/B}$ 满足 $\mathbb Ee^{\xi(B)S_B}\le C(B)$（式 (25)），一致于 $n$ 与容许对（geometry.tex:93-108）。证明骨架：条件化全部 $\gamma'$ 变量后，未来区间 $[t+1,t+k]$ 内含一个长度至少 $k/4$ 的对齐 dyadic 新块，其未用变量给横位移宽度 $ck^{3/4}$ 的均匀项，二维条件密度 $\le Ck^{-3/2}$（geometry.tex:110-134）；相遇测试经 $D_u\le3d_\infty(z,z')+5$ 化约成同刻距离测试（geometry.tex:136-173）；最后把 $\mathbb E[\sum_{u>t}X_u|\mathcal F_t]\le b_0$ 迭代进乘积展开 $e^{\theta\sum X_t}=\prod(1+(e^{\theta X_t}-1))$，用 $e^{\theta x}-1\le(e^\theta-1)x$ 收几何级数（geometry.tex:177-206）。$\alpha$ 随 $R_*$ 只二次多项式衰减，这个慢衰减与式 (17) 的高斯快衰减配对，是参数次序的又一处伏笔。

物理接入点在 geometry.tex:211-225：$R_*=\lceil20(R+R_A+D+20)\rceil$、$\varepsilon=\alpha/20$；$D$ 只需大到满足前面条件，因为 (17) 高斯衰减快过 $R_*$ 的线性增长；再把 $C_0$ 加大，使均匀锚点在阈值 $C_0$ 下任何终端分数失败的概率 $<\upsilon/8$（靠式 (16) 配空间平均）。绕行机制：坏格=§5 的 unusable；拒绝规则之一是任何最近邻坏分量尺寸 $\ge n/4$（geometry.tex:230-233）；小分量 $T$ 一致提升到格集、包围盒坐标直径 $<n/4$、fill 补洞后投回 torus、端点落入任何投影 fill 则拒绝（geometry.tex:234-245）。引理「Deterministic detours」的拓扑部分我读得最慢：外顶点边界在 sup 范数一步的星图里连通，证明走割边按基本方块链接、模二平奇性、格回路由方块模二生成、顶点势函数只差邻居边恰为所选边（geometry.tex:266-315，引 Timár 附录版引理 1--2）；每个 fill 的星边界至多 $6|T|$ 个好顶点，最外 fill 嵌套不相邻的投影稳定性也一并证好（geometry.tex:286-315）。算法按「最后访问规则」进最外 fill、换边界路径、固定破 tie、时刻顺序圈消除（geometry.tex:317-340）。删除不变性：只删未被骨架击中的整坏分量不改变输出路径（geometry.tex:345-355），这条到 §12 的清单构造里是「列表包含一切可行对」的地基。几何侧的拒绝概率收尾：大分量用连通集计数 $MC^{\lceil n/4\rceil}$、端点被小 fill 包含用 $\sum_jC(j+1)^3C^jq_{\mathrm{cl}}^j$，密度压低后任意小（geometry.tex:357）。

到这里，两张独立剧场（气体的尾账、格上的几何）各自落幕。§11 把灯同时打亮：先开一个端造 $\mu$，再沿骨架改路造 $\nu$。

## §11 开一个端：$\nu$ 的定义、接受质量与精确归一

opening.tex 的顺序我原样保留：先给目标测度、再给接受条件、最后给相互作用提议，归一化一路精确携带，因为 §12 里两份变换的相消全赖此点（opening.tex:3-7）。

底座：闭概率 (14) 记作构型 $C$，再配两个独立均匀点 $x,z$、律 $dx\,dz/V^2$（opening.tex:19-24）。定向表我照抄进思维账本：正向插入 $\mu_{ba}$ 开槽 $i_0$、外端 $Y_{i_0}\in a$、新内端 $z\in b$；反向插入 $\mu_{ab}$ 开槽 $e$、外端 $Y_e\in b$、新内端 $x\in a$（opening.tex:27-37）。只用容许对，抽骨架、对 $C$ 的实际坏格做确定性适配，要求几何接受加两端测试 $\mathcal A^+(x;C),\mathcal A^+(z;C)\le C_0$，合记 $\operatorname{acc}(C,\gamma)$（opening.tex:40-44）。接受质量 $\ge\upsilon/2$ 的三笔账：容许对比例 $\ge\upsilon$，几何拒绝概率与 dummy 分数概率各压到它的固定小数以下（几何侧 $\upsilon/8$ 那笔在 geometry.tex:222-225，分数侧靠式 (16) 的空间平均）（opening.tex:46-49）。

选标签的权重 $h_\gamma(C,I)$ 是归一书写的核心：对路径上每格 $Q$ 数合格槽 $g_Q(C)=\sum_{i:Y_i\in Q}\mathbf1_{\{i\text{ eligible}\}}$，各格独立均匀选合格槽，得有序组 $I=(i_0,\ldots,i_k)$；对候选组 $h_\gamma$ 是「路径格序列等于 $P(C,\gamma)$」的指示乘各格 $\mathbf1_{\text{eligible}}/g_{\text{cell}}$，接受域外置零、零计数因子按零解读（opening.tex:51-68）。关键断言：$P$ 的格互异且可用，所以接受时诸因子有定义且 $\sum_Ih_\gamma(C,I)=1$；而候选 $I$ 的范围只依赖 $a,b,Y$，权重本身保留对 $C$ 实际路径的全部依赖（opening.tex:69-76）。我把这两句来回读了四遍，「范围与权重分离」到 §12 变成「公共远端选择积 $H_*$」，是全篇最细的一根线。

提议测度：循环前后继 $(p_IS)_i=S_{\operatorname{pred}_I(i)}$，起tuple 变 $S^O=p_IS^C$，内端除 $i_0$ 换成 $z$ 外全同 $Y$，$I$ 外路径保留；$I$ 上路径从条件相互作用律采样：状态 $X$ 固定端点与补路径，$W_G^X$ 用自由桥乘「与 $G$ 入射的相互作用对每对恰好一次」的指数，$\mathcal Z_G(X)=\int\mathbf1_{\mathrm{cut}_R(G)}W_G^X$，提议即 $W_I^O/\mathcal Z_I(O)$（opening.tex:78-96）。新位移至多 $(D+10)s$，源于合格性与星邻接，归一因此为正（opening.tex:90-96）。

密度式 (26)：$f=m\,\mathbb E_\gamma\sum_{I:\text{first}(I)=i_0}\frac{\mathbf1_{\mathrm{cut}_R(O_I)}}{\mathcal Z_I(O)}\int W_I^{\widehat C}h_\gamma(\widehat C,I)$，$\widehat C$ 是把 $O$ 倒回闭构型的假想态：$S^{\widehat C}=p_I^{-1}S^O$、$E^{\widehat C}=Y$、$I$ 外路径照旧；零旧权项一律置零即便归零也归零，正旧权给位移条件与正归一（opening.tex:104-116）。验证用逐组换元：Jacobian 为一、外核对置换不变、$W_{\bar I}^{\rm int}$ 换前换后一致，残差归一恰好 $\frac{V^{-1}}{N^{-1}s^{-3}}=\frac NM=m$，因为两个测度都把 $x$ 限制在 $Y_{i_0}$ 格内、都用 $dz/V$（opening.tex:118-140）。$\nu$ 的质量是底座接受概率 $\ge\upsilon/2$（opening.tex:104-106）。

二阶矩按 $\int f^2\dd\mu=\int f\dd\nu$ 算：在「底座带独立骨架 $\gamma'$ 与组 $I'$」的变换处求值式 (26)，得式 (27) 的长积分：$W(C)h_{\gamma'}(C,I')$ 乘两个切割归一分数再乘 $W_I^{\widehat C}h_\gamma(\widehat C,I)$，两组首标签相同、$I'$ 与 $I$ 各自重积分，Tonelli 因被积非负放行一切换序（opening.tex:142-166）。我读式 (27) 时犯过一个方向性错误：把 $h_{\gamma'}(C,I')$ 与 $h_\gamma(\widehat C,I)$ 当成同一个环境的两次独立抽样。错。$I'$ 在 $C$ 里选、$I$ 在 $\widehat C$ 里选，两个构型的坏格集不同，这正是 §12 用严测试锁 selection 的全部动机。顺带记下文献坐标：路径相关似然先平均再估二阶矩的套路见于随机迹探测与扰动格重排（opening.tex:97-102 引 Arias-Castro--Candes--Helgason--Zeitouni、Berger--Peres、Peres--Sly），本文的不同在于条件相互作用测度与两个提议归一都必须显式保留。

## §12 交叉比较：反向插入、远端相消与选择权的保全

comparison.tex 的主命题就是对式 (27) 一致有界（comparison.tex:7-16）。全部技术选择都服务于一句话：远离相遇的相互作用必须在两条变换间相消，否则每路径格固定成本乘体积发散（comparison.tex:18-25）。

四状态表是理解一切的钥匙：$C$ 全闭；$O=p_{I'}$ 重排、$i_0$ 内端开成 $z$；$\widehat C=p_I^{-1}p_{I'}S^C$、内端回 $Y$；$B=p_I^{-1}S^C$、内端 $Y_e$ 开成 $x$（comparison.tex:32-47，图 endpoint-changes.tex:38-47 说明灰点是「仍是外端但不再充内端」）。槽位划分 $\mathsf h=I\cap I'$、$\mathsf d=\mathsf h\cup\operatorname{pred}_I(\mathsf h)$、$\mathsf j=I\setminus\mathsf d$、$\mathsf l=I'\setminus\mathsf h$、$\mathsf L$ 为补：$\lvert\mathsf d\rvert\le2\lvert\mathsf h\rvert$、$e\in\mathsf d$；可相消的两段恰是 $\mathsf j$ 与 $\mathsf l$（comparison.tex:50-66）。逐点等同关系我用一行验过：$\mathsf j$ 上 $C=O$（不在 $I'$），$B$ 取 $\widehat C$ 端点（$I$ 后继非共享故也离 $I'$，$S_i^B=S_{\operatorname{succ}}^O$）；$\mathsf l$ 上 $B=C$、$\widehat C=O$（comparison.tex:67-79）。$J$ 记两路径在 $R_*$ 邻域内的相遇次数（双侧相加），远端即除相遇外全体（comparison.tex:64-66）。可行域内所有 $C,O,\widehat C$ 的 $I\cup I'$ 路径满足 $\mathrm{cut}_R$、位移 $\le(D+10)s$、锚分数对 $\mathsf L\le C_0$、$\mathsf j$-$\mathsf l$ 间起终点两两隔超 $r$（comparison.tex:80-83）。

第一笔账是核因子比式 (28)：提出各最近提升的单独核 $K_X(G)$，提议路径核相消，剩下 $\frac{K_C(\mathsf d)K_{\widehat C}(\mathsf d)}{K_B(\mathsf d)K_O(\mathsf d)}\le e^{C|\mathsf h|}$（comparison.tex:85-90）。第二笔是归一化下界式 (29)：$\overline{\mathcal Z}_{I'}(O)\ge Z[\mathsf l,O]e^{-C|\mathsf h|-o_\rho(1)J}$ 与 $\overline{\mathcal Z}_I(O)\ge Z[\mathsf j,C]e^{-C|\mathsf h|-o_\rho(1)J}$。两条都用「按群律采样一段、独立自由切割桥采样另一段」加 Jensen；跨组相互作用里，$\mathsf l$ 对冻结 $\mathsf j$ 的代价每近对 $C/\sqrt r$：边界时段因端点隔离加两禁（距离 $\ge r-2r/10>R_v$）为零，其余时段用边缘支配（comparison.tex:109-130）。支撑这一切的是「一路径边缘支配」观察：归一群分布里单个路径边缘 $\le C_4\pi_i^X$，冻结他路径后条件归一至少 $p_*e^{-C/p_*}$，正性 $v\ge0$ 放行（comparison.tex:96-97）。

第三笔是最难的：把 $\widehat C_{\mathsf j_n}$ 的积分换成基线 $B$ 积分。$\mathsf j_n$ 是 $\mathsf j$ 中端格距某 $\mathsf l$ 格 $2R+5$ 内的部分（comparison.tex:148），其余 $\mathsf j$ 在切割上根本碰不到 $\mathsf l$。固定数据称可行的，若存在原路径选择使两个非零选择权、指定适配与切割同时成立，该选择称见证；不可行纤维上原内积分本身为零，比较自动（comparison.tex:150-172）。权重恢复不等式 (29a) 与 (29) 同型；真正的难点在约束：原选择依赖哪些格可用、哪些槽合格，而改路径会同时改变这两样。解法是给 $B$ 造两套坏格集：$S_0(B)$ 按外端约定并宣布例外槽 $e$ 不合格，$S_1(B)$ 用严阈值 $C_0-\Delta_A$ 与强合格比例 $1-\varepsilon/2$，列表比对见 comparison.tex:222-242。引理「Stability under every cut replacement」式 (30)：任何见证满足 $S(C),S(\widehat C)\subseteq S_1(B)$，且 $S(C)=S_0(B)$ 在距 $P$ 之外 $R_*$ 逐点成立、$S(\widehat C)=S_0(B)$ 在距 $P'$ 之外 $R_*$ 逐点成立；证明的量化是「未变槽锚点分数变化 $\le\Delta_A$、每格外来者至多两个、$(1-\varepsilon/2)n_Q-2\ge(1-\varepsilon)n_Q$ 当 $m$ 大」（comparison.tex:248-283）。$\Delta_A=1000(2R_A+2R+20)^3$ 在此露出真面目：它按「一个锚可及的改路槽数乘单时段质量」预留了整块余量。

路径清单：把 $S_1(B)$ 按 $K_b=2R_*+10$ 邻接分成分量，距两骨架都 $\le R_*$+2 的称桥成分、尺寸和 $b_{\rm tot}$；列表规则是「桥成分任取子集当坏、非桥成分只取与 $S_0(B)$ 的交」，跑确定性适配、几何接受者入列，$G$ 谓词即「两条给定路径各在列中」（comparison.tex:286-291）。引理「Path lists」：见证对必满足 $G$；列至多含 $4^{b_{\rm tot}}$ 对；列中每对 $J\le J_0+C(R_*)b_{\rm tot}$。非桥成分远离 $P'$ 的论证用了「若贴近骨架顶点即为桥、若贴近绕行顶点则在 $K_b$ 邻接中并入被 $\gamma'$ 击中的障碍成分」（comparison.tex:304-321），删整分量不变的 Lemma detour 在此第三次报销；相遇计数按「自身骨架上的近出现单射进 $J_0$、剩余近出现贴绕行顶点、绕行总顶点 $\le12b_{\rm tot}$」（comparison.tex:322-340）。远端选择积 $H_F(B)$ 在同一基线构型上求值，与任何见证的原远端积逐点同值 $H_*$（comparison.tex:342-357）：于是「移除约束」只在提出公因子 $H_*$ 之后进行，链式积分比较见 comparison.tex:361-388 的两步不等式。汇总引理 (32)：$\mathcal I_{I,I'}\le e^{C|\mathsf h|+\sigma_\rho J}\mathbf1_{\rm occ}\prod_{\text{近格}Q}[(1-\varepsilon)n_Q(Y)]^{-1}\int W(S^B,E^B;d\omega)\mathbf1_GH_F(B)$，$\sigma_\rho\to0$（comparison.tex:406-424）。

我在此坦白一次概念弯路：读到 (30) 之前我一度以为只要概率上「大多数格状态不变」就能换基线，验算第三条链式不等式时才被迫承认逐点等式 $H_*=H_F(B)$ 不可让渡：条件内积分比较要在每条固定数据上成立，任何「几乎处处」版本都会在不可行纤维与例外格上漏出与 $M^2$ 对冲不掉的余项。这就是 §11 里那句「权重保留对 $C$ 实际路径的全部依赖」的终极用途。

## §13 求和的艺术：标签、格对、环境与两个骨架矩

comparison.tex 最后一段把四重求和按成本从低到高层层剥开，每一层恰好吃掉前面埋的一个因子。

第一层，固定基线路径下对标签求和。对候选格路径对及其组求和，范围只依赖 $a,b,Y$ 不依赖起点；逐组换元 $S^C\to S^B$，外核不变；按 $I$ 的末标签 $e$（外端在 $b$）分组，固定 $e$ 与基线构型后，基线测度、$S_0,S_1$、路径列都与其余标签选择无关（comparison.tex:462-471）。远格只现于一条路径，其选择因子求和至多 1；近出现各带 $(1-\varepsilon)^{-1}$；剩下的逐格和排成三种情形：普通公共格两独立标签给 $1+(e^C-1)/n_Q$、首格 $a$ 共享首标签给 $e^C/n_a$、末格 $b$ 一组固定给 $[1+(e^C-1)/n_b]/n_b$（comparison.tex:472-491）。用 $n_Q\ge b_-m$ 并并入 $e^{\sigma_\rho J}$ 得 $\frac Cm^2e^{\kappa_0J}$、$\kappa_0=2\varepsilon+o_\rho(1)$；再过路径列，$Cm^{-2}\exp(\kappa_0J_0+C'b_{\rm tot})$（comparison.tex:492-499）。$1/m$ 恰是「两独立选择撞同一粒子」的概率量级，introduction.tex:105-106 预告的那笔账在此结清。

第二层，恢复反向插入。$z$ 在 $b$ 内只剩底座积分 $1/M$；与式 (27) 前置因子合成 $\frac{m}{m^2M}=\frac1N$；对 $e$（$Y_e\in b$）求和、基线带 $x\in a$ 用 $dx/V$ 积分，恰好还原 $\mu_{ab}$（comparison.tex:501-509），得式 (34)：$\int f^2\dd\mu\le C\sum_{a,b}\mathbb E_{\gamma,\gamma'}[e^{\kappa_0J_0}\int e^{C'b_{\rm tot}}d\mu_{ab}]$。

第三层，环境平均。逐固定骨架的断言：$\int e^{C'b_{\rm tot}}d\mu_{ab}\le\frac CM^2\exp[\vartheta(q)S_{K_b}]$、$\vartheta(q)\to0$（comparison.tex:511-518）。展开成 realized 桥分量的乘积 $1+(e^{C'|T|}-1)$，用互斥连通集 $T$（$K_b$-邻接、距两骨架 $\le R_*+2$）的无序集族控制，逐并集吃式 (33)，$\mu_{ab}$ 律下缺陷集合的联合界把 $q=q_{\mathrm{cl}}^{1/4}$ 递进来（comparison.tex:444-453 定义、522-532 应用）；指数里和至多 $CM^{-2}\exp(\sum_T(e^{C'}q)^{|T|})$。计数以 $\gamma$ 顶点为根：每根 $j$ 尺寸连通集 $\le C(K_b)^j$、够到另骨架须 $d_\infty(z,\gamma')\le2(R_*+2)+K_bj$，几何级数提出距离衰减，得 $o_q(1)\sum_ze^{-d_\infty(z,\gamma')/K_b}$（comparison.tex:534-539）。最后密度压到 $2\kappa_0\le\alpha$、$2\vartheta(q)\le\xi(K_b)$，Cauchy--Schwarz 拆骨架矩，式 (24) 管 $J_0$、式 (25) 管 $S_{K_b}$，逐对 $\le C/M^2$，容许对至多 $M^2$ 个，命题闭（comparison.tex:541-554）。

我复盘这层的对称美：$M^{-2}$ 出现三次（插入测度天然质量、标签和出 $1/m^2$ 与 $m/(m^2M)$ 的复位、环境断言的前因子），$M^2$ 出现一次（格对计数），互相抵消后不留体积依赖。任何一个环节松一格，体积发散或体积衰减都会毁掉一致常数。$J_0$ 与 $S_B$ 双矩分工我也起初看混：$J_0$ 管「撞上了多少」（硬邻域计数，$\alpha$ 随 $R_*$ 二次衰减），$S_B$ 管「离得多远都还有多重」（软距离，系数 $\vartheta(q)$ 由缺陷参数供给）。两骨架矩估计互不共享证明，这正对应 introduction.tex:88-92 那句「两个几何界独立于气体建立」。

## §14 收官：常数的固定次序与把界押到零温

conclusion.tex 把 $c_*(v)=\frac{\upsilon^2}{4C_v}$ 落成一句话：$\nu$ 质量 $\ge\upsilon/2$、$\int f^2\dd\mu\le C_v$、$\mu$ 总质量 $q_0$，Cauchy--Schwarz 收网（conclusion.tex:9-17）。全部力气花在解释「六个截断怎么在无密度依赖的前提下排成一条链」（conclusion.tex:17-48）：

(1) 先固定上密度估计里的定位乘子与式 (13) 预留的正能量分数，再定加粒子小分数 $\eta$、$K$ 大到下密度界成立、占据常数 $b_-,b_+$。(2) 宏观截断 $D$ 取大，$\varepsilon=\alpha(D)/20$；$\alpha$ 只对 $D$ 多项式小，(17) 高斯快小，两条件同时满足。(3) $\zeta$ 小到隔离尾，再 $C_0$ 大到联合分数尾与两个均匀 dummy 锚测试；至此常数只依赖 $v$。(4) 降 $\rho_*(v)$ 满足一切小密度限制：$r=\zeta\rho^{-1/3}$、$m\asymp\rho^{-1/2}$、$\lambda_0m\asymp\rho^{-1/3}$ 齐趋无穷；联合缺陷参数趋零；条件桥界可大但乘的相遇项带 $r^{-1/2}$ 或 $m^{-1}$，故 $2\kappa_0\le\alpha$ 与软距离阈值都进位（conclusion.tex:36-43）。(5) 每个 $\rho$ 处再选 $L_0(\rho,v)$ 管提升、格网、几何拒绝，温度在 $0<T\le\rho^2$ 内不再加限制（conclusion.tex:44-47）。

这条链我按依赖图重画过一遍才敢相信：$\varepsilon$ 从 $D$ 出发、$D$ 从 $K$ 出发、$K$ 从 $\eta$ 出发、$\eta$ 从势出发；$\zeta$ 在 $D,\varepsilon$ 之后；$C_0$ 又在 $\zeta$ 之后；$\rho_*$ 最后；$L_0$ 附属于 $\rho$。任何一环提到前面都会断，例如 $C_0$ 若早于 $\zeta$ 定，隔离尾 $C_v\zeta^3\rho|S|\le k'/2$ 的选小就没有自由参数可用（defects.tex:125-127）。

零温收尾：固定 $N,L$，标记 Schrödinger 半群保正（自由热核严格正、有界相互作用的 Feynman--Kac 权严格正），紧预解式给唯一正归一基态本征函数，置换不变性逼它对称，因此也是唯一玻色基态；Gibbs 态按迹模收敛到基态投影，占据观测量 $N^{-1}\sum_i(|u_0\rangle\langle u_0|)_i\le1$，一致下界（对 $\beta\ge\rho^{-2}$ 已成立）在 $T=0$ 存活（conclusion.tex:51-61）。最后固定 $\rho,T$，任何 $L\to\infty$、$N/L^3\to\rho$ 序列的后段全落进密度带与体积阈值，同一 $c_*(v)$ 逐字传递（conclusion.tex:63-66）。

我把定理全程走通后给自己的一句话总结是：这是一台「正性会计机」，每一步只花非负权的账，能量、熵、几何各自封在独立的账本里，中间靠 $\mu,\nu$ 两张测度汇兑。

## §15 最终路线与最初设想的出入，遗留的问题

合上笔记本对照开头的自己，出入集中在五处，我把它们按刺痛程度排序。

第一处，问题的入口就换了。我最初以为这是一个「一粒子密度矩阵谱」问题，工具应当是 Penrose--Onsager 判据与 Yang 的 ODLRO 语言（history.tex:9-16 记录了这两个判据的出处），要证的是 $\gamma^{(1)}$ 有一个大特征值。最终路线里判据只出现在陈述端，证明从头到尾没有再碰谱：占据份额被写成两个正测度的汇兑不等式，$q_0\ge(\upsilon/2)^2/C_v$ 一行封顶（conclusion.tex:9-17）。我花了很长时间才接受「不研究 $\gamma^{(1)}$ 本身、只研究它的质量恒等式」这种迂回的正当性，因为 Feynman--Kac 的正性是精确的，而谱信息是部分的。

第二处，温度的角色和我预设的相反。我原以为 $T$ 是主敌，需要单调性或 FKG 型论证在两个端点之间插值；实际证明里 $T$ 只以两种方式出现：$\beta\ge\rho^{-2}>2\delta$ 给板短性（slab.tex:4-7），以及所有熵误差被 $T\le\rho^2$ 统一碾碎（energy.tex:126-130、atypical.tex:449-454）。零温不靠极限定理的均匀版本，靠固定体积的保正性与迹模收敛单独收尾（conclusion.tex:51-61）。窗口 $T\le\rho^2$ 的选择是证明结构的输出，我最初设想的「低温到临界温度的整段」在此完全没被尝试。`[推测]` 论文没有讨论窗口是否最优，我也没有工具判断；材料缺口在于全篇没有任何反向例子说明更大窗口会失败。

第三处，散射长度根本没进定理。我预设结论会长成 $c_*(v)\approx f(a,\rho)$ 的形状，毕竟 Bogoliubov 传统把 $Na$ 当命根（history.tex:28-31），Lieb--Yngvason 渐近的主项也是 $4\pi a\rho$（history.tex:57-59）。最终 $c_*(v)=\upsilon^2/(4C_v)$ 里 $a$ 只在 $C_v$ 内部以 $\|v\|_1,\|v\|_\infty,R_v$ 这些裸范数形式潜伏（setup.tex:9-12、energy.tex:167-178），没有任何地方用到散射渐近。这提醒我：本定理是「存在性下限」，它对相互作用强度做的全部记账只要求势非零、有界、径向、有限力程，连小性都不要。

第四处，独立性假设的失守与重建。我在 §4 蓝图阶段最先把「格子里的桥近似独立」当成显然，随后被 introduction.tex:82-86 那句「相互作用桥不独立」逼着学了 atypical.tex 的全套颜色机械（§8）；再到 §12 又被逼着承认连「哪些格可用、哪些粒子合格」都随构型改变，必须逐点锁死 $H_*$。两次被迫放弃「以概率 1 成立即可」的侥幸，是这条路线对我直觉最深的矫正。

第五处，几何剧场的独立性比我预期强。骨架两矩（式 (24)(25)）完全不见气体（geometry.tex:93-108），绕行规则完全不见路径抽样（geometry.tex:254-355），接入物理只有三行参数选择（geometry.tex:214-225）。这种「先建好无条件成立的几何，再一次性接线」的写法，和我习惯的边构造边验证正好相反。

遗留问题我给自己留了三条。其一，$\rho_*(v)$ 与 $L_0(\rho,v)$ 都是存在性的，全文没有可计算界；`[推测]` 依赖图里 $D$ 通过 $\varepsilon=\alpha(D)/20\ge c/D^2$ 反向进入 $\kappa_0=2\varepsilon+o_\rho(1)$ 与 $R_*(D)$ 的链条，原则上逐层可数值化，但论文没有做，我也没做完。其二，势类：有界性排除硬球，而能量线的 Fournais--Solovej 是含硬核的（history.tex:62-64），`[推测]` 把有界截断势单调逼近硬球的路线大概率毁在 $\mathcal A^\pm$ 分数与式 (16) 的 $C(v,D)$ 对 $\|v\|_\infty$ 的线性依赖上，我没有验证到底。其三，本笔记属于非 Lean 队列，我手头没有该论文的机器验证行可查，证明的每一环都停在我的人工复算上；这正是队列规则里 Lean 取证必须另行派单的原因。

## §16 勘误

按落盘协议，已写内容一律不改，错误在此登记：

1. §10 第二段 $v_i^{(q)}$ 公式中，下标收尾我误写为 `\rfloor]`，应为 `\rfloor}`；正文语义不受影响。
2. §12 第三段「距两骨架都 $\le R_*$+2」中，`+2` 落在了数学环境之外，规范写法是 $\le R_*+2$；所指即 comparison.tex:286-287 的桥成分判据。
3. §9 末段引用括号「(defects.tex:177-188.)」句点误入括号内，行号本身无误。
4. §3 第三段中，我在「定死了」之后使用了一处双全角停顿号引出同位语，触犯文风禁令的长破折号条款（该字符全文应零命中）。按落盘协议第 5 条，已落盘正文不许改写，故此处仅登记、不修改原句，此为本人本稿唯一已知的文风违规点，交付报告中另行申报。

## §17 台账

下表汇总本会话从 `build/` 各文件真实读出的符号、数值、位置与依赖；路径前缀 `build/`，行号以 Read 输出为准。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $v$ | $0\le v\le\lVert v\rVert_\infty$，径向、支撑于 $B(0,R_v)$、不几乎处处为零 | sections/introduction.tex:10-12 | 定理全部前提 | 陈述即 main.tex:25-38 |
| $H_{N,L}$ | $-\sum_{i}\Delta_i+\sum_{i<j}v_L(x_i-x_j)$ | sections/introduction.tex:15-18 | 配分函数与占据定义 | 式 (14) 失去来源 |
| $q_0$ | 等于 $\mu$ 的总质量 | sections/opening.tex:9-17 | Cauchy--Schwarz 主干 | 结论 $q_0\ge c_*(v)$ 无从落地 |
| $c_*(v)$ | $\upsilon^2/(4C_v)$ | sections/conclusion.tex:13-16 | 定理结论常数 | 任一环节松则归零 |
| $\rho_*(v)$ | 六道小密度限制的交集下界 | sections/conclusion.tex:36-43 | 密度区间 $(0,\rho_*)$ | 式 (17) 的 $o_\rho(1)$ 失控 |
| $s$ | $[K\rho^{-1/2},2K\rho^{-1/2}]$ | sections/setup.tex:30-33 | 一切格账 | $m\to\infty$ 失效 |
| $m$ | $Ns^3/V$，$\asymp\rho^{-1/2}\to\infty$ | sections/localization.tex:4-6 | 合格粒子供给 | 标签和 $1/m$ 项发散 |
| $M$ | $n^3$，格总数 | sections/setup.tex:32 | $M^{-2}$ 与 $M^2$ 对冲 | 式 (34) 体积残留 |
| $r$ | $\zeta\rho^{-1/3}$，$r/s\to0$，$2r<\delta$ | sections/slab.tex:46-49 | 隔离与边界时段 | 式 (16) 中段界失效 |
| $\lambda_0$ | $r\sqrt\rho$ | sections/localization.tex:295 | 式 (13) 倾斜强度 | 缺陷格联合界退化为常数 |
| $\delta$ | $s^2$ | sections/slab.tex:4-7 | 板长与 $\beta>2\delta$ | 式 (19) 的 Hölder 指数越界 |
| $D,R,R_A$ | $R=D+30$，$R_A=2R+20$ | sections/slab.tex:44 | $\mathrm{cut}_R$ 半径链 | 提升唯一性 (slab.tex:81-83) 断裂 |
| $c_vb^{-3}$ | Neumann 格能量常数 | sections/energy.tex:22-32 | 式 (2) 双占据代价 | 式 (4) 无正系数 |
| $b$ | $(4/\rho)^{1/3}$ | sections/energy.tex:119-122 | 式 (4) 切分 | 格数 $\le N/2$ 不成立 |
| $K_\beta(0)$ | $\ge(4\pi\beta)^{-3/2}$ | sections/energy.tex:170-175 | 式 (6) 前置因子 | 增量上界带 $\log\beta$ 残留 |
| $\phi_U$ | $e^{-d(x,U)/s}$ | sections/localization.tex:112-114 | 式 (9)-(11) | 密度指数矩失效 |
| $D_0$ | $H_0\rho$ | sections/localization.tex:117-124 | 式 (9) 主系数 | $c_vD_0-C_v\rho$ 转负 |
| $b_-,b_+$ | $0<b_-<1/4<b_+/\,4$ 型双侧常数 | sections/localization.tex:201-206 | 式 (12) 与可用格定义 | 占据尾概率指数丢失 |
| $p_*$ | 切割通过概率下界 | sections/slab.tex:83-85 | 式 (29) 分母与 $C_4$ | 边缘支配 $C_4\pi$ 崩溃 |
| $\mathcal A^\pm$ | 带权分数 $w(t)=\min(1,t^{-3/2})$ | sections/slab.tex:52-59 | 合格性与缺陷测试 | 式 (21) 无法装箱 |
| $C_0$ | 分数阈值，$C_0>\Delta_A$ | sections/slab.tex:70-72 | 缺陷格与 dummy 测试 | 接受质量 $\upsilon/2$ 不保 |
| $\kappa$ | 式 (17) 高斯衰减系数 | sections/atypical.tex:34-48 | $D$ 与 $\varepsilon$ 耦合 | §14 次序 (2) 断裂 |
| $\Sigma$ | $\sum_jD_j^3e^{-\kappa D_j^2}+D^3e^{-\kappa r}$ | sections/atypical.tex:362-366 | 式 (17) 成本 | 分箱体积和发散 |
| $\Delta_A$ | $1000(2R_A+2R+20)^3$ | sections/defects.tex:9-14 | 严测试余量 | 式 (30) 包含关系失效 |
| $q_{\mathrm{cl}}$ | $C_1e^{-c\lambda_0m/3}\to0$ | sections/defects.tex:154-157 | 式 (22)(33) | 环境平均无法几何收敛 |
| $\upsilon$ | 容许格对绝对比例 | sections/geometry.tex:28-33 | 接受质量下限 | $\nu$ 质量趋零 |
| $\alpha$ | $c_{\mathrm{hit}}/(1+R_*)^2$ | sections/geometry.tex:93-101 | 式 (24) 与 $\varepsilon=\alpha/20$ | 标签和指数 $\kappa_0$ 超标 |
| $\xi(B),C(B)$ | 软距离矩常数 | sections/geometry.tex:102-108 | 式 (25) 收 $b_{\rm tot}$ | 式 (34) 环境平均发散 |
| $R_*$ | $\lceil20(R+R_A+D+20)\rceil$ | sections/geometry.tex:214-216 | 远格逐点等式半径 | 式 (30) 两等式失配 |
| $B_0$ | $C(1+K^2/\zeta^3)$ | sections/defects.tex:31-34 | 式 (21) 指数矩归一 | 分数尾概率爆炸 |
| $\eta_j,M_j$ | $e^{-\kappa b_j}$ 与 $\kappa b_j/\delta$ | sections/atypical.tex:139-153 | 色隙吸收删失代价 | 大幂迹比较断链 |
| $H_*,H_F$ | 远端选择积逐点公共值 | sections/comparison.tex:342-357 | 约束移除 | 内积分比较失去共同因子 |
| $\kappa_0$ | $2\varepsilon+o_\rho(1)$ | sections/comparison.tex:493-499 | 标签求和指数 | 与 $\alpha$ 的 $2\kappa_0\le\alpha$ 崩 |
| $\sigma_\rho$ | $\to0$，一致于 $L,T$ | sections/comparison.tex:419-422 | 式 (32) 误差 | 相遇成本回归固定值 |
| $\vartheta(q)$ | $q\downarrow0$ 时趋零 | sections/comparison.tex:511-518 | 稀有分量矩 | $S_{K_b}$ 系数超 $\xi(K_b)/2$ |
| $b_{\rm tot}$ | 桥成分尺寸和 | sections/comparison.tex:286-291 | $4^{b_{\rm tot}}$ 清单与式 (31) | 路径清单计数失效 |
| $C/M^2$ | 式 (23) 前因子 | sections/defects.tex:177-188 | 与 $M^2$ 格对相抵 | $\int f^2\dd\mu$ 随体积衰减或发散 |
| $c_1,q_*$ | 核放大系数与管内概率 | sections/atypical.tex:83-91,118-134 | 式 (18) Dirichlet 替换 | 提升求和失去下界支撑 |
| $\beta$ | $T^{-1}$，$\beta\ge\rho^{-2}>2\delta$ | sections/slab.tex:4-7 | 板短性与式 (19) | Hölder 共轭指数越界 |
| $\Gamma_{N,L,T}$ | $e^{-H/T}/\Tr e^{-H/T}$ | sections/introduction.tex:20-22 | $\gamma^{(1)}$ 的母体 | 占据份额无从定义 |
| $u_0$ | $V^{-1/2}$，常轨道 | sections/introduction.tex:23 | $q_0$ 的插入算子 | opening.tex:14-16 质量恒等断裂 |
| $v_L$ | $\sum_{k\in\Z^3}v(x+Lk)$ 周期化 | sections/introduction.tex:12 | $H_{N,L}$ 良定义 | 板权重求和无界 |
| $R_v$ | 力程半径上界 | sections/setup.tex:9 | 八分球需 $b_0/2>R_v$ | 式 (1) 的正测度集为空 |
| $a_v$ | $\lvert A\rvert/8>0$ | sections/energy.tex:41-43 | $a_v\lvert f_0\rvert^2$ 夹逼 | Sobolev--Poincaré 无落点 |
| $\sigma=g\Gamma g/M_G$ | 对角倾斜态 | sections/localization.tex:39-48 | 式 (8) 上界一侧 | 变分比较断链 |
| $M_G$ | $\mathbb E_Pe^{2G}$ | sections/localization.tex:40 | (8) 的归一化 | 积分 $\partial_\lambda\log M_G$ 失效 |
| $H(w)$ | Shannon 熵，$\le C+\sum_jjw_j$ | sections/localization.tex:31-35 | 式 (7) 色数熵 | 扇区分解出现熵黑洞 |
| $n_p$ | $\sum_ip(x_i)$ 占据算子 | sections/setup.tex:36 | 式 (9)-(13) 通用记号 | 各尾估计失去统一语言 |
| $P$ | 一时刻平衡位置律 | sections/slab.tex:32-36 | 时不变性插入 | 式 (21) 的 Jensen 步失效 |
| $\mathcal V_{ij}$ | $\int_0^\delta v(\omega_i-\omega_j)\dd t$ | sections/slab.tex:15-16 | 权重 $W$ | 式 (14) 无相互作用因子 |
| $F(Y,S)$ | $e^{-(\beta-\delta)H}P_{\mathrm{sym}}$ 的核 | sections/slab.tex:9-13 | 板外一切不动 | 半群 trace 恒等式断 |
| $k(d_\ell)$ | $(4\pi\delta)^{-3/2}e^{-\lvert d_\ell\rvert^2/(4\delta)}$ | sections/slab.tex:37-39 | 提升求和 | 式 (28) 核因子无法分离 |
| eligible | 端隔离、宏观、短时段、双分数四联 | sections/slab.tex:64-71 | $g_Q$ 计数与选择权 | 每格合格数为零、路径被拒 |
| usable | 计数带加合格比例 $1-\varepsilon$ | sections/slab.tex:71-73 | 接受域与适配输入 | 骨架绕行的对象不存在 |
| $\mathrm{cut}_R$ | 半径 $Rs$ 宏观加两短段 $r/10$ | sections/slab.tex:74-77 | 提议归一正性 | $\mathcal Z_I(O)$ 可为零 |
| $C(v,D)$ | 固定轨迹交互期望常数 | sections/slab.tex:86-99 | 式 (16) | 分数支配与锚测试全塌 |
| $J_U^{\mathrm{fail}}$ | 三判据失败计数 | sections/atypical.tex:25-31 | 式 (17) | §9 轨迹类账无处支付 |
| $K_j(E,S)$ | 标记进箱 $j$ 的单桥核 | sections/atypical.tex:83-91 | 式 (18) | 颜色嵌入无系数可摆 |
| $\mathfrak h_e$ | 扩大一粒子空间 | sections/atypical.tex:155-159 | 彩色 $\mathbb H$ | 式 (19) 失去迹表达 |
| $\mathbb H$ | 分色形式：隙 $M_j$ 与 Dirichlet 动能 | sections/atypical.tex:165-179 | $\mathcal T$ 的母算子 | 压缩不等式无从陈述 |
| $\mathcal T$ | $V_e^*e^{-\delta\mathbb H}V_e$ | sections/atypical.tex:176-195 | 逐点核控制 | 指数矩没有上界 |
| $a(x)$ | $\frac12\log(1+\sum_j\eta_jp_j^2)$ | sections/atypical.tex:212-215 | $V_e=e^AU_e$ | 等距分解失败 |
| $W_0$ | $2a/\delta+c_1\lvert\nabla a\rvert^2$ | sections/atypical.tex:232-237 | $\widetilde{\mathbb H}$ | 式 (20) 右端无定义 |
| $U_t$ | $e^{f(t)A}e^{-t\mathbb H}e^A$，$f=-1+2t/\delta$ | sections/atypical.tex:272-276 | 导数不等式 | 外面幂部分和链中断 |
| $S(\sigma)$ | $-\Tr(\sigma\log\sigma)$ | sections/energy.tex:12-14 | 式 (3) 与变分 | 自由能语言整体失效 |
| $Z_J^{(-W)}$ | 外势 $-W$ 配分函数 | sections/energy.tex:8-11 | 式 (6) 对 $W$ 一致 | atypical 的密度输入失配 |
| $\eta$ | 加粒子分数 $k=\lfloor\eta\rho\lvert U\rvert\rfloor$ | sections/localization.tex:245-253 | 下侧占据尾 | $k\ge\eta\rho\lvert U\rvert/2$ 崩 |
| $U_0$ | fine 立方体粗格覆盖，$\lvert U_0\rvert\le C\lvert S\rvert$ | sections/localization.tex:318-321 | 式 (13) 分账 | 预留能量没有归属 |
| 对称事件 | 联合换标不变 | sections/defects.tex:170-175 | 式 (23) 定义域 | trace 表示立即失效 |
| $a^*(\mathbf1_b)a(\mathbf1_a)$ | 二次量子化插入算子 | sections/defects.tex:201-209 | $\mu_{ab}$ 的 trace 式 | HS 双不等式无起点 |
| $c_{\rm vel}$ | $(1-2^{-1/4})/2$ | sections/geometry.tex:46 | $v_i$ 绝对收敛 | 骨架位移级数发散 |
| $Z_t^{(q)}$ | 漂移部分和 | sections/geometry.tex:49-51 | 横坐标镜像读取 | 条件均匀项不存在 |
| $I_{\ell,j}$ | 对齐 dyadic 区间 | sections/geometry.tex:117-119 | 新块搜索 | $Ck^{-3/2}$ 密度界断 |
| $\mathcal F_t$ | 揭示 $\sigma$-代数 | sections/geometry.tex:119-124 | 测试适应性 | 矩迭代失去条件独立 |
| $D_t$ | $\lVert Z_t-Z_t'\rVert_\infty$ | sections/geometry.tex:137 | 同刻化约 | $J_0$ 无法被计数和支配 |
| fill | 障碍补洞像 | sections/geometry.tex:239-245 | 端点拒绝与绕行 | 嵌套与投影稳定性失败 |
| 星边界 | 至多 $6\lvert T\rvert$ 个好顶点 | sections/geometry.tex:293-315 | detour 可行性 | 外边界不连通、绕行断路 |
| $K_b$ | $2R_*+10$ 邻接 | sections/comparison.tex:286 | 桥成分划分 | 清单漏掉见证对 |
| $\mathsf h,\mathsf d,\mathsf j,\mathsf l,\mathsf L$ | 五分区，$\lvert\mathsf d\rvert\le2\lvert\mathsf h\rvert$，$e\in\mathsf d$ | sections/comparison.tex:52-66 | 相消总账 | 式 (28) 的分子分母对不上 |
| $Z[G,X]$ | 归一基团积分 | sections/comparison.tex:92-94 | 式 (29) | 分母下界失去载体 |
| $C_4$ | 单路径边缘支配常数 | sections/comparison.tex:96-97 | 冻结群仍支配 | $\mathsf j_n$-$\mathsf l$ 小代价 $C/\sqrt r$ 崩 |
| $\mathsf j_n$ | $\mathsf j$ 中近 $\mathsf l$ 端格部分 | sections/comparison.tex:148 | 恢复式 (29a) | 远端 $\mathsf j$ 交互重新计价 |
| witness | 可行纤维的实现选择 | sections/comparison.tex:166-172 | 逐纤维比较 | 不可行纤维不再自动归零 |
| $\mathbf1_{\rm occ}$ | 双路径计数带 | sections/comparison.tex:403-404 | 式 (32) 指示 | $n_Q\ge b_-m$ 无法引用 |
| $W_{\bar I}^{\rm int}$ | 补路径内部交互测度 | sections/opening.tex:120-128 | 密度验证换元 | 换前换后一致失败 |
| $p_I$ | 循环前继置换 | sections/opening.tex:79-81 | $S^O=p_IS^C$ | Jacobian 为一的换元无凭 |
| $\mathcal Z_I(O)$ | 切割归一 | sections/opening.tex:88-92 | 提议 $W_I^O/\mathcal Z_I$ | 条件提议非概率 |
| $f$ | $\dd\nu/\dd\mu$，式 (26) | sections/opening.tex:104-116 | 主干 Cauchy--Schwarz | $\int f^2\dd\mu$ 界失去目标 |
| $\widehat C$ | 假想闭态，$S^{\widehat C}=p_I^{-1}S^O$ | sections/opening.tex:110-116 | $h_\gamma(\widehat C,I)$ | 反向旧权无处安挂 |
| $\mathcal E_{\gamma,\gamma'}$ | 双骨架独立期望 | sections/comparison.tex:504-509 | 式 (34) | 两矩分离策略作废 |
| $\Lambda_L,V$ | $(\R/L\Z)^3$，$V=L^3$ | sections/introduction.tex:12-13 | 一切归一的底 | thermodynamic 极限无从陈述 |
| 单位制 | $\hbar^2/(2m_{\mathrm{particle}})=k_B=1$ | sections/introduction.tex:19 | 式与 $T\le\rho^2$ 窗口 | 温度窗量纲错乱 |
| 密度带 | $\rho/2\le N/L^3\le2\rho$ | sections/introduction.tex:29-30 | 全篇一致性的载体 | $m$ 的双侧夹断 |
| $Z_N$ | $\int k_\beta^{\mathrm{sym}}(X,X)\dd X$ | sections/setup.tex:17-19 | 式 (14)(19)(23) | 归一化整体失联 |
| $\operatorname{pred}_I,\operatorname{succ}_I$ | 组内循环前后继 | sections/opening.tex:79-80 | $p_I$ 与 $\mathsf d$ 定义 | 循环重排与 $\lvert\mathsf d\rvert$ 界断 |
| $\operatorname{acc}(C,\gamma)$ | 几何接受加双端分数测试 | sections/opening.tex:40-44 | $\nu$ 质量 $\upsilon/2$ | 接受率失去三笔账结构 |
| $g_Q(C)$ | 格内合格槽计数 | sections/opening.tex:54-56 | $h_\gamma$ 分母 | 均匀选择无法归一 |
| $h_\gamma(C,I)$ | 路径匹配指示乘合格倒数积 | sections/opening.tex:61-68 | 式 (27) 两组权重 | $\sum_Ih=1$ 崩、密度验证断 |
| $p_h$ | 距 $U$ 的 $hs$ 掩蔽（余弦插值） | sections/localization.tex:141-144 | 式 (9) 推导 | $h$ 平均与梯度代价断链 |
| $\Omega_h$ | $(h+2)s$ 邻域 Dirichlet 区 | sections/localization.tex:146-148 | 体积误差 $C(h+4)^3\lvert U\rvert$ | 小密度吸收失效 |
| $D_j$ | $2^jD$ | sections/atypical.tex:45-46 | 分箱与 $\Sigma$ | 高斯衰减论证断 |
| $p_j$ | $\Omega_j$ 上的截断 | sections/atypical.tex:68-71 | 式 (18) 两侧因子 | 标记核失去局域化 |
| $B_j$ | 覆盖 $\Omega_j$ 的粗格并 | sections/atypical.tex:75-79 | 密度输入对接 | $W_0$ 代价无法入账 |
| $\mathcal G_n$ | $(\Z/n\Z)^3$ 格环面 | sections/geometry.tex:24-25 | 骨架定义域 | 容许对比例无意义 |
| $(w,d_2,d_3)$ | 提升位移，$\lceil n/10\rceil\le w\le\lfloor n/8\rfloor$ | sections/geometry.tex:26-30 | 骨架端条件 | 水平不回绕、$D_t$ 化约失效 |
| $d_\infty$ | 周期 sup 距离 | sections/geometry.tex:76-79 | $J_0,S_B,R_*$ | 相遇测试失去度量 |
| $b_0$ | 条件均值界，$C(R_*+1)^2$ 型 | sections/geometry.tex:184-191 | 矩迭代 | $\alpha\sim(b_0+1)^{-1}$ 断链 |
| 大步拒绝 | 坏分量 $\ge n/4$ 即弃 | sections/geometry.tex:230-233 | fill 提升一致性 | 小盒论证崩、绕行无定义 |
| $P(C,\gamma)$ | 适配后的有序简单星路径 | sections/opening.tex:52 | 选格范围 | 标签组无从挂列 |
| $\chi,Q$ | fine 立方截断与成对计数器 | sections/localization.tex:308-317 | 式 (13) 左侧 $\le2Q$ | 非隔离计数失控 |
| $U_{\mathcal E},K_{\mathcal E}$ | 测试板核与其半群积 | sections/defects.tex:195-200 | 式 (23) HS 分解 | 四次根换不出来 |
| $J$ | 双路径近相遇总数 | sections/comparison.tex:64-66 | $o_\rho(1)J$ 各项 | 相遇成本回升为固定值 |
| $\pi_i^X,\Phi_G^X,c_G^X$ | 桥律、内部交互指数、切割 | sections/comparison.tex:135 | $d\nu_G^X$ 群测度 | 归一账本散架 |
| $C(K_b)^j$ | 每根尺寸 $j$ 连通集计数 | sections/comparison.tex:534-539 | 指数级数收敛 | $q$ 小性不再购买衰减 |
| $\upsilon/8$ | dummy 分数容许份额 | sections/geometry.tex:222-225 | 接受质量三笔账 | $\upsilon/2$ 降为不确定量 |
| $c_1$ | 固定放大系数 $>1$ | sections/atypical.tex:84-91 | 式 (18) 右端热核 | 加宽高斯与桥尾互斥 |
| $A$，$A_y$ | $\{v\ge\nu\}$ 与其八分像 | sections/energy.tex:39-43 | 式 (1) 起点 | 非零势假设无处兑现 |
| $H_0$ | 大固定数，$D_0=H_0\rho$ 之母 | sections/localization.tex:117-118 | 式 (9) 主项 | 密度系数可被误差淹没 |
| $\zeta$ | $r$ 的乘子，第三步选小 | sections/conclusion.tex:33-34 | 隔离与分数尾联立 | 五类失败对账失序 |
| $K$ | 格尺度乘子，第一步取大 | sections/conclusion.tex:25-27 | 下侧占据尾 | $Ck/s^2$ 吸收失败 |
| $\widetilde{\mathfrak q}$ | $\widetilde{\mathbb H}$ 的形式 | sections/atypical.tex:296-309 | 导数不等式右端 | 外幂链失去同一比较对象 |
| $E_k$ | $\widetilde{\mathbb H}$ 递增本征值 | sections/atypical.tex:322-337 | 部分和与移位正部 | 幂 $q$ 的迹界断 |
| $\lambda_k$ | 奇异值递降列 | sections/atypical.tex:225-229 | min--max 压缩 | 式 (19) 换不动 $X$ |
| 色数扇区分解 | $\operatorname{Sym}^N\mathfrak h_e$ 直和 | sections/atypical.tex:396-410 | 无多重度计数 | 大配分乘积界断 |
| 逸度 $e^{-1}$ | 理想 Bose 级数参数 | sections/energy.tex:88-95 | 式 (3) 常数 | $T^{3/2}$ 界重推 |
| $e^{qu}$ 恒等式 | $(u-t)_+$ 的积分表示 | sections/atypical.tex:344-351 | 部分和升全幂 | Tonelli 步骤无凭 |

[探针行 D215：仅用于落盘校验，不作任何后续编辑锚点。]
