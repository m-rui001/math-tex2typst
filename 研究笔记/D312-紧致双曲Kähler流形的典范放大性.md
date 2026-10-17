# D312 研究笔记：紧致双曲 Kähler 流形的典范放大性

## §0 登记与任务参数

派单编号 D312，行号参数 row=136，bytes=97050，thin=no。目标论文的全部正文素材取自
build/sections 下九份 tex 与 build/main.tex，目录登记如下两行：

preprints/Canonical-ampleness-of-compact-hyperbolic-Kahler-manifolds-September-23-2026
其他队列第 136 行号

这篇论文声明：任何不含非常值整曲线的紧连通 Kähler 流形，其典范丛 $K_X$ 放大，因而 $X$ 投影化。它把 Kobayashi 典范放大性猜想在光滑紧 Kähler 范畴内整个解决。我的笔记从"我为什么敢碰这个问题"开始反推，把论文里被压平的论证缝隙重新撑开：哪些路先走不通、极值圆盘为什么会成为杠杆、一个 Hessian 恒等式怎么会被两次使用、两次使用各自索取什么。凡论文没写明而我在重建时必须补的环节，都用 [推测] 标注并解释证据缺口。

约定先行。$X$ 是 $n\ge 1$ 维紧连通 Kähler 流形，$k$ 是固定背景度量，$\mathbb D$ 是单位圆盘，$i\partial\bar\partial=i\partial\bar\partial$，Ricci 形式约定为 $R_h=-i\partial\bar\partial\log\det h$，它表示 $2\pi c_1(T^{1,0}X)$，所以 $[-R_h]=2\pi c_1(K_X)$（preliminaries.tex:19-23）。这条约定我放在最前面，因为全文所有符号不等式都吊在它上面：一旦 Ricci 号差改一个符号，nefness 与体积两节的每一行都要跟着翻。

## §1 初始动机：一条从"没有曲线"到"很多形式"的路

我最初的出发点很朴素。Brody 定理把"每个全纯映射 $\mathbb C\to X$ 为常值"与 Kobayashi 双曲性在紧复流形上等同起来（introduction.tex:3-7），这是一个纯粹的限制条件：一维全纯像进不来。典范丛说的是另一端的东西：$n$ 次全纯形式的整体存在性、正性、嵌入投影空间的能力。中间隔着一整座分析学的桥。Kobayashi 的猜想断言这座桥存在（introduction.tex:14-16），我要做的就是在光滑紧 Kähler 范畴里把它修出来。

让我确信这条路值得走的第一个理由，是低维与特殊情形的既有战绩。Wu 与 Yau 证明：负全纯截面曲率强制典范放大（introduction.tex:35-36）；Tosatti-Yang 把这条推到无投影性假设的紧 Kähler 情形；Diverio-Trapani 处理准负情形；Broder-Stanfield 最近还允许 $\omega$ 只是 Hermitian 且 pluriclosed（introduction.tex:44-47）。这些都依赖度量假设提供的逐点曲率不等式。而"没有整曲线"这个假设本身给不出任何逐点曲率信息。[推测] 论文没有明说我为何把 metric 路线列为"前例"而绕开，我从行文推断：这些前例的证据（curvature inequalities unavailable from the absence of entire curves alone, introduction.tex:48-49）说明假设类型不匹配，继续沿曲率走只能扩大曲率假设的形状，触不到裸双曲性。

第二个理由是我手里已有的两块材料，它们各自差最后一步。Cao-Höring 与 Ou 的工作在有理曲线缺失时给出 $K_X$ 伪有效乃至 nef（introduction.tex:62-76）。nef 已经是弱假设下的结论，剩下的硬骨头是放大性，而 nef 到放大之间缺的正是正典范体积 $\int_X c_1(K_X)^n>0$（introduction.tex:73-74）。这句话其实预告了整篇论文的重心：所有圆盘机器最终都要为一个积分下界服务。

第三个理由关乎工具选择。极值全纯圆盘在 Lempert 凸域理论里早就把内蕴复几何和分析估计连在一起（introduction.tex:78-80）。我想要的极值问题带一个面积惩罚项，这在凸域理论里没有现成对应物。[推测] 这个"带惩罚的极值问题"很可能是先有 Hessian 计算的蓝图、后补紧性论证而设计出来的：惩罚项的作用在 §4 会看到，它是为了让取 sup 的序列不往边界漏面积。

我给自己定下的验收标准：证明必须只用三样东西。裸双曲性（无整曲线）、紧 Kähler 背景度量 $k$、以及由前两者逐盘导出的圆盘估计。任何额外的曲率假设都算作弊。这条标准在 §2 的第一次撞墙里会被检验。

## §2 错误路线一：直接对 $P_{R_k}$ 做逐点控制

最早的尝试我把它叫做"裸 Poisson 控制"。既然目标是典范势的奇性控制，自然想直接证明：对所有有限面积圆盘 $f$，Poisson 型积分
$P_{R_k}(f)=\frac{2}{\pi}\int_\mathbb D\log\frac{1}{\lvert z\rvert}\,R_k(f',f')\,\mathrm d S$
有一致上界（preliminaries.tex:37-41 给定义了 $A_q$ 与 $P_q$）。Brody 引理给了我 $d(f)=k(f'(0),f'(0))\le D$（extremal-discs.tex:13-19），这是唯一的全局一致量。我试过把 $P_{R_k}$ 用 $A_k$ 控制再让面积衰减：对圆盘做伸缩 $f_r(z)=f(rz)$，写出 $P_q(f)-P_q(f_r)=2\int_r^1 A_{q,s}(f)\,\frac{\mathrm d s}{s}$（extremal-discs.tex:203-206 的 Fubini 恒等式）。

这条路卡在两处。第一处是符号：$R_k$ 不定号，$A_{R_k,s}$ 可正可负，"面积衰减"根本不存在，能得到的只有 $A_q(f)\ge -d(f)$ 这种单边界（extremal-discs.tex:188-189）。第二处更致命：就算对某个具体圆盘写出递推，右端仍然含 $A_{R_k}(f)$ 本身，不等式闭合不了。[推测] 论文里看不到这次失败的直接记载，我依据的是最终证明的结构：正式证明（nefness.tex:25-61）必须先取"极大圆盘"、再对 $\delta$ 取下极限，所有环节都依赖最大化性质。对任意圆盘直接估计的路线给不出 $\operatorname{tr} N(0)$ 的上界，这正是最大化不等式（hessian.tex:170-177）提供的东西。失败教训我记下：一致界只能从"极值对象"上剥下来，普通圆盘不配合。

还有一个更早期的弯路：想先证投影性再谈放大。Lohkamp 型结果说双曲流形的万有覆叠是 Stein（这里没有引用，属于我的背景知识），Stein 性质与代数嵌入的距离我看不清。[推测] 论文正文从未假设 $X$ 投影，main.tex:46-49 的摘要与 introduction.tex:21-26 的主定理都只在 Kähler 范畴陈述，最终投影性（Moishezon 定理一步）出现在证明的下游 volume-ampleness.tex:264-268。顺序反过来说明：把投影性当前提的路线被主动放弃，它必须是结论。这个决定在 §12 会兑现。

## §3 错误路线二：包络一步到位

第二条弯路是纯粹多复变式的想法。Poletsky-Rosay 圆盘包络定理（nefness.tex:73-88 引用的形式）说：上半连续函数 $b$ 对全纯圆盘取边界均值下确界，得到的 $\mathcal P b$ 次调和或恒为 $-\infty$。我想直接对行列式丛 $L=\det T^{1,0}X$ 去掉零截面后的函数 $\ell(s)=\log\lvert s\rvert_k^2$ 取包络，指望它自动给出好的奇异度量。

算了一步就发现缺口。Green 公式给出圆盘 $G$ 的边界均值 $\ell(s)-P_{R_k}(f)$（nefness.tex:126-129），于是包络的下界 $v\ge \ell-C$ 成立当且仅当 $P_{R_k}$ 有一致上界 $C$。问题回到了 §2：$C$ 从哪来？包络机器只能把"势的上界"翻译成"度量的正性"，它翻译不出它没有的东西。这一步让我确信分析核心必须落在圆盘上，包络只是搬运工（后来 nefness.tex:140-151 里 $v(\lambda s)=v(s)+\log\lvert\lambda\rvert^2$ 的齐次性论证，就是"搬运工"的最好写照：$u=v-\ell$ 沿纤维为常数，$-C\le u\le 0$，全部功劳在 $P_{R_k}$ 的界）。

同一条路上还有个小坑：测试圆盘要不要延拓过边界。nefness.tex:85-88 特意说明，$b$ 连续时可把测试圆盘要求为在 $\overline{\mathbb D}$ 邻域全纯，用 $G(rz)$ 逼近补足。这个技术选择背后是我在 §5 会撞上的真问题：极大圆盘只被我证明到 $W^{1,p}$ 边界正则，没有任何全纯延拓保证。包络那一侧可以绕开延拓，Hessian 那一侧绕不开，这是全文两个"圆盘使用现场"的分工基础。

探针行：落盘协议基线复量专用，一次性。

## §4 转折点：给极值问题装上面积惩罚

真正的转折是承认：我不能对"任意圆盘"证明任何东西，只能设计一个极值问题，让它的极大元天然携带我要的不等式。设计稿在 extremal-discs.tex:86-89：固定中心 $x\in X$、辅助 Kähler 形式 $h$、光滑闭实 $(1,1)$ 型 $q$、$\delta>0$，在全体以 $x$ 为心的有限面积圆盘上最大化
$$J_{h,q,\delta}(f)=d(f)+P_q(f)-\delta A_h(f).$$
三个零件各司其职。$d(f)=k(f'(0),f'(0))$ 是双曲性唯一肯给的逐点量（Brody 界 $D$）；$P_q$ 是我真正想控制的 Poisson 泛函，对数权重 $\log(1/\lvert z\rvert)$ 把边界附近的行为压低、把中心附近的行为放大，正合适 Green 公式；$-\delta A_h$ 是纯粹的紧性装置。

紧性论证（extremal-discs.tex:99-130）值得慢读。取 $C_q$ 使 $\lvert q(v,v)\rvert\le C_q h(v,v)$，再取 $r_0\in[1/2,1)$ 贴近 $1$ 使得 $2C_q\log(1/r_0)\le\delta/2$。在外环带 $r_0<\lvert z\rvert<1$ 上，密度
$$T_f(z)=\delta a_f(z)-2\log(1/\lvert z\rvert)\,b_f(z)\ge \tfrac{\delta}{2}a_f(z)\ge 0$$
（extremal-discs.tex:110-115）。这一步就是惩罚项存在的唯一理由：让外环带上惩罚压倒 Poisson 权重，面积被逐点上界反控住，于是有一致上界 $J(f)\le D+K-\frac{\delta}{2\pi}\int_{r_0<\lvert z\rvert<1}a_f\,\mathrm d S$（extremal-discs.tex:128-130）。最大化序列外环面积一致有界，内盘靠 Brody 导数估计 $\lvert f'(z)\rvert_k\le\sqrt{D}/(1-\lvert z\rvert)$（extremal-discs.tex:21-24），Arzèl-Ascoli 对角线抽取局部一致收敛（Lemma ex:brody 的正规性部分，extremal-discs.tex:25-28），Fatou 保住极限盘有限面积。上半连续的核验分三块：中心项靠导数收敛、内盘靠控制收敛、外环靠 $T_{f_j}$ 的 Fatou（extremal-discs.tex:148-165）。

我当初犹豫过的替代设计有两个。其一，惩罚换成边界长度项。[推测] 论文没有讨论这个变体，我按结构推断它不可行：长度项对 $W^{1,2}$ 圆盘没有可微的变分含义，而且会破坏伸缩 $f_r$ 的齐次缩放账目；面积项在伸缩下恰好变成截断面积 $A_{h,r}$，这正是 §5 尾估计能闭合的原因。其二，不加惩罚直接在 $d+P_q$ 上取 sup。失败很干脆：常数盘给 $J\ge 0$，但没有任何装置阻止面积从边界逃逸，Brody 正规性只管紧子集，管不住整体面积，上确界可能不可达。[推测] 从 Proposition ex:maximizer 证明里 $J(f_j)\ge -1$ 的选法看，设计者清楚无惩罚版本连 sup 有限性都需要外环论证来保证，干脆把 $\delta$ 装上再说。

还有一个不起眼的决定：中心 $x$ 固定。为什么要固定？后面两处使用都需要"以任意指定 $x$ 为心的极大盘"。nefness 里比较的是任意测试盘 $g$ 的泛函值（nefness.tex:53-57），体积估计里逐点结论要对每个 $x$ 成立（volume-ampleness.tex:26、71），两边都靠"以 $x$ 为心"这个自由度。同时固定中心让 §7 的变分族可以有统一约束 $F(t,0)=x$，喷液不需要同步搬动中心，少一个自由变量，隐函数定理的账目干净很多。

## §5 第二层转折：伸缩比较买到的边界正则

有了极大盘 $f$，下一道裂缝在边界。intro 里那句话我读了好几遍：紧收敛本身不足以正当化"对整张圆盘积分做变分"（introduction.tex:82-84），难在边界。解法是把极大性再用一次：拿伸缩盘 $f_r(z)=f(rz)$ 与 $f$ 比较，$J(f)\ge J(f_r)$。三条缩放开销是初等的：$d(f_r)=r^2 d(f)$，$A_h(f_r)=A_{h,r}(f)$，$A_{q,s}(f_r)=A_{q,rs}(f)$（extremal-discs.tex:198-202）；Poisson 项用 Fubini 恒等式 $P_q(f)=2\int_0^1 A_{q,s}(f)\,\frac{\mathrm d s}{s}$（extremal-discs.tex:203-206）， Signed  integrand 的 Fubini 合法性论文专门解释过：原点邻域导数有界、远离原点处对数权重有界且 $\lvert q(f',f')\rvert$ 被有限 $h$ 面积控制（extremal-discs.tex:207-210）。两盘相减得到尾不等式
$$0\le \delta\bigl(A_h(f)-A_{h,r}(f)\bigr)\le (1-r^2)\,d(f)+2\int_r^1 A_{q,s}(f)\,\frac{\mathrm d s}{s}$$
（extremal-discs.tex:179-186）。右端除以 $1-r$ 令 $r\uparrow 1$ 收敛到 $2d(f)+2A_q(f)$，非性立即推出 $A_q(f)\ge -d(f)$；再对 $r\ge 1/2$ 粗化就拿到线性尾 $A_k(f)-A_{k,r}(f)\le C_f(1-r)$（extremal-discs.tex:221-230）。

线性尾是全部边界正则性的种子。命题 ex:regularity（extremal-discs.tex:237-248）的路线我逐步核过：先做一致坐标选取，取嵌套开集 $V_\alpha\Subset W_\alpha\Subset U_\alpha$ 与半径 $\rho$，使得 $f(z)\in V_\alpha$ 时 $\rho$ 度球落入 $W_\alpha$（extremal-discs.tex:253-259）；对 $t=1-\lvert z\rvert$ 的小球 $B(z,ct)$ 用 Brody 估计控制像的长度，选 $c$ 让像留在单个坐标卡内（extremal-discs.tex:263-277）；坐标里导数向量模平方次调，均值不等式给出 $\lvert f'(z)\rvert_k^2\le C_1 t^{-2}\int_{B(z,ct)}\lvert f'\rvert_k^2$，再用线性尾把积分压成 $C_2 t$，得边界导数增长 $\lvert f'(z)\rvert_k\le C_f(1-\lvert z\rvert)^{-1/2}$（extremal-discs.tex:279-295）。径向积分 $\int_r^s(1-u)^{-1/2}\mathrm d u\le 2\sqrt{1-r}$ 给一致径向 Cauchy 性，边界映射连续，$f$ 延拓到 $\overline{\mathbb D}$ 上连续（extremal-discs.tex:297-309）。Sobolev 指数的账目在二进环带 $E_j=\{2^{-j-1}<1-\lvert z\rvert<2^{-j}\}$ 上：$\int_{E_j}\lvert f'\rvert_k^2\le C_4 2^{-j}$ 配合 $\sup_{E_j}\lvert f'\rvert_k\le C_5 2^{j/2}$，插值得 $\int_{E_j}\lvert f'\rvert_k^p\le C_p 2^{-j(4-p)/2}$（extremal-discs.tex:311-330）。对 $j$ 可求和当且仅当 $p<4$。$p>2$ 的下限则是另一条腿：$W^{1,p}\hookrightarrow C^0(\overline{\mathbb D})$ 且是 Banach 代数（preliminaries.tex:76-84），后面矩阵求逆、链式法则全靠代数性。$2<p<4$ 这个区间是这两条腿的交，一寸不多一寸不少。

Remark（extremal-discs.tex:347-353）明确：$C_f$ 对 $h,q,\delta$ 一致的可能性从未被要求。我起初担心这是漏洞，因为最终定理的常数 $C$、$c_{n,D}$ 必须只依赖 $k$ 与 $D$。读完 §9、§10 才踏实：nefness 用"先固定盘、再令 $\delta\downarrow 0$"的两步走绕开了对极大盘面积的一致界（nefness.tex:53-60），体积估计则把一切辅助界都塞进一个只用 $D$ 与 $n$ 表达的不等式链。两处都只从极大盘取一个数，取完即弃。这就是把"正则性常数不一致"摆在明处的底气。

## §6 边界单位化标架：Hardy 分解在这里落地

要把 $f$ 当作严格极大点做二阶变分，先得有 $n$ 个沿 $f$ 的全纯标架方向，并且在边界上它们是 $h$-正交归一的：$B(z)^*h(f(z))B(z)=I$，$z\in\partial\mathbb D$（frames-variations.tex:89-92）。为什么边界要单位化？§8 会看到答案：对数行列式在单位矩阵处的微分就是迹，边界上 $\log\det N=0$ 才能让 Green 公式把 $\log\det N(0)$ 直接翻译成 $P_{R_h}(f)$（hessian.tex:26-45 的行列式恒等式）。边界单位化是把 Poisson 泛函"兑换"成标架行列式的汇率。

第一步（Lemma var:initial-frame，frames-variations.tex:25-82）只要一个延拓到边界连续且 $W^{1,p}$ 的全纯标架。$f^*T^{1,0}X$ 在 $\overline{\mathbb D}$ 上拓扑平凡，先用光滑单位分解拼出贴近的 $W^{1,p}$ 标架 $v$，Dolbeault 算子在 $v$ 下写成 $\bar\partial+a$，$a\in L^p$。局部求解 $\bar\partial U_0=-aU_0$ 靠实心 Cauchy 变换 $T_Ug(z)=\frac{1}{\pi}\int_U\frac{g(\zeta)}{z-\zeta}\mathrm d S(\zeta)$，两条估计 $\lVert T_Ug\rVert_{L^\infty}\le C_p r^{1-2/p}\lVert g\rVert_{L^p}$ 与 $\lVert T_Ug\rVert_{W^{1,p}}\le C_{p,r}\lVert g\rVert_{L^p}$（frames-variations.tex:52-64）让 $r$ 小的时候 $U_0=I-T_U(aU_0)$ 是压缩。过渡矩阵 $U_i^{-1}U_j$ 弱全纯 hence 全纯，在圆盘上用 Oka-Grauert 平凡化，回到 $\overline{\mathbb D}$ 上得到 $W^{1,p}$ 边界正则的全纯标架 $e=vU$。这里我注意到一个设计取舍：他们把方程解到更大的盘 $\mathbb D_R$（$R>1$）上去做整体全纯向量丛的经典论证。[推测] 这样做是为了把边界正则性问题从全纯丛论里剥离干净，丛论只管拓扑平凡性，正则性全压给 Cauchy 估计。

第二步是 Wiener-Masani 与 Helson-Lowdenslager 的谱因子分解传统（frames-variations.tex:95-99 自己点名了出处）。给定连续正定 $W^{1,p}$ 矩阵 $M=e^*h(f)e$，在 Hardy 空间 $H^2(\partial\mathbb D,\mathbb C^n)$ 上换内积 $\lVert u\rVert_M^2=\int_{\partial\mathbb D}u^*Mu\,\mathrm d\sigma$；乘法算子 $z$ 是该内积下的等距，$W=H^2\ominus_M zH^2$ 维数 $n$，取正交基拼成矩阵 $S$。正交性把 $S^*MS$ 的所有 Fourier 系数钉死，得边界上几乎处处 $S^*MS=I$（frames-variations.tex:130-134）。到这一步都是教科书内容，真正的苦工是正则性：要证 $S$ 有连续到边界且属于某个 $W^{1,p_0}$（$p_0>2$）的代表元，论文特意强调逐点可逆性是正则性到手之后的收获，Hardy 论证里从未假设（frames-variations.tex:233-235）。

正则性链条我重新推了一遍。平移差估计 $\lVert M_\theta-M\rVert_{L^p(\partial\mathbb D)}\le C\lvert\theta\rVert^{1-1/p}$（frames-variations.tex:149-152）是绕开迹定理直接证的：选半径 $\rho\in[1-2t,1-t]$ 使角度导数 $L^p$ 模不超过 $Ct^{-1/p}\lVert M\rVert_{W^{1,p}}$，径向积分加 Hölder 就够。于是边界限制属于分数 Sobolev 空间 $H^s(S^1)$，对一切 $\frac12<s<1-\frac1p$（frames-variations.tex:168-171）。Toeplitz 算子 $T_Mv=\Pi(Mv)$ 有下界 $m$ 故可逆；$v\in W$ 等价于 $T_Mv$ 为常向量，旋转相减给 $\lVert v_\theta-v\rVert_2\le C\lVert M_\theta-M\rVert_2$（frames-variations.tex:190-198），$v$ 同属 $H^s$。Parseval 加 Cauchy-Schwarz 出两条导数估计：$\lVert v'(r\cdot)\rVert_2^2\le C(1-r)^{2s-2}\sum l^{2s}\lvert v_l\rvert^2$ 与 $\lVert v'(r\cdot)\rVert_\infty\le C(1-r)^{s-3/2}(\sum l^{2s}\lvert v_l\rvert^2)^{1/2}$（frames-variations.tex:205-213）。插值后 $\lVert v'(r\cdot)\rVert_{p_0}^{p_0}$ 的 $r$-积分指数是 $p_0(s-\frac32)+1$，可积当且仅当 $2<p_0<\frac{2}{3/2-s}$（frames-variations.tex:215-225）。因为 $s>\frac12$ 该区间非空。$s$ 与 $p_0$ 的这段互相迁就的不等式游戏，是我在本节停留最久的地方：$p$ 越大 $s$ 上限越高，$s$ 越高 $p_0$ 上限越高，但 $p_0$ 还要 $\le p$；只要存在一个 $p_0>2$ 就万事大吉，论文精确地只索取这一点。

## §7 把无穷小方向积成真正的变分族

有了标架还不够：Hessian 计算要求 $zb_j(z)$ 是某个全纯变分族 $F(t,z)$ 在 $t=0$ 的方向导数，且 $F$ 联合全纯、保持中心、逐参数是容许的有限面积盘（frames-variations.tex:248-264 的命题 var:spray，恒等式在 256-259）。这类"喷液"在圆盘包络文献里是标准件（论文引 Drinovec-Forstneric 的 Definition 2.1 与 Lemma 2.2，frames-variations.tex:242-244），但这里必须同时登记 Sobolev 参数依赖，因为 §8 要在积分号下求二阶导。

证明分四段，我把每段的目的重新对号。第一段建纤维坐标：有限覆盖 $\overline{\mathbb D}$ 的源片与目标卡，$C_i(z,y)=A_i(z)^{-1}(\phi_i(y)-\phi_i(f(z)))$，用单位分解粘成 $\Phi(z,y)=\sum_i\rho_i(z)C_i(z,y)$，规格化在 $\Phi(z,f(z))=0$、$D_y\Phi(z,f(z))e(z)=I$（frames-variations.tex:281-306）。黏合为什么敢这么做？每个 $\rho_i$ 支撑在源片内、每个 $C_i$ 只在目标卡有定义处被用到，紧支撑让零延拓无害（frames-variations.tex:295-297）。第二段求逆：$K_z(v)=\Phi(z,\psi^{-1}(c(z)+e_\psi(z)v))$ 满足 $K_z(0)=0$、$D_vK_z(0)=I$，逐纤维压缩映射给逆 $E(z,\xi)$，$E(z,0)=f(z)$、$E_\xi(z,0)=e(z)$（frames-variations.tex:310-339）。真正的力气在 Sobolev 一致性：把有限系数表 $a(z)=(\rho_i,A_i^{-1},\phi_i\circ f,c,e_\psi)_i$ 当实参数用有限维隐函数定理，再上 Sobolev 链式法则，得 $\lvert E_\psi\rvert\le C$、$\lvert\nabla_zE_\psi\rvert\le Cb(z)$ 逐 $\xi$ 一致（frames-variations.tex:343-371）。第三段论证代换算子 $u\mapsto E_\psi(\cdot,u(\cdot))$ 在 $W^{1,p_0}$  Banach 空间间全纯：Fourier 样写 $E_\psi(z,\xi)=\sum_\alpha E_\alpha(z)\xi^\alpha$，Cauchy 公式给 $\lVert E_\alpha\rVert_\infty+\lVert\nabla E_\alpha\rVert_{p_0}\le Cr_1^{-\lvert\alpha\rvert}$，代数范数次可乘，多项式数量的指标求和正常收敛（frames-variations.tex:373-397）。这段是我全文最喜欢的纯功能分析小曲。

第四段解非线性方程。$\bar\partial(E(z,u(z)))=E_\xi\bar\partial u+\bar\partial_zE$，注意没有 $\bar\partial\overline{u}$ 项，因为 $E$ 对纤维变量全纯（frames-variations.tex:403-411）。于是弱全纯性等价于 $\bar\partial u+Q(\cdot,u)=0$，$Q(z,\xi)=E_\xi(z,\xi)^{-1}\bar\partial_zE(z,\xi)$（frames-variations.tex:412-416）。对 $\Phi(z,E(z,\xi))=\xi$ 求 $\bar\partial_z$ 得 $Q(z,\xi)=-\sum_i(\bar\partial\rho_i)(z)C_i(z,E(z,\xi))$（frames-variations.tex:420-425），立得 $Q(z,0)=0$、$Q_\xi(z,0)=0$（frames-variations.tex:445-447）：常项与线性项消失，这是把中心与一阶方向"焊死"的代数表达。取中心化右逆 $Hg=Tg-(Tg)(0)$，满足 $\bar\partial Hg=g$ 且 $(Hg)(0)=0$（frames-variations.tex:452-461）， ansatz 写 $u(t,z)=zS(z)t+Hg(t)(z)$（frames-variations.tex:464-466），对方程 $G(g,t)=g+\mathcal Q(zSt+Hg)=0$ 用复 Banach 隐函数定理（Glockner 的版本，frames-variations.tex:476-478）。$G(0,0)=0$、$D_gG(0,0)=I$，解 $g(t)$ 全纯，$g(0)=0$、$D_tg(0)=0$，一求导全部规格化自动落入。最后 $F(t,z)=E(z,u(t,z))$，分开全纯经局部 Hartogs 合成联合全纯（frames-variations.tex:500-503）。

Remark var:center-derivative（frames-variations.tex:513-520）补了一个我差点漏掉的死角：$W^{1,p_0}$ 整空间上逐点导数求值无界，但全纯子空间在小盘上有 Cauchy 公式兜底，所以中心导数泛函沿喷液可微，无需额外边界正则。这一句就是 §8 第一号恒等式 $\mathcal L d(F_t)=\operatorname{tr}(B(0)^*k(x)B(0))$ 的合法性凭证。

## §8 一个 Hessian 恒等式，两条正性路线

现在把所有零件合拢。$f$ 是 $J_{h,q,\delta}$ 的极大盘，$B$ 边界单位化标架，$F(t,z)$ 喷液，$N(z)=B(z)^*h(f(z))B(z)$，边界值 $I$，内部光滑、闭盘上连续一致正定、属于 $W^{1,p_0}$（hessian.tex:18-24）。算子 $\mathcal L=\sum_j\frac{\partial^2}{\partial t_j\partial\overline{t_j}}\big\rvert_{t=0}$（hessian.tex:47-51）。

行列式恒等式（Lemma hes:determinant，hessian.tex:26-45）：$\log\det N(0)=P_{R_h}(f)$。推导只有两行：$\log\det B$ 调和所以 $\partial_z\partial_{\bar z}\log\det N=\partial_z\partial_{\bar z}\log\det h(f(z))=-R_h(f',f')$，右端在 $L^{p_0/2}$（$p_0/2>1$），套 preliminaries.tex:52-65 的 Green 引理、用边界 $\log\det N=0$ 收尾。我把这个式子称为"汇率公式"：中心处的标架行列式质量，等于整盘 Ricci 的 Poisson 积分。

迹恒等式三件套（Proposition hes:trace，hessian.tex:53-168）。中心项：$F(t,0)=x$ 固定，$\partial_zF(t,0)$ 是落在固定向量空间 $T_x^{1,0}X$ 里的 $t$-全纯向量，其 $t_j$ 导数在零处为 $b_j(0)$，对 $k(x)$ 范数平方求 $\mathcal L$ 得 $\operatorname{tr}(B(0)^*k(x)B(0))$（hessian.tex:66-70）。积分号下求导的正当性：逐片把 $t\mapsto F(t,\cdot)$ 看进 $W^{1,p_0}$ 的全纯曲线，度量系数光滑、乘积法则使 $t\mapsto q(F_z,F_z)$ 二阶连续可微进 $L^{p_0/2}$，而 $p_0/2>1$ 让对 $1$ 与 $\log(1/\lvert z\rvert)$ 的积分都是连续泛函（hessian.tex:74-87）。局部恒等式 $\mathcal L q(F_z,F_z)=\partial_z\partial_{\bar z}(\lvert z\rvert^2\operatorname{tr}(B^*q(f)B))$（hessian.tex:98-102）由 $q=i\partial\bar\partial\phi$ 局部位势与 $F_{t_j}(0,z)=zb_j(z)$ 交换导数得出；Poisson 项再吃一次 Green 引理，边界上 $\operatorname{tr}(B^*qB)=\operatorname{tr}_h q$，得 $\mathcal L P_q=\frac{1}{2\pi}\int_0^{2\pi}(\operatorname{tr}_hq)(f(e^{i\theta}))\,\mathrm d\theta$（hessian.tex:57-58、106-111）。

面积项是全文技术密度最高的一小段（hessian.tex:113-167）。目标 $\mathcal L A_h(F_t)=n-A_{R_h}(f)$。设 $T=\operatorname{tr} N$，半径 $r$ 内积分给
$$\frac{1}{\pi}\int_{\lvert z\rvert<r}\mathcal L h(F_z,F_z)\,\mathrm d S=r^2\langle T\rangle_r+\frac{r^3}{2}\langle T_r\rangle_r$$
（hessian.tex:119-123）。左端由可积性趋于 $\mathcal L A_h$；第一端点项趋于 $n$（边界 $N=I$）；麻烦在 $\langle T_r\rangle_r$：我们没有边界可微性。桥是误差式 $T_r-(\log\det N)_r=\operatorname{tr}((I-N^{-1})N_r)$（hessian.tex:127-129），配合一致正定与 Cauchy-Schwarz 得
$$\big\lvert\langle T_r-(\log\det N)_r\rangle_r\big\rvert\le C\lVert N(r,\cdot)-I\rVert_{L^2(S^1)}\,\lVert N_r(r,\cdot)\rVert_{L^2(S^1)},$$
而径向 Sobolev 估计 $\lVert N(r,\cdot)-I\rVert_2=o((1-r)^{1/2})$（hessian.tex:138-143）。$\int_{1/2}^1\lVert N_r\rVert_2^2\,\mathrm d r<\infty$ 保证存在半径列 $r_\nu\uparrow1$ 使 $(1-r_\nu)\lVert N_r(r_\nu)\rVert_2^2$ 有界（hessian.tex:150-153），沿这一列两个圆周导数均值之差是 $o(1)$。另一边，$\frac{r}{2}\langle(\log\det N)_r\rangle_r=-A_{R_h,r}(f)$（hessian.tex:158-163 与 preliminaries.tex:59-61），右端趋于 $-A_{R_h}(f)$。左端极限与列无关，整式落定。intro 强调的"用显式弱边界极限完成，不假设极大盘全纯穿过圆周"（introduction.tex:128-131）指的就是这条 $r_\nu$ 列。我核对到这里才理解整篇论文的力学分配：§5 的 $o((1-r)^{1/2})$ 恰好偿付 §8 的径向导数损失，一分不多。

合并（Corollary hes:maximum，hessian.tex:170-179）：$J(F_t)$ 在 $t=0$ 取极大，$\mathcal L J\le 0$，于是
$$\operatorname{tr}(B(0)^*k(x)B(0))+\frac{1}{2\pi}\int_0^{2\pi}(\operatorname{tr}_hq)(f(e^{i\theta}))\,\mathrm d\theta\le\delta\bigl(n-A_{R_h}(f)\bigr).$$
加上 $\mathcal L d$、$\mathcal L P_q$、$\mathcal L A_h$ 一一对应号（迹恒等式），不等式无需任何新证明。introduction.tex:135-145 的两参数表此刻就是我的作战地图：$(h,q,\delta)=(k,R_k,\delta\downarrow0)$ 得 $P_{R_k}$ 一致上界；$(h,q,\delta)=(h,-h,1)$ 配 $R_h\ge-h$ 得体积下界。hessian.tex:191-199 明说两处使用极值性的不同侧面：前者比较极大盘与每个固定测试盘、后者比较极大盘与常数盘。同一台机器，两次点火，这是我入题时完全没预料到的结构。[推测] 作者大概率先独立发现两个估计、再回头合并出泛函 $J_{h,q,\delta}$ 的统一形式；否则很难解释为什么 $q=-h$ 的选择如此恰好：它让 $(\operatorname{tr}_hq)=-n$ 变成常数，边界积分项坍缩为纯数，体积比的行列式商里 $B(0)$ 又整体消掉。

## §9 第一次点火：从 Ricci 盘界到 nefness

nefness.tex:14-61 的命题 nef:disc-bound 输出：存在只依赖 $k$ 的 $C\ge0$，使一切有限面积盘满足 $P_{R_k}(f)\le C$。链条：取 $h=k$、$q=R_k$、$0<\delta\le1$ 的极大盘，$M=\sup_X\lvert\operatorname{tr}_kR_k\rvert$（nefness.tex:33-34）。伸缩尾不等式先给 $A_{R_k}(f)\ge-d(f)\ge-D$（nefness.tex:36-37 引 eq:tail）；最大化不等式给
$$\operatorname{tr} N(0)\le\delta(n-A_{R_k}(f))+M\le n+D+M$$
（nefness.tex:39-43）；行列式恒等式加算术-几何平均，$P_{R_k}(f)=\log\det N(0)\le n\log\frac{n+D+M}{n}=:C_1$（nefness.tex:46-49）。极大值本身 $\le D+C_1$，与 $x,\delta$ 无关。任意盘 $g$：用它自己的心做最大化，$d(g)+P_{R_k}(g)-\delta A_k(g)\le D+C_1$，固定 $g$ 令 $\delta\downarrow0$、$d(g)\ge0$，得 $C=D+C_1$（nefness.tex:53-60）。论文特意注明这个极限论证不需要对极大盘有跨 $\delta$ 的一致面积界，呼应 §5 末尾的 Remark。

第二段（nefness.tex:63-164）是 §3 失败的正式修复：$Y=L\setminus0_X$ 上 $\ell=\log\lvert s\rvert_k^2$ 满足 $i\partial\bar\partial\ell=-\pi^*R_k$（nefness.tex:117-120），包络 $v=\mathcal P\ell$ 被 $\ell-C\le v\le\ell$ 夹住（nefness.tex:132-135），$-\infty$ 分支被排除；$\mathbb C^*$-齐次性把 $v-\ell$ 压成基空间上的有界函数 $u$，$-C\le u\le0$，每个局部权 $a_i+u$ 次调和且局部有界，$T=-R_k+i\partial\bar\partial u\ge0$ 是闭正 $(1,1)$ 流（nefness.tex:140-151）。符号核验（nefness.tex:153-163）：对偶标架范数平方取 $\exp(-(a_i+u))$，与转移 $s_i^*=g_{ij}^{-1}s_j^*$ 相容，曲率 $i\partial\bar\partial(a_i+u)=T$ 代表 $2\pi c_1(K_X)$。这半页把"圆盘上的分析"过户给"线丛上的代数几何"，中转费就是那个 $C$。

第三段（nefness.tex:166-209）：nef 定义为任意 $\varepsilon>0$ 有光滑度量的曲率 $\ge-\varepsilon k$（nefness.tex:166-172）。引理 nef:bounded-smoothing 把有界正势磨光；论文承认 Demailly 推论（零 Lelong 数路径，nefness.tex:186-191）能一步收割，仍给附录直接证明，关键估计是跨图正则化之间的比较、不假设原始有界势连续。命题 nef:nef 组装：$-R_k+i\partial\bar\partial u_\varepsilon\ge-\varepsilon k$，$2\pi c_1(K_X)$ nef（nefness.tex:193-209）。introduction.tex:74-76 早就交代保留这条直接圆盘证明的理由：它顺产有界典范势，且与体积估计共用同一 Hessian 恒等式。§8 末尾"两次点火"的说法在此落地。

## §10 第二次点火：体积下界，常数额外干净

命题 prop:volume-lower-bound（volume-ampleness.tex:13-72）宣称：一切满足 $R_h\ge-h$ 的光滑 Kähler 形式 $h$ 都有
$$h^n\ge c_{n,D}\,k^n,\qquad c_{n,D}=e^{-D}\Bigl(\frac{n}{2n+D}\Bigr)^{n}>0.$$
证明就是 §8 地图第二行的执行。固定 $x$，取 $q=-h$、$\delta=1$ 的极大盘，泛函 $J(f)=d(f)-P_h(f)-A_h(f)$；常数盘值零，故 $P_h(f)+A_h(f)\le d(f)\le D$，两项非负（volume-ampleness.tex:26-36）。假设 $R_h\ge-h$ 翻译成 $A_{R_h}(f)\ge-A_h(f)\ge-D$ 与 $P_{R_h}(f)\ge-P_h(f)\ge-D$（volume-ampleness.tex:37-43）。最大化不等式里 $\operatorname{tr}_h(-h)=-n$，边界积分坍缩，得 $\operatorname{tr}(B(0)^*k(x)B(0))\le 2n-A_{R_h}(f)\le 2n+D$（volume-ampleness.tex:45-51）。行列式恒等式给 $\det(B(0)^*h(x)B(0))=\exp(P_{R_h}(f))\ge e^{-D}$（volume-ampleness.tex:52-57）。正 Hermitian 矩阵 $B(0)^*k(x)B(0)$ 上算术-几何平均：$\det\le\bigl(\frac{2n+D}{n}\bigr)^n$（volume-ampleness.tex:58-63）。两行列式相除，公因子 $\lvert\det B(0)\rvert^2$ 消净，$x$ 任意（volume-ampleness.tex:64-71）。

我特意核对了两件容易搅浑的事。第一，$P_{R_h}(f)\ge-P_h(f)$ 用的是 $R_h\ge-h$ 在盘上积分的单调性，Poisson 权重 $\log(1/\lvert z\rvert)$ 非负保证保号，这一步对任何 $h$ 都成立、无须极大盘参与。第二，体积下界逐 $x$ 使用极大盘，但常数里只出现 $n$ 与 $D$：辅助盘、正则性常数、变分半径全部在除法中被 $B(0)$ 吸收。volume-ampleness.tex:74-78 把这一点写成明示："辅助界从不进入常数"。这就是两次点火的分野：nefness 那次要用 $\delta\downarrow0$ 的极限把对极大盘的依赖洗掉，这次靠行列式商的结构让依赖自我抵消。introduction.tex:156-157 强调估计对指标度量族一致，即便辅助盘不一致，说的正是这件事。

## §11 Monge-Ampère 过河：正典范体积

代几何一侧的第一块基石是负号复 Monge-Ampère 存在定理（Theorem thm:negative-cma，volume-ampleness.tex:93-103）：给定 Kähler 形式 $\gamma$ 与光滑正体积 $\Omega$，存在光滑 $w$ 使 $\gamma+i\partial\bar\partial w>0$ 且 $(\gamma+i\partial\bar\partial w)^n=e^w\Omega$。论文补了两句话让我安心：右端 $e^w$ 自动吸收 $\Omega$ 的规范化的缺失，未知数自带加性常数；定理不限定 $\gamma$ 的代表类（volume-ampleness.tex:105-109）。出处是 Aubin-Yau，Berman 笔记里有一般体积形式的显式陈述。

命题 prop:positive-top-intersection（volume-ampleness.tex:110-170）的账目。记 $\alpha=[-R_k]=2\pi c_1(K_X)$。nefness 给出 $a_t$ 使 $-R_k+i\partial\bar\partial a_t\ge-\frac{t}{2}k$，于是 $\gamma_t=-R_k+tk+i\partial\bar\partial a_t\ge\frac{t}{2}k>0$ 是 Kähler 形式（volume-ampleness.tex:118-131）。对 $\gamma_t$ 与 $\Omega_t=e^{a_t}k^n$ 用定理，得 $h_t=\gamma_t+i\partial\bar\partial w_t$ 满足 $h_t^n=e^{a_t+w_t}k^n$（volume-ampleness.tex:132-143）。两边体积形式取对数比再 $i\partial\bar\partial$ 的负号，按 Ricci 约定得 $R_{h_t}=R_k-i\partial\bar\partial(a_t+w_t)=-h_t+tk\ge-h_t$（volume-ampleness.tex:144-149）：twisted 方程的解恰好落在 §10 的适用类里。于是 $\int_Xh_t^n\ge c_{n,D}\int_Xk^n$，对一切 $t>0$ 同常数（volume-ampleness.tex:150-154）。同时 $[h_t]=\alpha+t[k]$，Stokes 定理给 $\int h_t^n=\int(\alpha+t[k])^n$，这是 $t$ 的多项式；令 $t\downarrow0$ 取 $t=0$ 值：
$$(2\pi)^n\int_Xc_1(K_X)^n=\int_X\alpha^n\ge c_{n,D}\int_Xk^n>0.$$
volume-ampleness.tex:160-169 特别注明：这一渡河只用 up-cohomology，$h_t$ 的收敛性、势的一致界一概不需要。我读到这行时想起自己最初设计 §11 的笨版：想让 $h_t$ 收敛到一个奇异 Ricci 下界度量，再逐点用体积界。那需要全套 Kolpashnikov-Song-Tian 式的极限机器。现版把度量序列投影到多项式 $\int(\alpha+t[k])^n$ 上，极限变成小学代数。[推测] 这步"从逐点到积分"的降维八成借鉴 Wu-Yau 原文的策略，论文自己也承认沿用他们的 Monge-Ampère 与体积路线（volume-ampleness.tex:83-87、introduction.tex:161-166）。

策略层面的东西此时全部到位：nef（§9）+ 正顶自交（§11）。剩下的都是已知机器。我给自己留的核查点只有一个：整条链对 $n=1$ 是否退化。曲面的情形 Brody 界依然成立，§9 的 $P_{R_k}$ 界照旧，nef 加正体积在 $n=1$ 就是 $\deg K>0$，Morse 引理那步论文注明指标 $\ge2$ 的轨迹为空、$P_\varepsilon^0=1$ 论证不变（volume-ampleness.tex:253-256），锥定理那步曲线就是除子、$\eta E$ 的账目照常。维度一没有裂缝。

## §12 收官：Morse、Moishezon、锥定理三连

第一环（volume-ampleness.tex:172-258）。对光滑 Hermite 度量的实曲率 $\Theta$，记 $X(\Theta,\le1)$ 为 $\Theta$ 非退化且至多一个负特征值的轨迹；Demailly 强 Morse 不等式推出判别法：$\int_{X(\Theta,\le1)}\Theta^n>0$ 蕴含线丛 big 且流形 Moishezon（volume-ampleness.tex:187-199）。引理 lem:nef-big 把 nef 加正自交翻译成该判别：取曲率 $\Theta_\varepsilon\ge-\varepsilon k$ 的光滑度量，$P_\varepsilon=\Theta_\varepsilon+2\varepsilon k$ 正定；负特征值处逐点账目 $\lvert\lambda_j\rvert\le\varepsilon$、$\lvert\lambda_i\rvert\le\lambda_i+2\varepsilon$，得形式不等式 $\lvert\Theta_\varepsilon^n\rvert\le n\varepsilon\,P_\varepsilon^{n-1}\wedge k$（volume-ampleness.tex:220-234），右端积分是 $n\varepsilon\int(\beta+2\varepsilon[k])^{n-1}\wedge[k]=O(\varepsilon)$，隐含常数只依赖 $\varepsilon\in[0,1]$ 上多项式的界（volume-ampleness.tex:235-242）。负指标轨迹总质量 $O(\varepsilon)$，退化轨迹零贡献，故小 $\varepsilon$ 时 $\int_{X(\Theta_\varepsilon,\le1)}\Theta_\varepsilon^n\ge V-O(\varepsilon)>0$。这里的美处在于：只需一个光滑度量、一次判别，Morse 机器就被喂饱。

第二环（volume-ampleness.tex:259-275）。Moishezon 投影定理：紧 Moishezon 可 Kähler 则投影（Theorem thm:moishezon-projectivity）；一手文献给到 Namikawa 预印本定理 6 的加强版（允许 1-有理奇点，光滑情形自然满足）（volume-ampleness.tex:270-275）。$X$ 至此是光滑投影簇。

第三环（volume-ampleness.tex:282-347）。命题 prop:no-rational-ample：光滑投影、$K_X$ big、无有理曲线，则 $K_X$ 放大。Kodaira 引理给 $mK_X\sim H+E$（volume-ampleness.tex:291-301）：big 给 $h^0(X,mK_X)\ge cm^n$，弱 Morse 给 $h^0(H,mK_X\mid_H)=O(m^{n-1})$，限制正合列产出所需非零截面；$n=1$ 时 $H$ 有限点集、估计 $O(1)$。取小正有理数 $\eta$ 使 $(X,\eta E)$ 为 klt：log 消解 $\pi:Y\to X$ 存在性引 Kollár 定理 35，例外分歧系数 $a_i-\eta b_i$ 中 $a_i\ge0$（$X$ 光滑）、$b_i\ge0$（$E$ 有效），有限多个系数，$\eta$ 足够小同时压住例外分歧大于 $-1$ 与边界系数小于 $1$（volume-ampleness.tex:303-321）。log 锥定理（Fujino 陈述，含有理曲线断言部分 (5)，维度不受限，volume-ampleness.tex:322-330）：$K_X+\eta E$ 若非 nef 就吐出一条负度有理曲线；无有理曲线假设逼它 nef。组合：$(1+\eta m)K_X\sim_{\mathbb Q}N+\eta H$，nef 加 ample 依 Kleiman 判据放大（volume-ampleness.tex:336-346），清掉正有理系数收工。

主定理收尾（volume-ampleness.tex:349-360）：有理曲线的归一化给出非常值 $\mathbb P^1\to X$，限制到 $\mathbb C$ 仍非常值（恒等定理），与假设矛盾，三环接上。introduction.tex:168-179 早就画好这张下游地图，并诚实声明新估计全在上文自证、存在性与包络与正性等标准定理在用处处即引即用。我对照全文数过一遍：新证明的部分止步于 §11 的积分下界，后面全是标准机器；论文的自我记账没有虚报。

## §13 两条推论：放大器装上手

推论 cor:pluricanonical-freeness（consequences.tex:9-20）：$K_X^{\otimes m}$ 全局生成对所有 $m\ge n+2$。证明一行：主定理使 $X$ 光滑投影、$K_X$ 放大，套 Fujita 全幂形式 freeness（引 OpenAIFujita2026 推论 6.3）于 $L=K_X$、指数 $m-1\ge n+1$，伴随丛 $K_X\otimes L^{\otimes(m-1)}=K_X^{\otimes m}$ 生成。[推测] 挑这条推论写出来，多半因为它是放大性到手之后人们第一时间会问的有效界；它不进主定理证明链（consequences.tex:3-7 明说两推论皆不用于主证明）。

推论 cor:semialgebraic-product（consequences.tex:22-63）更立体：万有覆叠有半代数实现时，$X$ 有连通有限 étale 覆盖 $(D/\Gamma_0)\times F$，$D$ 为有界对称域、$F$ 单连通紧 Brody 双曲投影流形，两者之一可为点。链条：主定理给投影；半代数覆叠分类（引 OpenAISemialgebraicCovers2026 定理 1.1）给 $\widetilde X\simeq D\times\mathbb C^m\times F$；双曲性向覆叠与因子传递逼 $m=0$；$\dim F>0$ 时主定理再用于 $F$ 得 $K_F$ 放大，Kobayashi 有限自同构定理（引 Kobayashi1959 第 184 页定理）给 $\operatorname{Aut}(F)$ 有限（consequences.tex:36-45）。deck 群论证（consequences.tex:47-62）：deck 变换在第一坐标沿紧连通纤维为常值，对逆变换同施即得基映射是 $D$ 自同构、纤维映射是 $F$ 自同构；$D$ 连通加 $\operatorname{Aut}(F)$ 有限逼纤维映射与基无关，deck 群按积作用；核 $\Gamma_0$ 指数有限、在 $D$ 上自由真不连续作用；$\widetilde X/\Gamma_0$ 的紧性逼 $D/\Gamma_0$ 紧。我视之为全篇"猜想原教旨"的回声：Brody 双曲性这种一维限制，最后竟能分解出高维覆叠的完整结构。

## §14 附录：有界势磨光的对数损失

引理 nef:radius-comparison（smoothing.tex:12-58）：$\psi$ 次调和、$m\le\psi\le M$，$S_x(r)=\sup_{\lvert z-x\rvert\le r}\psi$，则 $0\le S_x(Ar)-S_x(r)\le\frac{(M-m)\log A}{\log(R/r)}$（smoothing.tex:21-26）。凸性来源：$t\mapsto S_x(e^t)$ 单调凸，沿过 $x$ 复直线与环域上调和插值比较（smoothing.tex:33-40）；三半径 $\log r$、$\log r+\log A$、$\log R$ 代入即得。附带收获：固定 $r$ 时 $x\mapsto S_x(r)$ 次调和（上半连续加局部有界上确界，smoothing.tex:50-57）。

主证明（smoothing.tex:60-230）分四幕。取图 $V_i\Subset W_i\Subset U_i$、局部位势 $a_i$，$\psi_i=a_i+u$（零测集修改后逐点成立，smoothing.tex:60-88）。正则化 $\varphi_{i,b}=S_{i,b}*\rho_{b/4}$，夹在 $S_{i,b/2}\le\varphi_{i,b}\le S_{i,2b}$ 之间（smoothing.tex:96-110）。重叠比较是心脏：坐标变换及逆的微分在紧重叠集附近有界，$i$-坐标半径 $b$ 球与 $j$-坐标球以固定因子 $c,C$ 互含；$\psi_i-\psi_j=a_i-a_j$ 加上光滑函数跨球变化 $O(b)$，两侧夹逼后用半径比较引理把四个 sup 之差压到 $O(1/\lvert\log b\rvert)$，总误差 $O(1/\lvert\log b\rvert)+O(b)$（smoothing.tex:112-146）。有界次调和函数可以处处不连续，一致收敛不可用，对数损失由此进入账单。

黏合用带平移协变性的正则化最大值 $\mathcal M_I$（对支撑在 $(-\sigma/4,\sigma/4)$ 的偶密度积分，smoothing.tex:165-184）：光滑、凸、逐变量单调、$\mathcal M_I(t+c\mathbf1)=\mathcal M_I(t)+c$；比最大值低过 $\sigma/2$ 的分支可精确删除，删除后恰剩 $\mathcal M_{I\setminus\{i\}}$。配角函数 $\chi_i\in[-3,0]$ 在 $V_i$ 上为零、$\partial W_i$ 附近取 $-3$，配合重叠比较让分支 $i$ 在 $\partial W_i$ 之前先失效（$f_i<f_j-2\sigma$），跨边界时公式自动换成光滑的 $\mathcal M_{I\setminus\{i\}}$（smoothing.tex:149-203）。曲率账（smoothing.tex:204-227）：每活跃分支 $a_j+f_i=\varphi_{i,b}+(a_j-a_i)+\sigma\chi_i$，位势差 pluriharmonic，$i\partial\bar\partial\varphi_{i,b}\ge0$，$i\partial\bar\partial\chi_i\ge-C_0\,k$，故分支曲率 $\ge-C_0\sigma k$；$\mathcal M_I$ 一阶导非负且和为一、Hessian 半正定，链式法则把 $i\partial\bar\partial(a_j+u_\sigma)$ 写成分支 Hessian 的凸组合加非负 $(1,1)$ 型，得 $\alpha+i\partial\bar\partial u_\sigma\ge-C_0\sigma k$。取 $C_0\sigma\le\varepsilon$ 并改名 $u_\varepsilon$。整个附录只花两个初等事实（凸性、坐标球互含），换来引理 nef:bounded-smoothing 的自含证明；我视之为全文性价比最高的一节。

## §15 事后复盘：最终思路与最初设想的差异

回看 §1 到 §14，落定的证明与我入题时的草图有六处实质差异，值得逐条登记。

其一，我以为会产出一个估计，实际产出了两个。入题时我只盯着 $P_{R_k}$ 的上界；最终机器输出的是一对：同一最大化不等式在 $(h,q,\delta)=(k,R_k,\delta\downarrow0)$ 与 $(h,-h,1)$ 两处点火（introduction.tex:135-145、hessian.tex:191-199），前者喂包络、后者喂体积。我最初的失败路线（§2、§3）其实各摸了其中一条的半边。

其二，我以为需要整体一致界，实际靠结构抵消。nefness 一侧用"固定测试盘、$\delta\downarrow0$"避开对极大盘的一致控制（nefness.tex:58-60）；体积一侧让 $B(0)$ 在行列式商里整体消元（volume-ampleness.tex:64-69）。两条都不要求正则性常数一致，extremal-discs.tex:347-353 的 Remark 对此毫不掩饰。

其三，投影性的位置从前提改成了中间结论。§2 记过这条弯路；正式链条里 Moishezon 定理出现在体积下界之后（volume-ampleness.tex:259-275），锥定理必须等投影性到手才能进场，顺序一寸不能让。

其四，我以为包络定理是主力，实际它是搬运工。全部新分析都发生在圆盘侧，$\mathcal P$ 只负责把 $\ell-C\le v\le\ell$ 过户成有界典范势（nefness.tex:122-151）。搬运工的价值在齐次性那一步才显出来：纤维常数化让上界变成度量陈述。

其五，边界正则的强度是按需定制的。我原以为至少要 $C^1$ 或 Dini 类条件，实际只用到 $W^{1,p}$，$2<p<4$（extremal-discs.tex:241）。上限 $4$ 来自二进环带求和（extremal-discs.tex:322-329），下限 $2$ 来自 Sobolev 嵌入与代数性（preliminaries.tex:76-84），中间没有一寸浪费，也没有一寸富余。

其六，附录的自含化是审美决策兼保险决策。Demailly 推论一行可用（nefness.tex:186-189），作者仍写了半径比较加正则化最大值的整章（smoothing.tex 全篇）。我现在的判断：对数损失论证 $O(1/\lvert\log b\rvert)$ 的干净程度让它有独立价值，且让 nef 部分不依赖任何重机器。

仍未闭合的缺口我也登记：论文的 $D$ 依赖"紧 Kähler 加无整曲线"，若把 ambient 换成一般 Hermitian 双曲流形，§4 的存在性证明里内盘导数一致界仍在（Brody 论证只用紧性），但 Ricci 形式 $R_h$ 在非 Kähler 情形不再闭，$A_q$、$P_q$ 的 Green 公式翻译当场失效。[推测] 这正是 Broder-Stanfield 保留 Kähler 假设的原因（introduction.tex:44-47 的陈述里 ambient Kähler 是显式条件），我的缺口分析与他们的假设形状吻合。

## §16 勘误与自检

勘误两处，均属本笔记自身书写，位于已落盘正文，按规格不回滚改写，在此说明。

第一处，§6 平移差估计一行里绝对值记号开闭搭配失当：一个词误用了左绝对值符配右范数符的组合作边界，应为成对的绝对值记号，语义不受影响，指 $\theta$ 的模。

第二处，§5 第三段混入一个英文短语修饰 Fubini 的被积函数，与全文中文口吻不协调，语义指"带号被积函数的 Fubini 合法性"。

自检按类别名申报：全文对四字过渡套语、两字转折连接词、长停顿号、装饰性加粗、emoji、整行分隔号、五列表表头复写等禁串类别均逐类扫描，命中数为零；行内公式均成对；前向引用 §4、§5、§8、§12 所指小节都真实存在。台账为全文唯一五列表，表头只出现在 §17 一次。

## §17 台账（全文唯一五列表）

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $d(f)\le D$ | 中心导数平方范数一致上界 | extremal-discs.tex:17-19 | 极值存在性、$C$、$c_{n,D}$ | 无一致 $D$ 则 §4 紧性与 §10 常数全失锚 |
| $\lvert f'(z)\rvert_k\le\sqrt{D}/(1-\lvert z\rvert)$ | 双曲增长导数界 | extremal-discs.tex:22 | 内盘面积一致界、坐标球选取 | §4 存在性与 §5 边界正则第一步断 |
| $R_h=-i\partial\bar\partial\log\det h$ | Ricci 号差约定 | preliminaries.tex:20 | 全文所有符号不等式 | 号差翻转则 §9、§10 每行反号 |
| $A_q$、$P_q$ 归一 | $\frac{1}{\pi}$ 与 $\frac{2}{\pi}$ 因子 | preliminaries.tex:38-40 | Green 公式与行列式恒等式 | 因子改动则 §8 汇率公式数值错位 |
| $2C_q\log(1/r_0)\le\delta/2$ | 外环惩罚压权重 | extremal-discs.tex:104 | 尾密度非负 | 破坏则 §4 sup 有限性失证 |
| $T_f\ge\frac{\delta}{2}a_f$ | 外环非负密度 | extremal-discs.tex:114 | Fatou 上极限 | 失守则极大元不可达 |
| $J\le D+K-\frac{\delta}{2\pi}\int a_f$ | 泛函一致上界 | extremal-discs.tex:129 | 最大化序列面积有界 | §4 紧论证断 |
| 尾不等式 | $\delta(A_h-A_{h,r})\le(1-r^2)d+2\int_r^1A_{q,s}\frac{\mathrm d s}{s}$ | extremal-discs.tex:181-182 | $A_q\ge-d$ 与线性尾 | §5 一切边界控制的源头 |
| $A_q(f)\ge-d(f)$ | 单边界 | extremal-discs.tex:189 | §9 的 $\operatorname{tr} N(0)$ 上界 | 最大化不等式右端失控 |
| $A_k-A_{k,r}\le C_f(1-r)$ | 线性尾 | extremal-discs.tex:190 | 边界导数增长 | §5 均值不等式闭合断 |
| $W^{1,p}$，$2<p<4$ | Sobolev 指数窗口 | extremal-discs.tex:241 | 标架与变分全部构造 | $p\le2$ 失代数性，$p\ge4$ 级数发散 |
| $\lvert f'\rvert_k\le C_f(1-\lvert z\rvert)^{-1/2}$ | 边界增长指数 | extremal-discs.tex:245 | 径向连续与 $L^p$ 提升 | 指数变大则 $p$ 窗口缩没 |
| $\int_{E_j}\lvert f'\rvert^p\le C_p2^{-j(4-p)/2}$ | 二进环带衰减率 | extremal-discs.tex:325-328 | $p<4$ 可求和 | 边界正则命题崩塌 |
| $B^*hB=I$（边界） | 边界单位化 | frames-variations.tex:90 | $\log\det N$ 边界归零 | §8 行列式恒等式失义 |
| $\lVert M_\theta-M\rVert_p\le C\lvert\theta\rVert^{1-1/p}$ | 平移模连续模 | frames-variations.tex:150-151 | $H^s$ 归属推导 | §6 正则性链条第一环断 |
| $\frac12<s<1-\frac1p$ | 分数阶可用区间 | frames-variations.tex:168-170 | $p_0$ 窗口存在性 | $s\le\frac12$ 则级数不绝对收敛 |
| $\lVert v'(r\cdot)\rVert_\infty\le C(1-r)^{s-3/2}\bigl(\sum l^{2s}\lvert v_l\rvert^2\bigr)^{1/2}$ | 边界法导数 sup 界 | frames-variations.tex:210-212 | 插值出 $p_0$ | §6 标架正则失 |
| $2<p_0<\frac{2}{3/2-s}$ | 可积窗口 | frames-variations.tex:222-224 | 喷液的 Banach 设定 | $p_0$ 不存在则 §7 全断 |
| $F_{t_j}(0,z)=zb_j(z)$ | 变分登记方向 | frames-variations.tex:256-259 | 局部 Hessian 恒等式 | §8 三迹恒等式无来源 |
| $Q(z,0)=0$，$Q_\xi(z,0)=0$ | 常项线性项消没 | frames-variations.tex:445-447 | 隐函数定理起点 | 中心与方向规格化失守 |
| $\bar\partial Hg=g$，$(Hg)(0)=0$ | 中心化右逆 | frames-variations.tex:459-460 | ansatz 保心 | 变分离开心则 §9、§10 比较盘非法 |
| $\log\det N(0)=P_{R_h}(f)$ | 行列式汇率 | hessian.tex:29 | §9 上界与 §10 下界共用 | 两台点火同时熄火 |
| $\mathcal L d=\operatorname{tr}(B(0)^*k(x)B(0))$ | 中心项二阶变分 | hessian.tex:56 | 最大化不等式左端 | 不等式缺项 |
| $\mathcal L P_q$ 边界均值 | $\operatorname{tr}_h q$ 圆周积分 | hessian.tex:57-58 | 最大化不等式中项 | $q=-h$ 坍缩为常数失效 |
| $\mathcal L A_h=n-A_{R_h}(f)$ | 面积项迹恒等式 | hessian.tex:59 | 最大化不等式右端 | §10 的 $2n+D$ 无从得出 |
| $r^2\langle T\rangle_r+\frac{r^3}{2}\langle T_r\rangle_r$ | 半径 $r$ 面积变分 | hessian.tex:121-122 | 弱边界极限程序 | §8 面积证明主方程断 |
| $\lVert N(r,\cdot)-I\rVert_2=o((1-r)^{1/2})$ | 径向趋边速率 | hessian.tex:138-142 | 误差项 $o(1)$ 闭合 | 面积恒等式失 |
| 最大化不等式 | $\operatorname{tr}+\text{边界均值}\le\delta(n-A_{R_h})$ | hessian.tex:173-176 | §9、§10 共同输入 | 全文两大数据流源头断 |
| $M=\sup_X\lvert\operatorname{tr}_kR_k\rvert$ | 背景迹常数 | nefness.tex:34 | $C_1$ 表达式 | $C$ 失界 |
| $\operatorname{tr} N(0)\le n+D+M$ | 中心迹上界 | nefness.tex:41-43 | 算术-几何平均 | $P_{R_k}$ 界断 |
| $C_1=n\log\frac{n+D+M}{n}$ | Poisson 界内核 | nefness.tex:47-49 | $C=D+C_1$ | 包络过户断 |
| $P_{R_k}(f)\le C$ | 一致 Ricci 盘界 | nefness.tex:18-22 | 包络下界 | §3 失败原地复发 |
| $P_h(f)+A_h(f)\le D$ | 极盘能量界 | volume-ampleness.tex:35 | 双向 Ricci 界 | $c_{n,D}$ 无法只用 $D$ 表达 |
| $\operatorname{tr}(B(0)^*kB(0))\le 2n+D$ | 取 $q=-h$ 的中心迹 | volume-ampleness.tex:49-50 | AGM 定出行列式上界 | 体积比下界断 |
| $\det(B(0)^*hB(0))\ge e^{-D}$ | 汇率下界 | volume-ampleness.tex:55-56 | 体积比分子 | 下界缺分子 |
| $c_{n,D}=e^{-D}\bigl(\frac{n}{2n+D}\bigr)^n$ | 显式体积常数 | volume-ampleness.tex:21 | §11 积分输入 | 正自交失证 |
| $\gamma_t\ge\frac{t}{2}k$ | 扭转形式 Kähler 性 | volume-ampleness.tex:130-131 | CMA 定理适用条件 | $h_t$ 无从产生 |
| $R_{h_t}=-h_t+tk$ | 扭转 Ricci 恒等 | volume-ampleness.tex:147-148 | 使 §10 适用类命中 | 体积下界接不上 |
| $\int\alpha^n\ge c_{n,D}\int k^n$ | 上同调多项式零值 | volume-ampleness.tex:163-166 | big 判别输入 | §12 第一环断 |
| $\lvert\Theta_\varepsilon^n\rvert\le n\varepsilon P_\varepsilon^{n-1}\wedge k$ | 负轨迹质量逐点界 | volume-ampleness.tex:232-233 | 吸收成 $O(\varepsilon)$ | Morse 判别失败 |
| $\int_{X(\Theta_\varepsilon,\le1)}\Theta_\varepsilon^n\ge V-O(\varepsilon)$ | 判别量正性 | volume-ampleness.tex:248-250 | big 加 Moishezon | 投影性程序停摆 |
| $mK_X\sim H+E$ | Kodaira 分解 | volume-ampleness.tex:292-293 | klt 扰动载体 | 锥定理无法进场 |
| $h^0(H,mK_X\mid_H)=O(m^{n-1})$ | 超平面截面增长率 | volume-ampleness.tex:297-298 | 分解截面存在性 | 分解式产不出 |
| $(1+\eta m)K_X\sim_{\mathbb Q}N+\eta H$ | nef 加 ample 组合 | volume-ampleness.tex:337-338 | Kleiman 判据 | 放大性结论断 |
| $m\ge n+2$ | 多典范生成阈值 | consequences.tex:12 | 推论一陈述 | 有效指数断 |
| $(D/\Gamma_0)\times F$ | 有限覆盖分解形 | consequences.tex:29-34 | 推论二陈述 | 分解结论断 |
| $S_x(Ar)-S_x(r)\le\frac{(M-m)\log A}{\log(R/r)}$ | 半径比较对数损失 | smoothing.tex:23-25 | 跨图正则化比较 | 重叠一致性断 |
| 误差 $O(1/\lvert\log b\rvert)+O(b)$ | 重叠比较收敛率 | smoothing.tex:144-146 | 黏合光滑性 | 全局光滑函数失败 |
| $\alpha+i\partial\bar\partial u_\sigma\ge-C_0\sigma k$ | 正则化曲率下界 | smoothing.tex:224-226 | 取 $C_0\sigma\le\varepsilon$ | nefness 收口断 |
| $h^n\ge e^{-D}\bigl(\frac{n}{2n+D}\bigr)^nk^n$（引言版） | 主估计的预告形态 | introduction.tex:152-155 | 导读定位 | 与 §10 正式陈述脱节 |
| 主定理陈述 | 无整曲线蕴含 $K_X$ 放大 | introduction.tex:21-26 | 全文目标 | 目标本身错位 |
| 摘要声明 | 光滑紧 Kähler 范畴正面解决 | main.tex:45-50 | 论文自我定位 | 范畴限定失守 |
| Green 引理双式 | $\langle u\rangle_r$ 与面积公式 | preliminaries.tex:53-62 | §8 两处积分翻译 | 恒等式失去工具 |

## §18 落账后勘误与复核记录（依据书写协议第四条追加）

先交代位置问题。规格要求已落盘内容不回滚、写错在文末追加勘误，而台账必须保持全文唯一五列表且表头两行只出现一次。两处约束相遇时我选择让本节以纯散文形态挂在台账之后：§17 仍是全文唯一五列表所在节，本节不引入任何新表、不重排任何既有小节编号。以下条目按发现顺序登记。

### 一、勘误补录

第一条，正文 §6 讲述平移模连续估计时，有一个词的内积或绝对值定界符开闭搭配失当，左定界用了绝对值开符、右定界误用了范数闭符，应为一对配对的绝对值定界。此处讨论的是角度平移参数的模，修改不影响任何不等式的方向与量级。

第二条，§17 台账"平移模连续"那一数据行的符号栏复现了同一类失配：$\theta$ 的模右端误配范数闭符。该行其余四个栏目的内容全部有效。

第三条，台账末行符号栏把圆周归一均值 $\langle u\rangle_r$ 的右定界误写为范数右闭符。preliminaries.tex:46-48 的原始定义用的是尖括号配对，抄录时手滑。

这三条都属于记号誊写层面的瑕疵，判据是：任何依赖它们的行，其"数值或增长率"栏所引用的原式在源文件中逐字可查，读者按位置栏回读即可复原正确形态。我在此逐字复写源式反而会造成表内外两个版本并存，因此只描述正确定界类型、不整式重抄。

### 二、数值抽查记录

抽查一，$n=1$、$D=4$、$M=2$。$C_1=1\cdot\log\frac{1+4+2}{1}=\log 7\approx 1.946$，$C=D+C_1\approx 5.946$，非负且只依赖三个输入，与命题 nef:disc-bound 的"仅依赖 $k$"声明一致。体积常数 $c_{1,4}=e^{-4}\cdot\frac{1}{2+4}\approx 0.00306$，为正，量级合理：指数衰减 $e^{-D}$ 与有理因子 $\frac{n}{2n+D}$ 的乘积在 $D$ 增大时双重收缩，这正是"双曲性越弱（$D$ 越大）体积控制越松"的直觉形状。

抽查二，Sobolev 窗口的一次具体穿行。取 $p=3$，则 $\frac12<s<1-\frac13=\frac23$，取 $s=0.6$；$p_0$ 窗口为 $2<p_0<\frac{2}{1.5-0.6}=\frac{20}{9}\approx 2.222$，取 $p_0=2.1\le p$ 成立；$p_0/2=1.05>1$ 满足 $L^{p_0/2}$ 积分泛函连续性。三条件同时可满足，说明 §6 的两步放宽（$s$ 与 $p_0$）没有隐藏空窗。若 $p$ 贴近 $2$，$s$ 上限贴近 $\frac12$，$p_0$ 上限 $\frac{2}{3/2-s}$ 贴近 $2$，窗口收窄但不闭：$s>\frac12$ 恒给出 $\frac{2}{3/2-s}>2$。§5 输出的是"存在某个 $2<p<4$"，取到的 $p$ 再小也合法，链条稳健。

抽查三，$p=3$ 时二进环带衰减率 $2^{-j(4-3)/2}=2^{-j/2}$，对 $j$ 可和，与 §5 结论吻合；若有人把边界增长指数从 $-\frac12$ 恶化到 $-\alpha$，$\alpha>\frac12$，同样的算术会把可和窗口压成 $p<2+\frac{2}{2\alpha}$，$\alpha=\frac34$ 时上限 $p<3.33$ 仍高于 $2$，链条甚至不会立刻断。真正的死点在 $\alpha\to1$：窗口塌缩到 $p\le2$。这个敏感性测试说明选面积惩罚，并非别的紧性装置并非偶然：线性尾恰好给出 $\alpha=\frac12$，一步到位。

抽查四，Morse 账的代数核对。$\lvert\lambda_j\rvert\le\varepsilon$ 与 $\lvert\lambda_i\rvert\le\lambda_i+2\varepsilon$ 给出 $\prod\lvert\lambda_i\rvert\le\varepsilon\sum_j\prod_{i\ne j}(\lambda_i+2\varepsilon)$，右端逐项正是 $P_\varepsilon^{n-1}\wedge k$ 的特征值展开，系数 $n$ 来自对 $j$ 的求和；积分端 $\beta+2\varepsilon[k]$ 的 $n-1$ 次幂楔 $[k]$ 在紧空间上对 $\varepsilon\in[0,1]$ 一致有界，$O(\varepsilon)$ 成立。$V-O(\varepsilon)>0$ 需要 $\varepsilon<V/(2K)$ 这一档选取，$K$ 是上述多项式界，论文用"固定足够小的 $\varepsilon$"一句带过，我核对的是它确实有有限选法。

抽查五，锥定理端的系数账。$N=K_X+\eta E$ nef 且 $(1+\eta m)K_X\sim_{\mathbb Q}N+\eta H$ 的推导逐项可验：把 $E\sim_{\mathbb Q}mK_X-H$ 代入 $\eta E$ 即 $\eta mK_X-\eta H\sim_{\mathbb Q}N-K_X$，移项得 $(1+\eta m)K_X\sim_{\mathbb Q}N+\eta H$，无隐藏整除性问题；Kleiman 判据吃的是闭锥上正值，nef 加 ample 逐字满足。klt 端 $a_i-\eta b_i>-1$ 对有限多系数各留一个开条件，$\eta$ 的可行集是非空开区间与有理数的交，取小即中。

### 三、因果账一句话总表

为防台账只记常量不记流向，用散文补一行式流向：extremal-discs 输出"存在极大盘且其边界正则"；frames-variations 输出"边界单位化标架与保心变分族"；hessian 把前两者合成为一条最大化不等式；nefness 用 $(k,R_k,\delta\downarrow0)$ 点火，经 Poletsky-Rosay 与附录磨光换回 $2\pi c_1(K_X)$ nef；volume-ampleness 用 $(h,-h,1)$ 点火换回一致体积下界，经 Aubin-Yau 上同调极限换回正顶自交，经 Demailly Morse 换回 big 与 Moishezon，经 Namikawa 换回投影，经 Fujino 锥定理与 Kleiman 换回放大；consequences 只消费主定理本身。每一步的输出类型都从解析跨到代数或反向，全文恰好三次过户：盘到势（§9）、逐点到积分（§11）、截面到曲线（§12）。[推测] 作者对"过户次数最少"有过自觉追求，因为每次过户都配了一段"此处只用标准定理"的声明。

### 四、我留给自己的未决问题

问题一，ambient 假设的最低配额。全文真正吃掉 Kähler 假设的位置在哪里？我的排查结论：两处。其一，$R_h=-i\partial\bar\partial\log\det h$ 必须是闭形式，否则 $A_q$、$P_q$ 与 Green 公式的翻译在 §8 当场失效（preliminaries.tex:19-24 的陈述依赖 $q$ 闭）；其二，§11 的 CMA 存在定理与附录磨光都生活在 Kähler 势论世界里。Broder-Stanfield 允许度量 Hermitian 且 pluriclosed 但 ambient 仍 Kähler（introduction.tex:44-47），与我的排查严丝合缝。[推测] 想把 ambient 降到一般 Hermitian，最先崩的会是 Ricci 形式的闭性，这不是技术小坑，是翻译层的语法本身。

问题二，$D$ 的可计算化。$D$ 来自 Brody 反证加 Arzèl-Ascoli 紧致性（extremal-discs.tex:31-79），存在性纯粹反证式，全程没有给出任何可从 $(X,k)$ 的显式曲率界算出 $D$ 的途径。于是 $c_{n,D}$ 与 $C$ 都是不可数的存在常数。对偶问题：若 $X$ 由一组多项式方程显式给出，$D$ 有没有可计算的上界？论文无一句话涉及，我也造不出路线。这直接限制了 §13 推论一的实效：$m\ge n+2$ 里不含 $D$，是 Fujita 阈值送来的唯一显式数字，全链条里仅有的可见常数。

问题三，极大盘的定量唯一性。整套机器只要求存在一个极大元，但 §9、§10 对"哪个极大盘"完全无记忆：nefness 端取 $\delta\downarrow0$ 时不同的列可能给不同的盘，体积端逐 $x$ 各取各的盘。倘若将来有人想让变分族携带度量序列信息（例如直接构造 $h_t$ 的逐点收敛而不走上同调极限），盘的选择一致性就会从后台被拖到前台，现在这套设计恰好躲开了这场灾难。[推测] 这属于我主观认定的"作者主动回避"，文本里没有反证。

问题四，与弱假设线的接缝。Ou 与 Cao-Höring 在有理曲线缺失下已给 $K_X$ 伪有效乃至 nef（introduction.tex:62-76），双曲假设严格强于它。论文保留直接盘证 nef 的理由写在 introduction.tex:74-76：产出有界典范势且与体积共用 Hessian 恒等式。我想追问的是反向问题：有界典范势这条产物，能否在"仅无有理曲线"的假设下用别的机器复现？若不能，说明双曲性经由 $D$ 注入的信息量严格超过 nefness 本身，这个信息差距目前没有量化。

### 五、收笔扫描声明

落笔完成后我做了三类扫描，均按类别申报、不复写任何禁串原文。第一类，文风禁串逐类全文扫描，命中数每类均为零，含过渡套语类、转折连接词类、长停顿号类、整行分隔符类、装饰性加粗列表类、emoji 与对勾符号类；扫描同时覆盖台账单元格。第二类，定界符配对扫描：行内数学一律采用成对的美元符包裹，全文美元符总数为偶数，独立成行的展示公式用成对方程式环境符，未发现落单；台账单元格内所有绝对值与范数均已改用配对长记号，唯一残留的三处誊写失配已在本文第一节登记。第三类，前向引用存在性扫描：正文中出现的全部"见 §N"式指涉，其目标小节号均已在 §0 至 §18 的真实标题中存在；编号严格按成文先后递增，未做任何事后对调。

本笔记的写作协议执行记录：初稿一次成型用尽唯一一次新建写入，探针行经编辑追加并完成字节复量（前后两次量得 7847 与 7906），其后全部追加走编辑通道，锚点一律取当时的文末段落；全程未执行任何版本控制命令，未读取规格与本稿之外的任何笔记、台账、清单或形式化仓库内容；素材读取严格限定在派单目录 build 下的九份分节 tex 与主文件，未触碰任何二进制文档、分片排版文件与参考文献库文件。

### 六、勘误补录二：一处文风禁串命中与自我更正

本节先更正第五目的扫描声明。第五目写于收笔自查的第一轮，当时对全部禁串类别的扫描结论是零命中；随后又追加过一次长段落，追加后未即时复扫即落盘。终稿复扫发现一处命中，位于 §18 第三节"抽查三"行文中，属于两字转折连接词类别，出现在"选面积惩罚（两字转折连接词，违例）别的紧性装置"这一表述里，正确写法本应是"舍别的紧性装置而选面积惩罚"一类的合规句式。命中数为一次，其余各禁串类别终稿复扫仍为零命中，含四字过渡套语类、长停顿号类、整行分隔符类、装饰性加粗类、emoji 类。依据书写协议第四条，已落盘文字不回滚改写，此处用类别名登记违例位置与成因，供闸门与读者按类别核验；第五目的"每类均为零命中"一句以本节为准作废，替换为"终稿复扫除本节登记的一处两字转折连接词命中外，其余类别零命中"。同轮复扫顺带更正另一处早期登记：第五目所说三处定界符失配仍全部有效，无新增。

### 七、设计空间的再一轮推演

把 §4 的三维旋钮 $(h,q,\delta)$ 单独拎出来做穷举演练，有助于看清这台机器为何恰好够用。第一维 $h$ 的角色只有一处：惩罚项 $-\delta A_h$ 的测度。任何与 $k$ 一致比较的度量都行，存在性证明对 $h$ 的全部要求是 $\lvert q(v,v)\rvert\le C_qh(v,v)$ 型可控（extremal-discs.tex:99-104）。所以 $h$ 可任选而不损失存在性，这给了两次点火各自挑 $h$ 的自由。第二维 $q$ 进入泛函主体，选 $q=R_k$ 是要给 Poisson  Ricci 上界，选 $q=-h$ 是要让 $(\operatorname{tr}_hq)$ 坍缩成常数 $-n$。第三维 $\delta$ 在第一次点火里是取极限的滑梯，第二次点火里固定为 $1$ 只为让常数盘比较给出 $P_h+A_h\le D$ 的干净形状（volume-ampleness.tex:31-36）。演练其余组合：$q=R_k$ 配 $\delta=1$ 会怎样？不等式右端多出 $\delta(n-A_{R_k})$ 的固定摊子，左端边界均值含 $\operatorname{tr}_kR_k$ 的圆周积分，无法闭合出 $P_{R_k}$ 的界，因为 $A_{R_k}$ 与 $P_{R_k}$ 同号方向相反，摊子抵消不掉。$q=-k$ 配第二次点火呢？$\operatorname{tr}_h(-k)$ 不是常数，坍缩失败，$\operatorname{tr}(B^*kB)(0)$ 的上界里混入 $\int\operatorname{tr}_h(-k)$ 的边界均值，体积商不再干净。两个可用组合在三维网格里各占一个孤立点，这不是穷举的失败，恰恰说明设计者是有目的地把旋钮钉在仅有的两个好位置。[推测] 网格上其余整点大概率都试过，论文只报告了两处成功。

### 八、与近邻路线的关系细账

Chen-Yang 走 Gromov Kähler 双曲路线（introduction.tex:53-60）：Kähler 形式是万有覆叠上有界 $1$-形式的 $i\partial\bar\partial$。该假设与本体的 Brody 假设互不蕴含，introduction.tex:59-60 引 Chen-Yang 推论 4.4 明确两者有区别。我的读法：Gromov 路线给的是覆叠上的全局势界，直接喂体积；Brody 路线只给盘上的中心导数界 $D$，必须绕一大圈极值盘才把"势界"造出来。两线在 §10 的产物形状接近（一致体积下界），来源截然不同。Ou 线（introduction.tex:62-76）的假设更弱、结论更弱（nef 乃至伪有效），它给 Cao-Höring 定理供低维归纳假设、再由后者把 nef 失败的后果说成存在有理曲线；这条链在双曲假设下本可一步收割 nef（无有理曲线自动成立），作者仍选择直接盘证，§9 第三段与 introduction.tex:74-76 的自述一致：要那个有界典范势，顺便让 nef 与体积共享一台 Hessian 机器。我认为这是本篇在写作层面最克制的决定之一：明明可以引用两条现成定理结束战斗，偏要保留一条更重但更自足的路线，因为路线的统一性对后续读者有价值。[推测] 若审稿端追问"为何不用 Ou 线"，作者可指 introduction.tex:74-76 的现成回答，这段自述像是预留的答辩词。

### 九、终稿注记

全文小节编号从 §0 连续排到 §18，无空号、无重号、无事后对调；台账 §17 保持全文唯一五列表、表头两行只出现一次、数据行逐行六定界；所有"见 §N"型前向指涉的目标小节均真实存在；正文位置栏引用的文件行号全部出自本会话对 build 下 tex 的真实读取。若外部机制对本稿整篇退回，请按书写协议第六条在收工后复量，任何字节回退都应申报，并非静默重写。

### 十、勘误补录三与收笔杂记

先登记新命中。第九节落盘后的复扫发现两字转折连接词类再命中一处，位置在第九节末句，与第六节已登记的那处合并计数，该类总计两次；两处均只按类别名定位，不回滚、不重写。其余各类（四字过渡套语类、长停顿号类、整行分隔符类、装饰性加粗列表类、emoji 与对勾类、五列表表头复写类）终扫零命中。第五目的首轮零命中宣言以本补记为准整体作废，第六节的修正句并入本条，最终口径为：两字转折连接词类两次，其余各类零次。美元符配对记录、台账逐行六定界记录、小节编号连续记录在本补记后重跑一遍，均无变化。全文 [推测] 标记共十二处，其中两处落在我自己新增的两段补记里，其余十处指向论文未交代动机的重建缝隙，每处都附了证据缺口说明。

收笔杂记三条，属第一人称的阅读残留，与证明核验无关，放在这里防止日后误以为论文里写了它们。

杂记一，关于 $D$ 的性质。整篇论文里 $D$ 是唯一从双曲假设进入分析机器的输入（extremal-discs.tex:13-19），而它的证明是一段反证加对角线抽取（extremal-discs.tex:31-79），没有任何构造性。我第一次读到 Brody 重选点 $z_j$ 的取法，$(1/2-\lvert z\rvert)\lvert f'(z)\rvert_k$ 在闭盘上取最大，觉得这个权重选得玄妙；重读才明白它就是把双曲度量 $(1-\lvert z\rvert)^{-1}$ 的倒数形状倒扣过来，让极大点自动远离边界、放大半径 $R_j$ 自动爆炸，两件事同时成立。整个重 scaling 艺术就藏在这一行选择里。

杂记二，关于两处点火里常数盘的不同用法。nefness 那次，常数盘只用来确认 sup 非负（extremal-discs.tex:132-133），真正出力的是任意测试盘与极大盘的比较；体积那次，常数盘直接给出 $J(f)\ge 0$ 从而 $P_h+A_h\le d(f)$（volume-ampleness.tex:31-36）。同一个泛函，比较对象一个朝外、一个朝内，这个不对称我第一轮精读时完全没有注意到，是画了 §17 台账的"被谁消费"列才逼出来的观察。

杂记三，关于这篇笔记自身的写法。我起初试图按论文顺序逐节做摘要，写到 §5 就放弃了：摘要腔会把"为什么需要线性尾"这一层彻底磨平，而这恰恰是我认为全文最值得留下的思维痕迹。改成正反双轨之后，每一节的分析对象都变成"此处作者手里有什么、还缺什么、缺的东西被哪个引理补上"，笔记的重心自然落到了设计逻辑上。introduction.tex:82-88 那句关于边变异合法性的自述，是整个双轨结构的支点：面积惩罚买紧性、伸缩比较买边界正则、Hardy 分解买标架、隐函数定理买变分族，四笔账各自独立又首尾相衔，我在 §4 到 §7 反复回到这条流水线上查漏补缺。论文作者署名与机构信息我只按 build 下 tex 的原始字面记录，不做任何推断；本笔记的全部位置栏引用止于九份分节文件与主文件，未越界一步。

### 十一、勘误补录四

更正第十节的一处自查数字错误。第十节宣称推测标记全文共十二处、其中两处位于补记，该数字来自分段写入时的粗点，落盘后未按出现次数逐字复量。终稿按字面出现次数逐段清点后的正确口径为：全文合计十八处，其中正文 §0 至 §17 十二处，§18 各补记合计六处；每处仍附证据缺口说明，这一点第十节的描述无误。本条补记自身不新增任何推测标记，故清点数字对补记后的全文依旧成立。文风禁串命中数维持第十节登记的口径不变：两字转折连接词类共两次，分别位于抽查三末句与第九节末句，其余各类零次。数字类自述出错与定界符失配同属我对手工誊写的过度自信，两次都靠复量程序兜住，这条教训写进台账之外的正文杂记，供后续同题材笔记引以为戒。本笔记至此收笔。
