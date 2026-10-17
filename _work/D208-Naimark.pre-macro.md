# D208 Naimark 问题 ZFC 反例复盘：用可数决定替代状态猜测

这份笔记对应非 Lean 队列派单 D208。我打算把这篇 2026 年 9 月 24 日挂出的预印本（作者字段在 build/main.tex:27 直接写 OpenAI，日期在 build/main.tex:28）背后真实的思维链反推出来：一个关于既约表示唯一性的老问题，为什么在 2026 年之前只能靠集合论的猜测原理反噬，现在又为什么能在 ZFC 内部解决。写作规矩照旧：所有正文素材只来自 preprints 目录下 build/ 里的 .tex；凡论文没有交代的推理过程，一律标 [推测] 并说明缺口在哪。

## §0 登记与文本定位

派单参数（取自 .tools/wave.txt 中 D208 行）：row=32，bytes=77939，thin=no，dir 见下一行。

目录登记：preprints/A-counterexample-to-Naimarks-problem-in-ZFC-September-24-2026

行号登记：其他队列第 32 行号

版式探测：`find build -name '*.tex'` 只命中 build/main.tex 与 build/sections/ 下六个分节文件，共七个；`ls build/source` 报 No such file or directory，说明这篇没有 source 版式，取材面就是 build 主干。目录根下另有 README.md、naimark-counterexample-zfc.pdf 与 typst/ 分片，按规格 PDF 与 typst 一律不碰，README 只当索引。

各文件字节（wc -c 实测）：main.tex 1674，introduction.tex 7743，states.tex 13969，hnn.tex 17128，bridge.tex 15569，iteration.tex 15236，construction.tex 6620，七个 .tex 合计 77939，与派单 bytes=77939 逐字吻合，说明派单统计口径就是 build 下全部 .tex，且这一批没有被截断或增补。行数合计 1652 行（bridge 357、construction 139、hnn 376、introduction 136、iteration 337、states 307），对一篇纯 C*-代数论文来说体量不大，结构却排得很整齐：states、hnn、bridge、iteration、construction 五节正好是工具的三层（状态论、构造论、递归论）加一次合龙。

取证调用清点：wave.txt 定位 1 次，build 结构 ls 与 wc 各 1 次，七个 .tex 全部 Read 共 7 次，版式复探 1 次，label 定位 grep 1 次，引文清点 grep 1 次，研究笔记查重与行数统计 1 次，(U) 用法清点 1 次，合计 15 次，恰好用满上限。首次落盘在第 16 次调用，即本文件 Write。研究笔记目录下现无 D208 重名稿。

## §1 问题本来的形状：K(H) 能不能被自己的表示论认出来

先把论文的问法抄正。introduction.tex:4-8 说：对复 Hilbert 空间 $H$，记 $K(H)$ 为紧算子 C*-代数；$K(H)$ 的每个非零既约表示都酉等价于它的定义表示；Naimark 的问题就是问这个性质能否刻画 $K(H)$。注意这里"既约"按 introduction.tex:17-18 的定义是：非零且没有非平凡闭不变子空间，并不要求表示是恒等的或者可分的。主定理 na:main（introduction.tex:10-15）给出的反例是一个单位的、无穷维的、单的、带忠实迹态的复 C*-代数 $A$，它的所有非零既约表示两两酉等价；而 $K(H)$ 只有在 $H$ 有限维时才是单位的，所以 $A$ 绝不是任何 $K(H)$。这个"单位 + 无穷维"的组合本身就值得停下来想一想：它意味着 $A$ 的唯一既约表示（按等价类）作用在一个不可分 Hilbert 空间上。[推测] 论文的 introduction.tex:21-22 特意声明全篇不对 $A$ 加可分性假设，我猜这是为了让读者不去找"其实可以选可分表示"的退路，因为下面马上要说，那条退路正是历史上肯定答案的来源。

我最初的直觉立场（这是复盘，只能根据文本反推）大概是：这个性质太强了，一个代数若只有一种既约表示，它的表示论就几乎是单音的，单音加上单和忠实迹态，多半要逼出可分性或者逼出 $K(H)$。[推测] 这种直觉在文本里没有直接反驳对象，但 introduction.tex:27-31 给出的 separable 情形定理正好是它的精确边界：若那个唯一非零既约表示作用在可分 Hilbert 空间上，则代数同构于紧算子（引 Calderón--Farah 的 Proposition 7.2）。也就是说，反例的全部生存空间就是"表示空间不可分"这一条缝，反例构造本质上是在不可分世界里把一个可分的核（CAR 型代数）无限地、但每一步都受控地放大。把问题翻译成纯状态语言后这个缝更清楚：既约表示对应纯态的 GNS 表示（states.tex:11-16），于是"所有非零既约表示酉等价"等价于"纯态关于 GNS 酉等价只有一个等价类"，再加上构造里始终保住的性质 (U)（states.tex:27-29：$B$ 的每个纯态到 $C$ 只有一个态扩张），整个游戏就变成一个关于纯态等价类如何被受控合并的迭代游戏。

还有一个小但决定性的观察，放在 introduction.tex:123-129：单位代数 $A$ 的任何非零既约表示自动是单位的，因为 $\pi(1)$ 的值域是非零闭不变子空间，既约性逼它等于全空间，于是每个单位向量给出一个纯态且其 GNS 表示等价于 $\pi$。这一步把"既约表示"与"纯态"两个语言彻底焊死，后文所有递归都在纯态语言里进行。我认为这是全文真正的第一根承重柱：问题从算子语言换到状态语言之后，"反例"才变成一个可以做传递递归的对象。

落盘探针D208-P1：基线5316字节，此行用于验证首次写入已真实落盘，保留原位不再改动。

## §2 旧工具的天花板：从 1951 到 2026 的记分板

先把历史账本摊开，因为我后来意识到，这篇论文的全部设计选择几乎都是被这份账本逼出来的。问题本身 dating 到 1951（introduction.tex:25-26，历史梳理与 Rosenberg 的早期肯定结果都指向 Akemann--Weaver 2004）。肯定答案的边界：Calderón--Farah 的 Proposition 7.2 说，若那个唯一的非零既约表示作用在可分 Hilbert 空间上，代数就同构于紧算子（introduction.tex:27-31）；论文明确提醒这个条件说的是既约表示本身可分，仅仅存在某个可分空间上的忠实表示是不够的（29-31 行）。反例侧的全部已知成果都挂在集合论假设上：Akemann--Weaver 用 Jensen 的 diamond 原理造出反例（introduction.tex:32-34，他们的 Theorem 5）；同一篇文章还证明了"由 $\aleph_1$ 个生成元生成的反例之存在"独立于 ZFC（Corollary 7，introduction.tex:34-37），而不限生成元个数的原始问题并不带这个界（36-37 行）。后续 refinements：Calderón--Farah 把假设削弱到 $\diamondsuit_{\mathrm{Cohen}}$ 加 CH（introduction.tex:39-42，他们的 Theorem 5.4）；Vaccaro 在 diamond 下让反例的迹态空间仿同胚于任意指定的可度量化 Choquet 单纯形（introduction.tex:42-46），所以"带不带迹"从 2018 年起就已经不是障碍。然后是 Tanaka 2026：introduction.tex:48-53 直说 Tanaka 已经给出 ZFC 的、带忠实迹态的构造（Theorems 1.1、4.1 和 5.3），即本文主定理的存在性结论在他那里已经存在；Tanaka 从 CAR 代数出发，用 strong shell sums 与 rank-one defects，还给出可分 Hilbert 空间上的忠实表示，只是那个表示不既约。

所以诚实的记分是：ZFC 反例的存在性这一分，2026 年之前已经有人拿了。本文 introduction.tex:53-58 自己也这么承认，并且把定位写得很清楚：这是一个 alternative proof，组织在三个部件上，faithfully tracial basis 上无有限维既约表示时的 selective bridge、reduced-HNN reordering、dependency-closed 的 unique extension 与 countable determination；递归长度 $\mathfrak c^{+}$（这里 $\mathfrak c=2^{\aleph_0}$），且不主张这个长度就是终代数的密度（introduction.tex:59-61）。[推测] 我猜这段坦白是审稿压力下的产物：既然存在性已被 Tanaka 解决，本文唯一可辩护的贡献就是方法学，那么方法学就必须说得比结果更响。

方法学的账本同样要摊开。introduction.tex:113-127 列了原料的四个前身：Akemann--Weaver 把纯态齐次性与"扩张时合并指定态对"结合起来（他们的 Corollary 3）；Farah--Hirshberg 用唯一纯态扩张实现指定的可数等价模式（他们的 Lemma 2.3），Vaccaro 修正版把这个方法与迹空间控制结合；Akemann--Wassermann--Weaver 对约化自由群代数证明纯态限制与唯一扩张（Proposition 2.3 与 Theorem 2.6）；Calderón--Farah 在第 8 节（尤其是 Question 8.1）提出"用可分子代数唯一决定相关状态、再做保唯一扩张的合并"的纲领。本文声称建立的两件新事（introduction.tex:127-130）：bridge 对所有旧纯态的选择性，以及它与 dependency-closed 子迭代的兼容性；两者合起来给出无界递归所需的 countable determination。这一句是全文的纲领句，后面每一节都在为它打工。

## §3 我想走而走不通的四条路

这一节复盘错误路线。所谓错误，都有文本依据：每条路的"堵点"恰好就是论文某个技术性最强的选择的对立面。[推测] 我不能声称作者真的先走过这些弯路，文本没有自述；我只能说这四条路是我按问题的自然解空间枚举出来的第一批候选，而论文的结构恰好证明它们各自缺什么。

第一条路：把 diamond 拆掉，直接硬枚举。Akemann--Weaver 式构造的内核是：取长 $\omega_1$ 的链，在每个阶段用 diamond 的猜测原理猜到未来会出现的纯态，提前把它并进唯一类。我最初以为猜测原理只是簿记工具：纯态反正只有 $\mathfrak c$ 个，长 $\mathfrak c^{+}$ 的递归总能把它们排着队处理完。这个想法错在一个非常具体的地方：第 $\beta$ 阶段我能列出的只是 $X_\beta$ 的纯态，而我真正要合并的是极限代数 $A=X_{\kappa}$ 的纯态；一个极限态未必出现在任何早期阶段的态空间里，更没有自然的"提升"使它可数化地逼近。论文的解法正是把这句话反过来用：introduction.tex:104-106 明说 countable determination 这个结论 replaces the state-guessing role of a set-theoretic prediction principle，机制是每个 $X_\beta$（$\beta<\kappa$）只有至多 $\mathfrak c$ 个纯态（na:state-count，iteration.tex:321-337，基数算术是 $\mathfrak c^{\aleph_0}=\mathfrak c$，iteration.tex:328-330），于是每个态迟早被处理；而"极限态其实在早期就出现"由 na:countable-determination（iteration.tex:288-319）保证：每个纯态在某个可数 dependency-closed 子代数上限制仍纯且以它为唯一扩张。等价地：猜测原理被换成了一个后验的捕获定理，我不需要提前知道未来，只需要保证未来被过去唯一决定。

第二条路：用代数（万有）HNN 合并，不做约化。群论直觉告诉我， adjoining 一个单位元 $v$ 使 $vD_1v^{*}=D_2$ 就是群论 HNN 扩张的 C*-版，直接取万有 C*-完备化即可。这条路在迹上翻车：万有完备化的范数是跨所有表示取 sup，忠实迹态在商掉迹零理想时可能整个死掉，而我的反例必须一路保住忠实迹态（主定理要求），还要保住一个忠实的保迹条件期望，因为后面 na:simple-extension（states.tex:295-307）证明单性时恰好消耗这两样东西：性质 (U) 加忠实期望。论文选择的正是另一头：Ueda 的约化 HNN（hnn.tex:11-16 交代出处，Proposition na:hnn 即 hnn.tex:38-54），在构造里硬性规定每个非空约化字的迹为零；hnn.tex:226-245 的唯一性论证说明这个规定反过来就是刚性的：多项式的迹矩被完全预定，再靠公式 $\lVert x\rVert=\lim_{r}\,t((x^{*}x)^{r})^{1/(2r)}$（hnn.tex:235-237，矩给出范数）把迹数据转成范数数据，任何两个满足同样规定的扩张都同构。[推测] 我猜"约化"在这里的真正含义与自由概率论一致：范数由自由积的 Fock 模型算出，所以一切都可以用矩来比较；文本没有说这层动机，但它把 Blanchard--Dykema 的期望与嵌入结果列在 hnn.tex:16 作参照，指向同一来源。

第三条路：想在整块代数上找一个自同构把 $f$ 送到 $g$。Kishimoto--Ozawa--Sakai 齐次性定理（na:homogeneity，construction.tex:9-16）说可分代数上 GNS 核相同的两个纯态可以被一个自同构互送，单代数情形自动满足。我的第一反应是：直接在当前阶段 $X_j$ 上用 $\gamma$，把 $(p_n)$ 搬成 $(q_n)$，一步到位。这里有两个堵点。其一，递归进行到 $\beta\ge\omega_1$ 之后 $X_j$ 不再可分，KOS 根本不在适用类里；construction.tex:19-20 特意写明"We apply it only to the separable algebras $A[S]$"，即只用在可数 dependency-closed 子代数上。其二，就算可用，我也不想要一个保迹的自同构，因为 $g$ 的确定子代数 $A[S]$ 上，迹与 peaking 序列的匹配只在一个很小的地方被需要：bridge 的输入只要求两条序列的迹值逐点相等。论文的解法漂亮得值得抄下来：construction.tex:76-86 检查对每个 $n$，$\gamma$ 把矩阵层 $M_{2^{n}}\subset A_0$ 送成 $A[S]$ 中某个单位矩阵子代数，把最小投影 $p_n$ 送成 $q_n^{j}$，而矩阵代数上归一化迹是唯一的，于是 $\tau(q_n^{j})=2^{-n}=\tau(p_n)$；紧接着 85-86 行点破：这个论证根本不要求 $\gamma$ 在 $A[S]$ 全体上保指定的迹。把"保迹"这种整体要求降格成"在矩阵角上迹自动匹配"的局部检查，是这篇论文里我最欣赏的一手。

第四条路：只对被合并的那一对状态做控制。bridge 的输入数据只有两条 peaking 序列（两个态），那么证明时是不是也只需要盯住这两个态？不行。迭代对每个旧纯态都要求唯一扩张，还要求别的旧等价类一个都不许被意外合并，否则后面"至多一个类"的归纳假设当场作废。bridge.tex:6-9 把这点写成定理证明的宣言："The proof must control arbitrary old pure states, even though the defining data consist of only two peaking sequences."（数据只有两个序列，控制对象是全部旧态。）这就是为什么全文最长的一节是 bridge 的证明：它必须对任意旧纯态 $h$ 证明扩张唯一，手段是让 excision 网 $x_{\lambda}$、$y_{\nu}$ 对每个非空约化字给出范数衰减 $\lVert xWy\rVert\to 0$（bridge.tex:102-119），再把衰减翻译成扩张唯一与禁并两条结论。[推测] 文本没有交代作者是否先试过"只控制可数多个态"的版本再撞上这堵墙；但 iteration.tex 里 countable determination 的存在本身说明可数对象才是这盘棋的正确棋子，两个态的控制难度与 $\mathfrak c$ 多个态的控制难度之间隔着的，正是 na:bridge 证明里那一整段端点转移机器。

## §4 第一个转折点：把状态装进投影序列里

前两条路都堵在同一个地方：我需要一个对象，既能唯一编码一个纯态，又能在子代数、扩张、重排之间传来传去不丢唯一性。论文的编码方案是 peaking sequence：一列递减投影 $(P_n)$ 称为 peak 到态 $h$，当 $h$ 是满足 $h(P_n)=1$（一切 $n$）的唯一态（states.tex:63-67）。这个定义有三层好处，每一层在后文都被兑现。第一层：peaking 态自动是纯的，因为凸分解的两个态满足同一组约束（states.tex:65-66 的一句话论证）；第二层：peaking 对限制友好，na:peaking-restriction（states.tex:69-80）说若 $(P_n)\subset B$ 在 $C$ 上 peak 到 $H$，则它在 $B$ 上 peak 到 $h=H|_{B}$，并且 $H$ 是 $h$ 到 $C$ 的唯一扩张，证明只有一句话的三行：任何满足约束的 $B$ 态可以扩张成满足约束的 $C$ 态，只能是 $H$，所以只能是 $h$；任何 $h$ 的扩张也满足约束，也只能是 $H$。这个双向推理让我把"$h$ 有唯一扩张"与"某序列 peak 到 $h$"绑成同一件事的可逆词典，而它不需要事先假设 (U)。这个双向推理让我把"$h$ 有唯一扩张"与"某序列 peak 到 $h$"绑成同一件事的可逆词典，而它不需要事先假设 (U)。第三层：peaking 序列在可分情形几乎免费供应，因为 na:base-peak（iteration.tex:76-95）给出原型：$A_0=\bigotimes_{m=1}^{\infty}M_2$（CAR），$p_n=e_{11}^{\otimes n}\otimes 1$，则 $(p_n)$ peak 到一个纯态 $f_0$，且 $\tau(p_n)=2^{-n}$，迹值严格递减趋于零；倒过来，KOS 定理加一条（construction.tex:66-71）让我在任何可分单子代数上把这条序列搬去 peak 到任何我需要的态。

peaking 序列还自带一台产生期望的机器，这是我最初完全没预料到的。na:peaking-expectation（states.tex:253-290）说：忠实迹代数 $(B,\tau)$ 里，若递减投影 $(p_n)$ peak 到 $h$，$p_0=1$，迹值严格递减到零，则 $D=C^{*}(p_n:n\ge 0)$ 同构于 $C(\mathbb N_0\cup\{\infty\})$，且存在保迹条件期望 $E:B\to D$，公式是 $E(a)(n)=\tau(d_nad_n)/\tau(d_n)$（有限原子 $d_n=p_n-p_{n+1}$ 处）而 $E(a)(\infty)=h(a)$（states.tex:261-263）。证明里我读出的每一步都在补别的洞：$d_n$ 是两两正交非零投影，闭张成是 $c_0(\mathbb N_0)$，加单位元成 $D$；关键是 states.tex:268-270 那句 "$\lVert p_n\rVert=1$ 因为 $\tau(p_n)>0$"，它保证 $1$ 到任何 $\sum_{j<n}\mathbb C\,d_j$ 的距离至少是 1，于是 $D$ 真的就是那个收敛序列代数、$\infty$ 点是活的；坐标连续性由投影 excision 给出，估计式 $\lvert \tau(d_nad_n)/\tau(d_n)-h(a)\rvert\le\lVert p_n(a-h(a)1)p_n\rVert\to 0$（states.tex:274-276）；迹守恒的最后一步（states.tex:286-289）用到 $\sum_n\tau(d_n)=1$ 与 $D$ 的迹在 $\infty$ 处零质量，余项被 $\lvert \tau(p_Na)\rvert\le\lVert a\rVert\,\tau(p_N)\to 0$ 吃掉。这条引理就是 bridge 输入的期望从哪来的答案：$D_i$ 上的 $E_i$ 全部由 peaking 序列自动生成，$\theta$ 由匹配 $d_n$ 定义，迹值相等的假设恰好让 $\theta$ 保迹（bridge.tex:41-47）。

## §5 states.tex 的弹药清单：excision 是唯一的度量来源

状态论这一节（states.tex）我读了两遍，因为后面所有硬分析其实都从这里借刀。清单如下，按我使用它们的顺序排。

na:unique-lift（states.tex:35-43）：纯态若有唯一扩张则扩张仍纯。证明是凸分解加限制的三行戏。na:unitary-states（states.tex:45-61）：等价纯态被代数内部单位元共轭互送，用的是 Kadison 传递性含自伴形式（引 Kadison 1957 Theorem 1，states.tex:54-56），于是"酉等价"在唯一扩张下可以逐层传递。这一条让我后面每次说"取代表元 $\phi_i$"时都有合法性。

核心弹药是 na:excision（states.tex:92-158），纯态递减 excision：存在递减的压缩正元网 $x_{\lambda}$，$h(x_{\lambda})=1$，强收敛到 $B^{**}$ 中的最小投影 $r_h$，且对每个 $a$ 有 $\lVert x_{\lambda}(a-h(a)1)x_{\lambda}\rVert\to 0$（states.tex:97-99）。论文说递减网形式出自 Akemann--Anderson--Pedersen 的 Proposition 2.2（states.tex:87-90），并把证明整个重做了一遍。重做的证明结构值得记：先造 $L=\{a:h(a^{*}a)=0\}$ 与 $N=L\cap L^{*}$（states.tex:104-105），验证 $a\in L$ 时 $a^{*}a\in N$（用 $h((a^{*}a)^{2})\le\lVert a\rVert^{2}h(a^{*}a)=0$，states.tex:108-109）；然后证明 $h$ 是唯一湮灭 $N$ 的态（states.tex:111-124），这里出现全文我最喜欢的一个引理调用：单向量 Kadison 传递性给出 $Q_h:B\to H_h$，$Q_h(a)=\pi_h(a)\xi_h$ 是满射，且这个满性在 $H_h$ 不可分时依然成立（states.tex:115-116 专门加注）；开映射定理让我能在商 $B/L$ 上定义有界交织算子 $T$，$T^{*}T$ 由既约性是标量、再由 $\xi_h$ 上的值钉死为 1，于是 $k=h$。接着造网：按算子序排 $N$ 的正元，$e_s=1-(1+s)^{-1}$、$x_s=1-e_s$（states.tex:128-130），函数演算加 inversion 的算子单调性给出递增；逼近单位元的量化估计是 $\lVert (1-e_s)b\rVert^{2}\le 1/(4m)$（states.tex:133-137，当 $s\ge m(bb^{*}+b^{*}b)$）；强极限 $q$ 之后，角 $(1-q)B^{**}(1-q)$ 只有一个正规态、正规态分离自伴元、故角是标量的，推出 $1-q=r_h$ 极小（states.tex:142-148）；最后用"任何弱星聚点若非零、归一后必为 $h$"的论证把聚点法转成范数衰减（states.tex:150-157）。

na:projection-excision（states.tex:160-181）把网版本特殊化到投影列：peak 序列给出 $P_n\downarrow r_h$ 与逐点衰减，外加一个嵌套不等式 $\lVert P_naP_t\rVert\le\lVert P_{\min(n,t)}aP_{\min(n,t)}\rVert$（states.tex:177-179），product 指标集上的收敛由它一句话搞定。na:cross-excision（states.tex:187-215）是 Akemann--Weaver 的 Lemma 1 的变形：两个不等价纯态 $h\not\sim k$ 的 excision 网满足 $\lVert x_{\lambda}ay_{\nu}\rVert\to 0$（states.tex:191-193）。它的证明我先读了三行没懂，停下来想明白的关键是第一步：$\pi_h$ 的正规扩张湮灭 $r_k$，否则 $\pi_h^{**}(r_k)$ 值域里的单位向量经 $r_kar_k=k(a)r_k$ 表示出 $k$，而既约表示里每个非零向量都是循环的，就逼出 $h\sim k$（states.tex:198-201）。之后的二段估计 $\lVert x_{\lambda}ay_{\nu}\rVert^{2}\le h(ay_{\nu_0}a^{*})+\lVert x_{\lambda}(ay_{\nu_0}a^{*}-h(ay_{\nu_0}a^{*})1)x_{\lambda}\rVert$（states.tex:204-210）就是"先固定 $\nu_0$ 吃掉第一项、再让 $\lambda$ 用 excision 吃掉第二项"的矩形尾论证。na:trace-null（states.tex:217-231）：无有限维既约表示时任何纯态支撑投影满足 $\tau(r_h)=0$，证明是在无穷维 GNS 空间里用 Kadison 传递取一串 $u_j$ 使 $u_jr_hu_j^{*}$ 两两正交（利用 $r_hu_i^{*}u_jr_h=h(u_i^{*}u_j)r_h=0$，states.tex:226-228），$m$ 个等迹投影并存的唯一出路是 $\tau(r_h)=0$。na:trace-expectation（states.tex:241-251）：忠实迹代数里保迹条件期望至多一个且必忠实（差 $d$ 满足 $\tau(d^{*}d)=0$）。na:simple-extension（states.tex:295-307）：(U) + 单 + 忠实期望推出扩张单，论证是商映射在 $B$ 上单故等距，每个纯态穿过商零化 $J$ 的扩张按 (U) 只能是 $h\circ E$，纯态分离正元得 $E(a)=0$，忠实性得 $a=0$。

## §6 reduced HNN：Ueda 角构造里藏着的三件赠品

hnn.tex 这一节我原本打算跳过证明直接用，读完发现不能跳：后面每一步"受控"都消费这里的三件赠品，而三件赠品全埋在构造细节里。先把对象摆正。给定忠实迹 $(A,\tau)$、子代数 $D_1,D_2$、保迹期望 $E_i:A\to D_i$、保迹同构 $\theta:D_1\to D_2$；$A$ 与一个新单位元 $v$ 的字形如 $a_0v^{\epsilon_1}a_1\cdots v^{\epsilon_m}a_m$（na:hnn-word，hnn.tex:24-27）；约化条件是只在变号转折点要求内部系数居中：$(\epsilon_t,\epsilon_{t+1})=(+1,-1)$ 时 $E_1(a_t)=0$，$(-1,+1)$ 时 $E_2(a_t)=0$，同号相邻无要求（na:hnn-turns，hnn.tex:30-36，hnn.tex:36 专门写明"等号相邻无要求"）。na:hnn（hnn.tex:38-54）交付的东西：扩展 $H(A)=C^{*}(A,v)$，$vdv^{*}=\theta(d)$；忠实保迹期望 $E_A:H(A)\to A$ 湮灭每个非空约化字；以及一个刚性声明：在所有由 $A$ 与满足同样字迹消失规则的忠实迹扩张里，$H(A)$ 被数据唯一确定，同构固定 $A$ 和 $v$。

构造路线是矩阵角：取 $F=M_2(A)$、$G=M_2(D_1)$、$D=D_1\oplus D_2$，两边分别按 $\operatorname{diag}(d_1,d_2)$ 与 $\operatorname{diag}(d_1,\theta^{-1}(d_2))$ 嵌入（hnn.tex:179-183），$E_D^F(a)=(E_1(a_{11}),E_2(a_{22}))$、$E_D^G(b)=(b_{11},\theta(b_{22}))$（hnn.tex:186-187），对 $(F,G)$ 做约化 amalgamated 自由积 $Z$（na:free-product，hnn.tex:65-174），然后取 $s=e_{21}^{G}$、$H(A)=e_1Ze_1$、$v=e_{12}^{F}s$（na:hnn-corner，hnn.tex:194-197），于是 $v^{*}v=vv^{*}=e_1$、$vdv^{*}=\theta(d)$ 全部自动成立（hnn.tex:199-201）。na:free-product 的证明是标准的 Fock 空间机器：把两个代数按 $\langle x,y\rangle_D=E_D^{i}(x^{*}y)$ 完备成 Hilbert $D$ 模，$K=D\oplus\bigoplus L_{i_1}^{\circ}\otimes_D\cdots\otimes_D L_{i_m}^{\circ}$ 只对交替指标求和（hnn.tex:107-111），真空分量 $D$ 带 distinguished 向量 1；左乘有界性靠 $E_D^{i}(x^{*}a^{*}ax)\le\lVert a\rVert^{2}E_D^{i}(x^{*}x)$（hnn.tex:95-98）。三件赠品分别是：

赠品一：迹的忠实性是逐段啃出来的。traciality 按字长分情况（hnn.tex:135-145）：长度至少 2 的交替居中词两端乘积皆零，单字母情形同因子用因子迹、异因子两边都是零。忠实性走了一条我很长时间没反应过来的路：由 $\tau_Z(z^{*}z)=0$ 出发，对一切 $t$ 有 $0\le\tau_Z(t^{*}z^{*}zt)=\tau_Z(zt\,t^{*}z^{*})\le\lVert t\rVert^{2}\tau_Z(zz^{*})=0$（hnn.tex:147-153），迹在 $D$ 上忠实逼 $E_D((zt)^{*}(zt))=0$，这是 $zt1$ 的 $D$ 值内积，故 $zt1=0$；居中字母的乘积生成全部初等张量，$Z1$ 在 $K$ 中稠密，于是 $z=0$。[推测] 这段把"迹忠实"化归成"Fock 表示循环"，是自由概率的常规手筋，论文没有点破出处但 hnn.tex:16 引 Blanchard--Dykema 的 Lemma 1.1 与 Theorem 1.3 已经指了路。

赠品二：完全矩规定。hnn.tex:211-224 给出约化字在矩阵模型里的展开表：同号时内部系数是 $a_tq$ 或 $q^{*}a_t$（off-diagonal，自动被角射掉），异号时是 $a_t$ 或 $q^{*}a_tq$，其 $D$-期望为零当且仅当 na:hnn-turns 的条件；由于 $s,s^{\pm}$ 居中，展开成 na:free-core（hnn.tex:80-84）形状的词，期望为零。唯一性论证（hnn.tex:226-233）把任何多项式在转折点拆成 $(a-E_i(a))+E_i(a)$，居中部分留作约化字、标量部分用单位元关系吞掉两个稳定字母，反复执行后每个多项式都化为 $A$-项加非空约化字之和，于是迹把一切多项式的矩钉死；再用 $\lVert x\rVert=\lim_r t((x^{*}x)^{r})^{1/(2r)}$（na:moment-norm，hnn.tex:235-237，证明就是谱测度的 $r$ 次根矩趋于谱最大，hnn.tex:238-241）把矩换成范数。hnn.tex:243-245 强调：比较用的扩张里除了字迹消失规则不需要任何额外期望。这一句是后面重排定理能成立的全部原因。

赠品三：限制与重排。na:hnn-restriction（hnn.tex:260-275）说对含 $D_1,D_2$ 的单位子代数 $A'\subset A$，$C^{*}(A',v)$ 同构于以受限迹与受限期望做出的 $H(A')$，期望相应变窄；na:reorder（hnn.tex:285-332）是真正的枢纽：数据都已经在公共底 $O$ 里时 $H_k(H_j(O))\cong H_j(H_k(O))$，固定 $O,v_j,v_k$。它的证明思路我先在纸上画了那个交换正方形（iteration.tex 的图 fig:reordering 显示同一件事）才看懂：在 $C=H_k(H_j(O))$ 里，$H_j(O)$ 与 $H_k(O)$ 都活着（靠赠品三的限制），要证两者在 $O$ 上自由，关键一招是把跨在居中 $H_j(O)$-元 $b$ 两侧的两段 $k$-词并起来，新的内部系数形如 $aba'$（$a,a'\in O$），其 $O$-期望 $aE_O(b)a'=0$，于是合并后的词仍是非空约化 $k$-词，包括每个新转折点（hnn.tex:313-319）；居中块的期望为零因此联合 $O$-值矩由"先居中、逐块吸收 $O$-系数"的递归完全决定，而这个递归对 $j,k$ 对称（hnn.tex:322-331），两个方向的构造给出相同矩，再由 na:moment-norm 得同构。na:hnn-limit（hnn.tex:338-376）补上极限关：链 $O_\beta$ 的并的完备化 $O$ 满足 $\overline{\bigcup H(O_\beta)}=H(O)$；迹的忠实性传递用"零化理想与每个早期代数交为零、故商在稠密并上等距"（hnn.tex:359-365，与 iteration.tex:56-64 的永久事实是同一句话）；约化字在极限里靠把有限个系数一次性逼近到某个早期 $O_\beta$、再把近似元换成 $b-E_i^{\beta}(b)$ 精确居中，误差不超过两倍（hnn.tex:368-372），最后一句声明该论证对任何共尾性都不设防（hnn.tex:374-375）。

## §7 bridge 定理证明内部：范数衰减一寸一寸地推进

我把它证明拆成七个幕。

幕一：升到 $2\times 2$。用 $F=M_2(A)$、$G=M_2(D_1)$、$D=D_1\oplus D_2$、$Z=F*_DG$（bridge.tex:53-58），置 $P_n^{i}=p_n^{i}e_i\in F$、$\phi_i(a)=f_i(a_{ii})$（bridge.tex:63-66）。$P_n^{i}$ peak 到 $\phi_i$ 的理由只有两行：第零项是 $e_i$，取值一的态支撑在那个角上、限制过去恰是 $f_i$（bridge.tex:67-70）。$\phi_1\not\sim\phi_2$ 从 $f_1\not\sim f_2$ 经 GNS 的矩阵放大保持（bridge.tex:70-72）。还有一个容易被略过的检查：$F$ 也没有有限维既约表示，因为沿 $a\mapsto\operatorname{diag}(a,a)$ 限制会给出 $A$ 的非零有限维既约表示（bridge.tex:73-76）。[推测] 升矩阵的目的在我看来是把"两个态"装进同一个代数的两个角里，这样 excision 网与 $s,s^{*}$ 的左右角标才有机可乘；论文没有写这层动机，但证明里所有 $\ell(b),r(b)$ 记号都在配合它。整个证明在 $F\subset Z$ 上做，最后再降回角（bridge.tex:78-85）。

幕二：代表元与测试对。由 na:unitary-states，等价类内取代表随意，于是两个特殊类就取 $\phi_1,\phi_2$ 本身；对所有满足 bridge.tex:88-93 的测试对（$h=k$，或 $h\not\sim k$ 且 $\{[h],[k]\}\ne\{[\phi_1],[\phi_2]\}$）配 excision 网 $x_\lambda,y_\nu$（在 $\phi_i$ 处直接取投影列 $P_n^{i}$，合法性来自 na:projection-excision，bridge.tex:95-98）。目标陈述：对 na:matrix-word-span（hnn.tex:253-258）的每个非空字 $W$ 有 $\lVert x_{\lambda}Wy_{\nu}\rVert\to 0$（bridge.tex:102-107）；$h=k$ 时它将逼出扩张唯一，不等价时将逼出提升仍不等价（bridge.tex:104-107）。

幕三：字衰减的归约机器。任何 $Z$ 中稠密字写作 $xa_0b_1a_1\cdots b_ma_my$，$b_j\in\{s,s^{*}\}$，内部系数居中（eq:bridge-word-decay 与 eq:bridge-centering，bridge.tex:112-119）。Fock 模上的正交投影 $P_G$（投到以 $L_G^{\circ}$ 开头的分量）给出关键不等式 $\lVert dP_G\rVert\le\lVert E_D^{F}(d^{*}d)\rVert^{1/2}$（eq:bridge-module-bound，bridge.tex:127-137，证明是把向量写成 $1\otimes\eta$ 再取 $D$-值内积的范数）。记 $\ell=r$ 记号为字的起止角标（bridge.tex:139-146），核心观察是居中交替核 $w=b_1a_1\cdots b_ma_m$ 满足 $(1-P_G)w(1-P_G)=0$，因为每个字母从右往左作用都新开一条 $G$-腿（bridge.tex:147-152）；于是 $\lVert dwd'\rVert\le\lVert dP_G\rVert\lVert w\rVert\lVert d'\rVert+\lVert d\rVert\lVert w\rVert\lVert P_Gd'\rVert$（eq:bridge-two-ends，bridge.tex:154-158），字衰减归约为两个端点条件 $\lVert E_D^{F}(e_{\ell}a_0^{*}x^{2}a_0e_{\ell})\rVert\to 0$ 与 $\lVert E_D^{F}(e_ra_my^{2}a_m^{*}e_r)\rVert\to 0$（eq:bridge-endpoints，bridge.tex:161-166），且这个充分判据对端点态不提任何测试对要求（bridge.tex:167-168），为幕五的转移埋下伏笔。

幕四：端点何时衰减。把 $x^{2}$ 放大成 $x$，所得是 $D$ 谱（两条收敛序列的不交并）上递减的正连续函数网，在另一个分量上恒零。在有限原子 $Q=P_n^{\ell}-P_{n+1}^{\ell}$ 处逐点极限是 $\tau_F(Qa_0^{*}r_ha_0Q)/\tau_F(Q)=0$，分子被 na:trace-null 吃掉：$0\le\tau_F(r_ha_0Qa_0^{*})\le\lVert a_0Qa_0^{*}\rVert\,\tau_F(r_h)=0$（bridge.tex:171-186）。在 $\infty$ 点极限是 $\phi_{\ell}(a_0^{*}r_ha_0)$：$h\not\sim\phi_{\ell}$ 时它为零，理由又是 cross-excision 的第一步（$\phi_{\ell}$ 的正规扩张湮灭 $r_h$）；$h=\phi_{\ell}$ 时支撑恒等式给出 $\phi_{\ell}(a_0^{*}r_ha_0)=\lvert\phi_{\ell}(a_0)\rvert^{2}$（bridge.tex:187-194）。所以端点唯一不衰减的情形是 $h=\phi_{\ell}$ 且 $\phi_{\ell}(a_0)\ne 0$。逐点到一致靠 Dini 定理的网形式（引 Naimpally--Peters 的 Theorem 1.5，p.306，bridge.tex:198-199），bridge.tex:199-204 还完整复述了紧性论证：定 $\varepsilon$、开覆盖、有限子覆盖、取支配指标、单调性收尾。我读到这里停了一下：整个衰减机器其实只需要谱是紧的这半句，而 $D\cong C(\mathbb N_0\cup\{\infty\})$ 的紧性正是 peaking 序列递减给出的。

幕五：摘除匹配端点。左端匹配指 $h=\phi_{\ell}$，右端匹配指 $k=\phi_r$；匹配端分解 $a_0=\phi_{\ell}(a_0)1+a_0^{0}$（bridge.tex:210-217），展开后每个单项要么落入已证衰减，要么是标量项；标量项靠转移恒等式 $P_n^{\ell(b)}b=bP_n^{r(b)}$、$bP_n^{r(b)}=P_n^{\ell(b)}b$（eq:bridge-transfer，bridge.tex:223-226）把峰推到字的内侧，转移的法律依据在 $G$ 里：$D_2$ 的对角嵌入带 $\theta^{-1}$，两端投影在 $G$ 中是同一个矩阵元 $p_n^{1}$（bridge.tex:227-229）。一次转移（$m\ge 2$）后峰变成另一侧字母的内部系数，被转移出的 $b_1$ 只是有界外围因子（bridge.tex:231-240）；两次转移（$m\ge 3$）后新露头的端点系数都是原内部 $a_j$，居中条件让它们满足 $\phi_1(a_j)=\phi_2(a_j)=0$（内部系数的 $E_D^{F}$ 值在 $\infty$ 处两分量为零，bridge.tex:248-253），于是幕四判据无条件成立。剩下核消失的小情形逐一处理：$m=1$ 时两端不可能同时匹配，同时匹配就是被测试对排除的指定对（bridge.tex:262-265）；单端转移剩 $P_n^{j}a_1y_{\nu}$（$j\ne i$），$k$ 与 $\phi_j$ 不等价（等价的两种可能各自都落回排除条件，bridge.tex:266-275），cross-excision 收工；$m=2$ 双端转移迫使 $h=k=\phi_i$，两字母轮流换角标，剩 $P_n^{j}a_1P_t^{j}$，$\phi_j(a_1)=0$，嵌套性给 $\lVert P_n^{j}a_1P_t^{j}\rVert\le\lVert P_q^{j}a_1P_q^{j}\rVert\to 0$（$q=\min(n,t)$，bridge.tex:277-290）。至此 eq:bridge-word-decay 全部证完。我在草稿纸上核对过转移后"至多移一次峰"的账：每一次转移把匹配端点变成内部系数，内部系数天生在两 $\phi$ 处为零，这正是居中条件 $\phi_i$ 分量的免费赠品（bridge.tex:249-253）。

幕六：衰减换成两个结论。唯一扩张：设 $\psi$ 是 $h$ 到 $Z$ 的任意扩张（$h=k$ 测试），态值为 1 的压缩正元固定 GNS 向量（$\lVert (1-\pi_{\psi}(x))\xi_{\psi}\rVert^{2}\le\psi(1-x)=0$，bridge.tex:296-299），故 $\psi(W)=\psi(x_{\lambda}Wy_{\nu})\to 0$（bridge.tex:300-303），非空字上 $\psi$ 全为零、在 $F$ 上又是 $h$，稠密生成元定死 $\psi$；存在性由 $h\circ E_F^{Z}$ 直接给出（bridge.tex:304-306）；$F$ 内单位元共轭把唯一性推广到每个旧纯态，包括两个特殊类的全体成员，纯度由 na:unique-lift 接手（bridge.tex:306-309）。禁并未央合并：取允许的 $h\not\sim k$，若唯一提升等价，在同一既约表示 $\pi$ 里用单位向量实现，激励元素同时固定两向量使 $\langle\pi(z)\xi_k,\xi_h\rangle=\langle\pi(x_{\lambda}zy_{\nu})\xi_k,\xi_h\rangle$（bridge.tex:311-319）；右端对 $z\in F$ 由 cross-excision、对非空测试字由 eq:bridge-word-decay 趋于零，于是矩阵系数在全部 $Z$ 上为零，与 $\xi_k$ 的循环性矛盾（bridge.tex:320-327）。旧类内部等价则提升等价（na:unitary-states 加 na:unique-lift，bridge.tex:324-327 的最后一句）。

幕七：回到角、完成指定合并、单性。$A=e_1Fe_1$ 的态等同于 $F$ 上在 $e_1$ 取一的态（复合压缩），$H(A)=e_1Ze_1$ 同理且与限制交换；$e_1$-支撑扩张仍 $e_1$-支撑，于是 $A\subset H(A)$ 继承 (U)（bridge.tex:330-337）。矩阵放大下的 GNS 结构保证纯性与类对应，矩阵翻转载 $G$ 的 $\phi_2$ 送回第一分量使 $[\phi_2]\leftrightarrow[f_2]$（bridge.tex:338-345）。指定合并的存在反过来用关系本身：$\widetilde f_2\circ\Ad v$ 在每个 $p_n^{1}$ 上取一，限制回 $A$ 是 $f_1$，唯一扩张给出 $\widetilde f_1=\widetilde f_2\circ\Ad v$（bridge.tex:347-353）；最后 na:simple-extension 把 (U) 加忠实期望合成单性（bridge.tex:354-356）。整节读完我的体会：所谓"选择性 bridge"，选择性完全由测试对（bridge.tex:88-93）的否定部分与幕五的角标轮换承担，而正部分的"必须合并"只花三行。真正贵的是控制全部旧态那半壁，代价是一整套端点转移机器。

## §8 第二个转折点：把省略的步骤挪到最后去

iteration.tex 的野心在开头两句就说破了：链上每个纯态应由一个可分子代数唯一决定（iteration.tex:4-8）。工欲善其事，先得把"链"的簿记立起来。连续链定义在 iteration.tex:12-15；na:unique-chain（iteration.tex:17-31）说后继有 (U) 的连续链任意段都有 (U)，且等价态的唯一提升保持等价，证明是"唯一扩张可复合、极限处两个扩张在每段早期代数上相等故在稠密并上相等"的传递归纳。na:inequivalent-limit（iteration.tex:33-53）是配套的负向永久事实：若 $h,k$ 在某尾段每个 $B_\alpha$ 上限制都不等价，则极限上也不等价；证明在单个既约表示里比较循环子空间 $M_\alpha,N_\alpha$，两者约化且携带不等价既约限制，投影限制过去是交织算子、由 Schur 性为零，矩阵系数在稠密并上全零，矛盾于循环性（iteration.tex:40-52）。再加两句永久事实（iteration.tex:55-64）：单性沿连续并可、忠实迹在极限保持（零化理想与每段交零）。这些全是后台。

真正的对象是 $A_0$ 与它上面的 bridge 迭代：$A_0=\bigotimes M_2$、$p_n=e_{11}^{\otimes n}\otimes 1$（iteration.tex:69-72），na:base-peak 交出 $f_0$ 与 $\tau(p_n)=2^{-n}$，还顺手证明任何含 $A_0$ 的单位代数没有有限维既约表示（无穷维单代数装不进有限维代数，iteration.tex:91-94）：bridge 的前提之一就是它，所以从这一步起前提永久成立。给定连续链 $(X_\beta)_{\beta\le\delta}$，$X_0=A_0$，活动指标 $j$ 处用 $(p_n)$ 与某个 $(q_n^{j})$（peak 到与 $p_n$-态不等价的态、$\tau(q_n^{j})=2^{-n}$）做 bridge，其余指标恒等步（iteration.tex:97-106）。$I_j\subset j$ 是可数集，装下 $(q_n^{j})$ 全部元素（iteration.tex:122-123）；dependency-closed 定义为 $j\in T$ 蕴含 $I_j\subset T$（eq:dependency-closed，iteration.tex:125-127），任何可数集都能靠"反复并依赖、取 $\mathbb N$ 指标并"闭包化（iteration.tex:128-130）。$A[T]=C^{*}(A_0,\{v_j:j\in T\ \text{active}\})$（iteration.tex:112-116），并且每个 $X_\delta$ 的元素都住在某个可数 $A[T]$ 里：用一列多项式逼近，每个多项式只涉有限个稳定单位元（iteration.tex:117-120）。na:inherited（iteration.tex:132-164）断言 dependency-closed 的 $T$ 继承整个迭代结构：$A[T\cap\beta]$ 组成按原序的连续 bridge 迭代，非 $T$ 指标是恒等步；论证要点：$k\in T$ 活动的桥两列序列都在 $A[T\cap k]$ 里、期望限制过去（因为值域本来就在里面，靠 na:hnn-restriction 认出约化 HNN）、两态在小子代数上仍 peak 且仍不等价（na:peaking-restriction 给唯一扩张，若等价则提升等价，违背原活动步的选择，iteration.tex:147-153）、$A_0\subset$ 小底排除有限维既约表示，于是 na:bridge 的全部前提在继承迭代中成立。

但 na:inherited 只说"内部"的 (U)，目标是更强的 na:closed-extension（iteration.tex:172-175）：$A[S]\subset X_\delta$ 整段有 (U)。这里出现我通读全文时认为最精彩的一手：把省略的活动步 $j\notin S$ 从链里抠出来，插到 $A[S]$ 之后重排，证明重排不改变结果。固定 $j$，对 $j+1\le\beta\le\delta$ 设 $O_\beta=A[j\cup(S\cap\beta)]$、$R_\beta=A[(j+1)\cup(S\cap\beta)]$（eq:reordered-bases，iteration.tex:181-185）。第一个子命题：省略的那一对态（$(p_n)$ 峰与 $(q_n^{j})$ 峰）在每个 $O_\beta$ 上仍不等价。归纳推进：$k\in S$ 活动且 $k>j$ 时，三个具体态（$p_n$-态、$q_n^{j}$-态、$q_n^{k}$-态）在 $O_k$ 上各自 peak、在 $X_k$ 上各有唯一扩张（na:peaking-restriction，明确注明这不依赖被证定理，iteration.tex:197-199），而在 $X_k$ 上 $q_n^{j}$-态已等价于 $p_n$-态（第 $j$ 步做过了）、$q_n^{k}$-态与它不等价（第 $k$ 步是活动步），故 $O_k$ 上 $q_n^{k}$-态与那两个都不等价，否则等价会传到各自唯一扩张、再传到 $X_k$ 上打架；第 $k$ 步的桥只并指定对（na:bridge 的选择性！），所以它并不掉省略对的两个态；极限处用 na:inequivalent-limit 续命（iteration.tex:206-210）。我在这个归纳里看到的正是第四条路（只控制指定态对）反过来救场：bridge 定理的"其余不并"此刻成了维持子代数间比较的守恒律。

第二个子命题：省略步可与一切继承步交换。$R_\beta\cong H_j(O_\beta)$（eq:omitted-adjunction，iteration.tex:216-219）：起点显然；活动 $k\in S$ 处，两个 HNN 数据（$j$ 数据与 $k$ 数据）都在 $O_k$ 里，而 $R_k=H_j(O_k)$ 上向 $O_k$ 的期望再复合 $k$-数据期望，是保迹期望进入 $D_i^{k}$，由 na:trace-expectation 的唯一性与桥给出的期望重合（iteration.tex:220-226），$j,k$ 互换同理，于是 na:reorder 交出 $H_k(H_j(O_k))\cong H_j(H_k(O_k))$；极限处用 na:hnn-limit 对固定数据 $(p_n),(q_n^{j})$ 收拢（两条向固定交换子代数的期望在重叠上一致，仍靠 na:trace-expectation，iteration.tex:256-263）。$\beta=\delta$ 时得到 $A[S\cup j]\subset A[S\cup(j+1)]$ 的 (U)（子命题一保证 na:bridge 前提仍在，iteration.tex:265-273）；对 $j$ 从 $S$ 到全序逐步走，连续链 $(A[S\cup j])_{j\le\delta}$ 从 $A[S]$ 出发终于 $X_\delta$（多项式只涉有限个指标故连续），na:unique-chain 收官（iteration.tex:275-278）。

countable determination（na:countable-determination，iteration.tex:288-319）把两台机器接在一起：对 $X_\delta$ 的纯态 $h$，从 $S_0=\varnothing$ 起，取 $A[S_n]$ 的可数稠密子集 $D_n$，对每个 $(a,m)$ 用 na:excision 选见证元 $x_{a,m}$（$h(x_{a,m})=1$、$\lVert x_{a,m}(a-h(a)1)x_{a,m}\rVert<1/m$，iteration.tex:296-301），每个见证元支撑可数，把支撑全并入再依赖闭包得 $S_{n+1}$；$S=\bigcup_nS_n$、$B=A[S]$ 上，$h|_B$ 的任何凸分量在每个 $x_{a,m}$ 上取值一故固定其 GNS 向量，推出 $\lvert h_i(a)-h(a)\rvert<1/m$ 对一切 $m$，即 $h_i$ 与 $h$ 在每个 $D_n$ 上相等，稠密性给纯；唯一扩张则由 na:closed-extension 现成接走（iteration.tex:306-318）。配套的基数账 na:state-count（iteration.tex:321-337）：$\lvert\delta\rvert\le\mathfrak c$ 时可数子集只有 $\mathfrak c^{\aleph_0}=\mathfrak c$ 个，每个可数生成的 $A[S]$ 可分、态由可数稠密集上的值决定故至多 $\mathfrak c$ 个，纯态全体被"限制加唯一扩张"参数化，总数 $\mathfrak c\cdot\mathfrak c=\mathfrak c$。iteration.tex:283-286 注明这段与 Akemann--Wassermann--Weaver 的 Proposition 2.3 收尾 Remark 1 同源，新点在于要求可数子代数 dependency-closed，从而 na:closed-extension 可以补上"唯一"二字。

## §9 终结递归：先写日程表，再盖代数

construction.tex:22-139 把一切装上轨道。$\kappa=\mathfrak c^{+}$；每个 $\beta<\kappa$ 基数至多 $\mathfrak c$，$\kappa$ 的任何可数子集有界（否则 $\mathfrak c^{+}$ 是可数个 $\le\mathfrak c$ 集合的并，construction.tex:23-26）。第一步在盖任何代数之前固定日程表：注入 $\sigma:\kappa\times\kappa\to\kappa$ 满足 $\sigma(\beta,\eta)\ge\beta$（eq:schedule，construction.tex:30-34）；做法是把 $\kappa\times\kappa$ 按序型 $\kappa$ 枚举，遇到 $(\beta,\eta)$ 就取一个没用过且 $\ge\beta$ 的 ordinal，已用去的不足 $\kappa$ 而 $\beta$ 以上剩 $\kappa$ 个（construction.tex:35-39）。这一步是整个 ZFC 化的心脏：日程表不知道任何态的存在，纯粹集合论先行；态的处理时刻由"未来某 $j$ 配到 $(\beta,\eta)$"保证，猜测原理的岗位被日程表加捕获定理顶替。

逐阶段推进（construction.tex:41-93）：$X_0=A_0$ 起步；$\beta<\kappa$ 时先给 $X_\beta$ 选一张含其全部纯态（可重复）的单子 $(h_{\beta,\eta})_{\eta<\kappa}$，na:state-count 保证排得下（construction.tex:45-51）。阶段 $j$：若 $j$ 不在 $\sigma$ 的值域，恒等步；写 $j=\sigma(\beta,\eta)$，取 $h_{\beta,\eta}$ 到 $X_j$ 的唯一提升 $g$（单子在手因为 $\beta\le j$；$\beta=j$ 时先选单子再走后继步，construction.tex:53-58）；$g\sim f$（$f$ 是 $(p_n)$ 峰态）就恒等；否则由 na:countable-determination 取可数 dependency-closed $S\subset j$ 使 $g|_{A[S]}$ 纯且唯一决定 $g$；$f|_{A[S]}$ 由 na:peaking-restriction 纯；$A[S]$ 可分、单、单位（na:inherited）；KOS 给 $\gamma\in\operatorname{Aut}(A[S])$ 使 $(g|_{A[S]})\circ\gamma=f|_{A[S]}$，置 $q_n^{j}=\gamma(p_n)$，则 $(q_n^{j})$ 在 $A[S]$ 上 peak 到 $g|_{A[S]}$、由 na:closed-extension 在 $X_j$ 上 peak 到 $g$（construction.tex:61-75）；迹匹配靠矩阵角论证 $\tau(q_n^{j})=2^{-n}=\tau(p_n)$（construction.tex:76-86）；做 na:bridge，记 $I_j=S$，恒等步记 $I_j=\varnothing$（construction.tex:88-89）。极限取范数闭包。每个后继满足 (U) 且有忠实保迹期望，于是 §8 的全部机器对整条递归一路可用（construction.tex:90-93）。所有选择都是集合大小的：把结构、迹、嵌入、态、自同构、单子编成某固定集合（基 $\lambda=\kappa^{\aleph_0}$）上的码、良序之、逐个选择再重编为规范代表，普通的良序递归在 ZFC 内合法（construction.tex:95-103）。[推测] 这段"码与良序"是应形式审查而写的：不加它就会被人质疑类大小的选择；文本没有讲这个背景，我按标准做法解读。

最后是收网（construction.tex:106-121）。取 $A=X_{\kappa}$ 与任一纯态 $h$：na:countable-determination 给可数 dependency-closed $S\subset\kappa$，$h|_{A[S]}$ 纯且唯一决定 $h$；$S$ 有界，取 $\beta$ 使 $A[S]\subset X_\beta$；断言 $h|_{X_\beta}$ 是 $h|_{A[S]}$ 到 $X_\beta$ 的唯一扩张，证明是反向传递：若另有扩张，它自己还能继续扩到 $A$，就撞上 $A$ 上的唯一性（construction.tex:112-114），故 $h|_{X_\beta}$ 纯。在 $\beta$ 的单子里选 $\eta$ 使 $h_{\beta,\eta}=h|_{X_\beta}$，令 $j=\sigma(\beta,\eta)$，它在 $X_j$ 的提升就是 $h|_{X_j}$；阶段 $j$ 上它或者已在 $(p_n)$-类里、要么被桥并进去；na:unique-chain 把等价一路带到 $A$（construction.tex:116-121）。加上 §1 说的"单位代数既约表示自动单位、单位向量给出纯态"，$A$ 的全部非零既约表示挤在一个酉等价类里（construction.tex:123-129）。收尾：$A$ 单、有忠实迹、单位，含无穷维的 $A_0$；$K(H)$ 单位仅当 $H$ 有限维（无穷维单位元不紧：无穷正交列无范数收敛子列，construction.tex:131-138）。主定理证毕。

复盘到这里，最终形态与我最初设想的差异可以列成三行。第一行：我原以为 ZFC 化的障碍是"没有猜测原理就排不出态的次序"，实际障碍是"极限态在早期阶段根本不出现"，解法因此落在捕获定理（countable determination），排序只是它的配套。第二行：我原以为反例的核心困难在"合并"，实际核心困难在"不许意外合并"，na:bridge 的全部机器都是为选择性服务的。第三行：我原以为长度 $\omega_1$ 是本质（毕竟 $\aleph_1$-生成元情形独立于 ZFC），这里的递归长度是 $\mathfrak c^{+}$，且 introduction.tex:59-61 明确不主张它等于密度；两个基数在 CH 下重合、否则分离，[推测] 论文回避密度问题是因为答案会牵出另一组与 Tanaka 构造比较的技术细节，文本没有展开。

## §10 与 Tanaka 的 ZFC 构造对照，以及这份稿子的诚实账

Tanaka 2026（introduction.tex:48-53，引他们的 Theorems 1.1、4.1 和 5.3）已经在 ZFC 造出带忠实迹态的反例：从 CAR 出发，用 strong shell sums 与 rank-one defects，还给出一条可分 Hilbert 空间上的忠实表示，只是那条表示不既约。本文与它的关系，introduction.tex:53-58 的说法是 alternative proof，组件对照表如下：起点同为 CAR 型代数（本文 iteration.tex:70 的 $A_0$ 与 Tanaka 的 CAR）；合并机制不同（本文：peaking 序列加约化 HNN 桥，Tanaka：shell sums 加 rank-one defects）；既约表示的处理不同（Tanaka 只保证某条忠实表示不可约性缺失可控，本文直接冲"纯态单一等价类"）；对集合论的态度相同（都是 ZFC），但本文额外把"无意外合并"与"重排兼容"做成可复用引理。introduction.tex:113-131 的前身清单也支持一个判断：Farah--Hirshberg 的指定可数等价模式（他们的 Lemma 2.3）、Akemann--Wassermann--Weaver 的自由群代数唯一扩张（Proposition 2.3 与 Theorem 2.6）、Calderón--Farah 第 8 节 Question 8.1 提出的"可数决定加保唯一扩张合并"纲领，本文是对最后一条纲领的完整兑现（introduction.tex:124-130 原话式的定位）。

诚实账要算到底：主定理 na:main 的存在性结论没有任何新意，新意在架构；论文自己也只主张三件中间事实（selective bridge、reduced-HNN reordering、dependency-closed unique extension 与 countable determination，introduction.tex:54-58），一件都不多报。[推测] 我猜这个姿态决定了全文证明密度：凡"旧世界"里被猜测原理一笔带过的地方（比如"下一个该处理的态是谁"），这里都要用一整套可数决定机器重新问一遍"这个态过去是否已被唯一决定"。两处最贵的账单我都记在 §7 幕五与 §8 子命题一：端点转移机器与省略对的守恒归纳，都是 diamond 时代不需要付的税。

## §11 缺口、[推测] 汇总与勘误

文本给不了我的东西，逐条挂出来。其一，作者的工作顺序没有任何自述，§3 的四条"弯路"是我按"每个技术选择反着删一遍"构造出来的复盘，属于对文本结构的解读，标注过 [推测] 的三处（矩阵放大的动机、码与良序的用途、回避密度问题的原因）同样只有文本内证。其二，Naimark 原始的环同构表述（$A\cong A^{**}$ 作为环是否逼出 type I）在 tex 里没有出现过一次，本文全程用表示论表述（introduction.tex:4-8），从表示论版本到环版本是否等价，tex 无字，我无法在本笔记里给出判断，标 [推测]：两者在文献中通常被视为同一问题的不同强度，文本沉默，我就沉默。其三，Vaccaro 的 Choquet 单纯形结果（introduction.tex:42-46）说明带迹不是障碍，那本文主定理特意把"忠实迹态"写进结论，动机只能是让反例落在迹空间几何这些后续应用够得着的类里，文本同样无字，[推测]。其四，Tanaka 构造的密度、递归长度等参数 tex 未复述，§10 的对照表只到文本提供的粒度为止。

勘误（按规格以追加方式记录，不改已落盘正文）。第一条：§3 初稿曾使用过一个四字转述禁语，因文风格式闸门要求零命中，我在当次会话内以最小定点替换将其改为"等价地"，前后句文字未动，此事在此备案并在交付报告申报。第二条：两次 Edit 因锚点取自中间段落而返回 0 匹配，未产生任何写入或破坏，随后改用真实末段锚重发成功；这提示我此后每次追加前都先用文件尾行核对锚点。其余无。前向引用自查：§3 提到第四条路、§8 提到第四条路反过来救场、§9 引用 §8 的机器、§1 引用 construction.tex:123-129 的既约表示单位性，所有"见 §N"均有实体。

### 二轮笔记（D208 补记）

勘误补记一条：§7 幕五初稿曾出现成对长破折号各两处，属文风禁串，为过零命中闸门已当会话做最小定点替换（改为分号），替换只触及标点、未动任何句子文字；以下补记为纯插入，位于台账之前，不改动上文任何已落盘内容。

A. bridge 证明的三层细读。第一层，测试对里为什么收 $h=k$：要证扩张唯一，本该证任意两个扩张相等，但态是正的、差没有正性可用，excision 路线干脆绕开"两个扩张"的说法：任一扩张 $\psi$ 的 GNS 向量被每个 $x_\lambda$ 固定（bridge.tex:297-299 那一行不等式 $\lVert (1-\pi_{\psi}(x))\xi_{\psi}\rVert^{2}\le\psi(1-x)=0$ 是全部机关），于是 $\psi$ 在每个非空测试字上取值零，而它在 $F$ 上已经等于 $h$，稠密性逼死 $\psi$。我从中读出的方法是：把"两个对象相等"改写为"每个对象等于同一个常数"，正泛函世界里这招比线性减法定得多。第二层，$t_n\to 0$ 到底花在哪：只在 na:peaking-expectation 的最后一步，余项被 $\lvert\tau(p_Na)\rvert\le\lVert a\rVert\,\tau(p_N)\to 0$ 吸收（states.tex:288-289），这要求 $D$ 的迹在 $\infty$ 点零质量，而这正是 $t_n$ 归零的翻译；若容许 $t_n\downarrow t_\infty>0$，角构造照样做得出，但保迹期望消失，na:simple-extension 的忠实期望输入断供，单性链条整段脱节。基准序列取 $2^{-n}$（iteration.tex:79）同时满足严格递减、归零、每级都是矩阵层最小投影的迹这三件事，KOS 搬运后迹匹配才会"自动"（construction.tex:78-86），这两个字我起初觉得是修辞，复盘后确认它是设计：$2^{-n}$ 让"验证 $\tau(q_n^{j})=\tau(p_n)$"从一次全局迹计算降为一次唯一性引用。第三层，$\phi_i(a)=f_i(a_{ii})$（bridge.tex:65-66）的兼职清单：把两条 peaking 序列换成 $M_2(A)$ 里两个角上的投影列，$\ell(b),r(b)$ 角标记号由此可读；证明 $F$ 无有限维既约表示只需对角限制一条（bridge.tex:73-76）；回角阶段矩阵翻转载 $\phi_2$ 归第一分量，$[\phi_2]\leftrightarrow[f_2]$ 的类对应才不别扭（bridge.tex:341-345）。三件事共用一个记号，这是全文压缩最狠的一页。

B. 重排与可数决定的量化账。na:trace-expectation 的唯一性在 iteration 里被点了两次名：一次在活动步交换处（把 $R_k$ 向 $O_k$ 的期望复合 $k$-数据期望，凭保迹与唯一性认成桥供的那个期望，iteration.tex:220-226），一次在极限收拢处（保证重排链上两个固定交换子代数的期望在重叠上一致，iteration.tex:256-263）。na:reorder 的"联合矩递归对 $j,k$ 对称"之所以合法，前提恰是这些期望彼此不冒第二种选择；[推测] 若 amalgam 上存在两个不同保迹期望，hnn.tex:322-331 的对称递归立刻失效，两个方向的构造不再共享可比较的矩。这个反例情形文本没有展开，我按论证骨架补推。精度账另一头：countable determination 全程只有一个自由参数 $m$（见证元误差 $1/m$，iteration.tex:297-301），配合 directed set 尾段，没有玩 $\varepsilon/2^{n}$ 拆预算的把戏；hnn.tex:370-372 里极限步的居中替换报的是"误差不超过两倍"的粗账。这解释了我最初的一个困惑：为什么 excision 必须以网的形式记（states.tex:87-90 特意写明"record a proof in the net form"），因为全文的收敛语言本来就是乘积定向集上的尾收敛（bridge.tex:99-100 与 states.tex:212-213 两处都点名 product directed set），序列版本只在 peaking 投影列这一特例上复活。$\sigma$ 的账最省：它唯一被用的性质是单射、值域可控与 $\sigma(\beta,\eta)\ge\beta$（construction.tex:30-39），不在值域内的阶段自动变闲置步（construction.tex:54-55），连"对角线"这个词都不必出现，捕获靠的是"每个终态在某个 $\beta$ 的单子里有名字"与"名字被排到 $\ge\beta$ 的某 $j$"这两条的合取。

C. 与外部问题的接口盘点，全部标 [推测]，并说明文本凭什么撑不住。其一，环同构版 Naimark 问题（$A\cong A^{**}$ 作为环是否逼出 type I）在七个 .tex 里一次都没出现：$B^{**}$ 只作为支撑投影与态的正规扩张的值域出现（states.tex:20-24），全文没有把 $A^{**}$ 当代数讨论；从表示论表述推回环表述的强度差别，本笔记无法在素材内闭合。其二，迹态空间的几何：Vaccaro 在 diamond 下把单纯形任意化（introduction.tex:42-46），本文递归对终代数的迹空间没有给出任何描述句，素材内它应当悬空。其三，密度与生成元数：文本给出 density $\le\kappa$ 的粗上界（construction.tex:95-97）并明确拒称 $\mathfrak c^{+}$ 是密度（introduction.tex:59-61）；下界方向连一条引理都没有。其四，与 $\aleph_1$-生成元独立性问题（introduction.tex:34-37）的关系：本文构造没有任何生成元数承诺，因此它处在 Akemann--Weaver 独立性的管辖之外，这个"之外"是文本自己说的一半（"does not impose this bound"，introduction.tex:36-37），另一半（构造内是否隐藏 $\aleph_1$ 生成的片段）素材无字，我不去补。

### 三轮补记：五个自问自答与术语对表

问题一：bridge 为什么需要"无有限维既约表示"这个前提？答：它只在两处被真正消费。一处是 na:trace-null（states.tex:217-231）：无穷维 GNS 空间里能取无穷多两两正交的等迹支撑投影共轭，迹归零才成立，有限维时这步直接死；另一处是 na:base-peak 的赠品（iteration.tex:91-94）：含 $A_0$ 保证前提沿整个递归永久成立，于是 bridge 的输入检查在 §9 的逐阶段推进里被压缩成一句"继承"。两处合起来说明该前提的强度刚好：多一分则难验证，少一分则端点衰减里的有限原子归零（bridge.tex:176-186）失去依据。

问题二：闲置阶段为什么也要记 $I_j=\varnothing$？答：为了 dependency-closed 的定义（iteration.tex:125-127）在全部 $\delta$ 上一个口径。若闲置阶段不留登记，$T$ 的闭包化（iteration.tex:128-130）就要额外区分两类指标，na:inherited 的归纳里"$k\in T$ 活动"的分支条件会多一层书写。这是纯簿记选择，文本用一行把它做完（construction.tex:89）。

问题三：单子为什么允许重复？答：容量论证只需要"每个态至少出现一次"，重复让列举不必构造无重复满射，省一层选择公理的使用；配合 na:state-count 的 $\le\mathfrak c$ 上限，长度 $\kappa$ 的单子恰好排得下（construction.tex:45-51）。

问题四：KOS 定理的前提"GNS 表示同核"在本文场景凭什么自动？答：用到的地方只有 $A[S]$，它是可分单的（na:inherited），纯态的 GNS 表示是既约的、其核是真闭双边理想，单代数里真理想只剩零理想，于是所有纯态的 GNS 核同为零，construction.tex:14-15 那句 "In particular" 就是这一行推理的压缩形态。我第一遍读时以为这里还要调用什么深结果，复盘确认只是单的定义展开。

问题五：重排定理 na:reorder 最接近文献里的什么旧知识？答：自由积的正则形式里"两组自由生成元在公共子代数上方差可交换"是概率学家熟悉的事，论文把它的 C*-版本写死在 hnn.tex:285-332，靠 na:moment-norm 把代数恒等升级成同构；[推测] 这一步之所以此前没人写成引文可用形态，多半因为旧构造里伴随扩张从不重排，diamond 的顺序是硬的，没有需求就没有引理。本笔记 §8 的两个子命题正是把这条新引理用满的地方。

术语对表（中，英，首次出处）：既约表示，irreducible representation，introduction.tex:17-18；纯态，pure state，states.tex:10-11；忠实迹态，faithful tracial state，states.tex:18-20；峰达序列，peaking sequence，states.tex:63-65；支撑投影，support projection，states.tex:84-85；切除，excision，states.tex:92 起；交叉切除，cross-excision，states.tex:187 起；条件期望，conditional expectation，states.tex:236-239；约化字，reduced word，hnn.tex:28-36；稳定单位元，stable unitary，hnn.tex:47-48；性质 (U)，property (U)，states.tex:27-29；依赖闭包，dependency-closed，iteration.tex:124-127；可数决定，countable determination，iteration.tex:288 起；日程表，schedule，construction.tex:30-34；齐次性定理，Kishimoto--Ozawa--Sakai homogeneity，construction.tex:9-16。

### 四轮收束感想（D208 完稿前）

收笔前记三件私事。第一件，这篇稿子我返工最多的一处是 §7 幕三到幕四的衔接：两端估计 eq:bridge-two-ends（bridge.tex:154-158）与端点判据 eq:bridge-endpoints（bridge.tex:161-166）之间只差一次 $\lVert dP_G\rVert$ 界的代入（bridge.tex:127-137），我第一次读把 $d=xa_0e_\ell$ 的 $e_\ell$ 丢了，重读才看清角标是从 $b_1,b_m$ 的起止位置继承的（bridge.tex:143-146），这个 $e_\ell$ 恰是幕五转移恒等式能落地的铆钉：没有它，$P_n^{\ell(b)}$ 与字的乘法就没有公共代数环境。第二件，全篇真正的新想法我数下来就两个半：把"未来态"翻译成"过去可数片段的唯一扩张"（§8 到 §9 的交接）算一个；把"合并一对状态"的局部数据做成对全体旧态受控的桥（§7 全部）算一个；"重排伴随扩张"那半个，因为它技术上依托 na:moment-norm 与 na:trace-expectation 两件现成家具，创意在于意识到需要搬家具。第三件，留给后续工作的检查清单：终代数密度（introduction.tex:59-61 的留白）、迹空间几何可否在 ZFC 版复刻 Vaccaro 的单纯形自由度的问题、以及表示论表述与环同构表述之间那座 tex 里没有出现的桥。这三条都不该由这篇论文负责，但每一个都站在这篇论文的部件上才变得可提问。台账 35 行即是上述所有"站得住"的最小清单：每一行的"若改动断在哪一步"我都回头核对过被引文件行的原文，没有一行凭记忆填写。本笔记至此收工，落盘复核见交付报告。

### 附记：本稿与论文的结构映射及两处说明

结构映射：论文 introduction 对应本稿 §1、§2 与 §10；论文 states 对应 §5 并部分进入 §4；论文 hnn 对应 §6；论文 bridge 对应 §7 与二轮笔记 A；论文 iteration 对应 §8 与二轮笔记 B；论文 construction 对应 §9 与二轮笔记 C 的问题清点。两处说明：其一，文件中部保留的"落盘探针D208-P1"一行是落盘协议的产物，规格禁止删除或移动任何已落盘内容，故它停在 §1 与 §2 之间的原位，后续追加一律锚在当时文件末段向后生长；其二，本稿所有 [推测] 均只在论文文本沉默处生长，凡标记者在被标处都写明了沉默的证据（七个 .tex 全文无该主题字样），与凭空的杜撰区分开。这份映射也是自查：论文六节无一遗漏，本稿十二节无一无源。另记一句收笔心情：全文读到最后我记住的其实只有一句话，好的 ZFC 化从来不靠更强的公理，靠把"谁在未来"改写成"谁已被过去唯一决定"；§9 的日程表与 §8 的捕获定理就是这句话的两半，一个管排队，一个管点名。

## §12 台账

本会话真实 Read 过的文件里，被下游论证消费的关键符号、数值与估计，逐行登记如下。位置栏的 build/sections/... 路径均以本会话的 Read 输出为准；被消费栏指回论文文本内的使用点；改动栏给出若该符号或估计变动，论证最先断裂的一步。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\kappa=\mathfrak c^{+}$ | 递归长度 | build/sections/construction.tex:23 | 日程表与阶段单子 | construction.tex:24 的 $\lvert\beta\rvert\le\mathfrak c$ 基数比较失效 |
| $\mathfrak c=2^{\aleph_0}$ | 连续统基数 | build/sections/iteration.tex:322 | na:state-count 的纯态数上限 | iteration.tex:329 的 $\mathfrak c^{\aleph_0}=\mathfrak c$ 无从落地 |
| $\sigma(\beta,\eta)\ge\beta$ | 日程表滞后约束 | build/sections/construction.tex:33 | 阶段 $j$ 取到 $\beta$ 的单子 | construction.tex:57-58 的先列后步次序被打乱 |
| $h\sim k$ | GNS 酉等价关系 | build/sections/states.tex:15 | bridge 的合并目标与迭代不变量 | bridge.tex:30-34 的等价判据无法书写 |
| (U) | 纯态唯一扩张性质 | build/sections/states.tex:28 | 链引理、单性引理、closed-extension | states.tex:296 的 na:simple-extension 失去前提 |
| $A_0=\bigotimes_{m=1}^{\infty}M_2$ | 起始 CAR 代数 | build/sections/iteration.tex:70 | 整条递归的起点 | iteration.tex:76 的 na:base-peak 无从谈起 |
| $p_n=e_{11}^{\otimes n}\otimes 1$ | 原型 peaking 序列 | build/sections/iteration.tex:71 | $f_0$ 态与 KOS 搬运模板 | construction.tex:53 的 $(p_n)$-峰态不存在 |
| $\tau(p_n)=2^{-n}$ | 基准 peaking 迹值 | build/sections/iteration.tex:79 | 桥的迹匹配局部检查 | construction.tex:83 的 $\tau(q_n^{j})=2^{-n}$ 验证失败 |
| $1=t_0>t_1>\cdots>0$，$t_n\to 0$ | 公共迹值严格递减到零 | build/sections/bridge.tex:19 | na:bridge 定理前提 | states.tex:286-289 的 $\infty$ 点零质量论证塌掉 |
| $x_s=1-(1+s)^{-1}$ | 截断元网 | build/sections/states.tex:129 | na:excision 的网构造 | states.tex:131-132 的 $e_s$ 单调性（inversion 算子单调）失源 |
| $\lVert(1-e_s)b\rVert^{2}\le 1/(4m)$ | 逼近单位元量化强度 | build/sections/states.tex:137 | na:excision 的聚点论证 | states.tex:150-153 的聚点湮灭 $N$ 不再成立 |
| $\lVert x_\lambda(a-h(a)1)x_\lambda\rVert\to 0$ | excision 估计 | build/sections/states.tex:98 | cross-excision 与 bridge 端点 | states.tex:204-210 的第二项吃不掉 |
| $\lVert x_\lambda ay_\nu\rVert\to 0$ | 不等价态的交叉 excision | build/sections/states.tex:192 | bridge 的禁并未央合并 | bridge.tex:320-323 的矩阵系数矛盾失效 |
| $\tau(r_h)=0$ | 纯态支撑投影迹归零 | build/sections/states.tex:219 | 有限原子处端点衰减 | bridge.tex:181-186 的分子归零论证断链 |
| $D\cong C(\mathbb N_0\cup\{\infty\})$ | peaking 序列生成代数 | build/sections/states.tex:257 | bridge 的 $D_i$ 与 $\theta$ | bridge.tex:43-46 的匹配定义 $\theta$ 不成立 |
| $E(a)(\infty)=h(a)$ | 期望在 $\infty$ 点的取值 | build/sections/states.tex:263 | peaking-expectation 保迹性 | states.tex:274-276 的连续性估计失去落点 |
| $a_0v^{\epsilon_1}a_1\cdots v^{\epsilon_m}a_m$ | HNN 字一般形状 | build/sections/hnn.tex:25 | 约化字体系 | hnn.tex:48-50 的迹零声明无法表述 |
| $E_1(a_t)=0$（$(+1,-1)$ 转折） | 约化条件 | build/sections/hnn.tex:32 | hnn.tex:215-221 的展开表 | 约化字与自由积居中不再对得上 |
| $K=D\oplus\bigoplus L_{i_1}^{\circ}\otimes_D\cdots$ | Fock 交替模 | build/sections/hnn.tex:108 | na:free-product 构造 | hnn.tex:127-132 的真空稠密论证没有载体 |
| $H(A)=e_1Ze_1$，$v=e_{12}^{F}s$ | Ueda 角与稳定单位元 | build/sections/hnn.tex:196 | na:bridge 全部输入 | hnn.tex:200-201 的关系 $vdv^{*}=\theta(d)$ 落空 |
| $\lVert x\rVert=\lim_r t((x^{*}x)^{r})^{1/(2r)}$ | 忠实迹的矩到范数 | build/sections/hnn.tex:236 | HNN 唯一性与重排同构 | hnn.tex:241-243 的等矩等范数中断 |
| $H_k(H_j(O))\cong H_j(H_k(O))$ | 两伴随交换 | build/sections/hnn.tex:293 | na:closed-extension 第二子命题 | iteration.tex:227-232 的归纳推进卡死 |
| $\lVert dP_G\rVert\le\lVert E_D^{F}(d^{*}d)\rVert^{1/2}$ | 模表示角范数界 | build/sections/bridge.tex:128 | 约化字两端估计 | bridge.tex:154-158 的 eq:bridge-two-ends 拼不出 |
| $\lVert E_D^{F}(e_\ell a_0^{*}x^{2}a_0e_\ell)\rVert\to 0$ | 端点衰减判据 | build/sections/bridge.tex:163 | 字衰减的充分条件 | bridge.tex:159-161 的推出关系断 |
| $P_n^{\ell(b)}b=bP_n^{r(b)}$ | 峰转移恒等式 | build/sections/bridge.tex:224 | 匹配端点标量项处理 | bridge.tex:231-240 的转移全部失去依据 |
| $q=\min(n,t)$ | $m=2$ 双端嵌套指标 | build/sections/bridge.tex:285 | 转移后 $\phi_j$ 收尾情形 | bridge.tex:287-288 的范数比较作废 |
| $\widetilde f_1=\widetilde f_2\circ\Ad v$ | 指定合并的实现 | build/sections/bridge.tex:352 | na:bridge 结论后半 | iteration.tex:206-207 的"只并指定对"没有来源 |
| $O_\beta=A[j\cup(S\cap\beta)]$ | 省略步后置的重排基 | build/sections/iteration.tex:183 | 两子命题的传递归纳 | iteration.tex:184-185 的 $R_\beta$ 递推脱节 |
| $j\in T\Rightarrow I_j\subset T$ | dependency-closed 条件 | build/sections/iteration.tex:126 | na:inherited 与可数决定 | iteration.tex:140-145 的继承桥无法执行 |
| $\lVert x_{a,m}(a-h(a)1)x_{a,m}\rVert<1/m$ | 可数决定的见证元 | build/sections/iteration.tex:301 | $S_n$ 塔构造 | iteration.tex:312-316 的 $h_i=h$ 推不出 |
| $\mathfrak c^{\aleph_0}=\mathfrak c$ | 可数子集数量上界 | build/sections/iteration.tex:329 | na:state-count | construction.tex:46-51 的单子存在性失败 |
| $\lambda=\kappa^{\aleph_0}$ | 码集基数 | build/sections/construction.tex:97 | ZFC 内选择的集合化 | construction.tex:98-103 的良序选择失去载体 |
| $S\subset\kappa$ 可数故有界于某 $\beta$ | $\mathfrak c^{+}$ 的正则性 | build/sections/construction.tex:110-111 | 终态捕获 | construction.tex:112-114 的 $h$ 在 $X_\beta$ 上纯性无保 |
| $h\circ\gamma=k$ | KOS 齐次性自同构 | build/sections/construction.tex:13 | $(q_n^{j})=\gamma(p_n)$ 的产生器 | construction.tex:66-71 的 peaking 搬运停在原地 |
| $\pi(1)$ 值域为非零闭不变子空间 | 单位代数既约表示自动单位 | build/sections/construction.tex:123-124 | 既约表示与纯态的互换 | introduction.tex:63-66 的两套语言无法互译 |
