## §0 登记与问题的起点

我这次要反推的，是一项关于三维最近邻各向同性量子 Heisenberg 铁磁体的工作。真正把我拉进来的，是 Mermin--Wagner 定理留下的那个缺口。它在 1966 年排除了正温度下有限程各向同性 Heisenberg 模型在一维、二维的自发铁磁与反铁磁序；在更高维，红外界方法确实给出了经典模型的连续对称破缺，也给出了量子反铁磁体的序。可这些结论回答的是"有没有序"，而我盯着的是另一个问题：在零场的有限体积对称态里，磁化强度这个随机向量的**分布**长什么样。

记号先固定下来。自旋 $S\in\{\tfrac12,1,\tfrac32,\dots\}$，$S^1,S^2,S^3$ 是自旋 $S$ 的不可约矩阵，满足对易关系 $[S^a,S^b]=i\sum_c\epsilon_{abc}S^c$ 与 $\sum_{a=1}^3(S^a)^2=S(S+1)I$。环面取 $\Lambda_L=(\Z/L\Z)^3$，偶数 $L\ge4$，体积 $V=L^3$。模型是 $H_{S,L}=-\sum_{\{x,y\}}\sum_{a=1}^3 S_x^aS_y^a$，总自旋 $M_L^a=\sum_{x\in\Lambda_L}S_x^a$。Gibbs 期望记作 $\langle A\rangle_{\beta,L}=\operatorname{Tr}(Ae^{-\beta H_{S,L}})/\operatorname{Tr} e^{-\beta H_{S,L}}$。压力与它在零场的右导数定义为 $p_{S,\beta}(h)=\lim_{L}\frac1{\beta V}\log\operatorname{Tr} e^{-\beta(H_{S,L}-hM_L^3)}$ 与 $m_{S,\beta}=p_{S,\beta}'(0+)$；这个极限先取体积、后撤场。

我要证的命题是所谓球面磁化律。对每个固定的 $S$，存在有限的 $\beta_0(S)$，当 $\beta\ge\beta_0(S)$ 固定、$L$ 沿偶数趋于无穷时，$m=m_{S,\beta}>0$，且对一切 $t\in\R^3$，
$\lim_{L}\bigl\langle\exp\bigl(\frac1V\sum_{a=1}^3 t_aM_L^a\bigr)\bigr\rangle_{\beta,L}=\frac1{4\pi}\int_{\mathbb S^2}e^{m\,t\cdot n}\,\mathrm d\sigma(n)=\frac{\sinh(m\lvert t\rvert)}{m\lvert t\rvert}$，
其中 $\sigma$ 是 $\mathbb S^2$ 上的面积测度，$t=0$ 处商取 $1$。右端这个变换，正是"长度固定为 $m$、方向在球面上均匀分布"的向量所给出的特征函数。也就是说，有限体积对称态并没有把磁化强度抹成零向量，是把它摊在半径 $m$ 的球面上。同一命题还给出二阶矩版本 $\lim_L\frac1{V^2}\sum_{x,y\in\Lambda_L}\langle S_x\cdot S_y\rangle_{\beta,L}=m^2$。

为什么这件事需要单独证。旋转不变性本身只给出 $\langle M_L^a\rangle_{\beta,L}=0$，它同样允许不同长度的混合。于是真正的问题是两层：对称态是否只挑出**一个**长度；以及这个长度是否等于无穷小场挑出的那个 $m$。零场的对称态在有限体积里是旋转不变的，即使在存在磁化平衡态的温度上也是如此。这正是困难所在：有限体积里没有破缺的方向可以借用，全部信息都藏在旋转不变的可观测量里。我能用的探针，是 $\exp(\frac1V t\cdot M_L)$ 这类自伴线性组合的期望，它不需要对不交换的自旋分量做联合测量。

顺带说明为什么这个问题不像它表面看上去那样只是形式推广。三维环面上最近邻相互作用的存在性已经被同伴工作处理：一篇构造了维度至少三、每个固定自旋、足够低正温度下的磁化平衡态；另一篇给出压力定义下磁化的低温渐近，适用范围是非负对称有限程、且支撑生成 $\Z^3$ 的相互作用。这两篇给了我有限的交换估计与几何估计。本工作要额外加的，是周期环面上的空间控制，以及一个压力论证，用来排除磁化强度长度不同的平移遍历平衡态。

素材目录：preprints/The-spherical-magnetization-law-for-the-three-dimensional-quantum-Heisenberg-ferromagnet-October-5-2026
其他队列第 504 行号

## §1 最初的两条直觉与它们各自的缺口

我最早的直觉很朴素：既然在无穷体积里有自发磁化，那么在有限体积里，把总自旋 $J_L$ 的标签抓住，看 $J_L/V$ 收敛到什么，再补一个方向均匀性就够了。这个直觉有一半是对的，另一半正是整篇工作要拆的硬骨头。

先看对的那一半。设 $J_L$ 是旋转不变 Gibbs 态里的总自旋标签，取值 $J_L,J_L-1,\dots$。在给定 $J_L$ 的条件下，$M_L$ 的任意一个分量在 $-J_L,-J_L+1,\dots,J_L$ 上均匀分布，于是它的二阶矩满足 $\mathbb E[M_L^a{}^2\mid J_L]=\frac13 J_L(J_L+1)$，而对三个分量求和得 $\sum_a\mathbb E[M_L^a{}^2\mid J_L]=J_L(J_L+1)$。一个固定正场加上 $m$ 的定义，就直接给出
$\mathbb P(J_L/V>m+\epsilon)\longrightarrow0\qquad(\epsilon>0)$。
这一步只用了压力的凸性与场导数的意义，几乎不用额外的空间信息。于是整件事塌缩成一个下界：
$\liminf_{L}\frac{\mathbb E[J_L(J_L+1)]}{V^2}\ge m^2$。
一旦这个下界与上面那个上界同时成立，$J_L/V\to m$ 依概率，球面律与二阶矩律都跟着出来。所以我的第一版计划写成两步：上界由场导数免费得到，下界是唯一要攻的堡垒。

下界为什么难。$\mathbb E[J_L(J_L+1)]$ 是全局量，而一切可以直接估计的东西都是局部的。我想先用局部的平方磁化去逼近全局的平方磁化。直觉是：把 $\Lambda_L$ 切成大盒，若每个大盒里的磁化方向都对齐，那么局部平方之和约等于全局平方；若它们相互抵消，全局平方就会小很多，而这正是要排除的。问题在于，局部方向可以缓慢地在空间上转动，让局部平方很大而全局平方被抵消掉。这类"空间上的缓慢变化"是第一个真正的障碍，它逼我去证一个尺度上的比较：大局部盒上的平方磁化被全环面的平方磁化控制，误差随局部尺度增大而消失。

第二条直觉来自平衡态的结构。我本来想：既然每个平移遍历平衡态的磁化向量长度都是 $m$，那么任意平衡态都是遍历态的混合，混合之后的局部平方磁化的期望就是各遍历态长度的加权平均，也就是 $m^2$，下界立刻到手。这条路的缺口在于"每个遍历态长度都是 $m$"这句话本身要证。而且我后来发现，把它当成前提会让整条链子循环：长度唯一性恰恰是我要的结论之一。正确的顺序是先证局部平方由全局平方控制（空间比较），再独立地证遍历态长度唯一（压力论证），最后把两者接起来。第一节里那个"两步"的计划其实顺序是反的，我在笔记后面会写清楚这个转折。

还有第三条一开始没被我看上的路线：直接用同伴工作里的低温渐近。那类结果给出的是自旋波理论预言的自由能渐近，与固定正温度下零场磁化分布、或与场导数，都不是同一个极限。把它拿来当输入，会混淆两个不同的极限次序，所以我没有走这条路，只借用它的有限交换与几何估计。

我给自己立的规矩是：正文里出现的每一个量，都要能指到素材里真实的一行。下面几节按这条规矩，把真正落地的构造一层层拆开。

## §2 交换表示：把配分函数写成置换平均

真正让空间估计成为可能的，是 Tóth 的随机搅拌表示。它的想法是把自旋算符变成置换算符，让 Gibbs 权重变成一个有限图上置换的期望。我用的是 Nachtergaele 的高自旋版本，思路是把每个格点的自旋 $S$ 看成 $\ell=2S$ 个自旋 $\tfrac12$ 的对称槽。

具体地，取 $\ell=2S$，令 $\mathcal I=\Lambda_L\times\{1,\dots,\ell\}$ 为 $N=\ell V$ 个槽的集合，在 $(\mathbb C^2)^{\otimes\mathcal I}$ 上把每个槽的 Pauli 矩阵记作 $s_i^a$（即 $\sigma^a/2$）。对每个格点 $x$，把该点 $\ell$ 个槽上的置换算符 $\mathcal U_{\pi,x}$ 平均，得到投影到对称子空间张量积的算符
$P_*=\prod_{x\in\Lambda_L}\frac1{\ell!}\sum_{\pi\in\mathfrak S_\ell}\mathcal U_{\pi,x}$。
在这个子空间上，$S_x^a=\sum_{i:\,x_i=x}s_i^a$ 就给出自旋 $S$ 的表示。单个槽算符的压缩满足 $P_*s_i^aP_*=\ell^{-1}S_{x_i}^aP_*$，这个因子 $\ell^{-1}$ 是后面所有常数的来源之一，值得先记下。

交换图的构造如下。每条格点键上方放 $\ell^2$ 条槽边，在时间区间 $[0,\beta)$ 上以速率 $1/2$ 做独立的 Poisson 交换；在 $\beta$ 到 $0$ 的接缝处，每个格点再插入一个独立的均匀槽置换。设 $\pi$ 是 $\mathcal I$ 上由此得到的置换，$\mathbb P_{\rm b}$ 是它背后的图律，$\mathcal E$ 是槽边集合，则
$e^{H_0}P_*=e^{\beta\lvert\mathcal E\rvert/4}\mathbb E_{\rm b}\mathcal U_\pi$，其中 $H_0=-\beta H_{S,L}$。
验证只用两个恒等式：$\boldsymbol s_i\cdot\boldsymbol s_j=\frac12\mathcal U_{(ij)}-\frac14 I$，以及平均时序 Poisson 积的生成元是 $\frac12\sum_{e\in\mathcal E}(\mathcal U_e-I)$；每条键上方全槽求和与 $P_*$ 交换，接缝平均正好插入 $P_*$。物理迹也随之改写：
$\operatorname{Tr}_{\rm phys}(Ae^{H_0})=\operatorname{Tr}_{\rm slot}(\widehat A e^{H_0}P_*)$，其中 $\widehat A$ 是把 $S_x^a$ 换成 $\sum_{i:\,x_i=x}s_i^a$ 的槽提升。

接着是"颜色"与"环"。沿一条采样图跟踪重复出现，就得到它的环；在带对角自旋插入的槽迹里，一个环有恒定的上/下颜色。没有插入时，一个环的贡献是 $2$，这就是后面到处出现的权重 $2^{n}$ 的来源。我要强调一个细节：时间点取在每次瞬时操作**之后**，包括接缝处；有限体积里几乎必然只有有限多个标记，且它们的时间可以避开任意预先给定的有限切割集。这个"取在操作之后"的约定，是后面处理重合操作时不出错的保险。

我引入了一类置换律，叫"容许律"：有限集上的置换律，如果它是若干独立 Bernoulli 对换与确定性置换的有限乘积的分布极限，就叫容许。乘积是有序的，不假设可交换。有限时间任意速率的 Poisson 交换、指定子集上的均匀置换、以及它们的独立复合，都在这一类里。为什么需要这个类？因为后面所有稳定性、负相关、零自由迹的陈述，都要在一个对复合封闭的类上成立。

关键的两条稳定性事实我原样用过来。其一，对一个容许置换 $\pi$，多项式 $\mathbb E\prod_{i\in I}(u_i+v_{\pi(i)})$ 是稳定的，即当所有变量取正虚部时不取零。变量等同保持稳定；求导、实值代入、有界次数逐系数取极限，至多把稳定多项式打成零多项式。其二，若随机子集 $A\subseteq I$ 有稳定的生成多项式 $G_A(\boldsymbol z)=\mathbb E\prod_{j\in A}z_j$，则对每个 $J\subseteq I$ 有 $\Pr(J\subseteq A)\le\prod_{j\in J}\Pr(j\in A)$。这两条是负相关与部分对称化的经典结论，我把它们当作黑箱，只在需要的地方注明它们不需要任何空间假设，因而可以用在时间层的无交并上。

与稳定性平行的是零自由迹。用单位圆盘上的一个符号计算可以把它讲得很干净：在任一固定 qubit 基下，一个置换层的多项式，在输入 ket $(1,x_i)^T$ 与代数输出余向量 $(1,y_i)$ 之间取值，等于 $\mathbb E\prod_i(1+x_iy_{\pi(i)})$，它在所有 $\lvert x_i\rvert,\lvert y_i\rvert<1$ 时无零点。把变量代换 $u_i=i\frac{1+x_i}{1-x_i}$ 与 $v_j=i\frac{1-y_j}{1+y_j}$ 送进稳定性事实即可：两族变量都落在上半平面，而分母之积与 $\pi$ 无关。

从符号到迹，需要一个收缩引理。对一个双变量片段，收缩把 $A+Bx+Cy+Dxy$ 映到 $A+D$。要证明它保不消失，固定其余变量在各自圆盘内，取 $r_x<1+\varepsilon$、$r_y<1$ 且 $r_xr_y>1$，令 $x=r_xz$、$y=r_yz$；得到的多项式在 $\lvert z\rvert<1$ 无零点，常数项 $A$ 非零。若二次项系数非零，两根之积模至少为一，给出 $\lvert D\rvert r_xr_y\le\lvert A\rvert$；若次数至多一，则 $D=0$。两种情形都有 $\lvert D\rvert<\lvert A\rvert$（当 $D\ne0$），故 $A+D\ne0$。逐步收缩所有配对，就得到：在有限多个 qubit 槽上，取置换层与单槽矩阵张量积的有限循环乘积（至少含一个置换层），若每个单槽矩阵在 $\lvert x\rvert\le1$ 上诱导射影映射 $(1,x)^T\mapsto a(x)(1,\phi(x))^T$ 且 $a(x)\ne0$、$\lvert\phi(x)\rvert<1$，则这个循环乘积的迹非零。这是 Asano--Ruelle 收缩法的一个圆盘形式，我把它用在完整的循环迹上。

最后记下三个具体的单槽映射，后面场比较与压力论证都靠它们。在 $s^3$ 坐标下选本征基 $(1,\pm i)^T/\sqrt2$。在这个基里，$SL_2(\R)$ 中在 $s^3$ 坐标下为实的矩阵，作用为单位圆盘的自同构；若 $\operatorname{Re} z>0$，矩阵 $e^{zs^2}$ 把闭圆盘严格送进开圆盘；还存在绝对常数 $b_*,a_0>0$，使得当 $0<b\le b_*$、$f\in[-1,1]$、$\lvert\operatorname{Im} z\rvert<a_0$ 时，矩阵 $e^{bs^2/2}e^{bzfs^3}e^{bs^2/2}$ 也把闭圆盘严格送进开圆盘。最后一个断言的证明是初等的：最右因子先把 $\lvert x\rvert$ 压到 $e^{-b/2}$，上半平面像满足 $\sin(\arg\zeta)\ge\tanh(b/2)\ge cb$，于是 $\arg\zeta$ 与 $0,\pi$ 的角距离至少是 $cb$；中间因子把幅角改变至多 $b\lvert\operatorname{Im} z\rvert$，取 $a_0<c$ 就不出上半平面；最后的因子再把圆盘坐标缩 $e^{-b/2}$。这些映射在紧集上都没有极点。

## §3 钉子与暴露：把回归概率变成首中核

交换图给了两件有限维工具。一件是把"返回概率"变成某个 Markov 首中核的一阶矩，另一件是在插入合适单槽矩阵后得到零自由的迹。这一节把两件工具都搭起来，重点是第一件的条件化。

我把"钉子"定义为一个指定的槽-时间点，要求它有上颜色。对一个有限确定钉子集 $E$，令 $n_E$ 为避开 $E$ 的环数，$\mathcal B_E$ 为这些环的并，定义倾斜律
$\mathcal Z_E=\mathbb E_{\rm b}2^{n_E}$，$\mathbb P_E(d\omega)=\mathcal Z_E^{-1}2^{n_E(\omega)}\mathbb P_{\rm b}(d\omega)$。
碰到钉子的环是上色，其余环独立公平着色。给定一个与 $E$ 不交的非空单时刻集 $T$，令 $P=E\cup T$，让 $\sigma$ 把每个钉子映到其有向环上**下一个**钉子，经过严格正的时间。于是定义
$r(E,T)=\frac1{\lvert T\rvert}\sum_{i\in T}\mathbb P_P\{\sigma(i)\in T\}$。
这里的同一个采样图在定义 $\sigma$ 时被重复使用，这一点后面理解条件化耦合很关键。

暴露这一步是整套论证的技术核心。把时间零点的线打上标签，把所有不碰 $P$ 的环上的标签、它们在一个周期内的轨迹、以及所有端点像都揭示出来；轨迹记录每次基本操作前后的位置，包括同一时刻有序束的中间阶段。这些数据记作 $\mathbf a$。没被暴露标签占据的槽叫"洞"。给定一次暴露，在洞上定义一个全新的律 $\mathbb Q_{\mathbf a}$：两端都是洞的交换保留原来的独立 Poisson 钟；在一个交换把一个暴露标签与一个洞互换时，那个洞被搬到空出的槽，这些强制搬运是相邻洞层之间的确定性双射；一个部分揭示的均匀置换用剩余源槽与目标槽之间的均匀双射补齐；一个指定的确定置换限制到洞层之间的确定双射；碰到暴露标签的 Bernoulli 对换结果被揭示，只碰洞的对换保留独立 Bernoulli 律。令 $G_P$ 表示这个新图的每个环都碰 $P$ 的事件。

有限钉子输入我整条搬来，因为后面每一步都在用它。对上述有限图：(i) 对每个有限 $E$ 与不交的非空单时刻 $T$，有 $\mathbb P_E(T\subseteq\mathcal B_E)\le(2r(E,T))^{\lvert T\rvert}$；(ii) 在 $\mathbb P_P$ 下几乎必然 $g_P(\mathbf a):=\mathbb Q_{\mathbf a}(G_P)>0$，且剩余图的条件律是 $\mathbb Q_{\mathbf a}(\,\cdot\mid G_P)$；(iii) 若 $\omega_{\rm m}$ 是 Poisson 标记计数测度、$\lambda_{\rm b}$ 是边速率乘 Lebesgue 时间测度，则对每个整数 $j\ge1$ 与非负可测的 $j$ 个标记位置的函数 $F$，有 $\mathbb E_E\sum_{(u_1,\dots,u_j)\in\omega_{\rm m,\ne}^j}F(u_1,\dots,u_j)\le2^j\int F\,\mathrm d\lambda_{\rm b}^{\otimes j}$。

证明值得复述，因为它的每一块后面都会被引用。对 (i)，在所有钉子时刻与零点切开，令 $\mathcal V$ 是这些切割处槽层的无交并；相邻切割之间的映射是独立的容许双射，它们在不交输入、输出变量里的符号相乘给出稳定多项式 $\mathbb E_{\rm b}\prod_{i\in\mathcal V}(x_i+y_{\pi(i)})$。删去一个非钉子 $q$ 的办法是令 $x_q=y_q=t$ 并取 $t$ 的系数：若其前驱与后继为 $i,j$，则 $(x_i+t)(t+y_j)$ 被换成 $x_i+y_j$；若 $q$ 是不动点则贡献 $2t$，多出一个因子二。逐步删去就得到非零稳定多项式 $\mathbb E_{\rm b}[2^{n_P}\prod_{i\in P}(x_i+y_{\sigma(i)})]$。再对 $P\setminus T$ 中的输入变量求导、令所有输入变量为零、除以 $\mathcal Z_P$，结果恰是 $\mathbb E_P\prod_{i\in T}y_{\sigma(i)}$，即 $\sigma(T)$ 这个子集的稳定生成多项式。用负相关与算术几何平均，得 $\mathbb P_P\{\sigma(T)=T\}\le\prod_{j\in T}\mathbb P_P\{j\in\sigma(T)\}\le r(E,T)^{\lvert T\rvert}$，而 $\sigma(T)=T$ 正是 $T\subseteq\mathcal B_E$。

对 (ii)，先固定一个拟暴露标签集 $A$。在每条边上用两族独立 Poisson 钟，各取原速率：当端点含 $A$-标签时接受第一族，否则接受第二族，就实现了原过程。给定过去，叠加钟的总速率是原来的两倍，每条边按原来的相对速率被接受，拒绝概率为 $1/2$。$A$-标签的路径只用第一族；给定这些路径，限制到洞区间上的第二族仍然新鲜。揭示 $A$-标签在均匀置换下的像，留下的是均匀残差双射。对 Bernoulli 对换，只有当涉及暴露标签时才揭示其结果，其余结果保持独立。这样构造出 $\mathbb Q_{\mathbf a}$。更明确地，令 $\mu_A$ 是拟标签路径与端点像的基础律，$F_A$ 表示这些路径避开 $P$ 并闭合到 $A$，$c_A$ 在 $F_A$ 上数它们的环数，则对暴露与剩余图的每个有界可测函数 $\Phi$，
$\mathbb E_P\Phi=\mathcal Z_P^{-1}\sum_A\int_{F_A}2^{c_A(\mathbf a)}\mathbb E_{\mathbb Q_{\mathbf a}}[\mathbf1_{G_P}\Phi]\,\mu_A(d\mathbf a)$。
每个完整图恰好出现在一个分支里，即它在不碰 $P$ 的环上的标签集；于是暴露边缘律是 $\mathcal Z_P^{-1}2^{c_A}g_P\mu_A$ 限制到 $F_A$，它给 $g_P=0$ 的集零质量，除以 $g_P$ 即得 (ii)。一个容易被忽略的点：暴露边缘律里含全部命中概率 $g_P$，它并不等于拟历史的无权律。

对 (iii)，插入一个对换至多把避开固定钉子的环数增加一，于是把权重至多乘二，与其他瞬时操作无关；对 $j$ 个有序不同标记用 Poisson 插入公式，再除以 $\mathcal Z_E$，就得到那条阶乘控制。独立的新鲜钟保留它们自己的、不翻倍的阶乘测度。

第二条工具是把条件首中核写成行列式。这一步我起初以为只是记号方便，后来才发现它是把"环依赖"换成"新鲜转移"的唯一桥梁。设 $\Pi$ 在一个有限集 $\mathcal V=I\sqcup D$ 上有容许置换律，$K=\mathbb E\Pi$，$G_I$ 是每个环都碰 $I$ 的事件；在 $G_I$ 上令 $\Sigma$ 是把每个钉子映到其下一个正访问 $I$ 的置换矩阵。则 $\Pr(G_I)=\det(I_D-K_{DD})$；对 $I$ 上每个复矩阵 $W$ 有多项式恒等式
$\mathbb E[\mathbf1_{G_I}\det(I_I-W\Sigma)]=\det\begin{pmatrix}I_I-WK_{II}&-WK_{ID}\\-K_{DI}&I_D-K_{DD}\end{pmatrix}$；
若 $\Pr(G_I)>0$ 且 $I\ne\varnothing$，则 $K_{DD}$ 是瞬态的，且
$\mathbb E[\Sigma\mid G_I]=K_{II}+K_{ID}(I_D-K_{DD})^{-1}K_{DI}$。
证明用外幂：对 $0\le k\le\lvert\mathcal V\rvert$ 有 $\mathbb E\bigwedge^k\Pi=\bigwedge^kK$，因为对一个对换 $T_{ij}$，$T_{ij}-I=-(e_i-e_j)(e_i-e_j)^*$ 秩一，$I+u(T_{ij}-I)$ 的每个子式对 $u$ 仿射，其外幂就是概率为 $u$ 的 Bernoulli 对换的平均外幂；独立性与外幂的可乘性把恒等式推广到乘积，子式的连续性把它推广到极限。再对固定矩阵 $B$ 用主子式展开，得 $\mathbb E\det(I-B\Pi)=\det(I-BK)$；取 $B=\operatorname{diag}(W,I_D)$，若某个环落在 $D$ 内，它的指示向量是 $B\Pi$ 的不动向量，行列式为零，否则 $\Pi_{DD}$ 幂零，逐块消去给出 $\det(I-B\Pi)=\det(I_I-W\Sigma)$。令 $W=0$ 得首式，无需任何可逆性。当行列式为正时取 Schur 补，把 $W$ 换成 $tW$ 比较线性系数，由 $\det(I-tWA)=1-t\operatorname{Tr}(WA)+O(t^2)$ 与 $W$ 的任意性恢复每个矩阵元；$K_{DD}$ 非负次随机，谱半径至多一，若为一则 $I_D-K_{DD}$ 奇异，故 $(I_D-K_{DD})^{-1}=\sum_{n\ge0}K_{DD}^n$，而 $K_{II}$ 是直接命中、$K_{ID}K_{DD}^nK_{DI}$ 是经过 $n+1$ 个中间态后的命中。

把这条引理用在一次固定暴露上，就得到洞游走：在所有钉子时刻与洞集有限次变化处切开，把等基数的洞层等同起来，未条件化的区间映射是独立的容许双射，它们的直和再复合层间的循环移位仍是层集上的容许置换；它的均值矩阵给出洞游走的转移：原边速率（物理边为 $1/2$）、指定的确定限制与强制搬运、每个指定均匀操作（含接缝）处的新鲜残差均匀选择、以及只碰洞的新鲜 Bernoulli 结果。若 $\tau_T^+$ 是首个正访问 $T$、$\tau_E$ 是首个访问 $E$，则
$\lvert T\rvert r(E,T)=\mathbb E_P\sum_{i\in T}\Pr^{\rm walk}_{\mathbf a,i}(\tau_T^+<\tau_E)$。
这是一个**条件**一阶矩的恒等式：原来的重复置换路径仍带环依赖，是行列式恒等式把它们的下一个钉子均值换成了新鲜 Markov 转移。

## §4 稀疏钉子：环面上没有固定边界

同伴工作里那套钉子论证，是在带固定边界的盒子上做的：边界上钉满，回归就必须越过边界，于是可以直接数。环面上没有边界可用，这是我在这一节真正卡住的地方。我的解决办法是让一个小均匀场来提供"杀死"：场把向上分量压低，等价于在每个槽上以概率 $q$ 放一个钉子，从而把环的权重从 $2^{c}$ 变成 $2^{n_E}$。

把坐标旋转到场上色朝上。若 $q\in(0,1)$、$w=1-q=e^{-b}$，单个槽的因子去掉标量后是 $\operatorname{diag}(1,w)=wI+qP_{\mathrm{up}}$。于是我可以对每个实槽在切割处独立地以概率 $q$ 选一个钉子，然后把交换图按 $2^{c}$ 加权，其中 $c$ 数的是避开所有钉子的环。钉住的环取上色，其余环独立公平着色；展开这个因子就证明得到的自旋律正是指数为 $H_0+b\sum_xY_x$ 的 Gibbs 律（旋转回 $Y$ 轴）。

为了做归纳，我需要一个**固定**的钉子集，而软钉子是随机的。这里用"鬼槽"把随机钉子转成固定钉子：给每个实槽加一个静止鬼槽，在时间 $\beta/2$ 把它钉住，并在接缝之后立即让每个实槽以概率 $q$ 与它的鬼槽对换。时间零点层取在这些开关之后。被选中的开关把对应的鬼线插进实环，那个环就含一个鬼钉；没被选中的鬼仍是一个独立的钉住环，权重为一。于是每个开关配置的权重恰好等于对应软钉配置的权重，这个等价在有任意有限个实槽确定钉子时仍成立。

令 $E$ 表示全部鬼钉加上任意有限实槽钉子，$\mathbb P_E$ 是密度正比于 $2^{c_E}$ 的归一化图律，$\mathcal B_E$ 是避开 $E$ 的环上的槽-时间点。取 $\alpha=1/100$ 与足够大的 $C_s\ge6$，一个有限实槽点集叫**稀疏**，若其按重数计的格点坐标满足 $\#\{i:x_i\in B_h(z)\}\le C_s(1+h)^\alpha$ 对一切 $z\in\Lambda_L$、$h\ge0$ 成立。同一格点上不同槽分开计数，$C_s$ 可以取得很大，正是为了容纳后面空间比较里那些成簇的测试点。

稀疏钉子界的陈述是：固定 $S$ 与 $C_s$，存在 $\beta_0<\infty$，使得对每个固定 $\beta\ge\beta_0$ 存在 $L_*(\beta)$，只要 $L\ge L_*(\beta)$ 为偶数、$q$ 满足 $L^{-5/2}\le q<1$、$E$ 是上述钉子集、$T$ 是某一确定时刻的稀疏实槽点集，就有 $\mathbb P_E(T\subseteq\mathcal B_E)\le p^{\lvert T\rvert}$，其中 $p=\beta^{-9/10}$。常数与阈值不依赖额外钉子的数目、位置与时间。

证明是对确定钉子的有限向下归纳。若 $T$ 空则显然；若 $T$ 与 $E$ 相交则事件不可能。于是只考虑非空且 $T\cap E=\varnothing$，令 $P=E\cup T$，在 $\mathbb P_P$ 下暴露避开 $P$ 的环，其余槽叫洞。归纳的假设（更大的钉子集）给出正规洞图；扩散与流能量估计随后让下一个钉子回归足够罕见，从而用第 §3 节的钉子不等式删掉测试钉子。

洞游走的核是 $U=wK$，其中 $K$ 双随机，由对称洞游走热核、强制搬运双射与接缝均匀补齐复合而成；每回合恰好穿过一个开关层，它的实到实均值是 $wI$，这就是 $U=wK$ 的来源。令 $Q=\tfrac12(U+U^*)$，则对每个 $y$ 有 $E_y=\langle y,(I-Q)y\rangle\ge q\lVert y\rVert_2^2$。这条不等式是整个下界里的"正性"来源：$Q$ 与恒等之差被 $q$ 从下方撑住，才使得后面配平方时能把线性项吸收掉。

几何输入是确定性的，我把它们原样搬来。$\Z^3$ 上的可用槽图在每个格点有 $0$ 到 $\ell$ 个槽，有限集之外全有 $\ell$ 个槽，相邻格点间的可用槽两两相连；没有可用槽的格点叫阻塞。把超距不超过八的阻塞点连起来，记 $\mathcal C(w)$ 为阻塞点 $w$ 的分量。取 $\nu=1/300$，所谓在 $z$ 处以半径 $A\ge A_0$ 正规，指每个球 $B_{M_*}(v)$（$v\in B_{11A}(z)$）含少于六个阻塞点，且每个 $w\notin B_{10A}(z)$ 满足 $\max_{v\in\mathcal C(w)}\lvert v-w\rvert_\infty\le(1+\lvert w-z\rvert_\infty)^\nu$。在这些假设下，对支在 $B_A(z)$ 上的非负 $v$ 有局部 Nash 不等式 $\lVert v\rVert_2^{10/3}\le C\mathcal D(v)\lVert v\rVert_1^{4/3}$，其中 $\mathcal D(v)=\tfrac12\sum_{\{i,j\}}(v_i-v_j)^2$；对每个可用槽 $a$ 存在有向边流 $F_a$，以出流减入流为散度，满足 $\operatorname{div} F_a=\mathbf1_{\{a\}}$ 与 $\lvert F_a(e)\rvert\le C(1+\operatorname{dist}(e,y))^{-k}$，$k=2-3\nu=199/100$。这两条是无限格点结果的精确陈述，其假设是确定性的，与时间尺度无关。

在给定暴露与物理时刻，对每个环面锚点 $z$ 造这样的图：把 $B_{\lfloor L/4\rfloor}(z)$ 里的实洞提升到 $\Z^3$，盒外每个槽都算可用。取 $A=\lceil C_{\mathrm{loc}}\beta\rceil$ 且 $11A+M_*<\lfloor L/4\rfloor$，则 $B_A(z)$ 上函数的 Nash 不等式用的正是环面边，支撑之外取零值。于是"阻塞"的概率、分量尾、以及正规性失败概率都能从 $\mathsf I(P)$ 推出来：六个指定格点同时被阻塞的概率至多 $Cp^6$，稀疏点集至多 $(C\sqrt p)^{\lvert A'\rvert}$，分量尾形如 $\mathbb P_P\{z\in\mathcal O_t,\max_{v\in\mathcal C_t(z)}d_L(z,v)\ge h\}\le Ce^{-ch^\lambda}$；正规性失败概率 $\Delta_A=CA^3p^6+C\exp(-cA^{\lambda\nu})$，一个暴露若不正规的时间总长不超过 $\beta/100$ 就叫好暴露，其失败概率至多 $100\Delta_A$。

在好暴露上，用 $B_A(z)$ 外杀死定位的单回合核，每个元素在两个方向上都至多 $C\beta^{-3/2}$。证明把局部质量 $v(u)$ 的二范数平方记作 $H(u)$，在光滑区间上有 $H'=-2\mathcal D_t(v)$，正规时刻由 Nash 不等式给出 $H'\le-cH^{5/3}$，非正规时刻与瞬时因子不让平方范数增加；由于每半回合至少有 $\beta/2-\beta/100$ 的正规时间，$(H^{-2/3})'\ge c'$，半回合输出二范数至多 $C\beta^{-3/4}$，再对两半用 Cauchy--Schwarz 得元素界。对偶方向用热因子的对称性、搬运的双射性与接缝补齐的均匀逆补齐同样成立。

剩下的是把多回合回归用能量不等式控制。稀疏源配对引理说：在固定切片上取稀疏列 $(z_i)_{i=1}^{m_T}$（允许重复），保留其中提升图以半径 $A$ 正规的那些，对每个保留成员取支在 $B_A(z_i)$ 实洞上、质量至多一的 $\mu_i\ge0$，则对切片上每个实向量 $Y'$ 有 $\lvert\langle\sum_i\mu_i,Y'\rangle\rvert\le(Cm_TA^\alpha)^{1/2}\sqrt{\mathcal D_t(Y')}+Cm_TL^{1/2-k}\lVert Y'\rVert_2$。证明把无限格点的单位流用锥形截断搬到环面：截断的散度是 $\mathbf1_{\{a\}}+\varepsilon_a$，其中 $\lVert\varepsilon_a\rVert_2\le CL^{1/2-k}$；两个源点相距 $h$ 时包络之积之和至多 $C(1+h)^{-(2k-3)}$，而 $2k-3=49/50>\alpha$，稀疏性与二进环带求和给出 $\lVert F\rVert_2^2\le Cm_TA^\alpha$。

有了这些，回归能量的推导就顺了。设 $m_T=\lvert T\rvert$，$\zeta=\mathbf1_T$；令 $F=1$ 在 $T$ 上，别处取鬼杀死游走最终击中 $T$ 的概率，$g=F-\zeta$。条件在暴露上，删掉其他实钉后把下一个钉子概率之和记为 $r(E,T)$，则钉子不等式给 $\mathbb P_E(T\subseteq\mathcal B_E)\le(2r(E,T))^{m_T}$，而调和性给 $\sum_{i\in T}(U^*F)_i=m_T-\langle F,(I-Q)F\rangle=\langle\zeta,Q\zeta\rangle+2\langle Q\zeta,g\rangle-E_g$；这里 $\langle\zeta,g\rangle=0$，且没有用到 $U$ 的可逆性。第一项由单回合扩散控制，$\mathbb E_P\langle\zeta,Q\zeta\rangle\le Cm_T(e^{-c\beta}+\Delta_A+A^\alpha\beta^{-3/2})$。线性项把一回合在方向 $d\in\{+,-\}$ 与经过时间 $u\in[\beta/3,2\beta/3]$ 处劈开，$U_d=B_d(u)C_d(u)$，$Y_d(u)=B_d(u)^*g$，后缀能量满足 $\int_I\mathcal D_{t_d(u)}(Y_d(u))\,\mathrm d u\le\tfrac12(\lVert g\rVert_2^2-\lVert U_d^*g\rVert_2^2)\le E_g$。用稀疏源配对与 $E_g\ge q\lVert g\rVert_2^2$ 配平方，最后得
$r(E,T)\le C\bigl(e^{-c\beta}+\Delta_A+A^\alpha\beta^{-3/2}+A^\alpha/\beta+m_TL^{1-2k}/q\bigr)$。
稀疏性给 $m_T\le CL^\alpha$，而 $q\ge L^{-5/2}$，末项至多 $CL^{\alpha+7/2-2k}=CL^{-47/100}$；其余项在 $A=\lceil C_{\mathrm{loc}}\beta\rceil$ 下是 $o(p)$，多项式阶分别为 $\beta^{-12/5}$、$\beta^{-149/100}$、$\beta^{-99/100}$。先取足够大的 $\beta_0$，再对每个 $\beta$ 取足够大的 $L_*(\beta)$ 使 $2r(E,T)\le p$，归纳完成。

这一节还直接给出正磁化。用指数场 $s>0$、$q(s)=1-e^{-s}$，在不加额外实钉的鬼图上，一个实槽向下的概率是其属于避开鬼钉环的概率的一半，于是单元素情形给向下概率至多 $p/2$。有限体积指数压力 $\mathcal P_L(s)=V^{-1}\log\operatorname{Tr}\exp(H_0+s\sum_xY_x)$ 的导数满足 $\mathcal P_L'(s)=V^{-1}\langle\sum_xY_x\rangle_s\ge S(1-p)$，对 $0<a<b$ 同时成立，积分后取体积极限、令 $a\downarrow0$、除以 $b$ 再令 $b\downarrow0$，得 $m_{S,\beta}\ge S(1-\beta^{-9/10})>0$。这条下界完全来自环面的稀疏钉子估计，不需要尖锐低温渐近。

## §5 弱场空间比较：横磁化率即孔洞预解式

稀疏钉子估计控制的是指定点上的缺失环。我要的是空间振荡磁化强度的界，于是把前者变成一个横磁化率的界。这一步有两块，彼此很不一样：先用一个精确的磁化率恒等式把横向平方写成洞上单粒子预解式，再证预解式在大矩形胞上近乎常数。

弱场空间估计的陈述是：固定 $S$，对所有足够大的 $\beta$ 存在 $C_\beta,R_0(\beta)<\infty$，使得只要 $L$ 偶、$R_0(\beta)\le R\le L$、把 $\Lambda_L$ 分成边长在 $[R/2,4R]$ 的矩形胞，且实函数 $f:\Lambda_L\to[-1,1]$ 在每个胞 $B$ 上满足 $\sum_{x\in B}f_x=0$，则对 $D_f=\sum_xf_xZ_x$、$q=R^{-5/2}$、$w=1-q=e^{-b}$，在指数为 $H_0+b\sum_xY_x$ 的 Gibbs 期望 $\langle\cdot\rangle_b$ 下有 $\frac qV\langle D_f^2\rangle_b\le C_\beta R^{-1/40}$。常数对分划、$f$ 与 $L$ 一致。

第一块从软钉表示出发。暴露所有避开软钉的环，$\mathbf a$ 是它们的轨迹，$A_0$ 是切割处的实槽，$\mathcal H$ 是补切割槽即洞。条件在 $\mathbf a$ 上，新鲜实洞运动由速率 $1/2$ 的跳、暴露跳处的强制搬运、以及每个格点内接缝置换的均匀补齐组成；它的一回合核（不杀死、不条件化）记作 $K$，用行前向约定，于是 $K$ 双随机。令 $D=I-wK$，则 $D^{-1}=\sum_{r\ge0}w^rK^r$ 存在且逐元素非负。

软钉恒等式给出：给定 $\mathbf a$，对 $i\ne j$ 有 $\mathbb P(i\text{ 被钉}\mid\mathbf a)=q(D^{-1})_{ii}$ 与 $\mathbb P(i,j\text{ 被钉且从 }i\text{ 的下一个钉是 }j\mid\mathbf a)=\frac{q^2}{w}(D^{-1})_{ij}$；并且 $\mathbb E\operatorname{Tr} D^{-1}\le N$。证明的关键是：在暴露分解里，拟暴露路径有固定环权与因子 $w^{\lvert A_0\rvert}$；对拟钉集 $P'\subseteq\mathcal H$，令 $Q=\mathcal H\setminus P'$，第 §3 节的下一个钉子引理说剩余环都碰 $P'$ 的概率是 $\det(I-K_{QQ})$，于是 $P'$ 的未归一化条件权是 $q^{\lvert P'\rvert}w^{\lvert\mathcal H\rvert-\lvert P'\rvert}\det(I-K_{QQ})$，对 $P'$ 求和得 $\det(I-wK)$；限制到含 $i$ 的集给 $q$ 乘 $D$ 的 $(i,i)$ 余子式。后继概率则用带边框行列式的 Schur 补与两两 Schur 补给出。迹的期望界来自另一个视角：条件在图与颜色上，每个上色切割槽以概率 $q$ 独立被钉，下色槽不可能被钉，钉子总数的期望至多 $qN$，而钉子永不落在 $A_0$。

横向恒等式是这一块的落点。把坐标转到场分量为 $s^3$、被测试分量为 $s^1$，归一化场矩阵 $\operatorname{diag}(1,w)$ 在每次插入周围对称劈开（允许，因为总场与 $H_0$ 交换）；在横向插入处其槽矩阵为 $\operatorname{diag}(1,\sqrt w)s^1\operatorname{diag}(1,\sqrt w)=\frac{\sqrt w}{2}\begin{pmatrix}0&1\\mathbf1&0\end{pmatrix}$。对 $i\ne j$ 展开其余槽的钉子，两次翻转为零除非落在同一环上；在该环上两次翻转之间的两条弧必有一条向下且不含其他钉子，于是加钉 $i,j$ 把每种允许着色等同于"从 $i$ 的下一个钉是 $j$"或反向事件之一，插入权与加钉权之比是 $w/(4q^2)$。结果是
$\langle D_f^2\rangle_b=\frac14\sum_if_i^2+\frac12\mathbb E\sum_{\substack{i,j\in\mathcal H\\i\ne j}}f_if_j(D^{-1})_{ij}$。
同槽恒等式 $(s^1)^2=I/4$ 给第一项，接缝投影保证槽和正是物理自旋可观测量。

第二块把这个预解式变成空间常值逼近。定义有界实向量 $u=qD^{-1}f_{\mathcal H}$ 与 $e_i=\sum_{j\in\mathcal H}K_{ij}(u_i-u_j)^2$。因为 $qD^{-1}$ 随机，$\lvert u_i\rvert\le1$；双随机性与 $Du=qf_{\mathcal H}$ 给遍历能量
$\frac12\sum_ie_i=\langle u,(I-K)u\rangle=\frac qw(\langle u,f_{\mathcal H}\rangle-\lVert u\rVert_2^2)\le CqN$。
这里同样没有用到 $K$ 的可逆性。洞缺失使得 $f_{\mathcal H}$ 不再精确地逐胞抵消，需要一条替代估计：对每个胞 $B$ 有 $\mathbb E\lvert\sum_{i\in\mathcal H,\,x_i\in B}f_i\rvert\le C\sqrt{\lvert B\rvert/q}$。证明回到原坐标，令 $T_B=\sum_{x\in B}f_xY_x$，其普通 Laplace 变换 $F_B(z)=\langle e^{zT_B}\rangle_b$ 在 $\lvert z\rvert<cb$ 上无零点（$Y$ 方向所有槽场在该带内取正实部，第 §2 节的零自由迹引理适用），取在 $0$ 处为零的对数；谱演算给 $\operatorname{Re}\log F_B(z)\le Cb\lvert B\rvert$，Borel--Carathéodory 不等式与 Cauchy 二阶导估计给 $\operatorname{Var}_b(T_B)\le C\lvert B\rvert/q$；平移不变性与逐胞零和给 $\langle T_B\rangle_b=0$，而颜色表示下条件期望 $\mathbb E(T_B\mid\mathbf a)=\frac12\sum_{i\in\mathcal H,x_i\in B}f_i$，条件 Jensen 与 Cauchy--Schwarz 收尾。

第三块记录洞之间的"通信"。只跟随切割到接缝的强制搬运，忽略新鲜跳，在每个格点选一个允许的残差接缝匹配，得到的线叫骨架线，给出 $\mathcal H$ 上的置换 $\phi$。在 $\mathcal H$ 上定义无向图 $\Gamma$：端点边连 $i$ 到残差接缝匹配下一切可能的终切割洞（含 $\phi(i)$）；接触边连 $i,j$，只要它们的骨架线在某段正长度区间内占据相邻格点且之间存在可用槽边。则端点边满足 $(u_i-u_j)^2\le C_\beta e_i$，由长度 $\tau\le1$ 的定位置区间见证的接触边满足 $(u_i-u_j)^2\le C_\beta\tau^{-1}(e_i+e_j)$；$K$ 在每个连通分量上封闭，且 $\mathbb E\#\{\Gamma\text{ 的分量}\}\le qN$。最后一条用迹：每个分量的随机块有特征值 $1$，其贡献至少 $1/q$，与 $\mathbb E\operatorname{Tr} D^{-1}\le N$ 合起来即得。

有了通信图，就把"洞在坏盒之间被困住"这件事局部化。取 $d=\lceil C_0\beta\rceil$，把每条坐标圆分成 $[d,2d]$ 的整数区间，其乘积盒由三维坐标环面索引；粗距离指盒索引的超距。一个盒叫坏，若它的 $10d$ 邻域内有 $M$-球含至少六个阻塞点，或从该邻域出发有一段 $j_*=\lfloor d/20\rfloor$ 步、由不同真实标记按时间序或逆序提供的路径，或在 $15d$ 邻域的边上有落在 $0$ 或 $\beta$ 的 $\delta$ 内的标记、或两个相距小于 $\delta$ 的标记（短时旗标）。坏盒尾估计给 $\mathbb P\{z\text{ 坏且其坏分量到 }z\text{ 的距离达到 }h\}\le Ce^{-ch^{\lambda_1}}$，且指定盒有短时旗标的概率至多 $C_\beta\delta$。证明用阶乘控制数标记与有序路径，$j_*$ 步路径的期望数目至多 $(C\beta)^{j_*}/j_*!$，配合稀疏性与二进递归把坏分量尾压成拉伸指数。

随后是确定性外壳构造与比较函数。对有限阻塞集，把超距不超过八的点连起来，对每个分量 $C$ 加厚成 $A_C=\{z:\operatorname{dist}(z,C)\le4\}$，把 $\Z^3\setminus A_C$ 的有限最近邻分量填实，得到外壳 $H_C$，它含在 $A_C$ 的坐标包围盒内；外壳两两不交或嵌套，极大的两两不交，其外部顶点边界由非阻塞顶点组成，并在该包围盒的单位膨胀内由非阻塞路径相连。对每个极大外壳选一个外部边界代表 $r_H$，令 $\rho(z)=r_H$ 于 $H$ 上、其余不动，只用一次。于是对每个可用胞 $B$ 在提升格点上定义比较函数 $U_B(x)=u_{i(\rho(z_x))}$，其中 $z_x$ 是含 $x$ 的粗盒，$\lvert U_B\rvert\le1$，即使某些格点没有洞它也是全格点上的函数。比较引理说：存在 $C_\beta$，对每个可用 $B$，胞内相邻 $x,x'$ 有
$\lvert U_B(x)-U_B(x')\rvert^2\le C_\beta n^6\delta^{-1}\sum_{\substack{i\in\mathcal H\\\operatorname{dist}(x_i,x)\le C_\beta n}}e_i$；
对 $x\in B$ 上方的切割洞 $j$，同样的右端控制 $\lvert u_j-U_B(x)\rvert^2$，除非 $z_x$ 的 $100n$ 粗距离内有短时旗标，或 $j$ 的 $\Gamma$-分量至多 $C_\beta n^3$ 个顶点。证明把外壳路径上的粗边换成洞路径，得至多 $C_\beta n^3$ 条 $\Gamma$ 边、每条以 $\tau=\delta$ 满足接触代价，望远镜求和与 Cauchy--Schwarz 给出 $C_\beta n^6\delta^{-1}$ 因子。

最后把三份贡献相加。取 $c_B=\lvert B\rvert^{-1}\sum_{x\in B}U_B(x)$（不可用胞取 $c_B=0$），矩形格点 Poincaré 不等式（常数至多 $CR^2$）把胞内梯度换成能量，配合遍历能量给出 $\mathbb E\sum_B\sum_{i\in\mathcal H,x_i\in B}(u_i-c_B)^2\le C_\beta NR^{-1/20}$。证明里取 $\delta=R^{-1/8}$、$n=\lceil R^{1/200}\rceil$，误差三项分别是 $O(R^{-33/100})$、$O(R^{-11/100})$、$O(R^{-497/200})$，第四项比任何负幂都小。把它与洞抵消估计、$\lvert c_B\rvert\le1$ 合起来，得 $\mathbb E\lvert\langle f_{\mathcal H},u\rangle\rvert\le C_\beta NR^{-1/40}+CV(qR^3)^{-1/2}$，代入横向恒等式并丢掉非负的对角项，就有 $\frac qV\langle D_f^2\rangle_b\le C_\beta(q+R^{-1/40}+R^{-1/4})$，即所求。稀疏钉子估计的前提在这里自动满足，因为 $q=R^{-5/2}\ge L^{-5/2}$。

## §6 零场复条带：从二阶矩到指数矩

弱场空间估计控制的是小正场下的普通横向平方。要把它用到大范围测试上，我得先把它变成一个零场的指数矩界。这条界对单个测试很弱，但对足够多的测试一致成立，足以比较一个胞与它孩子的磁化均值。整个这一节里 $\beta$ 固定且足够大。

解析步骤用一条条带曲率引理，它的正性是本质的：原点处的小曲率随后能控制一个长度随空间尺度对数增长的实区间上的曲率。设 $F$ 在 $\{z:\lvert\operatorname{Im} z\rvert<a_0\}$ 上全纯、在实轴上实且偶、$F(0)=0$，并存在 $K<\infty$ 使 $0\le F(x)\le K\lvert x\rvert$ 与 $\operatorname{Re} F(x+iy)\le F(x)$ 对一切 $x\in\R$、$\lvert y\rvert<a_0$ 成立。则对每个 $a\in(0,a_0)$ 存在严格正的 Schwartz 函数 $J_a$，使得以 $g_a(x)=F(x)-\operatorname{Re} F(x+ia)$ 记，有
$F''=J_a*g_a$，$J_a=\frac2{a^2}(h_a*h_a)$，$h_a(x)=\frac{\pi}{2a}\operatorname{sech}^2\bigl(\frac{\pi x}a\bigr)$；
特别地，$c_a=2\pi/a$ 时 $0\le F''(x)\le e^{c_a\lvert x\rvert}F''(0)$ 与 $F(x)\le\frac{F''(0)}{c_a^2}(e^{c_a\lvert x\rvert}-1-c_a\lvert x\rvert)$。

证明的骨架值得记下。令 $u(x,y)=\operatorname{Re} F(x+iy)$，Schwarz 反射使 $u$ 关于 $y$ 偶。先在无界水平方向为 Fourier 变换找依据：对固定的 $a'<a_0$，在每个竖段周围取严格在条带内的定宽高矩形，调和函数 $M_x-u$（$M_x=C(1+\lvert x\rvert)$）在其上为正，由 Harnack 不等式与内部导数估计得 $\lvert u(x,y)\rvert+\lvert\partial_x^j\partial_y^ku(x,y)\rvert\le C_{a',j,k}(1+\lvert x\rvert)$，于是 $u(\cdot,y)$ 与其所需各阶导数都是缓增分布且光滑依赖 $y$。调和方程在频率上成为 $\partial_y^2\widehat u=\xi^2\widehat u$；这条方程只在频率上**局部**求解（乘紧支光滑函数），再乘基本矩阵合法，因为 $\xi$ 留在紧集里，绝不把任意缓增分布整体乘上指数增长的 $\cosh(a\xi)$。由初值 $\widehat u(\xi,0)=\widehat F(\xi)$、$\partial_y\widehat u(\xi,0)=0$ 得 $\widehat u(\xi,a)=\cosh(a\xi)\widehat F(\xi)$。令 $m_a(\xi)=\frac{\xi^2}{\cosh(a\xi)-1}$（$m_a(0)=2/a^2$）为 Schwartz 函数，则 $m_a\widehat g_a=-\xi^2\widehat F$；用代换 $r=e^{2\pi x/a}$ 与 beta 积分算出 $\widehat h_a(\xi)=\int_0^\infty\frac{r^{-ia\xi/(2\pi)}}{(1+r)^2}\,\mathrm d r=\frac{a\xi/2}{\sinh(a\xi/2)}$，故 $m_a=(2/a^2)\widehat h_a^2$，卷积是通常的收敛积分，分布恒等式遂逐点成立。又 $\lvert h_a'\rvert\le c_ah_a$ 给出 $\lvert J_a'\rvert\le c_aJ_a$，于是 $J_a(x-t)\le e^{c_a\lvert x\rvert}J_a(-t)$；由 $g_a\ge0$ 积分得第一条，再用 $F(0)=F'(0)=0$ 与偶性积分两次得第二条。

把这条引理用到零场指数矩上。命题是：固定 $S$ 与足够大的有限 $\beta$，存在 $R_0=R_0(S,\beta)$、$C_\beta<\infty$、$\kappa>0$，使得只要 $L\ge R\ge R_0$、$L$ 偶、把 $\Lambda_L$ 分成边长在 $[R/2,4R]$ 的矩形胞、$f:\Lambda_L\to[-1,1]$ 在每个胞上零和，则对 $q=R^{-5/2}$、$b=-\log(1-q)$ 与任意自旋分量 $a$ 有
$\log\langle\exp(bx\sum_{z\in\Lambda_L}f_zS_z^a)\rangle\le C_\beta bV$，$x\in\R$，$\lvert x\rvert\le\kappa\log R$；
从而存在 $A_\beta,c>0$ 使 $D_f=\sum_zf_zS_z^a$ 在零场态中的谱测度满足 $\mathbb P\{\lvert D_f\rvert>\frac{A_\beta V}{\log R}\}\le2e^{-cbV}$。所有界对所述分划与测试一致。

证明先取 $a=3$ 并把场放在 $Y$ 方向，写 $D_f=\sum_zf_zZ_z$ 与 $F(z)=\frac1{bV}\log\langle e^{bzD_f}\rangle_b$。因为 $[H_0,M_L^2]=0$，迹的循环性给
$\langle e^{bzD_f}\rangle_b=\frac{\operatorname{Tr}_{\rm phys}(e^{H_0}e^{bM_L^2/2}e^{bzD_f}e^{bM_L^2/2})}{\operatorname{Tr}_{\rm phys}e^{H_0+bM_L^2}}$，
中间三个因子是单槽夹心矩阵张量积的限制；对 $e^{bs^2/2}e^{bzf_zs^3}e^{bs^2/2}$ 用第 §2 节的单槽映射引理，再用零自由迹引理，即知对数里的表达式在固定条带 $\lvert\operatorname{Im} z\rvert<a_0$ 上无零点（取 $R_0$ 足够大使 $b\le b_*$）。取在实轴上实、在零处为零的解析对数。这里 $F$ 是普通 Laplace 变换的对数：$D_f$ 在倾斜 Gibbs 态里的谱测度是概率测度，即使 $D_f$ 不必与其密度矩阵交换；绕场轴旋转 $\pi$ 使该测度偶，于是 $F$ 偶、$F(x)\ge0$，且由 $\lVert D_f\rVert\le SV$ 得 $\operatorname{Re} F(x+iy)\le F(x)\le S\lvert x\rvert$。特别地 $F''(0)=\frac bV\operatorname{Var}_b(D_f)=\frac bV\langle D_f^2\rangle_b\le C_\beta R^{-\eta}$，其中 $\eta=1/40$，来自第 §5 节的弱场估计，且大 $R$ 时 $b/q\le2$。这个导数是普通方差，并非把扰动塞进指数里的 Duhamel 协方差。取 $a\in(0,a_0)$ 与满足 $c_a\kappa<\eta/2$ 的 $\kappa>0$，曲率增长不等式给 $0\le F(x)\le C_\beta R^{-\eta/2}$ 对 $\lvert x\rvert\le\kappa\log R$ 一致成立。撤场时令 $\gamma_0,\gamma_b$ 为零场与倾斜的归一化密度矩阵，因 $H_0$ 与 $M_L^2$ 交换且 $\lVert M_L^2\rVert\le SV$ 有 $\gamma_0\le e^{2bSV}\gamma_b$，对正算子 $e^{bxD_f}$ 取迹至多在熵里多付 $2bSV$，得 $a=3$ 的指数界；$\gamma_0$ 的旋转不变性给所有公共轴；最后在 $x=\pm\kappa\log R$ 用指数 Markov，取 $\kappa A_\beta>C_\beta+c$ 得尾界。

接着把弱指数界用到嵌套分划上，得到尺度比较。对矩形胞 $C$ 与轴 $a$ 记 $\overline S_C^a=\lvert C\rvert^{-1}\sum_{x\in C}S_x^a$；同一固定轴的均值彼此交换。命题是：固定 $S$ 与足够大的有限 $\beta$，对每个足够大的固定 $R_*$ 与所有足够大的偶 $L$，存在确定矩形分划 $\mathcal P_*(L)$，边长在 $[R_*/2,4R_*^{10/9}]$ 内，且对 $a=1,2,3$ 有
$\frac1V\sum_{C\in\mathcal P_*(L)}\lvert C\rvert\langle(\overline S_C^a)^2\rangle\le\langle(M_L^a/V)^2\rangle+\frac{C_\beta}{\log R_*}+o_L(1)$。
证明取 $R_0=L$、$R_{j+1}=R_j^{9/10}$，停在最大的满足 $R_n\ge R_*$ 的 $n$，从单胞分划出发造嵌套矩形分划 $\mathcal P_j$，胞边长在 $[R_j/2,4R_j]$ 内（把父胞的每个坐标区间细分成几乎等长、长度可比 $R_{j+1}$ 的整数区间）。固定一个轴做同时的格点自旋测量，$D(C)$ 是 $\overline S_C^a$ 的测量值；对一次细分令 $R=R_j$、$r=R_{j+1}$ 与
$T_j=\frac1V\sum_{B\in\mathcal P_j}\sum_{C\subset B}\lvert C\rvert\lvert D(C)-D(B)\rvert$。
为把 $T_j$ 表成第 §6 节测试的形式，给每个孩子配符号 $\sigma_C\in\{-1,1\}$，令 $\bar\sigma_B=\lvert B\rvert^{-1}\sum_{C\subset B}\lvert C\rvert\sigma_C$ 与 $f_x=\frac{\sigma_C-\bar\sigma_B}2$（$x\in C\subset B$），则 $\lvert f_x\rvert\le1$、$\sum_{x\in B}f_x=0$，直接展开给 $\sum_xf_xS_x^a=\frac12\sum_{B,C\subset B}\lvert C\rvert\sigma_C(D(C)-D(B))$，对符号取最大即得 $VT_j/2$。符号选择至多 $\exp(CV/r^3)$ 种（每个孩子体积至少 $(r/2)^3$），对每个测试用尾界再取并集界，得 $\mathbb P\{T_j>2A_\beta/\log R\}\le2\exp(CVR^{-27/10}-cbV)\le2\exp(-c'VR^{-5/2})$（大 $R_*$ 后一致成立，因 $b\ge R^{-5/2}$ 而 $R^{-27/10}=o(R^{-5/2})$）。又因 $\lvert D(C)-D(B)\rvert\le2S$，期望加权平方增量满足
$\mathbb E[\frac1V\sum_{B,C\subset B}\lvert C\rvert(D(C)-D(B))^2]\le\frac{C_\beta}{\log R_j}+C\exp(-c'VR_j^{-5/2})$，
而平方精确望远镜：$\sum_{C\in\mathcal P_{j+1}}\lvert C\rvert D(C)^2-\sum_{B\in\mathcal P_j}\lvert B\rvert D(B)^2=\sum_{B,C\subset B}\lvert C\rvert(D(C)-D(B))^2$。最后 $\sum_{j<n}(\log R_j)^{-1}\le C/\log R_*$，$VR_j^{-5/2}\ge L^{1/2}$，$n=O(\log\log L)$，求和即得尺度比较，确定构造对三个轴同时成立。

## §7 平衡态、平均熵与遍历分解

空间估计还有一个用处：在压力切线上抹掉独立副本之间的某些耦合。为了把这步讲清楚，得先把变分框架与所需的极限次序摆正。底格点现在是 $\Z^3$，每个格点带自旋 $S$ 的矩阵代数。一个态是有限集上密度矩阵的相容族，等价地是局部矩阵代数范数闭包上的正归一泛函；局部收敛指在每个局部可观测量上收敛。$\mathcal S_{\rm TI}$ 是平移不变态的紧凸集，$\tau_x$ 是平移 $x$。

对密度矩阵 $\rho$ 记 $\mathsf S(\rho)=-\operatorname{Tr}(\rho\log\rho)$；若 $Q_n=\{0,\dots,n-1\}^3$、$\omega\in\mathcal S_{\rm TI}$，其平均熵与未扰相互作用期望为 $\mathfrak s(\omega)=\lim_n\frac{\mathsf S(\omega_{Q_n})}{\lvert Q_n\rvert}$ 与 $e_0(\omega)=\beta\sum_{r=1}^3\omega(\mathbf S_0\cdot\mathbf S_{e_r})$。对自伴局部可观测量 $a$，令 $A_L=\sum_{x\in\Lambda_L}\tau_x(a)$（对 $L$ 大于其支撑时按周期理解），并设 $P_a(t)=\lim_L\frac1V\log\operatorname{Tr} e^{H_0+tA_L}$，$t\in\R$，极限取偶 $L$。有限程与有界性使自由与周期边界条件对这个极限等价，因为两者指数之差范数为 $O(L^2)$。

变分原理我原样复述，并给出证明，以指明后面取切线的态空间。$P_a(t)=\max_{\omega\in\mathcal S_{\rm TI}}\{\mathfrak s(\omega)+e_0(\omega)+t\omega(a)\}$；特别地，记 $P_0=\beta p_{S,\beta}(0)$，则 $\mathcal E_\beta=\{\omega\in\mathcal S_{\rm TI}:\mathfrak s(\omega)+e_0(\omega)=P_0\}$ 是 $\mathcal S_{\rm TI}$ 的非空紧面，周期零场 Gibbs 态的每个局部极限都属于 $\mathcal E_\beta$，且 $P_a'(0+)=\max_{\omega\in\mathcal E_\beta}\omega(a)$。$\mathcal E_\beta$ 的极点正是它在 $\mathcal S_{\rm TI}$ 中为极点的那些态，我叫它们遍历态。证明里，用 $Q_n$ 的平移铺满大立方并留一个相对体积消失的余项，熵的次可加性与 $\mathsf S(\rho_B)\le\lvert B\rvert\log(2S+1)$ 给 $\mathfrak s(\omega)=\inf_n\frac{\mathsf S(\omega_{Q_n})}{\lvert Q_n\rvert}$，从而存在且上半连续；混合的熵夹在 $\lambda\mathsf S(\rho_1)+(1-\lambda)\mathsf S(\rho_2)$ 与它加上二元熵之间，除以体积得 $\mathfrak s$ 仿射。对任意 $\omega$ 在大立方上限制用有限维 Gibbs 变分原理，边界项范数 $o(V)$，得 $P_a(t)\ge\mathfrak s(\omega)+e_0(\omega)+t\omega(a)$；反过来取 $H_0+tA_L$ 的周期 Gibbs 态的局部收敛子列，其极限平移不变且局部相互作用期望收敛，用固定立方 $Q_n$ 铺大立方得 $\limsup_L\frac{\mathsf S(\gamma_{L,t})}V\le\frac{\mathsf S(\omega_{Q_n})}{\lvert Q_n\rvert}$，令 $n\to\infty$ 并用有限体积 Gibbs 恒等式得反向不等式。$t=0$ 时同一论证还给出关于每个周期 Gibbs 局部极限的断言；紧性、上半连续与仿射性给出 $\mathcal E_\beta$ 是非空紧面，关于极点的断言由面的定义得到。取 $t>0$ 时 $\eqref{eq:variational-pressure}$ 的最大化元 $\omega_t$ 满足 $\max_{\omega\in\mathcal E_\beta}\omega(a)\le\frac{P_a(t)-P_0}t\le\omega_t(a)$，$t\downarrow0$ 时上半连续性表明 $\omega_t$ 的每个局部极限属于 $\mathcal E_\beta$（其未扰变分值趋于 $P_0$，因 $\lvert\omega_t(a)\rvert\le\lVert a\rVert$），取收敛子列得切线公式。

在 $Y$ 方向，指数归一化压力是 $\beta p_{S,\beta}(b/\beta)$，于是 $m=\max_{\omega\in\mathcal E_\beta}\omega(Y_0)$；旋转不变性给每个单位方向同样的最大值，因而向量 $\mathbf m(\omega)=(\omega(X_0),\omega(Y_0),\omega(Z_0))$ 对每个 $\omega\in\mathcal E_\beta$ 长度至多 $m$，且最大化 $\omega(Y_0)$ 的面上有极点，故存在达到 $m$ 的遍历平衡态。第 §8 节将证明每个遍历平衡态都有这同一个磁化长度。极值性还给出一个平均遍历推论（对渐近交换的格点平移是标准的）：若 $\omega$ 是极值平移不变态、$A$ 是自伴局部可观测量，则 $\lim_n\omega[(\frac1{\lvert Q_n\rvert}\sum_{x\in Q_n}\tau_x(A)-\omega(A)\mathbf1)^2]=0$。证明把 $A$ 平移缩放成 $0\le A\le\mathbf1$，在态所在 Hilbert 空间里平移是交换酉算子，平均遍历定理使 $\bar A_n\Omega$ 收敛到 $\eta$；对局部 $C\ge0$ 由局部性 $\lVert[C^{1/2},\bar A_n]\rVert\to0$ 得 $\lambda(C)=\lim_n\omega(C\bar A_n)$ 存在、$0\le\lambda(C)\le\omega(C)$、$\lambda(\mathbf1)=\omega(A)$；极值性给 $\lambda=\omega(A)\omega$，否则 $\omega=\lambda+(\omega-\lambda)$ 会给出非平凡的平移不变凸分解；在局部向量稠密集上测试得 $\eta=\omega(A)\Omega$。

最后是副本交叉项。取 $j$ 份自旋系统，上标 $[r]$ 记副本，未扰指数是 $\sum_{r=1}^jH_0^{[r]}$，其压力是 $jP_0$。这个相互作用的每个平移不变平衡态，其每个边缘都在 $\mathcal E_\beta$ 中：副本之间的熵次可加性把它的变分值界成各边缘变分值之和，各至多 $P_0$，总和相等迫使每个边缘相等；反过来 $\mathcal E_\beta$ 中态的乘积是副本平衡态，因为熵与相互作用期望相加。对有限多个槽上的实系数 $v_i$ 定义 $D_v^a=\sum_iv_is_i^a$ 与 $B_v^a=P_*D_v^aP_*$ 为物理局部算符；在格点对称子空间上 $P_*s_{(x,k)}^aP_*=S_x^a/\ell$，故 $B_v^a=\sum_xc_xS_x^a$，$c_x=\frac1\ell\sum_{k=1}^\ell v_{(x,k)}$，且当 $\sum_iv_i=0$ 时 $\sum_xc_x=0$。副本交叉项引理说：固定 $S$ 与足够大的有限 $\beta$，$\omega$ 是 $j$ 个未扰副本的任意平移不变平衡态，则对不同副本 $r,s$、轴 $a,b$、有限支撑实槽系数 $v,w$ 且 $\sum_iv_i=\sum_iw_i=0$，有 $\omega((B_v^a)^{[r]}(B_w^b)^{[s]})=0$，对这类乘积的平移的有限线性组合同样成立。证明写 $O=(B_v^a)^{[r]}(B_w^b)^{[s]}$，取含两支撑的定边长 $d$ 立方；令 $\rho_L$ 是 $\omega$ 在边长 $L$ 立方上的限制、$\gamma_L$ 是 $j$ 个周期零场 Gibbs 密度矩阵之积，用相对熵 $D(\rho\Vert\gamma)=\operatorname{Tr}\rho(\log\rho-\log\gamma)$，展开 $\log\gamma_L$ 得 $j$ 倍有限体积压力减去 $\rho_L$ 的熵密度与相互作用密度，其极限由平衡变分恒等式抵消，边界周期键把相互作用改变 $o(V)$，于是 $\frac1VD(\rho_L\Vert\gamma_L)\to0$。固定整数 $R\ge d$，让 $L$ 过 $R$ 的偶倍数，把立方分成边长 $R$ 的胞，$\mathcal T$ 是完全落在单个胞内的支撑立方平移，则 $\lvert\mathcal T\rvert/V=((R-d+1)/R)^3$。取 $C_O\ge\max\{1,S\lVert c\rVert_1\lVert d\rVert_1\}$ 与 $O'=\frac1{C_O}\sum_{y\in\mathcal T}\tau_y(O)$；这些算符可同时测量（副本 $r$ 用轴 $a$，副本 $s$ 用轴 $b$）。条件在副本 $s$ 的任意结果上，记 $\tau_y(B_w^b)^{[s]}$ 的值为 $b_y$（$\lvert b_y\rvert\le S\lVert d\rVert_1$），则 $O'$ 作为第一副本结果之函数是 $\sum_zf_zS_z^a$，其中 $f_z=\frac1{C_O}\sum_{y\in\mathcal T}c_{z-y}b_y$，其绝对值至多一，且在每个胞内之和为零（每个平移支撑都留在该胞内且 $\sum_xc_x=0$）。副本在 $\gamma_L$ 下独立，条件地用第 §6 节零场命题给 $\log\operatorname{Tr}(\gamma_Le^{\pm\theta O'})\le C_\beta bV$，其中 $b=-\log(1-R^{-5/2})$、$\theta=\kappa b\log R$。对自伴 $K$ 用 Gibbs 变分原理与 Golden--Thompson 不等式 $\operatorname{Tr}(\rho_LK)\le D(\rho_L\Vert\gamma_L)+\log\operatorname{Tr} e^{\log\gamma_L+K}\le D(\rho_L\Vert\gamma_L)+\log\operatorname{Tr}(\gamma_Le^K)$，按 $\omega(O)$ 的符号取 $K=\pm\theta O'$，由平移不变性与上式得 $\theta\frac{\lvert\mathcal T\rvert}{C_O}\lvert\omega(O)\rvert\le D(\rho_L\Vert\gamma_L)+C_\beta bV$。先在这个固定 $R$ 下让 $L\to\infty$（这个次序必需，因为相对熵密度没有速率），大 $R$ 时 $\lvert\mathcal T\rvert/V$ 有正下界，得 $\lvert\omega(O)\rvert\le C_{\beta,O}/\log R$，再令 $R\to\infty$ 即证。于是对一个由单副本项与上述交叉项之和组成的有限程副本扰动，其压力切线只依赖单副本项；第 §8 节正是用这一点来研究块磁化的负平方。

## §8 压力切线与长度共存的不可能性

变分原理已经给 $\mathcal E_\beta$ 中每个态的磁化一个上界 $m$。现在要证每个遍历成员的磁化长度恰是 $m$。更小半径的障碍会来自某些压力切线的解析性；为得到这份解析性，我构造随机转移矩阵，使其迹在取期望之前就非零，再用第 §7 节的副本交叉项把其矩的压力切线认出来。

对整数 $r\ge2$ 记 $C_r=\{0,\dots,r-1\}^3$，$\mathcal C_r$ 是它的全部平移（在格点上或在足够大的环面上）。对这样的立方 $C$ 记 $X_C=\sum_{x\in C}X_x$，$Y_C,Z_C$ 同。固定 $B\ge2$ 与 $W\ge2B$，选一个与 $W$ 无关的常数 $D_B>0$，考虑非正局部可观测量
$a_{B,W}=-\frac{Y_{C_B}^2}{B^6}-D_B\frac{X_{C_W}^2+Z_{C_W}^2}{W^6}$。
在一个磁化向量为 $(0,r,0)$ 的遍历态里，固定 $B$ 令 $W\to\infty$ 时横向项趋于零，而 $Y$ 项在 $B\to\infty$ 时趋于 $-r^2$（用平均遍历推论）。$a_{B,W}$ 的周期和记作 $A_{B,W,L}=\sum_{x\in\Lambda_L}\tau_x(a_{B,W})$。定义
$s_{B,W}(x)=\max_{\omega\in\mathcal E_\beta}\{\omega(a_{B,W})+x\omega(Y_0)\}$，$x\in\R$。
它凸、$S$-Lipschitz，且为偶：绕 $X$ 轴转 $\pi$ 保持 $a_{B,W}$ 并把 $Y_0$ 送成 $-Y_0$。

调和压力切线命题说：对每个整数 $B\ge2$ 存在 $D_B>0$，使得对每个整数 $W\ge2B$，上面这个函数有一条从正实轴到 $\mathbb H=\{z:\operatorname{Re} z>0\}$ 的调和延拓 $v_{B,W}$，满足 $v_{B,W}(x)=s_{B,W}(x)$（$x>0$）与 $v_{B,W}(z)\le s_{B,W}(\operatorname{Re} z)$（$z\in\mathbb H$）。

构造分三块。第一块把负平方写成实单槽矩阵的无穷小贡献，外加铁磁耦合的一个小缩减。所有生成元取 $iD_v^2$ 与 $D_v^1,D_v^3$，$v$ 零和；三者在 $s^3$ 基下都是实矩阵，实系数指数是 $SL_2(\R)$ 中单槽矩阵之积；$iD_v^2$ 平方贡献 $Y$ 方向的负平方，另两个贡献正平方，静态耦合的缩减正好抵消它们多余的最近邻系数。所有二次系数用**有序**槽对：$(D_v^a)^2=\sum_{i,j}v_iv_js_i^as_j^a$。对立方 $C$，$L_C^{\rm full}$ 是其 $\ell\lvert C\rvert$ 个槽上完全图的图 Laplacian，$L_C^{\rm bond}$ 是格点最近邻槽对之间带边的 Laplacian。$C_B$ 的键图连通，故可选 $c_B>0$ 使对每个 $C\in\mathcal C_B$ 有 $Q_C=c_BL_C^{\rm bond}-B^{-6}L_C^{\rm full}\ge0$：两个矩阵都湮灭常向量，在其正交补上键 Laplacian 正定而 $L_C^{\rm full}=\ell B^3I$。把 $Q_C$ 谱分解成 $\sum_vvv^{\mathsf T}$，每个 $v$ 实且零和，用生成元 $iD_v^2$。为抵消 $X,Z$ 方向剩余的静态缩减，令 $n_{B,W}=(W-B+1)^3$ 并考虑 $R_C=D_BW^{-6}L_C^{\rm full}-\frac{c_B}{n_{B,W}}\sum_{C'\subseteq C}L_{C'}^{\rm bond}$；每个槽至多属于 $B^3$ 个小立方、在每个键图里度至多 $6\ell$，故键 Laplacian 之和范数至多 $12\ell B^3$，而 $n_{B,W}\ge W^3/8$，于是 $D_B=96c_BB^3+1$ 就够使 $R_C\ge0$ 对一切 $W\ge2B$ 成立。把每个 $R_C$ 谱分解成实零和向量的和，用 $D_v^1$ 与 $D_v^3$，在每个尺寸的立方上选一份列表再平移，得到平移不变族。静态缩减 $T_{B,L}$ 是 $-c_B\sum_{C\in\mathcal C_B}\sum_{i,j}\sum_as_i^as_j^a$ 的物理压缩（内和有序）；每个无序格点键属于 $(B-1)B^2$ 个 $C_B$ 的平移，故 $H_{0,t}=H_0+tT_{B,L}=(\beta-2tc_B(B-1)B^2)\sum_{\{x,y\}}\mathbf S_x\cdot\mathbf S_y$ 对足够小的 $t>0$、一致于 $L>2W$ 仍是铁磁的。脉冲恒等式在物理空间上给 $T_{B,L}+\sum_\alpha P_*G_\alpha^2P_*=A_{B,W,L}+C_{B,W}VI$，标量 $C_{B,W}$ 与 $L>2W$ 无关。核验时先看立方 $C$ 内不同槽 $i,j$：若 $E_C(i,j)$ 是键图边的指示，小立方在 $Y$ 方向的系数是 $-c_BE_C(i,j)+(c_BE_C(i,j)-B^{-6})=-B^{-6}$；在 $X$ 或 $Z$ 方向，大立方贡献 $(R_C)_{ij}=-D_BW^{-6}+\frac{c_B}{n_{B,W}}\sum_{C'\subseteq C}E_{C'}(i,j)$，每个小立方恰在 $n_{B,W}$ 个大立方内，求和后第二项抵消静态缩减，只留每个大立方内每个有序对的 $-D_BW^{-6}$，正是 $A_{B,W,L}$ 的非对角系数；其余项 $i=j$ 且因 $(s_i^a)^2=I/4$ 为标量，平移不变性给那个标量。这个恒等式绝不把 $P_*G_\alpha^2P_*$ 换成 $(P_*G_\alpha P_*)^2$，否则一般会给出不同的单副本项。

第二块处理非零随机迹与副本矩。固定 $B,W$ 与足够小的 $t>0$，对偶 $L>2W$ 与整数 $k\ge1$ 取独立实中心 Gauss 变量 $\lambda_{r,\alpha}$（$1\le r\le k$，方差 $2t/k$），固定生成元次序并定义槽空间层 $U_r(z)=(\prod_\alpha e^{\lambda_{r,\alpha}G_\alpha})e^{(tz/k)\sum_is_i^2}$，只压缩完整层。以固定次序取乘积，定义归一化随机整函数
$\mathcal Z_{L,k,t}(z)=\frac{e^{-tC_{B,W}V}}{\operatorname{Tr} e^{H_0}}\operatorname{Tr}_{\rm phys}\prod_{r=1}^k[e^{H_{0,t}/k}(P_*U_r(z)P_*)]$。
Gauss 指数矩保证这些函数的一切有限乘积可积且对自变量局部一致。它的每个实现都在 $\mathbb H$ 上非零：脉冲支撑虽重叠，固定有序乘积仍是单槽矩阵的张量积（不同槽的因子交换，重新分组不改变任一槽上的次序），每个槽上的脉冲矩阵都在 $SL_2(\R)$ 中、在 $s^2$ 基下是圆盘自同构，剩下的因子 $e^{tzs^2/k}$ 在 $\operatorname{Re} z>0$ 时把闭圆盘严格送进圆盘，其复合因此具有零自由迹引理的严格映射性质。把 $E$ 记作静态相互作用时间步 $1/k$ 的全槽指数，它与 $P_*$ 交换，循环性给 $\operatorname{Tr}_{\rm phys}\prod_r[e^{H_{0,t}/k}(P_*U_r(z)P_*)]=\operatorname{Tr}_{\rm slots}\prod_r[(EP_*)U_r(z)]$，每个 $EP_*$ 有非负交换速率与对称接缝，正是引理允许的那类置换层；这个恒等式用 $P_*^2=P_*$，不要求 $U_r$ 保持物理空间。于是逐样本非零，特别地 $z\mapsto\frac1{tV}\log\lvert\mathcal Z_{L,k,t}(z)\rvert$ 在 $\mathbb H$ 上调和。复共轭在这里有确定的符号：静态矩阵、投影与所有脉冲在 $s^3$ 基下实，而 $s^2$ 纯虚，故对**同一个** Gauss 样本有 $\overline{\mathcal Z_{L,k,t}(z)}=\mathcal Z_{L,k,t}(-\overline z)$，其第二矩用到的对是 $(z,-\overline z)$。

共享 Gauss 变量后，固定 $j$ 与自变量 $z_1,\dots,z_j$，有限维乘积公式给 $\lim_k\mathbb E\prod_{r=1}^j\mathcal Z_{L,k,t}(z_r)=\mathcal R^{(j)}_{L,t}(z_1,\dots,z_j)$，后者是 $\operatorname{Tr}\exp\{\sum_r(H_0^{[r]}+tA_{B,W,L}^{[r]}+tz_rM_L^{2,[r]})+tA_{{\rm cross},L}^{(j)}\}/(\operatorname{Tr} e^{H_0})^j$，极限对自变量局部一致。核验极限与交叉项时，令 $P^{(j)}$ 是各副本物理投影之积，对单个共享 Gauss 变量有 $\mathbb E\exp(\lambda\sum_rG_\alpha^{[r]})=\exp(\frac tk(\sum_rG_\alpha^{[r]})^2)$，独立性允许按指定脉冲次序取期望；外层压缩后一阶项是 $P^{(j)}(\sum_rG_\alpha^{[r]})^2P^{(j)}=\sum_r(P_*G_\alpha^2P_*)^{[r]}+2\sum_{r<s}(P_*G_\alpha P_*)^{[r]}(P_*G_\alpha P_*)^{[s]}$。对虚方向生成元 $G_\alpha=iD_v^2$ 右端交叉积为 $-(P_*D_v^2P_*)^{[r]}(P_*D_v^2P_*)^{[s]}$，另两方向取正号，于是 $A_{{\rm cross},L}^{(j)}=2\sum_\alpha\sum_{r<s}(P_*G_\alpha P_*)^{[r]}(P_*G_\alpha P_*)^{[s]}$ 自伴、有限程、平移不变，其每个局部被加项都是第 §7 节交叉项的实倍数（所有 $v$ 零和）。用脉冲恒等式并把标量修正分摊到 $k$ 步，期望副本步是 $I+k^{-1}\mathcal H+O(k^{-2})$，$\mathcal H$ 是上面的指数，$B,W,j,t,L$ 固定、误差对自变量局部一致；时间步独立使期望乘积是这一步的 $k$ 次幂，矩阵乘积极限给出复制矩公式。

对实 $x_1,\dots,x_j$，定义 $\mathcal R^{(j)}_{L,t}$ 的分子为正。先取热力学极限再取右压力切线给 $\lim_{t\downarrow0}\lim_L\frac1{tV}\log\mathcal R^{(j)}_{L,t}(x_1,\dots,x_j)=\sum_{r=1}^js_{B,W}(x_r)$：由切线公式，左端是扰动密度在未扰副本相互作用的平衡态上的最大值，第 §7 节交叉项引理使每个这样的态里交叉密度为零，每个边缘属于 $\mathcal E_\beta$，给右端之和为上界，最大化单副本态之积是平衡态并达到该和。复自变量处还需上界：对自伴 $A,B$ 有 $\lvert\operatorname{Tr} e^{A+iB}\rvert\le\operatorname{Tr} e^A$（对 $(e^{A/n}e^{iB/n})^n$ 用乘积公式与 Schatten H\"older，迹范数至多 $\lVert e^{A/n}\rVert_n^n=\operatorname{Tr} e^A$，取极限），把它用在复制矩上即得绝对值被 $\mathcal R^{(j)}_{L,t}(\operatorname{Re} z_1,\dots,\operatorname{Re} z_j)$ 控制。这些极限在实自变量的紧集上按所述次序一致：归一化对数迹在实自变量上 $S$-Lipschitz 且对 $L,t$ 一致（用 $\lVert M_L^2\rVert\le SV$），有限网把逐点收敛升级为一致收敛。综合起来，给定紧集 $K\subset\mathbb H$、有限多个正实点 $x_1,\dots,x_q$ 与 $\epsilon>0$，可先取足够小的 $t>0$、再取足够大的偶 $L$、最后取足够大的 $k$，使得以 $T=tV$、$\mathcal Z=\mathcal Z_{L,k,t}$ 有 $\mathbb E\lvert\mathcal Z(z)\rvert^2\le\exp\{T(2s_{B,W}(\operatorname{Re} z)+\epsilon)\}$（$z\in K$），以及两条乘积矩的对数估计（用实自变量列 $(x_1,-x_1,\dots,x_q,-x_q)$ 与它的两倍，配合 $s_{B,W}$ 的偶性）。这个选择次序是本质的：矩阵乘积极限在固定体积取，压力极限先于 $t=0$ 处求导；有限估计按相反次序实现。全程没有用到任何关于平均配分函数的零自由断言。

第三块把矩信息变成调和对数。选择引理说：设 $s:(0,\infty)\to\R$ 局部 Lipschitz，$D=\{x_1,x_2,\dots\}$ 是 $(0,\infty)$ 的可数稠密集且 $x_1=1$，$F_n$ 是 $\mathbb H$ 上几乎必然非零的随机全纯函数，$T_n\to\infty$，并设对 $z\in\mathbb H$ 局部一致地有 $\limsup_n\{T_n^{-1}\log\mathbb E\lvert F_n(z)\rvert^2-2s(\operatorname{Re} z)\}\le0$，且对每个 $q\ge1$ 以 $U_n=\prod_{i=1}^q\lvert F_n(x_i)\rvert^2$ 有 $T_n^{-1}\log\mathbb E U_n\to2\sum_is(x_i)$ 与 $T_n^{-1}\log\mathbb E U_n^2\to4\sum_is(x_i)$；则存在 $\mathbb H$ 上的调和 $v$，$v(x)=s(x)$ 对一切 $x>0$ 成立且 $v(z)\le s(\operatorname{Re} z)$ 处处成立。证明取 $h_n=T_n^{-1}\log\lvert F_n\rvert$，Paley--Zygmund 不等式与乘积估计给 $\mathbb P\{U_n\ge\frac12\mathbb E U_n\}\ge\frac{(\mathbb E U_n)^2}{4\mathbb E U_n^2}\ge\frac14e^{-3\epsilon T_n}$；用有限多个同心双盘覆盖 $K$、对非负次调和函数 $\lvert F_n\rvert^2$ 用次均值不等式、再用 Markov 与并集界，得 $\mathbb P\{h_n(z)>s(\operatorname{Re} z)+\delta\text{ 在某 }z\in K\}\le C_Ke^{-(3\delta/2-\epsilon)T_n}$；取 $4\epsilon<3\delta/2$，因 $T_n\to\infty$ 后者终小于前者，故存在同时满足 $h_n\le s(\operatorname{Re} z)+\delta$ 于 $K$ 与 $\sum_ih_n(x_i)\ge\sum_is(x_i)-\frac\epsilon2-\frac{\log2}{2T_n}$ 的实现，减去其余 $q-1$ 点的上界得逐点夹逼。用紧矩形穷竭 $\mathbb H$、在第 $q$ 阶段把矩形扩大到含前 $q$ 个点、取 $\delta=q^{-2}$ 与足够小的 $\epsilon$、选递增指标列，所得调和函数局部上有界、在 $D$ 上趋于 $s$、在 $1$ 处下有界；在含 $1$ 的连通相对紧子域上，用公共上界减去它们再施 Harnack 不等式得局部下界，内部估计与对角子列给局部一致调和极限 $v$，紧上界给 $v(z)\le s(\operatorname{Re} z)$，$D$ 上的值加连续性给 $v(x)=s(x)$ 对一切 $x>0$。把这条引理用在复制矩与乘积估计上（在 $\mathbb H$ 的穷竭上依次施加，误差趋于零，取 $T_n=t_nL_n^3\ge n$），就得到调和压力切线命题。

最后是半径唯一性。命题是：每个遍历平移不变态 $\omega\in\mathcal E_\beta$ 满足 $\omega(X_0)^2+\omega(Y_0)^2+\omega(Z_0)^2=m^2$。证明先取最大化 $\omega(Y_0)$ 的面的极点 $\omega_m$，它是遍历的且向量为 $(0,m,0)$。反设存在磁化长度 $m'<m$ 的遍历平衡态，旋转成向量 $(0,m',0)$ 的态 $\omega_{m'}$（旋转保持平衡性与平移遍历性）。由平均遍历推论，对 $r=m,m'$ 有 $\omega_r(Y_{C_B}^2/B^6)\to r^2$ 与 $\omega_r((X_{C_W}^2+Z_{C_W}^2)/W^6)\to0$；对每个 $B$ 取 $W(B)\ge2B$ 足够大，使第二个期望乘 $D_B$ 在两个态里都至多 $1/B$，记 $s_B=s_{B,W(B)}$，得 $\liminf_Bs_B(x)\ge\max\{xm-m^2,xm'-(m')^2\}$（$x>0$）。另有一个对 $B,W$ 一致的上界：若 $y=\omega(Y_0)$，方差正性与平移不变性给 $\omega(Y_{C_B}^2/B^6)\ge y^2$、$-m\le y\le m$，丢掉其他非正平方项得 $s_{B,W}(x)\le\max_{-m\le y\le m}(xy-y^2)=xm-m^2$（$x>2S$），因为 $m\le S$ 且 $y\mapsto xy-y^2$ 在 $[-m,m]$ 上对这样的 $x$ 递增；对每个 $x>0$ 还有 $s_{B,W}(x)\le Sx$。令 $v_B$ 是调和切线命题给的调和函数，它满足 $v_B(z)\le S\operatorname{Re} z$ 于 $\mathbb H$；在固定 $x_0>2S$ 处，两条不等式给 $v_B(x_0)\to x_0m-m^2$，对非负调和函数 $S\operatorname{Re} z-v_B(z)$ 用 Harnack 不等式再取内部紧性，得 $\mathbb H$ 上的子列调和极限 $v$，同样两条不等式给 $v(x)=xm-m^2$ 对一切 $x>2S$；调和函数在实轴上的限制实解析，故该恒等式对一切 $x>0$ 成立。另一方面下界 $\liminf_Bs_B(x)\ge\max\{xm-m^2,xm'-(m')^2\}$ 传到这个子列，给 $v(x)\ge xm'-(m')^2$；对 $0<x<m+m'$，两个断言与 $(xm'-(m')^2)-(xm-m^2)=(m-m')(m+m'-x)>0$ 矛盾。因 $m>0$，这个区间非空，即使 $m'=0$ 亦然。更小半径不可能，命题得证。

## §9 总自旋表示论收尾

把空间比较与平衡态磁化长度的识别合起来，就得到球面律。固定一个高于前几节所有阈值的有限 $\beta$，写 $m=m_{S,\beta}>0$。

先有一个局部二阶矩引理：对每个有限非空矩形 $C\subset\Z^3$ 与每个平移不变平衡态 $\omega$ 有 $\sum_{a=1}^3\omega[(\frac1{\lvert C\rvert}\sum_{x\in C}S_x^a)^2]\ge m^2$。证明在平移遍历态里，平移不变性与方差正性给 $\omega[(\frac1{\lvert C\rvert}\sum_{x\in C}S_x^a)^2]\ge\omega(S_0^a)^2$，求和并用半径唯一性即对极点成立；平衡态集是平移不变态空间的紧面，由 Krein--Milman 是极点的闭凸包，而左端对态连续且仿射，故在整个面上成立。

由此得全局二阶矩下界：周期零场 Gibbs 态满足 $\liminf_L\frac1{V^2}\sum_{a=1}^3\langle(M_L^a)^2\rangle\ge m^2$。证明取一列偶边长实现该下极限，再取子列使 Gibbs 态局部收敛，其极限 $\omega$ 是平移不变平衡态；固定尺度比较里的终端尺度 $R_*$，其最细分划由边长上下界只依赖 $R_*$ 的矩形组成，对这个固定 $R_*$ 只有有限多种矩形形状，平移不变性与局部收敛于是给出对分划中所有胞一致的下界 $\liminf_L\frac1V\sum_{C\in\mathcal P_*}\lvert C\rvert\sum_{a=1}^3\langle(\frac1{\lvert C\rvert}\sum_{x\in C}S_x^a)^2\rangle\ge m^2$（局部二阶矩引理对每个极限形状供下界）；把尺度比较在三个方向上应用，得 $\liminf_L\frac1{V^2}\sum_{a=1}^3\langle(M_L^a)^2\rangle\ge m^2-\frac{C_\beta}{\log R_*}$，令 $R_*\to\infty$，因序列被选来实现在下极限，结论沿所有偶边长成立。

最后是主定理。Hamiltonian 与 $SU(2)$ 的全局自旋表示交换，把有限体积 Hilbert 空间分解成自旋 $J$ 的不可约表示与重数空间，在每个不可约因子上 Gibbs 密度是恒等的标量倍，于是 Gibbs 迹定义一个随机标签 $J_L$，$0\le J_L\le SV$，且 $\sum_{a=1}^3\langle(M_L^a)^2\rangle=\mathbb E[J_L(J_L+1)]$；条件在 $J_L=J$ 上，任意固定单位方向的分量在 $-J,-J+1,\dots,J$ 上均匀。先验证上尾：固定 $\epsilon>0$，由右导数定义某个固定 $h>0$ 满足 $p_{S,\beta}(h)-p_{S,\beta}(0)\le h(m+\epsilon/4)$；因 $H_{S,L}$ 与 $M_L^3$ 交换，指数 Markov 与压力极限给 $\limsup_L\frac1V\log\mathbb P(M_L^3/V>m+\epsilon/2)\le-\beta h(m+\epsilon/2)+\beta[p_{S,\beta}(h)-p_{S,\beta}(0)]\le-\beta h\epsilon/4<0$，这里概率是 $M_L^3$ 在 Gibbs 态里的谱分布；若 $J/V>m+\epsilon$，其 $2J+1$ 个磁能级里至少 $\epsilon V/2-1$ 个超过 $(m+\epsilon/2)V$，对足够大的 $L$ 其条件概率有只依赖 $\epsilon,S$ 的正下界，故 $\mathbb P(J_L/V>m+\epsilon)\to0$。$J_L/V$ 的律支在紧区间 $[0,S]$，每个子列极限由这条上尾界支在 $[0,m]$；由 Casimir 恒等式、全局二阶矩下界与 $J_L/V^2\le S/V$，它的二阶矩至少 $m^2$；支在 $[0,m]$ 且有此性质的测度只能是 $m$ 处的点质量。于是 $J_L/V\to m$ 依概率，且 $\frac{\mathbb E[J_L(J_L+1)]}{V^2}\to m^2$，后者给出二阶矩律。对 $t\ne0$，把方向 $t/\lvert t\rvert$ 转到第三轴，条件在 $J_L=J$ 上，球面律里的 Laplace 变换是 $\frac1{2J+1}\sum_{r=-J}^Je^{\lvert t\rvert r/V}$；只要 $J/V\to m>0$，这些 Riemann 和收敛到 $\frac12\int_{-1}^1e^{m\lvert t\rvert u}\,\mathrm d u=\frac{\sinh(m\lvert t\rvert)}{m\lvert t\rvert}$；它们被 $e^{S\lvert t\rvert}$ 一致控制，故 $J_L/V$ 的依概率收敛给出其期望的收敛。$t=0$ 平凡。$\mathbb S^2$ 上归一化面积测度的第三坐标在 $[-1,1]$ 上均匀，这识别了球面律里的积分，证明完成。

## §10 走过的错误路线与关键转折

我先把几条走不通的路记下来，因为它们解释了最终构造为什么长成现在这样。

第一条错路是直接搬低温渐近。我一度想：同伴工作已经给出自旋波理论预言的自由能渐近，把它的磁化当作 $m$，再用局部平方去逼近全局平方，事情就完了。问题在极限次序：那条渐近讲的是 $\beta\to\infty$ 时的自由能，而我要的是固定正温度下零场磁化分布，或等价的场导数。把两个不同的极限当成同一个，会让 $m$ 的定义与结论脱钩。这条路被我整条放弃，只在有限交换与几何估计处借用同伴结果。

第二条错路是把局部平方与全局平方的关系当成显然。我最初以为把环面切成大盒，每个盒里的平方之和自然就逼近全局平方。空间上的缓慢转动可以同时让局部平方很大而全局平方被抵消，这正好是必须排除的情形，也正是"比较"这一步的内容。我后来不得不先证一个带对数误差的尺度比较，把局部平方之和用全局平方加上 $C_\beta/\log R_*$ 控制，再让终端尺度趋于无穷。

第三条错路是想只用压力的凸性来证半径唯一。凸性只给出每个平衡态磁化长度的上界 $m$，它看不见空间结构；若真有小半径的遍历态，它在变分上完全合法。要把这种态排掉，必须造一个能区分不同长度的扰动。这里的关键转折是：负的平方项 $-Y_{C_B}^2/B^6$ 能在遍历态里把长度 $r$ 变成 $-r^2$，从而在压力切线里把 $xm-m^2$ 与 $xm'-(m')^2$ 两条支线分开。可负平方算符不能直接塞进交换零自由的论证，因为对 $D_v$ 先压缩再平方与先平方再压缩一般不同。我的解法是把它实现成随机乘积的一阶平均：用 $iD_v^2$ 与 $D_v^1,D_v^3$ 这些在 $s^3$ 基下为实的单槽矩阵生成元，配合两个 Laplacian 协方差（小立方的 $Q_C$ 与大立方的 $R_C$），把负平方与一个静态耦合缩减一起写成脉冲恒等式。这样每个实现都在半平面上零自由，取期望之前就非零。

第四条错路出现在空间部分。我原以为可以照搬同伴的钉子论证，在环面上钉一圈边界。环面上没有边界可钉，任何"钉满边界"的构造都会绕回来。转折点是改用鬼槽把小场变成固定钉子，再让那个小场去"杀死"逃逸：单位流被锥形截断后剩下的散度误差是 $\lVert\varepsilon_a\rVert_2\le CL^{1/2-k}$，而它恰好被小场的杀死吸收掉。正是这一步让 $k=199/100$ 与 $2k-3=49/50>\alpha$ 这两个指数对上了。

最后一个转折是把解析性从"平均配分函数"换成"逐样本零自由"。我最初想让平均后的配分函数无零点，那既难又不必要。改成：每个 Gauss 样本的随机迹在 $\operatorname{Re} z>0$ 上非零，它的对数在 $\mathbb H$ 上调和；共享 Gauss 变量把矩变成复制压力，第 §7 节的交叉项消失定理再把交叉项从压力导数里删掉；最后由矩信息用选择引理抽出调和的极限。这条链子是整篇里最不像"估计"的一段，却决定了半径唯一性能不能证成。

## §11 与最初设想的差异

有几处结果与我一开始的设想差别很大，值得单独写清楚。

我原以为下界只用一个事实，就是"每个遍历平衡态长度都是 $m$"。实际上要用两个互相独立的事实：其一是局部平方由全局平方控制（空间比较，见 §5 与 §6），其二是每个遍历平衡态长度唯一（压力切线，见 §8）。而且它们的顺序不能反：空间比较先把局部平方抬到全局平方附近，半径唯一性再把"局部方向可能转动"这种抵消排除掉。最初那个"上界加下界"的两步计划里，第二步被我写成了一个前提，这是错的。

我原以为 $m>0$ 需要尖锐的低温渐近。实际结果是环面稀疏钉子估计直接给 $m_{S,\beta}\ge S(1-\beta^{-9/10})>0$，完全不需要尖锐渐近。这个下界甚至顺带把球面律的半径从"可能是零"里救了出来。

我原以为空间估计会是一条直接的磁化率界。实际它要经过三层：横磁化率恒等式把平方写成洞上预解式，骨架图把洞之间的通信代价编码成能量，外壳构造把被困的洞局部化。三层缺一不可，而每一层都贡献一个非最优指数（$\delta=R^{-1/8}$、$n=R^{1/200}$、$R^{-1/20}$、$R^{-1/40}$）。

我原以为"不需要对不交换的可观测量做联合测量"只是个技术附注。实际它是贯穿全篇的红线：球面律的左端是自伴线性组合 $\exp(\frac1V\sum_at_aM_L^a)$ 的期望，空间比较只用同一固定轴的均值平方，副本交叉项用的是压缩后的单副本算符。把这些写成联合谱测度会立刻失去意义，所以每处陈述都要把这一点摆出来。

还有一个我没预料到的差异：负平方扰动里出现的两个协方差矩阵必须**在平方之后**压缩。脉冲恒等式明确不把 $P_*G_\alpha^2P_*$ 换成 $(P_*G_\alpha P_*)^2$，否则会得到不同的单副本项，整个复制矩计算就错位。这个细节在第一版草稿里被我写反过，后来靠核验 $i\ne j$ 与 $i=j$ 两类系数才发现。

最后，所有常数都是刻意非最优的：稀疏指数 $1/100$、流衰减 $199/100$、概率 $p=\beta^{-9/10}$、弱场率 $R^{-1/40}$。我要的只是一条能把体积极限走完的负幂，最优化既无必要也会让证明更难读。

## §12 台账

下表把全篇真正被消费的符号、它们的量级或增长率、本会话真实读到的位置、消费者，以及一旦改动会断在哪一步列在一起。位置栏只写本会话 Read 出来的文件与行号。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $S$ | 固定自旋，取 $\tfrac12,1,\tfrac32,\dots$ | 01-introduction.tex:14 | 全篇模型与自旋表示 | 改则所有常数对 $S$ 的依赖错位 |
| $\ell=2S$ | 每格点槽数 | 02-exchange.tex:12 | 交换表示与槽计数 | 改则 $N=\ell V$ 与压缩因子错 |
| $V=L^3$ | 环面体积 | 01-introduction.tex:20 | 压力与磁化归一 | 改则全部密度极限失真 |
| $N=\ell V$ | 槽总数 | 02-exchange.tex:13 | 预解式迹界 | 改则 $\mathbb E\operatorname{Tr} D^{-1}\le N$ 失配 |
| $H_{S,L}$ | $-\sum_{\{x,y\}}\sum_aS_x^aS_y^a$ | 01-introduction.tex:23 | 全篇模型 | 改则交换图生成元变 |
| $M_L^a$ | 总自旋分量 | 01-introduction.tex:25 | 球面律与 Casimir 恒等式 | 改则球面律左端变 |
| $p_{S,\beta}(h)$ | 压力，先体积极限后撤场 | 01-introduction.tex:34 | 定义 $m$ | 改则 $m$ 与切线次序错 |
| $m_{S,\beta}$ | $p_{S,\beta}'(0+)$ | 01-introduction.tex:38 | 球面律半径 | 改则半径与场导数脱钩 |
| $\sinh(m\lvert t\rvert)/(m\lvert t\rvert)$ | 球面特征函数 | 01-introduction.tex:53 | 主定理右端 | 改则方向均匀性失去 |
| $J_L$ | 总自旋标签，$0\le J_L\le SV$ | 08-global-spin.tex:78 | 收敛 $J_L/V\to m$ | 改则 Casimir 恒等式断 |
| $\mathbb E[J_L(J_L+1)]$ | $\sum_a\langle(M_L^a)^2\rangle$ | 08-global-spin.tex:80 | 二阶矩律 | 改则二阶矩识别断 |
| $\beta_0(S)$ | 低温阈值，有限 | 01-introduction.tex:46 | 全部结论前提 | 改则低温度范围变 |
| $P_*$ | 对称子空间投影 | 02-exchange.tex:17 | 交换表示与压缩 | 改则 $e^{H_0}P_*$ 恒等式断 |
| $\ell^{-1}$ | 单槽压缩因子 | 02-exchange.tex:25 | $c_x$ 系数 | 改则 $B_v^a$ 系数错 |
| $e^{\beta\lvert\mathcal E\rvert/4}\mathbb E_{\rm b}\mathcal U_\pi$ | 交换表示右端 | 02-exchange.tex:35 | 环与颜色权重 | 改则 $2^{n}$ 权重断 |
| $\mathbb E\prod_i(u_i+v_{\pi(i)})$ | 稳定多项式 | 02-exchange.tex:84 | 负相关 | 改则存在性推论断 |
| $\prod_j\Pr(j\in A)$ | 负相关上界 | 02-exchange.tex:93 | 钉子不等式 | 改则 $r(E,T)^{\lvert T\rvert}$ 断 |
| $\mathcal Z_E=\mathbb E_{\rm b}2^{n_E}$ | 倾斜配分 | 02-exchange.tex:116 | 钉律归一 | 改则 $\mathbb P_E$ 归一错 |
| $r(E,T)$ | 下一个钉子回归均值 | 02-exchange.tex:125 | 钉子不等式 | 改则 $2r$ 界断 |
| $(2r(E,T))^{\lvert T\rvert}$ | 同时钉概率界 | 02-exchange.tex:154 | 归纳删除钉子 | 改则稀疏界推导断 |
| $\det(I_D-K_{DD})$ | 全命中概率 | 02-exchange.tex:273 | 条件首中核 | 改则条件均值断 |
| $K_{II}+K_{ID}(I_D-K_{DD})^{-1}K_{DI}$ | 首中核均值 | 02-exchange.tex:286 | 洞游走 | 改则新鲜转移识别断 |
| $A+Bx+Cy+Dxy\mapsto A+D$ | 圆盘收缩 | 02-exchange.tex:417 | 零自由迹 | 改则迹非零证明断 |
| $e^{bs^2/2}e^{bzfs^3}e^{bs^2/2}$ | 条带单槽映射 | 02-exchange.tex:446 | 零场条带 | 改则解析性断 |
| $\operatorname{diag}(1,w)=wI+qP_{\mathrm{up}}$ | 软钉因子 | 03-sparse-pins.tex:17 | 场与钉子等价 | 改则鬼表示断 |
| $C_s(1+h)^\alpha$ | 稀疏计数，$\alpha=1/100$ | 03-sparse-pins.tex:66 | 稀疏钉子界 | 改则 $m_T\le CL^\alpha$ 断 |
| $p=\beta^{-9/10}$ | 稀疏钉概率 | 03-sparse-pins.tex:82 | 归纳阈值 | 改则 $2r\le p$ 判据变 |
| $U=wK$，$Q=\tfrac12(U+U^*)$ | 洞游走核 | 03-sparse-pins.tex:134 | $E_y\ge q\lVert y\rVert_2^2$ | 改则配平方正性断 |
| $\lVert v\rVert_2^{10/3}\le C\mathcal D(v)\lVert v\rVert_1^{4/3}$ | 局部 Nash | 03-sparse-pins.tex:189 | $H'\le-cH^{5/3}$ | 改则扩散衰减率变 |
| $\operatorname{div} F_a=\mathbf1_{\{a\}}$ | 单位流，衰减 $k=199/100$ | 03-sparse-pins.tex:195 | 流配对 | 改则 $2k-3=49/50>\alpha$ 断 |
| $\Delta_A=CA^3p^6+C\exp(-cA^{\lambda\nu})$ | 正规性失败率 | 03-sparse-pins.tex:332 | 好暴露 | 改则短回归界断 |
| $CL^{-47/100}$ | 回归界末项 | 03-sparse-pins.tex:619 | 归纳收尾 | 改则 $2r\le p$ 断 |
| $S(1-\beta^{-9/10})$ | 正磁化下界 | 03-sparse-pins.tex:644 | $m>0$ | 改则球面律半径可能为零 |
| $D=I-wK$，$D^{-1}=\sum_rw^rK^r$ | 洞预解式 | 04-spatial-comparison.tex:52 | 横向恒等式 | 改则横向平方识别断 |
| $q(D^{-1})_{ii}$ | 钉边缘概率 | 04-spatial-comparison.tex:62 | 迹界 | 改则 $\mathbb E\operatorname{Tr} D^{-1}\le N$ 断 |
| $\frac{q^2}w(D^{-1})_{ij}$ | 后继概率 | 04-spatial-comparison.tex:63 | 横向恒等式 | 改则两槽期望断 |
| $C\sqrt{\lvert B\rvert/q}$ | 暴露后逐胞抵消 | 04-spatial-comparison.tex:177 | 胞内逼近 | 改则最终估计断 |
| $C_\beta\tau^{-1}(e_i+e_j)$ | 接触代价 | 04-spatial-comparison.tex:240 | 通信图 | 改则 $n^6\delta^{-1}$ 因子断 |
| $qN$ | 分量数期望上界 | 04-spatial-comparison.tex:245 | 例外集估计 | 改则小闭环贡献断 |
| $Ce^{-ch^{\lambda_1}}$ | 坏盒尾 | 04-spatial-comparison.tex:335 | 不可用胞 | 改则 $R^3e^{-cn^{\lambda_1}}$ 断 |
| $C_\beta n^6\delta^{-1}$ | 比较边代价 | 04-spatial-comparison.tex:542 | 胞内逼近 | 改则 $R^{-1/20}$ 断 |
| $C_\beta NR^{-1/20}$ | 胞内预解逼近 | 04-spatial-comparison.tex:646 | 最终弱场界 | 改则 $R^{-1/40}$ 断 |
| $R^{-1/40}$ | 弱场空间估计率 | 04-spatial-comparison.tex:25 | 零场指数矩 | 改则 $\eta=1/40$ 变 |
| $J_a=\frac2{a^2}(h_a*h_a)$ | 条带曲率核 | 05-zero-field.tex:28 | 曲率增长 | 改则 $F''$ 表示断 |
| $e^{c_a\lvert x\rvert}F''(0)$ | 曲率增长界 | 05-zero-field.tex:36 | 零场指数界 | 改则 $\kappa\log R$ 范围断 |
| $R_{j+1}=R_j^{9/10}$ | 嵌套尺度比 | 05-zero-field.tex:218 | 尺度比较 | 改则对数误差求和断 |
| $\mathfrak s(\omega)+e_0(\omega)+t\omega(a)$ | 变分泛函 | 06-equilibrium.tex:46 | 切线公式 | 改则 $m$ 表征断 |
| $P_a'(0+)=\max_{\mathcal E_\beta}\omega(a)$ | 切线公式 | 06-equilibrium.tex:59 | $m=\max\omega(Y_0)$ | 改则半径上界断 |
| $\omega((B_v^a)^{[r]}(B_w^b)^{[s]})=0$ | 副本交叉项消失 | 06-equilibrium.tex:191 | 压力切线 | 改则复制矩切线断 |
| $-\frac{Y_{C_B}^2}{B^6}-D_B\frac{X_{C_W}^2+Z_{C_W}^2}{W^6}$ | 负平方测试 | 07-pressure.tex:18 | 切线分离半径 | 改则两半径下界断 |
| $s_{B,W}(x)=\max\{\omega(a_{B,W})+x\omega(Y_0)\}$ | 平方切线 | 07-pressure.tex:29 | 调和延拓 | 改则半径唯一性断 |
| $D_B=96c_BB^3+1$ | 大立方协方差选择 | 07-pressure.tex:115 | $R_C\ge0$ | 改则脉冲恒等式断 |
| $\lvert\operatorname{Tr} e^{A+iB}\rvert\le\operatorname{Tr} e^A$ | 复迹界 | 07-pressure.tex:316 | 复自变量控制 | 改则乘积矩估计断 |
| $T_n^{-1}\log\mathbb E U_n\to2\sum_is(x_i)$ | 乘积一阶矩 | 07-pressure.tex:381 | 选择引理 | 改则调和对数选择断 |
| $\omega(X_0)^2+\omega(Y_0)^2+\omega(Z_0)^2=m^2$ | 平衡态半径 | 07-pressure.tex:491 | 半径唯一性 | 改则全局二阶矩下界断 |
| $xm-m^2$ | 大场切线 | 07-pressure.tex:531 | 矛盾区间 | 改则 $0<x<m+m'$ 矛盾断 |
| $\liminf_L\frac1{V^2}\sum_a\langle(M_L^a)^2\rangle\ge m^2$ | 全局二阶矩 | 08-global-spin.tex:34 | 自旋集中 | 改则点质量识别断 |
| $\mathbb E[J_L(J_L+1)]/V^2\to m^2$ | 自旋集中 | 08-global-spin.tex:116 | 二阶矩律 | 改则球面律断 |
| $\frac{\sinh(m\lvert t\rvert)}{m\lvert t\rvert}$ | Riemann 和极限 | 08-global-spin.tex:130 | 球面律 | 改则主定理断 |
