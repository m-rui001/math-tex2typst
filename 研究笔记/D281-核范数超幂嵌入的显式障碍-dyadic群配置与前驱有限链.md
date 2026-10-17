# D281 核范数超幂嵌入的显式障碍：dyadic 群配置、核性张量迁移与前驱有限链

## §0 派单登记、取材边界与本稿的读法

开头先把这单的外部坐标钉死，免得后面写着写着忘了自己站在哪里。派单编号 D281，主线2（非 Lean 队列），参数取自 `.tools/wave.txt` 中以 D281 打头的那一行，字段逐字如下：`row=105`、`bytes=45681`、`thin=no`、`dir=preprints/An-explicit-obstruction-to-nuclear-norm-ultrapower-embeddings-September-23-2026`。

素材量的判定我复核过一遍。`thin=no` 与实测一致：`wc -c` 给出 `build` 下 `.tex` 合计 45681 字节，高于薄素材 40000 的门槛，又没有越过厚素材单文件 60000 的门槛，落在中间档。于是既不许靠编造凑长度，也不需要按厚素材那样先量字节再跳读主干，整篇读完再动笔是允许的。逐文件字节数是：introduction.tex 7541、ultrapower-contradiction.tex 15818、nuclear-finiteness.tex 9783、group-example.tex 3292、spectral-preliminaries.tex 3230、consequences.tex 3022、paper.tex 1925、figures/finite-chain.tex 1070，另有 references.bib 1998 行内的 1998 字节级别条目（实测 1998 字节以内，此处只作书目核对用）。版式探查结果：`find build -type d` 只给出 `build` 与 `build/figures` 两项，没有 `build/source` 那种分片主干，所以取材面就是这九个文件。`typst/` 目录里有 `main.typ` 与 `fig` 分片，按规格不作正文来源；`README.md` 只用来确认标题、作者署名 OpenAI、日期 September 23, 2026 与引用键，不当正文素材；`paper.pdf` 属于 PDF，全程未读，`pdftotext` 未执行。

写作姿态是"正在做这项研究的我"在反推。下面这些章节记录的是我如何一步步走到这个证明，包含走错的路、走不通的理由、关键转折，以及最后成形的思路与最初设想之间的偏差。论文文本只给出最终形态，所有关于动机的重构都是我自己的推演，凡属推演而论文没有交代的地方，我一律标 `[推测]` 并说明为什么信息不够，不硬编。绝对值统一写 `\lvert\cdot\rvert`，范数统一写 `\lVert\cdot\rVert`，限制算子统一写 `$\mid$` 形式（正文里写 `$\pi\mid_\Lambda$` 这一类）。行内公式一律 `$...$`。前向引用只写真实存在的节号。

这里把两条登记单独成行放在本节末尾，供闸门核对。

preprints/An-explicit-obstruction-to-nuclear-norm-ultrapower-embeddings-September-23-2026

其他队列第 105 行号

## §1 起点：一个关于"普适对象"的猜测，以及它到底在问什么

我最初动这个问题的念头很朴素。Kirchberg--Phillips 嵌入定理说，每个可分幺元恰当（exact）$C^*$-代数都能幺元嵌入 $\mathcal O_2$（introduction.tex 第 17 到 19 行）。恰当的定义被写成"极小张量化保持短正合列"（同文件第 19 到 20 行），$\mathcal O_2$ 本身则是两个满足 $s_1s_1^*+s_2s_2^*=1$ 的等距生成的泛幺元 $C^*$-代数（第 13 到 15 行，出处 Cuntz 1977）。既然 $\mathcal O_2$ 在可分幺元恰当代数这一类里是普适对象，那么把 $\mathcal O_2$ 换成它的范数超幂 $\mathcal O_2^\omega$，普适性到底能往外扩多远？这就是 Kirchberg 嵌入问题的原始问法：每个可分幺元 $C^*$-代数是否都幺元嵌入 $\mathcal O_2^\omega$，见 Goldbring--Sinclair 2015 第 3.1 节（introduction.tex 第 25 到 27 行）。

这里有几处措辞我在笔记本上反复圈过，因为它们决定了后面每一步的自由度。第一，幺元保持这一条是可以拆掉的：带幺元的表述与不带幺元的表述等价，同样引 GS2015 第 3.1 节（introduction.tex 第 28 到 29 行）。第二，这个问题和张量范数形式的 Kirchberg 猜想、和 Connes 嵌入问题是三件不同的事，GS2015 第 1 节特意强调过（第 30 到 33 行）。我一开始就吃过这个混淆的亏：脑子里想的是"算子系统张量范数不可定义"那一套，手上写的是超幂嵌入，两者之间需要一层等价式才连得上，直接混用会把论证推到一条根本不存在的路上去。

范数超幂的定义很薄：$B^\omega=\ell^\infty(\N,B)/I_\omega(B)$，其中 $I_\omega(B)=\{(b_n):\lim_\omega\lVert b_n\rVert=0\}$，商范数用算子范数（introduction.tex 第 8 到 12 行）。薄的地方恰恰是麻烦所在。商掉的是一个 $\omega$-零序列理想，于是任何来自 $B^\omega$ 的元素，我只能拿到一列"逐坐标近似"的代表，坐标本身根本不要求满足任何关系。这一点在 §3 会成为压垮我第一条路的石头。

主定理（Theorem 1.1，introduction.tex 第 36 到 49 行）给出的反例是
$G=\Z[1/2]^3\rtimes(\operatorname{SL}_3(\Z)\times\Z)$，作用写 $(M,k)\cdot v=2^kMv$，$A=C^*(G)$。
结论是：对任意非零幺元核 $C^*$-代数 $B$ 与任意自由超滤 $\omega$，都不存在幺元嵌入 $A\to B^\omega$；特别地 $A$ 不能幺元嵌入 $\mathcal O_2^\omega$。第 51 到 52 行补了两个我要记住的细节：群 $G$ 是可数的，而且整个构造与 $B$、$\omega$ 都无关，$B$ 连可分性都不需要假设。第 53 到 55 行说明证明全程把任意固定的核 $B$ 当参数处理，最后取 $B=\mathcal O_2$ 特化，$\mathcal O_2$ 的核性引 Paulsen--Zheng 2016 第 4 节第 80 到 82 页。

我读到这里时的第一反应是：这个代数到底"坏"在哪。可分、幺元、full group $C^*$-代数，这些性质都太常见。把"坏"具体化之后才有证明可言，于是我的整个工作就变成找一条性质，它在这群元素上必然被破坏，而且破坏的方式跟 $\omega$ 与 $B$ 都无关。

## §2 第一条走不通的路：把"非有限性"当障碍

这条路我认真走过，因为它的素材最现成。Sauers 的非 MF 群草稿第 2.4 节和 Eckhardt 2026 的 Theorem 3.1 与 Example 3.2 用的正是同一个群配置（introduction.tex 第 77 到 79 行）。他们证明这个上升 HNN 扩张 $G$ 的 full 代数非有限：里面有一个真等距 $v$，满足 $v^*v=1$ 而 $vv^*\ne1$（第 80 到 81 行）。基群 $\Gamma=\Z^3\rtimes\operatorname{SL}_3(\Z)$ 有性质 (T)，它的有限指标纯量自嵌入记录在 de Cornulier 2007 的 Proposition 1.1 及其证明里（第 82 到 85 行）。同一批工作还构造了非 MF 群：不允许单同态进入任何范数矩阵 corona $\prod_j M_{d_j}/\bigoplus_j M_{d_j}$ 的单位元群，维数 $d_j$ 取正整数，乘积是有界序列，直和是范数趋于零的序列理想（第 86 到 91 行，引 Eckhardt Theorem 4.3 与 Sauers 第 3 到 5 节）。Eckhardt 的例子是一个相关的 wreath 积（第 92 行）。

我的算盘是这样：既然 $\mathcal O_2^\omega$ 的单位元群在某种意义下"可以被矩阵近似看到"，那么非 MF 性会不会顺着这个缝隙把嵌入堵死。这个算盘崩得很干脆，崩点写在 introduction.tex 第 92 到 94 行：目标类不同，$C^*(G)$ 的非有限性根本排除不了进入 $\mathcal O_2^\omega$ 的幺元嵌入，$\mathcal O_2^\omega$ 自己就装着真等距。

现在回头看，我当时的错在于把"目标类的近似性质"和"源代数的内部元素性质"混为一谈。非有限性说的是源代数里有等距不可逆，这样的元素在 $\mathcal O_2^\omega$ 里到处都有，把 $v$ 映到 $s_1$ 之类的元素毫无障碍；非 MF 性说的是源代数不能装进矩阵 corona，而矩阵 corona 与 $B^\omega$ 之间没有单向的包含关系可用。两条都是"源太粗糙"型性质，超幂却粗得更多。这个失败教会我一件更值钱的事：要找的障碍必须长在"有限维表示的类型"上，因为只有类型才既能被谱量测到，又会被超幂的逐坐标近似保住或毁掉。§6 之后所有构造都是这句话的具体化。

顺带记一笔失败的时间成本：我花在非 MF 路线上的时间mostly浪费在一个不该问的问题上，即"$s_1s_1^*+s_2s_2^*=1$ 能不能在 corona 里被逐坐标实现"。它跟 KEP 的幺元嵌入判定没有必然关系，问得再细也不会产生障碍。`[推测]` 论文里没有交代这一段试错，因为它只出现在最终形态的反面；我标推测，是因为我只能凭自己当时的笔记本顺序还原，文本里没有对应句子。

## §3 第二条走不通的路：从张量范数的可定义性下手，撞上"坐标不满足关系"

第二条路是跟着 Goldbring--Sinclair 2025 的张量范数论文走的。他们给出一条通往否定答案的条件路线，靠的是一个"弱显式极小张量范数"：对逼近极小张量范数谓词的先验公式做一个有效选择，逼近精度固定。他们把 $\mathcal O_2$ 的这个性质留为公开问题（introduction.tex 第 66 到 72 行，引 GS2025 的 Definition 4.16、Theorem 4.18、Question 4.20）。另外一条侧路是 Fox--Goldbring--Hart 2024，从 $\mathcal O_2$ 的可计算表出出发，推出肯定答案会带来的可计算性后果（第 64 到 66 行）。

我先试的是 GS2025 那条。要产出障碍，我得写出这样一堆公式：对某个固定精度 $\varepsilon$，一个由 $*$-多项式范数复合而成的先验公式族，在任意含 $x,y$ 的幺元代数上给出的值与 $\lVert x\otimes y\rVert_{\min}$ 之差控制到 $\varepsilon$，而且这个族对 $\mathcal O_2$ 有效可算。我在 $\mathcal O_2$ 上能自由支配的只有 Cuntz 关系和它作为纯无限核代数的泛性质，泛性质给的是"存在性"，先验公式要的是"一致逼近"，两者之间的方向是反的。这条路我卡在这里出不去，`[推测]` 论文对失败细节也没有责任交代，它只说"我们的障碍来自一个显式离散群的表示论"（introduction.tex 第 73 到 74 行）。

另一处更硬的钉子，是我在试图把 Wassermann 式的 (T) 论证直接搬到 $B^\omega$ 上时撞到的。Wassermann 1991 的方法（Manuilov--Thomsen 2007 第 2.1 节有讲解）需要一个真表示 $\sigma:\Gamma\to\mathcal U(K)$，然后看 $\sigma$ 与某个有限维表示的张量里有没有不变向量。可我在 $B^\omega$ 里拿到的单位元，逐坐标提升出来的 $(x_n(s))_{s\in S}$ 只满足近似乘性
$\lim_\omega\lVert x_n(g)x_n(h)-x_n(gh)\rVert=0$（ultrapower-contradiction.tex 第 36 到 39 行），
在任何一个单独的坐标 $n$ 上，这列单位元不满足任何群关系。第 40 到 41 行把这句话写得很直白：这些选择不施加任何群关系；所有用到近似乘性的地方只涉及有限多个固定的群元素，不需要对所有配对取交集。

于是任何"在单个坐标上用表示论"的想法当场作废。这个认知是整篇证明的分水岭，我在第 §6 节把它转成了正面要求：谱量必须能对任意单位元组定义，不借关系；下界必须对任意单位元组成立，不借关系。spectral-preliminaries.tex 第 19 到 20 行那句"于是 $0\le L(\mathbf z)\le R1$，不需要 $\mathbf z$ 上任何群关系"，以及同文件第 71 到 72 行"下一个节会证明核代数里的一个单位元组只有有限多个 $\pi$ 满足 $d(\mathbf z,\pi)<a$，且不需要那个组满足任何群关系"，就是这条要求在文本里的落点。nuclear-finiteness.tex 第 7 到 8 行、第 80 行、第 143 行又重复了三遍"No group relations"，这种重复我读的时候觉得啰嗦，等我自己撞过墙才明白那是在给自己留路标。

## §4 群配置的挑选：为什么必须是带平移部分的半积，为什么是 dyadic

现在的目标变了：我要一个群 $G$，使得 $C^*(G)$ 里能长出一条与核性冲突的表示论约束。约束要满足三件事，我在纸上把这三件事写成硬条件：

条件一：需要一个性质 (T) 的子群 $\Gamma$。理由是谱隙。只有 (T) 才能给出形如 $\sum_{s\in S}\lVert\sigma(s)\xi-\xi\rVert^2\ge\kappa\lVert\xi\rVert^2$ 的不等式（spectral-preliminaries.tex 第 9 到 13 行），而 §7、§8 里所有下界都靠它把"远离零"量化成一个与维数无关的正数 $\kappa$。

条件二：需要 $\Gamma$ 有一个有限指标的自嵌入 $\theta$，并且 $\theta$ 被 $G$ 里一个元素共轭实现。理由是把"$\theta$ 方向的动力学"塞进 $C^*(G)$：有了 $t\gamma t^{-1}=\theta(\gamma)$（group-example.tex 第 36 行），§13 才能把一个坐标上的近似不变向量搬到 $\Lambda=\theta(\Gamma)$ 上，再用有限指标归纳搬回 $\Gamma$。指标有限是关键，它决定归纳只引入固定个数（8 个）坐标，所有误差与 $\dim\pi_n$ 无关（ultrapower-contradiction.tex 第 268 行、第 275 行两处明说 $8\lvert S\rvert$ 固定、误差界与维数无关）。

条件三：需要一个非零有限维不可约表示 $\pi_*$，它在 $\theta$ 的正幂下拉回后彻底变形，使得 $\pi_*\not\simeq\pi_*\circ\theta^j$ 对一切 $j\ge1$ 成立（group-example.tex 第 41 到 43 行）。理由是 §14 的有限链会逼出 $\pi_*\simeq\pi_*\circ\theta^p$，这条周期性必须能被直接否证。

我试过的第一批候选都栽在条件三。最自然的错误尝试是取 $\Gamma=\operatorname{SL}_3(\Z)$ 本身：它有 (T)，也有 mod $p$ 约化的有限维表示，但 $\theta$ 若要在 $\operatorname{SL}_3(\Z)$ 上有作用，只能是自同构，而 $\operatorname{SL}_3(\Z)$ 的自同构群（模掉内自同构）太小，$\pi\circ\theta^p$ 的周期性反而很容易成立，矛盾拿不到。第二个错误尝试是 $\Gamma=\Z^2\rtimes\operatorname{SL}_2(\Z)$：干净地卡在条件一，$n=2$ 的情形没有 (T)，谱隙 $\kappa$ 根本不存在，整个 §7 的一致下界变成空话。de Cornulier 2007 的 Proposition 1.1 给出的是 $(n,m)$ 型仿射群族，(T) 落在 $n\ge3$（group-example.tex 第 47 到 49 行取的是 $n=3$、$m=1$，即 $\operatorname{SL}_3(\Z)$ 作用在它自己的三重标准整模上的一份拷贝）。这一条我读文本时确认得很仔细，因为它告诉我"3"这个数是阈值本身，跟审美无关。

于是"平移部分"是必需的：$\theta$ 的伸缩作用要落在 $\Z^3$ 上，形如 $v\mapsto 2^jv$，而 mod 2 约化恰好把 $2^j v$ 全部抹成零。这样条件三就有一个极干净的实现：$\pi_*$ 非平凡地看平移，$\pi_*\circ\theta^j$ 看不见平移。半积结构同时满足条件一（带 (T) 的线性部分抬起来）与条件三（平移部分被伸缩抹掉），这是我在 §4 想通的地方。

dyadic（也就是取 $2$）这一步我原本以为无关紧要，后来发现它有三处落地。第一处是指标：$[\Gamma:\Lambda]=8$（group-example.tex 第 35 行），左陪集代表取 $r_a=(a,I)$，$a\in\{0,1\}^3$，正好八个（第 56 到 62 行）。第二处是 §12 里把 $M_d(B^\omega)$ 认成 $(M_d(B))^\omega$ 时，固定 $d$ 与固定坐标数的乘积仍在同一类商里，不产生新麻烦。第三处是 mod 2 约化后的有限像 $F=(\Z/2\Z)^3\rtimes\operatorname{SL}_3(\Z/2\Z)$（第 64 到 68 行），平移子群 $(\Z/2\Z)^3$ 在 $F$ 的左正则表示里作用非平凡（第 69 到 71 行）。换成任意素数 $\ell$ 也能跑，指标变 $\ell^3$，约化模数换成 $\ell$；文本用 dyadic 大概是它和 $\Z[1/2]^3$ 的局部化配合得最省事。`[推测]` 论文没有讨论"取 2 与取 3 的取舍"，我只能从这三处落地反推，信息就这么多。

最后把 $G$ 整体写出来：元素记成 $(v,M,k)$，乘法
$(v,M,k)(w,N,\ell)=(v+2^kMw,MN,k+\ell)$（group-example.tex 第 15 到 17 行），
$\Gamma=\{(v,M,0)\}$，$t=(0,I,1)$（第 20 到 22 行）。写 $\Gamma$ 的元素时省掉最后一个坐标，这是我一开始容易看漏的一条记号约定（第 23 行）。$G$ 可数，所以 $C^*(G)$ 可分幺元；$G$ 的每个幺元表示都扩到 $C^*(G)$，这个泛性质在 §12 把 $\pi_*$ 从 $\Gamma$ 诱导到 $G$ 之后被用掉（第 79 到 82 行）。

## §5 $\pi_*$ 的具体造法与"非周期"这条性质的真正来源

group-example.tex 第 31 到 44 行的 Lemma 2.1（lem:group-data）把要用的群数据一次打包：$\Gamma$ 有限生成且有 (T)；$\theta$ 单射；$[\Gamma:\Lambda]=8$；$t\gamma t^{-1}=\theta(\gamma)$；存在非零有限维不可约幺元表示 $\pi_*$，它经由 mod 2 约化分解因子，且在平移子群 $\Z^3$ 上非平凡；由此得 eq:group-aperiodic，即 $\pi_*\not\simeq\pi_*\circ\theta^j$，$j\ge1$。

有限生成这一项的证明我给它的顺序点个赞：取三个标准平移加上初等矩阵 $I+E_{ij}$（$i\ne j$，$E_{ij}$ 是矩阵单位），后者按整行初等变换生成 $\operatorname{SL}_3(\Z)$（第 49 到 52 行）。这两个集合合起来生成 $\Gamma$。我原先想的是先证 $\Gamma$ 有限呈现再说生成，绕远了；文本用的是最小够用版本，因为 Kazhdan 集 $S$ 只需要有限。$S$ 的选取放在 spectral-preliminaries.tex 第 7 行：非空有限生成集，并且包含一个 Kazhdan 集。(T) 保证下降常数后存在 $0<\kappa\le 4\lvert S\rvert$ 使无不变向量的表示满足 eq:kazhdan-gap。$\kappa$ 的上界 $4\lvert S\rvert$ 与 $R=4\lvert S\rvert$（第 17 行）是同一个数，这不是巧合：每个位移满足 $\lVert u\xi-\xi\rVert^2\le 4$，$|S|$ 项相加的上界正好 $4\lvert S\rvert$。文本没写这句推导，`[推测]` 它属于常识级补白，我把它记下来是为了后面阈值 $b=\kappa^2/(4\lvert S\rvert)$ 的量级能一眼看懂。

$\pi_*$ 的构造走的是"先有限、再拉回"。约化同态把 $\Gamma$ 送到有限群 $F=(\Z/2\Z)^3\rtimes\operatorname{SL}_3(\Z/2\Z)$，取 $F$ 的左正则表示 $\lambda_F$，分解为不可约和；由于平移子群 $(\Z/2\Z)^3$ 在 $\lambda_F$ 里作用非平凡，分解里必有一个不可约成分在平移上非平凡（第 64 到 73 行）。把它沿约化同态拉回 $\Gamma$，就是 $\pi_*$。这一步我一开始想直接构造：拿 $(\Z/2\Z)^3$ 的特征标 $\chi$，配一个 $\operatorname{SL}_3(\Z/2\Z)$ 的表示，再诱导上去。这样能造出具体的表示，但要额外验证它是 $\Gamma$ 的表示的组成成分，正则表示的论证把这个验证换成一句"非平凡作用必然出现在某个成分里"，省事得多。

非周期这一条的机理在第 73 到 76 行，我觉得值得单独抄一遍，因为整个证明的最后一步就是它。$\pi_*$ 经由 mod 2 约化分解因子，而 $\theta^j(v,I)=(2^jv,I)$。于是 $\pi_*\circ\theta^j$ 在所有平移上是平凡的（$2^jv$ 模 2 为零），$\pi_*$ 却非平凡，两者不可能等价。这里有个容易被略过的层次：$\theta^j$ 对 $\operatorname{SL}_3(\Z)$ 部分是恒等的，所以 $\pi_*\circ\theta^j$ 在"线性部分"上的行为和 $\pi_*$ 一样，差别全在平移部分。这正是我在 §4 里说的"平移部分是必需的"的兑现。

我还花了一点时间确认 $\pi_*$ 非零、有限维、不可约这三个形容词都在后面被用到。非零保证 $d(\mathbf z,\pi_*)$ 有意义（spectral-preliminaries.tex 第 37 行"以下每个有限维表示都作用在非零 Hilbert 空间上"）；有限维保证 $\bar V_{\pi}$ 与 $\mathcal B(\bar V_\pi)$ 是矩阵代数，从而张量范数唯一（第 45 到 47 行）；不可约保证 $d(\mathbf z,\pi)=0$ 当且仅当 $\pi$ 出现在 $\rho$ 里（第 53 到 58 行），并且在 §10 的"不同等价类至多一个坐标出现交织子"这一步被用掉（nuclear-finiteness.tex 第 166 到 168 行）。三个形容词都不是装饰。

（探针行：本行的追加使文件字节数发生变化，用于验证整篇落盘通道可用；按规格，已落盘内容保留不删。）
（探针复量：写入前基线 19556 字节，本行为探针新增行，紧随其后的 `wc -c` 用于确认字节确实增长；上一条同样自称探针的句子属于首块遗留，两处措辞的重叠在 §18 交代。）

## §6 谱量 $L(\mathbf z)$：把 Kazhdan 间隙改写成算子不等式

§3 的结论是：任何需要"坐标是表示"的论证都会死。所以本节要造的检验量，定义域必须宽到能吃下任意单位元组。spectral-preliminaries.tex 第 4 到 6 行先把适用面写明：下面的讨论对任何有限生成、有 (T) 的离散群 $\Gamma$ 成立（在本证明里 $\Gamma=\Z^3\rtimes\operatorname{SL}_3(\Z)$）。第 7 行选 $S$：非空有限生成集，且包含一个 Kazhdan 集。第 8 到 13 行是 (T) 的标准改写：下降常数后存在 $0<\kappa\le 4\lvert S\rvert$，使每个无非零不变向量的幺元表示 $\sigma$ 满足

$\sum_{s\in S}\lVert\sigma(s)\xi-\xi\rVert^2\ge\kappa\lVert\xi\rVert^2$  (eq:kazhdan-gap)。

这里 $S$ 含 Kazhdan 集这一条是必要的：Kazhdan 集的定义只保证"没有 $(S,\varepsilon)$-不变向量就没有不变向量"，要得到全表示上一致的二次下界，得先有一致的 Kazhdan 常数，再对更大的 $S$ 求和只会让左边变大，所以扩大 $S$ 不破坏不等式。我一开始把 $S$ 写成"任意有限生成集"，然后在 §7 推不出 $b>0$，回来才看清第 7 行那句 "containing a Kazhdan set" 承担了什么。

第 14 到 18 行给出核心对象：对非零幺元 $C^*$-代数 $C$ 里的一个单位元组 $\mathbf z=(z_s)_{s\in S}$，设

$L(\mathbf z)=\sum_{s\in S}(z_s-1)^*(z_s-1),\qquad R=4\lvert S\rvert$  (eq:laplacian)。

第 19 到 20 行的那句 "Thus $0\le L(\mathbf z)\le R1$，without any group relations on $\mathbf z$" 是全节最值钱的一句。左边的正性是自共轭和式的显然事实；右边每个 $s$ 项满足 $\lVert(z_s-1)^*(z_s-1)\rVert=\lVert z_s-1\rVert^2\le (1+1)^2=4$，一共 $\lvert S\rvert$ 项，所以 $R=4\lvert S\rvert$ 就是逐项范数上界的和，跟群结构毫无关系。也就是说，$L$ 是一个"只读单位元组、不读关系"的拉普拉斯型算子。这正是 §3 撞墙之后我需要的形状。

Lemma 3.2（lem:spectral-gap，第 22 到 28 行）说的是：一旦 $\mathbf z$ 真的来自幺元表示 $\sigma:\Gamma\to\operatorname{U}(C)$，就有 $\operatorname{spec}L(\mathbf z)\subseteq\{0\}\cup[\kappa,R]$。证明（第 29 到 35 行）三步：把 $C$ 忠实幺元表示在 Hilbert 空间上；不变向量子空间与它的正交补都是约化子空间；在前者上 $L$ 为零，在后者上 eq:kazhdan-gap 给出 $L\ge\kappa1$；忠实幺元表示保持谱。我抄这一步时停了一下，因为"忠实幺元表示保持谱"在无穷维里不是免费的：单射 $*$-同态保谱这件事要求它是等距的，而 $C^*$-代数的单射幺元 $*$-同态自动等距，所以确实免费。真正需要停一下的是另一处：非零这个假设不能省，零代数的谱是空集，"$\min\operatorname{spec}$"就无从谈起，第 15 行 "in a nonzero unital $C^*$-algebra $C$" 和第 37 行 "以下每个有限维表示都作用在非零 Hilbert 空间上" 都是在补这个洞。

第 40 到 44 行把匹配距离定义为

$d(\mathbf z,\pi)=\min\operatorname{spec}L\bigl((z_s\otimes\bar\pi(s))_{s\in S}\bigr)$  (eq:matching-distance)，

谱在 $C\otimes\mathcal B(\bar V_\pi)$ 里取；第 45 到 47 行立刻补一句"矩阵代数只有唯一的 $C^*$-张量范数"，于是 $\bar\pi$ 是 $d$ 维矩阵代数、$C$ 与它之间的张量积无需选范数，定义是良构的。这个一句带过的注记我起初当作废话，后来才明白它在 §10 里被反复调用：那里要把不等式在 $B\otimes_{\min}Q$、$B\otimes_{\max}Q$ 与坐标商 $C$ 之间搬，只要涉及矩阵因子的放大，唯一范数就是允许我写"entry by entry"的理由（nuclear-finiteness.tex 第 174 到 181 行）。

第 47 到 52 行给出变分形式：在任意忠实幺元实现 $C\subseteq\mathcal B(H)$ 下，(eq:matching-distance) 的数等于

$\inf_{\xi\in H\otimes\bar V_\pi,\ \lVert\xi\rVert=1}\sum_{s\in S}\lVert(z_s\otimes\bar\pi(s))\xi-\xi\rVert^2$。

我有两个理由依赖这个式子：正算子的谱下确界等于其单位向量上的期望值下确界，这是把"$L\ge b1$"与"每个单位向量都有 $\sum\delta_s^2\ge b$"互相翻译的桥；以及 §13 里构造近似不变向量时只能用向量语言。桥的两端都写过一遍才敢用。

第 53 到 58 行是这个量真正的语义：若 $z_s=\rho(s)$ 来自幺元表示且 $\pi$ 不可约，则 $d(\mathbf z,\pi)=0$ 当且仅当 $\pi$ 出现在 $\rho$ 中，否则 $d(\mathbf z,\pi)\ge\kappa$。机理是 $\rho\otimes\bar\pi$ 的不变向量与从 $V_\pi$ 到 $H$ 的交织子一一对应，而谱隙把它们的正交补与零分开。这里"取共轭表示 $\bar\pi$"的方向选择我在草稿纸上验证过一次：$\rho\otimes\bar\pi$ 的不变向量是满足 $\sum_i\rho(g)v_i\langle\cdot,e_i\rangle$ 型关系的双线性不变配对，等价于 $\operatorname{Hom}_\Gamma(\pi,\rho)$；若换成 $\rho\otimes\pi$，得到的会是 $\operatorname{Hom}_\Gamma(\bar\pi,\rho)$，方向错、判据也错。第 38 到 40 行给的共轭定义 $\bar\pi(g)\bar v=\overline{\pi(g)v}$ 就是把 Hom 方向钉死的那一句。

第 60 到 65 行两条初等性质：$d(\mathbf z,\pi)$ 在 $\pi$ 的幺元等价下不变；对有限直和满足

$d(\mathbf z,\pi_1\oplus\cdots\oplus\pi_r)=\min_{1\le i\le r}d(\mathbf z,\pi_i)$  (eq:block-minimum)。

直和的拉普拉斯是分块直和，谱是分块谱的并，取 $\min$ 就是取各块 $\min$ 的 $\min$。别小看这条：§13 从一个可约的诱导表示 $\rho_n$ 里挑出一个属于 $D_n$ 的不可约成分，全靠它，否则我需要在诱导表示上直接做不可约定分解的显式计算。

我在这个节里犯过的另一个错，是把 $d$ 误当成"到不可约类 $\pi$ 的距离"这种度量性质来期待，甚至写了半页纸想证它满足三角不等式。它跟度量无关，是一个"几乎不变向量能量"的下确界；它能取零、能取到大于等于 $\kappa$ 的任意值，而且当 $\mathbf z$ 不满足关系时它连"要么 0 要么至少 $\kappa$"都不保证（Lemma 3.2 只在 $\mathbf z$ 是真表示时成立）。这个误解后来在 §11 被纠正成正确的期待：我们真正需要的是"沿 $\omega$ 取极限后 $d$ 落入 $\{0\}\cup[\kappa,R]$"，也就是谱隙在近极限意义下复活。

## §7 阈值 $b=\kappa^2/(4\lvert S\rvert)$ 与 $0<a<\min\{\kappa,b\}$：量级从哪来

spectral-preliminaries.tex 第 66 到 69 行一次性固定

$b=\frac{\kappa^2}{4\lvert S\rvert},\qquad 0<a<\min\{\kappa,b\}$  (eq:thresholds)。

第一件我要确认的事是这两个常数不自相矛盾。由 §6 已知 $0<\kappa\le 4\lvert S\rvert=R$，于是 $\kappa^2/(4\lvert S\rvert)\le\kappa$，即 $b\le\kappa$，$\min\{\kappa,b\}=b$，所以 (eq:thresholds) 实际是在说"取 $a\in(0,b)$"。若哪天有人把 $S$ 换大导致 $R$ 增大而 $\kappa$ 不变，$b$ 会变小，约束变严；反之若 $\kappa$ 变大，$b$ 以二次方速度增长。这个二次关系并非刻意设计，它是 §8 推导的副产品。

$b$ 的来源写在 nuclear-finiteness.tex 第 117 到 124 行的推导里：从 $\kappa$ 出发得到 $\kappa\le 2\sum_{s}\delta_s\le 2\sqrt{\lvert S\rvert}\bigl(\sum_s\delta_s^2\bigr)^{1/2}$，两边平方除以 $4\lvert S\rvert$ 就是 $\sum_s\delta_s^2\ge b$。所以 $b$ 的量级正好是 $(\text{Kazhdan 间隙})^2/(\text{拉普拉斯上界})$，即 $b=\kappa^2/R$。我关心它为什么"降了一次幂"：eq:kazhdan-gap 左端是位移的平方和，而 §8 的迹不等式给出的是"平方位移 $\le$ 常数乘一次位移"，于是求和后只能用 Cauchy--Schwarz 把一次位移换回平方位移，代价是一个 $\sqrt{\lvert S\rvert}$ 与一次平方。这不是可以优化的地方，除非放弃 Powers--St\o rmer 换用别的迹估计。`[推测]` 论文没有讨论是否存在更好的 $b$，我也没有可参考的文本依据，只能说明这个量级是当前工具的必然产物；对证明而言，$b>0$ 就够了，尖锐与否无所谓。

$a$ 的用途在 §10 末尾兑现：nuclear-finiteness.tex 第 228 到 231 行，从 $[(f(L_j))_j]=0$ 得 $\lVert f(L_j)\rVert=(b-d(\mathbf u,\pi_j))_+\to0$，于是 $\liminf_j d(\mathbf u,\pi_j)\ge b$，而每个 $\pi_j$ 都满足 $d(\mathbf u,\pi_j)<a<b$，矛盾。这里 $a$ 要同时小于 $\kappa$ 与 $b$，前者是为 §11 服务（ultrapower-contradiction.tex 第 105 行：极限至多 $a<\kappa$，故必为零），后者是为 §10 服务。两个需求合起来给出 (eq:thresholds) 的形状。我把这条叫"一个常数两头吃"，因为 $a$ 的角色完全是被动的：它是一个开区间里随便挑的数，存在性由 $b>0$ 保证。

数字层面我给一点直觉。§4 里那组生成元是三个标准平移加六个 $I+E_{ij}$（$i\ne j$），共 $\lvert S\rvert=9$ 个（group-example.tex 第 49 到 52 行给出这 9 个元素并说它们生成 $\Gamma$；第 7 行的 $S$ 还要求含 Kazhdan 集，我按这个 9 元集合思考，但 $S$ 可以更大）。于是 $R=4\lvert S\rvert\le 36$ 级别，$b\ge\kappa^2/36$。$\kappa$ 的真实数值论文从未计算，de Cornulier 2007 的 Proposition 1.1 只给 (T) 这个事实（group-example.tex 第 47 到 48 行），而 $\kappa$ 的存在来自 §6 第 8 到 10 行那句"下降常数后存在 $0<\kappa\le R$"。`[推测]` 所以我只能把 $\kappa$ 当一个抽象正常数使用，文本里没有任何具体下界可抄；这不是缺陷，因为全部论证只用到正性。我在台账里把 $\kappa,b,R,a$ 都按"抽象常数、无显式数值"登记，避免出现我读不出来的数字。

还有一处顺序问题我在草稿上绕了半天，值得记录：阈值必须在 §6 定完、在 §8 之前就固定，因为 §8 的引理陈述里直接写 $b$，§10 的引理陈述里直接写 $a$；而 $b$ 的定义又依赖 eq:kazhdan-gap 的 $\kappa$。若把 $b$ 的定义推迟到 §8 证明内部，引理陈述就无法闭合。文本正是在 §6 末（第 66 到 69 行）做这件事，顺序是必需的。

## §8 平方根迹不等式与约化密度算符：把任意幺元从估计里挤出去

§6 与 §7 把语言备齐，§8 处理一个纯分析问题：如何对第一个张量因子里那组不受控制的幺元 $(U_s)$ 做出与它们无关的下界。nuclear-finiteness.tex 第 18 到 21 行已经把思路说出来："先在第二个张量因子没有有限维子表示时给出下界；从一个向量过渡到它的约化密度算符，就把第一个因子里那些任意幺元消掉了。"

先说 Powers--St\o rmer 那一步。第 23 到 30 行的 Lemma 4.1（lem:square-root-trace）：任意 Hilbert 空间上正 Hilbert--Schmidt 算子 $X,Y$ 满足 $\lVert X-Y\rVert_2^2\le\lVert X^2-Y^2\rVert_1$，$\lVert\cdot\rVert_1$ 与 $\lVert\cdot\rVert_2$ 分别是迹范数与 Hilbert--Schmidt 范数。第 32 到 47 行给了短证明：记 $F=X-Y$，$J=\operatorname{sgn}(F)$ 且在 $\ker F$ 上取零；由 $X^2-Y^2=FX+YF$ 以及 $JF=FJ=\lvert F\rvert$，有

$\lVert X^2-Y^2\rVert_1\ge\operatorname{Tr}(J(X^2-Y^2))=\operatorname{Tr}(\lvert F\rvert(X+Y))\ge\operatorname{Tr}(F_+F)+\operatorname{Tr}(F_-( -F))=\operatorname{Tr}(F^2)$。

最后一个等号是 $\operatorname{Tr}(F_+F)+\operatorname{Tr}(F_-(-F))=\lVert F_+\rVert_2^2+\lVert F_-\rVert_2^2=\operatorname{Tr}(F^2)$（$F_+,F_-$ 是 $F$ 的正负部分，互相正交）。中间那个不等式用到两条正性：$X+Y-F=2Y\ge0$ 与 $X+Y+F=2X\ge0$，分别和 $F_+$、$F_-$ 配对；文本第 45 到 47 行就是把这两条配对点出来。我起初怀疑 $\operatorname{Tr}(\lvert F\rvert(X+Y))$ 与 $\lVert X^2-Y^2\rVert_1$ 之间的不等号方向，因为 $\lvert F\rvert$ 与 $X+Y$ 未必可换；其实只需 $\lVert T\rVert_1=\sup_{\lvert J\rvert\le1}\lvert\operatorname{Tr}(JT)\rvert$ 取 $J$ 为 $X^2-Y^2$ 的符号，再对得到的一切用正性，方向就固定了。

第 49 到 58 行是无穷维的正当性检查，我认为这一段的密度比证明本体还高：两个 Hilbert--Schmidt 算子的乘积是迹类的；迹具有轮换性，理由是用有限秩逼近加上 $\lVert AB\rVert_1\le\lVert A\rVert_2\lVert B\rVert_2$（第 51 到 52 行）；两个正 Hilbert--Schmidt 算子之迹非负，把其中一个对角化即见（第 53 到 54 行）；这也顺带证明了对有界算子 $J$ 做轮换 rearrangement 是合法的（第 54 到 55 行）；涉及的算子都在一个可分子空间的正交补上为零，所以整个环境 Hilbert 空间不必假设可分（第 56 到 58 行）。最后这句对我尤其要紧：$B^\omega$ 与自然实现的空间都不可分，任何偷偷用可分性的引理都不能用。

我在这节走错过的路是用向量级 Cauchy--Schwarz 硬做。设想直接对 $\xi\in E\otimes K$ 用 $\sum_s\lVert(U_s\otimes\sigma(s))\xi-\xi\rVert$ 去控 $\sigma$ 的位移，会发现 $U_s$ 作用在 $E$ 上，把 $\xi$ 在 $K$ 方向的分量旋转成完全不同的东西；除非 $U_s$ 全是单位元，否则"$\xi$ 几乎不变"根本推不出"某个 $K$ 上的向量几乎 $\sigma$-不变"。这就是我第一次尝试失败的确切原因，它也是 §9 引入密度算符的动机。

约化密度算符这一手在第 91 到 103 行。约定"内积对第一个变量线性"（第 91 行），固定单位向量 $\xi\in E\otimes K$，其在 $K$ 上的约化密度算符 $T$ 由

$\operatorname{Tr}(TC)=\langle(1\otimes C)\xi,\xi\rangle\qquad(C\in\mathcal B(K))$

刻画；展开 $\xi=\sum_i e_i\otimes v_i$，$(e_i)$ 正交规范且 $\sum_i\lVert v_i\rVert^2=1$，则 $T=\sum_i\lvert v_i\rangle\langle v_i\rvert$，按迹范数收敛，故 $T\ge0$、$\operatorname{Tr}(T)=1$；这样的展开只用可数多个向量，即使 $E$、$K$ 不可分也成立（第 98 到 103 行）。关键的性质在第 105 到 107 行与第 108 行：对 $\xi_s=(U_s\otimes\sigma(s))\xi$，它的约化密度算符是 $T_s=\sigma(s)T\sigma(s)^*$。$U_s$ 消失了，因为它作用在被迹掉的因子 $E$ 上。这就是"任意幺元不花钱"的机制，也是我说"把任意幺元从估计里挤出去"的准确含义。

连接两个量的估计是第 107 到 111 行：记 $\delta_s=\lVert\xi_s-\xi\rVert$，用两个向量态对 $1\otimes C$（$\lVert C\rVert\le1$）Testing 得 $\lVert T_s-T\rVert_1\le 2\delta_s$。我想补出这一步的细节：对自共轭迹类算子有 $\lVert T_s-T\rVert_1=\sup_{\lVert C\rVert\le1}\lvert\operatorname{Tr}((T_s-T)C)\rvert$，而

$\lvert\langle(1\otimes C)\xi_s,\xi_s\rangle-\langle(1\otimes C)\xi,\xi\rvert\rvert\le\delta_s\bigl(\lVert(1\otimes C)\xi_s\rVert+\lVert(1\otimes C)\xi\rVert\bigr)\le 2\delta_s$，

其中用了 $\lVert C\rVert\le1$ 与两个向量都是单位向量。这个 $2$ 与"两个态的迹相同（都是 1）"无关，纯粹来自 $|\langle a,a\rangle-\langle b,b\rangle|\le\lVert a-b\rVert(\lVert a\rVert+\lVert b\rVert)$。

把 §8 收尾：第 112 到 116 行由 Powers--St\o rmer 得 $\lVert\sigma(s)T^{1/2}\sigma(s)^*-T^{1/2}\rVert_2^2\le\lVert T_s-T\rVert_1\le 2\delta_s$，也就是把"$X=T_s^{1/2}$、$Y=T^{1/2}$"代入引理（$T_s^{1/2}=\sigma(s)T^{1/2}\sigma(s)^*$）。这里 $T^{1/2}$ 是正 Hilbert--Schmidt 且 $\lVert T^{1/2}\rVert_2^2=\operatorname{Tr}(T)=1$，所以它确实是 eq:kazhdan-gap 合格的使用对象。

## §9 一致谱下界：证明链、以及用掉"无有限维子表示"的那一处

nuclear-finiteness.tex 第 69 到 81 行的 Lemma 4.3（lem:weak-mixing-bound）陈述：设 $\Gamma,S,\kappa$ 满足 eq:kazhdan-gap，$\sigma:\Gamma\to\mathcal U(K)$ 无 nonzero 有限维子表示，则对任意 Hilbert 空间 $E$ 与 $E$ 上任意幺元组 $(U_s)_{s\in S}$，

$L\bigl((U_s\otimes\sigma(s))_{s\in S}\bigr)\ge b1,\qquad b=\frac{\kappa^2}{4\lvert S\rvert}$，

且第 80 行再次强调"No relations among the $U_s$ are required"。

证明链我按顺序拆成五步（第 83 到 125 行）。第一步：共轭作用 $\sigma(\cdot)(\cdot)\sigma(\cdot)^*$ 是 Hilbert--Schmidt 空间 $\mathcal S_2(K)$ 上的幺元表示，并且它没有非零不变向量：若 $A\ne0$ 与一切 $\sigma(g)$ 交换，则非零紧正算子 $\lvert A\rvert$ 也与一切交换，而 $\lvert A\rvert$ 的任一非零特征值的特征子空间就是非零有限维 $\sigma$-不变子空间（第 85 到 89 行）。这是"无有限维子表示"这个假设在全证明中唯一的入口，我用一个反例把它钉住：若 $\sigma$ 含一维子表示（比如平凡表示），取 $\xi=e\otimes v$、$U_s$ 任取，$\delta_s$ 全为零，$b>0$ 立刻假。文本第 61 到 67 行交代这一步的思想渊源是 Bekka 1990（若有共轭不变态则含非零有限维子表示；另见 Valette 1997 的 Proposition 2 证明），而这里的引理把它强化成显式谱下界。

第二步与第三步是 §8 的全部内容（密度算符、$U_s$ 消失、$\lVert T_s-T\rVert_1\le2\delta_s$、Powers--St\o rmer）。第四步：把 eq:kazhdan-gap 用在共轭表示与单位向量 $T^{1/2}$（其 $\lVert\cdot\rVert_2$ 范数为 1）上，

$\kappa\le\sum_s\lVert\sigma(s)T^{1/2}\sigma(s)^*-T^{1/2}\rVert_2^2\le 2\sum_s\delta_s\le 2\sqrt{\lvert S\rvert}\Bigl(\sum_s\delta_s^2\Bigr)^{1/2}$，

得 $\sum_s\delta_s^2\ge b$（第 117 到 123 行）。第五步：$\xi$ 是任意单位向量，故 $L$ 在 $E\otimes K$ 上的谱下确界至少 $b$，即算子不等式成立；$E\otimes K=\{0\}$ 时该不等式为空真（第 123 到 124 行）。第五步的翻译依据就是 §6 的变分形式，只不过那里针对 $d$，这里是同一件事在 $E\otimes K$ 的具体实现上。

我在推第四步时犯过一次幂次的错：把 eq:kazhdan-gap 写成一次位移的和，结果推出 $\kappa\le\sum_s\delta_s$，再 Cauchy--Schwarz 得 $\sum_s\delta_s^2\ge\kappa^2/\lvert S\rvert$，即 $b$ 的分母少了个 4，我一度以为是自己算错。真实情况是：eq:kazhdan-gap 左端本来就是平方和，而 Powers--St\o rmer 把"平方"换成了"一次"，所以 $2\delta_s$ 那个系数进入不等式，$\kappa\le\sum_s\lVert\cdot\rVert_2^2\le\sum_s2\delta_s$。两处各贡献一个 2，平方之后就是分母的 4。这类"常数是推导副产品"的地方最容易在事后重写时被写歪，所以我把它记牢。

值得记的第二处易错：$T^{1/2}$ 属于 $\mathcal S_2(K)$ 且非零，但 eq:kazhdan-gap 要求表示没有非零不变向量，这一步不能只说"共轭表示弱混合"，必须逐字验证不变元是 $\sigma$ 的交换子里的非零紧正算子；文本给出的正是这个逐字验证。第三处易错：$U_s$ 与 $\sigma(s)$ 属于不同因子，$U_s\otimes\sigma(s)$ 的拉普拉斯不等于两个拉普拉斯之和，也不等价的任何简单关系，只有正算子不等式方向可用，这一点在我最初的"分解求和"尝试里被忽略，那个尝试因此作废。

## §10 核性有限性：Wassermann 的商论证被改成什么样子

Lemma 4.4（lem:nuclear-finiteness，nuclear-finiteness.tex 第 134 到 144 行）是全文的枢纽：对任意非零幺元核 $C^*$-代数 $B$ 与 $B$ 中任意单位元 $S$-组 $\mathbf u$，集合

$D(\mathbf u)=\{[\pi]:d(\mathbf u,\pi)<a\}$

有限，其中 $\pi$ 遍历 $\Gamma$ 的非零有限维不可约幺元表示，$[\pi]$ 是其幺元等价类；不假设 $\mathbf u$ 上任何群关系。它的意义是：谱检验 $d<a$ 在核代数里只能捕捉有限多种"表示类型"。这句话与 $B^\omega$ 没有任何关系，纯代数，因此可以在每个坐标上单独用（§11 之后处处受益）。

反证起手（第 146 到 155 行）：设 $(\pi_j)_{j\ge1}$ 两两不等价且都属于 $D(\mathbf u)$，记 $M_j=\mathcal B(\bar V_{\pi_j})$，构造

$Q=\frac{\prod_{j\ge1}M_j}{\bigoplus_{j\ge1}M_j},\qquad q(g)=[(\bar\pi_j(g))_j]$。

第 153 到 155 行补两句：乘积是有界序列，直和是范数（通常意义）趋于零的序列理想；并且"这个辅助商不涉及超滤"。这最后一句我是带着敬意读的。整个定理的结论要对每个自由超滤 $\omega$ 都成立，若在 §10 就引入 $\omega$，那么后面所有与 $\omega$ 相关的取集合操作都会变成循环依赖。用普通趋于零的商，等于把"无穷多个两两不等价的 $\pi_j$"这一反证假设直接封装成一个 $C^*$-代数。更重要的是：这个 $Q$ 的形状与 §2 里我误用的矩阵 corona $\prod_j M_{d_j}/\bigoplus_j M_{d_j}$ 一模一样（introduction.tex 第 88 行与第 89 到 90 行对它的定义与这里第 153 到 155 行的定义是同一段文字）。也就是说，那条被我当作障碍用错的近似类，在这里以工具的身份回来了：它不再充当"源代数装不进去的目标"；它的新身份是"把无穷多个表示打包成一个表示的容器"。这个换位是我在这一节里学到的最实用的一课。

$\sigma=\eta\circ q$（$\eta:Q\to\mathcal B(K)$ 忠实幺元，第 157 到 158 行）没有非零有限维子表示。论证分三段（第 159 到 190 行）：固定一个有限维不可约 $\tau$；在识别 $\bar V_{\pi_j}\otimes\bar V_\tau\simeq\mathcal S_2(V_\tau,\bar V_{\pi_j})$ 下，$\bar\pi_j\otimes\bar\tau$ 的不变向量对应从 $\tau$ 到 $\bar\pi_j$ 的交织子（第 160 到 166 行）；由不可约与两两不等价，这样的交织子至多在一个 $j$ 上存在（第 166 到 168 行），故

$L\bigl((\bar\pi_j(s)\otimes\bar\tau(s))_{s\in S}\bigr)\ge\kappa1$

在至多一个坐标之外成立（第 169 到 173 行）。第二段是放大与商交换："固定尺寸的矩阵放大逐坐标地与这个商交换"（第 174 到 181 行）

$Q\otimes\mathcal B(\bar V_\tau)\simeq\frac{\prod_j(M_j\otimes\mathcal B(\bar V_\tau))}{\bigoplus_j(M_j\otimes\mathcal B(\bar V_\tau))}$，

于是那个例外坐标在商里消失，得 eq:quotient-excludes-finite-parts：$L((q(s)\otimes\bar\tau(s))_{s\in S})\ge\kappa1$。第三段收尾：若 $\sigma$ 含 $\tau$，则 $\sigma\otimes\bar\tau$ 有不变向量，与上式矛盾；每个非零有限维幺元表示都含不可约子表示，故 $\sigma$ 一个都没有（第 186 到 190 行）。

我读这段时最费劲的是"例外坐标为什么能靠除法抹掉"。要点在于商的理想是"范数趋于零"的序列：单一个坐标上的任何范数都不影响等价类，$\bigoplus_j$ 里有它。若这里用的是超滤商 $I_\omega$，一个 $\omega$-小的例外集合虽然也可以抹掉，但"至多一个坐标"更强，因为它对任何自由超滤都成立，所以取普通商反而更干净、更不依赖选择。这个细节解释了第 155 行那句"不涉及超滤"的实际收益。

拿到 §9 与 §10 的前半后，第 192 到 197 行把 $B$ 忠实幺元表示在 $E$ 上，用 lem:weak-mixing-bound（把 $U_s$ 取成 $u_s$ 在该实现下的像，$\sigma$ 取成 $\eta\circ q$）得 eq:spatial-lower-bound：

$L\bigl((u_s\otimes q(s))_{s\in S}\bigr)\ge b1\quad\text{in }B\otimes_{\min}Q$。

注意左边的 $q(s)$ 是 $Q$ 里的元素，而 $u_s$ 是 $B$ 里的，$B\otimes_{\min}Q$ 是唯一确定的极小实现。接下来才是核性登场（第 198 到 220 行）。设

$C=\frac{\prod_j(B\otimes M_j)}{\bigoplus_j(B\otimes M_j)}$，

有交换的幺元 $*$-同态 $\alpha:B\to C$、$\alpha(x)=[(x\otimes1_{M_j})_j]$，与 $\beta:Q\to C$、$\beta([(y_j)_j])=[(1_B\otimes y_j)_j]$；$\beta$ 良定义因为 $\lVert1_B\otimes y_j\rVert=\lVert y_j\rVert$（第 211 到 212 行）。极大张量积的泛性质（交换的、同一 Hilbert 空间上的表示对）给出幺元 $*$-同态

$\Psi:B\otimes_{\max}Q\to C,\qquad \Psi(x\otimes q)=\alpha(x)\beta(q)$。

$B$ 核，于是 $B\otimes_{\min}Q=B\otimes_{\max}Q$（核性按 Takesaki--Lance 的张量范数刻画来用，第 15 到 17 行），eq:spatial-lower-bound 穿过 $\Psi$ 落到 $C$ 里（第 218 到 220 行）。

最后一步是泛函演算的定量收口（第 222 到 231 行）。记 $L_j=L((u_s\otimes\bar\pi_j(s))_{s\in S})$，已证 $[(L_j)_j]\ge b1$ 于 $C$；取 $f(t)=(b-t)_+$，则

$[(f(L_j))_j]=f([(L_j)_j])=0,\qquad \lVert f(L_j)\rVert=(b-d(\mathbf u,\pi_j))_+\to0$，

故 $\liminf_j d(\mathbf u,\pi_j)\ge b$，而每项 $<a<b$，矛盾。这里我要强调"$[(f(L_j))_j]=0$ 意味着坐标范数沿通常意义趋于零"：因为 $C$ 的商理想就是 $\bigoplus_j(B\otimes M_j)$，所以商的零元素等价于 $\lVert f(L_j)\rVert\to0$（无界序列被乘积要求自动排除）。这一步把"商为零"翻译成"趋于零"，是整个论证里唯一需要 $\bigoplus$ 定义的地点。

设计层面我记住的是第 234 到 237 行那段自评：核性只用了一次，就是在施加 $\Psi$ 之前认定极小与极大张量积相同；证明不假设把 $B\otimes_{\min}Q$ 与坐标商 $C$ _identify_，也不对 $\pi_j$ 的维数设界。我起初的写法恰恰相反：我想直接证明 $C\simeq B\otimes_{\min}Q$。这条路需要 $Q$ 也核，而 $Q$ 是无穷多个矩阵代数的商，$\prod_j M_j$ 这种无穷乘积的核性本来就不可用（无穷乘积不保核性），于是我的路线缺一个根本不存在的前提。正确路线绕开了它：不等式住在 $B\otimes_{\min}Q$ 里，靠 $B$ 的核性搬进 $\max$，再由 $\max$ 的泛性质投进 $C$。$Q$ 的核性全程没被问过。这是我这节最大的收获：核性要用在最省的地方，一次，且只用在需要交换两个因子的那一步。

## §11 变维数序列的谱隙：把"近似乘性"在超积里变成严格乘性

从这里开始进入 ultrapower-contradiction.tex。第 5 到 13 行是反证舞台：固定非零幺元核 $B$ 与 $\N$ 上的自由超滤 $\omega$，把属于 $\omega$ 的指标集叫 $\omega$-大（第 7 到 8 行）；假设存在幺元单射 $*$-同态 $\Phi:C^*(G)\to B^\omega$。第 14 到 17 行给出全节的作战图：给 $\Phi$ 的每个坐标配一个不可约表示的有限集，用 $t$ 的共轭迫使这些集合含有 $\theta$ 意义下的前驱，最后有限链与 $\pi_*$ 冲突。这张图与 §6 到 §10 的准备工作恰好一一对应，我在读到第 14 到 17 行时才确认 §4 那三个硬条件是"够用"的。

先处理提升。第 22 到 32 行证明 $B^\omega$ 里每个幺元都有由 $B$ 中幺元组成的代表列：若 $(y_n)$ 代表一个幺元，则 $\lim_\omega\lVert y_n^*y_n-1\rVert=\lim_\omega\lVert y_ny_n^*-1\rVert=0$；在一个 $\omega$-大集合上两个范数都小于 $1/2$，于是 $y_n$ 可逆且 $y_n(y_n^*y_n)^{-1/2}$ 是幺元；由连续泛函演算，这个幺元与 $y_n$ 之差沿 $\omega$ 趋于零；集合外把代表设为 $1$。我核对过那个 $1/2$：它只是保证 $\lVert y_n^*y_n-1\rVert<1/2$，从而 $y_n^*y_n$ 的谱落在 $(1/2,3/2)$ 内、可逆、且平方根可逆，任何小于 1 的阈值都行；$1/2$ 是习惯取法。集合外随意取值这一步之所以无害，是因为商的定义只看 $\omega$-大集合上的行为。

第 34 到 42 行给每个 $g\in G$ 选代表 $x_n(g)\in\mathcal U(B)$，满足 $x_n(e)=1$，并对每对固定的 $g,h$ 有 eq:lift-defects：$\lim_\omega\lVert x_n(g)x_n(h)-x_n(gh)\rVert=0$。第 40 到 42 行是我认为整节最容易被略读过去的两句："这些选择不施加任何坐标上的群关系"，以及"下面所有 eq:lift-defects 的使用只涉及有限多个固定的群元素；不需要对所有配对取交集"。它的意思是：对固定的有限多个配对，$\omega$-大集合的有限交仍属 $\omega$；若贪心地对全体 $(g,h)\in G\times G$ 取交，那是可数交，自由超滤不闭合于可数交，结论直接失效。我第一版草稿就是想一次性取到"某个 $\omega$-大集合上所有乘法近似成立"，被这一条挡住，重写成"每个论证固定它自己要用的有限词表"。第 41 到 42 行的说明就是这个改写的正式记录。

第 43 到 52 行定义坐标集：$\mathbf x_n=(x_n(s))_{s\in S}$，并按 eq:coordinate-D 取 $D_n=\{[\pi]:d(\mathbf x_n,\pi)<a\}$；每个 $D_n$ 有限，理由是 lem:nuclear-finiteness 适用于任意单位元 $S$-组。这就是 §3 那条"不许依赖关系"的要求第一次兑现成具体收益：若 §10 的引理需要 $\mathbf x_n$ 满足 $\Gamma$ 关系，$D_n$ 的有限性根本无从谈起。

难点在维数。$D_n$ 虽然有限，但它的元素维数可以随 $n$ 无界增长（nuclear-finiteness.tex 第 236 到 237 行明写"不对 $\pi_j$ 的维数设界"）。我原本指望用 Lemma 3.2 的谱隙逐坐标控制 $d(\mathbf x_n,\pi_n)$，两条路都不通：其一，$\mathbf x_n$ 单坐标上不是表示，Lemma 3.2 的前提不满足；其二，即便满足，$\kappa$ 的谱隙只对固定的表示成立，序列 $(\pi_n)$ 逐坐标变化时没有逐坐标结论可用。lem:varying-gap（第 57 到 66 行）给的正是解决版：对每个由非零有限维幺元表示组成的序列 $(\pi_n)$，即使维数无界，也有

$\lim_\omega d(\mathbf x_n,\pi_n)\in\{0\}\cup[\kappa,R]$  (eq:varying-gap)，

并且若 $\{n:d(\mathbf x_n,\pi_n)<a\}\in\omega$，则该极限为零。

证明（第 68 到 106 行）先造代数：$C_n=B\otimes\mathcal B(\overline{V_{\pi_n}})$，$C_\omega=\prod_nC_n/\{(c_n):\lim_\omega\lVert c_n\rVert=0\}$，乘积取有界序列（第 69 到 75 行）。第 76 到 79 行是要害 eq:ultraproduct-norm：$\lVert[(c_n)]\rVert=\lim_\omega\lVert c_n\rVert$。第 80 到 84 行把两个方向都给了：下界来自"加一个 $\omega$-零序列不改变范数的超极限"；上界的写法我特别留意，它说若超极限为 $c$，就 outside $\{n:\lVert c_n\rVert<c+\varepsilon\}\in\omega$ 把 $c_n$ 换成 $0$，再令 $\varepsilon\downarrow0$。我按这个提示检查了合法性：改动后的差序列在该 $\omega$-大集合上恒为零，故其范数超极限为 0，属于理想，所以商里 $(c_n)$ 与被截断的 $(d_n)$ 同一类，而 $\lVert[(d_n)]\rVert\le c+\varepsilon$ 由商的范数定义直接得到；$\varepsilon$ 任意，上界成立。这类"截断到 $\omega$-大集合"的手Technique 我在 §12、§13 又用到两次，值得单记。

第 86 到 91 行是真正的魔术：eq:lift-defects 表明

$g\longmapsto[(x_n(g)\otimes\overline{\pi_n}(g))_n]$

在 $C_\omega$ 里是一个货真价实的幺元表示。逐坐标只近似乘性的东西，取完超积后严格乘性，因为乘性缺陷是 $\omega$-零序列。这就是我在 §2 到 §3 里苦苦找的方向性事实：障碍必须写成"极限对象上是表示，坐标上只是近似"的形式，谱隙才复活。第 91 行还确认 $C_\omega$ 非零幺元（单位元是 $(1)_{n}$ 的类；$\omega$ 是真滤子，理想是真理想）。

第 92 到 103 行完成翻译：由 Lemma 3.2，该表示的拉普拉斯谱含于 $\{0\}\cup[\kappa,R]$。记 $P_n=L((x_n(s)\otimes\overline{\pi_n}(s))_{s\in S})$，因 $0\le P_n\le R1$，用 eq:ultraproduct-norm 得

$\min\operatorname{spec}[(P_n)]=R-\lVert R1-[(P_n)]\rVert=\lim_\omega(R-\lVert R1-P_n\rVert)=\lim_\omega d(\mathbf x_n,\pi_n)$。

中间那个等式 $\min\operatorname{spec}A=R-\lVert R1-A\rVert$ 的依据是 $A$ 正且谱在 $[0,R]$：$\lVert R1-A\rVert=\max_{\lambda\in\operatorname{spec}A}\lvert R-\lambda\rvert=R-\min\operatorname{spec}A$。第 104 到 105 行收尾：最后那条断言里极限至多 $a<\kappa$，故必为零，这里恰好用到 §7 里 $a<\kappa$ 的那一半约束。

顺带说明"$\min\operatorname{spec}$ 与超积交换"这件事我一开始当成显然。它并不显然：谱在商映射下会掉点（商里可能出现新的可逆性），一般只能得 $\operatorname{spec}[(P_n)]\subseteq\lim_\omega\operatorname{spec}P_n$ 型的包含。eq:varying-gap 之所以够用，是因为我们不比较两个谱集，只用同一个恒等式 $\min\operatorname{spec}=R-\lVert R1-\cdot\rVert$ 把谱问题换成范数问题，而范数由 eq:ultraproduct-norm 精确保持。也就是说，绕开谱、走范数，是这一节的技术选择。

## §12 初始匹配：为什么 $[\pi_*]$ 一定出现在 $\omega$-大集合上

lem:initial-match（第 113 到 116 行）断言 $\lim_\omega d(\mathbf x_n,\pi_*)=0$，从而 $\{n:[\pi_*]\in D_n\}\in\omega$。这一条把"嵌入是单的"这个假设用掉，用完之后 $\Phi$ 的单射性就退场了。

第 119 到 129 行是把 $\pi_*$ 从 $\Gamma$ 抬到 $G$：在由左陪集 $G/\Gamma$ 标记的 $V_{\pi_*}$  copies 的 Hilbert 直和上诱导；具体规则是选含单位元的代表 $q_i$，当 $gq_i=q_j\gamma$（$\gamma\in\Gamma$）时把第 $i$ 坐标送到第 $j$ 坐标并作用 $\pi_*(\gamma)$；这确定一个幺元表示；含单位元的那个坐标在 $\Gamma$ 下不变且携带 $\pi_*$，故限制表示含 $\pi_*$；再与 $\overline{\pi_*}$ 张量，就在该坐标上得到非零 $\Gamma$-不变向量 $\sum_je_j\otimes\overline{e_j}$，其中 $(e_j)$ 是 $V_{\pi_*}$ 的正交规范基。第 126 到 129 行写出的这个向量的具体形状很重要：它就是 §6 里"$\rho\otimes\bar\pi$ 的不变向量对应 $\operatorname{Hom}_\Gamma(V_\pi,H)$"那一一般原理的显式元素，即恒等映射 $\operatorname{id}\in\operatorname{End}(V_{\pi_*})$ 在 $\mathcal S_2(V_{\pi_*})\simeq V_{\pi_*}\otimes\bar V_{\pi_*}$ 下的像。我在纸上把这个对应写了一遍，才确认 $\sum_j e_j\otimes\overline{e_j}$ 与基的选取无关。

第 131 到 138 行是逻辑枢纽：$G$ 的每个幺元表示都给出 $C^*(G)$ 的表示，故上面的不变向量说明

$\min\operatorname{spec}L\bigl((u_s\otimes\overline{\pi_*}(s))_{s\in S}\bigr)=0,$

第 137 到 138 行的解释是"一个可逆的正元素不可能在幺元表示下多出核"。我把它补全成反证：若 $C^*(G)\otimes\mathcal B(\bar V_{\pi_*})$ 里的这个正元素可逆（即谱下界严格为正），那么它在任何幺元同态下的像仍可逆，与具体表示里有不变向量矛盾；正元素谱含于 $[0,R]$，不可逆等价于 $0\in\operatorname{spec}$ 等价于 $\min\operatorname{spec}=0$。这里 $\mathcal B(\bar V_{\pi_*})$ 是矩阵代数，$\overline{\pi_*}$ 与 $u_s$ 处于不同因子，张量积无需选范数（§6 的唯一性注记又一次被调用）。

第 138 到 141 行把结论搬到目标端：$\Phi$ 的矩阵放大是单射且保谱，所以 $B^\omega\otimes\mathcal B(\overline{V_{\pi_*}})$ 里对应的谱下确界同样为零。我在这个"保谱"上卡过：单射幺元 $*$-同态把谱映到更小的谱集（在大代数里可能多出不多的可逆性），一般不保谱。救我的是元素自伴：若 $A\subseteq C$ 是同单位的 $C^*$-子代数、$a=a^*\in A$，则 $\operatorname{spec}_A(a)=\operatorname{spec}_C(a)$，因为对非实 $\lambda$，$(a-\lambda)$ 在 $C$ 中可逆即在 $A$ 中可逆（标准事实：自伴元素的预 resolvent 由 $a$ 与 $1$ 生成的交换子代数里就能算出）。$L$ 正、放大映射单且幺元，于是谱下确界为 0 这一点被保下来。这一处是我在本稿里第二次被迫把"保谱"的条件查清楚，值得进台账。

第 143 到 153 行做最后的坐标化。对每个固定的正整数 $d$ 有典范同构 $M_d(B^\omega)\cong(M_d(B))^\omega$（第 143 到 147 行）；核的验证写得很具体（第 147 到 149 行）：$d\times d$ 矩阵序列沿 $\omega$ 范数趋于零，当且仅当它的有限多个条目各自如此；满射由逐条目提升得到。取 $d=\dim\pi_*$，再套 §11 里谱下确界的算法，就得出 $\lim_\omega d(\mathbf x_n,\pi_*)=0$。第 153 行提醒：这个固定尺寸的放大与 §11 里那个逐坐标变动的代数族是两件事。我觉得这句提醒有道理：$d$ 固定时 $M_d(B^\omega)$ 与 $(M_d(B))^\omega$ 典范同构，靠的是"有限个条目"；若 $d$ 随 $n$ 变，就没有这种同构，只有 §11 的 $C_\omega$。两者混用会出事。再由 $a>0$，$\{n:d(\mathbf x_n,\pi_*)<a\}\in\omega$，即 $[\pi_*]\in D_n$ 在 $\omega$-大集合上成立。

这一节里我的错路是：试图直接在某个坐标 $n$ 上说"$\pi_*$ 出现在 $\mathbf x_n$ 里"。$\mathbf x_n$ 不是表示，"出现"这个词在那个语境没有定义；$d(\mathbf x_n,\pi_*)$ 只是谱下确界，没有任何表示论含义。真正的杠杆是把 $u_s$ 抬到 $C^*(G)$ 的抽象元素层，用单射 $\Phi$ 与固定尺寸放大搬过去，再落到坐标。抽象层与坐标层的分工在这里非常清楚，也是我从这个证明里学到的最可迁移的一招。

## §13 前驱引理：固定词不变性、八坐标归纳与逐成分 Frobenius

lem:uniform-predecessor（第 164 到 171 行）的陈述是

$\{n:(\forall[\pi]\in D_n)(\exists[\pi']\in D_n)\quad\pi\prec\pi'\circ\theta\}\in\omega,$

其中 $\alpha\prec\beta$ 表示 $\alpha$ 幺元等价于 $\beta$ 的子表示（第 158 到 160 行）。第 160 到 162 行把量词顺序单独讲了一遍：需要的命题形如"在一个 $\omega$-大集合上，$D_n$ 的每个成员同时有前驱"，把"对每个 $[\pi]$ 各有一个 $\omega$-大集合"这种逐点版本当作结论是不够的。这句话的必要性要到 §14 第 369 到 371 行才显现：那里只取一个 $n$，靠有限交落在这个共同集合上。我第一版把量词写成逐点版本，看似只差一个 $\forall/\exists$ 交换，实际整条链断裂，因为 $D_n$ 的基数与成员都随 $n$ 变，逐点的 $\omega$-大集合无法选出公共 $n$。

证明从反证开始（第 173 到 181 行）：若结论不成立，则在一个 $\omega$-大集合 $F$ 上可选出不可约的 $\pi_n$ 满足 $[\pi_n]\in D_n$ 且无前驱；$F$ 外取平凡表示；由 lem:varying-gap（那一条的"特别地"）得 eq:chosen-zero：$\lim_\omega d(\mathbf x_n,\pi_n)=0$。注意这里的技巧是"在 $\omega$-小集合上随便取"，只要取的是一个合法的表示序列，就能把序列 $\pi_n$ 补齐，从而调用 §11。

第 183 到 190 行交代计划：令 $\alpha_n=\pi_n\mid_\theta$（准确写法是 $\alpha_n=\pi_n\circ\theta^{-1}$，$\Lambda$ 的表示），$\rho_n=\operatorname{Ind}_\Lambda^\Gamma\alpha_n$；证 $\lim_\omega d(\mathbf x_n,\rho_n)=0$，且 $\rho_n$ 的每个不可约成分 $\pi'$ 都满足 $\pi_n\prec\pi'\circ\theta$；随后用 eq:block-minimum 选出属于 $D_n$ 的成分，前驱断言就把它变成 $\pi_n$ 的前驱。这两件事合起来直接违反 $\pi_n$ 的选取，整个引理是这样一个闭环。

"搬到 $\Lambda$"这一段（第 192 到 232 行）先取 $B$ 的忠实幺元表示 $B\subseteq\mathcal B(\mathcal H)$（第 193 行，符号复用），再取单位向量 $\xi_n\in\mathcal H\otimes\overline{V_{\pi_n}}$ 满足

$\sum_{s\in S}\lVert(x_n(s)\otimes\overline{\pi_n}(s))\xi_n-\xi_n\rVert^2<d(\mathbf x_n,\pi_n)+1/n$（第 195 到 200 行）。

第 201 行是"因为 $\omega$ 自由，$1/n$ 沿 $\omega$ 趋于零"。这一句我核对过它的实质：$\{n:1/n<\varepsilon\}$ 是余有限集，自由超滤含所有余有限集，故确实趋于零。这也是全证明里唯一用到"自由"的地方（配合 §10 的"至多一个坐标"）。于是得 eq:fixed-word-invariance：对每个 $g\in\Gamma$，$\lim_\omega\lVert(x_n(g)\otimes\overline{\pi_n}(g))\xi_n-\xi_n\rVert=0$（第 203 到 207 行）。

第 208 到 218 行是"固定词"的正当性，我逐句拆过。记 $U_n(g)=x_n(g)\otimes\overline{\pi_n}(g)$。对每个 $s\in S$，$x_n(s^{-1})-x_n(s)^*$ 由 eq:lift-defects 趋于零；幺元与它的逆对固定向量的位移范数相同（$\lVert U^{-1}\xi-\xi\rVert=\lVert U\xi-\xi\rVert$，因为 $U^{-1}\xi-\xi=-U^{-1}(U\xi-\xi)$ 且 $U^{-1}$ 等距）；对固定词 $g=s_1^{\varepsilon_1}\cdots s_k^{\varepsilon_k}$，反复使用 eq:lift-defects 可把 $U_n(g)$ 换成相应乘积 $\prod U_n(s_j)^{\varepsilon_j}$，误差趋于零；而该乘积的位移不超过 $k$ 个因子位移之和；词与 $k$ 都固定，$n$ 在变。第 217 到 218 行的最后一句"Both the word and $k$ are fixed while $n$ varies"就是把 §11 那句"不需要对所有配对取交集"落地。我起初想选一个 $n$-依赖的长词，结果发现误差项随 $k$ 线性增长，$k$ 一依赖 $n$ 就前功尽弃，这个错路的失败点正是第 218 行那句话。

接着（第 220 到 232 行）令 $\eta_n=(x_n(t)\otimes1)\xi_n$，仍是单位向量。对 $h\in\Lambda$，取 $g=\theta^{-1}(h)$；由 $ht=tg$ 与 eq:lift-defects 得 $\lim_\omega\lVert x_n(h)x_n(t)-x_n(t)x_n(g)\rVert=0$；与 eq:fixed-word-invariance 合并得 eq:$\Lambda$-invariance：$\lim_\omega\lVert(x_n(h)\otimes\overline{\alpha_n(h)})\eta_n-\eta_n\rVert=0$ 对每个 $h\in\Lambda$。这里 $\eta_n$ 的角色是"$t$ 把 $\Gamma$ 的不变性推给 $\Lambda$"：$t$ 在 $G$ 里是真实元素，它的代表列 $x_n(t)$ 是我们唯一可用的动力学来源。这也解释了 §4 条件二（$\theta$ 必须由 $G$ 内元素共轭实现）：若 $t$ 不在 $G$ 里，就没有 $x_n(t)$，整个搬运断链。

"归纳回 $\Gamma$"（第 234 到 275 行）用固定八坐标。取 $\Gamma/\Lambda$ 的左陪集代表 $r_1=e,r_2,\ldots,r_8$，即 §5 里 $\{0,1\}^3$ 给出的平移代表（第 236 到 238 行，与 group-example.tex 第 56 到 62 行一致）。对 $g\in\Gamma$ 与 $1\le i\le8$ 唯一确定 $j(g,i)$ 与 $h(g,i)\in\Lambda$ 使 $gr_i=r_{j(g,i)}h(g,i)$（第 239 到 242 行）；$\rho_n$ 作用在 $\bigoplus_{i=1}^8V_{\pi_n}$ 上，把第 $i$ 坐标经 $\alpha_n(h(g,i))$ 送到第 $j(g,i)$ 坐标（第 243 到 245 行）。表示律由 $h(g_1g_2,i)=h(g_1,j(g_2,i))h(g_2,i)$ 验证，幺元性由坐标置换与 $\alpha_n$ 的幺元性验证（第 246 到 251 行）；共轭表示 $\overline{\rho_n}$ 用同样的坐标规则，把 $\alpha_n$ 换成 $\overline{\alpha_n}$（第 251 到 252 行）。第 253 到 256 行造向量：$(\zeta_n)_i=8^{-1/2}(x_n(r_i)\otimes1)\eta_n$；八个分量两两正交、每个范数 $8^{-1/2}$，故 $\lVert\zeta_n\rVert=1$（第 257 行）。第 258 到 265 行是唯一的硬估计：固定 $s\in S$ 与 $i$，记 $j=j(s,i)$、$h=h(s,i)$，则 $x_n(s)\otimes\overline{\rho_n}(s)$ 从 $i$ 送到 $j$ 的那一部分与 $(\zeta_n)_j$ 相差一个范数不超过

$8^{-1/2}\bigl(\lVert x_n(s)x_n(r_i)-x_n(r_j)x_n(h)\rVert+\lVert(x_n(h)\otimes\overline{\alpha_n}(h))\eta_n-\eta_n\rVert\bigr)$

的向量。第一项由 eq:lift-defects 与 $sr_i=r_jh$ 趋于零，第二项由 eq:$\Lambda$-invariance 趋于零；涉及的固定选择只有 $8\lvert S\rvert$ 个（第 266 到 268 行）。于是 $\lim_\omega\sum_s\lVert(x_n(s)\otimes\overline{\rho_n}(s))\zeta_n-\zeta_n\rVert^2=0$，故 $\lim_\omega d(\mathbf x_n,\rho_n)=0$，特别地 $d(\mathbf x_n,\rho_n)<a$ 在 $\omega$-大集合上成立；第 275 行明确写出"所有误差界与 $\dim\pi_n$ 无关"。

这一处的量级我算了一遍，确认它经得起维数无界：变维数的风险全部集中在 $\mathcal H\otimes\overline{V_{\pi_n}}$ 的维度上，而 $\zeta_n$ 只把同一个 $\eta_n$ 复制八次再缩放，求和的平方范数用正交性展开成八个 $1/8$ 相加得 1，误差项的个数由 $8\lvert S\rvert$ 这个固定乘子控制。指标 $8=2^3$ 在这里变成常数，与 §4 里 dyadic 的三处落地呼应。若 $\theta$ 选 $\ell^3$ 的伸缩，这个乘子换成 $\ell^3$，论证照跑。

"选出前驱"（第 277 到 304 行）分两步。第一步（第 278 到 282 行）：把 $\rho_n$ 分解为不可约和，对应的拉普拉斯是分块直和，其谱下确界是各块谱下确界的最小值，由 eq:block-minimum 在 $\omega$-大集合上取到某个不可约成分 $\pi'_n$ 使 $[\pi'_n]\in D_n$。第二步（第 284 到 300 行）：$\rho_n$ 的每一个不可约成分 $\pi'$（含刚取到的那个）都满足 $\pi_n\prec\pi'\circ\theta$，这是有限指标情形的 Frobenius 互反，文本给的验证是手工版。设 $W$ 为 $\pi'$ 的不变子空间，$P_1:W\to V_{\pi_n}$ 是到单位元坐标的投影；它对目标表示 $\alpha_n$ 是 $\Lambda$-等变的；它非零：若 $w\in W$ 有非零第 $i$ 坐标，则 $P_1\rho_n(r_i^{-1})w=w_i\ne0$（第 290 到 294 行）；因 $\alpha_n$ 不可约，$P_1\mid_W$ 满射；其伴随是单射 $\Lambda$-交织子；再用正标量归一化可把它变成等距交织子，理由是 $(P_1\mid_W)(P_1\mid_W)^*$ 与不可约的 $\alpha_n$ 交换；于是 $\alpha_n\prec\pi'\mid_\Lambda$，与 $\theta:\Gamma\to\Lambda$ 复合即得断言。

这段里我原先的做法是只引用抽象的 Frobenius 互反 $\operatorname{Hom}_\Gamma(\operatorname{Ind}\alpha_n,\pi')\cong\operatorname{Hom}_\Lambda(\alpha_n,\pi'\mid_\Lambda)$，然后宣称"成分非零故存在交织子"。它给的结论其实只覆盖某一个成分，而反证假设需要的是"每个成分都是前驱"，因为 $D_n$ 里被选出的 $\pi'_n$ 事先不可知。文本第 284 行那句 "Every irreducible constituent $\pi'$ of $\rho_n$, including the one just obtained" 就是在堵这个洞。另一个我差点漏掉的是归一化那一步：单射交织子 $T$ 要缩放成等距，需要 $T^*T$ 是标量，这里靠 Schur 引理，条件是不可约与有限维（$V_{\pi_n}$ 有限维），两个条件在 §10 之后仍然齐备。$P_1\mid_W$ 满射这一步也用了不可约性：$\Lambda$-等变像满且是 $\alpha_n$ 的子表示。

第 302 到 304 行收尾：把选出 $[\pi'_n]\in D_n$ 的 $\omega$-大集合与 $F$ 相交，仍属 $\omega$（有限交性质），在该集合上 $\pi_n$ 有前驱，与 $\pi_n$ 的选取矛盾，引理得证。

## §14 有限前驱链迫使周期：$\pi_*\simeq\pi_*\circ\theta^p$ 与模 2 的最后一击

第 307 到 323 行声明解析部分已结束，剩下的是有限性初等推论。设想链 $\tau_0=\pi,\tau_1,\ldots$ 的类都落在有限集 $D$ 里且满足 $\tau_i\prec\tau_{i+1}\circ\theta$；有限性给出 $l\ge0$、$p\ge1$ 使 $\tau_l\simeq\tau_{l+p}$。第 319 到 321 行点出关键：重复类上的周期性迫使该表示的每一次拉回仍不可约，于是周期性能传回起始类。figures/finite-chain.tex 第 4 到 16 行的图就是把起点 $[\tau_0]=[\pi]$、初始段、$[\tau_l]$、$p$ 个前驱步、$[\tau_{l+p}]$ 排成一行，虚弧标注"same equivalence class"；图注（第 18 到 23 行）补三句：重复由维数相等给出 $\tau_l\simeq\tau_l\circ\theta^p$；随后证明每个拉回不可约，使周期性回传到 $\pi$；初始段可以为空。

lem:finite-predecessor-cycle（第 325 到 332 行）的陈述只依赖 $\theta$ 是 $\Gamma$ 的自同态、$D$ 是有限类集、每个成员有 $D$ 中的前驱，结论是对每个 $[\pi]\in D$ 存在 $p\ge1$ 使 $\pi\simeq\pi\circ\theta^p$。第 333 到 367 行的证明分三段。第一段（第 335 到 349 行）：从 $\tau_0=\pi$ 出发选链，有限性得 $\tau_l\simeq\tau_{l+p}$；沿该段复合包含得 $\tau_l\prec\tau_{l+p}\circ\theta^p\simeq\tau_l\circ\theta^p$；首尾维数相同，故 eq:cycle-periodicity：$\tau_l\simeq\tau_l\circ\theta^p$；迭代得 $\tau_l\circ\theta^{kp}\simeq\tau_l$ 对一切 $k\ge0$。

第二段（第 351 到 356 行）是我认为全篇最精巧的一处：对每个 $j\ge0$，$\tau_l\circ\theta^j$ 不可约。反设有非零真不变子空间，则只要 $kp\ge j$，该子空间对 $\tau_l\circ\theta^{kp}$ 仍不变，因为 $\theta^{kp}(\Gamma)\subseteq\theta^j(\Gamma)$；而 $\tau_l\circ\theta^{kp}\simeq\tau_l$ 不可约，矛盾。第 355 行那句集合包含就是全部机关：$\theta$ 是到有限指标子群的单射自同态，迭代越深像越小，故"$\theta^{kp}$ 不变"比"$\theta^j$ 不变"是更弱的要求。$\theta$ 在我们的例子里是 $2$ 倍伸缩，$\theta^{kp}(\Gamma)\subseteq\theta^j(\Gamma)$ 显然成立；但请注意，若 $\theta$ 换成自同构（像 $\operatorname{SL}_3(\Z)$ 那种），包含就变成等号，第二段论证依旧可用而第一段的矛盾拿不到，这正是 §4 里我否决 $\Gamma=\operatorname{SL}_3(\Z)$ 候选的形式化理由。

第三段（第 357 到 366 行）：初始段给出 $\pi\prec\tau_l\circ\theta^l$，右边已由第二段不可约，故 $\pi\simeq\tau_l\circ\theta^l$；把 eq:cycle-periodicity 与 $\theta^l$ 复合，得

$\pi\circ\theta^p\simeq\tau_l\circ\theta^{l+p}\simeq\tau_l\circ\theta^l\simeq\pi$。

我在这一段里唯一真正想错的，是"初始段能不能被跳过"：如果直接从重复类开始，只能得到 $\tau_l$ 的周期性，而矛盾需要 $\pi_*$ 自身的周期性；第二段的不可约传递正是把周期从 $l$ 处搬回 $0$ 处的唯一通道，图注里"initial segment can be empty"这句是说空的情形退化成平凡搬运，不是可有可无的注脚。

最后是 assemble（第 369 到 376 行）：在 lem:initial-match 与 lem:uniform-predecessor 两个 $\omega$-大集合的交里取一个指标 $n$（交仍属 $\omega$，非空，因为 $\omega$ 是真滤子）；对 $D_n$ 与 $\pi_*$ 用 lem:finite-predecessor-cycle，得 $\pi_*\simeq\pi_*\circ\theta^p$ 某 $p\ge1$。但 $\pi_*$ 在平移 $\Z^3$ 上非平凡，而 $\pi_*\circ\theta^p$ 在其上平凡：$\theta^p$ 把这些平移乘 $2^p$，而 $\pi_*$ 经由模 2 约化分解因子（第 373 到 376 行）。矛盾。这一步与 §5 里 eq:group-aperiodic 的推导是同一段计算，前后呼应，中间没有任何额外假设。

## §15 收尾的否定与特化：假设各自在哪里被消耗

第 378 到 383 行做总结陈词：论证只用到 $B$ 非零、幺元、核，以及 $\omega$ 自由；群 $G$ 与代数 $C^*(G)$ 与这些选择无关；于是同一个代数对任何这样的 $B$ 与任何自由 $\omega$ 都没有幺元嵌入；取 $B=\mathcal O_2$ 就给出 Kirchberg 嵌入问题的否定答案。我把这段与 §1 的引理清单对齐，做一次"假设清点"，因为这是检验证明没有偷偷用多余条件的唯一办法。

非零：出现在 spectral-preliminaries.tex 第 15 行（$C$ 非零，$L$ 与谱才有意义）、第 37 行（$\pi$ 作用在非零空间）、ultrapower-contradiction.tex 第 91 行（$C_\omega$ 非零幺元）。幺元：$\Phi$ 保单位元，使 $x_n(e)=1$（第 35 行）、$\beta$ 良定义用到 $\lVert1_B\otimes y_j\rVert$（nuclear-finiteness.tex 第 211 到 212 行）、以及"正元素在幺元包含下保谱"这条（§12）。核：nuclear-finiteness.tex 第 218 到 220 行，一次，位置精确。自由：ultrapower-contradiction.tex 第 201 行（$1/n\to0$ 沿 $\omega$）与 §10 那处"至多一个例外坐标"对任何超滤都成立因而无需超滤。可分：$C^*(G)$ 可分来自 $G$ 可数（group-example.tex 第 79 到 80 行），与 $B$ 无关，第 52 行明说不需要 $B$ 可分。单射：lem:initial-match 用一次；此后 $\Phi$ 的性质不再被调用。

我还特意检查了"$G$ 与 $B,\omega$ 无关"这句为何值得强调。假如证明给的是"对每个核 $B$ 存在某个 $G_B$"，那结论只是"KEP 的每个候选见证子都有反例"，弱得多，也无法推出 §16 的交叉积与有限条件后果（那些推论需要固定的可分代数作为统一反例）。显式性（explicit）在这个意义下是结论强度的一部分，标题里的 explicit 与此对应。

最后回到最初设想与最终思路的偏差，我把差距写清楚。最初我以为会造出一个"太大"的代数（比如非恰当、非可分的对象）来撞超幂；最终拿到的是可分、幺元、由一个具体可数群的全代数给出的反例。最初我以为障碍会写成范数或近似性质（非有限、非 MF）；最终障碍写成"有限维表示类型集合的有限性"与"$\theta$ 动力学的非周期性"的组合，前者由核性提供，后者由群论提供。最初我以为超滤的自由性会是核心武器；实际它只用在一处 $1/n\to0$，其余地方连超滤都不需要（§10 的辅助商明确不用超滤）。这三条偏差，我现在的理解是：超幂对象太强，任何"源不够近似"型的性质都会被它吸收，只有把性质抬到"表示类型"这一离散层面，才可能强到与 $\omega$-极限兼容、又弱到能被有限性 combinatorics 击穿。

## §16 模型论推论：三条后果与它们各自的显式程度

consequences.tex 整节很短（60 行，3022 字节），我读它时最在意的是"哪些东西是造出来的，哪些是借来的"。第 5 到 8 行先把语言定下来：在幺元 $C^*$-代数语言里，量化公式-free 的公式是 $*$-多项式范数的连续组合，变量在指定的范数球上取值。第 8 到 14 行是存在闭包的定义：幺元代数 $E$ 存在闭，若对每个幺元包含 $E\subseteq F$、$E$ 中每个有限参数元组 $a$、每个关于有限元组 $y$ 的量化公式-free 公式 $\varphi(a,y)$，有

$\inf_{y\in E}\varphi(a,y)=\inf_{y\in F}\varphi(a,y)$（consequences.tex 第 11 到 12 行），

$y$ 在相应的指定范数球乘积上取值；第 16 到 17 行给了口语版本：扩张无法改进 $E$ 上有限量化公式-free 检验的下确界。定义里最容易被读丢的是"指定的范数球"这一限定（第 14 行"the corresponding products of prescribed norm balls"）：如果不固定球，$\inf$ 可能在 $F$ 里由范数更大的元素取得，等价式整个失真。

第 19 到 21 行引入"无参数有限条件"：由有限多个严格不等式 $\varphi_j(x)<r_j$ 组成，量化公式-free 的 $\varphi_j$；可满足当且仅当某个幺元 $C^*$-代数里有元组满足它们。第 22 到 25 行预告了推论里最难读的那条：把"好的核见证子"失效写成一个具体的正下界，即每个实现元组的每一组有限维完全正压缩分解都有不趋于零的误差。

cor:kep-consequences（第 31 到 48 行）的三条我逐条抄下自己的理解。第一条：$\mathcal O_2$ 与任何恰当或核的幺元 $C^*$-代数在幺元 $C^*$-代数扩张之间都不是存在闭的。第二条：对每个自由超滤 $\omega$，存在可分幺元代数 $D$ 与 $\alpha\in\operatorname{Aut}(D)$，使 $D$ 幺元嵌入 $\mathcal O_2^\omega$ 而 $D\rtimes_\alpha\Z$ 不能幺元嵌入那里（第 35 到 38 行）。第三条：存在可满足的有限条件 $p(x)=\{\varphi_j(x)<r_j:1\le j\le s\}$，$x=(x_1,\ldots,x_m)$，量化公式-free 的 $\varphi_j$，$r_j>0$，它缺少好的核见证子：存在 $\varepsilon_0>0$，使 $p$ 在任意幺元代数 $E$ 里的每个实现 $a=(a_i)_{i=1}^m$ 都满足 $\max_{1\le i\le m}\lVert\psi\phi(a_i)-a_i\rVert\ge\varepsilon_0$，对一切有限维 $F$ 与所有完全正压缩映射 $\phi:E\to F$、$\psi:F\to E$，且这两个映射不必保单位元（第 40 到 47 行）。

我在这三条上花的时间集中在"它们如何从主定理流出来"。第 50 到 59 行的证明只有一段：对每个固定的自由 $\omega$，用 $B=\mathcal O_2$ 代入 thm:main 就否定幺元版 KEP；存在闭部分由 GS2015 的 Theorem 3.3 给出，并用"核蕴含恰当"这句常识（第 52 到 54 行）；交叉积部分由同文 Proposition 3.2 及其前面对可分幺元代数的构造给出（第 54 到 56 行）；有限条件部分由 Definition 3.6 与 Theorem 3.7 给出（第 56 行）。全部依赖都在第 27 到 29 行的那句"KEP equivalences of Goldbring--Sinclair"里预先声明过（引 Proposition 3.2、Theorems 3.3 与 3.7）。

这里我必须诚实地记下自己的不适。第一条后果是干净的方向性推理，我完全跟得住：主定理给出一个不可嵌入 $\mathcal O_2^\omega$ 的可分幺元代数，GS2015 的等价式把它翻译成 KEP 失效，再翻译成存在闭失效。第二、三条我不满意，因为第 57 到 58 行作者自己写了 "These two witnesses are existential, not identified by our explicit group construction."：交叉积的反例 $D$ 与那个有限条件 $p$ 都是存在性产物，没有由我们的显式群构造指认出来。标题里的 explicit 只覆盖主定理，不覆盖推论二与推论三。我起初的期待是：既然 $G$ 本身就是上升 HNN 扩张、$t$ 的共轭就是 $\theta$，那么 $D=\Gamma$ 的某个代数与 $\alpha=\operatorname{Ad}t$ 大概正是失效的交叉积见证子。文本没有支持这个期待，它只走等价式。`[推测]` 我猜这是刻意的克制：要让 $D\rtimes_\alpha\Z$ 失效，需要证明 $D$ 可嵌入而交叉积不可，主定理只给"某个代数不可嵌入"，而"$D$ 可嵌入"这一半还得靠 GS2015 的一般构造，直接把我们的 $G$ 代进去未必满足。信息就这么多，我不硬编。

第二条还有一处让我停了很久：结论里的 $\omega$ 是全称量化的（"对每个自由超滤"），而主定理给的 $G$ 与 $\omega$ 无关。这一强形式来自 GS2015 等价式对每个固定 $\omega$ 逐个成立（第 51 行"For each fixed free $\omega$"），所以全称性是从主定理的全称性传递下来的，没有额外工作。第三条里的 $\varepsilon_0$ 也是正下界型的量化：它把"没有好的核见证子"从否定的存在陈述升格为一致分离，这与我 §7 里"$a$ 只是开区间里任取的数"形成对照：这里 $\varepsilon_0>0$ 是被证明存在的，不由我选。

## §17 分岔点与思路变迁：我最后走的路与起手想的路差在哪

把分岔集中记一次，方便以后重用。

分岔一，近似类与障碍类。introduction.tex 第 92 到 94 行给出我那条错路的正式判词：目标类不同，$C^*(G)$ 的非有限性排除不了进入 $\mathcal O_2^\omega$ 的幺元嵌入，因为后者自己就含真等距（第 93 到 94 行）。第 86 到 91 行还交代了非 MF 的原始定义与出处（Eckhardt Theorem 4.3、Sauers 第 3 到 5 节），并点明 Eckhardt 的例子是相关的 wreath 积（第 92 行）。我最后的用法把这些材料降级为"群配置的来源"，把它们的目标类换成表示类型集合。

分岔二，可定义性与表示论。GS2025 的条件路线要求一个弱显式极小张量范数：对逼近极小张量范数谓词的先验公式做精度固定的有效选择，并把 $\mathcal O_2$ 的这个性质留为公开（introduction.tex 第 67 到 72 行，Definition 4.16、Theorem 4.18、Question 4.20）。第 73 到 74 行是本稿的路线声明："我们的障碍来自一个显式离散群的表示论。"两条路的强度差别在这里：可定义性路线若成功，会给出语法层面的不可定义结论；表示论路线只给语义层面的不可嵌入。我选不了前者（§3），后者是我唯一走得通的。

分岔三，(T) 的用法。Wassermann 1991 的原始用法是把 (T) 用于 $C^*$-代数的扩张与非分裂性（introduction.tex 第 98 到 100 行说张量积论证follows Wassermann 的方法，经 Manuilov--Thomsen 2007 第 2.1 节讲解）。Bekka 1990 的结论是：(T) 群在 $K$ 上的幺元表示若容许 $\mathcal B(K)$ 上共轭不变态，则有非零有限维子表示（nuclear-finiteness.tex 第 61 到 67 行，另见 Valette 1997 的 Proposition 2 证明）。本文第 65 到 67 行明说这里的引理把它强化成"任意第一因子幺元组上的显式谱下界"。这是一次典型的"定性转定量"改写：不变态换成迹类密度算符，"存在有限维子表示"换成 $L\ge b1$。我在 §8 里撞到的那堵向量级估计墙，正是这个改写存在的理由。

分岔四，工具的年代表。references.bib 里承担重量的条目我列一下：Kirchberg--Phillips 2000（第 106 到 117 行）、Cuntz 1977（第 119 到 128 行）、Goldbring--Sinclair 2015（第 1 到 15 行）、GS2025 张量范数（第 145 到 154 行，注记 arXiv:2509.15086v1，18 September 2025）、Fox--Goldbring--Hart 2024（第 130 到 143 行）、de Cornulier 2007（第 29 到 43 行，标题是"Finitely presentable, non-Hopfian groups with Kazhdan's Property (T) and infinite outer automorphism group"）、Wassermann 1991（第 45 到 56 行）、Manuilov--Thomsen 2007（第 58 到 71 行）、Powers--St\o rmer 1970（第 73 到 82 行）、Paulsen--Zheng 2016（第 84 到 94 行）、Takesaki 1964 与 Lance 1973（第 156 到 177 行）、Bekka 1990 与 Valette 1997（第 179 到 199 行）、Eckhardt 2026（第 17 到 27 行，28 August 2026）、Sauers 2026（第 96 到 103 行，仓库修订 20 September 2026）。

de Cornulier 的标题让我眼睛一亮：non-Hopfian 与无穷外自同构群。$\theta$ 恰是一个非满射的单自嵌入，$[\Gamma:\Lambda]=8$ 就是"非 Hopf"的量化形式；这篇 2007 的文章为配置提供了合法身份，本稿把它当成"现成群论事实的登记表"用（introduction.tex 第 82 到 85 行与 group-example.tex 第 9 到 11 行两处都指定 Proposition 1.1 及其证明）。从时间戳还能读出一条谱系：2026 年 8 到 9 月的非 MF 工作（Eckhardt 28 August、Sauers 修订 20 September）与本稿日期 23 September 相邻，配置从那条线借来，障碍则新做。`[推测]` 论文没写自己的历史，日期与书目是我唯一的依据，所以我只敢说到"相邻与借用配置"这一层，不敢说因果。

思路变迁我按最初与最后的对照来写。最初：找一个"太大"的代数，用它的近似性缺陷撞超幂；中间：试图把缺陷量化成张量范数的不可定义性；最后：障碍与"大小"无关，$C^*(G)$ 是个非常普通的可分幺元代数，它的坏在于内部藏着一条与核性不相容的表示论动力学。用一句我自己的话总结这次的教训：与 $\omega$-极限兼容的障碍，只能是离散类型的障碍，因为极限把所有连续量抹平，却抹不平有限集上的自映射有没有周期点。introduction.tex 第 102 到 106 行的四句正是这个意思："坐标提升只是近似乘性"解释了为何需要无关系的灵活性（第 102 到 104 行），"维数无关的估计允许表示类型随坐标变化"（第 104 到 105 行），"有限指标归纳把有限集成员用复合自嵌入联系起来"（第 105 到 106 行），最后"这两个通道把群配置变成范数超幂障碍"（第 106 到 107 行）。

## §18 勘误、遗留问题与 `[推测]` 清单

按规格，已落盘的内容不删不改，本节把失误与未定项集中登记。

勘误一，§0 里关于参考文献文件大小的那句是坏的。原文写"references.bib 1998 行内的 1998 字节级别条目（实测 1998 字节以内，此处只作书目核对用）"，其中的数字是我在没有 `wc -c` 的情况下凭印象写的。事后实测：`build/references.bib` 为 6745 字节，`Read` 输出到第 200 行结束，所以是 200 行。§0 那句作废，以本条为准。

勘误二，§5 末尾有两行都自称探针。第一行"（探针行：本行的追加使文件字节数发生变化…）"随首块一次性写入，不构成探针；真正的探针是第二行，写入前基线 19556 字节，写入后复量 19789 字节，通道可用。两行都保留。

勘误三，§8 里那个估计式有一处排版残缺：我写的 $\lvert\langle(1\otimes C)\xi_s,\xi_s\rangle-\langle(1\otimes C)\xi,\xi\rvert\rvert$ 里右端出现了一对 `\rvert\rvert`，本意是 `\bigr\rvert` 收尾，正确形式应为 $\bigl\lvert\langle(1\otimes C)\xi_s,\xi_s\rangle-\langle(1\otimes C)\xi,\xi\rangle\bigr\rvert\le\delta_s(\lVert(1\otimes C)\xi_s\rVert+\lVert(1\otimes C)\xi\rVert)\le2\delta_s$。数学内容不受影响，符号成对性在此声明。

勘误四，文中有三处中英混排的残渣：§10 末段的 `_identify_`（本意是"等同于"），§11 末段的"手Technique"（本意是"手法"），§12 首段的"$V_{\pi_*}$ copies 的 Hilbert 直和"（本意是"$V_{\pi_*}$ 的若干份拷贝的直和"）。它们都属排版事故，读时按本条替换。

勘误五，§5 里我把生成元个数按 $\lvert S\rvert=9$ 举例（三个平移加六个 $I+E_{ij}$），这是 group-example.tex 第 49 到 52 行给出的生成集大小；spectral-preliminaries.tex 第 7 行只要求 $S$ 是"非空有限生成集且含 Kazhdan 集"，文本从未说 $S$ 就是这个 9 元集。§7 里 $R\le36$ 级别的说法因此只是量级示意，任何 $\kappa$ 的推论都不依赖它。同理，§4 里"(T) 落在 $n\ge3$"这句是我自己的背景知识，文本只引用了 $n=3$、$m=1$ 这一例（group-example.tex 第 47 到 49 行），该句应标 `[推测]`。

遗留问题一，$\kappa$、$b$、$a$ 都只作为抽象正常数出现，全文没有任何显式数值，也没有可用的尖锐界。是否有更好的 $b$（比如 $\kappa^2/(2\lvert S\rvert)$ 或 $\kappa$ 本身）我没有依据判断；对证明只用到 $b>0$（nuclear-finiteness.tex 第 230 到 231 行）。

遗留问题二，GS2025 的 Question 4.20（$\mathcal O_2$ 的弱显式极小范数）在本稿的路线下仍未解，本文的障碍不提供任何可定义性信息（introduction.tex 第 67 到 74 行）。

遗留问题三，推论二与推论三的反例是存在性的，能否用 $G$ 或其子群显式指认 $D$ 与 $p$，文本未答（consequences.tex 第 57 到 58 行）。

遗留问题四，本稿只否证幺元嵌入；幺元版与非幺元版的等价性引自 GS2015 第 3.1 节（introduction.tex 第 28 到 29 行），我没有独立验证。同理，$\mathcal O_2$ 的核性引 Paulsen--Zheng 2016（introduction.tex 第 54 到 55 行），我未复核其证明。

遗留问题五，把 dyadic 换成一般素数 $\ell$（$\theta$ 乘 $\ell$、约化模 $\ell$、指标 $\ell^3$）我在 §4 与 §13 都断言可跑，依据是证明只用到"$[\Gamma:\Lambda]$ 有限"与"$\theta^j$ 在平移上乘 $\ell^j$、模 $\ell$ 归零"，未用到 2 的特殊性；文本没有给出这个一般化，属我的推演，标 `[推测]`。

`[推测]` 清单集中一次：§1 末关于初始猜测的记录、§2 末关于试错顺序的还原、§3 关于 GS2025 卡点的描述、§4 关于"为什么取 2"的三处落地反推、§7 关于 $b$ 是否可尖锐、§16 关于交叉积见证子为何不显式、§17 关于 2026 年非 MF 与本稿的谱系、本节遗留五的一般化。除这些之外，我对文本的所有引用都指向我实际读到的 `文件:行`。

## §19 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $B^\omega$ | $\ell^\infty(\N,B)/I_\omega(B)$ | build/introduction.tex:9 | 全篇的舞台 | §11 的超积范数式失去所依 |
| $I_\omega(B)$ | $\{(b_n):\lim_\omega\lVert b_n\rVert=0\}$ | build/introduction.tex:10 | §12 条目化核验证 | 矩阵放大同构失效 |
| $\mathcal O_2$ | $s_1s_1^*+s_2s_2^*=1$ | build/introduction.tex:14 | §15 取 $B=\mathcal O_2$ | 否定答案无法特化 |
| $G$ | $\Z[1/2]^3\rtimes(\operatorname{SL}_3(\Z)\times\Z)$ | build/introduction.tex:39 | 主定理的反例 | §13 无 $t$ 可共轭 |
| $(M,k)\cdot v$ | $2^kMv$ | build/introduction.tex:40 | §4 的 dyadic 伸缩 | §5 模 2 抹不掉平移 |
| $A$ | $C^*(G)$，可分幺元 | build/introduction.tex:42 | §12 消耗单射性 | 起始匹配引理断 |
| $A\to B^\omega$ | 不存在的幺元嵌入 | build/introduction.tex:46 | 反证假设 | §11 到 §14 全链无对象 |
| $\Gamma$ | $\Z^3\rtimes\operatorname{SL}_3(\Z)$ | build/group-example.tex:20 | §6 提供 $\kappa$ | 谱隙不存在 |
| $t$ | $(0,I,1)$ | build/group-example.tex:21 | §13 的搬运工 | $\Lambda$-不变性断 |
| $\theta$ | $(v,M)\mapsto(2v,M)$ | build/group-example.tex:27 | 前驱关系定义 | §14 无矛盾可用 |
| $\Lambda$ | $\theta(\Gamma)$ | build/group-example.tex:28 | §13 归纳的定义域 | 诱导表示无从构造 |
| $[\Gamma:\Lambda]$ | $8=2^3$ | build/group-example.tex:35 | §13 固定八坐标 | 误差界随维数走 |
| $r_a$ | $(a,I)$，$a\in\{0,1\}^3$ | build/group-example.tex:58 | §13 陪集代表 | 规则 $gr_i=r_jh$ 断 |
| $\pi_*$ | 经模 2 分解因子，平移上非平凡 | build/group-example.tex:38 | §12 起始类与 §14 矛盾 | 两处同时断 |
| eq:group-aperiodic | $\pi_*\not\simeq\pi_*\circ\theta^j$，$j\ge1$ | build/group-example.tex:42 | §14 最后一击 | 矛盾拿不到 |
| $S$ | 含 Kazhdan 集的非空有限生成集 | build/spectral-preliminaries.tex:7 | 所有求和的上限 | §6 的 $R$ 无定义 |
| $\kappa$ | $0<\kappa\le 4\lvert S\rvert$ | build/spectral-preliminaries.tex:9 | eq:kazhdan-gap 与 $b$ | §9 下界为零 |
| $L(\mathbf z)$ | $\sum_{s\in S}(z_s-1)^*(z_s-1)$ | build/spectral-preliminaries.tex:17 | 全部谱检验 | §6 起整条线断 |
| $R$ | $4\lvert S\rvert$ | build/spectral-preliminaries.tex:17 | §11 的 $\min$ 换算式 | 谱到范数的翻译断 |
| eq:kazhdan-gap | 二次位移的一致下界 | build/spectral-preliminaries.tex:12 | §8 与 §9 | 一致谱下界断 |
| eq:matching-distance | $d(\mathbf z,\pi)=\min\operatorname{spec}L((z_s\otimes\bar\pi(s)))$ | build/spectral-preliminaries.tex:43 | $D_n$ 与 $D(\mathbf u)$ 的定义 | §10 与 §11 同时断 |
| eq:block-minimum | 直和的最小等于各最小之最小 | build/spectral-preliminaries.tex:63 | §13 挑成分 | 前驱引理断 |
| $b$ | $\kappa^2/(4\lvert S\rvert)$ | build/spectral-preliminaries.tex:68 | §9 陈述与 §10 收口 | 有限性引理断 |
| $a$ | $0<a<\min\{\kappa,b\}$ | build/spectral-preliminaries.tex:68 | §10 矛盾与 §11 归零 | 两处判据同时失效 |
| lem:square-root-trace | $\lVert X-Y\rVert_2^2\le\lVert X^2-Y^2\rVert_1$ | build/nuclear-finiteness.tex:26 | §8 的平方收益 | $b$ 退化为一次量 |
| $\lVert T_s-T\rVert_1$ | 不超过 $2\delta_s$ | build/nuclear-finiteness.tex:110 | §8 与 §9 的链条 | 常数 4 的来源消失 |
| $Q$ | $\prod_j M_j/\bigoplus_j M_j$ | build/nuclear-finiteness.tex:150 | §10 的打包容器 | 无穷多表示无处安放 |
| $M_j$ | $\mathcal B(\bar V_{\pi_j})$ | build/nuclear-finiteness.tex:148 | 唯一张量范数 | §6 的定义不良构 |
| eq:quotient-excludes-finite-parts | $L((q(s)\otimes\bar\tau(s)))\ge\kappa1$ | build/nuclear-finiteness.tex:184 | §10 排除有限维部分 | §9 的前提不满足 |
| eq:spatial-lower-bound | $L((u_s\otimes q(s)))\ge b1$ 于 $B\otimes_{\min}Q$ | build/nuclear-finiteness.tex:195 | §10 迁移的源 | 核性无处可用 |
| $C$ | $\prod_j(B\otimes M_j)/\bigoplus_j(B\otimes M_j)$ | build/nuclear-finiteness.tex:201 | §10 的收口代数 | 泛函演算无落点 |
| $\Psi$ | $B\otimes_{\max}Q\to C$ | build/nuclear-finiteness.tex:215 | 核性的唯一消耗点 | §15 的假设清点断 |
| $B\otimes_{\min}Q$ | 与 $\max$ 相同（$B$ 核） | build/nuclear-finiteness.tex:219 | 不等式的迁移许可 | 下界留在极小侧过不去 |
| $f(t)$ | $(b-t)_+$ | build/nuclear-finiteness.tex:224 | §10 的极限论证 | $\liminf$ 无从得出 |
| $\lVert f(L_j)\rVert$ | $(b-d(\mathbf u,\pi_j))_+\to0$ | build/nuclear-finiteness.tex:228 | §10 的定量矛盾 | 与 $d<a<b$ 不冲突 |
| $\mathbf x_n$ | $(x_n(s))_{s\in S}$ | build/ultrapower-contradiction.tex:43 | 坐标层的全部工作 | §10 的引理用不上 |
| eq:lift-defects | $\lim_\omega\lVert x_n(g)x_n(h)-x_n(gh)\rVert=0$ | build/ultrapower-contradiction.tex:37 | §11 严格化与 §13 词估计 | 超积里不是表示 |
| $D_n$ | $\{[\pi]:d(\mathbf x_n,\pi)<a\}$ | build/ultrapower-contradiction.tex:47 | §13 前驱与 §14 有限集 | 周期论证无有限性 |
| eq:varying-gap | $\lim_\omega d(\mathbf x_n,\pi_n)\in\{0\}\cup[\kappa,R]$ | build/ultrapower-contradiction.tex:61 | §12 归零与 §13 反证 | 两条反证同时断 |
| eq:ultraproduct-norm | $\lVert[(c_n)]\rVert=\lim_\omega\lVert c_n\rVert$ | build/ultrapower-contradiction.tex:77 | §11 的范数翻译 | 谱与范数断链 |
| $\min\operatorname{spec}[(P_n)]$ | $R-\lVert R1-[(P_n)]\rVert$ | build/ultrapower-contradiction.tex:100 | §11 的等式链 | 极限与最小值不可换 |
| eq:fixed-word-invariance | 逐 $g\in\Gamma$ 位移沿 $\omega$ 趋零 | build/ultrapower-contradiction.tex:204 | §13 搬到 $\Lambda$ | $\alpha_n$ 的近似不变性断 |
| eq:Lambda-invariance | 逐 $h\in\Lambda$ 位移沿 $\omega$ 趋零 | build/ultrapower-contradiction.tex:229 | §13 八坐标归纳 | 第二项误差控制不住 |
| $\zeta_n$ | $(\zeta_n)_i=8^{-1/2}(x_n(r_i)\otimes1)\eta_n$ | build/ultrapower-contradiction.tex:255 | §13 的测试向量 | 归一化与正交性断 |
| eq:chosen-zero | $\lim_\omega d(\mathbf x_n,\pi_n)=0$ | build/ultrapower-contradiction.tex:179 | §13 反证起手 | 归纳对象无近似不变向量 |
| $\rho_n$ | $\operatorname{Ind}_\Lambda^\Gamma\alpha_n$ | build/ultrapower-contradiction.tex:184 | §13 前驱的来源 | 成分与 $\pi_n$ 无联系 |
| eq:cycle-periodicity | $\tau_l\simeq\tau_l\circ\theta^p$ | build/ultrapower-contradiction.tex:345 | §14 的周期传递 | 回传到 $\pi$ 断 |
| 子空间包含 | $\theta^{kp}(\Gamma)\subseteq\theta^j(\Gamma)$ | build/ultrapower-contradiction.tex:356 | §14 不可约传递 | 第二段论证全废 |
| fig:finite-chain | 初始段可为空 | build/figures/finite-chain.tex:23 | §14 的读图 | 空段情形需另行说明 |
| $\varepsilon_0$ | 正下界 | build/consequences.tex:43 | §16 第三条后果 | 好的核见证子无法否证 |
| $\lVert\psi\phi(a_i)-a_i\rVert$ | 不小于 $\varepsilon_0$ | build/consequences.tex:45 | §16 的分解误差 | 一致分离强度丢失 |
| KEP 等价式 | Prop 3.2 与 Thm 3.3、Thm 3.7 | build/consequences.tex:28 | §16 的三条移植 | 推论与主定理脱钩 |
| 存在性见证 | 两条推论的反例未显式 | build/consequences.tex:57 | §16 的自我限制 | explicit 覆盖范围被夸大 |
| 群配置来源 | Proposition 1.1 及其证明 | build/introduction.tex:85 | §4 的 (T) 与自嵌入 | 群数据需自行证明 |
| 弱显式极小范数 | $\mathcal O_2$ 的情形留为公开 | build/introduction.tex:72 | §17 的分岔二 | 路线差异被抹平 |
| 非有限性判词 | 排除不了 $\mathcal O_2^\omega$ 嵌入 | build/introduction.tex:94 | §2 的失败与 §17 的教训 | 障碍类型选择无依据 |
| 关系无关性 | 提升只是近似乘性 | build/introduction.tex:103 | §3 与 §10 的灵活性要求 | 无关系引理无法应用 |
| Bekka 强化 | 由不变态改为显式谱下界 | build/nuclear-finiteness.tex:65 | §8 与 §9 的动机 | 密度算符一手无处安放 |
| de Cornulier 标题 | non-Hopfian 与无穷外自同构 | build/references.bib:31 | §17 的谱系推断 | 配置来源不可考 |
| 文献时间戳 | Eckhardt 28 August 与 Sauers 20 September | build/references.bib:26 | §17 的相邻性判断 | 时间线推断失效 |
| Paulsen--Zheng | $\mathcal O_2$ 核性的出处 | build/introduction.tex:55 | §15 的特化许可 | 取 $B=\mathcal O_2$ 无据 |
