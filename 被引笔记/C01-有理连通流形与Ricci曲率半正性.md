# C01 有理连通流形与Ricci曲率半正性（arXiv:1210.2092）

## 0 取证边界

- arXiv id：1210.2092
- 原题名（逐字）：Rationally connected manifolds and semipositivity of the Ricci curvature
- 作者（原文署名逐字）：Frédéric Campana, Jean-Pierre Demailly, Thomas Peternell
- 发表年月：2012-10-07；源码头部自记版本为 2012 年 10 月 1 日、2013 年 7 月 16 日修订（`main.tex:3`），文末又注 2018 年 2 月 3 日做过小的更正（`main.tex:1302-1303`）
- 素材目录：`E:\math\被引素材\1210.2092`，目录内除 `main.tex`（派单元数据实测 59,244 字节 / 1,327 行；盘面行数计数为 1,326 行，差在末行换行计法）外没有其他 `.tex`；目录内亦无 `.pdf`，未做 PDF 抽取
- 本语料引用它的稿号与 bib key：D289、D305、D318、D385、D447、D451、D471（bib key `CDP2015`）
- 取证读次：对 `main.tex` 全文分 4 次读取（1-400、401-800、801-1200、1201-1327），全篇覆盖
- 取材薄读之处：Plain-TeX 导言区的字体与宏定义（`main.tex:9-113`）只用于确定记号对应关系（如 `\bP` 对 `\mathbb P`、`\cF` 对 `\mathcal F`、`\UU` 对 `\mathrm U`、`\merto` 对带 `>` 的有理映射箭头），不作为内容来源；参考文献列表（`main.tex:1165-1299`）只用于核对文内引用标记；作者单位与邮箱块（`main.tex:1301-1319`）不作为内容来源
- 记法说明：素材用 Plain-TeX 的 `\claim ... \endclaim` 环境排定理与注记，本稿指代时按素材给出的编号（如"判据 1.1""定理 A.14"）并附位置串；素材编号 `\rA.1` 等即附录编号 A.1，本稿统一写作 A.1 形

## 1 问题定位与概念边界

全文的目标在开篇交代得很直白：理解 Ricci 曲率半正的紧 Kähler 流形的几何，特别是 Ricci 半正性与有理连通性之间的牵连，思想大量取自 [DPS96] 与 [BDPP]（`main.tex:146-150`）。摘要（`main.tex:122-132`）把路线拆成三块拼图：其一，带半正反典范丛的紧 Kähler 流形在有限 étale 覆盖意义下全纯且等距地分裂为 Ricci 平部分与有理连通部分的乘积（结构定理 1.4）；其二，用切丛的某些扭逆对称幂不存在截面来刻画有理连通性（判据 1.1）；其三，对伪有效线丛成立的一个推广的整体和乐原理（命题 1.5）。关键前置是单直纹性（uniruled）由"$K_X$ 不是伪有效"刻画这一 BDPP 定理（`main.tex:130-132`）。

概念边界一节把后面所有论断的尺子磨清楚（`main.tex:150-180`）：

- 有理连通：紧复流形 $X$ 上任意两点都可由一条有理曲线链连接（`main.tex:151-152`）。
- Hermite 半正：线丛 $L$ 可装备一个曲率形式半正的光滑 Hermite 度量（`main.tex:152-154`）。三层条件的强弱链：某倍丛 $L^{\otimes m}$ 由整体截面生成可推出 Hermite 半正；Hermite 半正可推出 $L$ 是 [DPS94] 意义下的数值有效（nef）；当 $X$ 射影代数时，nef 等价于对 $X$ 中每个曲线 $C$ 有 $L\cdot C\ge 0$。素材明确警告：这三个条件即使对射影代数 $X$ 也两两不同，反例见 [DPS94]（`main.tex:154-161`）。这条警告决定了定理 1.4 的假设必须写成"$K_X^{-1}$ Hermite 半正"而不能弱化为 nef。
- Ricci 曲率就是反典范丛 $K_X^{-1}=\det T_X$ 的曲率；由 Yau 解 Calabi 猜想（参见 [Aub76]、[Yau78]），紧 Kähler 流形 $X$ 的 $K_X^{-1}$ Hermite 半正当且仅当 $X$  admits 一个 Kähler 度量 $\omega$ 使 $\operatorname{Ricci}(\omega)\ge 0$（`main.tex:162-165`）。这两个表述在后文 freely 互换：定理 1.4 用线丛语言，第 4 节证明开头直接换成度量语言（`main.tex:527-528`）。
- 曲面级的精细例子：$\mathbb P^2_{\mathbb C}$ 在 9 点开 blow-up（无 3 点共线、无 6 点共圆锥）给出 $K_X^{-1}$ nef 的经典例；Brunella [Bru10] 证明存在点构型使 $K_X^{-1}$ 容许光滑（但非实解析）的半正 Ricci 度量；依照 [Ued82] 引入的一个丢番图条件，有的构型使某倍 $K_X^{-m}$ 由截面生成，有的构型 $K_X^{-1}$ nef 却没有任何光滑半正度量（`main.tex:166-174`）。同一族例子里三层条件各占一格，是上面"两两不同"警告的实人实证。

- 伪有效：$L\to X$ 携带奇异 Hermite 度量 $h$ 使 Chern 曲率流 $T=i\Theta_{L,h}=-i\partial\overline\partial\log h$ 非负；$X$ 射影代数时等价于首 Chern 类 $c_1(L)$ 落在有效 $\mathbb Q$-除子锥的闭包中（`main.tex:175-180`）。

MSC 2010 分类为 14M22、14J32、32J27（`main.tex:141`），关键词表把 Bochner 公式、整体和乐原理、Albanese 映射、De Rham 分裂定理并列为方法侧关键词（`main.tex:135-139`），与全文骨架一一对应。本节之后，第 1 节给出全部正式陈述，第 2 节证判据 1.1，第 3 节证推广整体和乐原理，第 4 节组合出结构定理，第 5 节推论，附录（署名 Demailly，`main.tex:664-666`）给出旗丛版整体和乐原理。

## 2 有理连通性判据（判据 1.1）及其证明

判据 1.1（`main.tex:187-206`）：设 $X$ 是射影代数 $n$ 维流形，则以下性质等价。

- (a) $X$ 是有理连通的。
- (b) 对每个可逆子层 $\mathcal F\subset\Omega_X^p:=\mathcal O(\Lambda^p T_X^*)$，$1\le p\le n$，$\mathcal F$ 都不是伪有效的。
- (c) 对每个可逆子层 $\mathcal F\subset\mathcal O((T_X^*)^{\otimes p})$，$p\ge 1$，$\mathcal F$ 都不是伪有效的。
- (d) 对某个（相应地，对任意）ample 线丛 $A$，存在常数 $C_A>0$，使得对所有满足 $m\ge C_A k$ 的 $m,k\in\mathbb N^*$ 有
$$H^0\bigl(X,(T_X^*)^{\otimes m}\otimes A^{\otimes k}\bigr)=0.$$

素材自注这只是 [Pet06] 定理 5.2 的一个小变体（另见其中注记 5.3）（`main.tex:184-185`）。注记 1.2（`main.tex:208-219`）指出证明可从 [BDPP] 的单直纹判据直接引出，光滑射影簇 $X$ 单直纹当且仅当 $K_X$ 不是伪有效，并记下 Mumford 猜想：更弱的假设 (d')：$H^0(X,(T_X^*)^{\otimes m})=0$ 对所有 $m\ge 1$ 成立，就应蕴含有理连通。素材进一步声明：若用 abundance 猜想替换 [BDPP] 的更强前置（即用"$H^0(X,K_X^{\otimes m})=0$ 对所有 $m\ge 1$ 蕴含单直纹"），则本质相同的论证可证 Mumford 猜想。注记 1.3（`main.tex:221-228`）补上适用范围：按 [DPS94]，假设 (b)(c) 在任意紧复流形上有意义且蕴含 $H^0(X,\Omega_X^2)=0$；若再设 $X$ 紧 Kähler，则由 Kodaira [Kod54] 自动射影代数，因此 (b) 或 (c) 也在全体紧 Kähler 流形中刻画有理连通。

第 2 节逐条闭环（`main.tex:364-408`），链条如下：

- (a) 推出 (d)：若 $X$ 有理连通，则存在过任意给定有限子集的浸入 $f:\mathbb P^1\to X$ 使 $f^*T_X$ 是 ample 的（引 [Kol96] 定理 3.9，第 203 页）；即 $f^*T_X=\bigoplus\mathcal O_{\mathbb P^1}(a_j)$，各 $a_j>0$，而 $f^*A=\mathcal O_{\mathbb P^1}(b)$，$b>0$。于是
$$H^0\bigl(\mathbb P^1,f^*((T_X^*)^{\otimes m}\otimes A^{\otimes k})\bigr)=0\quad\text{当 } m>kb/\min(a_i),$$
因为限制到 $\mathbb P^1$ 后每个直和项都是负度线丛，截面为零。$f$ 在 $X$ 中可自由移动，所以任何 $C_A>b/\min(a_j)$ 都可以（`main.tex:367-376`）。这里的关键量化是：$T_X^*$ 的张量幂每多一层就多付一份负度 $-a_j$，而 $A^{\otimes k}$ 只能补 $kb$ 的正度，比值 $kb/\min(a_j)$ 一旦被越过，截面群必然为空。
- (d) 推出 (c)：反设 $\mathcal F\subset(T_X^*)^{\otimes p}$ 伪有效，取 $k_0$ 足够大使得 $A^{k_0}\otimes(K_X\otimes G^{n+1})^{-1}>0$（$G$ 充分 ample 即可，`main.tex:382-384`），则伪有效性给出 $H^0(X,\mathcal F^{\otimes m}\otimes A^{k_0})\ne 0$ 对一切 $m\ge 0$；把 $\mathcal F^{\otimes m}$ 塞回 $(T_X^*)^{\otimes mp}$ 得 $H^0(X,(T_X^*)^{\otimes mp}\otimes A^{k_0})\ne 0$ 对一切 $m$，与 (d) 在 $m\ge C_Ak_0$ 处取零矛盾（`main.tex:378-386`）。
- (c) 推出 (b)：平凡，因为 $\Lambda^p T_X^*$ 是 $(T_X^*)^{\otimes p}$ 的直和项（`main.tex:388`）。
- (b) 推出 (a)：先取 (b) 中 $p=n$，见 $K_X=\Omega_X^n$ 不伪有效，由 [BDPP] 得 $X$ 单直纹（`main.tex:390-392`）。取极大有理连通纤维化（rational quotient/MRC 纤维化，[Cam92]、[KMM92]）$f:X\dashrightarrow W$ 到光滑射影簇；由 [GHS01]，$W$ 不单直纹，否则可把直纹提升到 $X$，纤维就不极大（`main.tex:393-396`）。可设 $f$ 全纯：注意 (b) 在 blow-up 下不变，若 $\pi:\hat X\to X$ 双有理、$\hat{\mathcal F}\subset\Omega_{\hat X}^p$ 是线丛，则 $\mathcal F:=(\pi_*\hat{\mathcal F})^{**}\subset\pi_*\Omega_{\hat X}^p=\Omega_X^p$，且 $\hat{\mathcal F}$ 伪有效蕴含 $\mathcal F$ 伪有效（`main.tex:397-403`）。于是若 $p:=\dim W>0$，由 [BDPP]（对不单直纹的 $W$）$K_W=\Omega_W^p$ 伪有效，拉到 $X$ 上得伪有效可逆子层 $\mathcal F:=f^*(\Omega_W^p)\subset\Omega_X^p$，与 (b) 矛盾；故 $\dim W=0$，$X$ 有理连通（`main.tex:404-408`）。

这一支证明的骨架是"降维反证"：判据 (b) 说 $X$ 上没有任何伪有效的微分形式子层，而 MRC 底 $W$ 若正维数就自带一个（典范丛的拉回），矛盾只能以 $\dim W=0$ 收场。 blow-up 不变性那段是技术前提，它把有理映射的奇点消掉后仍留在假设类内。判据 (b) 一侧的"不存在伪有效子层"与结构定理证明中 (d) 一侧的"截面消没"由此互为进出口，见第 5 节对 $H_i=\mathrm U(n_i)$ 因子的处理。

## 3 结构定理 1.4 的陈述与注记 1.7 的边界

定理 1.4（结构定理，`main.tex:240-267`）把 Bogomolov-Kobayashi-Beauville 对 Ricci 平流形的结构定理（[Bog74a]、[Bog74b]、[Kob81]、[Bea83]）推广到 Ricci 半正情形（`main.tex:230-232`）。陈述前先钉两个定义：全纯辛流形是容许处处满秩全纯辛 2-形式的紧 Kähler 流形，特别地 $K_X=\mathcal O_X$；Calabi-Yau 流形是单连通、$K_X=\mathcal O_X$ 且对 $0<p<n=\dim X$ 有 $H^0(X,\Omega_X^p)=0$ 的射影流形（或其有限 étale 商）（`main.tex:233-238`）。

定理内容：设 $X$ 是 $K_X^{-1}$ Hermite 半正的紧 Kähler 流形，则

- (a) 万有覆叠 $\widetilde X$ 容许全纯且等距的分裂
$$\widetilde X\simeq\mathbb C^q\times\prod Y_j\times\prod S_k\times\prod Z_\ell,$$
其中 $Y_j,S_k,Z_\ell$ 是按素材记号维数分别为 $n_j$、$n_k'$、$n_\ell''$单连通紧 Kähler 流形、各自和乐不可约：$Y_j$ 为 Calabi-Yau（和乐 $\mathrm{SU}(n_j)$），$S_k$ 为全纯辛（和乐 $\mathrm{Sp}(n_k'/2)$），$Z_\ell$ 为 $K_{Z_\ell}^{-1}$ 半正的有理连通流形（和乐 $\mathrm U(n_\ell'')$，除非 $Z_\ell$ 是紧型 Hermite 对称空间）（`main.tex:243-252`）。
- (b) 存在有限 étale Galois 覆盖 $\widehat X\to X$，使 Albanese 簇 $\operatorname{Alb}(\widehat X)$ 是 $q$ 维环面，Albanese 映射 $\alpha:\widehat X\to\operatorname{Alb}(\widehat X)$ 是（等距）局部平凡全纯纤维丛，纤维是 a) 型的乘积 $\prod Y_j\times\prod S_k\times\prod Z_\ell$；甚至再做一次有限 étale 覆盖后，$\widehat X$ 是纤维为 $\prod Z_\ell$、底为 $\prod Y_j\times\prod S_k\times\operatorname{Alb}(\widehat X)$ 的纤维丛（`main.tex:254-260`）。
- (c) $\pi_1(\widehat X)\simeq\mathbb Z^{2q}$，且 $\pi_1(X)$ 由正规子群 $\pi_1(\widehat X)$ 与有限群 $\Gamma$ 扩张而成，特别地有正合列
$$0\to\mathbb Z^{2q}\to\pi_1(X)\to\Gamma\to 0,$$
基本群近乎交换（`main.tex:262-266`）。

证明的工具箱在陈述后立刻点名：整体和乐原理、De Rham 分裂定理 [DR52]、Berger 分类 [Ber55]；基础背景在 Lichnerowicz [Lic67]、[Lic71] 与 Cheeger-Gromoll [CG71]、[CG72]（`main.tex:269-272`）。Hermite 向量丛 $(E,h)$（秩 $r$）的限制整体和乐群定义为：Chern 联络 $\nabla$ 沿基于 $z_0$ 的可缩回路平行输运生成的 $H\subset\mathrm U(r)\simeq U(E_{z_0})$ 子群；共轭意义下 $H$ 不依赖基点（`main.tex:272-277`）。

注记 1.7（`main.tex:326-357`）把边界探到"只设 $K_X^{-1}$ nef"的弱化假设处，值得逐点记下：

- nef 情形 Albanese 满射已有定理：射影情形 Qi Zhang [Zha96,Zha05]，一般 Kähler 情形 Păun [Pau12] 推广（另见 [CPZ03]）（`main.tex:326-330`）。
- 但万有覆叠的等距分裂不能照搬：取椭圆曲线 $C=\mathbb C/(\mathbb Z+\mathbb Z\tau)$ 上非平凡秩 2 丛 $E$（扩张 $0\to\mathcal O_C\to E\to\mathcal O_C\to 0$），令 $X=\mathbb P(E)$，则 $\widetilde X=\mathbb C\times\mathbb P^1$ 不可能是 $X$ 上任何 Kähler 度量的等距乘积；否则 $K_X^{-1}=\mathcal O_{\mathbb P(E)}(1)$ 将 Hermite 半正，而 [DPS94] 已知它 nef ，并非半正（`main.tex:331-344`）。这例子同时是第 1 节"三层条件不同"的再一次显影。
- 只设 nef 时，连 Albanese 映射是否为满浸都是公开问题（射影三折叠情形除外，[PS98]）；即便假设满浸，纤维是否展示复结构的非平凡变形、是否真是 Ricci 平与有理连通因子的乘积，也未知。难点被点名：整体和乐论证先验地失效；可能的出路是对满足 $\operatorname{Ricci}(\omega_\varepsilon)\ge-\varepsilon\omega_\varepsilon$ 的度量列考虑某种"渐近整体和乐"，并处理簇的 Gromov-Hausdorff 极限（`main.tex:345-356`）。

这段注记给出使用本论文定理时的硬约束：分裂结论的代价是 Hermite 半正假设，nef 只能换到 Albanese 满射一级的信息。

## 4 推广整体和乐原理（命题 1.5）与第 3 节的 Bochner 计算

命题 1.5（推广整体和乐原理，`main.tex:281-306`）：设 $E$ 是紧复流形 $X$（$\dim X=n$）上秩 $r$ 全纯向量丛，装备光滑 Hermite 度量 $h$；$X$ 装备 Hermite 度量 $\omega$，看作光滑正 $(1,1)$-形式 $\omega=i\sum\omega_{jk}(z)\,dz_j\wedge d\overline z_k$。假设 Chern 曲率张量 $\Theta_{E,h}$ 的 $\omega$-迹半正，即
$$i\Theta_{E,h}\wedge\frac{\omega^{n-1}}{(n-1)!}=B\,\frac{\omega^n}{n!},\qquad B\in\operatorname{Herm}(E,E),\quad B\ge 0\ \text{在}\ X\ \text{上},$$
记 $H$ 为 $(E,h)$ 的限制整体和乐群。则：

- (a) 若存在可逆层 $\mathcal L\subset\mathcal O((E^*)^{\otimes m})$ 作为线丛是伪有效的，则 $\mathcal L$ 平坦，且 $\mathcal L$ 在 $(E^*)^{\otimes m}$ 上由 $(E,h)$ 的 Chern 联络 $\nabla$ 诱导的联络的平行输运下不变；事实上 $H$ 在 $\mathcal L$ 上作用平凡（`main.tex:296-301`）。
- (b) 若 $H=\mathrm U(r)$，则对 $m\ge 1$，任何可逆层 $\mathcal L\subset\mathcal O((E^*)^{\otimes m})$ 都不可能是伪有效的（`main.tex:302-305`）。

背景是 Bochner 公式的经典形态（[BY53]、[Kob83]）：$(X,\omega)$ Kähler 时每个 $u\in H^0(X,(T_X^*)^{\otimes m})$ 满足
$$\Delta(\lVert u\rVert^2)=\lVert\nabla u\rVert^2+Q(u),\tag{1.6}$$
其中 $Q(u)\ge m\lambda_1\lVert u\rVert^2$，$\lambda_1$ 是 $\omega$ 的 Ricci 曲率张量的最小特征值；若 $\lambda_1\ge 0$，则由 $\int_X\Delta(\lVert u\rVert^2)\omega^n=0$ 得 $\nabla u=0$ 且 $Q(u)=0$（`main.tex:308-319`）。推广点在于：把 $E=T_X^*$ 换成一般向量丛，把 $\lVert u\rVert_\omega^2$ 换成 $\lVert u\rVert_\omega^2e^\varphi$，其中 $u$ 是 $\mathcal L$ 的局部平凡化截面、$\varphi$ 是表示 $\mathcal L$ 度量的局部多重次调和权、$\omega$ 取 Gauduchon 度量（`main.tex:319-324`，并见 (3.2)）。

第 3 节把这段话做成逐行计算（`main.tex:410-523`）。链条：

- 准备：$B=\operatorname{Tr}_\omega\Theta_{E,h}$ 的半正假设在 $\omega$ 的共形改变下不变，故可设 $\omega$ 为 Gauduchon 度量，即 $\partial\overline\partial\omega^{n-1}=0$（[Gau77]）（`main.tex:412-417`）。在每点 $z_0$ 取中心坐标与全纯标架 $(e_\lambda)_{1\le\lambda\le r}$ 使
$$\langle e_\lambda(z),e_\mu(z)\rangle_h=\delta_{\lambda\mu}-\sum_{j,k}c_{jk\lambda\mu}z_j\overline{z_k}+O(\lvert z\rvert^3),\tag{3.1}$$
$$\Theta_{E,h}(z_0)=\sum c_{jk\lambda\mu}\,dz_j\wedge d\overline{z_k}\otimes e_\lambda^*\otimes e_\mu,\qquad c_{kj\mu\lambda}=\overline{c_{jk\lambda\mu}},\tag{3.1'}$$
（`main.tex:419-434`）。
- 伪有效数据化装成权：设 $\mathcal L\subset\mathcal O((E^*)^{\otimes m})$ 伪有效。在坐标球覆盖 $(U_j)$ 上取生成 $\mathcal L$ 的全纯截面 $f_j$，Čech 上循环 $g_{jk}$ 满足 $f_k=g_{jk}f_j$，奇异 Hermite 度量 $e^{-\varphi}$ 由一族 $\varphi_j\in\operatorname{PSH}(U_j)$ 给出，$e^{-\varphi_k}=\lvert g_{jk}\rvert^2e^{-\varphi_j}$。于是
$$\psi=e^{\varphi_j}\lVert f_j\rVert^2=e^{\varphi_j}\lVert f_j\rVert^2_{h^{*\otimes m}}$$
是 $X$ 上整体定义的有界可测函数，几何意义是沿 $\mathcal L$ 的度量比 $(h^*)^{\otimes m}/e^{-\varphi}$，即 $\psi=(h^*)^{\otimes m}_{\mid\mathcal L}e^\varphi$。目标：算 $\Delta_\omega\psi$（`main.tex:436-450`）。
- 局部展开：把 $f=\sum_\alpha f_\alpha\,e^*_{\alpha_1}\otimes\cdots\otimes e^*_{\alpha_m}$ 按对偶标架展开，$(E^*,h^*)$ 的 Hermite 矩阵是 $(E,h)$ 的逆的转置，故 (3.1) 给出 $\langle e_\lambda^*,e_\mu^*\rangle_h=\delta_{\lambda\mu}+\sum c_{jk\mu\lambda}z_j\overline{z_k}+O(\lvert z\rvert^3)$，代回得 $\psi$ 的显式二阶展开（`main.tex:451-475`）。在 $z_0$ 处按分布意义取 $i\partial\overline\partial(\cdot)$（对几乎处处 $z_0$ 成立），得三项结构：
$$i\partial\overline\partial\psi=e^\varphi\Bigl(\lvert f\rvert^2i\partial\overline\partial\varphi+i\langle\partial f+f\partial\varphi,\partial f+f\partial\varphi\rangle+\sum f_\alpha\overline{f_\beta}\,c_{jk\beta_\ell\alpha_\ell}\,i\,dz_j\wedge d\overline z_k\Bigr).$$
（`main.tex:476-487`）。
- 基本不等式：按定义 $\Delta_\omega\psi\,\omega^n/n!=i\partial\overline\partial\psi\wedge\omega^{n-1}/(n-1)!$，乘上 $\omega^{n-1}$ 得
$$\Delta_\omega\psi\ge\lvert f\rvert^2e^\varphi(\Delta_\omega\varphi+m\lambda_1)+\lVert\nabla^{1,0}_hf+f\partial\varphi\rVert^2_{\omega,h^{*\otimes m}}e^\varphi,\tag{3.2}$$
其中 $\lambda_1(z)\ge 0$ 是 $B=\operatorname{Tr}_\omega\Theta_{E,h}$ 在 $z$ 处 Hermite 自同态的最小特征值（`main.tex:488-497`）。这里 $m\lambda_1$ 的来源是：$f$ 落在 $(E^*)^{\otimes m}$ 里，曲率迹在 $m$ 个张量位上各贡献一份 $\lambda_1$。
- 积分收口：Gauduchon 性 $\partial\overline\partial\omega^{n-1}=0$ 使 Stokes 公式给出 $\int_X\Delta\psi\,\omega^n/n!=0$（`main.tex:498-503`）；被积的两项各自非负（$i\partial\overline\partial\varphi\ge 0$），逐点强制 $\Delta_\omega\varphi=0$ 即 $i\partial\overline\partial\varphi=0$，且 $\nabla^{1,0}_hf+f\partial\varphi=0$ 几乎处处成立。于是 $(\mathcal L,e^{-\varphi})$ 平坦；$\varphi_j$ 多重次调和且 pluriharmonic，写 $\varphi_j=w_j+\overline w_j$，条件改写为 $\nabla^{1,0}_h(e^{w_j}f_j)=0$，$e^{w_j}f_j$ 是局部全纯截面，$\mathcal L$ 在平行输运下不变，局部整体和乐平凡作用在 $\mathcal L$ 上。(a) 证毕（`main.tex:504-515`）。
- (b) 的群论收口：若限制整体和乐群 $H=\mathrm U(r)$，$\mathrm U(r)$ 在 $(\mathbb C^r)^{\otimes m}$ 的自然表示没有使 $\mathrm U(r)$ 平凡作用的一维不变子空间，故 $m\ge 1$ 时不存在平行的可逆层。（b）证毕（`main.tex:517-523`）。

一句话总结这一节的机器：伪有效给一个带奇异的半正度量权 $\varphi$；把它与光滑 Chern 度量的比 $\psi$ 塞进 Bochner 型不等式；Gauduchon 化让积分边界项消失；两项非负的强制归零同时把 $\mathcal L$ 压成平且平行不变的，之后能不能存在 $\mathcal L$ 就变成纯粹的表示论问题。

## 5 结构定理的证明（原文第 4 节）：De Rham 分裂到 Bieberbach 商

第 4 节开场把假设切换成度量语言：$X$ 装备 Kähler 度量 $\omega$ 使 $\operatorname{Ricci}(\omega)\ge 0$，$n=\dim_{\mathbb C}X$；对 $E=T_X$ 取 Hermite 度量 $h=\omega$ 的整体和乐表示，此时
$$B=\operatorname{Tr}_\omega\Theta_{E,h}=\operatorname{Tr}_\omega\Theta_{T_X,\omega}\ge 0$$
正是 Ricci 算子（`main.tex:527-534`）。这一步是全文的枢纽：第 3 节的不等式 machinery 从此作用在 $E=T_X$ 上，$B\ge 0$ 由假设免费提供。

- 证明 1.4 (a)（`main.tex:537-559`）：取 $(\widetilde X,\omega)\simeq\prod(X_i,\omega_i)$ 为 De Rham 分解，由整体和乐表示的不可约分解诱导。和乐含于 $\mathrm U(n)$，故每个因子 $(X_i,\omega_i)$ 都是 Kähler、和乐不可约且 $H_i\subset\mathrm U(n_i)$。Cheeger-Gromoll [CG71] 允许一个平坦因子 $X_0=\mathbb C^q$，其余因子紧且单连通；乘积结构使每个 $K_{X_i}^{-1}$ 仍 Hermite 半正。Berger 分类 [Ber55] 把不可约和乐压缩到三种情形加对称空间：$H_i=\mathrm U(n_i)$、$H_i=\mathrm{SU}(n_i)$、$H_i=\mathrm{Sp}(n_i/2)$，或者 $X_i$ 是 Hermite 对称空间，必为紧型，Cartan 分类下它们是有理齐性簇，从而有理连通（其和乐群参见 [Bes87] 第 10 节）。$\mathrm{SU}(n_i)$ 给出 Calabi-Yau，$\mathrm{Sp}(n_i/2)$ 给出全纯辛（引 [Bea83]）。剩下的 $H_i=\mathrm U(n_i)$：推广整体和乐原理 1.5 说明 $\mathcal O((T_{X_i}^*)^{\otimes m})$ 的任何可逆子层对 $m\ge 1$ 都不伪有效（否则平行的可逆层给出 $\mathrm U(n_i)$ 在 $(\mathbb C^{n_i})^{\otimes m}$ 中的平凡作用不变直线，与 1.5(b) 的表示论矛盾），于是判据 1.1 的 (c) 生效，$X_i$ 有理连通。分裂式中 $\mathbb C^q$、$Y_j$（SU 型）、$S_k$（Sp 型）、$Z_\ell$（U 型）各就各位，(a) 证毕。
- 证明 1.4 (b)（`main.tex:561-583`）：记 $X'=\prod_{i\ge 1}X_i$。覆盖变换群作用于 $\widetilde X=\mathbb C^q\times X'$，形如 $(z,x')\mapsto(u(z),v(x'))$ 的全纯等距。素材特意说明此处比 Beauville [Bea83] 的论证麻烦：$X'$ 的全纯等距群 $G'$ 未必有限（$X'$ 可以是射影空间），于是仿 Cheeger-Gromoll [CG72] 定理 9.2，用 $X'$ 与 $G'=\operatorname{Isom}(X')$ 都紧这一事实。令 $E_q=\mathbb C^q\rtimes\mathrm U(q)$ 为 $\mathbb C^q$ 的单位元运动群，则 $\pi_1(X)$ 可视作 $E_q\times G'$ 的离散子群；$G'$ 紧推出投影 $\pi_1(X)\to E_q$ 的核有限、像在 $E_q$ 中仍离散且商紧。于是存在 $\pi_1(X)$ 的有限指标子群 $\Gamma$，同构于 $\mathbb C^q$ 中的晶体学子群；Bieberbach 定理给出 $\Gamma$ 中由平移构成的有限指标子群 $\Gamma_0$；取 $\Gamma_0$ 在 $\pi_1(X)$ 中全部共轭的交，得正规有限指标子群 $\Gamma_1$，它在 $\mathbb C^q$ 上只作用平移。那么 $\widehat X=\widetilde X/\Gamma_1$ 是以 $X'$ 为纤维、底为环面 $\mathbb C^q/\Gamma_1$ 的纤维丛，且 $\pi_1(X')=1$；$\widehat X$ 即所求的有限 étale 覆盖。第二个断言沿纤维取有理商，得分解
$$\widehat X\xrightarrow{\ \beta\ }W\xrightarrow{\ \gamma\ }\operatorname{Alb}(\widehat X),$$
$\beta$ 是纤维为 $\prod Z_\ell$ 的纤维丛、$\gamma$ 是纤维为 $\prod Y_j\times\prod S_k$ 的纤维丛；由 $K_W\equiv 0$，断言从 Beauville-Bogomolov 分解定理推出（`main.tex:584-590`）。
- 证明 1.4 (c)（`main.tex:593-594`）：由 (b) 与纤维丛同伦正合列立得。

注意链条的分工：(a) 只用局部微分几何（De Rham、Berger）+ 第 3 节整体和乐 + 第 2 节判据；(b) 是纯离散群论操作（Cheeger-Gromoll、Bieberbach），把万有覆叠上的乘积结构下推到有限覆盖层面并保住纤维丛性；(c) 是同伦论的免费推论。定理 1.4 的"至多差有限 étale 覆盖"这一损失正是 (b) 中 $\Gamma_1$ 构造的代价，原始 $X$ 上未必有全局分裂，取到平移核 $\Gamma_1$ 之后才有。

## 6 第 5 节推论：Mumford 猜想的半正情形与变形刚性

推论 5.1（`main.tex:604-607`）：设 $X$ 是 $K_X^{-1}$ Hermite 半正的紧 Kähler 流形，若 $H^0(X,(T_X^*)^{\otimes m})=0$ 对一切正整数 $m$ 成立，则 $X$ 有理连通。理由：性质 $H^0(X,(T_X^*)^{\otimes m})=0$（$m\ge 1$）在有限 étale 覆盖下不变（`main.tex:599-602`），而按定理 1.4(a)，$\widetilde X$ 的每个因子要么是 $\mathbb C^q$、Calabi-Yau、全纯辛，要么有理连通；前三类各自携带不变微分形式或平坦方向上的截面，与消没假设冲突，只剩 $Z_\ell$ 型因子，$X$ 本身有理连通。素材把这句话说到位：这对半正 Ricci 曲率的 $X$ 确立了 Mumford 猜想（`main.tex:609-610`）。与注记 1.2 对照可读出两层含义：判据 1.1 一侧，(d) 在 Hermite 半正假设下与 (d') 等价的强度差别被 Bochner 机器抹平；一般射影情形则仍悬在 abundance 猜想后面。

推论 5.2（变形，`main.tex:615-636`）：设 $X$ 同上，$\pi:\mathcal X\to\Delta$ 是从 Kähler 流形 $\mathcal X$ 到单位圆盘的真射影满浸，$X_0=\pi^{-1}(0)\simeq X$。则存在有限 étale 覆盖 $\widehat{\mathcal X}\to\mathcal X$，投影 $\widehat\pi:\widehat{\mathcal X}\to\Delta$，使得缩小 $\Delta$ 后：

- (a) 相对 Albanese 映射 $\alpha:\widehat{\mathcal X}\to\operatorname{Alb}(\mathcal X/\Delta)$ 是满射满浸，从而每个 $\alpha_t:\widehat X_t\to\operatorname{Alb}(X_t)$ 都是满射满浸；
- (b) 每个 $\alpha_t$ 的纤维都是 Calabi-Yau、不可约辛与不可约有理连通流形的乘积；
- (c) $\alpha$ 有分解 $\widehat{\mathcal X}\xrightarrow{\ \beta\ }\mathcal Y\xrightarrow{\ \gamma\ }\operatorname{Alb}(\mathcal X/\Delta)$，使得每个时刻的 $\beta_t$ 是 $\widehat X_t$ 的满浸且有理商、$\gamma_t$ 是平凡纤维丛（`main.tex:623-635`）。

推论 5.2 是定理 1.4 加下面这个命题的直接产物。命题 5.3（`main.tex:640-649`）：设 $\pi:\mathcal Y\to\Delta$ 是单位圆盘上的紧 Kähler 满浸，若中心纤维分解为 $Y_0\simeq\prod X_i\times\prod Y_j\times\prod Z_k$（$X_i$ 为 Calabi-Yau，$Y_j$ 为不可约辛，$Z_k$ 为不可约有理连通），则缩小 $\Delta$ 后每个 $Y_t$ 都有同类型分解 $Y_t\simeq\prod X_{i,t}\times\prod Y_{j,t}\times\prod Z_{k,t}$，并且各因子按族 $\mathcal X_i$、$\mathcal Y_j$、$\mathcal Z_k$ 组织。

命题 5.3 的证明思路（`main.tex:651-661`）：只需处理两因子情形 $Y_0=A_1\times A_2$。由 $H^1(A_j,\mathcal O_{A_j})=0$，因子 $A_j$ 变形到邻近纤维 $Y_t$；用相对圈空间的适当性得到 $\Delta$ 上的族 $q_i:U_i\to S_i$ 与投影 $p_i:U_i\to\mathcal Y$，缩小 $\Delta$ 后给出全纯映射 $f_i:\mathcal Y\to S_i$；则 $f_1\times f_2:\mathcal Y\to S_1\times S_2$ 是同构，因为交数不变：$A_t\cdot B_t=A_0\cdot B_0=1$。这里"交数为 1"指两因子在纤维中的同调类相交恰好一次，变形中同调类不变，因此乘积分解的两半在任何时刻都横截且唯一确定，族的分离性把整体空间钉成乘积。

这条推论链的意义：半正 Ricci 的结构不是孤立纤维的奇迹，是形变开集上的刚性生活，分裂型、Albanese 满浸性与有理商分解都在族中保持。这也是引用它的语料稿把它用作"结构参照"，并非"单点定理"的原因。

## 7 附录：旗丛版整体和乐原理（A.10、A.11、定理 A.14、命题 A.16）

附录署名 Demailly（`main.tex:666`），目标（`main.tex:669-672`）：在对底流形不作任何假设的情形下，用一个改造的 Bochner 公式导出旗丛上的整体和乐原理变体。设定（`main.tex:672-697`）：$E\to X$ 秩 $r$，$F(E)$ 是旗丛，纤维为旗 $\xi:E_x=V_0\supset V_1\supset\cdots\supset V_r=\{0\}$，$\operatorname{codim}V_\lambda=\lambda$；$Q_\lambda=V_{\lambda-1}/V_\lambda$ 是重言线丛，权 $a=(a_1,\ldots,a_r)\in\mathbb Z^r$ 记 $Q^a=Q_1^{a_1}\otimes\cdots\otimes Q_r^{a_r}$，并容许 $a_j\in\mathbb R$ 的实线性组合记号。计算改在对偶旗丛 $F(E^*)$ 上做，$F(E)\simeq F(E^*)$ 由正交补 $V_\lambda=W_{r-\lambda}^\dagger$ 给出，且 $Q^a\to F(E^*)$ 同构于 $Q^b\to F(E)$，$b_\lambda=-a_{r-\lambda+1}$（`main.tex:698-714`）。

曲率显式计算（`main.tex:716-878`）：沿用第 3 节记号，在 $(z_0,\xi_0)$ 邻域取满足 (A.1)、(A.1') 的法坐标标架，并调标架使 $\xi_0$ 对应 $V_{\lambda,0}=\operatorname{Vect}(e_1,\ldots,e_\lambda)^\dagger$（A.2）；点 $(z,\xi)$ 由全纯标架 $\widetilde e_\lambda=e_\lambda+\sum_{\lambda<\mu}\xi_{\lambda\mu}e_\mu$（A.3）表示，$(z_j,\xi_{\lambda\mu})$ 给出 $F(E^*)$ 的局部坐标，纤维坐标数 $N=r(r-1)/2$。Gram-Schmidt 正交化得到（非全纯）正交标架 $\widehat e_\lambda$，二阶展开即 (A.4)（`main.tex:748-778`）。关键手法：$Q_\lambda^*$ 有全纯截面 $v_\lambda=\widetilde e_\lambda\bmod\operatorname{Vect}(\widetilde e_1,\ldots,\widetilde e_{\lambda-1})$，其重态度量范数平方
$$\lvert v_\lambda\rvert^2=1-\sum c_{jk\lambda\lambda}z_j\overline{z_k}+\sum_{\lambda<\mu}\lvert\xi_{\lambda\mu}\rvert^2-\sum_{\mu<\lambda}\lvert\xi_{\mu\lambda}\rvert^2+O((\lvert z\rvert+\lvert\xi\rvert)^3)$$
（`main.tex:780-801`），取 $\Theta_{Q_\lambda}=\partial\overline\partial\log\lvert v_\lambda\rvert^2$ 得
$$\Theta_{Q^a}=-\sum_{j,k,\lambda}a_\lambda c_{jk\lambda\lambda}\,dz_j\wedge d\overline z_k+\sum_{\lambda<\mu}(a_\lambda-a_\mu)\,d\xi_{\lambda\mu}\wedge d\overline\xi_{\lambda\mu}.$$
于是分解 $\Theta_{Q^a}=\theta_a^H+\theta_a^V$（A.5），其中水平部分 $\theta_a^H=-\sum_\lambda a_\lambda\pi^*\langle\Theta_{T_X,\omega}(e_\lambda),e_\lambda\rangle$（A.6^H）沿纤维用正交标架 $(\widehat e_\lambda)$ 内蕴化即 (A.8)，垂直部分 $\theta_a^V=\sum_{\lambda<\mu}(a_\lambda-a_\mu)d\xi_{\lambda\mu}\wedge d\overline\xi_{\lambda\mu}$（A.6^V）；分解相对由 Chern 联络给出的 $C^\infty$ 分裂 $0\to T_{Y/X}\to T_Y\to\pi^*T_X\to 0$（A.7）取，水平方向即 $\nabla$-平行标架诱导的旗方向（`main.tex:802-853`）。$\theta_a^V$ 沿纤维酉不变（A.9 给出相对体积形式 $\eta=\bigwedge_{\lambda<\mu}i\,d\xi_{\lambda\mu}\wedge d\overline\xi_{\lambda\mu}$），严格支配权 $a_1>a_2>\cdots>a_r$ 时 $Q^a$ 相对 ample 且 $(i\theta_a^V)^N=N!\prod_{\lambda<\mu}(a_\lambda-a_\mu)\,\eta$（`main.tex:854-878`）。

公式 A.10（`main.tex:881-909`）汇总上述曲率表达，并补一条：相对典范丛 $K_{Y/X}\simeq Q^\rho$，反支配典范权 $\rho_\lambda=2\lambda-r-1$；于是对 $X$ 上正 $(1,1)$-形式 $\omega$，
$$i\partial\overline\partial\eta\wedge\pi^*\omega^{n-1}=-i\theta_\rho^H\wedge\eta\wedge\pi^*\omega^{n-1}=\sum_\lambda\rho_\lambda\,\pi^*\langle i\Theta_{T_X,\omega}(\widehat e_\lambda),\widehat e_\lambda\rangle\wedge\eta\wedge\pi^*\omega^{n-1}.$$
其证明（`main.tex:911-1000`）是附录计算量最大的一段：由 $(i\theta_a^V)^N$ 与 $\eta$ 成比例，改算 $\partial\overline\partial(\theta_a^V)^N$ 的二项展开 $\partial\overline\partial(\theta_a^V)^N=N(\theta_a^V)^{N-1}\wedge\partial\overline\partial\theta_a^V+N(N-1)(\theta_a^V)^{N-2}\wedge\partial\theta_a^V\wedge\overline\partial\theta_a^V$；$\Theta_{Q^a}$ 闭给出 $\partial\overline\partial\theta_a^V=-\partial\overline\partial\theta_a^H$；只有 $\xi$ 微分参与（$\ge3$ 次 $dz$ 项与 $\pi^*\omega^{n-1}$ 外乘为零，$\partial\theta_a^V\wedge\overline\partial\theta_a^V$ 因产生 $\ge4$ 次 $dz_j,d\overline z_k$ 也不贡献）；(A.4) 展开 $\widehat e_{\lambda\sigma}\overline{\widehat e_{\lambda\tau}}$ 后，按 (A.7) 只有对角项 $d\xi_{\lambda\mu}\wedge d\overline\xi_{\lambda\mu}$ 存活，得
$$\partial\overline\partial\Bigl(\sum_\lambda a_\lambda\sum_{\sigma,\tau}c_{jk\sigma\tau}\widehat e_{\lambda\sigma}\overline{\widehat e_{\lambda\tau}}dz_j\wedge d\overline z_k\Bigr)=\sum_{\lambda<\mu}(a_\lambda-a_\mu)(c_{jk\mu\mu}-c_{jk\lambda\lambda})\,d\xi_{\lambda\mu}\wedge d\overline\xi_{\lambda\mu}\wedge dz_j\wedge d\overline z_k+\text{（无用项）},$$
代 $a=\rho$ 时 $c_{jk\lambda\lambda}$ 的系数是 $(\lambda-1)-(r-\lambda)=2\lambda-1-r$：小于 $\lambda$ 的指标数 $\lambda-1$ 来自 $(a_\lambda-a_\mu)c_{jk\mu\mu}$ 项，大于 $\lambda$ 的指标数 $r-\lambda$ 来自 $-(a_\lambda-a_\mu)c_{jk\lambda\lambda}$ 项（`main.tex:975-1000`）。

Bochner 公式 A.11（`main.tex:1002-1045`）：设 $X$ 紧复、容许平衡度量 $\omega$（$d\omega^{n-1}=0$），支配权 $a$ 使实线丛 $Q^a$ 在 $Y=F(E^*)$ 上伪有效（存在拟多重次调和 $\varphi$ 使 $i(\Theta_{Q^a}+\partial\overline\partial\varphi)\ge 0$），则
$$\int_Y\bigl(i\partial\varphi\wedge\overline\partial\varphi-i\theta_{a-\rho}^H\bigr)e^\varphi\,\eta\wedge\pi^*\omega^{n-1}\le 0.$$
证明用 Stokes：$\int_Yi\partial\overline\partial(e^\varphi)\wedge\eta\wedge\pi^*\omega^{n-1}-e^\varphi\,i\partial\overline\partial\eta\wedge\pi^*\omega^{n-1}=0$（A.12），再代入 $i\partial\overline\partial\varphi\ge-i\Theta_{Q^a}$ 与 A.10(a)(b) 得 $i\partial\overline\partial\varphi\wedge\eta\wedge\pi^*\omega^{n-1}-i\partial\overline\partial\eta\wedge\pi^*\omega^{n-1}\ge(-i\theta_a^H+i\theta_\rho^H)\wedge\eta\wedge\pi^*\omega^{n-1}$（A.13），两式合并即所求（`main.tex:1023-1045`）。注意假设里 $\rho$ 的出现：权 $a$ 与典范权 $\rho$ 的差 $a-\rho$ 决定水平曲率到底被积进什么符号，这是旗丛版比线丛版更锐的地方。

平行输运在旗丛上的提升（`main.tex:1048-1067`）：分段光滑道路 $\gamma$ 给出酉同构 $\tau_\gamma:E_p\to E_q$，从而 $\widetilde\gamma$ 作用在 $F(E^*)$ 上并提升为 $Q^a$ 的同构；$v$ 有唯一的水平提升 $\widetilde v$，其流由平行输运组成；$h_a$ 由构造平行不变，而改写度量 $h_{a,\varphi}=h_ae^{-\varphi}$ 平行不变当且仅当 $d\varphi(\zeta)=0$ 对所有水平向量场 $\zeta$ 成立。

定理 A.14（`main.tex:1069-1089`，证明 `main.tex:1091-1139`）：$X$ 紧复、$\omega$ Hermite、$B=\operatorname{Tr}_\omega(i\Theta_{E,h})\ge 0$，逐点特征值 $0\le b_1(z)\le\cdots\le b_r(z)$；$Q^a$（$a_1\ge\cdots\ge a_r\ge 0$）在 $Y=F(E^*)$ 伪有效，权 $\varphi$ 如上。则 (a) $\psi(z)=\sup_{\xi\in F(E_z^*)}\varphi(z,\xi)$ 为常数，且 $a_\lambda>0$ 时 $b_\lambda\equiv 0$，特别 $a_r>0$ 时 $B\equiv 0$；(b) 若 $B\equiv 0$，则 $\varphi$ 在平行输运下不变。证明 (a)：A.10(a) 给 $i\partial\overline\partial\varphi\ge-i\theta_a^H-i\theta_a^V$，取水平部分并楔 $\omega^{n-1}$ 得 (A.15)；对 $\xi$ 取 sup，由次调和函数的标准论证得 $\Delta_\omega\psi\ge\sum a_\lambda b_\lambda(z)$（右端是 (A.15) 中出现 $(n,n)$-形式的系数的最小值）；$\psi$ 次调和，紧性加 Aronszajn [Aro57] 唯一延拓逼出常数，随之 $a_\lambda>0$ 处 $b_\lambda\equiv 0$。证明 (b)：$B\equiv 0$ 时 A.10(b) 的计算给出 $\partial\eta\wedge\pi^*\omega^{n-1}=0$、$\partial\overline\partial\eta\wedge\pi^*\omega^{n-1}=0$；A.11 的不等式夹成 $0\le\int_Yi\partial\varphi\wedge\overline\partial\varphi\wedge\eta\wedge\pi^*\omega^{n-1}\le 0$，故水平导数 $\partial^H\varphi$ 恒零，即 $\varphi$ 平行不变。

命题 A.16（`main.tex:1144-1162`）收拢回双有理几何语言：紧 Kähler $X$ 射影且有理连通，当且仅当 $Y=F(T_X^*)$ 上任何非零支配权 $a$ 的实线丛 $Q^a$ 都不伪有效。正向：若有理连通 $X$ 上某 $Q^a$（$a\ne 0$）伪有效，取 $f:\mathbb P^1\to X$ 使 $E=f^*T_X$ ample（此时 $B>0$），拉回 $T_X$ 与 $Q^a$ 后即与定理 A.14(a) 矛盾。反向：取 $a_1=\cdots=a_p=1$、其余为 0，则 $\pi_*Q^a=\Omega_X^p$，故 $H^0(X,\Omega_X^p)=0$ 且一切 $\mathcal F\subset\Omega_X^p$ 不伪有效；$p=2$ 时用 Kodaira [Kod54] 得射影性，再用判据 1.1(b) 得有理连通。附录至此与正文的判据 1.1 和命题 1.5 完全对接：A.14 是 1.5 的旗丛强化，A.16 是 1.1 的无射影假设版本。

## 8 与本语料的接缝

引用登记（与 §0 一致）：本论文的 bib key 为 `CDP2015`，被语料稿 D289、D305、D318、D385、D447、D451、D471 引用。按本单纪律，写手不读这些语料稿，故此处不指认各稿的具体行位，回引位置以各 D 稿引文条目为准，由本体侧统一执行；本节给出的是"哪组结论最可能被哪类使用方式调用"以及"用到的记号在 C 稿中如何读"。

按结论族拆接缝：

- 结构定理 1.4（分裂、Albanese 纤维丛、近乎交换基本群，`main.tex:240-267`；本稿第 3 节、第 5 节）：凡语料稿中出现"半正反典范丛的紧 Kähler 流形在有限 étale 覆盖下分裂为 Ricci 平与有理连通因子"或"$\pi_1$ 近乎交换"的陈述，其标准出处即此。读法要点：分裂发生在万有覆叠 $\widetilde X$ 上且对所取 Kähler 度量等距；下降到底空间要再取有限 étale 覆盖 $\widehat X$；纤维丛性只对 $\alpha:\widehat X\to\operatorname{Alb}(\widehat X)$ 成立。引用时不得把 (a) 的 $\widetilde X$ 分裂直接安到 $X$ 头上。
- 判据 1.1（`main.tex:187-206`；本稿第 2 节）：凡语料稿以"不存在伪有效的可逆子层 $\mathcal F\subset\Omega_X^p$ 或 $\mathcal F\subset\mathcal O((T_X^*)^{\otimes p})$"或"截面消没 $H^0(X,(T_X^*)^{\otimes m}\otimes A^{\otimes k})=0$（$m\ge C_Ak$）"来判定有理连通，出处即此；注意它原文只对射影代数流形陈述，Kähler 情形要经注记 1.3 的 Kodaira 桥。
- 推广整体和乐原理 1.5（`main.tex:281-306`）与 Bochner 不等式 (3.2)（`main.tex:488-497`；本稿第 4 节）：凡语料稿论证"$\operatorname{Tr}_\omega\Theta_{E,h}\ge 0$ 时伪有效子丛必平且平行不变"或引用"和乐为 $\mathrm U(r)$ 则无伪有效子丛"的表示论推论，走的就是这一族；假设里 Gauduchon 度量与 $B\ge 0$ 缺一不可。
- Mumford 猜想的半正情形（推论 5.1，`main.tex:604-610`；本稿第 6 节）：语料稿若讨论 $H^0(X,(T_X^*)^{\otimes m})=0$ 蕴含理性连通，在半正 Ricci 假设下的这一特例出处在此；一般情形素材自己标注仍依赖 abundance（`main.tex:214-218`）。
- 变形刚性（推论 5.2 与命题 5.3，`main.tex:615-661`；本稿第 6 节）：语料稿若在族 $\pi:\mathcal X\to\Delta$ 上引用"分裂型在形变中保持、相对 Albanese 是满浸、纤维有理商平凡化"，出处在此；使用时的前提是全族 Kähler、满浸且中心纤维半正。
- 附录旗丛版（A.10、A.11、A.14、A.16，`main.tex:664-1162`；本稿第 7 节）：语料稿若在 $F(T_X^*)$ 上工作、用到重言线丛 $Q^a$ 的曲率分解 $\Theta_{Q^a}=\theta_a^H+\theta_a^V$、典范权 $\rho_\lambda=2\lambda-r-1$、或"底流形无假设的 Bochner 不等式"，出处在附录；A.16 提供的等价刻画（射影且有理连通 iff 一切非零支配权 $Q^a$ 不伪有效）不要求事先知道射影性，比判据 1.1 的适用面更宽。

记号对照（素材原写法到本稿读法）：`\bP` 读作 $\mathbb P$；`\cF,\cL,\cO,\cX,\cY` 读作 $\mathcal F,\mathcal L,\mathcal O,\mathcal X,\mathcal Y$；`\Omega^p_X` 读作 $\Omega_X^p=\mathcal O(\Lambda^pT_X^*)$；`\UU,\SU,\Sp` 读作 $\mathrm U,\mathrm{SU},\mathrm{Sp}$；`\ddbar` 读作 $\partial\overline\partial$；`\Tr_\omega` 读作 $\operatorname{Tr}_\omega$；`\Alb` 读作 $\operatorname{Alb}$；`\merto` 读作有理映射箭头 $\dashrightarrow$；`\semidirect` 读作半直积 $\rtimes$；`\PSH` 读作 $\operatorname{PSH}$；`\bOne` 读作指示函数 $\mathbf 1$；`\rA` 前缀即附录编号 A。奇异 Hermite 度量约定 $e^{-\varphi}$、曲率流约定 $T=i\Theta_{L,h}=-i\partial\overline\partial\log h$、度量比函数 $\psi=e^\varphi\lVert f\rVert^2$ 三件在 §4 已按原文位置串给出，语料稿引用这些约定时应回查 `main.tex:436-449` 与 `main.tex:175-180`。
