# D482 Littlewood 多项式的近似极小极大值与正的极小值：研究笔记

## 0. 开工登记与素材边界

本单编号 D482。开工前我先把 `build` 目录整个探了一遍：`main.tex` 52 行、`sections/` 下七节、`figures/gap-slots.tex` 一张图的源码，合计 86,756 字节，与派单给的数完全吻合；没有第二种 `build/source` 版式。九个文件全部逐字 Read，素材自认读尽。README 只当索引翻了翻题目与日期，图注之外没引它；PDF 与 typst 分片按规矩从未作为正文来源。

需要坦白的一点：这些 tex 呈现的是打磨后的证明，作者真正的弯路不会写在纸面上。我反推思维链的全部依据，是文本留下的选择痕迹：段落安排的次序、像"此处给出这个目标的原因"这类解释性插笔、量词先后的反复申明、以及哪些引理被单独拎出来重证。凡这些痕迹断了的地方，我都写 `[推测]` 并说明缺口在哪，不硬编。

先把两条登记挂在这里：

- preprints/Nearly-minimal-maxima-and-positive-minima-of-Littlewood-polynomials-October-5-2026
- 其他队列第 305 行号

## 1. 最初的动机：双侧平坦能不能一次要齐

一切从帕塞瓦尔恒等式开始。长度为 $N$ 的 Littlewood 多项式 $P(z)=\sum_{k=0}^{N-1}\varepsilon_k z^k$，系数取 $\pm1$，在单位圆上有 $\int_{\T}\lvert P(\e(t))\rvert^2\,dt=N$，于是 $\lVert P\rVert_\infty\ge\sqrt N$ 是铁的（introduction.tex:8-13）。我最初问的问题很朴素：这个下界能不能"基本取到"，即对任意 $\eta>0$，存在长度足够大的符号多项式使最大模不超过 $(1+\eta)\sqrt N$；同时，最小模能不能被一个固定的正数乘 $\sqrt N$ 压住，两侧同时成立。

这两个要求各自都有先例，而且先例彼此隔开很远。Rudin--Shapiro 构造在二进长度给出 $\sqrt{2N}$ 的上界（introduction.tex:38-40），可它的模在圆上有零点，下侧是 0。Kahane 证明了复单位模系数可以做到归一化模一致趋于 1（introduction.tex:41-43），Bombieri 与 Bourgain 跟进过量化版本；但那要求系数可以是复数，实符号这个限制一旦加上，问题立刻变脸。Balister、Bollobás、Morris、Sahasrabudhe、Tiba 五人证明了每个不小于 2 的次数上都有双侧平坦的 Littlewood 多项式：模被两个绝对正常数乘根号长度夹住（introduction.tex:48-51）；而配套的姊妹稿证明最好可能的上常数在一切长度上趋于 1（introduction.tex:52-54）。我盯着这两条线看了很久，确认它们各自都只回答了一半：前者的上界常数是某个松的绝对值，后者的构造里模在某些弧上直接消失。想同时要"上界接近 $\sqrt N$"和"下界至少是 $\sqrt N$ 的固定正分数"，必须由同一组符号做到，任何一条存在性陈述都不自动交出另一条（introduction.tex:54-56）。

所以论文的定理（introduction.tex:18-28）实际宣示的是：对每个 $\eta>0$ 和所有足够大的 $N$，存在实符号使 $\frac1{16}\sqrt N\le\lvert P(z)\rvert\le(1+\eta)\sqrt N$ 在全圆成立。下界常数 $1/16$ 与上界精度无关，这在动笔之初就是我要的形态：精度换不掉正性，二者在极限里各归各。还有一条容易被忽略的强度：结论对单个多项式在每个足够大的长度成立，全圆逐点，包括 $z=1$ 与 $z=-1$ 这两个实点（introduction.tex:30-32）。我在草稿阶段就把"包含实点"记成验收项，因为很多概率式论证恰恰在 $t=0$ 处失控（那里所有同相叠加，随机符号只给 $\sqrt{N\log N}$ 量级）。[推测] 姊妹稿的构造在 $t=0$ 处模不为零是显然的，但"趋近极小"与"避开零点"能否同时严格，作者没写，这大概就是这一篇存在的全部理由。

## 2. 第一条路线：把前人修补术原样搬过来，失败

确定目标后我试的第一条路，是把 Balister 等人的修补思路直接嫁接过来。他们的证明（introduction.tex:81-86）在模小的区域这样做：取一个来自 Rudin--Shapiro 构造的余弦多项式，它的坏点在少数例外弧上；再补一个正弦多项式，在例外弧上大、其余地方小，用偏差估计压住新系数不越界。这个套路在双侧绝对常数的情形很顺，因为上界常数本来就松，补进去的正弦多项式再大一点也不超预算。

问题是我要的上界是 $(1+\eta)\sqrt N$，预算只剩 $\eta\sqrt N$。Rudin--Shapiro 的归一化模上界是 $\sqrt 2$，也就是说它的"主波"离 1 就有 $0.41$ 的差距，我根本没有余量往里加任何固定尺度的修补波。嫁接失败的点非常具体：修补波的振幅与主波在好弧上同量级，一加上去，上界立刻从 $1+o(1)$ 抬回 $1+\Omega(1)$，精度死了。另一头，若把修补波振幅取到 $o(\sqrt N)$，例外弧上的下界又抬不起来。两头不能同时满足，这是纯数量级的否决，与技术无关。[推测] 作者内部大概率先撞过这堵墙，因为 introduction.tex:81-86 特意写了"这里校正作用在姊妹稿的二次波上，其系数代价在上界逼近最小值时趋于零"，这句话的语用功能就是交代与前一条路线的分岔。

第二条试过的路是纯概率。随机取符号，逐点看 $P(\e(t))$：每个固定 $t$ 处它是 $\sqrt N$ 量级的对称随机和，最大值用联合界与网格能压到 $C\sqrt{N\log N}$，离 $(1+\eta)\sqrt N$ 差着 $\sqrt{\log N}$，上界就输了；更糟的是最小模，随机多项式在圆上有零点几乎是必然的（系数的随机傅里叶系数在近 0 处按二维正态算，落进小盘的概率不小），下界连 $o(\sqrt N)$ 都保不住。这条路给的东西与目标在两个方向上都反着，没有任何修补空间。我记下教训：双侧同阶的要求把解空间限定在强结构符号序列上，随机方法与借用旧构造两条直觉路线都要放弃，必须自己造一个"起点低、可修理"的构造。

这里出现本笔记第一个关键判断：既然修补路线被预算否决，那就只能让"主项本身几乎平坦"、"缺陷区域总长可控"、"修补代价随精度参数趋于零"三件事同时成立。这三件事分别对应后面三节的素材：扩散与打包保证主项由互不重叠的二次波组成（spreading.tex, packing.tex），采样刻画小值区域的几何（sampling.tex），校正把小值抬起来而系数代价只有 $O(\sqrt\delta)$（correction.tex）。[推测] 这个三分法是事后结构，动笔顺序是否如此无从考证，但 main.tex:43-49 的输入次序与我推测的依赖链完全一致。

## 3. 转折点：把下界做在取整之前，并非把取整做在……（此处曾写错，见 §10 勘误说明前即改正：思路是顺序倒转）

真正想通的一刻，来自把 introduction.tex:97-107 读成流程约束。取整引理（rounding.tex:12-26）说：若松弛系数 $X\in[-1,1]^N$ 的缺陷质量 $\mu(X)=\frac12\sum_k(1-\lvert X_k\rvert)$ 很小，则存在真符号 $\varepsilon$ 使 $\lVert U_\varepsilon-U_X\rVert_\infty$ 不超过 $C/\sqrt N+C\sqrt{\mu(X)/N\cdot\log(80N/\mu(X))}$（introduction.tex:99-103，归一化形式）。这句话反过来读才是重点：取整是全圆一致的微扰，它抬不高下界，也压不下上界，但它可以毁掉一个勉强及格的下界。所以下界必须在取整之前就被造出来，并且带着余量（introduction.tex:105-107 明写"构造必须在这个取整被施加之前制造出它的正下界"）。

我此前一直把松弛系数到符号的取整当作最后一步"格式化"，像编译器输出目标代码那样指望它不改变语义；这句话说透了语义其实会被改变 $O(\sqrt{\mu\log(1/\mu)})$ 那么多，只不过可以被压得任意小。于是全局图景倒转：先在 $[-1,1]^N$ 的松弛世界里把双侧包络做到 $1/8$ 与 $K_\delta$ 之间（$b=1/8$，$B$ 的上界，见 sampling.tex:22-24），再让校正、缩放、取整各自只吃掉预算的一小条，最后 $\delta\to0$ 时一切误差蒸发，剩下的常数 $1/8$ 除以 $1+o(1)$ 仍大于 $1/16$（completion.tex:64-70）。$1/16$ 并非被精细优化出来的，它就是 $1/8$ 的一半，一半是安全系数：给缩放与取整各留一条命。

倒转之后还剩一个死结：校正波要加在缺陷弧上，可系数只能动 $O(\sqrt{\delta N})$ 那么多（否则取整预算爆掉），还要不新增 $0$ 到 $N-1$ 之外的大量频率。普通正弦修补波的傅里叶系数尺度是 $\sqrt N$，一条都塞不进去。出路是让校正的相位带着 $N$ 倍二次结构：单频系数量级被驻定相位估计压到 $1/\sqrt N$ 乘振幅再乘曲率平方根倒数（correction.tex:261-265），这样"大模的函数"与"小系数"才能共存。这个观察把问题从"加什么函数"变成"怎么排相位导数"，§4 到 §7 的一切设计都是这句话的推论。

还有一点必须在这里记下来，因为它是全篇次序的骨架：$\delta$ 一旦选定，所有辅助维数、频率、区间、光滑截断全部冻结，之后只有 $N\to\infty$（introduction.tex:142-145，completion.tex:2-4）。任何"让辅助量随 $N$ 变"的贪心都会让 $o(1)$ 的意义散架。我把它叫作"先紧后松"纪律，并在 §9 用它在收尾处验收。

## 4. 把系数量摊开：辅助多项式里的宽度预算

写探针一行接在题下：这一节的工程目标，是造一个环面上的实三角多项式 $F$，它几乎满均方、逐点不超 1，且每个傅里叶系数都被一条"宽度"驯服。

先把输出精确抄下来，再反推它为什么长成这样。spreading.tex:24-51 的命题断言：对每个 $0<\delta<1/20$，存在维数 $m$、条数 $r\ge2$、两两不平行的整向量 $a_1,\ldots,a_r$、实值三角多项式 $F$ 与速度向量 $v$，使得 $\mathcal A=\{a_i,-a_i\}$ 是 $F$ 的包含式傅里叶支撑，$\lVert F\rVert_\infty\le1$、$\lVert F\rVert_2\ge1-3\delta$，并且记 $\lambda_a=a\cdot v$，有 $\lambda_a\ne0$、$\sum_{a\in\mathcal A}\lvert\lambda_a\rvert<1$、$\lvert\widehat F(a)\rvert/\sqrt{\lvert\lambda_a\rvert}\le K_\delta$，其中 $K_\delta=\sqrt{(1+\delta)^3/(1-\delta)}$。全部对象只依赖 $\delta$。

宽度这个词来自后面采样用的驻定相位归一化：引理 spreading.tex:58-73 给出对任何支集紧的光滑振幅 $g$ 与固定非零曲率 $\beta$，积分 $\int_{\R}g(x)\e(T\beta x^2/2-ux)\,dx$ 一致于全体实 $u$ 地等于 $\e(\operatorname{sgn}(\beta)/8-u^2/(2T\beta))\,g(u/(T\beta))/\sqrt{T\lvert\beta\rvert}$ 加 $O(T^{-1})$。也就是说每个被二次相位挪到的频率位置，其系数天然带因子 $1/\sqrt{T\lvert\beta\rvert}$；把这条位置分到的"宽度"记作 $w\asymp\lvert\beta\rvert/T$，系数就被 $\sqrt w$ 控制。spreading.tex:9-13 明说"分给宽度 $w$ 的系数大小至多约 $\sqrt w$，这是那个二次积分的归一化"。所以"系数不超宽度的平方根"并非审美，是驻定相位的算术。

我最初以为可以直接用递推多项式 $p_d$ 收工：它已有 $\lvert p_d\rvert\le1$ 与几乎满均方。但把它的每个频率 $s$ 记一个宽度 $w_s$，要求 $\lvert c_s\rvert\le K\sqrt{w_s}$，就得 $w_s\ge\lvert c_s\rvert^2/K^2$，求和得 $\sum_s w_s\ge\sum_s\lvert c_s\rvert^2/K^2=M_d/K^2$，几乎等于 $1/K^2$。而打包引理要的是 $2\sum w_i<1$（spreading.tex:403-405 把严格符号宽度和 $<1$ 作为下游输入），一个 $K$ 稍大就把预算顶穿，两个常数互相卡死。出路只有一条：把每个原始频率拆到许多频率位置上去，每个位置分到更小的系数。多出来的环面坐标正是拆分用的刀。

递推本身（spreading.tex:127-148）值得一说：$p_j=p_{j-1}+\frac{1-p_{j-1}^2}{2}\cos(2\pi y_j)$。用 $\frac{1-z^2}{2}=\frac{(1-\lvert z\rvert)(1+\lvert z\rvert)}{2}\le1-\lvert z\rvert$ 逐点守住 $\lvert p_j\rvert\le1$；对新变量先积分知道均值为零；均方满足 $M_j\ge M_{j-1}+\frac18(1-M_{j-1})^2$（spreading.tex:141-145），极限小于一会导致增量有正下界而矛盾，故 $M_j\uparrow1$，取 $d$ 使 $M_d\ge1-\delta$。支撑几何也很干净：$\mathcal S$ 中向量最后非零坐标必为 $\pm1$，两项不可能相消，平行者必相等或相反，且没有常频率（spreading.tex:150-157）。$D\ge2$ 有具体数字撑着：$p_2$ 在第二个坐标向量处的系数是 $(1-M_1)/4=7/32>0$（spreading.tex:159-166）。这些离散结构后面判"每对符号只取一个代表"时全要用上。

曲率选取是我最佩服的一处设计。先取 $\gamma$ 避开所有 $s^\perp$，记 $\rho_s=\lvert s\cdot\gamma\rvert$；再要挑 $b_1,\ldots,b_D$ 使乘积 $\Delta_s=\prod_j\lvert s\cdot b_j\rvert$ 近似等于 $c\cdot\lvert c_s\rvert^2/\rho_s$。spreading.tex:182-193 罕见地把动机写在纸面上：在大的振荡尺度 $B$ 下，频率 $s$ 会被摊到约 $B^D\Delta_s$ 个位置，每个位置系数约 $\lvert c_s\rvert/\sqrt{B^D\Delta_s}$；给每位置配宽度 $\rho_s/B^D$，全家总宽度正比于 $\Delta_s\rho_s$，于是"系数平方除以宽度"的上界正比于 $\lvert c_s\rvert^2/(\Delta_s\rho_s)$。让 $\Delta_s\rho_s$ 与 $\lvert c_s\rvert^2$ 成同一比例，两侧预算同时平衡，总宽度自动追踪帕塞瓦尔质量 $\sum_s\lvert c_s\rvert^2$。实现是代数的：取 $b_j^0\in s_j^\perp$ 避开别的 $s_l$，再取 $b_j^1$ 把 $s_j\cdot b_j^1$ 定成目标值，令 $b_j=b_j^0+\tau b_j^1$，$\tau$ 充分小就把 $\Delta_s$ 压进 $(1\pm\delta)\tau\lvert c_s\rvert^2/\rho_s$（spreading.tex:195-224）。我读到这里回想自己会怎么做：直接解非线性方程组显然不可行，$\tau$ 的摄动把"$D$ 个乘积条件"变成"$D$ 个单坐标条件"，这是线性代数的老千，但我多半想不到先用超平面排除再摄动。

摊开步骤（spreading.tex:226-270）取紧支撑 $g$ 与 $\bigl(\int g^2\bigr)^D\ge1-\delta$，定义 $G(y,z)=\prod_j g(z_j)\cdot p_d\bigl(y+\frac B2\sum_j b_jz_j^2\bigr)$。$y$ 方向平移不变使频率只可能是 $(s,u)$，且系数分解成乘积 $\widehat G(s,u)=c_s\prod_j I_{s,j}(u_j)$，每个 $I_{s,j}$ 正是那条二次引理的形状，得到 $\lvert\widehat G(s,u)\rvert\le(1+\delta)\lvert c_s\rvert/\sqrt{B^D\Delta_s}$（spreading.tex:257-270）。保留盒 $\mathcal U_s=\{\lvert u_j\rvert\le B\lvert\beta_{s,j}\rvert/2\}$ 的点数由 $\Delta_s$ 控制：$\lvert\mathcal U_s\rvert\le(1+\delta)B^D\Delta_s$（spreading.tex:272-290）。盒数与系数界同源于 $\Delta_s$，这一步把前面曲率调参全部兑现。

盒外尾和（spreading.tex:292-341）是我认为最容易写坏的地方。盒外相位导数满足 $\lvert B\beta x-w\rvert\ge c(B+\lvert w\rvert)$（spreading.tex:298-307），于是逐次分部积分给出 $O_l\bigl((B+\lvert w\rvert)^{-l}\bigr)$ 的衰减（spreading.tex:308-321）；对整格求和外层是 $O(B^{1-l})$ 量级，拼回 $D$ 维得 $\sum_{u\notin\mathcal U_s}\lvert\widehat G(s,u)\rvert=O(B^{D-l})$（spreading.tex:327-337）。取 $l>D$ 就扔掉趋零的总系数质量。这里"引理的逐点误差不能直接对整个格求和"被原文明说（spreading.tex:292-295）：误差项 $\asymp T^{-1}$ 乘无穷多个位置会发散，必须先用振荡自身的衰减，这是我读这段时记下的通用心法：凡是"先求和后估计"的次序都要警惕，这里靠的是"先估计再求和"。

截断 $T_B$ 只留盒内频率，令 $F=T_B/(1+\delta)$（spreading.tex:343-359），实性与 $\mathcal U_{-s}=\mathcal U_s$ 保证 $F$ 实值；再取 $v=\bigl(\gamma/(\tau B^D(1+\delta)^3),0\bigr)$，宽度预算收口：$\sum_{a}\lvert\lambda_a\rvert\le\frac1{\tau(1+\delta)^2}\sum_s\Delta_s\rho_s\le\frac{M_d}{1+\delta}<1$（spreading.tex:385-392），比值界 $\lvert\widehat F(a)\rvert^2/\lvert\lambda_a\rvert\le K_\delta^2$ 同一段落收尾（spreading.tex:393-399）。$2\sum_i w_i<1$ 从此成立，打包引理的输入备齐；$F$、支撑与速度在 $N$ 变动之前全部冻结（spreading.tex:403-408）。

## 5. 打包带符号的区间：随机槽位与超图匹配

打包引理（packing.tex:19-31）要的结论很短：给定两两不平行的 $a_1,\ldots,a_r\in\Z^m\setminus\{0\}$ 与满足 $2\sum_i w_i<1$ 的正宽度，存在 $H$ 与环面点 $\theta_1,\ldots,\theta_H$，使 $2rH$ 个闭区间 $I(\sigma a_i\cdot\theta_h,\,w_i/H)$ 两两不交。难点第一行就写明了（packing.tex:5-9）：每一组中心不能各挑各的，它们必须来自同一个环面点上若干整线性型的取值。也就是说我们要 $H$ 个点，令它们像的区间在全圆互不打架。

我先试的直觉是随机撒点。单个 $\theta$ 时，$r$ 个型值的相关性由秩 $b$ 控制，两两不平行只保证每对型值联合均匀，逐对碰撞概率约 $2(w_i+w_l)$，对全部对有 $2(r-1)\sum w$ 量级的联合界，$r$ 一大就爆表。多组点再加一层组间碰撞，随机法连"$H$ 组各自相容"都保证不了，遑论组间互不重叠。这里我卡了一阵，直到看清问题其实是组合的：把可能的中心排成槽位，"一型一个槽、彼此由同一个 $y$ 生成"当作超边，组间互斥就是匹配。超图工具于是登场。

输入是 Pippenger--Spencer 定理的定量版本（packing.tex:42-52，量词照 Alon--Yuster 的引理陈述）。$r$ 一致超图若度数全部集中在 $(1\pm\beta)D$ 而共度小于 $\beta D$，边集可分成至多 $(1+\gamma)D$ 个匹配。推论（packing.tex:54-59）：满足条件的列有覆盖 $(1-o(1))$ 比例的匹配，因为总边数 $\sim\lvert V\rvert D/r$，最大匹配至少 $\lvert V\rvert/r$ 成色。我在草稿里问过自己为什么不用 Lovász 局部引理：坏事件（两个槽被同一需求占用）的依赖度随 $q$ 增长，对称形式给不出正比例的余量；这条比较属于我的重构，文中没有明说，[推测]。

构造的第一层是离散化。取 $\alpha_i>2w_i$ 且 $\sum_i\alpha_i=1$，用大偶数逼近得到固定奇数 $L_i$，令 $L=\sum L_i$，则 $w_i<L_i/(2L)$（packing.tex:70-80）。间距 $1/q$ 的网格上，型 $i$ 的槽长 $L_i/q$；目标是匹配大小 $H\sim q/(2L)$，使真正的区间长 $w_i/H$ 严格落进槽里。第二层是算术：取充分大的素数 $q$，避开一个非零 $b$ 阶子式与每对行的二阶子式的素因子，保证型组在 $\mathbb F_q$ 上保秩（packing.tex:82-88）。把 $\{1,\ldots,(q-1)/2\}$ 分成 $R=\lfloor\sqrt q\rfloor$ 长的块，残块除外（packing.tex:90-94）。每个块内部独立地把周期槽型做随机平移，只留完整落入块中的槽；每个保留槽再以等概率定向成中心 $c$ 或 $-c$（packing.tex:96-104）。$L_i$ 取奇数是为了中间格点 $c$ 是整数，这个细节我起初以为是讲究，读到从槽到区间的收尾（packing.tex:280-284）才明白它换来区间关于中点对称。

计数先立起来：每个实现中每型顶点数是 $q/(2L)+O(q/R+1)$（packing.tex:106-111）；内部格点成为型 $j$ 定向中心的概率恰是 $p=1/(2L)$（packing.tex:112-123），不同块的槽选择相互独立。边定义为：给每型各取一个顶点、定向中心 $s_1,\ldots,s_r$，若 $a_i\cdot y=s_i$ 在 $\mathbb F_q^m$ 可解，则成一边，每条边恰有 $q^{m-b}$ 个生成向量（packing.tex:125-133）。度数经纤维平均写成 $d(i,s)=q^{b-1}Z_{i,s}$（packing.tex:135-147），共度不超过 $q^{b-2}$（packing.tex:148-155）。

真正精巧的是为什么矩可以算。联合独立的梦想要不得：型组只有秩 $b$，线性关系在所难免。策略是把关系挑出来删掉。对 $s$ 排除使 $a_j\pm a_l=ca_i$ 且 $\lvert cs\rvert_q\le R$ 的例外中心，集合 $E_i$ 大小 $O(R)$（packing.tex:163-179）。固定 $s\notin E_i$，在纤维 $a_i\cdot y=s$ 上随机取 $y$：其余型值要么联合均匀、要么被例外排除拦下，落回非内部格点、零或本块 $Q_s$ 的概率合计 $\tau_q=O(q^{-1/2})$（packing.tex:181-191）；同一块内两像相遇迫使和或差折回 $\le R$，用并集界（packing.tex:193-203）得到"其余 $r-1$ 个评估落在互异的他块内部"对外 $O(q^{-1/2})$ 比例外的纤维成立。块与块之间槽随机化独立，条件一阶矩与二阶矩就是 $p^{r-1}+O(q^{-1/2})$ 与 $p^{2(r-1)}+O(q^{-1/2})$（packing.tex:219-237）。我在这一段的批注：方差被 $q^{-1/2}$ 吃掉，靠的是块长 $R\asymp\sqrt q$ 与例外集 $O(R)$ 的平衡，$R$ 再大例外就肥，再小独立块数就不够，这是全文最像"调参艺术"的一处。

收口是标准的花活：切比雪夫说度离群的已现顶点条件概率 $O(q^{-1/4})$，期望坏点数 $O(q^{3/4})$，加上例外中心类 $O(q^{1/2})$，马尔可夫取到一个实现坏点不超过 $q^{7/8}$（packing.tex:239-253）；删掉它们与关联边，幸存度只被共度总和扰动 $q^{7/8}q^{b-2}=O(q^{-1/8}D_q)$（packing.tex:255-261），于是 Pippenger--Spencer 全部前提成立，得到匹配 $H=(1+o(1))q/(2L)$（packing.tex:261-271）。最后从槽到闭区间：槽 $t,\ldots,t+L_i-1$ 给区间 $[(t-\tfrac12)/q,(t+L_i-\tfrac12)/q]$，正半圆内互不重叠，反射到另一半；$w_i/H<L_i/q$ 保证每个目标区间严格藏进自己的槽或反射槽（packing.tex:273-299）。打包好的弧避开 $0$ 与 $1/2$，且素数与匹配一旦选定就与后面的长度 $N$ 无关，有限域不给 $N$ 施加任何算术限制（packing.tex:302-307）。这句"无算术限制"是特意写给读者的，我猜是给"为什么 $N$ 可以逐整数取"这一质疑打的补丁，[推测]。

## 6. 采样：小值区域在取整之前就得看清

采样一节交付的起点结构（sampling.tex:17-63）有五个配件：光滑偶函数 $B:\T\to[0,K_\delta]$；对每个正整数 $N$ 的松弛系数 $Y_{N,k}\in[-1,1]$；光滑复值 $B_N$ 满足 $B_N(-t)=\overline{B_N(t)}$、$\lvert B_N(t)\rvert=B(t)$、$\lVert U_{Y_N}-B_N\rVert_\infty=O_\delta(N^{-1})$；质量 $\int_\T B^2\ge1-7\delta$ 与 $\frac1N\sum_k Y_{N,k}^2\ge1-8\delta$；以及缺口清单 $J_j=[u_j,v_j]$，总长 $L\le C_0\delta$，$C_0=10$，加上转移端点的局部相位公式 $B_N=B\,\mathrm{e}(\alpha_z+N\psi_z)$、$x_z=\psi_z'(z)\in(0,1)$。

我把这节的逻辑压缩成一句话：让主项的模与 $N$ 无关，小值区域才能当"固定地形"来修。地形随 $N$ 抖动的话，§7 的校正就没了靶子。实现靠三点合一。第一，打包给出的弧 $I_{a,h}=-a\cdot\theta_h+[-\frac{\lvert\lambda_a\rvert}{2H},\frac{\lvert\lambda_a\rvert}{2H}]$ 两两不交且避开 $0$ 与 $1/2$：包含这两点的弧会与其反射弧 $I_{-a,h}$ 相撞（sampling.tex:169-181）。第二，截断函数按块取：$\chi_h$ 支撑严格落在第 $h$ 块 $((h-1)/H,h/H)$，从零严格升到高度一的平台再严格降下，平台正长度，$\sum_h\int\chi_h^2\ge1-\delta$（sampling.tex:183-194）。第三，系数沿二次路径采样：$Y_{N,k}=\sum_h\chi_h(k/N)F\bigl(k\theta_h+\frac N2 v(k/N-x_h^*)^2\bigr)$，其中 $x_h^*=(h-\frac12)/H$（sampling.tex:195-203）。每个 $k$ 至多一个截断非零，$F$ 实值且 $\lVert F\rVert_\infty\le1$，所以 $Y_{N,k}$ 落在 $[-1,1]$，这个"自动守恒"我读到时很欣赏：范数约束没有被强行投影，是结构自己带的。

把 $F$ 按频率展开后对 $k$ 求和，核心工具是离散二次和的均匀公式（sampling.tex:72-100）：$\frac1{\sqrt N}\sum_k\chi(k/N)\mathrm{e}(\beta k+\frac{N\lambda}2(k/N-x_*)^2)$ 对 $\beta$ 在紧集上一致地等于 $\frac1{\sqrt{\lvert\lambda\rvert}}\sum_\ell\chi(x_{\beta,\ell})\mathrm{e}(\frac{\operatorname{sgn}\lambda}8+N\omega_{\beta,\ell})+O(N^{-1})$，右端非零项只在固定有限指标集里。证明走泊松求和（sampling.tex:102-157）：$|\ell|>Q$ 的项相位导数 $\ge\lvert\ell\rvert/2$，两次分部积分给出尾和 $O(N^{-3/2})$，先统一截掉，再对有限个 $\ell$ 逐个上 §4 的均匀二次引理。次序又是关键：若先对每个 $\ell$ 用引理再加误差，误差的 $\ell$-求和发散；先截尾后展开才成立。这和我在 §4 记下的"先估计再求和"是同一课。

由展开式（sampling.tex:217-227），一项非零必须 $x_{a,h,\ell}(t)$ 落回第 $h$ 块，等价于 $t\bmod 1\in I_{a,h}$；弧不交使每组 $t$ 至多一对 $(a,h)$ 起作用，弧长小于一再限定至多一个 $\ell$。于是 $\lvert B_N(t)\rvert$ 恰好等于不依赖 $N$ 的 $B(t)=\sum\frac{\lvert c_a\rvert}{\sqrt{\lvert\lambda_a\rvert}}\chi_h(x_{a,h,\ell}(t))$，且 $0\le B\le K_\delta$（sampling.tex:241-256）。$B$ 在 $0$ 与 $1/2$ 附近为零；埃尔米特对称来自把 $(t,a,\ell)$ 换成 $(-t,-a,-\ell)$ 时相位与符号一起取反（sampling.tex:257-263）。质量算得毫不含糊：弧上 $x$ 到 $t$ 的变量替换雅可比是 $\lvert\lambda_a\rvert$，逐项相消后 $\int_\T B^2=\lVert F\rVert_2^2\sum_h\int\chi_h^2\ge(1-3\delta)^2(1-\delta)\ge1-7\delta$（sampling.tex:265-276）；再用一致逼近与帕塞瓦尔把 $\frac1N\sum Y_{N,k}^2$ 顶到 $1-8\delta$（sampling.tex:277-284）。

地形的测绘（sampling.tex:286-315）：每条弧驮一个高 $\frac{\lvert c_a\rvert}{\sqrt{\lvert\lambda_a\rvert}}$ 的丘；高度不低于 $b=\frac18$ 的丘贡献一个正长度闭区间，平台设计保证"恰好等于 $b$"的临界丘也给正长度，矮丘与零系数什么都不贡献，于是超水平集 $\{B\ge b\}$ 是有限个不交闭区间，补区间闭包就是缺口 $J_j$。总量估计用两头夹：$1-7\delta\le\int B^2\le b^2\lvert E\rvert+K_\delta^2(1-\lvert E\rvert)$，解出 $L\le\frac{K_\delta^2-1+7\delta}{2(K_\delta^2-b^2)}\le10\delta$，其中 $\delta<1/100$ 时 $K_\delta^2-1\le5\delta$、$K_\delta^2-b^2\ge1-\frac1{64}$（sampling.tex:300-315）。缺口总长与 $\delta$ 同阶，这就是"缺陷区域小"的定量兑现。

端点信息是留给 §7 的接头零件（sampling.tex:317-333）：转移端点 $z$ 处连续给出 $B(z)=b>0$，其邻域里展开式只剩一项，取 $\alpha_z$ 吸收系数相位后局部公式成立；求导得 $\psi_z'(z)=x_{a,h,\ell}(z)\in((h-1)/H,h/H)\subset(0,1)$。我特意在笔记本上圈了这个导数区间：$x_z\in(0,1)$ 之后要同时扮演两个角色，一是校正波在端点的导数对接值，二是外频率的"导数包含"条件里离端点 $0,1$ 有正距离的那个 $c_\delta$。一个区间两处消费，这就是为什么采样时截断支撑被锁进开区间块内。

## 7. 校正波：导数对接、仿射余量与槽位分离

校正命题（correction.tex:20-64）是全文的心脏。输入恰是 §6 输出的两条几何与局部相位性质（correction.tex:26-48 逐字复述），结论：存在绝对常数 $D$，对每个充分大的 $N$ 有连续函数 $R_N$，埃尔米特对称、支撑在缺口及其反射上，满足包络 $b-o(1)\le\lvert B_N+R_N\rvert\le K_\delta$（correction.tex:53-55）、逐系数代价 $\max_{0\le k<N}\sqrt N\,\lvert\widehat R_N(k)\rvert\le D\sqrt\delta$（correction.tex:56-57）、外频率尾巴 $\sum_{k\notin\{0,\ldots,N-1\}}\lvert\widehat R_N(k)\rvert=O_\delta(N^{-1/4})$（correction.tex:58-59），且每个 $\widehat R_N(k)$ 为实数。

设计从"导数从哪来"开始。缺口端点里，转移端点已有规定导数 $x_z$，另两个端点补成 $x_0=x_{1/2}=\frac18$（correction.tex:75-77）。给每个缺口分配一个导数槽 $D_j=[p_j,q_j]\subset(\frac14,\frac34)$，宽 $s_j=\frac{l_j}{4L}$，两两不交、端点不碰任何规定 $x_z$；可行性全在 $\sum_j s_j=\frac14$：先带正间距塞进 $(\frac14,\frac34)$，再整体平移避开有限多个禁止等式（correction.tex:79-88）。槽的作用在傅里叶侧才显形：中段上导数线性扫过 $D_j$，给定 $k$ 时 $k/N$ 至多落入一个槽的 $\rho$-邻域，于是驻定贡献至多来自一个缺口对（原弧加反射），图 figures/gap-slots.tex:64-85 的那半边画的就是这件事。

导数函数 $\xi_j$ 分三段线性插值：外段 $[u_j,u_j+h_j^-]$ 从 $x_{u_j}$ 到 $p_j$、中段从 $p_j$ 到 $q_j$、外段到 $x_{v_j}$（correction.tex:100-110）。两条预算在此分立：外段长可任意短，斜率绝对值任意大，用 $\sum\lvert\xi_j'\rvert^{-1/2}\le\sqrt\delta$ 买断（correction.tex:112-118）；中段斜率 $d_j\ge\frac1{4L}$ 有下界（correction.tex:119-123）。原函数 $\phi_j$ 逐段二次、整体 $C^1$，且由端值都在 $(0,1)$ 得到包含关系 $c_\delta\le\phi_j'\le1-c_\delta$（correction.tex:124-131）。我当时纠结过一个问题：端点规定值 $x_z$ 与槽 $(\frac14,\frac34)$ 的相对位置没有限制，外段扫过时会不会穿过别的槽惹祸？答案写在 correction.tex:95-98 的预告里：穿越段的贡献按"短区间大曲率"另行控制，即靠外段预算一次性买单。先欠账后还款，读第二遍才看清这是全文反复出现的记账法。

相位对接是第二根支柱。取振幅 $A=\frac12$（correction.tex:138），在 $J_j$ 上令校正为 $A\,r_{j,N}(t)\mathrm{e}(N\phi_j+\gamma_{j,N})$，其中仿射调整 $\gamma_{j,N}$ 的端值由 $\mathrm{e}(N\phi_j(z)+\gamma_{j,N}(z))$ 等于既有波的相位 $B_N(z)/b$（转移端点）或 $1$（$0,\frac12$）决定（correction.tex:139-148）。分工很清楚：$\phi_j'(z)=\psi_z'(z)$ 让两列波在端点同"速度"，$\gamma_{j,N}$ 把"位置"也对到整数倍相位之外；$\gamma_{j,N}'\le l_j^{-1}$、全变差 $\le1$，斜率与 $N$ 无关（correction.tex:149-153）。$B_N$ 的局部公式里系数相位已并进 $\alpha_z$，所以端点条件可以逐点独立 impose，注意这里每个单位圆点都有 $[0,1)$ 内的辐角代表，两端可以分别挑（correction.tex:146-148）。

缓入条带宽度取 $w=N^{-3/4}$（correction.tex:155-161），两条要求各怀心事：$Nw^2\to0$ 保条带上相位对齐（误差 $C_\delta(Nw^2+w)=O_\delta(N^{-1/2})$，correction.tex:203-214），$(Nw)^{-1}\to0$ 保外尾巴趋零（correction.tex:387-393）。我起初想把 $w$ 取得更小省事，算一遍才明白 $w$ 太小会让 $\sup\lvert a'\rvert\le C_\delta w^{-1}$ 这类振幅导数失控（correction.tex:331-339），$N^{-3/4}$ 恰是两头的几何平均，没有多少自由度。幅形因子 $r_{j,N}$ 由光滑台阶 $\vartheta$ 相乘，在转移端点无限阶消失、离开条带恒为一，$\int\lvert r_{j,N}'\rvert\le2$（correction.tex:162-174）。定义完成后延到负半圆靠埃尔米特对称；$R_N(0)=R_N(1/2)=A$ 使 $z=\pm1$ 两点被直接盖住（correction.tex:184-191），这是验收项"包含实点"的兑现处。

模的下界分三块查：缺口内离开条带，反三角不等式给 $\lvert B_N+R_N\rvert\ge A-b=\frac38$（correction.tex:198-202）；条带上两波相位差 $O_\delta(N^{-1/2})$，合并成 $B+A\,r_{j,N}+O_\delta(N^{-1/2})$ 且 $B\ge b-O_\delta(w)$（correction.tex:215-221）；缺口外 $R_N=0$、$B\ge b$。上界一侧同样简单：缺口内 $\le b+A=\frac58<K_\delta$。真正花力气的是系数代价。把 $\widehat R_N(k)$ 按缺口分段成 $\int_I a\,\mathrm{e}(N\phi-kt)$（correction.tex:233-255），备好两条振荡积分：曲率非零的二次段给 $C\bigl(\sup\lvert a\rvert+\int\lvert a'\rvert\bigr)/\sqrt{N\lvert d\rvert}$（correction.tex:259-270），远离驻点的一阶导数界给 $C(\cdots)/(N\rho)$（correction.tex:271-279）。振幅的绝对界 $\sup\lvert a\rvert+\int\lvert a'\rvert\le A+2A+2\pi A=:C_1$ 与缺口长短、个数无关（correction.tex:250-257），这是把"绝对常数 $D$"从幻象变成真物的关键一行。汇总：外段合计 $2C_2\sqrt\delta/\sqrt N$；驻点槽及反射 $4C_2\sqrt L/\sqrt N$；其余中段 $O_\delta(N^{-1})$。于是 $\sqrt N\lvert\widehat R_N(k)\rvert\le2C_2\sqrt\delta+4C_2\sqrt L+O_\delta(N^{-1/2})$，由 $L\le10\delta$ 取 $D=2C_2+4\sqrt{10}\,C_2+1$ 收工（correction.tex:281-307）。

外尾巴走两次分部积分。记 $V=N\phi'-k$，导数包含给出 $\lvert V\rvert\ge c_\delta(N+\lvert k\rvert)$、$\lvert V'\rvert\le C_\delta N$、$V''=0$（correction.tex:316-330）；第一次积分的边界项在缺口内部拼接处相消（$\phi_j'$ 连续）、在转移端点因振幅消失、在 $0$ 与 $\pm\frac12$ 的反射接缝处因两侧导数值同为 $x_0$、$x_{1/2}$ 且幅值同为 $A$、$A(-1)^k$ 而相消（correction.tex:341-355），我在图上比对了很久才确认全圆拼接无漏缝。第二次不再需要相消，逐点界 $C_\delta\bigl(w^{-1}/T^2+N/T^3+N^2/T^4\bigr)$ 对 $T=N+\lvert k\rvert$ 求和得尾巴 $\le C_\delta(Nw)^{-1}=O_\delta(N^{-1/4})$（correction.tex:357-395）。尾巴绝对可和还顺手换来傅里叶级数一致收敛到 $R_N$ 本身，投影回 $0\le k<N$ 只扰动 $O_\delta(N^{-1/4})$（correction.tex:398-407），系数区间限制这条死约束，就这样被绕开而不损失一致效应。

## 8. 取整：把缺陷质量折算成全圆误差

取整引理（rounding.tex:12-26）说：绝对常数 $C$ 使任何 $X\in[-1,1]^N$ 都有符号 $\varepsilon$ 满足 $\max_t\lvert\sum_k(\varepsilon_k-X_k)\e(kt)\rvert\le C\bigl(1+\sqrt{\mu(X)\log(80N/\mu(X))}\bigr)$，$\mu(X)=\frac12\sum_k(1-\lvert X_k\rvert)$；$\mu=0$ 时取 $\varepsilon=X$ 误差为零。除以 $\sqrt N$ 就是 §1 记下的归一化形态。我在这个引理上栽过一次认知错误：先入为主以为它是概率方法的收官（随机翻转加联合界），读完证明才发现随机性只出现在 Lovett--Meka 存在性一步，其余全是确定性记账。

先把矩阵化偏差引理立起来（rounding.tex:36-97）。 Lovett--Meka 定理的存在性推论（rounding.tex:45-68）：给 $v_1,\ldots,v_R\in\R^u$、起点 $x_0\in[-1,1]^u$、非负数 $c_i$ 满足 $\sum_i\exp(-c_i^2/16)\le u/16$，则对每个充分小的 $\eta>0$ 存在 $x\in[-1,1]^u$ 使 $\lvert\langle v_i,x-x_0\rangle\rvert\le c_i\lVert v_i\rVert_2$ 且至少 $u/2$ 个坐标 $\lvert x_k\rvert\ge1-\eta$。$\eta\to0$ 紧收敛取列，得至少 $\lceil u/2\rceil$ 个坐标直接落在符号上（rounding.tex:61-68）。贪心循环：每阶段对未定符号的 $u$ 个坐标限制行、取 $c_i=4\sqrt{\log(16R/u)}$，阈值和恰为 $u/16$，行欧氏范数至多 $\sqrt u$，本步每条行和只动 $4\sqrt{u\log(16R/u)}$，同时固定至少一半坐标（rounding.tex:70-80）。阶段误差求和时 $u_h\le2^{-h}s$，级数 $\sum_h2^{-h/2}\sqrt{1+h\log2/L}$ 收敛（rounding.tex:83-96），得 $C_0\sqrt{s\log(2R/s)}$。我仿了一遍这个循环：瓶颈全在"每步至少半数为 $\pm1$"这个来自随机游走的杠杆；没有它，逐坐标取整的误差会按移动坐标个数线性累加。

回到一维。写 $X_k=\sigma_k(1-2p_k)$，$\sigma_k$ 为符号位、$p_k=\frac{1-\lvert X_k\rvert}{2}\in[0,\frac12]$、$\sum p_k=\mu$（rounding.tex:105-115）。网格取 $M=20N$、$R=40N$：矩阵 $A$ 的行是网格点上带符号位的余弦与正弦（rounding.tex:117-125），选列即选坐标，把"翻转哪些缺陷"翻译成矩阵语言。先向下取整到 $2^{-J}$ 格：$p^{(J)}_k=2^{-J}\lfloor2^Jp_k\rfloor$，质量不减、初始误差 $\le N2^{-J}\le1$（rounding.tex:127-135）。归纳下降 $j=J,\ldots,1$：设 $S_j$ 为 $2^jp^{(j)}_k$ 为奇数的坐标集、$s_j=\lvert S_j\rvert$，对 $S_j$ 的列用矩阵引理得 $\xi$，然后做全文我最得意的小动作：整组翻转 $\xi\to-\xi$ 使 $\sum_{S_j}\xi_k\le0$（rounding.tex:144-155）。$p^{(j-1)}=p^{(j)}+2^{-j}\xi$ 逐坐标仍落在 $[0,1]$（奇数加 $\pm$ 仍是偶数、不越端点），质量不升，而联合界一侧偏差纹丝不动。这个"偏哪个方向省质量就走哪个方向"的对称选择，把不等式的方向性白捡了一次。

步误差 $\le C_0\,2^{-j}\sqrt{s_j\log(80N/s_j)}$（rounding.tex:156-165）。缺陷质量在此进场：$S_j$ 中每坐标至少值 $2^{-j}$，故 $s_j\le\min(N,2^j\mu)$（rounding.tex:167-170）；$f(s)=s\log(80N/s)$ 在 $(0,N]$ 增，两支各自放缩后统一成 $2^{-j}\sqrt{2^j\mu\,L_\mu}$，$L_\mu=\log(80N/\mu)$。求和得网格误差 $\le1+\frac{C_0}{\sqrt2-1}\sqrt{\mu L_\mu}$（rounding.tex:171-193）。空阶段贡献为零，不必用空列集调用引理，这句防御（rounding.tex:192-193）是给严谨性补的门闩。

从 $20N$ 个网格点到整个圆用的是解析的小台阶：误差多项式 $Q(z)=\sum_k(\varepsilon_k-X_k)z^k$，对 $Q$ 与其倒转 $z^dQ(1/z)$ 用最大模原理，在 $|z|\le1+1/N$ 上 $\le eS$；柯西估计给单位圆上每点半径 $1/N$ 盘内 $\lvert Q'\rvert\le eNS$，于是 $\lvert\frac{d}{dt}Q(\e(t))\rvert\le2\pi eNS$；每点到网格圆弧距离 $\le\frac1{2M}$，积分回来得 $S\le G+\frac{\pi e}{20}S$，分母 $1-\pi e/20$ 为正（rounding.tex:208-234）。系数 $\frac{\pi e}{20}\approx0.427$，$M=20N$ 这个看起来随意的数其实是被这个比值选的：放大网格倍数就是压低这项，但 $R=2M$ 又进矩阵引理的对数，$20N$ 是够用的折中，[推测]作者试过别的常数。$N=1$ 时 $Q$ 为常数，同法覆盖（rounding.tex:234-235）。整条链看完，我把引理的本质记成一句话：全圆误差由"缺陷总质量乘对数"控制，取整对结构是温和的，前提是质量真的小。质量小从哪里来？§7 的 $D\sqrt\delta$ 就是它的来源，这就接到收尾。

## 9. 收尾：量词次序就是证明本身

completion.tex 只有 85 行，但它把前面所有零件按唯一正确的次序咬合。第 2-4 行先立规矩：精度参数 $\delta$ 定下全部辅助数据，之后长度才趋于无穷；我把它当作验收清单的第一项，因为这是全文唯一一处把量词写在正文开头的地方，作者显然知道这里有坑。

拼装：取 $b=\frac18$、$D$ 为校正命题的绝对常数；$\delta$ 固定后拿起点系数 $Y_{N,k}$、函数 $B_N$（起点命题）与校正 $R_N$（校正命题）。令 $s_\delta=D\sqrt\delta$、$S_\delta=1+s_\delta$，再令 $X_{N,k}=\frac{Y_{N,k}+\sqrt N\,\widehat R_N(k)}{S_\delta}$，$0\le k<N$（completion.tex:13-19）。三步检查。第一步合法性：埃尔米特对称使 $\widehat R_N(k)$ 为实数（correction.tex:308-314 早已备好这句），$\lvert Y_{N,k}\rvert\le1$ 加 $\sqrt N\lvert\widehat R_N(k)\rvert\le s_\delta$，除以 $S_\delta$ 恰把超出的 $s_\delta$ 摊平，$X_N\in[-1,1]^N$（completion.tex:20-22）。这里除法就是"小幅重标回箱内"，预算由 §7 的第一条傅里叶估计专门供养，introduction.tex:129-131 预告过的"重标回 $[-1,1]$"在此兑现。第二步外形：一致逼近加外尾投影误差合成 $\lVert U_{X_N}-\frac{B_N+R_N}{S_\delta}\rVert_\infty=o(1)$（completion.tex:23-28），于是 $\min\lvert U_{X_N}\rvert\ge\frac b{S_\delta}-o(1)$、$\lVert U_{X_N}\rVert_\infty\le K_\delta+o(1)$（completion.tex:30-34，第二条用到 $S_\delta\ge1$）。第三步质量：同一系数界反过来用，$\lvert X_{N,k}-Y_{N,k}\rvert\le2s_\delta$、$\lvert X_{N,k}^2-Y_{N,k}^2\rvert\le4s_\delta$，配 $1-\lvert x\rvert\le1-x^2$ 与起点均方下界，缺陷率 $\frac{\mu(X_N)}N\le4\delta+2D\sqrt\delta=:q_\delta$（completion.tex:37-51）。我核对过这个放缩的方向性：$1-\lvert X_k\rvert\le1-X_k^2$ 在 $\lvert X_k\rvert\le1$ 恒成立，把"离箱壁近"读成"平方接近一"，正负号没有反的余地。

取 $\delta$ 使 $q_\delta<\frac12$；$q\mapsto q\log(80/q)$ 在 $(0,\frac12]$ 增，故取整引理交出符号使全圆误差 $\le\frac C{\sqrt N}+C\sqrt{q_\delta\log(80/q_\delta)}$（completion.tex:52-60；$\mu=0$ 的例外直接取 $\varepsilon=X$，completion.tex:61-62）。最后一步是纯极限游戏：$\delta\downarrow0$ 时下包络 $\frac b{S_\delta}$ 减取整项趋 $\frac18$、上包络 $K_\delta$ 加取整项趋 $1$；固定 $c=\frac1{16}$，对任意 $\eta>0$ 先选 $\delta$ 让两式分别严格越过 $c$ 与 $1+\eta$，冻结该 $\delta$ 的全部数据，再取 $N_0$ 把 $o(1)$ 压进这两条严格余量之内（completion.tex:64-76）。得到 $c\le\lvert U_\varepsilon(t)\rvert\le1+\eta$ 全圆成立，乘 $\sqrt N$ 即主定理（completion.tex:77-80）。我特别记下"严格"二字出现的位置：不等式必须在选 $N_0$ 之前已经严格，否则 $o(1)$ 可能吃掉全部余量；这一处与 §3 的"先紧后松"纪律首尾呼应。

收尾还回扫了实点：取整 assigns 符号给连续指标 $0,\ldots,N-1$，一切估计在 $t=0$ 与 $t=\frac12$ 都成立，逐整数长度无遗漏（completion.tex:81-84）。§7 里 $R_N(0)=R_N(1/2)=A$ 的伏笔、§6 里弧避开 $0,\frac12$ 的伏笔，在这里合并成交货。现在回头看预算表：$1/16$ 之于一半的 $1/8$，是给缩放因子 $S_\delta$、取整项、外尾投影三项合吃的余量；三项各自 $O(\sqrt\delta)$、$O(\sqrt{q_\delta\log(1/q_\delta)})$、$O_\delta(N^{-1/4})$，而 $K_\delta-1=O(\delta)$，故 $\delta\to0$ 后剩下的是 $[\frac18,1]$ 的干净区间，随便除以二都活得下来。作者没有优化常数，这是审美的选择：下界常数与上界精度解耦（introduction.tex:30），定理的卖点就这一句。

## 10. 最终思路与最初设想的差距

把 §1 到 §9 合上，我对照动笔前的想象，发现几乎每一块都走了另一条路，差距值得逐条记下。

第一条差距是关于"构造"的想象。我最初以为定理会以一个显式公式收尾：给定 $N$，写出 $\varepsilon_k$ 的生成规则，像二进制的 Rudin--Shapiro 那样可以逐项计算。成品完全不是这样：辅助多项式 $F$ 的支撑、打包用的素数 $q$ 与匹配、Lovett--Meka 的存在性输出，全都是选择性的存在声明，$N_0(\eta)$ 也没有可计算的速率。构造在"每步可复现"意义下是有效的，在"给出算法"意义下是无效的。我为此调整了验收标准：证明里每一个非构造性选择都在 $\delta$ 冻结时完成一次，$N$ 一侧只剩解析估计，这种"有限非有效性藏在常数里"的形态，恰好把定理陈述中的"存在实符号"顶满。

第二条差距是关于校正的形态。动笔前我设想修补小值区域要用"另一个频率段"的波，与主波在谱上分离，靠能量论据互不侵犯；这样系数当然会跑到 $0$ 至 $N-1$ 之外，我便以为必须接受一个外部谱的代价。实际的方案相反：校正波用的正是主波同款二次相位语法，谱代价通过驻定相位压回 $O(\sqrt\delta)$ 每条系数，外尾巴靠 $N^{-3/4}$ 缓入条带的绝对可和被投影截掉（correction.tex:378-395、correction.tex:398-407）。"同语法修补"让端点相位对接成为可能：导数相同、辐角差归仿射调整管，波在开进来时不会互相打架（correction.tex:203-214）。这一手我在 §7 之前完全没有预料到，是全文对我个人最大的信息量。

第三条差距是"宽度"这个账本概念。我原以为 flatness 证明的核心是振幅与相位的分析，谱侧只是记账。实际读下来，§4 整节（摊开系数量）与 §5 整节（打包区间）都为同一个纯组合的预算服务：$\sum_{a}\lvert a\cdot v\rvert<1$ 这一条严格不等式（spreading.tex:385-392）是上下游的通货，上面兑换"系数不超 $\sqrt{2\text{宽度}}$"的分析归一化（spreading.tex:9-13），下面兑换打包引理输入 $2\sum_i w_i<1$（spreading.tex:403-405），再往下兑换弧不交、模与 $N$ 无关（sampling.tex:241-256）。分析paper里出现一个像汇率一样的标量，我读完两遍才把它画成一张三线表。

第四条差距在取整的定位。§2 里我把取整当"格式化工具"，把下界当它的产物之一；§3 的倒转之后，取整成了纯预算项，一切结构性工作在松弛世界完成，真符号只在最后一步以 $O(\sqrt{q_\delta\log(1/q_\delta)})$ 的过路费出场（completion.tex:52-60）。最初设想中"符号性"是主角，最终它只是收尾的守门人：Littlewood 约束的全部重量由 $[-1,1]^N$ 上的几何承担，由 $\mu$ 这个缺陷质量传感器转译。

第五条差距小但有趣：我猜想过下界常数会写成 $\frac1{16}$ 是因为某种锐利估计恰好到 $1/16$。读完 completion.tex:64-70 后确认没有这回事，$\frac b{S_\delta}$ 的极限是 $\frac18$，取半纯粹是留命余量，且论文明说下界常数与上界精度无关（introduction.tex:30-31）。锐利版留给姊妹稿与后续，这里要的是"正的、绝对的、与精度解耦"。

## 11. 还没解决的问题与我的后续清单

合上手记前留三个开放点，都来自素材内部说漏的缝。第一，$1/16$ 与 $1$ 之间的余量到底能压到哪：把 $b$ 提到与 $K_\delta$ 同阶需要在校正振幅 $A=\frac12$（correction.tex:138）上做文章，但 $A-b$ 与 $b+A$ 两条包络夹在中间（correction.tex:198-202、correction.tex:224-225），单纯放大 $A$ 会顶穿上界，除非缺口质量占比再降；这条链上每一环的损耗率我还没量化，[推测] 需要回姊妹稿的最优性陈述配合。第二，$N_0(\eta)$ 的可用性：Pippenger--Spencer 与 Lovett--Meka 都是渐近存在性，若想让定理对"所有足够大"给出可验证的起点，需要把 §5 的 $q^{7/8}$ 删除余量与 §8 的级数常显式化，工程量大、障碍不明，[推测]。第三，实点邻域的均匀性目前靠 $R_N(0)=R_N(1/2)=A$ 钉死两个点（correction.tex:184-191），$t$ 在 $0$ 附近时 $B$ 与 $R_N$ 都按固定光滑律走，若要下界在实点附近有更锐的形态，导数槽设计要重做。这三条我都不会在本单解决，记在这里当作下一批工作的入口。

## 12. 勘误

以下几处偏离规格或笔误，按类别申报，依规格不做就地替换。其一，本稿首次落盘块实测 9,470 字节，低于首块 20,000 字节的门槛，构成永久缺口，此后各追加笔已把全文推过总量门槛，缺口仅指首落那一笔。其二，探针那行的元描述文字（"写探针一行接在题下"）保留在 §4 正文首句位置。其三，文风禁令命中两类：转折式禁串一处落在 §3 标题的括注内；长停顿号（成对破折号形态）共四处散落 §7、§8、§9，交由清理通道处理。其四，未译英文残留两处：一个英语动词落在 §7 讲端点条件的句子，一个英语动词第三人称形式落在 §9 讲连续指标的句子，均属"落笔即中文"违例。其五，§3 标题括注里指向"§10 勘误"，实际勘误在本节 §12，且该括注语句不通，其本意是：顺序倒转的思路详见 §3 正文与 §10 第四条差距。其六，§6 有一处"每组 $t$"应为"每个 $t$"，量词笔误，不影响数学内容。

补记（仍在本节末尾追加，不改动上文）：前条"其五"中"§10 勘误"的准确含义以本节自指为准；前条"其三"所称长停顿号四处，逐行检索实测为 §7 三处、§8 一处、§9 零处，以补记为准；停顿式连接词禁串另有一处命中，落在 §4 第二段句首，前条未列，此处补记；未译英文残留共两处，位置在 §7 端点相位对接一段与 §9 收尾扫实点一段，前条"其四"与此补记合并理解。

## 13. 主定理验收清单与自检

我习惯在合稿前把定理陈述拆成验收项逐条打勾，这一单也不例外。下面每项都给出"在哪一行兑现"，位置指素材文件。

第一项，长度为 $N$ 的连续指标：系数只挂在 $0,\ldots,N-1$（introduction.tex:20-25 的求和、completion.tex:17 与 81-83 的收尾），校正投影到同一指标区间后误差 $O_\delta(N^{-1/4})$（correction.tex:398-407），无越权自由度。第二项，系数取实符号：整条链只在最后一步由取整引理交出 $\varepsilon_k\in\{-1,1\}$（rounding.tex:19-23），此前一切工作对象是松弛向量 $X_N\in[-1,1]^N$（completion.tex:20-22）。第三项，上界 $(1+\eta)\sqrt N$：来自 $K_\delta\to1$ 加上取整项，靠先选 $\delta$ 保证严格低于 $1+\eta$（completion.tex:64-76；$K_\delta$ 定义在 spreading.tex:48）。第四项，下界 $\sqrt N/16$：包络 $\frac b{S_\delta}-o(1)$ 减取整项后仍严格大于 $c=\frac1{16}$（completion.tex:30-34、64-70；$b=\frac18$ 在 sampling.tex:22 定死）。第五项，全圆逐点含实点：一切一致范数估计天然含 $t=0,\frac12$，且 $z=\pm1$ 两点被 $R_N(0)=R_N(1/2)=A$ 显式覆盖（correction.tex:184-191），主定理陈述也点名包含实点（introduction.tex:31-32）。第六项，"单个多项式、每个足够大长度"：$N_0(\eta)$ 存在性与 $N$ 遍历其后所有整数（introduction.tex:19-20、completion.tex:74-76），打包侧素数与匹配一经选定即与 $N$ 无关、对 $N$ 无算术要求（packing.tex:302-307）。第七项，下界常数与上界精度解耦：$c$ 先于 $\delta$ 固定（completion.tex:64），下界不随 $\eta\to0$ 退化（introduction.tex:30）。

自检层面我再确认三条本稿纪律。其一，量词次序：本稿每个"先固定后趋于无穷"的表述都能在 introduction.tex:142-145 与 completion.tex:2-4 找到出处，没有把 $N$ 混进辅助数据的说法。其二，数值抽查：$7/32$（spreading.tex:164）、$1-7\delta$ 与 $1-8\delta$（sampling.tex:31-33）、$L\le10\delta$（sampling.tex:46 与 311）、$A-b=\frac38$ 与 $b+A=\frac58$（correction.tex:201 与 224）、$\frac{\pi e}{20}<1$（rounding.tex:228-230）、$q_\delta=4\delta+2D\sqrt\delta$（completion.tex:50），我都在读时对照原文复算过一遍，其中 $\frac58<K_\delta$ 需 $K_\delta\ge1$，由定义 $\sqrt{(1+\delta)^3/(1-\delta)}>1$ 显然。其三，术语统一：本稿把 widths 统一叫"宽度"、slots 叫"槽"、gaps 叫"缺口"、taper 叫"缓入条带"、matching 叫"匹配"、defect 叫"缺陷质量"，前后一致；[推测] 素材本身没有术语表，这套对译是我的私有约定，后续单复用时应先对照。

## 14. 数据台账

下表把全文流经的关键量按"从上游到下游"排列，位置栏全部是本会话逐字读出的素材行号；"若改动断在哪一步"指本笔记 §4 到 §9 复述的推导环节。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\eta$ | 任意精度，决定 $N_0(\eta)$ | introduction.tex:19 | 主定理量词 | 次序颠倒则全篇 $o(1)$ 失效 |
| $\sqrt{N}/16$ | 模下界绝对常数乘根号长 | main.tex:39 | 摘要与定理陈述 | 任一条预算线劣化先击穿此行 |
| $(1+\eta)\sqrt{N}$ | 模上界 | main.tex:39 | 摘要与定理陈述 | $K_\delta$ 或取整项失控即破 |
| $\delta$ | 精度参数，先于一切辅助数据固定 | introduction.tex:109 | 全链构造 | 冻结失败则 $O_\delta$ 常数随 $N$ 漂移 |
| $b=\frac18$ | 下包络目标阈值 | sampling.tex:22 | 校正命题与收尾 | 改大则缺口变多，$L$ 预算爆表 |
| $c=\frac1{16}$ | 最终下界常数 | completion.tex:64 | 主定理下侧 | 先于 $\delta$ 固定，余量减半即断 |
| $K_\delta=\sqrt{(1+\delta)^3/(1-\delta)}$ | 主项模上限 | spreading.tex:48 | 采样比值界与校正包络上侧 | $K_\delta^2-1\le5\delta$ 失配则缺口总长失控 |
| $\lVert F\rVert_\infty\le1$ | 辅助多项式一致界 | spreading.tex:36 | 采样系数自动落入 $[-1,1]$ | 松弛箱被越出，取整前提消失 |
| $\lVert F\rVert_2\ge1-3\delta$ | 均方保持率 | spreading.tex:37 | 质量恒等式 $\int B^2$ 下界 | 主项质量不足，缺陷区膨胀 |
| $M_d\ge1-\delta$ | 递推均方达标阶 | spreading.tex:148 | 宽度总预算收口 | $\frac{M_d}{1+\delta}<1$ 封不上 |
| $\frac18(1-M_{j-1})^2$ | 均方增量下界 | spreading.tex:143-144 | $M_j\uparrow1$ 论证 | 增量退化则 $p_d$ 停在半路 |
| $7/32$ | $p_2$ 第二坐标系数 | spreading.tex:164 | $D\ge2$ 非空证明 | 打包无型可配，匹配为空 |
| $\Delta_s\rho_s\approx\tau\lvert c_s\rvert^2$ | 曲率调参目标 | spreading.tex:218-220 | 盒内系数界与宽度同步 | 比值与总宽两头同时失衡 |
| $\sum_{a}\lvert\lambda_a\rvert<1$ | 带符号宽度总和 | spreading.tex:43 | 打包引理输入 | 预算顶穿则区间必碰 |
| $2\sum_i w_i<1$ | 打包严格阈值 | spreading.tex:404-405 | 区间互斥构造 | 等号情形反射弧与原体相撞 |
| $w_i<L_i/(2L)$ | 槽宽余量 | packing.tex:74-75 | 终端比较 $w_i/H<L_i/q$ | 区间塞不进槽，交叠出现 |
| $b$ 为秩且 $b\ge2$ | 型组有理秩 | packing.tex:82-83 | 纤维计数与联合均匀 | 秩一退化，独立性论证断 |
| $q$ | 充分大素数网格模 | packing.tex:83-88 | 有限域可解性 | 换合数则型值均匀性失效 |
| $R=\lfloor\sqrt q\rfloor$ | 分块长 | packing.tex:90 | 例外集 $O(R)$ 与边界概率平衡 | 调偏则方差与例外同涨 |
| $p=\frac1{2L}$ | 中心出现概率 | packing.tex:119 | 目标度 $D_q$ 的幂 | 一阶矩直接算错 |
| $\lvert E_i\rvert=O(R)$ | 例外中心数 | packing.tex:177 | 删除总量估计 | 例外肥厚，匹配覆盖率丢 |
| $\tau_q=O(q^{-1/2})$ | 落块边界概率 | packing.tex:189 | 条件独立引理 | 高概率碰撞则二阶矩不可算 |
| $D_q=p^{r-1}q^{b-1}$ | 顶点度目标值 | packing.tex:157-158 | Pippenger--Spencer 前提 | 度不齐则边染色定理不能用 |
| 共度 $\le q^{b-2}$ | 点对共度上界 | packing.tex:152 | 删除后度数扰动 | 共度肥则匹配退化 |
| $\varepsilon_q=q^{-1/8}$ | 度集中容差 | packing.tex:240 | 切比雪夫偏差率 $O(q^{-1/4})$ | 集中放松则坏点淹没好点 |
| $O(q^{7/8})$ | 删除顶点总量 | packing.tex:251-253 | 幸存度扰动 $O(q^{-1/8}D_q)$ | 删过头则每型顶点不够数 |
| $H=(1+o(1))\frac q{2L}$ | 匹配规模 | packing.tex:269 | 区间长度 $w_i/H$ 的折算 | $H$ 偏小区间出槽 |
| $I_{a,h}$ 两两不交 | 主弧族 | sampling.tex:172-178 | 单丘分解 $B_N$ | 弧重叠则振幅叠加，模不再是 $B$ |
| $\chi_h$ 平台正长度 | 截断形态约束 | sampling.tex:186-194 | 超水平集为正长度闭区间 | 临界丘测度零，缺口清单失效 |
| $\lVert U_{Y_N}-B_N\rVert_\infty=O_\delta(N^{-1})$ | 采样一致逼近 | sampling.tex:29 | 质量迁移与终外形 | 逼近变慢，下界先被污染 |
| $\int_\T B^2\ge1-7\delta$ | 主项均方质量 | sampling.tex:31 | 缺口测度 $L\le10\delta$ | 缺陷总长失控，校正代价上抬 |
| $\frac1N\sum_k Y_{N,k}^2\ge1-8\delta$ | 系数均方下界 | sampling.tex:33 | 缺陷率 $q_\delta$ 的第一项 | 均方不达标则取整项吃光余量 |
| $L\le10\delta$ | 缺口总长 | sampling.tex:311 | 中段代价 $\sqrt L$ 的根号 | $L$ 不与 $\delta$ 同阶则 $D\sqrt\delta$ 崩 |
| $x_z=\psi_z'(z)\in(0,1)$ | 端点规定导数 | sampling.tex:58 | 校正对接与外频包含条件 | 贴边则 $c_\delta$ 消失，尾巴不衰减 |
| $s_j=\frac{l_j}{4L}$ | 导数槽宽 | correction.tex:81 | 曲率下界与槽互斥 | 宽度失配则驻定贡献不唯一 |
| $d_j\ge\frac1{4L}$ | 中段斜率下界 | correction.tex:122 | 单槽贡献 $4C_2\sqrt L/\sqrt N$ | 曲率消失则驻定相位折价没了 |
| $\sum\lvert\xi_j'\rvert^{-1/2}\le\sqrt\delta$ | 外段斜率预算 | correction.tex:115-117 | 外段合计 $2C_2\sqrt\delta/\sqrt N$ | 超支则逐系数代价多收 |
| $A=\frac12$ | 校正振幅 | correction.tex:138 | 包络 $\frac38$ 与 $\frac58$ 双夹 | 加大顶穿上界，减小抬不动下界 |
| $w=N^{-3/4}$ | 缓入条带宽 | correction.tex:160 | 相位对齐 $O_\delta(N^{-1/2})$ 与尾巴 $O_\delta(N^{-1/4})$ | 任一端要求失守，对齐或尾界先死 |
| $C_1=A+2A+2\pi A$ | 振幅界与全变差 | correction.tex:254 | $C_2$ 与 $D$ 的绝对性 | 依赖缺口数则绝对常数失格 |
| $D=2C_2+4\sqrt{10}\,C_2+1$ | 系数代价常数 | correction.tex:305-306 | 缩放 $s_\delta$ 预算 | $D$ 膨胀拖累 $q_\delta$，下界被削 |
| $O_\delta(N^{-1/4})$ | 外频率尾巴和 | correction.tex:390-392 | 投影回 $0\le k<N$ 的一致误差 | 尾不趋零则限制度毁包络 |
| $C_0\sqrt{s\log(2R/s)}$ | 实矩阵偏差界 | rounding.tex:41 | 二进逐段误差求和 | 界变慢则取整项吸收不完 |
| $\sum_i\exp(-c_i^2/16)\le u/16$ | 存在性阈值 | rounding.tex:52 | 每步固定至少半数坐标 | 阈值失配则贪心无进展 |
| $s_j\le\min(N,2^j\mu)$ | 奇数坐标计数 | rounding.tex:169 | 段误差 $2^{-j}\sqrt{2^j\mu\,L_\mu}$ | 计数失效则质量进不了估计 |
| $M=20N$ | 网格点数 | rounding.tex:117 | 迁移系数 $\pi e/20<1$ | 网格变疏则圆上失控 |
| $\frac{\mu(X_N)}{N}\le4\delta+2D\sqrt\delta$ | 终缺陷率 $q_\delta$ | completion.tex:48-50 | 取整引理入参 | 不小于 $\frac12$ 则对数单调性不可用 |
| $S_\delta=1+D\sqrt\delta$ | 回缩因子 | completion.tex:15 | $X_N\in[-1,1]^N$ 合法性 | 忘除则系数越箱 |
| $\frac b{S_\delta}\to\frac18$ | 下包络极限 | completion.tex:66-67 | 取 $c=\frac1{16}$ 的余量 | 极限若低于 $c$ 定理失效 |
| $\lvert\mathcal U_s\rvert\le(1+\delta)B^D\Delta_s$ | 保留盒点数 | spreading.tex:279-288 | 总宽度按 $B$ 一致收口 | 盒数超估则宽度总和顶穿 1 |
| $\sum_h\int_\R\chi_h^2\ge1-\delta$ | 截断质量 | sampling.tex:186-189 | 质量恒等式的第二因子 | 不足则 $\int B^2$ 掉出 $1-7\delta$ |
| $I_{s,j}$ 的一致界 $(1+O(B^{-1}))/\sqrt{B\lvert\beta_{s,j}\rvert}$ | 单维二次和 | spreading.tex:257-263 | 乘积分解的系数界 | 失守则比值 $K_\delta$ 全线破 |
| $v=\bigl(\gamma/(\tau B^D(1+\delta)^3),0\bigr)$ | 速度向量定法 | spreading.tex:373-376 | 各频率宽度的统一分母 | 分母挪位则盒数与宽度脱钩 |
| $\operatorname{sgn}(\beta)/8$ | 二次积分常数辐角 | spreading.tex:66-67 | 波相位与采样公式对齐 | 换分支则 $\alpha_z$ 吸收失效 |
| 边数 $\sim\lvert V\rvert D/r$ | 度和推论 | packing.tex:56-59 | 最大匹配的 $(1-o(1))$ 覆盖 | 度不齐则计数与染色同断 |
| $h_j^\pm<l_j/4$ | 外段长度约束 | correction.tex:100 | 中段保正与槽可达性 | 外段过长则中段退化失槽 |
| $T=N+\lvert k\rvert$ | 尾频率统一标度 | correction.tex:318 | 两次分部积分的衰减率 | 单用 $N$ 标度则负频端发散 |
| $(1-\pi e/20)^{-1}$ | 网格到全圆的放大因子 | rounding.tex:228-231 | 最终绝对常数 $C$ | 分母非正则迁移失效 |
| $\mu(X)=0$ 取 $\varepsilon=X$ | 零缺陷例外 | rounding.tex:24-25 | 取整引理边界情形 | 漏掉则系数恰满箱时无从下笔 |
| $\lvert E\rvert=2L$ | 偶对称的测度换算 | sampling.tex:300-301 | 缺口总长上界 | 丢因子 2 则 $C_0$ 悄悄翻倍 |

表后附我读稿时做过的数字复核，全部按素材行号重算，一是给自己留底，二是让台账与正文的接口处再拧紧一圈。

先验递推里的分数。$p_1=\frac12\cos(2\pi y_1)$，故 $M_1=\int_{\T}\frac{\cos^2}{4}=\frac18$，于是 $p_2$ 在第二个坐标向量处的系数 $\frac{1-M_1}{4}=\frac{7}{32}$（spreading.tex:163-166 的原式），与我手算一致；这个正系数能一路存活到 $p_d$，靠的是递推新旧两项不相消的支撑结构（spreading.tex:150-157），不是巧合。再验 $K_\delta$ 的两条不等式：$K_\delta^2-1=\frac{(1+\delta)^3-(1-\delta)}{1-\delta}=\frac{4\delta+3\delta^2+\delta^3}{1-\delta}$，代 $\delta=\frac1{100}$ 得约 $4.07\delta$，故素材里 $K_\delta^2-1\le5\delta$（sampling.tex:313-314）成立且有余地；$K_\delta^2-b^2\ge1-\frac1{64}$ 因 $K_\delta\ge1$ 逐项显然。缺口总长由此得 $L\le\frac{5\delta+7\delta}{2(1-1/64)}=\frac{12\delta\cdot32}{63}\approx6.1\delta\le10\delta$（sampling.tex:308-312），$C_0=10$ 是刻意取松的整数上界。

取整引理的两条形态互译我也核了一遍：rounding.tex:20-23 的未归一化界 $C\bigl(1+\sqrt{\mu\log(80N/\mu)}\bigr)$ 除以 $\sqrt N$ 后恰是 introduction.tex:99-103 的 $\frac C{\sqrt N}+C\sqrt{\frac\mu N\log\frac{80N}\mu}$，两处常数可取同一个；单调性调用点 rounding.tex:172-173 与 completion.tex:53 都要求 $q\log(80/q)$ 在 $(0,\frac12]$ 上增，导数 $\log(80/q)-1$ 在该区间恒正当且仅当 $q<\frac{80}{\mathrm e}$，$\frac12$ 远在界内，两处共用这条初等事实没有隐患。迁移系数 $\frac{\pi e}{20}\approx0.427$（rounding.tex:228-231）我按 $e\approx2.718$、$\pi e\approx8.54$ 复算过，放大因子 $\frac1{1-0.427}\approx1.75$，取整最终常数 $C$ 里就含着它。

收尾的缺陷率三步我也重走了一遍。第一条：$\lvert X_{N,k}-Y_{N,k}\rvert=\frac{\lvert\sqrt N\widehat R_N(k)-s_\delta Y_{N,k}\rvert}{S_\delta}\le\frac{s_\delta+s_\delta}{S_\delta}\le2s_\delta$（completion.tex:39-41），用了系数界与 $\lvert Y\rvert\le1$ 两次同量级放缩，没有方向性漏洞。第二条：两数都在 $[-1,1]$ 时 $\lvert X^2-Y^2\rvert\le2\lvert X-Y\rvert\le4s_\delta$（completion.tex:43-44）。第三条：$1-\lvert x\rvert\le1-x^2$ 把缺陷质量换成平方亏损，再借 $\frac1N\sum Y_{N,k}^2\ge1-8\delta$（sampling.tex:33）得 $\frac{\mu(X_N)}N\le\frac1{2N}\sum(1-X_{N,k}^2)\le4\delta+2s_\delta$（completion.tex:47-51），代 $s_\delta=D\sqrt\delta$ 即 $q_\delta$。三条链的每一环我都验过等号方向，结论与素材完全一致；若 $\frac1N\sum Y^2$ 的 $8\delta$ 换成 $c'\delta$，则 $q_\delta$ 首项变为 $\frac{c'}2\delta$，台账最后一行的极限裕量随之平移，这是"改动断在哪一步"一栏里"取整项吃光余量"的定量版本。

包络三查里也藏着一个可验的数：条带外 $\lvert B_N+R_N\rvert\ge A-b=\frac38$ 远大于目标 $b=\frac18$（correction.tex:198-202），条带内靠对齐误差 $O_\delta(N^{-1/2})$ 与 $B\ge b-O_\delta(w)$ 合称 $b-o(1)$（correction.tex:215-221），上界一侧缺口内 $b+A=\frac58<K_\delta$、其余 $\le K_\delta$（correction.tex:224-225），$\frac58$ 与 $K_\delta\ge1$ 之间有 $\frac38$ 的净空，所以校正的振幅 $A$ 其实还有下调空间，只是下界一侧的条带论证会跟着变紧；我猜作者取半是图对称与行文干净（[推测]，素材没有讨论 $A$ 的优化）。图 figures/gap-slots.tex:22-30 把外段画成从 $x_{u_j}$ 落入 $p_j$、再从 $q_j$ 出到 $x_{v_j}$，与 correction.tex:100-110 的三段插值一一对应；图注强调"至多一个槽靠近 $k/N$"（figures/gap-slots.tex:85），正是 §7 中段单槽估计的图像化。

最后留一句总账：这篇的定理强度全部押在"同一组符号同时满足两侧"上，链路上任何一环（宽度预算、槽互斥、缓入对齐、缺陷质量）给出 $o(1)$ 都不可替代；我把每个 $o(1)$ 的出处记成了上面这张台账，今后若有人想把 $\eta$ 或 $1/16$ 往锐利方向推，请先从台账最后十一行逐条问"断在哪一步"。本笔记到此收束，登记、勘误与台账均已在正文指定节内，无散落附录。

再补三段账目级复核，都是我在台账封口后又走了一遍的。第一段，宽度总账的逐步复算：对单个原始频率 $s$，保留族总宽度为 $\lvert\mathcal U_s\rvert$ 乘以每位置宽度 $\frac{\rho_s}{\tau B^D(1+\delta)^3}$；用盒数上界（spreading.tex:279-288）与调参双约束 $(1-\delta)\tau\lvert c_s\rvert^2/\rho_s\le\Delta_s\le(1+\delta)\tau\lvert c_s\rvert^2/\rho_s$（spreading.tex:216-221），得该族宽度至多 $\frac{(1+\delta)\tau\lvert c_s\rvert^2}{\tau(1+\delta)^3}=\frac{\lvert c_s\rvert^2}{(1+\delta)^2}$；对 $s\in\mathcal S$ 求和，右边是 $\frac{M_d}{(1+\delta)^2}\cdot\frac{1+\delta}{1+\delta}$ 的形变，素材取到 $\frac{M_d}{1+\delta}<1$（spreading.tex:385-392），比我手算的 $(1+\delta)^2$ 版本更紧半阶，差别来自 $\sum_{\mathcal S}$ 处正反号已在支撑里、不必再乘二。我按素材的不等式链重排一遍后确认无误：关键是不让任何一步把 $\pm$ 对拆成两份宽度。第二段，尾巴的求和率：$k\ge N$ 时 $T=N+k\ge2N$，$\sum_{k\ge N}T^{-2}\le\int_N^\infty(N+x)^{-2}\,dx=\frac1{2N}$；负频同型；两尾合起来 $O(N^{-1})$，乘系数 $C_\delta w^{-1}$（correction.tex:381-386）得 $C_\delta N^{3/4}\cdot O(N^{-1})=O_\delta(N^{-1/4})$（correction.tex:387-393），与台账的 $O_\delta(N^{-1/4})$ 行完全吻合，且看清了 $w=N^{-3/4}$ 在尾巴一侧的全部作用就是把这个幂从 $-1$ 抬到 $-\frac14$。第三段，终余量的量级账：要求 $\frac b{S_\delta}-C\sqrt{q_\delta\log(80/q_\delta)}>c$，即 $\frac18$ 与 $\frac1{16}$ 之间的空隙 $\frac1{16}$ 要吞下两块，缩放块约 $\frac{D\sqrt\delta}{8}$，取整块以 $q_\delta\approx2D\sqrt\delta$ 估是 $O(\delta^{1/4}\sqrt{\log(1/\delta)})$，后者衰减最慢，起决定作用；上侧 $K_\delta-1\approx2\delta$ 对 $\eta$ 而言几乎免费。由此反推 $\delta$ 的需要量约为 $\eta$ 与 $c$ 空隙的四次方级别，[推测] 这正是论文对 $N_0(\eta)$ 只给存在、不谈速率的底气所在：速率被 $\delta^{1/4}$ 与 $O_\delta(N^{-1/4})$ 两处绑死，任何显式化都要连 §5 的渐近匹配一起重做。三段走完，台账与正文之间我找不到新的裂缝，这一单可以交了。

末了自纠一句：上一段第一步复核里"我手算的 $(1+\delta)^2$ 版本更紧半阶"的比较说法有误，正确读法是每族宽度我自己复算即得 $\lvert c_s\rvert^2/(1+\delta)$，求和后恰为素材的 $\frac{M_d}{1+\delta}<1$（spreading.tex:385-392），两侧没有半阶之差，也没有"形变"可言；依规格不动原文，特此在本节末尾申报，§12 的申报类别之外再添此一条笔误。

再走三小段收尾复核，把台账里没展开的放缩补全。其一，取整的下沉格与两大分支：$p^{(J)}_k=2^{-J}\lfloor2^Jp_k\rfloor$ 逐坐标差不足 $2^{-J}$，$N$ 个坐标合计 $\le N2^{-J}\le1$（rounding.tex:127-135），这一步只花一次常数 1，是全链唯一一处"绝对加项"；两支放缩里 $U_j>N$ 那支用 $f(s_j)\le N\log 80$，而 $L_\mu=\log(80N/\mu)\ge\log160>\log80$ 且 $U_j\ge N$，所以 $U_jL_\mu\ge N\log80$ 接得上（rounding.tex:177-181），我起初担心 $\mu$ 接近 $N/2$ 时 $L_\mu$ 会掉到 $\log160$ 附近与 $\log80$ 混战，验过才知差距恒在一倍对数之外。其二，起点几何的两条非空论证：$\int B^2\ge1-7\delta>b^2=\frac1{64}$（$\delta<1/100$）保证超水平集非空（sampling.tex:294-296），偶性再保证每个半圆各有一份；丘高 $\frac{\lvert c_a\rvert}{\sqrt{\lvert\lambda_a\rvert}}\le K_\delta$ 逐弧成立且每点至多一弧在场，于是 $B\le K_\delta$ 全局成立（sampling.tex:251-256），台账里 "$\frac58<K_\delta$" 的净空与 "$K_\delta$ 是 $B$ 的天花板"在这两处是同一件事的两个投影。其三，端点导数的落点复算：$\psi_z'(z)=x_{a,h,\ell}(z)=x_h^*-\frac{u_{a,h,\ell}(z)}{\lambda_a}$，截断在 $z$ 处为正意味着该值严格落在第 $h$ 块 $((h-1)/H,h/H)$ 内部（sampling.tex:326-331），而各块又严格嵌在 $(0,1)$，所以 $x_z\in(0,1)$ 不是近似陈述，是开集包含，这正是校正端点插值能把外段斜率做大的前提：规定值离 $0$ 与 $1$ 各有正距离，$c_\delta$（correction.tex:126-131）才取得出来。三小段都收在恒等或严格不等式上，没有新的松紧问题。

本单的读、写、验三路到此并轨：素材九个 tex 全读，正文十五节按号顺落，台账六十一行数据闭合，后一步的锐利化若要做，账本已替它备好。

并轨之后还剩两笔零账，补在这里，都在本节内。第一笔，外形链条 $o(1)$ 的成分分解：由定义 $U_{X_N}=\frac1{S_\delta}\bigl(U_{Y_N}+\sum_{k<N}\widehat R_N(k)\e(kt)\bigr)$，把 $U_{Y_N}=B_N+O_\delta(N^{-1})$（sampling.tex:29）与投影一致误差 $O_\delta(N^{-1/4})$（correction.tex:401-405）代入，得 completion.tex:25-28 那句 $U_{X_N}=\frac{B_N+R_N}{S_\delta}+o(1)$ 的完整成分表：$\frac1{S_\delta}O(N^{-1})$、$\frac1{S_\delta}O(N^{-1/4})$，两项都被 $S_\delta$ 有界吸收，$o(1)$ 的速率由慢的 $N^{-1/4}$ 决定。我核对这步时特别确认了系数 $1/\sqrt N$ 在 $U$ 记号里外消：$\sqrt N\,\widehat R_N(k)$ 进系数、$U$ 出系数恰好配平，这是把校正的傅里叶界（correction.tex:56-57）翻译成系数可行性的机关，与 completion.tex:17 的定义逐项对得上。第二笔，实点的独立复验：$t=0$ 处 $B=0$（$B$ 在 $0,\frac12$ 附近消失，sampling.tex:57 与 257），$R_N(0)=A=\frac12$（correction.tex:186-187），故 $\lvert B_N+R_N\rvert$ 在该点恰为 $\frac12$，介于 $b=\frac18$ 与 $K_\delta$ 之间，两侧包络在 $z=\pm1$ 处都有整 $\frac38$ 的余量，全圆最差点其实落在缓入条带内，并非实点，这与 §2 里"随机法死在 $t=0$"的旧记忆形成对照：结构性构造反而在最凶的点最从容。又及，前段"台账六十一行"实为六十行数据加一行表头，我把表头误计了进去，依规格不改原文，在本段更正；其余各笔账，读至此应无悬案。

再补最后一笔：关于"每个足够大的整数长度"这句的覆盖面，我专门做了一次端点清点。起点命题对一切正整数 $N$ 交付 $Y_N$ 与 $B_N$（sampling.tex:61-62 写明除 $Y_N$、$B_N$ 外的对象都与 $N$ 无关，sampling.tex:332-333 重申每个正整数都被允许），校正命题的门槛"充分大"只花在两处：条带互不相交需要 $2w<l_j$ 型条件（correction.tex:166-169），以及 $o(1)$ 与 $O_\delta(N^{-1/2})$ 压进 $D\sqrt\delta$ 需要 $N$ 过某个阈值（correction.tex:303-306）；取整引理本身从 $N=1$ 起恒成立（rounding.tex:234-235）。所以主定理的 $N_0(\eta)$ 完全由"校正阈值、包络余量吸收、误差压线"三件事的最大者决定，长度集合是终区间全体整数，没有同余类或二进子列的隐形限制，这一条恰好对照 introduction.tex:38-40 里 Rudin--Shapiro 只活在二进长度的旧限制，也是姊妹稿"通过一切长度趋于 1"（introduction.tex:52-53）在本篇得以继承的机制。清点毕，本单收工：动机一条、弯路两条、转折一处、零件五节、验收一份、台账六十行，登记与勘误各归各位。
