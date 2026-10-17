# D770 p-adic 截面猜想：从截面到完备化的包含

## §0 派单登记与素材面貌

这一单要处理的稿子做了一件被反复说「难」的事：把 Grothendieck 的截面猜想在 $p$ 进数域上做成局部形式，并且把它证出来。动笔前我先把素材的骨架摊开，因为后面所有取舍都要回到具体行号上说话。

正文全部在 `build/` 下的 `.tex` 里。顶层 `main.tex` 只是壳，实测 $55$ 行；序言里唯一的自定义算子声明是把 Gal 设成算子名，所以我落笔时一律写成 `\operatorname{Gal}` 的标准形式，不沿用素材的简写。八节正文的实测字节：`01-introduction.tex` $14936$、`02-preliminaries.tex` $3508$、`03-patching.tex` $11274$、`04-tame-roots.tex` $16571$、`05-arbitrary-roots.tex` $9906$、`06-realization.tex` $4632$、`07-sections.tex` $10247$、`08-global-sections.tex` $13217$，另有 `figures/parallel-edges.tex` $2373$ 与 `main.tex` $1916$，合计 $88580$ 字节，与派单给的素材字节吻合。

摘要在 `main.tex:31-40` 五行之内把两个主定理说完了：局部 $p$ 进截面猜想对 $\mathbb Q_p$ 的一切有限扩张成立；配上已有的有限下降定理，数域上只要有限覆盖下降轨迹恰好等于有理点集，全局截面猜想也成立，其中包含 $\mathbb Q$ 上亏格至少 $2$ 的 $X_0(N)$ 与 $X_1(N)$。我的读法是把引言与摘要先咬死，再顺着「完备化陈述 $\to$ 粘合命题 $\to$ 两阶段开根 $\to$ 回到截面」的顺序推进，因为这篇论文的难点集中在一次改写：几何问题被搬进了一个完备化之间的包含关系。

登记信息两条，逐字照抄派单：

- 素材目录：preprints/The-p-adic-section-conjecture-September-24-2026
- 队列归属：其他队列第 495 行号

## §1 初始动机：局部版本到底断言了什么

设 $p$ 为素数，$k/\mathbb Q_p$ 为有限扩张，$X/k$ 是光滑、固有、几何连通的曲线，亏格至少 $2$。取代数闭包 $\bar k$ 与一个几何基点，完整算术 étale 基本群就落在序列

$$1\longrightarrow\Delta_X\longrightarrow\Pi_X\longrightarrow G_k\longrightarrow1$$

之内，其中 $\Delta_X=\pi_1(X_{\bar k})$、$\Pi_X=\pi_1(X)$、$G_k=\operatorname{Gal}(\bar k/k)$，见 `01-introduction.tex:7-13`。有理点 $a\in X(k)$ 给出一条连续的群同态截面 $s_a:G_k\to\Pi_X$；用 $\Delta_X$ 共轭去分类它，所得的类与识别两个基点时选的路径无关。局部 $p$ 进截面猜想断言：这个构造 accounts for all sections，也就是将「由有理点来的截面」单独取个名字（几何截面），猜想就要求每个截面都是几何的。定理 1 的原文形式是映射

$$X(k)\longrightarrow\Big\{s:G_k\to\pi_1(X)\ \text{连续同态},\ (\pi_1(X)\to G_k)\circ s=\mathrm{id}_{G_k}\Big\}\big/\pi_1(X_{\bar k})$$

是双射，商是按完整几何 étale 基本群的共轭取的，见 `01-introduction.tex:31-44`。我把这个陈述拆成两半记：满射部分是「每个截面都来自点」，单射部分是「不同点给出不同共轭类」，后者在论文里由雅可比簇上的 Kummer 理论收尾（`01-introduction.tex:150-152`）。

为什么要做局部版本？Grothendieck 在 1983 年 6 月 27 日给 Faltings 的信里提出的原始猜想是在素域有限生成的域上，也就是数域与函数域两侧；局部 $p$ 进版本把 $\Delta_X$ 与 $G_k$ 两个群都完整保留，同时把 $p$ 进赋值与归约的几何拉进问题里（`01-introduction.tex:22-29`）。这个「拉进赋值几何」是我读全文时体会到的真正抓手：后来所有力气都花在 $\mathbb Q_p$ 特有的解析结构上，也就是贝尔科维奇解析化、稳定模型的骨架、环面坐标的开根。

关于亏格至少 $2$ 的限制，我自己的理解是双曲性在所有环节都要用：稳定模型存在且其骨架是有限度量图，每个顶点满足稳定性不等式 $2g(v)-2+\operatorname{val}(v)>0$（`04-tame-roots.tex:63-67`），这个不等式在后面的两处被真正消费：一次用来排除「亏格 $0$ 的树」（`04-tame-roots.tex:145-149`），一次用来保证覆盖后的三角化仍然稳定（`04-tame-roots.tex:174-178`）。若亏格降到 $1$ 或 $0$，这两处都不成立；至于有没有别的办法绕过，素材里没有讨论，我按信息不足处理。

还有一个细节我在 §1 就想标出来：商是按 $\pi_1(X_{\bar k})$ 的共轭取，同一条截面的类在 $\Pi_X$ 的更大共轭群下会变得更细。论文在证明单射性时正好要用到这个共轭的选取口径，写笔记时不能把两种共轭混着说。

## §2 前人给我的三样东西：分解群、赋值定位、排除法

我进场时手里有三类结果，它们各自的射程决定了这篇论文必须补哪一段。

第一类是双有理版本的成果。把算术 étale 基本群换成函数域的绝对 Galois 群 $G_K$（$K=k(X)$），问题就成了「$G_k\to G_K$ 的截面来自哪个点」。对带选定赋值的 Galois 扩张，保持其赋值环不变的自同构组成分解群。Koenigsmann 证明：$\mathbb Q_p$ 有限扩张上的每个双有理截面都包含在某个有理点的分解群里（`01-introduction.tex:48-55`）。Pop 给出另一条双有理判据：从某个初等交换商的截面出发，若能提升到对应的初等 metavabelian 商，就得到有理点的信息（`01-introduction.tex:56-59`）。这两条结果让我把「从 étale 截面到双有理截面」当成一个自然的中间目标；而关键的一步是：$\Pi_X$ 是商 $\operatorname{Gal}(\widetilde K/K)$，一条 $\Pi_X$ 的截面本身并 supplied 绝对 Galois 序列的分裂，这是「额外信息」（`01-introduction.tex:60-63`）。我后来才意识到，这个「额外」正是全文的主战场。

第二类是赋值侧的定位。Pop--Stix 把每条 étale 截面都在扩展 $p$ 进赋值的某个赋值上局部化（`01-introduction.tex:65-66`），于是问题被约化为「哪些赋值可以承载一条截面」。Pajwani 沿 étale 同伦与贝尔科维奇空间的不动点把这个赋值路线做细（`01-introduction.tex:68-70`）。这两条给了我一个可操作的对手：要排除的是一类赋值，而剩下的几何困难是「从一个固定的赋值到一个有理点」（`01-introduction.tex:71-72`）。

第三类是排除法的量化形式。Bresciani 引入环面截面并对它们证明了截面猜想：环面截面单射地进入 étale 截面的集合（`01-introduction.tex:74-78`）；更狠的是他的定理 1.5，任取一条非几何的 étale 截面，都能造出一个指标被 $p$ 整除的连通有限 étale 邻域（`01-introduction.tex:79-83`）。这里「邻域」指截面可以提升上去的连通有限 étale 覆盖，「指标」指曲线上闭点次数的最大公因数。另一个方向是 Betts--Stix：对不含 CM 子域的数域上亏格至少 $2$ 的光滑固有几何连通曲线，全局塞尔默截面在局部的像有限（`01-introduction.tex:84-90`），注意他们的截面已经在每个完备化上来自点，有限性说的是这个全局受限集合的局部像。

这三样东西合起来给我一个「必须证什么」的清单：需要一个把 étale 截面变成双有理截面的提升，而且这个提升必须恰好落在 Pop--Stix 定位所剩余的那些赋值上（`01-introduction.tex:92-96`）。清单写死后，剩下的问题是：这样的提升在哪里成立？我的答案最终是一个关于完备化的定理。

## §3 我原先以为的路线，以及它在四个地方断开

我最初的打算很朴素：既然 Pop--Stix 已经把截面定位到赋值上，Koenigsmann 又把双有理截面钉到有理点的分解群里，那么把两条定理首尾相接就够了。真去接的时候，接线处断在四个地方，每个地方都逼着我改一次问题陈述。

断口一，提升的信息量。$s:G_k\to\Pi_X$ 是商 $\operatorname{Gal}(\widetilde K/K)$ 的截面，而 Koenigsmann 要的是 $G_K=\operatorname{Gal}(K^{\mathrm{sep}}/K)$ 的截面；从前者到后者需要把 $\widetilde K$ 里的固定群搬到 $K^{\mathrm{sep}}$ 里，等价于证明 $\widetilde K$ 的某个完备化已经「看见」了 $K^{\mathrm{sep}}$。`01-introduction.tex:60-63` 明说这是额外信息，我当时想走捷径：只在分解群层面比较，不碰完备化。这个捷径走不通，因为分解群层面的等式恰恰要靠完备化的包含来推，见 `01-introduction.tex:126-132` 的那段说明：核里的自同构固定 $H$ 的一个稠密子域，因而固定 $K^{\mathrm{sep}}$。

断口二，只在一枚 sheet 上开根不够。粘合的核心操作是：在分支点附近取局部坐标 $t$，分枝形状是 $t=z^e$；若另一个覆盖给出 $t$ 的 $e$ 次根（$e$ 被所有分枝指数整除），那么拉回的覆盖在分支点周围的环面上分裂，于是可以把内盘那部分换成平凡覆盖再胶起来，得到一个 étale 覆盖（`01-introduction.tex:156-163`）。我一开始以为只要在某一张 sheet 上取到根就能平凡化，实际要求是根必须在整个原像上存在：只在一片上有根的话，胶合需要的那张完整覆盖并没有被平凡化（`01-introduction.tex:164-167`，还有 `03-patching.tex:6-14` 的同一句约束）。这一点在 §6 的粘合命题证明里变成了一句极硬的验算：度 $d$ 的代数要按 $Z^{e_c}-g^\ast t_b=\prod_{\zeta\in\mu_{e_c}}(Z-\zeta a_c)$ 全部拆成线性因子才算平凡化（`03-patching.tex:100-109`）。

断口三，我想当然地把 $p\mid e_c$ 的情形推给「麻烦的野分歧」。素材的局部正规形引理里明确写着：不要求 $e_c$ 与 $p$ 互素（`03-patching.tex:27-28`）。理由很干脆：在 $\Omega$ 里非零常数不管绝对值多大都可逆，所以不同的线性因子仍然互素（`03-patching.tex:104-107`）。教训是我把「赋值的麻烦」和「可逆性的麻烦」混成一堆了；麻烦只在赋值那一侧，单位开根要靠 $p$ 进对数与指数控制收敛半径。

断口四，我想把最后的矛盾做成算术式的。真正用的是古典的两赋值原理：提升后的截面既在一个扩展 $p$ 进赋值的分解群里，又在某个有理点的分解群里，于是那个固定域上会有两个不等价的 hensel 秩一赋值，一个在常数上非平凡、一个在常数上平凡（`01-introduction.tex:134-139`）。这与 F. K. 施密特的两赋值原理同源，需要的逼近与开根论证在 `07-sections.tex` 里补齐，含 $p=2$ 的情形（`01-introduction.tex:139-142`）。这四条断口合起来，把我推向 §4 的改写。

## §4 转折：把整个几何问题搬进一个完备化包含

改写后的陈述只讲域与赋值，不再提截面，这就是定理 2（`01-introduction.tex:109-124`）。设 $K=k(X)$，取包含 $\bar k$ 的可分闭包 $K^{\mathrm{sep}}$，令 $\widetilde K\subset K^{\mathrm{sep}}$ 为 $X$ 的一切连通有限 étale 覆盖的函数域（连同它们在 $K^{\mathrm{sep}}$ 中的一切 $K$ 嵌入）的合成，于是选定基点后有 $\operatorname{Gal}(\widetilde K/K)=\Pi_X$（`01-introduction.tex:100-104`）。$K$ 上取一个实值秩一范数，扩展 $k$ 上归一化的 $p$ 进范数，归一化口径是 $\lvert p\rvert=p^{-1}$（`01-introduction.tex:105-107`）；把它延长到 $K^{\mathrm{sep}}$，然后令

$$E=\widehat{K^{\mathrm{sep}}},\qquad H=\widehat{\widetilde K}\subset E,$$

两个完备化都用这同一个固定的延长（`01-introduction.tex:118-122`）。定理的结论：$E$ 中那个指定的子域 $K^{\mathrm{sep}}$ 被包含在 $H$ 里。

我第一次读到这里停了一下，因为它说的不是「存在一个嵌入把 $K^{\mathrm{sep}}$ 送进 $H$」。素材 `02-preliminaries.tex:57-60` 把口径钉得很死：构造出抽象的域嵌入还不够，对正规扩张 $F/K_0$ 要用正规性把它的像与 $E$ 中指定的那份 $F$ 认同。也就是说全部论证都在一个固定的完备化 $E$ 内部进行，比较的是两个已经坐在 $E$ 里的子域。

这个改写为什么值得？我列三条。其一，它把「截面能否提升」翻译成「一个更小的扩张的合成在某个范数下是否已经闭到位」，于是几何信息可以用解析手段去挣：在分支点周围造开根的覆盖，再胶合。其二，它把目标分成两层包含，`02-preliminaries.tex:50-56` 那张交换图就是这个分层的图像：顶行 $\widetilde K\to L_\ell\to K^{\mathrm{sep}}$，两根右竖箭分别由第一阶段与第二阶段给出，底行全是 $H$，每一支箭都在 $E$ 内。中间层 $L_\ell$ 是 $K_0=\bar k(X)$ 上一切水平分歧指数整除 $\ell$ 的有限 Galois 扩张的合成（`02-preliminaries.tex:38-41`），其中 $\ell\ne p$ 是固定的奇素数。其三，它让我可以先解决「带 $\ell$ 指数分枝的扩张」，再解决「任意阶开根」，两阶段共用同一条粘合命题。

代价也很清楚：一旦允许分枝，$L_\ell$ 就不再是 étale 的函数域合成，我必须自己造 étale 覆盖去模拟分枝覆盖的效果，这就是 §6 到 §10 的全部内容；而两阶段之间真正的鸿沟是「任意阶根从何而来」，它要靠雅可比簇的一致化与一条斜率为 $1$ 的特征去填，见 §11、§12。

一旦定理 2 成立，回到截面只是几步机械推论：分解群比较（`01-introduction.tex:126-132`）、双有理提升落在 Pop--Stix 定位必须排除的赋值上（`01-introduction.tex:92-96`）、两赋值矛盾定位到有理点、秩二赋值用它的秩一粗化接管、剩下的闭点赋值精化以剩余域上的 $p$ 进赋值即 Pop--Stix 的 type $2h$ 情形由截面到 $G_k$ 的满射强制那个闭点为有理点（`01-introduction.tex:143-149`）。我把这条链记成：完备化包含 $\Rightarrow$ 分解群同一 $\Rightarrow$ 双有理截面 $\Rightarrow$ 有理点。

## §5 域链、解析点 $\xi$ 与水平分歧的口径

进入构造之前必须把口径写死，否则后面每一步的包含关系都会含糊。`02-preliminaries.tex:6-10` 给出域链

$$K\subset K_0:=\bar k(X)\subset\widetilde K\subset K^{\mathrm{sep}}\subset E,\qquad H=\widehat{\widetilde K}\subset E,$$

并规定所有后续包含都相对定理 2 里选定的那个延长范数而言。三点要紧的说明：其一，$H\hookrightarrow E$ 是等距的，它把 $H$ 认成 $\widetilde K$ 在 $E$ 中的闭包（`02-preliminaries.tex:11-12`）。其二，$k$ 完备，所以选定范数在 $\bar k$ 上的限制就是唯一的那个延长，于是 $\Omega:=\widehat{\bar k}$ 是 $H$ 的一个指定子域；$\Omega$ 代数闭、加性值群是 $\mathbb Q$，口径 $v=-\log_p\lvert\cdot\rvert$（`02-preliminaries.tex:13-16`）。值群在完备化前后不变，理由是任何非零极限的范数与足够近的逼近元相同（`02-preliminaries.tex:16-18`）。

第二件要紧事是点 $\xi$。$K_0\hookrightarrow H$ 决定 $X_{\bar k}(H)$ 中支撑在_generic_ 点上的一个点，配合指定的 $\Omega\hookrightarrow H$ 给出 $X_\Omega(H)$ 的点，其解析像记作 $\xi$；$\xi$ 投到 $X_{\bar k}$ 上是 generic 的，但在 $X_\Omega$ 上的支撑不必 generic，它可以是一个 $\Omega$ 有理点（`02-preliminaries.tex:20-26`）。素材在这里加了一句我起初以为啰嗦、后来发现关键的叮嘱：凡是用到 $\xi$ 的地方，要连同其剩余域完备化嵌入 $H$ 的数据一起保留（`02-preliminaries.tex:27-28`）。原因是 §7 的点转移要在解析映射上诱导剩余域的映射，只记得一个解析点会把所需的等距嵌入丢掉。

第三件是「水平分歧指数」这个词的确切含义。$F/K_0$ 有限，其正规化给出 $\bar k$ 上光滑固有连通曲线到 $X_{\bar k}$ 的有限映射，该映射在闭点处的分歧指数就叫水平分歧指数；对应的离散赋值在 $\bar k$ 上平凡、剩余特征为零，与特征 $p$ 归约模型上的野分歧毫无关系（`02-preliminaries.tex:30-35`）。固定奇素数 $\ell\ne p$，在 $K^{\mathrm{sep}}$ 里令 $L_\ell$ 为一切水平分歧指数整除 $\ell$ 的有限 Galois 扩张 $F/K_0$ 的合成，未分歧的也算进去，于是 $\widetilde K\subset L_\ell$（`02-preliminaries.tex:38-42`）。这里有个小技巧：$X_{\bar k}$ 的有限 étale 覆盖可以先下降到 $k$ 的某个有限扩张，再与 $X$ 的有限 étale 常数域覆盖合成，就得到同一个 $\widetilde K$（`02-preliminaries.tex:42-45`）。

目标图景在 `02-preliminaries.tex:47-56`：顶行 $\widetilde K\to L_\ell\to K^{\mathrm{sep}}$，底行三个 $H$，两根右竖箭分别是第一阶段与第二阶段的成果，所有箭都在 $E$ 里。这段还警告说抽象嵌入不够用，对 $F/K_0$ 正规的情形要用正规性把像认成 $E$ 中那份指定的 $F$。最后一件预备事是固有有限 étale 覆盖在代数闭域扩张下的不变性（SGA1 Expose X 推论 1.8，见 `02-preliminaries.tex:62-65`），它让我可以把 $Y_\Omega$ 上的覆盖下降到 $Y$；小区域上造的解析映射不必下降，只要在固定的 $H$ 值点处取值就够（`02-preliminaries.tex:66-68`）。

## §6 粘合命题：把分支盘换成平凡覆盖

整篇论文的分析操作只有一个，`03-patching.tex:4-9` 说得很直白：当另一个覆盖提供了边界坐标的根，就把分枝覆盖换成 étale 覆盖，而且根必须在每个边界环面的整个原像上存在；得到的解析映射只需要在分支盘之外。第一步是局部正规形。引理说：$f:C\to X_{\bar k}$ 有限满、$b\in X(\bar k)$，取在 $b$ 处为局部参数的有理函数 $t_b$，则 $X_\Omega^{\mathrm{an}}$ 中存在以 $t_b$ 为坐标的开盘 $B_b$，其在 $C_\Omega^{\mathrm{an}}$ 中的全原像是不交开盘的并，且在 $c\in f^{-1}(b)$ 上方的盘里有坐标 $z_c$ 使 $t_b=z_c^{e_c}$，$e_c$ 是 $c$ 处分歧指数；不要求 $e_c$ 与 $p$ 互素；有限多个点时盘可以选得两两不交且都不含 $\xi$（`03-patching.tex:16-30`）。

证明里的三处技术细节值得记。第一处是单位开根的收敛半径：把 $t_b$ 的拉回写成 $u^{e_c}a(u)$，$a(0)\ne0$，在 $\Omega$ 中取 $a(0)$ 的 $e_c$ 次根后令

$$z_c=u\exp\!\Bigl(e_c^{-1}\log\bigl(a(u)/a(0)\bigr)\Bigr),$$

充分条件是 $v\bigl(a(u)/a(0)-1\bigr)>v_p(e_c)+1/(p-1)$（`03-patching.tex:33-43`）。这条不等式我在全篇出现了两次（另一次在 §12 的中段领圈），它就是把 $p=2$ 一并处理干净的地方。第二处是「全原像」怎么保证：$C_\Omega^{\mathrm{an}}$ 固有，去掉 $b$ 上方有限多个邻域后的补集紧，其在 $f$ 下的像紧、闭且不含 $b$，于是足够小的 $B_b$ 的全原像落进那些邻域里，再缩一次使每个 $z_c$ 图里原像恰是 $\lvert z_c\rvert^{e_c}$ 的对应界（`03-patching.tex:45-52`）。第三处是避开 $\xi$：$\xi$ 不等于 $X(\bar k)$ 的任何点，因其投到 $X_{\bar k}$ 上 generic，Hausdorff 性允许所有盘彼此避开、也避开 $\xi$，半径可从 $\lvert\Omega^\times\rvert$ 里取（`03-patching.tex:53-58`）。

真正的粘合是命题 3.2。设 $f:C\to X_{\bar k}$ 度为 $d$、分支集 $B$，每个 $b\in B$ 取 $m_b$ 为上方全部分歧指数的公倍数；若有光滑固有连通曲线 $g:Y\to X_\Omega$ 与严格落在 $B_b$ 内的半径 $0<r_b<R_b\in\lvert\Omega^\times\rvert$，使 $g^\ast t_b$ 在

$$A_b=\{r_b<\lvert t_b\rvert<R_b\}$$

的整个原像上有解析的 $m_b$ 次根，那么对 $U=X_\Omega^{\mathrm{an}}\setminus\bigcup_{b\in B}\{\lvert t_b\rvert\le r_b\}$，存在光滑固有连通曲线 $V_\Omega$、有限 étale 满射 $V_\Omega\to Y$，以及 $U$ 上的解析映射 $(V_\Omega^{\mathrm{an}})|_U\to C_\Omega^{\mathrm{an}}$ 覆盖 $X_\Omega^{\mathrm{an}}$（`03-patching.tex:61-87`）。

证明的思路是「外区拉回、内盘换平凡、重叠区上同构」，我把同构那一步当作全命题的成败所在来读。$Y_U$ 与各 $Y_b$（$\{\lvert t_b\rvert<R_b\}$ 的原像）组成 $Y^{\mathrm{an}}$ 的开覆盖，不同 $Y_b$ 不交，$Y_U\cap Y_b=g^{-1}(A_b)$（`03-patching.tex:90-92`）。在 $Y_U$ 上取 $C_\Omega^{\mathrm{an}}\to X_\Omega^{\mathrm{an}}$ 的拉回，因 $U$ 不含分支点而有限 étale、度 $d$；在每个 $Y_b$ 上取度 $d$ 的平凡覆盖。重叠区上写 $q_b^{m_b}=g^\ast t_b$，对 $c\in f^{-1}(b)$ 对应的那张因子令 $a_c=q_b^{m_b/e_c}$，于是

$$Z^{e_c}-g^\ast t_b=\prod_{\zeta\in\mu_{e_c}}(Z-\zeta a_c)$$

完全分裂，每个 $a_c$ 是重叠区的解析单位，不同线性因子互素因为 $(\zeta-\zeta')a_c$ 可逆；这一点在 $p\mid e_c$ 时同样成立，$\Omega$ 中非零常数无论绝对值大小都可逆（`03-patching.tex:94-108`）。我在此前断口三上的错误想法在这里被彻底纠正：只要把所有因子都取到，平凡化的是整张度 $d$ 的覆盖，不是一片 sheet（`03-patching.tex:108-109`）。

之后是解析到代数的两跳。选定这些平凡化并粘合有限局部自由解析代数；不同分支盘不交，所以没有额外 cocycle 条件；粘合后的代数凝聚、在 $Y^{\mathrm{an}}$ 上有限 étale，因这二者是局部性质。固有解析代数化定理把凝聚代数及其乘法与单位代数化，全忠实性保住代数恒等式；étale 性在解析化之后即可检出，于是相对谱是 $Y$ 上的有限 étale 覆盖（`03-patching.tex:111-119`）。最后取任一非空连通分量记作 $V_\Omega$：连通有限 étale 覆盖在连通曲线上的分量有正的局部常数度，故仍满，且光滑固有；限制原来的投影就给出所声称的解析映射；$B=\varnothing$ 时整个拉回已经有限 étale，同一分量论证成立（`03-patching.tex:121-128`）。

## §7 从解析映射拿到嵌入，以及水平分歧的封闭性

命题造出的是一条解析映射，而定理 2 要的是 $H$ 里的域嵌入，这中间需要一次「取值」。引理 3.3 的假设是：复合 $V_\Omega\to X_\Omega$ 在 $X_\Omega$ 上同构于某个 $V\to X_{\bar k}$ 的基变换，且 $\xi\in U$；结论是若 $\bar k(V)$ 有 $K_0$ 嵌入进 $H$，则 $\bar k(C)$ 也有（`03-patching.tex:134-141`）。

证明的机制正好解释了 §5 里那句叮嘱：给定的嵌入决定 $V$ 的一个 $H$ 值点，配上固定的 $\Omega\subset H$ 得到 $V\times_{\bar k}\Omega$ 的 $H$ 值点，再用指定的同构搬到 $V_\Omega$；它在 $X_\Omega(H)$ 中的像正是由 $K_0\hookrightarrow H$ 与 $\Omega\hookrightarrow H$ 诱导的那个固定点，特别地其解析像是 $\xi\in U$。Ω 上代数簇的 $H$ 值点等价于其解析化的 $H$ 值点，展开成一个解析点 $v$ 加上完备剩余域 $\mathcal H(v)$ 到 $H$ 的等距嵌入；$U$ 上的解析映射诱导完备剩余域之间的相容映射，于是得到 $C_\Omega$ 的一个 $H$ 值点，投回 $C$ 后在 $X_{\bar k}$ 上的像是 generic 且带指定的 $K_0\to H$；$C\to X_{\bar k}$ 有限，故支撑在 $C$ 上也 generic，于是给出所需的 $\bar k(C)\hookrightarrow H$（`03-patching.tex:143-163`）。素材还特别记下：$U$ 上那条解析映射与选的局部平凡化都不必下降到 $\bar k$（`03-patching.tex:165-166`）。

第二条支撑是闭包性引理：固定正整数 $n$，在 $K_0$ 的有限扩张中，「在 $X_{\bar k}$ 每个闭点处的分歧指数都整除 $n$」这一条件对取子扩张、有限合成、Galois 闭包都保持；沿光滑固有曲线之间的有限映射做正规化拉回也保持；在上面再合成一个有限 étale 覆盖也保持。结论是任何指数整除 $\ell$ 的 $X_{\bar k}$ 有限覆盖，其函数域都有 $K_0$ 嵌入进 $L_\ell$（`03-patching.tex:174-183`）。

证明把问题局部化到 $A=\bar k((t))$。这类完备域的任何有限扩张剩余域仍是 $\bar k$，且形如 $\bar k((u))$：在完备赋值环里逐次减剩余代表元就得到幂级数展开；若分歧指数为 $e$，则 $t=u^e a(u)$，$a(u)\in\bar k[[u]]^\times$，剩余特征零时 Hensel 引理给出单位的 $e$ 次根，换参数即得 $t=z^e$。于是局部域是 $A(t^{1/e})$，因 $\bar k$ 含全部单位根而对 $A$ 是循环扩张；$e\mid n$ 时它是 $A(t^{1/n})$ 的子域，合成与正规闭包的每个局部因子仍落在这同一个循环扩张里（`03-patching.tex:184-203`）。拉回那一支的算式我特意记下来：基底局部映射写 $t=s^r a(s)$，$r\ge1$，取 $e$ 次根后可见拉回的每个局部因子分歧指数是

$$e/\gcd(e,r),$$

整除 $e$（`03-patching.tex:205-209`）。塔里指数相乘，étale 的上覆盖贡献指数 $1$，最后一句把指数整除 $\ell$ 的覆盖取 Galois 闭包嵌入固定的 $K^{\mathrm{sep}}$，其域落在 $L_\ell$（`03-patching.tex:209-213`）。备注里限定射程：这条引理关于特征 $p$ 的 tame 归约什么都不说，关于两个任意分枝覆盖的合成也什么都不说，合成的那一支要求上覆盖 étale（`03-patching.tex:215-220`）。我把它读成对我早期一个幻想的否决：想靠反复合成把分歧指数「调」成想要的样子，是行不通的。

## §8 环面单位与稳定结点环面上的 $\ell$ 次根

第一阶段的任务写在 `04-tame-roots.tex:4-9`：把水平分歧指数整除 $\ell$ 的扩张放进 $H$，粘合命题已把任务约化为「在分支点周围领圈上取坐标的 $\ell$ 次根」，而根要到 $X_\Omega$ 的有限 étale 覆盖里去找；两步走是先在稳定结点环面上取根，再用奇点消解覆盖把任意小盘的领圈搬进这种环面。

先在纯解析的一侧拿到唯一的工具。引理 4.1：Ω 上开盘的解析单位其绝对值在 $\lvert\Omega^\times\rvert$ 中常数；若 $A=\{r<\lvert S\rvert<R\}$ 是开环面而 $u\in\mathcal O(A)^\times$，则

$$u=cS^d(1+h),\qquad c\in\Omega^\times,\ d\in\mathbb Z,\ h\in\mathcal O(A),\ \lvert h(x)\rvert<1\ (x\in A),$$

其中 $cS^d$ 是 $u$ 的 Laurent 展开里的那一项；$1+h$ 在 $A$ 上有解析的 $\ell$ 次根；因此在任何 $S$ 有 $\ell$ 次根的解析覆盖上，$u$ 也有（`04-tame-roots.tex:20-32`）。证明用 Laurent 高斯范数在半径 $\rho\in\lvert\Omega^\times\rvert$ 的圆上的乘性：把 $u$ 与其逆归一化成范数 $1$，二者在 $\widetilde\Omega[s,s^{-1}]$ 里的剩余互为逆单位，故 $u$ 的剩余是单项式，于是恰有一项在该半径占支配；占支配的指数在半径区间里不能变，因为任何改变可归结为有限多项竞争，而两项打平的半径属于 $\lvert\Omega^\times\rvert$（加性值群是 $\mathbb Q$），与前面的剩余论证矛盾（`04-tame-roots.tex:34-48`）。这里的推导顺序比结论更值得记：值群是 $\mathbb Q$ 这一条预备事实，正好排除了「打平半径落在无理数处」这种可能的漏洞。$\ell$ 在赋值环里可逆，故 $(1+h)^{1/\ell}$ 的二项级数在每个紧子环面上收敛且在重叠处一致；$c$ 的根在 $\Omega$ 里，$S^d$ 的根由 $S$ 的根得到，$d<0$ 也一样（`04-tame-roots.tex:50-54`）。

再补稳定骨架的记号：分裂稳定模型的骨架是有限度量图，每个顶点带上对应特殊纤维分量的光滑正规化，每个入射边端给一个标记点，环边在同一正规化上给两个不同标记；结点的管是开环面，光滑特殊纤维点的管是开盘；这张带标记剩余曲线的图就是度量复形，稳定性写作 $2g(v)-2+\operatorname{val}(v)>0$（`04-tame-roots.tex:56-67`）。

关键引理 4.3：$C/\Omega$ 光滑固有连通、亏格至少 $2$、带稳定骨架，$A$ 是结点环面、$S$ 是其环面坐标，则存在连通有限 étale 覆盖 $C'\to C$ 使 $S$ 在整个 $A$ 的原像上有解析 $\ell$ 次根；有限多个结点环面可以共用一个覆盖（`04-tame-roots.tex:69-76`）。证明的靶子是「扩张因子」，即沿边的整斜率的绝对值：只要在选定的边上使其被 $\ell$ 整除，拉回坐标在上方环面的 Laurent 指数就被 $\ell$ 整除，常数因子与 $1+h$ 由引理 4.1 开根（`04-tame-roots.tex:78-84`）。

工具是度量复形的 tame 覆盖提升定理（Amini--Baker--Brugallé--Rabinoff 定理 7.7，见 `04-tame-roots.tex:88-90`）。可用的覆盖数据由有限剩余曲线映射与有限调和图映射组成：每个标记点的每根纤维都要由边端表示，其分歧指数等于边的扩张因子，分量度数是这些因子在每个底方向上的和；剩余映射要 tame 分枝，增广图分歧在穿孔之外须为零（`04-tame-roots.tex:90-96`）。我全篇不用穿孔，于是提升出来的覆盖有限 étale，并且顶点集与骨架的原像恰好是指定的那些（`04-tame-roots.tex:96-99`）。

非分隔边的做法我逐句核了一遍。取含该边的简单回路，回路上每个顶点处剩余曲线 $D$ 上有两个回路标记 $P,Q$；由 $\operatorname{Pic}^0(D)$ 的可除性给出度零除子 $E$ 使 $P-Q+\ell E$ 为主除子，取其对应函数的 $\ell$ 次根再正规化，得到度 $\ell$ 的循环覆盖：因 $P$ 处阶与 $\ell$ 互素而连通，在 $P,Q$ 完全分枝、别处不分枝，其余每个标记点有 $\ell$ 个不同原像；回路外的顶点取 $\ell$ 份恒等拷贝（`04-tame-roots.tex:101-112`）。边的规则是：回路上方一条扩张因子 $\ell$、长度缩为 $1/\ell$ 的边；其余边上方 $\ell$ 条因子 $1$ 的边并把无分枝标记纤维配齐；环边与回路顶点间的弦边同样处理；所有长度都在 $\mathbb Q$ 里（`04-tame-roots.tex:113-118`）。顶点处局部 Riemann--Hurwitz 是

$$2g(D')-2=\ell\bigl(2g(D)-2\bigr)+2(\ell-1),$$

多出的两项正是两条回路边记下的，于是增广图分歧在每个顶点为零，恒等拷贝不贡献；全部分歧指数与 $p$ 互素；连通性由「回路外顶点可用提升的路径接到回路顶点」保证（`04-tame-roots.tex:119-130`）。提升之后 $A$ 的原像恰是 $e$ 上方结点环面的不交并；素材补了一段倒骨架的论证来说明逆骨架等式排除「骨架外的点映到骨架」，并由此说明结点环面是其开边在收缩下的原像（`04-tame-roots.tex:131-140`）。最后 $A$ 上方每个环面上 $S$ 的拉回在引理 4.1 的分解里指数是 $\ell$ 或 $-\ell$，故有 $\ell$ 次根（`04-tame-roots.tex:140-143`）。

## §9 奇点消解覆盖：把小盘领圈搬进稳定骨架

引理 4.3 还剩分隔边的情形，而这一步的做法本身就是一段取舍。设 $e$ 分隔，切开其内部后两侧中各含一条回路或一个正亏格顶点：否则那一侧是 $N$ 个顶点的亏格 $0$ 树，含桥边半边的总价度是 $2N-1$，与稳定性要求的至少 $3N$ 矛盾（`04-tame-roots.tex:145-149`）。有了这个二分，就可以在每一侧造一个保持边界标记的连通不分枝度 $\ell$ 覆盖：有回路的一侧取由图基本群到 $\mathbb Z/\ell\mathbb Z$ 的满同态给出的循环图覆盖，剩余曲线映射全为恒等；用正亏格顶点的一侧则用该曲线雅可比的非零 $\ell$ 挠点给出循环 étale 覆盖。素材把后者写得很具体：对恰为 $\ell$ 阶的线丛 $L$，取定平凡化 $L^{\otimes\ell}\simeq\mathcal O$，则 $\bigoplus_{j=0}^{\ell-1}L^{\otimes j}$ 是个代数，其相对谱就是循环 étale 覆盖；$\ell$ 可逆保证 étale，$L$ 的确切阶保证连通（`04-tame-roots.tex:150-166`）。其余顶点用 $\ell$ 份恒等拷贝并把标记纤维配齐。

接着把两侧各 $\ell$ 个桥标记原像两两配对，得到 $\ell$ 条因子为 $1$ 的桥边；现在每条桥边都变成分隔前的「非分隔」：拿掉其中一条，两侧靠其余的仍连着（`04-tame-roots.tex:167-171`）。这样得到的原始度量复形覆盖是 tame 的，因为分量覆盖不分枝、所有因子为 $1$、Riemann--Hurwitz  again 给出图分歧为零；提升到有限 étale 曲线覆盖后三角化仍稳定，局部度为 $d$ 的顶点处有

$$2g'-2+\operatorname{val}(v')=d\bigl(2g-2+\operatorname{val}(v)\bigr)>0$$

（`04-tame-roots.tex:172-178`）。最后对这 $\ell$ 条边逐条施以前一节的非分隔构造，取所得有限 étale 覆盖的纤维积的任一连通分量：它支配每个因子，于是造出的所有根在一个公共覆盖上同时存活；每条因子 $1$ 的环面上原 $S$ 的拉回是单位，新环面坐标有根之后由引理 4.1 给出 $S$ 的根（`04-tame-roots.tex:180-187`）。我在此学到的是「纤维积分量」这一手：需要同时满足有限多个根条件时，不要试图造一个万能覆盖，把各个覆盖分开造、再取纤维积的分量，连通性与支配性都自动到位。

真正的转折在下一段：稳定结点环面上的根到手了，但任意分支点周围的小领圈未必是稳定模型的结点环面，在那里吹起产生的结点在稳定化之后可能消失（`04-tame-roots.tex:190-195`）。奇点消解定理给出一个 étale 覆盖，其稳定模型映到预先指定的模型，而后面真正需要的只是那个模型态射（`04-tame-roots.tex:195-196`）。引理 4.4 的陈述：$C/\bar k$ 光滑固有连通、亏格至少 $2$，$b_1,\ldots,b_s\in C(\bar k)$ 互异，$B_i$ 是 $C_\Omega^{\mathrm{an}}$ 中以 $b_i$ 为中心的足够小且不交的坐标盘，坐标 $t_i$ 定义在 $\bar k$ 上且在 $b_i$ 处单零；则存在连通有限 étale 覆盖 $Y\to C_\Omega$ 与同心开领圈

$$A_i'=\{r_i<\lvert t_i\rvert<R_i\}\subset B_i,\qquad r_i,R_i\in\lvert\Omega^\times\rvert,\ 0<r_i<R_i,$$

使 $t_i$ 在 $A_i'$ 的整个 $Y^{\mathrm{an}}$ 原像上有解析 $\ell$ 次根（`04-tame-roots.tex:198-211`）。

构造分三段。第一段是纯模型的：所有代数数据下降到 $k$ 的有限扩张，再扩一次可得分裂半稳定模型，使 $b_i$ 成为两两不交的光滑截面；缩小坐标盘不成问题，因为只要求领圈落在原先给定的盘内；在截面的整局部参数 $u_i$ 上，对其特殊值逐次吹起会引入结点环面

$$\lvert\pi\rvert^{j+1}<\lvert u_i\rvert<\lvert\pi\rvert^{j},$$

而在足够小的盘上 $t_i/u_i$ 是解析单位（两坐标在 $b_i$ 都单零），其绝对值由引理 4.1 常数，故这些环面对 $t_i$ 也是同心的，$j$ 取大就落进 $B_i$；所得固有半稳定模型记作 $\mathcal C$，它可以不稳定，标记此时可以忘掉（`04-tame-roots.tex:213-231`）。第二段引用奇点消解定理以全体素数为集合及其支配模型的推论：有限扩域后有一个 étale 覆盖，其稳定模型映到 $\mathcal C$；取分裂归约与几何连通分量，写 $f:Y_0\to C_\Omega$ 与模型态射 $\mathcal Y_0\to\mathcal C$，并且明确说对模型态射不作任何有限性要求（`04-tame-roots.tex:233-245`）。

第三段是我通读时最欣赏的一手：用无理数切一刀。固定目标结点环面 $A_i\subset B_i$，在其两端加性赋值之间取一个无理实数 $a$，考察集合 $\{x\in A_i:-\log_p\lvert t_i(x)\rvert=a\}$ 的全原像。归约与模型态射相容，于是原像点分三类处理：映到 $\mathcal Y_0$ 分量 generic 点的点是模型顶点，属类型 $2$，$\lvert t_i\rvert\in\lvert\Omega^\times\rvert$，加性赋值是有理数，落在无理层之外；映到光滑闭点的点在开盘管里，若它在该层上方，则该光滑点映到目标结点，于是整个开盘管映进 $A_i$，$t_i$ 的拉回是其上的单位，范数由引理 4.1 常数且属于 $\lvert\Omega^\times\rvert$，仍排除无理层；剩下的点全在结点映到目标结点的源结点环面里（`04-tame-roots.tex:246-263`）。把所有这类源结点环面的并记作 $N_i$，它是有限并；$Y_0^{\mathrm{an}}$ 去掉 $N_i$ 的补集紧，与「含该无理层在内的闭同心子环面」的原像相交得紧集，连续实函数 $-\log_p\lvert t_i\rvert$ 在其上取紧像且避开 $a$，于是存在以 $a$ 为中心、端点为有理数的开区间，其全原像落在 $N_i$ 内，这就是要的领圈 $A_i'\subset A_i$（`04-tame-roots.tex:264-273`）。收束：$N_i$ 中每个源结点环面都映进 $A_i$，故 $t_i$ 的拉回是其上解析单位；对全部 $i$ 的全部这些源环面同时用引理 4.3，它们的坐标在一个公共连通有限 étale $Y_0$ 覆盖上取得 $\ell$ 次根；引理 4.1 给出 $A_i'$ 全原像上 $t_i$ 拉回的根，复合后的 $C_\Omega$ 覆盖仍有限 étale（`04-tame-roots.tex:274-283`）。无理数的作用是把「靠紧性挤出一个空档」这件事变得可执行：值群是 $\mathbb Q$，所以总有一个无理层谁都不占。

## §10 第一阶段的收束：$L_\ell\subset H$

命题 4.5 把粘合命题与两枚引理串成第一次成果：$L_\ell\subset H$（`04-tame-roots.tex:285-287`）。证明逐条对照 §5 到 §9 的接口。取 $F/K_0$ 有限 Galois、水平分歧指数整除 $\ell$，$C\to X_{\bar k}$ 为其光滑固有曲线覆盖；若不分枝，其函数域已在 $\widetilde K$ 里；否则按引理 3.1 取避开 $\xi$ 的足够小不交分支盘（`04-tame-roots.tex:289-295`）。在 $X_{\bar k}$ 上用引理 4.4 得到有限 étale $Y\to X_\Omega$ 与一批领圈，其全原像上分支坐标有 $\ell$ 次根（`04-tame-roots.tex:296-298`）。把 $m_b$ 取为 $\ell$ 即可用命题 3.2：它给出连通有限 étale $V_\Omega\to Y$ 与外区到 $C_\Omega$ 的解析映射；复合 $V_\Omega\to X_\Omega$ 有限 étale；固有情形下有限 étale 覆盖在代数闭扩张下的不变性把它下降到 $V\to X_{\bar k}$，于是其函数域有 $K_0$ 嵌入进 $\widetilde K\subset H$；引理 3.3 在 $\xi$ 上方那个固定的 $H$ 值点处给出 $K_0$ 嵌入 $F\hookrightarrow H$；$F/K_0$ 正规且两支都在 $E$ 中，故这就是 $E$ 里选定的那份 $F$，即 $F\subset H$；取所有这类 $F$ 的合成即得命题（`04-tame-roots.tex:299-313`）。

这段的结构让我确认 §3 里断口二的分量：整套论证只用了「根在整个原像上」这一个口径，一旦某处只在一盘上有根，$V_\Omega\to Y$ 的有限 étale 性就没了来源。我也把这次收束看作第一次「解析换代数」的结算：所有分枝信息都换成了领圈上的单位与 $\ell$ 次根，而 $\ell$ 只用了一次，纯粹是 ABBR 提升定理对 tame 的要求（`04-tame-roots.tex:93-96`）。

## §11 辅助分枝覆盖：两个顶点与 $\ell$ 条平行边

第二阶段要解决的是任意正整数阶的根，同时保持辅助覆盖的水平指数整除 $\ell$，好让第一阶段能收下它。命题 5.1 的陈述（`05-arbitrary-roots.tex:60-73`）：给定 $m\ge1$，取整数

$$D>v_p(m)+\frac{1}{p-1},$$

再取 $\alpha\in\bar k^\times$ 使 $a=v(\alpha)>2D$；则存在光滑固有连通曲线 $Q/\bar k$ 与有限映射 $Q\to\mathbb P^1_{\bar k}$，其分歧指数整除 $\ell$，并且坐标 $T$ 的拉回在

$$A^\circ=\{D<v(T)<a-D\}$$

的整个 $\Omega$ 原像上有解析 $m$ 次根。这里 $v=-\log_p\lvert\cdot\rvert$ 是全节口径（`05-arbitrary-roots.tex:9`）。

起手是库默覆盖 $Z$：取 $y^\ell=\dfrac{T(T-1)}{T-\alpha}$ 的光滑射影正规化。四个互异点 $0,\alpha,1,\infty$ 在该有理函数除子里的阶是 $1,-1,1,-1$，故循环覆盖连通、度 $\ell$，恰在这四点完全分枝；Riemann--Hurwitz 给出 $2g(Z)-2=-2\ell+4(\ell-1)$，即 $g(Z)=\ell-1$（`05-arbitrary-roots.tex:76-86`）。然后要一个分裂半稳定模型：在包含 $\alpha$ 的足够大有限扩张的整数环上工作，沿 $(T,\alpha)$ 吹起直线上的模型，得两个有理分量与一个结点，局部方程 $TU=\alpha$，内部分量坐标 $S=T/\alpha$，四个分支截面两两不交且光滑；库默函数在外部分量约化为 $T-1$、在内部分量约化为 $-S/(S-1)$，两者都是有理分量上恰有两个完全分枝点的度 $\ell$ 覆盖，因而仍是有理的；结点附近它是 $\dfrac{T-1}{1-U}$，一个在结点处剩余为 $-1$ 的单位，$\ell$ 可逆所以正规化在结点处 étale，扩大有限常数域后结点分裂成 $\ell$ 份；结点与分支截面之外同样的单位判据给出 étale，分支截面处该函数或其逆是简单相对参数所以正规化光滑。结论：两个有理分量由 $\ell$ 个结点相连，每个结点厚度 $v(\alpha)=a$，因 $\ell\ge3$ 而稳定（`05-arbitrary-roots.tex:88-107`）。

于是骨架 $\Gamma$ 是两个顶点加 $\ell$ 条平行边 $e_1,\ldots,e_\ell$，每条长 $a$；结点环面 $A_j$ 是 $\{\lvert\alpha\rvert<\lvert T\rvert<1\}$ 的不交拷贝且坐标就是 $T$。素材还给了一个直验：在该环面上 $T$ 与 $\alpha/T$ 的绝对值都小于 $1$，而 $-\dfrac{1-T}{1-\alpha/T}$ 的两个因子有收敛的 $\ell$ 次根，故原像恰为 $\ell$ 份环面（`05-arbitrary-roots.tex:109-116`）。配图把这两件事画在两个面板里：左面板是两条被选中的平行边 $e_j,e_{j'}$ 与其余边，两端顶点标注 $v(T)=0$ 与 $v(T)=a$，并注明「$\ell$ 条边各长 $a$，回路 $c_j=e_j-e_{j'}$」；右面板把一条边拉成线段，刻度 $0,D,a-D,a$，中间加粗段标为 $A^\circ$，附注 $u_j=c_j'T(1+h_j)$、$\lvert h_j\rvert<p^{-D}$ 与 $D>v_p(m)+\frac{1}{p-1}$（`figures/parallel-edges.tex:11-42`）。

一致化一侧：$J$ 取 $Z$ 的雅可比，用 $\bar k$ 上一点定 Abel--Jacobi 映射 $i:Z\to J$；完全退化给出环面解析一致化

$$q:\mathbb T^{\mathrm{an}}\longrightarrow J_\Omega^{\mathrm{an}},\qquad\ker(q)=\Lambda\subset\mathbb T(\Omega),$$

特征格是 $M=H_1(\Gamma,\mathbb Z)$，热带目标是 $\operatorname{Hom}(M,\mathbb R)$，周期格自由，$q$ 是拓扑覆叠兼局部解析同构（`05-arbitrary-roots.tex:118-130`）。热带与经典 Abel--Jacobi 的相容性把后者认成 $\Gamma$ 上用量度配对做的积分（`05-arbitrary-roots.tex:131-134`）。开贝尔科维奇环面 $A_j$ 强形变收缩到其开骨架区间且局部道路连通，因而单连通，所以 $i\lvert_{A_j}$ 提升到解析映射 $\widehat i_j:A_j\to\mathbb T^{\mathrm{an}}$：先沿覆叠 $q$ 做连续提升，再用它的解析局部逆（`05-arbitrary-roots.tex:136-141`）。

到这里，斜率一那句话就顺理成章：把所有边按 $v(T)$ 增大方向定向，对 $j'\ne j$ 取回路 $c_j=e_j-e_{j'}\in M$，其对应特征记作 $\chi_j$，令 $u_j=\chi_j\circ\widehat i_j$，则 $u_j$ 是解析单位，而 $v(u_j)$ 沿 $e_j$ 对 $v(T)$ 的导数恰为 $1$：代表 $c_j$ 的调和形式在 $e_j$ 的一段上的积分就是该段长度，提升之间只差一个常数周期，不影响这个导数（`05-arbitrary-roots.tex:142-148`）。把这个「恰为 $1$」当作全节的枢轴：它意味着 $u_j$ 与坐标 $T$ 只差常数与一个接近 $1$ 的单位。引理 4.1 说开环面上的解析单位在每个内部高斯半径处有唯一支配的 Laurent 单项式，指数恒定且等于对数范数的斜率，于是

$$u_j=c_j'T(1+h_j),\qquad h_j=\sum_{n\ne0}h_{j,n}T^n,\qquad c_j'\in\Omega^\times,$$

而且 $c_j'T$ 就是实际的一次系数项（`05-arbitrary-roots.tex:150-158`）。半径 $r\in(\lvert\alpha\rvert,1)$ 上的支配性给出 $\lvert h_{j,n}\rvert r^n<1$，两端取极限得 $n>0$ 时

$$\lvert h_{j,n}\rvert\le1,\qquad\lvert h_{j,-n}\rvert\le\lvert\alpha\rvert^{n},$$

写 $s=v(T)$ 并由非阿基米德三角不等式汇总成

$$\lvert h_j\rvert\le p^{-\min\{s,\,a-s\}}<p^{-D}\quad\text{在 }A_j\cap\{D<s<a-D\}\ \text{上}$$

（`05-arbitrary-roots.tex:159-168`）。这就是右面板里那段被剪短的区间的全部意义：两头各剪掉 $D$，单位 $h_j$ 就被压进收敛带里。我读到这里才明白命题为什么要引入三个量 $m,D,a$ 并把它们用不等式串起来：$D$ 是收敛余量，$a$ 是可剪的长度预算，条件 $a>2D$ 保证中段领圈非空，而 $D>v_p(m)+1/(p-1)$ 保证 $m$ 次根的单位存在。

## §12 在雅可比簇上除法：整张原像上的任意阶根

§11 把坐标 $T$ 换成一个斜率一的单位 $u_j$，剩下要办的事情只有一件：在哪张覆盖上能取到 $u_j$ 的 $m$ 次根，而且是**在整张原像上**。这一步的引理被我单独抄下来反复读，因为它把「除法」与「开根」用周期格接在一起（`05-arbitrary-roots.tex:16-28`）。设 $J/\Omega$ 有解析环面一致化 $q:\mathbb T^{\mathrm{an}}\to J^{\mathrm{an}}$，$\mathbb T$ 是分裂环面，核 $\Lambda\subset\mathbb T(\Omega)$ 是自由格、以平移作用，$q$ 兼为拓扑覆叠与局部解析同构；给定解析空间 $A$、解析映射 $a:A\to\mathbb T^{\mathrm{an}}$ 与整数 $m\ge1$，令

$$B=A\times_{q\circ a,\;J^{\mathrm{an}},\;[m]}J^{\mathrm{an}},$$

则对 $\mathbb T$ 的任一特征 $\chi$，$\chi\circ a$ 在 $B$ 上的拉回有解析 $m$ 次根。

证明里我记下三处。第一处是把「局部可开根」升成「整体解析」的机关：设 $\pi:B\to A$、$b:B\to J^{\mathrm{an}}$ 为两投影，$a_B=a\circ\pi$；在 $B$ 上局部把 $b$ 提升到 $\mathbb T^{\mathrm{an}}$ 的解析映射 $t$，等式 $[m]b=q\circ a_B$ 说的是 $t^m/a_B$ 取值在 $\Lambda$ 里，因 $\Lambda$ 离散而这是局部常数函数（`05-arbitrary-roots.tex:31-35`）。第二处是与提升选取无关：把 $t$ 换成 $t\rho$（$\rho\in\Lambda$）只会把 $t^m/a_B$ 改变 $\rho^m$，于是它在 $\Lambda/\Lambda^m$ 中的像确定，$B$ 被分解为有限多个既开且闭的子集 $B_{\bar\lambda}$，指标跑遍 $\Lambda/\Lambda^m$（`05-arbitrary-roots.tex:36-39`）。第三处是粘贴：每个陪集取代表 $\lambda$，在 $B_{\bar\lambda}$ 上用局部常数周期调整提升使 $t^m=\lambda a_B$；重叠区上两个调整后的提升相差一个满足 $\rho^m=1$ 的周期，而 $\Lambda$ 无挠，故 $\rho=1$，提升粘成单个解析映射 $t_{\bar\lambda}$；再取 $d_\lambda\in\Omega^\times$ 使 $d_\lambda^m=\chi(\lambda)$，则 $\chi(t_{\bar\lambda})/d_\lambda$ 就是 $\chi(a_B)$ 的 $m$ 次根，各块在不交的开闭子集上自动粘合；全程没要求 $m$ 与 $p$ 互素（`05-arbitrary-roots.tex:40-51`）。我认为「无挠」这两个字是这条引理真正的算术内容：局部开根本来差一个 $m$ 次单位根，而周期格不含单位根，歧义才消失。

回到命题 5.1 的收束。在每个闭子环面上 $\lvert h_j\rvert$ 的估计有严格一致余量，于是对数与指数局部一致收敛，

$$b_j=\exp\bigl(m^{-1}\log(1+h_j)\bigr)$$

解析且 $b_j^m=1+h_j$；由 $D>1/(p-1)$ 得 $\lvert\log(1+h_j)\rvert\le\lvert h_j\rvert$，而指数的赋值大于 $D-v_p(m)>1/(p-1)$（`05-arbitrary-roots.tex:174-183`）。这条不等式与 §6 中局部正规形里 $v(a(u)/a(0)-1)>v_p(e_c)+1/(p-1)$ 是同一族的东西，差别只在被开根的对象是结点环面的单位、还是盘内坐标的单位。最后一次性处理全部 $\ell$ 个环面：作同一个代数有限 étale 覆盖

$$Z'=Z\times_{i,\,J,\,[m]}J\longrightarrow Z,$$

因基域特征零而对一切 $m\ge1$ 有限 étale；对 $a=\widehat i_j$ 用上面的引理，$u_j$ 在 $A_j$ 的整个原像上有解析 $m$ 次根；除以 $b_j$ 与 $c_j'$ 的一个 $m$ 次根，就在中段领圈上方得到 $T$ 的解析 $m$ 次根；各 $A_j$ 不交，故此根在其全原像上成立；取 $Z'$ 的任一连通分量 $Q$，$Q\to Z$ 有限 étale 且满，于是 $Q$ 是所需的光滑固有连通曲线，它与 $Z\to\mathbb P^1$ 的复合只有分歧指数 $1$ 与 $\ell$；定义 $Q$ 用到的全部代数映射都在 $\bar k$ 上，解析根与环面提升只要求在 $\Omega$ 上（`05-arbitrary-roots.tex:185-201`）。

这里我要记下第二阶段设计上的巧妙：覆盖 $Q\to\mathbb P^1$ 是分枝的，但分枝指数被锁在 $\{1,\ell\}$ 里，正好是第一阶段能消化的类型。整条链因此是自我供给的：用 $\ell$ 阶分枝去造任意阶的根，再用任意阶的根去实现任意分枝指数的扩张。

## §13 实化：任意有限 Galois 扩张进同一个完备化

定理 2 的证明在 `06-realization.tex:11-89`，它把 §6、§10、§12 的结果按顺序接上。取 $F/K_0$ 为 $K^{\mathrm{sep}}$ 中任一有限 Galois 扩张，$C\to X_{\bar k}$ 为其光滑固有曲线覆盖，分支集 $B$ 有限；$B=\varnothing$ 时按万有 étale 域的定义有 $F\subset\widetilde K\subset H$，以下设 $B$ 非空（`06-realization.tex:12-16`）。

对每个 $b\in B$：取有理局部参数 $t_b$ 与引理 3.1 那类不交盘 $B_b$（避开 $\xi$）；令 $m_b$ 为 $C$ 在 $b$ 上方各点分歧指数的最小公倍数；取 $\beta_b\in\bar k^\times$ 使其绝对值小于 $B_b$ 在坐标 $t_b$ 下的半径（`06-realization.tex:18-23`）。对 $m=m_b$ 用命题 5.1：选正整数 $D_b>v_p(m_b)+1/(p-1)$ 与 $\alpha_b\in\bar k^\times$ 使 $a_b=-\log_p\lvert\alpha_b\rvert>2D_b$，得到一个 $T$ 直线的光滑固有连通曲线覆盖，水平指数整除 $\ell$，且在

$$D_b<-\log_p\lvert T\rvert<a_b-D_b$$

的整个原像上 $T$ 有解析 $m_b$ 次根（`06-realization.tex:25-33`）。把它沿非常态射 $X_{\bar k}\to\mathbb P^1_{\bar k}$，$T=t_b/\beta_b$ 拉回并取正规化连通分量，记作 $W_b\to X_{\bar k}$；引理 3.4 说明它的水平指数仍整除 $\ell$；根会拉到正规化分量的每一点上，故 $t_b$ 在 $W_{b,\Omega}^{\mathrm{an}}$ 中领圈

$$\lvert\beta_b\rvert p^{-(a_b-D_b)}<\lvert t_b\rvert<\lvert\beta_b\rvert p^{-D_b}$$

的整个原像上有解析 $m_b$ 次根，这里不过是在 $T$ 的拉回根上乘了 $\beta_b$ 的一个 $\Omega$ 中 $m_b$ 次根（`06-realization.tex:34-47`）。我读这段时特意验算了一次半径：把 $D_b<s<a_b-D_b$ 用 $s=v(T)=v(t_b)-v(\beta_b)$ 翻译回 $t_b$，两端各乘 $p^{-v(\beta_b)}$ 即得上式，$\beta_b$ 的作用是把整条领圈塞进 $B_b$ 里。

然后把有限多个 $\bar k(W_b)$ 嵌入固定的 $K^{\mathrm{sep}}$ 并取合成，相应的曲线覆盖记作 $W\to X_{\bar k}$：它支配每个 $W_b$，水平指数由引理 3.4 仍整除 $\ell$，所有领圈根都拉到 $W_\Omega^{\mathrm{an}}$ 的全原像上（`06-realization.tex:49-54`）。以 $Y=W_\Omega$ 用命题 3.2，得连通有限 étale $V_\Omega\to W_\Omega$ 与外区到 $C_\Omega^{\mathrm{an}}$ 的解析映射；$W$ 在代数闭域 $\bar k$ 上固有，故固有 étale 覆盖在 $\bar k\subset\Omega$ 下的不变性给出连通有限 étale $V\to W$ 与 $W_\Omega$ 上的同构 $V\times_{\bar k}\Omega\simeq V_\Omega$，外区那条解析映射不必下降（`06-realization.tex:56-67`）。

最值得停下来想的是下一句：尽管对 $C\to X_{\bar k}$ 的分支没有施加任何界，复合 $V\to X_{\bar k}$ 的水平指数仍整除 $\ell$（`06-realization.tex:69-70`）。理由全在引理 3.4 的四条封闭性里，$V\to W$ 是 étale 的，上面合成只乘 $1$。其函数域于是可在 $K_0$ 上嵌入 $L_\ell$，而且这次嵌入可以选成延拓已经选好的 $\bar k(W)$ 的嵌入：先在 $K^{\mathrm{sep}}$ 内延到 $\bar k(V)$，再取 Galois 闭包，指数仍整除 $\ell$；命题 4.5 把它的像放进 $H$（`06-realization.tex:71-76`）。引理 3.3 给出 $K_0$ 嵌入 $F=\bar k(C)\hookrightarrow H\subset E$；$F/K_0$ 正规，故像就是 $E$ 中那份选定的 $F$：本原元被送到其极小多项式的一个根，而所有根都已在 $F$ 中，对每个元素同理，像的次数是 $[F:K_0]$，故像等于 $F$；于是 $F\subset H$。最后，$K^{\mathrm{sep}}$ 的每个元素都落在 $K^{\mathrm{sep}}$ 中某个 $K_0$ 的有限 Galois 扩张里（这是特征零域 $K_0$ 的代数闭包），对它们取并就得 $E$ 内的 $K^{\mathrm{sep}}\subset H$（`06-realization.tex:78-89`）。

## §14 分解群同一，以及秩一赋值上不存在截面

现在把 §4 许诺的机械推论写清楚。推论 7.1（`07-sections.tex:10-25`）：设 $w$ 是 $K=k(X)$ 上扩展 $p$ 进赋值的实值秩一赋值，归一化 $w(p)=1$，固定其在 $K^{\mathrm{sep}}$ 上的延长 $w^{\mathrm{sep}}$，$\widetilde w=w^{\mathrm{sep}}\lvert_{\widetilde K}$，则限制映射给出 profinite 群的同构

$$D_{w^{\mathrm{sep}}}(K^{\mathrm{sep}}/K)\xrightarrow{\ \sim\ }D_{\widetilde w}(\widetilde K/K).$$

证明的三段各有一处口径。满射：把稳定 $\widetilde w$ 的自同构提升到 $K^{\mathrm{sep}}/K$ 的自同构，其像把 $w^{\mathrm{sep}}$ 平移成 $\widetilde w$ 的另一个延长，而 $\operatorname{Gal}(K^{\mathrm{sep}}/\widetilde K)$ 在这些延长上传递，于是可以调整提升使之稳定 $w^{\mathrm{sep}}$；无限正规扩张的传递性由有限层次的传递性加紧致性得到（`07-sections.tex:28-34`）。单射：稳定秩一赋值的自同构保持其归一化绝对值，这里归一化的作用被单独解释了一遍，值群到 $\mathbb R$ 的两个保序嵌入相差一个正比例因子，$p$ 上的值把这个因子钉死；于是该自同构作为等距延拓到 $E=\widehat{K^{\mathrm{sep}}}$，若它在 $\widetilde K$ 上为恒等就逐点固定 $H$，而定理 2 说 $K^{\mathrm{sep}}\subset H$，故它是恒等（`07-sections.tex:36-44`）。同胚：两个分解群都是各自 Galois 群的闭子群，理由是「稳定赋值环」可写成对其代数元素在有限 Galois 轨道上的条件的交，每个条件既开且闭；于是限制是紧致 Hausdorff 群之间的连续双射，逆自动连续（`07-sections.tex:46-50`）。

有了同构，第二条引理把局面整个翻过来。引理 7.2（`07-sections.tex:53-62`）：在与推论同样的记号下，取 $K$ 上任一扩展 $p$ 进赋值的秩一赋值 $w$ 与它在 $\widetilde K$ 上的任一延长 $\widetilde w$，则投影

$$D_{\widetilde w}(\widetilde K/K)\longrightarrow G_k$$

没有连续的群同态截面。这句否定陈述是我理解全文策略的钥匙： Pop--Stix 说每条截面必在某赋值上局部化，Koenigsmann 说的是双有理截面，而这里证的是「秩一且非常数平凡的赋值根本承载不了截面」。于是一条截面能够局部化的候选赋值，秩一那一批全被排除，剩下的赋值类型就必须逐个查，这正是 §16 的目录。我原先设想的路线是直接给截面找点，现在变成「先排除一切不可能的赋值位置，剩下的位置自动是点」，一个存在性问题被换成一个分类问题。

## §15 两赋值矛盾与显式的逼近开根（含 $p=2$）

引理 7.2 的证明是全文我最想抄进自己笔记的一段，因为它把「两个赋值打架」这句口号兑现成可算的东西。设 $w(p)=1$ 并把赋值延长到 $K^{\mathrm{sep}}$；若截面存在，推论 7.1 把它提升为连续截面

$$\widehat s:G_k\longrightarrow G_K=\operatorname{Gal}(K^{\mathrm{sep}}/K),$$

其像稳定这条延长；Koenigsmann 的双有理截面定理又把 $\widehat s$ 的整个像放进某个 $a\in X(k)$ 的 $\operatorname{ord}_a$ 的某条延长的分解群里，这里 $\operatorname{ord}_a$ 是 $K$ 的闭点赋值、在 $k$ 上平凡（`07-sections.tex:64-77`）。

令 $\Sigma=\widehat s(G_k)$、$M=(K^{\mathrm{sep}})^{\Sigma}$。$\Sigma$ 紧故闭，于是 $G_M=\Sigma$；把两条选定延长限制到 $M$ 上记作 $v_1,v_2$。逐条检查它们共享的性质：二者都是 henselian，因为其绝对 Galois 群稳定一条延长，而在所有延长上的传递作用因此只有一个点；二者都非平凡且秩一，因为代数赋值扩张的值群之间相差一个挠商，而挠商保持凸子群的链；并且

$$v_1(p)=1,\qquad v_2\lvert_{k^\times}=0,$$

所以两者不等价（`07-sections.tex:79-92`）。到这里为止都还是标准的 F. K. 施密特两赋值唯一性原理的说法，素材接着把所需的逼近显式写出来（`07-sections.tex:94-128`），我认为这才是引理的真正难点所在。

取 $k^\times$ 中一个非平方元 $d$。它在 $M$ 中仍非平方：否则 $G_M=\Sigma$ 会在 $\bar k$ 里固定 $d$ 的一个平方根，与满射 $\Sigma\to G_k$ 矛盾。取 $a$ 处的局部参数 $t\in K$，取正整数 $N>v_1(t)$，令 $z=p^N/t$，则

$$v_1(z)>0,\qquad v_2(z)=-v_2(t)<0.$$

对正整数 $r$ 设

$$q_r=d+(1-d)\frac{z^r}{1+z^r}.$$

分母非零因 $v_1(z^r)>0$；第一个赋值下 $q_r$ 趋向 $d$，第二个赋值下趋向 $1$，量化地写就是

$$v_1(q_r/d-1)=v_1\bigl((1-d)/d\bigr)+r\,v_1(z)\to+\infty,\qquad v_2(q_r-1)=v_2(d-1)-r\,v_2(z)\to+\infty.$$

$r$ 足够大时，在 $1$ 处用 Hensel 引理：以 $v_1$ 得 $q_r/d$ 的平方根，以 $v_2$ 得 $q_r$ 的平方根，充分不等式是

$$v_1(q_r/d-1)>2v_1(2),\qquad v_2(q_r-1)>2v_2(2).$$

两者的商使 $d$ 在 $M$ 中成为平方，矛盾。素材明确交代这个论证包含 $p=2$ 与任意非离散秩一值群（`07-sections.tex:120-129`）。

我把这段拆成三个可复用的部件：$z$ 提供在第一赋值大、在第二赋值小的元件；分式 $\dfrac{z^r}{1+z^r}$ 是一个在两处分别趋于 $1$ 与 $0$ 的有理插值族；商掉两个 Hensel 平方根把「$d$ 在两处分别接近一个平方」变成「$d$ 本身是平方」。我也意识到自己早先设想用一个现成的定理收尾是偷懒：$2v_i(2)$ 这个余量正是 $p=2$ 时唯一性失效的地方，若不显式写出族 $q_r$，$p=2$ 就只能另外处理，而这里一次做完。这与 §6 中 $v_p(e_c)+1/(p-1)$、§12 中 $D-v_p(m)>1/(p-1)$ 是同一个模式的三次出现：把 Hensel 或对数指数的收敛余量写成显式不等式，然后让一个可调参数（$e_c$、$D$、$r$）把它吃掉。

## §16 截面的赋值分类与 type $2h$ 的收束

满射部分的写法是「取一条截面，追它的赋值」。设 $s:G_k\to\Pi_X$ 连续同态截面，Pop--Stix 的赋值定位定理给出 $K$ 上扩展 $p$ 进赋值的赋值 $w$ 及其到 $\widetilde K$ 的延长 $\widetilde w$，使

$$s(G_k)\subseteq D_{\widetilde w}(\widetilde K/K)$$

（`07-sections.tex:131-139`）。剩下的就是给 $w$ 分类，而分类只用两条一般事实。赋值超越不等式给出

$$\operatorname{ratrank}(\Gamma_w/\Gamma_k)\le1,$$

而 $\Gamma_k$ 有理秩为 $1$、序秩不超过有理秩，故 $w$ 的秩至多 $2$（`07-sections.tex:141-146`）。秩一由引理 7.2 排除。秩二时取它的秩一粗化 $u$：秩二值群的那个非零真凸子群在 $\widetilde w$ 的值群中有唯一扩张，由「某个正倍数落在原子群内」的那些值组成，这同样来自代数赋值扩张值群相差挠商；稳定 $\widetilde w$ 的每个自同构都保持该子群，于是 $s(G_k)$ 稳定由此得到的 $u$ 的延长。若 $u$ 在 $k$ 上非平凡，就把它归一化成扩展 $p$ 进赋值的样子，同一条引理再次排除（`07-sections.tex:147-157`）。

于是我原来担心的「秩二情形要不要再做一次分析」被两句结构性的话化解：粗化的凸子群是典范的，所以截面对它的稳定是自动传递的。

剩下的可能只剩 $u$ 在 $k$ 上平凡。固有性给出它在 $X$ 上的中心；中心不可能是 generic（$u$ 非平凡），故是闭点 $a$；$u$ 的赋值环支配离散赋值环 $\mathcal O_{X,a}$，而 $K^\times$ 的每个元素都是局部参数的幂乘以该局部环的单位，故 $u$ 等价于 $\operatorname{ord}_a$；其剩余域是 $k$ 的有限扩张 $k(a)/k$，复合 $w$ 中的第二个赋值就是 $p$ 进赋值到 $k(a)$ 的唯一延长，因此 $w$ 属 type $2h$（`07-sections.tex:158-167`）。收尾的一步我读了两遍才确认它的逻辑位置：选定的水平延长到 $K\bar k$ 挑出 $a$ 上方一个几何点，其稳定子通过 $G_{k(a)}\subseteq G_k$ 作用在常数上，嵌入由该点决定；由于 $s(G_k)$ 投影到 $G_k$ 上是满的，必有 $k(a)=k$；对完整 étale 塔水平惯性平凡，水平分解群就是 $a$ 处的点截面，等价地 Pop--Stix 的 type $2h$ 结论在相应几何基点选取下给出 $s=s_a$（`07-sections.tex:169-177`）。

素材紧跟一条限定，我认为它是这段最重要的诚实交代：type $2h$ 赋值可以坐在非有理闭点上方；这里的有理性是从到 $G_k$ 的满射推出来的，全篇没有用到「非 type $2h$」与「不来自有理点」之间任何无条件的等价（`07-sections.tex:179-183`）。我自己起草时正好会犯这个错：把两个排除方向当成同一个，于是漏掉满射这一支对 $k(a)=k$ 的依赖。至此满射证毕。

## §17 单射性：Kummer 论证与 $p$ 进解析群

单射部分的口径要格外小心：设 $a,b\in X(k)$ 给出按完整几何基本群共轭后相同的截面类。$J$ 是 $X$ 的雅可比，以 $a$ 为基点作 Abel--Jacobi 映射

$$i_a:X\longrightarrow J,\qquad x\longmapsto[x-a],$$

两点诱导的在 $J$ 上的截面仍几何共轭。对每个正整数 $n$，乘法 $[n]:J\to J$ 是 $J[n]$ 下的有限 étale torsor，即便 $p\mid n$ 也 étale，因为 $k$ 特征零。共轭截面在几何纤维上给出同构的 $G_k$ 作用，故「有无不动点」在共轭下不变；$i_a(a)=0$ 处的截面有不动提升 $0$，于是 $i_a(b)$ 的纤维有 $G_k$ 不动点，也就是该纤维的一个 $k$ 有理点，从而

$$i_a(b)\in\bigcap_{n\ge1}nJ(k)$$

（`07-sections.tex:185-202`）。素材补了一句这就是通常的 Kummer 论证：沿截面拉回乘法 torsor 所得的类在几何共轭下不变（`07-sections.tex:203-204`）。

收束这一步纯粹是 $p$ 进解析的。$J(k)$ 是紧 $p$ 进解析群，由局部对数存在开子群

$$U\cong\mathbb Z_p^{g(X)[k:\mathbb Q_p]},$$

设 $q=[J(k):U]$，则 $qJ(k)\subseteq U$；对每个 $r\ge0$ 在上面的交里取 $n=qp^r$，交中任一元素就可写成 $p^r(qy)$，$y\in J(k)$，故属于 $p^rU$；$U$ 是有限自由 $\mathbb Z_p$ 模，于是

$$\bigcap_{r\ge0}p^rU=0,$$

故 $i_a(b)=0$。若 $a\ne b$，一次除子 $a$ 与 $b$ 的线性等价会给出度 $1$ 的态射 $X\to\mathbb P^1$，逼出亏格 $0$； Hence $a=b$（`07-sections.tex:206-218`）。

两处细节我想标出来。其一，维数 $g(X)[k:\mathbb Q_p]$ 说明这条论证吃的是 $J(k)$ 作为 $\mathbb Z_p$ 解析流形的局部结构，亏格在这里以指数的形式出现，并非以稳定性的形式出现。其二，全篇亏格至少 $2$ 的两次真正使用分别在不同侧：满射侧是 §9 的稳定性不等式与骨架有限性，单射侧是最后这句「度 $1$ 态射致亏格 $0$」；两处都没有把亏格条件当成摆设。

定理 1 到此证完：满射靠赋值分类与两赋值矛盾，单射靠雅可比的 Kummer 与可除性交为零。我读完这两侧的不对称，回头才理解为什么局部版本比原始猜想更容易下手，局部一侧有赋值可依赖，而这一侧恰好把「点到截面」的逆问题变成了赋值类型问题。

## §18 全局推论：局部化像、下降轨迹与模曲线

最后一节把局部定理接上已有的下降与有限支撑结果。我先记一笔口径冲突：局部部分里 $K=k(X)$ 是函数域，而 `08-global-sections.tex:9` 声明「本节 $K$ 是数域」，同一个字母在论文前后指两类域，抄公式时必须按节切换。记号 $\operatorname{Sec}(D/F)$ 表示

$$1\longrightarrow\pi_1(D_{\bar F})\longrightarrow\pi_1(D)\longrightarrow G_F\longrightarrow1$$

的连续分裂在完整几何 étale 基本群共轭下的类（`08-global-sections.tex:11-18`），全局截面猜想即 $\kappa_C:C(K)\to\operatorname{Sec}(C/K)$ 双射；素材强调这里考虑的是完整算术 étale 类，没有附加任何双有理提升的假设（`08-global-sections.tex:21-25`）。

修正阿德尔集合定义为

$$C(\mathbb A_K)_\bullet=\prod_{v\nmid\infty}C(K_v)\times\prod_{v\ \text{实}}\pi_0\bigl(C(K_v)\bigr),$$

复位被略去，这是按 Stoll 勘误里的修正约定；对几何连通的 $C$ 而言旧的复分量因子本就是单点，略去之所以要紧，是因为几何不连通的挠子上它不再是单点（`08-global-sections.tex:29-39`）。一个点「在 $G$ 挠子 $Y\to C$ 下存活」指的是它对某个扭曲 $\xi\in H^1(K,G)$ 提升到了 $Y^\xi(\mathbb A_K)_\bullet$；对一切有限 $K$-群挠子都存活的记 $C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}cov}}$，只要求 $G$ 交换的记 $C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}ab}}$，于是有包含链

$$C(K)\subseteq C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}cov}}\subseteq C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}ab}}$$

（`08-global-sections.tex:40-53`）。局部定理与实位截面定理一起给出无需任何下降等式假设的局部化映射 $\operatorname{loc}:\operatorname{Sec}(C/K)\to C(\mathbb A_K)_\bullet$：有限位上由定理 1 得唯一点 $P_v\in C(K_v)$，实位上分量到截面的映射双射（亏格至少 $2$ 的情形含在 Bresciani--Vistoli 的定理里），复位局部 Galois 群平凡故条件自动，于是每条 $s$ 都是塞尔默截面，固有性保证这些局部化组成一个修正阿德尔点 $x(s)$（`08-global-sections.tex:55-74`）。

命题 8.1 说 $\operatorname{loc}(\operatorname{Sec}(C/K))=C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}cov}}$（`08-global-sections.tex:76-83`）。两个方向都走 Harari--Stix 的下降桥：正向在实位各取所定分量中的代表点、复位任取一点，用其定理 2.1 取 $U=1$、被舍去的位集合 $S=\varnothing$，加上其注 2.2(1) 把这个条件认成有限覆盖下降（`08-global-sections.tex:86-96`）；反向取有限覆盖轨迹中的 $x$ 与一个通常阿德尔代表 $P=(P_v)$，按 Stoll 的定义 5.2 之后的上同调刻画与定义 5.4，存活等价于局部赋值对每个挠子都属于对角像集 $\operatorname{H}^1(K,G)$，这些赋值经过实分量因子且复位无提升条件，于是 $P$ 满足通常有限挠子条件，再用同一处定理 2.1 的蕴含（i）推出（iii），得到一条限制与 $P_v$ 的点截面共轭的全局截面，其局部化正是 $x$（`08-global-sections.tex:98-113`）。

判据定理 8.2（`08-global-sections.tex:122-129`）：若 $C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}cov}}=C(K)$，则 $\kappa_C$ 双射。证明的机关在支撑：由命题 8.1 与等式假设，$x(s)$ 是某个 $a\in C(K)$ 的对角局部化；在实位与复位都取 $a$ 本身，于是这个局部化组的通常阿德尔代表支撑在 $\{a\}$ 上，Stix 意义下的支撑 $Z(s)$ 在 $K$ 上有限；$C$ 固有且亏格至少 $2$ 故双曲、无尖点截面，Stix 的有限支撑定理使 $s$ 成为点截面；最后若两点给同一全局截面，则限制到任一有限完备化后仍相同，定理 1 的单射性把两点认同（`08-global-sections.tex:131-150`）。等式假设的来源有几条已发表判据：$C$ 到阿贝尔簇 $A/K$ 有非常态射且 $A(K)$ 有限、$\operatorname{Sha}(A/K)$ 的最大可除子群为零；或雅可比 $J$ 满足 $J(K)$ 有限且 $\operatorname{Sha}(J/K)_{\mathrm{div}}=0$；分别由 Stoll 定理 8.6 与推论 8.1 给出 $\mathrm{f\text{-}ab}$ 轨迹等于 $C(K)$，配合上面的包含链即可，且不需要 $C$ 上有 $K$ 有理基点（`08-global-sections.tex:153-185`）。再加一条只用到塞尔默余秩的特化：$C/\mathbb Q$ 非常映到椭圆曲线 $E$，且

$$s_p(E)=\operatorname{corank}_{\mathbb Z_p}\operatorname{Sel}_{p^\infty}(E/\mathbb Q)$$

在某个素数 $p$ 上为零，则同伴文章的反向定理给出 $\operatorname{rank}_{\mathbb Z}E(\mathbb Q)=0$ 与整个塔特--沙法列维奇群有限，于是 $E(\mathbb Q)$ 有限、其最大可除子群为零，套用上一条（`08-global-sections.tex:187-210`）。模曲线那一条最直接：亏格至少 $2$ 的光滑射影几何连通 $X_0(N)/\mathbb Q$ 与同样条件的 $X_1(N)/\mathbb Q$ 都满足 $\mathrm{f\text{-}ab}$ 轨迹等于有理点，由 Stoll 推论 8.8 与勘误后的约定给出（`08-global-sections.tex:212-227`）。

素材在最后加了两句限定，我认为它们该被读者同等重视：一般的蕴含里有限覆盖等式仍是真正的算术假设，仅有「局部都来自点」并不能供给它；而关于局部化像的进一步限制，即便不假设等式也成立，通常阿德尔下降集 $D_{\mathrm{lin}}(C)$（对一切线性代数群挠子提升）与布劳厄--玛宁集都包含 $\rho^{-1}(\operatorname{loc}(\operatorname{Sec}(C/K)))$，其中 $\rho$ 是从通常阿德尔到修正阿德尔的投影（`08-global-sections.tex:229-263`）。若 $K$ 不含复乘子域，Betts--Stix 定理 A 对每个有限位 $v$ 给出

$$\#\operatorname{loc}_v\bigl(\operatorname{Sec}(C/K)\bigr)<\infty,$$

并且素材明说这条不断言局部化的单射、不断言全局截面集合有限、也不给有效或一致界（`08-global-sections.tex:265-276`）。

## §19 量级的账与三处失败模式

把全篇出现过的数值条件集中在一张纸上，是我核对「哪一步会被改动打断」的方式。所有收敛性余量都是同一个形状 $v_p(\cdot)+1/(p-1)$：盘内单位开根要求 $v\bigl(a(u)/a(0)-1\bigr)>v_p(e_c)+1/(p-1)$（`03-patching.tex:40-41`）；任意阶根要求 $D>v_p(m)+1/(p-1)$ 且 $a>2D$（`05-arbitrary-roots.tex:61-65`）；中段领圈上的估计是 $\lvert h_j\rvert\le p^{-\min\{s,a-s\}}<p^{-D}$（`05-arbitrary-roots.tex:164-168`），因而 $\lvert\log(1+h_j)\rvert\le\lvert h_j\rvert$ 且指数的赋值大于 $D-v_p(m)>1/(p-1)$（`05-arbitrary-roots.tex:180-183`）；Hensel 开平方的余量写成 $v_i(\cdot)>2v_i(2)$（`07-sections.tex:122-126`）。这四条里 $1/(p-1)$ 的来源都是对数与指数级数的收敛半径，$2v_i(2)$ 的来源是 Hensel 引理在 $p=2$ 时的加强条件，两处合起来解释了素材为什么敢宣称包含 $p=2$。

几何量的账：库默覆盖 $y^\ell=T(T-1)/(T-\alpha)$ 的亏格是 $g(Z)=\ell-1$，由 $2g(Z)-2=-2\ell+4(\ell-1)$ 得（`05-arbitrary-roots.tex:83-86`）；两顶点 $\ell$ 条平行边、每边长 $a$、结点厚度 $v(\alpha)=a$，稳定性靠 $\ell\ge3$（`05-arbitrary-roots.tex:105-110`）；回路顶点的局部 Riemann--Hurwitz 是 $2g(D')-2=\ell(2g(D)-2)+2(\ell-1)$，多出的两项正是两条回路边（`04-tame-roots.tex:121-126`）；覆盖后三角化的稳定性由 $d(2g-2+\operatorname{val}(v))>0$ 保持（`04-tame-roots.tex:175-178`）；亏格 $0$ 树一侧被 $2N-1$ 与 $3N$ 的价度对比排除（`04-tame-roots.tex:146-149`）；拉回把分歧指数从 $e$ 改成 $e/\gcd(e,r)$（`03-patching.tex:205-209`）。赋值口径三处：$\lvert p\rvert=p^{-1}$（`01-introduction.tex:105-107`）、$w(p)=1$（`07-sections.tex:14-16`）、$v=-\log_p\lvert\cdot\rvert$ 与 $\Omega$ 的加性值群 $\mathbb Q$（`02-preliminaries.tex:15-18`）。单射侧的解析维数是 $g(X)[k:\mathbb Q_p]$，交集里取的参数是 $n=qp^r$，$q=[J(k):U]$（`07-sections.tex:206-212`）。秩的限制是 $\operatorname{ratrank}(\Gamma_w/\Gamma_k)\le1$ 逼出秩至多 $2$（`07-sections.tex:142-146`）。

三处失败模式我把它们当作可复用的反面教材留下。其一是只在一片 sheet 上开根：平凡化必须覆盖全部 $e_c$ 个因子，否则胶出来的不是度 $d$ 的代数（`03-patching.tex:99-109`）。其二是对任意两个分枝覆盖做合成：闭包性引理明确要求上层覆盖 étale，且它对特征 $p$ 归约的 tame 性一言不发（`03-patching.tex:215-220`）。其三是在赋值类型上偷换等价：type $2h$ 的赋值可以坐在非有理闭点上方，有理性是从截面到 $G_k$ 满射单独推出来的（`07-sections.tex:179-183`）。这三处的共同结构是：一个「看起来局部成立」的条件，被全局粘贴或群论满射卡住。

## §20 反思：最终思路与最初设想的差异

合上素材，我最早设想的是一条「正面构造」：给定截面 $s$，直接在 $X$ 上造出一个点，比如从截面在某个有限 étale 覆盖上的不动性质出发，或者沿雅可比把点解出来。素材里没有这种构造，一次都没有。它走的是排除法：先把截面可能局部化的赋值列全（秩至多 $2$），再逐类排除，最后剩下的那一类里点自己掉出来。这是第一处、也是最大的一处偏差。

第二处偏差在工具的配比上。我原以为局部 $p$ 进版本的主要困难来自算术（基本群、挠子、塞尔默条件），读完全文才发现算术只出现在三处：单射侧的 Kummer 与 $\mathbb Z_p$ 解析群、全局侧的下降与有限支撑、以及两赋值矛盾里的开平方。剩下的全部力气花在解析与热带一侧：稳定骨架、结点环面、度量复形的覆盖提升、环面一致化、调和形式的积分、单位 Laurent 展开的支配项。亏格至少 $2$ 这个通常算「算术双曲性」的假设，在这里的实际作用是让骨架成为有限度量图并让 $2g(v)-2+\operatorname{val}(v)>0$ 可用。

第三处偏差是「两阶段自我供给」的设计。我原先设想想一步到位地造出任意阶根，而素材的路径是先用 $\ell$ 阶分枝换到 $\ell$ 次根（第一阶段），再用一条有两顶点与 $\ell$ 条平行边的曲线上的除法换到任意阶根（第二阶段），最后用第二阶段的根去实现任意分枝指数的扩张。循环是闭合的：辅助覆盖的分枝指数被锁在 $\{1,\ell\}$，正好是第一阶段可以接受的范围。这类「先窄后宽」的分层在我以前的 reading 里多见于下降论证，出现在纯解析构造里让我吃了一惊。

信息不足的地方我按规矩标出。第一处 `[推测]`：素材没有交代固定奇素数 $\ell\ne p$ 的选取理由，我只看见它服务于度量复形覆盖提升定理对 tame 的要求，以及第一阶段对指数整除 $\ell$ 的定义；换成另一个奇素数是否影响第二阶段（$g(Z)=\ell-1$ 与 $\ell\ge3$ 的稳定性），正文没有任何讨论，因此我无法判断这是技术必需还是任意选择。第二处 `[推测]`：全文八节没有一节的注释性讨论，唯一的 remark 是 §7 那条闭包性引理的射程限定（`03-patching.tex:215-220`），所以「哪些推广作者试过而放弃」这条线索只能靠结构反推，我上面写的四处断口是从证明里必然出现的前提倒推的，属于我自己的工作假设。第三处 `[推测]`：亏格 $1$ 与亏格 $0$ 为何不能靠别的路子处理，素材未提；我只知道两处使用点会断，断掉之后是否有替代办法无从判断。

尚未解决或本稿没有触及的四件事：全部论证非有效，没有任何一致界或算法输出，素材自己也承认关于局部化像的有限性「既不断言单射、也不给有效或一致界」（`08-global-sections.tex:275-276`）；全局定理 8.2 的前提是外部算术假设，即有限覆盖下降轨迹等于有理点集（`08-global-sections.tex:125-127`）；特征 $p$ 的函数域情形完全没谈，那里的赋值结构（$\Omega$ 值群为 $\mathbb Q$）不再成立；实位与复位的处理依赖他人定理与勘误，本稿只作转述。

## §21 勘误与申报

以下按类别登记本稿落盘后的缺陷，全部留在原处不就地回改，交机械清理通道处理；我不做任何旧段落替换。

一、首块体量缺口。首次落盘实测 $14004$ 字节，写的是 §0 到 §4 共五节，低于本单规定的 $15000$ 字节下限约一千字节；落盘时机本身合规，缺口按后述追加笔数已补回。

二、整块落错位置。§18 全局推论与 §19 量级的账这两节的整块，物理位置在 §14 末段之后、§15 标题之前；锚点误取了 §14 末句（该句在全文唯一，但未复核它并非当时文件末段）。请本体侧用整块搬迁工具把这两节移到 §17 之后，搬正后编号顺序即为 §0 到 §22 连续。我自己不搬。

三、长停顿号成对出现三处：§14 首段「归一化的作用被单独解释了一遍」之后、§17 末段「更容易下手」之后、§18 末段「两句限定」之后。按类别申报，未回改。

四、否定转折连读一处：§17 倒数第二段「亏格在这里以指数的形式出现」之后那一句。按类别申报，未回改。

五、正文英文残留两处：§9 末段「Riemann--Hurwitz」与「图分歧为零」之间夹了一个英文副词；§17 倒数第二段句末出现一个英文连接短语后才接 $a=b$。

六、赋值类型标签未中文化：§4 末段、§16 标题与其后两段、§19 末段沿用了素材里该赋值类型的英文写法与数学式拼接，未统一成中文「二型 h」一类口径。

七、文献作者姓名首字母缩写未展开两处：§8 末段与 §10 末段各出现一次，指度量复形 tame 覆盖提升定理的合著者缩写。

八、成对星号强调一处：§12 首段末句用了一对星号做强调，属装饰性强调，未回改。

九、自定义宏与标签形态：素材序言里声明的算子名在本稿一律展开成标准写法；素材中的公式标签、交叉引用形态一律没有抄进正文，位置统一写成文件与行号；配图的分面描述按 `figures/parallel-edges.tex:11-42` 引用。

十、术语口径自查：annulus 全篇作「环面」、collar 全篇作「领圈」、skeleton 作「骨架」、metrized complex 作「度量复形」、patching 作「粘合」、torsor 作「挠子」、decomposition group 作「分解群」，未混用。

十一、探针与临时件：首次落盘前在 `_work/D770-probe.md` 试写了行内定界符与行内代码各一小段，实测 Write 通道完整保留定界符（十个字符、五对）与反引号，因此首块走 Write，后续一律 Edit 追加；临时件未落在 `研究笔记/` 与仓库根，全程未执行任何版本控制命令，未读取任何 PDF。

## §22 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $g(X)\ge2$ | 亏格下界 | `01-introduction.tex:31-34` | 定理1与稳定骨架的有限性 | 稳定性不等式与度 $1$ 态射两处排除同时失效 |
| $v=-\log_p\lvert\cdot\rvert$ | 加性口径 | `02-preliminaries.tex:15-18` | 全篇赋值估计与无理层选取 | 各处的 $1/(p-1)$ 余量无法比较 |
| $\lvert p\rvert=p^{-1}$ | 范数归一化 | `01-introduction.tex:105-107` | 完备化 $E$ 与分解群同构 | 值群嵌入差一个比例因子，等距延拓失效 |
| $\Omega=\widehat{\bar k}$ | 代数闭、值群 $\mathbb Q$ | `02-preliminaries.tex:13-18` | 单位开根与半径选取 | 支配单项式唯一性失效 |
| $\ell$ | 固定奇素数且 $\ell\ne p$ | `02-preliminaries.tex:36-37` | 第一阶段与辅助覆盖 | 度量复形提升定理要求可逆，取 $\ell=p$ 即失 étale |
| $\widetilde K\subset L_\ell$ | 万有 étale 域在中间层内 | `02-preliminaries.tex:41-45` | 分层交换图的起点 | 第一阶段失去比较对象 |
| $v_p(e_c)+1/(p-1)$ | 盘内单位开根余量 | `03-patching.tex:40-41` | 局部正规形 $t_b=z_c^{e_c}$ | 对数指数不收敛，坐标正规形拿不到 |
| $\mu_{e_c}$ | $e_c$ 次单位根集 | `03-patching.tex:100-103` | 重叠区上因子的互索性 | 分裂不完整，度 $d$ 代数未平凡化 |
| $d$ | 覆盖 $C\to X_{\bar k}$ 的次数 | `03-patching.tex:62-64` | 内盘的平凡覆盖度 | 胶合后的代数不再是有限局部自由 |
| $m_b$ | 上方全部分枝指数的公倍数 | `03-patching.tex:65-66` | 粘合命题的根条件 | 某因子未分裂，替换失败 |
| $A_b=\{r_b<\lvert t_b\rvert<R_b\}$ | 边界环面 | `03-patching.tex:70-72` | 根所需的全原像区域 | 根只在一盘上有则重叠区不同构 |
| $U$ | 外区，须含 $\xi$ | `03-patching.tex:74-77` | 解析映射定义域与点转移 | $\xi$ 落进盘内则引理3.3不适用 |
| $e/\gcd(e,r)$ | 拉回后的局部分歧指数 | `03-patching.tex:205-209` | 水平分歧的拉回封闭性 | 指数不再整除 $n$，合成不入 $L_\ell$ |
| $2g(v)-2+\operatorname{val}(v)>0$ | 稳定性不等式 | `04-tame-roots.tex:64-66` | 覆盖后三角化仍稳定 | 提升定理前提崩 |
| $2N-1$ 与 $3N$ | 亏格 $0$ 树的价度对比 | `04-tame-roots.tex:146-149` | 分隔边两侧必有回路或正亏格顶点 | 分隔边无法归约到非分隔情形 |
| $2g(D')-2=\ell(2g(D)-2)+2(\ell-1)$ | 回路顶点局部计数 | `04-tame-roots.tex:121-123` | 增广图分歧为零 | 提升定理不适用，$\ell$ 次根无来源 |
| $d(2g-2+\operatorname{val}(v))$ | 局部度 $d$ 下的标度 | `04-tame-roots.tex:175-178` | 不分枝覆盖后稳定性 | 骨架构造断在分隔边一支 |
| $\lvert\pi\rvert^{j+1}<\lvert u_i\rvert<\lvert\pi\rvert^{j}$ | 吹起产生的结点环面 | `04-tame-roots.tex:220-222` | 领圈搬进稳定骨架 | $t_i$ 与 $u_i$ 环面不同心则引理4.4断链 |
| $a\notin\mathbb Q$ | 无理层 | `04-tame-roots.tex:247-250` | 挤出含 $a$ 的有理端点开区间 | 紧性论证给不出 $A_i'$ |
| $L_\ell\subset H$ | 第一阶段成果 | `04-tame-roots.tex:285-287` | 定理2的实化 | 任意有限 Galois 扩张进不了 $H$ |
| $\Lambda/\Lambda^m$ | 周期格的模 $m$ 商 | `05-arbitrary-roots.tex:35-39` | 除法引理的开闭分解 | 提升歧义不消失，$m$ 次根不能粘 |
| $D>v_p(m)+1/(p-1)$ | 中段领圈余量 | `05-arbitrary-roots.tex:61-63` | $b_j=\exp(m^{-1}\log(1+h_j))$ | 单位因子无 $m$ 次根 |
| $a>2D$ | 长度预算 | `05-arbitrary-roots.tex:65` | $A^\circ$ 非空 | 中段领圈为空，任意阶根不成立 |
| $g(Z)=\ell-1$ | 库默覆盖亏格 | `05-arbitrary-roots.tex:84-86` | 雅可比维数与骨架秩 | 环面一致化的自由格秩不符 |
| $\ell$ 条长 $a$ 的平行边 | 骨架形状 | `05-arbitrary-roots.tex:109-110` | 回路 $c_j=e_j-e_{j'}$ | 斜率一失去载体 |
| 沿 $e_j$ 的导数等于 $1$ | 调和形式积分 | `05-arbitrary-roots.tex:142-148` | $u_j=c_j'T(1+h_j)$ | $u_j$ 与坐标 $T$ 不同阶，根换不到 $T$ |
| $\lvert h_{j,n}\rvert\le1$，$\lvert h_{j,-n}\rvert\le\lvert\alpha\rvert^{n}$ | Laurent 系数两端界 | `05-arbitrary-roots.tex:160-163` | $\lvert h_j\rvert<p^{-D}$ | 收敛带不足，$m$ 次根估计断 |
| $p^{-\min\{s,\,a-s\}}$ | 单位范数的位置衰减 | `05-arbitrary-roots.tex:164-168` | 闭子环面上的一致余量 | 对数与指数不再局部一致收敛 |
| $D_b<-\log_p\lvert T\rvert<a_b-D_b$ | 拉回前的领圈 | `06-realization.tex:31-33` | 每个分支点各自的根供给 | 领圈不能塞进 $B_b$，实化断链 |
| $K^{\mathrm{sep}}\subset H$ | 定理2结论 | `01-introduction.tex:118-124` | 分解群同构 | 双有理提升失去来源 |
| $w(p)=1$ | 秩一赋值归一化 | `07-sections.tex:14-16` | 分解群同构的等距延拓 | 自同构不再保持绝对值，单射段失效 |
| $v_1(p)=1$，$v_2\upharpoonright_{k^\times}=0$ | 两赋值的归一化差异 | `07-sections.tex:88-90` | 不等价性与矛盾 | 引理7.2不成立，秩一排除失败 |
| $z=p^N/t$，$N>v_1(t)$ | 双向大小元件 | `07-sections.tex:98-103` | 有理插值族 $q_r$ | 两处逼近至少一处不收敛 |
| $2v_i(2)$ | 开平方的 Hensel 余量 | `07-sections.tex:122-126` | 两赋值矛盾含 $p=2$ | $p=2$ 情形需另行处理 |
| $\operatorname{ratrank}(\Gamma_w/\Gamma_k)\le1$ | 赋值超越不等式 | `07-sections.tex:142-146` | 秩至多 $2$ 的分类 | 更高秩赋值无法排除，满射段断 |
| $\mathbb Z_p^{g(X)[k:\mathbb Q_p]}$ | $J(k)$ 的开子群结构 | `07-sections.tex:206-208` | 可除交集为零 | 单射性失效 |
| $n=qp^r$，$q=[J(k):U]$ | 交集里取的参数 | `07-sections.tex:209-212` | $\bigcap_{r\ge0}p^rU=0$ | 只得有限挠，两点不能认同 |
| $\operatorname{loc}(\operatorname{Sec}(C/K))$ | 等于有限覆盖轨迹 | `08-global-sections.tex:79-83` | 全局判据 | 局部化像与下降集脱钩 |
| $C(\mathbb A_K)_\bullet^{\mathrm{f\text{-}cov}}=C(K)$ | 有限覆盖下降等式 | `08-global-sections.tex:125-127` | 定理8.2的前提 | 全局截面猜想无从退出 |
| $s_p(E)=0$ | 塞尔默群的 $\mathbb Z_p$ 余秩 | `08-global-sections.tex:188-192` | 椭圆目标特化 | 得不到秩为零与沙群有限 |
| $\#\operatorname{loc}_v(\operatorname{Sec}(C/K))<\infty$ | 每个有限位的像有限 | `08-global-sections.tex:268-272` | 不含复乘子域时的限制 | 仅失有限性，与局部定理无涉 |
| $88580$ | 素材 .tex 实测总字节 | `main.tex:42-49` | 本单取证预算的分配 | 预算失衡会把首落挤出窗口 |

自检口径：上表五列结构只在本节出现一次，行首竖线计数按每行六枚书写，格内绝对值与限制符号均用成对的 LaTeX 命令，未出现裸竖线占位；全稿数学定界符逐行成对，未做任何奇偶补偿。
