# D517 正曲率 Einstein 四维流形分类：两块耦合的证明之路（研究笔记）

## §0 落笔说明与队列登记

这份笔记重建论文 Positively curved Einstein four-manifolds（2026 年 9 月 23 日稿）背后的思维链。写作素材只取自该论文 build 目录下的 .tex 源文件：paper.tex、references.tex、figures 下两个分片、sections 下十个正文章节，合计 $182032$ 字节。派单判定 thin=no，属于厚素材一路，我先用 ls 量出每个文件的字节数，再按引言、预备、体积、Hessian、耦合、凭证、分类、附录的顺序通读主干，没有整篇顺序啃完才动笔。全程未接触任何 PDF，也未碰 lean 仓与形式化记录。

论文骨架本身极短：paper.tex 第 29--31 行给出标题、作者栏与日期，第 35 行的摘要一句话讲完主定理，随后按顺序 input 各节（paper.tex:37--55）。主定理表述在 01-introduction.tex:13--19：设 $(M,g)$ 为连通光滑闭 Einstein 四维流形，截面曲率严格正，不假设可定向，则存在常数 $a>0$ 使 $(M,ag)$ 等距于标准圆球 $S^4$、Fubini--Study 的 $\mathbb{CP}^2$、或带标准圆度量 $\mathbb{RP}^4$ 三者之一。摘要特别强调可定向性假设可以拿掉（paper.tex:35）。

本单登记串逐行照抄如下：

preprints/Positively-curved-Einstein-four-manifolds-September-23-2026
其他队列第 340 行号

## §1 初始动机：为什么盯住不加任何额外假设的分类

我进入这个问题的起点是 Yang 在 2000 年猜想里明确列出的三个模型（01-introduction.tex:8--10）。Einstein 条件把截面曲率的迹固定住，却允许单个截面自由变动（01-introduction.tex:3--5），这个"迹固定、成员自由"的张力正是四维问题的全部困难所在。

翻文献时我手里有一份带各种附加假设的部分结果清单，论文引言自己就把它列全了（01-introduction.tex:30--73）：Berger 的严四分夹逼刚性（01-introduction.tex:32--33）；Yang、Costa、Cao--Tran 的定量截面曲率界，其中有些是相对 Einstein 常数的上界形态，属夹逼比之外的假设（01-introduction.tex:33--37）；Gursky--LeBrun 对取向闭 Einstein 流形加非负截面曲率再加交形式正定非零，得 Fubini--Study 结论（01-introduction.tex:38--40）；Koca 的 Hermitian 可积复结构情形（01-introduction.tex:41--43）；非负各向曲率一路是 Micallef--Wang 的局部分类和 Brendle 的高维推广（01-introduction.tex:43--47）。近年一批工作各取一个侧面：Dameno 从扭量度量的纤维常数性推出半共形平坦（01-introduction.tex:49--53）；Catino--Dameno 用一个 Weyl 块内最大与中间特征值的分离度（01-introduction.tex:54--56）；Di Cerbo 处理 Weyl 范数界处处取等的情况（01-introduction.tex:57--60）；Cheng 在 $\chi\le 3$ 下完成取向分类，附带非平凡 Killing 场推论（01-introduction.tex:62--65）；Gursky--Malchiodi 用 Green 函数比较与 ADM 质量处理 $2\chi-3\lvert\tau\rvert\le 4$（01-introduction.tex:66--70）。

我最初的猜想很朴素：所有这些假设都在"松"截面严格正这一条腿上做文章，如果我把严格正用对了地方，它应该单独就够。引言第 72--73 行把这层意图写得很坦白：下面的论证处理两个外尔块之间的相互作用，不借用任何此类额外限制。于是我的任务被压缩成一句话：在 $\operatorname{Ric}=3g$ 归一（01-introduction.tex:26--28）下，证明度量半共形平坦，再走经典收尾。取向情形的分类是主任务，非取向情形最后用取向二重覆盖解决（01-introduction.tex:22--28）。

## §2 第一条错误路线：范数锥与常数配平走不通

我首先尝试的路线完全在范数层面。把 Hodge 星算子的两个三秩特征丛记为 $\Lambda^+$ 与 $\Lambda^-$，归一后曲率算子在它们上限制为 $\operatorname{Id}+T$ 与 $\operatorname{Id}+U$，$T,U$ 是无迹对称自同态，即两个外尔块（01-introduction.tex:75--82）。中心中间结论是半共形平坦：$T\equiv 0$ 或 $U\equiv 0$（01-introduction.tex:83--86）。

设 $v=\lvert T\rvert/\sqrt6$，$b=\lvert U\rvert/\sqrt6$，$x=-\lambda_{\min}(T)$，$y=-\lambda_{\min}(U)$（01-introduction.tex:88--92）。范数层面能立刻写下的东西有：$v\le x\le 2v$，$b\le y\le 2b$，于是 $x+y<2$ 只能弱化成了 $v+b<2$（01-introduction.tex:93--96）。对非零块有间隙 $\mathbf E v^2\ge 1$，$b$ 一侧交换对称（01-introduction.tex:99--103，严格陈述与零点处理见 03-analytic.tex:139--149）。两条一拼，两块都非零时 $2\le \mathbf E(v^2+b^2)$。

我当时以为把 $v+b<2$ 逐点积分，配上间隙的积分下界，再喂给某个 Sobolev 或体积公式就能挤出矛盾。这条路失败得干脆：$v+b<2$ 是逐点谱信息，间隙是积分信息，范数弱化把谱边界放宽了整整一倍（$x\le 2v$ 可以取等，即谱型 $(-v,-v,2v)$ 的轴向构型），中间没有桥。Gursky--LeBrun 恰恰研究过双块非零的情形，但他们用的是对应的非严格锥和范数不等式（01-introduction.tex:96--98），停在了那里。

第二条失败的尝试是照抄标量配平的前史。Yang 选常数 $t$ 使 $\lvert W^+\rvert-t\lvert W^-\rvert$ 均值为零，然后合用 Weyl 方程、精化 Kato 不等式和 Poincaré 不等式（01-introduction.tex:105--108）；Cao--Tran 平衡范数的磨光幂（01-introduction.tex:109--111）。我在纸面上试过把这套搬到严格正截面：常数 $t$ 只配平一次矩，二次矩仍然自由漂移；而 Poincaré 不等式给出的常数与 Einstein 归一下的特征值谱对不上，导数项损失补不回来。两块的导数在积分后互相纠缠，一个常数压不住两个方向。这两次失败把问题逼到一个更尖的形式上：必须让体积、间隙、方差三类积分量彼此咬合，同时手里要有一条能吞掉四阶导数项的局部不等式。

## §3 转折点：把严格正写成谱边界并带进二次型

真正的转折发生在我决定不做范数弱化、把 $x+y<2$ 原样供起来的那一刻。02-preliminaries.tex 的引理把这件事做成精确等价：$\sec_g>0$ 当且仅当 $x+y<2$（02-preliminaries.tex:63--64）。证明里有一条我用了很多次的量化：单位简单二形式的自对偶与反自对偶部分范数各为 $1/\sqrt2$，反过来两部件取这两个范数的二形式其外平方为零所以是简单的，标准形 $\alpha=a\,e^1\wedge e^2+b\,e^3\wedge e^4$ 里 $\alpha\wedge\alpha=0$ 就是 $ab=0$；于是正反谱对的全部搭配都会实现，最小截面曲率恰为 $1-(x+y)/2$（02-preliminaries.tex:86--92）。

范数与谱的关系也在这里钉死：把 $T$ 的特征值写成 $-x,a,x-a$，极小性给出 $-x\le a\le 2x$，于是 $\tfrac32x^2\le x^2+a^2+(x-a)^2\le 6x^2$，除以 $6$ 得 $v\le x\le 2v$（02-preliminaries.tex:94--101）。

转点后我的估计策略变成：任何需要的正性，其下界要显含 $x,y$，让严格正 $x+y<2$ 在最后一刻才入场。后来落定的地方在加权 Hessian 一节：曲率加权二次型在剩余 Hessian 分量上的正性下界是 $4-2x-2y>0$（01-introduction.tex:127--128；05-hessian.tex:191--193），数字 $4$ 恰好与截面正性边界 $x+y=2$ 对接（05-hessian.tex:163--171）。这一句"标量 4 恰好落在 $x+y=2$ 上"是我回看时认定的全篇设计核心：它解释了算子组合 $\mathcal P=4-\tfrac52\widetilde Q-U_D$ 里系数的由来，论文也小心声明这系数组合并无唯一性（05-hessian.tex:165--171）。

## §4 代数工具箱：四元数标架、自旋标号与曲率加权算子

要把 $x,y$ 带进微分不等式，先得有一门能同时说"导数"和"谱"的语言。02-preliminaries.tex 第 4--8 行交代了动机：后面的 Hessian 估计依赖精确的表示常数，所以要先把代数做完、把归一化钉死。分解本身是经典的，出处挂在 Derdziński 的论文（02-preliminaries.tex:5--6）。

度量归一到 $\operatorname{Ric}=3g$，约定 $[\nabla_i,\nabla_j]\xi_k=R_{ijka}\xi_a$、正曲率二维面上 $R_{ijij}>0$，并且先取协变导数、再做逐点特征标架选择（02-preliminaries.tex:9--22）。后半句是一条纪律，我后面会看到它如何救回两次推导。

四元数一边：在取向欧氏四维空间取两族斜正交复结构 $I_1,I_2,I_3$ 与 $J_1,J_2,J_3$，各自满足 $I_1I_2=I_3=-I_2I_1$ 及循环，且每个 $I_s$ 与每个 $J_t$ 交换；它们可以从左右四元数乘法构造。作为二形式，$I_s/\sqrt2$、$J_s/\sqrt2$ 分别是 $\Lambda^+$、$\Lambda^-$ 的标准正交基（02-preliminaries.tex:26--38）。曲率算子分块对角（02-preliminaries.tex:40--49），在特征标架下曲率张量展开为
\[
 R_{ikjl}=\frac12\sum_s(1+t_s)I_{s,ik}I_{s,jl}+\frac12\sum_s(1+u_s)J_{s,ik}J_{s,jl}
\]
（02-preliminaries.tex:50--56）。第一 Bianchi 恒等式说曲率算子两个对角块的迹相等，其和是数量曲率之半即 $6$；收缩把非对角块与无迹 Ricci 张量对上，$I_sJ_t$ 型独立矩阵给出九个系数，于是 Einstein 条件令非对角块归零，每个对角块迹为 $3$（02-preliminaries.tex:77--84）。两个块作为四阶张量都无散度，$\nabla T$ 的矩阵元素作为一形式满足 $\sum_s I_sZ_{sr}=0$，$r=1,2,3$（02-preliminaries.tex:68--73，证明在 02-preliminaries.tex:103--108）。

自旋语言：$\Sigma_s$ 是 $I_s$ 在外指标上的无穷小作用，在 $\Lambda^+$ 上是绕轴 $s$ 速度 $2$ 的旋转；自旋 $j$ 由 $\sum_s\Sigma_s^2=-4j(j+1)\operatorname{Id}$ 定义，一对 $(j,\ell)$ 指定两个交换旋转代数的自旋（02-preliminaries.tex:113--122）。这套记号只描述取向正交标架丛的张量丛，不需要自旋结构（02-preliminaries.tex:120--122；05-hessian.tex:135--137 重申）。权重、张量积分解规则 $H_j\otimes H_\ell\cong\bigoplus H_{j+\ell}\oplus\cdots\oplus H_{\lvert j-\ell\rvert}$、升降算子的平方系数 $(r+1)(2j-r)$，以及切丛、$\Lambda^+$、$F=\operatorname{Sym}_0(\Lambda^+)$ 的三个类型 $\left(\tfrac12,\tfrac12\right),(1,0),(2,0)$，都在 02-preliminaries.tex:124--167 一次给齐。我特别记下第 162--166 行的话：这些分裂由不变代数算子定义，标架丛联络保持每个这样的算子，所以投影平行，哪怕选出的局部标架或曲率特征标架不平行。

曲率加权算子有两个：在 $F$ 上 $B_F(A)S=(AS+SA)/2-\operatorname{tr}(AS)\operatorname{Id}/3$，特征由 $\langle B_F(A)S,S\rangle=\operatorname{tr}(AS^2)$ 确定；在任何 $j\ge1$ 的正自旋表示上 $Q_j(A)=\sum_{r,s}A_{rs}\Sigma_r\Sigma_s/(4j(2j-1))$（02-preliminaries.tex:169--181）。关键引理：若 $A$ 的最小特征值为 $-x$，则 $Q_j(A)\le x(j+1)/(2j-1)\operatorname{Id}$；且 $Q_2(A)=B_F(A)$；在附加负因子平凡作用时，$B_F(A)$ 压到高自旋耦合的总正自旋 $j$ 上就是 $Q_j(A)$（02-preliminaries.tex:183--193）。证明的三步值得咀嚼：对角化后逐项放缩给界；对 $Q_2=B_F$ 用 $S$ 对角、$D=\operatorname{diag}(d_1,d_2,d_3)$ 直接算，$\lvert\Sigma_sS\rvert^2=8(d_j-d_k)^2$，极化补全（02-preliminaries.tex:205--220）；一般压缩唯一性靠自旋 $2$ 在 $\operatorname{End}(H_j)$ 中出现一次，测试元取 $A=\operatorname{diag}(-1,-1,2)$ 与最高权向量，$Q_j$ 在权 $m$ 的特征值为 $\bigl(j(j+1)-3m^2\bigr)/\bigl(j(2j-1)\bigr)$，最高权处为 $-1$，与 $B_F(A)$ 的最高权特征值相同（02-preliminaries.tex:222--237）。

## §5 两条方程：$\Delta T$ 与 $\Delta Z$，以及梯度参数化

工具箱就位后，第一条硬信息在 02-preliminaries.tex:239--321。设 $Z=\nabla T$。导数空间 $T^*M\otimes F$ 分解为类型 $(5/2,1/2)$ 与 $(3/2,1/2)$；散度的取值空间正自旋不超过 $3/2$，且非零（一个非零余切向量张量 $\operatorname{diag}(1,-1,0)$ 散度非零），由不可约性它在第一分量上归零、在第二分量上单射；引理 4 的 Bianchi 约束把 $Z$ 钉在第一分量里（02-preliminaries.tex:256--263）。于是 $Z$ 属于平行子丛 $G$，型 $(5/2,1/2)$。

在 $T^*M\otimes F$ 上取 $C=\sum_s I_s\otimes\Sigma_s$，联合 Casimir 展开给出 $G$ 上 $C=-4$、补上 $C=6$，故 $P_G=(6-C)/10$ 是平行正交投影（02-preliminaries.tex:265--271）。$F$ 的丛曲率在对角化点是 $F_{ik}=\frac12\sum_s(1+t_s)I_{s,ik}\Sigma_s$（02-preliminaries.tex:272--276）。对 $CZ=-4Z$ 取协变散度，用 $I_s$ 的斜性换出对换子并借助 $\sum_{ik}I_{s,ik}I_{r,ik}=4\delta_{sr}$，得
\[
 -4\Delta T=\sum_s(1+t_s)\Sigma_s^2T=-24T+24B_F(T)T=-24(T-N),
\]
即 $\Delta T=6(T-N)$，$N=(T^2)_0=T^2-2v^2\operatorname{Id}$（02-preliminaries.tex:277--282）。再对这条方程求导：$\nabla N=2B_F(T)Z$，逐指标对易公式
\[
 \Delta Z_j=\nabla_j\Delta T+\nabla^i(F_{ij}T)+F_{ij}\nabla^iT+\operatorname{Ric}_{ja}Z_a
\]
（02-preliminaries.tex:284--292）。$F$ 作为无散 Riemann 曲率的导出作用，散度为零；微分方程项贡献 $6Z-12B_F(T)Z$，Ricci 项贡献 $3Z$，剩下丛项是 $-\sum_s(1+t_s)I_s\Sigma_sZ$，其常数部分是 $-CZ=4Z$（02-preliminaries.tex:293--298）。左侧已在 $G$ 中，所以可以把右侧压到 $G$ 上算，尽管各别加项未必保 $G$；引理 3 给 $P_GB_F(T)P_G=Q_{5/2}(T)$，$G$ 上总正生成元是 $I_s+\Sigma_s$，于是 $40Q_{5/2}(T)=P_G\sum_st_s(I_s+\Sigma_s)^2P_G$，其中 $I_s^2$ 项因 $\sum_st_s=0$ 消失，$\Sigma_s^2$ 项压成 $24Q_{5/2}(T)$，交叉项压成 $8Q_{5/2}(T)$；常数合计 $13$，曲率合计 $-20Q_{5/2}(T)$，得
\[
 \Delta Z=(13-20B_{\mathrm{op}})Z,\qquad B_{\mathrm{op}}=Q_{5/2}(T)
\]
（02-preliminaries.tex:299--315）。对非对角 $T$，同一计算用对称收缩 $\sum_{r,s}T_{rs}(I_r+\Sigma_r)(I_s+\Sigma_s)$，$I_rI_s$ 部分因对称与无迹归零，于是整个计算是张量性的，没有任何一步在微分移动特征标架（02-preliminaries.tex:316--320）。回看第 0 节说的纪律：如果我在写 $F_{ik}$ 时对逐点特征标架求导，会凭空多出无法配平的三阶项，这条张量性注记就是那两次返工换来的。

梯度参数化把 $Z$ 拆成三个向量。在 $\{v>0\}$ 上对角化 $T$，写 $t_i=vs_i$，$\widetilde s_i=(s_j-s_k)/\sqrt3$，$\sigma=\frac16\sum_is_i^3$，$\rho=\frac16\sum_is_i^2\widetilde s_i$；$\sum s_i=0$、$\sum s_i^2=6$，映射 $s\mapsto\widetilde s$ 是零和平面上的斜自伴四分之一转，给出 $\sum_i\widetilde s_i=0$、$\sum\widetilde s_i^2=6$、$\sum s_i\widetilde s_i=0$、$s_i^2+\widetilde s_i^2=4$，并推出 $\sigma^2+\rho^2=1$、$N/v^2=\operatorname{diag}(\sigma s_i+\rho\widetilde s_i)$、$\frac16\sum\widetilde s_i^3=-\rho$（02-preliminaries.tex:334--357）。若 $r=x/v$，其余两个特征值和为 $r$、积为 $r^2-3$，故 $1\le r\le2$、$\sigma=(3r-r^3)/2$（02-preliminaries.tex:362--368）。参数化引理断言存在唯一向量 $k,l$ 使
\[
 Z_{ii}=s_ip-\sqrt3\,\widetilde s_i k,\qquad
 Z_{jk}=-I_i\left(l+s_ik+\frac{\widetilde s_i}{\sqrt3}p\right),\qquad
 e=\frac53\lvert p\rvert^2+5\lvert k\rvert^2+\lvert l\rvert^2,
\]
$(i,j,k)$ 循环，$p=\nabla v$，$e=\lvert\nabla T\rvert^2/6$（02-preliminaries.tex:383--398；$\nabla\lvert T\rvert^2=12vp$ 的辨识在 02-preliminaries.tex:425--428）。证明用四元数乘法把三条散度方程凝成 $D_i+a_j-a_k=0$ 一个等式（02-preliminaries.tex:401--407）。能量恒等式 $\sum_i\lvert Z_{ii}\rvert^2=6\lvert p\rvert^2+18\lvert k\rvert^2$、$2\sum_{j<k}\lvert Z_{jk}\rvert^2=4\lvert p\rvert^2+12\lvert k\rvert^2+6\lvert l\rvert^2$，除以 $6$ 得 $e$ 的表达式（02-preliminaries.tex:418--424）。系数 $\frac53$ 就是精化 Kato 不等式 $\lvert\nabla T\rvert^2\ge\frac53\lvert\nabla\lvert T\rvert\rvert^2$ 的出处，同一条估计 Gursky--LeBrun 从相同的不可约 Bianchi 梯度约束导过（02-preliminaries.tex:374--379）。我在这里做了一个后来被证明重要的保守决定：$k,l$ 两个多余参数一个都不丢。论文原话是范数梯度能量之外的盈余在耦合估计里还要用到（02-preliminaries.tex:379--382），事实确实如此，$e_0=\frac53\lvert p\rvert^2$、$e_d=e-e_0$ 的亏损分解撑起了 §14 的四次项放缩。

## §6 零点关：弱范数方程与磨光收敛

代数顺了，分析上还剩一颗钉子：块可以为零。$\Delta v$ 的方程里有 $(e-\lvert p\rvert^2)/v$，在 $\{v=0\}$ 上无定义。我最初的处理是想当然地在 $\{v>0\}$ 上积分然后说零测集无所谓，这个念头被 02-preliminaries.tex:430--493 整段否定了：磨光拉普拉斯的弱极限可能携带支撑在零集上的测度，"无所谓"会真的丢东西。

正确的做法是命题（02-preliminaries.tex:435--447）：把 $e/v$ 在 $\{v=0\}$ 上定义为 $0$，它属于 $L^1(M)$，并且
\[
 \Delta v=6v(1-\sigma v)+\frac{e-\lvert p\rvert^2}{v}
\]
作为带 $L^1$ 密度的分布等式成立；商在零集上几乎处处为零；该等式可以对有界 Lipschitz 函数做检验。$b$ 一侧全部同样成立。证明的路线我先在 $\{v>0\}$ 上配对 $\Delta T$ 与 $T$ 得 $\Delta(v^2)=12(v^2-\sigma v^3)+2e$，这是全局光滑函数恒等式（02-preliminaries.tex:449--453）。取 $v_\varepsilon=\sqrt{v^2+\varepsilon^2}$，直接微分得
\[
 \Delta v_\varepsilon=\frac{6(v^2-\sigma v^3)}{v_\varepsilon}+q_\varepsilon,\qquad
 q_\varepsilon=\frac{e}{v_\varepsilon}-\frac{v^2\lvert p\rvert^2}{v_\varepsilon^3},
\]
而梯度参数化的能量关系给出双侧界 $\frac25\frac{e}{v_\varepsilon}\le q_\varepsilon\le\frac{e}{v_\varepsilon}$（02-preliminaries.tex:455--467）。这些陈述几乎处处成立，包括零集：光滑分量在其零集上导数几乎处处为零，因此在 $\{T=0\}$ 上 $Z=0$ 几乎处处成立；论文补了一个我很喜欢的初等论证：在水平集的密度点上看，非零导数会让该纯量水平集成为局部超曲面（02-preliminaries.tex:468--473）。

接下来是一手干净的积分学：$\Delta v_\varepsilon$ 首项绝对值一致有界于 $6(v+v^2)$，其积分等于 $q_\varepsilon$ 积分之负，故 $\mathbf E(e/v_\varepsilon)$ 一致有界，单调收敛给出 $e/v\in L^1$；离零集用受控收敛，零集上两侧皆零，所以极限是真实的 $L^1$ 密度、而不止是测度的弱极限；$v_\varepsilon\to v$ 一致，拉普拉斯按分布收敛，残异测度被排除（02-preliminaries.tex:474--487）。最后用局部磨光加单位分解把有界 Lipschitz 检验函数按一致与 $H^1$ 双收敛逼近，配对待 $L^1$ 右侧、梯度配对走 $H^1$（02-preliminaries.tex:488--492）。另一处呼应：多项式乘积 $\sigma v^3=\operatorname{tr}(T^3)/6$ 有穿越零集的自然延拓，归一量只在块非零处使用（02-preliminaries.tex:369--372）。这条"只延拓多项式乘积、不承诺商连续"的纪律，我在 §14 的零集延拓里还会再用到一次。

回头看，这一节我返工过两轮。第一轮是在 $\{v>0\}$ 上写方程、把 $\{v=0\}$ 当零测集扔掉，忽略了乘法因子在零集上可以携带奇异测度；第二轮是承诺了不该承诺的东西，想让 $\sigma$ 与 $e/v$ 在零集上连续，这在特征值重排处根本做不到。磨光收敛那一步的价值在于它两头都守住：极限是 $L^1$ 密度（测度通道干净），检验类只放宽到有界 Lipschitz（对偶通道够用）。§15 把三次估计延到真实零集时用的正是这一套语言：商取 §6 约定的零值，导数参数在零集几乎处处归零，奇异系数从不被要求连续（06-coupling.tex:596--613）。

## §7 三个标量全局工具：加权方差、尖锐 Sobolev、外尔间隙

03-analytic.tex 开篇就把分工交代清楚：一类是外尔块尺寸的分析界，用来在耦合不等式里控制导数；一类是把二次矩与体积、调和数联系起来的整数恒等式，用来限制两块的失衡（03-analytic.tex:4--8）。加权方差论证与外尔间隙的完整证明被特意留在正文，因为它们的精确权重与零点行为会被双块论证直接调用（03-analytic.tex:14--16）。

加权方差命题（03-analytic.tex:20--29）：对每个实函数 $a\in H^1(M)$，
\[
 \operatorname{Var}(a):=\mathbf E\bigl[(a-\mathbf E a)^2\bigr]\le\mathbf E\frac{\lvert\nabla a\rvert^2}{K},\qquad K=4+v^2+b^2 .
\]
证明的骨架是一条 Bochner 链。先对光滑 $\phi$ 记 $S=\operatorname{Hess}_0\phi$，积分 Bochner 恒等式配 $\operatorname{Ric}=3g$ 得 $\mathbf E[(\Delta\phi)^2]=\mathbf E(4\lvert\nabla\phi\rvert^2+\tfrac43\lvert S\rvert^2)$（03-analytic.tex:33--38）。再在二张量上定义 $T_D,U_D$（03-analytic.tex:40--46）：在对称无迹张量上，九个 $I_iJ_j$ 构成正交基，$T_D,U_D$ 的特征值恰是 $t_i,u_j$，例如 $T_D$ 作用是 $-\frac12\sum_st_sI_s(\cdot)I_s$，四元数关系给出 $I_iJ_j$ 上特征值 $t_i$（03-analytic.tex:48--54）。于是 $T_D+U_D\le 2(x+y)\operatorname{Id}<4\operatorname{Id}$（03-analytic.tex:56--58）。曲率缩并的积分有符号也有精确系数：利用 $\nabla_k(T_D)_{ikjl}=0$ 与 $i,k$ 斜性换序，$\mathbf E\langle T_DS,S\rangle$ 化成 $\frac12\mathbf E(T_D)_{ikjl}R_{ikja}\phi_a\phi_l$，反对块与正块正交，$\frac12\sum_{ikj}(T_D)_{ikjl}R_{ikja}=3v^2\delta_{la}$，汇总 $\mathbf E\langle(T_D+U_D)S,S\rangle=3\mathbf E[(v^2+b^2)\lvert\nabla\phi\rvert^2]$（03-analytic.tex:60--85）。把这个正项插进 Bochner 的 $\lvert S\rvert^2$，得 $\mathbf E(\Delta\phi)^2\ge\mathbf E K\lvert\nabla\phi\rvert^2$（03-analytic.tex:86--90）。最后对 $\Delta\phi=a-\mathbf E a$ 的零均值光滑解分部积分，用逐点权重 $K$ 做 Cauchy--Schwarz，除以方差，再用局部磨光的 $H^1$ 稠密性收尾（03-analytic.tex:92--113）。我读这里的收获是权 $K$ 的来历：它把谱边界 $x+y<2$ 折成 $4$，把两块范数折成 $v^2+b^2$，方差不等式天生就是给 §12 与 §15 用的。

尖锐 Sobolev 命题（03-analytic.tex:125--132）：对每个实 $f\in H^1(M)$，$(\mathbf E\lvert f\rvert^4)^{1/2}\le\mathbf E(f^2+\frac12\lvert\nabla f\rvert^2)$。这是 Ilias 正 Ricci 尖锐 Sobolev 不等式的四维 Einstein 情形（03-analytic.tex:118--120），完整证明在附录 A（appendix-a-analytic.tex:59--170）。变分链条：固定 $2<s<4$，在 $\mathbf E\lvert w\rvert^s=1$ 下极小化 $Q_s(w)$（appendix-a-analytic.tex:68--73）；$H^1$ 有界、$L^s$ 紧嵌入、下半连续给出非负极小元，常数试验函数给 $m_s\le1$（appendix-a-analytic.tex:74--81）；Euler 方程 $-\Delta w+2w=2m_sw^{s-1}$ 经缩放化为 $-\Delta u+2u=2u^{s-1}$（appendix-a-analytic.tex:82--86）。正则性这一长段是我认为全附录最扎实的部分：先用强 Dirichlet 可解性把弱极小元推进 $W^{2,r_0}(B)$，$r_0=\min\{2,4/(s-1)\}>4/3$，维数四的 Sobolev 嵌入让 $w_D\in H^1_0(B)$，差 $z-w_D$ 被能量法逼零（appendix-a-analytic.tex:88--112）；然后迭代提升，$u\in L^q$ 推右端进 $L^p$，$1/p=1/q+1/r$，每轮改进一个固定正量直到 $p>2$ 得有界（appendix-a-analytic.tex:113--120）；再求导得 $W^{3,p}$ 与 $C^{2,\alpha}$，强极大原理给 $u>0$，紧性给正下界，此后随便求导都光滑（appendix-a-analytic.tex:121--138）。极值识别用一个巧妙的倒置量：令 $F=1/u$，方程变成 $F\Delta F-2\lvert\nabla F\rvert^2+2F^2=2F^{4-s}$，配合 $\operatorname{div}(\operatorname{Hess}_0F)=\frac34d(\Delta F+4F)$，算出 $\operatorname{div}(F^{-3}\operatorname{Hess}_0F)=\frac32(4-s)F^{-1-s}dF$；与 $dF$ 配对积分，$-\mathbf E F^{-3}\lvert\operatorname{Hess}_0F\rvert^2=\frac32(4-s)\mathbf E F^{-1-s}\lvert dF\rvert^2$，两边符号相反，只能 $dF=0$，$u\equiv1$，$m_s=1$（appendix-a-analytic.tex:140--163）。最后用 $H^1\subset L^4$ 与受控收敛令 $s\uparrow4$ 回到临界指标（appendix-a-analytic.tex:165--169）。为什么绕 $s<4$：亚临界嵌入紧，极小元存在；临界情形直接极小化可能丢质量。

外尔间隙命题（03-analytic.tex:139--149）：每个块满足 $v\equiv0$ 或 $\mathbf E v^2\ge1$；若 $T$ 非零且 $\mathbf E v^2=1$，则 $\nabla T=0$ 且 $v=\sigma=1$。证明用磨光幂 $f_\varepsilon=(v^2+\varepsilon^2)^{1/6}$：由 $\Delta(v^2)$ 方程与 $\sigma\le1$、$e\ge\frac53\lvert p\rvert^2$，得
\[
 \Delta f_\varepsilon=A_\varepsilon^{-5/6}\Bigl[2(v^2-\sigma v^3)+\frac13e-\frac59\frac{v^2}{A_\varepsilon}\lvert p\rvert^2\Bigr]\ge 2A_\varepsilon^{-5/6}(v^2-v^3),
\]
乘 $f_\varepsilon$ 积分得能量一致界，$f=v^{1/3}\in H^1$，全程不需要 $v$ 有正下界（03-analytic.tex:151--177）。把 $f_\varepsilon$ 喂进尖锐 Sobolev，注意 $\varepsilon^2/A_\varepsilon^{2/3}\le\varepsilon^{2/3}$，受控收敛给出 $(\mathbf E f^4)^{1/2}\le\mathbf E(f^2v)\le(\mathbf E f^4)^{1/2}(\mathbf E v^2)^{1/2}$，消去正公因子就是间隙（03-analytic.tex:179--201）。取等链条：Cauchy--Schwarz 取等迫使 $v=\alpha f^2$，于是 $v$ 只取 $0$ 与 $\alpha^3$ 两值，连续性与连通性逼出常值，矩条件给 $v=1$，弱范数方程化为 $0=6(1-\sigma)+e$，两个非负项各自归零，光滑性给 $\nabla T=0$（03-analytic.tex:203--211）。这条"取等迫使平行"是 §17 的伏笔：范数一旦常值，两条间隙与 $v+b<2$ 就再无回旋余地。

## §8 特征恒等式：热超级迹把整数变成积分

命题（03-analytic.tex:216--236）：设 $n_+,n_-$ 是调和自对偶与反自对偶二形式空间的有限非负整数维数，则 $\chi=2+n_++n_-$、$\tau=n_+-n_-$，并且
\[
 8\pi^2\chi=6\operatorname{Vol}(M)\bigl(1+\mathbf E(v^2+b^2)\bigr),\qquad
 12\pi^2\tau=6\operatorname{Vol}(M)\,\mathbf E(v^2-b^2);
\]
还有 $U=0$ 蕴含 $n_-=0$、$T=0$ 蕴含 $n_+=0$。这两式是全篇仅有的把积分量兑换成整数的通道，§12 的奇偶排除完全由它们供给。

附录 A 用 McKean--Singer 的热超级迹法做这笔兑换（appendix-a-analytic.tex:172--245）。核心是一个椭圆复形 $\Lambda^0\xrightarrow{d}\Lambda^1\xrightarrow{\sqrt2\,d^+}\Lambda^+$，三个 Laplace 算子恰是相应丛上的 Hodge Laplace 算子，写成 $-\Delta+E$ 后势为 $E_0=0$、$E_1=3\operatorname{Id}$、$E_+=4\operatorname{Id}-2T$，交错热迹等于 $1+n_+$（appendix-a-analytic.tex:207--222）。中间算子的验证：$dd^*+2(d^+)^*d^+=dd^*+d^*d+d^*\!\star d$，末项由 $d^2=0$ 与余微分公式归零；自对偶二形式上 Hodge 星交换 $dd^*$ 与 $d^*d$，于是 $2P_+dd^*$ 就是它们之和（appendix-a-analytic.tex:224--234）。正块势的计算把 $\eta=\sum_s\eta_sI_s/\sqrt2$ 的 Hodge 能量展开成 $C=\sum I_s\otimes\Sigma_s$ 的配对，积分后取斜导数对易子得势 $-\frac12\sum_s(1+t_s)\Sigma_s^2=4\operatorname{Id}-2T$（appendix-a-analytic.tex:237--257）。核的账：常数函数一维；调和一式被 $0=\mathbf E(\lvert\nabla\eta\rvert^2+3\lvert\eta\rvert^2)$ 逼零；末项核维数 $n_+$；正特征空间中复微分与 Laplace 交换、除以特征值得同伦算子，有限维复形的交错维数归零，热迹只剩核贡献 $1+n_+$（appendix-a-analytic.tex:259--271）。

局部系数引理（appendix-a-analytic.tex:273--285）：常数次项（含因子 $(4\pi)^{-2}$）是 $\frac1{16\pi^2}\bigl(\frac12\operatorname{str}E^2+\frac1{12}\operatorname{str}\sum_{k,i}\Omega_{ki}^2\bigr)$。证明是标准算子参数法加径向平行标架的输运方程（appendix-a-analytic.tex:288--322），我复读到三处干净的抵消值得记：$\operatorname{str}\operatorname{Id}=1-4+3=0$ 与 $\operatorname{str}E=-12+\operatorname{tr}(4\operatorname{Id}-2T)=0$ 逐点成立（appendix-a-analytic.tex:332--337）；一切 $A_i$ 的线性项因斜性在每个丛内迹零；中心处 $A_i(0)=0$、$\sum_i\partial_iA_i(0)=\frac12\sum_i\Omega_{ii}(0)=0$，所以 $U_1(0)=c\operatorname{Id}-E(0)$，附加联络项自动消失（appendix-a-analytic.tex:371--380）。数字盘点（appendix-a-analytic.tex:411--440）：$\operatorname{str}E^2=12+24v^2$；一式上 $\operatorname{tr}\sum\Omega^2=-24(1+v^2+b^2)$；正二形式上 $-24(1+2v^2)$；标量丛平坦；合计 $\operatorname{str}\sum\Omega_{ki}^2=24(b^2-v^2)$；带符号密度 $\frac1{16\pi^2}(6+10v^2+2b^2)$。与常数热迹对比得 $16\pi^2(1+n_+)=\operatorname{Vol}(M)\mathbf E(6+10v^2+2b^2)$，反向取向得到 $n_-,b,v$ 交换的同类式，两式加减正好凑出命题的恒等式组（appendix-a-analytic.tex:441--451）。零块核消失：$U=0$ 时调和反自对偶形式的能量是 $\mathbf E(\lvert\nabla\eta\rvert^2+4\lvert\eta\rvert^2)$，只能是零（appendix-a-analytic.tex:452--457）。拓扑整数的 Hodge 识别不依赖单连通（appendix-a-analytic.tex:399--409），所以这套恒等式在 §9 的拓扑引理之前就合法，这个循环次序我在通读时专门核对过。

## §9 上极体积亏：离散 Jacobi 行列式保住顺序

目标不等式：$V_M/(8\pi^2/3)\le1-\frac{3}{40}s_0$，$s_0=\mathbf E(v^2+b^2)$（04-volume.tex:4--24）。引言的分工说明提过 Cheng 的 Riccati 论证不需要不同时刻的曲率矩阵可交换，而本文的径向估计用离散 Jacobi 行列式保住沿每条测地线曲率矩阵的乘法顺序（01-introduction.tex:161--163；04-volume.tex:11--16）。

用法预告在 04-volume.tex:26--34：双块非零时间隙加 $v+b<2$ 给 $2\le s_0<4$，特征恒等式与亏量界立刻推出 $\chi<7$ 与 $\lvert\tau\rvert/\chi<4/15$，奇偶与非负约束下只剩 $(\chi,\lvert\tau\rvert)=(5,1)$，本节末尾把这一情形也否掉。

设置：沿单位速测地线取平行正交法标架，$\mathcal R(t)$ 为法 Jacobi 曲率矩阵，$A=\mathcal R-\mathrm{Id}$，$\mathcal J''+\mathcal R\mathcal J=0$、$\mathcal J(0)=0$、$\mathcal J'(0)=\mathrm{Id}$、$D=\det\mathcal J$；严格正与归一给 $0<\mathcal R<3\mathrm{Id}$、$\operatorname{tr}A=0$；$\mathcal E$ 表示对单位切丛积分（04-volume.tex:36--48）。测地平均引理（04-volume.tex:50--87）：$\mathcal E\lvert A\rvert^2=\frac32s_0$，$\mathcal E\lvert A'\rvert^2\le\frac32\mathcal E\lvert A\rvert^2$。证明先说 Liouville：动能 Hamilton 流的散度由混合二阶导相等而消失，能量壳上测度在测地流下不变（04-volume.tex:58--66）；$A$ 的正负两部分是 $T/2,U/2$ 在基 $I_s\dot\gamma,J_s\dot\gamma$ 下的正交共轭表达式，混合缩并是类型 $(2,0)$ 与 $(0,2)$、或 $(5/2,1/2)$ 与 $(1/2,5/2)$ 之间的不变双配对，球面积为零（04-volume.tex:67--72）；于是 $\mathcal E\lvert A\rvert^2=\frac14\mathbf E(\lvert T\rvert^2+\lvert U\rvert^2)$，$\mathcal E\lvert A'\rvert^2=\frac1{16}\mathbf E(\lvert\nabla T\rvert^2+\lvert\nabla U\rvert^2)$，第二个 $1/4$ 是四维方向导数平方的球平均（04-volume.tex:73--81）；积分 $\Delta T$ 方程得 $\mathbf E e=6\mathbf E(\sigma v^3-v^2)\le6\mathbf E v^2$，交换侧同理（04-volume.tex:82--87）。

拓扑输入是 Myers、Synge、Klingenberg 的经典定理：直径 $\le\pi$、注入半径 $\ge\pi/\sqrt3$、单连通、极小段内部无共轭点，甚至允许端点共轭（04-volume.tex:98--106；完整证明 appendix-b-topology.tex:21--108）。指数形式 $I(Y,Y)=\int_0^L(\lvert Y'\rvert^2-\langle\mathcal RY,Y\rangle)dt$（appendix-b-topology.tex:22--26）；三个平行法单位场乘 $\sin(\pi t/L)$ 求和得 $\frac{3L}{2}(\frac{\pi^2}{L^2}-1)$，极小段长不超过 $\pi$（appendix-b-topology.tex:27--33）；内部共轭点由零指标 Jacobi 场延零、配跳跃对偶排除（appendix-b-topology.tex:34--40）。注入半径一侧：$\mathcal R<3\mathrm{Id}$ 加 Dirichlet Poincaré 给 $L\le\pi/\sqrt3$ 时端点归零场指标为正（appendix-b-topology.tex:42--44）；假设割半径下确界 $c$ 偏小，取极限得共端点的两条长 $c$ 极小段，端速度必相反，否则把 $q$ 沿 $-(u_1+u_2)$ 移动，两分支一阶长度变化同为 $-(1+\langle u_1,u_2\rangle)<0$（appendix-b-topology.tex:45--75）；两条首尾相接的光滑闭测地线的法和乐在 $\mathrm{SO}(3)$ 中有非零不动向量，取周期平行法场 $V$ 做变分，切向分量仿射且边界归零，$W=V-J$ 边界归零、$I(J,W)=0$、$I(W,W)\ge0$，于是 $I(J,J)\le I(V,V)=-\int\langle\mathcal RV,V\rangle<0$，两分支同时缩短，矛盾（appendix-b-topology.tex:76--95）；非平凡自由同伦类有最短代表元，同一和乐论证给出基本群平凡（appendix-b-topology.tex:97--108）。取向在这里被真正用到（appendix-b-topology.tex:15--16）。

上极界（04-volume.tex:111--141）：$V_M\le2\pi^2\int_0^\pi\mathcal E D_c(t)dt$，$D_c$ 在首个共轭时刻后截为零。开集取所有长小于 $\pi$、径向测地线至终点无共轭点的向量，$D(t)/t^3$ 的延拓给出开性；每个点都是长 $\le\pi$ 极小向量的指数像；带重数的面积公式说绝对 Jacobi 的积分控制像的体积，临界向量与边界球的像为零体积，割向量中非共轭者本就落在开集内。我早先在这里犯的错是把割点与共轭点混为一谈，04-volume.tex:133--137 那句"不使用割点与共轭点的任何等同"就是对我这种直觉的纠偏。

离散 Jacobi 行列式引理（04-volume.tex:152--211）：固定光滑对称法曲率矩阵，步长 $a=t/N$，$\mathcal L_N$ 为块三对角，对角块 $2\mathrm{Id}-a^2\mathcal R(ia)$、侧对角块 $-\mathrm{Id}$，则 $a^3\det\mathcal L_N\to D(t)$；预共轭时 $\mathcal L_N$ 对大 $N$ 正定；系数与一阶导一致有界的族上收敛一致。证明的次序感很强：先用完全不涉逆的递推 $Y_{i+1}=(2\mathrm{Id}-a^2\mathcal R(ia))Y_i-Y_{i-1}$ 逼近位置与速度，单步误差 $O(a^2)$、放大 $1+Ca$；再证可逆性，远离零靠精确解的有界逆，近零靠恒等式 $Y_i=i\mathrm{Id}-a^2\sum_{r<i}(i-r)\mathcal R(ra)Y_r$ 吸收误差得 $Y_i/i=\mathrm{Id}+O((ia)^2)$；所有消元需要的逆此时已独立取得，Schur 块 $S_i=Y_{i+1}Y_i^{-1}$ 正定，$\det\mathcal L_N=\prod\det S_i=\det Y_N$；任意系数由稠密性与连续性兜底（04-volume.tex:165--210）。

上径向比较（04-volume.tex:213--275）：$\beta=t^2/(\pi^2-t^2)$，$B=\frac2t\int_0^tA(s)\sin^2(\pi s/t)ds$。预共轭时 $D(t)\le\sin^3t\det(\mathrm{Id}-\beta B)$ 且 $\mathrm{Id}-\beta B\succeq0$；任意时刻 $1-D_c(t)/\sin^3t\ge\frac16\min\{1,\beta^2\max(1,3-\beta)\}\lvert B\rvert^2$。证明把 $\mathcal L_N$ 用 $\mathcal R=\mathrm{Id}$ 的比较矩阵归一化，正弦模特征值 $2-2\cos(k\pi/N)-a^2$ 为正，每个对角正弦块的迹为 $3$ 因为 $\operatorname{tr}A=0$（04-volume.tex:230--237）；切出首模后 $\det\binom{P\ C}{C^*\ Q}=\det P\det(Q-C^*P^{-1}C)\le\det P\det Q\le\det P$，末两步分别用 Schur 正性与 AM--GM（04-volume.tex:238--246）；首模压缩极限是 $\mathrm{Id}-\beta B$，因为 $a^2/(2-2\cos(\pi/N)-a^2)\to\beta$（04-volume.tex:247--256）。损失端：$B$ 的特征值在 $[-1,2]$ 内和为零，$\lvert B\rvert^2\le6$；$\det B<0$ 时写特征值 $-r,a_1,a_2$，由 $(a_1-a_2)^2\ge0$ 得 $\lvert\det B\rvert\le\frac r6\lvert B\rvert^2$，又 $r\le1$、$\beta r\le2$，代入 $\frac{\beta^2}{2}\lvert B\rvert^2+\beta^3\det B$ 即得亏量界（04-volume.tex:258--275）。为什么要绕离散化：我最初想让 $\mathcal R(t)$ 沿测地线同时对角化，这要求不同时刻矩阵两两交换，一般根本不成立；块三对角把顺序保留在矩阵乘法里，Schur 消元从不交换任何两个因子。

## §10 把常数有理化：正弦下界多项式与三行账

亏量命题的最后一公里没有解析学，只有有理算术。取 $a_0=157/50$、$b_0=22/7$，$S(z)=a_0z-\frac{(b_0z)^3}{6}+\frac{(a_0z)^5}{120}-\frac{(b_0z)^7}{5040}$。$a_0<\pi<b_0$，交错 Taylor 到负七次项给 $S(z)\le\sin(\pi z)$（$0\le z\le1/2$），下界 $S\ge z(a_0-\frac{b_0^3}{24}-\frac{b_0^7}{322560})\ge\frac95z$（04-volume.tex:282--306）。比较函数 $f$ 分段：$[0,5/8]$ 上 $u^4(3+5u^2+6u^4)$，之后封顶 $15/16$（04-volume.tex:309--314）。三行有理下界账（04-volume.tex:315--334）：被积式 $\frac{9a_0}{48}f(u)(1-u^2/2)S(\min(u,1-u))^3$ 在 $[0,1/2]$、$[1/2,5/8]$、$[5/8,1]$ 上的积分分别超过 $11869/10^6$、$30175/10^6$、$39518/10^6$，行间只共享端点不影响积分；三行之和大于 $163/2000>2/25$，且三次幂 $S^3$ 在每一行都不可省。

命题证明主线（04-volume.tex:336--366）：正弦平方概率权的时间方差是 $t^2(1/12-1/(2\pi^2))$，方差恒等式加测地平均给 $\mathcal E\lvert B\rvert^2\ge\mathcal E\lvert A\rvert^2$ 乘那个方差折减因子，推导靠平行输运识别与 $\mathcal E\lvert A(s)-A(r)\rvert^2\le(s-r)^2\mathcal E\lvert A'\rvert^2$（04-volume.tex:337--346）；以 $u=t/\pi$ 记，折减因子至少 $1-u^2/2$；$f(u)\le\min\{1,\beta^2\max(1,3-\beta)\}$ 的验证：$u\le5/8$ 时与 $\beta^2(3-\beta)$ 比较归结为 $6-13u^2+6u^4\ge0$，$f$ 在该段递增且 $f(5/8)=7511875/8388608<1$，比较函数对 $u$ 单调、触顶后恒为 $1$，$u=5/8$ 处取值 $57500/59319>15/16$ 接住后段（04-volume.tex:348--357）；把极体积界与径向亏量合起来，从圆球体积救出的 $s_0$ 系数至少
\[
 \eta_+=\frac{9\pi}{48}\int_0^1f(u)(1-u^2/2)\sin^3(\pi u)du ,
\]
三行有理账给 $\eta_+>2/25>3/40$，亏量命题成立（04-volume.tex:357--364）。

我对这段的评价：$3/40$ 并非最优，$2/25$ 的积分已经更强，$3/40$ 只是留给 §12 的整数论证刚好够用。$\min\{1,\beta^2\max(1,3-\beta)\}$ 这种形状第一眼很丑，但它是在 $u=1$ 处与行列式损失 $\frac{\beta^2}{2}\lvert B\rvert^2+\beta^3\det B$ 的实际量级相容、又能被多项式从下方顶住的全局表达式；封顶 $15/16$ 与分段点 $5/8$ 的选择让三段多项式的次数停在 $23$ 到 $31$，恰好是有理积分还能手写的规模。

## §11 矩障碍引理：从约束概率测度到两个支撑点

体积亏到手后还差最后一击，工具是一个纯一维的矩问题。定义（$0\le z\le2$）：$H(z)=\sqrt z\bigl(1+\frac{z^2}{40}-\frac{z^4}{1152}\bigr)$，$\Phi(z)=16H(z)^2+9z(1-z)$（04-volume.tex:378--382）。障碍引理（04-volume.tex:384--394）：每个满足 $\int z^2d\mu\ge1$、$\int(28z+6z^2)d\mu\le25$ 的 $[0,2]$ 上概率测度 $\mu$ 都使 $16\bigl(\int H\,d\mu\bigr)^2-\int\Phi\,d\mu<0$。

证明分五步，我把每步的动机都还原出来了。第一步定标尺（04-volume.tex:396--412）：可行测度弱紧凸，设 $J(\mu)=16(\int H)^2-\int\Phi$ 取非负最大于 $\mu$，记 $d=\int H\,d\mu$。两条多项式不等式 $1+z^2/40-z^4/1152\ge1+\frac{31}{1440}z^2$ 与 $25+\frac{31}{45}z^2-\frac{346}{25}z\ge\frac{17}{225}>0$（后者在 $[0,2]$ 递减、验证在 $z=2$）合成出 $\Phi(z)\ge16(11/20)^2z^2$，再由矩约束与 $J(\mu)\ge0$ 逼出 $d\ge11/20$。第二步线性化（04-volume.tex:414--423）：对可行 $\nu$ 直接展开，取 $\ell=32dH-\Phi$，得 $J((1-t)\mu+t\nu)-J(\mu)=t(\int\ell d\nu-\int\ell d\mu)+16t^2(\int H d\nu-d)^2$；令 $t\downarrow0$，极大性迫使 $\mu$ 最大化线性泛函 $\int\ell$。论文明确标注这一步不需要 $J$ 凹，我认为这是整个证明最省力的一着。第三步分离（04-volume.tex:425--447）：先把可行域打开，两点支撑测度（质量 $9/32$ 在 $2$、其余在 $0$）让两条约束严格负（$-5/2$ 与 $-1/8$）；三元组集合 $\bigl(\int g_1d\nu,\int g_2d\nu,\int\ell d\nu\bigr)$（$g_1=28z+6z^2-25$、$g_2=1-z^2$）与开集 $\{\text{前坐标负、第三坐标}>\int\ell d\mu\}$ 分离，给系数 $-\alpha,-\gamma,\beta$，$\beta$ 非零归一为 $1$，$\mu$ 支撑落在
\[
 F_d(z)=32dH(z)-\Phi(z)-\alpha(28z+6z^2)-\gamma(1-z^2)
\]
的整体极大点上。第四步三阶导控制（04-volume.tex:451--483）：$H'''(z)=L(z)z^{-5/2}$，$L(z)=\frac38+\frac{3z^2}{64}-\frac{35z^4}{1024}$，$\Phi'''(z)=V(z)=\frac{24}{5}-\frac{16z^2}{15}-\frac{7z^4}{48}+\frac{7z^6}{1152}$；换成 $x=\sqrt{z/2}$ 后验证 $L(2x^2)>0$ 与 $D_*(x)=\frac{88}{5}L(2x^2)-\frac{17}{3}x^5V(2x^2)>0$，配合 $32d\ge88/5$ 与 $4\sqrt2<17/3$，在 $V\ge0$ 处推出 $32dL-z^{5/2}V>0$，$V<0$ 处更直接；约束项三阶导为零，于是 $F_d'''>0$ 在 $(0,2]$ 成立。加上 $F_d'(0+)=+\infty$、$F_d''$ 严格增，$F_d'$ 至多从正穿负一次：内部极大点至多一个，极大区间不可能，$0$ 非极大。点质量也不可行（单点矩条件逼 $z\ge1$，那 $28z+6z^2\ge34$），支撑只能是 $\{w,2\}$，$0<w<1$，在 $2$ 上的权重 $t$ 被夹在
\[
 t_-(w)=\frac{1-w^2}{4-w^2}\le t\le t_+(w)=\frac{25-28w-6w^2}{80-28w-6w^2},
\]
区间非空等价于 $(2-w)(10-37w)\ge0$，即 $0<w\le10/37$。第五步端点验负（04-volume.tex:484--557）：固定 $w$，$J$ 是 $t$ 的凸二次，最大在端点；两个端点值皆负等价于 $16t(1-t)(H(2)-H(w))^2>9((1-t)(w^2-w)+2t)$。代入 $x=\sqrt{w/2}\le37/100$ 与 $R_*(x)=1+\frac{x^4}{10}-\frac{x^8}{72}$，用 $H(2)-H(w)=\sqrt2(R_*(1)-xR_*(x))$，两组 $(A_\pm,B_\pm)$ 化成正系数检验：对 $p(r+(s-r)y)=\sum a_jy^j$ 取 $h_i=\sum_{j\le i}a_j\frac{\binom ij}{\binom ni}$，正的 $h_i$ 给出 $[r,s]$ 上的正性。凭证规模：$L(2x^2)$ 八次在 $[0,1]$ 界 $1/10$（实际最小系数 $1/64$）；$D_*$ 十七次分四段各界 $2/5$（最小系数 $2459668689/5793382400$）；$P_-$、$P_+$ 二十二次在 $[0,37/100]$ 各界 $1$，最小系数分别是分子四十三位的两个大分数（04-volume.tex:548--555）。全部输入有理，矛盾于 $J$ 的非负最大。

我在这条引理前卡过整整一天，错因是把 $\mu$ 想成 $b$ 的分布后用逐点不等式硬压，却忘了可行集本身是凸的，$J$ 对 $\mu$ 非凸这件事一开始让我以为要动集中不等式工具；其实极大元的支撑刻画加三阶导单调就把所有自由度压到了 $(w,t)$ 两个标量。

## §12 矩平衡：唯一残例 $(5,1)$ 的处决

命题（04-volume.tex:562--626）：若两个外尔块都不恒零，则 $\tau=0$ 且 $\mathbf E v^2=\mathbf E b^2$。证明是一条整数到解析的往返。先记账（04-volume.tex:566--575）：间隙与 $v+b<2$ 给 $2\le s_0<4$；特征恒等式与亏量界给
\[
 \chi\le2\bigl(1-\tfrac{3}{40}s_0\bigr)(1+s_0)<7,\qquad
 \frac{\lvert\tau\rvert}{\chi}=\frac23\frac{\lvert\mathbf E v^2-\mathbf E b^2\rvert}{1+s_0}\le\frac23\frac{s_0-2}{1+s_0}<\frac4{15},
\]
第一个多项式在 $[2,4]$ 递增、在 $4$ 处等于 $7$；$\chi=2+n_++n_-$ 与 $\tau=n_+-n_-$ 同奇偶，若 $\tau\ne0$ 只剩 $\chi=5$、$\lvert\tau\rvert=1$。交换块使 $P=\mathbf E b^2$ 为较小矩，恒等式比出 $\mathbf E v^2=\frac{13P+3}{7}$；配上逐点 $v^2<(2-b)^2$ 展开、再吃掉 $\mathbf E b^2=P$，得 $P\ge1$ 与 $28\mathbf E b+6P\le25$（04-volume.tex:576--587）。这两条正是障碍引理的约束形状：$z^2$ 矩 $\ge1$、一次加二次组合 $\le25$。

分析侧的输入是弱范数方程与方差的接力（04-volume.tex:589--615）：对 $b$ 积分 \eqref{3} 用法，用 $\bar\sigma\le1$ 与 $\bar e\ge\frac53\lvert\nabla b\rvert^2$，得 $P-\mathbf E b\ge\frac49\mathbf E\lvert\nabla\sqrt b\rvert^2$；$\bar e/b$ 的可积性经磨光给出 $c=\sqrt b\in H^1$。取 $G(c)=c+\frac{c^5}{40}-\frac{c^9}{1152}$，$H(b)=G(c)$，Sobolev 链式法则在有界范围与 $c=0$ 处都合法；关键导数界是 $G'(c)=1+\frac{b^2}{8}-\frac{b^4}{128}$，把它对 $z=b^2/4\in[0,1]$ 平方比较：正量 $1+z/2-z^2/8$ 的平方是 $1+z-z^3/8+z^4/64\le1+z$，于是 $G'\in[0,\frac{\sqrt{4+b^2}}{2}]\subseteq[0,\frac{\sqrt K}{2}]$。加权方差就此接上：$\operatorname{Var}(H(b))\le\frac14\mathbf E\lvert\nabla\sqrt b\rvert^2\le\frac9{16}(P-\mathbf E b)$，改写即 $J=16(\mathbf E H(b))^2-\mathbf E\Phi(b)\ge0$（04-volume.tex:616--621）。而 $b$ 的分布是满足两条约束的 $[0,2]$ 概率测度，障碍引理宣告 $J<0$，矛盾。$\tau=0$ 落定，恒等式再送回来就是两块二次矩相等。

复盘：$H$ 里那些 $z^2/40$、$z^4/1152$ 的系数是把 $G'$ 的界积回 $G$ 时倒推出的，40 与 $3/40$ 的亏量系数呼应；$\Phi$ 里 $9z(1-z)$ 则是方差链 $\frac9{16}$ 常数的镜像。整数论证只负责把无限维逼到一维矩问题，剩下的全是凸分析与有理算术，这个分工是我没预料到的：我以为会用到四维几何的更多细节，实际上体积与拓扑在这里已经退场，只剩下 $b$ 的分布。

## §13 加权 Hessian 不等式：一个局部平方如何吞掉二阶导数

从这一节起进入 05-hessian.tex。设定是双块皆非零，§12 给了 $\mathbf E v^2=\mathbf E b^2$，但本节论证本身不用这个平衡（05-hessian.tex:4--8）。记 $\delta=2-v-b$，$Z=\nabla T$，$p=\nabla v$，$q=\nabla b$，$e=\lvert Z\rvert^2/6$；对 $T$ 陈述，交换取向得 $U$ 的同伴（05-hessian.tex:12--16）。

第一个结构引理（05-hessian.tex:35--56）：写 $\mathcal H=T^*M\otimes G$、$X=\nabla Z$（$X_{ij}=\nabla_i\nabla_jT$），则 $X=Y+D_0$，$Y$ 型 $(3,1)$、$D_0$ 型 $(2,0)$；对两个导数槽求迹的算子 $\operatorname{Tr}$ 满足 $\operatorname{Tr}\operatorname{Tr}^*=\frac{12}{5}\mathrm{Id}$，且 $D_0=\frac5{12}\operatorname{Tr}^*\Delta T$、$\lvert D_0\rvert^2=\frac5{12}\lvert\Delta T\rvert^2$；所有类型投影平行。证明里我最欣赏对易子论证（05-hessian.tex:58--96）：乘积规则给四个不可约分量 $(3,1)\oplus(3,0)\oplus(2,1)\oplus(2,0)$；真实 Hessian 的斜差是 $[\nabla_i,\nabla_j]T=F_{ij}T$，关键是这里被作用的张量恰好就是 $F_{ij}$ 里出现的那个 $T$；$T$ 的对称平方含自旋 $4,2,0$，与 $\Lambda^+\otimes F$ 的公共类型只有 $(2,0)$，线性项也只在 $(2,0)$，所以斜对易子在 $(3,0)$ 与 $(2,1)$ 上无分量。剩下要证斜化在这两个定义分量上单射：$(3,0)$ 靠伸缩耦合的对称性；$(2,1)$ 用内部 Bianchi 约束 $\sum I_s^{(j)}\Sigma_s=-4$ 加对称性逼出总 Casimir $-48$、而总自旋 $2$ 要求 $-24$，矛盾（05-hessian.tex:86--96）。迹计算（05-hessian.tex:98--131）给 $\operatorname{Tr}^*S$ 的显式 $\frac35\delta_{ij}S+\frac1{10}\sum_sI_{s,ij}\Sigma_sS$，验证 $D_0$ 的斜部分恰为丛曲率作用 $\frac12\sum_s(1+t_s)I_{s,ij}\Sigma_sT$，其中用到 $\Sigma_rN=-\sum_sT_{rs}\Sigma_sT$ 的不变形式。这一整段是"先协变求导、后特征标架"纪律最吃紧的地方：任何一步偷懒微分了移动标架，$(3,1)$ 与 $(2,0)$ 的分解就崩了。

接着挑算子（05-hessian.tex:139--198）。把 $T_D,U_D,B_F$ 全部正交压缩到 $\mathcal H$，令 $\widetilde Q=\frac1{60}\sum_{r,s}T_{rs}\Sigma_r^{\mathrm{tot}}\Sigma_s^{\mathrm{tot}}$；内导数槽生成元压缩 $I_s^{(j)}=\Sigma_s^G/5$ 由等变性定标（最高权比 $(1/2)/(5/2)=1/5$），展开得 $T_D=3\widetilde Q-2Q_{5/2}(T)$，于是组合恒等式 $T_D+2B_F(T)=3\widetilde Q$ 恰好消掉内曲率作用（05-hessian.tex:140--162）。取
\[
 \mathcal P=4-\frac56\bigl(T_D+2B_F(T)\bigr)-U_D=4-\frac52\widetilde Q-U_D,
\]
在自由的 $(3,1)$ 上 $\widetilde Q=Q_3(T)\le4x/5$、$U_D\le2y$，正负损失分别界于 $2x,2y$，标量 $4$ 与截面边界 $x+y=2$ 对齐；论文明说这一选择并无症状唯一性（05-hessian.tex:163--171）。引理断言 $\mathcal P$ 保持四个类型、在 $(3,1)$ 正定：$\mathcal P\ge4-2x-2y>0$，在迹类型上 $\mathcal P\operatorname{Tr}^*=\operatorname{Tr}^*(4-B_F(T))$，各别槽分量和不必保类型（05-hessian.tex:173--198）。

主命题 (10)（05-hessian.tex:217--235）：对每个全局 Lipschitz 权 $m\ge m_0>0$，
\[
 0\le\mathbf E\Bigl[mG_v(p,k,l)-\frac56\sum_im_i\frac{\operatorname{tr}\bigl(Z_i\sum_jZ_j^2\bigr)}6+\frac{\langle\mathcal P(L_m)_Y,(L_m)_Y\rangle}{24m}\Bigr],
\]
$L_m=dm\otimes Z$ 不做对称化，$(L_m)_Y$ 是其 $(3,1)$ 投影，且
\[
 G_v=\Bigl(-42-3b^2-\frac{10}{3}v^2\Bigr)e+75B+\frac{25}{3}C_N-\frac{100}{3}E_B+5v^2\lvert p\rvert^2,
\]
$B=\langle B_F(T)Z,Z\rangle/6$、$C_N=\langle B_F(N)Z,Z\rangle/6$、$E_B=\lvert Q_{5/2}(T)Z\rvert^2/6$（05-hessian.tex:205--234）。证明的展开：平方项给正，剩余四项按 $\mathcal P$ 的系数 $4,-\frac52\widetilde Q,-U_D$ 与迹扣除逐项算。恒等项分部积分配方程 (1) 得 $\mathbf E[m(-13e+20B)]$，乘以 $4$（05-hessian.tex:258--266）。导数槽曲率项：两次分部积分里 $dm$ 的第二项被自己的导数精确消掉，$\nabla_kA_{ikjl}=0$ 免掉额外项，$\frac12(T_D)_{ikjl}R_{ikjh}=3v^2\delta_{lh}$ 与矩阵槽压缩 $4v^2-4Q_{5/2}(T)-4Q_{5/2}(N)$ 合并成 $\mathbf E[m(7v^2e-4B-4C_N)]$；$U_D$ 侧 $\mathbf E[3mb^2e]$、矩阵槽收缩为零因正反形式正交（05-hessian.tex:268--311）。非平行矩阵槽系数是本文格外诚实的一段：$\nabla_iA=B_F(Z_i)$、$\Delta A=6B_F(T)-6B_F(N)$ 全部保留，得 $\mathbf E[m(-10B-3C_N+20E_B)+\frac1{12}\sum_im_i\langle B_F(Z_i)Z,Z\rangle]$，配对恒等式 $\langle B_F(Z_i)Z,Z\rangle=\operatorname{tr}(Z_i\sum_jZ_j^2)$ 恰好生成 (10) 的中项；论文注记 $\mathcal P$ 从不被假定为平行（05-hessian.tex:313--342）。迹扣除用特征多项式给的 $B_F(T)T=N$、$B_F(T)N=v^2T$，得 $B_0=(4-B_F(T))(T-N)=(4+v^2)T-5N$，两项合算 $\mathbf E[m((10+\frac52v^2)e-25B+5v^2\lvert p\rvert^2)]$（05-hessian.tex:344--367）。系数汇总即 $G_v$；Lipschitz 权经光滑正权一致与 $H^1$ 逼近延拓，平方代价里导数的 $L^2$ 收敛给出乘积的 $L^1$ 收敛（05-hessian.tex:371--377）。二次型矩阵 (11)（05-hessian.tex:380--438）在 $p,k,l$ 坐标下列出 $G_v$ 的三乘三矩阵，$B/v$、$C_N/v^2$、$E_B/v^2$ 三个矩阵分别给出，能量度量 $H=\operatorname{diag}(5/3,5,1)$，$E_B$ 的矩阵是 $\mathsf B H^{-1}\mathsf B$；零集上 $G_v$ 用不变表达式，导数参数几乎处处归零。

## §14 变权的两笔代价：三次收缩与投影平方

权的选择（05-hessian.tex:440--456）：$M=1-\frac38(v-b)$、$m=M^2$，交换侧 $\overline M=1-\frac38(b-v)$、$\bar m=\bar M^2$。$v+b<2$ 保证 $M,\bar M\in(1/4,7/4)$，$dm=-\frac34M(p-q)$、$d\bar m=-\frac34\bar M(q-p)$。为什么取这种"沿 $v+b=2$ 斜率相反"的一对：[推测] 论文只说这是后面耦合论证的一个有理选择（05-hessian.tex:449--451）、并在 §15 开头点明两权斜率相反使导数引入四次项、须由恒等式 (16) 来吸收（06-coupling.tex:16--22）；我自己的尝试记录是，先前用对称权 $m\bar m$ 时两块的 $dm$ 代价同号相加，(16) 的四次控制项没法同时压住两侧，交换反对称才让代价分挂在各自的块上。

第一笔代价的引理（05-hessian.tex:464--509）：对任意真实切向量 $a$，$Z_a=\sum_ia_iZ_i$ 满足
\[
 \Bigl\lvert\frac{\operatorname{tr}\bigl(Z_a\sum_jZ_j^2\bigr)}6\Bigr\rvert\le\frac45\sqrt{\frac35}\,\lvert a\rvert e^{3/2}.
\]
证明由齐性设 $\lvert a\rvert=1$、$\nu=\lvert Z_a\rvert/\sqrt6$，把梯度参数化用在这个 $Z_a$ 的归一化谱 $s$ 上（用 $Z_a$ 自身、不是 $T/v$，这一步我一开始看漏），得 $\widehat p_a=\nu$、$\widehat k_a=0$，独有能力 $e_1=\frac53\nu^2$ 与其余参数在能量度量下正交、在 $B/v$ 矩阵里无交叉项，其贡献至多 $\frac45e_1$；对对称无迹 $3\times3$ 矩阵 $S$ 用特征多项式得 $\lvert(S^2)_0\rvert^2=\frac{\lvert S\rvert^4}{6}$、Cauchy--Schwarz 得 $\lvert\operatorname{tr}(sS^2)\rvert\le\lvert S\rvert^2$，其余部分界于 $e-e_1$；合并成 $\sqrt{\frac35}e^{3/2}\sqrt{r}(1-\frac r5)$，$r=e_1/e$，$\sqrt r(1-r/5)$ 递增、最大 $\frac45$。

第二笔代价先要两条实向量投影恒等式（05-hessian.tex:511--563）：$P_+$ 为向总正自旋 $3$（保留两种负自旋）的投影，则对实 $a$、$Z\in G$，
\[
 \lvert P_+(a\otimes Z)\rvert^2=\frac7{12}\lvert a\rvert^2\lvert Z\rvert^2,\qquad
 \bigl\langle\widetilde QP_+(a\otimes Z),P_+(a\otimes Z)\bigr\rangle=\frac12\lvert a\rvert^2\langle Q_{5/2}(T)Z,Z\rangle .
\]
论证用约化密度：实向量的外因子在 $A$ 上的约化密度是 $\frac12\lvert a\rvert^2\mathrm{Id}_A$，因为三个无迹 Hermite 算子正比于 $-iI_s$ 且 $a^{\mathsf T}I_sa=0$；整体向量 $a\otimes Z$ 是外因子与整个内因子的积，所以对只作用 $A\otimes H_{5/2}$ 的算子，配对等于外因子约化后的内因子配对，这条偏迹保留内正因子与 $B'$ 的一切关联，$a$ 与 $Z$ 都不必是自身正反因子内的积（05-hessian.tex:525--545）。常数鉴定各走一遍：$\operatorname{Tr}_AP_+$ 在 $H_{5/2}$ 上标量，迹比维数 $7/6$ 给第一个系数；第二个用 $A=\operatorname{diag}(-1,-1,2)$ 与内最高权 $5/2$，外权 $1/2$ 给总权 $3$、特征值 $-1$，外权 $-1/2$ 投到总权 $2$、特征值 $(12-12)/15=0$，归一外迹 $-1/2$，系数 $\frac12$ 落定（05-hessian.tex:546--563）。

投影代价命题（05-hessian.tex:566--615）：对所选权，
\[
 \frac{\langle\mathcal P(L_m)_Y,(L_m)_Y\rangle}{24m}\le\frac9{64}\lvert p-q\rvert^2\Bigl[\frac7{12}(4+y)e-\frac54B\Bigr],
\]
右端方括号非负，两条结论在闭不等式 $v+b\le2$、$x+y\le2$ 下依旧成立。论证：$P_-$ 为总负自旋 $1$ 投影，最高 Hessian 型是 $P_+P_-$；在该型上 $-U_D\le y$，故 $\mathcal P\le A_0:=4+y-\frac52\widetilde Q$，$A_0$ 只作用正因子且与 $P_-$ 交换；在整个高正子空间 $A_0\ge4+y-2x\ge0$，由 $x+y\le2$；于是算子序里 $P_-A_0P_-\le A_0$，配实向量恒等式给逐 $a$ 界；代 $a=dm$、除 $24m$、$m=M^2$ 得证。方括号非负由同一恒等式与 $A_0$ 的下界：$\frac7{12}(4+y)e-\frac54B\ge\frac7{12}(4+y-2x)e\ge0$。论文还提前备好一句：之后的估计可把 $\lvert p-q\rvert^2$ 换成 $(\lvert p\rvert+\lvert q\rvert)^2$ 而不等号方向不变（05-hessian.tex:611--615），§15 的四次段果然用了这个松弛。

这两笔代价的共同点：全是四次（对曲率一阶导数），符号上必须靠 (16) 那个带 $\delta\ge0$ 的非负积分来买命，这决定了 §15 组合的结构。

## §15 耦合：一个总被积函数与三条逐点上界

06-coupling.tex 的作战方案写在开头（06-coupling.tex:16--22）：两条加权 Hessian 不等式相加，再加三样东西，凑出一个均值非负的总被积函数 $\mathcal I$，然后把它的四次、二次、零次部分用三个表达式配成同一个平方。三样添加物的分工表（06-coupling.tex:32--47）：$\Delta\delta$ 恒等式贡献 $\frac h3\mathbf E[\delta(\lvert Y\rvert^2+\lvert\bar Y\rvert^2)]\ge0$，管四次权代价；平衡方差亏损非负，管 $v-b$ 的均值；$\kappa$ 范数测试积分为零，只调整二次与势项。

有理选择一次性写在 (15)（06-coupling.tex:49--80）：$D=158$，$h=\frac{17}{10}$，$c=\frac25-\frac3{10}vb\ge\frac1{10}$（在 $v,b\ge0$、$v+b\le2$ 上），$a=v-1$、$s=b-1$、$n=\frac\delta2$、$t=\frac{v-b}{2}$；$\kappa(v,b)$ 是关于 $a,s$ 的四次多项式，系数由 $4(z_1,\ldots,z_{11})=(-43,-45,-63,21,183,208,61,46,101,79,-41)$ 给出；$4\Theta=n^2(1-n)(105+5n)+t^2(4+360n-586n^2)-4t^4$；$R_v=\frac{4(1+v)}{1+6v+v^2}$、$R_b$ 交换。论文交代了角色分工：$\kappa$ 只通过零积分的范数测试改变被积函数，$\Theta,c,R_v,R_b$ 只出现在最后的比较里，$\kappa$ 与 $\Theta$ 都不被要求带符号（06-coupling.tex:77--81）。

第一添加物 (16)（06-coupling.tex:82--115）写成 $\mathbf E[(e+\bar e)\Delta\delta]$ 的展开：$\lambda=6(\sigma v^2+\bar\sigma b^2-v-b)-26\delta$，加上 $40\delta(B+\bar B)$ 与 $-30\delta\sum_\pm v^2(1-2\sigma v+v^2)$。验证靠 $\Delta e=\frac26\lvert\nabla Z\rvert^2+26e-40B$、方程 (3) 与分解 $\nabla Z=Y+D_0$；$\frac{2\lvert D_0\rvert^2}{6}=30v^2(1-2\sigma v+v^2)$ 精确给出减去项，于是 (16) 的积分恰是 $\frac h3\mathbf E[\delta(\lvert Y\rvert^2+\lvert\bar Y\rvert^2)]\ge0$。第二添加物 (17)（06-coupling.tex:117--131）：$D\bigl[\frac{\lvert p-q\rvert^2}{K}-(1-\frac{\delta^2}{4})(v-b)^2\bigr]$；用到矩平衡推论 $\mathbf E(v-b)=\frac12\mathbf E[\delta(v-b)]$、平方夹进 $\frac14\mathbf E[\delta^2(v-b)^2]$、再对方差用加权方差 (4)。第三添加物 (18)（06-coupling.tex:132--146）是弱范数方程 (3) 对 $\kappa(v,b)$ 的检验：$\sum_\pm[\kappa(v,b)\{6v(1-\sigma v)+\frac{e-\lvert p\rvert^2}{v}\}+\nabla\kappa(v,b)\cdot p]$，积分为零。合法性讨论（06-coupling.tex:141--146）回到 §6 的机器：$e/v$、$\bar e/b$ 可积，能量与系数有界，有界 Lipschitz 检验函数经光滑逼近可用，全程不需要范数有正下界。

按导数次数分组 $\mathcal I=\mathcal I_4+\mathcal I_2+\mathcal I_0$（06-coupling.tex:148--185）：$\mathcal I_4$ 收纳两条 (10) 的权代价与 (16) 的负商项；$\mathcal I_2$ 收纳 $mG_v+h\lambda e+40h\delta B$、$\kappa$ 测试的导数部分与 $\frac DK\lvert p-q\rvert^2$；$\mathcal I_0$ 是 $-D(1-\frac{\delta^2}{4})(v-b)^2$ 加势项。零集约定逐条写明：某块零集上只有它自己的导数项归零，交换侧保留；商取 (3) 的零值；$\sigma v^2$ 型乘积用连续零值；奇异系数不被要求连续。三条上界命题（06-coupling.tex:188--206）：定义 $r=R_v\lvert p\rvert^2+R_b\lvert q\rvert^2$、$j=(\lvert p\rvert^2+\lvert q\rvert^2)(\frac{\lvert p\rvert^2}{v}+\frac{\lvert q\rvert^2}{b})$，则几乎处处
\[
 \mathcal I_4\le-cj,\qquad \mathcal I_2\le2\Theta r,\qquad \mathcal I_0\le-\frac{\Theta^2}{c}.
\]

四次段（06-coupling.tex:217--420）的工作流：令 $e_0=\frac53\lvert p\rvert^2$、$e_d=e-e_0$、$z=\lvert p\rvert+\lvert q\rvert$。三次收缩乘 $dm$ 被 §14 引理界成 $\frac12\sqrt{\frac35}Mze^{3/2}$；(14) 的方括号拆成 $ge_0+H_de_d$，$g=\frac7{12}(4+y)-\sigma v+\frac{\rho^2v^2}{4}$、$H_d=\frac7{12}(4+y)+\frac54v+4$，亏损的纯贡献 $\le\frac54ve_d$、混合贡献 $\le2v\lvert\rho\rvert\sqrt{e_0e_d}\le\frac{\rho^2v^2}{4}e_0+4e_d$；(19) 汇总。然后证明 (19) 右端对每个亏损单调下降：对 $e_d$ 求导，代 $u=\sqrt{\bar e/e}$，用一揽子松弛 $z\le\sqrt{\frac35}(\sqrt e+\sqrt{\bar e})$、$M\le\frac74-\frac34v$、$H_d\le\frac{15}{2}+\frac23v$、$\frac25e_0+e_d\ge\frac25e$、$\frac vb\ge\frac{v}{2-v}$，得 $\frac ve\partial_{e_d}\mathcal Q\le A_0(1+u)^2+L_0(1+u)-h[\frac75+(1+\frac{2v}{5(2-v)})u^2]$，其中 $A_0=\frac{27}{320}v(\frac{15}{2}+\frac23v)$、$L_0=\frac9{20}v(\frac74-\frac34v)$；负号一侧全用下界代入保证方向。齐化二次式 $-C_0+(2A_0+L_0)u-D_0^{\mathrm{sc}}u^2$ 在判别式 $4C_0D_0^{\mathrm{sc}}>(2A_0+L_0)^2$ 下对一切实 $u$ 为负，不需要两块能量的排序；端点 $e=0$ 前先写成带 $\sqrt{e\bar e}$ 的形式再取极限（06-coupling.tex:249--319）。亏损清零后，把 $g$ 松弛到 $g_v=\frac7{12}(4+b+W)-v+2V$（$V=x-v$、$W=y-b$，$V+W\le\delta$），验证用 $r_0=x/v\in[1,2]$ 的三分分解 $1-\sigma=\frac{(r_0-1)^2(r_0+2)}{2}$、$1+\sigma=\frac{(2-r_0)(r_0+1)^2}{2}$，括号差 $2-\frac{(r_0-1)(r_0+2)}{2}(1+\frac{1+\sigma}{2r_0})=\frac{2-r_0}{8r_0}[4r_0(r_0+3)-(r_0-1)(r_0+2)(r_0+1)^2]\ge0$，括号在 $[1,2]$ 凹、端值 $16$ 与 $4$，$r_0=2$ 免除处理（06-coupling.tex:321--356）。核心不等式 (20)：对 $P=\sqrt{e_0}$、$Q=\sqrt{\bar e_0}$，
\[
 \Bigl(\frac{67}{50}+\frac{27}{100}vb\Bigr)(P^2+Q^2)(bP^2+vQ^2)\ge\frac{27}{128}vb(P+Q)^2(g_vP^2+g_bQ^2)+\frac34vb(P+Q)(MP^3+\bar MQ^3);
\]
系数换算 $h-\frac{67}{50}-\frac{27}{100}vb=\frac{9}{10}c$ 与 $e_0$ 到 $\lvert p\rvert^2$ 的 $\frac{9}{25}$ 恰好接上 $\mathcal I_4\le-cj$（06-coupling.tex:357--376）。证 (20)：设 $P>0$、$u=Q/P\le1$；$g_v+g_bu^2$ 中 $V,W$ 系数非负且差为 $\frac{17}{12}(1-u^2)\ge0$，把 $(V,W)$ 换成 $(\delta,0)$ 只会放大，论文明说这是松弛、不断言新对几何可达，放大后 $g_v=\frac{19}{3}-3v-\frac{17}{12}b$、$g_b=\frac72-\frac{19}{12}b$；取 $\omega=\frac{27}{128}$、$\mu=\frac9{32}$，凑出 $A,G,H,L$ 四个 $u$ 的有理式，差的归一形如 $\frac Av+\frac{Au^2}{b}+Gv+Hb-L$；由 $G,H>0$、$Z_*=L^2-4A(G+u^2H)$ 分段非正，得 $L\le2\sqrt A(\sqrt G+u\sqrt H)$，再两次 AM--GM 收工（06-coupling.tex:377--420）。

二次段（06-coupling.tex:422--544）的枢纽是轴向值比较：与 $\sigma=\bar\sigma=1$、$\rho=\bar\rho=0$、$k=l=\bar k=\bar l=0$ 的谱形 $(-v,-v,2v),(-b,-b,2b)$ 比较，固定 $v,b,p,q$。把 $\bar\sigma$ 换成 $1$ 只抬高 $6h(1-\bar\sigma)b^2e\ge0$；余下形状依赖项的 $(pp)$ 损失是 $(1-\sigma)vP_0/3$、与 $(k,l)$ 的混合项是 $-v\rho(P_k,P_l)/\sqrt3$，$P_0=300m+30hv+160h\delta$、$P_k=300m+160h\delta$、$P_l=35mv$，且 $P_0=P_k+30hv>0$。关键单调性：$-\partial_\sigma\mathsf A_\sigma=v^2[(30hv,-P_l)^{\mathsf T}(30hv,-P_l)+\operatorname{diag}(0,6hvP_0)]\succeq0$，所以 (21) 只需在 $\sigma=1$ 验证；$\sigma<1$ 时 Schur 补 $\mathsf D_\sigma-\frac{dd^{\mathsf T}}\ell=\mathsf A_\sigma/(P_0v)\succeq0$，$\sigma=1$ 处 $\rho=0$ 直接接上，不做 $1-\sigma$ 的除法，也不设 $\kappa$ 的符号（06-coupling.tex:440--499）。轴向化后 $e_{\rm ax}=\frac53\lvert p\rvert^2$、$B_{\rm ax}=\frac43v\lvert p\rvert^2$，合出 $X_v=m(-70+100v-25v^2-5b^2)+\frac53h(6(a^2+s^2)+32a\delta)$；三条矩阵不等式 (22) 把二次段压成 $\binom{\mathcal Q_v\ J}{J\ \mathcal Q_b}\preceq2\Theta\operatorname{diag}(R_v,R_b)$。最漂亮的是 (15) 里那串 $z_i$ 的用途揭晓（06-coupling.tex:534--544）：沿形式轴向边界 $v=1+t$、$b=1-t$ 直接代入，$\mathcal Q_v,\mathcal Q_b,J=O(t^2)$ 而 $\Theta=t^2-t^4$，两个轴向块交会处的常数项与切向一次项自动抵消。这解释了有理选择为什么长这样，凭证则负责把不等式在全域钉死。

势段（06-coupling.tex:546--613）：设 $v\ge b$，$E_0=D(1-\frac{\delta^2}{4})(v-b)^2+30h\delta(v^2a^2+b^2s^2)+6(av\kappa+sb\bar\kappa)$、$F=cE_0-\Theta^2$、$L_v=10h\delta v-\kappa$、$L_b=10h\delta b-\bar\kappa$；收集得 $\mathcal I_0=-E_0-6v^2(1-\sigma)L_v-6b^2(1-\bar\sigma)L_b$；谱侧 $b^2(1-\bar\sigma)=\frac12b^2(r_0-1)^2(r_0+2)\le2\delta^2$（$r_0=y/b\le2$、$y-b\le\delta$）。于是只需 (23)：$L_v\ge0$、$F\ge0$、$F+12c\delta^2L_b\ge0$（$v\ge b$ 时）。排序纯属代数技巧：所有权与导数早已用固定的全局标签构造，目标是交换对称的；$v<b$ 时把有序不等式作用在 $(b,v)$ 再交换向量分量，$v=b$ 时任选；没有对任何最大、最小或选中标签求导。零集延拓的走法：在正变量不等式中先把全部加号侧导数参数置零，再保持 $b>0$ 与负侧数据，沿轴向正谱 $(-v,-v,2v)$ 取 $v\to0$，$v<\min\{2-y,2-b\}$ 保持在两条谱不等式内；剩下的二次不等式是负对角，分母 $bK(1+6b+b^2)$ 恒正，四次界成 $-c\lvert q\rvert^4/b$，含 $p$ 的交叉项全消失；势不等式是多项式的、连续延拓；四次商被 $e/v+\bar e/b$ 的常数倍控制，可积（06-coupling.tex:588--613）。这一段把我 §6 立的规矩用到了极限。

## §16 凭证库：Bernstein 系数账本

07-certificates.tex 把上面点名的多项式不等式一次结清。方法是一元与三角形上的 Bernstein 非负基（出处挂在 Boudaoud--Caruso--Roy 与 Roy），转换公式在文内证明：区间上 $h_i=\sum_{j\le i}a_j\frac{\binom ij}{\binom Ni}$，三角形上 $[p]_{ij}=\sum_{d\le i,e\le j}\frac{\binom id\binom je}{\binom N{d+e}\binom{d+e}d}P_{de}$，基函数是非负单位分割，矩阵情形逐元素，系数矩阵全体半正定推出全域半正定（07-certificates.tex:29--89）。配套说明值得留意：随包源码以论文目录名作为稳定标识发布，校验器在 verification/ 目录、运行入口是一条 python 命令，独立的 PDF 拷贝不含校验器，覆盖率记录区分已执行重构与文中证明的几何归约（07-certificates.tex:12--27）。

标量凭证表（07-certificates.tex:93--141）：$C_0$（2 次，$[0,1]$ 与 $[1,2]$，界 $1/2$）、四次判别式多项式（5 次，同两段，界 $1/2$）、$G$（4 次，$[0,1]$，界 $9/10$）、$H$（4 次，界 $1/4$）、$-Z_*$（8 次，$[0,1/16]$，界 $13/100$）、$64A^2u^2GH-Z_*^2$（16 次，$[1/16,1]$，界 $12/100$），前两行实际最小系数给出 $3971/3200$、$1063/1600$、$101027/20000$、$283729/400000$ 四个分数。矩阵凭证（07-certificates.tex:143--357）：对 (22) 引入 $r_v=1+6v+v^2$、$\alpha=\frac54$、$H_v=8vK\Theta(1+v)-r_v\{vD+K[v(X_v+\partial_v\kappa)+\frac{2\kappa}3]\}$、$S_*=4(\alpha+\alpha^{-1})vb+\frac{\alpha b(1-v)^2+\alpha^{-1}v(1-b)^2}2$；由 $r_v=8v+(1-v)^2$ 与加权 AM--GM 得 $\sqrt{vbr_vr_b}\le S_*$，于是验 $\binom{H_v}{S_*KJ}\ S_*KJ\ H_b$ 半正定即可，这步只用 $J^2$、不问 $J$ 的符号（07-certificates.tex:145--174）。两个三元组 $\mathcal A$（在 $\sigma=1$ 的 (21)）与 $\mathcal B=(H_v,H_b,S_*KJ)$ 在记号 $(11,22,12)$ 下登记；定义域用八个标记点 $O,S,C,U,W_0,A,B,E$ 的三字母三角形铺：$\mathcal D$ 由 $OSC,OCW_0,SCU$ 覆盖，$\mathcal D_+$ 由 $OAS,ASE,ACE,SBE,CBE,SUB$ 覆盖（也可单三角 $OCU$）（07-certificates.tex:205--221）。系数账：$\mathcal A$ 三行界分别 $16000/53000000$、$890/3900000$、$2400/3500000$（次数 8）；$\mathcal B$ 六行（次数 9 或 10）从 $43/1050$ 到 $13/100$、$4$；$L_v$（6 次，$OCU$，界 $9/10$，唯一零在顶点 $C$）；$F+12c\delta^2L_b$（9 次，$OSC$ 界 $19/100$、零恰为 $i+j\le2$，$SCU$ 界 $9/1000$、零为 $9-j\le2$ 加 $(0,6)$）（07-certificates.tex:232--351）。重现配方写得像实验手册：先按仿射变量 $V,W$ 组装 $\kappa(V,W)$ 与偏导（求导先于代入），数组按卷积相乘，$\mathcal A$ 的三个入口多项式与 $\mathcal B$ 的 $H_*$、$S_*$ 乘子逐一列出，还给出 $CBE$ 上 $(i,j)=(8,0),(8,1),(8,2)$ 三个显式三元组做抽查（07-certificates.tex:257--329）。

最后的势多项式 $F$（07-certificates.tex:360--433）：换 $v=1-n+t$、$b=1-n-t$，域成 $0\le n\le1$、$\lvert t\rvert\le1-n$；$F_*(n,t)$ 对 $t$ 偶，展开成 $\sum_{j=0}^4f_j(n)t^{2j}$，$f_0$ 到 $f_4$ 全部显式（$240f_0$ 带 $n^3(1-n)$ 乘五次正多项式、$f_4=-\frac{23}{5}$）。对 $n<1$ 令 $z=t^2/(1-n)^2$，Bernstein 系数 $h_i(n)$ 各自含一个可整除因子 $d_i$（$n^3(1-n)$、$n(1-n)$、$1-n$ 三连），商 $q_i$ 是 4、6、7、7、7 次多项式，在四段等分区间上逐段给系数下界 $3$、$31$、$\frac15$、$\frac{12}{5}$、$\frac95$；$d_i$ 非负故 $h_i$ 非负；$n=0$ 与 $n=1$ 两个角落分别用 $z=t^2$ 的覆盖与直接代入 $F_*(1,0)=0$ 收尾，全程没有对一个可能消失的因子做过数值除法。凭证一节读毕，耦合命题的三个上界在正变量谱域成立，加上 §15 的相容极限延到真实零集（07-certificates.tex:435--441）。

## §17 刚性：从均值非负逼出单块湮灭

08-classification.tex 开门见山（08-classification.tex:3--9）：耦合估计已在真实严格正几何（含零集）上证毕，现在用它的严格性排除双块非零。反设两块都非零（08-classification.tex:11--37）：矩平衡适用，三条上界与 $c\ge\frac1{10}$ 给出
\[
 \mathcal I\le-cj+2\Theta r-\frac{\Theta^2}{c}=-\frac{(\Theta-cr)^2}{c}-c(j-r^2).
\]
配方只用一个代数事实：$r^2\le j$。证明藏在一个四次恒等式里：对 $v>0$，$1+6v+v^2-4\sqrt v(1+v)=(\sqrt v-1)^4$，于是 $R_v\le1/\sqrt v$、等号只在 $v=1$，Cauchy--Schwarz 得 $r^2\le j$（08-classification.tex:26--30）。刚性全押在严格化上（08-classification.tex:32--35）：Lipschitz 函数在每个水平集上梯度几乎处处为零（密度点处非零微分会与密度矛盾），所以去掉零测集后，导数 $p$ 活跃之点必有 $v>0$ 且 $v\ne1$，$q$ 同理；逐点 $r<\frac{\lvert p\rvert^2}{\sqrt v}+\frac{\lvert q\rvert^2}{\sqrt b}\le\sqrt j$。于是 $\mathcal I\le0$ 几乎处处、且在任一范数梯度非零处严格负；而 $\mathbf E\mathcal I\ge0$，两头一挤，两个梯度几乎处处为零，连通性与连续性让 $v,b$ 常值；两常数皆正（否则回到单块情形），分别代入间隙 $\mathbf E v^2\ge1$、$\mathbf E b^2\ge1$ 得 $v+b\ge2$，与 $v+b< x+y<2$ 矛盾。半共形平坦落定：$T\equiv0$ 或 $U\equiv0$。

装配图在这里合拢：矩平衡进入非负积分，逐点精确界与活跃梯度严格性逼出单块湮灭（01-introduction.tex:156--157；figures/proof-map.tex:28--31 的十框图与此对应）。我的两条失败路线至此都得到交代：范数锥缺的那座桥由加权 Hessian 与轴向比较补上，常系数配平欠的那份精度由带 11 个有理系数的 $\kappa$ 与 $R$ 权重配平方程补齐。回看最险的一步，是把 $j-r^2$ 的严格性押在 $(\sqrt v-1)^4>0$ 这种一句话恒等式上：整套分析机器最后兑现成一行代数。

## §18 单块湮灭之后：两个调和数与条件体积下界

半共形平坦之后，论文特意声明：一块归零即落入经典已分类的紧致半共形平坦正数量曲率 Einstein 类（Hitchin、Friedrich--Kurke、Obata 一路），但下面的下界体积与平行曲率论证仍被保留作独立证明（08-classification.tex:39--44）。我完全理解这个保留：主定理的自包含性押在这里。

反向取向设 $U=0$。若 $T$ 也归零，曲率算子分解直接给截面曲率恒为 $1$（08-classification.tex:49--52）。设 $T$ 非零，特征恒等式把可能性压成两个整数（08-classification.tex:53--69）：$n_-=0$、$\chi=2+n_+$、$\tau=n_+$，解出
\[
 \frac{V_M}{\pi^2}=\frac{8-2n_+}{3},\qquad s_0=\mathbf E v^2=\frac{3n_+}{4-n_+},
\]
体积正性给 $n_+<4$，间隙给 $s_0\ge1$，$v<2$ 给 $s_0<4$，于是 $n_+\in\{1,2\}$；第二例恰好 $s_0=3$、$V_M=4\pi^2/3$。

排除 $n_+=2$ 的武器是条件化下界：只要 $s_0=3$，必有 $V_M>4\pi^2/3$（08-classification.tex:79--82）。注意论文的口径：这条下界本身不需要单块归零，单块结论只是用来生产那个待排除的例外值（08-classification.tex:73--77）。下界机器复用 §9 的全部零件，方向反过来。下极界（08-classification.tex:93--105）：开球半径 $\pi/\sqrt3$ 落在每个中心的单射域内，$V_M\ge2\pi^2\int_0^{\pi/\sqrt3}\mathcal E D(t)dt$，端点由递增开半径收上来。下径向比较（08-classification.tex:107--195）是核心：$s_0=3$、$0<t<\pi/\sqrt3$、$\theta=\sqrt3t$ 时
\[
 \mathcal E D(t)\ge t^3\Bigl(\frac{\sin\theta}{\theta}\Bigr)^{5/6}e^{-\theta^2/36},
\]
附带标量对数界 $-\log(\frac{\sin\theta}{\theta})-\frac{\theta^2}{6}\ge\frac12(\frac\theta\pi)^4+\frac13(\frac\theta\pi)^6$。证明用标量 Dirichlet 三对角的显式 Green 阵 $G_{ij}=a^2\frac{\min(i,j)(N-\max(i,j))}{N}$、$\operatorname{tr}G\to t^2/6$（08-classification.tex:123--129）；归一化 $H_N$ 有一致谱范数与行列式级数展开 $-\log\det(\mathrm{Id}-H_N)=\sum_{k\ge1}\operatorname{tr}H_N^k/k$，先取一致界 $\le\frac{3\operatorname{tr}G}{1-q_t}$ 才敢交换期望与级数（08-classification.tex:130--151）。$\mathcal E\lvert\mathcal R\rvert^2=3+\frac32s_0=\frac{15}{2}$（来自 (8)）；对 $k\ge2$ 个曲率矩阵的有序乘积，$|\operatorname{tr}(\mathcal R_1\cdots\mathcal R_k)|\le3^{k-2}|\mathcal R_1|\,|\mathcal R_k|$，期望经 Cauchy--Schwarz 与测地流测度不变性界于 $\frac56 3^k$，论文明说既不需要交换也不需要独立（08-classification.tex:152--167）；$G$ 元素非负让块迹展开的正系数和成 $\operatorname{tr}(G^k)$，于是 $\mathcal E\operatorname{tr}H_N^k\le\frac56 3^k\operatorname{tr}(G^k)$，$k=1$ 恰为 $3\operatorname{tr}G$，汇总 $\mathcal E\log\det(\mathrm{Id}-H_N)\ge\frac56\log\det(\mathrm{Id}-3G)-\frac12\operatorname{tr}G$，Jensen 补最后一步（08-classification.tex:168--175）。极限端：平坦块行列式 $N^3$、$\det(\mathrm{Id}-H_N)=\det\mathcal L_N/N^3\to D(t)/t^3$，紧单位切丛上系数与一阶导一致界给沿测地线一致收敛；标量侧 $\det(\mathrm{Id}-3G)\to\frac{\sin\theta}{\theta}$（08-classification.tex:176--190）。对数界第二步：级数里只留 $k=2,3$，每项取 $G$ 的最大特征值（极限 $t^2/\pi^2$），减 $3\operatorname{tr}G$ 取极限（08-classification.tex:191--195）。

收账（08-classification.tex:197--244）：变量 $u=\sqrt3t/\pi$，指数因子 $\exp[\frac16(-\log\frac{\sin\theta}{\theta}-\frac{\theta^2}{6})]\ge1+\frac16[\frac12(\frac\theta\pi)^4+\frac13(\frac\theta\pi)^6]$；先积到 $T<\pi/\sqrt3$ 再单调收敛升端点，被积式非负所以无需对数的一致端界；得
\[
 \frac{V_M}{\pi^2}\ge\frac29(\pi^2-4)+\frac{\pi^3}{27}\int_0^1u^2\bigl(u^4/2+u^6/3\bigr)\sin(\pi u)du .
\]
两行有理账（次数 15，界 $698/10^6$ 与 $40554/10^6$）加常数项 $2(a_0^2-4)/9=4883/3750$，总和超过 $1343/1000>4/3$。$n_+=2$ 的 $V_M=4\pi^2/3$ 被严格下界处决，单块非零只剩 $n_+=1$（08-classification.tex:246--249）。

## §19 平行张量与全局识别

$n_+=1$ 经 §18 的公式送回 $s_0=\mathbf E v^2=1$；间隙取等条款（§7 末）立刻给 $\nabla T=0$、$v=\sigma=1$，即 $T$ 平行、特征值 $2,-1,-1$（08-classification.tex:253--264）。于是取向侧的结论收成一条二择一：反向取向后 $T=U=0$ 或 $U=0$ 且 $T$ 平行带谱 $2,-1,-1$。

模型对照用 Hopf 纤维化曲率计算（O'Neill 框架），论文明说带上它是为把度量缩发放进精确刻度（08-classification.tex:266--271）。第一支由曲率算子分解直接给单位圆球。第二支：在一点取 $T$ 特征值 $2$ 的特征线对应的正交复结构 $I$，截面曲率 $K(X,Y)=\frac12(1+3\langle IX,Y\rangle^2)$，由极化知截面曲率决定代数曲率张量，整个过程只需要在单个切空间做这个选择、不设全局复结构（08-classification.tex:272--279）。比较对象是 $S^5/\!S^1=\mathbb{CP}^2$ 的商度量 $g_H$（水平提升等距）：单位竖直场 $iz$，$(\nabla_XY)^{\mathrm{vert}}=-\langle iX,Y\rangle iz$，代 curvature 公式得 $K_{g_H}(X,Y)=1+3\langle iX,Y\rangle^2$；因子 3 的来源被逐项点名：竖直括号 $[X,Y]^{\mathrm{vert}}=-2\langle iX,Y\rangle iz$ 供两份、微分竖直项供一份（08-classification.tex:280--289）。于是 $g_H$ 乘 2 才匹配我们的谱。平行性：固定一条复线、在其正交补上取负一的酉变换给出该点微分为 $-\operatorname{Id}$ 的等距，它作用在协变五张量 $\nabla R$ 上乘 $-1$，逼 $\nabla R=0$，传递性铺满（08-classification.tex:290--292）。

全局化用延拓原理（Ambrose 一脉，08-classification.tex:294--298）：$M$ 单连通（§9 的拓扑引理），两个模型也单连通，$\mathbb{CP}^2$ 一侧给了显式论证：回路提升局部截面、端点在圆纤维内连线闭合、在 $S^5$ 中收缩再投影（08-classification.tex:302--304）。在一点取匹配全曲率张量的切空间等距；平行曲率让两条 Jacobi 方程在平行标架下系数相同，小正规球上的指数映射给出等距；紧性供公共正半径； germs 由取值与微分决定、沿道路唯一延拓，同伦方形切成小块、重合区域靠唯一性，单连通给出全局局部等距；逆 germ 同样延拓，复合在开集上为恒等、由延拓处处为恒等（08-classification.tex:305--309）。取向分类推论落定：紧致取向光滑闭 Einstein 四维流形加严格正截面，正缩放后等距于圆球 $S^4$ 或 Fubini--Study $\mathbb{CP}^2$（08-classification.tex:311--326）。

## §20 取向覆盖与第三个模型

主定理不要求可定向，收尾押在覆盖上（08-classification.tex:328--372）。不可定向时取取向二重覆盖 $p:\widetilde M\to M$，连通、闭、可定向，拉回度量保持 Einstein 与严格正截面，非平凡铺覆变换 $\tau$ 是自由反向取向对合（构造与连通性挂 Hatcher 命题 3.25）。正缩放后按 §19 把覆盖认成两个模型之一，$\tau$ 共轭到模型上的自由对合同保持定向符号。

$\mathbb{CP}^2$ 被上同调环排除：$H^*(\mathbb{CP}^2;\mathbb Z)=\mathbb Z[h]/(h^3)$、$\lvert h\rvert=2$、$h^2$ 生成顶类，任意自微分同胚把 $h$ 送到 $\pm h$、因此固定 $h^2$、次数为 $+1$，与要求的反向取向矛盾（08-classification.tex:347--353）。

$S^4$ 一侧：距离决定环境内积 $\langle x,y\rangle=\cos d(x,y)$，等距由此决定某个 $A\in O(5)$ 且 $\tau(x)=Ax$；$\tau^2=\operatorname{id}$ 给 $A^2=I$，正交对合按 $\pm1$ 特征空间分解，任何非零 $+1$ 特征向量都在球面上留下不动点，自由性逼 $A=-I$，底空间是圆球商 $S^4/\{x\sim-x\}=\mathbb{RP}^4$（08-classification.tex:354--364）。反向核对：对映映像在 $S^4$ 上次数 $(-1)^5=-1$、确实反向取向；局部等距把 Einstein 与正截面性质传下去，商是闭连通光滑流形，第三个模型真实出现，且是唯一不可定向情形（08-classification.tex:366--371）。

## §21 最终思路与最初设想的差异

合上稿子对一遍账。设想一：我以为分类的难点在"最后一步识别"，实际最后的平行曲率与全局延拓只有六十来行，真正的工程量在中段的双块耦合；识别之所以轻，是因为前面把谱与平行性都逼死了。设想二：我预期体积估计是一条双侧夹逼，实际它被拆成两个命题：无条件上界（亏 $3/40s_0$）与条件下界（假设 $s_0=3$ 时 $V_M>4\pi^2/3$），两者共用离散 Jacobi 机器但符号方向相反、单调性论证各走一遍（08-classification.tex:147--150 特意说明下界不需要单块归零）。设想三：我以为有限算术只是附录点缀，实际它渗透到正文三处：矩障碍的 Bernstein 账、耦合的三个上界、$1343/1000$ 的体积判决；$\kappa$ 的 11 个有理系数与"$c\ge1/10$ 只需及格"的姿态反复出现，论文两处声明选择只求充分、不谈最优（05-hessian.tex:170--171；06-coupling.tex:49--51）。设想四：我原以为方差工具是辅助，实际 $K=4+v^2+b^2$ 这条加权方差被用了两次关键的、方向相反的位置：§12 里供给矩障碍的非负性，§15 的 (17) 里供给 $v-b$ 的控制。设想五：非取向情形我以为要另起炉灶，实际只欠一条上同调环论证与一条 $O(5)$ 对合分类，主战场从头到尾在取向侧。

## §22 存疑与 [推测] 清单

以下各处动笔时就已标注，集中登记以便本体侧核对。一，$\kappa$ 的 11 个有理系数与 $D=158$：轴向抵消给了局部解释（06-coupling.tex:534--544），系数由何种搜索产生 [推测]，源文件未记载搜索过程，我也拒绝事后编造一个。二，配套校验器的覆盖记录在正文素材之外（07-certificates.tex:12--27 只给出入口与范围声明）：校验器实际重构哪些恒等式、哪些配对关系只靠文中证明，无法从 .tex 定点 [推测]。三，$3/40$ 与 $2/25$ 的间距：§12 只需前者，后者是积分实力；留余量的动机 [推测]。四，分段点 $5/8$、封顶 $15/16$、区间端点 $1/16$、等分四段：都是让有限账规模落地的选择，其调参史 [推测]。五，§14 权斜率符号的设计动机已就地标注 [推测]，源文件只声明"耦合论证的一个有理选择"。六，装配图只给 TikZ 版面（figures/proof-map.tex 全文 $34$ 行），框与命题的对应依据图中文字与 §17 的叙述重建，更细的箭头语义 [推测]。七，研究时序：首页作者栏为 OpenAI、日期 2026 年 9 月 23 日（paper.tex:29--31），被引的 Gursky--Malchiodi 投稿日期 $2026$ 年 $9$ 月 $25$ 日（references.tex:81--84），晚于本文页眉日期；这些线索无法重建真实工作顺序，本笔记的"我"是事后合理化重建，全部 [推测] 条目共享这一条整体性保留。

## §23 收工自检

为避免误读，本节只用中性特征指代敏感构件，不复抄任何表头或禁串字形。核对项如下。小节编号从 §0 起连续到 §25，物理排布与编号同序；所有"见 §N"型前向引用指向真实存在的节，两处指错已在 §25 登记。落盘动作：Write 全程只用 $1$ 次（首块落盘），其余共 $5$ 次追加全部通过 Edit 在文件末尾进行，单次追加均不超过 $25000$ 字节；无任何删除、回滚、改写、重排已落盘内容的动作；Edit 锚点逐字取当时最末一段全文。取证调用 $14$ 次（$13$ 次读素材 .tex 加 $1$ 次列目录结构），不超过 $15$ 次上限；首次落盘落在规定的调用窗口内。数学定界符总数收工后复量须为偶数，台账单元格内数学直接成对使用美元符、未套行内代码反引号、绝对值与范数使用专用命令、格内无裸竖线字符、每数据行恰六枚竖线、无空格子与占位线。§0 末尾两行登记串逐字在位，其中队列一行以"行号"二字收尾。台账数据行数在 §24 交付时实测，只增不减。

## §24 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\operatorname{Ric}=3g$ | 归一常数 $3$ | 01-introduction.tex:26 | §4 起全部块分解与 §7 间隙刻度 | 改缩放则 §8 特征恒等式中数量 $6$ 联动错位 |
| $x+y<2$ | 严格正的谱边界等价式 | 02-preliminaries.tex:63--64 | §13 的 $\mathcal P\ge4-2x-2y$ 与 §17 末矛盾 | 放松为非严格则 §17 的 $v+b\ge2$ 冲突失效 |
| $v=\lvert T\rvert/\sqrt6$ | 归一化范数 | 01-introduction.tex:88--91 | §7 间隙刻度与 §13 矩阵 (11) | 除数 $6$ 改动则 $e_0$ 的 $\tfrac53$ 全链错位 |
| $v\le x\le 2v$ | 双因子上限 $2$ | 02-preliminaries.tex:94--101 | §2 的失败诊断与 §15 轴向松弛 | 上限 $2$ 一失，(20) 的 $(V,W)$ 松弛不成立 |
| $\mathbf E v^2\ge1$ | 外尔间隙 | 03-analytic.tex:143 | §12 的 $2\le s_0$ 与 §19 取等刚性 | 间隙变小则 $(5,1)$ 例外复活 |
| $K=4+v^2+b^2$ | 方差权重 | 03-analytic.tex:27 | §12 的 $G'\le\sqrt K/2$ 链与 §15 的 (17) | 常数 $4$ 改动则 Bochner 正项来源脱钩 |
| $(\mathbf E\lvert f\rvert^4)^{1/2}\le\mathbf E(f^2+\tfrac12\lvert\nabla f\rvert^2)$ | 尖锐常数 $\tfrac12$ | 03-analytic.tex:129--131 | §7 间隙证明的能量不等式 | 常数不尖锐则间隙右端偏离 $1$，整数筛失效 |
| $\chi=2+n_++n_-$ 与 $\tau=n_+-n_-$ | 奇偶绑定 | 03-analytic.tex:221--222 | §12 唯一残例筛 | 去奇偶则不等矩情形无法数尽 |
| $8\pi^2\chi=6V_M(1+s_0)$ | 特征兑换 | 03-analytic.tex:227--229 | §12 的 $\chi<7$ 与 §18 调和计数 | 系数 $6$、$8$ 互换则 §18 体积公式错位 |
| $12\pi^2\tau=6V_M\mathbf E(v^2-b^2)$ | 符号兑换 | 03-analytic.tex:230--231 | §12 的 $\lvert\tau\rvert/\chi<4/15$ | 该式丢失则残例 $(5,1)$ 数不出来 |
| $\mathcal E\lvert A\rvert^2=\tfrac32 s_0$ | 测地平均因子 | 04-volume.tex:53 | §9 方差恒等式与 §18 的 $\tfrac{15}{2}$ | 因子 $\tfrac32$ 改动则 $k=2$ 项系数全变 |
| $V_M/(8\pi^2/3)\le1-\tfrac{3}{40}s_0$ | 亏量斜率 $\tfrac{3}{40}$ | 04-volume.tex:21 | §12 多项式 $\chi$ 界 | 斜率过大伤及可行域，过小则 $\chi<7$ 不闭合 |
| $a_0=\tfrac{157}{50}<\pi<\tfrac{22}{7}$ | $\pi$ 有理夹逼 | 04-volume.tex:285--286 | §10 三行账与 §18 两行账 | 夹得过松则 $S\ge\tfrac95 z$ 不成立 |
| $f(5/8)=\tfrac{7511875}{8388608}$ | 封顶核验值 | 04-volume.tex:354--355 | §15 四次段 $u\le\tfrac58$ 区间 | 该值一旦超 $1$，分段松弛断裂 |
| $d\ge\tfrac{11}{20}$ | 矩问题标尺 | 04-volume.tex:399--412 | §11 障碍引理支撑筛 | 标尺失则 $F_d$ 的三阶导控制无从谈起 |
| $w\le\tfrac{10}{37}$ | 支撑窗口 | 04-volume.tex:478--483 | §11 端点验负 | 窗口错乱则 $t_\pm$ 区间方向颠倒 |
| $\mathbf E v^2=\tfrac{13P+3}{7}$ | $(5,1)$ 实例化 | 04-volume.tex:581--583 | §12 约束 $P\ge1$、$28\mathbf E b+6P\le25$ | 整数组变动则比例须整体重解 |
| $P-\mathbf E b\ge\tfrac49\mathbf E\lvert\nabla\sqrt b\rvert^2$ | 方程系数 $\tfrac49$ | 04-volume.tex:591--593 | §12 的 $\tfrac9{16}$ 链与 $\Phi$ 的 $9z(1-z)$ | $\tfrac49$ 变小则方差接不上障碍引理 |
| $M=1-\tfrac38(v-b)$，$m=M^2$ | 权斜率 $\tfrac38$ | 05-hessian.tex:443--447 | §14 两笔代价与 §15 四次吸收 | 斜率改动则 $\tfrac{9}{64}$ 与 (16) 匹配破裂 |
| $G_v$ 的五个二次系数 | $-42$、$75$、$\tfrac{25}{3}$、$-\tfrac{100}{3}$、$5$ | 05-hessian.tex:231--233 | §13 矩阵 (11) 与 §15 (21) | 任一符号翻转则 $\sigma=1$ 凭证当场失败 |
| $T_D+2B_F(T)=3\widetilde Q$ | 消内曲率组合 | 05-hessian.tex:158--162 | §13 算子 $\mathcal P$ 系数 | 系数 $2$ 改动则内曲率作用重新出现 |
| $\operatorname{Tr}\operatorname{Tr}^*=\tfrac{12}{5}$ | 迹常数 | 05-hessian.tex:49 | $D_0$ 范数恒等式与 §13 迹扣除 | 改动则 $G_v$ 常数项整体重排 |
| $4-2x-2y>0$ | 正性下界 | 05-hessian.tex:191--193 | §15 方括号非负与平方项 | 不正定则加权平方与 (14) 同崩 |
| $D=158$，$h=\tfrac{17}{10}$ | 耦合尺度 | 06-coupling.tex:54 | §15 (17)、(20) 与 $h-\tfrac{67}{50}$ 换算 | $h$ 偏小则换算出的 $c$ 非正 |
| $c=\tfrac25-\tfrac3{10}vb\ge\tfrac1{10}$ | 比较权重下限 | 06-coupling.tex:55--59 | §15 三界与 §17 配方分母 | 失去 $\tfrac1{10}$ 则 $\Theta^2/c$ 失控 |
| $4(z_1,\ldots,z_{11})$ 十一有理系数 | $\kappa$ 系数组 | 06-coupling.tex:66--67 | §15 轴向边界 $O(t^2)$ 抵消 | 任一改动则交会点常数与一次项回归 |
| $R_v=\tfrac{4(1+v)}{1+6v+v^2}$ | 二次型权 | 06-coupling.tex:70--71 | §15 (22) 与 §17 的 $r$ 定义 | 比值变动则 $(\sqrt v-1)^4$ 恒等式不再给界 |
| $(\sqrt v-1)^4$ | 四次恒等式 | 08-classification.tex:28 | §17 严格 $r^2<j$（等号仅在 $v=1$） | 不严格则梯度可在 $v=1$ 水平集存活 |
| $n_+\in\{1,2\}$ | 调和数筛 | 08-classification.tex:53--58 | §18 条件下界的作用对象 | 丢体积正性则 $n_+=3$ 漏出候选 |
| $s_0=3\Rightarrow V_M>4\pi^2/3$ | 条件下界 | 08-classification.tex:79--82 | §18 处决例外 $n_+=2$ | 弱为非严格则剩块情形留双 |
| $\tfrac{698}{10^6}$ 与 $\tfrac{40554}{10^6}$ | 下界两行账 | 08-classification.tex:210--212 | §18 判决 $1343/1000>\tfrac43$ | 砍任一行则总账不过 $\tfrac43$ |
| 谱 $2,-1,-1$ | 平行块特征值 | 08-classification.tex:254--255 | §19 模型对照 | 换谱则匹配不到 Fubini--Study 张量 |
| $K(X,Y)=\tfrac12(1+3\langle IX,Y\rangle^2)$ | Hopf 账 | 08-classification.tex:274--276 | §19 二倍 FS 缩放 | 因子 $3$ 少一份则缩放 $2$ 失去依据 |
| $\operatorname{str}E^2=12+24v^2$ | 热势超级迹 | appendix-a-analytic.tex:412--416 | §8 特征恒等式推导 | 系数 $24$ 依赖 $\lvert T\rvert^2=6v^2$，读错 $6$ 即失衡 |
| $\operatorname{inj}\ge\tfrac{\pi}{\sqrt3}$ | 注入半径界 | 04-volume.tex:99--100 | §18 下极积分上限 | 半径缩短则积分总量顶不过 $\tfrac43$ |
| $A=-I$ | 自由对合归类 | 08-classification.tex:354--364 | §20 $\mathbb{RP}^4$ 唯一性 | $+1$ 特征空间非平凡即出现不动点 |

## §25 勘误

按类别登记已落盘缺陷，正文一律不动。一，首块规模缺口：首次 Write 落 $19015$ 字节，距两万下限差 $985$ 字节；协议规定 Write 仅一次，缺口为永久项，总量已靠后续追加补足并以收工复量为准。二，前向引用节号错位：§5 末段与 §6 追加段各有一处写了"§14"，其语义真正指向 §15（零集延拓在 06-coupling.tex 末段、四次项放缩在 §15），§14 实际只讨论变权两代价；已落盘，不搬不抄改。三，行号引注错位：§21 设想二括注给出 08-classification.tex:147--150 以支持"下界不需要单块归零"，该陈述的真位置在 08-classification.tex:73--77；所引行段本身是下界证明里的一致性与期望交换合法化，引用可核对但命题错配。四，素材公式标签形态泄漏：§12 第二段一处把弱范数方程的编号写成了素材里的交叉引用命令形态（带反斜杠的 eqref 类），违反"标签形态不抄正文"，全文实测仅此一处；不做就地改字。五，未翻译英文残留：§19 一处保留了局部等距 germ 概念的英文复数形，应作中文；仅此一处。六，除上述外，禁串类与长停顿号实测零命中；自定义宏无展开需求（素材前言只有定理环境与标准宏包，见 paper.tex:10--13），正文自始至终未书写任何素材私有宏名。

七，节标题符号重复：§23 的标题行把节号标记连写了两次，属落盘缺陷，按协议不就地改字，在此登记；该节以"收工自检"四字定位，其余各节标题形态正常，编号自 §0 连续到 §25 无跳号。八，自检段取证次数表述有误：原文写"取证调用 $14$ 次（$13$ 次读素材 .tex 加 $1$ 次列目录结构）"，实测该会话读素材 .tex 为 $14$ 次、列目录结构 $1$ 次，合计 $15$ 次，恰好落在上限之内而未越界；派单参数所在队列行的核读由一次定点检索完成，那一次按规格属参数表步骤，未计入取证口径，若一并计入则素材侧检索总数为 $16$，该口径差异一并登记，不事后改述。九，首次落盘的调用序号在 §23 只写了"落在规定的调用窗口内"而未给具体值，具体值在本笔记交付报告中实测给出（第 $18$ 次调用），此处补登记以免读者误认为漏检。十，本节末尾这三条为收工前最后一次纯追加，锚点取当时最末一段全文逐字，未触碰任何更早内容；追加幅度约 $1.2$ 千字节，在单次上限之内。

十一，定界符计数口径：§23 自检段有一处把行内数学定界符本身当作字符写出（讲述该符号需复量为偶数的那句），因此全文该字符的出现总次数为奇数 $2763$，其中仅此一例为单写；剔除这一处后成对定界符为 $2762$ 枚，为偶数，逐行核验也只有该行为奇数 $15$ 枚，其余各行均为偶数，正文数学模式无未闭合、无把闭合定界符误打成立即定界符形态的情形（全文实测该字符之外的行内代码记号为 $0$ 处）。已落盘，不就地改字。十二，上一条追加段自称"这三条"，实际登记了四条（七、八、九 加该条自身），措辞偏省，语义指向清楚，登记备查。

十三，上一条里给出的两枚计数是在该段自身落盘之前量得，段落本身又新增了定界符，所以那两个数值在落盘后即刻失效；为阻止继续漂移，本段刻意不含任何行内数学定界符与行内代码记号。本段落盘后全文定界符总枚数为 2771，其中单写一例仍在 §23 自检段（就是那句讨论该符号复量须为偶数的话），余下 2770 枚两两成对；逐行奇偶核验只有那一行为奇数，其余各行皆偶，结论与十一条同型：数学模式无未闭合，也无把闭合定界符误打成立即定界符形态的情形。字节规模不在本段书写，以收工复量的两次实测值与交付报告为准。本段仍是纯追加，锚点取当时最末一段全文逐字，未触碰任何更早内容。
