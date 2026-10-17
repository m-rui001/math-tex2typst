# 反推思维链研究笔记素材：《A positive solution to Tingley's problem》

- 论文目录：`E:\math\preprints\A-positive-solution-to-Tingleys-problem-September-23-2026`
- 正文唯一来源：`build\main.tex`（单文件，544 行，无 sections\ 子目录；另有 `build\references.tex` 与 typst 目录中的 `main.typ` 并行版本，本笔记一律以 TeX 为准，不引用 PDF）。
- reasoning_traces：`E:\math\reasoning_traces\` 目录下经检索**无本论文的 summary**（目录内只有 mezard-parisi、Mahler、Vlasov–Maxwell 等其他论文），本笔记跳过该项。
- Lean 形式化：`formalization.yaml` 第 132–134 行登记该文；第 1598–1600 行登记比较器配置 `ComparatorChallenges/TingleySphereIsometry.json`、主声明 `OAI.Tingley.tingley_sphere_isometry_full`、文件 `OAI/Analysis/SphereIsometry/Extension.lean`。整个模块在 `E:\math\lean\OAI\Analysis\SphereIsometry\`，共 70 个 .lean 文件、9273 行。

**重要勘误（先于一切）**：任务背景提示把 Tingley 问题描述为"无穷维 Hilbert 空间上任意两个非零自伴算子是否酉等价于彼此的可数直和"。**这与本论文无关，TeX 原文不支持该描述**。本论文的 Tingley 问题是 Banach 空间单位球面上的度量延拓问题（Mazur–Ulam 型问题）：单位球之间的满射等距是否线性延拓。论文全文不涉及 Hilbert 空间、自伴算子、酉算子、谱测度、直和分解，也没有任何不动点定理以外的算子代数构造（不动点用的是 Kuratowski 非紧测度 + Darbo 定理 + Sperner/Brouwer，不是算子共轭）。本笔记按 TeX 原文重建真实内容；凡模板中要求核对"算子/谱参数"之处，均改写为对应的"泛函/范数参数"。若终端作者记忆中的"算子直和问题"另有出处（例如某些文献中 Tingley 问题在算子代数上的变体），那是本论文未述的内容，本论文不覆盖。

# 一、定理总览

## 1.1 Tingley 问题的精确原始陈述（TeX 原文照抄）

摘要（`\begin{abstract}`，main.tex 第 43–45 行）：

> Every surjective isometry between the unit spheres of real Banach spaces extends uniquely to a surjective real-linear isometry, giving an affirmative solution to Tingley's problem. If distances between different radii are not preserved, we realize the positive maximal defect in a possibly enlarged pair of Banach spaces. We then align extremal chords using common supports and Darbo's fixed-point theorem and obtain a contradiction from support and convexity estimates.

导言第 49 行给出问题的原文陈述：

> For a real normed space $X$, write $S_X=\{x\in X:\norm{x}=1\}$, with the distance inherited from $X$. Tingley's problem asks whether every surjective isometry $f:S_X\to S_Y$ extends to a real-linear isometry of the spaces \cite{Tingley1987}. Any such extension must be the radial map below. This candidate preserves norms and distances at each fixed radius; the difficulty is to recover distances between points at different radii from the metric on a single sphere. We prove the full assertion.

出处：`Tingley1987` = D. Tingley, *Isometries of the unit sphere*, Geometriae Dedicata **22** (1987), 371–378（references.tex 第 127–131 行）。论文未述该问题提出的更早年份；参考文献只给 1987 年论文，且论文自述该文"established preservation of antipodal points for surjective isometries between finite-dimensional Banach-space spheres"。标题中的 "real" 关键：这里 $S_X$ 是**实** Banach 空间单位球；对复空间视为实空间处理（下详）。

## 1.2 主定理（TeX 原文照抄，Theorem 1.1，main.tex 第 51–57 行）

```latex
\begin{theorem}\label{thm:main}
Let $X,Y$ be nonzero real Banach spaces and let $f:S_X\to S_Y$ be a surjective isometry. Then
\[
T(0)=0,\qquad T(x)=\norm{x}f\left(\frac{x}{\norm{x}}\right)\quad(x\ne0)
\]
is a surjective real-linear isometry. It is the unique linear extension of $f$.
\end{theorem}
```

第 59 行的范围声明：

> The spaces may have arbitrary dimension and need not be separable, reflexive, smooth, or strictly convex. Applied to complex Banach spaces regarded as real spaces, the conclusion is real linearity; complex linearity is not asserted.

即：定理是**无附加几何假设的全称正面解**——任意维、不必可分/自反/光滑/严格凸；复空间只得到实线性。

## 1.3 总体构造分层（论文自述的机器结构）

论文第 112 行给出章节路线图（原文逐字）：

> Section~\ref{sec:supports} supplies the finite-dimensional supports and continuous radial contacts. Section~\ref{sec:attainment} makes a positive defect attain its maximum in a new pair of Banach spaces while retaining the bound at every radius. Section~\ref{sec:alignment} constructs the invariant directions and applies the fixed-point theorem. Section~\ref{sec:comparison} eliminates the resulting aligned configuration: one parameter regime contradicts maximality after a small radial perturbation, and the remaining regime contradicts a preserved sphere distance by convexity. Section~\ref{sec:extension} deduces the onto radial metric extension and proves real linearity by midpoint reflection. All auxiliary arguments are included, with the fixed-point proofs in Appendix~\ref{sec:appendix}.

据此，证明分五层产出物：

- **层 0（§2 supports）**：产出两件"几何小工具"：(i) 三角等式 $\|\alpha v+\beta w\|=\alpha+\beta$ ⟹ 存在同时在 $v,w$ 取值 1 的公共支撑泛函（Lemma 2.1）；(ii) 从内点 $c$（$\|c\|<1$）出发的每条射线 $c+\R_+v$ 与球面有唯一切点、半径函数 $\rho(v)$ 连续且有 $1-\|c\|\le\rho\le1+\|c\|$（Lemma 2.2）。这两件是全篇所有"支撑传播"和"回返映射连续性"的原子。
- **层 1（§3 attainment）**：把"是否存在正缺陷"这一全局问题**规范化成一个 attained 配置**：定义跨半径缺陷 $D_q(x,y)=\|f(x)-qf(y)\|-\|x-qy\|$ 与其绝对上确界 $M$；若某满射球等距有 $M>0$，则用自由超滤器 $U$ 上的 ultraproduct 商空间 $Q_X,Q_Y$ 加完备化，把缺陷造到一个**新的** Banach 空间对上，使得逐点半径 $t$ 处 $\|f(x_0)-tf(y)\|-\|x_0-ty\|=M>0$ 精确取到，且全局界 $|D_q|\le M$ 对所有对、所有 $q$ 保留（Lemma 3.1）。产出物：配置 (eq:maximal)。此后§4–5 全程只谈这个配置。
- **层 2（§4 alignment）**：在 attained 配置内，围绕固定基点 $ty$ 造"回返映射" $g$：方向 $v$ → 球面切点 $x(v)=ty+pv$ → 像 $f(x(v))=tb+sw$ → 沿 $-w$ 的另一侧球面切点 $f(z)=tb-uw$ → 拉回 $z$ → 反向归一 $g(v)=(ty-z)/r$。证明 $g$ 保持一个不变闭凸集 $C\subset\clco\{v_0,v_1,\dots\}\subset E$（$E=\{v: s(v)-p(v)=M\}$，"极值方向集"），且 $g$ 以系数 $\gamma=(1-M/(1+t))^2<1$ 压缩 Kuratowski 非紧测度 $\chi$。Darbo 定理给不动点 $v\in C$。产出物：Proposition 4.2 的"对齐弦"配置——同一方向线上四个端点 $x=ty+pv,\ z=ty-rv,\ f(x)=tb+sw,\ f(z)=tb-uw$，满足 $s-p=r-u=M$，$d:=p+r=s+u=\|x-z\|\le2$。
- **层 3（§5 comparison）**：对对齐弦做两分支消元。参数 $A=p/d,\ B=u/d,\ \epsilon=1-t$。Secant 引理（Lemma 5.1）用缺陷界在两个特殊半径 $t-sh,\ t+uh$ 上榨出支撑下界 $\epsilon/p\le\varphi(v)$ 与上界 $K\le 1-B$（$B\le\epsilon$）或 $K\le B$（$B>\epsilon$）。若 $B>\epsilon$：径向微扰（Lemma 5.2）经逆构型传播得 $A>\epsilon$ 与支撑符号矛盾；故 $A,B\le\epsilon$。剩下小参数支：对原构型与逆构型各用一次 secant 得 $\epsilon\le dA(1-B),\ \epsilon\le dB(1-A)$，两者较小者 $<d/4\le1/2$ 逼出 $\epsilon<1/2$，再由凸函数 $F(\lambda)=\|y+\lambda v\|$、$G(\lambda)=\|b+\lambda w\|$ 的 secant 斜率单调性给出 $\epsilon F(r/\epsilon)=\|y-z\|=\epsilon G(u/\epsilon)$ 两侧不一致（Proposition 5.3）。产出物：attained 正缺陷不可能存在。
- **层 4（§6 extension）**：层 1+3 合流 ⟹ 原球面图的 $M=0$ ⟹ 径向映射 $T$ 保所有跨半径距离（含 0）且满 ⟹ 用 Nica 的中点反射证明 Mazur–Ulam 仿射步 ⟹ $T$ 实线性、唯一。产出物：Theorem 1.1。
- **附录 A**：自足地证明 Darbo（Theorem 4.1），链条是 χ 的基本性质（Lemma A.1）→ 单纯形 Sperner 不动点（Lemma A.2）→ 紧凸 Schauder（Lemma A.3）→ condensing 迭代取交。

**反推视角的分层意义**：层 1 是"取极值"（超滤器替代紧性），层 2 是"找对齐"（不动点替代选择），层 3 是"极值+对齐 ⟹ 定量矛盾"（支撑/secant/凸性三件估计），层 4 是"退化到经典定理"。每层只依赖前两层的输出对象，接口干净——这正是 Lean 模块化能 1:1 对齐的原因（见 §四）。

## 1.4 关键参数账目（总览版，详表见 §五）

- $M\in[0,1]$：最大绝对缺陷，$|D_q|\le2\min(q,1-q)$（eq:defectbound）。全篇反设 $M>0$；取到最大值后自动有 $M/2\le t\le1-M/2$（Lemma 3.1 证明第 174 行）。
- $t\in(0,1)$：取极值的跨半径参数；$b=f(y)$ 固定。
- $p,r,s,u>0$：四段弦长半径，全在 $[1-t,1+t]$；关系 $s-p=r-u=M$、$d=p+r=s+u\le2$。
- $\epsilon=1-t$；$a=1-t$、$U=1+t$ 用于收缩系数 $\gamma=(1-M/U)^2\in(0,1)$（论文取 $\gamma$ 定义为 $(1-M/(1+t))^2$，且由 $r,s\ge a$ 得实际系数 $up/rs\le\gamma$）。注意：eq:contraction 后正文用 $a=1-t$ 与 $U=1+t$；Lean 中对应 `return_contraction_factor_mem_Ico`（ReturnMapBounds.lean:94）。
- $h=\min\{t/s,\ \epsilon/u\}$，$\theta=hs/p\le t/p$，secant 斜率 $K$（Lemma 5.1）。
- $A=p/d,\ B=u/d$，$A+B=1-M/d<1$。
- 逆构型置换 $(p',s',r',u')=(u,r,s,p)$、$(v',w',y',b')=(-w,-v,b,y)$（eq:inverse），$(A',B')=(B,A)$。

`[推测]` 为什么选这些参数与分解：(i) 缺陷只沿**单条基方向 $y$** 测（$x-qy$ 而非任意二元组），把二维问题降为一维射线族，后续所有支撑/secant 计算才能挤进 $\operatorname{span}\{v,y\}$ 的有限维对偶紧性；(ii) $s-p=M$ 定义 $E$ 而不是直接用 $D_t(x,y)=M$，是为了让"极值"变成方向的内在性质、可被支撑关系传播（传播规则要求的是等号而非估计）；(iii) $h$ 取两比值的最小者，保证 $t-sh$ 与 $t+uh$ 至少一个恰好落回 $[0,1]$ 的端点使对应缺陷为 0，这是 secant 上界 $K$ 的"免费单项"来源；(iv) $A,B$ 除以 $d$ 是为把 $A+B<1$ 变成凸函数 secant 单调性可直接吃的比例。以上机制均可在证明里逐处指认，但"为何这样想到"论文未述。

## 1.5 论文陈述与已知结果的边界（防止过度解读）

- 论文声称（摘要与 1.2 节）：完整正面解，含唯一性。
- 论文未述：任何算法化内容、任何复线性结论、任何对非满射保距映射的断言、Tingley 原始 1970 年代出处的年份细节、与算子代数直和问题的一切联系。
- 相关文献脉络见 §三逐条。

<!-- 骨架与 §一 完，以下逐节追加 -->
# 二、逐引理带批注重构

以下按 TeX 原文顺序覆盖论文中**全部**编号条目（§2 两个 lemma、§3 一个 lemma、§4 一个 theorem + 一个 proposition、§5 两个 lemma + 一个 proposition、§6 主证明、附录三个 lemma + 定理重证）。论文没有启用 `\begin{remark}`、`\begin{corollary}`、`\begin{definition}` 环境（remark 计数器定义了但全文未使用），定义性内容以正文段落与编号公式出现，本笔记把它们当条目重建。Lean 标注格式：`文件名:行号`，均位于 `E:\math\lean\OAI\Analysis\SphereIsometry\`。

## 2.0 记号条目：单位球、缺陷 $D_q$、最大值 $M$（正文定义，无编号环境）

(a) 精确陈述（TeX 原文照抄，第 49、147–160 行）：

> For a real normed space $X$, write $S_X=\{x\in X:\norm{x}=1\}$, with the distance inherited from $X$.

```latex
\begin{equation}\label{eq:defect}
D_q(x,y)=\norm{f(x)-qf(y)}-\norm{x-qy},\qquad
M=\sup_{x,y\in S_X,\ 0\le q\le1}|D_q(x,y)|.
\end{equation}
```

> The map $f$ is bijective. If $D_q^{f^{-1}}$ denotes the inverse map's defect, then
```latex
\begin{equation}\label{eq:inverse-defect}
D_q^{f^{-1}}(f(x),f(y))=-D_q(x,y)
\qquad(x,y\in S_X,\ 0\le q\le1),
\end{equation}
```
> so the inverse has the same absolute defect bound. Each $D_q$ is 2-Lipschitz as a function of $q$, uniformly in $x,y$, and $D_0=D_1=0$. Thus
```latex
\begin{equation}\label{eq:defectbound}
|D_q(x,y)|\le2\min(q,1-q),\qquad 0\le M\le1.
\end{equation}
```

(b) 机制逐步推演：
1. $f$ 是球面间等距，球面继承 $X$ 的度量；度量等距自动单射，满射由假设，故 $f$ 双射，$f^{-1}$ 也是球面等距——这让 $D_q^{f^{-1}}$ 有定义。
2. eq:inverse-defect 的来源是纯定义代入：把 $(u,v)=(f(x),f(y))$ 代入 $D_q^{f^{-1}}(u,v)=\|f^{-1}(u)-qf^{-1}(v)\|-\|u-qv\|=\|\,x-qy\|-\|\,f(x)-qf(y)\|=-D_q(x,y)$。不需 $f^{-1}$ 的任何额外性质。
3. 2-Lipschitz in $q$：固定 $x,y$。$\big|\|a-qy\|-\|a-ry\|\big|\le\|(q-r)y\|=|q-r|$（反向三角不等式，$\|y\|=1$），故两个范数曲线各 1-Lipschitz，其差 $D_q$ 关于 $q$ 为 2-Lipschitz。Lean 拆两层：单侧 `norm_sub_smul_lipschitz`（Basic.lean:83，证明即 `abs_norm_sub_norm_le` + `norm_smul`），合成 `signedDefect_lipschitz`（Basic.lean:94，`abs_sub` 拼装）。
4. $D_0=0$：两项均 $=\|f(x)\|-\|x\|=1-1=0$（保范）。$D_1=0$：两项均为球面距离 $\|f(x)-f(y)\|=\|x-y\|$（等距）。Lean：`signedDefect_zero`、`signedDefect_one`（Basic.lean:62,66）。
5. eq:defectbound：$|D_q|=|D_q-D_0|\le2q$ 且 $|D_q|=|D_q-D_1|\le2(1-q)$，取 $\min$。Lean：`signedDefect_le_endpoints`（Basic.lean:110）逐字对应"分别对 $0$ 与对 $1$"；再 $\min\le1/2$ 得 `signedDefect_abs_le_one`（Basic.lean:119）⟹ 缺陷集有界 ⟹ `maxDefect_le_one`（Basic.lean:145）。
- Lean 定义面：`signedDefect`（Basic.lean:50，用 `q • (f y : Y)` 表示 $qf(y)$）；`HasDefectBound f M := ∀ q ∈ Set.Icc 0 1, ∀ x y, |signedDefect f q x y| ≤ M`（:54）；`absoluteDefects`（:57，把"逐点取绝对值可达的数"做成集合）；`maxDefect := sSup absoluteDefects`（:60）。论文说"$M$=sup"，Lean 用 `sSup` 并证 `hasDefectBound_maxDefect`（:136，界对所有对与 $q$ 成立且就是 sSup）——论文把这两件事合并在一句 "the bound holds for every pair and every radius" 里。`IsometryEquiv (≃ᵢ)` 把"bijective"变成类型事实；`HasDefectBound.symm`（Basic.lean:76）是 eq:inverse-defect + 界不变的形式化，证明需满射展开 `f.surjective x`，与论文一致。

(c) 假设与常数的机械性理由：
- $0\le q\le1$：缺陷只在"单位球内跨半径插值"范围测。接口在层 4（第 455 行）："For $a=\alpha x$ and $c=\beta y$, where $x,y$ are unit and $\alpha\ge\beta>0$, put $q=\beta/\alpha$"——任何两点的距离比较归一化后都落进 $q\in[0,1]$（交换两点处理另一半）。若放开 $q$：端点归零 $D_1=0$ 保留但 $D_0=0$ 对应的估计变成 $|D_q|\le2|q|$，$M\le1$ 崩，超滤器有界性论证（"bounded real sequence has a unique limit along $\mathcal U$"）失去前提。
- 因子 2 与 $\min(q,1-q)$：喂给 Lemma 3.1 的"$M/2\le t\le1-M/2$"——第 174 行"By \eqref{eq:defectbound}, $M/2\le t\le1-M/2$"：若 $t$ 在此区间外，则 $2\min(t,1-t)<M$，与 $|D_t|=M$ 矛盾。这个夹逼保证后面 $h=\min\{t/s,\epsilon/u\}$ 的两半径 $t\pm(\cdot)h$ 落在 $[0,1]$（Lean `secant_radii_mem`，ChordSecant.lean:111）。
- 为何缺陷沿"单一基方向 $y$"定义而不是双参数：全篇一切支撑/secant/凸性计算都住在 $\operatorname{span}\{v,y\}$（二维）或其有限扩张内，$x-qy$ 的一参数族是保持这种低维性的最小信息集。`[推测]`（论文未述动机的这一句是我的重构）。

(d) `[推测]` 候选失败路线：
1. `[推测]` 只测 $q=1/2$（中点缺陷）：单端点归零使 $|D|\le$ 双端挤压消失，Lemma 3.1 中 $t$ 的选取无从谈起（$t$ 恒 $1/2$ 尚可，但层 3 secant 需要在 $t-sh$、$t+uh$ 两半径"一个免费零、一个吃 $M$ 界"的加权消元 $u\Delta_x+s\Delta_z$ 只剩一种半径可用，公共目标范数 $\|w+hb\|$ 无法同时消掉）。
2. `[推测]` 非满射等距：eq:inverse-defect 断（$f^{-1}$ 不存在）；超滤器构造第 191 行"Applying $f^{-1}$ termwise gives the inverse of $F$"断；$M=0$ 后 $T$ 只保距单射，满射与 Mazur–Ulam 反射（要求 onto）全断。
3. `[推测]` 用 $\|f(x)-f(y)\|- \|x-y\|$ 型缺陷：恒 0，无信息——跨半径参数 $q$ 是问题实质所在。

## 2.1 Lemma 2.1（支撑存在与公共支撑；lem:support）

(a) 精确陈述（TeX 原文照抄，第 116–124 行）。前置定义段（第 116 行）：

> A \emph{support} at a vector $a$ in a finite-dimensional normed space is a linear functional $\varphi$ with $\norm{\varphi}\le1$ and $\varphi(a)=\norm{a}$. All supporting functionals below may be taken on the finite-dimensional span of the vectors under discussion. The next lemma is the finite-dimensional Hahn--Banach extension argument \cite{Banach1929}; we include its elementary proof.

```latex
\begin{lemma}\label{lem:support}
Supports exist, and can be extended with the same norm bound to any specified finite-dimensional enlargement of their domain. If unit vectors $v,w$ and positive numbers $\alpha,\beta$ satisfy
\[
\norm{\alpha v+\beta w}=\alpha+\beta,
\]
then they have a common support: a norm-bounded linear functional taking value one at both.
\end{lemma}
```

(b) 机制逐步推演（证明第 125–133 行）：
1. 起点：$a\ne0$ 时 $\operatorname{span}\{a\}$ 上 $L(\lambda a)=\lambda\|a\|$ 被范数控制且取满；$a=0$ 时取零泛函（论文明写"or the zero functional at zero"，为的是后面"零泛函也算支撑"使扩张链条从 $0$ 也可起步）。
2. 单步扩张 $V\to V+\R e$：候选值集为闭区间族 $I_a=[L(a)-\|a-e\|,\;L(a)+\|a-e\|]$。两两相交：$L(a)-\|a-e\|\le L(b)+\|b-e\|$ ⟺ $L(a)-L(b)\le\|a-e\|+\|b-e\|$，由 $L(a)-L(b)=L(a-b)\le\|a-b\|\le\|a-e\|+\|b-e\|$（第一 inequality 用 $|L|\le\|\cdot\|$ 于 $V$，第二用三角不等式）——即论文第 131 行那一句。
3. 全体共点：闭区间 + 有限交性质 + "$a=0$ 的区间 $[-\|e\|,\|e\|]$ 紧" ⟹ 总交非空（一维紧集的闭子集族 FIP）。选中值 $L(e)$ 后对所有 $a$：$|L(a)-L(e)|\le\|a-e\|$，于是对 $a+\lambda e$ 分 $\lambda\ge0/\le0$ 伸缩可得 $|L(a+\lambda e)|\le\|a+\lambda e\|$——"rescaling proves the norm bound"一句的展开。
4. 有限次重复 ⟹ 任意指定有限维扩张。
5. 公共支撑尾部：取支撑 $\varphi$ 于 $\alpha v+\beta w$：$\alpha+\beta=\varphi(\alpha v+\beta w)=\alpha\varphi(v)+\beta\varphi(w)$，而 $\varphi(v),\varphi(w)\le\|\cdot\|\le1$ 给 $\le\alpha+\beta$；两个权重严格正的 $\le$ 之和取等必须逐项取等（此处用 $\alpha,\beta>0$），故 $\varphi(v)=\varphi(w)=1$。
- Lean 对应（Supports.lean）：不重证单步 HB，直接调 Mathlib：`SupportAt φ a := ‖φ‖ ≤ 1 ∧ φ a = ‖a‖`（:24）；`exists_support := exists_dual_vector'' ℝ a`（:28）；等范数扩张 `extension_norm_eq`（:73 包 `_root_.exists_extension_norm_eq`，Hahn–Banach）；有限扩张特化 `supportAt_finite_enlargement`（:110，docstring 强调 stronger、不需要子空间有限维）；"限制与扩张把全空间支撑断言化归到有限张成"是 `forall_supportAt_apply_iff_submodule`（:120）——这是第 116 行"may be taken on the finite-dimensional span"的形式化替身；公共支撑 = `common_support_of_norm_add_eq`（:155），中间引理 `norm_add_eq_iff_exists_common_supportAt`（:132，双向）加 `supportAt_pos_smul_iff`（:48）。支撑的次梯度性质 `SupportAt.subgradient`（:67）：$\varphi(z-a)\le\|z\|-\|a\|$，论文在第 367、386 行"support inequalities"处以同种不等式使用。

(c) 假设与常数的机械性理由：
- $\alpha,\beta>0$：用在第 5 步逐项取等。$\alpha=0$ 时 $\varphi(v)$ 失控，公共支撑结论直接假（两向量的支撑面可不相交）。
- $\|v\|=\|w\|=1$：把 $\varphi\le1$ 与目标"取值 one"对齐；一般向量版 Lean 已证（:132），论文只声明单位版因为全篇传播都在 $S_X$ 内。
- "finite-dimensional enlargement"限定：服务两处下游——层 2 传播需要同一 $\varphi$ 在 $\operatorname{span}\{v_0,\dots,v_n,v_{n+1}\}$ 上对每个 $v_i$ 取 1（第 259 行"extended to their finite span with the $v_i$"）；层 3 的 $L_n$ 收敛子列需要 span$\{v,y\}$ 对偶闭球紧（第 406–413 行）。去掉"有限维"三字论文依然对（用抽象 HB + Tychonoff 需要更多拓扑），但论文的初等证明与紧性论证都会重写；Lean 干脆用无限维 HB（:110）把这条假设从形式化里消掉——论文/形式化差异点之一。
- $\|\varphi\|\le1$ 非 $=1$：零泛函在 $0$ 处也算支撑（`supportAt_zero_iff` Supports.lean:39），全链无 $a=0$ 特判。

(d) `[推测]` 候选失败路线：
1. `[推测]` 向量值 Hahn–Banach（把泛函换成到 $Y$ 的算子）：区间法失效（$\R$ 的 FIP/紧性没有向量类比），需 Dugundji 型扩张且保不住等范数；这解释了为何全篇只用标量泛函、$Y$ 侧只出现范数值。
2. `[推测]` 用次微分 $\partial\|\cdot\|$ 语言：等价但无节省——公共支撑存在性就是 $\partial\|v\|\cap\partial\|w\|\ne\emptyset$ 的重述，失败机制是循环论证风险（该等价性正是本引理的内容）。
3. `[推测]` 放弃 $\|\varphi\|\le1$ 只要求 $\varphi$ 在组合处取范数：则 $\varphi(v)=1$ 归一失效，层 2 第 261 行"$1=\varphi(l)\le\|l\|\le1$"夹逼两端全缺。

## 2.2 Lemma 2.2（径向切点；lem:radial）

(a) 精确陈述（TeX 原文照抄，第 135–139 行）：

```latex
\begin{lemma}\label{lem:radial}
If $\norm{c}<1$, each ray $c+\R_+v$, $v\in S_X$, meets $S_X$ at a unique point $c+\rho(v)v$. The radius is continuous and satisfies
\[
1-\norm{c}\le\rho(v)\le1+\norm{c}.
\]
\end{lemma}
```

(b) 机制逐步推演（第 141–143 行）：
1. 存在性："Continuity of the norm and boundedness of the unit ball give contact"：$\lambda\mapsto\|c+\lambda v\|$ 连续，$\lambda=0$ 处 $<1$，$\lambda=1+\|c\|$ 处 $\ge(1+\|c\|)-\|c\|=1$，介值定理给交点。
2. 唯一性（原文凸几何句）："Every point strictly between an interior point of a convex ball and a point of that ball is interior: the corresponding convex combination contains a ball of positive radius about it." 展开：若 $\lambda_1<\lambda_2$ 均为切点，取 $\theta\in(0,1)$ 使 $c+\lambda_1 v=\theta c+(1-\theta)(c+\lambda_2 v)$（取 $\theta=1-\lambda_1/\lambda_2$，需 $\lambda_2>0$；$\lambda_1=0$ 不可能因 $\|c\|<1$）。$c$ 是开球内点，故存在 $\varepsilon>0$ 使 $B_\varepsilon(c)\subset B_1(0)$；则 $c+\lambda_1v$ 有邻域 $B_{\theta\varepsilon}(c+\lambda_1v)$ 落在 $B_1(0)$（内点与闭凸球线段内缩的标准计算），与 $\|c+\lambda_1v\|=1$ 矛盾。
3. 界：$1=\|c+\rho v\|\le\|c\|+\rho$ 给 $\rho\ge1-\|c\|$；$\rho=\|(c+\rho v)-c\|\le1+\|c\|$ 给上界。两次三角不等式。
4. 连续性：子列论证。$\rho(v_n)$ 落在 $[1-\|c\|,1+\|c\|]$ 有界；任一收敛子列的极限 $\rho_*$ 满足 $\|c+\rho_*v\|=1$（范数连续 + $v_n\to v$），唯一性给 $\rho_*=\rho(v)$；有界实数列若每个收敛子列同极限则全列收敛。
- Lean 对应（RadialContact.lean）：`existsUnique_radialContact (c : X) (hc : ‖c‖ < 1) (v : UnitSphere X)`（:97），存在性走介值（该文件 import `Mathlib.Topology.Order.IntermediateValue`）；唯一性 `contact_unique`（:69）经比较引理 `contact_comparison_ordered`/`contact_comparison`（:25,:53，即"两个切点半径可比则……"的内点论证代数化）；`radialRadius`（:124）+ `radialRadius_spec/_pos/_bounds/unique`（:127–141）；连续性给**定量** Lipschitz：`radialRadius_sub_le`（:155）⟹ `lipschitz_radialRadius`（:184）⟹ `continuous_radialRadius`（:190）；切点本体 `radialContact`（:194）、`continuous_radialContact`（:200）。比论文强（Lipschitz 常数显式），为层 2 的回返映射连续性提供机器可用形式。

(c) 假设与常数的机械性理由：
- $\|c\|<1$ **严格**：第 2 步需要起点是**内点**；$\|c\|=1$ 时非严格凸空间里射线可与球面交于线段，唯一性失效，$\rho$ 不是函数。全篇 $c=t\bullet y$ 与 $c=t\bullet(f y)$，消费 $t<1$ 两次（$p$ 侧与 $u$ 侧的切点；Lean `returnCenter_lt_one` ReturnMap.lean:43 明确记录 $t<1$ ⟹ $\|t y\|<1$）。
- $t>0$：本引理不需要（$c=0$ 也成立），但层 3 的 $h=\min\{t/s,\epsilon/u\}$ 需要 $t>0$ 才有 $h>0$（`secantStep_pos` ChordSecant.lean:74）。
- $v\in S_X$：界与参数化口径；回返映射记账 eq:radii 依赖 $\rho$ 就是弦长 $p,r,s,u$。
- 区间 $[1-\|c\|,1+\|c\|]$：在层 2 以"四个半径 $\in[1-t,1+t]$"（第 241、230 行）出现，直接喂收缩估计：$up/rs=(1-M/r)(1-M/s)\le(1-M/(1+t))^2=:\gamma$ 用 $r,s\le1+t$；分母正性 $r,s\ge1-t>0$ 再次消费 $t<1$。Lean：`radii_bounds`（ReturnMap.lean:148）、`unit_radius_bounds_of_*`（AlignedConfiguration.lean:46–84）、`return_factor_mem_Ico`（ReturnMapBounds.lean:81）。
- 完备性：本引理在任意赋范空间成立；Lean 陈述无 `CompleteSpace`，与论文一致（论文的 Banach 假设在别处消费：超滤器完备化、Darbo、Mazur–Ulam）。

(d) `[推测]` 候选失败路线：
1. `[推测]` 用最佳逼近元唯一性（近凸性）替代内点论证：一般赋范空间不近凸，机制直接断；论文论证的普适性正是卖点。
2. `[推测]` 用整条过 $c$ 直线与球面相交：两个交点需要连续选择分支，$g$ 的定义会引入选择歧义；论文以 $+v$ 取 $x$、$-w$ 取 $z$ 的**方向半射线**显式管理分支，Lean 的 `sphereNeg`（ReturnMap.lean:28）形式化"对侧 = $-w$ 归一"，证实分支必须显式。
3. `[推测]` 在无限维改用 Radon–Nikodým 紧性证存在性：单位球弱紧需自反，论文不假设自反（第 59 行明示），该路线违背定理强度；介值路线不花任何几何假设。
## 2.3 Lemma 3.1（正缺陷的取到；lem:attainment）

(a) 精确陈述（TeX 原文照抄，第 164–172 行；前置句第 162 行："The attainment argument uses the standard Banach-space ultrapower construction \cite{DacunhaCastelle1972}. We give the construction and verify its sphere-map and defect properties directly."）：

```latex
\begin{lemma}\label{lem:attainment}
If some surjective sphere isometry has $M>0$, there are nonzero real Banach spaces, a surjective sphere isometry, still denoted by $f:S_X\to S_Y$, and $x_0,y\in S_X$, $0<t<1$, such that
\begin{equation}\label{eq:maximal}
\begin{aligned}
|D_q(a,c)|&\le M &&(a,c\in S_X,\ 0\le q\le1),\\
\norm{f(x_0)-tf(y)}-\norm{x_0-ty}&=M>0.
\end{aligned}
\end{equation}
\end{lemma}
```

(b) 机制逐步推演（证明第 173–197 行，四段）：

**第一段：序列预备（第 174 行）**
1. 由 $M=\sup|D_q|>0$，取三元组序列 $(x_n,y_n,q_n)$ 使 $|D_{q_n}(x_n,y_n)|\to M$。
2. 取符号子列使 $D_{q_n}(x_n,y_n)$ 同号趋于 $+M$ 或 $-M$；若为 $-M$，用 eq:inverse-defect 把映射换成 $f^{-1}$（缺陷变号），不失一般性设为 $+M$。
3. $q_n\in[0,1]$ 紧，取子列收敛 $q_n\to t\in[0,1]$。
4. "The uniform Lipschitz bound allows us to replace them all by $t$, retaining convergence of the signed defects to $M$"：$|D_{q_n}(x_n,y_n)-D_t(x_n,y_n)|\le2|q_n-t|\to0$（关于 $q$ 的一致 2-Lipschitz），故可设所有半径已是同一个 $t$，且 $D_t(x_n,y_n)\to M$。
5. 由 eq:defectbound：$M=\lim|D_t|\le2\min(t,1-t)$ ⟹ $M/2\le t\le1-M/2$。⟹ $t\in(0,1)$（因 $M>0$）。这是"$0<t<1$"出处的唯一一行。

**第二段：超滤器与 ultralimit 的集合论地基（第 176 行）**
6. 取 $\mathbb N$ 上自由超滤器 $\mathcal U$："a maximal proper filter containing all cofinite sets. It exists by the maximal principle, since a union of a chain of such filters is again a proper filter. We use the usual set-theoretic framework with choice here."（滤子链并仍真 ⟹ Zorn ⟹ 极大 ⟹ 超滤）。
7. 超滤器性质："For any subset, either it or its complement belongs to $\mathcal U$."
8. 有界实序列沿 $\mathcal U$ 有唯一极限：设序列落在紧区间 $J$，集合族 $\{\overline{\{a_n:n\in A\}}:A\in\mathcal U\}$ 是 $J$ 中闭集、有 FIP（两个 $A,B\in\mathcal U$ 的交仍在 $\mathcal U$ 且非空 ⟹ 闭包交非空，用紧性），总交非空；超滤器性质使总交是单点（若含两点则按子集分成两个 $\mathcal U$-大集可分离）。记 $\lim_\mathcal U a_n$。
9. "These limits preserve sums, inequalities, and continuous real functions"：$\lim_\mathcal U(a_n+b_n)=\lim_\mathcal U a_n+\lim_\mathcal U b_n$（对 $\epsilon$ 分 $\mathcal U$-大集三角估计）；$a_n\le b_n$（逐点）⟹ 极限同向；$f$ 连续 ⟹ $f(\lim_\mathcal U a_n)=\lim_\mathcal U f(a_n)$。
- Lean：第 6 步用 `freeUltrafilter := Filter.hyperfilter ℕ`（UltraRealLimit.lean:135，Mathlib 的 $\mathbb N$ 乘积超滤，具体构造而非 Zorn 断言存在），配套 `freeUltrafilter_le_cofinite`（:137）、`not_mem_freeUltrafilter_of_finite`（:144）；第 8 步 = `tendsto_realULim`（:76，经闭区间紧 + Hausdorff 极限唯一）；第 9 步拆成 `realULim_add/_neg/_sub/_const_mul/_abs/_le_realULim/_le_realULim...`（:97–133）与 `RealSeqBounded` 结构（:24，显式有界性假设——论文那句 "bounded real sequence" 在 Lean 变成类型类假设）。`realULim_eq_of_tendsto`（:88）是"滤子极限唯一 ⟹ 等于 ULim"。

**第三段：商空间 $Q_X$（第 178–182 行）**
10. 有界序列空间上 seminorm：$\|(a_n)\|_{\mathcal U}=\lim_\mathcal U\|a_n\|$。验证 seminorm：三角不等式逐点 $\|a_n+b_n\|\le\|a_n\|+\|b_n\|$ 经第 9 步保序性传递。
11. $Q_X$ = 对该 seminorm 的核取商，带诱导范数。
12. "Constant sequences embed $X,Y$ isometrically, so these quotients are nonzero"：常数序列类的范数 $=\lim_\mathcal U\|x\|=\|x\|$，$X\ne0$ ⟹ $Q_X\ne0$。
13. 单位类的单位代表引理："Every unit vector in either quotient has a representative of unit vectors: normalize each nonzero term and replace zero terms by a fixed unit vector. The change has norm $|\norm{a_n}-1|$，whose ultralimit is zero." 展开：类 $\|[a_n]\|$ 满足 $\lim_\mathcal U\|a_n\|=1$；逐点 $a_n'\;:=\;a_n/\|a_n\|$（$\|a_n\|\ne0$）或固定单位向量 $e$（否则）。估计 $\|a_n'-a_n\|\le|\|a_n\|-1|$：当 $\|a_n\|\ge…$ 情形直接算 $\|a_n/\|a_n\|-a_n\|=\|a_n\||1-1/\|a_n\||=\;|\|a_n\|-1|$；替换 $e$ 的项当 $\|a_n\|\to_{\mathcal U}1$ 时差为 $\|e-a_n\|\le1+\|a_n\|\le 2$ 乘上 $\{a_n=0\}\notin\mathcal U$……实际论文口径是 $|\|a_n\|-1|$ 的 ultralimit 为 0（把"零项换 $e$"的误差并入同一估计：$\|a_n\|=0$ 时 $a_n'=e$、差 $=1=|\,0-1\,|$ 恰好），故 $\lim_\mathcal U\|a_n'-a_n\|=0$ ⟹ 同类。
- Lean： seminorm 与商 = UltraNormed.lean：`boundedSequenceSubmodule`（:26，统一有界 $\exists B,0\le B,\forall n,\|a\,n\|\le B$ 的子模——论文只说"bounded sequences"，Lean 用统一界以保证 $\lim_\mathcal U\|a_n\|$ 存在）；carrier 包装 `structure UltraSequence`（:42，docstring 明示"fresh wrapper… only algebra is transported… topology is then constructed from the ultralimit seminorm"）；商 = `abbrev UltraQuotient := SeparationQuotient (UltraSequence U X)`（:146，Mathlib 的半范数分离商）；`norm_classOf : ‖classOf U a‖ = realULim U (fun n => ‖a n‖)`（:175）；`classOf_eq_iff`（:181）；常数嵌入 `constantEmbedding : X →ₗᵢ[ℝ] UltraQuotient U X`（:190）；`ultraQuotient_nontrivial`（:198）。完备化 = `abbrev UltraCompletion := UniformSpace.Completion (UltraQuotient U X)`（:205）+ `ultraCompletion_nontrivial`（:209）。单位代表 = UnitRepresentatives.lean（48 行）：`unitClass` 型引理，"逐项归一 + 零项替换"的两段界（与论文逐字同构）。

**第四段：$F$、缺陷传递、完备化（第 184–196 行）**
14. 对单位代表序列逐项作用 $f$：$F([a_n]):=[(f(a_n))]$。良定义性："The identity $\lim_{\mathcal U}\norm{f(a_n)-f(b_n)}=\lim_{\mathcal U}\norm{a_n-b_n}$ proves both independence of representative and distance preservation." 展开：(i) 代表无关：两代表差 seminorm 0 ⟹ $f$ 逐项作用后差也 seminorm 0（用 $f$ 是等距，把 $\|a_n-a_n'\|$ 的 ultralimit=0 转移）——细节需要"$\|f(a_n)-f(a_n')\|=\|a_n-a_n'\|$"逐点成立；(ii) 距离保持：$\|F([a])-F([b])\|=\lim_\mathcal U\|f(a_n)-f(b_n)\|=\lim_\mathcal U\|a_n-b_n\|=\|[a]-[b]\|$。
15. 逐项作用 $f^{-1}$ 给出 $F$ 的逆 ⟹ $F$ 是球面间满射等距。
16. 缺陷逐半径传递：对固定 $q\in[0,1]$,
$$\|F([a_n])-qF([b_n])\|-\|[a_n]-q[b_n]\|=\lim_{\mathcal U}D_q(a_n,b_n)\in[-M,M],$$
左边=右边由 seminorm 定义把两个范数各写成 ultralimit 再相减（用 `realULim_sub`）；右边 $\in[-M,M]$ 由逐点 $|D_q(a_n,b_n)|\le M$ + 保序性（`realULim_le_realULim`）。"Since the pair and $q$ were arbitrary, the bound holds for every pair and every radius"：$[a_n],[b_n]$ 取遍 $S_{Q_X}$（单位代表引理保证每个类都有单位代表，故"任意对"覆盖全商球面）。选定的序列给 $q=t$ 处取等：$\lim_U D_t(x_n,y_n)=M$（第 5 段准备的收敛）⟹ `attained`。
17. 完备化：论文原文 "Complete both quotient spaces. Their unit spheres are the metric completions of their previous spheres, by density and normalization."：商空间稠嵌入完备化，球面像稠；等距 $F$ 与其逆对 Cauchy 列作用保持等价类 ⟹ 连续延拓到完备化的球面，仍互为逆（密度 + 连续性）⟹ 满射等距；"$|D_q|\le M$ 与取等由连续性保留"：$(a,c)\mapsto D_q(a,c)$ 在完备球面上连续（第 16 步的等式两边都是连续量；Lean 专门有 `continuous_signedDefect_pair`，SphereCompletion.lean:179），逐点界取极限保留，等式点保留（延拓在嵌入点上不变）。
- Lean：第 14–16 步 = UltraSphere.lean：`ultraSphereEquiv`（:108，要求 `[Nontrivial X] [Nontrivial Y]`——归一化需要固定单位向量存在）、`signedDefect_ultraSphereEquiv`（逐项缺陷 = ULim 缺陷，DefectAttainment.lean:35 处复合使用）；第 17 步 = SphereCompletion.lean：`sphereCoe`（:34）、`sphereCoe_isometry`（:42）、`sphereCoe_denseRange`（:60）、`sphereCompletionEquiv`（:112）、`completedSphereEquiv`（:145，把 ≃ᵢ 提升到完备化）、`HasDefectBound.completedSphereEquiv`（:192）、`attainedDefect_completedSphereEquiv`（:205）。总装 = DefectAttainment.lean：`completedUltraSphereEquiv`（:25）+ `HasDefectBound.completedUltraSphereEquiv`（:44）+ 主输出 `positive_maxDefect_attained_or_inverse`（:51）。

**Lean 与论文的关键措辞差**：论文陈述"若**某个**满射球等距有 $M>0$"，Lean 主链不需要"某个/存在"的析取——`maxDefect` 是对给定 $f$ 定义的 `sSup`（Basic.lean:60），`maxDefect_eq_zero`（Extension.lean:39）对任意 $f$ 直接证 $=0$：反设 $0<$ `maxDefect f`，`positive_maxDefect_attained_or_inverse` 给出**构造型** $F$=`completedUltraSphereEquiv freeUltrafilter f` 与 $t$、取等对，且**双向**（$F$ 或 $F^{-1}$ 之一取到，取决于 $-D_q$ 符号朝向——这正是论文"if necessary, replace the map by its inverse"的形式化，用 `Or` 显式携带两个朝向，见 DefectSequence.lean:67 `exists_fixed_radius_defect_sequence`）。

(c) 假设与常数的机械性理由：
- "some $M>0$"（反证法起点）：全篇是"缺陷二难"——要么 $M=0$ 直接进层 4，要么造取到配置再矛盾。去掉反证框架，$M$ 可能只是上确界不取到，后续"$v_0\in E$ 非空"（第 243 行）断。
- 自由超滤器存在：可数饱和性不需要，只用 FIP；论文用 choice（"usual set-theoretic framework with choice"）；Lean 用 `Classical.choice`（comparator 允许公理之一）+ 具体的 `hyperfilter ℕ`，Zorn 都省了。
- $t\in[M/2,1-M/2]$：消费两处：(i) $t\in(0,1)$ ⟹ 回返映射中心 $\|ty\|=t<1$ 可用 Lemma 2.2；(ii) $1-t\ge M/2>0$ 给 $a=1-t>0$（收缩估计分母）与 $\epsilon>0$。若允许 $t\to0$ 或 $1$：$a\to0$、收缩分步 $4\eta/a$ 爆、$p,r$ 的 $[1-t,1+t]$ 区间退化。
- "nonzero Banach spaces"（输出）：$X\ne0$ ⟹ 常数嵌入 ⟹ $Q_X\ne0$ ⟹ 完备化非零（Lean `ultraCompletion_nontrivial`）；球面非空才能谈 $S_{Q_X}$。
- 完备化步骤不可省：后续 Darbo 定理要在 **Banach** 空间里对闭凸集用（Lean `CondensingFixedPoint.lean:22` 要求 `[CompleteSpace E]`）；商 $Q_X$ 未必完备。论文用"球面是其原球面的度量完备化"这一句把 $F$ 抬升——这一步 Lean 化成了 SphereCompletion.lean 整个文件（215 行），是论文一句带过、形式化最费力的一段之一。
- 去掉"retaining the bound at every radius"：若只把缺陷取到而不把 $|D_q|\le M$ 全带过去，层 2 的 $s+u=\|x(v)-z\|\le p+r$（第 245 行，用**全局界** $|D_t|\le M$ 于反向对）与 $r-u\le M$ 立即失去依据，eq:equality 的"两个不等式同时取等"机制整体塌掉。

(d) `[推测]` 候选失败路线：
1. `[推测]` 不用超滤器、改用逐点弱紧/ Banach–Alogluou：一般非自反空间闭球不弱紧，论文不假设自反（第 59 行明示），路线违背定理强度；即便自反情形，缺陷 $D_q$ 关于 $(x,y)$ 只是 Lipschitz 而非弱连续（范数弱下半连续但差不是），"$D\to M$"取极限需要 $f$ 的更多结构（$f$ 无线性，弱拓扑对它毫无连续性）。超滤器路线只依赖度量收敛，恰好够。
2. `[推测]` 直接在原空间对 $(x_n,y_n)$ 取子列收敛：非紧（一般空间球面不列紧）；即便可分 Hilbert，也无从保证。超滤器把"列紧性失败"外包给滤子极限。
3. `[推测]` 只延拓到完备化而不处理"球面的完备化 vs 完备化空间的球面"：论文的"$F$ 连续延拓到完备化球面"需要等距+满射双向延拓互为逆（第 196 行）；若只延拓单向（用一致连续延拓定理），得到的是等距**嵌入**非满射，$f^{-1}$ 的存在与后续 `HasDefectBound.symm`（Eq: inverse-defect 的传递）断链。Lean 的 `completedSphereEquiv` 用"先对 $f$ 与 $f^{-1}$ 各做 `sphereIsometryCompletion` 再证明互逆"绕开这一点（SphereCompletion.lean:128–163）。

## 2.4 Kuratowski 非紧测度 $\chi$ 与 Darbo 定理（§4 前置 + Theorem 4.1；thm:condensing）

(a) 精确陈述（TeX 原文照抄，第 203–215 行）：

> For a bounded subset $H$ of a normed space, its Kuratowski measure of noncompactness \cite{Kuratowski1930} is
\[
\chi(H)=\inf\{\delta>0:H\text{ is covered by finitely many sets of diameter at most }\delta\}.
\]
> We use the uniform strict-contraction form of Darbo's fixed-point theorem \cite{Darbo1955}, proved in Appendix~\ref{sec:appendix}.

```latex
\begin{theorem}\label{thm:condensing}
Let $C$ be a nonempty closed bounded convex subset of a Banach space. If $g:C\to C$ is continuous and, for some $0\le\gamma<1$,
\[
\chi(g(H))\le\gamma\chi(H)\qquad(H\subset C),
\]
then $g$ has a fixed point.
\end{theorem}
```

(b) 机制：定理本体在附录证明（见 2.10）；此处记录陈述层的机械性：
- "for **all** $H\subset C$"：不是只对某个特定集压缩——附录迭代 $C_{n+1}=\clco(g(C_n))$ 时，每层的 $\chi$ 衰减都需要假设对**任意**子集成立（$\chi(C_{n+1})=\chi(\clco g(C_n))=\chi(g(C_n))\le\gamma\chi(C_n)$）。若只对 $H=C$ 成立，第一次迭代后即失控。
- "uniform $\gamma<1$"：非均匀版本（每个 $H$ 有各自的 $\gamma_H<1$）不足以让 $\chi(C_n)\to0$（需要一致几何衰减）。
- "$C$ closed bounded convex"：closed + Banach ⟹ $C$ 完备（嵌套闭集引理要用完备性）；bounded ⟹ $\chi(C)<\infty$（定义域正常）；convex ⟹ $\clco$ 不回跑出去，$C_{n+1}\subset C_n$ 的归纳成立。
- Lean：定义 `FiniteDiameterCover H δ`（KuratowskiBasic.lean:20，用 fintype 指标族显式"有限覆盖"）、`coverRadii`（:71）、`chi := sInf coverRadii`（:75）。定理 = `exists_fixedPoint_of_kuratowski_contraction`（CondensingFixedPoint.lean:26）：假设表为 `hCne hclosed hbounded（Bornology.IsBounded）hconv` + `hg : ContinuousOn g C` + `hmap : MapsTo g C C` + `hγ0 : 0 ≤ γ`、`hγ1 : γ < 1` + `χ` 压缩（对 `∀ H ⊆ C, chi (g '' H) ≤ γ * chi H`）。注意 Lean 把"Banach 空间"体现为 `[CompleteSpace E]`（:22），把论文 $g:C\to C$ 拆成环境映射 `g : E → E` + `MapsTo`——因为后续要把回返映射在环境（ambient）上组合（subtype 上做拓扑不便）。docstring "No compactness premise on `C` is required" 与论文一致。论文"$\chi(g(H))$"在 Lean 是 `chi (g '' H)`。

(c) 假设与常数的机械性理由（补充）：
- $\gamma\ge0$ 下界：$\chi\ge0$ 时自动可有；Lean 仍显式带 `hγ0`（喂 `condensingSequence_chi_tendsto_zero` 的几何级数要用 $0\le\gamma$ 保单调衰减）。
- 完备性用在嵌套集引理（附录 Lemma A.1 末段"by completeness"），不用在 Darbo 证明的其他处。

(d) `[推测]` 候选失败路线：
1. `[推测]` 用 Hausdorff 测度 $\beta$（球覆盖版）替代 Kuratowski $\chi$（直径覆盖版）：等价（$2\beta\le\chi\le 2\beta$ 型），但回返映射估计里"按 $p,u$ 值分箱 ⟹ 像直径控制"自然产出**直径**覆盖而非球覆盖，换 $\beta$ 要重写常数账；论文未述。
2. `[推测]` 用 Mehta/Edelstein 型非压缩不动点或 Darbo–Sadovskii 渐近 $\gamma$：需要 weaker 假设但结论给"近似不动点序列"仍要闭性收尾，机制相当，无实质节省；论文未述。
3. `[推测]` 直接在 $E\subset S_X$ 上用 Schauder：$E$（乃至 $C$）非紧——$X$ 无穷维，单位球不列紧，$\chi(C)$ 可能 $>0$；不压缩的话固定点定理失效。回返映射**恰好**压缩 $\chi$ 是设计的核心，不是可替换的外壳（见 2.6 的 eq:contraction）。
## 2.5 Proposition 4.2（极值弦的对齐；prop:alignment）——全篇几何核心

(a) 精确陈述（TeX 原文照抄，第 217–232 行，整段包在 `\begin{samepage}` 中防跨页）：

```latex
\begin{proposition}\label{prop:alignment}
Under \eqref{eq:maximal}, put $b=f(y)$ and keep $y,t$ fixed. There are endpoints $x,z\in S_X$, directions $v\in S_X$, $w\in S_Y$, and positive numbers $p,r,s,u$ such that
\begin{equation}\label{eq:chords}
\begin{aligned}
x&=ty+pv\in S_X,& z&=ty-rv\in S_X,\\
f(x)&=tb+sw\in S_Y,& f(z)&=tb-uw\in S_Y,
\end{aligned}
\end{equation}
and
\begin{equation}\label{eq:radii}
s-p=r-u=M,\qquad d:=p+r=s+u=\norm{x-z}\le2.
\end{equation}
All four radii belong to $[1-t,1+t]$.
\end{proposition}
```

注意：$z=ty-rv$ 与 $x=ty+pv$ 在**同一条过 $ty$ 的直线**上（方向 $v$ 与 $-v$），$f(x),f(z)$ 同理在过 $tb$ 的直线（方向 $w$）上；"aligned"指两端点各自共线。

(b) 机制逐步推演（证明第 233–294 行，五个模块）：

**模块 1：回返映射的定义（第 234–241 行）**
1. 概念蓝图（原文）："Starting from a direction at $ty$, we map its sphere contact to $S_Y$ and take the opposite sphere contact on the line through $tb$. Pull this opposite endpoint back to $S_X$, and reverse its direction from $ty$. A fixed direction for this return map will align the two chords."——五步链条：$v\Rightarrow x(v)\Rightarrow f(x(v))\Rightarrow$ 对面切点（在 $Y$ 侧）$\Rightarrow z:=f^{-1}(\cdot)\Rightarrow g(v):=(ty-z)/\|ty-z\|$。
2. 形式定义（eq:return，第 236–240 行）：
```latex
f(x(v))=tb+sw,\qquad f(z)=tb-uw\in S_Y,\qquad
r=\norm{z-ty},\quad g(v)=\frac{ty-z}{r},
```
其中 $p=p(v)>0$ 由 Lemma 2.2 给 $x(v)=ty+pv\in S_X$（中心 $ty$，$\|ty\|=t<1$）；$s=s(v):=\|f(x(v))-tb\|$、$w=w(v):=(f(x(v))-tb)/s$（$Y$ 侧归一，方向非零由 $\|f(x(v))\|=1>t=\|tb\|$）；$u=u(v)>0$ 是中心 $tb$ 沿方向 $-w$ 的径向切点半径：$f(z)=tb-uw\in S_X$… 原文："where $w\in S_Y$ and $u>0$ is determined by radial contact in direction $-w$"；$z:=f^{-1}(tb-uw)$；$r:=\|z-ty\|$；$g(v)=(ty-z)/r$。
3. 良定义性与连续性："These quantities are continuous in $v$, and their positive radii lie in $[1-t,1+t]$"——$p,u$ 由 Lemma 2.2 连续；$s,w$ 由范数/归一连续（分母非零：$\|f(x(v))-tb\|=s\ge1-t>0$）；$r$ 同理；$g$ 复合连续。半径界：$p,u\in[1-t,1+t]$（Lemma 2.2 直接给）；$s=\|f(x(v))-tb\|$ 与 $r$ 由三角夹逼同样在 $[1-t,1+t]$（两个单位向量减 $t$ 倍单位向量）。
- Lean：ReturnMap.lean 把链条逐一化名的：`pRadius`（:71，`= radialRadius (t • y) …`）、`xPoint`（:79）、`sRadius`（:83）、`wDirection`（:87，normalize）、`uRadius`（:92，对 `sphereNeg ∘ wDirection` 取 $tb$ 中心的径向半径）、`zPoint`（:96，`= f.symm (radialContact …)`）、`rRadius`（:100）、`returnSphere`（:104，normalize $(ty-z)$）。界与正性：`pRadius_pos/_bounds`（:109–116）、`radii_pos`（:142）、`radii_bounds`（:148）；等式还原 `xPoint_eq/fxPoint_eq/fzPoint_eq/zPoint_eq`（:157–186）；恒等式 `norm_xPoint_sub_center` 等（:187–199）；`xPoint_surjective`（:219，层 1 输出 $x_0$ 反解出 $v_0$ 的关键）；连续性逐条 `continuous_*`（:231–263）；环境版本 `pAmbient/sAmbient/uAmbient/rAmbient/returnAmbient`（:266–283）配 `continuousOn_*`（:303–343）。

**模块 2：极值集 $E$ 与传播规则（第 243–256 行）**
4. $E=\{v\in S_X:s(v)-p(v)=M\}$。闭：$S_X$ 闭、$s-p$ 连续。非空：取 $v_0=(x_0-ty)/\|x_0-ty\|$，由径向切点**唯一性** $x(v_0)=x_0$，此时 $s(v_0)=\|f(x_0)-tb\|$、$p(v_0)=\|x_0-ty\|$，eq:maximal 第二行说 $s(v_0)-p(v_0)=M$，故 $v_0\in E$。
5. 对 $v\in E$ 的两条不等式（第 244–246 行）：
$$s+u=\|f(x(v))-f(z)\|\le p+r,\qquad r-u\le M.$$
来源：等距性把 $\|f(x)-f(z)\|=\|x-z\|$；几何上 $x-z=(p+r)v$ 当且仅当对齐……注意此时 $z$ 未必在 $v$ 线上（$g(v)$ 是另一方向），第一式的正确读法：$s+u=\|f(x(v))-f(z)\|$（共线，方向同为 $w$：两端点在 $tb$ 两侧，故距离是半径和 $s+u$）$=\|x(v)-z\|\le\|x(v)-ty\|+\|ty-z\|=p+r$（三角不等式，中点 $ty$ 插入）。第二式：$r-u=\|ty-z\|-u$… 实为把缺陷界用于对 $(z,?)$：$r-u = D_t(z,\cdot)$ 的绝对值形式——原文只说"distance preservation and the global defect bound give"。重构：$u=\|tb-f(z)\|$，$r=\|ty-z\|$，$|D_t(z, y)|=\big|\|f(z)-tb\|-\|z-ty\big\|=|u-r|\le M$，故 $r-u\le M$。
6. 夹出等号（第 246–250 行）：已知 $s=p+M$（$v\in E$）。$(s+u)-(p+r)=M+(u-r)$。由 $r-u\le M$ 得 $u-r\ge-M$，故 $(s+u)-(p+r)\ge0$… 结合第一不等式 $s+u\le p+r$ ⟹ 两者同时取等：$s+u=p+r$ 且 $r-u=M$。产出 eq:equality（第 248–250 行）：
```latex
r=u+M,\qquad \norm{pv+rg(v)}=p+r.
```
第二式来源：取等现象 $s+u=p+r$ 回代距离链：$\|x(v)-z\|=p+r$，而 $x(v)-z=(ty+pv)-z=pv+(z-ty)\cdot…$；按定义 $g(v)=(ty-z)/r$ ⟹ $z=ty-r\,g(v)$ ⟹ $x(v)-z=pv+r\,g(v)$，其范数 $=\|x(v)-z\|=p+r$。
7. "$\norm{pv+rg(v)}=p+r$（权重 $p,r>0$、向量单位）⟹ $v$ 与 $g(v)$ share a support"——Lemma 2.1 公共支撑条款原样应用。
8. **传播规则**（第 251–256 行）：任何与 $g(v)$ 共享支撑的单位方向 $l$ 属于 $E$。证明链：共支撑 + Lemma 2.1 反向 ⟹ $\|p(l)v'+r\,g(v)\|=p(l)+r$，其中……原文写法："for the fixed $z,r,u$ associated with $v$,"
$$p(l)+r=\norm{x(l)-z}=\norm{f(x(l))-f(z)}\le s(l)+u,$$
第一等号：$x(l)-z=p(l)v'+rg(v)$ 型（$l$ 与 $g(v)$ 共支撑给出 $\|(x(l)-ty)+(ty-z)\|=\|x(l)-ty\|+\|ty-z\|=p(l)+r$；再 $x(l)-z=(x(l)-ty)+(ty-z)$）。第二等号：等距。不等号：$\|f(x(l))-f(z)\|\le\|f(x(l))-tb\|+\|tb-f(z)\|=s(l)+u$（三角）。于是 $s(l)-p(l)\ge r-u=M$；反向 "$M$ 是全局 sup" 给 $s(l)-p(l)\le M$ ⟹ 等号 ⟹ $l\in E$。特别取 $l=g(v)$（自共享支撑）⟹ $g(v)\in E$。
- Lean：ExtremalPropagation.lean。`extremalSphere := {v | sRadius … v - pRadius … v = M}`（:30）、`extremalSet`（:33，环境像）；闭性 `isClosed_extremalSphere/_extremalSet`（:51–57）；非空 `extremalSphere_nonempty_of_attained`（:71，经 `signedDefect_xPoint`（:64）+ `xPoint_surjective`）；取等机器 `extremal_radius_identities`（给出 $r=u+M$、$p+r=s+u$、$\|pv+rg(v)\|=p+r$ 三连——对应论文第 6–7 步）；传播规则 = `positive_prefix_extension` 族（配合 PositiveConvexFace.lean 的 `supportFace`（:73）、`convexHull_insert_subset_of_common_support`（:129）、`closed_convex_extremal_hull`（:191））。PositiveConvexFace 的 docstring 级抽象："支撑面" $\{\varphi=1\}\cap S_X$ 是凸的、闭的、含凸包与闭凸包——传播规则的形式化身。

**模块 3：不变闭凸集 $C$ 的构造（第 258–267 行）**
9. 归纳：$v_0\in E$；设 $\co\{v_0,\dots,v_n\}\subset E$。取**严格正**凸组合 $a_n$（所有权重 $>0$），置 $v_{n+1}=g(a_n)$。设 $\varphi$ 同时支撑 $a_n$ 与 $v_{n+1}=g(a_n)$（模块 2 第 7 步供给），把 $\varphi$ 用 Lemma 2.1 扩张到有 $v_0,\dots,v_{n+1}$ 的有限张成。对每个 $i\le n$：$1=\varphi(a_n)=\sum_j w_j\varphi(v_j)\le\sum_j w_j=\!1$（$w_j>0$）⟹ 逐项 $\varphi(v_i)=1$。于是对增大后凸包内任意 $l$：$1=\varphi(l)\le\|l\|\le1$（$l$ 是单位向量凸组合，$\|l\|\le1$；$\varphi(l)=1$ 由 $\varphi(v_i)=1$ 与权重和 1）⟹ $l$ 是单位向量且与 $v_{n+1}$ 共享支撑 $\varphi$ ⟹ 由传播规则 $l\in E$。
10. 稠密调度（第 265–267 行原文）："Choose the coefficients so that the $a_n$ are dense in $C=\clco\{v_0,v_1,\ldots\}$. Explicitly, enumerate all finite rational probability vectors on initial lists of indices, repeat each arbitrarily late, and at stage $n$ use one whose list is contained in $\{0,\ldots,n\}$. Mix its zero-padded coefficients with the uniform positive vector on that list of $n+1$ indices, using a weight $0<\lambda_n<1$ tending to zero. This changes the prescribed combination by at most $2\lambda_n$, because every $v_i$ is unit. Each prescribed rational combination is therefore a limit of $a_n$'s. Such combinations are dense in $C$, proving the assertion."
11. 结论清点："The set $C$ is nonempty, closed, bounded, convex, and contained in $E\subset S_X$. Since $g(a_n)=v_{n+1}\in C$, continuity gives $g(C)\subset C$. Only this constructed set is separable; the ambient spaces are unrestricted."——$g(C)\subset C$：$a_n\in C$、$g$ 连续、$C$ 闭、$\{a_n\}$ 在 $C$ 中稠密 ⟹ $g(C)\subset\clco\{v_{n}\}$…严格说 $g$ 把生成元 $a_n$ 送进 $C$，稠密像的极限在闭集内。
- Lean：InvariantConvexSet.lean + PositiveScheduling.lean。`recursivePrefix/recursiveVector`（:22,:27）造 $v_n$；`recursiveConvexSet := closure(convexHull(range))`（:106）；属性 `recursiveConvexSet_nonempty/_isClosed/_convex`（:116–126）；不变性 `recursiveConvexSet_invariant`（:127）；总出口 `exists_invariant_closed_convex`（:148，把"稠密调度 + 严格正权重 + 支撑面凸包增长"参数化：输入 = 初始点在 $E$、$E$ 闭、点范数 1、$G$ 在 $E$ 上连续、$G$ 保持严格正凸包性质 `PositivePrefixGrowth`（:56））。调度账目在 PositiveScheduling.lean：`stageMixing n := 1/(n+2)`（:90，具体实现 $\lambda_n$！$0<\lambda_n<1$ 且 $\to0$），`norm_stageMean_sub_rational_le`（:153，"$\le 2\lambda_n$"的形式化），`closure_range_stageMean_eq`（:350），`convexHull_range_subset_of_prefixes`（:331）。$2\lambda$ 界：两个概率向量 $\ell_1$ 距离 $\le2\lambda_n$、向量范数 $\le1$ ⟹ 差 $\le2\lambda_n$——与论文"because every $v_i$ is unit"逐字对。
- 注意 Lean 的 $a_n$ 取的是 `stageMean`（混合权重序列的实现），传播假设由 `positive_prefix_extension`（ExtremalPropagation）喂给 `exists_invariant_closed_convex`。

**模块 4：非紧测度严格下降（第 269–291 行）**
12. 两点估计（eq:contraction 前的链条，第 270–278 行）：对 $v,v'\in E$（带撇记号）：
$$r\|g(v)-g(v')\|\le|r-r'|+\|z-z'\|\le|r-r'|+|u-u'|+u\|w-w'|,$$
第一式：$rg(v)=ty-z$、$r'g(v')=ty-z'$ ⟹ $rg(v)-r'g(v')=z'-z$ ⟹ $r\|g(v)-g(v')\|\le r\|g(v)-g(v')\|+|r-r'|$…准确来源是 $rg(v)-rg(v')=(rg(v)-r'g(v'))+(r'-r)g(v')$，范数 $\le\|z-z'\|+|r-r'|$；第二式：$z-z'=f^{-1}(tb-uw)-f^{-1}(tb-u'w')$ 距离保持 ⟹ $=\|(tb-uw)-(tb-u'w')\|=\|u'w'-uw\|\le|u-u'|+u\|w-w'|$。
$$s\|w-w'\|\le|s-s'|+\|f(x(v))-f(x(v'))\|\le|s-s'|+|p-p'|+p\|v-v'|,$$
同理：$sw=f(x(v))-tb$，$f(x)$ 差用等距回到 $x(v)-x(v')=pv+ty-p'v-ty$…（$=pv-p'v'$ 加上中心相同项）：$\|x(v)-x(v')\|\le|p-p'|+p'\|v-v'\|$——论文写 $p$（用哪个均可，账目对称）。
13. 合并：代入 $s=p+M,\ r=u+M$ 得（eq:contraction，第 280–284 行）：
```latex
\norm{g(v)-g(v')}
\le\frac{up}{rs}\norm{v-v'}
 +\frac{2|u-u'|}{r}+\frac{2u|p-p'|}{rs}.
```
来源：把 $u\|w-w'\|$ 用第二链放缩：$u\|w-w'\|\le\frac{u}{s}(|s-s'|+|p-p'|+p\|v-v'\|)$，注意 $|s-s'|=|(p+M)-(p'+M)|=|p-p'|$ ⟹ $\|z-z'\|\le|u-u'|+\frac up\ldots$；论文给的最终式含 $2|u-u'|/r$（因子 2 = $|r-r'|=|u-u|$…用 $r-u=M$ 恒定，$|r-r'|=|u-u'|$，前两项合并给 $2|u-u'|/r$）与 $2u|p-p'|/(rs)$（$\frac{up}{rs}$ 主项 + $\frac{u}{rs}|p-p'|\cdot2$ 尾项）。逐项复算：$r\|g-g'\|\le|r-r'|+\|z-z'\|\le|u-u'|+|u-u'|+u\|w-w'\|=2|u-u'|+u\|w-w'\|$；$u\|w-w'\|\le\frac us(|s-s'|+\|x-x'\|)\le\frac us(|p-p'|+|p-p'|+p\|v-v'\|)$——$|s-s'|=|p-p'|$。⟹ $r\|g-g'\|\le2|u-u'|+\frac{2u}{s}|p-p'|+\frac{up}{rs}\cdot r\|v-v'\|$（注意 $\frac up\cdot r\|v-v'\|=\frac{up}{rs}r\|v-v'\|$）⟹ 两边除 $r$ 得 eq:contraction。与第 270–284 行吻合。
14. 收缩系数（第 285–290 行）：$a=1-t>0,U=1+t$；半径全在 $[a,U]$；$r=u+M,s=p+M$ ⟹ $0<M<r,s$；
$$\frac{up}{rs}=\Bigl(1-\frac Mr\Bigr)\Bigl(1-\frac Ms\Bigr)\le\gamma:=\Bigl(1-\frac M{U}\Bigr)^2<1.$$
单调性：$1-M/r$ 关于 $r$ 递增（$M>0$ 固定，$r$ 大 ⟹ $M/r$ 小 ⟹ 因子大），故 $r\le U\Rightarrow 1-M/r\le1-M/U$；两因子同界相乘。$0<M/U$ 与 $M\le1\le U$ ⟹ $1-M/U\in(0,1)$。另 $M<r,s$：用于分箱讨论里比值良定（$r\ge M>0$）。
15. 分箱论证（第 291 行）：给 $H\subset C$ 与直径 $\le\delta$ 的有限覆盖 $\{H_i\}$。对 $\eta>0$：把每块与 $H$ 交，再按 $p$ 与 $u$ 的值域各分成长度 $\le\eta$ 的有限区间族预像细分（$p,u$ 值域在 $[a,U]$ 内，故区间数有限 $\lceil(U-a)/\eta\rceil$）。同一小块内 $v,v'$ 满足 $\|v-v'\|\le\delta$、$|p-p'|\le\eta$、$|u-u'|\le\eta$ ⟹ eq:contraction 尾两项和 $\le\frac{2\eta}{r}+\frac{2u\eta}{rs}\le\frac{2\eta}{a}+\frac{2\eta\cdot U}{a\cdot a}\cdot\frac{r s}{?}$…论文口径："Since $r,s\ge a$ and $u/r<1$, the last two terms sum to at most $4\eta/a$"（$2|u-u'|/r\le2\eta/a$；$2u|p-p'|/(rs)\le2\eta\cdot(u/r)/s\le2\eta/a$，用 $u<r$（因 $r=u+M$）与 $s\ge a$）。每块像直径 $\le\gamma\delta+4\eta/a$。$\eta\downarrow0$（覆盖结构固定，直径界连续下降）再对 $\delta$ 取 inf ⟹ $\chi(g(H))\le\gamma\chi(H)$。
- Lean：ReturnMapEstimate.lean 给两点不等式本体：`returnSphere_pair_estimate`（:82）、`returnAmbient_pair_estimate`（:170）、`returnAmbient_pair_estimate_on`（:188）；纯标量化归在 ReturnMapBounds.lean：`return_pair_error_le`（:35）、`return_pair_uniform_bound`（:58）、`radius_ratio_le_factor`（:12）、`return_coefficient_le`（:21）；$\gamma$ 区间性：`return_factor_mem_Ico`（:81）、`return_contraction_factor_mem_Ico`（:94，产出 $0\le\gamma'\le\gamma$ 与 $\gamma<1$）。分箱：ScalarBins.lean `exists_finite_scalar_bins`（:20）+ CoefficientBins.lean + ReturnMapNoncompactness.lean `finiteDiameterCover_image_of_scalar_bins`（:21，"覆盖像的直径界 = $\gamma\delta+4\eta/a$" 的实现，论文"letting $\eta\downarrow0$ for this fixed cover" 在 Lean 里用 $\eta=$1/k 序列取 inf）、`chi_return_image_le`（:60，输出 `chi (g '' H) ≤ (1 - M/(1+t))^2 * chi H`，且 docstring 明示"including the empty subset"——空集情形 $\chi(\emptyset)=0$ 需单独处理，论文未提）。
16. 收尾（第 293 行）："Theorem 4.1 now gives $v\in C$ with $g(v)=v$. Set $x=x(v)$; this endpoint may differ from $x_0$. Substitution in (eq:return) gives (eq:chords). Equation (eq:equality) and distance preservation give (eq:radii)."——不动点 $g(v)=v$ ⟹ $z=ty-rv$（因 $rg(v)=ty-z$）⟹ eq:chords 四式；eq:radii 的 $d=\|x-z\|$：对齐后 $x-z=(p+r)v$ ⟹ $\|x-z\|=p+r$；$\le2$ 由两单位向量距离。

(c) 假设与常数的机械性理由（本条最丰）：
- $0<t<1$：$\|ty\|=t<1$ 使两侧径向切点存在唯一（Lemma 2.2）；$t>0$ 保证 $b$ 侧中心非零方向归一良定？实际 $t=0$ 时中心 $=0$、$\rho\equiv1$、$p=r=s=u=1$、$M=s-p=0$ 与 $M>0$ 矛盾——$t>0$ 由 $M/2\le t$ 自动。$t<1$ 由 $t\le1-M/2$。
- $M>0$ 用在：$\gamma<1$ **严格**（若 $M=0$ 则 $\gamma=1$，Darbo 失效——这正是"要证明的就是 $M=0$"反讽点：$M=0$ 时无需不动点，$M>0$ 时不动点可用）；$0<M<r,s$；$A+B=1-M/d<1$（层 3）。
- "$s-p=M$" 而非 $\ge M-\text{tol}$：传播规则第 8 步的夹逼 $s(l)-p(l)\ge M$ + 全局界 $\le M$ 必须精确取等；带容差则 $E$ 不闭/不传播。
- "$v\in S_X$"（$E\subset S_X$）：$1=\varphi(l)\le\|l\|\le1$ 的右端 $\|l\|\le1$ 依赖凸包在单位球内（凸性！）——若 $E$ 含非单位向量，$C\subset$ 凸包会跑出球面，传播断。
- "$\lambda_n\to0$、$\sum$ 严格正"：见模块 3；若权重允许 0，$\varphi(v_i)=1$ 的逐项取等失效（0 权重的 $v_i$ 不被探测）。
- "$X$ 完备（Banach）"：Darbo 定理的载体；回返映射与 $C$ 都住在 $X$。$Y$ 的完备性在本条不消费（只在链式定义中 $f$ 的定义域像……实际 $u$ 侧径向切点在 $Y$ 中，需 $Y$ 完备？Lemma 2.2 不需完备；$Y$ 完备留给后续。Lean 在 Alignment 层只要求 `[CompleteSpace X]`（Alignment.lean:61！），Extension 层才双完备——与论文口径一致的精细度）。
- 论文强调（第 267 行）"Only this constructed set is separable; the ambient spaces are unrestricted"：$C$ 是可数点集凸包的闭包 ⟹ 可分；Darbo 的 $\chi$  machinery 只涉及 $C$ 内覆盖，绕开全空间非可分障碍。
- Lean 接口差异：`exists_alignedConfiguration`（Alignment.lean:61）输入含 `x₀` 与 `hatt : signedDefect f t x₀ y = M`，输出 `Nonempty (AlignedConfiguration f y t M)`；`AlignedConfiguration`（AlignedConfiguration.lean:23–44）是携带 eq:chords/eq:radii 全部 17 个场（$x,z,v,w,p,r,s,u$ + 4 正性 + 4 等式 + 2 缺陷等式 + chord_sum + chord_le_two）的结构；`aligned_of_return_fixed`（Alignment.lean:25）把不动点填进结构；`chord_le_two` 在 Lean 是从 $\|x-z\|\le2$ 显式算出（Alignment.lean:49–58），对应论文"≤2"一笔。

(d) `[推测]` 候选失败路线：
1. `[推测]` 直接用 Schauder 于 $C$：$C$ 在无穷维不紧（一般情形 $\chi(C)>0$），Schauder 不适用；只有压缩 $\chi$ 的 Darbo 可用——而这要求 eq:contraction 的尾项 $|u-u'|,|p-p'|$ 可控，恰恰因为 $C$ 内 $s=p+M,r=u+M$ 把 $r,s$ 波动**转嫁**给 $p,u$，半径函数在分箱内一致小。若 $E$ 上无 $s-p=M$ 恒等（例如取 $s-p\ge M-\text{tol}$ 的宽集），$|s-s'|\le|p-p'|+\text{tol}$ 破坏分箱尾项口径，$\chi$ 压缩断。
2. `[推测]` 不用不动点、直接取 $v_0$（attainment 点）：$g(v_0)$ 未必 $=v_0$；$z$ 侧由 $g(v_0)$ 决定，$x$ 侧方向是 $v_0$——两弦不对齐，eq:chords 的共线结构（特别是 $z=ty-rv$ 用**同一个** $v$）不成立，层 3 的 $F(r/\epsilon)$/$G(u/\epsilon)$ 比较（依赖 $x-z=(p+r)v$ 单一方向）整体失效。对齐就是不动点提供的唯一东西。
3. `[推测]` 传播规则若只有"存在一个支撑"而非"每个共支撑方向都入 $E$"：$C=\clco\{v_n\}$ 的内点（非生成元）不再有理由在 $E$ 中，$g(C)\subset C$ 断；变体"选唯一支撑"在非光滑空间不可行（支撑不唯一）。论文用"every unit direction $l$ sharing a support with $g(v)$ belongs to $E$"的**全称**传播，这是非光滑性（定理允许任意凸性）下唯一的活路。

## 2.6 弦参数与 secant 引理（§5 开头 + Lemma 5.1；lem:secant）

(a) 精确陈述（TeX 原文照抄，第 321–345 行）：

> Fix the configuration supplied by Proposition~\ref{prop:alignment}, illustrated in Figure~\ref{fig:chords}, and set
```latex
\begin{equation}\label{eq:AB}
A=\frac p d,\qquad B=\frac u d,\qquad \epsilon=1-t.
\end{equation}
```
> Then $A,B>0$ and $A+B=1-M/d<1$.

> We first derive a secant estimate from the defect bound. If either $A$ or $B$ exceeds $\epsilon$, this estimate leads to a radial perturbation that increases the maximal defect. In the remaining case, convexity gives incompatible bounds for the preserved distance from $y$ to $z$.

```latex
\begin{lemma}\label{lem:secant}
Put
\[
h=\min\left\{\frac t s,\frac\epsilon u\right\},\qquad
\theta=\frac{hs}{p},\qquad
K=\frac{\norm{(r/u)v+hy}-\norm{(p/s)v+hy}}{r/u-p/s}.
\]
For every support $\varphi$ at $v+\theta y$,
\begin{equation}\label{eq:K}
\frac\epsilon p\le\varphi(v)\le K\le
\begin{cases}
1-B,& B\le\epsilon,\\
B,& B>\epsilon.
\end{cases}
\end{equation}
\end{lemma}
```

(b) 机制逐步推演（第 346–374 行）：
1. $A+B=(p+u)/d$；由 eq:radii：$d=p+r=s+u$ ⟹ $p+u=d-(s-p)=d-M$ ⟹ $A+B=1-M/d<1$（用 $M>0,d>0$）。$d\le2$（prop 4.2）；$d\ge(p+r)\ge2(1-t)=2\epsilon$（半径下界）。
2. 两个测试半径：$q_1=t-sh$、$q_2=t+uh$。$h\le t/s$ ⟹ $q_1\ge0$；$h\le\epsilon/u$ ⟹ $q_2=t+uh\le t+\epsilon=1$ ⟹ 两半径 $\in[0,1]$，缺陷界可用。且 $h$ 是 min ⟹ 至少一个约束取等 ⟹ $q_1=0$ 或 $q_2=1$。
3. $\Delta_x:=D_{t-sh}(x,y)=\|f(x)-(t-sh)b\|-\|x-(t-sh)y\|$。代入 eq:chords：$f(x)-tb+sh\,b=s\,w+sh\,b=s\|w+hb\|$；$x-ty+sh\,y=p\,v+sh\,y=p(v+(s h/p)y)=p(v+\theta y)$……论文第 348–350 行写 $\Delta_x=s\bigl(\norm{w+hb}-\norm{(p/s)v+hy}\bigr)$——即分别提因子 $s$ 与 $s$（$\|p v+sh y\|=s\|(p/s)v+hy\|$）。同理第 352–353 行：$-\Delta_z:=-D_{t+uh}(z,y)=u\bigl(\norm{(r/u)v+hy}-\norm{w+hb}\bigr)$（$f(z)-t b-u h b=-u(w+hb)$，$z-ty-uh\,y=-r v-uh\,y$…符号提出 $u$ 后 $(r/u)v+hy$）。
4. $u\Delta_x+s\Delta_z$（第 355–358 行）：公共项 $\|w+hb\|$ 系数 $us-su=0$ 相消 ⟹ $u\Delta_x+s\Delta_z=u s(\|(r/u)v+hy\|-\|(p/s)v+hy\|)$；又 $r/u-p/s=(rs-up)/(us)$，而 $rs-up=(s-p)(u+M)+…$ 直接算：$rs-up=r(p+M)-u p=p(r-u)+Mr=Md+Mr$…论文给"$sr-up=Md$"（第 355 行"since $sr-up=Md$"）：$sr-up=s(u+M)-u(p+M)=su+Ms-up-uM$…重算：$sr - up$，用 $r=u+M, s=p+M$：$sr=(p+M)(u+M)$，$up$ ⟹ $sr-up=M(p+u)+M^2=M(p+u+M)=M(p+r)=Md$（用 $p+u+M=p+u+(r-u)=p+r=d$）。正确。于是
$$\frac{u\Delta_x+s\Delta_z}{d}=M\cdot\frac{\|(r/u)v+hy\|-\|(p/s)v+hy\|}{r/u-p/s}=MK.$$
5. 上界 $\le$：分 $B\le\epsilon$ ⟺ $t/s\le\epsilon/u$（等价性：$B\le\epsilon$ ⟺ $u/d\le\epsilon$；$t/s\le(1-t)/u$ ⟺ $tu\le s(1-t)$ ⟺ …论文第 359 行断言等价，Lean 证之：`step_comparison_iff` ChordSecant.lean:95。可验算：$t/s\le\epsilon/u$ ⟺ $tu\le s\epsilon$ ⟺ $tu\le(p+M)(1-t)$；而 $B\le\epsilon$ ⟺ $u\le d\epsilon=(p+r)(1-t)$。两者等价需更多账目——机制：$d\epsilon=(p+r)\epsilon$，$s\epsilon=(p+M)\epsilon$，用 $r=u+M$ ⟹ $(p+r)\epsilon=(p+u+M)\epsilon$，$(p+M)\epsilon$ ⟹ $tu\le(p+M)\epsilon$ ⟺ $u(t+\epsilon)\le u+t\epsilon+…$；信任论文与 Lean 的 `step_comparison_iff`。）情形一 $B\le\epsilon$：$h=t/s$ ⟹ $q_1=0$ ⟹ $\Delta_x=D_0=0$ ⟹ $MK=(s\Delta_z)/d\le sM/d$（$\Delta_z\le M$）⟹ $K\le s/d=1-B$（$s/d=(p+M)/d$… $s/d=(d-u)/d=1-B$）。情形二 $B>\epsilon$：$h=\epsilon/u$ ⟹ $q_2=1$ ⟹ $\Delta_z=D_1=0$ ⟹ $MK=u\Delta_x/d\le uM/d$ ⟹ $K\le B$。边界 $B=\epsilon$ 两者 $\Delta$ 同零 ⟹ $K=0\le\min\{B,1-B\}$（"$K=0$ 且上界仍真"，第 359 行末句）。
6. 下界 $\varphi(v)\ge\epsilon/p$（第 363–373 行）：
   - 先看 $\varphi(v)\le K$：$r/u>p/s$（⟺ $rs>up$ ⟺ $Md>0$，第 363 行"$r/u>p/s>0$"）⟹ $K$ 是凸函数 $\lambda\mapsto\|\lambda v+hy\|$ 在 $\lambda_1=p/s<\lambda_2=r/u$ 的 secant 斜率。支撑 $\psi$ 于 $(p/s)v+hy$（即 $\theta$ 缩放的向量）给次梯度不等式 $\|\lambda v+hy\|\ge\varphi(\lambda v+hy)$（$\varphi$ 范数 $\le1$）……论文第 363 行："Since $r/u>p/s>0$, a support at $v+\theta y$, hence also at $(p/s)v+hy$, bounds the secant from below by $\varphi(v)$."：$\varphi$ 同时是 $(p/s)v+hy$ 的支撑（正标量倍，Lemma 2.1 的 $c$ 倍条款），故 $\|(r/u)v+hy\|-\|(p/s)v+hy\|\ge\varphi((r/u-p/s)v)=(r/u-p/s)\varphi(v)$。
   - 再证 $\epsilon/p\le\varphi(v)$：$\beta:=t/p$，$\theta=hs/p\le t/p=\beta$（$h\le t/s$）。若 $\theta=\beta$：$\varphi(v)=(\varphi(v+\theta y)-\theta\varphi(y))=(\|v+\theta y\|-\theta\varphi(y))\ge\|v+\theta y\|-\theta$……第 365–367 行写法：$\varphi(v)=\frac{1-t\varphi(y)}{p}\ge\frac{1-t}{p}=\epsilon/p$（用 $\varphi(v+\beta y)=\|v+\beta y\|$ 且 $p v+t y=x\in S_X$ ⟹ $\|v+\beta y\|=1/p$；$\varphi(y)\le1$）。若 $\theta<\beta$：取 $\psi$ 支撑 $v+\beta y$；两条支撑不等式相减得第 369–371 行双链 $\theta(\psi(y)-\varphi(y))\le\varphi(v)-\psi(v)\le\beta(\psi(y)-\varphi(y))$（来源：$\varphi(v+\beta y)\le\|v+\beta y\|=\psi(v+\beta y)$ 与 $\psi(v+\theta y)\le\|v+\theta y\|=\varphi(v+\theta y)$ 各自展开移项）。由 $\theta<\beta$ 与左端 $\le$ 右端 ⟹ $\psi(y)-\varphi(y)\ge0$ ⟹ $\varphi(v)\ge\psi(v)$；$\psi$ 在 $\theta=\beta$ 情形已证 $\psi(v)\ge\epsilon/p$（$\beta$ 情形内部：$p\psi(v)+t\psi(y)=\psi(pv+ty)=1$ ⟹ 同第 365 行）⟹ $\varphi(v)\ge\epsilon/p$。
   - 支撑对象非零性（第 361 行）：若 $v+\theta y=0$ 则 $\theta=1,y=-v$，但 $\|ty+pv\|=1$ 且 $v=-y$ ⟹ $\|pv-ty\|=1$ ⟹ 由 $p\le1+t$……论文断言 $\|ty+pv\|=1$ 与 $v=-y$ 强制 $p=1+t$，而 $\theta=hs/p\le ts/p<1$（$h\le t/s$ ⟹ $\theta\le t/p$；若 $p=1+t$ 则 $t/p<1$）⟹ $\theta<1=\theta$ 矛盾。此段只为让"$\varphi$ 支撑 $v+\theta y$"非平凡。
- Lean：ChordSecant.lean。`secantStep := min (t/s) ((1-t)/u)`（:67，$h$）、`secantTheta := secantStep*s/p`（:68）、`secantSlope`（:69，$K$）；`secantStep_pos/_Theta_pos/_Theta_le`（:74–86）；`secant_denominator_pos`（:87，$r/u-p/s>0$）；`step_comparison_iff`（:95）；`secantStep_eq_smallB/_largeB`（:103,:106）；`secant_radii_mem`（:111）；`secant_defect_first/_opposite`（:125,:142，即 $\Delta_x,\Delta_z$ 两式）；`secant_weighted_identity`（:159，$u\Delta_x+s\Delta_z=Md\cdot K$ 的等式本体，内含 $sr-up$ 账）；`secant_upper_smallB/_largeB`（:173,:196，$K\le1-B$ / $K\le B$ 分枝）；`secant_bounds`（:221，(eq:K) 三合一，下界部分调用 support_direction_lower（:22，双支撑 $\theta/\beta$ 夹逼的形式化——论文第 367–373 行的逐字翻译））；`small_secant_product`（:256，$\epsilon\le dA(1-B)$：`exists_support` 取 $\varphi$ 于 $v+\theta y$，链 $\epsilon/p\le\varphi(v)\le K\le1-B$ ⟹ $1-t\le(1-B)p=(1-B)dA$）。

(c) 假设与常数的机械性理由：
- $h$ 取 min 而非任意值：保证（i）两测试半径 $\in[0,1]$（缺陷界定义域）；（ii）至少一个落在端点（$D_0=D_1=0$ 免费零），使加权和中一半 $\Delta$ 为零、剩一半吃 $M$ 界——上界 $K\le\max\{B,1-B\}$ 分支来源。若 $h$ 更小：两 $\Delta$ 都只用 $M$ 界、无零项，$K$ 的上界变成 $K\le(s+u)/d\cdot M/M=1$，无用。
- $\theta=hs/p$：把 $h$ 半径处的向量 $(p/s)v+hy$ 归一为 $v+\theta y$ 单位系数 $v$，让"support at $v+\theta y$"成为全空间一致的记号（并对接 $\beta=t/p$ 的比较）。
- $\epsilon/p$ 下界消费 $\varphi(y)\le1$（支撑归一）与 $\epsilon=1-t$ 的正性（$t<1$ 第二次消费）。
- 分支阈值 $B\le\epsilon$ ⟺ $t/s\le\epsilon/u$：Lean 单独证等价（`step_comparison_iff`），论文直接断言——若等价不成立整个分枝覆盖有洞，故这是形式化必须补的引理。
- 去掉 "$\varphi$ 是**每个**支撑"：下界对每个支撑成立的性质在 Lemma 5.2 中被用于"任意支持 $L$ 于 $v$，$j=L(y)$"的推断——全称量化是后续符号结论的原料。

(d) `[推测]` 候选失败路线：
1. `[推测]` 用中点 $q=1/2$ 的 secant 代替自适应 $h$：$1/2$ 不在 $\{t-sh,t+uh\}$ 的构造位，公共范数项 $\|w+(\cdot)b\|$ 无法同时出现在两个 $\Delta$ 中相消——加权消元机制依赖两个半径上的**同一个** $h$ 缩放，论文第 355 行的 $u\Delta_x+s\Delta_z$ 相消是精确设计。
2. `[推测]` 若 $\varphi(v)\ge\epsilon/p$ 的下界尝试直接对 $v$ 取支撑（而非 $v+\theta y$）：$v$ 自己的支撑对 $y$ 无信息（$\varphi(y)$ 任意），$\epsilon/p$ 来源恰是"支撑 $v+\theta y$ 把 $v,y$ 分量通过范数等式绑住"。
3. `[推测]` $K$ 定义分母取 $p/s-r/u$（反号）：$r/u-p/s>0$ 用 $Md>0$；反向定义会让"支撑从下方界 secant"变成"从上方"，方向感反、下界链断。
## 2.7 Lemma 5.2（大参数分支不可能；lem:large）

(a) 精确陈述（TeX 原文照抄，第 376–378 行）：

```latex
\begin{lemma}\label{lem:large}
Neither $A>\epsilon$ nor $B>\epsilon$ is possible.
\end{lemma}
```

(b) 机制逐步推演（证明第 379–415 行，四段）：

**第一段：$B>\epsilon$ 的即时效应（第 380–383 行）**
1. $B>\epsilon$ ⟹ $h=\epsilon/u$（min 取后者）。Lemma 5.1 的左链 $\epsilon/p\le K$ 与右枝 $K\le B$……实际产出物是 eq:product（第 381–383 行）：
```latex
\frac{pu}{d\epsilon}\ge1.
```
来源：$\epsilon/p\le\varphi(v)\le K\le B=u/d$ ⟹ $\epsilon/p\le u/d$ ⟹ $pu\ge d\epsilon$。（Lean：`largeB_product_bounds`，LargeChord.lean:28。）

**第二段：支撑符号引理（第 384–393 行）**
2. 取任意支撑 $L$ 于 $v$，记 $j:=L(y)$。对 $v+\theta y$ 的支撑 $\varphi$（eq:strictchain，第 385–388 行）：
$$B\ge\varphi(v)=\norm{v+\theta y}-\theta\varphi(y)\ge1+\theta j-\theta.$$
来源：$\varphi(v)=\varphi(v+\theta y)-\theta\varphi(y)=\|v+\theta y\|-\theta\varphi(y)$（支撑等式）；$\varphi(y)\le L(y)=j$??——注意方向：第二 $\ge$ 用 $\varphi(y)\le j$？论文写 $\ge 1+\theta j-\theta$，即 $-\theta\varphi(y)\ge-\theta j$ ⟺ $\varphi(y)\le j$。此不等式的来源是"$L$ 支撑 $v$、$\varphi$ 支撑 $v+\theta y$ 时的交叉比较"：$\varphi(v+\theta y)=\|v+\theta y\|\ge L(v+\theta y)=1+\theta j$ 且 $\varphi(v+\theta y)=\varphi(v)+\theta\varphi(y)\le\|v+\theta y\|$……严格重构：$\varphi(v)=\|v+\theta y\|-\theta\varphi(y)$；$\varphi(y)\le 1$ 给 $\ge\|v+\theta y\|-\theta$；再 $\|v+\theta y\|\ge L(v+\theta y)=1+\theta j$（$L$ 范数 $\le1$）。合并 ⟹ $\varphi(v)\ge 1+\theta j-\theta$。第一步等式与 $\varphi(y)\le1$ 用 $\theta\ge0$。
3. **严格化**（第 389 行）："In fact $B>1+\theta j-\theta$."：若全程取等，则 $\|v+\theta y\|=L(v+\theta y)$ ⟹ $L$ 也是 $v+\theta y$ 的支撑 ⟹ Lemma 5.1 适用于 $L$ ⟹ $1=L(v)\le B<1$ 矛盾（$B<1$ 由 $A+B<1,A>0$）。故严格不等式成立，重排：
$$1-j>\frac{1-B}{\theta}.$$
4. 结合 eq:product 与 $\theta$ 的账（第 391 行）：$\frac{1-B}{\theta}=\frac{pu}{d\epsilon}\ge1$。核对：$1-B=s/d$（AlignedConfiguration.lean:131 `one_sub_B`），$\theta=hs/p=(\epsilon/u)s/p$ ⟹ $\frac{1-B}{\theta}=\frac{s/d}{\epsilon s/(up)}=\frac{pu}{d\epsilon}$。⟹ $1-j>1$ ⟹ $j<0$：**每个** $v$ 的支撑在 $y$ 上严格负（第 392 行"Every support at $v$ is strictly negative on $y$"）。
5. 推论（第 392–393 行）：对 $rv-ty=-z$ 应用一个 $v$ 支撑 $L$（$L$ 支撑 $v$ ⟹ 支撑 $rv$ 正倍）：$1=\|z\|=\|ty-rv\|\ge L(ty-rv)=tj-r$ ⟹ $r\ge tj-1$?? 论文写"$r-tj\le1$，so $u<r<1$"：由 $j<0$ ⟹ $r-tj\le1$ ⟹ $r<1+t j<1$。又 $r=u+M>u$ ⟹ $u<1$。eq:product $pu\ge d\epsilon$ 除以 $u\in(0,1)$…论文："Equation (eq:product), namely $Au\ge\epsilon$, then gives $A>\epsilon$"（$A=p/d$，$Au=pu/d\ge\epsilon$，$u<1$ ⟹ $A>\epsilon$）。⟹ **$B>\epsilon\Rightarrow A>\epsilon$ 且 $v$ 侧支撑全负于 $y$**。
- Lean：`largeB_forces_largeA_and_negative_support`（LargeChord.lean:49，第 2–5 步打包）；严格化用 `And` 内嵌 $\varphi$/$L$ 论证；支撑符号 = `largeB_support_signs`（:112）。

**第三段：逆构型的显式搬运（第 395–400 行）**
6. eq:inverse（第 396–399 行）：
```latex
(p',s',r',u')=(u,r,s,p),\quad
(v',w',y',b')=(-w,-v,b,y).
```
对 $f^{-1}$：以 $f(z)$ 为第一端点、$b$ 为基方向、$f(x)$ 为对面端点。核对四弦式（eq:chords 的原型）：$f(z)=tb-uw=t\,b'+p'v'$（$b'=f(y)$??——注意这里 $y'=b$ 是"$f^{-1}$ 的基方向"，即 $f^{-1}(b)=y$……论文记号 $y'$ 在 eq:chords 的 $y$ 位（第一空间方向），$b'$ 在 $b=f(y)$ 位（第二空间基点）：$f^{-1}(f(z))=z=ty-rv=\underbrace{t}_{base}y'+p'v'$ 要求 $y'=b$??——原文明说"y'=b, b'=y"：第一端点 $f(z)$ 在第二空间、方向 $-w$…按 eq:chords 模板 $x'=f(z),y'=b,z'=f(x),v'=-w$ 属 $Y$；$f^{-1}$ 侧 $b'=f^{-1}(y)=x$?? 论文的记号约定是把 eq:chords 的 $(X,Y,f,y,b)$ 五元组换成 $(Y,X,f^{-1},b,y)$。于是 $x'=f(z)=t b+(-u)w=t y'+p' v'$（$p'=u,v'=-w$）✓；$z'=f(x)=tb+sw = t y'-r' v'$（$r'=s$）✓；$f^{-1}(x')=z=ty-rv=t b'+s' w'$ 需 $w'=-v$、$s'=r$ ✓；$f^{-1}(z')=x=ty+pv=t b'-u' w'$（$u'=p$）✓。新缺陷：$s'-p'=r-u=M$ ✓（用 eq:radii）。$(A',B')=(p'/d',u'/d')=(u/d,p/d)=(B,A)$ ✓（$d'=p'+r'=u+s=d$ ✓）。eq:inverse-defect 保证 $|D_q^{f^{-1}}|\le M$ 全局界保留（第 400 行"the inverse retains the bound in (eq:maximal)"）。
7. 把第一段–第二段施于逆构型（第 400 行）："$A>\epsilon$ implies $B>\epsilon$"（即逆构型版本 $B'>\epsilon\Rightarrow A'>\epsilon$ 换字母）且"every support at $-w$ is strictly negative on $b$。Equivalently, every support at $w$ is strictly positive on $b$."（$\varphi$ 支撑 $w$ ⟺ $-\varphi$ 支撑 $-w$；$(-\varphi)(b)=-\varphi(b)>0$ ⟺ $\varphi(b)<0$??——原文等价句照录，符号翻转一次）。⟹ **合成双向锁定：任一大严格不等式成立 ⟹ 两个符号结论同时成立**（第 402 行"Consequently, if either strict inequality holds, both support-sign conclusions hold"）。

**第四段：径向微扰矛盾（第 402–414 行）**
8. 对 $0<\eta<t$，eq:perturb（第 403–405 行）：
```latex
\norm{sw+\eta b}-\norm{pv+\eta y}\le M=s-p.
```
来源：$D_{t-\eta}(x,y)\le M$ 且 $t-\eta\in[0,1]$：$\|f(x)-(t-\eta)b\|-\|x-(t-\eta)y\|=\|sw+\eta b\|-\|pv+\eta y\|\le M$。
9. 左项严格大：$\|sw+\eta b\|>s$——取 $w$ 的支撑 $\varphi$（$\varphi(w)=1,\|\varphi\|\le1$）：$\|sw+\eta b\|\ge\varphi(sw+\eta b)=s+\eta\varphi(b)>s$（用符号结论 $\varphi(b)>0$）。
10. 右项严格小（反证 + 有限维紧性，第 406–413 行）：设存在 $\eta_n\downarrow0$ 使 $\|pv+\eta_n y\|\ge p$。在 $\operatorname{span}\{v,y\}$ 上取 $pv+\eta_n y$ 的支撑 $L_n$（Lemma 2.1，二维）。由 $L_n(v)\le1$：$p\le\|pv+\eta_n y\|=L_n(pv+\eta_n y)=pL_n(v)+\eta_nL_n(y)$ ⟹ $L_n(y)\ge p(1-L_n(v))/\eta_n\ge0$。有限维对偶闭球紧 ⟹ 收敛子列 $L_n\to L$（逐点），$L(y)\ge0$；支撑等式取极限：$pL(v)=\lim(\|pv+\eta_ny\|-\eta_nL_n(y))=p$ ⟹ $L(v)=1,\|L\|\le1$ ⟹ $L$ 支撑 $v$ 且 $L(y)\ge0$——与"$v$ 的每个支撑在 $y$ 上严格负"矛盾。故所有小 $\eta>0$ 有 $\|pv+\eta y\|<p$。
11. 收尾（第 414 行）："The two strict norm inequalities contradict (eq:perturb)"：$\|sw+\eta b\|-\|pv+\eta y\|>s-p=M$ 违反 $\le M$。⟹ $B>\epsilon$ 不可能；对称地 $A>\epsilon$ 也不可能（经逆构型：$A>\epsilon\Rightarrow B>\epsilon$，而 $B>\epsilon$ 已否）。
- Lean：`largeB_impossible`（LargeChord.lean:133）总装；微扰侧独立文件 RadialPerturbation.lean：`exists_dual_gap_of_supportAt_neg`（:21 private，符号结论 ⟹ 泛函间隙）、`exists_radial_perturbation_lt_finiteDimensional`（:53，第 10 步：紧子列 `Mathlib.Topology.Order.Compact` + `FiniteDimension` 的局部紧性）、`exists_radial_perturbation_lt`（:87，公开形）、`exists_radial_perturbation_lt_with_cap`（:110，带 $\eta<t$ 上限制式——对应论文"For $0<\eta<t$"与"$\eta$ 充分小"两句的合并）。逆构型 = `AlignedConfiguration.inverse`（AlignedConfiguration.lean:178，结构级 1:1 搬运）。

(c) 假设与常数的机械性理由：
- $0<\eta<t$：$\eta<t$ 保 $t-\eta>0$……实际需 $t-\eta\in[0,1]$：$\eta>0$ 给 $<t\le1$，$\eta<t$ 给 $>0$（$q=0$ 处缺陷为 0 也行，但 $\eta=0$ 时第 9、10 步的严格不等式无阶差可挑）。取 $\eta$ "充分小"用在第 10 步的存在性否定；$\eta$ 不能任意大到越过 $t$。
- "$\varphi(b)>0$ 且 $L(y)<0$ **严格**"：第 9 步 $s+\eta\varphi(b)>s$ 与第 10 步矛盾都吃严格性；若只 $\ge0/\le0$，第 9 步变 $\ge$、第 11 步不再严格违反 $\le M$。严格性来自第 3 步"若取等则 $1\le B<1$"——一个自举：$B<1$ 来自 $A+B<1,A>0$（即 $M>0,d<\infty$）。
- $\epsilon>0$（$t<1$）：eq:product 分母；$A>\epsilon$ 分支若 $\epsilon=0$ 恒真、分支塌。
- $u<1$（第 393 行）：$u<r<1$；用在 $Au\ge\epsilon\Rightarrow A>\epsilon$。若 $u\ge1$ 只给 $A\ge\epsilon$，非严格，后续"$A>\epsilon$"链断——$u<1$ 的来源是"$j<0$ ⟹ $r-tj\le1$ ⟹ $r<1$"。
- 有限维：紧性只用于 $\operatorname{span}\{v,y\}$ 的对偶闭球（第 406 行明示"on $\operatorname{span}\{v,y\}$"）；全空间不必局部紧。这是 Lemma 2.1 "有限扩张"条款兑现处。

(d) `[推测]` 候选失败路线：
1. `[推测]` 不用逆构型、直接证 $A>\epsilon$ 分支矛盾：原文路径是 $B>\epsilon\Rightarrow A>\epsilon$（第二段）与 $A>\epsilon\Rightarrow B>\epsilon$（第三段经逆）形成**环**，再由 $B>\epsilon$ 单独不可破 ⟹ 双双不可能。若缺逆构型环，$A>\epsilon$ 分支没有独立微扰矛盾（微扰不等式 $\|sw+\eta b\|>s$ 需要 $w$ 支撑在 $b$ 正号，该信息只有经"$A>\epsilon\Rightarrow$（逆构型第一类推导）"才有）。此对称化搬运是必需工序而非锦上添花。
2. `[推测]` 用二阶凸性/光滑性论证代替微扰：一般空间无光滑性（定理允许任意范数），次微分可能多值且不连续——第 10 步的"取支撑子列极限"正是为规避光滑性需求；假设严格凸才能直接写导数。
3. `[推测]` eq:perturb 取半径 $t+\eta$（另一侧）：$\|sw-\eta b\|-\|pv-\eta y\|$ 的符号方向不可控（没有支撑正负号可用——$t+\eta$ 处 $z,y$ 对的缺陷含 $z$ 侧，其支撑符号信息是"$-w$ 上 $b$ 负"，方向相反），机制不闭合。

## 2.8 Proposition 5.3（小参数分支的凸性矛盾；prop:no-defect）

(a) 精确陈述（TeX 原文照抄，第 417–419 行）：

```latex
\begin{proposition}\label{prop:no-defect}
An attained positive maximum as in \eqref{eq:maximal} is impossible.
\end{proposition}
```

(b) 机制逐步推演（证明第 420–450 行）：
1. 由 Lemma 5.2：$A,B\le\epsilon$。对原构型用 Lemma 5.1（$B\le\epsilon$ 枝：$\epsilon/p\le K\le1-B$ ⟹ $\epsilon\le p(1-B)=dA(1-B)$）；对逆构型用同一引理（其 $B'=A\le\epsilon$ 枝给 $\epsilon\le d B(1-A)$）。eq:small（第 422–424 行）：
```latex
\epsilon\le dA(1-B),\qquad \epsilon\le dB(1-A).
```
- Lean：`small_secant_product`（ChordSecant.lean:256）+ `alignedConfiguration_impossible` 里对 `C.inverse` 的同调用（ChordContradiction.lean:22–27，注意 `hb.symm` 传逆界）。
2. $\min\{A(1-B),B(1-A)\}<1/4$（第 425 行）：设 $A\le B$，则 $A(1-B)\le A(1-A)$（因 $B\ge A$）；又 $A+B<1$ ⟹ $A<1/2$ ⟹ $A(1-A)<1/4$。另一侧对称。⟹ 较小的 $\epsilon$ 界 $<d/4\le2/4=1/2$（$d\le2$）⟹ $\epsilon<1/2$ ⟹ $t=1-\epsilon>1/2$。
3. 比例推论（eq:ratios，第 426–429 行）：$\epsilon<1/2$、$A\le\epsilon<t$ ⟹ $p/d\le1-t<t$ ⟹ ……论文给
```latex
\frac p t<\frac r\epsilon,\qquad
\frac s t\ge\frac u\epsilon.
```
第一式来源：$p=t\cdot(p/t)$……重构：$A\le\epsilon=1-t$ ⟹ $p\le d\epsilon$；又需 $p/t<r/\epsilon$ ⟺ $\epsilon p<rt$。用 $p\le d\epsilon$ ⟹ $\epsilon p\le\epsilon^2 d$；$r\ge d\epsilon$?（$d=p+r\le2\epsilon d+…$，实际 $r=d-p\ge d(1-A)\ge d(1-\epsilon)$，$1-\epsilon=t$ ⟹ $r\ge dt$ ⟹ $rt\ge dt^2$；比较 $\epsilon^2 d$ 与 $dt^2$：$\epsilon<1/2<t$ ⟹ $\epsilon^2<t^2$ ✓）。第二式：$s/t\ge u/\epsilon$ ⟺ $\epsilon s\ge tu$；$B\le\epsilon$ ⟹ $u\le d\epsilon$ ⟹ $tu\le td\epsilon$；$s=d-u\ge d(1-B)\ge d\epsilon$??（$1-B\ge1-\epsilon=t$ ⟹ $s\ge dt$）⟹ $\epsilon s\ge dt\epsilon\ge tu$ ✓（用 $t\le1$）。Lean：`smallChord_coefficients`（SmallChord.lean:45，两个比例式连同前提 $A,B\le\epsilon,\epsilon<1/2$ 一起证）。
4. 凸函数 setup（第 431–439 行）：$F(\lambda)=\|y+\lambda v\|$，$G(\lambda)=\|b+\lambda w\|$（$\lambda\ge0$，凸）。单位性给出：$F(0)=\|y\|=1$；$F(p/t)=\|y+(p/t)v\|=\|(ty+pv)/t\|=1/t$（$x\in S_X$）；同理 $G(0)=1$、$G(s/t)=1/t$（$f(x)\in S_Y$）。
5. 凸函数 secant 斜率单调：$\lambda\mapsto(F(\lambda)-F(0))/\lambda$ 在 $\lambda>0$ 递增。由 eq:ratios 第一式 $p/t<r/\epsilon$：
$$F(r/\epsilon)\ge1+\frac{r/\epsilon}{p/t}(1/t-1)$$
（"$\ge$"来源：$F(r/\epsilon)\ge F(p/t)$??——不。准确机制：$F(\lambda)\ge1+$（斜率）$\cdot\lambda$ 的凸下包络在 $\lambda\le p/t$ 段由割线控制，在 $\lambda>p/t$ 段由**延长的过 $(0,1)$ 与 $(p/t,F(p/t))$ 的直线并不总在下**——凸函数在两点间在弦下、两点外在延长的弦上：$\lambda>p/t$ 时 $F(\lambda)\ge F(p/t)+\frac{F(p/t)-F(0)}{p/t-0}(\lambda-p/t)$?? 更简单：凸 + $F(0)=1$ ⟹ $\lambda\mapsto(F(\lambda)-1)/\lambda$ 递增；$\lambda_2=r/\epsilon>\lambda_1=p/t$ ⟹ $(F(\lambda_2)-1)/\lambda_2\ge(F(\lambda_1)-1)/\lambda_1=(1/t-1)/(p/t)$ ⟹ $F(r/\epsilon)\ge1+\frac{r/\epsilon}{p/t}(1/t-1)$。正是第 442 行。）且 $>1/t$：$\frac{r/\epsilon}{p/t}>1$（第一比例式）且 $(1/t-1)>0$ ⟹ 严格大于 $F$ 在 $p/t$ 的值 $1+(1/t-1)=1/t$ ✓。
6. 另一侧：$u/\epsilon\le s/t$（第二比例式）且 $u/\epsilon\ge0$ ⟹ 凸函数在 $[0,s/t]$ 内的值 $\le$ 端点弦的最大值：$\lambda\mapsto G(\lambda)$ 在 $[0,s/t]$ 上凸 ⟹ $G(\lambda)\le\max\{G(0),G(s/t)\}=1/t$（凸函数在有界区间内部值不超过端点最大值）。⟹ $G(u/\epsilon)\le1/t$（第 444 行"$u/\epsilon\in[0,s/t]$，so convexity gives $G(u/\epsilon)\le1/t$"）。
7. 等距夹逼（第 445–449 行）：$y-z=y-(ty-rv)=(1-t)y+rv=\epsilon(y+(r/\epsilon)v)$ ⟹ $\|y-z\|=\epsilon F(r/\epsilon)$；$b-f(z)=(1-t)b+uw=\epsilon(b+(u/\epsilon)w)$ ⟹ $\|b-f(z)\|=\epsilon G(u/\epsilon)$；等距 $\|y-z\|=\|f(y)-f(z)\|=\|b-f(z)\|$。⟹ $\epsilon F(r/\epsilon)=\epsilon G(u/\epsilon)$，但第 5 步 $F(r/\epsilon)>1/t\ge G(u/\epsilon)$——矛盾。□
- Lean：SmallChord.lean 把第 2–7 步参数化为纯标量+范数引理 `smallChord_contradiction`（:134），其假设表逐项对应：`ht.2`（$t<1$）、`C.p_pos…`、`rfl`（$A=p/d$ 定义展开）、`chord_sum`、`chord_le_two`（$d\le2$）、`A_add_B_lt_one`、`hA hB`（$A,B\le\epsilon$）、`heA heB`（eq:small 双向）、`y.property (f y).property`（$\|y\|=\|b\|=1$）、`hx hfx`（$\|ty+pv\|=\|tb+sw\|=1$——对应 $F(p/t)=G(s/t)=1/t$ 的原型等式，注意 Lean 用未除形式 `‖t • y + p • v‖ = 1`）、`hiso`（$\|\epsilon y+rv\|=\|\epsilon b+uw\|$，即第 7 步等距的显式形态，由 `sphere_norm_sub f y C.z` 提供，ChordContradiction.lean:41–44）。`smallChord_epsilon_lt_half`（:21）= 第 2 步；凸性 secant 单调用 Mathlib `ConvexOn` 引理内部化（该文件 import `RCLike.Real`，凸组合账目用 `Mathlib.Tactic.Module`）。

(c) 假设与常数的机械性理由：
- $d\le2$（来自 $\|x-z\|\le\|x\|+\|z\|=2$）：$\epsilon<1/2$ 的定量来源；若允许 $d>2$ 则 $d/4>1/2$、第 3 步比例推论断。
- $A,B\le\epsilon$（Lemma 5.2 的输出）：用在第 3 步 $A\le\epsilon<t$（需 $\epsilon<1/2$）与 $1-B\ge t$；两处分别喂两条比例式。
- $M>0$ 全链：$A+B<1$、$\epsilon/p\le K$ 分枝非退化、$h$ 非退化；$M=0$ 时命题真空成立。
- 凸函数只需 $\lambda\ge0$：$v,y$ 的同向半线；负 $\lambda$ 段的 secant 单调性不需要（且 $F$ 在 $\R$ 上凸但 setup 全在非负轴）。
- $F(p/t)=G(s/t)=1/t$ 用 $x,f(x)$ 双双在球面：若只有 $X$ 侧单位性，$F$ 侧下界与 $G$ 侧上界失配（比较的两端各需一个锚点），等距性提供第三个锚 $\epsilon F(r/\epsilon)=\epsilon G(u/\epsilon)$——三条信息恰好锁定矛盾，少一条即松。
- $f$ 是**等距**而非仅保范：第 7 步 $\|y-z\|=\|f(y)-f(z)\|$ 是两点距离，非范数保持；这是"球面度量传进跨半径几何"的唯一一次直接出手，前面全靠 $M$ 中介。

(d) `[推测]` 候选失败路线：
1. `[推测]` 若不用凸性而用平行四边形恒等式（Hilbert 空间风格）：一般 Banach 空间无平行四边形律；中位线估计（Jordan–von Neumann 型偏差）在一般空间无界——凸性论证（secant 单调）是范数凸函数的普适性质，恰好吃满"无附加几何假设"。
2. `[推测]` 第 6 步若误用"凸 ⟹ $G(u/\epsilon)\le$ 弦值"于 $u/\epsilon>s/t$ 情形：比例式第二向（$\ge$）选错了分枝就没有上界——两条比例式**异向**（$<$ 与 $\ge$）是精心选择：$F$ 侧要"越过 $1/t$"故需自变量超出 $p/t$，$G$ 侧要"不越过 $1/t$"故需自变量落在 $[0,s/t]$ 内。若 $u/\epsilon$ 也超出 $s/t$ 则两侧都只给下界，比较失效。这说明 $h$ 在 secant 引理中取 min、这里取 max 结构的互补性是设计约束。
3. `[推测]` $\epsilon F=\epsilon G$ 若改为不等式（$f$ 只保序距离单侧）：等号是把 $F,G$ 两族数值钉死的唯一通道；缺陷界只能给 $\pm M$ 级松弛，而 $F(r/\epsilon)-G(u/\epsilon)$ 的超出量 $\frac{r/\epsilon}{p/t}(1/t-1)$ 无 $M$ 的显式下界保障（它只依赖 $r\epsilon^{-1}>p t^{-1}$ 的严格差），松弛一加入，严格不等号可能淹没。

## 2.9 主定理证明（§6；thm:main 的证明体）

(a) 精确陈述：见 1.2；证明第 454–475 行全文重构如下。

(b) 机制逐步推演：
1. $M=0$（第 455 行）："If the defect of the original sphere map were positive, Lemma 3.1 and Proposition 5.3 would contradict one another. Thus $M=0$."——逻辑链：原 $f$ 若 $M>0$ ⟹ 新空间上有 attained 正最大配置（界随构型带过去）⟹ Prop 5.3 否定 ⟹ $M=0$。注意用到的不仅是 $D_q$ 在新空间取到，还要**原空间**的 $M$ 与新空间的 $M$ 同一（缺陷在超滤商里精确传递，第 192–194 行），否则原 $M>0$ 与新配置矛盾无涉。
2. $T$ 保跨半径距离（第 455–461 行）：$a=\alpha x,c=\beta y$，$x,y$ 单位、$\alpha\ge\beta>0$，$q=\beta/\alpha\in[0,1]$：
$$\|T(a)-T(c)\|=\alpha\|f(x)-qf(y)\|=\alpha\|x-qy\|=\|a-c\|,$$
第一、三等号是提因子；中等号是 $M=0$（$D_q=0$ 对所有 $q,x,y$）。交换处理 $\beta>\alpha$；涉及 0 的距离 $\|T(a)-T(0)\|=\|\alpha f(x)\|=\alpha=\|a-0\|$ 由保范。满：$b\in Y\setminus0$，$f$ 满取 $y$ 使 $f(y)=b/\|b\|$，则 $T(\|b\|y)=b$。
3. Mazur–Ulam 仿射步（第 463–472 行，自足证明，Nica 反射表述，credits V\"ais\"al\"a–Vogt）：设 $F:E\to F_0$ 满等距，$a,c\in E$，$m=(a+c)/2$、$m'=(F(a)+F(c))/2$、$\delta=\|F(m)-m'\|$。
   - 界：$\delta\le\|a-c\|/2$（$\|F(m)-m'\|\le\frac12(\|F(m)-F(a)\|+\|F(m)-F(c)\|)=\frac12(\|m-a\|+\|m-c\|)=\|a-c\|/2$）。
   - 反射 $R(z)=2m'-z$ 是 $F_0$ 的满等距；共轭 $H=F^{-1}RF$ 是 $E$ 的满自等距，交换 $a,c$（$H(a)=F^{-1}(2m'-F(a))=F^{-1}(F(c))=c$），且 $H$ 的中点缺陷 $=\|H(m)-m\|=\|RF(m)-F(m)\|=2\delta$（$R$ 是点反射，位移翻倍）。
   - 迭代：对 $H$ 再施同一构造（$H$ 仍满等距、仍交换 $a,c$、中点仍 $m$），第 $n$ 次缺陷 $2^n\delta$，但统一被 $\|a-c\|/2$ 界住 ⟹ $\delta=0$。⟹ 满等距保中点。
4. 线性化（第 474 行）：$T$ 满等距 + $T(0)=0$ ⟹ 保中点 ⟹ $T(2a)=2T(a)$（取 $m=a$？——取 $a,c$ 中 $c=0$：$T(a/2)=T(a)/2$ ⟹ $T(2a)=2T(a)$）；$T(a+c)=2T((a+c)/2)=2\cdot\frac{T(a)+T(c)}2=T(a)+T(c)$；有理齐次由加法；实齐次由连续性（$T$ 等距故连续，$\|T(qx)-T(ax)\|=|q-a|\|x\|$）；唯一性："a linear extension is determined on every nonzero vector by its norm and its unit direction"（$x=\|x\|\cdot x/\|x\|$，线性延拓必送 $\|x\|f(x/\|x\|)$）。□
- Lean：RadialExtension.lean。$M=0$ 供给 = `hasDefectBound_zero`（Extension.lean:53）；`radialExtension`（:27，if-then-0 定义）、`radialExtension_of_ne_zero`（:35）、`scaled_norm_sub_eq`（:79，第 2 步的提因子等式链）、`radialExtension_norm_sub`（:101，全对保距含 0 与序两分支）、`radialExtension_isometry`（:125）、`radialExtension_surjective`（:132）、`radialIsometryEquiv`（:143，`Equiv.ofBijective` 组装）；**仿射步不在 OAI 内重证**：`radialLinearIsometryEquiv := (radialIsometryEquiv…).toRealLinearIsometryEquivOfMapZero`（:157–161），调用 Mathlib `Mathlib.Analysis.Normed.Affine.MazurUlam`（该文件 :3 import）；唯一性 `linear_extension_eq_radial`（:176）、`existsUnique_linearIsometryEquiv_of_zero_defect`（:199）。
- **论文/形式化实质差异**：论文 §6 自带 Nica 反射证明（约 10 行），Lean 直接引 Mathlib 的 Mazur–Ulam（其 Mathlib 证明内部机制与反射论证同源，但形式化里是现成定理）。比较器 JSON 因此把 Mazur–Ulam 视为"已允许的经典工具"。`signedDefect_eq_zero_of_bound_zero`（Basic.lean:167）是 $M=0\Rightarrow D_q\equiv0$ 的桥。

(c) 假设与常数的机械性理由：
- 满射（第 2 步"Surjective $T$"与第 3 步 onto）：Mazur–Ulam 反射迭代要求每步共轭仍是**满**自等距（$H=F^{-1}RF$ 的 $F^{-1}$ 与 $R$ 都满）；单射等距无反射迭代。球面 $f$ 满 ⟹ $T$ 满 ⟹ 可用。
- $T(0)=0$：Mazur–Ulam 结论是"等距 + 一点映 0 ⟹ 线性"；$T(0)=0$ 由定义。
- $X,Y$ Banach：本步不消费完备性（Mazur–Ulam 只需赋范）；完备性在前面（Darbo）消费——所以论文标题假设恰是 Banach 而各步只用所需片段，无冗余。"nonzero"：$S_X\ne\emptyset$ 否则 $f$ 无从定义；Lean 用 `[Nontrivial X]`（Extension.lean:37）——非零实赋范空间 ⟺ 非平凡，等价。
- 实线性 vs 复线性的边界声明（第 59 行）在 Lean 表现为 `≃ₗᵢ[ℝ]`（`radialLinearIsometryEquiv` 返回类型），从不出现 ℂ。

(d) `[推测]` 候选失败路线：
1. `[推测]` 直接证 $T$ 加法（跳过中点）：需要 $T(a)+T(c)=T(a+c)$ 三点关系，球面数据只控两点距离；中点是"两点等距 ⟹ 定位"的最小可迭代对象——V\"ais\"al\"a–Vogt 选择中点缺陷正因它在反射下精确翻倍（线性放大矛盾）。
2. `[推测]` 若 $M=0$ 只对 $q\in[0,1)$ 成立（少 $q=1$）：$q=1$ 处本来就 $D_1=0$ 免费；但若缺陷域少 $q=0$：$T$ 保范（$\|T(a)\|=\|a\|$）来自 $q=0$！eq: 第 2 步中 $a$ 与 $0$ 的距离即 $\alpha\|f(x)-0\cdot f(y)\|=\alpha$。$q=0$ 是保范的锚。
3. `[推测]` 用 Tzafriri/Wittstock 型算子空间延拓替代 Mazur–Ulam：需要 Hilbert 结构或线性前提，循环（$T$ 的线性正是要证的）。
## 2.10 附录：不动点组件（§A；lem:chi、lem:simplex、lem:compactfixed、thm:condensing 证明）

前置声明（第 480 行，原文）：

> We prove Theorem~\ref{thm:condensing}, including the compact convex fixed-point theorem it uses. The measure-of-noncompactness argument is the classical mechanism of Darbo \cite{Darbo1955}; the compact case is the Schauder fixed-point theorem \cite{Schauder1930}, obtained below from the simplex argument using Sperner's labeling lemma \cite{Sperner1928}.

### 2.10.1 Lemma A.1（$\chi$ 的性质；lem:chi）

(a) 精确陈述（第 482–489 行）：

```latex
\begin{lemma}\label{lem:chi}
For every bounded nonempty set $H$ in a normed space,
\[
\chi(\overline H)=\chi(H),\qquad
\chi(\clco H)=\chi(H).
\]
If $C_n$ are nonempty closed bounded subsets of a Banach space with $C_{n+1}\subset C_n$ and $\chi(C_n)\to0$, then their intersection is nonempty and compact.
\end{lemma}
```

(b) 机制（第 490–499 行）：
1. $\chi(\cl H)=\chi(H)$：有限直径覆盖的每块取闭包，直径不变、仍覆盖 $\cl H$；反向由单调（$H\subset\cl H$）。
2. $\chi(\clco H)=\chi(H)$ 的正方向是核心计算：给 $H$ 的 $\delta$-直径有限覆盖 $H_1,\dots,H_N$，$R$ 界住 $\|z\|$。
   - 每块凸包直径 $\le\delta$："expand their difference using products of their coefficients"——两组凸组合 $\sum\lambda_iz_i-\sum\mu_jz_j'$ 添项减项 $\sum_i(\lambda_i-\mu_i)z_i$ 型展开，用 $\sum_{i,j}\lambda_i\mu_j\|z_i-z_j'\|\le\delta$（同块内点对距离 $\le\delta$）。
   - 系数单纯形按 $\ell_1$-直径 $\le\eta$ 分成有限块；同块混合 $\sum\lambda_iz_i,\sum\mu_iz_i'$（$z_i\in\co H_i$）差 $\le\delta+R\eta$（一块系数给一组 $z_i$，另一组系数配同一组 $z_i$ 差 $\le\delta$，剩下系数差 $\times R$）。⟹ $\chi(\co H)\le\delta+R\eta$，$\eta\downarrow0$、$\delta\to\chi(H)$。
   - 闭包恒等式 + 单调给反向。
3. 嵌套引理：取 $x_n\in C_n$；对每 $k$，足够晚的 $C_n$ 有 $<2^{-k}$ 直径有限覆盖 ⟹ 存在无穷子序列落在某一块；对角线抽取 ⟹ Cauchy 子列，极限在每 $C_n$（嵌套 + 闭 + 完备）。交本身：$\chi(\bigcap C_n)\le\chi(C_k)\to0$ ⟹ $\chi=0$ ⟹ 完全有界 + 闭 ⟹ 紧。
- Lean：KuratowskiBasic.lean `chi_closure`（:124，另有 `FiniteDiameterCover.closure` :60）；KuratowskiConvexHull.lean `dist_weighted_mixtures_le`（:25，$\delta+R\eta$ 计算本体）、`finiteDiameterCover_convexHull_of_norm_le`（:61）、`chi_convexHull`（:125）、`chi_closedConvexHull`（:143）；分箱辅助 CoefficientBins.lean `exists_coefficient_bins`（:52，单纯形 $\ell_1$ 分割）与 ConvexCoverRegroup.lean `convexHull_cover_representation`（:60，"每点可写成按块分组的混合"）；ConvexDiameter.lean `DiameterLE.convexHull`（:16）；KuratowskiNested.lean `nonempty_isCompact_iInter_of_finiteDiameterCover`（:30）、`nonempty_isCompact_iInter_of_chi_tendsto_zero`（:80）；KuratowskiTotalBounded.lean `totallyBounded_iff_finiteDiameterCover`（:30）、`chi_eq_zero_iff_totallyBounded`（:73）。

(c) 机械性：$R$ 有界性来自 $H$ bounded（Lean `Bornology.IsBounded`）；$\eta\downarrow0$ 合法因分割对任意 $\eta$ 存在（单纯形紧 + 一致连续，或直接网格）；嵌套引理的完备性只在"Cauchy 子列收敛且极限属于各 $C_n$"处消费（Lean `KuratowskiNested` 所在空间 `[CompleteSpace]`）。

(d) `[推测]`：1. 若用"有限 $\epsilon$-网"定义的 Hausdorff 测度 $\beta$：$\beta(\co H)\le\beta(H)$ 在一般度量空间**不成立**（闭凸包保持 $\beta$ 需 Banach 的 Minkowski 引理 $\beta(\co H)\le 2\beta(H)$ 型不等式，带常数损失），Kuratowski 直径版本恰好无损——这是选 $\chi$ 的硬理由。2. 嵌套引理若不用对角线而直接 Cantor 交集：需完备 + 闭 + $\operatorname{diam}\to0$，但 $\chi\to0$ 不给单块直径趋 0，只给有限覆盖——对角线是必需的。3. 省略 $R\eta$ 项（误以为凸包不涨直径）：混合不同块的系数扰动确实涨直径，反例是两点集的凸包（线段长度可远超点集直径 0——$\chi$ 不变但分块覆盖的块内直径 0 的凸包是 0 直径…实际错误在"$\co H$ 的点用同一块 $z_i$"必须论证系数分组，跳过即漏）。

### 2.10.2 Lemma A.2（单纯形自映射不动点；lem:simplex）

(a) 精确陈述（第 502–504 行）：

```latex
\begin{lemma}\label{lem:simplex}
Every continuous self-map of a finite-dimensional probability simplex has a fixed point.
\end{lemma}
```

(b) 机制（第 505–515 行）：
1. 三角剖分 + 标号：顶点 $a$ 标一个满足 $a_i>0$ 且 $a_i\ge P(a)_i$ 的 $i$。存在性："otherwise summing over the positive coordinates of $a$ would give $1<\sum_iP(a)_i=1$"：若所有 $a_i>0$ 的坐标都有 $a_i<P(a)_i$，求和 $1=\sum_{a_i>0}a_i<\sum_iP(a)_i=1$。
2. 边界条件：顶点的标号属于包含它的每个原面的顶点标号集（面缺失坐标 $i_0$ ⟹ $a_{i_0}=0$ ⟹ 标号 $\ne i_0$）。
3. Sperner 奇偶计数（原文含证明，第 510 行）：模 2 数"小 $m$-单纯形 $\times$ 标号 $0,\dots,m-1$ 的 $(m-1)$-面"的入射对。内部 $(m-1)$-面被两个 $m$-面共享 ⟹ 计 2 次（≡0）；边界好面只能落在缺失标号 $m$ 的原面内，其数为奇（对 $m-1$ 维归纳，基例 0 维单点）。全标号小形贡献 1 个入射、含重复的"准全标号"形贡献 2、其余 0 ⟹ 全标号形个数 ≡ 奇 ⟹ 至少一个。
4. 网格细化的存在（第 512 行）："subdivide faces first and cone their subdivisions to the barycenter"——重心细分；嵌套面 $k\le l$ 顶点的重心差 $\le(1-k/l)\times$ 原直径 ⟹ $m\ge1$ 维每层直径缩 $m/(m+1)$ 因子，迭代 ⟹ mesh $\to0$。（这正是 barycentric subdivision 的网格界。）
5. 极限论证（第 514 行）：每层取全标号小形，其 $m+1$ 个顶点在 mesh $\to0$ 下聚于一点 $a$；标号不等式 $a_i\ge P(a)_i$ 逐坐标传极限，求和后总和相等 ⟹ 逐坐标相等 ⟹ $a=P(a)$。
- Lean：这是全形式化最大的独立板块（Sperner/FiniteComplex/Barycentric 系列 20 个文件、约 2900 行）。链条：FiniteComplex.lean（`FiniteComplex`、`chain`、`sd` 重心细分算子 :52、`topCells`、`CardBound`、`Pure` :89–92）；SubdivisionData.lean（`CarrierComplex` :11、`initial` :29、`iterData` :36、`IterVertex` :40）；BarycentricMesh.lean（网格界 `norm_finiteBarycenter_sub_le_mesh` :143、`..._of_comparable` :143 前的 :—，对应 $(1-k/l)$ 引理 `norm_finiteBarycenter_sub_le_of_comparable`）；SpernerFacet/SpernerIncidence/SpernerBoundary（奇偶计数：`spernerGoodFacets_card_mod_two` SpernerFacet.lean:201、`sperner_count_mod_two` SpernerIncidence.lean:38、`sperner_odd_of_boundary_odd` :88、边界归纳 `good_boundary_family_card` SpernerBoundary.lean:211）；Sperner.lean `iterated_sperner_odd`（:20，对 `iterData` 的 $k$ 重细分断言全标号形奇数）、`iterated_sperner_exists`（:91）；SimplexLimit.lean `probabilitySimplex_fixedPoint_of_shrinking_family`（:63，第 5 步极限）；SimplexFixedPoint.lean `continuous_fin_probabilitySimplex_fixedPoint`（:25）、`continuous_probabilitySimplex_fixedPoint`（:83，Lemma A.2 本体）。ProbabilitySimplex.lean 提供 `ProbabilitySimplex ι` subtype、紧性实例（:42）与 `exists_positive_dominating_coordinate`（:99，第 1 步标号存在性）。

(c) 机械性：标号规则 $a_i\ge P(a)_i$ 只在 $a_i>0$ 坐标中挑——保证边界条件（缺失坐标不标）；极限步要 $P$ 连续；"全标号 ⟹ 每坐标方向的不等式"需要小形的第 $i$ 号顶点恰标 $i$（全标号 ⟹ 存在这样的顶点），故必须**每层**取全标号形。

(d) `[推测]`：1. 直接引 Mathlib Brouwer 不动点（`Metric.brouwerFixPoint`/`isCompact_convex` 版）：Mathlib 确有现成定理，本形式化仍自建 Sperner 链（可能因 comparator 要求"solution module 自足"或路径依赖），论文亦自足——两条路线数学等价。2. 用 Knaster–Tarski/序不动点：离散格条件不满足连续映射。3. 省略 mesh 收缩率证明（第 4 步）：细分族不趋于 0 则极限形退化，顶点不再共点。

### 2.10.3 Lemma A.3（紧凸 Schauder；lem:compactfixed）

(a) 精确陈述（第 517–519 行）：

```latex
\begin{lemma}\label{lem:compactfixed}
Every continuous self-map $g$ of a nonempty compact convex subset $K$ of a normed space has a fixed point.
\end{lemma}
```

(b) 机制（第 520–533 行）：
1. 有限严格 $\delta$-网 $P_1,\dots,P_N\subset K$（紧 ⟹ 存在；"strict"指网心在 $K$ 内）。
2. 近似映射系数：$\lambda_i(x)=\frac{\max\{\delta-\|P_i-g(x)\|,0\}}{\sum_j\max\{\delta-\|P_j-g(x)\|,0\}}$。分母正：某 $P_{i_0}$ 距 $g(x)$ 近——$g(x)\in K$、网覆盖 $K$ 的 $\delta$-邻域 ⟹ 存在 $\|P_j-g(x)\|<\delta$。连续、非负、和 1。
3. 单纯形自映射：$(a_i)\mapsto(\lambda_i(\sum_ja_jP_j))$——先由系数取 $K$ 中点 $x=\sum a_jP_j$（凸性），再回系数；连续 ⟹ Lemma A.2 给固定系数向量，其 $x$ 满足
$$\|x-g(x)\|\le\sum_i\lambda_i(x)\|P_i-g(x)\|<\delta,$$
（正权 ⟹ 对应 $\|P_i-g(x)\|<\delta$，加权平均 $<\delta$。）
4. $\delta\downarrow0$（取 $\delta=1/n$）得近似不动点列，$K$ 紧取收敛子列，连续性收尾。
- Lean：CompactApproximation.lean `compactNetWeight/_Total/_Coefficients`（:28–34，即 $\lambda_i$）、`continuous_compactNetCoefficientMap`（:91，第 3 步自映射连续）、`compactNet_sum_sub_lt`（:119，$\|x-g(x)\|<\delta$）、`exists_approximate_fixedPoint_of_isCompact_convex`（:152，第 1–3 步合体）；CompactConvexFixedPoint.lean `exists_fixedPoint_of_isCompact_of_approximate`（:22，第 4 步序列收尾，用 `Topology.Order.Compact` 的列紧）、`exists_fixedPoint_of_isCompact_convex`（:39，Schauder 本体）、`extendSelfMap`（:49，把 $g:K\to K$ 延到全空间以满足 A.2 输入格式——论文未提的胶水，`continuous_compactConvex_fixedPoint` :78）。

(c) 机械性：凸性用在 $x=\sum a_jP_j\in K$（网心凸组合留在 $K$ 内，$\lambda$ 才有资格取 $x$ 处的值）；紧性用在网存在与列收敛；"strict $\delta$-net 网心属于 $K$"保证自映射目标仍在 simplex 参数域内（$P_i\in K$）。

(d) `[推测]`：1. 用 Kahane/Klee 构造性证明：等价但更长。2. 若网心不在 $K$ 内（一般 $\delta$-网），$\sum a_jP_j\notin K$，$g$ 无定义——"strict"非修饰词而是前提。3. 直接逼近论不动点（Aronszajn 反例警示非凸情形）：$K$ 凸不可去。

### 2.10.4 Theorem 4.1 的证明（附录版，第 535–541 行）

(a)/(b) 原文照抄证明：

> Set $C_0=C$ and $C_{n+1}=\clco(g(C_n))$. These are nonempty closed bounded convex subsets of $C$ satisfying $C_{n+1}\subset C_n$. By Lemma~\ref{lem:chi},
> \[
> \chi(C_{n+1})=\chi(g(C_n))\le\gamma\chi(C_n),
> \]
> so their intersection $K$ is nonempty, compact, and convex. If $x\in K$, then $g(x)\in g(C_n)\subset C_{n+1}$ for every $n$, so $g(K)\subset K$. Apply Lemma~\ref{lem:compactfixed}.

机制清点：
- $C_{n+1}\subset C_n$：需 $g(C_n)\subset C_n$（归纳：$C_0=C$、$g(C)\subset C$；$C_n\subset C$ 且 $g(C_n)\subset C_n$??——实际只需 $g(C)\subset C$ 与凸闭包单调：$g(C_n)\subset g(C)\subset C$，且归纳假设 $C_n\subset C_{n-1}$ ⟹ $g(C_n)\subset g(C_{n-1})$?? 不单调除非 $g$ 保序集合包含——$A\subset B\Rightarrow g(A)\subset g(B)$ 恒成立（像的单调性）！故 $C_{n+1}=\clco g(C_n)\subset\clco g(C_{n-1})=C_n$ ✓，起点 $g(C)\subset C$ ✓。）
- $\chi(C_{n+1})=\chi(\clco g(C_n))=\chi(g(C_n))$（Lemma A.1 两连）；压缩假设消费**$H=g(C_n)\subset C$**（全部子集版本在此兑现）。
- $\chi(C_n)\le\gamma^n\chi(C)\to0$；嵌套引理给 $K$ 非空紧凸；$g(K)\subset K$ 由 $g(C_n)\subset C_{n+1}\subset C_m$（$m\le n$）双向夹；Schauder 收尾。
- Lean：CondensingIteration.lean 全程模拟：`condensingSequence`（:31）、`condensingSequence_antitone`（:64）、`..._nonempty/_isClosed/_convex/_isBounded`（:79–103）、`condensingSequence_chi_succ_le`（:132）、`condensingSequence_chi_tendsto_zero`（:162）；与 CondensingFixedPoint.lean:26 的组装在 2.4 已记。

(c) 机械性：见 2.4；补充一条——$g$ 连续性在附录证明中只用于 Schauder（$K$ 上），与主文"回返映射连续"接口吻合。
# 三、叙事时间线（论文自述动机、文献与构造的原话重建）

本章只收录 TeX 原文中实际存在的话；凡属推断一律标 `[推测]`。行号指 main.tex。

## 3.1 问题的提出方式（自述动机）

- 第 49 行（动机句逐字）："Tingley's problem asks whether every surjective isometry $f:S_X\to S_Y$ extends to a real-linear isometry of the spaces \cite{Tingley1987}. Any such extension must be the radial map below. This candidate preserves norms and distances at each fixed radius; the difficulty is to recover distances between points at different radii from the metric on a single sphere. We prove the full assertion."
  - 叙事要点：论文把困难定位为"**跨半径距离不可见**"——球面度量只给 $\|x-y\|$（同半径），而线性延拓需要 $\|x-qy\|$（异半径）。全文所有机器（缺陷 $D_q$、径向切点、弦对齐）都是围绕这句话设计的。
- 摘要（第 44 行）给出的三段式路线："If distances between different radii are not preserved, we realize the positive maximal defect in a possibly enlarged pair of Banach spaces. We then align extremal chords using common supports and Darbo's fixed-point theorem and obtain a contradiction from support and convexity estimates."——"possibly enlarged"三字承认了新空间（超滤商 + 完备化）的出现是手段而非对象。
- 第 59 行范围句："The spaces may have arbitrary dimension and need not be separable, reflexive, smooth, or strictly convex. Applied to complex Banach spaces regarded as real spaces, the conclusion is real linearity; complex linearity is not asserted."

## 3.2 文献脉络（论文原文逐条）

以下按论文叙述顺序逐条列出，每条先给原文短句，再给文献精确出处（references.tex）。

1. 第 61–66 行："The problem belongs to the extension theory of metric isometries. Mazur and Ulam proved that every surjective isometry between real normed spaces is affine \cite{MazurUlam1932}; Mankiewicz obtained an extension theorem for surjective isometries between convex sets with nonempty interiors \cite{Mankiewicz1972}. A unit sphere has empty ambient interior, so this does not directly provide the desired extension."
   - Mazur–Ulam 1932（CRAS 194, 946–948）；Mankiewicz 1972（Bull. Acad. Polon. Sci. 20, 367–371）。论文的"障碍句"——球面无内点——是它自述的立项理由。
2. 第 66–69 行："Tingley's original paper established preservation of antipodal points for surjective isometries between finite-dimensional Banach-space spheres \cite{Tingley1987}."（Tingley, Geometriae Dedicata 22 (1987), 371–378。）
3. 第 71–75 行："Early positive results used the structure of concrete spaces. Wang treated surjective isometries between spheres of complex $C_0$-spaces \cite{Wang1994}, and Ding obtained extension results for $\ell^p(\Gamma)$-type sequence spaces with $p>1$, $p\ne2$ \cite{Ding2003}."（Wang 1994, Acta Math. Scientia 14, 82–89；Ding 2003, Sci. China A 46, 333–338。）
4. 第 76–82 行："It is useful to distinguish results for specified source and target classes from the \emph{Mazur--Ulam property}: every surjective sphere isometry from the given space to an arbitrary real Banach target extends linearly. Cheng and Dong formulated this property explicitly \cite{ChengDong2011}. Tan proved it for real $L^p(\mu)$ on $\sigma$-finite measure spaces when $1<p<\infty$, $p\ne2$ \cite{Tan2012Lp}."（Cheng–Dong 2011, JMAA 377, 464–470；Tan 2012, Acta Math. Sinica Engl. Ser. 28, 1197–1208。）
5. 第 84–89 行："Facial geometry provides another route. Following work of Cheng and Dong \cite{ChengDong2011}, Tanaka proved that surjective sphere isometries preserve maximal convex subsets of the sphere \cite[Lemma~3.5]{Tanaka2014}."（Tanaka 2014, Bull. Aust. Math. Soc. 90, 304–310。）
6. 第 87–92 行："The operator-algebra program led to extension theorems between arbitrary complex von Neumann algebras, due to Fern\'andez-Polo and Peralta \cite{FernandezPoloPeralta2018VN}, and between their preduals, due to Mori \cite{Mori2018}. Mori and Ozawa subsequently proved the arbitrary-target Mazur--Ulam property for unital complex $C^*$-algebras viewed as real spaces, and for real von Neumann algebras \cite{MoriOzawa2020}."（Fernández-Polo–Peralta 2018, JMAA 466, 127–143；Mori 2018, JMAA 466, 1281–1298；Mori–Ozawa 2020, Studia Math. 250, 265–281。）
7. 第 93–95 行（自我定位，重要）："Our common-support propagation has a geometric affinity with facial methods; the invariant set and its return-map estimate are constructed directly below."——论文自认与面方法（facial）有"geometric affinity"，但声明自己的不变集与回返映射估计是**直接构造**，不走面结构机器。
8. 第 97–98 行："In finite dimensions, Banakh proved the Mazur--Ulam property for every two-dimensional real Banach space \cite{Banakh2022}."（Banakh 2022, Linear Algebra Appl. 632, 268–280。）
9. 第 99–107 行："Other recent results concern specific spaces or sphere self-isometries: Fakhoury proved extension results for sphere self-isometries of Schreier spaces and their $p$-convexifications \cite{Fakhoury2025}. Huang and Zhu proved class-to-class extension theorems for Haagerup noncommutative $L_p$-spaces with $1<p<\infty$, $p\ne2$, associated with arbitrary von Neumann algebras \cite{HuangZhu2026Haagerup}, and Schatten $p$-classes for $0<p<\infty$, $p\ne2$, including quasi-Banach cases \cite{HuangZhu2026Schatten}."（Fakhoury 2025, JFA 289, 111122；Huang–Zhu 2026, arXiv:2608.30131 与 arXiv:2607.11244。）
10. 附录定位（第 480 行）："The measure-of-noncompactness argument is the classical mechanism of Darbo \cite{Darbo1955}; the compact case is the Schauder fixed-point theorem \cite{Schauder1930}, obtained below from the simplex argument using Sperner's labeling lemma \cite{Sperner1928}."
11. §6 定位（第 463 行）："For completeness we prove the affine step of Mazur--Ulam \cite{MazurUlam1932} in the short reflection presentation of Nica \cite{Nica2012}, who explicitly credits V\"ais\"al\"a and Vogt \cite{Vaisala2003,Vogt1973}."（Nica 2012, Expo. Math. 30, 397–398；V\"ais\"al\"a 2003, AMM 110, 633–635；Vogt 1973, Studia Math. 45, 43–48。）
12. 其余经典引用：支撑=Hahn–Banach "the finite-dimensional Hahn--Banach extension argument \cite{Banach1929}"（第 116 行；Studia Math. 1, 211–216）；超滤器="the standard Banach-space ultrapower construction \cite{DacunhaCastelle1972}"（第 162 行；Séminaire Goulaouic–Schwartz 1971–72, exposé 9）；非紧测度="Kuratowski measure of noncompactness \cite{Kuratowski1930}"（第 203 行；Fund. Math. 15, 301–309）。

`[推测]` 叙事策略读法：论文把自己放在"逐类空间攻关 → 任意目标 Mazur–Ulam 性质 → 全类合一"的终点位；对算子代数程序（条 6）显式致敬但划清方法界限（条 7）。论文**没有**提及 2020 年代若干传闻中的预印本竞争者，也没有声称首次解决某子类——时间线上只陈述文献清单本身。论文未述：问题提出年份细节（仅 1987 引文）、任何致谢或资助信息。

## 3.3 构造的自述逐字（作者留下的操作说明）

- 策略段（第 110 行，全引）："The argument measures the largest error in preserving a distance between two radius levels. Its central geometric step turns a hypothetical positive error into two aligned chords. Extremality propagates through common supports, producing an invariant closed convex set of directions. On this set an opposite-endpoint return map contracts the Kuratowski measure of noncompactness. Darbo's fixed-point theorem then supplies an aligned direction. The proof-specific work is the construction of this invariant set and the quantitative return-map estimate, followed by the chord contradiction; the supporting-functional, ultrapower, fixed-point and affine-extension tools are classical."
  - 这段是全篇的"作者注"：明确区分自造的三件（不变集、回返映射定量估计、弦矛盾）与借用的四件（支撑泛函、超滤器、不动点、仿射延拓）。
- 回返映射的口头描述（第 234 行，全引）："Starting from a direction at $ty$, we map its sphere contact to $S_Y$ and take the opposite sphere contact on the line through $tb$. Pull this opposite endpoint back to $S_X$, and reverse its direction from $ty$. A fixed direction for this return map will align the two chords."
- 分枝预告（第 327 行，全引）："We first derive a secant estimate from the defect bound. If either $A$ or $B$ exceeds $\epsilon$, this estimate leads to a radial perturbation that increases the maximal defect. In the remaining case, convexity gives incompatible bounds for the preserved distance from $y$ to $z$."
- 守恒声明（第 199 行，全引）："It therefore suffices to rule out the attained configuration \eqref{eq:maximal}, which we retain throughout the next two sections."
- 图注（第 315 行，全引）："The aligned chords of Proposition~\ref{prop:alignment}. Each segment is drawn along its own unit direction. The inner points are $ty$ and $tb$; the endpoints lie on the respective unit spheres. The diagram records lengths only, with $p+r=s+u$ and $r-u=s-p=M$."
- 唯一性口径（第 56 行）："It is the unique linear extension of $f$."；第 474 行展开："a linear extension is determined on every nonzero vector by its norm and its unit direction, proving uniqueness."

`[推测]` 时间线意义上的写作顺序猜测（非论文事实）：Lemma 3.1 的"we give the construction and verify its sphere-map and defect properties directly"与附录"we include its elementary proof"等句显示作者刻意把预印本写成自足文本（不依赖任何未证经典定理），这与 Lean 形式化大量重证 Mathlib 已有工具（Schauder、Mazur–Ulam 之外全部自建）相反——两者读者假设不同：论文面向数学家要求"可检查"，形式化面向机器要求"最小 axiom 面"（仅 propext/Quot.sound/Classical.choice）。
# 四、Lean 取证

## 4.1 登记与配置

- `E:\math\lean\formalization.yaml` 第 132–134 行：条目 `title: "A positive solution to Tingley's problem"`，`authors: ["OpenAI"]`，`type: article`，`id: ../preprints/A-positive-solution-to-Tingleys-problem-September-23-2026/paper.pdf`。
- 同文件第 1598–1600 行（比较器登记三元组）：
  - `comparator_config: ComparatorChallenges/TingleySphereIsometry.json`
  - `declaration: OAI.Tingley.tingley_sphere_isometry_full`
  - `file: OAI/Analysis/SphereIsometry/Extension.lean`
- `E:\math\lean\ComparatorChallenges\TingleySphereIsometry.json`（全文 15 行）：`challenge_module: "ComparatorChallenges.TingleySphereIsometry"`；`solution_module: "OAI.Analysis.SphereIsometry.Main"`；`theorem_names: ["OAI.Tingley.tingley_sphere_isometry_full"]`；`definition_names: []`；`permitted_axioms: ["propext", "Quot.sound", "Classical.choice"]`（标准三公理，无额外公理如 `eth`/`sorryAx`）；`enable_nanoda: false`（不依赖 NaNoda 数值决策）。
  - 机械解读：`definition_names` 为空 ⟹ 比较器只核对主定理语句，不要求把 `UnitSphere`/`SignedDefect` 等定义对齐到挑战模块中的命名；允许公理面恰是 Mathlib 基线，说明全链无集合论强假设（连续统假设、饱和超滤等未被使用——超滤只用到可数集上的 `Filter.hyperfilter`，构造性存在）。

## 4.2 模块清单与行数（`E:\math\lean\OAI\Analysis\SphereIsometry\`，70 文件，共 9273 行）

按功能分组（行数 = wc -l）：

**基座与记号（277 行）**：Model.lean 25（`UnitSphere` abbrev :12、`normalize` :18）；Main.lean 4（纯 import 聚合）；Basic.lean 176（`signedDefect` :50、`HasDefectBound` :54、`absoluteDefects` :57、`maxDefect` :60、Lipschitz/端点/对称界 :83–167）；DiameterBounds.lean 38；ProbabilitySimplex.lean 123。

**支撑与径向（379 行）**：Supports.lean 171（`SupportAt` :24、HB 桥 :73–116、公共支撑 :132–167）；RadialContact.lean 208（存在唯一 :97、界 :137、Lipschitz/连续 :184–200）；PositiveConvexFace.lean 208（`supportFace` :73、凸包入面 :97–141、闭凸极值包 :191）。

**缺陷取到（约 800 行）**：UltraRealLimit.lean 162（`realULim` :70、保运算族 :97–133、`freeUltrafilter := Filter.hyperfilter ℕ` :135）；UltraNormed.lean 217（`boundedSequenceSubmodule` :26、`UltraSequence` :42、`UltraQuotient := SeparationQuotient` :146、`constantEmbedding` :190、`UltraCompletion := UniformSpace.Completion` :205）；UnitRepresentatives.lean 48；UltraSphere.lean 180（`unitClass` :32、`ultraSphereEquiv` :108）；SphereCompletion.lean 215（`sphereCoe` :34、稠 :60、`completedSphereEquiv` :145、界与取等传递 :192–215）；DefectSequence.lean 121（`exists_fixed_radius_defect_sequence` :67——把"逼近 sSup 的三元组序列 + 符号分枝 + 半径固化"全合成一个 `Or` 输出）；DefectAttainment.lean 79（总出口 `positive_maxDefect_attained_or_inverse` :51）。

**对齐（约 1100 行）**：ReturnMap.lean 353（链条八定义 :71–107、环境版 :266–283、连续族 :231–343）；ExtremalPropagation.lean 251（`extremalSphere` :30、闭/非空 :51–77、取等三连与传播 `positive_prefix_extension`）；InvariantConvexSet.lean 164（`recursiveConvexSet` :106、`exists_invariant_closed_convex` :148）；PositiveScheduling.lean 380（稠密调度机器：`stageMixing := 1/(n+2)` :90、`2λ` 界 :153、closure 等式 :350）；AlignmentSet.lean 44（`exists_return_invariant_convex` :21）；ReturnMapEstimate.lean 205（两点估计 :82/:170/:188）；ReturnMapBounds.lean 110（标量放缩与 $\gamma\in$ Ico :12–110）；ScalarBins.lean 46、CoefficientBins.lean 94、ReturnMapNoncompactness.lean 136（`chi_return_image_le` :60）；ReturnMapFixedPoint.lean 51（`exists_fixedPoint_of_return_estimate` :22）；Alignment.lean 107（`aligned_of_return_fixed` :25、`exists_alignedConfiguration` :61）；AlignedConfiguration.lean 234（17 场结构 :23–44、界引理 :46–84、`inverse` :178）。

**弦矛盾（约 900 行）**：ChordSecant.lean 271（$h,\theta,K$ 与 (eq:K) :67–256、`small_secant_product` :256）；RadialPerturbation.lean 126（微扰存在性 :21–126）；LargeChord.lean 177（`largeB_product_bounds` :28、符号锁定 :49–112、`largeB_impossible` :133、`small_ratios` :164）；SmallChord.lean 161（`smallChord_epsilon_lt_half` :21、系数与比例 :45、`smallChord_norm_contradiction` :80、`smallChord_contradiction` :134）；ChordContradiction.lean 52（`alignedConfiguration_impossible` :18）。

**不动点与凸几何（约 2900 行）**：Kuratowski 四件套 134+149+102+131；CondensingIteration.lean 177、CondensingFixedPoint.lean 92、CompactConvexFixedPoint.lean 91、CompactApproximation.lean 192、SimplexFixedPoint.lean 105、SimplexLimit.lean 99；Sperner 系列 107+227+219+102；FiniteComplex.lean 141、SubdivisionData.lean 128 与 Barycentric 系列（Basic 85、Flags 138、Incidence 311、Mesh 163、Points 9、Purity 140、Restriction 153、Support 124、Zero 119）、IteratedPoints.lean 143、IteratedSubdivision.lean 15、SubdivisionIncidence/PointRestriction/Restriction 85+70+125、ConvexCoverRegroup.lean 93、ConvexDiameter.lean 33。

**延拓收尾**：RadialExtension.lean 214（径向映射 :27、保距 :101–132、`radialLinearIsometryEquiv`（调用 Mathlib Mazur–Ulam）:157、唯一性 :176–213）；Extension.lean 120（`no_attained_positive_defect` :27、`maxDefect_eq_zero` :39、`hasDefectBound_zero` :53、`existsUnique_linearIsometryEquiv` :56、`extension` 及 simp 族 :62–86、`sphereIsometryEquiv` :89、`tingley_sphere_isometry` :95、**主定理 `tingley_sphere_isometry_full` :101**）。

## 4.3 依赖拓扑（import 图主干，由 70 个文件头行提取）

```
Model → Basic → {Supports, RadialContact, DefectSequence, SphereCompletion}
Supports → PositiveConvexFace → ExtremalPropagation
RadialContact → ReturnMap → ExtremalPropagation → AlignmentSet
InvariantConvexSet(←PositiveScheduling) → AlignmentSet
ReturnMapEstimate(←ExtremalPropagation) → ReturnMapFixedPoint
  ← ReturnMapNoncompactness(←KuratowskiBasic,ReturnMapBounds,ScalarBins)
  ← CondensingFixedPoint(←CondensingIteration←KuratowskiConvexHull←{KuratowskiBasic,ConvexDiameter,CoefficientBins,ConvexCoverRegroup};
                          ←KuratowskiNested←KuratowskiTotalBounded;
                          ←CompactConvexFixedPoint←CompactApproximation←SimplexFixedPoint←{SimplexLimit,Sperner,IteratedPoints})
AlignmentSet + ReturnMapFixedPoint + AlignedConfiguration → Alignment
AlignedConfiguration + Supports → ChordSecant
ChordSecant + RadialPerturbation → LargeChord；SmallChord（独立标量化）
LargeChord + SmallChord → ChordContradiction
UltraSphere(←UnitRepresentatives,UltraNormed←UltraRealLimit) + DefectSequence + SphereCompletion → DefectAttainment
Basic → RadialExtension
{DefectAttainment, Alignment, ChordContradiction, RadialExtension} → Extension → Main
```
拓扑特征：
- 两条独立"基础设施"支线只在末端合流：Kuratowski/Darbo 线（不动点）与 Sperner/Barycentric 线（单纯形组合学）互不 import，仅在 `CompactConvexFixedPoint` 处衔接；ultraproduct 线（Ultra* + SphereCompletion）只服务 `DefectAttainment`。
- 弦矛盾线（ChordSecant/Large/Small）完全不依赖不动点线——对齐一旦以 `AlignedConfiguration` 结构交付，后续是纯有限维/标量论证。这与论文的模块划分逐层同构（接口对象 = `AlignedConfiguration`、`HasDefectBound`、`signedDefect … = M`）。
- `ChordSecant.lean:3` import `Mathlib.Analysis.Normed.Module.RCLike.Real`、`RadialExtension.lean:3` import `Mathlib.Analysis.Normed.Affine.MazurUlam`——全模块对 Mathlib 分析库的三个重依赖点：Hahn–Banach（`Supports.lean:2` 的 `Mathlib.Analysis.Normed.Module.HahnBanach`）、Mazur–Ulam、RCLike 实数基。

## 4.4 形式化 statement 与论文措辞的差异清单

1. **主定理形状**：论文 Theorem 1.1 说"$T$ 由径向公式定义、是满射实线性等距、是唯一线性延拓"。Lean `tingley_sphere_isometry_full`（Extension.lean:101–109）输出存在式合取：`∃ T : X ≃ₗᵢ[ℝ] Y, (球面上作用 = f) ∧ T 0 = 0 ∧ (∀ x ≠ 0, T x = ‖x‖ • f (normalize x)) ∧ Surjective T ∧ (线性映射层面上的唯一)`。差异：唯一性量化在"所有 `X →ₗ[ℝ] Y` 线性映射"上且只要求球面限制相等（论文"It is the unique linear extension"的精确化）；`T 0 = 0` 从定义句变成结论合取支。
2. **输入形式**：论文假设"$f:S_X\to S_Y$ 是 surjective isometry"；Lean 拆为 `(f : UnitSphere X → UnitSphere Y) (hf : Isometry f) (hs : Function.Surjective f)`，再用 `sphereIsometryEquiv`（:89，`Equiv.ofBijective`）折叠成内部使用的 `≃ᵢ`。`UnitSphere` 是 subtype `{x // ‖x‖=1}`（Model.lean:12），距离继承——与论文"with the distance inherited from X"一致。
3. **完备性显式化**：内部引链在 Extension 层要求 `[CompleteSpace X] [CompleteSpace Y]`（Extension.lean:24–25），对应论文"Banach"；`Alignment.lean:61` 只要求 `CompleteSpace X`（回返映射只在 $X$ 上做不动点）——形式化精确追踪了完备性消费面，论文未明说这点。RadialContact/Supports 层则**不要求**完备（与论文一致）。
4. **非零 vs Nontrivial**：论文"nonzero real Banach spaces"；Lean `[Nontrivial X]`（Extension.lean:37）。对实赋范空间等价；且 `Nontrivial` 才给 `Nonempty (UnitSphere X)`（Basic.lean:41）——论文"nonzero"的同义功能化。
5. **实线性的载体**：`X ≃ₗᵢ[ℝ] Y`（半范线性等距等价）作为对象，比论文"real-linear isometry"多了"等价（可逆）"的结构捆绑；满射性另以 `Function.Surjective T` 重复出现于结论（`≃ₗᵢ` 已含满，这是陈述冗余而非假设差异）。
6. **径向公式**：论文 $T(x)=\|x\|f(x/\|x\|)$；Lean `T x = ‖x‖ • (f (normalize x hx) : Y)`，`normalize x hx = ‖x‖⁻¹ • x`（Model.lean:18）——逐字对应。
7. **缺陷取到引理**：论文 Lemma 3.1 用"there are … spaces, a map, still denoted $f$"（改名重载）；Lean 不重载符号，显式构造 `completedUltraSphereEquiv freeUltrafilter f` 并把结论写成 `HasDefectBound F … ∧ HasDefectBound F.symm … ∧ ∃ t ∈ Ioo 0 1, (正向取等) ∨ (逆向取等)`（DefectAttainment.lean:51–60）。论文"if necessary, replace the map by its inverse"在 Lean 是携带 `Or` 的分支，最终由 `maxDefect_eq_zero`（Extension.lean:48–51）`rcases` 两分枝各撞一次 `no_attained_positive_defect`。
8. **回返映射定义域**：论文在 $S_X$ 上定义 $g$；Lean 双轨——`returnSphere`（subtype 上，ReturnMap.lean:104）用于组合定义，`returnAmbient`（环境 `X → X`，:278）用于 Darbo（`ContinuousOn … C`、`chi (g '' H)` 都在环境陈述）。论文一句"These quantities are continuous in $v$"对应 Lean 12 个连续引理（:231–263, :303–343）。
9. **$\chi$ 压缩的量化**：论文"$(H\subset C)$"简写；Lean `chi_return_image_le`（ReturnMapNoncompactness.lean:60）显式含空集情形（docstring "including the empty subset"），并要求 `Bornology.IsBounded C` 而非"bounded"形容词。
10. **Appendix 的取舍**：论文自证 Mazur–Ulam 仿射步（Nica 反射）；Lean 直接调用 Mathlib `toRealLinearIsometryEquivOfMapZero`（RadialExtension.lean:157–161），反射证明不进形式化——**唯一一处"论文有、Lean 无"的实质论证**（数学结论相同，来源换成 Mathlib 已证定理）。反之 Lean 有而论文无的：`extendSelfMap`（CompactConvexFixedPoint.lean:49，subtype→环境的映射提升胶水）、`UltraSequence` 包装类型（UltraNormed.lean:42，为把拓扑建在半范数上而非子模继承拓扑，docstring 自述理由）、球面完备化的 `sphereCompletionEquiv` 显式等价（论文一句带过）。
11. **超滤器**：论文用 Zorn 引理式存在声明 + "usual set-theoretic framework with choice"；Lean 用具体 `Filter.hyperfilter ℕ`（UltraRealLimit.lean:135）且只需 `Classical.choice` 一类公理——选择公理的使用被压缩到 Mathlib 基线内。
12. **稠密调度**：论文的枚举+混合权重段（第 265–267 行）在 Lean 是 PositiveScheduling.lean 380 行的显式机器（`RationalPrefix` 可枚举 :30、`stageMixing n = 1/(n+2)` :90、`closure_range_stageMean_eq` :350），论文"enumerate all finite rational probability vectors… repeat each arbitrarily late"逐句实现。

## 4.5 "无穷维 Hilbert / 算子理论"核对项（模板要求，如实报告）

本论文与 Hilbert 空间、算子理论**无关**。Mathlib 侧的落点是赋范空间几何而非内积几何：
- 未使用：`InnerProductSpace`、`Unitary`、`SelfAdjoint`、谱定理任何部件（`Mathlib/Analysis/InnerProductSpace/*`、谱测度 `MeasureTheory.specIntegral` 等）——全模块 70 个文件的 import 清单（§4.3 数据源）中无一进入内积空间或算子谱文件。
- 实际使用的 Mathlib 分析面：`NormedAddCommGroup`/`NormedSpace ℝ`（结构）、`Isometry`/`IsometryEquiv ≃ᵢ`（`Mathlib.Topology.MetricSpace.Isometry`，Model.lean:2）、`SeparationQuotient`（半范数商，`Mathlib.Analysis.Normed.Group.SeparationQuotient`）、`UniformSpace.Completion`、`Filter/Ultrafilter`（`Mathlib.Order.Filter.Ultrafilter.Basic`）、Hahn–Banach（`exists_dual_vector''`、`exists_extension_norm_eq`）、Mazur–Ulam（`Mathlib.Analysis.Normed.Affine.MazurUlam`）、凸性基础（`Analysis.Convex.*`：`Convex`、`convexHull`、`stdSimplex`、`Combination`）、紧致/列紧（`Topology.Order.Compact`、`Metric.totalBounded`）、介值（`Topology.Order.IntermediateValue`）。
- 结论：任务模板中"谱测度计算/酉构造/直和分解"等核对项在本论文没有对应物，本笔记在 §二未虚构任何此类内容。若终端需要的是真正"算子直和"问题的素材，应换论文选题；此处素材严格忠于 TeX 原文。

## 4.6 额外或缺失假设的总账

- **Lean 额外（相对论文）**：`Nontrivial` 显式类捆绑；`Bornology.IsBounded` 替代形容词"bounded"；`ContinuousOn`/`MapsTo` 拆分替代"$g:C\to C$ continuous"；空集 $\chi$ 情形显式；ultraproduct 需要**统一**范数界序列（`boundedSequenceSubmodule` 的定义）而论文只说"bounded sequences"（可逐项不同界）——Lean 版本逐点界一致有界，是论文"normalize 每一项再换零项"仍落在商内的保险（UnitRepresentatives.lean 处理代表替换后仍统一有界）。
- **论文额外（相对 Lean）**：无。论文的每个假设都在 Lean 有对应消费点。
- **双方共同**：实标量域、完备性只在所需层出现、满射双向使用（`f.symm` 在 `HasDefectBound.symm`、`zPoint`、`AlignedConfiguration.inverse` 三处）。
# 五、常数与参数账目表

统一说明：下表"出处"给 TeX 行号（main.tex）与编号公式/引理，"Lean"给 `文件:行`。用途栏尽量指到消费该值的具体不等式。

| 对象/常数 | 取值/定义 | 出处（TeX） | Lean | 用途 |
|---|---|---|---|---|
| $S_X$ | $\{x:\|x\|=1\}$，继承度量 | 第 49 行 | Model.lean:12 `UnitSphere` | 全篇舞台 |
| $D_q(x,y)$ | $\|f(x)-qf(y)\|-\|x-qy\|$ | eq:defect（149） | Basic.lean:50 `signedDefect` | 跨半径缺陷度量 |
| $M$ | $\sup_{x,y,q}|D_q|$，$0\le M\le1$ | eq:defect（150）、eq:defectbound（159） | Basic.lean:60 `maxDefect`（sSup）；界 :119–148 | 反证对象 $M>0$；$\gamma<1$、$A+B<1$ 的引擎 |
| $|D_q|\le2\min(q,1-q)$ | Lipschitz + $D_0=D_1=0$ | eq:defectbound（159） | Basic.lean:110 `signedDefect_le_endpoints` | 挤 $t\in[M/2,1-M/2]$；$M\le1$ |
| $D^{f^{-1}}=-D^{f}$ | 双射代入 | eq:inverse-defect（154） | Basic.lean:70,76 `signedDefect_symm`/`HasDefectBound.symm` | 符号朝向归一；逆构型界 |
| $\mathcal U$ | $\mathbb N$ 上自由超滤（Zorn/choice） | 第 176 行 | UltraRealLimit.lean:135 `Filter.hyperfilter ℕ` | ultralimit 存在唯一；界/等式传递 |
| $\|(a_n)\|_{\mathcal U}$ | $\lim_{\mathcal U}\|a_n\|$ | 第 179–181 行 | UltraNormed.lean:175 `norm_classOf` | 半范数 → 商 $Q_X$ |
| $Q_X,Q_Y$ | 半范数核的商 | 第 182 行 | UltraNormed.lean:146 `UltraQuotient` | 缺陷取到的载体 |
| 完备化空间 | $\widehat{Q_X},\widehat{Q_Y}$ | 第 196 行 | UltraNormed.lean:205 `UltraCompletion`；SphereCompletion.lean:145 | 提供 Banach 环境给 Darbo |
| $x_0,y,t$ | $\|f(x_0)-tf(y)\|-\|x_0-ty\|=M$，$M/2\le t\le1-M/2$ | eq:maximal（167–170）、174 | DefectAttainment.lean:51 + DefectSequence.lean:67 | attained 配置入口；$t\in(0,1)$ |
| $b$ | $f(y)$ | 第 219 行 | `f y`（Alignment.lean:61 参数） | $Y$ 侧基点 |
| $p(v),s(v),u(v),r(v)$ | 四弦半径（定义链 eq:return） | 236–240 | ReturnMap.lean:71–107 | 弦账目基本量 |
| $x(v),z,w(v),g(v)$ | 弦端点、方向、回返映射 | 236–240 | ReturnMap.lean:79,87,96,104 | 不动点对象 |
| 半径区间 | $p,r,s,u\in[1-t,1+t]$ | 230, 241 | `radii_bounds` ReturnMap.lean:148；AlignedConfiguration.lean:46–84 | $a,U$ 界；分箱尾项 $4\eta/a$ |
| $E$ | $\{v\in S_X:s(v)-p(v)=M\}$ | 243 | ExtremalPropagation.lean:30 `extremalSphere` | 极值方向集；传播域 |
| eq:equality | $r=u+M,\ \|(p)v+rg(v)\|=p+r$ | 248–250 | `extremal_radius_identities` | 公共支撑产生点 |
| 传播规则 | 共支撑单位方向 $\in E$；$g(v)\in E$ | 251–256 | ExtremalPropagation（`positive_prefix_extension`） | $C\subset E$ 归纳基础 |
| $C$ | $\clco\{v_0,v_1,\dots\}$，$a_n$ 稠密调度，$\lambda_n\to0$、扰动 $\le2\lambda_n$ | 258–267 | InvariantConvexSet.lean:106,148 + PositiveScheduling.lean:90,153 | Darbo 域；唯一可分对象 |
| $g(C)\subset C$ | 连续性 + 闭性 | 267 | `recursiveConvexSet_invariant` :127 | 自映射 |
| eq:contraction | $\|g(v)-g(v')\|\le\frac{up}{rs}\|v-v'\|+\frac{2|u-u'|}{r}+\frac{2u|p-p'|}{rs}$ | 280–284 | ReturnMapEstimate.lean:82,170 | $\chi$ 压缩原型 |
| $a,U$ | $a=1-t>0$，$U=1+t$ | 285 | `hbounds` 参数（ReturnMapFixedPoint.lean:27） | 分母正性；bin 宽 |
| $\gamma$ | $(1-M/U)^2\in(0,1)$；$\frac{up}{rs}\le\gamma$ | 287–289 | ReturnMapBounds.lean:81–110 | Darbo 压缩常数 |
| 尾项界 | $\le4\eta/a$（用 $r,s\ge a$、$u<r$） | 291 | ReturnMapNoncompactness.lean:21,60 | $\chi(gH)\le\gamma\chi(H)$ |
| 不动点 $v$ | $g(v)=v\in C$（$x=x(v)$ 未必 $=x_0$） | 293 | Alignment.lean:95–101 | 对齐来源 |
| eq:chords/eq:radii | 四弦式；$s-p=r-u=M$，$d=p+r=s+u=\|x-z\|\le2$ | 220–231 | AlignedConfiguration.lean:23–44 | 层 3 全部输入 |
| $A,B,\epsilon$ | $A=p/d$，$B=u/d$，$\epsilon=1-t$；$A+B=1-M/d<1$ | eq:AB（322–325） | AlignedConfiguration.lean:92–131 | 分枝阈值 |
| $h$ | $\min\{t/s,\ \epsilon/u\}$ | 333 | ChordSecant.lean:67 `secantStep` | 免费零半径选择 |
| $\theta$ | $hs/p\le t/p=:\beta$ | 334 | ChordSecant.lean:68 | 支撑向量 $v+\theta y$ |
| $K$ | secant 斜率 $\frac{\|(r/u)v+hy\|-\|(p/s)v+hy\|}{r/u-p/s}$ | 335 | ChordSecant.lean:69 | 上下界枢纽 |
| $sr-up$ | $=Md$ | 355 | `chord_identity` AlignedConfiguration.lean:150 | 加权消元分母 |
| eq:K | $\epsilon/p\le\varphi(v)\le K\le1-B$ 或 $\le B$ | eq:K（339–343） | `secant_bounds` ChordSecant.lean:221 | 分支上界 |
| eq:product | $pu/(d\epsilon)\ge1$（$B>\epsilon$ 时） | 381–383 | `largeB_product_bounds` LargeChord.lean:28 | 符号自举第一环 |
| $j=L(y)$ | $<0$（每个 $v$ 支撑）；逆侧 $\varphi(b)>0$ | 384–400 | `largeB_forces_largeA_and_negative_support` :49；`largeB_support_signs` :112 | 微扰两翼 |
| $u<r<1$ | $r-tj\le1$ 推论 | 393 | LargeChord.lean:49 内部 | $Au\ge\epsilon\Rightarrow A>\epsilon$ |
| eq:inverse | $(p',s',r',u')=(u,r,s,p)$，$(v',w',y',b')=(-w,-v,b,y)$；$(A',B')=(B,A)$ | 396–399 | AlignedConfiguration.lean:178 `inverse` | 对称闭合 |
| eq:perturb | $\|sw+\eta b\|-\|pv+\eta y\|\le M=s-p$（$0<\eta<t$） | 403–405 | RadialPerturbation.lean:87,110 | 大分支矛盾主不等式 |
| eq:small | $\epsilon\le dA(1-B)$，$\epsilon\le dB(1-A)$ | 422–424 | `small_secant_product` ChordSecant.lean:256 + ChordContradiction.lean:22–27 | 小分支定量 |
| $\min<1/4$ | $A\le B\Rightarrow A(1-B)\le A(1-A)<1/4$（$A<1/2$ 由 $A+B<1$） | 425 | `smallChord_epsilon_lt_half` SmallChord.lean:21 | $\epsilon<1/2$（$d\le2$） |
| eq:ratios | $p/t<r/\epsilon$；$s/t\ge u/\epsilon$ | 426–429 | `smallChord_coefficients` :45 | 凸比较的自变量排布 |
| $F,G$ | $\lambda\mapsto\|y+\lambda v\|$、$\|b+\lambda w\|$，$F(0)=G(0)=1$、$F(p/t)=G(s/t)=1/t$ | 431–439 | `hx hfx` 传入 SmallChord（ChordContradiction.lean:31–33） | secant 单调双函数 |
| 终结等式 | $\epsilon F(r/\epsilon)=\|y-z\|=\|b-f(z)\|=\epsilon G(u/\epsilon)$ | 444–449 | `hiso` ChordContradiction.lean:41–44；`smallChord_norm_contradiction` :80 | 矛盾收口 |
| $q=\beta/\alpha$ | 跨半径归一化 | 455 | RadialExtension.lean:79 `scaled_norm_sub_eq` | $M=0$ 兑现为全局保距 |
| $\delta$（中点缺陷） | $\|F(m)-m'\|\le\|a-c\|/2$，反射翻倍 $2\delta$ | 465–472 | （Mathlib MazurUlam，未重证） | 仿射步 |
| $\chi$ | $\inf\{\delta:$ 有限 $\delta$-直径覆盖$\}$ | 203–206 | KuratowskiBasic.lean:20,71,75 | 非紧度量 |
| $\chi(\cl H),\chi(\clco H)$ | $=\chi(H)$ | lem:chi | `chi_closure` :124；`chi_convexHull/_closedConvexHull` :125,:143 | Darbo 迭代等式 |
| $C_n$ | $\clco(g(C_{n-1}))$，$\chi\le\gamma^n\chi(C_0)\to0$ | 536–539 | CondensingIteration.lean:31–176 | 紧核 $K$ |
| $\Delta_x,\Delta_z$ | $s(\|w+hb\|-\|(p/s)v+hy\|)$、$u(\|(r/u)v+hy\|-\|w+hb\|)$ | 348–353 | `secant_defect_first/_opposite` :125,:142 | 加权消元两项 |
| $MK$ | $(u\Delta_x+s\Delta_z)/d$ | 355–358 | `secant_weighted_identity` :159 | $K$ 上界通道 |
| $\lambda_n$（调度权重） | $0<\lambda_n<1$、$\to0$；实现 $1/(n+2)$ | 265–267 | PositiveScheduling.lean:90 | 稠密化扰动界 $2\lambda_n$ |
| $N,\eta,R$（Lemma A.1） | 覆盖块数/系数分割宽/范数界 | 491–496 | `dist_weighted_mixtures_le` KuratowskiConvexHull.lean:25 | $\chi(\co H)\le\delta+R\eta$ |
| $\Delta_m$、标号 $i$ | $a_i>0\wedge a_i\ge P(a)_i$ | 506–508 | Sperner.lean:20 + ProbabilitySimplex.lean:99 | Brouwer/Sperner |
| 细分缩率 | $m/(m+1)$ | 512 | BarycentricMesh.lean:143 | mesh $\to0$ |
| $\delta>0$ 网（A.3） | 严格 $\delta$-网 + $\lambda_i(x)$ 权重 | 521–531 | CompactApproximation.lean:28–152 | Schauder |

**跨行检查（反推备忘）**：
- $M$ 的三次消费：$\gamma<1$（第 289 行）、$A+B<1$（第 325 行）、严格支撑符号自举 $1=L(v)\le B<1$（第 389 行）。若 $M=0$ 三处全塌，但那正是目标结论，逻辑不循环。
- $t<1$ 的四次消费：径向中心内点（$p,u$ 侧）、$a=1-t>0$、$\epsilon>0$、$A\le\epsilon<t$（第 425 行）。$t>0$ 的两次：$h>0$（$F$ 侧割线非退化）、$\eta<t$ 微扰窗。
- $d\le2$ 的两次：$\epsilon<1/2$ 的定量（第 425 行）、$A<1/2$？——$A<1/2$ 只用 $A+B<1$；$d\le2$ 专属 $\epsilon$ 界。
- $d\ge2\epsilon$（$p,r\ge1-t$）：未单独命名，隐含在 eq:product 分母 $d\epsilon\le d\cdot\frac12<…$ 各处；形式化里由 `p_bounds/r_bounds` 直接供给。
- 唯一"看似多余"的参数 $\beta=t/p$（第 363 行）：只为 $\theta\le\beta$ 的三分（$\theta=\beta$ / $<\beta$）与 $v+\theta y\ne0$ 的 $\theta<1$ 界（第 361 行）服务——两处都要 $p\le1+t$ 参与。

<!-- 完 -->
