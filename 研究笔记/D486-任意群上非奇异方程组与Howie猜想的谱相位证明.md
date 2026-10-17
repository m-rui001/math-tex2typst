# D486 研究笔记：任意群上的非奇异方程组与 Howie 猜想的谱相位证明

## §0 登记与本笔记的取材范围

本单编号 D486。素材是一篇题为 Nonsingular systems of equations over arbitrary groups 的预印本，中译《任意群上的非奇异方程组》，落款日期 2026 年 10 月 5 日，正文由 46 行的主文件与六个分片构成，build 目录下 tex 合计 59,403 字节。上一单同题任务在服务中断时没有留下任何磁盘残留（量具读数为 NOFILE，本会话开工前复测仍是 No such file or directory），所以这篇笔记从零起笔，没有旧稿可以承接，也没有旧稿需要勘误。登记信息以下面两行逐字单行为准：

preprints/Nonsingular-systems-of-equations-over-arbitrary-groups-October-5-2026
其他队列第 309 行号

正文素材只允许取自八个文件：`main.tex` 1,603 字节（含摘要）、`sections/introduction.tex` 5,389、`sections/history.tex` 4,940、`sections/fixed-space.tex` 13,526、`sections/phase.tex` 8,214、`sections/planar.tex` 13,666、`sections/kernel.tex` 8,218、`references.tex` 3,847。文中所有"文件名:行号"都指向本会话真实读到的位置。素材没有交代写作过程与失败史，下文对错误路线的还原属于按证明接缝做的反推，一律标 [推测]；素材薄处宁可标 [源未载] 也不硬编。加密的 PDF 与 typst 排版分片全程未读。论文的结构骨架很简短：主定理一条（introduction.tex:27 至 introduction.tex:37），同时定空定理一条（fixed-space.tex:11 至 fixed-space.tex:37），引理两条（phase.tex:83 与 phase.tex:167），平面边界障碍命题一条（planar.tex:46 至 planar.tex:54），附注一条（kernel.tex:154 至 kernel.tex:162）。

## §1 初始动机：问题的原始形态与我最开始的猜想

先把对象摆正。设 $G$ 是任意群，$F_n=F(x_1,\ldots,x_n)$ 是 $n$ 元自由群。$G$ 上的方程组就是 $m$ 个字 $w_1,\ldots,w_m\in G*F_n$，每个 $w_i=1$ 算一条方程；系数允许取自 $G$，未知数允许在更大的群里实现，唯一硬性要求是扩群 $H\supseteq G$ 时 $G$ 的同构像不被黏合，也就是系数彼此不许被识别成同一个元素。把 $G*F_n$ 到 $\mathbb{Z}^n$ 的同态定义为 $G\mapsto 0$、$x_j\mapsto e_j$，第 $i$ 个字的像记成行向量 $(a_{i1},\ldots,a_{in})$，得到 $m\times n$ 整数矩阵 $A=(a_{ij})$，即指数和矩阵（introduction.tex:16 至 introduction.tex:22）。所谓非奇异，就是 $\operatorname{rank}_{\mathbb{Q}}A=m$。摘要只有一句话：任意群上每个有限非奇异方程组都在某个扩群里同时可解，这就证明了通常称作 Howie 猜想的命题（main.tex:35 至 main.tex:39）。

定理的正式说法（introduction.tex:27 至 introduction.tex:37）：设 $1\le m\le n$，若 $w_1,\ldots,w_m$ 的指数和矩阵在 $\mathbb{Q}$ 上行秩为 $m$，则典范同态
$$G\longrightarrow (G*F_n)/\langle\!\langle w_1,\ldots,w_m\rangle\!\rangle$$
是单射。这里 $\langle\!\langle\cdot\rangle\!\rangle$ 指 $G*F_n$ 中的正规闭包。单射性与可解性的互推靠商群的泛性质：若单，商群本身就是扩群，自由生成元的像就是解；反之任意解诱使商群上有一个回到 $G$ 单射的同态。于是"解方程"被翻译成"关系的正规闭包在 $G$ 上不杀任何非单位元"。定理对 $G$ 没有可数性、有限性、挠条件；无穷多个方程与未知数的版本由 kernel.tex:154 至 kernel.tex:162 的有限关系论证导出，因为任何一个被杀的群元素的正规闭包表达式只牵涉有限多个关系与有限多个变量。

动笔前我最想弄清楚的一点：为什么恰恰是 $\mathbb{Q}$ 上的行秩，而 $\mathbb{Z}$ 上的初等因子没有任何要求？素材给出的答案藏在证明里（introduction.tex:64 至 introduction.tex:68）：非奇异性进入证明的唯一通道是 fixed-space.tex:45 至 fixed-space.tex:48 那串嵌套非零子式，子式在有理数域上非零就够用，行列式是否等于 $\pm 1$ 根本不被检查。也就是说整个定理对"幺模"没有任何留恋，这一点和我最初读 Gerstenhaber-Rothaus 定理时留下的直觉完全相反，那里行列式的绝对值控制覆盖度。

我最初的猜想版本（[推测]，素材未自述）：既然前一篇 Kervaire 定理的群版论文已经处理了"单条方程、指数和为 $\pm 1$"的情形，把 $m$ 条方程逐一迭代套用单方程定理，似乎两三步就该收敛到系统版本。这个猜想在第一天就破了，理由很朴素：第一条方程在扩群 $H_1$ 里解掉之后，第二条方程的系数已经不是原来的 $G$，是混进了 $H_1$ 的新系数，其中含有第一组未知数的像；对 $H_1$ 再解第二条时，$H_1$ 里被识别掉的元素可能恰好落在原始 $G$ 内，正规闭包的链条根本不受指数和矩阵控制。方程之间唯一的"不相干证据"是 $\mathbb{Q}$ 行无关，这种线性证据无法在逐次扩张的群里传递。

## §2 历史坐标：四条路线各自的抓手与天花板

history.tex 全节只有 79 行，但把可用的路线梳理得相当清楚，我把它当作路线图册来读。第一条：Gerstenhaber-Rothaus 1962（history.tex:13 至 history.tex:25）。对方程数与未知数数相等的方形组、系数群为紧连通李群 $K$ 的情形，他们计算词映射 $K^n\to K$ 的次数，次数恰是 $\det A$；次数非零逼迫词映射满射，解直接在 $K$ 里存在。他们的有限群定理还会给出有限扩群解，手法是算术特化与有限域上的归约。矩形组化为方形组：留一个非零极大子式的列，其余变量置成单位元。这条路线第一次示范了"紧李群、上同调、次数论"可以在一个纯群论命题里干活。第二条：相对展示拓扑。Howie 1981 证明有限独立方程组在局部可指示群上可解（history.tex:26 至 history.tex:30），局部可指示指每个非平凡有限生成子群都能映到 $\mathbb{Z}$ 上；Klyachko 1993 用球面映射的巧妙办法处理了挠自由群上单变量单方程、指数和为 $\pm 1$ 的情形（history.tex:31 至 history.tex:33）；Chen 2026 用 HNN 扩张里曲面复杂度的估计重新拿到了这个定理（history.tex:33 至 history.tex:35）。第三条：度量超积与逼近。紧酉方法可以搬运到超线性群（即孔斯可嵌入群，能嵌入酉群列按标准化 Hilbert-Schmidt 度量的度量超积的那种群），Pestov 注意到这一点，Nitsche-Thom 2022 明确写出了非奇异系统的版本（history.tex:39 至 history.tex:45）。他们更强的 Theorem 1.3 把非奇异性换成"删去系数后的展示复形某个覆盖的第二同调消没"，而对展示复形本身，第二同调消没恰好等价于指数行无关（history.tex:45 至 history.tex:51）。第四条：对解出的扩群加结构。Klyachko-Mikheenko-Roman'kov 2024 把解限制在带适当挠自由 Abel 因子的可解群类里（history.tex:53 至 history.tex:56）；Ramirez-Côté-Wise 2025 用 Magnus 型幂级数群里的 Banach 不动点定理，在非奇异情形于系数环里把行列式求逆（history.tex:56 至 history.tex:61）。

读这张图册时我给自己总结了一条判据（[推测]，由 history.tex:36 至 history.tex:37 的"两类控制源"提示提炼）：历史上每一条定理都靠两种杠杆之一，或者对系数群 $G$ 加代数条件（局部可指示、挠自由、超线性、可嵌入幂级数群），或者对关系字加拓扑条件（单方程、指数和 $\pm 1$、同调消没）。Howie 猜想要求两头的杠杆都不加：$G$ 完全任意，$m$ 个字除行无关外任意。想清楚这一点之后，抄任何一条现成路线都不可能是完整证明，必须找一个既不动 $G$ 也不动 $w_i$ 的新载体。

## §3 第一条错路：把次数论与逼近论推到极限 [推测]

素材没有失败史，这一节是我按证明里刻意回避的东西反推的，全部标 [推测]。第一条错路：直接搬 Gerstenhaber-Rothaus。次数论的前提是词映射定义在流形 $K^n$ 上，可以用同调作用在基本类上算度数；任意群 $G$ 没有连续的参数结构，$G^n$ 上连测度都没有，$\det A$ 无处显形。我猜自己会先尝试逼近补救：把 $G$ 塞进酉群列的度量超积，用 Nitsche-Thom 的定理一步取解。问题是超线性本身就是对 $G$ 的假设，history.tex:50 至 history.tex:51 明写他们的判据"保留了对系数群的假设"，而目标定理里 $G$ 是任意群，这条补救天生够不到。更麻烦的是：即便退一万步只处理超线性群，逼近给出的也是"近似解"在超积里的提升，跟"某个扩群里的精确解"隔着逻辑类型的鸿沟；我的最终论证里恰恰要用 $\tau$ 的忠实性从 $\tau(h(L(r^{-1})))=0$ 一步推出 $L(r_{z_0}^{-1})=I$（planar.tex:289 至 planar.tex:292），这种零迹逼迫算子归零的推理只能在不被商掉任何信息的忠实迹里做，标准化 Hilbert-Schmidt 迹的超积结构给不了这种"精确为零"的判定。第二条错路（同一节的后半，仍标 [推测]）：试图把矩形组像李群情形那样先化成方形组。取非零极大子式的列、把其余变量置为单位元，这在语义上没有毛病，但置元之后方程组在目标群里的可解性要靠词映射满射来保证，而任意群 $G$ 上的词映射既不必接近满射也不必有任何拓扑度，化简只是把困难从左移到右。这两条路走通的都是"特殊系数群"或"特殊字"，猜想的难点恰恰在两个"任意"同时在场。

## §4 第二条错路：纯拓扑围堵在任意系数群上失效 [推测]

第二条错路（[推测]）：走 Howie-Klyachko 的相对展示路线，假设存在 $g\in G$、$g\ne 1$ 却落在正规闭包 $\langle\!\langle w_1,\ldots,w_m\rangle\!\rangle$ 里，于是 $g$ 有形如
$$g=\prod_{\alpha=1}^{u} b_\alpha\, w_{i_\alpha}^{\epsilon_\alpha}\, b_\alpha^{-1},\qquad b_\alpha\in G*F_n,\qquad \epsilon_\alpha\in\{1,-1\}$$
的有限表达式（kernel.tex:16 至 kernel.tex:20），把表达式实现成带洞圆盘到展示空间 $Y'$ 的映射 $f:P\to Y'$，外边界读 $g$，每个洞读 $w_{i_\alpha}^{\epsilon_\alpha}$，然后对 $f$ 做极小复杂度假设、找曲率或面积上的矛盾。Klyachko 的球面技巧、Chen 的曲面复杂度估计都是这类打法在特殊假设下的成功样本。我猜想这条路的死点在于：洞的边界上读的是系数环路，$Y$ 可以是完全任意的带基点胞腔展示空间（kernel.tex:26 至 kernel.tex:32 明确说 $Y$ 不需要任何非可缩性或有限性），因而边界词在 $G$ 里是否消灭完全由 $v:P\to Y$ 的系数投影决定，纯组合极小性管不住它。想要传递的信息形如"一块连通平面曲面，除一条外所有边界词在 $G$ 中都是单位元，逼出最后一条也是单位元"，这在挠自由或局部可指示情形有同伦论理由，在任意 $G$ 上我找不到任何组合不变量能承担这个传递。也就是说（此句仅作本笔记行文连接，非素材语），纯拓扑围堵缺一个数值载体，它必须外接一个能把"边界词平凡"翻译成可相加、可比较、且对单位元忠实的实数的机制。这个缺口直接决定了后面两节：载体取自群冯诺依曼代数上的谱相位。

## §5 关键转折：酉拓扑只碰复制指标，系数全程留在算子里

转折点的识别有素材依据（introduction.tex:91 至 introduction.tex:99）：酉拓扑只用在"复制指标"这个有限维位置上，即作用在 $\mathrm U(k_i)$ 里的矩阵变量；群系数 $G$ 始终以左正则算子 $L(a)$ 的形式留在冯诺依曼代数 $\mathcal M=\{T\in\mathcal B(\ell^2(G)):TR_a=R_aT,\ \forall a\in G\}$ 里（phase.tex:18 至 phase.tex:22）。$L(a)$ 与右平移 $R_a$ 交换，$\mathcal M$ 包含所有 $L(a)$，其上取未标准化迹 $\tau_d(T)=\sum_{j=1}^d (T_{jj})_{1,1}$，满足 $\tau_d(I)=d$（phase.tex:25 至 phase.tex:27）。忠实性在 phase.tex:46 至 phase.tex:54 逐条验证，包含不可数群：若 $T\ge 0$ 且 $\tau_d(T)=0$，则 $T^{1/2}$ 抹掉所有 $e_j\otimes\delta_x$，因为平方根同样与一切右平移交换，故 $T=0$。这一步是整个证明的"终点发动机"：最后一切归结为 $\tau(h(\cdot))=0$ 逼出 $L(r^{-1})=I$ 再逼出 $r=1$。

在这个分工下，数值管线需要的全部材料是谱相位 $\ell$。取切割在 $1$ 处、右连续的相位函数 $h(e^{2\pi i t})=t-\lfloor t\rfloor$，令 $\ell(U)=\tau_d(h(U))$（phase.tex:68 至 phase.tex:71）。它满足三件硬性要求：非负且 $\ell(U)=0$ 当且仅当 $U=I$（phase.tex:74 至 phase.tex:76）；乘法次可加 $\ell(UV)\le\ell(U)+\ell(V)$（phase.tex:83 至 phase.tex:89）；对加权循环移位可精确计算（phase.tex:167 起）。第三条用途是：次可加性给出曲面算子的相位上界，精确公式给出下界，欧拉示性数让两侧常数恰好抵消，差值只剩可能不平凡的那条边界词的相位。这个"上下界夹逼后余量为零"的格局，我在 planar.tex:56 至 planar.tex:61 的开场白里找到了作者的自述：证明对同一个酉算子做两次估计，一次混合同型盘给上界，一次沿边界读给精确公式。

方法来源在 history.tex:63 至 history.tex:66 写得很坦白：谱相位加平面曲面的策略取自单关系幺模定理那篇前作，本单的主扩展是 fixed-space.tex 的多块定空定理。前作的固定平面入射构造只处理一条幺模关系；多个关系型、带不同重数与符号的联立定空，需要酉群乘积上的有理交集类，这是全新的。[推测] 我认为这一步是作者思维链上最重的一次改道：原以为沿用前作引理就够，实际发现前作的入射构造在"同一种盘出现 $k_i$ 份"的复制结构里没有余地去调配每份矩阵变量，必须把单一酉矩阵的入射问题升级成矩阵组 $\prod_i \mathrm U(k_i)$ 上的乘积群上同调问题。

## §6 组合账本：盘、带、槽与正负盘数平衡

现在进入我自己复述得最慢的一段：平面曲面的账。先把字写成"字母槽"标准形（planar.tex:13 至 planar.tex:19）：循环共轭不改变正规闭包也不改变指数和，所以不妨设
$$w_i=x_{\nu_{i,1}}^{s_{i,1}}g_{i,1}\cdots x_{\nu_{i,N_i}}^{s_{i,N_i}}g_{i,N_i},\qquad g_{i,t}\in G,\quad s_{i,t}\in\{1,-1\},$$
每个变量字母占一段闭区间叫槽，槽之间是非空的角弧，角弧携带系数 $g_{i,t}$；$N_i\ge 1$ 因为 $A$ 的第 $i$ 行非零（planar.tex:21 至 planar.tex:22）。字盘分正负：正盘边界读 $w_i$，负盘边界读 $w_i^{-1}$；两种盘上槽都按 $t$ 编号、下标模 $N_i$ 循环，约定表见 planar.tex:29 至 planar.tex:35：正盘上 $t$ 的后继是 $t+1$、槽变量是 $x_{\nu_{i,t}}^{s_{i,t}}$、$t$ 之后的角弧带 $g_{i,t}$；负盘上后继是 $t-1$、槽变量是 $x_{\nu_{i,t}}^{-s_{i,t}}$、角弧带 $g_{i,t-1}^{-1}$。这里的 $s_{i,t}$ 或 $-s_{i,t}$ 称为槽的穿行符号。矩形带把两两槽配完，配对要求同一变量指标且穿行符号相反，带侧不贡献系数词。剩下的边界由角弧与带侧组成，读出的 $G$ 中词只由角弧标注拼接；换起点等于共轭，所以"边界词是否平凡"良定义（planar.tex:38 至 planar.tex:44）。

组合骨架用两个置换写尽（planar.tex:78 至 planar.tex:86）：槽集合 $\mathcal D$ 上，$\sigma$ 沿每块盘的定向边界走到下一槽，$\theta$ 是配对带两端的无不动点对合。从槽 $d$ 的起点出发，跨过带侧到达 $\theta d$ 的终点，再沿角弧 $c_{\theta d}$ 走到 $\sigma\theta d$ 的起点，于是 $\sigma\theta$ 的圈恰是边界分支。圈 $z=(d_1,\ldots,d_a)$ 的长度与边界词记作 $a(z)=a$、$r_z=c_{\theta d_1}\cdots c_{\theta d_a}$（planar.tex:88 至 planar.tex:90）。计数（planar.tex:73 至 planar.tex:75）：$K=\sum_{i\in I}k_i$、$b=\sum_{i\in I}N_ik_i$，曲面有 $2K$ 块盘、$2b$ 个槽、$b$ 条带；设边界分支数为 $q$，亏格零给出
$$2-q=\chi(\Sigma)=2K-b,\qquad \sum_z a(z)=2b$$
（planar.tex:93 至 planar.tex:94）。我核对这笔欧拉账的方式：每块盘 $\chi=1$，每条带作为矩形 $\chi=1$，与两条槽区间（各 $\chi=1$）重合粘贴，总 $\chi=2K\cdot 1+b\cdot 1-2b\cdot 1=2K-b$，与圆盘数减带数的直觉一致。

最重要的一行账是盘数平衡（planar.tex:65 至 planar.tex:71）：设 $p_i$、$m_i$ 是型 $i$ 的正负盘数，每条带配对同一变量的正负两次出现，故对每个 $j$ 有 $\sum_i (p_i-m_i)a_{ij}=0$；$A$ 的行在 $\mathbb{Q}$ 上无关立刻给出 $p_i=m_i$，记公共值 $k_i\ge 1$，出现过的型集合记 $I$。这是全证明里非奇异性第一次、也是唯一一次被兑换成拓扑语言：它保证每种关系字正反盘数相等，从而后面喂给定空定理的带符号块重数矩阵正是 $-A$ 限制在 $I$ 行上的矩阵，行满秩自动成立（planar.tex:219 至 planar.tex:222）。[推测] 若 $A$ 行相关，我可以造出盘数不平衡的曲面，而 $\ell$ 的上下界夹逼里两侧常数差将多出 $\sum_i (p_i-m_i)^2$ 量级的亏空，证明必然在某处断开；素材没有讨论反例，所以这句只作我的私下演算记录。这笔账在素材里只占十一行（planar.tex:65 至 planar.tex:75），我却花了最久才相信它能承担全局：全部代数假设在这一处兑换成盘数平衡，之后的一切相位预算不过是在为这笔平衡付利息。

## §7 定空定理：秩假设的多块升级

秩假设进入拓扑论证的唯一通道，是 fixed-space.tex:11 至 fixed-space.tex:37 的定理。设定：$r\ge 0$，$n\ge 1$，$k_1,\ldots,k_r$ 为正整数；每个 $j\in\{1,\ldots,n\}$ 挂一个由对子 $(i,s)$ 组成的有限有序表 $\mathcal B_j$，其中 $1\le i\le r$、$s\in\{1,-1\}$，允许重复（fixed-space.tex:13 至 fixed-space.tex:15）。定义
$$d_j=\sum_{(i,s)\in\mathcal B_j}k_i,\qquad b_{ij}=\sum_{\substack{(i',s)\in\mathcal B_j\\ i'=i}}s,$$
即 $d_j$ 是列 $j$ 的总块维数，$B=(b_{ij})$ 是带符号块重数矩阵（fixed-space.tex:16 至 fixed-space.tex:21）。假设 $B$ 在 $\mathbb{Q}$ 上行秩 $r$。令 $D=\prod_{i=1}^r\mathrm U(k_i)$，对每个 $j$ 取任意 $P_j\in\mathrm U(d_j)$，把混合了块变量的映射写成
$$F_j(X)=\operatorname{diag}_{(i,s)\in\mathcal B_j}(X_i^s)\,P_j,\qquad X\in D$$
（fixed-space.tex:24 至 fixed-space.tex:28）。结论：存在 $X\in D$ 使
$$\sum_{j=1}^n\dim_{\mathbb C}\ker\bigl(F_j(X)-I_{d_j}\bigr)\ \ge\ \sum_{i=1}^r k_i$$
（fixed-space.tex:31 至 fixed-space.tex:34）。约定 $\mathrm U(0)$ 与空乘积都是单点，零维空间的定空维数记 $0$（fixed-space.tex:36）。

前作只处理单个矩阵变量的入射构造（fixed-space.tex:7 至 fixed-space.tex:9 明说本定理是把前作单矩阵论证用有理上同调与嵌套非零子式推广到多个酉矩阵变量）。为什么方程问题恰好需要多块版本？落点在 planar.tex:214 至 planar.tex:222：把坐标按变量指标 $j$ 与穿行符号重排成空间 $V_{j,+}$ 与 $V_{j,-}$，回归映射 $J\Theta$ 限制在 $V_{j,+}$ 上形如 $\operatorname{diag}_{(i,t):\,\nu_{i,t}=j}(X_i^{-s_{i,t}})P_j$，其带符号块计数正是 $\sum_{t:\,\nu_{i,t}=j}(-s_{i,t})=-a_{ij}$；于是这里的 $B$ 就是 $-A$ 限制在出现型集合 $I$ 的行上的矩阵，行满秩是 §6 盘数平衡之后非奇异性剩下的全部残值。定理输出 $\sum_j\dim\ker\ge\sum_{i\in I}k_i=K$（planar.tex:223 至 planar.tex:226），另一半方向由共轭对称免费附赠（planar.tex:227 至 planar.tex:230），这就给相位夹逼提供了 $2K$ 条固定方向。

证明四步，本笔记逐步拆解。第一步：分配目标维数（fixed-space.tex:40 至 fixed-space.tex:68）。重排使 $k_1\ge\cdots\ge k_r$；归纳选取互异列 $j_1,\ldots,j_r$ 使嵌套子式全部非零：
$$\det B[1,\ldots,t\mid j_1,\ldots,j_t]\ne 0,\qquad 1\le t\le r$$
（fixed-space.tex:45 至 fixed-space.tex:48）。选列合法性：前 $t$ 行秩为 $t$，已选 $t-1$ 列在前 $t-1$ 行上仍无关，故能在前 $t$ 行上扩出一列使子式非零（fixed-space.tex:49 至 fixed-space.tex:51）。随后定 $l_{j_t}=k_t$（$1\le t\le r$），未选中列 $l_j=0$（fixed-space.tex:53 至 fixed-space.tex:56）。两本账在此对齐（fixed-space.tex:61 至 fixed-space.tex:64）：
$$\sum_j l_j=\sum_i k_i,\qquad \sum_j l_j^2=\sum_i k_i^2=\dim_{\mathbb R}D.$$
第二式说明"让每个 $F_j$ 同时有 $l_j$ 维定空"恰是一个余维互补的交问题。校核 $l_j\le d_j$：第 $t$ 步子式非零意味着某个 $b_{i,j_t}\ne 0$（$i\le t$），于是表 $\mathcal B_{j_t}$ 含一个尺寸 $k_i\ge k_t$ 的块（fixed-space.tex:57 至 fixed-space.tex:60）。[推测] 在我看来这一步是全证明最隐秘的机关：秩假设到选列就结束了，后面的存在性论证是纯上同调的，$B$ 的其余条目再未被看过。

## §8 上同调引擎：本原生成元、入射类与顶系数

第二步：备料，酉群上同调的三件性质（fixed-space.tex:70 至 fixed-space.tex:143）。经典计算给出
$$H^*(\mathrm U(d);\mathbb Q)=\Lambda(e_{1,d},\ldots,e_{d,d}),\qquad \lvert e_{a,d}\rvert=2a-1$$
（fixed-space.tex:75 至 fixed-space.tex:79，引用 Borel 1953）。三件性质：块限制相容，作为坐标块 inclusion 带恒等补块时 $\iota_{k,d}^*e_{a,d}=e_{a,k}$（$a\le k$）或 $0$（$a>k$）（fixed-space.tex:83 至 fixed-space.tex:89）；本原性，对乘法映射 $\mu$ 有 $\mu^*e_{a,d}=e_{a,d}\otimes 1+1\otimes e_{a,d}$（fixed-space.tex:90 至 fixed-space.tex:94），素材的比喻是"它们在乘法下相加，正如环面上一次类"（fixed-space.tex:95 至 fixed-space.tex:96）；求逆把 $e_{a,d}$ 送到 $-e_{a,d}$（fixed-space.tex:139 至 fixed-space.tex:142）。三件事由最后一列纤维丛 $\mathrm U(d-1)\to\mathrm U(d)\to S^{2d-1}$ 一趟打包（fixed-space.tex:98 至 fixed-space.tex:102）：底单纯连通，乘法塞尔谱序列系数系统平坦（fixed-space.tex:104 至 fixed-space.tex:107），$E_2^{p,q}=H^p(S^{2d-1};\mathbb Q)\otimes H^q(\mathrm U(d-1);\mathbb Q)$ 只在 $p=0$ 与 $p=2d-1$ 两列非零（fixed-space.tex:108 至 fixed-space.tex:111），唯一可能微分 $d_{2d-1}$ 把纤维次数 $q$ 送到 $q-2d+2$，而纤维生成元次数至多 $2d-3$，目标次数为负被迫为零，乘积由微分的莱布尼茨规则一并豁免，谱序列塌缩（fixed-space.tex:112 至 fixed-space.tex:117）；边缘映射给出对 $\mathrm U(d-1)$ 的限制在次数 $<2d-1$ 上是同构、球面基本类的拉回非零，逐次提升旧生成元并以球面基本类拉回充当 $e_{d,d}$，奇次数加有理系数使平方消零，外积构成基，相容性顺带证毕（fixed-space.tex:118 至 fixed-space.tex:126）。本原性的核验（fixed-space.tex:127 至 fixed-space.tex:138）：把 $\mu^*e$ 与两和之差限制在每个因子的单位元处都消零，故其 Künneth 分解各项在双次数上两侧皆正、各不超过 $2d-2$；对 $\mathrm U(d-1)\times\mathrm U(d-1)$ 的限制在这些双次数上单射，而差在该子代数上已为零（$a<d$ 用归纳假设，$a=d$ 用 $e_{d,d}$ 经最后一列投影拉回、沿纤维为常数）；任意位置的坐标块 inclusion 与标准位置只差共轭，$\mathrm U(d)$ 连通使共轭与恒等同伦（fixed-space.tex:138 至 fixed-space.tex:139）。

第三步：入射类与其领头系数（fixed-space.tex:144 至 fixed-space.tex:233）。定义
$$R(d,l)=\{(W,E):W\in\mathrm U(d),\ E\in\operatorname{Gr}_l(\mathbb C^d),\ W|_E=I_E\},\qquad p(W,E)=W$$
（fixed-space.tex:148 至 fixed-space.tex:152）。在给定 $E$ 上可行的 $W$ 恰为 $E^\perp$ 上的酉变换在 $E$ 上延恒等，正交标架卡使 $R(d,l)$ 成为以 $\mathrm U(d-l)$ 为纤维、底为复格拉斯曼流形的光滑丛，紧而无边，实维数 $2l(d-l)+(d-l)^2=d^2-l^2$（fixed-space.tex:153 至 fixed-space.tex:162）；格拉斯曼流形的复定向加上 $\mathrm U(d-l)$ 的定向给出丛的定向，换标架以共轭作用在纤维上、保向（fixed-space.tex:163 至 fixed-space.tex:165）。令
$$\alpha(d,l)=\operatorname{PD}\bigl(p_*[R(d,l)]\bigr)\in H^{l^2}(\mathrm U(d);\mathbb Q)$$
（fixed-space.tex:166 至 fixed-space.tex:169）。庞加莱对偶作用在推进的同类上，$p$ 的像本身可以不是子流形（fixed-space.tex:170 至 fixed-space.tex:172），而像集恰是 $\{W:\dim\ker(W-I_d)\ge l\}$（fixed-space.tex:172 至 fixed-space.tex:174）。几何解读：$\dim M=l^2$ 的封闭定向流形 $f:M\to\mathrm U(d)$ 对 $\alpha(d,l)$ 的配对值就是 $f$ 与 $p$ 的交点数，横截时是满足 $f(x)=p(W,E)$ 的配对符号计数，由 $f\times p$ 与对角线的交算出；紧流形上映像不相交的映射足够小的横截摄动仍不相交，故交数为零（fixed-space.tex:175 至 fixed-space.tex:187）。展开式
$$\alpha(d,l)=c_{d,l}\,e_{1,d}\cdots e_{l,d}+\text{长度少于 }l\text{ 的项},\qquad c_{d,l}\ne 0$$
（fixed-space.tex:189 至 fixed-space.tex:193），$l=0$ 时 $\alpha(d,0)=1$、$c_{d,0}=1$（fixed-space.tex:194 至 fixed-space.tex:195）。长度的账：$u$ 个不同生成元的乘积次数至少 $1+3+\cdots+(2u-1)=u^2$，$\alpha(d,l)$ 齐次数 $l^2$，故每项长度 $\le l$，长度恰 $l$ 的候选只剩显示那一项（fixed-space.tex:196 至 fixed-space.tex:200）。证 $c_{d,l}\ne 0$ 用试验映射 $f:\mathrm U(l)\to\mathrm U(d)$，$f(X)=X\oplus(-I_{d-l})$（fixed-space.tex:203 至 fixed-space.tex:206）：第二直和分量无固定向量、第一分量的 $l$ 维定空逼迫 $X=I_l$，所以交配对唯一，为 $X=I_l$、$W_0=I_l\oplus(-I_{d-l})$、$E_0=\mathbb C^l\oplus 0$（fixed-space.tex:207 至 fixed-space.tex:211）。横截性用切空间验：以 $W_0$ 右乘归一化把切空间认作斜埃尔米特矩阵，$f$ 的变化填满左上块，$p$ 在 $E_0$ 上方的纤维方向填满右下块；对线性映射 $Z:E_0\to E_0^\perp$ 取 $T=\begin{pmatrix}0&-Z^*\\ Z&0\end{pmatrix}$，道路 $\bigl(e^{tT}W_0e^{-tT},\,e^{tT}E_0\bigr)$ 留在 $R(d,l)$ 内，其 $p$ 像切向量为 $[T,W_0]W_0^{-1}=2T$，非对角方向全部覆盖（fixed-space.tex:212 至 fixed-space.tex:223）。唯一交点重数为 $\pm 1$（fixed-space.tex:224）；$f$ 同伦于坐标包含，拉回由块限制公式算，指标超过 $l$ 的项消掉、长度不足项的次数低于 $\dim\mathrm U(l)=l^2$ 无法贡献配对，只有领头项能解释非零交数，故 $c_{d,l}\ne 0$（fixed-space.tex:225 至 fixed-space.tex:230）；$l=d$ 时补块缺席，论证原样适用（fixed-space.tex:231 至 fixed-space.tex:232）。

第四步：算顶交数（fixed-space.tex:234 至 fixed-space.tex:297）。记 $e^{(i)}_{a,k_i}$ 为从 $D$ 的第 $i$ 个因子拉回的生成元。块对角映射拆成"只动一个块、其余块恒等"的映射之乘积，正出现贡献一份生成元、负出现贡献其负，右乘 $P_j$ 同伦于恒等、上同调看不见，三件性质联立给出
$$F_j^*e_{a,d_j}=\sum_{i:\,k_i\ge a}b_{ij}\,e^{(i)}_{a,k_i},\qquad 1\le a\le d_j$$
（fixed-space.tex:239 至 fixed-space.tex:250）。取顶类
$$\Omega=\prod_{j=1}^n F_j^*\alpha(d_j,l_j)\in H^{\sum_i k_i^2}(D;\mathbb Q)$$
（fixed-space.tex:251 至 fixed-space.tex:255）。$H^*(D;\mathbb Q)$ 共有 $\sum_i k_i$ 个正次数生成元，非零顶次单项式必须包含每一个；拉回保持每项的生成元个数（否则该项为零），所以任何一个因子敢用短项、总长度就凑不满 $\sum_i k_i$，对 $\Omega$ 的贡献为零（fixed-space.tex:256 至 fixed-space.tex:263）。对每个 $a\in\{1,\ldots,k_1\}$ 置 $t_a=\lvert\{i:k_i\ge a\}\rvert$，则 $k_i\ge a$ 的行恰是前 $t_a$ 行、被选列中 $l_j\ge a$ 的恰是 $j_1,\ldots,j_{t_a}$；把次数 $2a-1$ 的外因子归并成一块：
$$\prod_{t=1}^{t_a}\Bigl(\sum_{i=1}^{t_a}b_{i,j_t}\,e^{(i)}_{a,k_i}\Bigr)=\det B[1,\ldots,t_a\mid j_1,\ldots,j_{t_a}]\prod_{i=1}^{t_a}e^{(i)}_{a,k_i}$$
（fixed-space.tex:265 至 fixed-space.tex:275）。顶单项的系数（差一个整体符号）是
$$\Bigl(\prod_{j=1}^n c_{d_j,l_j}\Bigr)\prod_{a=1}^{k_1}\det B[1,\ldots,t_a\mid j_1,\ldots,j_{t_a}]$$
（fixed-space.tex:278 至 fixed-space.tex:282），每个因子非零由嵌套非零子式与 $c\ne 0$ 两账合成，故 $\langle\Omega,[D]\rangle\ne 0$（fixed-space.tex:283 至 fixed-space.tex:286）。收束：令 $F=(F_1,\ldots,F_n)$，$p_{\mathrm{tot}}=\prod_j p$ 从 $\prod_j R(d_j,l_j)$ 到 $\prod_j\mathrm U(d_j)$，$\Omega$ 差无害定向号就是 $F$ 拉回 $p_{\mathrm{tot}}$ 所定义圈的庞加莱对偶；配对非零逼迫两映射像集相交，交点处每个 $F_j(X)$ 都固定一个 $l_j$ 平面，按 $\sum_j l_j=\sum_i k_i$ 得指定空界（fixed-space.tex:288 至 fixed-space.tex:297）。

[推测] 这一节我最想替自己留存的一句话是"两串子式"：选列用 $\det B[1..t\mid j_1..j_t]$ 沿行堆叠，顶系数用 $\det B[1..t_a\mid j_1..j_{t_a}]$ 沿次数扫过，两串在行满秩假设下各取所需。我猜想若只用单个非零的 $r$ 阶子式，低次数层的行块并无非退化保证，外积乘开的对角占位就落空。此推断素材未载，是我对照定理假设（只有行满秩）与证明里两次出现子式的位置做的重建。

## §9 谱相位：忠实迹的三件要求与加权圈公式

数值管线全部架在 $\mathcal M$ 上。取 $\ell^2(G)$ 的标准正交基 $\{\delta_x:x\in G\}$，左、右平移 $L(a)\delta_x=\delta_{ax}$、$R_a\delta_x=\delta_{xa^{-1}}$ 相互交换（phase.tex:12 至 phase.tex:17）；令 $\mathcal M=\{T\in\mathcal B(\ell^2(G)):TR_a=R_aT,\ \forall a\in G\}$，它包含每个 $L(a)$（phase.tex:18 至 phase.tex:22）。把 $M_d(\mathcal M)$ 视为 $\mathbb C^d\otimes\ell^2(G)$ 上的算子，定义未标准化迹
$$\tau_d(T)=\sum_{j=1}^d (T_{jj})_{1,1},\qquad \tau=\tau_1,\qquad \tau_d(I)=d$$
（phase.tex:24 至 phase.tex:29）。迹的直接计算：若 $T\delta_1=\sum_x t_x\delta_x$，与右平移交换给出矩阵元 $T_{x,y}=t_{xy^{-1}}$；于是 $\tau(AB)=\sum_x a_{x^{-1}}b_x=\tau(BA)$，柯西-施瓦茨逼绝对收敛、平方可和族只有可数支撑，不可数群也过关（phase.tex:33 至 phase.tex:45）；正性与正规性来自有限多个向量泛函之和；忠实性（phase.tex:46 至 phase.tex:54）：若 $T\ge 0$ 且 $\tau_d(T)=0$，则 $\sum_j\lVert T^{1/2}(e_j\otimes\delta_1)\rVert^2=0$，而 $T^{1/2}$ 同样与一切右平移交换，故抹掉全体 $e_j\otimes\delta_x$，$T=0$。[推测] 我把这段忠实性验算看作全文对"任意群"最本分的兑现：没有一步需要 $G$ 可被酉群逼近，只用到交换性与迹的循环性。

有界博雷尔函数演算在 $\mathcal M$ 内保持（phase.tex:56 至 phase.tex:58）；酉 $U$ 决定单位圆上有限测度 $\mu_U(E)=\tau_d(\mathbf 1_E(U))$，$\tau_d(f(U))=\int_{\mathbb T}f\,d\mu_U$，$\mu_U(\mathbb T)=d$（phase.tex:59 至 phase.tex:63）；一致有界的逐点收敛博雷尔函数给出配对值收敛（phase.tex:64 至 phase.tex:65）。相位取切割在 $1$、按角度右连续的那一支：
$$h(e^{2\pi i t})=t-\lfloor t\rfloor,\qquad \ell(U)=\tau_d(h(U))$$
（phase.tex:67 至 phase.tex:71）。$h(1)=0$；$h(U)\ge 0$ 且 $U=\exp(2\pi i\,h(U))$，忠实性逼出
$$\ell(U)\ge 0,\qquad \ell(U)=0\iff U=I$$
（phase.tex:72 至 phase.tex:76）；$\ell$ 在酉共轭下不变、直和可加，标量矩阵上就是各特征值相位按重数之和（phase.tex:77 至 phase.tex:79）。

次可加性（phase.tex:81 至 phase.tex:148）：对一切酉 $U,V\in M_d(\mathcal M)$ 有 $\ell(UV)\le\ell(U)+\ell(V)$。证明把 $U$ 与 $UV$ 用道路 $W_u=Ue^{2\pi i uD}$、$D=h(V)$ 连起来（phase.tex:91 至 phase.tex:96）。先给光滑 $f$ 证导数恒等式
$$\frac{d}{du}\tau_d(f(W_u))=\tau_d(f'(W_u)D)$$
（phase.tex:98 至 phase.tex:102）：劳朗单项用 $W_u'=2\pi i\,W_uD$ 与循环性得 $\frac{d}{du}\tau_d(W_u^k)=2\pi i k\,\tau_d(W_u^kD)$（phase.tex:103 至 phase.tex:107）；一般光滑 $f$ 靠傅里叶系数满足 $\sum_k(1+\lvert k\rvert)\lvert\widehat f(k)\rvert<\infty$ 且 $\lVert\frac{d}{du}W_u^k\rVert\le 2\pi\lvert k\rvert$，级数与导级数按算子范数一致收敛（phase.tex:108 至 phase.tex:113）。若 $f$ 实值且 $f'\le 1$，则 $I-f'(W_u)\ge 0$；$D$ 与 $W_u$ 不必交换，循环性仍把差写成三明治形
$$\tau_d(D)-\tau_d(f'(W_u)D)=\tau_d\bigl(D^{1/2}(I-f'(W_u))D^{1/2}\bigr)\ge 0$$
（phase.tex:115 至 phase.tex:121），对 $u$ 积分得
$$\tau_d(f(UV))-\tau_d(f(U))\le\tau_d(D)$$
（phase.tex:122 至 phase.tex:125）。再把 $h$ 磨光：取 $\rho_\varepsilon\ge 0$ 支在 $(0,\varepsilon)$、积分为 $1$，令 $f_\varepsilon(e^{2\pi i t})=\int_0^\varepsilon\rho_\varepsilon(s)\,h(e^{2\pi i(t+s)})\,ds$（phase.tex:126 至 phase.tex:133）；$0\le f_\varepsilon\le 1$；小数部分差不等式 $h(t+\delta)-h(t)\le\delta$ 平均后取差商给出 $f_\varepsilon'\le 1$（phase.tex:134 至 phase.tex:140）；右连续性给 $f_\varepsilon\to h$ 处处成立，切割点处靠 $0\le f_\varepsilon(1)\le\varepsilon$ 单独核账，素材特意警告对称磨光没有这个性质（phase.tex:141 至 phase.tex:144）。把光滑不等式用于 $f_\varepsilon$、依谱测度控制收敛取极限，$\tau_d(D)=\ell(V)$，次可加性得证（phase.tex:144 至 phase.tex:148）。

切割的不对称还有两条副产品（phase.tex:150 至 phase.tex:159）：固定 $c\ge 0$ 时 $\lim_{\varepsilon\downarrow 0}\ell(e^{2\pi i c\varepsilon}U)=\ell(U)$；反方向在单位元上有跳，$\ell(e^{-2\pi i\varepsilon}I_d)=d(1-\varepsilon)$（$0<\varepsilon<1$）。这两条将在 §10 里分工：平凡边界靠跳变端贡献常数 $1-\varepsilon$，被怀疑的边界靠右连续端贡献 $\tau(h(L(r^{-1})))$。

加权圈公式（phase.tex:161 至 phase.tex:201）：$T\in M_a(\mathcal M)$ 按 $T(e_t\otimes v)=e_{t+1}\otimes Q_tv$、$e_{a+1}=e_1$ 定义，酉 $Q_1,\ldots,Q_a\in\mathcal M$，绕圈积 $C=Q_aQ_{a-1}\cdots Q_1$ 自第一坐标起读，则
$$\ell(T)=\frac{a-1}{2}+\tau(h(C))$$
（phase.tex:167 至 phase.tex:179）。证明三笔：其一，$\zeta=e^{2\pi i/a}$，用标量对角阵 $\operatorname{diag}(1,\zeta,\ldots,\zeta^{a-1})$ 共轭 $T$ 得 $\zeta T$，故 $\ell(\zeta^jT)=\ell(T)$ 对一切整数 $j$ 成立（phase.tex:181 至 phase.tex:185）；其二，标量恒等式 $\sum_{j=0}^{a-1}h(\zeta^j\lambda)=\frac{a-1}{2}+h(\lambda^a)$，把 $a$ 个等分角的小数部分列出来即可，含零元也成立（phase.tex:186 至 phase.tex:189）；其三，有界博雷尔演算加未标准化迹得 $a\ell(T)=\frac{a(a-1)}{2}+\tau_a(h(T^a))$（phase.tex:190 至 phase.tex:193），而 $T^a$ 对角、首元是 $C$、其余元素是同一圈换起点的圈积、相邻两个被相应 $Q_t$ 共轭，相位迹全是 $\tau(h(C))$，故 $\tau_a(h(T^a))=a\,\tau(h(C))$（phase.tex:195 至 phase.tex:200）。[推测] 我愿把这个引理读成"指标定理的离散版"：右端 $\frac{a-1}{2}$ 是圈的真空能、只与长度有关，边界信息全部集中在 $\tau(h(C))$ 一项，这正是 §10 夹逼后只剩可疑边界词的机制。素材对这一读法没有表态，我只登记为个人理解。

## §10 边界障碍的夹逼：一台算子、两次估计、一个余量

命题（planar.tex:46 至 planar.tex:54）说：给定指数和矩阵行秩 $m$ 的 $w_1,\ldots,w_m$，$\Sigma$ 由非空有限多个带符号字盘加配对全部槽的带构成、连通、亏格零，若除至多一条外所有边界词在 $G$ 中平凡，则全部边界词平凡。证明对同一个酉算子做两次相位估计（planar.tex:56 至 planar.tex:61 的自述），我把四幕依次记下来。

第一幕：把纯量相位分发到各条边界（planar.tex:136 至 planar.tex:155）。对任意满足 $\sum_z\eta_z=0$ 的实数组 $(\eta_z)$，可以取实数 $(\gamma_d)_{d\in\mathcal D}$ 使
$$\gamma_{\theta d}=-\gamma_d,\qquad \sum_{d\in z}\gamma_d=\eta_z$$
（planar.tex:139 至 planar.tex:142）。做法是画图：顶点为边界圈，边为对子 $\{d,\theta d\}$，边端点挂在包含该槽的圈上，允许环与重边；$\Sigma$ 连通等价于 $\sigma$ 与 $\theta$ 在 $\mathcal D$ 上传递作用，而 $\sigma\theta$ 与 $\theta$ 生成同一个置换群，故图连通（planar.tex:143 至 planar.tex:148）。取生成树，其余边置零，从叶子向内逐点满足规定和、总为零保证最后一点收口（planar.tex:148 至 planar.tex:154）。随后在 $M_{2b}(\mathcal M)$ 里、于 $\mathbb C^{\mathcal D}\otimes\ell^2(G)$ 上定义
$$S(e_d\otimes v)=e_{\sigma d}\otimes L(c_d^{-1})v,\qquad \Theta(e_d\otimes v)=e^{2\pi i\gamma_d}e_{\theta d}\otimes v$$
（planar.tex:156 至 planar.tex:164）。两者酉，且分发条件恰保证 $\Theta^2=I$（planar.tex:165 至 planar.tex:166）。

第二幕：上界。给每个出现型 $i\in I$ 排好正负各 $k_i$ 块盘；在每个位置 $t$，它们的槽构成两块可各认同 $\mathbb C^{k_i}$ 的坐标阵。给定 $X_i\in\mathrm U(k_i)$，定义纯量酉对合 $J$：在型 $i$ 位置 $t$ 的阵坐标上，正阵到负阵作用 $X_i$、负阵回正阵作用 $X_i^{-1}$，同一个 $X_i$ 在该型所有位置复用（planar.tex:170 至 planar.tex:182）。角弧约定立刻给出对合关系
$$JSJ=S^{-1}$$
（planar.tex:183 至 fixed 关系式的正文在 planar.tex:186）：正阵上 $S$ 从 $t$ 到 $t+1$ 带系数 $L(g_{i,t}^{-1})$，负阵上从 $t$ 到 $t-1$ 带系数 $L(g_{i,t-1})$，$J$ 在两侧共轭正好互换规则，而 $X_i$ 与 $X_i^{-1}$ 相消，因系数在阵坐标上是常数、与纯量矩阵交换（planar.tex:187 至 planar.tex:192）。于是 $SJ$ 是酉对合，交换盘的两种符号，对角块全零、迹为零；其 $-1$ 谱投影 $(I-SJ)/2$ 的迹为 $b$，由标量情形特征值相位直接求和得
$$\ell(SJ)=\frac b2$$
（planar.tex:192 至 planar.tex:197）。把槽坐标按变量指标 $j$ 与穿行符号重新归群成 $V_{j,+}$ 与 $V_{j,-}$：每个出现 $(i,t)$（$\nu_{i,t}=j$）在两空间各贡献一块尺寸 $k_i$ 的阵，故 $\dim V_{j,\pm}=d_j=\sum_{(i,t):\,\nu_{i,t}=j}k_i$ 且 $\sum_j d_j=b$（planar.tex:199 至 planar.tex:208）。$J$ 与 $\Theta$ 都交换 $V_{j,+}$ 与 $V_{j,-}$；用阵坐标把 $\Theta:V_{j,+}\to V_{j,-}$ 表成 $P_j\in\mathrm U(d_j)$，回归 $J:V_{j,-}\to V_{j,+}$ 在 $(i,t)$ 块上是 $X_i^{-s_{i,t}}$，于是
$$(J\Theta)|_{V_{j,+}}=\operatorname{diag}_{(i,t):\,\nu_{i,t}=j}(X_i^{-s_{i,t}})\,P_j$$
（planar.tex:209 至 planar.tex:218）。带符号块计数 $\sum_{t:\,\nu_{i,t}=j}(-s_{i,t})=-a_{ij}$ 说明这批映射正落在 §7 的定理形制里，$B$ 即 $-A$ 限于 $I$ 行、行满秩，定理给出 $X_i$ 使 $\bigoplus_j V_{j,+}$ 上定空维数至少 $K$（planar.tex:219 至 planar.tex:226）；$J$ 交换两个直和且 $J(J\Theta)J=(J\Theta)^{-1}$，负侧同样多（planar.tex:227 至 planar.tex:229）。记 $J\Theta$ 的总定空维数 $f\ge 2K$；同一共轭使特征值多重集在 $\lambda\mapsto\lambda^{-1}$ 下不变，而 $h(\lambda)+h(\lambda^{-1})=1$（$\lambda\ne 1$）且在 $\lambda=1$ 为零，故
$$2\ell(J\Theta)=2b-f\le 2b-2K$$
（planar.tex:230 至 planar.tex:236）。因式分解 $S\Theta=(SJ)(J\Theta)$ 配次可加性（phase.tex:83 起的引理），得
$$\ell(S\Theta)\le\frac32 b-K$$
（planar.tex:237 至 planar.tex:241），对任何满足 $\sum_z\eta_z=0$ 的相位分发都成立，辅助的 $J$ 可以随分发而变（planar.tex:242 至 planar.tex:243）。

第三幕：下界从边界读回。在圈 $z=(d_1,\ldots,d_a)$ 的坐标上，$S\Theta$ 是加权循环移位 $T_z$，一步权重 $e^{2\pi i\gamma_{d_t}}L(c_{\theta d_t}^{-1})$，自 $d_1$ 绕圈的积为
$$e^{2\pi i\sum_{d\in z}\gamma_d}L(c_{\theta d_a}^{-1}\cdots c_{\theta d_1}^{-1})=e^{2\pi i\eta_z}L(r_z^{-1})$$
（planar.tex:246 至 planar.tex:257）。加权圈公式给出精确式
$$\ell(T_z)=\frac{a(z)-1}{2}+\tau\bigl(h(e^{2\pi i\eta_z}L(r_z^{-1}))\bigr)$$
（planar.tex:258 至 planar.tex:262）。第四幕：切割端的选法决定一切。取被怀疑的分支 $z_0$，对 $\epsilon>0$ 令
$$\eta_z=-\epsilon\ (z\ne z_0),\qquad \eta_{z_0}=(q-1)\epsilon$$
（planar.tex:264 至 planar.tex:269），总和为零、适用上界。平凡边界 $r_z=1$ 使末项在 $0<\epsilon<1$ 时恰等于 $1-\epsilon$（planar.tex:270 至 planar.tex:272），这是 $\ell(e^{-2\pi i\epsilon}I)$ 的跳变端；$z_0$ 的纯量相位从非负侧趋零，右连续端保证 $h(e^{2\pi i(q-1)\epsilon}\lambda)\to h(\lambda)$ 在整圆上逐点成立（含 $\lambda=1$），谱测度控制收敛把 $\tau$ 配对送进极限（planar.tex:273 至 planar.tex:280），$q=1$ 时纯量相位恒零也一并覆盖（planar.tex:281）。对全部圈求和，用 $\sum_z a(z)=2b$ 与 $2-q=2K-b$（planar.tex:93 至 planar.tex:94 的欧拉账）：
$$\lim_{\epsilon\downarrow0}\ell(S\Theta)=\frac{2b-q}{2}+q-1+\tau\bigl(h(L(r_{z_0}^{-1}))\bigr)=\frac32 b-K+\tau\bigl(h(L(r_{z_0}^{-1}))\bigr)$$
（planar.tex:282 至 planar.tex:288）。上界与下界常数项逐字相等，余量只剩最后那个非负迹，逼迫 $\tau(h(L(r_{z_0}^{-1})))=0$；迹忠实且 $h\ge 0$ 给 $L(r_{z_0}^{-1})=I$，作用在 $\delta_1$ 上得 $r_{z_0}=1$（planar.tex:289 至 planar.tex:292）。[推测] 我在复盘时给这一幕起的名字是"一台算子的两张收据"：$SJ$ 的 $\frac b2$、$J\Theta$ 的 $b-K$、边界的 $\frac{2b-q}{2}+q-1$，三张收据在欧拉示性数处对账，差额被设计成恰好是被怀疑边界词的相位，这就是为什么切割必须取在 $1$ 且右连续。

## §11 从核关系倒出平面曲面：穿孔圆盘与水平集带

命题只说"若曲面存在则边界词平凡"，曲面本身要从核里的一个元素倒出来（kernel.tex:5 至 kernel.tex:10 坦白：任意的变量出现配对不保证平面性，必须把带做成穿孔圆盘上变量圆映射的水平弧，且系数映射在带上恰为常数）。第一步，表达式与展示空间：设 $g\in G$ 落在正规闭包里，有有限式
$$g=\prod_{\alpha=1}^{u} b_\alpha\, w_{i_\alpha}^{\epsilon_\alpha}\, b_\alpha^{-1},\qquad b_\alpha\in G*F_n,\qquad \epsilon_\alpha\in\{1,-1\}$$
（kernel.tex:14 至 kernel.tex:20）；$u=0$ 则 $g=1$，以下设 $u>0$；关系字用 §6 的循环代表，共轭只改 $b_\alpha$（kernel.tex:21 至 kernel.tex:24）。取带基点胞腔展示空间 $Y$ 使 $\pi_1(Y)=G$，令 $Y'=Y\vee S^1_1\vee\cdots\vee S^1_n$，新增圆代表变量，$\pi_1(Y')=G*F_n$；系数与 $g$ 各取 $Y$ 中环路，$Y$ 无需非可缩或有限性质（kernel.tex:26 至 kernel.tex:32）。取定向多边形盘 $\Delta$，挖去内部互不相交的多边形盘 $D_\alpha$，得穿孔盘 $P$（kernel.tex:34 至 kernel.tex:39）；要找 $f:P\to Y'$：外边界读 $g$，$\partial D_\alpha$ 按"缺失盘的边界定向"读 $w_{i_\alpha}^{\epsilon_\alpha}$，每个变量字母是一次单调绕圆，中间系数段走既定环路、标签为单位元也保留区间（kernel.tex:40 至 kernel.tex:46）。可扩性的显式论证：沿从外边界到各洞的互不相交弧剪开，弧映到 $b_\alpha$ 环路，外端点放在外环路的常数段、洞按外圈走完后逆序遇到；剪开盘的边界读
$$g\bigl(b_u w_{i_u}^{\epsilon_u} b_u^{-1}\bigr)^{-1}\cdots\bigl(b_1 w_{i_1}^{\epsilon_1} b_1^{-1}\bigr)^{-1}$$
（kernel.tex:53 至 kernel.tex:56），按表达式零伦，零伦道把映射铺满剪开盘；每条剪弧两份拷贝映射相同、穿行相反，故下降到 $P$；$P$ 的诱导边界定向在洞上缺失盘定向的反向，解释显示字里的逆号（kernel.tex:58 至 kernel.tex:63）。

第二步，水平集造带。令 $f_j:P\to S^1_j=\mathbb R/\mathbb Z$ 为把其余楔分量压掉的复合，$v:P\to Y$ 为系数复合（kernel.tex:67 至 kernel.tex:70）。取公共的足够细分三角剖分与分片仿射圆值映射 $\widetilde f_j$，在 $\partial P$ 上固定、全域一致逼近误差小于 $\frac1{12}$（kernel.tex:72 至 kernel.tex:79）。素材直接给了构造法：边界映射本就按角坐标分片仿射；细分尊重其断点、细到每个小三角形在每条 $f_j$ 下像落在短弧内，弧升到 $\mathbb R$ 对顶点值线性插值，公共边上两升只差整数故按圆值相容，一致连续性交出误差界（kernel.tex:80 至 kernel.tex:86）。每个 $j$ 取 $t_j\in(\frac13,\frac23)$ 不在任何顶点像里，水平集 $\widetilde f_j^{-1}(t_j)$ 是有限多个多边形圈与恰当嵌入多边形弧的不交并：每三角形内是线段、避顶点使线段无分叉拼接（kernel.tex:88 至 kernel.tex:92）；逼近在边界固定，每个洞内 $x_j^{\pm1}$ 的一次出现恰贡献一个端点，外边界与系数段上没有端点（kernel.tex:93 至 kernel.tex:96）。不同 $j$ 的水平集互不相交：在水平集点上原始 $f_j$ 与圆基点的角距离超过 $\frac14$（$\frac13-\frac1{12}=\frac14$ 的下界），故 $f$ 落在第 $j$ 个变量圆上远离楔点处，其余圆投影皆零，同一论证在水平集的某个邻域内依旧成立，于是 $v$ 在该邻域恒等于基点（kernel.tex:98 至 kernel.tex:104）；素材特意叮嘱这一步用的是原始楔值映射 $f$，各自逼近未必能拼成楔值映射（kernel.tex:104 至 kernel.tex:106）。丢掉闭圈分量，在水平弧的邻域内选互不相交的细矩形邻域，它们就是带；每块带在洞上截出变量环路内部的小区间，每次出现恰有一个；圆的水平集的余向性使弧的两端穿越符号关于 $P$ 的边界定向相反，两端定向同时反转为缺失盘定向后仍相反，于是每条带配对的正是同一变量的相反穿行符号（kernel.tex:108 至 kernel.tex:117）。取这些更小的附着区间当槽：变量环路在槽外的部分投影恒等于 $Y$，缩槽不改系数标签；且 $v$ 在每条带上恰为常数（kernel.tex:119 至 kernel.tex:122）。把 $D_\alpha$ 当带符号字盘放回去：盘与带的并在 $\Delta$ 内部嵌入成紧致曲面，槽全部配对，每个连通分支平面，边界词恰是 $v$ 在各边界圆上供出的环路（kernel.tex:122 至 kernel.tex:126）。

## §12 由内向外填补，主定理闭合，无穷系统附注

第三步，嵌套分支的处理（kernel.tex:128 至 kernel.tex:152）。每个连通分支有一条外边界圆，其若尔当盘含住整个分支，其余边界圆围住内部补盘；不同分支的外若尔当盘或不相交或互相嵌套（kernel.tex:130 至 kernel.tex:133）。取外盘按包含关系极小的分支：它的内部补盘不含其他分支、也就不含任何缺失字盘，$v$ 在每个补盘上本已有定义，故这些边界词在 $G$ 中平凡（kernel.tex:134 至 kernel.tex:138）；§10 命题说到底就是"除一条边界外全部平凡则最后一条也平凡"，对极小分支适用，得它的外边界词同样平凡（命题回指见 kernel.tex:140 至 kernel.tex:141）；该外边界环路随之扩张为其若尔当盘到 $Y$ 的映射，在盘内用扩张替换 $v$，两映射在边界重合故连续贴合，盘内无其他分支、剩余分支的系数标签与带上的常数值不动（kernel.tex:141 至 kernel.tex:146）。有限次重复清空全部分支，得到 $\Delta\to Y$ 延伸最初的外环路 $g$，于是 $g=1$ 在 $G$ 中。$g$ 是核中任意元素，单射性证毕，主定理成立；商群 $(G*F_n)/\langle\!\langle w_1,\ldots,w_m\rangle\!\rangle$ 自己就是扩群，自由生成元的像就是同时解（kernel.tex:147 至 kernel.tex:152）。

附注把有限陈述放大到任意多个方程与变量（kernel.tex:154 至 kernel.tex:162）：设每个指数行有限支撑、全体在 $\mathbb{Q}$ 上无关；若 $G$ 的元素在商里被杀，取它的正规闭包表达式，只牵涉有限多个关系与有限多个变量（共轭子里出现的也算），对应有限指数子矩阵仍行无关，主定理逼该元素平凡。[推测] 我认为这段附注的分量比它的八行篇幅大：它说明证明的紧性开支全部花在"每个被怀疑的元素自带有限子证明"上，非奇异条件在取子矩阵时自动遗传，这恰好是 $\mathbb{Q}$ 行无关假设最舒服的地方，行列式的整性要求在这里同样无处显形。

至此整条证明链可以一句话说尽：核元素给出穿孔盘映射，水平集给出平面曲面与边界词，盘数平衡给出重数矩阵，定空定理给出 $2K$ 条固定方向，次可加给出 $\ell(S\Theta)\le\frac32 b-K$，圈公式加切割极限给出 $\ell(S\Theta)\ge\frac32 b-K+\tau(h(L(r_{z_0}^{-1})))$，忠实迹收口。我在笔记本边缘写下的判词是：这不是一个构造性证明，它是一次会计，三张收据对上之后，被怀疑的边界词连一分钱都藏不住。

## §13 最终思路与最初设想的分岔

对照 §1 与 §3、§4 的起点，最终形态至少有五处分岔。第一处：从"逐次解方程"到"一次性会计"。最初（[推测]）的迭代图景在第一条方程解完后就失控，最终证明里方程同时进入同一个曲面，$m$ 条关系以重数矩阵 $B$ 的形态一次性喂给定空定理（fixed-space.tex:11 起的定理陈述），没有任何"先解谁"的顺序问题。第二处：从"幺模执念"到"有理秩就够"。Gerstenhaber-Rothaus 的传统里行列式的绝对值是硬通货，Klyachko 定理要指数和恰为 $\pm 1$；本证明对行列式的值只问是否非零（fixed-space.tex:45 至 fixed-space.tex:48 的嵌套子式、fixed-space.tex:278 至 fixed-space.tex:282 的子式乘积），$\mathbb{Q}$ 上满秩即宣告收工，这一点让定理比单方程情形的既有结果在假设上宽了整整一个初等因子层级。第三处：酉结构的角色一分为二。前作与超积路线都把"酉"施加在群本身或群的逼近上；本证明把酉分成两层，一层是复制指标上的有限维酉群 $\mathrm U(k_i)$（纯量矩阵），一层是系数在左正则冯诺依曼代数里的精确算子 $L(a)$，两层在 $S$、$\Theta$、$J$ 的定义里各行其是（planar.tex:156 至 planar.tex:164 与 planar.tex:176 至 planar.tex:182），互不越权，这才让"任意群"三个字全程无假设。第四处：交理论替代同调判据。Nitsche-Thom 那条路线用删系数展示复形覆盖的第二同调消没做假设，而素材指出展示复形自身的二同调消没恰好就是指数行无关（history.tex:45 至 history.tex:51）；本证明没有碰被怀疑复形的任何同调，取而代之的是酉矩阵乘积空间上的有理交类 $\Omega$（fixed-space.tex:251 至 fixed-space.tex:255），一个与群方程完全无关的交原理（introduction.tex:86 至 introduction.tex:89 明说这个交集原理独立于其在群方程上的应用）。第五处：证明不生产结构。最终定理只保证商群这一个扩群里的存在性，对扩群的可解性、有限性、嵌入性质一概不控（history.tex:60 至 history.tex:61 把这类结构结论划为他方战果），与 Ramirez-Côté-Wise 在幂级数群里反行列式、Klyachko-Mikheenko-Roman'kov 在可解群类内取解的口味形成对照；我的读法是：会计式证明的预算表里本来就没有"扩群长什么样"这一栏。

[推测] 分岔里我最想记住的一条经验：素材 introduction.tex:55 至 introduction.tex:62 把证明纲领压缩成七行（核关系、盘、带、只剩系数的边界、边界障碍、去内层、单射），这七行在我这边的展开顺序几乎与写作顺序相反，我是从"边界障碍为什么必须成立"倒推回"盘从哪来"的。读一篇会计式论文，先找它的对账单，再找它的发票夹，比顺着定理号走省一半时间。

## §14 开放疑问与存疑清单

收笔前列一张我自己没能关掉的问号清单，每条都注明素材给到哪里、断在哪里。

第一条，行秩亏欠时发生什么。定理假设 $\operatorname{rank}_{\mathbb{Q}}A=m$；若行相关，§6 的盘数平衡可以失败，夹逼两边会多出未知残项。素材全篇没有讨论行相关系统的可解性，连一个具体反例都没给（[源未载]）。我不愿把"证明方法失效"错记成"命题为假"，这条只能挂账。

第二条，定空界的锐利性。定理输出 $\sum_j\dim\ker\ge\sum_i k_i$（fixed-space.tex:31 至 fixed-space.tex:34），证明用交数非零存在点，完全可能远低于真实下确界。$r=1$、单列时前作的固定平面构造给出同等量级，更高重数时能否取到等号，素材未答（[源未载]）。[推测] 若有人把界改进到 $\sum_i k_i$ 之上，§10 的上界会同步收紧，残项甚至可能量化出边界词的长度信息，那就是另一篇论文了。

第三条，平面性到底吃了多少。命题写明亏格零（planar.tex:48 至 planar.tex:49），§11 用穿孔圆盘水平集专门供养它；欧拉账 $2-q=2K-b$（planar.tex:94）在下界合并处只使用了一次。[推测] 高亏格曲面会把常数改成 $2-2\chi$ 量级的偏移，夹逼大概率留出 $-\chi$ 的缺口；素材没有任何只言片语涉及非平面情形，我不再推。

第四条，扩群的结构。§13 已述，本证明只给存在性，解群是否可取为可解类内、是否有限、能否保持嵌入性质，都在他方路线的条款里（history.tex:53 至 history.tex:61），本单没有交接。

第五条，与同调判据的接口。Nitsche-Thom 的更强定理以删系数展示复形之覆盖的第二同调消没替代非奇异性（history.tex:45 至 history.tex:51），覆盖可以比展示复形本身更"消没"，即他们的假设严格更宽。本证明的机器里只有指数矩阵 $A$ 与重数矩阵 $B$，同调 nowhere 入账。[推测] 除非给盘带复形建立某种链级对偶，两条判据短期内接不上；这条是我个人口味，存疑。

第六条，忠实迹的适用范围。整套数值管线只用 $\mathcal M$ 的忠实半有限迹与酉算子的博雷尔演算，没碰逼近论（history.tex:72 至 history.tex:79 明说这是他们对前作引理的替代路线）。[推测] 同样的"两张收据"是否适用于其他带忠实迹的代数，比如某些有限直积或群测度代数，素材沉默。

## §15 微观验算：$k_1=1$、$N_1=3$ 的小账本

为了让 §10 的四幕不悬在半空，我做了一遍最小非平凡情形的数值验算。[推测] 素材没有例子节，这一节全是我私下的核算，登记如下以便日后自查。取单变量单方程 $w_1=x\,g_1\,x^{-1}\,g_2\,x\,g_3$（三个槽、指数和 $a_{11}=1\ne0$），曲面由 $k_1=1$ 块正盘与 $1$ 块负盘、共 $b=N_1k_1=3$ 条带组成：盘数 $2K=2$，槽数 $2b=6$，欧拉账 $\chi=2K-b=2-3=-1$，故边界分支 $q=2-(-1)=3$；圈长和 $\sum_z a(z)=2b=6$，例如三圈可以是 $2,2,2$。上界一侧：$\ell(SJ)=\frac b2=\frac32$；$J\Theta$ 在 $d_1=3$ 维空间 $V_{1,+}$ 与 $V_{1,-}$ 上，定空定理要求总固定方向 $f\ge 2K=2$，若恰好 $f=2$ 则 $\ell(J\Theta)=\frac{2b-f}{2}=\frac{6-2}{2}=2$，次可加给出 $\ell(S\Theta)\le\frac32+2=\frac72$，与公式 $\frac32 b-K=\frac92-1=\frac72$ 吻合。下界一侧：三条边界圈中两条平凡、各在切割极限里供 $\frac{2-1}{2}+(1-\epsilon)$，被怀疑圈供 $\frac{2-1}{2}+\tau(h(e^{2\pi i\cdot 2\epsilon}L(r^{-1})))$；求和取极限得 $\frac{2b-q}{2}+(q-1)=\frac{6-3}{2}+2=\frac72$ 再加残项 $\tau(h(L(r^{-1})))$，两侧常数同为 $\frac72$，残项被压成零，$r=1$。每一步都对得上，这让我相信素材里 $\frac32 b-K$ 那三个分数没有任何抄写错误。

顺手也核了退化账：$k_1=1$、$N_1=1$（字形 $x\,g_1$）时 $b=1$、$K=1$、$\chi=2-1=1$、$q=1$，上界 $\frac32\cdot1-1=\frac12$，下界 $(2-1)/2+0+\tau=\frac12+\tau$，同样咬合；$q=1$ 时 $\eta_{z_0}=(q-1)\epsilon=0$，素材在 planar.tex:281 特别点名这一情形由"纯量相位恒零"覆盖，与我的账一致。

## §16 关键量台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $A=(a_{ij})\in M_{m\times n}(\mathbb Z)$ | 指数和矩阵，$w_i\mapsto(a_{i1},\ldots,a_{in})$ | introduction.tex:16 | 非奇异判据与重数矩阵 | 读出规则改了，后面全链失锚 |
| $\operatorname{rank}_{\mathbb Q}A=m$ | 行满秩即非奇异 | introduction.tex:23 | §6 盘数平衡、§7 的 $B$ | 秩亏则推不出 $p_i=m_i$ |
| $1\le m\le n$ | 方程数不超变量数 | introduction.tex:28 | 主定理假设 | $m>n$ 时行秩 $m$ 不可能成立 |
| $N_i\ge1$ | 每字至少一个变量槽 | planar.tex:21 | 盘必带槽、带可配对 | 无变量字使行无关失去意义 |
| $p_i=m_i=k_i$ | 同型正负盘数相等 | planar.tex:71 | $K$、$b$ 与重数矩阵 | 不平衡则定空输入行不满秩 |
| $K=\sum_{i\in I}k_i$ | 出现型总重数 | planar.tex:74 | 定空界右端与 $f\ge2K$ | $K$ 变了上下界同步漂移 |
| $b=\sum_{i\in I}N_ik_i$ | 带条数与半槽数 | planar.tex:75 | $\chi$、$\ell(SJ)=\frac b2$ | 带数错则欧拉对账崩 |
| $2-q=\chi(\Sigma)=2K-b$ | 亏格零欧拉账 | planar.tex:94 | 下界常数合并 | 高亏格时夹逼余出亏格项 |
| $\sigma$ 与 $\theta$ | 边界后继与带配对置换 | planar.tex:78 | 边界圈即 $\sigma\theta$ 的圈 | 配对违反反号规则则带不合法 |
| $r_z=c_{\theta d_1}\cdots c_{\theta d_a}$ | 边界词，换起点为共轭 | planar.tex:89 | 圈公式的绕圈积 | 起点敏感则平凡性不良定义 |
| $\sum_z a(z)=2b$ | 圈长总和等于两倍槽对 | planar.tex:94 | 下界求和首项 | 槽未全部配对时等式断 |
| $\det B[1,\ldots,t\mid j_1,\ldots,j_t]\ne0$ | 嵌套非零子式串 | fixed-space.tex:46 | 目标维数 $l_{j_t}=k_t$ | 只有单个高阶子式则低层无保证 |
| $d_j=\sum_{(i,s)\in\mathcal B_j}k_i$ | 第 $j$ 列总块维数 | fixed-space.tex:17 | $P_j\in\mathrm U(d_j)$ 与 $l_j\le d_j$ | 尺寸改则交问题不互补 |
| $\sum_j l_j^2=\dim_{\mathbb R}D=\sum_i k_i^2$ | 余维互补账 | fixed-space.tex:63 | 顶类配对的存在前提 | 和式破坏则 $\Omega$ 无处安放 |
| $\sum_j\dim\ker(F_j(X)-I_{d_j})\ge\sum_i k_i$ | 定空界 | fixed-space.tex:32 | §10 的 $f\ge2K$ | 界弱化则上界 $2\ell(J\Theta)$ 失守 |
| $H^*(\mathrm U(d);\mathbb Q)=\Lambda(e_{1,d},\ldots,e_{d,d})$ | 外代数生成元基 | fixed-space.tex:76 | 拉回公式与顶单项计数 | 换有限域系数则奇次平方消亡失效 |
| $\lvert e_{a,d}\rvert=2a-1$ | 生成元次数谱 | fixed-space.tex:77 | 长度-次数账 $1+3+\cdots=u^2$ | 次数错则短项混进顶次配对 |
| $\mu^*e_{a,d}=e_{a,d}\otimes1+1\otimes e_{a,d}$ | 本原性 | fixed-space.tex:93 | 拉回的线性叠加 | 失本原则出现交叉项、行列式形不成 |
| $\dim_{\mathbb R}R(d,l)=d^2-l^2$ | 入射关联簇维数 | fixed-space.tex:160 | $\alpha(d,l)\in H^{l^2}$ 的余维 | 维数错则对偶类次数不配 |
| $\alpha(d,l)=c_{d,l}e_{1,d}\cdots e_{l,d}+\cdots$ | 入射类领头展开 | fixed-space.tex:190 | 顶系数乘积公式 | $c_{d,l}=0$ 则配对可以整体消失 |
| $F_j^*e_{a,d_j}=\sum_{i:k_i\ge a}b_{ij}e^{(i)}_{a,k_i}$ | 生成元拉回公式 | fixed-space.tex:241 | 按次数 $2a-1$ 分组外积 | 符号规则错则行列式变永久式 |
| $\prod_{a=1}^{k_1}\det B[1,\ldots,t_a\mid j_1,\ldots,j_{t_a}]$ | 顶系数子式乘积 | fixed-space.tex:281 | $\langle\Omega,[D]\rangle\ne0$ | 任一因子为零则存在性论证哑火 |
| $\tau_d(I)=d$ | 未标准化迹的归一 | phase.tex:26 | 圈公式 $a\ell(T)$ 的归一 | 改标准化则常数 $\frac{a-1}{2}$ 漂移 |
| $\ell(U)=0\iff U=I$ | 相位忠实性 | phase.tex:75 | §10 终点由零迹收口 | 忠实性失则只剩近似结论 |
| $\ell(UV)\le\ell(U)+\ell(V)$ | 次可加性 | phase.tex:87 | 上界 $\frac32b-K$ 的合成 | 若仅有加性常数界则夹逼留残项 |
| $h(e^{2\pi it})=t-\lfloor t\rfloor$ | 切割在 $1$ 的右连续相位 | phase.tex:69 | 极限两端的不对称分工 | 对称磨光则 $f_\varepsilon(1)$ 失控 |
| $\ell(e^{-2\pi i\varepsilon}I_d)=d(1-\varepsilon)$ | 单位元的跳变端 | phase.tex:156 | 平凡边界每条供 $1-\epsilon$ | 走另一侧则平凡分支少供整份 $q$ |
| $\ell(T)=\frac{a-1}{2}+\tau(h(C))$ | 加权圈公式 | phase.tex:177 | 下界的逐圈求和 | 真空能项错则常数对不齐 |
| $\gamma_{\theta d}=-\gamma_d,\ \sum_{d\in z}\gamma_d=\eta_z$ | 带上反号的相位分发 | planar.tex:140 | $\Theta^2=I$ 与绕圈积权重 | 反号破则 $\Theta$ 不是对合 |
| $\ell(SJ)=\frac b2$ | 盘交换对合的相位 | planar.tex:197 | 上界前半预算 | $JSJ=S^{-1}$ 失则对合与迹账全崩 |
| $2\ell(J\Theta)=2b-f\le2b-2K$ | 特征值反演对称账 | planar.tex:235 | 上界后半预算 | 定空重数改则 $h(\lambda)+h(\lambda^{-1})$ 失效 |
| $\ell(S\Theta)\le\frac32 b-K$ | 全曲面相位上界 | planar.tex:241 | 夹逼左墙 | 分发和不为零则整条界作废 |
| $\lim_{\epsilon\downarrow0}\ell(S\Theta)=\frac32 b-K+\tau(h(L(r_{z_0}^{-1})))$ | 夹逼右墙与唯一残项 | planar.tex:287 | 逼迫 $r_{z_0}=1$ | 取侧反向则极限多出一常数份 |
| $u$ | 核表达式中共轭子个数 | kernel.tex:17 | 穿孔盘的洞数 | $u=0$ 时无须任何曲面 |
| $\frac1{12}$ 与 $t_j\in(\frac13,\frac23)$ | 逼近容差与水平层间隔 | kernel.tex:77 | 水平集互斥、端点计数 | 容差越过 $\frac14$ 则邻域论证断 |
| $g\mapsto(G*F_n)/\langle\!\langle w_1,\ldots,w_m\rangle\!\rangle$ | 单射即同时可解 | introduction.tex:32 | 主定理与无穷系统附注 | 单射失败即有非平凡核元逆推 §12 |

## §17 自检与勘误

自检登记。§0 末尾两条逐字登记行在正文前五千字符内，目录名与行号各占一行、行号二字齐全。小节自 §0 至 §17 连续编号、物理顺序与编号一致，同一编号全文只出现一次；"见 §N"式回指只出现在 §7、§9、§10、§14、§15、§16，指向的节均已落盘在案。文末台账的五列表头全文只出现一次，只在 §16；数据行三十六行，每行五个数据格，位置列全部是本会话真实读到的文件与行号。行内公式一律成对定界，收工实测的字节数、`$` 总数与奇偶、取证调用数与首次落盘窗口，统一写进交付报告，本笔记不留会自我矛盾的静态数字。

勘误与申报（只按类别登记，落盘内容一字不动，就地替换属越界动作，我不执行）。第一类，首块字节不足：首次落盘段实测一万七千六百九十二字节，低于两万的单块下限，而建立新稿的写入机会全文只允许一次，缺口无法就地弥合，特此申报，由本体侧裁定处理。第二类，禁用衔接短语命中：§1 正文中部与 §4 正文末段各有一处段落衔接用了禁令清单内的转折搭桥短语（前者为两字转折偏正组合，后者为四字改口连接组合），其中 §4 那处当时还附了一段解释性的括号自辩，同属行文残留；两处均不就地改字，申报待统一清理通道处理。第三类，未译残留与夹注残缺：§8 第三段落有一处普通英文名词以原文形态混入汉语行文，§10 第二幕与 §12 第三步各有一处引用括注把素材文件名残片写进了括号、句式残缺，正确读法分别是"关系式 $JSJ=S^{-1}$ 见 planar.tex:184 至 planar.tex:186"与"命题回指见 kernel.tex:140 至 kernel.tex:141"，此处只作说明、不动原文。第四类，定界符配对：写作过程中未发现行内代码闭合符误用或成对停顿号错位；若收工复检发现 `$` 计数异常，按规格只做申报与单点配对修正，绝不补孤立同形字符做奇偶补偿。除此之外本单没有其他越界动作：未执行任何版本控制命令，未在工具目录留任何临时文件，未读取任何被禁清单上的路径，素材侧全程只读。

## §18 增补一：写作次序与发现次序

素材的章节次序是定空定理打头（fixed-space.tex:1 起整节），随后相位、平面、核，收录顺序见 main.tex:40 至 main.tex:44。我按推理依赖重建的次序（[推测]，素材未自述）几乎倒过来：先有核关系供出曲面，再有曲面供出计数账，账逼出定空定理，最后才想起相位算术要两头对表。写作次序颠倒回去，我总结成三个理由。

理由一：fixed-space.tex 对其余三节零输入依赖。它唯一的外部引用是给前作的指针（fixed-space.tex:7 至 fixed-space.tex:9），假设只有 $B$ 行满秩与正整数 $k_1,\ldots,k_r$，结论是纯拓扑的存在性陈述，introduction.tex:86 至 introduction.tex:89 也自证"这个交集原理独立于群方程应用"。把它放前面，读者接受主定理之前先接受一条上同调定理，心理成本最低；反过来若先讲方程，就得在前向引用里悬空一次。

理由二：phase.tex 只需要群 $G$ 本身。$\mathcal M$ 的构造、$\tau$ 的忠实、次可加与圈公式（phase.tex:83 起与 phase.tex:167 起两条引理）都不涉及任何方程形态，先于 $w_i$ 出场毫无负担；而 planar.tex:150 至 planar.tex:159 那对"切割不对称"的边，读者若不在相位节先把右连续与跳变两端背熟，到边界障碍第四幕就会被两种极限来回切换打懵。记号必须前置，这是给夹逼上保险。

理由三：planar.tex 是两条流水唯一的汇合处，kernel.tex 是唯一"造实物"的一节。命题 planar.tex:46 同时消费 §7 的定理（消费点在 planar.tex:219 至 planar.tex:226）与 §9 的算术（消费点在 planar.tex:264 至 planar.tex:288），它必须排在两者之后；kernel.tex:98 至 kernel.tex:106 的水平集互斥要靠"借"原始楔值映射 $f$ 才成立，是最具体也最不优雅的一步，放最后能让论文以主定理闭合收束，顺势用 kernel.tex:154 至 kernel.tex:162 的附注把无穷系统打包带走。我还核对了一条隐藏约束：记号 $K$、$b$、$q$ 全部定义在 planar.tex:73 至 planar.tex:94，若把核构造提前，读者会在没有数值账本的情况下先看水平弧，命题里那句"由盘与带构成的曲面"将失去着落。

[推测] 我不认为这个次序只是排版惯例：introduction.tex:55 至 introduction.tex:62 用七行字概括全证明，那七行的顺序（核关系、盘、带、只剩系数的边界、边界障碍、去内层、单射）恰好是发现顺序，正文顺序则是依赖顺序。两种顺序互为镜像，本身就说明这枚证明是三件模块拼装的，作者把拼装缝留在了摘要与引言的措辞里（main.tex:35 至 main.tex:39 与 introduction.tex:55 起）。

## §19 增补二：每条假设被谁消费

再记一笔私账：把每条原始假设被兑现的位置逐个登记。我画这张表时发现假设的承重远比表面紧凑。

其一，$1\le m\le n$（introduction.tex:28）。证明从不单独使用这个不等式：$\operatorname{rank}_{\mathbb{Q}}A=m$ 已经蕴含 $m\le n$，写出来纯属防御性表述，承重为零。

其二，行满秩 $\operatorname{rank}_{\mathbb{Q}}A=m$。它至少被三处消费：planar.tex:68 至 planar.tex:71 的盘数平衡（由 $\sum_i(p_i-m_i)a_{ij}=0$ 逼出 $p_i=m_i=k_i$），planar.tex:219 至 planar.tex:222 处确认重数矩阵即 $-A$ 限于 $I$ 行且行满秩，以及 fixed-space.tex:45 至 fixed-space.tex:48 的嵌套子式串与 fixed-space.tex:278 至 fixed-space.tex:282 的子式乘积非零。前一处把秩换成组合，后两处把秩换成上同调交数的非消失。

其三，$N_i\ge1$（planar.tex:21 至 planar.tex:22，由第 $i$ 行非零保证）。它让"每块盘至少一个槽"成立，带才有可配对的物件；若 $N_i=0$，常数关系字本身就破坏行无关，假设体系自断根基。

其四，角弧非空（planar.tex:25 至 planar.tex:26）。兑现点在 planar.tex:91 至 planar.tex:92："非空的角弧保证至少存在一条边界分支"。一条边界都没有的话，$\eta_z$ 的分发、被怀疑分支 $z_0$ 的选择、乃至整个第四幕的极限全都悬空。这条小假设极容易被当成画图惯例读过去，实际是夹逼的结构承重墙。

其五，系数在每条带上恰为常数（kernel.tex:68 至 kernel.tex:70 提出目标，kernel.tex:103 至 kernel.tex:104 经楔点分离达成，kernel.tex:119 至 kernel.tex:122 缩槽后保持）。兑现点在 planar.tex:41 至 planar.tex:44：边界词只由角弧标签拼出、带侧零贡献。若带上有系数漂移，$r_z$ 的定义要改成沿带的路径排序积，命题的陈述本身就不成立了。

其六，亏格零（planar.tex:48 至 planar.tex:49）。兑现于 $2-q=\chi(\Sigma)=2K-b$（planar.tex:93 至 planar.tex:94）在下界常数合并处的一次使用；§14 第三条已经挂过账，这里补一句：全证明只用了这一次亏格信息，$\frac32 b-K$ 的整洁两边恰靠它撑着。

其七，$\Sigma$ 连通（planar.tex:49）。兑现于相位分发图的连通性论证（planar.tex:145 至 planar.tex:149）。曲面不连通时命题无法整体适用，kernel.tex:134 至 kernel.tex:146 的逐分支由内向外填补把不连通性切成了一次次连通情形，等价于给每个分支单独开票。

其八，$u$ 有限（kernel.tex:16 至 kernel.tex:20 来自正规闭包定义）。有限性兑现于公共三角剖分（kernel.tex:72 至 kernel.tex:79）、水平集为有限并（kernel.tex:90 至 kernel.tex:92）、填补迭代有限终止（kernel.tex:147 至 kernel.tex:149）。kernel.tex:154 至 kernel.tex:162 的附注正是把"有限"从曲面端交还给表达式端的技艺。

其九，$P_j$ 完全任意（fixed-space.tex:22 至 fixed-space.tex:23）。这份任意性是接口：planar.tex:209 至 planar.tex:218 里带的相位 $\gamma_d$ 全部藏进 $P_j$，定理必须对所有 $P_j$ 一致生效，相位分发才能事后才定 $X_i$。右乘同伦恒等、上同调不可见（fixed-space.tex:248 至 fixed-space.tex:250）就是这份任意性的上同调执照。

其十，未标准化迹 $\tau_d(I)=d$（phase.tex:24 至 phase.tex:29）。它让圈公式的 $\frac{a-1}{2}$（phase.tex:176 至 phase.tex:179）不带分母，两面求和后 $\frac{2b-q}{2}+(q-1)$ 与 $\frac32 b-K$ 才能逐字对账；取标准化迹的话每个常数都要再除一次 $2b$，记账立刻变丑。

盘点（[推测]，素材无此表）：十条假设里承重墙是行满秩、亏格零、角弧非空、带常系数四条，接口性假设是 $m\le n$、$N_i\ge1$、连通、有限四条，审美性条款是任意 $P_j$ 与未标准化迹两条。下次重读若发现某条"看似多余"的假设被删，先查这张单，再动笔。
