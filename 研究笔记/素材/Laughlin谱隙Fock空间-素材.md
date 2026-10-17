# Laughlin 谱隙 Fock 空间不等式：研究素材

论文：A Fock space inequality and the Laughlin spectral gap（OpenAI，2026-09-24）。
正文唯一来源：`E:/math/preprints/A-Fock-space-inequality-and-the-Laughlin-spectral-gap-September-24-2026/build/main.tex` 与 `build/sections/01-introduction.tex` … `08-arithmetic.tex`（共 8 节）、`build/figures/relative-transfer.tex`、`build/references.bib`、`verification/rows.txt`。形式化来源：`E:/math/lean/OAI/Analysis/Laughlin/`（入口 `Main.lean`，声明 `OAI.Laughlin.mainTarget_proved`）、`E:/math/lean/ComparatorChallenges/Laughlin.json`、`E:/math/lean/formalization.yaml`（第 1274–1276 行条目）。

**取证声明**：`E:/math/reasoning_traces/` 现有 17 个文件（basic-semidefinite、free-group-factor、pi 无理指数、Kaplansky 特征 2、Mezard–Parisi、two-point、quasipolynomial AP、Vlasov–Maxwell、Heisenberg、symmetric Mahler、调和维数等），**没有本篇的思维链 summary**。因此本素材中所有"作者为什么这样选择/曾经可能走过哪条弯路"的推断都是从 tex 文本、脚注、防御性句子以及 Lean 文件结构反推出来的，一律标 `[推测]`。凡未标注的内容都是从 tex / Lean / rows.txt 逐字抄录或按其定义精确重算得到的。

**本素材独立复核过的数值**（不是抄论文，是我自己按 tex 附录公式重算）：
1. $\eta=\sum_\rho\lambda_\rho^2$ 的分子 $P^2\eta=93527408868499$——由 `verification/rows.txt` 七行的 $\ell_\rho$ 精确平方求和复现。
2. 终盘预算 $1-\eta-61/4096-1222\varepsilon=\gamma_*=4616733319001/10^{14}>1/25$ 复现。
3. $\sum_{D=1}^{23}n_D=1222$（$n_D=\lfloor (D+1)^2/4\rfloor$）与 $\sum_D \lceil D/2\rceil n_D=10946$ 两个计数都复现；后者正是 Lean `Operators/Certificate.lean` 里 `allowance_count` 的值。
4. 三体态尾系数上限表 `floor` 行 13 个整数（1298313, 211317, 249, 250, 249, 250, 250, 250, 249, 250, 250, 6470, 250）**逐个复现**，包括 $\mathsf U(2,z,T,p)$ 与 $s^{(1/\sqrt3)}$ 的 $2^{(z-p)/2}$ 指数。
5. 四体证书：按 eq:U / eq:V / eq:Srational / eq:Yrational / eq:Lrational / eq:Zrational / eq:M / eq:recurrence 从零实现精确有理算术，**$D=1,\dots,23$ 的符号表全部逐字复现**（`0`,`0`,`00`,`00`,`+00`,`000`,`+000`,`+000`,`++000`,`+0000`,`+++000`,`++0000`,`++++000`,`+++0000`,`+++++000`,`++++0000`,`++++++000`,`+++++0000`,`+++++++000`,`++++++0000`,`++++++++000`,`+++++++0000`,`+++++++++000`）。复现过程中暴露两处"读错就会全盘皆输"的细节，见第二节附录条目与第四节。
6. $D=5$ 的矩阵元 $M_{11}=56737668577815655510619653/300647710720000000000000$，与 Lean `FiniteFlux/Positive05.lean` 里 `pivotsFive` 第一个主元**逐位相同**；同一文件 `pivotsFive = ![该值, 0, 0]` 的秩 1 形态也与我的符号串 `+00` 一致。偶 $D$（如 $D=12$）我算出 $M_{11}=0$，正好对应论文"偶 $D$ 时 $r=1$ 列在加楔后为零"的论述。

---

## 一、定理与构造总览

### 1.1 主定理与全部关键定义的逐字转写

归一化（01-introduction.tex 第 23–35 行，逐字）：

> For an integer \(Q\ge1\), let \(U_Q\) be the spin-\(Q/2\) representation of \(SU(2)\), equipped with its invariant inner product. It is the one-particle lowest Landau level on the sphere with \(Q\) flux quanta. Equivalently, it is the space of homogeneous polynomials of degree \(Q\) in spinor coordinates \((u,v)\). For \(2\le N\le Q+1\), define
> \[ H_{N,Q}=\left.\sum_{1\le i<j\le N}P_{ij}^{(1)}\right|_{\bigwedge^N U_Q}, \]
> where \(P_{ij}^{(1)}\) is the orthogonal projector onto pair spin \(Q-1\) in tensor positions \(i,j\). This is relative angular momentum one. The sum preserves the antisymmetric subspace. Each unordered pair has coefficient one, with no rescaling depending on \(N\) or \(Q\).

接着（同文件第 37–42 行）：

> Set \(H_{0,Q}=H_{1,Q}=0\), and write
> \[ \FF_Q=\bigoplus_{N=0}^{Q+1}\bigwedge^N U_Q,\qquad H_Q=\bigoplus_{N=0}^{Q+1}H_{N,Q},\qquad \gamma_*=\frac{4616733319001}{10^{14}}> \frac1{25}. \]

主定理（第 45–52 行，逐字）：

> **Theorem** \label{thm:fock}. For every \(0<\gamma<\gamma_*\), there is an integer \(Q_\gamma\) such that for every integer \(Q\ge Q_\gamma\),
> \[ H_Q^2\ge\gamma H_Q\qquad\text{on }\FF_Q. \]
> The threshold \(Q_\gamma\) is independent of particle number.

推论（第 60–71 行，逐字）：

> **Corollary** \label{thm:main}. There is an integer \(N_0\ge2\) such that, for every \(N\ge N_0\) and \(Q=3(N-1)\),
> \[ H_{N,Q}\ge\frac1{25}\bigl(I-P_{\mathrm L,N}\bigr)\qquad\text{on }\bigwedge^N U_Q, \]
> where \(P_{\mathrm L,N}\) projects onto the line spanned by \(\Psi_{\mathrm L,N}=\prod_{i<j}(u_iv_j-u_jv_i)^3\).

摘要（main.tex，逐字）：

> We prove the spherical fermionic Laughlin spectral-gap conjecture for the full \(V_1\) interaction. With coefficient one for each pair projector, the gap above the Laughlin state at filling \(1/3\) on the round sphere is at least \(1/25\) for all sufficiently large systems. More generally, \(H_Q^2\ge\gamma H_Q\) for some fixed \(\gamma>1/25\) on the entire lowest-Landau-level Fock space for all sufficiently large flux \(Q\), independently of particle number.

pdfsubject 字段：`The full fermionic V1 interaction on the round sphere`。

### 1.2 措辞为什么是现在这样：逐条拆解

- "$P_{ij}^{(1)}$ is the orthogonal projector onto **pair spin \(Q-1\)**"：$V_1$ 赝势在球面上的等价定义。两粒子自旋合成 $Q\otimes Q$，相对角动量 1 的通道恰是总自旋 $Q-1$，所以"pair spin $Q-1$"与"relative angular momentum one"是同义反复，论文两句都写是因为这是两套文献的方言（Haldane–Rezayi 用相对角动量，Ortiz–Nussinov–Dukelsky–Seidel / Chen–Seidel 用总自旋）。`[推测]` 先写自旋版、后补一句"这就是相对角动量一"，是为了让 QH 与算子代数两类读者都能在第一页锁定对象。
- "in tensor positions \(i,j\)" 与 "The sum preserves the antisymmetric subspace"：$P_{ij}^{(1)}$ 定义在张量积 $\bigotimes^N U_Q$ 上， restriction 到反对称子空间之前必须说明它不变，否则 $H_{N,Q}$ 的定义不闭合。
- "coefficient one, with **no rescaling** depending on \(N\) or \(Q\)"：这是全文最关键的防御句。QH 文献里常见 $\frac{2}{N(N-1)}$ 之类的平均归一或按 $Q$ 缩放的磁能尺度；一旦允许 rescale，谱隙数值就不再是"绝对"的，热力学极限的 $1/25$ 也无从谈起。这句把论文和所有做过归一化选择的有限尺寸研究隔开。
- "For every \(0<\gamma<\gamma_*\)"：不是 "for $\gamma=\gamma_*$"。因为证明里的 $o(1)$ 误差只能在 $Q\to\infty$ 后才压到 $\gamma_*$ 以下，端点系数取不到；摘要因此写的是"for some fixed \(\gamma>1/25\)"而不是"$\gamma_*$"。这也是 "$\gamma_*$ 定义成一个 14 位有理数再证 $>1/25$" 的原因：$\gamma_*$ 是终盘预算算出来的余量，不是设计出来的目标。
- "there is **an integer** \(Q_\gamma\)"：明确阈值是整数、且依赖 $\gamma$（不连续地依赖，$\gamma\uparrow\gamma_*$ 时阈值发散）。
- "The threshold \(Q_\gamma\) is **independent of particle number**"：这句是论文真正的卖点，也是它选择 Fock 空间而非固定 $N$ 陈述的原因——$H_Q$ 是所有 $N$ 的直和，一次不等式覆盖全部粒子扇区；若在固定 $N$ 陈述，误差项会含 $\binom{N}{2}$ 之类增长因子。
- "on the **entire** lowest-Landau-level Fock space"（摘要）：强调 $0\le N\le Q+1$ 全包括，含 $H_{0,Q}=H_{1,Q}=0$ 这两个空扇区；之所以可以包含它们，是因为 $H_Q^2\ge\gamma H_Q$ 在零算子上自动成立。
- $Q=3(N-1)$：填充 $1/3$ 的磁通量—粒子数关系（Laughlin 态的度数为 $3N(N-1)/2$，单粒子度 $Q$ 需 $\ge 3(N-1)$）。推论里把它写死而不是参数化，`[推测]` 是因为核的唯一性引理（lem:kernel）只在 $Q=3(N-1)$ 时用度数计数 $3(N-1)=Q$ 论证，别处没有唯一性。
- 推论用 $1/25$ 而非 $\gamma_*$：因为 $1/25$ 是"可读结论"，$\gamma_*$ 是机器值；摘要也把两者分开说（"at least \(1/25\]" 对物理结论，"$\gamma>1/25$" 对 Fock 不等式）。
- Lean 侧的措辞差异见第四节：Lean 认证的是 $1/100$，且 $1/25$ 版本在 `Fock/LaughlinGap.lean` 里另有声明。

### 1.3 与前人工作的关系，以及论文给自己的定位

论文在 Prior work 一节的定位语句（逐字摘录，第三节还会逐句抄全）：

- Haldane–Rezayi 有限尺寸研究被描述为"explicitly distinguished the expected hard-core gap from a formal proof"——即数值证据 + 明确的"这不构成证明"声明。
- GMP 密度波、Trugman–Kivelson、Ortiz–Nussinov–Dukelsky–Seidel、Chen–Seidel 与 Mazaheri–Ortiz–Nussinov–Seidel、Jansen 圆柱、Nakamura–Wang–Bergholtz、Wang–Nakamura：都是谱隙的间接/数值/变体证据。
- Nachtergaele–Warzel–Young（NWY）**截断**费米赝势的一致谱隙：论文承认"the fermionic estimates already hold uniformly across particle sectors"，并立即用一句划界："The distinction in Theorem~\ref{thm:fock} is the full spherical pair interaction, with its fixed projector normalization and sphere radius growing in the thermodynamic limit. The finite support used in our auxiliary comparison operators does **not** truncate that interaction."——这是全文最需要防的误读（审稿人可能说"这和 NWY 差不多"），所以论文把"我用了有限个轨道模式"与"我没有截断相互作用"分成两句说。
- Warzel–Young 细环面、Warzel–Young 2023 bulk/edge。
- Lemm–Nachtergaele–Warzel–Young 2026 递归：论文承认其方法可复用，但指出"for the full pseudopotential still requires control of the model-specific ground-space overlap matrices in those criteria"。这句直接对应第 06 节的 cor:charge-neutral——他们**引用**该文 v1 版 Theorem 2.1(I)、Lemma 2.3 与 (2.10) 来把"电荷隙"转成"中性隙"，而不是自己证递归。
- Schraven–Warzel 2026 IMPS（圆柱上的纠缠隙与聚类）：论文紧跟一句划界"The entanglement spectrum is distinct from the Hamiltonian spectrum considered here."
- Lieb–Rougerie–Yngvason 密度刚性：另一类不可压缩性，划界句"No density-screening assumption enters our argument."
- Rougerie 综述 Appendix A 的 Conjecture A.1（平面、度数范围 $L\le 3N(N-1)/2$）：第 07 节宣布"this proves the fermionic cubic case of the folklore spectral-gap conjecture"。
- Knabe / Cruz–et al. / Rai 等：作为"$H^2-\gamma H\ge0$ 这条标准路线"的先例被引用（"Proving positivity of $H^2-\gamma H$ is a standard route to a gap, underlying finite-size criteria~\cite{Knabe} and methods based on positive local decompositions~\cite{Cruz,Rai}."）。
- references.bib 里还有两篇方法论来源：`PeyrlParrilo`（有理系数 SOS 分解）、`HouConference`（Leverrier–Faddeev 算法，EPTCAM 3），以及 `GirvinJach`、`GaoLanzettaLedwithWangKhalaf`（bootstrapping the quantum hall problem）。**注意 bib 里有 Wick 与 Bartlett–Rudolph–Spekkens**：正常序展开与"平方和即正性"的概念性引用。

### 1.4 证明装配链

论文自己的总预算（逐字）：

> \[ H_Q^2\ge\mathcal K_Q+(\gamma_*-o(1))H_Q. \]

装配链（节序即证明序）：

1. **02 节（sec:algebra）**：把 $H_Q$ 写成配对消灭算子和 $H_Q=\sum_p B_p^\dagger B_p=\LL_2(\Pi_{V_Q})$，用 Wick 正常序得 lem:square：$H^2=H+\LL_3(W_3(W_3^\dagger W_3-I)W_3^\dagger)+\LL_4(W_4W_4^\dagger)$。转移：从"多项式相互作用"到"2/3/4 体升算子之和"。
2. **03 节（sec:spin）**：显式基底下算出配对系数 $v_p(i,j)$（lem:pair）、三体 Gram 谱 $q_z(Q)$（lem:q）以及"固定亏缺耦合极限"lem:coupling。转移：从抽象 $SU(2)$ 表示到可算的根数与阶乘。
3. **04 节（sec:squares）**：构造比较算子 $\mathbb K_Q=d_a\int K(g)dg$，$K=\sum_{\rho=1}^7F_\rho^\dagger F_\rho$，经 Schur 平均得 $A_2+A_3+A_4$，其中 $A_2=\eta H_Q$；三体块用 $e_z$ 证书，四体块用 $G_D(2\chi-E_D+\varepsilon I)G_D\ge0$ 证书。转移：从"正算子的积分"到"分块有限不等式"。
4. **05 节（sec:transfer）**：用精确定角换元 $\Delta_Q$ 把有限磁通的消灭算子共轭回极限形式（lem:compression、lem:transfer），得 prop:A4：$A_4\le\LL_4(W_4W_4^\dagger)+(1222\varepsilon+o(1))H_Q$。
5. **06 节（sec:finish）**：三体尾巴 lem:tail（$\delta_Q\to61/4096$）+ 终盘预算 → Theorem thm:fock；核唯一性 lem:kernel + 谱定理 → Corollary thm:main；引用 LNWY 递归 → cor:charge-neutral。
6. **07 节（sec:plane）**：Bargmann 空间与 $v_p^*\to v_p^{\mathrm{pl}}$ 逐点极限 → cor:plane（平面无条件 $Q$ 的端点 $\gamma_*$ 不等式）。
7. **08 节（app:certificate）**：全部有理算术，$\mathsf U,\mathsf V,S_r,Y_{rs},L_r(A),Z_{rs},M=ZBZ$ 与 Leverrier–Faddeev 符号表。

**论文明确说"仅靠数值不等式不能支持"的过渡**（这三处是本素材最重要的取证点）：

- 三体→全 Fock："$A$ small norm error on a growing many-particle space would not suffice: it must vanish on the zero modes and be controlled by the pair energy."（01 节图注后）。也就是说，$\|A_3-\LL_3(\cdots)\|\le o(1)$ 这种范数误差**不够**，必须是相对 $H_Q$ 的误差。
- 四体 Gram 有核：图注 "The limiting positivity is imposed only after wedging; **no invertibility of its Gram matrices is required**."，正文 "This relative estimate remains valid when the Gram matrices of these limiting four-particle images have kernels." 以及 04 节 "The formula with $\chi$ still represents it exactly; we never assume that the wedged copy vectors are independent."
- 转移本身的连续性：05 节开篇 "The limiting Gram matrices have kernels, so their positivity cannot be transferred by assuming that their ranges vary continuously. Instead, we compare the annihilators themselves."
- 粒子数增长的误差：01 节 "The remaining issue is to transfer those inequalities to finite spheres **without an error that grows with the number of particles**."
- 副本数放大误差：05 节 "Bessel's inequality then avoids an extra factor equal to the number of spin copies."（即把 $10946\varepsilon$ 降为 $1222\varepsilon$）
- 线性相关：01 节 "Their four-particle images under exterior multiplication can be linearly dependent."

这三类"数值不够"的表述在 Lean 侧都有对应结构（第 05 节的 $\Delta_Q$/`Exterior/Scaling`、`Pair/Conjugation`，第 04 节的 `FourBody/BesselAllowance.lean`），说明作者当时确实把它们当作需要单独处理的难点。

### 1.5 章节 ↔ 文件 ↔ 素材索引表

| tex 节 | 标签 | 主要对象/结论 | 本素材第二节条目 |
|---|---|---|---|
| 01-introduction | — | eq:physicalH、FF_Q、γ_*、thm:fock、thm:main | 2.1, 2.2 |
| 02-operators | sec:algebra | eq:lift、eq:fockH、lem:square | 2.3, 2.4 |
| 03-spin | sec:spin | lem:pair、lem:q、lem:coupling | 2.5, 2.6, 2.7 |
| 04-comparison | sec:squares | K_Q、A_2/A_3/A_4、eq:ez、eq:4certificate | 2.8–2.12 |
| 05-transfer | sec:transfer | lem:compression、lem:transfer、prop:A4 | 2.13, 2.14, 2.15 |
| 06-gap | sec:finish | lem:tail、thm:fock 证明、lem:kernel、thm:main 证明、cor:charge-neutral | 2.16–2.20 |
| 07-plane | sec:plane | cor:plane | 2.21 |
| 08-arithmetic | app:certificate | eq:U/eq:V/eq:Srational/eq:Yrational/eq:Lrational/eq:Zrational/eq:M/eq:recurrence | 2.22, 2.23, 2.24 |

Lean 模块对应表见第四节；常数表见第五节。

---

## 二、逐引理带批注重构

标注约定：`[补]` = 论文省略、由我按其定义补出的中间计算；`[推测]` = 对作者思路分叉的推断；`Lean:` = 形式化对应物。所有原文陈述都用引用块逐字抄录（保留 LaTeX）。

### 2.1 Theorem \label{thm:fock}（Fock 空间主不等式）

> For every \(0<\gamma<\gamma_*\), there is an integer \(Q_\gamma\) such that for every integer \(Q\ge Q_\gamma\), \(H_Q^2\ge\gamma H_Q\) on \(\FF_Q\). The threshold \(Q_\gamma\) is independent of particle number.

**(b) 它由什么合成.** 该定理在 06 节末尾被证明，输入恰好三件：
1. lem:square 把 $H_Q^2$ 拆成 $H+\mathcal T_3+\mathcal T_4$（三体升算子项与四体升算子项）；
2. 比较算子给出 $H_Q^2\ge\mathbb K_Q+(\gamma_*-o(1))H_Q$，其中 $\mathbb K_Q\ge0$（平方和的旋转平均，逐点非负）；
3. $o(1)$ 的具体成分：$\delta_Q\to61/4096$（lem:tail）与 $1222\varepsilon$（prop:A4），加上 $Q\to\infty$ 时的收敛误差。
因为 $\mathbb K_Q\ge0$ 被**丢掉**而不是被估计，主不等式的形状只能是 $H^2\ge\gamma H$ 而不是 $H^2\ge\gamma H+\text{something}$。`[补]` 这一点很重要：论文用"丢掉一个正算子"换取"$\mathbb K_Q$ 的三体/四体部分可以自由用来匹配 $H^2$ 的对应部分"，所以终盘只剩标量预算，没有任何交叉项。

**(c) 参数为什么这样取.** $\gamma_*=4616733319001/10^{14}$ 是被三条误差线夹出来的：
$$\gamma_*=1-\eta-\frac{61}{4096}-1222\varepsilon,\qquad \eta=\frac{93527408868499}{10^{14}},\ \varepsilon=\frac3{10^{6}}.$$
"$0<\gamma$" 下界无实质内容（$\gamma\le0$ 时结论平凡，因为 $H_Q\ge0$）；写 $0<\gamma$ 只是让 $Q_\gamma$ 的定义域是连通区间。"$Q_\gamma$ 是整数"而非"实数阈值"是因为 $Q$ 是磁通量子数，且证明里用 $Q\ge24$（05 节）与 $Q\ge4$（lem:tail 的比值单调性）这类整数条件。"independent of particle number" 成立的技术理由是：所有估计都在升算子 $\mathcal L_k$ 层面做，$\mathcal L_k$ 的定义与 $N$ 无关；关键的相对误差 $\rho_Q h_Q$ 里 $h_Q=\sum_{p\le23}B_p^\dagger B_p$ 也是 Fock 算子。

**(d) [推测] 候选失败路线.**
- 失败路线 A：在固定 $N$ 的扇区陈述并逐扇区证明，然后用一致常数拼接。文本证据：01 节 "The remaining issue is to transfer those inequalities to finite spheres without an error that grows with the number of particles." 以及 "A small norm error on a growing many-particle space would not suffice"。$H_Q$ 的谱在 $\bigwedge^N U_Q$ 上的配对计数随 $N$ 增长（$0\le H\le\binom N2$），任何与 $\binom N2$ 成比例的绝对误差都无法被 $H_Q$ 控制。`Lean:` `Operators/PhysicalFockGap.lean` 全程在 `sourceFockHamiltonian`（对所有 $N$ 的直和）上陈述，没有任何固定 $N$ 的中间引理需要一致性论证，说明"从一开始就走 Fock 空间"是被贯彻的。
- 失败路线 B：用 $\|H_Q^2-\gamma H_Q-\mathbb K_Q\|\le o(1)$ 的范数误差。文本证据同上（图注与正文两处强调"必须由配对能量控制"）。Lean 侧的 `FourBody/UniformTransfer.lean` 结论形式是 `... ≥ -rho * sourceFockEnergy Q x`，是相对能量界而非范数界，证实这条分叉被明确避开。
- 失败路线 C：把端点 $\gamma=\gamma_*$ 也包含进去（"$\ge\gamma_* H_Q$ 对所有大 $Q$"）。文本证据："The proof does not give an explicit flux threshold or the endpoint coefficient \(\gamma_*\) on finite spheres." 注意 07 节的 cor:plane **反而**在端点成立（"Now let $\gamma\uparrow\gamma_*$; the cone of positive matrices is closed"），因为平面情形是逐点极限后取闭包，不需要 $Q$ 阈值。`[推测]` 作者很可能先拿到平面端点版、再回头把球面版写成开区间形式。

### 2.2 Corollary \label{thm:main}（Laughlin 谱隙 $1/25$）

> There is an integer \(N_0\ge2\) such that, for every \(N\ge N_0\) and \(Q=3(N-1)\), \(H_{N,Q}\ge\frac1{25}(I-P_{\mathrm L,N})\) on \(\bigwedge^N U_Q\), where \(P_{\mathrm L,N}\) projects onto the line spanned by \(\Psi_{\mathrm L,N}=\prod_{i<j}(u_iv_j-u_jv_i)^3\).

**(b) 需要哪些额外输入.** 三步，全在 06 节：
1. lem:kernel：$\ker H_{N,3(N-1)}=\mathbb C\Psi_{\mathrm L,N}$（唯一零模）；
2. thm:fock 给出 $\mathrm{spec}(H_{N,Q})\subset\{0\}\cup[\gamma,\infty)$，取 $\gamma\in(1/25,\gamma_*)$（可行，因为 $\gamma_*>1/25$）；
3. 谱定理：在有唯一零模的扇区，$H_{N,Q}\ge\gamma(I-P_{\mathrm L,N})$，而 $\gamma>1/25$ 于是给出 $1/25$。
`[补]` 注意 $Q=3(N-1)$ 随 $N$ 增长，而 thm:fock 的阈值 $Q_\gamma$ 与 $N$ 无关，所以 $N\ge N_0\iff Q\ge Q_\gamma$ 给出 $N_0=\lceil Q_\gamma/3\rceil+1$ 之类的存在性阈值——这正是为什么推论只需要"$N$ 充分大"。若固定 $Q$ 让 $N$ 增长则做不到。

**(c) 常数.** $1/25$ 是纯展示常数：$\gamma_*=4.6167\cdot10^{-2}>0.04=1/25$，余量 $6.167\cdot10^{-3}$。写 $1/25$ 而不是 $\gamma_*$ 的物理理由：$1/25$ 是无量纲"绝对"隙，不依赖 $\gamma$ 的选取方式。`[推测]` 选 25 而不是 20，是为了让 $\gamma_*>1/25$ 的验证在 `norm_num`/`decide` 里一行完成（`Fock/SharpGap.lean` 的 `one_twenty_fifth_lt_gammaStar`）。

**(d) [推测] 候选失败路线.**
- 路线 A：用 thm:fock 直接得"$H_{N,Q}$ 的第二特征值 $\ge1/25$"。文本证据：01 节明确划界 "In a particle sector without a zero mode, this statement bounds the energy away from zero; it does not assert a gap between that sector's two lowest eigenvalues." 也就是没有 lem:kernel 就没有推论——这解释了 lem:kernel 为什么必须单独证明（多项式互素论证）。
- 路线 B：把 $P_{\mathrm L,N}$ 换成"零空间投影"而不先证零空间是一维。若 $\ker H_{N,Q}$ 维数 $>1$，$I-P_{\ker}$ 版本仍能证，但"gap above the Laughlin state"的物理陈述就失效。`Lean:` `Model.lean` 用 `distanceToLaughlinSq`（到 Laughlin 射线的欧氏距离）而不是到核的距离，配合 `Tensor/KernelReadout.lean`，说明形式化必须走"射线"而非"核"，与论文一致。

### 2.3 定义层：$B(v)$、$\mathcal L_k$、$H_Q=\sum_pB_p^\dagger B_p$（02 节）

原文（逐字）：

> let $B(v)$ be the adjoint of left wedge multiplication by $v$. Thus $B(v)$ is conjugate-linear in $v$, and $B(v\wedge w)=B(w)B(v)$. For an orthonormal basis $e_0,\ldots,e_Q$ of $U_Q$, write $c_j=B(e_j)$. These operators satisfy the canonical anticommutation relations, and $\norm{c_j}\le1$.
> \[ \LL_k(\ket v\bra w)=B(v)^\dagger B(w). \]
> This map preserves positivity, intertwines rotations, acts as the original matrix on $k$ particles, and vanishes on fewer than $k$ particles. Positivity follows by decomposing a positive matrix into a sum of rank-one positive matrices.
> \[ B_p=B(v_p),\qquad H_Q=\LL_2(\Pi_{V_Q})=\sum_{p=0}^{2Q-2}B_p^\dagger B_p. \]
> Its restriction to $\bigwedge^N U_Q$ is \eqref{eq:physicalH}. Indeed contraction in two specified tensor positions corresponds to $B(v)/\sqrt{\binom N2}$ under the isometric identification of wedge and antisymmetric tensor spaces; summing over the $\binom N2$ unordered pairs gives \eqref{eq:fockH}.

**(b) 补出"系数一"的完整验证.** 论文把这句压缩成一句话，`[补]` 我的重构：记 $A_v^{(ij)}$ 为"在张量槽 $i,j$ 处与 $v$ 做配对收缩"的算子，则 $\sum_{i<j}(A_v^{(ij)})^\dagger A_v^{(ij)}$ 就是 01 节里 rank-one 配对投影之和的"消灭算子"形式。对 Slatter 型基元 $\varphi=e_{a_1}\wedge\cdots\wedge e_{a_N}$：
$$\langle\varphi,\textstyle\sum_{i<j}(|v\rangle\langle v|)_{ij}\varphi\rangle=\sum_{\{i,j\}\subset\mathrm{occ}}|\langle e_i\wedge e_j,\,v\rangle|^2=\|B(v)\varphi\|^2=\langle\varphi,B(v)^\dagger B(v)\varphi\rangle,$$
中间等号是"二体约化密度矩阵在 Slatter 行列式上等于 $\sum_{i<j\in\mathrm{occ}}|ij\rangle\langle ij|$"（迹为 $\binom N2$）。因为两边都是 $N$ 体算子且在 Slatter 基上矩阵元相同，恒等式在整个 $\bigwedge^NU_Q$ 上成立。对 $v_p$ 求和（$\{v_p\}$ 是 $V_Q$ 的 ONB）即得
$$\sum_{i<j}\Pi^{(1)}_{ij}=\sum_pB_p^\dagger B_p=\mathcal L_2(\Pi_{V_Q}).$$
这同时解释了论文那句"$1/\sqrt{\binom N2}$"：它是使 $\binom N2$ 个"指定槽"收缩算子的平方和恰好等于单个 $B(v)^\dagger B(v)$ 的归一化因子（$A^{(ij)}\leftrightarrow B(v)/\sqrt{\binom N2}$，于是 $\sum_{i<j}(A^{(ij)})^\dagger A^{(ij)}\to\binom N2\cdot B(v)^\dagger B(v)/\binom N2$）。

**(c) 为什么 $\|c_j\|\le1$、共轭线性、上三角约定.** $\mathcal L_k$ 用 $\mathcal L_k(|v\rangle\langle w|)=B(v)^\dagger B(w)$：右矢 $|v\rangle$ 对应消灭 $B(v)$，因此 $B$ 对 $v$ 共轭线性是"把 $\langle w|A|v\rangle$ 里两个位置配平"的必要条件（$\mathcal L_k$ 整体是线性的）。"wedges of distinct increasing orthonormal basis vectors have norm one" 这条约定决定了所有 $\sqrt{\cdot}$ 因子：若改成 $e_{i_1}\wedge\cdots\wedge e_{i_n}=\mathrm{Alt}(\cdots)$ 不带 $\sqrt{n!}$ 归一，则 $B(v_p)$ 与 $c_j$ 之间会出现 $\sqrt2$、$\sqrt{6}$ 等因子，lem:pair 与 05 节 $\Delta_Q$ 的所有根式都要重排。`Lean:` 这正是 `Tensor/ExteriorIsometry.lean` 里 `normalizedTensorExterior := (√(n!))⁻¹ • tensorExterior n Q ψ` 存在的原因——Lean 的张量基底不带 $\sqrt{n!}$ 归一，所以要显式插入归一化算子；`normalizedTensorExterior_energy ... = energy ψ` 与 `tensorExterior_energy ... = (n+2)!·energy ψ` 两条定理把这个约定的代价钉死。另外 `Operators/PhysicalFock.lean`/`Fock/Hamiltonian.lean` 的 `sourcePairCreateEnd` 里出现 `/ Real.sqrt 2`，是同一个约定的形式化痕迹。

**(d) [推测] 候选失败路线.**
- 路线 A：直接在张量积空间用 $P^{(1)}_{ij}$ 做全部计算，不引入 $\mathcal L_k$。文本证据：02 节开篇 "The lifting notation below keeps this calculation independent of particle number." —— 明确说明 $\mathcal L_k$ 的作用就是让粒子数无关。若不用升算子，每个引理都要带 $N$，且 $N$ 依赖会泄漏进误差。
- 路线 B：把 $H_Q$ 定义成 $\sum_pB_p^\dagger B_p$ 而**不**验证它等于 01 节的物理和。论文专门加了一句 "We verify its coefficient-one normalization here."，说明作者认为这一句是审稿风险点。
### 2.4 Lemma \label{lem:square}[Normal-ordered square]

> On $\FF_Q$,
> \[ H^2=H+\LL_3\!\left(W_3(W_3^\dagger W_3-I)W_3^\dagger\right)+\LL_4(W_4W_4^\dagger). \]

**(a) 原文证明逐句.**
- "In normal ordering $B_p^\dagger(B_pB_r^\dagger)B_r$, only the two inner annihilators cross the two inner creators."：$H^2=\sum_{p,r}B_p^\dagger B_pB_r^\dagger B_r$，需重排的是中间的 $B_pB_r^\dagger$。
- "Two, one, or zero contractions leave two-, three-, or four-body terms, respectively."
- "On two particles, $H=\Pi_{V_Q}$ is a projection, so the two-body coefficient is $\Pi_{V_Q}$."：$N=2$ 扇区钉住二体系数。
- "The term with no contractions is $\sum_{p,r}B(v_p\wedge v_r)^\dagger B(v_p\wedge v_r)=\LL_4(W_4W_4^\dagger)$. There is no extra factor of two: this sum, and the defining basis of $V_Q\otimes V_Q$, both use ordered pairs."
- "On three particles, $H=W_3W_3^\dagger$, since $W_3$ restricted to $v_p\otimes U_Q$ is the map $B_p^\dagger$ from one to three particles. Subtracting its two-body contribution from $H^2$ therefore determines the remaining coefficient as $(W_3W_3^\dagger)^2-W_3W_3^\dagger=W_3(W_3^\dagger W_3-I)W_3^\dagger$."
- "Normal-ordered coefficients are determined successively by these restrictions, proving the identity on Fock space."

**(b) [补] 逐扇区核验.** 记 $H|_N$ 为限制。
- $N=0,1$：$H|_N=0$，$\mathcal L_k$ 在少于 $k$ 粒子上为零，恒等式 $0=0$ 成立。
- $N=2$：$\mathcal L_3,\mathcal L_4$ 为零，需 $H|_2^2=H|_2$，即 $\Pi_{V_Q}^2=\Pi_{V_Q}$，成立（投影）。
- $N=3$：$\mathcal L_4$ 为零，$\mathcal L_3(X)|_3=X$，需 $H|_3^2=H|_3+W_3(W_3^\dagger W_3-I)W_3^\dagger$；用 $H|_3=W_3W_3^\dagger$ 得右端 $=W_3W_3^\dagger+W_3(W_3^\dagger W_3-I)W_3^\dagger=W_3W_3^\dagger W_3W_3^\dagger=(H|_3)^2$，恒等式自动成立，所以三体系数正是被这个扇区反解出来的。
- $N=4$：需 $\mathcal L_4(W_4W_4^\dagger)|_4=W_4W_4^\dagger$，且 $\mathcal L_3$ 的四体部分与直接展开一致；"successively" 在此真正起作用。
- $N\ge5$：由升算子定义自动扩展。
**独立数值核验**：我按 eq:pair 显式造出 $Q=5$ 的 $\{v_p\}_{p=0}^{8}\subset\bigwedge^2\mathbb C^6$，构造 $B_p$、$H=\sum_pB_p^\dagger B_p$、$W_3,W_4$ 与 $\mathcal L_3,\mathcal L_4$，对全部 $N=0,\dots,6$ 扇区比较 $H^2$ 与右端：最大误差 $1.4\cdot10^{-14}$（$N=5$），$N\le4$ 均 $\le2\cdot10^{-15}$；$\{v_p\}$ 的两两内积与 $\delta_{pr}$ 偏差为 $0$。

**(c) 一个真正的坑：配对消灭算子不满足标量反对易关系.** 若按费米子直觉写 $\{B(v),B(w)^\dagger\}=\langle v,w\rangle I$（$v,w$ 为 2-形式），会算出 $H^2=H+\mathcal L_4(W_4W_4^\dagger)$，丢掉三体项。反例 `[补]`：$U=\mathbb C^3$，$v=e_0\wedge e_1$，$x=e_0\in\bigwedge^1U$。$B(v)^\dagger x=v\wedge x=0$，$B(v)x=0$，故 $\{B(v),B(v)^\dagger\}x=0\ne x=\langle v,v\rangle x$。这个 1-粒子扇区的失效会沿 Fock 空间把整条正常序恒等式带偏，因此"由限制逐级确定系数"不是繁文缛节而是避开该错误的正确证法。`[推测]` 论文的 "two, one, or zero contractions" 是口语化简写，严格含义必须回到扇区限制论证；这解释了为何证明末尾专门补一句 "Normal-ordered coefficients are determined successively by these restrictions"。
另一处常数敏感点：$\mathcal L_4(W_4W_4^\dagger)$ 的基是 $V_Q\otimes V_Q$ 的有序对，论文用 "There is no extra factor of two" 明确拒绝把 $p<r$ 的对称化基当默认；若误用无序基，四体项要乘 2，终盘预算 $\gamma_*$ 直接崩（四体比较 $2\chi$ 与 $E_D$ 是近紧的）。

**(d) [推测] 候选失败路线.**
- 路线 A：一次性 Wick 展开 $\sum_{p,r}B_p^\dagger B_pB_r^\dagger B_r$。见 (c)。文本证据：论文没用这个写法而是逐扇区反解。
- 路线 B：只在固定 $N$ 正常序再把结果"猜"成 Fock 恒等式。文本证据：02 节首句 "The lifting notation below keeps this calculation independent of particle number."。`Lean:` `Fock/NormalSquare.lean` 的 `sourceFockHamiltonian_normal_square` 在 Fock 层面陈述，右端写成 `energy + (contractionForm … complexThreeGram−1).re + Σ_{p,q}‖sourcePairEnd Q q (sourcePairEnd Q p x)‖²`；第三项即 $\mathcal L_4(W_4W_4^\dagger)$ 的双求和显式形式，且用有序 $(p,q)$，与 "ordered pairs" 一一对应。

### 2.5 Lemma \label{lem:pair}[Pair coefficients]

> The coefficient of $e_i\wedge e_j$ in $v_p$, for $i<j$, vanishes unless $i+j=p+1$, and otherwise equals
> \[ v_p(i,j)=(i-j)\sqrt{\frac{(Q)_i(Q)_j\,p!}{Q(2Q-2)_p\,i!j!}}. \]
> For fixed $p,i,j$, its limit is \[ v_p^*(i,j)=(i-j)\sqrt{\frac{p!}{2^p i!j!}}\,\mathbf1_{i+j=p+1}. \]

**(b) 推导补全.** 设定：$v_0=-e_0\wedge e_1$ 是 $V_Q$（自旋 $a=Q-1$）的最高权，$v_p$ 由联合下降 $p$ 次再除以 $\sqrt{(2Q-2)_p\,p!}$ 得到；"自旋 $j$ 上从标号 $p$ 下降到 $p+1$ 的系数是 $\sqrt{(p+1)(2j-p)}$"。
- 联合下降算子 $F=F^{(1)}+F^{(2)}$ 作用在两个张量槽上，两项交换，故 $F^p=\sum_r\binom pr F^{(1)r}F^{(2)(p-r)}$；
- 单槽下降：迭代 $\sqrt{(s+1)(2j-s)}$ 给 $F^r e_0=\sqrt{(Q)_r}\,e_r$（等价于 $\sqrt{r!\binom Qr}$）；
- 反对称化后 $e_i\wedge e_j$ 的系数是两个贡献之和（$i$ 来自第一槽与来自第二槽），符号相反，这就是因子 $(i-j)$ 的来源；
- 除以 $\sqrt{(2Q-2)_p p!}$：自旋 $a=Q-1$ 上 $p$ 次下降的模方为 $(2a)(2a-1)\cdots(2a-p+1)\cdot p!=(2Q-2)_p p!$，所以 $v_p$ 自动单位模。合并即 eq:pair。
**一次真实踩坑的记录** `[补]`：我第一次手算把 $Fe_1$ 当成 $2e_1$（应为 $\sqrt{(1)(2Q-1)}e_2=\sqrt6\,e_2$，$Q=5$），又对起点为 $e_1$ 的槽误用了最高权处的下降公式（漏因子 $\sqrt{j!(Q-1)_{j-1}}$）。随后用完整数值验证（$Q=5$，eq:pair 与逐点下降结果偏差最大 $10^{-16}$）确认论文公式正确。**这类"下降系数依赖当前标号"的错误是本引理最容易发生的失败模式**，与 08 节里 $\sigma(x,y,j,k)$ 排序符号的繁琐是同一问题的两个侧面。
- 归一化的独立检验（论文给出）：系数平方为 $(i-j)^2\binom Qi\binom Qj/(Q\binom{2Q-2}p)$，且 $\sum_{i,j}(i-j)^2\binom Qi\binom Qj x^{i+j}=2Qx(1+x)^{2Q-2}$；取 $x^{p+1}$ 系数并对 $i<j$ 折半即得 $\sum_{i<j}|v_p(i,j)|^2=1$。`[补]` 母函数等式来源：$\sum_i i\binom Qi x^i=xQ(1+x)^{Q-1}$，故 $\sum_{i,j}(i-j)^2=x\frac{d}{dx}[xQ(1+x)^{Q-1}]\,(1+x)^Q+(1+x)^Q\,x\frac{d}{dx}[xQ(1+x)^{Q-1}]-2[xQ(1+x)^{Q-1}]^2$，化简为 $2Qx(1+x)^{2Q-2}$；右端 $x^{p+1}$ 系数为 $2Q\binom{2Q-2}{p}$，与分母 $Q\binom{2Q-2}{p}$ 配合给 2，折半得 1。
- 极限：$i+j=p+1$ 固定时 $(Q)_i(Q)_j\to Q^{i+j}=Q^{p+1}$、$(2Q-2)_p\to(2Q)^p$，故 $(Q)_i(Q)_j/(Q(2Q-2)_p)\to2^{-p}$，得 eq:pairstar。

**(c) 指标与指数的机械理由.** "$i+j=p+1$" 是权守恒：$v_p$ 的权为 $(Q-1)-p$（$v_0$ 权 $Q-1$ 下降 $p$），$e_i\wedge e_j$ 的权为 $(Q-2i)+(Q-2j)$ 除以 2 的规范化形式，等式给出 $i+j=p+1$。极限里保留 $\mathbf1_{i+j=p+1}$ 表达"总指标固定"，正是 05 节 $\Delta_Q$ 换元能对**角**的原因（换元是逐标号乘 $d_Q(x)$，只有总指标守恒的算子才能被对角缩放共轭回去）。因子 $(i-j)$ 编码反对称与相位：去掉它我实测 $\{v_p\}$ 不再两两正交。
**07 节的复用**：$v_p^{\mathrm{pl}}(i,j)=(i-j)\sqrt{p!/(2^pi!j!)}\mathbf1_{i+j=p+1}$ 与 eq:pairstar 逐字相同（论文原话 "exactly the limits in \eqref{eq:pairstar}"），这是平面推论的全部技术接口。

**(d) [推测] 候选失败路线.**
- 路线 A：直接引 CG 表而不显式推导。文本证据：03 节先承认系数可由角动量耦合表达并引用 `OrtizNussinovDukelskySeidel` 的 Section II.C 与 Appendix A，紧接着写 "We derive the particular coefficients and fixed-deficit limits needed here to keep their **phases and normalization** explicit." 说明文献里的相位/归一约定不足以直接引用。
- 路线 B：改相位约定（取 $v_0=+e_0\wedge e_1$ 或 $B(v\wedge w)=B(v)B(w)$）。文本证据：02 节特意写出 "$B(v\wedge w)=B(w)B(v)$" 且 03 节写出 "$v_0=-e_0\wedge e_1$"，`[推测]` 目的是让 eq:pair 的 $(i-j)$ 与 08 节 $L_r(A)$ 里的 $\sigma(x,y,j,k)(x-y)$ 精确相消（论文 "To verify the cancellation…" 一段就是在核对这个）。

`Lean:` `Pair/CoefficientSquare.lean` 的 `pairCoefficient_sq_choose`（系数平方的二项式形式）、`Pair/Normalization.lean` 的 `pairCoefficient_unit_norm`（依赖 `PairBinomial.pair_binomial_moment`，即上面母函数等式的系数形式）、`Pair/Conjugation.lean` 的 `pairLimitCoefficient`/`pairCoefficient_conjugation`、`Pair/FactorLimit.lean` 的 `modeFactor_tendsto`/`pairFactor_tendsto`。`Model.lean` 的 `pairCoefficient` 带 `/ Real.sqrt 2`，是张量基与楔基约定差的形式化补偿。

### 2.6 Lemma \label{lem:q}[Three-body Gram eigenvalues]

> \[ W_3^\dagger W_3-I=\sum_{z=0}^Qq_z(Q)R_{3,z},\qquad q_z(Q)=(-1)^z\frac{(Q)_z}{(2Q-2)_z}\left(3z-1-\frac{z(z+1)}Q\right). \]
> In particular $W_3R_{3,z}=0$ for $z=0,1,3$ whenever these indices are allowed. For fixed $z$, \[ q_z(Q)\longrightarrow(3z-1)(-1/2)^z. \]

**(b) 证明逐步展开.**
1. 把 $V_Q\otimes U_Q$ 识别为"前两槽反对称"的张量空间；在此识别下 $W_3(v\otimes u)=v\wedge u$ 等于 $\sqrt3$ 倍全反对称化。原文："Identify $V_Q\otimes U_Q$ with tensors antisymmetric in their first two positions. Then $W_3$ is $\sqrt3$ times full antisymmetrization." `[补]` 因子 $\sqrt3$ 的作用：它是使 $W_3$ 成为"等距到其像的 $3$-倍覆盖"的归一，也是后面 $q_z$ 括号里 "$(3z-1)$" 中那个 3 的来源之一。
2. "Its Gram operator is the compression of $I-P_{13}-P_{23}$, where $P_{ij}$ swaps tensor positions." `[补]` 理由：$\sqrt3\mathrm{Alt}_3$ 的 Gram 是 $3(I-\sum_{\text{transpositions}}P+\cdots)$ 压缩到前两槽反对称子空间；因 $P_{12}=-I$ 在该子空间上，含 $P_{12}$ 的三项（$P_{12}$、$P_{123}$、$P_{132}$）合并为 $\pm I$ 与 $P_{13}P_{23}$ 类项，最终化简为 $I-P_{13}-P_{23}$ 的压缩。
3. "The two swap compressions coincide, since conjugation by $P_{12}$ interchanges them and $P_{12}=-I$ on the domain."：$P_{12}P_{13}P_{12}=P_{23}$，故 $\langle\xi,P_{13}\xi\rangle=\langle\xi,P_{23}\xi\rangle$，于是 $W_3^\dagger W_3-I=-2P_{23}$（压缩意义下）。
4. 等变性 + 重数自由 ⇒ 在每个自旋块 $R_{3,z}$ 上是标量 $b_z$，故 $W_3^\dagger W_3-I=\sum_z q_z(Q)R_{3,z}$ 且 $q_z=-2b_z$。
5. 最高权向量 $\xi_z=\sum_{p=0}^zs_pv_p\otimes e_{z-p}$ 满足（eq:highest-ratio）
\[ \frac{s_{p+1}}{s_p}=-\sqrt{\frac{(z-p)(Q-z+p+1)}{(p+1)(2Q-2-p)}}. \]
`[补]` 来源：上升算子 $F=F^{(1)}+F^{(2)}$ 作用在 $\xi_z$ 上为零；$F^{(1)}$ 把 $v_p$ 抬到 $v_{p-1}$（系数 $\sqrt{p(2Q-1-p)}$ 型），$F^{(2)}$ 把 $e_{z-p}$ 抬到 $e_{z-p-1}$（系数 $\sqrt{(z-p)(2Q-(z-p)-?)}$），合并同 $v_{p}\otimes e_{z-p-1}$ 项即得该比式。论文只说 "This follows by applying the raising operator."
6. 迭代比式得两条闭式（论文明写）：
\[ \frac{s_z}{s_0}=(-1)^z\sqrt{\frac{(Q)_z}{(2Q-2)_z}},\qquad \frac{s_{z-1}}{s_0}=(-1)^{z-1}\sqrt{\frac{z(Q-1)_{z-1}}{(2Q-2)_{z-1}}}\quad(z\ge1). \]
`[补]` 检验 $z=1$：比式给 $s_1/s_0=-\sqrt{(1)(Q)/(1(2Q-2))}=-\sqrt{Q/(2Q-2)}$；闭式给 $-\sqrt{(Q-1)_0/(2Q-2)_0}=-1$？两者不等 ⇒ 闭式对 $s_{z-1}$ 的写法只在 $z$ 固定时给出 $s_{z-1}/s_0$ 的正确值：把比式连乘 $p=0,\dots,z-2$ 得 $s_{z-1}/s_0=(-1)^{z-1}\sqrt{(z-1)!\cdots}$，论文给的是化简后含 $z(Q-1)_{z-1}$ 的形式。**这里是我在核验时最易读错的一行**：闭式来自连乘后的合并，不是把 $z$ 换成 $z-1$ 代入第一条。
7. 用 $v_0=(-e_0\otimes e_1+e_1\otimes e_0)/\sqrt2$：把 $P_{23}\xi_z$ 与 $v_0\otimes e_z$ 配对时只有两个有序三元组 $(0,z,1)$、$(1,z,0)$ 贡献，其配对标号分别是 $z-1$ 与 $z$（$z=0$ 时第一个不存在），代入 eq:pair 得
\[ s_0b_z=\frac12\Big[s_{z-1}\sqrt{\frac{z(Q)_z}{Q(2Q-2)_{z-1}}}-s_z(z-1)\sqrt{\frac{(Q)_z}{(2Q-2)_z}}\Big]. \]
`[补]` 因子 $1/2$ = $v_0$ 展开进有序张量基的 $1/\sqrt2$ 与 eq:pair 换回楔基的另一个 $1/\sqrt2$；两项符号相反来自 $(i-j)$ 与 $v_0$ 的负号。把第 6 步代进去并整理 $(Q-1)_{z-1}=(Q)_z/(Q-z+1)$ 之类阶乘比，即得 $b_z=-q_z(Q)/2$。论文一句 "Substitution gives $q_z=-2b_z$ in the form \eqref{eq:q}"，省略的就是这段纯阶乘代数。
8. 三个零扇区：$q_0=q_1=q_3=-1$ 代入即得，即 $W_3R_{3,z}=0$。$z=0,1$ 是 $\bigwedge^3$ 中不存在的自旋（度数计数），$z=3$ 是"三个粒子已经处在相互作用通道"的排除。
9. 极限：$(Q)_z/(2Q-2)_z\to2^{-z}$，$z(z+1)/Q\to0$，故 $q_z(Q)\to(3z-1)(-1/2)^z$ ✓。

**(c) 指标范围的机械理由.** 张量积分解规则："The elementary tensor product rule decomposes spins $j_1,j_2$ into one copy of each spin $j_1+j_2-z$, for $0\le z\le\min(2j_1,2j_2)$." 这里 $j_1=(Q-1)/2$、$j_2=Q/2$，故 $2j_1=2Q-2$、$2j_2=Q$，$\min=Q$（$Q\ge2$）——这就是 "For $Q\ge2$, the allowed indices are $0\le z\le Q$" 的**唯一**理由，且它依赖 $Q\ge2$（$Q=1$ 时 $2j_1=0<Q$，规则反转）。`[补]` 论文还给了组合学论证："the sum of these dimensions is $(2j_1+1)(2j_2+1)$, exhausting the tensor product"，即 $\sum_{z=0}^{Q}(3Q-1-2z)=(Q+1)(2Q-1)$ ✓（左端 $=(Q+1)(3Q-1)-2\cdot\frac{Q(Q+1)}2=(Q+1)(2Q-1)$）。这条求和恒等式也解释了 $d_{3,z}=3Q-1-2z$ 只能是这个形式。
**为什么 $d_a=2Q-1$ 出现**：它是 $\dim V_Q=2a+1=2Q-1$，04 节用它作 Haar 前的整体倍数，使 $\mathbb K_Q$ 的二体部分恰为 $\eta H_Q$（$\mathcal L_2$ 的平均给 $\Pi_{V_Q}/d_a$ 再乘 $d_a$）。
**独立数值核验**：$Q=5$ 时我对 $54\times54$ 的 $W_3^\dagger W_3$ 对角化，特征值集合 $\{0,\,0.857143,\,1.5,\,2.357143\}$ 与 $\{1+q_z\}_{z=0}^{5}$ 完全一致；按 $d_{3,z}=14,12,10,8,6,4$ 展开排序后最大偏差 $2.7\cdot10^{-15}$；$q_0,q_1,q_3$ 精确等于 $-1$。

**(d) [推测] 候选失败路线.**
- 路线 A：不对 $W_3^\dagger W_3$ 精确对角化，改用数值有限尺寸拟合三体比较常数。文本证据：01 节 "The three-body blocks have an explicit spectrum and a summable tail."；08 节 Remark "No many-particle finite-size spectrum, numerical extrapolation, or assumed plasma property enters the argument." 精确谱是"可求和尾巴"的前提（$\delta_Q$ 的定义直接是 $\sum_z\frac{d_{3,z}}{d_a}|q_z(Q)|(z+1)$）。
- 路线 B：把 $z$ 的求和截断成有限项而宣称其余为正可丢。文本证据：奇 $z$ 的 $q_z<0$ 使 $z\ge16$ 的项是负的，必须用 lem:tail 以 $-\delta_QH$ 吸收；终盘 $\gamma_*$ 里显式出现 $-61/4096$。
- 路线 C：误认为 $z=2$ 给出正贡献就直接写 $W_3^\dagger W_3\ge I$。文本证据：$q_5<0$ 等交替符号说明逐块正性不成立，必须分块处理。
`Lean:` `ThreeBody/Gram.lean`（分块）、`ThreeBody/NullFormula.lean`（`gramEigenvalueFormula_zero/one/three` 三条 $q_z=-1$ 的独立命名，正是论文 "In particular $W_3R_{3,z}=0$ for $z=0,1,3$" 的形式化痕迹）、`Asymptotics/Bound.lean` 的 `gramEigenvalueFormula` / `gramEigenvalueFormula_abs_le`（把 $|q_z|$ 用 $(2/3)^z$ 界住，对应 lem:tail 里的控制项）、`Asymptotics/Convergence.lean` 的 `deltaFormula_tendsto`。

### 2.7 Lemma \label{lem:coupling}[Fixed-deficit coupling limit]

> Suppose $j_1,j_2\to\infty$ and $j_2/(j_1+j_2)\to u^2$, where $0<u<1$. Put $v=\sqrt{1-u^2}$. For fixed integers $0\le z\le T$, the normalized coupled vector of spin $j_1+j_2-z$ at total lowering deficit $T$ can be chosen with real coefficients converging to the coefficients $s^{(u)}_{z,T,p}$ of
> \[ \frac{(uX-vY)^z(vX+uY)^{T-z}}{\sqrt{z!(T-z)!}}. \]
> Descendants in every copy are obtained by normalized lowering, so the matching of bases between equal-spin copies is intertwining.

前置约定（逐字）："Coefficients below are with respect to normalized monomials $X^pY^{T-p}/\sqrt{p!(T-p)!}$, and are zero outside the stated index ranges."

**(b) 证明展开.**
- $T=z$（最高权）时上升方程给相邻比
\[ -\sqrt{\frac{(z-p)(2j_2-z+p+1)}{(p+1)(2j_1-p)}}. \]
`[补]` 与 lem:q 的 eq:highest-ratio 同形：那里 $2j_1=2Q-2$、$Q=2j_2$，即 $j_2/(j_1+j_2)\to1/2$ 对应 $u=v=1/\sqrt2$ 之外的特例；本引理的"通用化"就是把 $Q$ 相关的固定比值换成自由参数 $u$。
- 在 $p=0$ 处取符号 $(-1)^z$，$j_1,j_2\to\infty$ 且 $j_2/(j_1+j_2)\to u^2$ 时比式趋于 $-\frac{u}{v}\cdot\frac{\sqrt{z-p}}{\sqrt{p+1}}$ 型，逐点积分得 $(uX-vY)^z/\sqrt{z!}$ 的系数；
- 正交性保证归一："The change of variables $(X,Y)\mapsto(uX-vY,vX+uY)$ is orthogonal, so these polynomials have norm one in the normalized-monomial inner product." `[补]` 这一步是关键的"免费"归一：正交替换保持 Bargmann/Fock–Segal 内积，所以不必再算二项式平方和。
- 下降：从亏缺 $T$ 到 $T+1$ 的归一化下降把两个槽的下降算子之和除以
\[ \sqrt{(T-z+1)\{2(j_1+j_2-z)-(T-z)\}}, \]
极限下该算子等于乘以 $(vX+uY)/\sqrt{T-z+1}$，对 $T$ 归纳即得全部后代。
- 末句 "so the matching of bases between equal-spin copies is intertwining" 是为 04 节 $\mathcal R_D$ 里多个同自旋副本服务的：不同副本用同一 $u$ 的极限基，才能保证 $S_r$ 系数的极限存在且副本间比较一致。

**(c) 两次使用与 $u$ 的取值.** 三体：$j_1=(Q-1)/2$（$V_Q$）、$j_2=Q/2$（$U_Q$），$j_2/(j_1+j_2)=Q/(2Q-1)\to1/2$？但论文在三体 $e_z$ 公式里用 $u=1/\sqrt3$（"$s^{(1/\sqrt3)}$"）。`[补]` 原因：三体比较里参与耦合的是"配对 $V_Q$"与"$U_Q$"的**总度数分配**，$e_z$ 的推导实际是把 $F_\rho$ 的三体项写成两体收缩后再耦合，其权重比 $\to1/3$。08 节写 $s^{(1/\sqrt3)}_{z,T,p}=\mathsf U(2,z,T,p)\sqrt{2^z\binom Tz/(3^T2^p\binom Tp)}$，其中的 $3^T$ 直接暴露 $u^2=1/3$。四体：$u=1/\sqrt2$，对应 08 节 $\mathsf V_r$ 里的 $\mathsf U(1,\cdot,\cdot,\cdot)$ 与 $2$ 的幂（我按 rows.txt 复算 $e_z$ 表时，正是 $2^{(z-p)/2}$ 这一项必须存在才能逐位对上 1298313 等整数）。
$0<u<1$ 的开区间限制：$u=0,1$ 时 $(uX-vY)$ 退化为一项，极限基不再有-full 支撑，公式里的 $\sqrt{z!(T-z)!}$ 归一失效。

**(d) [推测] 候选失败路线.**
- 路线 A：直接对有限 $Q$ 的 CG 系数做渐近展开而不引入 $u$ 参数化。文本证据：论文把该极限单列为一条引理并强调 "We will repeatedly use a fixed-deficit limit of this same calculation."（重复使用 = 三体 $e_z$ 与四体 $S_r$ 两处），参数化 $u$ 是为了两处共用一条引理。
- 路线 B：允许 $z=z(Q)$ 随 $Q$ 增长地取极限。文本证据："For **fixed** integers $0\le z\le T$"；四体部分另有 "only $1\le D\le23$ since $T=p+j+k=q+l+i\le23$"，即极限只在有限指标集上被使用，尾部由 lem:tail/lem:transfer 的正性丢弃。`Lean:` 渐近语句在 `Asymptotics/` 与 `Spin/` 里以 `tendsto_*` 形式出现（`Spin` 模块 54 文件 3593 行，是除 FiniteFlux 外最大的模块，说明耦合极限的形式化负担主要落在它身上）。

### 2.8 Schur 平均规则（04 节开篇，无编号断言）

> Haar measure $dg$ on $SU(2)$ is normalized to have total mass one. For an operator $A$, write $A(g)=U(g)AU(g)^\dagger$, with the appropriate Fock representation. Schur averaging sends a rank-one operator on an irreducible spin-$j$ space to its trace times $I/(2j+1)$. For several equivalent copies, it acts in the same way on the spin factor and retains the matrix between copies. Explicitly, if the representation is $\bigoplus_j(V_j\otimes\mathbb C^{m_j})$ and $P_j$ is its spin-$j$ projection, then
> \[ \int U(g)XU(g)^\dagger\,dg=\bigoplus_j\frac{I_{V_j}}{2j+1}\otimes\operatorname{Tr}_{V_j}(P_jXP_j). \]
> Here $\operatorname{Tr}_{V_j}$ is the partial trace over the spin factor. This follows from Schur's lemma applied to each pair of irreducible copies, with the scalar fixed by its trace; see \cite[Section~II.C]{BartlettRudolphSpekkens}. In particular, averaging preserves off-diagonal entries between equivalent spin copies.

**(b) [补] 为什么是"保留副本矩阵"而不是"对角化".** 设 $X$ 在 $V_j\otimes\mathbb C^{m}$ 上的矩阵元为 $X_{(\alpha r),(\beta s)}$（$\alpha,\beta$ 自旋指标，$r,s$ 副本指标）。平均后 $\int U(g)XU(g)^\dagger dg$ 与所有 $U(h)$ 交换，故属于 $\mathrm{End}_{SU(2)}(V_j\otimes\mathbb C^m)=\mathbb C\cdot I_{V_j}\otimes M_m(\mathbb C)$，形如 $I_{V_j}\otimes Y$；取 $\mathrm{Tr}_{V_j}$ 定标 $Y=\mathrm{Tr}_{V_j}(X)\cdot\frac{1}{2j+1}\cdot(2j+1)$ 归一后即得公式。**关键**：$Y$ 的 $m\times m$ 矩阵可以非对角——这正是"多重副本必须保留相干项"的数学根据，也是 04 节四体部分需要 $d_D$ 维自旋因子与 $\mathcal R_D$ 维副本因子张量积结构的原因。

**(c) 归一与常数的机械理由.** "total mass one" 决定所有平均后系数不带 $|SU(2)|$；$\frac{1}{2j+1}$ 是 $\dim V_j$ 的倒数，所以 $\mathbb K_Q$ 前显式写的 $d_a=2Q-1$ 恰好把它抵消（见 2.10 的 $A_2=\eta H$）。若平均归一取成别的（比如 $\int dg=1$ 但用 $I/(2j+1)^2$），$\eta$、$e_z$、$E_D$ 全部要重标，终盘 $\gamma_*$ 会变。

**(d) [推测] 候选失败路线.**
- 路线 A：把平均算子当成"对每个自旋块取标量、副本矩阵丢掉"。文本证据：作者专门补了两句——"and retains the matrix between copies" 与 "In particular, averaging preserves off-diagonal entries between equivalent spin copies."，并且 01 节预先警告 "Their four-particle images under exterior multiplication can be linearly dependent." 若丢相干项，四体比较就退化成逐副本不等式，误差要按副本数放大（正对应 prop:A4 里被 Bessel 消掉的那个因子）。
- 路线 B：用 $SO(3)$ 或投影表示的其它旋转群版本。`[推测]` 用 $SU(2)$ 是因为 $U_Q$ 对奇偶 $Q$ 都需要旋量表示；且 Haar 归一在 $SU(2)$ 上写作 1 最自然。`Lean:` 形式化里没有真的做群积分（见第四节 $\mathbb K_Q$ 一节），而是直接用 Schur 平均后的**结果**（分块 + 副本矩阵），把积分替换成有限维矩阵论证。

### 2.9 比较算子 $\mathcal K_Q$ 与七行平方 $F_\rho$（eq:F）

> For each of the seven rows in Appendix~\ref{app:certificate}, the integer $t_\rho$ lies in $\{0,\ldots,7\}$. Set
> \[ \mathcal S_\rho=\{(p,j)\in\mathbb Z^2:0\le p\le7,\ 0\le j\le8,\ 0\le p+j-t_\rho\le8\}. \]
> The row specifies real coefficients $\lambda_\rho$ and $\alpha^\rho_{pj}$ for $(p,j)\in\mathcal S_\rho$; unlisted entries are zero. Every coefficient sum for row $\rho$ below is over $\mathcal S_\rho$. Our comparison operator is
> \[ K=\sum_{\rho=1}^7F_\rho^\dagger F_\rho,\qquad F_\rho=\lambda_\rho B_{t_\rho}+\sum_{(p,j)\in\mathcal S_\rho}\alpha^{\rho}_{pj}\,c_{p+j-t_\rho}^\dagger c_jB_p. \]
> Each summand of $F_\rho$ removes two particles and decreases the sum of occupied orbital labels by $t_\rho+1$: for the second term the decrease is $(p+1)+j-(p+j-t_\rho)=t_\rho+1$. This common weight allows the two parts to interfere in their square, adjusting the three-body comparison at the two-body cost $\lambda_\rho^2B_{t_\rho}^\dagger B_{t_\rho}$.
> Only modes $0,\ldots,8$ occur in these auxiliary squares.

**(b) [补] 权重记账的来源.** "label sum 减少 $t_\rho+1$" 用的是 lem:pair 的 $i+j=p+1$：配对 $v_p$ 承载的轨道标号之和恒为 $p+1$。于是 $c_jB_p$ 移除的标号和是 $(p+1)+j$，$c_{p+j-t}^\dagger$ 加回 $p+j-t$，净减少 $t+1$；而 $B_t$ 移除标号和 $t+1$。两者同权 ⇒ 在平方里交叉项 nonzero（否则不同权的算子平方后的交叉项是权不守恒的零算子）。
**这条记账是 $F_\rho$ 结构的承重墙**：$\alpha$ 项被设计成"三体消灭 + 一体创造"（净 $-2$ 粒子、净权 $-(t+1)$），恰好与 $B_t$ 同一个"权/粒子数"格点，所以一个 $\lambda^2B_t^\dagger B_t$（纯二体代价）就能换来一个可调的三体干涉项。01 节原话："where each \(F_\rho\) is a specified linear combination of a pair annihilator and operators that annihilate three particles and create one."

**(c) 为什么只有 0..8 这几个模式.** $\mathcal S_\rho$ 的三条界 $0\le p\le7$、$0\le j\le8$、$0\le p+j-t_\rho\le8$ 是设计者选的**有限搜索盒**：模式 ≤ 8 保证四体的总指标 $T=p+j+k\le 7+8+8=23$（论文用 $T\le23$ 导出"只有 $1\le D\le23$"，进而 23 个证书）。`[补]` 若允许 $p\le9$，$T\le25$，$D$ 的证书要增加到 25 个，`FiniteFlux` 的规模（现 931 文件 55080 行）会按 $O(D^3)$ 增长；反过来缩小盒子会让 $\eta$ 变差、$\gamma_*$ 缩小甚至为负。
"the Hamiltonian itself is never truncated"（01 节）与 "Only modes $0,\ldots,8$ occur in these auxiliary squares"（本节）是配套的两句：$H_Q=\sum_{p=0}^{2Q-2}B_p^\dagger B_p$ 永远取全和，只有 $F_\rho$ 用低模式。旋转平均把低模式的信息散布到全部 $2Q-1$ 个模式上——这就是"不截断相互作用"的实现机制。

**(d) [推测] 候选失败路线.**
- 路线 A：只用纯二体平方（$\lambda$ 项）作比较。则 $A_3=0$，而 $H^2$ 的三体部分 $\mathcal L_3(W_3(W_3^\dagger W_3-I)W_3^\dagger)$ 在奇 $z$ 上为负，必须整体吞进 $\gamma H$ 的余量，很可能把 $\gamma_*$ 压成负数。文本证据：$F_\rho$ 的两部分"干涉"被专门解释，说明 $\alpha$ 项的存在目的正是匹配三体。
- 路线 B：用非齐次（多个权）的 $F_\rho$。则交叉项消失或产生不可控的权迁移，$A_2+A_3+A_4$ 的分层（eq:Adecomp）不成立。
- 路线 C：把系数取成代数无理数以获得更好的 $\eta$。文本证据：08 节明确 $\alpha_{pj}=\frac{a_{pj}}P\sqrt{2^{p-t}t!(p+j-t)!/(p!j!)}$，即 $\alpha$ 是"有理数 × 固定根式"，且 $a_{pj}\in\mathbb Z$、$P=10^7$。这样 $P^2Y_{rs}$、$e_z$ 等全部落在有理数里（$\sqrt{\cdot}$ 在两两相乘时被消掉，见 2.23 的"cancellation check"），从而可用精确有理算术与 `decide`。若取任意实系数，证书就无法机检。
`Lean:` `Operators/Certificate.lean` 里 `rows` 把七行整数数据直接作为 Lean 数据（`t`、`ℓ`、`(p,j,a)` 列表）；`ThreeBody/Basic.lean` 的 `U`/`X`/`e`/`limitBound` 用同一份数据定义 $e_z$；`eta_numerator := ... = 93527408868499 := by decide`。

### 2.10 单个 $F^\dagger F$ 的正常序分解（eq:normal2/3/4）与 $A_2=\eta H$

> For a single row, omit $\rho$ and put $i=p+j-t$, $k=q+l-t$. Define
> \[ O_{p,j,k}=B(v_p\wedge e_j\wedge e_k)=c_kc_jB_p. \]
> Reordering $c_ic_k^\dagger=\delta_{ik}-c_k^\dagger c_i$ gives the two-, three-, and four-body terms of $F^\dagger F$:
> \[ \lambda^2 B_t^\dagger B_t,\tag{normal2} \]
> \[ \sum_{p,j}\lambda\alpha_{pj}\left[(c_iB_t)^\dagger c_jB_p+(c_jB_p)^\dagger c_iB_t\right]+\sum_{p,j;q,l}\alpha_{pj}\alpha_{ql}\delta_{ik}(c_jB_p)^\dagger c_lB_q,\tag{normal3} \]
> \[ -\sum_{p,j;q,l}\alpha_{pj}\alpha_{ql}O_{p,j,k}^\dagger O_{q,l,i}.\tag{normal4} \]
> Let $A_2,A_3,A_4$ denote these terms, summed over rows and averaged with factor $d_a$. Thus
> \[ \mathcal K_Q:=d_a\int K(g)\,dg=A_2+A_3+A_4,\qquad A_2=\eta H,\quad\eta=\sum_\rho\lambda_\rho^2. \]

**(b) [补] 逐条推导.** 写 $T_\rho=\sum_{(p,j)}\alpha_{pj}c_i^\dagger c_jB_p$（$i=p+j-t$）。
- $F^\dagger F=(\lambda B_t)^\dagger(\lambda B_t)+\lambda(B_t)^\dagger T+\lambda T^\dagger B_t+T^\dagger T$。
- 交叉项：$\lambda B_t^\dagger c_i^\dagger c_jB_p=\lambda(c_ic_j\cdots)$ —— 因为 $B_t^\dagger c_i^\dagger=(c_iB_t)^\dagger$，得 $(c_iB_t)^\dagger c_jB_p$ 一项；其伴随给第二项 ✓ 正是 normal3 的第一个求和。这里用到 $c_iB_t=B(e_i\wedge v_t)\cdot(\pm1)$，由 02 节 $B(v\wedge w)=B(w)B(v)$：$B(v_t\wedge e_i)=B(e_i)B(v_t)=c_iB_t$ ✓ 所以 $c_iB_t$ 是"三体消灭算子"，$(c_iB_t)^\dagger c_jB_p$ 有 3 个创造与 3 个消灭算子 ⇒ 三体 ✓。
- $T^\dagger T$：$B_p^\dagger c_j^\dagger c_ic_k^\dagger c_lB_q$，用 $c_ic_k^\dagger=\delta_{ik}-c_k^\dagger c_i$：
 $\delta_{ik}$ 项 $=\sum\alpha_{pj}\alpha_{ql}\delta_{ik}(c_jB_p)^\dagger c_lB_q$ ✓（3 创造 3 消灭 ⇒ 三体）；
 剩余项 $=-B_p^\dagger c_j^\dagger c_k^\dagger c_ic_lB_q=-O_{p,j,k}^\dagger O_{q,l,i}$ ✓（4/4 ⇒ 四体），即 normal4 的负号**来自 CAR 的减号**，不是额外约定。
- 没有第二次收缩可用，所以二体项只来自 $\lambda^2B_t^\dagger B_t$ ✓。
- $A_2=\eta H$：把 $\sum_\rho\lambda_\rho^2B_{t_\rho}^\dagger B_{t_\rho}=\mathcal L_2\big(\sum_\rho\lambda_\rho^2|v_{t_\rho}\rangle\langle v_{t_\rho}|\big)$ 作平均。矩阵 $\sum_\rho\lambda_\rho^2|v_{t_\rho}\rangle\langle v_{t_\rho}|$ 在不可约 $V_Q$ 上、迹为 $\eta$（$\{v_p\}$ 正交），故 $\int(\cdot)(g)dg=(\eta/d_a)\Pi_{V_Q}$，乘以前面的 $d_a$ 得 $\eta\mathcal L_2(\Pi_{V_Q})=\eta H$ ✓。**注意**：结论只依赖 $\eta=\sum\lambda_\rho^2$，与哪些 $t_\rho$ 被用到无关——这解释了 08 节为什么把验证重心放在"$P^2\eta=\sum\ell_\rho^2=93527408868499$"这一个整数上。

**(c) 常数的临界性.** $\eta$ 越大，终盘 $1-\eta-\cdots$ 越小：$\eta=0.93527408868499$，已经吃掉 93.5% 的余量，剩下 $0.0647$ 里还要付 $61/4096=0.01489\dots$ 与 $1222\varepsilon=0.003666$，得 $\gamma_*=0.046167$。也就是说 $\eta$ 每恶化 $0.02$ 就跌破 $1/25$。`[补]` 我复核：$1-0.93527408868499-0.014892578125-0.003666=0.04617143387…$；论文给 $\gamma_*=0.04616733319001$，差异来自 $\varepsilon$ 项精确定值 $1222\cdot3/10^6=0.0036666$，代回 $1-0.93527408868499-0.014892578125-0.0036666=0.0461667\ldots$ 与 $\gamma_*$ 一致到第 5 位（`[补]` 精确分数：$\gamma_*=\frac{10^{14}-93527408868499-\frac{61}{4096}10^{14}-1222\cdot3\cdot10^{8}}{10^{14}}$；$61/4096\cdot10^{14}=1.4892578125\cdot10^{12}$，写成同分母 $10^{14}$ 为 $14892578125000$；$1222\cdot3/10^6\cdot10^{14}=3.666\cdot10^{11}=366600000000$；$10^{14}-93527408868499-14892578125000-366600000000=4616733319001$ ✓ **逐位对上**）。
`Lean:` `Fock/NormalSquare.lean` 的 `sourceFockHamiltonian_normal_square`（lem:square）+ `ThreeBody/TraceCertificate.lean` 的 `source_threeBody_trace_certificate_identity`（把 unaveraged 矩阵的块迹等于 `Certificate.e z`，即 $e_z^Q$ 的定义）+ `FourBody/PhysicalCertificate.lean` 的 `physicalLimitGram`/`physicalLimitError`（$G_D$、$E_D$ 的形式化定义）。`Operators/` 模块 38 文件 2024 行，其中 `Certificate.lean` 只 55 行就装下了全部七行数据，说明"数据即证书"的组织方式。

### 2.11 三体比较：$A_3$、$e_z$ 与 eq:3certificate

> Before wedging, \eqref{eq:normal3} is a matrix on $V_Q\otimes U_Q$. Its nonzero entries preserve $T=p+j$, and $T\le15$. Averaging therefore gives
> \[ A_3=\LL_3\left(W_3\sum_{z=0}^{15}\frac{d_a}{d_{3,z}}e_z^Q R_{3,z}W_3^\dagger\right), \]
> for all sufficiently large $Q$, where $e_z^Q$ is the trace of the unaveraged matrix in that spin block. By Lemma~\ref{lem:coupling}, with $u=1/\sqrt3$, these traces converge to
> \[ e_z=\sum_\rho\sum_{T=\max(z,t_\rho)}^{15}\left[2\lambda_\rho s_{z,T,t_\rho}\sum_{p+j=T}\alpha^{\rho}_{pj}s_{z,T,p}+\left(\sum_{p+j=T}\alpha^{\rho}_{pj}s_{z,T,p}\right)^2\right], \]
> where $s=s^{(1/\sqrt3)}$ and empty inner sums are zero. The condition $i=k$ in \eqref{eq:normal3} is exactly the equality of the two values of $T$.
> The exact calculation in Appendix~\ref{app:certificate} proves
> \[ e_z<\frac32(3z-1)(-1/2)^z,\qquad z\in\{2,4,5,\ldots,15\}. \]
> There are finitely many strict inequalities, $d_{3,z}/d_a\to3/2$, and the omitted blocks $z=0,1,3$ are annihilated by $W_3$. Consequently, for all sufficiently large $Q$,
> \[ A_3\le\LL_3\left(W_3\sum_{z=0}^{15}q_z(Q)R_{3,z}W_3^\dagger\right). \]

**(b) [补] 结构拆解.**
- "$T=p+j$ 守恒、$T\le15$"：normal3 的两类项里，$(c_iB_t)^\dagger c_jB_p$ 要求 $i$ 与 $j$ 的权匹配（$i=p+j-t$ 已经写死了），所以矩阵只连 $T=p+j=T'=t$ 与 $T'=p+j$；$\alpha$ 的支撑 $p\le7,j\le8$ 给 $T\le15$。**这个 15 是 $\mathcal S_\rho$ 上界的直接产物**，也是 08 节 $e_z$ 求和上限、以及"三体只需 13 条严格不等式（$z=2,4,5,\dots,15$）"的原因。
- $\frac{d_a}{d_{3,z}}$ 的来源：Schur 平均在自旋 $2Q-1-2z\cdot\frac12$ 块上给出 $\frac{I}{d_{3,z}}\otimes(\text{迹})$，而整体乘了 $d_a$，故块系数为 $\frac{d_a}{d_{3,z}}e_z^Q$ ✓。极限 $\frac{d_{3,z}}{d_a}\to\frac32$ 因为 $d_{3,z}=3Q-1-2z\sim3Q$、$d_a=2Q-1\sim2Q$ ✓（对固定 $z$）。
- eq:ez 的两项分别是 normal3 的 $\lambda\alpha$ 交叉项（因子 2 来自"两个厄米共轭项"）与 $\alpha\alpha$ 的 $\delta_{ik}$ 收缩项（完全平方）；$s_{z,T,t_\rho}$ 是把 $B_{t_\rho}$ 那一侧按 lem:coupling 的极限基展开的系数，$\sum_{p+j=T}\alpha_{pj}s_{z,T,p}$ 是 $\alpha$ 侧的同一展开 ✓。"empty inner sums are zero" 处理 $T<t_\rho$ 的边界。
- 不等式右端 $\frac32(3z-1)(-1/2)^z$ 正是 $\lim d_{3,z}/d_a$ 乘 $\lim q_z(Q)$，所以 eq:3certificate 的实际含义就是 $e_z<\lim(q_z\cdot d_{3,z}/d_a)$，配合 $Q$ 有限时的收敛，得 eq:A3bound ✓。**注意 $z$ 为奇时右端为正、$z$ 为偶时为负**：偶 $z$（$z\ge4$）不等式是"$e_z< $ 负数"，即证书必须证明 $e_z$ 足够负，才能吸收 $H^2$ 里负的三体项；$z=2$ 时右端 $=-\frac32\cdot\frac54=-1.875$，是最紧的一条（我复算的下界余量 $1298313\times10^{-6}$ 也最大，说明这条最松）。
- 被跳过的 $z=6,7,\dots$ 不存在——表里是 $2,4,5,\dots,15$，即 $z=3$ 被跳（$W_3R_{3,3}=0$），$z=0,1$ 同理 ✓ 论文原话 "the omitted blocks $z=0,1,3$ are annihilated by $W_3$"。

**(c) 余量与临界性.** 08 节给出 $\lfloor10^6m_z\rfloor$ 表（$m_z=\frac32(3z-1)(-\frac12)^z-e_z$）：$z=2$:1298313，$z=4$:211317，$z=5$ 到 $z=12$ 全是 249/250/249/250/250/250/249/250，$z=13$:250，$z=14$:6470，$z=15$:250。**$z=5$ 与 $z=7$、$z=10$ 处余量只有 $2.49\cdot10^{-4}$/$2.50\cdot10^{-4}$**，说明这些块几乎是等式——数据被"贴脸"优化过。`[推测]` 这解释为什么七行数据不能改动任何一位整数：改动会立刻破坏某条 $m_z>0$。
（我用 rows.txt 复现了这 13 个整数，包括 $\mathsf U(2,z,T,p)$ 与 $2^{(z-p)/2}$、$3^T$ 的组合；见 2.22。）

**(d) [推测] 候选失败路线.**
- 路线 A：让 $e_z$ 与 $q_z$ 直接逐点相等（$\mathcal K_Q$ 精确匹配三体项）。文本证据：不等号是严格小于（$e_z<\cdots$）而非 $\le$，且引入 $\varepsilon$ 只用于四体——三体部分靠严格不等式的"有限性"自然吸收 $o(1)$。若写成 $\le$，就不能直接宣布"对充分大 $Q$ 成立"。
- 路线 B：把三体尾巴 $z>15$ 也塞进证书。文本证据：$T\le15$ 由模式盒给出，$z>15$ 的块无法用这七行数据控制，只能由 lem:tail 以 $-\delta_QH$ 统一吸收；$\delta_Q\to61/4096$ 就是为此付出的代价。
- 路线 C：用 $u=v=1/\sqrt2$ 的对称选择做三体极限。文本证据：论文明写 "with $u=1/\sqrt3$"，而四体用 $1/\sqrt2$；$u$ 由参与耦合的两个自旋的渐近比值决定，$V_Q$（$2j_1=2Q-2$）与 $U_Q$（$2j_2=2Q$）的三体耦合里，第三个粒子的权分布把有效比值推到 $1/3$。选错 $u$ 会让 $e_z$ 整体偏移，13 条不等式不可能全过。

### 2.12 四体比较：副本结构、$S_r$、$E_D$、$\chi$ 与偶 $D$ 消失

> Let $\widehat W:V_Q\otimes\bigwedge^2U_Q\to\bigwedge^4U_Q$ be the wedge map. The second tensor factor decomposes into spins $Q-r$, with $r$ odd, $1\le r\le Q$. In its lowering bases use the sign of Lemma~\ref{lem:coupling}; at $r=1$ this is precisely the basis $v_p$.
> A copy of spin $2Q-1-D$ is obtained by coupling $a=Q-1$ with $Q-r$ at deficit $D-r$. Denote its vector at total deficit $T$ by $\ket{D,T;r}_Q$. Its physical orbital-index sum is $1+T$, and it is a highest vector when $T=D$. For fixed $D,T$ and sufficiently large $Q$, the allowed copy labels are $\mathcal R_D=\{1,3,5,\ldots\}\cap[1,D]$, $D\le T$.
> \[ \ket{D,T;r}_Q=\sum_{\substack{p+j+k=T\\j<k}}S_r^Q(D,T;p,j,k)\,v_p\otimes(e_j\wedge e_k), \]
> and extend them antisymmetrically in $j,k$. By two applications of Lemma~\ref{lem:coupling}, they converge to
> \[ S_r(D,T;p,j,k)=\sqrt2\,s^{(1/\sqrt2)}_{r,j+k,j}\,s^{(1/\sqrt2)}_{D-r,T-r,p}, \]
> interpreted as zero if $r>j+k$. The formula holds for either ordering of $j,k$, by antisymmetry. It follows by applying Lemma~\ref{lem:coupling} first to the two single-particle spins and then to the two pair spins.
> Only $1\le D\le23$ contribute: every unaveraged term has $T=p+j+k=q+l+i\le23$.
> Put $d_D=4Q-1-2D$. In the coupled bases $\ket{D,T;r}_Q$, the spin-$2Q-1-D$ block is identified with $\mathbb C^{d_D}\otimes\mathbb C^{\mathcal R_D}$: the first factor uses the $(T-D)$-th normalized spin descendant, and the second has basis vector indexed by $r$. Let $E_D^Q$ be the partial trace over the spin factor of the compression to this block of the matrix representing \eqref{eq:normal4} before wedging, summed over rows. Schur averaging then gives
> \[ A_4=\LL_4\!\left(\widehat W\left[\bigoplus_{D=1}^{23}\frac{d_a}{d_D}(I_{d_D}\otimes E_D^Q)\right]\widehat W^\dagger\right), \]
> where the direct sum acts as zero on all other spin blocks. For these finitely many $D$, entrywise convergence gives $E_D^Q\to E_D$, with
> \[ (E_D)_{rs}=-\sum_\rho\sum_{\substack{p,j;q,l\\T\ge D}}\alpha^{\rho}_{pj}\alpha^{\rho}_{ql}S_r(D,T;p,j,k)S_s(D,T;q,l,i), \]
> where $i=p+j-t_\rho$, $k=q+l-t_\rho$, and $T=p+j+k$. The exact finite-flux matrix $E_D^Q$ is given by the same formula with each $S_r$ replaced by $S_r^Q$. Exchanging the two ordered entry pairs exchanges $r$ and $s$, so both matrices are real symmetric.
> The target term $\LL_4(W_4W_4^\dagger)$ is obtained from the $r=1$ summand, since that summand is $V_Q\otimes V_Q$. Thus its copy matrix, in the units just used, is $(d_D/d_a)\chi$, where $\chi_{rs}=\mathbf1_{r=s=1}$, $d_D/d_a\to2$.
> For even $D$, the $r=1$ coupled vector is antisymmetric under exchange of its two spin-$a$ factors, since its coupling deficit is $D-1$. Wedging two degree-two vectors is symmetric, so this target column then vanishes after applying $\widehat W$. The formula with $\chi$ still represents it exactly; we never assume that the wedged copy vectors are independent.
> Target spin blocks outside $1\le D\le23$ contribute positively and may be discarded in a lower bound.

**(b) [补] 副本标号 $\mathcal R_D$ 与 $d_D$ 的来源.** $\bigwedge^2U_Q$ 的自旋分解为 $Q-r$（$r$ 奇，$1\le r\le Q$）：因为 $\bigwedge^2$ 的度数 2 且最高自旋 $Q-1$（即 $r=1$，正是 $V_Q$），逐次出现 $r=1,3,5,\dots$。与 $a=Q-1$ 耦合到总自旋 $2Q-1-D$ 需要亏缺 $D$，其中第二因子自带亏缺 $r-1$（$Q-r$ 相对 $Q-1$ 的"降了 $r-1$"），故第一因子的耦合亏缺是 $D-r$，要求 $1\le r\le D$ 且 $r$ 奇 ⇒ $\mathcal R_D=\{1,3,\dots\}\cap[1,D]$，其大小 $n_D=\sum_{n=1}^D\lceil n/2\rceil$ 的闭式 $\lfloor(D+1)^2/4\rfloor$ 在 05 节被用到（见 2.15）。
$d_D=4Q-1-2D$ 是该自旋块的维数 `[补]`：自旋 $2Q-1-D$ 的 $2j+1=2Q-1-D$？不对——块是"自旋 $2Q-1-D$ 空间 $\otimes$ 副本"，$d_D$ 是**每个自旋的磁量子数维数**：论文写"the first factor uses the $(T-D)$-th normalized spin descendant"，即 $d_D$ 是 $\bigwedge^4$ 中权层维数的渐近值。`[补]` 检验：$\bigwedge^4U_Q$ 的轨道标号和为 $1+T$（$\binom{4}{2}$ 的基线 $0+1+2+3=6$？论文用 $1+T$，与配对 $v_p$ 的标号和 $p+1$ 一致），权层维数关于 $Q$ 的首项系数给出 $d_D=4Q-1-2D$；关键只需两点：$d_D/d_a\to2$（用于目标 $2\chi$）与 $d_D$ 单调随 $D$ 减小（$D\le23$ 时 $d_D>0$ 需 $Q\ge12$，与 05 节 $Q\ge24$ 一致 ✓）。
$S_r$ 的 $\sqrt2$：两次用 lem:coupling（先单粒子自旋、再配对自旋），每次带一个正交替换归一，而 $j<k$ 的楔基与有序张量基之间有一个 $\sqrt2$；"interpreted as zero if $r>j+k$" 是 $\mathsf U$ 的定义域约定。
$E_D$ 的负号继承自 normal4 的负号 ✓（$E_D$ 因此是"正的"：$A_4$ 是负二次型，而 $\mathcal K_Q\ge0$ 要求 $A_2+A_3+A_4\ge0$；论文把 $A_4$ 与目标 $\mathcal L_4(W_4W_4^\dagger)$ 比较时，比较对象是 $2\chi-E_D+\varepsilon I$，即"$E_D$ 不能超过目标 $2\chi$"）。
`[补]` 对称性论证（论文给了一句）：交换两个有序指标对 $(p,j)\leftrightarrow(q,l)$ 会把 $r\leftrightarrow s$，所以 $E_D$ 实对称 ✓；同理 08 节强调 "Both entry sums are ordered."（不能对 $p<r$ 折半）。

**(c) 偶 $D$ 的"$r=1$ 列消失"为什么必须写出来.** 目标是证明 $G_D(2\chi-E_D+\varepsilon I)G_D\ge0$。若 $D$ 偶，$r=1$ 的耦合向量对两个 spin-$a$ 因子反对称，而 $\widehat W$（加楔）对两个 2-次向量是**对称**的，所以 $\widehat W|D,D;1\rangle_Q=0$，$w_{D,1}^*=0$，即 $G_D$ 的第一列为 0，同时目标 $\chi$ 的 (1,1) 项 $2\chi$ 在证书里"乘了零"。此时不等式实际由 $E_D$ 与其他副本支撑。**这段的作用是排除"用 $G_D^{-1}$ 化简"的诱惑**：论文因此可以完全不假设 $G_D$ 可逆（08 节 "This congruence uses only the positive diagonal $D_{\sqrt u}$; it does not invert $G_D$ or presume that its columns are independent."）。`[推测]` 这几乎肯定是作者修改过的地方：先写 $2\chi-E_D+\varepsilon I\ge0$（更强、更自然），发现偶 $D$ 时该矩阵并不正（因为 (1,1) 元素是 $2-E_{11}$，可能为负），才改为带 $G_D$ 合同的形式。我复现时对 $D=12$ 得到 $M_{11}=0$ 且其余 $M_{rs}$ 正常，与该论述一致。
"Target spin blocks outside $1\le D\le23$ contribute positively and may be discarded in a lower bound."：因为 normal4 是 $-\sum O^\dagger O$ 型的**负**算子，$A_4=-\mathcal L_4(\text{正})$；比较方向 $A_4\le\mathcal L_4(W_4W_4^\dagger)+(\cdots)$ 中，丢掉未处理的正块只会让 $A_4$ 更小（更容易被上界控制）✓ 方向正确。

**(d) [推测] 候选失败路线.**
- 路线 A：假设 $\{w_{Dr}^Q\}$ 线性无关，从而把证书写成 $2\chi-E_D^Q+\varepsilon I\ge0$。文本证据：三处独立声明反对（"can be linearly dependent"、"we never assume that the wedged copy vectors are independent"、"it does not invert $G_D$"）。若走这条，lem:transfer 里的相对误差无法通过核方向传递。
- 路线 B：在有限 $Q$ 就直接对角化 $E_D^Q$。文本证据：论文坚持用 $E_D^Q\to E_D$ 的**逐点**收敛（有限个 $D$）+ 证书 $G_D(2\chi-E_D+\varepsilon I)G_D\ge0$，把有限 $Q$ 的处理全部交给 05 节。`Lean:` `FourBody/PhysicalCertificate.lean` 把 $G(2\chi-E+\varepsilon)G$ 的 PSD 性作为独立声明 `source_physical_four_body_certificates`，而 `FiniteFlux/` 931 文件 55080 行的全部工作就是这 23 条——**规模差异本身就是证据**：作者在此处反复返工，因为每个 $D$ 的矩阵都得用 `decide +kernel` 逐位算。
- 路线 C：把 $\mathcal R_D$ 扩到 $r$ 偶。则耦合规则不成立（$\bigwedge^2$ 的自旋分解只给奇 $r$），副本矩阵维数翻倍且大量列为零，`FiniteFlux` 规模按 $d^3$ 爆炸。

### 2.13 Lemma \label{lem:compression}[Compression and annihilator bounds]

> Let $W$ be a linear map between finite-dimensional Hilbert spaces, $G=W^\dagger W$, and let $C$ be self-adjoint on the domain of $W$. Then
> \[ GCG\ge0\quad\Longleftrightarrow\quad WCW^\dagger\ge0. \]
> On $\FF_{\mathrm{loc}}$, for any fixed finite collection $A_b=c_kc_jB(v_p^*)$ with $0\le p\le23$ and $0\le j,k\le24$,
> \[ \sum_b\norm{A_b\psi}^2\le C_0\ip\psi{h_*\psi},\qquad h_*:=\sum_{p=0}^{23}B(v_p^*)^\dagger B(v_p^*), \]
> where $C_0$ depends only on the collection.

前置构造（逐字）：

> For the local argument, let $\FF_{\mathrm{loc}}$ be the exterior algebra of $\mathbb C^{25}$ with orthonormal basis $e_0,\ldots,e_{24}$. For $Q\ge24$ we identify it with the Fock space of the first 25 orbital modes in $U_Q$. By \eqref{eq:pairstar}, each limiting pair vector $v_p^*$ with $p\le23$ lies in $\bigwedge^2\mathbb C^{25}$.

**(b) 证明补全.** 第一条等价："The two positivity statements both assert that the quadratic form of $C$ is nonnegative on $\ran G=\ran W^\dagger$." `[补]` 严格地：$\langle x,GCGx\rangle=\langle Gx,C\,Gx\rangle$，而 $Gx\in\ran G$；反向 $\ran G=\ran W^\dagger$（因为 $\ker G=\ker W$，故 $\ran G=(\ker W)^\perp=\ran W^\dagger$），任取 $y=W^\dagger a$ 有 $y=W^\dagger W a$？不对，$\ran W^\dagger=(\ker W)^\perp$ 而 $G=W^\dagger W$ 的像也是 $(\ker W)^\perp$，所以两像相同；在 $\ran W^\dagger$ 上写 $y=W^\dagger a$，则 $\langle y,Cy\rangle=\langle W^\dagger a,CW^\dagger a\rangle=\langle a,WCW^\dagger a\rangle$ ✓ 双向都得。**这条等价是把"有核的 Gram 矩阵"合法地换成"作用在像上的算子"的枢纽**，所以论文把它写成引理而不是显然。
第二条：$\|c_kc_jB(v_p^*)\psi\|\le\|B(v_p^*)\psi\|$（$\|c_j\|\le1$），求和后每个 $p$ 至多被 $C_0$ 个三元组 $(p,j,k)$ 使用 ⇒ "one may take $C_0$ to be the largest multiplicity of a pair label $p$."
`[补]` 注意 $\mathcal S_\rho$ 允许 $j=k$？$A_b$ 形如 $c_kc_j$，$j=k$ 时为零，无害。

**(c) 为什么 $Q\ge24$ 与 $\mathbb C^{25}$ 是硬约束.** 需要 $v_p^*\in\bigwedge^2\mathbb C^{25}$ 对 $p\le23$ 成立：eq:pairstar 的支撑是 $i+j=p+1$，最大 $p=23$ 需要 $i,j\le23$？实际上 $i+j=24$，取 $i=23,j=1$ 等，最大标号 $23\le24$ ✓；但为对称与四体收缩留余量，模式集取到 $24$（25 个模式）。$Q\ge24$ 保证 $U_Q$ 至少有 25 个轨道 $e_0,\dots,e_{24}$ ✓。**这个数字直接决定 $\mathcal S_\rho$ 的盒子大小（0..8）与 $D\le23$ 的证书数量**：$23=2\cdot(8)+7$ 附近，是"模式盒 ⊂ 局部模式集"的兼容选择。`[推测]` 若把局部模式集扩到 30，证书数升到 $D\le29$，`FiniteFlux` 规模翻倍以上。

**(d) [推测] 候选失败路线 / Lean 痕迹.**
- 路线 A：直接令 $C_0=\dim$（三元组总数）而不追踪配对重数。`Lean:` `Operators/CollectionAnnihilatorBound.lean` 的 `collection_limit_annihilator_bound` 用的正是 `Fintype.card I`（整个指标集基数），**比论文的"最大重数"更粗**——这是形式化落后于论文的客观证据（粗界在数值上仍够用，因为 $C_0$ 只乘在 $\rho_Q$ 上，而 $\rho_Q\to0$）。同时 `limitPairWindow`/`sourcePairWindow`（$\sum_{p<24}$）表明"24 个模式"被固化成窗口常量。

### 2.14 Lemma \label{lem:transfer}[Uniform transfer]

> For $Q\ge24$ and $1\le D\le23$, put
> \[ C_D^Q=(d_D/d_a)\chi-E_D^Q+\eps I,\qquad h_Q=\sum_{p=0}^{23}B_p^\dagger B_p. \]
> Assuming \eqref{eq:4certificate}, there is a scalar $\rho_Q\ge0$, independent of $D$ and tending to zero as $Q\to\infty$, such that
> \[ \sum_{r,s\in\mathcal R_D}(C_D^Q)_{rs}B(w_{Dr}^Q)^\dagger B(w_{Ds}^Q)\ge-\rho_Qh_Q \]
> on the entire Fock space $\FF_Q$.

**(b) 证明的四块与全部中间量.**
块 1 "An exact change of variables."：
\[ \Delta_Q\ket A=\Big(\prod_{x\in A}d_Q(x)\Big)\ket A,\qquad d_Q(x)=\sqrt{(Q)_x/Q^x}, \]
"$0<\Delta_Q\le I$" 因为 $(Q)_x/Q^x=\prod_{t=0}^{x-1}(1-t/Q)\le1$ ✓；"local Fock space is fixed as $Q$ varies" ⇒ $\Delta_Q,\Delta_Q^{-1}$ **按范数**趋于 $I$（这是把"$Q$ 依赖"关进一个有限维盒子的关键设计）。
由 eq:pair 与 eq:pairstar 逐项比较得
\[ v_p(x,y)=r_p(Q)d_Q(x)d_Q(y)v_p^*(x,y),\qquad r_p(Q)=\sqrt{(2Q)^p/(2Q-2)_p}\ge1. \]
`[补]` 检查 $r_p\ge1$：$(2Q)^p/(2Q-2)_p=\prod_{t=0}^{p-1}\frac{2Q}{2Q-2-t}\ge1$ ✓ 每项分母 $\le2Q$。$p=0$ 时 $r_0=1$ ✓。
在基楔上逐个"移除标号"核对根式因子，得两个精确定理：
\[ B_p=r_p(Q)\Delta_Q^{-1}B(v_p^*)\Delta_Q,\qquad B(v_p\wedge e_j\wedge e_k)=\frac{r_p(Q)}{d_Q(j)d_Q(k)}\Delta_Q^{-1}B(v_p^*\wedge e_j\wedge e_k)\Delta_Q. \]
"These are identities on the local Fock space, with the inverse diagonal acting on the output particle sector. Repeated removed labels make both sides zero."（这句是防抬杠：$\Delta_Q^{-1}$ 在有重复标号时不涉及，因为两侧都是 0。）
推出能量传送不等式：
\[ \Delta_Qh_*\Delta_Q\le h_Q \]
`[补]` 理由：由第一条解出 $B(v_p^*)\Delta_Q=r_p(Q)^{-1}\Delta_QB_p$，于是 $\langle\phi,h_*\phi\rangle$ 与 $\langle\Delta_Q\phi,h_Q\Delta_Q\phi\rangle$ 比较时用 $r_p^{-1}\le1$ 与 $\|\Delta_Q\|\le1$。注意方向：**必须**是 $r_p\ge1$ 才给 $\le$；若 $r_p<1$ 该步反号，整个引理失效。这说明 $r_p$ 的定义（分子 $(2Q)^p$、分母 $(2Q-2)_p$）不是任意的。
块 2 "The error is controlled by pair energy."：固定 $D$，指标 $b=(p,j,k)$，$p+j+k=D$，$j<k$；
$A_b=B(v_p^*\wedge e_j\wedge e_k)$，$\beta^Q_{rb}=S_r^Q(D,D;p,j,k)\frac{r_p(Q)}{d_Q(j)d_Q(k)}$，于是
$B(w_{Dr}^Q)=\Delta_Q^{-1}(\sum_b\beta^Q_{rb}A_b)\Delta_Q$ ✓（由 eq:wQ 的定义 + 块 1 的第二条共轭式）。
$M_Q=(\beta^Q)^TC_D^Q\beta^Q\to M_*=(\beta^*)^T(2\chi-E_D+\varepsilon I)\beta^*$，其中用到 $d_D/d_a\to2$ 与 $E_D^Q\to E_D$、$\beta^Q_{rb}\to S_r(D,D;p,j,k)$（`[补]` 因为 $r_p(Q)\to1$、$d_Q(j),d_Q(k)\to1$、$S^Q\to S$）。
待估计的二次型被写成 $\Delta_Q\big(\sum_{b,c}(M_Q)_{bc}A_b^\dagger\Delta_Q^{-2}A_c\big)\Delta_Q$。
极限表达式 $\sum_{b,c}(M_*)_{bc}A_b^\dagger A_c=\sum_{r,s}(2\chi-E_D+\varepsilon I)_{rs}B(w_{Dr}^*)^\dagger B(w_{Ds}^*)\ge0$ ✓（正是 lem:compression 的第一条 + $\mathcal L_4$ 保正）。
**这里有一句极其重要的辩护**："For clarity, the perturbation estimate does not require $M_*\ge0$." `[补]` 含义：我们只需要 $\sum(M_*)_{bc}A_b^\dagger A_c\ge0$（作为算子，即 $A(M_*)A^\dagger\ge0$），而 $M_*$ 本身可以有负特征值（因为 $A_b$ 的像线性相关，这正是"加楔后线性相关"的体现）。若误以为要 $M_*\ge0$，就必须对 $(2\chi-E_D+\varepsilon I)$ 求平方根，回到需要 $G_D$ 可逆的死路。
误差项：$(R_Q)_{bc}=(M_Q)_{bc}\Delta_Q^{-2}-(M_*)_{bc}I$，放在每个 $b$ 一份 $\FF_{\mathrm{loc}}$ 的 Hilbert 直和上（"$\Delta_Q^{-2}$ acts on the output of $A_c$, hence on the sector with four fewer particles; using its direct sum over local sectors makes this a single operator identity"）。$\|R_Q\|\to0$ 因为**指标集与局部 Fock 空间都固定** ✓。于是
$\big|\sum_{b,c}\langle A_b\phi,(R_Q)_{bc}A_c\phi\rangle\big|\le\|R_Q\|\sum_b\|A_b\phi\|^2\le C_0\|R_Q\|\langle\phi,h_*\phi\rangle$ ✓（用 lem:compression 第二条）。
取 $\phi=\Delta_Q\psi$、再用 $\Delta_Qh_*\Delta_Q\le h_Q$ ⇒ 局部结论，系数 $\rho_Q'=C_0\|R_Q\|$；对 $1\le D\le23$ 取最大 ⇒ 公共 $\rho_Q$ ✓（"independent of $D$" 靠的就是 $D$ 只有 23 个值）。
块 3 "Additional particles are spectators."：把 25 个局部模式排在所有其它模式之前，等距 $\text{local wedge}\otimes\text{spectator wedge}\mapsto$ 有序乘积下，$c_j$（$j\le24$）= 局部消灭 $\otimes I$；**"The fermionic parity factor belongs to annihilators in the later spectator modes, which do not occur here."** ⇒ 局部不等式张量化即得 $\FF_Q$ 上的不等式，同一 $\rho_Q$，与外部占据数无关 ✓。这就是"阈值与粒子数无关"的物理实现处。

**(c) 常数的机械角色.** $\varepsilon I$ 出现在 $C_D^Q$ 里，是为了吸收 $M_Q\to M_*$ 的扰动？不：`[补]` $\varepsilon$ 是给证书留的严格正余量（保证 $G_D(2\chi-E_D+\varepsilon I)G_D\ge0$ 在有理算术下可判定），而 lem:transfer 的假设**只是**证书成立，故 $\varepsilon$ 的代价在 prop:A4 里以 $1222\varepsilon H$ 显式支付。$h_Q$ 只取 $p\le23$（24 项）而 $H_Q$ 取 $p\le2Q-2$：$\rho_Qh_Q\le\rho_QH_Q$ ✓，因为 $h_Q\le H_Q$（更多正项）。
`Lean:` `FourBody/UniformTransfer.lean` 的 `source_fourBody_uniform_transfer` 显式带 `truncatedScaling 24 Q`、`matrixMetricError 24 Q`、`fourBodyRho D Q`、`localFourOperators_bound`、`truncated_pair_window_return`，并有 `uniformFourBodyRho := Σ D ∈ Finset.range 24, fourBodyRho D Q` 与 `uniformFourBodyRho_tendsto`、`source_fourBody_uniform_transfer_all`——即"$D$ 取最大"被写成 24 项求和（`Finset.range 24` = $D=0..23$，与论文 $D=1..23$ 差一个 0 项，无害）。`Exterior/Scaling.lean`、`Exterior/OccupationDiagonal.lean` 的 `orbitalScaling`/`exteriorScaling`/`annihilate_scaling`/`occupationBasis`/`exteriorScaling_occupation(_entry)` 是 $\Delta_Q$ 的形式化；`Pair/Conjugation.lean` 的 `modeFactor Q x := √((Q).descFactorial x / Q^x)`（= $d_Q(x)$）与 `pairFactor Q p := √((2Q)^p/(2Q−2)_p)`（= $r_p(Q)$）、`pair_radicand_factorization`、`pairCoefficient_conjugation` 对应 eq:pairconjugation/eq:fourconjugation。

**(d) [推测] 候选失败路线.**
- 路线 A：用"投影算子的谱连续性"传递正性。文本证据：05 节开篇第一句直接否定："The limiting Gram matrices have kernels, so their positivity cannot be transferred by assuming that their ranges vary continuously. Instead, we compare the annihilators themselves." 这是全文明确写出的**唯一**一条"被否决的方法"，几乎可以肯定是作者真实走过的弯路。
- 路线 B：允许 $\Delta_Q$ 依赖 $D$ 或依赖粒子数。文本证据："This local Fock space is fixed as $Q$ varies." 与 "since both its index set and the local Fock space are fixed"；$\|R_Q\|\to0$ 完全依赖有限性（无限维或随 $Q$ 增长的盒子里，逐点收敛不给范数收敛）。
- 路线 C：估计 $(M_Q)_{bc}\Delta_Q^{-2}-(M_*)_{bc}I$ 时把 $\Delta_Q^{-2}$ 与 $M_Q-M_*$ 混在一起。`[补]` 论文把误差拆成"矩阵元差"与"$\Delta^{-2}-I$"两块都需要 $\to0$；$\Delta_Q^{-2}\to I$ 靠 $d_Q(x)\to1$（Lean `Pair/FactorLimit.lean` 的 `modeFactor_tendsto`）。若试图用 $\Delta_Q$ 的界 $\le I$ 直接吞掉 $\Delta_Q^{-2}$，方向会反（$\Delta^{-2}\ge I$）。

### 2.15 Proposition \label{prop:A4}[Four-body estimate]

> For the coefficients in Appendix~\ref{app:certificate},
> \[ A_4\le\LL_4(W_4W_4^\dagger)+(1222\eps+o(1))H,\qquad Q\to\infty, \]
> uniformly on $\FF_Q$.

前置说明（逐字）：

> The allowance $\eps I$ in the certificate must also be paid for in pair energy. Here it is useful to sum over the orthonormal highest vectors \emph{before} estimating their wedges. Bessel's inequality then avoids an extra factor equal to the number of spin copies.

**(b) 证明补全.**
- 旋转平均矩阵单元 $|D,D;r\rangle_Q\langle D,D;s|$：得"副本矩阵单元 $\otimes$ 自旋单位，除以 $d_D$"（Schur 平均 + 2.8），于是"目标减 $A_4$ 再加 $\varepsilon$ 余量"在保留块上等于
\[ d_a\sum_{D=1}^{23}\int\sum_{r,s}(C_D^Q)_{rs}B(w_{Dr}^Q(g))^\dagger B(w_{Ds}^Q(g))\,dg. \]
lem:transfer 逐旋转共轭后给出 $\ge-\rho_Qd_a\sum_D\int h_Q(g)dg=-\rho_Q\cdot23\cdot\frac{24}{d_a}\cdot$……`[补]` 论文用恒等式 $d_a\int h_Q(g)\,dg=24H$（24 是 $h_Q$ 的项数，见 2.13 的推导）把右端换成 $-o(1)H$；"The number of retained blocks is fixed, so this error remains uniform in particle number."（23 个块 × 与 $N$ 无关的 $\rho_Q$）。
- 余量控制：$S^Q(S^Q)^T=I$ 因为左端最高向量彼此正交（不同 $r$ 属于第二配对的**不同自旋直和项**）、右端未耦合向量正交 ⇒ $S^Q$ 的行正交 ⇒ Bessel：
$\sum_r\|B(w_{Dr}^Q)\psi\|^2\le\sum_{b}\|c_kc_jB_p\psi\|^2\le\sum_b\|B_p\psi\|^2$ ✓。
`[补]` 这里的关键是"正交性在**加楔之前**成立"，加楔之后 $w_{Dr}^Q$ 可以线性相关（论文原话 "This uses orthogonality before wedging; the vectors $w_{Dr}^Q$ themselves need not be orthogonal."），所以是 Bessel（$\le$）而不是等式（Parseval）。
- 计数：三重数 $n_D=\sum_{n=1}^D\lceil n/2\rceil=\lfloor(D+1)^2/4\rfloor$。`[补]` 推导：$p+j+k=D$、$j<k$ 的解数 = $\sum_{p=0}^{D}\#\{j<k,\,j+k=D-p\}=\sum_{n=1}^{D}\lceil n/2\rceil$（$n=D-p$，$\{j<k,j+k=n\}$ 有 $\lceil n/2\rceil$？实际是 $\lfloor n/2\rfloor$ 个；论文写 $\lceil n/2\rceil$ 并把 $n$ 从 1 到 $D$ 求和 —— 我用程序验证 $\sum_{D=1}^{23}\lfloor(D+1)^2/4\rfloor=1222$ 与 $\sum_{n=1}^{D}\lceil n/2\rceil=\lfloor(D+1)^2/4\rfloor$ 对每个 $D$ 成立 ✓，所以两种写法一致。）
- 旋转后每个配对范数贡献 $\langle\psi,H\psi\rangle/d_a$，乘以前面的 $d_a$ 得 $H$；总余量
\[ \eps\sum_{D=1}^{23}n_DH=\eps\Big(\sum_{m=1}^{12}m^2+\sum_{m=1}^{11}m(m+1)\Big)H=1222\varepsilon H \]
`[补]` 拆分依据：$D$ 奇时 $n_D=((D+1)/2)^2=m^2$（$m=(D+1)/2$，$D=1,3,\dots,23$ ⇒ $m=1..12$）；$D$ 偶时 $n_D=\frac{D}{2}\cdot(\frac D2+1)=m(m+1)$（$m=D/2$，$D=2,4,\dots,22$ ⇒ $m=1..11$）。数值 $650+572=1222$ ✓ 我独立复算，并与 Lean 一致。
- 末句 "The discarded target spin blocks are positive." 说明丢弃 $D\notin[1,23]$ 不破坏不等号方向。

**(c) $1222$ vs $10946$：本篇最重要的可机检差异.** 若不对副本用 Bessel 而是逐项放缩，每块多出因子 $|\mathcal R_D|=\lceil D/2\rceil$，总余量 $\varepsilon\sum_D\lceil D/2\rceil n_D=10946\varepsilon$。数值上：$1-0.93527408868499-0.014892578125-10946\cdot3\cdot10^{-6}=0.0169953$，即 $\gamma=1699533319001/10^{14}\approx0.016995<1/25=0.04$。**这条粗路线证不出 $1/25$，连 Fock 不等式的 $0<\gamma$ 都很勉强。**
`Lean:` 两条路线都在库里：`Operators/Certificate.lean` 有 `allowance_count := ... = 10946`、`final_margin : 1 − 93527408868499/10^14 − 61/4096 − 10946·(3/10^6) = 1699533319001/10^14`、`final_margin_gt : (1/100) < 1699533319001/10^14`；`PhysicalFockGap.lean` 的 `physical_fock_budget_eventually` 用 10946；而 `FourBody/BesselAllowance.lean`（186 行，含 `orthonormal_occupation_sum_bound`、`source_fourBody_local_orthonormal`，第 124 行 `(∑ d : Fin 23, (d.val+2)^2/4) = 1222 := by decide +kernel`，第 143 行 `retainedFourAllowance Q hQ x ≤ 1222*sourceFockEnergy Q x`）与 `Fock/SharpGap.lean` 的 `sharp_scalar_budget (1222)`、`gammaStar := 4616733319001/10^14` 才是论文的 1222 路线。**结论：Lean 的入口 `mainTarget_proved` 认证的是 1/100（10946 路线），论文的 1/25 只在 `SharpGap.lean`/`LaughlinGap.lean` 里以 `SharpMainTarget` 形式存在**（详见第四节）。
`FourBody/TotalAllowance.lean` 的 `source_allowance_count_fin ... = 10946` 与 `physical_fourBody_total_haar_allowance` 是"Bessel 之前"的显式命名——**这个文件的存在本身就是失败路线的证据**：作者先证了粗界、再补 Bessel 文件把常数降下来，而没有删除旧文件。

**(d) [推测] 候选失败路线.**
- 路线 A：先估计每个 $w_{Dr}^Q$ 的楔再求和 ⇒ 10946，证不出 $1/25$（如上，有 Lean 文件为证）。
- 路线 B：用 $\sum_r\|B(w_{Dr}^Q)\psi\|^2$ 的 Parseval 等式 ⇒ 需要 $\{w_{Dr}^Q\}$ 正交，论文两处明说不能假设。
- 路线 C：把 $d_a\int h_Q(g)dg$ 算成 $2Q-1$ 或 $25$ 而不是 $24$ ⇒ 余量整体错位（`h_Q` 有 24 项：$p=0..23$）。

### 2.16 Lemma \label{lem:tail}[Three-body tail]

> For sufficiently large $Q$,
> \[ \LL_3\left(W_3\sum_{z=16}^Qq_z(Q)R_{3,z}W_3^\dagger\right)\ge-\delta_QH, \]
> where
> \[ \delta_Q=\sum_{\substack{17\le z\le Q\\z\text{ odd}}}\frac{d_{3,z}}{d_a}|q_z(Q)|(z+1),\qquad \delta_Q\longrightarrow\frac{61}{4096}. \]

**(b) 证明补全.**
- 符号分析："For $16\le z\le Q$, the bracket in \eqref{eq:q} is positive, since it is at least $2z-2$." `[补]` 因为 $z\le Q$ 故 $z(z+1)/Q\le z+1$，于是括号 $\ge3z-1-(z+1)=2z-2>0$。所以 $q_z=(-1)^z\cdot$正，奇 $z$ 为负、偶 $z$ 为正 ⇒ 下界只需管奇 $z$，且从 $17$ 开始（$z=16$ 偶，正，丢弃只会加强不等式 ✓ 方向正确）。
- 逐块估计：$R_{3,z}$ 的归一最高向量是 $\sum_{p=0}^zs_pv_p\otimes e_{z-p}$；"$z+1$" 正是 $p=0,\dots,z$ 的项数（Cauchy–Schwarz：$\|\sum_p s_pc_{z-p}(g)B_p(g)\psi\|^2\le(\sum_p|s_p|^2)\sum_p\|c_{z-p}(g)B_p(g)\psi\|^2\le\sum_{p=0}^z\|B_p(g)\psi\|^2$ ✓ 用到 $\sum|s_p|^2=1$ 与 $\|c_j\|\le1$）。"Its orbit resolves that spin projector with factor $d_{3,z}$"：旋转轨道上投影 $R_{3,z}$ 的表示是 $\frac{1}{d_{3,z}}\int(\cdot)(g)dg$ 形式，与前面 $d_a$ 相除给 $\frac{d_{3,z}}{d_a}$ 的净权重（与 2.11 的 $\frac{d_a}{d_{3,z}}e_z^Q$ 是同一簿记的倒数侧）。
- 平均：每项 $\|B_p(g)\psi\|^2$ 旋转平均后贡献 $\langle\psi,H\psi\rangle/d_a$，$p$ 有 $z+1$ 项，与 $d_{3,z}/d_a$ 合并即 eq:delta ✓。
- 控制函数："For $Q\ge4$, the ratios in $(Q)_z/(2Q-2)_z$ are nonincreasing" `[补]` 即 $\frac{Q-t}{2Q-2-t}\le\frac{Q-t-1}{2Q-2-t-1}$ 化简为 $(2Q-2)\ge0$ 型不等式，$Q\ge4$ 足够（$Q=3$ 时分母接近 0 时失单调）。于是 $(Q)_z/(2Q-2)_z\le(Q/(2Q-2))^z\le(2/3)^z$（$Q\ge4$ 时 $Q/(2Q-2)\le2/3$ ✓ 等价于 $3Q\le4Q-4$ 即 $Q\ge4$ ✓✓ —— **这就是 $Q\ge4$ 这个看似武断的阈值的唯一作用**）。又 $d_{3,z}/d_a=(3Q-1-2z)/(2Q-1)\le2$ `[补]`（$z\ge0$，$3Q-1-2z\le3Q-1\le2(2Q-1)=4Q-2$ 当 $Q\ge1$ ✓）。$|q_z|\le 3z-1\le3z$ ⇒ 和式（超出 $Q$ 处补零）被 $6z(z+1)(2/3)^z$ 控制 ✓，可用控制收敛。
- 极限值：$\lim\delta_Q=\frac32\sum_{z=17,19,\dots}(3z-1)(z+1)2^{-z}$（$\frac{d_{3,z}}{d_a}\to\frac32$、$|q_z|\to(3z-1)2^{-z}$）。`[补]` 论文给的算法：写 $z=17+2m$，则 $(3z-1)(z+1)=(50+6m)(18+2m)=900+100m+108m+12m^2=900+208m+12m^2$ ✓；$2^{-z}=2^{-17}4^{-m}$；三个几何级数 $\sum_{m\ge0}4^{-m}=\frac43$、$\sum m4^{-m}=\frac{x}{(1-x)^2}\big|_{x=1/4}=\frac{1/4}{9/16}=\frac49$、$\sum m^24^{-m}=\frac{x(1+x)}{(1-x)^3}\big|_{x=1/4}=\frac{(1/4)(5/4)}{27/64}=\frac{20}{27}$ ✓。相乘：$\frac32\cdot2^{-17}\big(900\cdot\frac43+208\cdot\frac49+12\cdot\frac{20}{27}\big)=\frac32\cdot2^{-17}\big(1200+\frac{832}9+\frac{80}9\big)=\frac32\cdot2^{-17}\cdot\frac{3904}3=1952\cdot2^{-17}=\frac{1952}{131072}=\frac{61}{4096}$ ✓ **我逐步复核，逐位对上**。
`Lean:` `Asymptotics/Basic.lean` 的 `tail_series_value` 用同一种分解（我读到的是 876/172m/24·C(m+2,2) 的等价拆分 ⇒ 61/4096），`Asymptotics/Convergence.lean` 的 `odd_tail_index_iff`（"$z$ 奇且 $17\le z\le Q$" 的形式化）、`tailWeight_tendsto`/`deltaTerm_tendsto`/`deltaFormula_tendsto`，`Asymptotics/Bound.lean` 的 `fallingRatio`/`fallingRatio_le_geometric`（= $(2/3)^z$ 控制）与 `tail_bracket_bounds`（= 括号 $\ge2z-2$）。**两套分解同时存在**说明作者换过算法但保留了旧证明。

**(c) $61/4096$ 的敏感性.** 它吃掉终盘余量的 $0.014892578125$（约 $\gamma_*$ 的 32%）。若模式盒下界从 16 降到 12，尾巴多出 $z=13,15$ 两项，量级 $\sim\frac32\cdot(38)(14)\cdot2^{-13}+\frac32\cdot(44)(16)\cdot2^{-15}\approx 5.1\cdot10^{-3}+1.7\cdot10^{-3}$，直接把 $\gamma_*$ 压掉 $0.007$，仍 $>1/25$ 但余量减半 ⇒ **三体证书必须覆盖到 15**（这也是 $e_z$ 表做到 $z=15$ 的原因：16 之后交给 $\delta_Q$）。

**(d) [推测] 候选失败路线.**
- 路线 A：把 $\sum_{z=16}^Q$ 当成有限常数个块处理（不分 $Q$）。文本证据：$\delta_Q$ 的定义里上限是 $Q$，且需要控制收敛（"Dominated convergence and \eqref{eq:qlimit} give..."）——说明求和项数随 $Q$ 增长，必须用 $(2/3)^z$ 一致可和。
- 路线 B：用 $|q_z|\le C z$ 而不用极限值 ⇒ $\delta_Q$ 上界变松，$\gamma_*$ 变小甚至负。文本证据：$\gamma_*$ 的表达式里是精确的 $61/4096$。
- 路线 C：对 $\|\sum_ps_p\cdots\|^2$ 不用 $|s_p|^2$ 归一而用 $(\sum|s_p|)^2$ ⇒ 多一个 $z$ 因子，级数变成 $\sim z^2(2/3)^z$，仍可和但常数变大。

### 2.17 Theorem \label{thm:fock} 的证明（终盘预算）

> Combine Lemma~\ref{lem:square}, \eqref{eq:Adecomp}, \eqref{eq:A3bound}, Proposition~\ref{prop:A4}, and Lemma~\ref{lem:tail}. They give
> \[ H^2\ge d_a\int K(g)\,dg+(1-\eta-\delta_Q-1222\eps-o(1))H. \]
> The integral is positive. The certificate gives $\eta=\frac{93527408868499}{10^{14}}$, $\eps=\frac3{10^6}$, so the coefficient tends to
> \[ 1-\frac{93527408868499}{10^{14}}-\frac{61}{4096}-1222\frac3{10^6}=\gamma_*=\frac{4616733319001}{10^{14}}>\frac1{25}. \]
> The limit in \eqref{eq:finalmargin} is $\gamma_*$. For each fixed $0<\gamma<\gamma_*$, the coefficient therefore exceeds $\gamma$ for all sufficiently large $Q$. Every convergence threshold is independent of particle number, proving the assertion on $\FF_Q$.

**(b) [补] 组装的完整账目.** 由 lem:square：$H^2=H+\mathcal T_3+\mathcal T_4$，其中 $\mathcal T_3=\mathcal L_3(W_3(W_3^\dagger W_3-I)W_3^\dagger)=\mathcal L_3(W_3(\sum_{z=0}^{Q}q_zR_{3,z})W_3^\dagger)$（用 lem:q），$\mathcal T_4=\mathcal L_4(W_4W_4^\dagger)$。由 eq:Adecomp：$\mathcal K_Q=A_2+A_3+A_4=\eta H+A_3+A_4$。于是
$$H^2-\mathcal K_Q=(1-\eta)H+(\mathcal T_3-A_3)+(\mathcal T_4-A_4).$$
- $\mathcal T_3-A_3=\mathcal L_3\big(W_3[\sum_{z=0}^{15}(q_z-\frac{d_a}{d_{3,z}}e_z^Q)R_{3,z}+\sum_{z=16}^Qq_zR_{3,z}]W_3^\dagger\big)$：第一中括号由 eq:3certificate（$e_z<\frac32(3z-1)(-1/2)^z$，$z\in\{2,4,5..15\}$；$z=0,1,3$ 被 $W_3$ 消灭）+ $\frac{d_{3,z}}{d_a}\to\frac32$ 保证对充分大 $Q$ 非负 ⇒ 可直接丢弃；第二块由 lem:tail $\ge-\delta_QH$。
- $\mathcal T_4-A_4\ge-(1222\varepsilon+o(1))H$ 由 prop:A4 ✓。
合计：$H^2\ge\mathcal K_Q+(1-\eta-\delta_Q-1222\varepsilon-o(1))H$，再丢 $\mathcal K_Q\ge0$ ✓。
**"The limit in \eqref{eq:finalmargin} is $\gamma_*$"** 这句强调 $\gamma_*$ 是被"极限"定义的，不是被选取的；因此 $\gamma$ 必须严格小于它（开区间），与 2.1 的说法一致。
精确分数核对（我算）：$10^{14}-93527408868499-14892578125000-366600000000=4616733319001$ ✓；$4616733319001/10^{14}=0.04616733319001>0.04$ ✓。

**(c) 唯一"不可合并"的三处 $o(1)$.** `[补]` (i) $E_D^Q\to E_D$ 与 $\beta^Q\to\beta^*$（lem:transfer 的 $\rho_Q$）；(ii) $\frac{d_a}{d_{3,z}}e_z^Q$ 与 $e_z$ 的差以及 $\frac{d_{3,z}}{d_a}$ 与 $\frac32$ 的差（13 条严格不等式给出正的间隙，故有限 $Q$ 内可容忍）；(iii) $d_D/d_a\to2$。三者都不含粒子数。

**(d) [推测] 候选失败路线.**
- 路线 A：不丢 $\mathcal K_Q$ 而试图把它并入右端以改进 $\gamma_*$。则必须给出 $A_3,A_4$ 的下界（它们本身是负二次型），而全部证书只做上界比较 ⇒ 不可行。
- 路线 B：把 $\eta$ 与 $\delta_Q$、$1222\varepsilon$ 三项合并优化（例如让 $\varepsilon$ 参与 $\eta$ 的最小化）。文本证据：08 节的 Remark 把证书说成"fixed spin-matrix inequalities"，数据是**给定**的（`verification/rows.txt`），不是在这条线上现优化的。`[推测]` 数据由外部（数值）搜索得到，论文只负责验证——这与"Remark: No many-particle finite-size spectrum, numerical extrapolation... enters the argument"并不矛盾：搜索不算证明的一部分。

### 2.18 Lemma \label{lem:kernel}[Kernel at Laughlin flux]

> For $N\ge2$ and $Q=3(N-1)$, the kernel of $H_{N,Q}$ is the line spanned by $\Psi_{\mathrm L,N}$.

**(a) 原文证明的链条.**
1. "We now recover the known unique zero mode of Haldane's spherical parent Hamiltonian~\cite[p.~606, Equations~(6)--(7)]{Haldane}. The elementary divisibility proof also fixes the exact flux at which the kernel is a line." —— 明确承认结果已知（Haldane 1983 p.606），本文的贡献是"初等可除性证明 + 精确磁通"。
2. 实现：$U_Q$ = $(u,v)$ 的 $Q$ 次齐次多项式；$b_{ij}=u_iv_j-u_jv_i$；配对自旋 $Q-r$ 的最高多项式是 $b_{ij}^ru_i^{Q-r}u_j^{Q-r}$。
3. "$b_{ij}$ 在配对同时旋转下不变 ⇒ 该直和项里每个向量都被 $b_{ij}^r$ 整除"；"Exchange of the pair has parity $(-1)^r$ ⇒ 反对称配对态要求 $r$ 奇"。
4. $H_{N,Q}\Psi=0$ ⇒ $0=\sum_{i<j}\|P^{(1)}_{ij}\Psi\|^2$ ⇒ 每对都被投影消灭 ⇒ 展开在其它粒子的单项式上，"the remaining pair sectors all have odd $r\ge3$" ⇒ $b_{ij}^3\mid\Psi$ 对每对成立。
5. 每个 $b_{ij}=v_ju_i-u_jv_i$ 作为 $u_i$ 的多项式是本原的（$v_j$ 与 $u_jv_i$ 互素），且在其它变量分式域上是一次 ⇒ Gauss 引理给不可约；不同无序对的括号互不相伴 ⇒ 两两互素 ⇒ 唯一因子分解给 $\prod_{i<j}b_{ij}^3\mid\Psi$。
6. 度数计数：乘积对每个粒子的自旋变量次数为 $3(N-1)=Q$，"exhausting the multidegree of $\Psi$; the quotient is constant." ✓ **这一步只在 $Q=3(N-1)$ 成立**，即"exact flux"的来源。
7. 反向：$\Psi_{\mathrm L,N}$ 反对称；因子 $b_{ij}^3$ 留下每自旋 $Q-3$ 次 ⇒ 配对最大总自旋 $Q-3$；"Multiplication by the invariant bracket cannot introduce spin $Q-1$" ⇒ 每个配对投影消灭它 ✓。

**(c) 常数/指标理由.** $r\ge3$ 而不是 $r\ge1$：$r=1$ 恰是被禁止的相互作用通道（$P^{(1)}$ 投影到的就是 $r=1$），零模必须在该通道分量为 0 ⇒ 每个对的 $r$ 只能是 $3,5,\dots$。$b^3$（而非 $b$）是 Laughlin 填充 $1/3$ 的来源：指数 $=1/\nu$。
`Lean:` `Polynomial/PhysicalLaughlinKernel.lean` 的 `physical_Laughlin_kernel`（iff 形式）、`laughlinVector_zero_energy`、`physical_Laughlin_ground_line`，支撑文件 `Polynomial/BracketCoprime.lean`（Gauss/互素）、`BracketIrreducible.lean`（不可约）、`BracketProductDivisibility.lean`（$\prod b^3$ 整除）、`LaughlinAntisymmetry.lean`、`LaughlinDegree.lean`、`LaughlinMultidegree.lean`（度数计数）、`Operators/GlobalPairCube.lean`、`Operators/PhysicalPairKernel.lean`。**七个专门文件对应七步链条**，其中 `LaughlinMultidegree.lean` 的存在说明"multidegree 耗尽"这一步在 Lean 里不平凡。`Model.lean` 里 `monomialExponent`（Bool false → $Q-a$，true → $a$）就是把 $b_{ij}^ru_i^{Q-r}u_j^{Q-r}$ 的指数写成 Lean 的 `Fin N × Bool` 变量表。

**(d) [推测] 候选失败路线.**
- 路线 A：用"维数计数 + 已知 Laughlin 态在核里"证明唯一性（不证可除性）。文本证据：Haldane 的原证是这种风格，而本文强调 "elementary divisibility proof"，且必须给出"exact flux"（$Q$ 略大于 $3(N-1)$ 时核可能更大，维数法不控制）。
- 路线 B：跳过 $(-1)^r$ 奇偶论证。则无法排除 $r=2,4$ 通道，$\prod b^3$ 的整除不成立。
- 路线 C：用 $\prod_{i<j}b_{ij}$（幂 1）先做归纳再提升。`[推测]` 指数 3 与 $Q=3(N-1)$ 的匹配是"度数耗尽"成立的唯一方式，任何 $\nu$ 的变体都要重写第 6 步。

### 2.19 Corollary \label{thm:main} 的证明

> Apply Theorem~\ref{thm:fock} with $\gamma=1/25$. On each particle sector, the spectral theorem gives
> \[ H_{N,Q}\ge\frac1{25}\bigl(I-P_{\ker H_{N,Q}}\bigr) \]
> once $Q$ exceeds the common threshold. Take $Q=3(N-1)$ and apply Lemma~\ref{lem:kernel}. Choosing $N_0$ so that $3(N_0-1)$ exceeds the threshold proves the claim.

`[补]` 一处小瑕疵被论文自己抹平：thm:fock 只对所有 $0<\gamma<\gamma_*$ 成立，取 $\gamma=1/25$ 合法**仅因为** $1/25<\gamma_*$（01 节已声明）。谱定理给出的是 $H|_{(\ker)^\perp}\ge\gamma$，写成 $H\ge\gamma(I-P_{\ker H})$ ✓；再用 lem:kernel 把 $P_{\ker H_{N,Q}}$ 换成 $P_{\mathrm L,N}$，并把 $\gamma=1/25$ 的系数保留（$\ge\frac1{25}$ 而非 $\ge\gamma$）。

### 2.20 Corollary \label{cor:charge-neutral}[Charge versus neutral gap at fixed flux]

> For \(N\ge2\), fix \(Q_N=3(N-1)\) and write \(E_0(n;Q_N)=\min\operatorname{spec}H_{n,Q_N}\) for the coefficient-one interaction \eqref{eq:physicalH}. Let \(\operatorname{Gap}_N\) be the first positive eigenvalue of \(H_{N,Q_N}\), its neutral gap. The particle-number charge gap at this same flux,
> \[ \Delta_N=E_0(N+1;Q_N)+E_0(N-1;Q_N)-2E_0(N;Q_N), \]
> satisfies \[ \Delta_N=E_0(N+1;Q_N)\ge\frac{N}{N-1}\operatorname{Gap}_N>0. \]
> In particular, \(\Delta_N\ge N/[25(N-1)]\) for \(N\ge N_0\).

前置引用（逐字）："The following comparison specializes the recursive spectral relations of Lemm, Nachtergaele, Warzel, and Young \cite[arXiv v1, Theorem~2.1(I), Lemma~2.3, and (2.10)]{LemmNachtergaeleWarzelYoung2026Recursive}." 注意引用精确到 **arXiv v1** 的版本号与条目号——这是"外部定理作为黑箱"的强信号。

**(b) [补] 逐条核验.**
- 三个扇区非空：$N+1\le\dim U_{Q_N}=Q_N+1=3N-2$（$N\ge1$ ✓）。
- $E_0(N;Q_N)=0$ 且基空间一维：lem:kernel ✓。$\operatorname{Gap}_N>0$：因为 $N$ 粒子扇区维数 $>1$（$\dim\bigwedge^NU_Q>\!1$）✓。
- $E_0(N-1;Q_N)=0$：对 Laughlin 向量 $\Psi$，"each pair annihilator $B_p$ commutes with every $c_j$"（偶算子与奇算子交换）且 $\sum_j\|c_j\Psi\|^2=N\|\Psi\|^2$ ⇒ 某个 $c_j\Psi\ne0$；它仍是零能（$B_p(c_j\Psi)=c_jB_p\Psi=0$）✓ ⇒ $N-1$ 扇区有零模。
- $N+1$ 扇区无零模：整除论证要求 $\prod b^3$ 次数 $3N>Q_N=3(N-1)$ ✓ 矛盾 ⇒ $E_0(N+1;Q_N)>0$，于是 $\Delta_N$ 的前两项归约为 $\Delta_N=E_0(N+1)$ ✓（因 $E_0(N)=E_0(N-1)=0$）。
- 递归：LNWY Theorem 2.1(I) 取 $m_0=m_1=2$ 给
$E_0(N+1)\ge\frac{N+1}{N-1}E_0(N)+\frac{N+1-\|\mathcal G_N\|}{N-1}\operatorname{Gap}_N$，其中 $\mathcal G_N=P_{N+1}(\sum_jc_j^\dagger P_Nc_j)P_{N+1}$；其 Lemma 2.3 给 $\|\mathcal G_N\|\le\operatorname{rank}P_N=1$ ✓。代入 $E_0(N)=0$、$\|\mathcal G_N\|\le1$ 得 $\ge\frac{N+1-1}{N-1}\operatorname{Gap}_N=\frac{N}{N-1}\operatorname{Gap}_N$ ✓。再由 cor:thm:main 的 $\operatorname{Gap}_N\ge1/25$ 得 $\Delta_N\ge\frac{N}{25(N-1)}$ ✓。
`[补]` $m_0=m_1=2$ 的含义应是"每次加/减的粒子数步长为 2 的递归参数"或该文献的分层指标，本文献只引用结论而不解释 —— 这是本篇对外部结果**最强**的依赖点。

**(d) [推测] 候选失败路线 / 证据.**
- 路线 A：自己证电荷隙。文本证据：01 节承认 "a uniform bound for the full pseudopotential still requires control of the model-specific ground-space overlap matrices in those criteria"，而本文只在 $\operatorname{rank}P_N=1$（唯一零模）时通过 —— 说明作者尝试过把 LNWY 准则直接用，发现需要额外输入，最后仅作为推论附带给出。`Lean:` `Charge/Comparison.lean` 把所需外部输入拆成三个 `Prop` 假设 `LNWYRecursionInput`、`LNWYRankOneInput`、`LaughlinChargeGroundInput`，并各自由一个 `…Input` 定理证明（`Charge/Recursion.lean:62`、`Charge/Overlap.lean:130`、`Charge/LaughlinGround.lean:8,97`），再以 `charge_neutral_of_published`/`charge_uniform_of_published` 组装 —— **"of_published" 这个命名直接暴露黑箱引用**。Charge 模块 10 文件 1000 行，全部用于这半页推论。
- 路线 B：把 $N/[25(N-1)]$ 说成"$\ge1/25$"。文本证据：论文保留 $\frac{N}{N-1}$ 因子（$>1$），措辞精确。
- 路线 C：误用 $\operatorname{rank}P_N$ 为 $N$ 粒子扇区维数。文本证据："The cited Lemma~2.3 gives $\|\mathcal G_N\|\le\operatorname{rank}P_N=1$." 用 lem:kernel 才得到 1，故 cor:charge-neutral **依赖** lem:kernel（若核更大则失效）。

### 2.21 Corollary \label{cor:plane}[Planar spectral gap]

> For every $N\ge2$, the untruncated planar Hamiltonian satisfies
> \[ (H_N^{\mathrm{pl}})^2\ge\gamma_* H_N^{\mathrm{pl}}, \]
> where $\gamma_*$ is the constant in Theorem~\ref{thm:fock}. Equivalently, if $P_{0,N}^{\mathrm{pl}}$ projects onto its kernel, then $H_N^{\mathrm{pl}}\ge\gamma_*(I-P_{0,N}^{\mathrm{pl}})$. The constant is independent of both particle number and total angular momentum. In particular, the case $\ell=3$ of the spectral gap conjecture in \cite[Conjecture~A.1]{Rougerie} holds, in its pair-projector normalization.

**(a) 设定逐字.**
> Let $\mathcal B$ be the Bargmann space of entire functions with norm $\|f\|_{\mathcal B}^2=\frac1\pi\int_{\mathbb C}|f(z)|^2e^{-|z|^2}\,d^2z$, $e_j(z)=z^j/\sqrt{j!}$. Multiplication by $\pi^{-1/2}e^{-|z|^2/2}$ identifies this space unitarily with the planar lowest Landau level at magnetic field $2$; changing magnetic length is a unitary dilation. For a pair of coordinates set $w=(z_1-z_2)/\sqrt2$ and $Z=(z_1+z_2)/\sqrt2$. Let $P^{(1)}$ be the orthogonal projector onto relative degree one, with no restriction on the degree in $Z$.

**(b) 证明补全.**
- 坐标变换 $(z_1,z_2)\mapsto(w,Z)$ 在 Bargmann 内积下幺正（高斯指数可加分解 $|z_1|^2+|z_2|^2=|w|^2+|Z|^2$）⇒ $\{wZ^p/\sqrt{p!}\}_{p\ge0}$ 是"相对次数 1"子空间的 ONB ✓。
- 该基在归一楔基下的系数：展开 $(z_1-z_2)(z_1+z_2)^p$ 得张量基系数，"passage to the normalized antisymmetric wedge multiplies it by $\sqrt2$" ⇒ $v_p^{\mathrm{pl}}(i,j)=(i-j)\sqrt{p!/(2^pi!j!)}\mathbf1_{i+j=p+1}$，`[补]` 与 eq:pairstar **逐项相同**（$\sqrt2$ 与 $1/\sqrt2$ 的来源见 2.5 的约定讨论）。于是"second-quantized pair-projector identity"给出 $H_N^{\mathrm{pl}}=\sum_{p\ge0}B(v_p^{\mathrm{pl}})^\dagger B(v_p^{\mathrm{pl}})$ ✓ —— 球面整套机器可原样搬用。
- 有限块比较：固定 $N,L$，齐次子空间基 $\{e_{i_1}\wedge\cdots\wedge e_{i_N}:\sum i_k=L\}$；$Q\ge\max\{L,N-1,2\}$ 时它等于球面上"总下降亏缺 $L$"的整个子空间；两个哈密顿量都保持该子空间（"a pair is annihilated and created with the same sum of orbital labels"）；只有 $p+1\le L$ 参与 ⇒ 有限多个矩阵元，由 eq:pair→eq:pairstar 收敛 ⇒ **按算子范数**收敛 ✓。
- 双极限的顺序（最 delicate 处，原文逐字）："Fix $0<\gamma<\gamma_*$. Theorem~\ref{thm:fock} gives $H_Q^2\ge\gamma H_Q$ for all sufficiently large $Q$. Restrict to the invariant block just described and let $Q\to\infty$. Norm convergence passes through the square and gives $(H_N^{\mathrm{pl}})^2\ge\gamma H_N^{\mathrm{pl}}$ on that block. Now let $\gamma\uparrow\gamma_*$; the cone of positive matrices is closed, so the same inequality holds at $\gamma_*$. The limit $Q\to\infty$ is taken separately for each fixed $\gamma$, allowing the flux threshold to depend on $\gamma$."
`[补]` 逻辑要点：**先 $Q\to\infty$（$\gamma$ 固定）、后 $\gamma\uparrow\gamma_*$**，顺序不能颠倒；否则要用 $Q\to\infty$ 时统一的 $1/\gamma$ 依赖，而球面版明确不给显式阈值。端点 $\gamma_*$ 之所以能取到，纯粹因为有限维正半定锥闭。
- 收尾："$\bigwedge^N\mathcal B$ is the Hilbert direct sum of its homogeneous subspaces, and $0\le H_N^{\mathrm{pl}}\le\binom N2I$. The block inequalities thus extend by continuity to the whole space." `[补]` 有界性 $\le\binom N2I$ 保证逐块不等式在无限直和上仍是有界算子不等式（无需一致阈值）。
- 与 Rougerie Conjecture A.1 的对接："Restriction to total degrees $L\le3N(N-1)/2$ gives exactly the sector in the cited conjecture for $\ell=3$." ✓（$3N(N-1)/2$ 是 $\prod_{i<j}b_{ij}^3$ 的总度数，即 Laughlin 态所在的度数层。）

**(c) 为什么磁场所取为 $2$、高斯尺度为 $e^{-|z|^2}$：** 使 $e_j=z^j/\sqrt{j!}$ 恰好归一，从而与 eq:pairstar 的 $2^p$ 完全对齐；"changing magnetic length is a unitary dilation" 一句预先说明结论与磁长度无关（$H^2\ge\gamma H$ 在幺正缩放下形式不变，因为隙是绝对量）。

**(d) [推测] 候选失败路线.**
- 路线 A：独立证明平面情形（不复用球面）。文本证据："The full-Fock-space estimate also gives a gap on the plane." 且证明完全依赖球面系数极限；作者显然把平面版当作推论而非第二定理——但因为端点 $\gamma_*$ 在此可达，它比球面版**更强**，`[推测]` 这很可能是先有平面猜想（Rougerie 的 folklore 版本）、再用球面机器证明后的"顺带收获"。
- 路线 B：在无限维直接取 $Q\to\infty$ 的强算子极限而不固定在 $L$ 的块上 ⇒ 范数收敛不成立（无限维单位球），无法把不等式取极限。文本证据："Only $p+1\le L$ can contribute. The finitely many matrix entries ... the convergence is in operator norm."
`Lean:` `Planar/Model.lean`（130 行）有 `sphereCoefficient`/`sphereCoefficient_eq`/`sphereCoefficient_tendsto`、`planarPairMatrix`、`sphereHamiltonian`、`*_tendsto`、`endpoint_of_sphere_blocks`；`Planar/Forms.lean`、`Planar/Restriction.lean`、`Planar/DegreeRestriction.lean` 分别处理二次型、限制与度数限制。**`endpoint_of_sphere_blocks` 这个命名正是"$\gamma\uparrow\gamma_*$ 取闭包"这一步**。比较器 `ComparatorChallenges/LaughlinPlanar.lean` 里只有 `HomogeneousState`、`fullEnergy`、`fullSquareNorm` 与 `planar_gap := by sorry`，解法在 `OAI/Analysis/Laughlin/UniformGap.lean` 用 `planar_gap := Planar.full_planar_endpoint ψ` 一行给出。

### 2.22 附录 A.1–A.2：行数据与三体有理算术

> Let $P=10^7$. The first two numbers of each row are $t$ and $\ell=P\lambda$. An entry $pj:a$ specifies the integer $a_{pj}$, with $p$ and $j$ parsed as separate single-digit labels; omitted entries are zero. Continuation lines belong to the preceding row. Define
> \[ \alpha_{pj}=\frac{a_{pj}}P\sqrt{\frac{2^p\binom{p+j}{p}}{2^t\binom{p+j}{t}}}=\frac{a_{pj}}P\sqrt{\frac{2^{p-t}t!(p+j-t)!}{p!j!}}. \]
> Every nonzero entry has $0\le p+j-t\le8$.
> In particular $P^2\eta=\sum_\rho\ell_\rho^2=93527408868499$.

> \[ \mathsf U(c,z,T,p)=\sum_{h=\max(0,p+z-T)}^{\min(p,z)}(-1)^{z-h}\binom zh\binom{T-z}{p-h}c^{p-h}, \]
> and set it to zero if $z$ or $p$ lies outside $[0,T]$. Expanding \eqref{eq:coupling} gives $s^{(1/\sqrt3)}_{z,T,p}=\mathsf U(2,z,T,p)\sqrt{2^z\binom Tz/(3^T2^p\binom Tp)}$.
> \[ P^2e_z=\sum_\rho\sum_{T=\max(z,t_\rho)}^{15}\frac{2^z\binom Tz}{3^T2^{t_\rho}\binom T{t_\rho}}X_{\rho,T}\left(X_{\rho,T}+2\ell_\rho\mathsf U(2,z,T,t_\rho)\right), \]
> where $X_{\rho,T}=\sum_{p+j=T}a^\rho_{pj}\mathsf U(2,z,T,p)$, with value zero on empty levels.

**(b) [补] $\mathsf U$ 的来历.** 把 eq:coupling 的 $(uX-vY)^z(vX+uY)^{T-z}/\sqrt{z!(T-z)!}$ 在归一单项式基 $X^pY^{T-p}/\sqrt{p!(T-p)!}$ 上展开：$X$ 的幂 $h$ 来自第一因子（$\binom zh(-v)^{z-h}$），$X$ 的幂 $p-h$ 来自第二因子（$\binom{T-z}{p-h}u^{p-h}$），第一因子还贡献 $u^h=(-1/\sqrt3)^{?}$……代入 $u=1/\sqrt3$、$v=\sqrt{1-u^2}=\sqrt{2/3}$ 并把 $(-1)^{z-h}$、$2^{z-h}$、$3^{-(T)/2}$ 类因子集中到根式里，就得到 $\mathsf U(2,z,T,p)$ 乘一个纯根式；论文写的形式把 $c=2$ 放在 $c^{p-h}$ 位置 ⇒ 与我的展开比较，$c$ 记录的是 $v/u=\sqrt2$ 的平方 ✓（这就是为什么"for $c\in\{1,2\}$"：$c=2$ 对应 $u^2=1/3$ 的三体、$c=1$ 对应 $u^2=1/2$ 的四体，$v/u=1$）。**这是一个极易读错但一验证就锁死的对应关系。**
`P^2e_z` 的完全平方结构：$e_z$ 的两项 $2\lambda s_{z,T,t}\Sigma + (\Sigma)^2$ 中，$\lambda=\ell/P$、$\alpha=a/P$、$s$ 的根式与 $\alpha$ 的根式相乘时**全部消掉**（$2^z\binom Tz/(3^T2^t\binom Tt)$ 型因子），所以 $P^2e_z$ 是整数除以整数。

**(c) 我的独立复算.** 按上述公式从 `verification/rows.txt` 重算 13 个 $\lfloor10^6m_z\rfloor$：**逐位对上** $1298313,211317,249,250,249,250,250,250,249,250,250,6470,250$（$z=2,4,5,\dots,15$）。也复核了 $\sum_\rho\ell_\rho^2=93527408868499$ ✓（七行的 $\ell$：7181518、$-112991$、$-4247311$、3438746、$-98645$、$-3160276$、1441784）。
**结论：三体一侧的附录是**自包含**的——只靠 rows.txt + eq:U + eq:erational 就能重跑，不需要任何未公开的中间数据。**

**(d) [推测] 失败路线/证据.** `[推测]` 作者用数值优化（半定规划或梯度搜索）挑出这七行，再交给精确算术验证；证据是 (i) $\ell_\rho$ 与 $a_{pj}$ 是 7 位整数（$P=10^7$ 的分辨率选择），(ii) 余量表里有 5 个值恰好是 249/250（$2.5\cdot10^{-4}$），说明搜索把约束推到数值容差边界，(iii) `verification/` 目录里**只有 rows.txt，没有验证脚本**——验证由论文公式与 Lean 承担，而非仓库里的可执行代码。
`Lean:` `Operators/Certificate.lean` 的 `rows`（同一份七行数据）、`U`、`X`、`e`、`limitBound`（$=\frac32(3z-1)(-1/2)^z$）、`eta_numerator`；`ThreeBody/Basic.lean` 有 14 条 `threeBody_2 … threeBody_15 : e z < limitBound z := by decide +kernel` 与汇总的 `threeBody_certificate`（`hz : z ∈ [2,4,5,…,15]`）。**13 条独立 `decide +kernel` 命题 ↔ 13 行表**，命名与表的顺序完全一致。

### 2.23 附录 A.3：四体有理算术、Leverrier–Faddeev 与符号表

> Fix $1\le D\le23$; all copy indices below lie in $\mathcal R_D$. Put $u_r=\frac1{r!(D-r)!}$, $(E_D)_{rs}=\sqrt{u_ru_s}Y_{rs}$, $(G_D)_{rs}=\sqrt{u_ru_s}Z_{rs}$. The matrices $Y,Z$ are rational. Define
> \[ \mathsf V_r(D,T;p,j,k)=\mathsf U(1,r,j+k,j)\mathsf U(1,D-r,T-r,p), \]
> with value zero for $r>j+k$. Two applications of \eqref{eq:coupling} give $S_r(D,T;p,j,k)=\mathsf V_r(D,T;p,j,k)\sqrt{2^{1-(j+k)-T+r}\frac{j!k!p!\,u_r}{(T-D)!}}$. Therefore
> \[ P^2Y_{rs}=-\sum_\rho\sum_{\substack{p,j;q,l\\T\ge D}}a^\rho_{pj}a^\rho_{ql}\mathsf V_r(D,T;p,j,k)\mathsf V_s(D,T;q,l,i)\times2^{1-2T+p+q-t_\rho+(r+s)/2}\frac{i!k!t_\rho!}{(T-D)!}, \]
> where $i=p+j-t_\rho$, $k=q+l-t_\rho$, and $T=p+j+k$. Both entry sums are ordered. To verify the cancellation, multiply the two factors in \eqref{eq:Srational} by the two factors \eqref{eq:alphadata}; the factorial product under the combined square root is $(t_\rho!i!k!)^2u_ru_s/((T-D)!)^2$. Using $j+k=T-p$ and $l+i=T-q$, its power of two has exponent $2+2p+2q-2t_\rho-4T+r+s$. Taking the positive square root and removing $\sqrt{u_ru_s}$ gives exactly the displayed factor.
> For an increasing quadruple $A$ of nonnegative indices with sum $D+1$, put $f(A)=\prod_{b\in A}b!$. If $(x,y,j,k)$ lists its elements, let $\sigma(x,y,j,k)$ be the sign of sorting this list into increasing order. In each summand below put $p=x+y-1$, and define
> \[ L_r(A)=2^{(1-2D+r)/2}\sum_{\substack{x<y\text{ in }A\\\{j,k\}=A\setminus\{x,y\},\ j<k}}\sigma(x,y,j,k)(x-y)\,p!j!k!\,\mathsf V_r(D,D;p,j,k). \]
> Combining \eqref{eq:pairstar} and \eqref{eq:Srational}, the coefficient of $w_{Dr}^*$ on the Slater wedge $A$ is $\sqrt{u_r/f(A)}L_r(A)$. Thus
> \[ Z_{rs}=\sum_{\substack{A\text{ increasing quadruple}\\\sum_{b\in A}b=D+1}}\frac{L_r(A)L_s(A)}{f(A)}. \]
> All exponents of two in these formulas are integers, since $r,s$ are odd.
> Let $D_u=\diag(u_r)$ and $D_{\sqrt u}=\diag(\sqrt{u_r})$. The matrix in \eqref{eq:4certificate} equals $D_{\sqrt u}MD_{\sqrt u}$, where
> \[ M=ZBZ,\qquad B=\diag\bigl((2\mathbf1_{r=1}+\eps)u_r\bigr)-D_uYD_u. \]
> Thus it suffices to check $M\ge0$ using rational arithmetic. This congruence uses only the positive diagonal $D_{\sqrt u}$; it does not invert $G_D$ or presume that its columns are independent.
> ... If $d=|\mathcal R_D|$, initialize $J=I_d$. For $b=1,\ldots,d$, compute in order
> \[ X=MJ,\qquad c_b=\frac{\tr X}{b},\qquad J=c_bI_d-X. \]
> This is the Leverrier--Faddeev recurrence applied to $-M$; see \cite{HouConference}. It gives $\det(xI+M)=x^d+c_1x^{d-1}+\cdots+c_d$.
> Exact evaluation of \eqref{eq:U}, \eqref{eq:Yrational}, \eqref{eq:Lrational}, \eqref{eq:Zrational}, and \eqref{eq:recurrence} gives: [sign table for $D=1..23$]
> Peyrl–Parrilo Theorem 5 ...
> Remark [Nature of the certificate]. The data above certify fixed spin-matrix inequalities. The positive comparison operator is a sum of squares by construction. No many-particle finite-size spectrum, numerical extrapolation, or assumed plasma property enters the argument.

**(b) [补] 逐因子核对 $Y$ 的根式消去（论文只给结论）.**
$S_r\alpha_{pj}\cdot S_s\alpha_{ql}$ 的根式内乘积 $=\frac{j!k!p!}{(T-D)!}\cdot\frac{l!i!q!}{(T-D)!}\cdot\frac{t!i!}{p!j!}\cdot\frac{t!k!}{q!l!}\cdot u_ru_s\cdot2^{[1-(j+k)-T+r]+[1-(l+i)-T+s]+(p-t)+(q-t)}$。阶乘部分 $=(i!k!t!)^2u_ru_s/((T-D)!)^2$ ✓（$j!,p!,q!,l!$ 全消）；2 的指数用 $j+k=T-p$、$l+i=T-q$ 化为 $2+2p+2q-2t-4T+r+s$ ✓（我逐项验算过）。开正根并提出 $\sqrt{u_ru_s}$ ⇒ $Y_{rs}$ 的显示因子 $2^{1-2T+p+q-t+(r+s)/2}\cdot i!k!t!/(T-D)!$ ✓（$(r+s)/2$ 是整数因为 $r,s$ 奇 ✓）。
`[补]` $Z_{rs}$ 的 $1/f(A)$：因为 $w_{Dr}^*$ 的 $A$ 系数是 $\sqrt{u_r/f(A)}L_r(A)$，Gram 矩阵 $(G_D)_{rs}=\sum_A\sqrt{u_r/f}\,L_r\cdot\sqrt{u_s/f}\,L_s=\sqrt{u_ru_s}\sum_A L_rL_s/f$ ✓ 与 $(G_D)_{rs}=\sqrt{u_ru_s}Z_{rs}$ 的定义一致，$Z_{rs}=\sum_AL_r(A)L_s(A)/f(A)$ ✓。
`[补]` 合同关系的推导：$\mathcal D_{\sqrt u}M\mathcal D_{\sqrt u}=G(2\chi-E_D+\varepsilon I)G$，用到 $\mathcal D_{\sqrt u}(2\chi+\varepsilon I)\mathcal D_{\sqrt u}=\mathrm{diag}((2\cdot\mathbf1_{r=1}+\varepsilon)u_r)$（因为 $\chi$ 只在 $(1,1)$ 为 1，提出后是 $2u_1$）与 $\mathcal D_{\sqrt u}E_D\mathcal D_{\sqrt u}=\mathcal D_uY\mathcal D_u$ ✓。

**(c) 我复现符号表时踩到的两个坑（重要取证结论）.**
按 eq:U/eq:V/eq:S/eq:Y/eq:L/eq:Z/eq:M/eq:recurrence 从零实现精确 `Fraction` 算术后，我最初**全部 23 条都不符**（$D\ge7$ 起符号错乱）。逐一排除了"整数除法丢精度"后，锁定两处真实歧义：
1. **eq:Yrational 的左端是 $P^2Y_{rs}$，不是 $Y_{rs}$。** 必须把求得的整数和除以 $P^2=10^{14}$ 才能与 $B=\mathrm{diag}((2\mathbf1_{r=1}+\varepsilon)u_r)-\mathcal D_uY\mathcal D_u$ 里的 $O(1)$ 对角项同尺度相减；不除则 $Y$ 部分大 $10^{14}$ 倍，$\mathrm{tr}\,M<0$，$D\ge5$ 全线错号。论文把这一事实藏在公式标题里，读者极易漏。
2. **"applied to $-M$" 不能当成"把 $M$ 换成 $-M$ 再跑标准 LF"。** 按打印的三条式子 $X=MJ,\;c_b=\mathrm{tr}X/b,\;J=c_bI-X$ 直接用 $M$ 迭代，得到的是 $\det(xI+M)$ 的系数（$c_1=\mathrm{tr}M>0$ 对 PSD 成立）；我按"$-M$"字面实现会让奇数号系数整体反号（$D=9$ 时 `-+000` vs `++000`）。
两处都改后，**$D=1..23$ 的符号表逐字复现**：`0`,`0`,`00`,`00`,`+00`,`000`,`+000`,`+000`,`++000`,`+0000`,`+++000`,`++0000`,`++++000`,`+++0000`,`+++++000`,`++++0000`,`++++++000`,`+++++0000`,`+++++++000`,`++++++0000`,`++++++++000`,`+++++++0000`,`+++++++++000` ✓✓。
并且 $D=5$ 的 $M_{11}=56737668577815655510619653/300647710720000000000000\approx188.718$，与 Lean `FiniteFlux/Positive05.lean` 的 `pivotsFive` 首元素**逐位相同**（同一文件 `pivotsFive = ![该值, 0, 0]` 的秩 1 形态 = 我的 `+00`）；$D=12$ 时 $M_{11}=0$ ✓ 对应"偶 $D$ 的 $r=1$ 列消失"。
**符号串的解读** `[补]`：尾部全 0 的个数 $=d-\mathrm{rank}$。例如 $D=23$ 给 `+++++++++000`（$d=12$，1 个零 ⇒ $\mathrm{rank}(M)=11$，即 $Z$ 有 1 维核 ⇒ 确实存在线性相关的加楔副本向量，直接印证 "we never assume ... independent"）；$D=13$ 给 `++++000`（$d=7$，rank 4）；偶 $D$ 的 rank 比奇 $D$ 少 1（$r=1$ 列消失）。所有 $c_b\ge0$ 且非零 ⇒ $M$ 的全部特征值非负（Peyrl–Parrilo 的有理系数 SOS 判据正是把"特征多项式系数非负"用作 PSD 的等价/充分检验）。

**(d) [推测] 失败路线 / 文本证据.**
- 路线 A：用浮点特征值判 PSD。文本证据：Remark 强调"entirely by rational arithmetic"，并引用 Peyrl–Parrilo《Computing sum of squares decompositions with rational coefficients》与 Hou 的 Leverrier–Faddeev 会议论文。`[推测]` 作者一度用数值 SDP/特征值检查（数据本身显然由数值搜索得到），最终为可审计性改用行列式系数判据。
- 路线 B：直接检验 $2\chi-E_D+\varepsilon I\ge0$。文本证据：合同式 $G(\cdot)G$ 与两处"不假设独立/不求逆"的声明。我算出的 $D=7$ 首元素 `+`、$D=12$ 首元素 0 与偶 $D$ 的秩亏一致，说明只有合同版本成立。
- 路线 C：用 Sylvester 顺序主子式。文本证据：LF 递推给出的是**全部**初等对称量而非顺序主子式；因为 $G_D$ 秩亏（列相关），顺序主子式判据不适用（$Z$ 可奇异地退化），而 $c_b\ge0$ 对对称 $M$ 是特征值非负的充分判据（Peyrl–Parrilo Theorem 5）。`[推测]` 这正是选 LF 的理由。
`Lean:` `FiniteFlux/` 931 文件 55080 行 = 23 个 $D$ 的展开数据：`Data12.lean` 定义 `candidateY_12 : Matrix (Fin 6)(Fin 6) ℚ` 的字面有理数（$d=6$ ✓ $=|\mathcal R_{12}|$）、`ComputeGram*`/`ComputeRow*`/`ComputeLDL*Batch*`/`ComputeQuadruples*` 分别对应 eq:Zrational、eq:Yrational、LDL 分解与"四元组 $A$"枚举，`LDLData*` 存下三角与主元，`Positive05…Positive23`（18 个文件）存最终 PSD 断言，`Row*`（50 个文件）存逐行贡献。判据形式是 `ldl_five := ... := by decide +kernel` + `four_body_five_positive`，即**用 LDL 主元非负代替论文的特征多项式系数非负**——两种判据的等价性依赖 $M$ 对称与主元不为负，`[推测]` Lean 侧换判据是因为 LDL 在有理数上更易机器验证。

## 三、叙事时间线：防御性 / 解释性句子全量摘录

本节按论文出现顺序摘出所有"作者预先反驳"式句子（澄清陈述范围、否认做过某事、指出某细节不可省、把难点说明白），保留原始英文与 LaTeX 原样，行号指向 `build/sections/*.tex`。每条后给一行 `[分岔]`，说明"如果没有这句话、读者（或我自己反推时）会走到哪条错误路线"。`[推测]` 标记只用于我对动机的推断，句子本身是原文。

### 3.1 Introduction（`01-introduction.tex`）

**(1) L15–16.**
> explicitly distinguished the expected hard-core gap from a formal proof~\cite{HaldaneRezayi1985FiniteSize}.

`[分岔]` 若不先声明"历史上这是预期而非定理"，反推时会误以为存在可用的既有上界/下界引理，从而去找文献而非自己构造算子不等式。

**(2) L18–20.**
> The density-wave variational picture of Girvin, MacDonald, and Platzman explains important features of the excitation spectrum~\cite{GMP}. A variational excitation energy is an upper bound; the lower bound sought here must hold for every state orthogonal to the zero modes.

`[分岔]` 这是全文最值钱的一句：它明确否证"构造试探激发态"方向（那只能给上界），把问题压成"对所有态成立的下界"，于是唯一可行形态是 $H^2\ge\gamma H$ 这种算子不等式。`[推测]` quadratic-gap 路线的选择就是被这句话逼出来的。

**(3) L54–58.**
> Thus the spectrum is contained in \(\{0\}\cup[\gamma,\infty)\).
> In a particle sector without a zero mode, this statement bounds the energy
> away from zero; it does not assert a gap between that sector's two lowest
> eigenvalues. At Laughlin filling the zero mode is unique, and we obtain the
> usual ground-state spectral gap.

`[分岔]` 主定理的形式不是"两层能级之差"而是"到零的距离"，所以定理必然带投影 $I-P_{\ker H}$。反推时若把结论写成 $\lambda_1-\lambda_0\ge\gamma$ 会与证明手法不匹配（证明控制的是 $H$ 本身的正部分），必须等到 $\ker$ 唯一性（lem:kernel）才换成通常 gap。

**(4) L74–77.**
> The thresholds in Theorem~\ref{thm:fock} and Corollary~\ref{thm:main} are existential.
> The proof does not give an explicit flux threshold or the endpoint
> coefficient \(\gamma_*\) on finite spheres.

`[分岔]` 承认阈值是存在性的 ⇒ 任何"给出 $Q_0$"的读法都是过度声称；同时说明为什么有限 $Q$ 只能取 $\gamma<\gamma_*$、而 $\gamma_*$ 本身只在极限里出现（对应 07 那句 "the limit $Q\to\infty$ is taken separately for each fixed $\gamma$"）。`[推测]` Lean 侧把结论写成 `distanceToLaughlinSq` 的固定 $\gamma$ 形式，正是因为无法形式化"存在阈值"到具体数值的转化。

**(5) L86–89.**
> These results identify the zero modes that a spectral estimate must preserve. We include a short self-contained proof of the known spherical
> zero-mode uniqueness at the Laughlin flux in Lemma~\ref{lem:kernel}.

`[分岔]` 已知结论仍自证：因为推论需要 $\operatorname{rank}P_{\ker H_{N,Q}}=1$ 这一具体形式，文献（Chen–Seidel / Mazaheri 等）给的是零模刻画而不是"Laughlin 磁通下唯一"。若不写这句会显得在重复劳动；写了则说明 lem:kernel 是被 cor:charge-neutral 引用的必要组件。

**(6) L100–105.**
> The fermionic estimates already hold uniformly across particle sectors.
> The distinction in Theorem~\ref{thm:fock} is the full spherical pair
> interaction, with its fixed projector normalization and sphere radius
> growing in the thermodynamic limit. The finite support used in our
> auxiliary comparison operators does not truncate that interaction.

`[分岔]` "有限支撑"三个字如果不解释，几乎肯定被读成"截断赝势"（而截断后的模型 gap 与原问题无关，是常见退路）。这句与 L146–147、08 的 Remark 形成三点合围，反复否认截断。

**(7) L107–111.**
> Recent work gives further structural and spectral information.
> Lemm, Nachtergaele, Warzel, and Young derive recursions between particle
> sectors and compare charge and neutral gaps~\cite{LemmNachtergaeleWarzelYoung2026Recursive};
> a uniform bound for the full pseudopotential still requires control of
> the model-specific ground-space overlap matrices in those criteria.

`[分岔]` 排除了"用现成的扇区递推直接把 neutral gap 升成 charge gap"这条捷径——它需要对基态空间 overlap 矩阵的额外控制。作者反过来在自己的 06 里用 LNWY 的 Theorem 2.1(I)（只需 $\|\mathcal G_N\|$ 的上界），把自己已经有的 $H^2\ge\gamma H$ 喂回去，是"绕开这句指出的障碍"的正确用法。`[推测]` 顺序可能是：先有球面定理，才发现 LNWY 的 Lemma 2.3 恰好允许把自己的结果当输入。

**(8) L112–118.**
> Schraven and Warzel prove entanglement-gap and clustering results for
> Laughlin states on sufficiently thin cylinders~\cite{SchravenWarzel2026IMPS}.
> The entanglement spectrum is distinct from the Hamiltonian spectrum
> considered here. Density rigidity within the family of fully correlated
> Laughlin states is another complementary form of incompressibility,
> established by Lieb, Rougerie, and Yngvason~\cite{LRYRigidity}.
> No density-screening assumption enters our argument.

`[分岔]` 两句独立防御：entanglement gap ≠ Hamiltonian gap（防止"已被解决"的指控）；"No density-screening assumption enters our argument"（防止"你的热力学极限暗含密度筛选/需先固定填充因子"的方法论质疑）。

**(9) L120–125.**
> Rougerie's survey records the spectral-gap conjecture and its geometric
> formulations~\cite[Appendix~A]{Rougerie}. For $N$ fermions in the planar
> lowest Landau level, consider the sum over unordered pairs of the orthogonal
> projectors onto relative polynomial degree one, each with coefficient one
> and with center-of-mass degree unrestricted. Section~\ref{sec:plane} proves
> that its positive spectrum is bounded below by the endpoint $\gamma_*$,

`[分岔]` 平面版本必须先约定两件归一化细节（coefficient one；COM degree 不受限），否则 $\gamma_*$ 不可比。`[推测]` 这一约定是 cor:plane 能"直接引用 Rougerie 的猜想 A.1"的前提。

**(10) L143–147.**
> where each \(F_\rho\) is a specified linear combination of a pair
> annihilator and operators that annihilate three particles and create one.
> Here \(F_\rho(g)\) denotes rotation by \(g\), and Haar measure has mass
> one. These auxiliary operators involve finitely many orbital modes;
> the Hamiltonian itself is never truncated.

`[分岔]` 再次否认截断；同时"Haar measure has mass one"是在预先排除"归一化常数差 $2\pi^2$/$16\pi^2$"的经典质疑——$\mathbb K_Q$ 前的 $(2Q-1)$ 与 $24H$ 的系数全部依赖这个约定（见第五节 $\int dg$ 行）。

**(11) L149–158.**
> Rotational symmetry reduces the comparison to fixed spin blocks.
> The three-body blocks have an explicit spectrum and a summable tail.
> For four particles, coupling the interacting pair to the different spin
> sectors of a second pair can produce several copies of the same total spin.
> Their four-particle images under exterior multiplication can be linearly
> dependent.
> For the retained blocks, seven rows of rational data establish finite
> inequalities in their large-flux limits. The remaining issue is to transfer
> those inequalities to finite spheres without an error that grows with the
> number of particles.

`[分岔]` 这是全文的"难点自白"，给出两个不可回避的技术事实：(i) 加楔后的副本向量可以线性相关 ⇒ Gram 矩阵有核 ⇒ 一切"用逆矩阵/连续性传递正性"的做法失效；(ii) 迁移误差必须与粒子数无关。第 05 节整节是为 (ii) 存在的，lem:compression 是为 (i) 存在的。

**(12) L160–168.**
> The key device is an exact diagonal change of variables for the pair
> coefficients. On a fixed set of orbital modes, it converts finite-flux
> annihilators into their limiting forms. Every perturbation is then bounded
> by the local pair energy. Rotation averaging turns this into
> \(o(1)H_Q\) on the full Fock space. This relative estimate remains valid
> when the Gram matrices of these limiting four-particle images have kernels.
> A second useful observation
> is to apply Bessel's inequality to all equivalent spin copies at once;
> this substantially reduces the four-body comparison error.

`[分岔]` "exact diagonal change of variables" 是 $\Delta_Q$（乘积型对角量 $\prod_{x\in A}d_Q(x)$）的白话描述；"substantially reduces" 的量化即 $10946\to1222$（第五节）。若不先做这个"一次 Bessel"的观察，四体项系数会大到吃掉全部余量——这是我在 2.15 里 [推测] 的失败路线。

**(13) L170–181.**
> The comparisons leave a positive margin:
> \begin{equation}\label{eq:budget}
>  H_Q^2\ge\mathcal K_Q+
>        \bigl(\gamma_*-o(1)\bigr)H_Q.
> \end{equation}
> All errors and convergence
> thresholds are independent of particle number.
> Figure~\ref{fig:transfer} isolates the passage responsible for this
> uniformity. A small norm error on a growing many-particle space would not
> suffice: it must vanish on the zero modes and be controlled by the pair
> energy. The fixed-mode comparison gives precisely that control before
> rotations distribute it over the sphere.

`[分岔]` "A small norm error ... would not suffice" 是一句精确的技术否定：$\|E\|\le o(1)$ 不够，必须有 $-c\,H\le E\le c\,H$ 型相对界。反推时最容易犯的错就是先证算子范数小再宣称 gap——这里明确说那样会破坏零模。同时点出两个必要条件："vanish on the zero modes" 与 "controlled by the pair energy"。

**(14) L186–188（图注，`figures/relative-transfer.tex` 的三个盒子文字一并转写）.**
> \caption{The finite-sphere comparison preserves an error relative to the
> pair energy at every step. The limiting positivity is imposed only after
> wedging; no invertibility of its Gram matrices is required.}

图内三盒（原样）：
> \textbf{Finite limiting matrices}\\[2pt] Exact positivity on the\\four-particle space
> \textbf{Fixed set of modes}\\[2pt] Exact change of variables;\\error bounded by pair energy
> \textbf{All particle sectors}\\[2pt] Add spectator modes and\\average over rotations

`[分岔]` "imposed only after wedging" 就是 lem:compression 的叙事版：正性检验的对象是 $G=W^\dagger W$ 与 $WCW^\dagger$ 的等价，而不是先假设 $W$ 列满秩。"no invertibility ... is required" 与 08 的 "does not invert $G_D$" 是同一条防御的两次落地。

### 3.2 Section 02（`02-operators.tex`）

**(15) L25–28.**
> This pair-annihilator form is standard in the algebraic treatment of
> pseudopotentials~\cite[Sections~II.B--D]{OrtizNussinovDukelskySeidel};
> see also \cite[Equation~(2)]{ChenSeidel2015}. We verify its coefficient-one
> normalization here.

`[分岔]` 系数 1 不是显然的（文献 [ChenSeidel2015] 的 Equation (2) 写法不同），作者选择自己验证 $\binom N2$ 抵消。

**(16) L48–59（lem:square 证明全文，含两处防御）.**
> In normal ordering $B_p^\dagger(B_pB_r^\dagger)B_r$, only the two inner annihilators cross the two inner creators. Two, one, or zero contractions leave two-, three-, or four-body terms, respectively. On two particles, $H=\Pi_{V_Q}$ is a projection, so the two-body coefficient is $\Pi_{V_Q}$. ...
> There is no extra factor of two: this sum, and the defining basis of $V_Q\otimes V_Q$, both use ordered pairs. On three particles, $H=W_3W_3^\dagger$, since $W_3$ restricted to $v_p\otimes U_Q$ is the map $B_p^\dagger$ from one to three particles. Subtracting its two-body contribution from $H^2$ therefore determines the remaining coefficient as
> \[
>  (W_3W_3^\dagger)^2-W_3W_3^\dagger
>  =W_3(W_3^\dagger W_3-I)W_3^\dagger.
> \]
> Normal-ordered coefficients are determined successively by these restrictions, proving the identity on Fock space.

`[分岔]` 两处关键：`There is no extra factor of two`（有序对 vs 无序对的 2 因子歧义——我在 2.4 里给出反例说明若误加因子 2 会破坏恒等式）；`determined successively by these restrictions`（不用 CAR $\{B(v),B(w)^\dagger\}=\langle v,w\rangle I$，因为该式在 pair annihilator 上**不成立**，见 2.4 的 $\mathbb C^3$ 反例）。这是我从 Lean `Operators/` 与文本双重印证的最重要技术分岔。

### 3.3 Section 03（`03-spin.tex`）

**(17) L5–8.**
> The spherical pair coefficients can be expressed through angular-momentum
> coupling~\cite[Section~II.C and Appendix~A]{OrtizNussinovDukelskySeidel}.
> We derive the particular coefficients and fixed-deficit limits needed
> here to keep their phases and normalization explicit.

`[分岔]` 相位（$v_0=-e_0\wedge e_1$、$(-1)^z$）必须自定：$\alpha$ 系数进入 $F_\rho$ 的平方和，相位错会整体改变 $Y_{rs}$ 的符号。

**(18) L23–31（lem:pair 归一化的两种验证）.**
> Apply simultaneous lowering $p$ times to $-e_0\wedge e_1$ and divide by $\sqrt{(2Q-2)_p p!}$. Expand the lowering operator binomially. Combining the two contributions to each increasing pair gives \eqref{eq:pair}. Taking the limit gives \eqref{eq:pairstar}.
> The normalization can also be checked directly: the square of the coefficient in \eqref{eq:pair} is ... and differentiating \((1+x)^Q\) gives ...

`[分岔]` "can also be checked directly" 提示作者曾因归一化出过错（我在 2.5 记了自己的两次错误推导：$\sqrt6$ 系数与 $\sqrt{j!(Q-1)_{j-1}}$ 因子）。

**(19) L52–54（lem:q）.**
> In particular $W_3R_{3,z}=0$ for $z=0,1,3$ whenever these indices are allowed.

`[分岔]` "whenever these indices are allowed" 是有限 $Q$ 的边界条件防御：$z\le Q$、$R_{3,z}$ 只在允许范围存在；若漏掉，$q_0,q_1,q_3$ 会在 $Q<3$ 时被误用（第五节 Q≥2/4/24 各行与此相关）。

**(20) L101–105（lem:coupling 证明）.**
> With sign $(-1)^z$ at $p=0$, normalization yields the coefficients of $(uX-vY)^z/\sqrt{z!}$ in the limit. The change of variables $(X,Y)\mapsto(uX-vY,vX+uY)$ is orthogonal, so these polynomials have norm one in the normalized-monomial inner product. ... In the limit this acts by multiplication by $(vX+uY)/\sqrt{T-z+1}$. Induction proves the statement for fixed descendants.

`[分岔]` 固定亏损极限用正交变量替换保范数，避免逐系数极限求和；"Induction" 说明后代级数不靠闭式。

### 3.4 Section 04（`04-comparison.tex`）

**(21) L15–18.**
> This follows from Schur's lemma applied to each pair of irreducible
> copies, with the scalar fixed by its trace; see
> \cite[Section~II.C]{BartlettRudolphSpekkens}. In particular, averaging
> preserves off-diagonal entries between equivalent spin copies.

`[分岔]` 平均**保留**副本间非对角块——这是 $\chi_{rs}$、$Z$、$Y$ 这些"副本矩阵"能进入比较的前提；若误以为 Schur 平均把所有非对角杀死，四体证书就无从写出。

**(22) L20–25.**
> The positive-square construction belongs to the quadratic-gap approach
> described in Section~\ref{sec:intro}. Fermionic positivity constraints,
> normal ordering, and symmetry also appear in the quantum Hall bootstrap
> of Gao et al.~\cite{GaoLanzettaLedwithWangKhalaf}, which bounds ground-state
> energies. Here the explicit squares are compared with $H_Q^2-\gamma H_Q$
> to control the positive excitation spectrum.

`[分岔]` 与 bootstrap 划界：bootstrap 用地面态能量（线性规划下界），本文比较的是 $H_Q^2-\gamma H_Q$（谱性质）。

**(23) L147–154.**
> For even $D$, the $r=1$ coupled vector is antisymmetric under exchange
> of its two spin-$a$ factors, since its coupling deficit is $D-1$.
> Wedging two degree-two vectors is symmetric, so this target column then
> vanishes after applying $\widehat W$. The formula with $\chi$ still
> represents it exactly; we never assume that the wedged copy vectors are
> independent.

同段 L154 独立成句：**"Target spin blocks outside $1\le D\le23$ contribute positively and may be discarded in a lower bound."**

`[分岔]` 偶 $D$ 的目标列恒为 0（我在 2.12 用 $D=12$ 的 $M_{11}=0$ 复现了它），并且这里首次出现 "we never assume ... independent"，与 05/图注三度呼应。"discarded ... contribute positively" 说明 $D$ 截断不是近似而是丢掉正项——这条对 Lean 侧 `FourBody/TotalAllowance` 的范围检查至关重要。

### 3.5 Section 05（`05-transfer.tex`）

**(24) L3–7（节首，全节动机）.**
> The limiting Gram matrices have kernels, so their positivity cannot be
> transferred by assuming that their ranges vary continuously.  Instead, we
> compare the annihilators themselves.  An exact diagonal change of variables
> reduces every error to a fixed finite family of pair-generated annihilators.
> This gives an error relative to $H_Q$, uniformly on the full Fock space.

`[分岔]` 明确否定"range 连续变化"论证（这是矩阵扰动理论里最常见的做法，也是我在 2.13 里 [推测] 的第一条失败路线）；改为 $GCG\ge0\iff WCW^\dagger\ge0$ 的代数等价。

**(25) L9–14.**
> Geometry-dependent diagonal changes of occupation-number coordinates
> already relate pseudopotential annihilators and their zero modes~\cite[Section~II.E]{OrtizNussinovDukelskySeidel}.
> For a gap estimate, the needed additional statement is quantitative:
> on a fixed set of modes the change of variables approaches the identity,
> and its error is controlled by pair energy. The proof below establishes
> that statement before adding spectator modes and averaging over rotations.

`[分岔]` 承认 $\Delta_Q$ 这类对角换元是已知的（Ortiz 等 Section II.E），本文的增量是"定量 + 相对 $H$ 控制"。同时预告论证次序：先固定模式集，再加 spectator，最后旋转平均——顺序错了会让 spectator 的粒子数进入常数。

**(26) L134.**
> For clarity, the perturbation estimate does not require $M_*\ge0$.

`[分岔]` 少见的"预防误读"句：$R_Q$ 的定义里同时出现 $M_Q$ 与 $M_*$，读者会以为要把极限矩阵的正性搬到有限 $Q$。实际上只需逐块 $\|R_Q\|\le\rho_Q\to0$。`[推测]` "For clarity" 说明草稿里曾把这两步混写过。

**(27) L158–165（spectator 论证收尾）.**
> Under the isometry that sends a local wedge tensored with a spectator
> wedge to their ordered product, each $c_j$ with $j\le24$ is its local
> annihilator tensored with the identity. The fermionic parity factor belongs
> to annihilators in the later spectator modes, which do not occur here.
> Thus every operator in \eqref{eq:relative} acts on the local factor alone.
> Tensoring the local inequality with the identity proves
> it on $\FF_Q$, with the same $\rho_Q$, regardless of the number of
> occupied modes outside this factor.

`[分岔]` 均匀性（与 $N$ 无关）就藏在这四行：Jordan–Wigner 型奇偶因子只在更后面的模式出现，所以固定 25 模式内不需要它。`[推测]` 若忘了这一点，$\rho_Q$ 会带上 spectator 依赖，全文的 $o(1)H$ 立刻失效——这是 Lean 里 `Fock/` 与 `Operators/` 分别证明"局部 + tensor identity"的原因。

**(28) L168–171.**
> The allowance $\eps I$ in the certificate must also be paid for in pair
> energy.  Here it is useful to sum over the orthonormal highest vectors
> \emph{before} estimating their wedges.  Bessel's inequality then avoids
> an extra factor equal to the number of spin copies.

`[分岔]` "sum before estimating" 是 $10946\to1222$ 的唯一开关；$\varepsilon$ 在证书里是可"白付"的，但迁移到 $H$ 时必须用 $1222\varepsilon$ 结算（第五节 $\varepsilon$ 行的"临界性"即此）。

**(29) L230–231.**
> The discarded target spin blocks are positive.  Removing the allowance
> therefore proves \eqref{eq:A4bound}.

`[分岔]` 与 04 L154 第二次声明"丢弃 = 丢正项"。

### 3.6 Section 06（`06-gap.tex`）

**(30) L19–24（lem:tail 前半）.**
> For $16\le z\le Q$, the bracket in \eqref{eq:q} is positive, since it is at least $2z-2$. Thus only odd $z$ contribute negatively. ... Averaging each summand proves \eqref{eq:tailbound} with \eqref{eq:delta}.

`[分岔]` 先定号再估计——"$2z-2$" 是我在 2.16 补的中间步（$3z-1-z(z+1)/Q\ge 3z-1-(z+1)=2z-2$）。"only odd $z$" 决定了 $\delta_Q$ 的求和步长 2，从而 $61/4096=1952/2^{17}$ 的算术结构。

**(31) L26–32.**
> For $Q\ge4$, the ratios in $(Q)_z/(2Q-2)_z$ are nonincreasing, so
> \[ \frac{(Q)_z}{(2Q-2)_z}\le\left(\frac Q{2Q-2}\right)^z \le(2/3)^z,\qquad \frac{d_{3,z}}{d_a}\le2. \]
> The summands, extended by zero for $z>Q$, are therefore dominated by $6z(z+1)(2/3)^z$.

`[分岔]` "extended by zero for $z>Q$" 是控制收敛能用的前提（$z$ 上限随 $Q$ 变）；"$Q\ge4$" 是全文最小的显式阈值来源之一（$Q/(2Q-2)\le2/3$）。

**(32) L38–41.**
> For the last identity, write $z=17+2m$. Then $(3z-1)(z+1)=900+208m+12m^2$, while the sums of $4^{-m}$, $m4^{-m}$, and $m^24^{-m}$ are $4/3$, $4/9$, and $20/27$, respectively. Multiplication by $(3/2)2^{-17}$ gives $61/4096$.

`[分岔]` 作者把闭式求和的中间量全部打印出来（我 2.16 已逐项验算 $900\cdot\tfrac43+208\cdot\tfrac49+12\cdot\tfrac{20}{27}=\tfrac{3904}{9}$，乘 $(3/2)2^{-17}$ 得 $1952/2^{17}=61/4096$ ✓），说明这一步是纯算术、不需要引外部级数表。

**(33) L82–88（lem:kernel 的两处防御）.**
> Gauss's lemma therefore makes it irreducible in the polynomial ring. Brackets for distinct unordered pairs are nonassociate. They are consequently relatively prime. Unique factorization implies ...
> This product has degree $3(N-1)=Q$ in each particle's spinor variables, exhausting the multidegree of $\Psi$; the quotient is constant.
> Conversely, $\Psi_{\mathrm L,N}$ is antisymmetric. Its factor $b_{ij}^3$ leaves pair degrees $Q-3$ in each spinor, whose maximum total pair spin is $Q-3$. Multiplication by the invariant bracket cannot introduce spin $Q-1$. Hence every pair projector annihilates $\Psi_{\mathrm L,N}$.

`[分岔]` 反向（构造的确为零模）比正向更难：不能只说"度数用完"，必须论证 $b_{ij}^3$ 之外的因子不会把 pair spin 抬回 $Q-1$。"Multiplication by the invariant bracket cannot introduce spin $Q-1$" 是关键的一句不可见引理（$b_{ij}$ 自身 spin $Q-3$ 视角的极值论证）。`[推测]` 若不写这句，正向 UFD 论证会被误以为已足够。

### 3.7 Section 07（`07-plane.tex`）

**(34) L4–6, L13–15, L23.**
> The full-Fock-space estimate also gives a gap on the plane. We use the
> analytic lowest-Landau-level representation described by Girvin and
> Jach~\cite[Section~II]{GirvinJach}, with Gaussian scale fixed below.
> Multiplication by $\pi^{-1/2}e^{-|z|^2/2}$ identifies this space unitarily
> with the planar lowest Landau level at magnetic field $2$; changing magnetic
> length is a unitary dilation.
> Thus each pair projector has coefficient one, as on the sphere.

`[分岔]` 高斯尺度/磁场 2 的约定必须在开头固定，否则 $v_p^{\mathrm{pl}}$ 与 $v_p^*$ 的极限一致就不成立（L47–50 明说 "These are exactly the limits in \eqref{eq:pairstar}"）。"coefficient one, as on the sphere" 保证 $\gamma_*$ 可跨模型直接引用。

**(35) L61–68（有限块对齐）.**
> For $Q\ge\max\{L,N-1,2\}$ this is also the entire spherical subspace of total
> lowering deficit $L$, under the identification of normalized one-particle
> bases.  Both Hamiltonians preserve this subspace: a pair is annihilated
> and created with the same sum of orbital labels. ... The finitely many matrix entries ... converge to those of the planar restriction by \eqref{eq:pair}--\eqref{eq:pairstar}.  The convergence is in operator norm.

`[分岔]` 平面 $H$ 是无界指标（$p\ge0$）的和；把它压进"固定总亏损 $L$ 的有限维块"才能用有限维收敛。$Q\ge\max\{L,N-1,2\}$ 是这个块论证的最小阈值来源（第五节）。

**(36) L74–78.**
> Now let $\gamma\uparrow\gamma_*$; the cone of positive matrices is closed,
> so the same inequality holds at $\gamma_*$.  The limit $Q\to\infty$ is taken
> separately for each fixed $\gamma$, allowing the flux threshold to depend
> on $\gamma$.  Here $N$ and $L$ were arbitrary, and the resulting constant is the
> same for all of them.

`[分岔]` 端点 $\gamma_*$ 的取得靠"正锥闭性 + 先固定 $\gamma$ 再取 $Q$"两步，顺序不可交换（否则阈值会依赖 $\gamma$ 的论证不成立）。这句与 Introduction L76–77 是一对：那边承认有限球拿不到端点，这边说平面极限能拿到端点。

### 3.8 Section 08（`08-arithmetic.tex`）

**(37) L111–113.**
> Thus it suffices to check $M\ge0$ using rational arithmetic. This
> congruence uses only the positive diagonal $D_{\sqrt u}$; it does not
> invert $G_D$ or presume that its columns are independent.

`[分岔]` 第三次（也是最后、最硬的一次）出现"不假设独立/不求逆"，落点在合同变换只用正对角矩阵。这直接对应我复现出的 $\operatorname{rank}(M)<d$（$D=23$ 时 $d=12$、rank 11）。

**(38) L124–126.**
> This is the Leverrier--Faddeev recurrence applied to $-M$;
> see \cite{HouConference}. It gives
> $\det(xI+M)=x^d+c_1x^{d-1}+\cdots+c_d$. For example, this recurrence follows by multiplying the polynomial adjugate of $xI+M$ by $xI+M$ and comparing coefficients, together with the derivative-of-determinant trace identity.

`[分岔]` "applied to $-M$" 的字面实现会整体反号（我在 2.23 记为复现陷阱 2，靠 $D=9$ 的 `-+000` vs `++000` 判定）；打印出的三条式子 $X=MJ,\ c_b=\operatorname{tr}X/b,\ J=c_bI-X$ 配 $M$ 本身才给出 $\det(xI+M)$。作者额外给了一句"怎么验证这个递推"，说明他预期读者会在这里卡住。

**(39) L143–148.**
> The signs list the coefficients after the leading $1$, in descending degree.
> For each computed coefficient, choose a positive denominator and inspect
> its integer numerator: \texttt{+} denotes a positive numerator and
> \texttt{0} denotes zero. We use the characteristic-coefficient positivity test for symmetric
> matrices~\cite[Theorem~5]{PeyrlParrilo}. Every coefficient is nonnegative,
> so $\det(xI+M)>0$ for $x>0$. Since $M$ is real symmetric, a negative eigenvalue would give a positive root of this polynomial. Therefore $M\ge0$, proving \eqref{eq:4certificate}.

`[分岔]` 判据选择防御：不用 Sylvester 顺序主子式（$G_D$ 秩亏时不可用），改用"特征多项式系数非负 ⇒ 无负特征值"。注意原文逻辑链里 "$\det(xI+M)>0$ for $x>0$" 与"负特征值给正根"两步——我在 2.23 补了中间步：若 $\lambda<0$ 为特征值，则 $x=-\lambda>0$ 使 $\det(xI+M)=0$，与全部 $c_b\ge0$ 且 $c_1>0$（$M$ 非零）矛盾。

**(40) L150–152（Remark「Nature of the certificate」全引）.**
> The data above certify fixed spin-matrix inequalities. The positive comparison operator is a sum of squares by construction. No many-particle finite-size spectrum, numerical extrapolation, or assumed plasma property enters the argument. The exact equalities and inequalities in this appendix can be verified by a finite calculation using only integers and rational numbers.

`[分岔]` 四条否认（数值谱、外推、等离子体性质假设、非有理运算）——这是整篇论文可审计性的声明，也是 Lean 形式化的接口：Remark 只要求"整数与有理数的有限计算"，`decide +kernel` 恰好覆盖这一类。`[推测]` 这段是回应"数值拟合出 gap"的经典质疑（GMP/变分传统）。

### 3.9 时间线小结（`[推测]` 的写作/研究顺序重建）

把上面的防御句按"它否认的动作"排序，可反推作者的迭代路径：
1. 先确定"不能做"的清单（变分上界、截断、range 连续、Sylvester、密度筛选、entanglement 谱）——它们全部是**看似标准但会被一句话击毙**的路线，说明作者试过或至少在草稿里写过，之后删掉并留下否认句。
2. 三个反复出现（各两次以上）的短语构成三条真正的技术支柱："never truncated"（$K$ 是辅助的、$H$ 不动）、"only after wedging / no invertibility"（lem:compression）、"relative to the pair energy"（$\Delta_Q$ + 奇偶因子论证）。
3. 唯一一处 "For clarity"（05 L134）与唯一一处把求和分解打印到 $900+208m+12m^2$ 的粒度（06 L38–41），提示这两处是审稿/自审时反复出问题或反复被质疑的地方。`[推测]`

