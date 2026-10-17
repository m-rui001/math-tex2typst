# D90 固定指数的生产链：Yau 节点上界幂律反例的取证笔记

对象：队列 99 行 `Power-law violations of Yau's nodal upper bound`，署名 OpenAI，2026-09-23。
论文宣称：在 $S^4\times S^1$ 上给出一个光滑度量与一列实 Laplace 特征函数，其节点集四维体积比 $\lambda^{1/2+\epsilon_0}$ 增长得快，$\epsilon_0>0$ 固定；据此推翻 Yau 节点集猜想在光滑类里的上界断言，也推翻带任意小正幂损失 $\lambda^{1/2+\epsilon}$（$\forall\epsilon>0$）的松弛上界。
本笔记的写法：以我自己的推进顺序做第一人称重建，凡属重建的都标 `[推测]`，凡属论文实测的都给 `文件:行号`，凡属只在论文里读到断言而没有读到证明的地方，明写"我只看到断言"。

## §0 取证口径与素材地图

### 0.1 素材边界

正文素材只从 tex 取。我本人实测布局如下（字节数为 `wc -c` 实测）：

- `build/main.tex` 3,516 B：`\documentclass[11pt]{article}`，`\pdfauthor={OpenAI}`，`\title{Power-law violations of\\Yau's nodal upper bound}`（main.tex:69），`\date{September 23, 2026}`（main.tex:71）。摘要在 main.tex:74-81，与我抄到的宣称原文逐字一致。宏包只加载 `amsmath,amssymb,amsthm,mathtools`、`microtype`、`geometry`（margin=1.05in）、`enumitem`、`hyperref`（main.tex:34-39）。声明计数器：`\newtheorem{theorem}{Theorem}[section]`，`proposition`/`lemma`/`corollary`/`definition`/`remark` 全部 `[theorem]` 共享计数（main.tex:56-63），`\numberwithin{equation}{section}`（main.tex:64）。也就是说，编号是按节重置的，条目地图里我用 `文件:行号` 定位，不用编号，避免编号歧义。
- `build/sections/introduction.tex` 7,124 B / 141 行
- `build/sections/framework.tex` 7,121 B / 156 行
- `build/sections/envelopes.tex` 29,404 B / 659 行
- `build/sections/waves.tex` 27,011 B / 708 行
- `build/sections/global.tex` 40,131 B / 905 行
- `build/references.bib` 5,411 B / 137 行，12 条条目（清点见 §8）

三步正文合计 29,404 + 27,011 + 40,131 = 96,546 B，与派单给的"合计 96 KB"吻合。全文 tex 行数合计 2,658 行。

本仓库 PDF 加密，我按红线只碰 tex，`paper.pdf` 一次都没有打开，也没有调用 `pdftotext`。

### 0.2 条目地图（`grep -n` 实测）

我先用 `grep -nE '\\(section|subsection|begin\{(theorem|lemma|proposition|corollary|definition|remark)\})'` 扫了一遍。得到一个不预期的事实：`\subsection` 命中 14 处，`\begin{theorem}` 只命中 1 处，`\begin{proposition}` 3 处，`\begin{lemma}` 11 处，`\begin{corollary}` 1 处，`\begin{definition}` 1 处；`\begin{remark}`、`\begin{example}`、`\begin{construction}`、`\begin{assumption}`、`\begin{claim}` 命中 0 处。全部带号条目如下（我把行号抄实）：

1. `thm:main`，introduction.tex:28
2. `def:certificate`，framework.tex:97
3. `prop:step`，framework.tex:121
4. `lem:seed`，envelopes.tex:16
5. `lem:corrugation`，envelopes.tex:131
6. `prop:envelope`，envelopes.tex:520
7. `lem:phase-hessian`（带标题 "A dominated characteristic Hessian"），waves.tex:57
8. `lem:polynomial-inverse`（"Polynomial directional inverses"），waves.tex:143
9. `prop:packets`（"Packets with arbitrary finite accuracy"），waves.tex:192
10. `lem:scaled-packets`（"Packets on a wavelength ball"），waves.tex:540
11. `lem:noncancellation`（"A quantitative nonvanishing first jet"），global.tex:126
12. `lem:signs`，global.tex:215
13. `lem:correction`，global.tex:395
14. `lem:simplicity`，global.tex:484
15. `lem:persistence`，global.tex:635
16. 无标签 `corollary`（维数 $n>5$ 的推论），global.tex:888

另外两个不带环境的证明块是承重件：`proof of Proposition prop:step`（global.tex:574）与 `proof of Theorem thm:main`（global.tex:727）。我把它们当作条目 3 和条目 1 的第四段材料，在 §5 里单独展开。

`\label` 命中总数我实测为 88 处，其中 `eq:` 前缀的公式标签构成一张真实的依赖图；最有价值的四个是 `eq:preparation`（envelopes.tex:99）、`eq:local-mass-gain`（envelopes.tex:152）、`eq:envelope-bounds`（envelopes.tex:526）、`eq:final-nodal-lower`（global.tex:866）。

### 0.3 宣称强度与取证分级

这篇的宣称强度很高（推翻一个 40 年公开猜想的光滑上界断言），所以我按三档记账：

- A 档（我读到完整证明）：`lem:seed`、`lem:corrugation`、`prop:envelope`、`lem:phase-hessian`、`lem:polynomial-inverse`、`prop:packets`、`lem:scaled-packets`、`lem:noncancellation`、`lem:signs`、`lem:correction`、`lem:simplicity`、`lem:persistence`。12 条，全部有 `\begin{proof}` 到 `\end{proof}` 的闭合文本。
- B 档（我读到证明，但证明的关键一步把负载交给了 A 档的某个定量指数）：`prop:step`、`thm:main`。
- C 档（我只看到断言）：`thm:main` 里 $\epsilon_0$ 的**具体数值**。论文只给 $\epsilon_0=\gamma/4$（global.tex:734），而 $\gamma=\theta\log(1+\zeta)$（envelopes.tex:635），$\zeta=\eta_0/(1+\eta_0)$（envelopes.tex:493），$\eta_0=(\mathcal W(a)-1)/8$（envelopes.tex:221），$\mathcal W(a)=3\int_0^1v^2\sqrt{1+a^2F(v)^2}\,\mathrm d v$（envelopes.tex:220），$\theta$ 只被约束为 $C_*\theta\le\delta=10^{-6}$（envelopes.tex:631）。链条的每一环都是显式表达式，但没有一环给出数值。这是本篇取证的头号发现，我在 §5、§6、§7 反复回到它。

同样在 C 档：论文 introduction.tex:44-48 声明"本构造对三维与四维的对应上界不作任何断言"，然后把三维四维交给同伴论文 `OpenAINodalQualitative2026`。这条是论文口径，我按 C 档抄录，与我在 Lean 侧的实测（§7）**物理分栏**。

## §1 初始动机与猜想：我第一次把 Yau 节点上界当成什么问题

### 1.1 我进场时的心理模型

我第一次把这件事当成"余项问题"，并非"构造问题"。这个偏向是有来历的。Yau 在 1982 年的 Problem Section 里提出节点大小问题（论文 introduction.tex:9-10 引 `Yau1982`），Donnelly--Fefferman 在 1988 年证明了实解析度量的双侧 sharp 估计，论文抄的是 `introduction.tex:57-58` 的 "Donnelly and Fefferman proved the sharp two-sided nodal estimate for real-analytic metrics \cite[Theorem~1.2]{DonnellyFefferman1988}"。同一句前面还有 `introduction.tex:11-14`：$(n-1)$ 维 Hausdorff 测度被 $\sqrt\lambda$ 的正倍数上下夹住，常数只依赖固定的流形与度量，而且上界断言"required to hold for every nonzero real eigenfunction, including all eigenfunctions in a multiple eigenspace"（introduction.tex:15-17）。这句话我读了三遍。它给我的第一印象是：断言的强度并不在"指数 $\sqrt\lambda$"，而在量词"every"，包括重特征子空间里**每一个**本征函数。

于是我的第一个进攻点是余项，具体是这样一条路线：既然解析类里上界成立（Donnelly--Fefferman），Gevrey 类 $s$ 里有 $\lambda^{s/2}$（论文 `introduction.tex:63-67` 引 Hezari2023），拟解析类里有 $\sqrt\lambda\log(\lambda+e)$（同一条引文），光滑类里 Logunov 有维数依赖的多项式上界（`introduction.tex:60-62` 引 LogunovUpper2018, Theorem 6.2），那么这五个已知结果之间的"正则性-指数"曲线，是不是在光滑端点处**必然**发散，只是发散的速度还没人写下来？我以为我要做的是一件"量化已知失效"的工作：把 Hezari 的 Gevrey 论证里的常数对 $s\downarrow 1$ 的依赖跟踪到底，看它在哪一步炸掉，然后按炸掉的速率反推光滑类里可以塞进去的 $\epsilon_0$。

这个进攻点有一个隐含前提，我当时没意识到它有多强：我以为上界断言的正确性只取决于**测度**的多少，也就是说节点集大小是由 $|\nabla u|$ 的分布控制的几何量。所以我一开始就在算 coarea：$\mathcal H^{n-1}(\Z(u))=\int_{\Z(u)}1$ 不好算，就算 $\int\delta(u)|\nabla u|$，再用 Logunov 的 doubling / frequency-function 工具把 $\int\delta(u)|\nabla u|$ 夹住。

### 1.2 我以为的第二个进攻点：重特征子空间的自由度

第二个偏向更实际。论文 `introduction.tex:15-17` 那句 "including all eigenfunctions in a multiple eigenspace" 让我以为：如果我能造出一个度量，让某个高特征值 $\lambda$ 的重数很大，然后在该特征子空间里挑一个"节点极复杂"的本征函数，就能绕过 Donnelly--Fefferman 直觉。因为在解析度量下重数会衰减到有限、且上界对每个本征函数成立，这个绕过在解析类里根本不成立；而在光滑类里，重数本身是可以拿来做文章的自由度。我为此读过 Enciso--Peralta-Salas 的度量 prescriptions 线（论文 `introduction.tex:73-76` 引 EncisoPeraltaSalas2015：三维以上，给定一个光滑闭连通可定向分隔超曲面，可以选度量使它成为第一非零本征函数的节点集），和 Enciso--Peralta-Salas--Torres de Lizaur 的高频拓扑 prescriptions（`introduction.tex:77-81`）。

我当时的判断是：这两条 prescription 线**给的**是节点拓扑的复杂度，不是节点测度的幂律超出，所以直接搬不动。这个判断是对的，论文 `introduction.tex:81-84` 也是这么划界的："The distinction here is power-law excess in total nodal measure, which is not furnished by those prescription theorems."。但从判断到"那到底怎么造"之间，我当时完全没辙。

### 1.3 我以为的第三个进攻点：把指数钉在波长上

还有一个技术性的天真想法。Yau 上界的标度来自波长 $\lambda^{-1/2}$：单位体积里能塞 $O(\lambda^{n/2})$ 个波长盒子，每个盒子里节点面贡献 $O(\lambda^{-(n-1)/2})$，乘起来正好 $\sqrt\lambda$。我以为反例只需要打破这个计数，办法是造一种"亚波长结构"：让节点面在每个盒子里折返多次，而特征方程对此不设防。这在物理直觉上非常顺；问题是我以为**光滑度量的椭圆正则性会立刻禁止它**，因为 $-\Delta u=\lambda u$ 意味着 $u$ 的 $C^k$ 范数按 $\lambda^{k/2}$ 增长，而折返次数似乎被 $\|\nabla u\|_\infty/\|u\|_\infty$ 卡住。

事后看，这一条天真想法里有一个正确的内核和一个错误的推断。正确的内核：指数差确实只可能来自"每单位体积能塞多少张节点面"这个计数被抬高。错误的推断：椭圆正则性**只**卡 $C^k$ 范数的**大小**，不卡节点面的**条数**，因为条数是个 $L^1$ 型几何量，而 $\|\nabla u\|_\infty$ 与 $\int|\nabla u|$ 之间可以差任意大的因子。这个区别，就是本篇全部机器（envelopes 那一节 29,404 B）在做的事。

### 1.4 我进场时没有预料到的形状

我完全没有预料到最终对象长这样：一个**对数级**的迭代次数 $m=\lfloor\theta\log k\rfloor$（envelopes.tex:634）把一个**常数倍**增益 $(1+\zeta)^m$ 兑换成**频率的幂** $k^\gamma$，$\gamma=\theta\log(1+\zeta)$（envelopes.tex:635）。这个兑换是整个反例的心脏，而它的全部内容为：指数 $\gamma$ 与所有构造参数"独立于导数阶、后续的精度要求、以及 gluing collar 的宽度"（envelopes.tex:540-542 逐字："The exponent $\gamma$ and all construction parameters are independent of derivative orders, subsequent accuracy requirements, and round gluing collars."）。

我也没有预料到概率会被引进来。全局步骤里节点下界不是算出来的，是**抽样抽出来的**：以 $Ck^{40}$ 个 packet 为基做高斯线性组合（global.tex:76-88），先用一个非消失一阶 jet 的概率 1 事件（`lem:noncancellation`），再用一个"每个波长球上至少 $p_*$ 概率出符号对"的事件（`lem:signs`），最后用加权成功比例 $F_k$ 的一刻钟式论证把两者相减（global.tex:379-391）。我以为我会走确定性构造。

[推测] 我进场时的这三个偏向（余项量化、重数自由度、亚波长计数）里，第一个大概率是被我自己的知识错觉带偏的：Hezari 的 Gevrey 论证对 $s\downarrow1$ 的发散速率，从文献看并没有已知下界，我当时的假设等于把开放问题当已知。第二个偏向（重数）在论文的框架里被 `introduction.tex:16-17` 的量词强化反而绕过了：因为反例只需给**一个**本征函数序列，重数不是必需品；论文 `global.tex:484`（`lem:simplicity`）做的甚至是**相反**的事，它花力气把 $k^2$ 变成**单**特征值，以便后续 spectral persistence 能挑出一个连续分支。我进场时以为"重数=自由度=反例来源"，实际机器要求的是"单重=可追踪=能过极限"。

## §2 尝试过的错误路线与失败原因

我按"我以为能做、实际断在哪一步"来记。凡论文里没有明写的失败，我标 `[推测]`，并且给出我在 tex 里读到的**反向证据**（通常是某句 defensive 的话，它存在的理由就是有人试过反方向）。

### 2.1 错误路线一：在解析或 Gevrey 度量的框架内做扰动，指望余量还够

设想：取 round $S^4$（解析度量），做小的 Gevrey 扰动，配 Donnelly--Fefferman 的解析上界，希望节点测度的增长被上界的**常数**，并非**指数**限制住，然后把常数推到无穷。

断点：这条路线在第一步就断，断的是**上界本身**。Donnelly--Fefferman 的 $\mathcal H^{n-1}(\Z(u))\le C\sqrt\lambda$ 对解析度量是**指数级**成立的，常数 $C$ 依赖度量，但指数 $1/2$ 不依赖任何量。你把度量在解析类里怎么挠，比值 $\mathcal H/\sqrt\lambda$ 都留在有界区间里。所以"用常数换幂"的算盘在解析类里根本不存在。

tex 里的反向证据：`introduction.tex:63-68` 逐字 "Those hypotheses do not cover arbitrary smooth metrics."，紧接 `introduction.tex:58` 的引文位置是 `[Theorem~1.2]{DonnellyFefferman1988}`。论文把 Gevrey / 拟解析 / 光滑三档分开写，就是在声明这条路不通。更硬的证据是**度量类的选择被放到了框架的入口**：`framework.tex:7-9` 的正面不是度量，是**正对** $(A,\rho)$（positive pair：光滑正定对称逆变张量加光滑正密度），$G^{-1}=\rho^{-1}A$，$Lf=\rho^{-1}\operatorname{div}_\mu(A\,\mathrm d f)$（framework.tex:10-13），然后 `framework.tex:19-20` 逐字 "The tensor and density will be changed independently. Their conversion to an ordinary metric occurs only at the end of the proof."。这句话我读到第四遍才理解它的分量：他们**放弃了在度量类里做工**，改成在一个更大的算子类（weighted elliptic operator）里做工，最后一步才把算子塞回度量。这是一次**问题域的迁移**，不是路线内部的修补。

失效的经典高频估计（本条）：Donnelly--Fefferman 的解析上界（其证明依赖三球不等式 / frequency function 在解析类的刚性）；Hezari 的 Gevrey $\lambda^{s/2}$（`introduction.tex:64-65`）在 $s$ 固定时对幂次是硬的。

### 2.2 错误路线二：把 frequency function / doubling index 直接搬到光滑度量

设想：Logunov 的两篇 Annals 工作（`introduction.tex:59-62`）已经证明光滑度量下 sharp 下界（LogunovLower2018, Theorem 1.1）和多项式上界（LogunovUpper2018, Theorem 6.2）。上界是多项式，意味着它的证明里有一个**可控**的指数损失；我以为只要沿着 LogunovUpper 的证明把指数往下压，或者反过来说，只要找到让它压不下去的例子，就能定位 $\epsilon_0$ 的来源。

断点：断在**工具给的量与要证的量不同型**。反例要的是**单个**本征函数序列上 $\mathcal H/\lambda^{1/2+\epsilon_0}\to\infty$，而 doubling / frequency-function 一类工具给的是**尺度均匀**的上界：一个 $C^0$ 靠近的扰动、一类覆盖数的上界、或一个 growth lemma。它们对**所有**本征函数一视同仁。本篇构造里 `lem:persistence`（global.tex:635-648）恰好演示了这类工具的**方向**：给一个单特征值与它的符号证书，存在一个**有限范数**闭球 $\\lVert\mathcal P'-\mathcal P\rVert_{C^s}\le\varepsilon$，球内每个正对都有 $I$ 里的单特征值和**同一批证书盘**上的本征函数。这个引理是用来**保住**反例的，不是用来排除反例的；它同时透露：任何想用 uniform 上界论证去"从反面夹死"幂律超出的人，都会撞上同一批证书盘。

失效的经典高频估计（本条）：doubling index 界；Harding--Sffi--Tri 一类的定量唯一连续性（见 §8，检索强度我按实际拿到的记）；Aronszajn 唯一连续性在本篇是**被用来做 kernel 分类**的（global.tex:537-541，`lem:simplicity` 里 $f-cu$ 满足二阶椭圆方程，"Aronszajn's unique continuation theorem applies"），也就是说这篇把这类工具当作**构造的单重性引擎**，并非当作上界引擎。

### 2.3 错误路线三：直接对 round 球面高频本征函数做微局部集中（Gaussian beam 加长）

设想：论文 `waves.tex:10-12` 承认 packet 的相位-输运构造来自复 WKB 局部拟模，"compare \cite[Section~3]{DenckerSjostrandZworski2004}"。那么最省力的做法是拿现成的高斯束 / 拟模，把它拉长到节点最多的方向，指望节点测度按经典计数往上顶。

断点有三处，每一处都在 tex 里留下了疤。

第一处，**局部性对测度的贡献是加性的，并非幂律的**。一个孤立 packet 只在一个 $Ck^{-1/3-100\delta}$ 半径的球里振荡（waves.tex:199），它给节点测度的贡献是 $O(k^{-(n-1)\cdot(\text{尺度指数})})$ 的量级，你放有限多个，指数不变。所以必须让**包络本身**（envelope $h$）在给定区域里梯度积分增长为 $k$ 的正幂，这正是 `prop:envelope` 干的事。

第二处，**WKB 泰勒解对包络导数的依赖没有被经典构造跟踪**。论文 `waves.tex:13-16` 逐字 "Here the envelope varies with the frequency. We therefore construct finite Taylor solutions and track their dependence on its derivatives and Hessian margin, keeping the support, derivative, and real-jet exponents fixed as the residual accuracy increases."。这一句就是这条错误路线的墓碑：经典 WKB 是在**固定背景**上做的，包络 $h$ 一旦随 $k$ 变化，$e^{kh}$ 的 $C^j$ 范数按 $k^{\delta(j+1)}$ 长（envelopes.tex:528），残差预算里每一项都带 $T$、$s$、$J$ 这些阶数，你必须证明"精度要求变高时，支撑、导数、jet 三个指数**不动**"。`prop:packets` 的最后一段（waves.tex:219-221）把这件事写成了明面条款："The exponents in the support, derivative, and jet bounds are independent of $J,M$."

第三处，**特征方程在复方向上的可解性需要一个非标准的代数引理**。经典构造假设 $q\cdot q\ne0$（非零双线性平方）以便沿复特征线解方程；本篇的相位方向 $P=p'+iQ'v$ 满足 $P\cdot P=-1$，但在 $p\to0$ 的极限下相关方向的 $|q\cdot q|$ 可以任意小。`lem:polynomial-inverse`（waves.tex:143-153）逐字："No lower bound for $|q\cdot q|$ is required."，证明用 $q\cdot\partial=q_i\partial_i+D'$ 与一个**幂零**的 Neumann 型有限几何和 $R_{q,m}=\frac{I_i}{q_i}\sum_{r=0}^{m}(-\mathcal K)^r$（waves.tex:157-162）来避开这个下界。这是一个纯粹为了绕过"经典高频率构造假设"而造的代数件。

失效的经典高频估计（本条）：标准 Gaussian beam 的宽度选择（要 $|q\cdot q|$ 非退化）；半经典 pseudospectrum 估计（Dencker--Sjöstrand--Zworski 的框架给的是拟模谱集，不给节点测度）；固定包络的 WKB 余项界。

### 2.4 错误路线四：用 coarea 或 $\int\delta(u)|\nabla u|$ 把节点测度算出来

设想：我进场时最先试的计算（§1.1）。$\mathcal H^{n-1}(\Z(u))$ 直接算不了，就用 coarea：$\int_{\Z(u)}$ 换成 $\int\delta_0(u)\,|\nabla u|\,\mathrm d x$，再对 $\delta_0$ 做傅里叶表示或用 level-set 逼近。

断点：**你没法在不知道零集正则性的情况下给它任何下界**。本篇给出的替代方案是彻底的换题：Definition `def:certificate`（framework.tex:97-109）把节点下界替换为"符号证书"，即有限对**全等闭三维 Euclidean 盘** $(D_i^-,D_i^+)$，要求每对是一个直立柱的两端、柱紧含于一个 Euclidean 坐标球、各坐标球两两不交、$u$ 在两端取严格相反符号，证书大小定义为 $\sum_i\mathcal H_{\mathrm{Euc}}^3(D_i^+)$（framework.tex:107-108）。然后 framework.tex:115-117 给出唯一的推理："Every segment joining corresponding points of $D_i^-$ and $D_i^+$ contains a zero."。这是**中值定理加 Lipschitz 覆盖**，零集可以烂到没有任何结构。论文 `global.tex:870-871` 明写："This argument uses continuity and signs only, without any regularity assumption on the nodal set."。

所以 coarea 路线的失败原因值得精确化：不是它算不出上界，是它**在反例场景下无法给出任何不含零集正则性假设的下界**。本篇用柱-盘几何把这个假设吃掉了，代价是必须**真的造出**很多对带反号的盘，于是概率方法进场（§3.3）。

[推测] 我怀疑这条路线还有一层我没证据的失败：coarea 会把 $\mathcal H^{n-1}$ 与 $\||\nabla u|\,\delta(u)\|_{L^1}$ 绑定，而在本篇的构造里 $u$ 的梯度在 $V$ 内的**加权**积分是 $k^{1+\gamma}$ 级（envelopes.tex:533, global.tex:248），但 $u$ 本身被 $e^{kh}$ 压住；coarea 的经典使用需要同度量下的面积元，而这里的增益全部住在**坐标 Lebesgue 测度**里（framework.tex:33-35："integration in a coordinate corrugation chart refers to Lebesgue measure $\mathrm d x$"）。坐标测度与 $G$ 测度之间只有一致有界的 Jacobian，这刚好够搬一次，但 coarea 要求的水平集面积元一致性，在节点集无正则性时不可得。

### 2.5 错误路线五：先做光滑极限、再做反例函数（次序颠倒）

设想：一条更"安全"的路线：先固定一个光滑度量（比如一次性把 corrugation 做完），再在**该固定度量**的谱上找本征函数。

断点：**固定度量的谱不是你造的函数的谱**。你无法保证你造出来的振荡结构是本征函数；本篇反过来做：每一 stage 先造 $u$（准本征，残差 $Ck^{-M}W$，global.tex:103），再用**显式代数校正**把度量搬到 $u$ 身边（`lem:correction`，global.tex:395-417），校正大小 $\lVert(\delta A,\delta\rho)\rVert_{C^R}\le C_Rk^{-M+2129+1088R}$（global.tex:409-411），$M\ge2131+1088R$ 就趋零（global.tex:414）。然后才是**极限过程**：一列 pair $\mathcal P_j$ 在每个固定 $C^r$ 范数下可求和（global.tex:773-775），极限 $\mathcal P_\infty$ 落在所有事先选好的 persistence 邻域内（global.tex:785），于是**每一 stage 的证书在本极限度量下仍然是同一批证书**（global.tex:787, `lem:persistence`）。

这个次序（造函数 -> 校正系数 -> 用单重性锁住 -> 可求和迭代 -> 极限 -> warping 上圆）之所以必须，是因为**每个 stage 的 $c_j$ 可能坏到任意地步**（依赖 $r_j,\eta_j$，而 $\eta_j$ 又是前面所有 stage 的 persistence 半径的几何衰减 min，global.tex:745-751）。论文在 `framework.tex:149-156` 与 `introduction.tex:115-125` 两处都强调这个"常数与指数的分工"。`introduction.tex:115-117` 逐字："At a given stage, constants and frequency thresholds may depend arbitrarily badly on the required finite coefficient accuracy. The exponent $\gamma$ does not; nor do the chart or coefficient neighborhood."
失效的经典高频估计（本条）：Kato 型谱扰动 / analytic perturbation theory（本篇不用解析扰动，因为 pair 序列只按**有限**范数收敛，而每个范数只保护**有限个**先前约束；这是 `lem:persistence` 存在的唯一理由）；Rellich 定理的解析特征值分支。

### 2.6 错误路线六：把节点测度的增长寄托在特征子空间的重数上

设想：§1.2 的延续。若某高特征值重数 $\gg1$，则特征子空间里有 $\gg1$ 维自由度，从中挑节点最复杂者。

断点：**重数给的是"挑"的自由，不给你"幂"**。要在重 $m$ 特征子空间里保证存在一个节点超出 $\lambda^{1/2+\epsilon_0}$ 的本征函数，你需要对整个子空间做统计，而这类统计在光滑度量下没有已知的正结果；更糟的是，本篇的整条链条在**单重**假设下工作得最好：`prop:step` 的结论 (ii) 明写 "$k^2$ is a simple eigenvalue of $-\widehat L$ on the base $B$"（framework.tex:139-140），而 `lem:simplicity`（global.tex:484）专门花 87 行去**制造**单重性，用的工具是一个精心构造的非负张量 $E=\chi\bigl(I-\frac{(I\mathrm d u)\otimes(I\mathrm d u)}{I(\mathrm d u,\mathrm d u)}\bigr)$（global.tex:501-503）满足 $E\mathrm d u=0$，从而扰动 $A+\tau E$ **精确保持** $u$ 和它的特征值，同时把 kernel 压到 $\operatorname{span}\{u\}$。

制造单重性，并非利用重数，这个决定说明：作者需要的是**可追踪的谱分支**（下一节的 spectral persistence 要对**这个**特征值取闭球半径），重子空间反而破坏可追踪性。

[推测] 我的第六条错误路线与第二条（Logunov 上界工具）实际上在同一个点上失败：光滑度量的谱几何在高频端**没有可微依赖**的东西可用。Logunov 的 uniform 上界与 Kato 分支定理分别给出"所有函数都受控"与"单重特征值才受控"，反例必须同时躲开这两把刀，办法是让指数受控（$\gamma$ 常数无关）而谱分支单重化。

### 2.7 关于"哪条路线是论文自己排除的"
按派单的口径纪律，我在这一节里保留的对照只属于**被论文自身文本排除的路线**，共三条，均可指回 tex：

1. 解析 / Gevrey / 拟解析假设下的上界：被 `introduction.tex:67-68` "Those hypotheses do not cover arbitrary smooth metrics." 排除。
2. 节点拓扑 prescription 类定理（Enciso 等两条线）：被 `introduction.tex:83-84` "which is not furnished by those prescription theorems" 排除。
3. 定性存在定理（不带频率阈值的抽象论证）：被 `introduction.tex:131-132` 明确拒用："the argument does not appeal to a qualitative existence theorem with an uncontrolled frequency threshold."

第 3 条最有信息量。它说明作者知道有一个更短的路线可走：用某种抽象存在性（例如以 fixed-point / implicit function 方式让 $M\to\infty$ 的精度要求自适应地选 $k$）来得到一个反例函数序列，然后宣称上界被推翻。这条路线**给不出固定 $\epsilon_0$**，因为频率阈值 $\Theta(M)$ 与增益之间没有可逆的显式关系；它正是同伴论文（三维四维、只宣称 $\mathcal H/\sqrt\lambda\to\infty$）所处的层级。论文把这句话放在引言里，我读作：他们**主动放弃**了短路线，以便购买幂律。这一点在 §7 的 Lean 侧有硬证据：机器里认证的恰恰是短路线的版本。

## §3 关键转折点：具体到 waves / envelopes / global 里的哪一步

我把转折分成三个"诞生时刻"，分别落在三步正文里。每个时刻我都给出：在 tex 里的位置、它诞生的一刻在文本里如何被标记、以及它凭什么把死路变活路。

### 3.1 转折一（envelopes，承重墙）：把"增益"从常数升级为可重复的乘子

位置：`eq:local-mass-gain`，envelopes.tex:152-155，逐字

```
 \begin{equation}\label{eq:local-mass-gain}
  \int_{\mathcal R_P}|\nabla v|\,\dd x
  \ge(1+\zeta)\int_P|\nabla h|\,\dd x;
 \end{equation}
```

它的诞生时刻在证明里可以精确定位：不是在选 well 的时候（envelopes.tex:180-216 只是在造周期井 $\psi$、$f$、$u_0$ 与恒等式 `eq:well-identities`），是在**决定"重复区域"取哪一部分子立方体"的那一刻**。文本标记是 envelopes.tex:435 的段落标题 `\paragraph{The region prepared for repetition.}`。这一段的关键动作是：不取整个子立方体网格，而只取**完全落在"可重复开区域"内的闭子立方体**（envelopes.tex:456-459："Select all closed child cubes contained in this open repeat region."），然后**证明这一部分的积分超过旧父立方体的全部积分**。这就是论文标题性的那句机制描述的实现（`introduction.tex:89-92`）："the part of a parent cube prepared for another corrugation has more new gradient integral than the entire old parent cube"。

为什么这是转折，不是改进：在此之前，所有 corrugation 类构造（Nash--Moser / convex integration 传统里的波形修正）都在优化**修正的振幅与导数**，增益是"把梯度做大一点点"，是一个**常数级**的事实，与迭代次数无关。这里把目标换成了**几何级数的公比** $\zeta$，并且为了保住公比，主动**丢弃**父立方体的一部分体积（丢掉的那部分仍然在被修改后的 $v$ 里，只是不再作为下一代容器）。丢体积换公比，这一交换使得"迭代 $m$ 次"变成"$\times(1+\zeta)^m$"，于是后面 $m=\lfloor\theta\log k\rfloor$ 才可能变成 $k^\gamma$。

公比的生产线（我逐环实测）：
- $\mathcal W(a)=3\int_0^1v^2\sqrt{1+a^2F(v)^2}\,\mathrm d v>1$（envelopes.tex:220）：单个井上的平均梯度因子；严格 $>1$ 的理由是 $\sqrt{1+a^2F^2}>1$ 在一个正测度集上成立，而 $3\int_0^1v^2\mathrm d v=1$ 正好是单位球的体积归一。
- $\eta_0=(\mathcal W(a)-1)/8$（envelopes.tex:221）：把"井的富余"折成八分之一当裕度。
- $\varpi\mathcal W(a)>1+6\eta_0$（envelopes.tex:224-226）：井的体积占比 $\varpi$ 选到能吃到 $6\eta_0$。
- $C_{\mathrm{core}}>\varpi\mathcal W(a)-\eta_0>1+5\eta_0$（envelopes.tex:238-241）：只保留半径 $(1-\eta)R_i$ 以内的 core 球，损失 $\eta_0$。
- $qC_{\mathrm{core}}>C_{\mathrm{core}}-\eta_0>1+4\eta_0$（envelopes.tex:243-245）：只保留父立方体的内缩分数 $q$ 部分，再损失 $\eta_0$。这里 $q$ 是**四维体积分数**（envelopes.tex:246 明写）。
- 边界层误差：周期胞与子立方网格不对齐带来的相对损失 $O(\nu)$，与只取整子立方体带来的 $O(\nu)$ 损失（envelopes.tex:461-472）。
- 最终比值 $\frac{1+3\eta_0}{1+\eta_0}=1+\frac{2\eta_0}{1+\eta_0}$（envelopes.tex:489-492），取 $\zeta=\eta_0/(1+\eta_0)$（envelopes.tex:493）。

裕度一共被吃三次（$6\to5\to4$），最后 $1+4\eta_0$ 减两次 $O(\nu)\le\eta_0$ 得 $1+3\eta_0$，除以分母的 $1+\eta_0$。这条链就是 $\epsilon_0$ 的全部"数值来源"，而它只给出**存在性**：$\zeta>0$。

### 3.2 转折二（envelopes，兑换时刻）：$m=\lfloor\theta\log k\rfloor$ 与 $\gamma=\theta\log(1+\zeta)$

位置：envelopes.tex:631-637，逐字

```
Fix $\theta>0$ so small that $C_*\theta\le\delta$, and for each
$k\ge2$ take
\[
 m=\lfloor\theta\log k\rfloor,
 \qquad \gamma=\theta\log(1+\zeta)>0,
 \qquad h=h_m+c_k.
\]
```

这是整篇论文**唯一**把"对数迭代次数"与"频率的幂"接上线的地方，也是 $\epsilon_0$ 的生产点。左边需要它，右边供给它：

- 需要它的一端：`eq:all-order-envelope-growth`（envelopes.tex:599-607）给出 $\lVert h_m\rVert_{C^j}\le C_j'e^{C_*(j+1)m}$，即 $m$ 次迭代后 $j$ 阶导数按 $e^{C_*m}$ 的 $(j+1)$ 次幂长。$C_*$ 是**一个对所有 $j$ 通用**的有限数（envelopes.tex:608-609 明写 "one finite $C_*$ works for every $j\ge0$"）。
- 供给它的一端：`eq:iterated-mass`（envelopes.tex:570-574）给 $\int_V\sqrt{1+|\nabla h_i|^2}\ge I_0(1+\zeta)^i$。

把 $m=\theta\log k$ 代入：增益 $(1+\zeta)^m\ge(1+\zeta)^{-1}k^\gamma$（envelopes.tex:641-642），代价 $\lVert h_m\rVert_{C^j}\le C_jk^{\delta(j+1)}$，只要 $C_*\theta\le\delta=10^{-6}$。所以 $\theta$ 是被 $C_*$ 从上面压住的：$\theta\le\delta/C_*$，从而 $\gamma=\theta\log(1+\zeta)\le(\delta/C_*)\log(1+\zeta)$。这个不等式就是"幂律超出必然是极小的正数"的全部原因：**导数账本与增益账本在同一张表上**。

我认为这一刻的"诞生"在文本里被 envelopes.tex:647-657 那段"clarify about subsequent uses"的说明性文字标记出来："the constants determining $C_*$, $\theta$, and $\gamma$ use only the fixed pattern, the seed, and common $C^1$ metric bounds. Higher derivatives of an individual input metric may enter constants in a later smooth coordinate change, but **cannot alter these exponents**."。这段话的功能是给后面的迭代（global 的 stage 序列）发通行证：极限过程中度量在变，但指数不变。

### 3.3 转折三（waves，条件成立的一步）：相位 Hessian 在零实斜率处仍然可造

位置：`lem:phase-hessian`（waves.tex:57-72）与其证明的第二分支（waves.tex:110-136，$0\le b<k^{-12\delta}$ 的情形，取 $K=k^{14\delta}$）。

这一步在文本结构上是"引理"，在机制上是转折。原因：$J_h$ 这个测试泛函在 framework.tex:37-43 被定义成 $(\nabla^2h)(p/Q,p/Q)+(\nabla^2h)(e,e)$，其中 $e\perp\mathrm d h$、$|e|=1$；在 $p=0$ 时 framework.tex:44 允许"every unit vector is an admissible test"。而 packet 的定位需要复 Hessian $S=U+iD$ 满足 $SP=0$（$P=p'+iQ'v$），并从 $H-\operatorname{Re}S$ 的正性拿到二次亏损来压住 $e^{\kappa\Phi}$ 的支撑。经典 WKB 在这里会直接失败，因为 $b=|p'|/Q'$ 出现在 $D$ 的表达式里作分母（waves.tex:95-101 的矩阵块有 $-u_{12}/b$、$-u_{2E}/b$），$b\to0$ 时爆炸。文本 waves.tex:116-118 明写这个分支存在的理由："These formulas also give $D=0$ and $Uv=0$ when $b=0$, so no division by a small $b$ is involved in this case."

诞生时刻的标记：论文 `introduction.tex:127-130` 把"a phase-Hessian construction valid at zero real slope"单独列为"reusable local facts"之一，与"polynomial first-jet noncancellation argument"和"exact tensor--density correction"并列。这类"我把我的零件逐个报名字"的段落，通常写于作者意识到某个零件是通用的、可以脱离本篇复用的时刻。我读到这里推断：这一分支是在 packet 的四个中心之一落在临界点附近时被迫造的（`prop:packets` 要求**所有** $t\ge1/4$ 的中心都有 packet 族，waves.tex:195-196），而造出来之后他们发现它同时解决了"包络梯度可以任意小"这一全局性问题。

为什么它是转折：它使 `lem:seed` 里的临界点处理（envelopes.tex:53-71：在 $t=1$ 处 Hessian 有特征值 $2a_*,2a_*,0,0$，梯度为零，于是加 $\varepsilon|\xi|^2/2$ 截断扰动，使正二维平面与 $\ker\mathrm d h_0$ 相交至少一维）能被 waves 消费。若 $p=0$ 处相位不可造，则包络必须在每一点保持梯度非零，而 `lem:seed` 的 $U_0$ 恰恰要**避开**临界点（envelopes.tex:89-90："Notice that $U_0$ is chosen away from the critical point $x_*$."），corrugation 的可行区域就会被切碎。

### 3.4 转折四（global，概率一步）：不加独立性也能拿到加权成功比例

位置：`eq:weighted-success`，global.tex:367-369，逐字

```
\begin{equation}\label{eq:weighted-success}
 \Pp(F_k\ge\pi_*/2)\ge\frac{\pi_*}{2-\pi_*}>0.
\end{equation}
```

它前面的 global.tex:364-366 逐字："Let $F_k$ be the fraction of successful balls weighted by $R_x^3$. No independence among these successes is claimed or needed. Since $0\le F_k\le1$ and $\mathbb E F_k\ge\pi_*$,"。这就是"一条单边 Markov/Chebyshev 型引理"：若 $0\le X\le1$ 且 $\mathbb E X\ge\pi$，则 $\mathbb P(X\ge\pi/2)\ge\pi/(2-\pi)$。证明一行：$\pi\le\mathbb E X\le1\cdot\mathbb P(X\ge\pi/2)+(\pi/2)(1-\mathbb P(X\ge\pi/2))$，解出。

这是转折的理由：节点测度的幂律超出需要**很多**对盘同时成功，而这些盘所在的波长球彼此**不独立**（同一批高斯系数被很多球共享，global.tex:252-253 说 beam 在这些球上消失，但 packet 支撑重叠）。任何需要独立的论证（例如第二矩法挑子集、Lovasz local lemma）在此都要付指数级的常数，从而摧毁可求和迭代。这里只花一个**常数概率** $\pi_*/(2-\pi_*)$，一次到位。

配合的另一半是 global.tex:379-391 的概率相减：`lem:noncancellation` 的失败概率 $<p_*/2$，`lem:signs` 的成功概率 $\ge p_*$，交集 $\ge p_*/2$。论文在 global.tex:388-391 特别注明"This probability subtraction is valid even if $p_*$ is extremely small. The probability bounds above were obtained without conditioning on $\mathcal B_k$"。这一句我读作防御性写作：作者在告诉读者，$p_*$ 的任意小性**不会**通过条件化传染到别的地方。

### 3.5 三个转折的相对位置（我的读法）

envelopes 给指数（$\gamma$），waves 给实现指数的载体（packet 的残差与 jet 指数对精度不敏感），global 给把载体换成真本征函数的代数（correction）与把单步换成一个度量的分析（persistence + summable iteration）。96 KB 正文里，envelopes + waves 共 56 KB 都在为 `introduction.tex:99-103` 那一行不等式服务：$\int_V\sqrt{1+|\nabla h|^2}\,\mathrm d x\ge c\,k^\gamma$。global 40 KB 全在花掉这一行的后果。

[推测] 如果我来重建时间线，转折一（公比换体积）先于转折二（$\log k$ 兑换），转折二先于转折三。理由：$\delta=10^{-6}$ 这个极小的容许导数增长率（framework.tex:55-57）必须是**先**定下的框架常数，`prop:packets` 里所有 $k^{4\delta}$、$k^{20\delta}$、$k^{-106\delta}$ 的余量都以此为记账单位；而 $lem:phase-hessian$ 的 $b$ 分支需要的 $k^{-12\delta}$ 阈值，其存在性又依赖包络 Hessian 亏格 $k^{-\delta}$ 与 $|H|\le k^{4\delta}$ 这两个由 `prop:envelope` 提供的界。文本依赖图与此一致。

## §4 最终思路与最初设想的差异

### 4.1 差异表（我进场时的模型 vs. 论文实际交付的模型）

| 维度 | 我进场时以为 | 论文实际做的 | 差在哪 |
| --- | --- | --- | --- |
| 问题类型 | 收紧 Donnelly--Fefferman 的余项，量化已知上界在光滑端的失效 | 在**扩大后的算子类**（weighted pair $(A,\rho)$）里造反例，最后一步才回到度量 | 问题域被换掉了 |
| 攻击变量 | 度量的正则性（Gevrey 阶 $s$） | 度量在一小段坐标立方里的**梯度积分**（envelope 的 $\int\lvert\nabla h\rvert$） | 从"光滑度"转到"振荡总量" |
| 指数来源 | 某个连续参数在极限处的发散速率 | 一个**乘性公比** $\zeta$ 与一个**对数迭代次数** $\theta\log k$ 的乘积 | 指数是离散的、构造性的 |
| 节点测度下界 | coarea / level-set 面积 | 符号证书：柱两端反号盘 + Lipschitz 投影 | 不需要零集正则性 |
| 特征性 | 先固定度量再找本征函数 | 先造准本征函数，再用代数把系数搬过去 | 次序颠倒 |
| 概率 | 用不上 | 高斯随机组合 + 加权成功率（无独立性） | 完全新增 |
| 单重性 | 想利用重数 | 主动把 $k^2$ 变成单特征值 | 方向相反 |
| 维数 | 一般 $n$ | $S^4\times S^1$（$n=5$），三维四维推给同伴论文 | 卡在 $S^4$ 的几何细节上 |

### 4.2 为什么会差这么多：四个我认为成立的解释

第一，**上界断言的量词是 "every eigenfunction"（introduction.tex:15-17），这决定了反例只需一个序列，而不需要任何统计性结论**。我进场时以为要推翻的是"谱的上界"，于是去找谱的坏行为（重数、聚集）。实际要推翻的是"逐函数的上界"，于是去找**单个函数的坏行为**，这立刻把问题从谱几何转向前者之外的 PDE 构造。

第二，**Yau 上界的指数 $1/2$ 是量纲结果，不是定理结果**。量纲来自"每单位体积 $O(\lambda^{n/2})$ 个盒子 $\times$ 每盒 $O(\lambda^{-(n-1)/2})$ 面积"。要破 $1/2$，必须破这个计数，也就是要在同一个波长盒子里塞进更多张节点面；而椭圆方程允许你做这件事的唯一自由度是**振幅的分布**（$e^{kh}$），并非频率本身。这就解释了为什么本篇要造一个随 $k$ 变化的包络，以及为什么 $h$ 的 $C^j$ 范数必须按 $k^{\delta(j+1)}$ 这种"多项式但指数极小"的方式长（envelopes.tex:528）。

第三，**光滑类里没有刚性的唯一连续性可用**，这既是反例的许可，也是反例的障碍。许可：Aronszajn 型唯一连续性（global.tex:537-541）在光滑正系数下仍成立，所以他们能用它做 kernel 分类；障碍：三球不等式/frequency function 在光滑类里给出的上界只能是维数依赖的多项式（LogunovUpper2018），不足以反驳任何幂律超出。于是"用高频估计去反推指数"的所有路线（我 §2.1 到 §2.3 的三条）都必须失败。

第四，**"常数与指数的分工"是被迫的，不是美学选择**。这是我和最终思路差别最大的一处。我原以为证明会有一个干净的 uniform 常数。实际上 stage 序列里 $\eta_j=\min\{2^{-j},b2^{-j-1},\min_{i<j}2^{-(j-i+1)}\varepsilon_i\}$（global.tex:748-750）意味着**每一步的容差要照顾前面所有步的 persistence 半径**，因而 $c_j$（`prop:step` 结论 (iii) 的常数）对 $j$ 的依赖可以是灾难性的。为了在一列**发散**的常数下仍然保住幂律，他们做了一次我认为是全文最冷静的支出决定：把可用的 $\gamma$ 只花一半，$\gamma\to\gamma/2$，用剩下的一半去吸收 $c_j$：

```
 c_jk_j^{\gamma/2}>j.
```
（global.tex:762），于是 $|\mathcal C_j|>j\,k_j^{1+\gamma/2}$（global.tex:766）。这里 $j$ 出现在分子上，正好提供 $\mathcal H/\lambda^{1/2+\epsilon_0}\ge c\,2^{-1/2-\epsilon_0}i\to\infty$（global.tex:882）里的发散因子。这一步的本质不在收敛速度，其全部内容是"常数要吃掉多少指数"的账目。

然后 $\epsilon_0=\gamma/4$（global.tex:734）是第二次支出：特征值只被夹在 $(k_i^2/2,2k_i^2)$（global.tex:790），于是 $\lambda_i^{1/2+\epsilon_0}\le 2^{1/2+\epsilon_0}k_i^{1+2\epsilon_0}$，要把它和 $k_i^{1+\gamma/2}$ 对齐，必须 $2\epsilon_0=\gamma/2$，即 $\epsilon_0=\gamma/4$。这个等式我验算过：$\lambda\le2k^2\Rightarrow\lambda^{1/2+\epsilon_0}\le(2k^2)^{1/2+\epsilon_0}=2^{1/2+\epsilon_0}k^{1+2\epsilon_0}$，与 global.tex:877 逐字一致。

### 4.3 三次指数支出的完整账目（这是我对本篇最实的理解）

- 原始增益指数 $\gamma=\theta\log(1+\zeta)$（envelopes.tex:635）。
- `prop:step` 消耗 $\gamma$ 一次，输出证书大小 $\ge ck^{1+\gamma}$（framework.tex:141-142）。$+1$ 来自波长盘计数：盘的半径 $R_x=(kQ_x)^{-1}$（global.tex:228），三维面积 $\sim R_x^3$，$\sum_{x\in\mathcal X_k}R_x^3\ge ck^{1+\gamma}$（global.tex:248）来自 $\int_VkQ\,\mathrm d y\le C\sum R_x^3$ 与 $\int_V\sqrt{1+|\nabla h|^2}\ge ck^\gamma$ 的对接（$Q\ge1$，故 $kQ\ge k$，而 $\sqrt{1+|\nabla h|^2}\ge|\nabla h|$ 给反向；细节见 §5 条目 12）。
- `thm:main` 消耗 $\gamma\to\gamma/2$（付给 stage 常数 $c_j$），再消耗 $\gamma/2\to\gamma/4$（付给特征值区间端点 $2k_i^2$）。净交付 $\epsilon_0=\gamma/4$。
- 而 $\gamma$ 本身被 $\delta=10^{-6}$ 从上面压住：$\theta\le\delta/C_*$，$\gamma\le(\delta/C_*)\log(1+\zeta)$。

结论：$\epsilon_0$ 的量级被一个 $10^{-6}$ 级的常数控制。论文的**宣称强度**（推翻 $\forall\epsilon>0$ 的松弛上界，eq:near-sharp-target，introduction.tex:21-25）完全不需要 $\epsilon_0$ 大，只需要它 $>0$；introduction.tex:41-42 逐字 "In particular, \eqref{eq:near-sharp-target} fails for every $0<\epsilon\le\epsilon_0$ for the metric of Theorem~\ref{thm:main}."。所以 $\epsilon_0$ 极小在逻辑上无害。但从取证角度看，**$\epsilon_0$ 没有任何数值**是这篇论文与"数值反例"之间的距离，也是我在 §7 里机器侧证据的核心。

### 4.4 维数选择 $n=5$ 的原因（我读到的三条硬证据加一条推测）

硬证据一：corrugation 的"保留一个有利方向"一步需要 $\dim-3\ge1$，envelopes.tex:431-433 逐字 "This is where base dimension four is used: in dimension $d$ the corresponding intersection lower bound is $d-3$."。基底是 $S^4$（framework.tex:5），所以 $d=4$ 是这台机器的最低维。

硬证据二：符号证书用**三维盘**（framework.tex:100-101，"closed parallel three-dimensional Euclidean disks"），柱是 $3+1$ 维；节点集在 $n$ 维流形上是 $n-1$ 维，故 $n-1=3+1$ 要求 $n=5$。

硬证据三：产品上圆 $S^1$ 是**必需的转换件**，不是为了升维。global.tex:801-807 用 warped product $g=G_\infty+q^2\mathrm d\varphi^2$，$q=\rho_\infty\mathrm d\mu/\mathrm d\operatorname{vol}_{G_\infty}$（global.tex:798），使得对 $B$ 上函数的提升有 $\Delta_g f=L_\infty f$（global.tex:818-825）。也就是说：weighted operator $L=\rho^{-1}\operatorname{div}_\mu(A\mathrm d\cdot)$ **必须**靠一个圆纤维才能变成普通 Laplace--Beltrami 算子。基底 $S^4$ 给机器供料，圆纤维把算子换回度量。

[推测] 三维四维做不出**固定幂律**的原因，我猜是同一台机器的两个瓶颈之一：要么 $d-3=0$ 使有利方向无法保留（$d=3$ 情形），要么指数兑换 $\theta\log k$ 与 $\lVert h\rVert_{C^j}\le C_jk^{\delta(j+1)}$ 的账在低维下不平。论文对 $n\le4$ 沉默（introduction.tex:47-48），同伴论文只给定性版本（introduction.tex:50-54），这与"低维幂律需要新想法"一致，但只是我的读法，不是证据。

### 4.5 我原来的问题与现在这个答案的形状差别

我进场时想回答"光滑上界为什么可能假"。现在的回答是"它假，因为**梯度积分可以在固定体积预算内以频率的幂增长**，而节点测度对梯度积分是单调的"。中间那个"节点测度对梯度积分单调"的桥，是 `eq:weighted-packing`（global.tex:243-249）与符号证书概率（`lem:signs`）合起来的，而这座桥需要概率：单调性不是逐点的，是"以正概率成立"的，然后被 $c_j\to$ 坏常数与 $\gamma/2$ 的支出吸收掉。

一个我原本完全没有想到的侧面：**反例的度量不是构造出来的显式张量；它是一个可求和极限的存在性产物**。global.tex:773-777："The increments are summable in every fixed $C^r$ norm: for all large $j$, $r_j\ge r$ and their $C^{r_j}$ norms are less than $2^{-j}$. Therefore the pairs converge to one smooth pair $\mathcal P_\infty$"。论文在 introduction.tex:123-125 也重申 "A summable iteration gives one smooth limiting pair. Adding a warped circle realizes its weighted operator as an ordinary Laplace--Beltrami operator."。所以"我们构造了一个光滑度量"（摘要第一句 "We construct a smooth Riemannian metric on $S^4\times S^1$"）里的 "construct"，其技术内容是：给定一个 Cauchy 型序列与它在每个固定 $C^r$ 范数下的几何衰减，从而极限光滑。这是构造，但不是**闭合形式**的构造。§7 会看到 Lean 侧对这件事的处理与此完全一致（存在式 witness，没有显式张量）。

## §5 逐条目四段式

约定：(a) 逐字引用，给 `文件:行号`；(b) 推导补到中间步骤；(c) 每个假设、常数、指数、阶、$\epsilon_0$ 的机械理由与被谁消费；(d) `[推测]` 候选失败路线 2 到 3 条。行号按我 Read 出来的行首编号抄，多行公式给出首末行。

### 5.1 条目 1：`thm:main`（introduction.tex:28-39）

**(a) 逐字引用。** introduction.tex:28-39：

```
\begin{theorem}\label{thm:main}
There exist a smooth Riemannian metric $g$ on $S^4\times S^1$, a number
$\epsilon_0>0$, and nonzero real smooth functions $u_j$ with positive
eigenvalues $\lambda_j$ such that
\[
 -\Delta_g u_j=\lambda_j u_j,\qquad
 \lambda_j\longrightarrow\infty,\qquad
 \frac{\Hh_g^4(\Z(u_j))}
      {\lambda_j^{1/2+\epsilon_0}}\longrightarrow\infty.
\]
The metric and $\epsilon_0$ are fixed throughout the sequence.
\end{theorem}
```

配套的松弛断言 introduction.tex:21-25：

```
\begin{equation}\label{eq:near-sharp-target}
 \Hh_g^{n-1}(\Z(u))
 \le C(M,g,\epsilon)\lambda^{1/2+\epsilon}
 \qquad\text{for every }\epsilon>0,
\end{equation}
```

**(b) 推导补全。** 定理的完整链条有八个环节，我把每一步的输入输出写清楚。

1. `prop:envelope`（envelopes.tex:520）：对固定 $G\in\mathcal G$ 与充分大的 $k$，给出 $h=h_k$ 满足三条：$\lVert h\rVert_{C^j}\le C_jk^{\delta(j+1)}$（每个固定 $j$）；$\max_{\mathrm d h(e)=0}J_h(e)\ge ck^{-\delta}$ 在 $\{t\ge1/4\}$；$\int_V\sqrt{1+|\nabla_Gh|_G^2}\,\mathrm d x\ge ck^\gamma$。
2. `prop:packets`（waves.tex:192）：对上述 $h$，对每个 $t\ge1/4$ 的中心 $z$ 给 4 个复 packet，支撑半径 $\le Ck^{-1/3-100\delta}$，残差 $\lvert D^j(L+k^2)w\rvert\le Ce^{kh}k^{-M}$（$0\le j\le J$），中心 jet 最小奇异值 $\ge ck^{-3/4}$，$k^{-10}$ 邻域内 $\ge k^{-1}$。
3. `lem:scaled-packets`（waves.tex:540）：把 $Ck^{K_1}$ 个 packet 在波长球 $R_x=(kQ_x)^{-1}$ 上统一缩放，得非尾部 $S_x\ge ce^{kh(x)}$、虚对数梯度 $\ge c$、尾部 $O(e^{-k^{1/4}})$。
4. Gaussian 组合 global.tex:83-88：$u=\beta u_*+\sum_v(g_v^{(1)}\operatorname{Re}v+g_v^{(2)}\operatorname{Im}v)$，权重 $W=e^{kh}+\beta e^{kb_N}$（global.tex:51）。
5. `lem:noncancellation`（global.tex:126）：以趋于 1 的概率 $\inf_B(|u|+|\mathrm d u|_{g_0})/W\ge k^{-500}$。
6. `lem:signs`（global.tex:215）：以至少 $p_*$ 的概率，$u$ 有大小 $\ge c_*k^{1+\gamma}$ 的符号证书。
7. `lem:correction`（global.tex:395）：显式代数校正把残差精确清零，系数变化 $\le C_Rk^{-M+2129+1088R}$。
8. `lem:simplicity`（global.tex:484）、`lem:persistence`（global.tex:635）、可求和迭代（global.tex:727-886）、圆 warping（global.tex:801-825）、柱投影（global.tex:843-869）联合交付 $\epsilon_0=\gamma/4$ 与 $\mathcal H_g^4(\Z(u_i))\ge c\,i\,k_i^{1+\gamma/2}$，配合 $\lambda_i<2k_i^2$ 得 global.tex:881-883 的

```
 \frac{\Hh_g^4(\Z(u_i))}{\lambda_i^{1/2+\epsilon_0}}
 \ge c\,2^{-1/2-\epsilon_0}i\longrightarrow\infty.
```

量词次序（我把 global.tex:727-770 的归纳读成一个前束式）：$\exists g\;\exists\epsilon_0\;\forall j\;\exists u_j\;\exists\lambda_j$，其中 $\epsilon_0$ 与 $g$ 在 $\forall j$ 之外，$u_j$、$\lambda_j$、证书 $\mathcal C_j$、容差 $r_j,\eta_j$ 在归纳第 $j$ 步内部产生。关键点是 $\epsilon_0$ 只依赖 $\gamma$（global.tex:734 定死），$\gamma$ 只依赖 `prop:envelope` 的固定 pattern（envelopes.tex:647-657），因此不随 $j$ 变。

**(c) 机械理由。**
- $\mathcal H_g^4$：$n=5$，节点集维数 $n-1=4$。$S^4\times S^1$ 的选择由 §4.4 三条硬证据决定。
- $\lambda_j\to\infty$：由 $k_j>2k_{j-1}$（global.tex:760）与 $\lambda_i\in(k_i^2/2,2k_i^2)$（global.tex:790）自动给出，且区间互不相交，所以这些 $u_i$ 属于互异特征值，规避了在重子空间里挑函数的需求。
- $\epsilon_0>0$ 固定：全部内容由 global.tex:734 的 $\epsilon_0=\gamma/4$ 与 envelopes.tex:635 的 $\gamma=\theta\log(1+\zeta)>0$ 两处供给；$\theta\log(1+\zeta)>0$ 因为 $\theta>0$（envelopes.tex:631）且 $\zeta=\eta_0/(1+\eta_0)>0$（envelopes.tex:493）。
- "nonzero real smooth functions"：real 由 Gaussian 组合的实部结构（global.tex:86-87）保证，nonzero 由 strict signs 或归一化保证（global.tex:793-794）。
- 为什么是 $1/2+\epsilon_0$ 这个形式：$1/2$ 是 Donnelly--Fefferman 标度（introduction.tex:57-58），$\epsilon_0$ 是支出后的净指数。定理只要求比值 $\to\infty$，因为这是推翻 $\forall\epsilon>0$ 断言的最小充分形式（introduction.tex:41-42 逐字："In particular, \eqref{eq:near-sharp-target} fails for every $0<\epsilon\le\epsilon_0$ for the metric of Theorem~\ref{thm:main}."）。
- 我只看到断言的地方：$\epsilon_0$ 的数值。全文没有任何一处给出 $\gamma$ 或 $\epsilon_0$ 的数值下界，也没有给 $C_*$、$\zeta$ 的数值。摘要（main.tex:74-81）与定理陈述都只写 "one fixed $\epsilon_0>0$"。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若把 $\epsilon_0=\gamma/4$ 改成 $\epsilon_0=\gamma/2$，global.tex:877 的方向会翻：此时 $\lambda^{1/2+\gamma/2}\le 2^{1/2+\gamma/2}k^{1+\gamma}$，而证书只有 $k^{1+\gamma/2}$ 级（global.tex:766），比值下界变成 $c\,i\,k_i^{-\gamma/2}$，随 $k_i$ 指数衰减，$i$ 的多项式增长无法补偿。断在 global.tex:879-883。
- `[推测]` 若 `prop:step` 的 $ck^{1+\gamma}$ 丢掉 $+1$（证书只有 $k^\gamma$ 级），则 $\mathcal H/\sqrt\lambda$ 只有 $k^{\gamma-1/2}$ 级；由于 $\gamma\le(\delta/C_*)\log(1+\zeta)$ 是 $10^{-6}$ 量级，比值随 $k\to\infty$ 趋于 0，反例整体失效。$+1$ 的物理来源是波长盘计数（global.tex:228, 248），它免费但必需。
- `[推测]` 若 stage 序列只花 $\gamma$ 不花 $\gamma/2$（令 $c_jk_j^\gamma>j$ 并保持 $|\mathcal C_j|>jk_j^{1+\gamma}$），则 $\epsilon_0$ 可取 $\gamma/2$，幂律超出翻倍；其余逻辑环节不动。要验证这一点，只需检查 global.tex:758-767 是否用了 $c_j$ 的任何上界：文本里没有上界，只有 $c_j>0$，所以 $\gamma/2$ 的支出正是为"无界坏常数"预留的。

### 5.2 条目 2：`def:certificate`（framework.tex:97-109）

**(a) 逐字引用。** framework.tex:97-109：

```
\begin{definition}\label{def:certificate}
A \emph{sign certificate} for a continuous real function $u$ in
$\Omega$ is a finite family of pairs $(D_i^-,D_i^+)$ of congruent
closed parallel three-dimensional Euclidean disks such that:
\begin{enumerate}[label=\textup{(\roman*)}]
 \item each pair is the two ends of a straight closed cylinder
 compactly contained in a Euclidean coordinate ball;
 \item these coordinate balls are pairwise disjoint;
 \item $u$ has strictly opposite signs on $D_i^-$ and $D_i^+$.
\end{enumerate}
The \emph{size} of the certificate is
$\sum_i\Hh_{\mathrm{Euc}}^3(D_i^+)$.
\end{definition}
```

**(b) 推导补全。** 定义到测度下界的推理只有两行，但依赖三个不显然的性质。

性质一（framework.tex:111-114）：证书在 $u$ 的一致小扰动下保持，因为盘紧、数目有限、号严格；乘以任意非零实常数保持。这保证后面"校正系数""取极限""整体变号"三个动作都不销毁证书。

性质二（framework.tex:115-117）：连接 $D_i^-$ 与 $D_i^+$ 对应点的每条线段含零点。把 $u$ 限制在段上用中值定理即可。

性质三（global.tex:843-860）：柱 $C_i^{(a)}$ 与圆坐标区间 $I_0$ 的乘积里，$\Z(u_i)\cap(C_i^{(a)}\times I_0)$ 在"基底坐标正投影 $\times$ 圆坐标"下映到 $D_i^{(a)}\times I_0$ 上；投影 Lipschitz 常数有统一上界 $K$（与盘半径、方向无关），于是覆盖定义给出 global.tex:857-859 的

```
 \Hh_g^4\bigl(\Z(u_i)\cap(C_i^{(a)}\times I_0)\bigr)
 \ge K^{-4}\Hh_{\mathrm{Euc}}^4(D_i^{(a)}\times I_0)
 =K^{-4}|I_0|\Hh_{\mathrm{Euc}}^3(D_i^{(a)}).
```

对各柱求和（disjoint open balls 保证 Borel 集两两不交、测度可加，global.tex:861-864）得 global.tex:866-868 的 $|\mathcal C_i|$ 下界。

Lipschitz 常数与度量无关的技术点：global.tex:837-841 说，用截断把坐标函数光滑延拓到紧流形上，其梯度在**同一个**高度量 $g$ 下一致有界。这是本篇里我第一次看到"用一个固定的高度量把一族近似度量归一化"的手法；它必需，因为 $g$ 是极限度量、没有闭合表达式。

**(c) 机械理由。**
- 盘是三维的（framework.tex:100-101）：基底维数 4，柱的纵向贡献 1 维，盘是柱的横截面，$3+1=4$ 与 $\mathcal H_g^4$ 的指标匹配。
- "Euclidean"（坐标意义）与 $\mathcal H_{\mathrm{Euc}}^3$：证书大小定义在**坐标** Euclidean 测度上，因为增益住在 Lebesgue 测度里（framework.tex:33-35）。最后一步由 $K$ 统一搬运。
- "pairwise disjoint coordinate balls"（framework.tex:103）：保证可加性；这也是 `lem:signs` 里必须先取 maximal disjoint family 再做放大覆盖的原因（global.tex:239-242）。
- size 只算 $D_i^+$ 一侧：$D_i^-\cong D_i^+$（congruent），一侧等于两侧。
- $\sigma_*$（global.tex:356，$=a'/(4H^2)$）与 $H$ 的来源：$H$ 是把 $\lVert U_x\rVert_{C^2}\le H$ 的概率调到足够大的一次性选择，$a'=1/4$、$0<c'<a'/4$（global.tex:334）；$H^{-2}$ 的幂次来自 Taylor 展开（二次项 $\le a'^2/(2H)$ 相对线性项 $a'/H$），盘的半径还要再除以梯度界，于是 $\sigma_*\propto H^{-2}$。
- 消费方：`lem:signs`（`prop:step` 结论 (iii)，framework.tex:141-142）、`lem:persistence`（global.tex:646-647 "the same certificate disks"）、`thm:main` 的 global.tex:843-869。
- 只看到断言的地方：无。定义与投影不等式我读到闭合证明。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若去掉"balls pairwise disjoint"，测度可加性断裂，global.tex:861-869 只能给重叠校正后的下界。这条路线的损失是常数级，但真正的风险在**一致性**：系数 $K^{-4}|I_0|$ 必须在 $i\to\infty$ 时固定。
- `[推测]` 若把柱的"直"（straight closed cylinder，framework.tex:102）换成测地柱，$D_i^{\pm}$ 的对应要靠指数映射，Lipschitz 常数 $K$ 要依赖盘半径与曲率项。本篇盘半径 $\le k^{-1}\to0$（global.tex:231-232），测地误差 $O(k^{-2})$ 看似可吸收；但 packet 支撑半径是 $k^{-1/3-100\delta}$（waves.tex:199）**大于** $k^{-1}$，所以 Euclidean 坐标下做柱是自由的，测地化后要重新检查柱是否离开 $\Omega$。
- `[推测]` 若只给非严格符号（$\ge0$ 与 $\le0$），零点可能全部落在同一个位置（例如 $u$ 在一个平面上恒零），投影像就没有 4 维测度。framework.tex:105 里 "strictly" 是承重的。

### 5.3 条目 3：`prop:step`（framework.tex:121-147）与其证明（global.tex:574-631）

**(a) 逐字引用。** framework.tex:121-147：

```
\begin{proposition}\label{prop:step}
There exist a $C^1$ neighborhood $\mathcal U$ of the round pair
$(g_0^{-1},1)$ among smooth positive pairs, a chart $\Omega$ as above,
and a number $\gamma>0$ with the following property.
Fix a smooth pair $(A,\rho)\in\mathcal U$, numbers
\[
 \frac14\le l_-<l_+\le\frac12,
\]
and suppose that $(A,\rho)=(g_0^{-1},1)$ on $\{t<l_+\}$.
For every integer $r\ge0$ and every $\eta>0$, there exist $c>0$ and
$N_0$ such that for every integer $N\ge N_0$, with $k$ as in
\eqref{eq:round-beam}, there are a smooth positive pair
$(\widehat A,\widehat\rho)\in\mathcal U$ and a nonzero real smooth
function $u$ satisfying:
\begin{enumerate}[label=\textup{(\roman*)}]
 \item $\|(\widehat A-A,\widehat\rho-\rho)\|_{C^r}<\eta$, and
 $(\widehat A,\widehat\rho)=(g_0^{-1},1)$ on $\{t<l_-\}$;
 \item for $\widehat L$ defined by \eqref{eq:weighted-operator},
 $-\widehat Lu=k^2u$, and $k^2$ is a simple eigenvalue of
 $-\widehat L$ on the base $B$;
 \item $u$ has a sign certificate in $\Omega$ of size at least
 $c k^{1+\gamma}$.
\end{enumerate}
The neighborhood $\mathcal U$, chart $\Omega$, and exponent $\gamma$
are common to all stages. The constant $c$ and threshold $N_0$ may
depend on the fixed input pair, $l_-,l_+,r,\eta$.
\end{proposition}
```

**(b) 推导补全。** 证明（global.tex:574-631）按七个动作排。

1. 定阶（global.tex:575-580）：给定 $(r,\eta)$，选 $R\ge\max\{r,1\}$ 与更小容差 $\eta'$，使 $C^R$ 移动 $<\eta'$ 蕴含 $C^r$ 移动 $<\eta$ 且 pair 留在 $\mathcal U$ 内。合法理由：$\mathcal U$ 开、输入点属于它（global.tex:579-580）。
2. 定精度（global.tex:582-583）：$J=R+2$，$M\ge2131+1088R$。这两个数来自 `lem:correction`：校正的 $C^R$ 大小指数是 $-M+2129+1088R$（global.tex:411），要让它 $\le-2$（好在取 $k$ 时再花 $\eta'/2$）就要 $M\ge2131+1088R$；$J=R+2$ 因为校正公式对 $u$ 要 $R+2$ 阶导数（global.tex:403）。
3. 取样（global.tex:584-587）：`lem:noncancellation` 与 `lem:signs` 同时实现（global.tex:379-391 的概率相减），得一个样本 $u$ 满足一阶 jet 下界、残差界与证书 $c_*k^{1+\gamma}$。
4. 校正（global.tex:587-590）：`lem:correction` 改 pair 至多 $C_Rk^{-2}$（$C^R$），保住同一个 $u$；取 $k$ 大到 $C_Rk^{-2}<\eta'/2$。
5. collar 预算（global.tex:591-606）：packet 支撑避免 $t<s_1-Ck^{-1/3-100\delta}$（global.tex:594 与 eq:untouched-region）；要求 $Ck^{-1/3-100\delta}<w/100$ 与 $cw k>(M'+P)\log k+\log C_q(w)$（global.tex:595-599）。第二条是"指数衰减吃掉对数精度"，其中 $\log C_q(w)$ 显式记录 collar 宽度 $w$ 进入**常数与阈值**，并非指数。
6. 单重化（global.tex:608-621）：在子 collar $l_-+w/20<t<l_-+w/10$（global.tex:609-611）里挑 $\sin(N\vartheta)\ne0$ 的点，验 $\mathrm d u,\mathrm d t$ 独立，套 `lem:simplicity`，取 $\tau$ 使 $\lVert\tau E\rVert_{C^R}<\eta'/2$。
7. 交付（global.tex:623-630）：逐条对上 (i)(ii)(iii)，强调 $\gamma$、chart、邻域在上游已固定，"The construction works for every sufficiently large integer $N$"。

**(c) 机械理由。**
- $\mathcal U$ 是 $C^1$ 邻域（framework.tex:122, 144）：`lem:corrugation` 与 `lem:seed` 的所有度量比较只用 $C^1$（envelopes.tex:75-77："all metric and gradient comparisons use only $C^1$ bounds"）。邻域开在 $C^1$ 拓扑里就够；更高阶导数只进入**常数**（framework.tex:29-30："Higher derivative bounds need only be finite for each fixed input pair"）。这是全套件能过极限的原因。
- $\tfrac14\le l_-<l_+\le\tfrac12$（framework.tex:127）：$\{t<1/2\}$ 是 seed 的 $h_0=-a_*t$ 区域（envelopes.tex:23），也是 beam 公式 $u_*=(1-t)^{N/2}\cos(N\vartheta)$ 的生效区（framework.tex:79-83）；$\{t\ge1/4\}$ 同时是 `lem:seed` 的 Hessian 正性区（envelopes.tex:24）与 `prop:packets` 的中心条件（waves.tex:195）。collar 必须住在 $[1/4,1/2]$ 内才能同时供 seed、beam、corrugation 三方。$l_+-l_-=w>0$（global.tex:21）是后面所有阈值的分母。
- $k=\sqrt{N(N+3)}$（framework.tex:69）：round $S^4\subset\R^5$ 上 $-\Delta_{g_0}$ 的谱是 $\ell(\ell+3)$，取 $\ell=N$。$u_*=\operatorname{Re}(x_1+ix_2)^N$ 是 $\R^5$ 里 $N$ 次调和齐次多项式的限制，framework.tex:72-78 用 $\Delta_{\R^5}=\partial_r^2+\tfrac4r\partial_r+\tfrac1{r^2}\Delta_{g_0}$ 验证：齐次调和给出 $\Delta_{\R^5}u_*=0$，而 $\partial_r^2(r^NP_N)=N(N-1)r^{N-2}P_N$、$\tfrac4r\partial_r=N\cdot4r^{N-2}P_N$，合起来 $\tfrac1{r^2}\Delta_{g_0}u_*=-N(N+3)r^{N-2}P_N$，即 $-\Delta_{g_0}u_*=N(N+3)u_*$。$N>1$（framework.tex:67）被 `lem:simplicity` 的 $b''(u)=0$ 推理消费（global.tex:530-532）。
- (iii) 的 $ck^{1+\gamma}$：由 `lem:signs` 直接给（global.tex:220, 248），$+1$ 来自 $\sum R_x^3\ge ck^{1+\gamma}$，见 §5.13。
- (i) 里 "$=\mathrm{round}$ on $\{t<l_-\}$"：让下一 stage 的 $l_+$ 可取本 stage 的 $l_-$，collar 因此单调收缩（global.tex:733, 737 "Every output is round on $t<l^{(j)}$"）。
- (ii) 的 simple：唯一消费者是 `lem:persistence`（global.tex:636-647），需要单重才能挑连续分支并给有限范数闭球。
- $\gamma$、$\Omega$、$\mathcal U$ "common to all stages"（framework.tex:144-145）：本篇的枢纽条款，保证 stage 序列有共同指数预算。
- 只看到断言的地方：(ii) 的单重性依赖 `lem:simplicity` 的反证式论证（弱紧 + Aronszajn），它给的是"存在 $\tau_0$ 使所有 $\tau\in(0,\tau_0)$ 单重"（global.tex:548-569），而 $\tau_0$ 无界依赖 $k$（global.tex:617-619 明写："This tensor can have large finite derivatives depending on $k$; the subsequent scalar choice of $\tau$ absorbs them."）。$\tau_0$ 的下界没有给出，我认为这是诚实的，因为它只需存在。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $J<R+2$，`lem:correction` 里 $D^q\mathcal D$（含 $|\mathrm d u|^2$，需要 $u$ 的二阶导）无法在 $C^R$ 内估计，global.tex:443 的界失效，断在 §5.14 的 (b) 第一步。
- `[推测]` 若省略第 5 步的 collar 预算，`prop:step` 就不能在 stage 序列里重复使用，因为 global.tex:733 的 $l^{(j)}=1/4+2^{-j-2}$ 使 $w_j=l^{(j-1)}-l^{(j)}=2^{-j-3}\to0$。论文用 $c_0$ 可独立于 collar 固定（global.tex:41 "where $c_0$ can be fixed independently of the collar"）加 global.tex:591-606 显式写明"窄 collar 只改变频率阈值"来防这一手。若省略，$N_0$ 随 $j$ 爆炸，进而 $k_j>2k_{j-1}$（global.tex:760）与 $c_jk_j^{\gamma/2}>j$ 无法同时满足。
- `[推测]` 若把 $\mathcal U$ 从 $C^1$ 邻域放宽成 $C^0$ 邻域，`lem:seed` 的 Hessian 测试在扰动下不再保持（envelopes.tex:73-81），$J_h$ 的正性可被打穿，`prop:packets` 的局部化（waves.tex:414-417）随之失效。$C^1$ 是最低要求。

### 5.4 条目 4：`lem:seed`（envelopes.tex:16-31）

**(a) 逐字引用。** envelopes.tex:16-31：

```
\begin{lemma}\label{lem:seed}
There are a number $a_*>0$, a smooth real function $h_0$ on $B$, a
$C^1$ neighborhood $\mathcal G$ of $g_0$ among smooth metrics, and a
coordinate chart $\Omega\subset\{t>1/2\}$ with open sets
$U_0\Subset V\Subset\Omega$ such that the following assertions hold
uniformly for $G\in\mathcal G$:
\begin{enumerate}[label=\textup{(\roman*)}]
 \item $h_0=-a_*t$ on $\{t\le1/2\}$;
 \item $\max_e J_{h_0}(e)\ge c_0>0$ on $\{t\ge1/4\}$;
 \item on $U_0$, the Hessian of $h_0$ is positive definite with a
 uniform positive lower bound, and
 $0<s_{\min}\le|\nabla_Gh_0|_G\le s_{\max}$.
\end{enumerate}
The maximum in \textup{(ii)} is over all admissible tests, including all
unit vectors when $\dd h_0=0$.
\end{lemma}
```

**(b) 推导补全。** 证明分五段。

第一段（envelopes.tex:34-51）：从 $\widetilde h=-a_*t$ 出发，$t=|y|^2$，$y\in\R^3$。`eq:seed-identities`（envelopes.tex:36-41）给 $|\nabla_{g_0}\widetilde h|_{g_0}^2=4a_*^2t(1-t)$ 与 $\nabla^2_{g_0}\widetilde h=2a_*(tg_0-\mathrm d y\cdot\mathrm d y)$。我补这两式的来源：在单位球上 $\nabla_{\R^5}t=2y$，切向投影为 $2y-2t\,x$，其平方长 $4|y|^2-4t^2=4t(1-t)$（用 $|x|=1$、$\langle x,y\rangle=t$）。Hessian 方面 $\nabla^2_{\R^5}t=2I$，限制到球面后与 $2(tg_0-\mathrm d y\mathrm d y)$ 在同一基下特征值一致，范数 $\le2a_*$。

$\mathrm d y:T_xB\to\R^3$ 的核非零（envelopes.tex:42-44，理由是定义域 4 维）。取 round 单位 $e\in\ker\mathrm d y$：$\mathrm d{\widetilde h}(e)=0$，$\nabla^2\widetilde h(e,e)=2a_*t$。于是不等式链（envelopes.tex:48-50）为

```
 J_{\widetilde h}(e)\ge a_*/2-2a_*^3\ge a_*/4
```

中间步骤我补出：$J=(\nabla^2\widetilde h)(p/Q,p/Q)+(\nabla^2\widetilde h)(e,e)$，第二项 $\ge2a_*(1/4)=a_*/2$；第一项 $\ge-\lVert\nabla^2\widetilde h\rVert\cdot|p|^2/Q^2\ge-2a_*\cdot|\nabla\widetilde h|^2$，而 $|\nabla\widetilde h|^2=4a_*^2t(1-t)\le a_*^2$（因 $\max_t 4t(1-t)=1$），故第一项 $\ge-2a_*^3$。取 $a_*^2\le1/8$ 得 $-2a_*^3\ge-a_*/4$。合计 $\ge a_*/4$。

第二段（envelopes.tex:53-61）：$t=1$ 处 $\nabla\widetilde h=0$、Hessian 特征值 $2a_*,2a_*,0,0$。我补：$t=1$ 时 $x=(0,0,y)$、$|y|=1$，切空间 $T_xS^4=\{v:\langle v,y\rangle=0\}$（4 维），$\mathrm d y$ 在其上秩为 2（核是 $\R^3$ 中正交于 $y$ 的 2 维子空间），所以 $tg_0-\mathrm d y\mathrm d y=g_0-\mathrm d y\mathrm d y$ 在该核上等于 $g_0$（两个方向特征值 $2a_*$）、在其正交补上为 0。加 $\varepsilon|\xi|^2/2$ 截断扰动后，$x_*$ 处 Hessian 正定。

第三段（envelopes.tex:63-71）：截断区保留测试。扰动后 Hessian 两特征值 $\ge ca_*$、范数 $\le Ca_*$、$|\nabla h_0|$ 小到 $Ca_*|\nabla h_0|^2<ca_*/2$。正二维平面与 $\ker\mathrm d h_0$（3 维）在 4 维空间交维数 $\ge2+3-4=1$；取其中单位向量 $e$，$(\nabla^2h_0)(e,e)\ge ca_*$，第一项 $\ge-\lVert\nabla^2h_0\rVert|p|^2/Q^2\ge-Ca_*|\nabla h_0|^2>-ca_*/2$（用 $|p|/Q\le|\nabla h_0|$）。故 $J_{h_0}(e)\ge ca_*/2$。$\mathrm d h_0=0$ 时所有单位向量都是允许测试（envelopes.tex:29-30 与 44），临界点自动覆盖。

第四段（envelopes.tex:73-81）：$C^1$ 稳定性；两个度量的 Hessian 差 = 联络差缩微分；$\mathrm d y(e)=0\Rightarrow\mathrm d h_0(e)=0$ 与度量无关。

第五段（envelopes.tex:82-90）：取 $U_0$ 使 Hessian 正定且梯度离零有距，$U_0\Subset V\Subset\Omega\subset\{t>1/2\}$，且 $U_0$ 避开 $x_*$。

**(c) 机械理由。**
- $a_*$ 的唯一显式约束是 $a_*^2\le1/8$（envelopes.tex:51），来自 $-2a_*^3$ 要小过 $2a_*t\ge a_*/2$ 的一半。它被 global.tex:35-41 二次消费：$\frac{\mathrm d}{\mathrm d t}(h-b_N)=-a_*+\frac{N}{2k(1-t)}$，而 $k=\sqrt{N(N+3)}<N+3/2$ 使 $\frac{N}{2k}>\frac{N}{2N+3}\ge1/5$（$N\ge1$），$1/(1-t)\ge1$ 于 $t\le1/2$；要此差 $\ge c_0>0$ 只需 $a_*<1/5$。故 $a_*$ 同时受 $1/8$（即 $a_*\le0.3535$）与 gluing 单调两个约束，取小者。这个"小种子斜率"是整个 gluing 能单调的前提（global.tex:35 原文："For the fixed sufficiently small seed slope $a_*$ and all sufficiently large $N$"）。
- $c_0$（envelopes.tex:24）：`prop:envelope` 的 margin $ck^{-\delta}$ 经过 $m$ 代衰减后的种子下界（envelopes.tex:624-627），最终被 `lem:phase-hessian` 的 $J'\ge k^{-2\delta}$ 消费（waves.tex:62）。
- $s_{\min},s_{\max}$（envelopes.tex:27）：$s_{\min}>0$ 是 `lem:corrugation` 的 prepared 条件 $|\nabla h|>0$（envelopes.tex:101）在 $U_0$ 上的保证（envelopes.tex:124-127），也是初始质量 $I_0>0$ 的来源（envelopes.tex:575-576）；$s_{\max}$ 约束每代中心斜率上界（envelopes.tex:584-585）。
- $\mathcal G$ 是 $C^1$ 邻域（envelopes.tex:18, 21）：与 §5.3 同理，且是 `prop:envelope` 一致性的来源（envelopes.tex:551-553）。
- $\Omega\subset\{t>1/2\}$：使 corrugation 全在 $t>1/2$，$h_0=-a_*t$ 在 $t\le1/2$ 不被破坏；$b_N$ 的归一化 $h(s_2)=b_N(s_2)$ 因此无歧义（global.tex:31-32）。
- 消费方：`lem:corrugation`（初始 prepared cube）、`prop:envelope`（$I_0$ 与 margin）、`prop:packets`（gap 前提）、global.tex:34-41（gluing 单调）。
- 只看到断言的地方：envelopes.tex:65 的 $ca_*$、$Ca_*$ 中 $c,C$ 未指定；envelopes.tex:84-85 关于 $h_0$ 非常值的论证我读到，但 $U_0$ 的具体位置没给出。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $a_*$ 不取小（例如 $a_*=1$），$-2a_*^3$ 反噬 $2a_*t$，(ii) 的正性在 $t$ 接近 $1/4$ 处崩，`prop:packets` 需要的 $J'\ge k^{-2\delta}$ 失去来源，断在 waves.tex:62-63 与 global.tex:41。
- `[推测]` 若不在 $t=1$ 加 $\varepsilon|\xi|^2/2$，(iii) 的正定 Hessian 无处安放，`lem:corrugation` 需要的两维有利平面 $E\subset\ker\mathrm d h$（envelopes.tex:103-106）可能在某些点降到 1 维；而 envelopes.tex:412-415 的 $2+2-3=1$ 相交论证要求两个平面各有 2 维。
- `[推测]` 若 $\Omega$ 不限于 $\{t>1/2\}$，seed 区与 corrugation 区重叠，$h$ 在 $t\le1/2$ 上不再是仿射 $-a_*t+c$，global.tex:26-28 的 $b_N$ 定义与 global.tex:36-41 的单调性都要重证。

### 5.5 条目 5：`lem:corrugation`（envelopes.tex:131-169）与其证明

**(a) 逐字引用。** 陈述 envelopes.tex:131-169（原文照抄，含原文的双句点排版）：

```
\begin{lemma}\label{lem:corrugation}
Under fixed ellipticity and $C^1$ metric bounds in the coordinate
patch, there are constants $C_{\mathrm p}^*>0$,
$c_{\mathrm p}^*>0$ and $\zeta>0$ with the following property.
For any $C_{\mathrm p}\ge C_{\mathrm p}^*$ and
$0<c_{\mathrm p}\le c_{\mathrm p}^*$, one may choose a sufficiently
small reciprocal integer $\nu>0$, once and for all, such that every
prepared cube $P$ at scale $S\le1$ admits a smooth modification
$v=h+w$, with $w$ supported in the interior of $P$, satisfying:
 \item for fixed constants $0<\alpha\le1\le\beta$ and $c>0$,
  \alpha|\nabla h|\le|\nabla v|\le\beta|\nabla h|,
  \qquad
  \max_eJ_v(e)\ge c|\nabla h|/S
  \quad\hbox{on }P;
 \item writing $\ell=\nu^2S$, some cubes in the partition of $P$
 into cubes of side $\nu\ell$ are prepared for $v$ at scale $\ell$
 with the same constants in \eqref{eq:preparation}, and their union
 $\mathcal R_P$ satisfies
  \int_{\mathcal R_P}|\nabla v|\,\dd x
  \ge(1+\zeta)\int_P|\nabla h|\,\dd x;
 \item if $s=|\nabla h(x_P)|$ at the center $x_P$ of $P$, then for
 every integer $j\ge0$,
  \|D^jw\|_{L^\infty(P)}\le C_j s\ell^{1-j}.
All constants are uniform over prepared functions and cubes and over
the stated class of metrics.  They may depend on the fixed pattern,
preparation constants, and final choice of $\nu$.  No derivative of
the input $h$ beyond its prepared second-derivative bound is used.
The pattern and $\zeta$ are chosen before the preparation constants
and the final $\nu$; increasing $C_{\mathrm p}$ or decreasing
$c_{\mathrm p}$ only requires taking $\nu$ smaller.
```

`eq:preparation` 逐字（envelopes.tex:99-108）：

```
\begin{equation}\label{eq:preparation}
 \begin{gathered}
 |\nabla h|>0,\qquad
 |\nabla^2h|\le C_{\mathrm p}|\nabla h|/S,\\
 \text{at each point there is a two-plane }
 E\subset\ker\dd h\text{ such that }
 J_h(e)\ge c_{\mathrm p}|\nabla h|/S
 \quad(e\in E,\ |e|=1).
 \end{gathered}
\end{equation}
```

**(b) 推导补全。** 证明有八个动作，我逐个补中间步骤。

动作 1（envelopes.tex:180-216，周期井）：选 $F$ 在 $[0,1]$ 上正、$v=0$ 附近等于 $v$、$v=1$ 处平；单位立方内放有限个闭包两两不交的球，半径 $R_i$。球内 $\psi(r)=-\int_r^{R_i}F(q/R_i)\mathrm d q$、$f(r)=F(r/R_i)$、$u_0(r)=f(r)/r$。`eq:well-identities`（envelopes.tex:194-199）：$\nabla\psi=f\sigma$，$D^2\psi=f'\sigma\otimes\sigma+u_0(I-\sigma\otimes\sigma)$，$f^2|f'|\le Cu_0$，$f^2\le Cu_0$。我核对：径向 Hessian 的标准分解是 $D^2\psi=\psi''\sigma\otimes\sigma+\psi'(I-\sigma\otimes\sigma)/r$；$\psi'(r)=-F(r/R_i)=-f$，符号与文中 $\nabla\psi=f\sigma$ 相差一个约定（文中把井取成径向上升，即 $\psi$ 递增；$\psi(R_i)=0$ 而 $\psi(r)<0$ 在内，故 $\nabla\psi$ 指向心，$f\sigma$ 的写法是把 $\sigma$ 取为指向中心的单位向量，或者把 $-\int_r^{R_i}$ 读作 $\int_{R_i}^{r}$。这是符号约定，不影响 $D^2\psi$ 的两个系数结构）。$f^2|f'|/u_0=vF(v)|F'(v)|$（envelopes.tex:202-204）与 $R_i$ 无关；$f^2/u_0=R_ivF(v)$ 由有界半径控制（envelopes.tex:205）。中心处 $\psi=$ 常数 $+r^2/(2R_i)$（envelopes.tex:190-191）给光滑性，$u_0$ 在中心取 $1/R_i$；$f'=u_0$ 于中心（envelopes.tex:211），所以 $\sigma$ 任取。

动作 2（envelopes.tex:217-241，公比预算）：$\mathcal W(a)=3\int_0^1v^2\sqrt{1+a^2F(v)^2}\mathrm d v>1$（envelopes.tex:220）。我补 3 的来源：单位球 $\{|\zeta|\le1\}\subset\R^3$ 的体积 $\tfrac43\pi$、面积元 $v^2$ 归一化后 $3\int_0^1v^2(\cdot)\mathrm d v$ 正是球平均，故 $\mathcal W$ 是"井上的平均梯度因子"。严格 $>1$ 因为 $\sqrt{1+a^2F^2}>1$ 在正测度集上。$\eta_0=(\mathcal W-1)/8$（envelopes.tex:221）、$\varpi\mathcal W>1+6\eta_0$（envelopes.tex:224-226）、$C_{\mathrm{core}}>\varpi\mathcal W-\eta_0>1+5\eta_0$（envelopes.tex:238-241）、$qC_{\mathrm{core}}>C_{\mathrm{core}}-\eta_0>1+4\eta_0$（envelopes.tex:243-245）。存在性（envelopes.tex:227-233）："fill a fixed positive fraction of any remaining open set by finitely many closed grid cubes lying inside it, and put a ball with strictly smaller radius than the inradius in each cube"，有限次重复使未覆盖体积任意小。

动作 3（envelopes.tex:254-273，父立方归一）：仿射坐标 $z=(z_1,z')$ 以 $x_P$ 为中心、度量在中心 Euclidean、$\nabla h(x_P)=s\partial_{z_1}$。由 $|D(\mathrm d h)|\le C|\mathrm d h|/S$ 与段长 $O(\nu S)$ 积分得 `eq:parent-normalization`：$\mathrm d h/s=\mathrm d z_1+O(\nu)$，$(G_{ij})_z=I+O(\nu)$，$|\nabla h|/s=1+O(\nu)$。

动作 4（envelopes.tex:275-289，corrugation 公式）：`eq:corrugation-formula` $v=h+s\ell a\chi\psi(z'/\ell)$，$\ell=\nu^2S$。`eq:new-gradient`：$\mathrm d v/s=\mathrm d z_1+a\chi f\sigma\cdot\mathrm d z'+O(\nu)$。我验算：$\partial_{z'}(s\ell a\chi\psi(z'/\ell))=s\ell a\chi\cdot(\psi'(\cdot)/\ell)=sa\chi f\sigma$（把径向梯度写成 $f\sigma$），除以 $s$ 得 $a\chi f\sigma\cdot\mathrm d z'$，加上 $O(\nu)$ 的父梯度误差与截断项，吻合。

动作 5（envelopes.tex:291-381，Hessian 检验）：$D=\nabla v/\sqrt{1+|\nabla v|^2}$，$\mathcal F=\{e:\mathrm d v(e)=0,\ \sigma\cdot e'=0\}$，两个线性条件由 `eq:new-gradient` 独立，故 $\dim\mathcal F=2$（envelopes.tex:297-299）。`eq:test-components`：$|e'|^2\ge\tfrac12$、$|\sigma\cdot D'|\le C_0a\chi f+C\nu$。新贡献主项（除以 $s/\ell$）$=a\chi[f'(\sigma\cdot D')^2+u_0(|\Pi_\sigma D'|^2+|e'|^2)]\ge a\chi[\tfrac12u_0-|f'|(2C_0^2a^2\chi^2f^2+C\nu^2)]$（这里用了 $(\sigma\cdot D')^2\le 2C_0^2a^2\chi^2f^2+C\nu^2$ 与 $f'<0$ 时的最坏情形，以及 $|\Pi_\sigma D'|^2+|e'|^2\ge|e'|^2\ge\tfrac12$；envelopes.tex:322 只写结果）。振幅处第二条约束 $2C_0^2a^2\sup_vvF(v)|F'(v)|\le1/4$ 使主项 $\ge a\chi u_0/4-Ca\nu^2\chi|f'|$。误差三类与 `eq:vanishing-coefficient` 的统一处理见我 §3.1 附近；最终 `eq:corrugation-hessian-error`：$\frac\ell s[\nabla^2(v-h)(D,D)+\nabla^2(v-h)(e,e)]\ge c_aX-\varepsilon(\nu)(X+\nu^2)$，$X=\chi u_0$。我补这条引理的证明：$X\ge\tau$ 时 $\nu^2b/(X+\nu^2)\le\nu^2\sup b/\tau$；$X<\tau$ 时 $\le\sup_{X<\tau}b$，随 $\tau\downarrow0$ 趋零（用 $b$ 连续、$b=0$ 于 $\{X=0\}$、参数空间紧）。

动作 6（envelopes.tex:383-433，处处保住一个方向）：旧 Hessian 除以 $s/\ell$ 后范数 $O(\nu^2)$（因 $\lVert\nabla^2h\rVert\le C_{\mathrm p}s/S$ 而 $\ell/S=\nu^2$）。分两情形。$X/\nu^2\to\infty$：新有利方向支配一切。$X/\nu^2$ 有界：$\chi f\le C\sqrt X=O(\nu)$（用 $\chi f\le C\sqrt{\chi u_0}$，envelopes.tex:367），故 $|\nabla v-\nabla h|\le\varepsilon_1|\nabla h|$、$\varepsilon_1=O(\nu)$；`eq:normalized-gradient-stability`：$|T(q)-T(p)|\le\varepsilon_1|p|/\sqrt{1+|p|^2/4}\le2\varepsilon_1$（$T(p)=p/\sqrt{1+|p|^2}$；证明：段上不出 $|p|/2$ 球，故分母下界，再用中值定理）。取度量正交旋转 $R=I+O(\varepsilon_1)$ 把 $\ker\mathrm d h$ 送到 $\ker\mathrm d v$；在 3 维的 $\ker\mathrm d v$ 内 $RE$ 与 $\mathcal F$ 各 2 维，交 $\ge2+2-3=1$。旧贡献在归一单位下 $\ge\tfrac12c_{\mathrm p}\nu^2$（$c_{\mathrm p}|\nabla h|/S$ 乘 $\ell/s$ 再乘 $1/2$，即 $c_{\mathrm p}\ell/(2S)=c_{\mathrm p}\nu^2/2$），新贡献 $\ge-o(\nu^2)$，统一 margin $c_{\mathrm p}\nu^2/8$。envelopes.tex:431-433：这一步用了基底维数 4，"$d$ 维时相交下界是 $d-3$"。

动作 7（envelopes.tex:435-495，重选区域与质量）：$\chi=1$ 且 $z'/\ell$ 落在 core 球的点满足 $J_v(e)\ge c's/\ell$、$|\nabla^2v|\le(C'+O(C_{\mathrm p}\nu^2))s/\ell$；取 $C_{\mathrm p}^*,c_{\mathrm p}^*$ 使该区域在尺度 $\ell$ 上 prepared（$O(C_{\mathrm p}\nu^2)$ 在 $C_{\mathrm p}$ 固定后被吸收，envelopes.tex:453-454）。选出完全含在此开区域的闭子立方（envelopes.tex:456-459）。两层 $O(\nu)$ 损失：周期胞与子立方网格不对齐（相对体积 $O(\ell/(\nu S))=O(\nu)$，envelopes.tex:464-467）；只取整子立方丢的宽度 $O(\nu\ell)$ 层（envelopes.tex:467-471）。质量比（envelopes.tex:474-495）：$\frac{1}{s|P|}\int_{\mathcal R_P}|\nabla v|\ge qC_{\mathrm{core}}-C\nu$，$\frac{1}{s|P|}\int_P|\nabla h|\le1+C\nu$；两个误差各 $\le\eta_0$，商 $>(1+3\eta_0)/(1+\eta_0)=1+\frac{2\eta_0}{1+\eta_0}\ge1+\zeta$，$\zeta=\eta_0/(1+\eta_0)$。我核对：分子 $\ge(1+4\eta_0)-\eta_0=1+3\eta_0$，分母 $\le1+\eta_0$，商减 1 为 $\frac{2\eta_0}{1+\eta_0}$，确实 $\ge\zeta$。所以 $(1+\zeta)$ 是保守记法，实际公比可到 $1+2\zeta$。

动作 8（envelopes.tex:497-515，导数与选择次序）：`eq:corrugation-derivatives` 来自对 `eq:corrugation-formula` 求导。我验算 $q$ 个导数落在 $\chi$ 上的因子：$s\ell(\nu S)^{-q}\ell^{-(j-q)}$；由 $\ell=\nu^2S$ 得 $S=\ell/\nu^2$，故 $(\nu S)^{-q}=(\ell/\nu)^{-q}=\nu^q\ell^{-q}$，于是总因子 $=s\ell\cdot\nu^q\ell^{-q}\cdot\ell^{q-j}=s\ell^{1-j}\nu^q\le s\ell^{1-j}$（$\nu\le1$），与 envelopes.tex:500-504 逐字一致。选择次序：$F$ 与 $a$、然后打包/core/截断（带 `eq:repeat-slack` 裕度）、然后 $C_{\mathrm p}$ 大与 $c_{\mathrm p}$ 小、最后 $\nu$。

**(c) 机械理由。**
- $\nu$ 是倒整数：使父立方被 $\nu\ell$ 子立方**精确**分割（envelopes.tex:457-458）。这不是审美，是让"只取整子立方"的损失按层宽 $O(\nu\ell)$ 可计。
- $\ell=\nu^2S$（，并非 $\nu S$）：子一代尺度是父尺度的 $\nu^2$，截断 $\chi$ 在父尺度 $\nu S$ 上变化，$\ell/(\nu S)=\nu$ 是 corrugation 周期相对截断宽度的比。这个 $\nu^2$ 让两个 $\nu$ 幂同时可用：梯度比较误差 $O(\nu)$，而截断与联络误差在除以 $s/\ell$ 后也是 $O(\nu)$。若 $\ell=\nu S$，两尺度合一，无法分别压制（见 (d) 第二条）。
- $C_{\mathrm p}\ge C_{\mathrm p}^*$、$c_{\mathrm p}\le c_{\mathrm p}^*$ 的方向：大 $C_{\mathrm p}$ 与小 $c_{\mathrm p}$ 都让 prepared 类**变大**；引理要求"增大 $C_{\mathrm p}$ 或减小 $c_{\mathrm p}$ 只需 $\nu$ 更小"（envelopes.tex:166-168），即类扩张时 $\zeta$ 不变。这是 `prop:envelope` 能同时调两常数（envelopes.tex:548-550）的依据。
- $\alpha,\beta$：来自 `eq:new-gradient` 与 `eq:normalized-gradient-stability` 的上下界，$\beta$ 控制每代最大梯度膨胀（envelopes.tex:580-583），$\alpha$ 控制最小梯度衰减（envelopes.tex:582-583）。$C_*$ 由 $\log\beta$、$(j-1)_+|\log r|$（$r=\nu^2$）与常数 1 组合（envelopes.tex:603-607）。
- "No derivative of the input $h$ beyond its prepared second-derivative bound is used"（envelopes.tex:164-165）：让引理在 $G$ 只有 $C^1$ 界时成立，是"指数与 $C^r$ 容差解耦"的第二根支柱。
- 只看到断言的地方：envelopes.tex:231-233 的"有限次重复使未覆盖体积任意小"我读到构造，但达到 $\varpi$ 所需球数没有上界；envelopes.tex:471-472 "The constants may involve the smallest radius in the finite fixed packing" 是断言加理由，量化依赖未给出。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若把井从 3 个横向变量降到 2 个（只用一个有利方向），$D^2\psi$ 的负径向贡献 $f'\sigma\otimes\sigma$ 无法在 $|e'|^2\ge\tfrac12$ 下被 $u_0$ 项吃掉，动作 5 的主项估计失败；同时 $\mathcal F$ 的定义要靠 $\sigma\cdot e'=0$ 这条额外条件才有 $\dim=2$，去掉后 $2+2-3=1$ 变成负数，动作 6 崩塌。
- `[推测]` 若 $\ell=\nu S$，周期与截断同阶，`eq:corrugation-hessian-error` 里的 $\varepsilon(\nu)(X+\nu^2)$ 无法同时吸收 pure cutoff 项 $C\nu^2|\psi||D^2_{\mathrm{sc}}\chi|$ 与联络项 $C\ell(\chi f+\nu)$；断在 envelopes.tex:367-372 的 $\frac{\ell(\chi f+\nu)}{X+\nu^2}\le C\frac{\nu^2\sqrt X}{X+\nu^2}+\nu\le C'\nu$，其中显式用到 $\ell\le\nu^2$。
- `[推测]` 若用无限打包（稠密可数球列）以取 $\varpi\to1$，$C_{\mathrm{core}}$ 的下界依赖最小半径，envelopes.tex:471-472 的常数随 $\nu$ 发散，$\zeta$ 不再固定。文中在 envelopes.tex:227-228 特意写 "To see this without requiring an infinite packing in the construction"，说明这条路线被考虑并放弃。

### 5.6 条目 6：`prop:envelope`（envelopes.tex:520-545）

**(a) 逐字引用。** envelopes.tex:520-545（`eq:envelope-bounds` 的三行按原文 `gathered` 排布，我把换行照抄）：

```
\begin{proposition}\label{prop:envelope}
After fixing the data of Lemma~\ref{lem:seed} and possibly shrinking
$\mathcal G$, there are common constants $\gamma>0$ and $c>0$
with the following property.  For every smooth $G\in\mathcal G$
and all sufficiently large $k$, there is a smooth real envelope
$h=h_k$ on $B$ such that $h=-a_*t+c_k$ on $\{t\le1/2\}$ and
\begin{equation}\label{eq:envelope-bounds}
 \begin{gathered}
  \|h\|_{C^j}\le C_j k^{\delta(j+1)}
  \quad\text{for every fixed integer }j\ge0,\\
  \max_{\substack{|e|_G=1\\\dd h(e)=0}}J_h(e)
       \ge c k^{-\delta}\quad\text{on }\{t\ge1/4\},\qquad
  \int_V\sqrt{1+|\nabla_Gh|_G^2}\,\dd x\ge c k^\gamma.
 \end{gathered}
\end{equation}
Here $\delta=10^{-6}$, and the chart $\Omega$ and region
$V\Subset\Omega$ are fixed.  All corrugations are supported in
one fixed initial cube compactly contained in $V$.
The constants $c_k$ may be any bounded prescribed real numbers.
The exponent $\gamma$ and all construction parameters are
independent of derivative orders, subsequent accuracy requirements,
and round gluing collars.  Constants $C_j$ may depend on the order,
the fixed smooth metric and coordinate systems, and the bound for
$|c_k|$; no uniform bound as $j\to\infty$ is asserted.
\end{proposition}
```

**(b) 推导补全。** 六步。

1. 参数选取（envelopes.tex:548-553）：$C_{\mathrm p}$ 大、$c_{\mathrm p}$ 小同时满足 `lem:corrugation` 与 seed preparedness；$\nu$ 小到既满足该引理又使固定立方 $P_0$（边 $\nu$）闭包落在 $U_0$；置 $r=\nu^2$。
2. 迭代（envelopes.tex:555-563）：$\mathcal P_0=\{P_0\}$；第 $i$ 代对每个 $P\in\mathcal P_{i-1}$ 用父尺度 $S_i=r^{i-1}$，得 $h_i$；选中子立方 $\mathcal P_i$ 边长 $\nu r^i$、在尺度 $r^i$ prepared。扰动支在父内部 $\Rightarrow$ 每个 $h_i$ 光滑，$P_0$ 外不动。
3. 质量（envelopes.tex:565-576）：$I_i=\sum_{P\in\mathcal P_i}\int_P|\nabla h_i|$，`eq:iterated-mass` 给 $I_i\ge(1+\zeta)I_{i-1}$ 与 $\int_V\sqrt{1+|\nabla h_i|^2}\ge I_i\ge I_0(1+\zeta)^i$。
4. 导数账（envelopes.tex:578-609）：最大梯度 $\le$ const$\cdot\beta^i$；$P_0$ 内每点梯度 $\ge s_{\min}\alpha^i$（"a point is changed at most once per generation"）；第 $i$ 代父中心斜率 $\le C\beta^{i-1}$；`eq:generation-derivatives`：$\lVert D^j(h_i-h_{i-1})\rVert_\infty\le C_j\beta^{i-1}r^{i(1-j)}$。我补求和：$j\ge1$ 时 $\sum_{i=1}^m\beta^{i-1}r^{i(1-j)}=\sum_i\exp((i-1)\log\beta+i(j-1)|\log r|)\le m e^{m(\log\beta+(j-1)|\log r|)}\le e^{C_*(j+1)m}$，$C_*$ 吸收 $\log\beta$、$|\log r|$ 与 $\log m$ 的余量（envelopes.tex:603-605 直接把 $+1$ 加进指数）。$j=0$ 时 $r^{i}\beta^{i-1}$ 几何衰减（$r=\nu^2$ 足够小）。文中还强调"supremum 范数里没有立方个数因子"（envelopes.tex:592）与"各代增量相加、不乘 pattern 高阶导常数"（envelopes.tex:593-595）。
5. margin 账（envelopes.tex:611-627）：$P_0$ 外由 seed；$P_0$ 内取**最后**改动该点的代 $i$，保留 margin $\ge c\,s_{\min}\alpha^{i-1}/r^{i-1}\ge c s_{\min}\alpha^m$；后续扰动在该点的所有 jet 在支撑边界为零，margin 不被侵蚀。`eq:iterated-hessian-margin`：$\max_eJ_{h_m}(e)\ge ce^{-C_*m}$。
6. 兑换（envelopes.tex:631-645）：$\theta$ 使 $C_*\theta\le\delta$；$m=\lfloor\theta\log k\rfloor$；$\gamma=\theta\log(1+\zeta)$；$h=h_m+c_k$。$e^{-C_*m}\ge k^{-C_*\theta}\ge k^{-\delta}$ 给第二行；$(1+\zeta)^m\ge(1+\zeta)^{-1}k^\gamma$ 给第三行；$h=-a_*t+c_k$ 于 $t\le1/2$ 因 seed 与所有 corrugation 都在该集之上（envelopes.tex:644-645）。

**(c) 机械理由。**
- $\delta=10^{-6}$（framework.tex:56 定义，envelopes.tex:536 重申）：它是"每阶导数允许的幂损失"，下游消费者我实测列在下面（都在 waves.tex）：$|H|\le k^{4\delta}$（waves.tex:61, 238）、$J'\ge k^{-2\delta}$（waves.tex:62）、$H-U\ge k^{-3\delta}I$ 与 $|U+iD|\le k^{20\delta}$（waves.tex:68）、分支阈值 $k^{-12\delta}$（waves.tex:85, 110）、$K=k^{14\delta}$（waves.tex:111）、$Q\le k^{3\delta}$（waves.tex:238）、$\eta_k=k^{-9\delta}$（waves.tex:247）、误差 $Ck^{-5\delta}$ 与 $Ck^{-3/4+4\delta}$（waves.tex:268, 272-273）、支撑 $Ck^{-1/3-100\delta}$（waves.tex:199）、$r_0=k^{-100\delta}$（waves.tex:304）、$\delta(101-99q)$（waves.tex:311）、$k^{-106\delta}|X|^2$（waves.tex:416）、$k^{1/3-206\delta}$（waves.tex:437-439）、$k^{200\delta+2J}$（waves.tex:476）、$k^{-(1-100\delta)s}$（waves.tex:478）、$k^{-1+100\delta}$（waves.tex:500, 608, 639, 688）。framework.tex:58-59 明说 "The numerical exponents below leave generous margins; we do not optimize the final positive gain."。$10^{-6}$ 的功能是把所有 $\delta$ 级损失钉在远低于硬分数 $1/3$、$3/4$、$1/4$、$1/12$ 的量级，使这些分数在渐近比较中占优。
- $(j+1)$ ，并非 $j$：$j=0$ 时 $\lVert h\rVert_{C^0}$ 也随 $k$ 多项式增长（$\beta^i$ 与 $c_k$），写成统一形式。
- $\gamma$ 的独立性（envelopes.tex:540-542）：由 $C_*$、$\theta$、$\zeta$ 只用 fixed pattern、seed 与共同 $C^1$ 界（envelopes.tex:647-652）。这是 `prop:step` 的 "common to all stages" 与 `thm:main` 的固定 $\epsilon_0$ 的唯一上游。
- $c_k$ 可任意有界指定（envelopes.tex:539）：被 global.tex:30-32 消费，用于把 $h(s_2)$ 归一到 $b_N(s_2)$；只需 $|c_k|$ 有界，因为 $s_2\in[1/4,1/2]$ 且 $N/k\le1$（global.tex:33-34）。
- "no uniform bound as $j\to\infty$ is asserted"（envelopes.tex:543-544）：明确声明 $h$ 的光滑性只由有限阶逐阶控制；$h_m$ 是有限和故光滑，但不解析。
- 消费方：`prop:packets`（waves.tex:4-8 声明 $h$ 满足 `eq:envelope-bounds`）、`lem:signs`（global.tex:250 用第三行）、`lem:phase-hessian`（经 waves.tex:276）、global.tex:10-11（取 $\gamma$）。
- 只看到断言的地方：$\gamma$ 与 $\zeta$ 的数值，全链只给表达式。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $m=\theta\log k/\log\log k$，margin 只按 $(\log k)^{-C_*\theta}$ 衰减而增益是 $k^{\gamma/\log\log k}$，"任意慢增长"不等于固定幂，$\epsilon_0$ 不存在。这说明 $m\propto\log k$ 是唯一让增益与代价同为 $k$ 的幂的选取。
- `[推测]` 若允许 $\gamma$ 依赖 $C^r$ 容差（删去 independence 声明），stage 序列里 $r_j\to\infty$（global.tex:747）使每步指数不同，极限度量上的超出无法用单一 $\epsilon_0$ 表达，introduction.tex:38 的 "fixed throughout" 失去支撑。断在 global.tex:760-767。
- `[推测]` 若 $m=\theta k$（线性迭代次数），$C^j$ 界变成 $e^{C_*jk}$，`prop:packets` 的 $Q\le k^{3\delta}$（waves.tex:238）与残差预算（waves.tex:475-479）全部溢出，断在 §5.9 的最后一步。

### 5.7 条目 7：`lem:phase-hessian`（waves.tex:57-72）

**(a) 逐字引用。** waves.tex:57-72：

```
\begin{lemma}[A dominated characteristic Hessian]\label{lem:phase-hessian}
Let $e_1,v$ be orthonormal vectors in $\R^4$, let $0\le b<1$, and
let $H$ be a real symmetric matrix such that
\[
 |H|\le k^{4\delta},\qquad
 J'=b^2H(e_1,e_1)+H(v,v)\ge k^{-2\delta}.
\]
For all sufficiently large $k$, there are real symmetric matrices
$U,D$ satisfying
\begin{equation}\label{eq:phase-hessian}
 (U+iD)(b e_1+i v)=0,\qquad
 H-U\ge k^{-3\delta}I,\qquad |U+iD|\le k^{20\delta}.
\end{equation}
The threshold can be chosen independently of $H,e_1,v,b$ under these
hypotheses.
\end{lemma}
```

**(b) 推导补全。** 前提解释（waves.tex:25-55）：中心 $z$ 取 $G$-法坐标，$p=\nabla_Gh(z)$，$Q=(1+|p|^2)^{1/2}$，$H=\nabla^2_Gh(z)$；单位 $v\perp p$ 时复向量 $P=p+iQv$ 满足 $P\cdot P=|p|^2-Q^2=-1$。相位 $\phi$ 若 $\phi(z)=h(z)$、$\mathrm d\phi(z)=P$，则 eikonal 常数项 $G^{ij}\partial_i\phi\partial_j\phi=-1$ 成立；一次项要求 $SP=0$（$S=\partial^2\phi(z)$），因法坐标下度量一阶导消失。$H-\operatorname{Re}S$ 的正性把 $\operatorname{Re}\phi$ 在二次阶压到 $h$ 之下，这就是定位来源。

令 $p=|p|e_1$、$b=|p|/Q$；$S=U+iD$ 时 $S(be_1+iv)=0$ 分离实虚部给 $Dv=bUe_1$、$De_1=-Uv/b$（waves.tex:77-78），对称性要求 `eq:waves-column-compatibility`：$b^2U(e_1,e_1)+U(v,v)=0$（waves.tex:81-83）。关键恒等式（waves.tex:48-52）：在此条件下 $b^2(H-U)(e_1,e_1)+(H-U)(v,v)=b^2H(e_1,e_1)+H(v,v)=J_h(v)$。这就是 $J_h$ 长成 framework.tex:40-41 那副模样的全部理由：权 $b^2=(|p|/Q)^2$ 是 $P$ 实部与虚部模长平方之比。

情形一 $b\ge k^{-12\delta}$（waves.tex:85-108）：$c_0=J'/(1+b^2)$、$U=H-c_0I$。验 compatibility：$b^2U(e_1,e_1)+U(v,v)=J'-c_0(1+b^2)=0$。$D$ 分块显式（waves.tex:95-101），用 $u_{22}=-b^2u_{11}$ 验证两列。界：$H-U=c_0I\ge\tfrac12k^{-2\delta}I$、$|U|\le Ck^{4\delta}$、$|D|\le Ck^{16\delta}$。我核 $|D|$：分块里 $u_{12}/b$、$u_{2E}/b$、$u_{E2}/b$ 各 $\le Ck^{4\delta}/k^{-12\delta}=Ck^{16\delta}$，为最大项；故 $|U+iD|\le Ck^{16\delta}\le k^{20\delta}$（大 $k$）。

情形二 $0\le b<k^{-12\delta}$（waves.tex:110-136）：$K=k^{14\delta}$，$U=-K(I-vv^{\mathsf t})+b^2Kvv^{\mathsf t}$，$D=-bK(e_1v^{\mathsf t}+ve_1^{\mathsf t})$。我验特征恒等式：$Ue_1=-Ke_1$、$Ub v=b^2Kv$（注意 $Uv=-Kv+b^2Kv$？不：$(I-vv^t)v=0$，$b^2Kvv^tv=b^2Kv$，故 $Uv=b^2Kv$）；$De_1=-bKv$、$Dv=-bKe_1$。于是 $(U+iD)(be_1+iv)=bUe_1+i(Uv)+ib(De_1)+i^2(Dv)=-bKe_1+ib^2Kv-ib^2Kv+bKe_1=0$。成立。$b=0$ 时 $D=0$、$Uv=0$，无除以小 $b$（waves.tex:116-118）。

正定检验（waves.tex:120-134）：$H-U-k^{-3\delta}I$ 按 $\R v\oplus v^\perp$ 分块。$v^\perp$ 块：$U|_{v^\perp}=-K$，故该块 $\ge K-k^{4\delta}\ge\tfrac12K$（大 $k$）。$v$ 标量块 $\ge k^{-2\delta}-k^{-20\delta}-k^{-10\delta}-k^{-3\delta}$，来源是 $H(v,v)\ge J'-b^2|H|$、$b^2|H|\le k^{-24\delta}k^{4\delta}=k^{-20\delta}$、$-U(v,v)=-b^2K$ 给出 $b^2K\le k^{-24\delta}k^{14\delta}=k^{-10\delta}$，再减 $k^{-3\delta}$。Schur 补至多减 $C|H|^2/K\le Ck^{8\delta}/k^{14\delta}=Ck^{-6\delta}$。$k^{-2\delta}$ 支配所有减项，故正定。$|U|\le Ck^{14\delta}$、$|D|\le Ck^{2\delta}$（$bK\le k^{-12\delta}k^{14\delta}=k^{2\delta}$）。

**(c) 机械理由。**
- 假设 $|H|\le k^{4\delta}$：`eq:envelope-bounds` 第一行取 $j=2$ 得 $C_2k^{3\delta}$，waves.tex:237-239 收紧记为 $k^{4\delta}$，留 $\delta$ 余量。
- 假设 $J'\ge k^{-2\delta}$：来自第二行 $J_h\ge ck^{-\delta}$；waves.tex:268-277 先把改 $e_2$ 为 $v_j$ 的误差 $Ck^{-5\delta}$ 与改 $p$ 为 $p+Qk^{-3/4}e_1$ 的误差 $Ck^{-3/4+4\delta}$ 减掉，二者相对 $ck^{-\delta}$ 可忽略，故写 $k^{-2\delta}$。
- 分支阈值 $k^{-12\delta}$：情形一要 $|D|\le Ck^{4\delta}/b\le k^{20\delta}$，即 $b\ge Ck^{-16\delta}$；取 $k^{-12\delta}$ 留 $4\delta$ 余量。情形二要 $b^2K\ll k^{-2\delta}$，即 $b^2\le k^{-24\delta}$，即 $b\le k^{-12\delta}$。两个条件在同一点 $k^{-12\delta}$ 相遇，这不是巧合：$12=(20-4)/2=24/2$，是情形一的分母损失与情形二的 Schur 控制的对称点。
- $K=k^{14\delta}$：需同时满足 (a) $|H|^2/K\le k^{-6\delta}\ll k^{-2\delta}$，即 $K\ge k^{8\delta+2\delta}=k^{10\delta}$ 有余；(b) $b^2K\le k^{-24\delta}K\ll k^{-2\delta}$，即 $K\ll k^{22\delta}$；(c) $K\gg k^{4\delta}$ 使 $v^\perp$ 块正。$14\delta$ 落在 $(10\delta,22\delta)$ 的中间，是任一中点选择。
- 结论的 $k^{-3\delta}$ 比输入 $k^{-2\delta}$ 小一档：这个"降档"被 `prop:packets` 的局部化消费，waves.tex:414-416 得 $\operatorname{Re}\Phi-h_{\rm sc}\le k^{-3/4}|X|-ck^{-106\delta}|X|^2+C|X|^3$，其中 $106\delta$ 来自 $3\delta$ 加缩放 $r_0^{-2}=k^{200\delta}$ 类的记账（我核对：$h_{\rm sc}$ 的分母是 $r_0Q$，而 $\Phi$ 的 Hessian 是 $r_0(U+iD)/Q$，二次差 $(H-\operatorname{Re}S)\sim k^{-3\delta}$ 除以尺度 $r_0^{-2}$ 后给出 $k^{-3\delta}\cdot r_0^{0}$ 级，文中记为 $k^{-106\delta}$，即 $k^{-3\delta}$ 与 $k^{-100\delta}$ 相关的保守化）。
- $|U+iD|\le k^{20\delta}$：被 waves.tex:358-359 的 prescribed Hessian 界 $k^{-80\delta}$ 消费（$r_0(U+iD)/Q=k^{-100\delta}\cdot k^{20\delta}=k^{-80\delta}$），保证多项式方程系数有界。
- "threshold independent of $H,e_1,v,b$"：让 `prop:packets` 在所有中心一致使用。若阈值依赖 $b$，$b$ 在临界点附近趋零，一致界失去意义。
- 只看到断言的地方：无。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若删掉情形二（经典做法：假设 $|p|\ge c>0$），包络必须在每点梯度非零，而 `lem:seed` 的 $h_0$ 在 $t=1$ 处梯度为零；packet 只能在 $U_0$ 造，`lem:signs` 的 maximal disjoint family 覆盖 $V$（global.tex:241-242）与 $\int_V$ 下界的对接断在 global.tex:248。
- `[推测]` 若把情形二的 $U|_{v^\perp}=-K$ 改成较弱负定（例如 $-K/2$），Schur 控制 $|H|^2/K$ 需要 $K\ge2|H|^2k^{2\delta}$，$b^2K$ 上限随之升高，情形二的 $b$ 范围收窄、情形一的 $|D|\le Ck^{4\delta}/b$ 上限升高，$20\delta$ 可能不够，断在 waves.tex:68 与 107。
- `[推测]` 若把 $J'$ 的正性假设改成无权的 $H(v,v)\ge k^{-2\delta}$，情形一的 $c_0=J'/(1+b^2)$ 无法解出 compatibility（$b^2U(e_1,e_1)+U(v,v)=J'-c_0(1+b^2)$ 不再为零）。权 $b^2$ 由 $P$ 的几何强制，任何"更自然"的无权正性都会让此引理失效。

### 5.8 条目 8：`lem:polynomial-inverse`（waves.tex:143-153）

**(a) 逐字引用。** waves.tex:143-153：

```
\begin{lemma}[Polynomial directional inverses]\label{lem:polynomial-inverse}
Let $\mathcal P_m$ be the space of complex homogeneous polynomials of
degree $m$ on $\R^4$, equipped with the coefficient norm in a fixed
monomial basis. Fix $0<c\le C<\infty$.
If $q\in\C^4$ satisfies $c\le |q|\le C$, then
\[
 q\cdot\partial:\mathcal P_{m+1}\longrightarrow\mathcal P_m
\]
has a right inverse with norm bounded in terms of $m,c,C$.
No lower bound for $|q\cdot q|$ is required.
\end{lemma}
```

证明 waves.tex:155-173 全文读完，闭合。引理前的动机段（waves.tex:139-141）逐字："We will solve polynomial equations along a complex direction whose bilinear square can be very small. Only its nonzero Hermitian norm matters for this purpose."

**(b) 推导补全。** 取坐标分量最大的下标 $i$：$|q|^2=\sum_j |q_j|^2\le 4\max_j |q_j|^2$，故 $\max_j|q_j|\ge |q|/2\ge c/2$。把算子拆成 $q\cdot\partial=q_i\partial_i+D'$，$D'$ 只含其余三个变量的偏导。$I_i$ 是对 $X_i$ 的零常数积分。逐次齐次验证：$(q_i\partial_i)(I_i P/q_i)=P$（$P$ 齐次时积分再求导复原，零常数项被 $\partial_i$ 消灭），所以 $(q\cdot\partial)(I_i/q_i)=I+\mathcal K$，$\mathcal K=D'I_i/q_i$。关键结构事实是 $\mathcal K$ 把"$X_i$ 以外的总次数"降 1：$I_i$ 升 $X_i$ 的次数但不升其余次数，$D'$ 只微分其余变量，所以在 $\mathcal P_m$ 上 $\mathcal K^{m+1}=0$（waves.tex:163-164 逐字："Each application of $\mathcal K$ lowers the degree in the variables other than $X_i$"）。于是 $(q\cdot\partial)R_{q,m}=(I+\mathcal K)\sum_{r=0}^m(-\mathcal K)^r=I-( -\mathcal K)^{m+1}\cdot(\text{telescoping})$，末项在 $\mathcal P_m$ 上为零，得 $(q\cdot\partial)R_{q,m}=I$（waves.tex:165-169）。范数界：$R_{q,m}$ 是 $m+1$ 项有限和，每项系数由 $q_i^{-1}$（$\le 2/c$）、$D'$ 的系数（$\le C$）与 $I_i$ 的单项式积分常数控制，只依赖 $m,c,C$；四个可选下标 $i$ 给出同一族的界（waves.tex:171-172）。

**(c) 常数与假设的机械理由。** $\R^4$ 的 4 来自底流形 $B=S^4$（framework.tex:5），包络全部造在底上，圆方向要到 global.tex:801-808 才加。假设 $c\le|q|\le C$ 的消费点在 waves.tex:353-354：$q=P/Q$ 的 Hermitian 范数由 \eqref{eq:waves-imaginary-size}（waves.tex:265-267）夹在 $[1,1+k^{-3/4}]$，取 $c=1,C=3$ 即可，$m$ 由 eikonal/transport 的截断次数 $T-1$ 或 $s$ 决定（waves.tex:350-383）。"No lower bound for $|q\cdot q|$ is required"（逐字，waves.tex:152）不是装饰：双线性平方 $q\cdot q$ 在中心 $p=0$ 附近或 $v_3,v_4$（waves.tex:249-250，含 $\eta_k=k^{-9\delta}$）这些"几乎各向同性"方向上可以任意小，任何依赖 $|q\cdot q|$ 下界的解法（比如 Fischer 分解/调和投影路线）会在 $k\to\infty$ 时失去一致界；这个引理把解算子从复几何约化换成纯一次变量积分，正是 prop:packets 一致性的前置条件。$m$ 出现在界里是诚实的：$T,s$ 是"finite construction orders"，prop:packets 明确不声明 $T,s\to\infty$ 的一致界（waves.tex:386-388 逐字："No bound uniform as $T,s\to\infty$ is asserted or needed"）。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若沿复特征的路线解 eikonal：先解 $q\cdot q=0$ 的零化再投影，$|q\cdot q|\ge c$ 必须成立。而 prop:packets 选 $v_3=(e_2+\eta_k e_3)/\sqrt{1+\eta_k^2}$（waves.tex:249），$P\cdot P=-1$ 但更高阶方程里的方向 $P/Q$ 的双线性部分随 $\eta_k\to0$ 退化，一致性断在 waves.tex:350-356，随后 eq:packet-residual 的 $M$ 无法任意大，global 侧 $M\ge2131+1088R$（global.tex:582）拿不到。
- `[推测]` 若右逆界允许依赖 $q$（不写成 $m,c,C$ 的函数），则中心族上的常数 $C_j$ 变成随 $z$ 漂移的量，lem:scaled-packets 的"uniformly in $x\in V$"（waves.tex:562）断在 waves.tex:588-589，lem:signs 的确定性 $H,\sigma_*$ 随之失效。
- `[推测]` 若把零积分常数改成任意常数，$\mathcal K$ 不再严格降次（常数项混入 $X_i$ 方向），几何和有限性断在 waves.tex:164，$(q\cdot\partial)R=I$ 变成 $(q\cdot\partial)R=I+(\text{非零常数})$。

### 5.9 条目 9：`prop:packets`（waves.tex:192-222）

**(a) 逐字引用。** waves.tex:192-222（陈述全文）：

```
\begin{proposition}[Packets with arbitrary finite accuracy]\label{prop:packets}
Fix a nonnegative integer $J$ and a real number $M>0$. Finite
construction orders can be chosen, before taking $k$ large, so that
every center $z$ with $t(z)\ge1/4$ has a family $\mathcal W_z$ of
four smooth complex packets with the following properties.
```

随后三组估计逐字为：支撑半径 "of radius at most $Ck^{-1/3-100\delta}$"（waves.tex:199）；导数界 \eqref{eq:packet-derivatives} "$|D_x^j w(x)|\le C_j k^{2j}e^{kh(x)}$"（waves.tex:201-203）；残差界 \eqref{eq:packet-residual} "$|D_x^j(L+k^2)w(x)|\le C e^{kh(x)}k^{-M},\qquad 0\le j\le J$"（waves.tex:205-208）；射影张成 \eqref{eq:jet-span} "$\sigma_{\min}(\mathcal J_z(z))\ge c k^{-3/4}$"、"$\sigma_{\min}(\mathcal J_z(x))\ge k^{-1}$ if $\operatorname{dist}(x,z)\le k^{-10}$"（waves.tex:210-214）；收尾句逐字："The exponents in the support, derivative, and jet bounds are independent of $J,M$."（waves.tex:219-220）。证明 waves.tex:224-529，六个 \paragraph 段落，完整闭合。

**(b) 推导补全。** 我按论文的六个 \paragraph 复述骨架并补中间步。第一步选射影：四个对 $(p',v)$，前三个用 $v_2,v_3,v_4$（$v_3,v_4$ 掺 $\eta_k=k^{-9\delta}$，waves.tex:247-251，三个向量的最小张成奇异值 $\ge c\eta_k$），第四个把实梯度平移 $p'=p+Qk^{-3/4}e_1$（waves.tex:255-258），这是 $k^{-3/4}$ 的产地：两个实部射影 $(1,(|p|/Q)e_1)$ 与 $(1,(|p|/Q+k^{-3/4})e_1)$ 在 value-$e_1$ 平面上的张成恰好差 $k^{-3/4}$（waves.tex:501-507）。对每对先验证加权 Hessian 测试从 $ck^{-\delta}$（prop:envelope 的裕量）退化到 $k^{-2\delta}$ 仍成立（误差 $Ck^{-5\delta}+Ck^{-3/4+4\delta}$ 可忽略，waves.tex:268-277），再调用 lem:phase-hessian 得 $U,D$。第二步冻结图与缩放：\eqref{eq:waves-scaling}（waves.tex:303-307）$r_0=k^{-100\delta}$、$\kappa=kr_0Q\in[k^{1-100\delta},k]$（waves.tex:424-426）。第三步有限阶 eikonal/transport：$\Phi$ 各齐次项通过 $2(P/Q)\cdot\partial\,\Phi_{m+1}$ 进入方程，由 lem:polynomial-inverse 逐次解出（waves.tex:350-361）；$a_0,\dots,a_s$ 同法（waves.tex:362-388），先造完整个 $a_0$ 再造 $a_1$，$\mathcal L a_{j-1}$ 的二阶导不造成循环依赖（waves.tex:384-385 逐字说明）。第四步定位：\eqref{eq:waves-localization}（waves.tex:414-417）$\operatorname{Re}\Phi-h_{\rm sc}\le k^{-3/4}|X|-ck^{-106\delta}|X|^2+C|X|^3$，在支撑内三次项被二次亏损吸收（$k^{-1/3+106\delta}\to0$，waves.tex:419-421），线性项乘 $\kappa\le k$ 后净指数 $O(k^{-3/2+106\delta})$，得 $|e^{kh(z)+\kappa\Phi}|\le 2e^{kh}$；环带 $\frac14k^{-1/3}\le|X|\le2k^{-1/3}$ 上负二次项贡献 $e^{-ck^{1/3-206\delta}}$ 压过线性 $e^{Ck^{-1/12}}$，由 $1/3-206\delta>1/4$ 得 \eqref{eq:waves-exponential-tail} 的 $e^{-2k^{1/4}}$（waves.tex:435-444）。第五步残差账：\eqref{eq:waves-accuracy-budget}（waves.tex:475-479）$Ck^{200\delta+2J}(k^{2-T/3}+k^{1-T/3}+k^{-(1-100\delta)s})$，三块分别是 eikonal 余量 $\kappa^2E_\Phi a$（$2-T/3$：$\kappa^2\le k^2$ 乘 Taylor 余项 $k^{-T/3}$）、transport 余量 $\kappa\mathcal T a_0$（$1-T/3$）、截尾振幅 $\kappa^{-s}\mathcal L a_s$（$k^{-(1-100\delta)s}$）；$200\delta$ 是算子缩放 $r_0^{-2}$ 的还原费（waves.tex:472），$2J$ 是每阶导数按 $k^2$ 的保守计费（waves.tex:461-469）。选 $T>3(M+200\delta+2J+3)$，$s>(M+200\delta+2J+1)/(1-100\delta)$（waves.tex:484-488）即得三项各 $k^{-M-\text{余量}}$。第六步射影张成：中心射影误差 $O(\kappa^{-1})=O(Ck^{-1+100\delta})=o(k^{-3/4})$（waves.tex:496-514）；位移 $k^{-10}$ 内射影矩阵变化 $O(k^{-7})$（用 $|D(\mathbf j_z w)|\le Ck^3$，waves.tex:516-528），相对 $k^{-3/4}$ 可忽略，第二式 $k^{-1}$ 留了 $k^{-7}$ 变 $O(1)\cdot k^{-1}$ 的余地。

**(c) 常数与假设的机械理由。** $t(z)\ge1/4$：包络只在高 $t$ 区被 prop:envelope 控制（\eqref{eq:envelope-bounds}），低 $t$ 区留给圆梁（global.tex:151 逐字 "The first inequality in \eqref{eq:gluing-gaps} puts all of $t<s_1$ in this region"），$1/4$ 与 $l^{(j)}=\frac14+2^{-j-2}$（global.tex:733）同源。支撑半径 $k^{-1/3-100\delta}$：$X$-支撑 $2k^{-1/3}$ 乘 $r_0=k^{-100\delta}$；$1/3$ 让环带亏损 $k^{1/3-206\delta}$ 与线性项 $k^{-1/12}$ 分道（$1/3-206\delta>1/4>1/12$ 链条在 waves.tex:437-439），$100\delta$ 是给 $Q$ 与度量导数留的公共小数。导数费 $k^{2j}$：$r_0^{-1}(1+\kappa+k^{1/3})\le Ck^{1+3\delta}<Ck^2$（waves.tex:464-467），取整到 $k^2$ 后与 $J,M$ 无关，这是收尾句"independent of $J,M$"的落点；下游消费者是 global.tex:102 的 $k^{2q+41}$（$41=40+1$：$Ck^{40}$ 个包络乘系数事件 $|g_v|\le k$）与 lem:correction 的假设。$k^{-3/4}$ 与 $k^{-1}$：被 lem:noncancellation 的 $k^{-51}$（global.tex:160）与 lem:signs 的整族张成消费；$k^{-10}$ 邻域半径与 global.tex:76 的网格 $k^{-10}$ 同数值，属刻意对齐。$T,s$ 是"chosen before the frequency threshold"（waves.tex:489-490 逐字），保证 prop:step 里后定的 $M\ge2131+1088R$ 仍能事后满足：这正是标题 "arbitrary finite accuracy" 的工程含义。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若支撑半径取高斯束传统的 $k^{-1/2}$ 宽度：$X$-截断尺度改成 $k^{1/2}$，环带亏损从 $k^{1/3}$ 变成 $k^{1/2}$ 但线性项 $k^{-3/4}\cdot k^{1/2}=k^{-1/4}$ 与 $e^{-2k^{1/4}}$ 同阶，\eqref{eq:waves-exponential-tail} 的分离断在 waves.tex:437-443，lem:scaled-packets 的 tail 合计 $k^{K_1}e^{-2k^{1/4}}$（waves.tex:700-702）不再 $o(1)$。
- `[推测]` 若第四个包不移 $p$，是平移其他方向：实部只剩一条 $e_1$ 线，value-$e_1$ 平面张成退化，$k^{-3/4}$ 中心界断在 waves.tex:501-507，$k^{-51}$ 与密度 $k^{260}$（global.tex:160,175）连锁失效，lem:noncancellation 的 $k^{-500}$ 概率界失去来源。
- `[推测]` 若 $T,s$ 允许随 $k$ 增长以省"事前选择"：$C_j$、$a(X)=1+O(k^{-1/3})$ 的常数、\eqref{eq:waves-accuracy-budget} 前置 $C$ 全部依赖 $T,s$（waves.tex:220-221, 405-406, 386-388），阈值与常数互相依赖出现循环，"lower threshold may depend on the same data"（waves.tex:220-221）的前提就不成立了。

### 5.10 条目 10：`lem:scaled-packets`（waves.tex:540-590）

**(a) 逐字引用。** waves.tex:540-551 陈述开头：

```
\begin{lemma}[Packets on a wavelength ball]\label{lem:scaled-packets}
Fix the finite construction orders in Proposition~\ref{prop:packets}
and a fixed finite number $K_1\ge0$. Let $\mathcal W$ be the collection of
all four packets from each of finitely many centers in
$\{t\ge1/4\}$, with $|\mathcal W|\le Ck^{K_1}$.
Suppose that for every $x\in V$ some center is within
$C_0k^{-10}$ of $x$, where $C_0$ is fixed. Set
\[
 R_x=(kQ_x)^{-1},\qquad
 S_x^2=\sum_{w\in\mathcal W}|w(x)|^2,\qquad
 w_x(Y)=w(x+R_xY),\quad |Y|\le2.
\]
```

三组结论逐字取自 \eqref{eq:scaled-packet-bounds}（waves.tex:563-572）：$S_x\ge ce^{kh(x)}$；近族 $\sup|D_Y^jw_x|\le C_j|w(x)|$；尾族 $\sup|D_Y^jw_x|\le C_je^{-k^{1/4}}e^{kh(x)}$。以及 \eqref{eq:imaginary-gradient}（waves.tex:575-579）"虚对数梯度 $\ge c$（$w\in\mathcal N_x$）"与 \eqref{eq:waves-square-sums}（waves.tex:581-587）的归一平方和 $=1-o(1)$。收尾句（waves.tex:588-589）逐字："The constants and thresholds may depend on the fixed construction orders and on $K_1,C_0$, but not on $k,x$." 证明 waves.tex:592-708 完整闭合。

**(b) 推导补全。** 分族判据：$|X_z(x)|\gtrless\frac12k^{-1/3}$（waves.tex:558-561）。第一步可比性：碰到波长球的包络满足 $|z-x|\le Ck^{-1/3-100\delta}+C/k$（waves.tex:598-601），由 $|DQ|\le Ck^{4\delta}$ 得 $|Q_z-Q_x|\le Ck^{-1/3-96\delta}+Ck^{-1+4\delta}=o(1)$（waves.tex:607-609），$96\delta=100\delta-4\delta$ 是乘积记账后的净余，于是 $Q_z/Q_x$ 双向有界，\eqref{eq:waves-local-weight} 给 $k|h(x+R_xY)-h(x)|\le C$（waves.tex:612-615）。第二步下界：最近中心 $|X_z(x)|=O(k^{-10+100\delta})$，其射影下界直接给出一个 $|w(x)|\ge ce^{kh(x)}$，证 $S_x$ 下界（waves.tex:617-622）。缩放雅可比：$\kappa_zD_YX_z=(Q_z/Q_x)D_x\xi_z$（\eqref{eq:waves-scaled-jacobian}，waves.tex:632-635）在 $q=1$ 有界可逆、$q\ge2$ 带因子 $(kQ_x)^{1-q}\le1$（waves.tex:624-630），这是"每阶 $Y$-导数只花常数"的机器。尾族：在截断贡献区 $\frac14k^{-1/3}\le|X_z|\le2k^{-1/3}$ 套 \eqref{eq:waves-exponential-tail}；$\omega(k^{1/3}X_z)$ 的导数费 $k^{1/3}/\kappa_z\le k^{-2/3+100\delta}\le1$（waves.tex:653-654），故绝对界成立，即便 $w(x)=0$（waves.tex:658-659 逐字："This argument uses an absolute estimate and is valid even if $w(x)=0$"）。近族：$|X_z|<k^{-1/3}$ 全球内截断恒等 1，$|w_x(Y)|\le C|w_x(0)|$ 由有界实对数导数沿线段积分（waves.tex:661-673）。虚梯度下界：$\operatorname{Im}\partial_X\Phi(X_z(x))=(Q'/Q_z)v+O(k^{-1/3})$，主项范数 $\ge1$ 由 \eqref{eq:waves-imaginary-size}，雅可比逆给 $Y$-坐标下界，振幅贡献 $Ck^{-1+100\delta}/Q_x=o(1)$ 无法抵消（waves.tex:675-693）。平方和合计：尾族总量 $C_jk^{K_1}e^{-2k^{1/4}}=o(1)$（$|\mathcal W|\le Ck^{K_1}$ 在此消费），近族比 $\le1$，$j=0$ 时按 $S_x$ 定义恰为 $1-o(1)$（waves.tex:695-707）。

**(c) 常数与假设的机械理由。** $K_1$：global.tex:76-80 的网格给 $|\mathcal W_k|\le Ck^{40}$，即 $K_1=40$ 级；$K_1$ 只进两处：尾族 $o(1)$ 合计与协方差矩阵尺寸，任何多项式规模都兼容，这是"arbitrary polynomial-sized collection"（waves.tex:533-534）的含义。邻近条件 $C_0k^{-10}$：与 \eqref{eq:jet-span} 第二式的半径和 global.tex:76 的网格同一条链，$C_0$ 固定即允许网格常数浮动。$R_x=(kQ_x)^{-1}$：波长球物理半径，lem:signs 的 \eqref{eq:sign-radius}（global.tex:227-228）逐字复用同式；$Q$ 取在 $x$ ，并非 $z$，靠可比性引理合法化。$e^{-k^{1/4}}$：来自 \eqref{eq:waves-exponential-tail} 的 $e^{-2k^{1/4}}$；平方和里平方出现 $e^{-2k^{1/4}}$，逐点界留 $e^{-k^{1/4}}$（waves.tex:569-570, 700-702）。分界线 $\frac12k^{-1/3}$：两侧分别落在截断恒等区与尾吸收区，取一半是给位移误差 $o(k^{-1/3})$（waves.tex:638-640）留余地。虚梯度 $\ge c$ 的唯一消费者是 lem:signs 的条件协方差迹（global.tex:302-307）；本引理因此是"符号生产"与"射影生产"两条线的公共节点，global.tex:204-213 的导语逐字区分了这两条线。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若尾族只用相对界 $|D^jw_x|\le C_j|w(x)|$ 而不给绝对界：$w(x)=0$ 时比值 $0/0$，$S_x$ 归一化崩溃；论文专门写了绝对界一句（waves.tex:658-659），删掉它断在 waves.tex:566-570 分块第二式。
- `[推测]` 若中心集扩到低 $t$ 区（$\{t\ge1/4\}$ 之外）：\eqref{eq:envelope-bounds} 失效，$Q$ 双向可比（waves.tex:610-611）失去起点，三式一致界在 waves.tex:563-572 断。
- `[推测]` 若 $|\mathcal W|$ 超多项式（指数级网格）：$k^{K_1}e^{-2k^{1/4}}$（waves.tex:700-702）不再趋零，\eqref{eq:waves-square-sums} 的 $1-o(1)$ 断，lem:signs 的迹下界随球漂移，$c_*$ 不再与 $k$ 无关（global.tex:217-218）。

### 5.11 条目 11：`lem:noncancellation`（global.tex:126-137）

**(a) 逐字引用。** global.tex:126-137：

```
\begin{lemma}[A quantitative nonvanishing first jet]
\label{lem:noncancellation}
For every fixed choice of the finite packet orders, the construction
above satisfies
\begin{equation}\label{eq:noncancellation}
 \Pp\left(\mathcal B_k\cap\left\{
 \inf_{x\in B}\frac{|u(x)|+|\dd u(x)|_{g_0}}{W(x)}
 \ge k^{-500}\right\}\right)\longrightarrow1.
\end{equation}
The exponent $500$ is independent of those orders and of the fixed
input pair and collar.
\end{lemma}
```

证明 global.tex:139-202 完整闭合。前置导语（global.tex:119-124）逐字："A lower bound by an inverse power of $k$ is sufficient: the coefficient correction will spend a larger power of residual accuracy to compensate for it."

**(b) 推导补全。** 证明先分两个确定区。区一：$W/e^{kh}>k^{50}$（即梁主导区，$\beta=1$）。切换区内由 \eqref{eq:gluing-gaps} 给 $W/e^{kh}\le1+e^{-cw k}$，所以该区实为 $t\le s_1$ 一侧；梁的余弦公式与角向导数给 $|u_*|+|\mathrm d u_*|_{g_0}\ge ce^{kb_N}$（146 行），而 $\mathcal B_k$ 上包络的值加一阶导合计 $\le Ck^{43}e^{kh}$（148-149 行，$43=2\cdot1+41$ 取自 \eqref{eq:sum-weighted-bounds} 的 $q=1$）；由 $W>e^{kh}$ 且 $W\le k^{50}e^{kh}$ 的补集定义，$e^{kb_N}$ 相对 $e^{kh}$ 的优势压过 $k^{43}$，得梁控制，$t<s_1$ 全部落入（151-152 行）。区二：其余点有 $C_0k^{-10}$ 内的净中心。用 \eqref{eq:jet-span} 第二式把归一化导数换回普通坐标导数后，五个随机量 $(u,\partial_1u,\dots,\partial_4u)$ 的协方差矩阵最小特征值平方根 $\ge ck^{-1}e^{kh}\ge ck^{-51}W\ge k^{-52}W$（155-161 行；中间一步用的是 $W\le k^{50}e^{kh}$）。这里只用一个邻近包络族，其余族加的是半正定矩阵（162-163 行）；确定性梁只是均值平移，不影响 Gaussian 密度最大值（164-165 行）。于是 5 维归一化射影 $\mathcal J=W^{-1}(u,\partial_1u,\dots)$ 落入半径 $C_0k^{-D}$ 小球的条件前（无条件）概率 $\le Ck^{260-5D}$：密度 $\le C(k^{52})^5=Ck^{260}$、球体积 $Ck^{-5D}$（167-177 行，注意 176 行逐字"No conditioning on $\mathcal B_k$ is used in this estimate"）。$\mathcal B_k$ 上 $|D\mathcal J|\le Ck^{45}\le k^{46}$（179-183 行）：$W$-权重的二阶导界加 \eqref{eq:beam-weighted-bounds} 第三式 $|\mathrm d W|/W\le Ck^2$。4 维网格步长 $k^{-D-48}$，网格点数 $\le Ck^{4D+192}$（184-186 行）。并集概率 $\le Ck^{260-5D+4D+192}=Ck^{452-D}$（187-193 行）；取 $D=500$ 得 $k^{-48}\to0$。网格点界经插值误差 $Ck^{-D-2}$（$k^{46}\cdot k^{-D-48}$）升级到全区间，减掉 \eqref{eq:coefficient-event} 完成。

**(c) 常数与假设的机械理由。** $k^{-500}$：全部预算是 $452$（$=260+192$）加缓冲，$500>452$ 即可，论文声明它与包络阶数、输入对、collar 无关（135-136 行），因为它只由维度（5 变量、4 维底）和上面那几个整数费决定。$k^{50}$ 分界：$50>43+1$，保证梁控制区与 Gaussian 区互不吃亏；$k^{-51}$、$k^{-52}$ 是 $k^{-1}\cdot k^{50}$ 记账的两步落地（160-161 行）。$k^{260}$：$5\times52$，是"每个归一化分量标准差 $\ge k^{-52}$"的五次方，若最小标准差是 $k^{-s}$ 则密度界是 $k^{5s}$；这条链把 \eqref{eq:jet-span} 的 $k^{-1}$ 原样搬运到 $260$。$k^{4D+192}$：4 是底流形维数，$48$ 是梯度界 $k^{46}$ 取整加缓冲。$|\mathrm d W|/W\le Ck^2$ 的消费点就在 $D\mathcal J$ 估计（179-182 行），它的来源 \eqref{eq:beam-weighted-bounds} 第三式在 global.tex:62-72 已建立。500 的下游唯一消费者是 lem:correction 的第一假设 $|u|+|\mathrm d u|_{g_0}\ge k^{-500}W$（global.tex:399）：两处的 500 同值并非巧合，是刻意的机械对接（prop:step 证明 584-587 行按此顺序引用）。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $D\le452$：并集界 $k^{452-D}$ 不消失，断在 global.tex:192-194，引理整体失效。
- `[推测]` 若小球概率界 \eqref{eq:jet-small-ball} 的推导条件在 $\mathcal B_k$ 上：并集减概率后只剩 $\mathbb P(\mathcal B_k)$ 倍的比例，global.tex:388-391 的"减法即使 $p_*$ 极小也合法"依赖无条件版本；条件化断在 global.tex:176 那一句本身。
- `[推测]` 若分界从 $k^{50}$ 降到 $k^{44}$：梁优势 $e^{kb_N}/e^{kh}>k^{44}$ 与包络费 $k^{43}$ 只差一个 $k$，射影项 $|\mathrm d u_*|$ 里任何一项重记（比如 $W$ 的角向导数费）都能吃掉缓冲，梁控制断在 global.tex:148-152。

### 5.12 条目 12：`lem:signs`（global.tex:215-223）

**(a) 逐字引用。** global.tex:215-223：

```
\begin{lemma}\label{lem:signs}
For every fixed choice of the packet orders in
\eqref{eq:gaussian-sum}, there exist $p_*,c_*>0$, independent of
$k$, such that for all sufficiently large allowed frequencies,
the probability that $u$ has a sign certificate in $\Omega$ of size
at least $c_*k^{1+\gamma}$ is at least $p_*$. The certificate can be
chosen from pairs of disks fixed deterministically before sampling
the Gaussian coefficients.
\end{lemma}
```

证明 global.tex:225-377 完整闭合，是全篇概率含量最高的一段。导语（global.tex:204-213）逐字区分两条线："sign production uses the packets' oscillation at the local wavelength, while the preceding lemma uses their full first-jet span."

**(b) 推导补全。** 六步。第一步打包：球半径 $R_x=(kQ_x)^{-1}$（\eqref{eq:sign-radius}），$|DQ|\le Ck^{4\delta}$ 使相交球半径互比（231-236 行）；取 $V$ 中极大不交球族 $\{B(x,R_x)\}$，有界放大覆盖 $V$，得 \eqref{eq:weighted-packing}：$\int_VkQ\,\mathrm d y\le C\sum kQ_xR_x^4=C\sum R_x^3$，右端 $\ge ck^{1+γ}$ 由 \eqref{eq:envelope-bounds} 的 $\int_V\sqrt{1+|\nabla_Gh|_G^2}\,\mathrm d x\ge ck^\gamma$ 乘 $k$（243-250 行；$Q$ 的定义与 $\sqrt{1+|\nabla h|^2}$ 同式，1 次方来自 $k\,\mathrm d y$ 权）。第二步定球：$\overline V\subset\{t>1/2\}$ 而 $s_4<1/2$，梁在二倍放大球上恒零（252-253 行），$U_x(Y)=u(x+R_xY)/S_x$ 纯包络。lem:scaled-packets 对全体族成立（含外心，261-263 行），$S_x\ge ce^{kh}$、非尾 $|v(x)|^2$ 占比 $1-o(1)$、虚梯度 $\ge c$ 全部到手。第三步条件方差代数：值 $=z^{\mathsf t}g/S_x$、梯度 $=Tg/S_x$，条件协方差 $S_x^{-2}T(I-zz^{\mathsf t}/S_x^2)T^{\mathsf t}$（286-291 行）。每个非尾包络给一个两坐标单位向量 $c_v=(-\operatorname{Im}v,\operatorname{Re}v)/|v(x)|$：互相正交且都垂直于 $z$ 的分量 $(\operatorname{Re}v,\operatorname{Im}v)$（293-298 行），故投影 $\succeq\sum c_vc_v^{\mathsf t}$；$Tc_v=|v(x)|\operatorname{Im}(\mathrm d_Yv/v)(0)$（302-304 行）；取迹，用虚梯度 $\ge c$ 和非尾质量 $\ge1-o(1)$ 得迹 $\ge c>0$（305-307 行），于是存在确定性单位方向 $e_x$ 使 $Z_x=\partial_{e_x}U_x(0)$ 的条件方差双边界。第四步矩控制：$\mathbb E\|U_x\|_{C^2(\overline{B(0,1)})}^2\le C\mathbb E\|U_x\|_{H^5(B(0,2))}^2\le C$（\eqref{eq:local-c2-moment}，Sobolev 嵌入在 4 维成立因为 $5>2+4/2$，331-332 行引 Evans 5.6-5.7 节）。第五步单球概率：条件密度公式给 $\mathbb P(1\le Z_x\le2,|U_x(0)|<c'/H)\ge c_1/H$；$\mathbb P(\|U_x\|_{C^2}>H)\le C/H^2$；$H$ 定得够大使交事件概率 $\ge\pi_*=c_1/(2H)$（334-347 行）。Taylor 在 $\pm a'e_x/H$（$a'=1/4$，$c'<a'/4$）：线性项 $\ge a'/H$、中心值 $\le c'/H$、二次误差 $\le a'^2/(2H)$，得异号、绝对值 $\ge a'/(2H)$（349-353 行）；梯度界把符号保在横向圆盘 $\sigma_*=a'/(4H^2)$ 内，闭柱体紧含于单位球（354-359 行）；方向、中心、半径都是包络数据的确定函数，乘 $R_x$ 得"潜在证书对"（360-362 行）。第六步加权比例：$F_k$ 为 $R_x^3$-加权成功比例，$0\le F_k\le1$、$\mathbb E F_k\ge\pi_*$，单边 Markov：$\pi_*\le\mathbb E F_k\le p+\frac{\pi_*}2(1-p)$，解出 $p=\mathbb P(F_k\ge\pi_*/2)\ge\pi_*/(2-\pi_*)$（364-369 行，逐字"No independence among these successes is claimed or needed"）；成功球的盘体积 $\omega_3\sigma_*^3R_x^3$，事件 $\{F_k\ge\pi_*/2\}$ 上证书大小 $\ge\frac{\pi_*}2\omega_3\sigma_*^3\cdot ck^{1+\gamma}=c_*k^{1+\gamma}$（370-376 行），$p_*=\pi_*/(2-\pi_*)$。随后的联立段（379-391 行）：先定 $p_*$，再取 $k$ 使 \eqref{eq:noncancellation} 失败概率 $<p_*/2$，交事件概率 $\ge p_*/2$。

**(c) 常数与假设的机械理由。** $1+\gamma$：$1$ 来自打包计数（$\sum R_x^3$ 的 $k$-幂次，本身是 $\int kQ$ 的一次幂），$\gamma$ 是 prop:envelope 的全部存款在此第一次支出；$c_*$ 由 $\pi_*,\sigma_*,\omega_3$ 与打包重叠常数合成，全部在阶选定后固定，这是"独立于 $k$"的出处。$a'=1/4$：让 $\pm a'e_x/H$ 及半径 $\sigma_*$ 的闭柱体留在单位 $Y$-球内（$a'/H+\sigma_*\le\frac14+\frac14\cdot\frac1{4H^2}<1$ 裕量极大，本质是"取一个安全的内点分数"）。$c'<a'/4$：中心值噪声压过线性项的 $1/2$ 下限所需（$a'/H-c'/H-a'^2/(2H)\ge a'/(2H)$ 要求 $c'\le a'(\frac12-\frac{a'}{2})$，$a'=1/4$ 时即 $c'\le3a'/8$，论文取更严的 $a'/4$）。$H$：$c_1/H>C/H^2$ 解出下限，取大即可；一切 $H$ 依赖被封进 $\pi_*,\sigma_*,c_*$ 三个常数。证书"采样前确定性"：$F_k$ 的期望下界按球逐一线性成立，不需要球间独立，因此极大不交族的组合结构（相交、覆盖）不构成障碍；这也是 lem:correction 之后证书仍能迁移的前提（global.tex:587-588 消费后传给 prop:step）。$\mathcal B_k$、梁置零区、$V\Subset\Omega$：三处区域几何各自封一个环节点（梁污染、外心、坐标覆盖）。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若把 $R_x=(kQ_x)^{-1}$ 换成统一 $k^{-1}$：振荡波长实际是 $(kQ)^{-1}$，$Q\le k^{3\delta}$ 的漂移让缩放估计的常数吃进 $Q$，global.tex:231-236 的半径可比与 \eqref{eq:weighted-packing} 的等式 $\sum kQ_xR_x^4=\sum R_x^3$ 同时断，$1+\gamma$ 退化为 $1$。
- `[推测]` 若条件方差走均值回归路线（用 $Z_x-\mathbb E[Z_x|U_x(0)]$ 的独立性假设）：球间不独立、包络重叠，独立性和逐球条件独立都不成立；论文的迹论证（299-307 行）只要求半正定控制，若换成需独立的路线断在 \eqref{eq:weighted-success}。
- `[推测]` 若概率步骤放到添加圆方向之后（在 5 维 $S^4\times S^1$ 上做）：$C^2\subset H^s$ 需要 $s>2+5/2=4.5$ 而椭圆估计只供到 $H^4$ 级（global.tex:682-696 是另一处），\eqref{eq:local-c2-moment} 断在 global.tex:327；论文把 warp 压到 global.tex:801-808 最后一步，正是为保护本引理的 4 维 Sobolev 预算。

### 5.13 条目 13：`lem:correction`（global.tex:395-417）

**(a) 逐字引用。** global.tex:395-417：

```
\begin{lemma}\label{lem:correction}
Let $(A,\rho)$ be a fixed smooth positive pair, let $u$ be real and
smooth, and let $W$ be a smooth positive weight. Suppose that
\[
 |u|+|\dd u|_{g_0}\ge k^{-500}W.
\]
Fix an integer $R\ge0$. Suppose that
\[
 |D^qu|\le C_qk^{2q+41}W\quad(0\le q\le R+2),\qquad
 |D^q\mathfrak r|\le C_qk^{-M}W\quad(0\le q\le R+1),
\]
where $\mathfrak r=\diver_\mu(A\,\dd u)+k^2\rho u$.
There are smooth real corrections $(\delta A,\delta\rho)$ canceling
the eigenfunction residual exactly, and
\begin{equation}\label{eq:correction-size}
 \lVert(\delta A,\delta\rho)\rVert_{C^R}
 \le C_R k^{-M+2129+1088R}.
\end{equation}
The corrections vanish on every open set where $\mathfrak r=0$.
In particular, choosing $M\ge2131+1088R$ makes them tend to zero
in $C^R$ as $k\to\infty$. For sufficiently small corrections the
output pair is positive and $u$ is its exact eigenfunction at $k^2$.
\end{lemma}
```

证明 global.tex:419-480 完整闭合。这是全篇我最欣赏的一段：五行公式换来"精确本征函数"这一整条定性路线拿不到的性质。

**(b) 推导补全。** 公式 \eqref{eq:correction-formula}（global.tex:421-427）：$\mathcal D=u^2+I(\mathrm d u,\mathrm d u)$，$F=-\mathfrak r/\mathcal D$，$\delta A=FuI$，$\delta\rho=k^{-2}(Fu-\operatorname{div}_\mu(FI\,\mathrm d u))$，$I=g_0^{-1}$。分母：一阶射影下界给 $\mathcal D\ge\frac12k^{-1000}W^2$（428-429 行；$(|u|+|\mathrm d u|)^2$ 对 $u^2+\frac12I(\mathrm d u,\mathrm d u)$ 的放缩加 $|\mathrm d u|_{g_0}^2=I(\mathrm d u,\mathrm d u)$）。恒等式（430-438 行）逐项展开：$\operatorname{div}_\mu(\delta A\,\mathrm d u)=u\operatorname{div}_\mu(FI\mathrm d u)+FI(\mathrm d u,\mathrm d u)$，$k^2\delta\rho\,u=Fu^2-u\operatorname{div}_\mu(FI\mathrm d u)$，相加得 $F(u^2+I(\mathrm d u,\mathrm d u))=F\mathcal D=-\mathfrak r$，两个含 $\operatorname{div}_\mu(FI\mathrm d u)$ 的项精确相消，这就是 $\delta\rho$ 里为何要把散度项写出来配对。导数账（440-471 行）：$|D^q\mathcal D|\le C_qk^{2q+86}W^2$（两因子 $k^{2q_1+41}\cdot k^{2q_2+41}$，$q_1+q_2\le q$，再加 $I$ 的有界导数，$86=2\cdot41+4$ 的记账在 443 行）；$\mathcal D^{-1}$ 的 $q$ 阶导按 Faà di Bruno 展开为 $\mathcal D^{-m-1}\prod D^{q_i}\mathcal D$（$m\le q$，$q_i\ge1$），代 $\mathcal D^{-1}\le 2k^{1000}W^{-2}$ 得 $|D^q\mathcal D^{-1}|\le C_qk^{1000+1088q}W^{-2}$（450-454 行，$1088=1000+86+2$）；乘 $\mathfrak r$ 界得 $|D^qF|\le C_qk^{-M+1000+1088q}W^{-1}$（\eqref{eq:F-derivatives}）；再乘 $u$ 的各阶导：$|D^q(Fu)|\le C_qk^{-M+1041+1088q}$（464-465 行，$1041=1000+41$）；$u$ 换 $I\mathrm d u$ 加 2：$1043=1000+43$（465-467 行）；散度费一阶、$\delta\rho$ 带 $k^{-2}$：密度指数 $1043+1088(R+1)-2=2129+1088R$（470-471 行），$\delta A$ 的 $1043+1088R$ 更小被吞。消失性：$\mathfrak r=0$ 开集上 $F=0$，两项修正同零（476-477 行）。正性：正 pair 锥在紧底上 $C^0$-开（477-479 行）。$M\ge2131+1088R$ 使 \eqref{eq:correction-size} $\le C_Rk^{-2}\to0$（414-415 行；$2131=2129+2$）。

**(c) 常数与假设的机械理由。** $k^{-500}$：与 lem:noncancellation 的输出同值对接（上一条目 (c)），进 $\mathcal D$ 下界成 $k^{-1000}$（平方）。$k^{2q+41}$：来自 \eqref{eq:sum-weighted-bounds}（global.tex:102），$41=40+1$（网格 $k^{40}$ 乘系数事件界 $k$）；修正假设要求它到 $q\le R+2$，故 prop:step 取 $J=R+2$（global.tex:582）。$2129+1088R$：全部由 $1000$（射影下界平方）、$86$（$\mathcal D$ 二阶费）、$2$（$k^{-2}$）与 $R+1$ 阶散度组装；$M$ 由 prop:packets 支付，$T,s$ 在 $M$ 定后才能选（waves.tex:489-490），这是"精度换几何"的总账。"消失性"的机械理由：保护 $t<s_1-w/100$ 区的圆性与 $u=u_*$（global.tex:605-606），否则 simplicity 的圆公式（global.tex:522-528 用到 $u_*$ 的显式梯度恒等式）在扰动区失效。$k^{-2}$：让 $\delta\rho$ 进入 $k^2(\rho+\delta\rho)u$ 后量级 $Fu$ 不多付 $k^2$，本征值 $k^2$ 保持精确。消费方：prop:step（global.tex:587-590，修正 $<\eta'/2$），thm:main 的求和预算 $2^{-j}$。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若没有一阶射影下界（或只用 $|u|\ge k^{-500}W$ 不带 $\mathrm d u$）：$\mathcal D$ 可在临界点为零，$F=-\mathfrak r/\mathcal D$ 不光滑，断在 global.tex:428-429；这正是 lem:noncancellation 存在的全部理由，两条目是刚性耦合的。
- `[推测]` 若把 $F=-\mathfrak r/\mathcal D$ 换成只用梯度的常见写法 $\delta A=-\mathfrak r\,\mathrm d u/|\mathrm d u|^2$：$|\mathrm d u|$ 单独可零，且失去 $u^2$ 项后密度修正 $\delta\rho$ 无配对相消，恒等式断在 global.tex:430-438 的展开。
- `[推测]` 若 $M$ 的选取先于 $R$：prop:packets 的 $T,s$ 依赖 $M$（waves.tex:485-488），而 $R$ 由 persistence 需求供给（global.tex:576 起），顺序颠倒会让某个后到的 $R$ 击穿预先冻结的残差预算，断在 global.tex:582-586。

### 5.14 条目 14：`lem:simplicity`（global.tex:484-493）

**(a) 逐字引用。** global.tex:484-493：

```
\begin{lemma}\label{lem:simplicity}
Suppose a smooth positive pair has a real eigenfunction $u$ at
$k^2=N(N+3)$, with $N>1$. Suppose there is an open region on which
the pair equals the round pair and $u=u_*$, containing a point with
$0<t<1$ at which $\dd u$
and $\dd t$ are independent. Then one can make $k^2$ simple by
an arbitrarily small smooth tensor perturbation supported in that
region, while preserving $u$ and $\rho$ exactly. The perturbation
can be arbitrarily small in any prescribed finite $C^R$ norm.
\end{lemma}
```

证明 global.tex:495-570 完整闭合。

**(b) 推导补全。** 构造：在 $(u,t)$ 为前两个坐标的乘积卡 $O$（$\mathrm d u\ne0$）上，$E=\chi(I-(I\mathrm d u)\otimes(I\mathrm d u)/I(\mathrm d u,\mathrm d u))$（500-504 行）：沿余度量把 $I\mathrm d u$ 方向投影掉的对称非负逆变张量，$E\mathrm d u=0$ 恒成立。核分类：$f\in\mathcal E$ 落在半正定形式 $f\mapsto\int_BE(\mathrm d f,\mathrm d f)\mathrm d\mu$ 的核，当且仅当 $O_0$ 上 $\mathrm d f\in\operatorname{span}\{\mathrm d u\}$；缩卡后意味着 $f=b(u)$（514-518 行）。代入圆本征方程得复合恒等式 \eqref{eq:simplicity-composition}：$b''(u)|\mathrm d u|_{g_0}^2=k^2(ub'(u)-b(u))$（519-521 行）。显式梯度：欧氏齐次调和多项式梯度平方 $N^2(1-t)^{N-1}$、径向导数 $Nu$，切向投影减径向分量得 $|\mathrm d u|_{g_0}^2=N^2((1-t)^{N-1}-u^2)$（522-528 行）。固定坐标 $u$ 对 $t$ 求偏导：\eqref{eq:simplicity-composition} 右端与 $t$ 无关，左端乘 $\partial_t|\mathrm d u|_{g_0}^2=-N^2(N-1)(1-t)^{N-2}$，$N>1$、$t<1$ 时非零，故 $b''(u)=0$；回代消去 $b$ 的常数项得 $f=cu$ 于 $O_0$（529-533 行）。全局化：$f-cu$ 满足光滑、正定主部、光滑低阶的二阶椭圆方程，Aronszajn 唯一连续性适用（其局部假设允许主系数 $C^2$ 带 Lipschitz 二阶导、低阶有界，global.tex:535-541 逐字引用 pp. 235-236），从开片上的消失得连通底上恒零，核恰为 $\operatorname{span}\{u\}$（535-544 行）。扰动：$A\rightsquigarrow A+\tau E$，$u$ 与本征值精确保留（$E\mathrm d u=0$，546-547 行）；反证：若 $\tau_m\downarrow0$ 时 $k^2$ 仍非单重，取归一化、$\perp u$ 的实本征函数 $f_m$，能量恒等式 $\int(A+\tau_mE)(\mathrm d f_m,\mathrm d f_m)\mathrm d\mu=k^2$ 加一致椭圆性给 $H^1$ 界，子列弱 $H^1$、强 $L^2$ 收敛到归一、$\perp u$ 的 $f_0\in\mathcal E$，椭圆正则给光滑（549-558 行）；两方程互测消掉原形式得 $\int E(\mathrm d f_m,\mathrm d\phi)\mathrm d\mu=0$（$\phi\in\mathcal E$ 固定），弱收敛传极限、取 $\phi=f_0$ 得 $f_0$ 入核，与归一化和正交矛盾（559-566 行）。$\tau$ 事后选取吸收 $E$ 的有限范数（567-569 行）。

**(c) 常数与假设的机械理由。** $N>1$：只被 $\partial_t$ 系数 $(N-1)$ 消费（529-531 行），$N=1$ 时判定完全失效。$k^2=N(N+3)$：$S^4$ 谱（framework.tex:69），保证保护区里"圆 pair + $u=u_*$"这个显式弹药库可用（$|\mathrm d u|_{g_0}^2$ 闭式是引理的心脏）。"$\mathrm d u,\mathrm d t$ 独立的点"：$(u,t)$ 能做前两个坐标的前提（496-497 行），供给点在 prop:step 的子 collar $\sin(N\vartheta)\ne0$ 处（global.tex:608-614，$u=(1-t)^{N/2}\cos(N\vartheta)$ 角向导数非零即独立）。"preserving $u$ and $\rho$ exactly"：扰动只进 $A$ 不进 $\rho$，因为 $A+\tau E$ 正定（正定加半正定）且 $E\mathrm d u=0$ 使方程逐字不变；$\rho$ 一旦动了，lem:persistence 后证书盘的归一化与 Rayleigh 商链条（global.tex:663-666）都要重做。"任意小 in any prescribed finite $C^R$"：唯一消费者是 prop:step 的 $\eta'/2$ 预算（global.tex:616-619）；$E$ 的有限导数可随 $k$ 大，$\tau$ scalar 事后吸收（global.tex:617-619 逐字说明）。Aronszajn 的口径与 §2.7 一致：唯一连续性在本篇是单重性引擎，并非上界引擎。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $N=1$：$\partial_t|\mathrm d u|_{g_0}^2=0$（幂次 $N-1=0$），$b''=0$ 判不出，$E$ 的核可能严格大于 $\operatorname{span}\{u\}$，单重性断在 global.tex:529-533；引理首行把 $N>1$ 写死正是为此。
- `[推测]` 若唯一连续性不可用（核只在 $O_0$ 局部等于 $\operatorname{span}\{u\}$）：$\tau E$ 支撑外可能有本征函数整片躲开 $O$，$f_m\to f_0$ 的极限不入门的全局核，矛盾论证断在 global.tex:564-566；论文专段核对 Aronszajn 假设（538-541）说明作者知道弱形式不够。
- `[推测]` 若把扰动同时施于 $\rho$：$u$ 保持精确本征函数需要再解一个配对方程，"preserving $u$ and $\rho$ exactly"（490-491 行）的承诺落空，证书盘的同盘迁移链断在 global.tex:645-647。

### 5.15 条目 15：`lem:persistence`（global.tex:635-648）

**(a) 逐字引用。** global.tex:635-648：

```
\begin{lemma}\label{lem:persistence}
Let a smooth positive pair $\mathcal P=(A,\rho)$ have a simple
positive base eigenvalue $\lambda$ and a real eigenfunction with a
sign certificate $\mathcal C$. If $I\subset(0,\infty)$ is an open
interval containing $\lambda$, there are an integer $s\ge1$ and
$\varepsilon>0$ such that every smooth positive pair
$\mathcal P'$ satisfying
\[
 \lVert\mathcal P'-\mathcal P\rVert_{C^s}\le\varepsilon
\]
has a simple eigenvalue in $I$ and a real eigenfunction with the
same certificate disks. Thus a closed ball defined by one finite
norm can be contained in a persistence neighborhood.
\end{lemma}
```

证明 global.tex:650-723 完整闭合。最后一句（"one finite norm"）是它为 thm:main 对角预算服务的理由。

**(b) 推导补全。** 谱框架：双线性形式 $\int_BA(\mathrm d f,\mathrm d v)\mathrm d\mu+\int_B\rho fv\,\mathrm d\mu$ 在 $H^1(B)$ 强制，定义 $-L+1$ 在 $L^2(\rho\mathrm d\mu)$ 的逆；$H^1\hookrightarrow L^2$ 紧致逆紧、自伴，谱定理加椭圆正则给离散非负谱、有限重数、光滑实本征函数，排序本征值服从 min--max，Rayleigh 商 \eqref{eq:weighted-rayleigh}（651-666 行）。$C^0$ 收敛：邻近正张量与正密度的逐点乘性比较把 \eqref{eq:weighted-rayleigh} 对一切 $f$ 夹住，min--max 传序得每个排序本征值随 $C^0$ 收敛；单重 $\lambda$ 用闭包含于 $I$ 的小区间与邻值隔离（668-675 行）。本征函数收敛只需有限阶控制：内部椭圆估计 \eqref{eq:elliptic-persistence-estimate} $\|f\|_{H^{a+2}}\le C_a(\|Lf\|_{H^a}+\|f\|_{L^2})$（682-686 行，Evans 5.6-5.7 与 6.3 节）；$C^4$ 小改动使 $L'-L$ 作为 $H^{a+2}\to H^a$ 对有限个指定的 $a$ 一致小，贡献吸回左端；$a=0,2$ 加本征方程给本征值落在有界区间、$L^2$ 归一的族的统一 $H^4$ 界（689-696 行）。为何 $C^4$ 够：$L$ 的主系数含 $A,\rho$ 零阶、一阶系数至多一阶导（697-701 行）；所以一个有限范数就够，这是"one finite norm"的物理内容。紧性论证：$C^{s}$-收敛列的本征函数 $L^2(\rho_m)$ 归一，正能量界给 $H^4$ 一致界，Rellich 加 4 维 Sobolev 嵌入给子列 $C^0$ 收敛（先 $H^3\hookrightarrow C^0$，703-712 行），极限是 $\mathcal P$ 的归一本征函数，单重性钉死它等于指定本征函数或其负号。证书迁移：有限个严格符号在紧盘上有正的最小绝对裕量（归一后），故足够近的同类本征函数在同一批盘上保号（差整体符号）；不存在更小邻域的情形由反证列+紧性排除（714-721 行）。最后收缩半径使闭球入邻域（720-721 行）。

**(c) 常数与假设的机械理由。** $s\ge1$：由 697-701 行的机制 $s=4$ 级别的有限数即可，具体值不重要、存在性才重要，因为消费方是预算表，并非估计式。$\varepsilon$：依赖 $(\mathcal P,\lambda,I,\mathcal C)$ 全部事前固定。单重性假设：进两处，本征支的连续选择（675 行"still simple"）与极限函数符号二择一（711-712 行）；lem:simplicity 的存在就是为了让每个阶段输出满足它（prop:step 结论含单重，framework.tex:121-147）。"$I$ 开、$\lambda\in I$"：thm:main 取 $I=(k_i^2/2,2k_i^2)$（global.tex:740-743），几何倍数宽的区间使后续阶段 $k_j>2k_{j-1}$ 的分离保证区间两两不交（global.tex:792-793），$\lambda_i$ 因此 $\to\infty$。正密度的角色：范数比较要同时动 $A$ 与 $\rho$，证明末句（722-723 行）专门覆盖"密度也在变"。消费链：thm:main 的 \eqref{eq:diagonal-budgets}（$r_j\ge s_i$、$\eta_j\le2^{-(j-i+1)}\varepsilon_i$）与 \eqref{eq:limiting-eigenvalue-intervals}（780-791 行），这是 $(\delta A,\delta\rho)$-世界与 $g_\infty$-世界之间唯一的桥。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $\lambda$ 非单重：$C^0$ 收敛只给本征值收敛，本征支无法连续选择，极限可能是子空间里随 $m$ 旋转的向量，$C^0$ 裕量论证断在 global.tex:703-712；没有 lem:simplicity 前置，本篇构造根本无法启动迭代。
- `[推测]` 若只用 $C^0$ 邻域（不设 $s$）：本征值持久但本征函数 $C^0$ 收敛需要算子在 $H^a$ 尺度小扰动（690-693 行），$C^0$ 范数不控制一阶系数，$L'-L$ 的 $H^{a+2}\to H^a$ 范数无界，断在 \eqref{eq:elliptic-persistence-estimate} 的吸收步；thm:main 的 $C^1$ 球（global.tex:728-730）与 $C^{s_i}$ 预算是两套，必须各有出处。
- `[推测]` 若证书盘的裕量为零（本征函数在某盘上恒零）：归一化不能排除紧支躲藏，"same certificate disks"（645-646 行）断在 global.tex:714-717；lem:signs 的"采样前确定性盘对"加绝对值 $\ge a'/(2H)$ 的严格裕量正是为把裕量做成可正下界（global.tex:349-353）。

### 5.16 条目 16：无标签 corollary（global.tex:888-905）

**(a) 逐字引用。** global.tex:888-893：

```
\begin{corollary}
For every integer $n>5$ there is a smooth closed connected
$n$-dimensional Riemannian manifold and a fixed $\epsilon_0>0$
with the same divergence of nodal measure divided by
$\lambda^{1/2+\epsilon_0}$.
\end{corollary}
```

证明 global.tex:895-905，短而闭合。注意它不带标签，\eqref 引用不到它；条目地图里我把它编号为 16。

**(b) 推导补全。** 四步。取 $\operatorname{eq:circle-metric}$ 的积与任意固定的光滑闭连通 $(n-5)$-维流形 $(F,h)$：$G^n=S^4\times S^1\times F$，维数 $n$。积拉普拉斯对从底方向拉回函数的作用不引入新项（$h$ 方向导数为零），故 $\Delta_{G^n}(u_i\circ\pi)= (\Delta_gu_i)\circ\pi=\lambda_iu_i\circ\pi$：本征值逐字保留（897-898 行）。证书升级：把原证书每个投影盘 $\times$ 一个紧坐标盒 $D_F\subset F$，$(n-5)$-体积为正（899-901 行）。Lipschitz 投影论证在 $n-1$ 维重来：节点集在柱体 $\times D_F$ 上的切片投影到 $D_i^{(a)}\times I_0\times D_F$，坐标与 Riemannian 距离在紧集上双向 Lipschitz 比较，测量下界获得固定正倍数 $K^{-(n-1)}$ 级常数（901-903 行）。分母不变：$\lambda_i^{1/2+\epsilon_0}$ 与本征值序列原样，比值仍 $\to\infty$（903-905 行）。

**(c) 常数与假设的机械理由。** $n>5$ 是单向操作：积只能加维不能减维，底体 $S^4$（4 维）加圆（1 维）是最小载体，$n=5$ 是本篇定理本体；向下没有已知的乘法逆操作，所以 $n=3,4$ 论文明确交给同伴论文（introduction.tex:44-48），这不是遗漏，是边界声明。$\epsilon_0$ "fixed"：逐字继承主定理的 $\gamma/4$，推论不新产指数。任意 $(F,h)$：证明只用到 $D_F$ 体积为正与度量光滑（紧性给 Lipschitz 常数），对 $F$ 无谱假设，这是"any fixed smooth closed connected"（896-897 行）敢这么写的理由。消费方：摘要与引言的"dimensions five and above"口径（introduction.tex:44-46）。

**(d) `[推测]` 候选失败路线。**
- `[推测]` 若 $F$ 选非连通或带边：闭连通假设进谱框架（lem:persistence 的全局论证在连通底上），带边还要重做边界条件，断在 global.tex:896-897 的引用前提。
- `[推测]` 若 $D_F$ 体积为零（选低维截面）：$(n-1)$-维 Hausdorff 测度乘子为零，下界断在 global.tex:901-903。
- `[推测]` 若试图把该路线倒过来降维到 $n=4$（比如商掉圆方向）：商后 $u_i$ 不再是良定函数（依赖圆方向坐标的构造不存在，但拉回论证本身对"降维"无任何杠杆），断在 global.tex:897-898 的方向性；论文因此把 3、4 维外包，是逻辑必需，并非风格选择。

## 常数与参数台账（即前文承诺的 §6）

先记账前勘误：§0.3 成稿时我把 $\eta_0$ 的位置抄成 envelopes.tex:221，本轮复测逐字行号为 `\begin{lemma}` 区内的 envelopes.tex:222（`Put $\eta_0=(\mathcal W(a)-1)/8$` 所在行），台账按复测为准，其余 §0.3 引用位置全部复核无误。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\delta$ | 固定 $10^{-6}$ | framework.tex:56 | 全文 $k^{\pm c\delta}$ 指数（如 waves.tex:61 的 $\lvert H\rvert\le k^{4\delta}$） | 放大后 waves.tex:439 的 $1/3-206\delta>1/4$ 与 waves.tex:487 的 $1-100\delta>0$ 同时失守 |
| $\theta$ | 仅受 $C_*\theta\le\delta$ 约束，无数值 | envelopes.tex:631 | $m=\lfloor\theta\log k\rfloor$（envelopes.tex:634）与 $\gamma$（635） | 增大则衰减 $ce^{-C_*m}$（envelopes.tex:625）吞掉增益 $(1+\zeta)^m$（envelopes.tex:573） |
| $\mathcal W(a)$ | $3\int_0^1v^2\sqrt{1+a^2F(v)^2}\,\mathrm d v$，断言 $>1$ | envelopes.tex:220 | $\eta_0$（envelopes.tex:222） | 若 $\mathcal W(a)\le1$ 则 $\eta_0\le0$，链条在 envelopes.tex:222 起全线坍塌 |
| $\eta_0$ | $(\mathcal W(a)-1)/8$ | envelopes.tex:222 | $\zeta$（envelopes.tex:493）与裕量账 $1+6\eta_0$（225） | 改除以 4 则 envelopes.tex:240-244 的 $1+5\eta_0$、$1+4\eta_0$ 逐级不等式撞车 |
| $\zeta$ | $\eta_0/(1+\eta_0)$ | envelopes.tex:493 | $\gamma=\theta\log(1+\zeta)$（envelopes.tex:635） | 比例来自 $(1+3\eta_0)/(1+\eta_0)=1+2\eta_0/(1+\eta_0)$（490-491），取 $\eta_0/2$ 断在 envelopes.tex:491 恒等式 |
| $\gamma$ | $\theta\log(1+\zeta)>0$，无数值 | envelopes.tex:635 | prop:envelope 的 $ck^\gamma$（envelopes.tex:533）；lem:signs 的 $c_*k^{1+\gamma}$（global.tex:220） | 减小直接减小 $\epsilon_0$（global.tex:734），宣称不变但机器侧无对应物 |
| $\epsilon_0$ | $\gamma/4$，无数值（C 档） | global.tex:734 | thm:main 的 $\lambda^{1/2+\epsilon_0}$（introduction.tex:36,42） | 任何增大断在 global.tex:875-882 的幂比较 |
| $l^{(j)}$ | $1/4+2^{-j-2}$ | global.tex:733 | 每阶段圆区 $t<l^{(j)}$（global.tex:737-738,755） | 改成非单调序列则 global.tex:754-756 的阶段套用顺序反了 |
| $k$ | $\sqrt{N(N+3)}$（允许频率格） | framework.tex:69 | 圆梁 $u_*$（framework.tex:82）、lem:simplicity 假设 | 取非谱值则 global.tex:55-64 的 $\beta u_*$ 残差界失去方程依据 |
| collar $s_i$ | $l_-+iw/5$（$1\le i\le4$） | global.tex:24 | 切断 $\beta$（48-49）与指数间隙 \eqref{eq:gluing-gaps}（42-45） | 五等分变两等分则间隙 $cw$ 被切断区吃掉，梁控制断在 global.tex:140-152 |
| $W$ | $e^{kh}+\beta(t)e^{kb_N(t)}$ | global.tex:51 | 归一化权重（global.tex:132,399）与 $\lvert \mathrm d W\rvert /W\le Ck^2$（62） | 去掉 $\beta$ 项则 $k^{50}$ 分区不存在，断在 global.tex:140  |
| $r_0$ | $k^{-100\delta}$ | waves.tex:304 | 缩放算子 $\kappa=kr_0Q$（305）与还原费 $r_0^{-2}=k^{200\delta}$（472） | 缩小 100δ 则 waves.tex:421 的三次项吸收 $k^{-1/3+106\delta}\to0$ 失败 |
| 支撑半径 | $\le Ck^{-1/3-100\delta}$ | waves.tex:199 | 未触碰区（global.tex:115）与 collar 阈值（global.tex:596） | 指数变小则 global.tex:596 的 $Ck^{-1/3-100\delta}<w/100$ 对任意固定 $w$ 不成立 |
| $T$ | $>3(M+200\delta+2J+3)$ | waves.tex:486 | 残差三块的第一、二项（waves.tex:477-478） | $T/3$ 预算变 $T/2$（更大束腰）则 Taylor 余项 $k^{2-T/3}$（477）不再被吸收 |
| $s$（振幅阶） | $>(M+200\delta+2J+1)/(1-100\delta)$ | waves.tex:487 | 截尾项 $\kappa^{-s}\mathcal La_s$（waves.tex:455,478） | 分母取 $1-200\delta$ 会击穿 waves.tex:425 的 $\kappa\ge k^{1-100\delta}$ |
| jet 张成 | 中心 $ck^{-3/4}$；$k^{-10}$ 邻域内 $k^{-1}$ | waves.tex:211-213 | lem:noncancellation 的 $k^{-51}$、$k^{260}$（global.tex:160,173） | $k^{-1}$ 恶化到 $k^{-1-\varepsilon}$ 时 global.tex:160 的 $ck^{-1}e^{kh}\ge k^{-52}W$ 需整体重记 |
| $D$ | 固定 500 | global.tex:133,194 | lem:correction 第一假设 $k^{-500}$（global.tex:399） | $D\le452$ 则并集概率 $k^{452-D}$（global.tex:192）不趋零 |
| $b_N$ | $(N/2k)\log(1-t)$ | global.tex:28 | 权重 $W$ 的第二项与间隙（global.tex:42-45） | 换增长率则 $h-b_N$ 的单调性（37-40）断，分区不存在 |
| $k^{2q+41}$ | $41=40+1$ | global.tex:102 | lem:correction 假设（global.tex:403）与 $M$ 预算 | 系数事件上限从 $k$ 改成 $k^2$ 则 $41\to42$，global.tex:582 起全链重排 |
| $2129+1088R$ | $1088=1000+86+2$，$2129=1043+1088-2$ | global.tex:411,453,471 | $M\ge2131+1088R$（global.tex:414,582） | $\mathcal D$ 下界若从 $k^{-1000}$ 弱化，$1000$ 直接进 $1088$ |
| $\mathcal D$ 分母 | $\ge\frac12k^{-1000}\lvert W\rvert^2$ | global.tex:428-429 | $F=-\mathfrak r/\mathcal D$ 的 $C^\infty$ | 无一阶射影下界则除法在该点无定义，断在 global.tex:429 |
| $a'$, $c'$, $H$ | $a'=1/4$；$0<c'<a'/4$；$H$ 取足够大固定 | global.tex:334-335,345 | $\pi_*=c_1/(2H)$（347）与 $H$-依赖进 $c_*,p_*$ | $c'\ge a'/4$ 则 Taylor 异号判定（349-353）失守 |
| $\sigma_*$ | $a'/(4H^2)$ | global.tex:356-357 | 盘体积 $\omega_3\sigma_*^3R_x^3$（global.tex:371） | 半径放大则梯度保号（354-355）不再成立 |
| $p_*$ | $\pi_*/(2-\pi_*)$ | global.tex:368,376 | 联立减法（global.tex:381-384）与 prop:step 概率 | 若 $F_k$ 无上界 1 则单边 Markov（368）断 |
| 证书大小 | $c_*k^{1+\gamma}$ | global.tex:220 | prop:step（global.tex:587）；阶段预算 $c_jk_j^{\gamma/2}>j$（global.tex:761-762） | $\gamma$ 全部被 $j$ 与 $K^{-4}$ 吃掉则 global.tex:867 退化 |
| 阶段松弛 | $\lvert\mathcal C_j\rvert>jk_j^{1+\gamma/2}$ | global.tex:765-766 | eq:final-nodal-lower（global.tex:866-868） | $\gamma/2$ 若改 $\gamma$，global.tex:876-877 的 $\lambda^{1/2+\epsilon_0}$ 比较常数不够 |
| $\lambda_i$ 区间 | $(k_i^2/2,2k_i^2)$ | global.tex:741-743,788-790 | $2^{1/2+\epsilon_0}$ 因子（global.tex:877） | 区间取更宽则几何常数进分母，比值发散仍真但 $c$ 变小 |
| 对角预算 | $r_j=\max\{j+1,1,s_1,\dots\}$；$\eta_j\le2^{-(j-i+1)}\varepsilon_i$ | global.tex:745-749 | 求和极限与持久邻域成员性（global.tex:773-783） | 去掉 $2^{-(j-i+1)}$ 几何衰减则 global.tex:781-783 的 $\varepsilon_i/2$ 求和溢出 |
| Lipschitz 因子 | $K^{-4}$ | global.tex:852-859 | eq:final-nodal-lower（global.tex:866） | 节点测度若改积分式表达，此投影论证（856-859）失去对象 |
| 圆度量 | $g=G_\infty+q^2\mathrm d\varphi^2$，$q=\rho_\infty\mathrm d\mu/\mathrm d\operatorname{vol}_{G_\infty}$ | global.tex:796-808 | eq:circle-operator（global.tex:818-825） | $q$ 不取该密度比则加权算子实现失败，断在 global.tex:818 |

依赖链（文字版）。指数只有一个源头：形状函数 $F$ 与种子幅度 $a$ 进入 $\mathcal W(a)$（envelopes.tex:220），$\mathcal W(a)\to\eta_0\to\zeta\to\gamma$（envelopes.tex:222, 493, 635），$\gamma$ 到 $\epsilon_0=\gamma/4$（global.tex:734）。$\theta$ 是唯一的自由小参数，被 $C_*\theta\le\delta$ 夹住（envelopes.tex:631），它同时控制迭代次数 $m$ 与 $\gamma$ 的比例：$m$ 越多增益 $(1+\zeta)^m$ 越大，但常数衰减 $e^{-C_*m}$ 也越大，$\theta$ 就是这场收支的汇率。$\delta=10^{-6}$（framework.tex:56）不参与增益，它是全场"小数公共资金池"：waves 的 $100\delta$、$9\delta$、$12\delta$、$14\delta$、$20\delta$、$206\delta$ 全部从这里支取，最终靠 $\gamma\le\theta\log(1+\zeta)\le\delta\log(1+\zeta)$ 与它挂钩。消费侧：$\gamma$ 先被 lem:signs 存成证书大小 $c_*k^{1+\gamma}$（global.tex:220），再被 thm:main 分三次支出，一次 $j$ 的松弛（global.tex:762 用掉一半成 $\gamma/2$）、一次 $K^{-4}$、$\omega_3\sigma_*^3$、$|I_0|$ 等测度常数（global.tex:852-871）、最后一次 $\epsilon_0=\gamma/4$ 直接进宣称指数（global.tex:874-883）。$\epsilon_0$ 具体数值全链无一处给出，这是 §0.3 定的头号 C 档发现，台账在此正式结案。

## Lean 取证（即前文承诺的 §7）

### 7.1 登记块逐字抄录

formalization.yaml:1654-1656（三行全量）：

```
    - comparator_config: ComparatorChallenges/YauCounterexample.json
      declaration: OAI.Yau.Target.yau_nodal_set_upper_bound_counterexample
      file: OAI/Geometry/NodalSets/Main.lean
```

书目 formalization.yaml:502-504：

```
  - title: "Power-law violations of Yau's nodal upper bound"
    authors: ["OpenAI"]
    id: ../preprints/Power-law-violations-of-Yaus-nodal-upper-bound-September-23-2026/paper.pdf
```

我实测 `grep -n 'Power-law' formalization.yaml` 命中恰 2 处，都在书目条目内（502 与 504）；`grep -n 'NodalSets' formalization.yaml` 命中恰 1 处（1656）。也就是说全登记册只有一条定理挂在这个模块上。

### 7.2 模块规模与前缀分组

`wc` 实测：`OAI/Geometry/NodalSets/` 共 **1,068 个 .lean 文件 / 74,773 行**。子目录分组（文件数/行数）：

| 子目录 | 文件 | 行数 |
| --- | --- | --- |
| Charts | 261 | 18,422 |
| Coefficients | 81 | 5,823 |
| Elliptic | 509 | 35,284 |
| Hausdorff | 17 | 1,118 |
| Persistence | 10 | 651 |
| SmoothLimit | 13 | 889 |
| Spectral | 57 | 3,947 |
| Waves | 118 | 8,556 |
| 根目录（Main.lean、Model.lean） | 2 | 83 |

文件名前缀分组（首词法）：Seed* 34 文件/2,307 行；Envelope* 7/490；Corrugation* 83/6,275；Sphere* 209/14,240；Recursive* 1/191；名字含 Envelope/Seed/Corrugation 三词的文件合计 10,372 行。顶层声明逐类计数（全模块）：theorem 1,189、lemma 1,905、def 504、abbrev 35、structure 10、instance 7。

审计计数（全部在 NodalSets 范围内 grep）：`sorry` 0 处、`admit` 0 处、行首 `axiom` 0 处、`#print axioms` 0 处、`set_option` 0 处。tactic 词频前十（整模块 cat 后按词元计数，含 term-mode 的 `have/let`）：`have` 7,302、`rw` 3,058、`exact` 2,508、`simp` 2,096、`intro` 1,915、`let` 1,576、`obtain` 1,520、`apply` 1,272、`trans` 1,168、`refine` 993。这个分布是手工代数账的典型指纹：重 `have/rw/exact`、几乎不见 `norm_num/omega/decide` 级机器算术，与"指数台账全靠人工不等式"的论文形态一致。

ComparatorChallenges/YauCounterexample.json 逐字段：`challenge_module: ComparatorChallenges.YauCounterexample`、`solution_module: OAI.Geometry.NodalSets.Main`、`theorem_names: ["OAI.Yau.Target.yau_nodal_set_upper_bound_counterexample"]`、`definition_names: []`、`permitted_axioms: ["propext","Quot.sound","Classical.choice"]`、`enable_nanoda: false`。挑战模板 `ComparatorChallenges/YauCounterexample.lean` 里的 `yau_nodal_set_upper_bound_counterexample : MainTarget := by` 后面是一个 `sorry`，属题目文件本身（解在 NodalSets 内），我按这个分栏记账：解题模块 0 sorry，题目 stub 1 sorry。

### 7.3 六条核心问题逐条回答

**其一，机器认证的是"目标命题"还是"已成立定理"。** Main.lean 全文 14 行，核心逐字：

```
theorem yau_nodal_set_upper_bound_counterexample : MainTarget := by
  obtain ⟨r,delta,s,hfreq,b,hb,hnear⟩ := sphere_iteration_positive_limit
  exact sphere_persistent_limit_implies_main s hfreq b hb hnear
```

这是无 `sorry` 的闭合证明，所以在机器里它是一个**已成立的定理**。但关键在 `MainTarget`（Model.lean 内定义）的内容。逐字抄录（Model.lean:52-66）：

```
def MainTarget : Prop :=
  ∃ (g : SmoothMetric) (lam : ℕ → ℝ) (u : ℕ → Manifold5 → ℝ),
    (∀ k, 0 < lam k) ∧
    (∀ k, u k ≠ 0) ∧
    (∀ k, ContMDiff modelWithCorners 𝓘(ℝ, ℝ) ∞ (u k)) ∧
    (∀ k x, -chartLaplacian g (extChartAt modelWithCorners x) (u k) ((extChartAt modelWithCorners x) x) =
      lam k * u k x) ∧
    Tendsto lam atTop atTop ∧
    Tendsto (fun k ↦ nodalMeasure g (u k) / ENNReal.ofReal (Real.sqrt (lam k)))
      atTop (𝓝 ⊤)
```

量词逐词读：存在一个光滑度量 $g$（`SmoothMetric` 是 `ContMDiffRiemannianMetric ... ∞` 的 abbrev，即 $C^\infty$ 类），存在本征值列 `lam : ℕ → ℝ` 与函数列 `u`，六项合取：逐点正、逐点非零函数、逐点 $C^\infty$、逐点本征方程（以坐标算子 `chartLaplacian` 在扩张图 `extChartAt` 下写出）、$\lambda_k\to\infty$、比值 $\mathcal H^4(\Z(u_k))/\sqrt{\lambda_k}\to\infty$。**决定性事实：分母是 `Real.sqrt (lam k)`，纯 $\sqrt\lambda$，没有任何 $\lambda^{1/2+\epsilon_0}$ 幂。** 机器认证的恰是我在 §2.7 预言的短路线版本：推翻的是"$C(M,g)\sqrt\lambda$"原式上界（比值无界即推翻它），而论文摘要宣称的固定正幂 $\epsilon_0$ 版本在机器里**连命题都不存在**。declaration 名里的 `Target` 指这个 `def MainTarget` 目标命题，`counterexample` 是相对 Yau 上界断言的；名字没有夸大机器内容，但登记册把这条声明挂到"Power-law violations"论文名下，论文宣称严格强于认证内容，这一落差我按论文口径与机器口径**物理分栏**记录，不合并。

**其二，度量是显式张量还是存在式 witness。** 存在式。`MainTarget` 以 `∃ (g : SmoothMetric)` 开头；构造路径为两条引理：SmoothLimit/SphereIterationPositiveLimit.lean:13-18 逐字给出

```
theorem sphere_iteration_positive_limit :
    ∃ (r delta : ℝ) (s : (k : ℕ) → SphereNodalStage r delta k),
      (∀ k, k+1 ≤ (s k).frequency) ∧
      ∃ (b : SphereEnergyData) (_ : ContMDiff (𝓡 4) 𝓘(ℝ,ℝ) ∞ b.density),
        ∀ k, sphereCoefficientDistance (s k).charts 8
          (s k).energy.tensor (s k).energy.density b.tensor b.density < (s k).radius
```

即迭代阶段列 `s` 与极限系数数据 `b` 都是存在式产出（`b` 是每阶段在 `charts 8` 阶、按 `(s k).radius` 预算的 Cauchy 型极限，正是论文 global.tex:773-777 求和极限的机器对应物）；SpherePersistentLimitMain.lean:11-22 再经 `intrinsicWeightedMetric ...` 与 `circleLift` 把 `b` 变成 `MainTarget` 里那个 $g$（warp 圆的机器版在 `circleLift` 一名里）。没有任何一处显式给出 $5\times5$ 张量分量。

**其三，$\epsilon_0$ 在 Lean 里是否有数值。** 没有，且无此角色。全模块 `grep 'ε₀|epsilon'` 命中 17 行，全部是局部稳定性半径：Charts/MetricNormalizationStabilityLemmas.lean:20 `let ε₀ : ℝ := min 1 (1/(2*(H+1)))`、Spectral/MetricProjectionStability.lean:22 `let ε₀ : ℝ := min (1/(P+1)) (1/(2*(H+1)))` 及其 Corrugation* 使用处，与节点幂指数毫无关系。结论与 tex 侧一致：$\epsilon_0$ 数值缺失不是我的检索失败，是两个载体共同的构造性事实。

**其四，节点测度表达与上界对应物。** `nodalMeasure`（Model.lean:41-51）末行逐字：`MeasureTheory.Measure.hausdorffMeasure (4 : ℝ) {x | u x = 0}`，是 Hausdorff 4-维测度式，与论文 $\mathcal H_g^4(\Z(u_i))$ 同型（先重建 Riemannian bundle/Borel 结构实例再取 `hausdorffMeasure`）。`grep -rni 'donnelly|fefferman'` 在模块内 0 命中：机器侧**没有**任何 DF 型上界不等式作为被推翻对象出现，$\sqrt\lambda$ 只作为被除分母出现。被挑战的"上界断言"在比较体系里只存在于 json/自然语言层，不在命题层。

**其五，三步正文的机器对应。** `waves.tex` 对应 Waves 组（118 文件/8,556 行，文件如 AffineGaussianSmallBall、CosineCovarianceBounds、FiniteWaveJet，正是包络、小概率球与射影三件套）；`envelopes.tex` 对应 Charts 组（261/18,422）加 Seed/Envelope/Corrugation 前缀组（2,307+490+6,275 行）与 Hausdorff 组的 EnvelopeNodalGain、SeedWindowNodalLower 等；`global.tex` 对应 Coefficients（81/5,823，修正与残差账）、Spectral（57/3,947，min--max 与单重性）、Persistence（10/651）、SmoothLimit（13/889，迭代与极限对）。最吃行数的是 **Elliptic 组：509 文件/35,284 行，占全模块 47%**，而它不逐段对应论文任何一节，是内部椭圆估计、紧性、唯一连续性类的基础设施，说明机器化成本的大头在论文没写的分析底座上，不在论文写的指数账上。

**其六，1,068 文件是否共用底座。** 证据全为否。其一，`grep -rh 'import' NodalSets` 只出现 `OAI.Geometry.NodalSets.*` 与 Mathlib，无跨模块依赖；其二，NodalSets 之外无任何文件 import 它（`grep -rln 'NodalSets' /e/math/lean/OAI` 排除自身后 0 命中）；其三，yaml 全册只有 1656 一行指向该模块；其四，队列里含下界/定性断言的邻篇（三维与四维 SmoothYau）注册在 yaml:1522-1528，声明 `OAI.YauCounterexamples.sphere_three` 与 `OAI.YauCounterexamples.sphere_two_torus_two`，文件在独立的 `OAI/Geometry/SmoothYau/`（实测 436 文件/99,645 行），comparator 用 SmoothYau.json。结论：NodalSets 是**本篇独占**的底座，不是共用基座；`Recursive*` 仅 1 文件/191 行也支持"共享递归 jet 组件"假设不成立。

### 7.4 机器与论文的宣称落差（本节结论）

把 7.3 合起来：机器证明了目标命题，目标命题是 $\mathcal H^4/\sqrt\lambda\to\infty$；论文宣称 $\mathcal H^4/\lambda^{1/2+\epsilon_0}\to\infty$ 且 $\epsilon_0>0$ 固定。前者是后者的逻辑推论（论文链条若全部成立则机器命题自动成立），但反向不成立：机器没有为幂律提供任何证据。C 档的 $\epsilon_0$ 无数值问题，在 Lean 侧升级为"无命题"。我在 §4.3 的账目因此有了硬边界：纸面上 $\gamma\to\epsilon_0$ 的兑换率全部成立，但**没有任何一方给出过一次代入**。

## 外部文献检索（即前文承诺的 §8）

### 8.1 检索强度分级与本次检索的边界

先把可用的证据档位定下来，后文每条书目都挂一个档位，避免把"我看到过一个链接"写成"我核对过原文"。

- A 档：外部页面被实际抓取，抓取结果进入本节判断。本次只有 1 条到 A 档（Logunov 上界论文的 arXiv 摘要页），且抓取到的是工具侧的转述文本，属于"摘要级 A 档"，比正文核对低半级。
- B 档：检索命中了可识别的标题页或聚合页链接，我没有打开正文。多数条目在此档。
- C 档：只有本地 `build/references.bib` 与 tex 里的引用句，外部零命中。
- 反例线（Harder 或 Harding、Sffi、Tri）与 Hassell--Hsiung 线：连 B 档都没有，全部降级为 `[推测]`，并按"不能确认存在"处理。

工具侧的硬约束记一下：本仓库 PDF 全程未读（加密，且属派单禁令），所以论文的正式出版版式、页码、定理编号我都无法一手核对；能核对的只有 bib 字段之间的自洽性。下面凡是说"自洽"的地方，指的都是 bib 字段内部互证（DOI 号、页区间、卷期号互相吻合），并非与外部原文比对的结果。

### 8.2 `references.bib` 全库清点

`wc -l build/references.bib` = 143 行，`grep -c '^@'` = 12 条条目，条目起始行依次为 1, 16, 28, 40, 52, 64, 76, 91, 101, 114, 125, 137。类型分布实测：`@article` 8 条（行 16, 28, 40, 52, 64, 91, 101, 114）、`@incollection` 2 条（行 1, 76）、`@book` 1 条（行 125）、`@misc` 1 条（行 137）。全库 `\cite` 命令实测 15 处，12 个 key 全部被用过，既无孤儿条目也无悬空 key（逐处位置见下表最后一栏）。

| key | bib 行 | 类型 | 外部可核字段（本地口径） | 论文中被引位置 | 档位 |
| --- | --- | --- | --- | --- | --- |
| Yau1982 | 1 | incollection | Annals of Mathematics Studies 102, 669--706, DOI 10.1515/9781400881918-035 | introduction.tex:10 | B |
| DonnellyFefferman1988 | 16 | article | Invent. Math. 93(1), 161--183, DOI 10.1007/BF01393691 | introduction.tex:14（p. 162）、:58（Thm 1.2） | C |
| LogunovUpper2018 | 28 | article | Annals of Mathematics (2) 187(1), 221--239, DOI 10.4007/annals.2018.187.1.4, url 指向 p04 | introduction.tex:62（Thm 6.2） | A（摘要级） |
| LogunovLower2018 | 40 | article | 同卷 187(1), 241--262, DOI 10.4007/annals.2018.187.1.5, url 指向 p05 | introduction.tex:60（Thm 1.1） | B |
| Hezari2023 | 52 | article | Comm. Math. Phys. 404(3), 1341--1359, DOI 10.1007/s00220-023-04853-z | introduction.tex:67（无定位符） | B |
| EncisoPeraltaSalas2015 | 64 | article | J. Differential Geom. 101(2), 197--211, DOI 10.4310/jdg/1442364650 | introduction.tex:77（无定位符） | C |
| EncisoPeraltaSalasTorres2018 | 76 | incollection | Springer Proc. in Math. & Stat. 346, 245--261, year 2021, DOI 10.1007/978-981-33-4822-6_7, url 指向 arXiv:1810.09277v1 | introduction.tex:81（无定位符） | C |
| Aronszajn1957 | 91 | article | J. Math. Pures Appl. (9) 36, 235--249, url 是 UW 站点的 PDF | global.tex:541（pp. 235--236） | B |
| DenckerSjostrandZworski2004 | 101 | article | Comm. Pure Appl. Math. 57(3), 384--415, DOI 10.1002/cpa.20004, note 字段声明定位符按 arXiv:math/0301242v1 | waves.tex:12（Sec. 3） | C |
| CharalambousLu2015 | 114 | article | J. Geom. Anal. 25, 536--563, DOI 10.1007/s12220-013-9438-1 | global.tex:803（Sec. 4 eq. (2)） | C |
| Evans2010 | 125 | book | GSM 19, 第二版, 2010 | global.tex:332（5.6--5.7）、:688（5.6--5.7 与 6.3） | C |
| OpenAINodalQualitative2026 | 137 | misc | author 为机构名 OpenAI，howpublished 内嵌指向另一 preprint 目录的 GitHub 链接 | introduction.tex:54（Thms 1.1 and 1.2） | C |

字段自洽性的几个实测点，逐个记下来，因为它们是"bib 有没有被认真填"的直接证据。第一，两篇 Logunov 同卷相邻（187 卷 1 期，p04 与 p05），页区间 221--239 与 241--262 之间正好留出一页间隙，符合同刊连续排版的惯例。第二，Donnelly--Fefferman 的 `p.~162` 落在其页区间 $\lvert 161,183\rvert$ 之内（严格说是落在区间里，不是端点）。第三，Aronszajn 的定位符 pp. 235--236 落在 235--249 的起点，是"引理开头两页"的自然取法。第四，`10.4310/jdg/1442364650` 这个 DOI 尾段是 Unix 时间戳，换算到 2015 年 9 月，与 year 字段 2015 一致；`10.1007/s12220-013-9438-1` 内嵌 2013（接收年）与 year 字段 2015（出版年）不冲突。第四点里两处 DOI 都能对上，说明书目不是随手拼的，这对后面判断"外部反例线是否被故意漏引"有影响。

一处 key 与 year 的错位要记录：`EncisoPeraltaSalasTorres2018`（bib 行 76）的 `year = {2021}`，而 url 是 `arXiv:1810.09277v1`。机械解释是命名按预印本年份（2018 年 10 月）、出版按 Springer 会议集（2021）。tex 端（introduction.tex:77-81）没有写年份，所以这个错位不进入任何数学断言；我记它只是为了说明书目的时间层次，别把 2018 当成正式出版年去查。

### 8.3 必查四条线的检索强度实录

**Yau 问题清单。** 派单口径是"Yau 1984 问题清单"，本库 bib 行 1-14 只有 `Yau1982`（*Problem section*, Seminar on Differential Geometry, Annals of Mathematics Studies 102, 669--706）。tex 端 introduction.tex:10 的引用句是背景定位，没有陈述具体问题号。我做到的档位是 B：命中了讨论 Yau 节点猜想的聚合页面（上海师大、同济的 seminaring 页面），确认了"节点集测度上界 $\le C\sqrt\lambda$ 属 Yau 问题清单"这一通行口径，但没有打开 669--706 的原文目录去核对问题编号。`[推测]` 两处：一，1984 版可能是 Yau 在 Trieste 学院讲义里的另一版问题清单，节点猜想在两版中都出现，故对本篇论文无实质影响；二，本库引 1982 版是标准做法。派单与 bib 的年份不一致，以 bib 为准，这条计入 8.5 的勘误表。

**Donnelly--Fefferman 1988。** 我停在了 C 档，是四条线里最弱的一条，而这恰恰是派单要求"注明检索强度"最要命的地方。我能确认的只有：bib 字段内部自洽（Invent. Math. 93(1) 161--183，DOI 10.1007/BF01393691 与 Springer 的老 DOI 前缀 `BF0139` 格式相符）；论文在两处依赖它，introduction.tex:14 用 `p.~162` 作背景定位，introduction.tex:58 用 `Theorem~1.2` 支撑"实解析度量下的双侧尖锐估计"这一句承重墙断言。我没能确认的是：Theorem 1.2 的实际陈述是否恰好是"解析情形下 $c\sqrt\lambda\le\mathcal H^{n-1}\le C\sqrt\lambda$"，以及论文的"解析上界成立、光滑上界被推翻"这套对比是否依赖 DF 定理的确切形式。`[推测]` 结论：从 tex 的叙述逻辑倒推，作者需要 DF 提供的是解析情形的上界一侧，这与 bib 的 title（*Nodal sets of eigenfunctions on Riemannian manifolds*）和 1988 年的通行理解吻合，但这一条在本笔记里始终是"我只看到断言"级别。与 §7.4 呼应一次：Lean 侧 `grep -i 'donnelly\|fefferman'` 命中 0，机器里连 DF 的名字都没有，更没有解析情形 $\lambda^{1/2}$ 上界的对应命题。

**反例线（派单写作 Harding--Sffi--Tri）。** 0 命中，而且这次我特意把姓氏改为 Harder 重拼再爬一次（`Harder Sffi Tri nodal sets eigenfunctions counterexample`），返回的仍是聚合页与无关条目（学位论文、双调和算子节点集上限、量子图 hot spots 等），没有任何一条能识别为"光滑度量节点上界的幂律反例"的先行工作。本地侧证据同样是 0：`grep -ri 'harding\|sffi\|zelditch\|hassell\|hsiung' build/sections/*.tex build/references.bib` 命中 0 行。`[推测]` 三点，分开写以免混成一坨：一，派单里的三人组合我无法确认存在，姓氏拼写可能本身就记错了；二，从书目看，本篇的"反例"叙事在文献层面只有一个前驱，就是 `OpenAINodalQualitative2026`（bib 行 137，同一批 OpenAI 工作的定性版本），也就是说这条反例线在外部文献里是自我指涉的，没有第三方先行反例被承认；三，如果确实存在光滑情形幂律上界的先行反例，那它是被"故意漏引"还是"不存在"，我手上的工具分不出来，这条只能挂账不结论。第二点对本篇的定位很关键：新颖性锚点完全建立在自家 companion 论文之上。

**Zelditch 的下界。** B 档偏 C：命中了 Steven Zelditch 维基条目与综述 arXiv:0911.4312（*Recent developments in mathematical quantum chaos*）的链接，没有取到 1990 年代那篇下界原文。本地书目里根本没有 Zelditch（`grep -i zelditch` = 0）。`[推测]` 判断：Zelditch 的节点集下界属实解析/随机波框架，与本篇光滑构造在假设层就不相接，论文不引他与不引 DF 是两回事（DF 被引是因为要用作对比面），从 introduction.tex:56-71 的 Background 段落结构看，作者刻意只把"上界线"作为对照，下界线（Logunov Lower、Nadirashvili）只在 :69-71 被一句话保护起来。这条判断依赖段落布局的读法，不是外部证据。

**Hassell--Hsiung 的负结果。** 0 命中，两次检索（含本轮 `Hassell Hsiung nodal set upper bound negative result eigenfunction`）返回的全是 Logunov、Hezari 与无关条目，我无法确认存在这样一篇文献，也无法确认"负结果"指的是哪一类主张（可能是对某个下界或某个猜测的否定）。派单要求不许硬编，那我就不硬编：本笔记按"未能在允许的工具与轮次内确认，且本仓库 tex 与 bib 均无对应引文"处理，后续若复核，起点应该是把姓氏关系拆开单查（Hassell 与 Zelditch 有合作、Hsiung 单独检索），并非再爬一次同一组合词。`[推测]` 一句：这条线的缺席对本篇的数学判断没有影响，因为论文没有把任何"负结果"当作前提，它的前提全在自己构造里（详见 §2 三条错误路线）。

### 8.4 论文口径与外部口径的分栏对账

下面这一栏的意义是把"论文说了什么"和"我在论文之外查到什么"物理隔开，同一行两栏永远不许互相冒充。

| 论文口径（tex 逐字/摘要） | 外部检索到的口径（含档位） |
| --- | --- |
| introduction.tex:60-62：光滑度量下 Logunov 给出"with a dimension-dependent exponent"的多项式上界，定位符 Theorem 6.2 | arXiv 摘要页（A 档，摘要级）：紧 $C^\infty$ 流形上 $\mathcal H^{n-1}\{\varphi_\lambda=0\}\le C\lambda^\alpha$，$\alpha>1/2$ 为常数；$\alpha$ 的具体数值与 Theorem 6.2 的编号都未取到 |
| introduction.tex:69-71：本文推翻 Yau 光滑上界那一部分，连 relaxed estimate 也推翻，下界结果与本文相容 | 无外部对照：这是论文自述的作用域限定，本仓库外的页面没有一篇提到本篇论文 |
| introduction.tex:63-68：Hezari 在 Gevrey 类 $s\ge1$ 得 $\lambda^{s/2}$，某准解析类得 $\sqrt\lambda\log(\lambda+e)$，并强调"These hypotheses do not cover arbitrary smooth metrics" | B 档：命中 Hezari 2023 CMP 标题页，指数口径与 tex 一致；正文未取，故"准解析类的具体定义"不可核 |
| introduction.tex:50-54：companion 论文构造固定光滑度量与 $\lambda\to\infty$ 的特征函数列，使 nodal 测度除以 $\sqrt\lambda$ 发散，且"without asserting a fixed positive power-law excess" | 无法验证：bib 行 137 的链接指向 `preprints/Smooth-counterexamples-to-Yaus-nodal-upper-bound-in-dimensions-three-and-four-...`，本仓库只有本篇目录，磁盘上没有 companion 的 tex |
| introduction.tex:73-84：Enciso--Peralta-Salas 与 EPST 的节点几何 prescribed 线"already gives arbitrarily high frequencies on fixed analytic metrics"，但供不了总测度的幂律超出 | C 档：两篇均未取正文，"prescribed"线的确切定理形态不可核 |
| global.tex:541（Aronszajn 唯一延拓）与 global.tex:803（Charalambous--Lu 截面度量公式） | B/C 档：Aronszajn 的 url 是可下载的 PDF 站点但我没打开（本仓库禁 PDF，外部 PDF 我没取，属工具选择，并非障碍）；Charalambous--Lu 的 Sec. 4 eq. (2) 停在 C 档 |
| waves.tex:12（DSZ 拟谱，Sec. 3）与 global.tex:332, :688（Evans 章节号） | C 档：bib 行 101 的 `note` 字段特别声明"Section locators follow arXiv:math/0301242v1"，说明作者自己清楚正式出版版式与预印本版式的定位符会漂移；Evans 只给章节，属教科书式引用，不可复核也不可反驳 |

对账里最实质的一条是 Logunov 上界指数与本篇 $\epsilon_0$ 的关系，值得单独算一遍。外部摘要说 $\alpha>1/2$ 是某个常数（按 tex 的说法是维数依赖），本库全篇没有给出 $\alpha$ 的数值，而本篇的结论是 $\mathcal H^4\ge\lambda_i^{1/2+\epsilon_0}$ 沿一列成立（global.tex:866-868），且 $\epsilon_0=\gamma/4$（global.tex:733-734）从未数值化。于是逻辑格局是：$\frac12+\epsilon_0$ 与 $\alpha(5)$（或 $S^4\times S^1$ 对应的维数口径）谁大，本笔记无法判定；paper 在 introduction.tex:69-71 只声明推翻"$\sqrt\lambda$ 型光滑上界与 near-sharp target"，把 Logunov 的多项式上界留在射程之外，这个限定与外部 A 档摘要完全兼容。反过来说，如果读者把标题"Power-law violations of Yau's nodal upper bound"读成"推翻了光滑情形的多项式上界"，那是超出 tex 断言的读法，与 §4.4 的标题会计问题同源。

### 8.5 本节产生的勘误与限制清单

一，`references.bib` 的行数。§0.1 落盘时写作 137 行，实测 143 行。机械成因可查：137 恰好是第 12 条条目 `@misc{OpenAINodalQualitative2026,` 的起始行号，我当时把"最后一条 @ 的行号"记成了"文件总行数"，差值 6 行正是该 misc 条目的正文（bib 行 138--143）。条目数 12、类型分布 8/2/1/1、`\cite` 处数 15 这三项与 §0.1 的记录一致，无需改。

二，Yau 问题清单的年份。派单口径 1984，本库口径 1982（bib 行 1--14），以 bib 为准；两版问题清单是否都含节点猜想，我未核，已标 `[推测]`。

三，Theorem 6.2 / Theorem 1.1 / Theorem 1.2 三处外部定理编号。introduction.tex:58, :60, :62 的定位符全部指向他人论文的定理号，我一条都没能一手核对（PDF 禁令 + 外部正文未取）。这不影响本篇内部推理的自洽性检查（§2 到 §5 全部只对内部文件），但影响"作者是否准确转述了 Logunov 上界的强度"这一外部判断，本节按不可核处理。

四，检索本身的强度上限。本轮记入的 WebSearch 是 2 次（拼写改过的 Harder 组合词、Hassell--Hsiung 组合词），WebFetch 2 次，其中 1 次被 Project Euclid 的反爬挡回（返回的是 Incapsula 错误页，无任何数学内容），只有 arXiv 摘要页真正提供了可用于判断的文本。本节落盘前另外做过 3 次检索（主题分别是 Yau 节点猜想清单、Donnelly--Fefferman、Logunov 上界/下界与其 Annals 卷期），原始 query 字符串没有保留在当前上下文里，所以我不复述它们的长度与命中数，只按主题记为 B 档。全节最终判定：A 档 1 条、B 档 4 条、C 档 5 条、0 命中 2 条（反例线、Hassell--Hsiung），`[推测]` 集中出现在 8.3 的后四条线里。

五，书目层面的一条结构性观察。12 条书目里 8 条是 1988--2023 的正规期刊论文，1 条教科书，1 条会议集，2 条是 2026 年的 OpenAI 预印本体系内部互引（本篇 + companion）。`[推测]`：这个配比说明论文把可信度全部押在"经典上界线的准确转述"上，并非押在"与前人反例的区分"上；配合 8.3 反例线 0 命中读，本篇的外部锚点数量是 2（DF 与 Logunov），而内部锚点数量是 1（companion），后者恰好也是 Lean 目标命题的形状来源。§7.3 与 §7.4 因此在这里闭环：机器版本对应的是 introduction.tex:50-54 那句"除以 $\sqrt\lambda$ 发散、不宣称固定幂律超出"的 companion 口径，而标题与 §4 的账目属于只有纸面证据的另一栏。

### 8.6 交卷前的自检读数与一次文内修订记录

本节是自检，把散在全文的口径统一报一遍，数字都是 `wc` 与 `grep -c` 实测，不是估的。

- 素材面：tex 侧编号语句 16 条，全部按 (a) 逐字引用加 `文件:行号`、(b) 中间步骤补全、(c) 常数与指数的机械理由、(d) 2 到 3 条候选失败路线的四段式写过（§5.1 到 §5.16）；台账节 31 行参数，五列栏名按规格，无空格、无占位符，绝对值一律写成 `\lvert\rvert`。
- 机器面：Lean 侧 1,068 个文件 / 74,773 行的分组规模、声明计数（theorem 1,189、lemma 1,905、def 504、abbrev 35、structure 10、instance 7）、sorry/admit/axiom/#print axioms 全 0、tactic 词频前十、`ComparatorChallenges/YauCounterexample.json` 的 permitted_axioms 三项，全部记录在 §7.2，六条核心问题在 §7.3 逐条作答。
- 文献面：bib 12 条、`\cite` 15 处、类型 8/2/1/1，检索分档 A 档 1 条、B 档 4 条、C 档 5 条、0 命中 2 条；`[推测]` 在全文的实测行数为 82 行（§8 全节贡献 10 处，其中本句自指 1 处），每条都紧贴它所修饰的那句判断，没有集中倾倒。
- 一次修订记录：§5.15 的 (b) 段原有一处被禁的中文破折号（紧跟在"（697-701 行）"之后，即本笔记 §0.3 明令禁用的那个符号），与 §0.3 立的文风规矩（中文里禁用该符号，人名分隔用两个连字符、区间用一个连字符）冲突。我在交卷前把它换成中文分号，只改一个标点，该行其余文字一字未动，也不涉及任何断言的增删。这次改动记录在此，是为了让"禁令命中数为 0"这个读数有据可查，并非靠事后调整统计口径得来；本条自身的文字也刻意避开了那个符号，否则它会自己成为新的命中行。
- 三处已知不可核项，最后再钉一次，防止后续读者把它们当成已核：Logunov 上界的定理号（Theorem 6.2）与指数数值、DF Theorem 1.2 的确切陈述、companion 论文的任何内容。这三项的强度上限由 §8.1 的分级决定，而它们恰好都是外部对照面；本篇内部链条（§2 到 §5 的失败点与转折点）不依赖它们，这一点在 §8.4 的分栏表里按行分开列着。

本节也顺带回答了派单里那句"尤其要盯住 $\epsilon_0$ 的具体数值到底在哪里被生产出来"：全文检索的结果是它从未被生产，tex 侧只生产到 $\epsilon_0=\gamma/4$ 这一层兑换率（global.tex:733-734），而 $\gamma=\theta\log(1+\zeta)$ 的三个上游因子（$\theta,\zeta$ 与 $m=\lfloor\theta\log k\rfloor$）每一个都只被约束在不等式里，没有一个被赋过值；Lean 侧更彻底，连含 $\epsilon_0$ 幂的命题都不存在，目标分母是 `Real.sqrt (lam k)`。这条结论同时是全篇宣称强度最低、证据最强的一格，所以我把它放在 §4.3、§7.4 与 §8.6 三处各说一次，并非只说一次。
