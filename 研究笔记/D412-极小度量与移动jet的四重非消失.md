# D412 极小度量与移动 jet 的四重非消失

## 0 登记、取材覆盖与写作契约

先落登记。下面两行是原样抄下来的队列标识，目录名的日期后缀一位没改：

preprints/Fourfold-nonvanishing-by-minimal-metrics-and-moving-jets-September-27-2026
其他队列第 235 行号

这份笔记是重建，是"正在做这项研究的我"的现场记录，它按思路走的顺序排，包括那些走不通的分支。凡是素材里没有痕迹、只能靠我猜的动机，一律标 `[推测]` 并交代缺口在哪。

一、我读了什么。`build/` 下的 `.tex` 共 11 个文件，实测字节如下：`sections/two-slot.tex` 38,631，`sections/moving-centers.tex` 20,382，`sections/signed.tex` 20,372，`sections/introduction.tex` 14,714，`sections/finite-inputs.tex` 13,123，`bibliography.tex` 11,535，`sections/reduction.tex` 7,964，`sections/analytic-inputs.tex` 3,786，`sections/conclusion.tex` 3,452，`preamble.tex` 2,953，`main.tex` 974，合计 137,886，与派单给的档位一致。

二、我按主线读全的文件：`main.tex`、`preamble.tex`、`sections/introduction.tex`、`sections/reduction.tex`、`sections/moving-centers.tex`、`sections/analytic-inputs.tex`、`sections/signed.tex`、`sections/two-slot.tex`（分两段读到第 873 行末尾）、`sections/finite-inputs.tex`、`sections/conclusion.tex`。

三、我如实申报没读的文件：`build/bibliography.tex`（11,535 字节）我只在 `main.tex` 第 29 行的装载序列里见过它的名字，正文没读，所以本笔记提到的文献出处一律只按 `.tex` 正文里出现的引用键名转述，没有核对条目本身，这是本稿最大的一个缺口；`typst/` 目录（`main.typ` 与 `fig/`）按规格属分片，不作素材；`README.md` 只当索引；`paper.pdf` 与 `typst/main.pdf` 一律没开，也没跑任何文本抽取工具；`lean/`、`formalization.yaml`、`comparator`、`records.txt` 没碰；没有执行任何 git 命令。

四、记号可移植的处置。`preamble.tex` 里有四类只有本稿才认的自定义宏：单字母或双字母的黑板体域记号宏、花体层记号宏、把算子名注册成一两个字母的命令、以及配对取整命令与跨节引用命令。本笔记正文与台账一律写标准形式：域记号写 `\mathbb{C}`、`\mathbb{Q}`、`\mathbb{R}`、`\mathbb{Z}`、`\mathbb{N}`、`\mathbb{P}`，层记号写 `\mathcal{O}`、`\mathcal{I}`、`\mathcal{J}`，算子写 `\operatorname{ord}`、`\operatorname{mult}`、`\operatorname{rk}`、`\operatorname{vol}`，取整用 `\lfloor` 与 `\rfloor`、`\lceil` 与 `\rceil` 成对写出，指向本稿某处只写"第 N 节"或"式 (N.M)"。我上面只给类别描述，没写任何一类宏的名字，连"我拒绝使用它们"的那段也不写出来。

五、取证与落盘。本单素材取证调用 14 次，上限 15 次，未越界。探针写在系统临时目录，基线 15 字节，追加一行后复量 47 字节，然后删除；`研究笔记/` 与 `.tools/` 下没有临时文件，仓库根没有探针残留。本稿首次落盘在第 19 次调用。

## 1 我手上的问题只有一句，可我一开始以为它离已知结果很近

目标是：$X$ 为光滑连通射影复四折，$K_X$ 伪有效，则存在正整数 $m$ 使 $H^0(X,mK_X)\ne0$。素材的摘要就这一句（`build/main.tex:14-17`）。定理不对数值维数、$q(Y)=h^1(Y,\mathcal O_Y)$、$\chi(Y,\mathcal O_Y)$ 加任何条件，结论是定性的，不给 $m$ 的一致界（`build/sections/introduction.tex:26-28`）。这两点后来决定了我所有的构造。

伪有效是一句关于数值类的陈述：$K_X$ 的数值类落在有效除子数值类的闭包里。结论却是关于实际线丛 $\mathcal O_X(mK_X)$ 的全局截面。中间的沟就是整篇论文。素材引言第一段还给了一个把问题改写的钥匙：在 $\mathbb C$ 上 $K_X$ 伪有效等价于 $X$ 不被有理曲线扫遍（`build/sections/introduction.tex:9-13`），于是非消失说的其实是"非常值一类的光滑射影 varieties 都带典范形式"。我一开始被这句话误导过，理由见第 2 节。

三维的结果给我两样东西，历史坐标和可用的低维机件。Miyaoka 先证极小三维流形的非消失，再证数值维数一的丰沛。Kawamata 的多典范系统与极小三维流形丰沛定理把典范情形铺开。Keel--Matsuki--McKernan 给出三维对数丰沛（素材还提到需要一处补正）。Fujino 的半对数正则三维流形丰沛定理在整条约化 floor 上给出截面生成，导子的粘合也已经处理（`build/sections/introduction.tex:30-43`）。最后一句当时我看过去了，后来它在第 10 节变成命门。

四折的已知情形是一堆按不变量切开的碎片。Fujino 证明典范四折在 $K$  nef 且 $q>0$ 时半ample，并把"$q=0$ 的非常值四折的非消失"与"Kodaira 维数零时剩下的丰沛问题"分开列成问题。Lazić--Peternell 处理 $\mathbb Q$-factorial terminal 射影极小、典范数值维数一且 $\chi\ne0$ 的情形。Ambro 的典范丛公式提供另一条归约：$K$  nef 的 klt 伴随若其 nef 收缩的像维数更低，就交给低维的极小模型程序与丰沛。素材在这里特意提醒两个"维数"的差别：nef 收缩按"通过极一般点的零度曲线"来收缩，其像维数是 nef 维数；数值维数按 $K$ 的非零交幂定义；两者互不相干（`build/sections/introduction.tex:45-62`）。Hashizume 的归约把我的光滑定理转成对数情形：$n$ 维光滑典范非消失蕴涵维数不超过 $n$ 的带实边界的对数正则偶与对数极小模型的相应陈述（`build/sections/introduction.tex:64-70`）。刘--徐的预印本处理维数不超过五、Iitaka 维数非负且数值维数不超过一的对数正则偶的好极小模型，它的假设里已经把非消失写进去了（`build/sections/introduction.tex:90-95`）。

我最初的猜想很朴素。既然碎片按 $(\nu,\ q,\ \chi,\ \text{nef 维数})$ 这些不变量切开了空间，那剩下的情形大概就是把这些机件拼起来，再补一个"所有不变量都退化的极端情形"的专门论证。我以为新东西只在那个极端情形里，规模大概一节。这个猜测错得厉害：真正的新东西是整条链，而它跟我列的那些不变量一点关系都没有，定理的陈述里连一个都不出现。

## 2 第一条走不通的路：把丰沛定理当入口，以及三个同伴死路

死路之一，先上丰沛。我最初想把问题直接交给四折丰沛机件：$K$ 是 nef 的，只要证明 $\kappa(Y,K)\ge0$，Gongyo--Matsumura 的四折判据就能把非消失转成半ample。素材里确实用了这个判据（`build/sections/introduction.tex:181-184`，`build/sections/signed.tex:442-459`），但用途完全反过来：判据要求偶是射影 klt、边界有理、伴随的 Kodaira 维数非负，并且在指定的对数消解上存在带零 Lelong 数的半正奇度量。也就是说它把"已有第一节"当作输入。用它来造第一节就是循环论证。素材对顺序的强调很直白："这个顺序要紧：判据是在第一节拿到之后才用的"，见 `build/sections/introduction.tex:183-185` 的对应表述。我把它读成对我这条路的正面拒绝。

死路之二，把实际线丛换成数值等价类。伪有效是数值陈述，我自然想在数值层面做完全部估计，只在最后一步"下降"到线丛。这条路被素材一句话堵死：解析输入说的关于实际的有理线丛，数值等价不够（`build/sections/introduction.tex:165-166`，`build/sections/analytic-inputs.tex:8`）。我后来明白它为什么不够：零 Lelong 数的半正度量是对具体有理线丛 $\pi^*D_H$ 说的，内点单射比较的也是 $L-C_0$ 与 $L-C_2$ 这两个实际残丛上的度量，两者都不保持数值等价类。凡是把系数向量当成 cone 里的点的做法，在这里都会丢信息。

死路之三，在 $Y$ 上直接做 Seshadri 估计。既然目标是控制截面在一点 $x$ 的消灭阶，最省事的办法是让一个 ample 类 $H$ 满足 $\varepsilon(H;x)$ 很大，然后按定义推 $\operatorname{ord}_x(s)\le (H\cdot C)/\varepsilon$ 型的不等式。但反证假设下 $K$ 是 nef ，并非大，$K^4=0$（`build/sections/reduction.tex:42-43`），任何贴着 $K$ 的扰动其体积都趋于零，Seshadri 常数在这一点上不肯给一致的正下界。素材实际的做法是把局部正性问题搬到一个维数为 $9$ 的丛上，那里的极化体积随权 $q$ 线性增长，见第 11 节。$Y$ 本身承担不了这个任务。

死路之四，指望 Iitaka 纤维化。反证假设就是 $\kappa(Y,K)=-\infty$，纤维化根本不存在。素材用的是 nef 收缩的曲线性质：$K\cdot C>0$ 对通过极一般点的每条整曲线成立（`build/sections/reduction.tex:54-59`）。我一开始把这两件事混为一谈，写笔记时才发现它们提供的信息量差别很大：曲线性质只给"正"，而 Cartier 指标 $\iota$ 才把它升级成一致下界 $K\cdot C\ge1/\iota$。

## 3 反例应该长什么样：把一个terminal 四折钉死

我现在的策略是反证。假设四折非消失失败，先跑典范极小模型程序。翻转的存在性用常规机件，终止性用 Chen--Tsakanikas 关于伪有效四折的定理，按素材的说法是"以零 nef 部分、零边界施加到偶对"；除子收缩降 Picard 数，于是整个程序终止；伪有效被保持并排除 Mori 纤维空间作为终点。得到射影 $\mathbb Q$-factorial terminal 极小模型 $Y$，记 $K=K_Y$。足够可除度的典范截面空间在这里是双有理不变的：公共消解上两侧差是有效例外除子，往前推不会添截面。于是 $\kappa(Y,K)=-\infty$，$K$ nef 而不大，$K^4=0$（`build/sections/reduction.tex:27-43`）。

然后三条硬性质被逐条挤出来。terminal 奇点是奇点，所以 $q(Y)$ 等于消解的不规则度；若 $q(Y)>0$，Fujino 的结论让 $K$ 半ample，矛盾，故 $q(Y)=0$。若 nef 维数不超过三，Ambro 的典范丛公式连同已确立的低维对数极小模型程序与对数丰沛会让 $K$ 半ample，素材特别注明这也涵盖 nef 维数零，故 nef 维数是四。最后取 $\iota>0$ 使 $\iota K$ Cartier，一条整曲线上的次数是整数，配上 nef 收缩的曲线性质，就有
\[
 K\cdot C\ \ge\ \frac1\iota
\]
对所有通过固定极一般位域 $Y^{\mathrm{vg}}$ 的整曲线 $C$ 成立（`build/sections/reduction.tex:16-24`、`build/sections/reduction.tex:54-59`）。这个 $1/\iota$ 是全文最省一笔却最要命的不等式，后面每一次矛盾都撞在它上面。

第二条命题把 $Y^{\mathrm{vg}}$ 上方的所有真正维数子族都变成一般型（`build/sections/reduction.tex:62-151`）。它的证明我一开始读得很不顺，卡点有两处。第一处是"切族"。Hilbert 概形给出可数多个有限型参数空间；分层、消解万有族、一般光滑性给出可数多个光滑族 $b:\mathcal V\to B$ 连同 $e:\mathcal V\to Y$，纤维是其像的消解且纤维映射双有理到像。对一般纤维维数 $d$ 的支配族，需要把参数空间切到维数 $4-d$，好让 $e$ 成为一般有限支配。素材给的理由是：与 $Y$ 的一般点关联的参数在那个"纤维映射是一般嵌入"的开集上有一个维数为 $\dim B-(4-d)$ 的分支，而 $B$ 的一个紧化的充分一般 ample 完全交在该分支上截出有限个点；再把这些切取取一般，切片的极一般点就保留原族每个多_genus 的一般值，而这种条件只有可数个。我一开始以为一般上半连续就够，不需要这么绕；后来才明白不切的话 $e$ 的纤维维数太大，第 2 节里那条零度曲线根本没法说"通过极一般点"。

第二处是"避中心"。若一般纤维 $V$ 不是一般型，则 $V_{\min}$ 的半ample 典范丛定义态射，其一般纤维正维数且某倍数在其上平凡，于是公共消解 $\widetilde V$ 上通过极一般点有一条 $K_{\widetilde V}$-度为零的完备曲线。素材在这里补了一段规避论证：terminal 模型的奇轨迹与各例外除子的中心余维至少二；一般纤维要么避开给定的竖直中心，要么在余维至少二处碰到支配的中心；纤维中通过指定极一般点的一般充分 ample 完全交就能避开所有这类中心，纤维本身一维时纤维自身即可。其严格变换由例外差异公式得典范度零。把 $K_V\sim_{\mathbb Q}e_V^*K+E_V$ 拉到 $\widetilde V$ 并加上 $\widetilde V\to V$ 的有效差异，得 $K_{\widetilde V}\sim_{\mathbb Q}\widetilde e^{\,*}K+\widetilde E$，$\widetilde E\ge0$。选点在 $\operatorname{Supp}\widetilde E$ 外、也在双有理映射的例外轨迹外，曲线就不含在 $\widetilde E$ 里，它在 $Y$ 中的像是曲线，拉回的 $K$-度 $\le0$；支配性允许我把点选在 $Y^{\mathrm{vg}}$，与 $1/\iota$ 冲突。最后用多_genus 的上半连续把"一般纤维一般型"升到"整族一般型"，再排除非支配族，可数性给出要的极一般位域。

我现在的判断是：第 3 节没有一个新想法，全是把已有机件按顺序拧紧；但它决定了后面所有"通过极一般点"的句子合法。素材在结论段之前留下的那句提醒我很在意：模型固定不动，只有它的 ample 扰动在变（`build/sections/reduction.tex:9-10`、`build/sections/reduction.tex:153-157`）。固定 $Y$、让极化变，这条纪律在第 4 节变成尺度设计。

## 4 尺度设计：体积钉死在小处，曲线度送向无穷

我取固定的 very ample Cartier 除子 $A$，对固定的正有理数 $\epsilon$ 与趋于零的正有理数 $t$ 令
\[
 \mu_t=\bigl((K+tA)^n\bigr)^{1/n},\qquad r_t\in\mathbb Z_{>0},\qquad r_t\mu_t\longrightarrow\epsilon,\qquad L=L_t=r_t(K+tA),
\]
$r_t$ 可以取 $\epsilon/\mu_t$ 的四舍五入（`build/sections/moving-centers.tex:14-20`）。$K$ nef 而不大，故 $\mu_t>0$ 且趋于零，于是
\[
 r_t\longrightarrow\infty,\qquad L_t^{\,n}\longrightarrow\epsilon^n,\qquad L_t\cdot C\ \ge\ r_t/\iota .
\]
素材紧跟着插了一句提醒：这里的 $r_t$ 与推论里规定的 Cartier 指标 $r$ 毫无关系（`build/sections/moving-centers.tex:29-30`）。我把这句当成对我先前一个混淆的纠正：我一度以为规定的指标 $r$ 会在证明里被用掉，实际上它只在最后第 14 节的有理可行引理里出现。

这套尺度的意图是造一对拉锯。上侧：由第 6 节的障碍引理，任何"持续存在的移动基分量"都会产出一条通过 $Y^{\mathrm{vg}}$ 的曲线，其 $L_t$-度 $\le(bC_1)^{f-1}C_0$，右端只依赖 $f,C_0,C_1$。下侧：同一条曲线的 $L_t$-度 $\ge r_t/\iota\to\infty$。要让拉锯闭合，我必须保证上侧那两个常数在 $t\to0$ 时不动。这就是我把 $\epsilon$ 固定、只让 $t$ 变小的原因。

这里我走过一个小弯路，值得记下来。我最初想让 $\epsilon$ 也随 $t$ 变小，以为$\epsilon$ 越小的极化越"贴近 nef 射线"，估计越锋利。失败的原因要到第 13 节才暴露：终局矛盾用到两个数值条件 $(14\epsilon)^n<1/4$ 与 $80\epsilon<3/4$，它们要求 $\epsilon$ 是一个先钉死的数；素材在有限数据那一节明确写了"选一个足够小的正有理数 $\epsilon$"并把它固定下来（`build/sections/finite-inputs.tex:57-60`），双槽那节开头也写"$\epsilon$ 在本节全程固定"（`build/sections/two-slot.tex:12`）。$\epsilon$ 若跟着 $t$ 跑，那两个不等式就变成动态的，而我要证的秩差恰恰靠它们的静态余量。

还有一个我起初觉得可疑、后来才欣赏的设计：$r_t$ 一人打两份工。它一方面把曲线度下界 $r_t/\iota$ 推高，另一方面在典范界里给出支配 $K\le P_{\mathrm s}/(2r_t)$ 与 $K_\Sigma\le L_\Sigma/r_t$（`build/sections/moving-centers.tex:434`、`build/sections/two-slot.tex:130-131`）。$r_t$ 越大，基分量的典范交就压得越死。我一开始担心"同一个参数既要大又要小"会造成矛盾需求，检查后才清楚两处需求同向，都是 $r_t\to\infty$；真正的张力在别处，在 $\delta$ 与 $q$ 的选择上，见第 11 节。

## 5 移动中心的三件工具，以及我为何必须用整个 kernel

第一件是数值形式的通用子伴随。设 $Z$ 射影 $\mathbb Q$-factorial klt，$\Theta\ge0$ 有理，$V\subset Z$ 整子簇，$(Z,\Theta)$ 在 $V$ 的一般点处 lc，且有一个 lc 位的中心恰为 $V$；记 $f=\dim V$，$P$ 为 $Z$ 上 nef 有理 Cartier 除子，$\rho:V^*\to V$ 是过正规化的光滑射影消解，则
\[
 K_{V^*}\cdot(\rho^*P)^{f-1}\ \le\ (K_Z+\Theta)|_V\cdot(P|_V)^{f-1}
\]
（`build/sections/moving-centers.tex:61-78`）。素材对它的来历交代得很谨慎：Kawamata 的最小中心定理与 Fujino--Gongyo 的无扰动形式是先驱，但这一条允许中心只在一般点 lc、且不要求最小，也不要求 $V$ 的正规化 $\mathbb Q$-Gorenstein；证明在 companion 里用到 dlt 层、秩一般一的模、b-nef 模与有限底 ramification。我把这段当成一个诚实声明：本稿并没有重证它，只在 `build/sections/moving-centers.tex:80-81` 指回 companion 的对应引理。这是我的第二个大缺口，我在第 15 节把它列进我不信任的地方。

第二件把"高重数的基分量"翻译成两个交界。设 $Z$ 射影 $\mathbb Q$-factorial klt 维数 $d$，$P$ ample 有理 Cartier，$kP$ Cartier，$0\ne\mathcal H\subset H^0(Z,\mathcal O_Z(kP))$ 基轨迹真、基理想 $\mathfrak b$；$V$ 是维数 $f<d$ 的整基分量，在其一般点 $\eta_V$ 处孤立，且 $\eta_V\in Z_{\mathrm{sm}}$；记 $a=d-f$，$\mathfrak m$ 为局部极大理想。若 $\mathfrak b\mathcal O_{Z,\eta_V}\subset\mathfrak m^h$，则
\[
 P^f\cdot V\ \le\ (k/h)^aP^d,
\]
并且 $f>0$ 时有有理数 $c$ 满足 $0<c\le ak/h$，在光滑消解 $V^*$ 上
\[
 K_{V^*}\cdot P^{f-1}\ \le\ (K_Z+cP)|_V\cdot P^{f-1},
\]
其中 $\Theta\sim_{\mathbb Q}cP$ 有效，$(Z,\Theta)$ 在 $\eta_V$ 处 lc 并有中心为 $V$ 的 lc 位（`build/sections/moving-centers.tex:90-123`）。次数估计允许 $f=0$，典范估计只对正维数 $V$ 陈述。这个不对称后来在第 7 节被我用来排除"零维基分量"，很省事。

第三件才是新的力气所在：对移动标记点的整族 jet 核做参数微分。给定 $\tau_0<\tau_1<\cdots<\tau_d$，间距 $\tau_{i+1}-\tau_i=\delta$，$\mathcal H_i(x)$ 是 $kP$ 中在 $x$ 处消灭阶至少 $\lceil k\tau_i\rceil$ 的整个子空间。若 $k\delta\ge4$，则经过代数参数扩张与开Restriction 之后，存在不可约参数空间 $T$、一个固定的相邻层对、以及同时出现在两个基轨迹里的整子簇族 $V_t$，其结合 $\Gamma=\{(t,z):z\in V_t\}\subset T\times Z$ 支配 $Z$；一般 $V_t$ 维数在 $[1,d-1]$，在自身一般点处是较高基轨迹的孤立分量，且较高的整个级数基理想在其中含于
\[
 \mathcal I_{V_t}^{\,h},\qquad h=\lceil k\delta/2\rceil,\qquad k/h\le 2/\delta ,
\]
这些是光滑开集里的通常理想幂（`build/sections/moving-centers.tex:141-188`）。

我的错误路线在这里被素材点破，我照着写下来。我原本打算只挑一个"我自己选出来的高 jet 子列"来做微分，觉得这样更可控。失败原因在 `build/sections/moving-centers.tex:216-220`：对参数求 $r$ 阶导使在 $x(t)$ 处的消灭阶至多降 $r$，只要
\[
 r\ \le\ \lceil k\tau_{i+1}\rceil-\lceil k\tau_i\rceil
\]
该导数就落在整个较低核里，右端至少 $k\delta-1$，因此所有阶数小于 $h=\lceil k\delta/2\rceil$ 的导数都在较低核里、都在 $\Gamma$ 上消灭；而这一步"只有用整个核才成立：随意选的子列未必含这些导数"。也就是说这条我不能说（规格禁这条句式，我改说：这条正是我先前做法的致命处）。可控性换来的代价是导数留在子列外，估计整个断掉。

把消灭升格为通常理想成员，素材走的是隐函数定理那一套：在一般的光滑结合点，$\Gamma\to Z$ 是子浸，参数方向张出其法空间；取参数坐标 $t=(t',t'')$ 使 $\Gamma$ 写成 $t'=F(t'',z)$；固定 $t''$ 与 $z$ 时对 $t'$ 求导恰是对法坐标 $u=t'-F(t'',z)$ 求导；于是所有次数低于 $h$ 的法向 Taylor 系数消失，得 $s\in\mathcal I_\Gamma^h$；解析局部环在代数局部环上忠实平坦，故代数侧同样成立；框架截面有限，故整个结合基理想在 $\Gamma$ 的一个稠密代数开集上被包含（`build/sections/moving-centers.tex:221-233`）。我读这段时最初以为"消掉法向 Taylor 系数"就够了，其实还得说明包含是对整个理想、不只对个别截面，否则第 5 节第二件工具的假设 $\mathfrak b\subset\mathfrak m^h$ 无法满足。

另一处我起初当作技术细节、后来发现是合法性的地方：限制到纤维的性质。可以选一个一般结合点，使基支撑只含 $V_t$，并且 $V_t$ 在其像的光滑开集上光滑；再假设该点所在的纤维分量 $F$ 在所考虑的整环境纤维分量中是真包含的，则限制后的级数非零、基理想含于通常的 $\mathcal I_F^h$、$F$ 在其中是孤立基分量。素材特意为这条加了免责声明：这是关于所选点处的局部概形纤维，并不声称每条纤维都横截；$F$ 附近的平滑性、投影性、klt 这些前提要在每次应用时逐一验证（`build/sections/moving-centers.tex:175-187`）。我在第 11 节用到它两次，两次都回头补了这些验证。

## 6 有界度曲线障碍：把两个交界变成一条曲线

障碍引理把前面所有数值信息汇聚成一句"不可能"。固定 $f\ge1$ 与正常数 $C_0,C_1$。若对任意小的 $t$ 都存在维数 $f$ 的光滑射影 $V_t^*$、其上的约化简单交叉除子 $G_t$、nef 有理除子 $P_t$、态射 $e_t:V_t^*\to Y$，满足
\[
 K_{V_t^*}+G_t\ \text{big},\qquad 0<P_t^f\le C_0,\qquad (K_{V_t^*}+G_t)\cdot P_t^{f-1}\le C_1P_t^f,
\]
$e_t$ 一般有限到其正维数像且像碰到固定的极一般位域，并且 $P_t-e_t^*L_t$ nef，则这一切对充分小的 $t$ 不可能发生；$G_t=0$ 就是通常的一般型（`build/sections/moving-centers.tex:262-281`）。

证明的第一拍是"一般型给一致的双有理线性系"。维数 $f$、adjoint big、系数在固定 DCC 集 $\{0,1\}$ 内的射影 lc 偶有一致的有效双有理界：存在整数 $b=b(f)$ 使 $\lvert b(K_{V_t^*}+G_t)\rvert$ 双有理。消解其基理想，记自由移动除子为 $H_b$。固定除子有效，故
\[
 H_b\cdot P_t^{f-1}\le b(K_{V_t^*}+G_t)\cdot P_t^{f-1}\le bC_1P_t^f .
\]
$H_b$ 与 $P_t$ 都是 nef 且 big（$P_t^f>0$ 给出 big），对混合交用 Khovanskii--Teissier 的对数凹性，$f>1$ 时
\[
 P_t\cdot H_b^{f-1}\ \le\ \frac{(P_t^{f-1}\cdot H_b)^{f-1}}{(P_t^f)^{f-2}}\ \le\ (bC_1)^{f-1}P_t^f\ \le\ (bC_1)^{f-1}C_0 ,
\]
理由是正数序列 $P_t^{f-i}H_b^i$ 的相邻比值递减（`build/sections/moving-centers.tex:283-309`）。第二拍是过选点切 $f-1$ 个一般成员，得到真有效曲线圈；在双有理像上它们是过同构开集内一点的一般超平面，故拉回没有正维数基分量。过选点的那条分量 $C$ 非平凡地映到 $Y$，于是
\[
 L_t\cdot e_t(C)\ \le\ e_t^*L_t\cdot C\ \le\ P_t\cdot C\ \le\ P_t\cdot H_b^{f-1}\ \le\ (bC_1)^{f-1}C_0,
\]
第一个不等式里只是把归一化到像的正次数映射的度数丢掉了；$f=1$ 时直接用 $V_t^*$ 本身作 $C$，得 $L_t\cdot e_t(C)\le P_t\cdot C\le C_0$。下界 $r_t/\iota$ 趋于无穷，上界只依赖 $f,C_0,C_1$，矛盾。若同时出现多个维数 $1\le f\le n$，取有限个常数的最大值。

第三拍是我原先最容易略过、而素材花整段来写的一段：三个选点条件的相容性。我要的点必须同时落在 $H_b$ 的双有理态射对其像开集是同构之处、$e_t$ 拟有限之处、并且像点在 $Y$ 的固定极一般位域里。素材的展开是这样的：把被排除的 $Y$ 的子集写成可数个真闭子集之并；$e_t$ 的像不含其中任何一个，因为它碰到它们的补；于是它们的逆像是 $V_t^*$ 中的真闭子集，可以和有限个稠密开条件一起避开。对扫过的族，要先选一个不属于任何被排除子集的一般成员，再在那成员上选点（`build/sections/moving-centers.tex:311-322`）。我最初在这里只写"取一般点即可"，这个偷懒在第 11 节会付出代价，那里的移动中心族同样扫过 $Z$，我必须回到这段来把顺序写对：先选成员，再选点。

我还注意到素材在陈述这个引理时特意保留了约化边界 $G_t$，理由是双槽那一节的用法是对数形式的（`build/sections/moving-centers.tex:256-258`）。这是"为了后面一处应用而把陈述加强"的例子，我在第 9 节的多重截面情形里确实用到了 $G_t\ne0$。

## 7 数字收口：标量阶的一致上界

标量极化取 $P_{\mathrm s}=2r_t(K+2tA)$，并令 $\rho_t=(P_{\mathrm s}^{\,n})^{1/n}$。由 nef 序下的 $2L\le P_{\mathrm s}\le 4L$，把 $t$ 减小后有
\[
 \epsilon\ \le\ \rho_t\ \le\ 8\epsilon
\]
（`build/sections/moving-centers.tex:354-368`）。真正被用到的只有"存在正下界"与"上界是 $8\epsilon$"这两条。命题是：对充分小的正有理 $t$，$Y_{\mathrm{sm}}$ 中极一般点 $x$ 满足：对每个使 $kP_{\mathrm s}$ Cartier 的正整数 $k$ 与每个非零截面 $s\in H^0(Y,\mathcal O_Y(kP_{\mathrm s}))$，
\[
 \operatorname{ord}_x(s)\ \le\ 4k\rho_t\ \le\ 32k\epsilon .
\]

证明的思路我先讲它的骨架，再讲我在骨架上摔过的两处。骨架是：把 $H^0(Y,\mathcal O_Y(kP_{\mathrm s})\otimes\mathcal I_x^a)\ne0$ 看成 $Y_{\mathrm{sm}}$ 上 jet 赋值映射的秩条件，把 $x$ 选在可数个秩跃变轨迹之外；若界在某点失败，则相应高阶核在一般标记处也非零；把出问题的截面取幂，就在任意大的可除度上保持同一严格不等式，于是可以随意选"充分大的可除 $k$"。然后取 $n+1$ 个从 $2\rho_t$ 等距排到 $3\rho_t$ 的层，间距 $\delta_{\mathrm s}=\rho_t/n$；若 $\operatorname{ord}_x(s)>4k\rho_t$，每一层核都非零。

第一处摔跤：我原以为最低层核的基轨迹在 $x$ 处可能只是一个孤立点，那样就没有正维数中心可追。素材用一个纯数值排除处理了它：最低核的基理想在 $x$ 处含于 $\mathfrak m_x^{\lceil 2k\rho_t\rceil}$，于是第 5 节那条次数估计的零维情形给出
\[
 1\ \le\ \left(\frac{k}{\lceil 2k\rho_t\rceil}\right)^n P_{\mathrm s}^{\,n}\ \le\ 2^{-n},
\]
$n=4$ 时是 $1\le 1/16$，荒谬。这里我用到的正是第 5 节那句"次数估计包括 $f=0$"，那一刻我才明白为什么基分量引理要把两个估计的适用范围写成不一样的。

第二处：有了支配的移动中心族 $V$（维数 $1\le f<n$），其较高整个 jet 核在 $V$ 一般的基理想是 primaries 且含于 $\mathcal I_V^h$，$h=\lceil k\delta_{\mathrm s}/2\rceil$，$k/h\le 2/\delta_{\mathrm s}$。基分量引理给
\[
 P_{\mathrm s}^{\,f}\cdot V\ \le\ (2/\delta_{\mathrm s})^{n-f}P_{\mathrm s}^{\,n},\qquad
 K_{V^*}P_{\mathrm s}^{\,f-1}\ \le\ \left(\frac1{2r_t}+\frac{2(n-f)}{\delta_{\mathrm s}}\right)P_{\mathrm s}^{\,f}\cdot V ,
\]
第二个用了 $K\le P_{\mathrm s}/(2r_t)$（`build/sections/moving-centers.tex:422-434`）。右端常数由 $\epsilon\le\rho_t\le 8\epsilon$ 控制，与小的 $t$、与 $k$、与成员 $V$ 都无关；$V$ 的像在 $Y^{\mathrm{vg}}$ 里，故 $V^*$ 一般型；$P_{\mathrm s}$ 在 nef 序下支配 $L$。第 6 节的全部前提就位，矛盾。

最后一步我起初以为只是收尾，其实是这整个命题最要紧的一句：这些界不依赖最初发生过度消灭的那个次数。所以一次把 $t$ 取得足够小之后，所有 Cartier 倍数在同一点都满足 $\operatorname{ord}_x(s)\le 32k\epsilon$（`build/sections/moving-centers.tex:449-453`）。这就是"对所有 $m$ 一致"的来源，而定理的结论只要求存在一个 $m$；我从这里看出反证假设的强度其实被我超额用掉了。素材在结论前的那句"结论只给定性、不给 $m$ 的一致界"与此形成有趣的对照：界是关于消灭阶的一致，不是关于次数的一致。

## 8 有符号代表从哪来，以及我第一版处理它的方法

有符号除子出现在双槽论证的一个切片里，它的来源值得先记住，因为它决定了第 9 节所有构造的形状。切片丛是 $\mathbb P(\mathcal O_Y\oplus\mathcal O_Y(\iota K_Y))$，两个直和项定出两条不相交的截面（素材称它们为轴）。一条次数 $e>0$、且与这两条轴都不同的整多重截面与它们相交，推到 $Y$ 上得到有效除子 $D_0,D_\infty$，满足
\[
 D_0-D_\infty\ \sim\ e\iota K_Y
\]
（`build/sections/two-slot.tex:725-744`）。于是 $K_Y$ 的一个代表带符号，$J=(D_0-D_\infty)/(e\iota)\sim_{\mathbb Q}K$ 就是实际的有符号有理代表。素材强调边界是两侧支撑的约化并集，"包括在差里被抵消掉的那些分量"（`build/sections/signed.tex:13-18`）。

我的第一版做法是：把 $J$ 的正部 $J_+$ 当边界，声称 $(Y,J_+)$ 已经够用。这条路在命题的陈述处就被否掉了。命题要求 $D_W$ 是包含 $J$ 的真支撑以及每个 $p$-例外除子的约化简单交叉除子，然后断言 $K_W+D_W$ big（`build/sections/signed.tex:27-37`）。丢掉抵消分量就会丢掉 $D_W$ 的一部分，而我要的恰恰是"整条支撑的一般型"，因为第 6 节的障碍引理要在 $G_t\ne0$ 的情形下用。更硬的一条理由是：负系数使得 $(Y,J)$ 连偶对都不是，一切 lc 语言必须建立在支撑上、建立在一个我另外造出来的边界 $B$ 上，这是第 9 节全部工作的动机。

命题的证明从"先压缩 Kodaira 维数"开始。记 $P_W=K_W+D_W$，terminality 给 $K_W=p^*K_Y+E_W$，$E_W\ge0$，故 $K_W$ 与 $P_W$ 都伪有效。假设 $P_W$ 不大。若 $\kappa(P_W)>0$，取足够可除的 $bP_W$ 的移动子系并消解它给出的有理映射，写 $\pi:\widetilde W\to W$、$f:\widetilde W\to U$，有
\[
 b\pi^*P_W\ \sim\ f^*\mathcal O_U(1)+F,\qquad F\ge0 .
\]
$f$ 若一般有限则 $P_W$ big，违背假设；否则 $0<\dim U<4$，$\widetilde W$ 极一般点上的光滑纤维分量双有理于 $Y$ 中碰到 $Y^{\mathrm{vg}}$ 的真子簇，故一般型。于是某个 $j>0$ 使 $jK_{\widetilde W}-H_0$ 在该纤维上有非零截面（$H_0$ 是 $\widetilde W$ 上固定的 ample Cartier），光滑纤维的不同分量互不相交所以可以令截面在其余分量为零；再在"每个整数 $j$ 的截面空间纤维维数取一般值"的点上取纤维，这一步只需要排除可数多个条件。于是 $f_*\mathcal O_{\widetilde W}(jK_{\widetilde W}-H_0)$ 对某个 $j$ 一般非零，乘以足够大的 $\mathcal O_U(c)$ 后有非零全局截面，得
\[
 jK_{\widetilde W}+cbf^*\mathcal O_U(1)-H_0\ \sim\ E_0,\qquad E_0\ge0,
\]
左端减去 $H_0$ 之前是 big 的。素材在这里插了一句"For completeness"的补充论证：ample 除子 $H_0$ 的推前也是 big，办法是取 $W$ 上固定 ample $H_W$ 与小正有理 $\eta$，使 $H_0-\eta\pi^*H_W$ ample，再推前一个有效有理代表（`build/sections/signed.tex:93-96`）。我第一版在这里跳过了，理由是我以为"双有理推前保持 big"是一句话的事；实际上 $H_0$ 是被减掉的那一项，不减掉它就没法把截面空间从纤维搬到整体上，所以必须先确认它自己就是 big 的推前。这是一处典型的"作者替读者补的洞"。合并起来得到 $jK_{\widetilde W}+cb\pi^*P_W$ big，双有理推前给 $jK_W+cbP_W$ big，再由
\[
 (j+cb)P_W=jK_W+cbP_W+jD_W
\]
得出 $(j+cb)P_W$ big，与假设矛盾。故 $\kappa(P_W)\le0$。

接着跑 $(W,D_W)$ 的 dlt 对数极小模型程序。素材用的是 klt 偶的翻转存在性、常规 dlt 收缩性质、以及伪有效 lc 四折的翻转终止性（按零 nef 部分施加）。我读这段时最警惕的是那句"这里需要的 dlt 翻转是这样得到的：把有限多个边界系数同时压低一点点，同时保留给定极值射线的负性"（`build/sections/signed.tex:112-121`）。相对 Picard 数一的收缩上，原伴随与扰动后的负伴随成有理比例的正比；收缩定理把二者数值平凡差的某个 Cartier 倍下降下去，于是 klt 翻转对原伴随也保持所需正性。我的重建是：这一段的存在说明文献里的终止性定理多以 klt 陈述，而我的偶 $(W,D_W)$ 边界系数全是 $1$，是 dlt ，并非 klt，我必须自己造一条把 klt 结果搬过来的通道。除子收缩只有有限多个，伪有效在每步推前与严格变换下保持，并用一般纤维中的覆盖曲线交来排除负纤维空间；$\mathbb Q$-factorial 模型上数值除子类上的推前是良定义的，因为公共消解上它就是"先拉回再推前"，例外除子类不带来歧义。得到射影 $\mathbb Q$-factorial dlt 极小模型 $(Z,D_Z)$，全程没有抽出除子。记
\[
 M=K_Z+D_Z,\qquad \kappa(M)=\kappa(P_W)\le0,
\]
$D_Z$ 约化，$M$ nef，$K_Z$ 伪有效。有符号代表在此给出额外一条线性关系：$P_W\sim_{\mathbb Q}p^*J+E_W+D_W$，右端支撑在 $D_W$ 上，推到 $Z$ 得支撑在 $D_Z$ 上的有符号有理除子 $G_Z$，$M\sim_{\mathbb Q}G_Z$。

关键的扰动是把 $M$ 变成一个真正带 klt 结构的邻域，同时把 $\ell M$ 的 Cartier 性锁死。取 $\ell>0$ 使 $\ell M$ Cartier，取有理数
\[
 0<\delta<\min\left\{\frac12,\ \frac{1}{16\ell+2}\right\},
\]
对 klt 伴随 $M-\delta D_Z=K_Z+(1-\delta)D_Z$ 跑极小模型程序；它伪有效，因为 $K_Z$ 伪有效而 $(1-\delta)D_Z$ 有效。归纳命题是：每一步对 $M$ 都是 crepant，保持 $M$ 的 nef，保持 $\ell M$ 的 Cartier。验证只用长度界：设 $R$ 为驱动伴随的负极值射线，$M$ nef 且 $\delta<1/2$ 使 $R$ 对 $M-D_Z/2$ 也负；长度界给出张成 $R$ 的有理曲线 $C$ 满足
\[
 0<-\left(M-\frac{D_Z}{2}\right)\cdot C\ \le\ 2\dim Z=8,
\]
记 $a_C=M\cdot C$、$b_C=D_Z\cdot C$，则 $a_C\ge0$、$b_C\le 2a_C+16$、$a_C<\delta b_C$，于是
\[
 0\ \le\ a_C\ <\ \frac{16\delta}{1-2\delta}\ <\ \frac1\ell .
\]
$\ell M$ Cartier 使 $a_C\in\ell^{-1}\mathbb Z$，故 $a_C=0$。收缩定理的线丛条款把 $\mathcal O_Z(\ell M)$ 作为实际线丛下降到收缩基底；除子收缩时它的拉回就是原丛，翻转时两侧各自拉回。素材特意把这称为"对整个伴随的 crepancy，其强度高于数值平凡"（`build/sections/signed.tex:194-196`），并举出做法：取下降线丛的有理截面，$\ell M$ 与其拉回除子相差一个主除子，把同一个有理函数沿翻转搬运，两侧精确除子拉回在公共消解上相同，典范除子相容。驱动偶保持 klt；系数 $1/2$ 的边界比驱动边界小，故下一步仍 klt，同样的 $\ell$ 与 $\delta$ 可以重复使用。

我把这一段称为全篇最"密"的一段：一个 $\delta<1/(16\ell+2)$ 的选择把长度界、Cartier 指标、离散性三件事咬合在一起。$16$ 来自 $2\dim Z$，$\ell$ 来自 Cartier 倍，$-2\delta$ 来自 $b_C\le 2a_C+16$ 里的 $2a_C$。我第一次读到这个界时以为作者可以随便取小 $\delta$，其实下界形状是被 $1/\ell$ 逼出来的：必须让 $16\delta/(1-2\delta)<1/\ell$，解出 $\delta<1/(16\ell+2)$，分母里那个 $+2$ 恰是 $2\delta$ 移项的结果。

结果记在一行里：$(Z',D')$ 是 lc，$K'$ 伪有效，$M'\sim_{\mathbb Q}G'$，$\kappa(M')\le0$，并且对 $0<u\le\delta$ 有 $M'-uD'$ nef、$(Z',(1-u)D')$ klt（`build/sections/signed.tex:207-217`）。后半句由 $M'$ 与 $M'-\delta D'$ 之间插值、以及 klt 驱动偶与 lc 全边界偶之间插值得到。问题至此化成：一条实际 klt 伴随的固定 nef 区间，加上一个支撑在其边界上的有符号代表。

## 9 floor 的定位与截面上升：两件解析输入各自卡在哪个位置

$G'$ 至少有一个正系数，这一点素材是反证处理的：若全非正，用 ample 的三次方去交 $K'+D'\sim_{\mathbb Q}G'\le0$，$K'$ 伪有效与 $D'$ 有效逼出所有不等式取等，非零有效除子的正性再逼出 $D'=0$、$G'=0$；然后在 $W$ 与 $Z'$ 的公共光滑消解 $V$ 上看，$J$ 的拉回支撑在 $D_W$ 上方，程序未抽出除子且 $D'=0$ 使这拉回例外于 $Z'$，它又有理线性等价于 $K_Y$ 的拉回因而 nef；负性引理使它非正，与 ample 三次方相交同时非负与非正，只能为零，于是 $K_Y$ 的拉回有理线性平凡，与 $\kappa(Y,K_Y)=-\infty$ 冲突（`build/sections/signed.tex:228-244`）。这段我第一版写成"显然 $G'$ 有正系数"，被自己复算时推翻了。

写 $D'=\sum_jD'_j$、$G'=\sum_jg_jD'_j$（允许 $g_j=0$），令 $a=\max_jg_j>0$。取充分小正有理 $s$，定义
\[
 B=(1-s)D'+\frac{s}{a}G',\qquad \alpha=1+\frac{s}{a},\qquad N=K'+B .
\]
选 $s$ 使每个系数 $1-s+(s/a)g_j$ 非负，并使 $s/\alpha\in(0,\delta)$。所有系数都不超过 $1$，等号恰在 $g_j=a$ 处成立，于是
\[
 0\le B\le D',\qquad S=\lfloor B\rfloor\ne0,\qquad N\sim_{\mathbb Q}\alpha M'-sD',
\]
$N$ 由 nef 区间那条 nef；$(Z',B)$ 是 lc、在 $S$ 外 klt；对 $0<b<1$，$(Z',bB)$ 是 klt。乘子理想是实际的理想层等式
\[
 \mathcal J(Z',B)=\mathcal I_S,\qquad \mathcal J(Z',bB)=\mathcal O_{Z'}\quad(0<b<1),
\]
$S$ 带约化诱导结构。素材给的是差异描述式的验证：偶是 lc，所以正则函数自动满足每条正对数差异条件；在对数差异为零的除子上它必须正阶消灭；这样的中心全在 $S$ 里，$S$ 的每个分量本身就给出这样的条件；在约化 $S$ 上消灭的函数对每个以 $S$ 为中心的赋值正阶消灭，反向由各分量赋值强制（`build/sections/signed.tex:268-284`）。我的错误直觉在这里露头了：我原本想用非 lc 理想来定义 $S$，那在直觉上和约化支撑一样；素材明确写"这些是 lc 偶的乘子理想，把非 lc 理想换成约化理想的做法没有出现在这里"。区别在第 10 节才显现：上升论证要的是乘子理想局部消没，非 lc 理想没有这个配套定理，换了就断。

两件解析输入是外购的，我必须把它们的陈述一字不差地记在自己的账上。第一件：$(H,\Theta)$ 正规连通射影复 klt 偶，$\Theta\ge0$ 有理，$D_H=K_H+\Theta$ nef 且 $\mathbb Q$-Cartier，$\pi:V\to H$ 任意射影对数消解，则有理线丛 $\pi^*D_H$ 容许一个极小奇性的半正度量，且每一个这样的度量在 $V$ 的每一点 Lelong 数为零；其乘子理想对任何正指数都平凡；不要求 $K_H$ 与 $\Theta$ 各自 $\mathbb Q$-Cartier（`build/sections/analytic-inputs.tex:16-26`）。素材还提醒这条假设不可减：一般 nef 线丛未必有这种度量正则性（`build/sections/analytic-inputs.tex:28-30`）。第二件：$V$ 光滑射影复簇，$L$ 整除子，$0\le C_0\le C_2$ 有效有理除子且合支撑简单交叉；实际有理线丛 $L-C_0$ 与 $L-C_2$ 各有在每一点 Lelong 数为零的半正奇异 Hermite 度量；对 $0<\lambda<1$ 令 $C_1=(1-\lambda)C_0+\lambda C_2$；则
\[
 H^1\bigl(V,\mathcal O_V(K_V+L-\lfloor C_1\rfloor)\bigr)\ \longrightarrow\ H^1\bigl(V,\mathcal O_V(K_V+L-\lfloor C_0\rfloor)\bigr)
\]
单射（`build/sections/analytic-inputs.tex:32-45`）。我理解"内点"这个词的分量：比较的是区间内部的 $C_1$ 与端点 $C_0$，而现成的单射定理给的比较对象通常带奇异度量的乘子理想，这里要靠"零 Lelong 数"把两端点同时喂进假设。

抬截面的受阻点本身是一条正合序列。$S\hookrightarrow Z'$ 给出
\[
 0\to\mathcal O_{Z'}(mN)\otimes\mathcal I_S\to\mathcal O_{Z'}(mN)\to\mathcal O_S(mN)\to0,
\]
把 $S$ 上的截面抬到 $Z'$ 的唯一障碍是连接同态的像，也就是
\[
 H^1\bigl(Z',\mathcal O_{Z'}(mN)\otimes\mathcal I_S\bigr)\to H^1\bigl(Z',\mathcal O_{Z'}(mN)\bigr)
\]
的核；此式单射就足够抬升整条约化 floor 上的所有截面（`build/sections/analytic-inputs.tex:54-73`）。

验证两件输入的装配过程是我认为最容易写漏的一段，我按素材把它拆开。固定 $0<b_0<1=b_1<b_2$ 与 $(Z',D')$ 的射影对数消解 $h:R\to Z'$。取固定的有效整 $h$-例外除子 $A_R$，系数足够大使
\[
 C_i=A_R+h^*(K'+b_iB)-K_R\ge0\qquad(i=0,1,2),
\]
它们的支撑落在同一个简单交叉除子里，$C_0\le C_1\le C_2$，且 $C_1$ 是 $C_0$ 与 $C_2$ 的严格内部凸组合，参数 $(1-b_0)/(b_2-b_0)$。$mN$ Cartier 时令 $L_R=A_R+h^*(mN)-K_R$，它是整除子，两端点的残丛是
\[
 L_R-C_i=h^*\bigl((m-1)N+(1-b_i)B\bigr)\sim_{\mathbb Q}h^*\bigl(t_i(m)M'-v_i(m)D'\bigr),
\]
\[
 t_i(m)=(m-1)\alpha+(1-b_i)s/a,\qquad v_i(m)=(m-1)s-(1-b_i)(1-s).
\]
$i=0,2$ 时 $m$ 大了就有 $t_i(m)>0$，而
\[
 u_i(m)=\frac{v_i(m)}{t_i(m)}\ \longrightarrow\ \frac{s}{\alpha}\ \in\ (0,\delta),
\]
于是每个端点残丛都有理线性等价于 $h^*(K'+(1-u_i(m))D')$ 的正有理倍，即一个 nef klt 伴随拉到对数消解上。第一件输入给出逐点零 Lelong 的半正奇异度量；取正有理幂、再沿实际的有理线丛同构搬运，性质保持。第二件输入的端点假设就位。它给的单射是从 $K_R+L_R-\lfloor C_1\rfloor$ 的第一上同调到 $K_R+L_R-\lfloor C_0\rfloor$ 的，floor 的精确计算是
\[
 K_R+L_R-\lfloor C_i\rfloor=h^*(mN)+\bigl\lceil K_R-h^*(K'+b_iB)\bigr\rceil ,
\]
乘子理想局部消没加投射公式把这些群认定为 $H^1(Z',\mathcal O_{Z'}(mN)\otimes\mathcal J(Z',b_iB))$，比较映射就是乘子理想包含诱导的映射；由上面那两条理想等式，我证明了
\[
 H^1\bigl(Z',\mathcal O_{Z'}(mN)\otimes\mathcal I_S\bigr)\to H^1\bigl(Z',\mathcal O_{Z'}(mN)\bigr)
\]
的单射，$S$ 的正合序列给出 $H^0(Z',\mathcal O_{Z'}(mN))\to H^0(S,\mathcal O_S(mN))$ 对所有充分大可除 $m$ 满射。

那个 $u_i(m)\to s/\alpha$ 的极限我一开始当作显然，其实它是选 $s$ 时要求 $s/\alpha\in(0,\delta)$ 的唯一回报：只有落在开区间 $(0,\delta)$ 里，nef 区间那条才对 $1-u_i(m)$ 提供 klt 与 nef 两个性质，而 $u_i(m)$ 只是趋近于 $s/\alpha$，所以必须让它位于区间内部，端点相等会毁掉 klt。这一处是我在本篇里见到的"参数选择的余地"最 tight 的一例。

## 10 整层丰沛、下降到 floor，判据最后一次上岗

满射已就位，可我手里还是没有截面：$S$ 上的截面空间可能只有零。要造一个非零截面，素材走的是 dlt 抬升：
\[
 g:(Q,B_Q)\longrightarrow(Z',B),\qquad K_Q+B_Q=g^*(K'+B)=g^*N,
\]
只抽出 lc 位，这是 lc 情形的 dlt 抬升定理。令 $T=\lfloor B_Q\rfloor$，它非空。整层 dlt 伴随给出有效有理差异 $\operatorname{Diff}_T$，使
\[
 K_T+\operatorname{Diff}_T=(K_Q+B_Q)|_T=g^*N|_T
\]
作为实际的有理伴随线丛成立，导子与残余的等同关系都写在正规化里；偶 $(T,\operatorname{Diff}_T)$ 是半 dlt 的（`build/sections/signed.tex:369-387`）。

我的第三版做法在这里被素材的措辞否掉了。我原本打算在 $T$ 的每个分量上分别用低维丰沛取截面，再在导子上手工粘合等同关系；那需要我逐条检查导子两侧的限制是否一致，是一件很脏的事。素材把这件事压成一句深度条件，并给出全部理由（`build/sections/signed.tex:389-407`）：底层 $Q$ 是 klt 且 $\mathbb Q$-factorial，$\mathcal O_Q$ 与 $\mathcal O_Q(-T)$ 都是 Cohen--Macaulay；后者的证法是局部把一个 Cartier 倍的 $T$ 平凡化，取正规循环指标覆盖，它有限且拟 \'etale，故 klt 且 Cohen--Macaulay，其有限推前分解成相应的秩一反射层，其中包括 $\mathcal O_Q(-T)$，在特征零这些是直和项，故它们 Cohen--Macaulay。于是正合序列
\[
 0\to\mathcal O_Q(-T)\to\mathcal O_Q\to\mathcal O_T\to0
\]
给出 $T$ 的 $S_2$（在其支撑上正是所需的 Cohen--Macaulay 深度），余维一的交叉与导子描述来自 dlt 结构。结论用词很硬：这样得到的半对数正则伴随是在整条射影三维簇上，不是在其分量的一堆互不相交的并集上。我第一次读时把这段当成"标准事实的罗列"，第二次读才明白它就是我不肯做的手工粘合的替代品，$S_2$ 恰好是把各分量上的截面合成整体截面所需的深度。

维数在这里降了一：$Z'$ 是四折，$T$ 是三维。于是三维的半 dlt 丰沛定理可以正当地用上去，素材引的是 Fujino 关于约化 floor 整体生成（含导子）的那个推论：伴随 $g^*N|_T$ nef，故半ample，
\[
 H^0\bigl(T,\mathcal O_T(mg^*N)\bigr)\ne0
\]
对所有充分大的可除 $m$（`build/sections/signed.tex:409-415`）。这是我在全篇看到的"低维结果真正进入四折论证"的位置之一，它和第 9 节的乘子理想满射是两条独立的通道，最后一步才接上。

下降：$\mathcal J(Q,B_Q)=\mathcal O_Q(-T)$，crepancy 加乘子理想局部消没给出
\[
 g_*\mathcal O_Q(-T)=\mathcal I_S,\qquad R^ig_*\mathcal O_Q(-T)=0\quad(i>0),
\]
两条都可以在 $(Q,B_Q)$ 与 $(Z',B)$ 的公共对数消解上算；两侧拉回的伴随相等，识别出差异取整层 sheaf，对每个对数消解用局部消没再走 Leray 就得到等式。$Z'$ 正规，故 $g_*\mathcal O_Q=\mathcal O_{Z'}$，把除子序列推前得 $g_*\mathcal O_T=\mathcal O_S$，投射公式把上述截面空间认定为 $H^0(S,\mathcal O_S(mN))$。取 $m$ 同时满足"对半ample 足够可除"与"对满射足够大"，$T$ 上的非零截面降到 $S$、再抬到 $Z'$，于是 $\kappa(N)\ge0$。

收尾是判据的最后一次上岗。$B\le D'$ 给出可除度里的截面包含，$\kappa(N)\le\kappa(M')\le0$，所以 $\kappa(N)=0$。考虑 klt 偶
\[
 \left(Z',\left(1-\frac{s}{\alpha}\right)D'\right),
\]
它的 nef 伴随有理线性等价于 $N/\alpha$，Kodaira 维数为零。第一件解析输入在光滑射影对数消解上给出其某个正 Cartier 倍的半正奇异度量，逐点 Lelong 数为零。四折半ample 判据的全部前提就位：射影 klt、边界有理、伴随 Kodaira 维数非负、指定的拉回度量存在（`build/sections/signed.tex:442-459`）。半ample 加上维数零使该伴随数值平凡。另一方面 $K'$ 伪有效，$D'\ne0$（因 $G'$ 有正系数），$1-s/\alpha>0$，拿 ample 的三次方去交 $K'+(1-s/\alpha)D'$ 得严格正数。矛盾。命题得证：$K_W+D_W$ big。

我把这条链的顺序当作本篇给我的最大教训之一：先有截面，才有判据；判据在前就是循环。素材在引言里也承认这条顺序（`build/sections/introduction.tex:181-185`），并且把"从第一节到丰沛"的那一步推给了另一篇 companion（关于从约化支撑上抬升伴随截面的两个定理），同时声明那个推论不参与本文的证明（`build/sections/introduction.tex:80-88`）。

## 11 双槽丛：把局部正性搬到九维，再逐情形掐掉移动中心

标量界只压住了一份拷贝 $Y$ 上的消灭；我要一份"大"的相反估计。素材的做法是走到 $Y\times Y$ 上的一个 $\mathbb P^1$-丛。取 $S_0=\iota K$，它是 $Y$ 上实际的 Cartier 除子；下标表示从相应因子拉回。令
\[
 \pi:Z=\mathbb P\bigl(\mathcal O(S_{0,1})\oplus\mathcal O(S_{0,2})\bigr)\longrightarrow Y\times Y,\qquad \xi=c_1(\mathcal O_Z(1)),
\]
约定 $\pi_*\mathcal O_Z(a\xi)=\operatorname{Sym}^a\bigl(\mathcal O(S_{0,1})\oplus\mathcal O(S_{0,2})\bigr)$（$a\ge0$）。极化取
\[
 P=L_1+L_2+q\xi,\qquad d=\dim Z=2n+1=9 .
\]
这个 $q$ 是丛的权，与不规则度 $q(Y)=0$ 无关，素材在约定段落里专门把 $r$、$r_t$、$q(Y)$、$q$ 四个记号的分工写清（`build/sections/introduction.tex:256-258`、`build/sections/two-slot.tex:57-62`）。两条直和项定出两条不相交的轴，轴的补是 $Z$ 的环面开集；固定一个底坐标并用常数线平凡化，得到切片
\[
 \pi_{\mathrm{sl}}:Z_{\mathrm{sl}}=\mathbb P\bigl(\mathcal O_Y\oplus\mathcal O_Y(S_0)\bigr)\to Y,\qquad P_{\mathrm{sl}}=L+q\xi_{\mathrm{sl}} .
\]

环境性质不是免费的，素材给了完整一段。$Y\times Y$、$Z$、$Z_{\mathrm{sl}}$ 都是射影 $\mathbb Q$-factorial 且 klt；两个丛的 tautological 类 nef；$P$ 与 $P_{\mathrm{sl}}$ 是 ample 有理除子；并且对 $K_\Sigma=K_1+K_2$（切片情形记作 $K_\Sigma=K$）有
\[
 K_{\mathrm{bundle}}=-2\xi+(\iota+1)K_\Sigma\ \le\ \frac{\iota+1}{r_t}\,P_{\mathrm{bundle}}
\]
在 nef 序下成立（`build/sections/two-slot.tex:77-90`）。$\mathbb Q$-factoriality 的证法我原先没料到要用到 $q(\widetilde Y)=0$：取光滑消解 $p:\widetilde Y\to Y$，有理奇点与第 3 节的不规则度结论给 $q(\widetilde Y)=0$，于是由 Picard 群的乘积分解（或者 seesaw 原理加上 $\operatorname{Hom}(\operatorname{Alb}(\widetilde Y),\operatorname{Pic}^0(\widetilde Y))=0$ 的消失）得到
\[
 \operatorname{Pic}(\widetilde Y\times\widetilde Y)=\operatorname{pr}_1^*\operatorname{Pic}(\widetilde Y)\oplus\operatorname{pr}_2^*\operatorname{Pic}(\widetilde Y).
\]
$Y\times Y$ 上的素 Weil 除子取其在光滑乘积上的严格变换，其 Cartier 类是两因子拉回之和；把这条线性等价推下来表达原 Weil 除子类，就是 $Y$ 上 Weil 子类之和，它们 $\mathbb Q$-Cartier 因 $Y$ 是 $\mathbb Q$-factorial；例外分量像的余维至少二，不进这套类计算。丛的情形用同一套论证在其光滑模型上加"底 Picard 加整 tautological 类"即可。典范偶的乘积仍典范，由乘积消解与典范差异公式直接看出；丛在底上光滑，故 klt。

体积是这套尺度的引擎。秩二分叉丛的第一 Chern 类记 $E_1,E_2$，丛公式是
\[
 \pi_*(\xi^i)=\sum_{a+b=i-1}E_1^aE_2^b\quad(i\ge1),\qquad \pi_*(1)=0 .
\]
$P^d$ 展开里所有类都 nef，且每个 $E_j=S_{0,j}$ 在 nef 序下被 $(\iota/r_t)L_\Sigma$ 控制，$L_\Sigma=L_1+L_2$，于是
\[
 dqL_\Sigma^{2n}\ \le\ P^d\ \le\ qL_\Sigma^{2n}\sum_{i=1}^{d}i\binom{d}{i}(q\iota/r_t)^{i-1}\ \le\ d2^{d-1}qL_\Sigma^{2n},
\]
配合 $L_\Sigma^{2n}=\binom{2n}{n}(L^n)^2$ 与 $L^n\to\epsilon^n>0$，得
\[
 c_nq\epsilon^{2n}\ \le\ P^d\ \le\ C_nq\epsilon^{2n}
\]
（`build/sections/two-slot.tex:134-179`），常数只依赖 $n$，前提是 $q\iota/r_t\le1$ 与 $t$ 足够小。切片侧一个直和项平凡，
\[
 P_{\mathrm{sl}}^{\,n+1}=\sum_{i=1}^{n+1}\binom{n+1}{i}q^iL^{n+1-i}S_0^{i-1}\ \le\ qL^n\sum_{i=1}^{n+1}\binom{n+1}{i},
\]
小 $t$ 时可用 $L^n\le2\epsilon^n$，得 $P_{\mathrm{sl}}^{\,n+1}\le2^{n+2}q\epsilon^n$。

参数顺序在这里第一次显出强制性：先固定 $\epsilon$；再取 $\delta>0$ 使
\[
 (2/\delta)^n2^{n+2}\epsilon^n<1 ;
\]
再取整数 $q$ 大到让下界给出
\[
 P^d>(2n+3+d\delta)^d
\]
对一切充分小的 $t$ 成立，能做到是因为下界对 $q$ 线性；此后 $q$ 锁死；最后减小 $t$，把 $q\iota/r_t\le1$ 与前面所有估计一并压实，再往下减 $t$ 不动 $\epsilon,\delta,q$（`build/sections/two-slot.tex:181-195`）。我一开始的排序是让 $q$ 与 $\delta$ 同时取，结果无法闭合：$\delta$ 控制切片体积的上界（那个 $<$ 号），$q$ 控制总体的下界，两者对 $t$ 的依赖方式不同，必须先后有序。

Seshadri 常数按 $\varepsilon(P;z)=\inf_{C\ni z}(P\cdot C)/\operatorname{mult}_zC$ 定义。命题：$Z$ 与 $P$ 如上，$\epsilon$ 固定、$\delta$ 满足上面那个不等式、$q$ 大到满足体积下界，则对充分小的正有理 $t$，在 $Z$ 的环面开集的极一般光滑点 $z$ 处
\[
 \varepsilon(P;z)>2n+2=10
\]
（`build/sections/two-slot.tex:199-217`）。这个"$10$"是全文最紧的一个整数：它等于 $2n+2$，而第 13 节的终局矛盾里出现的 jet 阶正是 $(2n+2)k_0+1=10k_0+1$。

体积为什么能给 jet：$H^0(Z,\mathcal O_Z(kP))$ 的首项是 $P^d/d!\cdot k^d$，而光滑点处 $\tau$ 阶 jet 空间的维数首项是 $\tau^d/d!\cdot k^d$。所以只要 $P^d>(2n+3+d\delta)^d$，取 $d+1$ 层
\[
 \tau_j=2n+3+j\delta,\qquad 0\le j\le d ,
\]
对大的可除 $k$ 每层核都非零（`build/sections/two-slot.tex:489-497`）。这里我用了一次纯计数，跟奇点、跟丰沛都无关，我第一版没看出来，白白绕了一圈解析论证。

若 $\varepsilon(P;z)>10$ 失败，环面极一般点处存在比值 $<2n+3$ 的曲线，而且这不需要 infimum 被取到。最低核里的截面若不含这条曲线，它与该曲线在标记点的局部交至少 $\lceil k\tau_0\rceil\operatorname{mult}_zC$，这超过 $kP\cdot C$，荒谬；故最低基轨迹在标记处有正维数分量。第 5 节的移动重数引理随即给出不可约参数空间 $T$、支配结合 $\Gamma\subset T\times Z$、固定维数 $1\le f<d$ 的整纤维分量 $V$，较高整个核的泛型基理想含于 $\mathcal I_V^h$，$h=\lceil k\delta/2\rceil$，$k/h\le2/\delta$，再由第 5 节第二条与 $K_{\mathrm{bundle}}$ 的那个界得到
\[
 0<P^f\cdot V\le(2/\delta)^{d-f}P^d,\qquad
 K_{V^*}P^{f-1}\le\left(\frac{\iota+1}{r_t}+\frac{2(d-f)}{\delta}\right)P^f\cdot V ,
\]
右端在指定意义下一致（`build/sections/two-slot.tex:536-556`）。

为了让后面的限制论证能用，素材先把"填充系"造好：加大可除的 $k$，使一整套除子
\[
 kL+(2kq-j)S_0,\qquad 0\le j\le kq,
\]
同时 Cartier 且全局生成。一条统一的验证：对 $1\le a\le n$，先减 $aA$ 再减 $K$，得
\[
 \bigl(kr_t+(2kq-j)\iota-1\bigr)K+(kr_tt-a)A,
\]
只要 $kr_tt>n$ 且 $kr_t\ge1$ 它就 ample；klt 的 Kawamata--Viehweg 消没接着对 $A$ 的正则性给出全部 $j$ 的整体生成（`build/sections/two-slot.tex:520-534`）。我先前打算只对需要的有限个 $j$ 逐个用 Serre 消没，那样每个 $j$ 都要一次独立的 $k$，而 $j$ 的上界本身是 $kq$，与 $k$ 有关，循环；上面这条"减 $aA$ 再减 $K$"的写法一次覆盖整段 $j$，这是我在这个 proof 里学到的最实用的一招。

剩下的就是把 $V$ 在两个槽里的纤维维数逐格掐掉。取切片的中间纤维 $F$，其像 $W\subseteq Y$，记 $s=\dim F$、$w=\dim W$；三种可能是
$s=w<n$（一般有限到真像）、$s=w+1$ 且 $w<n$（$W$ 上整个丛）、$s=w=n$（覆盖整个 $Y$ 的多重截面）。先说限制本身：先在结合里取极一般点，要求它的两个底坐标都在 $Y^{\mathrm{vg}}$、点在环面内、通常理想幂与孤立分量结论在其附近成立、结合在 $T$ 上光滑、$V$ 在其实际槽像的光滑开集上光滑；这些都在稠密开集上可得。取该点的槽值，$F$ 为其约化纤维分量，设 $0<s<n+1$。原基支撑在选点附近恰为 $V$，故包含纤维分量的其余基分量不可能通过该点；槽上像 $\mathcal I_V^h$ 含于 $\mathcal I_F^h$，仍是通常理想幂；若限制在整个切片上恒为零，就与该处基支撑的真性矛盾（`build/sections/two-slot.tex:581-606`）。切片的基分量引理给
\[
 0<P_{\mathrm{sl}}^{\,s}\cdot F\le(2/\delta)^{n+1-s}P_{\mathrm{sl}}^{\,n+1},\qquad
 K_{F^*}P_{\mathrm{sl}}^{\,s-1}\le\left(\frac{\iota+1}{r_t}+\frac{2(n+1-s)}{\delta}\right)P_{\mathrm{sl}}^{\,s}\cdot F .
\]

第一种 $w=s<n$：$W$ 的消解一般型，$F^*$  likewise（把一般有限映射对 $W$ 的消解解掉，ramification 给拉回典范加一个有效除子），$P_{\mathrm{sl}}$ 支配 $L$ 的拉回，两界与第 6 节冲突。第二种 $s=w+1$：一般 $\mathbb P^1$ 纤维里的正维数闭子集只能是整条纤维，故 $F=\pi_{\mathrm{sl}}^{-1}(W)$ 作为约化整子簇，丛公式给
\[
 qL^w\cdot W\ \le\ P_{\mathrm{sl}}^{\,w+1}\cdot F .
\]
$w=0$ 时左端是 $q$，右端 $\le(2/\delta)^nP_{\mathrm{sl}}^{\,n+1}\le(2/\delta)^n2^{n+2}q\epsilon^n<q$，矛盾，这一步正是 $\delta$ 那个选择的全部用途。$w>0$ 时我不再对 $F$ 这个 ruled 簇用障碍，转而用到 $W$ 上，这一步我第一版直接对 $F$ 用障碍，卡在"$F$ 一般型"根本不知道。做法是把限制后的高次截面按两个齐次纤维坐标展开，权 $j$ 的系数是 $\mathcal O_Y(kL+jS_0)$ 的实际截面；设 $\mathfrak a$ 是这些系数在正则局部环 $R=\mathcal O_{Y,\eta_W}$、极大理想 $\mathfrak m$ 里生成的理想。切片的局部环在 $F$ 的一般点处是 $R[u]_{\mathfrak m R[u]}$，$u$ 的剩余类在 $R$ 的剩余域上超越；若某系数阶 $<h$，其最 $\mathfrak m$-adic 齐次部分在添上 $u$ 之后仍非零，故所有高次截面属于 $\mathfrak m^hR[u]$ 蕴涵 $\mathfrak a\subseteq\mathfrak m^h$；又若素理想 $\mathfrak p\subsetneq\mathfrak m$ 含 $\mathfrak a$，它在这个局部多项式环里的扩张就是严格低于 $F$ 的一般理想的真素理想、且含整个高次基理想，与 $F$ 的孤立支撑冲突。于是
\[
 \mathfrak a\subseteq\mathfrak m^h,\qquad \sqrt{\mathfrak a}=\mathfrak m .
\]
把每个权 $j$ 的系数乘上第 $kL+(2kq-j)S_0$ 的那个全局生成系，所有乘积落进同一个线性子级数
\[
 H^0\bigl(Y,\mathcal O_Y(2k(L+qS_0))\bigr),
\]
在 $\eta_W$ 处每个填充系按框架取都属于单位，于是这个新子级数在 $\eta_W$ 处的理想恰是 $\mathfrak a$，只同支撑是不够的。阈值构造给有效有理除子 $\Theta\sim_{\mathbb Q}c\cdot2(L+qS_0)$，$0<c\le(n-w)k/h$，使偶在 $W$ 的一般点 lc 并有中心为 $W$ 的 lc 位；用测试类 $L$ 施加第 5 节第一条，配合 $qS_0\le L$ 的 nef 支配，得
\[
 K_{W^*}L^{w-1}\le\bigl(K+2c(L+qS_0)\bigr)L^{w-1}\cdot W\le\left(\frac1{r_t}+\frac{8(n-w)}{\delta}\right)L^w\cdot W ,
\]
顶次 $L^w\cdot W$ 由上面两式控制，$W^*$ 一般型，第 6 节在 $W^*$ 上给出矛盾。

第三种 $s=w=n$ 是整条链上有符号代表真正上岗的地方。$F$ 是 $Y$ 上次数 $e>0$ 的多重截面，含所选环面点故非轴。设切片两轴 $\Sigma_0,\Sigma_\infty$ 的类为 $\Sigma_0\sim\xi_{\mathrm{sl}}$、$\Sigma_\infty\sim\xi_{\mathrm{sl}}-S_0$，$F\cap\Sigma$ 有效整圈，推下给有效整 Weil 除子 $D_0,D_\infty$（允许其中一个为零），投影与圈的理论有理等价给
\[
 D_0-D_\infty\sim eS_0=e\iota K,
\]
这是 Weil 除子的线性等价：正规簇上余维一有理等价恰是线性等价。于是 $J=(D_0-D_\infty)/(e\iota)\sim_{\mathbb Q}K$ 是实际的有符号有理代表。任一轴满足 $P_{\mathrm{sl}}-q\Sigma$ nef（它是 $L$ 或 $L+qS_0$），故
\[
 qL^{n-1}\cdot D_i\ \le\ qP_{\mathrm{sl}}^{\,n-1}\cdot(F\cap\Sigma_i)\ \le\ P_{\mathrm{sl}}^{\,n}\cdot F,\qquad i=0,\infty .
\]
取 $D_0+D_\infty$ 的对数消解 $p:Y^\dagger\to Y$，$G$ 为其真支撑并所有例外除子的约化 snc 除子。第 8 节的命题给 $K_{Y^\dagger}+G$ big；例外项对 $L^{n-1}$ 推前为零，约化真支撑被整除子 $D_0+D_\infty$ 控制，于是
\[
 (K_{Y^\dagger}+G)L^{n-1}\ \le\ \frac{L^n}{r_t}+L^{n-1}\cdot(D_0+D_\infty),
\]
第二项由前面两式一致控制，$L^n$ 既有上界又有正下界，于是这正是第 6 节障碍引理对数形式的"典范对体积"界，极化取 $p^*L$、映射取 $p$，矛盾。

纤维维数 $n+1$ 落在某个槽像 $W$ 上会迫使 $V$ 是整个丛在 $W\times Y$ 上的原像；$V\ne Z$ 故 $\dim W<n$，其另一槽的纤维维数为 $\dim W+1$，已排除。于是两个投影对各自的像一般有限；像若真，则维数 $f<n$ 且一般型，其一般有限覆盖 $V^*$ 也一般型，总界与第 6 节冲突；故 $f=n$ 且 $g_i:V^*\to Y$ 都是一般有限支配，界给出不依赖小 $t$、不依赖次数 $k$、不依赖族的常数 $B_0,B_1$，正好落进下一节要证的"有界对应族不能清扫丛"。

## 12 有界对应族不能清扫丛：我在这里连错两次

命题的陈述是这样的（`build/sections/two-slot.tex:227-249`）。固定 $\epsilon>0$、整数 $q>0$ 与正常数 $B_0,B_1$。保留 $Y,K,A,L_t$ 与 $P=L_1+L_2+q\xi$。则对一切充分小的正有理 $t$，不存在不可约有限型参数空间 $T$ 与整闭子簇 $\Gamma\subset T\times Z$（支配 $T$），使得：结合映射 $\Gamma\to Z$ 支配，且 $T$ 上一般纤维 $V$ 是维数 $n$ 的整子簇；在光滑射影消解 $V^*\to V$ 上两个投影 $g_i:V^*\to Y$ 都支配且一般有限；并且
\[
 0<P^n\cdot V\le B_0,\qquad K_{V^*}P^{n-1}\le B_1(P^n\cdot V).
\]
对 $t$ 的限制只依赖固定几何与 $\epsilon,q,B_0,B_1$，不依赖参数空间与族。

我先说两处错误。第一处：我以为次数有界就直接给出"有限多个覆盖"。$P-g_i^*L$ nef 加投影公式确实给出
\[
 \deg(g_i)L^n\ \le\ P^n\cdot V\ \le\ B_0,
\]
由 $L^n\to\epsilon^n>0$ 知 $\deg(g_i)$ 一致有界；但素材紧接着写"仅有次数界并不能给出有限的覆盖清单，必须先控制它们的分支轨迹"（`build/sections/two-slot.tex:261-263` 的对应句）。第二处更隐蔽：我以为一个数值形式的分支界就够了，即把每个分支素除子的 $L^{n-1}$-度界住即可。素材在有限覆盖引理那段末尾明确否认："这是一条有限型族的论证，单有分支的数值界并不足够"（`build/sections/two-slot.tex:368-371`）。两条否认合起来定义了这一节的结构：先做分支的数值界，再用一个把分支轨迹与纯度、有限 étale 覆盖有限性一起用上的引理。

分支界的推导我先复述它的合法性来源。对一般成员在族中消解，缩小不可约参数空间后有光滑射影族 $\mathcal V^*\to T$，纤维整且双有理于对应的 $V$，两个一般有限 $g_i$ 在每纤维上给出。对任一投影，记 $T_i\to Y$ 为其有限正规 Stein 因子，函数域是 $\mathbb C(V)$。若 $J$ 是 $T_i\to Y$ 的分支素除子，$T_i$ 上的一条 ramification 素除子在 $\mathcal V^*$ 上有严格变换 $R$；理由是我到正规目标每条除子一般点处的真双有理态射就是同构，所以这个变换确实存在；在 $Y$ 的光滑轨迹上方其 ramification 系数至少 $1$，于是有有效的典范比较
\[
 K_{V^*}\sim_{\mathbb Q}g_i^*K+E_i,\qquad E_i\ge R
\]
（`build/sections/two-slot.tex:274-287`）。设 $d_J=L^{n-1}\cdot J$，投影与 nef 序给出
\[
 0<d_J\ \le\ P^{n-1}\cdot R\ \le\ K_{V^*}P^{n-1}\ \le\ C_3,\qquad C_3=B_1B_0,
\]
与 $t$ 与族都无关；同样的估计适用于每个碰到 $Y_{\mathrm{sm}}$ 的 ramification 素除子像。

我还想要 $J$ 的典范界，而 $J$ 未必正规。素材的处理我认为值得单独抄进笔记：在 $Y_{\mathrm{sm}}$ 上 $J$ 是 Gorenstein 超曲面；若 $\nu:J^\nu\to J$ 是正规化，有限对偶在余维一说
\[
 K_{J^\nu}+D_{\mathrm{cond}}\sim_{\mathbb Q}\nu^*\bigl((K+J)|_J\bigr),\qquad D_{\mathrm{cond}}\ge0,
\]
导子的符号恰好把正规化后的典范交压低。terminal 奇点在余维二光滑，故 $J\cap Y_{\mathrm{sing}}$ 维数至多 $n-3$，它在正规化上的逆像余维至少二，不引入被漏掉的余维一项。消解 $J^*$ 上例外典范圈对 $n-2$ 个 $L$ 的拉回交为零，于是
\[
 K_{J^*}L^{n-2}\ \le\ (K+J)JL^{n-2}\ \le\ \frac{d_J}{r_t}+\frac{d_J^2}{L^n}\ \le\ C_4d_J,
\]
其中 $K\le L/r_t$，平方项来自 Hodge 指标型不等式 $J^2L^{n-2}\le(JL^{n-1})^2/L^n$；它对 $\mathbb Q$-Cartier 的 $J$ 合法，办法是拉到消解上并用 ample 类逼近 nef 的 $L$（`build/sections/two-slot.tex:299-329`）。这两条界合起来正好是第 6 节障碍引理需要的"顶次界 + 典范界"，所以若这些素像的族支配 $Y$，取极一般成员、再在其消解上取映到 $Y^{\mathrm{vg}}$ 的极一般点，像除子由第 3 节命题是一般型，障碍引理在充分小的 $t$ 排除它。素材还专门写了"尽管有可数例外集，这样的选点是合法的"以及怎么合法：对每个被排除的 $Y$ 的真闭子集，支配性说明泛型像除子不含于它，于是略去相应的真参数轨迹；在剩下的极一般成员上，再略去可数个被排除子集的逆像，连同有限个双有理系与拟有限性的例外（`build/sections/two-slot.tex:331-344`）。第 6 节末尾那段"先选成员再选点"在这里第二次上岗。

第二拍：固定一个足够小的 $t$ 与它的结合族，此后不再减小 $t$。相对 Jacobian 在 $Y_{\mathrm{sm}}$ 上只有有限多个几何泛型分量，跟着它们走；每个被跟随的分量若其纤维像是除子，其总像闭包是真，理由就是上一拍。这正是同时有限覆盖引理的全部前提（companion 的第 7.5 条），它给出一个光滑非空开 $Y^\circ\subset Y$，使得任一槽里每个一般的有限 Stein 覆盖在其上有限 étale，并给出所得正规覆盖的有限清单。素材交代了引理内部干什么：先用 ramification 的严格变换把每条分支素除子记入账上，再用纯度与"固定开集上有界度 étale 覆盖只有有限多个"。

第三拍是这一节最出我意料的地方。剩下的对手是"两个正规覆盖之间的一对双有理映射"，因为两个有限 Stein 因子的函数域都是 $\mathbb C(V)$；$V$ 在 $Y\times Y$ 中的像就是该双有理图闭包的有限像。固定一对双理了的覆盖，它们公共双有理类的光滑射影消解有伪有效的典范类（与 $Y$ 上 nef 的 $K$ 作有效典范比较），故按 BDPP 非 uniruled。到这里我还是不知道能干什么。素材引入 Hanamura 的双有理群结构定理（按 Blanc 的表述形式）：存在该双有理类的一个光滑射影模型 $U$，使得约化平坦图双有理概形是局部有限型的群概形，其单位分量
\[
 A_U=\operatorname{Aut}^0(U)
\]
是Abel 簇；平坦图在图 Hilbert 概形里表示，Hilbert 多项式可数多个、每个有限型 Hilbert 概形只有有限多个分支，故双有理映射出现在可数多个平移 $A_Ub$ 里。对这样的平移，其图在一个稠密开集上由有理赋值映射
\[
 U\times A_U\dashrightarrow U\times U,\qquad (x,a)\longmapsto(x,a\cdot b(x))
\]
参数化。我最初的直觉是"这映射多半不支配，于是这些对应族很小，可以直接排除"；素材的处理恰好相反：不支配才是坏情形要处理的情况，因为它把所有对应压进 $U\times U$ 的一个真闭子集；固定 $U$ 与两个覆盖的双有理等同，每条图都稠密地碰到两个固定双有理开的乘积（因为它支配两个因子），把像闭包穿过这些开集搬运、再取在覆盖乘积中的闭包保持维数，随后到 $Y\times Y$ 的有限映射也保持维数；于是这一平移的所有对应都含在 $Y\times Y$ 的一个真闭子集里，个别双有理映射可能带来的边界不添新分量，因为泛型图已经被包含。有限多个覆盖对、每对可数多个平移，若每条这样的映射都不支配，则原结合的像含在 $Y\times Y$ 中可数个真闭子集之并；可 $\Gamma\to Z$ 支配，其复合到 $Y\times Y$ 也支配，像含一个非空开；在不可数的 $\mathbb C$ 上，这样的开不能被可数个真闭子集覆盖。故至少有一个平移上该映射支配。

第四拍又回到曲线界。对这个赋值的一般 $x$，$A_U\cdot b(x)$ 是 $U$ 中的稠密轨道；由交换性，稳定子的元素固定该轨道每一点，由稠密性固定整个 $U$；$\operatorname{Aut}^0(U)$ 的作用忠实，故稳定子是零维的，于是 $A_U$ 的轨道映射一般有限支配；与经过任一固定覆盖的有理映射复合，得一般有限支配的有理映射 $A_U\dashrightarrow Y$，特别地 $\dim A_U=\dim Y=n$。把映射消解为 $\pi_A:T_A\to A_U$ 与 $g:T_A\to Y$，$T_A$ 光滑射影。$A_U$ 典范丛平凡、$Y$ 是 terminal，典范比较给出
\[
 K_{T_A}\sim_{\mathbb Q}E_{\pi_A},\qquad K_{T_A}\sim_{\mathbb Q}g^*K+R,\qquad E_{\pi_A},R\ge0,
\]
$E_{\pi_A}$ 例外于 $A_U$；$\pi_A$ 的例外除子的像在一个光滑Abel 簇里余维至少二。取 $\pi_A$ 同构开里、$g$ 拟有限、又在 $\operatorname{Supp}R$ 外、并映到 $Y^{\mathrm{vg}}$ 的一点，支配性与可数排除说明它存在。过它的像取 $A_U$ 中一般充分 ample 的完全交曲线，避开所有例外中心（余维至少二且不含指定点），其严格变换 $C$ 与 $E_{\pi_A}$ 不交、不含于 $R$，$g$ 在 $C$ 上非常值。两式一交就得到
\[
 0=K_{T_A}\cdot C=g^*K\cdot C+R\cdot C>0,
\]
最后那个严格不等式用的正是 $K\cdot g(C)\ge 1/\iota$ 乘上 $C\to g(C)$ 的正次数，加上 $R\cdot C\ge0$。$1/\iota$ 又一次把门关上。

我在这一节学到的一条元教训：当"一般型"这条信息用完（$V$ 支配 $Y$，第 3 节对它一无所说），可用的下一条全局信息就是双有理自同构群是Abel 簇这一族的事，而它给的曲线典范度零恰好与 $1/\iota$ 冲突。这两条通道在同一形式下配合，我在写第 6 节时完全没预见到。

## 13 与 Frobenius 滤过的对撞：两个阶逼死一个行列式

手里现在有两件相反的东西：一份拷贝上截面只能小阶消灭（$\operatorname{ord}_x(s)\le4k\rho_t\le32k\epsilon$），而 $Y\times Y$ 上的丛有足够多 jet 给出大的赋值秩。素材的处理是把全部有限数据交给一条独立的定理，它自己的证明不依赖丰沛、也不依赖对数 Iitaka 可加性（`build/sections/finite-inputs.tex:3-7`）。

定理（有限数据的 Frobenius 不相容，`build/sections/finite-inputs.tex:9-48`）。$W$ 是维数 $n\ge2$ 的光滑连通射影复簇；给定有理 Cartier 除子 $L,H$（$H$ ample）、整 Cartier 除子 $S$、整数 $q>0$、实数 $r>1$ 与 $\epsilon>0$，并假设
\[
 H^n\le(2\epsilon)^n,\qquad K_WH^{n-1}\le\frac{2H^n}{r},\qquad (2L+qS)H^{n-1}\le4H^n,
\]
\[
 (14\epsilon)^n<\frac14,\qquad 80\epsilon<\frac34 .
\]
则下面三类固定数据不可能同时存在。(i) 一条以曲线 $C$ 收尾的光滑整完全交旗，逐级除子类为 $l_iH$（$l_i$ 为正整数），且 $\mu_{\min}(\Omega_W^1\vert_C)\ge0$。(ii) 在 $Z_W=\mathbb P(\mathcal O(S)_1\oplus\mathcal O(S)_2)\to W\times W$ 上按对称幂约定置 $M=L_1+L_2+q\xi$；存在整数 $k_0>0$ 使 $k_0L$ Cartier，并且 $k_0M$ 的有限多个截面在光滑环面点 $z_*$ 处平凡化之后满射到 $\mathcal O_{Z_W,z_*}/\mathfrak m_{z_*}^{(2n+2)k_0+1}$。(iii) 一点 $x\in W$、其吹-ups $\pi_x:\widehat W\to W$ 与例外除子 $J_x$、以及曲线类 $\gamma=f_*(A_1\cdots A_{n-1})$，其中 $f:V\to\widehat W$ 是从光滑整射影簇出发的固定双有理态射、$A_i$ 为 ample Cartier，满足 $J_x\gamma>0$ 与
\[
 \pi_x^*\bigl(L+K_W/2+\lambda S\bigr)\gamma\ \le\ 40\epsilon\, J_x\gamma\qquad(0\le\lambda\le q),
\]
只需验证两个端点的不等式。定理不假设 $L,S,K_W$ 中任何一个是 nef，$z_*$ 也无需在 $x$ 上方；所有除子、旗、点、曲线代表与有限 jet 截面都在特征变化之前先在 $\mathbb C$ 上固定。

我要做的就是把这三类数据造出来，次序是 $n=4,\epsilon$；然后间距 $\delta$ 与整数 $q$；然后 $t,r_t$；然后消解、$H$、旗、点、曲线；最后有限 jet 与填充。取 $q$ 如第 11 节，再取足够小的有理 $t>0$ 使两个 jet 估计都成立、$r_t>q\iota+1$、$L^n<(2\epsilon)^n$；此后 $t,r_t$ 固定。取射影消解 $W\to Y$，拉回仍记 $K,A,L$；terminality 给
\[
 K_W=K+E,\qquad E\ge0\ \text{例外},\qquad S_0=\iota K\ \text{Cartier}.
\]
$L$ 从 $Y$ 上某个 ample 除子拉回，故 $K_WL^{n-1}=KL^{n-1}\le L^n/r_t$。用 $W$ 上一个足够小的 ample 有理类扰动 $L$，由连续性所得 ample 有理除子 $H$ 满足那三条界；最后一条在 $H=L$ 处用的是 $S_0L^{n-1}\le\iota L^n/r_t$ 与 $q\iota<r_t$（`build/sections/finite-inputs.tex:61-83`）。我第一版想直接令 $H=L$，那 $H$ 只是 nef ，并非 ample，定理要的 $H$ ample 与旗的存在都不成立；这个扰动是必要的，而且必须小到不破坏三条界，$\epsilon$ 有余量正因如此。

数据 (i) 的来源是伪有效典范丛的一般半正性：$K_W$ 伪有效，按 Campana--Păun 的光滑空边界情形，$\Omega_W^1$ 的每个正秩无挠商对 $H^{n-1}$ 的斜率非负；对 Harder--Narasimhan 滤过及其因子施 Mehta--Ramanathan 限制定理，得到一条固定的、由光滑整的一般 very ample 截组成的旗，类型 $h_i=l_iH$（$1\le i\le n-1$），以光滑曲线 $C$ 收尾，且
\[
 \mu_{\min}(\Omega_W^1\vert_C)\ge0,
\]
$l_i$ 是逐个选取的足够大可除整数，最后的曲线避开滤过因子非局部自由的那些余维二轨迹。令 $\Lambda=\prod_{i=1}^{n-1}l_i$，则 $[C]=\Lambda H^{n-1}$、$h_i\cdot C=l_i\Lambda H^n$（`build/sections/finite-inputs.tex:85-106`）。这里我最初的贪心是把 $l_i$ 一次取到最大，以为越一般越好；素材的说法是"逐个选取"，因为每一级都要在上一级切出的簇上再取一般截面，同时保持限制定理给出的斜率信息，一次性写死反而说不清哪一级用了什么。

数据 (iii) 的 movable 试验曲线是我最喜欢的一个构造。取 $W$ 中在 $W\to Y$ 同构轨迹上方的极一般点 $x$，$\pi_x:\widehat W\to W$ 为其吹-up，例外除子 $J_x$，并置
\[
 D^+=2r_t(K+2tA)+2E .
\]
第 7 节的标量界说：每个足够可除的倍 $kD^+$ 的非零截面满足 $\operatorname{ord}_x(s)\le32k\epsilon$，因为推下只去掉有效的例外部分，而在 $x$ 附近是同构。断言：存在强 movable 曲线类 $\gamma$，表示为某个固定光滑射影双有理模型上 ample 完全交的推前，使
\[
 (\pi_x^*D^+)\cdot\gamma<40\epsilon\,J_x\cdot\gamma,\qquad J_x\cdot\gamma>0 .
\]
证明是反证加对偶。若 $\pi_x^*D^+-40\epsilon J_x$ 伪有效，则对任何满足 $32\epsilon<c<40\epsilon$ 的有理 $c$，$\pi_x^*D^+-cJ_x$ 是那个伪有效除子与大除子 $\pi_x^*D^+$ 的正凸组合，故 big；足够可除的有效倍就违背 $\operatorname{ord}_x(s)\le32k\epsilon$。故 $\pi_x^*D^+-40\epsilon J_x$ 不伪有效；movable 曲线对偶给出与它配对为负的强 movable 类；因不等式严格，可以取某个光滑射影双有理模型上 ample 完全交的实际推前，必要时有理逼近 ample 类并清分母；大除子 $\pi_x^*D^+$ 与这个非零类配对为正（写成 ample 加有效，再拉到所选模型），于是严格不等式逼出 $J_x\gamma>0$（`build/sections/finite-inputs.tex:123-151`）。$32$ 与 $40$ 之间的余量在这一步花掉一次，它还要留给后面的 $O(p^{-1})$，我在第 15 节把这条余量列为我最不放心的数值。

端点比较（数据 (iii) 全部）。对 $0\le\lambda\le q$ 置 $Q_\lambda=L+K_W/2+\lambda S_0$，则
\[
 D^+-Q_\lambda=(r_t-1/2-\lambda\iota)K+3r_ttA+\tfrac32E,
\]
第一个系数正因 $r_t>q\iota+1$ 而正；$K,A$ 的拉回 nef，$E$ 有效；强 movable 曲线与每类非负配对，故 $Q_\lambda\gamma\le D^+\gamma<40\epsilon J_x\gamma$。素材在这里加了一句我认为对我先前习惯的直接否定："这不要求伪有效锥特殊化到正特征：曲线有该定理所要求的固定 ample 完全交代表。"（`build/sections/finite-inputs.tex:174-176`）我原本默认要在归约后再谈锥，这条路需要额外的上半连续论证；固定代表把这件事整个绕开。

数据 (ii) 与"填充"：取第 11 节推论给的 $z_*,k_0$ 与有限截面；另外选一个整 ample 除子 $T_0$，使每个 $T_0+aS_0$（$0\le a\le(k_0-1)q$）都有在 $z_*$ 两个底坐标处非零的固定截面；Serre 生成允许这些有限选择；它们为共同证明里
\[
 B_p=k_0\lfloor p/k_0\rfloor L+T_0
\]
提供残余次数，差 $B_p-pL$ 属于一个固定的有限表（`build/sections/finite-inputs.tex:178-187`）。这个 $\lfloor p/k_0\rfloor$ 的写法我盯了很久：它保证 $B_p$ 与 $pL$ 的差只取有限多个值，于是端点比较里那个"分子的项在固定有限表里"成立，否则 $O(p^{-1})$ 无法一致。

终局（我按素材的复述整理，`build/sections/finite-inputs.tex:194-296`）。散布固定数据，在充分大特征 $p$ 的光滑归约上工作，记号照旧。相对 Frobenius $F:W\to W'$，$S_0'$ 是 $S_0$ 的基域扭曲，置
\[
 \mathcal E=F_*\mathcal O_W(B_p),\qquad s=\operatorname{rk}\mathcal E=p^n,\qquad R=s^2=p^8,\qquad U_a=H^0\bigl(W,\mathcal O_W(B_p+paS_0)\bigr).
\]
投射公式给出赋值映射
\[
 \Phi_p:\bigoplus_{\substack{a+b=q\\a,b\ge0}}U_a\otimes U_b\otimes\mathcal O_{W'\times W'}(-aS'_{0,1}-bS'_{0,2})\longrightarrow\mathcal E\boxtimes\mathcal E .
\]
固定 jet 截面的乘积乘上固定填充，生成 $z_*$ 处参数 $p$ 次幂的局部商；记 $A_*$ 为两个底 Frobenius 纤维代数的张量积，若环面坐标 $z$ 在 $z_*$ 取 $z_0\ne0$，该商就是 $A_*[z]/(z^p-z_0^p)$；往 $A_*$ 的基 $1,z,\ldots,z^{p-1}$ 中 $1$ 的系数作投影，恰有被 $p$ 整除的权存活，于是 $\Phi_p$ 的值张成 $A_*$，其维数是 $R$，故 $\Phi_p$ 泛型秩为 $R$。

我第一版在这里算错过一次：我以为赋值映射的秩只会是 $R$ 的一个下界，"张成 $A_*$"应当给上界。素材的说法是"values span $A_*$"，维数为 $R$，于是秩恰为 $R$。方向之所以如此，是因为生成元给出的商是循环的、系数投影是满的；这一步在正特征里靠 $z^p-z_0^p=(z-z_0)^p$ 的纯不可分性，与我熟悉的特征零直觉不同。

对角线上完全不同：各列限制为 Frobenius 纤维积
\[
 \Delta_F=W\times_{W'}W,\qquad \mathcal L_p=\mathcal O_{\Delta_F}(B_{p,1}+B_{p,2}+pqS_{0,1})
\]
上一个线丛的整体截面；$pS_{0,1}$ 与 $pS_{0,2}$ 在 $\Delta_F$ 上同构，故所有权对 $(a,b)$ 给同一个丛，每个对角点处的秩至多 $h^0(\Delta_F,\mathcal L_p)$。对角理想的滤过有分级丛
\[
 \mathcal G_j=\mathcal O_W(2B_p+pqS_0)\otimes A_j(\Omega_W^1),\qquad 0\le j\le n(p-1),
\]
$A_j$ 是对称代数模掉局部生成元的 $p$ 次幂后的 $j$ 次部分；记 $e_j=\operatorname{rk}A_j$，则 $\sum_je_j=p^n$。斜率估计与我那一条固定旗给出共同界
\[
 h^0(W,\mathcal G_j)\ \le\ e_jp^n\bigl(7^nH^n+O(p^{-1})\bigr),
\]
误项与 $j$ 无关；求和得每个对角秩 $\le R(7^nH^n+O(p^{-1}))<R/4$，因为 $7^nH^n\le(14\epsilon)^n<1/4$（`build/sections/finite-inputs.tex:225-252`）。$O(p^{-1})$ 与 $j$ 无关，我把它读成 Langer 关于 Frobenius 不稳定误差的估计只提供一次全局误差、按 $j$ 求和时不会被放大 $p^n$ 次；素材在引言里正是把 Langer 列为"控制 Frobenius 不稳定误差"的来源。

最后把两个阶对上。选 $\Phi_p$ 的 $R$ 个泛型无关列，记 $m_i$ 为它们在槽 $i$ 的权和；其非零行列式是截面
\[
 0\ne\sigma\in H^0\bigl(W'\times W',\mathcal Q_1\boxtimes\mathcal Q_2\bigr),\qquad \mathcal Q_i=(\det\mathcal E)^{\otimes s}\otimes\mathcal O_{W'}(m_iS_0'),
\]
这两个是实际的线丛；在数值认同到基域扭曲之下
\[
 \frac{c_1(\mathcal Q_i)}{R}=\frac{B_p}{p}+\frac{p-1}{2p}K_W+\lambda_iS_0=Q_{\lambda_i}+\frac{B_p-pL-K_W/2}{p},\qquad \lambda_i=\frac{m_i}{R}\in[0,q],
\]
末项的分子属于那个固定有限表，于是端点比较把每个规范化类与 $\gamma$ 的交界在 $(40\epsilon+O(p^{-1}))J_x\gamma$，对所有所选列一致。令 $x'=F(x)$；$\mathcal Q_i$ 的任一非零截面在 $x'$ 处吹-up 上零除子的严格变换有效，与 $\gamma$ 的扭曲非负配对（该曲线仍是固定 ample 完全交的推前），由 $J_x\gamma>0$ 得每个这样的截面在 $x'$ 的阶至多 $R(40\epsilon+O(p^{-1}))$。按两因子消灭阶适配的基来看，外乘积的非零截面阶至多这两个界之和；同一双次数内首项张量线性无关，不同双次数不能相消，故
\[
 \operatorname{ord}_{(x',x')}\sigma\ \le\ R\bigl(80\epsilon+O(p^{-1})\bigr).
\]
可对角秩 $<R/4$：常值行变换使所选矩阵在这一点有超过 $3R/4$ 行为零，逼出 $\operatorname{ord}_{(x',x')}\sigma\ge3R/4$。两阶与 $80\epsilon<3/4$ 在 $p$ 大时冲突。泛型秩的计算用了 $z_*$，对角比较用的是独立选出的 $x$，这正是定理允许 $z_*$ 不在 $x$ 上方的原因。

于是第 3 节的 terminal 反例不存在；典范截面空间在其双有理构造中被保持，定理得证。回头看，我在第 1 节猜的"把碎片拼起来加一个极端情形的专门论证"里，那个专门论证原来是三段式的：第 7 节给一个阶的上界，第 11 节给一个秩的下界，第 13 节把两者都翻译成正特征里同一个行列式的两个阶。三段里没有任何一段用到丰沛定理，而我最初以为整篇都在用丰沛。

## 14 回到原始正规簇：一条不用任何丰沛的线性代数

几何论证给出的是光滑四折上的典范截面，而我想要的推论关于原始的正规偶 $(X,\Delta)$。Hashizume 的归约把光滑典范非消失换成"带实边界的 lc 偶与对数极小模型在维数 $\le4$ 的非消失"，产出一条实的有效代表 $D\sim_{\mathbb R}G\ge0$；剩下的活是把实的 $G$ 换成有理的，同时保住支撑与线性等价（`build/sections/conclusion.tex:1-7`）。这一步我一开始以为琐碎，试着直接把 $G$ 的系数有理逼近：失败原因很干脆，$D-G$ 是实系数主除子之和，逐系数四舍五入以后那条线性等价立刻不成立，而支撑条件与线性等价条件必须同时保住。

素材给的引理只有有限线性代数，不碰任何非消失或丰沛（`build/sections/conclusion.tex:9-23`）。设 $M=(m_{ij})\in\operatorname{Mat}_{w\times v}(\mathbb Q)$，$d\in\mathbb Q^w$。若方程组
\[
 d_i-y_i=\sum_{j=1}^{v}m_{ij}b_j\quad(1\le i\le w),\qquad y_i\ge0
\]
有实解，则它有有理解；并且可以要求恰好与给定实解相同的 $y_i$ 为零。于是一旦 $X$ 是域 $k$ 上正规整簇、$D$ 是有理 Weil 除子、$D\sim_{\mathbb R}G$ 且 $G$ 是实有效 Weil 除子，就有 $D\sim_{\mathbb Q}G_{\mathbb Q}$，$G_{\mathbb Q}$ 有效有理且 $\operatorname{Supp}G_{\mathbb Q}=\operatorname{Supp}G$；若规定的正整数 $r$ 使 $rD$ Cartier，则存在 $m>0$ 使 $H^0(X,\mathcal O_X(mrD))\ne0$。

证明的第一拍很干净：把给定实解中为零的那些坐标固定令 $y_i=0$，连同展示的方程，它们定义 $\mathbb Q$ 上一个非空仿射空间；在 $\mathbb Q$ 上作高斯消元给有理特解与方向空间的有理基，故有理点在实点中稠密；把给定点足够逼近，剩下有限多个 $y_i$ 全保持严格正。素材特意补了一句：这也处理了所有 $y_i$ 都为零、或仿射空间维数为零的情形。第二拍把除子翻译成这张表：取有限表达式
\[
 D-G=\sum_{j=1}^{v}a_j\operatorname{Div}(f_j),\qquad a_j\in\mathbb R,\quad f_j\in k(X)^*,
\]
列出 $D,G$ 与这有限多个主除子支撑中的素除子 $P_1,\ldots,P_w$，写 $D=\sum d_iP_i$，令 $m_{ij}\in\mathbb Z$ 为 $\operatorname{Div}(f_j)$ 里 $P_i$ 的系数；$G$ 的系数与 $a_j$ 给出实解，有理解给出 $G_{\mathbb Q}=\sum y_iP_i\ge0$、同样支撑、且 $D-G_{\mathbb Q}=\sum b_j\operatorname{Div}(f_j)$。第三拍取正整数 $N$ 同时被 $r$ 与所有 $y_i,b_j$ 的分母整除，
\[
 ND-NG_{\mathbb Q}=\operatorname{Div}\!\left(\prod_j f_j^{Nb_j}\right),
\]
有效整除子 $NG_{\mathbb Q}$ 因 $ND$ Cartier 且二者之差主而 Cartier，它给出 $\mathcal O_X(ND)$ 的非零截面；写 $N=mr$。素材收尾一句我抄下来当成本节的道德：不需要 $\mathbb Q$-factoriality，所有等式都是 $X$ 上 Weil 除子的等式（`build/sections/conclusion.tex:56-58`）。

推论的陈述里有两处我读第一遍时看漏的强度：$X$ 不必 $\mathbb Q$-factorial；$m$ 可以依赖偶与规定的指标 $r$（`build/sections/introduction.tex:80-82`）。这两处都是"定性结论"这个词的具体含义。至于从第一条截面到丰沛本身，素材把活推给另一篇 companion 里关于从约化支撑抬升伴随截面与"非消失后接丰沛"的两个定理，并声明那个推论不进入本文的证明（`build/sections/introduction.tex:83-88`）。

## 15 与最初设想的偏差、我不信任的地方、以及缺口清单

偏差之一，关于权重。我原以为这篇论文的新技术集中在解析侧，极小度量与 Lelong 数会贯穿始终。读完以后我给的比例是：解析内容只占第 9 与第 10 两节里的那一段，两处引用 companion 的定理，一次给零 Lelong 的半正度量，一次给 $H^1$ 的内点单射；其余全是交理论与一次正特征的线性代数。可是这两处引用是不可替代的：它们出现在有符号代表的支撑必须被证明是对数一般型的那个唯一位置，而那正是多重截面情形（第 11 节末格）的咽喉。

偏差之二，关于 jet 的角色。我一开始以为 jet 只是"取截面消灭条件"的手段，用完就丢。实际是双份的、方向相反的：第 7 节用移动 jet 核把消灭阶压小（上界 $32k\epsilon$），第 11 节用丛上的 jet 把赋值秩抬到 $R=p^8$ 的满秩，第 13 节再让这两个信息在同一个行列式的阶上相互撕。我在第 7 节末尾写下"反证假设的强度被我超额用掉了"时，指的正是这个不对称：一致性只关于消灭阶、不关于次数，而结论只要存在一个次数。

偏差之三，关于正特征。我原以为正特征只是最后的一点算术点缀。素材的写法是：全部有限数据必须先在 $\mathbb C$ 上钉死，然后才允许 $p$ 趋于无穷（`build/sections/finite-inputs.tex:188-192`），而且明确拒绝以"伪有效锥特殊化到正特征"为路径（`build/sections/finite-inputs.tex:174-176`）。这条纪律回头解释了为什么第 6 节的障碍引理里每个常数都必须与 $t$ 无关：它们要在归约之前就是数。

我不信任或者至少要复查的地方，按可疑程度排。

`[推测]` 第一条：本篇对三篇 companion 的依赖是承重墙。素材在移动中心一节把数值子伴随、基分量界、有限覆盖引理都指回那篇关于丰沛的 companion（它的第 7.1 到 7.5 条），把整条有限数据 Frobenius 不相容定理指回同一篇的第 9.1 条，把极小度量与内点单射指回另一篇的第 1.1 与 1.2 条。本篇的重证只有移动重数引理、有界度曲线障碍、标量界、有符号代表命题、双槽排除、对应族排除、以及有限数据的验证。由于 `build/bibliography.tex` 我没读，我无法核对这些被引条目的陈述是否与本篇的使用逐字对齐，这是我这篇笔记里最大的不确定来源；理由：素材正文里的引用只给键名与条款号。

`[推测]` 第二条：数值余量的薄。$32\epsilon<c<40\epsilon$ 只用一次余量，同一个 $40\epsilon$ 还要吸收端点比较里的 $O(p^{-1})$，最后 $80\epsilon<3/4$ 要与 $3R/4$ 相撞；每一步都刚好够，没有第二步余量。我复查时最想改的是这条链，但它看起来是 tight 的，我不认为有笔误；我说不出更好的界，只能标出来。理由：素材没给任何备选常数。

`[推测]` 第三条：第 8 节里 dlt 翻转的那段辩护。文献里的终止性定理多以 klt 陈述，而 $(W,D_W)$ 的边界系数全是 $1$，素材用"压低有限多个系数同时保留给定极值射线的负性、再用相对 Picard 数一收缩下降数值平凡差的 Cartier 倍"来搬。这个手法本身我复算过、能自洽（长度界那步 $a_C<16\delta/(1-2\delta)<1/\ell$ 我逐项验算过），但它是本篇里唯一一处"为了套用已知定理而临时改造假设"的地方，我把它列为需要独立核对的位置。理由：素材自己写了"这不是把先驱定理去掉假设直接用"这一类免责声明两处，说明作者预期到读者的疑问。

`[推测]` 第四条：第 11 节系数理想那一段里，"$\mathfrak a$ 恰是联合理想，只同支撑不够"的强调。我复算过：阈值构造需要的是 $\mathfrak a\subseteq\mathfrak m^h$ 的阶信息与孤立性，同支撑只给根理想相等。素材的措辞是"precisely the joint ideal, not merely an ideal with the same support"，我把它读成对本篇早期版本的一处修订；但没有版本历史可读，这条只能标 `[推测]`。

`[推测]` 第五条：第 13 节"$\Phi_p$ 的值张成 $A_*$、维数 $R$、故泛型秩恰为 $R$"这一步，我的特征零直觉给的是下界；素材的论证靠环面坐标的纯不可分商 $A_*[z]/(z^p-z_0^p)$ 与权被 $p$ 整除者存活。我把这当成全篇唯一一处我"看懂了但不会自己想到"的线性代数，值得单独复查一次。理由：本篇不重复那套证明，它属于 companion 的第 9.1 条。

覆盖缺口（与上面不同类，这是取材侧的）：`build/bibliography.tex`（11,535 字节）未读；`typst/` 分片按规格不算素材；`README.md` 我只当索引；两篇被本篇指为"完整 companion"的文件在本目录之外，我没有读它们的授权，因此凡是本篇"引用而不重证"的定理，我在本笔记里都只记录其陈述、不判断其证明。取证调用 14 次、上限 15 次，剩余 1 次我没有动用，因为第 11 节的分两段读取已覆盖到第 873 行末尾，再加调用只会重复读同一个文件。

## 16 记号与不等式的逐条书写

这一节是我给自己做的可移植性检查表：每个记号单独一行，每行都带一个不依赖任何自定义宏的写法。

- 基域 $\mathbb C$，除非常规归约到特征 $p>0$ 之后。
- $X$ 是光滑连通射影复四折，$\dim X=4$，全文记 $n=4$。
- $K_X$ 是其典范除子，伪有效指数值类落在有效类闭包内。
- 目标是某个 $m\ge1$ 使 $H^0(X,mK_X)\ne0$，$m$ 无需一致。
- $Y$ 是固定的 terminal 极小模型，$K=K_Y$ 满足 $K$ nef 且 $K^4=0$。
- $\kappa(Y,K)=-\infty$ 是反证假设给出的。
- $q(Y)=h^1(Y,\mathcal O_Y)=0$。
- $\iota\ge1$ 使 $\iota K$ 为 Cartier 除子，$S_0=\iota K$。
- 曲线界 $K\cdot C\ge 1/\iota$ 对所有过 $Y^{\mathrm{vg}}$ 的整曲线成立。
- $Y^{\mathrm{vg}}$ 是可数个真闭子集之补，$Y_{\mathrm{sm}}$ 是光滑轨迹。
- $A$ 是固定的 very ample Cartier 除子，$t\in\mathbb Q_{>0}$ 可调。
- $\mu_t=((K+tA)^4)^{1/4}$，$r_t\mu_t\to\epsilon$，$L_t=r_t(K+tA)$。
- $L_t^4\to\epsilon^n$ 即 $L_t^4\to\epsilon^4$，$r_t\to\infty$，$L_t\cdot C\ge r_t/\iota$。
- $\epsilon$ 固定且满足 $(14\epsilon)^4<1/4$，即 $\epsilon<1/(4\cdot 14^4)^{1/4}$ 量级。
- $\epsilon$ 另须满足 $80\epsilon<3/4$，即 $\epsilon<3/320$。
- $P_{\mathrm s}=2r_t(K+2tA)$，$\rho_t=(P_{\mathrm s}^{\,4})^{1/4}$，$\epsilon\le\rho_t\le8\epsilon$。
- nef 序下的 $2L_t\le P_{\mathrm s}\le4L_t$，其含义是差为 nef。
- 标量阶界 $\operatorname{ord}_x(s)\le 4k\rho_t\le 32k\epsilon$。
- 层序列 $\tau_0<\cdots<\tau_d$ 的间距 $\tau_{i+1}-\tau_i=\delta>0$。
- 重数 $h=\lceil k\delta/2\rceil$ 满足 $k/h\le 2/\delta$。
- 基分量次数界 $P^f\cdot V\le(k/h)^aP^d$，$a=d-f$。
- 基分量典范界 $K_{V^*}\cdot P^{f-1}\le(K_Z+cP)|_V\cdot P^{f-1}$，$0<c\le ak/h$。
- 数值子伴随 $K_{V^*}\cdot(\rho^*P)^{f-1}\le(K_Z+\Theta)|_V\cdot(P|_V)^{f-1}$。
- 障碍引理的输入 $0<P_t^f\le C_0$ 与 $(K_{V_t^*}+G_t)\cdot P_t^{f-1}\le C_1P_t^f$。
- 一致双有理界 $b=b(f)$ 使 $\lvert b(K_{V_t^*}+G_t)\rvert$ 双有理。
- 混合界 $P_t\cdot H_b^{f-1}\le(bC_1)^{f-1}C_0$ 与曲线度 $L_t\cdot e_t(C)\le(bC_1)^{f-1}C_0$。
- $Z=\mathbb P(\mathcal O(S_{0,1})\oplus\mathcal O(S_{0,2}))$，$\xi=c_1(\mathcal O_Z(1))$，$d=\dim Z=9$。
- $P=L_1+L_2+q\xi$，这里 $q$ 是丛的权，与 $q(Y)=0$ 无关。
- 体积双界 $c_nq\epsilon^{2n}\le P^d\le C_nq\epsilon^{2n}$，$n=4$，$d=9$。
- 切片 $Z_{\mathrm{sl}}=\mathbb P(\mathcal O_Y\oplus\mathcal O_Y(S_0))$，$P_{\mathrm{sl}}=L+q\xi_{\mathrm{sl}}$。
- 切片体积 $0<P_{\mathrm{sl}}^{\,5}\le2^{5}q\epsilon^4=32q\epsilon^4$。
- 间距条件 $(2/\delta)^4\cdot2^{6}\epsilon^4<1$（$n=4$ 时代入）。
- 权 $q$ 的条件 $P^9>(2n+3+d\delta)^9=(11+9\delta)^9$。
- Seshadri 常数 $\varepsilon(P;z)=\inf_{C\ni z}(P\cdot C)/\operatorname{mult}_zC$。
- 结论 $\varepsilon(P;z)>2n+2=10$ 在环面开集的极一般光滑点成立。
-  jet 层 $\tau_j=2n+3+j\delta=11+j\delta$，$0\le j\le 9$。
- 填充系 $kL+(2kq-j)S_0$ 对 $0\le j\le kq$ 同时 Cartier 且全局生成。
- 典范支配 $K_{\mathrm{bundle}}=-2\xi+(\iota+1)K_\Sigma\le((\iota+1)/r_t)P_{\mathrm{bundle}}$。
- 多重截面次数 $e>0$ 与 $D_0-D_\infty\sim e\iota K$，$J=(D_0-D_\infty)/(e\iota)\sim_{\mathbb Q}K$。
- 轴类 $\Sigma_0\sim\xi_{\mathrm{sl}}$，$\Sigma_\infty\sim\xi_{\mathrm{sl}}-S_0$，$P_{\mathrm{sl}}-q\Sigma$ nef。
- 有符号命题的结论：$K_W+D_W$ big，其中 $D_W$ 含真支撑与全部例外除子。
- $\ell M$ Cartier，$0<\delta<\min\{1/2,1/(16\ell+2)\}$，$M=K_Z+D_Z$。
- 长度界 $0<-(M-D_Z/2)\cdot C\le 2\dim Z=8$，$a_C=M\cdot C$，$b_C=D_Z\cdot C$。
- 离散性 $0\le a_C<16\delta/(1-2\delta)<1/\ell$ 与 $a_C\in\ell^{-1}\mathbb Z$ 逼出 $a_C=0$。
- nef 区间：$M'-uD'$ nef 且 $(Z',(1-u)D')$ klt 对 $0<u\le\delta$。
- 壁 $B=(1-s)D'+(s/a)G'$，$\alpha=1+s/a$，$N=K'+B$，$a=\max_jg_j>0$。
- $S=\lfloor B\rfloor\ne0$，$0\le B\le D'$，$N\sim_{\mathbb Q}\alpha M'-sD'$。
- 乘子理想 $\mathcal J(Z',B)=\mathcal I_S$，$\mathcal J(Z',bB)=\mathcal O_{Z'}$ 对 $0<b<1$。
- 端点 $0<b_0<1=b_1<b_2$，$C_i=A_R+h^*(K'+b_iB)-K_R\ge0$，$C_0\le C_1\le C_2$。
- $t_i(m)=(m-1)\alpha+(1-b_i)s/a$，$v_i(m)=(m-1)s-(1-b_i)(1-s)$，$u_i(m)=v_i/t_i\to s/\alpha$。
- floor 计算 $K_R+L_R-\lfloor C_i\rfloor=h^*(mN)+\lceil K_R-h^*(K'+b_iB)\rceil$。
- dlt 抬升 $g:(Q,B_Q)\to(Z',B)$，$T=\lfloor B_Q\rfloor$，$K_T+\operatorname{Diff}_T=g^*N|_T$。
- 下降 $g_*\mathcal O_Q(-T)=\mathcal I_S$，$R^ig_*\mathcal O_Q(-T)=0$（$i>0$），$g_*\mathcal O_T=\mathcal O_S$。
- 终局 klt 偶 $(Z',(1-s/\alpha)D')$，其伴随 $\sim_{\mathbb Q}N/\alpha$，$\kappa=0$。
- 定理数据里的 $H$：$H^n\le(2\epsilon)^n$，$K_WH^{n-1}\le 2H^n/r_t$，$(2L+qS_0)H^{n-1}\le4H^n$。
- 旗 $h_i=l_iH$（$1\le i\le 3$），$\Lambda=\prod_{i=1}^{3}l_i$，$[C]=\Lambda H^3$，$h_i\cdot C=l_i\Lambda H^4$。
- 斜率条件 $\mu_{\min}(\Omega_W^1$ 限制到 $C)\ge0$，我一律写成 $\mu_{\min}\bigl(\Omega_W^1\bigr\rvert_C\bigr)\ge0$。
- $D^+=2r_t(K+2tA)+2E$，$K_W=K+E$，$E\ge0$ 例外，$r_t>q\iota+1$。
- movable 类 $\gamma$：$J_x\gamma>0$，$(\pi_x^*D^+)\gamma<40\epsilon J_x\gamma$，$\pi_x^*(L+K_W/2+\lambda S_0)\gamma\le40\epsilon J_x\gamma$。
- $Q_\lambda=L+K_W/2+\lambda S_0$，$D^+-Q_\lambda=(r_t-1/2-\lambda\iota)K+3r_ttA+\tfrac32E$。
- 正特征数据：$B_p=k_0\lfloor p/k_0\rfloor L+T_0$，$\mathcal E=F_*\mathcal O_W(B_p)$，$s=p^n=p^4$，$R=s^2=p^8$。
- $U_a=H^0(W,\mathcal O_W(B_p+paS_0))$，$\Phi_p$ 的泛型秩为 $R$。
- 对角：$\Delta_F=W\times_{W'}W$，$\mathcal L_p=\mathcal O_{\Delta_F}(B_{p,1}+B_{p,2}+pqS_{0,1})$，秩 $\le h^0(\Delta_F,\mathcal L_p)$。
- 分级丛 $\mathcal G_j=\mathcal O_W(2B_p+pqS_0)\otimes A_j(\Omega_W^1)$，$0\le j\le n(p-1)$，$e_j=\operatorname{rk}A_j$，$\sum_je_j=p^n$。
- 求和界 $h^0(W,\mathcal G_j)\le e_jp^n(7^nH^n+O(p^{-1}))$，对角秩 $<R/4$。
- 行列式线丛 $\mathcal Q_i=(\det\mathcal E)^{\otimes s}\otimes\mathcal O_{W'}(m_iS_0')$，$\lambda_i=m_i/R\in[0,q]$。
- 两阶：$\operatorname{ord}_{(x',x')}\sigma\le R(80\epsilon+O(p^{-1}))$ 与 $\operatorname{ord}_{(x',x')}\sigma\ge 3R/4$。
- 有理可行：$d_i-y_i=\sum_{j=1}^{v}m_{ij}b_j$，$y_i\ge0$，$M\in\operatorname{Mat}_{w\times v}(\mathbb Q)$，$d\in\mathbb Q^w$。
- 指标处方：$N$ 同时被 $r$ 与所有 $y_i,b_j$ 的分母整除，$N=mr$，$H^0(X,\mathcal O_X(mrD))\ne0$。

## 17 勘误

按规格，已落盘的内容我不动，只在文末登记问题，并只用类别指代禁串。

一、语风禁令的三类残留，共四处，我按类别列出位置，逐字复现由规格禁止。第一类是"二字让步转折连读"，共三处，分别在第 2 节的"死路之三"段、第 8 节讨论 dlt 与 klt 差别的那句、第 13 节解释为何令 $H$ 需扰动的那句。处置：这三处的语义都可以改写成两个独立短句，我在第 13 节之后所有新写入的句子都按这个方式组织。第二类是"四字提示套语"，一处，在第 5 节讲整个核的那段末尾，紧接在我引用素材原话之后；那是我本来打算提醒自己"该句式被禁"却先把禁句写了出来，属于自我违规，语义由后一句"这条正是我先前做法的致命处"承担。

二、前向指针错位一处。第 6 节末尾我写"我在第 9 节的多重截面情形里确实用到了 $G_t\ne0$"，按最终排布，多重截面情形落在第 11 节末段，第 9 节只给出它所依赖的命题陈述。第 4 节指向第 14 节、第 5 节指向第 11 节与第 15 节、第 1 节指向第 10 节、第 2 节指向第 11 节、第 9 节指向第 10 节，这五处复核过，编号与内容都对应。

三、中英混排残留三处：第 5 节一个英文动词原形、第 11 节一个英文副词、第 13 节一个英文名词复数形式；另有多处把 big、nef、Cartier、klt、lc、dlt 这类术语保留原文。这些不影响记号可移植性，也不属于禁串，但确实是我草稿期的痕迹，登记在此。

四、我复查过的其他项：全文无长停顿号，无整行分隔线，无 emoji 或对勾，无装饰性成对星号，无连续两个中文逗号；台账表头两行按规格逐字，且只出现一次；台账每行的竖线数目为 6，单元格内不出现裸竖线，需要限制算子时写成 `\bigr\rvert` 或 `\mid` 的形式。`$` 的总数我逐节复量，均为偶数，无错位。

## 18 台账：本篇每个数住在哪、谁在吃它

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\iota$ | $K\cdot C\ge 1/\iota$，$\iota K$ Cartier | build/sections/reduction.tex:20 | 第 3、6、12 节的曲线矛盾 | 障碍引理收尾时无下界可用 |
| $n$ | $n=4$，$d=\dim Z=2n+1=9$ | build/sections/two-slot.tex:59 | 全部层数与体积幂次 | $d+1$ 层里必有两层重合不再成立 |
| $r_t$ | $r_t\to\infty$，$r_t\mu_t\to\epsilon$ | build/sections/moving-centers.tex:24 | 曲线度下界 $r_t/\iota$ | 拉锯的下臂消失 |
| $\mu_t$ | $\mu_t=((K+tA)^n)^{1/n}\to0$ | build/sections/moving-centers.tex:16 | $r_t$ 的存在性 | 无法把体积钉在 $\epsilon^n$ |
| $L_t^{\,n}$ | $L_t^{\,n}\to\epsilon^n$，$L_t\cdot C\ge r_t/\iota$ | build/sections/moving-centers.tex:25 | 一切体积常数 $C_0,C_1$ | 上界随 $t$ 漂移，一致性丢 |
| $\rho_t$ | $\epsilon\le\rho_t\le 8\epsilon$ | build/sections/moving-centers.tex:365 | 层的间距与标量阶 | $\operatorname{ord}_x(s)\le32k\epsilon$ 失效 |
| $P_{\mathrm s}$ | $P_{\mathrm s}=2r_t(K+2tA)$，$2L\le P_{\mathrm s}\le4L$ | build/sections/moving-centers.tex:356 | 第 7 节与 $D^+$ 的定义 | 第 13 节 $D^+-Q_\lambda$ 首系数不再正 |
| $\delta_{\mathrm s}$ | $\delta_{\mathrm s}=\rho_t/n$，$2\rho_t$ 到 $3\rho_t$ 分 $n+1$ 层 | build/sections/moving-centers.tex:398 | 移动重数前提 $k\delta\ge4$ | 无相邻两层共享分量 |
| $h$ | $h=\lceil k\delta/2\rceil$，$k/h\le 2/\delta$ | build/sections/moving-centers.tex:169 | 所有 $(2/\delta)^{a}$ 型界 | 基分量次数界放大无界 |
| $\tau_{i+1}-\tau_i$ | $=\delta>0$，导数可用阶数 $\ge k\delta-1$ | build/sections/moving-centers.tex:148 | 整个较低核含导数 | 子列不含导数，理想幂断 |
| $P^f\cdot V$ | $\le(k/h)^aP^d$，$a=d-f$ | build/sections/moving-centers.tex:108 | 第 7 与第 11 节的顶次界 | 障碍引理的 $C_0$ 无界 |
| $c$ | $0<c\le ak/h$ | build/sections/moving-centers.tex:114 | 典范界的边界系数 | 一般点处 lc 与 lc 位不再成立 |
| $b(f)$ | $\lvert b(K_{V_t^*}+G_t)\rvert$ 双有理 | build/sections/moving-centers.tex:286 | $H_b\cdot P_t^{f-1}\le bC_1P_t^f$ | 混合交界失去起点 |
| $(bC_1)^{f-1}C_0$ | 与 $r_t/\iota$ 之比趋于 $0$ | build/sections/moving-centers.tex:302 | 第 6 节的最终矛盾 | 曲线度上下界不再冲突 |
| $\operatorname{ord}_x(s)$ | $\le 4k\rho_t\le 32k\epsilon$ | build/sections/moving-centers.tex:377 | movable 试验的反证 | $\pi_x^*D^+-40\epsilon J_x$ 的大性无从否定 |
| $2^{-n}$ | $1\le 2^{-n}$，$n=4$ 即 $1\le 1/16$ | build/sections/moving-centers.tex:408 | 排除零维基分量 | 最低核可只含孤立点，追不到分量 |
| $q$ | $P^d>(2n+3+d\delta)^d$，即 $P^9>(11+9\delta)^9$ | build/sections/two-slot.tex:189 | 每层 jet 核非空的计数 | 环面点处无正维数基轨迹 |
| $\delta$ | $(2/\delta)^n2^{n+2}\epsilon^n<1$ | build/sections/two-slot.tex:184 | 切片点情形 $q<q$ 的矛盾 | 整条纤维那一格漏网 |
| $P^d$ | $c_nq\epsilon^{2n}\le P^d\le C_nq\epsilon^{2n}$ | build/sections/two-slot.tex:138 | $q$ 可取大的依据 | 体积对 $q$ 的线性丢失 |
| $P_{\mathrm{sl}}^{\,n+1}$ | $0<P_{\mathrm{sl}}^{\,n+1}\le 2^{n+2}q\epsilon^n$ | build/sections/two-slot.tex:142 | 切片纤维的次数界 | 第 11 节第二格失效 |
| $\varepsilon(P;z)$ | $>2n+2=10$ | build/sections/two-slot.tex:214 | 第 13 节数据 (ii) 的 jet 阶 | 赋值秩下界 $R$ 无从生成 |
| $\mathfrak m_{z_*}$ 的幂 | $(2n+2)k_0+1=10k_0+1$ | build/sections/two-slot.tex:833 | 定理条件 (ii) | 满射不成立，泛型秩断 |
| $K_{\mathrm{bundle}}$ | $=-2\xi+(\iota+1)K_\Sigma\le((\iota+1)/r_t)P$ | build/sections/two-slot.tex:86 | 移动中心的典范界 | $C_1$ 依赖 $t$，一致性丢 |
| $\deg(g_i)$ | $\deg(g_i)\le B_0/L^n$，$L^n\to\epsilon^4$ | build/sections/two-slot.tex:259 | 同时有限覆盖引理前提 | 覆盖清单无限，平移计数崩 |
| $d_J$ | $0<d_J\le C_3=B_1B_0$ | build/sections/two-slot.tex:290 | 分支素除子扫遍的排除 | 分支轨迹记不上账 |
| $C_4d_J$ | $K_{J^*}L^{n-2}\le d_J/r_t+d_J^2/L^n\le C_4d_J$ | build/sections/two-slot.tex:316 | 障碍引理的典范输入 | 分支除子缺顶次界 |
| $e$ | $D_0-D_\infty\sim e\iota K$，$e>0$ | build/sections/two-slot.tex:736 | 有符号代表 $J$ 的构造 | 多重截面那一格无法进入第 8 节 |
| $\dim A_U$ | $\dim A_U=\dim Y=n=4$ | build/sections/two-slot.tex:438 | 轨道映射一般有限 | 曲线 $C$ 无法在Abel 簇里取 |
| $K_{T_A}\cdot C$ | $0=g^*K\cdot C+R\cdot C>0$ | build/sections/two-slot.tex:465 | 对应族排除的收尾 | $1/\iota$ 缺席，双有理群白算 |
| $\delta$ 于有符号节 | $0<\delta<\min\{1/2,1/(16\ell+2)\}$ | build/sections/signed.tex:160 | crepancy 归纳的每一步 | $\ell M$ 的 Cartier 性第一步即丢 |
| $a_C$ | $0\le a_C<16\delta/(1-2\delta)<1/\ell$，$a_C\in\ell^{-1}\mathbb Z$ | build/sections/signed.tex:185 | $a_C=0$ 的离散性 | 翻转不再对整个伴随 crepant |
| 长度界 | $0<-(M-D_Z/2)\cdot C\le 2\dim Z=8$ | build/sections/signed.tex:177 | 上一条里的 $16$ | 无法把 $\delta$ 与 $\ell$ 咬合 |
| $\alpha$ | $\alpha=1+s/a$，$s/\alpha\in(0,\delta)$ | build/sections/signed.tex:251 | $u_i(m)\to s/\alpha$ 留在区间内 | 端点残丛不再是否 klt nef 伴随 |
| $u_i(m)$ | $u_i(m)=v_i/t_i\to s/\alpha$ | build/sections/signed.tex:326 | 端点度量的存在性 | 内点单射假设不满足 |
| $\mathcal J(Z',B)$ | $\mathcal J(Z',B)=\mathcal I_S$，$\mathcal J(Z',bB)=\mathcal O_{Z'}$ | build/sections/signed.tex:271 | 识别 $H^1$ 比较映射 | 满射与抬升断开 |
| $\kappa(N)$ | $\kappa(N)=0$ | build/sections/signed.tex:445 | 判据的非负维数前提 | 半ample 结论无从谈起 |
| $H^n$ | $H^n\le(2\epsilon)^n$ | build/sections/finite-inputs.tex:76 | $(14\epsilon)^n<1/4$ 的输入 | 对角秩 $<R/4$ 失守 |
| $7^nH^n$ | $7^nH^n\le(14\epsilon)^n<1/4$ | build/sections/finite-inputs.tex:251 | 全体对角秩的和界 | 秩差被误项吞掉 |
| $R$ | $R=s^2=p^8$，$s=\operatorname{rk}\mathcal E=p^n$ | build/sections/finite-inputs.tex:205 | 泛型秩与行列式的阶 | 两个阶的比值无处安放 |
| $40\epsilon$ | $Q_\lambda\gamma\le D^+\gamma<40\epsilon J_x\gamma$ | build/sections/finite-inputs.tex:170 | 端点比较与截面阶 | $\operatorname{ord}_{x'}\le R(40\epsilon+O(p^{-1}))$ 不成立 |
| $80\epsilon$ | $80\epsilon<3/4$ | build/sections/finite-inputs.tex:19 | 终局矛盾 | 与 $\operatorname{ord}\ge 3R/4$ 并存而不出冲突 |
| $r_t$ 的下界 | $r_t>q\iota+1$ | build/sections/finite-inputs.tex:63 | $D^+-Q_\lambda$ 首系数正 | 数据 (iii) 的端点不等式作废 |
| $\Lambda$ | $[C]=\Lambda H^{n-1}$，$\Lambda=\prod_{i=1}^{n-1}l_i$ | build/sections/finite-inputs.tex:105 | 旗的交论与求和界 | 分级丛的截面数无从估 |
| $\mu_{\min}$ | $\mu_{\min}\bigl(\Omega_W^1\bigr\rvert_C\bigr)\ge0$ | build/sections/finite-inputs.tex:98 | $h^0(W,\mathcal G_j)$ 的斜率界 | $R/4$ 的对角界失去根据 |
| $\sum_j e_j$ | $\sum_j e_j=p^n$，$0\le j\le n(p-1)$ | build/sections/finite-inputs.tex:242 | 按 $j$ 求和的合法性 | 分级丛漏项，秩界偏低 |
| $B_p$ | $B_p=k_0\lfloor p/k_0\rfloor L+T_0$，差属有限表 | build/sections/finite-inputs.tex:186 | 行列式类公式的 $O(p^{-1})$ | 一致界在列的选择上失效 |
| $\lambda_i$ | $\lambda_i=m_i/R\in[0,q]$ | build/sections/finite-inputs.tex:269 | 把 $c_1(\mathcal Q_i)/R$ 落到端点区间 | 端点比较不再管得住行列式 |
| $N$ | $N$ 同时被 $r$ 与诸分母整除，$N=mr$ | build/sections/conclusion.tex:57 | 规定指标 $r$ 的截面 | 推论里 $mrD$ 的处方丢失 |

台账的读法我按自己的用法说明：第二列是数或增长率，凡改动它，第五列就是最先塌的那一步。表里没有一项是我编的数，位置栏全部是本次会话真实读到的行。

收稿自查补记一条，落在本节末尾，因为它涉及已落盘的第 17 节。第 17 节第四条里我把行内代码的那个分隔字符写在两个反引号之间；在 Markdown 语义下那是行内代码、是字符本身的提及，不是数学定界符，所以本篇真正的数学成对性不受它影响；但在逐字节的计数里它会让那一行的该字符数呈奇数。按规格第一条，我不回去改那一行，只在此登记，并把它的类别写清：全文这样的提及只有一处，位置在第 17 节末条中段。其余每一处的该字符都按开闭配对出现，逐行复量为偶。同时登记：行尾符全文为 LF，无回车符残留；小节标题共 19 个，编号 0 到 18 连续且物理顺序与编号一致；台账表头两行只出现一次，其后 48 个数据行未再打印表头。
