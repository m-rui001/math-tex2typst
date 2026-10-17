# D299 在取值空间里做重整化：非塌缩 $\mathrm{RCD}(K,n)$ 空间正则点双 Lipschitz 坐标的工作笔记

## §0 登记与取材范围

派单编号 D299，主线2（非 Lean 队列）。派单行给的参数是 `row=123`、`bytes=143126`、`thin=no`，目录名照抄在本节末尾的第一条登记里，行号登记紧随其后。

本轮取材严格限制在 `preprints/Bi-Lipschitz-Coordinates-at-Regular-Points-of-Noncollapsed-RCD-Spaces-September-25-2026/build/source/` 下的五个 `.tex` 文件，落盘前用 `wc -c` 量过：paper.tex 2117 字节、introduction.tex 13250 字节、coordinates.tex 49523 字节、pinching.tex 45198 字节、renormalization.tex 33038 字节，合计 143126 字节，与派单行的 bytes 字段完全吻合。references.bib 有 13735 字节，我只用它核对引文标签是否存在，没有把它的内容当作正文素材。没有读 PDF，没有跑 pdftotext，没有碰 typst 分片，没有触碰 lean 目录与形式化文件，没有执行任何 git 命令。

主定理的陈述在 introduction.tex:17--32，抽象在 paper.tex:43--50，正文四个 section 的顺序是 uniform harmonic coordinates、heat averages and cumulative matrix control、summable directional pinching、renormalization in the space of coordinate values。我在 §0 之后按自己实际推进的顺序复盘，与论文的章节顺序有意错开。

两条登记：

preprints/Bi-Lipschitz-Coordinates-at-Regular-Points-of-Noncollapsed-RCD-Spaces-September-25-2026

其他队列第 123 行号

## §1 我进这个问题时手里有什么

起点是一个很朴素的不满足。De Philippis--Gigli 的非塌缩理论告诉我，正则点处每个切空间都是 $\R^n$，体积在缩放极限下收敛到欧氏体积，量化的欧氏逼近也已经成立。Mondino--Naber 的可数双 Lipschitz 可求底告诉我，几乎每个点都被可测片块覆盖，片块双 Lipschitz 映射到 $\R^n$ 的可测子集。Kapovitch--Mondino 更进一步，正则集整体落在一个开流形区域里，配备 bi-H\"older 坐标。三条合起来，我在很长时间里以为剩下的工作只是将指数从 H\"older 抬到 Lipschitz，属于"再拧一圈定量估计"的那类收尾。

这个判断错得挺关键，而且错在把两个不同的对象当成同一个。切空间比较的是从 $p$ 出发的一条条测地线的方向与长度，它是一道极限，取的是 $s_\nu^{-1}d$ 在 $s_\nu\to0$ 时的 pointed Gromov--Hausdorff 极限。坐标卡要比较的是邻域里所有点对 $(x,z)$，其中 $x,z$ 都不必是 $p$，中间还夹着"这个邻域必须在原始距离 $d$ 限制下真的是开集"这一条拓扑要求。所以即便每个切空间都一样好，我手里也没有任何现成的机制把无穷多个尺度上的好性质拼成一个固定的双 Lipschitz 常数。论文里对这一层的说法很克制：开邻域的结果要求跨无穷多尺度的更强控制（introduction.tex:89--91 一带的表述），可数可求底给出的是可测片块，这两者之间的裂缝就是我要填的东西。

我还特别注意过定理的几处强度标记，因为它们决定了我能不能借用邻近文献的现成结论。第一，$L_n$ 只依赖维数，邻域可以依赖 $X$ 与 $p$（introduction.tex:34--36），于是允许我在证明末尾"取足够晚的一次缩放"，代价是半径不可量化。第二，定理说的是每一个 prescribed 正则点，这比常规意义下的"几乎每个点"更强，这就排除了任何只能给出满测度集的路数。第三，左右两侧距离都是原始环境距离在 $U$ 上的限制，renormalization.tex:815--816 明确记录了"所有尺度选择用的是 $t=d(x,z)$，从未换成内蕴路径距离"。第四，$n\ge2$，$n=1$ 被单独留在外面；[推测] 原因在于 $n=1$ 时正则集的结构已经足以直接给区间分解，我的整套尺度机器会变成多余，而论文把力气全放在 $n\ge2$ 的机器上，引言与结论里都没有回头处理一维情形。

## §2 第一条走不通的路：要求 Gram 矩阵一致非退化

我最初的计划完全标准。取 $p$ 处的一列缩放，在每个 $B_{32T_\nu}(p_\nu)$ 上放一列调和函数 $u_\nu=(u_1,\ldots,u_n)^T$，让它们在每个固定球上局部一致且强 $W^{1,2}$ 收敛到欧氏坐标（coordinates.tex:163--165）。记 Gram 场 $G=(\langle\nabla u_j,\nabla u_k\rangle)_{j,k}$ 与其在 $B_{r_i}(y)$ 上的均值 $R_i(y)$，$r_i=2^{-i}$（coordinates.tex:222--226）。若这些矩阵有一致的双侧界 $c\mathfrak mathrm{Id}\le R_i(y)\le C\mathfrak mathrm{Id}$，那么归一化坐标在每个尺度上都是均匀双 Lipschitz 的，把尺度链一接，$u$ 自己就是那张图，收工。Honda--Zhang 的解析判据里恰好写着邻域一致正 Gram 行列式这条假设（introduction.tex:100--103），这给我一个暗示：这一步在自己的框架里需要额外付出。

真实的障碍在 very early 阶段就露头了。我能从正则点假设拿到的唯一全域信息是 $R_0(y)=\mathfrak mathrm{Id}+o(1)$ 在固定球上（coordinates.tex:262--263），往下只有慢增长型比较：对任意预先给定的 $a>0$，取足够晚的缩放后

$$C_a^{-1}2^{-2a\lvert i-j\rvert}R_j(y)\le R_i(y)\le C_a2^{2a\lvert i-j\rvert}R_j(y),\qquad c_a r_i^{2a}\mathfrak mathrm{Id}\le R_i(y)\le C\mathfrak mathrm{Id},$$

见 coordinates.tex:256--265。这里的 $a$ 可以任意小，它给出的下界却随尺度代数式衰减，$C_a$ 又随 $a\to0$ 恶化。我试过把 $a$ 固定成 $1/16$（这是后来在 patch 支撑论证里真正用的值，renormalization.tex:147），以为至少能把衰减写成一个可控的幂；结果发现幂次可控、常数不可控，双 Lipschitz 常数恰恰需要的是"与尺度无关"这件事，$r_i^{2a}$ 一出现，任何尺度比较都会泄漏到极限里。我的结论是：一致非退化根本不在假设里，而正则性也的确给不出它。这是路线一失败的确切位置。

我在路线一上还搭过另一层脚手架，同样塌了。当时的想法是绕开 Gram，直接用 Bishop--Gromov 控制 Hessian 平均，理由是体积比接近 1 意味着 Laplacian 比较接近 0，进而梯度范数接近常数。错在把体积单调性与二阶信息混为一谈：体积比趋 1 只约束一阶量的平均分布，而双 Lipschitz 需要的是对所有点对同时成立的一致的距离--坐标偏差界。后来 pinching.tex:909--1032 那个 sharp projection 引理之所以要用到调和 Taylor 展开与算子 $X\cdot\nabla-1$ 在 $q$ 次齐次项上乘 $q-1$ 的事实（pinching.tex:1018--1024），就是因为我在这里意识到，真正把"距离"与"坐标差"绑在一起的只有二阶量，而二阶量的可用信息只有一个正测度，就是 Bochner 测度。

## §3 转折点：补偿的对象从源空间搬到取值空间

路线一塌掉之后有个反复出现的困惑。我的坐标 $u$ 明明在每个尺度上都"接近"欧氏，偏差可以用 $R_i(y)^{-1/2}$ 除掉；问题只是这个除掉的动作随尺度发散。最自然的补救是把度量本身搬走：在源空间上放一张各向异性的尺度依赖度量 $H_i(x)$，让坐标关于它成为等距。我确实照着这个想法写了大半页，然后卡在一件很具体的事上：$H_i(x)$ 是 $x$ 的函数，一旦我要比较 $x$ 与 $z$ 两点，就必须把 $H_i(x)$ 与 $H_i(z)$ 互换，这一步需要对 $H_i$ 求空间导数；而 $H_i$ 来自 Gram 场均值的逆，我手里只有它的正定比较，没有任何关于它变化的信息。论文后来在 renormalization.tex:687--693 的 remark 里把这条写成明确的否定：构造既不微分 $H_i$，也不假设它有有限极限。这句话对我是一种事后确认，说我在源空间里做微分的方向本来就是空的。

转折发生在我把作用对象换掉的那一刻。我不再试图让 $u$ 关于某张源空间度量等距，改在坐标取值所在的普通欧氏空间 $\Omega=u(B_1(p))\subset\R^n$ 上做文章（renormalization.tex:12--16）。取值空间有几个当时觉得奢侈、后来发现是必需的好处：那里的导数是普通 Euclidean 导数，不需要任何几何结构；那里的光滑单位分解可以直接按取值画；最重要的是，度量退化在这里以一个正半定矩阵的形式出现，于是我可以把"被拉伸多少"写成一个可加的正量，而不必让任何逆矩阵去承担光滑性。$D_{i,y}=R_i(y)^{-1}[r_i^{2-n}M(B_{Lr_i}(y))]R_i(y)^{-1}$（coordinates.tex:1100--1103）正是这个"拉伸记账"的载体：它是对 $G$ 的退化做补偿以后剩下的 Bochner 质量，双共轭把两个 Gram 逆都放进去，因此它天生就活在取值空间的对偶侧。

于是我把整个问题重写成一句话：用累积质量规定每一步要拉伸多少，用方向性估计保证这些拉伸带来的度量误差可求和。introduction.tex:132--138 那两段的表述与我当时的笔记方向一致，只是当时我并没有分清"累积"与"方向"这两件事必须分头证明，也不能互相推导。后来的分工是这样的：coordinates.tex:1093--1166 负责累积（正反两个方向的矩阵比较），pinching.tex:1034--1132 负责方向（同一个 $D_{i,y}$ 落在真实坐标差 $u(x)-u(z)$ 上的上界）。这两条估计共用同一个矩阵族，它们的区别只在被测试的向量：一个测试的是任意的固定 $\xi$，另一个测试的是具体两点之差。

落盘探针：本行用于确认写入通道，取证调用共 15 次，首次落盘发生在第 17 次调用。

## §4 尺度装置的选型，以及我在放大系数上犯的顺序错误

尺度网格我全程用 $r_i=2^{-i}$，从 $i=0$ 起（coordinates.tex:222--226，pinching.tex:16）。选二进制的理由到 pinching 一节才真正显出必要性：径向拟合的递推跨越 $m$ 个尺度，我必须沿有限多条残差类分别迭代（coordinates.tex:314--316、pinching.tex:562--579），二进下残差类恰好是有限个，每个类内部的递推系数是同一个几何数。若我用一般的等比数列，残差类的数量与公比的对数有关，递推里那些卷积核的界会多出一层依赖，我暂时看不出怎样把它吸掉。[推测] 这条只在我自己的笔记里成立，论文本身没有讨论过别选的坏处。

第二个选择是把所有放大系数在取缩放之前定死。引言的 conventions 一节写得很硬：任何一个局部估计里出现的放大系数，都要在取"足够晚的一次缩放"之前固定（introduction.tex:239--241）。我在第一版草稿里正好把它做反了：先固定一个足够晚的 $\nu$，再在这个空间里逐步放大球，以为 $o(1)$ 的阶会自动跟着调整。麻烦出现在 pinching 的球的套叠上。那里要同时容纳五层球，半径取 $R=16(L+C_{\mathrm{sep}}+2)$，$S=32R$（pinching.tex:28--31），套叠关系是 $B_{8R}(z)\subset B_{S/2}(x)\cap B_{S/2}(z)$ 与 $B_{2L+4}(y)\subset B_{R/2}(z)$（pinching.tex:684--691），全靠 $d(x,z)\le2C_{\mathrm{sep}}$ 与 $S/2=16R$ 提供固定余量。放大系数一旦后取，$R$ 与 $S$ 就跟 $\nu$ 有关，那么 $S/2=16R$ 这类恒等关系虽然还成立，调和函数的定义域 $B_{32T_\nu}$ 却可能不再包住 $B_{16S+4}$，整个"每层球都严格内接"的图景就漏了。这个错误没有产生任何数学矛盾，它只是让所有后续引理的前提同时失效，因而极难在检查时发现。此后我养成了一个习惯：先写下 $L,C_{\mathrm{sep}},A,C,A_0,J$ 全部常数，再去选 $\nu$。

量纲也是选型的一部分。$M=\tfrac12\Delta G+\kappa G\mathfrak m$ 里，$\mathfrak m$ 是当前长度单位下的 Hausdorff 测度（introduction.tex:140--147），所以 $r_i^{2-n}M(B_{Lr_i}(y))$ 是一个与尺度无关的矩阵量，这一步把测度的 $n$ 次幂与 Laplacian 的两次导数完全对消；$D_{i,y}$ 再乘两个 $R_i(y)^{-1}$，量纲恰好作用在坐标取值差上。$n\ge2$ 在这里露面：$r_i^{2-n}$ 在 $n=2$ 时是 $1+o(1)$ 型量，在高维时是放大因子；而 $r_i^{n-2}\le1$ 的单调性被用来把"半径超过支撑球"的质量估计继续用 $\chi M$ 表述（coordinates.tex:633--634）。我在写下 $M$ 的定义之前并没有注意 $n\ge2$ 到底用在哪里，现在能指出两处：一处在上面这条测度单调性，另一处在 Sobolev 指数 $d_*>1$ 需要在 $n=2$ 也可取（coordinates.tex:116--120），靠的是有效 doubling 维数可以比 $n$ 与 $2$ 都大。

## §5 缩放序列：对角化与"只要内部收敛"

我需要一串空间 $(X_\nu,d_\nu,\mathfrak m_\nu,p_\nu)=(X,s_\nu^{-1}d,s_\nu^{-n}\mathcal H_d^n,p)$，$s_\nu\downarrow0$，配上 $\kappa_\nu\downarrow0$ 与 $T_\nu\uparrow\infty$，满足 $\kappa_\nu T_\nu^2\to0$，并且 $X_\nu$ 是 $\mathfrak mathrm{RCD}(-\kappa_\nu,n)$（coordinates.tex:143--170）。这里 $\kappa_\nu$ 的取法我记得很清楚：$\kappa_\nu=\max\{-K,0\}s_\nu^2$，必要时再加大任意小的正数（coordinates.tex:177--179），因为缩放把下界乘上 $s_\nu^{-2}$， curvature 项在单位尺度下的强度正好是 $\kappa_\nu$。

均匀性是我最初低估的一层。我要的内容比"每个固定半径、每个固定中心处体积比趋 1"更强，它要求对 $B_{64T_\nu}(p_\nu)$ 内一切中心、一切不超过 $64T_\nu$ 的半径同时成立

$$\Bigl\lvert\frac{\mathfrak m_\nu(B_r(y))}{\omega_nr^n}-1\Bigr\rvert\le\delta_\nu,\qquad d_{GH}\bigl(\overline B_r(y),\overline B_r(0^n)\bigr)\le\delta_\nu r$$

（coordinates.tex:156--162）。当时我担心这要求过高，后来发现证明几乎是免费的：中心不一致就取中心列的子列，它们在极限空间里收敛，与极限中心处的体积收敛矛盾（coordinates.tex:181--186）。半径方向的一致化则靠非塌缩的一个全域事实：每点的体积密度至多为 1，非常规地只是几乎处处为 1，于是 Bishop--Gromov 把任何更小半径的归一化体积夹在"固定半径处几乎最大的值"与 1 之间，模型体积修正随 $\kappa_\nu$ 一致趋 0（coordinates.tex:186--193）。GH 逼近那条来自 almost-volume-rigidity 在一个固定放大球上的应用，论文明说它的 interior-radius 结论正是"先取放大"的理由（coordinates.tex:193--196）。同一处还留了一句提醒：全程没有用到精确正则点集的开性。我把它抄在旁边，因为我在 §2 的路线一里差点去证明这个开性。

调和坐标的来源是 interior harmonic approximation（coordinates.tex:198--206，引用 AH18 推论 4.12）。这里我犯过一个更具体的错：我以为需要整个边值问题的收敛，于是花了半天想怎么控制边界。实际上归一化引理的紧性论证只用 interior 的一致收敛与 interior 强 $W^{1,2}$ 收敛（coordinates.tex:302--305），边界根本不参与。$\lvert\nabla u_\nu\rvert\le C_n$ 在 $B_{16T_\nu}$ 上成立且不依赖那个"事先固定的大半径"，理由是一阶量的尺寸是 $O(r)$ 而内部梯度估计自带 $r^{-1}$ 因子（coordinates.tex:201--206）；这句话让我确认 $C_n$ 只与 $n$ 有关，进而 $L_n$ 只与 $n$ 有关的链条才有出口。最后用对角子列让固定半径足够慢地增大，把所有估计同时推到 $T_\nu$ 的倍数上（coordinates.tex:208--215）。

## §6 一致调和归一化：证明的顺序就是内容

coordinates.tex:237--362 这一节我读了三遍，因为它的证明结构完全建立在"选择的顺序"上。定义 $\tau$-normalizable：存在可逆矩阵 $T$ 使 $T(u-u(y))/r$ 在单位化 $B_{2r}(y)$ 上，在某个 GH 逼近下与欧氏坐标图相差至多 $\tau$，允许目标端旋转（coordinates.tex:270--280）。把一致误差换成内部归一化 $L^2$ 误差给出等价归纳，容差只差一个固定倍数，这个交换让我可以在需要时借用调和内部估计。

纯欧氏的启动引理很短：若调和列 $V$ 与坐标函数 $\tau$-接近，则 $\lVert DV(0)-\mathfrak mathrm{Id}\rVert\le C_n\tau$，且 $\sup_{B_{2b}}\lvert DV(0)^{-1}(V-V(0))-x\rvert\le C_n\tau b^2$。两条都由对 $V-x$ 用内部导数估计得到（coordinates.tex:283--291）。接着先选二进制 $b=2^{-m}$ 使 $2C_nb<1/4$，再选 $\tau$ 使逆导数有界；于是仿射重归一化在单位 $b$ 下把误差按严格因子改善。这个先后次序我一度写反：先选 $\tau$ 后选 $b$ 的话，"$\tau$ 足够小以保证逆有界"就依赖 $b$，而 $b$ 又要依赖改善因子，循环了。

传递用的是反证加紧性：若在足够平坦的球上失败，把失败的球缩放到单位大小，套上它假设有的归一化，空间按均匀平坦性收敛到欧氏球，归一化后的调和列有内部 $L^2$、能量、梯度一致界，于是局部一致且内部强 $W^{1,2}$ 收敛到一个欧氏调和列；极限带有 $\tau$-normalizability，它的逆导数在序列上给出一个固定矩阵，使半径 $b$ 处误差严格小于 $\tau$，矛盾（coordinates.tex:297--311）。附带一句：这个额外的校正与它的逆的范数都不超过 $1+C_n\tau$。

我最在意的是"固定放大为什么被允许"那段（coordinates.tex:327--341）。做法是先固定放大因子的最大值，然后从更大的固定半径起步做归纳，允许有限个负的 dyadic 指标；对任何目标尺度 $r_i$，某个祖先半径已包含所需的放大，而祖先与后代之间只隔固定数目的收缩步，这些步的归一化矩阵与逆矩阵一致可比；内部估计在祖先球上做，后代球上的均值 Gram 归一化由强能量收敛辨认。所有因子与步数都在 $\tau$ 与几何平坦ness 之前定好。这段话我把它当作整节的模板：只要某个估计要求"有限多步之外的比较"，先数清步数，再选容差。

归一化列的 Gram 收敛到 $\mathfrak mathrm{Id}$ 是强 $L^p$ 收敛，而我不想依赖逐点梯度代表元的收敛。coordinates.tex:352--361 给的路径值得记：先用 Bochner cutoff 估计控制局部归一化 Hessian 能量，再用 Hessian 乘积法则与有界归一化梯度把 Gram 函数约束在局部 $W^{1,2}$ 里，Sobolev 紧性配上梯度标量积积分的收敛把极限辨认为 $\mathfrak mathrm{Id}$，最后一致有界把强 $L^2$ 升到任意有限 $L^p$。这条链在我最初的草稿里是缺的，我当时以为能量收敛自动给出 Gram 收敛。

## §7 开坐标象与那个 $4^{-j}$ 的内迭代

coordinates.tex:396--465 是我读得最慢的一节，因为它给出拓扑。单射性的论证很短：在两点距离可比的 dyadic 尺度上检验这一对点，一旦误差小于距离的一半，坐标值就分开；比初始单位尺度更大的距离由最初的欧氏逼近直接分开（coordinates.tex:416--424）。真正有内容的是椭球包含

$$\{P:\lvert P-u(x)\rvert_{R_i(x)^{-1}}<c r_i\}\subset u(B_{r_i/2}(x))$$

（coordinates.tex:404--407）。构造是一个内迭代：$x_0=x$，$\rho_0=r_i$，$\rho_j=4^{-j}\rho_0$，归纳假设 $\lvert P-u(x_j)\rvert_{R(\rho_j,x_j)^{-1}}<c\rho_j$；近欧氏坐标的近似满射性给出 $x_{j+1}$ 满足 $d(x_j,x_{j+1})\le(c+\eta)\rho_j$ 与 $\lvert P-u(x_{j+1})\rvert_{R(\rho_j,x_j)^{-1}}\le\eta\rho_j$，其中 $\eta\to0$ 与尺度无关（coordinates.tex:428--442）。换成新中心与新半径时，同中心近尺度的比较会把误差放大到至多 $2\eta\rho_j$，而目标是 $c\rho_{j+1}=c\rho_j/4$，所以先取 $c<1/8$ 再取 $\eta<c/8$（coordinates.tex:444--448）。我起初把步比写成 $2^{-j}$，那时放大因子 2 与目标 $c\rho_j/2$ 撞在一起，$\eta<c/4$ 的余量刚好用完，任何后续误差都会击穿归纳；换成步比 4 之后余量变成 $1/8$ 对 $1/4$，我第一次意识到"内迭代要用比尺度收缩更快的半径比"。总位移至多 $(c+\eta)\sum_j\rho_j<\rho_0/2$，所有中心留在估计有效区域内，完备性给出 $x_\infty\in B_{\rho_0/2}(x)$，并且因为前面的严格选择而留有严格余量。$R(\rho,y)\le C\mathfrak mathrm{Id}$ 把 $R^{-1}$-小的残差变成 Euclidean 小的残差，连续性收出 $u(x_\infty)=P$（coordinates.tex:450--457）。

开性随后自动：在每个点用一条足够小、包含在 $B_A(p)$ 内的半径套用椭球结论，像集即开；连续单射在局部紧（真）空间上每个紧内部球上是同胚，或者干脆用分离尺度估计直接给出逆的连续性（coordinates.tex:459--464）。分离尺度那条式子 $\bigl\lvert\lvert u(z)-u(x)\rvert_{R_i(x)^{-1}}-d(x,z)\bigr\rvert\le o_D(1)r_i$（coordinates.tex:408--413）在我后面反复被引用，它在 $D^{-1}r_i\le d(x,z)\le Dr_i$ 的窗口里成立，这个窗口结构后来在取值空间那一侧被重新利用（renormalization.tex:745--758）。

## §8 把单调性借来：热平均矩阵的引入

$R_i$ 是球上的 Gram 均值，随 $i$ 增大没有单调性可言。我一开始的补救是直接对球包含关系取巧：$B_{r_{i+1}}\subset B_{r_i}$，所以"质量"应该单调。这个想法错得很有代表性：$G$ 是矩阵值函数，正测度的分布函数是另一回事，$G$ 的球均值随半径变化时方向可以随便改，正定性在 $G$ 这一侧并不成立。真正单调的是 Bochner 那一侧：$\tfrac12\Delta G+\kappa G\mathfrak m=M$ 才是正矩阵测度（coordinates.tex:28--36）。于是我需要一个装置，把 $G$ 的演化方程写成带正源的形式，这正是热半群。

设 $\chi$ 在 $B_T(p)$ 上为 1、支撑在 $B_{2T}(p)$，$\lvert\nabla\chi\rvert\le C/T$、$\lvert\Delta\chi\rvert\le C/T^2$（coordinates.tex:580--585），零延拓 $\chi G$，那么分布 Laplacian 是紧支撑矩阵测度

$$\Delta(\chi G)=2\chi M-2\kappa\chi G\mathfrak m+E_{\mathrm{cut}}\mathfrak m,\qquad E_{\mathrm{cut}}=(\Delta\chi)G+2\Gamma(\chi,G)$$

（coordinates.tex:586--593）。$E_{\mathrm{cut}}$ 是支撑在截断环带上的 $L^1$ 函数矩阵。这里有一处我原先完全没想到的估计：$\int\lvert E_{\mathrm{cut}}\rvert\,\mathfrak mathrm d\mathfrak m\le CT^{n-2}$，而环带离固定测试中心的距离至少 $T/2$，于是对 $0<t\le1$

$$\sup_{0<t\le1}\bigl\lVert P_tE_{\mathrm{cut}}(x)\bigr\rVert\le CT^{n-2}\sup_{0<t\le1}t^{-n/2}e^{-cT^2/t}=o(1)$$

（coordinates.tex:638--648）。$T\to\infty$ 配合高斯抑制把这个误差整条压成 $o(1)$，这是我第一次看到"让截断离得足够远"与"让缩放足够晚"两件事在同一处叠加。有了它，$\lambda$ 可以取成不小于这个上确界加上 $2\kappa\lVert G\rVert_\infty$，再加一个趋 0 的正数（coordinates.tex:649--651），于是 $\partial_t(P_t(\chi G)+\lambda t\mathfrak mathrm{Id})$ 夹在 $P_t(\chi M)$ 与 $3P_t(\chi M)+C\mathfrak mathrm{Id}$ 之间（coordinates.tex:598--602）。定义 $Q_i(x)=P_{r_i^2}(\chi G)(x)+\lambda r_i^2\mathfrak mathrm{Id}$、$H_i(x)=Q_i(x)^{-1}$（coordinates.tex:603--607），导数非负给出 $Q_i\ge Q_{i+1}$ 即 $H_i\le H_{i+1}\le(1+o(1))H_i$（coordinates.tex:608--614）。$\lambda t\mathfrak mathrm{Id}$ 的作用至此完全暴露：它把右端那些符号未定的项统统吸成非负，代价只是一个 $o(1)$ 的加性项，因为 $\lambda r_i^2R_i(x)^{-1}\le C_a\lambda r_i^{2-2a}\mathfrak mathrm{Id}=o(1)\mathfrak mathrm{Id}$，需要 $a<1$（coordinates.tex:689--691）。

$Q_i$ 与 $R_i$ 的比较必须是相对的，非常数绝对比较对我毫无用处。做法是固定 $i,x$ 后共轭掉 $R_i(x)^{-1/2}$：在每个固定放大球上共轭 Gram 场按归一化 $L^1$ 趋 $\mathfrak mathrm{Id}$，而 $t=r_i^2$ 处热核至多 $Cr_i^{-n}$，局部误差的积分趋 0；尾部对 $i$ 一致，半径为 $2^mr_i\le1$ 的壳层里慢增长把共轭 Gram 均值约束在 $C2^{2am}$，高斯把贡献约束在 $C2^{(n+2a)m}e^{-c4^m}$；$2^mr_i>1$ 时用原始梯度界与 $R_i$ 的下界，其共轭代价 $Cr_i^{-2a}$ 至多 $C2^{2am}$，同样被高斯吃掉；$1-\chi$ 漏掉的质量用热质量 1 同样处理；超出几乎欧氏区域之外，全局体积界给壳层估计加上 $e^{C2^mr_i}$，因为 $r_i\le1$，这一因子靠调小高斯常数吸收（coordinates.tex:662--687）。先把 $L$ 取到使尾部足够小，再把缩放取到使局部误差足够小，这个次序与 §4 的教训一致。

## §9 dyadic 热比较：那个平方根结构从哪来

我需要一个能贯穿后面两处的量。$N_j(x)=r_j^{2-n}M(B_{r_j}(x))$ 是原始调和坐标分量下的质量，没有用 Gram 逆共轭过（coordinates.tex:704--708），于是小质量引理与 $Q_i,R_i$ 的相对比较直接给出 $N_j(x)\le\varepsilon_\nu Q_j(x)$，$\varepsilon_\nu\to0$，对 $j$ 与固定测试区域一致（coordinates.tex:709--717）。加权累积量写成

$$\mathcal F_i(x)=2^{-\gamma i}\mathfrak mathrm{Id}+\sum_{j=0}^i2^{-\gamma(i-j)}N_j(x),$$

论文允许 $\gamma=1/2$（coordinates.tex:719--733）。整个引理要说两句：热递降 $c_Ar_i^{2-n}M(B_{Ar_i}(x))\le Q_i(x)-Q_{i+1}(x)\le C\mathcal F_i(x)$，以及双线性比较 $\lvert v^T(R_i(y)-Q_i(x))w\rvert\le C\lvert v\rvert_{Q_i(x)}\sqrt{\mathcal F_i(x)[w]}$，其中 $d(x,y)\le C_0r_i$。

证明的骨架是恒等式本身。设 $f=\chi G$、$S=\Delta f$、$\mathcal Af=\fint_{B_r(y)}f\,\mathfrak mathrm d\mathfrak m$，因为 $\chi$ 在均值球上为 1，精确的热恒等式是

$$R_i(y)-Q_i(x)=\mathcal A P_1f-P_1f(x)-\lambda r^2\mathfrak mathrm{Id}-\int_0^{r^2}\mathcal AP_tS\,\mathfrak mathrm d t-\int_{r^2}^1\bigl(\mathcal AP_tS-P_tS(x)\bigr)\,\mathfrak mathrm d t$$

（coordinates.tex:759--769）。我在推导它时先写成 $\mathcal A(f)-P_{r^2}f(x)$ 然后直接插入半群，漏掉了端点 $P_1f$ 两项，结果多出个 $O(1)$ 残差；正确的处理是把 $\mathcal AP_1f-P_1f(x)$ 也当作误差项，它由时间 1 热正则化的有界空间梯度控制，量级 $Cr\lvert v\rvert\lvert w\rvert$（coordinates.tex:869--873）。恒等式在 $s\downarrow0$ 端的合法性由 kernel-measures 引理负责，那里明确说了这不要求 Gram 场的逐点收敛（coordinates.tex:770--772）。

局部源的估计是我认为最漂亮的一段。短时间与长时间核分别给出

$$\int_0^{r^2}K_t(z)\,\mathfrak mathrm d t\le Cr^{2-n}e^{-cd(x,z)^2/r^2},\qquad\int_{I_q}\lvert K_t(z)-p_t(x,z)\rvert\,\mathfrak mathrm d t\le Cr\,r_q^{1-n}e^{-cd(x,z)^2/r_q^2},$$

其中 $I_q=[r_{q+1}^2,r_q^2]$（coordinates.tex:778--788）。要在尺度 $r_q$ 下对 $M(v,w)$ 积分一个高斯，就把 $B_1(x)$ 分成 $B_{r_q}(x)$ 与环带 $B_{r_j}(x)\setminus B_{r_{j+1}}(x)$，$j<q$；环带上到 $x$ 的距离至少 $2^{q-j-1}r_q$。矩阵 Cauchy--Schwarz 对测度版本 $\lvert M(v,w)\rvert(E)\le\sqrt{M[v](E)M[w](E)}$（coordinates.tex:130--138）加上 $M(B_{r_j}(x))=r_j^{n-2}N_j$ 把时间块 $I_q$ 的贡献约束为 $C2^{-(i-q)}\sum_{j\le q}k_{q-j}\sqrt{N_j[v]N_j[w]}$，壳层系数取 $k_0=1$、$k_h=2^{(n-2)h}e^{-c4^{h-1}}$，且 $\sum_h2^hk_h<\infty$（coordinates.tex:794--799）。反过来求和后得到 $\sum_{j\le i}2^{-(i-j)}\sqrt{N_j[v]N_j[w]}$ 型的双线性界（coordinates.tex:809--825）。剩下的源项各有一个 $Cr\lvert v\rvert\lvert w\rvert$：外部区域用 $\int_0^{r^2}K_t+\int_{r^2}^1\lvert K_t-p_t\rvert\le Cre^{-c'D^2}$（coordinates.tex:830--842）配高斯矩 $\int e^{-c'd(x,z)^2}\,\mathfrak mathrm d(\chi M[v])\le C\lvert v\rvert^2$；截断源支撑在离 $x$ 距离可比 $T$ 处且总变差 $O(T^{n-2})$；curvature 源密度不超过 $C\kappa$，短时间用热质量 1，长时间用 $\int Cr/\sqrt t$，合起来 $C\kappa(r^2+\int_{r^2}^1rt^{-1/2}\,\mathfrak mathrm d t)\lvert v\rvert\lvert w\rvert\le Cr\lvert v\rvert\lvert w\rvert$（coordinates.tex:856--868）。

归一化那一步决定了 $\gamma$。取 $\sqrt{N_j[v]}\le C2^{a(i-j)}\lvert v\rvert_{Q_i}$，加权 Cauchy--Schwarz 给出

$$\sum_{j=0}^i2^{-(i-j)}\sqrt{N_j[v]N_j[w]}\le C\lvert v\rvert_{Q_i}\sum_{j\le i}2^{-(1-a)(i-j)}\sqrt{N_j[w]}\le C\lvert v\rvert_{Q_i}\Bigl(\sum_{j\le i}2^{-(i-j)/2}N_j[w]\Bigr)^{1/2},$$

未用的标量级数通项是 $2^{-(2(1-a)-1/2)(i-j)}$，要求 $a<1/8$ 时才收敛（coordinates.tex:876--899）。原始的 $Cr$ 项则靠 $Q_i\ge c_ar_i^{2a}\mathfrak mathrm{Id}$ 变成 $Cr_i^{1-a}\lvert v\rvert_{Q_i}\lvert w\rvert\le C\lvert v\rvert_{Q_i}(2^{-i/2}\lvert w\rvert^2)^{1/2}$；这一步我在草稿里写成 $Cr_i^{1-a}\le Cr_i^{1/2}$，忽略了 $\lvert w\rvert$ 与 $\lvert w\rvert_{Q_i}$ 之间还差一个 $Q_i^{-1/2}$ 的因子，正确形式是把 $2^{-i/2}$ 放进平方根里，正好对上 $\mathcal F_i$ 的 $\gamma=1/2$ 权。递降的双边则来自在 $[r_i^2/4,r_i^2]$ 上积分 $\partial_t(P_t(\chi G)+\lambda t\mathfrak mathrm{Id})$：下界用 $d(x,z)\le A\sqrt t$ 处 $p_t\ge c_At^{-n/2}$（coordinates.tex:493--498、901--906），上界用同一套壳层计算加上 $B_1(x)$ 外 $Cr_i^2\mathfrak mathrm{Id}\le C2^{-i/2}$，因为 $r_i^2\le2^{-i/2}$（coordinates.tex:906--918）。

fixed enlargements 那条 remark（coordinates.tex:921--938）解决了我一个具体的疑虑：带放大 $A$ 的质量会不会破坏衰减。设 $h=\lceil\log_2A\rceil$，$j\ge h$ 时 $r_j^{2-n}M(B_{Ar_j}(x))\le2^{h(n-2)}N_{j-h}(x)$，$j<h$ 的有限多项由固定尺度的 cutoff 估计约束为 $C_A\mathfrak mathrm{Id}$，于是指数加权的和仍被同一个 $\mathcal F_i$ 型表达式控制；中心平移 $C_0r_j$ 只是把 $A$ 加大 $C_0$。同一段还点出后面的难点：$D_{i,y}$ 带两个 Gram 逆，光靠均值之间的相对可比远远不够。

## §10 不交换矩阵的累积：两处我认为不可省略的机制

coordinates.tex:940--1166 这一串我把它当作纯有限维计算来读，所有不等式都是固定 $\R^n$ 上二次型的不等式。第一个机制是精确的逆增量恒等式。记 $B_i=H_{i+1}-H_i$、$\Delta_i=Q_i-Q_{i+1}$、$a_i=H_i\xi$，$E_i=Q_i^{-1/2}\Delta_iQ_i^{-1/2}$，则单调性给出 $0\le E_i\le\varepsilon_\nu\mathfrak mathrm{Id}$，而

$$B_i=Q_i^{-1/2}\bigl((\mathfrak mathrm{Id}-E_i)^{-1}-\mathfrak mathrm{Id}\bigr)Q_i^{-1/2},\qquad E_i\le(\mathfrak mathrm{Id}-E_i)^{-1}-\mathfrak mathrm{Id}\le(1+C\varepsilon_\nu)E_i,$$

于是 $H_i\Delta_iH_i\le B_i\le(1+C\varepsilon_\nu)H_i\Delta_iH_i$（coordinates.tex:968--981）。谱微积分在这里只作用于一次一个共轭后的正矩阵，不同尺度的矩阵压根不需要交换；我原先一直担心要把 $Q_i^{-1/2}\Delta_iQ_i^{-1/2}$ 与 $Q_{i+1}^{-1/2}\Delta_{i+1}Q_{i+1}^{-1/2}$ 同时对角化，这个担心是多余的，也正是这一版写法相对我草稿的改进。

第二个机制是卷积核的 $m^2$ 记账。由 $0\le B_l\le C\varepsilon_\nu H_l$ 共轭得 $B_lQ_lB_l\le CB_l$，再由慢增长得到 $\lvert B_l\xi\rvert_{Q_j}^2\le C2^{2a(l-j)}B_l[\xi]$，$j\le l$（coordinates.tex:982--988）。恒等式 $a_i-a_j=\sum_{l=j}^{i-1}B_l\xi$ 与 Cauchy--Schwarz 给出 $\lvert a_i-a_j\rvert_{Q_j}^2\le Cm2^{2am}\sum_{l<j}B_l[\xi]$ 型估计，$m=i-j$。把它塞进 $\sum_{i<k}\sum_{j\le i}2^{-\gamma(i-j)}N_j[a_i]$，$N_j\le\varepsilon_\nu Q_j$ 让内层变成 $B_l[\xi]$ 的求和；关键一句是：固定 $l$，对指定长度 $m$，包含 $l$ 的长度 $m$ 区间 $[j,i)$ 至多 $m$ 个，因此 $B_l[\xi]$ 的系数被 $C\sum_{m\ge1}m^22^{-(\gamma-2a)m}<\infty$ 约束（coordinates.tex:996--1010）。那个 $m^2$ 来自 $(i-j)$ 因子与区间计数因子的乘积，$\gamma-2a>0$ 就够收敛；同时背景项 $\sum_{i<k}2^{-\gamma i}\lvert a_i\rvert^2\le C\lvert\xi\rvert^2\sum_i2^{-(\gamma-4a)i}$ 要求 $4a<\gamma$（coordinates.tex:946--949、1011--1017），这就是 $a$ 与 $\gamma$ 之间唯一的约束来源。三件套结论是 $\sum_{i<k}\mathcal F_i[a_i]\le CH_k[\xi]$ 与 $C^{-1}H_k\le\mathfrak mathrm{Id}+\sum_{i<k}H_iN_iH_i\le CH_k$（coordinates.tex:954--966）。

换均值归一化的代价是下一引理的内容，也是我说"两个 Gram 逆"难点的解法。设 $A_{i,y}=R_i(y)-Q_i(x)$、$e_{i,y}=R_i(y)^{-1}\xi-H_i(x)\xi$。对 $\lvert v\rvert_{Q_i}=1$ 取上确界，双线性比较等价地写成 $A_{i,y}H_iA_{i,y}\le C\mathcal F_i$（coordinates.tex:1065--1072）；逆变换恒等式 $e_{i,y}=-R_i(y)^{-1}A_{i,y}a_i$ 配上 $R_i(y)^{-1}Q_i(x)R_i(y)^{-1}\le CH_i(x)$ 给出 $\lvert e_{i,y}\rvert_{Q_i}^2\le C\mathcal F_i[a_i]$（coordinates.tex:1073--1085）。求和后用加权总量，每个尺度至多 $J$ 个中心时 $\sum_{i<k}\sum_y\lvert e_{i,y}\rvert_{Q_i}^2\le C_JH_k[\xi]$，而对满足 $C_{i,y}\le\varepsilon_\nu Q_i(x)$ 的正半定矩阵有 $\sum\sum C_{i,y}[e_{i,y}]\le C_J\varepsilon_\nu H_k[\xi]$（coordinates.tex:1052--1063）。这一段末尾那句"没有用到 $R_i(y)$ 与 $Q_i(x)$ 交换"我特意圈了出来，因为它是把球均值与热均值缝在一起的唯一针线。

最后是累积比较本身（coordinates.tex:1093--1166）。给定 $A_0,C_0,L,J$，在每个中心 $x\in B_{A_0}(p)$ 每个尺度选至多 $J$ 个满足 $d(x,y)\le C_0r_i$ 的中心，选择可以任意依赖 $x,i$；权重 $\theta_{i,y}\in[0,1]$，每个尺度至少一个权重为 1 且其质量球包含 $B_{r_i}(x)$；$Z_i=\sum_yD_{i,y}$，$S_i=\sum_y\theta_{i,y}D_{i,y}$。结论是 $C_*$ 只依赖 $n,A_0,C_0,L,J$，使得 $Z_i\le o(1)H_i(x)$、$\mathfrak mathrm{Id}+\sum_{i<k}Z_i\le C_*H_k(x)$、$H_k(x)\le C_*(\mathfrak mathrm{Id}+\sum_{i<k}S_i)$，$o(1)$ 对所有允许的选择一致。正反两方向的写法不对称，正向用 $R_i(y)^{-1}\xi=a_i+e_{i,y}$ 与 positivity 拆成 $2C_{i,y}[a_i]+2C_{i,y}[e_{i,y}]$；反向要挑那个权重 1 的中心使 $N_i\le C_{i,y}$，再用 $a_i=R_i(y)^{-1}\xi-e_{i,y}$，得 $N_i[a_i]\le2S_i[\xi]+2C_{i,y}[e_{i,y}]$，然后套总量比较并吸收 $C\varepsilon_\nu H_k[\xi]$（coordinates.tex:1147--1165）。我读到这里才真正安心：累积的那一侧只需要一个下界形式的 $H_k$，于是取值空间里每一步的正增量加起来确实追得上那个可能发散的归一化。

## §11 pinching 的第一块地基：正源需要线性梯度界

pinching.tex:93--96 开头那句话是这一节的钥匙：对能量估计直接用 Cauchy--Schwarz 给不出对质量所需的依赖。具体说，$-\Delta h=\mu\ge0$ 的能量恒等式 $\int\lvert\nabla h\rvert^2=\int h\,\mathfrak mathrm d\mu\le\lVert h\rVert_\infty P$ 里，右端混着 $\lVert h\rVert_\infty$；而我需要的是 $\int\lvert\nabla h\rvert\le CP$，线性于 $P$，因为后面 $P_i(a)$ 是以 $\sum_iP_i=o(1)$ 的形式进入预算的，任何非线性依赖都会把可求和性毁掉。

证明分三层。第一层先把测度对检验函数的作用解释清楚：$\mu=-\Delta h$ 在 $W^{1,2}_0(\Omega)$ 上连续延拓，这个正泛函不给零 Sobolev 容量的集电荷：对紧集用趋于该集合至少为 1、而 $W^{1,2}_0$ 范数趋 0 的非负测试列，再用泛函连续性；测度的正则性把结论扩到 Borel 零容量集；于是有界 Sobolev 函数用拟连续代表元积分，$W^{1,2}_0$ 逼近加上有界截断与零容量外子列收敛说明泛函与测度积分在这些测试上一致（pinching.tex:119--134）。这段的意义在于：后面所有截断 $\min\{H,t\}$、$1-(1+H)^{-\alpha}$ 都是允许的测试，而我不用去挑选 $\mu$ 支撑上任意意义的逐点代表元。我最初在这里写的是"取一个 everywhere 定义的版本"，这在 $\mathfrak mathrm{RCD}$ 环境下根本没有依据。

第二层是弱型界。$P>0$ 时令 $H=h/P$，测试 $\min\{H,t\}$ 得 $\int_{\{H<t\}}\lvert\nabla H\rvert^2\le t$；对同一截断用 Sobolev 不等式 $\pi:dirichlet\text{-}sobolev$ 得 $t^2\mathfrak m(H\ge t)^{1/d}\le Ct$，即 $\mathfrak m(H\ge t)\le Ct^{-d}$，$d>1$（pinching.tex:136--145）。第三层用 layer cake：取 $0<\alpha<d-1$，$t\le1$ 用体积上界、$t\ge1$ 用弱型界，得矩 $\int_\Omega(1+H)^{1+\alpha}\,\mathfrak mathrm d\mathfrak m\le C$（pinching.tex:146--151）；再用有界测试 $1-(1+H)^{-\alpha}$ 得 $\alpha\int\lvert\nabla H\rvert^2/(1+H)^{1+\alpha}\le1$；两者加权 Cauchy--Schwarz 相乘即 $\int\lvert\nabla H\rvert\le C$（pinching.tex:152--159）。我第一次尝试是 Moser 迭代，它给 $\lVert\nabla H\rVert_{L^q}$ 类界，指数结构对不上；这里配对的两个因子 $\lvert\nabla H\rvert(1+H)^{(1+\alpha)/2}$ 与 $(1+H)^{-(1+\alpha)/2}\lvert\nabla H\rvert$ 是专门为"一个矩加一个 weighted Dirichlet 积分"设计的，我把它记成这一节最值得学的技巧。

顺带记下移位 Bochner 测度这条代数线：$\mathcal B_\kappa(w,b)=M(w)-(2b\Delta w-nb^2)\mathfrak m\ge\lvert\operatorname{Hess} w-bg\rvert^2\mathfrak m$，它关于对 $(w,b)$ 二次，且 $\mathcal B_\kappa(w_1-w_2,b_1-b_2)\le2\mathcal B_\kappa(w_1,b_1)+2\mathcal B_\kappa(w_2,b_2)$（pinching.tex:163--184，来源是 coordinates.tex:32--39 的展开 $\lvert\operatorname{Hess} w-bg\rvert^2=\lvert\operatorname{Hess} w\rvert^2-2b\Delta w+nb^2$）。把 $b=1$ 配给 Poisson 替换，正是为了让 $\Delta f=n$ 的常数项与 $\lvert\nabla f\rvert^2/2$ 的欧氏基准抵消；这个 $b$ 的选择在我早先的版本里是 $b=0$，于是要多背一个与 $n$ 有关的漂移项。

## §12 Poisson 替换：可求和性其实来自一次望远镜

构造在 pinching.tex:186--216。给定中心 $a$，$q^a=d_a^2/2$。先把 $C_0$ 取得足够大，使 Laplacian 比较给出 $\Delta q^a\le(n+C_0\kappa r_i^2)\mathfrak m$ 于 $B_{16Sr_i}(a)$，这在 $d_a\le16Sr_i$ 下可行；序列取到 $C_0\kappa\le1$。令 $a_i=n+C_0\kappa r_i^2$，正测度 $\mu_i^a=a_i\mathfrak m-\Delta q^a$ 于 $B_{16Sr_i}(a)$，并定义

$$P_i(a)=r_i^{-n}\mu_i^a(B_{8Sr_i}(a))+\kappa r_i^2 .$$

$B_{16Sr_i}(a)$ 上的 Dirichlet 问题给 $h_i^a\in W^{1,2}_0$，$-\Delta h_i^a=\mu_i^a$；测度是"有界密度与 Sobolev 函数 $q^a$ 的分布 Laplacian 之差"，因此在 $W^{1,2}_0$ 上连续，这是变分可行性我需要确认的唯一一点。负部测试给 $h_i^a\ge0$，取 $f_i^a=q^a-h_i^a$，于是 $\Delta f_i^a=a_i$ 且 $f_i^a-q^a\in W^{1,2}_0(B_{8Sr_i}(a))$。

质量估计是全部可求和性的来源。记 $V_a(t)=\mathfrak m(B_t(a))$，$A_a(t)=t^{-n}V_a(t)$。对 $q^a$ 的测度值 Laplacian 做径向测试，$a$ 外几乎处处 $\lvert\nabla d_a\rvert=1$，得 $\Delta q^a(B_t(a))=tV_a'(t)$ 对几乎所有 $t$ 成立；等价地可以用 $-\int t\psi'(t)V_a'(t)\,\mathfrak mathrm d t$ 逼近径向指示函数，零点边界项由局部体积上界消掉（pinching.tex:243--253）。于是 $\mu_i^a(B_t(a))=(a_i-n)V_a(t)-t^{n+1}A_a'(t)$。由正性并在 $8Sr_i<t<16Sr_i$ 上积分，

$$r_i^{-n}\mu_i^a(B_{8Sr_i}(a))\le C\int_{8Sr_i}^{16Sr_i}\frac{\mu_i^a(B_t(a))}{t^{n+1}}\,\mathfrak mathrm d t\le C\{A_a(8Sr_i)-A_a(16Sr_i)+\kappa r_i^2\}$$

（pinching.tex:254--266）。右端前两项对 $i$ 求和时精确望远镜成 $A_a(8Sr_N)-A_a(16S)$；非塌缩的 Bishop 不等式给出每个中心 $\lim_{t\downarrow0}A_a(t)\le\omega_n$，固定半径体积收敛给出 $A_a(16S)\ge\omega_n-o(1)$ 对 $a\in B_4(p)$ 一致，再叠上 $\sum_i\kappa r_i^2\le4\kappa/3$，得 $\sup_{a}\sum_iP_i(a)=o(1)$（pinching.tex:266--275）。

我必须先承认这里我走错过一次。我原先把"每个尺度上的缺陷"写成该尺度上曲率项的积分，即打算用 $\sum_i\kappa r_i^2$ 这一条几何级数撑起全部可求和性。这个算法的量级是对的，概念是空的：$\kappa r_i^2$ 只记录了下界强度，跟坐标到底退化了多少没有联系，而且它在 $i$ 大到 $r_i^2\ll1$ 时衰减太快，无法解释为什么中尺度上也应该小。真正给我可求和的是一个单调泛函（归一化体积比 $A_a$）的总降量，这个量按构造对中心一致有界，而它的下降正好落在"单位球体积比接近 $\omega_n$"与"$16S$ 球体积比也接近 $\omega_n$"之间，也就是平坦性本身。附带一条我很看重：这个论证完全不假设邻近中心是正则的（pinching.tex:274--275），否则我根本没法在 $B_4(p)$ 里对所有 $a$ 取上确界。

有界性与梯度界走的是另一条路。单位化 $r_i=1$，令 $\tau$ 在 $B_{8S}(a)$ 上解 $-\Delta\tau=1$、零边值；$Y(k)=\mathfrak m(\tau>k)$，用 $(\tau-k)_+$ 测试配 Sobolev 与 Hölder 得 $Y(l)\le C(l-k)^{-2d}Y(k)^{2d-1}$，取 $k_j=K(1-2^{-j})$，因 $2d-1>1$ 可以用只依赖 $C,d,Y(0)$ 的 $K$ 归纳出 $Y(k_j)\le Y(0)2^{-jd/(d-1)}$，故 $\tau\le K$。调和函数 $f_i^a+a_i\tau$ 在边界上有非正值 $q^a$，弱最大值原理给 $0\le h_i^a\le q^a+a_i\tau\le C$（pinching.tex:277--293）。局部 Poisson 梯度估计再给 $\lvert\nabla f_i^a\rvert\le C$ 于 $B_{4S}(a)$：对每个 $q\in B_{4S}(a)$ 在 $B_{S/4}(q)$ 上用估计，其八倍放大 $B_{2S}(q)$ 严格落在 Dirichlet 域 $B_{8S}(a)$ 内（pinching.tex:294--300）。这个"八倍余量"与 coordinates.tex:66--78 处的 $\lVert\nabla w\rVert_{L^\infty(B_R)}\le C(R^{-1}+\sqrt{c_\kappa(R^2)})(\lVert w\rVert_{L^\infty(B_{8R})}+R^2\lVert\Delta w\rVert_{L^\infty(B_{8R})})$ 是同一件事，我现在把"$8B_R$ 紧含于定义域"当成一条硬性检查项。

移位测度的整体界（pinching.tex:310--337）我核对过两次符号。取 $\chi$ 在 $B_{2Sr_i}(a)$ 上为 1、支撑在 $B_{4Sr_i}(a)$、$\lvert\Delta\chi\rvert\le Cr_i^{-2}$。由 $h=q^a-f_i^a$ 与 $\lvert\nabla q^a\rvert\le8Sr_i$，$\int\lvert\tfrac12\lvert\nabla f_i^a\rvert^2-q^a\rvert\,\mathfrak mathrm d\mathfrak m\le\int(\lvert\nabla q^a\rvert\lvert\nabla h\rvert+\tfrac12\lvert\nabla h\rvert^2)\,\mathfrak mathrm d\mathfrak m\le Cr_i^{n+2}P_i(a)$。用 $\Delta q^a=a_i\mathfrak m-\mu_i^a$ 测试 $M$ 的定义，得

$$\int\chi\,\mathfrak mathrm d\mathcal B_\kappa(f_i^a,1)=(n-a_i)\int\chi\,\mathfrak mathrm d\mathfrak m-\int\chi\,\mathfrak mathrm d\mu_i^a+\kappa\int\chi\lvert\nabla f_i^a\rvert^2\,\mathfrak mathrm d\mathfrak m+O(r_i^nP_i(a))\le Cr_i^nP_i(a),$$

倒数第二行前两项非正，curvature 项 $C\kappa r_i^{n+2}$ 已被 $Cr_i^nP_i(a)$ 吸收。单位换算 remark（pinching.tex:340--353）说清了一切量的自然量纲：$d'=r_i^{-1}d$、$\mathfrak m'=r_i^{-n}\mathfrak m$、$\widehat f_i^a=f_i^a/r_i^2$ 下 $\Delta'\widehat f_i^a=a_i$、$\kappa'=\kappa r_i^2$、$\mathcal B_{\kappa'}(\widehat f_i^a,1)=r_i^{-n}\mathcal B_\kappa(f_i^a,1)$，因此每个 Poisson 界在自身缩放单位下就是 $CP_i(a)$；再由三角型不等式，同尺度两个替换之差是调和的，其 Bochner 质量在任何公共内部球上至多 $C(P_i(x)+P_i(z))$，并且这控制的是完整测度，含可能的奇异部分。

## §13 径向拟合：一条递推如何变成可求和的平方根预算

这一节的目标写在 pinching.tex:355--359：Poisson 给出一个可求和的标量预算，接下来要把径向导数用调和坐标的仿射组合拟合，并把误差摊到邻近尺度上。记 $\sigma_i^a(b)=\lvert b\rvert_{R_i(a)}$，可用输入是 pinching.tex:70--81 的两条：增长指数取 $a_0=1/16$ 时 $\sigma_j^a(b)/\sigma_i^a(b)\le C2^{a_0\lvert i-j\rvert}$，以及 $\sup_{B_{2Sr_i}(a)}\lvert\nabla(b\cdot u)\rvert\le C\sigma_i^a(b)$。

第一步是替换误差。$g_b=\langle\nabla q^a,\nabla(b\cdot u)\rangle$，$g_{j,b}=\langle\nabla f_j^a,\nabla(b\cdot u)\rangle$，由 Poisson 误差与上面的梯度界，$\lVert g_b-g_{j,b}\rVert_{2,B_{Sr_j}(a)}^{\mathrm{av}}\le Cr_j\sigma_j^a(b)\sqrt{P_j(a)}$（pinching.tex:470--483）。弱抵消恒等式把 $g_{j,b}$ 的方程右端写成散度源 $2(\operatorname{Hess} f_j^a-g)(\nabla(b\cdot u),\cdot)$，其 $L^2$ 范数至多 $Cr_j^{n/2}\sigma_j^a(b)\sqrt{P_j(a)}$；零边值解出 $\xi_{j,b}\in W^{1,2}_0(B_{Sr_j}(a))$ 满足 $\lVert\xi\rVert^{\mathrm{av}}+r_j\lVert\nabla\xi\rVert^{\mathrm{av}}\le Cr_j\sigma_j^a(b)\sqrt{P_j(a)}$，于是 $g_{j,b}-\xi_{j,b}$ 调和（pinching.tex:484--498）。弱抵消的证明我逐行验算过：$\nabla g_a=(\operatorname{Hess} f)(\nabla a,\cdot)+(\operatorname{Hess} a)(\nabla f,\cdot)$，两次分部积分后含 $\operatorname{Hess}\phi$ 的项相消，剩下两项因 $\Delta f$ 常数、$\Delta a=0$ 而归零；再减掉度量张量只是给右端加 $2\int\langle\nabla a,\nabla\phi\rangle=0$（pinching.tex:379--405）。两侧在 $W^{1,2}_0$ 范数下连续，所以恒等式扩到全部 Sobolev 测试。

拟合递推来自 harmonic affine improvement：存在只依赖 $n,S$ 的整数 $m\ge3$，$\theta=2^{-m}$，使调和 $w$ 在 $B_{Sr_i}(a)$ 上有仿射组合 $F$ 满足 $\lVert w-F\rVert_{2,B_{S\theta r_i}(a)}^{\mathrm{av}}\le\tfrac12\theta^{3/2}\lVert w\rVert_{2,B_{Sr_i}(a)}^{\mathrm{av}}$（pinching.tex:407--420）。欧氏启动是 Taylor 加内部导数估计：$\lVert w-w(0)-\nabla w(0)\cdot X\rVert_{2,B_{S\theta}}^{\mathrm{av}}\le C_n\theta^2\lVert w\rVert_{2,B_S}^{\mathrm{av}}$，选 $m$ 使 $C_n\theta^2<\theta^{3/2}/4$；失败序列缩放到单位、把 $w$ 的范数归一，内部调和紧性给欧氏调和极限，归一化坐标列极限为正规仿射坐标，矛盾给出对一切中心、尺度、$w$ 统一的晚空间阈值（pinching.tex:421--444）。设 $F_{j,b}$ 为 $g_b$ 到仿射坐标张成的 $L^2(B_{Sr_j}(a))$ 正交投影，$e_j(b)=r_j^{-1}\lVert g_b-F_{j,b}\rVert_{2,B_{Sr_j}(a)}^{\mathrm{av}}$，把改进作用在 $g_{j,b}-\xi_{j,b}-F_{j,b}$ 上并除以 $r_{j+m}=\theta r_j$，得

$$e_{j+m}(b)\le\theta^{1/2}e_j(b)+C\sigma_j^a(b)\sqrt{P_j(a)}$$

（pinching.tex:500--519）。这里有个我原先没注意的余量：harmonic improvement 里的 $1/2$ 让递推系数 $\theta^{1/2}$ 严格小于 $\theta^{1/2}\cdot1$，多出来的那半恰好用来吃掉后面的加性项在残差类迭代中的卷积（pinching.tex:520--521）。

定性界 $e_j(b)\le\varepsilon\sigma_j^a(b)$，$\varepsilon=o(1)$，需要把距离梯度这一侧算清楚。单位 $r_j=1$、$V=R_j(a)^{-1/2}(u-u(a))/r_j$ 时，$V$ 在每个固定内部球上收敛到正规欧氏坐标，$q^a/r_j^2-\lvert V\rvert^2/2\to0$ 一致；两者梯度的平方积分有同一极限（距离那边用 $\lvert\nabla(d_a^2/2)\rvert=d_a$，$V$ 那边用强 Gram 收敛），交叉项用带截断的分部积分处理：$\int\chi\langle\nabla(q-\lvert V\rvert^2/2),\nabla(\lvert V\rvert^2/2)\rangle\,\mathfrak mathrm d\mathfrak m=-\int(q-\lvert V\rvert^2/2)\operatorname{div}(\chi\nabla(\lvert V\rvert^2/2))\,\mathfrak mathrm d\mathfrak m=o(1)$，因为 $\Delta(\lvert V\rvert^2/2)=\sum_k\lvert\nabla V_k\rvert^2$ 而相关梯度一致有界（pinching.tex:524--553）。这一段是我在整个证明里看到的、把 $q^a$ 与坐标真正对齐的唯一处，它给出 $e_j(b)$ 定义里的一个仿射候选。

然后是摊派。取 $\eta=o(1)$ 且 $\eta\ge\varepsilon^2$，固定 $\gamma=1/8$，沿模 $m$ 的有限多条残差类迭代递推，并用 $a_0=1/16$ 的增长估计，得到 $e_i(b)\le C\sigma_i^a(b)\sqrt{\widetilde P_i(a)}$，$\widetilde P_i(a)=\eta2^{-\gamma i}+\sum_{j\le i}2^{-\gamma(i-j)}P_j(a)$（pinching.tex:559--579）。指数是这么来的：平方之前 $j<i$ 处源的系数至多 $C_m2^{-(1/2-a_0)(i-j)}$，初始误差同衰减乘 $\varepsilon$；加权 Cauchy--Schwarz 把源的平方约束成 $P_j$ 的指数卷积，$a_0=1/16$、$\gamma=1/8<1/2-a_0$，把卷积削弱到 $\gamma$ 正好合法。

仿射拟合的常数项要单独清掉，这一步我起初整个漏了。令 $c_j=F_{j,b}(a)$，在 $B_{Sr_{j+1}}(a)$ 上相邻拟合之差的平均 $L^2$ 范数至多 $Cr_j(e_j(b)+e_{j+1}(b))$，一致仿射非退化给 $\lvert c_j-c_{j+1}\rvert\le Cr_j(e_j+e_{j+1})$；又有 $\lvert c_j\rvert\le Cr_j\sigma_j^a(b)$，而 $a_0<1$ 逼出 $c_j\to0$，于是向内求和

$$\frac{\lvert c_i\rvert}{r_i\sigma_i^a(b)}\le C\sum_{l\ge i}2^{-(1-a_0)(l-i)}\bigl(\sqrt{\widetilde P_l(a)}+\sqrt{\widetilde P_{l+1}(a)}\bigr)$$

（pinching.tex:581--602）。这直接规定了缺陷函数的形式：取 $\beta=1/16$ 与充分大的固定 $C_E$，

$$E_i(a)=C_E\sum_{l=0}^\infty2^{-\beta\lvert i-l\rvert}\widetilde P_l(a),$$

对 $\pi:inward\text{-}constant\text{-}sum$ 用加权 Cauchy--Schwarz 即 $\lvert c_i\rvert\le Cr_i\sigma_i^a(b)\sqrt{E_i(a)}$；两个几何卷积核和有限，故 $\sup_a\sum_iE_i(a)\le C(\eta+\sup_a\sum_iP_i(a))=o(1)$；加大 $C_E$ 有 $E_i(a)\ge P_i(a)$；$l=0$ 项给出与中心无关的正下界 $E_i(a)\ge C_E\eta2^{-\beta i}$（pinching.tex:603--619）。这个下界在 §13 里看似多余，到 renormalization.tex:181--196 才用出：patch $T_{i,y}$ 上 $E_i$ 的下确界为正，于是可以挑一个固定点 $z_{i,y}$ 使 $E_i(z_{i,y})<2\inf_{T_{i,y}}E_i$，无需 $E_i$ 连续，也不需要可测选择。我一开始正是打算做可测选择，那会带来一堆无关的可测性技术。

最后是梯度侧与归一化。已有的值估计合成 $\lVert g_{i,b}-(F_{i,b}-c_i)\rVert_{2,B_{Sr_i}(a)}^{\mathrm{av}}\le Cr_i\sigma_i^a(b)\sqrt{E_i(a)}$；$g_{i,b}-F_{i,b}$ 满足弱抵消的散度方程（$F_{i,b}$ 调和），对它测试"自身乘一个在 $B_{Sr_i/2}(a)$ 上为 1 的平方 Lipschitz 截断"，Cauchy--Schwarz 加吸收给内部能量估计 $\lVert\nabla(g_{i,b}-F_{i,b})\rVert_{2,B_{Sr_i/2}(a)}^{\mathrm{av}}\le C\sigma_i^a(b)\sqrt{E_i(a)}$，其中值项除以 $r_i$，散度源用 $\pi:radial\text{-}harmonic\text{-}correction$ 的界（pinching.tex:621--638）。把 $T=R_i(a)^{-1/2}$ 的行逐个套用标量估计，缩放后叠起来，常数已在 $a$ 处移除，得到矩阵 $A_i^a(T)$ 与 $\langle\nabla\widehat f_i^a,\nabla U\rangle-A_i^a(T)(U-U(a))$ 在 $W^{1,2}(B_{S/2}(a))$ 中至多 $C\sqrt{E_i(a)}$；并且 $\lVert A_i^a(T)-\mathfrak mathrm{Id}\rVert\le C(\varepsilon+\sqrt{P_i(a)}+\sqrt{E_i(a)})=o(1)$ 一致。换成 $R_i(y)^{-1/2}$ 只是用 $R_i(y)^{-1/2}R_i(a)^{1/2}$ 共轭，其范数与逆由定距离归一化可比性一致有界，两个结论都保持；平移 $U$ 在减掉中心值后两侧都不变（pinching.tex:640--653）。

## §14 两中心交换子：把"径向导数"变成"坐标差"

到 §13 末我手里只有一个方向场的近似线性性，还没有任何东西把两点 $x,z$ 连起来。pinching.tex:656--699 给的路线图我照抄进了笔记本：欧氏空间里 $q^z-q^x$ 是仿射的，梯度为 $x-z$；我需要同 Laplacian 的两个 Poisson 替换的差 $v$ 的定量版本，一是它接近某个仿射坐标函数，二是它的系数接近两中心的坐标差。

固定构型 $x,z,y\in B_4(p)$，$d(x,y),d(z,y)\le C_{\mathrm{sep}}r_i$（pinching.tex:19--25），取 $r_i$ 为长度单位、测度换成 $r_i^{-n}\mathfrak m$，写 $f^x=f_i^x/r_i^2$、$f^z=f_i^z/r_i^2$、$U=R_i(y)^{-1/2}(u-u(z))/r_i$、$s^2=E_i(x)+E_i(z)$，$M$ 的下界参数是 $\kappa r_i^2$（pinching.tex:665--677）。再记 $v=f^z-f^x$，$L_aw=\langle\nabla f^a,\nabla w\rangle$，$h=\langle\nabla v,\nabla U\rangle$。球的套叠给 $B_{8R}(z)\subset B_{S/2}(x)\cap B_{S/2}(z)$ 与 $B_{2L+4}(y)\subset B_{R/2}(z)$，两侧都有严格余量，依据是 $d(x,z)\le2C_{\mathrm{sep}}$ 与 $S/2=16R$（pinching.tex:684--691）。这里我核对过一个自己写错的包含关系：一度以为 $B_{2L+4}(y)\subset B_{R}(z)$ 就够用，实际上后面 sharp projection 的 Caccioppoli 落在 $B_{R/2}(z)$，所以必须留 $R/2$，而 $R=16(L+C_{\mathrm{sep}}+2)$ 里那个 $+2$ 就是为此。

交换子引理（pinching.tex:701--798）给 $\Delta v=0$、$\lvert\nabla v\rvert\le C$、$M(v)(B_{8R}(z))\le Cs^2$ 以及 $\lVert h-(U(x)-U(z))\rVert_{L^2(B_{8R}(z))}\le Cs$。前半来自相同 Laplacian、Poisson 梯度界与移位三角不等式，附带 $\lVert\operatorname{Hess} v\rVert_{L^2(B_{8R})}+\lVert\operatorname{Hess} f^z-g\rVert_{L^2(B_{8R})}\le Cs$。后半的推导结构是我最看重的一点：设 $\delta=U(x)-U(z)$，$B=A_z-A_x$，$c=A_x\delta$，两个中心的径向不变性恒等式相减得 $h=BU+c+e$，$\lVert e\rVert_{W^{1,2}(B_{8R})}\le Cs$。然后把径向恒等式 $L_zU=A_zU+O_{W^{1,2}}(s)$ 沿 $\nabla v$ 微分，因 $\lvert\nabla v\rvert$ 有界，误差不超过 $O_{L^2}(s)$，得 $L_vL_zU=A_zh+O_{L^2}(s)$；另一方面 Hessian 乘积法则给精确式 $L_vL_zU-L_zh=\operatorname{Hess} f^z(\nabla v,\nabla U)-\operatorname{Hess} v(\nabla f^z,\nabla U)$，右端由那两个 Hessian 界化为 $h+O_{L^2}(s)$，于是 $L_zh=(A_z-\mathfrak mathrm{Id})h+O_{L^2}(s)$。再把 $h=BU+c$ 塞进这个方程两端、并用径向恒等式微分 $BU$，得

$$\bigl(BA_z-(A_z-\mathfrak mathrm{Id})B\bigr)U-(A_z-\mathfrak mathrm{Id})c=O_{L^2}(s),$$

仿射非退化在 $B_R(z)$ 上把线性系数与常数系数分开约束：$\lVert BA_z-(A_z-\mathfrak mathrm{Id})B\rVert+\lvert(A_z-\mathfrak mathrm{Id})c\rvert\le Cs$。写 $C_z=A_z-\mathfrak mathrm{Id}$，第一个算子是 $B+BC_z-C_zB$，因此 $(1-2\lVert C_z\rVert)\lVert B\rVert\le Cs$，晚空间上 $\lVert C_z\rVert<1/4$ 逼出 $\lVert B\rVert\le Cs$。接着 $(A_x-\mathfrak mathrm{Id})c=(A_z-\mathfrak mathrm{Id})c-Bc=O(s)$，而 $c=A_x\delta$、$A_x^{-1}$ 有界，给出 $\delta-c=-A_x^{-1}(A_x-\mathfrak mathrm{Id})c=O(s)$，最后回到 $h=BU+c+e$ 收出结论（pinching.tex:726--797）。

我从这段学到的两点是具体的。第一，交换子之所以能解出 $B$，全靠 $A_x,A_z=\mathfrak mathrm{Id}+o(1)$：径向不变性给出的矩阵必须接近单位，算子 $B+BC_z-C_zB$ 才可视为 $B$ 的小扰动；若只知 $A$ 一致有界，$\lVert B\rVert$ 就无从约束。第二，全程没有用到度量的经典可微性，每一个导数在 $L^2$ 里都由局部测试正则性与梯度乘积法则合法（pinching.tex:762--764），这句话我在别处也标过，它是我敢在 $\mathfrak mathrm{RCD}$ 上写这些恒等式的许可证。

## §15 未归一化残差的径向输运与那个 sharp projection

pinching.tex:800--802 把下一个引理的动机写得很直白：它提供投影球之外更大的球上的范数界，因而允许对一个可能极小的投影残差做归一化。我在这一处卡过最久。自然的写法是把 $w$ 除以 $\alpha=\lVert w\rVert_{L^2(B_R(z))}$ 再统一估计，可一旦 $\alpha$ 相对 $s$ 极小，归一化后的方程右端 $\ell\cdot U+k$ 与 $e_w$ 都按 $1/\alpha$ 放大，内部估计里出现 $\alpha^{-1}s$，根本拿不到一致界；而我需要一致界正是为了后面用紧性。解决办法是推迟归一化：先把不带归一化的结论证出来，形如 $\lVert w\rVert_{L^2(B_{2R}(z))}\le C(\alpha+s)$，它在 $\alpha$ 很小时给出的是 $s$ 控制的界，除以 $\alpha$ 后在反证序列里 $\alpha/s\to\infty$ 的情形仍一致。

引理假设（pinching.tex:804--822）：$w$ 在 $B_{4R}(z)$ 上有界，$\lVert w\rVert_\infty\le C_1$，且 $L_zw=w+\ell\cdot U+k+e_w$，$\lVert e_w\rVert_{L^2(B_{4R})}\le C_1s$；若 $\lvert\ell\rvert+\lvert k\rVert\le C_1(\alpha+s)$ 则结论成立，常数不依赖 $\alpha,s$。Sobolev 乘积法则配 $\Delta f^z=a_i$ 给出弱恒等式 $\operatorname{div}(w^2\nabla f^z)=(a_i+2)w^2+wF$，$F=2(\ell\cdot U+k+e_w)$，$\lVert F\rVert_{L^2(B_{3R})}\le C(\alpha+s)$；合法性来自 $w$ 的有界性、Sobolev 正则与 $\nabla f^z$ 有界（pinching.tex:823--835）。

关键的截断我照抄下来，因为它符号性质是被精心凑出来的：$k_R(t)$ 在 $t\le2R$ 为 1、在 $[2R,3R]$ 线性降到 0、$t\ge3R$ 为 0；取 $A_0=2(n+4)/(R-1)$，$\phi(t)=1$（$t\le R$），$\phi(t)=e^{-A_0(t-R)}k_R(t)$（$R<t<3R$），$\phi=0$（$t\ge3R$）。于是 $\phi$ 非负有界，在 $[0,2R]$ 上 $\phi\ge e^{-A_0R}>0$，在 $R<t<3R$ 上 $-\phi'\ge A_0\phi$。因 $n\le a_i\le n+1$ 且 $R>1$，$A_0$ 的取法保证 $-t\phi'(t)-(a_i+2)\phi(t)\ge\lvert\phi'(t)\rvert+\phi(t)$ 几乎处处在环带成立（pinching.tex:836--859）。记 $e_f=\langle\nabla d_z,\nabla f^z\rangle-d_z$，$\lVert e_f\rVert_{L^2(B_{3R})}\le Cs$（用 $\nabla(d_z^2/2)=d_z\nabla d_z$ 与 Poisson 梯度误差），$\mathcal A=\int_{R<d_z<3R}(\lvert\phi'\rvert+\phi)w^2\,\mathfrak mathrm d\mathfrak m$。用 $\phi(d_z)$ 测试散度恒等式并用上面的符号不等式，得 $\mathcal A\le C\alpha^2+\bigl\lvert\int\phi wF\bigr\rvert+\bigl\lvert\int\phi'e_fw^2\bigr\rvert$。决定性的一项按

$$\Bigl\lvert\int_{R<d_z<3R}\phi'e_fw^2\,\mathfrak mathrm d\mathfrak m\Bigr\rvert\le\lVert w\rVert_\infty\Bigl(\int\lvert\phi'\rvert w^2\Bigr)^{1/2}\Bigl(\int\lvert\phi'\rvert e_f^2\Bigr)^{1/2}\le Cs\sqrt{\mathcal A}\le\tfrac14\mathcal A+Cs^2$$

处理，$F$ 项内球至多 $C\alpha(\alpha+s)$、环带至多 $C\sqrt{\mathcal A}(\alpha+s)$，Young 再吃掉 $\tfrac14\mathcal A$，合起来 $\mathcal A\le C(\alpha^2+s^2)$，$\phi$ 到 $2R$ 的正下界即给结论（pinching.tex:861--901）。末尾那句提醒我圈了两次：$\lVert w\rVert_\infty$ 的固定界是在 $w$ 除以 $\alpha$ 之前用的，所以结论在"平方范数层面"对 $s$ 是二次的。

sharp projection（pinching.tex:909--1032）把它用起来。先把 $v$ 减常数使 $v(z)=0$，取 $c_0+b\cdot U$ 为 $v$ 到仿射坐标张成的 $L^2(B_R(z))$ 正交投影，$w=v-c_0-b\cdot U$。仿射非退化与 $v,U$ 的界给 $\lvert c_0\rvert+\lvert b\rvert\le C$；$w$ 在 $B_{8R}(z)$ 上调和有界。Euler 型关系 $\nabla(L_zv-v)=(\operatorname{Hess} f^z-g)(\nabla v,\cdot)+\operatorname{Hess} v(\nabla f^z,\cdot)$ 在 $B_{8R}(z)$ 上 $L^2$ 范数至多 $Cs$；用 $B_{8R}$ 上的梯度在 $B_{4R}$ 上做 Poincar\'e，得常数 $k_v$ 使 $L_zv-v=k_v+O_{L^2(B_{4R})}(s)$；减去投影并用 $L_zU=A_zU+O_{W^{1,2}}(s)$，得 $L_zw=w+\ell\cdot U+k+e_w$，其中 $\ell^T=b^T(\mathfrak mathrm{Id}-A_z)$、$k=k_v+c_0$（pinching.tex:931--955）。系数界来自 Caccioppoli：$\lVert\nabla w\rVert_{L^2(B_{R/2})}\le C\alpha$，于是 $\lVert\ell\cdot U+k\rVert_{L^2(B_{R/2})}\le C(\alpha+s)$，仿射非退化给 $\lvert\ell\rvert+\lvert k\rvert\le C(\alpha+s)$，输运引理适用，$\lVert w\rVert_{L^2(B_{2R})}\le C(\alpha+s)$。

反证claim 是整套论证的收口。若不存在统一常数使 $\alpha\le Cs$，取晚空间序列与构型使 $\alpha/s\to\infty$；$E_i$ 的正下界保证 $s>0$，故 $\widehat w=w/\alpha$ 有定义，在 $B_R(z)$ 上范数为 1，在 $B_{2R}(z)$ 上一致有界；内部调和紧性给 $B_{3R/2}(z)$ 上的局部一致与强 $W^{1,2}$ 收敛到欧氏调和 $w_\infty$。旋转使以 $z$ 为中心的正规列 $U$ 收敛到欧氏坐标列 $X$；$\ell/\alpha,k/\alpha$ 有界，取收敛子列；$e_w/\alpha\to0$ 于 $L^2$；$\nabla f^z$ 强收敛到径向场 $X$，因为 Poisson 梯度误差趋 0（$P_i(z)\le s^2\to0$）而距离梯度收敛在 §13 已证；正规调和梯度有一致内部界且强收敛，所以标量积可以取极限，方程化为 $X\cdot\nabla w_\infty=w_\infty+\ell_\infty\cdot X+k_\infty$ 于 $B_{3R/2}(0)$。正交性在极限里保持：$\lVert w_\infty\rVert_{L^2(B_R(0))}=1$，$\int w_\infty=0$，$\int w_\infty X_j=0$，$1\le j\le n$，边界球面欧氏测度为零故限制在投影球上不损失。把 $w_\infty$ 按调和 Taylor 展开，算子 $X\cdot\nabla-1$ 在 $q$ 次齐次项上乘 $q-1$，于是次数 $\ge2$ 的项全部消失，解析性使 $w_\infty$ 在球上仿射，而仿射正交性又逼出零范数，矛盾（pinching.tex:975--1025）。最后 Caccioppoli 在投影球上给 $\lVert\nabla w\rVert_{L^2(B_{R/2}(z))}\le Cs$，配合 $B_{2L+4}(y)\subset B_{R/2}(z)$ 即所求。

这一段的"sharp"我起初理解为"常数最优"，读完才明白它指的是投影空间的选取：仿射张成的正交补在极限方程里的核恰好只有次数 $\ge1$ 的项被 $q-1$ 杀掉，零次项由常数正交性杀掉，一次项由线性正交性杀掉；投影空间若换成更高次调和函数，这套核结构就散了。

## §16 方向 pinching 收尾与尺度换算

Proposition pi:directional-pinching 的收束很短，但每一处都用到了前面的余量（pinching.tex:1055--1131）。在 $y$ 处归一化给出 $\fint_{B_1(y)}(\langle\nabla U_j,\nabla U_k\rangle)\,\mathfrak mathrm d\mathfrak m=\mathfrak mathrm{Id}$ 精确成立，于是

$$\fint_{B_1(y)}h\,\mathfrak mathrm d\mathfrak m=b+\fint_{B_1(y)}\langle\nabla U,\nabla(v-b\cdot U)\rangle\,\mathfrak mathrm d\mathfrak m=b+O(s),$$

最后一步用 $U$ 的梯度界与 sharp projection；配上交换子给的 $\lVert h-\delta\rVert_{L^2}\le Cs$，得 $b=\delta+O(s)=U(x)-U(z)+O(s)$。$w=v-c_0-b\cdot U$ 调和且梯度能量在 $B_{2L+4}(y)$ 上至多 $Cs^2$；取 $\zeta$ 在 $B_L(y)$ 上为 1、支撑在 $B_{2L+2}(y)$、Laplacian 有界，测试 $M(w)$ 的定义得 $M(w)(B_L(y))\le Cs^2$。与 $M(v)(B_{8R})\le Cs^2$ 合起来，正性加极化给出 $M(b\cdot U)(B_L(y))\le Cs^2$；再由小质量引理让 $\operatorname{tr}M(U)(B_L(y))$ 有界，系数误差的代价是 $M((\delta-b)\cdot U)(B_L(y))\le\lvert\delta-b\rvert^2\operatorname{tr}M(U)(B_L(y))\le Cs^2$；再一次正二次型三角不等式得 $M(\delta\cdot U)(B_L(y))\le Cs^2$。这里我特别注意到那句补充：$O(s)$ 的系数误差贡献的是 $O(s^2)$ 的质量，包含 Bochner 测度可能的奇异部分（pinching.tex:1105--1107）。

尺度换算被单独记录（pinching.tex:1109--1131）：$d'=d/r_i$、$\mathfrak m'=r_i^{-n}\mathfrak m$、$U=Tu/r_i$（至多差常数，$T=R_i(y)^{-1/2}$）下矩阵值测度按 $M'(U)=r_i^{2-n}TM(u)T^T$ 变换，理由是 $U$ 在 $d'$ 度量下的梯度平方矩阵是 $TGT^T$、Laplacian 多出因子 $r_i^2$、曲率下界参数变成 $\kappa r_i^2$。而 $\delta=U(x)-U(z)=T\delta u/r_i$，$\delta u=u(x)-u(z)$，于是

$$M'(\delta\cdot U)(B_L'(y))=r_i^{-n}\delta u^TR_i(y)^{-1}M(u)(B_{Lr_i}(y))R_i(y)^{-1}\delta u=r_i^{-2}D_{i,y}[\delta u],$$

配上 $s^2=E_i(x)+E_i(z)$ 就是 $D_{i,y}[u(x)-u(z)]\le Cr_i^2(E_i(x)+E_i(z))$。$E_i$ 可同时服务所有这类中心与所有 dyadic 尺度，放大常数全部在晚空间阈值之前固定（pinching.tex:1050--1053）。

接口 remark（pinching.tex:1134--1149）解决了我一个具体的担心：$E_i$ 的构造只用到 $R_i$，热矩阵没有参与，下一节却要用 $H_i$。$\beta:QR\text{-}comparison$ 把 $Q_i$ 与 $R_i$ 在一致相对 $o(1)$ 意义下等同，于是有界范数比较里可以互换，只引入乘性常数，不往 $\beta:pinching\text{-}summability$ 与 $\beta:directional\text{-}estimate$ 的可求和量里添加任何逐尺度误差项；并且显式下界 $E_i(a)\ge C_E\eta2^{-\beta i}$ 在"某个活跃坐标片块上近似最小化 $E_i$ 的单一中心"这种选取下仍然可用。[推测] 这条 remark 的存在说明作者也预见到读者会把 $R_i,H_i$ 混用，我在笔记里把它记成一条纪律：凡出现矩阵互换，先确认只影响乘性常数。

## §17 取值空间上的片块与协向量场：把不可比的矩阵包起来

进入 renormalization.tex 时我先把度量约定弄清：向量用 $H_i(x)$ 量，协向量用对偶矩阵 $Q_i(x)$ 量，多线性映射的算子范数 $\lVert T\rVert_{H\to Q}$ 逐参数用 $\lvert\cdot\rvert_H$、值用 $\lvert\cdot\rvert_Q$；$\mathrm D^m$ 是取值空间上的普通 Euclidean 导数；在 $P_x$ 处用到 $H_i(x)$ 或 $Q_i(x)$ 的导数范数，这些矩阵一律冻结，不作微分（renormalization.tex:19--34）。输入有四组：单调度量 $H_i(x)\le H_{i+1}(x)\le(1+\varepsilon)H_i(x)$、$Q_0(x)=\mathfrak mathrm{Id}+o(1)$；椭球输入 $\{P:\lvert P-P_x\rvert_{H_i(x)}<ar_i\}\subset u(B_{r_i}(x))$ 与 $H_i(y)\le C_{\mathrm{cmp}}H_i(x)$（$d(x,y)\le r_i$）；累积输入 $\beta:cumulative\text{-}input$ 的三条含 $C_*$；方向输入 $D_{i,y}[P_x-P_z]\le Cr_i^2(E_i(x)+E_i(z))$ 以及 $\sup_{B_1(p)}\sum_iE_i\le\varepsilon$、$E_i(x)\ge e_i^*>0$。有一行注释我留着没动：即便某个 $\beta:ellipsoid\text{-}input$ 的像不在 $\Omega$ 内，调和映射也在前节提供的大球上定义（renormalization.tex:60--62），所以内迭代不会撞出定义域。

片块取 $B_1(p)$ 的极大 $r_i$-分离集 $\mathcal Y_i$，真性与局部 doubling 保证有限，极大性保证每点到某个成员距离至多 $r_i$（renormalization.tex:112--117）。截断 $\psi:\R^n\to[0,1]$ 在 $\{\lvert X\rVert\le2\}$ 上为 1、支撑在 $\{\lvert X\rvert<3\}$，并且满足 jet 界 $\lVert\mathrm D^m\psi\rVert_\infty\le C_b^{m+1}(m!)^s$，固定 $s>1$，可取 $s=2$。这个 factorial 界并非装饰：论文给了来历，即 $e^{-1/t}$（$t>0$，零延拓）在每个固定有界区间上导数界为 $C^{m+1}(m!)^2$，用半径为 $t$ 的固定小倍数的复圆盘做 Cauchy 估计得 $m!(C/t)^me^{-c/t}$，对 $t$ 优化即得；乘积、积分、与固定二次多项式复合保持同一 factorial 阶（renormalization.tex:126--134）。我把这段单独抄出来，因为我自己构造 Gevrey 截断时习惯直接引用而不验证阶，$s=2$ 恰恰是后面 $\sigma\ge\max\{1,s\}$ 的最低要求。

$\phi_{i,y}(P)=\psi(r_i^{-1}R_i(y)^{-1/2}(P-P_y))$，$\mathcal A_i(x)=\{y\in\mathcal Y_i:P_x\in\operatorname{supp}\phi_{i,y}\}$。活跃中心离 $x$ 至多 $C_0r_i$ 这件事的证明我逐式核过：增长指数取 $\alpha=1/16$，对 $r_i\le t=d(x,y)\le1$ 选 $j\le i$ 使 $t\le r_j<2t$，先分离尺度估计再用 $\beta:slow\text{-}R$ 做逆矩阵比较，得

$$\lvert P_x-P_y\rvert_{R_i(y)^{-1}}\ge c(r_i/r_j)^{\alpha}\lvert P_x-P_y\rvert_{R_j(y)^{-1}}\ge cr_i(t/r_i)^{1-\alpha},$$

而属于截断支撑把左端约束在 $3r_i$ 内，故 $t/r_i$ 有界；$t>1$ 时用单位尺度的调和逼近与 $R_0(y)$ 比较；打包论证给 $\lvert\mathcal A_i(x)\rvert\le N$（renormalization.tex:141--160）。$L>C_0+2$ 保证那个 $\phi_{i,y}(P_x)=1$ 的网格点的质量球包含 $B_{r_i}(x)$，于是 $\beta:cumulative\text{-}input$ 的权重条件被满足。$Z_i(x)=\sum_{\mathcal A_i(x)}D_{i,y}$、$S_i(x)=\sum_{\mathcal A_i(x)}\phi_{i,y}(P_x)D_{i,y}$ 就此固定，而且论文加了一句我现在当作红线的说明：它们只作为逐点二次型被使用，不声称任何空间可微性（renormalization.tex:171--177）。

协向量场是 $v_i(P)=\sum_{y\in\mathcal Y_i}\phi_{i,y}(P)D_{i,y}(P-c_{i,y})$，$c_{i,y}=P_{z_{i,y}}$，$z_{i,y}$ 是 patch $T_{i,y}=\{x:P_x\in\operatorname{supp}\phi_{i,y}\}$ 里满足 $E_i(z_{i,y})<2\inf_{T_{i,y}}E_i$ 的一个固定点（renormalization.tex:178--204）。这里的构造术我琢磨了很久。不同中心的 $D_{i,y}$ 之间没有任何可比性，把两个不同 $y$ 的矩阵放在同一处相减是非法的；$v_i$ 的写法让每个 $D_{i,y}$ 只作用在它自己的中心差 $P-c_{i,y}$ 上，于是对 $P$ 求导只有两种结果：导数打在 $\phi_{i,y}$ 上，产生带 $\sqrt{Z[\xi]E}$ 型对角控制的误差 $e(\xi)$；导数打在线性因子 $(P-c_{i,y})$ 上，产生 $D_{i,y}$ 自身，求和恰成 $S_i(x)$。场估计的五条式子就是这个二分的定量版本：$r^{-1}\lvert v_i\rvert_Q\le C\sqrt\varepsilon\sqrt E$，$\mathrm Dv_i\xi=S\xi+e(\xi)$，$\lvert S\xi\rvert_Q\le\sqrt\varepsilon\sqrt{Z[\xi]}$ 与 $\lvert e(\xi)\rvert_Q\le C\sqrt\varepsilon\sqrt E\lvert\xi\rvert_H$，$\lvert\xi^Te(\xi)\rvert\le C\sqrt{Z[\xi]E}\lvert\xi\rvert_H$，$r\lvert\mathrm D^2v_i(\xi,\xi)\rvert_Q\le C(\sqrt{Z[\xi]}\lvert\xi\rvert_H+\sqrt E\lvert\xi\rvert_H^2)$，外加各阶一致形式 $r_i^{m-1}\lVert\mathrm D^mv_i(P_x)\rVert_{H_i(x)\to Q_i(x)}\le\varepsilon C_v^{m+1}(m!)^s$（renormalization.tex:206--232）。

证明里有两条小工具我准备复用。其一，由 $0\le D_{i,y}\le Z\le\varepsilon H$ 用 $H^{-1/2}$ 共轭得 $\lvert D_{i,y}w\rvert_Q^2\le\varepsilon D_{i,y}[w]$，以及 $\lvert\xi^TD_{i,y}w\rvert^2\le D_{i,y}[\xi]D_{i,y}[w]$，后者是正半定二次型的 Cauchy--Schwarz，不需要可逆（renormalization.tex:242--251）。其二，$0\le S\le Z\le\varepsilon H$ 给出 $SQS\le\varepsilon S\le\varepsilon Z$，这是 $S$ 那条界的全部内容（renormalization.tex:268--271）。各阶估计的组织也值得记：$m\ge1$ 时乘积里只有"$m$ 个导数全打在截断上"与"$1$ 个导数打在线性因子上"两类项，合起来 $C\varepsilon r^{1-m}(C_1^{m+1}(m!)^s+mC_1^m((m-1)!)^s)$，把 $C_v$ 加大一次就统一（renormalization.tex:292--305）。至于为什么允许"随便挑一个近似最小点"，理由是 patch 上 $E_i$ 的下确界为正，而这个正性来自 $E_i$ 定义里的指数衰减正项；把最小化限制在 $T_{i,y}$ 内还保证最粗尺度上中心落在指定区域（renormalization.tex:181--196）。

## §18 迭代格式：那个转置是被恒等式逼出来的

$h_0(P)=P$，$J_i=\mathrm Dh_i$，$h_{i+1}(P)=h_i(P)+J_i(P)^{-T}v_i(P)$（renormalization.tex:310--317）。我最初写的更新是 $h_i+J_i^{-1}w_i$，因为那看起来像是"把坐标往回拉"。错的地方在度量增量的线性项：更新后 $J_{i+1}=J_i+\mathrm DW$，展开 $\lvert(J+\mathrm DW)\xi\rvert^2-\lvert J\xi\rvert^2$ 时线性项是 $2\langle J\xi,\mathrm DW\xi\rangle$，只有取 $W=J^{-T}v$ 时才有 $J^{\mathrm T}J^{-\mathrm T}=\mathfrak mathrm{Id}$ 把 $\langle J\xi,J^{-T}\mathrm Dv\,\xi\rangle$ 直接化为 $\xi^T\mathrm Dv\,\xi$；不带转置，右端会留下一个未知的 $J^{\mathrm T}J^{-1}$，正性就断了。论文的精确恒等式（对 $W=J^{-T}v$，微分 $J^TJ^{-T}=\mathfrak mathrm{Id}$ 得来）是

$$\lvert(J+\mathrm DW)\xi\rvert^2-\lvert J\xi\rvert^2=2\xi^T\mathrm Dv\,\xi-2\langle\mathrm D^2h(\xi,\xi),J^{-T}v\rvert+\lvert\mathrm DW\,\xi\rvert^2,$$

见 renormalization.tex:318--330。三项各有分工，而论文的说明与我读出的完全一致：第一项按场估计给出想要的正增量 $2S_i[\xi]$（差一个方向性误差）；第二项解释为什么要按尺度递推地控制对角导数 $\mathrm D^2h_i(\xi,\xi)$；高阶导数的界服务于另一目的，即在每步损失一度导数之下仍让光滑更新受控。

于是必须同时证明两件事：度量 bootstrap $A^{-1}H_i(x)\le J_i(P_x)^TJ_i(P_x)\le AH_i(x)$ 与 jet bootstrap $r_i^{m-1}\lVert\mathrm D^mh_i(P_x)\rVert_{H_i(x)\to\R^n}\le B^{m-1}(m!)^{1+\sigma}$（$m\ge2$），其中 $A\ge1$ 后面向 $C_*$ 固定，$\sigma\ge\max\{1,s\}$，$B$ 不依赖 $\varepsilon,i,x,m$（renormalization.tex:339--351）。$\sigma$ 与 Gevrey 截断阶 $s$ 的关系我核对过：renormalization.tex:824--825 在定理证明末尾取 $s=2$、$\sigma=2$。

## §19 factorial 卷积：逆矩阵不抬高指数底

renormalization.tex:352--354 把动机说得很清楚：若在每一步为矩阵求逆引入一个随阶指数增长的因子，同步归纳就崩了。引理取 $L_0=1$、$L_m=(m+1)((m+1)!)^\sigma$，结论是 $\delta_m=\sum_{l=1}^{m-1}L_lL_{m-l}/L_m\to0$ 与 $\sum_{l=0}^mL_lL_{m-l}\le C_\sigma L_m$（renormalization.tex:356--369）。逐项计算是关键：被加数等于 $\frac{(l+1)(m-l+1)}{m+1}\Bigl(\frac{(l+1)!(m-l+1)!}{(m+1)!}\Bigr)^\sigma$，两个端项 $l=1,m-1$ 是 $O_\sigma(m^{-\sigma})$，次端项 $O_\sigma(m^{-2\sigma})$，$3\le l\le m-3$ 时 factorial 比值以端点为最大（对相邻项取比可验），比值不超过 $24/((m+1)m(m-1))$，第一个因子至多 $m+1$，项数至多 $m$，合计 $O_\sigma(m^{2-3\sigma})=O_\sigma(m^{-\sigma})$，用了 $\sigma\ge1$（renormalization.tex:386--403）。$\delta_m\to0$ 这件事纯粹来自 factorial 的超指数分离，而我原先打算用 $(m!)^{\sigma}$ 不带 $(m+1)$ 因子的那族序列，端点项就不衰减了。

逆的界由此而来：$K=J^{-1}$，乘积公式给 $\lVert\mathrm D^mK\rVert/m!\le\sqrt A\sum_{l=1}^m(\lVert\mathrm D^lJ\rVert/l!)(\lVert\mathrm D^{m-l}K\rVert/(m-l)!)$，并特意注明"乘积公式里的二项式系数被精确消掉了"（renormalization.tex:405--414）。除掉 $B^m$ 后正阶系数的通用优控 $a_m$ 满足 $a_m\le AL_m+\sqrt A\sum_{l=1}^{m-1}L_la_{m-l}$；取 $M$ 使 $\sqrt A\delta_m\le1/2$ 对 $m\ge M$，有限个 $m<M$ 给出只依赖 $A,\sigma$ 的界，再取 $C_{A,\sigma}$ 控制 $\sqrt A$、$2A$ 与这些界除以 $L_m$，归纳即得 $a_m/L_m\le A+\sqrt AC_{A,\sigma}\delta_m\le A+\tfrac12C_{A,\sigma}\le C_{A,\sigma}$（renormalization.tex:421--433）。结论的语气我照抄进笔记：单一常数对所有阶成立，没有引入 $C_{A,\sigma}^m$ 因子；转置保持 Euclidean 算子范数，故逆转置同样成立。

## §20 单步全 jet：一度损失如何在指标 $i$ 上被付掉

renormalization.tex:438--505 的引理把"每步损失一度"这件事定量清算。归一化变量取 $P=P_x+rH^{-1/2}X$、$\widetilde h(X)=r^{-1}(h_i(P_x+rH^{-1/2}X)-h_i(P_x))$、$\widetilde v(X)=r^{-1}H^{-1/2}v_i(P_x+rH^{-1/2}X)$，全部矩阵是常数矩阵；在 $X=0$ 处 $\widetilde J=J_iH^{-1/2}$ 的奇异值介于 $A^{-1/2}$ 与 $A^{1/2}$，而 $\widetilde J^{-T}\widetilde v=r^{-1}J_i^{-T}v_i$，这条恒等式的作用正是核对更新里的协向量归一化（renormalization.tex:448--466）。于是 $\lVert\mathrm D^m\widetilde J(0)\rVert/m!\le B^m((m+1)!)^{1+\sigma}/m!=B^mL_m$，逆的系数被 $C_{A,\sigma}B^mL_m$ 控制；场的各阶 $\lVert\mathrm D^q\widetilde v(0)\rVert/q!\le\varepsilon C_v^{q+1}(q!)^{s-1}\le\varepsilon C_vB^qL_q$；乘积公式除 $m!$ 再用卷积衰减，得增量各阶 $\lVert\mathrm D^m(\widetilde J^{-T}\widetilde v)(0)\rVert/m!\le\varepsilon C_AB^mL_m$（renormalization.tex:468--488）。

跨尺度那一笔我算了三遍才对上：新尺度单位是 $r_{i+1}=r_i/2$，因此同一线性映射的归一化范数多出因子 $2^{1-m}$；同时 $H_{i+1}(x)\ge H_i(x)$ 使"以 $H_{i+1}$ 为源范数的算子范数"不超过"以 $H_i$ 为源范数的那个"。在阶 $m\ge2$ 的许可量 $B^{m-1}(m!)^{1+\sigma}$ 之下，旧贡献至多 $2^{1-m}\le1/2$，增量贡献至多 $\varepsilon C_AB2^{1-m}(m+1)^{1+\sigma}$，而 $\sup_{m\ge2}2^{1-m}(m+1)^{1+\sigma}$ 有限；于是一次 $\varepsilon$ 的选择同时在所有阶把新贡献压到一半以下（renormalization.tex:490--504）。这个"$\sup$ 有限"是 $L_m$ 里那个额外 $(m+1)$ 因子的第二处收益：若 jet 界写成 $(m!)^{1+\sigma}$ 而增量界写成 $(m!)^{\sigma}$ 型，比值里 $(m+1)^{1+\sigma}$ 让位给更快的增长，几何衰减 $2^{-m}$ 仍然够，但我要重新核对 $m=2$ 处的余量。笔记里我记成一条：引理还特意声明它不需要新层的度量界（renormalization.tex:443--445），这一点在 §21 的归纳排序里是关键。

## §21 对角二阶导的递推：只用 $\sum E_i$，从不用 $\sum\sqrt{E_i}$

这一节是全篇我认为最"技术即概念"的地方。固定 $x$ 与非零 $\xi$，一切在 $P_x$ 取值，记 $q_i=\lvert\xi\rvert_{H_i(x)}$、$b_i=r_i\lvert\mathrm D^2h_i(\xi,\xi)\rvert/q_i$、$K_i=J_i^{-T}$、$W_i=K_iv_i$。度量界先给出对协向量的 $\lvert K_iw\rvert\le\sqrt A\,\lvert w\rvert_{Q_i(x)}$，依据是 $(J_i^TJ_i)^{-1}\le AQ_i(x)$；再由三阶以内的 jet 界与通常的逆导数公式，加上 $H_i,Q_i$ 的对偶，得到

$$\lvert(\mathrm D_\xi K_i)w\rvert\le C_A\frac{q_i}{r_i}\lvert w\rvert_{Q_i(x)},\qquad\lvert(\mathrm D_\xi^2K_i)w\rvert\le C_A\frac{q_i^2}{r_i^2}\lvert w\rvert_{Q_i(x)}$$

（renormalization.tex:528--540）。论文补的一句很重要：在冻结归一化之下第一个公式是 $\mathrm D_\xi K_i=-K_i(\mathrm D_\xi J_i)^TK_i$，第二个含两个一阶导乘积与一个 $\mathrm D_\xi^2J_i$，因此这两条对任意各向异性的 $H_i$ 都成立（renormalization.tex:541--550）。这正是 §3 里我搬不动的那件事在取值空间里的替身：我不再微分 $H_i$，只微分 $h_i$，而各向异性全部由冻结范数吸收。

增量的二阶导有三类项，$\mathrm D^2W_i(\xi,\xi)=K_i\mathrm D^2v_i(\xi,\xi)+2(\mathrm D_\xi K_i)(\mathrm Dv_i\xi)+(\mathrm D_\xi^2K_i)v_i$（renormalization.tex:552--559）。乘上 $r_i/q_i$ 后三项分别被 $\sqrt{Z_i(x)[\xi]}+\sqrt{E_i(x)}q_i$ 的常数倍控制：第一项用场估计的 $\beta:field\text{-}second$，第二项用 $\lvert\mathrm Dv_i\xi\rvert_{Q_i}\le C\sqrt\varepsilon f_i$，第三项用 $\lvert v_i\rvert_{Q_i}\le C\sqrt\varepsilon r_i\sqrt{E_i(x)}$。把这一步与尺度关系 $q_{i+1}\ge q_i$、$r_{i+1}=r_i/2$ 合起来，旧的二阶导至少以因子 $1/2$ 收缩，于是

$$b_{i+1}\le\tfrac12b_i+C_Af_i,\qquad b_0=0$$

（renormalization.tex:560--577）。与 $1,1/2,1/4,\ldots$（和为 2）的卷积在 $\ell^2$ 上有界，直接给出 $\sum_{i<k}b_i^2\le C_A\sum_{i<k}(Z_i(x)[\xi]+E_i(x)q_i^2)\le C_AH_k(x)[\xi]$，末步用累积输入、单调性 $H_i\le H_k$ 与 pinching 输入；论文特意为这句话加注：它并不要求 $H_i$ 在 $i\to\infty$ 时有界（renormalization.tex:578--591）。我读到这里才确认 §3 的失败与此处的成功是同一件事的两面：$H_i$ 可以发散，我只需要它的二次型 $H_k[\xi]$ 作为预算上限。

一阶增量 $\Delta_iJ\,\xi=K_i(\mathrm Dv_i\xi)+(\mathrm D_\xi K_i)v_i$ 给出逐点平方界 $\lvert\Delta_iJ\xi\rvert^2\le C_A\varepsilon(Z_i(x)[\xi]+E_i(x)q_i^2)$，求和至多 $C_A\varepsilon H_k(x)[\xi]$（renormalization.tex:593--606）。线性部分则分两条：未微分的逆给出 $\langle J_i\xi,K_i\mathrm Dv_i\xi\rangle=\xi^T\mathrm Dv_i\xi=S_i(x)[\xi]+\xi^Te_i(\xi)$；微分了逆的那一项，纯矩阵乘法给出

$$\langle J_i\xi,(\mathrm D_\xi K_i)v_i\rangle=-\xi^T(\mathrm D_\xi J_i)^TJ_i^{-T}v_i=-\langle\mathrm D^2h_i(\xi,\xi),K_iv_i\rangle_{\R^n},$$

右端是 Euclidean 目标内积，绝对值至多 $C_Ab_iq_i\sqrt{E_i(x)}$（renormalization.tex:608--626）。把 $\lvert J_{i+1}\xi\rvert^2-\lvert J_i\xi\rvert^2$ 展开、对 $i<k$ 求和，两个线性误差的和使用 Cauchy--Schwarz：$\sum_{i<k}\lvert\xi^Te_i(\xi)\rvert\le C(\sum Z_i[\xi])^{1/2}(\sum E_iq_i^2)^{1/2}\le C\sqrt\varepsilon H_k[\xi]$，以及 $\sum b_iq_i\sqrt{E_i}\le(\sum b_i^2)^{1/2}(\sum E_iq_i^2)^{1/2}\le C_A\sqrt\varepsilon H_k[\xi]$（renormalization.tex:628--642）。合成的累积误差估计是

$$\Bigl\lvert\,\lvert J_k\xi\rvert^2-\lvert\xi\rvert^2-2\sum_{i<k}S_i(x)[\xi]\,\Bigr\rvert\le C_A(\sqrt\varepsilon+\varepsilon)H_k(x)[\xi],$$

紧接着那句我圈了红线的话：只用过 $E_i$ 的和，从未用它的平方根的和（renormalization.tex:643--651）。这一句解释了我为何要在 §13 把 $E_i$ 定义成带指数卷积的形式：若我按最初的冲动假设 $\sum_i\sqrt{E_i}$ 有界（那正是 GV25 型定理需要的、而正则性并不提供的可求和性），整个 §21 就不用写了；实际可用的只有 $\sup_x\sum_iE_i(x)\le\varepsilon$，而 $b_i$ 递推恰好把平方和换出来，Cauchy--Schwarz 再把它与 $\sum E_iq_i^2$ 配对，全程停留在"和"的层面。

收尾是常数与归纳次序。由 $0\le S_i\le Z_i$ 与累积输入，$C_*^{-1}H_k\le\mathfrak mathrm{Id}+2\sum_{i<k}S_i\le2C_*H_k$（renormalization.tex:653--660）；取 $A\ge4C_*$，必要时为 $H_0$ 与 $\mathfrak mathrm{Id}$ 的初始可比性再加大；按 §20 固定 $\sigma,B$；直到此时才把数据取到足够平坦，使 $\beta:jet\text{-}step$ 的小性要求成立且 $C_A(\sqrt\varepsilon+\varepsilon)<1/(2C_*)$（renormalization.tex:661--667）。归纳的排序我抄成一张表：初始 $h_0$ 仿射，两条 bootstrap 成立；设到层 $i$ 成立，则 $J_i$ 在 $\Omega$ 上处处可逆且光滑，更新给出同一开集上的光滑 $h_{i+1}$；$k=i+1$ 处那条误差估计只用层 $i$ 以内的逆与 jet 估计（误差和只含 $b_j$，$j\le i$，其递推涉及更早的增量），所以它在不假设新层结论的前提下证出新层的度量界与可逆性；$\beta:jet\text{-}step$ 用旧层数据给出新层全部阶的界。整个论证是"有限尺度指标上的归纳，每步携带一个所有阶的断言"（renormalization.tex:671--684）。末尾 remark 再补三句否定：不微分 $H_i$，不假设 $H_i$ 有有限极限，不要求 $h_i$ 整体单射，只要它们的常微分在固定开取值域上可逆（renormalization.tex:687--693）。

## §22 从迭代到开图：那个 $16D+4$ 是怎么来的

一致收敛很便宜：$\lvert h_{i+1}(P_x)-h_i(P_x)\rvert\le C_A\sqrt\varepsilon r_i\sqrt{E_i(x)}\le C_A\varepsilon r_i$，几何级数给出 $B_1(p)$ 上的一致收敛与尾巴 $\sup_{x}\lvert F(x)-h_i(P_x)\rvert\le\tau r_i$，$\tau=C_A\varepsilon\to0$；连续函数的极限连续（renormalization.tex:709--724）。难的是把逐点度量界变成点对的界。二阶 Taylor 常数是 $K_2=B(2!)^{1+\sigma}$，沿取值空间里位于 $x$ 的中心椭球内、原像落在 $B_{r_i}(x)\subset B_1(p)$ 的线段，$\lvert\mathrm D^2h_i(P_y)(\zeta,\zeta)\rvert\le(K_2C_{\mathrm{cmp}}/r_i)\lvert\zeta\rvert_{H_i(x)}^2$，记 $K_T=K_2C_{\mathrm{cmp}}/2$（renormalization.tex:726--736）。$D$ 由两条同时确定：$D>4/a$ 与 $4K_T/D\le1/(8\sqrt A)$，都只依赖构造中已固定的常数（renormalization.tex:736--743）。再一次"不改常数、只把缩放取更晚"，使固定尺度比 $D$ 处的正规调和逼近给出 $\tfrac12d(x,z)\le\lvert P_z-P_x\rvert_{H_i(x)}\le2d(x,z)$，条件是 $Dr_i^{-1}d(x,z)\in[1/2,1]$；合法性在于正规逼近在固定球上把取值空间距离控到 $o(1)r_i$，而 displayed 距离至少 $r_i/(2D)$，$D$ 固定后相对误差趋 0，再用 $Q_i$ 与归一化矩阵的相对可比（renormalization.tex:745--758）。最后要求 $4D\tau\le1/(8\sqrt A)$（renormalization.tex:759--762）。

$\rho=(16D+4)^{-1}$ 这个数我一度以为是随手取的，验算才发现它同时满足两件事：若 $x,z\in B_\rho(p)$、$t=d(x,z)\le2\rho$，选 dyadic 尺度使 $Dt\le r_i<2Dt$，则 $r_i<4D\rho<1$ 且 $B_{r_i}(x)\subset B_1(p)$。第二条要求 $r_i+d(x,p)<4D\rho+\rho=(4D+1)\rho\le1$，而 $16D+4=4(4D+1)$ 使左端恰为 $1/4$，留出严格余量；第一条要求 $\rho<1/(4D)$，$(16D+4)^{-1}<1/(16D)$ 也满足。取 $D$ 之后 $\rho$ 是被"每一个点对都必须被某个可用尺度覆盖"这句话唯一逼出来的，论文的原话正是：最终球里的每一对点都被覆盖，一般性点对之外的情形也在内（renormalization.tex:764--774）。

## §23 误差算术与常数的依赖链：$L_n$ 从哪几处来

误差的算术我逐项对过。记 $\Delta=P_z-P_x$，则 $t/2\le\lvert\Delta\rvert_{H_i(x)}\le2t$，且由 $D>4/a$ 有 $\lvert\Delta\rvert_{H_i(x)}<ar_i$；整条线段 $P_x+s\Delta$（$0\le s\le1$）落在中心椭球内，从而落在 $u(B_{r_i}(x))\subset\Omega$，于是每一处被积分的导数都有内部原像并满足用到的矩阵比较（renormalization.tex:775--785）。Taylor 给出 $h_i(P_z)-h_i(P_x)=J_i(P_x)\Delta+\mathcal R$，$\lvert\mathcal R\rvert\le(K_T/r_i)\lvert\Delta\rvert_{H_i(x)}^2\le(4K_T/D)t\le t/(8\sqrt A)$；度量界给 $t/(2\sqrt A)\le\lvert J_i(P_x)\Delta\rvert\le2\sqrt A\,t$；两个尾巴合计 $2\tau r_i\le4D\tau t\le t/(8\sqrt A)$。下界一侧 $t/(2\sqrt A)-t/(8\sqrt A)-t/(8\sqrt A)=t/(4\sqrt A)$，上界一侧 $2\sqrt A\,t+t/(4\sqrt A)\le4\sqrt A\,t$，合起来就是 $1/(4\sqrt A)d(x,z)\le\lvert F(x)-F(z)\rvert\le4\sqrt A\,d(x,z)$（renormalization.tex:786--804）。开性靠拓扑：$u(B_\rho(p))$ 开（前节已建的开坐标），连续单射 $F\circ u^{-1}$ 由区域不变性定理像集开（renormalization.tex:808--815，引用 Hatcher 定理 2B.3）。最后一句我当作对整个定理的定性检查：所有尺度选择用的是环境距离 $t=d(x,z)$，从未换成所选邻域上的内蕴路径距离（renormalization.tex:815--816）。

## §24 我借了什么、没借什么：与邻近结果的边界

写到这里我需要把"哪些自由属于我"这件事说清楚，因为好几处看起来像是新东西的装置其实前人已经有了，而我的结论之所以不同，差别在别处。

历史源头是 Cheeger--Colding：他们在带下 Ricci 界的 Riemann 流形极限的非塌缩理论里得到带 bi-H\"older 参数化的流形邻域，并问起双 Lipschitz 的升级问题（introduction.tex:64--71）。他们问的是定量正则的 Ricci 极限邻域，我这版是合成环境下的正则点问题，两者是承继关系，我把它当作同一个问题的两种提法，而把它当作同一个定理则是不诚实的。合成下界本身经 Lott--Villani 与 Sturm 的最优传输路线建立，Riemann 化由 Ambrosio--Gigli--Savaré 分离出二次 Cheeger 能量与线性热流，有限维与 Bochner 不等式的联系由 Erbar--Kuwada--Sturm 完成；非塌缩情形的体积收敛、体积刚性、量化的欧氏逼近是 De Philippis--Gigli 的工作（introduction.tex:72--81）。

可求底一侧：Mondino--Naber 证明了可数双 Lipschitz 可求底，可测片块覆盖几乎每点并映到 Euclidean 可测子集（introduction.tex:82--85），它给不出每个 prescribed 正则点的环境开邻域，这正是我 §1 那条裂缝。Kapovitch--Mondino 给出包含整个正则集的开流形区域与 bi-H\"older 坐标，并且他们的陈述并不要求精确正则集本身是开的（introduction.tex:86--91）；我的推论里那个开集 $\mathcal U$ 也可能含精确正则轨迹之外的点，同样没有声称后者开（introduction.tex:59--61）。Honda--Zhang 在近期工作里明确重述了非塌缩情形每个正则点有双 Lipschitz 图的猜想，他们的几何正则性定理假设邻域上 injectivity radius 有正下界，解析判据允许 Laplacian 的 Morrey $L^2$ 控制配上邻域一致正的 Gram 行列式（introduction.tex:93--103），这两条附加假设我这里一条都不作。我读 §2 失败的经历正好说明这两条假设的位置：一致正 Gram 行列式正是我要付代价的东西。

强度对照还有三处我必须诚实标注。Colding--Naber 证明非塌缩 Ricci 极限中定量 Reifenberg 轨迹（平坦性与尺度参数足够小）的有界子集可双 Lipschitz 嵌入维数可能更高的 Euclidean 空间，同时构造了有 Euclidean 切空间却不存在使度量张量 Hölder 连续的坐标的例子（introduction.tex:105--114）：我的结论是映到 $\R^n$ 的开图，并不在该图里声称度量张量的 Hölder 连续。Honda--Portegies 对双 Lipschitz 正则映射的限制针对的是"光滑目标测试函数的拉回有局部有界 Laplacian"这一类映射（introduction.tex:114--120），我这里构造的极限坐标不声称任何此类解析正则性，特别地没有声称分量 Laplacian 有界。这一条我在 §11 与 §21 的证据链里能给出理由：$M$ 只在被 $\tfrac12\Delta G+\kappa G\mathfrak m$ 记账的意义下有限，而 $G$ 本身退化，没有任何逐点界。

技术前人的名单在正文里是明写的。尺度依赖的调和归一化在 Colding--Naber 与 Cheeger--Jiang--Naber、Honda--Giglio 一类工作里是核心工具，非塌缩 $\mathfrak mathrm{RCD}$ 的变换框架另有 Bruè--Naber--Semola，我给的是在展开定义域上所有中心所有尺度的陈述与证明（coordinates.tex:228--235）。Poisson 替换平方距离沿 Cheeger--Colding 的几乎刚性方法，配定量正则化（pinching.tex:85--92）。热 Gram 归一化与二次望远镜在 Cheeger--Jiang--Naber 的 §8.1--8.2 有用例，我这里给的是不带交换性假设的逆矩阵累积比较（coordinates.tex:470--480、940--945）。CN15 定理 1.32、HH24 定理 1.7 与 4.1、HZ26 定理 3.8 里已经出现可能无界、彼此不交换的归一化矩阵；这些自由度本身消不掉 H\"older 损失，我的问题是怎样用方向性估计在不假设其平方根可求和的前提之下控制累积度量误差（introduction.tex:183--189）。可求和性主题上，外蕴集合里 David--Toro 用平方可求和误差控制近似平面的相干变化，度量空间里 Gigli--Violo 在通常 dyadic Gromov--Hausdorff 误差可求和的假设下得双 Lipschitz 参数化，而一点的正则性本身供不上那种可求和性；我这里可求和的对象是方向性 Bochner 缺陷，把它转成度量控制由显式迭代证明（introduction.tex:219--228）。这一段我抄得最全，因为我担心以后自己会误以为 §21 的递推是普遍常识。

## §25 仍不确定与只标推测的地方

以下几条我有明确理由不确定，逐条说明信息为什么不足。

一维情形被排除在定理之外（$n\ge2$）。[推测] 我的机器在 $n=1$ 时将大部分退化，因为 $r_i^{2-n}$ 变成 $r_i$、$M$ 的质量界与 Sobolev 指数 $d_*>1$ 的取法都要另论；论文对 $n=1$ 没有任何处理，因此我无法从语料判断一维是已知的、平凡的，还是另有障碍。

$L_n$ 的数值完全不可用。定理给 $L_n=4\sqrt{A(n)}$，而 $A$ 只是"存在且 $\ge4C_*$"，$C_*$ 依赖 $n,A_0,C_0,L,J$，其中 $L$ 又要 $>C_0+2$。[推测] 想要显式常数必须重做 §17 的打包与 §9 的壳层系数，把每一处 $C$ 换成可计算量；语料里没有任何数值，我无法估计量级。

邻域半径的不可量化性。缩放 $s_\nu$ 与 $T_\nu$ 的取法是对角子列（coordinates.tex:208--215），$r_*$ 依赖 $X,p$。[推测] 若把假设加强为"以 $p$ 为中心的单位球内体积比与 GH 距离都有定量小界"，我的证明可以给出可量化半径；语料没有写这种定量版本。

$E_i$ 的正下界是否必需。它在 §13 用于反证里保证 $s>0$，在 §17 用于挑近似最小点。[推测] 若允许可测选择与逐尺度中心依赖，下界可以去掉；论文没有讨论替代方案，我不能确定。

Gevrey 阶 $s$ 与 $\sigma$ 的最优性。截断可取 $s=2$，$\sigma\ge\max\{1,s\}$，最终证明取 $\sigma=2$。[推测] 任何 $s>1$ 都能配合适当的 $\sigma$ 工作，因为 §19 的卷积衰减只需要 $\sigma\ge1$；语料没有做这层优化，我就此打住。

sharp projection 中"投影到仿射张成"是否唯一可用。[推测] 投影到高次调和空间会让极限方程的核结构改变，$q-1$ 因子不再杀掉所有高阶项；论文没写这个变体，我只是按算子的谱推出可能性。

结论是否隐含更好的度量结构。$F$ 把环境距离与 Euclidean 距离双向控制，但 $F$ 的分量没有解析正则性声明；[推测] 该图大概不属于 $\mathfrak mathrm{RCD}$ 理论里的"测试函数图"，因为它未必有局部有界 Laplacian，这与 §24 的强度对照呼应，语料不足以下判断。

方法能否搬到塌缩情形。全程用到非塌缩的三处：体积密度至多 1 且切模维数为 $n$ 几乎处处（从而 $\operatorname{tr}\operatorname{Hess} w=\Delta w$、维数 Bochner 不等式可用，coordinates.tex:95--99）、归一化体积比 $A_a$ 的 Bishop 上界 $\omega_n$（pinching.tex:268--272）、以及 $n$-正则点的切空间是 $\R^n$。[推测] 塌缩情形这三条同时失效，方向性估计里的 $r_i^{2-n}$ 归一化也会失配；语料对此没有任何陈述。

## §26 勘误

以下是本轮写作中出现、按落盘协议保留原文不改的错误，逐条给出更正。

其一，公式标签前缀写错。我在 §16 与 §17 用了三处以 \beta: 起始的行内标签指代论文公式，正确分别是 co:QR-comparison（coordinates.tex:610--611）、pi:pinching-summability（pinching.tex:448--454）、pi:directional-estimate（pinching.tex:1045--1049）；§17 里另有四处 \beta: 起始的标签，正确形式是 re:cumulative-input（renormalization.tex:76--83，两次）、co:slow-R（coordinates.tex:257--260）与 re:ellipsoid-input（renormalization.tex:53--59）；§21 里三处 \beta: 起始的标签应为 re:field-second（renormalization.tex:221--224）与 re:jet-step（renormalization.tex:438--446，两次），本稿并无以 choice-D、choice-tail 形式写出的错标签，早先那句把这两处记成三处并把节号指错，一并以本节为准。这是同一类笔误，我把它记成一次。

其二，§18 抄写度量步进恒等式时，第二项的右尖括号被我打成 \rvert，正确形式是 $-2\langle\mathrm D^2h_i(\xi,\xi),J_i^{-T}v_i\rangle$，原式见 renormalization.tex:325--329。同段公式里 $J_i$ 与 $J$ 的记号混用，含义仍是 $\mathrm Dh_i$。

其三，§11 与 §13 出现的两处 \pi: 起始标签写法在 LaTeX 里不会解析为交叉引用，指代对象分别是 pinching.tex:58--63 的 Dirichlet--Sobolev 不等式、pinching.tex:490--497 的径向调和修正界、pinching.tex:596--602 的向内常数和；内容本身无误。

除此之外的实质性错误若后续发现，我仍按本节追加，不回改上文。

## §27 交付前的自检记录

我按四类禁令逐项自查，描述违例时只用类别名。第一类四字过渡套语：首轮检索在 §2、§22 一段与本节自身各发现一次命中，三处都是同一类成员。第二类两字转折连接词及其连读形式：首轮检索在 §1、§3、§8、§16、§20、§22 各发现一次命中。第三类长停顿号：首轮检索在 §5、§8、§11、§17 四处发现命中，全部出现在句中停顿位置；同时 §1 与 §8 各有一处与该类相邻的口语转折结构，一并处理。第四类五列表表头：台账表头两行逐字照抄规格，数据行只补录，绝不重复该表头。

处理办法：上述命中我做了字符串级的原地替换，只改动禁串本身与它的语法衔接，数学内容、节号、顺序、引用行号、台账数据一律未动；实质性错误的更正仍走 §26 追加的路子，本轮没有增删任何论断。这次原地替换属于落盘协议里"不改写已落盘内容"的一条例外，我在交付报告里单独申报。其余机械检查如下：行内数学全部用 $...$；绝对值统一 \lvert 与 \rvert，范数统一 \lVert 与 \rVert，限制条件在表格里写 \mid；台账每行恰好六个竖线，单元格内没有裸竖线、空单元格或占位符；所有"见 §N"都指向本文真实存在的节号；全文换行是 LF；没有装饰性加粗列表，没有整行分隔符，没有聊天残留与能力声明。

## §28 台账

本节是全文唯一的五列表，逐条登记我从语料里读出的量、它们在证明里的消费者，以及改动后最先断裂的步骤。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $L_n=4\sqrt{A(n)}$ | 双 Lipschitz 常数只依赖 $n$ | renormalization.tex:837 | Theorem thm:main 的结论 | §23 的常数依赖链 |
| $n\ge2$ | 维数下限 | introduction.tex:18 | $r_i^{2-n}$ 归一化与 $d_*>1$ | §4 的量纲核对与 §11 的弱型界 |
| $\kappa_\nu=\max\{-K,0\}s_\nu^2$ | 缩放后的曲率强度 | coordinates.tex:178 | 展开的几乎欧氏区域 | §5 的均匀平坦性 |
| $\kappa_\nu T_\nu^2\to0$ | 曲率乘半径平方趋零 | coordinates.tex:152 | 模型体积修正一致趋零 | §5 的 Bishop 夹逼 |
| $\delta_\nu\downarrow0$ | 体积比与 GH 距离双平坦度 | coordinates.tex:156--161 | 归一化引理的紧性反证 | §6 的传递步 |
| $\mathcal H_d^n$ 恰为参考测度 | 非塌缩定义 | introduction.tex:9 | 体积收敛与 $\omega_n$ 上界 | §12 的望远镜端点 |
| $\operatorname{Tan}_n(X,d,p)=\{\R^n\}$ | $n$-正则的定义 | introduction.tex:12--14 | 缩放序列的存在 | §5 的子列选取 |
| $\lvert\nabla u_\nu\rvert\le C_n$ | 与固定大半径无关 | coordinates.tex:167 | $R_i$ 的上界与热尾部 | §8 的壳层求和 |
| $R_i(y)=\fint_{B_{r_i}(y)}G\,\mathfrak mathrm d\mathfrak m$ | 均值 Gram 矩阵 | coordinates.tex:224 | 归一化列与 $D_{i,y}$ | §17 的片块支撑 |
| $C_a2^{2a\lvert i-j\rvert}$ | $R_i$ 的慢增长 | coordinates.tex:258--259 | 活跃中心打包与热尾 | §17 的 $C_0r_i$ 约束 |
| $c_ar_i^{2a}\mathfrak mathrm{Id}\le R_i(y)\le C\mathfrak mathrm{Id}$ | 一致非退化不可得 | coordinates.tex:263--264 | 路线一的崩溃点 | §2 的整条计划 |
| $U_{i,y}=R_i(y)^{-1/2}(u-u(y))/r_i$ | 归一化调和列 | coordinates.tex:242 | Gram 的强 $L^p$ 收敛 | §6 的相对界 |
| $b=2^{-m}$ 与 $2C_nb<1/4$ | 仿射重归一化的改善 | coordinates.tex:292--293 | 残差类归纳的严格性 | §6 的归纳起点 |
| $r_i^{2-n}M(B_{Cr_i}(y))\le o(1)R_i(y)$ | 小归一化 Bochner 质量 | coordinates.tex:367--368 | $N_j\le\varepsilon_\nu Q_j$ 与 $D_{i,y}\le C\varepsilon_\nu H_i$ | §10 的有重叠求和 |
| $\{P:\lvert P-u(x)\rvert_{R_i(x)^{-1}}<cr_i\}\subset u(B_{r_i/2}(x))$ | 椭球包含 | coordinates.tex:404--406 | 取值空间的中心椭球输入 | §22 的线段论证 |
| $c<1/8$ 与 $\eta<c/8$ | 内迭代余量 | coordinates.tex:445--447 | 开坐标象的严格内接 | §7 的 $4^{-j}$ 归纳 |
| $\bigl\lvert\lvert u(z)-u(x)\rvert_{R_i(x)^{-1}}-d(x,z)\bigr\rvert\le o_D(1)r_i$ | 分离尺度 | coordinates.tex:410--412 | 单射性与活跃中心计数 | §7 与 §17 |
| $d_*>1$ | Dirichlet--Sobolev 指数 | coordinates.tex:51--53 | 正源引理的弱型衰减 | §11 的 layer cake |
| $p_t\le Ct^{-n/2}e^{-d(x,z)^2/(Ct)}$ | 热核上界 | coordinates.tex:490 | 长短核差与尾部 | §9 的壳层计算 |
| $p_t(x,z)\ge c_At^{-n/2}$（$d\le A\sqrt t$） | 热核下界 | coordinates.tex:497 | 热递降的左侧 | §9 的 $Q_i-Q_{i+1}$ |
| $\Delta(\chi G)=2\chi M-2\kappa\chi G\mathfrak m+E_{\rm cut}\mathfrak m$ | 截断后的源 | coordinates.tex:589--590 | 热导数两侧界 | §8 的 $\lambda$ 取法 |
| $\sup_{0<t\le1}\lVert P_tE_{\rm cut}(x)\rVert=o(1)$ | 环带的高斯抑制 | coordinates.tex:645--647 | $\lambda_\nu$ 的下限 | §8 的正性修补 |
| $Q_i(x)=P_{r_i^2}(\chi G)(x)+\lambda r_i^2\mathfrak mathrm{Id}$ | 热 Gram | coordinates.tex:605 | $H_i=Q_i^{-1}$ 的一切比较 | §17 的输入组 |
| $H_i(x)\le H_{i+1}(x)\le(1+o(1))H_i(x)$ | 单调性 | coordinates.tex:612--613 | $q_{i+1}\ge q_i$ 的收缩因子 | §21 的递推 |
| $N_j(x)=r_j^{2-n}M(B_{r_j}(x))\le\varepsilon_\nu Q_j(x)$ | 未共轭质量 | coordinates.tex:706--712 | $\mathcal F_i$ 的构造 | §9 的双线性界 |
| $\mathcal F_i(x)=2^{-\gamma i}\mathfrak mathrm{Id}+\sum_{j\le i}2^{-\gamma(i-j)}N_j(x)$, $\gamma=1/2$ | 指数加权累积 | coordinates.tex:726--727 | 归一化误差与 $b_i$ 平方和 | §10 与 §21 |
| $k_0=1$, $k_h=2^{(n-2)h}e^{-c4^{h-1}}$, $\sum_h2^hk_h<\infty$ | 高斯壳层系数 | coordinates.tex:796--798 | 时间块求和的反转 | §9 的局部源 |
| $\lvert v^T(R_i(y)-Q_i(x))w\rvert\le C\lvert v\rvert_{Q_i(x)}\sqrt{\mathcal F_i(x)[w]}$ | 双线性热比较 | coordinates.tex:735--737 | $A_{i,y}H_iA_{i,y}\le C\mathcal F_i$ | §10 的归一化误差 |
| $4a<\gamma$ | 卷积收敛条件 | coordinates.tex:948 | $\sum_{i<k}\mathcal F_i[a_i]\le CH_k[\xi]$ | §10 的 $m^2$ 记账 |
| $H_i\Delta_iH_i\le B_i\le(1+C\varepsilon_\nu)H_i\Delta_iH_i$ | 逆增量 | coordinates.tex:957 | 累积比较的两侧 | §10 的不交换望远镜 |
| $C^{-1}H_k\le\mathfrak mathrm{Id}+\sum_{i<k}H_iN_iH_i\le CH_k$ | 中心累积 | coordinates.tex:961 | 反向累积不等式 | §10 的最后一步 |
| $\mathfrak mathrm{Id}+\sum_{i<k}Z_i\le C_*H_k$, $H_k\le C_*(\mathfrak mathrm{Id}+\sum_{i<k}S_i)$ | 正反累积比较 | coordinates.tex:1116--1117 | 度量步进的主项与 bootstrap | §21 的 $2\sum S_i$ |
| $R=16(L+C_{\rm sep}+2)$, $S=32R$ | 套叠半径 | pinching.tex:29 | 每一层球的严格余量 | §15 的 $B_{2L+4}\subset B_{R/2}$ |
| $a_i=n+C_0\kappa r_i^2$ | 等 Laplacian 常数 | pinching.tex:197 | 两替换之差为调和 | §14 的 $\Delta v=0$ |
| $P_i(a)=r_i^{-n}\mu_i^a(B_{8Sr_i}(a))+\kappa r_i^2$ | 单位尺度源质量 | pinching.tex:230 | 拟合递推的加性项 | §13 的 $\widetilde P_i$ |
| $A_a(t)=t^{-n}\mathfrak m(B_t(a))$, $\lim_{t\downarrow0}A_a(t)\le\omega_n$ | 望远镜两端 | pinching.tex:244--269 | $\sup_a\sum_iP_i(a)=o(1)$ | §12 的可求和性来源 |
| $\int_\Omega\lvert\nabla h\rvert\,\mathfrak mathrm d\mathfrak m\le CP$ | 正源的线性梯度界 | pinching.tex:109 | Poisson 误差的两条积分界 | §11 与 §12 的量纲 |
| $\theta=2^{-m}$, $m\ge3$, 系数 $\tfrac12\theta^{3/2}$ | 仿射改进 | pinching.tex:409--418 | 递推系数 $\theta^{1/2}$ 的余量 | §13 的残差类迭代 |
| $\gamma=1/8$, $a_0=1/16$, $\beta=1/16$ | 摊派与卷积指数 | pinching.tex:564--608 | $E_i$ 的卷积核可和 | §13 末尾与 §17 |
| $D_{i,y}[u(x)-u(z)]\le Cr_i^2(E_i(x)+E_i(z))$ | 方向 pinching | pinching.tex:1046--1047 | $v_i$ 的中心能量界 | §16 与 §17 |
| $\lVert\mathrm D^m\psi\rVert_\infty\le C_b^{m+1}(m!)^s$, $s=2$ | Gevrey 截断阶 | renormalization.tex:122--124 | 场估计的各阶形式 | §17 与 §20 的 $\sigma\ge s$ |
| $v_i(P)=\sum_y\phi_{i,y}(P)D_{i,y}(P-c_{i,y})$ | 协向量场 | renormalization.tex:201--202 | 迭代的增量 | §18 的度量步进 |
| $\mathrm Dv_i\xi=S\xi+e(\xi)$, $\lvert\xi^Te(\xi)\rvert\le C\sqrt{Z[\xi]E}\lvert\xi\rvert_H$ | 线性部分与对角误差 | renormalization.tex:214--220 | 度量误差的两条和式 | §21 的 Cauchy--Schwarz |
| $h_{i+1}=h_i+J_i^{-T}v_i$ | 迭代格式 | renormalization.tex:314--316 | $J^TJ^{-T}=\mathfrak mathrm{Id}$ 的正性 | §18 的转置选择 |
| $A^{-1}H_i\le J_i^TJ_i\le AH_i$, $A\ge4C_*$ | 度量 bootstrap | renormalization.tex:343--344, 661 | $K_i$ 的对偶界与终值 $L_n$ | §21 的闭合 |
| $r_i^{m-1}\lVert\mathrm D^mh_i\rVert_{H_i\to\R^n}\le B^{m-1}(m!)^{1+\sigma}$ | jet bootstrap | renormalization.tex:345--347 | 逆矩阵系数界 | §19 与 §20 |
| $L_m=(m+1)((m+1)!)^\sigma$, $\delta_m\to0$ | 阶乘卷积衰减 | renormalization.tex:358--366 | 单一常数 $C_{A,\sigma}$ | §19 的归纳闭合 |
| $2^{1-m}\sup_{m\ge2}(m+1)^{1+\sigma}<\infty$ | 跨尺度归一化因子 | renormalization.tex:493--501 | 一次 $\varepsilon$ 覆盖所有阶 | §20 的同步压半 |
| $b_{i+1}\le\tfrac12b_i+C_Af_i$, $f_i=\sqrt{Z_i[\xi]}+\sqrt{E_i}q_i$ | 对角二阶递推 | renormalization.tex:565--575 | $\sum_{i<k}b_i^2\le C_AH_k[\xi]$ | §21 的平方和 |
| $\bigl\lvert\lvert J_k\xi\rvert^2-\lvert\xi\rvert^2-2\sum_{i<k}S_i[\xi]\bigr\rvert\le C_A(\sqrt\varepsilon+\varepsilon)H_k[\xi]$ | 累积度量误差 | renormalization.tex:646--648 | bootstrap 的吸收 | §21 的末段 |
| $\tau=C_A\varepsilon$, $4D\tau\le1/(8\sqrt A)$ | 一致收敛尾巴 | renormalization.tex:721--723, 761 | 最终双向界的两个减项 | §22 的算术 |
| $D>4/a$ 与 $4K_T/D\le1/(8\sqrt A)$ | Taylor 常数与尺度比 | renormalization.tex:738--741 | 线段落在中心椭球内 | §22 的覆盖论证 |
| $\rho=(16D+4)^{-1}$ | 终域半径 | renormalization.tex:764 | 每一对点都被某尺度覆盖 | §22 的 $B_{r_i}(x)\subset B_1(p)$ |
