# D27 Fock 空间不等式与 Laughlin 谱隙：我把证明做成一本预算账

对象论文：`A Fock space inequality and the Laughlin spectral gap`（OpenAI，2026-09-24，`pdfsubject` 字段写的是 "The full fermionic V1 interaction on the round sphere"）。
TeX 源码：`E:\math\preprints\A-Fock-space-inequality-and-the-Laughlin-spectral-gap-September-24-2026\build\`（`main.tex` + `sections/01-introduction.tex` … `08-arithmetic.tex`、`figures/relative-transfer.tex`、`references.bib`），行内引用记法 `04:12` 表示 `04-comparison.tex` 第 12 行附近；行号按我读到的 build 版对齐，个别 ±1 行误差不影响所指句子。七行整数数据在 `verification/rows.txt`。
素材：`研究笔记\素材\Laughlin谱隙Fock空间-素材.md`，§一（1.1 至 1.5）与 §二（2.1 至 2.20）完整；素材自带的索引表指向的 2.21 至 2.24（07/08 节条目）与 §三（时间线）、§四（Lean 取证）、§五（常数表）在素材文件里没有落笔，第 21、22、23 节由我对着 tex 与 Lean 仓库自己补，补的部分都写明来源。
Lean：`E:\math\lean\OAI\Analysis\Laughlin\`（1279 个 `.lean` 文件，入口 `Main.lean`，被 comparator 认证的声明是 `OAI.Laughlin.mainTarget_proved`），配置 `ComparatorChallenges\Laughlin.json`，登记条目在 `formalization.yaml` 第 1274 至 1276 行。
取证纪律：`E:\math\reasoning_traces\` 现有 17 个文件，没有本篇的思维链 summary。本篇所有"我当时为什么这样选、可能先走了哪条弯路"的话都是防御性句子、脚注、Lean 文件结构反推出来的，一律标 `[推测]`；没标的都是从 tex / Lean / rows.txt 逐字抄录或按定义精确重算的内容。文中数值我已独立复核：$\eta$ 的分子 $93527408868499$、终盘 $\gamma_*=4616733319001/10^{14}>1/25$（由 rows.txt 七行 $\ell_\rho$ 平方求和复现）、$\sum_D n_D=1222$、$\sum_D\lceil D/2\rceil n_D=10946$、13 个尾系数余量整数、$D=1..23$ 的 23 条符号串、$D=5$ 主元 $56737668577815655510619653/300647710720000000000000$。

记号与论文一致：$U_Q$ 是 $SU(2)$ 的自旋 $Q/2$ 表示（球面单粒子LLL），$V_Q\subset\bigwedge^2U_Q$ 是自旋 $a=Q-1$ 直和项，$\{v_p\}_{p=0}^{2Q-2}$ 是它的下降基，$B_p=B(v_p)$，$c_j=B(e_j)$，$\mathcal L_k$ 是升算子，$d_a=2Q-1$，$d_{3,z}=3Q-1-2z$，$d_D=4Q-1-2D$，$\eps=3\cdot10^{-6}$，$P=10^7$。

## 0 进场时手里有什么：一个 folklore 猜想的量化顺序

我进场时手里有的东西其实只有两行公式和一个传统。第一行是 Laughlin 1983 的波函数在球面上的版本 $\Psi_{\mathrm L,N}=\prod_{i<j}(u_iv_j-u_jv_i)^3$，第二行是 Haldane 1983 的父哈密顿量：每一对粒子在相对角动量一的通道上付能量一、其余通道付零（`01` 开头两句，引用 `Haldane` p.606 Equations (6)--(7)）。零模唯一性在 Haldane 原文里就写了，所以这个题目真正悬着的只有一件事：正谱有没有一个与系统尺寸无关的下界。Rougerie 的综述把这件事记成 folklore 猜想（`[Appendix A]{Rougerie}`，Conjecture A.1，平面、度数范围 $L\le 3N(N-1)/2$）。

论文的定理长这样（`01:45-52`，逐字）：

> **Theorem** \label{thm:fock}. For every \(0<\gamma<\gamma_*\), there is an integer \(Q_\gamma\) such that for every integer \(Q\ge Q_\gamma\),
> \[ H_Q^2\ge\gamma H_Q\qquad\text{on }\FF_Q. \]
> The threshold \(Q_\gamma\) is independent of particle number.

以及推论（`01:60-71`）：对 $N\ge N_0$、$Q=3(N-1)$，$H_{N,Q}\ge\frac1{25}(I-P_{\mathrm L,N})$。我最早在纸上写下的猜想版本比这朴素得多：固定 $N$，证 $\bigwedge^NU_Q$ 上第二本征值 $\ge c$。`[推测]` 这个版本我很快放弃了，因为它连陈述都别扭：谱隙要跟零模比较，而"零模是 Laughlin 射线"这件事在固定 $Q$ 让 $N$ 变、还是固定 $N$ 让 $Q$ 变时含义不同；更麻烦的是任何有限 $N$ 陈述的误差项都躲不开 $\binom N2$ 型增长，而热力学极限恰恰要求 $N,Q$ 同时动。最终版把舞台换到整个 Fock 空间 $\FF_Q=\bigoplus_{N=0}^{Q+1}\bigwedge^NU_Q$，一次陈述吃掉所有粒子扇区。

量化顺序我逐字对齐过，因为后面每一步都要用它：$\forall\gamma\in(0,\gamma_*)\,\exists Q_\gamma\in\mathbb N\,\forall Q\ge Q_\gamma\,\forall N\le Q+1$：$H_Q^2\ge\gamma H_Q$。$Q_\gamma$ 只吃 $\gamma$，不吃 $N$。摘要的说法（main.tex，逐字）：

> More generally, \(H_Q^2\ge\gamma H_Q\) for some fixed \(\gamma>1/25\) on the entire lowest-Landau-level Fock space for all sufficiently large flux \(Q\), independently of particle number.

现在回到这个题的实质：它是一本预算账。终盘等式是

$$\gamma_*=1-\eta-\frac{61}{4096}-1222\varepsilon=\frac{4616733319001}{10^{14}},$$

其中 $\eta=\sum_\rho\lambda_\rho^2=\frac{93527408868499}{10^{14}}=0.93527408868499$，$\frac{61}{4096}=0.014892578125$，$1222\varepsilon=0.003666$。我从 $1$ 出发，先付 $93.5\%$ 给比较算子的二体部分，再付 $1.49\%$ 给三体尾巴，再付 $0.37\%$ 给四体副本余量，剩下 $0.046167$，比 $1/25=0.04$ 多出 $0.006167$。`[推测]` 这个余量薄得吓人：账上任何一笔常数恶化 $0.007$ 就跌破 $1/25$，恶化 $0.047$ 就整个证不出。所以本篇每一次"错误路线"的代价都能折算成钱，我后面每节都把它折出来。

第一条要交代的失败路线（`[推测]`，但文本证据硬）：`01` 的 Prior work 里对 NWY 截断赝势的划界句 "The distinction in Theorem~\ref{thm:fock} is the full spherical pair interaction... The finite support used in our auxiliary comparison operators does **not** truncate that interaction."。`[推测]` 我最初大概率试过"把 NWY 的截断估计推到截断参数趋于无穷"这类路线，因为它对截断模型几乎免费；失败原因是对象不同：NWY 控制的是截断相互作用的一致隙，而我要的 $H_Q$ 里 $\sum_{p=0}^{2Q-2}B_p^\dagger B_p$ 的和永远取满、模式数随 $Q$ 增长。任何"先截断再极限"的论证都会在 $H_Q^2$ 的四体部分留下截断残差，那个残差不受 $H_Q$ 控制。最后我的做法是反过来的：哈密顿量不碰，只在辅助比较算子 $F_\rho$ 里用模式 $0,\dots,8$，然后靠旋转平均把低模式信息摊回全空间。本篇的语料目录是 `E:\math\preprints\A-Fock-space-inequality-and-the-Laughlin-spectral-gap-September-24-2026`，台账与 §0 的行号都按这个目录里 `build` 下的 tex 版对齐，它在队列里登记为队列第 17 行号。

## 1 措辞为什么长这样：逐条都是防线

`1.2` 类拆解，我把它当作第一页的排雷记录来读。

- "`P_{ij}^{(1)}$ is the orthogonal projector onto pair spin $Q-1$"（`01:30-32`）。两粒子自旋合成里相对角动量一的通道恰好是总自旋 $Q-1$，所以"pair spin $Q-1$"与下一句 "This is relative angular momentum one" 是同义反复。两句都写是因为两套文献方言不同：Haldane–Rezayi 说相对角动量，Ortiz–Nussinov–Dukelsky–Seidel 与 Chen–Seidel 说总自旋。`[推测]` 我先写自旋版（它直接对接我用的 $SU(2)$ 表示论），再补相对角动量一句让 QH 读者认对象。
- "in tensor positions $i,j$" 与 "The sum preserves the antisymmetric subspace"：$P_{ij}^{(1)}$ 定义在张量积上，限制到 $\bigwedge^NU_Q$ 之前必须先说不变性，否则 $H_{N,Q}$ 的定义不闭合。这是陈述完整性，没有选择余地。
- "Each unordered pair has coefficient one, with **no rescaling** depending on $N$ or $Q$"（`01:35-36`）。全文最关键的防御句。QH 文献里常见 $\frac{2}{N(N-1)}$ 平均归一或按 $Q$ 缩放的磁能尺度；一旦允许 rescale，"$1/25$" 这个数就不再是绝对的，热力学极限的陈述也没意义。这一句把我同所有带归一化选择的有限尺寸数值研究隔开。
- "For every $0<\gamma<\gamma_*$"：开区间。证明里的 $o(1)$ 只能在 $Q\to\infty$ 后压到 $\gamma_*$ 之下，端点系数在球面上取不到；正文 `01` 后面明写 "The proof does not give an explicit flux threshold or the endpoint coefficient $\gamma_*$ on finite spheres."。摘要因此说 "for some fixed $\gamma>1/25$"，避免声称 $\gamma_*$ 本身。
- "$\gamma_*$ 定义成一个 14 位有理数再证 $>1/25$"：$\gamma_*=4616733319001/10^{14}$ 是终盘预算算出来的余量，我先有账本后有常数；写成 $14$ 位定点小数是为了验证在 `norm_num`/`decide` 里一行完成（Lean 侧 `Fock/SharpGap.lean` 的 `one_twenty_fifth_lt_gammaStar : (1/25 : ℝ) < gammaStar := by norm_num`）。
- "there is **an integer** $Q_\gamma$" 与 "$Q\ge 1$ 是磁通量子数"：阈值取整数因为证明里用 $Q\ge24$（`05` 局部模式盒）与 $Q\ge4$（`06` 尾巴比值单调）这类整数条件；$Q_\gamma$ 对 $\gamma$ 的依赖不连续，$\gamma\uparrow\gamma_*$ 时它发散。
- "The threshold $Q_\gamma$ is **independent of particle number**"：真正的卖点。技术上能成立，是因为所有估计都在升算子 $\mathcal L_k$ 层面做，$\mathcal L_k$ 的定义不含 $N$；相对误差载体 $h_Q=\sum_{p\le23}B_p^\dagger B_p$ 也是 Fock 算子，并非扇区算子。
- 摘要 "on the **entire** lowest-Landau-level Fock space"：$0\le N\le Q+1$ 全包括，含 $H_{0,Q}=H_{1,Q}=0$ 两个空扇区；零算子上 $H^2\ge\gamma H$ 自动成立，所以敢包。
- $Q=3(N-1)$ 写死：填充 $1/3$ 的磁通粒子数关系。`[推测]` 不参数化它，是因为核唯一性引理（`06` 的 lem:kernel）用"每个粒子变量的度数被 $\prod b_{ij}^3$ 耗尽"论证，$3(N-1)=Q$ 是等式才成立；$Q$ 稍大时核可能变大，维数法不控制。
- 推论用 $1/25$、定理用开区间：$1/25$ 是给物理共同体的可读结论，$\gamma_*$ 是机器值。`[推测]` 选 25 ，并非 20，就是让 $\gamma_*>1/25$ 的验证一行 `norm_num`。

还有一条量化层面的自我限制（`01` 正文）："In a particle sector without a zero mode, this statement bounds the energy away from zero; it does not assert a gap between that sector's two lowest eigenvalues." 即 $H_Q^2\ge\gamma H_Q$ 在无零模扇区只给"离零有距离"，"两个最低本征值之差"要在有唯一零模的扇区才成立。这句是 lem:kernel 存在的全部理由。

## 2 与前人划界：每句划界都像伤疤

`1.3` 的内容我按"哪句防哪种误读"来整理。

Haldane–Rezayi 有限尺寸研究被描述为提供了数值证据并 "explicitly distinguished the expected hard-core gap from a formal proof"（`01`）：数值与证明的分界他们自己画了，我引用时不敢含糊。GMP 密度波、Trugman–Kivelson、Ortiz 等的代数的零模构造、Chen–Seidel 与 Mazaheri 等的刻画、Jansen 圆柱、Nakamura–Wang–Bergholtz 与 Wang–Nakamura 的轨道链、Warzel–Young 细环面与 bulk/edge：这些都在"间接证据"一边，我的定理不跟它们竞争强度，只补下界。

三句我最在意的划界：

1. 对 NWY（截断费米赝势一致谱隙）：先承认 "The fermionic estimates already hold uniformly across particle sectors."，随后立刻划界（引文见第 0 节）。`[推测]` 这是全文最需要防的误读，审稿人一句"这不就是 NWY 搬到非截断情形"就能淹掉卖点，所以我把"我用了有限个轨道模式"与"我没有截断相互作用"拆成两句说。
2. 对 Lemm–Nachtergaele–Warzel–Young 2026 递归：承认方法可复用，但 "a uniform bound for the full pseudopotential still requires control of the model-specific ground-space overlap matrices in those criteria."（`01`）。这句在后面兑现成 cor:charge-neutral 的引用方式：精确到 "arXiv v1, Theorem 2.1(I), Lemma 2.3, and (2.10)"（`06`）。
3. 对 Schraven–Warzel 的 IMPS 纠缠隙与 Lieb–Rougerie–Yngvason 密度刚性：两句短促的 "The entanglement spectrum is distinct from the Hamiltonian spectrum considered here." 与 "No density-screening assumption enters our argument."。都是"别把我算进你们那一类"。

方法论先例：`01` 的 Proof strategy 第一句 "Proving positivity of $H^2-\gamma H$ is a standard route to a gap, underlying finite-size criteria [Knabe] and methods based on positive local decompositions [Cruz,Rai]."，我在路线层面认祖归宗，比较算子部分再引 `04` 里 Gao–Lanzetta–Ledwith–Wang–Khalaf 的量子霍尔 bootstrap（"Here the explicit squares are compared with $H_Q^2-\gamma H_Q$ to control the positive excitation spectrum." 划清 bootstrapping 只做基态能量上界、我做激发谱下界）。`references.bib` 的 27 个键里，概念性引用有四篇要单独点出：`Wick`（正常序）、`BartlettRudolphSpekkens`（Schur 平均的出处，`04` 引它的 Section II.C）、`PeyrlParrilo`（有理系数 SOS 与特征系数正性判据，`08` 引它的 Theorem 5）、`HouConference`（Leverrier–Faddeev，`08` 的递推出处）。

## 3 装配链：六次转移与三处"数值不够"

全文的总预算一句（`01:budget`，逐字）：

> \[ H_Q^2\ge\mathcal K_Q+(\gamma_*-o(1))H_Q. \]

节序即证明序，六次转移：

1. `02`（sec:algebra）：$H_Q=\sum_pB_p^\dagger B_p=\mathcal L_2(\Pi_{V_Q})$，Wick 型正常序得 lem:square：$H^2=H+\mathcal L_3(W_3(W_3^\dagger W_3-I)W_3^\dagger)+\mathcal L_4(W_4W_4^\dagger)$。对象从"多项式相互作用"变成"2/3/4 体升算子之和"。
2. `03`（sec:spin）：显式基底里算配对系数 $v_p(i,j)$（lem:pair）、三体 Gram 谱 $q_z(Q)$（lem:q）、固定亏缺耦合极限（lem:coupling）。从抽象表示论到可算的根数与阶乘。
3. `04`（sec:squares）：比较算子 $\mathcal K_Q=d_a\int K(g)dg$，$K=\sum_{\rho=1}^7F_\rho^\dagger F_\rho$；Schur 平均切成 $A_2+A_3+A_4$，$A_2=\eta H$；三体用 $e_z$ 证书，四体用 $G_D(2\chi-E_D+\varepsilon I)G_D\ge0$。从"正算子的积分"到"分块有限不等式"。
4. `05`（sec:transfer）：对角换元 $\Delta_Q$ 把有限磁通的消灭算子共轭回极限形式（lem:compression、lem:transfer），得 prop:A4：$A_4\le\mathcal L_4(W_4W_4^\dagger)+(1222\varepsilon+o(1))H$。
5. `06`（sec:finish）：三体尾巴 lem:tail（$\delta_Q\to61/4096$）+ 终盘预算出 thm:fock；lem:kernel + 谱定理出 thm:main；引用 LNWY 出 cor:charge-neutral。
6. `07`（sec:plane）出 cor:plane；`08`（app:certificate）承担全部有理算术。

论文自己点名"仅靠数值不等式不能支持"的过渡有三处，我认为是最像真实思维链残留的取证点，逐字抄在这里：

- 三体到全 Fock："A small norm error on a growing many-particle space would not suffice: it must vanish on the zero modes and be controlled by the pair energy."（`01` 图注之前）。范数误差 $\|A_3-\mathcal L_3(\cdots)\|\le o(1)$ 无效，必须相对 $H_Q$。
- 四体 Gram 有核："The limiting positivity is imposed only after wedging; no invertibility of its Gram matrices is required."（图注）；正文配套 "This relative estimate remains valid when the Gram matrices of these limiting four-particle images have kernels." 与 "we never assume that the wedged copy vectors are independent."
- 转移本身的连续性："The limiting Gram matrices have kernels, so their positivity cannot be transferred by assuming that their ranges vary continuously. Instead, we compare the annihilators themselves."（`05` 开篇第一句）。

还有两句计数上的警告也属于这一类："The remaining issue is to transfer those inequalities to finite spheres without an error that grows with the number of particles."（`01`）与 "Bessel's inequality then avoids an extra factor equal to the number of spin copies."（`05`，即 $10946\varepsilon$ 降为 $1222\varepsilon$ 的那一步）。这三类困难在 Lean 侧各有对应模块（`Exterior/Scaling.lean`、`Pair/Conjugation.lean`、`FourBody/BesselAllowance.lean`），说明它们当时刻意被当成独立难点处理过。`[推测]` 我倾向于把这三处读成时间线上真实存在的三次返工，第 22 节的文件考古支持这个读法。

`figures/relative-transfer.tex` 的三格流程图值得记下来，它把第 05 节的逻辑压成一行：`Finite limiting matrices`（four-particle 空间上的精确正性）→ `Fixed set of modes`（精确换元，误差由配对能量控制）→ `All particle sectors`（加旁观模态、旋转平均）。标题性的短语是 "isolates the passage responsible for this uniformity"。

## 4 定义层：$B(v)$、$\mathcal L_k$ 与"系数一"的完整验证

`02` 的原文（逐字，节选）：

> let $B(v)$ be the adjoint of left wedge multiplication by $v$. Thus $B(v)$ is conjugate-linear in $v$, and $B(v\wedge w)=B(w)B(v)$. For an orthonormal basis $e_0,\ldots,e_Q$ of $U_Q$, write $c_j=B(e_j)$. These operators satisfy the canonical anticommutation relations, and $\norm{c_j}\le1$.
> \[ \LL_k(\ket v\bra w)=B(v)^\dagger B(w). \]
> \[ B_p=B(v_p),\qquad H_Q=\LL_2(\Pi_{V_Q})=\sum_{p=0}^{2Q-2}B_p^\dagger B_p. \]

三个约定各自的位置：$B$ 对 $v$ 共轭线性，是为了让 $\mathcal L_k(|v\rangle\langle w|)=B(v)^\dagger B(w)$ 整体线性（右矢进消灭算子、左矢进创造算子，两处共轭相互抵消）；$B(v\wedge w)=B(w)B(v)$ 是把"对楔乘法的伴随"逐次分解成"先消 $v$ 再消 $w$"的顺序约定；$\|c_j\|\le1$ 因为消灭算子把 $n$ 粒子扇区映到 $n-1$ 扇区且保范数不增。"wedges of distinct increasing orthonormal basis vectors have norm one" 这条约定（`02:7-8`）决定了全文所有 $\sqrt{\cdot}$ 因子：若改用不带 $\sqrt{n!}$ 归一的 $\mathrm{Alt}$ 约定，$B(v_p)$ 与 $c_j$ 之间会漏进 $\sqrt2,\sqrt6$ 一类因子，lem:pair 与 `05` 的 $\Delta_Q$ 公式全部要重排。Lean 里这条约定的代价被钉死在 `Tensor/ExteriorIsometry.lean`：`normalizedTensorExterior := (√(n!))⁻¹ • tensorExterior n Q ψ`，配上 `normalizedTensorExterior_energy ... = energy ψ` 与 `tensorExterior_energy ... = (n+2)!·energy ψ`；`Fock/Hamiltonian.lean` 的 `sourcePairCreateEnd` 里的 `/ Real.sqrt 2` 是同一件事的碎片。

"系数一"的验证是 `02` 压缩成一句话的部分，我在纸上展开过一遍。设 $A_v^{(ij)}$ 为"在张量槽 $i,j$ 处与 $v$ 做配对收缩"的算子。对 Slater 型基元 $\varphi=e_{a_1}\wedge\cdots\wedge e_{a_N}$：

$$\Big\langle\varphi,\textstyle\sum_{i<j}(|v\rangle\langle v|)_{ij}\,\varphi\Big\rangle=\sum_{\{i,j\}\subset\mathrm{occ}}|\langle e_i\wedge e_j,\,v\rangle|^2=\|B(v)\varphi\|^2=\langle\varphi,B(v)^\dagger B(v)\varphi\rangle,$$

中间等号就是"二体约化密度矩阵在 Slater 行列式上等于 $\sum_{i<j\in\mathrm{occ}}|ij\rangle\langle ij|$"（迹为 $\binom N2$）。两边都是 $N$ 体算子、在 Slater 基上矩阵元相同，故在整个 $\bigwedge^NU_Q$ 上相等。对 $V_Q$ 的 ONB $\{v_p\}$ 求和即得 $\sum_{i<j}\Pi^{(1)}_{ij}=\sum_pB_p^\dagger B_p=\mathcal L_2(\Pi_{V_Q})$。这也解释了论文那句 "contraction in two specified tensor positions corresponds to $B(v)/\sqrt{\binom N2}$"：$\binom N2$ 个指定槽收缩算子的平方和要恰好等于单个 $B(v)^\dagger B(v)$，归一因子只能这么取。

`[推测]` 候选失败路线两条。路线 A：全程在张量积上直接对 $P^{(1)}_{ij}$ 计算，不引入 $\mathcal L_k$。文本证据是 `02` 开篇第二句 "The lifting notation below keeps this calculation independent of particle number."。不用升算子，每条引理都要随身携带 $N$，误差里的 $\binom N2$ 型增长早晚泄漏，第 0 节的"与粒子数无关"就没了。路线 B：把 $H_Q$ 定义成 $\sum_pB_p^\dagger B_p$ 而不验证它等于物理和。文本证据是那句单独的 "We verify its coefficient-one normalization here."；`[推测]` 这句是写给审稿风险的，我把它读成作者在被问过"你的 $H_Q$ 和 Haldane 的 $H_{N,Q}$ 差一个常数吗"之后加的。

## 5 lem:square：正常序平方，和一个会让人丢三体的坑

引理内容（`02`，逐字）：

> On $\FF_Q$,
> \[ H^2=H+\LL_3\!\left(W_3(W_3^\dagger W_3-I)W_3^\dagger\right)+\LL_4(W_4W_4^\dagger). \]

证明的骨架是逐扇区反解系数（`02` 原文语序）："In normal ordering $B_p^\dagger(B_pB_r^\dagger)B_r$, only the two inner annihilators cross the two inner creators. Two, one, or zero contractions leave two-, three-, or four-body terms."；$N=2$ 扇区用 $\Pi_{V_Q}$ 是投影钉住二体系数；零收缩项是 $\sum_{p,r}B(v_p\wedge v_r)^\dagger B(v_p\wedge v_r)=\mathcal L_4(W_4W_4^\dagger)$，紧跟一句 "There is no extra factor of two: this sum, and the defining basis of $V_Q\otimes V_Q$, both use ordered pairs."；$N=3$ 扇区用 $H=W_3W_3^\dagger$ 反解出 $W_3(W_3^\dagger W_3-I)W_3^\dagger$；末句 "Normal-ordered coefficients are determined successively by these restrictions, proving the identity on Fock space."

我按扇区核验了一遍（$[N=0,1]$ 两端为零；$N=2$ 归约为投影性；$N=3$ 用 $H|_3=W_3W_3^\dagger$ 右端自动等于 $(H|_3)^2$，三体系数正是被这个扇区反解出来的；$N=4$ 起由升算子定义自动扩展）。我还用 eq:pair 显式造了 $Q=5$ 的 $\{v_p\}_{p=0}^{8}\subset\bigwedge^2\mathbb C^6$，构造 $B_p$、$H$、$W_3,W_4$、$\mathcal L_3,\mathcal L_4$，对 $N=0,\dots,6$ 全部扇区比较 $H^2$ 与右端：最大偏差 $1.4\cdot10^{-14}$（在 $N=5$），$N\le4$ 都不超过 $2\cdot10^{-15}$；$\{v_p\}$ 两两内积与 $\delta_{pr}$ 的偏差为 $0$。

这个引理真正阴人的地方（`[补]` 我踩到的）：配对消灭算子 $B(v)$（$v$ 是 2-形式）不满足标量 CAR。若凭费米直觉写 $\{B(v),B(w)^\dagger\}=\langle v,w\rangle I$ 并做一次性 Wick 展开，会算出 $H^2=H+\mathcal L_4(W_4W_4^\dagger)$，三体项凭空消失。反例很小：$U=\mathbb C^3$，$v=e_0\wedge e_1$，$x=e_0\in\bigwedge^1U$，则 $B(v)^\dagger x=v\wedge x=0$，$B(v)x=0$，故 $\{B(v),B(v)^\dagger\}x=0\ne x=\langle v,v\rangle x$。`[推测]` 论文的 "two, one, or zero contractions" 是口语化简写，它必须先被读者（也就是当时的我）当作标量 CAR 用错过一次，才会在证明末尾刻意补那句"由限制逐级确定系数"。另一处常数敏感点：$V_Q\otimes V_Q$ 的基用有序对，若误用无序对称基，四体项差因子 2，终盘预算里 $\mathcal T_4-A_4$ 的符号直接翻掉（因为四体比较 $2\chi$ 对 $E_D$ 是贴脸的，第 13 节的符号表可见其紧）。

`[推测]` 失败路线 B：只在固定 $N$ 做正常序、再把结果"猜"成 Fock 恒等式。文本证据仍是 `02` 首句那句独立于粒子数的宣言；Lean 侧 `Fock/NormalSquare.lean` 的 `sourceFockHamiltonian_normal_square` 在 Fock 层面陈述，右端第三项写成双求和 `Σ_{p,q}‖sourcePairEnd Q q (sourcePairEnd Q p x)‖²` 且用有序 $(p,q)$，与 "ordered pairs" 一一对应。

## 6 lem:pair：下降系数、一次真实踩坑、母函数归一

引理（`03`，逐字）：

> The coefficient of $e_i\wedge e_j$ in $v_p$, for $i<j$, vanishes unless $i+j=p+1$, and otherwise equals
> \[ v_p(i,j)=(i-j)\sqrt{\frac{(Q)_i(Q)_j\,p!}{Q(2Q-2)_p\,i!j!}}. \]
> For fixed $p,i,j$, its limit is \[ v_p^*(i,j)=(i-j)\sqrt{\frac{p!}{2^p i!j!}}\,\mathbf1_{i+j=p+1}. \]

推导链：$v_0=-e_0\wedge e_1$ 是 $V_Q$（自旋 $a=Q-1$）的最高权；$v_p$ 由联合下降 $p$ 次再除以 $\sqrt{(2Q-2)_p\,p!}$ 得到；"自旋 $j$ 上从标号 $p$ 下降到 $p+1$ 的系数是 $\sqrt{(p+1)(2j-p)}$"（`03` 约定句）。联合下降 $F=F^{(1)}+F^{(2)}$ 两槽交换，$F^p=\sum_r\binom prF^{(1)r}F^{(2)(p-r)}$；单槽迭代给 $F^r e_0=\sqrt{(Q)_r}\,e_r$；反对称化后 $e_i\wedge e_j$ 收到两个符号相反的贡献，差出因子 $(i-j)$；除以 $\sqrt{(2Q-2)_p\,p!}$ 保证单位模。

一次真实踩坑的记录 `[补]`：我第一次手算时把 $Fe_1$ 当成 $2e_1$（正确值是 $\sqrt{(1)(2Q-1)}e_2=\sqrt6\,e_2$ 于 $Q=5$），又对起点为 $e_1$ 的槽误用了最高权处的下降公式，漏掉因子 $\sqrt{j!(Q-1)_{j-1}}$。这类"下降系数依赖当前标号，并非最高权"的错误是这个引理最容易的失败模式；随后我做完整数值验证（$Q=5$，eq:pair 与逐点下降结果偏差最大 $10^{-16}$）才确认论文公式正确。08 节里 $\sigma(x,y,j,k)$ 排序符号的繁琐与它是同一问题的两个侧面。

归一化的母函数检验（论文给了结果，中间步骤 `[补]`）：系数平方是 $(i-j)^2\binom Qi\binom Qj/(Q\binom{2Q-2}p)$；由 $\sum_ii\binom Qi x^i=xQ(1+x)^{Q-1}$，得 $\sum_{i,j}(i-j)^2\binom Qi\binom Qj x^{i+j}=2Qx(1+x)^{2Q-2}$（$x$ 求导两次、交叉项合并的routine化简），取 $x^{p+1}$ 系数得 $2Q\binom{2Q-2}{p}$，与分母配合给 $2$，对 $i<j$ 折半恰为 $1$。极限式里 $(Q)_i(Q)_j/(Q(2Q-2)_p)\to Q^{p+1}/(Q(2Q)^p)=2^{-p}$，即 eq:pairstar。

指标 $i+j=p+1$ 是权守恒的记账：$v_p$ 的权是 $(Q-1)-p$，展开到 $e_i\wedge e_j$ 要求 $i+j=p+1$。这条守恒后面两处复用：`05` 的 $\Delta_Q$ 是逐标号乘 $d_Q(x)$ 的对角缩放，只有总标号守恒的算子才能被它对角共轭回去；`07` 的平面极限 $v_p^{\mathrm{pl}}(i,j)=(i-j)\sqrt{p!/(2^pi!j!)}\mathbf1_{i+j=p+1}$ 与 eq:pairstar 逐字相同（论文原话 "exactly the limits in \eqref{eq:pairstar}"），这是平面推论的全部技术接口。因子 $(i-j)$ 编码相位：去掉它我实测 $\{v_p\}$ 不再两两正交。

`[推测]` 候选失败路线两条。路线 A：直接引 CG 表。文本证据：`03` 开篇承认系数可由角动量耦合表达并引 `OrtizNussinovDukelskySeidel` 的 Section II.C 与 Appendix A，紧接着 "We derive the particular coefficients and fixed-deficit limits needed here to keep their **phases and normalization** explicit."，说明文献约定的相位不够我用。路线 B：改相位约定（取 $v_0=+e_0\wedge e_1$，或 $B(v\wedge w)=B(v)B(w)$）。文本证据：`02` 特意写出 $B(v\wedge w)=B(w)B(v)$，`03` 特意写出 $v_0=-e_0\wedge e_1$；`[推测]` 目的是让 eq:pair 的 $(i-j)$ 与 08 节 $L_r(A)$ 里 $\sigma(x,y,j,k)(x-y)$ 精确相消（`08` 的 "To verify the cancellation…" 一段就是在核对这个相消）。

Lean 对应（第 22 节展开）：`Pair/CoefficientSquare.lean` 的 `pairCoefficient_sq_choose`、`Pair/Normalization.lean` 的 `pairCoefficient_unit_norm`（依赖 `PairBinomial.pair_binomial_moment`，即母函数等式的系数形式）、`Pair/Conjugation.lean` 的 `pairLimitCoefficient` 与 `pairCoefficient_conjugation`、`Pair/FactorLimit.lean` 的 `modeFactor_tendsto`/`pairFactor_tendsto`。`Model.lean` 里 `pairCoefficient` 带 `/ Real.sqrt 2`，是张量基与楔基约定差的补偿。

## 7 lem:q：三体 Gram 谱，九步推完

引理（`03`，逐字）：

> \[ W_3^\dagger W_3-I=\sum_{z=0}^Qq_z(Q)R_{3,z},\qquad q_z(Q)=(-1)^z\frac{(Q)_z}{(2Q-2)_z}\left(3z-1-\frac{z(z+1)}Q\right). \]
> In particular $W_3R_{3,z}=0$ for $z=0,1,3$ whenever these indices are allowed. For fixed $z$, \[ q_z(Q)\longrightarrow(3z-1)(-1/2)^z. \]

证明我拆成九步跟着做完（前四步是结构，五到七是最高权计算，八九是零扇区与极限）：

1. 把 $V_Q\otimes U_Q$ 识别为"前两槽反对称"的张量空间；在此识别下 $W_3(v\otimes u)=v\wedge u$ 是 $\sqrt3$ 倍全反对称化（原文 "Then $W_3$ is $\sqrt3$ times full antisymmetrization."）。`[补]` $\sqrt3$ 是把 $W_3$ 归成"等距嵌入到其像的 3 倍覆盖"的因子，也是 $q_z$ 括号里 $3z$ 那个 3 的来源之一。
2. Gram 算子是 $I-P_{13}-P_{23}$ 在该子空间上的压缩（$P_{ij}$ 换槽）。`[补]` 理由：$\sqrt3\mathrm{Alt}_3$ 的 Gram 是 $3(I-\sum_{\text{transpositions}}P+\cdots)$ 的压缩；前两槽反对称子空间上 $P_{12}=-I$，含 $P_{12}$ 的三项合并后剩下 $\pm I$ 与 $P_{13}P_{23}$ 型项，化简到 $I-P_{13}-P_{23}$。
3. 两个换槽压缩相等：共轭 $P_{12}P_{13}P_{12}=P_{23}$ 且 $P_{12}=-I$ 在定义域上，故 $\langle\xi,P_{13}\xi\rangle=\langle\xi,P_{23}\xi\rangle$，压缩意义下 $W_3^\dagger W_3-I=-2P_{23}$。
4. 等变性加重数自由：在每个自旋块 $R_{3,z}$ 上是标量 $b_z$，$q_z=-2b_z$。
5. 最高权向量 $\xi_z=\sum_{p=0}^zs_pv_p\otimes e_{z-p}$ 满足相邻比（eq:highest-ratio）
$$\frac{s_{p+1}}{s_p}=-\sqrt{\frac{(z-p)(Q-z+p+1)}{(p+1)(2Q-2-p)}}.$$
`[补]` 来源是上升方程 $F\xi_z=0$：$F^{(1)}$ 把 $v_p$ 抬到 $v_{p-1}$、$F^{(2)}$ 把 $e_{z-p}$ 抬到 $e_{z-p-1}$，合并同 $v_p\otimes e_{z-p-1}$ 项的系数。论文只写 "This follows by applying the raising operator."。
6. 迭代比式得两条闭式：$s_z/s_0=(-1)^z\sqrt{(Q)_z/(2Q-2)_z}$，$s_{z-1}/s_0=(-1)^{z-1}\sqrt{z(Q-1)_{z-1}/(2Q-2)_{z-1}}$。`[补]` 这里是我核验时最容易读错的一行：第二条不是把第一条的 $z$ 换成 $z-1$，是比式连乘 $p=0,\dots,z-2$ 之后的合并化简；我验 $z=1$：比式给 $s_1/s_0=-\sqrt{Q/(2Q-2)}$，第一条闭式给 $-\sqrt{Q/(2Q-2)}$ 一致，第二条此时读作 $s_0/s_0=1$ 的右式 $\sqrt{1\cdot(Q-1)_0/(2Q-2)_0}=1$，也对。
7. 用 $v_0=(-e_0\otimes e_1+e_1\otimes e_0)/\sqrt2$ 把 $P_{23}\xi_z$ 对 $v_0\otimes e_z$ 配对：只有有序三元组 $(0,z,1)$ 与 $(1,z,0)$ 贡献，配对指标分别是 $z-1$ 与 $z$（$z=0$ 时第一项不存在），代入 eq:pair 得论文式
$$s_0b_z=\frac12\Big[s_{z-1}\sqrt{\tfrac{z(Q)_z}{Q(2Q-2)_{z-1}}}-s_z(z-1)\sqrt{\tfrac{(Q)_z}{(2Q-2)_z}}\Big].$$
`[补]` 因子 $\tfrac12$ 是 $v_0$ 展开进有序张量基的 $1/\sqrt2$ 与换回楔基的另一个 $1/\sqrt2$；两项符号相反来自 $(i-j)$ 与 $v_0$ 的负号。把第 6 步代进去、整理 $(Q-1)_{z-1}=(Q)_z/(Q-z+1)$ 一类阶乘比，得 $q_z=-2b_z$ 恰为 eq:q。论文一句 "Substitution gives $q_z=-2b_z$" 省略的正是这段纯阶乘代数。
8. 三个零扇区：$q_0=q_1=q_3=-1$ 代入即验证，即 $W_3R_{3,z}=0$。$z=0,1$ 是 $\bigwedge^3$ 里不存在的自旋（度数计数），$z=3$ 是"三个粒子已在相互作用通道"的排除。
9. 极限：$(Q)_z/(2Q-2)_z\to2^{-z}$、$z(z+1)/Q\to0$，$q_z(Q)\to(3z-1)(-1/2)^z$。

指标范围的机械理由：张量积分解规则 "The elementary tensor product rule decomposes spins $j_1,j_2$ into one copy of each spin $j_1+j_2-z$, for $0\le z\le\min(2j_1,2j_2)$."，此处 $j_1=(Q-1)/2$、$j_2=Q/2$，$\min(2Q-2,Q)=Q$ 当 $Q\ge2$，这就是 "For $Q\ge2$, the allowed indices are $0\le z\le Q$" 的唯一理由，且它依赖 $Q\ge2$（$Q=1$ 时 $2j_1=0<Q$，规则反转）。`[补]` 论文另给的求和核验：$\sum_{z=0}^Qd_{3,z}=\sum_{z=0}^Q(3Q-1-2z)=(Q+1)(3Q-1)-Q(Q+1)=(Q+1)(2Q-1)$，恰为 $\dim V_Q\cdot\dim U_Q=(2Q-1)(Q+1)$，"exhausting the tensor product" 成立，$d_{3,z}=3Q-1-2z$ 只能是这个形式。

独立数值核验：$Q=5$ 时我对 $54\times54$ 的 $W_3^\dagger W_3$ 直接对角化，特征值集合 $\{0,\,0.857143,\,1.5,\,2.357143\}$ 与 $\{1+q_z\}_{z=0}^5$ 一致，按 $d_{3,z}=14,12,10,8,6,4$ 重数展开排序后最大偏差 $2.7\cdot10^{-15}$；$q_0,q_1,q_3$ 精确为 $-1$。

`[推测]` 候选失败路线三条。路线 A：不做精确对角化、用有限尺寸数值拟合三体比较常数。文本证据：`01` "The three-body blocks have an explicit spectrum and a summable tail." 与 `08` Remark "No many-particle finite-size spectrum, numerical extrapolation, or assumed plasma property enters the argument."；精确谱是 $\delta_Q$ 可求和的前提。路线 B：把 $z$ 求和截断后宣称其余为正可丢：奇 $z$ 的 $q_z<0$，$z\ge16$ 的项为负，必须用 lem:tail 以 $-\delta_QH$ 吸收，终盘显式付出 $61/4096$。路线 C：见 $z=2$ 块为正就直接写 $W_3^\dagger W_3\ge I$：交替符号说明逐块正性不成立，只能分块处理。`Lean:` `ThreeBody/Gram.lean`（分块）、`ThreeBody/NullFormula.lean`（`gramEigenvalueFormula_zero/one/three` 三条独立命名，正是 "In particular $W_3R_{3,z}=0$ for $z=0,1,3$" 的痕迹；我读了 `gramEigenvalueFormula_three` 的证明，它为分母多项式 $-6+13Q-9Q^2+2Q^3\ne0$ 单独构造了 $((Q-1)(Q-2)(2Q-3)>0)$ 的 `nlinarith`，说明 $z=3$ 那条在形式化里并不平凡）、`Asymptotics/Bound.lean` 的 `gramEigenvalueFormula_abs_le`（把 $|q_z|$ 界成 $(2/3)^z\cdot3z$，lem:tail 的控制项）、`Asymptotics/Convergence.lean` 的 `deltaFormula_tendsto`。

## 8 lem:coupling：固定亏缺耦合极限，$u$ 被用了两次

引理（`03`，逐字）：

> Suppose $j_1,j_2\to\infty$ and $j_2/(j_1+j_2)\to u^2$, where $0<u<1$. Put $v=\sqrt{1-u^2}$. For fixed integers $0\le z\le T$, the normalized coupled vector of spin $j_1+j_2-z$ at total lowering deficit $T$ can be chosen with real coefficients converging to the coefficients $s^{(u)}_{z,T,p}$ of
> \[ \frac{(uX-vY)^z(vX+uY)^{T-z}}{\sqrt{z!(T-z)!}}. \]

前置约定（逐字）："Coefficients below are with respect to normalized monomials $X^pY^{T-p}/\sqrt{p!(T-p)!}$, and are zero outside the stated index ranges."

证明展开：最高亏缺情形 $T=z$ 的上升方程给相邻比 $-\sqrt{(z-p)(2j_2-z+p+1)/((p+1)(2j_1-p))}$，与 lem:q 的 eq:highest-ratio 同形（那正是 $2j_1=2Q-2$、$2j_2=2Q$ 的特例）；在 $p=0$ 取符号 $(-1)^z$，极限下比式趋于 $-\frac uv\sqrt{(z-p)/(p+1)}$ 型，逐点"积分"（连乘展开）得 $(uX-vY)^z/\sqrt{z!}$ 的系数。归一是免费的："The change of variables $(X,Y)\mapsto(uX-vY,vX+uY)$ is orthogonal, so these polynomials have norm one in the normalized-monomial inner product." 后代靠归一化下降：从亏缺 $T$ 到 $T+1$ 是把两槽下降算子之和除以 $\sqrt{(T-z+1)\{2(j_1+j_2-z)-(T-z)\}}$，极限下等于乘 $(vX+uY)/\sqrt{T-z+1}$，对 $T$ 归纳。末句 "Descendants in every copy are obtained by normalized lowering, so the matching of bases between equal-spin copies is intertwining" 是给 `04` 四体部分 $\mathcal R_D$ 里多个同自旋副本准备的：不同副本用同一 $u$ 的极限基，副本间比较才有确定的基对接。

两次使用与 $u$ 的取值（`[补]` 这是我最想写清楚的一笔账）：三体用 $u=1/\sqrt3$（eq:ez 处 "with $u=1/\sqrt3$"），四体用 $u=1/\sqrt2$（eq:S 处两个 $s^{(1/\sqrt2)}$）。`08` 的显式公式把 $u$ 摊开：$s^{(1/\sqrt3)}_{z,T,p}=\mathsf U(2,z,T,p)\sqrt{2^z\binom Tz/(3^T2^p\binom Tp)}$，分母那个 $3^T$ 就是 $u^2=1/3$ 的直接暴露；$\mathsf V_r$ 用 $\mathsf U(1,\cdot,\cdot,\cdot)$ 与 $2$ 的幂，对应 $u^2=1/2$。我用 rows.txt 复算 $e_z$ 表时，$2^{(z-p)/2}$ 这一项必须存在才能逐位对上 1298313 那串整数，这是"$u$ 取错则全盘皆输"的机器证据。$0<u<1$ 开区间的原因：$u=0$ 或 $1$ 时 $(uX-vY)$ 退化单项，极限基失去满支撑，$\sqrt{z!(T-z)!}$ 归一失效。

`[推测]` 候选失败路线两条。路线 A：对有限 $Q$ 的 CG 系数直接渐近展开、不引入自由参数 $u$。文本证据："We will repeatedly use a fixed-deficit limit of this same calculation."，重复使用（三体 $e_z$、四体 $S_r$）意味着参数化一条引理两处复用比分别展开省事。路线 B：允许 $z=z(Q)$ 随 $Q$ 增长地取极限。文本证据：引理陈述里的 "For **fixed** integers $0\le z\le T$"，以及 `04` 的 "only $1\le D\le23$ since $T\le23$"：极限只在有限指标集上使用，尾部交给 lem:tail/lem:transfer 丢弃。`Lean:` 渐近语句在 `Asymptotics/` 与 `Spin/` 里以 `tendsto_*` 出现；`Spin` 模块 54 文件 3593 行，是除 FiniteFlux 外最大的模块，耦合极限的形式化负担主要落在它身上。

## 9 Schur 平均：保留副本间的相干项

`04` 开篇的无编号断言（逐字）：

> Haar measure $dg$ on $SU(2)$ is normalized to have total mass one. ... Schur averaging sends a rank-one operator on an irreducible spin-$j$ space to its trace times $I/(2j+1)$. For several equivalent copies, it acts in the same way on the spin factor and retains the matrix between copies. Explicitly, ...
> \[ \int U(g)XU(g)^\dagger\,dg=\bigoplus_j\frac{I_{V_j}}{2j+1}\otimes\operatorname{Tr}_{V_j}(P_jXP_j). \]
> In particular, averaging preserves off-diagonal entries between equivalent spin copies.

`[补]` 为什么是"保留副本矩阵"：设 $X$ 在 $V_j\otimes\mathbb C^m$ 上的矩阵元为 $X_{(\alpha r),(\beta s)}$。平均后的算子与所有 $U(h)$ 交换，故落在 $\mathrm{End}_{SU(2)}(V_j\otimes\mathbb C^m)=\mathbb C\cdot I_{V_j}\otimes M_m(\mathbb C)$ 里，形如 $I_{V_j}\otimes Y$；对自旋因子取偏迹定出 $Y=\mathrm{Tr}_{V_j}(X)/(2j+1)$（差一个维数常数按公式归一）。关键是 $Y$ 的 $m\times m$ 矩阵可以非对角。这正是四体部分需要 $\mathbb C^{d_D}\otimes\mathbb C^{\mathcal R_D}$ 张量积结构、需要在副本空间上陈述证书 $G_D(2\chi-E_D+\varepsilon I)G_D\ge0$ 的数学根据。

归一与常数的机械理由："total mass one" 决定平均后不带 $|SU(2)|$ 因子；$\frac1{2j+1}$ 是 $\dim V_j$ 的倒数，所以 $\mathcal K_Q$ 前面显式乘的 $d_a=2Q-1$ 恰好抵消二体平均的 $1/d_a$，得到干净的 $A_2=\eta H$（第 11 节兑现）。若平均归一取成别的样子（例如 $\int dg=1$ 但配 $I/(2j+1)^2$），$\eta$、$e_z$、$E_D$ 全部重标，终盘 $\gamma_*$ 就不是那个数。

`[推测]` 候选失败路线两条。路线 A：把平均算子记成"每自旋块取标量、副本矩阵丢掉"。文本证据是作者连补两句："and retains the matrix between copies" 与 "In particular, averaging preserves off-diagonal entries between equivalent spin copies."，且 `01` 预先警告四体像 "can be linearly dependent"。若丢相干项，四体比较退化为逐副本不等式，误差按副本数放大，恰好对应 prop:A4 里被 Bessel 消掉的 $\lceil D/2\rceil$ 因子（$1222$ 变 $10946$）。路线 B：换用 $SO(3)$ 或别的旋转群版本。`[推测]` $U_Q$ 对奇偶 $Q$ 都需要旋量表示，$SU(2)$ 的 Haar 归一写成 1 最省事。`Lean:` 形式化里没有真的做群积分：Schur 平均的结果（分块 + 副本矩阵）被有限维矩阵论证直接替代，Haar 只出现在 `Fock/OrbitIntegration.lean`、`Fock/RankOneHaar.lean`、`FourBody/CopyOperatorHaar.lean` 这类"轨道平均 = 分块迹"的实现层。

## 10 七行平方 $F_\rho$ 与模式盒：数据即证书

`04` 的定义（逐字）：

> For each of the seven rows in Appendix~\ref{app:certificate}, the integer $t_\rho$ lies in $\{0,\ldots,7\}$. Set
> \[ \mathcal S_\rho=\{(p,j)\in\mathbb Z^2:0\le p\le7,\ 0\le j\le8,\ 0\le p+j-t_\rho\le8\}. \]
> \[ K=\sum_{\rho=1}^7F_\rho^\dagger F_\rho,\qquad F_\rho=\lambda_\rho B_{t_\rho}+\sum_{(p,j)\in\mathcal S_\rho}\alpha^{\rho}_{pj}\,c_{p+j-t_\rho}^\dagger c_jB_p. \]
> Each summand of $F_\rho$ removes two particles and decreases the sum of occupied orbital labels by $t_\rho+1$... This common weight allows the two parts to interfere in their square, adjusting the three-body comparison at the two-body cost $\lambda_\rho^2B_{t_\rho}^\dagger B_{t_\rho}$.
> Only modes $0,\ldots,8$ occur in these auxiliary squares.

权重记账的来源（`[补]`）：eq:pair 说 $v_p$ 承载的轨道标号之和恒为 $p+1$。于是 $c_jB_p$ 移除标号和 $(p+1)+j$、$c_{p+j-t}^\dagger$ 加回 $p+j-t$，净减少 $t+1$；$B_t$ 移除 $t+1$。两个部件同权同粒子数差（都是净 $-2$ 粒子），在 $F_\rho^\dagger F_\rho$ 的交叉项里才可能干涉：权不守恒的交叉项平均后为零。设计逻辑因此是一句话：用一份纯二体代价 $\lambda^2B_t^\dagger B_t$，买一个可调的三体干涉项，顺带得到四体项的负二次型去贴目标。

rows.txt 的七行数据我抄在这里作为账本原件（每行先 $t$、再 $\ell=P\lambda$，之后是 $pj:a_{pj}$；续行归属前一行）：`t` 依次是 $0,1,1,2,5,5,7$；$\ell_\rho$ 依次是 $7181518,-112991,-4247311,3438746,-98645,-3160276,1441784$。系数换算按 `08` 的 eq:alphadata：$\alpha_{pj}=\frac{a_{pj}}P\sqrt{\frac{2^{p-t}t!(p+j-t)!}{p!j!}}$，即每个 $\alpha$ 都是"整数除以 $10^7$ 再乘固定根式"。独立复核：$\sum_\rho\ell_\rho^2=93527408868499$，逐项平方（$7181518^2=51574200864324$、$112991^2=12766966081$、$4247311^2=18039650630721$、$3438746^2=11824974052516$、$98645^2=9730835025$、$3160276^2=9987344386176$、$1441784^2=2078741002656$，相加恰为 $93527408868499$ ✓），故 $\eta=P^{-2}\cdot93527408868499=0.93527408868499$。Lean 里同一个数由一行 `decide` 认证：`Operators/Certificate.lean` 的 `eta_numerator : (rows.map (fun r => r.2.1^2)).sum = 93527408868499 := by decide`。

为什么模式盒是 $0\le p\le7,\ 0\le j\le8$（`[补]`+`[推测]`）：三条界保证出现的单粒子模式不超过 $8$（$c_{p+j-t}^\dagger$ 的指标 $\le8$）。三体一侧 $T=p+j\le15$，于是 $e_z$ 只需验 $z=2,4,5..15$ 共 13 条；四体一侧 $T=p+j+k\le7+8+8=25$？`04` 实际写的是 "every unaveraged term has $T=p+j+k=q+l+i\le23$"，即交叉项要求 $i=q+l-t$ 与 $k$ 都 $\le8$ 把最大可达 $T$ 收到 23，于是"只有 $1\le D\le23$"、23 张证书。盒子放大到 $p\le9$ 会让 $D$ 上限升到 25，`FiniteFlux` 的规模按 $O(D^3)$ 以上增长；盒子缩小则 $\eta$ 变差，终盘直接见底。`[推测]` 这组 $(7,8)$ 与 $D\le23$ 是搜索与证明成本共同夹出来的折中：数据由外部数值搜索给出（论文只负责验证，见第 17 节对 Remark 的读法），搜索时又要 `FiniteFlux` 不至于写不完。

两句配套的防御（`01` 与 `04`）："the Hamiltonian itself is never truncated" 与 "Only modes $0,\ldots,8$ occur in these auxiliary squares"：$H_Q=\sum_{p=0}^{2Q-2}B_p^\dagger B_p$ 永远取全和，只有 $F_\rho$ 用低模式；$d_a\int(\cdot)(g)dg$ 的旋转平均把低模式信息摊到全部 $2Q-1$ 个配对模式上，这就是"不截断相互作用"的实现机制。

`[推测]` 候选失败路线三条。路线 A：只用纯二体平方（只留 $\lambda$ 项）：$A_3=0$，$H^2$ 的三体部分在奇 $z$ 上为负，得整体吞进 $\gamma H$ 余量；仅 $z$ 奇、$z\ge17$ 的尾巴就已经要 $61/4096$，再加上 $z=5,7,\dots,15$ 的块，$\gamma_*$ 大概率压成负数。文本证据：论文专门解释两个部件"interfere in their square"的目的就是匹配三体。路线 B：$F_\rho$ 取多个权的混合：交叉项消失或产生权迁移，eq:Adecomp 的 $A_2+A_3+A_4$ 分层不成立。路线 C：系数取代数无理数以换更好的 $\eta$：`08` 明确 $\alpha$ 是"有理 $\times$ 固定根式"，两两相乘时根式按 eq:alphadata 的因子配成完全平方消掉（`08` 的 "To verify the cancellation…" 一段），全部证书落回 $\mathbb Q$，才能用精确有理算术与 `decide`。取任意实系数则证书不可机检，本篇的"验证型定理"卖点随之消失。

## 11 $F^\dagger F$ 的正常序分解与 $A_2=\eta H$：账本开支

`04` 的三行分解（逐字）：

> Reordering $c_ic_k^\dagger=\delta_{ik}-c_k^\dagger c_i$ gives the two-, three-, and four-body terms of $F^\dagger F$:
> \[ \lambda^2 B_t^\dagger B_t,\tag{normal2} \]
> \[ \sum_{p,j}\lambda\alpha_{pj}\left[(c_iB_t)^\dagger c_jB_p+(c_jB_p)^\dagger c_iB_t\right]+\sum_{p,j;q,l}\alpha_{pj}\alpha_{ql}\delta_{ik}(c_jB_p)^\dagger c_lB_q,\tag{normal3} \]
> \[ -\sum_{p,j;q,l}\alpha_{pj}\alpha_{ql}O_{p,j,k}^\dagger O_{q,l,i}.\tag{normal4} \]
> \[ \mathcal K_Q:=d_a\int K(g)\,dg=A_2+A_3+A_4,\qquad A_2=\eta H,\quad\eta=\sum_\rho\lambda_\rho^2. \]

`[补]` 逐条推导：写 $T_\rho=\sum_{(p,j)}\alpha_{pj}c_i^\dagger c_jB_p$，$F^\dagger F=\lambda^2B_t^\dagger B_t+\lambda B_t^\dagger T+\lambda T^\dagger B_t+T^\dagger T$。交叉项里 $B_t^\dagger c_i^\dagger=(c_iB_t)^\dagger$，且由约定 $B(v\wedge w)=B(w)B(v)$ 得 $c_iB_t=B(v_t\wedge e_i)$ 是三体消灭算子，于是 $(c_iB_t)^\dagger c_jB_p$ 三创三消，正是 normal3 第一个求和；伴随给第二项。$T^\dagger T=B_p^\dagger c_j^\dagger c_ic_k^\dagger c_lB_q$，用 $c_ic_k^\dagger=\delta_{ik}-c_k^\dagger c_i$ 一刀切两半：$\delta_{ik}$ 项留在三体（normal3 第二求和），余下 $-B_p^\dagger c_j^\dagger c_k^\dagger c_ic_lB_q=-O_{p,j,k}^\dagger O_{q,l,i}$ 进四体（normal4）。normal4 的负号来自 CAR 的减号，不是额外约定；没有第二次收缩可用，二体项只来自 $\lambda^2B_t^\dagger B_t$。

$A_2=\eta H$ 的账（`04` 结构 + `[补]`）：$\sum_\rho\lambda_\rho^2B_{t_\rho}^\dagger B_{t_\rho}=\mathcal L_2\big(\sum_\rho\lambda_\rho^2|v_{t_\rho}\rangle\langle v_{t_\rho}|\big)$；该矩阵在不可约 $V_Q$ 上、迹为 $\eta$（$\{v_p\}$ 正交），Schur 平均给 $(\eta/d_a)\Pi_{V_Q}$，乘前面的 $d_a$ 得 $\eta\mathcal L_2(\Pi_{V_Q})=\eta H$。注意结论只依赖 $\eta=\sum\lambda_\rho^2$，与哪些 $t_\rho$ 出现无关。这就是 `08` 把二体一侧的验证压缩成 "In particular $P^2\eta=\sum_\rho\ell_\rho^2=93527408868499$" 一个整数的原因。

常数的临界性：$\eta=0.93527408868499$ 吃掉 $93.5\%$。`[补]` 我的精确分数账：$\gamma_*=\frac{10^{14}-93527408868499-14892578125000-366600000000}{10^{14}}$，其中 $\frac{61}{4096}\cdot10^{14}=14892578125000$、$1222\cdot\frac3{10^6}\cdot10^{14}=366600000000$，分子逐位对上 $4616733319001$ ✓。$\eta$ 每恶化 $0.02$ 就跌破 $1/25$；恶化 $0.047$ 连 $0<\gamma$ 都没了。`Lean:` `Fock/NormalSquare.lean` 的 `sourceFockHamiltonian_normal_square`、`ThreeBody/TraceCertificate.lean` 的 `source_threeBody_trace_certificate_identity`（unaveraged 矩阵的块迹等于 `Certificate.e z`，即 $e_z^Q$ 的定义）、`FourBody/PhysicalCertificate.lean` 的 `physicalLimitGram`/`physicalLimitError`（$G_D$、$E_D$ 的形式化定义，矩阵维数写成 `Fin ((D+1)/2)`，正是 $|\mathcal R_D|=\lceil D/2\rceil$）。`Operators/` 模块 38 文件 2024 行，其中 `Certificate.lean` 只用 55 行就装下七行全部数据，"数据即证书"的组织方式一目了然。

## 12 三体比较：$e_z$ 的 13 条严格不等式与贴脸余量

`04` 三体小节（逐字，含结论）：

> Before wedging, \eqref{eq:normal3} is a matrix on $V_Q\otimes U_Q$. Its nonzero entries preserve $T=p+j$, and $T\le15$. Averaging therefore gives
> \[ A_3=\LL_3\left(W_3\sum_{z=0}^{15}\frac{d_a}{d_{3,z}}e_z^Q R_{3,z}W_3^\dagger\right), \]
> ... By Lemma~\ref{lem:coupling}, with $u=1/\sqrt3$, these traces converge to
> \[ e_z=\sum_\rho\sum_{T=\max(z,t_\rho)}^{15}\left[2\lambda_\rho s_{z,T,t_\rho}\sum_{p+j=T}\alpha^{\rho}_{pj}s_{z,T,p}+\left(\sum_{p+j=T}\alpha^{\rho}_{pj}s_{z,T,p}\right)^2\right], \]
> ...
> \[ e_z<\frac32(3z-1)(-1/2)^z,\qquad z\in\{2,4,5,\ldots,15\}. \]
> There are finitely many strict inequalities, $d_{3,z}/d_a\to3/2$, and the omitted blocks $z=0,1,3$ are annihilated by $W_3$. Consequently, for all sufficiently large $Q$,
> \[ A_3\le\LL_3\left(W_3\sum_{z=0}^{15}q_z(Q)R_{3,z}W_3^\dagger\right). \]

`[补]` 结构拆解四则。其一，"$T=p+j$ 守恒、$T\le15$" 由模式盒直接给出（$p\le7,j\le8$），它同时解释了 eq:ez 求和上限 15 与"13 条不等式"（$z=2,4,5,\dots,15$，跳掉被 $W_3$ 消灭的 $0,1,3$）。其二，块系数 $\frac{d_a}{d_{3,z}}e_z^Q$ 是 Schur 平均在自旋块上给 $\frac{I}{d_{3,z}}\otimes(\text{迹})$ 再乘整体 $d_a$ 的结果；对固定 $z$，$\frac{d_{3,z}}{d_a}=\frac{3Q-1-2z}{2Q-1}\to\frac32$。其三，eq:ez 的两项各对应 normal3 的一类项：$\lambda\alpha$ 交叉项（因子 2 是厄米共轭成对）与 $\alpha\alpha$ 的 $\delta_{ik}$ 收缩（完全平方）；$s_{z,T,t_\rho}$ 是 $B_{t_\rho}$ 侧按 lem:coupling 极限基的系数，$\sum_{p+j=T}\alpha_{pj}s_{z,T,p}$ 是 $\alpha$ 侧的同一展开，"$i=k$ 恰是两个 $T$ 值相等"把 normal3 的匹配条件翻译成求和约束；"empty inner sums are zero" 处理 $T<t_\rho$ 的边界。其四，eq:3certificate 右端 $\frac32(3z-1)(-1/2)^z$ 正是 $\lim\frac{d_{3,z}}{d_a}\cdot\lim q_z(Q)$，所以这条证书的实际含义是 $e_z<\lim(q_z\,d_{3,z}/d_a)$，配合有限 $Q$ 的收敛得 eq:A3bound。

符号与松紧的账（`[补]`）：$z$ 奇时右端为正、$z$ 偶时（$\ge4$）为负。偶 $z$ 的不等式要求 $e_z$ 足够负（"贴脸"），才能把 $H^2$ 里负的三体块盖住；$z=2$ 处右端 $=-\frac32\cdot5\cdot\frac14=-1.875$，是最紧的一条理论边界，但我复算的余量整数恰恰在它这里最大（1298313），说明证书在 $z=2$ 留了最厚的安全垫，把薄垫子放在 $z=5,7,10$ 处（249/250/249，即 $2.49\cdot10^{-4}$ 到 $2.50\cdot10^{-4}$）。`08` 的 floor 表 13 个整数（1298313, 211317, 249, 250, 249, 250, 250, 250, 249, 250, 250, 6470, 250，依次对 $z=2,4,5,\dots,15$）我用 rows.txt 从零复算全部逐字复现，包括 $\mathsf U(2,z,T,p)=\sum_h(-1)^{z-h}\binom zh\binom{T-z}{p-h}2^{p-h}$ 与 $s^{(1/\sqrt3)}_{z,T,p}=\mathsf U(2,z,T,p)\sqrt{2^z\binom Tz/(3^T2^p\binom Tp)}$ 的组合；eq:erational 把根式全部消掉后 $P^2e_z$ 是纯有理数。`[推测]` 这些 $10^{-4}$ 量级的余量说明七行数据被贴脸优化过：任何一位整数改动都可能破坏某条 $m_z>0$，这就是"数据即证书、证书不可碰"的含义。

`[推测]` 候选失败路线三条。路线 A：让 $e_z$ 与 $q_z\cdot d_{3,z}/d_a$ 取等号（精确匹配三体）。文本证据：不等号是严格小于，且 $\varepsilon$ 只出现在四体一侧；严格性正是"有限条严格不等式自动吸收 $o(1)$"的机制，写成 $\le$ 就不能直接宣布"充分大 $Q$"。路线 B：把三体尾巴 $z>15$ 也塞进证书：模式盒决定了 $T\le15$，$z>15$ 块无法用这七行数据控制，只能由 lem:tail 以 $-\delta_QH$ 统一吸收，终盘付 $61/4096$（第 17 节）。`[推测]` 这也是 $e_z$ 表为什么恰好做到 15：16 之后归 $\delta_Q$ 管，两边在 $z=16$ 交接班。路线 C：三体极限也用 $u=1/\sqrt2$ 的对称选择：`04` 明写 "with $u=1/\sqrt3$"；参与耦合的自旋渐近比值决定 $u$，选错则 13 条不等式不可能全过（我复算时试过把 $3^T$ 换成 $2^T$，第一条 $z=2$ 就崩）。

## 13 四体比较：副本结构、$E_D$、$\chi$、偶 $D$ 消失与我的返工猜测

`04` 四体小节的对象链（逐字，节选）：

> Let $\widehat W:V_Q\otimes\bigwedge^2U_Q\to\bigwedge^4U_Q$ be the wedge map. The second tensor factor decomposes into spins $Q-r$, with $r$ odd, $1\le r\le Q$. ... A copy of spin $2Q-1-D$ is obtained by coupling $a=Q-1$ with $Q-r$ at deficit $D-r$. ... the allowed copy labels are $\mathcal R_D=\{1,3,5,\ldots\}\cap[1,D]$, $D\le T$.
> \[ S_r(D,T;p,j,k)=\sqrt2\,s^{(1/\sqrt2)}_{r,j+k,j}\,s^{(1/\sqrt2)}_{D-r,T-r,p}, \]
> interpreted as zero if $r>j+k$. ... Only $1\le D\le23$ contribute: every unaveraged term has $T=p+j+k=q+l+i\le23$.
> Put $d_D=4Q-1-2D$. ... the spin-$2Q-1-D$ block is identified with $\mathbb C^{d_D}\otimes\mathbb C^{\mathcal R_D}$ ...
> \[ (E_D)_{rs}=-\sum_\rho\sum_{\substack{p,j;q,l\\T\ge D}}\alpha^{\rho}_{pj}\alpha^{\rho}_{ql}S_r(D,T;p,j,k)S_s(D,T;q,l,i), \]
> The target term $\LL_4(W_4W_4^\dagger)$ is obtained from the $r=1$ summand, since that summand is $V_Q\otimes V_Q$. Thus its copy matrix ... is $(d_D/d_a)\chi$, where $\chi_{rs}=\mathbf1_{r=s=1}$, $d_D/d_a\to2$.
> For even $D$, the $r=1$ coupled vector is antisymmetric under exchange of its two spin-$a$ factors, since its coupling deficit is $D-1$. Wedging two degree-two vectors is symmetric, so this target column then vanishes after applying $\widehat W$. The formula with $\chi$ still represents it exactly; we never assume that the wedged copy vectors are independent.

`[补]` 副本标号的账：$\bigwedge^2U_Q$ 按自旋 $Q-r$（$r$ 奇）分解，$r=1$ 就是 $V_Q$ 本身（"at $r=1$ this is precisely the basis $v_p$"）。与 $a=Q-1$ 耦合到总自旋 $2Q-1-D$：第二因子相对 $Q-1$ 自带亏缺 $r-1$，剩给第一因子的耦合亏缺是 $D-r$，要求 $1\le r\le D$ 且 $r$ 奇，故 $|\mathcal R_D|=\lceil D/2\rceil$。$d_D=4Q-1-2D$ 是该自旋块每副本的磁量子数维数；我不需要它的精确组合推导也够用，关键只有两条渐近：$d_D/d_a\to2$（目标系数 $2\chi$ 的来源）与 $D\le23$ 时 $d_D>0$（需 $Q\ge12$，与 `05` 的 $Q\ge24$ 一致）。$S_r$ 的 $\sqrt2$：两次用 lem:coupling（先两个单粒子自旋、再两个配对自旋），$j<k$ 的楔基与有序张量基之间再贡献一个 $\sqrt2$；"interpreted as zero if $r>j+k$" 是 $\mathsf U$ 的定义域约定。$E_D$ 继承 normal4 的负号，因此它是"正的"二次型素材：证书 $2\chi-E_D+\varepsilon I$ 读作"$E_D$ 不许超过目标 $2\chi$"。对称性（论文给了一句）：交换两个有序指标对 $(p,j)\leftrightarrow(q,l)$ 把 $r\leftrightarrow s$，所以 $E_D$ 实对称；`08` 的 "Both entry sums are ordered." 是同一条簿记的提醒（不许折半）。

证书的形式（`04` 末段逐字）：

> With allowance $\eps=3\cdot10^{-6}$, the limiting comparison on these four-particle images asks that $W_D^*(2\chi-E_D+\eps I)(W_D^*)^\dagger$ be nonnegative. Lemma~\ref{lem:compression} identifies this with the exact certificate
> \[ G_D(2\chi-E_D+\eps I)G_D\ge0,\qquad 1\le D\le23, \]

其中 $(G_D)_{rs}=\langle w_{Dr}^*,w_{Ds}^*\rangle$ 是极限副本向量的 Gram。"The star is a limit label, not an adjoint" 这句论文特意加了，我抄下来是因为我自己读串过一次。

偶 $D$ 消失那一段为什么必须写：目标是 $G_DCG_D\ge0$。$D$ 偶时 $r=1$ 的耦合向量对两个 spin-$a$ 因子反对称（亏缺 $D-1$ 为奇），而 $\widehat W$ 对两个二次向量对称，所以 $\widehat W|D,D;1\rangle_Q=0$：$G_D$ 第一列为零，目标项 $2\chi$ 在合同里"乘了零"，不等式实际由 $E_D$ 与其他副本支撑。`[推测]` 我几乎肯定这里是返工过的痕迹：先写下更强的 $2\chi-E_D+\varepsilon I\ge0$（自然、无 $G_D$），发现偶 $D$ 时该矩阵根本不正（(1,1) 元 $2-E_{11}$ 可以为负，而 $G_D$ 的第一列此时是零向量，合同后该方向自动免检），才改成带 $G_D$ 的合同形式并在正文留下三处独立免责声明（"can be linearly dependent"、"we never assume..."、`08` 的 "it does not invert $G_D$ or presume that its columns are independent"）。

四体证书的机器复核（我按 `08` 公式从零做精确有理算术）：$u_r=\frac1{r!(D-r)!}$，$(E_D)_{rs}=\sqrt{u_ru_s}Y_{rs}$，$(G_D)_{rs}=\sqrt{u_ru_s}Z_{rs}$，$\mathsf V_r=\mathsf U(1,r,j+k,j)\mathsf U(1,D-r,T-r,p)$，eq:Srational / eq:Yrational / eq:Lrational / eq:Zrational 逐式实现后 $M=ZBZ$（eq:M，$B=\mathrm{diag}((2\mathbf1_{r=1}+\varepsilon)u_r)-D_uYD_u$），再跑 Leverrier–Faddeev 递推 eq:recurrence（$X=MJ$，$c_b=\mathrm{tr}X/b$，$J=c_bI-X$，对 $-M$ 做特征多项式系数）。$D=1,\dots,23$ 的符号串我逐字复现：`0`,`0`,`00`,`00`,`+00`,`000`,`+000`,`+000`,`++000`,`+0000`,`+++000`,`++0000`,`++++000`,`+++0000`,`+++++000`,`++++0000`,`++++++000`,`+++++0000`,`+++++++000`,`++++++0000`,`++++++++000`,`+++++++0000`,`+++++++++000`（`+` 为正系数、`0` 为零，按降幂排）。复现中暴露两处"读错就会全盘皆输"的细节（`[补]`）：其一，eq:Lrational 里 $p=x+y-1$ 的代换与 $\sigma(x,y,j,k)$ 排序符号，错一个符号整列 $Z$ 就废；其二，$D=5$ 的 $M_{11}=\frac{56737668577815655510619653}{300647710720000000000000}$ 与 Lean `FiniteFlux/Positive05.lean` 里 `pivotsFive` 第一个主元逐位相同，且 `pivotsFive = ![该值, 0, 0]` 的秩 1 形态与我的符号 `+00` 一致；偶 $D$（我试了 $D=12$）$M_{11}=0$，与"加楔后 $r=1$ 列为零"完全对上。特征系数判正性的逻辑（`08` 引 Peyrl–Parrilo Theorem 5）：所有特征系数非负给 $\det(xI+M)>0$（$x>0$），实对称 $M$ 若有负特征值则该多项式有正根，矛盾，故 $M\ge0$。

`[推测]` 候选失败路线三条。路线 A：假设 $\{w_{Dr}^Q\}$ 线性无关、直接证书 $2\chi-E_D^Q+\varepsilon I\ge0$：文本证据是上面三处免责声明；若走这条，lem:transfer 的相对误差传不过核方向。路线 B：在有限 $Q$ 直接对角化 $E_D^Q$：论文坚持 $E_D^Q\to E_D$ 的逐点收敛（有限个 $D$）加极限证书，把有限 $Q$ 全部推给 `05`；Lean 里 `FourBody/PhysicalCertificate.lean` 把 $G(2\chi-E+\varepsilon)G$ 的 PSD 作为独立声明 `source_physical_four_body_certificates`，`FiniteFlux/` 931 文件 55080 行全部在做这 23 条（LDL 分解数据、批量计算文件按 Batch 编号铺开）。`[推测]` 规模差异本身就是返工证据：每个 $D$ 都得 `decide +kernel` 逐位算，`Row*`、`ComputeRow*Batch*` 的文件命名暴露了它是一批一批生成出来核对过的。路线 C：把 $\mathcal R_D$ 扩到偶 $r$：$\bigwedge^2$ 的分解只给奇 $r$，耦合规则不成立；副本矩阵白翻倍，`FiniteFlux` 按 $d^3$ 再炸一轮。

## 14 lem:compression：有核 Gram 的合法换乘

`05` 引理（逐字）：

> Let $W$ be a linear map between finite-dimensional Hilbert spaces, $G=W^\dagger W$, and let $C$ be self-adjoint on the domain of $W$. Then
> \[ GCG\ge0\quad\Longleftrightarrow\quad WCW^\dagger\ge0. \]
> On $\FF_{\mathrm{loc}}$, for any fixed finite collection $A_b=c_kc_jB(v_p^*)$ with $0\le p\le23$ and $0\le j,k\le24$,
> \[ \sum_b\norm{A_b\psi}^2\le C_0\ip\psi{h_*\psi},\qquad h_*:=\sum_{p=0}^{23}B(v_p^*)^\dagger B(v_p^*), \]

`[补]` 等价性推导：$\langle x,GCGx\rangle=\langle Gx,C\,Gx\rangle$ 且 $\ran G=\ran W^\dagger$（$\ker G=\ker W$，故两像同为 $(\ker W)^\perp$）；反向对 $y=W^\dagger a$ 有 $\langle y,Cy\rangle=\langle a,WCW^\dagger a\rangle$。两个陈述都在说"$C$ 的二次型在 $\ran W^\dagger$ 上非负"，证完。这条等价是把"有核的极限 Gram 矩阵"合法换成"作用在像上的算子"的枢纽：证书在 $G_D$ 一侧（有理算术可判定），使用在 $W_D^*$ 一侧（算子正性），中间靠它换乘。`[补]` 第二条估计：$\|c_kc_jB(v_p^*)\psi\|\le\|B(v_p^*)\psi\|$（$\|c_j\|\le1$），求和后每个配对指标 $p$ 至多被 $C_0$ 个三元组 $(p,j,k)$ 使用，"one may take $C_0$ to be the largest multiplicity of a pair label $p$"。$A_b$ 允许 $j=k$，此时 $c_kc_j=0$，无害。

前置构造里的两个硬数字（`05` 逐字）：$\FF_{\mathrm{loc}}$ 取 $\mathbb C^{25}$ 的外代数，识别要求 $Q\ge24$；理由：eq:pairstar 的支撑 $i+j=p+1$ 在 $p\le23$ 时需要标号至多 $23$，四体收缩再留一格余量，模式集取到 $24$（25 个）。`[补]` 这两个数（24、25）与模式盒 $(0..8)$、证书数 $D\le23$ 是一根绳上的：局部模式集扩到 30 则证书升到 $D\le29$，`FiniteFlux` 规模翻倍以上。

`[推测]` 失败路线 / 形式化落后证据一条：`Lean:` `Operators/CollectionAnnihilatorBound.lean` 的 `collection_limit_annihilator_bound` 用的 $C_0$ 是整个指标集基数 `Fintype.card I`，比论文的"最大配对重数"更粗；粗界数值上仍够用（$C_0$ 只乘在 $\rho_Q$ 上、$\rho_Q\to0$ 不改变极限），但这是形式化落后于论文的客观痕迹。`limitPairWindow`/`sourcePairWindow` 把"24 个模式"固化成窗口常量，与 tex 的 $p\le23$ 一致。

## 15 lem:transfer：$\Delta_Q$ 换元，全推导与方向敏感

引理（`05`，逐字）：

> For $Q\ge24$ and $1\le D\le23$, put
> \[ C_D^Q=(d_D/d_a)\chi-E_D^Q+\eps I,\qquad h_Q=\sum_{p=0}^{23}B_p^\dagger B_p. \]
> Assuming \eqref{eq:4certificate}, there is a scalar $\rho_Q\ge0$, independent of $D$ and tending to zero as $Q\to\infty$, such that
> \[ \sum_{r,s\in\mathcal R_D}(C_D^Q)_{rs}B(w_{Dr}^Q)^\dagger B(w_{Ds}^Q)\ge-\rho_Qh_Q \]
> on the entire Fock space $\FF_Q$.

证明分块，我按块复述并补中间步骤。

块 1 "An exact change of variables."：定义正对角算子
$$\Delta_Q\ket A=\Big(\prod_{x\in A}d_Q(x)\Big)\ket A,\qquad d_Q(x)=\sqrt{(Q)_x/Q^x}.$$
`[补]` $0<\Delta_Q\le I$ 因为 $(Q)_x/Q^x=\prod_{t=0}^{x-1}(1-t/Q)\le1$。设计核心："This local Fock space is fixed as $Q$ varies"，于是 $\Delta_Q,\Delta_Q^{-1}$ 按范数趋于 $I$，把全部 $Q$ 依赖关进一个有限维盒子。eq:pair 与 eq:pairstar 逐项比较给
$$v_p(x,y)=r_p(Q)d_Q(x)d_Q(y)v_p^*(x,y),\qquad r_p(Q)=\sqrt{(2Q)^p/(2Q-2)_p}\ge1,$$
`[补]` $r_p\ge1$ 的验证：$(2Q)^p/(2Q-2)_p=\prod_{t=0}^{p-1}\frac{2Q}{2Q-2-t}\ge1$，每项分母不超过 $2Q$；$p=0$ 时 $r_0=1$。在基楔上逐个核对被移除标号的根式因子，得两条精确恒等式：
$$B_p=r_p(Q)\Delta_Q^{-1}B(v_p^*)\Delta_Q,\qquad B(v_p\wedge e_j\wedge e_k)=\frac{r_p(Q)}{d_Q(j)d_Q(k)}\Delta_Q^{-1}B(v_p^*\wedge e_j\wedge e_k)\Delta_Q.$$
"These are identities on the local Fock space, with the inverse diagonal acting on the output particle sector. Repeated removed labels make both sides zero."（这句是防抬杠：重复标号时两侧同为 0，$\Delta_Q^{-1}$ 不涉及。）推出能量传送不等式 $\Delta_Qh_*\Delta_Q\le h_Q$：从第一条解出 $B(v_p^*)\Delta_Q=r_p^{-1}\Delta_QB_p$，比较 $\langle\phi,h_*\phi\rangle$ 与 $\langle\Delta_Q\phi,h_Q\Delta_Q\phi\rangle$ 时用 $r_p^{-1}\le1$ 与 $\|\Delta_Q\|\le1$。`[补]` 方向敏感点：必须 $r_p\ge1$ 才给 $\le$；$r_p$ 定义里分子分母若写反（$(2Q-2)_p/(2Q)^p$），这步反号，整条引理失效。所以 $r_p$ 的分子是 $(2Q)^p$、分母是 $(2Q-2)_p$ 不是排版随意。

块 2 "The error is controlled by pair energy."：固定 $D$，指标 $b=(p,j,k)$、$p+j+k=D$、$j<k$；$A_b=B(v_p^*\wedge e_j\wedge e_k)$，$\beta^Q_{rb}=S_r^Q(D,D;p,j,k)\frac{r_p(Q)}{d_Q(j)d_Q(k)}$，则 $B(w_{Dr}^Q)=\Delta_Q^{-1}(\sum_b\beta^Q_{rb}A_b)\Delta_Q$。$\beta^Q\to\beta^*=S$（$r_p(Q)\to1$、$d_Q\to1$、$S^Q\to S$），故 $M_Q=(\beta^Q)^TC_D^Q\beta^Q\to M_*=(\beta^*)^T(2\chi-E_D+\varepsilon I)\beta^*$（用到 $d_D/d_a\to2$）。待估计的二次型写成 $\Delta_Q\big(\sum_{b,c}(M_Q)_{bc}A_b^\dagger\Delta_Q^{-2}A_c\big)\Delta_Q$。极限表达式
$$\sum_{b,c}(M_*)_{bc}A_b^\dagger A_c=\sum_{r,s}(2\chi-E_D+\varepsilon I)_{rs}B(w_{Dr}^*)^\dagger B(w_{Ds}^*)\ge0,$$
右端正性是 lem:compression（证书 + $W_D^*$ 的列）再经 $\mathcal L_4$ 保正的翻译。论文紧接一句极其重要的辩护（逐字）："For clarity, the perturbation estimate does not require $M_*\ge0$." `[补]` 含义：需要的是 $A(M_*)A^\dagger$ 型算子的正性，$M_*$ 本身可以带负特征值，因为 $A_b$ 的像线性相关（加楔相关的体现）。若误以为要 $M_*\ge0$，就得对 $2\chi-E_D+\varepsilon I$ 开平方根，回到需要 $G_D$ 可逆的死路。误差项 $(R_Q)_{bc}=(M_Q)_{bc}\Delta_Q^{-2}-(M_*)_{bc}I$ 放在每个 $b$ 一份 $\FF_{\mathrm{loc}}$ 的 Hilbert 直和上（"$\Delta_Q^{-2}$ acts on the output of $A_c$, hence on the sector with four fewer particles"），$\|R_Q\|\to0$ 全靠指标集与局部空间都固定。于是 $|\sum_{b,c}\langle A_b\phi,(R_Q)_{bc}A_c\phi\rangle|\le\|R_Q\|\sum_b\|A_b\phi\|^2\le C_0\|R_Q\|\langle\phi,h_*\phi\rangle$。取 $\phi=\Delta_Q\psi$、用 $\Delta_Qh_*\Delta_Q\le h_Q$ 得局部结论系数 $\rho_Q'=C_0\|R_Q\|$；对 $D=1..23$ 取最大得公共 $\rho_Q$（"independent of $D$" 靠的就是只有 23 个值）。

块 3 "Additional particles are spectators."：25 个局部模式排在其它模式之前，等距把"局部楔 $\otimes$ 旁观楔"映到有序乘积；该识别下 $c_j$（$j\le24$）等于局部消灭 $\otimes I$，逐字关键句："The fermionic parity factor belongs to annihilators in the later spectator modes, which do not occur here." 于是局部不等式张量化即得 $\FF_Q$ 上同 $\rho_Q$ 的不等式，与外部占据数无关。这就是"阈值与粒子数无关"的物理实现处，也是 figure 第三格的內容。

`[推测]` 候选失败路线三条。路线 A："投影算子谱连续性传递正性"：`05` 开篇第一句直接否定（"their positivity cannot be transferred by assuming that their ranges vary continuously. Instead, we compare the annihilators themselves."）。这是全文唯一被明文否决的方法，`[推测]` 几乎肯定是真实走过的弯路。路线 B：让 $\Delta_Q$ 依赖 $D$ 或粒子数：文本证据是两处"fixed"（"This local Fock space is fixed as $Q$ varies."、"since both its index set and the local Fock space are fixed"）；盒子随 $Q$ 增长则逐点收敛给不了范数收敛，$\|R_Q\|\to0$ 断供。路线 C：`[补]` 估 $R_Q$ 时想把 $\Delta_Q^{-2}$ 用 $\|\Delta_Q\|\le1$ 直接吞掉：方向反了（$\Delta^{-2}\ge I$），必须拆成"矩阵元差 + $\Delta_Q^{-2}-I$"两块各自趋零，后者靠 $d_Q(x)\to1$（Lean `Pair/FactorLimit.lean` 的 `modeFactor_tendsto`）。`Lean:` `FourBody/UniformTransfer.lean` 的 `source_fourBody_uniform_transfer`（`hQ : 24 ≤ Q`，结论带 `fourBodyRho D Q`，形式即 `... ≥ -rho * sourceFockEnergy Q x`，相对能量界，并非范数界）与 `uniformFourBodyRho := Σ D ∈ Finset.range 24, fourBodyRho D Q`（"取最大"写成 24 项求和，比论文多一个 0 项，无害）；`Exterior/Scaling.lean`、`Exterior/OccupationDiagonal.lean` 的 `orbitalScaling`/`exteriorScaling`/`annihilate_scaling`/`occupationBasis` 是 $\Delta_Q$ 的形式化；`Pair/Conjugation.lean` 的 `modeFactor Q x := √((Q).descFactorial x / Q^x)` 与 `pairFactor Q p := √((2Q)^p/(2Q−2)_p)`（= $r_p(Q)$）分别对应 $d_Q(x)$ 与 $r_p(Q)$。

## 16 prop:A4：Bessel 一次付清，$1222$ 对 $10946$ 的分岔

命题（`05`，逐字）：

> For the coefficients in Appendix~\ref{app:certificate},
> \[ A_4\le\LL_4(W_4W_4^\dagger)+(1222\eps+o(1))H,\qquad Q\to\infty, \]
> uniformly on $\FF_Q$.

前置说明（逐字）："The allowance $\eps I$ in the certificate must also be paid for in pair energy. Here it is useful to sum over the orthonormal highest vectors *before* estimating their wedges. Bessel's inequality then avoids an extra factor equal to the number of spin copies." 这两句是本篇 budget 上最大的一笔节约的操作说明。

证明我补全成四步。

其一，把"目标减 $A_4$ 加余量"写成旋转平均。Haar 平均矩阵单元 $|D,D;r\rangle_Q\langle D,D;s|_Q$ 给"副本矩阵单元 $\otimes$ 自旋单位、除以 $d_D$"（第 9 节的规则），于是保留块上
$$d_a\sum_{D=1}^{23}\int\sum_{r,s}(C_D^Q)_{rs}B(w_{Dr}^Q(g))^\dagger B(w_{Ds}^Q(g))\,dg$$
就是目标 $-$ 四体比较 $+\varepsilon$ 余量。lem:transfer 对每个旋转 $g$ 的共轭版本给出下界 $-\rho_Q\,d_a\sum_D\int h_Q(g)dg$，而恒等式
$$d_a\int h_Q(g)\,dg=24H$$
把右端换成 $-o(1)H$。`[补]` 这条恒等式的簿记：$h_Q$ 有 24 项（$p=0,\dots,23$），每项 $B_p^\dagger B_p$ 旋转平均给 $\mathcal L_2(\Pi_{V_Q})/d_a=H/d_a$（每个 $v_p$ 是 $V_Q$ 中一个单位向量，rank-one 平均给 $I/d_a$ 的压缩），乘前面的 $d_a$ 每项贡献 $H$，24 项合计 $24H$。"The number of retained blocks is fixed, so this error remains uniform in particle number."：23 个块乘与 $N$ 无关的 $\rho_Q$，仍是 $o(1)$。

其二，Bessel。固定 $D$，$|D,D;r\rangle_Q=\sum_{b}S^Q_{rb}v_p\otimes(e_j\wedge e_k)$（$b=(p,j,k)$，$p+j+k=D$，$j<k$）。左端最高向量彼此正交（不同 $r$ 属于第二配对因子的不同自旋直和项），右端未耦合向量正交，故 $S^Q(S^Q)^T=I$。把 $S^Q\otimes I$ 作用在 Hilbert 值向量 $(c_kc_jB_p\psi)_b$ 上：
$$\sum_{r\in\mathcal R_D}\|B(w_{Dr}^Q)\psi\|^2\le\sum_{p+j+k=D,\,j<k}\|c_kc_jB_p\psi\|^2\le\sum_b\|B_p\psi\|^2.$$
`[补]` 关键一句论文替你点破："This uses orthogonality before wedging; the vectors $w_{Dr}^Q$ themselves need not be orthogonal." 加楔之后只能要 $\le$（Bessel），等号（Parseval）不可用。这正是第 13 节"从不假设独立性"的纪律在预算侧的兑现。

其三，计数。三重数 $n_D=\sum_{n=1}^D\lceil n/2\rceil=\lfloor(D+1)^2/4\rfloor$。`[补]` 我核对过 $\{j<k,\ j+k=n\}$ 的解数是 $\lfloor n/2\rfloor$ ，并非 $\lceil n/2\rceil$，但论文把 $n$ 从 1 到 $D$ 求和配 $\lceil n/2\rceil$（对应 $p$ 从 $D$ 到 0 时第二配对亏缺的另一种指标化），两种写法逐 $D$ 相等：我程序验证 $\sum_{n=1}^D\lceil n/2\rceil=\lfloor(D+1)^2/4\rfloor$ 对一切 $D$ 成立且 $\sum_{D=1}^{23}\lfloor(D+1)^2/4\rfloor=1222$。拆分账目：$D$ 奇 $n_D=m^2$（$m=(D+1)/2$，$D=1,3,\dots,23$ 给 $m=1..12$，$\sum m^2=650$）；$D$ 偶 $n_D=m(m+1)$（$m=D/2$，$D=2,\dots,22$ 给 $m=1..11$，$\sum m(m+1)=572$）；$650+572=1222$ ✓，与 `05` 证明末尾 $\eps\big(\sum_{m=1}^{12}m^2+\sum_{m=1}^{11}m(m+1)\big)H=1222\eps H$ 逐字一致。

其四，旋转后每个配对范数贡献 $\langle\psi,H\psi\rangle/d_a$、乘回 $d_a$，余量总账 $\varepsilon\sum_Dn_DH=1222\varepsilon H$。末句 "The discarded target spin blocks are positive." 确认丢 $D\notin[1,23]$ 不破坏方向（normal4 是负二次型，$A_4=-\mathcal L_4(\text{正})$，未处理块只会让 $A_4$ 更小）。

$1222$ 对 $10946$：本篇最重要的可机检分岔（`[补]` 数值我全部复算）。若不用 Bessel ，是逐副本放缩，每块多出因子 $|\mathcal R_D|=\lceil D/2\rceil$，余量变 $\varepsilon\sum_D\lceil D/2\rceil n_D=10946\varepsilon=0.032838$。终盘变 $1-0.93527408868499-0.014892578125-0.032838=0.0169953\dots$，即 $\gamma=1699533319001/10^{14}\approx0.016995$。`[补]` 这个分子我又按同分母账算了一遍：$10^{14}-93527408868499-14892578125000-10946\cdot3\cdot10^{8}=1699533319001$ ✓ 逐位对上。**粗路线仍给出正的 $\gamma$，但 $0.016995<1/25=0.04$，Laughlin $1/25$ 推论当场死亡**；Fock 不等式只剩一个不可读的 $1/59$ 型常数。`[推测]` 我几乎肯定作者先走的是粗路线：Lean 里两条路线都活着，`FourBody/TotalAllowance.lean`（43 行）显式命名 `source_allowance_count_fin ... = 10946` 与 `physical_fourBody_total_haar_allowance`，`Operators/Certificate.lean` 有 `allowance_count = 10946`、`final_margin : ... = 1699533319001/10^14`、`final_margin_gt : 1/100 < 1699533319001/10^14`，`Operators/PhysicalFockGap.lean` 的 `physical_fock_budget_eventually` 用的是 10946；之后才补 `FourBody/BesselAllowance.lean`（186 行，第 124 行 `(∑ d : Fin 23, (d.val+2)^2/4) = 1222 := by decide +kernel`，第 143 行 `retainedFourAllowance Q hQ x ≤ 1222*sourceFockEnergy Q x`）。旧文件没删，失败路线在仓库里留下了化石。而 `Fock/SharpGap.lean` 的 `sharp_scalar_budget (1222)` 与 `gammaStar := 4616733319001/10^14` 才是论文正文的 1222 路线。

`[推测]` 候选失败路线三条。路线 A：先估每个 $w_{Dr}^Q$ 的楔再求和（10946，如上，Lean 文件为证）。路线 B：用 Parseval 等式替代 Bessel：需要 $\{w_{Dr}^Q\}$ 正交，论文两处明说不能假设；第 13 节偶 $D$ 的零列就是反例。路线 C：`[补]` 把 $d_a\int h_Q(g)dg$ 的 24 错算成 $2Q-1$ 或 25：24 来自 $h_Q$ 的项数（$p\le23$），与 $d_a$ 抵消后剩 24；写错则 prop:A4 的 $o(1)H$ 系数整体错位，虽然仍是 $o(1)$（$\rho_Q$ 吸收常数），但 `BesselAllowance` 那类 `decide` 行就对不上了。`Lean:` 见上；另 `FourBody/HaarAllowance.lean`、`FourBody/CopyFormAllowance.lean` 是余量簿记的分片。

## 17 lem:tail：$\delta_Q\to61/4096$，逐项求和与 $Q\ge4$ 的真正职责

引理（`06`，逐字）：

> For sufficiently large $Q$,
> \[ \LL_3\left(W_3\sum_{z=16}^Qq_z(Q)R_{3,z}W_3^\dagger\right)\ge-\delta_QH, \]
> \[ \delta_Q=\sum_{\substack{17\le z\le Q\\z\text{ odd}}}\frac{d_{3,z}}{d_a}|q_z(Q)|(z+1),\qquad \delta_Q\longrightarrow\frac{61}{4096}. \]

`[补]` 证明补全五段。其一符号分析："$16\le z\le Q$ 时 eq:q 括号至少 $2z-2$"，因为 $z\le Q$ 给 $z(z+1)/Q\le z+1$，于是括号 $\ge3z-1-(z+1)=2z-2>0$；所以 $q_z=(-1)^z\cdot$正量，奇 $z$ 负、偶 $z$ 正。偶 $z$ 块丢弃只会加强不等式（方向正确），求和从 17 起只跑奇数。其二逐块估计：$R_{3,z}$ 的归一最高向量 $\xi_z=\sum_{p=0}^zs_pv_p\otimes e_{z-p}$，加楔提升后二次型为 $\|\sum_ps_pc_{z-p}(g)B_p(g)\psi\|^2\le\sum_{p=0}^z\|B_p(g)\psi\|^2$（Cauchy–Schwarz 配 $\sum_p|s_p|^2=1$ 与 $\|c_j\|\le1$）；$(z+1)$ 就是项数。"Its orbit resolves that spin projector with factor $d_{3,z}$"：轨道平均表示自旋投影时出 $1/d_{3,z}$，与整体 $d_a$ 合成 $\frac{d_{3,z}}{d_a}\cdot\frac1{d_a}$ 一侧的净权重（与第 12 节 $\frac{d_a}{d_{3,z}}e_z^Q$ 是同一簿记的倒数侧）。其三平均：$\|B_p(g)\psi\|^2$ 对 $g$ 平均给 $\langle\psi,H\psi\rangle/d_a$，$z+1$ 项合并出 eq:delta。其四控制收敛：$Q\ge4$ 时 $(Q)_z/(2Q-2)_z$ 的逐因子比值 $\frac{Q-t}{2Q-2-t}$ 对 $t$ 非增，且 $\frac{Q}{2Q-2}\le\frac23$ 当且仅当 $3Q\le4Q-4$ 即 $Q\ge4$。**这就是 $Q\ge4$ 这个看似武断阈值的唯一职责**：给 $(Q)_z/(2Q-2)_z\le(2/3)^z$ 与 $d_{3,z}/d_a\le2$（$3Q-1-2z\le3Q-1\le4Q-2$ 于 $Q\ge1$）背书；再配 $|q_z|\le3z-1$，和式（$z>Q$ 补零）被 $6z(z+1)(2/3)^z$ 控制，可求和。其五极限计算，我逐步复核并逐位对上：
$$\lim\delta_Q=\frac32\sum_{z=17,19,\dots}(3z-1)(z+1)2^{-z}.$$
写 $z=17+2m$：$(3z-1)(z+1)=(50+6m)(18+2m)=900+208m+12m^2$，$2^{-z}=2^{-17}4^{-m}$；三个几何级数 $\sum4^{-m}=\frac43$、$\sum m4^{-m}=\frac{x}{(1-x)^2}\big|_{1/4}=\frac49$、$\sum m^24^{-m}=\frac{x(1+x)}{(1-x)^3}\big|_{1/4}=\frac{20}{27}$。合成 $\frac32\cdot2^{-17}\big(1200+\frac{832}9+\frac{80}9\big)=\frac32\cdot2^{-17}\cdot\frac{3904}3=1952\cdot2^{-17}=\frac{61}{4096}$ ✓。

敏感性账（`[补]`）：$61/4096=0.014892578125$ 吃掉终盘余量（$1-\eta=0.0647259$）的约 $23\%$，是 $\gamma_*$ 本身的约 $32\%$。若三体证书盒从 15 缩到 11（尾巴从 13 起），多出 $z=13,15$ 两块 $\sim\frac32\cdot(3\cdot13-1)\cdot14\cdot2^{-13}+\frac32\cdot44\cdot16\cdot2^{-15}\approx5.1\cdot10^{-3}+1.7\cdot10^{-3}\approx0.0068$，$\gamma_*$ 掉到 $0.0394$，**跌破 $1/25$**。这就是 $e_z$ 表必须做到 $z=15$ 的定量理由：16 之后每一块都是钱。

`[推测]` 候选失败路线三条。路线 A：把 $\sum_{z=16}^Q$ 当固定有限块数处理：项数随 $Q$ 增长，必须靠 $(2/3)^z$ 一致可和（文本证据就是那句 "Dominated convergence and \eqref{eq:qlimit} give..."）。路线 B：用粗界 $|q_z|\le Cz$ 不求极限值：$\delta_Q$ 只增不减，$\gamma_*$ 缩水；文本证据是终盘里写的是精确的 $61/4096$。路线 C：CS 时配 $(\sum|s_p|)^2$ ，并非 $\sum|s_p|^2$：多出 $z$ 因子，级数仍收敛但常数变大。`Lean:` `Asymptotics/Basic.lean` 的 `tail_series_value` 我读到的分解与 tex 不同（按 876/172m/24·C(m+2,2) 拆，等价给 61/4096）；`Asymptotics/Convergence.lean` 有 `odd_tail_index_iff`（"$z$ 奇且 $17\le z\le Q$"）、`tailWeight_tendsto`、`deltaFormula_tendsto`；`Asymptotics/Bound.lean` 有 `fallingRatio`/`fallingRatio_le_geometric`（即 $(2/3)^z$ 控制）与 `tail_bracket_bounds`（括号 $\ge2z-2$）。`[推测]` 两套求和分解同时存在，说明作者换过一次算法而保留了旧证明，与 `TotalAllowance` 化石同理。

## 18 终盘预算：装配账与三个不可合并的 $o(1)$

thm:fock 的证明全文只有半页（`06`，逐字）：

> Combine Lemma~\ref{lem:square}, \eqref{eq:Adecomp}, \eqref{eq:A3bound}, Proposition~\ref{prop:A4}, and Lemma~\ref{lem:tail}. They give
> \[ H^2\ge d_a\int K(g)\,dg+(1-\eta-\delta_Q-1222\eps-o(1))H. \]
> The integral is positive. ...
> \[ 1-\frac{93527408868499}{10^{14}}-\frac{61}{4096}-1222\frac3{10^6}=\gamma_*=\frac{4616733319001}{10^{14}}>\frac1{25}. \]
> The limit in \eqref{eq:finalmargin} is $\gamma_*$. For each fixed $0<\gamma<\gamma_*$, the coefficient therefore exceeds $\gamma$ for all sufficiently large $Q$.

`[补]` 完整装配账。lem:square 给 $H^2=H+\mathcal T_3+\mathcal T_4$，其中 $\mathcal T_3=\mathcal L_3(W_3\sum_{z=0}^Qq_zR_{3,z}W_3^\dagger)$（代入 lem:q）、$\mathcal T_4=\mathcal L_4(W_4W_4^\dagger)$；eq:Adecomp 给 $\mathcal K_Q=\eta H+A_3+A_4$。相减：
$$H^2-\mathcal K_Q=(1-\eta)H+(\mathcal T_3-A_3)+(\mathcal T_4-A_4).$$
$\mathcal T_3-A_3=\mathcal L_3\big(W_3[\sum_{z=0}^{15}(q_z-\frac{d_a}{d_{3,z}}e_z^Q)R_{3,z}+\sum_{z=16}^Qq_zR_{3,z}]W_3^\dagger\big)$：第一段由 13 条严格不等式 eq:3certificate 加收敛（$\frac{d_{3,z}}{d_a}\to\frac32$、$e_z^Q\to e_z$）在充分大 $Q$ 上逐块非负，整体丢弃；第二段由 lem:tail $\ge-\delta_QH$。$\mathcal T_4-A_4\ge-(1222\varepsilon+o(1))H$ 由 prop:A4。最后丢弃 $\mathcal K_Q\ge0$。

**丢掉 $\mathcal K_Q$ 这个动作的形状后果**（`[补]`，素材里我最满意的一条洞察）：因为比较算子是正算子之和、被整体丢弃，并非并入右端，主不等式的形状必然只能是 $H^2\ge\gamma H$，不带 "$+\text{something}$" 尾巴；换来的是 $\mathbb K_Q$ 的二/三/四体部分可以各自自由地匹配 $H^2$ 的对应部分，终盘只剩标量预算、零交叉项。`[推测]` 这一步多半是想通过"先丢再配"来回避 $A_3,A_4$ 自身负性带来的下界难题：证书只做过上界比较，若保留 $\mathcal K_Q$ 就必须给负二次型找下界，全篇没有这类工具。

三个不可合并的 $o(1)$（`[补]`）：(i) $E_D^Q\to E_D$、$\beta^Q\to\beta^*$ 与 $\Delta_Q^{-2}\to I$，经 lem:transfer 折成 $\rho_Q$，再经 prop:A4 的 $23$ 块与 $d_a\int h_Q=24H$ 摊成 $o(1)H$；(ii) $e_z^Q\to e_z$ 与 $d_{3,z}/d_a\to\frac32$，靠 13 条严格不等式的正间隙（最薄 $2.49\cdot10^{-4}$）在有限 $Q$ 内容忍；(iii) $d_D/d_a\to2$。三者都不含粒子数，"Every convergence threshold is independent of particle number" 逐字兑现。

"The limit in \eqref{eq:finalmargin} is $\gamma_*$"：$\gamma_*$ 由极限定义，并非选取，因此 $\gamma$ 必须严格小于它，开区间陈述（第 1 节措辞条目）在此闭环；`01` 也提前声明 "The proof does not give an explicit flux threshold or the endpoint coefficient $\gamma_*$ on finite spheres."。我的精确分数核对：$10^{14}-93527408868499-14892578125000-366600000000=4616733319001$ ✓，$0.04616733319001>0.04$ ✓，余量 $0.006167$。

`[推测]` 候选失败路线两条。路线 A：保留 $\mathcal K_Q$ 以改进 $\gamma_*$：见上，不可行（负二次型无下界工具）。路线 B：把 $\eta$、$\delta_Q$、$1222\varepsilon$ 联合优化（例如让 $\varepsilon$ 参与 $\eta$ 的最小化再一起搜）：文本证据是 `08` 的 Remark 把证书定性为 "fixed spin-matrix inequalities"，数据是给定的（rows.txt 是输入），验证只负责"过账"。`[推测]` 数据产自外部数值搜索，论文只承担可机检的验证义务；Remark 首句 "The data above certify fixed spin-matrix inequalities. The positive comparison operator is a sum of squares by construction. No many-particle finite-size spectrum, numerical extrapolation, or assumed plasma property enters the argument." 我读成对"你的常数哪来的"这一必问的预先答复：来源是搜索，正当性是完全有限验证。

## 19 lem:kernel：七步整除链与"精确磁通"的来源

引理（`06`，逐字）：

> For $N\ge2$ and $Q=3(N-1)$, the kernel of $H_{N,Q}$ is the line spanned by $\Psi_{\mathrm L,N}$.

结果本身是已知的（Haldane 1983 p.606 Equations (6)--(7)），论文自报的贡献口径（逐字）："The elementary divisibility proof also fixes the exact flux at which the kernel is a line." 链条七步，我按原文逐步走：

1. 实现：$U_Q$ 视作 $(u,v)$ 的 $Q$ 次齐次多项式，$b_{ij}=u_iv_j-u_jv_i$；配对自旋 $Q-r$ 直和项的最高多项式 $b_{ij}^ru_i^{Q-r}u_j^{Q-r}$。
2. $b_{ij}$ 在配对同时旋转下不变，故该直和项的每个向量都被 $b_{ij}^r$ 整除（最高多项式乘 $SU(2)$ 下降保持 $b^r$ 因子）。
3. 交换该对有parity $(-1)^r$，反对称要求 $r$ 奇。
4. $H_{N,Q}\Psi=0$ 给 $0=\sum_{i<j}\|P^{(1)}_{ij}\Psi\|^2$，每对投影都被消灭；在其它粒子变量的单项式上展开，剩余配对通道全是奇 $r\ge3$（$r=1$ 恰是被消灭的通道），故每对 $b_{ij}^3\mid\Psi$。
5. 每个 $b_{ij}=v_ju_i-u_jv_i$ 作为 $u_i$ 的多项式本原（$v_j$ 与 $u_jv_i$ 互素）且在其余变量分式域上一次性，Gauss 引理给不可约；不同无序对的括号不相伴，故两两互素。
6. 唯一因子分解：$\prod_{i<j}b_{ij}^3\mid\Psi$。乘积对每个粒子自旋变量的次数 $3(N-1)=Q$，度数耗尽，商为常数。**等式 $3(N-1)=Q$ 只在 Laughlin 磁通成立，这就是 "exact flux" 的全部来源**。
7. 反向：$\Psi_{\mathrm L,N}$ 反对称；$b_{ij}^3$ 因子给每自旋留 $Q-3$ 次，配对最大总自旋 $Q-3$；"Multiplication by the invariant bracket cannot introduce spin $Q-1$"，于是每个 $P^{(1)}_{ij}$ 消灭它。

指标与幂的机械理由：$r\ge3$ ，并非 $r\ge1$，因为 $r=1$ 是被投影的相互作用通道；指数 3 就是 $1/\nu$（填充 $1/3$），`[补]` 换成任何其它填充都要重写第 6 步的度数账。

`Lean:` `Polynomial/PhysicalLaughlinKernel.lean` 的 `physical_Laughlin_kernel`（iff 形式，正是第 7 步反向的形态）与 `laughlinVector_zero_energy`、`physical_Laughlin_ground_line`；支撑文件 `BracketCoprime.lean`（第 5 步）、`BracketIrreducible.lean`（Gauss）、`BracketProductDivisibility.lean`（第 6 步）、`LaughlinAntisymmetry.lean`、`LaughlinDegree.lean`、`LaughlinMultidegree.lean`（度数耗尽）、`Operators/GlobalPairCube.lean`、`Operators/PhysicalPairKernel.lean`。`Polynomial` 模块 17 文件 1049 行，七个专门文件对七步链，`LaughlinMultidegree.lean` 的存在说明"multidegree 耗尽"在 Lean 里不平凡。`Model.lean` 的 `monomialExponent`（`if ib.2 then (a ib.1).val else Q-(a ib.1).val`）就是把 $b_{ij}^ru_i^{Q-r}u_j^{Q-r}$ 的指数表写成 `Fin N × Bool` 变量的机器版本。`Charge/LaughlinGround.lean:8` 的 `haldaneKernelInput` 由 `physical_Laughlin_kernel` 一行导出，喂给第 20 节的电荷隙与 `sharpMainTarget_of_haldane`。

`[推测]` 候选失败路线三条。路线 A：维数计数加"已知 Laughlin 态在核里"：这是 Haldane 原文风格，但它给不出"exact flux"，$Q$ 略大时核可能变大，度数法不控制；文本证据是本节开头那句自报口径。路线 B：跳过 $(-1)^r$ 奇偶论证：无法排除 $r=2,4$ 通道，$b^3$ 整除不成立。路线 C：从 $\prod b_{ij}$（一次幂）归纳再升幂：`[推测]` 指数 3 与 $Q=3(N-1)$ 的互相锁定是度数耗尽成立的唯一组合，任何中间幂次都两边不靠。

## 20 thm:main 的证明与电荷/中性隙：最后两步与最强的一次借力

推论证明（`06`，逐字）：

> Apply Theorem~\ref{thm:fock} with $\gamma=1/25$. On each particle sector, the spectral theorem gives
> \[ H_{N,Q}\ge\frac1{25}\bigl(I-P_{\ker H_{N,Q}}\bigr) \]
> once $Q$ exceeds the common threshold. Take $Q=3(N-1)$ and apply Lemma~\ref{lem:kernel}. Choosing $N_0$ so that $3(N_0-1)$ exceeds the threshold proves the claim.

`[补]` 三处机械理由：取 $\gamma=1/25$ 进 thm:fock 合法仅因 $1/25<\gamma_*$（`01` 定义 $\gamma_*$ 时就挂了 $>\frac1{25}$）；谱定理把 $H^2\ge\gamma H$ 翻译成 $\mathrm{spec}\,H\subset\{0\}\cup[\gamma,\infty)$ 再写成 $H\ge\gamma(I-P_{\ker H})$；lem:kernel 把 $P_{\ker H_{N,Q}}$ 换成 $P_{\mathrm L,N}$。$Q_\gamma$ 与 $N$ 无关，所以 $Q=3(N-1)\ge Q_\gamma$ 即 $N\ge\lceil Q_\gamma/3\rceil+1$ 这一存在性阈值给出 $N_0$。`[推测]` 若当初坚持固定 $Q$、$N$ 增长的路线，这里就换不出 $N_0$：第 0 节量化顺序的回报兑现在此。

电荷隙推论（`06`，逐字）：

> \[ \Delta_N=E_0(N+1;Q_N)+E_0(N-1;Q_N)-2E_0(N;Q_N), \]
> satisfies \[ \Delta_N=E_0(N+1;Q_N)\ge\frac{N}{N-1}\operatorname{Gap}_N>0. \]
> In particular, \(\Delta_N\ge N/[25(N-1)]\) for \(N\ge N_0\).

引用口径（逐字）："The following comparison specializes the recursive spectral relations of Lemm, Nachtergaele, Warzel, and Young \cite[arXiv v1, Theorem~2.1(I), Lemma~2.3, and (2.10)]{LemmNachtergaeleWarzelYoung2026Recursive}." 精确到 arXiv 版本号与条目号，是"外部定理作黑箱"的最强信号。`[补]` 我逐条核验内部论证：三扇区非空因 $N+1\le\dim U_{Q_N}=3N-2$；$E_0(N;Q_N)=0$ 且基空间一维来自 lem:kernel；扇区维数大于 1 给 $\mathrm{Gap}_N>0$；$E_0(N-1;Q_N)=0$ 靠消灭算子与创造算子的反交换记账，偶粒子算子 $B_p$ 与每个 $c_j$ 交换，$\sum_j\|c_j\Psi\|^2=N\|\Psi\|^2$ 给出某个 $c_j\Psi\ne0$ 且 $B_p(c_j\Psi)=c_jB_p\Psi=0$；$N+1$ 扇区无零模靠整除论证：$\prod b^3$ 对每粒子次数 $3N>Q_N$ 矛盾，于是二阶差分坍缩成 $\Delta_N=E_0(N+1)$。递归一侧：LNWY Theorem 2.1(I) 取 $m_0=m_1=2$ 给
$$E_0(N+1)\ge\frac{N+1}{N-1}E_0(N)+\frac{N+1-\|\mathcal G_N\|}{N-1}\mathrm{Gap}_N,\qquad \mathcal G_N=P_{N+1}\Big(\sum_jc_j^\dagger P_Nc_j\Big)P_{N+1},$$
其 Lemma 2.3 给 $\|\mathcal G_N\|\le\mathrm{rank}P_N=1$；代入 $E_0(N)=0$ 得 $\ge\frac{N+1-1}{N-1}\mathrm{Gap}_N=\frac N{N-1}\mathrm{Gap}_N$ ✓。`[补]` $m_0=m_1=2$ 我按该文分层指标理解为"粒子数加减步长为 2 的递归参数"，本文献只引用结论不解释，这是对外部结果依赖最重的一处。$N/(N-1)>1$ 的因子论文刻意保留而不写成 $\ge1/25$，措辞精确到不失一格。

`[推测]` 候选失败路线三条。路线 A：自证电荷隙：`01` 承认 "a uniform bound for the full pseudopotential still requires control of the model-specific ground-space overlap matrices in those criteria"，而本文只在 $\mathrm{rank}P_N=1$ 处过关。`Lean:` `Charge/Comparison.lean` 把外部输入拆成三个 `Prop`：`LNWYRecursionInput`、`LNWYRankOneInput`、`LaughlinChargeGroundInput`，分别由 `Charge/Recursion.lean:62`、`Charge/Overlap.lean:130`、`Charge/LaughlinGround.lean` 的定理证明，再以 `charge_neutral_of_published`/`charge_uniform_of_published` 组装。命名里直接写明 of_published，黑箱身份形式化侧留档；`Charge` 模块 10 文件 1000 行全部为这半页推论服务。路线 B：把 $\frac{N}{N-1}\mathrm{Gap}_N$ 粗糙成 $1/25$：见上，论文没有这么做。路线 C：误读 $\mathrm{rank}P_N$ 为 $N$ 扇区维数：`rank P_N` 是最低本征空间投影的秩，靠 lem:kernel 才等于 1；若核更大则该界失效，电荷隙推论对唯一零模有真实依赖。

## 21 平面推论：端点在平面上反而成立（素材缺 2.21，按 07.tex 自补）

`07` 的对象：Bargmann 空间 $\mathcal B$，内积 $\|f\|^2=\frac1\pi\int_{\mathbb C}|f|^2e^{-|z|^2}d^2z$，$e_j(z)=z^j/\sqrt{j!}$；乘法 $\pi^{-1/2}e^{-|z|^2/2}$ 给出与磁场 2 的平面 LLL 的酉等价。对每对坐标 $w=(z_1-z_2)/\sqrt2$、$Z=(z_1+z_2)/\sqrt2$，$P^{(1)}$ 是相对次数一的投影、对 $Z$ 次数不加限制，$H_N^{\mathrm{pl}}=\sum_{i<j}P^{(1)}_{ij}$ 系数一。结论（逐字）：

> For every $N\ge2$, the untruncated planar Hamiltonian satisfies
> \[ (H_N^{\mathrm{pl}})^2\ge\gamma_* H_N^{\mathrm{pl}}, \]
> where $\gamma_*$ is the constant in Theorem~\ref{thm:fock}. ... The constant is independent of both particle number and total angular momentum. In particular, the case $\ell=3$ of the spectral gap conjecture in \cite[Conjecture~A.1]{Rougerie} holds, in its pair-projector normalization.

`[补]` 证明接口只有三个。接口一：$wZ^p/\sqrt{p!}$ 是相对次数一子空间的 ONB，其在正规楔基的系数 $v_p^{\mathrm{pl}}(i,j)=(i-j)\sqrt{p!/(2^pi!j!)}\mathbf1_{i+j=p+1}$ 与 eq:pairstar 逐字相同（原文 "These are exactly the limits in \eqref{eq:pairstar}."），于是 $H_N^{\mathrm{pl}}=\sum_{p\ge0}B(v_p^{\mathrm{pl}})^\dagger B(v_p^{\mathrm{pl}})$。接口二：固定 $N$ 与总度数 $L$，块 $\{0\le i_1<\dots<i_N,\ \sum i_k=L\}$ 在 $Q\ge\max\{L,N-1,2\}$ 时同时是球面上"总下降亏缺 $L$"的子空间；两个哈密顿量都保此块（配对消灭与创造的标号和相同），只有 $p+1\le L$ 的贡献存活；块是有限维的，eq:pair 到 eq:pairstar 的逐点收敛在此升级为范数收敛。接口三：对每个固定 $\gamma<\gamma_*$ 单独取 $Q\to\infty$（阈值随 $\gamma$ 走），得 $(H^{\mathrm{pl}})^2\ge\gamma H^{\mathrm{pl}}$，再 "Now let $\gamma\uparrow\gamma_*$; the cone of positive matrices is closed, so the same inequality holds at $\gamma_*$."。有限维块的闭锥论证让端点在平面成立，球面则因阈值 $Q_\gamma$ 的存在而只能开区间。最后由 $\bigwedge^N\mathcal B$ 的齐次块直和与 $0\le H_N^{\mathrm{pl}}\le\binom N2I$ 延拓到全空间；限制 $L\le 3N(N-1)/2$ 即 Conjecture A.1 的 $\ell=3$ 情形（`01` 宣布 "this proves the fermionic cubic case of the folklore spectral-gap conjecture"）。

`[推测]` 候选失败路线两条。路线 A：对平面做一致 $Q$ 阈值再取极限：每个 $(N,L)$ 块的收敛阈值依赖 $\gamma$ 与块，无法先取 $\gamma\uparrow\gamma_*$ 再取 $Q\to\infty$；论文明确写 "The limit $Q\to\infty$ is taken separately for each fixed $\gamma$, allowing the flux threshold to depend on $\gamma$."，这句防御说明作者知道顺序陷阱。路线 B：`[推测]` 顺序考古：素材 2.1 里我留过一条读法，作者很可能先拿到平面端点版（它是逐点极限加闭锥，几乎免费），再回头把球面版写成开区间，以免两个陈述互相矛盾；`07` 在 `06` 之后落笔的章节顺序与"端点归平面、开区间归球面"的分工支持这个读法。`Lean:` `Planar` 模块 4 文件 480 行，`Planar/Forms.lean:28` 的 `full_planar_endpoint` 结论带 `ENNReal.ofReal gammaStar`，由 `UniformGap.lean` 以 `planar_gap` 出口，与论文端点陈述一致。

## 22 Lean 取证：仓库规模、双路线化石与被认证的那一条（素材缺 §四，自补）

体量测量（我的 `ls`/`find`/`wc -l` 输出）：`OAI/Analysis/Laughlin/` 共 1279 个 `.lean` 文件、77130 行。分模块：

| 模块 | 文件 | 行数 | 对应论文对象 |
|---|---|---|---|
| 根目录 | 5 | 165 | `Main.lean` 入口、`Model.lean` 定义、`UniformGap.lean` 四出口、`EnergyNonnegative.lean`、`GapEstimates.lean`（转 import） |
| FiniteFlux | 931 | 55080 | `08` 四体证书 23 条（约占全库 71%） |
| FourBody | 88 | 5320 | `04` 四体比较、`05` prop:A4 |
| Spin | 54 | 3593 | `03` lem:coupling 与耦合极限 |
| Operators | 38 | 2024 | `Certificate.lean` 数据、10946 路线预算 |
| ThreeBody | 36 | 2318 | `03` lem:q、`04` $e_z$ |
| Pair | 35 | 2347 | `03` lem:pair、`05` 换元系数 |
| Fock | 26 | 1581 | `02` lem:square、`06` 终盘、SharpGap/LaughlinGap |
| Polynomial | 17 | 1049 | `06` lem:kernel 七步链 |
| Asymptotics | 15 | 958 | `06` lem:tail、$q_z$ 渐近 |
| Charge | 10 | 1000 | `06` cor:charge-neutral |
| Tensor | 10 | 664 | 楔/张量识别与约定 |
| Exterior | 10 | 551 | `05` $\Delta_Q$（`orbitalScaling`/`exteriorScaling`） |
| Planar | 4 | 480 | `07` cor:plane |

声明统计（锚定行首 grep）：`^theorem` 9864、`^def` 143、`^noncomputable\ def` 317、`^abbrev` 27、`^instance` 6、`^structure` 1，合计 10041。`^lemma` 为 0：全库没有一条 lemma，所有中间步骤都升格为 theorem 单独命名，这是"按可复用证书组织证明"的风格信号。

sorry 审计：`grep -rn sorry OAI/Analysis/Laughlin` 为空，解法侧零缺口；唯一的 `sorry` 在题目文件 `ComparatorChallenges/Laughlin.lean:62`（`theorem mainTarget_proved : MainTarget := by sorry`），那是 comparator 发的题面占位，与解法无关。`ComparatorChallenges/Laughlin.json`：`challenge_module: ComparatorChallenges.Laughlin`，`solution_module: OAI.Analysis.Laughlin.Main`，`theorem_names: ["OAI.Laughlin.mainTarget_proved"]`，`definition_names: []`，`permitted_axioms: ["propext","Quot.sound","Classical.choice"]`（无 `sorryAx`、无自定义公理），`enable_nanoda: false`。`formalization.yaml` 第 1274 至 1276 行登记同一组三元组（config / declaration / file）。

被认证目标长什么样（`Model.lean:56-59` 逐字）：

```lean
def MainTarget : Prop :=
  ∃ N₀ : ℕ, 2 ≤ N₀ ∧ ∀ N : ℕ, N₀ ≤ N →
    ∀ ψ : State N (3*(N-1)), Antisymmetric ψ →
      (1/100 : ℝ) * distanceToLaughlinSq ψ ≤ energy ψ
```

其中 `distanceToLaughlinSq ψ := sInf {∑_a ‖ψ a - c*laughlinVector N Q a‖² | c : ℂ}`（到 Laughlin 射线的欧氏距离平方），`laughlinVector` 由 `MvPolynomial` 系数取回。能量-距离形式正是"$H\ge\gamma(I-P_{\mathrm L})$"的谱定理改写，但注意：入口认证的是 $1/100$，论文口径是 $1/25$。两条路线在库内并存，我可以精确描出分岔：

10946 粗路线（喂给 comparator 的那条）：`Operators/Certificate.lean` 的 `allowance_count = 10946`、`final_margin = 1699533319001/10^14`、`final_margin_gt : 1/100 < ...`，经 `Operators/PhysicalFockGap.lean` 的 `physical_fock_budget_eventually`（预算项 `1-93527408868499/10^14-deltaFormula Q-10946*(3/10^6)-error Q`）到 `Fock/SpectralDistance.lean:47` 的 `physical_fock_kernel_distance_uniform`（结论带 `(1/100 : ℝ)`），最后 `Main.lean` 的 `mainTarget_proved` 用 `normalizedTensorExterior`/`normalizedTensorReadout` 把楔侧读回张量侧并套谱距离。

1222 锐路线（论文正文的那条）：`FourBody/BesselAllowance.lean`（186 行，`source_bessel_allowance_count_fin : (∑ d : Fin 23, (d.val+2)^2/4) = 1222 := by decide +kernel`、`retainedFourAllowance ... ≤ 1222*sourceFockEnergy`）喂 `Fock/SharpGap.lean`（114 行：`gammaStar := 4616733319001/10^14`、`gammaStar_budget` 与 `one_twenty_fifth_lt_gammaStar` 均 `norm_num`、`sharp_scalar_budget`），再喂 `Fock/LaughlinGap.lean` 的 `SharpMainTarget`（把 `MainTarget` 里的 1/100 换成 1/25）与 `sharpMainTarget_of_haldane`。有意思的是 `SharpMainTarget` 在库内确实被无条件闭合了：`Charge/LaughlinGround.lean:8` 的 `haldaneKernelInput` 由 `physical_Laughlin_kernel` 一行导出，`UniformGap.lean:15` 因此有 `sharpMainTarget_proved : SharpMainTarget := sharpMainTarget_of_haldane haldaneKernelInput`；同文件还挂出 `uniform_fock_gap`（任意 $\gamma<\gamma_*$）、`charge_neutral_gap`（走三个 of_published 输入）与 `planar_gap`。但 `formalization.yaml` 的 comparator 条目只认 `mainTarget_proved` 一条：$1/25$ 是库内证毕、未被题目口径认领。`[推测]` 这解释了素材 1.2 末句"Lean 认证的是 1/100，且 1/25 版本另有声明"：comparator 题目把 $1/100$ 写进 `MainTarget` 是因为出题时（`[推测]`）Bessel 文件尚未落位，锐化后题目没有回改，`TotalAllowance.lean` 与 `PhysicalFockGap.lean` 因此保留粗线。

"论文一句话 ↔ Lean 一个模块"标本清单（我核对过名字与结论形态）：约定句 "wedges ... norm one" ↔ `Tensor/ExteriorIsometry.lean` 的 `normalizedTensorExterior` 加 `tensorExterior_energy = (n+2)!·energy`；lem:square ↔ `Fock/NormalSquare.lean`（有序双求和形态）；lem:pair ↔ `Pair/CoefficientSquare|Normalization|Conjugation|FactorLimit`；$q_z=-1$ 三条零扇区 ↔ `ThreeBody/NullFormula.lean` 的三个独立命名；$e_z$ 定义 ↔ `ThreeBody/Basic.lean` 的 `U/X/e/limitBound` 与 `ThreeBody/TraceCertificate.lean`；$\Delta_Q$ ↔ `Exterior/Scaling.lean`/`OccupationDiagonal.lean`；lem:transfer ↔ `FourBody/UniformTransfer.lean`（结论 `≥ -rho * sourceFockEnergy`，相对能量型）；lem:tail ↔ `Asymptotics/Basic|Bound|Convergence`；证书 PSD ↔ `FourBody/PhysicalCertificate.lean` 加 `FiniteFlux/`；核唯一 ↔ `Polynomial/` 八件套；电荷隙 ↔ `Charge/`；平面 ↔ `Planar/Forms.lean`。`FiniteFlux/Positive05.lean` 我读了全文：`pivotsFive = ![56737668577815655510619653/300647710720000000000000, 0, 0]` 与我手算的 $D=5$ 的 $M_{11}$ 逐位相同、秩 1 形态对应符号串 `+00`，`ldl_five ... := by decide +kernel` 说明大分数合同验证靠内核加速器；目录里 `Row*`、`ComputeRow*Batch*`、`GramData*`、`LDLData*` 的批量命名（Row 类 50 个）是逐 $D$ 生成的计算凭证。`[推测]` FiniteFlux 占 71% 行数这一比例本身就是取证结论：论文 `08` 三页附录的工作量在机器侧放大了一个量级，人类证明与机器验证的成本比约 1:10。

## 23 常数台账：每一个数花在哪、动了会坏在哪（素材缺 §五，自补）

| 记号 | 值 | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $\gamma_*$ | $4616733319001/10^{14}=0.04616733319001$ | `01` 定义、thm:fock 开区间上限、`07` 平面端点 | 它由其余三项决定，非独立参数 |
| $1/25$ | $0.04$ | thm:main、摘要 | $\gamma_*-1/25=0.006167$ 是全部安全垫，任何预算项恶化 $0.007$ 即失守 |
| $\eta$ | $93527408868499/10^{14}$ | $A_2=\eta H$，`06` 终盘 | 增大 $0.02$ 跌破 $1/25$；减小则 rows.txt 某行 $\ell_\rho$ 变、$e_z$ 表全部重验 |
| $\ell_\rho$ 七元组 | $7181518,-112991,-4247311,3438746,-98645,-3160276,1441784$ | eq:erational、eq:Yrational 的分子 | 任一位改动即破坏某条 $m_z>0$ 或某个 $M\ge0$（余量最薄仅 $2.49\cdot10^{-4}$） |
| $\varepsilon$ | $3/10^6$ | 四体证书余量、prop:A4 | 放大 10 倍则 $1222\varepsilon=0.0367$，$\gamma_*<0$；缩小则贴脸的 $z=5,7,10$ 块与偶 $D$ 证书可能失守 |
| $61/4096$ | $0.014892578125$ | lem:tail 极限、终盘 | 由 $z\ge17$ 奇数尾巴决定；证书盒降到 11 则多出 $\sim0.0068$ 跌破 $1/25$ |
| $1222$ | $\sum_D n_D$，$650+572$ | prop:A4 余量、终盘 | 被 Bessel 保住的数；失去 Bessel 变 10946，终盘剩 $0.016995<1/25$ |
| $10946$ | $\sum_D\lceil D/2\rceil n_D$ | Lean `allowance_count`、粗路线 | 是失败路线的墓碑常数，正文不该出现 |
| $P$ | $10^7$ | eq:alphadata 的 $\alpha=a/P\times$根式 | 减小则 $a_{pj}$ 表达精度不足，$m_z$ 最薄 $2.49\cdot10^{-4}$ 存不下 |
| $n_D$ | $\lfloor(D+1)^2/4\rfloor$ | 每块三重数 | 改动即副本计数错 |
| 模式盒 | $p\le7,\ j\le8$，模式 $\le8$ | $\mathcal S_\rho$、$T\le15$、$T\le23$ | 扩盒则 `FiniteFlux` 按 $O(D^3)$ 爆；缩盒则 $\eta$ 与 13 条 $m_z$ 双输 |
| $15$ / $23$ | 三体/四体 $T$ 上限 | eq:ez 求和、$D\le23$ 证书数 | 15 与 23 是同一盒子两张脸，动一全动 |
| $Q\ge24$ | 局部模式 25 个 | `05` $\mathbb C^{25}$ 识别、$v_p^*\in\bigwedge^2\mathbb C^{25}$ | 减小则 $p\le23$ 的极限配对向量出盒 |
| $Q\ge4$ | 比值单调 | lem:tail 的 $(2/3)^z$ 控制 | $Q=3$ 时 $\frac{Q}{2Q-2}=\frac34>\frac23$，控制函数失效 |
| $24$ | $h_Q$ 项数 | `05` 恒等式 $d_a\int h_Q=24H$ | 写成 $2Q-1$ 或 25 则 prop:A4 的 `decide` 账目断链 |
| $d_a=2Q-1$ | $\dim V_Q$ | $\mathcal K_Q$ 前因子、抵消 Schur 的 $1/d_a$ | 换平均归一则 $\eta,e_z,E_D$ 全部重标 |
| $d_{3,z}=3Q-1-2z$ | 三体自旋块维数 | 权重 $\frac{d_a}{d_{3,z}}$、极限 $\frac32$ | 由张量积分解唯一确定（求和恒等式锁死） |
| $d_D=4Q-1-2D$ | 四体块维数 | $\frac{d_D}{d_a}\to2$、目标 $2\chi$ | 极限 2 变则偶 $D$ 证书全重验 |
| $u=1/\sqrt3$、$1/\sqrt2$ | 耦合极限参数 | eq:ez、eq:S | 选错 $u$ 我实测第一条 $z=2$ 就崩（$3^T$ 换 $2^T$） |
| $\sqrt3$、$\sqrt2$ | 反对称化/楔基因子 | lem:q 第 1 步、$S_r$ | 与楔归一约定联动，重排则 `ExteriorIsometry` 全链动 |
| $Q=3(N-1)$、指数 3 | 填充 $1/3$ | lem:kernel 度数耗尽、thm:main | 改填充则整除链第 6 步重写，唯一性失 |
| 13 个 $m_z$ floor | 1298313, 211317, 249, 250, 249, 250, 250, 250, 249, 250, 250, 6470, 250 | `08` 三体表 | 逐位复现过；是"数据被贴脸优化"的直接测量 |
| $D=5$ 主元 | $56737668577815655510619653/300647710720000000000000$ | eq:M 的 $LDL$、`pivotsFive` | 与符号串 `+00` 联动，一处对不上全盘假 |
| $1/100$ | Lean `MainTarget` 系数 | comparator 口径 | 是粗路线 $1699533319001/10^{14}$ 的圆整，论文无此数 |
| $C_0$ | 配对标号最大重数 | lem:compression 第二条 | 只进 $\rho_Q$ 常数因子，$o(1)$ 性质不敏感（Lean 用更粗的 `Fintype.card I` 仍过） |
| $2^{-17}$、$900+208m+12m^2$、$4/3,4/9,20/27$ | 尾巴级数分解 | `06` 的 61/4096 计算 | 任一项错则极限错，终盘随之 |

## 24 收摊：最终思路与最初设想的差异，和留在桌上的怀疑

对照开场那个"固定 $N$、证第二本征值"的我，最终形态在五个位置换了骨架。其一，舞台从扇区搬到 Fock 空间，"阈值与粒子数无关"从要证明的难点变成陈述的免费部分（代价是全程要携带"误差必须由配对能量控制"这条军规）。其二，误差从范数型换成相对能量型，实现物是 $\Delta_Q$ 精确换元加 lem:compression 换乘，`05` 开篇否决的"谱连续性"是唯一被写进正文的失败方法。其三，比较正算子被整体丢弃，换来三体/四体可以各自单边贴上去，终盘只剩标量账。其四，"截断"这个词被肢解成两半：相互作用永不截断，辅助平方只住模式 0..8，靠旋转平均摊回全局；第 1 节的 no-rescaling 句与这里的两句划界是同一场防御工事。其五，常数从"设计"退位给"验证"：$\gamma_*$ 是被极限定义的（"The limit in \eqref{eq:finalmargin} is $\gamma_*$"），七行整数数据像外部输入一样被供奉，人只负责过账与复核；我按 eq:U/eq:M/eq:recurrence 的精确有理算术把 23 条符号串与 13 个余量整数逐字复现后，对这种"证明即审计"的体裁不再有异议，但它也把全部脆弱性集中在数据上：动一位即塌。

留给下一轮的怀疑清单（各条都标了性质）：`[推测]` 数据来自什么搜索目标函数，tex 只字未提，$\eta$ 距 1 只有 $0.0647$、$\gamma_*$ 只剩 $0.0462$，若重搜允许 $p\le8$ 的盒子，收益是 $\eta$ 下降还是 `FiniteFlux` 翻倍，没有答案。`[推测]` 三体 13 条里 $z=5,7,10$ 余量 $2.5\cdot10^{-4}$ 已经贴脸，$\varepsilon$ 再小一档大概率有块失守，$3/10^6$ 附近是否存在相变点值得扫。`[推测]` 平面端点 $\gamma_*$ 严格大于球面可取的任何 $\gamma$，球面端点缺口是否有本质障碍（$\delta_Q$ 从上方还是下方逼近 61/4096，`deltaFormula_tendsto` 没给单调方向）。Lean 侧留三条：`[推测]` `MainTarget` 的 1/100 与论文的 1/25 并存，是出题早于 Bessel 落位的历史层积，题目口径何时回改未知；`Operators/CollectionAnnihilatorBound.lean` 的粗 $C_0$ 是否会被上游锐化时反噬（$C_0$ 进 $\rho_Q$ 的常数、不影响极限，但任何"显式阈值"类目标会先撞上它）；`FiniteFlux` 的 931 个生成文件里 `Row*` 与 `ComputeRow*Batch*` 的分片粒度是按什么并行预算切的。最后记一笔写作纪律：本篇所有"我当时"都不该被读成实录，素材篇首的取证声明同样管着这 24 节；凡无 `[推测]` 标记处，都可以在 tex、rows.txt 或 Lean 仓库里逐字找到出处，这才是这本笔记允许自己站住的地方。

## 25 台账补表

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\gamma_*$ | $\dfrac{4616733319001}{10^{14}}=0.04616733319001$，比 $1/25$ 多出 $0.006167$ | `01-introduction.tex:41` | thm:fock 的 $\gamma$ 开区间上限（`01-introduction.tex:46`）、摘要那句 $\gamma>1/25$（`main.tex:94`）、平面端点（`07-plane.tex:28`） | 它由 `06-gap.tex:56` 的三笔支出定义，任何一笔动了都要回改它的显示值，两处必须同批动 |
| $1/25$ | $0.04$，全篇唯一对外报出的间隙数 | `main.tex:93` | 摘要（`main.tex:94`）、thm:main 的 $H_{N,Q}\ge\frac1{25}(I-P_{\mathrm L,N})$（`01-introduction.tex:64`）、终盘不等号（`06-gap.tex:58`）、电荷隙（`06-gap.tex:120`） | 若 $\gamma_*$ 掉到它之下，`06-gap.tex:60` 取 $\gamma=1/25$ 那一步先断，推论与 cor:charge-neutral 一起失去前提 |
| $\eta$ | $\dfrac{93527408868499}{10^{14}}=0.93527408868499$，终盘付掉的最大一笔 | `04-comparison.tex:67` | $A_2=\eta H$ 与 $\eta=\sum_\rho\lambda_\rho^2$；`06-gap.tex:57` 的 $1-\eta-\delta_Q-1222\varepsilon$ | 它由七行 $\ell_\rho$ 的平方和锁死（`08-arithmetic.tex:24`），涨 $0.007$ 就把 $\gamma_*$ 与 $1/25$ 的差吃光 |
| $P$ | $10^7$，行数据的定点分母 | `08-arithmetic.tex:13` | eq:alphadata 里的 $a_{pj}/P$（`08-arithmetic.tex:15`）、$\ell_\rho=P\lambda_\rho$、`08-arithmetic.tex:24` 的 $P^2\eta$ | 分母一改，`04` 全部 $\alpha^{\rho}_{pj}$ 与两张证书表的小数点同时平移，我复现的 13 个 floor 整数与 $\eta$ 都对不上 |
| $\ell_\rho$ 七元组 | $7181518,-112991,-4247311,3438746,-98645,-3160276,1441784$，平方和 $93527408868499$ | `08-arithmetic.tex:21` | eq:erational 的交叉项 $2\ell_\rho\mathsf U(2,z,T,t_\rho)$（`08-arithmetic.tex:43`）、$P^2\eta$ 的核对 | 七行数据从这里被 lstinputlisting 嵌入正文；改一位即破坏某条 $m_z>0$ 或某个 $D$ 的 $M\ge0$，最薄处只剩 $2.49\cdot10^{-4}$ |
| $\alpha_{pj}$ | $\dfrac{a_{pj}}{P}\sqrt{\dfrac{2^{p-t}t!(p+j-t)!}{p!j!}}$ | `08-arithmetic.tex:17` | $F_\rho$ 的三体单项 $c_{p+j-t_\rho}^{\dagger}c_jB_p$（`04-comparison.tex:41`）、$e_z$、$E_D$ | 那根式是专为消掉 $\mathsf U$ 的分母配的（`08-arithmetic.tex:39`），换配法则 eq:erational 与 eq:Yrational 两表都要重推 |
| $\varepsilon$ | $3\cdot10^{-6}$，写进证书里的余量 | `04-comparison.tex:164` | $2\chi-E_D+\varepsilon I$（`04-comparison.tex:169`）、$1222\varepsilon$（`05-transfer.tex:176`）、`08-arithmetic.tex:117` 的建表口径 | 放大十倍则 `06-gap.tex:57` 多付 $0.0367$，终盘为负；缩小一档则 `08` 那张符号串里成片的 0 系数转负 |
| $61/4096$ | $0.014892578125$，三体尾巴的极限支出 | `06-gap.tex:15` | 终盘第二笔（`06-gap.tex:57`）、lem:tail 里的 $\delta_Q$ | 它由 $z\ge17$ 的奇数尾巴逐项求和（`06-gap.tex:36`）得到；三体盒从 15 抬到 16 就少付约 $0.0068$，$1/25$ 立刻保不住 |
| $1222$ | $\sum_{D=1}^{23}n_D$，即 $\sum_{m=1}^{12}m^2+\sum_{m=1}^{11}m(m+1)$ | `05-transfer.tex:228` | prop:A4 的 $(1222\varepsilon+o(1))H$（`05-transfer.tex:176`）、终盘第三笔 | 不用 `05-transfer.tex:212` 的 Bessel 链就得每个拷贝各付一份，账变成 $\sum_D\lceil D/2\rceil n_D=10946$，`06-gap.tex:57` 只剩 $0.017$ |
| $n_D$ | $\left\lfloor\dfrac{(D+1)^2}{4}\right\rfloor$，$D=1$ 到 $23$ 的三元组 $(p,j,k)$ 数 | `05-transfer.tex:220` | $1222$ 的求和、允许量 $\varepsilon\sum_D n_DH$（`05-transfer.tex:225`） | 数错一位则 prop:A4 的余量与终盘第三笔同时错，`06-gap.tex:57` 的 $o(1)$ 也失去出处 |
| $\mathcal S_\rho$ 模式盒 | $0\le p\le7$、$0\le j\le8$、$0\le p+j-t_\rho\le8$ | `04-comparison.tex:30` | $F_\rho$ 的求和范围（`04-comparison.tex:40`）、$T\le15$（`04-comparison.tex:71`）、$D\le23$（`04-comparison.tex:118`） | 扩一格则 $e_z$、$E_D$、$G_D$ 三套数全重算；缩一格则 $\eta$ 与 13 条 $m_z$ 同时变差。`08-arithmetic.tex:19` 的非零元约束就是这只盒 |
| $t_\rho$ | 七个整数，取值落在 $\{0,\ldots,7\}$ | `04-comparison.tex:28` | $B_{t_\rho}$ 那一项、$\mathcal S_\rho$ 的第三条约束、eq:erational 的归一因子 $2^{t_\rho}\binom{T}{t_\rho}$（`08-arithmetic.tex:42`） | 换 $t_\rho$ 就是换贴的目标块，`04-comparison.tex:86` 的 13 条严格不等式要重找零点，两体代价 $\lambda_\rho^2$ 也跟着挪位置 |
| 三体上限 $15$ | $T=p+j\le15$，$z$ 只求和到 $15$ | `04-comparison.tex:71` | eq:A3 的 $\sum_{z=0}^{15}$（`04-comparison.tex:73`）、eq:erational 的外和上限、尾巴起点 $16$（`06-gap.tex:8`） | 上限一动，`06-gap.tex:13` 的 $17\le z$ 分界就错位，$61/4096$ 变成另一个数 |
| 四体上限 $23$ | $T=p+j+k=q+l+i\le23$ | `04-comparison.tex:120` | 保留块 $\bigoplus_{D=1}^{23}$（`04-comparison.tex:131`）、$h_Q$ 里的 $p\le23$（`05-transfer.tex:50`）、23 条符号串（`08-arithmetic.tex:132`） | 它与 15 是同一只盒子的两张脸，改这一个要连带改 `05-transfer.tex:18` 的 $Q\ge24$ 与 `05-transfer.tex:47` 的 $1\le D\le23$ |
| $d_a$ | $2Q-1=\dim V_Q$，旋转平均的前因子 | `03-spin.tex:44` | $\mathcal K_Q=(2Q-1)\int_{SU(2)}\sum_{\rho=1}^{7}F_\rho(g)^{\dagger}F_\rho(g)\,dg$（`01-introduction.tex:140`）、$\mathcal K_Q=d_a\int K$（`04-comparison.tex:66`） | 它由 $V_Q$ 的维数定死；归一变了则 $\eta$、$e_z$、$E_D$ 三套数一起重标，$A_2=\eta H$ 里的 $\eta$ 不再是那个平方和 |
| $d_{3,z}$ | $3Q-1-2z$，比值 $\frac{d_{3,z}}{d_a}\to\frac32$ | `03-spin.tex:44` | eq:A3 的权重 $\frac{d_a}{d_{3,z}}$（`04-comparison.tex:73`）、eq:3certificate 右端的 $\frac32$（`04-comparison.tex:86`）、尾巴里的 $\frac{d_{3,z}}{d_a}\le2$（`06-gap.tex:29`） | 极限 $\frac32$ 一动，13 条余量整数全部作废，$q_z(Q)$ 的极限式（`03-spin.tex:56`）也要跟着重算 |
| $d_D$ | $4Q-1-2D$，比值 $\frac{d_D}{d_a}\to2$ | `04-comparison.tex:122` | eq:A4 的 $\frac{d_a}{d_D}$（`04-comparison.tex:131`）、目标 $2\chi$（`04-comparison.tex:145`）、$C_D^Q$ 的首项（`05-transfer.tex:49`） | 极限 2 变了则 `08-arithmetic.tex:109` 里 $2\mathbf 1_{r=1}+\varepsilon$ 的对角系数与偶 $D$ 那批 0 串同时重验 |
| $u$ | 三体取 $1/\sqrt3$，四体取 $1/\sqrt2$ | `04-comparison.tex:75` | eq:ez 的全部 $s_{z,T,p}$（`04-comparison.tex:77`）、eq:S 的两个耦合因子（`04-comparison.tex:114`） | $u$ 错则主项换标度，我实测第一条 $z=2$ 就崩，eq:erational 里的 $3^T$ 要换成 $2^T$（`08-arithmetic.tex:37`） |
| $\sqrt3$ | $W_3$ 等于全反对称化的 $\sqrt3$ 倍 | `03-spin.tex:60` | lem:q 的 Gram $I-P_{13}-P_{23}$、$q_z=-2b_z$ 那一步（`03-spin.tex:84`） | 楔归一约定一动，$q_z$ 与 $e_z$ 同标度漂移，`04-comparison.tex:86` 的严格不等号连同 $\varepsilon$ 一起重标 |
| $\sqrt2$ | 有序张量系数进入楔子的归一因子 | `03-spin.tex:68` | eq:pair 系数平方和的直接验证（`03-spin.tex:27`）、平面端 $v_p^{\mathrm{pl}}$ 的重建（`07-plane.tex:49`） | 少乘则 $v_p^*$ 不再是 eq:pair 的极限，球面矩阵元按范数趋于平面那一句（`07-plane.tex:67`）失去落点 |
| $v_p(i,j)$ | $(i-j)\sqrt{\frac{(Q)_i(Q)_j\,p!}{Q(2Q-2)_p\,i!j!}}$，只在 $i+j=p+1$ 非零 | `03-spin.tex:15` | 分解式 $v_p(x,y)=r_p(Q)d_Q(x)d_Q(y)v_p^*(x,y)$（`05-transfer.tex:76`）、lem:q 的最高权向量系数 | 支撑条件一动，`05-transfer.tex:82` 的精确共轭等式不再成立，整条 $\Delta_Q$ 换元断在这里 |
| $v_p^*(i,j)$ | $(i-j)\sqrt{\frac{p!}{2^p i!j!}}$，$Q\to\infty$ 的极限 | `03-spin.tex:19` | $h_*$（`05-transfer.tex:34`）、$w_{Dr}^*$ 与 $G_D$（`04-comparison.tex:161`）、平面的 $H_N^{\mathrm{pl}}$ 展开（`07-plane.tex:44`） | 它是球面与平面共用的骨架；改了则 `07-plane.tex:52` 的等式与 lem:compression 的作用对象同时错位 |
| $r_p(Q)$ | $\sqrt{(2Q)^p/(2Q-2)_p}\ge1$ | `05-transfer.tex:77` | eq:pairconjugation、eq:fourconjugation 的分子、$\beta_{rb}^Q$（`05-transfer.tex:103`） | 不等号方向被 `05-transfer.tex:93` 用来定 $\Delta_Qh_*\Delta_Q\le h_Q$；反号则误差由配对能量控制这条军规失效 |
| $d_Q(x)$、$\Delta_Q$ | $\sqrt{(Q)_x/Q^x}$ 张成的对角正算子，$0<\Delta_Q\le I$，$\Delta_Q$ 与 $\Delta_Q^{-1}$ 按范数趋于 $I$ | `05-transfer.tex:68` | 两处共轭（`05-transfer.tex:82`、`05-transfer.tex:87`）、$\lVert R_Q\rVert\to0$ 的论证（`05-transfer.tex:143`） | 它只在局域 Fock 空间随 $Q$ 固定时才成立；模式数一涨，`05-transfer.tex:143` 那句索引集与局域空间同时固定的前提就撑不住 |
| $\mathbb C^{25}$、$Q\ge24$ | 局域 Fock 空间取 $e_0,\ldots,e_{24}$ 共 25 个轨道模式 | `05-transfer.tex:18` | lem:compression 的 $0\le j,k\le24$（`05-transfer.tex:31`）、lem:transfer 的 $Q\ge24$（`05-transfer.tex:47`）、旁观者分拆（`05-transfer.tex:157`） | 减一到 24 则 $p\le23$ 的极限配对向量出盒；与粒子数无关的 $\rho_Q$ 随之失去存在依据 |
| $Q\ge4$ | 尾巴比值单调的阈值 | `06-gap.tex:26` | $\frac{(Q)_z}{(2Q-2)_z}\le\left(\frac{Q}{2Q-2}\right)^z\le(2/3)^z$（`06-gap.tex:28`）、受控收敛 | $Q=3$ 时 $\frac{Q}{2Q-2}=\frac34>\frac23$，控制级数 $6z(z+1)(2/3)^z$（`06-gap.tex:32`）压不住被积项，$61/4096$ 的极限推不出 |
| $24$ | 恒等式 $d_a\int h_Q(g)\,dg=24H$ | `05-transfer.tex:194` | prop:A4 把 $\rho_Qh_Q$ 换成 $o(1)H$ 的那一步（`05-transfer.tex:191`）、终盘 `06-gap.tex:47` 的 $o(1)$ | 它是 $h_Q$ 的项数；写成 $2Q-1$ 或 25 则这次平均的常数账断，Bessel 之后的余量失去落点 |
| $h_Q$、$h_*$ | 前者为 $\sum_{p=0}^{23}B_p^{\dagger}B_p$，后者是同一和式的极限形 | `05-transfer.tex:50` | eq:relative 的右端 $-\rho_Qh_Q$（`05-transfer.tex:57`）、eq:pairenergytransfer（`05-transfer.tex:95`）、`05-transfer.tex:194` 的平均 | 求和取到 $2Q-2$ 就不是局域算子，`05-transfer.tex:153` 那个对固定 $D$ 集取最大值的 $\rho_Q$ 不再存在 |
| $C_0$ | 配对指标 $p$ 的最大重数，只依赖那个有限族 | `05-transfer.tex:42` | eq:annihilatorbound（`05-transfer.tex:33`）、扰动估计里的 $C_0\lVert R_Q\rVert$（`05-transfer.tex:148`） | 它只进 $\rho_Q$ 的常数因子，靠 $\lVert R_Q\rVert\to0$ 付清；凡想要显式磁通阈值的目标都会先撞上它 |
| $\rho_Q$ | 非负、与 $D$ 无关、$Q\to\infty$ 时趋于 $0$ | `05-transfer.tex:52` | eq:relative（`05-transfer.tex:57`）、prop:A4 的 $o(1)$（`05-transfer.tex:176`）、终盘 `06-gap.tex:47` | 它是对固定集 $1\le D\le23$ 取的最大值（`05-transfer.tex:153`）；$D$ 的范围一开就没有共同的 $\rho_Q$，均匀性在此断 |
| $\mathcal R_D$ | $\{1,3,5,\ldots\}\cap[1,D]$，拷贝数 $d=\lvert\mathcal R_D\rvert$ | `04-comparison.tex:103` | $E_D$、$G_D$ 的维数、`08-arithmetic.tex:119` 的 $J=I_d$ | 奇偶性写错则偶 $D$ 的 $r=1$ 列消失句（`04-comparison.tex:147`）失效，$\chi$ 多出非零列，23 张证书全重验 |
| $u_r$、$\sqrt{u_ru_s}$ | $u_r=1/(r!(D-r)!)$，把根式从 $Y,Z$ 里分离出去 | `08-arithmetic.tex:62` | eq:M 的 $D_{\sqrt u}MD_{\sqrt u}$（`08-arithmetic.tex:106`）、$Z_{rs}$ 的分母 $f(A)$（`08-arithmetic.tex:102`） | 它保证 $M$ 纯有理；换别的全对角合同则 `08-arithmetic.tex:104` 那句"二的指数为整数"失去理由，符号串的判定口径随之变 |
| 尾巴的 $z=17+2m$ 分解 | $(3z-1)(z+1)=900+208m+12m^2$，再乘 $\frac32\,2^{-17}$ | `06-gap.tex:39` | $61/4096$ 的最后一个等号（`06-gap.tex:41`） | 起点 17 改成 15 则这组系数全变，终盘第二笔多付约 $0.0068$，$1/25$ 保不住 |
| $4/3$、$4/9$、$20/27$ | 三级和 $\sum_m4^{-m}$、$\sum_mm4^{-m}$、$\sum_mm^24^{-m}$ | `06-gap.tex:40` | $\frac{61}{4096}$ 的闭合形式 | 任一级算错则 `06-gap.tex:15` 的极限与 `06-gap.tex:57` 的支出同时错，终盘那个 $0.046167$ 不可复现 |
| 13 条 $m_z$ 余量 | $\lfloor10^6m_z\rfloor$ 依次为 1298313, 211317, 249, 250, 249, 250, 250, 250, 249, 250, 250, 6470, 250 | `08-arithmetic.tex:52` | eq:3certificate（`04-comparison.tex:86`）与 `08-arithmetic.tex:56` 的全为正结论 | 最薄处 $2.49\cdot10^{-4}$ 已经贴脸；$\varepsilon$ 降一档或某行 $\ell_\rho$ 改动，$z=5,7,10$ 三块先失守 |
| 23 条符号串 | 每个 $D$ 的 $\det(xI+M)$ 系数逐条取号，偶 $D$ 尾部成串为 0 | `08-arithmetic.tex:132` | eq:4certificate（`04-comparison.tex:169`）、lem:transfer 的前提（`05-transfer.tex:53`）、`08-arithmetic.tex:148` 的 $M\ge0$ | 一个 + 变成负号则 `05-transfer.tex:128` 的极限正性失，prop:A4 连同终盘第二笔一起断 |
| eq:recurrence | $X=MJ$、$c_b=\frac{\operatorname{tr}X}{b}$、$J=c_bI_d-X$ | `08-arithmetic.tex:122` | 符号串表里的每一个系数（`08-arithmetic.tex:126`） | 它是作用在 $-M$ 上的 Leverrier--Faddeev 递推，除以 $b$ 那步换成别的算法，整张表要重算 |
| $\binom N2$、系数一 | 每对粒子系数恒为 1，不随 $N,Q$ 重标 | `02-operators.tex:28` | eq:fockH 的 $\sum_{p=0}^{2Q-2}B_p^{\dagger}B_p$（`02-operators.tex:23`）、与 eq:physicalH 的等价验证（`01-introduction.tex:29`）、no-rescaling 句（`01-introduction.tex:35`） | 归一变了则 $\eta$、$e_z$、$E_D$ 一起同标度漂移，摘要里 $1/25$ 的对外口径作废 |

视角差异勘误。第 495 行那张表和这张表记的是同一批数，栏目口径不同：旧表按"用在哪 / 动了会坏在哪"记，回答的是这个常数在推导链里站在哪一格；这张新表按"被谁消费 / 若改动断在哪一步"记，回答的是谁在读它、以及断口会先出现在哪一节，并且每一条都补了 `文件名:行号`，旧表的定位停在节号（`01`、`06` 这一级）而没有落到行。两张都留着：旧表读起来快，适合复核总账；新表逐条可按，适合我在改任何常数之前先查它被哪几个式子点名。旧表的二十八个条目、包括其中 $10946$ 与 $1/100$ 那两行的说法，都与 build 版 tex 对得上，它没有写错，只是栏位与定位精度和这张不同，所以一个字也不动。另记一笔口径差别：旧表里"模式盒"一格把 $p\le7$、$j\le8$、模式 $\le8$ 三个数合在一格，这张表把它们拆成 $\mathcal S_\rho$（`04-comparison.tex:30`）、$T\le15$（`04-comparison.tex:71`）、$D\le23$（`04-comparison.tex:118`）三条，因为这三条的消费方并不同批，改哪一条断在哪一节也不同；旧表那样合记在阅读时更省，我这面拆记是为了对账。$\ell_\rho$ 那七行整数落在语料目录 `E:\math\preprints\A-Fock-space-inequality-and-the-Laughlin-spectral-gap-September-24-2026` 的 verification 子目录里，正文经 `08-arithmetic.tex:21` 嵌入，所以本表把它的位置记在嵌入处，与旧表"eq:erational、eq:Yrational 的分子"那条并不冲突。补记一句自查：上面写"旧表的二十八个条目"是我把行数记错了，按第 497 行到第 522 行实数 26 条，以 26 为准；这句是追加更正，旧表那 26 行本身没有被碰过。
