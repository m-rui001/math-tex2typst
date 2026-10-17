# C45 随机k-SAT的缩放窗口（arXiv:2609.26222）

## 0 取证边界

- arXiv id：2609.26222
- 原题名（逐字）：The Scaling Window of Random $k$-SAT（短题名与全称题面在 `main.tex:51-52`）
- 作者（逐字，API 署名）：Gaia Carenini；`main.tex:55-56` 的署名注记：Department of Pure Mathematics and Mathematical Statistics, University of Cambridge, United Kingdom，邮箱 gc645@cam.ac.uk
- 发表年月：2026-08-11
- 素材目录：`E:\math\被引素材/2609.26222`
- 主 `.tex` 清单：`被引素材/2609.26222/main.tex`（96434 字节，派单记 2310 行，盘面按换行符计 2309 行，无 CR）；目录内另有 `00README.json`（213 字节），未作为内容来源。宏定义全在 `main.tex:33-47` 的 preamble 内，无独立 macro 文件。
- 本语料引用它的稿号与 bib key：D458（bib key `Carenini2026`）；D729（bib key `Carenini`）。两份稿的 key 不同，转引时需按各自 bib 条目处理。
- 结构登记（`main.tex` 行位）：preamble 与宏 `1-49`；题署与摘要 `51-64`；Section 1 Introduction `66-145`；Section 2 Preliminaries and overview of the main theorem `147-418`，其中概览小节 `383-417`；Section 3 Proof of the abstract window theorem `419-692`；Section 4 Exceptional fibres and two local-to-random reduction `693-929`；Section 5 A finite criterion for forbidden-pattern systems `930-1216`；Section 6 Pointwise cubical replacement over a finite alphabet `1217-1275`；Section 7 Random atomic CSPs `1276-1626`；Section 8 Random signed NAE-$k$-SAT `1627-1879`；Section 9 Random hypergraph two-colourability `1880-2107`；Section 10 Concluding remarks `2108-2150`，其小节 The Abbe--Montanari reduction 在 `2111-2150`；Acknowledgments `2151-2160` 附近。编号设置为 `\numberwithin{equation}{section}`（`main.tex:13`），定理族 thm/cor/lem/prop/defn/rem 共用一个 section 内计数器（`main.tex:16-25`）。
- 素材引用链中的外部结果只按本稿转述取用：Friedgut–Bourgain 的 $O(n/\log\log n)$、Keevash–Lifshitz–Long–Minzer 的加性 hypercontractivity（`main.tex:435-447` 以 Theorem 形式完整重述，未引外部编号）、Bollobás–Borgs–Chayes–Kim–Wilson 的 2-SAT 分析、Abbe–Montanari 的推论尺度、Perkins 综述提出的问题。本笔记不读 `main.tex` 之外的任何文件，故 bib 条目细节（`refs.bib` 未在目录中）不作来源。
- 本笔记的公式一律用 KaTeX 可读形式转写；素材自定义宏就地展开：`\F`→$\mathcal F$、`\G`→$\mathcal G$、`\W`→$\mathcal W$、`\SmallN`→$\mathrm{Small}$、`\Bin`→$\mathrm{Bin}$、`\E`→$\mathbb E$、`\Pp`/`\Prob`→$\mathbb P$、`\1`→$\mathbf 1$、`\NAE`→$\mathrm{NAE}$、`\bits`→$\{0,1\}$、`\Taut`→$\mathrm{Taut}$、`\Cover`→$\mathrm{Cover}$。

## 1 申报的界与它在阈值理论中的位置

摘要给出的申报（`main.tex:59-62`）拆成四条可引用结论：

1. 一般性上界：对稀疏单调覆盖问题（sparse monotone covering problems）的缩放窗证一个通用上界。
2. 特化到随机 $k$-SAT：对每个固定的 $k\ge3$，窗为
$$
W(n)=O\!\left(\frac{n}{\log n}\right)\ \text{条子句},
$$
把 Friedgut–Bourgain 的 $O(n/\log\log n)$ 改进了一个 $\dfrac{\log n}{\log\log n}$ 因子（`main.tex:120-123`）。
3. 同样阶的两个非原子 CSP 模型：随机 signed Not-All-Equal-$k$-SAT 与随机 $k$-一致超图的非二着色性（Property B），窗都是 $O(n/\log n)$（`main.tex:61`、`main.tex:132`）。
4. 方法学申报：机制是 Keevash–Lifshitz–Long–Minzer 对 Bourgain 锐阈值定理的加性强化，加上一个 local-to-random replacement 原理；这直接回答 Perkins 综述里"是否存在系统得到窗量级界的方法"这一问题（`main.tex:61`、`main.tex:117-118`）。

问题提法的三层结构（`main.tex:68-77`）：随机离散结构发生相变后有三问：相变位置在哪、是否锐（即窗相对位置是否小）、以及定量地窗有多小。前两问已有通用理论：定位用一、二阶矩方法或统计物理的精细方法；锐性从 Kahn–Kalai–Linial 的影响理论出发，经 Bourgain、Friedgut、Hatami 的锐阈值机械得到一般充分条件（`main.tex:81-84`）。近年推进是 Park–Pham 证明 Kahn–Kalai 的期望阈值猜想，其基础是 Frankston–Kahn–Narayanan–Park 的分数期望阈值定理，再往前是 Alweiss–Lovett–Wu–Zhang 对向日葵猜想的突破；Park–Pham 的结论是阈值位置在一个对数因子内由一个简单组合覆盖参数决定（`main.tex:84`）。

第三问没有可比的一般理论。`main.tex:86-94` 的诊断值得逐字取用：锐阈值定理通常是定性的，只保证窗比阈值位置小，不给可用的量级；文献里已有的窗界都来自针对单一模型精细结构量身定做的论证，最完整的是 Bollobás–Borgs–Chayes–Kim–Wilson 对随机 2-SAT 的分析，它依赖相变的详细组合描述，而 $k\ge3$ 时这种描述不可得。

$k$-SAT 是这一落差的标杆（`main.tex:96`）：Friedgut（附 Bourgain 附录）1999 年即证对每个固定 $k\ge3$ 阈值锐，但把定理性语句翻译成显式窗界只得到 $O(n/\log\log n)$（`main.tex:96` 引 BalBourgain 与 PerkinsSurvey），且该界二十五年未被改进。

动机强度由 Abbe–Montanari 的定理标定（`main.tex:98-104`）：若窗阶为 $n/\log^{1+\delta}n$（任意固定 $\delta>0$），则对可满足性猜想（对每个固定 $k$ 存在渐近良定义的临界子句密度）有重大后果。`main.tex:123-128` 对本文结果划界十分明确，转引时必须保留：得到的是窗的上界改进，不是匹配下界，且未达到 Abbe–Montanari 所需的尺度；结语一节（`main.tex:2108-2150`）解释本法推到极限恰好只给一个 $\log n$ 的幂、不会更多。

抽象定理的两个输入（`main.tex:109-112`、`main.tex:114-118`）：其一，事件的短极小见证必须稀有；其二，由 Bourgain 型定理量化形式给出的确定性概率提升必须能被"添加真正随机坐标"以可比强度复现。加性输入用 KLLM 的全局函数 hypercontractivity 定理；模拟步骤（把小的确定性有用坐标集转成可比效果的随机集）是本稿新增，正是它把论证与单一模型的特殊组合结构解耦。

三个应用模型的局部对称性差别（`main.tex:131-144`）：signed NAE-$k$-SAT 的每个子句有自己的否定模式，因而禁止一个任意反足局部赋值对 $\{a,\bar a\}$；Property B 是其无符号对应，变量表示两种顶点颜色，每条超边只禁止两个单色赋值 $0^k$、$1^k$。单个 signed NAE 子句可通过翻变量变成无符号子句，但这些翻转在重叠子句之间必须一致，故两模型本质不同（`main.tex:132`）。NAE 模型的全局补对称使它与普通 $k$-SAT 结构不同，它在可满足性阈值与凝聚/解空间几何研究中都是基准模型；Property B 是该区最老的模型之一，Erdős 的原始概率论证早于现代阈值文献（`main.tex:134-139`）。三个模型局部对称性不同，因此 local-to-random 替换论证在每例中形态不同；`main.tex:141-144` 声明 Section 4 与 Section 5 把公共部分分离出来，并把模型相关验证打包成一个基于刚性证书与局部导出约束和原始随机约束比较的有限可核查判据。

## 2 窗的定义、方差尺度与三个模型之间的转移

设定（`main.tex:151-168`）。$\Omega_n$ 为有限坐标集，$N_n=\lvert\Omega_n\rvert$，$\mathcal F_n\subseteq2^{\Omega_n}$ 为非平凡单调事件，$\mu_p$ 为 $2^{\Omega_n}$ 上的积测度。对 $0<\alpha<1$ 定义
$$
p_\alpha=p_\alpha(n):=\inf\{p\in[0,1]:\mu_p(\mathcal F_n)\ge\alpha\}.
$$
$p\mapsto\mu_p(\mathcal F_n)$ 连续，故 $\mu_{p_\alpha}(\mathcal F_n)=alpha$ 的等号成立（`main.tex:158`，原文即写作 $\mu_{p_\alpha}(\mathcal F_n)=\alpha$）。对 $0<\eta<1/2$ 定义中央窗（以期望坐标数计）与两个中央尺度：
$$
W_\eta(n)=N_n(p_{1-\eta}-p_\eta),\qquad
M_\eta(n)=\sup_{p\in[p_\eta,p_{1-\eta}]}pN_n,\qquad
V_\eta(n)=\inf_{p\in[p_\eta,p_{1-\eta}]}N_np(1-p).
$$
$M_\eta$ 是中央区间内的期望规模上界，$V_\eta$ 是二项方差下界，后文所有对数都落在 $\log V_\eta(n)$ 上。

积测度是影响不等式的自然语言，随机 CSP 通常以"精确 $m$ 条独立抽取的约束"表述，故 `main.tex:170-173` 建立 Generic 转移。对 $0\le m\le N_n$ 令 $\nu_m$ 为 $\binom{\Omega_n}{m}$ 上的均匀测度，$a_m=\nu_m(\mathcal F_n)$，单调性使 $(a_m)$ 不减。再定义
$$
m_\alpha=\min\{m:a_m\ge\alpha\},\qquad \widehat W_\eta(n)=m_{1-\eta}-m_\eta .
$$

**命题（积测度到均匀层的转移，`main.tex:183-231`）**：对每个固定 $0<\eta<1/2$ 与所有充分大的 $n$，
$$
\widehat W_\eta(n)\le W_{\eta/4}(n)+C_\eta\sqrt{M_{\eta/4}(n)+1},
$$
从而若 $M_{\eta/4}(n)=O(n)$ 且 $W_{\eta/4}(n)=O(n/\log n)$，则 $\widehat W_\eta(n)=O(n/\log n)$。证明链完整可抄：取 $p_-=p_{\eta/4}$、$p_+=p_{1-\eta/4}$、$B_\pm\sim\operatorname{Bin}(N_n,p_\pm)$、$\sigma_\pm^2=N_np_\pm(1-p_\pm)$；取 $t=t(\eta)$ 满足 $t^{-2}\le\min\{1/2,\eta/4\}$，令
$$
r_-=\bigl\lfloor N_np_--t(\sigma_-+1)\bigr\rfloor,\qquad
r_+=\bigl\lceil N_np_++t(\sigma_++1)\bigr\rceil .
$$
关键恒等式 $\mu_p(\mathcal F_n)=\mathbb E\,a_{\operatorname{Bin}(N_n,p)}$ 加上 $(a_m)$ 不减，给出 Chebyshev 两步估计
$$
\frac{\eta}{4}=\mathbb E a_{B_-}\ge a_{r_-}\mathbb P(B_-\ge r_-)\ge\frac12 a_{r_-},\qquad
1-\frac{\eta}{4}=\mathbb E a_{B_+}\le a_{r_+}+\mathbb P(B_+>r_+)\le a_{r_+}+\frac{\eta}{4},
$$
于是 $a_{r_-}<\eta$、$a_{r_+}>1-\eta$，即 $m_\eta>r_-$、$m_{1-\eta}\le r_+$，故
$$
\widehat W_\eta(n)\le N_n(p_+-p_-)+C_\eta(\sigma_-+\sigma_++1)\le W_{\eta/4}(n)+C_\eta\sqrt{M_{\eta/4}(n)+1}.
$$
这里只用了一层恒等式与一次切比雪夫，转移误差是 $\sqrt M$ 量级。更正一处本笔记前笔的排版：下文中"$\mu_{p_\alpha}(\mathcal F_n)=alpha$"的等式右端应读作 $\alpha$。

**命题（转移到独立抽取约束，`main.tex:233-278`）**。令 $\widetilde\nu_m$ 为：独立均匀抽 $Q_1,\dots,Q_m\in\Omega_n$，保留不同坐标组成集合；记 $\widetilde a_m=\widetilde\nu_m(\mathcal F_n)$，$\widetilde m_\alpha$、$\widetilde W_\eta$ 同构定义。若中央区间内 $m=O(n)$ 且 $N_n=\Omega(n^2)$，则
$$
\widetilde W_\eta(n)\le \widehat W_{\eta/4}(n)+O_\eta(1).
$$
证明的核心是重数期望的界：设 $S_m=\{Q_1,\dots,Q_m\}$、$L_m=\lvert S_m\rvert$、$D_m=m-L_m$，条件于 $L_m=\ell$ 时 $S_m$ 在 $\binom{\Omega_n}{\ell}$ 上均匀，且
$$
\mathbb E D_m\le\sum_{1\le i<j\le m}\mathbb P(Q_i=Q_j)=\frac{\binom m2}{N_n}=O(1),
$$
该估计在中央区间内一致成立，故存在 $T=T(\eta)$ 使 $\mathbb P(D_m>T)\le\eta/4$。下界方向：$m<m_{\eta/4}$ 时 $L_m\le m$ 且单调性给 $\widetilde a_m\le a_m<\eta$。上界方向：取 $m=m_{1-\eta/4}+T$，则 $D_m\le T$ 蕴含 $L_m\ge m_{1-\eta/4}$，于是
$$
\widetilde a_m=\mathbb E a_{L_m}\ge\left(1-\frac{\eta}{4}\right)\mathbb P(D_m\le T)\ge\left(1-\frac{\eta}{4}\right)^2>1-\eta .
$$
合并得 $\widetilde m_\eta\ge m_{\eta/4}$、$\widetilde m_{1-\eta}\le m_{1-\eta/4}+T$。

**推论（线性中央尺度的模型转移，`main.tex:280-290`）**：若 $N_n=\Omega(n^2)$、中央期望规模 $\Theta(n)$、且每个固定中央水平上 Bernoulli 窗为 $O(n/\log n)$，则同一 $O(n/\log n)$ 界在固定大小均匀模型与独立抽取模型中都成立；理由是转移误差 $O(\sqrt n)$ 与 $O_\eta(1)$ 都是 $o(n/\log n)$。这一段是本文三个应用能把"伯努利子句"与"精确 $m$ 条子句"两种表述混用的凭据；两个前提的验证（$N_n=\Theta(n^k)$ 与中央规模 $\Theta(n)$）在各模型节以"自动线性中央尺度"推论给出。

## 3 抽象窗定理：极小见证剪枝、干净提升集与可模拟性

**见证剪枝**（`main.tex:293-317`）。设 $\mathcal F_n$ 由一簇 inclusion-极小见证 $\mathcal W_n$ 生成：$X\in\mathcal F_n$ 当且仅当存在 $Y\in\mathcal W_n$ 使 $Y\subseteq X$，且每个 $Y$ 关于该性质极小。对 $s\ge1$ 定义
$$
\mathrm{Small}_{n,s}=\{X:\exists Y\in\mathcal W_n,\ \lvert Y\rvert\le s,\ Y\subseteq X\},\qquad
\mathcal G_{n,s}=\{X:\exists Y\in\mathcal W_n,\ \lvert Y\rvert>s,\ Y\subseteq X\},
$$
于是
$$
\mathcal G_{n,s}\subseteq\mathcal F_n\subseteq\mathcal G_{n,s}\cup\mathrm{Small}_{n,s}\ \text{(3.1)}
$$
（素材编号 `main.tex:307-310`），且 $\mathcal G_{n,s}$ 单调。$\mathrm{Small}_{n,s}$ 记录短极小见证的出现，$\mathcal G_{n,s}$ 只由长见证生成；这组包含式允许"先剪掉短见证、施加 Bourgain 型定理、再以可控误差回到原事件"。

**干净提升集**（`main.tex:319-325`）。称 $A\subseteq\Omega_n$ 为密度 $p$、尺度 $K$ 下的 clean booster，若
$$
A\notin\mathcal F_n,\qquad \lvert A\rvert=O(K),\qquad
\mu_p\!\left((\mathcal F_n)_{A\to1}\right)-\mu_p(\mathcal F_n)\ge\exp(-O(K)).
$$
条件 $A\notin\mathcal F_n$ 是本质的：提升集揭示有用的局部结构，但自身已含见证时无从再"提升"。

**定义（可模拟的干净提升集，`main.tex:327-349`）**：称 $(\mathcal F_n)$ 在中央区间上有 simulable clean boosters，若对每个 $0<\eta<1/2$ 与每个输入常数 $C_0>0$，存在常数 $C_1,c>0$，使得只要
$$
p\in[p_\eta,p_{1-\eta}],\quad 1\le K\le c\log V_\eta(n),\quad
A\subseteq\Omega_n,\ A\notin\mathcal F_n,\ \lvert A\rvert\le C_0K,\
\mu_p((\mathcal F_n)_{A\to1})\ge\mu_p(\mathcal F_n)+\exp(-C_0K),
$$
就存在有限坐标集 $\Omega'$、单调事件 $\mathcal H\subseteq2^{\Omega'}$、整数 $D\le\exp(C_1K)$，满足 $|\Omega'|p(1-p)\ge cV_\eta(n)$，并且对 $X'\sim\mu_p$（在 $2^{\Omega'}$ 上）与 $R_D$（$\Omega'$ 中 $D$ 个独立均匀随机坐标组成的多重集，与 $X'$ 独立）有
$$
\mathbb P\!\left(X'\cup R_D\in\mathcal H\right)\ge\mu_p(\mathcal H)+\exp(-C_1K).
$$
第二条假设刻意经由辅助事件 $\mathcal H$ 表述（`main.tex:352-356`）：应用中先施加局部提升集会暴露一个低维纤维，天然的随机撒点生活在该纤维对应的坐标集上，不在原坐标集上；$\mathcal H$ 上的方差比较保证这次传递不摧毁层估计所需的尺度。

**主定理（`main.tex:358-377`）**。固定 $0<\eta<1/2$，设 $V_\eta(n)\to\infty$ 且对所有充分大的 $n$ 有 $p_{1-\eta}\le1/2$。假设：

- (i) 存在常数 $B,c,C>0$，使对每个 $1\le K\le c\log V_\eta(n)$ 与 $s=BK$，
$$
\sup_{p\in[p_\eta,p_{1-\eta}]}\mu_p(\mathrm{Small}_{n,s})\le\exp(-CK),
$$
其中引理（剪枝干净提升集提取，参数 $\eta/2$）的常数为 $B_{\eta/2}$、$C_{\eta/2}^{\rm wit}$，且要求
$$
B\ge B_{\eta/2},\qquad
C\ge \max\left\{C_{\eta/2}^{\rm wit}+\log4,\ \log(2/\eta)\right\};
$$
- (ii) $(\mathcal F_n)$ 有 simulable clean boosters。

则
$$
W_\eta(n)\le C_\eta\,\frac{M_\eta(n)}{\log V_\eta(n)}.
$$

用法说明（`main.tex:379-381`）：当 $M_\eta(n)$ 与 $V_\eta(n)$ 可比多项式大小时定理才有用；本文三个应用中两者都是 $\Theta(n)$，于是结论变成 $W_\eta(n)=O(n/\log n)$。范围注记（`main.tex:684-689`）：$p_{1-\eta}\le1/2$ 只为对齐 KLLM 定理的形式，原子 CSP 应用中它由线性中央尺度（相关概率满足 $p=\Theta(n^{1-k})$）自动成立；除两条假设外，抽象定理不使用任何对称性或 CSP 结构。

## 4 抽象窗定理的证明链

**输入一：加性 Bourgain 定理**（KLLM，素材以 Theorem 形式重述于 `main.tex:427-447`，引外部 Theorem 1.4）。先固定记号：$I_p(f)=\sum_{i\in\Omega}\mathbb P_p(i\text{ 对 }f\text{ 为枢轴})$ 为总 $p$-偏影响，Russo 公式写作单调 $f$ 的 $\frac{d}{dp}\mu_p(f)=I_p(f)$。定理：对每个 $0<\eta<1/2$ 存在 $C_\eta<\infty$，若 $f:2^\Omega\to\{0,1\}$ 单调、$0<p\le1/2$、$\eta\le\mu_p(f)\le1-\eta$ 且 $pI_p(f)\le K$，则存在 $J\subseteq\Omega$ 使
$$
\lvert J\rvert\le C_\eta K,\qquad
\mu_p(f_{J\to1})\ge\mu_p(f)+\exp(-C_\eta K),
$$
其中 $f_{J\to1}$ 是把 $J$ 的每个坐标置 $1$ 所得。

**输入二：从 KLLM 提升集到干净提升集**（`main.tex:449-531`）。命题内容：固定 $0<\eta<1/2$，存在 $B_\eta>0$、$C_\eta^{\rm wit}>0$、$C_\eta^{\rm cl}>0$，使得当 $0<p\le1/2$、$K\ge1$、$s\ge B_\eta K$、$\eta\le\mu_p(\mathcal G_{n,s})\le1-\eta$、$pI_p(\mathcal G_{n,s})\le K$ 且
$$
\mu_p(\mathrm{Small}_{n,s})\le\frac14\exp(-C_\eta^{\rm wit}K)
$$
时，存在非空 $A\subseteq\Omega_n$ 满足 $A\notin\mathcal F_n$、$\lvert A\rvert\le C_\eta^{\rm cl}K$、$\mu_p((\mathcal F_n)_{A\to1})\ge\mu_p(\mathcal F_n)+\exp(-C_\eta^{\rm cl}K)$。

证明的常数选取（逐字取数，`main.tex:469-475`）：记 KLLM 常数为 $C_{\rm K}=C_{\rm K}(\eta)$，取
$$
B_\eta=2C_{\rm K},\qquad C_\eta^{\rm wit}=C_{\rm K},\qquad
C_\eta^{\rm cl}\ge(1+\log2)C_{\rm K}+\log(4/3).
$$
对 $\mathcal G_{n,s}$ 施 KLLM 得 $J$，$\lvert J\rvert\le C_{\rm K}K\le s/2$，且以 $\delta=e^{-C_{\rm K}K}$
$$
\mu_p((\mathcal G_{n,s})_{J\to1})\ge\mu_p(\mathcal G_{n,s})+\delta .
$$
单调性把该式等价改写为 $\mathbb P(X\notin\mathcal G_{n,s},\ X\cup J\in\mathcal G_{n,s})\ge\delta$（$X\sim\mu_p$）。以 $\mu_p(\mathrm{Small}_{n,s})\le\delta/4$ 削去短见证事件，剩
$$
\mathbb P(X\notin\mathcal G_{n,s},\ X\notin\mathrm{Small}_{n,s},\ X\cup J\in\mathcal G_{n,s})\ge\frac{3\delta}{4},
$$
而该事件上 $X\notin\mathcal F_n$（由包含式 (3.1)）。固定 $\mathcal W_n$ 的任意序，取 $Y=Y(X)$ 为其中第一个满足 $Y\subseteq X\cup J$、$\lvert Y\rvert>s$ 的极小见证，令 $A_X=Y\cap J$。三步论证干净性：$A_X\ne\varnothing$（否则 $Y\subseteq X$，与 $X\notin\mathcal F_n$ 矛盾）；$\lvert A_X\rvert\le\lvert J\rvert\le s/2<\lvert Y\rvert$ 故 $A_X\subsetneq Y$；若 $A_X\in\mathcal F_n$ 则 $A_X$ 含某极小见证 $Y'\subseteq A_X\subsetneq Y$，与 $Y$ 的 inclusion-极小性矛盾，于是 $A_X\notin\mathcal F_n$。又
$$
Y=(Y\cap X)\cup(Y\cap J)\subseteq X\cup A_X,
$$
故 $X\cup A_X\in\mathcal F_n$。鸽巢：$A_X$ 至多 $2^{\lvert J\rvert}\le\exp(C_{\rm K}K\log2)$ 个取值，故存在固定非空 $A\subseteq J$、$A\notin\mathcal F_n$ 使
$$
\mathbb P(X\notin\mathcal F_n,\ X\cup A\in\mathcal F_n)
\ge\frac34\exp\!\left(-(1+\log2)C_{\rm K}K\right)
\ge\exp(-C_\eta^{\rm cl}K).
$$
末步用单调事件的恒等式
$$
\mu_p((\mathcal F_n)_{A\to1})-\mu_p(\mathcal F_n)=\mathbb P(X\notin\mathcal F_n,\ X\cup A\in\mathcal F_n),
$$
与 $\lvert A\rvert\le C_{\rm K}K\le C_\eta^{\rm cl}K$。`main.tex:533-540` 的注记点明机理：剪枝参数 $s$ 远大于提升集规模 $\lvert J\rvert$，于是新大见证落在 $J$ 内的部分是严格子见证、不能已经强制 $\mathcal F_n$，这正是干净条件 $A\notin\mathcal F_n$ 的来源。

**输入三：随机坐标的层增量上界**（`main.tex:542-592`）。设 $\mathcal H\subseteq2^\Omega$ 单调、$|\Omega|=N$、$0<p<1$、$D\ge0$ 整数；$X\sim\mu_p$，$Y$ 由 $X$ 添加 $D$ 个独立均匀随机坐标得到（允许重复、已存在坐标忽略）。则
$$
\mathbb P(Y\in\mathcal H)-\mathbb P(X\in\mathcal H)\le C\min\left\{1,\frac{D+1}{\sqrt{Np(1-p)}}\right\}.
$$
证明：定义层密度 $a_r=\lvert\mathcal H\cap\binom{\Omega}{r}\rvert/\binom Nr$；单调性借布尔格的规范化匹配性质使 $(a_r)$ 不减。$S=\lvert X\rvert\sim\operatorname{Bin}(N,p)$，条件于 $S=s$ 时 $X$ 在该层均匀，添加 $D$ 个坐标后集合大小至多 $s+D$、条件于最终大小仍均匀，故
$$
\mathbb P(Y\in\mathcal H\mid S=s)-\mathbb P(X\in\mathcal H\mid S=s)\le a_{s+D}-a_s
$$
（$t>N$ 时约定 $a_t=1$），取期望得 $\mathbb P(Y\in\mathcal H)-\mathbb P(X\in\mathcal H)\le\mathbb E[a_{S+D}-a_S]$。令 $\Delta_j=a_j-a_{j-1}\ge0$（$j<0$ 补 $0$、$j>N$ 补 $1$），则
$$
\mathbb E[a_{S+D}-a_S]=\sum_j\Delta_j\mathbb P(j-D\le S\le j-1)
\le\sup_t\mathbb P(S\in[t-D,t])\sum_j\Delta_j
\le\sup_t\mathbb P(S\in[t-D,t]),
$$
再用二项局部界 $\sup_t\mathbb P(S=t)\le C/\sqrt{Np(1-p)}$ 与至多 $D+1$ 个连续值求和，并与平凡界 $1$ 取小。

**主证明（反证，`main.tex:596-681`）**。以参数 $\eta/2$ 调用干净提升集引理（常数记 $B_{\eta/2},C_{\eta/2}^{\rm wit},C_{\eta/2}^{\rm cl}$），以输入常数 $C_0=C_{\eta/2}^{\rm cl}$ 调用可模拟性定义（得 $C_{\rm sim},c_{\rm sim}$），缩小 $c$ 使 $c\le c_{\rm sim}$；假设 (i) 给 $B\ge B_{\eta/2}$、$C\ge C_{\eta/2}^{\rm wit}+\log4$、$e^{-C}\le\eta/2$。反设
$$
W_\eta(n)\ge L\,\frac{M_\eta(n)}{\log V_\eta(n)}
$$
（$L=L_\eta$ 待定），置
$$
K_0=\max\left\{1,\frac{M_\eta(n)}{W_\eta(n)}\right\}\le1+\frac1L\log V_\eta(n),
$$
取 $L$ 大、$n$ 大使得 $K_0\le c\log V_\eta(n)$，并令 $s=BK_0$。假设 (i) 在 $K=K_0$ 处给
$$
\sup_{p\in[p_\eta,p_{1-\eta}]}\mu_p(\mathrm{Small}_{n,s})\le e^{-CK_0}\le e^{-C}\le\eta/2,
$$
于是对中央区间内每个 $p$，由 (3.1) 有 $\eta/2\le\mu_p(\mathcal G_{n,s})\le1-\eta/2$。Russo 公式给出
$$
\int_{p_\eta}^{p_{1-\eta}}I_p(\mathcal G_{n,s})\,dp
=\mu_{p_{1-\eta}}(\mathcal G_{n,s})-\mu_{p_\eta}(\mathcal G_{n,s})\le1,
$$
而 $p_{1-\eta}-p_\eta=W_\eta(n)/N_n$，故存在 $p\in[p_\eta,p_{1-\eta}]$ 使 $I_p(\mathcal G_{n,s})\le N_n/W_\eta(n)$，从而
$$
pI_p(\mathcal G_{n,s})\le\frac{pN_n}{W_\eta(n)}\le\frac{M_\eta(n)}{W_\eta(n)}\le K_0 .
$$
干净提升集引理给出非空 $A\subseteq\Omega_n$，$A\notin\mathcal F_n$、$\lvert A\rvert\le C_{\eta/2}^{\rm cl}K_0$、
$$
\mu_p((\mathcal F_n)_{A\to1})\ge\mu_p(\mathcal F_n)+e^{-C_{\eta/2}^{\rm cl}K_0}.
$$
可模拟性给出 $\Omega'$、单调 $\mathcal H\subseteq2^{\Omega'}$、$D\le e^{C_{\rm sim}K_0}$，满足 $|\Omega'|p(1-p)\ge c_{\rm sim}V_\eta(n)$ 与
$$
\mathbb P(X'\cup R_D\in\mathcal H)-\mu_p(\mathcal H)\ge e^{-C_{\rm sim}K_0}.
$$
层增量引理把两端夹住：
$$
e^{-C_{\rm sim}K_0}\le C_{\rm lay}\frac{D+1}{\sqrt{|\Omega'|p(1-p)}}\le\frac{C_\eta e^{C_{\rm sim}K_0}}{\sqrt{V_\eta(n)}}.
$$
取对数得 $K_0\ge c_\eta'\log V_\eta(n)$（某 $c_\eta'>0$、$n$ 充分大），与 $K_0\le1+\frac1L\log V_\eta(n)$ 冲突，只要取 $L>2/c_\eta'$ 再取 $n$ 大。结论成立且 $C_\eta$ 可取为该 $L$。补回前一笔中被本笔记自己丢掉的收束段（原样恢复）：整条链的结构值得单独记录：窗宽假设 $\Rightarrow$ $K_0\asymp M_\eta/W_\eta$ 小 $\Rightarrow$ 剪枝无害 $\Rightarrow$ Russo 提供一点使 $pI_p\le K_0$ $\Rightarrow$ KLLM 提供提升集 $\Rightarrow$ 极小性论证把它变干净 $\Rightarrow$ 可模拟性换成 $D\le e^{O(K_0)}$ 个真随机坐标 $\Rightarrow$ 层增量上界 $O(D/\sqrt{V_\eta})$ 与提升量 $e^{-O(K_0)}$ 比较，得 $K_0=\Omega(\log V_\eta)$。两侧对 $K_0$ 的上、下界互斥即证。

## 5 例外纤维机制的两个通用定理

三个应用的局部几何不同，但纤维论证的概率部分相同，`main.tex:693-700` 把它拆成两个结果：第一个把"二项族形式的低元数有用对象"转成固定数量的独立均匀助手；第二个把两类局部对象之间的逐点幂比较转成保持正超额概率的平均替换定理。

**设定**（`main.tex:702-705`）：$X$ 有限集，$\mathcal Q$ 为 $X$ 的有限子集族；对子族 $\mathcal S\subseteq\mathcal Q$ 记 $\bigcup\mathcal S=\bigcup_{Q\in\mathcal S}Q$；$\theta$-随机子族指每个成员以概率 $\theta$ 独立保留。

**引理（二项到独立的助手提取，`main.tex:707-771`）**。设 $B$ 为 $X$ 的随机子集，$\mathcal H_\theta$ 为与 $B$ 独立的 $\mathcal Q$ 的 $\theta$-随机子族，$\zeta=\mathbb P(B=\varnothing)$、$\lambda=\theta|\mathcal Q|$。若对某 $K\ge1$、$\Lambda\ge1$、$0<\beta\le1/2$ 有 $\lambda\le\Lambda K$ 且
$$
\mathbb P\!\left(B\subseteq\bigcup\mathcal H_\theta\right)\ge\zeta+\beta,
$$
则存在只依赖 $\Lambda$ 的常数 $C$，使得只要
$$
|\mathcal Q|\ge\frac{4\left\lceil C\bigl(K+\log(1/\beta)\bigr)\right\rceil^2}{\beta},
$$
就有整数 $1\le d\le\left\lceil C(K+\log(1/\beta))\right\rceil$，使 $d$ 个与 $B$ 独立的均匀随机成员 $Q_1,\dots,Q_d\in\mathcal Q$ 满足
$$
\mathbb P(B\subseteq Q_1\cup\cdots\cup Q_d)\ge\zeta+\frac{\beta}{2}.
$$
证明的三步定量结构：其一，$L=|\mathcal H_\theta|\sim\operatorname{Bin}(|\mathcal Q|,\theta)$，取 $T=\lceil C(K+\log(1/\beta))\rceil$ 使标准二项上尾估计给出 $\mathbb P(L>T)\le\beta/8$，依据是当 $T\ge e^2\lambda$ 时
$$
\mathbb P(L\ge T)\le\left(\frac{e\lambda}{T}\right)^T\le e^{-T},
$$
而 $T$ 的取法同时保证 $T\ge e^2\lambda$ 与 $e^{-T}\le\beta/8$。其二，条件于 $L=\ell$ 时 $\mathcal H_\theta$ 是 $\mathcal Q$ 的均匀 $\ell$ 元子族，令
$$
b_\ell=\mathbb P\!\left(B\subseteq\bigcup\mathcal S_\ell\right)-\zeta\ge0,\qquad b_0=0,
$$
则
$$
\beta\le\sum_{\ell\ge0}\mathbb P(L=\ell)b_\ell\le\sum_{1\le\ell\le T}\mathbb P(L=\ell)b_\ell+\mathbb P(L>T),
$$
故存在 $1\le d\le T$ 使 $b_d\ge7\beta/8$。其三，$\mathcal Q$ 的均匀 $d$ 元子族与"$d$ 个独立均匀抽样条件于无碰撞"同分布，两分布的全变差距离至多碰撞概率
$$
\frac{\binom d2}{|\mathcal Q|}\le\frac{\beta}{8},
$$
于是独立抽样的超额至少 $7\beta/8-\beta/8\ge\beta/2$。

**推论（对数尺度的助手提取，`main.tex:773-790`）**：固定正常数 $C_1,C_2,a$，若 $\lambda\le C_1K$、$\beta\ge e^{-C_2K}$、$|\mathcal Q|\ge n^a$、$1\le K\le c\log n$，则 $c=c(C_1,C_2,a)>0$ 充分小时结论以 $1\le d\le CK$、超额至少 $e^{-CK}$ 成立（$C=C(C_1,C_2,a)$）。核账只需两点：$T=O(K)$，且 $K\le c\log n$ 时
$$
\frac{4T^2}{\beta}\le CK^2e^{C_2K}\le n^a .
$$

**定理（平均幂替换，`main.tex:794-844`）**。设 $\mathcal Q,\mathcal R$ 为同一有限集 $X$ 的两个有限子集族，对 $S\subseteq X$ 记
$$
\rho_{\mathcal Q}(S)=\mathbb P_{Q\in\mathcal Q}(S\subseteq Q),\qquad
\rho_{\mathcal R}(S)=\mathbb P_{R\in\mathcal R}(S\subseteq R)
$$
（均匀取成员）。给定 $\gamma\ge1$、$c_*>0$、$\varepsilon_0\ge0$，假设逐点比较
$$
\rho_{\mathcal Q}(S)\ge\varepsilon\ge\varepsilon_0\ \Longrightarrow\ \rho_{\mathcal R}(S)\ge c_*\varepsilon^\gamma
$$
对一切 $S\subseteq X$ 成立。设 $B$ 为 $X$ 的随机子集（与所有局部对象独立）、$\zeta\in[0,1]$，且 $d\ge1$ 个独立均匀 $\mathcal Q$-成员以至少 $\zeta+\alpha$ 的概率覆盖 $B$，并设 $\varepsilon:=\frac{\alpha}{4d}\ge\varepsilon_0$。则存在整数
$$
D\le C_{c_*,\gamma}\,d^{1+\gamma}\alpha^{-\gamma}\log(2d/\alpha)
$$
使 $D$ 个独立均匀 $\mathcal R$-成员以至少 $\zeta+\alpha/2$ 的概率覆盖 $B$。

证明是逐块替换（Lin式）论证：把 $Q_1,\dots,Q_d$ 一次一个换成 $\mathcal R$ 的独立块，每步用新随机性；条件于 $B$、其余局部对象与更早插入的块，当前 $Q_i$ 仍独立均匀。设 $S\subseteq B$ 为其余对象未覆盖的残余集，当前条件成功概率即 $\rho_{\mathcal Q}(S)$。若 $\rho_{\mathcal Q}(S)<\varepsilon$，删 $Q_i$ 换任意新块的损失小于 $\varepsilon$；否则逐点比较给 $\rho_{\mathcal R}(S)\ge c_*\varepsilon^\gamma$，于是规模
$$
g=\left\lceil C_{c_*,\gamma}\varepsilon^{-\gamma}\log(1/\varepsilon)\right\rceil
$$
的独立 $\mathcal R$-块遗漏 $S$ 的概率至多 $\varepsilon$。两种情形下替换在条件意义（从而无条件意义）上损失至多 $\varepsilon$；$d$ 次替换总损失至多 $d\varepsilon=\alpha/4$，末态成功概率至少 $\zeta+3\alpha/4$（强于所申）。取 $D=dg$ 并代 $\varepsilon=\alpha/(4d)$，调常数即得所申 $D$ 的界。

**命题（例外纤维给出的可模拟性判据，`main.tex:846-917`）**。固定 $0<\eta<1/2$。设对每个输入常数 $C_0>0$ 存在正常数 $C,c,c_{\rm var},c_*,C_{\rm th},b$ 与 $\gamma\ge1$，使得每当 $p\in[p_\eta,p_{1-\eta}]$、$1\le K\le c\log V_\eta(n)$、$A\subseteq\Omega_n$ 为干净提升集（$A\notin\mathcal F_n$、$\lvert A\rvert\le C_0K$、$\mu_p((\mathcal F_n)_{A\to1})\ge\mu_p(\mathcal F_n)+e^{-C_0K}$）时，存在：

- (i) 有限状态空间 $X$、有限坐标集 $\Omega'$、一簇子集 $(R_\omega)_{\omega\in\Omega'}\subseteq X$，定义单调覆盖事件
$$
\mathcal H=\left\{Y\subseteq\Omega':X\subseteq\bigcup_{\omega\in Y}R_\omega\right\};
$$
- (ii) 有限助手族 $\mathcal Q$（$X$ 的子集族）与整数 $1\le d\le CK$，使得对 $X'\sim\mu_p$（在 $2^{\Omega'}$ 上）、
$$
B=B(X'):=X\setminus\bigcup_{\omega\in X'}R_\omega,
$$
以及独立于 $X'$ 的 $d$ 个均匀随机 $\mathcal Q$-成员 $Q_1,\dots,Q_d$，有
$$
\mathbb P(B\subseteq Q_1\cup\cdots\cup Q_d)\ge\mu_p(\mathcal H)+e^{-CK};
$$
- (iii) 逐点比较
$$
\rho_{\mathcal Q}(S)\ge\varepsilon\ge C_{\rm th}V_\eta(n)^{-b}
\ \Longrightarrow\
\rho_{\Omega'}(S)\ge c_*\varepsilon^\gamma,
\qquad
\rho_{\Omega'}(S)=\frac1{|\Omega'|}\bigl\lvert\{\omega\in\Omega':S\subseteq R_\omega\}\bigr\rvert ;
$$
- (iv) 方差比较 $|\Omega'|p(1-p)\ge c_{\rm var}V_\eta(n)$。

则 $(\mathcal F_n)$ 在中央区间上有 simulable clean boosters。

证明只需把两个通用定理串联：置 $\alpha=e^{-CK}$、$\varepsilon=\alpha/(4d)$；由 $d\le CK$，缩小 $c$（作为 $C,b$ 的函数）后 $K\le c\log V_\eta(n)$ 保证
$$
\varepsilon\ge\frac{e^{-CK}}{4CK}\ge C_{\rm th}V_\eta(n)^{-b},
$$
故 (iii) 落在平均幂替换的适用范围内。把助手族 $\mathcal Q$ 与带 $\Omega'$-重数的原生族 $(R_\omega)_{\omega\in\Omega'}$ 代入该定理，得
$$
D\le C_{c_*,\gamma}d^{1+\gamma}\alpha^{-\gamma}\log(2d/\alpha)\le\exp(C'K)
$$
个独立均匀坐标 $\omega_1,\dots,\omega_D\in\Omega'$ 满足
$$
\mathbb P\!\left(B\subseteq R_{\omega_1}\cup\cdots\cup R_{\omega_D}\right)\ge\mu_p(\mathcal H)+\frac{\alpha}{2},
$$
而括号内事件恰为 $X'\cup\{\omega_1,\dots,\omega_D\}\in\mathcal H$；$K\ge1$ 时 $\alpha/2\ge e^{-C''K}$，(iv) 提供所需方差比较，故正是可模拟性定义。

`main.tex:919-927` 的注记给出使用手册：每例中"最大局部拟覆盖"与例外纤维是模型相关的，一旦识别出来，其余部分是形式的：与提升集变量相交的已选约束构成低元数助手的二项族，施对数尺度助手提取推论；再施一个模型相关的、形如逐点幂比较的估计调用平均幂替换定理，产出可模拟性所需的随机原生约束。

## 6 禁止模式系统的有限判据

**框架**（`main.tex:938-951`）。固定有限字母表 $\Sigma$、整数 $k\ge2$、非空有限族 $\mathscr P\subseteq\{非空真子集\subseteq\Sigma^k\}$，并假设 $\mathscr P$ 对 $k$ 个坐标的置换封闭。$k$-集合 $S=\{i_1<\dots<i_k\}$ 上的 $\mathscr P$-约束是二元组 $(S,P)$，$P\in\mathscr P$，它覆盖满足 $(x_{i_1},\dots,x_{i_k})\in P$ 的赋值 $x\in\Sigma^n$。定义
$$
\Omega_n(\mathscr P)=\binom{[n]}k\times\mathscr P,\qquad
N_n(\mathscr P)=|\mathscr P|\binom nk,
$$
$\mathcal F_n(\mathscr P)$ 为"所选约束覆盖整个 $\Sigma^n$"这一事件。取有限群 $\Gamma\le\operatorname{Sym}(\Sigma)$，使每个 $P\in\mathscr P$ 在对角作用下不变。在 $\Sigma^k$ 上定义预序
$$
u\preceq_{\mathscr P}v\ \Longleftrightarrow\
\{P\in\mathscr P:u\in P\}\subseteq\{P\in\mathscr P:v\in P\},
$$
对单射 $\phi:[k]\to R$ 记 $x_\phi=(x_{\phi(1)},\dots,x_{\phi(k)})$。

**定义（刚性）**：系统 $(\mathscr P,\Gamma)$ 刚性，若存在整数 $L\ge k$，使得对任意有限集 $R$、每个符号在 $\sigma\in\Sigma^R$ 中出现至少 $L$ 次、且 $\tau\in\Sigma^R$ 满足
$$
\tau_\phi\preceq_{\mathscr P}\sigma_\phi\qquad\text{对每个单射 }\phi:[k]\to R,
$$
都有 $\tau=g\sigma$（某 $g\in\Gamma$）。

**有限证书**（`main.tex:980-1011`）。令 $T_L=\Sigma\times[L]$、$\sigma_L(a,j)=a$；对 $a\in\Sigma$ 令 $T_{L,a}=T_L\cup\{*\}$、$\sigma_{L,a}(*)=a$。则 $(\mathscr P,\Gamma)$ 以 $L$ 为刚性参数当且仅当两条有限断言成立：(i) 每个满足上述局部条件（$\sigma=\sigma_L$）的 $\tau\in\Sigma^{T_L}$ 都等于某 $g\sigma_L$；(ii) 对每个 $a\in\Sigma$、$g\in\Gamma$ 与满足条件（$\sigma=\sigma_{L,a}$）的 $\tau\in\Sigma^{T_{L,a}}$，若 $\tau|_{T_L}=g\sigma_L$，则 $\tau(*)=g(a)$。特别地，"某个 $L$ 是否为合法刚性参数"可由只依赖 $\Sigma,k,\mathscr P,\Gamma,L$ 的有限计算判定。证明的正向：取 $T\subseteq R$ 恰含每个 $\sigma$-值 $L$ 个坐标，把 $T$ 认作 $T_L$ 后用 (i) 得 $\tau|_T=g\sigma|_T$；再对每个 $i\in R\setminus T$ 对 $T\cup\{i\}$（$a=\sigma_i$）用 (ii)，得 $\tau_i=g(\sigma_i)$。

**与例外纤维的接口**（`main.tex:1013-1034`）。对 $\sigma\in\Sigma^R$ 定义最大局部拟覆盖
$$
M(R,\sigma)=\{(S,P)\in\Omega_R(\mathscr P):\sigma_S\notin P\}.
$$
断言：若 $(\mathscr P,\Gamma)$ 刚性且每符号在 $\sigma$ 中出现至少 $L$ 次，则不被 $M(R,\sigma)$ 覆盖的赋值恰为 $\Gamma\sigma=\{g\sigma:g\in\Gamma\}$。理由是每个 $g\sigma$ 因 $P$ 的 $\Gamma$-不变性而不被覆盖；反之若 $\tau$ 不被覆盖，则不存在使 $\tau_S\in P$ 而 $\sigma_S\notin P$ 的约束 $(S,P)$，等价于所有单射 $\phi$ 上 $\tau_\phi\preceq_{\mathscr P}\sigma_\phi$（$\mathscr P$ 对坐标置换的封闭性消去排序选择），刚性给出 $\tau=g\sigma$。

**导数族与幂可替换性**（`main.tex:1036-1069`）。对 $a\in\Sigma$、$P\in\mathscr P$ 定义首坐标导数
$$
\partial_aP=\{z\in\Sigma^{k-1}:(a,z)\in P\},\qquad
\mathscr D(\mathscr P)=\{(a,P):a\in\Sigma,\ P\in\mathscr P,\ \partial_aP\ne\varnothing\},
$$
$\mathscr D(\mathscr P)$ 取为带指标族，故相同的导数集合保留重数。对 $S\subseteq\Sigma^m$，$\rho_{\mathscr P,m}(S)$ 是均匀随机原生约束 $(U,P)\in\binom{[m]}k\times\mathscr P$ 含 $S$ 的概率；$\rho_{\partial\mathscr P,m}(S)$ 是均匀随机带指标导数约束 $(U,a,P)\in\binom{[m]}{k-1}\times\mathscr D(\mathscr P)$ 含 $S$ 的概率，其覆盖集为 $\{x\in\Sigma^m:x_U\in\partial_aP\}$。称 $\mathscr P$ 有幂可替换的一坐标导数，若存在 $c_*,C_*,b>0$、$\gamma\ge1$ 使对一切 $m$ 与 $S\subseteq\Sigma^m$，
$$
\rho_{\partial\mathscr P,m}(S)\ge\varepsilon\ge C_*m^{-b}
\ \Longrightarrow\
\rho_{\mathscr P,m}(S)\ge c_*\varepsilon^\gamma .
$$
带指标约定的理由（`main.tex:1066-1069`）：局部赋值平衡后，每个带指标导数有相同数目的"一顶点扩张"成为原生约束，于是随机跨约束导出的助手恰是带指标导数族的精确二项子族。

**定理（有限判据的对数窗准则，`main.tex:1072-1103`）**。固定 $0<\eta<1/2$ 与对称禁止模式系统 $(\Sigma,k,\mathscr P,\Gamma)$，假设：(i) $(\mathscr P,\Gamma)$ 刚性；(ii) $\mathscr P$ 有幂可替换的一坐标导数；(iii) 在 $p\in[p_\eta,p_{1-\eta}]$ 上一致地 $pN_n(\mathscr P)=\Theta(n)$；(iv) 对每个 $A_0,B_0>0$ 存在 $c=c(A_0,B_0)>0$，使 $1\le K\le c\log n$ 时
$$
\sup_{p\in[p_\eta,p_{1-\eta}]}\mu_p\bigl(\mathrm{Small}_{n,B_0K}(\mathscr P)\bigr)\le e^{-A_0K},
$$
其中 $\mathrm{Small}_{n,s}(\mathscr P)$ 是随机 $\mathscr P$-实例含至多 $s$ 条约束的 inclusion-极小覆盖这一事件。则
$$
W_\eta(n)\le C_{\eta,\mathscr P}\frac n{\log n}.
$$
若 (iii)-(iv) 在以 $\eta/4$ 替 $\eta$ 后仍成立，则同一界在固定大小均匀模型与独立抽取约束模型的 $\eta$-中央水平都成立。

**证明链的定量骨架**（`main.tex:1105-1205`，值得逐式取用）。(iv) 在选取 $A_0,B_0$ 压制干净提升集引理常数后即给出短见证假设；(iii) 在整个中央区间给出
$$
p=\Theta(n^{1-k}),\qquad M_\eta(n)=\Theta(n),\qquad V_\eta(n)=\Theta(n),
$$
特别 $p_{1-\eta}\le1/2$（$n$ 大）。余下只需验可模拟性。给定干净提升集 $A$（$\lvert A\rvert\le C_0K$、增量 $\beta=e^{-C_0K}$）：取 $A$ 用到的变量集 $R_0$，因 $A$ 非覆盖可选 $\sigma_0\in\Sigma^{R_0}$ 不被 $A$ 覆盖；加入新变量并把 $\sigma_0$ 扩张成 $R$ 上每符号出现同一次数 $r_*\ge L$ 的赋值，则 $\lvert R\rvert=O_{\Sigma,k,C_0}(K)$，重标号可设 $R$ 为 $[n]$ 的前缀（因 $\mathscr P$ 对坐标置换封闭，这不改变分布）。强制施加最大族 $M(R,\sigma)$：它含 $A$，故概率增量仍至少 $\beta$；由刚性引理，$R$ 上唯一未覆盖纤维为 $F_{g\sigma}$，$g\in\Gamma$。

令 $m=n-\lvert R\rvert$。与 $R$ 不交的约束构成 $m$ 个变量上的独立随机 $\mathscr P$-实例，记其未覆盖集为 $B\subseteq\Sigma^m$（$\Gamma$-不变）。考察与 $R$ 恰交一个顶点的已选约束：因 $R$ 是前缀，该顶点占局部模式的首坐标，于是在纤维 $F_\sigma$ 上每个这样的约束导出带指标导数族的一个成员；反向地每个带指标导数恰有 $r_*$ 个扩张（每个携带指定符号的局部顶点一个）。故导出的助手构成
$$
\binom{[m]}{k-1}\times\mathscr D(\mathscr P),\qquad \theta=1-(1-p)^{r_*}
$$
的 $\theta$-随机子族，且与 $B$ 独立，期望规模
$$
\lambda\le r_*p\,|\mathscr D(\mathscr P)|\binom m{k-1}=O_{\eta,\mathscr P,C_0}(K).
$$
在纤维 $F_{g\sigma}$ 上同一跨约束导出的是 $F_\sigma$ 上助手的 $g$-像，而 $B=gB$，故特殊纤维上的覆盖自动覆盖全部例外纤维。与 $R$ 交至少两顶点的约束的出现概率至多
$$
Cp\sum_{j=2}^k\lvert R\rvert^j n^{k-j}=O_{\eta,\mathscr P,C_0}(K^2/n)=o(\beta)
$$
（缩小 $K\le c\log n$ 中的 $c$），记该例外事件为 $E_{\ge2}$。在 $E_{\ge2}$ 之外，强制 $M(R,\sigma)$ 后的实例是覆盖当且仅当导出的导数族在特殊纤维上覆盖 $B$（从而在所有例外纤维上覆盖），于是
$$
\mathbb P(B\text{ 被二项导数族覆盖})
\ge\mu_p((\mathcal F_n(\mathscr P))_{M(R,\sigma)\to1})-\mathbb P(E_{\ge2})
\ge\mu_p(\mathcal F_n(\mathscr P))+\beta-o(\beta).
$$
$m$ 个变量上的覆盖在补回其余变量后覆盖原实例，故 $\mu_p(\mathcal F_n(\mathscr P))\ge\mu_p(\mathcal F_m(\mathscr P))$，从而 $n$ 大时二项导数族以至少
$$
\mu_p(\mathcal F_m(\mathscr P))+\frac{\beta}{2}
$$
的概率覆盖 $B$。带指标导数族有 $\Theta(m^{k-1})$ 个成员，故对数尺度助手提取推论给出 $d=O_{\eta,\mathscr P,C_0}(K)$ 个独立均匀导数助手，超额 $\alpha=e^{-O_{\eta,\mathscr P,C_0}(K)}$。最后以
$$
X=\Sigma^m,\qquad \Omega'=\Omega_m(\mathscr P),\qquad \mathcal H=\mathcal F_m(\mathscr P),\qquad
\mathcal Q=\text{带指标导数族}
$$
代入例外纤维可模拟性判据；逐点比较恰是幂可替换性定义，$m=n-O(K)$ 与尺度式给出 $|\Omega'|p(1-p)=\Theta(n)\ge cV_\eta(n)$。于是干净提升集可模拟，抽象定理给 Bernoulli 界；若在 $\eta/4$ 水平 (iii)-(iv) 亦成立，则在该水平取 Bernoulli 结论，并由 $N_n(\mathscr P)=\Theta(n^k)=\Omega(n^2)$ 与线性尺度模型转移推论得两种固定大小表述在 $\eta$ 水平的同一界。补回前一笔中被本笔记自己丢掉的收束段（原样恢复）：`main.tex:1207-1215` 的注记把判据的操作性说清楚：对固定的 $(\Sigma,k,\mathscr P,\Gamma)$，刚性部分可用有限枚举依有限证书核查；剩下的模型相关问题只有幂比较，在下面的例子中它归结为"比较一组赋值冻结的坐标数"。定理因此把问题分解为有限的局部分类与导数族的一个定量极值不等式。

## 7 逐点立方替换与原子 CSP：$k$-SAT 主结论的落点

**立方替换**（`main.tex:1220-1274`）。固定 $q\ge2$、$k\ge2$；$[q]^m$ 中余维 $j$ 柱由固定 $j$ 个不同坐标到指定值得到，记其族为 $\mathcal U_{m,q}^{(j)}$，故
$$
\bigl\lvert\mathcal U_{m,q}^{(j)}\bigr\rvert=q^j\binom mj .
$$
对 $B\subseteq[q]^m$，$\rho_j(B)$ 为均匀随机余维 $j$ 柱包含 $B$ 的概率；若 $B\ne\varnothing$，令 $\ell(B)$ 为 $B$ 中所有点取值相同的坐标数，则
$$
\rho_j(B)=\frac{\binom{\ell(B)}j}{q^j\binom mj}
$$
（$\ell(B)<j$ 时约定为 $0$；$B=\varnothing$ 时 $\rho_j(B)=1$）。逐点引理：存在 $c_{q,k},C_{q,k}>0$，使
$$
\rho_{k-1}(B)\ge\varepsilon\ge C_{q,k}m^{-(k-1)}
\ \Longrightarrow\
\rho_k(B)\ge c_{q,k}\varepsilon^{k/(k-1)} .
$$
证明只用阶比较：$C_{q,k}$ 足够大时假设蕴含 $\ell\ge2k$，于是
$$
\rho_{k-1}(B)\asymp_{q,k}\left(\frac{\ell}{m}\right)^{k-1},\qquad
\rho_k(B)\asymp_{q,k}\left(\frac{\ell}{m}\right)^{k},
$$
两式相消即得指数 $k/(k-1)$。把它代入平均幂替换定理（$\mathcal Q=\mathcal U_{m,q}^{(k-1)}$、$\mathcal R=\mathcal U_{m,q}^{(k)}$、$\gamma=\frac{k}{k-1}$）得推论：$B$ 为随机子集、$\zeta\in[0,1]$，若 $d\ge1$ 个独立均匀余维 $(k-1)$ 柱以至少 $\zeta+\alpha$ 的概率覆盖 $B$，且 $\frac{\alpha}{4d}\ge C_{q,k}m^{-(k-1)}$，则存在
$$
D\le C'_{q,k}\,d^{1+k/(k-1)}\alpha^{-k/(k-1)}\log(2d/\alpha)
$$
使 $D$ 个独立均匀余维 $k$ 柱以至少 $\zeta+\alpha/2$ 的概率覆盖 $B$。

**原子 CSP 模型**（`main.tex:1279-1297`）。变量取值 $[q]=\{0,\dots,q-1\}$；原子约束由 $k$-集合 $S\subset[n]$ 与模式 $a\in[q]^S$ 给出，禁止满足 $x_S=a$ 的赋值；对偶地它是余维 $k$ 柱 $\{x\in[q]^n:x_S=a\}$。全体原子约束集 $\mathcal C_{n,q,k}$ 的大小
$$
N_{n,q,k}=\lvert\mathcal C_{n,q,k}\rvert=q^k\binom nk,
$$
随机原子 CSP 以概率 $p$ 独立包含每个坐标；$\mathrm{Cover}_{n,q,k}\subseteq2^{\mathcal C_{n,q,k}}$ 为所选柱覆盖整个 $[q]^n$（即 CSP 不可满足）的事件，并记
$$
W_{\eta,q,k}(n)=N_{n,q,k}(p_{1-\eta}-p_\eta).
$$

**从极小不可满足到 $q$-ary Tarsi 缺陷**（`main.tex:1299-1364`）。原子约束 $(S,a)$ 在任意更大变量集 $R\supseteq S$ 的立方中认作子立方 $\{x\in[q]^R:x_S=a\}$，于是 $R$ 上的不可满足原子实例等价于 $[q]^R$ 的子立方覆盖。引理：若 $Y$ 为 inclusion-极小不可满足原子 $q$-ary 实例、$R$ 为其用到的变量集，则 $Y$ 的各约束对应子立方在 $[q]^R$ 内构成用尽 $R$ 全部坐标的极小覆盖；特别地 $q$-ary Tarsi 缺陷定理适用。论证：每个 $\sigma\in[q]^R$ 可扩张为全环境赋值，因 $Y$ 不可满足而违反 $Y$ 的某约束，该约束只依赖 $R$ 内变量，故对应子立方含 $\sigma$；若 $Q\in Y$ 在 $[q]^R$ 的覆盖中冗余，则 $Y\setminus\{Q\}$ 仍覆盖 $[q]^R$、仍不可满足，与 $Y$ 极小矛盾。

所用定理（$q$-ary Tarsi 引理，子立方覆盖形式）：$[q]^v$ 的每个紧极小子立方覆盖大小至少
$$
(q-1)v+1.
$$
素材说明其出处与等价形态（`main.tex:1339-1356`）：它是 Filmus 等人文中定理 3.11（作为 Tarsi 引理的 matroid-cover 版本特例），亦有 Kullmann 的等价子句集形式：原子约束 $Q=(S,a)$ 对应广义子句
$$
C_Q=\bigvee_{i\in S}(x_i\neq a_i),
$$
使 $C_Q$ 为假的赋值恰是 $Q$ 覆盖的子立方点，于是原子实例不可满足当且仅当相应广义子句集不可满足，且两种语言下 inclusion-极小性一致；均匀字母表大小 $q$ 时 Kullmann 的加权变量数为
$$
\mathrm{wn}(F)=\sum_{i\in\operatorname{var}(F)}(\lvert D_i\rvert-1)=(q-1)v,
$$
其不等式 $c(F)-\mathrm{wn}(F)\ge1$ 给出同一界。布尔历史形式见 Aharoni–Linial，他们把结果明确归给 Tarsi 未发表的观察。推论（极小原子 CSP 的 Tarsi 缺陷）：每个用 $v$ 个变量的 inclusion-极小不可满足原子 $q$-ary 实例至少有 $(q-1)v+1$ 条约束。

**线性定位是自动的**（`main.tex:1366-1501`）。置 $a=q-1$、$\delta=a(k-1)-1$，则 $\delta>0$ 等价于
$$
\gamma_{q,k}=(k-1)-\frac1{q-1}>0 .
$$
下界命题：固定 $q\ge2$、$k\ge2$ 且 $(q-1)(k-1)>1$，存在 $c=c(q,k)>0$ 使 $pN_{n,q,k}\le cn$ 时 $\mu_p(\mathrm{Cover}_{n,q,k})=o(1)$，即期望约束数至多 $cn$ 的随机原子 $q$-ary $k$-CSP 以高概率可满足。证明是一阶矩加 Tarsi：令 $m_0=pN$、$X_S$ 为支撑含于 $S$ 的已选约束数，$\lvert S\rvert=v$ 时
$$
X_S\sim\operatorname{Bin}\!\left(q^k\binom vk,p\right),\qquad
\mathbb E X_S=pq^k\binom vk=m_0\frac{\binom vk}{\binom nk}\le C_{q,k}\,c\,n\left(\frac vn\right)^k .
$$
断言以高概率不存在 $S$ 使 $X_S\ge a\lvert S\rvert+1$；只需控制 $X_S\ge av$，二项上尾给
$$
\mathbb P(X_S\ge av)\le\left(\frac{e\mathbb E X_S}{av}\right)^{av}\le\left(C_{q,k}c\left(\frac vn\right)^{k-1}\right)^{av},
$$
故满足 $\lvert S\rvert=v$、$X_S\ge av$ 的集合期望个数为
$$
\binom nv\left(C_{q,k}c\left(\frac vn\right)^{k-1}\right)^{av}
\le\left[\frac{en}{v}\left(C_{q,k}c\left(\frac vn\right)^{k-1}\right)^a\right]^v
=\left[C'_{q,k}c^a\left(\frac vn\right)^{a(k-1)-1}\right]^v .
$$
$\delta>0$ 时取 $c$ 使 $C'_{q,k}c^a<1/4$，则
$$
\sum_{v=k}^n\left[C'_{q,k}c^a\left(\frac vn\right)^\delta\right]^v=o(1)
$$
（固定 $L$，$k\le v<L$ 的贡献趋于 $0$，$L\le v\le n$ 的贡献至多 $\sum_{v\ge L}4^{-v}$）。反设实例不可满足，取极小不可满足子实例 $Y$、变量集 $S$、$v=\lvert S\rvert$、$t=\lvert Y\rvert$，Tarsi 推论给 $t\ge av+1$，而 $Y$ 的约束全支持在 $S$ 内，故 $X_S\ge t\ge av+1$，矛盾。

上界命题：固定 $q,k$，存在 $C=C(q,k)$ 使 $pN_{n,q,k}\ge Cn$ 时 $\mu_p(\mathrm{Cover}_{n,q,k})=1-o(1)$。证明：设 $Z$ 为满足赋值数，固定 $x\in[q]^n$ 在每个 $k$-集合上恰被一条原子约束排除，故
$$
\mathbb P(x\text{ 满足全部已选约束})=(1-p)^{\binom nk},\qquad
\mathbb E Z=q^n(1-p)^{\binom nk}\le\exp\!\left(n\log q-p\binom nk\right),
$$
而 $p\binom nk=\frac{pN_{n,q,k}}{q^k}$，故 $C>q^k\log q$ 时 $\mathbb E Z=o(1)$，Markov 不等式给 $Z=0$ 高概率。

推论（自动线性中央尺度）：固定 $q,k,\eta$，若 $\gamma_{q,k}>0$，则存在 $0<c_{\eta,q,k}<C_{\eta,q,k}<\infty$ 使每个中心点 $p\in[p_\eta,p_{1-\eta}]$ 满足
$$
c_{\eta,q,k}n\le pN_{n,q,k}\le C_{\eta,q,k}n,
$$
从而 $M_\eta(n)=\Theta_{\eta,q,k}(n)$、$V_\eta(n)=\Theta_{\eta,q,k}(n)$。理由：两端命题各排除一侧；且 $pN=\Theta(n)$、$p=O(n^{1-k})=o(1)$ 给出 $Np(1-p)=\Theta(n)$。这正是判据中假设 (iii) 与抽象定理里 $p_{1-\eta}\le1/2$ 的自动来源。

**短覆盖稀有**（`main.tex:1503-1553`）。$\mathrm{Small}_s^{(q,k)}$ 为随机实例含至多 $s$ 条原子约束、覆盖其所用变量上全部赋值的子族（等价于含至多 $s$ 条约束的极小不可满足原子子 CSP）。断言：$\gamma_{q,k}>0$ 时存在 $c_{q,k},c'_{q,k}>0$，使 $s\le c_{q,k}\log n$ 时对所有 $p=O_{q,k}(n^{1-k})$ 一致地
$$
\mu_p(\mathrm{Small}_s^{(q,k)})\le n^{-c'_{q,k}} .
$$
计数细节：设有 $t$ 条约束、用 $v$ 个变量的极小子实例，Tarsi 给 $t\ge(q-1)v+1$，故 $v\le\frac{t-1}{q-1}$；固定 $t,v$ 与指定 $v$-集合时带标号子实例数至多 $\binom{q^k\binom vk}{t}$，并集界给
$$
\sum_{1\le t\le s}\ \sum_{v\le(t-1)/(q-1)}\binom nv\binom{q^k\binom vk}{t}p^t .
$$
用 $p=O(n^{1-k})$、$v\le t$ 与二项系数标准估计，和项至多
$$
\exp(C_{q,k}t\log t)\,n^{v-(k-1)t}
\le\exp(C_{q,k}t\log t)\,n^{(t-1)/(q-1)-(k-1)t}
=\exp(C_{q,k}t\log t)\,n^{-\gamma_{q,k}t-1/(q-1)},
$$
$s\le c_{q,k}\log n$ 且 $c_{q,k}$ 足够小时 $\exp(C_{q,k}t\log t)\le n^{\gamma_{q,k}t/2}$ 对 $t\le s$ 成立，求和即得。

**判据核查与主结论**（`main.tex:1555-1616`）。原子模型取 $\Sigma=[q]$、
$$
\mathscr P_{q,k}^{\rm at}=\bigl\{\{a\}:a\in[q]^k\bigr\},\qquad \Gamma=\{\mathrm{id}\}.
$$
命题：$(\mathscr P_{q,k}^{\rm at},\Gamma)$ 刚性；其非空一坐标导数恰为 $[q]^{k-1}$ 中的单点模式、重数为常数，并满足幂比较，参数 $\gamma=\frac{k}{k-1}$、$b=k-1$。证明一行即足：单点模式下 $u\preceq_{\mathscr P}v$ 当且仅当 $u=v$，故局部刚性条件强制 $\tau=\sigma$，刚性成立（例如 $L=k$）；固定单点的首坐标要么给空集要么给 $[q]^{k-1}$ 的单点，每个非空导数同重数，于是随机导数约束恰是随机余维 $(k-1)$ 柱、原生约束是余维 $k$ 柱，所需幂比较即逐点立方替换引理。

原子 CSP 窗定理：固定 $q\ge2$、$k\ge2$、$0<\eta<1/2$，若 $\gamma_{q,k}>0$，则
$$
W_{\eta,q,k}(n)\le C_{\eta,q,k}\frac n{\log n}.
$$
证明即装配：线性中央尺度由自动推论、短见证由短覆盖稀有引理（每个固定 $A_0,B_0$ 缩小 $K\le c\log n$ 中的 $c$ 后成立）、刚性与幂可替换由上一条命题，最后施有限判据定理。

$k$-SAT 特化：对每个固定 $k\ge3$ 与 $0<\eta<1/2$，
$$
W_{\eta,k}(n)\le C_{\eta,k}\frac n{\log n}.
$$
随机 $k$-SAT 是布尔原子模型 $q=2$，而 $\gamma_{2,k}=k-2>0$ 恰是 $k\ge3$。$q=2$、$k=2$（普通 2-SAT）被条件排除，与引言里"$k=2$ 需专门分析、本文方法不覆盖"的表述一致（`main.tex:91-94`）。标准固定规模模型与独立抽取模型下同一 $O(n/\log n)$ 界由原子 CSP 与 $k$-SAT 结论加上 $N_n(\mathscr P)=\Theta(n^k)=\Omega(n^2)$ 的模型转移推论得到。

这里 $\gamma_{q,k}>0$ 的确切含义值得单独记下：它等价于 $(q-1)(k-1)>1$，即稀疏覆盖相变存在的范围；$q=2$ 时给出 $k\ge3$，$k=2$ 时给出 $q\ge4$。同一表达式在短覆盖计数里以 $n^{-\gamma_{q,k}t}$ 的指数出现，是全部对数因子的来源。

## 8 两个非原子模型：signed NAE-$k$-SAT 与 Property B

**signed NAE 模型**（`main.tex:1630-1650`）。变量布尔，$\{0,1\}=\{0,1\}$。signed NAE 子句由 $k$-集合 $S\subseteq[n]$ 与一个反足类 $[a]=\{a,\bar a\}\subseteq\{0,1\}^S$ 给出，恰被限制属于 $[a]$ 的赋值违反；覆盖语言下它是两个反足余维 $k$ 柱之并
$$
\{x\in\{0,1\}^n:x_S=a\}\cup\{x\in\{0,1\}^n:x_S=\bar a\}.
$$
全体子句集 $\mathcal N_{n,k}$ 的大小
$$
N^{\operatorname{NAE}}_{n,k}=\lvert\mathcal N_{n,k}\rvert=2^{k-1}\binom nk,
$$
独立以概率 $p$ 包含；$\mathrm{Cover}^{\operatorname{NAE}}_{n,k}$ 为所选违反集覆盖 $\{0,1\}^n$（公式 NAE-不可满足）的事件，窗定义
$$
W^{\operatorname{NAE}}_{\eta,k}(n)=N^{\operatorname{NAE}}_{n,k}(p_{1-\eta}-p_\eta),\qquad \mu_{p_\alpha}(\mathrm{Cover}^{\operatorname{NAE}}_{n,k})=\alpha .
$$

**缺陷输入换成最小度**（`main.tex:1654-1670`）。若 $Y$ 为 inclusion-极小 NAE-不可满足 signed NAE-$k$-SAT 实例、有 $t$ 条子句、用 $v$ 个变量，则每个被用变量的子句度至少 $2$，从而 $v\le\frac k2t$。证明：设某用变量 $x$ 恰出现在一条子句 $Q$ 中；极小性使 $Y\setminus\{Q\}$ 有 NAE-满足赋值，在除 $x$ 的所有变量上保留它。若 $Q$ 的其余 $k-1$ 个带符号文字已取到两个布尔值，则 $x$ 任取皆可满足 $Q$；否则它们同值，取 $x$ 使其带符号文字取反值。$x$ 不在他处出现，故得到 $Y$ 的 NAE-满足赋值，矛盾。计数 incidence 得 $2v\le kt$。

**线性下界**（`main.tex:1672-1724`）：固定 $k\ge3$，存在 $c=c(k)>0$ 使 $pN^{\operatorname{NAE}}_{n,k}\le cn$ 时 $\mu_p(\mathrm{Cover}^{\operatorname{NAE}}_{n,k})=o(1)$。结构与原子情形同，只有常数不同：$m_0=pN\le cn$、$\lvert S\rvert=v$ 时
$$
X_S\sim\operatorname{Bin}\!\left(2^{k-1}\binom vk,p\right),\qquad
\mathbb E X_S=m_0\frac{\binom vk}{\binom nk}\le C_kcn\left(\frac vn\right)^k,
$$
取阈值 $b=\frac2k$，标准上尾给
$$
\mathbb P(X_S\ge bv)\le\left(C_kc\left(\frac vn\right)^{k-1}\right)^{bv},
$$
于是坏 $v$-集期望个数至多
$$
\left[C'_kc^b\left(\frac vn\right)^{b(k-1)-1}\right]^v,\qquad
b(k-1)-1=\frac{k-2}{k}>0,
$$
取 $c$ 使 $C'_kc^b<1/4$ 后对 $v\ge k$ 求和为 $o(1)$，故高概率无 $S$ 使 $X_S\ge2\lvert S\rvert/k$；若公式 NAE-不可满足，极小子公式 $Y$ 在变量集 $S$ 上满足 $t\ge2v/k$，而 $X_S\ge t$，矛盾。

**线性上界**（`main.tex:1726-1744`）：固定 $k\ge2$，存在 $C=C(k)$ 使 $pN^{\operatorname{NAE}}_{n,k}\ge Cn$ 时 $\mu_p(\mathrm{Cover}^{\operatorname{NAE}}_{n,k})=1-o(1)$。固定赋值在每个 $k$-集合上恰违反一条 signed NAE 子句，故
$$
\mathbb E Z=2^n(1-p)^{\binom nk}\le\exp\!\left(n\log2-p\binom nk\right),\qquad
p\binom nk=\frac{pN^{\operatorname{NAE}}_{n,k}}{2^{k-1}},
$$
$C>2^{k-1}\log2$ 时 $\mathbb E Z\to0$，Markov 收尾。自动线性中央尺度推论（`main.tex:1746-1757`）：$k\ge3$ 时在 $p\in[p_\eta,p_{1-\eta}]$ 上一致地 $pN^{\operatorname{NAE}}_{n,k}=\Theta_{\eta,k}(n)$ 且 $N^{\operatorname{NAE}}_{n,k}p(1-p)=\Theta_{\eta,k}(n)$（两端命题另给 $p=O(n^{1-k})=o(1)$）。

**短 NAE 见证稀有**（`main.tex:1759-1790`）：$k\ge3$ 时存在 $c_k,c'_k>0$，$s\le c_k\log n$ 时对所有 $p=O_k(n^{1-k})$ 一致地
$$
\mu_p(\mathrm{Small}^{\operatorname{NAE}}_{n,s})\le n^{-c'_k}.
$$
计数用最小度引理（$t$ 条子句至多用 $kt/2$ 个变量）：
$$
\mu_p(\mathrm{Small}^{\operatorname{NAE}}_{n,s})\le
\sum_{1\le t\le s}\ \sum_{v\le kt/2}\binom nv\binom{2^{k-1}\binom vk}{t}p^t,
$$
和项至多
$$
\exp(C_kt\log(t+1))\,n^{v-(k-1)t}\le\exp(C_kt\log(t+1))\,n^{-(k-2)t/2},
$$
$t\le c_k\log n$ 时前因子至多 $n^{(k-2)t/4}$，求和得固定多项式节省。这里的指数 $\frac{k-2}{2}$ 与原子情形的 $\gamma_{q,k}$ 位置相同，$k\ge3$ 的门槛正来自它。

**判据核查**（`main.tex:1793-1851`）。取
$$
\mathscr P_k^{\operatorname{NAE}}=\bigl\{\{a,\bar a\}:a\in\{0,1\}^k\bigr\},\qquad
\Gamma=\{\mathrm{id},\mathrm{comp}\},
$$
重复的反足对在 $\mathscr P_k^{\operatorname{NAE}}$ 中合并。逐点引理：$k\ge2$ 时存在 $c_k,C_k>0$，使
$$
\rho^{\rm at}_{k-1}(B)\ge\varepsilon\ge C_km^{-(k-1)}
\ \Longrightarrow\
\rho^{\operatorname{NAE}}_k(B)\ge c_k\varepsilon^{k/(k-1)},
$$
其中 $\rho^{\rm at}_{k-1}$ 是随机原子余维 $(k-1)$ 柱含 $B$ 的概率、$\rho^{\operatorname{NAE}}_k$ 是随机 signed NAE 子句含 $B$ 的概率。证明给出两个精确式：$\ell(B)$ 为 $B$ 中同值坐标数，则
$$
\rho^{\rm at}_{k-1}(B)=\frac{\binom{\ell(B)}{k-1}}{2^{k-1}\binom m{k-1}},
$$
$C_k$ 足够大时假设蕴含 $\ell(B)\ge2k$，而凡是 $k$ 个坐标全取这些冻结坐标、且反足类取冻结模式类的 signed NAE 子句都覆盖 $B$，故
$$
\rho^{\operatorname{NAE}}_k(B)\ge\frac{\binom{\ell(B)}k}{2^{k-1}\binom mk}.
$$
刚性命题：$k\ge3$ 时 $(\mathscr P_k^{\operatorname{NAE}},\Gamma)$ 刚性；其带指标一坐标导数在 $\{0,1\}^{k-1}$ 的原子单点模式上均匀分布，幂比较以 $\gamma=\frac{k}{k-1}$、$b=k-1$ 成立。论证：此处 $u\preceq_{\mathscr P}v$ 当且仅当 $u\in\{v,\bar v\}$；若局部条件成立但 $\tau\notin\{\sigma,\bar\sigma\}$，则（必要时整体取补 $\tau$）存在坐标 $i,j$ 使 $\tau_i=\sigma_i$、$\tau_j\ne\sigma_j$，把 $\{i,j\}$ 扩为 $k$-集，在该集上 $\tau$ 既非 $\sigma$ 也非其补，违背局部预序条件。故刚性成立，例如 $L=k$。反足对固定一坐标给单点模式，每个单点导数同带指标重数。

窗定理（`main.tex:1853-1867`）：每个固定 $k\ge3$、$0<\eta<1/2$，
$$
W^{\operatorname{NAE}}_{\eta,k}(n)\le C_{\eta,k}\frac n{\log n},
$$
装配方式与原子情形逐条对应（自动尺度、短见证、谓词证书、有限判据定理）；标准固定规模与独立抽取模型的同界由判据定理末句给出。

**Property B 模型**（`main.tex:1883-1895`）。$\mathcal E_{n,k}=\binom{[n]}k$，每个 $k$-集独立以概率 $p$ 入选，得随机 $k$-一致超图 $H_k(n,p)$；二着色 $x\in\{0,1\}^n$ 正常当所选边无单色边。覆盖语言下边 $S$ 覆盖
$$
Q_S=\{x:x_S=0^S\}\cup\{x:x_S=1^S\},
$$
$\mathsf{N2Col}_{n,k}$ 为不可二着色事件，$N^{\rm hyp}_{n,k}=\binom nk$，
$$
W^{\rm hyp}_{\eta,k}(n)=N^{\rm hyp}_{n,k}(p_{1-\eta}-p_\eta),\qquad
\mu_{p_\alpha}(\mathsf{N2Col}_{n,k})=\alpha .
$$
无符号最小度引理（`main.tex:1900-1913`）与 NAE 版同构：极小不可二着色 $k$-一致超图若 $t$ 边 $v$ 顶点，则每个被用顶点度至少 $2$，$v\le\frac k2t$；证明取唯一含 $u$ 的边 $e$，$Y\setminus\{e\}$ 有正常着色，若 $e\setminus\{u\}$ 已含两色则 $u$ 任取，否则取反色。

线性下界（`main.tex:1915-1946`）与 NAE 版完全同形，$\mathbb E X_S=m_0\frac{\binom vk}{\binom nk}$（无 $2^{k-1}$ 因子）、$b=\frac2k$、指数 $\frac{k-2}{k}>0$。线性上界（`main.tex:1948-1972`）这里需要一次凸性论证：正常着色数为 $Z$，颜色类大小为 $a$ 与 $n-a$ 的着色有
$$
\binom ak+\binom{n-a}k
$$
条可能的单色边，由凸性该量在平衡着色处最小，充分大 $n$ 时对一切着色至少 $c_k\binom nk$（$c_k>0$），故
$$
\mathbb E Z\le2^n(1-p)^{c_k\binom nk}\le\exp\!\left(n\log2-c_kpN^{\rm hyp}_{n,k}\right),
$$
$C>\log2/c_k$ 时 $\mathbb E Z\to0$。这一处与 NAE/原子情形的差别在此记下：平衡性使超图模型的期望计数不再精确，只给常数因子下界，但足以定线性尺度。

短见证引理（`main.tex:1988-2014`）同 NAE 版：
$$
\mu_p(\mathrm{Small}^{\rm hyp}_{n,s})\le
\sum_{1\le t\le s}\sum_{v\le kt/2}\binom nv\binom{\binom vk}{t}p^t
\le\cdots\le n^{-c'_k}.
$$
判据核查（`main.tex:2016-2080`）。取
$$
\mathscr P_k^{\rm hyp}=\bigl\{\{0^k,1^k\}\bigr\},\qquad \Gamma=\{\mathrm{id},\mathrm{comp}\}.
$$
对 $B\subseteq\{0,1\}^m$，$\rho^{\rm const}_{k-1}(B)$ 为随机常值余维 $(k-1)$ 柱含 $B$ 的概率，$\rho^{\rm hyp}_k(B)$ 为随机 $k$-边的坏集含 $B$ 的概率。逐点引理（`main.tex:2027-2055`）：$k\ge2$ 时 $c_k,C_k>0$ 使
$$
\rho^{\rm const}_{k-1}(B)\ge\varepsilon\ge C_km^{-(k-1)}
\ \Longrightarrow\
\rho^{\rm hyp}_k(B)\ge c_k\varepsilon^{k/(k-1)} .
$$
证明引入两个冻结集：$L_c(B)=\{i\in[m]:x_i=c\ \forall x\in B\}$、$\ell_c=\lvert L_c(B)\rvert$，则
$$
\rho^{\rm const}_{k-1}(B)=\frac{\binom{\ell_0}{k-1}+\binom{\ell_1}{k-1}}{2\binom m{k-1}},
$$
故某 $c\in\{0,1\}$ 满足 $\binom{\ell_c}{k-1}/\binom m{k-1}\ge\varepsilon$；$C_k$ 足够大时 $\ell_c\ge2k$，而 $L_c(B)$ 的每个 $k$-子集的坏集都含 $B$，于是
$$
\rho^{\rm hyp}_k(B)\ge\frac{\binom{\ell_c}k}{\binom mk}.
$$
刚性命题（`main.tex:2057-2080`）：$k\ge3$ 时 $(\mathscr P_k^{\rm hyp},\Gamma)$ 刚性，一坐标导数是两个常值模式 $0^{k-1}$、$1^{k-1}$，幂比较以 $\gamma=\frac{k}{k-1}$、$b=k-1$ 成立。此系统的预序含义是"若 $u$ 常值则 $v$ 常值"；设 $\sigma$ 两颜色类大小均至少 $k$ 且局部条件成立，则每个 $\tau$-单色 $k$-集都 $\sigma$-单色；若某 $\tau$-类大小至少 $k$，它必须落在 $\sigma$ 的一个类内，否则含一个横跨两 $\sigma$-类的 $k$-集；两个 $\tau$-类都不能大小至多 $k-1$（否则另一类仍横跨两类且大小至少 $k$），故两 $\tau$-类恰为两 $\sigma$-类，$\tau\in\{\sigma,\bar\sigma\}$，刚性以 $L=k$ 成立。

超图二着色窗定理（`main.tex:2082-2106`）：每个固定 $k\ge3$、$0<\eta<1/2$，
$$
W^{\rm hyp}_{\eta,k}(n)\le C_{\eta,k}\frac n{\log n},
$$
且在均匀 $H_k(n,m)$ 模型与独立抽 $m$ 条边模型中同界。

三模型并置时可见的层级：原子模型用 $\Gamma=\{\mathrm{id}\}$、导数为单点柱、替换为 $(k-1)$ 柱到 $k$ 柱；signed NAE 用 $\Gamma=\{\mathrm{id},\mathrm{comp}\}$、例外纤维是两个反足纤维、导数为原子单点而原生约束为反足柱对；Property B 同样两个反足纤维，但导数是常值柱、原生对象只是边决定的两个单色点。三者共享的幂指数都是 $\gamma=\frac{k}{k-1}$、阈值都是 $b=k-1$，差别全在"冻结坐标数"的计数式里。

## 9 与本语料的接缝

**结语中的自我定位**（`main.tex:2108-2149`）。缩放窗问题连着"固定 $k$-SAT 临界密度收敛"这一未解问题。Abbe–Montanari 证明：若子句窗满足
$$
W_{\eta,k}(n)=O\!\left(\frac{n}{\log^{1+\delta}n}\right)
$$
（某固定 $\delta>0$），则可满足性猜想成立。其约化的高层机制（`main.tex:2120-2125`）：窗足够窄时，临界密度的有限尺寸不确定度沿适当的实例尺寸比较可求和，于是可把"在 $n$-依赖临界点附近集中"升级为"这些临界点本身收敛"；故超过一个对数任意的正幂改进，其后果强于有限尺寸缩放估计。本结果恰到边界尺度 $n/\log n$：把先前 $n/\log\log n$ 上界改进 $\log n/\log\log n$ 因子，但未达到 Abbe–Montanari 所需的严格更强假设。

**为何直接迭代换不来更多对数幂**（`main.tex:2132-2144`，这是转引时最容易被夸大的地方）。尺度 $K$ 处加性 Bourgain 定理给 $\exp(-O(K))$ 的确定性提升；模拟引理把干净提升集换成 $D\le\exp(O(K))$ 个随机坐标；通用层估计把由此产生的增量控制为 $O\!\left(\frac{D+1}{\sqrt{V_\eta(n)}}\right)$。三样原料能给出的最强比较只有
$$
\exp(-O(K))\le\frac{\exp(O(K))}{\sqrt{V_\eta(n)}},
$$
它仅强制 $K=\Omega(\log V_\eta(n))$。重施同一论证不改指数：每个新提升集仍是指数强度对指数模拟成本，而层估计只依赖撒点总数。超对数分母因此需要三处之一真正更强的输入：产生更大提升的 Bourgain 型定理、干净提升集的亚指数模拟、或利用多于单调性的几何、替代布尔层估计的模型相关替换。

**致谢与资助**（`main.tex:2151-2153`）：作者感谢 Imre Leader 的指导与支持；工作由 Trinity College, Cambridge 的 CB European PhD Studentship 资助。

**登记**：D458（bib key `Carenini2026`）；D729（bib key `Carenini`）。两稿 key 不同，引用时不可互换。

可直接引用的对象清单（附行位）：

- 主结论：固定 $k$-SAT 的中央子句窗 $W_{\eta,k}(n)\le C_{\eta,k}\frac n{\log n}$，$k\ge3$（`main.tex:1598-1610`）；与 Friedgut–Bourgain 的 $O(n/\log\log n)$ 对照（`main.tex:96`）。
- 一般原子 CSP：$q$-元字母表、条件 $\gamma_{q,k}=(k-1)-\frac1{q-1}>0$（等价 $(q-1)(k-1)>1$）下的同阶界（`main.tex:1578-1596`）。注意 2-SAT（$q=k=2$）与 $q$ 元 2-约束（$k=2,q\le3$）落在条件之外。
- signed NAE-$k$-SAT 窗（`main.tex:1853-1877`）与 Property B 窗（`main.tex:2082-2106`），$k\ge3$；素材未给这两个模型改进了何前人界，转引时只说"同法同阶"。
- 抽象窗定理与其两条假设的公式化形态：短见证稀有 $\mu_p(\mathrm{Small}_{n,BK})\le e^{-CK}$ 与可模拟干净提升集（`main.tex:358-377`、`main.tex:327-349`），结论 $W_\eta(n)\le C_\eta\frac{M_\eta(n)}{\log V_\eta(n)}$。下游任何单调覆盖事件都可尝试把这两条作为黑箱假设引用。
- 三个模型之间的转移凭据（`main.tex:183-290`）：$\widehat W_\eta\le W_{\eta/4}+C_\eta\sqrt{M_{\eta/4}+1}$、$\widetilde W_\eta\le\widehat W_{\eta/4}+O_\eta(1)$；引用"$m$ 条子句"表述的窗界时必须带这条，误差项在 $O(n/\log n)$ 之下。
- 通用概率原料：二项到独立的助手提取（含 $\lambda\le\Lambda K$、$|\mathcal Q|\ge4\lceil C(K+\log(1/\beta))\rceil^2/\beta$ 的门槛，`main.tex:707-790`）与平均幂替换（$D\le C_{c_*,\gamma}d^{1+\gamma}\alpha^{-\gamma}\log(2d/\alpha)$，`main.tex:801-844`）。这两条本身可独立引用于其它"确定性帮助换随机帮助"的场合。
- 例外纤维可模拟性判据（`main.tex:846-917`）与有限判据定理（`main.tex:1075-1103`）：新的禁止模式系统只需验刚性（有限证书，`main.tex:985-1011`）与导数幂比较，即可得 $O(n/\log n)$。这是本稿最具迁移性的部分。
- 组合原料：$q$-ary Tarsi 缺陷 $(q-1)v+1$ 及其广义子句形式（`main.tex:1333-1364`）；最小 NAE-不可满足公式与最小不可二着色超图的最小度结论 $v\le\frac k2t$（`main.tex:1654-1670`、`main.tex:1900-1913`）；线性定位的两侧一阶矩证明（`main.tex:1373-1501`、`main.tex:1672-1757`、`main.tex:1915-1983`）。Tarsi 引理与加性 Bourgain 定理都是外部结果，素材以带编号定理形式重述（外部编号分别见 `main.tex:1339` 的 Filmus 等人与 `main.tex:433` 的 KLLM Theorem 1.4），引用时应注明出处层级。
- 记法与尺度约定：$W_\eta$ 一律以期望坐标数 $N_n(p_{1-\eta}-p_\eta)$ 计；对 $k$-SAT 即期望子句数，与以 $m$ 计的写法在中央区间差 $O(\sqrt n)$（转移推论）。$\eta$ 固定在 $(0,1/2)$，常数下标随 $\eta$ 变。

**本笔记的更正申报**（后笔更正前笔，未删除任何原有信息）：
一、§2 中"$\mu_{p_\alpha}(\mathcal F_n)=alpha$"的右端应读作 $\alpha$，已在原句后补记。
二、§3 的包含式标签原写作 KaTeX 不支持的 `\tag*{(3.1)}`，已改为行尾 `\ \text{(3.1)}`，公式本体未动。
三、§7 中"$Y\setminus\{Q\}$ 仍覆盖 $[q]^R]$"内多出的一个右方括号已删。
四、§8 一处形容短语落在禁词表内，已就地改为"差别在此记下"。
五、两处收束段（§4 的"整条链的结构…"与 §6 的"注记把判据的操作性…"）在追加后继节时被本笔记的编辑锚点意外覆盖，已在原位置以"补回前一笔中被本笔记自己丢掉的收束段（原样恢复）"的方式逐字恢复；恢复后的文字与被覆盖前一致，此外 §4 恢复段落所在句首"结论成立且 $C_\eta$ 可取为该 $L$。"在恢复过程中被改写一次又改回，最终形态与原文相同。
六、素材自身的笔误登记（不改素材，只记下）：`main.tex:132` 将 signed NAE-$k$-SAT 误作 signed NEA-$k$-SAT；`main.tex:413` "a clean booster leaves one exceptional fibres" 单复数不一致；`main.tex:693` 节标题中的 "two local-to-random reduction" 语序可疑；`main.tex:713` 的 and 与后继概率符号之间缺排版空格；`main.tex:1413` 的 aligned 环境行末有多余空格与 `\\`。这些均不影响本笔记转写的公式。
