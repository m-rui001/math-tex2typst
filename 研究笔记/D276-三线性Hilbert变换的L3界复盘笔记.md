# D276 三线性Hilbert变换的 $L^3$ 界：尺度吸收的复盘笔记

## §0 登记、对象与取证范围

本笔记的处理对象是一篇预印本，题目为 An $L^3$ bound for the trilinear Hilbert transform（build/paper.tex:3），署名 OpenAI（build/paper.tex:4），落款日期 October 5, 2026（build/paper.tex:5），学科分类 42B20、42B25、11B30（build/paper.tex:6），关键词列了三线性Hilbert变换、二次相位、Gowers 范数、多线性奇异积分四项（build/paper.tex:7）。摘要只有两行：斜率取固定的 $1,2,3$ 时，三线性Hilbert变换把 $L^3(\mathbb R)\times L^3(\mathbb R)\times L^3(\mathbb R)$ 映到 $L^1(\mathbb R)$，从而确认了三线性Hilbert变换猜想在这一组指标下的情形（build/paper.tex:10-13）。

正文素材全部来自 build 目录下的 `.tex`。我先把结构量了一遍：build 根下是 paper.tex（983 字节）、preamble.tex（1765 字节）、references.bib 与两个图文件，正文分十个 section 放在 sections/ 下，字节数分别约为 introduction 5216、outer 8424、compression 28814、charts 55144、base 42883、localization 54930、sides 42220、linearization 56761、counting 48143、completion 11527，合计 356810，和派单给的 bytes=356810 严格一致。build 下没有 source/ 版式，sections/ 就是唯一主干。

取证范围的诚实交代：introduction.tex 与 outer.tex 我读了全文；compression.tex 读了前 130 行，Compression 引理（273 行起）与 Height bins 引理（555 行起）的原文是用带行号的模式匹配抓到的；charts.tex 读了 1-100 行和 690-764 行；completion.tex 读了 1-160 行（全文约 260 行，尾部没有覆盖到）；base.tex、localization.tex、linearization.tex、sides.tex、counting.tex 我只掌握了各节标题、全部定理环境的行号分布，以及从四个 proposition 检索块和四个关键引理检索块里抓出的陈述节选。对这五节内部证明的叙述属于按陈述加引言纲领的反推，凡我落不到具体行号的细节，都会以 [推测] 标注，并把能站住的行号全部登记进文末台账。

引言给出的一条约定值得先记下：全文用 progression 坐标 $y_j=x+jt$，$0\le j\le3$（build/sections/introduction.tex:92-93），把主值积分里的移位从 $x-jt$ 换成 $x+jt$ 只改变算子符号，代换是 $t\mapsto-t$（build/sections/introduction.tex:94-96）。另外所有深度树都是有限的，但常数要对树的深度一致（build/sections/introduction.tex:100-102），这句话其实是整机设计的总纲：任何一步估计都不许吃深度的份数。

本节末尾挂双登记两条：

登记一：取材目录完整名 preprints/An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026
登记二：队列行号 其他队列第 100 行号

## §1 初始动机：消去向量逼出的二次持续

我把问题摆回最早的样子。对 Schwartz 函数 $f_1,f_2,f_3:\mathbb R\to\mathbb C$，

$$
T(f_1,f_2,f_3)(x)=\operatorname{p.v.}\int_{\mathbb R} f_1(x-t)f_2(x-2t)f_3(x-3t)\,\frac{dt}{t},
$$

主值在原点对称挖去区间（build/sections/introduction.tex:2-8）。要证的是存在有限常数 $C$ 使 $\lVert T(f_1,f_2,f_3)\rVert_{L^1(\mathbb R)}\le C\prod_{j=1}^3\lVert f_j\rVert_{L^3(\mathbb R)}$，并由此得到 $T$ 从三份 $L^3$ 到 $L^1$ 的唯一有界三线性扩张，这就是全文的主定理 thm:main（build/sections/introduction.tex:11-20）。双线性版本由 Lacey 和 Thiele 处理过（build/sections/introduction.tex:29），所以合理的起点是问：把双线性证明里已经有的武器再磨一遍，够不够啃下三线性。

不够，卡点被引言用一个非常具体的代数事实钉住了。取 $c=(-1,3,-3,1)$，则对 $a=0,1,2$ 都有 $\sum_{j=0}^3 c_j(x+jt)^a=0$（build/sections/introduction.tex:31-35）。这是四阶差分算子 annihilate 二次以下多项式的老事实，但在这里它的含义很刺眼：一旦调制里带上二次相位，并且相位与斜率构型匹配，沿着 $x+jt$ 这条 progression 求和时，本该提供消去的差分恰好把该相位的每一阶都清零。于是双线性理论里“尺度间几乎正交”的直觉在三线性场合失去担保：匹配好的二次调制可以在对应的四线性形式里跨尺度持续存活（build/sections/introduction.tex:36-37）。引言紧接着给出要求：某一个尺度上拿到的定量信息，必须被组织成这样的形态，让这种持续性不至于吃掉一份正比于尺度个数的损失（build/sections/introduction.tex:37-39）。

再看文献坐标。Tao 在 2015 年对截断多线性 Hilbert 变换拿到了消去，把初等的对数截断界改进到亚对数量级（build/sections/introduction.tex:40-42），那条路线建立了与高阶一致性的联系；Hu 与 Lie 的记录里，直线型三线性有界性问题当时仍然挂着（build/sections/introduction.tex:43-44），他们自己对弯曲变换的结果处理的是另一族振荡来源（build/sections/introduction.tex:45-46）。结构输入则选定 Leng、Sah、Sawhney 的反定理（build/sections/introduction.tex:48-49），本文只用它的二次情形，并且承认反定理本身不会替你把尺度加起来（build/sections/introduction.tex:51-52）。摊开来看，我面对的局面是：单尺度结构有现成定量工具，跨尺度求和整台机器要从零造。

外约化之后问题的定量形态更清楚了。定义局域量 $H_I(z_0,z_1,z_2,z_3)=r^{-2}\int_{\mathbb R^2} w_I(x,t)\prod_{j=0}^3 z_j(x+jt)\,dx\,dt$，其中 $r=\lvert I\rvert$（build/sections/outer.tex:5-7）；再用它定义常数 $C_N(q)$，即满足 $\sum_{I\in\mathcal I}\lvert I\rvert\,\lvert H_I(f_0,f_1,f_2,f_3)\rvert\le C_N\int_{\mathbb R}\prod_{j=0}^3 M_q f_j$ 的最小值，其中求和族 $\mathcal I$ 落在至多 $N$ 个连续深度里（build/sections/outer.tex:43-52）。初等做法能给的只有 $C_N\lesssim N$：把局部 $L^2$ 范数放到局部 $L^q$ 范数之下，再对每个深度上互不相交的区间求和即可（build/sections/outer.tex:52-56）。线性地在 $N$ 里发散，这正是“持续性吃掉尺度个数”的量化体现，也是整场战斗要击倒的靶子。

## §2 最先撞的三堵墙：我按依赖顺序复盘的三条死路

说明在前：论文没有回忆研究史，下面三条路线的先后是我根据技术依赖关系反推的重建，凡超出文本直接证据的心理戏都用 [推测] 圈出来。[推测] 存在的理由：素材里只有成品结构，没有草稿层，任何关于路线生死的叙述都只能由“哪些引理被哪些命题消费”倒推出大致顺序。

第一条死路：把双线性证明的整体策略平移过来。双线性理论里，树策略加 almost orthogonality 之所以够用，是因为消去向量长度只有 2，任何二次以上相位都会在一阶差分上留下非零振荡，尺度求和自带节省。三线性一上来就有 §1 那个 $c=(-1,3,-3,1)$，差分把二次以下全部清零，平移过来的正交性论证在“哪些尺度对可以同时强”这个层面完全失明。文本给出的对应证据是引言强调的：跨尺度消去与二次调制的相互作用才是真正的困难（build/sections/introduction.tex:30-31）。[推测] 我预期任何纯一阶时频分析都到这里为止，之后的每一步都必须携带结构信息，这是外约化之前就能预判的。

第二条死路：拿 Tao 的亚对数消去硬熬。截断版本的界形如 $\log$ 的负幂乘以 $\log N$，亚对数改进给出的仍是 $(\log N)^{-\alpha}\cdot\log N$ 型余量（build/sections/introduction.tex:40-42 只记录了改进到亚对数量级这一事实，具体阶我未取证，[推测] 其形式即此）。要让 $\sum_{n\le N}$ 的求和收敛，需要的是每个尺度对贡献携带正幂衰减，亚对数余量填不平线性份数。更硬的理由来自 §1 外约化的常数 $C_N$：目标改写成 $C_N$ 对 $N$ 一致有界（build/sections/outer.tex:58-61），这要求某种自举结构，单点改进截断阶数永远到不了。[推测] 这条路的死亡促使我把问题从“估截断”改成“证一个对 $N$ 一致的递归不等式”，也就是 §3 的转折。

第三条死路：幻想直接引用反定理打包。Leng--Sah--Sawhney 是离散区间 $[L]$ 上的 $U^3$ 反定理（build/sections/charts.tex:697-713 的转述版本），而这里的工作区间是连续区间、见证函数只有一致有界性、还带着 Gevrey 型导数界；三处不匹配每一处都要补。引言对此的措辞相当克制：本文“证明了奇积分需要的连续 chart 与局域化陈述”（build/sections/introduction.tex:49-51），这半句话背后是一整节 charts 的工程量。第二处更隐蔽：就算单个尺度的结构拿到了，不同尺度的 chart 系数若落在互相纠缠的坐标里，投影算子的乘积根本不可控。[推测] 这一步的失败应该发生得比第三处的计数问题更早，因为它决定基础设施选型。引言第一特征给出的回应是“私有正交坐标让每个被选中列的系数可恢复”（build/sections/introduction.tex:55-56），配套引理 lem:compression 控制的正是继承投影的乘积（build/sections/introduction.tex:56-57）。

第三条路上还挂着一个我最初拒绝面对的约束：引言论证里“一个公共预算的列尺寸、反私有坐标尺寸、沿空间路径可用标号数的对数的幂”作为损失出现，而“不相交分支上的标号总数不受限”（build/sections/introduction.tex:57-60）。一开始我想把标号数直接拿几何级数吃掉，被这个不对称打回来了：预算是路径上的出生数上限，写在 compression.tex:100-106 的第三条 $\sum_{v}\mathbf 1_{J_v}(y)\le D$ 上，它明确允许不相交分支无限多标号（build/sections/compression.tex:107-110）。放弃全局有限幻想之后，所有计数都必须在“每条路径”层面做，这直接决定了后面所有 stopping 的几何形状。

把三条死路合并起来看，我可以提炼出这个定理若成立必须先有什么。第一，必须存在一种把“尺度”与“结构”分开记账的制度：尺度自由是危险的（持续性定理就在消灭它），结构自由度（有理数据、高度、箱数）是可控的，所以整套机器本质上是把前者的份数换成后者的预算。第二，必须存在一个对深度一致的投影乘积引理，否则任何按细胞选择的构造都会把深度吃进常数；这是硬前提，文本里由 lem:compression 承担（build/sections/compression.tex:273-296）。第三，跨尺度的相干项必须能被某种平方估计接管，否则逐点讨论会退回尺度份数；文本里由 prop:linear-side 的 $G_0\lvert R\rvert$ 平方界与短块比较承担（build/sections/linearization.tex:844、build/sections/sides.tex:102）。第四，最终不等式必须自指，即界里出现正在被界的常数本身，否则没有任何机制把“有限”兑换成“一致有限”；这就是 §3 的 $cC_N$。这四条是外约化写定之后就能列出的存在性清单，[推测] 论文的模块边界与这份清单一一对应，说明架构确实是从缺口反推出来的。

## §3 第一次转折：把有界性改写成自吸收的递归

这一节讲我认为全文最漂亮的一个结构决定：目标定理 $C_N$ 一致有界（build/sections/outer.tex:58-61）没有正面攻，它被换成一个带自我引用项的归一化估计，即 prop:normalized：对合适固定的 $q\in(2,3)$ 和任意充分小的固定 $c>0$，存在与 $N$ 无关的 $A<\infty$，使得当归一化树里每个单元上 $\lVert f_j\rVert_{q,I}\le1$ 时，求和单元的总贡献 $\le(A+cC_N)\lvert I_*\rvert$，其中 $I_*$ 是根（build/sections/outer.tex:68-82）。右端那个 $cC_N$ 用的恰好是左边正在定义的同一族常数，这一步在 outer.tex:84-91 被明说：此时 $C_N$ 已知有限， preliminary 界 $C_N\lesssim N$ 足够。

外约化引理 lem:outer 把闭环写全了（build/sections/outer.tex:93-96），证明第一段是一个纯粹的 stopping 算术：从出现最大区间尺寸的不相交根出发，在每个根 $J$ 记 $a_{j,J}=\lVert f_j\rVert_{q,J}$；沿下降方向停在第一个使某个平均值超过 $16a_{j,J}^q$ 的真后代上；对固定 $j$ 首次停止集合的总长 $\le\lvert J\rvert/16$，四路并集 $\le\lvert J\rvert/4$；中间树上把 $f_j$ 除以 $16^{1/q}a_{j,J}$ 就归一，prop:normalized 给出该树贡献 $\le 16^{4/q}(A+cC_N)\lvert J\rvert\prod_j a_{j,J}$；补集 $E_J=J\setminus\bigcup J'$ 测度 $\ge3\lvert J\rvert/4$ 且在其上 $M_qf_j\ge a_{j,J}$，于是 $\sum_J\lvert J\rvert\prod_j a_{j,J}\le\frac43\int\prod_j M_qf_j$，取上确界得 $C_N\le CA+CcC_N$，选 $c$ 使 $Cc<1/2$ 吸收（build/sections/outer.tex:97-122）。

我在这个设计上停留久一点，因为它规定了后面每一节的“汇率”。整个长构造必须把误差分成两类：一类是系数可以任意小的 $C_N$ 倍项，一类是绝对量级 $A$ 型项；引言第三特征说的“正幂密度节省”（build/sections/introduction.tex:74-76）、短块比较里“指数随辅助指标趋于零而趋于零”（build/sections/introduction.tex:65-68）、最终 completion 里出现的 $(1+C_N)P^{-1/2}G_0(K+2)^{C_{19}(q-2)}$（build/sections/completion.tex:108-113），全是同一汇率的兑现：所有带 $C_N$ 的系数要能被 $P^{-1/2}$ 这类可调小因子压住。[推测] 先写下 $(A+cC_N)$ 的目标形态、再倒推每个模块允许的误差类别，应该发生在机器搭建之前，否则“小系数 $c$”在叙事里不会以原始常数的身份出现。

lem:outer 的第二段负责将离散外约化接回连续算子，读的时候我觉得这是全文最轻松的一段，但轻松是假的：构造的核心是取奇 Gevrey 函数 $\phi$ 使 $\phi^{(3)}(0)\ne0$、取紧致支撑 Gevrey 函数 $\omega$ 使 $\sum_m\omega(X-m)=1$，再令 $W(X,S)=\prod_{j=0}^3(\partial_S-j\partial_X)[\omega(X)\phi(S)]$（build/sections/outer.tex:124-131）。每个因子恰好是沿对应积分直线 $X=u-jS$ 的求导，所以紧致支撑自动让 $W$ 的四个单点边缘全部消失（build/sections/outer.tex:132-134），这正是 admissible 核第二条消去条件（build/sections/outer.tex:14-16）的免费兑现；空间求和换元后得到 $\sum_m W(x/a-m,t/a)=\phi^{(4)}(t/a)$ 与 $\int_0^\infty\phi^{(4)}(t/a)\,da/a^2=-\phi^{(3)}(0)/t$（build/sections/outer.tex:135-140）。尺度写 $a=b2^n$、$1\le b<2$，对每个固定 $b$ 把核装进 $r^{-1}w_I$ 形态，用固定有限的一族平移格、边界偏移 $0,r/3,-r/3$、深度交替符号保嵌套（build/sections/outer.tex:144-152）；最后奇性配对、控制收敛、反射补符号（build/sections/outer.tex:171-181）。四线性 $M_q$ 乘积到三线性 $L^3$ 范数的还原用的是 $q<3$ 时 $M_q$ 在 $L^3$ 上有界加三指标 Hölder（build/sections/outer.tex:161-165）。

[推测] 把 admissibility 的消去条件设计成“四方向导数乘积”的副产品，是一次事后诸葛亮式的胜利：核类允许任意深度、任意格、逐区间独立取符号（build/sections/outer.tex:2-9, 20-23），这些自由度都是为了喂给后面的停止构造；而 Gevrey 取代解析的选择，则与 §5 的原子导数界 $H^{c_0(n+1)}(n+1)^{c_0(n+1)}$ 型增长同族。这一段我只在 outer.tex 与 charts.tex 见过两处导数约定，没去重建 Gevrey 阶数的选择史，材料不足。

探针行：本行用于校验落盘机制是否生效，追加后字节数应增大。

## §4 第二次转折：私有坐标、列系统与压缩引理

死路三留下的工程任务是：造一套投影语言，使得“把同一批列反复投影下去”这件事的损失只依赖公共预算 $D$ 和投影个数 $m$，对深度、总标号数、行细胞分布全部一致。compression.tex 前 130 行把基础设施铺开。数值空间取 $\mathcal H=\mathbb C\oplus\ell^2(\mathcal V)$（build/sections/compression.tex:88-90），每个标号 $v$ 有出生细胞 $J_v$、标量函数 $\varphi_v$ 和质量 $\epsilon_v>0$，列定义为 $\Phi_v(y)=(\varphi_v(y),\sqrt{\epsilon_v}\,\mathbf e_v)$（build/sections/compression.tex:91-95）。关键一句：即便两个标量函数 $\varphi_v$ 完全重合，每个标号也占据自己那条私有方向（build/sections/compression.tex:96-97）。这一设计解决的问题很具体：在普通函数张成的空间里做正交投影，系数是内积商，列与列线性相关时系数不可恢复；把标量部分和私有正交部分打包后，Gram 矩阵对角占优可控，被选中列的系数就能从列值里读出来，这正是引言“系数可恢复”的技术兑现（build/sections/introduction.tex:55-56）。

预算 $D\ge2$ 的三条硬条件写在 build/sections/compression.tex:100-106：$\lVert\Phi_v\rVert_{L^\infty(J_v;\mathcal H)}\le D$、$\sqrt{\epsilon_v}\ge D^{-1}$、沿几乎所有空间点出生标号数 $\sum_v\mathbf 1_{J_v}(y)\le D$。我注意第二条很久了：$\sqrt{\epsilon_v}\ge D^{-1}$ 给私有坐标一个统一下界，于是列的私有部分不许退化，质量 $\epsilon_v$ 太小的标号等于被排除在系统外；[推测] 这是把“可用的结构成分”与“背景噪声”分开的开关，后面 linearization 的幅度分箱和 top count 里 $\sigma_j^{-2}$ 的负幂（build/sections/linearization.tex:1246-1248）应当就是吃这条下界的。mask 族继承性 $\mathcal V^i(I)\subset\mathcal V^i(I')$（build/sections/compression.tex:112-117）保证细化分割上投影值域嵌套（build/sections/compression.tex:122-130），于是停止分割 $P_\pi^i$ 与更细的 $P_{\pi'}^i$ 是相容的投影塔。

核心引擎是 Compression 引理（build/sections/compression.tex:273-295，原文由模式匹配抓得）。输入：一族继承 mask 的局部正交投影 $P^1,\ldots,P^m$，以及满足平方和压缩 $\sum_\nu\lVert B_\nu z\rVert_{\mathcal Y_\nu}^2\le\lVert z\rVert_{L^2(J;\mathcal H)}^2$、且每个 $B_\nu$ 支撑在树的一个细胞 $u(\nu)$ 上的有界行算子族。结论：

$$
\Bigl(\sum_\nu\bigl\lVert B_\nu\, P^m_{u(\nu)}\cdots P^1_{u(\nu)}z\bigr\rVert^2\Bigr)^{1/2}
\le\bigl(C(m+1)^C\log(2D)\bigr)^{C(m+1)}\lVert z\rVert_{L^2(J;\mathcal H)},
$$

对行细胞、总标号数、空间深度数一致（build/sections/compression.tex:293-294），含补因子 $1-P^i$ 的乘积改常数后同形（build/sections/compression.tex:295-296）。损失形态值得咀嚼：$\log(2D)$ 只是多项式里的一个乘子，整个界对 $D$ 是准多项式（引言原文说损失是“公共预算的对数的幂”，build/sections/introduction.tex:57-59，与此吻合）；而对投影个数 $m$ 是 $m^{m}$ 级，所以 $m$ 必须被别的机制压成绝对常数，[推测] 这就是为什么 completion 的停止层里深度块长 $K$、滚动投影层数都受控（build/sections/completion.tex:135-137），$m$ 的增长本身是预算参数之一。

另一件我起初没意识到的事：这套系统对“分支”的态度。标号路径上限 $\le D$、不相交分支不限（build/sections/compression.tex:107-110），配合 packing 引理：若每次构造在每个根 $R$ 上派生的新根满足 $\sum\lvert R'\rvert\le\rho\lvert R\rvert$、$\rho<1$，那么包括原始根在内所有新根总长 $\le\lvert J\rvert/(1-\rho)$，于是每次贡献 $\le A\lvert R\rvert$ 的构造全局贡献 $\le A\lvert J\rvert/(1-\rho)$（build/sections/compression.tex:43-61）。这条几何级数引理加 Tonelli 换序 $\sum_I\lvert I\rvert a_I=\int_J\sum_{I\ni y}a_I\,dy\le A\lvert J\rvert$（build/sections/compression.tex:29-41），就是“沿路径计数、按长度结算”的全部会计制度。[推测] 三线性理论里分支几何天然爆炸（每尺度每列都分裂），把预算全部压在单条路径上、由 packing 引理统一结算，我认为是让压缩引理对深度一致的唯一可行会计方案。

Height bins 引理补上有理高度的分箱算术（build/sections/compression.tex:555-577，原文抓自模式匹配）：给定 $\xi\in\mathbb R^d$，考察 $\{\lvert a\cdot\xi\rvert: a\in\mathbb Q^d,\ \text{height}(a)\le B,\ a\cdot\xi\ne0\}$，其 $\log_2$ 像包含在至多 $d$ 个长度为 $C(d+1)^3\log(2B)$ 的区间并里，因而命中的二进幅度箱至多 $C(d+1)^4\log(2B)$ 个（build/sections/compression.tex:563-567）。第二条对形如 $r_n^\ell v\in[\alpha,\beta]$ 的刻度计数给了同样的对数界（build/sections/compression.tex:568-574）。[推测] 这类陈述是后面 charts 的 Weyl 分箱与 counting 的尺度分离（$\mu,\nu$ 密度参数）之间咬合的齿：有理数据的高度只花对数量级的箱数，这是“准多项式预算”能够闭合的原因之一。

## §5 第三次转折：单尺度结构需要连续版和 Hahn--Banach

charts 一节开头就把本节的目标说破了：区分 chart 的复杂度与它的真实振荡参数，后者永远不封顶，本节所有常数对这两个量一致（build/sections/charts.tex:3-7）。路线图四步：尺度上的 Weyl 二择一加 Fourier 展开，与沿 progression 的代数分离恒等式结合，得到单尺度分离矩；把离散二次反定理移植成有界连续见证；用 Hahn--Banach 分解有界输入；把分解用于两个对立输入，将局部探测归约到已得的分离矩（build/sections/charts.tex:9-15）。

原子形态是二次 chart 原子 $\varphi(y)=e(\lambda y^2+\beta y)\sum_{n\in\mathbb Z^d}\chi(\theta y-n)e((\theta y)^TC(\theta y-n))$（build/sections/charts.tex:28-35，编号 (1)）。$d=0$ 退化回普通二次相位（build/sections/charts.tex:38）；$\lambda,\beta,\theta$ 不受任何限制，受约束的是维数 $d\le\log H$、有理矩阵 $C$ 的高度 $\le H$、$\operatorname{supp}\chi\subset[-H,H]^d$ 以及导数界 $\lVert\partial^\alpha\chi\rVert_\infty\le H^{c_0(\lvert\alpha\rvert+1)}(\lvert\alpha\rvert+1)^{c_0(\lvert\alpha\rvert+1)}$（build/sections/charts.tex:44-51）。这里我看到了私有坐标之外的第二个“解耦”设计：把一切可能爆炸的量（频率、相位参数）赶进不设限的参数，把一切需要计数的量（格点数、有理数据高度、窗口光滑度）锁进复杂度 $H$。[推测] 双线性理论里 modal 分析从不担心这类爆炸，三线性反定理移植一旦失败，第一嫌疑人就是振荡参数混进预算；把二者拆开应该是在连续版反定理第一次编译失败之后被迫做的重构。

运算封闭性给出工程手感：共轭、有界个数原子的乘积、实变量的平移与仿射缩放都保持类 (1)，复杂度只准多项式变化，且平移缩放只影响不设限的振荡参数（build/sections/charts.tex:75-82）。证明里我特别欣赏平移那一步：取 $P$ 使 $PC$ 全整，合法选择是 $d^2$ 个分母的乘积，故 $P\le H^{d^2}$，把平移拆成 $a=m_0+a_0$、$m_0\in P\mathbb Z^d$，重标求和指标即可（build/sections/charts.tex:90-100）。一个不起眼的大小注记：逐点非零求和项至多 $(2H+3)^d$，所以原子 sup 范数对 $H$ 准多项式，除以该界即可归一化（build/sections/charts.tex:70-73）。

外部输入 Leng--Sah--Sawhney 的原文被完整复述在 build/sections/charts.tex:697-713：$1$-有界函数 $f:[L]\to\mathbb C$ 若 $\lVert f\rVert_{U^3[L]}\ge\delta$，则存在二次过滤 nilmanifold、适应过滤的多项式序列与 Lipschitz 函数 $F$，使关联平均的绝对值 $\ge\varepsilon$；维数 $\le C(1+\log(1/\delta))^C$，复杂度、Lipschitz 范数与 $\varepsilon^{-1}$ 都被 $\exp(C(1+\log(1/\delta))^C)$ 吃掉，nilmanifold 带适应过滤的有理 Malcev 基、$\Gamma$ 用第二类整坐标，并且不要求零均值假设（build/sections/charts.tex:714-718 指认这是 LSS 定理 1.2 在 $s=2$ 的特例）。准多项式维数、指数级复杂度，这是全文定量预算的源头之一；注意它只对 $[L]$ 上的离散立方说话。连续替身取 $\mathbb T_{16}=\mathbb R/(16\mathbb Z)$ 上的八次方立方形式范数 $\lVert g\rVert_{\mathcal U}^8$，把 $[0,1)$ 上函数零延拓（build/sections/charts.tex:720-732）；引理 cube-bounds 证明它是半范数、混合立方形式受 $\prod_\omega\lVert g_\omega\rVert_{L^2(\mathbb T_{16})}$ 控制、从而立方形式在 $L^2$ 中连续且 $\lVert g\rVert_{\mathcal U}\le C\lVert g\rVert_{2,[0,1)}$（build/sections/charts.tex:735-747），推导用的是三次迭代立方 Cauchy--Schwarz（build/sections/charts.tex:749-764）。[推测] 固定圆长取 16 是为了让零延拓后的立方网格不越界，细节文本没展开，我不敢断言。

到这里我可以把三次转折串成一条依赖链：自吸收递归规定了误差汇率（§3）；私有坐标与压缩引理规定了投影乘积的代价上限（§4）；解耦了振荡参数的原子类与连续化反定理规定了单尺度结构的形状（§5）。[推测] 缺的还剩两块拼图：把单尺度结构在树上跨尺度对齐的“局域化”，以及把对齐后的核心项真正数出来的“计数”。后文六节就是这两块拼图的分工。

## §6 局域化：四个变量同时弯， adjoint 才不咬人

localization 一节我只有引理名分布和 Proposition 的原文节选，下面的重建以此为锚，缺口标 [推测]。引言给的第二特征先说明动机：曲率的局域化必须同时在四个自变量里做，并且在投影 adjoint 作用于更早的细胞时，保留所需的分离度；把互补滤波器搬运过去会留下耦合的窄带，而短块比较给出的块长幂，其指数随辅助指数降到 $2$ 而趋于 $0$，这对最终吸收必不可少（build/sections/introduction.tex:61-68）。

从节内结构看，机器的装配顺序是八道工序：不同标签的分离（build/sections/localization.tex:75）、短路径上的端点界（build/sections/localization.tex:169）、颜色预算与例外根（build/sections/localization.tex:314）、mask 的包含、闭包与分离（build/sections/localization.tex:407）、可用端点空间的 Bessel 分离（build/sections/localization.tex:530）、一致的同标签检验（build/sections/localization.tex:604）、目录闭包及其预算（build/sections/localization.tex:765）、出门滤波器与近带缺陷（build/sections/localization.tex:971）。[推测] “标签”指代每个细胞上挂的 chart 身份：同标签意味着频率位置受同一个二次多项式约束，跨标签的分离（localization.tex:75）就是让不同标签的细胞对互不打扰；Bessel 分离（localization.tex:530）则说明可用端点空间之间只剩平方可和的重叠，这是把树求和转成能量估计的标准接口。

出口命题 prop:localization 的原文我抓到了（build/sections/localization.tex:867-883）：对形如 eq(11) 的活跃 pattern，存在 $\operatorname{poly}(k)$ 个固定搜索叶，使得在绝对长度加权误差不超过 $Ce^{-k}\lvert R\rvert$ 的意义下，每叶贡献 $\sum_{G\ \mathrm{current}}H_I(Z_{0,G,s},Z_{1,G,s},Z_{2,G,s},Z_{3,G,s})$，其中 $Z_{l,G,s}=\overline L_{l,G,s}\mathcal B_{l,s}z_l$；$\overline L_{l,G,s}$ 是一只正的涂抹球滤子，$\mathcal B_{l,s}$ 是长度 $O(\log\mathcal L)$ 的累计滤子或补因子乘积、与组 $G$ 无关；乘积与槽位选择由搜索叶固定、对细胞一致；每个组只在其实际“当前中心使用”处参与求和；eq(11) 里与 $\eta$ 取最小可以在每叶单独施加（build/sections/localization.tex:873-883）。

三个量级我认为是本节全部风险所在。其一，误差是 $Ce^{-k}$ 型的超多项式小，配 base 节的 $Ce^{-k}$ 替换误差（build/sections/base.tex:547-549）与 counting 的 $O(e^{-k}\lvert R\rvert)$ 尾巴（build/sections/counting.tex:962），说明局域化的损耗被设计成“指数小”，在 §3 汇率下归进绝对项 $A$。其二，$\mathcal B_{l,s}$ 与 $G$ 无关：组相关的信息全部集中在球滤子 $\overline L$ 一只原子里，这条“组-背景分离”让后面 linearization 的平方能量论证只需要盯一只组依赖因子。其三，搜索叶只有 $\operatorname{poly}(k)$ 个：[推测] 叶数是有限分支搜索的产物，正因为每叶的乘积选择固定，才能把四个变量的曲率条件同时解掉；代价是允许指数小误差把不满足严格分离的边界情形扫掉。近带缺陷（localization.tex:971）与引言第二特征的“耦合窄带”呼应，[推测] 它们是互补滤波器搬运失败后残留的组间相关项，在 completion 里以功率 $1$ 单独结算（build/sections/completion.tex:90-92），不进入幂化汇率，这个双轨制我在 §10 再算总账。

## §7 线性化：一份固定模展开换来平方能量与顶计数

linearization 一节标题是“线性化、持续成分与 top”（build/sections/linearization.tex:1），它的存在理由在引言第三特征：每个匹配列只领一份固定的模展开；频率图把误差与相干成分分开，前者平方可和、后者有可继承的代表元（build/sections/introduction.tex:69-73）。“每列一份、终身固定”回应的是我在 §5 末尾提出的问题：跨尺度对齐之后，同一列在不同深度被反复询问，若每层重展一次，展开间的相关性无法计数；固定展开让“询问”退化成线性侧的函数，能量可以一次结清。

节内引理链（仅名字与行号取证）：首次匹配展开与有界提升（build/sections/linearization.tex:143）、例外块与极小有理空间（build/sections/linearization.tex:394）、高度稳定化（build/sections/linearization.tex:439）、好谓词的一致性（build/sections/linearization.tex:552）、进入秩求和（build/sections/linearization.tex:601）、坏密度链（build/sections/linearization.tex:620）、分离模行（build/sections/linearization.tex:694）、与提升及主历史的复合（build/sections/linearization.tex:779）、可继承代表元（build/sections/linearization.tex:1055）、成分尺寸比较（build/sections/linearization.tex:1170）。[推测] 首匹配加提升是标准的“用第一只命中的模代表整列”的写法；例外块与极小有理空间处理 $a\cdot\xi$ 小到无法分箱的频率，呼应 Height bins 的 $\log_2$ 区间结构；坏密度链应当是给 $\mu,\nu$ 双尺度密度参数埋线，counting 里的 $1+\nu+\mu^{-1}+\Lambda$ 预算（build/sections/counting.tex:831）从这些链上取数。

两条出口我都拿到了原文。第一条，prop:linear-side：对每个基本-$B$ 角色、每个保留的 $v_b$-细胞，把线性侧模（含私有坐标）的精确小和记为 $V_{l,G,b}$、不需要输出或证书的分支上置零，则 $\sum_{G,b}\lVert V_{l,G,b}\rVert^2\le G_0\lvert R\rvert$，特别地这些函数一致地（对分支偏移）满足 eq(17) 的平方界（build/sections/linearization.tex:836-848）。第二条，prop:top-count：在任意小相对总长的首次停止切除之后，固定核心角色 $j$、高度 $h\in\mathcal H_{\mathrm{up}}$、类型与幅度二进箱 $\sigma_j\le\sigma_{\mathcal F}<2\sigma_j$，令 $\mathcal A_j^G$ 为该类型在箱内沿路径实际使用的成功成分的不同代表元，则 $\sum_G\lvert\mathcal A_j^G\rvert\le\min(D_*,P^C\sigma_j^{-2})$，指数 $C$ 固定，把 $D_*$ 放大固定幂无害（build/sections/linearization.tex:1236-1252，eq(28)）。

top count 的 $\min$ 结构我觉得最能说明私有坐标何时回本：一路标号数被路径预算 $D_*$ 卡死（§4 第三条），被使用的代表元数又被幅度平方倒数 $P^C\sigma_j^{-2}$ 卡死，后者来自私有方向的 Bessel 型正交：$\sqrt{\epsilon_v}\ge D^{-1}$ 的统一质量下界把“同一幅度箱里能塞多少个互不干扰的成分”变成能量问题。[推测] 这正是 §4 中我对第二条预算的猜想兑现处。$G_0\lvert R\rvert$ 的 $G_0$ 在 completion 的预算表里被限定为 $\exp(C_q(1+\log(2k))^C)$（build/sections/completion.tex:138-140），对 $k$ 是对数准多项式，[推测] 它是 eq(17) 到 eq(19) 整条侧链的栈开销总和。

## §8 计数：分离条件、双密度与一条幂化不等式

counting 一节处理“局域化与线性化之后剩下的核心项到底有多大”。我拿到的最硬材料是稀疏质量引理的输入清单（build/sections/counting.tex:343-365）：四个角色里四个或恰三个是核心角色，记作集合 $J$；参数 $M,L\ge1$、$d\ge0$、$B\ge1$、$0<\mu\le1\le\nu$；每个核心角色带标号集 $\mathcal A_i$，$\lvert\mathcal A_i\rvert\le M$，标号与实数单射认同；尺度序列 $R_s=R_0 2^s$，元组集 $\mathcal E_s\subseteq\prod_{i\in J}\mathcal A_i$、$N_s=\lvert\mathcal E_s\rvert$。假设条件里我数到三条：不同核心角色的两个标号在所有 $\mathcal E_s$ 里至多决定一个完整核心元组，且该标号对的尺度出现次数 $\le L$（build/sections/counting.tex:357-359）；若存在侧角色，则有权重 $w_s\ge0$、$\sum_sw_s\le M$，使尺度 $s$ 上任何固定核心标号的关联元组数 $\le w_s$（build/sections/counting.tex:360-362）；同一核心角色里不同标号在尺度 $s,t$ 出现时满足某种分离不等式（build/sections/counting.tex:363-365 起，原文在我抓取的窗口外被截断，[推测] 形如 $\lvert R_s a-R_t a'\rvert$ 与密度参数 $\mu,\nu$ 挂钩的二进分离）。

出口 prop:thin-count 是这一节的仲裁（build/sections/counting.tex:821-836，eq(34)）：存在绝对 $p_0\in(0,1)$，以及 $L_0\le P^C(1+\log(\nu/\mu))^C$，使得 $\sum_sN_s^G\le L_0\min_{i\ne j}M_i^GM_j^G$，同时 $\sum_s(N_s^G)^{p_0}\le P^C(1+\nu+\mu^{-1}+\Lambda)^C(M')^{2p_0}$；全部指数绝对，与路径、组、水平维数、深度数无关。第一条是“对两角色定点”的经典双计数：选两个核心角色固定其标号，其余角色被元组条件唯一决定，$\min_{i\ne j}M_iM_j$ 就是这种钉住法的账面；第二条则是幂化版本，正是 §3 汇率要的正幂衰减来源之一。引言对应句：lem:finite-sparse-count 给小密度尺度上的 progression 检验总质量一个密度的正幂节省，应用时要用满四个锚消去与多项式维数代价（build/sections/introduction.tex:73-78）。[推测] “四个锚”指四个 progression 坐标 $x+jt$，消去即 admissibility 的第二条件沿每条线的边缘为零；密度参数 $\mu,\nu$ 分别控制“每个标号能撞多少尺度”与“检验集有多稀”。

核心幂化估计 prop:core-estimate（build/sections/counting.tex:955-970，eq(37)）把账面换算给 completion：存在绝对 $\varepsilon>0$、$C_4<\infty$、$1-\varepsilon>2/3$，eq(11) 局域化展开中含至少三个核心角色的项总贡献 $\le C_q\eta^\varepsilon P^{C_4}\lvert R\rvert+O(e^{-k}\lvert R\rvert)$；原始细胞取最小在次可加估计之前施加；数值误差全部绝对估计；常数对有限深度范围与保留的尝试一致；特别地 $\varepsilon$ 与 $C_4$ 可以在决定 $q$ 离 $2$ 多近之前固定（build/sections/counting.tex:965-969）。这句“先固定 $\varepsilon,C_4$、后选 $q$”的顺序声明与 completion 的非循环性讨论（build/sections/completion.tex:148-160）直接握手，我把它留到 §10 一起算。

[推测] 我猜想过跳过幂化、直接对 $N_s$ 一致有界求和的方案：$\sum_sN_s\le L_0\min M_iM_j$ 本身已对路径结算够用，但带 $\eta$ 最小值的项需要把 $\min\{\eta,N_s\ldots\}$ 换成 $N_s^p$ 的幂和才能吃 $P^{-1/2}$ 型小因子，$\ell^p$ 化必然要 $\sum N_s^p$ 型信息，$p_0$ 就是为此存在；两条不等式一条管绝对项一条管幂化项，缺一不可。

## §9 侧项与短块：把“剩余三个以上侧因子”变成可求和

sides 一节（标题“短深度块与侧项”，build/sections/sides.tex:1）处理局域化展开里那些不全是核心角色的项。引理分布：混合极大（build/sections/sides.tex:22）、短块比较（build/sections/sides.tex:102）、认证端点细胞上的变差（build/sections/sides.tex:483）、侧栈（build/sections/sides.tex:648）、侧估计命题（build/sections/sides.tex:872）。

短块比较 lem:short-block 的输入我抓到了大半（build/sections/sides.tex:102-124）：$2<q<3$；树片以 $R$ 为根，内部求和区间至多跨 $K$ 个连续深度、且仍落在原始 $N$ 深度范围内；叶细胞出现在同一深度块或下一深度；每个槽位上是确定性 Hilbert 值函数 $\mathbf z_j$，在每叶 $L$ 上 $\lVert\mathbf z_j\rVert_{2,L}\le s_j$；随机标量输入 $z_j^\sigma$ 逐点受 $\mathbf z_j$ 控制：$(\mathbb E_\sigma\lvert z_j^\sigma(y)\rvert^a)^{1/a}\le C_a\lVert\mathbf z_j(y)\rVert$，常数与树和 $K$ 无关，至多两份独立 Rademacher 随机化的向量栈乘积自动带此性质；核符号 $\lvert\epsilon_I(\sigma)\rvert\le1$ 任意可测。结论正文被我的抓取窗口截断，但引言给了它的形状：一个块长幂，指数随辅助指数降到 $2$ 而趋于 $0$，此控制对最终吸收 essential（build/sections/introduction.tex:64-68）。

我对这条引理的读法：随机化是侧项之间的人工去相关。侧栈函数在构造里已经互相纠缠（同一条列被多组询问），若直接估计纠缠乘积会丢回尺度份数；引入 Rademacher 符号后，对符号取期望把交叉项打散，剩下的对角部分由每叶 $L^2$ 尺寸 $s_j$ 结算。块长幂指数在 $q\to2^+$ 时归零，[推测] 因为全部损失都来自把 $L^q$ 插值到 $L^2$ 端点的丢失，端点越接近可积性边界丢失越小；于是“选 $q$ 离 2 足够近”从 §3 的一处自由变成了这里的一台产能：$K$ 的固定幂可以压到 $K^{o(1)}$，正是 completion 组合式里 $(K+2)^{C_{19}(q-2)}$ 的出处（build/sections/completion.tex:111）。

侧估计命题 prop:side-estimate（build/sections/sides.tex:872-888）汇成三条账：设 base 与局域化假设、lem:transfer 的助手结论、线性侧平方界 eq(17) 都成立，固定 $p\in(2/3,1)$；经过任意小固定相对总长的公共首穿切除后，（一）含至少三个侧因子的项，在第四因子保持的归一 $L^2$ 尺寸 $\le P^C$ 条件下，长度加权 $p$ 幂总代价 $\le P^C\lvert R\rvert$，这涵盖第四侧、有界当前论证、有界当前论证减侧因子三形态（build/sections/sides.tex:875-881）；（二）恰有两个侧因子且当前粗补全整的项，其冻结误差、大补项、复原误差的 $p$ 幂代价 $\le P^C\lvert R\rvert$，转移后的主项绝对代价 $\le\eta P^C\lvert R\rvert$，数值误差在既定主参数选择下可忽略（build/sections/sides.tex:883-888）。completion 把第二条的流水讲得更透：两核补先换成整段当前局域论证，修正项自动升为至少三侧；对两个整补应用 lem:transfer，转移后再把基本粗部换成全 $Y$ 论证会添出第三只基本侧，余下的恰是 base 已证小的成对项，这就是 prop:side-estimate 的成对小主项（build/sections/completion.tex:81-88）。[推测] 成对小承接 base 一节标题里的两个精度与延迟投影以及 prop:base-reduction 的活跃细胞最小值归约 $M\le D_{\mathrm{base}}^C$（build/sections/base.tex:839-841），即全机最终踩在“至少三份 $L^2$ 预算同现即可求和”这条粗粒度杠杆上；base 内部我未取证到这一句的直接对应行，标记为反推。

## §10 参数顺序与吸收闭合：一台汇率机的总装

completion 一节（build/sections/completion.tex:1-7 声明其任务是收完 prop:normalized）我读了前 160 行。第一轮装配是“一次尝试与其重启”：取 base 的一个归一化段、根 $R$、一份增量层数表、一个活跃 pattern，非初始层的剩余量是 $\sum_{I\text{ active}}\lvert I\rvert\min\{\eta,\lvert H_I(z)\rvert\}$，$\eta=e^{-k^\theta}$，$k$ 是后精度对数、$\theta>0$ 固定（build/sections/completion.tex:8-18，即 eq(11)）。重启纪律我认为是全节最容易被略读过去的设计：停止只从尝试里移除原始求和项，绝不重截或重定义已固定的栈函数（build/sections/completion.tex:32-36）；路径计数与祖先 sup 沿深度递增累加，细胞在其首次越阈处被停（build/sections/completion.tex:36-38）；sides 的凸包估计把块内所有可能需要祖先纳入公共切除之前的保留凸包，极大函数在整只凸包细胞上定义，因此它们的联合帽在 eq(19) 证明用的稀疏余集上依然有效（build/sections/completion.tex:38-42）；大冻结补标志在当前尝试内按幂化误差计费，只有其累计幂代价预算的首次越界才造重启根（build/sections/completion.tex:43-45）。

阈值联立后令首次停止细胞并集 $\le\lvert R\rvert/4$（build/sections/completion.tex:47-54），停止细胞及其下的原始 base 求和项整体移交新尝试，新根上归一尺寸、滚动基本投影界等假设原样成立（build/sections/completion.tex:56-61），于是递归树全部根长 $\le\lvert R\rvert\sum_{n\ge0}4^{-n}=\frac43\lvert R\rvert$，有限深度树上过程终止，或对剩余深度归纳（build/sections/completion.tex:62-68）。§4 的 packing 引理在这里兑现，$\rho=1/4$ 就是它的入参。

保留细胞上的总账（build/sections/completion.tex:70-119）分四类：至少三核心角色，prop:core-estimate 给 $C_q\eta^\varepsilon P^{C_4}\lvert R\rvert+O(e^{-k}\lvert R\rvert)$；至少三侧因子，三只平方尺寸预算在任意固定 $p>2/3$（充分贴近 1）可求和，多项式代价 $P,k$；恰两侧，按 §9 流水归结为成对小主项加三侧修正；近带缺陷与数值误差按功率 $1$ 结算（eq(19)），其余一律吃 $\min\{\eta,a\}\le\eta^{1-p}a^p$，最小值先施加于原始细胞再次可加分裂，$p=1-\varepsilon$，$\varepsilon$ 同时满足三侧估计与 counting 内插（build/sections/completion.tex:77-100）。合并结果：保留细胞上

$$
C_q\Bigl[\eta^{\varepsilon}P^{C_4}+(1+C_N)P^{-1/2}G_0(K+2)^{C_{19}(q-2)}\Bigr]\lvert R\rvert+O(e^{-k}\lvert R\rvert),
$$

固定 $k$ 的多项式因子可先留着、待参数定了并入第一项的 $P$ 幂；转移后尺寸 $\eta P^C\lvert R\rvert$ 的主项在增大 $C_4$、必要时减小 $\varepsilon$ 后一并覆盖；重启只改固定因子（build/sections/completion.tex:108-119）。

预算表把两类复杂度分栏登记：$D_{\mathrm{base}},D_{\mathrm m}$ 只需 $\log D\le C_qk^C$，管主列、颜色、助手及其投影乘积；$D_*$ 与移位高度允许 $\log D_*\le C_q(1+k+P)^C$，管固定线性模、Fourier 截断与图检验；块长 $K\le C_q(1+k+P)^{C_5}$；能量开销 $G_0\le\exp(C_q(1+\log(2k))^C)$（build/sections/completion.tex:121-143）。非循环性的论证（build/sections/completion.tex:148-160）我逐句对过：探测只把精度对数的一个绝对幂改变一个绝对量，来自 clipping 的 $q$ 依赖只是给该对数乘一个 $q$ 相关常数，所以 stagger 指数 $A$ 与质量指数 $\theta$ 可以与 $q$ 无关地先选；主与助目录的秩多项式、计数倍增 $\exp(k^{C_2})$，其对数仍对 $k$ 多项式；mask 与历史的数量以对数方式进入递推，$P$ 垫层也在内，因为 $\log P=O(k)$；eq(13) 的容差含 $n_{r-1}^{-1/2}$，低秩源求和不需要把满计数当额外误差损失。[推测] 最后我对总闭合做一遍我自己的验算：$C_N$ 系数 $P^{-1/2}G_0K^{C_{19}(q-2)}$ 取对数约为 $-\tfrac12\log P+O((\log k)^C)+C_{19}(q-2)\cdot C_5\log P$；由 $\log P=O(k)$，只要 $q-2<1/(4C_5C_{19})$ 该式随 $k$ 一致趋于 $-\infty$，压得过 $c$ 任意小；$\eta^\varepsilon P^{C_4}$ 的对数是 $-k^{\theta\varepsilon}+O(k)$，$A$ 端只需有限上界，故 $\theta\varepsilon$ 不必大于 $1$；这解释了为什么论文允许先定 $\varepsilon,C_4$ 再选 $q$（build/sections/counting.tex:968-969）而把 $k,P$ 的相对增长留到最后。这段验算用了 completion.tex:160 之后我未读到的收尾文字以外的自由推断，[推测] 标记覆盖全部量级排序的最终落点。

## §11 与最初设想的差异，以及我认为仍然敞开的口

复盘至此，最终形态与 §2 三条死路的距离值得摊开说：最初我想“引用一次反定理、逐尺度剥洋葱”；实际交付的是一台三层汇率机，反定理只供应单尺度原料（§5），跨尺度求和被换成带 $cC_N$ 的自吸收递归（§3），投影代价由私有坐标上的压缩引理封顶（§4），计数被双密度加幂化两本账接管（§8），侧项由随机化短块比较按 $q-2$ 产能折价（§9）。差异的根源我体会是两点。其一，匹配二次相位的跨尺度持续性（§1）让任何每尺度独立的计划先天破产，结构信息必须按路径组织，这才有了列系统、mask 继承与路径预算这一整套簿记。其二，$L^3\times L^3\times L^3\to L^1$ 这个端点本身就贴着插值多面体的边界，局部绝对估计的指标条件 $\sum_jp_j^{-1}\le2$ 划出的多面体（build/sections/outer.tex:26-41）里没有内部余量可浪费，才逼出 $cC_N$ 的自反结构：想在一台没有余量的机器里闭合，唯一的办法是让误差项自己引用自己的有限性再吸回去。

敞开的口先列文本自己承认的三个。全文结论只关于写出的那只固定算子（build/sections/introduction.tex:26-27），斜率 $1,2,3$ 与 $c$ 向量的关系没有任何扰动余量分析，[推测] 相邻斜率三元组的方法迁移大概需要重做代数分离恒等式。完整猜想要更宽的指标范围（build/sections/introduction.tex:22-26 指向 Hu--Lie 的 Conjecture 1.7），本文只钉住一个端点。引言末尾说压缩与计数两引理把工具隔离出来，是为同样投影与消去结构的其他 progression 形态准备的（build/sections/introduction.tex:76-78），这是作者自己留的接口。我另加两个观察级问题。其一，$G_0$ 对 $k$ 是对数准多项式（build/sections/completion.tex:138-140），而 $\eta$ 端是 $e^{-k^\theta}$，两条指数标尺的接缝处若 $\theta\varepsilon$ 太小会逼大 $A$，$A$ 的显式依赖在文本里始终是黑箱；我读到 completion.tex:160 为止没有出现 $A$ 的具体编译，[推测] 尾部只是把已有界装进 $A$。其二，Rademacher 随机化只允许至多两份独立栈乘积（build/sections/sides.tex:119-121），[推测] 这说明相关结构在第三份以上失控，三线性恰卡在还能人工去相关的边缘；若要上四线性，去相关预算恐怕要整个更换武器库。

还有一个美学层面的差异：最初我以为反定理的准多项式维数会直接变成算子范数的准多项式依赖，最终形态里反定理只活在单尺度，跨尺度全部改由 $P,k,D$ 的预算表接管（build/sections/completion.tex:121-143），定量结构从“一个定理的指纹”变成“一张参数表”，这是对“定量信息如何穿越尺度”这一问题最朴素也最昂贵的回答。

## §12 自检记录

写法自查按类别执行，本节只报类别名与结果，不逐字复写任何违例串：两字转折连接词类，全文检索命中 $0$；四字过渡套语类，命中 $0$；单字符长停顿号类（含成行分隔号），命中 $0$；图形符号与装饰性强调类，命中 $0$；能力声明与聊天残留类，命中 $0$；小标题复述该节首句类，逐节目视核对，通过。技术自查：行内公式统一单美元定界符，独立公式用双美元行；全文 LF 换行；前向引用只指向本文真实存在的小节（§3、§4、§5、§8、§9、§10 均已落盘）；文末台账是全文唯一一份表头，数据行每行六个竖线，绝对值一律 $\lvert\cdot\rvert$、范数一律 $\lVert\cdot\rVert$、表内数学直接置于美元定界符中、未套反引号、无裸竖线、无空单元格。事实自查：正文引用的每个行号都出自本会话的取证动作（全文读、分段读或带行号的模式匹配抓取）；base、localization、linearization、sides、counting 五节的证明内部未通读，相关叙述均已挂 [推测]；未执行任何版本控制命令；未读取任何 PDF；Write 只用过一次，其余全部为追加式 Edit。

## §13 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $T(f_1,f_2,f_3)$ | 斜率 $1,2,3$ 的主值三线性核 | build/sections/introduction.tex:4 | 全文外约化 | 主定理 thm:main 失去对象 |
| $c=(-1,3,-3,1)$ | 对 $a=0,1,2$ 差分恒零 | build/sections/introduction.tex:32 | 二次调制跨尺度持续性论证 | §1 动机链断裂 |
| $C_N(q)$ | 满足 $\sum\lvert I\rvert\lvert H_I\rvert\le C_N\int\prod M_qf_j$ 的最小常数 | build/sections/outer.tex:46 | 自吸收递归的全局货币 | §3 停止论证与 §10 总账同时失效 |
| $\sum 1/p_j\le2$ | 局部绝对估计的指标多面体 | build/sections/outer.tex:26 | 种子界 $C_N\lesssim N$ | 外约化起点无界 |
| $C_N\lesssim N$ | 初等尺度求和线性损失 | build/sections/outer.tex:53 | 改进基线 | 全文没有需要击败的靶 |
| $2<q<3$ | $M_q$ 在 $L^3$ 有界的窗口 | build/sections/outer.tex:44 | 对偶回收至 $L^1$ 目标 | outer.tex:165 三指数 Hölder 失效 |
| $(A+cC_N)\lvert I_*\rvert$ | 归一化吸收估计的右端形态 | build/sections/outer.tex:80 | prop:normalized 全部构造 | 长机器的汇率规则作废 |
| $16$ | 停止平均值倍增因子 | build/sections/outer.tex:103 | 三个测度界三连 | §3 停止几何全线改账 |
| $Cc<1/2$ | 吸收闭合条件 | build/sections/outer.tex:121 | thm:local 成环 | 递归不等式无法收尾 |
| $\phi^{(3)}(0)\ne0$ | Gevrey 重建非退化 | build/sections/outer.tex:125 | 主值核回收 | 连续算子还原归零 |
| $W(X,S)$ | 四方向导数乘积，四边缘全消 | build/sections/outer.tex:129 | admissibility 第二条免费兑现 | §3 核类前提破 |
| $0,\;r/3,\;-r/3$ | 平移格偏移族 | build/sections/outer.tex:148 | progression 坐标入胞 | 胞覆盖论证断裂 |
| $\mathcal H=\mathbb C\oplus\ell^2(\mathcal V)$ | 私有正交坐标值空间 | build/sections/compression.tex:89 | 列系统与系数恢复 | §4 引擎装不起来 |
| $\Phi_v(y)=(\varphi_v(y),\sqrt{\epsilon_v}\mathbf e_v)$ | 列结构 | build/sections/compression.tex:93 | 投影张成 | 压缩引理前提失效 |
| $D$ | 三重预算：$\lVert\Phi_v\rVert_\infty\le D$、$\sqrt{\epsilon_v}\ge D^{-1}$、路径出生数 $\le D$ | build/sections/compression.tex:101 | 压缩引理的 $\log(2D)$ 损失 | 分支无限性与深度一致性失衡 |
| $(C(m+1)^C\log(2D))^{C(m+1)}$ | 投影乘积压缩损失 | build/sections/compression.tex:291 | 一切继承投影结算 | §4 到 §10 的代价上限重写 |
| $\sum_{I\ni y}a_I\le A$ | 路径界换长度加权 | build/sections/compression.tex:32 | 尝试打包引理 | 全局会计制度失效 |
| $\rho$ | 例外根长度比 | build/sections/compression.tex:49 | 重启几何 $\lvert J\rvert/(1-\rho)$ | 递归总长发散 |
| $C(d+1)^4\log(2B)$ | 有理高度命中二进箱数 | build/sections/compression.tex:566 | 高度分箱 | §5 与 §8 分箱预算爆炸 |
| $e(\lambda y^2+\beta y)\sum\chi(\theta y-n)e((\theta y)^TC(\theta y-n))$ | 二次 chart 原子，编号 (1) | build/sections/charts.tex:31 | 后续全部展开 | 结构类定义坍塌 |
| $H$ | 复杂度预算，$\lambda,\beta,\theta$ 不设限 | build/sections/charts.tex:44 | 准多项式一致性的来源 | 常数将依赖振荡参数 |
| $(2H+3)^d$ | 逐点非零求和项数 | build/sections/charts.tex:70 | 原子归一化 | sup 范数界失联 |
| $P\le H^{d^2}$ | 平移重标整倍数 | build/sections/charts.tex:93 | 运算封闭性 | 平移保持性失效 |
| $\dim\le C(1+\log(1/\delta))^C$ | LSS 二次反定理维数 | build/sections/charts.tex:706 | 连续移植的单尺度原料 | §5 输入丢失 |
| $\lVert g\rVert_{\mathcal U}^8$ | 连续立方替代范数 | build/sections/charts.tex:724 | Hahn--Banach 分解 | 连续端反定理无从陈述 |
| $\mathbb T_{16}$ | 固定圆长 | build/sections/charts.tex:721 | 零延拓归一 | 绝对常数体系重排 |
| $\operatorname{poly}(k)$ 叶与 $Ce^{-k}\lvert R\rvert$ | 局域化搜索叶与误差 | build/sections/localization.tex:870 | prop:localization 的 eq(14) | §6 输出改形、§10 误差类重划 |
| $\overline L_{l,G,s}$ 与 $\mathcal B_{l,s}$ | 正球滤子加与组无关的背景乘积 | build/sections/localization.tex:878 | 线性化平方能量入口 | §7 需对每组重做能量 |
| $\sum_{G,b}\lVert V_{l,G,b}\rVert^2\le G_0\lvert R\rvert$ | 线性侧平方能量 | build/sections/linearization.tex:844 | prop:side-estimate 假设 eq(17) | §9 侧账缺前提 |
| $\min(D_*,P^C\sigma_j^{-2})$ | 顶计数，eq(28) | build/sections/linearization.tex:1248 | 幅度箱求和 | §7 代表元数失控 |
| $p_0\in(0,1)$ | 幂化计数指数 | build/sections/counting.tex:823 | eq(34) 第二条 | §8 幂化轨断线 |
| $L_0\le P^C(1+\log(\nu/\mu))^C$ | 钉住法箱顶 | build/sections/counting.tex:825 | $\sum_sN_s^G\le L_0\min M_iM_j$ | 稀疏质量界失效 |
| $C_q\eta^\varepsilon P^{C_4}\lvert R\rvert+O(e^{-k}\lvert R\rvert)$ | 核心幂化估计，eq(37) | build/sections/counting.tex:962 | §10 总账第一栏 | 合并估计少一条腿 |
| $K$ 块深、叶同块或下一块 | 短块几何 | build/sections/sides.tex:104 | 短块比较 | §9 随机化结算失去舞台 |
| $(\mathbb E_\sigma\lvert z^\sigma\rvert^a)^{1/a}\le C_a\lVert\mathbf z\rVert$ | Rademacher 栈控制 | build/sections/sides.tex:116 | 侧项去相关 | 交叉项打不散 |
| $p\in(2/3,1)$ | 侧幂区间 | build/sections/sides.tex:875 | 三侧可求和性 | §10 幂化汇率错位 |
| $\eta P^C\lvert R\rvert$ | 转移主项绝对代价 | build/sections/sides.tex:887 | 成对小主项流水 | §9 归结链断在 transfer |
| $\eta=e^{-k^\theta}$ | 截断容差，eq(11) | build/sections/completion.tex:14 | 幂化不等式最小值替换 | §10 无小因子可用 |
| $\lvert R\rvert/4$ 与 $\tfrac43\lvert R\rvert$ | 重启阈值与根长和 | build/sections/completion.tex:54 | 尝试递归终止 | 递归树总长失控 |
| $(K+2)^{C_{19}(q-2)}$ | 短块产能进入 $C_N$ 系数 | build/sections/completion.tex:111 | $q\to2^+$ 吸收 | $C_N$ 系数压不到 $c$ 以下 |
| $\log D\le C_qk^C$ 与 $\log D_*\le C_q(1+k+P)^C$ | 两栏复杂度分箱 | build/sections/completion.tex:130 | 参数顺序表 | 主列与固定模预算互相污染 |
| $\log P=O(k)$ | 递推对数入口 | build/sections/completion.tex:157 | 非循环性验算 | §10 参数顺序成环 |
| $\lVert f_j\rVert_{q,I}\le1$ | 树内细胞的归一化条件 | build/sections/outer.tex:74 | prop:normalized 假设端 | §3 去归一化链条源头断裂 |
| $16^{4/q}$ | 归一化除法的补偿因子 | build/sections/outer.tex:109 | 停止树贡献估计 | §3 常数账目错位 |
| $\phi^{(4)}(t/a)$ | 空间求和后的重建核 | build/sections/outer.tex:137 | 主值回收 | §3 连续核还原失效 |
| $(\lvert\alpha\rvert+1)^{c_0(\lvert\alpha\rvert+1)}$ | Gevrey 型导数增长上限 | build/sections/charts.tex:50 | 原子复杂度定义 | §5 光滑类坍塌 |
| $K_0\le k^{O(1)}$ | 高位截断的滞后层数 | build/sections/base.tex:538 | prop:high-truncation 的 eq(9) 替换形态 | §6 局域化输入格式断裂 |
| $\exp(k^{O(1)})$ | 路径计数、逆私有权重、原子复杂度与物理 sup 的统一上限 | build/sections/base.tex:550 | 高位截断结论的预算入账 | §10 预算表失去来源 |
| $M\le D_{\mathrm{base}}^C$ | 活跃族路径重数 | build/sections/base.tex:840 | prop:base-reduction | §9 成对小流水在入口处断 |
| $\sum_s w_s\le M$ | 侧角色权重预算 | build/sections/counting.tex:361 | 稀疏质量引理输入 | §8 侧账缺一整条腿 |
| $\mathcal H_{\mathrm{up}}$ | 上升高度集合 | build/sections/linearization.tex:1241 | 顶计数分箱假设 | §7 高度稳定化无处落脚 |
| $\sigma_j\le\sigma_{\mathcal F}<2\sigma_j$ | 幅度二进箱倍增宽 | build/sections/linearization.tex:1242 | 顶计数逐箱一致 | §7 代表元计数漂移 |
| $G_0\le\exp(C_q(1+\log(2k))^C)$ | 强能量与栈开销 | build/sections/completion.tex:139 | $C_N$ 系数比较 | §10 闭合验算失败 |
| $n_{r-1}^{-1/2}$ | 容差含低秩计数倒平方根 | build/sections/completion.tex:158 | 非循环性计数递推 | §10 参数顺序重新成环 |

### 收束笔记：四种货币的对账

全文可以当作一本汇率手册来读。第一种货币是 $e^{-k}$ 族的超多项式小误差：局域化搜索叶的总损耗 $Ce^{-k}\lvert R\rvert$（build/sections/localization.tex:871）、base 归约里高位替换的绝对误差（build/sections/base.tex:548）、计数幂化估计的尾巴 $O(e^{-k}\lvert R\rvert)$（build/sections/counting.tex:962）。它们共同特征是对精度对数 $k$ 而言衰减快于任何幂，而预算侧对 $k$ 至多准多项式增长，所以这一族误差无条件进 $A$ 栏，不需要任何调参。[推测] completion 尾部大概把三处 $e^{-k}$ 类合并成同一个可忽略项，文本在我未读到的行里应当有一句统一的吸收说明。第二种货币是 $\eta^\varepsilon P^{C_4}=e^{-k^{\theta\varepsilon}+C_4\log P}$，核心幂化估计的主体（build/sections/counting.tex:962）与转移主项 $\eta P^C\lvert R\rvert$（build/sections/sides.tex:887）都铸成这种形状；由 $\log P=O(k)$（build/sections/completion.tex:157），只要 $\theta\varepsilon>0$ 固定，它在 $k$ 增大时先降后稳，给 $A$ 栏供一个有限但可能巨大的数。第三种货币是带 $C_N$ 的系数 $P^{-1/2}G_0(K+2)^{C_{19}(q-2)}$（build/sections/completion.tex:111），取对数约 $-\tfrac12\log P+O((\log k)^C)+C_{19}(q-2)C_5\log P$；先验算给过：$q-2$ 够近时它随 $k$ 一致下降到 $0$，这就是 $cC_N$ 能被吸收的全部理由，也是短块比较把块长幂指数做成 $q-2$ 函数（build/sections/introduction.tex:64-68）的最终动机。第四种货币是重启几何因子 $\rho$：sides 的公共首穿切除（build/sections/sides.tex:876）、linearization 的首停切除（build/sections/linearization.tex:1238）、completion 的 $1/4$ 阈值联立（build/sections/completion.tex:51-54），三处都要求被切掉的根长可以任意小，切完的余集上假设原样复活（build/sections/completion.tex:56-61），由 packing 引理（build/sections/compression.tex:43-61）统一按几何级数结算。四种货币之外若出现第五种误差形状，比如任何正比于 $N$ 的项混进保留细胞估计，闭合立刻死掉；这就是引言那句“某一个尺度上拿到的定量信息，必须被组织起来”（build/sections/introduction.tex:37-39）的准确含义：组织，指的是统一会计币种。

### 方法论沉淀：我准备带走的五条

第一条：端点问题先改写为自吸收递归。当目标不等式没有任何指标余量时（这里的多面体边界写在 build/sections/outer.tex:26），正面硬估必然泄漏份数；把待证常数引入右端、再用停止算术闭合，是把“有限”兑换成“一致有限”的标准铸模。第二条：复杂度与振荡参数分居。原子类 (1) 把 $\lambda,\beta,\theta$ 放逐到不设限区（build/sections/charts.tex:44-53），一切计数只对格点维数、有理高度、窗口光滑度付费；凡证明里出现“对振荡一致”的句子，背后一定有这次分居。第三条：系数要恢复，就补私有正交方向。$\mathcal H=\mathbb C\oplus\ell^2(\mathcal V)$ 的设计（build/sections/compression.tex:88-97）说明：当你的生成元集合天然带冗余与近似相关时，与其做 Gram 矩阵的精细扰动分析，不如花一条私有坐标把相关性问题变成对角问题，代价只是把质量下界 $\sqrt{\epsilon_v}\ge D^{-1}$ 守好。第四条：分支太多时，预算上路径、结算靠打包。$\sum_v\mathbf 1_{J_v}(y)\le D$ 只约束单条空间路径（build/sections/compression.tex:104-110），全局自由度交给长度加权几何级数（build/sections/compression.tex:29-41）；这套会计让“不相交分支上标号无限多”从灾难变成免费。第五条：把一个可调端点做成产能。$q$ 在 $(2,3)$ 里名义上只是可积性窗口（build/sections/outer.tex:44），短块比较却把关键指数的零化承包给 $q\to2^+$（build/sections/introduction.tex:65-68），一个参数的边际自由被榨成吸收机器；凡是证明里出现“指数依赖于 $q$ 且当 $q$ 趋于某值时归零”的结构，都值得怀疑作者在兑现某处早期埋下的自由度。

### 顺手记下的两处约定与一处存疑

约定一：内积对第一个变量线性，把移位从 $x-jt$ 换成 $x+jt$ 时主值积分改变算子符号，代换为 $t\mapsto-t$（build/sections/introduction.tex:93-96）；因此全文的“斜率 $1,2,3$”与算子定义里 $-1,-2,-3$ 的移位是同一件事的两个记账方向。约定二：带区间下标的范数与内积用该区间上的归一化 Lebesgue 测度，其余范数用常规测度（build/sections/introduction.tex:96-99）；这条约定决定了 prop:normalized 归一化假设 $\lVert f_j\rVert_{q,I}\le1$（build/sections/outer.tex:74）的量纲正确性，混用会立刻破坏停止倍率 $16$ 的几何含义。存疑一处：$A$ 的显式编译在 completion 前 160 行里始终是黑箱，[推测] 它吸收 $\eta^\varepsilon P^{C_4}$ 的最大值与全部 $e^{-k}$ 尾巴之和；$A$ 对 $q,c$ 及精度参数的依赖方式，文本大概只写成存在性，工程上这对应用端无影响，但对想把常数追出来的人（比如数值验证者）是真正的墙。

### 勘误与过程申报

正文落盘后未再改动任何既有内容，事实层面暂无需要更正的陈述，故本节只做过程申报。其一，探针行保留在 §3 末尾，落盘机制验证通过（基线 14447 字节，复量 14536 字节）。其二，§2 收尾处的一次追加采用该节末段与 §3 标题共同构成的锚文本完成插入，位置落在 §2 与 §3 交界处、属于纯追加且未扰动任何先前文字；除此之外各次追加均以当时文件末尾段落为锚。其三，另有一次追加因锚文本与落盘内容有出入而未执行，零次生效，无痕迹残留。其四，Write 工具全文使用一次（初稿建档），其余写入全部为 Edit 追加，单次追加均未超过 25,000 字节。其五，未执行任何版本控制命令，未读取任何 PDF，未触碰 lean 目录与禁区清单文件；取材仅 §0 申报的十个 `.tex` 与 preamble.tex、paper.tex，其中五个证明节只掌握陈述层，对应叙述已全部挂 [推测] 并在 §12 复核过。

### 如果接手继续做：三步优先动作与一份复读清单

把这台机器当作我要接手维护的系统，第一批动作我想得很清楚。第一步，补读 base.tex 全文与 completion.tex 的收尾一百行。base 是整机输入形态的源头：两个精度的分层（build/sections/base.tex:1）、延迟预测子替换（build/sections/base.tex:273）、两个最早增量的展开（build/sections/base.tex:453）、少量活跃尺度引理（build/sections/base.tex:745），这四道工序共同决定了局域化接管的 eq(11) 型 pattern 为什么长成现在这样；我目前只有命题层，读到证明层之前，§9 末尾那句“成对小”的落点我不敢当作定论。第二步，补读 charts.tex 的 346-690 行与 1061-1267 行，验证沿 progression 的代数分离恒等式到底把 $c=(-1,3,-3,1)$ 用到什么程度：只用它三阶差分恒零的场合，还是要用到分量非零的具体形状。这决定引言“为其他 progression 形态隔离工具”那句话（build/sections/introduction.tex:76-78）是例行公事，还是真有一条已经修好的岔路。第三步，补读 sides.tex 的 124-500 行，把短块比较的随机化证明完整走一遍，确认那个趋于 $0$ 的指数对 $q-2$ 的依赖形态；§10 的闭合验算目前建立在“指数可以任意小”这一个接口事实上，它的证明层细节是我全文最大的单点风险。复读清单按期望收益排序：Compression 引理证明（build/sections/compression.tex:296-555）决定重启前投影可乘的次数上限；颜色预算与例外根（build/sections/localization.tex:314-407）决定分支系统的账本厚薄；例外块与极小有理空间（build/sections/linearization.tex:394-439）决定 $a\cdot\xi$ 过小那批频率的最终去处；结构、均匀与 $L^1$ 三分解（build/sections/charts.tex:1061 起）则是 Hahn--Banach 那一步真正的出口。[推测] 这四块读完后，本笔记所有陈述层反推大概有八成能升级为证明层复述，其余两成仍要靠与引言第三特征的交叉核对。

### 阅读姿态的最后一记复盘

合上稿子之前，我想诚实记下自己读这篇论文时视角的两次位移。第一次位移发生在 §3 之后：我不再问“这个定理为什么真”，改问“每条引理的输出被铸成哪种货币”，于是引理列表从知识点变成流水账，读起来快得多。第二次位移发生在 §10 验算时：参数顺序表（build/sections/completion.tex:121-143）与引言三特征对照之后，我意识到这台机器最贵的部分与最便宜的部分恰好颠倒，最贵的是私有坐标这种一次性的基础设施，最便宜的居然是全部定量常数，因为它们只在预算表的四行里活着；此后我对“定量改进”类工作多了一层敬意也少了一层迷信，定量数字的传播路径比数字本身更能决定一篇论文的生死。两条位移合起来，就是我在这份笔记里反复使用“汇率”这个词的原因：它是我这次阅读真正带得走的东西。

### 补记申报：风格修复的在位替换

收工前的全文扫描在三处发现了应零命中的违例串，分属两字转折连接词类与四字过渡套语类；我按最小字符量的在位替换完成修复，句式、数值、行号引证与前后文均未改动，修复后复检全部类别命中为 $0$。除这三次修复外，本文件再无任何对已落盘文字的改写型操作；探针行、初稿与全部追加段落均按原样保留。这次修复是我在“已落盘内容不可改写”与“违例串必须零命中”两条硬约束夹缝里选择的后者，申报在此，供交付报告核对。

### 延伸路线：这篇论文挂住的三根外部线

合稿之前把参考文献侧的三根接口线捋一遍，作为我以后顺藤摸瓜的路标。第一根线接 Tao 的 2015 年工作：截断多线性 Hilbert 变换的亚对数消去与高阶一致性的联络（build/sections/introduction.tex:40-42）。本文的坐标系里，那条线提供了“单尺度结构能兑换跨尺度节省”的首个证据，而本文做的是它的端点放大版：把亚对数兑换率推到一致有界，代价是整套列系统与簿记制度。[推测] 若从 Tao 的框架出发做增量改进，本文的压缩引理与路径预算几乎肯定是最先该借的两件工具。第二根线接 Hu 与 Lie 的记录：直线三线性问题的悬置状态（build/sections/introduction.tex:43-44）与猜想完整指标范围（build/sections/introduction.tex:22-26，指向其 Conjecture 1.7），以及弯曲变换处理另一族振荡（build/sections/introduction.tex:45-46）。本文钉住 $L^3\times L^3\times L^3\to L^1$ 一个端点后，最近的两个可动目标应是沿该猜想向内挪指标与改斜率构型；前者考验 §11 说的插值多面体余量问题，后者考验代数分离恒等式对差分结构的依赖深度，也就是复读清单第二步。第三根线接 Leng--Sah--Sawhney 的反定理本体（build/sections/introduction.tex:48-52、build/sections/charts.tex:697-718）：本文向它借的只有二次情形与准多项式定量，还回去的是一份连续化样板：圆 $\mathbb T_{16}$ 上的立方范数、零延拓、Hahn--Banach 三分解（build/sections/charts.tex:1061 起）。[推测] 这份样板对以后任何要把离散反定理搬进奇异积分的人都有直接复用价值，它的成本在本文账本里记在 charts 一节开头那句“区分复杂度与振荡参数”（build/sections/charts.tex:3-8）之下。三根线各自的接入点都有行号可查，我把它们抄在这里，是为了下次接手时不用重新在引文迷宫里探路。

写到这里，这份笔记本身也该进台账了：它记录了一个从差分恒等式出发、经由自吸收递归、私有坐标、连续化反定理、双密度计数与随机化短块，最后回到参数顺序表的完整阅读回路。回路闭合的时刻，恰是我最初在 §2 列的四条存在性前提逐条兑现的时刻；一篇论文能让重建读者在合稿处听见自己先前推理的回声，这本身就是结构正确性的体感证据。

最后一件私记的事：这篇论文教我的最具体一课，是把“信息不足”本身变成写作对象。全文的 [推测] 标注集中在 base、localization、linearization、sides、counting 五节的证明层，而陈述层与预算表能支撑的推理半径远大于直觉；下次动笔前我应该先把行号可得性列成清单，再决定叙述深入到哪一层，这样 [推测] 的密度会在动笔时就被预算住，事后无需在勘误里补账。本笔记的取证账目、探针记录与修复申报都已在文内留痕，五十一行台账数据行给出了每个关键量的产地与断点，交接的人可以从任意一行反查回原文。
