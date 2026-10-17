# D413 温和Hecke特征层的Frobenius结构

## §0 派单登记与本稿取材范围

我这单的编号是 D413，队列行号 236，素材字节档 110,638，属于重档。派单参数行给的是
`D413 row=236 bytes=110638 thin=no dir=preprints/Frobenius-Structures-on-Tame-Hecke-Eigensheaves-October-5-2026`，
`thin=no` 意味着我不许走薄素材那条"把力气全放在论证缝隙上"的路，正文必须有真实论证链的支撑。

我先 `ls -laR` 量了目录，把 build 下的 9 个 `.tex` 按字节排开：
`main.tex` 3,215、`references.tex` 4,560、`figures/node.tex` 1,317、
`sections/introduction.tex` 9,891、`sections/final.tex` 7,065、
`sections/conventions.tex` 15,819、`sections/unramified.tex` 19,683、
`sections/nodal.tex` 22,358、`sections/parameters.tex` 26,730，合计正好 110,638。
求和能对得上字节档这件事给了我一个副作用：我知道 build 下没有第四份隐藏的稿子，
于是"读全"在这里是可达的目标，我最终把 9 个文件都读了完整区间（区间见本节末的登记）。
同目录另有 `tame-hecke-frobenius.pdf`（503,521 字节）与 `typst/main.typ`（105,771 字节）加
`typst/main.pdf`（570,397 字节），按硬约束我一个字都没碰：语料的 PDF 是加密的，
pdftotext 禁用，typst 分片不作素材，`README.md` 只当索引看了一行目录结构。
所以本笔记里出现的每一个具体断言，出处都落在 build 下的 `.tex` 行号上；
凡我只能凭主线推断、素材里没有写出动机的地方，我打 `[推测]` 并说明缺什么。

关于记号，我在下面这条铁律上吃过亏，所以先把规矩写死：素材的 preamble 把大量常用算符
压成了单字母或双字母自定义宏，还把交叉引用命令与若干上循环记号做了一次性重定义。
这些宏离开那个 preamble 就不认，我在这篇笔记里一律把它们展开成标准 LaTeX 形式
（数域用 `\mathbb`，算子名用 `\operatorname`，对偶群写 `\check G`，Hecke 函子写 `\mathsf H`），
并且我不在下面正文里罗列那些宏的名字，连"我拒绝使用它们"这样的清单也不写，
因为清单本身就会泄漏宏名。展开以后，$G=\mathrm{SL}_n$、$\check G=\mathrm{PGL}_n$、
系数域 $E=\overline{\mathbb Q}_{\ell}$、模栈 $\operatorname{Bun}_{G,B,x}(X)$、
Hecke 函子 $\mathsf H_{I,\mathbf V}$、奇异支撑 $\operatorname{SS}$ 这些记号在任何机器上都能渲染。

我的初始动机很朴素： companion 稿（素材里记作一篇同批次的前置预印本，
`sections/introduction.tex:102-112`）已经在正特征上造出了带 Borel level 的、
局部可构造的 perverse Hecke 特征层，那么把有限域上的 Frobenius 一并端上去应当是
"顺手的事"。这个朴素动机就是全篇的靶子，后面 §2、§4、§7、§8 里我四次撞墙都来自它。

preprints/Frobenius-Structures-on-Tame-Hecke-Eigensheaves-October-5-2026
其他队列第 236 行号

## §1 初始动机：为什么"多出来的信息"必须落在整条特征结构上

素材开门见山给了我为何不嫌麻烦的理由（`sections/introduction.tex:3-9`）：
Hecke 特征层用丛的修改几何去实现曲线上的局部系统；有限域上的算术局部系统比它的几何限制
多带一样东西，就是 Frobenius。因此自守侧的对象必须带一个 Frobenius 结构，
而且这个结构要"保得住它的特征同构"。

我把这句话拆成三层，因为它决定了我后面所有选择的代价。
第一层：底层对象 $M$ 上有 Weil 结构，即一个同构 $\operatorname{Frob}_{q^m}{}^{*}M\simeq M$，
这一步谁都做得到，只要对象是定义在 $\mathbb F_{q^m}$ 上的。
第二层：特征同构
$\mathsf H_{I,\mathbf V}(M_0)\simeq M_0\boxtimes\bigl(\boxtimes_{i\in I}(V_i)_{\rho_m}\bigr)$
（`sections/introduction.tex:63-66`）必须是 Weil 层之间的同构，也就是要对
$\operatorname{Frob}$ 交换。
第三层：这种交换是对所有有限指标集 $I$、所有表示族 $\mathbf V=(V_i)$、以及
单位元、卷积、置换与一切融合对角线同时成立（`sections/introduction.tex:67-68`）。

我最初的猜想是：第二层大概会自动从第一层推出来，理由是"特征结构唯一"。
这个猜想在素材里被明确否定过（`sections/introduction.tex:136-140`）：
让几何构造等变化有两个额外困难。第一，参数是不变的，并不保证随手挑出的那个几何特征对象
看起来是不变的；第二，分离结点两侧的边界参数必须用一个同时保持 Frobenius
与紧致的共轭子来胶合。这两句就是我 §2 与 §8 的全部内容。

还有一个我一开始完全没料到的口径问题：素材要求的是
"Frobenius 结构定义在整条 eigenstructure 上，只给底层 perverse 层不够"
（`sections/introduction.tex:73-74`）。而我 originally 想的是一条定理只该有一个主角。
这里的取舍是，用 Weil 结构意味着只需要同构无限循环群的一个生成元的作用就够了，
（`sections/introduction.tex:75-77`）不必对 profinite 下降说话。这一点在
`sections/final.tex:138-140` 又重申一次：一个 Weil 层只需生成元作用，没有 profinite 下降断言。
我读到这里才明白，全文的"等变"都是 $\mathbb Z$-等变，代价是把
$\gamma\mapsto\gamma^{-1}$ 换生成元时要跟着把 $A$ 换成 $A^{-1}$、$q$ 换成 $q^{-1}$
（`sections/parameters.tex:224-227`）。

顺带把主定理的硬条件列清楚，免得我事后美化：$n\ge 2$，$\mathbb F_q$ 的特征 $p>n$，
$\ell\ne p$，$X_0/\mathbb F_q$ 是亏格至少 $2$ 的光滑射影几何连通曲线，带一个
$\mathbb F_q$ 有理点 $x_0$，$U_0=X_0\setminus\{x_0\}$；参数
$\rho:\pi_1^{\mathrm{et}}(U_0)\to\mathrm{PGL}_n(L)$（$L/\mathbb Q_\ell$ 有限）几何限制 Zariski 稠密，
野惯性被杀死，边界是 $\rho(\gamma)=\exp(t_\ell(\gamma)N)$，$N$ 正则幂零
（`sections/introduction.tex:36-52`）。结论是要存在某个 $m\ge 1$ 与非零的 Weil 层
$M_0$，几何限制 $M$ 局部可构造 perverse，奇异支撑落在 $\Lambda_{\mathrm{par}}$ 里。
这里的 $p>n$ 我一开始以为是技术余量，读到 §12 才发现它是台账里被反复消费的量。

## §2 第一条错误路线：给 Langlands 等价本身挑一个等变归一化

我的第一反应是走"标准流程"：既然 $\mathcal D_C\simeq\operatorname{IndCoh}_{\mathrm{Nilp}}(\mathcal S_C)$
（素材里把自守 nilpotent 范畴记作 $\mathcal D_C=\operatorname{Shv}_{\mathrm{Nilp}}(\operatorname{Bun}_G(C))$，
把谱栈记作 $\mathcal S_C=\operatorname{LocSys}_{\check G}^{\mathrm{restr}}(C)$，见
`sections/unramified.tex:43-55`），那就先证明这个等价在 $\operatorname{Frob}$ 运输下同变，
然后把 skyscraper $\delta_\tau=i_{\tau,*}^{\operatorname{IndCoh}}E$ 的反象拿过来，等变性自动继承。

这条路的第一个坑在"同变"这个词本身。半线性运输作用在底空间与曲线上，
系数域 $E$ 是被固定的（`sections/conventions.tex:91`）。而 Gaitsgory--Raskin 等价
在构造里用了大量的选择：谱 action 的实现、$\operatorname{QCoh}(\mathcal S)$-作用的线性化、
Satake 标签的外部约定。要证明等价同变，我得先证明这些选择同变，
这是一个比原题更强的命题。素材明确写出了我这条路应当怎么退回去：
"This recognition argument avoids choosing an equivariant normalization of the Langlands
equivalence itself."（`sections/introduction.tex:152-153`）

我在 `sections/unramified.tex:135-137` 找到了退口的精确形式：
此时只需要保持对应于 $\mathcal S_\tau$ 的那个直和分量就够了，
对所选等价是否等变没有任何要求。这句话让我把整个问题的重量从"等价"移到了"对象"，
这就是本稿的第一个转折点。转折之后的问题变成三小步
（`sections/unramified.tex:35-39` 把证明排成三步）：

1. 认出谱分量 $\mathcal S_\tau$ 及其在运输下的行为；
2. 不带 shift 地认出被运输的对象 $f^{*}D_\tau$；
3. 证明该对象上的完整特征结构是唯一的。

第一小步的内容（`sections/unramified.tex:74-93`）我读得很慢，因为它把一堆无穷小数据
算成了一件很朴素的事：$\tau$ 稠密于是不可约，$\operatorname{Aut}(\tau)=Z_{\check G}(\operatorname{im}\tau)=Z(\check G)=1$；
切复形是 $R\Gamma(C,\operatorname{ad}(\tau))[1]$，$-1$ 次上同调因中心化子平凡而为零；
$\operatorname{Lie}(\check G)$ 上的不变非退化形式加上 Poincaré 对偶给出
$H^2(C,\operatorname{ad}(\tau))\simeq H^0(C,\operatorname{ad}(\tau))^{\vee}(-1)=0$。
于是 $\tau$ 所在的开闭分量 $\mathcal S_\tau$ 既无无穷小自同构也无阻碍，
是一个单点形式多圆盘，切空间是 $H^1(C,\operatorname{ad}(\tau))$，维数记作
$d=\dim_E H^1(C,\operatorname{ad}(\tau))$（`sections/unramified.tex:95-100`）。
单点这个性质是关键：它让"运输保持分量"成为纯粹的组合事实，
而分量上的范畴就是 $\operatorname{IndCoh}(\mathbb A^d_E)_{\{0\}}$，
即集合论支撑在原点的对象。

第二小步需要一个独立于谱情形的初等判别（`sections/unramified.tex:208-217`）：
设 $(R,\mathfrak m)$ 是剩余域为 $E$ 的交换局部 $E$-代数，$P$ 是非零有界复形，
上同调模长度有限，若 $\operatorname{Hom}_{D(R)}(P,P)=E$ 且
$\operatorname{Hom}_{D(R)}(P,P[j])=0$ 对 $j<0$，则 $P\simeq E[r]$。
我原来的直觉是"自同态是一维就说明它是 skyscraper"，素材给的证明比我聪明：
它用首末非零次数 $a<b$ 时存在非零映射 $h:H^b(P)\to H^a(P)$
（取第一个模到 $E$ 的商、取第二个模 socle 里 $E$ 的子对象），
于是复合 $P\to H^b(P)[-b]\xrightarrow{h[-b]}H^a(P)[-b]\to P[a-b]$
是一个非零的负次数自同态，与假设矛盾（`sections/unramified.tex:219-233`）。
这条矛盾链教会我一件事：负次自同态的存在性是"复形不是单一移位"的可检测指纹。

## §3 归一化先行：为什么纯度不够，以及 Weil 标量 $q^{i/2}$ 从哪来

在将等变对象往下推之前，我必须先回答一个更基础的问题：
Hecke 函子与 Satake 核的 Frobenius 结构到底怎么归一。
这里我犯了第二个方法论错误：我以为纯度（purity）足以钉住 Frobenius 标量，
于是打算"取满足纯性的那个 Weil 结构"。素材在
`sections/conventions.tex:137-138` 直接给了判决：
验证归一化是必需的，因为纯度本身并不规定 Frobenius 标量。

我先把归一化本身写清楚。相对 Satake 归一（`sections/conventions.tex:51-58`）：
在不动点 Schubert 轨道上，维数
$d_\lambda=\langle 2\rho_G,\lambda\rangle$，单纯核满足
$\operatorname{IC}_\lambda|_{\operatorname{Gr}^\lambda}=E[d_\lambda](d_\lambda/2)$；
由于 $G=\mathrm{SL}_n$ 的余特征标格就是余根格，$d_\lambda$ 是偶数，
于是所有扭曲都是整的。Hecke 函子定义成
$\mathsf H_{I,\mathbf V}(F)=o_{I,*}\bigl(F\widetilde\boxtimes\operatorname{Sat}_I(\mathbf V)\bigr)$，
并且不带任何 moving-leg shift（`sections/conventions.tex:43-47,59`）。
融合约定是普通拉回、不加余维数 shift：
$(1\times\delta_a)^*\mathsf H_{I,\mathbf V}(F)\simeq\mathsf H_{J,\mathbf W}(F)$，
其中 $W_j=\bigotimes_{i\in a^{-1}(j)}V_i$（`sections/conventions.tex:62-69`）。

我起初打算沿用另一个常见约定（带 leg shift 的那种），理由是它与 kernel 层的
perverse 移位更协调。素材给了我换约定的实际理由：归一化的张量单位函子必须就是
与 $(X\setminus\{x\})^I$ 上常数 $E$-层的 exterior product（`sections/introduction.tex:26-29`）。
带 shift 的约定会让单位元这一项多出一个 Twist，整条单位公理就要重新写。
这一处"约定选择由单位元的形状决定"是我在本稿看到的第二个转折点，
虽然它很小，但它决定了后面所有交换图的形状。

现在看 Weil 标量的推导（`sections/conventions.tex:137-180`），这是我读得最仔细的一段。
路线是：把分裂的 affine Schubert 簇用 Bott--Samelson 解消、按 Iwahori 分层，
这个层层 $\mathbb P^1$-丛结构定义在有限域上；投影丛公式给出
$H^{2j}$ 上的几何 Frobenius 标量 $q^j$，奇次上同调为零。
配上移位与扭曲 $[d_\lambda](d_\lambda/2)$ 以后，第 $i$ 次上的标量就是 $q^{i/2}$。
再往下，decomposition theorem 保证全支撑的 intersection complex 以重数 $1$ 出现，
其等周分量几何上是良定的，因此对 Frobenius 稳定，而开轨道上归一化已经固定；
Frobenius 稳定的 perverse Leray 滤过（同一定理保证谱序列退化）把该分量每次上同调
表示成纯标量上同调的商子对象。合起来就是
$H^i(\operatorname{Gr},\operatorname{IC}_\lambda)$ 上的 Frobenius 如同在 $E(-i/2)$ 上，$i$ 偶，
$H^i=0$，$i$ 奇（`sections/conventions.tex:154-157`）。

我关心的下一步是卷积与张量的比较是否 Frobenius 交换。素材的答案是靠构造：
比较在分离腿上用 Künneth、在分裂仿射线上用融合来构造，
因而它是分次且 Frobenius 交换的（`sections/conventions.tex:159-163`）。
腿碰撞处的上同调系统是 lisse 且几何常值的：在分离轨迹的坐标平凡化里已是常值，
lisseness 把常值扩张过去。于是有理构型之间的比较与 Frobenius 交换，
二元张量比较用的是 $(0,1)$ 与 $(0,0)$ 这两个在任何有限域都有理存在的构型
（`sections/conventions.tex:163-169`）。最后由上同调 Satake 纤维函子的忠实性，
核层的张量映射同样交换，并且几何重数空间
$\operatorname{Hom}(\operatorname{IC}_\nu,\operatorname{IC}_\lambda*\operatorname{IC}_\mu)$ 上的
Frobenius 作用是平凡的，因为源与目标每次上同调在同一次数上有同一个标量
（`sections/conventions.tex:170-177`）。

这段推导对我的最初设想是一次修正：我原以为"Frobenius 结构"是一个需要额外构造的数据，
读完才明白在分裂情形它由归一化唯一决定，唯一性靠的是
$\operatorname{Rep}_{E}(\mathrm{PGL}_n)$ 上对称张量自等价在
$Z(\mathrm{PGL}_n)=1$ 之下的刚性（`sections/conventions.tex:110-115`）。
把这一层归约想透以后可以看到：真正的数据在参数那一侧，自守那一侧的
Frobenius 是"被认出来的"。

## §4 第二条错误路线：我一度想用 profinite 下降来固定等变

第二个坑是我对"等变"这两个字的口径估计错了。我原本按代数几何的习惯去想：
定义在 $\mathbb F_q$ 上等于给出对 $\operatorname{Gal}(\overline{\mathbb F}_q/\mathbb F_q)\simeq\widehat{\mathbb Z}$
的半线性作用，于是我应该构造一个对完整 profinite 群的下降数据。
素材在 `sections/final.tex:138-140` 与 `sections/introduction.tex:75-77` 两处都收住了口径：
一个 Weil 层只需要由 Frobenius 生成元张成的（无限循环）群的作用，
全文没有任何 profinite 下降断言。

口径定了以后，等变的定义就落在 `sections/conventions.tex:85-94`：
设 $\sigma$ 是基域与曲线的半线性自同构，保持分裂群与 level 数据；
等变层是一个同构 $\sigma^{*}F\simeq F$；等变特征结构要求
$\mathsf H_{I,\mathbf V}(F)\simeq F\boxtimes\bigl(\boxtimes_{i\in I}(V_i)_\vartheta\bigr)$
与这个同构、以及与给定的 $\sigma^{*}\vartheta\simeq\vartheta$ 一起交换。
关键的一句是：运输作用在底空间上，作用在系数域 $E$ 之外，$E$ 保持固定。
有限纤维上基域作用 $a\mapsto a^{q}$ 给出算术约定，把生成元处处取逆就得到
Weil 层常用的几何 Frobenius 约定。我一开始把这两件事混着写，结果在纸面上得到了
一个"半线性作用同时动系数"的怪物，它的 $\operatorname{End}$ 根本不是 $E$-线性的，
后面所有 Hom 计算都会失真。素材用"$\sigma^{*}$ 是 base transport，系数不动"这一条纪律
把它切干净（`sections/unramified.tex:35-36` 也重申：$f^{*}$ 指曲线与其丛栈上的运输，
系数域 $\overline{\mathbb Q}_{\ell}$ 固定）。

这条纪律的直接好处在引理 lem:satake-transport（`sections/conventions.tex:98-127`）：
尖点曲线的半线性同构把相对 Satake 系统与 Hecke 系统一起识别，
并与定义 1 里的所有运算相容；表示标签上的对称张量比较是唯一的。
证明的骨架是这样的：运输保持分裂 Schubert 轨道、它们的 intersection complex、
卷积图与融合图，于是给出球型 Satake 范畴上一个保持所有最高权标签的对称张量等价；
在 Satake 对应下它是 $\operatorname{Rep}_{E}(\mathrm{PGL}_n)$ 的一个外层自同构为平凡的
对称张量自等价；代数闭系数域上它是张量同构于恒等的，因为纤维函子的 torsor 平凡，
剩下的群自同构是内缘的；两个这样的同构相差一个恒等函子的张量自同构，
即 $Z(\mathrm{PGL}_n)$ 的元素，而它平凡。
我特别在意最后这步"差一个中心元素"，因为它把唯一性化归到
$\mathrm{PGL}_n$ 中心平凡这一条群论事实上，全文至少三次复用这个杠杆
（`sections/unramified.tex:350-354` 与 `sections/unramified.tex:79-81`）。

等变的第二块基础设施是带作用的特殊化输入（`sections/conventions.tex:182-251`）。
我把 setup 复述一遍，因为它就是我 §10、§12 两处非零性论证的容器：
$S=\operatorname{Spec}R$ 是 excellent complete 严格 henselian 离散赋值 trait，
剩余域代数闭，$\ell$ 可逆，取定几何 generic 点 $\bar\eta$，闭点记 $s$；
$\mathcal B/S$ 是光滑局部有限型的丛栈，$U/S$ 是相对维 $1$ 的光滑容腿格式，
有界 Hecke 对应输出映射正常表示，坐标与输入框下局部模型是带球型核的分裂 Schubert 模型；
setup 允许普通与增强 level 与腿分离，也允许下面要用的扭曲线族模型。
在此之上命题 prop:equivariant-specialization 说：几何 nearby cycles 保持局部有界可构造并且
perverse 正合，有自然同构
$\mathsf H^{s}_{I,\mathbf V}(\Psi F)\xrightarrow{\sim}\Psi(\mathsf H^{\bar\eta}_{I,\mathbf V}(F))$，
与单位、卷积、置换、一切融合对角相容；若 $F$ 有特征 $\vartheta_{\bar\eta}$ 的相容特征结构，
并且每个表示的赋值层有 lisse 格，其有限约化在有限 trait 扩张后仍 lisse 地延拓、
在再扩张与约化之间相容，并与特殊纤维张量系统 $\vartheta_s$ 相容，那么 $\Psi F$
有特征 $\vartheta_s$ 的相容特征结构。带作用的那一段是：若模型、$F$ 连同它给定的相容特征结构、
以及这些张量特殊化数据都带一个半线性生成元，且在 $\bar\eta$ 上有相容提升，
则所有比较与所得特征结构都等变；有限阶段格模型可以用相容的不变 trait 扩张，
并不要求一个对所有约化统一的有限扩张。

这里我踩了第三个雷：我本能地想用"带惯性不变量的 nearby cycles"，
因为那是数论里默认的算术 nearby cycles。素材写得很硬：
这些是不带惯性不变量的几何 nearby cycles，而且输入不必在分数域的一次有限扩张上下降
（`sections/conventions.tex:226-228`）。我对着这句想了很久才想通代价问题：
一旦取惯性不变量，$\Psi$ 就与 $\mathsf H$ 的比较多了一层不变量函子，
而不变量函子正合性在 $\ell$ 整除阶的群上没有保证；更麻烦的是，
参数塔 $b_r$ 是随阶段增长的，取惯性不变量会强迫我找一个统一有限扩张，
而这正是命题明确免掉的要求。于是"几何 $\Psi$"是保命选择。
等变的证明机制我也照抄下来供自查：trait 与模型的同构连同它在几何 generic 点上的提升
辨认出定义 nearby cycles 的那些图，于是拉回、正常推出、张量交换映射都与运输交换；
输入框下 Hecke 比较就是与 Satake 核的自然 exterior-product 交换再复合正常推出交换；
特征值一侧，lisse 张量比较在每个有限格约化与每个再 trait 扩张上自然，
取 adic 系统后自然性保留；卷积与嵌套对角恒等式是同一批交换变换的恒等式，
不需要额外选择；有限纤维上 Satake 结构就是归一化好的 Weil 结构。

## §5 认出被运输的对象：shift  elimination 与不变仿射开集

回到 §2 留下的三小步，现在是第二小步。设 $C/K$ 是特征零代数闭域上亏格 $\ge2$ 的光滑射影连通曲线，
$f$ 是其半线性自同构，并且带一个 ample 线丛 $\mathcal L$ 与同构 $f^{*}\mathcal L\simeq\mathcal L$；
$\tau$ 是定义在 $\mathbb Q_{\ell}$ 有限扩张上的 $\mathrm{PGL}_n$-局部系统，像 Zariski 稠密，
$u:f^{*}\tau\xrightarrow{\sim}\tau$（`sections/unramified.tex:12-33`）。
命题要的结论是存在非零局部有界可构造复形 $D_\tau$，奇异支撑幂零，
带特征 $\tau$ 的完整相容 Hecke 特征结构，以及一个与该特征结构和 $u$ 相容的同构
$b:f^{*}D_\tau\xrightarrow{\sim}D_\tau$，并且 $D_\tau$ 在自守 nilpotent 范畴里紧致。
我起初以为"$b$ 存在"是命题里最难的部分，读完才明白最难的是让 $b$ 与整条特征结构相容。

先取 $D_\tau$ 为等价下 $\delta_\tau$ 的原象。它的自同态数据是
$H^{0}R\operatorname{Hom}(D_\tau,D_\tau)=E$，$H^{j}R\operatorname{Hom}(D_\tau,D_\tau)=0$ 对 $j<0$
（`sections/unramified.tex:243-246`），并且由于 $\mathcal D_C$ 是满子范畴，
这些就是环境自守范畴里的 Hom 群。运输保持这两个群与紧致性；
引理 lem:spectral-action-transport 把 $f^{*}D_\tau$ 放进 $\mathcal S_\tau$ 分量；
于是它在等价下的像是光滑形式分量原点处的有界凝聚复形，
把 lem:point-object 用在原点局部环上，得到
$f^{*}D_\tau\simeq D_\tau[r]$，$r\in\mathbb Z$（`sections/unramified.tex:249-257`）。

到这里我原来的计划会失败：我打算用"$\operatorname{Bun}_G(C)$ 上对象的 cohomological amplitude
有全局界"来排除非零 $r$。素材明确避开它：
"我们在一个有界开集上消掉 shift，因此不需要 $\operatorname{Bun}_G(C)$ 上的任何全局同调界"
（`sections/unramified.tex:259-260`）。替代论证我觉得是全篇最漂亮的一段初等技巧，
值得重述（`sections/unramified.tex:261-288`）：用 $f$-不变的 ample $\mathcal L$；
对充分大的 $m$，取 $\mathcal U_m\subset\operatorname{Bun}_{\mathrm{SL}_n}(C)$ 为
关联向量丛 $\mathcal V$ 满足 $\mathcal V\otimes\mathcal L^{m}$ 全局生成且
$H^1(C,\mathcal V\otimes\mathcal L^{m})=0$ 的开子栈。
这些条件是开的，并且由 Serre 消没覆盖整个丛栈。每个 $\mathcal U_m$ 有限型：
秩与平凡化行列式钉住 Hilbert 多项式，上面两个条件钉住 $h^0$，
选取截面基就给出通常的有限型 Quot 表示；行列式平凡化本身也是有限型条件。
因为 $f$ 保持 $\mathcal L$，每个 $\mathcal U_m$ 都在运输下不变。
选 $m$ 使 $D_\tau|_{\mathcal U_m}\ne0$。有限型光滑 atlas 上局部有界可构造给出有限同调区间，
下降把同样的有界性搬到 $\mathcal U_m$ 上，于是
$S_m=\{j\in\mathbb Z:\mathcal H^{j}(D_\tau|_{\mathcal U_m})\ne0\}$ 有限非空。
沿 $\mathcal U_m$ 的自同构拉回正合且保守，故保持 $S_m$；
$f^{*}D_\tau\simeq D_\tau[r]$ 给出 $S_m=S_m-r$，有限非空整数集在平移下不变只能有 $r=0$。
我就这样拿到 $b$。这里的量 $|\mathcal U_m|$ 无关紧要，要紧的是"$S_m$ 有限非空"，
而我原来的全局界路线恰好给不出这个有限性（`[推测]` 素材没有明写它失败的原因，
我只知道作者特意声明不需要它，因此我推测全局振幅在 $\operatorname{Bun}$ 上确实不可控）。

## §6 唯一性：让每个同构自动尊重整条特征结构

第三小步解决 §1 的第二层与第三层要求，也就是"$b$ 与 eigenstructure 相容"。
工具是 Hom 的外积公式（`sections/unramified.tex:293-300`）：对有限集 $I$ 与
$C^{I}$ 上有限秩 lisse $E$-层 $L_1,L_2$，
$R\operatorname{Hom}(D_\tau\boxtimes L_1,D_\tau\boxtimes L_2)\simeq R\operatorname{Hom}(D_\tau,D_\tau)\otimes_E R\Gamma(C^{I},L_1^{\vee}\otimes L_2)$。
我对这条公式的第一反应是"非拟紧的丛栈上凭什么成立"，素材正好答了这个疑问：
在每个有限型光滑格式限制上是通常的可构造 Hom--Künneth；
等价地可以用到格式的伴随、$C^{I}$ 上的正常基变换与投影公式；
第二个因子是有界有限维 $E$-复形，因此是 perfect 的，
与它张量可以和计算光滑下降以及丛栈有限型开集上限制的极限交换，
于是逐格式的公式拼成全局公式（`sections/unramified.tex:301-312`）。
右边两个因子都集中在非负次数，于是
$\operatorname{Hom}(D_\tau\boxtimes L_1,D_\tau\boxtimes L_2)\simeq\operatorname{Hom}(L_1,L_2)$，
且负次数 Hom 为零；第一个同构把 lisse 层的映射 $a$ 送到 $\mathrm{id}_{D_\tau}\boxtimes a$
（`sections/unramified.tex:313-323`）。

有了它，唯一性的证明就是我熟悉的"差一个自然自同构"套路，只是每一步都要打卡：
两个完整特征结构在每组 $(I,(V_i))$ 上的特征映射相差目标
$D_\tau\boxtimes\bigl(\boxtimes_{i\in I}(V_i)_\tau\bigr)$ 的一个自同构；
由上面的 Hom 公式它唯一地写成 $\mathrm{id}_{D_\tau}\boxtimes a_{I,(V_i)}$；
自然性使单腿映射 $a_V$ 关于 $V$ 自然；在腿互异 locus 上，逐次 Hecke 操作的相容性
把 $a_{I,(V_i)}$ 认作单腿映射的外积；在稠密开集上的相等决定 $C^{I}$ 上 lisse 层的映射；
沿对角融合给出 $a_{V\otimes W}=a_V\otimes a_W$ 与 $a_E=\mathrm{id}$；
于是 $\{a_V\}$ 是局部系统函子 $V\mapsto V_\tau$ 的一个张量自同构，
它的群是 $\tau$ 单调在 $\check G$ 中的中心化子，由 $\operatorname{Aut}(\tau)=Z(\check G)=1$ 平凡，
故所有 $a_V$ 是恒等（`sections/unramified.tex:325-355`）。

素材还额外把"相容性数据本身也是唯一的"说清楚，这一点我原来漏了：
负次数 Hom 为零意味着这些 target 之间的 mapping space 没有正同伦群，
特征映射把逐次 Hecke 变换在相容性图里认作同样形状的 target，
于是单位、卷积、置换、融合的相容性里没有任何额外的高阶同伦可选；
普通表示标签上的自然变换由定义谱 action 的 stable 与 ind 构造的泛性质
唯一地精确连续延拓（`sections/unramified.tex:356-366`）。
最后一步就是把 $D_\tau$ 的特征结构用 $f$ 运输、在特征值上用 $u$、在自守因子上用任意 $b$，
lem:satake-transport 保证这仍是 $D_\tau$ 上特征 $\tau$ 的完整特征结构，
唯一性把它认回原来那一个（`sections/unramified.tex:367-372`）。
迭代 $b$ 与 $b^{-1}$ 定义自由循环群的作用，$u$ 同步迭代，相容性在迭代下保持
（`sections/unramified.tex:383-386`）。这正好是 §4 里那个 $\mathbb Z$-口径的兑现。

## §7 提升算术参数：root stack、分量轨道与 $\operatorname{Ad}(A)N_1=qN_1$

到这里我有了特征零曲线上"不变参数 $\Rightarrow$ 等变对象"的引擎。
下一个问题是我一开始完全没当真的问题：手头的 $\rho$ 是有限域上的算术表示，
而引擎要活在特征零。素材把 trait 摆得很整齐（`sections/parameters.tex:17-31`）：
$k=\overline{\mathbb F}_q$，$R_0=W(\mathbb F_q)$，$D=\operatorname{Frac}(R_0)$，
$R=W(k)$，$K=\overline{\operatorname{Frac}(R)}$，$\overline D\subset K$ 是 $D$ 在 $K$ 内的代数闭包；
把 $R$ 上由 $k$ 上 $a\mapsto a^{q}$ 诱导的 Witt 向量自同构扩成 $K$ 的自同构 $\varphi$，
它固定 $D$ 并保持 $\overline D$，在 $\ell$-幂单位根上按 $\zeta\mapsto\zeta^{q}$ 作用，
这从 $R$ 里的 Teichmüller 提升即可看出。

尖点曲线的提升 $(\mathcal X,\mathfrak x)\to\operatorname{Spec}R_0$ 无阻，
因为 $H^2(X_0,T_{X_0}(-x_0))=0$；ample 线丛也能提升，形式代数化给出射影族。
这一步刻意做在 $R_0$ 上（不是 $R$ 上），理由写在 `sections/parameters.tex:41-43`：
为了保住定义域。记 $(C_1,x_1)=(\mathcal X,\mathfrak x)_D$，$U_1=C_1\setminus\{x_1\}$。
光滑性让我们在 $\mathfrak x$ 邻域里取一个 $R_0$-上的相对参数 $t$，
它的微分 trivialize 截线的 conormal 线。

我对 root stack 那一段的读法值得记下来（`sections/parameters.tex:53-61`）：
对 $R_0$ 中可逆的整数 $d$，坐标 $t$ 把 $\mathcal X(\sqrt[d]{\mathfrak x})$ 的剩余 gerbe 认同为
$R_0$ 上的 $B\mu_d$：用 $1/t$ trivialize 除子线，从而指定它的平凡 $d$ 次根。
把一个有限 torsor 拉回这个 neutral 对象就得到它的边界纤维；
在严格 henselian 基 $R$ 上取框，就把该纤维与它的有限结构群认同（右作用）。
在这个框里，惯性与半线性运输都由左乘记录。
我最初写这里时用共轭作用来记边界，结果 $\varphi$ 与惯性在纸面上撞成非交换的一团；
换成"左乘记录两者"以后，等变值变成一个具体的群元素 $A$，这就是
命题 prop:lifted-parameter (iii) 的形状。

命题 prop:lifted-parameter（`sections/parameters.tex:63-94`）给出
$\sigma_1:\pi_1^{\mathrm{et}}((U_1)_{\overline D})\to\mathrm{PGL}_n(L')$，$L'/L$ 有限，
带 $\varphi$-等变性，四条性质：(i) 几何像 Zariski 稠密，相容取框后与
$\rho(\pi_1^{\mathrm{et}}(U_{0,k}))$ 是同一个紧子群；(ii) 边界同态是
$\gamma\mapsto\exp(t_\ell(\gamma)N_1)$，$N_1$ 正则幂零，特征零惯性中除 $\ell$ 外的每个素因子平凡作用；
(iii) 在 $x_1$ 的坐标 neutralize root gerbe 的相容框下，等变性只有一个值 $A\in H_0$，
$H_0=\rho(\pi_1^{\mathrm{et}}(U_0))$，并且 $\operatorname{Ad}(A)N_1=qN_1$；
(iv) 每个代数表示的赋值局部系统有不变格，其有限约化在 $\mathcal U_R$ 上 lisse 地延拓、
关于 $\varphi$ 等变，特殊化恢复 $\rho$ 的张量局部系统（含给定的算术作用）。
我注意到 (i) 用的是算术像 $H_0$，它把几何信息之外的 Frobenius 信息一并装着，
素材把理由写在
`sections/parameters.tex:139-141`：保留这个像才能在证明末尾把它特殊化回去。
这是我读到的第三处"口径比构造更值钱"。

构造本身是塔式的：取忠实线性表示与 $H_0$-不变格，
$\{H_{0,r}\}$ 是在单位元处共尾的递降开正规同余子群列，$\Gamma_r=H_0/H_{0,r}$；
$\rho$ 的有限商给出 $U_0$ 上相容的右 $\Gamma_r$-torsor 塔。
第 $r$ 阶段惯性像是 $\ell$-幂阶，取 $d_r$ 为 $\ell$ 的幂、$d_r\mid d_{r+1}$ 且被该阶整除；
第 $r$ 阶段 torsor 唯一地延拓为 root stack $X_0(\sqrt[d_r]{x_0})$ 上的有限 étale torsor，
理由是局部 Kummer 根杀死有限 tame 惯性，此后覆盖跨 root 除子 étale
（`sections/parameters.tex:149-161`）。
因为 $d_r$ 在 $R_0$ 中可逆，相对 root stack $\mathcal X(\sqrt[d_r]{\mathfrak x})$ 在 $R_0$ 上
光滑、正常、tame、对角有限；proper henselian invariance 把 torsor 提升上去。
Full faithfulness 提升群作用、转移映射（在可除根指标处比较）并保持它们之间所有关系。
这里有个细节我很想提前知道：只有 root 指标被要求与 $p$ 互素，
有限群 $\Gamma_r$ 的阶可以被 $p$ 整除（`sections/parameters.tex:171-173`）。

稠密性与"同一个紧像"靠的是分量轨道引理 lem:component-orbits
（`sections/parameters.tex:101-136`）。它的陈述我照抄成自己的话：
$S$ 是完备严格 henselian 离散赋值环（剩余域代数闭）的谱，
$\mathcal Y\to S$ 是正常平坦 tame DM 曲线（对角有限、粗空间射影、纤维几何约化），
$\mathcal T\to\mathcal Y$ 是有限 étale 右 $Q$-torsor（$Q$ 有限），$y:S\to\mathcal Y$ 是光滑格式 locus 里的截线；
把 $y^{*}\mathcal T$ 的几何特殊纤维与 generic 纤维用 $S$ 上的平凡化认同，
则由 $\mathcal T_{\bar s}$ 的连通分支与该集合的划分，和由 $\mathcal T_{\bar\eta}$ 得到的划分相同。
证明链条是：$\mathcal T$ 仍正常平坦 tame 且纤维几何约化；proper henselian invariance 把
$\mathcal T_{\bar s}$ 的开闭分解提升为 $\mathcal T$ 的（等价地提升相应幂等）；
取一个提升分量 $\mathcal Z$，它特殊纤维连通、约化、在代数闭域上正常，
故 $H^0(\mathcal Z_{\bar s},\mathcal O)=k(\bar s)$；
tame stack 的粗空间推出正合并与基变换交换，此处粗空间在 $S$ 上平坦
（局部上对线性约化有限群取不变量保持平坦）；于是上半连续给出
$h^0(\mathcal Z_{\bar\eta},\mathcal O)\le1$，平坦性保证 generic 纤维非空，故恰为 $1$，
$\mathcal Z_{\bar\eta}$ 连通。把这些分量与 trivialize 的截线纤维相交即得结论。

边界作用的比较要用 $t$ 把每个 root stack 的剩余 gerbe neutralize 成 $B\mu_{d_r}$
（幂映射下相容）；拉回其在 $R$ 上的 neutral 对象得到严格 henselian trait 上的有限 étale torsor，
所得非空有限框集合有满的转移映射，因此整座塔可以相容地取框；
$\mu_{d_r}$-作用在特殊与 generic 纤维上，在 $p$-互素单位根的认同下一致。
素材在这里给了一句我很看重的评注：这些作用记录整个 peripheral 同态，
而不只是它的共轭类（`sections/parameters.tex:206-207`）。
取极限得 (ii)，其中 $N_1$ 在固定生成元约定下与原正则幂零元共轭。
因为只用了 $\ell$-幂根指标，特征零惯性的每个 $\mathbb Z_a(1)$-因子（$a\ne\ell$）平凡作用，
包含 $a=p$ 那个因子。这一句对我有额外意义：我原本担心 $p$-惯性会污染温和条件，
现在看到污染来自"取了多余的根指标"，只要塔只用 $\ell$-幂，就自动干净。

等变值 $A$ 的方程是这样出来的（`sections/parameters.tex:214-223`）：
由 $t$ 定义的 neutral 对象本身定义在 $R_0$ 上，在它们的相容框里半线性作用是 $\Gamma_r$ 中
相容元素 $\{A_r\}$ 的左乘，故来自同一个 $A\in H_0$；
它与 gerbe 作用的相容写作
$A\exp(t_\ell(\gamma)N_1)A^{-1}=\exp(q\,t_\ell(\gamma)N_1)$，
取一个非零边界元素的对数就得 $\operatorname{Ad}(A)N_1=qN_1$。
全部陈述依赖所选坐标方向；把 $\varphi$ 换成 $\varphi^{-1}$ 就把 $A$ 换成 $A^{-1}$、$q$ 换成 $q^{-1}$。
(iv) 则几乎是紧致的赠品：代数表示定义在有限系数扩张上就有 $H_0$-不变格，
每个有限约化透过某个 $\Gamma_r$，于是提升的 torsor 在 $\mathcal U_R$ 上延拓该约化，
这些是等变延拓，特殊纤维恰是原算术局部系统的约化；张量与态射在同一座塔里比较，
态射情形在所选取的格里通分母即可。

## §8 第三条错误路线：只用"边界逆元"来胶合，以及紧致共轭子的来历

参数已经带着 $\varphi$-作用提升到特征零的 $(C_1,x_1)$ 上，接下来的动作是把它放到分离结点的一侧，
再补上另一侧，好造出一个能用 §5、§6 引擎的 non-ramified 参数。
我这里的错误路线最实在，也最值得记：我想当然地认为，结点两侧只需按"通常的温和胶合"处理，
即让一侧的边界同态是另一侧的逆（把 $u$ 与 $u^{-1}$ 认同，剩下的就是普通 nodal 下降数据）。
素材一句话点出它塌在哪里（`sections/introduction.tex:162-163`）：
只有边界逆元不足以保证光滑那侧上存在取值紧致的连续参数。

我把这个失败在自己纸上验证了一遍。两侧的边界作用要用两个分支各自的正向坐标来表述，
而结的规范结构让两侧的正向取向相反（§9 里 $v\mapsto\zeta^{-1}v$），
于是在公共 node generator $\zeta\in\mu_{b_r}$ 下，第一分支记作 $u_{1,r}(\zeta)$ 的作用，
第二分支记的是 $u_{1,r}(\zeta)^{-e}$（那个 $e$ 来自 $w^{e}=t$ 的次数，见本节末）。
要把两者认同，我需要一个把 $g\mapsto g^{-e}$ 这条"反向再乘 $e$ 次"的映射扭回 $g$ 的共轭子；
若只写"逆元"，$e$ 这个因子没有着落，更糟的是共轭子的位置无法控制：
它必须留在记录单调的那个紧致开子群 $J$ 里，否则
$\tau:\pi_1^{\mathrm{et}}(C)\to\mathrm{PGL}_n(L')$ 的像就落在 $J$ 之外，
既不紧致也不连续地定义在极限塔上。同时它还必须与 $A$ 交换，否则胶完以后
$\varphi$-等变性被破坏。这两条约束合起来就是 `sections/parameters.tex:240-247` 的"两个条件要同时满足"。

解法是一件纯线性代数的事，引理 lem:compact-conjugator（`sections/parameters.tex:249-265`）：
设 $N_1\in\mathfrak{pgl}_n(L')$ 正则幂零，$A\in\mathrm{PGL}_n(L')$ 满足
$\operatorname{Ad}(A)N_1=qN_1$，$H_0\subset\mathrm{PGL}_n(L')$ 紧致且 $A\in H_0$；
有限系数扩张后存在共特征标 $c:\mathbb G_m\to\mathrm{PGL}_n$、含 $H_0$ 的紧致开子群 $J$、
以及与 $\ell$ 互素的整数 $e>1$，使得
$c(z)A=Ac(z)$，$\operatorname{Ad}(c(z))N_1=zN_1$，$P:=c(-1/e)\in J$；
于是 $P$ 与 $A$ 交换，并且 $P\exp(-eaN_1)P^{-1}=\exp(aN_1)$ 对所有 $a\in L'$。

证明里我要抄三件事（`sections/parameters.tex:267-295`）。
第一件是把 $A$ 的谱结构榨干：把 $N_1$ 看作无迹幂零矩阵，取 $A$ 的矩阵提升 $\widetilde A$，
关系 $\widetilde A N_1=qN_1\widetilde A$ 保持正则 Jordan 滤过，
于是在它的 successive 一维商上 $\widetilde A$ 的特征值组成公比为 $q$ 的等比数列；
它们两两不同，因为 $q>1$ 是整数而系数域特征零，故有限扩张后 $\widetilde A$ 可对角化。
取生成 Jordan 链的特征向量 $v_0$，令 $v_i=N_1^{i}v_0$（$0\le i<n$），
则对某个 $a_0\ne0$ 有 $\widetilde A v_i=a_0q^{i}v_i$，$N_1v_i=v_{i+1}$（$i<n-1$），$N_1v_{n-1}=0$。
射影类的对角共特征标 $c(z)v_i=z^{i}v_i$ 就与 $A$ 交换并把 $N_1$ 缩放 $z$ 倍。
第二件是 $J$ 的来源：取 $\mathrm{PGL}_n$ 的一个闭忠实线性表示与 $H_0$-不变格 $\Lambda$，
$\mathrm{GL}(\Lambda)$ 的原象是 $J$，它由连续性是开的、由嵌入是闭的是紧的。
第三件是我认为最有意思的一步取数：因为 $c(1)=1$ 且 $J$ 含 $1$ 的邻域，
选 $e>1$ 使 $e\equiv-1$ 模 $\ell$ 的充分高次幂，于是 $-1/e$ 足够接近 $1$，
从而 $c(-1/e)\in J$，并且这个取法自动让 $e$ 与 $\ell$ 互素；
最后一个恒等式由 $\operatorname{Ad}(P)N_1=-N_1/e$ 代入指数映射得到。
我的读后结论：$e\equiv-1\bmod \ell^{N}$ 是同余条件里的"魔法"，
它一次解决两个要求，素性与接近 $1$。$\ell$-进拓扑在这里被当成可调的旋钮用，
这跟我原先"取个逆元"的草率完全不是一个量级。

有了 $P$，辅助分支就是自然的一次 Kummer 覆盖
（`sections/parameters.tex:299-312`）：$h:C_2\to C_1$ 由 $C_1$ 在 $D(C_1)(w)$（$w^{e}=t$）里正规化得到。
$t$ 在 $x_1$ 处的赋值是 $1$，故 $w^{e}-t$ 在该点 Eisenstein，即便扩到 $\overline D$ 亦然，
所以这是次数 $e$ 的几何连通覆盖；$C_2$ 在 $D$ 上光滑射影，$x_1$ 上方唯一点 $x_2$，
它是 $D$-有理的、完全分歧的，局部参数 $w$；这些断言在完成局部扩张
$D[[t]]\subset D[[w]]$ 里同样看得见；Riemann--Hurwitz 给 $g(C_2)\ge2$。
我特别注意到"$x_2$ 是 $D$-有理"这条，因为 §10 里我需要在特殊纤维上取点而不引入新分歧。
令 $U_2=C_2\setminus\{x_2\}$，$\sigma_2=h^{*}\sigma_1$；
$h$ 的其他分歧点在 $U_1$ 上，对本次拉回局部系统无分歧贡献；
在坐标 $w$ 下边界同态是 $\exp(e\,t_\ell(\gamma)N_1)$。

塔的口径也在这里改换：取 $J$ 中在 $1$ 处共尾的递降开正规子群列 $J_r$，$Q_r=J/J_r$。
映射 $H_0\to Q_r$ 透过较早的某个 $\Gamma_j$ 分解，因为 $H_0\cap J_r$ 在 $H_0$ 中开；
结构群扩张给出第一分支上带原有等变性的右 $Q_r$-torsor，$h$ 的拉回给出第二分支的。
素材在这里补了一句让我把"允许不连通"记进台账：这些 torsor 未必连通
（`sections/parameters.tex:328-329`），正因如此 lem:component-orbits 才要允许不连通 torsor，
以便 enlarging 记录单调的紧致群。
对任何公共根指标 $b$（被第 $r$ 阶段两侧惯性阶整除）它们跨过 $C_i(\sqrt[b]{x_i})_{\overline D}$ 延拓；
$h$ 诱导这些 root stack 之间的映射，因为 $h^{*}x_1=e\,x_2$；
坐标上它把 $t$ 的 $b$ 次根送作 $w$ 的 $b$ 次根的 $e$ 次幂，剩余 gerbe 上的映射是
$\mu_b\to\mu_b$，$\zeta\mapsto\zeta^{e}$。由 $t$ 与 $w$ 固定的 neutral 对象在此映射下互相对应：
除子线平凡化里 $h^{*}(1/t)=(1/w)^{e}$，没有常数因子扭曲。
第二 torsor 与其框从第一支拉回，这个纤维认同定义在 $D$ 上，
因此第二 gerbe 上诱导的框有与第一支完全相同的等变值 $A$。
素材给这一段的总结是：这个相等，加上惯性里那个因子 $e$，就是代数覆盖所提供的算术信息
（`sections/parameters.tex:343-346`）。我第一次读到这里时的疑问是"$e$ 次幂映射凭什么不带常数因子"，
答案是 $h^{*}x_1=e x_2$ 与 $t$、$w$ 的选取方式，常数因子正好被坐标消掉。

## §9 平衡扭曲线模型：结上胶合的两个符号与一个共轭子

把 $x_1$ 与 $x_2$ 认同，写 $C_0=C_1\cup_{x_1=x_2}C_2$，取射影光滑化
$\mathcal C\to\operatorname{Spec}D[[s]]$ 带相对 ample 线丛；
分裂结点处形变无阻、光滑化参数独立，提升 ample 线丛后代数化形变。
完成局部方程可取 $ab'=s$，其中 $a$ 限制为第一支的参数、$b'$ 限制为第二支的参数
（`sections/parameters.tex:355-360`）。在 $D$ 上重标两支的切坐标并相应重标 $s$，可保证
$(a/t)(x_1)=1$，$(b'/w)(x_2)=1$，这两条等式的用途写在下一行：
它们让分支 gerbe 的坐标 neutralize 之间不带常数 unit 扭曲。

trait 与自同构的配置（`sections/parameters.tex:369-379`）：取相容根 $s_b$，
$S_b=\operatorname{Spec}\overline D[[s_b]]$，$s_b^{b}=s$，$\Omega=\overline{\overline D((s))}$；
把 $\varphi|_{\overline D}$ 逐系数地扩到 $\overline D((s))$，再扩到"加入相容根 $s_b$ 并固定这些根"
所得的并，最后扩到 $\Omega$，仍记作 $\varphi$。光滑射影几何 generic 纤维记 $C/\Omega$，
连通，亏格 $g(C_1)+g(C_2)$，极化 $\varphi$-不变。
这一段我起初写得 sloppy：我想直接对 $\Omega$ 上的 $\varphi$ 说话，
但素材强调"固定那些根"，这等于声明 $\varphi$ 在 $s_b$ 上是平凡的，
只作用在系数上。这个约定保证 §10 里取 $\varphi^{m}$ 时不会把 trait 本身挪走。

对每个 $b$，$\mathcal C(b)\to S_b$ 是平衡扭曲线模型，node 图为
$[\operatorname{Spec}(\overline D[[s_b]][u,v]/(uv-s_b))/\mu_b]$，
$a=u^{b}$，$b'=v^{b}$，$\zeta(u,v)=(\zeta u,\zeta^{-1}v)$
（`sections/parameters.tex:381-390`）。闭结点之外，它经基变换后就是通常的族。
每个模型正常、平坦、tame，粗空间射影、纤维几何约化；
特殊纤维的规范化是两支 root stack $C_i(\sqrt[b]{x_i})_{\overline D}$ 的不交并；
$b\mid m$ 时 $u,v$ 上的幂映射给出 $S_m\to S_b$ 上模型之间的对应映射。
构造可以做在 $D[[s_b]]$ 上带群概形 $\mu_b$，于是模型与这些映射都带选定的半线性作用。
比值 $a/t$ 与 $b'/w$ 剩余为 $1$，常数项为 $1$ 的形式根在特征零下唯一且对幂映射相容，
它们也被 $\varphi$ 保持；因此 node 图把分支 neutral 对象与先前用 $t,w$ 定的那些认同。
一般 $b$ 时只有 gerbe 的 $\ell$-主元商作用在我们的 torsor 上，而该商上 $\varphi$ 按 $q$ 次幂作用，
其余素因子平凡作用（`sections/parameters.tex:402-411`）。

指数的选取是我认为全篇最"工程"的一处（`sections/parameters.tex:413-428`）：
取 $T\subset B\subset G$ 的严格主导共特征标 $\lambda\in X_*(T)$ 与整数 $b_*$ 满足
$0<\langle\alpha,\lambda\rangle<b_*$ 对每个正根 $\alpha$；
参数指标 $b_r$ 取成 $b_*\mid b_r\mid b_{r+1}$ 且 $b_r$ 杀死第 $r$ 阶段两支的惯性作用。
层构造只用固定模型 $\mathcal C(b_*)$ 与惯性类型 $\lambda|_{\mu_{b_*}}$，变动的 $b_r$ 只供有限阶段的参数延拓。
记 $\mathcal V\subset\mathcal C(b_*)$ 为光滑格式 locus，几何 generic 纤维是 $C$，特殊纤维是
$(U_1\sqcup U_2)_{\overline D}$。我对那个不等式的理解是双重的：
它保证所选惯性类型的中心化子恰为 $T$（没有正根在 $\lambda(\mu_{b_*})$ 上平凡），
又保证特殊纤维上"只留一个惯性类型"的截取是开条件。

命题 prop:nodal-parameter（`sections/parameters.tex:430-443`）给出
连续 Zariski 稠密参数 $\tau:\pi_1^{\mathrm{et}}(C)\to J\subset\mathrm{PGL}_n(L')$ 带 $\varphi$-等变性，
并且对每个代数表示，其赋值局部系统有不变格，有限约化在充分大 $r$ 时
于 $\mathcal V\times_{S_{b_*}}S_{b_r}$ 上 lisse 地延拓，等变，且在两支 punctured 分量上
特殊化为 $\sigma_1$ 与 $\sigma_2$（带各自给定的作用），与整个张量系统相容。

证明的主干是有限 torsor 的胶合，我把两个符号的来源写清楚
（`sections/parameters.tex:446-476`）。用公共 node generator $\zeta\in\mu_{b_r}$ 表述两侧作用，
第一支在固定框下记 $u_{1,r}(\zeta)\in Q_r$；第二支的正向坐标生成元是 $\zeta^{-1}$，
把这个取向反转与 gerbe 幂映射 $\zeta\mapsto\zeta^{e}$ 合起来，它在诱导框下的作用就是
$u_{1,r}(\zeta)^{-e}$。若 $P_r$ 是 $P$ 在 $Q_r$ 里的像，则
$P_r u_{1,r}(\zeta)^{-e}P_r^{-1}=u_{1,r}(\zeta)$。
要在有限根指标处直接读出这个恒等式，就把 $\zeta$ 提升到特征零 tame 惯性，
先用 $\gamma\mapsto\exp(t_\ell(\gamma)N_1)$ 再约化到 $Q_r$；不同提升有同一个约化，
非 $\ell$ 的素因子在两侧都贡献恒等。
用左乘 $P_r$ 认同第二与第一右 torsor 纤维，上式恰好说这个认同交织二者的 gerbe 作用；
两侧半线性作用都是 $A_r$（$A$ 的约化），而 $P_rA_r=A_rP_r$，所以同一认同也交织 Frobenius，
坐标上就是 $P_r(A_rg)=A_r(P_rg)$（$g\in Q_r$）这个初等交换图。
素材还专门画了一张图来记"两个符号加一个胶合映射"
（`figures/node.tex:1-28`：两支标 $(C_1,x_1)$、$(C_2,x_2)$，
node 上标 $B\mu_{b_r}$，左右分别写 $u\mapsto\zeta u$、$u_{1,r}(\zeta)$ 与
$v\mapsto\zeta^{-1}v$、$u_{1,r}(\zeta)^{-e}$，两个 $Q_r$ 纤维之间画箭头 $g\mapsto P_rg$
并注 $P_rA_r=A_rP_r$）。我现在的习惯是：凡是胶合里出现两个以上符号，就先把它画成一张图，
本稿这张图省掉了我至少一次符号错误。

胶合之后的三步（`sections/parameters.tex:480-500`）：规范化 torsor 现在粘成
$\mathcal C(b_r)_0$ 上的有限 étale 右 $Q_r$-torsor $\mathcal T_{r,0}$，
这是等变图里的普通 nodal 胶合：在每支覆盖上 étale 局部地 torsor 跨原点常值，
两个常值纤维已用同一个 $\mu_{b_r}$-作用认同，跨 $uv=0$ 粘合并取等变商，
于是结处与结外都 étale，并保住 $Q_r$-作用与半线性作用。
proper henselian invariance 把 $\mathcal T_{r,0}$ 提升为 $\mathcal C(b_r)$ 上的有限 étale torsor $\mathcal T_r$；
full faithfulness 提升群作用、等变性同构与转移映射（在可除指标拉回后），关系也一并提升；
限制到公共几何 generic 曲线 $C$ 得到有限 $Q_r$-torsor 塔，相容取框后给出取值
$\varprojlim_r Q_r=J$ 的连续参数，提升的等变性给出所断言的作用。

稠密性论证是我最想学的一段"借力"（`sections/parameters.tex:502-522`）：
用第一支来验稠密，并且不给 $Q_r$-torsor 加连通性要求。
取 $\mathcal V\to S_{b_*}$ 的一条穿过 $(U_1)_{\overline D}$ 某点的截线，base change 到每个 $S_{b_r}$，
沿这些截线为提升的塔取相容框；对每个 $S_{b_r}$ 用 lem:component-orbits。
punctured 第一支的单调在该截线纤维上的轨道落在整个特殊 torsor 里它的连通分支内；
引理把该分支的截线纤维与几何 generic 分支的截线纤维认同，后者就是 generic 单调轨道。
若 $H_1$ 是 $\sigma_1$ 的像、$H_\tau$ 是 $\tau$ 在相容框下的像，则
$\operatorname{im}(H_1\to Q_r)\subset\operatorname{im}(H_\tau\to Q_r)$ 对每个 $r$；
两子群紧致故在 $J$ 中闭，$J_r$ 共尾，于是 $H_1\subset H_\tau$；
由 prop:lifted-parameter，$H_1$ Zariski 稠密，故 $\tau$ 稠密。
这里的方向值得记住：稠密性靠"包含"传递，靠紧致的闭性收尾，
所以整条链上没有任何一步需要我知道 $H_\tau$ 有多大。
最后（`sections/parameters.tex:524-535`）对 $V$ 取 $J$-不变格，每个有限约化透过某个 $Q_r$，
结点之外 $\mathcal C(b_r)$ 与 $\mathcal C(b_*)$ 的相应 base change 一致，
故 $\mathcal T_r$ 在 $\mathcal V\times_{S_{b_*}}S_{b_r}$ 上给出所需的 lisse 延拓，
特殊限制恰是两支的 component torsor 带半线性作用；
一座塔同时服务所有表示，张量与态射比较就现成，这正是 §4 里命题所需的等变格特殊化数据。

## §10 结上特殊化：nearby cycles 会零，我用一个格式平凡化将其救回

现在引擎两侧都接上了。$\tau$ 活在扭退化之光滑 generic 曲线 $C/\Omega$ 上，
prop:equivariant-unramified 给出等变 non-ramified 特征复形 $D_\tau$；
本节要把它特殊化到结、留在第一支上，并把 enhancement 摘掉。
素材把两个议题点名了（`sections/nodal.tex:8-11`）：在规定 node 类型上的非零性，
以及从增强层下降到普通层时半线性作用的保持。
命题 prop:charzero-equivariant 的结论（`sections/nodal.tex:13-27`）是：
存在 $m\ge1$ 与非零局部可构造 perverse 几何 $\overline{\mathbb Q}_\ell$-adic 层
$M_{\overline D}$ 在 $\mathcal A_1=\operatorname{Bun}_{G,B,x_1}((C_1)_{\overline D})$ 上，
带 $\varphi^{m}$-结构与 $\sigma_1$ 的完整相容 Hecke 特征结构，
每条特征同构都与该结构及 $\sigma_1$ 上给定的 $\varphi^{m}$-结构相容，并且
$\operatorname{SS}(M_{\overline D})\subset\Lambda_{\mathrm{par}}$。

先说规定的 node 类型。固定 §9 的 $b_*$ 与严格主导 $\lambda$，即
$0<\langle\alpha,\lambda\rangle<b_*$ 对每个正根；在 $\mathcal C(b_*)/S$（$S=S_{b_*}$）
的相对丛栈里，从特殊纤维删掉除 $\lambda|_{\mu_{b_*}}$ 共轭类以外的一切惯性类型，
所得开栈记 $\mathcal B$（`sections/nodal.tex:31-50`）。
开的原因是 $\mu_{b_*}\to G$ 的同态只有有限多个共轭类，它们在剩余 gerbe 上局部常值；
所选类型的中心化子是 $T$，因为那些不等式保证没有正根在 $\lambda(\mu_{b_*})$ 上平凡；
代数性与局部有限表示来自 Hall--Rydh 的 Hom-stack 定理；
光滑性由伴随丛 $H^2$ 消失给出（曲线 tame、粗 pushforward 正合、粗空间维数为 $1$）。
几何 generic 纤维是 $\operatorname{Bun}_G(C)$。

两支的 flag 与商描述是本节最需要小心的地方（`sections/nodal.tex:52-110`）。
取与 $B$ 同 torus 的相对 Borel $B^{-}$，写
$\mathcal A_1^{+}=\operatorname{Bun}_{G,R_u(B),x_1}((C_1)_{\overline D})$、
$\mathcal A_2^{+}=\operatorname{Bun}_{G,R_u(B^{-}),x_2}((C_2)_{\overline D})$，
则 $\mathcal B_s\simeq[\mathcal A_1^{+}\times\mathcal A_2^{+}/T]$，
$T$ 同时改变 node gerbe 上的两个框。我第一遍推这个同构时以为两支都会给出 $B$，
结果与素材不符；错在我忘了第二支的 node 生成元作用是 $v\mapsto\zeta^{-1}v$，
它的正向坐标生成元看到的是 $-\lambda$，于是一模一样的计算给出 $B^{-}$。
计算细节值得留档：第一支上 $a=u^{b_*}$，在惯性为 $\lambda$ 的框里换框满足
$h(\zeta u)=\lambda(\zeta)h(u)\lambda(\zeta)^{-1}$；共轭到不变的 punctured-disc 框得
$g(a)=\lambda(u)^{-1}h(u)\lambda(u)$；若 $j=\langle\alpha,\lambda\rangle$ 是正根 pairing，
则正、负根坐标分别按 $u^{j}f(u^{b_*})\mapsto f(a)$ 与
$u^{b_*-j}g(u^{b_*})\mapsto a\,g(a)$ 变换，toral 坐标是 $a$ 的级数。
这些公式把整个换框群认作 $\{g(a)\in G(\overline D[[a]]):g(0)\in B\}$；
对任意测试格式的方案由形式 big cell 里同样的根群分解给出。
求值 $h\mapsto h(0)$ 变成这个 Iwahori 群的 torus 投影，固定 gerbe 框因此给出增强 $B$-flag。
两支的固定 gerbe torsor 自同构群都是 $T$（用公共 node 生成元表述），
带上 gerbe 认同去粘规范化丛就给出商描述；计算是逐支的，两支曲线之间不需要同构。
等变性在这里是免费的：所有规定只用分裂群、群概形共特征标 $\lambda$ 与 $D$ 上选定的平衡坐标，
因此与 $\varphi$ 交换，含它对 $\mu_{b_*}$ 的作用，且没有单独宣布某个单位根固定。
结点外的修改保住 gerbe 框并作用在相应因子上，这把一切逐次与多腿 Hecke 对应
（拉到 $\mathcal A_1^{+}\times\mathcal A_2^{+}$ 之后）也认成分支各自的那个。

接下来是我原本以为"显然"的一步：$\Psi D_\tau\ne0$。
素材专门开了一小节来讲它的判别条件（`sections/nodal.tex:112-157`），因为
nonzero 的 generic 复形 nearby cycles 完全可以是零。
判别 lem:specialization-detection 的口径我逐条抄下来，它比我预想的苛刻：
$S=\operatorname{Spec}A$ 是 excellent complete 严格 henselian trait，剩余域代数闭、$\ell$ 可逆；
$\mathcal Y\to S$ 光滑局部有限型；特殊纤维须是下述之一：无 level 的、普通 Borel-level 的、
增强 Borel-level 的丛栈（在光滑射影曲线上），或者（特征零时）两个增强 level 栈的 simultaneous-torus 商；
剩余特征为正时还要求剩余域是有限域的代数闭包并满足 §12 会验的群论假设。
还要有相对维 $1$ 的光滑格式 $L\to S$ 供球型 Hecke 腿，$L_s$ 在特殊纤维每条曲线上包含
非空开的修改容许 locus；有界输出映射到 $\mathcal Y\times_SL$ 表示且正常；
exact-relative-position 层在两个投影（input-and-leg 与 output-and-leg）上光滑；
其特殊纤维有横向修改几何；Satake 核在开层上是带相对 Satake 移位与扭曲的常值核。
最后：$F$ 是 $\mathcal Y_{\bar\eta}$ 上局部有界可构造复形，在 $L_{\bar\eta}$ 上有 lisse 球型 Hecke 特征值，
每个特征值有 lisse 格，其有限约化在有限 trait 扩张后 lisse 地延拓并与特殊纤维值相容；
若在某个光滑有限型格式 $Z\to\mathcal Y$ 上，$F|_{Z_{\bar\eta}}$ 的非零 stalk locus 的闭包与 $Z_s$ 相交，
则 $\Psi F\ne0$。素材还补两条口径：$\Psi$ 是不带惯性不变量的几何 nearby cycles；
闭包可以在把有限多个几何 generic 分量下降到 trait 的有限扩张之后再算，
判别本身与这个解读都不要求 $F$ 下降。

有了判别，我的任务就从"证明非零"降级为"造出一个 section 来见证相交"。
这一步我原本打算靠 $\operatorname{Bun}$ 的 cell 分解，素材给了一个初等到让我惭愧的论证
（`sections/nodal.tex:159-184`）：对 $G=\mathrm{SL}_n$，若 $Y$ 是代数闭域上光滑射影连通曲线、
$y\in Y$，则 $Y\setminus\{y\}$ 是光滑仿射曲线，坐标环是 Dedekind 整环；
该环上秩 $n$ 射影模同构于秩 $n-1$ 自由模加上它的行列式，
于是每个 $\mathrm{SL}_n$-丛在这个补集上平凡；自由基可用一个单位调整，
使行列式与给定平凡化相符。推论：$Y$ 上任意两个 $\mathrm{SL}_n$-丛只差 $y$ 处的一次修改，
而每次这样的修改落在某个有限 Schubert 界里；在族里，固定参考输入与固定光滑截线 $y$ 的
有界 Hecke 空间在基 trait 上正常；故几何 generic 的修改在有限 trait 扩张后延拓：
它的点先下降到有限的 generic 扩张，再对完备 trait 的相应 DVR 正规化用 valuative criterion；
输出在与 $y$  disjoint 的每个 marking 或结点附近保持不变。
我原来的 cell 分解路线在这个问题上会失败的原因我现在能讲出来：cell 分解需要群作用与
可分性假设，而"延拓一个 generic 点到特殊纤维"是纯格式论的问题，
用正常的 Hecke 空间是正合的武器，代价只用 $p>n$ 之外的条件。

把两步合起来（`sections/nodal.tex:185-257`）：对 $(C,\tau)$ 用 prop:equivariant-unramified，
generic 曲线光滑射影连通亏格至少 $2$，极化来自射影光滑化；trait $S_{b_*}$
excellent、完备、严格 henselian，剩余域特征零代数闭，$\ell$ 可逆；
取 $L=\mathcal V$，$L_{\bar\eta}=C$，$L_s=U_{1,\overline D}\sqcup U_{2,\overline D}$；
这些腿上有界对应带光滑框图里的分裂 affine Grassmann 局部模型，
输出映射表示且正常，两个 exact-position 映射光滑，开胞核有归一化常值核，
修改保住 node 类型；特殊纤维上商描述给出余切描述、锥维数上界与横向修改，
正是 torus-商情形。特征值假设用 prop:nodal-parameter 的等变有限 torsor 塔：
每个表示的不变格约化在 $S_{b_r}\to S_{b_*}$ 之后于光滑格式 locus 上 lisse 延拓，
特殊化是分支参数系统，所有张量映射与半线性作用由同一座塔带走。
于是 $F_s:=\Psi D_\tau$ 局部有界可构造，带相容分支特征结构与 $\varphi$-作用。
非零性的见证按这个顺序搭：先在 $\mathcal A_1^{+}\times\mathcal A_2^{+}$ 里选一点，
过它的像取 $\mathcal B$ 的光滑格式，再 henselian 提升，得到带规定 node 类型的参考丛 $P_0/S$；
把 $L_s$ 的一点提升为截线 $y$；在 $D_\tau$ 有非零 stalk 的 $C/\Omega$ 上选丛 $P$
（非零且局部有界可构造保证这样的点在有限型格式上存在）；
Dedekind 论证在 $y_\Omega$ 之外认同 $P$ 与 $(P_0)_\Omega$，把所得有界修改在有限 trait 扩张后延拓，
其输出仍在 $\mathcal B$ 里（node 限制仍等于 $P_0$ 的）；过其特殊值取光滑有限型格式
$Z\to\mathcal B$ 与其上剩余域点，$Z\times_{\mathcal B}S'\to S'$ 光滑，
henselian 提升该点（必要时再有限扩张）给出截线，其几何 generic 点带所选非零 stalk，
于是 $F_s\ne0$ 在 $[\mathcal A_1^{+}\times\mathcal A_2^{+}/T]$ 上成立。
素材对这里有一句我特意圈起来的免责（`sections/nodal.tex:252-257`）：
这些有限扩张只是把闭包定位在固定的几何 generic 纤维里，
它们不给 $D_\tau$ 或它的半线性结构加任何下降要求，也不必带 $\varphi$，
因为几何 nearby cycles 在有限 trait 替换下不变，而等变对象本来就在 $S$ 上造好。

最后一步"限制到一支"里藏着整个定理中 $m$ 的出处
（`sections/nodal.tex:259-285`，与 `sections/introduction.tex:75-77` 呼应）。
$F_s$ 拉到 $\mathcal A_1^{+}\times\mathcal A_2^{+}$ 的普通拉回非零，因为该映射光滑满；
选 $\overline D$-点 $(a_1,a_2)$ 使 stalk 非零；定义 $a_2$ 的丛与增强 flag 有限表示，
而 $\overline D/D$ 代数，故它们下降到有限扩张 $D'/D$；取包含 $D'$ 的有限正规扩张，
$\varphi$ 固定 $D$，故它在该正规扩张上的作用有限阶，某个幂 $\varphi^{m}$ 逐点固定它，
下降的模型就提供 $\varphi^{m*}a_2\simeq a_2$，此后就用这个幂作生成元。
沿 $\mathcal A_1^{+}\times\{a_2\}$ 限制得到 $\mathcal A_1^{+}$ 上非零局部有界可构造复形 $F_1^{+}$
带 $\varphi^{m}$-结构；由对应商的描述与每个界上的正常基变换，
$\mathsf H_{I,(V_i)}(F_1^{+})\simeq F_1^{+}\boxtimes\bigl(\boxtimes_{i\in I}(V_i)_{\sigma_1}\bigr)$
对每个有限腿集成立，同一批比较在逐次修改空间与每条融合对角上也成立，
且这些比较在半线性运输下自然，所以全部特征映射与其相容性约束都是等变的。
普通拉回在此足够，素材还特意声明对 $F_1^{+}$ 不作任何 perverse 断言。

## §11 摘 enhancement：中心层特征标把单值性钉死

我原本以为把增强 flag 忘掉是"技术上最脏"的一段，读完发现它倒是最定量的一段。
路线是三动作（`sections/nodal.tex:287-296`）：取 perverse 上同调、
沿忘掉 enhancement 的 torsor 推前、再取一次 perverse 上同调。
第一个截断供幂零奇异支撑，它控制沿 enhancement torus 的单调；
该单调的单值性保证推出非零；第二个截断给出所需的 perverse 对象。
几何输入是 companion 稿的命题 6.1 与 7.5，口径是一个带一个 marking 点的光滑射影复曲线
与分裂单连通群；6.1 在普通或增强 Borel level 都适用：局部有界可构造几何 adic 复形
若对 Zariski 稠密参数带相容特征结构，则每个 perverse 上同调继承完整特征结构与幂零奇异支撑，
且复形非零则某个 perverse 上同调非零；7.5 在边界单调为单值时摘掉 enhancement
（`sections/nodal.tex:297-309`）。

素材在这里插入一个方法论选择（`sections/nodal.tex:311-318`）：
为了调用这些几何陈述，选一个抽象域同构 $\overline D\simeq\mathbb C$。
这样的同构存在，因为两域都是特征零代数闭且对 $\mathbb Q$ 的超越度为 $2^{\aleph_0}$。
用的是它们的 Betti 论证来确立几何性质，而所有层操作与诱导映射仍在 $\overline D$ 上的几何 adic 范畴里做。
我第一次读到这里觉得这是"偷渡"，我的怀疑是：借了 $\mathbb C$ 的拓扑性质，
怎么保证结论在 $\overline D$ 上成立？素材的答案是靠操作层面的自律：
被借的只是界与正合性这类几何性质，比较映射一律由 adic 截断三角形的泛性质给出，
所以真正使用的只是"$\overline D$ 上的 adic 范畴有同样的形式机制"。
`[推测]` 素材没有把这条免责写成命题，只写成方法与一句"比较本身由泛性质推出"，
所以我只能标推测：这一步的合法性大概依赖两个事实（perverse 截断在两个域上是同一套三角形泛性质；
Betti 与 adic 的可构造层范畴在代数闭特征零之间通过 comparison 定理互换），
但正文没有展开，我没有依据把它当引理引用。

截断与等变的交换（`sections/nodal.tex:319-351`）我写成等式：取 $j$ 使 $Q={}^pH^{j}(F_1^{+})\ne0$；
对 $|I|=d$，有函子性 adic 比较
${}^pH^{j}\bigl(\mathsf H_{I,(V_i)}(F_1^{+})[d]\bigr)\simeq\mathsf H_{I,(V_i)}({}^pH^{j}F_1^{+})[d]$。
特征值一侧，$\mathcal L_I=\boxtimes_{i\in I}(V_i)_{\sigma_1}$ 在光滑 $d$ 维腿空间上 lisse，
故与 $\mathcal L_I[d]$ 的 exterior product 是 perverse 正合的，
${}^pH^{j}(F_1^{+}\boxtimes\mathcal L_I[d])\simeq Q\boxtimes\mathcal L_I[d]$；
把两串比较作用在 §10 末的特征等式上并消去公共移位 $[d]$，
就得 $Q$ 的相对归一化特征映射。碰撞 $\Delta:U_1^{J}\to U_1^{I}$ 对应的截断比较用
$(\mathrm{id}\times\Delta)^*[|J|-|I|]$（在这些局部常值腿族上）；
逐次 Hecke 比较用其保留腿空间的总维数，共享的腿只数一次。
于是那条比较把单位、卷积、置换与融合图整套带走。$\varphi^{m}$ 的拉回保持 perverse 结构与其截断映射，
故这些 adic 比较与它交换，且不需要所选复形实现与 $\varphi$ 之间任何相容性。

现在处理 $q:\mathcal A_1^{+}\to\mathcal A_1$，忘掉 enhancement，这是相对维 $r=n-1$ 的 $T$-torsor；
令 $F=q_{!}Q$。素材强调它需要的是命题 7.5 证明里的中间断言：
这个特定直接像非零，而一般 torus 的直接像并不保非零（`sections/nodal.tex:353-361`）。
机制分三层。第一层是余切：增强 level 的 cotangent residue 落在 $\operatorname{Lie}B$；
在适配局部框里把 generically nilpotent 的 Higgs 场写作 $\theta=b(t)\,dt/t$，$b(t)$ 正则；
正次不变多项式在 $b(t)$ 上消失，故在 $b(0)$ 上消失，于是该 residue 的 toral 投影为零；
因此增强幂零锥是普通 level 锥的光滑余切 pullback，并且湮灭 $T$-纤维的切方向。
第二层是 microlocal 判据：由 companion 稿引理 7.1，$Q$ 的 Betti 实现沿这个 torsor 是 monodromic 的，
即在基上局部地对"整个 torus 作第二因子"的乘积分层可构造，特别地每纤维的上同调层是局部系统。
第三层是中心层计算，也是本节我要抄进台账的公式
（`sections/nodal.tex:378-387`）：对表示 $V$ 记 $\chi_V$ 为其在对偶 torus $\widehat T$ 上的特征标，则
$\chi_V(\text{enhancement monodromy})
=\operatorname{Tr}(\text{boundary monodromy on }V_{\sigma_1})\,\mathrm{id}_{Q}
=(\dim V)\,\mathrm{id}_{Q}$，
最后一个等号用 $x_1$ 处的单值性。在 torsor 纤维的任意 stalk 上同调上，
交换的单调有联合广义特征标，视作 $\widehat T(E)$ 的点；
表示的特征标函数张成 $\widehat T$ 上 Weyl 不变正则函数并区分其 Weyl 轨道，
于是上述公式把每个特征标放进 $1$ 的轨道，而该轨道只含 $1$；
故这些有限维空间上所有 enhancement 单调都是单值的。

非零性的最后一段是谱序列会计（`sections/nodal.tex:398-413`）：
选纤维 $T=q^{-1}(a)$ 使 $Q_T:=Q|_T\ne0$，取 $j_0$ 为 $\mathcal H^{j_0}(Q_T)\ne0$ 的最大指标；
其纤维 $W$ 是 $\Gamma=X_*(T)$ 的非零有限维表示，带交换的单值算子族；
系数域 $E=\overline{\mathbb Q}_{\ell}$ 上的群环 $E[\Gamma]$的增广理想在这空间上幂零作用，
故余不变量 $W_{\Gamma}$ 非零；Poincaré 对偶给出
$H_c^{2r}(T,\mathcal H^{j_0}(Q_T))\simeq W_{\Gamma}(-r)\ne0$；
在紧支撑超上同调谱序列里，这项由 $j_0$ 的极大性没有 incoming 微分，
由 $H_c^{i}(T,-)=0$（$i>2r$）没有 outgoing 微分，于是
$H_c^{2r+j_0}(T,Q_T)\ne0$；$q_{!}$ 的比较与基变换给出 $F_a\ne0$。
素材收尾提醒：这个论证只对所选的有限维空间用了一次幂零界。
我对这句的体会是，它把"整族 monodromy 一致幂零"这种我原本打算去证的强命题给省掉了，
又是一个"只在需要的局部上说话"的例子，和 §5 里避开全局同调界是同一味手法。

把 $F$ 的特征结构搬过去靠的是（`sections/nodal.tex:415-429`）：
$q$ 有限型且相对维固定，故 $F$ 局部有界可构造；$x_1$ 之外的修改把增强 flag 与普通 flag 一起搬运；
有界 Hecke 对应上的正常基变换与投影公式给出
$\mathsf H_{I,(V_i)}(q_{!}Q)\simeq(q\times\mathrm{id}_{U_1^{I}})_{!}\mathsf H_{I,(V_i)}(Q) \simeq q_{!}Q\boxtimes\bigl(\boxtimes_{i\in I}(V_i)_{\sigma_1}\bigr)$，
这些比较在逐次与碰撞对应上同样成立，因此保住全部相容约束；
$q$ 定义在 $D$ 上，故它的直接像与这些自然比较映射带 $\varphi^{m}$-结构。
最后取非零 perverse 上同调 $M_{\overline D}={}^pH^{a}(F)$，
6.1 现在在普通 Borel level 适用，同一套 adic 截断论证证明诱导特征映射的等变性，
并给出幂零奇异支撑；普通 flag level 下那个锥就是 $\Lambda_{\mathrm{par}}$。
至此 prop:charzero-equivariant 证毕，剩下的只是落回有限域。

## §12 落回有限域：四条群论假设才是 $p>n$ 的真正去处

最后一段是 mixed-characteristic 特殊化，我原本以为它最"例行"，
结果发现我先前对 $p>n$ 的理解完全错了。先把那四条李论假设摆出来
（`sections/conventions.tex:253-266`）：companion 稿的其余几何输入需要
一个不变对称双线性型、它在每个 Levi 的李代数中心上也非退化；
对每个 Levi 的 Chevalley 限制定理；半简单元素的 scheme-theoretic 中心化子是 Levi；
以及每个幂零元在任意域扩张上都落在该域上定义的某个抛物子的幂零根里。
引理 lem:lie-hypotheses 说 $G=\mathrm{SL}_n$ 在特征零或 $p>n$ 的代数闭域上满足这四条。

逐条核验（`sections/conventions.tex:268-297`）。第一条：不变型
$\kappa(X,Y)=\operatorname{tr}(XY)$ 在 $\mathfrak{sl}_n$ 上非退化，因为 $n$ 可逆；
对块大小 $n_1,\ldots,n_r$ 的块 Levi，它在李代数中心上的限制是对角型，
分量系数为 $n_i$，作用在 $\{(z_i):\sum_i n_i z_i=0\}$ 上；
该超平面是 $(1,\ldots,1)$ 的正交补，而 $(1,\ldots,1)$ 的长度平方是 $n$；
所有 $n_i$ 与 $n$ 都可逆，故限制型非退化。
第二条：这些 Levi 的 Chevalley 限制由稠密正则半简单 locus 上的分块对角化得到；
块对称的特征值多项式由块特征多项式提升；Weyl 群的阶整除 $n!$，在 $p>n$ 时可逆，
于是取平均说明总迹零超平面上的不变量是全对角空间不变量的限制；
分块对角化可以在行列式为 $1$ 的 Levi 里做，用对角中心化子里的元素调行列式。
第三条：半简单李代数元素的 scheme-theoretic 中心化子就是它的块 Levi，
由矩阵交换方程直接读出。第四条：在任意域扩张上，正次不变多项式消失说明矩阵幂零；
取其 kernel 滤过的适配基，就把它放进该域上定义的严格上三角李代数，
因此落在某个有理 Borel 的幂零根里，这就提供了所要求的有理抛物子。

我原先把 $p>n$ 读成"避开小特征的通用余量"，读完这四条才明白它是精确的整除性账单：
第一条要 $n$ 可逆，第二条要 $n!$ 可逆，两者合起来 $p>n$ 刚好够用；
第四条则对任何特征都成立（用的是 kernel 滤过，不涉整除）。
这条认知改变了我的写作顺序：§10 的判别引理里"剩余特征为正时必须满足这些群论假设"
那句条件，正是在这里被兑现的（`sections/final.tex:54-56`）。

现在写最后一段的骨架（`sections/final.tex:10-46`）。取 §11 的 $m$ 与 $M_{\overline D}$；
回忆 $R=W(k)$、$K=\overline{\operatorname{Frac}(R)}$、$\overline D\subset K$ 被 $\varphi$ 保持。
沿代数闭域扩张拉回得到 $\mathcal X_K$ 上 $\operatorname{Bun}_{G,B,\mathfrak x}$ 的 $M_K$；
它仍非零、局部可构造、perverse，并继承 $\varphi^{m}$-结构。
这三条断言都在有限型光滑格式上检查：代数闭域扩张保住非零可构造 stalk、支撑维数与
Verdier 对偶，因而保住 perversity；有界 Hecke 对应的基变换配合 §3 的张量 Satake 比较，
把整条特征结构搬过去；特征值是 $\sigma_1$ 的 base change，带算术塔提供的作用。
然后取相对普通 level 丛栈 $\mathcal A=\operatorname{Bun}_{G,B,\mathfrak x}(\mathcal X_R/R)$，腿空间 $L=\mathcal U_R$，
$M=\Psi M_K$ 在 $\mathcal A_k$ 上（`sections/final.tex:30-36`）。
假设逐条验：$R$ 是 excellent complete 严格 henselian DVR，剩余域代数闭为 $k$，
$\ell$ 可逆因为 $\ell\ne p$；$\mathcal A$ 在 $R$ 上光滑局部有限型，
因为纤维上伴随丛的 $H^2$ 消失、加 flag 是光滑 $G/B$-fibration；
$L$ 相对维 $1$ 光滑，特殊纤维是 $U$。所有腿避开 $\mathfrak x$，
故球型 Hecke 对应是普通分裂 affine Grassmann 框模型，有界输出表示且正常，
两个 exact-position 映射在 bundle-and-leg 上光滑，开层核带固定的相对 Satake 归一；
特殊纤维的余切与横向修改几何是普通 Borel-level 情形；群假设 H1--H4 由上面的引理用 $p>n$ 兑现；
算术塔给不变格，其有限约化在 $\mathcal U_R$ 上 lisse，带 $\varphi$-作用，
特殊化（含全部张量映射）恰是 $\rho$ 相关的局部系统。于是命题与判别引理的全部条件成立。

结论分三块。第一块：$M$ 局部可构造 perverse，带自然多腿特征同构
$\mathsf H_{I,(V_i)}(M)\simeq M\boxtimes\bigl(\boxtimes_{i\in I}(V_i)_{\rho|_{\pi_1(U)}}\bigr)$，
同一命题给 $M$ 一个 $\varphi^{m}$-结构并使这些映射等变；特殊纤维上 $\varphi^{m}$ 的作用就是
$q^{m}$-Frobenius；在特征值系统上它恰是把 $\rho$ 限制到
$\pi_1(U_{0,\mathbb F_{q^m}})$ 所得的作用，理由是用于提升的那些有限 torsor
本来就是从那个算术表示下降来的（`sections/final.tex:64-78`）。
我在 §7 里问过"为什么要用算术像 $H_0$ 来定塔"，答案落在这里：
塔的算术出身使得特殊化回去时算术作用自动对齐，我无需再造一次 Frobenius。

第二块是非零（`sections/final.tex:80-103`）。选 $M_K$ 有非零 stalk 的 $K$-点 $(P,\beta)$，
$\beta$ 是 $\mathfrak x_K$ 处的 Borel 约化；以 $\mathcal X_R$ 上平凡 $G$-丛为参考，
用光滑与 henselian 把 $U(k)$ 的一点提升为截线 $y\in\mathcal U_R(R)$；
§10 的仿射曲线论证在 $y_K$ 之外平凡化 $P$ 并与行列式相容；
由此得到的参考丛修改落在某个有限 Schubert 界里，该界的 Hecke 空间对
"参考输入加 $y$"正常；有限 trait 扩张后它延拓为整条相对曲线上的丛 $\mathcal P$。
剩下的数据是 flag：其 generic 值 $\beta$ 是扩张 trait 上关联 flag 丛
$\mathcal P|_{\mathfrak x}\times^{G}G/B$ 的点，该丛正常，valuative criterion 把 $\beta$ 也延拓；
于是 $(P,\beta)$ 延拓成 $\mathcal A$ 的截线，再把截线提升到过其特殊值的光滑有限型格式，
沿用 §10 的 henselian 提升，该截线有非零 generic stalk，
故非零 stalk locus 的闭包与该格式的特殊纤维相交，判别引理给出 $M\ne0$。
注意这一块与第一块完全独立：非零性用的是支撑闭包的几何，用不到特征结构。
素材在 `sections/introduction.tex:174-175` 也是这么交代两次特殊化的："两次特殊化各自用一条
独立的支撑闭包论证来证非零"。

第三块是奇异支撑（`sections/final.tex:105-121`）。用域层面的幂零判别定理
（companion 稿定理 4.1）：在 $k=\overline{\mathbb F}_q$ 上的 level 栈与它的群论假设下，
带球型特征同构与 lisse 特征值的局部有界可构造复形，在每条光滑有限型格式上
奇异支撑落在 generically nilpotent Higgs 场的锥里。这里 $\mathcal A_k$ 是普通 Borel-level 栈，
特征假设成立，多腿特征同构供上 lisse 特征值；普通 flag $\beta$ 处的余切 residue 条件是
$\operatorname{Res}_x\theta\in\operatorname{Lie}R_u(B_\beta)$，
故判别定理里的锥恰是主定理的 $\Lambda_{\mathrm{par}}$。

收尾把 $M$ 配上 $\varphi^{m}$-结构记作 $\mathbb F_{q^m}$ 上的 Weil 层 $M_0$；
分裂 Weil Satake 比较把运输过的 Hecke 函子认作相对 Satake 归一的 Weil 函子，
于是那批特征同构是每个有限腿集与每组表示下的 Weil 层同构；
上面每一步都用对半线性生成元自然的比较搬运完整特征结构，
这些比较在逐次修改对应与每条碰撞对角线上构造，单位元与置换全程受尊重，
所得单位、卷积、置换、融合图作为 Weil 图交换，含所有迭代碰撞；
一个 Weil 层只要由 Frobenius 张成的循环群结构，没有 profinite 下降断言。

## §13 与最初设想的差异，以及我不敢硬编的缝隙

把 §1 的动机与 §12 的结论并排看，我原来的想法至少有七处走偏，逐条对账：

1. 我以为要"给一个已有对象加结构"，实际是"在一个特挑对象上认出结构"。
区别很实在：能被认出的对象是谱 skyscraper 的原象 $D_\tau$，
一般几何特征层根本不可见（`sections/introduction.tex:147-153`）。
2. 我以为 Frobenius 标量由纯度决定，实际上必须由归一化决定，
验证走 Bott--Samelson 与 decomposition theorem（`sections/conventions.tex:137-157`）。
3. 我以为等变要沿完整 $\widehat{\mathbb Z}$ 下降，实际只要 $\mathbb Z$（生成元作用）。
4. 我以为结点胶合用边界逆元，实际需要一个同时与 $A$ 交换又落在紧致开子群里的共轭子，
而它的存在靠一条 $e\equiv-1\bmod\ell^{N}$ 的同余选取。
5. 我以为"参数不变"就够，实际还要一条消 shift 的论证与一条特征结构唯一性论证，
两者各自用到 ample 线丛的不变性与 $Z(\mathrm{PGL}_n)=1$。
6. 我以为非零性可以靠 generic 非零自动得到，实际上 nearby cycles 会把复形杀死，
必须用支撑闭包相交的判别，并在两处特殊化里各造一次见证截线。
7. 我以为 $p>n$ 是背景噪声，实际它是 H1--H4 的整除性账单，
其中第一条要 $n$ 可逆、第二条要 $n!$ 可逆。

还有 $m$ 的出处让我意外：它来自一个点的下降。
$\mathcal A_2^{+}$ 里那个见证点 $a_2$ 的丛与增强 flag 有限表示，故下降到某个 $D'/D$，
取包含 $D'$ 的有限正规扩张，$\varphi$ 固定 $D$ 于是它在这扩张上有限阶，
某个幂 $\varphi^{m}$ 逐点固定该扩张（`sections/nodal.tex:261-269`，
并与 `sections/introduction.tex:75-77` 的说法一致：辅助丛栈上一点被某个 Frobenius 幂固定）。
我原以为 $m$ 会来自系数域扩张或 torsor 塔的共尾性，结果只来自一个点的定义域，
这个"便宜"是全篇最让我意外的地方。

下面这些缝隙我确实没有素材支撑，全部标 `[推测]` 并说明缺什么：

- `[推测]` 为什么必须有消 shift 那段，并非全局同调界。素材只声明"不需要全局界"，
没写全局界为何不可得；我缺少 $\operatorname{Bun}_G(C)$ 上振幅无界的实例，无法把这条写成事实。
- `[推测]` 抽象同构 $\overline D\simeq\mathbb C$ 的合法性边界。素材把它作为方法陈述
（借 Betti 论证证几何性质，操作全在 adic 范畴里做），没有给出可引用的比较定理；
我只知其结论被使用，不知其适用范围。
- `[推测]` $m$ 能否被数据界住（例如用 $[L:\mathbb Q_\ell]$、$g(X_0)$、$e$ 显式给出）。
素材只断言存在，没有任何界，因此我不能声称 $m$ 可有效计算。
- `[推测]` 结论能否推广到 $\mathrm{SL}_n$ 以外的群。素材对一般群只交代
Gaitsgory--Raskin 在正特征下的结果关于谱分量之并（`sections/introduction.tex:93-100`），
并且 H1--H4 只为 $\mathrm{SL}_n$ 验过；换群要先换那四条整除性验证，我没有做。
- `[推测]` 与 de Rham 侧那个预印本的精确对应关系。素材写出的只是：那边在
正则奇点不可约参数上造 coherent tame 特征对象，且带条件；regular holonomicity 与
generic perversity 在那份预印本里仍是期望（`sections/introduction.tex:114-122`）。
两边的技术接口我没有材料可以对齐。
- `[推测]` 温和条件"野惯性被杀死"在构造里的使用点是否可放松。素材给出的边界形式
$\rho(\gamma)=\exp(t_\ell(\gamma)N)$ 直接决定 §8 里 $e$ 与 root 指标只能取 $\ell$-幂，
一旦允许野部分，Kummer 根杀死惯性的机制就断，但我没有反例说明它真的不可救。

如果继续往下做，我的下一步会是两件小事：先把 §8 的共轭子构造单独抽成一个命题，
检查把 $N_1$ 换成非正则幂零（比如 $\mathrm{PGL}_n$ 里更一般的单子）时
Jordan 滤过上的等比数列论证还剩什么；再把 §12 的 H1--H4 核验表逐条对
$\mathrm{SL}_n\times\mathrm{SL}_m$ 之类的 Levi-型情形跑一遍，看整除性账单变成什么形状。
两件事都超出本稿素材，我只能把它们记成自己的待办，`[推测]` 级别。

## §14 勘误与缺陷申报

先记语言层面的三处瑕疵，按规格我只用语言类别指代，不逐字复现：
第一处在 §7 讲"允许不连通 torsor"那句里，混进了一个英文动名词残片，正确读法是中文的"扩大"；
第二处在 §1 末段谈 Weil 结构口径时，混进了一个英文副词残片，正确读法是中文的"起初"；
第三处在 §11 群环那一句，我原先把一个单字母自定义域宏写进了记号，随后已按 §0 的记号纪律
改成标准写法，于是那句括号注记与主句有了重复，读时可以把括号里那半句当作冗余删去理解。
这三处都不影响论证内容，也不涉及被禁的连接短语与停顿号。

再记一条流程上的自报事项：本稿在写作过程中，风格禁令清单里的三个连接短语残片
（一个属于"反向递进"类、一个属于"归结说明"类、一个属于"对比让步"类）
以及两处只有原 preamble 才认得的记号残片，是在落盘之后用最小锚点就地替换成合规写法的，
每次替换只动那一个短语或那一个记号，没有删除、移动或重排任何段落，小节编号顺序也未改动。
我在此把它们列出来，是为了让后续扫描能对着复量结果，不靠我的自述。

内容层面我要补一条自我修正：§5 里我起初把"$b$ 的存在"当作命题最难的部分，
读完后已在正文改判为"$b$ 与整条特征结构的相容性才是难点"，
那个初判留在句子中以保留思考痕迹，读者按 §6 的结论理解即可。

## §15 台账（符号、数值与依赖一览）

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $p>n$ | 让 $n$ 与 $n!$ 同时可逆的特征下界 | build/sections/conventions.tex:263-297 | §12 的 H1--H4 核验与 §10 判别 | 幂零判别与增强摘除同时失去假设 |
| $\ell\ne p$ | 系数与底特征分离 | build/sections/introduction.tex:37 | §12 里 $R$ 上 $\ell$ 可逆 | nearby cycles 的形式机制不再可用 |
| $g(X_0)\ge 2$ | 亏格下界 | build/sections/introduction.tex:39-40 | §5 谱分量为单点形式多圆盘 | skyscraper 识别论证失效 |
| $d_\lambda=\langle 2\rho_G,\lambda\rangle$ | 偶数，因余特征标格等于余根格 | build/sections/conventions.tex:51-58 | §3 归一 $E[d_\lambda](d_\lambda/2)$ | 出现半整数扭曲，Weil 标量无定义 |
| $q^{i/2}$ | 第 $i$ 次上同调上的 Frobenius 标量 | build/sections/conventions.tex:140-157 | §3 归一化验证与 §4 比较 | 卷积与张量比较不再与 Frobenius 交换 |
| $H^{2j}$ 标量 $q^{j}$，奇次为 $0$ | Bott--Samelson 层层 $\mathbb P^1$-丛 | build/sections/conventions.tex:140-144 | §3 纯性推导 | 分解定理那一侧的商子对象论证断链 |
| $Z(\mathrm{PGL}_n)=1$ | 中心阶等于 $1$ | build/sections/conventions.tex:110-115 | §4 张量比较唯一性与 §6 刚性 | 特征结构相差一个中心标量 |
| $\operatorname{Aut}(\tau)=1$ | 稠密给出中心化子平凡 | build/sections/unramified.tex:79-81 | §5 中 $H^{-1}$ 与 $H^2$ 消失 | 谱分量不再光滑单点 |
| $d=\dim_E H^1(C,\operatorname{ad}(\tau))$ | 形式多圆盘维数 | build/sections/unramified.tex:95-100 | §5 局部环上的点对象判别 | 判别引理没有适用对象 |
| $r$，$f^{*}D_\tau\simeq D_\tau[r]$ | 待定整数，终被钉为 $0$ | build/sections/unramified.tex:254-287 | §5 消 shift | 等变同构 $b$ 无从取得 |
| $S_m=\{j:\mathcal H^{j}(D_\tau\lvert_{\mathcal U_m})\ne 0\}$ | 有限非空整数集 | build/sections/unramified.tex:281-287 | §5 由 $S_m=S_m-r$ 得 $r=0$ | 只能改诉诸全局振幅界 |
| $H^2(X_0,T_{X_0}(-x_0))=0$ | 尖点提升无阻 | build/sections/parameters.tex:39-41 | §7 选 $(\mathcal X,\mathfrak x)/R_0$ | 算术塔没有承载曲线 |
| $R_0=W(\mathbb F_q)$ | 保定义域的 Witt 向量环 | build/sections/parameters.tex:18-22 | §7 提升做在 $R_0$ 上 | $\varphi$ 的定义域丢失 |
| $d_r$ | $\ell$ 的幂，$d_r\mid d_{r+1}$ | build/sections/parameters.tex:149-156 | §7 root stack 上延拓 torsor | Kummer 根杀不死 tame 惯性 |
| 惯性中 $a=p$ 因子 | 平凡作用 | build/sections/parameters.tex:210-212 | §7 边界形状 $\exp(t_\ell(\gamma)N_1)$ | 温和假设破，§8 的 $e$ 无从定义 |
| $\operatorname{Ad}(A)N_1=qN_1$ | 缩放率等于 $q$ | build/sections/parameters.tex:85-87 | §8 共轭子引理的 Jordan 谱分析 | 找不到与 $A$ 交换的共轭子 |
| $a_0q^{i}$，$0\le i<n$ | 一维商上互异特征值 | build/sections/parameters.tex:276-281 | §8 对角共特征标 $c(z)v_i=z^{i}v_i$ | 缩放 $N_1$ 的共特征标不存在 |
| $e\equiv -1\pmod{\ell^{N}}$ | $N$ 充分高的同余条件 | build/sections/parameters.tex:289-292 | §8 $P=c(-1/e)\in J$ | 共轭子掉出紧致开子群，$\tau$ 不紧致 |
| $e>1$，$(e,\ell)=1$ | Kummer 覆盖次数 | build/sections/parameters.tex:300-312 | §8 $w^{e}=t$ 全分歧 | $C_2$ 不几何连通，$x_2$ 不再 $D$-有理 |
| $g(C_2)\ge 2$ | Riemann--Hurwitz 下界 | build/sections/parameters.tex:311-312 | §9 generic 亏格 $g(C_1)+g(C_2)$ | 谱分量重新出现无穷小自同构 |
| $\zeta\mapsto\zeta^{e}$ | 剩余 gerbe 上的幂映射 | build/sections/parameters.tex:334-338 | §8 与 §9 两支框对应 | 两侧等变值不再同为 $A$ |
| $h^{*}x_1=e\,x_2$ | 除子拉回重数 | build/sections/parameters.tex:331-333 | §9 node 图无 unit 扭曲 | 胶合带常数因子，$P_r$ 交织失败 |
| $\operatorname{Ad}(P)N_1=-N_1/e$ | 缩放率 $-1/e$ | build/sections/parameters.tex:261-264 | §9 $P_r u_{1,r}(\zeta)^{-e}P_r^{-1}=u_{1,r}(\zeta)$ | 结点两侧作用无法交织 |
| $Q_r=J/J_r$ | 有限商，$J_r$ 在 $1$ 处共尾 | build/sections/parameters.tex:320-324 | §9 胶合与 $\varprojlim_r Q_r=J$ | 极限参数不再取值于紧致群 |
| $\mathcal T_{r,0}\leadsto\mathcal T_r$ | proper henselian invariance 提升 | build/sections/parameters.tex:491-493 | §9 由特殊纤维到整族 | 单调塔没有 generic 纤维 |
| $h^0(\mathcal Z_{\bar\eta},\mathcal O)=1$ | 上半连续给 $\le 1$，平坦给 $\ge 1$ | build/sections/parameters.tex:126-134 | §7 与 §9 的分量轨道比较 | 稠密性的包含链断掉 |
| $\operatorname{im}(H_1\to Q_r)\subset\operatorname{im}(H_\tau\to Q_r)$ | 闭子群包含 | build/sections/parameters.tex:512-521 | §9 $\tau$ 的 Zariski 稠密 | §5 引擎的稠密前提失效 |
| $0<\langle\alpha,\lambda\rangle<b_*$ | 每个正根的严格不等式组 | build/sections/parameters.tex:413-421 | §10 中心化子恰为 $T$ 且截取为开 | 规定 node 类型的开栈不再开 |
| $\mathcal B_s\simeq[\mathcal A_1^{+}\times\mathcal A_2^{+}/T]$ | 商由同时对角 $T$ 给出 | build/sections/nodal.tex:62-66 | §10 限制到第一支 | 非零 stalk 无法在支上定位 |
| $u^{j}f(u^{b_*})\mapsto f(a)$，$u^{b_*-j}g(u^{b_*})\mapsto ag(a)$ | 正负根坐标的幂次交换 | build/sections/nodal.tex:78-83 | §10 换框群 $g(0)\in B$ | 第二支不再给出 $B^{-}$ |
| $\Psi$（不含惯性不变量） | 正合且保局部有界可构造 | build/sections/conventions.tex:199-201 | §10 与 §12 两次特殊化 | 取不变量会强制统一有限扩张 |
| $r=n-1$ | 忘掉 enhancement 的 torsor 相对维 | build/sections/nodal.tex:355-357 | §11 中 $H_c^{2r}(T,-)$ 的边缘项 | 谱序列非零结论失去支撑 |
| $W_\Gamma(-r)\ne 0$ | 增广理想幂零故余不变量非零 | build/sections/nodal.tex:401-407 | §11 $q_{!}Q\ne 0$ | 摘掉 enhancement 后可能得到零层 |
| $(\dim V)\,\mathrm{id}_{Q}$ | 边界单调在 $V$ 上的迹 | build/sections/nodal.tex:381-387 | §11 特征标分离 Weyl 轨道 | enhancement 单调的单值性不成立 |
| ${}^pH^{j}(\mathsf H_{I}(F)[d])\simeq\mathsf H_{I}({}^pH^{j}F)[d]$ | adic 截断比较同构 | build/sections/nodal.tex:322-327 | §11 截断保持等变 | perverse 上同调丢掉特征结构 |
| $d=\lvert I\rvert$ 与 $[\lvert J\rvert-\lvert I\rvert]$ | 腿空间维数与碰撞移位 | build/sections/nodal.tex:341-346 | §11 融合图整体搬运 | 碰撞对角上的相容性断链 |
| $2^{\aleph_0}$ | 两域对 $\mathbb Q$ 的超越度 | build/sections/nodal.tex:311-315 | §11 借 Betti 论证的抽象同构 | companion 稿的几何输入调不到 |
| $m\ge 1$ | $\varphi^{m}$ 逐点固定 $D'/D$ | build/sections/nodal.tex:261-269 | §12 落到 $\mathbb F_{q^m}$ | 见证点不等变，$M_0$ 造不出 |
| $\mathcal V\otimes\mathcal L^{m}$ 全局生成且 $H^1=0$ | 随 $m$ 增大覆盖丛栈的开集 | build/sections/unramified.tex:262-275 | §5 的 $f$-不变有界开 | 消 shift 没有载体 |
| $q^{m}$-Frobenius | 特殊纤维上生成元的作用 | build/sections/final.tex:71-78 | §12 算术特征值对齐 | 主定理里的 $\rho_m$ 对不上号 |
| $\kappa(X,Y)=\operatorname{tr}(XY)$ | 中心限制型对角系数 $n_i$ | build/sections/conventions.tex:269-278 | §12 的 H1 | 非退化失败，幂零判别假设缺 |
| $(1,\ldots,1)$ 的长度平方 $=n$ | 正交补论证里的关键数值 | build/sections/conventions.tex:274-278 | §12 Levi 中心非退化 | 块 Levi 上的假设不成立 |
| $Q={}^pH^{j}(F_1^{+})\ne 0$ | 存在使截断非零的 $j$ | build/sections/nodal.tex:319-320 | §11 后半程全部步骤 | 摘 enhancement 没有起点 |
| $\lvert \Lambda_{\mathrm{par}}\rvert$ 的 chart wise 包含 | 奇异支撑锥条件 | build/sections/final.tex:105-121 | §12 最后的支撑断言 | 主定理的支撑结论缺失 |

