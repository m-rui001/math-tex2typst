# Arnold 临界数界退化反例——研究素材

> 论文：*Three fixed points on the symplectic quadric threefold*，OpenAI，2026 年 9 月 23 日。
> 预印本目录：`E:\math\preprints\A-degenerate-counterexample-to-the-critical-number-Arnold-bound-September-23-2026\`
> TeX 源码：`build\main.tex` 与 `build\sections\00-introduction.tex`、`01-reduction.tex`、`02-quadric.tex`、`03-critical-bound.tex`、`04-three-points.tex`、`05-conclusion.tex`。
> Lean 形式化：`E:\math\lean\OAI\Geometry\Arnold\` 下 36 个文件，入口 `Main.lean`，声明 `OAI.ArnoldCounterexample.main`；挑战配置 `E:\math\lean\ComparatorChallenges\ArnoldCounterexample.json`。
> 本素材用途：为后续撰写"第一人称反推思维链"笔记提供原始推导材料。所有 TeX 公式照抄源码；论文之外的推断一律标注 [推测] 或注明出处。

---

## 一、定理总览

### 1.1 研究对象与两个"退化界"

论文比较的是 Hamiltonian 微分同胚的不动点个数与**光滑函数临界点个数的最小值**（允许退化临界点），而不是经典 Floer 理论中的非退化（Morse 型）界。TeX 源码（00-introduction.tex）给出的定义：

- 临界集与临界数：
```tex
 \CritSet(h)=\{q\in M:dh_q=0\},\qquad
 \Crit(M)=\min_{h\in C^\infty(M,\R)}\#\CritSet(h).
```
  这里的最小值**允许退化临界点**；与之相对的 Morse 数只在 Morse 函数类中取最小。
- 杯长约定（含单位元）：
```tex
 \operatorname{cuplength}(M;\mathbb Q)
```
  定义为"一加正维数有理上同调类乘出非零积的最大个数"，即把单位元计入。Lusternik–Schnirelmann 不等式给出
```tex
 \operatorname{cuplength}(M;\mathbb Q)\le\Crit(M);
```
- Hamiltonian 微分同胚：闭辛流形 $(M,\omega)$ 上时间依赖 Hamilton 流的时间一映射；约定
```tex
 \iota_{X_{H_t}}\omega=dH_t,\qquad
 \Fix(\phi)=\{q\in M:\phi(q)=q\}.
```
- **临界数 Arnold 界**（论文要攻击的命题）：
```tex
\begin{equation}\label{eq:arnold-bound}
 \#\Fix(\phi)\ge\Crit(M)
\end{equation}
```
  "对每个闭连通辛流形上的每个 $\phi\in\Ham(M,\omega)$ 成立"。其弱化形式即把 $\Crit(M)$ 换成 $\operatorname{cuplength}(M;\mathbb Q)$。两个表述都**不假设非退化**；出处为 Golovko, *On variants of Arnold conjecture*, Archivum Mathematicum **56** (2020), Conjectures 1.4 与 1.6。
- 非退化定义：$q$ 非退化当且仅当 $1$ 不是 $d\phi_q$ 的特征值。

### 1.2 主定理的精确陈述

流形是复二次超曲面三维射影簇（symplectic quadric threefold）：
```tex
\begin{equation}\label{eq:quadric}
 Q^3=\bigl\{[z_0:z_1:z_2:z_3:z_4]\in\CP^4:
                 z_0^2+z_1^2+z_2^2+z_3^2+z_4^2=0\bigr\},
\end{equation}
```
配限制的 Fubini–Study 形式（归一化见下文 2.4 节）。

主定理（Theorem 1.1, `thm:counterexample`）原文：
```tex
\begin{theorem}\label{thm:counterexample}
There is a smooth Hamiltonian diffeomorphism $\phi$ of the closed connected
symplectic six-manifold $Q^3$ such that
\begin{equation}\label{eq:counterexample}
 \#\Fix(\phi)=3<4=\Crit(Q^3)
                  =\operatorname{cuplength}(Q^3;\mathbb Q).
\end{equation}
At least one fixed point of $\phi$ is degenerate.
\end{theorem}
```

### 1.3 "退化反例"的确切含义

1. **反例同时推翻两个无限制界**。$\#\Fix(\phi)=3$ 同时低于 $\Crit(Q^3)=4$ 与 $\operatorname{cuplength}(Q^3;\mathbb Q)=4$，所以（eq:arnold-bound 的）临界数形式与（含单位元的）有理杯长形式都被否定。摘要原句："Thus the example disproves the unrestricted critical-number and rational cup-length forms of the Arnold conjecture."
2. **不动点计数包含全部不动点**。引言明确说 "The count includes all fixed points, so imposing a contractibility condition on their Hamiltonian trajectories cannot restore either inequality."——即不能靠"只数可缩轨道"来挽救这两个界。
3. **退化是本质的，不是缺陷**。反例的固定子流形上的函数 $f$ 有且仅有三个临界点，其中 $q_0$ 的 Hessian 秩为 2（本征值 $1,-1,0,0$，见 Remark 4.2）。若把计数限制在 Morse 函数/Morse 不动点上，$S^2\times S^2$ 的 Betti 数和为 4，任何 Morse 途径都得不出 3。论文原话："This is why a count restricted to Morse functions would not capture the example."
4. **与非退化 Arnold 不等式相容**。Floer–Fukaya–Ono–Liu–Tian–Ruan 一系的 $\sum b_i$ 下界只对非退化 Hamiltonian 微分同胚成立；本例有退化不动点，故不与它们冲突（"The nondegenerate homological Arnold inequalities concern a different hypothesis and remain compatible with this example."）。
5. **它否定的是一个具体的历史断言**：Ma 2013（arXiv:0808.0613v7, Theorem 1.5）断言"Hamiltonian 微分同胚的最少不动点数总等于 $\Crit(M)$"。Theorem 1.1 直接与此矛盾（"Theorem~\ref{thm:counterexample} contradicts that assertion."）。

### 1.4 "3 是最优的"——与 Gong 界的匹配

引言引用 Gong（arXiv:2507.04191v5, Section 1.1.1）：对复维数 $n\ge2$ 的标准复二次超曲面，每个 Hamiltonian 微分同胚至少有 $n$ 个不动点。$n=3$ 时下界为 3，本例恰好达到：
```tex
Thus our example attains his bound for $n=3$.
```
论文还处理了归一化差异：Gong 的 Fubini–Study 形式与本文差一个正标量，而"rescaling the form and a generating Hamiltonian by the same scalar preserves its vector field"，即 Hamiltonian 群不变，比较是合法的。

### 1.5 证明机制的一句话概括（引言 "Proof mechanism" 段）

核心是"把固定子流形上的临界点计数迁移为附近 Hamiltonian 映射的不动点计数"：

> 设 $A$ 是具固定子流形 $F$ 的有限阶 Hamiltonian 映射，固定切向量恰好是切于 $F$ 的那些。把 $F$ 上的函数 $f$ 延拓为 $A$-不变的 $K$，令 $B_s$ 为其 Hamiltonian 流。若 $A^m=\id$，不变性给出
```tex
 (A\circ B_\varepsilon)^m=B_{m\varepsilon}.
```
> 对充分小的 $\varepsilon>0$，右边只有驻点型不动点。于是 $A\circ B_\varepsilon$ 的不动点必是 $A$-固定的 $K$ 临界点；有限群平均使"$F$ 上的环境临界性"等价于"$f$ 的临界性"（Palais 对称临界原理的有限群情形），从而
```tex
 \Fix(A\circ B_\varepsilon)=\CritSet(f).
```

具体到二次超曲面：取 Hamiltonian 对合
```tex
 A[z_0:z_1:z_2:z_3:z_4]=[z_0:-z_1:-z_2:-z_3:-z_4],
```
其不动点集为 $Q^2\cong S^2\times S^2$；后者有三临界点函数（Takens–Mare 构造，本文给出显式公式并算出全部临界集）；孤立退化临界点变成退化 Hamiltonian 不动点。环境 $Q^3$ 上则相反：辛体积强迫任何光滑函数至少 4 个临界点，且一个 Hamiltonian 旋转（不等速旋转 $G_{1,2}$）实现这个最小值——所以 $\Crit(Q^3)=4$ 是紧的，反例数 3 恰好比它小 1。

### 1.6 相关工作定位（引言 Historical context 段，全部照论文）

- **正面结果**（解释为什么无限制比较是自然的）：Conley–Zehnder 1983：标准辛环面 $T^{2n}$ 上每个 Hamiltonian 微分同胚至少 $2n+1$ 个不动点；Fortune 1985：标准 $\CP^n$ 上界为 $n+1$；Hofer 1988（Theorem 4）：$\pi_2(M)=0$ 时无非退化假设的杯长界；Rudyak–Oprea 1999（Corollary 4.3）：辛类与第一陈类在 $\pi_2(M)$ 上均为零时的完整临界数界。二次超曲面有正面积的球面，不在后一假设范围内。
- **非退化 Floer 理论**：Floer 1989（monotone 情形）；Fukaya–Ono 1999、Liu–Tian 1998、Ruan 1999（一般闭辛流形非退化情形的 Betti 和下界）。
- **正则性重要**：Buhovsky–Humilière–Seyfaddini 2018 构造了实维数 $\ge4$ 的每个闭连通辛流形上只有一个不动点的 Hamiltonian **同胚**；本构造停留在光滑 Hamiltonian 群内。
- **同期工作**：Jiao 2026（arXiv:2609.33626v1，2026 年 9 月 27 日公布，晚于本文 9 月 23 日）报告等面积 $S^2\times S^2$ 上有两个不动点的光滑 Hamiltonian 微分同胚，用的是局部鞍点合并与混合生成函数；本文用的是六维二次超曲面上的有限阶映射。"None of these fixed-point results is an input to our construction."

### 1.7 论文结构（main.tex 的 \input 顺序）

```
00-introduction  —— 定义、主定理、机制概述
01-reduction     —— 有限阶迁移命题（含短周期引理）
02-quadric       —— Hamiltonian 对合与切空间分裂
04-three-points  —— 固定子流形上的三临界点函数（注意：编译顺序 04 在 03 前）
03-critical-bound —— 临界数与杯长都等于 4
05-conclusion    —— 组装 + 退化性验证
```
（main.tex 中 `\input{sections/04-three-points}` 在 `\input{sections/03-critical-bound}` 之前，这是源文件的原始顺序，编号仍按章节：Prop 2.1、Lemma 2.2、Prop 3.1、Prop 4.1、Remark 4.2、Lemma 5.1、Cor 5.2、Cor 5.3。）

---

## 二、逐引理带批注重构

本节把论文的每条引理/命题单独重建：(a) 精确陈述（TeX 原样）；(b) 证明机制逐步推导到中间步骤；(c) 每个假设与常数的机械性理由；(d) [推测] 标注的候选失败路线——研究者在走到现在这条路之前可能试过什么、为什么不行。

### 2.1 命题 2.1（有限阶迁移，`prop:reduction`，01-reduction.tex）

**(a) 精确陈述。**
```tex
\begin{proposition}
\label{prop:reduction}
Let \((M,\omega)\) be a closed symplectic manifold, and let
\(A\in\Ham(M,\omega)\) satisfy \(A^m=\id\) for some positive integer
\(m\). Suppose that \(F=\Fix(A)\) is a closed embedded submanifold and
that
\[
  T_qF=\ker(dA_q-\id)
  \qquad\text{for every }q\in F.
\]
For every smooth function \(f:F\to\R\), there is a smooth
\(A\)-invariant extension \(K:M\to\R\) such that, if \(B_s\) is its
Hamiltonian flow, then for every sufficiently small \(\varepsilon>0\)
the map
\[
  \phi_\varepsilon=A\circ B_\varepsilon
\]
is Hamiltonian and satisfies
\[
  \Fix(\phi_\varepsilon)=\CritSet(f),
\]
where the critical set on the right is viewed as a subset of \(M\).
\end{proposition}
```
命题后的说明段指出：$T_qF=\ker(dA_q-\id)$ 就是通常的 *clean fixed-set* 条件，论文把它显式写出"to identify the geometric input"。

**(b) 证明机制逐步推导。**

证明分两个部件：有限群平均的对称临界性（给出 $\CritSet(K)\cap F=\CritSet(f)$），以及短非常周期轨道的排除（给出 $\Fix(\phi_\varepsilon)$ 不含 $F$ 之外的点）。先说前者。

*第一步：把 $f$ 延拓成环境函数。* 在 $F$ 的子流形图卡上让延拓**不依赖于法向坐标**（即在法向为常数），再用单位分解拼成整体的 $\widetilde f:M\to\R$。这一步的设计意图：在 $F$ 的点上，$d\widetilde f$ 在切方向上就等于 $df$，法向上则可能非零——法向部分稍后会被平均消掉。

*第二步：$m$ 折平均。* 定义
```tex
  K=\frac1m\sum_{j=0}^{m-1}\widetilde f\circ A^j.
```
则 $K\circ A=K$（因为 $A^m=\id$，把求和指标轮换一位）且 $K|_F=f$（因为 $A|_F=\id$，每一项在 $F$ 上都等于 $\widetilde f|_F=f$）。

*第三步：平均微分是到固定切空间的投影。* 固定 $q\in F$，记 $D=dA_q$，考虑
```tex
  P_q=\frac1m\sum_{j=0}^{m-1}D^j.
```
由 $D^m=\id$ 得 $DP_q=P_q$（链式：$D\cdot\frac1m\sum_j D^j=\frac1m\sum_{j=1}^{m}D^j=P_q$）。又若 $Dv=v$ 则 $P_qv=v$。所以 $P_q$ 是到 $\ker(D-\id)=T_qF$ 的线性投影。注意这一步**只用** $D^m=\id$，不需要 $D$ 可对角化等任何额外假设。

*第四步：临界性等价（对称临界性）。* 对平均后的延拓求微分：
```tex
  dK_q(v)=d\widetilde f_q(P_qv)=df_q(P_qv).
```
第一个等号用链式法则与线性性：$dK_q=\frac1m\sum_j d\widetilde f_q\circ D^j=d\widetilde f_q\circ P_q$（$d\widetilde f$ 在同一点求值，因为 $A^j q=q$）。第二个等号用第一步"延拓不依赖法向坐标"。于是
```tex
\begin{equation}
\label{eq:critical-restriction}
  \CritSet(K)\cap F=\CritSet(f).
\end{equation}
```
这正是 Palais 对称临界原理的有限群情形，论文写 "which we verify directly"——直接验证而不是引用。

*第五步：流与 $A$ 交换。* 因为 $A$ 辛且 $K\circ A=K$，其微分把 Hamiltonian 向量场 $X_K$ 送到自身：$\iota_{dA\cdot X_K}\omega = (dA)^*(\iota_{X_K}\omega)$ 拉回后 $=d(K\circ A)=dK$（辛性消掉拉回），故 $dA_q X_K(q)=X_K(q)$。由解的唯一性 $A\circ B_s=B_s\circ A$ 对一切 $s$。

*第六步：短周期排除（引理 2.2，见 2.2 节）与 $\varepsilon$ 的选取。* 对 $X_K$ 用引理 2.2 得 $\delta>0$：$0<t<\delta$ 时 $\Fix(B_t)=\CritSet(K)$（$X_K$ 的零点集即 $dK=0$ 的点集）。取 $0<\varepsilon<\delta/m$。

*第七步：幂恒等式与不动点的刻画。* 由交换性与 $A^m=\id$：
```tex
  \phi_\varepsilon^m=(A\circ B_\varepsilon)^m=A^m\circ B_\varepsilon^m=B_{m\varepsilon},
```
（$m$ 个因子 $A\circ B_\varepsilon$ 相乘，$A$ 逐个穿过 $B_\varepsilon$ 聚到左边，中间 $A^m=\id$ 消掉；$m\varepsilon<\delta$。）于是：
- 若 $\phi_\varepsilon(q)=q$，则 $q$ 被 $\phi_\varepsilon^m=B_{m\varepsilon}$ 固定，而 $m\varepsilon<\delta$，故 $dK_q=0$；又 $\Fix(B_{m\varepsilon})=\CritSet(K)$ 中 $B_{m\varepsilon}(q)=q$ 且 $m\varepsilon<\delta$ 意味着 $q\in\Fix(B_\varepsilon)$（再次用引理 2.2，$0<\varepsilon<m\varepsilon<\delta$），于是 $B_\varepsilon(q)=q$，代回 $\phi_\varepsilon(q)=q$ 得 $A(q)=q$，即 $q\in F$；结合 eq:critical-restriction 得 $q\in\CritSet(f)$。
- 反之，$\CritSet(K)\cap F=\CritSet(f)$ 中的点满足 $X_K(q)=0$（故 $B_\varepsilon(q)=q$）且 $A(q)=q$，从而被 $\phi_\varepsilon$ 固定。

结论：$\Fix(\phi_\varepsilon)=\CritSet(f)$（作为 $M$ 的子集）。

*第八步：复合映射确实由光滑 Hamiltonian 生成（"For completeness" 段）。* 取从 $\id$ 到 $A$ 的 Hamiltonian 道路 $A_t$（生成元 $H_t$），以及光滑非降 $a:[0,1]\to[0,1]$，在 $0$ 附近为 $0$、在 $1$ 附近为 $1$。定义
```tex
\begin{aligned}
  L_t(x)=
  \begin{cases}
    2\varepsilon a'(2t)K(x),&0\le t\le\tfrac12,\\[2pt]
    2a'(2t-1)H_{a(2t-1)}(x),&\tfrac12\le t\le1.
  \end{cases}
\end{aligned}
```
它是光滑的，因为两段在拼接时刻附近都为零。其流先走 $B_{\varepsilon a(2t)}$（第一段积分 $\int_0^{1/2}2\varepsilon a'(2t)\,dt=\varepsilon$，且 $K$ 自洽，流就是 $B$ 的重参数化），再走 $A_{a(2t-1)}\circ B_\varepsilon$，时间一映射恰为 $\phi_\varepsilon$。

**(c) 假设与常数的机械性理由。**

- **$A^m=\id$（有限阶）**：整个迁移的引擎。它同时给出 (i) 平均算子 $P_q$ 是投影（第三步），(ii) 幂恒等式 $\phi_\varepsilon^m=B_{m\varepsilon}$（第七步），(iii) $K\circ A=K$。三者缺一不可。[推测] 若只假设 $A$ 与某个流交换（比如 $A$ 落在一个环面作用里），平均可以对群卷积做，但幂恒等式消失，"远离 $F$ 的不动点"只能靠别的机制排除——例如要求 $B_{m\varepsilon}$ 型论证换成"迭代收敛到 $F$"，这在退化临界点附近会失效（见 2.2 节的 [推测]）。
- **$T_qF=\ker(dA_q-\id)$（clean fixed set）**：没有它，第三步的 $P_q$ 仍投影到 $D$-不动子空间，但那不必等于 $T_qF$，第四步的 $dK_q(v)=df_q(P_qv)$ 就不再保证"$F$ 上环境临界 = $f$ 临界"。具体地，若存在 $v\in\ker(dA_q-\id)\setminus T_qF$，$P_q$ 会把法向分量保留下来，$d\widetilde f$ 的法向值混进 $dK_q$。
- **$\varepsilon<\delta/m$**：因为幂恒等式把时间放大 $m$ 倍：$\phi_\varepsilon^m=B_{m\varepsilon}$ 需要落在引理 2.2 的窗口 $\delta$ 内；同时反推 $q$ 被 $B_\varepsilon$ 固定也需要 $\varepsilon<\delta$。$m=2$（本论文的对合情形）时即 $\varepsilon<\delta/2$。
- **$a$ 在端点附近平坦**：保证 $L_t$ 在 $t=1/2$ 拼接处光滑（两段的 $a'$ 同时为零），并且第一段恰好累计出 $\varepsilon$、第二段恰好把 $A_t$ 从 $\id$ 走到 $A$。
- **"$K$ 无临界点个数上限"**：命题结尾的 remark——命题对 $\CritSet(K)$ 的总个数不加任何约束；$F$ 之外的临界点 $q$ 满足 $\phi_\varepsilon(q)=A(q)\ne q$，不贡献不动点。这正是"环境临界点很多、不动点很少"得以相容的原因。
- **$A$ 的不变性 vs 同痕不变性**：结尾 remark 特别强调"requires invariance under $A$, not under an isotopy from $\id$ to $A$"。即 $K$ 必须被 $A$ 本身（而非某条到 $A$ 的道路）保持。

**(d) [推测] 候选失败路线。**

1. **[推测] 在 $F$ 附近直接用隐函数定理求 $\phi_\varepsilon$ 的不动点。** 不动点方程 $\phi_\varepsilon(q)=q$ 在非退化不动点附近线性化为 $(d\phi_\varepsilon-\id)$ 可逆，隐函数定理直接给个数；但在退化不动点 $q_0$（Hessian 有核）处 $d\phi_\varepsilon-\id$ 奇异，隐函数定理失效——而这恰是本构造必须保留的点。有限阶恒等式 $\phi_\varepsilon^m=B_{m\varepsilon}$ 把"求 $\phi_\varepsilon$ 的不动点"化成"求向量场零点"，绕开了线性化，这是能处理退化点的关键设计。
2. **[推测] 用连续群（$S^1$ 或环面作用）代替有限阶 $A$。** 取 $A$ 为某个 circle action 在时刻 $2\pi$ 的返回映射，平均变成对 Haar 测度积分；但 $A^m=\id$ 换成 $A$ 是流的时间映射后，$\phi_\varepsilon^m$ 不再化简（除非 $\varepsilon$ 与周期可公度），第七步失效。而且连续对称下 $K$ 的平均使 $\CritSet(K)$ 含整条群轨道，$\Fix$ 的刻画变粗。
3. **[推测] 直接用 $A$ 不加扰动。** $\Fix(A)=F=Q^2$ 是整个曲面，不动点无穷多；要减少不动点必须扰动。但若扰动 $A$ 本身（而非复合 $A\circ B_\varepsilon$），clean fixed set 在扰动下立刻被破坏——固定子流形可能"冒泡"成孤立点或消失，且新的不动点个数无法用 $f$ 控制。复合式扰动 $A\circ B_\varepsilon$ 把扰动严格限制在"沿 $A$ 的固定几何"上，是保留控制的关键。
4. **[推测] 对一般的 $f$（比如有连续临界值带的 $f$）担心 $\CritSet(f)$ 无穷。** 本构造不需要 $\CritSet(f)$ 有限；命题对任意光滑 $f$ 成立。实际应用里 $f$ 恰有三个孤立临界点，所以没有问题。

### 2.2 引理 2.2（短周期排除，`lem:short-periods`，01-reduction.tex）

**(a) 精确陈述。**
```tex
\begin{lemma}
\label{lem:short-periods}
Let \(X\) be a smooth vector field on a closed manifold \(M\), and let
\(\Psi_t\) be its flow. There is a number \(\delta>0\) such that
\[
  \Fix(\Psi_t)=\{q\in M:X(q)=0\}
  \qquad\text{for every }0<t<\delta.
\]
\end{lemma}
```

**(b) 证明机制逐步推导。**

结论的反方向（$X$ 的零点是每个 $\Psi_t$ 的驻点，故固定）是平凡的；实质是排除**短的非常周期轨道**。证明用反证 + Lipschitz 估计：

1. **紧性给出整体流**：$M$ 闭，流对所有时间有定义。
2. **反设**：存在 $q_j$ 与 $t_j>0$：
```tex
  t_j\longrightarrow0,\qquad
  \Psi_{t_j}(q_j)=q_j,\qquad X(q_j)\ne0.
```
3. **取子列收敛**：$q_j\to q$。选 $q$ 附近的坐标卡与坐标球（闭包含于卡内）。由流的连续性，所有充分晚的轨道段 $\{\Psi_s(q_j):0\le s\le t_j\}$ 落入该球。坐标向量场 $V$ 在球上 Lipschitz，常数 $L\ge0$（导数在闭球上有界）。
4. **记号**：$u_j(s)$ 为坐标轨道，$C_j=\max_{0\le s\le t_j}|\dot u_j(s)|>0$。（$C_j>0$：$X(q_j)\ne0$，且 $q_j$ 离 $q$ 近、$X(q)\ne0$——$X(q)\ne0$ 因为 $X(q_j)\ne0$ 且 $q_j\to q$、$t_j\to0$ 保证 $X(q_j)\to X(q)\ne0$。）
5. **加速度的一致小界**：对 $s,r\in[0,t_j]$，球的凸性 + Lipschitz 估计：
```tex
 \begin{split}
  |\dot u_j(s)-\dot u_j(r)|
   &=|V(u_j(s))-V(u_j(r))|\\
   &\le L|u_j(s)-u_j(r)|
    \le LC_j|s-r|
    \le LC_jt_j.
 \end{split}
```
   中间一步 $|u_j(s)-u_j(r)|\le C_j|s-r|$ 是速度被 $C_j$ 控制的积分；最后一步 $|s-r|\le t_j$。
6. **闭轨道速度均值为零**：$\int_0^{t_j}\dot u_j(r)\,dr=u_j(t_j)-u_j(0)=0$（回到出发点）。于是在最大速度时刻 $s_j$：
```tex
  C_j
  =\left|
     \frac1{t_j}\int_0^{t_j}
        \bigl(\dot u_j(s_j)-\dot u_j(r)\bigr)\,dr
    \right|
  \le LC_jt_j.
```
   （把常数 $C_j=\dot u_j(s_j)$ 写成均值减法：$\frac1{t_j}\int(\dot u_j(s_j)-\dot u_j(r))dr = \dot u_j(s_j)-0$。）
7. **矛盾**：$C_j>0$，除以 $C_j$ 得 $1\le Lt_j$；$t_j\to0$ 矛盾。故存在 $\delta>0$ 使得 $0<t<\delta$ 时无常非常周期轨道。

**(c) 假设与常数的机械性理由。**

- **只需定性存在 $\delta$，不需显式常数**：论文引言称"Yorke 证明了锐的欧氏估计"（Yorke 1969：周期 $\ge$ Lipschitz 常数倒数的 $1/e$ 倍一类的界），但"the following elementary local argument suffices here"——本应用只需要一个窗口的存在性。
- **为什么短周期排除是必要的**：若 $X_K$ 有任意短周期的非常轨道，则 $B_{m\varepsilon}$ 可能在 $\CritSet(K)$ 之外也有不动点，第七步的"$q$ 被 $B_{m\varepsilon}$ 固定 $\Rightarrow dK_q=0$"仍对（这半边只需要 $\Fix(B_{m\varepsilon})=\CritSet(K)$，即零点集刻画成立），但**"$q$ 被 $B_\varepsilon$ 固定"这半边会失效**：$q$ 可能是 $B_{m\varepsilon}$ 的 $m$ 周期点而非 $B_\varepsilon$ 的不动点。短周期引理同时封死这两条缝。
- **$L$ 只在坐标球上取**：流的整体行为不需要控制，只需要晚到的轨道段进入一个小球；$t_j\to0$ 恰好保证这一点。

**(d) [推测] 候选失败路线。**

1. **[推测] 想要显式的 $\delta$（例如 Yorke 型 $1/(eL)$）。** 全局 Lipschitz 常数 $L$ 对一般光滑向量场可以任意大（$X_K$ 的高阶导数无界），显式 $\delta$ 依赖 $K$ 的定量信息，而 $K$ 是平均构造出来的、没有定量控制。反证法只用到"紧凑性 + 局部 Lipschitz"，对任意光滑 $K$ 一致有效——选局部论证是被迫的，不是偏好。
2. **[推测] 用指标/度理论排除短周期。** Conley 型指标或不动点类理论要求非退化性或额外的一般位置假设，退化点附近失效；Lipschitz 均值估计对退化轨道同样成立。
3. **[推测] 只对 $m\varepsilon$ 用引理，不用 $\varepsilon$。** 如上所述，反推 $B_\varepsilon(q)=q$ 需要 $\varepsilon$ 本身也在窗口内——漏掉这一点会把"$B_{m\varepsilon}$ 的 $m$ 周期点"误算成不动点。幂恒等式方向的不动点个数与 $\phi_\varepsilon$ 方向不一定相同，必须两个时刻都压进窗口。

---

### 2.3 命题 3.1（二次超曲面与 Hamiltonian 对合，`prop:quadric`，02-quadric.tex）

**(a) 精确陈述。**
```tex
\begin{proposition}\label{prop:quadric}
The manifold $M$ is closed, connected, and of real dimension six. For
the restricted Fubini--Study form $\omega$, normalized below, the map
\[
 A[z_0:z_1:z_2:z_3:z_4]
   =[z_0:-z_1:-z_2:-z_3:-z_4]
\]
is a Hamiltonian involution.  Its fixed set is the smooth submanifold
\[
 F=M\cap\{z_0=0\}\cong S^2\times S^2.
\]
For every $q\in F$, the differential $dA_q$ acts as $+\id$ on $T_qF$
and as $-\id$ on a complementary real two-dimensional subspace of
$T_qM$.
\end{proposition}
```

**(b) 证明机制逐步推导。**

*第 1 步：$M$ 是光滑复超曲面。* 在 $\CP^4$ 的任何标准仿射卡里，定义方程形如 $1+\sum_j w_j^2=0$；它的微分在零点上不可能为零（否则强制所有 $w_j=0$，与 $1+\sum w_j^2=0$ 矛盾——注意齐次化后仿射方程带常数项 1，梯度至少有常数项那一份"余量"）。所以 $M$ 光滑、复维 3、作为射影空间的闭子集紧而无边。

*第 2 步：连通性（SO(5) 轨道论证）。* 写非零迷向向量为 $z=x+iy$，$x,y\in\R^5$。$z\ne0$ 且 $\sum z_j^2=0$ 等价于
```tex
 |x|=|y|>0,\qquad x\cdot y=0.
```
（实部 $\sum x_j^2-\sum y_j^2=0$，虚部 $2x\cdot y=0$。）缩放后 $(x,y)$ 成为一组**有序正交规范对**；任何这样的对可扩成正定向的正交规范基，故这些对构成连通群 $\mathrm{SO}(5)$ 的单一轨道。映射 $(x,y)\mapsto[x+iy]$ 到 $M$ 是满射，从而 $M$ 连通。（注意 $|x|=|y|$ 保证了缩放可同时归一两个范数。）

*第 3 步：Fubini–Study 形式的显式构造与归一化。* 在单位球面 $S^9\subset\C^5$ 上取
```tex
 \alpha=\sum_{j=0}^4(x_j\,dy_j-y_j\,dx_j).
```
$d\alpha$ 在相位旋转（$z\mapsto e^{i\theta}z$）下不变。对 $v\in T_zS^9$：
```tex
 d\alpha(iz,v)
   =-2\operatorname{Re}\sum_{j=0}^4\overline{z_j}v_j=0.
```
（$v$ 切于球面即 $\operatorname{Re}\sum\overline{z_j}v_j=0$；$iz$ 的作用让 $d\alpha$ 的值恰为该量的 $-2$ 倍实部。）于是 $d\alpha$ 在水平分布上取值，商映射 $p:S^9\to\CP^4$ 下下降为二形式 $\sigma$，$p^*\sigma=d\alpha$；局部截面证明 $\sigma$ 光滑闭。射影切向量有水平提升 $v$（$\sum_j\overline{z_j}v_j=0$），水平提升上的乘 $i$ 诱导复结构。 positivity：
```tex
 d\alpha(v,iv)=2|v|^2,
```
所以 $\sigma$ 在每个复切线上为正，限制 $\omega=\sigma|_M$ 闭且非退化。**归一化即由 $2|v|^2$ 里的因子 2 确定**（这是"$d\alpha$ 型"归一化，与 Lean 里 `omega v w = 2 * im(∑ star v w)` 完全一致，见第三节）。

*第 4 步：一族 Hamiltonian 旋转。* 对 $a,b,t\in\R$，$\Phi_t^{a,b}$ 固定 $z_0$，把 $(z_1,z_2)^{\mathsf T}$、$(z_3,z_4)^{\mathsf T}$ 分别用 $R_{at}$、$R_{bt}$ 旋转：
```tex
 R_\theta=
 \begin{pmatrix}
  \cos\theta&-\sin\theta\\
  \sin\theta&\cos\theta
 \end{pmatrix}.
```
这些实正交（从而复酉）变换保持二次超曲面与 $\alpha$。设 $Z_{a,b}$ 为 $S^9$ 上的生成向量场，Cartan 公式给出
```tex
 \iota_{Z_{a,b}}d\alpha=-d\bigl(\alpha(Z_{a,b})\bigr).
```
$\alpha(Z_{a,b})$ 相位不变（旋转与数乘交换），降到射影空间的光滑函数 $g_{a,b}$；上述恒等式同样下降，故 $G_{a,b}=-g_{a,b}|_M$ 在约定 $\iota_{X_{G_{a,b}}}\omega=dG_{a,b}$ 下生成投影后的旋转。显式：
```tex
\begin{equation}\label{eq:rotation-hamiltonian}
 G_{a,b}([z])=
 \frac{2a\,\operatorname{Im}(\overline{z_1}z_2)
       +2b\,\operatorname{Im}(\overline{z_3}z_4)}
      {\sum_{j=0}^4|z_j|^2}.
\end{equation}
```
特别地 $A=\Phi_1^{\pi,\pi}$ 是 Hamiltonian 的（角速度 $\pi$、时间 1 = 半周旋转 = 对合）。

*第 5 步：固定集。* 被 $A$ 固定的射影直线落在 $\operatorname{diag}(1,-1,-1,-1,-1)$ 的两个本征空间之一。正本征空间给单点 $[1:0:0:0:0]$，不在 $M$ 上（$1^2=1\ne0$）；负本征空间恰给 $F=M\cap\{z_0=0\}$。识别 $F$：用复线性同构
```tex
 (z_1,z_2,z_3,z_4)\longmapsto
 \begin{pmatrix}
  z_1+iz_2&z_3+iz_4\\
  -z_3+iz_4&z_1-iz_2
 \end{pmatrix},
```
其行列式为 $z_1^2+z_2^2+z_3^2+z_4^2$，故把 $F$ 等同于"射影化的非零秩一矩阵"。映射
```tex
 \CP^1\times\CP^1\longrightarrow F,
 \qquad ([u],[v])\longmapsto[uv^{\mathsf T}]
```
是微分同胚：非零列与行在相应的矩阵图卡上光滑地恢复两个射影因子。再由球极坐标把每个 $\CP^1$ 认同 $S^2$；论文强调"Only this smooth identification is needed below"——下面只用光滑认同，不用等距结构。

*第 6 步：切空间分裂。* 固定 $q\in F$，取仿射卡 $z_j=1$（$j>0$）。归一化坐标下 $A$ 把 $w_0$ 送到 $-w_0$、其余坐标不动。$M$ 的方程为
```tex
 w_0^2+1+\sum_{\substack{k>0\\k\ne j}}w_k^2=0.
```
在 $q$（$w_0=0$）处线性化对 $w_0$ 方向**没有约束**（$w_0^2$ 的线性化为零），其余方向的微分非零，其核恰为 $T_qF$。所以
```tex
 T_qM=T_qF\oplus\C\frac{\partial}{\partial w_0},
```
带所断言的 $+1$ 与 $-1$ 作用。这同时直接验证了 $F$ 是光滑复曲面；上面证的正性使 $\omega|_F$ 辛。

**(c) 假设与常数的机械性理由。**

- **$\pi,\pi$ 速度（等速）**：$R_\pi=-I_2$，两个平面同时转半周即对合 $A$；论文明确预告"equal speeds will give the involution, and unequal speeds will later give a function with four critical points on $M$"——同一族旋转既供对合又供实现 $\Crit$ 上界的函数（$G_{1,2}$，见 2.7 节）。
- **$\alpha(Z)$ 的相位不变性**：旋转矩阵是实系数的，与 $z\mapsto e^{i\theta}z$ 交换，所以 $\alpha(Z_{a,b})(e^{i\theta}z)=\alpha(Z_{a,b})(z)$——这是它降到 $\CP^4$ 的原因。$G_{a,b}$ 的显式分子 $\operatorname{Im}(\overline{z_1}z_2)$ 正是 $z_1z_2$ 平面旋转的角动量（moment map 分量），分母是齐次化。
- **符号 $G=-g$**：由 $\iota_Z d\alpha=-d\alpha(Z)$ 与约定 $\iota_{X_G}\omega=dG$ 共同决定；这是为了让 $A=\Phi_1^{\pi,\pi}$ 真的是 $G_{\pi,\pi}$ 的 Hamiltonian 流（号约定不匹配会让 $A$ 变成 $-\id$ 流）。
- **切分裂里 $-\id$ 子空间的实维数是 2**：因为 $w_0$ 是一个复坐标。这是命题 2.1 里"$m=2$、固定切空间 = 核"情形的最简实现。

**(d) [推测] 候选失败路线。**

1. **[推测] 用反全纯对合（如复共轭 $[z]\mapsto[\bar z]$）。** 它把 $\omega$ 变 $-\omega$（反辛），不动点集是实点集 $\RP^3$（Lagrangian）。两个致命伤：(i) 反辛映射不在 $\Ham(M,\omega)$ 里，命题 2.1 的第五步（$A$ 保 $X_K$）失效；(ii) Lagrangian 固定集上"$F$ 上的临界点 = 环境临界点"的对称临界性需要法向平均，而 $dA$ 在法向的 $\pm$ 结构不再是复结构。选 $A$ 为**复线性**对合（保 $\omega$、保复结构）是对的第一步。
2. **[推测] 想要孤立不动点的对合（把 $F$ 换成有限点集，那样 $f$ 的临界点更少）。** 设对合的 $+1$ 本征空间是复直线 $\C v$，若 $[v]\in M$ 则固定点集含该孤立点。但辛对合在不动点处 $dA$ 是对合型辛矩阵，$\det dA=1$，$-1$ 本征空间必须偶复维——孤立不动点迫使 $dA=\id$，由 Bochner 型论证固定点集在附近是子流形、维数 $>0$，矛盾。所以 $F$ 必须是正维数子流形；$Q^3$ 上自然对合的最大固定复曲面正是 $Q^2\cong S^2\times S^2$。（对照：$\operatorname{diag}(1,1,-1,-1,-1)$ 型对合的固定集是两个点 $[1:\pm i:0:0:0]$，不满足 clean fixed set 条件 $T_qF=\ker(dA_q-\id)$——在该孤立点 $dA$ 有 $-1$ 方向。）
3. **[推测] 想在别的 Fano 三维流形上做（如 $\CP^3$、$S^2\times S^2\times S^2$）。** $\CP^3$ 上 Fortune 型结果（$n+1=4$）已有正面下界；$Q^3$ 的特殊之处是它有一个其不动点集 $\cong S^2\times S^2$ 的**辛**对合，而 $S^2\times S^2$ 恰是已知存在三临界点函数的流形（Takens 球面乘积构造的最小非平凡情形）。这是一个"流形的对合几何"与"固定集上的临界点拓扑"两端同时凑巧的组合，缺一不可。

---

### 2.4 命题 4.1（固定子流形上的三临界点函数，`prop:three-points`，04-three-points.tex）

**(a) 精确陈述。**
```tex
\begin{proposition}
\label{prop:three-points}
Let $p=(0,0,1)$ and $e=(1,0,0)$ in $\R^3$.
The smooth function
\begin{equation}
\label{eq:three-point-function}
  f\colon S^2\times S^2\longrightarrow\R,
  \qquad f(x,y)=e\cdot x+(x-p)\cdot y,
\end{equation}
has exactly three critical points.
\end{proposition}
```
出处说明：$S^2\times S^2$ 情形由 Mare（Proposition 3.2.5, 1997 博士论文）经 Takens（1968）的球面乘积构造记录；论文强调 "We use the explicit formula below and determine its entire critical set directly, without importing an existence theorem or assuming that its critical points are Morse."——即**不引用存在性定理、不假设临界点是 Morse 的**，而是完整算出临界集。

**(b) 证明机制逐步推导。**

$f(x,y)=e\cdot x+(x-p)\cdot y$ 在两个球面上的约束临界点问题。开场观察：固定 $x\ne p$ 时，$y$-依赖是第二个球面上的**高度函数**（以 $x-p$ 为方向），临界点 $y=\pm(x-p)/|x-p|$；在 $x=p$ 处该高度函数是常数，但整体的临界性仍要求 $x$-方向导数为零——所以把这一根例外纤维与两个高度分支分开处理。

*第一步：乘子方程。* 约束临界点方程（Lagrange 乘子 $\lambda,\mu\in\R$）：
```tex
\begin{equation}
\label{eq:critical-multipliers}
  e+y=\lambda x,\qquad x-p=\mu y,
  \qquad |x|=|y|=1,
\end{equation}
```

*第二步：例外纤维 $x=p$。* 第一个方程给 $y=-e+\lambda p$。单位范数：$|y|^2=|e|^2-2\lambda\, e\cdot p+\lambda^2|p|^2=1+\lambda^2$（$e\cdot p=0$），为 1 强制 $\lambda=0$，得唯一临界点
```tex
  q_0=(p,-e),\qquad f(q_0)=0.
```
（验证：$y=-e$ 满足第二个方程吗？$x-p=0=\mu y$ 取 $\mu=0$，成立。$f(p,-e)=e\cdot p+(p-p)\cdot(-e)=0$。✓）

*第三步：高度分支 $x\ne p$。* 记 $t=|x-p|>0$。第二个方程给
```tex
  y=s(x-p)/t,\qquad s\in\{1,-1\}
```
（$x-p$ 与 $y$ 平行且 $|y|=1$）。代入第一个方程：
```tex
  e+y=\lambda x
  \;\Longleftrightarrow\;
  t e-s p=(\lambda t-s)x.
```
左边 $te-sp\ne0$（$t>0$，$e\perp p$ 线性无关），故 $\lambda t-s\ne0$ 且 $x$ 落在 $e,p$ 张成的平面里。写 $x=(u,0,w)$。$t$ 的定义给
```tex
  t^2=|x-p|^2=u^2+(w-1)^2=|x|^2-2w+1=2-2w
  \;\Longrightarrow\;
  w=1-\tfrac{t^2}2.
```
*第四步：切向消去 $\lambda$。* 把第一个方程与切向量 $(w,0,-u)$（它垂直于 $x=(u,0,w)$：$uw-wu=0$）作内积：
```tex
  (e+y)\cdot(w,0,-u)=\lambda\, x\cdot(w,0,-u)=0,
```
而 $y=s(x-p)/t=(su/t,\,0,\,s(w-1)/t)$，故
```tex
  w+\frac{s u}{t}=0
  \qquad\text{so}\qquad u=-s t w.
```
*第五步：一元方程与因子分解。* 单位范数条件 $u^2+w^2=1$ 代入 $u=-stw$、$w=1-t^2/2$：
```tex
\begin{equation}
\label{eq:critical-factorization}
  0=(1-t^2/2)^2(1+t^2)-1
   =\frac{t^4(t^2-3)}4.
\end{equation}
```
（展开验证：$(1-\frac{t^2}2)^2(1+t^2)=(1-t^2+\frac{t^4}4)(1+t^2)=1+\frac{t^4}4-\frac{t^6}4$，减 1 得 $\frac{t^4(1-t^2)}4$……精确地：$1+t^2-t^2-t^4+\frac{t^4}4+\frac{t^6}4-1=\frac{t^6-3t^4}4=\frac{t^4(t^2-3)}4$。✓）
因 $t>0$，得 $t=\sqrt3$、$w=-\tfrac12$、$u=s\tfrac{\sqrt3}2$。**特别注意 $x=-p$（$t=2$）被排除**——那本会是第四个候选。

*第六步：候选点与验证。*
```tex
\begin{equation}
\label{eq:other-critical-points}
  q_s=
  \left(
    \left(\frac{s\sqrt3}{2},0,-\frac12\right),
    \left(\frac12,0,-\frac{s\sqrt3}{2}\right)
  \right),
  \qquad s\in\{1,-1\}.
\end{equation}
```
两点都满足 eq:critical-multipliers，且 $\lambda=\mu=s\sqrt3$（验证 $\lambda t - s = s\sqrt3\cdot\sqrt3-s=3s-s=2s\ne0$ ✓；$y=s(x-p)/t$：$x-p=(s\sqrt3/2,0,-3/2)$，除以 $\sqrt3$ 再乘 $s$ 得 $(1/2,0,-s\sqrt3/2)$ ✓），临界值
```tex
  f(q_s)=s\,\frac{3\sqrt3}{2}.
```
（手算：$e\cdot x=u=s\sqrt3/2$；$(x-p)\cdot y=(s\sqrt3/2)(1/2)+(-3/2)(-s\sqrt3/2)=s\sqrt3/4+3s\sqrt3/4=s\sqrt3$；合计 $3s\sqrt3/2$。）

$x=p$ 与 $x\ne p$ 穷尽定义域，计数完成：恰三个临界点 $q_0,q_+,q_-$。

**(c) 假设与常数的机械性理由。**

- **为什么 $t=\sqrt3$**：它不是凑的，而是几何强制——$x$ 必须在 $e$-$p$ 平面内（第三步），又必须与 $p$ 的"纬度"协调（第四步把 $u$ 锁到 $w$），两个约束相除后只剩 eq:critical-factorization。$t=2$（对极 $x=-p$）不满足是因为那里 $w=-1$、$u=0$、切向方程 $w+su/t=-1\ne0$。
- **为什么 $f$ 的首项是 $e\cdot x$**：纯粹的 $e\cdot x+e'\cdot y$ 型双高度函数有 4 个临界点（两个球的极点组合）；耦合项 $(x-p)\cdot y$ 让"第二个球的高度方向随 $x$ 移动"，在 $t=\sqrt3$ 处把两个高度临界点**合并成一个简并临界点**（对应 $y$ 分支在 $q_\pm$ 处的 $\pm$ 选择并入同一对点）。这正是把 LS 下界 $\operatorname{cuplength}(S^2\times S^2)=3$ 实现为确切 3 个的方式。
- **乘子 $\lambda=\mu=s\sqrt3$ 的对称性**：源于 $f$ 关于 $(x,y)\mapsto$ 交换两球后再反射的结构；Lean 形式化里消元用 $\mu$ 而不是 $t$（$\mu^2=t^2$，见第三节），同一方程组。
- **不需要 Morse 性**：$q_0$ 简并（下一小节），如果只证明"存在三个 Morse 临界点"就错了——Morse 函数最少要 4 个临界点。论文的直算给出了包括退化点在内的**完整**临界集。

**(d) [推测] 候选失败路线。**

1. **[推测] 引用 Takens/Mare 的存在性定理而不显式计算。** 存在性定理给出"至少/恰有三个临界点"的抽象保证，但(a) 无法验证退化点孤立（映射到 $Q^3$ 后需要它孤立才能谈退化不动点的线性化），(b) 无法把临界点坐标转成 Lean 可检验的多项式等式。论文"without importing an existence theorem"是有意为之。
2. **[推测] 找 Morse 的三临界点函数。** 不存在：$S^2\times S^2$ 的 Betti 数为 $(1,0,2,0,1)$，Morse 不等式强迫 Morse 函数至少 $\sum b_i=4$ 个临界点。三临界点函数必然非 Morse；构造的努力方向必须容忍退化。
3. **[推测] 用更对称的函数（如 $x\cdot y$ 加高度）。** $x\cdot y$ 在 $S^2\times S^2$ 上的临界集是对角线与反对角线（连续临界流形），不能给孤立计数；加高度项后需要精心打破 $\mathrm{SO}(3)\times\mathrm{SO}(3)$ 对称到刚好留一个 $\mathbb Z/2$（$s=\pm$），否则临界流形不会坍缩成有限个点。$p$ 取北极、$e$ 取东极是最简的破缺方式。
4. **[推测] 试图把临界点数压到 2。** 与 $\operatorname{cuplength}(S^2\times S^2;\mathbb Q)=3$（类 $[S^2\times\mathrm{pt}],[\mathrm{pt}\times S^2],[\mathrm{diag}]$ 类的乘积非零，实际上 cuplength 为 3）矛盾；Takens 理论保证下界是 3。3 就是终点。

### 2.5 注记 4.2（$q_0$ 的退化性，`rem:degenerate-critical-point`）

**(a) 精确陈述（全文照录）。**
```tex
\begin{remark}
\label{rem:degenerate-critical-point}
The critical point $q_0$ is degenerate. Indeed, in local coordinates
\[
  x=(u,v,\sqrt{1-u^2-v^2}),\qquad
  y=(-\sqrt{1-a^2-b^2},a,b),
\]
the function has expansion
\[
  f=va+O\bigl(\lVert(u,v,a,b)\rVert^3\bigr).
\]
Its Hessian therefore has eigenvalues $1,-1,0,0$, so its rank is two.
The complete critical-point calculation proves that this degenerate point
is isolated. This is why a count restricted to Morse functions would not
capture the example.
\end{remark}
```

**(b) 推导要点。** 在 $q_0=(p,-e)$ 附近，$x$ 用北极附近的图卡 $(u,v)$（$x\approx(0,0,1)$），$y$ 用南极附近的图卡 $(a,b)$（$y\approx(-1,0,0)$）。展开各项：
- $e\cdot x=u$；
- $(x-p)\cdot y=(u,v,\sqrt{1-u^2-v^2}-1)\cdot(-\sqrt{1-a^2-b^2},a,b)$
  $\approx u\cdot(-1)+v\cdot a+O(\|(u,v,a,b)\|^3)$
  （第一项 $-u$ 与 $e\cdot x=u$ 相消；$\sqrt{1-u^2-v^2}-1=-\tfrac12(u^2+v^2)+\cdots$ 是二阶，乘 $-\sqrt{1-a^2-b^2}$ 是三阶；$b$ 项乘 $\sqrt{\cdot}-1$ 是三阶）。
所以 $f=va+O(\|(u,v,a,b)\|^3)$：混合二阶单项 $va$，Hessian 矩阵为
$\begin{pmatrix}0&0&0&0\\0&0&1/2\cdot 2&0\\0&1/2\cdot 2&0&0\\0&0&0&0\end{pmatrix}$ 型（$f_{va}=1$），本征值 $1,-1,0,0$，秩 2。两个零本征方向恰好对应命题 2.1 里 $m=2$ 时切空间的"未被刚性锁定"的方向。

**(c) 理由。** "The complete critical-point calculation proves that this degenerate point is isolated"——孤立性不是 Hessian 给的（Hessian 有核），而是命题 4.1 的穷尽分类给的：$q_0$ 是 $x=p$ 纤维上唯一的临界点，附近没有别的临界点可以聚过来。

**(d) [推测]。** 若在 $Q^3$ 的环境坐标里算 Hessian，会看到法向（$\partial/\partial w_0$）分量，其值依赖延拓 $K$ 的取法——结论（第五节的退化不动点）却必须与延拓无关。论文结论段的论证特意"In this argument takes place entirely in the invariant subspace $T_{q_0}F$; no assumption on the normal Hessian of the extension $K$ is needed."（见 2.8 节。）[推测] 若走"延拓后取环境 Hessian 的核"路线，法向 Hessian 可以任意（ averaging 改变法向二阶项），路线失败；只有把退化性限制在不变子空间上才鲁棒。

---

### 2.6 引理 5.1（LS 杯长下界对任意光滑函数成立，`lem:critical-bound`，03-critical-bound.tex）

**(a) 精确陈述。**
```tex
\begin{lemma}\label{lem:critical-bound}
Let $M$ be a closed smooth manifold and $r\ge1$ an integer. Suppose there are classes
$a_j\in H^{d_j}(M;\R)$, with $d_j>0$ for $1\le j\le r$, such that
$a_1\smile\cdots\smile a_r\ne0$. Then every smooth function on $M$
has at least $r+1$ critical points.
\end{lemma}
```
注意：没有 Morse 假设。现代处理参考 Weber 2019（Theorems 3.5, 3.6）；原始出处 Lusternik–Schnirelmann 1934。论文选择"give the differential-form proof"。

**(b) 证明机制逐步推导。**

反设 $h:M\to\R$ 至多 $r$ 个临界点。把**互不相同的临界值**列为 $c_1<\cdots<c_k$，$1\le k\le r$（绝对最小值与最大值都在其中——紧流形上光滑函数必取到）。固定一个黎曼度量，令 $g_t$ 为负梯度流（紧性保证完备），$P_b=\{h\le b\}$。

目标结构：**用 $k$ 个开集覆盖 $M$，每个都微分同胚于有限个坐标球的不交并**。正维数的闭形式在每个这样的集合上都恰当（Poincaré 引理逐球），于是覆盖将迫使 $k$ 个正维数类的乘积为零，与假设矛盾（$k\le r$）。

*第 1 步：每个临界值周围的"囚笼"。* 在值 $c_i$ 的临界点周围选开集 $U_i$（有限个不交坐标球之并）与更小的邻域 $V_i$（$\overline V_i\subset U_i$）。流速有界 + $M\setminus U_i$ 与 $\overline V_i$ 的正距离给 $T_i>0$：从 $U_i$ 外出发的轨道在 $0\le t\le T_i$ 内不进 $V_i$。

*第 2 步：能带参数。* 取窄能带 $\{|h-c_i|\le\delta_i\}$，窄到在 $V_i$ 之外不含临界点。在 $V_i$ 外的部分，紧性给 $|\nabla h|^2$ 的正下界 $b_i$（若该集为空，任取正 $b_i$）。选 $0<\epsilon_i<\delta_i$ 使区间 $[c_i-\epsilon_i,c_i+\epsilon_i]$ 互不相交且
```tex
  2\epsilon_i<T_i b_i.
```
沿负梯度流 $\frac{d}{dt}h(g_t(q))=-|\nabla h(g_t(q))|^2$，$P_{c_i+\epsilon_i}\setminus U_i$ 中的点要么已在 $c_i-\epsilon_i$ 之下，要么以至少 $b_i$ 的速率下降直到到达该层。于是
```tex
\begin{equation}\label{eq:sublevel-drop}
 g_{T_i}(P_{c_i+\epsilon_i}\setminus U_i)
       \subset P_{c_i-\epsilon_i}.
\end{equation}
```
*第 3 步：相邻层之间的搬运。* 对 $i>1$，再流一个固定时间 $S_i>0$ 把 $P_{c_i-\epsilon_i}$ 送进 $P_{c_{i-1}+\epsilon_{i-1}}$：这两个层之间的紧能带无临界点、梯度范数有正下界，所以有限时间足够。

*第 4 步：归纳覆盖。* $c_1$ 是绝对最小，$P_{c_1-\epsilon_1}=\varnothing$，由 eq:sublevel-drop 得 $P_{c_1+\epsilon_1}\subset U_1$。归纳地，$P_{c_i+\epsilon_i}$ 被 $U_i$ 与"$g_{T_i+S_i}$ 作用下前 $i-1$ 个上子层覆盖集的原像"覆盖；eq:sublevel-drop 保证覆盖成立。每个 $g_t$ 是微分同胚，故每个成员仍微分同胚于有限个坐标球的不交并；最上子层是全空间（$c_k$ 是绝对最大）。

*第 5 步：覆盖上的形式操作。* 覆盖记为 $O_1,\ldots,O_k$。取闭形式 $\alpha_j$ 代表 $a_j$（$1\le j\le k$——注意只用到前 $k$ 个类）。正维数 + Poincaré 引理逐球给 $\alpha_j=d\lambda_j$ 于 $O_j$。取从属于覆盖的单位分解 $\psi_1,\ldots,\psi_k$，以及光滑截断 $\chi:[0,1]\to[0,1]$：在 $[0,\tfrac1{4k}]$ 上为零、在 $[\tfrac1{2k},1]$ 上为一，令
```tex
  \rho_j=\chi(\psi_j).
```
每点处必有某个 $\psi_j\ge1/k$，于是某个 $\rho_j$ 在该点附近恒为 1。每个 $\rho_j\lambda_j$ 在 $O_j$ 外延拓为零（$\chi$ 在小值处为零保证支撑紧含于 $O_j$）。闭形式
```tex
 \alpha'_j=\alpha_j-d(\rho_j\lambda_j)
```
与 $\alpha_j$ 同类（相差恰当形式）。在每点附近至少一个 $\alpha'_j$ 恒为零（$\rho_j=1$ 处 $d(\rho_j\lambda_j)=d\lambda_j=\alpha_j$），故
```tex
 \alpha'_1\wedge\cdots\wedge\alpha'_k=0,
```
从而 $a_1\smile\cdots\smile a_k=0$，与 $a_1\smile\cdots\smile a_r\ne0$ 且 $k\le r$ 矛盾。

*技术核心点评*：$\rho_j=\chi(\psi_j)$ 这个截断是证明的枢纽。直接用 $\psi_j\lambda_j$ 不行——$d(\psi_j\lambda_j)$ 在 $\psi_j$ 变化的区域会产生不等于 $\alpha_j$ 的修正项，不能保证"逐点至少一个修正后的形式为零"。$\chi$ 把小 $\psi$ 压成恒零、大 $\psi$ 压成恒一，恰好造出**逐点的单位性**而不引入新支撑。

**(c) 假设与常数的机械性理由。**

- **$k\le r$ 而不是 $=r$**：临界值个数可能少于类数；证明只用前 $k$ 个类，乘积 $a_1\cdots a_k$ 是 $a_1\cdots a_r$ 的因子，非零性继承。
- **$2\epsilon_i<T_i b_i$**：保证流时间 $T_i$ 内至少下降 $T_ib_i>2\epsilon_i$ 层，即从 $c_i+\epsilon_i$ 降到 $c_i-\epsilon_i$ 之下。$T_i$ 来自"不进 $V_i$"的囚笼估计，$b_i$ 来自 $V_i$ 外的梯度下界；两者用 $U_i,V_i$ 的嵌套衔接"覆盖成员是球之并"与"下降不受阻"两个需求。
- **系数域 $\R$ 与 $\mathbb Q$ 的衔接**（引理之后的正文）：
```tex
Extension of coefficients $H^*(M;\mathbb Q)\to H^*(M;\R)$ is injective
for a closed manifold and respects cup products.
```
  所以引理同时给
```tex
\begin{equation}\label{eq:cup-critical}
 \operatorname{cuplength}(M;\mathbb Q)\le\Crit(M),
\end{equation}
```
（含单位元约定。）

**(d) [推测] 候选失败路线。**

1. **[推测] 用 Morse 理论（handle 分解 / Morse–Smale 链复形）证明同一结论。** Morse 途径要先把 $h$ 扰动成 Morse 函数——扰动会改变临界点个数（退化临界点分裂），"至多 $r$ 个临界点"在扰动下无控制。覆盖式证明完全避开扰动，这是它能覆盖退化情形的全部原因；Lean 形式化同样绕开扰动但走的是另一条路（见第三节：离散下降 + join 阻碍 + Haar 积分）。
2. **[推测] 直接引用 LS category 不等式 $\operatorname{cat}(M)\le\#\CritSet(h)$。** cat 的定义用可缩开集覆盖，与这里的"球之并覆盖"同源，但 cat 与杯长的联系（cat $\ge$ cuplength）本身是深层结果；论文的微分形式证明把两步合成一步，避免引用可能带 Morse 假设的二手定理。
3. **[推测] 想让覆盖成员是"可缩"而非"球之并"。** 可缩开集上闭形式不必恰当（Poincaré 引理要星形/球），必须逐坐标球做恰当化——所以 $U_i$ 一开始就取成不交坐标球之并，$g_t$ 是微分同胚这一事实保证归纳后成员保持该形状。

### 2.7 推论 5.2 与 5.3（体积阻碍与二次超曲面的临界数 = 杯长 = 4）

**推论 5.2（`cor:symplectic-critical`）原文与证明：**
```tex
\begin{corollary}\label{cor:symplectic-critical}
Every smooth function on a closed connected symplectic manifold of real
dimension $2n$, with $n\ge1$, has at least $n+1$ critical points.
\end{corollary}

\begin{proof}
The class $[\omega]^n$ is nonzero, since
$\int_M\omega^n>0$ in the symplectic orientation. Apply
Lemma~\ref{lem:critical-bound} with each $a_j=[\omega]$.
\end{proof}
```
推导链条：$\omega^n$ 是体积形式、$\int_M\omega^n>0\Rightarrow[\omega]^n\ne0$；取 $a_1=\cdots=a_n=[\omega]$，$d_j=2>0$，引理 5.1 给 $n+1$ 个临界点。这就是引言说的"symplectic volume forces every smooth function on the ambient $Q^3$ to have at least four critical points"（$n=3$）。

**推论 5.3（`cor:quadric-critical`）原文：**
```tex
\begin{corollary}\label{cor:quadric-critical}
For the quadric threefold in \eqref{eq:quadric},
\[
 \Crit(Q^3)=\operatorname{cuplength}(Q^3;\mathbb Q)=4.
\]
\end{corollary}
```

**证明机制（下界 + 上界夹逼）。**

*下界（杯长 $\ge4$）*：取超平面类 $h=c_1(\mathcal O_{Q^3}(1))\in H^2(Q^3;\mathbb Z)$。$Q^3$ 在 $\CP^4$ 中次数为 2，故
```tex
 h^3=2[\mathrm{pt}],
```
其中 $[\mathrm{pt}]$ 在基本类上取值 1。乘积在 $\mathbb Q$ 上非零，给 $\operatorname{cuplength}(Q^3;\mathbb Q)\ge4$。（次数 2 的来历：$\CP^4$ 中 $d$ 次超曲面与一般射影直线的相交数为 $d$；等价地 $h^3=\int_{Q^3}h^3=d=2$。）

*上界（$\Crit\le4$）*：取 eq:rotation-hamiltonian 的 $G_{1,2}$（速度 $a=1,b=2$ 不等速）。其临界点恰为 Hamiltonian 向量场零点；该向量场由复线性生成元
```tex
 T=\operatorname{diag}(0,J,2J),
 \qquad J=\begin{pmatrix}0&-1\\1&0\end{pmatrix}
```
在 $Q^3$ 上诱导。诱导的射影向量场在 $[z]$ 处为零当且仅当 $Tz\in\C z$。$T$ 的本征值 $0,\pm i,\pm2i$ 互异，故其射影零点是五个本征直线；零本征线 $[1:0:0:0:0]$ 不与 $Q^3$ 相遇，其余四条
```tex
 [0:1:\pm i:0:0],\qquad [0:0:0:1:\pm i]
```
都满足二次方程（$1^2+(\pm i)^2=1-1=0$ ✓）。于是 $G_{1,2}$ 在 $Q^3$ 上恰有 4 个临界点，与 eq:cup-critical 一起夹逼：
```tex
 4\le\operatorname{cuplength}(Q^3;\mathbb Q)
   \le\Crit(Q^3)\le4.
```

**机械性理由：**
- **速度 $(1,2)$**：需要 $T$ 的本征值互异（互异 $\Rightarrow$ 射影零点只有本征线，逐点检查 5 条即可）。若 $a=b$（等速），$T=\operatorname{diag}(0,J,J)$ 有重本征值，零点集含整族（固定圆环），得不到 4。且 $0$ 本征线必须不在 $Q^3$ 上（$[1:0:0:0:0]$ 满足 $1\ne0$）；若它落在 $Q^3$ 上会多出临界点。
- **$h^3=2[\mathrm{pt}]$ 用 $\mathbb Z$ 系数计算再转到 $\mathbb Q$**：整数计算干净（代数几何标准事实），有理化后与引理 5.1 的 $\R$ 系数衔接（$H^*(;\mathbb Q)\to H^*(;\R)$ 单射）。

**(d) [推测] 候选失败路线。**
1. **[推测] 试图只证杯长下界而不管 Crit 的上界。** 主定理需要 $3<4=\Crit$，必须有 $\Crit(Q^3)\le4$ 的**具体实现**（$G_{1,2}$ 的 4 个临界点）；没有实现，只能得 $\Crit\ge4$，数 3 无法与任何已知值比较。
2. **[推测] 用 Morse 函数实现上界。** $Q^3$ 的 Betti 和为 $1+0+3+0+1=5$（$H_2\cong\mathbb Z^3$），Morse 途径最少 5 个临界点；4 < 5，所以 $G_{1,2}$ 的临界点必有退化者，Morse 途径实现不了 4。这正是"临界数（允许退化）= 4 < Morse 数 = 5"的具体体现。[推测标注：Betti 数计算为外部标准结果；论文未展开。]

---

### 2.8 定理 1.1 的组装与退化性验证（05-conclusion.tex）

**组装。** 取命题 3.1 的 $(M,\omega)$ 与 Hamiltonian 对合 $A$，$F\cong S^2\times S^2$；把命题 4.1 的函数搬到 $F$（恰三个临界点）。命题 2.1 给光滑 $A$-不变延拓 $K:M\to\R$、$K|_F=f$，其 Hamiltonian 流记 $B_s$；对一切充分小 $\varepsilon>0$，
```tex
  \phi=A\circ B_\varepsilon
```
是 Hamiltonian 微分同胚且 $\Fix(\phi)=\CritSet(f)$。与推论 5.3 精确比较：
```tex
  \#\Fix(\phi)=3<4=\Crit(M)
     =\operatorname{cuplength}(M;\mathbb Q).
```

**退化性验证（逐步）。**

1. 记 $\omega_F=\omega|_F$（命题 3.1 已证它是辛形式），$X_f$ 为 $(F,\omega_F)$ 上 $f$ 的 Hamiltonian 向量场。
2. **$X_K$ 切于 $F$**：$K$ 的 $A$-不变性给出 $dA_qX_K(q)=X_K(q)$（推导：$\iota_{dA\cdot X_K}\omega=(A^*(\iota_{X_K}\omega))\circ A$-型计算 $=d(K\circ A)=dK$，辛性消拉回），而固定切空间恰是 $T_qF$（命题 3.1 的切分裂），所以 $X_K(q)\in T_qF$。
3. **限制等式**：把定义方程 $\iota_{X_K}\omega=dK$ 限制到 $TF$ 上得 $X_K|_F=X_f$（$\omega_F=\omega|_F$、$K|_F=f$，切方向上两对相同）。
4. **$B_s$ 保持 $F$**：$X_K$ 切于 $F$，$F$ 是闭子流形，轨道不离开。
5. **线性化在本征核上为恒等**：在注记 4.2 的临界点 $q_0$ 处，对 $\iota_{X_f}\omega_F=df$ 求微分：
```tex
  \omega_F\bigl(DX_f(q_0)v,w\bigr)
  =\operatorname{Hess}_{q_0}f(v,w).
```
   （辛非退化把 Hessian 与 $DX_f$ 等同。）于是 Hessian 核中任何非零 $v$ 满足 $DX_f(q_0)v=0$。
6. **特征值 1**：$A|_F=\id$ 且 $q_0$ 是平衡点，所以
```tex
  d\phi_{q_0}v
   =\exp\bigl(\varepsilon DX_f(q_0)\bigr)v
   =v.
```
   不动点 $q_0$ 的线性化有本征值 1，即退化。
7. **与延拓无关**：整段论证只在不变子空间 $T_{q_0}F$ 内进行；"no assumption on the normal Hessian of the extension $K$ is needed"。

**(c) 理由。**
- **$\varepsilon$ 的存在性到具体值的差异**：命题 2.1 只说"sufficiently small"；组装不需要显式值（Lean 形式化则给出了显式 $\varepsilon=1/(100(C+1))$，见第三、四节）。
- **为什么退化性传递这么干净**：$q_0$ 的退化方向在 $T_{q_0}F$ 内，而 $A$ 在 $T_{q_0}F$ 上是恒等、$B_\varepsilon$ 在 $q_0$ 的线性化是 $DX_f$ 的指数——两个因子各自"平凡"，其乘积在核方向上必为恒等。任何把退化方向放到法向的方案（见 2.5 节 [推测]）都会被延拓的任意性破坏。

**(d) [推测] 候选失败路线。**
1. **[推测] 担心 $B_\varepsilon$ 不保持 $F$。** 若 $X_K$ 只有在 $F$ 上切于 $F$、在附近不切，则 $B_s(F)\not\subset F$，第 4 步失效。但第 2 步证的是**每一点**的 $X_K$ 值落在固定切空间里——因为 $A$-不变性在每点成立，不是只在 $F$ 上。关键是 $X_K$ 切于 $F$ 是"切于固定点集"这个更强的事实。
2. **[推测] 想通过 $d\phi_{q_0}$ 的完整谱（含法向）来证退化。** 法向块形依赖 $K$ 的法向 Hessian，不可控；只在 $T_{q_0}F$ 内找一个本征值 1 的方向既充分又鲁棒。Lean 的 `HasDegenerateFixedPoint` 定义（商切向的本征向量，模去竖直方向 $i\cdot z$）正是这一"鲁棒版退化"的形式化（见第三节 3.9）。

---

## 三、Lean 取证

本节约占素材四成权重。Lean 形式化是本论文权重最高的取证材料：36 个文件、共约 5841 行，全部无 `sorry`、无新增公理声明；挑战配置 `ArnoldCounterexample.json` 规定：

```json
{
  "challenge_module": "ComparatorChallenges.ArnoldCounterexample",
  "solution_module": "OAI.Geometry.Arnold.Main",
  "theorem_names": ["OAI.ArnoldCounterexample.main"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false
}
```
`formalization.yaml` 第 926–928 行附近登记条目：
```yaml
    - comparator_config: ComparatorChallenges/ArnoldCounterexample.json
      declaration: OAI.ArnoldCounterexample.main
      file: OAI/Geometry/Arnold/Main.lean
```
permitted axioms 是 Mathlib 的三个标准公理（命题外延、商的可靠性、选择公理）。形式化中确实用到 `Classical.choice`：`project_surjective` 给每个射影点选取单位代表元（`unitRepresentative`、`descend` 都依赖它）；`Quot.sound` 源于 Mathlib 的 `Projectivization`（射影空间按 $\C^5\setminus\{0\}$ 的数乘商构造）。

### 3.1 依赖链总览

36 个文件构成**单条线性链**（无分叉，每文件只 import 链上前一个）：

```
Model → Involution → Projective → Rotation → Tangent → Haar → Differentiation
      → Orbit → Symplectic → Coordinates → Extension → Descent → Deformation
      → Exterior → Homotopy → Volume → Obstruction → ThreePoints → Sphere
      → Hessian → Factors → Field → CompactField → Midpoint → MidpointGeometry
      → Parameter → FieldAlgebra → Quotient → Hamiltonian → FixedPoints
      → CriticalLifts → FixedCount → MidpointDerivative → Kernel → Degeneracy
      → Main
```

值得注意：这条链实际上是**两条子链的交织**（线性 import 只是把两个独立主题串起来省文件数）：

- **下界子链**（对应论文第三节临界数 $\ge4$）：Haar → Differentiation → Orbit → Symplectic → Coordinates → Extension → Descent → Deformation → Exterior → Homotopy → Volume → Obstruction（终点定理 `no_unit_equivariant_map`、`four_le_criticalNumber`）。
- **构造子链**（对应论文第二、四、六节，即反例本身）：Model → Involution → Projective → Rotation（对合与 Hamiltonian 道路）与 ThreePoints → Sphere → Hessian → Factors → Field → … → Degeneracy（三临界点函数、延拓 $K$ 的显式 Hamiltonian、不动点集、退化点）。

Main.lean 最终定理（照录）：
```lean
theorem main :
    ∃ φ : Q3 ≃ Q3, IsHamiltonian φ ∧ (fixedSet φ).encard = 3 ∧
      (3 : ℕ∞) < 4 ∧ 4 ≤ criticalNumber ∧ HasDegenerateFixedPoint φ := by
  exact ⟨Construction.mainEquiv, Construction.main_isHamiltonian,
    Construction.main_fixed_encard, by norm_num, four_le_criticalNumber,
    Construction.main_degenerate⟩
```
五个合取项分别对应：(1) 反例映射；(2) 它是 Hamiltonian 的；(3) 不动点集基数恰 3；(4) $3<4\le$ 临界数；(5) 有退化不动点。

### 3.2 Model.lean——把"无流形库"的辛几何编码进原始类型

形式化**完全不用** Mathlib 的流形/辛几何库。`Q3` 定义为字面射影二次超曲面：
```lean
abbrev CV := Fin 5 → ℂ
def quadricPolynomial (z : CV) : ℂ := ∑ j, z j ^ 2
def normSquared (z : CV) : ℝ := ∑ j, Complex.normSq (z j)
def IsUnitQuadric (z : CV) : Prop := normSquared z = 1 ∧ quadricPolynomial z = 0
def Q3 := {q : Projectivization ℂ CV //
  ∃ (z : CV) (hz : z ≠ 0), Projectivization.mk ℂ z hz = q ∧ quadricPolynomial z = 0}
```
关键编码决定：

1. **光滑性走"局部提升"**：`SmoothFunction` 结构 = 一个函数 `toFun : Q3 → ℝ` 加上"在每个单位迷向点附近有光滑局部提升 `LocalFunctionLift h z U g`"（$g$ 在开集 $U\subset\C^5$ 上 $C^\infty$ 且在 $U\cap$ 锥上等于 $h\circ\text{project}$）。`IsCritical` 定义为"**对一切**局部提升、一切水平切向量，$fderiv\ g\ z\ v=0$"——这与论文"临界性不依赖延拓"的直觉一致，且让法向行为完全无关。
2. **切向量走"水平条件"**：`Horizontal z v := (∑ star z v = 0) ∧ (∑ z v = 0)`，即论文里的 $T_{[z]}Q^3$ 的两个复线性约束（$\bar z\cdot v=0$ 与 $z\cdot v=0$，后者是二次型的切条件）。
3. **辛形式带因子 2 的归一化**：`omega v w := 2 * (∑ j, star (v j) * w j).im`——与论文 2.3 节 $d\alpha(v,iv)=2|v|^2$ 的归一化精确对应。
4. **临界数允许无穷**：`criticalNumber : ℕ∞ := ⨅ h : SmoothFunction, (criticalSet h).encard`，用扩展自然数容纳"没有临界点的病态"（虽然 `criticalSet_nonempty` 证明不会发生——全局最小值必临界，见 Tangent.lean）。
5. **Hamiltonian 道路是显式数据结构**（这是全文最重的编码决定）：
```lean
structure HamiltonianPath (φ : Q3 ≃ Q3) where
  forward : ℝ × CV → CV
  backward : ℝ × CV → CV
  hamiltonian : ℝ × CV → ℝ
  forward_smooth / backward_smooth / hamiltonian_smooth : ContDiff ℝ ∞ …
  forward_preserves / backward_preserves : 锥不变
  forward_phase / backward_phase / hamiltonian_phase : 相位等变（模 C 乘法）
  left_inverse / right_inverse : 互逆
  start : forward (0, z) = z
  finish : project ⟨forward (1,z), …⟩ = φ (project z)
  equation : omega (deriv forward t) v = fderiv (fun w => hamiltonian (t,w)) (forward (t,z)) v
```
`equation` 域就是论文约定 $\iota_{X_{H_t}}\omega=dH_t$ 的逐点版本（在水平提升上检验）。`IsHamiltonian φ := Nonempty (HamiltonianPath φ)`。
6. **退化不动点的"商切向"定义**：
```lean
def HasDegenerateFixedPoint (φ : Q3 ≃ Q3) : Prop :=
  ∃ (z : UnitQuadric) (v : CV), φ (project z) = project z ∧ v ≠ 0 ∧
    Horizontal z v ∧ ∃ (U : Set CV) (G : CV → CV), … G z = z ∧ … ∧
    ∃ a : ℝ, fderiv ℝ G z v - v = a • (Complex.I • (z : CV))
```
注释原文："Eigenvalue 1 in the derivative on the quotient tangent, not an ambient spurious vertical eigenvector."——本征 1 必须出现在**商切向**（模去复数乘法产生的竖直方向 $i\cdot z$），防止把"提升 $G$ 沿竖直方向移动"误判为退化。这与论文 2.8 节"只在 $T_{q_0}F$ 内找本征值 1"的鲁棒化完全平行，且更严格（竖直方向不仅无用还必须显式商掉）。

### 3.3 对合与旋转（Involution / Projective / Rotation）

- `involutionLinear`：$z_0$ 保号、其余变号的复线性等价；`involution` 是它在 `Q3` 上的射影作用（`Projectivization.map`）。`involution_fixed_project_iff`：`involution (project z) = project z ↔ z 0 = 0`——论文"$+1$ 本征线 $[1:0:0:0:0]$ 不在 $M$ 上，故固定集在 $z_0=0$ 内"的代数化。证明细节值得记录：正向推出时若 $z_0\ne0$ 则强制 $a=1$ 且其余坐标全零，于是二次多项式 $=(z_0)^2\ne0$ 矛盾（`linear_combination (1/2) * hh` 完成消元）。
- `Projective.lean` 的基础设施：`project_surjective`（每个射影点有单位迷向代表元，用 `Real.sqrt(normSquared)⁻¹` 缩放）、`omega_horizontal_nondegenerate`（水平形式非退化：$\omega(v,iv)=2\|v\|^2$，由 `omega_I`）、`localSection z v := z + v - (quadricPolynomial v / 2) • star z`——**一个多项式截口**，把任意水平向量实现为单位锥上的真实曲线（`tangentCurve`，经 `normalize` 归一化），从而 `tangentCurve_hasDerivAt_zero`：每个声明的水平切向量都被锥中一条可微曲线以速度 $v$ 实现。这是"切空间 = 水平约束的核"与"真实曲线导数"之间的桥，论文正文里这一步是隐含的（图卡即得），Lean 里必须显式构造——**这是典型的"论文一句带过、Lean 必须展开"的点**。
- `horizontal_finrank`：核的复维数 = 3（`tangentConstraint z` 是到 $\C\times\C$ 的满射，秩-零化度），实维数 = 6（`horizontal_finrank_real`）。这形式化了"$Q^3$ 实维六"。
- `Rotation.lean`：`rotation c s z` 同时旋转 $(z_1,z_2)$ 与 $(z_3,z_4)$ 平面（对应论文 $\Phi_t^{a,b}$ 的 $a=b$ 情形；论文中不等速 $G_{1,2}$ 在 Lean 里**没有**形式化——见 3.12 的差异清单）。`rotationPath p = rotation (cos πt) (sin πt) z`，时刻 1 恰为对合：`rotationPath_finish : rotationPath (1, z) = involutionLinear z`。生成元与 Hamiltonian：
```lean
def rotationGenerator (z : CV) : CV :=
  ![0, -(Real.pi : ℂ) * z 2, (Real.pi : ℂ) * z 1,
    -(Real.pi : ℂ) * z 4, (Real.pi : ℂ) * z 3]
def rotationHamiltonian (z : CV) : ℝ :=
  2 * Real.pi * ((z 1).re * (z 2).im - (z 1).im * (z 2).re +
    (z 3).re * (z 4).im - (z 3).im * (z 4).re)
```
注释："Minus alpha(Z), exactly the sign convention i_X omega = dH."——正是论文 eq:rotation-hamiltonian 在 $a=b=\pi$、分母为 1（单位锥）时的形式。`rotationHamiltonian_equation : omega (rotationGenerator z) v = fderiv rotationHamiltonian z v` 逐点验证。
- 顶点定理：`involutionHamiltonianPath : HamiltonianPath involution`——注释 "A complete explicit Hamiltonian witness for the actual quadric involution. No flow existence, moment-map theorem, or descent theorem is assumed."（对合的 Hamiltonian 性不依赖流存在性定理或矩映射定理。）

### 3.4 桥接手法一：Hamiltonian 流 → 隐式中点映射（Midpoint / MidpointGeometry / Parameter）

这是形式化与论文差异最大、也最能暴露"真实证明难点"的地方。**论文的 $B_s$ 是 Hamiltonian 向量场的流——其存在性依赖 ODE 理论（Picard–Lindelöf / 流形上的流定理），Mathlib 没有可直接用的"流形上的 Hamiltonian 流"设施。Lean 的替换**：

1. ** resolvent（隐式中点的半步）**：对 Lipschitz 常数 $C$ 的向量场 $X$ 与小步长 $\tau(t)$（满足 $\|\tau\|\cdot C<1$），定义
```lean
def resolvent … : E := (contraction X hX (τ p.1) p.2 …).fixedPoint (fun u ↦ p.2 + τ p.1 • X u)
```
即 $u=z+\tau X(u)$ 的**唯一不动点**（Banach 压缩）。`step = 2•resolvent - z`，即隐式中点法的整步：
$z \mapsto y$ 满足 $y=2u-z$、$u=\frac{z+y}2$、$u=z+\tau X(u)$。
2. **step 是光滑微分同胚**：`resolvent_smooth` 用 Mathlib 的隐函数定理（`contDiffAt_implicitFunction`），可逆性来自 $\|τ\,dX\|<1$（`isUnit_one_sub_of_norm_lt_one`）；`step_inverse`：用 $-\tau$ 的 step 恰好把 step 打回去（`resolvent_step` 验证 $R_{-\tau}(y)=u$）。**不需要任何流存在定理**。
3. **step 精确保持锥与二次曲面**（这是最漂亮的引理，`MidpointGeometry.quadratic_skew`）：若 $v$ 在 $z$ 处 `SkewAt`（即 $\operatorname{Re}\bar z\cdot v=0$ 且 $z\cdot v=0$，也就是 $v$ 同时切于球面与二次锥——`vectorField_skew` 证明向量场处处 SkewAt），则
```lean
normSquared (z+s•v) = normSquared z + s^2 * normSquared v ∧
quadricPolynomial (z+s•v) = quadricPolynomial z + (s:ℂ)^2 * quadricPolynomial v
```
于是对中点 $u$ 与步长 $\tau$：`center_quadratic : normSquared p.2 = normSquared u + τ² normSquared (vectorField u)`，且 step 端点 $u+\tau X(u)$ 的 normSquared/quadricPolynomial 与 $z$ 相同（$s^2$ 项相消）——**离散的守恒律**，替代了"流保持能量面"。`midpoint_preserves : IsUnitQuadric (step (t,z))`。
4. **Hamiltonian 方程对中点法精确成立**（`Midpoint.step_hamiltonian_equation`）：定义 `hamiltonian X … K p := (2 * deriv τ p.1) * K (resolvent X … (-τ) p)`，则
```lean
σ (deriv (fun t ↦ step (t,p.2)) p.1) v = fderiv (fun w ↦ hamiltonian (p.1,w)) (step p) v
```
其中 $\sigma$ 是辛形式（反对称双线性型）。证明要点（`hamiltonian_linearization`）：由 $\sigma(X(\cdot))=dK(\cdot)$ 在 $u$ 附近成立，取二阶导的对称性得 $\sigma(dX_u a, b) = -\sigma(a, dX_u b)$；把 resolvent 的微分方程（`resolvent_fderiv_equation`）与逆 resolvent 的微分方程联立消元，得 $\sigma A v = \tau'\cdot\sigma(X(u)) B$，两边乘 2 即所求。**中点法的"修正 Hamiltonian" $2\tau' K\circ R_{-\tau}$ 精确满足 Hamiltonian 方程——离散化在这里不是近似，而是严格**。这就把论文的 "$B_s$ is its Hamiltonian flow" 替换成显式的、可验证的 Hamiltonian 道路。
5. **具体参数**（Parameter.lean，命名空间 `ArnoldCounterexample.Construction`）：
```lean
def constant : ℝ≥0 := vectorField_lipschitz.choose      -- vectorField 的 Lipschitz 常数
def epsilon : ℝ := 1 / (100 * ((constant:ℝ)+1))
def parameter (t : ℝ) : ℝ := epsilon * Real.sin (Real.pi * t / 2)
```
`parameter 0 = 0`（起步为恒等）、`parameter 1 = epsilon`（终步 $\varepsilon$）、`parameter_small : ‖parameter t‖ * constant < 1/10`。中心 $u$ 的两个范数界：`center_norm_le_one`（$\le1$）与 `center_norm_gt_half`（$>1/2$，用 $\|\tau\|C<1/10$ 与 $\|vectorField\|\le C$、$\text{normSquared}(X)\le5C^2$ 估计）——$1/2$ 这个数的作用是保证 $u$ 落在 `normSquared < 4` 的区域内，从而截断 `cutoff` 为 1、`vectorField_hamiltonian`（局部等于 core 的 Hamiltonian 方程）适用。
6. **复合顺序**：`forward p := rotationPath (p.1, forwardMid p)`，即 $t$ 时刻先走中点步（$B$ 的替代）再走旋转（$A$）；`backward` 是逆。与论文 $\phi_\varepsilon=A\circ B_\varepsilon$ 完全同序。最终 `mainEquiv := descendEquiv (forward 1) (backward 1) …`——通过商下降（Quotient.lean 的 `descendEquiv`，需要相位等变性 `forward_phase` 等）得到 $Q3\to Q3$ 的双射。`Hamiltonian.lean` 组装出 `mainHamiltonianPath : HamiltonianPath mainEquiv`，其中 Hamiltonian 函数为
```lean
def hamiltonian (p : ℝ × CV) : ℝ := rotationHamiltonian p.2 + midHamiltonian (p.1, rotationPath (-p.1, p.2))
```
（对合部分与中点部分的生成函数相加；中点部分被逆旋转共轭回 $t$ 时刻的坐标系——对应论文 $L_t$ 分段构造的后半段 $H_{a(2t-1)}\circ$ 拉回。`forward_equation` 用 `rotationPath_pullback`（旋转保 $\omega$ 的伴随版本）与 `mid_equation` 拼出完整方程。）

### 3.5 桥接手法二：LS 杯积 → Haar 积分 + join 阻碍（Haar / Differentiation / Orbit / Symplectic / Coordinates / Extension / Descent / Deformation / Exterior / Homotopy / Volume / Obstruction）

论文引理 5.1 的证明（负梯度流覆盖 + 单位分解截断 + Poincaré 引理）在 Lean 里**整个被替换**。替换后的数学结构是一个"显式 Hopf 型阻碍"：

**（i）O(5) 与 Haar 测度**（Haar.lean）：
```lean
abbrev RM := Matrix (Fin 5) (Fin 5) ℝ
abbrev O5 := Matrix.orthogonalGroup (Fin 5) ℝ
theorem isCompact_orthogonalGroup : IsCompact …   -- Heine–Borel：元素绝对值 ≤ 1 的闭子集
def haar : Measure O5 := (Measure.haar : Measure O5).inv   -- 右不变 Haar 测度
```
核心引理 `integral_extDeriv_rightMul_eq_zero`：对紧群上 $C^\infty$ 函数 $f$ 与斜对称矩阵 $X$，
```lean
∫ A : O5, fderiv ℝ f (A:RM) ((A:RM) * X) ∂haar = 0
```
证明路径：参数积分的微分（`hasDerivAt_integral_of_compact`，紧性给控制函数）+ 右平移不变性 `integral_mul_right_eq_self`（被积函数 $\int f(g\cdot c(s))\,d\mu$ 与 $s$ 无关）+ 两导数相等。注释原文："The integral of a smooth infinitesimal right-translation is zero. Unlike a manifold Stokes interface, this is proved directly from Haar invariance and differentiation under a finite integral."——**这就是"LS 杯积 → Haar 积分替换"的确切位置**。
再往上一层，`integral_extDeriv_rightMul_eq_zero` 的外微分版 `Differentiation.integral_extDeriv_rightMul_eq_zero`：对由左不变场张成的 $n+1$ 元组、满足"括号方向基本性"（vertical condition，纯点态代数条件）的形式 $W$，$\int \mathrm{extDeriv}\,W\,(A\cdot X_i)\,d\mu=0$——Haar 版的 Stokes。

**（ii）轨道映射代替流形**（Orbit.lean）：取基点
```lean
def baseScale : ℝ := Real.sqrt (1 / 2)
def base : CV := ![(baseScale : ℂ), baseScale * Complex.I, 0, 0, 0]
```
（单位迷向向量：$\frac12+\frac12=1$，$z_0^2+z_1^2=\frac12-\frac12=0$）。`orbitProjection : RM →L[ℝ] CV := A ↦ act A base` 把 $O(5)$ 的李代数方向铺满单位迷向锥（$O(5)$ 保 Hermitian 内积与复双线性型，轨道 = $\{$normSq $=1$、二次型 $=0\}$）。六 个斜生成元
```lean
def generators : Fin 6 → RM := ![rotGen 0 2, rotGen 1 2, rotGen 0 3, rotGen 1 3, rotGen 0 4, rotGen 1 4]
def velocities : Fin 6 → CV := …（generators 在 base 处的值）
```
（`rotGen a b = E_{ba} - E_{ab}`，坐标平面旋转的生成元。）关键的代数事实：
```lean
def bracketCoefficient : Matrix (Fin 6) (Fin 6) ℝ :=
  !![0, -1, 0, 0, 0, 0; 1, 0, …; …]   -- 三个 2×2 反对称块
lemma generators_bracket_base : act ([gen i, gen j]) base = bracketCoefficient i j • (Complex.I • base)
```
——**括号方向恰好落在圆纤维方向 $i\cdot\text{base}$ 上**（轨道映射的纤维是圆，$O(5)/O(3)\cong V_2(\R^5)$ 的结构以这种坐标形式出现）。
`omega_act`（$O(5)$ 保 $\omega$）、`symplectic_velocities`（$\omega(v_i,v_j)=\pm1$ 于 $(0,1),(2,3),(4,5)$ 三对、其余 0）、`cubeForm_velocities : cubeForm (symplectic 5) velocities = 48`——**$\omega^3$ 在六个铺开方向上的值是常数 48**（= $3!\times2^3$，因子 3! 来自楔积的排列和、$2^3$ 来自 $\omega$ 归一化的因子 2；逐项对照 `squareForm_apply : squareForm B v = 8 * (B01·B23 − B02·B13 + B03·B12)`）。

**（iii）阻碍定理本体**（Obstruction.lean `no_unit_equivariant_map`）：
```lean
theorem no_unit_equivariant_map (F : CV → CSpace 3) (hF : ContDiff ℝ ∞ F)
    (hunit : ∀ z : UnitQuadric, normSq 3 (F z) = 1)
    (hphase : ∀ z : UnitQuadric, ∀ a : ℂ, normSq a = 1 → F (a • z) = a • F z) : False
```
陈述："there is no smooth circle-equivariant map from the literal unit isotropic cone in C5 into the unit sphere in C3. The obstruction is the nonzero third symplectic power." 证明：
1. 构造 join 同伦 `joinHomotopy F (t,A) := (cos t • orbitProjection A, sin t • F (orbitProjection A))`——$S^5$（锥的轨道）与 $F$ 的像（$S^3\subset\C^3$ 的球面，由 `normalize_cover_map` 保证 `normSq 3 (F z) = 1`）的标准 join；`productNormSq = normSq 5 + normSq 3` 在其上恒 1。
2. 取 $\Theta = $ `cubeForm productSymplectic ∘ fderiv(joinHomotopy)`（6 维积空间的 $\Omega^3$ 的立方，拉回）。`pullback_constant_closed`：常值形式的拉回闭。
3. **竖直方向的基本性**（`joinHomotopy_bracket`）：括号方向导数 $=$ `bracketCoefficient i j • (i • joinHomotopy)`——用 `fderiv_circle_equivariant`（对圆等变映射求微分得到 $dF(i z) = i\,dF(z)$，注释 "Differentiating honest circle equivariance, rather than assuming its infinitesimal consequence"）；再配合 `joinHomotopy_time_tangent`（时间方向切于单位球面：$\Omega(i\,\Theta,\partial_t\Theta)=0$，由 `productNormSq_curve_orthogonal`）与 `joinHomotopy_spatial_tangent`（右不变场方向同理），用 `cubeForm_second_radical_on`（$\omega^3$ 在"一个输入位于其余输入张成空间的双线性零化子"里时为零）逐一压零。
4. **Haar 同伦不变性**（Volume.lean `haar_homotopy_invariant`）：闭 + 基本 $\Rightarrow$ $\int_A \Theta(t,A)(0,A\cdot gen_i)\,d\mu$ 与 $t$ 无关（cylinder 同伦恒等式 `cylinder_homotopy_identity`：切片外微分的时导数 = 时间方向的收缩，Homotopy.lean）。
5. **两端取值**：$t=0$ 时 $\cos 0=1,\sin 0=0$，像在 $\C^5$ 因子，值 = `cubeForm_orbit = 48`；$t=\pi/2$ 时像在 $\C^3$ 因子，而 `six_form_vanishes_on_unit_sphere`：$\C^3\cong\R^6$ 的单位球面上切于 $d(\text{normSq})$ 核的六个向量线性相关（核维数 5 < 6），交错形式上为零。于是 $48\cdot\mu(\mathrm{univ})=0$，与 `haar_mass_pos`（Haar 全测度 $>0$）矛盾。

**（iv）从"临界点 $\le3$"到"等变映射 $F$"**（Deformation / Descent / Extension / Coordinates）：
- `Extension.global_extension`：紧集上的局部光滑延拓拼成全局 $C^\infty$ 延拓（单位分解 + `exists_contDiff_tsupport_subset` 有限子覆盖 + 用一个正 bump $\delta$ 把分母 $S+\delta$ 抬成正——论文没有对应物，因为论文不需要把"提升到锥上的函数"整体延拓）。
- `Descent.adaptive_step`：**离散下降步长的自适应选取**——对紧集 $K$、$C^\infty$ 的 $\Phi(t,z)=G(\text{gradientCurve}(t,z))$、非负连续 $S=$ 梯度平方和，存在 $c=(2(|B|+|M|+1))^{-1}>0$（$B$ 上界 $S$、$M$ 上界二阶导）使 $\Phi(c\,S(z),z)\le\Phi(0,z)$ 且 $S\ne0$ 时严格小于。注释："It works even when $S$ vanishes to arbitrarily high order."——**退化临界点不需要非退化性**。
- `Descent.critical_level_cover`：**有限临界值的 LS 覆盖，纯组合化**。对有限集 $s$（临界值）作强归纳：每次擦掉最大值 $c$，(a) 紧带 $\{f\le c,\ell=0\}$ 上的最大值下降给 $d<c$；(b) `thicken_sublevel` 把严格不等式加厚 $\varepsilon$；(c) `uniform_drop`（Lyapunov 函数在无驻点紧带上的均匀穿带时间：取最小严格下降量 $\delta=f(z)-f(Dz)$，$N>(b-a)/\delta$ 次迭代必穿过）把 $\{f\le a\}$ 的点 $N$ 步打到 $c+\varepsilon$ 之下。产出 `T : Finset ℕ`，$|T|\le|s|$，使每个点经某次 $D^n$ 迭代后坐标 $\ell\circ D^n\ne0$。**这就是论文引理 5.1 的"覆盖 $M$ 用 $k$ 个开集"的 Lean 版**，但覆盖成员不再是球之并，而是"第 $n_i$ 次下降迭代后某线性坐标不为零"的集合。
- `Deformation.cover_map`：把上述覆盖组装成相位等变、处处非零的 $F:\C^5\to\C^3$（三个坐标 $\ell\circ D^{n_i}$ 经嵌入 $T\hookrightarrow\mathrm{Fin}\ 3$）；`normalize_cover_map` 归一化到 `normSq 3 (F z) = 1`（分母正性在锥外由补集 bump $\delta$ 保证，注释 "The positive complement bump prevents spurious singularities off K"）。
- `Deformation.exists_smooth_descent`：**梯度流的替代**——`gradientCurve G (t,z) := matrixAction (exp(t • negativeRotationMatrix G z)) z`，其中 `negativeRotationMatrix G z = -(∑_{a,b} rotationDerivative G a b z • rotGen a b)` 是把负梯度展开到 25 个斜生成元上的矩阵，`NormedSpace.exp` 是矩阵指数。正交群作用保持锥（`gradientCurve_preserves`），Lyapunov 导数 `gradientCurve_lyapunov_derivative : fderiv (fun p ↦ G (gradientCurve G p)) (0,z) (1,0) = -gradientSquare G z`。注释："This supplies the deformation step for arbitrary smooth functions, including highly degenerate ones, without assuming an ODE existence theorem."——**负梯度流（ODE）被"斜矩阵指数（ Lie 代数单参子群）"替换**，因为矩阵指数在 Mathlib 里现成（`NormedSpace.exp`），而一般向量场的流不存在现成设施。`Coordinates.horizontal_derivative_of_rotation_zero`：25 个旋转导数全零 $\Rightarrow$ 一切水平方向导数为零（用 `tangentMatrix z v := fun i j ↦ 2*(v i * star z j - z i * star v j).re` 把水平向量提升为斜矩阵，`skew_rotation_sum : ∑ M_ba rotGen a b = 2M`）——这一步把"临界性"从生成元坐标换回内在水平切空间。

**下界终点**（Obstruction.lean 末尾）：
```lean
theorem four_le_criticalSet (h : SmoothFunction) : 4 ≤ (criticalSet h).encard := by
  by_contra hn
  … cover_map h (encard ≤ 3) → normalize_cover_map → no_unit_equivariant_map
theorem four_le_criticalNumber : 4 ≤ criticalNumber := le_iInf four_le_criticalSet
```

### 3.6 三临界点函数与球面乘积（ThreePoints / Sphere / Hessian）

- `ThreePoints.f`：论文 eq:three-point-function 的坐标化：
```lean
def f (q : Pair) : ℝ :=
  q.1 0 + q.1 0 * q.2 0 + q.1 1 * q.2 1 + (q.1 2 - 1) * q.2 2
```
（$e\cdot x=x_0$；$(x-p)\cdot y=x_0y_0+x_1y_1+(x_2-1)y_2$。）`pole = ![0,0,1]`、`east = ![1,0,0]`。三个临界点：
```lean
def qzero : Pair := (pole, -east)
def qplus : Pair := (![Real.sqrt 3 / 2, 0, -1/2], ![1/2, 0, -Real.sqrt 3 / 2])
def qminus : Pair := (![-Real.sqrt 3 / 2, 0, -1/2], ![1/2, 0, Real.sqrt 3 / 2])
```
- 核心消元引理 `classify_coordinates`：由乘子方程（8 个标量等式）推出
```lean
(x₀=0 ∧ x₁=0 ∧ x₂=1 ∧ y₀=-1 ∧ y₁=0 ∧ y₂=0) ∨
(μ^2 = 3 ∧ x₀ = μ/2 ∧ x₁ = 0 ∧ x₂ = -1/2 ∧ y₀ = 1/2 ∧ y₁ = 0 ∧ y₂ = -μ/2)
```
Lean 注释原文：**"We eliminate using μ instead of t=|x-p|; μ²=t², so the remaining factor is μ²=3."**——论文用 $t=|x-p|$ 消元（得 $t^4(t^2-3)/4=0$），Lean 用 $\mu$ 直接消元（得 $\mu^2=3$），同一方程组的两种消元次序；$\mu=0$ 的分支恰好是 $q_0$（$x=p$）。消元的中间恒等式值得抄录（证明里的 `hn` 与 `hdot`）：
  - $\mu^2(y_0^2+y_1^2+y_2^2-1)+\mu(\mu+2y_2)=x_0^2+x_1^2+x_2^2-1$（代入 $x=\mu y$ 型关系后恒等），由 $|x|=|y|=1$ 得 $\mu+2y_2=0$（$\mu\ne0$ 分支），即 $y_2=-\mu/2$；
  - $y_0+1=\lambda(\mu+y_2)$（用 $|y|=1$ 把 $y_0+1$ 写成 $(1+y_0)\cdot y$ 的球面恒等式再代入乘子）；
  - $(\lambda\mu)(2y_0-1)=0$，$\lambda\ne0$，故 $y_0=1/2$；代回 $|y|=1$ 得 $\mu^2=3$。
  这与论文 2.4 节第五步的 $t^4(t^2-3)/4$ 分解是同一约束的两种代数面。
- 乘子存在性不是假设而是**证明的**：`annihilator_sphere`——"The elementary tangent-annihilator lemma supplies (rather than assumes) the Lagrange multipliers"：切于球面的向量都垂直于 $a$ 当且仅当 $a=\lambda x$（构造 $u=a-(x\cdot a)x$，正交性给 $u\perp u$ 故 $u=0$）。`tangentCritical_iff_multiplierCritical` 把"切向临界"（$df$ 在两球切空间上为零）与"乘子临界"等价。
- `multiplierCritical_encard = 3`：`{qzero, qplus, qminus}` 三点互异（`qzero_ne_qplus` 等比较分量），注释 "A finite cardinality assertion, not ncard's default zero for infinite sets."
- `Sphere.lean`：把 $\R^3$ 坐标下的函数搬到 Mathlib 的真实球面流形 $S^2=\text{Metric.sphere }(0:E3)\ 1$（`EuclideanSpace ℝ (Fin 3)`）。这一段是**把切空间约束换回流形语言**的桥：`sphereEmbedDeriv_range`（嵌入导数的像 = 正交补，引 `range_mvfderiv_subtypeVal`）、`sphereF_mfderiv`（流形导数 = $df$ 经嵌入导数分解）、最终
```lean
theorem sphereF_critical_encard :
    {q : S2 × S2 | mfderiv ((𝓡 2).prod (𝓡 2)) 𝓘(ℝ, ℝ) sphereF q = 0}.encard = 3
```
（单射原像计数 `Set.encard_preimage_of_injective_subset_range`。）这是形式化中少数真正动用 Mathlib 流形工具（`ContMDiff`、`mfderiv`）的地方。
- `Hessian.lean`：环境 Hessian `ambientHessian r s = r.2 ⬝ᵥ s.1 + r.1 ⬝ᵥ s.2`（$f$ 是二次型 + 线性型，$d(df)=\text{ambientHessian}$），$q_0$ 处切向 Hessian $=r_1s_2'+r_2's_1$ 型（`hessian_tangentCoordinates : … = w 1 * z 2 + w 2 * z 1`，即 $va+av'$），核由 `tangent_hessian_kernel` 刻画（$w_1=0\wedge w_2=0$）。退化向量显式给出 `r = (east, 0)`：`qzero_degenerate_hessian : ∃ r, r ≠ 0 ∧ IsTangent qzero r ∧ ∀ s, Hessian(q0)(r,s)=0`。对应论文 Remark 4.2 的本征值 $1,-1,0,0$（Lean 只需"存在核中非零切向量"，不必算全谱）。

### 3.7 延拓 $K$ 的显式构造：自对偶/反自对偶矩坐标（Factors / Field / CompactField / FieldAlgebra）

论文的 $K$ 是平均延拓（存在性）；Lean 给出**完全显式**的 $A$-不变延拓与它的 Hamiltonian 向量场，这是形式化里最"多出来"的数学（论文里完全没有出现）：

- `Factors.moment a b z := 2 * (star (z a) * z b).im`——坐标平面 $(a,b)$ 上的角动量；`planeMatrix z` 是 $5\times5$ 反对称"矩矩阵"。在 $z_0=0$ 的固定二次曲面上定义两个 $\R^3$ 值映射：
```lean
def leftSphere (z : CV) : R3 :=
  ![moment 1 2 z + moment 3 4 z, moment 1 3 z - moment 2 4 z, moment 1 4 z + moment 2 3 z]
def rightSphere (z : CV) : R3 :=
  ![moment 1 2 z - moment 3 4 z, moment 1 3 z + moment 2 4 z, moment 1 4 z - moment 2 3 z]
```
这是 $\mathfrak{so}(4)\cong\mathfrak{so}(3)\oplus\mathfrak{so}(3)$ 的自对偶/反自对偶分解——$Q^2\cong S^2\times S^2$ 的两个 $S^2$ 因子以矩映射坐标出现（`sphere_norm_identity`：$\|leftSphere\|^2+|{\sum_{1..4}z_j^2}|^2=(\sum_{1..4}|z_j|^2)^2$，同一恒等式对 rightSphere；由 $z_0=0$、二次型为零、单位长，得 `sphereFactors_mem : sphereFactors z ∈ sphereProduct`）。
- **单射性**（`sphereFactors_project_injective`）：`planeMatrix_project_injective` 证明矩矩阵决定射影点——用 `matrix_apply` 恒等式 $\sum_b(\text{moment}_{ab}\colon\C)w_b=i(z_a\bar z\cdot w-\bar z_a\, z\cdot w)$，单位 Hermitian 与零复内积把 $w$ 解成 $w=\overline{z\cdot w}\,z$；再由 $z\cdot w$ 的对称代数（`he` 恒等式）推出 $z\cdot w=0$。**这就是论文里 "$F\cong S^2\times S^2$ 由 2×2 矩阵图识别"的 Lean 替代物**：不用矩阵图，用矩坐标直接证明 $F$ 与 $S^2\times S^2$（`sphereProduct ⊂ R3×R3`）一一对应。
- `Field.potential`——延拓 $K$：
```lean
def potential (z : CV) : ℝ := leftSphere z 0 - rightSphere z 2 + radial (casimir z) * pairing z
```
其中 `casimir z = ∑ leftSphere z i ^ 2`、`pairing z = ∑ leftSphere z i * rightSphere z i`、`radial` 是 $(\sqrt{\cdot})^{-1}$ 在 $[1/32,32]$ 上的光滑延拓（`exists_radial` 用 `global_extension` 补出锥外；`radial_squared`：$\text{radial}(r^2)=r^{-1}$ 且 $\text{radial}'(r^2)=-\frac1{2r^3}$，$r\in(1/2,2)$）。**在固定二次曲面上**（$z_0=0$、单位）：`casimir_unit : casimir z = 1`，故 $\text{radial}=1$，$\text{potential}|_F = x_0 - y_2 + x\cdot y$——恰好等于论文的 $f(x,y)=e\cdot x+(x-p)\cdot y$（展开：$e\cdot x=x_0$，$(x-p)\cdot y=x\cdot y-y_2$）。这验证了论文的 $K|_F=f$，并且 $A$-不变性是显然的（moment 只涉及坐标 $1..4$，$A$ 只动 $z_0$）。
- `Field.core`——势的 Hamiltonian 向量场：
```lean
def core (z : CV) : CV := leftOperator 0 z - rightOperator 2 z +
  radial (casimir z) • mixedField z + (2 * deriv radial (casimir z) * pairing z) • selfField z
```
其中 `leftOperator i` / `rightOperator i` 是 $\mathfrak{so}(4)$ 两个 $\mathfrak{so}(3)$ 因子的标准复结构组合（`rotor a b z = E_b(z_a) - E_a(z_b)` 的线性组合），`mixedField = Σ (rightSphere i)•leftOp i + (leftSphere i)•rightOp i`，`selfField = Σ (leftSphere i)•leftOp i`。核心引理：
  - `core_hamiltonian : symplectic (core z) = fderiv ℝ potential z`（逐点验证；用到 `casimir_hasFDerivAt : d casimir = 2•ω(selfField z, ·)`、`pairing_hasFDerivAt : d pairing = ω(mixedField z, ·)`）——即 **core 就是 $X_{\text{potential}}$**（相对 `Field.symplectic`，与 `omega` 相等）。
  - `left_bracket / right_bracket / mixed_bracket`：$\omega(\text{leftOp}_i z,\text{leftOp}_j z)=2\varepsilon_{ijk}\,\text{leftSphere}_k(z)$（叉积结构常数），混合括号为零——两个 $S^2$ 因子的 $\mathfrak{so}(3)$ 在辛形式下正交。
  - `left_core_derivative : ω(leftOp_i z, core z) = 2((east + rightSphere z)×leftSphere z)_i`，`right_core_derivative : ω(rightOp_i z, core z) = −2((leftSphere z − pole)×rightSphere z)_i`（`core_unit` 在单位固定面上化简 core）。
- **"固定点 = 临界点"的代数化**（FieldAlgebra.`core_vertical_critical`）：若 `core z = a • (I • z)`（core 竖直，即 Hamiltonian 场沿圆纤维），则叉积为零，`cross_zero_multiplier`（$a×x=0\Rightarrow a=(a\cdot x)x$）给出乘子方程逐分量成立：
```lean
lemma core_vertical_critical … : MultiplierCritical (sphereFactors z)
```
`core_complex_vertical_critical` 把复数竖直 $core z = c•z$ 化为实竖直（用 `core_skew` 的实部条件逼 $c$ 纯虚：$c = c_{im}\cdot i$）。**论文命题 2.1 的"对称临界性 + 幂恒等式"两步，在 Lean 里被压缩成"core 竖直 ⟹ 乘子临界"一个代数判据**——形式化的不动点分析根本不看 $\phi$ 的幂，而是直接解"center = a•z 且 core(center) 竖直"的方程（见 3.8）。
- `CompactField.vectorField := cutoff (normSquared z) • core z`，cutoff 是 `ContDiffBump (0:ℝ) ⟨4, 8⟩`：在 `normSquared ≤ 4` 内恒 1（`cutoff_eq_one`）、支撑在 `normSquared < 8` 的球内（`vectorField_compact`），从而 Lipschitz（`vectorField_lipschitz`，Mathlib 的 `ContDiff.lipschitz_with_of_hasCompactSupport`）。**为什么截断向量场而不是截断势函数**：中点法的 Hamiltonian 方程只需要在锥附近成立（`vectorField_hamiltonian` 是 nhds 层面的语句，配 `center_bound` 用），截断向量场保证全局 Lipschitz 从而 resolvent 的压缩性；而修正 Hamiltonian 仍然用未截断的 `potential`（`midHamiltonian … potential`）。论文里没有这个截断（流不需要 Lipschitz，只需要光滑），这是中点替代引出的**额外装置**。
- 齐次性（`FieldAlgebra.core_homogeneous`）：在单位固定面上 `core(c•z) = c•core z` 对 $\text{normSq}(c)\in(1/2,2)$ 成立——用 `radial_squared` 的两个值（$\text{radial}(r^2)=r^{-1}$、$\text{radial}'(r^2)=-\frac1{2r^3}$）把 $c$ 的缩放逐项对齐；`mixed_scale`/`self_scale` 的 $\text{normSq}(c)\cdot c$ 因子与之相消。这个范围 $(1/2,2)$ 恰好被 `center_bound`（center 的 normSq $\in(1/2,2]$ 的一半）与 `vertical_core_fixed` 里 Cayley 因子 $a$ 的界（$\text{normSq}(a)=(1+s^2)^{-1}\in(1/2,1]$）覆盖——**所有看似任意的分数常数都在这一条齐次性引理处会师**。

### 3.8 不动点集的完整分类（FixedPoints / CriticalLifts / FixedCount）

正向（不动点 ⟹ 三个临界点之一，`FixedPoints.lean`）：
1. `fixed_lift`：`mainEquiv (project z) = project z` 给 $c\cdot z=\text{forward}(1,z)$（相位等价）。
2. `fixed_zero_coordinate`：比较第 0 坐标：`forward(1,z) 0 = -z 0`（`rotationPath_finish` 翻 $z_0$ 号 + `forwardMid_zero_coordinate`：中点步不动第 0 坐标，因为 `vectorField_zero_coordinate`——core 的所有项都是坐标 $1..4$ 的旋转组合，`rotor_zero_coordinate`）。$cz_0=-z_0$：$z_0\ne0$ 时 $c=1$，进而其余坐标全零（每个坐标 $cz_i=-z_i$ 与 $c=1$ 给 $z_i=0$），但那时 `center(1,z) = z`、`vectorField(center)=0`，与二次方程 $\sum z_i^2=z_0^2\ne0$ 矛盾。故 $z_0=0$。
3. `fixed_mid_phase`：$cz_i=-z_i$（$i>0$）与 $c z_0 = z_0 = 0$ 给 `forwardMid(1,z) = (-c)•z`（$d=-c$，注意第 0 坐标为零使 $\pm$ 无歧义）。
4. `fixed_factor_critical`：`center_average`（$2u=z+y$）给 `center(1,z) = ((1+d)/2)•z`；记 $a=(1+d)/2$，`center_bound` 给 $\text{normSq}(a)\in(1/2,2)$；于是 `vectorField(center) = a•core z`（cutoff=1 + `core_homogeneous`）；代入 `center_identity`（$u=z+\tau X(u)$，$\tau(1)=\varepsilon$）得 $\varepsilon\,a\,\text{core}(z)=(a-1)z$，即 core 竖直（系数 $(a-1)/(\varepsilon a)$）；`core_complex_vertical_critical` 收尾：`MultiplierCritical (sphereFactors z)`。
5. `multiplierCritical_iff` 分类 + `sphereFactors_project_injective` 单射 ⟹ `main_fixed_iff : mainEquiv q = q ↔ q ∈ {project zeroLift, project plusLift, project minusLift}`。

反向（三个点确实不动，`CriticalLifts / FixedCount.lean`）——显式提升：
```lean
def zeroVector : CV := ![0, 1/2, -Complex.I/2, 1/2, Complex.I/2]
def otherVector (r : ℝ) : CV := ![0, (1+(r:ℂ))/4, Complex.I/2, (1-(r:ℂ))/4, -Complex.I/2]
```
（`zeroVector`：单位 $\frac14\cdot4=1$、迷向 $\frac14-\frac14+\frac14-\frac14=0$；`sphereFactors zeroVector = qzero`。`otherVector ±√3` 对应 $q_\pm$。）core 在这三点的显式值：
```lean
lemma core_zeroVector : core zeroVector = 0
lemma core_otherVector (r) (hr : r^2 = 3) : core (otherVector r) = (-(3*r/2)) • (Complex.I • otherVector r)
```
（值 $-\frac{3r}2$ 与临界值 $f(q_s)=\frac{3s\sqrt3}2$ 的关系：$r=\mp s\sqrt3$ 时系数 $\pm\frac{3\sqrt3}2$……直接记录：竖直系数 $b=-\frac{3r}2$，$|b|\le3$ 当 $|r|\le2$。）
`vertical_core_fixed`：core 竖直（$b\in[-3,3]$）的点必不动。证明是**显式解中点方程**：令 $s=\varepsilon b$（$|s|\le3/100<1$）、Cayley 因子 $a=(1-si)^{-1}$（$\text{normSq}(a)=(1+s^2)^{-1}\in(1/2,1]$，落在齐次性范围），则 $a=1+si\,a$ 给 `center(1,z) = a•z`（用 `Midpoint.resolvent_unique` 验证 $a z = z + \varepsilon\,\text{core}(az)$），`forwardMid(1,z) = (2a-1)•z`，而
```tex
-(2a-1) = -\bigl(2/(1-si)-1\bigr) = -(1+si)/(1-si)
```
是模长 1 的相位（`hphase` 由 `forward_preserves` 的范数方程反推），且第 0 坐标为零所以旋转部分不改变它——`forward(1,z) = (-(2a-1))•z`，与 $z$ 同射影点。**论文里这一步是"反之，CritSet(K)∩F 的点被 φ_ε 固定"的一句话；Lean 里它需要显式解出 Cayley 型相位 $(1-si)^{-1}$**——这是"论文一句带过、Lean 必须展开"的又一个典型点，也暴露了论文论证的隐含定量内容：$\varepsilon$ 要小到 $|\varepsilon b|\cdot$ (某个常数) $<1$ 才能让中点迭代收敛到正确的相位。
最终 `main_fixed_encard : (fixedSet mainEquiv).encard = 3`。

### 3.9 退化不动点（MidpointDerivative / Kernel / Degeneracy）

Lean 对退化的处理与论文 2.8 节不同：**不用指数公式 $e^{\varepsilon DX_f}$，用中点法在"向量场零点 + 导数核"处的精确恒等**。

- 核向量（Kernel.lean）：
```lean
def kernelVector : CV := ![0, -1/4, Complex.I/4, 1/4, Complex.I/4]
lemma kernelVector_horizontal : Horizontal zeroVector kernelVector
```
（逐分量验证两个约束和：$\sum\bar z v=\frac14(-\frac12-\frac i2\cdot\frac12\cdot\ldots)$……总之 `norm_num` 收尾。）
- `core_kernel : fderiv ℝ core zeroVector kernelVector = 0`——沿曲线 `kernelCurve t = zeroVector + t•kernelVector` 计算：`left_curve`（leftSphere 沿曲线的导数 = east）、`right_curve`（rightSphere 导数 = 0）、`casimir_curve`（导数 0）、`pairing_curve`（导数 −1），混合后各项在 `zero_operator_cancel : rightOperator 0 zeroVector + leftOperator 2 zeroVector = 0` 的恒等式下**完全相消**（`core_curve : HasDerivAt (fun t ↦ core (kernelCurve t)) 0 0`）。这个消失在论文里对应"$q_0$ 在 Hessian 核方向上 $DX_f=0$"，但论文的核方向是 $(u,v,a,b)$ 坐标里的抽象向量；Lean 把它实现为锥上的具体复向量 `kernelVector = (0,-1/4,i/4,1/4,i/4)`。
- `vectorField_kernel`：cutoff 在 `normSquared=1<4` 处恒 1，`vectorField_local_core` 的 `fderiv_eq` 传递到 core，得 `fderiv vectorField zeroVector kernelVector = 0`，且 `vectorField_zeroVector : vectorField zeroVector = 0`（`core_zeroVector = 0`）。
- **中点法的核恒等式**（MidpointDerivative.lean）：
```lean
lemma resolvent_kernel … : X z = 0 → fderiv ℝ X z v = 0 → fderiv (fun w ↦ resolvent (t,w)) z v = v
lemma step_kernel … : 同上 ⟹ fderiv (fun w ↦ step (t,w)) z v = v
```
证明：`resolvent_right_inverse : resolvent (t, z - τt•X z) = z` 两边求微分（$R$ 与 $w\mapsto w-\tau X(w)$ 的复合是恒等），$dX(z)v=0$ 使第二因子的导数为恒等，故 $dR_z v=v$；step $=2R-\mathrm{id}$ 给 $2v-v=v$。**注释精神的直白表述：在中点法下，"向量场的零点 + 导数零方向"自动是 step 微分的不动方向——不需要指数映射。**
- `Degeneracy.lean` 组装：`degenerateLift w := -forward (1, w)`（把提升的相位固定住——因为 `forward(1,zeroVector)` 与 `zeroVector` 只差一个模 1 相位，取负号后精确回到 zeroVector：`degenerateLift_zeroVector`，用 `rotation_finish_neg`（$z_0=0$ 时 $\text{rotationPath}(1,z)=-z$）与 `forwardMid_zeroVector`（step 在向量场零点处是恒等））。导数链：$d(\text{degenerateLift})_{z_0}v=-\text{pathLinear}(1)(d(\text{forwardMid}) v)$，而 `forwardMid_kernel : d(forwardMid)(1,·)_{zeroVector}(kernelVector) = kernelVector`（step_kernel），`pathLinear 1` 在 $z_0=0$ 分量上是 $-\mathrm{id}$（`rotation_finish_neg kernelVector`），负负得正：
```lean
lemma degenerateLift_kernel : fderiv ℝ degenerateLift zeroVector kernelVector = kernelVector
lemma main_degenerate : HasDegenerateFixedPoint mainEquiv
```
`main_degenerate` 的 witness 取 $a=0$：`fderiv G z v - v = 0 • (i • z)`——即本征值 1 精确成立、连竖直修正项都是零。整条链没有近似与"充分小"的极限论证：**kernelVector 方向上的本征值 1 是恒等式**。

### 3.10 形式化与论文文本的对应表

| 论文位置 | 论文内容 | Lean 位置 | 对应/差异 |
|---|---|---|---|
| eq:quadric, §1 | $Q^3\subset\CP^4$ 定义 | Model.`Q3` | 一致（Projectivization 子类型） |
| Prop 3.1 证明 | $Q^3$ 光滑、连通、实维 6 | Projective.`horizontal_finrank(_real)`；连通性**未形式化** | 维数形式化；连通/紧性未证明（对结论非必需） |
| Prop 3.1 | FS 形式构造与归一化 | Model.`omega`（因子 2）+ Projective.`omega_horizontal_nondegenerate` | 只形式化水平表示 + 非退化；$d\alpha$ 下降未做（不需要） |
| Prop 3.1 | $A$ 是 Hamiltonian 对合 | Rotation.`involutionHamiltonianPath` | 完全形式化，含逐点 Hamiltonian 方程 |
| Prop 3.1 | $F\cong S^2\times S^2$、切分裂 | Factors.`sphereFactors*`（矩坐标）；切分裂**未显式形式化** | 用矩坐标代替矩阵图；`dA=+1/-1` 分裂以 `fixed_zero_coordinate`/`vertical_core_fixed` 的坐标计算隐式出现 |
| Prop 2.1 | 有限阶迁移（平均 + 幂恒等式） | **整体替换**：Midpoint.*（中点法）+ FieldAlgebra.`core_vertical_critical` + FixedPoints.* | 论文的"$\phi^m=B_{m\varepsilon}$ + 短周期"被"压缩映射 + 显式相位求解"替换 |
| Lemma 2.2 | 短周期排除 | **无对应物**（被 Lipschitz 压缩条件 $\|\tau\|C<1$ 与 `center_norm_gt_half` 取代） | 形式化不需要周期论证 |
| eq:three-point-function | $f=e\cdot x+(x-p)\cdot y$ | ThreePoints.`f` | 一致 |
| Prop 4.1 | 乘子消元、$t=\sqrt3$ | ThreePoints.`classify_coordinates`（用 $\mu$ 消元，$\mu^2=3$） | 同一方程组，消元变量不同（Lean 注释明说） |
| Remark 4.2 | Hessian 本征值 $1,-1,0,0$ | Hessian.`qzero_degenerate_hessian`、`tangent_hessian_kernel` | 只证核中非零切向量存在，不算全谱 |
| Lemma 5.1 | LS 覆盖 + 微分形式 | **整体替换**：Descent（离散下降覆盖）+ Orbit/Obstruction（join + Haar）+ Volume（同伦不变） | 数学结构不同、命题等价（见 3.5） |
| Cor 5.2 | 辛体积 $\Rightarrow n+1$ | Obstruction.`four_le_criticalSet`（$n=3$ 情形，经等变映射阻碍） | 只有 $Q^3$ 的情形，一般 $n$ 未形式化 |
| Cor 5.3 | $\Crit(Q^3)=\operatorname{cuplength}=4$ | **只有 $4\le$ criticalNumber** | 杯长未定义；$\Crit\le4$（$G_{1,2}$ 的 4 临界点）未形式化 |
| Thm 1.1 组装 | $\phi=A\circ B_\varepsilon$、$\Fix=\CritSet(f)$ | Hamiltonian.`mainEquiv`/`mainHamiltonianPath` + FixedCount.`main_fixed_encard` | 完全形式化 |
| Thm 1.1 退化性 | $d\phi_{q_0}v=e^{\varepsilon DX_f}v=v$ | Kernel + MidpointDerivative + Degeneracy | 替换为中点核恒等式；结论同（商切向本征值 1） |
| §5 结尾 remark | "命题不要求 $K$ 的临界点总数有限" | （构造中 `criticalSet h` 的有限性只在下界证明里由反设给出） | 一致 |

### 3.11 只在 Lean 里才暴露的结构细节（论文文本看不出来的）

1. **$\varepsilon$ 有显式值且其大小受三层约束夹逼**：$\varepsilon=\frac1{100(C+1)}$，$C$ 是截断向量场的 Lipschitz 常数。约束链：(a) 压缩性 $\|\tau\|C<1$；(b) `center_norm_gt_half` 需要 $\|\tau\|C<\frac1{10}$（从而 $1/2<$ normSq(center)，保证 cutoff=1 区域）；(c) `vertical_core_fixed` 需要 $|\varepsilon b|\le\frac3{100}<1$（$b$ 的界 3 来自 `core_otherVector` 的竖直系数 $-\frac{3r}2$，$|r|\le\sqrt3<2$）。论文的"sufficiently small $\varepsilon$"在 Lean 里是这三个数值条件的具体实现。
2. **固定点分类走的是"中点相位 Cayley 变换"**：`vertical_core_fixed` 里 $a=(1-si)^{-1}$ 的显式解说明：中点步在"core 竖直"的点上恰好把相位按 Möbius 变换 $z\mapsto\frac{1+si}{1-si}$ 型因子转动——不动性的判据是纯代数的，论文的幂恒等式论证完全没有显现这个结构。
3. **延拓 $K$ 不是平均出来的，而是矩坐标里的显式二次势**（`potential`），且它的 Hamiltonian 场的两个"球面叉积"恒等式（`left_core_derivative`/`right_core_derivative`）才是真正做功的引擎——论文的对称临界性原理（Palais）在 Lean 里没有出现，被叉积为零 ⟺ 乘子临界的等价取代。
4. **下界证明的组织方式完全不同**：论文按"临界值分层的梯度流覆盖"组织；Lean 按"若临界点 $\le3$ 则存在圆等变映射 $F:\C^5\supset$ 锥 $\to S^3\subset\C^3$，与 $\omega^3=48\ne0$ 矛盾"组织。后者实际上证明的是更强的**几何阻碍**（不存在等变映射），并且"覆盖成员"是下降迭代后坐标非零的集合而非球之并。Lean 版不出现 Poincaré 引理、单位分解截断 $\rho_j=\chi(\psi_j)$、系数域切换——论文引理 5.1 的三个技术装置全部被绕开。
5. **$O(5)$ 轨道映射替代流形积分**：论文在流形 $Q^3$ 上做微分形式；Lean 在 $O(5)$ 上对 Haar 测度积分，被积形式经 `orbitProjection`（$A\mapsto A\cdot\text{base}$）拉回。纤维方向（圆）以"括号 = 纤维方向"的代数条件（`generators_bracket_base`、`bracketCoefficient`）进入"基本性"假设。**48 这个数**（`cubeForm_velocities`）是 $\omega^3$ 在六个生成方向上的常数值（$=3!\cdot2^3$），它的作用相当于论文中 $h^3=2[\mathrm{pt}]$ 非零的作用，但以显式常数出现。
6. **退化点的具体坐标**：论文只给本征值 $(1,-1,0,0)$；Lean 给出零向量提升 `zeroVector = (0,1/2,-i/2,1/2,i/2)`、核方向 `kernelVector = (0,-1/4,i/4,1/4,i/4)`、以及消失恒等式 `zero_operator_cancel : rightOperator 0 + leftOperator 2 = 0`（在 zeroVector 处）——$\mathfrak{so}(4)$ 两因子的这两个特定元素在 $q_0$ 处相消，这是退化性的代数根源，论文文本完全不可见。
7. **`HamiltonianPath` 的 `equation` 域只在水平方向上检验**：形式化从未证明"路径保持 $\omega$"（辛同痕）本身——它证明的是逐点的 Hamiltonian 方程，由它内蕴地推出辛性但没有作为独立定理抽取。此外 `Q3` 类型上没有拓扑/流形结构，"微分同胚"由 `Q3 ≃ Q3`（纯双射）+ 路径的光滑性数据共同承载——**编码的适当性（adequacy）是一个未在机器内验证的信任桥**（见 3.12 与第五节）。
8. **相位的处理贯穿始终**：所有映射都定义在单位锥 `UnitQuadric` 上并要求相位等变（`forward_phase` 等），射影作用靠 `descend`（经 `unitRepresentative` 的选择）下降。`Classical.choice` 的实质使用点就在这里：`descend` 要对每个射影点选一个代表元。
9. **两个下界证明共用一套外微分/交错代数**（Exterior/Homotopy）：`pairForm`（双线性型与形式的楔积，带整数归一化）、`cubeForm`、`cylinder_homotopy_identity`（柱面同伦恒等式：闭形式的切片导数 = 时间方向收缩的空间外微分）、`contDiff_of_toMultilinear`（交错形式空间的光滑性经线性收缩检验——注释 "This uses an honest linear retraction, not an axiom"）。这套东西在论文里对应"de Rham 微积分"，Lean 里是手写的最小版本。

### 3.12 论文有而 Lean 未形式化的部分

1. **$\Crit(Q^3)\le4$ 与 $\operatorname{cuplength}(Q^3)=4$ 的上界**（Cor 5.3 的实现半边）：$G_{1,2}$ 的 4 个临界点、$h^3=2[\mathrm{pt}]$、杯长定义——全部缺席。Lean 主定理只有 `4 ≤ criticalNumber`，夹逼的另一半靠论文文本。
2. **$Q^3$ 的拓扑性质**：连通（SO(5) 轨道论证）、紧、闭——未形式化（`Q3` 上无拓扑）。
3. **一般性的定理**：命题 2.1 对任意 $(M,\omega)$ 的表述、引理 5.1 对任意流形的表述、推论 5.2 对一般 $2n$ 维辛流形——Lean 只形式化了 $Q^3$ 一个实例。
4. **Gong 界的匹配**（$n=3$ 时 $\ge3$ 个不动点的下界、归一化相差正标量不影响 Hamiltonian 群）——未形式化。
5. **论文引言的历史讨论**（Conley–Zehnder、Fortune、Hofer、Rudyak–Oprea、Floer 系、BHS、Jiao）——非形式化内容。

---

## 四、常数与参数表

### 4.1 论文中的数字

| 数/参数 | 值 | 出处与作用 |
|---|---|---|
| 环境 | $\CP^4$，坐标 $z_0..z_4$ | eq:quadric |
| $Q^3$ 实维数 | 6（复维 3） | Prop 3.1 |
| 固定子流形 | $F=M\cap\{z_0=0\}\cong S^2\times S^2$，实维 4 | Prop 3.1 |
| 有限阶 | $m=2$（对合） | Thm 1.1 证明 |
| 主计数 | $\#\Fix(\phi)=3<4=\Crit(Q^3)=\operatorname{cuplength}(Q^3;\mathbb Q)$ | eq:counterexample |
| 辛归一化 | $d\alpha(v,iv)=2\lvert v\rvert^2$（$\alpha=\sum x_jdy_j-y_jdx_j$ 于 $S^9$） | Prop 3.1 |
| 旋转族 | $G_{a,b}=\frac{2a\,\Im(\bar z_1z_2)+2b\,\Im(\bar z_3z_4)}{\sum\lvert z_j\rvert^2}$；$A=\Phi_1^{\pi,\pi}$（速度 $\pi$、时间 1） | eq:rotation-hamiltonian |
| 实现上界的旋转 | $G_{1,2}$（速度 1 与 2）；$T=\mathrm{diag}(0,J,2J)$，本征值 $0,\pm i,\pm2i$；临界点 $[0:1:\pm i:0:0],[0:0:0:1:\pm i]$ | Cor 5.3 |
| 杯长下界 | $h^3=2[\mathrm{pt}]$（次数 2） | Cor 5.3 |
| 体积下界 | $[\omega]^3\ne0\Rightarrow\ge4$ 临界点（$n+1$，$n=3$） | Cor 5.2 |
| 三临界点函数 | $f(x,y)=e\cdot x+(x-p)\cdot y$，$p=(0,0,1)$，$e=(1,0,0)$ | eq:three-point-function |
| 临界点 | $q_0=(p,-e)$，$f(q_0)=0$；$q_\pm$ 的 $t=\lvert x-p\rvert=\sqrt3$，$w=-\tfrac12$，$u=\pm\tfrac{\sqrt3}2$；$\lambda=\mu=\pm\sqrt3$；$f(q_\pm)=\pm\tfrac{3\sqrt3}2$ | Prop 4.1 |
| 因子分解 | $(1-t^2/2)^2(1+t^2)-1=\frac{t^4(t^2-3)}4$；排除 $t=2$（对极） | eq:critical-factorization |
| Hessian | 本征值 $1,-1,0,0$，秩 2；局部展开 $f=va+O(\|(u,v,a,b)\|^3)$ | Remark 4.2 |
| LS 引理参数 | $k\le r$ 个临界值；$2\epsilon_i<T_ib_i$；$\rho_j=\chi(\psi_j)$，$\chi$ 在 $[0,\frac1{4k}]$ 零、$[\frac1{2k},1]$ 一 | Lemma 5.1 |
| 退化判据 | $\omega_F(DX_f(q_0)v,w)=\operatorname{Hess}_{q_0}f(v,w)$；$d\phi_{q_0}v=e^{\varepsilon DX_f(q_0)}v=v$ | §6 |
| 微扰步长 | $0<\varepsilon<\delta/m$（$\delta$ 来自 Lemma 2.2；论文不给数值） | Prop 2.1 |
| Lipschitz/Yorke | 常数 $L$（局部）；Yorke 1969 锐估计仅引用 | Lemma 2.2 |

### 4.2 Lean 形式化中的数字（论文之外或论文隐含）

| 常数 | 值 | 位置 | 作用 |
|---|---|---|---|
| 坐标数 | `Fin 5`（CV）、`CSpace 3`、`CSpace 5` | Model / Forms / Orbit | $\C^5$ 环境、$\C^3$ 靶 |
| $\omega$ 归一化 | `omega v w = 2*(∑ star v w).im` | Model | 与论文因子 2 一致 |
| 基点 | `baseScale = √(1/2)`，`base = (√½, i√½, 0,0,0)` | Orbit | 轨道映射原点 |
| 生成元个数 | 6（`rotGen 0 2 … rotGen 1 4`）+ 25（`rotGen` 全对，用于梯度展开） | Orbit / Coordinates | 括号方向 = 圆纤维 |
| $\omega^3$ 常数 | 48（`cubeForm (symplectic 5) velocities = 48`；`squareForm = 8*(…)`) | Volume | join 阻碍的非零端 |
| 括号矩阵 | `bracketCoefficient`：三个 $2\times2$ 块 $\begin{psmallmatrix}0&-1\\1&0\end{psmallmatrix}$ | Orbit | 纤维方向系数 |
| 截断 | `ContDiffBump ⟨4, 8⟩`；`normSquared ≤ 4` 内恒 1、支撑 $<8$ | CompactField | 全局化向量场 |
| Lipschitz 常数 | `constant := vectorField_lipschitz.choose`（非显式数值） | Parameter | 压缩性 |
| 步长 | `epsilon = 1/(100*(C+1))`；`parameter(t) = ε·sin(πt/2)`；$\|\tau\|C<\frac1{10}$ | Parameter | 中点步大小 |
| 中心范数窗 | $\tfrac12<\text{normSquared(center)}\le1$；`center_bound : normSquared (center) ∈ Ioo (1/2) 2` | MidpointGeometry / Parameter | cutoff=1 区域 + 齐次性范围 |
| 齐次性范围 | $\operatorname{normSq}(c)\in(\tfrac12,2)$ | FieldAlgebra.`core_homogeneous` | core 的 $c$-缩放 |
| 竖直系数界 | $\lvert b\rvert\le3$；$s=\varepsilon b$，$\lvert s\rvert\le\frac3{100}$；Cayley $a=(1-si)^{-1}$，$\operatorname{normSq}(a)=(1+s^2)^{-1}\in(\tfrac12,1]$ | FixedPoints.`vertical_core_fixed` | 反向不动点 |
| 临界点提升 | `zeroVector = ![0,1/2,-i/2,1/2,i/2]`；`otherVector r = ![0,(1+r)/4,i/2,(1-r)/4,-i/2]`，$r=\pm\sqrt3$ | CriticalLifts | 三个不动点的锥上坐标 |
| 竖直核系数 | `core (otherVector r) = -(3r/2) • (i • otherVector r)`；`core zeroVector = 0` | CriticalLifts | 乘子竖直值 |
| 核方向 | `kernelVector = ![0,-1/4,i/4,1/4,i/4]` | Kernel | 退化本征方向 |
| 消失恒等式 | `zero_operator_cancel : rightOperator 0 zeroVector + leftOperator 2 zeroVector = 0` | Kernel | core 导数沿核为零的代数根源 |
| 消元常数 | $\mu^2=3$（代替论文 $t^2=3$） | ThreePoints | 乘子消元 |
| 平滑 radial | `radial` = $(\sqrt s)^{-1}$ 的延拓，匹配区间 $[\tfrac1{32},32]$；`radial(1)=1`、`radial'(1)=-1/2` | Field | potential 的第三项 |
| 下降步长 | $c=(2(\lvert B\rvert+\lvert M\rvert+1))^{-1}$ | Descent.`adaptive_step` | 二阶导控制的离散下降 |
| 穿带次数 | $N>(b-a)/\delta$，$\delta=f(z)-f(Dz)$ | Descent.`uniform_drop` | LS 覆盖的均匀时间 |
| Haar | `haar = Measure.haar.inv`（右不变、有限、开正） | Haar | 积分障碍 |
| 轨道维数 | 水平切空间复维 3 / 实维 6；$S^5$ 球面上 6 个切向量线性相关 | Projective / Volume | $\omega^3=0$ 于 $\C^3$ 端 |
| join 参数 | $t=0$ 与 $t=\pi/2$ 两端 | Obstruction | 48 vs 0 |
| 公理 | `propext, Quot.sound, Classical.choice` | ComparatorChallenges json | permitted axioms |

---

## 五、开放问题与可信度审查

### 5.1 论文声称 vs Lean 实际证明的缝隙

按主定理 eq:counterexample 的合取项逐一核对：

1. **"$\exists$ smooth Hamiltonian diffeomorphism $\phi$"**——Lean 证得最扎实的部分。`mainEquiv` 是显式构造（旋转 ∘ 中点步，经相位下降），`IsHamiltonian` 由 `mainHamiltonianPath` 的全部结构域逐条验证（光滑性、锥不变、相位等变、互逆、起点、终点、逐点 Hamiltonian 方程）。**缝隙在编码层而非证明层**：`Q3` 上没有拓扑/微分流形结构，`HamiltonianPath` 是自定义结构而非 Mathlib 辛几何库里的"Hamiltonian 微分同胚群"元素；"该结构恰当编码了标准定义"这一步（adequacy）依赖读者的人工检查。特别地，`equation` 域只在水平方向上检验 Hamiltonian 方程、`Q3 ≃ Q3` 只是集合论双射——从这些数据到"φ 是六维辛流形的辛自同胚且在 Hamiltonian 同痕类中"的桥没有机器验证。[推测] 若 Mathlib 将来补上射影流形/FS 形式的设施，重验这个桥是主要的移植成本。
2. **"$\#\Fix(\phi)=3$"**——完全机器验证（`main_fixed_encard`，正反两个方向 + 三点互异 + 射影单射性）。无缝隙。
3. **"$3<4$"**——`norm_num`，平凡。
4. **"$=\Crit(Q^3)$"**——**Lean 只证了 $4\le\text{criticalNumber}$**。$\Crit(Q^3)\le4$ 的半边（$G_{1,2}$ 恰有 4 个临界点）没有形式化。论文文本的论证（本征值互异 ⟹ 射影零点 = 本征线；5 条逐一检查）在 Lean 里没有对应物。合取项 eq:counterexample 中的等号链是论文的、不是机器的。
5. **"$=\operatorname{cuplength}(Q^3;\mathbb Q)$"**——**杯长概念整个未形式化**。Lean 的下界走的是"无等变映射"阻碍而非杯积；$h^3=2[\mathrm{pt}]$ 与有理系数切换都在机器之外。论文的 eq:cup-critical（Lemma 5.1 的推论）与 Cor 5.3 的上界都是纯文本数学。
6. **"At least one fixed point is degenerate"**——机器验证（`main_degenerate`），且比论文强：给出了退化点的精确锥上坐标、精确的核方向、本征值 1 的精确恒等（修正项 $a=0$）。

### 5.2 论文文本内部需要复查的点

1. **Lemma 2.2 与命题 2.1 的衔接**（本素材 2.2 节 [推测] 第 3 条）：证明里"$\phi_\varepsilon(q)=q\Rightarrow B_\varepsilon(q)=q$"用到了 $\varepsilon$ 也在窗口内；论文写 "Apply Lemma 2.2 to $X_K$, and choose $0<\varepsilon<\delta/m$"，逻辑上覆盖了（$m\varepsilon<\delta$ 且 $m\ge1$），但两个时刻（$\varepsilon$ 与 $m\varepsilon$）的使用没有分开写明。复审时应确认这是表述问题而非漏洞——我们的重读判定它是表述问题。
2. **$G_{1,2}$ 临界点的"恰好"**：$Tz\in\C z\Rightarrow z$ 在某本征空间——用到本征值互异（$\pm i\ne\pm2i\ne0$）。论文一句话带过；这是标准的但不是零成本的（需排除本征空间混合的情形）。
3. **延拓 $K$ 的法向行为**：论文刻意避开（"no assumption on the normal Hessian"），一致地只在不变子空间内论证。Lean 的 `HasDegenerateFixedPoint` 用"模去竖直方向"的商定义进一步强化了这一点。两个版本在"退化性与延拓选取无关"上一致。
4. **与 Jiao 2026 的关系**：Jiao 的 $S^2\times S^2$ 两不动点结果（2026-09-27，晚于本文 4 天）若成立，则本文的有限阶方法与 Jiao 的鞍点合并方法在"无限制光滑界可以跌破多少"上给出了互补的数据点：$Q^3$ 上 $3<4$、$S^2\times S^2$ 上 $2<4$（$\Crit(S^2\times S^2)=4$？注意 $S^2\times S^2$ 的 cuplength 为 3、临界数 $\ge3$——Jiao 的 2 若真则更惊人的是对称临界数下界本身）。[推测标注：对 Jiao 结果的评估依赖其预印本内容，本素材未读；仅按论文引用记录。]
5. **与 Gong 界的匹配是"达到下界"而非"矛盾"**：本文反例与 Gong 的正结果在 $n=3$ 处相容（都给 3），这说明对二次超曲面，"无限制光滑界"的真值就是 $n$（若 Gong 界对一切 Hamiltonian 微分同胚成立）。这是个值得写进后续笔记的观察：**退化反例把临界数 Arnold 界压到 Gong 的下界，没有任何 further slack**。

### 5.3 形式化暴露出的"论文里的隐藏定量内容"

这些是写思维链笔记时最有价值的点——论文一句话、Lean 一大段：

1. **"sufficiently small $\varepsilon$" 的三层显式约束**（压缩性、cutoff 区域、Cayley 相位可解），最终以 $\varepsilon=1/(100(C+1))$ 落地（3.11 节第 1 条）。
2. **"K|_F = f" 的显式化代价**：需要自对偶/反自对偶矩坐标（Factors）、势函数第三项的径向光滑化（`radial` 在 $[1/32,32]$ 上的延拓）、齐次性窗口 $(1/2,2)$（`core_homogeneous`）。论文的"partition of unity 平均"掩盖了这些结构，而真正被 Lean 验证的 $K$ 与论文的 $K$ 是**不同的函数**（同为 $A$-不变、限制同为 $f$，但构造完全不同）——命题 2.1 的存在性陈述与 Lean 的显式构造是"同一命题的两个证明"。
3. **短周期引理的消失**：中点替代让"$\Fix(B_{m\varepsilon})=\CritSet(K)$"这类周期论证整体蒸发，取而代之的是压缩映射的唯一性——**形式化选择了对机器友好而非对论文忠实的路线**，且这条路线同时更初等（无需 ODE、无需 Yorke 型估计）。
4. **LS 引理的替代证明更强**：Lean 证明的是"不存在圆等变映射锥 $\to S^3$"，它蕴含"临界数 $\ge4$"但在论文语境下是一个不同（且看似更强）的拓扑命题。若要把 Lean 的下界翻译回论文语言，需要说明：等变映射的存在性等价于 LS 覆盖的存在性（Lean 的 `critical_level_cover` 正是从覆盖构造映射的方向）。

### 5.4 可信度总评

- **Lean 覆盖率**：主定理的核心内容（存在 Hamiltonian 映射、恰 3 个不动点、有退化不动点、一切光滑函数 $\ge4$ 个临界点）全部机器验证，无 `sorry`、无额外公理。**未覆盖**：$\Crit=4$ 的等号与杯长等号、$Q^3$ 的拓扑基本性质、编码适当性。
- **论文与 Lean 的互证关系**：论文给"为什么"（迁移机制、拓扑来源），Lean 给"精确是什么"（显式常数、显式坐标、显式相位变换）。两者分歧最大的三处（中点替代流、Haar 替代杯积、矩坐标替代平均延拓）都**不改变定理内容**，只改变证明路线——这是高质量的取证信号：同一结论的两条独立路线互为校验。
- **残余风险**：(i) 编码适当性（HamiltonianPath 是否忠实编码 Ham$(Q^3,\omega)$）是唯一无法在两边文本内闭合的环节；(ii) Lean 的下界依赖 `SmoothFunction` 的局部提升定义与论文"$C^\infty(Q^3)$ 函数"的外延一致性（局部提升定义对射影空间上的光滑函数是否恰当——论文读者会默认用流形结构，Lean 读者必须接受局部提升定义）。[推测] 两者外延应当一致（射影空间光滑函数 = 局部光滑提升函数是标准事实），但 Lean 内无此等价定理。

### 5.5 给后续"第一人称反推思维链"笔记的建议素材点

1. 入口问题："临界数界哪来的？——LS/杯长，而杯长对退化函数也成立（Lemma 5.1）"；第一道坎是"为什么以前没人找到反例"——因为非退化 Floer 理论的巨大成功掩盖了无限制表述的漏洞（Golovko 的两个猜想 1.4/1.6 是明确的靶子）。
2. 关键转念：**不去逼近 $\Crit(M)$ 的实现函数，而去降低 $\#\Fix$**——固定子流形迁移（命题 2.1）把问题从"整个流形上的动力学"降到"固定集上的静态函数"。
3. 数字 $t=\sqrt3$ 的出现方式（eq:critical-factorization）适合作为"机械性推导逼出常数"的示范。
4. Lean 的三处桥接（中点、Haar、矩坐标）各自对应"论文数学 → 机器数学"的一类标准变换：流 → 迭代映射、上同调 → 显式积分阻碍、存在性 → 显式公式。写思维链时可以把它们作为"如果我要形式化，我会在哪里卡住、怎么绕"的练习。

---

*素材文件完。数据来源：TeX 源码 6 节 + references.tex + Lean 36 文件（约 5841 行）+ formalization.yaml 第 779/926–928 行 + ComparatorChallenges/ArnoldCounterexample.json。所有 [推测] 条目已逐条标注；外部背景（Yorke 估计的精确形式、$Q^3$ Betti 数、Jiao 预印本内容）未逐条核实原文，仅按论文引用记录。*










