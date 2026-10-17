# D260 研究笔记：正交不变 Ising 自旋玻璃的全温度压强

这份笔记用第一人称重构论文背后的思维链。我把自己放回研究者的位置：先接住一个悬而未决的问题，再一步步试错、碰壁、转向，直到变分式两端都能闭合。素材全部来自派单目录下 `build/*.tex` 的真实文本，凡推理超出文本证据之处，我都标 `[推测]` 并说明缺口所在。小节编号动笔前已排定，正文自 §1 起按论证顺序推进，§12 汇总关键转折，§13 交代与最初设想的分岔，§14 记录自查，§15 是全文唯一的五列台账。

## §0 派单参数与取材登记

派单编号 D260，参数取自 `.tools/wave.txt` 中以 D260 开头的那一行：row=84，bytes=216122，thin=no，dir 即下面登记的完整目录名。按规格，这属于厚素材：我先 `ls` 量出每个 `.tex` 的字节数，再用 `wc -l` 加一次模式定位找到各节定理声明的行号，然后按引言、主定理、两界证明、结论节分段 Read，共 15 次取证调用，首稿落在第 16 次调用。build 目录下的清单如下（字节数取自 `ls`）：invariant-sk.tex 15511（主文档与引言）、10-arrays.tex 25684、20-field.tex 15379、30-rotation.tex 28582、40-upper.tex 10212、50-cavity.tex 47053、60-general.tex 26567、70-magnetic.tex 38358、references.tex 8776。`typst/` 分片与 PDF 一律未碰；README 未读。落盘探针按规格执行：Write 之后先量基线字节，Edit 单行追加，再量一次复量，两次数字不同才算落盘成立。

本单的两条登记挂在 §0 末尾，逐字如下：

- 完整目录名：`preprints/All-temperature-pressure-for-orthogonally-invariant-Ising-spin-glasses-September-25-2026`
- 其他队列第 84 行号

## §1 初始动机：谱分布凭什么能决定立方体上的配分函数

我手里有一张对角阵 $\Lambda_N=\operatorname{diag}(\lambda_{1,N},\ldots,\lambda_{N,N})$，它的特征值描述了二次型在欧氏空间上的形状；可自旋系统只在这个空间的角点集 $\{-1,1\}^N$ 上采样这个二次型。特征值多面的一面，立方体离散的一面，两者之间的桥梁是什么。我最初的直觉是：如果特征向量足够"乱"，乱到可以用 Haar 正交共轭来模型化，那么压强应当只通过经验谱测度 $\mu_N=N^{-1}\sum_i\delta_{\lambda_{i,N}}$ 的极限 $\mu$ 依赖相互作用矩阵。这个直觉在物理文献里早有呼应：随机正交模型的复叠分析给过谱表示与 replica-symmetric、1RSB 的自由能预测（Marinari--Parisi--Ritort、Cherrier--Dean--Lefevre 一系），Bereyhi--Müller--Schulz-Baldes 甚至为旋转不变二次优化写出了形式化的有限步对称破缺公式。可是物理预测与严格定理之间隔着一条沟。

严格的压强定理此前只在高温一侧成立。Bhattacharya 与 Sen 在零场高温区域证明了压强公式；Fan 与 Wu 把外场加进来，仍然要求温度足够高，得到 replica-symmetric 形式；Fan--Misiakiewicz--Wang--Wen 用动态平均场分析给常数外场的一个显式高温判据。我读这些结果时的第一反应是：高温条件到底是证明技术的障碍，还是模型真实相图的边界。这个问题驱动了整篇工作。我猜技术障碍的成分更大，理由在 SK 模型的历史里能找到类比：Parisi 的层级序参量、Guerra 的变分上界、Talagrand 的匹配下界，这条线走完时没有人再需要限制温度；温度在严格证明里从来只是把展开式压收敛的拐杖，真正决定相结构的是重叠数组的几何。正交不变模型缺的是同一套拐杖的替代品。

有了这个猜想，我需要三件东西。第一，一个对所有固定温度都成立的变分式，形状上要保留 SK 模型那种层级重叠结构，谱测度则要从某个谱变换进入。第二，上界与下界各自的证明路线，上界大概率走 Guerra 式比较，下界走腔或者 ASS（Aizenman--Sims--Starr）式的重叠结构变分原理。第三，处理谱边缘的办法，因为低温一侧压强对最大特征值极端敏感，任何只用矩或者只用解析变换的公式都会在谱边缘断掉。

第一版草案里我犯了两个方向的错误，后来都付了代价。其一，我一开始想让谱信息通过 Stieltjes 变换的某种矩生成组合进入泛函，期待它在全温区解析；结果 $x$ 接近 0 与 $x$ 接近 1 的两侧行为完全对不上，矩展开在边缘处发散。其二，我期待上确界与下确界可以交换顺序，把场 supremum 提到重叠 infimum 之外，以为这样能顺手得到对偶问题；很快发现对偶问题的最优响应函数根本写不出来，交换顺序在这类层级泛函里没有依据。这两处错误在后文 §7、§8 的位置都留下了疤痕：正文反复强调 inf 与 sup 的顺序是本质性的，证明不允许交换它们，这正是从失败里提炼出来的纪律。

## §2 四个定义先钉死：压强、谱假设、边缘延拓与 $R$ 变换

现在把模型写到我可以直接演算的程度。Haar distributed 的 $U_N$ 作用于对角阵，压强取

$$P_N=\frac1N\log\Big[2^{-N}\sum_{\sigma\in\{-1,1\}^N}\exp\{\tfrac12\sigma^{\mathsf T}U_N^{\mathsf T}\Lambda_NU_N\sigma\}\Big],$$

温度与耦合常数全部吸收进 $\Lambda_N$，倒温度 $\beta$ 不再单独出现：给定物理温度就是把 $\Lambda_N$ 乘上对应倍数。自旋先验取均匀概率测度，也就是那个 $2^{-N}$ 因子；如果用计数测度，最终结果整体加 $\log2$。这两个约定看起来琐碎，我后来在零温推论里靠它们把 $\log2/\beta$ 的夹逼写得干干净净，约定混乱会在 $\beta\to\infty$ 时埋雷。

谱假设是三条：$\mu_N$ 弱收敛到一个紧支撑概率律 $\mu$，支撑端点记 $\lambda_-\le\lambda_+$；最小特征值的下极限不小于 $\lambda_-$；最大特征值的上极限不大于 $\lambda_+$。第二条与第三条合起来就是"没有渐近离群值"。这里我起初想偷懒：弱收敛本身已经控制了大部分特征值，极值条件大概可以省。§10 的反例说明省不得，一个逃逸到 $-\infty$ 的离群特征值足以让偶数维与奇数维的子列压强走向完全不同的极限。紧支撑也不是装饰：$\mu$ 允许带原子、允许奇异连续部分，密度存在性、方差非零都被明确放弃，可支撑一旦无界，边缘延拓的解析就失去立足点。

谱进入变分式的通道是边缘延拓 $R$ 变换。对 $x>0$，解分辨方程

$$\int\frac{\mu(d\lambda)}{b(x)-\lambda}=x,\qquad b(x)>\lambda_+,$$

解存在时用它，不存在时直接令 $b(x)=\lambda_+$；然后 $R(x)=b(x)-1/x$，并补 $R(0)=\int\lambda\,\mu(d\lambda)$。这个"延拓到边缘再钉住"的约定，我一开始以为是权宜之计，读到 Guionnet--Maïda 的秩一球面积分定理才意识到它本身就是答案的一部分：秩一积分为谱边缘之外的区域提供自然的延拓值，而那个定理算的是 annealed 球面积分，跟 quenched Ising 压强之间恰好差着这一步延拓。最终公式只用 $0\le x\le 1$ 一段，延拓不是逆变换范围之外的解析延拓，是把边缘行为并入定义。

试验重叠分位数取 $\mathcal P$ 中元素：$(0,1)\to[0,1]$ 的几乎处处有限、单调不降可测函数 $p$，零测集上等同。证明里出现的非负律来自微扰后子列极限，这个来源说明很重要：$p$ 一开始只是试验对象，几何性质要等 §4 的阵列定理去供。配套的辅助函数

$$D_p(r)=1-r-\int_0^1(p(s)-r)_+\,ds,\qquad 0\le r\le1,$$

非负、Lipschitz、$D_p(1)=0$。我当时反复验算这个 $D_p$：它是尾积分 $U_p(r)=\int_r^1p$ 的重新组合，把"上尾占优"这种序翻译成 $D_p\le D_q$，后面整个上界比较的能量单调性全押在这个翻译上。

[推测] 引言没有交代 $D_p$ 的发明过程，我只能从用途反推：先有尾序比较的需求，再有这个把序与 $R$ 变换自变量接通的工具。若谱重叠恒等式先写成 $U_p$ 形式，微分会多出边界项，$D_p$ 的写法让 $D_p(1)=0$ 免费吸收端点，这一点在 §8 的 Fubini 重排里兑现。

## §3 单点递归、$S$ 与 $G$：变分式两端各自的形状

公式的场一侧是一段有限高斯递归。取 $\mathcal H$：$(0,1)$ 上非负、不降的有限阶跃函数，用 $k$ 个连续区间描述，长度 $w_i>0$、值 $h_i$，记 $\zeta_i=\sum_{l<i}w_l$、$\zeta_k=1$、$h_{-1}=0$。对 $a,v\ge0$ 定义算子

$$(T_{a,v}f)(z)=a^{-1}\log\mathbb E\exp\{af(z+\sqrt v\,g)\}\ (a>0),\qquad (T_{0,v}f)(z)=\mathbb E f(z+\sqrt v\,g),$$

其中 $g\sim N(0,1)$。从终端 $F_{k-1}(z)=\log\cosh z$ 出发回代 $F_{i-1}=T_{\zeta_i,h_i-h_{i-1}}F_i$，直到

$$\ell(h)=F_{-1}(0)-\frac{h_{k-1}}2.$$

减掉的 $h_{k-1}/2$ 是方差对角项的补偿；把它留在定义里，之后梯度公式（§5）才会呈现无余项的样子。把区间在 $h$ 常数值的一段上细分，$\ell$ 不变，这个 refinement 一致性我第一遍读时没当回事，后来发现它是 §8 里把 $\bar p\to p$ 的值舍入与公共细分同时操作时不被细节绊倒的关键。

于是场侧泛函是

$$S(p)=\sup_{h\in\mathcal H}\Big\{\ell(h)+\frac12\int_0^1p(s)h(s)\,ds\Big\},$$

谱侧泛函是

$$G_t(p)=\frac12\int_0^1tR(tD_p(r))\,dr,\qquad G_0(p)=0,$$

主定理宣布 $\mathbb E P_N$ 与 $P_N$（后者几乎必然）都收敛到 $\mathcal F(\mu)=\inf_{p\in\mathcal P}\{S(p)+G_1(p)\}$，各维的 $U_N$ 之间甚至不需要相互独立。我核对量纲时的习惯做法是查两个极端：$t=0$ 时 $G_0=0$，问题退化成外场为零、相互作用关闭的单点配分，$S$ 就是 SK 腔公式里熟悉的那一半；$\mu=\delta_1$ 时应当回到某个已知基准，$R$ 在这情形是 $R(x)=1/x-1/x$ 加上边缘钉住规则，验算确实给出与秩一共形一致的形状。这两个极限都能对上，我才敢信公式的系数。

若相互作用去掉对角项，整体再减 $\tfrac12\int\lambda\,\mu(d\lambda)$；物理自由能量在倒温度 $\beta$ 下是对应压强除以 $\beta$ 再取负。这些换算在正文里各只占一句话，我却在草稿纸上推了三遍：正交共轭不改变迹，$\operatorname{Tr}(U^T\Lambda U)=\operatorname{Tr}\Lambda$，对角项对能量的贡献在 $N$ 阶是 $\sum_i\lambda_{i,N}$ 除以 $N$ 的一半，弱收敛加极值控制保证这个平均收敛到 $\int\lambda\,\mu$。一句话的换算，背后是谱假设三条全用上。

[推测] 引言对 $S$ 与 $G$ 的分工只给结论，不给发现过程。我猜作者先在 ASS 变分框架里认出"谱能量写成重叠尾积分的函数"这件事，才反推出 $G$ 必须长成分位数经由 $D_p$ 喂进 $R$ 的形状；证据是 §7 的能量引理把交互能量直接写成 $\tfrac12\int F_t'(D_p)$，与 $G$ 恰好差一次 $t$ 积分。

（落盘探针单行：基线 10873 字节，本行为唯一新增，随后复量。）

## §4 重叠阵列：将矩阵几何压缩成一条分位数曲线

变分式的下界要用重叠数组的极限，上界要用同一套数组的最小性；两套论证都要求我先有一个结构性事实：所有在微扰 Gibbs 测度下出现的谱重叠分量 $A^a_{lj}$，其任意子列极限都只有一条自由度，也就是总分位数 $p$。SK 情形只有 $Q$ 一个数组，正交不变模型把 $Q$ 按谱群拆成 $m$ 个分量，数组族 $\mathbf R=(R^1,\ldots,R^m)$ 联合满足的，是 Ghirlanda--Guerra 恒等式的推广版本：对每个 $n\ge2$ 与有界可测 $f$，

$$\mathbb E[f(\mathbf R_{1,n+1})\mid\mathcal F_n]=\frac1n\mathbb E f(\mathbf R_{12})+\frac1n\sum_{l=2}^n f(\mathbf R_{1l}),$$

其中 $\mathcal F_n$ 由全部分量在指标不超过 $n$ 的条目生成。背景设定里每个数组都是 Gram 阵（有限主子矩阵半正定）、弱交换、对角为确定常数；后者来自 §6 的微扰构造，届时见分晓。我一开始以为直接引用 Panchenko 的多复制超度量与同步定理就能收工，细读才发现文献版本处理的是单数组或者带公共结构的数组族，这里的分量满足联合恒等式，而且我还要显式拿到"每个 $p_a$ 在 $p$ 的每个常值区间上几乎是常数"这一条，后面的场构造与值舍入全靠它。于是论文把结构定理的证明完整内嵌进 §4，走的是"Panchenko 定理 2、定理 4 方法的阵列形式"这条路。

结构定理的骨架分三步。第一步非负性：若 $\mathbb P(R_{12}<-\epsilon)=r>0$，恒等式给出条件概率 $\mathbb P(R_{i,n+1}\ge-\epsilon\mid\mathcal F_n)=(1-r)/n$，并集界留下至少 $r$ 的条件概率让新一批重叠全部落在 $(-\epsilon,\infty)$ 以下；以 Gram 表示 $R_{ij}=v_i\cdot v_j$ 和对角界 $D$ 检验这样的大列表，

$$0\le\Big\lVert\sum_{i=1}^n v_i\Big\rVert^2\le nD-\epsilon n(n-1)$$

在 $n$ 大时矛盾。第二步超度量：假设支撑三元组违反 $R_{23}\ge\min(R_{12},R_{13})$，排指标得 $R_{12}=a\ge b=R_{13}>c=R_{23}$；用复制引理把复制 1 与复制 2 各自放大成 $M$ 元集合，组间重叠贴近 $a$，组内不超过 $a+\epsilon$，与复制 3 的重叠分别贴近 $b$ 和 $c$。两个重心 $\bar v_1,\bar v_2$ 的平方距离至多 $4\epsilon+2D/M$，它们与 $v_3$ 的内积却差着 $b-c$，先 $M$ 大再容差小即违反 Cauchy--Schwarz。这里有个细节我读了三遍：容差的分配要在每一步复制时取"稍大于被复制者当前全部重叠"的阈值，把总增量控制在 $\epsilon$ 以内分给有限步；不先想清楚这一步，迭代出来的事件概率正不正是悬的。第三步同步：把任意两分量之和也当作满足标量恒等式的 Gram 数组，若支撑中有两点坐标交叉（一点 $a$ 分量大数据小，另一点反之），恒等式的独立项允许在 12 与 13 对上同时实现两点的任意小邻域；分量超度量迫使 23 对的每个坐标等于两值中较小者，坐标和于是严格小于 12 与 13 对上的值，跟"和数组"的超度量冲突。支撑被坐标逐序之后，有序紧支撑的每个坐标至多对应一个点，坐标和唯一确定各坐标，且每个坐标作为可能和的函数是 1-Lipschitz；把这套坐标函数复合到 $Q_{12}$ 的分位数上，同步分位数 $p_a$ 全体到手，$p=\sum_a p_a$，每个 $p_a$ 都是 $p$ 的可测函数。

连接结构与几何的枢纽是一条不变性公式：固定 $n\ge2$ 与有界可测 $f_1,\ldots,f_n$，令 $H_l=\sum_{i\le n}f_i(R_{il}$ 在行 $l$ 上的取值聚合$)$、$H'_j=H_j-f_j(R_{jj})+\mathbb E f_j(R_{12})$，$Z(t)$ 为 $e^{tH_l}$ 在 $l>n$ 上的经验均值极限，则对任意有界 $\mathcal F_n$ 可测 $\Phi$，

$$\mathbb E\Phi=\mathbb E\Big[\frac{\Phi\exp(t\sum_{j\le n}H'_j)}{Z(t)^n}\Big].$$

证明的手法对我有独立价值：分母求导用"多引一个复制平均"来代表，逐阶导数展开后，$t=0$ 处条件期望由恒等式消零，得到 $\varphi^{(d)}(0)=0$；再由 $|Z(t_0+z)-Z(t_0)|\le Z(t_0)(e^{C|z|}-1)$ 在复邻域内保住分母不为零，解析性把"实轴一点常值"推进到"实轴全体常值"。有界交换变量的经验均值在 $L^2$ 中是 Cauchy 列这一步，被他们拿来同时对 $H_l$ 的全部幂次构造极限，指数级数一致收敛收口。我原来的草稿想跳过 $Z(t)$ 的存在性直接做指数倾斜，卡点就在幂次族的极限要同时对齐。复制引理的定量尾巴同样漂亮：若 $q<1$，则

$$\sup_{0\le w\le1}\frac{w}{(1+(e^t-1)w)^n}\le\frac{(n-1)^{n-1}}{n^n(e^t-1)}\xrightarrow[t\to\infty]{}0,$$

与 $\mathbb P(\mathcal A)>0$ 矛盾，从而新的复制能塞进指定容差。这一句我在草稿纸上重新推过一次：分式在 $w$ 的临界点取极值，代入即得 $(n-1)^{n-1}/n^n$ 型常数。

## §5 场泛函 $\ell$ 的凹性：组合恒等式与支撑不等式

下界一侧的难点在正文 §3 里已经埋好：腔计算给出单个场 $h_p$，答案却要求对全体场取 sup。把单场升级为 sup 的唯一通道是 $\ell$ 的凹性加上一条支撑不等式。文献里 Auffinger--Chen 在零场证过共同缩放协方差水平的凹性，Ho 的 Theorem 1.8 在完整协方差路径上给了凹性，且在我的归一化下 $\ell(h)=-\psi(h/2)$，终端函数同为 $\log\cosh$，没有多余的 $\log2$。可腔论证需要的不止凹性本身，要的是形如 $\ell(v)\le\ell(h)-\frac12\int B_h(v-h)$ 的支撑不等式、端点表述、以及 $S(p)$ 何时有限的定量描述。我判断最省事的路径是自己重证，事实也支持这个选择：论文的直接证明顺手给出了全部三件附加物。

先立记号。固定权重 $w_i>0$ 与端点 $\zeta_i$，增量 $v_i=h_i-h_{i-1}$，$\gamma_v$ 记方差 $v$ 的中心高斯律（$v=0$ 时是零点质量）。回代 $F_{i-1}=T_{\zeta_i,v_i}F_i$ 从 $F_{k-1}=\log\cosh$ 出发；每个 $F_i$ 偶、凸、光滑、1-Lipschitz：偶性来自反射，凸性在 $a>0$ 时用对数期望的 Hölder、在 $a=0$ 时就是普通期望的凸性，Lipschitz 界被两种算子分别保持。倾斜链由转移核

$$\mathbb P(Z_i\in dy\mid Z_{i-1}=z)=e^{\zeta_i(F_i(y)-F_{i-1}(z))}\gamma_{v_i}(d(y-z))$$

生成，$i=0$ 处指数因子为 1。令 $m_i=F_i'$，$B_i(h)=\mathbb E[m_i(Z_i)^2]$。关键命题说：$m_i(Z_i)$ 恰是 $\tanh Z_{k-1}$ 沿倾斜链的条件均值，因此构成鞅，条件 Jensen 给出 $0\le B_0\le\cdots\le B_{k-1}\le1$；而 $B_i$ 有直接的两自旋含义，它是公共水平为 $i$ 的两个 Ising 自旋乘积的期望，证明用了 §4 末尾的带标记级数规则：两条采样路径在水平 $i$ 之后立刻分叉时，未来标记与终自旋给定公共历史条件独立。梯度公式

$$d\ell(h)=-\frac12\sum_{i=0}^{k-1}w_iB_i(h)\,dh_i$$

在严格锥 $0<h_0<\cdots<h_{k-1}$ 上由带标记级数配分函数的对角导数与减项 $h_{k-1}/2$ 的导数互相抵消得到，闭锥上一侧导数版本靠连续性延拓；常数段细分重复 $B$ 值， refinement 不变性保住。

凹性定理的证明核心是一个线性代数小机关。在严格锥上记 $M_{ij}=w_i\partial_{h_j}B_i$，梯度公式说明 $M$ 对称且等于 Hessian 的 $-2$ 倍；混合导数引理给 $i\ne j$ 时 $M_{ij}\le0$；径向引理（对全体水平乘 $c$ 求导）给 $D=\operatorname{diag}(h_0,\ldots,h_{k-1})$ 时 $DMD$ 的行和

$$\sum_j(DMD)_{ij}=h_iw_i\sum_jh_j\partial_{h_j}B_i\ge0.$$

对称矩阵若非对角元不正是非负、行和 $r_i\ge0$，分解

$$x^{\mathsf T}Ax=\sum_i r_ix_i^2+\sum_{i<j}(-A_{ij})(x_i-x_j)^2\ge0$$

一步验算就成立。把这个分解用于 $DMD$，严格锥上 $D$ 可逆，$M$ 半正定，Hessian 半负。沿闭锥边界靠逼近与连续性收尾。我特别在意非负性来源的那条折叠密度：对偶权重 $e^{\zeta F(y)}$、$z\ge0$ 的绝对父位置，绝对子位置 $u\ge0$ 的密度正比于

$$e^{-u^2/(2v)}\cosh(zu/v)\,e^{\zeta F(u)},$$

$z_2\ge z_1\ge0$ 时两密度之比的似然比对 $u$ 递增，单调似然比把"水平越高、两自旋相关性越强"这类比较全部落地。径向与混合两条单调性都从这里出。

支撑不等式与 Lipschitz 估计

$$\ell(v)\le\ell(h)-\frac12\int_0^1B_h(s)(v(s)-h(s))\,ds,\qquad|\ell(h)-\ell(v)|\le\frac12\lVert h-v\rVert_{L^1(0,1)}$$

把 $\ell$ 唯一延拓到全体有界非负不降路径。延拓这步对腔论证不是装饰：极限分位数 $p$ 未必有有限阶跃结构，$h_p$ 只能由逼近读值定义，$L^1$ 连续性保证不同逼近给出同一个 $\ell(h_p)$。把"若极限场满足 $B_h=p$，支撑不等式立刻说明这个 $h$ 极大化 $\ell(v)+\frac12\int pv$"翻译成方向感：凹性不是背景知识，它就是 §8 自一致性等式的引擎。域引理划清试验范围：$d=\int_0^1(1-p)\,ds>0$ 时 $0\le S(p)\le(d^{-1}-1)\log2$，$S$ 只在极端分位数 $p\equiv1$ 处发散；上界比较选试验 $q$ 时要值严格小于 1，就是给这条界留活口。

[推测] 我没能从 tex 文本里读到"为什么先证 $B_i$ 的两自旋含义再证梯度公式"的决策过程，只能从依赖顺序反推：标记级数命题 arr:rpc 同时服务两件事，先建立概率模型（倾斜链即单点 Ising 采样板）才能把解析量 $B_i$ 与物理量"两自旋积"划等号，后面的支撑不等式才有的说。证据强度中等，标推测。

## §6 Haar 旋转：Ward 恒等式与谱群路径的闭合

模型特有的输入只有一处：Haar 旋转如何决定各谱群的重叠路径。这一步是全文我最喜欢的部分，因为它把物理学家做 replica 时的 Fourier 变换技巧翻译成了严格的矩恒等式。设定：有限谱字母表 $\mu=\sum_{a=1}^m\rho_a\delta_{\lambda_a}$，指标群 $I_{a,N}$ 比例趋 $\rho_a$；§3 的微扰构造（文本在 rot:gg 处给出执行细节，其效果是子列极限满足联合恒等式且对角为确定常数）之后，对任何 $\Phi$ 与 $t_N\to t\in[0,1]$，谱 Ward 恒等式对distinct $a,b$ 成立：

$$\mathbb E\big[\Phi(Q_{12})(\rho_bA^a_{12}-\rho_aA^b_{12})\big]=t(\lambda_a-\lambda_b)\,\mathbb E\big[\Phi(Q_{12})(d_aA^b_{12}+A^a_{12}d_b-2A^a_{13}A^b_{23})\big],$$

$$\rho_bd_a-\rho_ad_b=t(\lambda_a-\lambda_b)\big(d_ad_b-\mathbb E[A^a_{12}A^b_{12}]\big).$$

推导是初等的，耐心却是不初等的。取 $i\in I_{a,N}$、$j\in I_{b,N}$，对平面旋转 $x_i'=x_j,\ x_j'=-x_i$ 求导并作用在 $\langle x_i^1x_j^2\Phi(Q_{12})\rangle$ 上；Haar 平均后导数期望为零，$Q_{12}$ 旋转不变所以 $\Phi$ 不挨导数；主 Hamiltonian 的导数是 $t_N(\lambda_a-\lambda_b)x_ix_j$，两复制 Gibbs 比值求导贡献 $t_N(\lambda_a-\lambda_b)(A^a_{11}A^b_{12}+A^a_{12}A^b_{22}-2A^a_13A^b_23)$ 型三项。对残余项的清理我逐条核过：确定微扰系数 $2e_N(v_a-v_b)$ 给 $O(e_N)$；高斯微扰对系数张量分部积分，配对 Gibbs 指数给出 $Ne_N^2 4^{-j}u_j^2$ 级系数，单端点协方差导数至多 $C(1+j)$ 项，缩并后总误差被 $Ce_N^2\sum_j(1+j)4^{-j}=O(e_N^2)$ 吃掉；独立线性增强恰好不贡献。这些 $O(e_N)$ 必须在取极限前钉死，否则恒等式右边混进未定标量。

拿到恒等式后，我原本准备对每个 $a$ 直接解一个 Stieltjes 型方程组，很快撞墙：恒等式控制的是 off-diagonal 路径 $L_a$（把 $p_a$ 看作路径的 off-diag 部分），对角值 $d_a$ 只以期望 $\mathbb E[A^a_{12}A^b_{12}]$ 出现，普通逐点解方程根本闭不了环。转折点是引入复制路径的 Parisi 乘积 $\star$（出处文本指向 Mézard--Parisi 附录 II 与 Müller--Pankov 附录 E 的 replica Fourier 变换），两条 Ward 恒等式合并成

$$\rho_bL_a-\rho_aL_b=t(\lambda_a-\lambda_b)(L_a\star L_b).$$

取符号变换 $\alpha_a=\widehat L_a(s)$，和约束 $x=\sum_a\alpha_a$ 被恒等式认成 $x=D_p(p(s))$；GG 正性与 Gram 界给 $0\le p_a(s)\le d_a$ 从而 $\alpha_a\ge0$，零分量配正分量在方程里自杀，除以符号方程得公共数

$$\frac{\rho_a}{\alpha_a}+t\lambda_a=b,$$

正和约束就是 $b_t(x)$ 的分辨方程，$\alpha_a=f_a(x)$，其中 $f_a(x)=\rho_a/(b_t(x)-t\lambda_a)$、$f_a(0)=0$。求根端的方程组同型，解出 $r_a=p_0f_a'(x)$，权重

$$f_a'(x)=\frac{\rho_a/(b_t(x)-t\lambda_a)^2}{\sum_b\rho_b/(b_t(x)-t\lambda_b)^2},\qquad f_a'(0)=\rho_a,\qquad\sum_af_a'(x)=1.$$

剩下是重构：$F_p(r)=|\{s:p(s)\le r\}|$，则 $D_p'(r)=-F_p(r)$ a.e. 且 $D_p(1)=0$，Fubini 给 $\widehat L_f(s)=f(0)+\int_{p(s)}^1F_p(r)f'(D_p(r))\,dr=f(D_p(p(s)))$；符号相同的路径在 $[\epsilon,1)$ 上 Stieltjes 导数相同（$d\widehat L=-s\,dl$），差一个常数，由根值钉死，符号再把对角钉死，连零点附近堆积的跳跃一并处理。最终闭合公式

$$p_a(s)=\int_0^{p(s)}f_a'(D_p(r))\,dr,\qquad d_a=\int_0^1f_a'(D_p(r))\,dr,$$

声明里专门强调三件事：$t=0$ 成立、重根成立、$D_p(p(s))=0$ 成立。我此前草稿里对重根除过 $(\lambda_a-\lambda_b)$，这一步的自查把我自己的错误路线揪了出来：全程没有任何一步除以特征值差，重根群自动成比例，$t=0$ 时 $f_a(x)=\rho_ax$ 给出 $p_a=\rho_ap$、$d_a=\rho_a$。若 $p\equiv1$，$D_p\equiv0$，公式同样给 $p_a=d_a=\rho_a$，极端分位数的处理免费。

给腔步骤预留的一条定量尾巴：群 $a$ 的对角超出量 $d_a-p_a(1-)=\int_{p(1-)}^1f_a'(D_p(r))\,dr\ge0$，除以 $\rho_a$ 后对应函数 $H_a(x)=(b_t(x)-t\lambda_a)^{-1}$，其导数以 $1/\rho_a$ 一致有界。于是全体试验路径的高斯协方差一致有界，顶重叠为 1 时残差方差归零。这条界在 §8 去掉截断的极限交换里起支配收敛的作用，我第一遍读 §6 完全没有意识到它是给谁准备的。

## §7 上界比较：一场以试验分位数为锚的最小性论证

上界要在有限谱字母表上证明：特征值落在固定有限集、比例收敛到 $\rho_a>0$ 时，$\limsup_N\mathbb E P_N\le\inf_p\{S(p)+G_1(p)\}$。这一节的逻辑装置我会拆成"能量对尾序的单调性"与"最小性反证"两块来咀嚼。

先给相互作用加系数 $t\in[0,1]$，令 $F_t(x)=xR(tx)$，并用 §6 的重建公式把期望交互能量（每自旋、乘 $t$ 之前）写成

$$\mathcal E_t(p)=\frac12\int_0^1F_t'(D_p(r))\,dr=\frac12\sum_a\lambda_ad_a.$$

第一个验证点：$\tfrac12\sum_a\lambda_ad_a$ 与积分形式相等，靠的是 $b_t(x)=tb(tx)$ 的齐次性推出 $\sum_a\lambda_af_a(x)=\frac{xb_t(x)-1}{t}=xR(tx)$，两端在 $t=0$ 与 $x=0$ 由连续性接上。 convexity 是第二条命脉：对 $t,x>0$ 记 $M_j=\sum_a\rho_a/(b_t(x)-t\lambda_a)^j$，分辨方程说 $M_1=x$，逐阶求导得 $b_t'=-1/M_2$、$b_t''=2M_3/M_2^3$、$(xb_t)''=2(M_1M_3-M_2^2)/M_2^3\ge0$，最后一步是 Cauchy--Schwarz。有了 $F_t'$ 不降，尾序比较就通了：分位数的正部积分可由上尾恢复，

$$\int_0^1(p(u)-r)_+\,du=\max_{0\le s\le1}\Big\{\int_s^1p(u)\,du-(1-s)r\Big\},$$

所以"对所有 $s$ 有 $\int_s^1p\ge\int_s^1q$"迫使 $D_p\le D_q$，再经 $F_t'$ 单调得到能量序 $\mathcal E_t(p)\le\mathcal E_t(q)$。配上 $\sum_af_a'=1$、$f_a'\ge0$，能量是 $[-L/2,L/2]$ 中数的平均，$|\mathcal E_t(p)|\le L/2$ 免费入账。原函数恒等式 $\int_0^t\mathcal E_u(q)\,du=G_t(q)$ 由 $\partial_t[tR(tx)]=F_t'(x)$ 积分而得，它正是 $G$ 在比较微积分里的入场券：对 $t$ 求导时谱项贡献恰好是 $\mathcal E_t$。

我起初设想的上界是直接对 $t$ 积分 Guerra 式插值，一步到位；写完才发现插值泛函里场的 supremum 与重叠的 infimum 顺序会纠缠：插值参数的最优响应随 $t$ 漂移，两端对不上。正文的解法让我服气：固定一个值严格小于 1 的有限阶跃试验 $q$（引理 fld:domain 保证 $S(q)<\infty$），在其区间权重上搭建级数，把富化、带微扰的压强 $P_N^{\mathrm{enr}}(t,h,\mathbf u,\mathbf v)$ 摆进目标泛函

$$\mathcal J_N=-\mathbb E P_N^{\mathrm{enr}}-\frac12\int_0^1q\,h+S(q)+G_t(q)+t\delta+\Pi_N,\qquad \Pi_N=\sum_j2^{-j}(u_j-3/2)^2+\sum_a(v_a-3/2)^2,$$

其中 $t=1$、$h=0$、微扰参数全取 $3/2$ 时 $\mathcal J_N\le-\eta<0$（若上界沿子列失效，取 $\delta$ 足够小即可）。把 $\mathcal J_N$ 在盒子 $0\le t\le1$、$0\le h_0\le\cdots\le h_{k-1}\le H$ 与微扰参数邻域内最小化。最小点处对 $t$、对 $h$、对微扰的变分各给出一条信息：微扰导数在最小点必须有界，逼出子列重叠极限满足联合 GG 且对角确定（这就是 §6 之前那句"届时见分晓"的兑现处）；极限分位数记 $p$，其结构经 §6 重建。若 $p$ 的上尾处处占优于 $q$，能量序说谱项变小；对 $t$ 的导数在 $t=1$ 处由 $G_t'(1)=\mathcal E_1$ 与 $-\mathcal E_t(p)$ 的差给出，符号与最小性矛盾。试验 $q$ 全程固定不动，是这套论证保住 inf 在外、sup 在内的全部秘密：最小化只发生在比较泛函的内部参数 $(t,h,\mathbf u,\mathbf v)$ 上，从未对外层 $p$ 取 sup。

读到"trial $q$ is fixed throughout"这句时我对照了自己草稿里的错误：我曾让试验量随子列一起优化，结果极限场与极限重叠的耦合方程写不出闭式。教训是层级泛函里"先固定一个测试元，用最小性逼出真实元占优它"比"直接优化"更安全，因为占优序（尾序）恰好与能量单调兼容，而最优性条件未必有解。富化压强的 $O(e_N)$ 微扰比较把 $\mathcal J_N(t{=}1)$ 的负值转移到极限一侧，$\Pi_N$ 的二次惩罚保证微扰参数不逃逸，这些机械件各有各的锈点，正文把它们逐一上油后只留一条主线：上界成立。

## §8 腔下界：耦合、Schur 补与自一致性

下界要证 $\liminf\mathbb E P_N\ge\inf_p\{S+G_1\}$，工具是尺寸 $N$ 与 $N+n$ 的耦合腔。与 ASS 框架的标准剧本比，这里有两个模型特有的动作：耦合要在保留基底律的前提下选出谱群内的均匀方向，腔因子因此同时含标记的二次项与线性项；二次高斯测度变换要在有限阶跃逼近 $\bar p$ 上显式算出极限腔表达式。我把证明拆成四幕来记。

第一幕，耦合与标记。把 $N+n$ 系统与 $N$ 系统放在同一组 Haar 方向上，新增的 $n$ 个方向在其所属特征子空间内均匀选取，投回自旋坐标成为高斯标记。基底参数空间配一个测度 $\eta$，"好参数集" $\mathcal G_N$ 上重叠数组已有极限且性质齐全，$\eta(\mathcal G_N)\to1$。增量比较用每一自旋 $\frac1n(\mathcal F_{N+n}-\mathcal F_N)$ 的期望对数配分表示，腔因子 $W$ 是新增 $n$ 自旋的乘积权重。截断与有限复制逼近的技术层（bounded Gibbs tests、explicit cutoffs、finite replicas）在文本里占了 §5 的前四小节，我读到的纪律是：每一步极限交换都提前配好一个对数上界的截断，最后由截断参数发散时的引理 cav:cutoffs 统一收回。

第二幕，二次高斯换测与块矩阵压缩。设限。对 $x>0$，$R'(x)=\frac1{x^2}-\frac1{M_2(x)}\ge0$，$M_2(x)=\sum_a\rho_a/(b(x)-\lambda_a)^2\ge x^2$，最后一个不等式是 Cauchy--Schwarz 作用于 $M_1^2\le M_2$；$R'$ 在 0 处取光滑非负极限，$p$ 为有限阶跃分位数时 $h_p(s)=\int_0^{p(s)}R'(D_p(r))\,dr$ 落在 $\mathcal H$ 内。核心计算把大矩阵分辨式压缩到腔坐标：

$$\big(bI_n-C-L^{\mathsf T}(bI_d-A)^{-1}L\big)^{-1}=\sum_a\frac{\rho_aI_n}{b-\lambda_a}=xI_n,$$

谱群的重数结构（每个 $\lambda_a$ 在整块中重数 $n$、在删余块 $A_0$ 中重数 $n-s_a$）给出两条恒等式：$C+L^{\mathsf T}\widetilde H(x)L=R(x)I_n$，以及 $\log\det(I_d-H(x)K)=n(\log x+\sum_a\rho_a\log(b-\lambda_a))$，后者对 $x$ 求导除以 $n$ 得 $xR'(x)$。二次变换之后，场 $L^{\mathsf T}y$ 的坐标独立，公共水平协方差路径恰为 $h_p$，对角协方差 $v=\int_0^1R'(D_p(r))\,dr$；记 $h_*=h_p(1-)$，独立残差方差 $v-h_*$。腔自旋平方范数为 $n$ 这一事实把确定项 $C=R(0)I_n$ 与残差的积分合成 $\frac n2[R(0)+v-h_*]$，其余自旋和对非残差场 $z$ 分解成 $\prod_j\cosh z_j$，回代递归按坐标相乘给出 $n[\ell(h_p)+h_*/2]$。三处根区间贡献都在内（独立残差按指数一次积分），拼起来：

$$\frac1n\mathbb E\log\langle W\rangle_p=\ell(h_p)+\frac12\Big[R(0)+\int_0^1(1-D_p(r))R'(D_p(r))\,dr\Big].$$

再用 Fubini 把 $\int p\,h_p$ 换成 $r$ 积分，配合 a.e. 恒等式 $1-D_p(r)-\int_{\{p>r\}}p\,ds=-rD_p'(r)$，作差得

$$R(0)-\int_0^1r\,dR(D_p(r))=\int_0^1R(D_p(r))\,dr=2G_1(p),$$

端点 $D_p(1)=0$ 免费提供 $r=1$ 的边界项。最终每腔自旋的增量评估式

$$\frac1n\mathbb E\log\langle W\rangle_p=\ell(h_p)+\frac12\int_0^1p\,h_p+G_1(p)$$

与我最初猜的"腔贡献 $=S+G$"只差一件事：右边含具体场 $h_p$，$S(p)$ 却是 supremum。第三幕补上这一件事。

第三幕，自一致性。命题 cav:self-consistency 的输入是一条腔自旋测试：对固定腔位点 $j$ 与有界连续 $\phi$，站点置换对称把 $\langle\phi(Q_{12}^+)\varepsilon_j^1\varepsilon_j^2\rangle$ 换成 $\langle\phi(Q_{12}^+)Q_{12}^+\rangle$；配合评估命题里的倾斜后两自旋公式 $\mathbb E\langle\phi(Q_{12})\varepsilon_j^1\varepsilon_j^2\rangle_{p,W}=\int_0^1\phi(p(s))B_{h_p}(s)\,ds$（公共水平分布在倾斜下不变），取极限得

$$\lim_{\bar p\to p}\int_0^1\phi(\bar p(s))\big(B_{h_{\bar p}}(s)-\bar p(s)\big)\,ds=0.$$

注意这一步没有用全系统的任何 GG 性质：基底参数好只用于重叠极限存在，站点对称对每个固定参数都成立。$B_{h_{\bar p}}$ 单调取值于 $[0,1]$，$L^1$ 相对紧；要证任何子列极限 $B$ 是 $p$ 的可测函数，论证顺着"舍入 $\bar p$ 在 $p$ 的每个平台段上为常数，对应场水平相等，零增量给相同条件位置与磁化，故 $B_{h_{\bar p}}$ 也在该段常数"走，正长度平台的内部与可数多个端点之外，用 $p$ 的广义逆恢复分位数坐标；奇异连续部分也在管辖之内。连续的 $\phi$ 决定 $[0,1]$ 上有限测度，$(B-p)\,ds$ 在 $p$ 下的推前为零，可测性收口，$B=p$ a.e.。于是支撑不等式（§5，含 tie 水平版本）给出对一切 $v\in\mathcal H$：

$$\ell(v)\le\ell(h_{\bar p})-\frac12\int_0^1B_{h_{\bar p}}(v-h_{\bar p}),$$

令 $\bar p\to p$ 并把 $h_{\bar p}$ 自己代进 $S(p)$ 的定义取 sup，两侧夹死

$$S(p)=\ell(h_p)+\frac12\int_0^1p\,h_p.$$

我读到这里才理解 §5 里那句"符号恰好"的分量：支撑不等式方向选对，自一致性 $B=p$ 一比，场 sup 当场兑现。

第四幕，望远镜。$S\ge0$、$G_1$ 有界、零试验的 $S$ 有限，$\mathcal V=\inf\{S+G_1\}$ 有限。好参数集上增量下界 $\ge n\mathcal V$ 来自第三幕与 preliminaries；集外由引理 cav:comparison 给一致下界；$\eta(\mathcal G_N)\to1$ 允许对全参数空间积分；参数空间含无穷序列，尺寸 $N$ 的配分忽略后续坐标，积分后的增量沿数列精确望远镜相消，除以终端维数得微扰压强的下界，微扰改期望对数配分为 $O(Ne_N)=o(N)$，回到 $\mathbb E P_N$。命题 cav:lower 声明要求 $\rho_a$ 正有理且 $n\rho_a\in\N$，常数是有限字母表与 $n$ 的函数，对后续谱逼近无一致性的要求，这一点被 §9 的移除步骤当作黑箱使用。

回头看，我最初"腔方法=标准 ASS 不等式"的判断错得离谱：ASS 给的是下界的骨架，正交不变模型的血肉全在第二幕的 Schur 补与重数计算上。若把 $R$ 变换换成 SK 的 $\frac12\lambda^2$ 型，压缩恒等式退化成标量方程，整套块矩阵语言确实可以扔；可全温区的非线性信息恰恰藏在重数结构里，扔不得。

## §9 从有限字母表到一般谱：连续性、随机谱、零温与高斯模式

主定理还差三步：移除有限字母表与有理比例限制、处理随机谱、取零温。移除步骤的抓手有两条。第一条是谱项对谱律的连续性：边缘延拓变换 $x\mapsto R(x)$ 在弱收敛下稳定，$\mu_k\Rightarrow\mu$ 且各自信支撑边缘收敛时 $G_1(p;\mu_k)\to G_1(p;\mu)$ 对每个固定的 $p$ 一致可控，文本在 §9 前两个小节里用重数比较与逼近命题 gen:approximation 把有限谱结果移植到任意紧支撑律。第二条是"每条逼近链的误差只依赖有限字母表自身"，§8 末尾那句"对后续谱逼近无一致性要求"在这里兑现：逼近误差可逐步吸收，无需对 $k$ 一致的腔常数。两条腿合起来，inf 的值在逼近下连续，上下界夹住同一个极限。我起初担心的是 $R$ 在支撑边缘的斜率发散（例如半圆律在 $\lambda_\pm$ 处平方根奇性），读到边缘延拓把 $b(x)$ 钉在 $\lambda_+$ 的定义后释然：钉住的那段 $R(x)=\lambda_+-1/x$ 显式光滑，奇性全被吸收进"无解"分支。

随机谱的处理在命题 gen:random。局部化四矩集中控制 $P_N$ 对 Haar 旋转的涨落，收敛于概率加上 $|P_N|\le\lVert J_N\rVert_{\mathrm{op}}/2$ 的一致可积，即得期望收敛；充分条件是谱范数一致可积。注意这里对 $U_N$ 各维之间的独立性仍然无所求，主定理那句"不需要跨维独立"在随机谱版本里同样成立，我认为这是全文最容易被读者漏掉的强度点：集中不等式只用当维的 Lipschitz 性，跨维关系根本不进入证明。

零温推论 gen:ground-state 是我读得最慢的一段，因为限速方式出乎意料地初等。设 $J_N=U_N^{\mathsf T}\Lambda_NU_N$ 满足确定性谱假设，最大每自旋能量 $M_N=\frac1{2N}\max_\sigma\sigma^{\mathsf T}J_N\sigma$。均匀概率测度给出每个 $\beta>0$ 的夹逼

$$\frac{P_N(\beta)}\beta\le M_N\le\frac{P_N(\beta)}\beta+\frac{\log2}\beta,$$

对正整数 $\beta$ 逐个数用主定理，交可数个概率 1 事件，$\limsup M_N-\liminf M_N\le\frac{\log2}\beta$ 对每个整数 $\beta$ 成立，故 $M_N$ 几乎必然收敛，极限落在每个确定区间 $[\mathcal F(\mu_\beta)/\beta,\ \mathcal F(\mu_\beta)/\beta+\log2/\beta]$ 内，是个确定数。实数 $\beta$ 版本靠期望夹逼补上：$0\le M-\mathcal F(\mu_\beta)/\beta\le\log2/\beta$，令 $\beta\to\infty$ 得 $M_N\to\lim_\beta\mathcal F(\mu_\beta)/\beta$。我原本的路线是试图先证正温下一致估计再令 $\beta\to\infty$，那需要 $\mathcal F$ 对 $\beta$ 的定量光滑性，文本明确写着"without a uniform positive-temperature estimate"，夹逼技巧把这一整层负担清零。约定在此第二次发威：均匀概率测度贡献的上界恰是 $\log2/\beta$，计数测度版本会多出别名词条。

高斯模式（Wishart 相互作用）推论 gen:wishart 把整套机器指向一个具体量：$m_N=\lfloor\alpha N\rfloor$ 维独立高斯矩阵 $G_N$，$J_N=cG_N^{\mathsf T}G_N/N$，经验谱律趋 Marchenko--Pastur 型 $\mu_\alpha=(1-\alpha)_+\delta_0+\frac{\sqrt{(b_\alpha-x)(x-a_\alpha)}}{2\pi x}\mathbf 1_{[a_\alpha,b_\alpha]}(x)\,dx$，边缘 $a_\alpha=(1-\sqrt\alpha)^2$、$b_\alpha=(1+\sqrt\alpha)^2$。对每个固定 $c\in\R$，$p_N(c)\to\mathcal F(\mu_{\alpha,c})$ 依概率与 $L^1$；零温侧 $e_\pm(\alpha)=\lim_\beta\mathcal F(\mu_{\alpha,\pm\beta})/\beta$ 存在且 $e_+(\alpha)\ge0$、$e_-(\alpha)\le0$，随后

$$\frac{\lVert G_N\rVert_{\infty\to2}}{N}=\frac{\lVert G_N^{\mathsf T}\rVert_{2\to1}}{N}\longrightarrow\sqrt{2e_+(\alpha)},\qquad \frac1N\min_{\sigma}\Big\lVert\sum_i\sigma_ig_{N,i}\Big\rVert_2\longrightarrow\sqrt{-2e_-(\alpha)},$$

即 $\ell_\infty$ 到 $\ell_2$ 的算子范数与高斯列带符号和的最短长度都被压强公式决定。我从这个推论读出论文的自我定位：它给一个非渐近、带组合约束（自旋 $\pm1$）的算子范数问题提供了精确极限，这类问题以前只有在 $c$ 小（高温侧）时才有公式。$c<0$ 分支要求把谱律整体反射（$\mu_{\alpha,c}=(x\mapsto cx)_\#\mu_\alpha$ 承载负谱），边缘延拓规则对负方向同样定义良好，这个对称性我在验算 $t=0$ 情形时确认过：$R(0)=\int\lambda\,\mu(d\lambda)$ 随反射线性变号。

## §10 反例课：无界支撑时弱收敛救不了压强

§2 里我怀疑极值条件是多余的，这一节用构造打自己的脸。取密度 $e^\lambda\mathbf 1_{\{\lambda\le0\}}$ 的 $\mu$，中点分位数 $q_{N,j}=\log\frac{j-1/2}{N}$ 的经验测度弱收敛到 $\mu$。偶数维照用这些特征值；奇数维把 $q_{N,1}$ 换成 $-e^{N^2}$，其余不动。弱收敛不受单个特征值影响，每个特征值仍落在 $\operatorname{supp}\mu=(-\infty,0]$ 之内：较弱条件"全体特征值落在（可能无界的）支撑里"完全满足。

偶数子列：$-\log u$ 凸性给 $\frac1N\sum_j(-q_{N,j})\le\int_0^1-\log u\,du=1$，对均匀自旋测度用 Jensen（平均二次能量 $\operatorname{Tr}\Lambda_N/2$），得 $-\frac12\le P_N\le0$。奇数子列：逃逸特征值的单位特征向量 $v_N$ 依赖 Haar 不变性，固定自旋向量 $\sigma$ 时 $v_N\cdot\sigma$ 分布等于 $\sqrt N$ 乘以 $\R^N$ 单位球面上均匀点的第一坐标，密度

$$\frac{\Gamma(N/2)}{\sqrt{\pi N}\,\Gamma((N-1)/2)}\Big(1-\frac{t^2}{N}\Big)^{(N-3)/2},\qquad|t|<\sqrt N,$$

前因子有界；对 $2^N$ 个角点做并集界，$\mathbb P(\min_\sigma|v_N\cdot\sigma|<e^{-2N})\le C2^Ne^{-2N}$ 可求和，Borel--Cantelli 之后几乎必然地，充分大的奇数 $N$ 上每个自旋向量与该方向的内积都不低于 $e^{-2N}$，能量至多 $-\frac12e^{N^2-4N}$（其余特征值非正），于是 $P_N\le-\frac{e^{N^2-4N}}{2N}\to-\infty$。两条子列一个困在 $[-\frac12,0]$、一个坠向 $-\infty$，压强极限不存在。整个构造不依赖维度间的独立性，也再次证明主定理那句"无需跨维独立"是真实的强度，并非疏漏：反例的失败源在谱本身，Haar 各维相关性帮不上忙。

这堂课修正了我对假设体系的看法。三条谱假设里，弱收敛管 bulk，边缘条件管极值，紧支撑管延拓的定义域；三者各自堵住一类失败：bulk 不定则 $R$ 变换无从谈起，极值失控则奇数维可以藏一颗核弹，支撑无界则边缘钉住规则失去参照。写反例的过程本身也给了我一个方法论提示：在随机矩阵精确限的问题上，"单个特征值不动弱收敛"这类自由度是廉价又致命的武器，凡看到只用弱收敛的命题，先拿奇偶子列试一圈。

## §11 外场延拓：先约束磁化，再优化约束

磁场版本把 $P_N$ 的指数加上 $\sum_rc_r^{(N)}\sigma_r$，场向量确定性、经验律收敛。文本的处理分两层。有限字母表层：场值 $c_1,\ldots,c_J$、比例趋正有理 $\gamma_j$，答案变为

$$\mathcal F_\mu\Big(\sum_j\gamma_j\delta_{c_j}\Big)=\sup_{\mathbf m\in((-1,1)\cap\mathbb Q)^J}\Big\{\sum_j\gamma_jc_jm_j+\inf_{p\in\mathcal P}\big[S_{\mathbf m}(p)+G_1(p)\big]\Big\},$$

其中每组磁化 $m_j$ 通过受约束单点泛函 $\ell^{[m_j]}(h)=\inf_b\{\ell_b^{\mathrm{can}}(h)-bs\}$ 进入，$\ell^{[m]}$ 是把初始位置改为 $b$ 的 $\ell$ 版本对偏置 $b$ 做 Legendre 型下确界；$S_{\mathbf m}$ 沿用 $\sup_h\{\ell^{[\mathbf m]}(h)+\frac12\int p\,h\}$ 的形状，全部场组共用同一条协方差路径 $h$。我注意到这个"共用 $h$"是内容性约束：各组允许不同的层级结构就等于给每组独立的 Parisi 序参量，模型只允许谱重叠决定唯一层级，磁场只能改每层的权重与终端形状。受约束凹性命题 mag:concavity（固定平均自旋后 $\ell$ 对协方差水平仍凹）是零场 §5 证明的改造版，其技术核心是把折叠密度论证搬到带倾斜的终端 $\log\cosh$ 平移族上。文本还交代了出处感：$\ell^{[s]}$ 这类单点凹共轭出现在广义 TAP 理论（Chen--Panchenko--Subag 的 (2.21)-(2.23)），Parisian 序参量之外再加常规序参量的做法也见于高斯向量自旋公式（Chen 的 Theorem 1.1）。

一般场律层：$W_1$（一阶矩传输度量，代价 $|x-y|$）下 $\nu_q\to\nu$，声明 $\mathcal F_\mu(\nu)=\lim_{q}\mathcal F_\mu(\nu_q)$ 存在且与逼近列无关。这里我核对过 $W_1$ 有限一阶矩为何够用：压强对场向量的 Lipschitz 常数是 1（每自旋 $|c_r|$ 加权一次进入指数），传输代价的期望界直接给 $|\mathcal F_\mu(\nu)-\mathcal F_\mu(\tilde\nu)|\le W_1(\nu,\tilde\nu)$ 型稳定性，柯西列极限存在是标准收口。随机数据备注 mag:random-data 把谱与场同时随机化：给定数据条件下按 Haar 轨道取相互作用，谱假设与场经验律收敛若在概率（或几乎必然）意义下成立，压强收敛同样升格；均匀可积再送期望。证明只是把命题 gen:random 的局部化四矩集中照搬，Haar Lipschitz 常数与外场无关。

上界沿用 §7 的富化比较，约束进级数终端；下界的增量分析换成"大约束块乘积"：把立方体按场组切成受约束磁化的块，块间望远镜、块内用约束凹性。我读到 §11 末尾时对整篇的结构有了新的敬意：外场分支没有引入任何新的重叠几何，全部代价花在单点泛函的凸分析上，这正是"谱与场信息解耦"的体现，场只碰 $S$，谱只碰 $G$。

## §12 关键转折点复盘

把整条思维链压成五个转折，每个都对应一次真实的方向修正。

转折一，高温拐杖换成边缘延拓。开局的问题清单里"全温区"只是一个愿望，第一个转折发生在认清 $R$ 变换的定义域之后：$x$ 超过分辨方程可解范围时把 $b(x)$ 钉在 $\lambda_+$，这步让 $G_1(p)$ 在 $D_p$ 触及 0 与 1 的两个端区域都有有限值，低温侧压强对最大特征值的敏感性被 $R$ 的边缘行为吸收。愿望变成定理的资格，从这条延拓约定开始。

转折二，复叠对称破缺的语言翻译成阵列几何。物理文献给的是 1RSB、mRSB 的显式公式，严格化时发现真正的对象是联合重叠数组的极限结构：GG 恒等式、超度量、同步三件套把"层级"二字几何化。§4 的同步论证（坐标与坐标之和同时超度量迫使支撑有序）是我认为全篇最被低估的一段，它把 Parisi 树的语言从假设降级为推论。

转折三，上界从"直接插值"改为"固定试验的最小性"。§7 记录了我草稿里的耦合困难：试验元跟着优化，极限方程不闭合。改为锚定一个 $q$ 之后，最小性给出占优分位数 $p$，尾序、能量序、$G_t$ 的 $t$ 导数三者同向，矛盾水到渠成。inf 与 sup 的顺序从此有了不可动摇的地位，正文那句"证明不交换顺序"就是这个转折的化石。

转折四，腔表达式从"一个场"升级为"极大场"。§8 第三幕前，下界比目标差一个 supremum，靠对数比较已经榨不出更多信息；腔自旋测试加站点对称性送出 $B_{h_p}=p$，支撑不等式一步兑现 $S(p)=\ell(h_p)+\frac12\int p\,h_p$。信息论意义上，自一致性用的观测（单点两自旋积）比比较泛函的导数（整体配分）更局部，这个"从局部测试取信息"的动作超出我对腔法的全部预设。

转折五，零温不需要一致估计。§9 的夹逼用可数个整数 $\beta$ 的事件交，把 $M_N$ 的收敛与 $\mathcal F(\mu_\beta)/\beta$ 的极限一次性钉死。原以为零温是全篇最难的部分（要控制 $\beta\to\infty$ 与 $N\to\infty$ 两个极限的交换次序），实际难度被均匀测度的 $\log2/\beta$ 余量消解，这是"约定选得好，定理自己走"的范例。

## §13 最终形态与最初设想的分岔清单

对照立项时的草稿与成稿，分岔集中在五处。其一，我预想答案会写成某个自由能泛函的驻点方程（平均场风格，先猜序参量方程再证存在性），成稿是纯变分不等式夹逼，全程没有解过任何自洽方程；$h_p$ 作为极大场的身份是事后由自一致性识别的。其二，我预想谱信息经由 Stieltjes 变换的幂次组合进入，成稿只用了 $R$ 变换这一个谱物体，且只取 $0\le x\le1$；所有谱的细节被 $D_p$ 这个中介吃干抹净。其三，我预想随机谱与确定谱需要两套论证，成稿里随机谱只是集中加可积性的一层薄皮。其四，我预想磁场会把层级结构复杂化（每组场一个序参量），成稿证明各组共用唯一 $h$，磁场只在终端函数与权重上动手术。其五，我预想 $p\equiv1$ 这类极端分位数需要单独处理，成稿的重建公式直接覆盖（$D_p\equiv0$ 分支免费给出 $p_a=d_a=\rho_a$），域引理则说明唯一的坏点 $S(1)=\infty$ 根本进不了试验域（$G_1$ 也在那里发散，相消与否需要单独检查，正文在 $p\equiv1$ 时的 $G_1$ 取值我未能从 tex 文本中直接确认，标为存疑）。

[推测] 存疑点一：文本未展开 $p\equiv1$ 时 $\inf$ 的域是否包含该分位数；我的阅读结论是上界试验列（值严格小于 1 的阶跃函数）避开它，下界一侧好参数集的极限分位数由 Gram 结构自动满足非负性，$p\equiv1$ 只在平凡情形出现，证据不足以下死结论。存疑点二：$R$ 延拓分支在 $x$ 恰好等于 $1/\lambda_+$ 型临界值处的可导性，文本在 $C^1$ 层面只声明了"光滑非负极限"，我对二阶导数是否连续没有把握，好在 $G_1$ 只用一阶信息，论证不受影响。存疑点三：望远镜一役中 $\eta(\mathcal G_N)\to1$ 的测度 $\eta$ 的构造细节在我读过的分块（§8 第一、四幕）之外，文本其余部分我未读全，只能引用声明本身。这三处的共同原因是我只按主干取材，细枝的定义现场没有逐条核对；如后续需要，应当补读 50-cavity.tex 的前四小节与 60-general.tex 的移除步骤全文。

## §14 自查与勘误记录

落盘协议执行记录：Write 建稿后基线 10873 字节，Edit 单行探针后复量 10963 字节，探针成立，此后全部为文末 Edit 追加，单次追加均未超过 25,000 字节，换行全文 LF，无 git 命令执行记录，除本稿与规格未读任何其他笔记。

违例修正记录：自查发现三处文风违例并当场以最小改动修正，均在此登记。第一处在 §5 末段，一个四字过渡套语被删去，句子改由冒号引导；第二处在 §8 第二幕，一处单字符长停顿号（成对出现）改为逗号；第三处在 §10 末段，一处两字转折连接词改写为"并非"句式。修正只动违例词本身，未删除任何论证内容。此后每轮追加都全文复扫禁令表各类别，最终命中数在 §15 落盘后的收工扫描中报告。

结构自查：§0 至 §15 编号连续，无整行分隔线，无装饰性加粗列表，无 emoji；人名连字符一律双连字符，数值区间一律单连字符；前向引用涉及的 §4、§5、§6、§7、§8、§9、§10、§11、§15 全部真实存在；行内数学一律成对 `$...$`。台账自本节之后单独成节，位于全文末尾，表头全文唯一，数据行逐行恰好六个竖线，限制与绝对值、范数分别用规定算子书写。

## §15 变量与常量台账

台账登记本稿论证链上的每个关键对象：符号、它在文本中的数值形态或增长率、真实读到的位置（文件:行，均为本会话 Read 输出中的行号）、被谁消费、若改动断在哪一步。阅读顺序建议按 §2、§3、§4、§5、§6、§7、§8、§9、§10、§11 的推进方向走一遍，正好复盘主定理从定义到夹逼闭合的生命周期。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $P_N$ | $\frac1N\log[2^{-N}\sum_{\sigma}\exp\{\frac12\sigma^{\mathsf T}U_N^{\mathsf T}\Lambda_NU_N\sigma\}]$，温度吸收进 $\Lambda_N$ | invariant-sk.tex:94 | 主定理全部极限陈述 | 均匀概率约定一换，$\log2$ 偏移污染零温夹逼 |
| 谱假设三条 | $\mu_N\Rightarrow\mu$、$\liminf_N\min_i\lambda_{i,N}\ge\lambda_-$、$\limsup_N\max_i\lambda_{i,N}\le\lambda_+$，$\mu$ 紧支撑 | invariant-sk.tex:107 | $b(x)$ 定义、极值收敛、反例对照 | 奇数子列逃逸特征值直接摧毁极限存在性 |
| $b(x)$ | 方程 $\int\mu(d\lambda)/(b(x)-\lambda)=x$ 在 $b>\lambda_+$ 的唯一解；无解时钉 $b(x)=\lambda_+$ | invariant-sk.tex:117 | 边缘延拓 $R$ 变换 | 延拓分支缺失则 $D_p$ 触及 0 区域时 $G_1$ 无定义 |
| $R(x)$ | $b(x)-1/x$（$x>0$），$R(0)=\int\lambda\,\mu(d\lambda)$，仅用 $0\le x\le1$ | invariant-sk.tex:124 | $G_t$、腔评估、$h_p$ 构造 | $R(0)$ 记账错则腔对数少一项 $nR(0)/2$ |
| $D_p(r)$ | $1-r-\int_0^1(p(s)-r)_+\,ds$，非负 Lipschitz，$D_p(1)=0$ | invariant-sk.tex:143 | 尾序到 $R$ 自变量的翻译 | 端点 $D_p(1)=0$ 变动会使分部积分多出边界项 |
| $T_{a,v}$ | $a^{-1}\log\mathbb E\exp\{af(z+\sqrt v g)\}$，$a=0$ 时退化为 $\mathbb E f(z+\sqrt v g)$ | invariant-sk.tex:159 | 场递归 $F_{i-1}=T_{\zeta_i,h_i-h_{i-1}}F_i$ | 算子性质表（偶凸光滑 1-Lipschitz）脱一处递归即失控 |
| $\ell(h)$ | $F_{-1}(0)-h_{k-1}/2$，终端 $F_{k-1}=\log\cosh$ | invariant-sk.tex:170 | $S$ 的定义、上界目标、腔评估式 | 减项与对角导数配对，改动令梯度公式多出余项 |
| $S(p)$ | $\sup_{h\in\mathcal H}\{\ell(h)+\frac12\int_0^1p(s)h(s)\,ds\}$，扩充实数意义 | invariant-sk.tex:176 | 主定理目标函数的场侧 | 与 $G_1$ 的 inf-sup 顺序不可交换 |
| $G_t(p)$ | $\frac12\int_0^1tR(tD_p(r))\,dr$，$G_0(p)=0$ | invariant-sk.tex:179 | 上界插值的谱侧 | $\partial_tG_t=\mathcal E_t$ 失配则最小性矛盾消失 |
| 主极限 | $\lim\mathbb E P_N=\lim P_N=\mathcal F(\mu):=\inf_{p\in\mathcal P}\{S(p)+G_1(p)\}$，后者 a.s. | invariant-sk.tex:195 | 全文；推论零温与 Wishart | inf 与 sup 交换即回到我草稿的死路 |
| 换算约定 | 计数测度加 $\log2$；删对角项减 $\frac12\int\lambda\,\mu(d\lambda)$；自由能 $=-\mathcal F/\beta$ | invariant-sk.tex:205 | §2 量纲核对、§9 夹逼 | 约定混乱在 $\beta\to\infty$ 时限放大为 $\log2$ 残留 |
| GG 恒等式 | $\mathbb E[f(\mathbf R_{1,n+1})\mid\mathcal F_n]=\frac1n\mathbb E f(\mathbf R_{12})+\frac1n\sum_{l=2}^nf(\mathbf R_{1l})$ | 10-arrays.tex:27 | 结构定理、Ward 闭合、腔测试 | 条件 $\sigma$ 代数记错则全部几何描述失效 |
| $Z(t)$ | 有界时 $e^{-C\lvert t\rvert}\le Z(t)\le e^{C\lvert t\rvert}$，$L^2$ 极限同时对齐全幂次 | 10-arrays.tex:65 | 不变性公式的解析延拓 | 分母可能在复邻域内归零，常值性推不动 |
| 复制阈值 | $\sup_{0\le w\le1}w/(1+(e^t-1)w)^n\le(n-1)^{n-1}/(n^n(e^t-1))$ | 10-arrays.tex:144 | 复制引理正概率事件 | 事件概率下界归零则超度量证明断链 |
| Gram 和式界 | $0\le\big\lVert\sum_{i\le n}v_i\big\rVert^2\le nD-\epsilon n(n-1)$ | 10-arrays.tex:182 | 非对角元非负性 | 负重叠存活则 $0\le p_a\le d_a$ 的符号链断 |
| 结构定理 | 支撑坐标逐序，$p=\sum_ap_a$，每个 $p_a$ 为 $p$ 的可测函数且在平台段常数 | 10-arrays.tex:151 | 场重建、值舍入 $\bar p$、可测性论证 | $B$ 对 $p$ 不可测则自一致性 $B=p$ 收不了口 |
| 倾斜链核 | $\mathbb P(Z_i\in dy\mid Z_{i-1}=z)=e^{\zeta_i(F_i(y)-F_{i-1}(z))}\gamma_{v_i}(d(y-z))$ | 20-field.tex:26 | $B_i$ 两自旋含义、采样标记链 | 核错一层权重则鞅性质不成立 |
| $B_i(h)$ | $\mathbb E[m_i(Z_i)^2]$，$0\le B_0\le\cdots\le B_{k-1}\le1$，鞅平方条件均值 | 20-field.tex:31 | 梯度公式、自一致性、支撑不等式 | 取值出 $[0,1]$ 则 $\ell$ 的 Lipschitz 界脱手 |
| 梯度公式 | $d\ell(h)=-\frac12\sum_{i=0}^{k-1}w_iB_i(h)\,dh_i$，严格锥内成立闭锥延拓 | 20-field.tex:43 | Hessian 对称性来源 | $M$ 不对称则凹性分解整段作废 |
| 混合符号 | $M_{ij}=w_i\partial_{h_j}B_i$ 在 $i\ne j$ 时 $\le0$ | 20-field.tex:246 | 半正定分解 | 符号翻转则 $(x_i-x_j)^2$ 系数变负 |
| 径向行和 | $\sum_j(DMD)_{ij}=h_iw_i\sum_jh_j\partial_{h_j}B_i\ge0$，$D=\operatorname{diag}(h_0,\ldots,h_{k-1})$ | 20-field.tex:250 | 凹性判定 | 行和变号则测试向量 $x$ 的分解失败 |
| 分解恒等式 | $x^{\mathsf T}Ax=\sum_ir_ix_i^2+\sum_{i<j}(-A_{ij})(x_i-x_j)^2$ | 20-field.tex:256 | $\ell$ 凹性证明收口 | 恒等式错项则全部凹性论证悬空 |
| 支撑不等式 | $\ell(v)\le\ell(h)-\frac12\int_0^1B_h(s)(v(s)-h(s))\,ds$ | 20-field.tex:231 | 腔自一致性把 sup 兑现 | 方向反了 $S(p)$ 等式变不等式 |
| $L^1$ 连续 | $\lvert\ell(h)-\ell(v)\rvert\le\frac12\lVert h-v\rVert_{L^1(0,1)}$ | 20-field.tex:236 | 有界单调路径延拓、$\bar p\to p$ | 极限不唯一则 $h_p$ 定义不良 |
| 域界 | $d=\int_0^1(1-p)>0$ 时 $0\le S(p)\le(d^{-1}-1)\log2$ | 20-field.tex:293 | 上界取试验 $q$ 值严格小于 1 | $S(q)=\infty$ 则目标 $\mathcal J_N$ 无法起步 |
| Ward 非对角 | $\mathbb E[\Phi(Q_{12})(\rho_bA^a_{12}-\rho_aA^b_{12})]=t(\lambda_a-\lambda_b)\mathbb E[\Phi(Q_{12})(d_aA^b_{12}+A^a_{12}d_b-2A^a_{13}A^b_{23})]$ | 30-rotation.tex:389 | 谱路径重建 | 任一项系数漂移则 $f_a$ 方程组不闭合 |
| Ward 对角 | $\rho_bd_a-\rho_ad_b=t(\lambda_a-\lambda_b)(d_ad_b-\mathbb E[A^a_{12}A^b_{12}])$ | 30-rotation.tex:395 | 对角值 $d_a$ 的钉死 | 能量式 $\frac12\sum_a\lambda_ad_a$ 失去输入 |
| 微扰误差 | 确定项 $O(e_N)$，高斯项 $Ce_N^2\sum_j(1+j)4^{-j}=O(e_N^2)$ | 30-rotation.tex:444 | 恒等式取极限 | 阶不降则极限恒等式混入未定标量 |
| $f_a$ 族 | $f_a(x)=\rho_a/(b_t(x)-t\lambda_a)$，$f_a'(0)=\rho_a$，$\sum_af_a'(x)=1$，$b_t(x)=tb(tx)$ | 30-rotation.tex:560 | 符号解与根解 | 权重和不为 1 则 $x=D_p(p(s))$ 认不出来 |
| 重建公式 | $p_a(s)=\int_0^{p(s)}f_a'(D_p(r))\,dr$，$d_a=\int_0^1f_a'(D_p(r))\,dr$，覆盖 $t=0$、重根、$D_p=0$ | 30-rotation.tex:581 | 全部谱信息经由 $p$ | 除以 $(\lambda_a-\lambda_b)$ 的版本在重根处爆炸 |
| 对角超出量 | $d_a-p_a(1-)=\int_{p(1-)}^1f_a'(D_p(r))\,dr\ge0$，除以 $\rho_a$ 后导数 $\le1/\rho_a$ | 30-rotation.tex:663 | 高斯协方差一致界 | 界丢失则去截断的支配收敛失败 |
| 能量式 | $\mathcal E_t(p)=\frac12\int_0^1F_t'(D_p(r))\,dr=\frac12\sum_a\lambda_ad_a$，$F_t(x)=xR(tx)$ | 40-upper.tex:15 | 上界对 $t$ 求导 | 两种写法不等则插值导数与能量脱钩 |
| 能量有界 | $\lvert\mathcal E_t(p)\rvert\le L/2$，$L=\max_a\lvert\lambda_a\rvert$ | 40-upper.tex:33 | $\mathcal J_N$ 最小元存在 | 目标无下界则最小性论证不能启动 |
| 尾序蕴含 | $\int_s^1p\ge\int_s^1q$（一切 $s$）推出 $\mathcal E_t(p)\le\mathcal E_t(q)$ | 40-upper.tex:22 | 最小性矛盾的主轴 | $F_t$ 凸性缺失即断，Cauchy--Schwarz 那步 $M_1M_3\ge M_2^2$ 顶梁 |
| 原函数式 | $\int_0^t\mathcal E_u(q)\,du=G_t(q)$ | 40-upper.tex:29 | 谱项在插值中的记账 | 常数失配则 $t\delta$ 项吞不掉误差 |
| 惩罚项 | $\Pi_N=\sum_j2^{-j}(u_j-3/2)^2+\sum_a(v_a-3/2)^2$ | 40-upper.tex:122 | 微扰参数不逃逸 | 去掉惩罚最小点可能跑到边界外 |
| $R'$ 单调 | $R'(x)=\frac1{x^2}-\frac1{M_2(x)}\ge0$，$M_2(x)=\sum_a\rho_a/(b(x)-\lambda_a)^2\ge x^2$ | 50-cavity.tex:780 | $h_p$ 不降性 | $h_p$ 不单调则不属于 $\mathcal H$ |
| 压缩恒等式 | $(bI_n-C-L^{\mathsf T}(bI_d-A)^{-1}L)^{-1}=xI_n$ | 50-cavity.tex:811 | 腔场坐标独立性 | 右端带矩阵结构则回代递归不因子分解 |
| 行列式导数 | $\frac1n\frac{d}{dx}\log\det(I_d-H(x)K)=\frac1x+xb'(x)=xR'(x)$ | 50-cavity.tex:830 | 残差方差记账 | 少一项则评估式与 $G_1$ 对不上账 |
| 腔评估式 | $\frac1n\mathbb E\log\langle W\rangle_p=\ell(h_p)+\frac12\int_0^1p(s)h_p(s)\,ds+G_1(p)$ | 50-cavity.tex:792 | 下界主线 | 端点 $D_p(1)=0$ 变动即多出边界项 |
| 自旋测试 | $\mathbb E\langle\phi(Q_{12})\varepsilon_j^1\varepsilon_j^2\rangle_{p,W}=\int_0^1\phi(p(s))B_{h_p}(s)\,ds$ | 50-cavity.tex:798 | 自一致性输入 | 公共水平分布在倾斜下不保持则整条断 |
| 平台可测 | $B_{h_{\bar p}}$ 在 $p$ 的平台段常数，广义逆恢复坐标，奇异连续部分亦覆盖 | 50-cavity.tex:953 | 推前测度归零后收口 | 可测性缺失只能得弱式等式 |
| 望远镜闭合 | $\liminf\mathbb E P_N\ge\inf_p\{S(p)+G_1(p)\}$，微扰改期望对数配分 $O(Ne_N)=o(N)$ | 50-cavity.tex:1024 | 有限字母表下界 | $\eta(\mathcal G_N)\to1$ 失效则集外误差不可积 |
| 零温夹逼 | $\frac{P_N(\beta)}{\beta}\le M_N\le\frac{P_N(\beta)}{\beta}+\frac{\log2}{\beta}$ | 60-general.tex:384 | 基态能量推论 | 均匀测度约定改动则余量不再是 $\log2/\beta$ |
| MP 律 | $a_\alpha=(1-\sqrt\alpha)^2$，$b_\alpha=(1+\sqrt\alpha)^2$，密度 $\frac{\sqrt{(b_\alpha-x)(x-a_\alpha)}}{2\pi x}\mathbf 1_{[a_\alpha,b_\alpha]}(x)\,dx$ 加 $(1-\alpha)_+\delta_0$ | 60-general.tex:427 | Wishart 推论的谱输入 | 边缘写错则算子范数预测失准 |
| 范数极限 | $\frac{\lVert G_N\rVert_{\infty\to2}}{N}\to\sqrt{2e_+(\alpha)}$，$\frac1N\min_\sigma\lVert\sum_i\sigma_ig_{N,i}\rVert_2\to\sqrt{-2e_-(\alpha)}$ | 60-general.tex:451 | 推论的物理输出 | 零温极限不存在则两式同时悬空 |
| 反例谱 | 密度 $e^\lambda\mathbf 1_{\{\lambda\le0\}}$，中点分位数 $q_{N,j}=\log\frac{j-1/2}{N}$，奇数维换出 $-e^{N^2}$ | 60-general.tex:585 | 谱假设必要性说明 | 极值条件放松此例立刻反噬 |
| 奇子列坠速 | $P_N\le-\frac{e^{N^2-4N}}{2N}\to-\infty$，并集界 $C2^Ne^{-2N}$ 可求和 | 60-general.tex:628 | 偶奇子列分歧 | 球面坐标密度前因子一旦无界 Borel--Cantelli 失灵 |
| 受约束泛函 | $\ell^{[s]}(h)=\inf_{b\in\R}\{\ell_b^{\mathrm{can}}(h)-bs\}$ | 70-magnetic.tex:21 | 磁场延拓的单点侧 | 凹性对约束版本失效则 $S_{\mathbf m}$ 无定义 |
| 磁化公式 | $\sup_{\mathbf m}\{\sum_j\gamma_jc_jm_j+\inf_p[S_{\mathbf m}(p)+G_1(p)]\}$ | 70-magnetic.tex:61 | 磁场主定理有限字母表层 | 各组共用 $h$ 的约束被放开即偏离模型 |
| $W_1$ 度量 | $\inf_\pi\int_{\R^2}\lvert x-y\rvert\,\pi(dx,dy)$，一阶矩有限 | 70-magnetic.tex:47 | 一般场律的极限定义 | 传输代价换 $L^2$ 型则稳定性估计失配 |
| 不变性公式 | $\mathbb E\Phi=\mathbb E[\Phi\exp(t\sum_{j\le n}H'_j)/Z(t)^n]$ 对一切实 $t$ | 10-arrays.tex:52 | 复制引理与结构定理 | 数组到几何的压缩失去唯一入口 |
| 复制引理 | 正概率容差事件下可再塞一复制满足全部区间要求 | 10-arrays.tex:113 | 超度量重心的两组复制 | 迭代第一步就断，重心论证无从放大 |
| 同步论证 | 分量与两分量和同时满足标量恒等式，坐标交叉被排除 | 10-arrays.tex:216 | 支撑坐标逐序 | 同步分位数表示不成立，$p_a$ 对 $p$ 不可测 |
| 坐标 Lipschitz | 各坐标作为可能和的函数为 1-Lipschitz | 10-arrays.tex:230 | 平台段常数的来源 | 值舍入 $\bar p$ 的可测性链条脱节 |
| $F_i$ 正则性 | 偶、凸、光滑、1-Lipschitz，按 $T_{\zeta,v}$ 逐层保持 | 20-field.tex:18 | 倾斜链核良定义、鞅论证 | 任一性质脱手则 $B_i$ 的界出格 |
| 折叠密度 | 绝对子位置密度正比 $e^{-u^2/(2v)}\cosh(zu/v)e^{\zeta F(u)}$ | 20-field.tex:97 | 单调似然比比较 | 混合导数符号与径向行和同时失去依据 |
| refinement 不变 | $h$ 常值段细分不改 $\ell$，$B$ 重复取值 | 20-field.tex:47 | 公共细分上的支撑不等式 | 腔逼近与试验场无法放到同一网格比较 |
| Ho 归一化 | $\ell(h)=-\psi(h/2)$，终端同为 $\log\cosh$ | 20-field.tex:280 | 文献对表与零场凹性引用 | 差一个 $\log2$ 常数则外场延拓基线错位 |
| 凸性链 | $M_1=x$，$b_t'=-1/M_2$，$b_t''=2M_3/M_2^3$，$(xb_t)''=2(M_1M_3-M_2^2)/M_2^3\ge0$ | 40-upper.tex:60 | $F_t$ 凸、尾序能量序 | Cauchy--Schwarz 一断上界主轴全垮 |
| 正部恢复 | $\int_0^1(p-r)_+\,du=\max_s\{\int_s^1p-(1-s)r\}$ | 40-upper.tex:71 | 尾序翻译成 $D_p\le D_q$ | 两序脱钩后最小性给不出能量占优 |
| 上界命题 | $\limsup_N\mathbb E P_N\le\inf_p\{S(p)+G_1(p)\}$（有限谱、比例收敛） | 40-upper.tex:90 | 主定理上半 | 有限字母表层不闭合 |
| 最小点负值 | $\mathcal J_N$ 在 $t=1,h=0,u=v=3/2$ 处 $\le-\eta$ | 40-upper.tex:117 | 反证启动 | $\delta$ 取不进则 $\eta$ 无法维持 |
| 参数盒 | $0\le t\le1$，$0\le h_0\le\cdots\le h_{k-1}\le H$ | 40-upper.tex:129 | 最小元存在与内点变分 | 无界方向上 inf 可能不被取到 |
| 根方程 | $\rho_br_a-\rho_ar_b=t(\lambda_a-\lambda_b)(f_a(x)r_b+r_af_b(x))$ | 30-rotation.tex:620 | $r_a=p_0f_a'(x)$ 的导出 | 路径起点失锚，Stieltjes 重构差常数 |
| 符号公式 | $\widehat L_f(s)=f(0)+\int_{p(s)}^1F_p(r)f'(D_p(r))\,dr=f(D_p(p(s)))$ | 30-rotation.tex:641 | 路径唯一确定 | 符号与根不再决定路径，$d_a$ 悬空 |
| 零残差方差 | 顶重叠为 1 时 $p\equiv1$、$D_p\equiv0$，残差方差归零 | 30-rotation.tex:658 | 协方差一致界的极端情形 | $p_a=d_a=\rho_a$ 分支失控 |
| 预备下界 | $\liminf\frac1n(\mathcal F_{N+n}-\mathcal F_N)\ge\ell(h_p)+\frac12\int_0^1p\,h_p+G_1(p)$ | 50-cavity.tex:897 | 第三幕的输入 | 截断收回失败则不等式停留在 capped 层 |
| 测试恒等式 | $\lim_{\bar p\to p}\int_0^1\phi(\bar p(s))(B_{h_{\bar p}}(s)-\bar p(s))\,ds=0$ | 50-cavity.tex:945 | 自一致性推导 | $B=p$ 只剩推前为零的弱式版本 |
| $\mathcal V$ 有限 | $S\ge0$、$G_1$ 有界、零试验的 $S$ 有限 | 50-cavity.tex:1001 | 望远镜启动 | 目标为 $-\infty$ 时下界陈述空洞 |
| 压强算子界 | $\lvert P_N\rvert\le\lVert J_N\rVert_{\mathrm{op}}/2$ | 60-general.tex:358 | 随机谱可积性 | 期望收敛缺少控制变量 |
| 基态区间 | 极限落在 $[\mathcal F(\mu_\beta)/\beta,\ \mathcal F(\mu_\beta)/\beta+\log2/\beta]$ 对每个 $\beta\in\N$ | 60-general.tex:395 | 确定性论证 | 交可数事件一步省不掉则随机极限残留 |
| Wishart 压强 | $p_N(c)=\frac1N\log[2^{-N}\sum_\sigma\exp\{\frac{c}{2N}\lVert G_N\sigma\rVert_2^2\}]$ | 60-general.tex:417 | 推论对象定义 | 含对角自交互的约定一变常数偏移 |
| 偶子列夹 | $-\frac12\le\frac{\operatorname{Tr}\Lambda_N}{2N}\le P_N\le0$ | 60-general.tex:603 | 反例偶数侧 | Jensen 方向写反子列不再受困 |
| 球面密度 | $\frac{\Gamma(N/2)}{\sqrt{\pi N}\,\Gamma((N-1)/2)}(1-t^2/N)^{(N-3)/2}$，前因子有界 | 60-general.tex:614 | 并集界可求和性 | 密度界发散则 Borel--Cantelli 失灵 |
| $W_1$ 极限 | $\mathcal F_\mu(\nu)=\lim_{q\to\infty}\mathcal F_\mu(\nu_q)$，与逼近列无关 | 70-magnetic.tex:71 | 一般场律表述 | 良定义性缺口令整节结论无意义 |
| 条件 Haar | 给定谱与场数据按 Haar 轨道取相互作用，Lipschitz 常数与外场无关 | 70-magnetic.tex:96 | 随机数据备注 | 依赖数据下集中不等式失去依据 |
| Gram 阵定义 | 有限主子矩阵半正定、弱交换、对角为确定常数 | 10-arrays.tex:18 | 全节结构定理的输入空间 | 半正定丢失则重心与并集界两类武器都失效 |
| $L^2$ Cauchy | 有界交换变量经验幂均值同时构造，$\lvert H_l\rvert\le C$ | 10-arrays.tex:59 | $Z(t)$ 存在性 | 幂次族极限不对齐则指数倾斜无定义 |
| 支撑三元组 | 违反超度量则存在 $a\ge b>c$ 的支撑点排列 | 10-arrays.tex:190 | 重心矛盾 | 排指标步骤不成立超度量证明改道 |
| 容差分配 | 每步阈值取稍大于被复制者全部重叠，总增量控制在 $\epsilon$ 内 | 10-arrays.tex:200 | 复制引理迭代 | 正概率事件逐步丢失，放大失败 |
| 齐次性 | $b_t(x)=tb(tx)$，$\sum_a\lambda_af_a(x)=(xb_t(x)-1)/t$ | 40-upper.tex:45 | 能量两写法互译 | $F_t=xR(tx)$ 认不出，原函数式断 |
| 试验列约束 | 有限阶跃、值严格小于 1 | 40-upper.tex:97 | $\mathcal J_N(t{=}1,h{=}0)$ 负值 | 触及 1 的试验使 $S$ 可能发散 |
| 标量场恒等式 | $C+L^{\mathsf T}\widetilde H(x)L=R(x)I_n$ | 50-cavity.tex:817 | 二次变换后场独立 | 协方差路径 $h_p$ 无从产生 |
| 行列式重数 | $\log\det$ 差 $=n(\log x+\sum_a\rho_a\log(b-\lambda_a))$，重数 $n$ 对 $n-s_a$ | 50-cavity.tex:820 | 导数 $xR'(x)$ 的记账 | 残差协方差 $v-h_*$ 算错，$G_1$ 失衡 |
| 恒等式尾巴 | a.e. 成立 $1-D_p(r)-\int_{\{p>r\}}p\,ds=-rD_p'(r)$ | 50-cavity.tex:870 | Fubini 重排 | $2G_1(p)$ 的组合失败 |
| 一致舍入 | $h_{\bar p}\to h_p$ 一致，右端经 $\ell$ 的 $L^1$ 连续收敛 | 50-cavity.tex:901 | 从 capped 到真下界 | 阶跃逼近不单调则极限表达式漂移 |
| 站点对称 | $\mathbb E\langle\phi(Q_{12}^+)\varepsilon_j^1\varepsilon_j^2\rangle_+=\mathbb E\langle\phi(Q_{12}^+)Q_{12}^+\rangle_+$ | 50-cavity.tex:937 | 测试恒等式的来源 | 自一致性失去全部输入 |
| 基态定义 | $M_N=\frac1{2N}\max_{\sigma}\sigma^{\mathsf T}J_N\sigma$ | 60-general.tex:367 | 零温推论对象 | 因子 $\frac1{2N}$ 移错极限差两倍 |
| 极值收敛 | 弱收敛加双侧条件迫使 $\min_i$、$\max_i$ 特征值收敛到 $\lambda_\pm$ | invariant-sk.tex:112 | 边缘延拓的自变量范围 | 极值漂移则 $b(x)$ 钉边规则错位 |
| $R$ 定义域 | 最终公式只用 $0\le x\le1$，延拓是定义的一部分 | invariant-sk.tex:128 | $G_1$ 有限性 | 越界取值则 $R$ 无谱解释 |
| inf-sup 顺序 | 主定理式外 inf 内 sup，声明证明不交换 | invariant-sk.tex:209 | 上界最小化论证的合法性 | 交换即回到试验元随子列漂移的死路 |
| Wishart 设定 | $m_N=\lfloor\alpha N\rfloor$，$cG_N^{\mathsf T}G_N/N$ 覆盖一切固定 $c\in\R$，含对角自交互 | invariant-sk.tex:216 | 推论入口 | 删对角约定则与主定理换算式失配 |
| 增量记号 | $v_i=h_i-h_{i-1}$，$h_{-1}=0$，$\gamma_v$ 为方差 $v$ 中心高斯（$v=0$ 点质量） | 20-field.tex:14 | 倾斜链与 $T$ 算子 | $v=0$ 分支被删则 tie 水平支撑不等式断 |
| 重根声明 | Ward 命题断言包含不同组的相等特征值 | 30-rotation.tex:400 | 重建公式的全覆盖 | 除差版本在此处爆炸 |
| $f_a$ 光滑 | $f_a$ 关于 $(x,t)$ 联合光滑含 $x=0$，逆变量取 $1/b_t$ 用反函数定理 | 30-rotation.tex:565 | 根方程与 $f_a'(0)=\rho_a$ | 零点奇性则 $t=0$ 分支单独补洞 |
| 符号和约束 | $x=\sum_a\alpha_a=D_p(p(s))$，$\alpha_a\ge0$ | 30-rotation.tex:603 | 分辨方程识别 | 认不出 $x$ 则 $\alpha_a=f_a(x)$ 无从谈起 |
| 残差协方差 | $(v-h_*)I_n$，$v=\int_0^1R'(D_p(r))\,dr$，$h_*=h_p(1-)$ | 50-cavity.tex:845 | 腔对数的记账 | 重复计 $h_*$ 则评估式多出 $\frac12 h_*$ |
| cosh 因子化 | 非残差场自旋和为 $\prod_j\cosh z_j$，回代按坐标相乘 | 50-cavity.tex:849 | $n[\ell(h_p)+h_*/2]$ 贡献 | 坐标不独立则单点递归失效 |
| 场组共用 $h$ | 全部 $J$ 个场组共用同一条协方差路径 | 70-magnetic.tex:42 | $S_{\mathbf m}$ 定义 | 每组独立层级偏离模型允许的重叠几何 |
| 场压强 | $P_N(c^{(N)})$ 指数含 $\sum_r c_r^{(N)}\sigma_r$ 线性项 | 70-magnetic.tex:12 | 磁场主定理对象 | 线性项记号漂移则磁化共轭符号乱 |
| 试验分位数类 | $\mathcal P$：$(0,1)\to[0,1]$ 不降可测函数，零测集等同 | invariant-sk.tex:136 | inf 的定义域 | 等同约定改动则 $S$、$G$ 的积分表达不稳 |
| 分母求导技巧 | 对 $Z(t)^{n+d}$ 求导用再引一复制的平均代表 | 10-arrays.tex:70 | 不变性公式逐阶导数 | 导数展开式失配，$\varphi^{(d)}(0)=0$ 推不出 |
