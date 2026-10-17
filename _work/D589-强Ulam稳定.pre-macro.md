# D589 强Ulam稳定性与可均性的刻画

## §0 登记与素材盘点

- 题名登记:本笔记为 D589 条目,题名「强Ulam稳定性与可均性的刻画」,对应原始论文 Strong Ulam Stability Characterizes Amenability,作者字段 OpenAI,日期 2026 年 10 月 5 日(见 `strong-ulam-stability.tex:37` 至 `strong-ulam-stability.tex:39`)。
- 目录登记:本单素材落在 preprints/Strong-Ulam-Stability-Characterizes-Amenability-October-5-2026,其他队列第 412 行号

素材盘点(实测):`build/` 排版目录下仅有一份源文件 `strong-ulam-stability.tex`,`wc -c` 实测 58,918 B、1,346 行;同仓库另一排版目录 `typst/` 含 main.typ、main.pdf 与 fig 目录(fig 实测 0 个文件,论文唯一插图是 tex 内嵌的 TikZ 画面,位于 `strong-ulam-stability.tex:1023` 至 `strong-ulam-stability.tex:1048`),本单限定只读 build 下的 .tex,因此素材实测合计为 58,918 B。派单标注给出的 117,141 一类对照值与实测显著不符,本笔记一律以 `wc -c` 实测为准。build 目录与素材根目录下均无 lean 文件与 yaml 文件,形式化路线不在本笔记范围内。

取证口径:首次落盘前共完成 15 次取证调用,覆盖目录列举、尺寸测量、全文读取与 9 组定点 grep 复核;首落发生在第 16 次调用,以单次 Write 完成,内容不超过 25,000 B;此后全部追加走文件末尾 Edit,Write 次数归 0。本笔记所有行号引用均指向 `strong-ulam-stability.tex`,位置一律以反引号闭合的行内代码形式书写。

## §1 问题提法与主定理

### 1.1 缺陷量与归一化

设 $G$ 为可数离散群,$H$ 为复 Hilbert 空间,$\mathcal U(H)$ 是其全体酉算子。对满足归一化条件 $\mu(e)=I$ 的映射 $\mu:G\to\mathcal U(H)$,文献在 `strong-ulam-stability.tex:52` 至 `strong-ulam-stability.tex:56` 定义缺陷量 $\mathrm{def}(\mu)=\sup_{g,h\in G}\lVert \mu(gh)-\mu(g)\mu(h)\rVert$,其中范数一律是算子范数。这里有两层结构值得先钉住:第一,上确界取遍全体乘积对 $(g,h)$,因此它度量的是乘法的逐点失真在整群上的一致包络;第二,归一化 $\mu(e)=I$ 排除了平凡的整体标量相位漂移,使缺陷量真正刻画"近似同态"这一概念本身。若把 $\mu$ 看作把 $G$ 嵌到度量空间 $(\mathcal U(H),\lVert\cdot\rVert)$ 里的近似映射,则 $\mathrm{def}(\mu)$ 是乘法与映射 $\mu$ 之间交换误差的一致界。

### 1.2 强Ulam稳定性定义

`strong-ulam-stability.tex:57` 至 `strong-ulam-stability.tex:61` 给出核心定义:$G$ 称为强Ulam稳定的,如果对每个 $\varepsilon>0$ 存在 $\delta>0$,使得任何满足 $\mathrm{def}(\mu)\le\delta$ 的归一化映射 $\mu:G\to\mathcal U(H)$ 都在 $\varepsilon$ 以内一致贴近某个酉表示 $\rho:G\to\mathcal U(H)$,即 $\sup_{g\in G}\lVert\mu(g)-\rho(g)\rVert\le\varepsilon$。定义里最容易被误读的一句是原文第 61 行强调的:数 $\delta$ 必须同时对所有 Hilbert 空间生效,包括无穷维空间。这句话把量化次序钉死为"先有 $\delta$,后有任意 $H$ 与任意 $\mu$",因此任何依赖特定 $H$ 的离散性(例如有限维中单位球的紧致性)都不允许进入 $\delta$ 的证明。

### 1.3 可均性一侧与主定理

可均性按 `strong-ulam-stability.tex:63` 至 `strong-ulam-stability.tex:64` 以不变均值方式给出:$G$ 可均当且仅当 $\ell^\infty(G)$ 上存在正线性泛函 $m$ 满足 $m(1)=1$ 与 $m(L_g f)=m(f)$,其中 $(L_g f)(x)=f(g^{-1}x)$。主定理(见 `strong-ulam-stability.tex:67` 至 `strong-ulam-stability.tex:70`)断言:可数离散群 $G$ 强Ulam稳定,当且仅当 $G$ 可均。摘要 `strong-ulam-stability.tex:42` 至 `strong-ulam-stability.tex:49` 同时点明两个补充事实:无穷维 Hilbert 空间的纳入是本质的;本文证明的是 Kazhdan 可均稳定性定理的逆命题,回答了 Burger、Ozawa、Thom 提出的问题。

### 1.4 逆命题的定量目标式

正命题方向(可均蕴含强稳定)由 Kazhdan 1982 年定理覆盖,见 `strong-ulam-stability.tex:72` 至 `strong-ulam-stability.tex:73`。真正的新内容在逆方向,其定量形式写在 `strong-ulam-stability.tex:74` 至 `strong-ulam-stability.tex:81`:对每个不可均可数群与每个 $\delta>0$,构造一个可分 Hilbert 空间 $H$ 与归一化映射 $\mu:G\to\mathcal U(H)$,使 $\mathrm{def}(\mu)<\delta$ 且

目标式(`strong-ulam-stability.tex:78` 至 `strong-ulam-stability.tex:81`):$\sup_{g\in G}\lVert\mu(g)-\rho(g)\rVert>\frac1{10}$ 对一切酉表示 $\rho:G\to\mathcal U(H)$ 成立。常数 $\frac1{10}$ 并不神圣,它是参数链条末端多重放宽后的产物;有意义的是它是一个与 $\delta$、与表示 $\rho$ 都无关的绝对正下界。换言之,缺陷可以任意小,而到表示阵的距离有一道墙。构造性要求里"可分"二字值得留意:`strong-ulam-stability.tex:75` 明确 $H$ 可分,而 `strong-ulam-stability.tex:757` 处的显式构造 $H=\bigoplus_{k=0}^{N}\bigoplus_{w\in G}(E_k,G_k)$ 中每层 $E_k$ 有限维、$G$ 可数、层数 $N=L+1$ 有限,可分性因此自动成立。

### 1.5 定义展开:强稳定失败意味着什么

把定义取反可以看清构造要对抗的对象:$G$ 不强稳定,当且仅当存在 $\varepsilon_0>0$,使得对每个 $\delta>0$ 都能找到某个 $H$ 与某个归一化 $\mu$,满足 $\mathrm{def}(\mu)\le\delta$ 而 $\inf_{\rho}\sup_{g\in G}\lVert\mu(g)-\rho(g)\rVert\ge\varepsilon_0$,其中 $\rho$ 取遍 $H$ 上全部酉表示。本文把 $\varepsilon_0$ 具体取成 $\frac1{10}$ 的严格下界形式。值得强调的一点是:对抗的表示 $\rho$ 必须定义在同一个 $H$ 上(`strong-ulam-stability.tex:59` 的 on the same space 字样),不允许把 $\mu$ 迁到更大的空间去"稀释"距离;这与渐近表示或弱包含类的讨论是两种不同的问题。

## §2 历史坐标与文献对照

### 2.1 主线文献

`strong-ulam-stability.tex:83` 至 `strong-ulam-stability.tex:96` 的史话小节给出四个支点。其一,Kazhdan 1982 年定理(`strong-ulam-stability.tex:86` 至 `strong-ulam-stability.tex:87`,书目见 `strong-ulam-stability.tex:1333` 至 `strong-ulam-stability.tex:1337`)给出可均群的一致校正;同一文献还给出亏格至少 2 的闭可定向曲面基本群的不稳定近似表示(`strong-ulam-stability.tex:87` 至 `strong-ulam-stability.tex:89`),这是历史上最早的负例。其二,Burger、Ozawa、Thom 证明任何包含非交换自由子群的群都不强Ulam稳定(`strong-ulam-stability.tex:89` 至 `strong-ulam-stability.tex:91`,对应其论文 Theorem 1.2),并在 `strong-ulam-stability.tex:91` 至 `strong-ulam-stability.tex:92` 明确提问强稳定性是否恰好刻画可均性,提问落点在其原文第 111 页。其三,Alpeev(`strong-ulam-stability.tex:93` 至 `strong-ulam-stability.tex:96`,书目 `strong-ulam-stability.tex:1286` 至 `strong-ulam-stability.tex:1289`)对受限 wreath 积 $A\wr G$($A$ 非平凡可数交换、$G$ 可数不可均)证明了不稳定,其测度等价关系手法能触达不含自由子群的例子。其四,本文填上的正是 $A\wr G$ 一类与更广泛的不可均群之间的空隙:凡不可均,皆不稳定。

### 2.2 有限维版本的分岔

`strong-ulam-stability.tex:98` 至 `strong-ulam-stability.tex:110` 澄清一个术语陷阱:不带 strong 的 Ulam stability 通常指把量词限制在有限维酉群 $\mathcal U(n)$ 族上的版本(对应 BOT 定义 2.1),而不可均群完全可能满足该有限维性质。Glebsky、Lubotzky、Monod、Rangarajan 的渐近上同调理论(`strong-ulam-stability.tex:102` 至 `strong-ulam-stability.tex:104`,书目 `strong-ulam-stability.tex:1316` 至 `strong-ulam-stability.tex:1319`)为广泛的高秩格给出有限维稳定;Fournier-Facio 与 Rangarajan(`strong-ulam-stability.tex:105` 至 `strong-ulam-stability.tex:108`,书目 `strong-ulam-stability.tex:1303` 至 `strong-ulam-stability.tex:1307`)把它推进到无穷可均基上的 wreath 积与 Thompson 群。`strong-ulam-stability.tex:109` 至 `strong-ulam-stability.tex:110` 特别指出:强版本里对应 wreath 积命题的失败,在 FF&R 论文 Remark 6.1 中已作解释。两条稳定性轨迹由此分岔:有限维版本是 rigidity 现象的秀场,强版本则被本文证明纯由可均性决定,中间的分水岭就是无穷维空间提供的自由度。

### 2.3 无穷维为何本质

从证明结构看,无穷维本质的机制在本文构造里可以指认到行:`strong-ulam-stability.tex:754` 至 `strong-ulam-stability.tex:758` 的空间 $H$ 沿群元素 $w\in G$ 取直和,当 $G$ 无穷时该直和无穷维;障碍二次型(`strong-ulam-stability.tex:1177` 至 `strong-ulam-stability.tex:1191`)依赖的符号框架对 $\sum_{x\in X}f(x)a_xa_x^{*}=0$(`strong-ulam-stability.tex:411` 至 `strong-ulam-stability.tex:413`)在维数 $m$ 趋于无穷的渐近里才有可用参数区间(维数充分大条件见 `strong-ulam-stability.tex:406` 至 `strong-ulam-stability.tex:407`)。若允许固定有限维,这些概率论证虽然逐维成立,但把维数一致压死的尝试会被表示论的反例族拦截。这与 2.2 小节的事实(某些不可均群有限维稳定)互为印证:强版本的量词必须覆盖所有维数,一步都不能让。

## §3 边界作用产生的旗帜系统

### 3.1 边界的定义与取用

`strong-ulam-stability.tex:182` 至 `strong-ulam-stability.tex:184` 定义:紧 $G$-空间称为边界,如果作用是极小的且强proximal的,即每条轨道稠密,且每个 Radon 概率测度的弱星轨道闭包都含点质量。`strong-ulam-stability.tex:185` 至 `strong-ulam-stability.tex:188` 引用 Furstenberg 的经典刻画:可数离散群不可均,当且仅当它 admits 一个非单点集的紧 Hausdorff 边界(另见 Kalantar-Kennedy 第 3 节,书目 `strong-ulam-stability.tex:1327` 至 `strong-ulam-stability.tex:1331`)。全文固定这样一个边界 $K$。`strong-ulam-stability.tex:189` 至 `strong-ulam-stability.tex:190` 提醒一个极小性推论:任一概率的轨道闭包只要含一个点质量,就含全体点质量。

`strong-ulam-stability.tex:192` 至 `strong-ulam-stability.tex:197` 论证 $K$ 无孤立点:若存在孤立点,极小性使所有点都孤立,紧性使 $K$ 有限;有限 $K$ 上的均匀概率是不变概率,与强proximal矛盾(除非 $K$ 单点)。结论是每个非空开集都包含任意多个两两不交的非空开集,这个"可无限分色"性质是后面分阶段染色 $\mathcal X_k=\{1,\dots,C\}$ 的拓扑弹药。

### 3.2 一致清单引理的陈述

`strong-ulam-stability.tex:203` 至 `strong-ulam-stability.tex:215` 是 Lemma uniform-list:设 $K$ 为紧 Hausdorff 边界,$U\subseteq K$ 非空开,$\zeta\in K$,$0<\beta<1$,则存在有限非空清单 $s_1,\dots,s_M\in G$(允许重复),满足 $s_j^{-1}\zeta\in U$ 对一切 $1\le j\le M$,且计数不等式 $\frac1M\#\{j:s_j^{-1}t\notin U\}<\beta$ 对一切 $t\in K$ 成立;此外存在 $\zeta$ 的开邻域 $O$ 使 $s_j^{-1}O\subseteq U$ 对每个 $j$ 成立。三点陈述结构对应三种用途:$s_j^{-1}\zeta\in U$ 固定"指定点处全部命中";一致计数把"几乎全部命中"从点 $\zeta$ 推广到全空间;$O$ 的性质保证后续阶段能 backwards 传递开集。

### 3.3 一致清单引理的证明解剖

证明从 `strong-ulam-stability.tex:218` 至 `strong-ulam-stability.tex:237`:取 $t_0\in U$ 与连续函数 $f:K\to[0,1]$ 使 $f(t_0)=1$、支集落在 $U$ 内,收集族 $\mathcal A=\{f\circ s^{-1}:s\in G,\ s^{-1}\zeta\in U\}\subset C(K,\mathbb R)$。断言是对每个 Radon 概率 $m$ 存在 $a\in\mathcal A$ 使 $\int_K a\,dm>1-\frac{\beta}{2}$(式 boundary-integral,`strong-ulam-stability.tex:225` 至 `strong-ulam-stability.tex:227`)。手法是对 $\nu=(m+\delta_\zeta)/2$ 用强proximal与极小性:因 $\delta_{t_0}$ 在 $\nu$ 的轨道闭包中,存在 $s\in G$ 使 $\frac12\big(\int_K f(s^{-1}t)\,dm(t)+f(s^{-1}\zeta)\big)>1-\frac{\beta}{4}$(`strong-ulam-stability.tex:231` 至 `strong-ulam-stability.tex:234`)。括号内两项各不超过 1,故各自都超过 $1-\frac{\beta}{2}$,于是既得积分下界,又强制 $s^{-1}\zeta\in U$,这就是族 $\mathcal A$ 定义里附加条件的来源。这个对半平均技巧把"指定点命中"与"平均命中"绑在同一次 proximal 逼近里,是全节最经济的一步。

其后 `strong-ulam-stability.tex:239` 至 `strong-ulam-stability.tex:262` 用反证加 Hahn-Banach 分离:若 $\mathrm{co}(\mathcal A)$ 不含处处大于 $1-\beta$ 的函数,则把凸集 $\mathrm{co}(\mathcal A)$ 与非空开凸集 $\mathcal O=\{q\in C(K,\mathbb R):q(t)>1-\beta\ \forall t\}$ 分离(`strong-ulam-stability.tex:242` 至 `strong-ulam-stability.tex:244`),得非零连续实线性泛函 $\Lambda$ 使 $\sup_{a\in\mathcal A}\Lambda(a)\le\inf_{q\in\mathcal O}\Lambda(q)$。`strong-ulam-stability.tex:251` 至 `strong-ulam-stability.tex:253` 论证 $\Lambda$ 自动正:若 $u\ge0$ 而 $\Lambda(u)<0$,则 $q+tu\in\mathcal O$ 对一切 $t\ge0$ 成立,分离不等式被打破。正的非零泛函满足 $\Lambda(1)>0$,归一化为 $\Lambda(1)=1$ 后,Riesz 表示定理把 $\Lambda$ 识别为对某个 Radon 概率 $m$ 的积分。把常值函数 $q=1-\beta+\varepsilon$ 代入分离式并令 $\varepsilon\downarrow0$ 得 $\sup_{a\in\mathcal A}\int_K a\,dm\le1-\beta$(`strong-ulam-stability.tex:259` 至 `strong-ulam-stability.tex:261`),与断言矛盾。

收尾 `strong-ulam-stability.tex:264` 至 `strong-ulam-stability.tex:275`:有限凸组合 $\sum\lambda_j f\circ s_j^{-1}$ 处处超过 $1-\beta$;紧性给出严格一致裕度;把系数近似为非负有理数(保持裕度)、通分,得到清单使 $\frac1M\sum_{j=1}^{M}f(s_j^{-1}t)>1-\beta$ 对一切 $t\in K$ 成立。$f$ 在 $U$ 外为零、取值于 $[0,1]$,故计数不等式随之成立。最后 $O=\bigcap_{j=1}^{M}s_jU$ 是 $\zeta$ 的开邻域且满足 $s_j^{-1}O\subseteq U$。通分一步把凸组合变成等权清单,是"平均"与"计数"两种语言之间的翻译桥。

### 3.4 相容稀疏旗帜命题

`strong-ulam-stability.tex:283` 至 `strong-ulam-stability.tex:319` 是 Prop flags:对不可均 $G$、每个整数 $N\ge1$ 与 $0<\beta<1$,存在有限非空集合 $\mathcal X_1,\dots,\mathcal X_N$ 与 $\mathcal Y_0,\dots,\mathcal Y_{N-1}$、映射 $s_k:\mathcal X_k\times\mathcal Y_{k-1}\to G$ 与旗帜 $b_k:G\times\mathcal X_k\times\mathcal Y_{k-1}\to\{\mathsf E,\mathsf F\}$,满足三条:

(F1)(`strong-ulam-stability.tex:296` 至 `strong-ulam-stability.tex:302`)若 $k<N$ 且 $b_k(w;x,y)=\mathsf E$,取 $v=ws_k(x,y)$,则 $b_{k+1}(v;x',y')=\mathsf E$ 对一切 $(x',y')\in\mathcal X_{k+1}\times\mathcal Y_k$ 成立;
(F2)(`strong-ulam-stability.tex:303` 至 `strong-ulam-stability.tex:307`)对每个 $k,w,x$,比例 $\frac{\#\{y:b_k(w;x,y)=\mathsf F\}}{|\mathcal Y_{k-1}|}\le\beta$;
(F3)(`strong-ulam-stability.tex:308` 至 `strong-ulam-stability.tex:313`)对每个 $k,v,y$,比例 $\frac{\#\{x:b_k(vs_k(x,y)^{-1};x,y)=\mathsf E\}}{|\mathcal X_k|}\le\beta$。

三条的性质类型各不相同:(F1) 是零层次的确定论断言,$\mathsf E$ 一经出现、后继全体为 $\mathsf E$,沿任何跨阶段路径,$\mathsf F$ 步构成初始段(`strong-ulam-stability.tex:386` 至 `strong-ulam-stability.tex:388` 用这句话定义了整个"路径词汇表");(F2) 说固定出发与第一标签时 $\mathsf F$ 稀薄;(F3) 说固定到达与第二标签时 $\mathsf E$ 稀薄。两条概率方向相反、各管一头,配合 (F1) 的刚性,后面才能让"前向全 $\mathsf E$"与"后向全 $\mathsf F$"两类事件同时高概率出现。命题末尾 `strong-ulam-stability.tex:315` 至 `strong-ulam-stability.tex:318` 的复制断言(任一字母表可独立换成任意正整数份拷贝,基数可任意大且可被任意预定正整数整除)是供 §4 使用大维数概率引理时调维数的旋钮。

### 3.5 旗帜证明的逆向构造

证明 `strong-ulam-stability.tex:321` 至 `strong-ulam-stability.tex:377` 从固定两点 $\xi,\zeta\in K$ 与整数 $C>1/\beta$ 出发(`strong-ulam-stability.tex:322`),取 $U_N=K$ 并 backwards 逐阶段构造开集与字母表(`strong-ulam-stability.tex:326` 至 `strong-ulam-stability.tex:344`):在 $U_k$ 内取两两不交非空开集 $U_{k,1},\dots,U_{k,C}$,令 $\mathcal X_k=\{1,\dots,C\}$;对每个颜色 $c$ 用 Lemma uniform-list 对 $(U_{k,c},\zeta)$ 取清单,重复补齐成公共长度 $M_k$,以 $\mathcal Y_{k-1}=\{1,\dots,M_k\}$ 编号,记元素 $s_k(c,y)$;再令 $U_{k-1}=\bigcap_{c}\bigcap_{y}s_k(c,y)U_{k,c}$(`strong-ulam-stability.tex:335` 至 `strong-ulam-stability.tex:338`),它由引理尾注的 $s_j^{-1}O\subseteq U$ 性质成为 $\zeta$ 的开邻域,并满足向后包含关系(式 backward-regions)`$s_k(c,y)^{-1}U_{k-1}\subseteq U_{k,c}\subseteq U_k$`(`strong-ulam-stability.tex:340` 至 `strong-ulam-stability.tex:343`)。注意交集方向:开集序列是沿阶段号倒着铺的,这正是 (F1) 传递性的几何来源。

旗帜按到达点定义(式 boundary-flags,`strong-ulam-stability.tex:347` 至 `strong-ulam-stability.tex:350`):对步 $w\mapsto v=ws_k(c,y)$,令 $b_k(w;c,y)=\mathsf E$ 当且仅当 $v^{-1}\xi\in U_{k,c}$,否则记 $\mathsf F$。三条验证:

(F1) 的验证(`strong-ulam-stability.tex:352` 至 `strong-ulam-stability.tex:359`):若该步为 $\mathsf E$,则 $v^{-1}\xi\in U_k$;对下一阶段的任意 $(c',y')$,把 backward-regions 用在阶段 $k+1$ 上得 $(vs_{k+1}(c',y'))^{-1}\xi=s_{k+1}(c',y')^{-1}v^{-1}\xi\in U_{k+1,c'}$,故后继步全体为 $\mathsf E$。这一步只用到 $v^{-1}\xi\in U_k$ 与 $s_{k+1}(c',y')^{-1}U_k\subseteq U_{k+1,c'}$,与 $\beta$ 无关,是纯几何包含。

(F2) 的验证(`strong-ulam-stability.tex:361` 至 `strong-ulam-stability.tex:365`):固定 $w,c$,把 Lemma uniform-list 的计数结论作用在边界点 $w^{-1}\xi$ 上;$\mathsf E$ 条件 $s_k(c,y)^{-1}w^{-1}\xi\in U_{k,c}$ 恰是清单命中 $U_{k,c}$ 的条件,故 $\mathsf F$ 的 $y$-比例不超过 $\beta$。这里清单引理的"指定点" $\zeta$ 与(F2)里的出发窗 $w^{-1}\xi$ 是两个不同角色:前者定死了 $s_j^{-1}\zeta\in U$ 使 backward 包含成立,后者让计数对一切 $t\in K$ 一致成立,一物两用。

(F3) 的验证(`strong-ulam-stability.tex:366` 至 `strong-ulam-stability.tex:370`):固定到达 $v$ 与 $y$,第一标签为 $c$ 且到达为 $v$ 的步的出发元唯一,是 $vs_k(c,y)^{-1}$;其旗帜为 $\mathsf E$ 当且仅当 $v^{-1}\xi\in U_{k,c}$。诸颜色集 $U_{k,c}$ 两两不交,故至多一个 $c$ 命中;又 $\frac1C<\beta$,得 $\mathsf E$ 比例不超过 $\beta$。不交性与 $C>1/\beta$ 是 (F3) 的全部所需,这也是为什么颜色必须在阶段内部两两不交、而阶段之间只需 backward 包含。

复制断言(`strong-ulam-stability.tex:372` 至 `strong-ulam-stability.tex:376`)把任一字母表换成它与某有限非空集的积集,并沿坐标投影拉回 $s_k$ 与 $b_k$;一切比例与 (F1) 的确定性都原样保持。

### 3.6 平移旗帜与构型

`strong-ulam-stability.tex:379` 至 `strong-ulam-stability.tex:385` 对 $g\in G$ 定义平移旗帜 $p=gb$,即 $p_k(w;x,y)=b_k(g^{-1}w;x,y)$,并把这样的平移称为一个构型。左平移把步 $w\mapsto ws_k(x,y)$ 映成同标签的步,故 (F1) 至 (F3) 对每个平移构型原样成立。`strong-ulam-stability.tex:386` 至 `strong-ulam-stability.tex:388` 再次强调路径词汇:沿跨阶段的任一路径,在一个构型看来 $\mathsf F$ 步必构成初始段,首个 $\mathsf E$ 之后余步全 $\mathsf E$。§5 将选取至多三个构型的集合 $\mathcal C$,而"构型=平移"这一点是后面协方差式(equivariance,`strong-ulam-stability.tex:880` 至 `strong-ulam-stability.tex:883`)成立的原因:群的作用把整套构造从一个窗搬到另一个窗,构造规则本身只依赖旗帜数据。

## §4 稀疏框架的概率线性代数

### 4.1 引理陈述

`strong-ulam-stability.tex:404` 至 `strong-ulam-stability.tex:433` 是 Lemma sparse,整个构造里唯一动用概率的组件。陈述:对每个 $0<\eta<\frac14$ 存在 $0<\beta_0<\frac1{16}$,使得当 $0<\beta\le\beta_0$ 时,对每个充分大的整数 $m$,在 $\mathbb R^m$ 中存在单位向量族 $(a_x)_{x\in X}$($|X|=2m$)与符号 $f(x)\in\{1,-1\}$,满足:(i) 取同号的两族各自构成标准正交基,因此 $\sum_{x\in X}f(x)a_xa_x^{*}=0$(式 frame-cancellation,`strong-ulam-stability.tex:411` 至 `strong-ulam-stability.tex:413`);(ii) 对每个 $S\subseteq X$ 且 $|S|\le 4\beta|X|$,合成算子 $F_S:\ell^2(S)\to\mathbb C^m$,$F_Se_x=a_x$,满足 $\lVert F_S^{*}F_S-\mathrm{id}\rVert\le\eta$(式 sparse-gram,`strong-ulam-stability.tex:416` 至 `strong-ulam-stability.tex:418`)。此外对每个充分大的 $n$,存在实正交 $n\times n$ 矩阵 $O$,在大小 $2n$ 的集合 $Y$ 上令 $J=\begin{pmatrix}0&O\\ O^{*}&0\end{pmatrix}$、$Z=\begin{pmatrix}\mathrm{id}&0\\0&-\mathrm{id}\end{pmatrix}$(式 JZ,`strong-ulam-stability.tex:422` 至 `strong-ulam-stability.tex:425`),使得只要 $|S|,|T|\le 4\beta|Y|$ 就有 $\lVert P_SJP_T\rVert\le\eta$(式 sparse-J,`strong-ulam-stability.tex:427` 至 `strong-ulam-stability.tex:430`)。推论句(同一块内)列出 $J^{*}=J$、$J^2=Z^2=\mathrm{id}$、$JZ=-ZJ$ 且 $J$ 对角元全零,这四条正是 §6 里 Clifford 型生成元 $\gamma_d$ 的代数原料。

条件 (ii) 的强度必须读准:它是同时对所有满足尺寸限制的小子集成立的界,不是逐个子集的存在性。全族同时受控这一点在 §5 与 §6 里被反复引用,因为它让每个到达扇区各自做正交归一时互不干扰、界不随扇区数累积。

### 4.2 Haar 集中不等式

证明 `strong-ulam-stability.tex:435` 至 `strong-ulam-stability.tex:490` 的骨架是标准 Haar 集中,文献自己标注参照 Lyubarskii-Vershynin 第 IV-B 节(`strong-ulam-stability.tex:437` 至 `strong-ulam-stability.tex:438`,书目 `strong-ulam-stability.tex:1339` 至 `strong-ulam-stability.tex:1343`)。设 $O$ 服从 $\mathbb R^m$ 正交群上的 Haar 分布。对固定的实单位向量 $u,v$,随机变量 $u^{*}Ov$ 的分布等同于单位球上均匀点的第一个坐标;用高斯表示 $(g_1,\dots,g_m)/(\sum_j g_j^2)^{1/2}$($g_j$ 独立标准高斯),对 $\sum_{j=2}^m g_j^2$ 条件化并用高斯尾估计,得对 $0<t<1$ 有 $\mathbb P\{|u^{*}Ov|>t\}\le 2\,\mathbb E\exp\big(-\frac{t^2}{2(1-t^2)}\sum_{j=2}^m g_j^2\big)=2(1-t^2)^{(m-1)/2}\le 2\exp(-\frac{(m-1)t^2}{2})$(`strong-ulam-stability.tex:445` 至 `strong-ulam-stability.tex:452`)。等号那一步用了 $\mathbb E e^{-s g^2}=(1+2s)^{-1/2}$ 的显式计算,把条件化后的尾界直接积成闭式。

### 4.3 网计数与熵界

取 $q=8\beta<\frac12$(`strong-ulam-stability.tex:454`)。对任意非空坐标集 $S,T$(尺寸至多 $qm$),在其实单位球上取 $\frac14$-网,点数至多 $9^{|S|}$ 与 $9^{|T|}$;双线性型在网点上绝对值至多 $\frac{\eta}{2}$ 则算子范数至多 $\eta$,理由是最大化向量对用网点逼近至多改变型值的一半(`strong-ulam-stability.tex:456` 至 `strong-ulam-stability.tex:459`)。尺寸至多 $qm$ 的子集个数至多 $\exp(mH(q))$,其中 $H(q)=-q\log q-(1-q)\log(1-q)$ 是二值熵(`strong-ulam-stability.tex:460` 至 `strong-ulam-stability.tex:464`)。于是某个子块 $P_SOP_T$ 范数超过 $\eta$ 的概率至多 $2\exp(2mH(q)+2qm\log 9-\frac{m\eta^2}{16})$(`strong-ulam-stability.tex:466` 至 `strong-ulam-stability.tex:470`)。选 $\beta_0$ 使 $q=8\beta_0$ 时 $2H(q)+2q\log 9<\frac{\eta^2}{32}$(`strong-ulam-stability.tex:471` 至 `strong-ulam-stability.tex:473`),则对一切充分大的 $m$ 上式小于一,存在一张正交矩阵使所有稀疏子块一致受控;实复算子范数对实矩阵一致,故复化无损失(`strong-ulam-stability.tex:475` 至 `strong-ulam-stability.tex:476`)。

计数账目值得单独核对:指数项里 $2mH(q)$ 来自两个方向的子集选择,$2qm\log 9$ 来自两张网的乘积,$-\frac{m\eta^2}{16}$ 来自尾概率,其中 $\frac{\eta^2}{16}$ 是把 $t=\frac{\eta}{2}$ 代入 $\frac{(m-1)t^2}{2}$ 并对 $m\ge2$ 放宽的结果。三项齐平的概率结构是典型的高维现象:熵项对 $q$ 线性占优消失,尾项按 $m$ 线性胜出,所以只要 $\beta_0$ 相对 $\eta$ 足够小,维数门槛一过事件整体落空。

### 4.4 两基合成与 J、Z 的推论

取两族基为标准基与该正交矩阵的列,符号分别 $+1$ 与 $-1$(`strong-ulam-stability.tex:478` 至 `strong-ulam-stability.tex:479`)。对并集的子集,其 Gram 矩阵减恒等有分块形 $\begin{pmatrix}0&O_{S,T}\\ O_{S,T}^{*}&0$ 型` 的写法要谨慎,原文在 `strong-ulam-stability.tex:480` 至 `strong-ulam-stability.tex:483` 给出 $\begin{pmatrix}0&O_{S,T}\\ O_{S,T}^{*}&0\end{pmatrix}$,其范数等于 $\lVert O_{S,T}\rVert$,由此得式 sparse-gram(`strong-ulam-stability.tex:484` 至 `strong-ulam-stability.tex:485`)。符号相反带来的抵消即 $\sum_x f(x)a_xa_x^{*}=I-AA^{*}=0$($A$ 为正交矩阵的列全体),一步心算。在维数 $n$ 重复同一构造得式 JZ;式 sparse-J 的每个压缩 $\lVert P_SJP_T\rVert$ 是两个异侧块 $O_{S',T'}$ 型的直和,定义域互正交、值域互正交,故范数取两块之大者(`strong-ulam-stability.tex:486` 至 `strong-ulam-stability.tex:489`)。

### 4.5 对称正交归一化及其兼容性

`strong-ulam-stability.tex:492` 至 `strong-ulam-stability.tex:504` 给出后续真正消费的形态:对每个容许子集 $S$,令 $\widetilde F_S=F_S(F_S^{*}F_S)^{-1/2}$(`strong-ulam-stability.tex:495` 至 `strong-ulam-stability.tex:498`),则 $\widetilde F_S$ 是列等距且 $\lVert\widetilde F_S-F_S\rVert\le C\eta$;依据是标量界 $|t^{-1/2}-1|\le C|t-1|$ 在谱区间 $[\frac34,\frac54]$ 上对 $F_S^{*}F_S$ 做函数演算(`strong-ulam-stability.tex:499` 至 `strong-ulam-stability.tex:500`)。兼容性观察(`strong-ulam-stability.tex:501` 至 `strong-ulam-stability.tex:503`):若 $S\subseteq T$ 且两者容许,则 $\widetilde F_S$ 与 $\widetilde F_T$ 限制到 $\ell^2(S)$ 相差至多 $2C\eta$,因为两者都在 $C\eta$ 范围内贴近同一个 $F_S$。这对"单调嵌套的两种调整距离一致小"在 §7 里升级为式 two-frame-distance,是两个构型到达框架互换代价的直接来源。所有界对全体子集同时成立,再次消费 4.1 的强读法。

## §5 度量迁移三引理

### 5.1 设定与陈述

`strong-ulam-stability.tex:506` 至 `strong-ulam-stability.tex:512` 的过渡段把问题语言切换到"同一向量空间上的两个内积":正算子 $B$ 定义 $\langle x,y\rangle_B=\langle x,By\rangle$,对应算子范数记 $\lVert\cdot\rVert_B$(`strong-ulam-stability.tex:508` 至 `strong-ulam-stability.tex:509`)。Lemma priority(`strong-ulam-stability.tex:514` 至 `strong-ulam-stability.tex:543`)假设 $A,B$ 为 Hilbert 空间 $E$ 上的正算子,满足 $\frac12\mathrm{id}\le A,B\le 2\mathrm{id}$、$A-B=h\Gamma$、$\Gamma^{*}=\Gamma$、$\lVert\Gamma\rVert\le1$、$0\le h\le\frac18$(`strong-ulam-stability.tex:516` 至 `strong-ulam-stability.tex:522`);$P$ 是与 $B$ 交换的正交投影,$R=PE$,且 $\lVert P\Gamma P\rVert\le\eta$(`strong-ulam-stability.tex:523` 至 `strong-ulam-stability.tex:524`)。结论(`strong-ulam-stability.tex:526` 至 `strong-ulam-stability.tex:530`,式 priority-estimates):存在指定算子 $S_R$ 使 $S_R^{*}AS_R=B$、$S_R(R)=R$、$\lVert S_R-\mathrm{id}\rVert\le Ch$、$\lVert(S_R-\mathrm{id})P\rVert\le Ch\eta$;$C$ 绝对,换成 $B$-范数后同型成立(改 $C$)。

嵌套情形(`strong-ulam-stability.tex:534` 至 `strong-ulam-stability.tex:540`,式 nested-transfer):若 $R\subseteq R'$ 且两投影都满足假设,则 $K=S_{R'}^{-1}S_R$ 满足 $K^{*}BK=B$、$\lVert K-\mathrm{id}\rVert_B\le Ch$、$\lVert(K-\mathrm{id})P\rVert_B\le Ch\eta$。最后 `strong-ulam-stability.tex:541` 至 `strong-ulam-stability.tex:542` 声明构造与正交直和交换、与一切同时约化 $A$、$B$、$P$ 的正交投影交换。注意"指定"二字:引理不只存在一个等距,它给出可重复执行的公式,后面 §6 要在无穷多位置并行使用该公式并要求它协变,指定性因此不是修饰。

### 5.2 证明:先把 B 拉成欧氏

第一步(`strong-ulam-stability.tex:546` 至 `strong-ulam-stability.tex:551`)令 $\widehat A=B^{-1/2}AB^{-1/2}=\mathrm{id}+hB^{-1/2}\Gamma B^{-1/2}$;因 $P$ 与 $B$ 交换,该坐标变换保持分解 $E=R\oplus R^{\perp}$(`strong-ulam-stability.tex:552` 至 `strong-ulam-stability.tex:553`)。按此分块写 $\widehat A=\begin{pmatrix}a&b\\ b^{*}&d\end{pmatrix}$、$E_0=d-b^{*}a^{-1}b$(Schur 补,`strong-ulam-stability.tex:554` 至 `strong-ulam-stability.tex:556`)。假设翻译成分块小量:`strong-ulam-stability.tex:558` 至 `strong-ulam-stability.tex:560` 给 $\lVert\widehat A-\mathrm{id}\rVert\le 2h$ 与 $\lVert a-\mathrm{id}_R\rVert\le 2h\eta$,后一条来自 $B^{-1}\le 2\mathrm{id}$ 把 $\lVert\Gamma\rVert$ 的压缩信息转到 $\widehat A$ 的 $R$-块。于是 $a$ 与 $E_0$ 正且可逆(`strong-ulam-stability.tex:561` 至 `strong-ulam-stability.tex:562`)。核心公式(式 priority-map,`strong-ulam-stability.tex:564` 至 `strong-ulam-stability.tex:571`)为 $Q_R=\begin{pmatrix}a^{-1/2}&-a^{-1}bE_0^{-1/2}\\ 0&E_0^{-1/2}\end{pmatrix}$、$S_R=B^{-1/2}Q_RB^{1/2}$。直验 $Q_R^{*}\widehat AQ_R=\mathrm{id}$ 给出 $S_R^{*}AS_R=B$;$Q_R$ 的第一分块列是下三角零块,故 $S_R(R)=R$(`strong-ulam-stability.tex:572` 至 `strong-ulam-stability.tex:575`)。$Q_R$ 就是分块 Cholesky 型的白化矩阵:$R$ 块先归一,$R^{\perp}$ 块用 Schur 补归一,交叉项由 $-a^{-1}b$ 消除。

### 5.3 无穷维一致性与嵌套

`strong-ulam-stability.tex:577` 至 `strong-ulam-stability.tex:593` 专门补谱论细节以保无穷维:由 $\widehat A\ge(1-2h)\mathrm{id}$ 得 $a\ge(1-2h)\mathrm{id}_R$、$\lVert b\rVert\le 2h$(`strong-ulam-stability.tex:578` 至 `strong-ulam-stability.tex:579`);对固定 $y$ 关于 $x$ 最小化二次型得 $E_0\ge(1-2h)\mathrm{id}_{R^{\perp}}$ 且 $\lVert E_0-\mathrm{id}_{R^{\perp}}\rVert\le 2h+\frac{4h^2}{1-2h}$(`strong-ulam-stability.tex:580` 至 `strong-ulam-stability.tex:584`,理由陈述在 `strong-ulam-stability.tex:585` 至 `strong-ulam-stability.tex:586`)。在固定谱区间上做函数演算给 $\lVert Q_R-\mathrm{id}\rVert\le Ch$ 与 $\lVert(Q_R-\mathrm{id})P\rVert=\lVert a^{-1/2}-\mathrm{id}_R\rVert\le Ch\eta$(`strong-ulam-stability.tex:587` 至 `strong-ulam-stability.tex:593`),共轭 $B^{1/2}$ 至多让界翻倍(`strong-ulam-stability.tex:594` 至 `strong-ulam-stability.tex:595`)。等式 $\lVert(Q_R-\mathrm{id})P\rVert=\lVert a^{-1/2}-\mathrm{id}_R\rVert$ 值得多看一眼:$Q_R-\mathrm{id}$ 作用在 $R$ 上只剩 $(a^{-1/2}-\mathrm{id})$ 块,交叉项 $-a^{-1}bE_0^{-1/2}$ 作用在 $R^{\perp}$ 分量上,因此投影 $P$ 恰好滤掉了交叉块。小 $\eta$ 假设 $\lVert P\Gamma P\rVert\le\eta$ 正是从这一步进入最终估计的。

嵌套(`strong-ulam-stability.tex:597` 至 `strong-ulam-stability.tex:605`):$S_R$ 与 $S_{R'}$ 都是从 $B$-内积到 $A$-内积的等距,故 $K$ 为 $B$-酉;由 $K-\mathrm{id}=S_{R'}^{-1}(S_R-S_{R'})$ 与 $R\subseteq R'$,两项在整体上都是 $O(h)$、在 $R$ 上是 $O(h\eta)$,而 $S_{R'}^{-1}$ 范数一致有界。约化子空间的交换性(`strong-ulam-stability.tex:606` 至 `strong-ulam-stability.tex:607`)由式 priority-map 每步运算保公共约化空间立得,这为 §6 里"整层直和不受单块界拖累"背书。

### 5.4 不依赖优先子空间的标准迁移

`strong-ulam-stability.tex:610` 至 `strong-ulam-stability.tex:618` 记录第二个等距 $C_{A,B}=A^{-1/2}B^{1/2}$,满足 $C_{A,B}^{*}AC_{A,B}=B$(式 fixed-transfer,`strong-ulam-stability.tex:612` 至 `strong-ulam-stability.tex:614`)。它尊重 $A$ 与 $B$ 的一切公共约化子空间(`strong-ulam-stability.tex:615`),关键是它完全不依赖 $R$、$\mathcal C$、优先投影。用途分工(`strong-ulam-stability.tex:616` 至 `strong-ulam-stability.tex:617`):酉交换的一侧用 $C_{A,B}$,另一侧用 $S_R^{-1}$。`strong-ulam-stability.tex:617` 至 `strong-ulam-stability.tex:618` 提醒:两个正交子空间间的酉交换一般不是对合。这句话在 §6 式 swap 处兑现为"正反向腿不同料",§7 的消去账目全靠它。

### 5.5 截断引理:近似不变到精确不变

Lemma truncate(`strong-ulam-stability.tex:624` 至 `strong-ulam-stability.tex:638`)输入酉算子 $U$ 与投影 $P$,假设 $\lVert U-\mathrm{id}\rVert\le t<\frac12$、$\lVert(U-\mathrm{id})P\rVert\le e\le\frac12$,输出在 $PE$ 上为恒等、保持 $(\mathrm{id}-P)E$ 不变的酉 $\widehat U$,满足 $\lVert\widehat U-U\rVert\le 3e$、$\lVert\widehat U-\mathrm{id}\rVert\le t+3e$,且对任意 Hilbert 维数成立(`strong-ulam-stability.tex:631` 至 `strong-ulam-stability.tex:637`)。证明(`strong-ulam-stability.tex:640` 至 `strong-ulam-stability.tex:664`):按 $E=PE\oplus(\mathrm{id}-P)E$ 分块 $U=\begin{pmatrix}a&b\\ c&d\end{pmatrix}$;由 $(U^{*}-\mathrm{id})P=-U^{*}(U-\mathrm{id})P$ 得 $\lVert b\rVert,\lVert c\rVert\le e$ 与 $\lVert U-\begin{pmatrix}\mathrm{id}&0\\0&d\end{pmatrix}\rVert\le 2e$(`strong-ulam-stability.tex:645` 至 `strong-ulam-stability.tex:651`);$d$ 满足 $\lVert d-\mathrm{id}\rVert\le t<1$ 故无穷维下仍可逆,其极分解因子 $v=d(d^{*}d)^{-1/2}$ 酉(`strong-ulam-stability.tex:652` 至 `strong-ulam-stability.tex:655`);酉性给 $d^{*}d=\mathrm{id}-b^{*}b$,于是 $\lVert v-d\rVert=\lVert\mathrm{id}-(d^{*}d)^{1/2}\rVert\le 1-\sqrt{1-e^2}\le e^2$(`strong-ulam-stability.tex:656` 至 `strong-ulam-stability.tex:660`);取 $\widehat U=\mathrm{id}\oplus v$ 得 $\lVert\widehat U-U\rVert\le 2e+e^2\le 3e$(`strong-ulam-stability.tex:661` 至 `strong-ulam-stability.tex:662`)。

误差账目里最妙的是 $e^2$ 项:从 $\begin{pmatrix}\mathrm{id}&0\\0&d\end{pmatrix}$ 到 $\begin{pmatrix}\mathrm{id}&0\\0&v\end{pmatrix}$ 只花二阶小量,因为 $d$ 的奇异值全在 $1+O(e^2)$ 内($d^{*}d$ 偏离 $\mathrm{id}$ 是 $b^{*}b$ 阶)。`strong-ulam-stability.tex:666` 至 `strong-ulam-stability.tex:668` 补一句适用范围:该引理同样可用于 Lemma priority 的 $B$-内积,因为与 $B$ 交换的投影对该内积仍是正交投影。§7 中它把 $K_k$ 修成精确固定下一层出发子空间的 $\widetilde K_k$(`strong-ulam-stability.tex:1009` 至 `strong-ulam-stability.tex:1016`)。

## §6 分层 Hilbert 空间与酉电路

### 6.1 参数与标签

过渡段 `strong-ulam-stability.tex:670` 至 `strong-ulam-stability.tex:676` 宣告任务:把 §3 的旗帜变成酉电路,电路在层间搬运向量、逐处用一个冗余框架替换一份标准正交坐标因子,内积的选择使首末层之间积累出可探测的变化。参数设定(`strong-ulam-stability.tex:678` 至 `strong-ulam-stability.tex:690`):取整数 $L$、令 $N=L+1$、$h=\frac1{2\sqrt L}$(式 h,`strong-ulam-stability.tex:680` 至 `strong-ulam-stability.tex:682`);$L$ 大到覆盖所有数值下界,特别 $h\le\frac18$ 契合 Lemma priority(`strong-ulam-stability.tex:683` 至 `strong-ulam-stability.tex:684`);$\\eta$ 小、$\beta$ 按 Lemma sparse 取(`strong-ulam-stability.tex:685` 至 `strong-ulam-stability.tex:686`);由 Prop flags 拿 $N$ 个阶段的字母表与旗帜,并用复制断言把各字母表基数调成充分大的偶数以适配 Lemma sparse(`strong-ulam-stability.tex:687` 至 `strong-ulam-stability.tex:690`)。

写 $|\mathcal X_k|=2m_k$;对 $x\in\mathcal X_k$ 取 $\mathbb R^{m_k}$ 中的两基并集向量 $a_{k,x}$,符号 $f_k(x)=\pm1$,故 $\sum_{x\in\mathcal X_k}f_k(x)a_{k,x}a_{k,x}^{*}=0$(式 signed-frame,`strong-ulam-stability.tex:692` 至 `strong-ulam-stability.tex:697`)。对 $1\le d\le L$,在 $\mathbb C^{\mathcal Y_d}$ 上取 Lemma sparse 供应的 $J_d$ 与 $Z_d$:$J_d$ 对称对合、对角全零、与对角奇偶矩阵 $Z_d$ 反交换(`strong-ulam-stability.tex:698` 至 `strong-ulam-stability.tex:701`)。全体坐标空间复化。全标签集 $\mathcal I=\prod_{k=1}^N\mathcal X_k\times\prod_{d=0}^L\mathcal Y_d$(`strong-ulam-stability.tex:703` 至 `strong-ulam-stability.tex:706`),记 $i\in\mathcal I$ 的坐标为 $x_k(i)$、$y_d(i)$。

### 6.2 Jordan-Wigner 弦与算子 D

在形式标签空间 $\mathbb C^{\mathcal I}$ 上定义 $\gamma_d=f_d(X_d)Z_1\cdots Z_{d-1}J_d$、$D=\frac1{\sqrt L}\sum_{d=1}^L\gamma_d$(式 clifford,`strong-ulam-stability.tex:709` 至 `strong-ulam-stability.tex:712`)。这是 Jordan-Wigner 奇偶弦构造(`strong-ulam-stability.tex:713` 至 `strong-ulam-stability.tex:714`,原文引 Jordan-Wigner 1928 与 Bravyi-Kitaev,书目 `strong-ulam-stability.tex:1321` 至 `strong-ulam-stability.tex:1325` 与 `strong-ulam-stability.tex:1291` 至 `strong-ulam-stability.tex:1295`)。逐因子读:$f_d(X_d)$ 是 $\mathcal X_d$ 因子上的对角算子,每个 $Z_j$、$J_j$ 作用在自己标注的 $\mathcal Y_j$ 因子上,未标注因子配恒等(`strong-ulam-stability.tex:715` 至 `strong-ulam-stability.tex:717`)。当 $d<e$ 时,对易账目只有两处失礼:$\gamma_d$ 含 $J_d$、$\gamma_e$ 含 $Z_d$,同一因子反交换;其余因子或相同或不同、全部可对易。故 $\gamma_d\gamma_e=-\gamma_e\gamma_d$(`strong-ulam-stability.tex:718` 至 `strong-ulam-stability.tex:720`)。推论式 D-identities(`strong-ulam-stability.tex:721` 至 `strong-ulam-stability.tex:724`):$\gamma_d^{*}=\gamma_d$、$\gamma_d^2=I$、$D^{*}=D$、$D^2=I$、$\tr D=0$。$D^2=I$ 是反交换性的直接红利:交叉项两两相消,只剩 $\frac1L\sum_d\gamma_d^2=I$;而 $\tr D=0$ 由每个 $J_d$ 对角全零继承(`strong-ulam-stability.tex:725`),为 §8 见证引理里 $\tr(D+\frac12D^2)$ 的常数项供料。

### 6.3 各层坐标空间与层度量

第 $k$ 层坐标空间定义为 $E_k=\bigotimes_{j\le k}\mathbb C^{m_j}\otimes\bigotimes_{j>k}\mathbb C^{\mathcal X_j}\otimes\bigotimes_{d=0}^L\mathbb C^{\mathcal Y_d}$(`strong-ulam-stability.tex:727` 至 `strong-ulam-stability.tex:732`)。读法:位置号 $\le k$ 的 $\mathcal X$ 因子已被框架"压缩"成 $\mathbb C^{m_j}$,更大的还保持标签坐标原样;全部 $\mathcal Y$ 因子恒在。因此 $\gamma_d$ 在 $E_k$ 上只要 $d>k$ 仍有意义(`strong-ulam-stability.tex:733` 至 `strong-ulam-stability.tex:734`)。层度量取式 level-metric:`strong-ulam-stability.tex:735` 至 `strong-ulam-stability.tex:737` 给 $G_k=I+h\sum_{k<d\le L}\gamma_d$,即第 $k$ 层的内积由尚未压缩的 $\gamma$ 弦以 $h$ 权重扰动。反交换给式 metric-bound(`strong-ulam-stability.tex:739` 至 `strong-ulam-stability.tex:742`):$\frac12I\le G_k\le\frac32I$、$G_0=I+\frac12D$、$G_L=G_N=I$。端点解释:$k=0$ 时求和吃满全体 $L$ 项、系数 $h\cdot L=\frac{\sqrt L}{2}$,故 $G_0=I+\frac12D$;$k=N$ 时求和为空。谱界来自 $\pm1$ 特征值计数,与维数无关。

标签向量 $v_i^{(k)}\in E_k$ 在因子 $j\le k$ 用 $a_{j,x_j(i)}$、因子 $j>k$ 用标准向量 $e_{x_j(i)}$、$\mathcal Y_d$ 因子用 $e_{y_d(i)}$(`strong-ulam-stability.tex:743` 至 `strong-ulam-stability.tex:745`)。断言其 $G_k$-范数为 1:式 level-metric 的每个附加项在某 $\mathcal Y_d$ 因子上的对角元为零(`strong-ulam-stability.tex:745` 至 `strong-ulam-stability.tex:746`),因为 $\gamma_d$ 含 $J_d$、$J_d$ 对角全零,张量积的对角元随之为零。`strong-ulam-stability.tex:748` 至 `strong-ulam-stability.tex:752` 归纳 $G_k$ 两特征:在已压缩因子 $\mathbb C^{m_j}$($j\le k$)上是恒等;与 $j>k$ 的每个 $\mathcal X_j$ 坐标投影及 $d\le k$ 的每个 $\mathcal Y_d$ 坐标投影交换,理由是在该处幸存的求和项只携带这些 $\mathcal Y_d$ 因子上的对角奇偶算子 $Z$。

### 6.4 总空间与平移表示

式 big-space(`strong-ulam-stability.tex:754` 至 `strong-ulam-stability.tex:758`)取 Hilbert 直和 $H=\bigoplus_{k=0}^N\bigoplus_{w\in G}(E_k,G_k)$,并记层 $H_k=\bigoplus_{w\in G}(E_k,G_k)$。$H$ 可分;对位置 $w$ 的左平移给出真正的酉表示 $U:G\to\mathcal U(H)$,平移不动标签、不动层号(`strong-ulam-stability.tex:759` 至 `strong-ulam-stability.tex:761`)。这条 $U$ 就是 §7 末组装 $\mu$ 时乘在右边的"真表示底座";$\mu$ 对它的偏离是电路修正项,偏离幅度由比较命题控制,而它本身在见证引理里被真表示 $\rho$ 吸收。

### 6.5 可切换边与到达端子空间

固定至多三个构型的非空集 $\mathcal C$ 与 $p\in\mathcal C$(`strong-ulam-stability.tex:763` 至 `strong-ulam-stability.tex:765`);用集合，并非序列是为了去重平移副本而不动任何定义(`strong-ulam-stability.tex:765` 的说明)。阶段 $k$ 的边是四元组 $(w,k,x,y)$,到达 $v=ws_k(x,y)$(`strong-ulam-stability.tex:766` 至 `strong-ulam-stability.tex:767`);边称为对 $\mathcal C$ 可切换,若其旗帜在 $\mathcal C$ 的构型间不全体相同(`strong-ulam-stability.tex:767` 至 `strong-ulam-stability.tex:768`)。$p$ 的层只交换"可切换且在 $p$ 里旗为 $\mathsf F$"的边(`strong-ulam-stability.tex:769` 至 `strong-ulam-stability.tex:771`)。

对固定到达 $v$ 与固定 $y\in\mathcal Y_{k-1}$,式 switchable-set(`strong-ulam-stability.tex:774` 至 `strong-ulam-stability.tex:778`)定义 $S_{k,v,y}^{\mathcal C}=\{x\in\mathcal X_k:(vs_k(x,y)^{-1},k,x,y)\ \text{可切换}\}$。每条可切换边在某个构型里旗为 $\mathsf E$(否则全体 $\mathsf F$、旗帜相同),由到达界 (F3) 得式 switchable-size:`strong-ulam-stability.tex:780` 至 `strong-ulam-stability.tex:783` 给 $|S_{k,v,y}^{\mathcal C}|\le|\mathcal C|\beta|\mathcal X_k|$。这正是把 §3 计数语言翻译进线性代数维数的关节:$S$ 是"小"子集,$|\mathcal C|\le3$ 与 $\beta\le\beta_0\le4\beta|\mathcal X_k|$ 的尺寸折算(注意引理里 $4\beta|X|\le 8\beta m$ 而 $|\mathcal X_k|=2m_k$,系数余量由 $\beta_0\le\frac1{16}$ 把关)让式 sparse-gram 恰好够用。

对 $S=S_{k,v,y}^{\mathcal C}$,以列 $a_{k,x}$($x\in S$)构成 $F_S$,按式 adjusted-frame(`strong-ulam-stability.tex:784` 至 `strong-ulam-stability.tex:789`)做对称正交归一 $\widetilde F_S=F_S(F_S^{*}F_S)^{-1/2}$、$\widetilde a_{k,v,y,x}^{\mathcal C}=\widetilde F_Se_x$;式 frame-adjustment(`strong-ulam-stability.tex:791` 至 `strong-ulam-stability.tex:794`)给 $\widetilde F_S^{*}\widetilde F_S=I$ 与 $\lVert\widetilde F_S-F_S\rVert\le C\eta$;空集无列可调(`strong-ulam-stability.tex:795`)。边的左子空间取位置 $(k-1,w)$ 处 $X_k=x$、$Y_{k-1}=y$ 的坐标扇区;右子空间在 $(k,v)$,固定 $Y_{k-1}=y$、$X_k$ 压缩到 $\widetilde a_{k,v,y,x}^{\mathcal C}$ 张成的线,其余张量因子不受限(`strong-ulam-stability.tex:797` 至 `strong-ulam-stability.tex:800`)。不同边的左子空间互正交,右子空间亦互正交;右侧要用式 adjusted-frame 与 $G_k$ 在压缩 $X_k$ 因子上为恒等这两点(`strong-ulam-stability.tex:801` 至 `strong-ulam-stability.tex:803`)。

### 6.6 边两端度量的显式差

左右子空间去掉 $X_k$、$Y_{k-1}$ 后残坐标相同;度量分别记 $A_{x,y}$(左,来自 $G_{k-1}$)与 $B_y$(右,来自 $G_k$)。式 edge-metrics(`strong-ulam-stability.tex:808` 至 `strong-ulam-stability.tex:813`)对 $k\le L$ 给 $A_{x,y}=B_y+h\Gamma_{x,y}$、$\Gamma_{x,y}=f_k(x)Z_1\cdots Z_{k-1}J_k|_{Y_{k-1}=y}$、$\lVert\Gamma_{x,y}\rVert=1$。结构读法:$G_{k-1}$ 与 $G_k$ 的差只有一项 $h\gamma_k$,而 $\gamma_k$ 的 $\mathcal X_k$ 因子贡献对角符号 $f_k(x)$、$\mathcal Y_{k-1}$ 因子在固定坐标 $y$ 上退化为 $\pm1$ 的奇偶因子、$\mathcal Y_k$ 因子留下 $J_k$ 的限制;更早的压缩 $X$ 因子全程恒等(`strong-ulam-stability.tex:814` 至 `strong-ulam-stability.tex:815`);$k=N$ 时两度量同为恒等(`strong-ulam-stability.tex:815` 至 `strong-ulam-stability.tex:816`)。$\lVert\Gamma_{x,y}\rVert=1$ 因 $J_k$ 是正交对合的限制仍是范数 1(稀疏压缩例外,但此处未压缩)。Lemma priority 的全部假设至此逐一到位:步长 $h$、扰动方向 $\Gamma$、需要保护的子空间将在 6.7 定义。

### 6.7 优先集与优先投影

式 priority-set(`strong-ulam-stability.tex:819` 至 `strong-ulam-stability.tex:824`)对 $k\le L$、到达 $v$、下一标签 $z\in\mathcal X_{k+1}$ 定义 $R_{k,v,z}^{\mathcal C}=\{t\in\mathcal Y_k:q_{k+1}(v;z,t)=\mathsf F\ \text{对某}\ q\in\mathcal C\}$。出发界 (F2) 给 $|R_{k,v,z}^{\mathcal C}|\le 3\beta|\mathcal Y_k|$(`strong-ulam-stability.tex:825`,三个构型各出 $\beta$ 份),这里用的是 (F2),对 6.5 节用的是 (F3),两条计数界在构造里各司一职。$P_{k,v}^{\mathcal C}$ 是残坐标上的投影:在扇区 $X_{k+1}=z$ 里挑选 $Y_k\in R_{k,v,z}^{\mathcal C}$,其余因子恒等(`strong-ulam-stability.tex:826` 至 `strong-ulam-stability.tex:828`)。它满足与 $B_y$ 交换(`strong-ulam-stability.tex:830`),并有式 compressed-gamma:`strong-ulam-stability.tex:831` 至 `strong-ulam-stability.tex:833` 给 $\lVert P_{k,v}^{\mathcal C}\Gamma_{x,y}P_{k,v}^{\mathcal C}\rVert\le\eta$。论证(`strong-ulam-stability.tex:834` 至 `strong-ulam-stability.tex:838`):按未来 $X$ 坐标与更早 $Y$ 坐标分解,每块里的压缩至多是带符号的 $J_k[R,R]$、$|R|\le3\beta|\mathcal Y_k|$,Lemma sparse 的式 sparse-J 顶住(其尺寸条件是 $4\beta|\mathcal Y_k|$,$3\beta$ 有富余),直和取大不升。

### 6.8 交换矩阵与电路

对每条边用 Lemma priority 得指定等距 $S_e^{\mathcal C}$:(残坐标,$B_y$)$\to$(残坐标,$A_{x,y}$),式 edge-transfer(`strong-ulam-stability.tex:846` 至 `strong-ulam-stability.tex:849`)给 $\lVert S_e^{\mathcal C}-I\rVert\le Ch$、$\lVert(S_e^{\mathcal C}-I)P_{k,v}^{\mathcal C}\rVert\le Ch\eta$;$k=N$ 时置 $S_e^{\mathcal C}=I$(`strong-ulam-stability.tex:850`)。左到右用 $(S_e^{\mathcal C})^{-1}$,右到左用式 fixed-leg(`strong-ulam-stability.tex:853` 至 `strong-ulam-stability.tex:855`)的 $C_{x,y}=A_{x,y}^{-1/2}B_y^{1/2}$,后者与 $\mathcal C$、$p$、优先投影无关(`strong-ulam-stability.tex:856`)。式 swap(`strong-ulam-stability.tex:859` 至 `strong-ulam-stability.tex:862`)在边的左右子空间上定义 $M_e^{\mathcal C}=\begin{pmatrix}0&C_{x,y}\\ (S_e^{\mathcal C})^{-1}&0\end{pmatrix}$;两个离对角块各为到指定端点的等距,故 $M_e^{\mathcal C}$ 酉,一般不是对合(`strong-ulam-stability.tex:863` 至 `strong-ulam-stability.tex:866`):逆从右到左用 $S_e^{\mathcal C}$,正向从右到左用 $C_{x,y}$。

阶段 $k$ 层 $M_{p,k}^{\mathcal C}$ 在每条"可切换且 $p$ 里为 $\mathsf F$"的边上执行式 swap,在其余端点子空间的正交补上恒等(`strong-ulam-stability.tex:868` 至 `strong-ulam-stability.tex:870`);正交性保证这是酉算子,即便出现无穷多位置(`strong-ulam-stability.tex:870` 至 `strong-ulam-stability.tex:871`)。式 circuit(`strong-ulam-stability.tex:872` 至 `strong-ulam-stability.tex:875`)定义 $W_p^{\mathcal C}=M_{p,N}^{\mathcal C}\cdots M_{p,1}^{\mathcal C}$ 与比较算子 $V_{qp}^{\mathcal C}=W_q^{\mathcal C}(W_p^{\mathcal C})^{-1}$,层按 $1,\dots,N$ 顺序施加(`strong-ulam-stability.tex:876`)。每个环节都由坐标投影与正平方根的显式配方给出、只通过旗帜依赖群位置(`strong-ulam-stability.tex:878` 至 `strong-ulam-stability.tex:879`),于是式 equivariance(`strong-ulam-stability.tex:880` 至 `strong-ulam-stability.tex:883`)成立:$U(g)W_p^{\mathcal C}U(g)^{-1}=W_{gp}^{g\mathcal C}$、$U(g)V_{qp}^{\mathcal C}U(g)^{-1}=V_{gq,gp}^{g\mathcal C}$。`strong-ulam-stability.tex:884` 至 `strong-ulam-stability.tex:886` 点题:这正协变性是把两两比较拼成近似表示的前提;下一节先处理"第三个构型的加入只微扰比较"。

## §7 构型数的比较:二与三

### 7.1 问题的逻辑位置

`strong-ulam-stability.tex:890` 至 `strong-ulam-stability.tex:893` 摆出张力所在:在同一个固定集合 $\mathcal C$ 内部,比较算子精确相合,即 $V_{rq}^{\mathcal C}V_{qp}^{\mathcal C}=V_{rp}^{\mathcal C}$;可是组装近似表示时,每一次乘法比较都必须用乘积两端各自的构型对来做,集合大小随 $g$ 变动。Prop comparison(`strong-ulam-stability.tex:895` 至 `strong-ulam-stability.tex:904`)因此断言:存在数值常数 $C$ 与 $h_0>0$,当 $h\le h_0$、$0<\eta\le\frac14$ 时,对任意三构型 $p,q,r$ 有 $\lVert V_{qp}^{\{p,q\}}-V_{qp}^{\{p,q,r\}}\rVert\le Ch+CN\eta+CNh\eta$(式 comparison,`strong-ulam-stability.tex:898` 至 `strong-ulam-stability.tex:901`)。常数与一切字母表基数无关、与构型选择无关。$N$ 在界中显式出现,呼应原文约定(`strong-ulam-stability.tex:170` 至 `strong-ulam-stability.tex:171`):凡对 $N$ 层求和必写明因子 $N$。证明分三部(`strong-ulam-stability.tex:906` 至 `strong-ulam-stability.tex:909`):先把两个构造放进同一到达框架;再让 $p$、$q$ 共有交换精确消去;余下的是优先等距之差,其误差被搬运到彼此正交的层上、按最大值合并,沿路径求和。

### 7.2 第一部:改到达框架的算子代价

记 $\mathcal C_2=\{p,q\}$、$\mathcal C_3=\{p,q,r\}$。每个到达扇区有 $S_2\subseteq S_3$,式 two-frame-distance(`strong-ulam-stability.tex:915` 至 `strong-ulam-stability.tex:918`)给 $\lVert\widetilde F_{S_2}-\widetilde F_{S_3}|_{\mathbb C^{S_2}}\rVert\le C\eta$,这正是 §4.5 兼容性观察的现场调用。把二构型电路的到达向量暂时换成 $\widetilde F_{S_3}$ 的对应列,边与优先结构不动,所得层与电路记 $\overline M_{p,k}$、$\overline W_p$(`strong-ulam-stability.tex:919` 至 `strong-ulam-stability.tex:922`)。

算子范数代价的算法(`strong-ulam-stability.tex:924` 至 `strong-ulam-stability.tex:938`)避免逐列求和:对单层,设 $L$、$R$ 是活跃左右残空间直和到 $H$ 的等距嵌入,该层写成式 layer-embedding(`strong-ulam-stability.tex:929` 至 `strong-ulam-stability.tex:931`)$I-LL^{*}-RR^{*}+LC_0R^{*}+RTL^{*}$,其中 $T$、$C_0$ 分别是左右向迁移与固定右左向迁移的直和。换框架只动 $R$;而 $R$ 的定义域在每列上用度量 $B_y$,与被压缩坐标 $X_k$ 无关,所以式 two-frame-distance 张量残坐标、再对 $(v,y)$ 正交求和后仍有 $\lVert R-R'\rVert\le C\eta$(`strong-ulam-stability.tex:932` 至 `strong-ulam-stability.tex:935`)。代回式 layer-embedding,四项中只两项含 $R$,层的变化被 $4\lVert R-R'\rVert$ 控制;迁移块在各自度量下范数为 1,即便依赖列 $x$ 也无妨(`strong-ulam-stability.tex:936` 至 `strong-ulam-stability.tex:938`)。对 $N$ 层做酉乘积的 telescoping,得式 frame-circuit-cost(`strong-ulam-stability.tex:940` 至 `strong-ulam-stability.tex:943`):$\lVert W_p^{\mathcal C_2}-\overline W_p\rVert\le CN\eta$,对 $q$ 同理。层数换线性代价,这是全篇三处 $CN\eta$ 型项的第一处。

### 7.3 第二部:共有交换的精确消去

`strong-ulam-stability.tex:945` 至 `strong-ulam-stability.tex:949` 分类:在三构型可切换、二构型不可切换的边里,凡在 $p$、$q$ 中双旗为 $\mathsf E$ 的边不被两电路任何一者使用;其余在这两者中双旗为 $\mathsf F$、被两边以完全相同的酉算子交换,称共有交换。关键引路(`strong-ulam-stability.tex:951` 至 `strong-ulam-stability.tex:958`):后置共有交换与前置非共有交换一般不交,但若有相邻两层中前一层的非共有边在某电路被用且其在 $p$ 或 $q$ 之一为 $\mathsf E$,则 (F1) 断言在其到达位置下一阶段该构型没有出发的 $\mathsf F$ 边,于是该位置的后期共有交换不可能存在;两层在共有层面上的支撑落在互异群位置。框架调整不改位置,正交性保持。层内交换本就互可交换(支撑正交,`strong-ulam-stability.tex:960` 至 `strong-ulam-stability.tex:961`)。于是可把所有共有交换整体前移到各电路开头、保持相对次序;层有限,层内无穷族是正交直和,重排不涉及无穷乘积收敛问题(`strong-ulam-stability.tex:961` 至 `strong-ulam-stability.tex:964`)。式 common-cancel(`strong-ulam-stability.tex:965` 至 `strong-ulam-stability.tex:969`)落地:$W_p^{\mathcal C_3}=\widehat W_p C_{\mathrm{com}}$、$W_q^{\mathcal C_3}=\widehat W_q C_{\mathrm{com}}$、$V_{qp}^{\mathcal C_3}=\widehat W_q\widehat W_p^{-1}$,共有酉因子 $C_{\mathrm{com}}$ 在比较中自销。此处 $\widehat W_p$ 用对 $\mathcal C_3$ 可切换、被 $p$ 使用的边配上三构型的框架与优先(`strong-ulam-stability.tex:970` 至 `strong-ulam-stability.tex:974`);与 $\overline W_p$ 相比边、子空间、固定反迁移全部一致,只差优先等距。消去一步没有数值代价,这正是 (F1) 刚性在算子层的兑现。

### 7.4 第三部:把优先差搬过后层

比较 $\widehat W_p$ 与 $\overline W_p$($q$ 同理,`strong-ulam-stability.tex:977`)。每条活跃边的小优先投影含于大的;由式 swap 的块形(`strong-ulam-stability.tex:980` 至 `strong-ulam-stability.tex:984`)有 $\begin{pmatrix}0&C_{x,y}\\ (S_e^{\mathcal C_3})^{-1}&0\end{pmatrix}\begin{pmatrix}0&S_e^{\mathcal C_2}\\ C_{x,y}^{-1}&0\end{pmatrix}=\begin{pmatrix}I&0\\ 0&(S_e^{\mathcal C_3})^{-1}S_e^{\mathcal C_2}\end{pmatrix}$,即两换法之比只落在右侧到达子空间上。式 post-unitary(`strong-ulam-stability.tex:986` 至 `strong-ulam-stability.tex:989`):$\widehat M_{p,k}=K_k\overline M_{p,k}$,$K_k$ 在 $H_k^{\perp}$ 上为恒等、$\lVert K_k-I\rVert\le Ch$,范数取在 $H$ 的给定度量里,估计来自 Lemma priority 加一致度量界(`strong-ulam-stability.tex:990` 至 `strong-ulam-stability.tex:991`)。

下一步是全文最精微处。对 $k<N$,设 $Q_{k+1}$ 为 $\overline M_{p,k+1}$ 在 $H_k$ 中使用的出发子空间投影,式 next-protected(`strong-ulam-stability.tex:995` 至 `strong-ulam-stability.tex:997`)断言 $\lVert(K_k-I)Q_{k+1}\rVert\le Ch\eta$。理由(`strong-ulam-stability.tex:998` 至 `strong-ulam-stability.tex:1006`):同一位置上,$Q_{k+1}$ 筛下一坐标 $X_{k+1},Y_k$,当前到达子空间筛 $Y_{k-1}$ 与压缩 $X_k$ 因子中一条线,两个筛互相可换、且 $G_k$ 保持相应坐标扇区;在交集上,式 priority-set 的定义保证小优先包含每个下一出发,Lemma priority 的嵌套式 nested-transfer 把 $(S_e^{\mathcal C_3})^{-1}S_e^{\mathcal C_2}-I$ 在其上压到 $Ch\eta$;在所有当前到达子空间之并的补上 $K_k=I$;正交直和给出结论,不数边数也不数标签数。末层置 $Q_{N+1}=0$(`strong-ulam-stability.tex:1007`)。

随后 Lemma truncate 上场(`strong-ulam-stability.tex:1009` 至 `strong-ulam-stability.tex:1016`,式 corrected-unitary):$h_0$ 充分小后,存在酉 $\widetilde K_k$(在 $H_k$ 外按恒等延展)使 $\widetilde K_kQ_{k+1}=Q_{k+1}$、$\lVert K_k-\widetilde K_k\rVert\le Ch\eta$、$\lVert\widetilde K_k-I\rVert\le Ch$。$\widetilde K_k$ 与 $\overline M_{p,k+1}$ 交换:后者只动出发子空间 $Q_{k+1}H_k$ 与 $H_{k+1}$ 中的到达子空间,而 $\widetilde K_k$ 在这两处都是恒等(`strong-ulam-stability.tex:1017` 至 `strong-ulam-stability.tex:1019`);更靠后的层作用于其他层,同样交换(`strong-ulam-stability.tex:1019` 至 `strong-ulam-stability.tex:1020`)。图 priority(`strong-ulam-stability.tex:1023` 至 `strong-ulam-stability.tex:1048`)把这一页画成三层水平线:竖段是跨层换法,$\widetilde K_k$ 方框钉在层 $H_k$ 内、固定 $Q_{k+1}H_k$,箭头"commutes past"越过下一层。把式 post-unitary 代入 $\widehat W_p$ 的乘积、以 $\widetilde K_k$ 替换 $K_k$,telescoping 花费至多 $CNh\eta$;再把所有 $\widetilde K_k$ 移到乘积最左(它们作用在互异层、彼此交换),式 moved-errors(`strong-ulam-stability.tex:1055` 至 `strong-ulam-stability.tex:1062`)给 $\lVert\widehat W_p-(\widetilde K_N\cdots\widetilde K_1)\overline W_p\rVert\le CNh\eta$ 与 $\lVert\widetilde K_N\cdots\widetilde K_1-I\rVert=\max_k\lVert\widetilde K_k-I\rVert\le Ch$。最大值合并，并非求和,正是导言 `strong-ulam-stability.tex:141` 至 `strong-ulam-stability.tex:142` 预告的机制。结合式 frame-circuit-cost 得 $\lVert\widehat W_p-W_p^{\mathcal C_2}\rVert\le Ch+CN\eta+CNh\eta$(`strong-ulam-stability.tex:1063` 至 `strong-ulam-stability.tex:1066`),对 $q$ 亦然;代回式 common-cancel、对 $V_{qp}$ 两因子分别 telescoping,Prop comparison 证毕(`strong-ulam-stability.tex:1067` 至 `strong-ulam-stability.tex:1069`)。

## §8 近似表示与缺陷估计

式 mu(`strong-ulam-stability.tex:1072` 至 `strong-ulam-stability.tex:1075`)定案:$\mu(g)=V_{b,gb}^{\{b,gb\}}U(g)$,以固定原构型 $b$ 为锚。归一化免费到账:$g=e$ 时集合 $\{b,b\}$ 实为一个构型、没有可切换边,故 $\mu(e)=I$(`strong-ulam-stability.tex:976` 至 `strong-ulam-stability.tex:977` 的说明在原文 `strong-ulam-stability.tex:1076` 至 `strong-ulam-stability.tex:1077`)。乘法展开:`$\mu(g)\mu(t)=V_{b,gb}^{\{b,gb\}}V_{gb,gtb}^{\{gb,gtb\}}U(gt)$`(`strong-ulam-stability.tex:1078` 至 `strong-ulam-stability.tex:1081`,乘法律 $U(g)U(t)=U(gt)$ 加上式 equivariance 把第二比较搬到正确位置)。把两因子与 $\mu(gt)$ 中的 $V_{b,gtb}^{\{b,gtb\}}$ 全部改在三构型集 $\{b,gb,gtb\}$ 内计算(`strong-ulam-stability.tex:1082` 至 `strong-ulam-stability.tex:1087`),同一集合内有精确相合 $V_{b,gb}^{\{b,gb,gtb\}}V_{gb,gtb}^{\{b,gb,gtb\}}=V_{b,gtb}^{\{b,gb,gtb\}}$。于是 $\mu(gh)^{-1}\mu(g)\mu(h)$ 的范数被三次 Prop comparison 三角化:两处把二集换三集、一处把一处 $V$ 换成另一 $V$,式 defect-bound(`strong-ulam-stability.tex:1089` 至 `strong-ulam-stability.tex:1091`)落锤:$\mathrm{def}(\mu)\le Ch+CN\eta+CNh\eta$。

这笔账的结构值得复盘:$Ch$ 项与层数无关(搬运算子按最大值合并),$CN\eta$ 与 $CNh\eta$ 都线性于 $N=L+1$;而 $h=\frac1{2\sqrt L}$ 随 $L$ 衰减。三项对 $L$ 的响应相反,$\eta$、$\beta$ 的调节自由度在后面 §9.3 的参数链里统一收割。`strong-ulam-stability.tex:1092` 至 `strong-ulam-stability.tex:1093` 把剩余任务说清:证明离表示的距离不随缺陷界一起塌缩。

## §9 二次型障碍与主定理收束

### 9.1 路径记号与运输引理

`strong-ulam-stability.tex:1104` 至 `strong-ulam-stability.tex:1107`:对 $i\in\mathcal I$ 缩写 $s_k(i)=s_k(x_k(i),y_{k-1}(i))$,置 $t_0(i)=e$、$t_k(i)=s_1(i)\cdots s_k(i)$、$s_i=t_N(i)$。$u_i$ 是位置 $e$、层 $N$ 的 $v_i^{(N)}$,$r_i$ 是位置 $e$、层 $0$ 的 $v_i^{(0)}$,皆单位向量(`strong-ulam-stability.tex:1108` 至 `strong-ulam-stability.tex:1110`)。Lemma transport(`strong-ulam-stability.tex:1111` 至 `strong-ulam-stability.tex:1116`):除比例 $2N\beta$ 之外的标签 $i$ 满足 $\lVert\mu(s_i)u_i-r_i\rVert\le CN\eta+CNh\eta$(式 transport-bound)。

证明(`strong-ulam-stability.tex:1118` 至 `strong-ulam-stability.tex:1169`)第一步是概率设定:给 $\mathcal I$ 均匀乘积测度。前向路径 $t_0,\dots,t_N$ 上,出发 $t_{k-1}$ 只依赖坐标对 $(X_j,Y_{j-1})$($j<k$);条件在这些对与 $X_k$ 之下,$Y_{k-1}$ 仍均匀,行界 (F2) 使第 $k$ 步为 $\mathsf F$ 的概率至多 $\beta$;union bound 给全步皆 $\mathsf E$ 的概率至少 $1-N\beta$(`strong-ulam-stability.tex:1119` 至 `strong-ulam-stability.tex:1124`)。同一串步、终点为 $e$ 的路径按式 backward-position(`strong-ulam-stability.tex:1128` 至 `strong-ulam-stability.tex:1131`)有到达 $a_k(i)=s_N(i)^{-1}\cdots s_{k+1}(i)^{-1}=s_i^{-1}t_k(i)$,满足 $a_{k-1}s_k=a_k$ 且只依赖更晚坐标对;条件其上与 $Y_{k-1}$ 用 (F3),全步皆 $\mathsf F$ 的概率至少 $1-N\beta$(`strong-ulam-stability.tex:1132` 至 `strong-ulam-stability.tex:1135`)。两事件交集中,坏比例至多 $2N\beta$(式 good-fraction,`strong-ulam-stability.tex:1137` 至 `strong-ulam-stability.tex:1140`),两事件间不需要独立性。对好标签置 $p=s_ib$:式 backward-position 与平移定义给出该路径对 $b$ 全 $\mathsf E$、对 $p$ 全 $\mathsf F$,于是每条边都对 $\{b,p\}$ 可切换(`strong-ulam-stability.tex:1141` 至 `strong-ulam-stability.tex:1145`)。

第二步是逐层记账:$z_k$ 取位置 $t_k(i)$ 的精确标签向量 $v_i^{(k)}$,故 $z_N=U(s_i)u_i$、$z_0=r_i$(`strong-ulam-stability.tex:1147` 至 `strong-ulam-stability.tex:1148`)。第 $k$ 层把因子 $a_{k,x_k(i)}$ 换成调整到达向量,改动至多 $C\eta$(式 frame-adjustment 加式 metric-bound,`strong-ulam-stability.tex:1149` 至 `strong-ulam-stability.tex:1151`);换得的向量落在该边活跃右子空间里,逆层用 $S_e^{\{b,p\}}$ 从右回左(`strong-ulam-stability.tex:1152`);$k<N$ 时其残坐标属于优先子空间,因下一步 $(t_k,x_{k+1},y_k)$ 在 $p$ 中为 $\mathsf F$(`strong-ulam-stability.tex:1153` 至 `strong-ulam-stability.tex:1154`),式 edge-transfer 把这段改动压到 $Ch\eta$(`strong-ulam-stability.tex:1155` 至 `strong-ulam-stability.tex:1156`);$k=N$ 时迁移是恒等(`strong-ulam-stability.tex:1156`)。逐层不等式 $\lVert(M_{p,k}^{\{b,p\}})^{-1}z_k-z_{k-1}\rVert\le C\eta+Ch\eta$(`strong-ulam-stability.tex:1157` 至 `strong-ulam-stability.tex:1160`)telescoping 成 $\lVert(W_p^{\{b,p\}})^{-1}U(s_i)u_i-r_i\rVert\le CN\eta+CNh\eta$(`strong-ulam-stability.tex:1161` 至 `strong-ulam-stability.tex:1165`);所有真实层皆酉,先前误差不再被放大(`strong-ulam-stability.tex:1166`)。收尾观察 $W_b^{\{b,p\}}r_i=r_i$:首层不用第一条 $\mathsf E$ 边的出发扇区,后层不碰层零(`strong-ulam-stability.tex:1167` 至 `strong-ulam-stability.tex:1169`)。于是 $(W_p^{\{b,p\}})^{-1}$ 与 $W_b^{\{b,p\}}$ 合成即 $\mu(s_i)^{-1}$ 一侧的式 mu,运输界到手。$Ch$ 为何不在这里出现:沿单条路径的误差只有框架项与优先项,搬层代价属于电路之间,不在此账本。

### 9.2 见证二次型

Lemma witness(`strong-ulam-stability.tex:1177` 至 `strong-ulam-stability.tex:1191`)对任何酉表示 $\rho:G\to\mathcal U(H)$ 取 $\mathbb C^{\mathcal I}\otimes H$ 中单位向量 $\psi=|\mathcal I|^{-1/2}\sum_{i}e_i\otimes\rho(s_i)u_i$、$r=|\mathcal I|^{-1/2}\sum_i e_i\otimes r_i$,结论式 witness-values:`strong-ulam-stability.tex:1186` 至 `strong-ulam-stability.tex:1189` 给 $\langle\psi,(D\otimes I)\psi\rangle=0$ 而 $\langle r,(D\otimes I)r\rangle=\frac12$,推论 $\lVert r-\psi\rVert\ge\frac14$。

左值的证明(`strong-ulam-stability.tex:1193` 至 `strong-ulam-stability.tex:1223`)逐 $\gamma_d$ 做:任意标签对 $i,j$,酉性与乘法给 $\langle\rho(s_i)u_i,\rho(s_j)u_j\rangle=\langle u_i,\rho(s_i^{-1}s_j)u_j\rangle$(`strong-ulam-stability.tex:1194` 至 `strong-ulam-stability.tex:1198`)。$(\gamma_d)_{ij}$ 非零要求两标签除 $Y_d$ 外全同,于是群乘积共享到阶段 $d$ 的前缀:$s_i=PQ_i$、$s_j=PQ_j$、$s_i^{-1}s_j=Q_i^{-1}Q_j$(`strong-ulam-stability.tex:1199` 至 `strong-ulam-stability.tex:1205`);固定 $X_d$ 外诸坐标后,后缀 $Q_i,Q_j$ 与 $X_d$ 无关($d$ 之后的步只用 $X_{d+1},\dots,X_N$,`strong-ulam-stability.tex:1206` 至 `strong-ulam-stability.tex:1208`),故存在与 $X_d$ 无关的线性等距嵌入 $E_i,E_j:\mathbb C^{m_d}\to H$ 使 $u_i=E_ia_{d,x_d}$、$u_j=E_ja_{d,x_d}$,且层 $N$ 度量是欧氏(`strong-ulam-stability.tex:1208` 至 `strong-ulam-stability.tex:1211`)。$\gamma_d$ 中依赖 $X_d$ 的因子恰为 $f_d(x_d)$(`strong-ulam-stability.tex:1211` 至 `strong-ulam-stability.tex:1212`),对 $x$ 求和化成迹 $\tr(E_i^{*}\rho(Q_i^{-1}Q_j)E_j\sum_x f_d(x)a_{d,x}a_{d,x}^{*})=0$,由式 signed-frame(`strong-ulam-stability.tex:1214` 至 `strong-ulam-stability.tex:1220`)。逐坐标求和得 $\langle\psi,(\gamma_d\otimes I)\psi\rangle=0$,再对 $d$ 求和。这段论证里没有对 $\rho$ 尊重张量结构的任何假设,符号抵消纯靠求和指标,这正是它能在一切表示上成立的免疫力。

右值的证明(`strong-ulam-stability.tex:1225` 至 `strong-ulam-stability.tex:1232`):$r_i$ 的 Gram 矩阵恰是 $G_0$(层零的标准标签向量、度量 $G_0$),两者皆实对称,故 $\langle r,(D\otimes I)r\rangle=\tr(DG_0)/|\mathcal I|$;代入式 metric-bound 的 $G_0=I+\frac12D$ 与式 D-identities 的 $\tr D=0$、$D^2=I$,得 $\tr(D+\frac12D^2)/|\mathcal I|=\frac12$。最后 $\lVert D\rVert=1$(由 $D^2=I$ 与自伴)、两向量皆单位,故 $\frac12\le|\langle r-\psi,(D\otimes I)r\rangle|+|\langle\psi,(D\otimes I)(r-\psi)\rangle|\le 2\lVert r-\psi\rVert$(`strong-ulam-stability.tex:1233` 至 `strong-ulam-stability.tex:1239`,原文写法是 $\frac12\le\lVert r-\psi\rVert\lVert r\rVert+\lVert\psi\rVert\lVert r-\psi\rVert=2\lVert r-\psi\rVert$)。

### 9.3 参数链与收束

若 $\rho$ 一致 $\varepsilon$-贴近 $\mu$,则好标签上 $\rho(s_i)u_i$ 与 $\mu(s_i)u_i$ 差 $\varepsilon$、坏标签上差至多 2(单位向量,三角不等式粗估),在正交标签和里用 Cauchy-Schwarz 型折算(坏比例开根)得式 final-distance(`strong-ulam-stability.tex:1243` 至 `strong-ulam-stability.tex:1251`):$\lVert r-\psi\rVert\le\varepsilon+CN\eta+CNh\eta+2\sqrt{2N\beta}$,其中 $2\sqrt{2N\beta}$ 来自 $\sqrt{2N\beta}\cdot 2$。常数全为数值常数。

主定理证明(`strong-ulam-stability.tex:1255` 至 `strong-ulam-stability.tex:1282`)的取参顺序是一条单向链:先取 $L$ 大,使 $h=\frac1{2\sqrt L}$(`strong-ulam-stability.tex:1258` 至 `strong-ulam-stability.tex:1259`)满足一切数值小性、且式 defect-bound 中 $Ch<\frac{\delta}{2}$;固定 $N=L+1$ 后取 $0<\eta<\frac14$ 使 $CN\eta+CNh\eta<\min\{\frac{\delta}{2},\frac1{20}\}$(`strong-ulam-stability.tex:1260` 至 `strong-ulam-stability.tex:1264`);再取 $\beta<\min\{\beta_0(\eta),\frac1{3200N}\}$(`strong-ulam-stability.tex:1266` 至 `strong-ulam-stability.tex:1268`),其中 $\beta_0(\eta)$ 由 Lemma sparse 供应;然后造旗帜、把字母表扩到该引理所需维数,一切既有估计不因此变坏(`strong-ulam-stability.tex:1270` 至 `strong-ulam-stability.tex:1272`)。所得 $\mu$ 缺陷小于 $\delta$;若有表示一致 $\frac1{10}$-贴近,式 final-distance 给出 $\lVert r-\psi\rVert<\frac1{10}+\frac1{20}+\frac1{20}=\frac15$(`strong-ulam-stability.tex:1277` 至 `strong-ulam-stability.tex:1279`),与 Lemma witness 的 $\lVert r-\psi\rVert\ge\frac14$ 矛盾(`strong-ulam-stability.tex:1280` 至 `strong-ulam-stability.tex:1281`)。依赖方向单一:$L\to\eta\to\beta\to$ 字母表维数,回头改任何一环都会使后环失效,这是 §10 讨论参数必要性的底图。

## §10 条件必要性与反例剖析

### 10.1 无穷维:资源与门槛的双重身份

定义侧,量词"对所有 $H$ 含无穷维"(`strong-ulam-stability.tex:60` 至 `strong-ulam-stability.tex:61`)把强稳定与有限维 Ulam 稳定切开(`strong-ulam-stability.tex:99` 至 `strong-ulam-stability.tex:101`);构造侧,无穷维同时是必要条件。把反例参数化的最清楚方式,是把构造里唯一随维数膨胀的链条写成一个不等式:Lemma sparse 需要 $m$ 充分大(`strong-ulam-stability.tex:406` 至 `strong-ulam-stability.tex:407`、`strong-ulam-stability.tex:473` 至 `strong-ulam-stability.tex:474`),而 $E_k$ 的张量积里每压缩一个 $\mathcal X_j$ 因子就把 $\mathbb C^{2m_j}$ 的冗余框架换成 $\mathbb C^{m_j}$(`strong-ulam-stability.tex:727` 至 `strong-ulam-stability.tex:732`),总空间 $\dim H\ge\prod_j m_j\cdot|G|^{0}\cdot(2m)^{N}$ 级别的维数需求在 $\beta_0(\eta)$ 门槛前不可封顶:尾概率 $2\exp(2mH(q)+2qm\log 9-\frac{m\eta^2}{16})$(`strong-ulam-stability.tex:466` 至 `strong-ulam-stability.tex:470`)对小 $m$ 根本不降。于是若有人宣称"对固定有限维酉群族可证同样的不可均不稳定性",他的框架调整 $\widetilde F_S$(`strong-ulam-stability.tex:495` 至 `strong-ulam-stability.tex:498`)必须在维数封顶下同时控制所有小子集,这与式 sparse-gram 的概率存在性正面对撞;而 GLMR 的高秩格有限维稳定(`strong-ulam-stability.tex:102` 至 `strong-ulam-stability.tex:104`)说明撞上的不是技术、是事实。两个方向合读:无穷维在本文同时是反例的原料(空间自己造)与反例的边界(有限维上不成立)。

### 10.2 (F1) 刚性:消去机制的支点

(F1)(`strong-ulam-stability.tex:296` 至 `strong-ulam-stability.tex:302`)是唯一一条非计数的旗帜性质,它说 $\mathsf E$ 沿路径吸收。它的算子学用途精确落在两处。其一,§7.3 的共有交换前移:前一层的非共有 $\mathsf E$ 边在其到达位置封死了下一层同构型的 $\mathsf F$ 边(`strong-ulam-stability.tex:951` 至 `strong-ulam-stability.tex:958`),使相邻层支撑在共有层面上正交;若把旗帜改成独立随机的两色染色(概率 $\beta$ 的 $\mathsf F$、无相关性),则同一到达位置可以在下一阶段出现共有交换,层序重排失效,$C_{\mathrm{com}}$ 因子无法提出式 common-cancel。其二,式 moved-errors 的最大值合并(`strong-ulam-stability.tex:1060` 至 `strong-ulam-stability.tex:1061`)依赖修正酉 $\widetilde K_k$ 彼此跨层可换,而"$\widetilde K_k$ 与下一层可换"的前提式 next-protected(`strong-ulam-stability.tex:995` 至 `strong-ulam-stability.tex:997`)用到"下一出发落在优先子空间内"(`strong-ulam-stability.tex:1153` 至 `strong-ulam-stability.tex:1154` 在运输引理里同样消费它),这条包含关系的证明逐字是 (F1) 加式 priority-set 定义(`strong-ulam-stability.tex:1002` 至 `strong-ulam-stability.tex:1004`)。一个可量化的失效模型:若 (F1) 只是概率性地以 $1-\beta$ 成立,路径上"首 $\mathsf E$ 之后全 $\mathsf E$"的断言退化为概率陈述,$\mu(s_i)$ 对 $u_i$ 的运输(`strong-ulam-stability.tex:1113` 至 `strong-ulam-stability.tex:1115`)将附带一个与坏事件耦合的额外误差项,见证差距 $\frac12$(`strong-ulam-stability.tex:1187` 至 `strong-ulam-stability.tex:1188`)被吃掉的风险没有数值上界。

### 10.3 优先子空间:对抗 $CNh$ 累加的设计

导言 `strong-ulam-stability.tex:135` 至 `strong-ulam-stability.tex:142` 直说了主分析问题:两处被交换子空间的坐标有轻微不同的内积,若对层逐层求和误差则得不到有用界;解法是让等距在下一层所用子空间上贴近坐标恒等,从而把第三构型带来的改动"搬过"那一层。做一道算术就知道这不是美化:朴素选择(全空间统一迁移,例如一律用式 fixed-transfer 的 $C_{A,B}=A^{-1/2}B^{1/2}$,$C_{A,B}-I$ 在整块上是 $O(h)$,见 `strong-ulam-stability.tex:528` 的界型)沿 $N$ 层 telescoping 得 $CNh\approx\frac{N}{2\sqrt L}\approx\frac{\sqrt L}{2}$ 的发散量,而参数链要求式 comparison 与式 final-distance 的对应项 $<\frac1{20}$(`strong-ulam-stability.tex:1261` 至 `strong-ulam-stability.tex:1263`):取 $L>10^4$ 即崩。Lemma priority 的多付出一条假设 $\lVert P\Gamma P\rVert\le\eta$(`strong-ulam-stability.tex:524`)换来 $\lVert(S_R-\mathrm{id})P\rVert\le Ch\eta$(`strong-ulam-stability.tex:529`),沿路径的累加从 $O(h)$/层降到 $O(h\eta)$/层、再被截断引理折成跨层最大值,总账 $CNh\eta$ 对 $h=\frac1{2\sqrt L}$、$\eta$ 固定时趋于 0(`strong-ulam-stability.tex:1055` 至 `strong-ulam-stability.tex:1058`)。$\eta$ 在优先集上的来源是式 compressed-gamma(`strong-ulam-stability.tex:831` 至 `strong-ulam-stability.tex:833`)加 Lemma sparse 的 $J$ 压缩(`strong-ulam-stability.tex:427` 至 `strong-ulam-stability.tex:430`):整条防线一环扣一环,抽掉"下一层出发在优先内"任一环,估计退化为不可用的 $CNh$。

### 10.4 数值门槛各自的岗位

把散落的常数假设排成一张岗位表来检验必要性:$0\le h\le\frac18$(`strong-ulam-stability.tex:521`)让 Schur 补不等式 $\lVert E_0-\mathrm{id}\rVert\le 2h+\frac{4h^2}{1-2h}$(`strong-ulam-stability.tex:581` 至 `strong-ulam-stability.tex:583`)的分母远离零、并给截断引理留出 $t<\frac12$ 的空间(`strong-ulam-stability.tex:628`);$h=\frac1{2\sqrt L}$(`strong-ulam-stability.tex:681`)把式 level-metric 的扰动谱固定为 $\pm\frac12$ 型从而式 metric-bound 给 $\frac12I\le G_k\le\frac32I$(`strong-ulam-stability.tex:739` 至 `strong-ulam-stability.tex:742`),同时让 $G_0=I+\frac12D$ 里的系数 $\frac12$ 恰好等于见证值(`strong-ulam-stability.tex:1231`);$\frac14$ 是 $\eta$ 的定义域上限(`strong-ulam-stability.tex:405`、`strong-ulam-stability.tex:897`),对应标量界 $|t^{-1/2}-1|\le C|t-1|$ 需要谱落在 $[\frac34,\frac54]$(`strong-ulam-stability.tex:499` 至 `strong-ulam-stability.tex:500`);$\beta_0<\frac1{16}$(`strong-ulam-stability.tex:405`)给 (F3) 的三构型放大 $|\mathcal C|\beta\le3\beta$ 与式 sparse-gram 的 $4\beta$ 尺寸留余量(`strong-ulam-stability.tex:781` 至 `strong-ulam-stability.tex:783` 对 `strong-ulam-stability.tex:414` 至 `strong-ulam-stability.tex:418`);$\beta<\frac1{3200N}$(`strong-ulam-stability.tex:1267`)单独供养 $2\sqrt{2N\beta}\le\frac1{20}$ 这一项(`strong-ulam-stability.tex:1250`),改 $\frac1{10}$ 的墙高会平移这个常数但不改结构。每个门槛都有人消费,每个消费者断链都断在最后一步矛盾上,这构成"条件不能整体放松"的内部证据。

### 10.5 同一空间与归一化:定义措辞的暗礁

"在同一个 $H$ 上贴近"(`strong-ulam-stability.tex:59` 至 `strong-ulam-stability.tex:60`)排除了把 $\mu$ 放大进扩张空间后用新表示逼近的余地:见证向量 $\psi$、$r$ 都住在 $\mathbb C^{\mathcal I}\otimes H$(`strong-ulam-stability.tex:1179` 至 `strong-ulam-stability.tex:1184`),差距 $\ge\frac14$ 是对该空间上任何表示 $\rho$ 的统一下界;若允许换空间,$\rho$ 的定义域一变,$D\otimes I$ 的施力对象就不存在了。归一化 $\mu(e)=I$ 看似无害,实则支撑式 mu 起步:若放开,$g=e$ 处的相位漂移不被 $\mathrm{def}$ 察觉(乘法自洽),而 $\delta$-逼近陈述需要先把这点自由定死。构造里 $\mu(e)=V_{b,b}^{\{b\}}U(e)=I$ 自动成立,因为单构型集合无可切换边(`strong-ulam-stability.tex:1076` 至 `strong-ulam-stability.tex:1077`)。

### 10.6 可数性与不可均之外的角落

定理语句限定可数离散群(`strong-ulam-stability.tex:52`、`strong-ulam-stability.tex:67` 至 `strong-ulam-stability.tex:70`)。可数性在构造里至少消费两处:式 big-space 沿 $w\in G$ 的直和要可分(`strong-ulam-stability.tex:759` 须呼应 `strong-ulam-stability.tex:75` 的可分声明),以及有限清单 $s_1,\dots,s_M$ 从不可数族 $\mathcal A$ 中挑选时全程只需有限选择,不依赖选择公理强度。边界刻画(`strong-ulam-stability.tex:185` 至 `strong-ulam-stability.tex:188`)对一般局部紧群有更强的形式,本文不消费;把定理外推到不可数离散群需要重新处理 $\sup_{g\in G}$ 的一致性与直和维数,属于本笔记范围外的开放整理,此处只标注断点在哪些行需要重写。

## §11 与其他路线的对照

### 11.1 与自由子群路线(BOT)的对照

Burger-Ozawa-Thom 的负稳定性判据是"包含非交换自由子群"(`strong-ulam-stability.tex:89` 至 `strong-ulam-stability.tex:91`);Kazhdan 的曲面群例子(`strong-ulam-stability.tex:87` 至 `strong-ulam-stability.tex:89`)属于同一族。该路线的算子论核心是利用 $F_2$ 在某个表示里的循环子空间结构直接写下不可校正的近似表示。本文的旗帜路线与之相反:不找自由子群,只取边界上的测度型稀疏性((F2)、(F3) 是纯计数陈述),因此天然覆盖不含自由子群的不可均群,例如扩充后的 Alpeev wreath 积例子(`strong-ulam-stability.tex:93` 至 `strong-ulam-stability.tex:96`)与 Tarski 型单群例子都在射程内(后者为笔记外推,原文未单列)。方法论层面,BOT 例子是显式矩阵族,本文是"从任意非平凡强proximal极小作用机械编译电路"的存在性程序;前者的可读性换后者的一般性。

### 11.2 与测度等价关系路线(Alpeev)的对照

Alpeev 对 $A\wr G$($A$ 非平凡可数交换、$G$ 可数不可均)用测度等价关系手法(`strong-ulam-stability.tex:95` 至 `strong-ulam-stability.tex:96`)。两条路线的公共骨架可以抽象为:先在一个概率空间上造"几乎处处好、稀疏处坏"的标号场,再把标号场编译成分块酉算子;差别在标号场的来源,Alpeev 取 wreath 积的灯-行走几何与 ME 分区的遍历性,本文取 Furstenberg 边界的强proximal闭包与开集分色(`strong-ulam-stability.tex:192` 至 `strong-ulam-stability.tex:197` 的无孤立点开集无穷分色是本文侧的"遍历性替身")。本文不依赖 $A$ 交换与否、也不依赖群有特定分裂结构,代价是线性代数组件(§4、§5)必须全部做成维数无关形态,这正是 §10.3 那条防线存在的另一面。

### 11.3 与渐近上同调路线(GLMR/FF&R)的对照

渐近上同调把"对所有有限维"改写成"对维数趋于无穷的序列"的余调消除,得到的是高秩格与 Thompson 群、wreath 积的有限维一致稳定性(`strong-ulam-stability.tex:102` 至 `strong-ulam-stability.tex:110`)。与本文对照有一处镜像趣味:两边都让维数变大,但方向相反,稳定性理论在"维数趋于无穷的序列上取一致"时给正,强稳定性在"存在某个可分无穷维空间上的单点反例"时给负。差别源自量词次序,序列式一致性要求对一整个族均匀,单点反例只需一个精心选择的无限张量积结构。FF&R 论文 Remark 6.1 解释的 wreath 积强版本失败(`strong-ulam-stability.tex:109` 至 `strong-ulam-stability.tex:110`),现在可以被读进本文的一般机制:$A\wr G$ 的基群无穷、商群不可均,定理直接判负,无需逐例分析。

### 11.4 物理语言的对译注

构造的核心代数件是 Jordan-Wigner 奇偶弦(`strong-ulam-stability.tex:709` 至 `strong-ulam-stability.tex:714`,原文自注出处 Jordan-Wigner 1928 与 Bravyi-Kitaev 的费米子量子计算):$\gamma_d=f_d(X_d)Z_1\cdots Z_{d-1}J_d$ 逐字是一个自共轭、平方为 1 的"弦算子"族,不同 $d$ 反交换,合起来张成一个 Clifford 型生成元集合;$D=\frac1{\sqrt L}\sum_d\gamma_d$ 则是归一化的"总弦算子",谱 $\pm1$(`strong-ulam-stability.tex:721` 至 `strong-ulam-stability.tex:724`)。见证不等式 `strong-ulam-stability.tex:1186` 至 `strong-ulam-stability.tex:1188` 的形状就是量子信息里常见的"期望值见证":真表示侧的态对 $D\otimes I$ 期望为 0(符号抵消),构造侧为 $\frac12$(奇偶极化),两态距离被观测量差下界 $\frac14$ 控制。$\tr D=0$ 对应 $J_d$ 对角为零这一"无奇偶漂移"条件(`strong-ulam-stability.tex:725`)。这种对译不改变任何证明,但提示本文的组件库与费米子模式代数高度共享,未来的形式化或简化若发生,大概率从 Clifford 结构侧入手。

### 11.5 定位陈述

把四条路线并排:Kazhdan 给可均方向的正定理;BOT 给自由子群方向的负例;Alpeev 给特定可均扩张族的负例;本文给"不可均当且仅当强不稳定"的完整刻画,把前三者装进一个统一的旗帜-电路-见证三段式。三段式里,旗帜段(§3)承担全部群论输入,电路段(§6、§7)承担全部泛函分析输入,见证段(§9)承担全部计数收束;外部读者想移植方法时,可按此三段分别替换,例如把边界换成别的亲代空间(proximal 空间的变体)或把 Clifford 见证换成别的无迹对称算子族(需保持 $D^2=I$ 与 $\tr D=0$ 两性质),这两处自由度是本方法未来外推的显然把手。

## §12 参数台账

台账五列:符号、数值或增长率、位置、被谁消费、若改动断在哪一步。位置列全部是本轮真实读取的 `strong-ulam-stability.tex` 行号。表中绝对值与范数一律用成对的竖线记号书写以免与本表的格线混淆。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\mathrm{def}(\mu)$ | $\sup_{g,h}\lVert\mu(gh)-\mu(g)\mu(h)\rVert$ | `strong-ulam-stability.tex:55` | 强稳定定义与缺陷上界 | 定义错位则全篇量词失效 |
| $\varepsilon_0$ | 墙高 $\frac1{10}$,与 $\delta$ 无关 | `strong-ulam-stability.tex:79` | 目标式 distance-goal | 改成随 $\delta$ 衰减则不构成反例 |
| $C$ 约定 | 数值常数,可逐处增大 | `strong-ulam-stability.tex:168` | 全部估计式 | 依赖群或层数则一致性声明崩塌 |
| $N$ 显式 | 逐层求和必写因子 $N$ | `strong-ulam-stability.tex:170` | 比较命题与运输引理 | 隐式 $N$ 会掩盖发散账目 |
| $L$ | $h=\frac1{2\sqrt L}$ 的自由参数 | `strong-ulam-stability.tex:681` | 参数链第一环 | $L$ 不大全链数值不闭合 |
| $N$ | $N=L+1$ 层数 | `strong-ulam-stability.tex:679` | $CN\eta$ 与 $CNh\eta$ 放大 | 层与标签阶段脱钩则 (F1) 链断 |
| $\beta_0(\eta)$ | $0<\beta_0<\frac1{16}$ 且 $2H(8\beta_0)+16\beta_0\log 9<\frac{\eta^2}{32}$ | `strong-ulam-stability.tex:405` | 旗帜参数上界与稀疏压缩 | 超界则式 sparse-gram 概率论证落空 |
| $\eta$ | $0<\eta<\frac14$ 定义域 | `strong-ulam-stability.tex:405` | 谱区间 $[\frac34,\frac54]$ 函数演算 | 超界则正交归一化失控 |
| $q$ | $q=8\beta<\frac12$ | `strong-ulam-stability.tex:454` | 熵计数变量 | $q$ 过 $\frac12$ 则熵项压不住尾项 |
| $H(q)$ | $-q\log q-(1-q)\log(1-q)$ | `strong-ulam-stability.tex:463` | 子集计数 $\exp(mH(q))$ | 换成对数底错误则概率和爆表 |
| 网点 | 每球至多 $9^{\lvert S\rvert}$ 点 | `strong-ulam-stability.tex:456` | 双线性型到算子范数折算 | 网精度变粗则 $\eta$ 界失配 |
| 尾概率 | $\mathbb P\{\lvert u^{*}Ov\rvert>t\}\le 2\exp(-\frac{(m-1)t^2}{2})$ | `strong-ulam-stability.tex:451` | 子块一致界 | 尾指数减弱则维数门槛不存在 |
| 联合坏概率 | $2\exp(2mH(q)+2qm\log 9-\frac{m\eta^2}{16})$ | `strong-ulam-stability.tex:468` | 存在性抽取正交矩阵 | 指数字段号错则整条引理失效 |
| 小子集尺寸 | $\lvert S\rvert\le 4\beta\lvert X\rvert$ | `strong-ulam-stability.tex:415` | 式 sparse-gram 适用条件 | 放宽则 Gram 偏离无界 |
| Gram 误差 | $\lVert F_S^{*}F_S-\mathrm{id}\rVert\le\eta$ | `strong-ulam-stability.tex:417` | 对称正交归一化 | 失配则 $\widetilde F_S$ 不可定义 |
| 再归一误差 | $\lVert\widetilde F_S-F_S\rVert\le C\eta$ | `strong-ulam-stability.tex:497` | 到达框架与运输引理 | 放大则式 two-frame-distance 崩 |
| 嵌套框架差 | $\le 2C\eta$ 对 $S\subseteq T$ | `strong-ulam-stability.tex:503` | 式 two-frame-distance | 无此兼容性则换框架代价逐列求和 |
| 度量带 | $\frac12\mathrm{id}\le A,B\le 2\mathrm{id}$ | `strong-ulam-stability.tex:517` | Lemma priority 与共轭翻倍 | 出带则 $B^{-1/2}$ 放大无界 |
| 步长带 | $0\le h\le\frac18$,$\lVert\Gamma\rVert\le 1$ | `strong-ulam-stability.tex:521` | Schur 补可逆性与分母 $1-2h$ | 越界则 $a$、$E_0$ 可能奇异 |
| 优先全界 | $\lVert S_R-\mathrm{id}\rVert\le Ch$ | `strong-ulam-stability.tex:528` | 式 edge-transfer 与 $K_k$ | 退化则式 post-unitary 无界 |
| 优先限制界 | $\lVert(S_R-\mathrm{id})P\rVert\le Ch\eta$ | `strong-ulam-stability.tex:529` | 式 next-protected | 失去 $\eta$ 因子则 $CNh$ 发散回来 |
| 嵌套比 | $K=S_{R'}^{-1}S_R$ 为 $B$-酉,整体 $Ch$、限制 $Ch\eta$ | `strong-ulam-stability.tex:536` | 三构型优先差搬运 | 破坏则 $\widehat W_p$ 与 $\overline W_p$ 差距不可控 |
| 截断门槛 | $t<\frac12$,$e\le\frac12$ | `strong-ulam-stability.tex:628` | Lemma truncate 前提 | $d-\mathrm{id}$ 可逆性丢,$v$ 不存在 |
| 截断代价 | $\lVert\widehat U-U\rVert\le 3e$ | `strong-ulam-stability.tex:634` | 式 corrected-unitary 的 $Ch\eta$ | 系数放大则替换代价吃进裕度 |
| 极分解二阶 | $\lVert v-d\rVert\le 1-\sqrt{1-e^2}\le e^2$ | `strong-ulam-stability.tex:659` | $3e$ 界里的二阶项 | 只剩一阶则 $2e+e^2\le 3e$ 仍可但常数链松动 |
| 层度量带 | $\frac12I\le G_k\le\frac32I$ | `strong-ulam-stability.tex:740` | 一切范数折算与实复一致 | 出带则 $B$-范数与欧氏范数互控失效 |
| 可切换尺寸 | $\lvert S_{k,v,y}^{\mathcal C}\rvert\le\lvert\mathcal C\rvert\beta\lvert\mathcal X_k\rvert$ | `strong-ulam-stability.tex:782` | 到达框架的小子集条件 | 超 $4\beta$ 上限则 Gram 不可逆 |
| 优先集尺寸 | $\lvert R_{k,v,z}^{\mathcal C}\rvert\le 3\beta\lvert\mathcal Y_k\rvert$ | `strong-ulam-stability.tex:825` | 式 compressed-gamma 的 $J$ 压缩 | 超 $4\beta$ 上限则 sparse-J 失配 |
| 压缩项界 | $\lVert P_{k,v}^{\mathcal C}\Gamma_{x,y}P_{k,v}^{\mathcal C}\rVert\le\eta$ | `strong-ulam-stability.tex:832` | Lemma priority 的 $\eta$ 假设 | 失则限制界 $Ch\eta$ 无从谈起 |
| 层间比较 | $\lVert V_{qp}^{\{p,q\}}-V_{qp}^{\{p,q,r\}}\rVert\le Ch+CN\eta+CNh\eta$ | `strong-ulam-stability.tex:900` | 缺陷估计三连用 | 任一项增长率错则 $\mathrm{def}(\mu)<\delta$ 崩 |
| 缺陷 | $\mathrm{def}(\mu)\le Ch+CN\eta+CNh\eta$ | `strong-ulam-stability.tex:1090` | 主定理取 $Ch<\frac{\delta}{2}$ | 超 $\delta$ 则不再是 $\delta$-近似表示 |
| 坏标签比例 | $\le 2N\beta$ | `strong-ulam-stability.tex:1139` | 式 final-distance 的根号项 | $\beta$ 放宽则 $\frac1{20}$ 裕度被吃 |
| 运输误差 | $\lVert\mu(s_i)u_i-r_i\rVert\le CN\eta+CNh\eta$ | `strong-ulam-stability.tex:1114` | 见证比较的近侧代入 | 含 $Ch$ 即说明搬运机制失效 |
| 见证差 | $\langle r,(D\otimes I)r\rangle=\frac12$,$\langle\psi,(D\otimes I)\psi\rangle=0$ | `strong-ulam-stability.tex:1187` | 反证主战场 | 两侧同值则整个障碍不存在 |
| 分离下界 | $\lVert r-\psi\rVert\ge\frac14$ | `strong-ulam-stability.tex:1190` | 与 $\frac15$ 矛盾收束 | 若只 $\frac1{20}$ 则墙高 $\frac1{10}$ 不保 |
| 总距离 | $\lVert r-\psi\rVert\le\varepsilon+CN\eta+CNh\eta+2\sqrt{2N\beta}$ | `strong-ulam-stability.tex:1250` | 参数链终点 | 少一项则矛盾 $\frac15<\frac14$ 不闭合 |
| $\beta$ 上界 | $\beta<\min\{\beta_0(\eta),\frac1{3200N}\}$ | `strong-ulam-stability.tex:1267` | 同时喂稀疏与根号项 | 拆成两个独立小量则依赖链乱序 |
| 收束算术 | $\frac1{10}+\frac1{20}+\frac1{20}=\frac15$ | `strong-ulam-stability.tex:1278` | 与 $\frac14$ 的公开矛盾 | 任一分数变动需重新配平 |

台账数据行合计 38 行,覆盖定义件 4、概率件 7、线性代数件 10、电路件 6、组合件 4、收束件 7 的分组清点。

## §13 自查程序与勘误申报

自查程序(本笔记收稿流程,逐条执行并复量):第一,对全文逐行扫描数学定界符计数,任何奇数行都当场在那一行内修复,禁止用孤立的同形字符做奇偶补偿;第二,清点小节标题行,确认从 §0 到 §13 编号连续且物理排布与编号同序;第三,清点五列台账表头串与带空格分隔行的全文出现次数,各自应为 1,数据行逐行核对竖线枚数恰为 6;第四,禁串清单逐条扫描;第五,等待 90 秒后连续两次测量文件字节数,两次同值才认定落盘稳定,防止回滚假象。

勘误申报(已落盘文本按规则不回改,此处只申报行号与性质):笔记第 82 行,§3.5 中一处 backward-regions 公式被包裹成行内代码并对内含有一对数学定界符,形态冗余但该行定界符成对、逐行奇偶不受影响;笔记第 118 行,§4.4 有一句写作残留一枚孤立反引号,该行数学定界符仍成对,受损的是行内代码配对;笔记第 156 行,§6.1 中 eta 的写法含一处双反斜杠排字错误;笔记第 222 行,§8 有一处对 `strong-ulam-stability.tex:976` 至 `strong-ulam-stability.tex:977` 的位置标注系笔误,该说明句的真实位置是 `strong-ulam-stability.tex:1076` 至 `strong-ulam-stability.tex:1077`,同行另有一处乘法展开公式被反引号包裹并内含成对数学定界符,与第 82 行同型。以上四处均为申报对象,不属于正文论证链条,不影响任何估计的正确性。

阅读路径建议:只想拿结论的读者按 §1 加 §9.3;想核查构造的读者按 §3、§4、§5、§6、§7、§8、§9 的顺序线性推进;想找外推把手的读者直接读 §10 与 §11.5。台账 §12 可当作逐行核对的索引表使用。
