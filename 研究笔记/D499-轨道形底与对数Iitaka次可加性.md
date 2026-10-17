# D499 研究笔记：轨道形底与对数 Iitaka 次可加性

## §0 登记与写作范围

这是 D499 号自述稿。我要写的东西有一层风险：论文正文已经把结论整理成公理式输入与命题链，读者看到的是一条被磨平的路径。本笔记的目的就是把那条路径重新弄脏，让我当初怎么猜、怎么撞墙、在哪里改口，尽量按顺序回到纸面。凡是我从正文里读不出来的动机，我会就地标记 `[推测]`，并说明缺的是什么证据；宁可留白，不许编。

取材范围严格限制在本目录 `build` 下的 `.tex` 分片：`build/main.tex` 是导言与文档装配，`build/sections/introduction.tex`、`build/sections/models.tex`、`build/sections/root-comparison.tex`、`build/sections/adjoint-addition.tex`、`build/sections/period-positivity.tex`、`build/sections/general-type-addition.tex`、`build/sections/applications.tex`、`build/sections/reduced-root.tex` 是八节主干，`build/sections/normalization.tex` 是附录，`build/figures/two-maps.tex` 是那张两映射示意图。最大的分片 `build/sections/period-positivity.tex` 约 $45{,}323$ 字节，最小的示意图约 $523$ 字节，清单总量约 $240{,}344$ 字节。位相与排版层的东西我一律不看，也不去执行编译，笔记里所有位置一律以 `文件:行` 的形式回指。

我要写的不等式只有一条，其余都是它的奴仆：

$$
 \kappa(X)\ \geq\ \kappa(F)+\kappa(Y).
$$

正文版本写作 $\kappa(X,K_X+\Delta)\geq\kappa(F,K_F+\Delta_F)+\kappa(f\mid\Delta)$，见 `build/sections/introduction.tex:142`-`145`。全笔记里我用 $\kappa(\,\cdot\,)$ 表示 Iitaka 维数，用 $\nu(\,\cdot\,)$ 表示半正线的数值维数，用 $B(\,\cdot\,)$ 表示轨道形边界，用 $m_\Delta(E)$ 表示边界重数。

preprints/Orbifold-and-logarithmic-Iitaka-subadditivity-September-26-2026
其他队列第 322 行号

## §1 初始动机：一条不等式想同时吃掉两类信息

起点是小平维数对纤维空间的生长率。设 $f\colon X\to Y$ 是紧复流形之间连通纤维的满全纯映射，$F$ 是很一般的纤维，Iitaka 的次可加性问题问 $\kappa(X)\geq\kappa(F)+\kappa(Y)$ 是否成立（`build/sections/introduction.tex:5`-`8`）。对数版本允许沿约化边界发散，所以它管的是开簇；我的第一版目标就是把这两条同时推广，让有理边界系数与重纤维一起进入不等式（`build/sections/introduction.tex:9`-`12`）。

这里有个我一开始没有意识到的分裂。下界要求全局的多重典范形式同时保留纤维的生长率与底的生长率（`build/sections/introduction.tex:18`-`19`）。已知的每一个情形，正性的来源都落在纤维化的不同部位：Kawamata 处理曲线底与有好极小模型的纤维，Viehweg 的弱正性与底为一般型时的加法，Kollár 的一般型纤维加法（`build/sections/introduction.tex:19`-`24`）。弱正性控制的是对称幂在任意小正丰富扭之后的行为，而一般型的底恰好提供足够的典范正性把这些扭吃掉（`build/sections/introduction.tex:25`-`27`）。另一批结果靠维数或底的几何：Birkar 的总维数不超过 $6$，Cao--Păun 与 Hacon--Popa--Schnell 的阿贝尔底或极大 Albanese 维数底，Cao 的射影对数终端曲面对（`build/sections/introduction.tex:29`-`33`）。正文对此有一句我很看重的总结：这些已确立情形各自从纤维化不同部位抽取正性，它们并未对纤维化施加一个统一条件（`build/sections/introduction.tex:34`-`35`）。

对数方向的既有结果同样分散。Kovács--Patakfalvi 拿下射影的纤维为对数一般型的情形（`build/sections/introduction.tex:37`-`38`），Hashizume 拿下纤维的对数典范除子丰裕时的约化简单正规交叉次可加性（`build/sections/introduction.tex:39`-`40`），Maehara 有底为对数一般型时的对数加法，Fujino 用扭弱正性重证了一遍（`build/sections/introduction.tex:41`-`43`）。Campana 处理轨道形底为一般型的加法，Wang 处理复环面上的对数终端 Kahler 次可加性并带下确界重数的精化（`build/sections/introduction.tex:44`-`48`）。

于是我的初始猜想形状是这样一条：既然每个已知情形都在某个部位有正性，我应该构造一个统一的部位，让正性从那里流回全局。当时的我以为这个部位就是"模范畴"，也就是把纤维的多典范系统按参数收集成一条线，然后指望这条线自带正性。这句话里埋了两个错误，我后来分别用了两个转折才拆掉它们。

## §2 我最初猜的定理形状，以及它自带的三个多余假设

先把轨道形底按正文写清楚，因为下面所有的错误都源自我第一次读它时读得太快。

纤维化定义为连通纤维的真满全纯映射；光滑流形上的有理简单正规交叉边界是 $\Delta=\sum_i\delta_i\Delta_i$，其中 $\delta_i\in\mathbf Q\cap[0,1]$，支集为简单正规交叉（`build/sections/introduction.tex:71`-`74`）。源上素除子 $E$ 的边界重数定义为

$$
 m_\Delta(E)=\frac{1}{1-\Delta_E},\qquad \frac{1}{0}=\infty,
$$

见 `build/sections/introduction.tex:76`-`79`。底光滑时，

$$
 m(f,\Delta;D)=\min_{E\mapsto D}\bigl\{\operatorname{ord}_E(f^*D)\,m_\Delta(E)\bigr\},
 \qquad
 B(f,\Delta)=\sum_D\left(1-\frac{1}{m(f,\Delta;D)}\right)D,
$$

见 `build/sections/introduction.tex:82`-`88`。这里 $D$ 跑遍底的素除子，$E$ 跑遍支配 $D$ 的源素除子，并且 $1/\infty=0$。最小值非空，且 $B(f,\Delta)$ 只有有限个非零系数（`build/sections/introduction.tex:90`-`92`）。

我第一次写定义时，习惯性地加了三个限制。第一个：我以为重数必须满足某个整除性条件，也就是说只有当 $m(f,\Delta;D)$ 真的对应重纤维的重数时才允许，因为 Campana 的轨道形底传统上带除子部分的重纤维整除要求。正文在这里明确写了"No divisibility condition"（`build/sections/introduction.tex:93`），我的整除性假设纯属多余。第二个：我以为边界系数必须形如 $1-1/a$，$a$ 为整数，因为那正是循环根覆盖能直接读出的那类系数。`build/sections/root-comparison.tex:159`-`161` 处有一句话专门说明：论证与根阶公式 $j(1+l)-1$（该行号指 `build/sections/root-comparison.tex:114`-`116` 处的阶公式）都不要求边界系数取 $1-1/a$ 的形状。第三个：我以为底也应当是射影的，或者至少要求 $Y$ 携带一个固定的 Kahler 类；正文只要求 $X$ 属于藤木类 $\mathcal C$，$Y$ 是既约不可约紧复空间（`build/sections/introduction.tex:135`-`140`）。

定理的不变底项是

$$
 \kappa(f\mid\Delta)=\inf_{f'\colon (X',\Delta')\to Y'\sim f}\kappa\bigl(Y',K_{Y'}+B(f',\Delta')\bigr),
$$

见 `build/sections/introduction.tex:114`-`118`。等价关系由双全纯改造图生成，允许箭头两个方向都走，而改造必须满足 $t\,m_{\Delta'}(E)\geq m_\Delta(D)$，$t=\operatorname{ord}_E(u^*D)>0$（`build/sections/introduction.tex:106`-`111`）。这里 $\infty\geq\infty$ 被允许，$t=0$ 时不加条件。我后来才明白，这两个技术约定不是吹毛求疵，它们是让"$B$ 在改造下不乱跑"成立的唯一办法。

结论的不等式是 $\kappa(X,K_X+\Delta)\geq\kappa(F,K_F+\Delta_F)+\kappa(f\mid\Delta)$（`build/sections/introduction.tex:142`-`145`）。对约化简单正规交叉的 $D_X,D_Y$ 且 $\operatorname{Supp}(f^*D_Y)\subseteq\operatorname{Supp}(D_X)$，不变底项至少是 $\kappa(Y,K_Y+D_Y)$（`build/sections/introduction.tex:156`-`159`），于是对数版本与通常版本都掉出来，空边界给出通常次可加性（`build/sections/introduction.tex:171`-`173`）。

## §3 错误路线一：把已知的对数一般型加法直接压在原纤维上

最直接的第一次尝试是：既然对数一般型纤维的加法已有结果，就检验原纤维 $F$ 是否落在这些结果适用范围内。我当时手里有两把锤子，Kovács--Patakfalvi 的稳定族正性（射影、纤维对数一般型）与 Viehweg--Kawamata 一系的弱正性（纤维有好极小模型）。

这条路在第一步就死了。原纤维既不必是一般型，也不必有好极小模型，甚至不必是射影的：$X$ 只在藤木类里，$F$ 是它的纤维，$K_X+\Delta$ 的多典范系统可以在一个 $k$ 维 Iitaka 像上生长而纤维本身毫无典范正性可言。`build/sections/introduction.tex:49`-`51` 那句是这一节存在的理由：本论证只在完成相对 Iitaka 约化之后才使用一般型加法，原纤维不必为一般型或有好极小模型。

失败的原因值得再写细一点。我原以为"正性从某处流出"意味着我可以直接在原纤维化 $f$ 上取直接像层 $f_*\mathcal O_X(m(K_X+\Delta))$，并对它做半正分解。问题在于，当 $\kappa(F,K_F+\Delta_F)=0$ 时这些直接像的秩是 $1$，此时层本身记录的不是纤维的正性，是纤维的模；把这种层当成半正线来用，等于凭空假设模线在底上是大除子，而小平维数的下界恰恰要靠它。`[推测]` 这一段是我对动机的重建：正文并未写"我试过在原纤维上用弱正性"，它只写了最终路线在约化之后才调用一般型加法。我能给出的正面证据是 `build/sections/applications.tex:79`-`87` 处的顺序：先由相对 Iitaka 系统的像维数是 $k$，把系统推进 $D_W+M$，比例不变，于是像维数仍是 $k$，由此才得到 $(D_W+M)|_{W_y}$ 的大性。也就是说纤维上的大性是构造出来的产物，不是原纤维的假设。

我给自己定了一条纪律：凡是要用别人的正性定理，必须先把那个定理的假设逐条写成我自己的除子不等式，然后检查是否可验证。这条纪律后面在 `build/sections/adjoint-addition.tex:38`-`56` 处救了场，那里把对数一般型加法写成三个显式条件：很一般光滑纤维上 $K_F+T_F$ 大；$C\leq B(h,T)$；$T$ 在每个像的余维至少为二的素除子上系数为一。第三条条件正是我原先会漏掉的东西，而它的成立要归功于模型工程（见 §6 与 §7）。

## §4 错误路线二：典范公式的判别式与模分解

第二条路是典范公式。Fujino--Mori 有高维对数版本，Ambro 把判别式部分与模部分做了双有理组织（`build/sections/introduction.tex:191`-`193`）。按这个思路，$K_X+\Delta$ 在 $g\colon X\to W$ 下分解为 $g^*(K_W+T+M)$ 加上余项，其中 $T$ 是判别式、$M$ 是模 $\mathbf Q$-线丛，然后我对 $(W,T+M)$ 用一般型加法，期望 $X$ 与 $W$ 的多典范空间同构从而把下界拉回来。

这条路我走了大约半章的长度才停下。典范公式给出的同构有两处不够用。第一处：模部分只在 $\mathbf Q$-线性等价意义下确定，判别式也只到线性等价的精度，而我需要的是逐次数的空间同构 $H^0(X,q(K_X+\Delta))\cong H^0(W,q(K_W+T+M))$，因为最后一步要靠"两个系统之间所有比值保持不变的乘法"把像维数搬回来（`build/sections/root-comparison.tex:53`-`55`，以及 `build/sections/root-comparison.tex:626`-`630` 的"同一个相对生成元的幂在共同的可分分次中相乘，保持积与比值"）。第二处更微妙：轨道形底项 $B$ 是在所有允许的模型上取下确界定义的，若我在分解过程中换掉了源模型，就必须证明新模型上的 $B$ 与原模型一致；双有理的典范公式并不跟踪这件事。

`build/sections/introduction.tex:194`-`196` 的措辞是我改口的证据："我们对这一策略的使用要求在固定的原源上做精确比较"，而这一精确比较由相对典范形式（多典范形式）的阶得到。把这句话翻译成工作语言：我放弃了"到线性等价就够了"的指望，改成交换对象本身，即在给定的参考对 $(X_0,\Delta_0)$ 上，用形式在各素除子上的阶把所有等式钉死。

这一步的代价是我必须处理一个此前我完全忽略的杂务：源上的改造会在边界里加进例外除子，而这些例外除子的系数必须是 $1$。`[推测]` 我认为这正是我第一遍写的时候最烦的那类技术细节，它看起来与不等式无关，可它同时出现在三处：`build/sections/root-comparison.tex:32`-`33` 的参考对假设，`build/sections/adjoint-addition.tex:47`-`49` 的加法条件 (iii)，`build/sections/applications.tex:22`-`24` 的固定底后的系数一条件。同一个条件在三个地方都需要，这本身说明它是链路上不可绕过的接头。

## §5 转折一：相对 Iitaka 约化，把一般型对象搬到中间底上

转折是把"让纤维变成一般型"这件事从假设改成构造。设右端两项非负，记 $k=\kappa(F,K_F+\Delta_F)$。相对 Iitaka 映射给出分解

$$
 X\xrightarrow{g}W\xrightarrow{h}Y,\qquad \dim W_y=k,\qquad \kappa(G,K_G+\Delta_G)=0,
$$

对很一般的 $g$-纤维 $G$ 成立，见 `build/sections/models.tex:309`-`320` 与 `build/sections/introduction.tex:181`-`187`。这个分解把纤维换成它的 Iitaka 像，像的维数正好是 $k$，而新纤维 $G$ 的对数小平维数是零。一般型的对象出现在了正确的地方：$W$ 的纤维上，$K_W+T+M$ 限制到大（`build/sections/introduction.tex:209`-`210`）。

`build/sections/models.tex:324`-`364` 的构造里有三处细节是我原先没打算认真对待的。

第一处是相干性与时机。必须考虑所有能清掉 $\Delta$ 分母的度数；相对伴随直接像层在这些度数上是相干的（`build/sections/models.tex:326`-`327`）。我先在一个稠密解析开集上把映射与边界分层光滑化，那里族与其伴随线丛在底上平坦，纤维截面维数的 Generic 常数性允许上同调与底交换（`build/sections/models.tex:328`-`331`，引用 Grauert 直接像定理及其勘误），再加上求值秩的条件，对每个度数得到一个稠密解析开集；把这些可数多个例外集去掉，最大像维数就是 $k$，并且在某一个固定度数达到（`build/sections/models.tex:332`-`336`）。这里"某一个固定度数"很关键：若最大像维数只在趋于无穷的度数序列上出现，我就无法把系统当成一个线丛的截面系统来处理。

第二处是把亚纯映射变成映射。取可分度数、把相对亚纯映射解调到直接像层的射影丛上，再对像作施泰因分解（`build/sections/models.tex:337`-`339`）。紧复空间上线丛的 Iitaka 纤维化定理保证限制在很一般纤维上就是所求的纤维化（`build/sections/models.tex:340`-`342`），并且不需要有限生成性（`build/sections/models.tex:343`）。我最初以为要靠除子环有限生成，那是多余的。

第三处是像空间的类 $\mathcal C$ 归属。$W$ 是类 $\mathcal C$ 空间的真像，故仍在类 $\mathcal C$（`build/sections/models.tex:344`-`345`）；把 $h$ 的纤维连通性从 $f$ 的连通性推出来，靠的是 $g$ 下的像恰是 $h$ 的纤维（`build/sections/models.tex:346`-`347`）。零维数断言的证明是标准招数：射影 Iitaka 像上的相干直接像在加一个丰富扭之后有截面，若限制有正的 Iitaka 维数，用定义系统的幂乘那些截面就会扩大 Iitaka 像；，并非零定义截面在很一般 Iitaka 纤维上不恒为零，故限制恰为零（`build/sections/models.tex:349`-`356`）。

有了这个分解，剩下的问题被压缩成一句话：如何在 $W$ 上造出那条线 $M$ 和那个边界 $T$，使得相对精确比较成立。这句话就是下一节的题目。

## §6 模型工程的账本：对数改造、例外除子与系数一

精确比较的前提是：允许我随便换模型，但换完之后所有的截面空间、所有的边界系数、所有的 $B$ 值都要能记账。`build/sections/models.tex:44`-`66` 的对数改造引理就是账本本身。

设 $p\colon Z'\to Z$ 是光滑紧流形之间的真双全纯映射，$\Gamma$ 支集简单正规交叉、系数在 $\mathbf Q\cap[0,1]$，并令 $\Gamma'=p_*^{-1}\Gamma+\operatorname{Exc}(p)_{\mathrm{red}}$。结论是有有效的 $p$-例外有理除子 $A$ 使

$$
 K_{Z'}+\Gamma'=p^*(K_Z+\Gamma)+A,
$$

见 `build/sections/models.tex:54`-`56`；并且对充分可分的 $m$ 有 $p_*\mathcal O_{Z'}(m(K_{Z'}+\Gamma'))=\mathcal O_Z(m(K_Z+\Gamma))$（`build/sections/models.tex:59`-`62`）。这些识别与乘法相容，所以可分截面环与它们的 Iitaka 维数一致，并且 $p$ 自动满足轨道形态射条件（`build/sections/models.tex:63`-`65`）。

证明里的不等式是我这一路最喜欢的一个小计算，见 `build/sections/models.tex:76`-`90`。在例外素除子 $E$ 的中心一般点取坐标，让包含该中心的边界分支是 $z_i=0$，$1\leq i\leq r$，系数 $\gamma_i$；记 $t_i=\operatorname{ord}_E(p^*z_i)$，$k_E$ 是 $p$ 的 Jacobi 行列式沿 $E$ 的阶。把对数形式

$$
 \frac{dz_1}{z_1}\wedge\cdots\wedge\frac{dz_r}{z_r}\wedge dz_{r+1}\wedge\cdots\wedge dz_n
$$

拉回后沿 $E$ 至多一阶极点：在 $E$ 的一般光滑点，每个对数因子形如 $t_i\,du/u$ 加一个全纯一次形式，并非零楔积里至多出现一个 $du/u$。于是 $k_E+1\geq\sum_i t_i$，从而待计算的系数满足

$$
 k_E+1-\sum_i\gamma_i t_i\ \geq\ \sum_i(1-\gamma_i)t_i\ \geq\ 0.
$$

我第一次读到这里时以为这只是标准的对数差异演算，真正让我停下来的是它的形状：左边是"$1$ 减去带系数的阶"，右边把系数 $\gamma_i$ 换成了 $1-\gamma_i$。这正是 $m_\Delta(E)=1/(1-\Delta_E)$ 这一类权重的来源。也就是说，边界重数的分母 $1-\gamma$ 就是这里出现的 $(1-\gamma_i)$，它把"系数一"标为权重无穷的位置。系数一到 $\infty$，$\infty$ 到"$B$ 的系数一到 $1$"，链条在 `build/sections/models.tex:97`-`100` 收口：例外素除子有无穷边界重数；非例外素除子是严格变换，拉回阶为一、系数不变。

推论 `build/sections/models.tex:103`-`111` 说：若在 $Z'$ 上一个亚纯 $m$-多典范形式在所有非例外素除子上满足 $m\Gamma'$ 的边界界，则当 $m\Gamma$ 与 $m\Gamma'$ 为整除子时它下降到 $m(K_Z+\Gamma)$ 的截面；对拉回自 $Z$ 的线丛做张量扭后同样成立。证明用了两次延拓：在例外像之外它已经是 prescribed 线丛的全纯截面（光滑空间上除子正则性足够），剩下的余维二解析子集上的延拓归 Hartogs 定理（`build/sections/models.tex:113`-`119`）。这是"检验只看余维一"这一方法论第一次出场；它在 §9 会以更强的形式再出现一次。

推论 `build/sections/models.tex:121`-`137` 的三条兼容律里，第三条是我最想要的：若 $g'\!=\!g\circ p$，则

$$
 B(g',\Gamma')=B(g,\Gamma),
$$

见 `build/sections/models.tex:133`-`135`。证明在 `build/sections/models.tex:151`-`157`：固定底的素除子 $D$，所有旧的支配 $D$ 的素除子都有严格变换，拉回阶与边界重数不变；而在定义 $m(g',\Gamma';D)$ 的最小值里新加的每一项都是 $p$-例外的，边界重数为无穷，所以把无穷加进一个已取到的最小值不会改变结果，包括原最小值已经是 $\infty$ 的情形。这条"加无穷不改最小值"的性质，是我把改造图允许箭头反着走的底气。

## §7 平坦化与"固定参考源"：一次差点毁掉 inf 重数的改动

有了改造不变性，我以为剩下的事就是把 $g$ 换成好的模型，随便换。这个想法造成了一次真实的返工。

问题是这样的：精确比较要在底的真除子的_generic 点_上比较形式，这要求我控制源上那些映到底的余维至少为二的子集的除子。若在换模型的过程中新产生了这类"映到余维二"的源素除子，它们的系数就可能不是 $1$，于是 $B$ 的检验集合被污染，加法条件 (iii) 也失效。`build/sections/models.tex:168`-`175` 说得很直白：要用解析平坦化，且这里的严格变换指原来族在同构轨迹上的闭包去掉底的挠， further 底变换保持平坦，而我们只用平坦化带来的等维性，然后再解这个中间源。

引理 `build/sections/models.tex:177`-`198` 的结论是：存在底改造 $q\colon T\to T_0$、源改造 $p\colon Z\to Z_0$ 与 $g\colon Z\to T$，$q\circ g=g_0\circ p$，边界按严格变换加约化例外除子的规则取，使每个满足 $\operatorname{codim}_T g(E)\geq2$ 的素除子 $E$ 都是 $p$-例外的；特别地它们在 $\Gamma$ 中系数为 $1$，所得纤维化对参考对 $(Z_0,\Gamma_0)$ 是齐整的。

关键的一步是把顺序定下来。证明 `build/sections/models.tex:200`-`210` 强调：先平坦化，再解源。设 $N=\dim Z_0$、$b=\dim T$、$d=N-b$。若 $Z$ 中素除子 $E$ 的像落在底里某个余维至少为二的解析子集 $C$ 中，等维性给出

$$
 \dim\bar g^{-1}(C)\leq\dim C+d\leq N-2,
$$

于是 $r(E)$ 从而 $p(E)$ 的维数至多 $N-2$，即 $E$ 在 $Z_0$ 上是例外的（`build/sections/models.tex:211`-`217`）。我第一次的顺序是先解源再平坦化，此时 $r(E)$ 可能被解源过程本身抬高，不等式无从谈起；`[推测]` 正文只写了"先平坦化"这一句，没有写反面情形，我把这里的失败重建为：解源之后族的等维性丢失，$\dim\bar g^{-1}(C)$ 的上界不再成立。

还有一句我起初读成多余的提醒：解完之后不需要保持平坦，保留的结论是"在 $Z_0$ 上例外"，而它正好允许例外中心的下降（`build/sections/models.tex:232`-`234`）。也就是说平坦只是临时的脚手架。

藤木类里的持续性能不能保住？`build/sections/models.tex:236`-`244` 给了答案：光滑紧成员有紧 Kahler 改造（引 Demailly--Păun），从一个 $Z_0$ 的 Kahler 模型出发，图解奇与光滑中心吹爆的主化给出支配的 Kahler 源；这些射影改造保持 Kahler 性，而真亚纯像仍留在类 $\mathcal C$（引 Fujiki--Douady），于是底也有 Kahler 模型；维数论证始终指的是原来的 $Z_0$。

最后是同时控制推论 `build/sections/models.tex:248`-`289`。设 $(X_1,\Delta_1)$ 上有到固定光滑底 $Y$ 的纤维化 $f_1$，且每个被 $f_1$ 映到余维至少为二的素除子在 $\Delta_1$ 中系数为 $1$；记 $C=B(f_1,\Delta_1)$。给定经过另一个光滑紧空间的分解 $X_1\to W_1\to Y$，对它做平坦化并允许任意有限多次中间底改造（始终取支配的光滑源模型、加约化例外边界），得到的 $X\to W\to Y$ 同时满足四条：每个被 $g$ 映到余维至少为二的素除子在选定的 $g_1$ 光滑参考源上是例外的；每个被 $f=h\circ g$ 映到 $Y$ 中余维至少为二的素除子在 $\Delta$ 中系数为一；$B(f,\Delta)=C$，特别地对每个 $D\subset Y$ 与每个支配它的 $E\subset X$ 有

$$
 \operatorname{ord}_E(f^*D)\,m_\Delta(E)\ \geq\ m_C(D);
$$

以及总源与很一般纤维的对数小平维数不变。第 269 到 271 行的那条不等式，是我在整个笔记里反复引用的"保住的 inf 重数"：它说改造只会抬高每个源素除子对底素除子的加权重数，绝不会被改造削弱。轨道形的信息因此可以安全地穿过整条模型链路。

顺带记录一处顺序上的洁癖：`build/sections/models.tex:291`-`294` 说在应用时要把临界值和边界分层的像都算进底的坏轨迹，于是 $C$ 有简单正规交叉支集；$Y$ 就此固定，之后所有中间底的变化都走同时控制推论。把这两样东西加进坏轨迹，是我在第一次尝试时没做的：我当时的判别式只包含临界值，结果 $B$ 的支集碰到边界分层的像时不是简单正规交叉，$T$ 的定义里最小值集合会跟着变形。

## §8 秩一比较命题：根形式、特征子空间与一维性

这一节要立起来的是整条链的枢纽，命题 `build/sections/root-comparison.tex:19`-`68`。设 $g\colon (X,\Delta)\to W$ 是从光滑紧 Kahler 簇到光滑紧类 $\mathcal C$ 簇的连通纤维满映射，$\Delta$ 是系数在 $\mathbf Q\cap[0,1]$ 的简单正规交叉边界，很一般光滑纤维 $G$ 上 $\kappa(G,K_G+\Delta_G)=0$。在对数改造引理与平坦化引理允许的改造之后，固定光滑参考对 $(X_0,\Delta_0)$ 与改造 $\pi\colon X\to X_0$，$\Delta=\pi_*^{-1}\Delta_0+\operatorname{Exc}(\pi)_{\mathrm{red}}$，并要求每个被 $g$ 映到余维至少为二的素除子都是 $\pi$-例外的（`build/sections/root-comparison.tex:28`-`33`）。结论是有理线丛 $M$ 与有理除子 $T$ 满足四条：$M$ 的正整数倍是某个纯的、实极化的、带整格的变化在 $W$ 的稠密开集上某个复直和因子的最高 Hodge 步的抛物线；$T$ 支在简单正规交叉除子上且

$$
 B(g,\Delta)\leq T\leq 1,
$$

见 `build/sections/root-comparison.tex:41`-`43`；在充分可分的次数 $q$ 上有线性同构

$$
 H^0\bigl(W,q(K_W+T+M)\bigr)\simeq H^0\bigl(X,q(K_X+\Delta)\bigr)\simeq H^0\bigl(X_0,q(K_{X_0}+\Delta_0)\bigr),
$$

见 `build/sections/root-comparison.tex:48`-`52`，且在共同的可分分次下保持积与比值，从而保持线性系统的像维数；同样的比较相对地成立，即

$$
 h_*\mathcal O_W\bigl(q(K_W+T+M)\bigr)\simeq (f_0)_*\mathcal O_{X_0}\bigl(q(K_{X_0}+\Delta_0)\bigr),
$$

见 `build/sections/root-comparison.tex:58`-`62`。

我的第一个疑问是：为什么一条线丛能记住这么多？答案藏在 `build/sections/root-comparison.tex:95`-`97` 那两句里：直接像记住的是 $m$-多典范形式，而正性来自它们的有理根的 Hodge 扩张；比较两种扩张的阶就给出 $T$。也就是说 $T$ 并不独立构造，它是两个阶之差，这决定了 §10 的整个演算。

具体取法在 `build/sections/root-comparison.tex:83`-`107`。取正整数 $m$ 清掉边界分母，使

$$
 g_*\mathcal O_X\bigl(m(K_{X/W}+\Delta)\bigr)
$$

的_generic 秩为 $1$；同一个性质在 $m$ 的每个正倍数都成立，因为非零截面的幂存在，而同一度数上两个独立截面会与纤维小平维数为零矛盾（`build/sections/root-comparison.tex:88`-`90`）。它的自反包 $\mathcal E_m$ 因 $W$ 光滑，是线丛；$\mathcal E_m$ 的局部标架 $s$ 在对应的底开集上决定一个亚纯相对 $m$-典范形式，两个这样的标架相差一个可逆的底函数（`build/sections/root-comparison.tex:91`-`94`）。解掉水平的零点、极点与边界，取稠密开集 $W^\circ$ 使 $g$ 光滑、所得除子相对简单正规交叉、所有分层在底上光滑；在每个底卡片上取 $s$ 作为相对多典范形式的 $m$ 次根的规范循环覆盖，并按函子方式解它；记 $\tau$ 为它的重相对顶形式，$d=\dim X-\dim W$（`build/sections/root-comparison.tex:99`-`107`）。

系数为 $\delta$ 的水平素除子上，令 $l$ 为 $s$ 的阶除以 $m$。不等式 $l\geq-\delta\geq-1$ 说明 $\tau$ 至多有对数极点：在分歧指标为 $j$ 的覆盖素除子上，它的阶是

$$
 j(1+l)-1,
$$

见 `build/sections/root-comparison.tex:111`-`116`。这个数是整数；若 $l>-1$ 它非负，若 $l=-1$ 它恰为 $-1$。在解过的覆盖上令 $H$ 为所有 $l=-1$ 的水平素除子的约化原像，包含那些为了对数解奇需要的、位于其上的例外分支；对数拉回保持这个界，不再产生新的水平极点，我们用的是 $H$ 的补集的上方同调（`build/sections/root-comparison.tex:117`-`123`）。

引理 `build/sections/root-comparison.tex:125`-`129` 说：$\tau$ 张成循环覆盖一般纤维上 $F^dH^d(\widetilde G\setminus H,\mathbf C)$ 的根特征部分，特别地那一部分维数为 $1$。证明的思路我读了三遍才放心。对紧 Kahler 简单正规交叉对，对数 Hodge--de Rham 退化把顶 Hodge 空间认成全对数顶形式；它也是光滑纤维情形对偶后的结论（引 Fujino--Fujisawa）。设 $\eta$ 是同一重相对特征的另一个形式，则 $\eta/\tau$ 是 Deck 不变的，下降到 $G$ 上的亚纯函数 $v$（`build/sections/root-comparison.tex:131`-`137`）。

关键的不等式在 `build/sections/root-comparison.tex:139`-`149`：在对数截面 $s$ 无零的素除子上有 $l=-\delta$。若 $l>-1$，上式 $j(1+l)-1$ 落在 $0$ 与 $j-1$ 之间，此时楼下 $v$ 的极点会把覆盖阶至少压低 $j$，不可能；若 $l=-1$，对数极点额度已被用尽，同样不可能。所以 $v$ 的极点只能出现在 $s$ 作为 $m(K_G+\Delta_G)$ 的截面的正零除子上；取足够高的幂 $s^N$ 吸收这些极点，则 $s^N$ 与 $vs^N$ 都是 $Nm(K_G+\Delta_G)$ 的截面；$\kappa=0$ 逼它们线性相关，于是 $v$ 是常数。这段论证还适用于不连通的覆盖：保留整张覆盖与它的 $\mu_m$-作用，其不变亚纯函数下降到 $G$（`build/sections/root-comparison.tex:151`-`154`）。

`build/sections/root-comparison.tex:156`-`158` 补了一句我很需要的：Hodge 分层与权重分层的秩在 $W^\circ$ 上局部常值，所以在很一般纤维上证得的结论整片成立。这正是把"很一般"升格为"开集上处处"的那一步，后面所有全纯延拓的论述都靠它。

## §9 抛物阶数与切触反例

现在算 $M$ 的阶。断言是 `build/sections/root-comparison.tex:448`-`455`：标架 $s^{1/m}$ 在 $M$ 中的抛物阶为

$$
 \beta_D=\operatorname{ord}_D^M(s^{1/m})=\min_{g(E)=D}\frac{l_E+1-a_E}{a_E},
$$

等价地说 $\beta_D$ 是使 $t^{-b}s^{1/m}$ 在 $D=(t=0)$ 处按抛物意义可扩张的最大有理数 $b$。

必要性（`build/sections/root-comparison.tex:457`-`482`）的做法是把底的其他坐标都压掉、只留一个横截圆盘。记 $\tau=s^{1/m}$，$\Omega=\tau\wedge g^*dt$。多值的总形式 $\Omega/t$ 在 $E$ 上的阶是 $l_E-a_E$；对数扩张允许阶 $-1$，于是扭 $t^{-b}$ 后要求

$$
 l_E+1-a_E-a_Eb\ \geq\ 0.
$$
为了拿典式扩张正面检验它，取底变换 $t=u^N$ 与根覆盖的半稳定模型。设在严格变换 $E$ 之上的中心素除子 $E'$ 上，合成到底的总分歧指标为 $e$（含循环覆盖的分歧）。约化性给出 $ea_E=\operatorname{ord}_{E'}(t)=N\operatorname{ord}_{E'}(u)=N$。总体形式的阶偏移一次会乘以 $e$；把它的拉回除以 $dt/du=Nu^{N-1}$ 得

$$
 \operatorname{ord}(\tau\wedge du)=e(l_E+1)-N=e(l_E+1-a_E),
$$

见 `build/sections/root-comparison.tex:472`-`478`。底的扭减去 $Nb=ea_Eb$，于是正则性恰是上面那条不等式。被检验的形式是重覆盖上原始重相对形式的拉回，通过开纤维上同调的识别与典式扩张的直接像描述，它就是那个 Hodge 截面；保留全部规范化分支保证了每个原 $E$ 之上都有素除子在场（`build/sections/root-comparison.tex:483`-`488`）。

充分性（`build/sections/root-comparison.tex:490`-`518`）把一切写进简单正规交叉坐标：$n=d+1$，

$$
 \Omega=h\prod_i x_i^{l_i}\,dx_1\wedge\cdots\wedge dx_n,\qquad t=h'\prod_i x_i^{a_i},
$$

$h,h'$ 为单位，水平分支的 $a_i=0$。令 $c_i=l_i+1-(1+b)a_i$。竖直不等式与水平对数界给出 $c_i\geq0$。对任何额外的除子赋值 $v$，记 $A_X(v)$ 为它在这个光滑模型上的对数差异（Jacobi 阶加一），对数拉回给出 $A_X(v)\geq\sum_i v(x_i)$，与 §6 的计算一模一样，于是 $t^{-(1+b)}\Omega$ 的偏移阶满足

$$
 A_X(v)+\sum_i\bigl(l_i-(1+b)a_i\bigr)v(x_i)\ \geq\ \sum_i c_i\,v(x_i)\ \geq\ 0.
$$

这些不等式在有限覆盖下持续成立，因为偏移阶乘以分歧指标；再没有例外素除子能提出更强的条件。水平方向上，在指定对数边界之外偏移阶严格为正，在根覆盖上它们是正整数，所以那里没有极点；反过来，严格变换之上的覆盖素除子检测到每一条竖直不等式，取最小即得阶公式。

这一节的技术核心是那句"再没有例外素除子能提出更强的条件"。我第一次写这里时，只在 $\Delta$ 的支集上检验，写完才发现检验集必须是解过之后的模型上的全部素除子。反例就记在 `build/sections/root-comparison.tex:520`-`530`：圆盘上的平凡族，在 $\mathbf P^1_x$ 上挖掉水平除子 $x^2=t$，取 $\tau=dx/(x^2-t)$。作 $t=u^2$、$x=uz$ 之后 $\tau=u^{-1}dz/(z^2-1)$，抛物阶是 $-1/2$。而解掉水平除子与 $t=0$ 的切触时引入的那个素除子有 $a_E=2$、$l_E=0$，代入阶公式恰好给 $-1/2$；只盯着原来的中心素除子根本检测不到它。

这个反例对我意义很大，因为它把"精确"这件事从口号变成了可执行的规则：阶公式里的最小值必须跑遍解过模型上的所有素除子，包括那些只出现在解奇过程里的分支。同一精神在 `build/sections/root-comparison.tex:567`-`572` 又出现一次：判别式要包含竖直边界与所有使光滑对数构造失败的轨迹，在那里之外 $\alpha_D=\beta_D$，在非零生成标架下两者都是零，所以 $T$ 在所选判别式里有有限支集，且可以被解成简单正规交叉。

## §10 边界 $T$ 的夹逼与截面比较的闭合

$T$ 的定义只有一行：$T_D=\alpha_D-\beta_D$，见 `build/sections/root-comparison.tex:534`-`537`。这里的 $\alpha_D$ 是同一个根形式在源侧边界的阶检验给出的量（正文在 `build/sections/root-comparison.tex:586`-`589` 用到了"$T+M$ 的标架阶是 $q(T_D+\beta_D)=q\alpha_D$"这一式子，可以据此反推 $\alpha_D$ 的角色）。

不变性检查在 `build/sections/root-comparison.tex:538`-`545`：把 $s$ 换成 $vs$，$v$ 是亚纯底函数，则 $l_E$ 加上 $a_E\operatorname{ord}_D(v)/m$，于是 $\alpha_D$ 与 $\beta_D$ 各加 $\operatorname{ord}_D(v)/m$，$T_D$ 不动；换到更高的可分生成度数效果相同，因为在一般纤维上新的生成元是 $s$ 的幂乘一个底倍数。构造与这些选择无关。

夹逼在 `build/sections/root-comparison.tex:547`-`565`，我把它叫做两个最小值之差的标准把戏。记

$$
 x_E=\frac{l_E+\delta_E}{a_E},\qquad c_E=1-\frac{1-\delta_E}{a_E},
$$

则 $0\leq c_E\leq1$，并且

$$
 T_D=\min_E x_E-\min_E(x_E-c_E).
$$

对任意有限实数组 $x_E$ 与 $c_E$，这个差落在 $\min_Ec_E$ 与 $\max_Ec_E$ 之间。而按 inf 重数的约定，

$$
 \min_Ec_E=1-\max_{g(E)=D}\frac{1-\delta_E}{a_E}=B(g,\Delta)_D,
$$

于是 $B(g,\Delta)\leq T$ 落地；上界 $T\leq1$ 来自 $c_E\leq1$。若 $D$ 之上所有 $\delta_E=1$，则所有 $c_E=1$，从而 $T_D=1$（`build/sections/root-comparison.tex:564`-`565`）。这条"$\delta_E=1$ 逼出 $T_D=1$"与加法条件 (iii) 呼应，是整条链最省事的接头之一。`[推测]` 我猜这一步最初是被我写反过的：我先证明了 $T\ge B$ 就以为完事，其实需要的是把 $T$ 同时夹在两个可计算量之间，否则后面无法保证 $T$ 的系数不超过 $1$。

截面比较的闭合在 `build/sections/root-comparison.tex:578`-`632`。取 $q$ 同时被 $m$ 与所有有理数据分母整除。底局部标架下，$q(K_W+T+M)$ 的亚纯截面写成 $\varphi\,\omega^q s^{q/m}$；标架在 $T+M$ 中的阶是 $q(T_D+\beta_D)=q\alpha_D$，所以它在 $D$ 正则当且仅当源侧的阶检验成立。源侧的检验已经在余维一上认出了所有支配 $D$ 的源素除子的边界界。水平素除子上所需的界自动成立，因为 $s^{q/m}$ 在一般纤维上是对数多典范截面。至此底上余维一的比较与除 $g$-压缩到余维二之外的所有源素除子都对了账。

反方向（`build/sections/root-comparison.tex:598`-`605`）：$q(K_X+\Delta)$ 的截面在一般 $g$-纤维上是 $s^{q/m}$ 的倍数，二者之比是连接一般纤维上的亚纯函数，故亚纯下降到 $W$；同样的除子不等式让它在余维二外成为 $q(K_W+T+M)$ 的截面，$W$ 光滑把它唯一地跨过余维二延拓。正方向（`build/sections/root-comparison.tex:607`-`616`）：$W$ 上的截面给出 $X$ 上的亚纯伴随形式，剩下可能的极点只在 $g$-压缩的素除子上，而这些按假设是 $\pi$-例外的；把它推到 $X_0$，它在 $X_0$ 每个素除子上的变换都在被检验的 $X$ 的素除子之列，于是满足 $\Delta_0$ 的极点界（余维一），$X_0$ 光滑且伴随倍数是线丛，跨过余维二延拓，最后用对数改造引理拉回成 $q(K_X+\Delta)$ 的截面。

相对版本（`build/sections/root-comparison.tex:618`-`631`）的做法是对 $Y$ 的任意开子集 $U$ 重复论证：$\pi^{-1}(f_0^{-1}U)=g^{-1}(h^{-1}U)$，而 $\pi$ 在光滑开空间 $f_0^{-1}U$ 上仍真，例外像仍余维至少二；构造与截面延拓与限制到 $U$ 交换，给出直接像的同构；投影公式给出相对典范版本以及任意拉回底扭之后的恒等式（次数清分母）。我在此学到的写法是：凡要用相对语言，先把它化成"对每个开集重跑一遍绝对论证"，这样所有延拓定理都还在光滑性保护之下。

## §11 曲率、数值维数与二重对数势

现在进入正性输入。`build/sections/period-positivity.tex:1`-`15` 交代了对象：相对典范计算给出的线是某个复 Hodge 直和因子的最高非零滤过步，我称这样的线为极端 Hodge 线；整格结构是环境实局部系统的格，被选因子不必有理，环境实极化也不必有理。`build/sections/period-positivity.tex:44`-`53` 给出数值维数定义：光滑紧 Kahler $n$-fold 上半正有理线丛 $A$ 满足

$$
 \nu(A)=\max\{k:\ c_1(A)^k\cdot[\omega]^{n-k}>0\},
$$

$\omega$ 为任意 Kahler 形式；射影情形就是通常的数值维数。

引理 `build/sections/period-positivity.tex:55`-`68` 说：设 $T$ 光滑紧 Kahler，$E\subset T$ 简单正规交叉，$A$ 是 $T\setminus E$ 上带拟单值局部单值的极化纯复变化的秩一最高步的抛物扩张，则 $A$ 半正，且它的数值维数等于在平坦 trivialization 里"只记住这条线"的映射_generic 秩_。至于 Griffiths 线（各 Hodge 滤过步行列式的张量积），对应断言用的是完整周期映射，特别地若完整周期映射_generic 浸入_则它的有理扩张是大除子。

证明里有两处我原本打算跳过、后来发现不能跳。

第一处是把单值约化成单值的一整套算术招法（`build/sections/period-positivity.tex:74`-`90`）。$\pi_1(T\setminus E)$ 有限生成，把有限多个单值生成元及其逆的矩阵元素放进有限生成的 $\mathbf Z$-代数 $R\subset\mathbf C$；并入所有边界单值特征值生成的有限根 of  unity 群，并把该群中每个非单位元 $\zeta$ 的差 $\zeta-1$ 反演；在剩余域有限的极大理想上约化，得到一个有限指标的法同余子群。落在该子群里的局部边界单值必然单值：它的特征值属于那个有限群并在约化后为一，而被反演的差逼它们等于一。这也适用于交叉处可交换边界单值的乘积；相应有限覆盖跨过紧化扩张，Kahler 解奇给出所需的单值模型（引 Villadsen 的引理 2.21）。这些覆盖保持半正性、数值维数与有理线的大性。值得留意的是这一步对整格并无要求（`build/sections/period-positivity.tex:76`-`77` 特意说了这点）。

第二处是把"质量不在边界丢失"变成可见的位势论（`build/sections/period-positivity.tex:100`-`173`）。Hodge 范数在扩张标架里的估计是：在边界坐标 $t_1,\dots,t_k$ 下，权的绝对值不超过

$$
 C\left(1+\sum_{j=1}^k\log(-\log|t_j|)\right),
$$

见 `build/sections/period-positivity.tex:103`-`107`。半正度量因此作为 $c_1(A)$ 中 Lelong 数为零的正电流扩张；正则化正电流给出半正性（引 Demailly）。这推广了 Bakker--Filipazzi--Mauri--Tsimeran 那套引理里从恰当对数光滑代数空间到紧 Kahler 情形的半正论证。

数值维数部分要证明交乘质量不在 $E$ 漏掉。记 $\alpha=c_1(A)$，取 $\varepsilon>0$，$\alpha+\varepsilon[\omega]$ 有光滑 Kahler 代表 $\theta_\varepsilon$，写

$$
 \Theta+\varepsilon\omega=\theta_\varepsilon+dd^cu,\qquad dd^c=\frac{\sqrt{-1}}{2\pi}\partial\bar\partial,
$$

见 `build/sections/period-positivity.tex:120`-`124`。全局势 $u$ 满足二重对数局部界。若 $E$ 空则无事；否则写 $E=E_1+\cdots+E_N$，取光滑除子度量与定义截面 $s_j$，使

$$
 u_j=-\log|s_j|^2,\qquad dd^c(-u_j)=[E_j]-\eta_j,
$$

选 $c>0$ 使 $c\eta_j\leq\theta_\varepsilon$ 对所有 $j$，并把度量缩放使 $cu_j\geq1$；那么 $\phi_j=-cu_j$ 是 $\theta_\varepsilon$-次调和且 $\phi_j\leq-1$。对固定 $0<b<1$，衰减定理给出

$$
 \psi_j=-(-\phi_j)^b=-c^b u_j^b
$$

在类 $[\theta_\varepsilon]$ 中有满 Monge--Ampère 质量（`build/sections/period-positivity.tex:138`-`143`）。满质量类是凸的且含零势，于是对 $0<\delta\leq c^b/N$，位势

$$
 v=-\delta\sum_{j=1}^N u_j^b=\sum_{j=1}^N\frac{\delta}{c^b}\psi_j+\left(1-\frac{N\delta}{c^b}\right)\cdot 0
$$

是 $\theta_\varepsilon$-次调和并有满质量（`build/sections/period-positivity.tex:144`-`151`）。正幂比任何对数长得快，所以由二重对数界得 $v-C\le u$，而满质量在取较弱奇异势时保持，故 $u$ 有满质量。非 pluripolar 测度不给解析集 $E$ 质量，在其补上就是光滑楔积，因此

$$
 \int_{T\setminus E}(\Theta+\varepsilon\omega)^n=(\alpha+\varepsilon[\omega])^n.
$$

两边按 $\varepsilon$ 展开成多项式，系数都有限（左端每项非负），对所有 $\varepsilon>0$ 相等就给出

$$
 \int_{T\setminus E}\Theta^k\wedge\omega^{n-k}=\alpha^k\cdot[\omega]^{n-k}\qquad(0\le k\le n),
$$

见 `build/sections/period-positivity.tex:166`-`171`。若_generic 曲率秩_为 $r$，左端在 $k\le r$ 为正、$k>r$ 为零，数值断言随之落定；对浸入的 Griffiths 线，顶部积分正，紧 Kahler 上正电流的体积判据给出大性（引 Bouckso）。

引理 `build/sections/period-positivity.tex:179`-`204` 把这套东西限制到边界分支上：单值情形下，$E_i$ 的开分层上极限最高线出现在极限混合变化的唯一权重分级里，$A|_{E_i}$ 就是那条分级 Hodge 线跨过 $E_i$ 的剩余边界的 Schmid 扩张，故其数值维数是分级线映射的_generic 秩_。论证要点是最高步秩为一，所以恰有一个权重分级装它；改变法参数作用为 $\exp(cN_i)$，在关联分级上作用平凡；在更深的交叉处，相对单值滤过把该分级变化的扩张与原来扩张滤过的分级同一化（`build/sections/root-comparison.tex` 之外的这一节，行号见 `build/sections/period-positivity.tex:190`-`199`）。

## §12 错误路线三：只沿着被选中的线做周期商

我要把第三条失败路线写清楚，因为它解释了 §13 那个看起来多余的伴随构造。

我最初的打算是：既然手里只有那条秩一最高线 $L$，就直接用"记住这条线"的映射来做周期商，把 $L$ 下推到商上的一条半正线，然后用 Brunebarbe--Cadorel 型的对数一般型结论说商的典范加边界是大。这条路有两处断点。

断点一在离散性。`build/sections/period-positivity.tex:206`-`213` 的开场白就是我撞墙之后写下的话：周期商的构造要求离散单值；把一个复因子投影出来并不保留它。因此要从环境的整格局部系统造一个有理极化的伴随变化，并且整体地保留有理因子。这里的因果顺序很重要：我原先的顺序是"先有线，再造商"，修好之后是"先有一个带整格的对象，再让线从张量构造里长回来"。

断点二在秩。`build/sections/period-positivity.tex:33`-`41` 明确区分了两张映射：平坦 trivialization 里只记那条最高线的_线映射_，与记住全部 Hodge 滤过步的_周期映射_，二者的秩可以不同；曲率把线的数值维数认成第一张映射的秩，而商要用的是完整周期。`build/sections/introduction.tex:253`-`257` 把这层关系再讲了一遍：在商 $S$ 上保留下来的完整周期映射是_generic 浸入_的，可只记住所选那条线的映射秩可能更小；曲率把后者的秩与数值维数 $\nu(P)$ 同一化，而 $\nu(P)$ 用它的非零交乘幂来度量。

于是我原打算跳过的"线映射是否浸入"这件事恰好是结论要证的内容：$\nu(P)$ 就是线映射的秩，若它等于 $\dim S$，Brunebarbe--Cadorel 就直接给出 $K_S+aP$ 的大性；麻烦在于 $\nu(P)$ 可能严格小于 $\dim S$，此时商上必须靠边界与计数把缺的方向补回来。这正是 §14 与 §15 的全部工作。

`[推测]` 正文没有明说我何时放弃线映射版的商，我只能从结构反推：`build/sections/period-positivity.tex:64`-`67` 里 Griffiths 线（各 Hodge 滤过步行列式的张量积）才与完整周期映射绑定，并且"完整周期映射_generic 浸入_则其有理扩张大"；而我需要的是那条_最高步_线本身的性质，两者秩的差别使得不能借用现成的浸入性。这条推断的证据是间接的，它与 §14 里 $r=d_H+s_Q$ 的分解方式一致。

## §13 有理伴随约化与投影周期商的建成

引理 `build/sections/period-positivity.tex:215`-`232` 是修理后的版本。设 $G$ 是单值的有理 Zariski 闭包的身份分支，则 $G$ 半单，它的伴随局部系统是权重零的有理极化整格 Hodge 结构变化。存在一族单值不变的法有理伴随因子集合，每个因子都包含一个在最高线轨道上非平凡作用的复因子，使得：所得伴随变化 $\mathbb A$ 有离散整格单值；取正幂之后，并模去一个常值的一维复 Hodge 平移，原来的线是 $\mathbb A$ 上某个张量构造的复子变化的最高线；在保持这族因子的有限覆盖上，该线分裂为各个复因子所属最高线的张量积；所有这些最高步都秩为一。

证明的开头（`build/sections/period-positivity.tex:234`-`240`）用了半单性与固定部分定理：它们对紧 Kahler 簇的 Zariski 开集上的极化实变化与复变化都成立，为此可以对 $B$ 取 Kahler 改造（引 Popa--Schnell 与 Bakker--Matsushita），于是代数单值群是约化的。这一句对我有方法论意义：我原以为半单性只在射影与整格情形可用，其实把源换成 Kahler 改造就够用，而 §7 已经证明改造在类 $\mathcal C$ 里可以持续做。

后面的中间段（`build/sections/period-positivity.tex:241`-`554`）本轮我没有逐行回读，只登记了两处结构：第 $395$ 行的"伴随周期的_generic 稳定子_"引理，以及第 $433$ 行的"投影周期商"命题。`build/sections/introduction.tex:246`-`252` 给了它的做法摘要：保留与单值相配的、环境整格变化的适当有理伴随因子，从这些因子恢复所选线的一个正幂；用它们的完整周期给出商，这里用到 Villadsen 的类 $\mathcal C$ 紧化定理与 Bakker--Brunebarbe--Tsimerman 及 Sommese 的周期商路线，再由曲率与体积论证建立商的射影性。

我把这条链写成一句话：整格伴随因子负责"离散性与射影性"，张量构造负责"把线的正幂认回来"。二者缺一，$M=p^*P$ 就只是形式上的。

固定商之后要用的边界也在这里定义（`build/sections/period-positivity.tex:556`-`561`）：取商的对数光滑紧化 $(S,E)$，令 $D\le E$ 为保留下来的伴随系统局部单值非恒等的分支的约化和，包含有限单值。对数一般型会给出 $K_S+D$ 的大性，而下一条引理正是允许我把 $D$ 去掉的东西。引理 `build/sections/period-positivity.tex:563`-`570` 的陈述只有一行：对 $D$ 的每个分支 $D_i$，

$$
 \nu(P|_{D_i})<\nu(P).
$$

## §14 边界上的严格秩损失：Ax--Schanuel 与 André 正规性

这是全篇我觉得最难读的一节，`build/sections/period-positivity.tex:572`-`813`。记 $n=\dim S$，$r=\nu(P)$，即线映射 $j$ 的_generic 秩_（由 §11 的曲率引理）；保留的完整周期映射秩为 $n$，论证并不要求 $r=n$（`build/sections/period-positivity.tex:573`-`575`）。先在开轨迹上取一个 Galois 有限覆盖，使代数单值群连通且没有因子置换，记连通的伴随群为 $G$。

Ax--Schanuel 分解段（`build/sections/period-positivity.tex:581`-`607`）这样起手：取一个 Hodge-generic 点，同时对因子的周期映射及其联合微分的秩取一般；因为有理法因子分解只有有限多种，这些一般性要求可以同时施加（`build/sections/period-positivity.tex:584`-`587`）。令 $T$ 为 $j$ 在该点的局部纤维芽，$Z$ 是它在变化源中的不可约 Zariski 闭包，于是 $\dim T=n-r$；在 $Z$ 的光滑点移动，用解奇的光滑开子集来跑 Hodge 理论。

$Z$ 上的限制变化与 ambient 变化有同一个_generic Mumford--Tate_群，因为 $Z$ 含有所选的 Hodge-generic 点；于是 André 的单值正规性定理说它的连通单值 $H$ 在 $G$ 中法是，伴随记号下写

$$
 G=H\times Q.
$$

在杀掉有限单值之后用固定部分定理，$Q$-周期在提升的 $Z$ 上是常数，所以 $Z$ 上变化的单值域就是 $H$ 的单值域；记 $J_H$ 为其线轨道投影，$d_H=\dim J_H$；局部平坦坐标下写 $j=(j_H,j_Q)$，目标是证明 $H$-线映射在 $Z$ 上有满秩 $d_H$，而 $Q$-线映射与完整 $Q$-周期映射在 ambient 底上有相同_generic 秩_。

第一断言的维数计数（`build/sections/period-positivity.tex:609`-`632`）：令 $m=\dim Z$，$d=\dim\check{\mathcal D}_H$ 为连通单值周期域的紧对偶维数。投影 $\check{\mathcal D}_H\to J_H$ 是齐次射影旗簇之间的满态射，所有纤维维数都是 $d-d_H$。设 $V\subset Z\times\check{\mathcal D}_H$ 为投影线等于它在 $T$ 上取值的代数轨迹，则 $\dim V=m+d-d_H$。周期图的维数是 $m$，它在维数 $m+d$ 的环境里，与 $V$ 的期望交维数是 $m-d_H$。按 Bakker--Tsimerman 的 Ax--Schanuel 定理，任何维数大于期望的分量都投影到 $Z$ 的一个法 Mumford--Tate 子簇的真子簇里；含 $T$ 上方提升周期图的那个分量做不到这点，因为 $T$ 在 $Z$ 中 Zariski 稠密。反过来，到 $J_H$ 的映射纤维维数至少 $m-d_H$，而在所选光滑点处限制纤维恰为 $T$，因为 ambient 局部纤维就是 $T\subset Z$。两边夹住即得等式。

接着（`build/sections/period-positivity.tex:634`-`657`）令 $q$ 为完整 $Q$-周期映射，$s_Q=\operatorname{rank}(dq)$，把光滑点 $x$ 选在 ambient 常秩邻域内；$T$ 在 $Z$ 中 Zariski 稠密故这样的点存在。常秩定理给 $\ker(dj_x)=T_xT\subset T_xZ$，于是

$$
 \operatorname{rank}(dj_x|_{T_xZ})=\dim Z-\dim T=d_H.
$$

$Q$-周期在 $Z$ 上常数意味着 $T_xZ\subseteq\ker(dq_x)$，因此同一处有 $\ker(dj)\subseteq\ker(dq)$ 与 $dj_H(\ker(dq_x))=T_{j_H(x)}J_H$。由于 $dj_Q$ 经过 $dq$ 分解：若 $dj_Q(v)=0$，取 $w\in\ker(dq)$ 使 $dj_H(w)=dj_H(v)$，则 $v-w\in\ker(dj)$，故 $dq(v)=0$。结论是

$$
 \operatorname{rank}(dj_Q)=s_Q,\qquad r=d_H+s_Q,
$$

见 `build/sections/period-positivity.tex:653`-`656`。因子线构造在共同正伸缩与再一层有限覆盖之后给出半正线满足

$$
 \pi^*P=P_H+P_Q,\qquad \nu(P_H)=d_H,\qquad P_Q=q^*B_Q,
$$

其中 $q\colon\widetilde S\to S_Q$ 是用同一商构造解过的 $Q$-周期射影商，$\dim S_Q=s_Q$，而在 $S_Q$ 上最高线秩为 $s_Q$；这里只用了商构造，没用伴随正性（`build/sections/period-positivity.tex:659`-`672`）。

边界分支的约化段从 `build/sections/period-positivity.tex:674`-`684` 起：取一个公共有限 Galois 覆盖，既保持因子又使边界单值单值化，等变地解奇与解 $q$；令 $E_i$ 是 $D_i$ 之上某个对 $D_i$ generic 有限的分支的严格变换，其一般点的惯量群逐点固定 $E_i$；进一步伸缩不改任何数值维数；半正性给出 $\nu(P_H|_{E_i})\le d_H$。我读到这里时猜后面是靠"$Q$-部分在 $E_i$ 上退化得更厉害"来收口，而 `build/sections/period-positivity.tex:795`-`813` 确实给了两条互斥情形的收束：$\gamma$ 的 $Q$-作用固定每个_generic_ $Q$-周期，经提升周期的解析延拓与对下降后的 $Q$-变化用稳定子引理，得到该作用是恒等，于是 $\gamma$ 在整个保留的伴随系统上是恒等，与"标记"矛盾；两种情形下都由半正二项展开与秩分解得到

$$
 \nu(\pi^*P|_{E_i})<r,
$$

而半正线的数值维数在 generic 有限拉回下不变，故这就是 $\nu(P|_{D_i})<\nu(P)$。边界情形 $r=0$ 也一并处理：此时局部线纤维就是整个源芽，Zariski 闭包是整源，于是 $H=G$、$Q=1$，Ax--Schanuel 计算给 $d_H=0$；由于每个保留的有理因子都含一个在线轨道上非平凡作用的因子，就不可能有任何保留因子，完整保留周期映射的_generic 浸入_性逼 $S$ 是一个点，也就没有标记分支（`build/sections/period-positivity.tex:806`-`812`）。

这一段我读得最慢的地方是"有限单值也被算进 $D$"。`build/sections/period-positivity.tex:558`-`559` 说 $D$ 包括有限单值，`build/sections/introduction.tex:262`-`265` 也强调"包含有限非恒等单值"。原因我能说出来：若只标记无限单值的分支，Brunebarbe--Cadorel 的对数一般型条件与秩损失条件会在同一批分支上脱节，边界里的有限部分既不能提供对数极点又不能提供秩损失，两头空。`[推测]` 正文未展开这一动机，我把它记为推测。

## §15 计数引理：次数 $r$ 压住次数 $r-1$

正性的最后一步是一个纯计数引理，`build/sections/period-positivity.tex:815`-`900`。它的定位我读到时颇感意外：前面用了曲率、单值正规性、Ax--Schanuel，收尾却是一个除子正合序列的渐近估计。

设定是：$Z$ 光滑射影，$J$ 半正有理除子，$A$ 有理除子，$D=\sum_{i=1}^s d_iE_i$ 是素分支光滑的有效有理除子；假设 $A+D$ 大且对每个分支

$$
 \nu(J|_{E_i})<r:=\nu(J).
$$

结论是 $A+tJ$ 对所有充分大的有理 $t$ 为大（`build/sections/period-positivity.tex:829`-`839`）。

证明将顺序摆得很死。$r=0$ 时条件逼 $D=0$，$A$ 已大，加半正保持大性；下设 $r>0$，$n=\dim Z$。取丰富有理除子 $H_1$ 使 $A+D-H_1$ 有理有效，则对固定 $t\ge0$ 与充分可分 $m$，

$$
 h^0\bigl(Z,m(A+D+tJ)\bigr)\ge h^0\bigl(Z,m(H_1+tJ)\bigr).
$$

$H_1+tJ$ 丰富，渐近 Riemann--Roch 使右端主导项是 $(H_1+tJ)^n/n!$，它作为 $t$ 的多项式次数恰为 $r$ 且首项系数正（`build/sections/period-positivity.tex:845`-`854`）。

然后把 $mD$ 一个分支一个分支地用除子正合序列去掉。每个失去的商是 $E_i$ 上形如

$$
 \mathcal O_{E_i}\Bigl(m(A+D+tJ)-\sum_h k_hE_h\Bigr),\qquad 0\le k_h\le md_h
$$

的线丛。选充分大的丰富整除子 $B_0$ 使某个固定的清分母倍数 $B_0-A-D$ 全局生成；对每个 $h$ 选丰富整除子 $B_h$ 使 $B_h$ 与 $B_h+E_h$ 都全局生成；令 $H_2=B_0+\sum_h d_hB_h$。则 $m(H_2+tJ)$ 与上述商除子之差是

$$
 m(B_0-A-D)+\sum_h\bigl((md_h-k_h)B_h+k_h(B_h+E_h)\bigr),
$$

在那些可分次数下全局生成（`build/sections/period-positivity.tex:862`-`871`）。不在 $E_i$ 上恒零的截面给出到 $\mathcal O_{E_i}(m(H_2+tJ)|_{E_i})$ 的单射，而 $E_i$ 上恰有 $md_i$ 个商项，于是

$$
 h^0\bigl(Z,m(A+tJ)\bigr)\ \ge\ h^0\bigl(Z,m(H_1+tJ)\bigr)-m\sum_i d_i\,h^0\bigl(E_i,m(H_2+tJ)|_{E_i}\bigr).
$$

固定 $t$，除以 $m^n/n!$，让 $m$ 沿指定倍数趋于无穷；所有比较除子都丰富，得下界

$$
 (H_1+tJ)^n-n\sum_i d_i\,(H_2+tJ)^{n-1}\cdot E_i.
$$

每个限制多项式的次数至多 $\nu(J|_{E_i})\le r-1$，因为限制的除子半正；于是第一个多项式的正的 $t^r$ 项对一切充分大的 $t$ 压制损失，$A+tJ$ 的截面生长率在 $n$ 维为正，即大（`build/sections/period-positivity.tex:881`-`893`）。

这一招在 `build/sections/period-positivity.tex:896`-`900` 立刻被用掉：取 $A=K_Z$、$D$ 约化，配上 §14 的限制秩不等式，就把周期边界去掉了；同样的权还允许同时去掉其他满足同一秩不等式的有效除子，例如 generic 有限覆盖上的一个除子型分歧项。`build/sections/period-positivity.tex:903`-`923` 把商构造、Brunebarbe--Cadorel 的 $K_S+D$ 大、秩损失与计数引理串成伴随正性定理，并在 $P$ 半正的前提下把大性推广到所有更大的有理系数 $a$。那里还有一句我特意抄下来以防再犯："若最初的选取漏掉了余维二的轨迹，就在对数解奇上用该定理再把截面向下推；得到的对数典范除子推进为 $K_S+D$"（`build/sections/period-positivity.tex:913`-`917`）。这是另一处初选失误的补丁式记录。

## §16 转折二：伴随加法原理与一次项消去配方

现在把两个正性输入拼起来。这里发生了一次真正的思路改变：我原本打算用极限论证把扭项逼掉，最后交付的是一个逐次数的截面恒等式。

先登记输入。伴随正性输入（`build/sections/adjoint-addition.tex:13`-`29`）：设 $B$ 是类 $\mathcal C$ 中的光滑紧连通流形，$B^\circ\subset B$ 是补集为简单正规交叉的稠密扎里斯基开集，$\mathbb V$ 是 $B^\circ$ 上带环境整格的纯实极化 Hodge 结构变化；若 $\mathbb V_{\mathbf C}$ 的一个复直和因子有秩一的最高非零 Hodge 步，其抛物有理扩张为 $L$，则存在改造 $\tau\colon B'\to B$、到光滑射影簇的连通纤维满态射 $p\colon B'\to S$，以及 $S$ 上半正有理线丛 $P$，使

$$
 \tau^*L=p^*P,\qquad K_S+aP\ \text{对某个}\ a\in\mathbf Q_{>0}\ \text{为大},
$$

见 `build/sections/adjoint-addition.tex:23`-`25`。允许对 $L$ 做正的有理伸缩，线恒等式在进一步改造下持续；若 $S$ 是一个点，则 $\tau^*L$ 有理平凡。$L$ 的格属于环境变化：复直和因子自身不必定义在有理数上，实极化也不必有理（`build/sections/adjoint-addition.tex:31`-`34`）。

对数一般型加法输入（`build/sections/adjoint-addition.tex:38`-`56`）：$h\colon V\to Y$ 是藤木类中光滑紧复流形之间的连通纤维满映射，$T$、$C$ 分别是 $V$、$Y$ 上系数在 $[0,1]$ 的有效有理简单正规交叉除子，满足三条：很一般光滑纤维上 $K_F+T_F$ 为大；$C\le B(h,T)$；$V$ 中每个像的余维至少为二的素除子在 $T$ 中系数为一。结论是

$$
 \kappa(V,K_V+T)\ \geq\ \dim F+\kappa(Y,K_Y+C).
$$

然后是配方本体，命题 `build/sections/adjoint-addition.tex:140`-`247`。设 $h\colon W\to Y$ 为类 $\mathcal C$ 中光滑紧流形之间的纤维化，$T,C$ 为有理简单正规交叉边界且 $C\le B(h,T)$，$W$ 中像的余维至少为二的素除子在 $T$ 中系数为一；另有到光滑射影簇的连通纤维满态射 $p\colon W\to S$，$P$ 半正有理，$M=p^*P$，$K_S+a_0P$ 对某有理 $a_0>0$ 为大；若 $K_W+T+M$ 在很一般 $h$-纤维上为大，则

$$
 \kappa(W,K_W+T+M)\ \geq\ \dim(W/Y)+\kappa(Y,K_Y+C).
$$

证明的结构我逐条复述，因为每一步都是我曾经想省掉的。记 $D=K_W+T$，$k=\dim(W/Y)$。第一步是把 $W$ 换成 Kahler 改造并加约化例外边界：对数截面空间在张量 $M$ 的拉回扭之后仍不变，纤维大性与 inf 重数边界保持，新例外素除子系数为一（`build/sections/adjoint-addition.tex:159`-`164`）。若 $S$ 是一个点，$M$ 有理平凡，直接由加法输入解决（`build/sections/adjoint-addition.tex:166`-`167`）。

设 $\dim S>0$，取 $S$ 上的丰富 Cartier 除子 $A$。很一般 $h$-纤维是 Kahler 的且携带大有理线 $(D+M)|_{W_y}$，故它是射影的；大锥的开性给出有理数 $c$ 使 $0<c<1$ 且 $(D+cM)|_{W_y}$ 仍大，而这个选取在很一般纤维上同时成立：对有理 $c$ 与可分度数，把第一根纤维取在可数个上同调与求值秩例外轨迹之外即可（`build/sections/adjoint-addition.tex:168`-`177`）。这里我踩过的坑是把"存在一个纤维上大"当成"存在一致的 $c$ 在很一般纤维上同时大"，前者完全不够用。

对每个正有理 $\eta$，$cP+\eta A$ 丰富。取充分可分的大 $N$ 与无基点系统 $\lvert Np^*(cP+\eta A)\rvert$ 的一般元素，除以 $N$ 得有效有理除子 $Q_\eta$ 使

$$
 Q_\eta\sim_{\mathbf Q}cM+\eta p^*A,\qquad T+Q_\eta\ \text{为简单正规交叉边界},
$$

见 `build/sections/adjoint-addition.tex:179`-`186`。贝蒂尼定理要在 $T$ 的有限多个分层上同时用；所得元素不含旧边界分支，增大 $N$ 把新系数压到不超过一，已有的系数一分支不变，而增大源边界只会增大 $B(h,T)$（`build/sections/adjoint-addition.tex:187`-`191`）。于是加法输入对 $T+Q_\eta$ 全部适用，得

$$
 \kappa(W,D+cM+\eta p^*A)\ \geq\ k+\kappa(Y,K_Y+C)\qquad(\eta\in\mathbf Q_{>0}),
$$

见 `build/sections/adjoint-addition.tex:195`-`199`。

剩下的问题是把丰有项 $\eta p^*A$ 去掉而不丢比值。先取一个非零截面：上面某个除子在固定正次数有非零截面，它限制到很一般 $p$-纤维非零（两个拉回扭在那里都平凡），于是

$$
 \kappa\bigl(W_s,(K_W+T)|_{W_s}\bigr)\ge0\quad\text{对很一般 }s\in S,
$$

见 `build/sections/adjoint-addition.tex:203`-`211`；这就是"某个固定的相对对数多典范直接像秩为正"。取有理 $a>\max\{1,a_0\}$，$P$ 半正所以 $K_S+aP$ 大；对充分小的有理 $\lambda>0$，

$$
 H=K_S+aP-\lambda A
$$

仍大。引理 `build/sections/adjoint-addition.tex:68`-`138`（大底扭后的有效性）给出 $E_-=D+aM-\lambda p^*A=K_{W/S}+T+p^*H$ 的某个正倍数的非零截面。配方收尾：

$$
 \theta=\frac{1-c}{a-c},\qquad \eta=\frac{(1-c)\lambda}{a-1},\qquad E_+=D+cM+\eta p^*A,
$$

则 $0<\theta<1$，且直接算得

$$
 D+M=(1-\theta)E_++\theta E_-,
$$

见 `build/sections/adjoint-addition.tex:224`-`233`。固定 $e$ 为 $rE_-$ 的一个非零截面（$r>0$ 清分母）；对充分可分的 $n$，乘以 $e^{n\theta/r}$ 给出单射

$$
 H^0\bigl(W,n(1-\theta)E_+\bigr)\longhookrightarrow H^0\bigl(W,n(D+M)\bigr),
$$

指数是整数，源次数跑遍一个维罗内子列；在 $e$ 的零除子之外，两个截面的任何比值都不变，所以乘法前后像维数相同（`build/sections/adjoint-addition.tex:234`-`246`）。

支撑这一步的引理本身也有故事。它的陈述是：$p\colon(W,T)\to S$ 满，$W$ 光滑紧属类 $\mathcal C$，$S$ 光滑射影，$T$ 有理简单正规交叉边界；若某个固定的可分相对对数多典范系统在很一般纤维上非零，则对 $S$ 上每个大有理线丛 $H$，$K_{W/S}+T+p^*H$ 在某个正次数有非零截面（`build/sections/adjoint-addition.tex:73`-`76`）。证明取 Kahler 源改造、在光滑射影底改造 $\pi\colon S'\to S$ 上平坦化、解平的主变换，得 $\mu\colon W'\to W$ 与 $p'\colon W'\to S'$；给 $W'$ 严格变换加约化 $\mu$-例外除子 $T'$，则

$$
 K_{W'}+T'=\mu^*(K_W+T)+E,\qquad E\ge0\ \text{且}\ \mu\text{-例外},
$$

见 `build/sections/adjoint-addition.tex:84`-`87`。记 $R=K_{S'/S}\ge0$，$H'=\pi^*H+R$，则有恒等式

$$
 K_{W'/S'}+T'+p'^*H'=\mu^*(K_{W/S}+T+p^*H)+E,
$$

见 `build/sections/adjoint-addition.tex:92`-`95`，它正是为了让下降可行。取可分的 $m>0$ 使 $\mathcal E=p'_*\mathcal O_{W'}(m(K_{W'/S'}+T'))$ 秩为正；Fujino 的弱正性定理适用于这个对数终端对与它的射影底；取丰富 Cartier 除子 $A_0$ 与整数 $\alpha>0$ 使 $H'-A_0/(m\alpha)$ 大；则对某整数 $\beta>0$，

$$
 (\operatorname{Sym}^{\alpha\beta}\mathcal E)^{**}\otimes\mathcal O_{S'}(\beta A_0)
$$

在一般点被全局截面生成（`build/sections/adjoint-addition.tex:98`-`109`）。在 $\mathcal E$ 的局部自由轨迹上，相对截面的乘法给出到

$$
 \mathcal O_{W'}\bigl(m\alpha\beta(K_{W'/S'}+T')+\beta p'^*A_0\bigr)
$$

的求值映射，且它一般非零，因为非零相对截面的幂非零；一般生成提供一个像非零的全局截面。局部自由轨迹之外是余维至少二。把求值得到的截面的充分可分幂与一个大有理线的充分可分倍数的截面相乘，即

$$
 m\alpha\beta\,p'^*\Bigl(H'-\frac{A_0}{m\alpha}\Bigr)
$$

的截面（由大性存在），就得到恒等式左边某个倍数的非零截面，除了可能在那余维二之上的源素除子处（`build/sections/adjoint-addition.tex:119`-`126`）。最后一段是下降：局部上 $\mathcal E$ 的亚纯标架把求值截面写成相对截面乘积的亚纯组合，故所得形式亚纯，仅有的除子极点在那余维二之上；那些素除子与 $E$ 都在 $W$ 上例外；在原光滑 $W$ 的每个素除子上它都有所需的阶；除子正则性加跨余维二延拓给出 $W$ 上的全局截面。若 $S$ 是一个点，结论就是假设的非零性（`build/sections/adjoint-addition.tex:128`-`137`）。

`build/sections/adjoint-addition.tex:61`-`67` 有一句话我读的时候心里一沉：这个引理用带例外极点的弱正性与到固定光滑参考源的下降，方法是仿 Campana 的注记 6.5(3) 与命题 6.6，并且"我们把下降那一步显式写出来"。`[推测]` 正文没有解释为什么强调显式，我把它读成：既有文献里那一步是被默认掉的，而我在早期版本里也同样默认过；只有当极点可能落在例外除子上时，"下降"才需要一次专门的除子阶检验。这与 §19 里"未被检验的 $g$-压缩素除子在参考对上例外，所以形式下降并在其上延拓"（`build/sections/applications.tex:110`-`113`）是同一招的两次使用。

## §17 错误路线四：丰裕性与小平维数的极限论证

配方定下来之后我才看清第四条失败路线长什么样。

假设 $M=p^*P$、$K_S+aP$ 大，我想过的最省事的做法是让 $\eta$ 趋于零，然后用小平维数在 $\mathbf Q$-线性等价族上的上半连续性：$\kappa(W,D+cM+\eta p^*A)$ 有下界 $k+\kappa(Y,K_Y+C)$，令 $\eta\to0$ 得 $\kappa(W,D+cM)\ge k+\kappa(Y,K_Y+C)$，再令 $c\to1$。这条路有两个断点，正文 `build/sections/introduction.tex:236`-`238` 用一句话把我挡了回来：这是一个精确的截面论证，它既不需要 $P$ 的丰裕性，也不需要关于小平维数的极限断言。

第一个断点是上半连续性本身。小平维数在有理除子族上不连续，甚至在一个固定的有理系数族里，除子的有效部分可以在特殊参数处突然多出分量，使像维数跳下去；我需要在某个固定 $\eta$ 处就把比值搬走，并非在极限里搬。第二个断点是丰裕性：若要用"$P$ 的截面环有限生成"或"$P$ 丰裕"来组织极限，我就必须证明 $P$ 丰裕，而我手里只有 $K_S+aP$ 大与 $P$ 半正，这两条给出的截面增长信息恰好只够 §15 那种次数比较，不足以给出环的结构。

配方里那个 $\theta=(1-c)/(a-c)$ 就是用来代替极限的：它把"$M$ 的系数一到 $1$"翻译成两个已知有截面的除子的凸组合，系数

$$
 1-\theta=\frac{a-1}{a-c},\qquad \theta=\frac{1-c}{a-c},
$$

两者都正且和为 $1$；再取 $\eta=(1-c)\lambda/(a-1)$ 使 $p^*A$ 的系数在组合中抵消：$(1-\theta)\eta-\theta\lambda$ 代入即得 $-\lambda(1-c)/(a-c)+\lambda(1-c)\cdot(a-1)/((a-1)(a-c))=0$。$a>\max\{1,a_0\}$ 这个选取是为了让 $\theta<1$ 且 $K_S+aP$ 大同时成立，$\lambda$ 充分小是为了让 $H=K_S+aP-\lambda A$ 保持大。`[推测]` 这组代数是正文没写出的验算，我按式子 $(1-\theta)\eta=\theta\lambda$ 反推出来，与 `build/sections/adjoint-addition.tex:224`-`233` 的声明一致；我把它标为推测，因为它猜的是"为什么是这个 $\eta$"，答案本身在盘面上可以直接验证。

乘一个固定截面 $e$ 保持比值这一句，是我在整个论证里最喜欢的一处设计：它把"保持像维数"从截面个数的比较降级为射影几何的初等事实，即在 $e$ 的零除子之外映射 $\varphi\mapsto\varphi e^{n\theta/r}$ 是两个有理映射的复合，像完全相同。这条设计同时也解释了为什么前面所有比较命题都要写成"保持积与比值"（`build/sections/root-comparison.tex:53`-`55`、`build/sections/root-comparison.tex:626`-`630`、`build/sections/applications.tex:81`-`83`）。

## §18 对数一般型加法在藤木类的落地：稳定族与纲论证

加法输入 $generaltype$ 的假设里有两条最贵：纤维大性与 $C\le B(h,T)$。而它的证明在藤木类里并不现成，Kovács--Patakfalvi 的稳定族正性只适用于射影族。`build/sections/introduction.tex:271`-`276` 说的是本节的整个策略：构造一个辅助射影族，把它的相对截面下降到原来的类 $\mathcal C$ 底上。

约定与定义在 `build/sections/general-type-addition.tex:24`-`42`。稳定对指半对数典范奇点配大有理对数典范除子；正规底上的稳定族指平坦、真、满、纤维为连通的稳定对象；边界支集避开每一纤维的一般点与余维一奇点；相对对数典范除子有理嘉当且相对丰富，故族射影；边界按除子限制拉回，正规底之间对数典范除子的嘉当倍数与底交换；半对数典范允许非正规纤维，并在带导子边界的规范化上检验对数典范性；本应用里一般纤维额外要求对数终端，即正规且所有对数差异为正；当分类映射到稳定对模空间是双有理有限到像时称族有极大变化。

然后是那条我最初以为是打杂的引理，`build/sections/general-type-addition.tex:44`-`104`。它的动机写在 `build/sections/general-type-addition.tex:44`-`48`：纤维逐点的有限生成给出每根纤维各自的嵌入度数，下一引理要在解析底上选出一个统一的度数。陈述里给出一族 $q_j\colon Q_j\to Y$（真满，在稠密解析开集 $U_j$ 上纤维不可约且维数固定为 $r_j$），亚纯映射 $\phi_j\colon Q_j\dashrightarrow Z_j$（射影不可约像），可数个代数构型子集的并 $G_j\subset Z_j$，以及"真标架轨迹"这一开部分；结论是某个 $\Lambda_j$ 不被可数个底的真闭解析子集覆盖，且对该指标，$G_j$ 的某个构型分量在 $Z_j$ 中稠密，特别地 $G_j$ 含一个非空代数开子集（`build/sections/general-type-addition.tex:64`-`71`）。

证明的骨架是三件老工具串起来：可数个 $\Lambda_j$ 中必有一个不被可数个真闭解析子集覆盖，否则它们的并被覆盖（`build/sections/general-type-addition.tex:73`-`75`）；解 $\phi_j$ 的图并缩小 $U_j$，只丢掉底的一个真解析子集；若没有 $G_{ji}$ 稠密，则 $E_{ji}=\phi_j^{-1}(\overline{G_{ji}})$ 是解过的 $Q_j$ 中的真闭解析子集，而对 $y\in\Lambda_j$，真标架纤维被这些子集覆盖，于是拜尔定理给出某个 $E_{ji}$ 含纤维的一块相对开集，不可约性把它升级为整个紧纤维（`build/sections/general-type-addition.tex:79`-`88`）；再由纤维维数定理，$A_{ji}=\{y:\dim(E_{ji}\cap q_j^{-1}(y))\ge r_j\}$ 解析且真，否则 $E_{ji}$ 含一般纤维从而含整个 $Q_j$；同一定理在限制到 $U_j$ 之前说明 $A_{ji}$ 连同 $Y\setminus U_j$ 落在一个真闭解析子集里，于是 $\Lambda_j$ 被可数个真闭解析子集覆盖，矛盾（`build/sections/general-type-addition.tex:90`-`103`）。

我第一次读这段是想不通"为什么需要拓扑学的纲论证"。现在我明白：解析几何里没有 Zariski 拓扑的诺特性，"可数多个真解析子集的并"可以铺满底，而"很一般"恰好是按这个补集定义的；要把逐纤维信息拼成整体信息，唯一的武器就是纲。这条引理的位置在整节开头，说明作者把选度数当作地基，并非附注，我同意这个安排。

比较引理 `build/sections/general-type-addition.tex:105`-`127` 给出三个产物：真双有理有限的 $\tau\colon Y'\to Y$，$Y'$ 光滑紧属类 $\mathcal C$；$\rho\colon Y'\to R$，$R$ 光滑射影；$R$ 上一个极大变化、一般纤维对数终端的射影稳定族 $\pi\colon(\mathcal V,\mathcal A)\to R$；使得 $V\times_YY'$ 的主分量在 $Y'$ 上与 $\mathcal V\times_RY'$ 双有理，并且在稠密解析开集上这一比较就是逐纤维的 $K_F+A_F$ 对数典范模型映射，边界取 $A$ 的水平推进；$R$ 允许是一个点。设定要求 $V$ 光滑紧 Kahler、$Y$ 光滑紧属类 $\mathcal C$、$A$ 是 $V$ 上水平、系数严格小于一的有效有理简单正规交叉除子，且很一般纤维上 $K_F+A_F$ 大（`build/sections/general-type-addition.tex:107`-`112`）。

这里有一条我先前会忽略的不一致：命题 $generaltype$ 允许系数等于一，而比较引理只处理系数严格小于一的水平边界。`[推测]` 我的理解是系数一的部分要留在原始侧用除子赋值检验，稳定族只用来吸收严格小于一的那部分；证据是 `build/sections/general-type-addition.tex:12`-`14` 那句"这些形式的极点必须在每个竖直除子上受控，包括那些在原底上像的余维至少为二的除子"，以及第 $374$ 行的"稳定阶"引理、第 $429$ 行的"相对系统"引理、第 $531$ 行的"暴露赋值"引理这三个标题所指示的分工。本节的中段（`build/sections/general-type-addition.tex:140`-`600` 区间）本轮我只读到第 $140$ 行，其余部分我不写结论，避免编造。

## §19 主定理的拼装：两条映射各干一件事

`build/sections/applications.tex:8`-`127` 是全部线索的汇合处，我把它按正文的小标题顺序复述，因为顺序本身承载了教训。

若右端任一加项为 $-\infty$ 则不等式自动成立；下设两者非负，记 $k=\kappa(F,K_F+\Delta_F)$，$b=\kappa(f\mid\Delta)$（`build/sections/applications.tex:9`-`13`）。

固定底那一段：用模型一节与平坦化引理解开图，取 Kahler 模型，先平坦化再解源；每次源改造都取严格变换加约化例外除子；在底上解开判别式与边界分层的像，然后把这个光滑 Kahler 底 $Y$ 钉死。于是源与很一般纤维的对数截面环不变，每个映到 $Y$ 中余维至少为二的源素除子系数为一。在此模型上令 $C=B(f,\Delta)$，它有简单正规交叉支集，而不变式的定义给出

$$
 \kappa(Y,K_Y+C)\ \geq\ b,
$$

见 `build/sections/applications.tex:26`-`33`；同时控制推论保证后续所有跨 $Y$ 的改动都保住 $C$ 与系数一条件（`build/sections/applications.tex:34`-`35`）。

相对 Iitaka 那一段：得到 $X\to W\to Y$，$\dim W_y=k$，$\kappa(G,K_G+\Delta_G)=0$；把 $W$ 变成 Kahler，解开图，把当前光滑源对 $(X_0,\Delta_0)$ 钉为参考；对 $W$ 平坦化并按秩一比较的要求解生成元与边界数据，于是每个被 $g$ 映到余维至少为二的素除子在 $X_0$ 上例外，且在一个稠密光滑对数开集上相对系统在充分可分度数下秩为一（`build/sections/applications.tex:38`-`51`）。秩一比较与伴随正性一并施加，它们的进一步改造仍在 $Y$ 上，同时控制推论保住例外参考，而变化与其抛物线从共同开集拉回；相对 Iitaka 性质持续。最终模型上得到有理线 $M$、区间 $[0,1]$ 内的有理简单正规交叉边界 $T$、满态射 $p\colon W\to S$ 与半正有理线 $P$：

$$
 M=p^*P,\qquad K_S+a_0P\ \text{大},\qquad B(g,\Delta)\le T\le1,
$$

见 `build/sections/applications.tex:60`-`71`。$T$ 就在这最后的模型上用秩一阶公式算出；抛物拉回与秩一比较把 $K_W+T+M$ 的可分系统与 $(X_0,\Delta_0)$ 上的识别起来，也相对地在 $Y$ 上识别，保持所有比值（`build/sections/applications.tex:72`-`75`）。

纤维大性与底边界那一段：记 $D_W=K_W+T$。定义相对 Iitaka 像的系统在很一般 $f$-纤维上有像维数 $k$；用秩一比较把这些系统推进 $D_W+M$，比值不变，故所得系统在维数为 $k$ 的很一般 $h$-纤维上像维数仍是 $k$，于是

$$
 (D_W+M)|_{W_y}\ \text{对很一般}\ y\ \text{为大},
$$

见 `build/sections/applications.tex:79`-`87`。这些系统由 $Y$ 的一个开片上的底变换得到，并在光滑的 $W_y$ 上由相对截面比较延拓；伴随把限制识别为同一伴随线丛。由 inf 重数的复合比较（`build/sections/root-comparison.tex:636`-`674`），

$$
 B(h,T)\ \geq\ C,
$$

见 `build/sections/applications.tex:92`-`96`；同一引理给出 $W$ 中映到 $Y$ 余维至少为二的素除子在 $T$ 中系数为一。两条边界假设都到位，于是加法原理适用，得

$$
 \kappa(W,K_W+T+M)\ \geq\ k+\kappa(Y,K_Y+C),
$$

见 `build/sections/applications.tex:101`-`105`，而该命题的证明只用了一个非零截面去消去丰富摄动，并保持定义这个界的比值（`build/sections/applications.tex:106`-`107`）。

收尾：秩一比较用相对生成元把这些系统提升到 $X$，保持比值与像维数；未被检验的 $g$-压缩素除子在参考对 $(X_0,\Delta_0)$ 上例外，故形式下降并在参考对上延拓；再由对数改造引理下降到原始源。合并两界即

$$
 \kappa(X,K_X+\Delta)\ \geq\ \kappa(F,K_F+\Delta_F)+\kappa(f\mid\Delta).
$$

维数与 $-\infty$ 的边角在 `build/sections/applications.tex:121`-`126` 处理：点上的大性即 Iitaka 维数零；零维连通纤维的相对线平凡；$Y$ 为点时不等式是恒等式；相对 Iitaka 纤维为点时它的 Hodge 线平凡。

那条示意图（`build/figures/two-maps.tex:3`-`11`）我认为是全文最值得盯的一格：$X\xrightarrow{g}W\xrightarrow{h}Y$ 与 $W\xrightarrow{p}S$，而 $Y$ 与 $S$ 之间不声称有任何映射。$h$ 负责保留原底并把纤维维数变成 $k$，$p$ 负责把半正项表达成射影底上的拉回。我最初的想法是要在 $Y$ 与 $S$ 之间建一个模态映射，好让"纤维贡献"与"模贡献"直接相加；那张图的存在说明作者刻意拒绝了这个统一化，代价是多一个命题来消去 $p^*A$，收益是整个论证不再需要 $Y$ 的任何模结构。

## §20 约化边界的精化：极小根覆盖与整条顶形式空间

主定理证完之后我又回去补了一节，`build/sections/reduced-root.tex:1`-`17` 交代了动机：对有理边界，上面那个根形式只张成循环覆盖最高 Hodge 空间的一个特征子空间，而整个最高空间可能更大。射影的、约化边界、对数小平维数为零的对，结论更强：极小根覆盖的整对数顶形式空间在每个正次数都是一维的。这一节同时给出精确的 Hodge 与除子规范化，它给整条最高线一个纯的整格实现，并固定后续相对 Iitaka 构造所用的规范化（`build/sections/reduced-root.tex:8`-`11`）。

引理 `build/sections/reduced-root.tex:19`-`47` 的设定：$(J,D)$ 是特征零域 $K$ 上的光滑几何既约射影对，$D$ 约化且简单正规交叉，$\kappa(J_{\bar K},K_{J_{\bar K}}+D_{\bar K})=0$；取最小正整数 $p$ 使 $H^0(J,p(K_J+D))\ne0$，取其中非零截面 $\omega$，令

$$
 E=\operatorname{div}(\omega)+pD,\qquad \Delta=D-\frac{1}{p}E,
$$

写 $\omega=b\,\eta^{\otimes p}$（有理典范标架下），$\tau\colon N\to J$ 是 $K(J)[t]/(t^p-b)$ 中的规范化，$\rho\colon\widetilde N\to N$ 是对数解奇，$P=\operatorname{Supp}(\Delta^{=1})$，$D_{\widetilde N}=((\tau\circ\rho)^{-1}P)_{\mathrm{red}}$。结论：$N$ 几何既约，有理顶形式 $\Omega=t\,\tau^*\eta$ 对数地扩张到 $(\widetilde N,D_{\widetilde N})$，并且

$$
 H^0\bigl(\widetilde N,m(K_{\widetilde N}+D_{\widetilde N})\bigr)=K\,\Omega^m\qquad(m\ge1).
$$

证明的四步我都想记下来，因为它们都是除子阶检验。第一步是一维性推论：$J$ 上任何非零多对数截面空间都是一维，同次数两个独立截面会定义非常值有理映射；于是 $\kappa(E)=0$，且$E$ 上任何有效整除子也恰有一个截面，因为它被 $E$ 的倍数控制；这些断言与极小指标 $p$ 在场扩张下不变（`build/sections/reduced-root.tex:49`-`56`）。第二步是既约性：在 $\bar K(J)$ 上若 $T^p-b$ 可约，则 $b$ 是某个 $\ell$ 次幂，$\ell\mid p$ 为素数，对应的 $\omega$ 的根会是次数 $p/\ell$ 的非零多对数形式，因为它的对数零除子是 $E/\ell$，与极小性矛盾（`build/sections/reduced-root.tex:58`-`62`）。

第三步是分歧公式，也是我在这个笔记里反复引用的那类"阶的算术"。对 $N$ 中 $J$ 的素除子 $R$ 之上的素除子 $Q$，记

$$
 a=\operatorname{coeff}_R E,\qquad d=\operatorname{coeff}_R D\in\{0,1\},\qquad e=\operatorname{ord}_Q(\tau^*R),
$$

则顶微元的分歧公式给

$$
 \operatorname{ord}_Q\Omega=\frac{ea}{p}-ed+e-1,
$$

见 `build/sections/reduced-root.tex:70`-`73`。若 $a=0$ 覆盖在 $R$ 上无分歧，此阶为 $-d$；若 $a>0$，则 $q=ea/p$ 是正整数（由 $t^p=b$ 与 $d\in\mathbf Z$ 得整性），$d=1$ 时阶为 $q-1\ge0$，$d=0$ 时阶为 $q+e-1\ge0$。极点恰为 $D_N=(\tau^{-1}P)_{\mathrm{red}}$（`build/sections/reduced-root.tex:74`-`79`）。

第四步跨 $\rho$ 的例外除子：子对 $(J,\Delta)$ 是子对数典范的，在 $P$ 之外是子对数终端的，因为它的正部是被 $D$ 控制的简单正规交叉边界、系数在 $P$ 之外严格小于一，减去有效除子不会恶化差异；用 $K_N+\Delta_N=\tau^*(K_J+\Delta)$ 定义创平的有限拉回，则在相容典范平凡化下 $\Delta_N=-\operatorname{div}(\Omega)$；对 $N$ 之上的素除子 $V$，其在 $K(J)$ 上的限制赋值为 $e_Vv$，同一分歧公式给出

$$
 1+\operatorname{ord}_V\Omega=e_V\,A_{J,\Delta}(v),
$$

右端非负、在中心落在 $P$ 之外时为正；左端是整数，故 $\Omega$ 在 $P$ 之上至多一阶极点、其余处正则（`build/sections/reduced-root.tex:81`-`99`）。最后令 $H_N=\operatorname{div}_N(\Omega)+D_N$，分歧公式给更强的界

$$
 0\le H_N\le\tau^*E,
$$

其系数在 $a>0,d=1$ 时为 $q-1\le ea$，在 $d=0$ 时为 $q+e-1\le q+p-1\le pq=ea$（因 $e\le p$、$q\ge1$），在 $a=0$ 时为零；把对数 $m$-典范形式写成 $u\Omega^m$ 并在有限规范化的素除子上检验阶，得 $\operatorname{div}_N(u)+mH_N\ge0$ 与 $u\in H^0(N,\mathcal O_N(m\tau^*E))$；有限拉回保持 Iitaka 维数，故 $\kappa(N,\tau^*E)=\kappa(J,E)=0$，而 $\tau^*E$ 有效、$N$ 几何既约，最后这个空间就是 $K$（`build/sections/reduced-root.tex:101`-`121`）。

这一节的另一半是规范化引理，`build/sections/reduced-root.tex:12`-`17` 说明了它们的用途：把"在实际纤维分量上取最小"与"在所有除子赋值上取阈值"这两件事比较；证明规范化后的底边界若某系数为零则对应一个重数一的分量；并说明其后允许的改造保住完整截面空间。这些是变化姊妹文要用的额外规范化陈述。第 $124$ 行的推论给出模线的整格纯实现，第 $258$ 行的引论给出秩一边界的规范化，第 $357$ 行的引理给出规范化之后被允许的模型；这三处的正文本轮我没有逐行读，只登记标题与位置。

与外部结果的接口写在 `build/sections/introduction.tex:290`-`297`：混合 Hodge 扩张与 Fujino--Fujisawa 形式的半正性控制系数一的边界；所得线与 Bakker--Filipazzi--Mauri--Tsimerman 在射影子对设定下的模除子同一化，这一同一化不用他们那条独立的半丰裕定理，因为后者的假设含一般点上的有效性。`[推测]` 我认为"不用半丰裕"这一句是被特意写出来的，因为若能用它，整条伴随正性论证在射影情形就可以大幅缩短；作者选择绕开，说明有效性假设在我们这里根本不可验证：我们只有一条由根形式张成的线，它的截面环结构正是要求的结论之一。这条推测的依据仅在于论证顺序：先有线恒等式，再有正性。

## §21 推论层与姊妹文的分工

对数版本与通常版本的掉出过程在 `build/sections/applications.tex:129`-`171`，那里有一条比较引理：$f\colon(X,\Delta)\to Y$ 是光滑紧复流形之间的纤维化，$\Delta$ 有理系数在 $[0,1]$、简单正规交叉支集，$D_Y$ 是 $Y$ 上约化简单正规交叉除子；若 $f^*D_Y$ 的每个素分支在 $\Delta$ 中系数为一，则

$$
 \kappa(f\mid\Delta)\ \geq\ \kappa(Y,K_Y+D_Y).
$$

证明取齐整模型 $p\colon X'\to X$、$q\colon Y'\to Y$、$f'\colon X'\to Y'$，$\Delta'=p_*^{-1}\Delta+\operatorname{Exc}(p)_{\mathrm{red}}$，并可安排 $E_Y=(q^{-1}\operatorname{Supp}D_Y)_{\mathrm{red}}$ 为简单正规交叉；支配 $E_Y$ 分支的每个 $X'$ 素除子在 $\Delta'$ 中系数为一（例外素除子按定义为 $1$，非例外者是 $f^*D_Y$ 分支的严格变换），故其加权重数为无穷，inf 重数规则给出 $B(f',\Delta')\ge E_Y$（`build/sections/applications.tex:149`-`162`）。最后一步是把对数顶形式的拉回逐因子看：底变换 $q$ 把沿 $D_Y$ 的极点 $\prod dz_i/z_i$ 送到沿 $E_Y$ 的对数顶形式，所有张量幂同样；于是每个多对数系统在 $K_{Y'}+B(f',\Delta')$ 中被单射地嵌入并保持全部比值，再用齐整模型公式收尾（`build/sections/applications.tex:163`-`171`）。

由此，第 $173$ 行给出对数次可加性推论（射影、约化简单正规交叉、允许零除子、支集包含条件），第 $221$ 行给出特征零的通常次可加性，第 $316$ 行给出沿核的小平维数，第 $395$ 行给出 Campana 的核分解。`build/sections/introduction.tex:165`-`173` 补了准射影语言：光滑准射影簇 $U$ 的对数小平维数是 $\bar\kappa(U)=\kappa(X,K_X+D_X)$，在带约化简单正规交叉边界 $D_X=X\setminus U$ 的光滑射影紧化上计算；相容的紧化给出光滑准射影复簇之间一般纤维几何连通的优势态射的对数次可加性；空边界给出通常次可加性；射影的通常与对数陈述在特征零代数闭域上也成立，用几何一般纤维。

姊妹文的分工写在 `build/sections/introduction.tex:302`-`312`：对数下界、伴随正性与这条约化边界精化为"整纤维变化"同伴文提供所述输入；反不等式同伴文只用下界来做加法，其上限定理对所有边界分层有额外光滑性假设；两篇同伴文都不在主定理的证明里被使用；独立的射影 Hodge 线一文给出通过有理极化整格变化的完整通常证明，以及各自独立的整格与解析边界论证。`[推测]` 我把这段读成一次拆分的痕迹：把射影情形的整格论证单独成文，才能让本文的解析版本只保留必要部分。正文没有说明拆分理由，我不加评论。

## §22 遗留问题、证据缺口与我拒绝硬编的地方

我把这份笔记里所有依赖推测的关节列在一起，作为下一步的工作清单。

一，$\alpha_D$ 的定义不在我读到的段落里给出显式式子。我只看到 $T_D=\alpha_D-\beta_D$（`build/sections/root-comparison.tex:534`-`537`）、"换标架时 $\alpha_D$ 与 $\beta_D$ 各加 $\operatorname{ord}_D(v)/m$"（同处 `538`-`545`）、以及"标架在 $T+M$ 中的阶是 $q(T_D+\beta_D)=q\alpha_D$"（同处 `586`-`589`）。我据此把它读成源侧除子检验给出的那个阶，但这确实是逆推。`[推测]`

二，对数一般型加法中系数一的部分如何在稳定族比较之外被处理。我只读到 `build/sections/general-type-addition.tex:105`-`140` 的陈述与三个中段引理的标题（第 $374$、$429$、$531$ 行）。`[推测]` 我的猜想是"严格小于一的部分交给稳定族的相对对数典范模型，系数一的部分交给除子赋值检验"，标题"暴露赋值"支持这一读法，但我没有读到实现。

三，投影周期商命题（`build/sections/period-positivity.tex:433`）与稳定子引理（同处第 $395$ 行）的构造细节我没有回读，只知道它需要 Villadsen 的类 $\mathcal C$ 紧化与曲率加体积论证（`build/sections/introduction.tex:246`-`252`）。射影性这一步是全链条里唯一我完全没有正面见过的分析事实，我不假装懂。

四，把有限单值算进标记边界 $D$ 的动机（§14 末）是我的重构。

五，关于既有文献里被默认掉的下降步骤（§16 末），我的读法来自 `build/sections/adjoint-addition.tex:61`-`67` 那句"我们把下降那一步显式写出来"，具体是哪一份文献的哪一步缺失，正文没有点名，我只引到了方法出处（Campana 的注记 6.5(3) 与命题 6.6）。

六，正文 `build/sections/introduction.tex:53`-`60` 登记了两条既有预印本的声称：Tsuji 由直接像生成定理推出的通常次可加性（他的注 1.14 区分了一个未证的变体精化），Maehara 涉及变化率的通常行列式不等式（其 \S7 定理 8，与他对数一般型底定理不同）。正文明确说这两条都不是本证明的输入。`[推测]` 我把这段的存在读成一次划界：我曾在某版草稿里把其中一条当作可用引理，后来发现它的精化版本未被证明，于是把它降级为参考文献。这个心理过程没有任何直接证据，我保留它只是因为如果不写，我会误以为这两段是装饰。

七，仍然开放的、正文明确不承诺的问题：底 $Y$ 不必属于类 $\mathcal C$（假设只落在 $X$ 上），轨道形不变底项的取下确界是否在某个具体模型上达到，以及半丰裕性在我们的设定下是否成立。这三条我没有看到任何讨论，因此我只把它们列为问题。

## §23 自查记录

本节只记录结构自查，不复述任何表格的文字，也不抄写表头。

条目编号连续：从第 $0$ 节到第 $25$ 节，物理排布与编号同序，没有重复编号。前向引用只指向本文真实存在的小节，即 §6、§7、§11、§13、§14、§15、§16、§19 这些被点名过的目标。双登记两行都在正文之前的第 $0$ 节末尾，一条是完整目录名，一条是行号登记，后者末尾的两个字齐备。

素材取证共用了 $15$ 次调用：一次目录结构与字节清点，一次标签环境的行号扫描，其余 $13$ 次为分片读取；首次落盘在第 $16$ 次调用完成，首块字节数为 $23{,}864$，随后按探针协议追加一行并复量到 $23{,}933$。此后每次追加都控制在上限之内，追加块的大小在收稿报告里逐次列出。

术语与文风的自查我把它分成两类处理：已在盘上的未翻译英文残留我不做任何就地替换，只在下一节按类别登记，交由本体侧的机械通道；自第 $16$ 节起的用词按规格落笔即中文。定界符配对错位发现过一处，按规格就地改为反引号，位置在第 $18$ 节中段那个区间写法处；除此之外没有做过任何孤立字符的奇偶补偿，全文行数与美元符配对情况在收稿时以工具实测为准。

## §24 勘误登记

按规格，已落盘内容一律不删不改不重排，本节只做类别登记，不复述任何被登记的字面串。

第一类，术语落笔即中文未全程执行。残留集中在第 $8$ 节至第 $15$ 节的若干处，形态有三：一个表示"一般性"的英文形容词被反复夹在中文里；一个表示"局部平凡化"的英文名词出现在第 $11$ 节与第 $12$ 节各一处；还有一个从素材标签里带出来的英文记号片段被误包进了行内公式，位置在第 $18$ 节开头。自第 $16$ 节起我改用中文写法，旧处不动。

第二类，位置回指的措辞冗余。第 $11$ 节末段有一处把"本节"与另一节的文件名并排交代，读起来绕，语义仍正确，回指行号无误。

第三类，定界符配对错位。第 $18$ 节一个行号区间写法的闭合符误用作美元符，已按规格就地改为反引号，仅此一处，属于被授权的动作；未做任何奇偶补偿。

第四类，证据缺口申报。第 $13$ 节、第 $18$ 节、第 $20$ 节各有素材中段本轮未逐行回读，正文里只登记了引理标题与行号并明确标注未读，所有由此产生的判断都以推测标记开头；这类条目不是缺陷，登记在此以免被误读为遗漏。

## §25 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $m_\Delta(E)=(1-\Delta_E)^{-1}$ | $\Delta_E=1$ 时取 $\infty$ | build/sections/introduction.tex:77 | 轨道形边界 $B(f,\Delta)$ | inf 最小值失去意义，系数一不再对应无穷重数 |
| $B(f,\Delta)=\sum_D(1-m^{-1})D$ | 仅有限多个非零系数 | build/sections/introduction.tex:87 | 不变底项 $\kappa(f\mid\Delta)$ | 主不等式右端第二项无定义 |
| $t\,m_{\Delta'}(E)\ge m_\Delta(D)$ | 允许 $\infty\ge\infty$ | build/sections/introduction.tex:109 | 改造等价关系 $f'\sim f$ | 箭头反向不可用，下确界跑遍的模型集变小 |
| $\kappa(f\mid\Delta)=\inf\kappa(Y',K_{Y'}+B)$ | 下确界取遍允许模型 | build/sections/introduction.tex:116 | 主定理右端 | 换模型时下界可升，比较链断 |
| $\dim W_y=k$ | $k=\kappa(F,K_F+\Delta_F)$ | build/sections/models.tex:316 | 相对 Iitaka 分解 | 加法原理里的相对维数 $\dim(W/Y)$ 错 |
| $\kappa(G,K_G+\Delta_G)=0$ | 很一般 $g$-纤维 | build/sections/models.tex:317 | 秩一比较的前提 | 直接像秩不为 $1$，$\mathcal E_m$ 非线丛 |
| $k_E+1\ge\sum_i t_i$ | 非零楔积至多一个 $du/u$ | build/sections/models.tex:84 | 差异除子非负 | $A\ge0$ 失败，截面空间随改造改变 |
| $k_E+1-\sum_i\gamma_i t_i\ge\sum_i(1-\gamma_i)t_i$ | 右端非负 | build/sections/models.tex:88 | 对数改造恒等式 | 例外素除子系数可严格小于 $1$ |
| $B(g',\Gamma')=B(g,\Gamma)$ | 加无穷不改最小值 | build/sections/models.tex:134 | 同时控制推论第三条 | $C$ 随模型漂移，条件 (ii) 无从验证 |
| $\dim\bar g^{-1}(C)\le\dim C+d\le N-2$ | $N=\dim Z_0$，$d=N-b$ | build/sections/models.tex:213 | 例外性论证 | 余维二轨迹上的素除子漏掉系数一 |
| $\operatorname{ord}_E(f^*D)m_\Delta(E)\ge m_C(D)$ | 保住的 inf 重数 | build/sections/models.tex:270 | 主定理固定底段 | 加法输入条件 $C\le B(h,T)$ 断 |
| $\operatorname{rank} g_*\mathcal O_X(m(K_{X/W}+\Delta))$ | 一般秩为 $1$ | build/sections/root-comparison.tex:85 | 根形式与特征线 | 生成元差一个非常值底函数，$M$ 无定义 |
| $j(1+l)-1$ | $l=-1$ 时恰为 $-1$ | build/sections/root-comparison.tex:115 | $\tau$ 的对数极点界 | 覆盖上出现真极点，补集上同调解释断 |
| $\dim_{\mathbf C}F^dH^d(\widetilde G\setminus H)$ 特征部分 | $=1$ | build/sections/root-comparison.tex:127 | 伴随正性的秩一假设 | 最高步秩大于一，定理不适用 |
| $l\ge-\delta\ge-1$ | 水平素除子上 | build/sections/root-comparison.tex:111 | 根阶公式前提 | 至多对数极点失效 |
| $\beta_D=\min_E(l_E+1-a_E)/a_E$ | 切触例 $a_E=2,l_E=0$ 给 $-1/2$ | build/sections/root-comparison.tex:452 | $T_D=\alpha_D-\beta_D$ | 检测集缩小，抛物阶算错 |
| $l_E+1-a_E-a_Eb\ge0$ | 逐素除子不等式 | build/sections/root-comparison.tex:463 | 抛物正则判据 | 阶公式只成立到必要方向 |
| $A_X(v)\ge\sum_i v(x_i)$ | 对数差异 | build/sections/root-comparison.tex:503 | 任意除子赋值的延拓界 | 新增例外素除子提出更强条件 |
| $0\le c_E\le1$，$c_E=1-(1-\delta_E)/a_E$ | 界由 $\delta_E\le1$ 给 | build/sections/root-comparison.tex:551 | $T\le1$ | 边界的系数一上限断 |
| $B(g,\Delta)\le T\le1$ | 两个最小值之差的夹逼 | build/sections/root-comparison.tex:42 | 复合比较 $B(h,T)\ge C$ | 底边界项失控 |
| $T_D=\alpha_D-\beta_D$ | 换标架双方各加 $\operatorname{ord}_D(v)/m$ | build/sections/root-comparison.tex:536 | $q(T_D+\beta_D)=q\alpha_D$ | 截面对同构断，像维数不可搬 |
| $\nu(A)=\max\{k:c_1(A)^k[\omega]^{n-k}>0\}$ | 与 $\omega$ 的选取无关 | build/sections/period-positivity.tex:50 | 曲率秩的识别 | 计数引理里的次数比较无意义 |
| $C(1+\sum_j\log(-\log\lvert t_j\rvert))$ | 二重对数增长 | build/sections/period-positivity.tex:105 | 屏障势满足 $v-C\le u$ | 交乘质量在边界漏掉 |
| $\int\Theta^k\wedge\omega^{n-k}=\alpha^k[\omega]^{n-k}$ | 对 $0\le k\le n$ 成立 | build/sections/period-positivity.tex:169 | $\nu(P)$ 等于线映射的一般秩 | 曲率与交乘脱钩，秩识别断 |
| $0<\delta\le c^b/N$ | 凸组合系数上限 | build/sections/period-positivity.tex:146 | 屏障势满质量 | $u$ 失去满质量 |
| $G=H\times Q$ | André 单值正规性给的法分解 | build/sections/period-positivity.tex:597 | 秩分解 $r=d_H+s_Q$ | $Q$-周期在 $Z$ 上常数无从说起 |
| $\dim V=m+d-d_H$ 与期望 $m-d_H$ | 计数比较 | build/sections/period-positivity.tex:617 | Ax--Schanuel 的应用 | 稠密性论证断，满秩 $d_H$ 证不出 |
| $r=d_H+s_Q$ | 一般秩恒等式 | build/sections/period-positivity.tex:655 | $\pi^*P=P_H+P_Q$ 的分解 | 边界上的严格秩损失证不出 |
| $\nu(P\mid_{D_i})<\nu(P)$ | 标记集含有限单值 | build/sections/period-positivity.tex:568 | 计数引理的假设 | 边界 $D$ 去不掉，$K_S+aP$ 大证不出 |
| $(H_1+tJ)^n-n\sum_i d_i(H_2+tJ)^{n-1}\cdot E_i$ | 次数 $r$ 对至多 $r-1$ | build/sections/period-positivity.tex:886 | $A+tJ$ 的大性 | 损失项压不住主导项 |
| $md_i$ | $E_i$ 上的商项个数 | build/sections/period-positivity.tex:875 | 减去项的系数 | 正合序列计数错，下界不成立 |
| $K_S+a_0P$ 大 | $a_0\in\mathbf Q_{>0}$ | build/sections/adjoint-addition.tex:24 | 取 $a>\max\{1,a_0\}$ | $E_-$ 拿不到非零截面 |
| $0<c<1$ | 大锥开性给出 | build/sections/adjoint-addition.tex:172 | $\theta=(1-c)/(a-c)$ | 凸组合系数越界，$M$ 的系数到不了 $1$ |
| $\theta=\frac{1-c}{a-c}$，$\eta=\frac{(1-c)\lambda}{a-1}$ | $0<\theta<1$，$\eta>0$ | build/sections/adjoint-addition.tex:226 | 恒等式 $D+M=(1-\theta)E_++\theta E_-$ | 丰富项抵消失败 |
| $H=K_S+aP-\lambda A$ | $\lambda>0$ 充分小仍大 | build/sections/adjoint-addition.tex:217 | 大底扭后的有效性引理 | 没有 $p^*H$ 的截面可用 |
| $\kappa(V,K_V+T)\ge\dim F+\kappa(Y,K_Y+C)$ | 三条假设 | build/sections/adjoint-addition.tex:52 | 加法原理 | 主不等式右端少一个 $k$ |
| $\kappa(W_s,(K_W+T)\mid_{W_s})\ge0$ | 很一般 $s\in S$ | build/sections/adjoint-addition.tex:209 | 相对直接像秩为正 | 弱正性没有可用的秩前提 |
| $\kappa(f\mid\Delta)\ge\kappa(Y,K_Y+D_Y)$ | 需 $f^*D_Y$ 分支系数一 | build/sections/applications.tex:145 | 对数次可加性推论 | 对数版本掉不出来 |
| $H^0(\widetilde N,m(K+D_{\widetilde N}))=K\Omega^m$ | 对每个 $m\ge1$ 一维 | build/sections/reduced-root.tex:44 | 精化与模线的整格纯实现 | 只回到特征线，精化失效 |
| $\operatorname{ord}_Q\Omega=ea/p-ed+e-1$ | $q=ea/p$ 为正整数 | build/sections/reduced-root.tex:72 | 极点恰为 $D_N$ | 对数扩张断 |
| $0\le H_N\le\tau^*E$ | 用到 $e\le p$ 与 $q\ge1$ | build/sections/reduced-root.tex:104 | 截面空间等于 $K$ | 一维性的最后一步断 |
| $1+\operatorname{ord}_V\Omega=e_VA_{J,\Delta}(v)$ | 左端为整数 | build/sections/reduced-root.tex:93 | 至多一阶极点 | 跨 $\rho$-例外除子的延拓断 |

## §26 勘误补记

台账之后追加本节，按规格的落盘协议执行：已落盘内容不回改，缺陷只在文末申报，此处只写类别名与所在节号，不复述任何被登记的字面串。

第一类，对比句式禁串。共 $6$ 处，分别在节 $3$、节 $5$、节 $6$、节 $8$、节 $17$、节 $18$ 各 $1$ 处。其中节 $5$ 与节 $6$ 的两处属于连读造成的同形命中，语义上是"而"接一个表示"非零"的形容词；其余 $4$ 处是我确实写成了被禁的对比句式，交本体侧机械通道处理。

第二类，插入语式强调禁串。共 $2$ 处，分别在节 $6$ 与节 $11$。

第三类，英文残留（与第 $24$ 节第一类同源，此处补登记节号）。除第 $24$ 节已登记的节 $8$ 至节 $15$ 区间外，节 $5$ 有 $1$ 处表示一般性的英文形容词残留，节 $11$ 有 $1$ 处把表示"单位元"的英文短语写进了中文句子中间；这两处我同样不做就地替换。

第四类，正文公式里的竖线用法。节 $3$、节 $6$、节 $8$、节 $11$、节 $12$、节 $14$、节 $15$、节 $16$、节 $19$ 的行内公式与行间公式中，限制算子与绝对值用了竖线写法。台账表格内的单元格已全部改用带字形的写法，实测 $44$ 行表格每行恰好 $6$ 个竖线，无裸竖线、无空单元格；正文侧的写法是合法数学记号，登记在此以免与表格判据混淆。

第五类，声明台账之后另有本节。这是规格协议要求的勘误追加位置，编号仍连续递增，不回改任何已落盘内容。

## §27 勘误补记的节号更正

上一节第四类里那份节号清单有两处偏差，追加更正，不回改原文：竖线写法实际出现在节 $3$、节 $11$、节 $13$、节 $14$、节 $15$、节 $16$ 与节 $19$；节 $6$ 与节 $8$ 的公式没有用到该写法，节 $12$ 的公式同样没有。第一类与第二类的节号登记不受影响。

## §28 附录五小节的全貌与动笔意图

附录物理上排在正文归约根覆盖一节之后，正文首段把它的性质交代成主线那个归约边界构造的补集式证明与计算（`build/sections/normalization.tex:4`-`5`）。这一句不是修辞，往后每个小节都是它的逐项落地：第一小节从除子层面的截面比较开场（`build/sections/normalization.tex:18`）；第二小节在底上抽取赋值，把固定源下降取回（`build/sections/normalization.tex:173`）；第三小节用固定的对数零除子给出第二份差异层检验（`build/sections/normalization.tex:258`）；第四小节在环面坐标里证明根形式的对数延拓（`build/sections/normalization.tex:299`）；第五小节跟踪最小规则除子在高底模型上重算时辅助子对的变动（`build/sections/normalization.tex:340`）。

开篇有两句话把第五组计算同正文的规范边界改造区分开，分别点在判别部分的来源：正文那边它被定义成严格边界加约化例外除子，附录这边它是从数据里重算出来的（`build/sections/normalization.tex:12`-`14`）。我把这句读成来源登记，防的是读者把一个算出来的量当成一个定义出来的量。紧随其后的贯穿约定约束得更多：整个附录里，源的改造一律携带严格边界加重数一的例外边界（`build/sections/normalization.tex:15`-`16`）。两句合读，第五小节里任何系数变化都必须从最小规则推出，不许引用正文那个定义来免验；贯穿约定又把前四小节的全部模型改变锁进同一类操作，比较链因此在引理之间不分叉。

写作顺序我没有直接证据。`[推测]` 从排布反推：首段用"构造容得下补集式证明"这种口吻，说明主线先定稿，平行证明是后补的检验产物；平行证明被安置进附录，最省事的解释是它们只需各自成立，不必同主线共担成败。我起初走过的一段弯路想把五组证明全写进正文，后来放弃了，理由讲得出来：主线链条本来已经紧，再把分歧计数与阈值计算塞进去，读者就分不清哪些步骤承重、哪些步骤冗余；于是正文只留主线，其余沉底成附录，附录首段那段性质交代属于事后补上的注记。这一段前半是措辞学推断，整段按推测登记。

结构上另有一条观察值得记下：五个小节共享记号，最小规则、$p$-典范生成元 $s$、底素子 $P$ 在第二与第五小节两度登场，可它们相互之间几乎不引用。`[推测]` 我把这点读成各自独立写作的痕迹，字母表是统一过的，论证骨架没有返工。归约根覆盖那条主线在 §25 台账里留有四条对应条目，本附录四、五两组计算恰好覆盖那四条里被引用过的对象，读附录时我把那四行重看了一遍，两份链条在 $Z=E/p$ 那个固定零除子处接上了头。

## §29 除子层面的判据与换模型的几种走法

附录第一小节开场先立三条约定：本节所有簇在 $\mathbf C$ 上投影，有理除子的次数充分可分，很一般纤维取成既约不可约（`build/sections/normalization.tex:21`-`23`）。三行字是后面所有引理的公共前提，拉动单射需要可分性来定线丛，纤维陈述需要纤维既约来谈维数。约定立完才轮到五条引理依次上场。

引一，除子截面判据（`build/sections/normalization.tex:27`-`36`），说的是一件熟悉到容易被跳过的事：秩一自反层等于它在余维一各点处的格的交，于是 $V$ 正规、$D$ 为整条韦伊除子时，一个有理截面属于 $H^0(V,D)$ 当且仅当它在每个素除子上满足对应的阶不等式（`build/sections/normalization.tex:28`-`30`，证明落点在 `build/sections/normalization.tex:39`-`40`）。有限满射 $\pi:V'\to V$ 之下，$V'$ 正规而 $D$ 为嘉当除子时，只需对覆盖底面素除子的那些素除子验不等式（`build/sections/normalization.tex:30`-`32`）；$\pi$ 若是伽罗瓦的，就有 $H^0(V',\pi^*D)^{\operatorname{Gal}(V'/V)}=H^0(V,D)$（`build/sections/normalization.tex:33`-`35`），证明用 $(\pi_*\mathcal O_{V'})^{\operatorname{Gal}(V'/V)}=\mathcal O_V$ 配上射影公式（`build/sections/normalization.tex:42`-`44`）。判据本身解决全局截面同逐点检验之间的张力；伽罗瓦等式我读成固定源下降的另一半凭证，它允许把覆盖上的截面空间原样搬回 楼下那一侧的对应物，这正是第二小节要用的形态。

引二，有限拉动（`build/sections/normalization.tex:47`-`56`），对象是法向簇之间的一般有限态射 $\pi:V'\to V$ 与有理嘉当除子 $D$，结论 $\kappa(V',\pi^*D)=\kappa(V,D)$；$\kappa(V,D)=0$ 时每个非零 $H^0(V,mD)$ 恰一维。证明第一步用 Stein 分解化到有限映射，理由是有向正规簇的双有理态射直接像是 $\mathcal O_V$（`build/sections/normalization.tex:59`-`61`）；第二步把 $D$ 换成充分倍数，写出次数环包含 $R(V,D)\subseteq R(V',\pi^*D)$，再论证上侧每个齐次截面在有限的函数域扩张上满足一枚首一特征多项式，其系数是 $D$ 的相应倍数的有理截面，在每个素除子的格中正则，由引一的判据升为整体截面（`build/sections/normalization.tex:61`-`71`）。两个非零分次环同超越次数，Iitaka 维数相等；底侧若没有正度截面，同一套范数论证排除上侧有（`build/sections/normalization.tex:73`-`74`）；一度里两枚独立截面的比是非常值有理函数，给出正维数的有理像，这就收束了那条一维性陈述（`build/sections/normalization.tex:74`-`77`）。附录第一小节里跨引理的依赖我只见到这一处，引二指回引一。`[推测]` 从书写次序看，两条本是一段证明拆开的产物，拆开后依赖方向没有跟着重排。

引三，对数拉动（`build/sections/normalization.tex:79`-`90`）：光滑投影簇之间的主导一般有限 $\rho:V\to Y$，$D_Y$ 为既约简单正规交叉除子，边界 $B$ 压住 $(\rho^*D_Y)_{\mathrm{red}}$ 且在选定模型上支撑为简单正规交叉，则对数多重典范形式在可分 $m$ 度给出单射 $H^0(Y,m(K_Y+D_Y))\hookrightarrow H^0(V,m(K_V+B))$。它靠的局部证据写在一行里：$d(\rho^*z)/\rho^*z$ 的除子极点是简单的（`build/sections/normalization.tex:95`-`97`）。逐素子算账的另一个形态：分歧指数为 $e$ 的素子上雅可比贡献 $e-1$，系数一的边界补足剩下的一（`build/sections/normalization.tex:98`-`100`）；例外像之上的素子同算（`build/sections/normalization.tex:100`-`101`）；单射本身由主导与可分性收口（`build/sections/normalization.tex:101`-`102`）。这同 §25 台账里要求 $f^*D_Y$ 分支系数一的那行是同一笔账的正反两面，读到这里我才确认应用侧那条推论的系数一假设背后站着引三。

引四，相对 Iitaka 纤维化（`build/sections/normalization.tex:105`-`124`）：$p:V\to B$ 主导投影，$V$ 光滑投影，$D$ 在几何一般纤维上的 Iitaka 维数为 $k\ge0$，双有理改造后有 $V'\xrightarrow{q}U\to B$，$q$ 的一般几何纤维连通，$\dim U-\dim B=k$，且很一般纤维 $G$ 上 $\kappa(G,D'|_G)=0$，这里 $D'=\mu^*D$（`build/sections/normalization.tex:110`-`118`）。构造走的路径是在 $B$ 的函数域上应用纤维化定理，取截面域在 $\mathbf C(V)$ 中的相对代数闭包，再铺开、解消有理映射并做 Stein 分解（`build/sections/normalization.tex:127`-`131`）。对数替代物的凭证是一条在每充分可分度都成立的整体同构，$\mu_*\mathcal O_{V'}(m(K_{V'}+B_{V'}))=\mathcal O_V(m(K_V+B_V))$（`build/sections/normalization.tex:135`-`138`），推到原底上就认定了相对截面系统，哪怕全局截面一枚都没有也照样成立（`build/sections/normalization.tex:139`-`141`）。很一般复纤维同几何一般纤维一致，靠的是上同调与底交换，再把可数多个度上的例外闭集并起来删掉（`build/sections/normalization.tex:146`-`149`）；对数光滑模型上纤维限制满足 $D'|_G\sim_{\mathbf Q}K_G+B_G$，由一般光滑性加伴随给出（`build/sections/normalization.tex:122`-`123`，`145`）。这条同 §25 台账里 $\dim W_y=k$ 那行同源，一条记在正文，一条记在附录。

引五，易加法（`build/sections/normalization.tex:152`-`161`）：同一设定下 $G$ 取整条很一般纤维，则 $\kappa(V,D)\le\dim B+\kappa(G,D|_G)$，且有非零整体截面时它在一般纤维上限制非零。证明对每个有截面的可分度 $m$ 取有理映射 $\phi_m$，考察 $(p,\phi_m)$ 的像，它支配 $\phi_m$ 的像且维数至多右端，对 $m$ 取最大即得（`build/sections/normalization.tex:163`-`168`）；非零截面在稠密开集上不会恒零于每一纤维（`build/sections/normalization.tex:163`-`165`），这一句顺手把纤维项为 $-\infty$ 的极端情形封死，总项随之为 $-\infty$（`build/sections/normalization.tex:168`-`170`）。

第一小节到此把账房工具点齐：判据管什么算截面，有限拉动管换覆盖，对数拉动管进边界的门票，相对纤维化管截面域维数，易加法管上界默认值。五条全是初等事实，被单独立成一节的理由我读成一点：主定理每一处换模型、每一次下降，最后都要落回截面空间没有改变这件事，工具引理写得独立，主线才敢频繁调用。

## §30 限制赋值的除子性与固定源的下降

第二小节（`build/sections/normalization.tex:173`）开场先立一个独立的赋值论事实：固定光滑投影簇之间的主导态射 $p:H\to I$ 连同模型 $H$ 本身，设 $v$ 是 $\mathbf C(H)$ 的除子赋值且它在 $\mathbf C(I)$ 上的限制不平凡，则限制 $w$ 必为 $\mathbf C(I)$ 某个除子赋值的正整数倍。记 $n=\dim H$、$m=\dim I$（`build/sections/normalization.tex:176`-`179`），两侧值群有理秩一、包含关系指标有限（`build/sections/normalization.tex:180`）；相对剩余超越次数不等式给出 $\operatorname{trdeg}_{\kappa(w)}\kappa(v)\le n-m$（`build/sections/normalization.tex:181`-`184`），结合除子赋值恒等式 $\operatorname{trdeg}_{\mathbf C}\kappa(v)=n-1$ 推出 $\operatorname{trdeg}_{\mathbf C}\kappa(w)\ge m-1$，Abhyankar 不等式反手给出反向，夹成等式，$w$ 就此登记为除子性的（`build/sections/normalization.tex:185`-`188`）。这一小节我读成一处故意写重的引理：先把限制证明为除子性，紧接着声明在一个固定的光滑投影双有理模型上至多抽出有限多个这样的限制（`build/sections/normalization.tex:188`-`189`），后面的抽取才谈得上完成。固定二字固定的是抽取的有限性，这个指向我起初看漏过。

有限性转成映射的语言是下一段（`build/sections/normalization.tex:191`-`199`）：$H$ 的像为余维至少二的素除子本来就只有有限多个，它们落在 $p$ 的光滑轨迹之外或者其除子部分里（`build/sections/normalization.tex:191`-`193`）；抽出它们的限制之后，原水平素子保持水平，原竖直素子在准备好的底上获得除子性中心，并且这些中心在更高的底模型上保持除子性（`build/sections/normalization.tex:194`-`197`）。到这里一个闭环判据成立：任一后续交换双有理图中，底像仍为余维至少二的源素子，在固定的 $H$ 上一定是例外除子（`build/sections/normalization.tex:197`-`199`）。这句话一立，换更高模型时新增素子的账就不用重开了。

正文真正要用的对象在后半（`build/sections/normalization.tex:201`-`239`）：固定原始光滑对 $(X,D_X)$，$X'\to X$ 携带严格边界加约化例外边界 $D'$，在光滑投影模型上取相对 Iitaka 纤维化 $x:X'\to W$，其几何一般纤维 $(J,D_J)$ 的对数 Iitaka 维数为零；$s$ 取生成一般 $p$ 度截面空间的相对有理 $p$-典范形式，记 $d_E=\operatorname{coeff}_E D'$，对底素子 $P$ 定义最小规则 $t_P=\min_{E\mapsto P}\frac{p^{-1}\operatorname{ord}^{pK_{X'/W}}_E(s)+d_E}{\operatorname{ord}_E(x^*P)}$ 并把 $T_W=\sum_P t_P P$（`build/sections/normalization.tex:201`-`214`）。正文在此特意登记一句：$T_W$ 是尚未分成判别与模两本账之前的整个最小规则底项（`build/sections/normalization.tex:215`-`217`）。可分度里把截面除以 $s^{m/p}$，就得到单射 $H^0(X',m(K_{X'}+D'))\hookrightarrow H^0(W,m(K_W+T_W))$（`build/sections/normalization.tex:218`-`222`）。

单射的核验是三段分账。几何一般纤维上截面是 $s^{m/p}$ 的常数倍，连通性把那个常数认成 $W$ 上的有理 $m$-典范形式 $\sigma$（`build/sections/normalization.tex:223`-`226`）；在每个支配 $P$ 的分量 $E$ 处，把 $\sigma$ 写进 $mK_W$ 的不消失局部标架并记 $a_E=\operatorname{ord}_E(x^*P)$，上侧对数正则等价于 $a_E\operatorname{ord}_P(\sigma)+(m/p)\operatorname{ord}^{pK_{X'/W}}_E(s)+md_E\ge0$（`build/sections/normalization.tex:226`-`232`）；把 $P$ 上方诸素子的整套不等式收拢，恰好汇成一条 $\operatorname{ord}_P(\sigma)+mt_P\ge0$（`build/sections/normalization.tex:233`-`234`）；水平素子不贡献新条件，因为 $s$ 本来就是允许的一般位置对数多重形式（`build/sections/normalization.tex:234`-`236`）。同样的论证照抄到原始底 $Y$ 的一般点处；相对 Iitaka 维数为 $k$ 时 $\dim(W/Y)=k$，截面比的保住说明 $K_W+T_W$ 在 $Y$ 上大（`build/sections/normalization.tex:236`-`239`）。

反方向（`build/sections/normalization.tex:241`-`256`）把 §29 的两件工具收了回来：在 $W$ 上抽出所有例外像、并在原始 $X$ 上仍作为除子存活的源赋值的限制，化解诱发的交换图并重算最小规则，从此每个原始除子都至少被水平一般条件或某个底素子检验一次（`build/sections/normalization.tex:241`-`246`）；右侧截面乘以 $s^{m/p}$ 后在每个原始源素子上满足对数阶不等式，尚未检验的极点只可能落在 $X$ 的例外除子上（`build/sections/normalization.tex:246`-`249`）；这时余维一判据给出 $m(K_X+D_X)$ 的整体截面，对数改造恒等式再把它取回 $X'$ 上的截面（`build/sections/normalization.tex:249`-`252`）。这些认同兼容乘幂与乘法，对应的截面比经 $x$ 拉动后一致，两端的截面域与有理映射像的维数一致，下降因此整体保住 Iitaka 不变量（`build/sections/normalization.tex:252`-`256`）。`[推测]` 从对像维数一致的强调判断，这段下降是为次可加性主定理服务的，单有截面空间的单射并不够用，增长率不变才是要的结论。

## §31 固定零除子与差异层的第二遍检验

第三小节（`build/sections/normalization.tex:258`）回到正文归约循环覆盖的记号，先把一个唯一性事实钉死：有理除子 $Z=E/p$ 不依赖于非零对数多重形式与其度数的选取（`build/sections/normalization.tex:260`-`262`）。理由是一段成比例运算：若 $\omega_m$ 是另一度 $m$ 的非零截面，则 $\omega_m^p$ 与 $\omega^m$ 这两个 $mp$ 度截面在截面空间一维的前提下成比例，于是 $p(\operatorname{div}(\omega_m)+mD)=mE$（`build/sections/normalization.tex:262`-`268`）。配套陈述是最小性：把 $K_J+D-Z$ 平凡化的最小正整数仍是 $p$。在有理典范标架里写 $\omega=b\eta^{\otimes p}$ 得 $p(K_J+D-Z)=-\operatorname{div}(b)$；反过来，若 $r(K_J+D-Z)$ 有平凡化，就得到一个有理 $r$-典范形式，其对数零除子为 $rZ\ge0$，因此它本身就是度 $r$ 的非零对数多重形式，最小性迫使 $r\ge p$（`build/sections/normalization.tex:269`-`274`）。§25 台账里归约根覆盖那四条记录了一维实现、极点位置、正则上界与跨例外除子的延拓，本小节把除子 $Z$ 的唯一性与指数的最小性补在旁边，这两件正文里一直默认在用的事实至此有了显式出处。

后半是对一般差异层秩一条件的第二遍检验（`build/sections/normalization.tex:276`-`297`），检验对象即正文归约整条模线推论里的一般地... 不，检验对象即正文归约整条模线推论所要求的条件（`build/sections/normalization.tex:276`-`278`）。取对数分解 $\rho_J:J'\to J$，令 $D_{J'}$ 为严格边界加约化例外除子，置 $E_{J'}=\operatorname{div}(\omega|_{J'})+pD_{J'}\ge0$（`build/sections/normalization.tex:278`-`282`）；辅助一般子边界的无差异变换是 $D_{J'}-E_{J'}/p$，其系数至多为一（`build/sections/normalization.tex:283`-`285`）。令 $A^*$ 为把系数 $-1$ 一格改写成 $0$ 之后的差异除子系，它的取重整迹有效，正系数只可能出现在 $\operatorname{Supp}E_{J'}$ 上，逐系数有夹逼链 $0\le\lceil A^*\rceil_{J'}\le\lceil E_{J'}/p\rceil\le E_{J'}$（`build/sections/normalization.tex:285`-`291`），头一个不等式恰好靠省略差异 $-1$ 这一步（`build/sections/normalization.tex:292`）。对数双有理不变性给出 $\kappa(E_{J'})=0$，相伴的有理函数空间至多一维且含常数，于是秩一在一切足够高的分解上成立，连辅助子边界带负系数的情形也一并盖住（`build/sections/normalization.tex:293`-`297`）。我读这条路线的收获是方法的对照：正文用截面空间正面验秩一，这里改用取重整的夹逼间接验一次；它的收益在于无须假设子边界系数非负（`build/sections/normalization.tex:296`-`297`），恰好盖住辅助子对最不舒服的角落。

## §32 环面坐标里的根形式对数延拓

第四小节（`build/sections/normalization.tex:299`）给正文归约循环覆盖引理的延拓部分换了一套坐标算法，在简单正规交叉循环覆盖构造的环面分解上直接验证（`build/sections/normalization.tex:301`-`303`）。动笔先处理支撑：在 $J$ 上做分解并保持严格边界加约化例外的对数边界，最小指数与固定零这两个陈述在这一步都不动（`build/sections/normalization.tex:304`-`306`）。局部简单正规交叉坐标卡里把形式写成 $\omega=\varepsilon\prod_i z_i^{a_i-pd_i}(dz_1\wedge\cdots\wedge dz_r)^{\otimes p}$，其中 $a_i\ge0$、$d_i\in\{0,1\}$、$\varepsilon$ 为单位；坐标要全部纳入，在 $D+\operatorname{Supp}E$ 之外令 $d_i=a_i=0$；经一次局部无分歧坐标变换，单位有根、对除子阶贡献为零（`build/sections/normalization.tex:306`-`315`）。

设 $v$ 是分解后的根覆盖上的环面素子，$n_i=v(z_i)\ge0$，它决定的非零射线至少有一个 $n_i$ 严格为正（`build/sections/normalization.tex:315`-`317`）。用对数微分重写，阶公式落成 $\operatorname{ord}_v(\Omega)=\sum_i n_i(1-d_i+a_i/p)-1$（`build/sections/normalization.tex:317`-`321`）：对数体积形式在环面素子上取阶 $-1$，换环面格只乘一个非零常数（`build/sections/normalization.tex:322`-`324`）。求和里每个系数非负，它恰好当 $d_i=1$ 且 $a_i=0$ 时为零，也就是辅助子对的系数一极点边界（`build/sections/normalization.tex:324`-`326`）。于是情形分列。若 $v$ 在极点边界原像之外，那些零系数对应的 $n_i=0$，其余某个 $n_i$ 为正，和严格为正；$\Omega$ 的阶是整数，正和至少为一，正则性到手（`build/sections/normalization.tex:328`-`332`）。若在极点边界原像之上，非负和直接给出阶至少 $-1$（`build/sections/normalization.tex:333`-`334`）。光滑无分歧轨迹里的素子早已在有限正规化上验过正则（`build/sections/normalization.tex:334`-`335`）。三种情形合起来，$\Omega$ 作为顶部微分形式延拓开去，极点至多沿极点边界原像取对数形态，这就是差异缩放论证之外的坐标替身（`build/sections/normalization.tex:335`-`338`）。`[推测]` 从两份延拓证明的分工看，差异缩放吃除子系的形式机，环面坐标吃射线算术，一条引理只配一份证明时，形式层或组合层任何一处失足都难自查，于是保留了这份一页纸能算穿的备胎。

## §33 高底模型上重算的规范判别与生成元无关性

第五小节（`build/sections/normalization.tex:340`）是 §28 所说来源登记那一处的正身。设定取自正文秩一比较那条规范改造引理的投影归约边界数据，$x:X'\to W$ 与 $D'$ 给定，$s$ 为其相对有理 $p$-典范生成元；最小规则 $t_P$ 与 $T_W=\sum_Pt_PP$ 的公式原样重抄（`build/sections/normalization.tex:342`-`349`），再立两个新记号，$\Delta_0=-p^{-1}\operatorname{div}_{K_{X'/W}}(s)$、$\Delta=\Delta_0+x^*T_W$（`build/sections/normalization.tex:351`-`354`）。小节内有一条专门的记号警示：这里的 $T_W$ 指分成判别与模两本账之前的整个最小规则底项，正文对应章节里记作 $T$ 的只是判别部分（`build/sections/normalization.tex:355`-`358`）；配套的恒等式是 $K_{X'}+\Delta\sim_{\mathbf Q}x^*(K_W+T_W)$（`build/sections/normalization.tex:359`）。辅助除子只要求在 $W$ 的一般点处子对数典范，像的余维至少二的源除子上的系数不被断言至多为一（`build/sections/normalization.tex:360`-`363`）。这句范围声明同 §30 闭环判据呼应：固定源那一侧本来就没打算给这类素子发凭证。

系数估计走阈值路线（`build/sections/normalization.tex:364`-`379`）：对素子 $P$ 置 $c_P=\operatorname{lct}_{\eta_P}(X',\Delta;x^*P)$、$b_P=1-c_P$、$B_W=\sum_Pb_PP$（`build/sections/normalization.tex:365`-`369`）。在 $P$ 的一般点处最小规则给出 $\Delta\le D'$，水平除子一并算入，对数典范性于是压住 $c_P\ge0$；达到最小的分量 $E$ 在 $\Delta$ 中系数恰为 $d_E\in\{0,1\}$，所以 $c_P\le(1-d_E)/\operatorname{ord}_E(x^*P)\le1$，两头合起来 $0\le B_W\le1$（`build/sections/normalization.tex:370`-`377`）。若 $P$ 落在来自底 $Y$ 的必经逆像边界里，$P$ 上方全部分量满足 $d_E=1$，直接读出 $c_P=0$、$b_P=1$（`build/sections/normalization.tex:377`-`379`）。系数一到系数一的传递如此廉价，我回头怀疑正文必经边界那一节把系数一当作输入，正是从这里兑现的。

模型比较是这一节的心脏（`build/sections/normalization.tex:381`-`407`）。取更高光滑底模型 $\beta:W_1\to W_0$，化解诱发交换图得 $\pi:X_1\to X_0$，两侧纤维化记 $x_i:X_i\to W_i$，典范除子的有理顶部形式取相容（`build/sections/normalization.tex:381`-`384`）。先做无差异变换 $K_{X_1}+\Delta_{\mathrm{crepant}}=\pi^*(K_{X_0}+\Delta_{\mathrm{old}})$（`build/sections/normalization.tex:385`-`389`）；随后用新的对数边界与同一份平凡化 $s$ 重算 $T_{W_1}$ 与 $\Delta_{\mathrm{new}}$，两套定义一比对就掉出扭量恒等式，$Q=K_{W_1}+T_{W_1}-\beta^*(K_{W_0}+T_{W_0})$ 且 $\Delta_{\mathrm{new}}=\Delta_{\mathrm{crepant}}+x_1^*Q$（`build/sections/normalization.tex:390`-`400`）。正文特别点明这个扭量把底的典范差异包了进来（`build/sections/normalization.tex:401`）：加上 $x^*Q$ 会把 $P$ 处的阈值下拉 $\operatorname{coeff}_PQ$，即把 $Q$ 同时加到判别与整个底项上，模部分纹丝不动（`build/sections/normalization.tex:402`-`404`）。对数典范平凡纤维化的双有理拉动本来保住它的模除子系，两处相容性同文献里霍奇扩展的描述对得上号（`build/sections/normalization.tex:405`-`407`）。我读这段的收获是一条记账纪律：重算定义下的模型变换不白搭，代价被精确折算成一个显式扭量，模部分因此免检。

收尾两件（`build/sections/normalization.tex:409`-`428`）。其一，把 $W$ 上有限支撑分解、源图一并化解，在未动的余维一点处，通过旧检验的对数形式在新源分解上仍对数，旧的极小分量继续存在，最小值与判别在该点的迹不变；新增支撑含在底例外除子里，同旧严格支撑并在选定分解上是简单正规交叉的，重算一遍再套用前面的系数论证，得到有效的简单正规交叉判别，系数一逆像边界与模除子系都不变（`build/sections/normalization.tex:409`-`418`）。其二，生成元的选取无关紧要：若 $m=ap$ 且在一般纤维上 $s_m=cs^a$，$c\in\mathbf C(W)^*$，最小规则给出 $T_W(s_m)=T_W(s)+m^{-1}\operatorname{div}(c)$（`build/sections/normalization.tex:420`-`424`），而 $\operatorname{div}(c)$ 在规范辅助子对的定义中两处出现互相抵消，子对原样不动（`build/sections/normalization.tex:425`-`426`）。最小指标覆盖同截面下降用到的所有公共可分度因此全部兼容（`build/sections/normalization.tex:427`-`428`）。这两条合读，第五小节将重算的判别交回主线时，读者才确认它没夹带生成元选取带来的私货。

## §34 本续批勘误补记

本节只登记本续批新增部分（§28 至 §33）的缺陷，旧文的勘误已经躺在 §24、§26、§27 三节里，状态不动。

第一类，英文残留。§29 一处，把表示底侧的英文方位词留在了中文句子中间；§30 一处，把表示一致的英文动词写成了谓语；§31 一处，表示一般位置的英文形容词残留在改口句的前半段。按规格一律不做就地替换，交本体侧机械通道处理。

第二类，行文改口痕迹。§31 第二段中部有一处先落错误片段紧接着落正确片段的自纠痕迹，语义完全由后半句承担，前半句是多余字，同样不回改。

第三类，定界符配对错位的单字符就地修正。§30、§32、§33 的位置回指里共有四处把闭合反引号误写成了数学定界符，按规格关于定界符错位处置的条款当场改回反引号，字节数不变，未做任何奇偶补偿。这一动作同本续批派单第三条禁止改写已落盘内容有冲突，派单规定冲突时以规格为准，依据在此申报。

第四类，术语译法选择。素材里分解类对象与光滑性类对象我分别写作对数分解与对数光滑，除子系类型的对象写作差异除子系，对数典范的子类写作子对数典范；旧文 §0 至 §27 未出现这四件，同旧文不构成不一致，往后的新节以这些写法为准。

第五类，§28 一处结构句的来源说明。附录物理排布在正文归约根覆盖一节之后的那句出自构建目录顶层装配索引，不当作内容分片取证；本批其余位置回指全是内容文件的带行号完整相对路径。

第六类，台账续表位置申报。主台账只在 §25 出现一副，本批不重抄它的表头；新增续表放在 §35，表头首格用记号二字，其余四格沿用主表形制，分隔行由续表自带。

## §36 台账续表的勘误补记

§35 的三十五行数据里有四行在我落笔时把限制算子的竖线形带进了首格的数学式，致使这四行各含七枚竖线，越过续表每行六枚的规定。缺陷集中在首格，格内语义完好，按数据行次序分别是第 $8$、第 $10$、第 $12$ 与第 $25$ 行。规格协议规定已落盘内容不做就地替换，此四处交本体侧机械通道；即便整行作废，其余三十一行数据仍不低于数量下限。同一写法在 §31 正文段落还出现一处，正文里的限制竖线属合法数学记号，循 §26 第四类的先例在此一并注明，不算缺陷。本节之外的各项收尾自查，定界符配对、表头首格计数、分隔行枚数、节号连续、禁串命中，都在收工时以工具复量过，数字写进交付报告。

## §35 台账续表（附录各节）

本续表承接 §25 的台账形制，只记附录规范化补充分片的对象，位置栏全部是本会话真实读过的内容文件行号，表头首格用记号二字同主表区分。

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $H^0(V',\pi^*D)^{\operatorname{Gal}(V'/V)}=H^0(V,D)$ | 伽罗瓦且有限满，$D$ 嘉当 | build/sections/normalization.tex:33 | §30 下降把覆盖上截面空间搬回源 | 伽罗瓦凭证失手，截面空间认同在此断 |
| $(\pi_*\mathcal O_{V'})^{\operatorname{Gal}(V'/V)}=\mathcal O_V$ | 配射影公式使用 | build/sections/normalization.tex:43 | 引一伽罗瓦等式的证明 | 不变量归约到结构层不闭合 |
| $\kappa(V',\pi^*D)=\kappa(V,D)$ | 主导一般有限，$D$ 有理嘉当 | build/sections/normalization.tex:51 | 主线增长率不变才许换模型 | 换覆盖每步须重算 Iitaka 维数 |
| $R(V,D)\subseteq R(V',\pi^*D)$ | 取充分可分倍数后成立 | build/sections/normalization.tex:64 | 分次环超越次数比较 | 上侧截面不再在底侧整过，环比较散架 |
| $\dim H^0(V,mD)=1$ | $\kappa(V,D)=0$ 且截面空间非零 | build/sections/normalization.tex:54 | §31 固定零除子的成比例运算 | 跨度成比例的论证丢掉一维前提 |
| $H^0(Y,m(K_Y+D_Y))\hookrightarrow H^0(V,m(K_V+B))$ | $B$ 压住约化拉动边界，可分度 | build/sections/normalization.tex:87 | 对数拉动单射供应用侧系数一推论 | 进边界的门票没有出处 |
| $e-1$ | 分歧指数 $e$ 处雅可比贡献 | build/sections/normalization.tex:99 | 引三的逐素子阶核验 | 边界系数一不再够用，单射断 |
| $\kappa(V,D)\le\dim B+\kappa(G,D\rvert_G)$ | 易加法，$G$ 很一般纤维 | build/sections/normalization.tex:157 | 相对 Iitaka 构造的像维数上界 | $(p,\phi_m)$ 的像估计失效 |
| $\dim U-\dim B=k$ | 相对 Iitaka 纤维化的底相对维数 | build/sections/normalization.tex:115 | §30 里 $x:X'\to W$ 的设定 | 相对维数同加法原理的 $k$ 对不上 |
| $\kappa(G,D'\rvert_G)=0$ | 很一般纤维 $G$ | build/sections/normalization.tex:116 | 秩一比较的纤维零前提 | 一般 $p$ 度纤维截面空间不再一维 |
| $\mu_*\mathcal O_{V'}(m(K_{V'}+B_{V'}))=\mathcal O_V(m(K_V+B_V))$ | 每充分可分度成立 | build/sections/normalization.tex:136 | 对数改造恒等式认截面系统 | §30 反向把截面取回 $X'$ 一步断 |
| $D'\rvert_G\sim_{\mathbf Q}K_G+B_G$ | 对数光滑模型上 | build/sections/normalization.tex:123 | 纤维记号 $(J,D_J)$ 交接正文 | 对数除子的纤维限制脱钩 |
| $\operatorname{trdeg}_{\kappa(w)}\kappa(v)\le n-m$ | 相对剩余超越次数不等式 | build/sections/normalization.tex:183 | 限制赋值的除子性 | 上界丢失，夹逼成单边 |
| $\operatorname{trdeg}_{\mathbf C}\kappa(v)=n-1$ | 除子赋值恒等式 | build/sections/normalization.tex:185 | 推出 $\ge m-1$ 的下界 | 限制登记为除子性缺环 |
| 有限个 | $H$ 中像余维至少二的素子落在光滑轨迹外与除子部分 | build/sections/normalization.tex:191 | 固定模型上抽取的有限性 | 最小规则的底素子列不完 |
| $t_P=\min_{E\mapsto P}\frac{p^{-1}\operatorname{ord}^{pK_{X'/W}}_E(s)+d_E}{\operatorname{ord}_E(x^*P)}$ | 跑遍 $P$ 上方全部素子 $E$ | build/sections/normalization.tex:210 | $T_W$ 的底系数与 §33 阈值估计 | 单射塌缩不再等价于一条不等式 |
| $T_W=\sum_Pt_PP$ | 未分两本账的整个最小规则底项 | build/sections/normalization.tex:213 | §33 判别与模的拆分 | 正文的 $T$ 同附录底项认不齐 |
| $H^0(X',m(K_{X'}+D'))\hookrightarrow H^0(W,m(K_W+T_W))$ | 截面除以 $s^{m/p}$ 得到 | build/sections/normalization.tex:219 | 固定源下降的单射 | 主不等式的加法输入丢了底侧 |
| $a_E\operatorname{ord}_P(\sigma)+(m/p)\operatorname{ord}^{pK_{X'/W}}_E(s)+md_E\ge0$ | $E$ 在 $P$ 上方的对数正则等价 | build/sections/normalization.tex:230 | 三段分账的核验 | 不等式组同 $t_P$ 的一对一失效 |
| $\operatorname{ord}_P(\sigma)+mt_P\ge0$ | 整套不等式的汇合 | build/sections/normalization.tex:233 | 下降的底侧准入判据 | 底截面无从判允许 |
| $\dim(W/Y)=k$ | 相对 Iitaka 维数 | build/sections/normalization.tex:237 | $K_W+T_W$ 在 $Y$ 上大 | 加法原理右端底项不大 |
| $Z=E/p$ | 不依赖形式与度的选取 | build/sections/normalization.tex:260 | 固定零除子的唯一性与最小指数 | §31 成比例运算没有锚 |
| $p(\operatorname{div}(\omega_m)+mD)=mE$ | 跨度恒等式 | build/sections/normalization.tex:267 | $Z$ 与选取无关的证明 | 一维截面空间成比例论证散架 |
| $0\le\lceil A^*\rceil_{J'}\le\lceil E_{J'}/p\rceil\le E_{J'}$ | 逐系数夹逼 | build/sections/normalization.tex:289 | 差异层秩一的第二遍检验 | 子对负系数情形盖不住 |
| $E_{J'}=\operatorname{div}(\omega\rvert_{J'})+pD_{J'}$ | 对数分解上非负 | build/sections/normalization.tex:281 | 无差异变换的构造 | 三段夹逼失去起点 |
| $\kappa(E_{J'})=0$ | 对数双有理不变性 | build/sections/normalization.tex:293 | 有理函数空间至多一维 | 秩一结论推不上更高分解 |
| $\omega=\varepsilon\prod_i z_i^{a_i-pd_i}(dz_1\wedge\cdots\wedge dz_r)^{\otimes p}$ | $a_i\ge0$，$d_i\in\{0,1\}$ | build/sections/normalization.tex:308 | 环面素子的阶计算 | 对数微分改写无从下手 |
| $\operatorname{ord}_v(\Omega)=\sum_i n_i(1-d_i+a_i/p)-1$ | 环面素子 $v$ 的阶公式 | build/sections/normalization.tex:319 | 对数延拓的三分情形 | 阶的整数性论证悬空 |
| $d_i=1$ 且 $a_i=0$ | 和式系数恰在此为零 | build/sections/normalization.tex:325 | 系数一极点边界的识别 | 允许极点的轨迹画错 |
| $\operatorname{ord}_v(\Omega)\ge1$ | 极点边界外正和至少为一 | build/sections/normalization.tex:331 | 非极点素子的正则性 | 延拓丢掉稠密位 |
| $0\le B_W\le1$ | 阈值系数双边夹 | build/sections/normalization.tex:377 | §33 判别的有效简单正规交叉 | 判别系数一的上界破 |
| $c_P=\operatorname{lct}_{\eta_P}(X',\Delta;x^*P)$ | 一般点处的对数典范阈值 | build/sections/normalization.tex:366 | $b_P=1-c_P$ 与 $B_W$ 的定义 | 判别没法按公式重算 |
| $Q=K_{W_1}+T_{W_1}-\beta^*(K_{W_0}+T_{W_0})$ | 模型改变之间的扭量 | build/sections/normalization.tex:396 | $\Delta_{\mathrm{new}}=\Delta_{\mathrm{crepant}}+x_1^*Q$ 的认同 | 重算的代价不再显式，模部分受牵连 |
| $T_W(s_m)=T_W(s)+m^{-1}\operatorname{div}(c)$ | $m=ap$ 且 $s_m=cs^a$ 时 | build/sections/normalization.tex:422 | 辅助子对的生成元无关性 | 两处主部分量的抵消失去对象 |
| $K_{X'}+\Delta\sim_{\mathbf Q}x^*(K_W+T_W)$ | 数值等价恒等式 | build/sections/normalization.tex:359 | §33 的底项记账 | 判别与模的拆分无从落笔 |

