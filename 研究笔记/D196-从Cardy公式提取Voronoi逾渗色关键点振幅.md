# D196：从 Cardy 公式提取 Voronoi 逾渗色关键点振幅

（主线 2 非 Lean 队列写稿，编号 D196。正文素材全部取自派单目录 build 下的 .tex 文件，行文采用第一人称研究笔记，行号引用形如 02-annuli.tex:39，均出自本会话真实读取。）

## §0 双登记

本单派参：row=20，bytes=161978，thin=no。落盘探针与收工 sleep 90 复量按规格执行。两条登记挂在本节末尾，逐字如下。

登记一（完整目录名）：preprints/A-Pivotal-Amplitude-for-Voronoi-Percolation-from-Cardys-Formula-October-5-2026
登记二（队列行号）：其他队列第 20 行号

## §1 初始动机：一套理论欠我一次"清点"

我手上已有的东西，是姊妹篇 [V]（From-critical-crossings-to-quenched-near-critical-universality-in-Voronoi-percolation-October-5-2026，见 references.tex:61-66）搭起来的 quenched 近临界框架。那篇文章从标度 Cardy 假设出发，把局部关键点观测量对"逆期望关键点数"做了校准；它把归一化常数定义成
$q_\varepsilon=(\mathbb E N_\varepsilon(Q_0))^{-1}$（01-inputs.tex:170-173）。问题是：这个定义里藏着一个没有验证的事实。$N_\varepsilon$ 是单位正方形左右穿越的色关键点（color-pivotal）核子数，我用了 $\varepsilon^{3/4}$ 这个幂次去归一化它，可 $\varepsilon^{3/4}\mathbb E N_\varepsilon$ 到底收敛不收敛、极限是不是一个正有限常数，[V] 里没有证。引言里我把任务写得很直白：要证明这个归一化是欧氏网格的一个纯幂次，带正极限系数（00-introduction.tex:77-83）。

设定本身不复杂（00-introduction.tex:3-15）：$\eta_\varepsilon$ 是平面上强度 $\varepsilon^{-2}$ 的齐次 Poisson 点过程，Voronoi 胞按独立等概率染黑或白；一个核子是色关键的，当且仅当只改它这个胞的颜色会改变穿越事件的发生与否；$N_\varepsilon(Q)$ 把细胞伸进 $Q$ 的外部核子也计入；期望同时对几何和颜色平均。我把整篇论文的靶子写成一句话：在标度 Cardy 假设下（Assumption 1，00-introduction.tex:17-21，逐字是：对每个带四个不同标记边界点的有界 Jordan 四边形，临界穿越概率当 $\varepsilon\downarrow0$ 收敛到 Cardy 共形不变值），存在 $c_V\in(0,\infty)$ 使 $\lim\varepsilon^{3/4}\mathbb E N_\varepsilon=c_V$（定理 main，00-introduction.tex:35-43）。

这里我对自己的第一条纪律是：不许向 Cardy 收敛要任何速率。摘要里明说了 No rate of convergence in Cardy's formula is required（00-introduction.tex:49）。这条纪律不是审美，是后面所有构造的驱动力：我不能用任何带 $\varepsilon$ 的量化误差去换极限存在性，只能靠"先取一个大但固定的环域比，再在足够大的起始尺度上拿定性收敛，最后迭代"这个顺序（00-introduction.tex:134-137）。

## §2 第一条走不通的路：把指数当振幅

最开始我想直接吃四臂指数的现成结果。LSW 与 Smirnov--Werner 一路把交错四臂指数钉在 $5/4$（00-introduction.tex:54-58），一个体点是关键的必要条件就是从它的邻域长出四条交错臂，所以 $\mathbb E N_\varepsilon$ 的量级"显然"是 $\varepsilon^{-2}\varepsilon^{5/4}=\varepsilon^{-3/4}$（00-introduction.tex:59-61）。写到这里我卡住了，因为量级和振幅是两回事：$\mathbb E N_\varepsilon=\varepsilon^{-3/4+o(1)}$ 允许一个慢变甚至振荡的乘子。引言里我把这个区别单独成段（00-introduction.tex:63-70）：DGLZ（Comm. Math. Phys. 405 (2024)，references.tex:30-34）给的是三角格上锐利臂渐近，带极限乘子常数，可那是无条件的格点臂概率，我这里是一个 Poisson--Voronoi 色关键点观测量，头上只顶着定性穿越极限假设，两者对不上号。

于是我退而求其次，把能拿到的最锐的东西先钉死：01-inputs.tex:198-233 的引理给出 $f(R)=R^{-5/4+o(1)}$，其中 $f(R)=S_{1/R}$，$S_\varepsilon$ 是把一个点插进 $Q_0=[-1,1]\times[-1/2,1/2]$ 中心后成为色关键点的概率（01-inputs.tex:164-175）。这个证明的思路值得复盘：强制中心半径 $h$ 方块内所有胞先黑后白，取穿越概率差 $D_\varepsilon(h)$；[V] 的 Proposition 4.5 给固定 $h$ 下与三角模型的共同极限；再用臂上界和 [V] 的 Lemma 6.1 把 $D_\varepsilon(h)$ 与四臂概率 $A(h,1)$ 比较（01-inputs.tex:204-214）。剩下的就是把任意大的固定比 $L$ 先固定下来，吸收拟乘性常数，再沿 $r,Lr,L^2r,\ldots$ 迭代（01-inputs.tex:216-233）。这条路的终点就是我出发的地方：指数 $5/4$ 有了，乘子的行为仍是一团 $o(1)$。失败原因很清楚：单靠指数量级的不等式链，迭代一万次也只是把 $o(1)$ 换个姿势写出来，慢变因子对这套尺度不变估计完全隐形。

## §3 第二条走不通的路：把 Cardy 公式直接按在环域上

第二个念头是把假设里的 Jordan 四边形选成圆环。这不行，而且不行得很干净：Assumption 1 的定义域是 Jordan 域加四个标记边界点（00-introduction.tex:23-25），单连通；环域是双连通，"四界面贯穿概率"根本不在假设覆盖范围内。02-annuli.tex:5-8 开门见山地承认这一点：其存在性不能靠把标度 Cardy 假设直接用于多连通区域得到，必须从 [V] 的 Jordan 域输入重新建立。我起初还想顺手引 Schramm--Smirnov 的 glueing 定理把环域切开再拼回去，但 gluing 是在 Jordan 盘块里做的，粗糙的 slit 边界上的拼接地带恰是我这个场景里形状最差的部分。02-annuli.tex:345-346 那句 No gluing assertion along a rough slit is used 是我写给当初自己的：只许在严格 Jordan 盘块内部用 gluing（02-annuli.tex:329-331 引 SS 的 Theorem 1.19 与 Proposition 4.1），环面上的接缝一律绕开。

绕开的办法是换问题：先在环面内部挖出严格包含的 Jordan 盘，盘内联合穿越律由 [V] 第 3--4 节等于临界三角律，而那个律共形不变（02-annuli.tex:319-323 引 CN 的 Theorems 1, 7 与 GPS 第 2.3 节）；对跨过所选 cuts 的四边形测试，用一条有限长光滑 cut 把环打开，所有离开这条 cut 的测试塞进一个严格 Jordan 盘，然后靠"正则四边形的穿越在跳过该 cut 的可数测试族之下可测（模零集）"这个 SS 结论把跨 cut 的测试测度地重建出来（02-annuli.tex:326-344）。这样环面开集里可数个正则四边形测试的联合极限律就是共形不变的（Lemma ordinary，02-annuli.tex:311-317）。有了它，才能谈"传输极限"的存在。

## §4 关键转折：比较的是"差异"，对象是连接状态

转折点是我把关注的量从概率换成了差分。环域每端四个开关、四条交错指定色段，内圈圆盘填充有两种连接状态（cap）：连接两条黑段的 $\mathsf b$ 和连接两条白段的 $\mathsf w$。帽恒等式（Lemma caps，02-annuli.tex:36-59）逐字是 $H_{\mathsf b}-H_{\mathsf w}=\mathbf 1_{\mathcal T}$，其中 $\mathcal T$ 是四条外壁全部到达内边界的贯穿事件。墙在三角化里不分叉不自交， surviving 端点少于四个时，外圈可见的配对与内帽无关，两边同值；恰好四个时保序传递（可带绕数），$H_{\mathsf b}=1,H_{\mathsf w}=0$。证明收尾就是每条色段缩成一个点后的 Hex 对偶（02-annuli.tex:55-58）。

这个恒等式给我的启发是：环域对"连接状态之差"的作用才是我要的算子。连接状态定义为边界开关由界面墙（wall）给出的非交叉配对，加上色段信息，它决定边界点之间的全部连通性（02-annuli.tex:18-22）；穿过的差分除非至少四条界面存活否则恒为零，存活恰四条时内部两状态只差一个标量（00-introduction.tex:104-112）。这就是长环域传输的秩一近似的来源。我沿着差分再挖一层，得到更强的一条：插入一个带独立公平颜色的 Poisson 点产生的带符号变化，对颜色翻转和旋转都不变，在这个对称类里，四项领头界面贡献会相消；谱计算表明残余传输衰减快于环域尺度比的平方（00-introduction.tex:113-117）。为什么"快于平方"是命门：插入点在二维平面上跑遍，插入效应必须对位置可积，面积元是 $t\,dt$，而无符号四臂界只给 $t^{-2-2\nu}$ 前的 $A\sim t^{-5/4}$ 型信息，指数 $5/4$ 供不起可积性（00-introduction.tex:118-121）。

由此整个证明的三段式结构定了型（00-introduction.tex:123-132）：第 5--7 节（对应论文的 02、03、04 节）建立环域传输极限、其秩一渐近与带符号旋转相消；第 8--9 节（05-transfer）把这些估计对任意带符号边界数据做成一致算子并在离散 Poisson 模型中迭代；第 11--13 节（06-amplitude）对强度微分 $f$，可积插入估计管远处，秩一比较管近处两个外尺度，最后说明 $f$ 的对数导数从 $-5/4$ 出发的误差可求和。

## §5 环域传输极限 $T^\pm$ 的建立

先规定什么叫"好的边界收敛"。可容许边界收敛（Definition admissible，02-annuli.tex:120-146）要求：每条边界是简单站点圈，旋转归一化后从标准环 $\mathbb A_p=\{e^{-p}<|z|<1\}$ 的共形表示 $\phi_n$ 在闭环上一致收敛到 $\phi$，$\phi$ 在内部共形单叶、边界周游给出素端接入；极限边界周游是有限条简单弧的拼接，各带自己的接入，物理投影可以相碰但不作等同；每圈四个开关收敛到互异位置，其间指定色交替，两圈之间站点颜色独立公平。所有极限沿 [V] 的确定性好序列取（02-annuli.tex:113-118）。

停下的探索域怎么会落进这个定义，靠的是"背靠加有限瓣"引理（Lemma back-lobes，02-annuli.tex:153-209）：环域若由一个开环面背靠加有限多个沿开区间缝在上面的 Jordan 瓣构成，背靠完整边界周游按曲线序收敛、缝端点收敛且极限缝保持开、每个瓣按 Jordan 域收敛，且极限仍是带持久洞的环面，则环面共形表示在闭包上一致收敛。证明的核心是调和测度的双向夹：每个瓣内固定非恒定子弧从一个持久内点看的调和测度有正下界（Jordan 收敛加 Harnack 链），而圆环坐标里从原像看密度有一致上界（模与预像都待在紧非退化范围），于是边界角参数等度连续（02-annuli.tex:185-202）。解析函数在边界弧上连续则无恒定边段（02-annuli.tex:205-206），我在这一步花了很久才敢确认它够用。

边界扰动连续性（Lemma motion，02-annuli.tex:222-303）处理"粗糙 bank 上的测试对微小移动敏感吗"。把圈沿圆环坐标微移、开关跟着动，耦合未动的颜色，则任一帽连接测试翻转的概率在网格极限后随扰动幅度趋零。证明里我数自由臂：某次普通移动改变测试结果，就在两个测试里各取一条赢家路径（一个黑连一个白连），把指定段收缩、贴上同一个帽，纯 wired 连接不动，所以必有自由段碰到移动支撑；白路出两根自由枝，黑路至少再出一根，得到平移半盘块里的三根自由臂（02-annuli.tex:271-285）。单个半径 $s$ 盘的代价是 $O(s^{1+\eta})$，$O(s^{-1})$ 个盘覆盖后总代价 $O(s^\eta)$；开关与 bank 接合点是例外邻域，那里的改变需要一根正直径的臂，物理单臂界把这部分压到零（02-annuli.tex:286-297）。

有了这两块砖，传输极限（Proposition limit，02-annuli.tex:349-464）才立起来：$T^\pm(p,x,y)$ 存在、连续、只依赖圆环数据与内圈颜色规定；对随机剩余域，条件传输概率与把 $T^\pm$ 作用在实际共形数据上的差按绝对值均值收敛到零。证明的骨架是"有利扰动"三明治：把黑 bank 推进流体、延长色段、白 bank 后退，构造一个使测试更难翻转的扰动版本，再把第一条序列里赢家的无旁路最外路径拆成有界多根自由段，逐段裁正端点、围细 Jordan 管、用可数普通测试族传递穿越（02-annuli.tex:380-444）。自由段在极限里有简单曲线代表这件事，我把六臂自接触、边界三臂重复访问这些排除论证全部内联进来（02-annuli.tex:402-420），依据是网格先行的六臂指数 $>2$ 与边界臂指数 $>1$（01-inputs.tex:112-118）。最后夹逼上下极限重合；随机域情形对几乎每个实现用确定性陈述，再用有界收敛（02-annuli.tex:457-463）。碰撞归零与对称性（Lemma collision，02-annuli.tex:466-487）顺手记下：开关碰撞时 $T^\pm$ 连续延拓为零（一根从收缩色段出发的公平臂），共转不变、色翻转不变，某圈循环重贴标把 $T^+$ 与 $T^-$ 互换。

探针：本行由落盘协议第 0 步追加，用于字节增量核验。
探针续行：基线 12782 字节，本行为唯一新增行。

## §6 模方程：把环域变成八变量的扩散

$T^\pm(p,x,y)$ 存在之后，我想要的不是数值，是 $p\to\infty$ 的谱信息，所以第一步得让 $T$ 满足一个可以算的方程。空间先摊开：四个循环有序的标记角摸掉整体转圈后得到的腔 $\mathcal C=\{w\in\R^4:w_1<w_2<w_3<w_4<w_1+2\pi\}/(2\pi\Z\one)$，环域两端各一份，乘积腔 $\mathcal X=\mathcal C\times\mathcal C$（03-spectrum.tex:15-21）。注意商的是共转， cyclic 重贴标没有商掉，这一步后面会付利息。

模方程（Prop annular-pde，03-spectrum.tex:27-46）说 $T^\pm$ 在 $(0,\infty)\times\mathcal X$ 上光滑且 $\partial_pT=(L+B_p\cdot\nabla)T$，主部
$L=\frac18\sum_{w=x,y}\bigl(3\sum_i\partial_{w_iw_i}+\sum_i\sum_{j\ne i}\cot\frac{w_i-w_j}{2}\,\partial_{w_i}\bigr)$，
余项场满足 $\lVert B_p\rVert_{C^k}\le C_{k,p_0}e^{-p}$，且在每个碰撞面上法向分量为零。推导路径我复得了三遍才敢信它是标准动作：把 $\mathbb A_p$ 摊成周期 $2\pi$ 的圆柱 $0<\operatorname{Im}z<p$，驱动极点的正则在无穷端为零，环面 Loewner 核 $H_p(u)=\lim_{N}\sum_{k=-N}^N\cot\frac{u-2ikp}{2}$，极点留数 $2$，对边虚部 $-1$（03-spectrum.tex:50-59）；Zhan 的环面 SLE 局部性定理（references.tex:106-111）把局部驱动角认成方差参数 $6$ 的 Brown 运动，这里只用到"离开活动开关的小单连通邻域之前"的局部性（03-spectrum.tex:60-63）。两个核误差 $H_p(u)-\cot(u/2)=O(e^{-2p})$ 与 $\operatorname{Re}H_p(u+ip)=O(e^{-p})$ 成对出现（03-spectrum.tex:79-82），前者把同界开关推成八体 Calogero 型耦合，后者就是 $B_p$ 的全部来源。

有一个小计算让我停下来核对符号：会不会多出一个驱动漂移？弦式图里极点部分是 $2/(z-U_t)$；若局部坐标 $F_t$ 在动，比较极点留数得新钟 $F_t'(U_t)^2dt$，比较两项都零正则化的常数项得 $\partial_tF_t(U_t)=-3F_t''(U_t)$，它恰好在 $\kappa=6$ 时抵消 It\^o 修正 $\kappa F_t''(U_t)/2$（03-spectrum.tex:65-71）。环面远处目标不进入这个账，所以没有任何隐藏常数。

比较虚的部分是正当性。我先把 Markov 恒等式建立在光滑性之前（03-spectrum.tex:104-149）：在活动开关周围取任意小的横截割线，用带第二色开关的 Jordan 补块封边；查询前停下的探索在这个补块里与在整个环面里完全一致，因为横截割线之外的颜色一个都没读。[V] 的停探目标面定理给出剩余面是"背靠加有限个沿开子区间粘上去的 Jordan 侧瓣"，还要验证极限仍双连通：在割线闭邻域里挖掉所有瓣内部与其开附着区间，剩下的闭集仍连到旧外补，办法是把任何穿瓣路径段换成该瓣自由边界弧，进出点都在保留边界上，有限次替换后路径整个落在补集里；洞与外补被持久的环面背靠隔开（03-spectrum.tex:126-141）。于是 §5 的 back-lobes 引理递上闭环面一致参数化收敛，停止边变成替代开关，未读颜色仍新鲜，有界收敛给出每个壳停顿处的局部均值恒等式。光滑性从 viscosity 起步：测试函数从上或从下触 $T$，壳容量趋零、以远标记归一化的环面图在其余紧边界段经反射趋于恒等，It\^o 公式与"停顿耗正时"矛盾掉错误号的不等式；八个活动方程平均后在开腔紧子集上一致抛物，内正则给经典解（03-spectrum.tex:151-167）。

## §7 基态变换与腔上的均匀光滑

有了方程，谱问题的标准操作是找基态。这里基态是现成的：
$J(w)=\prod_{i<j}\sin\frac{w_j-w_i}{2}$，$h(x,y)=J(x)^{1/3}J(y)^{1/3}$，且 $Lh=-\lambda h$，$\lambda=5/4$（03-spectrum.tex:171-184）。验证只用到余切恒等式：记 $s_i=\sum_{j\ne i}\cot\frac{w_i-w_j}{2}$，三个角的余切关系给出 $\sum_is_i^2=\sum_{i\ne j}\csc^2\frac{w_i-w_j}{2}-20$，每个 tuple 对 $h^{-1}Lh$ 贡献 $-5/8$，两 tuple 合计 $-5/4$。这个数我盯了很久：$5/4$ 在这里第二次出现，第一次是四臂指数（01-inputs.tex:236）。两条来路在此汇合，$L^2$ 谱分析与平面四臂临界指数是同一个 Calogero--Sutherland 结构的两侧（03-spectrum.tex:186-189 引 Cardy 的 Calogero--Sutherland 文章，references.tex:23-28）。Doob 变换后的生成元 $D=\frac38(\Delta+\nabla\log m\cdot\nabla)$，不变密度 $m=J(x)^{4/3}J(y)^{4/3}$（03-spectrum.tex:190-193）。取 $W=e^{\lambda p}T/h$，方程变成 $\partial_pW=DW+B_p\cdot\nabla W+V_pW$，$V_p=B_p\cdot\nabla\log h$；$V_p$ 在碰撞面的表观奇点是可去的，因为每个 $\cot\frac{w_i-w_j}{2}$ 都乘在 $B_p$ 两分量之差上，而那差在对应面上消失（03-spectrum.tex:201-205）。

光滑引理（03-spectrum.tex:207-298）是我最不顺手的一块，但它把"不需要 Cardy 速率"这件事落成了算子语言。要点一：扩散不会撞到腔壁。取 $-\log m$ 当 Lyapunov，密度指数 $\alpha=4/3$ 时奇部系数 $(\alpha-\alpha^2)<0$，单 tuple 的显式计算 $D(-\log J^{4/3})=\frac{10}{3}-\frac1{24}\sum_{i\ne j}\csc^2\frac{w_i-w_j}{2}$ 有上界，内逼近停下即证有限时间无碰撞；$B_p$ 这样有界漂移的加入由 Girsanov 保持这点（03-spectrum.tex:224-242）。要点二：Feynman--Kac 表示敢用无界初值 $|W(p_0)|\le C/h$，因为先在内部逼杀表示里 $T$ 的侧面值由 §5 碰撞引理一致趋零，贡献蒸干，再做 $h$ 变换取极限（03-spectrum.tex:244-255）。要点三：均匀平滑。$-\log m$ 在提升凸腔上下凸，漂移单调耗散；两条轨用同一 Brown 运动耦合，第二条外加"朝第一条走、强度为初距除以 allotted 时间"的控制漂移，耗散性强制按时相遇，Girsanov 密度的各固定矩把改测代价控住，得维度无关的 $|P_tF(z)|^q\le C\,P_t(|F|^q)(z')$，对不变概率 $\mu$ 积分就是 $L^q$ 到 sup（03-spectrum.tex:257-274）。有界漂移加有界势保持从 $L^4(\mu)$ 起步的光滑：$h^{-1}\in L^4(\mu)$，恰因 $h^{-4}m=1$（03-spectrum.tex:276-283）；随后一切界靠 $\int^\infty\lVert V_p\rVert_\infty dp<\infty$ 存活（03-spectrum.tex:284-286）。Lipschitz 版同样从相遇耦合来：控制漂移下的轨距至多初距定倍，Girsanov 指数二阶矩控全变差，FK 权重差由 $V$ 的 Lipschitz 界乘轨距（03-spectrum.tex:287-297）。

## §8 两层对称间隙：$e^{-2p}$ 的带符号衰减

$\Pi$ 之前的账都为一页纸服务：带符号差 $W_-=e^{\lambda p}(T^+-T^-)/h$ 在 $L^2(\mu)$ 里住在哪个对称子空间，$-D$ 在那里有多大间隙。坐标先把 tuple 拆成质心角 $\theta$ 与零均值相对角 $r\in\mathcal A$，$D$ 的质心部分是每 tuple $(3/32)\partial_\theta^2$（03-spectrum.tex:302-316）。三层间隙（Lemma gaps，03-spectrum.tex:318-364）：相对角扩散的 Poincar\'e 间隙至少 $1/2$，靠 Brascamp--Lieb：零均值 $v$ 方向 $\nabla^2(-\log J^{4/3})[v,v]=\frac13\sum_{i<j}\csc^2\frac{r_i-r_j}{2}(v_i-v_j)^2\ge\frac43|v|^2$，$\operatorname{Var}(F)\le\frac34\int|\nabla_rF|^2d\mu_r$ 配上 Dirichlet 形式的 $3/8$ 因子得 $1/2$（03-spectrum.tex:328-341）；共转不变意味着质心频率只许 $(n,-n)$，能量 $3n^2/16$；循环重贴标把 $\theta$ 推 $\pi/2$ 并在 $\mathcal A$ 上跑保测仿射等距，于是一个函数若在该重贴标下变号，其相对均值非零只可能在 $e^{in\pi/2}=-1$ 即 $n\equiv2\pmod4$，其余频率付两份相对能量共 $1$，留下的 $|n|\ge2$ 至少付中心能量 $3/4$，所以奇子空间间隙 $3/4$；再限制到双零质心频率，两相对均值皆零，间隙升为 $1$（03-spectrum.tex:344-354）。这里我特意确认过"没有隐藏吸收边界"：常函数在形式域内，逼近碰撞面的截断能量趋零，因为密度以幂 $4/3>1$ 消没（03-spectrum.tex:356-363）。

$W_-$ 恰好同时具备共转不变与（对任一 tuple 的）循环变号两性质：一步循环重贴标交换 $T^+$ 与 $T^-$ 而 $h$ 不动（03-spectrum.tex:366-374）。于是 Duhamel 展开 $W(p)=P_{p-p_1}W(p_1)+\int_{p_1}^pP_{p-s}F_sds$ 配上 $\lVert F_p\rVert_\infty\le Ce^{-p}$ 直接给（Prop transmission-asymptotics，03-spectrum.tex:376-395）：$\lVert W_-(p)\rVert_\infty\le Ce^{-3p/4}$，投影后 $\lVert\Pi W_-(p)\rVert_\infty\le C(1+p)e^{-p}$，而单独的 $W^\pm$ 对常数以外有正间隙（中心 $3/32$、相对 $1/2$），故各自指数收敛到均值，均值导数 $\int F_p$ 可积，$W_-$ 的衰减又逼两均值相等，公共极限记 $K\ge0$，得到圆环数据的秩一渐近 $T^\pm=e^{-\lambda p}(Kh+O(e^{-\sigma p}))$。附带时间正则：对初始点平方距离跑 It\^o，奇漂移与位移的内积逐项被 $(v-v_0)\cot(v/2)$ 一致上界控制（$v\le\pi$ 时用 $v-v_0\le v$，$v\ge\pi$ 时用 $v-v_0\ge v-2\pi$），Gronwall 给 $\mathbb E|Z_\ell-Z_0|^2\le C\ell$，FK 表示升级为 $\lVert W_-(p+\ell)-W_-(p)\rVert\le Ce^{-3p/4}\sqrt\ell$（03-spectrum.tex:430-448）；$h$ 是积正弦的立方根，闭腔上一致 $1/3$-H\"older（03-spectrum.tex:449-451）。

指数账在这里到期结清：带符号差 $\lvert T^+-T^-\rvert$ 的衰减是 $e^{-\lambda p}\cdot e^{-3p/4}=e^{-2p}$ 再乘有界 $h$，恰好迈过"尺度比平方"这道门槛，多出 $\frac34$ 全来自对称性；$\Pi$ 之后 $(1+p)e^{-p}$ 与 $e^{-p}$ 复合出 $\rho^2$ 的幂改进。引言里那句"快于环域尺度比的逆平方"（00-introduction.tex:115-118）至此兑现成可引用的显式指数，而支撑它的恰好是两层间隙 $3/4$ 与 $1$。

## §9 把两端的共形数据解耦：对任意粗糙边界一致

§8 的渐近写在整环 uniformization 的坐标里；要做成转移算子的内核，主项必须各自只依赖内端与外端被探出的区域（04-shape.tex:5-10）。几何设定只许两条分离尺度：内区 $K_i$ 是包住原点的闭 Jordan 区域，$\diam K_i\ge c_*a$ 且塞在半径 $a$ 内；外域 $U_o$ 含半径 $b$ 的圆盘且其边界上有点在 $C_*b$；每端四个素端标记与交替颜色规定（04-shape.tex:12-24）。两端分别归一化：外部的 $w_i$ 把 $\widehat{\mathbb C}\setminus K_i$ 映到单位圆外、无穷端 $w_i(z)=z/l_i+O(1)$，$l_i$ 恰是 $K_i$ 的对数容度；内部的 $w_o$ 把 $U_o$ 映到圆盘、$w_o(0)=0$、$w_o'(0)=1/l_o$，$l_o$ 是 $0$ 处共形半径；标记角分别记 $y^0,x^0$。容度-直径估计加 Koebe 给 $l_i\asymp a$、$l_o\asymp b$（04-shape.tex:26-43）。

两端映射比较引理（04-shape.tex:45-145）给 $\lvert p-p'\rvert\le Ca/b$、角误差 $\le C(1+\log(b/a))a/b$，$p'=\log(l_o/l_i)$，常数对满足分离假设的一切 Jordan 边界一致，边界光滑度一条都不 imposed。证明我拆成三层记。第一层是解析校正 $g_i=\log(l_iw_i/z)$、$g_o=\log(l_ow_o/z)$，分支分别归一于无穷与零点，单叶性扭曲给两侧 $|g|\le Ca/b$ 的紧内估计；反向映射上，极大值原理管外部（$|\psi_i(w)|\le a|w|$），Koebe 管内部（$|\psi_o(w)|\ge l_o|w|/(1+|w|)^2$），这两行就是"物理边界任意粗糙也不改常数"的全部原因（04-shape.tex:60-87）。第二层是模：多值解析函数 $H=\log(z/l_i)+g_i+g_o$ 以 $2\pi i$ 为周期，实部在内边界贴近 $0$、外边界贴近 $p'$；环面对数 $A$（$0<\operatorname{Re}A<p$）周期相同，故 $H-A$ 单值；圆柱坐标里单值解析函数实部的圆周均值跨柱不变，两端均值差 $p'-p+O(a/b)$ 被迫为零，得 $|p-p'|\le Ca/b$，极大值原理再放大成体内 $\lvert\operatorname{Re}(A-H)\rvert\le Ca/b$（04-shape.tex:89-107）。第三层是角：光有实部界控不住虚部，我改用单端坐标里的圆环领圈，$A-\log w_i$ 在 $|w_i|=1$ 上实部恰零，绕圆反射进外部圆盘领圈，虚部沿整条端圆变动 $Ca/b$；两端各自的加性常数还要对得上，取固定圆盘沿一条径向线用 $O(1+\log(b/a))$ 张重叠盘接力，$A-H$ 的梯度估计逐盘收费，拼完得到统一的角比较（04-shape.tex:109-144）。

装配成"分离端传输"（Prop separated-ends，04-shape.tex:147-230）：秩一分离式 $\lvert T^\pm-K\,l_i^\lambda J(y^0)^{1/3}\,l_o^{-\lambda}J(x^0)^{1/3}\rvert\le C(a/b)^{\lambda+\sigma_1}$，因为 $e^{-\lambda p'}=(l_i/l_o)^\lambda$ 把主项劈成两端因子之积，$h$ 的 $1/3$-H\"older 性消化角误差 $\eta=C(1+q)\rho$（$\rho=a/b$，$q=\log1/\rho$）（04-shape.tex:173-188）。带符号一侧更讲究：把实际环面数据换成两单端数据的代价是 $C\rho^2(\rho^{1/2}+\eta+\eta^{1/3})$，且对内端在 $0$ 处的任意旋转一致（04-shape.tex:190-199）；而容度转不动、单端图旋转协变（$w_{i,\phi}(z)=e^{i\phi}w_i(e^{-i\phi}z)$），未扰数据的旋转平均恰是 $e^{-\lambda p'}h(x^0,y^0)(\Pi W_-)(p',x^0,y^0)$，被 $\S8$ 的投影界压到 $C(1+q)\rho^{\lambda+1}=C(1+q)\rho^{9/4}$（04-shape.tex:201-213）。两条合起来，旋转平均的带符号差 $\le C(a/b)^{2+\sigma_2}$，$\sigma_2<1/4$ 任意（04-shape.tex:162-166）。节末我把适用范围钉死：一切常数只依赖分离与尺度条件，因此可直接作用在探索所得 Jordan 逼近圈的共形数据上，素端重合处不假想反射，靠 §5 的极限命题逐路径认界（04-shape.tex:168-170 与 04-shape.tex:221-229）。

## §10 消息空间：让"任意带符号边界数据"进入定理

前面的环面账目都假设每端恰四个开关。真实的离散穿越测试会把任意复杂的连接状态推给环域，而且环域外侧未必有缩放极限（05-transfer.tex:5-9）。我的处理是把变量分家：两端允许任意数据，缩放极限论证只发生在中间一块独立区域（05-transfer.tex:9-12）。

载体先造好。固定小 $\eta$，半径 $r$ 的接缝是环带 $(1-\eta)r<|z|<(1+\eta)r$ 内的标记 Poisson 过程加选图圈的辅助随机性；占用测试 $G_r$ 保证窄环带内图与顶点星由接缝变量决定、直径小于 $\eta r$ 的固定小分数，失败概率 $Ce^{-cr^2}$（05-transfer.tex:21-35）。屏的显式样子：要求中间环带每个点都贴近大环带内的核子，覆盖距离条件旋转不变，有限覆盖加 Poisson 空球公式给指数界；缓冲区让圈两侧的图各自可读，圈外核子的胞穿不过筛查过的环带，于是两侧变量条件于接缝独立（05-transfer.tex:42-54）。$\Gamma_r$ 上颜色给出偶数个开关；内部连接状态是其非交叉配对，每对端点在循环序中奇偶相异，形式配对全体收录、不验实现性（05-transfer.tex:56-65）。消息是 $\mathcal S_r(\Sigma_r)$ 上带符号测度的可测场 $v_{\Sigma_r}$，零质量、在 $G_r^c$ 上为零，范数是条件全变差的本质上确界；零质量有界场的商空间记 $\mathcal B_r$（05-transfer.tex:67-84）。

若 $r<s$ 两环带不相交，胶上中间环域定义线性算子 $M_{r,s}:\mathcal B_r\to\mathcal B_s$：条件于 $\Sigma_s$，对 $\Sigma_r$ 与中间标记过程积分、两侧屏成功都作乘子（是乘子，不是条件化后再归一化），把 $v_{\Sigma_r}$ 沿环面界面墙推过去，闭圈权重 $1$（05-transfer.tex:86-98）。对每个固定实现，这是有限状态间的全变差压缩，质量保持为零；中间成功接缝给出精确的算子复合；用到的独立性只是被缓冲区隔开的标记 Poisson 变量，跟相邻区域的无限制 Voronoi 事件无关（05-transfer.tex:99-103）。旋转与色翻转作用在接缝与状态上；不变者称各向同性、偶者称 even，两个对称对 $M_{r,s}$ 严格成立（05-transfer.tex:105-108）。

固定比传输（Prop block，05-transfer.tex:110-128）是全篇的机器主轴承：取大整数 $n$、$L=2^n$，存在阈值 $r_0(L)$，使 $r\ge r_0(L)$ 时 $M=M_{r,Lr}$ 满足 $\lVert M\rVert\le CL^{-\lambda}$、$M=M_1+E$ 其中 $\operatorname{rank}M_1\le1$、$\lVert E\rVert\le CL^{-\lambda-\delta}$，而偶各向同性子空间上 $\lVert M\rVert\le CL^{-2-\delta}$；$C,\delta$ 与 $L,r$ 无关，一切范数对成功输出接缝（连其颜色）取本质上确界；$M_1$ 允许依赖 $r,L$。降秩机理一句话（05-transfer.tex:130-136）：六条存活界面已付出大于二的幂，四条存活只剩一个带符号连接坐标；先在独立区域拿到四尖边界、验其收敛，再对那一个坐标用 §9 的分离估计，把首个四尖尺度求和就同时给出秩一近似与色-旋相消。

独立区域的工程细节在 05-transfer.tex:138-207：条件于 $L$ 后用 $r$ 缩放，网格在 $r\to\infty$ 意义下趋零而所有论证半径落在固定有界范围；在 $8r$ 与 $Lr/8$ 附近放辅助起始圈，其几何由与两原接缝隔开的窄环带决定；从两圈各向中部探索，停在有限多个颜色无关屏障圈上，屏障的颜色在读到之前就停下；区间内另加允许相对网格趋零的占用测试，总失败 $o(1)$，支撑与原接缝隔离，成功时中间几何与补上独立外部变量的全平面 Poisson 样本同律。局部版更重要：端试验只用从缓冲到屏障放大固定倍数的变量，两屏障若隔足够大固定因子则支撑不相交；对中有额外测试时，先在有权重有界的积分里删掉它们（误差 $o(1)$），删干净之后才允许把两端积分因子化（05-transfer.tex:164-176）。一致性的引擎是支配引理（05-transfer.tex:213-247）：把中心系数、中间测试、外端带符号测度写成积分后，中间测试替换成绝对误差 $F\ge0$（$F$ 只依赖独立区域），输出范数误差 $\le C\lVert v\rVert_r\mathbb E_{\text{core}}F+o(1)\lVert v\rVert_r$；两状态像必为 $\alpha(\delta_B-\delta_W)$、$|\alpha|\le\lVert v\rVert_r$，推出外端 $\lVert q\rVert_{\mathrm{TV}}\le2$，逐点界 $2\lVert v\rVert_rF$ 条件于输出接缝再积分；对 $\alpha,q$ 依赖接缝数据的正则性零要求，这正是"不声明对非典型被探形状的均匀缩放极限"的兑现方式（05-transfer.tex:229-247）。

## §11 四尖探索：从任意状态到"一个标量"

先把消息从原接缝推到辅助起始圈（用中间附着区的标记变量），此后探索只读起始圈颜色与朝屏障方向的变量，绝不再翻附着帽状态；输入消息的影响全部留在被推过去的带符号系数里。外端对偶：从外辅助圈把状态推向原输出接缝（05-transfer.tex:251-258）。在内辅助圈揭示颜色，把每个开关的墙往环域里描：一条墙描到与另一条描过的墙配对为止，或描到下一次颜色查询将读屏障上的顶点为止，在查询之前停下；停下的墙终止于一个开关边，其后一个三角形的对顶在屏障上，屏障颜色未读（05-transfer.tex:260-265）。屏障半径乘二（内端）或除二（外端）延续同一墙系；在同一已染色样本里描全部墙可知结果与描序无关（05-transfer.tex:266-270）。未配对的停止端点叫存活尖，数目为偶且随屏障推进不增；首次归约到零或两尖时，每个零质量消息被杀；恰四尖时只剩两个帽状态（05-transfer.tex:272-278）。这一节就是我说的"四条存活界面只剩一个带符号连接坐标"的离散化身。

前沿与臂计数引理（05-transfer.tex:280-361）管住三类几何事故。两尖撞向屏障同一点：用底在屏障、探索侧为半环的图盘块，把两条停墙几何延到底（不读色），得两次真穿越，沿两岸追踪在半环两端留固定裕量；岸上站点在两外侧扇形与两指之间给出三根互不相交的免费臂，都在探索侧；短辐条把每条岸钉在自家扇形里，过尖的底挡住外岸绕指逃逸；边界三臂指数严格大于一，用 $O(s^{-1})$ 个半径 $s$ 盘覆盖屏障就排除碰撞，BK 作用在自由影上使固定尺度穿越条数紧（05-transfer.tex:298-318）。前沿本身是简单圈：把起始圈内侧填盘（外端用球面），沿已探带贴三角形并补全已揭示顶点间的边，图二连通（贴边与加边都保二连通），含未查屏障那一面的边界即简单圈（05-transfer.tex:320-329）。有个不变量我喜欢：每个已揭示顶点都有一条自己的颜色、已揭示、回到起始圈的路；于是新加异色边不可能属于未开描的墙，否则那墙或闭环或绕回屏障而不访起始圈，把某岸与起始圈隔开，与岸路矛盾；故已揭示异色边全在墙系里（05-transfer.tex:331-340）。前沿染色同理认定：停墙延到屏障后与回起始圈的墙把已探环带划分成岸色一致的区域，每个已揭示顶点色归对应岸，唯一暴露给剩余面的开关就是存活停边（05-transfer.tex:342-351）。零或两开关只有一个非交叉帽配对，所有输入状态给同一配对，零质量差湮灭；六尖以上，岸影在起始圈到屏障的连续扇形里给六根互不相交站点臂，固定倍数裁剪两端，任意色六臂界可用，不需要给臂排序定色（05-transfer.tex:353-360）。

四尖前沿的可容许性引理（05-transfer.tex:366-519）是 §5 那套机器首次真用。四段单色前沿弧的曲线序紧性：反复穿环给不相交免费臂，BK 加逐次 excursion 紧性，先在固定半径后用递减 excursion 尺度（05-transfer.tex:392-397）。弧对停止圆的非指定端点访问（两侧皆有正 excursion）给半盘块三根免费臂（两沿弧、一沿对岸），边界三臂指数排除；端点的中途回访同法；圆上一条非常值子弧被可数稠密点列上的单臂界排除；常数停顿擦掉；四尖互异引上一条引理（05-transfer.tex:398-414）。弧在一般点自触：两访问用正 excursion 尺度分开，小环内弧给四次真穿越，对岸路径在已揭示侧可全经起始圈接通（接通集在起始圈处不必单色：工作环避开该圈，圈内各段货真价实是对色）；至少两个互补扇形的外界穿越以已揭示侧朝内，每扇含对色纵向穿越：取中间尺度横截割线留穿越两端于割外，若接通邻集不纵向穿越，对偶给一条避开它、从该穿越出发停在前沿圈下次命中的横割，在揭示侧圆盘里两穿越端与两割端交替，割线分隔其邻辐条，与邻集矛盾；回溯情形选沿中间图圈的割线或把该圈 wired 后跑 Hex 对偶，命中的下次落点在整条穿越之外，交替序在回溯下保持；裁剪裕量后除弧上四臂外再添两根异色扇形臂，六臂指数大于二排除；起始圈上自触只需弧的四次穿越：任意色四臂指数大于一且接触点住在固定圆上（05-transfer.tex:416-458）。所有排除在固定正 excursion 尺度与可数尺度、有限球覆盖下同时成立，且是与四尖事件的联合概率上界，从不除以罕见历史的概率（05-transfer.tex:460-464）。剩余区域认法：沿屏障切、用尖边过末三角形的四段短入射，相邻尖之间弧与屏障区间夹出瓣多边形，四个 Jordan 瓣沿屏障开区间接到未动中部侧；瓣界可在物理投影相碰，内部互斥、接入各自保留；再验证贴瓣后仍是环面：停止圆闭盘内挖掉各瓣内部与开附着区间，任一点先连一条内部避开停止圆的路到旧起始侧，进瓣就把首次进到末次出换成该瓣自由前沿子弧，进出点都在这条保留弧上、不在横截割上，也不入别的瓣内部，有限次替换后路径全在补集里，故每侧补连通；两侧非退化连续体被中部开环面隔开，恰是剩余区域的两个互补分量（05-transfer.tex:466-499）。back-lobes 递上闭环面一致参数化与素端周游序；再抽好几何子列、逐路径用传输极限命题，有界收敛给出均值极限 $\mathbb E_{\text{core}}[\mathbf 1_{\text{两端四尖}}|t_r-T_r|]=o(1)$（05-transfer.tex:501-519）。figures/lobes.tex:69-79 的插图标的就是这个分解：四条交替单色前沿弧、开附着区间、以及两接入在一点相碰属边界接触、不进流体也不并接的插图。以上概率结论全住在独立区域，支配引理把它们对任意依赖接缝的消息一致化（05-transfer.tex:523-529）。

首次归约分解（05-transfer.tex:531-670）把账目落地。屏障列 $a_j=8\cdot2^jr$、$b_k=2^{-k}Lr/8$；取大整数 $d$ 使 $j+k\le n-d$ 保证两端缓冲支撑不相交且满足 §9 分离；用对即两实验恰在此首次归约到四尖（05-transfer.tex:533-552）。$\tau>0$ 小于网格先行六臂指数超二的零头；$\rho_j^{\rm in}$、$\rho_k^{\rm out}$ 是含局部屏与附着信息的首四尖历史亚概率律，外端一切测度都条件在固定输出接缝 $\Sigma_{Lr}$ 上、是接缝上的场（05-transfer.tex:554-566）。尾巴引理（05-transfer.tex:568-622）：水平 $j$ 首次归约之前一层必有六尖以上，故付 $j$ 层六臂概率，界 $C2^{-(2+\tau)j}$，外端同构且对原接缝一致；两独立质量相乘得 $\lVert\rho_j^{\rm{in}}\rVert_{\mathrm{TV}}\,\operatorname{ess\,sup}\lVert\rho_k^{\rm{out}}\rVert_{\mathrm{TV}}\le C2^{-(2+\tau)j}2^{-(2+\tau)k}+o(1)$；未被用对覆盖的部分（一路不归约或早归约到非四尖）至多 $O((n+1)^2)$ 个终止水平、总界 $C(n+1)^2L^{-2-\tau}+o(1)$。四尖内前沿处推进的消息必是 $\alpha_j(v;H_i)(\delta_B-\delta_W)$，$|\alpha_j|\le\lVert v\rVert_r$，对 $v$ 线性；外前沿把 $\delta_B-\delta_W$ 推到输出接缝得 $\lVert q_k(H_o)\rVert_{\mathrm{TV}}\le2$（05-transfer.tex:624-638）。帽恒等式说残环把第一帽差送到第二帽差乘以贯穿传输概率 $t_r$，于是用对贡献是形状 $\int\alpha_j(v;H_i)\mathbb E_{\rm mid}[\mathbf1_{G_{\rm aux}}t_r\mid H_i,H_o]q_k(H_o)\,d\rho_j^{\rm in}d\rho_k^{\rm{out}}$ 的积分；端律因缓冲支撑不相交已是乘积，但方括号项仍耦合两端，此刻不许因子化（05-transfer.tex:639-655）。经可容许性与支配引理，把 $t_r$ 换成连续函数 $T_r$、输出范数误差 $o(1)\lVert v\rVert_r$，固定 $n$ 内对全部用对求和；前沿仍是真实图圈，其单端共形图与容度直接进 §9，无须宣称接触处光滑（05-transfer.tex:657-670）。

## §12 秩一分解、带符号相消与向 Poisson 模型的一致迭代

水平 $j$ 的内前沿绕心、住 comparable 半径、尖达到该半径，容度 $l_i\asymp a_j$；外前沿同理 $l_o\asymp b_k$（05-transfer.tex:674-680）。分离式给出 $T_r=K\,U(H_i)V(H_o)+O((a_j/b_k)^{\lambda+\sigma_1})$，$U=l_i^\lambda J(y^0)^{1/3}$、$V=l_o^{-\lambda}J(x^0)^{1/3}$，$|UV|\le CL^{-\lambda}2^{\lambda(j+k)}$（05-transfer.tex:681-698）。删掉额外中部屏（用独立内部变量、成功律下失败 $o(1)$），余下端实验对每个用对支撑不相交；定义标量泛函与输出消息 $u_j(v)=\int\alpha_jU\,d\rho_j^{\rm in}$、$v_k=\int Vq_k\,d\rho_k^{\rm out}$，该用对主项恰为 $Ku_j(v)v_k$；同样的式子对支撑未必不相交的额外水平对也定义，取其各自积分之积，不假装同时实验（05-transfer.tex:700-717）。令 $M_1v=K(\sum_ju_j(v))(\sum_kv_k)$，秩至多一；由六臂尾与因子尺度，$\lVert M_1\rVert\le CL^{-\lambda}\sum 2^{-(2+\tau-\lambda)(j+k)}\le CL^{-\lambda}$，人为多放的 $j+k>n-d$ 项 $\le C(n+1)^2L^{-2-\tau}$；压小 $\sigma_1$ 使 $\lambda+\sigma_1<2+\tau$，分离式误差求和 $\le CL^{-\lambda-\sigma_1}+o(1)$。合尾巴引理，固定比传输命题的前两条在网格先行极限下成立，且一切误差以输出全变差计，不是只对某个固定连续事件测（05-transfer.tex:718-757）。

偶各向同性输入的强估计只需多看两步对称性。连续替换后删额外中部屏，唯 $T_r$ 双端相依。整体旋转内端数据：$v$ 各向同性令 $\alpha_j$ 不动；整体翻色内端：消息作为几何变换后的带符号测度仍不变，参考向量 $\delta_B-\delta_W$ 变号，故 $\alpha_j(\operatorname{rot}_\theta H_i)=\alpha_j(H_i)$、$\alpha_j(\operatorname{flip}H_i)=-\alpha_j(H_i)$，内端律本身旋转与翻色不变，四尖标号可用辅助角轴颜色无关地选定并随旋转搬运（05-transfer.tex:759-778）。固定外历史下翻色配对给出 $\int\alpha_jT_r\,d\rho_j^{\rm in}=\frac12\int\alpha_j[T_r(H_i,H_o)-T_r(\operatorname{flip}H_i,H_o)]\,d\rho_j^{\rm in}$；再对内端数据做旋转平均，右边成对旋转平均的 $T^+-T^-$ 之半的积；这里论文明示：符号必须保留，把差换成无符号四尖事件就丢了指数（05-transfer.tex:779-794）。§9 旋转平均界 $C(a_j/b_k)^{2+\sigma_2}$ 压上，$\sigma_2<\tau$，用对贡献 $\le CL^{-2-\sigma_2}+o(1)$，加未用部分，幂严格大于二（05-transfer.tex:796-808）。最后选 $\delta$ 小于所有正零头并吸收 $n$ 的多项式，再对每个固定的足够大 $n$ 选 $r_0(2^n)$ 压灭 $o(1)$。顺序即全文立的规矩：先取比、后取尺度阈值；Cardy 收敛、好序列抽取、非简单极限岸附近，一律没有速率参与（05-transfer.tex:810-817）。

推论 fair-insertion（05-transfer.tex:826-904）把强估计卖给 Poisson 模型。在切口中心插一带独立公平颜色的核子，取接缝半径 $s$ 处有此插对无此插的内部状态律之差（条件接缝并强制屏成功），其消息 $I_s$ 满足 $\lVert I_s\rVert_s\le Cs^{-2-\nu}$，且对筛查环带外、不进入内部的固定外部数据稳定。证明选 $L$ 使每块常数被更小幂吸收，用 $r_j=L^jr_0$ 铺到 $s$；屏全成功时逐块迭代 cancellation 界；失败构型按最大失败半径 $v$ 分组，用恒等式 $\mathbf1_{G_{r_N}}=\prod_{i=0}^N\mathbf1_{G_{r_i}}+\sum_{j=0}^{N-1}\mathbf1_{G_{r_j}^c}\prod_{i=j+1}^N\mathbf1_{G_{r_i}}$ 精确拆分，在下一切口 $Lv$ 处用同一 base-process 乘子 $\mathbf1_{G_v^c}$ 重造两个内部律之差：零质量、偶、各向同性都还在，重置范数至多 $2\mathbb P(G_v^c\mid\Sigma_{Lv})\le Ce^{-cv^2}$（$v$ 与 $Lv$ 环带不相交；$Lv$ 成功保证两侧同用该切口）；再经上方成功切口传输，几何级数带指数权求和回 $Cs^{-2-\nu}$。插入点在屏内不可达其圈，两律同状态空间、各质量一，差的范数至多二（05-transfer.tex:843-903）。

推论 wedge（05-transfer.tex:906-960）把秩一卖给两个外尺度。在消息空间 $\mathcal B_t$ 的代数张量平方上取射影范数 $\lVert z\rVert_\pi=\inf\sum_i\lVert u_i\rVert\lVert v_i\rVert$；有界泛函对张量的作用受范数乘积界，特别地 $u\otimes v-v\otimes u$ 给出行列式。单块 $M=M_1+E$ 在反对称张量上杀 $M_1\otimes M_1$，故 $\lVert M\otimes M\rVert\le2\lVert M_1\rVert\lVert E\rVert+\lVert E\rVert^2\le CL^{-2\lambda-\delta}$；$L$ 取大吸收常数、与插入推论同步定，迭代得 $\lVert\mathcal Mu\wedge\mathcal Mv\rVert_\pi\le C(s/r)^{-2\lambda-\nu'}\lVert u\rVert_r\lVert v\rVert_r$，$\mathcal M$ 为逐块复合且中间屏全成功；## §13 对强度求导：把 $f$ 的账交给插入核

机件造完，回到振幅本身。记 $X_R(\eta)$ 为 $RQ_0$ 黑左--右穿越示性（闭胞约定），$H_R(\eta)=X_R(\eta\cup\{0^{\rm b}\})-X_R(\eta\cup\{0^{\rm w}\})\in\{0,1\}$，于是 $f(R)=\mathbb E H_R$；对 $y\ne0$ 定义插入核 $K_R(y)=\mathbb E[H_R(\eta\cup\{y^{\rm f}\})-H_R(\eta)]$，额外颜色也进期望（06-amplitude.tex:15-28）。这里有个我一开始就差点踩歪的点：$K_R$ 是色关键点概率的插入差，不是 Poisson 关键点概率；06-amplitude.tex:29-32 特意重申这点，因为整节的微分只把插入当测度导数工具用。

强度微分引理（06-amplitude.tex:34-93）给 $f\in C^1(0,\infty)$ 与 $(R/2)f'(R)=\int_{\R^2}K_R(y)dy$。链路：强度 $t$ 的过程 $\eta_t$ 满足 $\mathbb E H_R(\eta_t)=f(\sqrt t\,R)$（欧氏缩放）；先用 $B(0,2^n)$ 内的截断测试 $H_{R,n}$，靠 $2^n$ 内侧的局域屏保证触到 $RQ_0$ 的每个胞可读，误差 $C_R\exp(-c_R4^n)$，且 $H_{R,n+1}=H_{R,n}$ 差同样受控；有限体积 Poisson 级数绝对收敛可微（Last--Penrose 讲义 Theorem 19.1，references.tex:49-53），score 恒等式 $\frac{d}{dt}\mathbb E F(\eta_t\cap D)=\mathbb E[F(\frac{N_t(D)}{t}-|D|)]$ 中方括号二阶矩 $|D|/t$，Cauchy--Schwarz 把截断导数差压成 $C_R2^n\exp(-c_R4^n)$，一致可和，$G_R$ 的 $C^1$ 与导数交换落定；add-one 公式对 $H_{R,n}$ 逐点趋全平面核，$|y|\ge CR+C$ 处一道围住 $RQ_0$ 与原点、严格差一点够不着 $y$ 的屏给出控制 $C_Re^{-c_R|y|^2}$，有界集内常数 $2$ 足够，受控收敛完成证明（06-amplitude.tex:42-93）。

归一化尾巴引理（06-amplitude.tex:102-347）是全文最厚的一块估计，目标 $\int_{|y|>m}|K_R|\le Cf(R)(m^{-\xi}+R^{-\xi})$，$m_0\le m\le R/100$。开工前我先把"臂需求乘带符号消息"的原理立住：$K_R$ 是混合差分（中心改色差与 $y$ 处插入差），混合差分非零则改中心色在某个插入设定下变穿越、动插入在某个中心设定下变穿越，被屏隔开的探针在四构型读同一批底色，必要的臂蕴含对共有底色成立（06-amplitude.tex:118-129）。条件版靠帽的实现性：任何形式非交叉配对都能在拓扑圆盘里画成不相交墙弧、互补区域交替染色实现规定色段与配对；两帽态给出圆盘外探针全同的两种平面填充，必要臂论证不需盘内 Poisson 几何；固定 $y$ 处切口成功、其缝与全部外部变量后，外测试成为内部连接状态的函数，必要事件不发生则中心黑减白测试对每个状态为常数，零质量插入消息湮灭常数，条件回答受消息全变差乘必要探针示性，后者在切口外可测、缓冲支撑不相交时概率相乘（06-amplitude.tex:131-151）。带失败屏的臂探针记账（06-amplitude.tex:153-179）沿用 §1 输入节的约定：按最大失败半径 $v$ 分组、自 $C_0v$ 起重用独立臂测试，$e^{-cv^2}A(C_0v,R)\le CA(r,R)(v/r)^ge^{-cv^2}$，几何求和保臂代价；失败大到触及中心探针的构型另案处理，中心探针整个丢掉，不冒充独立。

三案分层。近心案 $m<t\le R/100$（$t=|y|$）：取 $c_1$ 小、$a$ 相对 $c_1$ 更小，切口半径 $at$、中心四臂探针 $b_*\to at$、包围双插入的四臂探针 $a^{-1}t\to aR$，缓冲互斥；成功时插入消息给 $Ct^{-2-\nu}$，乘两个臂因子，界 $Ct^{-2-\nu}A(b_*,t)A(t,R)$；失败按 $v<c_1t$（两探针保留，付 $Ce^{-ct^2}A(b_*,t)A(t,R)$）与 $v\ge c_1t$（弃中心探针，改用原点心、从 $C_1(v+t)$ 到 $aR$ 的包围四臂探针，$e^{-cv^2}A(C_1(v+t),aR)\le CA(b_*,R)(v+t)^ge^{-cv^2}$，几何求和成 $CA(b_*,R)e^{-c't^2}$，径向范围掏空时靠多项式下界 $A(b_*,R)\ge cR^{-g}$ 同样收尾）；合并并用拟乘性与 $f\asymp A(b_*,R)$ 得 $|K_R(y)|\le Cf(R)t^{-2-\nu}$，体积分 $\int_m^\infty t^{-1-\nu}dt$ 成 $Cf(R)m^{-\nu}$（06-amplitude.tex:181-231）。近边近角案 $R/100<|y|\le10R$（含矩形外侧）：$d(y)$ 到 $\partial(RQ_0)$、$u(y)$ 到角集 $\mathcal C_R$ 的距离各以 $d_*$ 截下、$\rho R$ 截上；中心四臂探针到 $cR\ll R/100$ 花 $CA(b_*,R)$；内点用半径 $\sim d$ 的插入切口吃 $d^{-2-\nu}$，外点筛查成功时 quad 纹丝不动、只剩指数失败同样受 $Cd^{-2-\nu}$；$u/d$ 大时靠边直、 Crossing 变化要求半平面三交错免费臂探针，花 $C(d/u)^2$，投影落角附近则两距离可比免此探针；$u$ 未截且小时加角心一臂探针 $(u/R)^\beta$，截上后该项成常数可省；支撑排列先定 $cR$ 再取 $\rho R$ 远小，失配处失败求和 $\sum_{v\ge c_3d}e^{-cv^2}(1+v/d)^2(1+v/u)^\beta\le Cd^{-2-\nu}$，$v\ge c_2R$ 全弃臂付 $Ce^{-c'R^2}$ 由 $A(b_*,R)\ge cR^{-g}$ 吸收；合成 $|K_R(y)|\le CA(b_*,R)d^{-2-\nu}(d/u)^2(u/R)^\beta$；二进分类面积 $\le cud$，先对 $d$ 求和（用到 $\nu<1$）得 $Cu^{-\nu}(u/R)^\beta$，再对 $u$ 求和成 $CR^{-\xi_0}$（$\xi_0<\min(\beta,\nu)$，等号情形的对数被严格不等号吃掉），即 $Cf(R)R^{-\xi_0}$（06-amplitude.tex:233-338）。远外案 $|y|>10R$：一致屏直接 $Ce^{-c|y|^2}$，被 $f$ 的多项式下界吸收（06-amplitude.tex:340-347）。

## §13 定理收口：振幅 $c_V=Ba/c$，以及最终思路与最初设想的差异

对数误差直接积分成定理。$\frac{d}{dR}\log(R^\lambda f(R))=O(R^{-1-\alpha})$ 在无穷远可积；$f(R)>0$（大 $R$ 下由指数引理双侧界），故 $\log(R^\lambda f)$ 有有限实极限，$R^{5/4}f(R)\to a\in(0,\infty)$，顺带 $R^{5/4}f(R)=a(1+O(R^{-\alpha}))$。论文明着写了这一步的讲究：正性与有限性靠的是对数收敛，光有归一化概率的有界性给不出 $a>0$（06-amplitude.tex:482-495）。接校准：$S_\varepsilon=f(1/\varepsilon)$，故 $S_\varepsilon\sim a\varepsilon^{5/4}$；$\lim m_\varepsilon q_\varepsilon S_\varepsilon=c$ 逼出 $q_\varepsilon\sim(c/a)\varepsilon^{3/4}$；$\lim q_\varepsilon\mathbb E N_\varepsilon=B$ 遂给 $\varepsilon^{3/4}\mathbb E N_\varepsilon\to Ba/c=:c_V\in(0,\infty)$，$N_\varepsilon$ 数的仍是原始未接线单位方形的色关键点，Poisson 插入只在微分 $f$ 时当工具用、没改关键点计数；取倒数得近临界尺度的等价陈述（06-amplitude.tex:496-518）。

复盘差异，我列五条。第一，出发时想的是臂指数的三明治（§2），落地时换成带符号消息上的算子分解：$M=M_1+E$、张量积杀反对称、旋转平均吃偶子空间；指数的角色从头到尾只是热身，真正的幂次增益 $+\delta$ 与 $2+\delta$ 全部来自谱间隙与对称性（03-spectrum.tex:318-364 与 04-shape.tex:147-230）。第二，我原以为振幅常数会把主项 $K$ 显式带出来，实际收尾里 $a$ 只通过对数积分出现，$K$ 止步于 $W^\pm$ 均值的公共极限（03-spectrum.tex:421-428），行列式方法把两尺度各自的未知主因子自相消掉了（06-amplitude.tex:358-412），论文全篇没有给 $c_V$ 的任何数值。第三，"要不要 Cardy 收敛速率"的犹豫被结构性地解决：不是回避速率，是把每一处速率的潜在需求替换成"先定比 $L$、后取尺度阈值 $r_0(L)$"的两段式（05-transfer.tex:815-817 与 00-introduction.tex:134-137），迭代段内所有 $o(1)$ 都有固定幂次托底。第四，最初把四臂指数 $5/4$ 当作故事的结尾（$\varepsilon^{-2}\cdot\varepsilon^{5/4}$ 一乘完事），最后发现 $5/4$ 在证明里出现了三次身份：臂概率的幂、$Lh=-\lambda h$ 的基态本征值、以及 $\int\lvert V_p\rVert<\infty$ 之外的全部衰减预算，三者等同这件事（Calogero--Sutherland 一侧，03-spectrum.tex:171-189）是动笔后才看清的。第五，可积性门槛让我改写了"什么是够好的估计"：无符号四臂界给不出 $s^{-2-\nu}$（00-introduction.tex:118-121），我不得不发明一个观察对象之外的量（带符号连接状态消息）并让它携带对称性，强估计 $\lVert M\rVert_{\mathrm{even,iso}}\le CL^{-2-\delta}$ 是这条路的产物，最初的问题陈述里根本没有它的容身之处。

## §14 方法论遗产、可复用件与信息缺口

引言末尾我留了一句自评（00-introduction.tex:138-140）：对任意带符号边界数据的一致性与"秩一收缩、对称增强衰减"的分离，这两个技术特征可能对别的振幅问题有用。拆开看，可复用件至少有五。其一是消息空间设计：零质量、屏上截断、条件全变差本质上确界三件套把"任意复杂边界连接状态"压进 Banach 代数，配支配引理后概率误差可先于条件化被积掉（05-transfer.tex:67-108,209-247）。其二是屏失败重设术：几何级数切口上按最大失败半径分组，下一切口用同一 base-process 乘子重造零质量差，指数失败权对任意大 $R$ 一致可和（05-transfer.tex:859-903；01-inputs.tex:67-88 的 screened 臂探针是它的孪生）。其三是腔上扩散的全套标准动作：Lyapunov 防碰撞、FK 容无界初值、耗散耦合给 $L^q$ 到 sup、Girsanov 矩控 Lipschitz（03-spectrum.tex:207-298），这套不依赖逾渗本身。其四是"实部均值跨柱不变"的粗边界共形比较：模与角误差只用 $Ca/b$ 与 $(1+\log(b/a))a/b$ 度量两端单量，对数因子来自接力盘数（04-shape.tex:89-144）。其五是对数导数收束法：$g=Rf'/f$ 的二进摆动 $CR^{-\alpha}$ 同时给极限存在、误差率与常数识别 $\gamma=-\lambda$，避免直接估 $f(R_2)/f(R_1)$（06-amplitude.tex:423-478）。

信息缺口我如实登记。[推测] 一：论文没有交代任何研究史，本笔记的全部"路线失败与转折"是我从文本结构反推的思维链重构；能钉住的硬文本依据是引言的机制段（00-introduction.tex:93-140）与各节开头的动机段，其余第一人称细节属于合理重构，凡超出引文支撑处均已在行文内就地用条件句标记。[推测] 二：$c_V$ 的数值、甚至正负之外的解析信息，build 目录内无载体，数值化需要另外的输入（如 $[V]$ 的常数 $B,c$ 的可计算化），本文献未做。[推测] 三：姊妹篇 [V] 在被派目录之外，本单规格禁止读取其他 preprints 目录，我只转述本文对它的引用声明（Lemmas 2.1-2.3、2.5、2.7、2.8、2.11、3.1、3.4-3.7、4.5、6.1、7.1、7.2 等，01-inputs.tex:45,122-124,189-195），其证明未经我亲验。[推测] 四：$K$ 是否严格为正在本文内未单独论证（03-spectrum.tex:378 只写 $K\ge0$），最终 $a>0$ 走的是对数收敛路线，两常数之间的关系文本未展开。这几条缺口不改主链，但决定我若续写必须换素材来源。

补两条自查纪律的总结，作为研究笔记的收束。其一，极限顺序就是定理内容的一部分。本文对 Assumption cardy 的全部依赖都按同一个模板兑现：固定半径、缓冲、域测试在网格趋零之前（01-inputs.tex:90-92），先取比 $L$ 再取阈值 $r_0(L)$（05-transfer.tex:810-817），先删中部额外测试再因子化两端积分（05-transfer.tex:164-176），先固定 excursion 尺度做排除再让尺度趋零（05-transfer.tex:460-464）。任何一处顺序颠倒，都会把"沿子序列成立"的定性输入用成它给不起的一致声明；支配引理的存在（05-transfer.tex:213-247）就是为了让我在结构上根本没有机会犯这类错，误差先被压进独立区域的期望，再谈条件化。其二，观测量决定工具的对称性预算。我选的观测量是带符号消息（零质量、偶、各向同性各管一段），每省一次对称性就丢一次幂：翻转对称给 $\alpha_j$ 的奇性（05-transfer.tex:769-774），旋转对称给投影 $\Pi$ 的资格（03-spectrum.tex:367-374），二者共同供出可积性门槛 $2$ 上方的全部余量；秩一收缩走另一条路，靠 $M_1\otimes M_1$ 在反对称张量上为零（05-transfer.tex:942-950），两条路的增益在 §15 的 $\zeta$ 选配里合并成 $\alpha=\min(\nu'/2,\zeta\xi)$ 这一个收束率（06-amplitude.tex:455-459）。[推测] 若把同一框架推向其它模型的关键点振幅，最先要复查的是这两条纪律各自的接口：目标模型是否有与 $\delta_B-\delta_W$ 对应的两状态帽结构，以及色翻转与旋转对称在其边界数据上是否仍然精确。[推测] 另一处可复查点：本文传输机件只消费了"四尖留一坐标"这一低秩事实，若某模型的界面配对在四状态以上仍带一个固定的带符号商，秩一分解或可替换成秩 $k$ 分解，其张量积论证需要 $M_1^{\otimes2}$ 在反对称子空间像的维数信息；这条推测在 build 目录内没有文本依据，仅作下一步实验备忘，不属于本文已证内容。

收束一句：本笔记的反推工程到此闭环，所有判断都可在 §17 台账的位置栏里回查原文行号；凡台账位置栏到达不了的句子，正文内已就近标了 [推测]，两处标记体系互为审计。

## §15 两尺度行列式与可求和的对数误差（标题为事后补插，正文原样保留，过程见 §17 勘误）

尾巴允许扔掉远处插入；剩下 $|y|\le m$ 的近处插入，对 $f$ 归一化后的响应应当几乎与外矩形尺寸无关。两尺度行列式引理（06-amplitude.tex:358-412）断言：$100m\le R\le R'\le2R$、几乎每个 $0<|y|\le m$ 时 $\lvert K_R(y)f(R')-K_{R'}(y)f(R)\rvert\le C(m/R)^{2\lambda+\nu'}+Ce^{-cm^2}$，常数与 $y$ 到原点距离无关。构造：从 $10m$ 到 $R$ 的固定小分数铺比例 $L$ 的同心切口，全在两矩形之内、双插入之外，末半径向下取整到网格、与 $R$ 之比有赖于 $L$ 的正下界；先给所有切口强加公共 base-process 屏成功，扔掉的质量由几何级数 $\sum_j\exp(-cm^2L^{2j})\le Ce^{-c'm^2}$ 界住；第一切口处取 $a$＝改中心色的连接状态消息、$b_y$＝有无 $y$ 处公平点对该消息的差，各自零质量、范数至多 $2$ 与 $4$，且它们对 $R,R'$ 完全同构（构造只用公共内部 Poisson 变量与第一缝，甚至不需要 $0,y$ 邻域不相交）；$\ell_R,\ell_{R'}$ 为末切口上两外矩形穿越测试给出的有界线性泛函，$T$ 为中间复合转移，四个受限期望 $\ell_R(Ta),\ell_{R'}(Ta),\ell_R(Tb_y),\ell_{R'}(Tb_y)$ 的行列式就是 $T^{\otimes2}$ 作用在 $b_y\otimes a-a\otimes b_y$ 上经 $\ell_R\otimes\ell_{R'}$ 的求值，wedge 推论给 $C(m/R)^{2\lambda+\nu'}$；补回扔掉的事件每个标量因子有界，误差 $Ce^{-cm^2}$（06-amplitude.tex:369-412）。注意我全程没认出 $K_R$ 的主项是谁，行列式把未知因子自己消掉了，这是"振幅存在但值不显"的技术根源。

对数误差命题（06-amplitude.tex:414-478）收网。令 $g(R)=Rf'(R)/f(R)$，取 $\zeta=\frac{\nu'}{4(2+2\lambda+\nu')}$、$\eta=\frac{\nu'}8$、$m=R^\zeta$；指数引理给 $f(s)\ge s^{-\lambda-\eta}$；把行列式除以 $f(R)f(R')$ 在 $|y|\le m$ 积分，左边是两归一化近程核积分之差，右边 $CR^{2\lambda+2\eta}m^2[(m/R)^{2\lambda+\nu'}+e^{-cm^2}]\le CR^{-\nu'/2}$，幂次账 $-\nu'+2\eta+\zeta(2+2\lambda+\nu')=-\nu'/2$ 是设计好的；互补程由尾巴引理各 $\le CR^{-\zeta\xi}$；由 $g(R)=2\int K_R/f(R)$ 得二进摆动界 $\sup_{R\le R'\le2R}|g(R')-g(R)|\le CR^{-\alpha}$，$\alpha=\min(\nu'/2,\zeta\xi)$；$g(2^nR_0)$ 是 Cauchy 列，二进点间插回得 $g\to\gamma$ 且 $|g(R)-\gamma|\le C'R^{-\alpha}$；积分 $\log f(R)-\log f(R_0)=\int g\,ds/s$ 除以 $\log R$ 认 out $\gamma=-\lambda$（靠指数引理的另一侧），于是 $\lvert Rf'/f+\lambda\rvert\le CR^{-\alpha}$（06-amplitude.tex:423-477）。

## §16 勘误

一，追加事故：写 §13/§14 时误把"## §15"标题行当锚点整体替换，该标题一度从盘面上消失；随后以纯插入方式在 §15 正文前补回标题并注明，正文一字未删。代价是物理节序成为 §0 至 §13、§13、§14、§15、§16、§17，规格禁止重排已落盘内容，故保留此序，编号语义不受影响。

二，§4 末段"第 5--7 节（对应论文的 02、03、04 节）、第 8--9 节（05-transfer）、第 11--13 节（06-amplitude）"是动笔前的小节框架预算数，与最终框架的对应关系应为：本笔记 §5 至 §9 覆盖论文 02、03、04 三节，§10 至 §12 覆盖论文 05 节，§13 至 §13 覆盖论文 06 节。

三，§4 中"无符号四臂界只供得起 $A\sim t^{-5/4}$ 型信息"一句表述过急。严格账目：若从成功界 $Ct^{-2-\nu}A(b_*,t)A(t,R)$ 中删去插入因子 $t^{-2-\nu}$，剩 $O(A(b_*,t)A(t,R))=O(f(R))$（拟乘性），在环带 $\{m<|y|<R/100\}$ 内无任何径向衰减，积分吃面积因子即告失效；论文原句依据 00-introduction.tex:120-121 与 build/sections/06-amplitude.tex:190-231。

四，§6 腔定义里 `(2\pi\Z\one)` 是手滑的未定义宏，应为 $2\pi\mathbb Z\mathbf 1$（build/sections/03-spectrum.tex:19）。

五，英文残留按术语混排直读：§9"光滑度一条都不 imposed"读作完全不施加光滑性约束；§10"机器主轴承"为比喻；§11/§12 的 comparable、cancellation、base-process、wedge、excursion、screened、wired，§13 的 score、quad、Cauchy，§14 的 Lyapunov、Girsanov，均按通行术语理解，不再逐一回改以守"不回改已落盘"之例。

六，§15"认 out 出 $\gamma=-\lambda$"中 out 为衍字，读作"认出"。

## §17 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\eta_\varepsilon$ 强度 $\varepsilon^{-2}$ | 齐次 Poisson 过程强度约定 | build/sections/00-introduction.tex:3 | $N_\varepsilon$ 定义与校准 $m_\varepsilon=\varepsilon^{-2}$（build/sections/01-inputs.tex:170） | 约定一改，§13 收尾的 $S_\varepsilon\sim a\varepsilon^{5/4}$ 换算断 |
| Cardy 值 $x^{1/3}{}_2F_1(\tfrac13,\tfrac23;\tfrac43;x)$ | 上半平面归一的穿越概率 | build/sections/00-introduction.tex:28-29 | Assumption cardy 的唯一内容（build/sections/00-introduction.tex:17-21） | 假设即 §0 登记对象，改动使全篇前提换页 |
| $\lim\varepsilon^{3/4}\mathbb E N_\varepsilon=c_V$ | 主定理结论，$c_V\in(0,\infty)$ | build/sections/00-introduction.tex:39 | 全文靶子与 §13 收尾 | 单点失败处，上游 §5 至 §13 全链皆为其服务 |
| $\lambda=5/4$ | 四交错臂指数兼基态本征值 | build/sections/01-inputs.tex:236 | §7 的 $Lh=-\lambda h$（build/sections/03-spectrum.tex:184）与 §13 指数三身份 | 幂次账 $-\nu'+2\eta+\zeta(2+2\lambda+\nu')$（build/sections/06-amplitude.tex:444-447）崩 |
| $f(R)=S_{1/R}$ | 中心插入关键点概率的欧氏缩放像 | build/sections/01-inputs.tex:172 | §13 整节的微分对象 | 定义错位则导数公式（build/sections/06-amplitude.tex:38）无主语 |
| $m_\varepsilon q_\varepsilon S_\varepsilon\to c$ | 单时刻校准极限 | build/sections/01-inputs.tex:180 | §13 的 $q_\varepsilon\sim(c/a)\varepsilon^{3/4}$（build/sections/06-amplitude.tex:500-508） | 缺它则 $c_V=Ba/c$ 表达式无来源 |
| $q_\varepsilon\mathbb E N_\varepsilon\to B$ | prescribed 归一化自身的极限 | build/sections/01-inputs.tex:181 | §13 收尾（build/sections/06-amplitude.tex:510-511） | 缺它则 $c_V$ 定义断最后一环 |
| $f(R)\asymp A(b_*,R)$ | 关键点概率等价四臂概率 | build/sections/01-inputs.tex:185 | §13 的 $Cf(R)t^{-2-\nu}$ 界与远外吸收（build/sections/06-amplitude.tex:226,344） | 失则归一化尾巴（build/sections/06-amplitude.tex:107）不成立 |
| $f(R)=R^{-5/4+o(1)}$ | 指数引理，有指数无振幅 | build/sections/01-inputs.tex:201 | §15 认 $\gamma=-\lambda$（build/sections/06-amplitude.tex:475-477）与 §2 失败路线登记 | 去它则对数导数极限无法识别 |
| $c(r/s)^g\le A(r,s)\le C(r/s)^{1+\alpha}$，$g\in(1,2)$ | 臂概率双侧幂界 | build/sections/01-inputs.tex:27-28 | §11 与 §13 的失败屏记账、下界吸收 | 下界失则 $Ce^{-c'R^2}$ 吸收（build/sections/06-amplitude.tex:296-299）无据 |
| $A(r,t)\asymp A(r,s)A(s,t)$ | 拟乘性 | build/sections/01-inputs.tex:28-29 | §2 迭代与 §13 臂因子合并（build/sections/06-amplitude.tex:226） | 失则 $A(b_*,t)A(t,R)$ 换 $f(R)$ 的 sandwich 断 |
| $C\exp(-cs^2)$ | 屏失败指数界 | build/sections/01-inputs.tex:37-39 | §12 重置记账（build/sections/05-transfer.tex:881-886）与 §15 丢弃质量 | 若退化幂率，$e^{-cm^2}$ 项在行列式里不可忽略 |
| $H_{\mathsf b}-H_{\mathsf w}=\mathbf 1_{\mathcal T}$ | 帽恒等式 | build/sections/02-annuli.tex:39 | §11 用对积分结构（build/sections/05-transfer.tex:639-641） | 失则带符号差经环域传输无代数把手 |
| $T^\pm(p,x,y)$ | 圆环数据传输极限，连续 | build/sections/02-annuli.tex:353-354 | §6 谱分析的全部对象 | 未定义则模方程无主语 |
| 碰撞一致归零 | Lemma collision 首条 | build/sections/02-annuli.tex:467-468 | §7 Feynman--Kac 侧面贡献蒸干（build/sections/03-spectrum.tex:250-253） | 否则粗边界处光滑引理初值界崩 |
| $\partial_pT=(L+B_p\cdot\nabla)T$ | 模方程 | build/sections/03-spectrum.tex:31 | §8 全部谱账 | 失则秩一渐近无从导出 |
| $\lVert B_p\rVert_{C^k}\le C_{k,p_0}e^{-p}$ | 扰动场指数衰减 | build/sections/03-spectrum.tex:41 | §8 forcing 界（build/sections/03-spectrum.tex:400） | 衰减变差则奇偶两指数同时受损 |
| $H_p(u)-\cot(u/2)=O(e^{-2p})$ | 环面 Loewner 核误差 | build/sections/03-spectrum.tex:80-81 | 主动开关方程装配（build/sections/03-spectrum.tex:84-97） | 失则 $B_p$ 的上界无出处 |
| $\partial_tF_t(U_t)=-3F_t''(U_t)$ | $\kappa=6$ 处 It\^o 漂移相消 | build/sections/03-spectrum.tex:69-71 | 驱动角方差 $6$ 之认定（build/sections/03-spectrum.tex:60-63） | 算错则 $L$ 的 $3\partial_{ii}$ 系数改 |
| $J=\prod_{i<j}\sin\frac{w_j-w_i}{2}$，$h=J(x)^{1/3}J(y)^{1/3}$ | 基态与指数 $1/3$ | build/sections/03-spectrum.tex:173-174 | $h$ 变换与 $m=J(x)^{4/3}J(y)^{4/3}$（build/sections/03-spectrum.tex:190-193） | 指数一换 $Lh=-\lambda h$ 不再成立 |
| $W(p)=e^{\lambda p}T(p)/h$ | 变换解 | build/sections/03-spectrum.tex:196 | §8 Duhamel 展开（build/sections/03-spectrum.tex:402-404） | 忘 $e^{\lambda p}$ 则一切衰减与 $\lambda$ 错位 |
| $\lVert W(p)\rVert_\infty+\operatorname{Lip}W(p)\le C_{p_0}$ | 腔上均匀光滑 | build/sections/03-spectrum.tex:211 | §8 forcing 估计的起跑线 | 失则 $F_p$ 无 sup 界可 convolution |
| $\operatorname{Var}(F)\le\frac34\int\lvert\nabla_rF\rvert^2d\mu_r$ | 凸 alcove 上 Brascamp--Lieb | build/sections/03-spectrum.tex:338-339 | 相对间隙 $1/2$（build/sections/03-spectrum.tex:340） | 失则三层间隙全塌 |
| 间隙 $\tfrac12$、$\tfrac34$、$1$ | 三层谱间隙 | build/sections/03-spectrum.tex:319-324 | 奇衰减 $e^{-3p/4}$ 与投影衰减 $(1+p)e^{-p}$（build/sections/03-spectrum.tex:381-382） | 降任意一档，可积性门槛 $2$ 迈不过 |
| $\lVert W_-(p)\rVert_\infty\le Ce^{-3p/4}$ | 带符号差的奇衰减 | build/sections/03-spectrum.tex:381 | §9 复合 $e^{-2p}$ 与旋转平均 | 失则 §13 插入界丢径向衰减 |
| $\lVert\Pi W_-(p)\rVert_\infty\le C(1+p)e^{-p}$ | 双零质心频率投影衰减 | build/sections/03-spectrum.tex:382 | 旋转平均主项 $C(1+q)\rho^{9/4}$（build/sections/04-shape.tex:212-213） | 失则 $\sigma_2$ 无正可取 |
| $T^\pm=e^{-\lambda p}(Kh+O(e^{-\sigma p}))$，$K\ge0$ | 圆环秩一渐近 | build/sections/03-spectrum.tex:384-385 | §12 分离式（build/sections/05-transfer.tex:681-686） | 失则 $M_1$ 的定义内容空转 |
| $\lvert p-p'\rvert\le Ca/b$，角误差 $C(1+\log(b/a))a/b$ | 两端映射比较，对粗边界一致 | build/sections/04-shape.tex:51-53 | §9 装配（build/sections/04-shape.tex:174-199） | 失则两端单数据的替换代价无法入账 |
| $K\,l_i^\lambda J(y^0)^{1/3}\cdot l_o^{-\lambda}J(x^0)^{1/3}$ | 分离端主项 | build/sections/04-shape.tex:154-155 | §12 因子 $U,V$ 与 $M_1v$（build/sections/05-transfer.tex:689-722） | 失则秩一分解写不出 |
| $\bigl\lvert\int_0^{2\pi}(T^+_\phi-T^-_\phi)\,d\phi/2\pi\bigr\rvert\le C(a/b)^{2+\sigma_2}$ | 旋转消相 | build/sections/04-shape.tex:163-165 | §12 带符号求和（build/sections/05-transfer.tex:796-806） | 失则偶各向同性块界过不了 $L^{-2}$ 门槛 |
| $\lVert M\rVert\le CL^{-\lambda}$，$M=M_1+E$，$\lVert E\rVert\le CL^{-\lambda-\delta}$ | 固定比传输三谱系 | build/sections/05-transfer.tex:116-117 | §12 wedge 迭代（build/sections/05-transfer.tex:942-950） | 失则 §15 行列式收缩无源 |
| $\lVert M\rvert_{\mathrm{even,iso}}\rVert\le CL^{-2-\delta}$ | 对称子空间块范数 | build/sections/05-transfer.tex:120-121 | §12 fair-insertion 推论（build/sections/05-transfer.tex:826-904） | 失则 $\lVert I_s\rVert_s\le Cs^{-2-\nu}$ 不成立 |
| $\lVert I_s\rVert_s\le Cs^{-2-\nu}$ | 公平插入消息界 | build/sections/05-transfer.tex:835 | §13 体核估计（build/sections/06-amplitude.tex:190-224） | 失则 $\int_m^\infty t^{-1-\nu}dt$ 无从被控 |
| $\lVert\mathcal Mu\wedge\mathcal Mv\rVert_\pi\le C(s/r)^{-2\lambda-\nu'}$ | 反对称张量收缩 | build/sections/05-transfer.tex:931 | §15 两尺度行列式（build/sections/06-amplitude.tex:405-408） | 失则近程归一化响应随外尺度漂 |
| $\tfrac R2f'(R)=\int_{\R^2}K_R(y)\,dy$ | 强度导数恒等式 | build/sections/06-amplitude.tex:38 | §15 定义 $g(R)=2\int K_R/f$（build/sections/06-amplitude.tex:453） | 失则对数导数无表达式 |
| $\lvert K_Rf(R')-K_{R'}f(R)\rvert\le C(m/R)^{2\lambda+\nu'}+Ce^{-cm^2}$ | 行列式界 | build/sections/06-amplitude.tex:363-364 | §15 归一化差（build/sections/06-amplitude.tex:436-442） | 失则二进摆动界 $CR^{-\alpha}$ 崩 |
| $\zeta=\tfrac{\nu'}{4(2+2\lambda+\nu')}$，$\eta=\tfrac{\nu'}8$，$m=R^\zeta$ | 三尺度选配 | build/sections/06-amplitude.tex:429-431 | §15 幂次核对（build/sections/06-amplitude.tex:444-447） | 任改一者，$-\nu'/2$ 余量即负 |
| $\lvert Rf'/f+\lambda\rvert\le CR^{-\alpha}$ | 对数误差可和率 | build/sections/06-amplitude.tex:417 | §13 的 $R^{5/4}f\to a$（build/sections/06-amplitude.tex:485-491） | 失则振幅存在性整体失效 |
| $c_V=Ba/c$ | 最终振幅常数 | build/sections/06-amplitude.tex:510 | 主定理最后一行 | 两条校准极限任缺其一表达式即断 |

