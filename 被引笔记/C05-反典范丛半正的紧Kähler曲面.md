# C05 反典范丛半正的紧Kähler曲面（arXiv:2609.26716）

## 0 取证边界

- arXiv id：2609.26716
- 原题名（逐字）：Compact Kähler surfaces with semipositive anticanonical bundle
- 作者（原文署名逐字，API 署名同）：Yifan Chen, Simion Filip, Song Sun, Valentino Tosatti, Junsheng Zhang
- 发表年月：2026-09-22
- 素材目录：`E:\math\被引素材/2609.26716`
- 主 tex 清单：`被引素材/2609.26716/New_version.tex`（81,886 字节 / 1,412 行，实测行数与派单一致，末行为 `\end{document}`）
- 目录内其余文件：`00README.json`（220 字节）、`ref.bib`（20,335 字节）。`.bib` 只用于核对引注标签的对应文献名，不作内容来源；本素材无 `.pdf`，也无 `sections/` 前缀的子目录，故全部位置串形如 `New_version.tex:123`。
- 本语料中引用它的稿号与 bib key（只在此处原样登记）：D289（`CFSTZ2026`）；D305（`CFSTZ2026`）；D318（`CFSTZ2026`）；D385（`CFSTZ2026`）；D447（`CFSTZ2026`）；D451（`CFSTZ2026`）；D471（`CFSTZ2026`）。
- 取证读法：`New_version.tex` 全文通读，四段依次为 `New_version.tex:1-400`、`New_version.tex:401-800`、`New_version.tex:801-1200`、`New_version.tex:1201-1412`。取证读取共 4 次，单次不超过 400 行，末段读到文件尾；本稿所有位置串都出自这四段读过的行。
- 定理编号的读法：素材用 `\newtheorem{theorem}{Theorem}[section]`，且 `proposition`、`lemma`、`definition`、`corollary`、`remark` 全部挂在同一个按节计数的计数器上（`New_version.tex:8-14`），因此同节内定理与命题、引理连续编号。本稿按该约定称：`New_version.tex:81` 的定理为定理 1.1，`New_version.tex:99` 的推论为推论 1.2，`New_version.tex:106` 的分类定理为定理 1.3，`New_version.tex:149` 的定理为定理 1.6，`New_version.tex:157` 的推论为推论 1.7；第 2 节命题（`New_version.tex:232`）为命题 2.1，第 4 节命题（`New_version.tex:320`）为命题 4.1，第 5 节依次为引理 5.1（`New_version.tex:460`）、引理 5.2（`New_version.tex:554`）、定义 5.3（`New_version.tex:592`）、命题 5.4（`New_version.tex:611`）、命题 5.5（`New_version.tex:794`）、定理 5.6（`New_version.tex:869`）。
- 记法约定：素材 preamble（`New_version.tex:16-35`）把 `\leq`、`\geq` 重定义为 `\leqslant`、`\geqslant`，把 `\p` 定义为 `\partial`、`\bp` 与 `\dbar` 定义为 `\overline\partial`、`\calO` 定义为 `\mathcal O`、`\ii` 定义为 `\sqrt{-1}`、`\C` 与 `\R` 与 `\D` 定义为相应黑板体字母、`\bL` 定义为 `\mathbb L`、`\id` 定义为 `\operatorname{id}`、`\Exp` 定义为 `\operatorname{Exp}`、`\I` 定义为带 `\text{Id}` 的算子，并把 `\epsilon` 换成 `\varepsilon`。本稿动笔即按展开后的 KaTeX 写法落地，不继承任何自定义命令；`\mathbb L` 写作 $\mathbb L$，`\operatorname` 与 `\mathbb` 这类命令展开写作 $\operatorname{Pic}$ 与 $\mathbb P$。素材第 5 节用到 `tikzcd` 交换图（`New_version.tex:622-632`），本稿改写成文字加关系式。

## 1 出发点：度零法丛的平坦性能否外扩

摘要一句话交代了两件事（`New_version.tex:63`）：把紧 Kähler 曲面上反典范丛 Hermitian 半正的情形分类干净；并且解决 Demailly-Peternell-Schneider 留下的一个问题，即在 $\mathbb P^2$ 中一条光滑三次曲线的 9 个点（允许无穷近点）上吹得的空间，其反典范丛半正。

第一个问题在 `New_version.tex:72-74` 以最小设定提出。设 $M$ 为复曲面，$D\subset M$ 为光滑紧连通除子，$L$ 为 $D$ 的全纯法丛，假设 $L$ 数值平凡，即 $\deg L=D^2=0$（`New_version.tex:73`）。限制 $\mathcal O_M(D)\lvert_D\simeq L$ 容许平坦 Hermitian 度量；问的是这份平坦性能否传到 $D$ 的某个开邻域 $D\subset U\subset M$ 上，即 $\mathcal O_M(D)\lvert_U$ 是否容许平坦 Hermitian 度量（`New_version.tex:74`）。

这条问题的文献层次在 `New_version.tex:79`：Ueda 的奠基工作（并提到 Arnold）证明当 $L$ 是挠元或满足 Diophantine 条件时答案为是；Brunella 与 Koike 继续研究；Ogawa 把 Diophantine 条件放宽到算术的 Brjuno 条件。本文定理 1.1（`New_version.tex:81-83`）把反典范假设下的答案一次做完：设 $D\in\lvert K_M^{-1}\rvert$，则存在 $D$ 的开邻域 $U$ 使 $\mathcal O_M(D)\lvert_U$ 容许平坦 Hermitian 度量，特别 $K_M^{-1}\simeq\mathcal O_M(D)$ Hermitian 半正，即容许光滑 Hermitian 度量 $h$ 使曲率 $R_h\ge 0$ 在整个 $M$ 上成立。按伴随公式，$D\in\lvert K_M^{-1}\rvert$ 且 $D$ 光滑时 $D$ 亏格为 1（`New_version.tex:79` 末句），所以这确实是椭圆曲线的嵌入问题。

`New_version.tex:85` 明确了假设的分量：定理 1.1 不需要任何 Diophantine 或算术条件，$M$ 也不假设紧；根本理由来自 $D\in\lvert K_M^{-1}\rvert$ 这一条。去掉它就没有对应结论：Ueda 在 `\S5.4` 构造过把椭圆曲线嵌入非紧曲面、法丛度零而结论失败的例子，Koike-Ogawa 进一步证明那些例子里 $\mathcal O_M(D)$ 连 Hermitian 半正都不满足。

紧 Kähler 情形之所以关键，是 Yau 定理把度论语言翻译成度量语言：$K_M^{-1}$ Hermitian 半正等价于 $M$ 容许 Ricci 曲率非负的 Kähler 度量（`New_version.tex:88`）。分类紧 Kähler 曲面上 Ricci 非负度量这个题目由 Yau 给过部分分类（`New_version.tex:90`），Demailly-Peternell-Schneider 在文末留了两个问题（`New_version.tex:90-96`）。第一问：反典范丛 nef 的有理连通紧 Kähler 流形是否必 Hermitian 半正；Koike 给出否定答案，构造材料是 $\mathbb P^2$ 在一条 nodal 三次曲线的 9 个点上吹（`New_version.tex:90-92`）。第二问在 `New_version.tex:94-96`：在一条光滑三次曲线的 9 个点上吹 $\mathbb P^2$ 是否必 Hermitian 半正，其中 9 个点允许无穷近，即每次吹完下一次的中心可以是该三次曲线严格变换上的任意点。这一问被 Sad、Eckl、Brunella、Claudon-Loray-Pereira-Touzet、Koike 陆续研究过。推论 1.2（`New_version.tex:99-101`）就是定理 1.1 的直接后果：在光滑三次曲线的 9 个（可无穷近）点上吹 $\mathbb P^2$ 得 $M$，则 $K_M^{-1}$ Hermitian 半正。这里的逻辑要说清楚：吹 9 个点后严格变换 $D$ 满足 $D\in\lvert K_M^{-1}\rvert$ 且光滑，于是定理 1.1 的前提被满足，第二问由此关闭。

`New_version.tex:103` 起说明把定理 1.1 与 Koike、Sakai 的结果合并可得到完整分类，即定理 1.3。第 1.5 小节（`New_version.tex:196-207`）另外把技术线索接到 Perez Marco-Yoccoz 关于给定全纯叶层 germ 与规定全纯不变量的工作：他们处理形如 $\dot{x}=-x(1+\cdots)$、$\dot{y}=\alpha y(1+\cdots)$（$\alpha>0$）的向量场 germ，把向量场的坐标分类与形如 $z\mapsto e^{2\pi i\alpha}z(1+\cdots)$ 的微分同胚 germ 的共轭分类对置起来（`New_version.tex:198-200`）；$\alpha$ Diophantine 时两侧都可线性化，分类平凡，$\alpha$ 有理时分类困难但可做，$\alpha$ 无理且非 Diophantine 时最棘手（`New_version.tex:201-203`）。他们的证明不依赖 $\alpha$ 的任何性质，思路与本文相同：先造光滑微分同胚，再把它改进为全纯（`New_version.tex:205-206`）。差别在分析输入：那边用 Hörmander 的 $\overline\partial$ 的 $L^2$ 估计，本文用的是引理 5.2（`New_version.tex:207`）。

## 2 两个主定理的陈述、周期不变量与证明梗概

定理 1.3（`New_version.tex:106-121`）是分类陈述：$M$ 为光滑紧 Kähler 曲面，则 $K_M^{-1}$ Hermitian 半正当且仅当四条中恰有一条成立。

- (A)（`New_version.tex:111`）$K_M^{-1}$ 半 ample，即某个正倍数的线性系无基点。
- (B)（`New_version.tex:112`）$M$ 有理，且 $\lvert K_M^{-1}\rvert$ 含一条光滑椭圆曲线 $D$，其法丛 $N_D\in\operatorname{Pic}^0(D)$ 非挠。
- (C)（`New_version.tex:113-114`）$M$ 有理，且 $\lvert K_M^{-1}\rvert$ 含一条约化有理曲线圈 $D$，使 $N_D:=\mathcal O_D(D)\in\operatorname{Pic}^0(D)\simeq\mathbb C^*$ 的周期 $q_D$ 满足 $\lvert q_D\rvert=1$ 且不是单位根。
- (D)（`New_version.tex:115-119`）存在椭圆曲线 $B$ 与非挠线丛 $L\in\operatorname{Pic}^0(B)$，使 $M\simeq\mathbb P_B(\mathcal O_B\oplus L)$。

四条互斥，且 (B)(C) 的 $K_M^{-1}$ 半正而不半 ample，(D) 亦如此，(A) 是唯一半 ample 的一支。(B) 这一支正是本文新打开的门：定理 1.1 保证任何反典范椭圆曲线都给出半正，而 $N_D$ 非挠时它不半 ample。

圈与周期的定义在 `New_version.tex:123-129` 处给出，需要逐字读准。所谓约化有理曲线圈指连通 nodal 曲线 $D=D_1+\cdots+D_r$，每个不可约分量重数为一、规范化为 $\mathbb P^1$，其对偶图同胚于圆周（`New_version.tex:123`）。单分量 nodal 圈与两分量横交于两点的圈都算在内（同处）。对这样的 $D$ 取一个代数群同构 $\alpha_D:\operatorname{Pic}^0(D)\to\mathbb C^*$，当 $N_D\in\operatorname{Pic}^0(D)$ 时令 $q_D:=\alpha_D(N_D)$；换别的同构把 $q_D$ 换成 $q_D^{-1}$，于是 $\lvert q_D\rvert=1$、$q_D$ 挠、挠的阶这三条都与选择无关（`New_version.tex:124-129`）。这就是 (C) 里 "$\lvert q_D\rvert=1$ 但非单位根" 的确切含义：它只依赖 $N_D$ 自己。

Remark 1.4（`New_version.tex:131-133`）把 (A) 按 $\kappa(K_M^{-1})$ 细分，取值为 $0,1,2$。$\kappa=2$ 时 $M$ 是弱 del Pezzo 曲面，同构于 $\mathbb P^2$、$\mathbb P^1\times\mathbb P^1$、Hirzebruch 曲面 $\mathbb F_2$，或在至多 9 个"近似一般位置"的点上吹 $\mathbb P^2$。$\kappa=1$ 时必有 $H^{2,0}(M)=H^0(M,K_M)=0$，故 $M$ 射影，且被 $\mathbb P^1\times E$（$E$ 椭圆）有限覆盖，或在 $\mathbb P^2$ 的某个 Halphen 铅笔（指标 $m\ge 1$）的 9 个基点上吹。$\kappa=0$ 时 $K_M$ 全纯挠，$M$ 是 $K3$、环面、Enriques 曲面或双椭圆曲面。Remark 1.5（`New_version.tex:135-142`）声明紧非 Kähler 曲面的对应事实：$K_M^{-1}$ Hermitian 半正当且仅当 $M$ 是 primary 或 secondary Kodaira 曲面，或被对角 primary Hopf 曲面有限覆盖的 Hopf 曲面；证明在第 7.3 小节（`New_version.tex:1309-1366`），本稿第 8 节展开。

证明梗概在 `New_version.tex:165-192`，思路值得逐句对齐。设定下只需在 $X:=M\setminus D$ 的末端上造一个在 $D$ 附近有对数增长的 pluriharmonic 函数。这样的函数 $z$ 在 $D$ 的 punctured 法丛 $L^\times:=L\setminus\mathbf 0_L$ 上关于复结构 $J_L$ 天然存在，几何上是 $L^\times$ 上柱状 Kähler Ricci 平坦度量的 $\mathbb R$ 参数（`New_version.tex:167`）。用指数型微分同胚 $\Phi$ 把 $M$ 中 $D$ 的邻域等同于 $L$ 中零截线的邻域，自然考虑 $\Phi^*z$，于是要找增长率比对数慢的 $u$ 满足 $\sqrt{-1}\partial_{J_M}\overline\partial_{J_M}u=\sqrt{-1}\partial_{J_M}\overline\partial_{J_M}\Phi^*z$（`New_version.tex:168-170`）。这是线性方程，但没有直接方法能给出所需估计，于是把 $u$ 的线性问题换成 $\Phi$ 的非线性问题：找微分同胚 $\Psi$ 使 $\sqrt{-1}\partial_{J_M}\overline\partial_{J_M}\Psi^*z=\Psi^*(\sqrt{-1}\partial_{\Psi_*J_M}\overline\partial_{\Psi_*J_M}z)=0$ 在 $X$ 的末端上成立（`New_version.tex:172-175`）。关键材料是 $X$ 上 $J_M$-全纯的闭体积式 $\Omega_M$，它跨越 $D$ 亚纯延拓、沿 $D$ 一阶极点；它把微分同胚的方程降为一阶，同时定义出带定量控制的有界算子，然后对相应非线性泛函用 Banach 不动点定理找零点（`New_version.tex:176-177`）。

小除子问题在 `New_version.tex:179-192` 被正面交代。给定紧复曲面中椭圆曲线的度零嵌入，Ueda、Brunella、Koike 的工作说明证 $\mathcal O_M(D)$ Hermitian 半正等价于嵌入 germ 垂直线性化，这是个动力学性质的条件，被更强的线性化（$D$ 在 $M$ 中有全纯管状邻域）推出；一般情形线性化即使在形式层面也被 obstructed，Ueda 观察到度零椭圆嵌入总是形式垂直线性化（所有 Ueda 类消失），要证垂直线性化就得证这些形式幂级数收敛，此处撞上小除子：除非对法丛加算术假设，形式解的收敛会被摧毁。完全线性化问题确实会失败：第二与第四作者在近作中证明，给定 $\mathbb P^2$ 中任意光滑三次曲线，存在许多 9 个不同点的构型，吹完以后严格变换的嵌入不可线性化且法丛非挠（`New_version.tex:179`）。本文的额外几何假设 $D\in\lvert K^{-1}_M\rvert$ 通过 $\Omega_M$ 绕开小除子：体积式把所需的 pluriharmonicity 变成邻域 germ 的一阶条件，它的闭性通过 `New_version.tex:507-512` 与 `New_version.tex:659-661` 两条恒等式把误差的切向分量与法向分量联系起来，保证受小除子影响的项本身按比例小；酉平坦几何把这份补偿精确化，得到 `New_version.tex:692-694` 与 `New_version.tex:699-702` 的一致估计，即使法丛幂任意快地逼近平凡丛也成立（`New_version.tex:181-192`）。

## 3 垂直线性化与 Ueda 理论：命题 2.1 的五条等价

素材第 2 节（`New_version.tex:217-281`）把动力学语言与度量语言对接起来，是全文的翻译层。设定（`New_version.tex:219`）：$C\subset S$ 是光滑紧连通曲线在光滑紧复曲面中的全纯嵌入，$C^2=0$。法丛 $N_{C/S}$ 拓扑平凡，故酉平坦；于是存在 $C$ 的有限开覆盖 $\{V_i\}$（由 $S$ 中的坐标卡给出），使 $N_{C/S}$ 在 $\{V_i\cap C\}$ 上平凡化，转移函数为常数 $t_{ij}\in\mathbb C^*$ 且 $\lvert t_{ij}\rvert=1$。记 $\Phi_i=(z_i,w_i):V_i\to\mathbb C^2$，可设 $C\cap V_i=\{w_i=0\}$ 且在 $C\cap V_i\cap V_j$ 上 $\mathrm dw_i=t_{ij}\,\mathrm dw_j$。

按 Ueda 的说法，嵌入垂直线性化指能找到这样的卡使得在 $V_i\cap V_j$ 上 $\;w_i=t_{ij}w_j$（`New_version.tex:221-224`）。名字的来由在 `New_version.tex:225-229`：若该式成立，则 $(\Phi_i\circ\Phi_j^{-1})(z_j,w_j)=(z_i(z_j,w_j),\,t_{ij}w_j)$，$w$ 分量与法丛转移函数一致，而 $z$ 分量是换卡的 $z_i(z_j,w_j)$，只在 $C$ 上限制为坐标卡的转移映射。

命题 2.1（`New_version.tex:232-244`）给出五条等价，设 $S$ 紧、$C\subset S$ 光滑连通紧曲线、$\deg N_{C/S}=0$：

1. $\mathcal O_S(C)$ 容许带非负曲率形式的光滑 Hermitian 度量；
2. 存在开邻域 $C\subset U\subset S$ 与 plurisubharmonic 函数 $F:U\to\mathbb R\cup\{-\infty\}$，使 $F-\log\lvert w\rvert^2$ 对 $C$ 的每个局部定义函数 $w$ 局部有界，并满足 $dd^cF=[C]$；
3. 存在开邻域 $C\subset U\subset S$，使 $\mathcal O_S(C)\lvert_U$ 酉平坦；
4. 嵌入 $C\subset S$ 垂直线性化；
5. 存在开邻域 $C\subset U\subset S$ 与 $U$ 上无奇全纯叶层 $\mathcal F$，使 $C$ 是紧叶，且 $\mathcal F$ 沿 $C$ 的不变量是 $U(1)$-线性的。

`New_version.tex:245` 补一句要紧的边界：$S$ 的紧性只在 $(1)\Rightarrow(3)$ 用到，KO 猜想非紧时也成立。

证明链逐条对齐原文。(1)$\Rightarrow$(3) 引 Koike 推论 1.5，推广 Brunella 的较早工作（`New_version.tex:248`）。(3)$\Rightarrow$(1) 初等，见 Brunella 原文 p.442，并且留到定理 1.1 证明末尾再演示一次（`New_version.tex:250`）。(2)$\Leftrightarrow$(3) 的论证在 `New_version.tex:252-266` 完整给出：取 $\mathcal O_S(C)$ 的光滑 Hermitian 度量 $h_0$ 与定义截面 $s$，把 Poincaré-Lelong 公式与 $dd^cF=[C]$ 合并，在 $U$ 上有 $dd^c(\log\lvert s\rvert^2_{h_0}-F)=-R_{h_0}$（`New_version.tex:254`），椭圆正则性给出 $G:=\log\lvert s\rvert^2_{h_0}-F$ 在 $U$ 上光滑，于是 $h:=h_0e^{-G}$ 在 $\mathcal O_S(C)\lvert_U$ 上曲率恒为零（`New_version.tex:256`）。反向取 $F:=\log\lvert s\rvert^2_h$，它在 $U\setminus C$ 光滑、近 $C$ 与 $\log\operatorname{dist}(\cdot,C)$ 同阶，由 Poincaré-Lelong 得 $dd^cF=[C]-R_h=[C]$（`New_version.tex:258-265`）。

(3)$\Leftrightarrow$(4)$\Leftrightarrow$(5) 归于 Ueda（`New_version.tex:268`）。$(3)\Rightarrow(4)$ 的推理值得抄下来：开覆盖 $\{V_i\}$ 上 $\mathcal O_S(C)$ 的转移函数由 $w_i/w_j$ 给出，若 (3) 成立可取覆盖使 $w_i/w_j=s_{ij}$，$\lvert s_{ij}\rvert=1$；而在 $C\cap V_i\cap V_j$ 上 $\mathrm dw_i=t_{ij}\mathrm dw_j$，故 $s_{ij}=t_{ij}$，垂直线性化得证。$(4)\Rightarrow(5)$：由 $w_i=t_{ij}w_j$，向量场 $\partial/\partial z_i$ 生成的直线在 $V_i\cap V_j$ 上与 $\partial/\partial z_j$ 生成的一致，于是定出无奇全纯叶层 $\mathcal F$，叶由 $\{w_i=\text{const}\}$ 给出，$C$ 自身是紧叶；沿 $C$ 内一条回路的不变量可视为 $\mathrm{Bihol}(\mathbb C,0)$ 的元素，由 $w_i=t_{ij}w_j$ 它们都来自 $U(1)$ 的乘法（`New_version.tex:268`）。$(5)\Rightarrow(4)$ 的论证在 `New_version.tex:269-280`：取基点与一个使整个不变量表示为 $U(1)$-线性的横截坐标，沿 $C$ 内的路径把该坐标输运，得到一组足够细的流箱上的横截坐标；在交叠上两种取法之差是所选基点处某回路的不变量，故为乘以模长为一的复数，缩小流箱后有 $w_i=s_{ij}w_j$、$\lvert s_{ij}\rvert=1$，同上论证得 $s_{ij}=t_{ij}$。

这一节的用处要挑明：定理 1.1 的结论是 (3) 型陈述（邻域上酉平坦），而半正度量（定理 1.1 的第二结论）由 (3)$\Rightarrow$(1) 得到；后文第 7 节构造的 pluriharmonic 函数 $r$ 给出的是 (2) 型对象，经由 (2)$\Rightarrow$(3) 转成平坦性。第 2.1 节还支撑第 7.4 小节对 Ueda 型 $(\gamma)$ 嵌入的排除：型 $(\gamma)$ 定义为形式垂直线性化但不垂直线性化（`New_version.tex:145`），而形式垂直线性化对度零椭圆嵌入总是成立（`New_version.tex:179`），所以全部工作量落在把形式级数收住，亦即证 (4)。

## 4 柱状模型空间与第一个微分同胚

素材第 3 节（`New_version.tex:285-312`）把模型空间摆出来。设定：$M$ 为复曲面，$D$ 为光滑连通反典范椭圆曲线，$J_M$ 为其复结构，记 $X:=M\setminus D$（`New_version.tex:286-287`）。取 $D$ 上无处为零的全纯 1-形式 $\Omega_D$（`New_version.tex:288`）；存在 $M$ 上的亚纯 2-形式 $\Omega_M$，在 $X$ 上全纯、沿 $D$ 有一阶极点、沿 $D$ 的残数为 $\Omega_D$（同处）。平坦 Kähler 形式写作 $\omega_D=\sqrt{-1}\Omega_D\wedge\bar\Omega_D$（同处），并由 $\Omega_D(v)=1$ 定义 $D$ 上的光滑 $(1,0)$ 向量场 $v$（`New_version.tex:290`）。

$L$ 为 $D$ 的全纯法丛，$J_L$ 是总空间的自然复结构，$\pi:L\to D$ 为投影，$\mathbf 0_L$ 为零截线，$L^\times:=L\setminus\mathbf 0_L$（`New_version.tex:292-296`）。在 $L$ 上取平坦 Hermitian 度量 $h$，$\nabla^L$ 为导出的平坦 Chern 联络，于是有分裂 $T^{1,0}L=H\oplus V^{1,0}L$，$V^{1,0}L\simeq\pi^*L$；因为 $\nabla^L$ 平坦，这分裂特别地是全纯的，$H$ 可等同于 $\pi^*T^{1,0}D$，从而 $v$ 可视为 $L$ 上的平行 $(1,0)$ 向量场（`New_version.tex:298-300`）。记 $\xi$ 为生成自然 $\mathbb C^*$ 作用的欧拉全纯向量场，$\Theta$ 为 $L^\times$ 上满足 $\Theta(\xi)=1$、$\Theta\rvert_H=0$ 的全纯 1-形式；取 $L$ 的局部平行单位标架 $e$ 与其纤维坐标 $w$（$\zeta=w\,e_{\pi(\zeta)}$），则 $\xi=w\,\partial_w$、$\Theta=w^{-1}\mathrm dw$（`New_version.tex:302-303`）。再记 $\vartheta:=\pi^*\Omega_D$，则 $\Omega_0:=\Theta\wedge\vartheta$ 是 $L^\times$ 上自然的全纯 2-形式（`New_version.tex:304-305`）。函数 $z:=-\log\lvert\zeta\rvert_h^2$ 关于 $J_L$ pluriharmonic（`New_version.tex:306-307`），柱状平坦 Kähler 形式与度量取为 $\omega=\pi^*\omega_D+dd^c_{J_L}z^2$ 与 $g=\lvert\vartheta\rvert^2+\mathrm dz^2+(J_L\mathrm dz)^2$，$\nabla$ 是 $g$ 的联络（`New_version.tex:308-309`）；$g$ 等距分裂为 $\mathbb T^3\times\mathbb R$ 上的乘积度量，$z$ 正是 $\mathbb R$ 方向的坐标（`New_version.tex:310`）。管邻域定理把 $M$ 中 $D$ 的邻域微分同胚地搬到 $L$ 中零截线的邻域 $\mathcal N$，并把 $J_M$ 看作 $\mathcal N$ 上的复结构；这等同不唯一，目标是找到一个好的等同使 $z$ 关于 $J_M$ pluriharmonic（`New_version.tex:312`）。

第 4 节（`New_version.tex:315-446`）造第一个微分同胚。记 $\mathcal N_\rho:=\{\zeta\in L:\lvert\zeta\rvert_h\le\rho\}$（`New_version.tex:317`）。命题 4.1（`New_version.tex:320-323`）：可把 $D$ 的邻域光滑等同于某个 $\mathcal N_\rho$，使每个 $p\in D$ 的 $\mathcal N_\rho\cap L_p$ 是 $J_M$-全纯圆盘，并且对所有 $k\ge 0$ 有

$$\lvert\nabla^k(\Omega_M-\Omega_0)\rvert_g=O\big(e^{-\frac12 z}\big).$$

证明分两步。第一步（`New_version.tex:327-377`）先用法指数映射。固定 $D$ 邻域上的光滑 Hermitian 度量 $g_M$，对 $\zeta\in L\simeq T^{1,0}M\rvert_D/T^{1,0}D$，取 $T^{1,0}_{\pi(\zeta)}M$ 中 $T^{1,0}_{\pi(\zeta)}D$ 的正交补里的唯一代表 $V$，定义 $\Xi(\zeta):=\exp_{\pi(\zeta),g_M}(2\,\mathrm{Re}\,V)$（`New_version.tex:327`）。$\mathrm d\Xi$ 在零截线上给出 $TL\rvert_{\mathbf 0_L}\simeq TD\oplus L\to TM\rvert_D$ 的上述等同，故 $\lvert\zeta\rvert_h<\epsilon$ 足够小时 $\Xi:\mathcal N_\epsilon\to U\subset M$ 是到 $D$ 某邻域的微分同胚，限制在 $\mathcal N_\epsilon\cap L^\times$ 上与 $U\setminus D$ 微分同胚；此后经 $\Xi$ 把 $U\setminus D$ 与 $\{z>R_0\}\subset L^\times$ 等同，并省略记号 $\Xi^*$（`New_version.tex:328-329`）。这类指数型微分同胚给出上面那条估计，可见 HSVZ 命题 3.4，也可以像 JZ24 引理 2.6 那样借 $J_M$ 的可积性论证；`New_version.tex:331` 起补齐细节。取 $L$ 的局部平行酉标架 $e$、纤维坐标 $w$、底上使 $\Omega_D=\mathrm dz_0$ 的全纯坐标 $z_0$，再取 $M$ 上全纯坐标 $(Z,W)$ 使 $D=\{W=0\}$、$Z\rvert_D=z_0$、$\partial/\partial W\rvert_D$ 对应 $e$。残数归一化给出 $\Omega_M=(1+Wa(Z,W))\,\frac{\mathrm dW}{W}\wedge\mathrm dZ$，$a$ 全纯（`New_version.tex:334-339`）。$\Xi$ 固定零截线、其微分在该处复线性、在法商上诱导恒等，故在 $(z_0,w)$ 坐标下 $Z\circ\Xi=z_0+b(z_0,\bar z_0)w+O(\lvert w\rvert^2)$、$W\circ\Xi=w+O(\lvert w\rvert^2)$，余项光滑且各阶导数同样（`New_version.tex:340-348`）。记 $r:=\lvert w\rvert$；把 $A=O_{\mathrm{cyl}}(r^\nu)$ 定义为：$A$ 在对数余标架 $\mathrm dz_0,\mathrm d\bar z_0,\Theta=\mathrm dw/w,\bar\Theta=\mathrm d\bar w/\bar w$ 下的系数，以及它们在 $\partial_{z_0},\partial_{\bar z_0},w\partial_w,\bar w\partial_{\bar w}$ 作用下的各阶导数都是 $O(r^\nu)$；在 $(w,\bar w)$ 中按通常阶数 $\nu$ 消失的光滑系数即 $O_{\mathrm{cyl}}(r^\nu)$，由 Taylor 展开直接得到（`New_version.tex:349-361`）。直接代入得 $\Omega_M-\Omega_0=O_{\mathrm{cyl}}(r)$：线性项 $bw$ 的可能贡献正比于 $\Theta\wedge\mathrm dw=0$，其余每项至少多含一个 $w$ 或 $\bar w$ 因子（`New_version.tex:363-370`）。平坦柱状度量的 Levi-Civita 联络在该余标架下系数有界，所以每加一阶协变导数估计不变，逐 $k$ 得 $\lvert\nabla^k(\Omega_M-\Omega_0)\rvert_g=O(r)=O(e^{-z/2})$（`New_version.tex:371-377`）。

第二步（`New_version.tex:381-445`）让纤维全纯化。对 $\mathbf 0_L$ 邻域上的向量场 $Y$ 记 $\Phi_Y(\zeta):=\exp_{\zeta,g_M}(Y_\zeta)$（`New_version.tex:383`）；$Y$ 在 $C^1$ 意义足够小时 $\Phi_Y$ 是局部微分同胚，而要保持上面的体积式估计需要 $Y=O(\lvert\zeta\rvert^2)$ 以及对应的导数界（`New_version.tex:385`）。记 $\Delta_{p,\rho}:=L_p\cap\mathcal N_\rho$，考虑

$$\mathcal F_{p,\rho}(Y):=\frac12\Big(\mathrm d\Phi_Y\rvert_{T\Delta_{p,\rho}}+J_M\circ\mathrm d\Phi_Y\circ J_L\rvert_{T\Delta_{p,\rho}}\Big),$$

它恰在 $\Delta_{p,\rho}$ 对 $\Phi_Y^*J_M$ 全纯时为零（`New_version.tex:387-391`）。为使隐函数定理的表述精确，用 $(T\mathcal N,J_M)$ 上 $g_M$ 的 Chern 联络，记 $I_q:T_q\mathcal N\to E_p$（$q\in\Delta_{p,\rho}$）为径向平行输运，$P_{Y,q}:T_{\Phi_Y(q)}\mathcal N\to T_q\mathcal N$ 为沿 $t\mapsto\exp_q(tY_q)$ 的反向平行输运，在定义中隐式后合成 $I_q\circ P_{Y,q}$；这些复线性等同把算子变成进入固定的 $E_p$-值 $(0,1)$-形式空间的光滑映射（`New_version.tex:392-406`）。

分析工具是归一化 Cauchy 算子 $\mathcal C_\rho:C^{k,\mu}(\overline\Delta_\rho)\to C^{k+1,\mu}(\overline\Delta_\rho)$，$f\mapsto T_\rho f-T_\rho f(0)-\zeta\cdot\partial_\zeta T_\rho f(0)$，其中 $T_\rho f(\zeta):=\frac{\sqrt{-1}}{2\pi}\int_{\Delta_\rho}\frac{f(w)}{\zeta-w}\,\mathrm dw\mathrm d\bar w$；于是 $\partial_{\bar\zeta}\mathcal C_\rho f=f$ 且 $\mathcal C_\rho f(0)=\partial_\zeta\mathcal C_\rho f(0)=0$（`New_version.tex:408-412`）。逐纤维定义为 $\mathcal C_{p,\rho}(f\mathrm d\bar\zeta\otimes\eta):=\mathcal C_\rho(f)\otimes\eta$（`New_version.tex:413-414`）。取 Banach 空间 $\mathfrak B_{p,\rho}:=\{\beta\in C^{k,\mu}(\overline\Delta_{p,\rho};\Lambda^{0,1}T^*\Delta_{p,\rho}\otimes E_p)\mid\beta(0)=0\}$ 与其像 $\mathfrak X_{p,\rho}:=\mathcal C_{p,\rho}(\mathfrak B_{p,\rho})\subset\mathfrak B'_{p,\rho}:=C^{k+1,\mu}(\overline\Delta_{p,\rho};E_p)$，范数由缩放拉回给出 $\lVert\beta\rVert_{k,\mu;p,\rho}:=\lVert\lambda_{p,\rho}^*\beta\rVert_{C^{k,\mu}(\Delta)}$，$\lambda_{p,\rho}:\Delta\to\Delta_{p,\rho}$ 把单位圆盘放大 $\rho$ 倍（`New_version.tex:416-421`）。这样 $\mathcal C_{p,\rho}:\mathfrak B_{p,\rho}\to\mathfrak X_{p,\rho}$ 是同构，并且是 $\overline\partial:\mathfrak X_{p,\rho}\to\mathfrak B_{p,\rho}$ 的右逆（`New_version.tex:422-423`）。$\mathcal F_{p,\rho}$ 是 $\mathfrak X$ 中球到 $\mathfrak B$ 的 $C^1$ 映射，零点处线性化为 $D\mathcal F_{p,\rho}\rvert_0=\overline\partial+K_{p,\rho}$，扰动满足算子范数界 $\lVert K_{p,\rho}\mathcal C_{p,\rho}\rVert\le C\rho$（`New_version.tex:425-429`），故 $D\mathcal F_{p,\rho}(0)\mathcal C_{p,\rho}=I+K_{p,\rho}\mathcal C_{p,\rho}$ 在 $\rho$ 小时可逆，$D\mathcal F_{p,\rho}(0)^{-1}=\mathcal C_{p,\rho}(I+K_{p,\rho}\mathcal C_{p,\rho})^{-1}$（`New_version.tex:430-441`）。再算出 $\lVert\mathcal F_{p,\rho}(0)\rVert_{\mathfrak B}\le C\rho^2$ 与 $\lVert\mathcal C_{p,\rho}(\mathcal F_{p,\rho}(0))\rVert_{\mathfrak B'}\le C\rho^2$（`New_version.tex:443-444`），用标准定量隐函数定理，$\rho>0$ 足够小时存在 $Y_{p,\rho}$ 满足 $\lvert Y_{p,\rho}\rvert=O(\lvert\zeta\rvert^2)$ 使 $\mathcal F_{p,\rho}(Y_{p,\rho})=0$ 在 $\Delta_{p,\rho}$ 上成立，且过程对 $p\in D$ 一致（`New_version.tex:445`）。

两条阶数的分工值得记下来：残量二阶小 $\rho^2$、线性化的非主部一阶小 $C\rho$，于是 $\rho\to0$ 时反演有界、隐函数定理的球半径可以与 $\rho$ 同步取小；这是全篇第一个由几何自带阶数的估计，也是后面不必加算术假设的先声。

## 5 水平微分与关键引理：酉平坦带来的等距

素材第 5 节（`New_version.tex:449` 起）在命题 4.1 给出的等同下工作。称定义在 $L^\times$ 开子集上的复值微分形式 $\eta$ 为水平的，如果 $\iota_\xi\eta=\iota_{\bar\xi}\eta=0$（`New_version.tex:451-452`）。对水平形式 $\eta$ 定义水平外微分

$$d_H\eta:=\mathrm d\eta-\Theta\wedge\mathcal L_\xi\eta-\bar\Theta\wedge\mathcal L_{\bar\xi}\eta$$

（`New_version.tex:454-458`）。当 $m\ge 1$ 时，$\Omega^q(D,L^{-m})$（$q\ge 0$）中的元素可按纤维次数 $m$ 齐次地提升为 $L^\times$ 上的水平形式（`New_version.tex:459`）。引理 5.1（`New_version.tex:460-469`）说：若 $\widehat\sigma$ 是 $\sigma\in\Omega^q(D,L^{-m})$ 的纤维齐次水平提升，则 $d_H\widehat\sigma=\widehat{\mathrm d_{\nabla_{L^{-m}}}\sigma}$，即水平外微分正好是 $L^{-m}$ 上平坦联络诱导的微分。证明（`New_version.tex:471-499`）在局部平行酉标架 $e$ 下写 $\sigma=\sigma_0\otimes e^{-m}$，其齐次提升为 $\widehat\sigma(p,w)=w^m\sigma_0(p)$；由 $\Theta=\mathrm dw/w$ 有 $\mathrm d(w^m)=m\,w^m\Theta$，故 $\mathcal L_\xi\widehat\sigma=m\widehat\sigma$、$\mathcal L_{\bar\xi}\widehat\sigma=0$；$L^{-m}$ 上的诱导平坦联络在标架 $e^{-m}$ 下平凡，所以 $\sigma_0$ 的通常导数就是 $\mathrm d_{\nabla_{L^{-m}}}\sigma$ 的系数，于是 $\mathrm d\widehat\sigma=m\Theta\wedge\widehat\sigma+\widehat{\mathrm d_{\nabla_{L^{-m}}}\sigma}$，$d_H$ 的定义恰好减掉首项、$\bar\Theta$ 项为零。

由命题 4.1 中每条纤维对 $J_M$ 全纯，得 $\iota_{\bar\xi}\Omega_M=0$（`New_version.tex:501-502`）。定义

$$\alpha:=\iota_\xi\Omega_M,\qquad \beta:=\Omega_M-\Theta\wedge\alpha,$$

两者都是水平形式（`New_version.tex:503-505`）。因 $\mathrm d\Omega_M=0$ 与 $\mathrm d\Theta=0$，有 $\mathcal L_{\bar\xi}\Omega_M=0$，并且得到一组闭性恒等式

$$\mathcal L_{\bar\xi}\alpha=\mathcal L_{\bar\xi}\beta=0,\qquad d_H\beta=0,\qquad \mathcal L_\xi\beta=d_H\alpha$$

（`New_version.tex:506-512`）。判据在 `New_version.tex:513`：函数 $z=-\log\lvert\zeta\rvert_h^2$ 是 $J_M$-pluriharmonic，当且仅当 $\Theta$ 关于 $J_M$ 是 $(1,0)$ 型，而后者正好等价于 $\Theta\wedge\Omega_M=0$，等价于 $\beta=0$。于是目标被改写为：找一个纤维保持、在每条纤维上全纯、并且消灭水平分量 $\beta$ 的微分同胚。对 $T$ 足够大令 $\mathcal U_T:=\{\zeta\in L^\times:z(\zeta)\ge T\}$（`New_version.tex:515-520`）；对 $\mathcal U_T$ 上关于柱状度量 $g$ 在 $C^1$ 中足够小的复值函数 $f$，定义

$$\Phi_f:\mathcal U_T\to\mathcal U_{T-1},\qquad \Phi_f(\zeta):=e^{f(\zeta)}\zeta.$$

因为 $z\circ\Phi_f=z-2\operatorname{Re}f$，只要 $\lVert\operatorname{Re}f\rVert_{L^\infty}<\frac12$ 就有 $\Phi_f(\mathcal U_T)\subset\mathcal U_{T-1}$（`New_version.tex:522-533`）；又有 $(\Phi_f)_*\bar\xi=(\mathcal L_{\bar\xi}f)\xi+(1+\mathcal L_{\bar\xi}\bar f)\bar\xi$（`New_version.tex:534-539`），所以 $f$ 在每条纤维上全纯时 $\Phi_f$ 保持每条纤维关于 $\Omega_M$ 的全纯性。这三条式子就是整个构造的代数骨架：变量是纤维全纯的 $f$，算的是 $\beta$。

第 5.1 小节（`New_version.tex:544-585`）是全文分析核心。设 $\mathbb L$ 为 $D$ 上带平坦 Hermitian 度量的任意全纯线丛，Chern 联络分解为 $\nabla_{\mathbb L}=\partial_{\mathbb L}+\overline\partial_{\mathbb L}$（`New_version.tex:545-546`），Dolbeault Laplacian 为 $\Delta_{\mathbb L}:=\overline\partial_{\mathbb L}\overline\partial_{\mathbb L}^*+\overline\partial_{\mathbb L}^*\overline\partial_{\mathbb L}$（`New_version.tex:547-548`），Sobolev 范数按 $\lVert s\rVert_{H^k}^2=\int_D\sum_{j=0}^k\lvert\nabla_{\mathbb L}^js\rvert^2\omega_D$ 定义（`New_version.tex:549-550`），调和空间记 $\mathcal H^{0,q}_{\mathbb L}:=\ker(\Delta_{\mathbb L}\rvert_{\Omega^{0,q}(D,\mathbb L)})$，$\Pi^{0,q}_{\mathbb L}$ 是 $L^2$ 到其上的正交投影（`New_version.tex:551-553`）。引理 5.2（`New_version.tex:554-563`）：对每个 $u\in\Omega^{0,1}(D,\mathbb L)$，存在唯一满足 $\overline\partial_{\mathbb L}f=\iota_v\partial_{\mathbb L}u$ 且 $f$ 在 $L^2$ 意义垂直于 $\mathcal H^{0,0}_{\mathbb L}$ 的 $f\in\Omega^0(D,\mathbb L)$；进一步对每个 $k\ge 0$ 有

$$\lVert f\rVert_{H^k}=\lVert(I-\Pi^{0,1}_{\mathbb L})u\rVert_{H^k}\le\lVert u\rVert_{H^k}.$$

证明链条（`New_version.tex:565-585`）把 $\iota_v$ 与 $\partial_{\mathbb L}$ 合成 $P:=\iota_v\partial_{\mathbb L}:\Omega^{0,q}(D,\mathbb L)\to\Omega^{0,q}(D,\mathbb L)$；由于 $v$ 平行、单位长且 $\mathbb L$ 平坦，$P=\nabla_v$、$P^*=-\nabla_{\bar v}$，并且 $\Delta_{\mathbb L}=P^*P=PP^*$（`New_version.tex:566-567`）。设 $G_q$ 为 $\Delta_{\mathbb L}$ 在 $(\mathcal H^{0,q}_{\mathbb L})^\perp$ 上的逆、在 $\mathcal H^{0,q}_{\mathbb L}$ 上零延拓，则 $\Delta_{\mathbb L}G_q=G_q\Delta_{\mathbb L}=I-\Pi^{0,q}_{\mathbb L}$（`New_version.tex:569-574`）；$P,P^*$ 与 $\Delta_{\mathbb L}$ 交换故与 $G_q$ 交换。取 $f:=\overline\partial_{\mathbb L}^*G_1Pu\in\operatorname{Im}(\overline\partial_{\mathbb L}^*)\subset(\mathcal H^{0,0}_{\mathbb L})^\perp$，由 $Pu\in(\mathcal H^{0,1}_{\mathbb L})^\perp$ 得 $\overline\partial_{\mathbb L}f=\overline\partial_{\mathbb L}\overline\partial_{\mathbb L}^*G_1Pu=(I-\Pi^{0,1}_{\mathbb L})Pu=Pu$（`New_version.tex:575-579`），唯一性由 $f\perp\mathcal H^{0,0}_{\mathbb L}$ 的规范化给出（`New_version.tex:580`）。$L^2$ 等式逐字算出：$\lVert f\rVert_{L^2}^2=\langle\overline\partial_{\mathbb L}\overline\partial_{\mathbb L}^*G_1Pu,G_1Pu\rangle=\langle Pu,G_1Pu\rangle=\langle u,(I-\Pi^{0,1}_{\mathbb L})u\rangle=\lVert(I-\Pi^{0,1}_{\mathbb L})u\rVert_{L^2}^2$（`New_version.tex:582-583`）。最后，因为底度量与 $\mathbb L$ 的联络都平坦，沿全局平行标准正交标架的协变微分与 $P$、$\overline\partial_{\mathbb L}^*$、$G_1$ 交换，由此得到各阶 $k$ 的等距（`New_version.tex:584`）。

这条引理的份量：解 $\overline\partial_{\mathbb L}f=\iota_v\partial_{\mathbb L}u$ 的算子是 $H^k$ 上的等距（去掉调和分量后），常数 $1$，与 $\mathbb L$ 无关。第 6 节会对 $\mathbb L=L^{-m}$ 逐 $m$ 用它，而 $m\to\infty$ 时 $L^{-m}$ 可以任意快逼近平凡丛；通常这会带来小除子，此处因为常数是 $1$ 而完全不受影响。

## 6 加权空间与命题 5.4：把线性化做成有界右逆

第 5.2 小节（`New_version.tex:590-767`）先把函数空间定死。对 $T\gg1$ 仍记 $\mathcal U_T:=\{\zeta\in L^\times:z\ge T\}$（`New_version.tex:591`）；指数加权 Sobolev 权重按柱状尾的左端点归一，参照 Lockhart-McOwen 的做法（`New_version.tex:591`）。定义 5.3（`New_version.tex:592-599`）：对 $0<\delta<\frac12$、整数 $\ell\ge0$、$\mathcal U_T$ 上的张量 $\sigma$，令

$$\lVert\sigma\rVert_{\ell,\delta,T}:=\Big(\sum_{j=0}^{\ell}\int_{\mathcal U_T}e^{2\delta(z-T)}\lvert\nabla^j\sigma\rvert_g^2\,\mathrm d\mu_g\Big)^{1/2},$$

$H^\ell_\delta(\mathcal U_T)$ 是使该范数有限的 $H^\ell_{\mathrm{loc}}$ 截面。$\ell\ge1$ 时记 $\mathcal H^{\ell}_{\delta,T}:=\{f\in H^\ell_\delta(\mathcal U_T;\mathbb C)\mid\mathcal L_{\bar\xi}f=0\}$ 为纤维全纯函数的闭子空间，$\mathcal D^{\ell}_{\delta,T}:=\{\gamma\in H^\ell_\delta(\mathcal U_T;\Lambda^2T^*\mathcal U_T\otimes\mathbb C)\mid \mathrm d\gamma=0,\ \iota_{\bar\xi}\gamma=0\}$（`New_version.tex:600-608`）。注意 $\delta<\frac12$ 是硬约束：命题 4.1 给的误差衰减率是 $e^{-z/2}$，加权只能取到严格小于 $\frac12$ 的指数。

命题 5.4（`New_version.tex:611-617`）：存在 $T_0>0$ 与有界线性算子（$T\ge T_0$、$\ell\ge1$、$\delta\in(0,\frac12)$）

$$\mathcal Q_T:\mathcal D^{\ell}_{\delta,T}\to\mathcal H^{\ell+1}_{\delta,T},$$

满足 $\mathrm d_H(\mathcal Q_T(\gamma)\vartheta)=\gamma-\Theta\wedge\iota_\xi\gamma$，以及 $\lVert\mathcal Q_T(\gamma)\rVert_{\ell+1,\delta,T}\le C(\ell,\delta)\lVert\gamma\rVert_{\ell,\delta,T}$；进一步对每个 $f\in\mathcal H^{\ell+1}_{\delta,T}$ 有 $\mathcal Q_T(\mathrm df\wedge\vartheta)=f$。

`New_version.tex:620-635` 用一个交换图解释这条命题的意思：$f\mapsto \mathrm d(f\vartheta)$ 把 $\mathcal H^{\ell+1}_{\delta,T}$ 映到 $\mathcal D^\ell_{\delta,T}$，$f\mapsto\mathrm d_H(f\vartheta)$ 映到 $\mathcal U_T$ 上 2-形式的加权 Sobolev 空间，而 $\mathcal Q_T$ 是横向箭头 $f\mapsto\mathrm d(f\vartheta)$ 的有界左逆，并且与另两条映射相容（图在 `New_version.tex:622-632`，此处按文字读）。要紧的一点是：横向箭头 $f\mapsto\Phi_f^*\Omega_0-\Omega_0$ 恰是非线性算子 $f\mapsto\Phi_f^*\Omega_M-\Omega_0$ 的自然线性近似（`New_version.tex:635-639`），因此可对泛函 $f\mapsto\mathcal Q_T(\Phi_f^*\Omega_M-\Omega_0)$ 用隐函数定理找零点；交换性保证 $\Phi_f^*\Omega_M-\Omega_0$ 的水平部分随之消失（`New_version.tex:640-649`）。

证明（`New_version.tex:650-767`）按Fourier 分次展开来做。写 $\gamma=\Theta\wedge\alpha+\beta$，$\alpha:=\iota_\xi\gamma$；由 $\iota_{\bar\xi}\gamma=0$ 与 $\mathrm d\gamma=0$ 得 $\mathcal L_{\bar\xi}\gamma=0$，特别 $\mathcal L_{\bar\xi}\alpha=\mathcal L_{\bar\xi}\beta=0$（`New_version.tex:651-652`）。先对有限多个 Fourier 模式构造：$\alpha=\sum_{m\ge1}\alpha_m$、$\beta=\sum_{m\ge1}\beta_m$，其中 $\alpha_m,\beta_m$ 在纤维方向上次数为 $m$ 齐次；不同 $m$ 的齐次块在加权 Sobolev 范数下正交；只出现 $m\ge1$ 是因为 $\gamma$ 范数有限（`New_version.tex:653-657`）。由 $\mathcal L_\xi\beta=d_H\alpha$ 得

$$m\beta_m=d_H\alpha_m\,.$$（`New_version.tex:659-661`）

把水平 1-形式分解为 $\alpha_m=-u_m\vartheta+v_m$，$u_m\in\Omega^0(D,L^{-m})$、$v_m\in\Omega^{0,1}(D,L^{-m})$，这里用的就是 $\Omega^p(D,L^{-m})$ 与其纤维齐次水平提升之间的等同（`New_version.tex:662-663`）。在该等同下用引理 5.1，上式化为

$$m\beta_m=\mathrm d_{\nabla_{L^{-m}}}\alpha_m=\vartheta\wedge\overline\partial_{L^{-m}}u_m+\partial_{L^{-m}}v_m$$

（`New_version.tex:664-669`）。对 $L^{-m}$ 用引理 5.2，得唯一 $w_m\perp\mathcal H^{0,0}_{L^{-m}}$ 使 $\overline\partial_{L^{-m}}w_m=\iota_v\partial_{L^{-m}}v_m$，并且 $\lVert w_m\rVert_{H^\ell}=\lVert(I-\Pi^{0,1}_{L^{-m}})v_m\rVert_{H^\ell}$（`New_version.tex:670-671`）。定义

$$f_m:=-\frac1m(u_m+w_m),\qquad f:=\sum_{m\ge1}f_m.$$

因为在 $D$ 上 $\partial_{L^{-m}}v_m=\vartheta\wedge\iota_v\partial_{L^{-m}}v_m$，逐块算出 $\mathrm d_H(f_m\vartheta)=-\vartheta\wedge\overline\partial_{L^{-m}}f_m=\frac1m\vartheta\wedge(\overline\partial_{L^{-m}}u_m+\overline\partial_{L^{-m}}w_m)=\beta_m$（`New_version.tex:675-684`），于是 $\mathrm d_H(f\vartheta)=\beta$；定义 $\mathcal Q_T(\gamma):=f$ 便得 $\mathrm d_H(\mathcal Q_T(\gamma)\vartheta)=\beta=\gamma-\Theta\wedge\iota_\xi\gamma$（`New_version.tex:685-689`）。

估计分三处。竖直方向：$\lVert\mathcal L_\xi f_m\rVert_{H^\ell}=\lVert mf_m\rVert_{H^\ell}\le C\lVert\alpha_m\rVert_{H^\ell}$，且 $\mathcal L_{\bar\xi}f_m=0$（`New_version.tex:691-694`）。纯水平方向：由 $\lVert\overline\partial_{L^{-m}}f_m\rVert_{H^\ell}=\lVert\iota_v\beta_m\rVert_{H^\ell}\le\lVert\beta_m\rVert_{H^\ell}$，加上 $L^{-m}$ 平坦与 Kähler 恒等式得 $\lVert\partial_{L^{-m}}f_m\rVert_{H^\ell}=\lVert\overline\partial_{L^{-m}}f_m\rVert_{H^\ell}\le\lVert\beta_m\rVert_{H^\ell}$，于是

$$\lVert\nabla_{L^{-m}}^{\ell+1}f_m\rVert_{L^2}\le C_\ell\lVert\nabla_{L^{-m}}^{\ell}\beta_m\rVert_{L^2}\,,$$（`New_version.tex:695-702`）

这条控制 $f$ 的 $\ell+1$ 阶纯水平导数。含竖直方向的导数：对次数 $m$ 的齐次函数，每个竖直导数贡献因子 $m$，每个水平导数变成 $L^{-m}$ 上的 Chern 协变导数，故

$$\sum_{q=0}^j\lvert\nabla^q f_m\rvert_g^2\le C_je^{-mz}\sum_{r+s\le j}m^{2r}\lvert\nabla_{L^{-m}}^sf_m\rvert^2\,,$$（`New_version.tex:705-709`）

比较常数只依赖 $j$ 与固定的模型几何，与 $m$、$T$ 无关（`New_version.tex:710-711`）。把三处估计合并、乘 $e^{2\delta(z-T)}$、在 $\mathcal U_T$ 上积分、再用齐次块的正交性对 $m$ 求和，得 $\lVert f\rVert_{\ell+1,\delta,T}\le C_{\ell,\delta}\lVert\gamma\rVert_{\ell,\delta,T}$（`New_version.tex:712-716`）。

一般的 $\gamma\in\mathcal D^\ell_{\delta,T}$ 的纤维 Fourier 分解按分布意义成立；纤维旋转保持柱状度量、其联络与权重，故 Fourier 部分和在 $H^\ell_\delta(\mathcal U_T)$ 中收敛并保持 $\mathcal D^\ell_{\delta,T}$ 的定义方程（`New_version.tex:718-723`）。每个齐次模式的系数是 $D$ 上的 Sobolev 截面，可用平坦 Hodge Laplacian 的热算子磨光，热算子与 $\mathrm d_{\nabla_{L^{-m}}}$ 交换因而保持 $m\beta_m=d_H\alpha_m$，于是逐块构造与估计通过取极限对 Sobolev 系数成立（`New_version.tex:725-731`）。记 $\gamma^{(N)}:=\sum_{m=1}^N\gamma_m$、$f^{(N)}:=\sum_{m=1}^Nf_m$，估计与正交性给出 $N'>N$ 时

$$\lVert f^{(N')}-f^{(N)}\rVert_{\ell+1,\delta,T}^2\le C_{\ell,\delta}^2\sum_{m=N+1}^{N'}\lVert\gamma_m\rVert_{\ell,\delta,T}^2,$$

故 $f^{(N)}$ 在 $\mathcal H^{\ell+1}_{\delta,T}$ 中收敛到极限 $f$，定义式按分布取极限成立，同一估计说明 $\mathcal Q_T(\gamma):=f$ 是有界线性算子（`New_version.tex:733-749`）。最后验证左逆：取 $h=\sum_{m\ge1}h_m\in\mathcal H^{\ell+1}_{\delta,T}$，令 $\gamma=\mathrm dh\wedge\vartheta$；由 $\iota_\xi\vartheta=0$ 其水平 1-形式分量为 $\alpha=\iota_\xi(\mathrm dh\wedge\vartheta)=(\mathcal L_\xi h)\vartheta$，故 $\alpha_m=mh_m\vartheta$，于是分解中 $u_m=-mh_m$、$v_m=0$；引理 5.2 的规范化给出 $w_m=0$，构造返回 $f_m=h_m$，从而 $\mathcal Q_T(\mathrm dh\wedge\vartheta)=h$（`New_version.tex:751-766`）。

$1/m$ 与 $m$ 在这里正好相互抵消：$\beta_m$ 由 $m\beta_m=d_H\alpha_m$ 给出，$f_m$ 前面带 $-\frac1m$，而竖直导数每次乘 $m$，所以 $\ell$ 阶损失一次导数的结论与 $m$ 无关；小除子本该出现的地方被 $e^{-mz}$ 与权 $e^{2\delta(z-T)}$ 吸收，这是整篇最吃紧的一处算术。

## 7 非线性不动点、定理 5.6 与定理 1.1 的收口

第 5.3 小节（`New_version.tex:775-861`）把命题 5.4 装进隐函数定理。固定 $k\ge4$（`New_version.tex:778`），记

$$\eta:=\Omega_M-\Omega_0.$$

由命题 4.1，$\mathrm d\eta=0$、$\iota_{\bar\xi}\eta=0$，并且对每个 $j\ge0$ 有 $\lvert\nabla^j\eta\rvert_g=O(e^{-z/2})$（`New_version.tex:782-783`）。对 $T\ge T_0+1$ 定义误差量

$$\varepsilon_T:=\lVert\eta\rVert_{k+2,\delta,T-1}+\sum_{j=0}^{k+2}\sup_{\mathcal U_{T-1}}\lvert\nabla^j\eta\rvert_g$$

（`New_version.tex:785-789`）。衰减率 $e^{-z/2}$ 与 $\delta<\frac12$ 合起来给 $\varepsilon_T=O(e^{-(\frac12-\delta)T})$，特别 $\varepsilon_T\to0$（`New_version.tex:790-793`）；这里可以看到加权指数必须严格小于 $\frac12$ 的原因，$\frac12-\delta$ 就是收敛速率。

命题 5.5（`New_version.tex:794-803`）：存在 $\epsilon>0$ 使映射

$$\Psi_T:B_\epsilon(0)\subset\mathcal H^{k+1}_{\delta,T}\to\mathcal H^{k+1}_{\delta,T},\qquad f\mapsto\mathcal Q_T(\Phi_f^*\Omega_M-\Omega_0)$$

是定义良好的实 Banach 空间之间的 $C^1$ 映射；并且 $T$ 足够大时原点附近存在唯一 $f_T$ 使 $\Psi_T(f_T)=0$，满足 $\lVert f_T\rVert_{k+1,\delta,T}\le2C\varepsilon_T$。

证明（`New_version.tex:807-861`）的四步值得抄清。第一步定义性：$k\ge4$ 使加权 Sobolev 嵌入保证 $\mathcal H^{k+1}_{\delta,T}$ 中足够小的球在 $C^1$ 上一致小，故 $\Phi_f$ 是到像上的 $C^2$ 微分同胚并把 $\mathcal U_T$ 映入 $\mathcal U_{T-1}$；由 $\mathcal L_{\bar\xi}f=0$ 它在每条纤维上全纯，于是 $\Phi_f^*\Omega_M-\Omega_0\in\mathcal D^k_{\delta,T}$（`New_version.tex:808-815`）。第二步把线性部分抽出来：$\Phi_f^*\Omega_0-\Omega_0=\mathrm df\wedge\vartheta$，由命题 5.4 有 $\mathcal Q_T(\Phi_f^*\Omega_0-\Omega_0)=\mathcal Q_T(\mathrm df\wedge\vartheta)=f$，因此

$$\Psi_T(f)=f+\mathcal E_T(f),\qquad \mathcal E_T(f):=\mathcal Q_T(\Phi_f^*\eta)$$

（`New_version.tex:817-826`）。第三步是三条一致估计：固定与 $T$ 无关的足够小 $r_0$，对 $f,g\in B_{r_0}(0)$ 沿路径 $f_s=g+s(f-g)$，拉回对参数的导数是 $\eta$ 沿一个竖直向量场的 Lie 导数的拉回，该向量场的系数关于 $f-g$ 与其共轭线性，Lie 导数至多含 $f-g$ 的一阶导数；配合平坦柱状上一致的加权乘法与复合估计、Sobolev 嵌入以及 $\eta$ 的估计，得到

$$\lVert\Phi_f^*\eta\rVert_{k,\delta,T}\le C\varepsilon_T,\quad \lVert\Phi_f^*\eta-\Phi_g^*\eta\rVert_{k,\delta,T}\le C\varepsilon_T\lVert f-g\rVert_{k+1,\delta,T},\quad \lVert D(\Phi_\bullet^*\eta)_f[h]\rVert_{k,\delta,T}\le C\varepsilon_T\lVert h\rVert_{k+1,\delta,T},$$

常数与 $T$ 无关（`New_version.tex:827-839`）。第四步闭合：套命题 5.4 得 $\lVert\mathcal E_T(f)\rVert_{k+1,\delta,T}\le C\varepsilon_T$ 与 $\lVert\mathcal E_T(f)-\mathcal E_T(g)\rVert_{k+1,\delta,T}\le C\varepsilon_T\lVert f-g\rVert_{k+1,\delta,T}$；取 $T$ 大到 $C\varepsilon_T\le\frac12$ 且 $2C\varepsilon_T$ 小于 $r_0$（`New_version.tex:848-860`），于是 $f\mapsto-\mathcal E_T(f)$ 是闭球 $\overline B_{2C\varepsilon_T}(0)\subset\mathcal H^{k+1}_{\delta,T}$ 到自身的压缩，Banach 不动点定理给出唯一不动点 $f_T$，即 $\Psi_T(f_T)=0$ 且 $\lVert f_T\rVert_{k+1,\delta,T}\le2C\varepsilon_T$。压缩性完全来自 $\varepsilon_T\to0$：把邻域等同的尾端推远 $T$，误差自动变小，这是不用算术假设也能收住的另一个体现。

定理 5.6（`New_version.tex:862-892`）是结论本体。固定使命题 5.5 成立的 $T$，写

$$\Phi_{f_T}^*\Omega_M=\Theta\wedge\alpha_T+\beta_T,$$

$\beta_T$ 水平。断言：$\beta_T=0$，从而 $z=-\log\lvert\zeta\rvert_h^2$ 关于 $\Phi_{f_T}^*(J_M)$ pluriharmonic（`New_version.tex:869-871`）。证明（`New_version.tex:872-892`）：命题 5.4 与命题 5.5 给

$$0=\mathrm d_H\big(\mathcal Q_T(\Phi_{f_T}^*\Omega_M-\Omega_0)\vartheta\big)=\Phi_{f_T}^*\Omega_M-\Omega_0-\Theta\wedge\iota_\xi(\Phi_{f_T}^*\Omega_M-\Omega_0),$$

而 $\Omega_0$ 无水平分量，故 $\beta_T=\Phi_{f_T}^*\Omega_M-\Theta\wedge\iota_\xi\Phi_{f_T}^*\Omega_M=0$（`New_version.tex:873-883`）。由于 $\Phi_{f_T}^*\Omega_M$ 关于 $\Phi_{f_T}^*J_M$ 是无处为零的 $(2,0)$-形式，恒等式 $\Theta\wedge\Phi_{f_T}^*\Omega_M=0$ 说明 $\Theta$ 对该复结构是 $(1,0)$ 型；配上 $\mathrm dz=-(\Theta+\bar\Theta)$ 与 $\mathrm d\Theta=0$ 即得 pluriharmonicity（`New_version.tex:884-891`）。

第 7.1 小节（`New_version.tex:896-945`）把模型空间的成果换回曲面，完成定理 1.1。记命题 4.1 造的等同为 $\Upsilon$，令 $A:=\Upsilon\circ\Phi_{f_T}$（`New_version.tex:897-902`）；$f_T$ 一致有界，故 $\Phi_{f_T}$ 的像包含一个更小的 punctured 圆盘丛，缩小 $D$ 的邻域 $U$ 后 $r:=z\circ A^{-1}$ 在 $U\setminus D$ 上有定义（`New_version.tex:903-909`）。$k\ge4$ 给 Sobolev 嵌入 $A\in C^2$（尾内部），故 $r\in C^2(U\setminus D)$，而定理 5.6 说 $\partial_{J_M}\overline\partial_{J_M}r=0$（`New_version.tex:911-915`）；对局部光滑 Hermitian 度量取迹并用椭圆正则性，$r$ 光滑（`New_version.tex:916-917`）。局部平行纤维坐标 $w$ 下第一个等同满足 $w_M\circ\Upsilon(p,w)=c(p)w+O(\lvert w\rvert^2)$、$c(p)\ne0$（对 $D$ 的每个局部全纯定义函数 $w_M$），又 $\lvert e^{f_T}\rvert$ 上下有界，故存在 $C>0$ 使 $C^{-1}\lvert w\rvert\le\lvert w_M\circ A(p,w)\rvert\le C\lvert w\rvert$（`New_version.tex:919-929`）。于是 $r$ 在 $D$ 的去心邻域上关于 $J_M$ pluriharmonic 且 $r+\log\lvert w_M\rvert^2$ 近 $D$ 局部有界，从而跨越 $D$ 延拓为 pluriharmonic 函数；由 Poincaré-Lelong 公式，$F:=-r$（在 $D$ 上取值 $-\infty$ 延拓）是 $M$ 中某邻域 $U$ 上的 plurisubharmonic 函数，与 $\log\lvert w_M\rvert^2$ 同阶并满足 $dd^cF=[D]$（`New_version.tex:930-934`）。这正是命题 2.1 的第 (2) 条，由 (2)$\Rightarrow$(3) 得 $\mathcal O_M(D)\lvert_U$ 酉平坦，定理 1.1 的第一结论成立（同处）。

第二结论（整体半正度量）按 Brunella p.442 的初等论证（`New_version.tex:936-945`）：$F$ 加常数后可设 $\{F=1\}\subset U$ 非空，并用 $\{F<1\}$ 替换 $U$；取光滑凹函数 $\varphi:\mathbb R\to\mathbb R$，在 $t\ge0$ 上 $\varphi(t)=0$，在 $t\le-1$ 上 $\varphi(t)=t+c$，令 $\widetilde F$ 在 $U$ 上为 $\varphi\circ F$、在 $U$ 外恒为零，则 $\widetilde F$ 光滑、在 $U\setminus D$ 上 plurisuperharmonic，且在 $D$ 附近仍有 $dd^c\widetilde F=[D]$。取 $D$ 的定义截面 $s_D$，在 $X$ 上令 $\lvert s_D\rvert_h^2:=e^{\widetilde F}$，它立刻给出线丛在整个 $M$ 上的光滑 Hermitian 度量且曲率半正。曲率符号的方向要盯住：$\log\lvert s\rvert_h^2$ 的 $-\mathrm{dd}^c$ 是曲率，$\widetilde F$ 的 plurisuperharmonicity 正是曲率半正。

## 8 分类定理的证明、非 Kähler 情形与两条应用

第 7.2 小节（`New_version.tex:948-1307`）证定理 1.3。策略在 `New_version.tex:949`：关键是分类反典范半正的有理曲面；$K_X^{-1}$ 半正蕴含 nef，若还 big 则由 Kawamata 基点自由定理半 ample，所以剩下的难点是 $X$ 有理、$K_X^{-1}$ nef 且 $K_X^2=0$。按 Sakai 的说法，光滑射影有理曲面 $X$ 称为广义 Halphen 曲面，若它容许一个规范型的有效反典范除子 $D=\sum_i m_iD_i\in\lvert K_X^{-1}\rvert$（$m_i>0$），即 $D\cdot D_i=0$ 对每个不可约分量成立（`New_version.tex:951-960`）；椭圆型、乘性型、加性型的术语沿用 Sakai 的分类表（`New_version.tex:961-962`）；指标为 $m$ 的 Halphen 曲面指 $\lvert-mK_X\rvert$ 非空而 $m$ 是使之为非空的最小正整数（`New_version.tex:963`）。

命题 7.1（`New_version.tex:967-977`）：光滑射影有理曲面 $X$ 的下列两条等价，(i) $K_X^{-1}$ nef 且 $K_X^2=0$；(ii) $X$ 是广义 Halphen 曲面；成立时 $\lvert K_X^{-1}\rvert\ne\varnothing$ 且每个有效反典范除子都是规范型。证明（`New_version.tex:979-988`）两条都短：规范型给出 $D^2=\sum_im_i(D\cdot D_i)=0$，且与自身各分量交为零、与任何其他不可约曲线交非负，故 nef；反向用有理曲面上的 Riemann-Roch 与 Serre 对偶得 $h^0(X,K_X^{-1})\ge1$，任取 $D\in\lvert K_X^{-1}\rvert$，各 $D\cdot D_i$ 非负而加权和 $D^2=0$，故全为零。

命题 7.2（`New_version.tex:991-1019`）是分支判定：$X$ 为广义 Halphen 曲面，取定规范型反典范除子 $D$，则 $K_X^{-1}=\mathcal O_X(D)$ 是数值维数为一的 nef 丛，并且：椭圆型下 $D$ 是光滑椭圆曲线，$K_X^{-1}$ 总半正，恰当 $N_D$ 挠时半 ample；乘性型下 $D$ 是约化有理曲线圈、$\operatorname{Pic}^0(D)\simeq\mathbb C^*$，$K_X^{-1}$ 半正当且仅当 $\lvert q_D\rvert=1$，恰当 $q_D$ 是单位根时半 ample；加性型下三条等价：半正、半 ample、$X$ 是指标一的 Halphen 曲面（$\lvert K_X^{-1}\rvert$ 为无基点亏格一流）。

证明（`New_version.tex:1021-1244`）的入口是 Koike 的判据：由 $D$ 规范型知 $D$ nef、$D^2=0$、$\operatorname{nd}(\mathcal O_X(D))=1$，故 Koike 定理 1.1 给出

$$\mathcal O_X(D)\text{ Hermitian 半正}\quad\Longleftrightarrow\quad\mathcal O_X(D)\lvert_V\text{ 酉平坦，对某邻域 }V\supset D$$

（`New_version.tex:1023-1031`）。随后是一段短正合列论证，对光滑椭圆曲线或有理圈给出半 ample $\Leftrightarrow$ $N_D$ 挠（`New_version.tex:1033-1068`）：设 $N_D:=\mathcal O_D(D)$ 恰 $m$ 阶挠，对偶给出 $1\le k<m$ 时 $H^0(D,N_D^k)=H^1(D,N_D^k)=0$，由正合列

$$0\to\mathcal O_X((k-1)D)\to\mathcal O_X(kD)\to N_D^k\to0$$

与 $H^1(X,\mathcal O_X)=0$ 归纳得 $0\le k<m$ 时 $h^0(X,kD)=1$、$H^1(X,kD)=0$；$k=m$ 时 $N_D^m\simeq\mathcal O_D$ 的常截面与 $s_D^m$ 一起生成 $\mathcal O_X(mD)$，故 $\lvert mD\rvert$ 无基点且更小倍数不动（`New_version.tex:1034-1045`）。反向对可能非约化的规范型连通除子：若 $\mathcal O_X(D)$ 半 ample，某 $n>0$ 使 $N_D^n=\mathcal O_D(nD)$ 全局生成，定出 $\varphi:D\to\mathbb P^r$；由 $\deg(N_D^n\rvert_{D_i})=nD\cdot D_i=0$，$\varphi$ 在 $D_{\mathrm{red}}$ 每个分量上常数，连通性给 $\varphi(D_{\mathrm{red}})$ 是单点，取不在该点消失的齐次线性形式拉回，得 $N_D^n$ 的在 $D_{\mathrm{red}}$ 上无处为零的截面，由 Nakayama 引理它在 $D$ 每点生成（含非约化处），故 $N_D^n\simeq\mathcal O_D$（`New_version.tex:1046-1068`）。

椭圆型直接套定理 1.1 与上面的论证（`New_version.tex:1070-1072`）。乘性型的必要性由判据给出，充分性走 Koike 定理 3.1 的移动吹升构型（`New_version.tex:1075-1220`）：$X$ 不极小，取 $(-1)$-曲线 $E$，则 $D\cdot E=-K_X\cdot E=1$，$E$ 不是 $D$ 的分量，$D$ 为约化 nodal 圈故总交数为一迫使 $E$ 在 $D$ 的一个光滑点处横交一次（`New_version.tex:1082-1090`）。令 $\rho:X\to Z$ 缩掉 $E$，$p:=\rho(E)$，$D_Z:=\rho(D)$，则 $D$ 是 $D_Z$ 的严格变换、$D_Z$ 在 $p$ 处光滑、$\rho\rvert_D:D\to D_Z$ 是同构，并且 $K_X=\rho^*K_Z+E$、$\rho^*D_Z=D+E$，故 $D_Z\in\lvert K_Z^{-1}\rvert$（`New_version.tex:1091-1095`）。记与 $E$ 相交的分量为 $D_1$，$C_i:=\rho(D_i)$，则 $\rho^*C_1=D_1+E$、$\rho^*C_i=D_i$（$i\ne1$），由 $D\cdot D_i=0$ 得 $D_Z\cdot C_1=1$、$D_Z\cdot C_i=0$（$i\ne1$），于是 $L:=N_{D_Z/Z}$ 的多重次数为 $(1,0,\ldots,0)$；把 $\rho^*D_Z=D+E$ 限制到 $D$ 上又给 $N_D\simeq L\otimes\mathcal O_{D_Z}(-p)$（`New_version.tex:1096-1110`）。令 $\Sigma:=C_1\setminus\operatorname{Sing}(D_Z)$；由多重次数得 $h^0(D_Z,L)=1$，非零截面有唯一单零点 $a\in\Sigma$；在 $C_1$ 的规范化上取坐标 $s$ 使两个粘合点到 $0,\infty$、$a$ 到 $1$，于是 $\Sigma\simeq\mathbb C^*$，记 $p(s)$ 为坐标为 $s$ 的点。Koike 证明 $\beta:\mathbb C^*\to\operatorname{Pic}^0(D_Z)$，$\beta(s)=L\otimes\mathcal O_{D_Z}(-p(s))$ 是代数同构且 $\beta(1)=\mathcal O_{D_Z}$（`New_version.tex:1111-1125`）。取 $\Gamma:=\{(p(s),s)\}\subset Z\times\Sigma$、$\mathcal X:=\operatorname{Bl}_\Gamma(Z\times\Sigma)$、$\mathcal Y$ 为 $D_Z\times\Sigma$ 的严格变换；$\Gamma$ 在 $D_Z\times\Sigma$ 中 Cartier，故 $\mathcal Y\simeq D_Z\times\Sigma$（`New_version.tex:1127-1136`）。纤维满足 $X_s=\operatorname{Bl}_{p(s)}Z$、$Y_s\in\lvert K_{X_s}^{-1}\rvert$、$N_{Y_s/X_s}\simeq\beta(s)$，$Y_s$ 是 $D_Z$ 的严格变换；把族限制到 $\mathbb C^*$ 中 $U(1)$ 的开邻域 $S$ 上，得参数 $s_0$ 使 $p(s_0)=p$、$(X,D)\simeq(X_{s_0},Y_{s_0})$、$N_D\simeq\beta(s_0)$（`New_version.tex:1137-1148`）。把 $\alpha_D$ 经 $D\simeq D_Z$ 输运后，自同构 $\alpha_D\circ\beta$ 固定 $1$，故为 $s\mapsto s$ 或 $s\mapsto s^{-1}$，于是 $\lvert q_D\rvert=1\Leftrightarrow s_0\in U(1)$，且 $q_D$ 与 $s_0$ 的挠阶相同（`New_version.tex:1149-1155`）。

Koike 定理 3.1 需要五条假设。非挠参数下无穷型由 $H^1(Y_s,N_{Y_s/X_s}^{-n})=0$（$n\ge1$）保证（`New_version.tex:1158-1164`）；挠参数下验证充分条件 $5''$：设 $s$ 恰 $m$ 阶，$Z$ 有理故每个 $X_s$ 有理，$Y_s$ 是满足 $\omega_{Y_s}\simeq\mathcal O_{Y_s}$ 的约化有理圈，套用上面的正合列论证得 $1\le k<m$ 时 $h^0(X_s,kY_s)=1$、$h^0(X_s,mY_s)=2$ 且 $\lvert mY_s\rvert$ 无基点；取限制序列抬升 $1\in H^0(Y_s,\mathcal O_{Y_s})$ 得截面 $t_s$，则 $\phi_s=[s_{Y_s}^m:t_s]:X_s\to\mathbb P^1$ 满足 $\phi_s^*\{[0:1]\}=mY_s$（方案意义），在 $[0:1]$ 的小圆盘 $B_s$ 上限制给出满的真全纯映射 $b_s:V_s=\phi_s^{-1}(B_s)\to B_s$，$b_s^*\{0\}=mY_s$，$V_s$ 是 $Y_s$ 的邻域，这正是假设 $5''$（`New_version.tex:1165-1196`）。假设 1-4 由 Koike 对这一移动吹升族验证（`New_version.tex:1198-1199`），合起来对每个 $s\in U(1)$ 给出局部定义函数 $\widehat w_{j,s}$ 满足 $\widehat w_{j,s}=t_{jk}(s)\widehat w_{k,s}$，而该族的 conormal 转移常数满足 $t_{jk}(s)\in\{1,s,s^{-1}\}$；$s\in U(1)$ 时这些常数模长全为一，故 $[Y_s]$ 在邻域上酉平坦；由 $\lvert q_D\rvert=1$ 推 $s_0\in U(1)$ 与 $(X,D)\simeq(X_{s_0},Y_{s_0})$，得 $\mathcal O_X(D)$ 在 $D$ 的邻域酉平坦，再由判据得半正（`New_version.tex:1200-1220`）。加性型（`New_version.tex:1223-1243`）：令 $Y=D_{\mathrm{red}}$，每个加性 Sakai 型的 $Y$ 无拓扑圈，即 $H_1(Y,\mathbb Z)=0$，故 $Y$ 上每个酉平坦线丛单体平凡、从而全纯平凡；Koike 的定理 1.1 与 1.2 说明 $\mathcal O_X(D)$ 半正当且仅当它半 ample。此型下加性周期群为 $\operatorname{Pic}^0(D)\simeq(\mathbb C,+)$；若半 ample，上面的论证使 $N_D$ 挠从而平凡，$H^1(X,\mathcal O_X)=0$ 让 $0\to\mathcal O_X\to\mathcal O_X(D)\to N_D\simeq\mathcal O_D\to0$ 抬起 $1$，该抬升与 $s_D$ 生成 $\mathcal O_X(D)$；极小有理曲面 $K^2>0$，故 $X$ 有 $(-1)$-曲线 $E$，伴随公式给 $D\cdot E=1$，于是 $\lvert K_X^{-1}\rvert=\lvert D\rvert$ 是无基点亏格一流，$X$ 指标一。

定理 1.3 本身的证明在 `New_version.tex:1247-1307`。正向：(A) 从全局生成的幂拉回 Fubini-Study 度量再开根；(B)(C) 由命题 7.2；(D) 写 $\pi:M\to B$、$E:=\mathcal O_B\oplus L$，$E$ 酉平坦，相对 Fubini-Study 度量与 $K_M^{-1}\simeq\mathcal O_{\mathbb P_B(E)}(2)\otimes\pi^*(\det E)^{-1}$ 给出半正度量，且 $h^0(M,K_M^{-m})=\sum_{j=0}^{2m}h^0(B,L^{j-m})=1$（$m\ge1$），故 $K_M^{-1}$ 不半 ample（`New_version.tex:1249-1268`）。反向设半正不半 ample：$K^{-1}_M$ nef；若 $\kappa(M)\ge0$ 则 $mK_M\simeq\mathcal O_M$ 矛盾，故 $\kappa(M)=-\infty$，Enriques-Kodaira 分类使 $M$ 有理或为直纹曲面的吹升，特别射影（`New_version.tex:1270-1277`）。两种情形都有 $K^{-1}_M\not\equiv0$，于是这个 nef 不半 ample 的丛是 Bauer-Peternell 意义下的 bad 丛，其分类留下两条：有理情形由命题 7.1 与 7.2 恰好给出 (B)(C)；否则 $M\simeq\mathbb P_B(E)$ 在椭圆曲线 $B$ 上，把 $E$ 扭曲后有 $0\to\mathcal O_B\to E\to L\to0$，$L\in\operatorname{Pic}^0(B)$，要么 $L\simeq\mathcal O_B$ 且扩张不分裂，要么 $L$ 非挠；不分裂且 $L\simeq\mathcal O_B$ 者反典范丛 nef 但不半正，被排除；$L$ 非挠时 $\operatorname{Ext}^1(L,\mathcal O_B)\simeq H^1(B,L^{-1})=0$，扩张分裂，得 (D)（`New_version.tex:1279-1301`）。互斥性：(B)-(D) 中 $K_M^{-1}$ 不半 ample，(D) 中 $M$ 不有理，(B)(C) 中限制序列与 $H^0(D,N_D)=0$ 说明 $D$ 是唯一反典范除子，一为光滑椭圆一为圈，四支两两不交（`New_version.tex:1303-1306`）。

第 7.3 小节（`New_version.tex:1309-1366`）补 Remark 1.5 的证明。设 $K_M^{-1}$ 有光滑 Hermitian 度量 $h$，曲率 $\alpha:=R_h\ge0$；取 Gauduchon 度量，基本形式 $\omega$。若 $\kappa(M)\ge0$，取 $m>0$ 与 $mK_M$ 的非零截面，零点除子 $C$，由 Poincaré-Lelong 与 $\partial\overline\partial\omega=0$ 得 $0\le\int_C\omega=\deg_\omega(mK_M)=-m\int_M\alpha\wedge\omega\le0$，故 $C=0$、$mK_M\simeq\mathcal O_M$、$\alpha=0$；此情形下的非 Kähler 曲面恰为 primary 与 secondary Kodaira 曲面，反向因典范丛挠而 Hermitian 平坦（`New_version.tex:1311-1325`）。若 $\kappa(M)=-\infty$ 则 $M$ 属类 VII，$c_1(M)^2=-b_2(M)$ 逼出 $b_2(M)=0$ 且 $M$ 极小，Bogomolov 分类使 $M$ 为 Hopf 或 Inoue 曲面，Inoue 被 Teleman 的注记 4.2 排除（`New_version.tex:1327-1329`）。每个 Hopf 曲面容许有限不分支 primary 覆盖，半正在不分支有限覆盖下拉回并下降（取通过给定覆盖分解的有限不分支 Galois 覆盖，对平移后的度量取几何平均）（`New_version.tex:1331-1336`）。对角 primary Hopf 曲面 $M=(\mathbb C^2\setminus\{0\})/\langle g\rangle$，$g(z_1,z_2)=(\alpha_1z_1,\alpha_2z_2)$，$a_i:=-\log\lvert\alpha_i\rvert>0$；取光滑凸的正则化最大值 $\widetilde{\max}(s,t)$，在 $\lvert s-t\rvert\ge1$ 时等于 $\max(s,t)$ 且满足 $\widetilde{\max}(s+c,t+c)=\widetilde{\max}(s,t)+c$，令 $\varphi=(a_1+a_2)\widetilde{\max}(a_1^{-1}\log\lvert z_1\rvert^2,a_2^{-1}\log\lvert z_2\rvert^2)$，它 plurisubharmonic、在除原点外的每条坐标轴附近与不含零的那一支相同故光滑延拓，并且 $\varphi\circ g=\varphi-2(a_1+a_2)=\varphi+\log\lvert\det Dg\rvert^2$；于是给 $\partial_{z_1}\wedge\partial_{z_2}$ 赋平方范数 $e^{-\varphi}$ 的度量下降到 $K_M^{-1}$ 上成为光滑半正度量（`New_version.tex:1338-1361`）。椭圆 primary Hopf 曲面恰是满足 $\alpha_1^p=\alpha_2^q$（某对正整数）的对角情形（`New_version.tex:1361-1364`）。非对角 primary 曲面非椭圆故属类 0，Chiose-Toma 命题 3.2 的障碍说明其唯一的闭半正 $(1,1)$-形式是零形式，而 $K_M^{-1}$ 不 Hermitian 平坦，故不可能半正（`New_version.tex:1366`）。

第 7.4 小节（`New_version.tex:1369-1397`）证定理 1.6：不存在亏格一的 Ueda 型 $(\gamma)$ 嵌入。设椭圆曲线 $D$ 在紧复曲面 $M$ 中、$\deg N_{D/M}=0$、形式垂直线性化（全部 Ueda 类 $u_n(D,M)\in H^1(D,N_{D/M}^{-n})$ 消失），目标是证垂直线性化，而命题 2.1 说这等价于 $\mathcal O_M(D)$ 半正。$N_{D/M}$ 挠时由 Ueda 定理 3 得，下设非挠；由 AD 命题 3.1.2 得 $\kappa(M)=-\infty$，Enriques-Kodaira 使 $M$ 为有理、或双有理直纹而不有理、或类 VII；与正合列同样的论证给出 $h^0(M,\mathcal O_M(mD))=1$（所有 $m\ge0$），故 $D$ 的 Iitaka 维数为零（`New_version.tex:1370-1377`）。情形一 $M$ 有理：Sakai 命题 5 说要么 $D\sim K_M^{-1}$、套用定理 1.1，要么存在与 $D$ 不交的 $(-1)$-曲线，缩掉它重复论证，有限步内终止（`New_version.tex:1379`）。情形二 $M$ 双有理于直纹曲面：有吹升 $M\to M'$ 与 $M'=\mathbb P_B(V)\to B$，$B$ 必为椭圆曲线；不断缩掉与 $D$ 不交的 $(-1)$-曲线得 $M\to M''$，$\mathbb P^1$ 到椭圆曲线的全纯映射必常数，故 $f$ 越过最后一次吹升分解，逐次得到 $M\to M''$ 在 $B$ 上分解、$f'':M''\to B$ 的一般纤维为 $\mathbb P^1$；Sakai 命题 6 说明 $D$ 的像 $D''$ 是 $f''$ 的截面；再论证 $M''$ 极小（若有竖直 $(-1)$-曲线可缩，第一次吹升的中心不在 $\nu(D'')$ 上就直接得到与 $D''$ 不交的 $(-1)$-曲线，在其上则过该点的纤维的严格变换与 $\nu(D'')$ 的严格变换不交，矛盾），故 $M''=\mathbb P_B(W)$（`New_version.tex:1381`）。截面 $D''$ 对应商列 $0\to Z\to W\to Y\to0$，$N_{D''/M''}\simeq Z^{-1}\otimes Y$，扩张类落在 $H^1(B,Z\otimes Y^{-1})=H^1(D'',N_{D''/M''}^{-1})=0$，故分裂，$M''=\mathbb P_B(\mathcal O_B\oplus N_{D''/M''})$，$D''\subset M''$ 线性化，从而 $D\subset M$ 线性化（`New_version.tex:1383-1385`）。情形三类 VII：AD 命题 3.3.1 使 $M$ 为对角非共振 primary Hopf、其有限循环商的 secondary Hopf、或这两者在 $D$ 外的点上吹；这些吹升不影响垂直线性化。前者恰含两条椭圆曲线、嵌入直接验证为线性化；后者经循环商化归前者：在覆盖 Hopf 曲面上取每条提升椭圆曲线处零截线的邻域，除子丛在其上酉平坦，多支时取不交邻域并缩为平移不变邻域，$\mathcal O_M(D)$ 的拉回是 $D$ 的约化原像的除子丛故其上平坦，有限多个平移像的几何平均给出平移不变的平坦度量并下降到 $D$ 附近的 $\mathcal O_M(D)$，再用命题 2.1 的 (3)$\Rightarrow$(4)（`New_version.tex:1387-1397`）。

第 7.5 小节（`New_version.tex:1400-1405`）证推论 1.7：紧复曲面 $S$ 中光滑反典范连通除子 $C$（$C^2=0$）的补 $S\setminus C$ 不是 Stein。定理 1.1 的证明给出在 $S\setminus C$ 的紧集外定义的 pluriharmonic 函数 $r$，使 $r+\log\lvert w\rvert^2$ 近 $C$ 局部有界（$w$ 为局部定义函数）；$R_0\gg1$ 时水平集 $\{r=R_0\}$ 是 $S\setminus C$ 中非空紧 Levi-flat 实超曲面，故 $S\setminus C$ 不 Stein（`New_version.tex:1401-1405`）。背景在 `New_version.tex:155-161`：$(C^2)=0$ 时 $S\setminus C$ 为 Stein 的明显必要条件是其中无紧曲线、也无紧 Levi-flat 实超曲面，明显充分条件是它为仿射代数簇的解析空间；$S$ 为光滑三次曲线 9 点上吹 $\mathbb P^2$、$C$ 为其严格变换这一特例由 Ogus 明确提出、Neeman 等继续研究，Brunella 注记 4 猜想的就是这条推论。

本笔更正申报三处：第 3 节中一处位置串的行内代码收尾反引号被误写作定界符，已在前一笔改回；第 7 节第四步不等式右端曾被截断，已在前一笔补为完整的 $2C\varepsilon_T$ 与 $r_0$ 的比较，对应原文 `New_version.tex:848-849`。第三处错位申报：上一笔追加本节正文时锚点选错，覆盖了第 7 节末段的开头，该段前半已在第 7 节原位补回，其原有后半落到此处，位置串为 `New_version.tex:936-945`，即（`New_version.tex:936-945`）：$F$ 加常数后可设 $\{F=1\}\subset U$ 非空并用 $\{F<1\}$ 替换 $U$；取光滑凹函数 $\varphi:\mathbb R\to\mathbb R$，在 $t\ge0$ 上 $\varphi(t)=0$，在 $t\le-1$ 上 $\varphi(t)=t+c$，令 $\widetilde F$ 在 $U$ 上为 $\varphi\circ F$、在 $U$ 外恒为零，则 $\widetilde F$ 光滑、在 $U\setminus D$ 上 plurisuperharmonic，且在 $D$ 附近仍有 $dd^c\widetilde F=[D]$（`New_version.tex:937-939`）。取 $D$ 的定义截面 $s_D$，在 $X$ 上令 $\lvert s_D\rvert_h^2:=e^{\widetilde F}$（`New_version.tex:940-944`），它立刻给出线丛在 $M$ 上的光滑 Hermitian 度量且曲率半正。$\widetilde F$ 的 plurisuperharmonicity 正是曲率半正。

## 9 与本语料的接缝

本语料中以 bib key `CFSTZ2026` 引用本文的稿号是 D289、D305、D318、D385、D447、D451、D471（派单逐字登记，见本稿第 0 节）。按规格的取证边界，本稿只读 `被引素材/2609.26716` 的源码，D 稿侧的具体行位由本体侧回引时补齐，此处只登记稿号与 key，并给出可被引用的三层结论与记号读法。

三层结论按引用强度排列。第一层是定理 1.1（`New_version.tex:81-83`）：$D\in\lvert K_M^{-1}\rvert$ 光滑时 $\mathcal O_M(D)$ 在 $D$ 的某邻域上酉平坦，进而 $K_M^{-1}$ Hermitian 半正；这条用来关闭 Demailly-Peternell-Schneider 的第二问，即光滑三次曲线的 9 个（可无穷近）点上吹 $\mathbb P^2$ 的情形（推论 1.2，`New_version.tex:99-101`）。引用它时主语是度论陈述，等价度量陈述经 Yau 定理转写：$K_M^{-1}$ Hermitian 半正当且仅当 $M$ 容许 Ricci 曲率非负的 Kähler 度量（`New_version.tex:88`）。第二层是定理 1.3（`New_version.tex:106-121`）的四分 (A) 到 (D)，凡涉及紧 Kähler 曲面 Ricci 非负的分类、半正与半 ample 的分界、或周期 $q_D$ 的判据时引用此层；使用 (C) 前要先按 `New_version.tex:123-129` 把约化有理曲线圈与 $q_D:=\alpha_D(N_D)$ 的取法交代清楚，并说明 $\lvert q_D\rvert=1$、挠、挠的阶三条与 $\alpha_D$ 的选择无关。第三层是两条外溢：定理 1.6（`New_version.tex:149-151`，紧复曲面中不存在亏格一的 Ueda 型 $(\gamma)$ 嵌入）与推论 1.7（`New_version.tex:157-159`，光滑反典范除子 $C$ 满足 $C^2=0$ 时 $S\setminus C$ 不 Stein）；引用这两条时要连带说明它们经命题 2.1 的五条等价（`New_version.tex:232-244`）把度论、plurisubharmonic 势、酉平坦、垂直线性化与 $U(1)$-线性不变量串起来。

记号读法对照，供 D 稿回引时统一。$N_D$ 恒指 $\mathcal O_D(D)$，即沿 $D$ 限制的法丛（`New_version.tex:112`、`New_version.tex:128`），在 (C) 里它落在 $\operatorname{Pic}^0(D)$；$q_D$ 是其在 $\alpha_D:\operatorname{Pic}^0(D)\simeq\mathbb C^*$ 下的像（`New_version.tex:124-129`）。Hermitian 半正始终指存在光滑 Hermitian 度量使曲率形式非负（`New_version.tex:82`），酉平坦指某邻域上曲率恒为零的 Hermitian 度量（命题 2.1 的第 (3) 条）。垂直线性化的定义是转移函数满足 $w_i=t_{ij}w_j$、$\lvert t_{ij}\rvert=1$（`New_version.tex:221-224`），型 $(\gamma)$ 指形式垂直线性化（全部 Ueda 类 $u_n(D,M)\in H^1(D,N_{D/M}^{-n})$ 消失）但不垂直线性化（`New_version.tex:145`、`New_version.tex:1372`）。分析层的三个记号在引用构造细节时才需要：$z:=-\log\lvert\zeta\rvert_h^2$ 是柱状尾上的 pluriharmonic 坐标（`New_version.tex:306-307`），$\beta=\Omega_M-\Theta\wedge\iota_\xi\Omega_M$ 是待消灭的水平分量（`New_version.tex:503-505`、`New_version.tex:513`），$\mathcal Q_T:\mathcal D^\ell_{\delta,T}\to\mathcal H^{\ell+1}_{\delta,T}$ 是命题 5.4 的有界左逆、权重 $0<\delta<\frac12$ 与衰减率 $e^{-z/2}$ 绑定（`New_version.tex:592-617`、`New_version.tex:790-793`）。$\mathbb P_B(\mathcal O_B\oplus L)$ 是 (D) 中的直纹曲面，$B$ 为椭圆曲线、$L\in\operatorname{Pic}^0(B)$ 非挠（`New_version.tex:115-119`）。与本文同一批被登记的另两份外部论文是 C06（key `DPS2001`）与 C07（key `Ou2023`），若 D 稿在同一句里并列引用三者，本文提供半正性的几何判据与分类终点，`DPS2001` 一侧提供伪有效线丛的框架，`Ou2023` 一侧提供切层一般 nefness 的结论；三套记号互不覆盖，引用时各自按对应 C 稿的写法读。

本稿正文节为 `## 0` 到 `## 9`，编号连续。第 7 节与第 8 节之间、第 3 节与第 7 节内部各有一处由本人前笔造成的错位与截断，已在后一笔更正并在正文内申报，未删除任何已落盘文字。
