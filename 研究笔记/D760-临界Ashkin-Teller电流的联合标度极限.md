# D760 临界 Ashkin--Teller 电流的联合标度极限：研究笔记

## §0 素材面貌与我的读取顺序

这单是我在把临界 Ashkin--Teller 线（critical line）上「高度 + 两族电流簇」的联合极限写成一份可以自查的证明时留下的笔记。落盘的动机很实际：全文十个 `.tex` 分片，顶层 `main.tex` 只是壳（3,191 字节，`main.tex:68`--`main.tex:78` 逐条 `\input`），正文里真正承重的是 `03-spatial.tex`（93,219 字节，1,715 行）与 `06-gaussian.tex`（57,217 字节，1,140 行）两片，其余分片各管一段：`02-model.tex` 24,482 字节给有限模型与主定理，`04-spectral.tex` 23,070 字节给谱表示，`05-screening.tex` 34,518 字节给屏蔽，`07-local-sets.tex` 47,771 字节给局部集识别，`08-local-kernel.tex` 39,347 字节给公共局部核与不可穿越，`09-identification.tex` 55,648 字节收尾识别，`10-input-conventions.tex` 8,304 字节是附录的输入约定。

摘要只有一句话的长度（`main.tex:57`--`main.tex:66`）：对临界线上每个固定的点，含四态 Potts 端点，在每个有界约当区域、对每个容许多边形逼近，证明高度与两族电流簇的联合标度极限；高度收敛到一个高斯自由场（Gaussian free field，下面按素材口径写作 $h$），耦合常数是被预言的那个；簇收敛到同一个场的典范递归二值局部集；联合极限包含所有嵌套深度与那条被单独留出的硬连接边界簇。我把这句话拆成三个必须分别挣来的东西：场的收敛（含归一化系数）、场的极限是局部的正态、簇与场之间有可识别的耦合。三者各自失败的方式不同，混在一起写就会看不出证明到底断在哪。

我读的顺序与成文顺序不同。先读 `main.tex` 与 `01-introduction.tex`，因为引言里把参数、正则化与既有结果的适用范围一起写死了：$\lambda=\frac{\pi}{2}$、$a=\lambda\sqrt{g}$、$g=\frac{8}{\pi}\arcsin\!\left(\frac{\sqrt{1+e^{4U}}}{2}\right)$、$\frac{4}{3}<g\le 4$、$\lambda<a\le 2\lambda$（`01-introduction.tex:15`--`01-introduction.tex:24`）。再读 `02-model.tex` 全片拿到主定理 `thm:main`（`02-model.tex:355`--`02-model.tex:372`）与证明策略（`02-model.tex:410`--`02-model.tex:481`），因为策略段是唯一能告诉我「哪一节只依赖哪一节」的地方。之后我才进 `03-spatial.tex`，从 `03-spatial.tex:1`--`03-spatial.tex:185` 起步：这一段先立辅助表示与精确切割律，后面六片全部踩在它上面。剩下的分片我按策略段的顺序读，读到哪节就补哪节的笔记，没有把证明从头到尾顺读一遍：那样做的话，第九节里那些依赖第八节结论的论证会在我还没读到时显得像断言。

下面每节都要交代我当时的取舍。素材不足的地方我标 `[推测]` 并说明为什么不足，尤其是我无法从 `.tex` 里判断某一步是「作者认为显然」还是「作者也在这里加过条件」的情形。

登记两条照抄：

- 目录：`preprints/The-joint-scaling-limit-of-critical-Ashkin-Teller-currents-September-25-2026`
- 其他队列第 485 行号

## §1 出发点、最初的猜想，以及三条走不通的路

我的初始问题被引言的第一段说得很清楚（`01-introduction.tex:3`--`01-introduction.tex:11`）：电流表示提出的是一个超出「associated 高度收敛」之外的几何问题，即所有原始与对偶电流簇的联合连续律是什么，这些集合与场怎么耦合。要证的对象是 Alcalde López、Heeney、Lis 那条猜想的「高度与电流簇」那半（`01-introduction.tex:8`--`01-introduction.tex:11`，对应他们的 Conjecture 1.2）。这条猜想的形状是把双电流情形里的 $\sqrt{2}$ 换成 $\sqrt{g}$（`01-introduction.tex:49`--`01-introduction.tex:50`）。

最开始的猜想形态很朴素：既然 $U=0$ 时电流就是双随机电流（double random currents）且 $g=2$（`01-introduction.tex:37`--`01-introduction.tex:38`），而双电流一侧已经有嵌套场与递归簇边界的共形不变极限（`01-introduction.tex:40`--`01-introduction.tex:42`），那么把 $g$ 当成一个连续参数插进去，原来那套论证里凡是带 $\sqrt{2}$ 的地方换成 $\sqrt{g}$，结论就应该一路跟到 $\frac{4}{3}<g\le 4$。我确实用这个思路去数过哪些步骤会被 $g$ 动到，结果是我预期中最坏情况的两倍：被动的不只是常数，是三处机制。

第一条不通的路是「只用六顶点模型的高度极限」。解析输入与权重 $(1,1,c)$ 的六顶点模型有关，$c=\sqrt{1+e^{4U}}\in(1,2]$（`01-introduction.tex:62`--`01-introduction.tex:63`）。DKLM 那篇证了 $\sqrt{3}\le c\le 2$ 的高度标度极限，并在更大的区间 $1\le c\le 2$ 上给出若干输入：偶数增量对数的矩界、单奇偶性的自旋渗流回路、指定的平坦穷竭平面律、以及在「平面极限已经是高斯」这一前提下的自由能归一化识别（`01-introduction.tex:65`--`01-introduction.tex:70`）。也就是说 $c\in(1,\sqrt{3})$ 那一段（等价于 $g$ 接近 $\frac{4}{3}$）的协方差、屏蔽、正态性三件事都得我自己做，引言里那句「needed for the whole interval are given here」（`01-introduction.tex:70`--`01-introduction.tex:71`）就是这个意思。更要紧的是高度极限即使给了场，也不会给你簇：簇的识别要另外的装置。

第二条不通的路是把自由能识别当起点。自由能公式给的是系数，它的前提是极限存在且是高斯。我一开始把它排在最前，因为系数越早定下来后面的记号越省事。这个顺序在素材里被明确否决：自由能公式只能在其收敛前提被建立之后使用（`01-introduction.tex:72`--`01-introduction.tex:73`），`02-model.tex:445`--`02-model.tex:448` 又重复了同一句约束（先在每个阶验证六顶点的收敛判据，只有拿到高斯平面极限之后自由能对应才定系数）。顺序被迫改成：先证正态性，最后才把 $a$ 钉死。

第三条不通的路是对区域的偷懒。双电流那篇的联合边界族定理（他们的 Theorem 6.2 与 6.4）详细陈述假定了 $C^{1}$ 边界并且用回路之间的单射匹配（`01-introduction.tex:42`--`01-introduction.tex:44`）；而我要覆盖的是约当区域加任意容许多边形逼近，匹配也必须是正直径的非单射匹配（`01-introduction.tex:46`--`01-introduction.tex:49`）。我试过先用光滑区域把证明写完、再用保形映射推到约当区域，卡在两件事上：逼近序列的网度与领圈宽度要先于 $\delta\to0$ 固定（`02-model.tex:398`--`02-model.tex:400`），而保形映射不保持格上的邻边结构；另一件是匹配拓扑本身在单射下才有紧性直觉，非单射的匹配要靠紧包含（compact containment）来管，于是拓扑那节必须重写成一个度量（`02-model.tex:280`--`02-model.tex:330`）。

关键转折是我把「一个样本里的两条电流」拆成「一条电流 $N$ 加它的精确对偶补 $W$」。$W$ 是辅助的自旋渗流，它不是联合样本里的另一条电流（`02-model.tex:152`--`02-model.tex:159`，`03-spatial.tex:10`--`03-spatial.tex:17`）：在歧义边上 $W$ 以概率 $t$ 打开，而另一条电流以 $1-t$ 打开。这一步把「两条互相纠缠的电流」变成一个可以独立比较的对象，代价是要随时区分 $W$ 与另一条电流，一旦混淆整个耦合律就写错。我在这个记号上摔过一次：早期草稿里我把 $W$ 当作对偶电流来引用切割律，结果边界条件凭空多了一侧的自旋信息，切割律就不成立了（对比 `03-spatial.tex:35`--`03-spatial.tex:39` 那句：另一条电流的边装饰已被求和掉，它绝不能出现在切割或其一未搜索侧的停止数据里）。

最终思路与最初设想的差别，我用一句话记下：这不再是一个「参数化推广」的证明，是一整条从谱测度到正态性再到簇识别的重新构造；$\sqrt{g}$ 只出现在最后一步的系数里。

## §2 有限模型：权重、约束与为什么光有电流权重不够

参数固定为 $J>0$、$U\le J$ 且 $\sinh(2J)=e^{-2U}$（`02-model.tex:4`--`02-model.tex:7`），然后

\[
 t=(1+e^{4U})^{-1/2},\qquad c=t^{-1},\qquad \theta=\arcsin(c/2),\qquad g=\frac{8\theta}{\pi},
\]

于是 $\frac12\le t<1$、$1<c\le 2$、$\frac{4}{3}<g\le 4$；$U=0$ 给 $g=2$，端点 $J=U=(\log 3)/4$ 给 $g=4$（`02-model.tex:9`--`02-model.tex:15`）。这里有一个我一开始想省掉的诚实声明：所有常数可以依赖固定的参数，但文中不作 $t\uparrow1$ 的一致claim（`02-model.tex:15`--`02-model.tex:16`）。省掉它就会写出实际上不成立的均匀性。

区域侧：$D\subset\mathbb{R}^{2}$ 是有界约当区域，容许逼近是一族格 $\delta\mathbb{Z}^{2}$ 上的简单最近邻多边形 $P_{\delta}$，边界有一致收敛的参数化，且 $D$ 的每个紧子集最终被包住（`02-model.tex:18`--`02-model.tex:22`）。$G_{\delta}=(V_{\delta},E_{\delta})$ 取多边形上及内部的全部顶点与边，$B_{\delta}$ 是边界圈边；弱对偶 $G_{\delta}^{\dagger}$ 在每个有界面中心放顶点，在每条非边界边处穿一条对偶边（`02-model.tex:23`--`02-model.tex:26`）。原始与对偶边都按直线段画，边界收缩只用来描述电流权重、画图时不用（`02-model.tex:27`--`02-model.tex:29`），这条约定后面在簇的豪斯多夫距离里会咬人，所以我在动笔时就把它写死。

自旋侧采样 $\tau:V_{\delta}\to\{-1,1\}$ 与 $\tau^{\dagger}:V(G_{\delta}^{\dagger})\to\{-1,1\}$，在 $P_{\delta}$ 上 $\tau=1$；对每对互双边 $e=uv$、$e^{\dagger}=ff'$ 强制

\[
 (\tau(u)-\tau(v))(\tau^{\dagger}(f)-\tau^{\dagger}(f'))=0
\]

（`02-model.tex:34`--`02-model.tex:43`，编号式 `eq:spin-constraint`），容许对赋予权重 $t^{N(\tau)+N(\tau^{\dagger})}$，$N$ 数各自图上最近邻不同自旋的边数（`02-model.tex:44`--`02-model.tex:48`）。对偶自旋不施加边界约束。约束让「两侧同时不一致」不可能发生，这正是后面那张表的第二列里前两行互斥的来源（`02-model.tex:65`--`02-model.tex:66`）。

条件在自旋上后，$B_{\delta}$ 的所有边都是原始开边；其余每对互双边独立地按表决定（`02-model.tex:51`--`02-model.tex:64`）：$\tau^{\dagger}(f)\neq\tau^{\dagger}(f')$ 时给 $(1,0)$ 概率 $1$；$\tau(u)\neq\tau(v)$ 时给 $(0,1)$ 概率 $1$；两者都不成立时以概率 $1-t$、$1-t$、$2t-1$ 分别给 $(1,0)$、$(0,1)$、$(0,0)$。得到边集 $\widehat{n}_{\delta}$ 与 $\widehat{n}_{\delta}^{\dagger}$，它们的开边不交叉，而且一对互双边可以同时关闭，所以两条电流一般互补不了（`02-model.tex:66`--`02-model.tex:69`）。

收缩硬连接边界并删掉其圈边后，原始奇边就是那些穿过对偶自旋不一致的边，其余原始开边是偶边。电流展开里的律specialize成

\[
 \mathbb{P}(n_{\mathrm{odd}},n_{\mathrm{even}})\ \propto\ 2^{k(n_{\mathrm{odd}}\cup n_{\mathrm{even}})}\,x^{\lvert n_{\mathrm{odd}}\rvert}y^{\lvert n_{\mathrm{even}}\rvert},\qquad x=1,\quad y=c-1,
\]

$n_{\mathrm{odd}}$ 是 Euler 的且与 $n_{\mathrm{even}}$ 不交，$k$ 含孤立点（`02-model.tex:71`--`02-model.tex:93`，编号式 `eq:current-weight`）。我关心的是这段的验证细节，因为它决定我能不能把 $y$ 认成 $c-1$：一条奇边贡献 $t$、一条偶边贡献 $1-t$、一条关闭的原始边在对其可能的对偶状态求和后贡献 $t$；公因子是 $t^{\lvert E_{\delta}\setminus B_{\delta}\rvert}$，剩下 $\left(\frac{1-t}{t}\right)^{\lvert n_{\mathrm{even}}\rvert}$。原始颜色在开连通分支上取常值并给出 $2^{k-1}$ 种选择（硬连接颜色已定），一个容许的 Euler 奇集则把对偶颜色定到整体翻转为止。用原参数写回就是 $x=e^{2U}\sinh(2J)=1$、$y=e^{2U}\cosh(2J)-1=\sqrt{1+e^{4U}}-1$（`02-model.tex:84`--`02-model.tex:98`）。这里我给自己立了个规矩，也是这一节真正的取舍：只有电流权重不足以确定联合律，定住联合律的是「自旋加边」那一整套构造（`02-model.tex:99`--`02-model.tex:100`）。我早期把它当成方便记号略过，结果 $g\ne 2$ 时两条电流的联合分布无法从 $x,y$ 反推出来，后面所有条件切割律都会失去凭据。

高度按角点增量定义：在 $P_{\delta}$ 上 $H_{\delta}=0$，若 $v$ 与面 $f$ 相关联则

\[
 H_{\delta}(f)-H_{\delta}(v)=\frac{1}{2}\tau(v)\tau^{\dagger}(f)
\]

（`02-model.tex:102`--`02-model.tex:106`，编号式 `eq:height-increments`）。绕一条内部原始边一周的环流是 $\frac{1}{2}(\tau(u)-\tau(v))(\tau^{\dagger}(f)-\tau^{\dagger}(f'))=0$，边界原始增量全为零；多边形简单，故这些初等圈生成角点图的圈空间，于是增量定义出唯一的高度，在原始顶点上整值、在面中心半整值（`02-model.tex:107`--`02-model.tex:116`）。我之所以反复确认这段唯一性，是因为后面的簇识别要用 $K_{\delta}=2H_{\delta}$ 的模态反解自旋：$\tau(v)=\varepsilon(-1)^{K_{\delta}(v)/2}$、$\tau^{\dagger}(f)=\varepsilon(-1)^{(K_{\delta}(f)-1)/2}$，只能定到一个公共符号 $\varepsilon$（`02-model.tex:117`--`02-model.tex:126`）。角点图的一个 plaquette 有六种增量图案，两条对向都平坦的那两种自旋权重为 $1$，另外四种权重 $t$，除以公因子 $t$ 就是六顶点权重 $(1,1,c)$，$c=1/t$（`02-model.tex:127`--`02-model.tex:131`）；角点格是方格的固定旋转加伸缩。这一条局部识别加上无穷体积极限制，是允许我引用六顶点估计的全部理由。

作为 $D$ 上的分布，高度按

\[
 H_{\delta}(\varphi)=\delta^{2}\sum_{v\in V_{\delta}}H_{\delta}(v)\varphi(v),\qquad \varphi\in C_{c}^{\infty}(D)
\]

涂抹（`02-model.tex:136`--`02-model.tex:141`，编号式 `eq:height-smearing`）；这是个原子分布，局部落在 $H^{s}$（$s<-1$）里，中间估计用到的插值高度要拿来跟这个精确涂抹比较（`02-model.tex:142`--`02-model.tex:144`）。最后，$\mathcal{C}_{\delta}^{\mathrm{w}}$ 是原始开子图的全部连通分支之集，含边界分支 $C_{\partial,\delta}$；$\mathcal{C}_{\delta}^{\mathrm{f}}$ 是对偶开分支之集；分支连顶点带画出的边一起算，并且每一层嵌套都留着（`02-model.tex:146`--`02-model.tex:150`）。

## §3 连续侧对象：正则化、二值局部集与两条递归程序

零边界的场 $h$ 在 $D$ 内取协方差 $G_{D}=2\pi(-\Delta_{D})^{-1}$，于是对角附近 $G_{D}(z,w)=-\log\lvert z-w\rvert+O(1)$（`02-model.tex:183`--`02-model.tex:187`）。在这个归一化下

\[
 \lambda=\frac{\pi}{2},\qquad a=\sqrt{g}\,\lambda,\qquad a^{2}=2\pi\arcsin(c/2)
\]

（`02-model.tex:188`--`02-model.tex:192`，编号式 `eq:normalization`），故 $\frac{\pi}{\sqrt{3}}<a\le\pi$，即 $\lambda<a\le 2\lambda$（`02-model.tex:193`）。这个 $\lambda<a\le 2\lambda$ 的双边是整篇的关节：$a>\lambda$ 让硬连接的首簇落在二值局部集允许的参数范围里，$a\le 2\lambda$ 保证自由侧那条分裂程序的两个标签都为正。

我用记号 $A_{-\alpha,\beta}(f)$ 表示零边界场 $f$ 的典范薄二值局部集，$\alpha,\beta>0$ 且 $\alpha+\beta\ge 2\lambda$，集合本身含区域边界；每个补充分支上的条件调和函数取 $-\alpha$ 或 $\beta$ 之一，减去它之后分支内的场是独立的零边界高斯自由场；这些集合是场的可测函数，我用它的唯一性、单调性与约当洞性质（`02-model.tex:198`--`02-model.tex:206`）。特别地 $A_{-2\lambda,\,2\lambda}$ 的补充回路律为 $\mathrm{CLE}_{4}$（`02-model.tex:207`--`02-model.tex:208`）。素材里这个记号是 preamble 中的一个双参数宏，我这里按展开后的标准写法写，后文不再出现原宏名。

自由侧的程序（素材中的 Definition，`02-model.tex:210`--`02-model.tex:227`）我把它按自己的话拆成四步，因为它是最容易写漏一步的对象：在约当区域 $O$ 内给定零边界场 $f$，(1) 暴露 $A_{-2\lambda,2\lambda}(f)$，每个补充分支 $V$ 上的标签写成 $\xi\,2\lambda$，$\xi\in\{-1,1\}$，$V$ 内的零边界余项记作 $f_{V}$；(2) 若 $\xi=1$ 就保留 $A_{-2\lambda,\,2a-2\lambda}(f_{V})$ 作为一个簇，若 $\xi=-1$ 就保留 $A_{-(2a-2\lambda),\,2\lambda}(f_{V})$，保留的集合含外边界 $\partial V$；(3) 在保留集合的每个补充分支里减去其条件调和值，用零边界余项重复；(4) 所有递归代的保留簇全部留下，而第一步暴露的那个 $\mathrm{CLE}_{4}$ 集本身不留。

这里有两个我当时判断错的点。其一：$\alpha+\beta\ge 2\lambda$ 这个门槛在第二步必须成立，而 $2\lambda+(2a-2\lambda)=2a\ge 2\lambda$ 正好等价于 $a\ge\lambda$，我在草稿里把第二步的两个标签写成 $\pm a$ 形式，结果丢掉了 $a$ 与 $\lambda$ 的大小关系，程序在 $a\to\lambda$ 端点失去定义。其二：硬连接侧的首簇是 $C_{\partial}=A_{-a,a}(h)$，之后在它的每个补充分支对零边界余项跑同一个 $\mathcal{F}_{a}$，把结果连同 $C_{\partial}$ 一起记为 $\mathcal{C}^{\mathrm{w}}$；自由侧记 $\mathcal{C}^{\mathrm{f}}=\mathcal{F}_{a}(h,D)$；两个构造用同一个 $h$，且用它的典范局部集选择，这就是联合耦合的定义（`02-model.tex:237`--`02-model.tex:252`）。我一开始想分两个场来分别处理两条电流，那样每个对象都简单，但联合极限就成了空话：定理最后那句「同一个高斯自由场决定两个连续集合」必须靠这一处的同场构造才有内容（`02-model.tex:370`--`02-model.tex:371`）。素材还把「所有代的局部有限性」从定义里挪出来、说它由后面的推论证明（`02-model.tex:250`--`02-model.tex:252`）：我认为这是这篇的结构选择，任何把局部有限当假设写进定义的做法都会被审稿人当成循环。

若程序是从原场的一个进入的平坦值 $b$ 之上启动，$\mathrm{CLE}$ 分支的绝对标签是 $b+\xi 2\lambda$，保留的分裂绝对标签是 $b$ 与 $b+\xi 2a$；相对该进入值有非零跳的洞叫奇洞（`02-model.tex:229`--`02-model.tex:233`）。这个「奇」字在格上探索中的用法与后面要证的跳分解一致，所以我把它当成一个被两侧同时定义的概念，并非一处记号滥用。

拓扑侧我按素材的构造重述一遍，因为这是我能想到的最不显眼却最容易被略掉的一环。取紧方格 $X\supset\overline{D}$ 及所有足够细的多边形逼近，$\mathscr{H}=\mathcal{K}(X)$ 是 $X$ 的非空紧子集空间配豪斯多夫度量 $d_{H}$，$Z=\{\{x\}:x\in X\}$ 是单点子空间；$\mathcal{K}\subset\mathscr{H}$ 若在正直径以上局部有限，即对每个 $\varepsilon>0$ 有 $\#\{C\in\mathcal{K}:\operatorname{diam}(C)>\varepsilon\}<\infty$，就令

\[
 F(\mathcal{K})=Z\cup\{C\in\mathcal{K}:\operatorname{diam}(C)>0\},\qquad d_{\mathrm{match}}(\mathcal{K},\mathcal{K}')=d_{H}^{\mathscr{H}}\bigl(F(\mathcal{K}),F(\mathcal{K}')\bigr),
\]

局部有限性使 $F(\mathcal{K})$ 闭：一列互异成员的若收敛，其直径必趋零，极限是单点；于是忽略单点成员与重数之后 $d_{\mathrm{match}}$ 是度量（`02-model.tex:278`--`02-model.tex:299`）。跟通常描述的关系由两个要求 $R_{\varepsilon}$ 给出：每个 $\operatorname{diam}(C)>\varepsilon$ 的 $C\in\mathcal{K}$ 在 $\mathcal{K}'$ 中有 $d_{H}(C,C')<\varepsilon$ 的匹配，反之亦然；匹配可以不分叉（`02-model.tex:301`--`02-model.tex:309`）。被指定的边界分支另按普通豪斯多夫拓扑保留（`02-model.tex:310`--`02-model.tex:311`）。度量与 $R_{\varepsilon}$ 的夹逼、以及一致尾界给出紧包含，这两件事写成引理：$\{d_{\mathrm{match}}\le\varepsilon/2\}\subset R_{\varepsilon}\subset\{d_{\mathrm{match}}\le\varepsilon\}$，且对 $t_{j}\downarrow0$ 与有限 $M_{j}$，$\{F:N_{t_{j}}(F)\le M_{j},\ \forall j\}$ 是紧的且去掉单点后局部有限；证明的关键是把 $N_{t}$ 证成下半连续，再用并集界（`02-model.tex:313`--`02-model.tex:353`）。我卡过的地方是 $\frac{1}{2}\operatorname{diam}(C)\le\operatorname{dist}_{\mathscr{H}}(C,Z)\le\operatorname{diam}(C)$ 这双边的方向：下界靠三角不等式、上界靠取 $C$ 内的单点，两处一起用才让「直径大的成员不能被单点近似」变成可量化的事（`02-model.tex:333`--`02-model.tex:336`）。

主定理（`02-model.tex:355`--`02-model.tex:372`）：对每个固定的 $J>0$、$U\le J$ 满足 $\sinh(2J)=e^{-2U}$，每个有界约当区域 $D$、每个容许多边形逼近，

\[
 \bigl(H_{\delta},\mathcal{C}_{\delta}^{\mathrm{w}},\mathcal{C}_{\delta}^{\mathrm{f}},C_{\partial,\delta}\bigr)\ \xrightarrow[\delta\downarrow0]{\mathrm{law}}\ \left(\frac{h}{\pi\sqrt{g}},\mathcal{C}^{\mathrm{w}},\mathcal{C}^{\mathrm{f}},A_{-a,a}(h)\right),
\]

高度在 $H^{s}_{\mathrm{loc}}(D)$（每个 $s<-1$）收敛，两簇集合按上述匹配拓扑收敛，边界分支按豪斯多夫收敛；连续集合在每个正直径以上局部有限；所有收敛是联合的，同一个 $h$ 决定两个连续集合。定理之外素材还写清了什么不含在内：簇面积测度、磁化场、全部自旋畴壁曲线、精确度量指数（`02-model.tex:379`--`02-model.tex:381`）。

## §4 辅助表示 $W$、精确切割律与我必须先放弃的东西

进入空间估计前，我把这一节的记账规则先定下来，因为它决定后面每一个条件概率能不能写。固定两条电流中的一条叫 $N$，$W$ 是它在另一张格上的精确边补：$W$ 边开当且仅当穿越它的 $N$ 边闭（`03-spatial.tex:10`--`03-spatial.tex:13`）。$s$ 是 $W$ 格上的自旋、$d$ 是 $N$ 格上的自旋，$W$ 在 $s$ 下单色、$N$ 在 $d$ 下单色；$W$ 一般不同于联合样本里的另一条电流，歧义边上 $W$ 的开概率是 $t$（`03-spatial.tex:14`--`03-spatial.tex:17`）。平坦腔指被一条开的单色 $W$ 周长切下、且该周长上的高度已固定的分支；边界行走允许重复顶点，在 pinch 处未搜索侧的两个入面保持分离，除非它们在那里真的相连；等价做法是往腔内平移一个格单位的内切边界多边形，这只改变 $O(\delta)$ 的欧氏距离、绝不跨 pinch 合并两个腔（`03-spatial.tex:19`--`03-spatial.tex:25`）。这三句话我一开始嫌啰嗦，后来在领圈引理里发现它们非写不可：pinch 处若把两侧的面认成同一个，边界连通性就被凭空加强，长通道估计的方向会反。

条件信息被分成三类，我必须记住哪一类能进停止数据（`03-spatial.tex:27`--`03-spatial.tex:39`）：(i) 精确切割历史，可含所选电流 $N$、它的颜色、已完成 $W$ 周长已揭示侧的高度；(ii) 腔内的比较或环域搜索，只揭示 $(s,W)$，且只在其端点自旋之后揭示边；(iii) 辅助的匹配填充，为几何回路测试改变切割的被移除侧，只通过它的可达边缘使用，算不得原律的额外条件。最要命的是最后那句：另一条电流的边装饰已被求和掉，它不是切割上或其未搜索侧的停止数据的一部分，在一个开 $W$ 边上条件化它可以把横向自旋之间的相互作用恢复出来。

这条恢复正是我第一版切割论证的漏洞。把 $(s,W,d)$ 的联合权写成每条互双边的因子乘积：

\[
 \begin{cases}
 t\,\mathbf{1}_{\{s_{i}=s_{j}\}}, & W \text{ 开},\\
 \bigl(t\,\mathbf{1}_{\{s_{i}\neq s_{j}\}}+(1-t)\,\mathbf{1}_{\{s_{i}=s_{j}\}}\bigr)\mathbf{1}_{\{d_{i}=d_{j}\}}, & W \text{ 闭},
 \end{cases}
\]

每条指标的下标指各自格上的端点（`03-spatial.tex:54`--`03-spatial.tex:62`，编号式 `eq:spatial-edge-weight`）。检验只有三行：$s$ 不一致则穿越 $N$ 边被迫开且其 $d$ 自旋一致；$s$ 一致且 $W$ 闭则权为 $1-t$ 且同样要求一致；$W$ 开则对另一条电流的可能状态求和后无论横向自旋一致与否权都是 $t$（`03-spatial.tex:87`--`03-spatial.tex:93`）。于是对 $d$ 的依赖恰好是 $N$ 边上的一堆相等约束，这是「条件在 $(s,W)$ 下自由 $N$ 分支各自拿一个独立公平的 $d$ 号」的来源；指定一个硬连接分支的符号会移掉该分支的常数因子 $2$，与几何无关（`03-spatial.tex:64`--`03-spatial.tex:67`、`03-spatial.tex:94`--`03-spatial.tex:96`）。开的单色 $W$ 切割固定周长上的常高、且不带横向自旋交互，因此在切割与另一侧精确历史之下不同未搜索腔有独立的平坦律、带自由 $N$ 颜色（`03-spatial.tex:68`--`03-spatial.tex:72`、`03-spatial.tex:97`--`03-spatial.tex:103`）。跳恒等式是

\[
 K(v')-K(v)=\varepsilon_{W}\,d(f)\bigl(s(v)-s(v')\bigr),
\]

$\varepsilon_{W}=1$（$s$ 格为原始）或 $-1$（$s$ 格为对偶）（`03-spatial.tex:105`--`03-spatial.tex:111`，编号式 `eq:spatial-height-jump`）。它给出嵌套词汇：指定洞所对的边属于同一个入射 $W$ 分支，其外边也属于一个，所以跨过那个 $N$ 分支要么得零、要么得 $2$ 乘其 $d$ 颜色再乘固定的外 $s$ 号；所有奇洞给出同一个相对跳（`03-spatial.tex:112`--`03-spatial.tex:116`）。停止版本的处理是我花时间最多的地方：只在内切的一个完成 $W$ 边之外不查任何变量；查询 $(s,W)$ 时先露端点；对每个可能的有限历史，其事件就是该确定性搜索所查询值的柱集；即使「下一个查哪个已完成分支」的规则用过它已揭示的 $d$ 颜色，残腔内的乘积因子仍是那些，所以成立的是条件残核本身、而不只是它们的平均（`03-spatial.tex:118`--`03-spatial.tex:127`）。

几何部分我记下这个论证的形状：连通外接种子探索所遇到的分支整支揭示后，$S$ 到未搜索顶点的所有边都是 $N$--闭；未搜索顶点的一个几何分支 $C$ 的补经 $S$ 连通，其余每个未搜索分支都附在 $S$ 上，故 $C$ 的边边界是一个平面键、其对偶是一条开的 $W$ 周长，在 pinch 处按内切方式解析（`03-spatial.tex:128`--`03-spatial.tex:138`）。种子可以访问过若干高度层而仍不给残腔带来变化的边界值：该周长边上两端 $s$ 相等，跳恒等式给出零增量，故整条连通周长一个常高，历史只用已揭示分支及其颜色就确定它（`03-spatial.tex:139`--`03-spatial.tex:146`）。硬连接电流的入射对面高度差一个角点增量，移掉边界分支后内部不再有分支接到原边界（`03-spatial.tex:146`--`03-spatial.tex:150`）。同一个论证还允许一次探索交错处理若干残腔：新种子顶点必须经已访问顶点或已知种子边接到公共暴露区、中间不含未搜索的自由顶点，于是并集仍连通、未搜索分支仍保持平坦核的乘积；素材举的例子是固定全局列扫描可以先在一个腔里访问所有早前列再进下一列（`03-spatial.tex:153`--`03-spatial.tex:161`）。

比较的偏序取逐点序

\[
 (s,\,W^{+},\,-W^{-}),
\]

$W^{+}$、$W^{-}$ 是两种自旋色的开边集，顶点自旋按 $-1<+1$；边 prescription 只在端点自旋都定下之后才给；下边界条件里保留的加号连线在上边界条件里必须仍连通，减号连线相反，满足这条的边界条件叫有序（`03-spatial.tex:163`--`03-spatial.tex:174`，编号式 `eq:spatial-order`）。在此序下有限 $(s,W)$ 律正关联，固定端点已定的顶点自旋与相容边状态所得的每个条件律也正关联；增加顶点或相容边的指定、或按有序规则改变保留连通性，都使残律增大；两色对调有同样结论（`03-spatial.tex:176`--`03-spatial.tex:185`，编号式 `eq:spatial-wire-density` 是它的连线密度形式）。我把「边只在端点之后揭示」当成硬规矩，因为它同时保证单调性可用、保证停止数据合法：先给边再给自旋会让增加指定不再单调，整条比较链就断。

## §5 缓冲回路、领圈、计数尾与无遮蔽

这一节的四组估计我按「谁被谁消费」来记，不按出现顺序记。

缓冲回路与附墙界（`03-spatial.tex:370`--`03-spatial.tex:392`，命题 `prop:circuits`）：固定正纵横比与缓冲比，存在 $p>0$ 与固定格截断 $c_{*}>0$，使对每个物理测试半径 $r\ge c_{*}\delta$ 与每个网度一致地成立：不含钉点的缓冲区内，固定纵横比环域中出现指定 $W$ 色回路的概率至少 $p$，对缓冲区外任意容许 $(s,W)$ 数据取条件；缓冲区内同色的相容钉点只会改善界；重叠回路测试的有限链给出固定纵横比管状连通的正下界。任意的 $(s,W)$ 停止探索之后，$m$ 个互相分离的可用尺度上匹配回路全部失败的概率至多 $(1-p)^{m}$，每个尺度都在其内部被检查之前由当前历史选出（`03-spatial.tex:384`--`03-spatial.tex:387`）。这后半句里「先选尺度再看内部」是我一开始漏掉的：若尺度由内部数据决定，条件独立性不再站得住，$(1-p)^{m}$ 就只是看起来像几何界。

领圈排除（`03-spatial.tex:498`--`03-spatial.tex:530`，引理 `lem:collar`）：给定有限一族窗口与穿越测试，$F_{\delta}$ 是色为 $\sigma$ 的指定匹配单元区、在每个测试中锚定；允许三类条件律，一个真实平坦腔；一个至多面对 $k$ 个连通指定源的选定可达分支，其完成前沿色均为 $\sigma$；带公共填充的乘积类。第二种情形里 $k$ 固定，且任何划分改变必须满足连线密度式的前提；测试缓冲区内不含别的钉点，而单个源的局部块数不受约束。取全对偶图中的路径（不管其边是否为 $N$--开），$\mathcal{X}_{\delta}(\eta)$ 表示这样的路径完成某个指定穿越、落在 $F_{\delta}^{\eta}=\{z:\operatorname{dist}(z,F)\le\eta\}$ 内，并且与 $F_{\delta}$ 及所有附在 $F_{\delta}$ 上的增广匹配回路不交，则

\[
 \lim_{\eta\downarrow 0}\ \limsup_{\delta\downarrow 0}\ \sup \mathbb{P}\bigl[\mathcal{X}_{\delta}(\eta)\bigr]=0
\]

对所述墙与正概率容许历史一致成立（`03-spatial.tex:510`--`03-spatial.tex:520`，编号式 `eq:spatial-collar-limit`）。同一估计还同时适用于被限制在「由真实反色 $W$ 回路所围闭盘」内、且该盘与 $F_{\delta}$ 不交的路径；窗口与缓冲都可全取在开的环带内（`03-spatial.tex:525`--`03-spatial.tex:529`）。策略段交代了这条证明的形状：领圈论证通过把桥失败在有序穿越之间的间隙上求和，来控制粗糙已探索边界附近的长通道（`02-model.tex:418`--`02-model.tex:420`），也就是说这不是「距离小所以概率小」的直观，是一次真正的桥接计数。

计数与传输（`03-spatial.tex:765`--`03-spatial.tex:790`，命题 `prop:cluster-counts`）：在固定缓冲盒中、对网度与容许条件历史一致地成立三件事。(1) 固定 $b>0$，在固定盒内具有直径至少 $b$ 的连通通道的未搜索自由 $N$ 分支数有指数尾，常数只依赖 $b$ 与固定盒几何，不依赖周围墙的粗糙度，也不依赖公共填充下实现的腔数。(2) 单个腔内，若矩形及其连接缓冲区整体在未被指定的可达内部，用证明里定义的「带分离侧口的对偶限制」，在指定两侧之间穿越的限制 $N$ 图分支数有几何尾；由此若 $Q_{0}\Subset Q_{1}$，$Q_{1}$ 中同时接触 $Q_{0}$ 与「限制外一条边之入面」的限制分支数有几何尾，条件是 $Q_{1}\setminus Q_{0}$ 里那有限个固定覆盖矩形及每个连接缓冲都有同样的未指定内部间隙；更大的缓冲区外允许任意容许 $(s,W)$ 指定；同样的内部结论在移除边界分支之前的原始硬连接律里成立。(3) 跨腔的联合分支计数需要带公共填充的乘积类（`03-spatial.tex:768`--`03-spatial.tex:770`）。素材在证明末尾还强调，跨腔唯一需要的事实是不同腔不共享分支（`03-spatial.tex:1006`--`03-spatial.tex:1007`）。

封装计数（`03-spatial.tex:1010`--`03-spatial.tex:1030`，推论 `cor:global-cluster-counts`）：固定有界盒 $L$ 与 $b>0$，域与所考虑的支集都在 $L$ 内、$L$ 放在固定的更大规则环境盒里；对一个自由平坦 $N$ 律，或在初始精确切割数据下带公共填充的残积律，令

\[
 \mathcal{N}_{\delta}(b)=\#\{\text{自由 }N\text{ 分支 }C:\operatorname{diam} C\ge b\},
\]

则存在依赖 $L,b,t$ 而不依赖初始墙与网度的 $C,c>0$ 使

\[
 \mathbb{P}\bigl[\mathcal{N}_{\delta}(b)\ge n \mid \text{初始切割数据}\bigr]\ \le\ C e^{-cn}
\]

（编号式 `eq:spatial-global-count-tail`，`03-spatial.tex:1017`--`03-spatial.tex:1026`）。未条件的自由对偶电流也在内；原始硬连接电流先露其边界分支，其自由后代条件地满足该估计，加上那条被指定的边界分支至多使计数加 $1$（`03-spatial.tex:1027`--`03-spatial.tex:1030`）。这一条与 §3 的紧包含引理是配对的：$N_{t}$ 的一致尾界正是从这里来。

腔侧周长的距离（`03-spatial.tex:1090`--`03-spatial.tex:1116`，引理 `lem:chamber-rim-distance`）：$U_{\delta}$ 是精确切割探索的一个解析后残腔，$S_{\delta}$ 是含初始边界与种子（按需）的已揭示支集，$\Gamma_{\delta}$ 是该腔自己的腔侧 $W$ 周长，则对腔内任意子集 $C_{\delta}$，

\[
 \sup_{x\in C_{\delta}}\operatorname{dist}(x,\Gamma_{\delta})\ \le\ \sup_{x\in C_{\delta}}\operatorname{dist}(x,S_{\delta})+O(\delta),
\]

特别地若 $C_{\delta}\to C_{*}$、$S_{\delta}\to S_{*}$（豪斯多夫）且 $C_{*}\subset S_{*}$，左边趋零（编号式 `eq:spatial-own-rim-distance`）。证明是取到最近支撑点的线段、看它离开解析腔的第一个出口，那个出口就贴在自己的内切周长上；关键在即使最近支撑点属于附近另一块 pinch 过的硬连接层，也必须用「自己的」周长（`03-spatial.tex:1105`--`03-spatial.tex:1115`）。

冻结指标下的无遮蔽（`03-spatial.tex:1118`--`03-spatial.tex:1140`，推论 `cor:indexed-no-shadowing`）：固定缓冲盒 $Q$ 与 $b>0$，在外接种子探索的停止 $\tau$ 处冻结连通单元区 $F_{\tau}$（含初始墙、所有访问过的种子顶点、所有已揭示分支），令 $\Xi_{\delta}(\tau;b,\eta)$ 表示「某个未搜索 $N$ 分支有一条连通通道 $\gamma\subset Q$、$\operatorname{diam}\gamma\ge b$、$\gamma\subset F_{\tau}^{\eta}$」，则对带可达残积类的容许精确切割或 $(s,W)$ 停止历史 $\mathcal{H}_{\tau}$，

\[
 \mathbb{P}\bigl[\Xi_{\delta}(\tau;b,\eta)\mid\mathcal{H}_{\tau}\bigr]\ \le\ \omega_{Q,b}(\eta,\delta),\qquad \lim_{\eta\downarrow 0}\ \limsup_{\delta\downarrow 0}\ \omega_{Q,b}(\eta,\delta)=0,
\]

对正概率历史一致（编号式 `eq:spatial-frozen-shadow`）。「冻结」是我必须显式写的一个动作：若边界集在测试之后还在长大，$\eta$ 就不是一个可以和 $F$ 分离的量，二重极限的次序会失效。识别一节里那条「排除未搜索到的重复前驱」正是消费这个带指标的形态（`02-model.tex:479`--`02-model.tex:480`）。

## §6 完整模式比较、缓冲分离见证与全自旋毗邻

模式比较（`03-spatial.tex:1196`--`03-spatial.tex:1224`，命题 `prop:pattern-comparison`）处理的是：在一个小区域里把每个 $s$ 自旋与每条 $W$ 边都指定下来之后的概率，与平面概率比。完整模式指有限点边集上所有 $s$ 自旋与所有 $W$ 边状态，每条被指定的边包含其端点（`03-spatial.tex:1196`--`03-spatial.tex:1198`）。给定规则紧集 $Q_{i}$ 与填满的缓冲邻域 $B_{i}$（$1\le i\le m$，两两不交，$Q_{i}$ 与 $\partial B_{i}$ 有固定正间隙），$B_{i}$ 内除被测试模式外无指定，外部数据任意容许且含其保留连通性，则存在 $C$ 使

\[
 C^{-m}\prod_{i=1}^{m}\pi_{i}(p_{i})\ \le\ \mu\bigl[p_{i}\ \text{在每个 }Q_{i}\bigr]\ \le\ C^{m}\prod_{i=1}^{m}\pi_{i}(p_{i}),
\]

$\mu$ 是任一这样的条件平坦律、$\pi_{i}$ 是 $Q_{i}$ 内的平面模式律；$C$ 只依赖固定缓冲几何与 $t$，不依赖模式本身、也不依赖其微观指定的条数；奇偶保持的格平移与反射下的副本同样成立（编号式 `eq:spatial-product-patterns`）。特别地单盒模式律的 Radon--Nikodym 密度比一致有界，且在别的盒子里对任意一族分离模式取条件后仍局部成立（`03-spatial.tex:1220`--`03-spatial.tex:1223`）。

证明里那个「四批」的结构我觉得是这一节最值钱的记账法：先给 $Q$ 内加号顶点、再给减号顶点、再给递增的相容边指定、最后给递减的相容边指定；前两批给完每条边的端点都已定，不一致的边已经确定为闭，单色边上剩下两批分别等价于「开加或闭减」与「闭加或开减」，每批在比较律的某个序下单调，批数是 $4$、与模式大小无关（`03-spatial.tex:1227`--`03-spatial.tex:1236`）。若把一批切成随模式大小增长的多批，$C^{m}$ 就会变成随微观指定数增长的常数，正比式 `eq:spatial-product-patterns` 立刻失去内容。第二个技巧是在 $Q$ 与 $\partial B$ 之间固定两个环形缓冲、并在较远的那个上放一个加号回路（`03-spatial.tex:1238`--`03-spatial.tex:1240`）：回路把外部历史的影响隔成条件律的可达边缘，这就是界与微观指定数无关的物理原因。

缓冲分离见证（`03-spatial.tex:1314`--`03-spatial.tex:1330`，引理 `lem:buffered-witnesses`）：给定 marks 上的符号向量，若它在完整 $N$ 图中不会把异号的两 mark 连起来就叫与外部构型相容。固定 $p>0$ 与整数 $k$；在 $Q'$ 内条件于至多 $k$ 个端口的任意完整模式，若指定端口赋值在一个含 $B$ 的 $W$--平坦域里的相容概率至少 $p$，则存在 $c=c(p,k,Q,Q',B,t)>0$，使对每个足够小的网度，以至少 $c$ 的条件概率，每个异号 mark 对都被 $B$ 内一条真实的开单色 $W$ 回路分开；于是相容性被见证，而不使用 $B$ 之外的构型；估计对微观模式与外围域一致。它允许固定更大缓冲区之外的容许 $(s,W)$ 外部数据，且这一句里不条件任何横向 $d$ 颜色。

全自旋毗邻（`03-spatial.tex:1610`--`03-spatial.tex:1631`，命题 `prop:full-contiguity`）：取紧嵌套规则盒 $Q\Subset B$ 在 $W$--平坦域内部、缓冲比固定，于是互补的 $N$ 分支是自由的；$\mu_{\delta}$ 是其律、$\pi_{\delta}$ 是平面律，都限制到 $Q$ 内的完整自旋对。域与允许的外部 $(s,W)$ 数据可依赖 $\delta$，但墙与指定留在 $B$ 外。存在一致的毗邻模：对每个 $\varepsilon>0$ 存在 $\zeta>0$，使对每个足够小的网度与每个由 $Q$ 内完整自旋对决定的事件 $E$，

\[
 \pi_{\delta}(E)<\zeta\ \Longrightarrow\ \mu_{\delta}(E)<\varepsilon
\]

（编号式 `eq:spatial-contiguity`）。被测数据若包含 $Q$ 内的 $W$ 结论仍成立，所以对依赖网度的测试也成立；两种平坦奇偶都能用（把 $W$ 分配到承担该平坦墙的那个奇偶）；这一句不含移除之前的固定色硬连接 $N$ 分支。

证明的骨架是端口尾界 $2^{-M}$ 与见证引理的合成：取 $Q\Subset Q'\Subset B'\Subset B$ 留出见证引理的缓冲，$P$ 是 $Q'$ 内的完整 $(s,W)$ 模式、$T(P)$ 是其端口数，由计数命题对域律与平面律一致地有

\[
 \mathbb{P}\bigl[T(P)>M\bigr]\ \le\ C e^{-cM}
\]

（编号式 `eq:spatial-terminal-tail`）；选 $M$ 使右边小于 $\varepsilon/4$（对域律），在 $T(P)\le M$ 上写 $b$ 为端口符号赋值、$v_{\mu}(b\mid P)$ 为其条件外部相容概率，则由有限切割律，真实的端口色概率 $q_{\mu}(b\mid P)$ 满足一个带 $2^{-M}$ 的代价不等式（编号式 `eq:spatial-color-cost`，`03-spatial.tex:1644`--`03-spatial.tex:1650`）。所有宽度与那有限个网度阈值都在取网度极限之前选定（`03-spatial.tex:1606`--`03-spatial.tex:1607`）。

这条单向毗邻是我在整个谱与高斯化之间的传送带：它把「平面概率趋于零」搬到「在允许的平坦律下一致趋于零」，用来传输屏蔽（`02-model.tex:424`--`02-model.tex:428`）。当时我想把它加强成双向等价，觉得对称更好用，结果 $2^{-M}$ 那个端口色代价在两个方向上不对称，双向版本要求对 $d$ 颜色取条件，而 `03-spatial.tex:1327`--`03-spatial.tex:1329` 明确禁止；单向形态把这件事变成纯增益：够用了。模式比较与毗邻各自都不能单独传输屏蔽，前者只给密度比，后者只给零概率的传递，两者合起来才让「在小的完整指定下比较平面与条件律」成为可执行的论证。

## §7 谱侧：四个正反射框架、Cauchy 混合与角亏损的成对消去

这一节的目标写得非常克制（`04-spectral.tex:4`--`04-spectral.tex:8`）：不假设标度极限的正态性也不假设旋转不变性，把每个子列平面协方差识别出来。正面转移的方法来自三角格那篇的第 5 节，但它那里的六重旋转消去在这里不可用；替代物是两块方格反射框架、夹角 $\pi/4$。我读到这里时先问的就是「为什么 $\pi/4$ 就够」，答案在角函数上：第四角谐波 $\cos(4\arg)$ 在两个相差 $45^{\circ}$ 的框架里逐点反号。

先把临时约定与可引用的输入钉住。取欧氏单位使角点格为 $\mathbb{Z}^{2}$（原嵌入的固定旋转加伸缩），§2 的局部 plaquette 计算把这个格的高度权与六顶点权 $(1,1,c)$ 认出来。由平坦穷竭得到的自旋与装饰律是 DKLM 其定理 17.1 的测度；其引理 18.7(iii) 把高度梯度边缘认成斜率为零的六顶点平面测度；由其定理 2.2，该边缘在角点格平移下静止、在格反射下不变（`04-spectral.tex:13`--`04-spectral.tex:18`）。下面用的几何高度反射把 $K$ 送到它与空间反射的复合、差一个加性常数；在箭头变量里这等价于空间反射加全局箭头反向，也直接保持有限 plaquette 权。这些陈述对每个 $1\le c\le2$ 成立，注意这里已经悄悄扩了区间：收敛定理只覆盖 $c\ge\sqrt{3}$，而静止性、反射不变性这类结构性事实覆盖整段。若观察的是残数，并非增量，两个自旋符号要同时做一致的选择；特别的，奇数角点平移 $T$ 交换两种奇偶并带规范 $(\tau',\tau^{\dagger\prime})=(\tau^{\dagger}\circ T,\,-\tau\circ T)$，其高度为 $K'(x)=K(Tx)-K(T0)$（`04-spectral.tex:23`--`04-spectral.tex:29`）。

中性测试的写法是这一节能做事的前提：对积分为零的光滑紧支撑 $f$，在每个角点格方块上用双线性节点插值定义 $K_{\delta}(f)$；该插值与四条行反射及格平移都可交换（`04-spectral.tex:30`--`04-spectral.tex:33`）。记其有限系数阵为 $b_{\delta,x}$，和恰为零。$2m$ 阶矩要在公共支撑外取 $2m$ 个两两不交的固定圆盘上的单位质量光滑参考密度，$r_{\delta,j,y}\ge0$ 归一化 $\sum_{y}r_{\delta,j,y}=1$；对每个出现位置 $j$ 有精确的有限和恒等式

\[
 K_{\delta}(f)=\sum_{x,y}b_{\delta,x}\,r_{\delta,j,y}\,\bigl(K(x)-K(y)\bigr),
\]

并且矩的每个因子用不同的参考指标 $j$（`04-spectral.tex:38`--`04-spectral.tex:44`）。这后一句是我原先会省掉的：共用一个参考变量会让正则性估计的「分别求和」形态失效。有了它，DKLM 的正则性定理（其定理 4.5）适用于带分别求和参考变量的增量相关，其碰撞奇点是若干对数的乘积、局部可积，完全重合的格胞至多贡献一个格面积乘 $1+\lvert\log\delta\rvert$ 的固定幂，积分得

\[
 \sup_{0<\delta<\delta_{0}}\mathbb{E}\bigl\lvert K_{\delta}(f)\bigr\rvert^{2m}<\infty,\qquad m\in\mathbb{N}
\]

（编号式 `eq:plane-neutral-moments`，`04-spectral.tex:50`--`04-spectral.tex:54`）；界对有公共紧支撑的有界光滑测试族一致，并且估计在整个 $1\le c\le2$ 上成立、而不限于那篇收敛定理的区间（`04-spectral.tex:55`--`04-spectral.tex:57`）。

四个框架（`04-spectral.tex:63`--`04-spectral.tex:70`，引理 `lem:positive-transfer`）：平面律在方向 $0,\pi/4,\pi/2,3\pi/4$ 的每一条角点格点行上都反射正定；在其反射 Hilbert 空间里，沿内法向平移两个连续行距是一个正的自伴压缩；对高度增量律，沿切向平移一个行周期是与它交换的酉算子。

混合表示的推导我把每一环都对了一遍，因为这里最容易「看起来对」：行增量 $F=K(\ell u)-K(0)$ 属于反射 Hilbert 空间；对那个交换的切向酉与正的法向压缩用联合谱定理，得对 $j\ge0$

\[
 \mathbb{E}\bigl[F\,V_{n\ell u+jdv}\,F\bigr]=\int e^{in\ell k}\lambda^{j}\,\gamma(\dd k,\dd\lambda),\qquad 0\le\lambda\le1,
\]

反射给出把 $j$ 换成 $\lvert j\rvert$ 的同一表达式；令 $\lambda=e^{-ds}$（$\lambda=0$ 时 $s=\infty$），这些恰是 $Q_{s}$ 的垂直傅里叶系数；有限测度傅里叶系数的唯一性把通常的增量测度认成该混合，而它等于 $\lvert e^{i\ell k}-1\rvert^{2}C'$，对 $k\neq0$ 相除即得

\[
 C'(\dd k,\dd l)=\int_{[0,\infty]}Q_{s}(\dd l)\,\nu(\dd k,\dd s)
\]

（编号式 `eq:cauchy-mixture`，`04-spectral.tex:205`--`04-spectral.tex:219`、`04-spectral.tex:190`--`04-spectral.tex:203`）。混合测度 $\nu$ 在离开零的水平带上有限，并满足加权界

\[
 \int_{0<\lvert k\rvert<\kappa}\lvert k\rvert\,\nu(\dd k,\dd s)<\infty
\]

（编号式 `eq:weighted-mixture`）：由于每个 $Q_{s}$ 质量为一，该积分就是同一带上 $\int\lvert k\rvert C'(\,\mathrm d k,\,\mathrm d l)$，在物理原点附近由环形界有限（`04-spectral.tex:220`--`04-spectral.tex:224`）。$Q_{s}$ 是周期化的 Cauchy 核 $\frac{s\,\,\mathrm d l}{\pi(s^{2}+(l+jP)^{2})}$，$-P/2\le l<P/2$，端点 $Q_{0}=\delta_{0}$、$Q_{\infty}$ 是圆上均匀测度（`04-spectral.tex:186`--`04-spectral.tex:189`）。这里 $Q_{\infty}$ 那一项我不能省：$\lambda=0$ 在谱侧是合法的，它对应法向压缩有严格谱间隙的情形。

角亏损的定义与逐点消去：

\[
 \chi(k,l)=\cos\bigl(4\arg(k+il)\bigr)=1-\frac{8k^{2}l^{2}}{(k^{2}+l^{2})^{2}},\qquad D(k,s)=\left(\frac{\lvert k\rvert-s}{\lvert k\rvert+s}\right)^{2},\qquad D(k,\infty)=1,
\]

对 $s\in[0,\infty]$ 一致地有 $\int\chi(k,l)Q_{s}(\,\mathrm d l)=D(k,s)+O(\lvert k\rvert)$，$\lvert k\rvert\to0$（编号式 `eq:angular-poisson`，`04-spectral.tex:228`--`04-spectral.tex:238`）。素材给了完整的补充推导：有界解析函数 $\bigl(\frac{b+iz}{b-iz}\bigr)^{2}$ 在上半平面的边界实部是 $\chi(b,l)$，它在 $is$ 处的 Poisson 平均是 $\bigl(\frac{b-s}{b+s}\bigr)^{2}$；周期化用 $1-\chi(b,l)=\frac{8b^{2}l^{2}}{(b^{2}+l^{2})^{2}}$ 与 $\int_{\mathbb{R}}(1-\chi(b,l))\,\mathrm d l=4\pi b$，非中心 Cauchy 密度在一个周期上的和一致有界（按 $\lvert j\rvert$ 与 $s/P$ 可比分裂，近项用 $1/s$、远项用可平方尾），被略去的未展开尾是 $O(b^{2})$（`04-spectral.tex:239`--`04-spectral.tex:251`）。

弥散亏损可积（`04-spectral.tex:253`--`04-spectral.tex:296`，命题 `prop:dispersion-defect`）：在每个反射框架里

\[
 \int_{0<\lvert k\rvert<\kappa}D(k,s)\,\nu(\dd k,\dd s)<\infty,\qquad \nu\{r\le\lvert k\rvert\le 2r\}\le C_{1}\ \text{对每个 }r>0
\]

（编号式 `eq:dispersion-defect`）。证明的形状值得抄进我自己的清单：把 `eq:angular-poisson` 在 $\varepsilon<\lvert k\rvert<\kappa$ 上积分，误差由加权混合界控制、与 $\varepsilon$ 无关；把小物理盘外的 $C'$ 换回原测度只花有界的外部与混叠质量；在环形 $\varepsilon<\lvert p\rvert<\kappa$ 里被略去的端帽 $\lvert k\rvert\le\varepsilon$ 只在 $\lvert p\rvert\le C\varepsilon$ 处贡献负的第四谐波（负性蕴涵 $\lvert l/k\rvert<1+\sqrt{2}$），其负部被固定个数的环带控制，于是在角度为 $\theta$ 的框架里

\[
 \int_{\varepsilon<\lvert k\rvert<\kappa}D\,\dd\nu\ \le\ \int_{\varepsilon<\lvert p\rvert<\kappa}\cos\bigl(4(\arg p-\theta)\bigr)\,C(\dd p)+C_{2}
\]

（编号式 `eq:frame-defect-bound`）。选相同的物理内外半径给 $\theta$ 与 $\theta+\pi/4$ 两个框架，必要时把固定的外半径调小，两者的被积函数逐点互为相反数，相加就控制住两个非负亏损积分之和；单调收敛给出每个的有限性，另一对框架同理。素材在这里特意写明：没有对测度 $C$ 用过任何 $\pi/4$ 旋转（`04-spectral.tex:285`）。这正是我最初第三条路的死因，我一开始以为可以把「两框架反号」当成「旋转不变」的替身来用，实际必须是同一测度在同一对半径下逐点反号，旋转不变性一点都不能借。

子列平面 Green 协方差（`04-spectral.tex:327`--`04-spectral.tex:338`，命题 `prop:plane-green`）：每个网度序列有子列与有限正数 $\beta$，使对所有中性光滑紧支撑测试

\[
 \mathbb{E}\bigl[K_{\delta}(f)K_{\delta}(g)\bigr]\longrightarrow\beta\,\mathcal{L}(f,g),
\]

$\beta$ 的可能值有上界且离零有界；对在同一紧集内光滑收敛的测试也成立；此刻 $\beta$ 允许依赖子列。证明用了尺度化的关键一步：把物理测度按 $p\mapsto p/\delta$ 重标，环形界给出离开零的模糊子列紧性；固定 $0<b<B$，取 $\nu_{\delta}^{b,B}$ 为 $\mathbf{1}_{\{b\delta\le\lvert k\rvert\le B\delta\}}\nu$ 在 $(k,s)\mapsto(\xi,\sigma)=(k/\delta,s/\delta)$ 下的推前，水平带界一致控制其总质量，齐次性与可积性给出

\[
 \int D(\xi,\sigma)\,\nu_{\delta}^{b,B}(\dd\xi,\dd\sigma)=\int_{b\delta\le\lvert k\rvert\le B\delta}D(k,s)\,\nu(\dd k,\dd s)\longrightarrow0;
\]

在紧空间 $\{b\le\lvert\xi\rvert\le B\}\times[0,\infty]$ 上再取弱收敛子列，$D$ 在其上连续、在 $\sigma=0$ 与 $\sigma=\infty$ 等于 $1$、且恰在 $\sigma=\lvert\xi\rvert$ 处为零，故每个极限混合测度支撑在那张图上（`04-spectral.tex:340`--`04-spectral.tex:359`）。我原来的直觉是「支撑在 $s=\lvert k\rvert$ 上」只是各向同性的一种弱形式，后面才发现它其实已经把协方差的谱完全定死：在两个独立框架里都成立，就同时锁住两个方向的剩余谱权（凭据在 `02-model.tex:437`--`02-model.tex:439`）。这一处我不再往回收，因为「不需要 $\pi/4$ 对称」是这一节真正的产品。

反射零插入（`04-spectral.tex:443`--`04-spectral.tex:462`，推论 `cor:reflection-null`）是下一节的输入：$\phi\in C_{c}^{\infty}(\mathbb{R}^{2})$ 支撑在四个框架之一的某条线的一侧正距离外，对收敛到该线的点行，$X_{\delta}=K_{\delta}(\Delta\phi)$ 的反射范数趋零；结论含收敛的位置与正转移引理里的局部增补。证明是取每个子序列的协方差极限，反射范数平方趋于 $\Delta\phi$ 与其反射复制的 Green 配对乘 $\beta$，而该配对分部积分后是常数乘两个梯度之积的积分，支撑不交故为零；系数是否唯一此刻无关，正性与子列论证把「每个子列趋于零」升级成整列趋于零（`04-spectral.tex:452`--`04-spectral.tex:462`）。

## §8 屏蔽：把反射零性加强为对外部全部自旋的条件零性

反射零性是一条无条件平面恒等式，要证的是把它加强为「条件在外部所有自旋之下」的恒等式。素材把差别说得很准：条件在一个自旋及其边装饰上并不确定另一个自旋（`05-screening.tex:4`--`05-screening.tex:6`）。这正好是 §4 里那条「不得在开 $W$ 边上条件横向装饰」的反面教训，所以我在这里格外小心哪些数据进了 $\sigma$--代数。三步计划是：用正法向转移移动分离的、可以任意罕见的块模式；把能通过其缓冲区传递信息的有限多个颜色纳入；用被外围回路保护的短开连线把块接起来（`05-screening.tex:7`--`05-screening.tex:10`）。本节长度全用物理长度，每个布局含其最小间隙都在网度趋零之前固定（`05-screening.tex:12`--`05-screening.tex:13`）。中性节点离散化沿用谱节，插入写作

\[
 X_{\delta}=K_{\delta}(\Delta\phi),\qquad \phi\in C_{c}^{\infty}(B),
\]

其系数和恰为零、且是某个固定任意小扩大区域内增量的函数（`05-screening.tex:15`--`05-screening.tex:20`）。$\P_{\delta}$ 是平面律，两个自旋与装饰记作 $(s,d,W)$，$N$ 是 $W$ 的对偶补。

外部正交（`05-screening.tex:25`--`05-screening.tex:46`，命题 `prop:screened-orthogonality`）：$Q$ 是方框，$B$ 是同心圆盘、半径小于 $Q$ 边长的千分之一；$\mathscr{E}_{\delta}(Q)$ 由外面的完整自旋对、其入射角点格 plaquette 与 $Q$ 不交的那些互双边对上的 $W$ 状态（从而相应的 $N$ 状态）、以及那里可计算的全部高度增量生成，则

\[
 \bigl\lVert \mathbb{E}_{\P_{\delta}}\bigl[X_{\delta}\mid \mathscr{E}_{\delta}(Q)\bigr]\bigr\rVert_{1}\longrightarrow0
\]

（编号式 `eq:plane-exterior-orthogonality`）。同一结论在任何序列的平坦域律下成立，只要其内部紧含一个固定的更大方框 $Q^{+}$ 且 $\overline{Q}\subset Q^{+}$；对这些域一致，包括由早先精确平坦切割给出的分支律；后一种情形在该切割处的条件律上使用、任何后续数据揭示之前。加性高度常数不影响结论。这里那个「千分之一」我起初当成随手的安全系数，重读才明白它是结构性需求：$B$ 与 $Q$ 之间要留出可放置屏蔽回路与桥的间隙，而间隙数量必须与块数无关。

在分离模式下的一致界部分（`05-screening.tex:50`--`05-screening.tex:57`）：块模式指定一个有限规则块的全部 $s$ 自旋与全部 $W$ 边（每条指定边含两端点），块的填充隔离邻域两两不交，每块内留一个稍小的紧核用于观察 $d$ 颜色；块及其邻域可以有有限个预定凹口，常数可依赖该几何但绝不依赖模式中微观值的个数；$P_{i}$ 是块 $i$ 中的指定模式，$p_{i}=\P_{\delta}(P_{i})>0$。反射空间的内积写作

\[
 \langle A,B\rangle_{\Theta}=\mathbb{E}\bigl[\overline{\Theta A}\,B\bigr],\qquad \langle A,A\rangle_{\Theta}=\lVert A\rVert_{\Theta}^{2}
\]

（`05-screening.tex:160`--`05-screening.tex:164`）。归一化反射界（`05-screening.tex:166`--`05-screening.tex:194`，引理 `lem:screen-reflection-bound`）：若所有模式邻域与 $A$ 的支撑严格在反射行的正侧，且 $A$ 被 $1$ 控制、或是一个有界因子乘一个支撑带无钉缓冲的光滑中性插入，则

\[
 \biggl\lVert A\prod_{i=1}^{m}\frac{\mathbf{1}_{P_{i}}}{p_{i}}\biggr\rVert_{\Theta}\ \le\ C
\]

（编号式 `eq:screen-reflection-bound`）；有界因子可同时依赖两个自旋与边装饰；$C$ 对模式与保持所有间隙的紧放置族一致。证明是三行：取 $P=\bigcap_{i}P_{i}$、$J=\prod_{i}p_{i}$，左边平方是 $\frac{\mathbb{E}[\mathbf{1}_{P\cap\Theta P}\overline{\Theta A}A]}{J^{2}}$；反射与原始的模式邻域不交，模式比较命题把其联合概率由 $CJ^{2}$ 控制；若 $A$ 含中性插入，就用条件 Cauchy--Schwarz 加模式矩引理分别作用在插入与其反射上，于是被消掉的是分母的平方，任何单个 $p_{i}$ 的下界都不需要（`05-screening.tex:183`--`05-screening.tex:194`）。我当初在这里写的是「除以 $p_{i}$ 后概率变成 $1$」，那等于要每个 $p_{i}$ 有下界，罕见模式一出现就崩；正确的账是平方消去，这一点值得单独记。

解析平移（`05-screening.tex:203`--`05-screening.tex:215`，引理 `lem:screen-analytic-translation`）：把有限个局部因子与模式邻域按四个反射法向之一的严格投影间隙分成两组，至多一个无界因子（带无钉缓冲的光滑中性插入）；把高组按 $tn$ 平移并把期望除以 $\prod_{i}p_{i}$，在格法向步长平移处记结果为 $M_{\delta}(t)$。若只要 $t$ 落在某个非空正数开区间内、$t_{\delta}\to t$ 取格舍入就有 $M_{\delta}(t_{\delta})\to0$，则 $M_{\delta}(0)\to0$；结论沿模式、有界因子与收敛的正向分离放置的序列一致。机制是 $M_{\delta}$ 在有向带值域内的解析性与边界控制，把「开区间上为零」推到端点 $t=0$。这一步我用的是正转移的通用形态，素材明确说这里需要的任意模式界由前面的引理供给，并非那篇不同模型的钉估计（`05-screening.tex:198`--`05-screening.tex:201`）。

选臂屏蔽（`05-screening.tex:427`--`05-screening.tex:461`，引理 `lem:screen-shielding`）：固定 $q$，每次试验在给定早先全部试验数据下有两臂成功条件概率至少 $p(q)>0$；若取首次成功的那次，则没有任何试验成功的概率至多 $(1-p(q))^{M}$；被选中的洞里在尺度 $Cw$ 与 $R/10$ 之间没有外围加号 $W$ 回路的概率至多 $\eta(q)$，$\eta(q)\to0$（当 $q\downarrow0$）。这些界在对完整块模式取平均之后成立。证明里两条我认为是全节最细的地方：其一，把 $A_{j}$（递增的两臂事件）、$G_{j}$（外围加回路事件）、$\mathscr{H}_{j}$（先前试验的完整历史）写出来，剩余律中的正关联给出

\[
 \P\bigl(A_{j}\cap G_{j}^{c}\mid \mathscr{H}_{j}\bigr)\ \le\ \eta(q)\,\P\bigl(A_{j}\mid \mathscr{H}_{j}\bigr)
\]

（编号式 `eq:screen-relative-shielding`）；对不交事件集 $\{J=j\}$ 求和，其总概率至多一，于是屏蔽误差里没有出现因子 $M$。我最初的版本是逐 $j$ 相加并各带上 $(1-p)^{j-1}$，结果误差界里多出一个 $M$，而 $M$ 与间隙数有关、不能让它随块数长。其二，素材在结尾声明：之后把剩余块模式全部揭示不改变两个已平均的估计，而 `eq:screen-relative-shielding` 不在条件于每个单独完整模式之后断言（`05-screening.tex:458`--`05-screening.tex:460`）。这条限制与 §4 的三类信息分类是同一件事的两端。

桥耦合与精确分离（`05-screening.tex:463`--`05-screening.tex:500`，引理 `lem:screen-bridge-coupling`）：保留 $S_{\delta}$（块模式的整体）的原边缘律；在该模式下按固定顺序在每个间隙选首次成功试验、按确定规则选其两臂；对每对被选臂按固定规则在洞里取一条 $W$ 格路径，连接其端点且只在那些加号端点处碰到指定模式；洞几何固定，故对足够小网度这样的路径存在。成功时把条件律换成「把这些路径钉开并钉成加号」后的上律，于是新的条件律是良定义的，其桥钉是 $S_{\delta}$ 的函数；不成功的模式上条件律不变、与原律同一耦合，且不做核色观察，所得律记 $\mathbb{Q}_{\delta}$。结论是：$\P_{\delta}$ 与 $\mathbb{Q}_{\delta}$ 可以在块模式相同下耦合，除了概率至多 $4\eta(q)$，它们的插入、完整外部数据、以及屏蔽盘外核点上全部 $d$ 颜色在「四个间隙都成功」事件上一致；在该成功事件下，$\mathbb{Q}_{\delta}$ 中可选取模式可测的核路径并对其入射 $d$ 点位取条件，使插入与完整外部在给定 $Y_{\delta}=(S_{\delta},C_{\delta})$ 下条件独立。证明的做法是对相邻两个条件律使用单调耦合、从新钉住的洞向外搜索到屏蔽盘外边界停止；若没找到外围加回路就宣布该相邻耦合不成功，而两个律在此前所有桥钉上相同（`05-screening.tex:489`--`05-screening.tex:500`）。

「四个间隙」这个数字在陈述里出现时我总想问为什么是四：分隔器的画法是让两块之间在两个方向上都有可用间隙，故失败概率是 $4\eta(q)$ ，并非 $\eta(q)$；这个猜测我留在 `[推测]`，因为画图的完整说明在 `05-screening.tex:415`--`05-screening.tex:425` 的图注里，我只读到其中「虚线核段上两个入射横向自旋都被固定、每个间隙只画一条屏蔽回路与一次选定试验」这一句（`05-screening.tex:420`--`05-screening.tex:423`）。

## §9 平坦域正态化：从矩界到 Wick 递推，再到系数

高斯化这节开头把范围交代得很直（`06-gaussian.tex:4`--`06-gaussian.tex:7`）：对单位增量高度 $K_{\delta}=2H_{\delta}$ 先证确定性平坦腔的极限，再证停止探索所产生的腔的条件版本，之所以能走第二遍，靠的是对腔的一致性。本章每个腔都是「连通匹配 $W$ 周长之后的可达分支」，pinch 处按 §4 的内切解析；其开面域单连通；周长带它真实的连线，入面不在 pinch 处合并；减去它的常高。矩的论证里取 $N$ 为该墙渗流 $W$ 的互补自由电流，于是其内部分支都持公平颜色；初始平坦域靠「取 $N$ 为自由对偶电流」包含进来；两种角点奇偶都可以承担墙（`06-gaussian.tex:9`--`06-gaussian.tex:17`）。一族腔总是两两开内部不交（闭包可触），各自中心化平坦律独立采样，在这些不交单元内部上拼接、在已暴露补集上置零；$U_{\delta}$ 是其开的并，$B_{0}$ 是一个含所有腔闭包且有固定外裕量的开圆盘，

\[
 F_{\delta}=\overline{B}_{0}\setminus U_{\delta},
\]

故 $F_{\delta}$ 是公共紧环境集里的闭补，此处它的豪斯多夫收敛等价于平面中闭补的局部豪斯多夫收敛；常数可依赖 $B_{0}$、固定参数与矩阶，绝不依赖腔的形状与个数（`06-gaussian.tex:19`--`06-gaussian.tex:32`）。「形状与个数都不依赖」这条一致性正是把它从确定性推成条件性的杠杆，我先在 §5 的计数尾里确认它没有被腔数污染，然后才敢在这里用。

平坦域极限定理（`06-gaussian.tex:34`--`06-gaussian.tex:50`，定理 `thm:flat-gff`）：$U_{\delta}$ 是单个确定性平坦腔，或上述有限个内部不交的独立腔之并；若 $F_{\delta}$ 豪斯多夫收敛到 $F$，$U=B_{0}\setminus F$，则

\[
 K_{\delta}\ \Longrightarrow\ h_{U}/a\quad\text{in } H^{s}_{\mathrm{loc}}(U),\qquad s<-1,
\]

$h_{U}$ 在 $U$ 各分支上的限制是相互独立、零 Dirichlet 边界、对数奇性为 $-\log\lvert x-y\rvert$ 的高斯自由场；支撑在 $U$ 内的所有有限联合光滑测试矩都收敛；即使离散前驱是同一个腔，不同的极限分支也独立；两种墙奇偶、原子涂抹或插值涂抹给出同一极限；零延拓到 $U_{\delta}$ 之外的场在每个 $s<-1$ 上于 $H^{s}_{\mathrm{loc}}(B_{0})$ 一致紧。

「同一个前驱分裂成多个独立极限分支」这一句我起初以为是修辞，重读 §3 的约定才发现它是有牙齿的：素材在 02 里就定义了「被指点的极限分支」，并声明不同极限分支里的条件场陈述包含它们去掉常数后的联合独立（`02-model.tex:390`--`02-model.tex:396`）。也就是说，一个离散腔可能在极限中变成几个腔，而我不能因为它们同源就假设相关。这条与前驱唯一性（§6 的无遮蔽、§13 的重复前驱排除）是同一枚硬币的两面。

证明的分层写在定理之后（`06-gaussian.tex:52`--`06-gaussian.tex:57`）：先控所有矩及其边界迹；然后用屏蔽正交性使极限矩在碰撞之外调和；再用局部中性对比较识别其对数极，从而识别 Wick 递推；系数先从平面极限定出再收完定理；最后一条命题把确定性结论转成停止探索需要的条件版本。

几何输入（`06-gaussian.tex:61`--`06-gaussian.tex:72`）：对分支单连通的开集 $V$，$G_{V}$ 是各分支内奇性为 $-\log\lvert x-y\rvert$ 的 Dirichlet 核，跨分支及任一自变量在 $V$ 外时零延拓；测试上写

\[
 G_{V}(f,g)=\iint f(x)\,G_{V}(x,y)\,g(y)\,\mathrm{d}x\,\mathrm{d}y.
\]

平面的连通补判据说明上面的 $F_{\delta}$ 是连通的：球面上的开集分支单连通恰当其补连通；用的是内部不交、不是闭包不交。这句我在纸上验算过才放心，因为「独立采样 + 置零」造出来的集合是闭包可触的，若不区分这两种不交，判据就不适用。

矩界（`06-gaussian.tex:153`--`06-gaussian.tex:171`，命题 `prop:log-moments`）：先固定 $R_{0}>2\operatorname{diam}(B_{0})$；直径至多 $R_{0}/2$ 的平坦腔内角点格点 $z_{1},\ldots,z_{2m}$（可任一小节里的奇偶）满足

\[
 \biggl\lvert \mathbb{E}\prod_{i=1}^{2m}K(z_{i})\biggr\rvert\ \le\ C_{m}\sum_{\mathcal{P}}\prod_{\{i,j\}\in\mathcal{P}}\left(1+\log^{+}\frac{R_{0}}{\lvert z_{i}-z_{j}\rvert\vee\delta}\right),
\]

和取遍配对，奇矩为零（编号式 `eq:flat-log-moments`）；腔外置零的独立平坦腔族有同一界；对紧支撑有界测试 $f$ 有一致界 $\mathbb{E}\lvert K_{\delta}(f)\rvert^{2m}\le C_{m}\lVert f\rVert_{\infty}^{2m}$（编号式 `eq:flat-smearing-moments`）；对固定光滑紧支撑轮廓 $f$ 令 $f_{r,z}(x)=r^{-2}f((x-z)/r)$，当 $0<\delta\le r$ 时有相应的尺度化界（编号式 `eq:flat-scaled-moments`，见 `06-gaussian.tex:172`--`06-gaussian.tex:175`）。

紧性与「碰撞对角上没有额外测度」（`06-gaussian.tex:322`--`06-gaussian.tex:361`，引理 `lem:flat-tightness`）：中心化平坦高度对每个 $s<-1$ 在 $H^{s}_{\mathrm{loc}}$ 中一致紧；每个有限联合测试矩沿分布收敛而收敛；一旦极限矩分布在其碰撞对角之外是调和的，其对角外的光滑代表就表示整个分布，即没有额外支撑在这些对角上的测度或分布。证明的紧性一半是把 $K_{\delta}$ 截在固定方格（视作环面）里、用归一化傅里叶基 $e_{n}$，$K_{\delta}(\chi e_{n})$ 的二阶矩界与 $n$ 无关，于是对 $q>1$

\[
 \sup_{\delta}\mathbb{E}\bigl\lVert \chi K_{\delta}\bigr\rVert_{H^{-q}}^{2}\ \le\ C\sum_{n\in\mathbb{Z}^{2}}(1+\lvert n\rvert^{2})^{-q}<\infty,
\]

由 $H^{-q}\hookrightarrow H^{s}$（$1<q<-s$）的紧嵌入得紧性，再取可数穷竭截断与可求和的例外概率。对角部分那一半我认为是本节最容易被略过的论证：对第 $j$ 阶矩分布的每个变量在同一半径 $r$ 下磨光，先取网度极限（最终 $\delta\le r$），用 Hölder 与尺度化矩界把磨光核在紧集上由 $C_{j}(1+\lvert\log r\rvert)^{j/2}$ 控制（碰撞处也算）；在成对距离大于 $2r$ 之外，分离的调和性与径向磨光使其恰为未磨光的光滑核；把磨光半径取成最小成对距离的固定分数又把该核由其对数的幂控制；碰撞邻域体积为 $O(r^{2})$，故其在其中两个积分都趋零，于是磨光核局部 $L^{1}$ 收敛到跨过对角延拓的光滑核，而其分布极限就是原矩分布（`06-gaussian.tex:347`--`06-gaussian.tex:360`）。这里的次序（先 $\delta$ 后 $r$）与我一开始写的相反；反过来写的话 $r$ 需要随 $\delta$ 走，磨光与离散碰撞就分不开。

碰撞系数与 Wick 递推（`06-gaussian.tex:632`--`06-gaussian.tex:705`）：对 $j\ge2$ 与 $U$ 中互异的 $(y,\mathbf{z})$，

\[
 L_{j}(y,\mathbf{z})=\kappa\,T_{j-2}(\mathbf{z})
\]

（编号式 `eq:collision-coefficient`，命题 `prop:collision-coefficient`）。证明取两个支撑不交的光滑零质量测试 $\alpha,\beta$ 使

\[
 J=\iint\alpha(u)\beta(v)\log\frac{1}{\lvert u-v\rvert}\,\mathrm{d}u\,\mathrm{d}v\neq0,
\]

并给出显式选择：$\varrho_{b}$ 是支撑在 $(b,0)$ 半径 $1/10$ 内的光滑径向单位隆起（由同一固定隆起平移得到），取 $\alpha=\varrho_{0}-\varrho_{1}$（`06-gaussian.tex:641`--`06-gaussian.tex:650`）。这个「用一对隆起的差去试探对数核」的做法我先前试图用单个隆起，结果 $J$ 因质量非零而失去意义；零质量是必须的，否则测试不落在中性通道里、屏蔽正交性不适用。

于是对每个 $j\ge2$ 与 $U$ 中互异点

\[
 T_{j}(x_{1},\ldots,x_{j})=\kappa\sum_{i=2}^{j}G_{U}(x_{1},x_{i})\,T_{j-2}(x_{2},\ldots,\widehat{x_{i}},\ldots,x_{j})
\]

（编号式 `eq:bounded-wick-recursion`，命题 `prop:gaussian-moments`），从而 $U$ 内极限中心化场是协方差 $\kappa G_{U}$ 的高斯场，特别地在不同分支上的限制独立。证明固定 $x_{2},\ldots,x_{j}$ 并减去右边，作为 $x_{1}$ 的函数它在这些点之外调和；碰撞系数消掉其每个分量处的对数极，对数奇性引理移除剩余 puncture；其他分支上的点不产生极；所得调和函数边界迹为零（`06-gaussian.tex:708`--`06-gaussian.tex:715`）。素材注明这条论证的骨架来自三角格那篇第 9--10 节，切割与耦合估计由上面供给（`06-gaussian.tex:690`--`06-gaussian.tex:691`）。

平面侧（`06-gaussian.tex:883`--`06-gaussian.tex:923`，命题 `prop:plane-gaussian-moments`）：沿所选子列，所有平面增量相关函数对协方差 $C_{\kappa}$ 满足 Wick 规则；准确地说 $\Phi_{m,\delta}\to Q_{m}$ 在 $\mathcal{D}_{m}$ 的紧子集上每阶一致，$Q_{m}$ 对奇 $m$ 为零，偶 $m$ 时是对配对求和的 $C_{\kappa}(d_{i},d_{j})$ 之积。归纳论证里我认为最精巧的是那一步「整调和函数次线性增长必为常数」：从 $Q_{m}$ 减去

\[
 \sum_{i=2}^{m}C_{\kappa}(d_{1},d_{i})\,Q_{m-2}(d_{2},\ldots,\widehat{d_{i}},\ldots,d_{m})
\]

（编号式 `eq:plane-wick-recursion`）后，在 $x_{1}$ 变量上平面碰撞系数消掉所有 $x_{i},y_{i}$（$i\ge2$）处的对数极，调和余下项移除 puncture；正则性估计给出跨过 $x_{1}=y_{1}$ 的连续延拓且该处值为零，素材强调这是一次增量的塌缩、不是不同因子之间的额外碰撞；余下者整调和，固定其余端点时其增长被 $1+\log(2+\lvert x_{1}\rvert)$ 的固定幂控制、特别地是 $o(\lvert x_{1}\rvert)$；对半径 $M$ 的盘用内部梯度界再令 $M\to\infty$ 使梯度为零，故为常数，而在 $x_{1}=y_{1}$ 处 $Q_{m}$ 与递推项都消失，常数为零（`06-gaussian.tex:892`--`06-gaussian.tex:914`）。素材还补一句：论证起初在所有端点互异处识别核，所引的等度连续与增量塌缩估计把恒等式局部一致地延到允许一个增量两端点重合的完整构型空间，所以在同一子列上识别的是所有阶、不只协方差或光滑测试律（`06-gaussian.tex:916`--`06-gaussian.tex:922`）。这一句解释了为什么下一步可以引用「每阶紧一致收敛」这个苛刻假设。

系数不循环地定出（`06-gaussian.tex:927`--`06-gaussian.tex:959`，命题 `prop:plane-normalization`）：对上述每个子列，

\[
 \kappa=\frac{1}{2\pi\arcsin(c/2)}=\frac{1}{a^{2}}
\]

（编号式 `eq:identified-kappa`）。证明：$\kappa$ 严格正由平面 Green 协方差给出；令 $\sigma^{2}=2\pi\kappa$，刚证出的平面 Wick 核恰是「$\sigma$ 倍平面高斯自由场」在奇性为 $-(2\pi)^{-1}\log\lvert x-y\rvert$ 归一化下的核；上面用的固定旋转与伸缩不改变增量互比（编号式 `eq:increment-covariance`），而其每阶紧一致收敛正是 DKLM 其定理 8.1 的确切假设；该收敛判据（输入是正则性估计）给出满足其定义 2.7 所需意义的整平面子列标度极限，于是可应用其定理 4.3 与 4.4 的自由能对应与显式计算，得

\[
 \sigma^{2}=\frac{1}{\arcsin(c/2)}.
\]

素材注明该文使用列斜率 $I_{\mathrm{col}}/L$ 与逐点自由能，调和工作在附录里完成，附录还记下取最终极限之前的有限误差因子；三个被引输入都对 $1\le c\le2$ 适用，本处固定参数满足 $1<c\le2$，且这一使用没有调用那篇窄区间的高度收敛定理（`06-gaussian.tex:954`--`06-gaussian.tex:959`）。这就是我把它排在最后的全部理由：判据的假设是「每阶紧一致收敛」，而那只有在平面 Wick 递推证完之后才拿得到；顺序换一下就变成用自由能证高斯、又用高斯证自由能。

## §10 停止局部集：两类停止、穿越切割的条件律、地毯收敛

局部集这节换了单位（`07-local-sets.tex:4`--`07-local-sets.tex:11`）：本节离散场是 $h_{\delta}=aK_{\delta}$，其极限取 $h$ 的归一化。需要两类停止：停在固定个数的奇边缘上给出二值地毯；种子探索则整支揭示电流簇，其极限条件场用来判定哪些奇边缘属于同一分支。对两种停止都证明「切割极限的跨越测试」上的条件律，素材强调这比只在其开分支内识别场更强。

局部集、薄、边界连通这三个词的定义我必须按素材的口径记：闭集 $A$ 连同信息 $\mathscr{E}$ 是 $h$ 的局部集，当条件于 $\mathscr{E}$ 时 $h=h_{A}+h^{D\setminus A}$，$h_{A}$ 为 $\mathscr{E}$--可测且在 $A$ 外调和，$h^{D\setminus A}$ 是零延拓高斯自由场、其在 $D\setminus A$ 各分支上的限制是独立的零边界场；条件收紧到 $\sigma(A,h_{A})$ 就得到通常定义（`07-local-sets.tex:13`--`07-local-sets.tex:19`）。薄指 $h_{A}$ 就是那个调和函数的积分、$A$ 上不再有进一步的分布支撑；每个闭局部集都含区域边界，所以「下方零面积」这类陈述指的是它与开区域的交，约当边界本身不必零面积（`07-local-sets.tex:20`--`07-local-sets.tex:24`）。这条注记省掉了一个我一度以为必须证的结论：边界面积零。

识别用的唯一性（`07-local-sets.tex:26`--`07-local-sets.tex:40`）：$p,q>0$、$p+q\ge2\lambda$，边界连通的薄局部集且补充值落在 $\{-p,q\}$ 内，就必为典范 $A_{-p,q}$；「边界连通」指该闭集并上边界后连通，它提供有界型薄局部集唯一性定理里的拓扑条件；这个唯一性不假设候选已经是场的可测函数，而所得典范集是场可测的。在约当父域中用约当洞性质；在粗糙单连通父域中构造首奇地毯时，两个标签幅度是 $2a>2\lambda$，其回路避开父边界、故在内部保形映射下保持约当。典范 $A_{-2\lambda,2\lambda}$ 有 $\mathrm{CLE}_{4}$ 洞、带独立公平符号与条件独立的零边界余项。

这里有一处我起初理解反了：我以为唯一性定理要求「先知道候选是典范集、再证它等于自己」，那就会循环；实际它的前提只有边界连通、薄、有界标签三种，可测性是结论。这条区别决定了 §13 的可见划分能不能直接用典范集的几何。

两类停止的切割邻域与「穿越切割」的条件特征函数估计在 `07-local-sets.tex:44`--`07-local-sets.tex:45` 起（自由电流腔内平坦值 $b$，穿过周围电流簇下行、经过偶洞继续……），其技术核心是两条引理：可忽略的切割邻域（`07-local-sets.tex:121`，引理 `lem:negligible-neighborhoods`）与停止切割处的完整条件场（`07-local-sets.tex:284`，引理 `lem:stopped-full-field`）。策略段把它压成一句：邻域论证同时移除极限切割附近的已揭示均值贡献与中心化余项；条件特征函数识别完整零延拓高斯自由场余项，而分段常值的标签给出完整条件均值（`02-model.tex:454`--`02-model.tex:459`）。我认为这句压缩掉的正是最难的部分：要证的不是残场在洞内是零边界场（那是切割律给的），是「跨过切割的测试」也能被识别，否则 §11 的电缆测试无处安放。

地毯收敛（`07-local-sets.tex:468`--`07-local-sets.tex:528`，命题 `prop:stopped-tvs`）：硬连接边界簇与 $h_{\delta}$、其标签一起收敛到 $A_{-a,a}(h)$；在自由平坦父域中减其标签、记零边界极限余项为 $f$，首奇地毯收敛到 $A_{-2a,2a}(f)$；深度 $r$ 的全局闭地毯定义为「每条分支都遇到 $r$ 个奇边缘之后仍未搜索的那些洞的闭补」，含所有早先层，硬连接情形还含第一硬连接层；对每个固定有限 $r$，该全局地毯按普通豪斯多夫距离收敛到相应的典范嵌套地毯，其标签与重启的零边界场在极限洞内每个有限被指紧缓冲族上收敛。素材还特意补了两句限定：这些被指结论包含同源（同一离散前驱）的不同极限分支，但不把一个完整前驱地毯指派给若干分离的豪斯多夫极限（`07-local-sets.tex:480`--`07-local-sets.tex:482`）。

证明里我抄下三处结构。第一处是提取：取 `eq:stopped-joint-extraction` 式的联合子列并同时保留原始闭地毯，闭集紧性、场紧性与有限标签集允许这样提取；精确切割给出硬连接层残标签 $\pm a$、首自由奇地毯相对父域 $\pm2a$；闭极限边界连通；每个开分支由有理内部缓冲代表，因为若某圆盘在闭极限之外却不在任何被指分支内，它在离散补中的紧包含给出矛盾（`07-local-sets.tex:485`--`07-local-sets.tex:494`）。第二处是唯一性代入：停止完整场引理给出父域内跨越切割测试的完整局部集分解与其有界标签均值，也给出父域内零面积，故极限是含切割在内的边界连通有界薄局部集，由唯一性定理认出 $A_{-a,a}$ 与 $A_{-2a,2a}$，此处用到 $2a>2\lambda$ 与 $4a>2\lambda$（`07-local-sets.tex:496`--`07-local-sets.tex:502`）。第三处是归纳与连通性算术：写 $K_{r}$ 为深度 $r$ 的连通全局极限，若 $V$ 是 $K_{r-1}$ 的被指约当洞，则 $\partial V\subset K_{r-1}\subset K_{r}$ 且 $K_{r}\cap\overline{V}$ 连通；反设该紧交分离，则连通的 $\partial V$ 落在一侧而另一侧紧在 $V$ 内，把 $K_{r}\setminus V$ 并到第一侧就分离了 $K_{r}$，矛盾；于是子限制边界连通，在每个被指父域内部由唯一性识别其子限制，在这些父域并之外全局闭集就是早先层，这一步即使在单个前驱分裂时也识别了整个全局闭极限（`07-local-sets.tex:515`--`07-local-sets.tex:526`）。这段是我在笔记里唯一逐字推演过的纯拓扑论证：它把一个「看起来需要几何」的分裂问题压回一次分离性矛盾。

簇停处的条件场（`07-local-sets.tex:532`--`07-local-sets.tex:558`，命题 `prop:exploration-thin`）：考虑初始自由父域（标签 $b_{0}$）中的种子停，或前面定义的复合硬连接停；$A,S,W_{0},\mathscr{E}$ 是其极限已探索集、种子迹、初始墙与保留的停止 $\sigma$--域。$A$ 连到原边界，$D\setminus A$ 的每个分支 $O$ 单连通，条件于 $\mathscr{E}$ 有

\[
 h\lvert_{O}=m_{O}+h^{O},\qquad m_{O}-b_{0}(O)\in 2a\,\mathbb{Z},
\]

$h^{O}$ 是独立的零边界高斯自由场（编号式 `eq:stopped-component-law`）；$b_{0}(O)$ 是其初始父腔的标签，在初始自由域为 $0$、在硬连接洞中为 $\pm a$；标签在每个有限被指分支族上紧。在避开 $W_{0}\cup S$ 的每个紧子集上，$A$ 零面积，完整条件均值 $M$ 就是分段常值函数 $m_{O}$；在同一区域上，条件特征函数式给出 $h-M$ 的完整零延拓条件高斯律，也对支撑碰到 $A$ 的测试成立；局部地 $M$ 是已发现簇的有限带符号奇洞贡献之和（加上初始父标签）的极限。这些陈述对指定的可数个扫描与可观察带指标停的每个成员成立，各自只条件在其自身保留状态上。素材在 `07-local-sets.tex:701`--`07-local-sets.tex:704` 补了一句限定：判定奇边缘归属不假设所有代的局部有限性，那是第 13 节的结论。

典范簇几何（`07-local-sets.tex:706`--`07-local-sets.tex:727`，引理 `lem:canonical-geometry`）是下一节的靶子：自由程序里保留集构成可数个两两不交连通紧集族、每个严格在其父域内，它们及其带标签的洞都是高斯场的可测函数；每个保留簇是其奇洞边界之并的闭包；条件在无标签递归几何（含哪些奇洞属同一保留簇）之下，其相对跳符号独立公平。在父场 $b+f$ 里，正的新一代保留簇同时被含在 $f$ 的正 excursion 里、以及 $f$ 在层 $2a$ 的边界连通上层首达集里；两个包含用的电缆集在总场单位下路径分别高于 $b$ 与低于 $b+2a$。负簇取反射包含，路径低于 $b$、高于 $b-2a$。经过偶洞继续、停在首奇洞的地毯是 $A_{-2a,2a}(f)$；这些陈述在 $a=2\lambda$ 仍有效。最后那句端点有效性我一开始当成多余的谨慎，后来在 §11 的「两种情形穷尽仿射格」里发现它是必需的：$a=2\lambda$ 正是正负两种包含装置同时可用的边界值。

## §11 局部电缆核与不可穿越原理

这节的动机在头三行就说清了（`08-local-kernel.tex:4`--`08-local-kernel.tex:10`）：典范簇是极限场的函数，而停止律条件在保留的探索数据上；要比较二者，就把一个局部电缆路径测试变成连续场在稍大缓冲上的有界函数；在典范父域中校准，使该函数在穿越事件上等于一；而在停止分支自身的条件高斯律下，其期望趋于零。这条「同一个测试函数、两侧分别取值」的思路是我不曾想到的：两侧的对象一个是场可测泛函、一个是条件律下的随机变量，直接比较没有意义，必须先把测试搬进一个双方都能定义的空间。

装置（`08-local-kernel.tex:14`--`08-local-kernel.tex:37`）：本节所有电缆场是辅助高斯逼近，其指标 $n$ 与二进网度 $\varepsilon_{n}=2^{-n}$ 和局部集节的当前网度 $\delta$ 分开；取 $h$ 的归一化，Cameron--Martin 范数为

\[
 \lVert u\rVert_{\nabla}^{2}=\frac{1}{2\pi}\int\lvert\nabla u\rvert^{2}\,\mathrm{d}z,\qquad u\in H_{0}^{1}
\]

（编号式 `eq:kernel-energy`）。在一个有界盒 $\mathcal{B}$ 中固定相应方形电缆格 $\Gamma_{n}$，后面所有子列都从这条二进序列里取。电缆场 $\widetilde{\Phi}_{n}$ 在顶点取离散高斯自由场值、在度量边上条件独立地取布朗桥；边电阻与场标度对这个归一化一次定死。平面配对总是用整条电缆函数到盒的 ALS 调和延拓、盒边界数据为零（记 $\widehat{\Phi}_{n}$），于是

\[
 \widehat{\Phi}_{n}(f)=\int f(z)\,\widehat{\Phi}_{n}(z)\,\mathrm{d}z,
\]

素材明确「它不是仅顶点的配对」（`08-local-kernel.tex:32`--`08-local-kernel.tex:34`）。下面所有全场收敛与全场泛函用一个固定的 $s<-1$ 的 $H^{s}(\mathcal{B})$，那是被引电缆收敛的分布拓扑。我在此处吃过一次亏：早先我用顶点配对来写测试，于是电缆上的布朗桥贡献整个丢掉，而不可穿越恰恰要靠「路径是否越过某层」这种依赖边的信息；改成整电缆 ALS 延拓之后两侧的量才同型。

公共局部核（`08-local-kernel.tex:203`--`08-local-kernel.tex:240`，引理 `lem:local-kernel`）：固定 $K\Subset B\Subset P$ 与一列在 $C_{K,n}$ 上支撑、取值于 $[0,1]$ 的电缆测试 $T_{n}$，则存在子列与其上定义在连续场对 $B$ 的限制上的可测 $k$（$0\le k\le1$），使：(1) 在 $P$ 中零边界参考场里，沿该子列的每个联合极限满足 $\mathbb{E}[T\mid\Phi]=k(\Phi\lvert_{B})$；(2) 同一个 $k$ 也是每个满足 $\overline{P}\subset D$ 的确定性域 $D$ 中的条件核，对同一批电缆测试、在含同一细分 $\mathsf{P}_{n}$ 的容许逼近中成立；对指定的调和均值（含常边界值），要求它的 ALS 延拓均值在 $H^{s}(\mathcal{B})$ 中收敛到所选的连续全 ALS 延拓，并在内部有限差分意义下于缓冲邻域光滑收敛。等价写法是对每个有界连续场泛函 $v$，沿所选子列

\[
 \mathbb{E}\bigl[T_{n}\,v(\widehat{\Phi}_{n})\bigr]\ \longrightarrow\ \mathbb{E}\bigl[k(\Phi\lvert_{B})\,v(\Phi)\bigr],
\]

素材强调这种混合期望的收敛不要求测试作为场函数的收敛（`08-local-kernel.tex:226`--`08-local-kernel.tex:227`）；(3) 若固定随机参数 $\Theta$ 选取 $D$ 及其均值、且条件于 $\Theta$ 时原始总父场 $\Phi_{D}$ 有该高斯律，辅助电缆场按 $\Theta$ 条件采样（对几乎每个实现满足第 2 条的均值收敛），则对每个联合极限 $(\Theta,\widehat{\Phi}_{n},T_{n})\Longrightarrow(\Theta,\Phi_{D}^{\mathrm{aux}},T)$，辅助场边缘满足 $(\Theta,\Phi_{D}^{\mathrm{aux}})\stackrel{\mathrm{d}}{=}(\Theta,\Phi_{D})$。

「与域无关」是这条引理的名字也是它的用途：$k$ 只依赖 $B$ 上的场限制，于是典范父域里的校准值可以直接搬到被指停止分支上，不必再证一次收敛。我原先的写法是在每个域上分别提取子列，结果两个子列不同、无法比较；把「同一条二进子列、同一个核」写成结论的一部分，才让下一命题的两侧取值合法。

不可穿越（`08-local-kernel.tex:621`--`08-local-kernel.tex:670`，命题 `prop:no-crossing`）：设 $O$ 是停止探索的分支（保留 $\sigma$--域 $\mathscr{E}$），它落在标签 $b_{0}\in a\mathbb{Z}$ 的初始自由父域 $P_{0}$ 内，或落在标签 $b_{0}=\pm a$ 的某个被指硬连接父域内；$O$ 单连通且条件于 $\mathscr{E}$ 有 $h\lvert_{O}=m+g^{O}$、$m-b_{0}\in2a\mathbb{Z}$。结论：从该父域descend 的任何典范自由簇不同时碰到 $O$ 与 $\partial O$；结论对所有被指分支与所有递归代同时成立，并在捕获的奇层内以其新进入标签重启后仍成立。硬连接情形里 $O$ 可以是原始 $h$ 的全局复合探索的残分支；证明只用 $O\subset P_{0}$、单连通与所显示的条件律，不需要已探索集相对该父域的连通性，也不需要在一个极限硬连接洞内另行选取格扫描（`08-local-kernel.tex:636`--`08-local-kernel.tex:641`）。

证明里那段仿射格的穷尽我认为是全篇最干净的一步设计（`08-local-kernel.tex:644`--`08-local-kernel.tex:670`）：先在带指标的典范父域 $D_{\mathrm{par}}$（总场 $b+f$）中工作；正新一代簇由典范几何给出总层 $b$ 上的包含正 excursion 与总层 $b+2a$ 的上层首达集，负簇给出低于 $b$、高于 $b-2a$ 的包含路径。反设 $C$ 同时碰到 $O$ 与 $\partial O$，取有理 $Q\Subset O$ 使其内部被碰到；正则内部穷竭下，$C$ 的连通性使其对每个大 $j$ 碰到 $\partial O_{j+1}$，这给出 excursion 测试所需的两个严格邻域（第二个在 $O_{j+2}\setminus\overline{O}_{j}$ 内），首达集测试只需严格内碰，因为其边界连通路径必须逃出固定领圈。相关父域事件 $O\subset D_{\mathrm{par}}$ 上所有缓冲都在此典范父域内。停止标签与该父标签同属仿射格 $b_{0}+2a\mathbb{Z}$：正簇时若 $m\le b$ 则 excursion 迫使取「高于 $m$」的测试，若 $m\ge b+2a$ 则上层首达集迫使取「低于 $m$」的测试；负簇时若 $m\ge b$ 用低于 $m$ 的 excursion，若 $m\le b-2a$ 用高于 $m$ 的首达集。素材写「这些备选穷尽该格」（`08-local-kernel.tex:665`--`08-local-kernel.tex:670`）。

我把这一步当成整篇「耦合」二字的落点：$m$ 的具体值由离散探索决定、典范簇的包含层由场的典范构造决定，两者各自不可控，但它们都落在同一个步长 $2a$ 的仿射格上，于是一次二分裂穷尽就把「谁在上面、谁在下面」变成可判定的事。若我按最初的打算用连续不等式去比较 $m$ 与 $b$，就需要 $m$ 的分布信息，而那正是不可穿越要保护的东西。

## §12 识别：带标记奇洞的地址、可见划分、全代局部有限、完整匹配

识别节第一句就把缺口定位准确（`09-identification.tex:4`--`09-identification.tex:9`）：停止地毯决定了奇洞及其相对高度跳，但没决定哪些洞属于同一个电流簇。先识别这个划分；然后有限族可见洞把格计数界转移到典范构造的所有代；剩下的任务是恢复簇的每一点，含不被任何奇洞探测到的点。

地址记号（`09-identification.tex:13`--`09-identification.tex:50`）：取可数稠密点集 $\mathcal{Q}\subset D$，对每个 $q\in\mathcal{Q}$ 用一条确定性破平规则在相关 $W$ 格上取最近格代表。奇洞用三元组记录：族标签 $\iota\in\{\mathrm{f},\mathrm{w}\}$、标记 $q$、奇深度 $r\ge1$；$\mathrm{f}$ 指原始自由对偶电流，$\mathrm{w}$ 只指硬连接边界簇暴露之后的自由原始后代。深度零时 $V^{\mathrm{f}}_{\delta,0}(q)$ 是原自由腔、墙值 $b^{\mathrm{f}}_{\delta,0}(q)=0$；$\iota=\mathrm{w}$ 时它是硬连接层留下的、含 $q$ 代表的分支面，观测值 $b^{\mathrm{w}}_{\delta,0}(q)\in\{-a,a\}$。给定合法的 $V^{\iota}_{\delta,r-1}(q)$，暴露其首奇地毯，$V^{\iota}_{\delta,r}(q)$ 是含代表的那个未搜索洞，观测墙值 $b^{\iota}_{\delta,r}(q)$；$C^{\iota}_{\delta,r}(q)$ 是提供该奇边缘的当前簇，令

\[
 \epsilon^{\iota}_{\delta,r}(q)=\frac{b^{\iota}_{\delta,r}(q)-b^{\iota}_{\delta,r-1}(q)}{2a}\in\{-1,1\}.
\]

若代表在腔外、落在已揭示地毯上、或已无这样的洞，则该观测及其全部后代取墓地值 $\dagger$、符号置零。合法性、奇深度与提供簇只依赖无符号数据 $(N,s)$，不依赖自由横向颜色 $d$（`09-identification.tex:39`--`09-identification.tex:40`）。连续观测 $V^{\iota}_{r}(q)$、$b^{\iota}_{r}(q)$、$\epsilon^{\iota}_{r}(q)$ 由典范几何的奇地毯同法定义；连续侧也用同一墓地约定。

「只依赖 $(N,s)$」这条我把它当成整个地址系统的合法性证明：一旦合法性用到 $d$，§4 的切割律就不允许我在条件律里保留这些地址，后面的划分识别立刻失去条件化凭据。破平规则与墓地值也是同类装置：它们让「地址」成为一个确定函数，并非随实现漂移的记号。

平坦标签的可恢复性（`09-identification.tex:112`--`09-identification.tex:135`，引理 `lem:recover-flat-label`）：设 $O$ 是带标记点 $q\in O$ 的随机有界单连通域，$f$ 是 $O$ 上的分布；若 $O,q,m$ 可测于 $\mathcal{E}$ 且条件于 $\mathcal{E}$ 有 $f=m+h^{O}$（$m\in\mathbb{R}$，$h^{O}$ 零边界高斯自由场），则存在只依赖 $(O,q,f)$ 的可测函数几乎处处等于 $m$；于是同一被指域与限制场的两种条件描述给出同一标签。证明我只在纸面上走通了一次就记下：用 $\phi_{O}:\mathbb{D}\to O$ 满足 $\phi_{O}(0)=q$、$\phi_{O}'(0)>0$，有理多边形内部穷竭、正规族紧性与正规化极限唯一性使 $\phi_{O}$ 可测于 $(O,q)$；把 $|z|=r$ 上均匀角测度 $\mathrm{d}\vartheta/(2\pi)$ 按 $\phi_{O}$ 推前，Green 核的共形不变性给出半径 $r,s$ 处零边界平均的协方差 $-\log\max(r,s)$，于是 $f$ 的半径 $r$ 平均有均值 $m$、方差 $-\log r$；对 $r_{j}=1-2^{-j}$ 用支撑在盘内的光滑径向概率测试 $\nu_{j}$ 逼近角测度。方差 $-\log r$ 随 $r\uparrow1$ 趋零这一点就是全部机制：均值可以从边界附近的平均里读出来，而无需任何额外条件。这一条把 §10 里「$m_{O}-b_{0}(O)\in2a\mathbb{Z}$」的标签从「条件数据的附注」升级为「场的函数」，是典范侧与停止侧可比的最初级形式。

可见划分（`09-identification.tex:156`--`09-identification.tex:200`，命题 `prop:partition`）：几乎必然地 $i\sim_{*}j$ 当且仅当 $i\sim j$，对两族中每一对被标地址同时成立；其相对符号也一致。每个保留典范簇 $C$ 有一个被标地址 $i$，使 $C_{\delta}(i)$ 的每个豪斯多夫极限都含 $C$；对每个有限个互异典范簇之族，所选的提供格簇最终互异。

证明里那条固定连通搜索我要完整记下，因为它的停止规则被我写过两次才写对（`09-identification.tex:168`--`09-identification.tex:192`）：一个保留典范簇的所有奇洞有同一奇深度 $r$ 与同一深度 $r-1$ 的父域（进入任何奇洞都增加深度，后来的簇在其内）。设 $V_{1},V_{2}$ 是该簇两个被标奇洞，假定其格提供者在保留子列上互异；若 $V_{1}=V_{2}$，洞内一条紧路径已把两标记放进同一离散洞，故可设两者不同。搜索从外部开始，反复加入「在底层图中与已探索区相邻的、按字典序第一个未访问的电流格顶点」并揭示其整支电流簇；硬连接族从完全暴露的硬连接层出发，同一规则交错处理其残腔；探索并保持连到原边界。对两个固定标记分别计已揭示的周围奇边缘数，在任一计数器首次达到 $r$ 时停止。规则只用已揭示历史，从不询问未来洞的身份；两个计数器都不达 $r$ 时给停止一个墓地值。把这可数多条固定规则保留的停止态并到联合子列里，由簇停条件场命题，每个都对其自身极限停止态有条件分支律，而未来的提供者关系不在该态中。

后面那段是几何与格论证的接缝（`09-identification.tex:194`--`09-identification.tex:200`）：两标记在深度 $r-1$ 的同一被指父域内；其中连接它们的紧路径最终落在同一离散父域内（由被指收敛），素材注明这个蕴含不通过 pinch 反向成立；外接种子必须先跨过它们共同的外包奇边缘才可能到达任一第 $r$ 边缘；若停止先发现 $V_{1}$ 的边缘，则另一标记此刻恰见过公共的 $r-1$ 个奇跳。

全代局部有限（`09-identification.tex:321`--`09-identification.tex:345`，推论 `cor:canonical-local-finiteness`）：几乎必然，整个典范自由簇族在任一给定 $\varepsilon>0$ 之上只有有限多个成员；硬连接族及其全部后代同；这些界与一致的紧宏观格计数相容。证明是把「典范簇多」压回「格簇多」：考虑任意 $M$ 个直径大于 $\varepsilon$ 的典范簇之有限族，每簇取两点相距大于 $\varepsilon$；奇边缘的稠密性给出两个几乎同样分离的边缘点，由有限个近旁奇洞与稠密内部测试点见证；单个洞的直径不必与 $\varepsilon$ 可比。由可见划分，每簇的两个见证有一个前驱，且这 $M$ 个前驱互异；网度足够小时每个前驱直径大于 $\varepsilon/2$；于是「至少 $M$ 个典范簇直径大于 $\varepsilon$」蕴含「至少 $M$ 个格簇直径大于 $\varepsilon/2$」，后者由 §5 的指数尾控制。素材另有一句我抄在页边：为证明保留的这些信息是辅助的，匹配拓扑本身忘记重数（`09-identification.tex:318`--`09-identification.tex:319`）。这句话解释了 §3 里那个「忽略单点成员与重数」的度量为何够用。

这里也有过一次失败尝试：我想用递归几何的自相似性直接证典范族的局部有限（连续侧自证），试了两次都卡在「同一代的洞数没有先验界」；正确方向是把有限性外包给格侧计数尾，用划分命题做翻译。代价是必须先有可见划分，顺序因此被钉死。

发现的均值（`09-identification.tex:641`--`09-identification.tex:662`，命题 `prop:discovered-mean`）：$\tau$ 是上述固定停止扫描之一，极限已探索集 $A_{\tau}$，$M_{\tau}=\mathbb{E}[h\mid\mathscr{E}_{\tau}]$ 作为对测试的分布。在每个离 $W_{0}$ 与移动种子有正距离的连通紧定位 $Q\subset\operatorname{int}Q^{+}$ 上，

\[
 M_{\tau}=b_{0}+2a\!\!\sum_{\substack{j\ \text{可见}\\ \text{在定位列表内}}}\!\!\epsilon_{j}\,\mathbf{1}_{\mathcal{O}(C^{\mathrm{can}}_{j})}
\]

（编号式 `eq:canonical-discovered-mean`）。原始自由族 $b_{0}=0$；硬连接复合探索里 $b_{0}\in\{-a,a\}$ 是含该区域的初始被指硬连接洞的标签。每个这样的定位上求和有限，因为贡献者列表有限；隐形条目贡献为零。于是 $M_{\tau}$ 在每个避开 $W_{0}$、移动种子、以及其局部贡献者所关联典范支集的球上是常分布。证明的识别在稠密标记上做（`09-identification.tex:673`--`09-identification.tex:680`）：若 $q$ 沿无穷多网度属于奇洞之并，则它到 $C_{*,j}$ 的正距离给出那些网度上 contained 在并中的固定圆盘；相关奇深度被 $L$ 控制，因为每个外包奇祖先都是互异簇（进入其奇洞后后来的簇严格在该洞内），而外接种子必须先发现每个这样的祖先。

完整匹配（`09-identification.tex:746`--`09-identification.tex:800`，命题 `prop:complete-matching`）：格自由电流簇的每个正直径豪斯多夫极限是一个保留典范簇，每个保留典范簇是其可见前驱的极限；没有互异的隐形前驱具有正直径极限；对硬连接层之后的自由原始后代同样成立，且与该层及高度联合。于是

\[
 F^{\mathrm{f}}_{*}=F\bigl(\mathcal{C}^{\mathrm{f}}\bigr),\qquad F^{\mathrm{w}}_{*}=F\bigl(\mathcal{C}^{\mathrm{w}}\bigr),
\]

两个集合都在主定理的匹配拓扑中收敛。

这条证明是「排除隐形宏观块」的正面形态，我把它的反证结构按步记下（`09-identification.tex:762`--`09-identification.tex:800`）：先说每点都在某典范支集或初始墙上。取格自由簇列 $C_{\delta}$ 有正直径豪斯多夫极限 $C_{*}$（紧且连通）；取 $x\in C_{*}\setminus W_{0}$ 与相异 $y\in C_{*}$；选轴向 $e$ 与有理 $t$ 使 $e\cdot y<t<e\cdot x$；在固定列停止 $\tau(e,t)$ 处，$C_{\delta}$ 对所有足够小网度已被发现（它在更早的列里有点靠近 $y$）；$x$ 附近的小有理球在种子之前、与 $W_{0}$ 有正裕量；取环绕该球的 $Q\subset\operatorname{int}Q^{+}$ 与有理下裕量 $r$；目标簇是该已指定停止处有限定位列表中的一个条目。设 $\mathcal{U}_{\tau}$ 是该列表可见条目所关联典范支集的有限并；若 $x\notin\mathcal{U}_{\tau}$，取更小的有理球 $B\ni x$ 避开 $\mathcal{U}_{\tau}$、$W_{0}$ 与移动种子；由发现的均值命题，$M_{\tau}$ 在 $B$ 上是常分布。写 $\Lambda_{Q^{+}}=\{\operatorname{dist}(Q^{+},W_{0}\cup S)>0\}$（该定位下停止可测的裕量事件），在此初始域中它就是 `eq:stopped-full-characteristic` 里的事件，于是该恒等式对每个支撑在 $Q^{+}$ 内的实光滑测试 $\varphi$ 给出

\[
 \mathbf{1}_{\Lambda_{Q^{+}}}\,\mathbb{E}\Bigl[e^{i(h-M_{\tau})(\varphi)}\mid \mathscr{E}_{\tau}\Bigr]=\mathbf{1}_{\Lambda_{Q^{+}}}\exp\Bigl\{-\tfrac{1}{2}G_{D\setminus A_{\tau}}(\varphi,\varphi)\Bigr\}
\]

（编号式 `eq:full-residual-use`）；它对有限多个测试的所有线性组合成立，其中被杀高斯自由场跨 $A_{\tau}$ 零延拓；因此它提供平坦块引理所需的局部残余律，包括支撑跨过已探索集的磨光函数。由于 $A_{\tau}$ 边界连通且补分支单连通，该引理给出 $A_{\tau}\cap B=\varnothing$；但 $C_{\delta}$ 在此停止处已被揭示，故 $C_{*}\subset A_{\tau}$，矛盾。

策略段把这段压缩成三步（`02-model.tex:474`--`02-model.tex:481`）：振荡型高斯测试排除「均值为平坦处的一段连通宏观切割」；连通的极限前驱与典范支集及初始墙的交构成一个可数两两不交闭覆盖，西尔平斯基定理把它归约为单个非空成员；粗糙墙领圈估计排除初始墙那一支；带指标的无遮蔽估计与发现次序排除隐形重复前驱。我认为这是全篇最集中的地方，也是唯一一处「拓扑定理当逻辑引擎」的用法：若没有那个闭覆盖的两两不交，西尔平斯基的结论就用不上；而两两不交恰恰来自 §11 的不可穿越。

## §13 附录里的输入校订，以及我仍然没有答案的地方

附录 `10-input-conventions.tex` 的性质由它自己声明得很谨慎（`10-input-conventions.tex:4`--`10-input-conventions.tex:9`）：证明用的是 DKLM 正文指定的版本化陈述；这里记下逐字读其证明时需要的若干 elementary 校订，以及平坦块引理用到的共形估计；这些「是我对被指明公式的调适，不是作者发布的勘误」，也不替代其实质性的正则性、收敛或自由能定理。这段话本身就是我该学的一种写法：引用别人论文里某个打印因子时，把「我认为这是笔误」和「我在用它之前先补一个直接构造」分开写。

那条打印校订（`10-input-conventions.tex:14`--`10-input-conventions.tex:17`）：其引理 21.3 里印出的路径长度因子 $S'$ 必须是 $\max\{1,-S'\}$，正如其后公式 (367) 所使用；因为 $S'$ 可为负，并非常值路径的长度为正。素材接着给直接构造（`10-input-conventions.tex:19`--`10-input-conventions.tex:40`）：把增量排序使 $|a-a'|\le|b-b'|$；$a=a'$ 时用空路；否则置 $R=|a-a'|>0$、$B=\{b,b'\}$、$d=\operatorname{dist}(\{a,a'\},B)$、$D=\max\{1,d\}$，固定阶 $k$ 并写 $A=\exp(20k^{2})$、$M=1600A$，则从 $a$ 到 $a'$ 可走至多

\[
 20000\,A\max\{1,\log(R/D)\}
\]

步（编号式 `eq:input-path-bound`）；每步或为最近邻步，或是一条其端点集到 $B$ 的距离除以其长度至少 $A$ 的增量，这正是该文增量分解需要的二分。构造在中心为 $(a+a')/2$、半径 $R$ 的盘中取点 $z$，避开至多四个以 $x\in\{a,a'\}$ 为顶点、指向 $y\in B\setminus\{x\}$、半角 $0.1$ 的锥；这些锥在盘内总面积至多 $4(0.1)(3R/2)^{2}=0.9R^{2}$，故这样的 $z$ 存在；$x$ 到 $z$ 的线段长 $L\le3R/2$，沿弧长 $s$ 处到 $B$ 的距离至少 $(d_{x}+s)/100$（$d_{x}=\operatorname{dist}(x,B)$）。我核过那个 $0.9R^{2}$：一个半角 $0.1$ 的锥在半径 $3R/2$ 内面积约为 $\frac{1}{2}(0.1)(3R/2)^{2}$ 量级，四个相加给出 $0.9R^{2}$，小于盘面积 $\pi R^{2}$，论证成立。这种「用面积占优找一点」的粗做法对我有实际意义：常数 $20000$、$100$、$0.1$ 全部可以放宽，重要的是步数对 $\log(R/D)$ 线性、与网度无关。

仍然没有答案的地方，我按能不能补救分两类。

不能补救的一类是定理的边界：素材声明常数依赖固定的 $t\in[1/2,1)$ 与所陈述的宏观缓冲比，不依赖网度、模式中微观边数、保留周长的长度与指状数，且不作 $t\uparrow1$ 的一致claim（`02-model.tex:15`--`02-model.tex:16`、`03-spatial.tex:41`--`03-spatial.tex:46`）。四态 Potts 端点 $g=4$ 在内，但趋近它的一致性不在结论里。我能说的是：若要做 $t\uparrow1$，第一个出问题的是 `eq:spatial-collar-limit` 与 `eq:spatial-global-count-tail` 的常数，它们对缓冲比一致而对 $t$ 无一致界。这属于 `[推测]`，理由是素材没有任何一段讨论 $t$ 的趋近速率。

另一类是可以追问但素材没答的。其一，屏蔽一节里「四个间隙」的必然性：我在 §8 的 `[推测]` 说明仍然成立，`05-screening.tex:480` 那个 $4\eta(q)$ 只说明有四件事各贡献 $\eta(q)$，没说明为什么恰好四。其二，`07-local-sets.tex:725`--`07-local-sets.tex:726` 那句「在 $a=2\lambda$ 仍有效」是否被任何后续论证实际消费：我在 §11 给出了一个可能的消费点（穷尽仿射格的那二分裂），但没有找到明确引用，写 `[推测]`。其三，主定理对「每个容许多边形逼近」的一致形态是否允许逼近序列的边界只有一致收敛、而没有统一等弧长参数化：`02-model.tex:18`--`02-model.tex:22` 的定义只要求边界参数化一致收敛与紧子集最终被包住，我没找到额外的正则性假设，所以这个结论比我最初预期的弱假设、强结论。其四，簇面积测度、磁化场、全部自旋畴壁曲线、精确度量指数被明确排除（`02-model.tex:379`--`02-model.tex:381`），而 Alcalde López 与 Sepúlveda 那条更强的联合分解（含 XOR 场、簇测度与符号）在 Ising 点且额外假设边界 Minkowski 维数（`01-introduction.tex:52`--`01-introduction.tex:59`）；把二者接起来的路径素材没有给，我也给不出。

我最后记一句方法论上的收获，因为它改变了我的写作顺序：这一整篇的可依赖部分不是「哪个界最好」，是「哪条信息允许进入哪个条件」。三处最关键的纪律（边只在端点之后揭示、开 $W$ 边上不得条件横向装饰、匹配拓扑忘记重数而证明可以临时记住重数）全都是记账规则，并非估计。我最后记一句方法论上的收获，因为它改变了我的写作顺序：这一整篇的可依赖部分不是「哪个界最好」，是「哪条信息允许进入哪个条件」。三处最关键的纪律（边只在端点之后揭示、开 $W$ 边上不得条件横向装饰、匹配拓扑忘记重数而证明可以临时记住重数）全都是记账规则，并非估计。它们一破，后面每条命题的陈述都要重读。

## §14 勘误与自检

已落盘内容我不做任何就地改动，以下按类别登记缺陷，交给本体的机械清理通道。

第一类，行内数学定界符的配对：逐行脚本核查显示全文每一行的定界符计数都是偶数，没有出现过「行内代码引用收尾误打成定界符」的形态；行内代码引用全部以反引号闭合。唯一需要说明的是本节自身在描述该缺陷形态时不得举出字形，故只用文字描述。

第二类，素材导言区定义的专用宏未展开：其中一个微分记号宏在 §7 与 §9 的积分式里出现了共 10 次，其余此类宏（实数集、整数集、自然数集、期望、概率、示性函数、方差、协方差、直径、距离、支撑、律、符号函数、各类花体字母、以及那个双参数局部集宏）我在动笔前都已展开成标准写法；双参数局部集宏在 §3 起统一改写为 $A_{-\alpha,\beta}$ 并在原处注明了改写理由。

第三类，转折复句的连接词形态：实测两类字形合计 8 处（前一类 3 处、后一类 5 处），另有 8 处成对的长停顿号（我用它做了中文的插入语停顿）。这些都属于可机械清理的形态，我不动已落盘文字。

第四类，未翻译的英文残留：§4 与 §6 里有三个素材术语我直接照抄（一处指边的指定动作、一处指被标记的端点集、一处指周长在 pinch 处的解析），§9 有一处指奇点移除，§12 有一处指集合包含关系，§13 有两处（一处指基础性质、一处指概率声称）。另外 §7 用作者缩写指代了一篇被引文献，§10 与 §12 各有一处把英文术语混在中文里。合计约 11 处，动笔时应当直接写中文。

第五节，编号与节序：物理排布与编号一致，从 §0 连续到 §14，本节之后再无正文节，末节是台账。前向引用只出现四处，指向 §3、§5、§11、§13，全部真实存在。字节与定界符的最终实测以交付报告为准；本节写完时全文约十万零四千字节、数学定界符 1,936 个，末节台账追加后字节数还会增加。

一处结构性的申报：主定理的陈述与证明策略都在 `02-model.tex` 内（分别在第 355--372 行与第 410--481 行），我在 §3 与 §5 两处分别引用它们的不同片段，不构成重复落节。

## §15 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $J,U$ | $\sinh(2J)=e^{-2U}$，全程固定 | 02-model.tex:4 | 一切常数的参数 | 允许随网度变则领圈排除失去一致性 |
| $t$ | $\frac12\le t<1$，不作 $t\uparrow1$ 一致 | 02-model.tex:9 | 六顶点权与歧义边开概率 | 模式比较的常数 $C$ 依赖 $t$ |
| $c$ | $1<c\le2$，$c=t^{-1}$ | 02-model.tex:10 | 被引输入的适用区间 | 写出 $c>2$ 则静止性陈述失效 |
| $g$ | $\frac43<g\le4$，$g=\frac{8}{\pi}\arcsin(c/2)$ | 02-model.tex:11 | $a=\lambda\sqrt g$ 与主定理系数 | 区间外二值门槛不成立 |
| $g$ 的两个端点值 | $U=0$ 给 $g=2$，$J=U=(\log3)/4$ 给 $g=4$ | 02-model.tex:14 | 与双电流及四态 Potts 对照 | 端点改值则首簇标签范围变 |
| $x,y$ | $x=1$，$y=c-1$，$y=\sqrt{1+e^{4U}}-1$ | 02-model.tex:97 | 电流权重 | 只用 $x,y$ 无法定联合律 |
| $2^{k}$ | 颜色因子，$k$ 含孤立点 | 02-model.tex:78 | 权重推导的常数核对 | 漏孤立点则推不出比例式 |
| 角点增量 | $H(f)-H(v)=\frac12\tau(v)\tau^{\dagger}(f)$ | 02-model.tex:104 | 高度良定义与自旋反解 | 环流非零则高度不唯一 |
| $K_\delta$ | $K_\delta=2H_\delta$，最近增量幅度 $1$ | 02-model.tex:118 | 谱节全部矩估计 | 换标度则六顶点权识别错位 |
| 涂抹 | $H_\delta(\varphi)=\delta^{2}\sum_{v}H_\delta(v)\varphi(v)$ | 02-model.tex:138 | 主定理的高度拓扑 $s<-1$ | 插值高度需另行比较 |
| $\lambda$ | $\lambda=\frac{\pi}{2}$ | 02-model.tex:189 | 所有局部集门槛 | 门槛 $p+q\ge2\lambda$ 随之外移 |
| $a$ | $a=\sqrt g\lambda$，$\frac{\pi}{\sqrt3}<a\le\pi$ | 02-model.tex:190 | 分裂程序两标签为正 | $a<\lambda$ 时程序无定义 |
| $a^{2}$ | $a^{2}=2\pi\arcsin(c/2)=1/\kappa$ | 06-gaussian.tex:931 | 系数闭合与主定理 | 顺序前移即成循环论证 |
| $G_D$ | $2\pi(-\Delta_D)^{-1}$，奇性 $-\log\lvert z-w\rvert$ | 02-model.tex:185 | 典范局部集的全部几何 | 归一化一变则 $\kappa$ 全变 |
| 歧义边概率 | $W$ 开概率 $t$，另一电流开概率 $1-t$ | 03-spatial.tex:16 | 精确切割律 | 混同二者即 §1 记录的漏洞 |
| 边因子 | 三分支 $t$、$1-t$、$2t-1$ | 03-spatial.tex:55 | 自由分支公平符号 | 求和方式改变则独立性失去 |
| 跳恒等式 | $K(v')-K(v)=\varepsilon_W d(f)(s(v)-s(v'))$ | 03-spatial.tex:107 | 奇洞同跳与嵌套词汇 | 常数因子错则 $2a\mathbb Z$ 不成立 |
| 比较序 | 逐点序 $(s,W^{+},-W^{-})$ | 03-spatial.tex:165 | 正关联与单调耦合 | 先边后点则增加指定不单调 |
| 回路概率 | $p>0$ 与格截断 $c_{*}>0$ | 03-spatial.tex:372 | $(1-p)^{m}$ 的尺度失败界 | 尺度由内部选定则条件独立断 |
| 领圈极限 | 二重极限 $\lim_{\eta}\limsup_{\delta}\sup\P=0$ | 03-spatial.tex:518 | 长通道与无遮蔽 | 次序交换则结论变强且不真 |
| 计数尾 | $\P[\mathcal N_\delta(b)\ge n]\le Ce^{-cn}$ | 03-spatial.tex:1024 | 匹配拓扑的紧包含 | 依赖腔数则全代局部有限断 |
| 自有界 | $\frac12\operatorname{diam}(C)\le\operatorname{dist}(C,Z)\le\operatorname{diam}(C)$ | 02-model.tex:335 | 度量与 $R_\varepsilon$ 夹逼 | 单边界则匹配拓扑非度量 |
| 模式比 | $C^{-m}\prod_i\pi_i(p_i)$ 到 $C^{m}\prod_i\pi_i(p_i)$ | 03-spatial.tex:1210 | 反射界的平方消去 | 批数随模式增长即失去内容 |
| 端口色代价 | $2^{-M}$ 与尾界 $Ce^{-cM}$ | 03-spatial.tex:1650 | 单向毗邻 | 追求双向即需条件横向颜色 |
| 屏蔽裕量 | 半径小于 $Q$ 边长的 $\frac{1}{1000}$ | 05-screening.tex:27 | 回路与桥的间隙预算 | 放大则无处放屏蔽回路 |
| 平方消去 | 左端平方分母 $J^{2}$ 与 $CJ^{2}$ 相消 | 05-screening.tex:192 | 任意罕见模式的反射界 | 逐模式取条件即需 $p_i$ 下界 |
| 相对屏蔽 | $\eta(q)\le Cq^{\alpha}$，$\alpha>0$ | 05-screening.tex:444 | 屏蔽误差无 $M$ 因子 | 逐 $j$ 相加即多出 $M$ |
| 桥耦合误差 | 例外概率 $4\eta(q)$ | 05-screening.tex:480 | 条件独立分解 | 间隙数变则常数需重算 |
| 角亏损 | $D(k,s)=\left(\frac{\lvert k\rvert-s}{\lvert k\rvert+s}\right)^{2}$ | 04-spectral.tex:232 | 极限混合支撑在 $\sigma=\lvert\xi\rvert$ | 换成二阶谐波则两框架不反号 |
| 环形界 | $\nu\{r\le\lvert k\rvert\le2r\}\le C_1$ 对每 $r$ | 04-spectral.tex:259 | 重标后的模糊紧性 | 只有单尺度则该步断 |
| 端帽判据 | 负性蕴涵 $\lvert l/k\rvert<1+\sqrt2$ | 04-spectral.tex:272 | 亏损积分有限性 | 去掉端帽控制则常数发散 |
| $\beta$ | 有上界且离零有界，可依赖子列 | 04-spectral.tex:335 | 反射零性与系数正性 | 若允许 $\beta=0$ 则零性论证空转 |
| 对数矩 | $C_m\sum_{\mathcal P}\prod(1+\log^{+}\frac{R_0}{\lvert z_i-z_j\rvert\vee\delta})$ | 06-gaussian.tex:160 | 磨光核的 $L^{1}$ 收敛 | 奇矩不零则碰撞对角无法排除 |
| 碰撞体积 | 碰撞邻域体积 $O(r^{2})$ | 06-gaussian.tex:357 | 对角上无额外测度 | 次序改为先 $r$ 后 $\delta$ 即失效 |
| 极消去 | $L_j(y,\mathbf z)=\kappa T_{j-2}(\mathbf z)$ | 06-gaussian.tex:636 | Wick 递推的边界项 | 测试非零质量即离开中性通道 |
| 每阶一致 | $\Phi_{m,\delta}\to Q_m$ 在紧子集上每阶一致 | 06-gaussian.tex:887 | 被引收敛判据的假设 | 只到四阶即不能用自由能定系数 |
| $\sigma^{2}$ | $\sigma^{2}=2\pi\kappa=1/\arcsin(c/2)$ | 06-gaussian.tex:952 | 平面归一化 | 用窄区间收敛定理即循环 |
| 平坦域极限 | $K_\delta\Rightarrow h_U/a$ 于 $H^{s}_{\mathrm{loc}}(U)$ | 06-gaussian.tex:40 | 局部集识别的输入 | 腔一致性丢失则条件版本不成立 |
| 分裂独立 | 同源的不同极限分支仍独立 | 06-gaussian.tex:45 | 前驱唯一性论证 | 当作相关则划分命题的计数传递断 |
| 标签格 | $m_O-b_0(O)\in2a\mathbb Z$ | 07-local-sets.tex:541 | 不可穿越的二分裂穷尽 | 步长错则两装置不能穷尽 |
| 边界连通 | 闭集并边界后连通，洞为约当 | 07-local-sets.tex:29 | 薄局部集唯一性定理 | 缺此条件则典范性不唯一 |
| 平均方差 | 半径 $r$ 平均的方差为 $-\log r$，$r_j=1-2^{-j}$ | 09-identification.tex:132 | 平坦标签只依赖 $(O,q,f)$ | 无此可测性则两侧标签不可比 |
| 地址符号 | $\epsilon=\frac{b_r-b_{r-1}}{2a}\in\{-1,1\}$，墓地值 $\dagger$ | 09-identification.tex:34 | 可见划分与发现的均值 | 合法性用到颜色即失去条件凭据 |
| 覆盖归约 | 可数两两不交闭覆盖归为单一成员 | 02-model.tex:477 | 完整匹配的每点归属 | 若交不两两不交则拓扑定理用不上 |
| 残余律 | 条件特征函数 $\exp\{-\frac12 G_{D\setminus A_\tau}(\varphi,\varphi)\}$ | 09-identification.tex:790 | 排除隐形宏观块 | 只到洞内则跨过切割的测试不可用 |
| 电缆能量 | $\lVert u\rVert_{\nabla}^{2}=\frac{1}{2\pi}\int\lvert\nabla u\rvert^{2}\,\mathrm{d}z$ | 08-local-kernel.tex:19 | 电缆测试的 Cameron--Martin 界 | 改顶点配对即丢掉桥上的信息 |
| 核的域无关 | 同一 $k$ 用于所有含 $\overline P$ 的域 | 08-local-kernel.tex:213 | 典范父与停止支的对照 | 逐域提取子列则两侧不可比 |
| 附录路径界 | $20000A\max\{1,\log(R/D)\}$，$A=\exp(20k^{2})$ | 10-input-conventions.tex:26 | 增量估计的路径分解 | 打印因子不校正则步数可负 |
| 附录面积 | 锥面积至多 $0.9R^{2}$，小于 $\pi R^{2}$ | 10-input-conventions.tex:36 | 上述构造找避锥点 | 角度放宽则存在性论证失效 |

## §16 补记（对 §14 第二类的更正）

§14 登记第二类缺陷时我用的计数是早先一次量测的结果，收工前复量发现三项偏低，按实测更正如下，已落盘文字不动。素材导言区定义的微分记号宏实际出现 22 处（我先前写 10 处），集中在 §7、§8、§9 的积分与傅里叶式里；概率测度宏实际出现 24 处（先前未在清单里点名，我在 §14 里把它归入「已展开」，这一句不准确，应以本条为准）；反对角线/小数 epsilon 形态的宏出现 4 处；实数集宏出现 1 处（其余实数集写法都已展开为标准的黑体大写）。期望、示性函数、直径、距离、双参数局部集、花体字母、整数集、自然数集、方差、协方差、律、符号函数这些类别经复量确为零命中。

台账仍是全文唯一的五列表头，实测表头行仅在第 591 行出现一次；台账竖线行共 51 行（表头、分隔行、数据行 49 行），逐行竖线计数全为 6，无裸竖线残留。全文字节与定界符的最终两次实测在交付报告里给出。

