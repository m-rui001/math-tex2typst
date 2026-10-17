# D509 研究笔记：带隙方格基态的多项式键维 PEPS 逼近的来路与去路

## §0 开笔笔记与登记

这篇笔记要回答的问题只有一句话：我们凭什么敢说一个 $L\times L$ 方格上、只带全局能隙 $\Delta>0$ 的基态 $\Omega$，能被键维至多 $CL^{c}$ 的投影纠缠配对态（PEPS）以整体向量误差 $L^{-1}$ 逼近。主定理的最终形态写在 `00-introduction.tex:36` 至 `00-introduction.tex:57`，这里先把它的每个字掂量一遍：格点集 $\Lambda_L=\{1,\ldots,L\}^{2}$，边集 $E(\Lambda_L)$，开口边界条件；哈密顿量 $H=\sum_{v}h_v+\sum_{e}h_e$ 满足 $\lVert h_v\rVert\le J$ 与 $\lVert h_e\rVert\le J$；谱假设只有唯一基向量与不等式 $H-E_0I\ge\Delta(I-\lvert\Omega\rangle\langle\Omega\rvert)$；结论落在同一个方格的边集上摆出的张量网，最大键维 $\max_e D_e\le CL^{c}$，且 $\min_{\theta}\lVert\Phi/\lVert\Phi\rVert-e^{i\theta}\Omega\rVert\le L^{-1}$。注意 $C,c$ 只依赖 $(q,J,\Delta)$，对具体的 $H$ 一致。论文标题、作者栏与日期在 `main.tex:37` 至 `main.tex:39`，全文输入顺序在 `main.tex:53` 至 `main.tex:62`：引言、约定、信息界、补丁约束、压缩、编码框、几何协议、组装，最后是指向面积律同伴论文的附录。我写这份笔记时只允许读该论文 build 目录下的 13 个 `.tex`（合计 $199{,}817$ 字节，其中主干九节从 $2{,}668$ 到 $36{,}335$ 字节不等，最大的是 `06-geometry.tex` 的 $36{,}335$ 与 `02-information.tex` 的 $35{,}619$），`paper.pdf` 与 typst 分片一概未碰，这是硬约束，也是这份笔记所有位置引用的唯一来源。

登记（逐字两行）：
preprints/Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026
其他队列第 332 行号

## §1 初始动机与最初的猜想

最初的冲动来自一维图景的直接类比。一维里，Hastings 证明了可隙链的基态满足熵面积律 $S(A)\le C\lvert\partial A\rvert$，而面积律配上 Schmidt 截断就能得到多项式键维的矩阵乘积态（MPS）整体逼近，这条链条在 `00-history.tex:7` 至 `00-history.tex:10` 被当作历史锚点写出。我当时想，二维的对应物应该也顺：同伴论文（面积律那篇）已经给了我们开口方格类的面积律，见 `01-preliminaries.tex:39` 至 `01-preliminaries.tex:50`，常数 $C_A=C_A(q,J,\Delta)$ 对一切 $L$ 与类内哈密顿量一致；那么把每个割面 $A$ 上的约化密度矩阵 $\rho_A$ 截到秩 $e^{C_A\lvert\partial A\rvert}$，剩下的活儿大概只是把这些截断粘起来。猜想成形时我给它定的形状是：键维 $e^{O(\log L)}=\mathrm{poly}(L)$，误差 $\varepsilon$ 固定。后来的定理把误差收紧到 $L^{-1}$ 并让 $c$ 吸收所有对数，见 `07-assembly.tex:203` 至 `07-assembly.tex:205` 里那句把 $CL^{-5}$ 压回 $L^{-1}$ 的收尾，说明最初那个"$\varepsilon$ 固定"的版本连论文自己都没停在上面，它只是途中站。

还有一条初始动机是问题清单逼出来的。`00-history.tex:13` 至 `00-history.tex:17` 引述的环面、平移不变、有限range相互作用的提问方式，问的是谱隙能否保证多项式键维加逆多项式范数误差；我在 `00-history.tex:18` 至 `00-history.tex:20` 给自己选的战场是开口方格加任意有界在位与近邻相互作用。这个选择当时看起来只是"把边界条件放宽"，后来才明白它决定了整个证明的形态：开口方格让每个二进方块都有一个能落在格内的锚点，让 `07-assembly.tex:147` 至 `07-assembly.tex:161` 的折叠映射 $f(x)=x$（当 $0\le x\le L-1$）与 $f(x)=2(L-1)-x$（当 $L\le x\le N-1$）有得可写；环面平移不变版本则会把辅助副本的初始所有者问题变成平移协变性维护问题，那是另一整套麻烦。

## §2 第一条走死的路：逐割面 Schmidt 截断

错误路线一：对每个割面独立做谱截断，然后指望它们自动相容。这条路我撞了很久，失败原因最终看清是三层。

第一层是相容性本身。一条边 $e$ 同时属于许多割面 $A$ 的边界 $\partial_\Lambda A$，截断后的局部 Schmidt 基在不同 $A$ 里方向各异；要在边 $e$ 上放一个维数 $D_e$ 的虚拟空间并同时服务于所有经过它的割面，就必须让所有相关截断共享同一组单向压缩。`00-introduction.tex:6` 至 `00-introduction.tex:10` 把这一点写成了正文的开场白：面积律控制每一刀，但全局向量逼近额外要求不同割面上的描述互相兼容、误差在整张格上不溃散、最后网络真的用规定的那组边。三个"还要"里任何一个都不是熵不等式的推论。

第二层是一般态的否决票。`00-history.tex:35` 至 `00-history.tex:43` 记录了两组反例：对一般链态族，有界的 von Neumann 块熵并不保证高效的整体 MPS 逼近；在更高维，存在满足强面积律却没有任何高效经典张量网描述的状态族。这两组反例的攻击点在于，它们说明"每个约化谱都受控"与"存在一个全局小键维描述"之间有实质裂缝；而且第二类反例还附带经典复杂度假设，即张量分量的可计算性要求，与我们的结论（分量可以任意依赖 $H$ 与 $\Omega$，见 `00-introduction.tex:64` 至 `00-introduction.tex:66`）分属两种命题。我当时从反例里提炼出的教训是：必须有一种语言，让"截断"与"传播"在同一个对象里被同时记账，割面层面的不等式永远只是副产品。

第三层是误差预算。就算前两层都侥幸解决，每个割面截断误差 $\delta$ 乘以经过该边的割面数就爆掉：$L\times L$ 方格里穿过一条固定边的割面族数量随 $L$ 增长。我在草稿纸上记过一笔账：若每个割面截到尾部 $\delta/L^{2}$ 才可能守住总误差 $L^{-1}$，秩就到 $e^{C_A\lvert\partial A\rvert}+\log(1/\delta)+2\log L$，键维仍是多项式，可所有截断方向仍不相容。这个账最终指向同一个结论：逐刀操作没法闭合成全局网络，得换操作单位。

## §3 第二条走死的路：借局部化重整化群的一刀切边界

错误路线二：沿 Hastings 二维思路的块自旋路线走，把 $2n$ 块折成 $n$ 块，每步在某个预定边界半径上截断。这条路的尸体在 `03-patches.tex:6` 至 `03-patches.tex:10` 留下了明确的验尸报告：结论允许有限秩部分的半径在不同求和项之间浮动，命题对"在单个预定边界上的精确有限秩截断"什么也没断言。为什么预定边界撑不住？对数半径 $u=O(\log L)$ 的方块 $X$ 上，基态约化谱的尾部质量由面积律只给出平均意义的小，逐特征值没有一致下降率；想把 $\Omega$ 投到 $\mathcal H_X$ 的某个低维子空间张补空间的和上，投影误差随边界半径的选择振荡，任何单一的 $r$ 都可能踩在谱的平台上。`03-patches.tex:38` 至 `03-patches.tex:44` 给出的替代形态说明了两步走死的教训被怎样吸收：投影写成 $P=\sum_{j}\sum_{\ell}\lvert v_{j\ell}\rangle\langle v_{j\ell}\rvert_{X_j}\otimes\id_{\Lambda\setminus X_j}$，其中 $u\le r_1\le\cdots\le r_m\le 2u$ 是嵌套的方形样本，各 $X_j$ 半径随 $j$ 浮动，总秩 $\sum_j d_j\le CL^{c}$，误差 $\lVert(\id-P)\Omega\rVert\le L^{-p}$。半径的"自适应"就是把"单边界截断会在坏半径上失败"这句话兑换成的构造自由度。

局部化重整化群还带来第二个更隐蔽的死因：它每步都要求对边界两侧做对称处理，而二维块边界的熵贡献让"折块后保留的态"本身不再是任何短程哈密顿量的基态，谱隙在重整化下不封闭。同伴论文的正向替换命题（见 `08-companion-interface.tex:23` 至 `08-companion-interface.tex:36`）恰好给了相反方向的启示：那里的算子族 $k_i$ 满足 $k_i\Omega=0$ 且 $\sum_i k_i\ge c_*^{-1}(H-E_0I)$，配合近似局部性 $\lVert k_i-\mathbb E_{N_r(a_i)}k_i\rVert\le Ce^{-cr^{\alpha}}$，全部在原系统、原基态上操作。也就是说（此处仅指字面过渡，非术语），更准确的说法是：一切操作都应该被设计成"保持 $\Omega$ 为参照向量"的操作。这句话后来成了整个构造的轴心，见 §4。

## §4 关键转折：把逼近问题改写成所有权分发问题

转折点是一次重新表述。我把问题从"找一个键维小的 $\Phi$"改成"允许任意大的私有空间，只约束各参与方之间的通信次数"。具体框架在 `00-introduction.tex:71` 至 `00-introduction.tex:93`：参与方持有物理寄存器的集合，可以对自己的寄存器做任意私有收缩；初始时一方持有整个 $\Omega$，结束时每个格点一方；约束是每个参与方终身只参与有界多次与其他方的联合操作，且每次联合操作要有由私有收缩与双方归一两分向量或协向量组成的多项式展开。双分态自己的施密特秩允许任意大。制备初始向量被允许，因为我们要的是表示定理，是查找算法的否定面，见 `00-introduction.tex:64` 至 `00-introduction.tex:66`：定理不声称张量可被高效找到或收缩。

这一步为什么是转折，有三层。其一，它把"兼容截断"的负担转给了通信拓扑：所有权变更只有在两块区域的互信息小时才能通过私有操作加双分资源实现，而互信息恰恰是面积律与能隙联手能控制的量。其二，它给了误差一个天然的累加结构：每次变更对参照向量的扰动是独立的向量范数误差，收缩映射的乘积望远镜（`05-frames.tex:237` 至 `05-frames.tex:248` 里的恒等式 $A_s\cdots A_1-\id=\sum_j A_s\cdots A_{j+1}(A_j-\id)$）保证总误差至多是各步之和，不存在逐割面路线里那种"基方向不相容"的障碍。其三，它让"键维多项式"变成一个可以分两段证的目标：先在参与方图上把分布式密度压成多项式虚维的算子张量网（§14 的压缩定理），再把参与方图落回方格边集（§17 的常拥塞路由）。

参照向量的守恒纪律在 `00-introduction.tex:86` 至 `00-introduction.tex:93` 定型：参与方由二进方块索引，从一个尺度的所有权指派过渡到下一尺度时给每个子块发它的物理寄存器；中间指派允许非二进；辅助系统用 $\Omega$ 的独立副本，每个副本有自己的寄存器与所有权指派，但参照向量在原坐标下始终是 $\Omega$，误差小到可以全网求和。这套纪律的直接后果是：所有"看起来像重整化"的操作都必须在编码层面可逆或有误差账单，而账单的单位从第一页就定成 $L^{-p}$ 家族，见 `06-geometry.tex:42` 至 `06-geometry.tex:47` 与 `07-assembly.tex:22` 至 `07-assembly.tex:25`。

## §5 第一分析输入的前半：粗环领与单元条件互信息

从本节起进入两条分析输入的第一条：区域间距朝有限个标记点线性收窄、但始终不低于 $D\log L$ 时互信息可忽略。`00-introduction.tex:96` 至 `00-introduction.tex:105` 给了它的两段式结构：有序分成两族瓦片控制加入一个单元的代价；高斯滤子配合全系统能隙在每一环带步后把代价重置为 $L$ 的负幂。

第一段的外援接口在 `02-information.tex:26` 至 `02-information.tex:65`：同伴论文的模板常数 $C_{\rm tpl}$（写作 $C_{\mathrm{tpl}}$ 的规范形）与 $D_0$、领圈指数 $\varepsilon_{\rm col}=10^{-5}$、宽度 $\ell=\lfloor n^{1-\varepsilon_{\rm col}}\rfloor$，以及放缩命题里 $\beta_0=1-2\cdot10^{-6}$ 与 $\alpha=k/(k+1)>1-10^{-6}$，见 `02-information.tex:46` 至 `02-information.tex:71`。这些近乎迷信的小数让我起初很不舒服，为什么允许 $\alpha$ 只比 $1$ 差 $10^{-6}$？后来想明白：全部指数预算只需要"多项式放缩"这一件事，$1-2\cdot10^{-6}$ 与 $1-10^{-5}$ 谁赢不重要，重要的是 $\beta_0$ 严格卡在 $(1-\varepsilon_{\rm col})/\alpha$ 之下再被 $1$ 卡住，链条 $\ell+2r<\beta$ 次幂才闭合，见 `02-information.tex:75` 至 `02-information.tex:78` 的 $\ell+2r=o(n^{\beta_0})$ 与 `02-information.tex:129` 至 `02-information.tex:131` 的 $\ell+2r<u^{\beta}$。

第二段是本篇自己的引理：边长 $s$ 的方格网中，单个单元 $G$、任意其余单元并 $B$、以及离 $\over G$ 至少 $cs$ 的 $C$ 满足 $I(G:C\mid B)\le C_1(1+\log s)^K$，见 `02-information.tex:161` 至 `02-information.tex:178`。这个对数多项式 $K$ 次增长是整套几何的呼吸节拍。证明的两族着色递归（`02-information.tex:224` 至 `02-information.tex:315`）我读了三遍才跟上：固定 $\beta<\gamma<\gamma'<1$；每一代的许可材料住在边长 $u$ 的活动方块里，方块间距 $>10u$；取 $t_0=u^{\gamma}$，在距线交点 $10t_0$ 内预留半径 $4t_0$ 的洞给下一代，子块边长 $u'=8t_0$；着色规则把距禁色 $0$ 不超过 $t_0$ 的许可点归族 $1$，其余归族 $0$；族 $0$ 按创造序读、族 $1$ 按逆创造序读，链式法则加纯化对偶 $I(A:C\mid B)=I(A:C\mid D)$（`01-preliminaries.tex:71` 至 `01-preliminaries.tex:74`）让两族都化归成对"$C$ 并本族已处理部分"的普通互信息，再吃 `02-information.tex:190` 至 `02-information.tex:193` 的瓦片代价界。代数步数 $O(1+\log\log s)$、分支有界，总片数 $C(1+\log s)^K$。双序读取这一手是全文我第一次意识到同伴论文的两族熵消去（`08-companion-interface.tex:80` 至 `08-companion-interface.tex:88`）被真正改造过：那边断言 $S(A)\le S(D)+\tfrac12\sum_i\delta_i$，这边必须处理任意外部条件化，所以正文在 `02-information.tex:103` 至 `02-information.tex:105` 与 `08-companion-interface.tex:101` 至 `08-companion-interface.tex:104` 两处都强调不能靠"把普通互信息不等式条件化"来偷懒。

## §6 第一分析输入的后半：高斯重置引理

单元界给出的是 $(1+\log s)^K$ 级的代价；把它打回 $L^{-p}$ 的是信息重置引理，`02-information.tex:333` 至 `02-information.tex:352`：若 $I(R:C)\le b$ 且两核 $R_0\subseteq R$、$C_0\subseteq C$ 各自离补集宽度 $w=C_p(1+b+\log L)$，则 $I(R_0:C_0)\le L^{-p}$，且只用全系统能隙。证明的双副本构造值得慢慢记：取 $\Psi=\Omega^{\otimes2}$，$F=F_R$ 在 $R$ 上交换两副本，$\Phi=F\Psi$；目标是造一个在两副本的 $R_0\cup C_0$ 之外支撑的酉 $U$ 使 $U\Psi\approx\Phi$。相对熵路线（`02-information.tex:376` 至 `02-information.tex:414`）先由 $F\ge e^{-D/2}$ 与 Uhlmann 定理造出缓冲等距 $V$，把交换拉回原缓冲得收缩算子 $W$，关键重叠是 $z=\langle\Phi,W\Psi\rangle=\Tr\rho_{\widetilde\Omega,Rb_R}^{2}\ge e^{-2b}$，见 `02-information.tex:408` 至 `02-information.tex:413`。随后高斯滤子 $M=\int g_h(t)e^{it\mathbb H'}We^{-it\mathbb H}dt$，取 $h=A(1+b+\log L)$ 且 $A\Delta^2/2\ge 10+r_*+20$，双边误差 $e^{-h\Delta^2/2}$ 变 $e^{-10b}L^{-r_*}$，$r_*=2p+10$，见 `02-information.tex:426` 至 `02-information.tex:445`。时间截断 $|t|\le T_0B_*$ 的误差 $2e^{-T_0^2B_*/(2A)}$ 由同一指数预算吃掉。

我在这节停留最久的是局部化部分：酉性必须保持支撑在 $N_\ell(Q\cup Z_R)$，而 $V(t)=e^{it\mathbb H'}e^{-it\mathbb H}$ 的生成元差 $\mathbb H'-\mathbb H$ 支撑在跨过 $R$ 的边的端点集 $Z_R$。交换子递推 $c_y(S,t)\le c_y(S,0)+2\sum_{Z\cap S\ne\emptyset}\lVert k_Z\rVert\int_0^tc_y(Z,v)dv$（`02-information.tex:466` 至 `02-information.tex:471`）迭代出链计数，得Lieb--Robinson 型界 $\lVert[\tau_t(A),B_y]\rVert\le C\lvert S\rVert A\rVert e^{v\lvert t\rvert-\mu d_K(S,y)}$，规范写法是 $C\lvert S\rVert\nVert A\nVert\exp(v\lvert t\rvert-\mu d_K(S,y))$，见 `02-information.tex:491` 至 `02-information.tex:495`。之后用外部位的独立幺正平均做条件期望 $\mathcal P_D$ 把算子收进邻域，误差 $CL^4e^{vT-\mu\ell}$，取 $\ell=\lceil K_{\mathrm{loc}}B_*\rceil$、$C_p>K_{\mathrm{loc}}+3$ 收尾支撑核对（`02-information.tex:551` 至 `02-information.tex:608`）。极分解那一步（`02-information.tex:579` 至 `02-information.tex:598`）用不等式 $(\sqrt x-1)^2\le(x-1)^2$ 把 $D=M_{\rm loc}/z$ 的近等距性升成同一空间上的酉 $U$，正文明写"不在额外系统上做酉膨胀"，`02-information.tex:596` 至 `02-information.tex:598`，因为膨胀会引入新的虚拟维度，污染后面压缩定理的账单。最后互信息从迹距界经条件熵连续性回来：$I\le C\sqrt{\delta}\,L^{2}$ 配 $\delta=CL^{-r_*}$，得 $CL^{2-r_*/2}=CL^{-p-3}\le L^{-p}$，见 `02-information.tex:626` 至 `02-information.tex:629`。这里的 $L^{2}$ 是物理系统总维数的对数 $\log\dim\mathcal H=O(L^2\log q)$，$q$ 固定；$r_*=2p+10$ 里那 $+10$ 就是给连续性项留的活口。

## §7 角分离命题：把两半接成环带归纳

`02-information.tex:635` 至 `02-information.tex:659` 的命题是几何侧真正消费的接口：给定收窄系数 $a>0$、标记点集 $\mathcal V$（$\lvert\mathcal V\rvert\le m_0$）、$D\log L\le n\le A_0L$、$\diam X\le A_0n$，若每点满足 $\dist_\infty(x,E)\ge a\max\{s_{\min},\min(n,d_{\mathcal V}(x))\}$，$s_{\min}=D\log L$，则 $I(X:E)\le L^{-p}$。证明把 $X$ 按 $s_j=2^{-j}n$ 分层（`02-information.tex:665` 至 `02-information.tex:683`），归纳不变量是带垫的 $I(\Lambda\cap A_j^{+a's}:\Lambda\cap E^{+a's})\le L^{-p}$（`02-information.tex:691` 至 `02-information.tex:695`）。每层新单元先分两组：贴着上一层扩大部分的整组吃数据处理单调性；剩下的单元有界数个，逐个加入，每个的代价由单元引理给 $C_b(1+\log s)^K$（`02-information.tex:730` 至 `02-information.tex:733`）。然后重置引理把整个累计代价 $w(s)\le C_3(1+\log s)^K+C_4\log L$ 折回 $L^{-p}$，只要 $w(s)<c_*s$ 对 $s\ge D\log L$ 一致成立；充分性靠 $D\ge 4C_4/c_*$ 与 $(\log\log L)^K/\log L\to0$ 的经典比较，见 `02-information.tex:747` 至 `02-information.tex:777`。`02-information.tex:781` 至 `02-information.tex:782` 那句"代价每层被重置、不随层数累积"是全节题眼：没有重置，$O(\log L)$ 层归纳会把 $(1+\log s)^K$ 放大成 $(\log L)^{K+1}$，对数下界 $D\log L$ 就不够用了；有了重置，$s_{\min}$ 只与单层代价握手。这一节也解释了几何侧为什么到处用 $\max\{t,\min(n,d_{\mathcal V})\}$ 这种"角锥"形间距：离标记点多远就按 $n$ 计，靠近就按到标记点距离计，下限 $t=D\log L$ 由重置宽度里的 $\log L$ 项撑腰。
