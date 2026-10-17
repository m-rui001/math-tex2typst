# Tachikawa 第二猜想的反例——研究素材

> 整理对象：OpenAI preprint "A counterexample to Tachikawa's second conjecture"（2026-09-23）。
> 论文源码：`E:\math\preprints\A-counterexample-to-Tachikawas-second-conjecture-September-23-2026\build\paper.tex` 及 `build\sections\*.tex`（introduction / homological / transfer / algebra / stable / bimodule / triangular / consequences 八节）。
> Lean 形式化：`E:\math\lean\OAI\RingTheory\Tachikawa\`（31 个模块，入口 `Counterexample.lean`，声明 `OAI.Tachikawa.main_theorem`，comparator 配置 `ComparatorChallenges/Tachikawa.json`）。
>
> 用途：为"第一人称反推思维链"笔记提供素材。所有 TeX 引用保留原文 LaTeX 形式。凡论文之外的内容一律标注 [推测] 或注明来源。
>
> **约定记号**（与论文一致）：$D=\Hom_k(-,k)$；$G^e=G\otimes_k G^{\mathrm{op}}$；未标下标的张量积在 $k$ 上；复形按同调指标，$P[a]_j=P_{j-a}$，$c_jP=\coker(d^j_{j+1}:P_{j+1}\to P_j)$；$\sHom$ 为模掉过投射分解的 Hom；特征 2 使一切符号消失。

---

# 一、定理总览

## 1.1 被否定的猜想

**Tachikawa 第二猜想**（Tachikawa's second conjecture）。设 $A$ 是域 $k$ 上有限维代数。有限维 $A$-模 $M$ 称为**自正交（self-orthogonal）**，若 $\Ext_A^i(M,M)=0$ 对每个整数 $i>0$。猜想断言：

> 有限维自内射代数上的每个有限维自正交模都是投射的。

出处：Tachikawa 1973 年专著 pp. VI–VII；Chen–Xi 2025 TAMS p. 7288 的转述。它与 Auslander–Reiten 猜想的关系：Auslander–Reiten 猜想问的是"$\Ext_A^i(M, M\oplus A)=0\ \forall i>0$ 是否迫使 $M$ 投射"；当 $A$ 自内射时 $\Ext_A^i(M,A)=0$ 自动成立，所以 Tachikawa 第二猜想恰是 Auslander–Reiten 猜想的**自内射情形**。因此本文的主定理同时给出 Auslander–Reiten 猜想的对称反例。

**已知背景**（来自论文 introduction，属文献陈述）：
- Schulz 1994 的反例用了斜域（skew field）上的代数，不在"域上有限维"的框架内；其量子外代数例子（Schulz 1995, Example 7）有一次自延伸为零但更高阶全零——本文十维起始代数的"参数平移合冲"手法是其后身。
- Erdmann 2017：代数闭域上、根立方零且根平方非零的不可分weakly symmetric 代数中，允许此类模的恰是参数非单位根的量子外代数与 double Nakayama 代数——这提示反例必须避开这些已证的正例情形（本文走 $E=T\otimes T$ 的张量路线，根立方不再为零）。
- Diveris–Purin 2014、Chen–Fang–Xi 2024、Chen–Xi 2025、Zhang–Zhou 2026（根立方零分裂代数的自内射情形、Igusa–Todorov 代数）、Xia 2026（量子完全交的 AR 猜想）、Böhmler–Marczinzik 2026（交换局部自内射代数上 $i=1,2$ 消失但 $i=3$ 不消失的模）——都是部分正结果，本文是**所有正度数全消失**的第一个有限维反例。
- Enomoto–Marczinzik 2026：Tachikawa 第二猜想对二次平凡扩张成立可推出原代数的 AR 猜想；且四个猜想（AR、广义 Nakayama、Nakayama、两个 Tachikawa）的"泛化版本"在固定交换 Artin 系数环上等价。

## 1.2 主定理（TeX 原文照抄）

```latex
\begin{theorem}\label{thm:main}
Let
\[
 k=\mathbb F_2(q,H_1,H_2),
\]
where $q,H_1,H_2$ are algebraically independent.
There exist a finite-dimensional associative unital symmetric
$k$-algebra $A$ and a finite-dimensional unital left $A$-module $M$
such that $M$ is nonprojective and
\[
 \Ext_A^i(M,M)=0\qquad\text{for every integer }i>0.
\]
In particular, Tachikawa's second conjecture is false.
\end{theorem}
```

由于 $A$ 对称故自内射，同一模满足 $\Ext_A^i(M, M\oplus A)=0\ \forall i>0$，即对称代数上的 Auslander–Reiten 反例。

**要点**：域是 $\mathbb F_2$ 上三个代数独立未定元的有理函数域，特征 2。$A$ 对称（不只是自内射），且所有构造对象在基域扩张下保持结论成立（Corollary 的形式是"对每个扩域 $K/k$"）。

## 1.3 反例的总体结构（五层积木）

整个构造是一条五段流水线（论文 Figure "proof-architecture"）：

```
第1层  C（10维代数, 简单模 s）
   ├─ T = C ⋉ DC（20维对称平凡扩张）
   ├─ E = T ⊗ T（400维对称代数）,  X = s ⊗ s（1维 E-模）
   └─ Ext_E^*(X,X) = k[τ₁, τ₂]，|τ₁|=|τ₂|=3        ← 正度数多项式环
        ↓ 对称稳定对偶 (Tate duality)
      负度数：H^{-3m-1} = D(P_m)（对偶多项式空间）   ← 全部度数的稳定自同态廓形
        ↓
第2层  bar 复形 K=E⊗B^⊗•⊗E 表示 E⊗^L_B E
   → 有限双模 Y（左右分别投射），W^a = Hom_E^s(X,(YX)[a]) ≅ k (a=-3,0), 其余为 0
   → 迹障碍：特征映射 η: B→DB 不能穿过 perfect B^e-复形
   → 由此造出双模映射 g_H: U_H → Y，其在 X 上的取值非零     ← 双模纤维的关键
        ↓
第3层  F = 纤维：0→F→U₁⊕U₂⊕Q→Y→0（U_i = 右作用被 h_{H_i} 扭的 E）
   → 三角代数 Λ = [[E,0],[F,E]]，锥 P_Z = Cone(V: D₁(P)→D₀(P))
   → Z = c₀P_Z 非投射，P_Z 全循环（totally acyclic）
   → H^a Hom_Λ(P_Z, Z)=0 对 a>0 或 a≤-2                    ← 廓形传递条件
        ↓
第4层  转移原理（Proposition tr:transfer，一般性工具）
   → A = Λ ⋉ DΛ（对称），M = A⊗_Λ Z
   → Ext_A^i(M,M) = Ext_Λ^i(Z,Z) ⊕ Ext_Λ^i(Z, DΛ⊗_Λ Z) = 0
        ↓
第5层  后果（第8节）：Γ_K = End_{A_K}(A_K⊕M_K)^op
   → 同时否定：经典/广义/强 Nakayama、Auslander–Gorenstein、Wakamatsu tilting 猜想，
     以及（无限）小/大 finitistic 维数猜想。
```

**为什么需要负度数信息**（这是本文区别于"只做 Ext 正度数"的普通套路的核心机制）：
平凡扩张 $A=\Lambda\ltimes D\Lambda$ 的诱导模 $M=A\otimes_\Lambda Z$ 的自延伸分裂为两部分：
$$\Ext_A^a(M,M)\cong \Ext_\Lambda^a(Z,Z)\oplus \Ext_\Lambda^a(Z, D\Lambda\otimes_\Lambda Z).$$
第一项由全循环性（正度数比较）处理；第二项 $\Ext_\Lambda^a(Z, \nu Z)$（$\nu=D\Lambda\otimes_\Lambda-$ 为 Nakayama 函子）被**对偶**成 $H^{-a-1}\Hom_\Lambda(P_Z,Z)$，即**负同调度 $-a-1$** 的上同调。所以要让 $a>0$ 消失，需要 $-a-1\le -2$ 处消失。端点 $-2$ 恰对应 $a=1$。这就是转移原理 (tr:two-sided-vanishing) 中"$a>0$ 或 $a\le -2$"这条奇边界线的来历。

**维数账目**（来源：论文正文数值）：
| 对象 | 维数/规模 | 说明 |
|---|---|---|
| $k$ | $\mathbb F_2(q,H_1,H_2)$ | 3 个代数独立参数 |
| $C$ | 10 | 两个角幂等 $e,f$；$eCe$ 是量子外代数 |
| $T=C\ltimes DC$ | 20 | 对称 |
| $B=C\otimes C$ | 100 | |
| $E=T\otimes T$ | 400 | 对称；4 个顶点幂等 |
| $X=s\otimes s$ | 1 | |
| $\Lambda$ | $2\times400+\dim F$ | 上三角矩阵代数 |
| $A=\Lambda\ltimes D\Lambda$ | $2\dim\Lambda$ | 最终对称反例代数 |

**[推测] 为什么选特征 2**：论文 Conventions 一句"Since the field has characteristic two, signs in their differentials and comparison maps disappear"只说了机械好处。更深的结构性原因 [推测] 有三条候选：(1) 迹障碍（Lemma b:trace-obstruction）本质上要"每个角维数都是偶数 ⇒ 投射子的迹为 0"，这在特征 2 是恒等式 $2=0$，奇特征下需要重新设计；(2) $\tau_1,\tau_2$ 的 Koszul 序列在特征 2 中不需要 Koszul 符号，张量积的 attaching map 与稳定像的连接映射在重标下严格一致（论文在 t:vanishing 处明说 "The differentials agree under this reindexing in characteristic two"）；(3) Schulz 的原始例子就在特征 2（$p=q^{-1}$ 的量子外代数），参数平移机制 $\ell_i=x+q^i y$ 的非零性 $1+q^{i+2}\ne 0$ 在任何特征都对，但 $\ell_{-1}$ 与 $y+qx$ 的等式用到 $q\ell_{-1}=qx+y$ 无符号问题。

**[推测] 为什么选三个独立参数**：$q$ 负责十维代数内部的量子外结构（决定合冲链 $\ell_i$ 的非退化性 $1+q^{i+2}\ne0$）；$H_1,H_2$ 负责两个扭转 $U_{H_1},U_{H_2}$ 在 $\mathcal H^{3m}$ 上分别以 $H_1^{-m},H_2^{-m}$、在 $\mathcal H^{-3m-1}$ 上以 $H_i^{m+2}$ 作用；比较映射 $\Delta^a$ 的可逆性最终归结为行列式 $H_1^{-m}+H_2^{-m}\ne0$ 与 $H_1^{m+2}+H_2^{m+2}\ne0$ 之类（特征 2 中"和不为零"="不等"）。若 $H_1,H_2$ 代数相关（如 $H_1=H_2^r$），存在 $m$ 使两者幂相等，比较映射退化。三个参数放到 $\mathbb F_2$ 的有理函数域里，"代数独立"是保证"所有需要的幂次两两不同"的最省事方法（Lean 里就是 `MvPolynomial (Fin 3) (ZMod 2)` 的分式环，`H_powers_distinct` 等引理）。

## 1.4 推论总览

**Corollary (Homological conjectures) `\label{cor:homological}`**（TeX 原文）：
```latex
Let $A,M$ be as in Theorem~\ref{thm:main}. For every field extension
$K/k$, put $A_K=K\otimes_k A$, $M_K=K\otimes_k M$, and
\[
 \Gamma_K=\End_{A_K}(A_K\oplus M_K)^{\mathrm{op}}.
\]
Then $\Gamma_K$ is a finite-dimensional $K$-algebra with the following properties, ...
\begin{enumerate}
\item Every term of the minimal injective resolution of $\Gamma_K$ is projective,
      but $\idim_{\Gamma_K}\Gamma_K=\infty$.
\item There is a nonzero simple module $S$ such that
      $\Ext_{\Gamma_K}^i(S,\Gamma_K)=0$ for every $i\geq0$.
\item There is a projective-injective Wakamatsu tilting module $W$ which is not tilting.
\end{enumerate}
Consequently the classical, generalized, and strong Nakayama conjectures,
the Auslander--Gorenstein conjecture, and the Wakamatsu tilting conjecture
are false for finite-dimensional algebras over $K$.
```

**Corollary (Finitistic dimensions) `\label{cor:finitistic}`**：对每个 $n\ge1$ 存在有限维左 $\Gamma_K$-模 $C_n$ 使 $\pd_{\Gamma_K}C_n=n$，故 $\Gamma_K$ 的小/大左 finitistic 维数均为无穷。这是与 OpenAI 的复数域 finitistic 反例（`OpenAIFinitistic2026`）并列的**特征 2** 例子。

**Corollary (tilting 补) `\label{cor:tilting-complements}`**：$\Gamma_K^{\mathrm{op}}$ 上存在投射的几乎完全 tilting 模，有无限多个两两不同构的不可分补；由 Buan–Solberg 的广义 Nakayama 失败 ⇒ cotilting 补定理取对偶得到。

**Corollary (幂等分层) `\label{cor:stratifying}`**：对每个 $L\ge1$ 存在不可分对称 $K$-代数 $T_L$ 带长度 $\ge L$ 的幂等分层（Chen–Fang–Xi 意义），给出至少 $L$ 步的导出范畴 recollement 链。

**结论对所有扩场成立的原因**：Ext 的基变换 $K\otimes_k\Ext_A^i(U,V)\cong\Ext_{A_K}^i(K\otimes U,K\otimes V)$（有限投射消解），非投射性由非分裂扩张类在忠实基变换下保持非零；对称结构经 $K\otimes_k DA\cong D_K(K\otimes_k A)$ 存活。取 $K$ 为代数闭包即得"特征 2 代数闭域上的例子"（论文特意注明：这不涉及有限域的代数闭包，因为参数是超越元）。

---

# 二、逐引理带批注重构

> 组织方式与论文一致：2.1 同调预备（六条引理）→ 2.2 转移原理 → 2.3 十维代数 → 2.4 多项式稳定自同态与扭转 → 2.5 导出归纳与迹障碍 → 2.6 三角模与反例完成 → 2.7 内射代数后果。
> 每条：(a) 精确陈述（TeX 原文）；(b) 证明机制逐步推演，不跳中间步；(c) 每个假设的机械性理由；(d) [推测] 候选失败路线。

## 2.1 同调预备（论文 §2 "Homological preliminaries"）

本节有三块工具：**全循环比较 + 稳定对偶**（服务三角锥的自同态计算与转移）、**投射模型与稳定像**（服务"导出对象 → 有限双模"的过渡）、**双模求值**（服务"双模层面做构造、在 X 上取值"的一致性）。

### 2.1.1 完全消解比较（Lemma h:comparison）

**(a) 陈述（原文）**：
```latex
\begin{lemma}[Complete-resolution comparison]\label{h:comparison}
Let $P$ be totally acyclic and let $Q$ be an exact complex of projectives.
For every integer $a$ there are natural isomorphisms
\begin{equation}\label{h:comparison-formula}
 H^a\Hom_G^\bullet(P,Q)
 \simeq\sHom_G(c_aP,c_0Q)
 \simeq H^a\Hom_G(P,c_0Q).
\end{equation}
The first isomorphism is induced by cokernels of shifted chain maps and
respects composition. For $a>0$ these spaces are
$\Ext_G^a(c_0P,c_0Q)$.
\end{lemma}
```
其中 Hom 复形是**全积型**：
```latex
 \Hom_G^a(P,Q)=\prod_{j\in\mathbb Z}\Hom_G(P_j,Q_{j-a}),\qquad
 (\delta f)_j=d^Q_{j-a}f_j+f_{j-1}d^P_j.
```

**(b) 证明机制，逐步**：

*第 1 步：全循环性给出"提升性质"。* 若 $J$ 投射，则 $J$ 是 $G$ 的有限直和的直加项，故 $\Hom_G(P,J)$ 正合（把 $\Hom_G(P,G)$ 的正合性逐分量拆出）。把 $c_jP$ 等同于 $\im d_j^P\subset P_{j-1}$。给定 $u:c_jP\to J$，则 $u\,d_j^P:P_j\to J$ 是闭链（因为 $d_{j-1}^Pu d_j^P=0$……注意 $d^2=0$ 给 $d_j^P$ 的像是闭的，准确地说 $u d_j^P d_{j+1}^P=0$）。正合性给 $h:P_{j-1}\to J$ 使 $h d_j^P=u d_j^P$；由于 $d_j^P$ 的像是 $c_jP$（在 $P_{j-1}$ 中），$h$ 在像上等于 $u$，即 $h$ 延拓 $u$。

*第 2 步：第二个同构 $H^a\Hom_G(P,c_0Q)\cong\sHom(c_aP,c_0Q)$。* 把 $N=c_0Q$ 放在 0 度。$\Hom_G(P,N)^a=\Hom_G(P_a,N)$。闭链 = 使 $f d_{a+1}^P=0$ 的映射 = 在 $\ker d_a^P=\im d_a^P=c_aP$ 上良定的映射 $c_aP\to N$。边缘链 = 差一个 $h d_a^P$ 的映射 = 在 $c_aP$ 上等价于"先过 $P_a$ 中一个元素再进入 $N$"——注意 $h d_a^P$ 在 $c_aP$ 上的取值经 $h$ 分解，而 $h:P_{a-1}\to N$ 可分解为过投射 $P_{a-1}$ 的映射……准确地：商"闭/边缘"恰为 $c_aP\to N$ 模掉过 $P_{a-1}$（有限投射）分解者，即 $\sHom_G(c_aP,c_0Q)$。这一步只用了第 1 步的延拓性质来把"过投射分解"转成"由 $P_a$ 的映射诱导"。

*第 3 步：第一个同构（链映射层面），先做 $a=0$。* 给定 $g:c_0P\to c_0Q$，用 $P_0$ 的投射性把 $g$ 与 $c_0$ 投射合成后提升为 $f_0:P_0\to Q_0$（$d^Q_0 f_0$ 落进 $\im d_1^Q$……此处直接提升的是 $c_0P\to P_0\to Q_0\to c_0Q$ 的图）。向上（$j>0$）归纳：假设 $f_j$ 已造好且 $d_j^Q f_j=f_{j-1}d_j^P$，则 $f_{j+1}$ 用 $P_{j+1}\twoheadrightarrow\ker d_j^P$ 的提升性质造出。
向下（$j<0$）归纳的关键：$d_j^Q f_j$ 在 $\ker d_j^P=\im d_{j+1}^P$ 上取值为零——由 $j+1$ 度已建立的链方程 $d_{j+1}^Q f_{j+1}=f_j d_{j+1}^P$ 与 $d_{j+1}^Q d_{j+2}^Q=0$ 得 $d_j^Q d_{j+1}^Q f_{j+1}=0$，故 $d_j^Q f_j$ 杀死 $\im d_{j+1}^P$，从而良定 $c_jP=\im d_j^P\to Q_{j-1}$；再用第 1 步延拓到 $f_{j-1}:P_{j-1}\to Q_j$。于是**每个余核映射提升为整条链映射**。

*第 4 步：同伦与投射分解。* 若 $f$ 同伦于 0，显然 $c_0 f$ 过投射。反向：设 $c_0 f=c_0P\xrightarrow{u}J\xrightarrow{v}c_0Q$。$J$ 内射（$G$ 对称时有限投射=内射；但注意本引理陈述对一般 $G$，此处 $J$ 投射且 $Q$ 正合就够：先延拓 $u$ 到 $P_{-1}$，再提升 $v$ 沿 $Q_1\twoheadrightarrow c_1Q$……论文的实现：把第一因子延拓到 $P_{-1}$、第二因子提升到 $Q_0$，复合给出同伦分量 $h_{-1}:P_{-1}\to Q_0$，其同伦微分消去 $c_0$ 上诱导映射）。
剩下要零同伦"在 $c_0$ 上诱导零"的链映射：取 $h_{-1}=0$；对 $j\ge0$，$f_j+h_{j-1}d_j^P$ 落进 $\im d_{j+1}^Q$，用 $P_j$ 投射性提升到 $h_j:P_j\to Q_{j+1}$；对 $j<0$，$f_j+d_{j+1}^Qh_j$ 杀死 $\im d_{j+1}^P$（由 $j+1$ 度方程），降到 $\im d_j^P$ 上再延拓为 $h_{j-1}:P_{j-1}\to Q_j$。全部方程 $f=dh+hd$ 成立。**乘积容量的机械理由**：全 Hom 是直积，每个方程只涉及两个分量，所以直积里总能装下这些 $h_j$——这是论文最后一句 "The product in (h:full-hom) permits all these components; each equation uses only two of them." 的内容。若用直和（局部有限 Hom），无限多非零 $h_j$ 会装不下。

*第 5 步：一般 $a$。* 把 $P$ 换成 $P[-a]$（仍全循环）。余核构造保持复合与平移。最后：$P$ 的非负尾部消解 $c_0P$，正同调度上 $\Hom_G^\bullet(P,c_0Q)$ 与 $\Hom_G(P_{\ge0},c_0Q)$ 的相邻微分相同，故同调就是 $\Ext_G^a(c_0P,c_0Q)$，含 $a=1$。

**(c) 假设的机械性理由**：
- "$P$ 全循环"只在第 1 步（延拓性质）与最后（$\Ext$ 恒等）用到；$Q$ 只需正合+投射项。所以引理对**非自内射 $G$** 也成立（论文在正文显式指出 "The comparison below also applies when $G$ is not self-injective"）——这为后面对非对称 $\Lambda$ 使用它铺路。
- 全积而非直积：负度数方向无限归纳产生无限多同伦分量。
- $Q$ 项投射：第 3 步提升 $c_0Q$ 上的映射到 $Q_0$ 需要。

**(d) [推测] 候选失败路线**：
1. [推测] 若把 $\Hom^\bullet(P,Q)$ 换成直和型局部有限 Hom，则负度数比较同构失效：构造 $h_j$ 的归纳在无限多负度数上同时活跃，直和装不下，导致 $\sHom(c_aP,c_0Q)$ 与链同伦类集合不再一一对应——具体地，"每个余核映射可提升为链映射"这半边仍对（逐度构造有限），但"同伦 ⇒ 投射分解"的逆命题需要无限同伦。
2. [推测] 若 $P$ 只是正合而非全循环，延拓性质崩溃：$\Hom_G(P,J)$ 不再正合，第 3 步向下的归纳第一步就找不到 $f_{-1}$。这条恰好被本文的三角锥绕开一半——三角代数上列复形 $D_0(P),D_1(P)$ 的全循环性是单独验证的（Lemma t:finite-module 用 $P$ 全循环 + $F$ 左投射）。
3. [推测] 若 $Q$ 只是有界消解而 $P$ 全循环，把 $Q$ 换成 $c_0Q$ 已经涵盖了实际用法；真正危险的是把 $Q$ 换成无界正合非投射复形，则第 2 步"$\Hom(P,N)^a$ 的闭链= $c_aP\to N$"仍成立但第一个同构失去意义（$Q$ 无余核分解语义）。

### 2.1.2 对称稳定对偶 / Tate 对偶（Lemma h:duality）

**(a) 陈述（原文）**：
```latex
\begin{lemma}[Symmetric stable duality]\label{h:duality}
For a symmetric algebra $G$ there are natural isomorphisms
\begin{equation}\label{h:duality-formula}
 D\sHom_G(M,N)\simeq\sHom_G(N,M[-1]).
\end{equation}
There is a linear functional $\lambda_M:\sHom_G(M,M[-1])\to k$ for which
the perfect pairing is $(f,g)\mapsto\lambda_M(gf)$. Consequently, for every
integer $a$ the pairing
\begin{equation}\label{h:shifted-pairing}
 \sHom_G(M,N[a])\times\sHom_G(N,M[-a-1])\longrightarrow k,
 \qquad (\alpha,\beta)\longmapsto\lambda_M\bigl(\beta[a]\alpha\bigr)
\end{equation}
is perfect and natural.
\end{lemma}
```

**(b) 证明机制**：
1. 对有限投射 $J$，伴随链 $D\Hom_G(J,N)\cong\Hom_G(NDJ, k)$……论文写法：$D\Hom_G(J,N)\simeq\Hom_G(N,DG\otimes_GJ)\simeq\Hom_G(N,J)$。第一段对 $J=G$ 是向量空间对偶的标准恒等 $\Hom_k(G\otimes ?,?)$；有限直和与直加项传递。第二段用固定的对称化形式（$DG\cong G$）。
2. 把它逐项作用于 $M$ 的完全消解 $P$。取 $\Hom_G(P,N)$ 的 0 度上同调的对偶：
$$\frac{\Hom_G(N,\ker(P_0\to P_{-1}))}{\im(\Hom_G(N,P_1)\to\Hom_G(N,\ker(P_0\to P_{-1})))}.$$
关键：$\ker(P_0\to P_{-1})=c_1P=M[-1]$（注意指标：$P$ 同调指标、微分降低度，$M=c_0P$，则 $c_1P$ 是 $M$ 的合成元/即 $M[-1]$）。"过投射分解"的提升：任何过投射的 $N\to M[-1]$ 可沿 $P_1\twoheadrightarrow c_1P$ 提升（$P_1$ 投射 + $M[-1]$ 的投射覆盖在 $P_1$ 上截断……论文原话 "A factorization through any projective lifts through $P_1\twoheadrightarrow c_1P$"）。所以上面这个商**恰好是** $\sHom_G(N,M[-1])$。
3. 定义 $\lambda_M(g)$ 为 $1_M$ 与 $g$ 的配对。$N$ 处的自然性，取 $f:M\to N$，把 $f$ 与 $g$ 的配对化成 $\lambda_M(gf)$——这是"右乘 $f$ 移到配对第一槽"的标准操纵。
4. 平移版本：$N\to N[a]$，$\sHom(M,N[a])$ 与 $\sHom(N,M[-a-1])$ 对偶，配对 $(\alpha,\beta)\mapsto\lambda_M(\beta[a]\alpha)$。指标 $-a-1$ 的来历：$-a-1 = -(a)-1$，即 $N[a]$ 与 $M$ 的对偶落在 $M[-a-1]$（0 度时 $-1$）。

**(c) 假设的机械性理由**：
- "对称"只在两处使用：有限投射=内射（$P_1\twoheadrightarrow c_1P$ 的核分裂、提升），与 $DG\cong G$（第一段恒等）。半忠实/自内射代数只有单向版本（Nakayama 对偶 $D\Hom(-,\nu)\cong\Hom(\nu-,-)$），本文精确用了"完全"的对称版本。
- 完全消解存在性：对称 ⇒ 每个有限模嵌入有限投射（把投射覆盖对偶），拼接出完全消解。
- 配对要求 $M$ 是被 $\lambda_M$ 参照的对象，即配对**不对称**于 $M,N$；这是后文扭转权重计算（Prop e:twists）里"先定 $\mathcal H^{-1}$ 的生成元作用再配对传播到所有负度数"的机关。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $G$ 只是 Frobenius（$G\cong DI$ 某双模 $I$ 而非 $G$ 本身），对偶公式变形为 $D\sHom(M,N)\cong\sHom(N,\nu M)$（Nakayama 函子 $\nu=DI\otimes-$），$\lambda_M$ 变成 $\sHom(M,\nu M)$ 的泛函——负度数的"多项式对偶"结构仍可能在，但 (h:shifted-pairing) 的第 $M$ 槽必须插 $\nu$，扭转权重会带上 $\nu$-扭转，整体代数更难控制。
2. [推测] 若 $M$ 非有限维，$D$ 反变正合性失效（向量空间对偶只对有限维忠实），商-对偶交换步骤失败。
3. [推测] $\lambda_M$ 的选取看似任意，其实影响所有负度数映射的"坐标"：若 $\lambda_M$ 选成另一个泛函 $\lambda'_M=c\lambda_M$，则负度数的对偶坐标整体乘 $c$，扭转权重公式（Prop e:twists）不变（标量齐次）。但若选了依赖平移的不协调泛函族，(e:pairing) 的相容性 (e:transpose) 会断裂——论文通过固定 $\lambda$ 于 $\mathcal H^{-1}$ 并用组合配对 (e:pairing) 定义所有 $m$ 层，避免了这个问题。

### 2.1.3 导出映射与二胞腔模型（Lemma h:derived-models）

**(a) 陈述（原文）**：
```latex
\begin{lemma}[Derived maps and two-cell models]\label{h:derived-models}
A bounded-below complex $P$ of projectives computes derived maps out of it
by chain maps modulo homotopy. Every bounded complex of finite modules has
such a projective model with finite terms. In particular, two such models
of the same derived object are homotopy equivalent.

Suppose a derived triangle is given by
\[
 L\longrightarrow V\longrightarrow R\xrightarrow{\partial}L[1].
\]
For projective models $P_L,P_R$ and a chain map
$b:P_R\to P_L[1]$ representing $\partial$, a model of $V$ is the two-cell
complex
\begin{equation}\label{h:two-cell}
 P_{V,j}=P_{L,j}\oplus P_{R,j},\qquad
 d_j^{P_V}=\begin{pmatrix}d_j^{P_L}&b_j\\0&d_j^{P_R}\end{pmatrix}.
\end{equation}
Its subcomplex and quotient represent $L$ and $R$, and its connecting
map is the specified $\partial$.
\end{lemma}
```

**(b) 证明机制**：
1. **$K$-投射性（有界下方向）**：设 $P$ 有界下、项投射，$A$ 任何正合复形，$f:P\to A$ 链映射。从 $P$ 的最低非零度 $n_0$ 开始：$f_{n_0}$ 落进 $Z(A_{n_0})=\im d_{n_0+1}$，用 $P_{n_0}$ 投射提升得 $h_{n_0}:P_{n_0}\to A_{n_0+1}$；向上一度：$f_j-dh_{j-1}$ 是闭链（用前一步方程），再提升。归纳得 $f=dh+hd$。所以从 $P$ 出发的导出映射 = 链映射模同伦。
2. **有限模的有限投射模型**：对有界有限复形 $V$，归纳造 $\theta:Q\to V$：第 $j$ 项取有限投射 $Q_j\twoheadrightarrow\{(x,y)\in V_j\oplus Q_{j-1}: d_Vx=\theta(y),\ d_Qy=0\}$（这是比较锥的闭链空间），两个分量分别给 $\theta_j$ 与 $d_j^Q$。比较锥的每个闭链都是边缘 ⇒ $\theta$ 是拟同构。集合 $\{(x,y):\dots\}$ 是有限维的（$V_j$ 有限、$Q_{j-1}$ 有限归纳），所以 $Q_j$ 可取有限——"有限项"的全部机械内容就在这里。
3. **二胞腔模型**：给三角形 $L\to V\to R\xrightarrow{\partial}L[1]$，取投射模型 $P_L,P_R$ 与代表 $\partial$ 的链映射 $b:P_R\to P_L[1]$。标准论证：三角形的第一箭头由链映射 $f:P_L\to P_V$ 代表，$\Cone(f)$ 代表 $R$，而把 $\Cone(f)\to P_L[1]$ 再取锥时以 $P_V$ 为子复形、以 $\Cone(1_{P_L})$（收缩复形）为商，故它代表 $V$。把模型换成同伦等价的、把映射换成指定代表元：同伦交换方块诱导带同伦 off-diagonal 分量的锥映射，同伦映射有同构的锥。结果 $\Cone(b[-1])$ 逐项就是 (h:two-cell)。

**(c) 假设的机械性理由**：
- "有界下"：归纳需要起点；对**完全消解不成立**——论文特意警告 "it does not assert $K$-projectivity of a complete resolution"（完全消解两个方向都无限，无最低度可起步）。这条警告在 b:evaluated-lift 的证明里被认真对待（"one may take a bounded-below projective resolution $Q\to U$ ... and lift the global chain map"）。
- "有限项"：保证后续所有 $F$、$Y$、核、余核都有限维——主定理的"有限维"最终从这些模型继承。
- 锥约定 (h:cone) 是 $\Cone(f)_j=N_j\oplus L_{j-1}$、微分 $\begin{pmatrix}d_j^N&f_{j-1}\\0&d_{j-1}^L\end{pmatrix}$（下三角），特征 2 中上/下三角无符号差别。

**(d) [推测] 候选失败路线**：
1. [推测] 若把二胞腔模型直接套在 $\mathcal J=T\otimes_C^{\mathbf L}s$（有界下但正端无限延伸）上，模型存在但"有限项"不再自动。论文的处理：在 b:profile 中取模型 $A_\bullet,Q_\bullet$ 后做**双复形张量+四级过滤**；同调有界性来自每层同调集中于一点，张量后同调层为 $X,\ X[-2]\oplus X[-2],\ X[-4]$。若过滤分析漏掉顶层向底层的跨接分量，$W^0$ 的 $k$ 会算丢——b:profile 的 $r_l$（实际连接映射）分析专门允许了这个分量（"This argument permits an additional component of the top attaching map into the bottom level"）。
2. [推测] 换锥约定（上/下三角、指标偏移 $\pm1$）会使 (h:two-cell) 的 $b_j$ 指标平移，进而稳定像引理中 cross differential 的重标 $a-1$ 错位；本文所有指标由特征 2 + 固定约定锁死。
3. [推测] $b$ 的代表元不唯一（差一个同伦），锥在同伦范畴中同构，稳定像引理对同伦不敏感；真正的敏感点在 attaching map 的**稳定像**（Lemma h:stable-image 末句），那里要求 Ext 类限制到高度数时的逐次合成元序列一致。

### 2.1.4 稳定像（Lemma h:stable-image）

**(a) 陈述（原文）**：
```latex
\begin{lemma}[Stable images]\label{h:stable-image}
Let $G$ be symmetric and let $P$ be bounded below with projective terms and
bounded homology. For $n$ sufficiently large the formula
\begin{equation}\label{h:stable-image-formula}
 \langle P\rangle=(c_nP)[n]
\end{equation}
defines a stable module, independent of $n$ up to natural stable
isomorphism. It is functorial on derived maps represented by such models,
commutes with shifts, sends a module to its stable class, and sends an Ext
class to its corresponding stable map.

A degreewise split short exact sequence $0\to P_L\to P_V\to P_R\to0$
of these complexes gives a stable connecting map
$\langle P_R\rangle\to\langle P_L\rangle[1]$ and the associated long exact
stable Hom sequences. With respect to a graded splitting, this connecting
map is the stable image of the cross differential
$b:P_R\to P_L[1]$ in \eqref{h:two-cell}.
\end{lemma}
```

**(b) 证明机制**：
1. **$n$ 无关性**：同调支撑之上，合成长序列 $0\to c_{n+1}P\to P_n\to c_nP\to0$ 正合，自然给出 $(c_{n+1}P)[n+1]\cong(c_nP)[n]$（稳定同构，且在链映射上自然）。同伦把 $c_n(f)$ 改变为过 $P_{n-1}$ 分解的映射 ⇒ 构造降到同伦类。再由 2.1.3 得对导出映射的函子性。平移相容：$c_n(P[a])=c_{n-a}P$。模：取投射消解即可恢复逐次合成元。Ext 类：把提升的代表元限制到高度数即得同一串合成元。
2. **短正合列的余核列**：选 $n$ 使三个复形都 $\ge n$ 正合，得
   $0\to c_nP_L\to c_nP_V\to c_nP_R\to0$。
   左单性逐元素验证：设 $(x,0)=d_{n+1}^{P_V}(u,v)$，则 $d_{n+1}^{P_R}v=0$，故 $v=d_{n+2}^{P_R}w$（某个 $w$）；链方程 $d_Lb+bd_R=0$ 给出 $x=d_{n+1}^{P_L}(u+b_{n+2}w)$。中间正合与右满由 graded splitting 的分量提升得到。
3. **连接映射 = cross differential 的稳定像**：核心交换图（正合行）
```
0 → c_{n+1}P_R → P_{R,n}  → c_nP_R → 0
        │ b̄_{n+1}     │             ‖
        ▼             ▼             ▼
0 → c_n P_L   → c_nP_V   → c_nP_R → 0
```
中间竖映射把 $z$ 送成 $(0,z)$ 的类；对边缘元素 $d_{n+1}^{P_R}z$，其值为 $(b_{n+1}z,0)$ 的类（因为 $(b_{n+1}z,\,d_{n+1}^{P_R}z)$ 在 $P_V$ 中是边缘：$d^{P_V}(0,z)=(b_{n+1}z,d^{P_R}_{n+1}z)$）。所以左竖映射恰由 $b_{n+1}:P_{R,n+1}\to P_{L,n}$ 诱导。左竖映射平移 $[n+1]$ 后是 $\langle P_R\rangle\to\langle P_L\rangle[1]$；由 2.1.2 后连接映射的"合成元"描述，它就是 $\langle b\rangle$。长正合稳定 Hom 列随之而来。

**(c) 假设的机械性理由**：
- "对称"：$\langle P\rangle$ 的定义本身不用对称，但"Ext 类↔稳定映射"的正则性用了 2.1.1 的比较与 (h:stable-ext)。
- "degreewise split"：保证余核列仍短正合；一般正合时 $c_nP_L\to c_nP_V$ 未必单。
- 有界同调：$\langle P\rangle$ 良定要求高 $c_nP$ 稳定（$n$ 大到同调支撑之外）。

**(d) [推测] 候选失败路线**：
1. [推测] 若序列不 degreewise 分裂，$c_n$ 不保单，长正合列失效——第 7 章的 (t:fiber-hom)（求值后长正合列）失去依据。本文纤维序列因 $Y$ 两侧投射而两侧分裂，恰好满足。
2. [推测] 交换图中"$(b_{n+1}z,0)$ 的类"依赖 graded splitting 的选取；不同 splitting 下 cross differential 差一个链同伦，稳定像相同。若在**链**层面追踪（如 Lean 中 `CompleteCone.crossMap`），指标约定错误会在此暴露。
3. [推测] 若同调无界（完全消解本身），$n$ 无关性失败——$\Omega^n M[n]$ 依赖 $n$ 的选取。本文完全消解的自同态计算走 2.1.1 的比较路径，不经过此式。

### 2.1.5 零稳定像 ⇒ perfect 分解（Lemma h:perfect-factor）

**(a) 陈述（原文）**：
```latex
\begin{lemma}[Vanishing stable image and perfect factorization]
\label{h:perfect-factor}
Over a symmetric algebra, a derived map between bounded derived objects
whose stable image is zero factors in the derived category through a
perfect complex.
\end{lemma}
```

**(b) 证明机制**：
1. 取有界下投射模型 $P,Q$，链映射 $f:P\to Q$ 代表导出映射（2.1.3 保证可取整体链映射）。取足够大的 $n$：两复形 $\ge n$ 正合且 $c_n(f)$ 过有限投射 $J$ 分解：
   $c_nP\xrightarrow{u}J\xrightarrow{v}c_nQ$。
2. $J$ 内射 ⇒ $u$ 沿包含 $c_nP=\im d_n^P\subset P_{n-1}$ 延拓为 $P_{n-1}\to J$；$J$ 投射 ⇒ $v$ 沿 $Q_n\twoheadrightarrow c_nQ$ 提升为 $Q_n\to J$。复合给同伦分量 $h_{n-1}:P_{n-1}\to Q_n$。
3. 于是 $f_n+h_{n-1}d_n^P$ 投影到 $c_nQ$ 为零 ⇒ 经 $d_{n+1}^Q$ 提升为 $h_n:P_n\to Q_{n+1}$。归纳：$j>n$ 时链方程+前一同伦方程 ⇒ $f_j+h_{j-1}d_j^P$ 落进 $\ker d_j^Q=\im d_{j+1}^Q$，提升为 $h_j$。$j<n-1$ 置 $h_j=0$。
4. 同伦后的 $f'=f+dh+hd$ 在所有 $j\ge n$ 消失。其 $n$ 度链方程读作
   (h:truncation-boundary)：$f'_{n-1}d_n^P=0$。
   于是剩余分量定义了到实际同调子复形 $Q_{\le n-1}$（保留 $j\le n-1$ 的项）的链映射，截断处的边界条件恰是上式。$Q_{\le n-1}$ 有界+项投射 = perfect。复合上模型映射得导出分解。
5. 目标为模的情形：先把导出映射整体提升到该模的投射消解，再套用上述论证。

**(c) 假设的机械性理由**：
- 对称：只在第 2 步用"$J$ 内射"延拓 $u$。对称 ⇒ 有限投射=内射。[推测] 自内射即可，对称性是冗余保险。
- 有界导出对象：保证有界下模型存在。目标无界时 $Q$ 不存在，引理无从下手。

**(d) 用途（重要）**：这条引理是 b:evaluated-lift 的**矛盾引擎**：那里先假设 $b_0\phi=0$（稳定像零），得 $b_0\pi m: K\to U$ 过 perfect $E^e$-复形分解；限制到 $B^e$ 后抽出特征映射 $\eta$，再用迹障碍（2.5.3）矛盾。[推测] 失败路线：(1) 代数仅自内射非对称时，$u$ 延拓仍可行，但"稳定像为零"的判定失去对偶判据（2.1.2 断裂），整条"非零 ⇒ 提升存在"的逻辑链断在起点；(2) 若 perfect 中间对象的项无限维，限制到 $B^e$ 后不再 perfect（有限项过滤论证失效），迹障碍无法应用。

### 2.1.6 有限平移与双模求值（Lemma h:evaluation）

**(a) 陈述（原文，节选）**：
```latex
\begin{lemma}[Finite shifts and evaluation]\label{h:evaluation}
Every stable shift of a finite side-projective bimodule has a finite
side-projective representative. Evaluation at a finite $E$-module $X$
sends stable maps between these bimodules to stable $E$-module maps and
has natural identifications
\begin{equation}\label{h:evaluation-shifts}
 (L[a])X\simeq(LX)[a],\qquad L(X[a])\simeq(LX)[a].
\end{equation}
It preserves the stable connecting maps of short exact sequences of
side-projective bimodules, and these identifications are natural in both
$L$ and $X$.

If $P$ is a bounded-below complex of projective bimodules with bounded
homology and all sufficiently high $c_nP$ are side-projective, then
$P\otimes_EX$ has bounded homology and
\begin{equation}\label{h:evaluation-image}
 \langle P\rangle X\simeq\langle P\otimes_EX\rangle,
\end{equation}
naturally on maps and on connecting maps from degreewise split sequences
of such complexes. The hypothesis on the high cokernels holds whenever
$P$, considered separately on either side, is homotopy equivalent to a
bounded complex of projectives on that side.
\end{lemma}
```
（"side-projective" = 作为左、右 $E$-模都投射；不要求 $E^e$-投射。记 $LX=L\otimes_EX$。）

**(b) 证明机制（关键四段）**：
1. **有限平移代表元**：正平移用有限投射-内射嵌入
$$L\longrightarrow\Hom_k(E^e,L),\qquad z\mapsto(a\mapsto az),\qquad (r\varphi)(a)=\varphi(ar).$$
靶由上同调（coinduction）内射，且因 $E^e$ 对称而投射（对称化形式 = $E$ 的对称化形式在 $E^e$ 上的张量）；嵌入在每一侧分裂（$L$ 该侧内射），余核仍 side-projective。迭代得每个平移的有限代表元。
2. **求值保投射分解**：$E^e$-投射在 $X$ 上求值是 $E$-投射：自由双模 $E\otimes E$ 求值为 $E\otimes X$（投射），传到有限直和与直加项。side-projective 双模的短正合列在右侧分裂 ⇒ 求值后仍正合 ⇒ (h:evaluation-shifts) 第一式；用投射表示描述连接映射，被求值保持。
3. **第二式与函子性**：固定 $L$，右投射使 $L\otimes_E-$ 正合，左投射使它保投射；作用于投射消解与投射-内射上同调得 $L(X[a])\cong(LX)[a]$。双模映射 $L\to L'$ 给这些复形上的自然变换。$X$ 处自然性同理。
4. **复形断言与 side-projective 判据**：右投射 ⇒ 高余核序列求值后正合 ⇒ $P\otimes_EX$ 同调有界、项投射；右正合给 $c_n(P\otimes_EX)=(c_nP)\otimes_EX$。若一侧同伦等价于支撑 $\le d$ 的复形，则 $n>d$ 时同伦恒等式 $1_{P_n}=d_{n+1}h_n+h_{n-1}d_n$ 过余核给
   $1_{c_nP}=(\pi_nh_{n-1})\overline d_n$（$\overline d_n:c_nP\to P_{n-1}$），即 $c_nP$ 是该侧投射的直加项。**同伦不必是双模同伦**——两侧分别验证。

**(c) 假设的机械性理由**：
- "$E^e$ 对称"：第 1 步的靶 $\Hom_k(E^e,L)$ 要"内射且投射"，内射来自 coinduction，投射来自 $E^e$ 对称。
- "high $c_nP$ side-projective"：使 $\langle P\rangle X\cong\langle P\otimes_EX\rangle$。充分条件（两侧分别有有界投射模型）正是 bar 复形 $K$ 的情况（$B$ 两侧投射维数 $\le4$，见 2.3.2）。
- $X$ 有限：求值的正合性与有限性传递需要。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $E^e$ 非对称（如 $E$ 是 Frobenius 但 Nakayama 自同构非平凡），第 1 步的靶仍内射但不投射，迭代余核丢失 side-projectivity，$Y$ 的有限代表元不存在，b:bimodule 全线塌方。取 $E=T\otimes T$（$T$ 平凡扩张对称）正是为了让 $E^e$ 对称。
2. [推测] $-\otimes_EX$ 只在 $L$ 右投射时正合；若 $Y$ 只左投射，(h:evaluation-shifts) 第二式失效（$X$ 非投射），W-廓形 (b:W) 的定义失去良定性的一半。
3. [推测] "同伦不必是双模同伦"是隐藏陷阱：若试图在 $E^e$-同伦范畴收缩 bar 复形，会因 $\pd_{E^e} E$ 未必 $\le4$ 失败。Lean 中 bar 复形的侧收缩用左右**两条分别**的同伦实现（对应 `CompleteTensor.FiniteModule.complete`：正端项 $Cf, Ce, Ce,\dots$ 的 $\rho_u,\rho_{\ell_i}$ 链、负端项是对偶构造）。

## 2.2 转移原理（论文 §3 "Passing to a symmetric algebra"）

### 2.2.1 平凡扩张的对称性（Lemma tr:trivial-symmetric）

**(a) 陈述（原文）**：
```latex
\begin{lemma}\label{tr:trivial-symmetric}
The trivial extension $R\ltimes DR$ is a finite-dimensional symmetric
algebra.  In particular, its left and right regular modules are
injective in the categories of all unital modules.
\end{lemma}
```

**(b) 证明机制**：双模结构 $(a\lambda b)(c)=\lambda(bca)$；乘法 $(a,\lambda)(b,\mu)=(ab,a\mu+\lambda b)$；泛函 $t(a,\lambda)=\lambda(1)$，给配对
$t((a,\lambda)(b,\mu))=\mu(a)+\lambda(b)$。
对称性与非退化性逐点验证：若 $t((a,\lambda)(b,\mu))=0$ 对一切 $(b,\mu)$，先取 $\mu$ 任意得 $\lambda=0$，再取 $(b,0)$ 得 $a=0$……论文实际写法：配对对称（$\mu(a)+\lambda(b)$ 对换 $(a,\lambda)\leftrightarrow(b,\mu)$ 不变）且非退化，结合代数结构使它成为结合双线性形式，故 $R\ltimes DR\cong D(R\ltimes DR)$ 作为双模。
内射性部分：对任意 $k$-代数 $G$，$\Hom_G(L,DG)\cong\Hom_k(L,k)$（自然同构）说明 $DG$ 是左 $G$-内射；右同。这一步对**任意单式模 $L$**（不必有限维）成立，因为向量空间对偶正合。对称代数的正则模内射，结论即得。

**(c) 假设的机械性理由**：
- "有限维"：$DR=\Hom_k(R,k)$ 有限维、乘法有限维双线性；否则 $DR$ 无意义（要用连续对偶）。
- 内射断言用"全模范畴"而不仅是有限维模——后面 2.2.2 中 $\Hom_\Lambda(P_j,R)$ 的有限性虽被使用，但引理本身给了最大适用范围。

**(d) [推测] 候选失败路线**：
1. [推测] 若把 $\ltimes$ 换成一般二步扩张（square-zero extension by 非对偶双模），对称形式 $t(a,\lambda)=\lambda(1)$ 没有定义，对称性需要双模与 $R$ 的对偶同构这一额外输入——一般二步扩张只是 Frobenius 的候选。
2. [推测] 特征 2 中 $\mu(a)+\lambda(b)$ 的"和"其实是普通加法；特征 2 下 $t((a,\lambda)^2)=2\lambda(a)=0$，所有元素平方迹为零——迹形式是**交错**的。这在迹障碍（2.5.3）里"投射子的迹为零"会再次出现，是特性而非缺陷。

### 2.2.2 转移原理（Proposition tr:transfer）——全文的"发动机缸体"

**(a) 陈述（原文）**：
```latex
\begin{proposition}[Transfer through the trivial extension]
\label{tr:transfer}
Let $P$ be a totally acyclic complex of finite projective left
$R$-modules, and put $Z=c_0P$.  Suppose that $Z$ is nonprojective and
\begin{equation}\label{tr:two-sided-vanishing}
 H^a\Hom_R(P,Z)=0
 \qquad\text{for }a>0\text{ and for }a\leq -2.
\end{equation}
Then
\[
 A=R\ltimes DR,\qquad M=A\otimes_R Z
\]
are a finite-dimensional symmetric algebra and a finite-dimensional
nonprojective left $A$-module satisfying
\[
 \Ext_A^a(M,M)=0\qquad(a>0).
\]
\end{proposition}
```

**(b) 证明机制，逐步**（这是全文最值得逐步吃透的论证）：

*第 1 步：Nakayama 函子与对偶求值。* 记 $\nu=DR\otimes_R-$，$I=\nu P$。有限投射性给自然同构
```latex
\begin{equation}\label{tr:nakayama-evaluation}
 DR\otimes_R P_j\simeq D\Hom_R(P_j,R),
 \qquad
 \Hom_R(Z,DR\otimes_R P_j)\simeq D\Hom_R(P_j,Z).
\end{equation}
```
推导：先对有限自由模 $P_j=R^{\oplus n}$：$DR\otimes_RR^{\oplus n}\cong DR^{\oplus n}\cong D(R^{\oplus n})$（因为 $\Hom_R(R^{\oplus n},R)\cong R^{\oplus n}$ 作为右模，$D$ 把它变成 $DR^{\oplus n}$）；直加项传递（$D$ 与张量都加性）。第二式是第一式对 $V=P_j$ 与 $\Hom_R(Z,-)$ 的结合：$\Hom_R(Z,DV)\cong D(V\otimes_RZ)$……论文直接写的是 $(Z,DR\otimes_RP_j)\cong D\Hom_R(P_j,Z)$，由 $Z$ 有限：$\Hom_R(Z,DW)\cong D(W\otimes_RZ)$，再 $P_j$ 投射把 $P_j\otimes_RZ\cong\Hom_R(P_j,Z)$ 恢复（这是标准的 Hom-张量对，$P_j$ 有限投射时成立）。
推论：$\Hom_R(P_j,R)$ 是有限右投射，故 $I_j$ 是左内射。$P$ 全循环 + $D$ 正合 ⇒ 整条 $I$ 正合。

*第 2 步：$A$-投射消解。* 右 $R$-模分解 $A=R\oplus DR$。所以 $\Res^A_R(A\otimes_RP)=P\oplus I$ 正合。每项 $A\otimes_RP_j$ 是 $A$-有限投射（诱导保分裂直和表示）。右正合性给 $c_0(A\otimes_RP)=A\otimes_RZ=M$。于是 $A\otimes_RP$ 的非负尾部是 $M$ 的投射消解。论文强调："the tensor exactness needed here has been proved for this resolution; flatness of $A_R$ is not an additional hypothesis"——正合性是逐项验证的（$P_j$ 投射 ⇒ 张量正合），不是假设 $A_R$ 平坦。

*第 3 步：内射尾部与负度数对偶。* 令 $N=\nu Z$。右正合给 $N=c_0I$；$I$ 正合把余核等同于 $\im(I_0\to I_{-1})$，故
```latex
\begin{equation}\label{tr:injective-tail}
 0\longrightarrow N\longrightarrow I_{-1}
 \longrightarrow I_{-2}\longrightarrow I_{-3}\longrightarrow\cdots
\end{equation}
```
是**内射上同调**（coresolution）。设 $C^j=\Hom_R(P_j,Z)$，微分 $\delta^j:C^j\to C^{j+1}$。对 (tr:injective-tail) 作用 $\Hom_R(Z,-)$：$\Hom_R(Z,I_{-m})\cong D\Hom_R(P_{-m},Z)=DC^{m}$（用 (tr:nakayama-evaluation) 第二式，$j=-m$）。$\Hom_R(Z,-)$ 左正合，内射项上正合，所以正同调度 $0,1,2,\dots$ 处的复形是
$$DC^{-1}\xrightarrow{D\delta^{-2}}DC^{-2}\xrightarrow{D\delta^{-3}}DC^{-3}\to\cdots$$
（度 $a\ge0$ 的项是 $DC^{-a-1}$；度 0 的项 $DC^{-1}$ 前面还有 $\Hom_R(Z,N)$——但 $\Ext$ 从度 1 开始算商，度 1 的上同调 $=DC^{-2}/\im D\delta^{-2}$，两侧箭头都在）。于是对 $a>0$：
```latex
\begin{equation}\label{tr:negative-duality}
 \Ext_R^a(Z,N)\simeq D H^{-a-1}\Hom_R(P,Z)=0.
\end{equation}
```
**指标账目**（务必吃透）：度 $a$ 的项是 $DC^{-a-1}$，上同调 = $D(H^{-a-1})$。要让 $a=1$ 消失需要 $H^{-2}=0$——这就是 (tr:two-sided-vanishing) 里端点 $-2$ 的确切来历（论文原文："The first of these equalities uses degree $-2$, which accounts for the endpoint in (tr:two-sided-vanishing)"）。

*第 4 步：合并。* 用已造好的 $A$-投射消解与诱导-限制伴随：
$$\Ext_A^a(M,M)\cong\Ext_R^a(Z,\Res^A_RM)\cong\Ext_R^a(Z,Z)\oplus\Ext_R^a(Z,N)=0\quad(a>0).$$
第一项：$\Res^A_RM=Z\oplus N$ 的 $Z$ 部分，由 (tr:two-sided-vanishing) 正度数 + Lemma h:comparison（把 $H^a\Hom^\bullet_R(P,Z)$ 等同于 $\Ext^a_R(Z,Z)$，$P$ 是 $Z$ 的完全消解）消失。第二项由 (tr:negative-duality) 消失。

*第 5 步：$A$ 对称、$M$ 有限、$M$ 非投射。* 对称由 2.2.1。非投射：若 $M$ 是 $A^r$ 的直加项，与商 $A\to R$ 张量（张量函子保分裂恒等复合，无需平坦性）得
$$R\otimes_AM\cong R\otimes_A(A\otimes_RZ)\cong Z$$
是 $R^r$ 的直加项，与 $Z$ 非投射矛盾。

**(c) 假设的机械性理由**：
- "$P$ 全循环、项有限投射"：第 1 步的对偶求值需要项有限投射（(tr:nakayama-evaluation)）；全循环用于 $\Ext_R^a(Z,Z)$ 的比较。
- "$Z$ 非投射"：保证最终 $M$ 非投射。
- (tr:two-sided-vanishing) 的两个范围：正度数管 $\Ext(Z,Z)$；$\le-2$ 经对偶管 $\Ext(Z,\nu Z)$。度 $-1$ **不被要求**为零（事实上在最终例子里 $H^{-1}\End(P_Z)=k\ne0$，见 2.6.3 Remark）——因为 $a=0$（即 $\Ext^0=\Hom$）不需要消失。
- "$R$ 有限维"：$DR$ 有限维、$A$ 有限维。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $Z$ 的完全消解 $P$ 的项只投射不有限，(tr:nakayama-evaluation) 的"先自由后直加项"论证失效（$D$ 不与无限直和交换），$I$ 的项不再内射，(tr:injective-tail) 崩溃。这正是所有构造坚持"有限"的原因之一。
2. [推测] 若只验证 $a\le-3$ 的负消失（漏 $-2$），则 $\Ext_A^1(M,M)\cong D H^{-2}\ne0$ 可能——一阶自延伸不消失，恰好回到 Böhmler–Marczinzik 式的部分反例。边界度数是全文最脆的地方，三角代数那里（2.6.3）要单独验证 $a=1,-2$。
3. [推测] 若试图用 $A=\Lambda\ltimes D\Lambda$ 的**右**模版本（即把 $M$ 做成右模），需要 $P$ 是右模复形，$F$ 的左右投射角色互换；论文选择左模约定贯穿始终，避免了这个分叉。
4. [推测] 非投射性的"张量保分裂恒等"论证在 $A_R$ 非平坦时仍成立（分裂性是等变存在性，不是正合性），但**另一个方向的尝试**——直接证明 $\Res M$ 非投射——会失败，因为 $\Res^A_RM=Z\oplus N$ 的直和项 $Z$ 非投射不代表整个直和非投射。所以论文从 $A\to R$ 的商侧打。

## 2.3 十维代数（论文 §4 "The ten-dimensional algebra"）

工作域固定为 $k=\mathbb F_2(q,H_1,H_2)$，$q,H_1,H_2$ 代数独立。

### 2.3.0 代数 $C$ 的定义（基与乘法表）

角幂等分块：
```latex
\begin{equation}
\begin{array}{c|c@{\qquad}c|c}
\text{corner}&\text{basis}&\text{corner}&\text{basis}\\ \hline
eCe&e,x,y,z&eCf&u,v\\
fCe&t,j&fCf&f,n.
\end{array}
\label{a:corners}
\end{equation}
```
单位 $1=e+f$。完整乘法表（行 = 左因子）：
```latex
\begingroup
\setlength{\arraycolsep}{4pt}
\begin{array}{c|cccccccccc}
 &e&f&x&y&z&u&v&t&j&n\\ \hline
e&e&0&x&y&z&u&v&0&0&0\\
f&0&f&0&0&0&0&0&t&j&n\\
x&x&0&0&qz&0&v&0&0&0&0\\
y&y&0&z&0&0&v&0&0&0&0\\
z&z&0&0&0&0&0&0&0&0&0\\
u&0&u&0&0&0&0&0&y+qx&z&v\\
v&0&v&0&0&0&0&0&qz&0&0\\
t&t&0&j&q^2j&0&(1+q)n&0&0&0&0\\
j&j&0&0&0&0&0&0&0&0&0\\
n&0&n&0&0&0&0&0&qj&0&0
\end{array}
\endgroup
```

**分度**（机械核心）：$\deg e=\deg f=0$，$\deg u=\deg t=1$，$\deg x=\deg y=\deg n=2$，$\deg v=\deg j=3$，$\deg z=4$。乘法表对分度齐次，且 $z$ 是唯一 4 度基向量、4 度以上乘积全零。

### 2.3.1 结合性（Lemma a:table）

**(a) 陈述（原文）**：
```latex
\begin{lemma}\label{a:table}
The table \eqref{a:multiplication} defines an associative unital algebra
of dimension ten.  Its radical is the span of the eight basis vectors
other than $e,f$, and $(\rad C)^5=0$.
\end{lemma}
```

**(b) 证明机制**：
1. 分度齐次 + 角相容 ⇒ 含幂等元的结合性、或相邻角不匹配的三元组自动成立。
2. 总度 > 4 的正度数三元组：两个括号都为零（$C^5=0$ 的分度体现）。
3. 剩下可结合的三元组与两括号公共值**逐一列表**：
```
abc   | utu        | tut          | xut | yut | ntu | unt | txu | tyu | utx | uty  | tun
(ab)c | (1+q)v     | q(1+q)j      | qz  | qz  | 0   | qz  | 0   | 0   | z   | q^2z | 0
```
每个值由乘法表的两步应用得到；由三线性穷尽结合性检查。例如 $utu$：$ut=u$（$u$ 行 $t$ 列 $=y+qx$？不对——查表：$u\cdot t=y+qx$，故 $(ut)u=(y+qx)u=yu+qxu=v+qv=(1+q)v$；$u(tu)=u\cdot(y+qx)$……等等 $tu$ 由 $t$ 行 $u$ 列 $=(1+q)n$，$u(1+q)n=(1+q)un=(1+q)v$。一致。）
4. 正度数张成是幂零理想（5 次幂零，因为度最低 1、4 度以上乘积为零——实际 $(\rad C)^5=0$ 由分度：任意 5 个正度元素乘积总度 $\ge5>4$），商 $\cong k^2$，故为根。

**(c) 机械性理由**：
- 分度是**验证工具**不是结构：把 $10^3$ 个三元组乘法缩到 11 个非平凡情形。
- $(1+q)$、$q^2$ 这些系数全部来自乘法表，不是设计的自由度；真正的自由参数只有 $q$。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $1+q=0$（即 $q=1$），$utu=(1+q)v=0$、$u(tu)=0$ 仍一致，但更深处 $t$ 的左乘在 $s$-消解中给出 $1+q\ne0$ 的要求（Period.lean 里 `inducedAug_exact (hq1 : 1+q ≠ 0)`）——$q=1$ 时 $s$ 的消解退化，$\Ext$ 环不再是多项式环。所以参数独立性的第一个实际用途是排除 $q=1, q=0$ 及 $1+q^{n}=0$。
2. [推测] 乘法表若在 $(u,t)$ 位置写成 $y$ 而非 $y+qx$，则 $\ell_i=x+q^iy$ 的右乘链 $\rho_{\ell_i}$ 的核序列 $\langle\ell_{i+1},z,j\rangle$ 不再嵌套（$\rho_{\ell_i}$ 的像会多出 $v$-方向），消解 (a:simple-resolution) 不正合。
3. [推测] 交换 $x,y$ 的乘法不对称性（$xy=qz$, $yx=z$）是量子外代数的交换关系 $yx=q^{-1}xy$ 的实现：$q\cdot(yx)=qz=q\cdot z$……验证：$xy=qz$、$yx=z$，故 $xy=q\,(yx)$，即 $xy=q\,yx$，与 $k\langle x,y\rangle/(x^2,y^2,yx-q^{-1}xy)$ 中 $xy=q\,yx$（两边乘 $q$）一致。若弄反，$eCe$ 的 Ext 环变成非交换的 Hecke 型，$\tau$ 的度数会变。

### 2.3.2 对偶正则模的投射维数（Proposition a:dual-dimensions）

**(a) 陈述（原文，结构）**：
```latex
\begin{proposition}\label{a:dual-dimensions}
The dual regular module $DC$ has projective dimension at most two
on both sides.  More precisely,
\[
 D(eC)\cong Ce,\qquad D(Ce)\cong eC,
\]
and there are exact sequences
\begin{align}
0\longrightarrow Cf\xrightarrow{\rho_t}Ce
 \xrightarrow{\rho_{\ell_{-2}}}Ce
 \xrightarrow{e\mapsto j^*}D(fC)\longrightarrow0,
\label{a:left-dual-resolution}\\
0\longrightarrow fC\xrightarrow{\lambda_u}eC
 \xrightarrow{\lambda_{\ell_0}}eC
 \xrightarrow{e\mapsto v^*}D(Cf)\longrightarrow0.
\label{a:right-dual-resolution}
\end{align}
Consequently
\begin{equation}
\pd_B({}_B E)\le4,\qquad
\pd_{B^{\mathrm{op}}}(E_B)\le4,\qquad
\idim_B({}_B B)\le4.
\label{a:dimension-bounds}
\end{equation}
\end{proposition}
```
（$\rho_a$=右乘 $a$，$\lambda_a$=左乘 $a$，$\ell_i=x+q^iy$。）

**(b) 证明机制**：
1. **$D(eC)\cong Ce$**：配对 $eC\times Ce\to k$ 取乘积中 $z$ 的系数。在有序基 $\mathcal B_{eC}=(e,x,y,z,u,v)$、$\mathcal B_{Ce}=(e,x,y,z,t,j)$ 下非零项只有 $ez,xy,yx,ze,uj,vt$，系数 $1,q,1,1,1,q$——行列式 $q^2\ne0$ 非退化。"$e\mapsto z^*$" 给同构。
2. **$D(fC)$ 的表示**：满射 $Ce\to D(fC)$ 在两组基下的像
   $(e,x,y,z,t,j)\mapsto(j^*,t^*,q^2t^*,0,qn^*,f^*)$，秩 4，核 $\langle\ell_{-2},z\rangle_k$。
   **注意例外指标 $-2$**：左序列的中项是 $\rho_{\ell_{-2}}$ 而右序列是 $\lambda_{\ell_0}$——两侧的参数平移起点差 2。
3. **中间映射的像/核表**：
```
map                | image              | kernel
rho_{ell_{-2}}     | <ell_{-2}, z>      | <y+qx, z, t, j>
lambda_{ell_0}     | <ell_0, z>         | <y+qx, z, u, v>
```
初始注入：$\rho_t:(f,u,v,n)\mapsto(t,y+qx,qz,qj)$（像 = $\langle y+qx,z,t,j\rangle$ 的四个独立向量……确切说 $\rho_t$ 的像是 $\langle t, y+qx, qz, qj\rangle=\langle y+qx,z,t,j\rangle$，与中间核一致）；$\lambda_u:(f,t,j,n)\mapsto(u,y+qx,z,v)$（像 = $\langle u,y+qx,z,v\rangle$ = $\lambda_{\ell_0}$ 的核）。拼接出两条 4 项正合列。
4. **维度界的拼装**：$T=C\oplus DC$，$DC$ 每侧 $\pd\le2$ ⇒ $T$ 每侧有长度 $\le2$ 的投射消解。张量两条消解（在域上张量）+ totalization ⇒ $E$ 作为 $B$-模（左、右）有 $\pd\le4$。同理 $DB\cong DC\otimes DC$ 右 $B$-投射维数 $\le4$，对偶化给 ${}_BB$ 的内射上同调长度 $\le4$。

**(c) 机械性理由**：
- $\pd_B({}_BE)\le4$ 与 $\idim_B({}_BB)\le4$ 是 bar 复形 $K$（2.5.1）"同调只到 4 度"的代数来源——论文明确说 "The finite representative needed here will follow from the separate projective-dimension bounds on the two sides."
- 例外指标 $-2$（左）vs $0$（右）：源于 $t$ 与 $u$ 在 $s$-消解 (a:simple-resolution) 中的角色不对称（$d_1=\rho_u$，$d_{i+2}=\rho_{\ell_i}$ 从 $\ell_0$ 开始）。这个不对称将在稳定环 $\Ext_T^*(s,s)=k[\tau]$、$|\tau|=3$ 的度数里再浮现。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $q=0$，行列式 $q^2=0$，$D(eC)\cong Ce$ 失效（配对退化），$DC$ 的投射维数可能跳到 3 以上，bar 复形同调延长到 5 度以上，$c_5K$ 的 side-projectivity 证明瓦解。Lean 中 `parameter_ne_zero 0` 即 $q\ne0$ 是处处携带的前提。
2. [推测] 若左侧也用 $\lambda_{\ell_0}$ 型指标（对称化两序列），核 $\langle y+qx,z,t,j\rangle$ 与像对不上：$\rho_{\ell_0}$ 的像 $\langle\ell_0,z,j\rangle$（见 2.3.3 的表）不是 $\langle\ell_{-2},z\rangle$。两侧指标错位是代数结构的本性，不是笔误空间。
3. [推测] $B=C\otimes C$ 的张量维数界 $\le2+\le2=\le4$ 用了"域上张量保消解"（$k$ 域 ⇒ 所有模平坦）；若 $B$ 改成 $C\otimes_C C$ 类相对张量，需要 Tor 消失条件，整个 bar 层论证变复杂。

### 2.3.3 简单模 $s$ 的消解（Proposition a:resolution）

**(a) 陈述（原文）**：
```latex
\begin{proposition}\label{a:resolution}
The augmentation $Cf\to s$ extends to a projective resolution
$R\to s$ with
\begin{equation}
R_0=Cf,\qquad R_i=Ce\ (i\ge1),\qquad
d_1=\rho_u,\qquad d_{i+2}=\rho_{\ell_i}\ (i\ge0).
\label{a:simple-resolution}
\end{equation}
It satisfies
\begin{equation}
H^a\Hom_C(R,s)=
\begin{cases}k&a=0,\\0&a\ne0,\end{cases}
\qquad
H^a\Hom_C(R,C)=
\begin{cases}Ds&a=2,\\0&a\ne2,\end{cases}
\label{a:dual-cohomology}
\end{equation}
where the second identification is an isomorphism of right
$C$-modules.
\end{proposition}
```

**(b) 证明机制**：
1. **右乘的显式值**（在基 $(e,x,y,z,t,j)$ 上）：
```
rho_u(e,x,y,z,t,j)       = (u, v, v, 0, (1+q)n, 0)
rho_{ell_i}(e,x,y,z,t,j) = (ell_i, q^{i+1}z, z, 0, (1+q^{i+2})j, 0)
```
特征 2 无符号；对 $i\ge0$ 系数 $1+q^{i+2}\ne0$（**这是 $q$ 的幂次条件第一次实质登场**：$q$ 的任何正幂次的"1+"不为零，由 $q$ 超越性保证）。
2. **像/核嵌套**：
```
map      | image             | kernel
rho_u    | <u, v, n>         | <ell_0, z, j>
rho_ell_i| <ell_i, z, j>     | <ell_{i+1}, z, j>
```
第一个像是 $\rad(Cf)=\langle u,v,n\rangle$；每个像=前一个核 ⇒ 逐度正合。
3. **$\Hom_C(R,s)$**：$\Hom_C(Ce,s)=es=0$（$e$-角上 $f$-特征为零），$\Hom_C(Cf,s)=fs=k$ ⇒ 消解只从第 0 项"看得见" $s$，正度数全零。
4. **对偶复形**：$\Hom_C(Cf,C)=fC$、$\Hom_C(Ce,C)=eC$，对偶上链复形
```latex
fC\xrightarrow{\lambda_u}eC
 \xrightarrow{\lambda_{\ell_0}}eC
 \xrightarrow{\lambda_{\ell_1}}eC
 \xrightarrow{\lambda_{\ell_2}}\cdots
```
$\lambda_u$ 单，像 $\langle u,y+qx,z,v\rangle$。左乘表：
```
lambda_{ell_i}(e,x,y,z,u,v) = (ell_i, q^i z, qz, 0, (1+q^i)v, 0)
```
```
       | image          | kernel
i=0    | <ell_0, z>     | <ell_{-1}, z, u, v>
i>=1   | <ell_i, z, v>  | <ell_{i-1}, z, v>
```
$q\ell_{-1}=qx+y$（即 $\ell_{-1}=q^{-1}x+y$，乘 $q$ 后 $=x+qy$？核对：$q\ell_{-1}=q(x+q^{-1}y)=qx+y$ ✓），所以 $i=0$ 的核 = $\lambda_u$ 的像（$\langle ell_{-1},z\rangle\cup\{u,v\}$：$\ell_{-1}$ 方向由 $y+qx$ 张成……$y+qx=q\ell_{-1}$ ✓）。唯一剩余上同调在度 2：
$$\langle\ell_0,z,v\rangle/\langle\ell_0,z\rangle=k\overline v.$$
5. **右模结构 $Ds$**：$vf=v$、$ve=0$，$v$ 与根基向量的非零乘积只有 $vt=qz$（是边缘）。故根作用平凡于 $k\overline v$，右模结构是 $Ds$。

**(c) 机械性理由**：
- $R_1=Ce$（不是别的）：$\rho_u:Cf\to Ce$ 的像恰是 $\rad(Cf)$，是 $Cf\to s$ 的核。
- $d_{i+2}=\rho_{\ell_i}$ 的**参数平移**：核 $\langle\ell_{i+1},z,j\rangle$ 恰是下一个 $\ell$ 的像——Schulz 式平移合冲。$1+q^{i+2}\ne0$ 保证 $(1+q^{i+2})j$ 项不消失，$\ell_i$ 的像维数稳定为 3。
- $H^2\Hom_C(R,C)\cong Ds$ 是**度 3 扩张类 $\tau$ 的代数源头**：$T=C\ltimes DC$ 上 $s$ 的 $\Ext$ 平面里，$DC\otimes_C R$ 的同调（由对偶复形给出）集中在度 2，三角形 $s[2]\to\mathcal J\to s\xrightarrow\tau s[3]$ 把它变成度 3 的 $\tau$。

**(d) [推测] 候选失败路线**：
1. [推测] 若存在 $n\ge1$ 使 $1+q^n=0$（$q$ 是单位根），$\rho_{\ell_{n-2}}$ 的像丢掉 $j$-方向，消解在该处不正合（像 $\subsetneq$ 前核）。Lean 的 `one_add_q_pow_ne_zero` 逐条堵死。
2. [推测] 若把 $d_1$ 换成 $\rho_v$ 或其他，像 $\langle u,v,n\rangle$ 分解为不可比链，稳定环的"单项生成"失败——$\Ext$ 环可能出现两个生成元，张量后 4 个变量，Koszul 核计算复杂化且 $W$ 廓形不再是 $\{-3,0\}$ 两点。
3. [推测] 对偶复形度 2 上同调的"唯一性"依赖 $i\ge1$ 的核-像精确嵌套 $\langle\ell_{i-1},z,v\rangle$；若 $q=1$，$\ell_i$ 全部相同，嵌套坍缩，$\Ext_C^*(s,C)$ 的支撑变化，$\tau$ 的度数偏移。

## 2.4 多项式稳定自同态与扭转（论文 §5）

记号：$\mathcal J=T\otimes_CR$（$R$ 为 (a:simple-resolution) 的消解复形，不要与代数混淆）；$\cH^a=\sHom_E(X,X[a])$；$\tau_1=\tau\otimes1$，$\tau_2=1\otimes\tau$；$\mathcal P_m=k[\tau_1,\tau_2]_m$（总指数 $m$，上同调度 $3m$），$m<0$ 时 $\mathcal P_m=0$。

### 2.4.1 单变元多项式稳定环（Proposition e:polynomial）

**(a) 陈述（原文）**：
```latex
\begin{proposition}\label{e:polynomial}
Put $\mathcal J=T\otimes_C R$, where $R$ is the resolution in
\eqref{a:simple-resolution}.  There is a triangle in the derived
category of $T$-modules
\begin{equation}
s[2]\longrightarrow\mathcal J\longrightarrow s
 \xrightarrow{\tau}s[3],
\label{e:triangle}
\end{equation}
and the connecting class generates the Yoneda algebra:
\begin{equation}
\Ext_T^*(s,s)=k[\tau],\qquad |\tau|=3.
\label{e:one-polynomial}
\end{equation}
The complex $\mathcal J$ is bounded below, has finite projective
$T$-terms, and has bounded homology.
\end{proposition}
```

**(b) 证明机制**：
1. **系数序列**：张量 $(T,C)$-双模序列 $0\to DC\to T\to C\to0$ 与 $R$；$R$ 各项 $C$-投射 ⇒ 短正合列（左 $T$-模复形）
```latex
\begin{equation}
0\longrightarrow DC\otimes_C R
 \longrightarrow\mathcal J\longrightarrow R\longrightarrow0.
\label{e:coefficient-sequence}
\end{equation}
```
两侧复形的作用从 $C$ 膨胀（inflate）。
2. **左项的同调**：对有限投射左 $C$-模 $V$，求值映射 $DC\otimes_CV\to D\Hom_C(V,C)$，$\phi\otimes v\mapsto(f\mapsto\phi(f(v)))$ 是同构（先自由后直加项）。逐项作用把左项等同于 $D\Hom_C(R,C)$。由 (a:dual-cohomology) 第二式：唯一同调是度 2 的 $s$（右 $C$-模结构），膨胀到 $T$。好截断在导出范畴中把它等同于 $s[2]$。右项消解 $s$。⇒ 三角形 (e:triangle)。中间复形项是 $T$-投射（$\mathcal J$ 的定义：$T\otimes_CR$，$R_i$ 是 $C$-投射 ⇒ $T\otimes_CR_i$ 是 $T$-投射……准确说：$T\otimes_C Ce=T\otimes_C C\cdot e\cong T\cdot e\otimes$? 论文只说 "Its middle complex has projective $T$-terms"，机制是 $T\otimes_C-$ 把 $C$-投射送到 $T$-投射，伴随 诱导-限制）。同调有界由三角形的两端（$s$ 两次）。
3. **$\Ext$ 环的计算**：$\mathcal J$ 有界下+投射，普通诱导-限制伴随给
$$Q_i:=\Hom_{\mathrm D^b(T)}(\mathcal J,s[i])=H^i\Hom_T(\mathcal J,s)=H^i\Hom_C(R,s)=\begin{cases}k&i=0\\0&i\ne0.\end{cases}$$
（关键：$\Hom_T(\mathcal J,s)=\Hom_C(R,s)$——限制后 $\mathcal J$ 的 $T$-结构拆掉，$T\otimes_C-\dashv \Res$。）
4. 对 (e:triangle) 作用 $\Hom(-,s[i])$，得长正合列片段
```latex
\begin{equation}
Q_{i-1}\longrightarrow\Ext_T^{i-3}(s,s)
 \xrightarrow{\alpha\mapsto\alpha[3]\tau}
 \Ext_T^i(s,s)\longrightarrow Q_i.
\label{e:polynomial-sequence}
\end{equation}
```
$i=1$：$k\to0\to\Ext^1\to0$ ⇒ $\Ext^1=0$。$i\ge2$：$Q_{i-1}=Q_i=0$ ⇒ 中间映射是同构。于是 $\Ext^2=0$；$i=3$ 时同构把 $\id_s\in\Ext^0$ 送到 $\tau\ne0$。归纳：$\tau^m$ 是 $\Ext^{3m}$ 的基，其余正度数为零；由于这些同构就是 Yoneda 复合，得代数结构 $k[\tau]$。

**(c) 机械性理由**：
- "$|\tau|=3$"：$DC\otimes_CR$ 的同调在**同调度 2**（$C$ 层面），放进短正合列后成为连接映射的**上同调度 3**（三角形 $\partial: s\to s[3]$）。度 3 意味着后面所有扭转权重的分母 3。
- $\mathcal J$ "有界下+有界同调+有限投射项"是 2.1.3 二胞腔模型的准入条件，也是后面 $K\otimes_EX\simeq\mathcal J\otimes\mathcal J$ 求值等价的基础。
- $\Ext^1=\Ext^2=0$：由序列的 $Q$-端消失强制；这个"前两度消失"正是自正交模的雏形（$s$ 在 $T$ 上已是自正交！只差 $\Ext^{>0}$ 全零——其实 $k[\tau]$ 说明 $\Ext^{3m}\ne0$，所以 $s$ 在 $T$ 上**不是**自正交，$\tau$ 的存在是故意的）。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $\Ext^1(s,s)\ne0$（$d_1$ 选错），长正合列在 $i=1$ 处断不开，$\Ext$ 环带额外生成元，二变元张量后 $\cH$ 廓形不再对偶于多项式环，$W^a$ 廓形变形。
2. [推测] 若 $H^a\Hom_C(R,C)$ 还有其他度数的同调（比如 $a=0$ 有 $\Ext_C^0(s,C)=fs$ 的对偶……实际 $\Hom_C(R,C)$ 度 0 项 $\Hom_C(Cf,C)=fC$，核为 0，度 0 上同调为 0 ✓），三角形端点不是单一 $s[2]$，$\tau$ 混入低度项。
3. [推测] 把 $T$ 换成 $C$ 直接做：$\Ext_C^*(s,s)\cong k[\tau_C]$，$|\tau_C|=2$（对偶复形的同调度 2 直接成为 $\Ext_C$ 的度 2 类）。度 2 的 $\tau_C$ 张量后度 4 的 $\tau_1,\tau_2$……论文选 $T$ 而非 $C$ 作为 $E$ 的因子，把度数从 2 推到 3；[推测] 度 3 的作用是让负度数端点 $-1$（$\cH^{-1}=D\mathcal P_0$）与 $\tau$-作用 $\cH^{-1}\to\cH^2$ 的"跨零映射"为零（若度是 2，$\cH^{-1}\to\cH^1$ 也为零，但 Koszul 列的接缝位置 $l=1,3$ 全部平移，最终 $W$ 廓形点 $\{-3,0\}$ 变成别的点对），具体哪对点更优没有在论文中论证——属于构造自由度的 [推测] 区域。

### 2.4.2 全度数廓形（Proposition e:all-degrees）

**(a) 陈述（原文）**：
```latex
\begin{proposition}\label{e:all-degrees}
The module $X$ is nonprojective and
\begin{equation}
\cH^{\ge0}=k[\tau_1,\tau_2],\qquad |\tau_1|=|\tau_2|=3.
\label{e:two-polynomial}
\end{equation}
In every integer degree, the only nonzero groups are
\begin{equation}
\cH^{3m}=\mathcal P_m,\qquad
\cH^{-3m-1}=D\mathcal P_m\qquad(m\ge0).
\label{e:profile}
\end{equation}
Under these identifications, postcomposition by a shifted
$\tau_i$ between negative groups is the transpose of multiplication
by $\tau_i$ on the polynomial spaces.  The maps
$\cH^{-1}\to\cH^2$ given by either class are zero.
\end{proposition}
```

**(b) 证明机制**：
1. **正度数**：取 $s$ 的投射 $T$-消解 $Q\to s$；全复形 $Q\otimes Q$ 是 $X=s\otimes s$ 的投射 $E$-消解。逐度只有有限多个直和项，项级有限投射性给**复形同构**
$$\Hom_E(Q\otimes Q, s\otimes s)\cong\Hom_T(Q,s)\otimes\Hom_T(Q,s).$$
（域上张量：每个复形分裂为同调+收缩直和项，张量保上同调 = 上同调的张量。）消解比较映射的张量计算外积 Yoneda 乘积；特征 2 中交换因子无需符号 ⇒ 两个变元的类交换。⇒ $\Ext_E^*(X,X)=k[\tau_1,\tau_2]$（代数同构）。
2. **非投射性**：度 3 部分非零 ⇒ $X$ 非投射（投射模的 $\Ext^{>0}$ 全零）。$\End_E(X)=k$（$X$ 一维），恒等不过投射（否则 $X$ 是投射直加项）⇒ $\sEnd_E(X)=k$。正 Ext = 正稳定 Hom（$E$ 对称，(h:stable-ext)）。⇒ (e:two-polynomial)。
3. **负度数**：Lemma h:duality 给 $\cH^{-a-1}\cong D\cH^a$（$a\ge0$）⇒ 支撑与维数：$\cH^{-3m-1}=D\mathcal P_m$，其余负度数为零。
4. **保留乘法映射**：选非零泛函 $\lambda:\cH^{-1}\to k$，用组合配对
```latex
\begin{equation}
(\beta,p)_m
 =\lambda\bigl(p[-3m-1]\beta\bigr),
\qquad
\beta\in\cH^{-3m-1},\quad p\in\mathcal P_m.
\label{e:pairing}
\end{equation}
```
对每个 $m$ 完美（由 h:duality 的 (h:shifted-pairing)，$M=N=X$）。$m\ge1$ 时结合律给（$p\in\mathcal P_{m-1}$）
```latex
\begin{equation}
\bigl(\tau_i[-3m-1]\beta,p\bigr)_{m-1}
 =(\beta,p[3]\tau_i)_m.
\label{e:transpose}
\end{equation}
```
右边是配对上"乘 $\tau_i$"，左边是"先乘 $\tau_i$ 再配对"——即负群上 $\tau_i$ 的作用是多项式乘法的转置。$m=0$ 时靶是 $\cH^2=0$ ⇒ 边界断言 $\cH^{-1}\to\cH^2=0$。
5. **显式负作用**（正文）：$\eta_{a,b}\in\cH^{-3(a+b)-1}$ 为 $\tau_1^a\tau_2^b$ 的对偶，则
```latex
\begin{equation}
\tau_1\eta_{a,b}=
 \begin{cases}\eta_{a-1,b}&a>0,\\0&a=0,\end{cases}
\qquad
\tau_2\eta_{a,b}=
 \begin{cases}\eta_{a,b-1}&b>0,\\0&b=0.\end{cases}
\label{e:negative-action}
\end{equation}
```
两个负度数类的乘积为零（支撑不重叠：$-3(a+b)-1$ 与 $-3(a'+b')-1$ 相加后是负度数，而负×负的度 $-3(a+a'+b+b')-2$ 不在支撑 $\{-3m\}\cup\{-3m-1\}$ 中）。

**(c) 机械性理由**：
- 度 3 的 $\tau_i$ 使正度数只出现在 $3m$、负度数只出现在 $-3m-1$；$\cH^0=k$（常数多项式）与 $\cH^{-1}=k$（$\eta_{0,0}$）是两个"标量群"，后面 $W^0$ 与 $\cH^{-1}$ 的角色都由此而来。
- "postcomposition = 转置"是把负度数的扭转作用（2.4.4）归结为多项式层面标量的唯一通道——不必显式构造负度数映射。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $k$ 特征非 2，$\Hom_E(Q\otimes Q,\cdot)\cong\Hom_T(Q,\cdot)\otimes\Hom_T(Q,\cdot)$ 的同构带 Koszul 符号，$\tau_1\tau_2=\tau_2\tau_1$ 仍可能但外部积的比较映射带符号，配对 (e:pairing) 的对称性破坏，转置公式 (e:transpose) 出现符号因子，扭转权重的"整族标量"变成"带符号标量"，$\Delta^a$ 的可逆性论证要重做。
2. [推测] 若 $s$ 在 $T$ 上有非零 $\Ext^1$，正度数廓形不是 $3\mathbb N$ 格，负度数支撑随之变形，$W^a$ 的支撑点 $\{-3,0\}$ 移位，纤维序列 (t:fiber-hom) 的低度数读表全变。
3. [推测] $\lambda$ 的选择若不固定在 $\cH^{-1}$ 而是每层各选，(e:transpose) 的相容性不保证——$\tau_i\eta_{a,b}$ 的坐标会差出逐层标量，负作用公式 (e:negative-action) 失去"单纯移位"形式，2.4.4 的权重推导失败。

### 2.4.3 人字形的显式生成元（Lemma e:socle）

**(a) 陈述（原文）**：
```latex
\begin{lemma}\label{e:socle}
Put
\[
 p_f=f\otimes f,\qquad \zeta=f^*\otimes f^*\in E p_f.
\]
For every $a,b\in E$,
$a\zeta b=\chi(a)\chi(b)\zeta$.
The map $i_X:X\to Ep_f$, $i_X(1)=\zeta$, is an embedding with
image in $(\rad E)p_f=\Omega X$.  Regarded as a map
$X\to\Omega X$, it is nonzero stably and spans $\cH^{-1}$.
\end{lemma}
```

**(b) 证明机制**：
1. **特征性质**：$f^*\in DC$ 是 $C$ 上 $f$-简单模的特征；由平凡扩张的双模作用 (a:trivial-extension)，任一侧乘 $C$ 元素按该特征缩放 $f^*$，平方零理想 $DC$ 在两侧杀死它。张量 ⇒ $a\zeta b=\chi(a)\chi(b)\zeta$（$\chi=\chi_E=\chi_T\otimes\chi_T$）。
2. **嵌入 $\Omega X$**：投射覆盖 $Ep_f\to X$（$ap_f\mapsto\chi(a)$）的核是 $(\rad E)p_f$（由 (a:radicals)）。$\zeta\ne0$ 在核里 ⇒ $i_X$ 嵌入 $X\hookrightarrow(\rad E)p_f=\Omega X$。
3. **稳定非零 = 不过投射**：设 $b\in E$ 满足 $J_Eb=0$（$J_E=\rad E$）。对称性给 $t_E(abj)=t_E(jab)=0$（$a\in E,j\in J_E$，因 $ja\in J_E$ 而根上迹为零……准确机制：$t_E(abj)=t_E((aj)b)$? 论文写 $t_E(abj)=t_E(jab)=0$，用 $t_E$ 循环性与 $jab$ 中 $ja\in J_E$、$J_E\cdot E\subseteq J_E$、迹在根上为零？其实更直接：$b$ 被 $J_E$ 左零化 ⇒ 由非退化 $bJ_E=0$）。任何映射 $X\to E$ 的像满足此条件；任何左模映射 $E\to J_Ep_f$ 形如 $b\mapsto br$（$r\in J_Ep_f$），其与 $X\to E$ 的复合为零。有限直和与直加项同理 ⇒ 所有过有限投射的 $X\to\Omega X$ 映射为零。而 $i_X\ne0$。$\cH^{-1}=D\mathcal P_0$ 一维 ⇒ $i_X$ 张成 $\cH^{-1}$。

**(c) 机械性理由**：
- $\zeta$ 是"双侧特征向量"：它是 $E$ 的 socle 型元素，同时是 2.5.4 中 $b_0:S\to U$ 的像——同一个 $\zeta$ 在两处登场，是"负度数生成元"与"双模提升"的焊接点。
- $\Omega X=(\rad E)p_f$：投射覆盖的核=根乘顶角。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $X$ 的特征 $\chi$ 在 $\rad E$ 上非零，$\zeta$ 不再被根杀死，$i_X$ 的像跑出 $\Omega X$，度 $-1$ 类不存在。
2. [推测] "所有过投射的映射为零"依赖 $X\to E$ 像的 $J_E$-零化性质；若把 $\zeta$ 换成 $\zeta$ 的标量倍以外的元素（比如加一个 $u\otimes u$ 型项），性质破坏。

### 2.4.4 扭转的权重（Proposition e:twists）

**(a) 陈述（原文）**：
```latex
\begin{proposition}\label{e:twists}
For every $H\in k^\times$ and every $m\ge0$, the action of
$U_H(-)$ on the groups in \eqref{e:profile} is
\begin{equation}
\left.U_H\right|_{\cH^{3m}}=H^{-m}\,1_{\mathcal P_m},
\qquad
\left.U_H\right|_{\cH^{-3m-1}}=H^{m+2}\,1_{D\mathcal P_m}.
\label{e:twist-weights}
\end{equation}
In particular, the negative action is the stated scalar on the entire
$(m+1)$-dimensional space.
\end{proposition}
```
其中 $h_H:T\to T$，$(a,\phi)\mapsto(a,H\phi)$；$\sigma_H=h_H\otimes h_H$；$U_H=E_{\sigma_H}$（正则左模、右作用 $a\cdot b=a\sigma_H(b)$）；$\chi\sigma_H=\chi$ 给定 identification $U_HX=X$；$U_H(-)$ 是沿 $\sigma_H^{-1}$ 的限制（(e:inverse-restriction)：$U_H\otimes_EV\xrightarrow{\sim}\Res_{\sigma_H^{-1}}V$，$a\otimes v\mapsto\sigma_H^{-1}(a)v$）。

**(b) 证明机制**：
1. **正度数**：沿 $h_H^{-1}$ 限制系数序列 (e:coefficient-sequence)。$h_H$ 固定 $C$ ⇒ $h_H\otimes1$ 把中间复形等同于原复形；在商 $R$ 上是恒等，在 $DC\otimes_CR$ 上乘 $H$。记 $\tau_H$ 为 $\tau$ 的扭转，过固定导出等同的三角形交换图：
```
s[2] --→ Res_{h_H^{-1}} J --→ s --τ_H→ s[3]
  │ H           │ h_H⊗1          │ 1        │ H
  ▼             ▼                ▼          ▼
s[2] --→      J        --→     s -- τ →  s[3]
```
连接映射的自然性给 $H\tau_H=\tau$，即 $\tau_H=H^{-1}\tau$。外积类 $\tau_i\mapsto H^{-1}\tau_i$，乘积保持 ⇒ $\mathcal P_m$ 上权重 $H^{-m}$。
2. **$\cH^{-1}$ 上的作用**：扭投影表示
$$0\longrightarrow\Omega X\longrightarrow Ep_f\longrightarrow X\longrightarrow0.$$
在 (e:inverse-restriction) 下它与原表示的比较是 $\sigma_H:\Res_{\sigma_H^{-1}}(Ep_f)\to Ep_f$（$E$-线性，因 $\sigma_H(\sigma_H^{-1}(a)b)=a\sigma_H(b)$；在 $X$ 上诱导恒等）。**核上**：$\zeta\mapsto H^2\zeta$（$\sigma_H$ 在 $DC$ 部分乘 $H$，$DC\otimes DC$ 部分乘 $H^2$）。所以 $\cH^{-1}$ 上 $U_H$ 作用 $=H^2$。
3. **传播到所有负度数**：精确扭转函子保平移复合。对 (e:pairing) 的乘积作用，用 $\mathcal P_m$ 上权重 $H^{-m}$ 与 $\cH^{-1}$ 上 $H^2$：
$$(U_H(\beta),H^{-m}p)_m=H^2(\beta,p)_m$$
⇒ $(U_H(\beta),p)_m=H^{m+2}(\beta,p)_m$ 对一切 $p$。配对非退化 ⇒ $U_H(\beta)=H^{m+2}\beta$。
（指标解读：$\lambda$ 住在 $\cH^{-1}$，$U_H$ 作用后 $\lambda$ 的参变关系引入 $H^2$；多项式部分贡献 $H^{-m}$；合计 $H^2\cdot H^{m}$ 的逆/正……按论文公式即 $H^{m+2}$。）

**(c) 机械性理由**：
- 权重 $H^{-m}$ 与 $H^{m+2}$ **关于 $m$ 的斜率不同**（$-1$ vs $+1$，截距不同）：这保证两个不同扭转 $H_1,H_2$ 的比较映射 $\Delta^a$ 在每个非零度上都是"两个不同标量+1"的矩阵，行列式 $H_1^w+H_2^w$（特征 2 中"和"= 差）随 $w$ 变化恒非零——因为 $H_1^w\ne H_2^w$ 对所有需要的 $w$。**若两斜率相同**（比如都是 $H^{-m}$），某些度上 $(H_1H_2^{-1})^{-m}$ 可能同时为 1？不会——不等的幂仍不等。真正的原因是斜率之差给了 $H^2$ 截距，让 $a=-1$ 度（$\cH^{-1}$ 之间）的比较也可逆（Remark t:neighboring-degrees 用到 $(H_i^2,1)$ 行可逆）。
- $\sigma_H$ 固定 $B$：$h_H|_C=\id$ ⇒ $\sigma_H|_{B}=\id$，这是后面把 $E^e$ 层面的构造限制到 $B^e$ 时 $U_H$ 分解为 $B$-双模直和 $B\oplus(DC\otimes C)\oplus(C\otimes DC)\oplus DB$ 的原因。

**(d) [推测] 候选失败路线**：
1. [推测] 若用 $h_H'(a,\phi)=(Ha,H\phi)$（把左乘也扭），$h_H'$ 不固定 $C$（$e,f$ 被缩放），$\sigma_H'|_B\ne\id$，$B^e$-限制分解失效，迹障碍无法接入。
2. [推测] 若 $T$ 的平凡扩张换成一个 $\tau$ 度为 2 的代数，权重斜率变为 $(-1,-1)$ 型，负度数权重 $H^{m+\text{const}}$ 的常数变化，$a=-1$ 度的可逆性可能恰好需要 $H_1^2\ne H_2^2$ 之外的额外条件。
3. [推测] $\zeta\mapsto H^2\zeta$ 的指数 2 来自 $DC\otimes DC$ 双份缩放；若 $X=s\otimes s$ 换成 $s\otimes s\otimes s$（三份），指数变 3，但 $\cH^{-1}$ 的维数与 $\mathcal P_0$ 对偶结构变化，且 $\tau$ 度变 9，全部度数表重排——不可行性未在论文讨论 [推测]。

## 2.5 导出归纳与迹障碍（论文 §6）

本章目标（Proposition b:bimodule，原文）：
```latex
\begin{proposition}\label{b:bimodule}
There is a finite $E$-bimodule $Y$, projective separately as a left and
as a right $E$-module, such that
\begin{equation}\label{b:W}
 W^a:=\sHom_E(X,(YX)[a])
 \cong
 \begin{cases}
 k,&a=-3,0,\\
 0,&a\notin\{-3,0\}.
 \end{cases}
\end{equation}
For every $H\in k^\times$, there is an ordinary bimodule map
$g_H:U_H\to Y$ whose evaluation, under $U_HX=X$, represents a nonzero
element of $W^0$.  The same $Y$ works for all $H$, and all modules and
maps are defined over $k$.
\end{proposition}
```
两个断言来源不同：(b:W) 由导出归纳的过滤计算；(g_H 的存在) 由**迹障碍 + 稳定对偶**。$W^0=k$ 只保证有稳定模映射 $X\to YX$，不保证它是某个双模映射 $U_H\to Y$ 的取值——后者是整个构造最深的一步。

### 2.5.1 bar 模型与有限代表元（Lemma b:bar-model）

**(a) 陈述（原文，结构）**：
```latex
\begin{lemma}\label{b:bar-model}
The complex $K$ represents $E\otimes_B^{\mathbf L}E$, has finite
projective $E^e$-terms and has homology only in degrees $0,\ldots,4$.
The bimodule $c_5K$ is projective on both sides.  Consequently its
stable image
\[
 \cI=\langle K\rangle=(c_5K)[5]
\]
has finite side-projective representatives, as does $\cI[-1]$.
One such representative $Y$ of $\cI[-1]$ is obtained by taking four
successive finite bimodule cosyzygies of $c_5K$.
\end{lemma}
```
bar 复形 $K_i=E\otimes B^{\otimes i}\otimes E$（$i\ge0$），微分是三个"乘一个内因子"的和（特征 2 无符号，$d_{i-1}d_i=0$ 因每个双重乘法出现两次）；度 0 的乘法给链映射 $m:K\to E$。

**(b) 证明机制**：
1. **$K$ 表示 $E\otimes_B^{\mathbf L}E$**：$B$ 的标准 bar 消解 $B\otimes B^{\otimes i}\otimes B$ 的增广复形作为向量空间复形可用"插入单位"收缩；在一端张量模后得另一侧的投射消解。外作用诱导出 $K$，每项是有限自由 $E^e$-模。
2. **同调 $\le4$**：左侧，$B\otimes B^{\otimes i}\otimes E$ 是 ${}_BE$ 的投射消解；由 (a:dimension-bounds) $\pd_B({}_BE)\le4$，消解比较给同伦等价到一个支撑在 $0..4$ 的复形；$E\otimes_B-$ 保同伦等价 ⇒ $K$ 作为左 $E$-复形同伦等价于该有界复形。右侧同理 ⇒ $H_i(K)=0\ (i>4)$。
3. **$c_5K$ side-projective**：任一侧取同伦（恒等到过 4 度截断的映射），5 度给 $1_{K_5}=d_6h_5+h_4d_5$；模 $\im d_6$ 得 $c_5K\xrightarrow{\overline d_5}K_4\xrightarrow{q_5h_4}c_5K$ 是恒等的分解 ⇒ $c_5K$ 是该侧投射的直加项。高序列 $0\to c_{n+1}K\to K_n\to c_nK\to0$（$n\ge5$）逐侧分裂 ⇒ 高余核全部 side-projective（2.1.6 的判据）。
4. **四次余合成元（cosyzygy）造 $Y$**：$N_0=c_5K$；$r=0,1,2,3$ 用
$$0\to N_r\to\Hom_k(E^e,N_r)\to N_{r+1}\to0,\qquad n\mapsto(a\mapsto an).$$
中间项有限内射（coinduction），因 $E^e$ 对称而投射；$N_r$ 逐侧投射=内射 ⇒ 序列两侧分裂 ⇒ $N_{r+1}$ side-projective。取 $Y=N_4$，稳定类 $(c_5K)[4]=\cI[-1]$。稳定像与求值相容由 Lemma h:stable-image、h:evaluation 给出。$m$ 诱导的稳定映射记 $\overline m:\cI\to E$。

**(c) 机械性理由**：
- 度数 5 与 4 次 cosyzygy：$\cI[-1]$ 的"负 1 平移"需要一次合成元方向移动；从 $(c_5K)[5]$ 到 $(c_5K)[4]=\cI[-1]$ 正是一次。为什么选 $c_5$ 而非 $c_4$：同调到 4 度 ⇒ $c_5K$ 已 side-projective，且 (h:stable-image) 的 $n$ 无关性在 $n\ge5$ 处稳定。
- $\Hom_k(E^e,N)$ 有限性：$N_r$ 有限维 ⇒ 中间项有限维 ⇒ $Y$ 有限。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $\pd_B({}_BE)$ 实际是 5（维数界算错），$H_5(K)\ne0$，$c_5K$ 非 side-projective，要退到 $c_6K$，$Y$ 重造，(b:W) 的支撑点平移（$-3,0$ 变 $-4,0$?），最终 (t:fiber-hom) 的读表与 $\Delta$ 的可逆度数范围全部重推。Lean 中此界对应 `bDualLeft_dimension`/`restrictedBimoduleResolution_above (hn : 8 < n)`（$B^e$ 层面 $4+4$）。
2. [推测] 若把 $Y$ 取成更少的 cosyzygy（如 $N_2$），稳定类是 $\cI[-3]$，$W$ 廓形点变 $\{-1,2\}$，与 $\cH$ 支撑的交集变化，$W^0$ 可能变成 $W^2$，纤维映射的评价落在错误度数。
3. [推测] $K$ 的项是**有限自由 $E^e$-模**这一点在 Lean 中对应 $K_i$ 的显式构造；若 $B$ 在 $E$ 中不是代数子结构（$B=C\otimes C$ 通过 $T\otimes T\supset C\otimes C$ 嵌入），乘法 $b_ic$ 的良定性需要 $B\subset E$ 是子代数——成立，因为 $C\subset T$ 是子代数（平方零理想上的分次结构）且张量保嵌入。

### 2.5.2 全度数 W-廓形（Lemma b:profile）

**(a) 陈述**：$Y$ 满足 (b:W)：$W^a\cong k$（$a=-3,0$），其余为零。

**(b) 证明机制（全文最长的计算，逐步）**：

1. **求值等价**：$K\otimes_EX=E\otimes B^{\otimes\bullet}\otimes X$。在诱导到 $E$ 之前，它的 bar 模型与 $R\otimes R$（$X$ 的两个 $B$-投射消解）同伦等价；诱导保等价 ⇒
```latex
\begin{equation}\label{b:evaluated-model}
 K\otimes_E X\simeq
 (T\otimes_C R)\otimes(T\otimes_C R)
 =\mathcal J\otimes\mathcal J .
\end{equation}
```
由 Lemma h:evaluation，稳定像 $\langle K\otimes_EX\rangle=\cI X$。
2. **保留 attaching maps**：取 $s[2],s$ 的有界下投射模型 $A_\bullet,Q_\bullet$，链映射 $t:Q_\bullet\to A_\bullet[1]$ 代表 $\tau$。$\Cone(t[-1])$ 有底层 $A_\bullet\oplus Q_\bullet$、微分 $\begin{pmatrix}d_A&t\\0&d_Q\end{pmatrix}$，代表 $\mathcal J$（2.1.3）。
3. **四级过滤**：张量两份模型，平移 $[-4]$。先 $A\otimes A$，再加 $Q\otimes A$、$A\otimes Q$，最后 $Q\otimes Q$。各含入逐度分裂，逐商消解
```latex
\begin{equation}\label{b:three-levels}
 X,\qquad X[-2]\oplus X[-2],\qquad X[-4].
\end{equation}
```
全复形稳定像 $\mathcal L=(\cI X)[-4]$。相邻连接映射（中间层按显示顺序）是平移过的行与列
$$\ (\tau_1,\tau_2),\qquad\binom{\tau_2}{\tau_1}\ $$——即 cross differential $t$ 在相应因子 + 另一因子恒等；Lemma h:stable-image 把它们等同于稳定像后的连接映射。
4. **Koszul 核-余核**：相邻映射按度 $l$ 记为
```latex
 d_l:(\cH^{l-2})^2\longrightarrow\cH^{l+1},& d_l(u,v)=\tau_1u+\tau_2v,
 d'_l:\cH^{l-4}\longrightarrow(\cH^{l-1})^2,& d'_l(w)=(\tau_2w,\tau_1w).
```
断言：
```latex
\begin{align}
 \ker d_l&=\im d'_{l-1},\label{b:koszul-middle}\\
 \coker d_{l-1}&=
 \begin{cases}k,&l=0,\\0,&l\ne0,\end{cases}
 \qquad
 \ker d'_l=
 \begin{cases}k,&l=3,\\0,&l\ne3.\end{cases}
 \label{b:koszul-ends}
\end{align}
```
多项式部分：二变元 Koszul 正合列
```latex
\begin{equation}\label{b:polynomial-koszul}
 0\longrightarrow\mathcal P_{m-1}
 \xrightarrow{\,(\tau_2,\tau_1)^{\mathsf t}\,}
 \mathcal P_m^2
 \xrightarrow{\,(\tau_1,\tau_2)\,}
 \mathcal P_{m+1}\longrightarrow0 .
\end{equation}
```
行满（正次单项式被某变量整除）；$\tau_1u+\tau_2v=0$ 与互素 ⇒ $u=\tau_2w,v=\tau_1w$ 唯一（特征 2 中符号一致）。负群部分：用 (b:polynomial-koszul) 的对偶（交换两个中间槽）：
$$D\mathcal P_{m+1}\to(D\mathcal P_m)^2\to D\mathcal P_{m-1}.$$
接缝 $l=1$：$m=0$ 时最后项是真实的 $\cH^2=0$，且 $D\mathcal P_1\to(D\mathcal P_0)^2$ 是同构。中间群无支撑时核与像都零。⇒ (b:koszul-middle) 对每个 $l$。
行余核：目标 $\cH^l=\mathcal P_m$ 时 $\mathcal P_{m-1}^2\to\mathcal P_m$ 满（$m\ge1$）、余核 $k$（$m=0$）；目标 $D\mathcal P_m$ 时是单列 $\mathcal P_m\to\mathcal P_{m+1}^2$ 的对偶，满（$m\ge0$）。列核：源 $\mathcal P_m$ 单入 $\mathcal P_{m+1}^2$；源 $D\mathcal P_m$（$m\ge1$）是满行 $\mathcal P_{m-1}^2\to\mathcal P_m$ 的对偶，仍单；剩下的源是 $\cH^{-1}=D\mathcal P_0=k$（$l=3$），靶 $(\cH^2)^2=0$。⇒ (b:koszul-ends)。包括唯一的"跨零乘法" $\cH^{-1}\to\cH^2=0$。
5. **从相邻映射到全 attaching**：$\mathcal L_1$ = 下两层的稳定像，$N^l=\sHom_E(X,\mathcal L_1[l])$。前两层给
```latex
\begin{equation}\label{b:first-two-levels}
 0\longrightarrow\coker d_{l-1}\longrightarrow N^l
 \xrightarrow{q_l}\ker d_l\longrightarrow0.
\end{equation}
```
顶层附着的**实际**连接映射 $r_l:\cH^{l-4}\to N^{l+1}$；到中间层的商的自然性给 $q_{l+1}r_l=d'_l$ ⇒ $\ker r_l\subseteq\ker d'_l$（除 $l=3$ 外为零）。$l=3$ 时 $N^4=0$（(b:first-two-levels) 左项 $\coker d_3=0$、右项是 $(\cH^2)^2=0$ 中的核）⇒ $\ker r_3=\cH^{-1}=k$。
又 $q_l(\im r_{l-1})=\im d'_{l-1}=\ker d_l$；$l\ne0$ 时 $q_l$ 同构 ⇒ $r_{l-1}$ 满。$l=0$ 时 $\cH^{-2}=0$ 给 $N^0=k$，而 $r_{-1}$ 的整个源是 $\cH^{-5}=0$。⇒ $\coker r_{l-1}$ 在 $l=0$ 是 $k$、其余零。
末层长正合列：
$$0\to\coker r_{l-1}\to\sHom_E(X,\mathcal L[l])\to\ker r_l\to0.$$
两个标量群恰在 $l=0,3$ 存活。**这个论证允许顶层向底层有额外 attaching 分量**：$N^4=0$ 与 $\cH^{-5}=0$ 已经强制了全 $r_l$ 的核与余核。最后 $YX=(\cI X)[-1]=\mathcal L[3]$，故 $l=a+3$，给出 (b:W)（$l=0\Rightarrow a=-3$，$l=3\Rightarrow a=0$）。

**(c) 机械性理由**：
- $[-4]$ 平移与 4 级过滤：$\mathcal J\otimes\mathcal J$ 的三个同调层 $X, X[-2]^{\oplus2}, X[-4]$（每份 $\mathcal J$ 同调层差 2）；稳定像平移后标量群位置 $l=0,3$ 决定 $W$ 支撑 $\{-3,0\}$。
- (b:koszul-ends) 的 $l=3$（$\ker d'_3=k$）与 $l=0$（$\coker d_{-1}=k$）**不是对称的**：一个来自列在 $\cH^{-1}$ 的消失靶，一个来自行在 $\cH^0$ 的常数余核。这种不对称对应 $W$ 点 $\{0,-3\}$ 关于 $\cH$ 支撑 $\{3m\}\cup\{-3m-1\}$ 的位置。
- "实际连接映射 $r_l$"：标准过滤长正合列只给相邻层的连接映射；顶层到底层的跨接分量被 $N^4=0,\ \cH^{-5}=0$ 吸收——这是计算完备性的保险栓。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $\tau$ 度不是 3，同调层 $X[-2]$ 的平移与 $\tau$ 的度数不再匹配，相邻映射 $\tau_1,\tau_2$ 的平移指数错位，Koszul 列的接缝（$l=1$）位置改变，$W$ 支撑点移动。
2. [推测] 若把过滤顺序换掉（先 $Q\otimes Q$ 再加混合层），连接映射的行/列变成 $(\tau_2,\tau_1)$ 等排列，标量群位置不变但 $\Delta^a$ 的分量顺序变——最终代数（$F$ 的纤维）里的 $(g_1,g_2)$ 槽序变化。
3. [推测] 若 $X$ 换成 $s\otimes s$ 以外的东西（如 $Ds\otimes s$），$\cH$ 廓形的对偶结构变化（$\Ext$ 环变成 $k[\tau_1]\otimes k[\tau_2]^{\mathrm{op}}$ 型），Koszul 对偶槽的交换不成立。

### 2.5.3 完美分解 ⇒ 普通分解（Lemma b:ordinary-factorization）与迹障碍（Lemma b:trace-obstruction）

**(a) 陈述（原文）**：
```latex
\begin{lemma}\label{b:ordinary-factorization}
If a bimodule map $v:B\to DB$ factors in the derived category
through a perfect $B^e$-complex, then it factors by ordinary
bimodule maps through an object of $\add(DB\otimes B)$, where the
tensor product has its outer bimodule actions.
\end{lemma}
```
```latex
\begin{lemma}\label{b:trace-obstruction}
The bimodule map
\begin{equation}\label{b:character-map}
 \eta:B\longrightarrow DB,\qquad
 \eta(a)=\chi_B(a)\chi_B,
\end{equation}
does not factor in the derived category through a perfect
$B^e$-complex.
\end{lemma}
```
（$\chi_B=\chi|_B$；$DB$ 的 $B$-双模结构 $(a\lambda b)(c)=\lambda(bca)$。）

**(b) b:ordinary-factorization 的证明机制**：
1. **替换中间对象**：对有限双模 $L$ 定义左上同调函子
$$J_B(L)=\Hom_k(B,L),\quad(a\phi b)(c)=\phi(ca)b,\quad j_L(z)(c)=cz;$$
$j_L:L\to J_B(L)$ 是自然双模单射。令 $C^0(L)=L$，$C^{r+1}(L)=\coker j_{C^r(L)}$。固定 $d=4$ 有函子正合列
```latex
\begin{equation}\label{b:coresolution}
 0\longrightarrow L\longrightarrow J_B(C^0(L))
 \longrightarrow\cdots\longrightarrow J_B(C^{d-1}(L))
 \longrightarrow C^d(L)\longrightarrow0.
\end{equation}
```
2. **自由双模的情形**：$L=B\otimes B$ 时，(b:coresolution) 是 "$B$ 的左模上同调消解 ⊗ 右正则模 $B$"（$\Hom_k(B,B\otimes B)\cong\Hom_k(B,B)\otimes B$ + 向量空间张量正合）。每个上同调左模项是有限内射 ∈ add(DB)；最后的左模余核也内射：由 $\idim({}_BB)\le4$ 与维数移位 $\Ext_B^1(V,C^d(B))\cong\Ext_B^{d+1}(V,B)=0$。⇒ 所有右侧项 ∈ $\add(DB\otimes B)$。函子保有限和与分裂直加项 ⇒ 任何有限投射双模 $L$ 成立。
3. **逐项应用**：对 perfect 中间对象的每个项 $L$ 作用 (b:coresolution)，自然性给横向映射 ⇒ 有界双复形；totalization $P'$ 有界、项 ∈ add(DB⊗B)；增广 $P\to P'$ 是拟同构（锥按原度数过滤，关联复形是 (b:coresolution)）。于是导出分解可写成 $B\to P'\to DB$。
4. **正交性**：对 $V\in\add(DB\otimes B)$、$i>0$：
```latex
\begin{equation}\label{b:two-orthogonalities}
 \Ext_{B^e}^i(B,V)=0,\qquad
 \Ext_{B^e}^i(V,DB)=0.
\end{equation}
```
第一式：上同调伴随 $\Hom_{B^e}(Q,DB\otimes B)\cong\Hom_{B^{\mathrm{op}}}(\Res Q,B)$；$B$ 的投射双模消解限制为自由右模的右投射消解。第二式：$DB$ 的左投射消解 ⊗ 右正则 = $DB\otimes B$ 的投射双模消解，$\Hom_{B^e}(Q_\bullet\otimes B,DB)\cong\Hom_B(Q_\bullet,DB)$，正上同调因 ${}_BDB$ 内射而消失。
5. **链映射代表**：自然拟同构
```latex
\begin{equation}\label{b:Hom-comparisons}
 \Hom^\bullet_{B^e}(B,P')\to\Hom^\bullet_{B^e}(Q_B,P'),\qquad
 \Hom^\bullet_{B^e}(P',DB)\to\Hom^\bullet_{B^e}(P',I_{DB});
\end{equation}
```
按 $P'$ 的有限项过滤逐项验证（每项商是 (b:two-orthogonalities) + 度 0 相等 + 模间负 Ext 为零；平移只是平移比较）。度 0 上同调 ⇒ 两个导出箭头有实际链映射代表 $\alpha:B[0]\to P'$、$\beta:P'\to DB[0]$，复合 = 普通映射 $\beta_0\alpha_0$ 过 $P'_0\in\add(DB\otimes B)$，且等于 $v$（$\Hom_{\mathrm D(B^e)}(B,DB)=\Hom_{B^e}(B,DB)$）。

**(c) b:trace-obstruction 的证明机制**：
1. 特征恒等式使 $\eta$ 是双模映射（$\eta(abc)=\chi_B(a)\chi_B(b)\chi_B(c)$ 的双侧一致性）。
2. 由 b:ordinary-factorization，perfect 分解 ⇒ 普通分解过 add(DB⊗B)。只需证：每个复合 $B\to DB\otimes B\to DB$ 把 $1$ 送到在 $p_f=f\otimes f$ 上取值为零的泛函。
3. **求值 = 迹**：等同 $DB\otimes B\cong\Hom_k(B,B)$（$\lambda\otimes c\mapsto[x\mapsto\lambda(x)c]$）。$\alpha(1)$ 满足 $a\alpha(1)=\alpha(1)a$ ⇒ 对应线性映射 $f_0$ 右 $B$-线性 ⇒ $f_0(x)=d_0x$（$d_0=f_0(1)$）。对任意基 $(c_i)$（对偶 $(c_i^*)$）：
$$\alpha(1)=\sum_i c_i^*\otimes d_0c_i.$$
$\beta$ 右线性 ⇒ 等同于 $DB$ 的左模自同态 ⇒ 对偶下是右正则模的自同态 ⇒ 右乘某 $b'$：
$$\beta(\lambda\otimes c)=\lambda b'c,\qquad
 (\beta\alpha(1))(p_f)=\sum_i c_i^*(b'd_0c_ip_f)=\tr_k(L_{b'd_0}R_{p_f}).$$
4. **迹为零**：写 $b'd_0=r+\sum_va_vp_v$（$r\in\rad B$，$p_v$ 四个顶点幂等）。$(L_rR_{p_f})^n=L_{r^n}R_{p_f}=0$（$n$ 大）⇒ 根部分迹零。$L_{p_v}R_{p_f}$ 是到 $p_vBp_f$ 的投影，$\dim_k(p_vBp_f)=4$（角表 (a:corner-parity) 全部偶数）⇒ 特征 2 中每个投影迹为零。线性性 ⇒ $(\beta\alpha(1))(p_f)=0$。
5. add(DB⊗B) 中所有分解的有限和同样为零。但 $\eta(1)(p_f)=\chi_B(p_f)=1$。矛盾。

**(d) 机械性理由与[推测]失败路线**：
- 角表 (a:corner-parity) 的全偶性是迹障碍的**数值引擎**：
```latex
\bigl(\dim_k(pB p')\bigr)_{p,p'}=
\begin{pmatrix}
16&8&8&4\\
8&8&4&4\\
8&4&8&4\\
4&4&4&4
\end{pmatrix}
```
（= $C$ 的角维数 $4,2,2,2$ 的乘积。）特征 2 ⇒ 偶维数投射子迹零。Lean 中对应 `Corner.lean` 的 `trace_left_right_f`：$\tr_k(L_aR_{p_f})=2a_0+2a_1$，特征 2 下为零——Lean 用矩阵迹直接算出 $2a_0+2a_1$ 再用 $\mathrm{CharP}\ 2$ 清零，比"偶维投影"更硬核。
- [推测] 失败路线 1：若 $B$ 有奇维数角（比如 $C$ 的某个角维数是 1 或 3），投影迹可能非零，$\eta$ 可能真的 perfect 分解，$g_H$ 的提升失败，$F$ 纤维里没有非零 $v_0$，三角锥的 $\Delta^0$ 不可逆（(t:fiber-hom) 度 0 读表失效），最终 $\Ext_A^1(M,M)\ne0$。
- [推测] 失败路线 2：(b:coresolution) 的 $d=4$ 若不够（$\idim({}_BB)>4$），最后的余核不内射，(b:two-orthogonalities) 第二式失败，(b:Hom-comparisons) 的度 0 提升失败，perfect 分解不再产生**普通**分解，迹障碍无的放矢。
- [推测] 失败路线 3：特征 2 里 $\tr(L_aR_{p_f})=2a_0+2a_1=0$ 恒成立；但在特征 $p>2$ 或 0 中，需要角维数都是 $p$ 的倍数——十维代数的角维数 $4,2,2,2$ 只对 $p=2$ 全部整除。[推测] 这就是反例"锁死特征 2"的真正代数原因。

### 2.5.4 稳定伴随与被求值的提升（Lemma b:stable-adjunction、Lemma b:evaluated-lift）

**(a) 陈述（原文）**：
```latex
\begin{lemma}\label{b:stable-adjunction}
For every finite side-projective bimodule $L$, ordinary
tensor--Hom adjunction induces a natural isomorphism
\[
 \sHom_{E^e}(L,S)\ \cong\ \sHom_E(LX,X).
\]
This assertion does not require $S$ to be side-projective.
\end{lemma}
```
```latex
\begin{lemma}\label{b:evaluated-lift}
For every $H\in k^\times$, there is a stable bimodule map
$U_H[1]\to\cI$ with nonzero evaluated stable map
$X[1]\to\cI X$.
\end{lemma}
```
（$S=\Hom_k(X,X)=k$，双模作用 $(atb)(x)=a\,t(bx)$，即两侧都是 $\chi$；$\pi:E\to S$ 是表示。）

**(b) b:stable-adjunction 的证明机制**：
1. $f:L\to S$ 的普通伴随 $\widehat f(l\otimes x)=f(l)(x)$。过 $E^e$-有限投射的分解求值成过 $E$-投射的分解（2.1.6 第 2 步）。
2. 反向：嵌入 $L\hookrightarrow J$（有限投射-内射 $E^e$-模）；嵌入作为右 $E$-模映射分裂（$L_E$ 投射 ⇒ 对称 $E$ 上内射）⇒ $LX\to JX$ 单。若 $\widehat f$ 过 $E$-投射 $P$ 分解：$P$ 内射延拓第一因子到 $JX\to P$；复合后普通伴随给 $J\to S$，限制到 $L$ 是 $f$——双模投射分解。两个分解理想恰好对应。
3. **$S$ 不需要 side-projective**：$S$ 只出现在靶位置，分解理想只对源 $L$ 有要求。

**(c) b:evaluated-lift 的证明机制（全文逻辑最密的一页）**：
1. 记 $U=U_H$，$\phi=\pi\overline m:\cI\to S$。所有平移有有限 side-projective 代表（2.1.6）。考虑有限维线性映射
$$\phi_*:\sHom_{E^e}(U[1],\cI)\longrightarrow\sHom_{E^e}(U[1],S).$$
2. **对偶转置**：$E^e$ 上的对称稳定对偶（h:duality）把 $\phi_*$ 的转置等同于
```latex
\begin{equation}\label{b:transpose}
 \sHom_{E^e}(S,U)\longrightarrow\sHom_{E^e}(\cI,U),
 \qquad b\longmapsto b\phi.
\end{equation}
```
（固定第一变元 $U[1]$，其对偶平移是 $U[1][-1]=U$；第二变元自然性给预复合。）
3. **构造 $b_0$**：$\zeta=f^*\otimes f^*\in E$；$b_0:S\to U$，$b_0(1)=\zeta$。即使在扭转右作用下也是双模映射：
$$\zeta\cdot b=\zeta\sigma_H(b)=\chi(\sigma_H(b))\zeta=\chi(b)\zeta$$
（因 $\chi\sigma_H=\chi$）。
4. **核心矛盾**：断言 $b_0\phi\ne0$（稳定）。反设：导出映射 $b_0\pi m:K\to U$ 稳定像为零 ⇒ 过 perfect $E^e$-复形分解（h:perfect-factor）。用投射消解 $Q\to U$ 提升整体链映射（**不是**对完全消解断言 $K$-投射性——绕开 2.1.3 的警告）。
5. **限制到 $B^e$**：$E^e$-自由模限制成外双模 $E\otimes E$；$E$ 的左右 $B$-投射消解（维数 $\le4$，来自 2.3.2）张量给 $B^e$-投射消解，长度 $\le8$ ⇒ 限制后的中间对象是 $B^e$-perfect（有限项过滤）。
6. **抽出 $\eta$**：两个外 $B$-因子的包含给 $B^e$-链映射 $\iota:\operatorname{Bar}(B)\to\Res_{B^e}K$，即导出映射 $B\to\Res_{B^e}K$。因 $\sigma_H$ 固定 $B$，
$$\Res_{B^e}U=B\oplus(DC\otimes C)\oplus(C\otimes DC)\oplus DB$$
是 $B$-双模分解；$\rho$=投影到 $DB$。复合
$$\operatorname{Bar}(B)\xrightarrow{\iota}\Res K\xrightarrow{b_0\pi m}\Res U\xrightarrow{\rho}DB$$
恰是 $\eta$（度 0 把 $a\otimes c$ 送到 $\chi_B(ac)\chi_B$，因 $\rho(\zeta)=\chi_B$；高度数为零）复合 bar 增广。⇒ 假设的分解让 $\eta$ 过 perfect $B^e$-复形分解，与 b:trace-obstruction 矛盾。故 $b_0\phi\ne0$。
7. **提升存在**：$b_0\phi\ne0$ ⇒ (b:transpose) 非零 ⇒ $\phi_*$ 非零 ⇒ 存在 $\beta:U[1]\to\cI$ 使 $\phi\beta\ne0$。由 b:stable-adjunction（只对 side-projective 源 $U[1]$ 用），该非零类等同于复合
$$U[1]X\xrightarrow{\beta X}\cI X\xrightarrow{\overline m X}EX\cong X.$$
复合非零 ⇒ $\beta X$ 非零。$U[1]X\cong(UX)[1]=X[1]$。∎

**(d) 机械性理由与[推测]失败路线**：
- **为什么需要 $U_H[1]\to\cI$ 而不是 $U_H\to Y$ 直接造**：$\cI=(c_5K)[5]$，$Y=\cI[-1]$；导出归纳的自然映射 $m$ 的稳定像 $\overline m:\cI\to E$ 配表示 $\pi:E\to S$ 恰好拼出 $\cI\to S$——它在度 $-1$ 平移（$U_H[1]$）下落到 h:duality 的对偶框架里。平移回 $U_H\to Y$ 用 h:evaluation 的相容性。
- [推测] 失败路线 1：若 $b_0(1)=\zeta$ 但 $U_H$ 的右作用取 $\sigma_H$ 的逆，$\zeta\cdot b=\chi(\sigma_H^{-1}(b))\zeta$，而 $\chi\sigma_H^{-1}\ne\chi$ 一般不成立？——实际 $\chi\sigma_H=\chi$ 对所有 $H$ 成立（$DC$ 元素被 $C$-特征判别，缩放不改变"是否为零"），所以两个方向都行；真正的失败情形是取**任意**自同构 $\sigma$（不固定 $C$），则 $\Res U$ 的 $B^e$-分解含交叉项，$\rho$ 投影不再是双模映射，$\eta$ 抽不出来。
- [推测] 失败路线 2：若 $\pd_{B^e}(E)\ge9$，限制后的 perfect 论证失效（$4+4=8$ 的界被破坏）。Lean 的对应物：`restrictedBimoduleResolution_above (hn : 8 < n)`、`restrictedBimodule_pd`。
- [推测] 失败路线 3：h:perfect-factor 的应用需要"$b_0\pi m$ 是有界导出对象之间的映射"——$K$ 无界（正端无限）。论文取 $K$ 的**同调有界性**与"同调等价于有界复形的模型"绕开；若有人直接对 $K$ 用 2.1.3 的 $K$-投射性会失败（警告条款），链条在"提升到 $Q$"那一步断。
- **Lean 对应**：`StableLift.lean` 的 `characterBimoduleMap_not_derived_perfect_factor`（迹障碍的导出版）、`inducedSocleMap_stably_nonzero_lift`、`exists_Y_lift_with_nonzero_composition`、`exists_nonzero_X_YX`（最后的非零求值）。

### 2.5.5 b:bimodule 的收尾

取 b:bar-model 的固定 $Y$；b:profile 给廓形；对任意 $H$，把 b:evaluated-lift 的映射平移 $[-1]$ 并把 $\cI[-1]$ 等同于 $Y$，得稳定映射 $U_H\to Y$；其求值是非零类 $X\to YX$。稳定映射由普通双模映射代表 ⇒ $g_H$。所有 Hom 空间、对偶、选取都在 $k$ 上 ⇒ 无标量扩张；$Y$ 的构造不依赖 $H$（同一个 $Y$ 服务所有扭转）。
**[推测]** "同一个 $Y$ 服务所有 $H$"的正确性关键在 $\chi\sigma_H=\chi$ 与 $Y$ 由 bar 复形（只涉及 $B$ 与 $E$）构造；若 $Y$ 依赖 $H$，第 7 章 (t:fiber) 里的 $U_1\oplus U_2\oplus Q\to Y$ 不再是同一个靶，纤维不复存在。

## 2.6 三角代数与反例完成（论文 §7 "The triangular module and the counterexample"，`triangular.tex`）

> 本节把 §2.3–2.5 造出的全部零件（$E,X,Y$、扭转 $U_H$、稳定映射 $g_H$）装配成最终对象 $(\Lambda,Z,P_Z)$，验证转移原理 (tr:transfer) 的全部假设，然后一步收尾证明 Theorem thm:main。论文本节共三个小节 + 一个收尾证明：纤维（t:fiber）→ 列函子与锥（t:triangular-algebra, t:cone）→ 全 endomorphism 复形（t:vanishing, t:neighboring-degrees）→ Proof of Theorem main。

### 2.6.1 两个求值映射的纤维（序列 t:fiber 与长正合列 t:fiber-hom）

**(a) 设定与纤维（TeX 原文）**：
```latex
We now combine the two twists and apply the transfer principle of
Proposition~\ref{tr:transfer}.  Retain $E,X$ and the finite
side-projective bimodule $Y$ from Proposition~\ref{b:bimodule}.
For brevity, write $LX=L\otimes_E X$ for an $E$-bimodule $L$, and set
\[
 W^a=\sHom_E(X,YX[a]).
\]
Thus $W^a=k$ for $a=-3,0$ and is zero otherwise.
```
```latex
For $i=1,2$, put $U_i=U_{H_i}$.  Choose the maps
$g_i:U_i\to Y$ supplied by Proposition~\ref{b:bimodule}.
Using the fixed identifications $U_iX\simeq X$, their evaluated stable
classes are nonzero elements of the same one-dimensional space
$W^0$.  Rescale them so that both classes equal a fixed $w\ne0$.
Choose a finite free $E$-bimodule $Q$ with a surjection
$\pi:Q\to Y$, and define $F$ by
\begin{equation}\label{t:fiber}
 0\longrightarrow F\longrightarrow U_1\oplus U_2\oplus Q
 \xrightarrow{(g_1,g_2,\pi)}Y\longrightarrow0.
\end{equation}
For example, the action gives such a surjection from $E^e\otimes_kY$.
Since $Y$ is projective on each side, this sequence splits separately
on the left and on the right.  In particular, $F$ is finite and
side-projective.
```

**(b) 机制逐步**：

1. **归一化到同一个 $w$**：由 2.5.5，$g_1,g_2$ 的求值稳定类是非零元 $\in W^0$；$W^0$ 是一维（b:profile），故两个类都是 $w$ 的标量倍；把 $g_i$ 各乘以该标量的逆（双模映射空间 $\operatorname{Hom}_{E^e}$ 是 $k$-向量空间，缩放合法），可使二者都等于固定的 $w\ne0$。**这一步不是审美**：见下面第 4 步，度 0 的"末箭头"公式 $(c,d)\mapsto(c+d)w$ 只在两个分量用同一个 $w$ 时才成立，而它的核 $c+d=0$（特征 2 即 $c=d$）恰是对角线，决定了 $\mathcal V^0$ 里唯一提升 $(1,1)$ 的元素 $v_0$ 的存在。
2. **补自由覆盖 $Q$**：$(g_1,g_2):U_1\oplus U_2\to Y$ 一般不是满射（甚至是稳定映射，可能根本不逐点满），所以其"纤维"不是短正合列。论文用任意有限自由双模满射 $\pi:Q\twoheadrightarrow Y$ 补足——例如 $Q=E^e\otimes_kY$ 配合作用映射 $a\otimes t\otimes y\mapsto a\,t(y)$。（Lean 的做法就是这个例子的具体化：`Enveloping.fiberCover Y := Fin Y.cover.cover.rank → Alg k R S`，即秩为 $Y$ 的自由覆盖秩的 $E^e$-自由模，$\pi$=`Y.cover.map`，见 `Delta.lean:131`。）三元的和 $(g_1,g_2,\pi)$ 显然满（$\pi$ 已满）。
3. **两侧分开分裂**：序列 (t:fiber) 在右 $E$-模范畴分裂，因为 $Y_E$ 投射（分裂正合列引理：满射到投射对象有截面）；左同理。**注意**：两个分裂一般不能选成双模分裂——所以 $F$ 作为双模不必投射，但左、右分别投射。这正是全篇 side-projective 概念的落点：后续列函子 $\mathsf D_i$ 的正合性只需要单侧投射性。
4. **求值保持正合**：把 (t:fiber) 逐张量 $-\otimes_EX$。由第 3 步右分裂，张量保持短正合（分裂列张量后仍分裂列）；且 $QX$ 是 $E$-投射（$Q$ 有限自由双模 ⇒ $Q\otimes_EX$ 自由右 $E$ 张左作用……论文只需 "$QX$ is $E$-projective"），在稳定范畴中为零。$U_iX\simeq X$ 用的是 2.4.4 扭转的固定辨识。于是得 $\sHom_E(X,-[a])$ 作用的长正合列（$\sHom$ 在 side-projective 对象上是 $\delta$-函子）：
```latex
\begin{equation}\label{t:fiber-hom}
 (\cH^{a-1})^2\longrightarrow W^{a-1}
 \longrightarrow\mathcal V^a
 \xrightarrow{p^a}(\cH^a)^2\longrightarrow W^a.
\end{equation}
```
其中 $\mathcal V^a=\sHom_E(X,FX[a])$，$\mathcal H^a=\sHom_E(X,X[a])$（$X$ 的稳定自同态度数 $a$ 部分；两项 $(\cdot)^2$ 来自 $U_1\oplus U_2$ 两个分量），$p^a$ 是限制到 $F\to U_1\oplus U_2$ 的投影。
5. **度 0 末箭头**：$(\mathcal H^0)^2\to W^0$ 是 $(c,d)\mapsto(c+d)w$。推导：$\mathcal H^0=k\cdot\operatorname{id}_X$（$X$ 一维 simple，稳定自同态度 0 = 自同态模掉过投射因子，对 1 维模仍是 $k$）；$c\,\operatorname{id}$ 经 $U_1$ 分量作用到 $W^0$ 时给 $c\cdot[w]$（$g_1$ 的求值类 $=w$），$d\,\operatorname{id}$ 经 $U_2$ 给 $d\cdot[w]$；相加（特征 2 无符号）。其核 $=\{(c,c)\}\cong k$（特征 2 中 $c+d=0\Leftrightarrow c=d$）。由第 4 步正合性：$W^{-1}=0\Rightarrow\mathcal V^0\to(\mathcal H^0)^2$ 单且像为核，故 $\mathcal V^0\cong k$ 且**存在唯一元 $v_0$ 投到 $(1,1)$**。$v_0$ 就是后续构造锥的原料（它 represented by $\widetilde v:X\to FX$）。
6. **三个边界度数的直接读法（t:boundary-fiber）**：
```latex
\begin{equation}\label{t:boundary-fiber}
 \mathcal V^{-2}=k,
 \qquad \mathcal V^0=kv_0,
 \qquad \mathcal V^1=0.
\end{equation}
```
逐条从 (t:fiber-hom) 读：
- $a=-2$：段 $(\mathcal H^{-3})^2\to W^{-3}\to\mathcal V^{-2}\to(\mathcal H^{-2})^2$。廓形（2.1 已知 $\mathcal H^a$ 支撑在 $a=0\bmod 3$（非负端）与 $a=-3m-1\le-4$（负端））给 $\mathcal H^{-3}=0$、$\mathcal H^{-2}=0$；$W^{-3}=k$（b:profile 的非零端点）。于是 $0\to k\to\mathcal V^{-2}\to0$，$\mathcal V^{-2}\cong k$。
- $a=0$：第 5 步。
- $a=1$：段 $W^0\to\mathcal V^1\to(\mathcal H^1)^2$，$\mathcal H^1=0$ 故 $\mathcal V^1=\operatorname{im}(W^0\to\mathcal V^1)=\ker(\mathcal V^1\to0)=\mathcal V^1$？不对，方向是：$\operatorname{im}(W^0\to\mathcal V^1)=\ker(\mathcal V^1\to(\mathcal H^1)^2)=\mathcal V^1$（因 $\mathcal H^1=0$）；但 $W^0\to\mathcal V^1$ 的核 $=\operatorname{im}((\mathcal H^0)^2\to W^0)=W^0$（末箭头满：$(1,0)\mapsto w\ne0$ 生成一维 $W^0$）。故 $W^0\to\mathcal V^1$ 是零映射，$\mathcal V^1=0$。**"at $a=1$ it also uses the surjectivity of $(\cH^0)^2\to W^0$"** 这句就是指这里。
- $a=-3$（留给引理证明用）：段 $W^{-4}\to\mathcal V^{-3}\to(\mathcal H^{-3})^2$ 两端皆零（$W^{-4}=0$、$\mathcal H^{-3}=0$），故 $\mathcal V^{-3}=0$，且 $p^{-3}:\mathcal V^{-3}\to(\mathcal H^{-3})^2$ 是 $0\to0$，自动同构。

**(c) 假设/构造选择的机械理由**：
- $U_iX\simeq X$ 的"固定辨识"：b:bimodule 只给 $U_HX\cong X$（求值非零的映射），辨识取定后才能说"两个类在同一维空间 $W^0$ 里"；若辨识差一个标量 $\lambda_i$，归一化吸收它，故无害。
- $Q$ 必须**自由**（不只是投射）：保证 $QX$ 投射在稳定范畴消失；用 $E^e\otimes_kY$ 时 $QX=E\otimes_kX\cong E^{\dim Y}$ 自由。
- $F$ side-projective 的全部用途在下一小节：$\Lambda$ 的列函子正合（右投射）与 $\operatorname{Hom}_\Lambda(\mathsf D_i(P),\Lambda)$ 的正合（左投射）。

**(d) [推测] 候选失败路线**：
1. [推测] 若只取一个扭转（$U_1$ 单独），末箭头 $(\mathcal H^0)^2\to W^0$ 换成单个 $c\mapsto cw$，核为 $0$，$\mathcal V^0=0$：$v_0$ 不存在，第 3 层断链。双扭转不是奢侈而是**恰好造出对角核**的最小配置（对偶地，$\Delta^a$ 的可逆性要两行 $(H_1^{\pm},1),(H_2^{\pm},1)$ 线性无关，单行永远是秩 1）。
2. [推测] 若 $g_i$ 不归一化而是任取非零类 $\lambda_i w$，末箭头变 $(c,d)\mapsto(c\lambda_1+d\lambda_2)w$，核仍一维但 $(1,1)$ 不在核里，"$v_0$ 投到 $(1,1)$"的表述失效；后续 (t:projected-delta) 中"每个投影送 $v_0$ 到 $X$ 的恒等"就需要修改，$\Delta^a$ 矩阵添上 $\lambda_i$ 对角修正。可逆性结论不变（$\lambda_i\ne0$），但论文用归一化把它免掉。
3. [推测] 若 $Y$ 仅左投射不右投射（b:bimodule 构造失效的镜像），(t:fiber) 右端不分裂，$-\otimes_EX$ 不再保正合，长正合列 (t:fiber-hom) 根本不存在。

### 2.6.2 比较映射 $\Delta^a$（Lemma t:comparison-maps）

**(a) 陈述（TeX 原文）**：
```latex
For a stable map $g:X\to X[a]$, let $F(g)$ denote its image under
the exact functor $F\otimes_E-$, using the shift comparisons of
Lemma~\ref{h:evaluation}.  Define
\begin{equation}\label{t:delta}
 \Delta^a:(\cH^a)^2\longrightarrow\mathcal V^a,
 \qquad (g,h)\longmapsto F(g)v_0+v_0[a]h.
\end{equation}

\begin{lemma}\label{t:comparison-maps}
The map $\Delta^0$ is surjective.  For every $a>0$ and every
$a\leq-3$, $\Delta^a$ is an isomorphism, and $\Delta^{-2}$ is
injective.
\end{lemma}
```

**(b) 证明机制，逐步**：

1. **$p^a$ 是区段同构的骨架**。由 (t:fiber-hom)，$p^a:\mathcal V^a\to(\mathcal H^a)^2$ 的核 $=\operatorname{im}(W^{a-1}\to\mathcal V^a)$，余核进 $(\mathcal H^a)^2\to W^a$ 的核。$W$ 支撑在 $\{-3,0\}$、$\mathcal H$ 支撑在 $\{3m,-3m-1:m\ge0\}$（负端 $m\ge1$）：
   - $a\ge2$：$W^{a-1}=W^a=0$，得 $p^a$ 同构（$\mathcal V^a\cong(\mathcal H^a)^2$，两端都同空与否无关——注意这里 $(\mathcal H^a)^2$ 未必非零，同构是"等空"）。
   - $a=1$：见 2.6.1 第 6 步，$\mathcal V^1=(\mathcal H^1)^2=0$。
   - $a\le-4$：$W^{a-1}=W^a=0$，$p^a$ 同构。
   - $a=-3$：$\mathcal V^{-3}=0=(\mathcal H^{-3})^2$。
2. **关键恒等式 (t:projected-delta)**：
```latex
\begin{equation}\label{t:projected-delta}
 p^a\Delta^a(g,h)=
 \bigl(U_1(g)+h,\ U_2(g)+h\bigr).
\end{equation}
```
推导：$p^a$ 是沿 $F\to U_1\oplus U_2$ 投影后取 $\sHom_E(X,-[a])$。第一项 $F(g)v_0$ 投到 $U_i$ 分量：$F\to U_i$ 与 $v_0$ 的复合。论文明说"each projection sends $v_0$ to the identity of $X$"——因为 $F\to U_i$ 再辨识 $U_iX\cong X$ 恰好是 $v_0$ 的定义要求的（$v_0$ 是唯一投到 $(1,1)$ 的元素，逐分量读就是每个投影复合回去等于 $\operatorname{id}_X$）。于是 $U_i$ 分量 $=U_i(g)\circ\operatorname{id}+\operatorname{id}\circ h$。第二项 $v_0[a]h$ 是平移比较（h:evaluation）下的右复合：$h$ 先作用在 $X[a]$ 上、再回拉。"evaluation of a bimodule map commutes with the specified shift comparisons" 就是把 h:evaluation 的自然性用在 $g,h$ 上，保证 $v_0[a]h$ 与先求值再复合一致（这一步是 2.1.6 第 3 步存在性论证的兑现处）。
3. **代入扭转权重读矩阵**。由 e:twists（2.4.4）：$U_i$ 作为"作用在稳定自同态上的双模函子 $U_i\otimes_E-$"，在 $\mathcal H^{3m}$（$\cong\mathcal P_m$，$m\ge0$）上以 $H_i^{-m}$ 作用，在 $\mathcal H^{-3m-1}$（$\cong D\mathcal P_m$，$m\ge1$）上以 $H_i^{m+2}$ 作用。于是：
   - $a=3m>0$：$p^a\Delta^a$ 的矩阵是 $\begin{pmatrix}H_1^{-m}&1\\H_2^{-m}&1\end{pmatrix}\otimes1_{\mathcal P_m}$（第一列=对 $g$ 的 $U_i$-作用权重，第二列=对 $h$ 的恒等）。
   - $a=-3m-1\le-4$：$\begin{pmatrix}H_1^{m+2}&1\\H_2^{m+2}&1\end{pmatrix}\otimes1_{D\mathcal P_m}$。
   两种情形 $m\ge1$（正端 $a>0$ 且 $a\equiv0\bmod3$ 给 $m\ge1$；负端本来 $m\ge1$）。
4. **行列式**：$\det=r-s$，特征 2 中 $=r+s$，其中 $r,s$ 是 $H_1^{\pm m},H_2^{\pm m}$ 或 $H_1^{m+2},H_2^{m+2}$。$H_1,H_2$ 代数独立（在 $\mathbb F_2(q,H_1,H_2)$ 中）⇒ 对每个 $m\ge1$：$H_1^{-m}\ne H_2^{-m}$（等价 $H_1^m\ne H_2^m$）与 $H_1^{m+2}\ne H_2^{m+2}$，行列式非零 ⇒ $p^a\Delta^a$ 可逆 ⇒ 结合第 1 步 $p^a$ 同构，$\Delta^a$ 同构。**行列式的具体形式** $H_1^{-m}+H_2^{-m}\ne0$、$H_1^{m+2}+H_2^{m+2}\ne0$（"≠0"与"≠"特征 2 同义）就是 1.3 表格里说的"$\Delta^a$ 可逆性归结为行列式 $H_1^w+H_2^w\ne0$"的出处。
5. **其余度数"源靶皆零"**：$a>0$ 中 $a\not\equiv0\bmod3$ 的度数，$\mathcal H^a=0$；同时 $p^a$ 已证同构，故 $\mathcal V^a\cong(\mathcal H^a)^2=0$，$\Delta^a:0\to0$ 自动同构。$a\le-3$ 中 $a\ne-3m-1$ 同理（论文："In all other degrees in the asserted ranges, the source and target are zero by Proposition~\ref{e:all-degrees} and the already proved isomorphism $p^a$"）。
6. **两个端点**：$\Delta^0(c,d)=(c+d)v_0$：由 (t:delta)，$F(c\,\operatorname{id})v_0+v_0[d\,\operatorname{id}]=(c+d)v_0$（$F\otimes_E\operatorname{id}= \operatorname{id}_{FX}$；标量作用把 $\mathcal V^0=kv_0$ 上变成乘 $c+d$）。满射：$(1,0)\mapsto v_0$。$\Delta^{-2}:0\to k$：源 $(\mathcal H^{-2})^2=0$，零到单射自动成立。**"Its surjectivity is neither claimed nor needed"**——若也满则 $H^{-1}\operatorname{End}(P_Z)$ 死掉，但见 2.6.4，度 $-1$ 非零无害（tr:transfer 不要 $-1$）。

**(c) 机械理由**：
- 矩阵第二列恒为 1：$v_0[a]h$ 项里没有扭转（$h$ 是 $X\to X[a]$ 的稳定映射，直接沿第二个和分量作用），这给出 $U_i(g)+h$ 中"$+h$"。若两列结构不同（比如权重也作用在 $h$ 上），行列式条件要重算。
- $m\ge1$ 的边界：$a=-1$（即 $m=0$ 的负端）**不在**引理断言范围内（断言 $a\le-3$），$a=0$ 单独处理为"仅满射"——恰好都是 $\Delta$ 性质弱化的度数，对应 Remark 里 $H^{-1}\ne0$ 的自由度。
- 代数独立只在"有限多个有理等式 $H_1^u\ne H_2^u$"被使用；参数是三个独立未定元是充分粗的做法（2.4/2.5 各处同）。

**(d) [推测] 候选失败路线**：
1. [推测] $H_1,H_2$ 若取成 $H_1=H_2$：所有 $a=3m,-3m-1$ 的 $\Delta^a$ 变秩 1，LES 里 $\ker/coker$ 非零，t:vanishing 大面积崩溃。这是"两个不同扭转"刚性最强的一次体现。
2. [推测] 若 $v_0$ 不唯一（$\mathcal V^0$ 维数 $>1$，例如 $W^0$ 归一化失败），$\Delta^0$ 的满射性没有保证，$H^1\operatorname{End}(P_Z)$ 可能非零，$a=1$ 端点（即 $\Ext_A^1(M,M)$，经对偶来自度 $-2$……注意区分：$a=1$ 处 t:vanishing 需要 $\ker\Delta^1$、$\coker\Delta^0$ 双零）断。
3. [推测] 用 $\operatorname{Hom}$（普通）替代 $\sHom$ 读 (t:fiber-hom)：$QX$ 投射不再消失，长正合列多出一列自由项，$\mathcal V^a$ 廓形污染，行列式论证不适用。

### 2.6.3 三角代数 $\Lambda$、列函子与锥 $P_Z$（t:triangular-algebra、t:cone、Lemma t:finite-module）

**(a) 陈述（TeX 原文）**：
```latex
Form the finite-dimensional algebra
\begin{equation}\label{t:triangular-algebra}
 \Lambda=\begin{pmatrix}E&0\\F&E\end{pmatrix}.
\end{equation}
A left $\Lambda$-module is a triple
$(L,N,\alpha:F\otimes_E L\to N)$ of left $E$-modules and an
$E$-linear structure map, with action
\[
 \begin{pmatrix}a&0\\b&d\end{pmatrix}(x,y)
 =\bigl(ax,\alpha(b\otimes x)+dy\bigr).
\]
The column constructions are standard in the theory of totally acyclic
complexes over triangular matrix rings; see
\cite[Lemma~2.2 and Proposition~2.3]{EshraghiEtAl2014v1}.
Here $F$ is projective on each side, so the required tensor exactness
and orthogonality conditions hold. We retain the complete resolution
to compute its self-Hom groups. Define the two column functors
\[
 \mathsf D_0(L)=(L,FL,1),
 \qquad \mathsf D_1(L)=(0,L,0).
\]
They are exact and preserve finite projectives: exactness uses right
projectivity of $F$, and their values on $E$ are the two columns of
the regular module $\Lambda$.  The descriptions of module maps give
\begin{align}
 \Hom_\Lambda(\mathsf D_i(L),\mathsf D_i(L'))
   &\simeq\Hom_E(L,L')\quad(i=0,1),\label{t:diagonal-hom}\\
 \Hom_\Lambda(\mathsf D_0(L),\mathsf D_1(L'))&=0,
 \qquad
 \Hom_\Lambda(\mathsf D_1(L),\mathsf D_0(L'))
   \simeq\Hom_E(L,FL').\label{t:cross-hom}
\end{align}
In the first diagonal slot, the map on the lower component is $F(g)$
when the map on the upper component is $g$.
```
```latex
Let $p_f=f\otimes f$.  Use the embedding
$i_X:X\hookrightarrow Ep_f$, $i_X(1)=\zeta$, established in
Lemma~\ref{e:socle}.  Choose a complete resolution
$P$ of $X$ over $E$ whose first negative term is
$P_{-1}=Ep_f$, and whose degree-zero differential is
$d_0=i_X\epsilon$, where $\epsilon:P_0\to X$ is the augmentation.
Such a choice is possible because $E$ is symmetric.  The complex
$FP$ is exact with projective terms, and $c_0(FP)=FX$.

Choose an ordinary map $\widetilde v:X\to FX$ representing $v_0$.
Lemma~\ref{h:comparison} lifts it to a chain map $P\to FP$.
By \eqref{t:cross-hom} this is a chain map
\[
 V:\mathsf D_1(P)\longrightarrow\mathsf D_0(P).
\]
Set
\begin{equation}\label{t:cone}
 P_Z=\Cone(V),\qquad Z=c_0P_Z.
\end{equation}
Thus
\[
 (P_Z)_j=\mathsf D_0(P_j)\oplus\mathsf D_1(P_{j-1}),
\]
with cross differential $V_{j-1}$ from the second summand to the
first summand in degree $j-1$.
```

**(b) 机制逐步**：

1. **$\Lambda$ 作为 $\mathbb Z$-分次化对象**。上三角矩阵代数 $\Lambda=\bigl(\begin{smallmatrix}E&0\\F&E\end{smallmatrix}\bigr)$：底层 $k$-空间 $E\oplus F\oplus E$，乘法按矩阵乘（$F$ 是 $E^e$-模给出 $F\otimes_E E$、$E\otimes_E F$ 作用；$F\cdot F=0$ 因为左下块相乘落在"$(2,1)\times(2,1)$"不存在的位置）。三元组描述是标准的：$(x,y)$ 上分量被 $E$ 作用，下分量被 $E$ 作用，左下 $F$ 块把上分量搬到下分量（$\alpha:F\otimes_EL\to N$）。**关联图**：$\Lambda\cong\operatorname{TrivSqZeroExt}(E\times E,\;F^{\to})$——Lean 就是取这个同构作定义（`Triangular.lean:32`：`abbrev Alg F := TrivSqZeroExt (R × R) (Off F)`，其中 `Off F := Enveloping.Obj F` 带上 $(R\times R)$-$\,(R\times R)^{\mathrm{op}}$ 双作用：左作用走第二分量 `.2`，右作用走第一分量的 op，见 `Triangular.lean:15-18` 的 instance 串）。两个顶点幂等 $e_0=\operatorname{diag}(1,0),e_1=\operatorname{diag}(0,1)$（Lean：`e₀ := TrivSqZeroExt.inl (1,0)`）。
2. **列函子**。$\mathsf D_0(L)=(L,FL,1)$：上分量 $L$，下分量 $F\otimes_EL$，结构映射恒等；$\mathsf D_1(L)=(0,L,0)$：只在下面挂 $L$。它们是 $\Lambda$ 的两个"列"：$\mathsf D_0(E)=(E,F,1)$ 是 $\Lambda e_0$（第一列 $\bigl(\begin{smallmatrix}E\\F\end{smallmatrix}\bigr)$），$\mathsf D_1(E)=(0,E,0)=\Lambda e_1$。**正合性**：$\mathsf D_0$ 的正合需要 $F\otimes_E-$ 正合，即 ${}_E$-$F$ 的**右**投射（$F_E$ 投射）；$\mathsf D_1$ 显然正合。保有限投射：$\mathsf D_i$ 左伴随于限制/投影函子，把 $E$-自由送到 $\Lambda$-自由（由 $\mathsf D_i(E)=\Lambda e_i$ 生成）。这就是 2.6.1 第 3 步 $F$ side-projective 的第一处兑现。
3. **Hom 计算**。$\Lambda$-模同态 $(L,N,\alpha)\to(L',N',\alpha')$ = 对 $(u:L\to L',\,v:N\to N')$ 满足 $v\circ\alpha=\alpha'\circ(F\otimes u)$。代入 $\mathsf D_i$：
   - $\operatorname{Hom}_\Lambda(\mathsf D_0(L),\mathsf D_0(L'))$：$(u,v)$ 中 $v:F L\to FL'$ 被 $v=F(u)$ 强制（取 $L=E^{\oplus n}$ 生成元论证；论文在 (t:diagonal-hom) 后补注"In the first diagonal slot, the map on the lower component is $F(g)$ when the map on the upper component is $g$"——这是 2.6.5 连接映射算式的原料）。
   - $\operatorname{Hom}_\Lambda(\mathsf D_0(L),\mathsf D_1(L'))$：上分量映射 $L\to0$ 零，下 $FL\to L'$ 受约束 $\alpha'=0$ 强制 $v=0$。
   - $\operatorname{Hom}_\Lambda(\mathsf D_1(L),\mathsf D_0(L'))$：只剩任意的下分量映射 $L\to FL'$。
4. **完全消解 $P$ 的规格**。要求两件事：$P_{-1}=Ep_f$ 与 $d_0=i_X\epsilon$。存在性论证：$E$ 对称 ⇒ $X$ 的完全消解可以取"投射消解 $P_\bullet\to X$ 与内射消解拼接"的经典形态；更具体地，$X\cong\operatorname{soc}(Ep_f)\subset Ep_f$（e:socle：$\zeta=f^*\otimes f^*\in E$ 生成 $Ep_f$ 的 socle，$i_X(1)=\zeta$），把 $i_X$ 当作第一个余核嵌入，向负端延展为 $E$-自由完全消解、向正端用 h:comparison 的完全消解比较延拓。$FP$ 正合项投射：$F_E$ 右投射 ⇒ $F\otimes_E P_\bullet$ 正合；$P_j$ 有限投射 ⇒ 每项有限投射；$c_0(FP)=FX$：$\operatorname{coker}(FP_1\to FP_0)=F\otimes_E\operatorname{coker}(P_1\to P_0)=FX$（右正合 + 正合性）。
5. **提升 $v_0$ 成链映射**。$\mathcal V^0=\sHom_E(X,FX)$ 中的类 $v_0$ 用普通映射 $\widetilde v:X\to FX$ 代表（$P,FP$ 都是 side-projective 复形，稳定类有普通代表——这是 h:stable-image 方向；且代表 $\widetilde v$ 满足 $\widetilde v\epsilon$ 与 $d_0$ 交换到余核）。h:comparison（2.1.1：完全消解之间，模掉过投射分解的态射 = 链映射模同伦）把 $\widetilde v$ 提升为链映射 $\widehat v:P\to FP$。再经 (t:cross-hom) 逐度数组装：$\operatorname{Hom}_\Lambda(\mathsf D_1(P_j),\mathsf D_0(P_j))\cong\operatorname{Hom}_E(P_j,FP_j)$ 且与微分相容，得链映射 $V:\mathsf D_1(P)\to\mathsf D_0(P)$。
6. **锥**。同调指标下 $\operatorname{Cone}(V)_j=\mathsf D_0(P_j)\oplus\mathsf D_1(P_{j-1})$，微分 $\bigl(\begin{smallmatrix}d^P&V\\0&d^P\end{smallmatrix}\bigr)$（符号在特征 2 消失——这是论文 Convention 的又一次兑现；锥项的具体拼装见 Lean `Cone.lean:12` `abbrev complex := HomologicalComplex.homotopyCofiber v` 及 `termEquiv`）。$Z=c_0P_Z$ 即 $\operatorname{coker}\bigl((P_Z)_1\to(P_Z)_0\bigr)$，正是 tr:transfer 要求的"度 0 余核"形态。

**(c) 机械理由**：
- 为什么"上凸"锥（$\mathsf D_1$ 平移 $[1]$ 叠 $\mathsf D_0$）而不是别的组合：只有 $\operatorname{Hom}(\mathsf D_0,\mathsf D_1)=0$ 保证锥的"反向块"零，才能把 $\operatorname{End}(P_Z)$ 的四块里砍掉一块（见 2.6.4 (t:end-sequence) 的三块短正合列）。
- $v_0$ 是稳定类而非普通映射的原因：普通 $\widetilde v$ 的选择只影响链映射的同伦类（h:comparison 的商结构），锥的全循环性与后续上同调只依赖稳定类——**用 $v_0$（而非 $\widetilde v$）参与 $\Delta^a$ 定义**正是把"选择不敏感性"钉死。
- 引用 Eshraghi–et al.（`EshraghiEtAl2014v1` Lemma 2.2 / Prop 2.3）只是借用"三角矩阵环上全循环复形的列构造是标准的"这一文献位置；论文自己重证（"Here $F$ is projective on each side, so the required tensor exactness and orthogonality conditions hold"），并**保留完全消解**（"We retain the complete resolution to compute its self-Hom groups"）——文献版本只到"投射维数有限"层面，负度数必须留完全消解。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $F$ 只左投射不右投射：$\mathsf D_0$ 不正合，$P_Z$ 的项仍投射（保投射只需要 $\mathsf D_i$ 值在投射上，用 $F$ 左投射的 $\operatorname{Hom}_E(P,F)$ 正合……两侧各管一事：正合用右投射、self-Hom 正合用左投射），$P_Z$ 不再正合，全循环性断链。
2. [推测] 若 $E$ 不对称：第 4 步"完全消解可以按指定负端拼装"失效（h:duality 的对称稳定对偶是负端信息可控的全部依据），$P_{-1}=Ep_f$ 规格无法满足，$i_X$ 进不了完全消解。
3. [推测] 若 $\widetilde v$ 选成不代表 $v_0$ 的映射（例如差一个过投射因子）：链映射 $V$ 的像在同伦类中变 $v_0+$(过投射)，锥的同伦型改变，$Z$ 换模；非投射性可能保住但 $\Delta$ 恒等式 (t:projected-delta) 里"投影送 $v_0$ 到恒等"失效。

### 2.6.4 有限生成、非投射与全循环（Lemma t:finite-module）

**(a)**（陈述即上面第 2.6.3 节引文末尾 + 下面引理）
```latex
\begin{lemma}\label{t:finite-module}
The complex $P_Z$ is totally acyclic.  Its degree-zero cokernel $Z$
is finite-dimensional and nonprojective.
\end{lemma}
```

**(b) 证明机制，逐步**：

1. **两列各自全循环**。项投射：$\mathsf D_i(P_j)$ 投射（第 2.6.3 步 2）。正合：两列都正合（$\mathsf D_1$ 恒等；$\mathsf D_0$ 用 $F_E$ 右投射）。对 $\Lambda$ 求 Hom：$\Lambda=\mathsf D_0(E)\oplus\mathsf D_1(E)$，所以
$$\operatorname{Hom}_\Lambda(\mathsf D_i(P),\Lambda)\cong\operatorname{Hom}_\Lambda(\mathsf D_i(P),\mathsf D_0(E))\oplus\operatorname{Hom}_\Lambda(\mathsf D_i(P),\mathsf D_1(E))$$
按 (t:diagonal-hom)/(t:cross-hom) 逐块识别为 $\Hom_E(P,E)$、$\Hom_E(P,F)$、$0$ 的和。**正合性**：$\Hom_E(P,E)$ 正合因为 $P$ 全循环（$E$ 是有限投射左模）；$\Hom_E(P,F)$ 正合因为 $F$ 是**有限左投射**（$\Hom_E(P,F)\cong\Hom_E(P,E)\otimes_E\cdots$ 不必绕：$F$ 有限投射 ⇒ 逐度 $\Hom_E(P_j,F)$ 是 $\Hom_E(P_j,E)^{\oplus r}$ 型、微分对应，正合随 $P$ 的全循环性）。⇒ 两列全循环。
2. **锥保全循环**：全循环复形之间的链映射的锥仍全循环——标准 $\delta$-论证：$\Hom_\Lambda(\operatorname{Cone}V,\Lambda)\simeq\Hom_\Lambda(B,\Lambda)\to\Hom_\Lambda(A,\Lambda)$ 锥形态，正合复形的锥正合（这里 $A=\mathsf D_1(P)$，$B=\mathsf D_0(P)$ 都全循环）。故 $P_Z$ 全循环。
3. **$Z$ 的显式有限描述**：
```latex
\begin{equation}\label{t:explicit-module}
 N_Z=(FX\oplus Ep_f)
 \big/\{(\widetilde v(x),i_X(x)):x\in X\},
\end{equation}
```
上分量 $X$、下分量 $N_Z$、结构映射 $FX\to N_Z$ 由第一和分量包含诱导。逐度验算：$(P_Z)_0=\mathsf D_0(P_0)\oplus\mathsf D_1(P_{-1})=(P_0,FP_0,1)\oplus(0,P_{-1},0)$。对 $(P_Z)_1$ 的微分像有两类来源：(i) $\mathsf D_0$ 列内部 $d^P_1:P_1\to P_0$ 与其 $F$ 伴随——商掉后上分量剩 $X=P_0/\operatorname{im}d_1$，下分量第一槽 $FP_0/\operatorname{im}(FP_1)=FX$（用 $FP$ 正合）；(ii) 平移列 $P_0$ 经交叉项 $V_0$ 落入下分量、以及其内部微分 $d^P_0:P_0\to P_{-1}$——两个成分在 $P_0\to FX\oplus P_{-1}=Ep_f$ 中分别诱导 $\widetilde v\epsilon$ 与 $i_X\epsilon$（$V$ 代表 $v_0$，其度 0 分量模过投射后是 $\widetilde v$ 复合augmentation；$d_0=i_X\epsilon$ 是规格）。把两类像一起商掉，恰得 (t:explicit-module)：商关系 $\{(\widetilde v(x),i_X(x)):x\in X\}$（$\epsilon$ 满，$x$ 跑遍 $X$）。有限维：$FX$、$Ep_f$ 都有限。
4. **非投射性（上分量函子论证）**。$\pi_{\text{upper}}:\Lambda\text{-mod}\to E\text{-mod}$，$(L,N,\alpha)\mapsto L$ 正合，且 $\pi_{\text{upper}}(\mathsf D_0(E))=E$、$\pi_{\text{upper}}(\mathsf D_1(E))=0$。若 $Z$ 是投射 $\Lambda$-模，$Z$ 是 $\Lambda^r=(\mathsf D_0(E)\oplus\mathsf D_1(E))^r$ 的直加项，$\pi_{\text{upper}}(Z)=X$ 是 $E^r$ 的直加项 ⇒ $X$ $E$-投射。但 $X$ 非投射：$\Ext_E^3(X,X)\ne0$（e:all-degrees / e:polynomial：$\tau\ne0$）。矛盾。

**(c) 机械理由**：上分量函子"把投射生成元送到 $E$ 与 $0$"是关键——它只需**正合**（不要求左右伴随、不要求保内射），所以三角结构 $(E\times E)$ 的两个投影（Lean `Triangular.upper/lower`，`AlgHom` 级）够用。$X$ 非投射的判据取度 3 而非度 1：$\Ext_E^1(X,X)$ 是否非零论文未单独断言（$\mathcal H^1$ 的稳定 Hom 为 0，但 $\Ext^1$ 与 $\sHom^1$ 在对称代数上一致……实际用的是 $\Ext_E^3(X,X)\cong k\tau\ne0$——e:all-degrees 里 $a=3$ 位置）。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $F$ 左投射失败（而非右）：第 1 步 $\Hom_E(P,F)$ 不正合，两列不全循环，t:finite-module 整个失效——与 2.6.3(d)1 是对称的另一个断点，说明 $F$ 必须双侧。
2. [推测] 若 $\Lambda$ 取下三角 $\bigl(\begin{smallmatrix}E&F\\0&E\end{smallmatrix}\bigr)$（或对 $F$ 取 $D F$）：$\operatorname{Hom}(\mathsf D_1,\mathsf D_0)$ 与 $\operatorname{Hom}(\mathsf D_0,\mathsf D_1)$ 角色互换，锥的"零块"位置改变，(t:end-sequence) 的分块短正合列与 (t:delta) 的 $F(g)v_0+v_0[a]h$ 公式不再匹配（连接映射变成 $g$ 与 $h$ 的不对称组合，权重矩阵行列式重算）。方向选择与 $F$ 在三角中的位置是绑定设计。
3. [推测] 非投射性若改用"迹/维数"论证：$Z$ 的维数与投射模维数没有整除障碍（$\Lambda$ 非局部），走不通；上分量函子是唯一干净的传递通道。

### 2.6.5 全 endomorphism 复形与消失廓形（Proposition t:vanishing）

**(a) 陈述（TeX 原文）**：
```latex
\begin{proposition}\label{t:vanishing}
The module and resolution in \eqref{t:cone} satisfy
\[
 H^a\Hom_\Lambda(P_Z,Z)=0
 \qquad(a>0\ \text{or}\ a\leq-2).
\]
\end{proposition}
```
这正是 tr:transfer 假设 (tr:two-sided-vanishing) 的形状——论文标题性一句："The complete resolution makes it possible to check both vanishing ranges with the same endomorphism calculation."

**(b) 证明机制，逐步**：

1. **分块短正合列**。记 $A_0=\mathsf D_0(P)$、$B_0=\mathsf D_1(P)$，则 $P_Z$ 的分级对象是 $A_0\oplus B_0[1]$。四块 $\Hom_\Lambda(A_0\oplus B_0[1],A_0\oplus B_0[1])$ 中，$\Hom_\Lambda^\bullet(A_0,B_0[1])=0$（(t:cross-hom) 的 $\operatorname{Hom}(\mathsf D_0,\mathsf D_1)=0$ 逐度成立），于是投影到两个对角块给
```latex
\begin{equation}\label{t:end-sequence}
\begin{split}
 0\longrightarrow\mathcal C^\bullet
 \longrightarrow\End_\Lambda^\bullet(P_Z)
 \longrightarrow
 \End_\Lambda^\bullet(A_0)\oplus
 \End_\Lambda^\bullet(B_0[1])
 \longrightarrow0,\\[-2pt]
 \mathcal C^\bullet=\Hom_\Lambda^\bullet(B_0[1],A_0).
\end{split}
\end{equation}
```
论文明注逐度 Hom 空间是按 h:comparison 的**乘积**（"the block decomposition has only four blocks. In particular, it does not replace any product by a direct sum"）——完全消解的 $\Hom^\bullet(P,E)=\prod_j\Hom(P_j,E_{j-\bullet})$ 用积不用直和，这个小心声明是因为无界复形的 Hom 若误用直和，上同调会变（余积/积分歧在无限支撑处）。
2. **交叉块的重标**。度 $a$ 的交叉块
$$\mathcal C^a=\prod_j\Hom_E(P_{j-1},FP_{j-a})=\prod_i\Hom_E(P_i,FP_{i-(a-1)})=\Hom_E^{a-1}(P,FP),$$
即 $\mathcal C^\bullet$ 恰是复形 $\Hom_E^\bullet(P,FP)$ **整体平移指标 $a\mapsto(a-1)$** 的恒等。微分的相容："The differentials agree under this reindexing in characteristic two."——一般特征下 $\operatorname{Cone}$ 微分带 $-V$、平移函子带符号，两个符号在重标下差一个 $(-1)^{?}$，交叉块微分与 $\Hom(P,FP)$ 微分会差符号；特征 2 把它们全部吸收。**这是全文三处"特征 2 恒等式"之一**（另两处：2.1 约定句、1.3 表注）。由 h:comparison（对 side-projective 复形对 $(P,FP)$ 与稳定类 $v_0$ 的识别 $H^{a-1}\Hom_E^\bullet(P,FP)=\mathcal V^{a-1}$）得
$$H^a\mathcal C^\bullet=\mathcal V^{a-1}.$$
3. **对角块上同调**：$H^a\End^\bullet(A_0)\oplus H^a\End^\bullet(B_0[1])=(\mathcal H^a)^2$（h:comparison 把 $\Hom_\Lambda(\mathsf D_i(P),\mathsf D_i(P))$ 的上同调等同于 $\sHom_E(X,X[a])=\mathcal H^a$；两列一样）。
4. **连接映射 $=\Delta^a$**。LES 中 $\delta^a:H^a(\text{对角})=(\mathcal H^a)^2\to H^{a+1}\mathcal C^\bullet=\mathcal V^a$ 的算式：取对角 cocycle $(g,h)$，提升到 $\End(P_Z)$ 的分块对角链映射 $\operatorname{diag}(g_*,h_*)$，其上余边界 $d_{\text{coch}}=\delta_{A}\circ- - (-)\circ\delta_{B}$ 型；锥微分 $\bigl(\begin{smallmatrix}d&V\\0&d\end{smallmatrix}\bigr)$ 代入后交叉分量 $=F(g)V+Vh$（第一对角元 $g$ 在 $\mathsf D_0$ 下分量按 $F(g)$ 作用——(t:diagonal-hom) 的补充句在此兑现；第二个 $h$ 在 $\mathsf D_1$ 上就是 $h$，预复合进 $V$）。在 h:comparison 的"与复合相容的比较"（$V\leftrightarrow v_0$）下这就是 $F(g)v_0+v_0[a]h=\Delta^a(g,h)$（(t:delta) 的定义式）。
5. **压缩成短正合列**：LES 在零块处截断给
```latex
\begin{equation}\label{t:end-cohomology}
 0\longrightarrow\coker\Delta^{a-1}
 \longrightarrow H^a\End_\Lambda^\bullet(P_Z)
 \longrightarrow\ker\Delta^a\longrightarrow0.
\end{equation}
```
（推导：$(\mathcal H^{a-1})^2\xrightarrow{\Delta^{a-1}}\mathcal V^{a-1}\to H^a(\text{对角})\to(\mathcal H^a)^2\xrightarrow{\Delta^a}\mathcal V^a$ 中段精确，即 $H^a\End=\ker[\mathcal V^{a-1}\to(\mathcal H^a)^2\text{模像}]\cong$ 标准蛇形压缩。）
6. **逐度数读表**（对 $a>0$ 或 $a\le-2$）：
   - $a>1$：$\Delta^{a-1}$ 同构（$a-1>0$，t:comparison-maps）⇒ $\coker=0$；$\Delta^a$ 同构（$a>0$）⇒ $\ker=0$。$H^a=0$。
   - $a=1$：$\coker\Delta^0=0$（**满射**条款）；$\ker\Delta^1=0$（$1>0$ 同构条款）。$H^1=0$。
   - $a\le-3$：$\Delta^{a-1}$ 同构（$a-1\le-4\le-3$）与 $\Delta^a$ 同构（$a\le-3$）。$H^a=0$。
   - $a=-2$：$\coker\Delta^{-3}=0$（$-3$ 同构条款）；$\ker\Delta^{-2}=\ker[0\to k]=0$（**单射**条款）。$H^{-2}=0$。
   这正是 t:comparison-maps 断言形状 "$\Delta^0$ 满、$\Delta^{a>0}$ 与 $\Delta^{a\le-3}$ 同构、$\Delta^{-2}$ 单" 的原因：**每条弱一档的断言恰好堵一个边界度数**。
7. **从 $\End(P_Z)$ 换到 $\Hom(P_Z,Z)$**：h:comparison 再启动，这次源是 $P_Z$ 自己（全循环，第 2.6.4 节），靶是 $Z=c_0P_Z$：$\Hom_\Lambda(P_Z,P_Z)\to\Hom_\Lambda(P_Z,Z)$ 由 augmentation 诱导，在 $a\ge1$ 时上同调同构（标准截断论证：$P_Z\to Z$ 是 $P_Z$ 的余核塔，$\Hom(P_Z,P_Z)\to\Hom(P_Z,Z)$ 的核是同伦/过 $P_Z$ 投射分解项，后者对全循环源的上同调无贡献）。论文一句收掉："Finally, apply Lemma~\ref{h:comparison} to the totally acyclic complex $P_Z$ to identify this cohomology with $H^a\Hom_\Lambda(P_Z,Z)$."

**(c) 机械理由与 Remark（$a=-1$ 不消失）**：
```latex
\begin{remark}\label{t:neighboring-degrees}
The boundary degrees can also be located completely.
Equation~\eqref{t:fiber-hom} gives
$\mathcal V^{-1}=(\cH^{-1})^2=k^2$.
By Proposition~\ref{e:twists}, the two rows of $\Delta^{-1}$ are
$(H_i^2,1)$, so this map is invertible.  Since $\Delta^{-2}:0\to k$
and $\ker\Delta^0=k$, \eqref{t:end-cohomology} yields
\[
 H^a\End_\Lambda^\bullet(P_Z)=
 \begin{cases}
 k,&a=-1,0,\\
 0,&a\notin\{-1,0\}.
 \end{cases}
\]
In particular the nonzero cokernel of $\Delta^{-2}$ contributes in
degree $-1$, while degree $-2$ vanishes as required by
Proposition~\ref{tr:transfer}.
\end{remark}
```
逐步：$\mathcal V^{-1}$：(t:fiber-hom) 在 $a=-1$ 段 $W^{-2}\to\mathcal V^{-1}\to(\mathcal H^{-1})^2\to W^{-1}$，$W^{-2}=W^{-1}=0$（$W$ 支撑 $\{-3,0\}$）⇒ $\mathcal V^{-1}\cong(\mathcal H^{-1})^2=k^2$（$\mathcal H^{-1}$：$-1=-3\cdot0-1$，$m=0$ 端，$\mathcal P_0$ 的对偶 $D\mathcal P_0=k$）。$\Delta^{-1}$ 两行 $(H_i^2,1)$：负端权重 $H_i^{m+2}$ 在 $m=0$ 即 $H_i^2$；$H_1^2\ne H_2^2$（代数独立）⇒ 可逆。于是全廓形：$H^{-1}\End\cong\coker\Delta^{-2}=k/\operatorname{im}(0)=k$（$\Delta^{-2}$ 的单射是"从 0 出发"，余核非零），$H^0\End\cong\ker\Delta^0=\{(c,d):c+d=0\}=k(1,1)\cong k$。**要点**：$\Delta^{-2}$ 若也满（即被"加强"成同构），$H^{-1}$ 会死——但 tr:transfer 只需要 $-2$，$-1$ 处非零恰好无害（对应 $\Ext^0$ 项，本就不该消失）。Remark 把"设计边界"点透：$a=-2$ 是**必须**消失的最低负度（$-a-1=1$ 端点），$a=-1$ 是**允许**非零的最高负度。

**(d) [推测] 候选失败路线**：
1. [推测] 非特征 2：第 2 步重标与第 4 步连接映射各带符号，$H^a\mathcal C=\mathcal V^{a-1}$ 的识别要引入符号修正同构，且 (t:delta) 的 $+$ 变 $\pm$，矩阵行列式条件改变（$H_1^{-m}-(-1)^?(H_2^{-m})$ 型）——不能保证对**所有** $m$ 非零。特征 2 是把三个符号节点同时焊死的开关。
2. [推测] 若把 (t:end-sequence) 的积改成直和：无界 $P$ 的 $\Hom^\bullet(P,E)$ 上同调在直和下会多出"极限项"（$\varprojlim^1$ 型病理），h:comparison 失效，对角块上同调不再是 $(\mathcal H^a)^2$。论文特意声明不换。
3. [推测] $\Delta^{-2}$ 的单射性其实是空话（源为 0）；真正的承重墙是 $\mathcal H^{-2}=0$（来自 e:all-degrees 负端支撑 $-3m-1$ 不含 $-2$）与 $W^{-3}=k$ 恰好一维——若 $\mathcal H^{-2}\ne0$，$\ker\Delta^{-2}$ 出现非零，$H^{-2}\End$ 非零，$\Ext_A^1(M,M)\ne0$，一阶就露馅。

### 2.6.6 反例完成（Proof of Theorem thm:main）

**(a) 收尾（TeX 原文）**：
```latex
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Fix the finite bimodule maps in \eqref{t:fiber}, the complete
resolution $P$, and the lifted map used in \eqref{t:cone}.
These choices exist over $k$ by the preceding propositions.
The algebra $\Lambda$ in \eqref{t:triangular-algebra} and its module
$Z$ in \eqref{t:explicit-module} are finite-dimensional.
By Lemma~\ref{t:finite-module}, $Z$ is nonprojective and has the
totally acyclic resolution $P_Z$.
Proposition~\ref{t:vanishing} supplies both hypotheses on its
complete self-Hom groups in Proposition~\ref{tr:transfer}.
Apply that proposition with $R=\Lambda$ to obtain
\[
 A=\Lambda\ltimes D\Lambda,
 \qquad M=A\otimes_\Lambda Z.
\]
It proves that $A$ is finite-dimensional and symmetric, that $M$
is finite-dimensional and nonprojective, and that
$\Ext_A^i(M,M)=0$ for every $i>0$.  These are all the assertions of
Theorem~\ref{thm:main}.
\end{proof}
```

**(b) 机制**：把第 3 层输出 $(\Lambda,Z,P_Z)$ 插进第 4 层转移原理（2.2.2）：
- tr:transfer 假设逐条核对：$P:=P_Z$ 全循环且项有限投射（t:finite-module + 2.6.3 步 2 的保有限投射）；$Z=c_0P_Z$ 非投射（t:finite-module）；(tr:two-sided-vanishing) $H^a\Hom_\Lambda(P_Z,Z)=0$（t:vanishing）。
- 输出：$A=\Lambda\ltimes D\Lambda$ 对称（tr:trivial-symmetric，2.2.1），$M=A\otimes_\Lambda Z$ 有限、非投射（tr:transfer 第 5 步的商 $A\twoheadrightarrow\Lambda$ 论证），$\Ext_A^i(M,M)=0$（$i>0$；tr:transfer 第 4 步：$\Ext_\Lambda^i(Z,Z)$ 用正度数列 + $\Ext_\Lambda^i(Z,D\Lambda\otimes_\Lambda Z)$ 用负端对偶 $H^{-i-1}\Hom(P_Z,Z)$，$-i-1\le-2$）。
- 域上无扩张：所有选择（$g_i$、$Q,\pi$、$P$、$\widetilde v$）"exist over $k$"——2.5.5 末段说的"Hom 空间、对偶、选取都在 $k$ 上"在此兑现。
- **主定理的 $k$ 恰为 $\mathbb F_2(q,H_1,H_2)$**：全部引理只用到 $q\ne0$、$1+q^n\ne0$、$H_i\ne0$、$H_1^u\ne H_2^u$（$u$ 遍正整数）这几族不等式，代数独立参数在 $\mathbb F_2$ 上有理函数域里同时供给它们（1.3 末注 [推测] 的参数账目）。

**(c) 机械理由**："Fix …" 一句回应选择公理式的担忧：$g_i$、$P$、$\widetilde v$ 都是存在性命题的见证，主定理是"取定见证后构造"；由于每条存在性都在 $k$ 上，$A,M$ 是 $k$ 上显式有限维对象（论文图 proof-architecture 下方一句强调："All bimodule representatives, kernels, and cokernels used to define the final algebra and module are finite-dimensional over the stated field. Infinite complexes serve to prove their properties."——无限复形只进证明不进定义，这是整个构造"有限性"的总账）。

**(d) [推测] 候选失败路线**：
1. [推测] 若第 2 层只给"模块映射 $X\to YX$ 非零"而无双模提升 $g_H$（2.5 的迹障碍失败），则 (t:fiber) 无从谈起：纤维 $F$ 是全链条里唯一不可省的双模件。intro 原文已把这点写成方法论："a module map $X\to Y\otimes_EX$ alone does not supply a bimodule fiber."
2. [推测] 若把 $A=\Lambda\ltimes D\Lambda$ 换成任意其它对称扩张（如二次平凡扩张 $\ltimes D^2$），tr:transfer 的两部分分解 $\Ext(M,M)=\Ext(Z,Z)\oplus\Ext(Z,\nu Z)$ 变三项以上，负端对偶需要更深的消失范围，参数廓形（只到 $-3m-1$）不够用。
3. [推测] $Z$ 非投射的论证若断裂（例如 $X$ 其实在 $E$ 上投射——需要 $\Ext_E^3(X,X)\ne0$ 兜底），tr:transfer 只给"平凡结论"$M=0$ 型的坍塌：反例性质（非投射）是链条最末端唯一"非齐次"环节。

**Lean 对应（本小节全程）**：装配线在链条末五模块 `Delta.lean → Triangular.lean → Cone.lean → DownHom.lean → Counterexample.lean`。纤维=F `Delta.concreteF = Enveloping.fiber (finiteU H₁) (finiteU H₂) (Y) (normalizedMap H₁) (normalizedMap H₂)`（`Delta.lean:205`），side-projective 由 `concreteF_side_projective`（`Delta.lean:209`，逐侧调 `Enveloping.fiber_left_projective/fiber_right_projective`——即 (t:fiber) "分裂两侧"的机器化）；$v_0$ 的规格化为 `Delta.wZero`/`WZeroEquiv`（`Delta.lean:41-44`：$W^0\cong k$，$w=\text{preimage of }1$）；求值正合三件套 `concrete_evaluated_injective/exact/surjective`（`Delta.lean:236-262`，即 (t:fiber-hom) 存在的机器证明，经 `Enveloping.evalMap_injective` 等）。$\Lambda$=`Triangular.Alg`，列函子 `D₀Complex/D₁Complex`（`Triangular.lean:721-723`），$V$=`crossMap F u`（`Triangular.lean:783`，$u$ 即 `concreteLift = Enveloping.tensorCompleteLift`，把稳定类 $v_0$ 提升成链映射 $P\to F\otimes_EP$ 的机器），锥 `Cone.cone = CompleteCone.complex (crossMap F u)`（`Cone.lean:477`）。全循环：`Cone.D₀_totallyAcyclic/D₁_totallyAcyclic/cone_totallyAcyclic`（`Cone.lean:541/564/639`，对应 2.6.4 步 1–2）。$Z$=`CokerAt cone 0`，有限：`DownHom.coker_finite`；非投射：`Counterexample.lean:253` `sourceConeModule_nonprojective`——机制是 `Triangular.cone_id_boundary`（`Counterexample.lean:171-179`：若 $Z$ 投射则 $\mathbb 1_{P_Z}$ 在 $\operatorname{Cochain}$ 意义下是边界，沿"下块投影 `low` → $\mathsf D_0$ 对角 → 拉回 $P$" 三级传导 `down₀_boundary/down_identity`）把恒等推回 $P$，再由 `DownHom.projective_of_id_boundary` + `coker_factors_of_nullhomotopic` 得 $X$ 投射，`X_nonprojective` 矛盾——这正是 2.6.4 步 4 上分量函子论证的"恒等映射边界化"改写。消失廓形：`Counterexample.lean:46` `sourceCone_closed_boundary`（每个 $a>0$ 或 $a\le-2$ 的闭上循环是边界）经 `Cone.boundary_of_delta`（`Cone.lean:416`，对应 (t:end-cohomology)：$\coker\Delta^{a-1}$ 与 $\ker\Delta^a$ 双零挤死 $H^a$），输入是 `DownHom.actionDelta_injective/actionDelta_surjective`（`Cone.lean:688/708`）+ `Delta.sourceDelta_vanishing_ranges`（`Delta.lean:1102`：单射 $\Delta^a$、满射 $\Delta^{a-1}$，边界案 `delta_minusTwo_injective`/`delta_zero_surjective` 分岔）。最后 `transfer_of_completeHom_vanishing`（`Counterexample.lean:215`）调 `Nakayama.transfer`（tr:transfer）收尾，`main_theorem := counterexampleOf …`（`Counterexample.lean:293`）。

## 2.7 内射代数后果（论文 §8 "The endomorphism algebra and homological consequences"，`consequences.tex`）

> 本节把 $(A,M)$ 从"模的反例"升级为"代数的反例"。总纲一句（原文）："The symmetric pair constructed in Theorem~\ref{thm:main} has a self-orthogonal generator $A\oplus M$. The classical relation between such generators and dominant dimension turns the module counterexample into an algebra whose entire regular injective resolution is projective. We first isolate this step, then extract the modules in Corollaries~\ref{cor:homological} and~\ref{cor:finitistic}."

### 2.7.1 端代数命题（Proposition prop:endomorphism）——孤立的核心一步

**(a) 陈述（TeX 原文）**：
```latex
\begin{proposition}\label{prop:endomorphism}
Let $B$ be a finite-dimensional symmetric algebra over a field and let
$N$ be a finite-dimensional nonprojective left $B$-module satisfying
$\Ext_B^i(N,N)=0$ for all $i>0$. Put
\[
 G=B\oplus N,\qquad \Gamma=\End_B(G)^{\mathrm{op}},
\]
where endomorphisms compose in the ordinary order. Then
\[
 \domdim({}_\Gamma\Gamma)=\infty,
 \qquad \idim_\Gamma\Gamma=\infty.
\]
In particular, $\Gamma$ is not self-injective.
\end{proposition}
```

**(b) 证明机制，逐步**：

*第 1 步：$G$ 是 generator-cogenerator，且 $\Ext_B^i(G,G)=0$（$i>0$）。*
- generator：$G$ 含直和项 $B$（正则模），任何模都是自由的直加项、自由是 $B$ 的和——generator 定义满足。
- cogenerator：内射余生成元是 $DB$；$B$ 对称 ⇒ $DB\cong B$ 作为左模 ⇒ $DB\in\add B\subseteq\add G$。
- $\Ext_B^i(G,G)$ 的 $2\times2$ 分块逐项消失：$(N,N)$ 块=假设；$(B,N)$ 块：第一变元 $B$ 投射 ⇒ $\Ext^i(B,-)=0$；$(B,B)$ 块同理；$(N,B)$ 块：第二变元 $B$ 内射（对称 ⇒ 投射=内射）⇒ $\Ext^i(-,B)=0$。**四个块三个靠 $B$ 的双重身份（投射+内射），一个靠假设**——这就是"自内射/对称"背景在所有分量的出现方式。

*第 2 步：Mueller 判据 ⇒ $\domdim=\infty$。*
Mueller 1968 Lemma 3：对 generator-cogenerator $G$，$\Ext_B^i(G,G)=0$（$1\le i\le n$）当且仅当 $\domdim\End_B(G)\ge n+2$。机制（标准双复形论证，论文引用未重证）：内射消解 $0\to\Gamma\to I^\bullet$ 的逐项与 $\add G$ 中的消解 $0\to G\to X^\bullet$ 通过 $\Hom_B(G,-)$ 对应；$I^j$ 投射 $\Leftrightarrow$ 消解在第 $j$ 步能选在 $\add G$ 里 $\Leftrightarrow$ $\Ext^{j+1}$ 消失。索引位移 $+2$ 的来源：第 0 步 $I^0$ 投射要求 $\Ext^1(G,G)=0$，故 $n$ 阶消失给 $n+2$ 维主导。
由于消失对**一切** $i>0$ 成立，判据对一切 $n$ 启动 ⇒ $\domdim({}_\Gamma\Gamma)=\infty$。
Mueller Theorem 4：左右主导维数相等 ⇒ 定义 $\Gamma$ 时取 $\mathrm{op}$（"where endomorphisms compose in the ordinary order"——论文坚持左模约定，端代数环的乘法方向靠 op 修正）无影响。

*第 3 步：$\Gamma$ 非自内射（直接验证，不依赖判据反向）。*
记 $H=\Hom_B(G,-):\add G\to\Gamma\text{-}\mathrm{proj}$。
1. $H$ 全忠实：对有限和 $G^r$，$\Hom_B(G^r,V)\cong\Hom_\Gamma(\Gamma^r,HV)$ 是伴随恒等；对直加项（和的直加项），全忠实测度：若 $f:X\to Y$（$X,Y\in\add G$）在 $H$ 下来自 $\Gamma$-映射，则该 $\Gamma$-映射由 $Hf$ 唯一决定，且 $H$ 的像落在 proj 上（$HG=\Gamma$）。显式：$e\in\End_B(G)$，$h:G\to V$，$e^{\mathrm{op}}h=h\circ e$——op 约定让 $\Gamma$-线性性与复合方向吻合。
2. $H(G)=\Gamma$：$\Hom_B(G,G)=\Gamma^{\mathrm{op}}$……左正则 $\Gamma$-模结构是"预复合"，恰由 $H$ 的实现给出。
3. 反设 $\Gamma$ 内射：$H(N)$ 是其直加项（$N\in\add G$，$H$ 保直加项）故内射。取 $N$ 的有限内射包 $N\hookrightarrow J$：$J\in\add B$（内射模都是 $DB\cong B$ 的和，$B$ 有限维 ⇒ $J$ 有限 ⇒ 有限和）$\subseteq\add G$。$H$ 左正合 ⇒ 单射 $H(N)\hookrightarrow H(J)$；$H(N)$ 内射 ⇒ 分裂，有收缩 $H(J)\to H(N)$；$H$ 全忠实 ⇒ 该收缩来自 $J\to N$，且它是原包含 $N\hookrightarrow J$ 的收缩（自然性）。⇒ $N$ 是内射模 $J$ 的直加项 ⇒ $N$ 内射 ⇒ $N$ 投射（$B$ 对称）——与假设矛盾。
（注意链条上每一环：内射包存在用有限维；"内射⇒投射"用对称；"分裂回推"用全忠实。）

*第 4 步：$\idim_\Gamma\Gamma=\infty$。*
$\domdim=\infty$ ⇒ 极小内射消解 $0\to\Gamma\to I^0\to I^1\to\cdots$ 每项 $I^j$ 投射（定义即如此）。若 $\idim=d<\infty$：消解在第 $d$ 步后为零，即有短正合塔拼出的长正合列 $0\to\Gamma\to I^0\to\cdots\to I^d\to0$，项项投射-内射。$d>0$ 时末端满射 $I^{d-1}\twoheadrightarrow I^d$ 分裂（$I^d$ 投射），核投射；逐步回推（每个 $\ker=I^{j}\!\downarrow$ 图像是投射）至第一包含 $\Gamma\hookrightarrow I^0$ 分裂 ⇒ $\Gamma$ 是 $I^0$ 直加项 ⇒ $\Gamma$ 内射，与第 3 步矛盾。$d=0$：$\Gamma=I^0$ 直接内射，同矛盾。⇒ $\idim=\infty$。
**"In particular, $\Gamma$ is not self-injective"**：自内射 ⇒ $\idim=0$。

**(c) 假设的机械理由**：
- "对称"而非仅"自内射"：cogenerator（$DB\in\add B$）与第 3 步"内射⇒投射"两处都用了 $B\cong DB$（作为双模的同构给出左模同构）。自内射情形 $DB\cong{}_\sigma B$（扭曲），第 3 步需要 $\sigma$-扭曲版本，论文直接用对称回避——这正是主定理把反例做在**对称**类的红利。
- "有限维"三处用：内射包有限、$I^j$ 逐项有限、直加项论证在 Krull-Schmidt 世界干净。
- "非投射 $N$"：第 3 步矛盾的靶。若 $N$ 投射，$\Gamma$ 是矩阵代数族，自内射，一切平凡。
- "$\Ext^i(N,N)=0$ 对**全部** $i>0$"：判据要对一切 $n$ 启动。若只消失到 $i\le n_0$，结论弱化为 $\domdim\ge n_0+2$ 有限——给不了反例。

**(d) [推测] 候选失败路线**：
1. [推测] 若只有 $\Ext^1(N,N)=0$（Böhmler–Marczinzik 式部分消失），Mueller 判据只给 $\domdim\ge3$；$\Gamma$ 可能仍自内射。整个"升级机器"对"全部正度数"是刚性的。
2. [推测] 第 3 步若把 $H(N)$ 内射的假设换成 "$\Gamma$ 是 quasi-Frobenius"：需要 $\Gamma$-内射的投射性论证不可用，分裂回推断链。
3. [推测] 用 Tachikawa–Nakayama 对应（intro 引 `ChenXi2025TAMS` p.7288）替代 Mueller 直接走 $(A,M)$ 对的定理化形式也行，但论文选择自含地重证（"constructs the modules $S$ and $W$ directly"），把独立性最大化。

### 2.7.2 Corollary cor:homological 的逐条证明

**(a)** 陈述见 1.4（三断言 + 五否定）。证明分三段：基变换保假设、应用 prop:endomorphism、三个模块 $(J,S,W)$ 的构造。

**(b) 机制，逐步**：

*第 1 段：一切在扩域 $K/k$ 上存活。*
1. 对称结构：自然同构 $K\otimes_kDA\cong D_K(K\otimes_kA)$（用有限维：$D=\Hom_k(-,k)$ 与 $\otimes$ 交换对偶是 $(K\otimes\Hom_k(V,k))\cong\Hom_K(K\otimes V,K)$，有限基上按基展开逐坐标验证）。$A\cong DA$ 经它变成 $A_K\cong D_KA_K$ 的 $A_K$-双模同构 ⇒ $A_K$ 对称。
2. Ext 基变换（c:basechange）：$U$ 用**有限**投射消解 $P_\bullet$；逐度 $K\otimes\Hom_A(P_i,V)\cong\Hom_{A_K}(K\otimes P_i,K\otimes V)$（有限自由先验证、直加项传递）；平坦性（域的扩张是平坦）保核与像 ⇒ 上同调交换：$K\otimes\Ext_A^i(U,V)\cong\Ext_{A_K}^i(K\otimes U,K\otimes V)$（$i\ge0$，**含 $i=0$**——$i=0$ 时即 $\Hom$ 基变换，后文用来识别 $\Gamma_K$）。⇒ $M_K$ 自正交。
3. 非投射性：取有限投射满射 $P\twoheadrightarrow M$，核 $L$；其扩张类 $e\in\Ext_A^1(M,L)$ 非零（否则 $M$ 是 $P$ 直加项投射）。$K\otimes e$ 在 (c:basechange) 下像到 $\Ext_{A_K}^1(M_K,L_K)$：**基域扩张是忠实平坦** ⇒ $K\otimes e\ne0$ ⇒ 扩张后的满射不分裂 ⇒ $M_K$ 非投射。
4. $\Gamma_K\cong K\otimes_k\End_A(A\oplus M)^{\mathrm{op}}$：$i=0$ 的 (c:basechange) 与复合相容（论文："The degree-zero case of (c:basechange) is compatible with composition"）⇒ $\End_{A_K}(A_K\oplus M_K)\cong K\otimes\End_A(A\oplus M)$，op 与 $K\otimes-$ 交换。
5. 论文注明这些是"the same finite Ext and nonprojectivity base-change arguments used in the companion [OpenAIAR2026, Proposition 9.2]"——姊妹篇复用件。

*第 2 段：断言 (1) 与两个否定。*
对 $B=A_K,N=M_K$ 套 prop:endomorphism：每项 $I^j$ 投射且 $\idim\Gamma=\infty$。
- **经典 Nakayama 猜想**（domdim$\infty$ ⇒ 自内射）被断言 (1) 直接否定。
- **Auslander–Gorenstein 猜想**（$\pd I^j\le j\ \forall j$ ⇒ 双侧自单射维数有限）：这里 $\pd_\Gamma I^j=0\le j$ 恒成立（$I^j$ 投射），而左自单射维数 $=\idim\Gamma=\infty$。否定。注意 Gorenstein 需要**双侧**，此处单边无限已足够反。

*第 3 段：$J$ 与广义 Nakayama；$S$ 与强 Nakayama。*
1. **非投射 indecomposable 内射 $J$ 的存在**（计数论证）：有限维代数 indecomposable 投射类与 indecomposable 内射类同为"单模个数"那么多，且 $\add$-类一一对应（$P\mapsto DP$ 型）。若每个 indecomposable 内射都投射，则它们穷尽 indecomposable 投射类，正则模 $\Gamma$（投射模的和）的 indecomposable 分解全内射 ⇒ $\Gamma$ 内射，contradiction prop:endomorphism。
2. 每个 $I^j$ 投射 ⇒ 不含 $J$ 直加项（投射模的直加项投射，$J$ 非投射）。⇒ 存在 indecomposable 内射不出现在 $\Gamma$ 的内射消解中——**广义 Nakayama 猜想**（每个 indecomposable 内射都出现在某 $I^j$）的"省略内射"形态失败。
3. **$S=\soc J$**：indecomposable 内射的 socle 单（有限维标准事实：$\soc J$ 是 $J/\rad\Gamma$-作用的最大半简单子模，indecomposable ⇒ 单），$J$ 是 $S$ 的内射包。反设存在非零 $f:S\to I^j$：$S$ 单 ⇒ $\ker f=0$（$f$ 单）；$I^j$ 内射 ⇒ $f$ 沿本原扩张 $S\hookrightarrow J$ 扩张为 $\bar f:J\to I^j$；$\bar f$ 仍单（$S$ 在 $J$ 中**本质**，$\ker\bar f\cap S=0\Rightarrow\ker\bar f=0$）；$J$ 内射 ⇒ 单射 $\bar f$ 分裂 ⇒ $J$ 是 $I^j$ 直加项，与第 2 点矛盾。⇒ $\Hom_\Gamma(S,I^j)=0\ \forall j\ge0$。
4. 对消解 $0\to\Gamma\to I^0\to I^1\to\cdots$ 施 $\Hom_\Gamma(S,-)$：所得复形**每项为零**，故一切上同调为零：$\Ext_\Gamma^i(S,\Gamma)=0$（$i\ge0$，**含 $i=0$**——$\Hom(S,\Gamma)=0$ 也在结论里，论文明说 "the degree-zero vanishing is part of the conclusion"）。$S\ne0$ 有限 ⇒ **强 Nakayama 猜想**（$\Ext^i(V,\Gamma)=0\ \forall i\ge0\Rightarrow V=0$）否定；同时给出广义 Nakayama 的"单模 Ext 全部消失"表述失败（断言 (2)）。

*第 4 段：$W$ 与 Wakamatsu。*
1. $W:=\bigoplus_{[\text{indecomposable 投射-内射类}]}$：类有限（有限维）⇒ $W$ 有限、投射、内射。投射 ⇒ $\Ext^i(W,W)=0$（$i>0$）。每个 $I^j$（投射-内射）属于 $\add W$（它的 indecomposable 分解项都是投射-内射类，$W$ 每类取了一个代表）。
2. 消解 $0\to\Gamma\to I^0\to I^1\to\cdots$ 是无限 $\add W$-余消解；$\Hom_\Gamma(-,W)$ 保正合因为 $W$ **内射**（对正合列 $\cdots\to I^1\to I^0\to\Gamma\to0$ 反向施 Hom(–,W)：内射变正合）。⇒ $W$ 是 **Wakamatsu tilting**（定义见 1.4/introduction：自正交 + 保正合的无限 $\add W$-余消解），且 $\pd W=0$ 有限。
3. 若 $W$ 还 tilting：存在**有限** $\add W$-余消解 $0\to\Gamma\to W^0\to\cdots\to W^r\to0$。每项 $W^j$ 投射-内射。复现 prop:endomorphism 第 4 步的回推分裂：末端 $W^{r-1}\twoheadrightarrow W^r$ 分裂（靶投射）⇒ 逐步回推 ⇒ $\Gamma\hookrightarrow W^0$ 分裂 ⇒ $\Gamma$ 内射，矛盾。⇒ $W$ 非 tilting。**Wakamatsu tilting 猜想**（pd 有限的 Wakamatsu tilting 模是 tilting）否定（断言 (3)）。
4. 收尾段（原文）强调逐 $K$ 独立性："The proof works separately over each extension $K/k$. It does not require a minimal injective resolution to remain minimal under scalar extension, or an indecomposable injective or simple module to remain indecomposable or simple. The construction of $\Gamma_K$ is compatible with scalar extension, and the required $J,S,W$ are chosen over $K$."——避开了"极小性/不可分解性是否随基改变保持"这种易错题。

**(c) 机械理由汇总**：$A_K$ 对称只在 prop:endomorphism 入口用一次；$M_K$ 非投射 + 自正交是入口假设；断言 (2)(3) 完全内生于"$\domdim\infty$ 且非自内射"这一对极小信息——第 3、4 段不再需要 $A,M$ 的任何细节。**五否定共享一台机器**是本节的设计主旨（intro："realizes five such failures using one endomorphism algebra and two associated modules"）。

**(d) [推测] 候选失败路线**：
1. [推测] 若 $\Gamma$ 的极小内射消解某项不投射（domdim 有限），$W$ 的 $\add W$-余消解构造与 $S$ 的 $\Hom(S,I^j)=0$ 全部失效——$J$ 可能住进某 $I^j$。
2. [推测] 强 Nakayama 的 $S$ 论证里若把"本原扩张"换成任意包含 $S\hookminus X$：$J$ 的内射性只对本原扩张给唯一扩张映射，非本原情形 $\bar f$ 可能不单。
3. [推测] 若用大模范畴（不限有限维）陈述 Wakamatsu 猜想：$W$ 的"每类取一个代表"仍有限（类有限），失败论证不变；真正的界外是 tilting 补定理只对几乎完全 tilting 的**有限**补成立——论文全部留在有限维。

### 2.7.3 Corollary cor:finitistic：逐度数造 $C_n$

**(a)** 陈述见 1.4：对每个 $n\ge1$ 存在有限左 $\Gamma_K$-模 $C_n$ 使 $\pd C_n=n$，小/大左 finitistic 维数皆无穷。

**(b) 机制，逐步**：
1. **原料**：同一极小内射消解 $0\to{}_\Gamma\Gamma\to I^0\to I^1\to\cdots$（每项有限、投射-内射）。定义 $C_0={}_\Gamma\Gamma$，$C_n=\im(I^{n-1}\to I^n)$（$n\ge1$）。正合性给短正合塔
$$0\to C_n\to I^n\to C_{n+1}\to0\quad(n\ge0).$$
有限性：$C_n$ 是有限模 $I^{n-1}$ 的像、有限模的子模。
2. **基例 $\pd C_1=1$**：$C_0=\Gamma$ 与 $I^0$ 投射 ⇒ $0\to C_1\to I^0\to C_2\to0$ 中 $\pd C_1\le1$？注意用 $n=0$ 序列 $0\to C_0\to I^0\to C_1\to0$：两个投射 ⇒ $\pd C_1\le1$（horseshoe：投射消解拼两期）。若 $\pd C_1=0$：$C_1$ 投射 ⇒ $I^0\twoheadrightarrow C_1$ 分裂 ⇒ $C_0=\Gamma\cong\ker$ 是 $I^0$ 直加项 ⇒ $\Gamma$ 内射（$I^0$ 内射的子…）——准确说 $\Gamma$ 作为内射模直加项内射，contradiction $\idim\Gamma=\infty$。故 $\pd C_1=1$。
3. **归纳步**：设 $n\ge1$，$\pd C_n=n$。
   - 上界：把 $C_n$ 的长 $n$ 投射消解与 $0\to C_n\to I^n\to C_{n+1}\to0$ 拼接（$I^n$ 投射）⇒ 长 $n+1$ 投射消解 ⇒ $\pd C_{n+1}\le n+1$。
   - Ext 移位：对 $0\to C_n\to I^n\to C_{n+1}\to0$ 施 $\Hom_\Gamma(-,V)$ 长正合列；$I^n$ 投射 ⇒ $\Ext^j(I^n,V)=0$（$j\ge1$）⇒ 边缘同构 $\Ext_\Gamma^j(C_n,V)\cong\Ext_\Gamma^{j+1}(C_{n+1},V)$（$j\ge1$）。
   - 下界：$\pd C_n=n$ ⇒ 存在 $V$ 使 $\Ext^n(C_n,V)\ne0$（投射维数的 Ext 判据：若所有 $V$ 处 $\Ext^n=0$ 则 $\pd\le n-1$）。移位给 $\Ext^{n+1}(C_{n+1},V)\ne0$ ⇒ $\pd C_{n+1}\ge n+1$。
   ⇒ $\pd C_{n+1}=n+1$。
4. 全体 $C_n$ 有限、$\pd$ 恰 $n$ ⇒ 小左 finitistic 维数（有限维模的有限 pd 的上确界）$=\infty$；大左 finitistic（允许所有模）$\ge$ 小，同无穷。
5. 与姊妹篇定位：这是"an independent characteristic-two example alongside the complex algebra of [OpenAIFinitistic2026, Theorem 1.1]"（intro 原句；1.4 已录）。

**(c) 机械理由**：Ext 移位要求 $j\ge1$（$j=0$ 时 $\Hom$ 段有 $\Hom(I^n,V)$ 干扰）；基例只用一次分裂论证，与 prop:endomorphism 第 4 步同型——回推分裂是本节反复使用的"局部 lemma"。$V$ 不限有限模（Ext 判据在大模范畴成立），但 $C_n$ 保持有限。

**(d) [推测] 候选失败路线**：
1. [推测] 若消解某步 $I^m$ 不投射：短正合塔的 $\le$ 方向断，$\pd C_{n+1}\le n+1$ 失效，只得上界失控（可能无穷），"精确 $n$"结论碎。
2. [推测] 若 $\Gamma$ 自单射维数有限（比如经典 Nakayama 成立的世界），同样的塔给出 $\Ext$ 移位在某步撞墙——此处正是猜想成立方向的镜像。
3. [推测] 用 cosyzygy 塔造 $D(C_n)$ 走右模版本需要同款双侧账目；论文明确只断言**左** finitistic——右版本 [论文未述]。

### 2.7.4 Corollary cor:tilting-complements 与 cor:stratifying（两件外援）

**(a) tilting 补**：陈述见 1.4。证明机制（全文一段）：
1. 由 cor:homological，$\Gamma$ 违反广义 Nakayama。
2. Buan–Solberg 1998 Theorem 3.1 + 3.4：广义 Nakayama 失败 ⇒ 存在内射的几乎完全 **co**tilting 左 $\Gamma$-模 $U$，有无穷多两两不同构的不可分补 $X$（补：$U\oplus X$ cotilting）。
3. 精确对偶 $D_K=\Hom_K(-,K)$：有限左 $\Gamma$-模 → 有限左 $\Gamma^{\mathrm{op}}$-模；有限内射维数 ↔ 有限投射维数；自正交保持（$\Ext$ 对偶）；cotilting 余消解条件（对内射余生成元的 $\add U$-消解）对偶成 tilting  coresolution 条件（对正则模的 $\add D_KU$-余消解）。⇒ $P_K=D_KU$ 是投射的几乎完全 tilting $\Gamma^{\mathrm{op}}$-模，$D_KX$ 是它的无穷多不可分补。
4. 几乎完全 tilting/不可分补的定义在正文给出（"A finite left module $P$...is \emph{almost complete tilting} if it is a direct summand of a tilting module and has one fewer isomorphism class of indecomposable summands than there are isomorphism classes of simple left $\Lambda$-modules"）。
intro 补注：该联系（广义 Nakayama 失败 ⇔ 补不唯一）的独立证明 Happel–Unger 亦有（"Their introduction credits an independent proof of this connection to Happel and Unger"）。

**(b) 幂等分层**：陈述见 1.4。机制：
1. 基变换给对称 $A_K$ + 非投射自正交 $M_K$。取 $M_K$ 在某**块** $B$ 中的非投射不可分直加项 $N$：块分解 $A_K=\prod B$ 使 $\Ext^i_{A_K}(M_K,M_K)=\bigoplus_{\text{块}}\Ext^i_B(\text{分量},\text{分量})$，非零块里取 $N$；$B$ 不可分且对称（对称代数的直积因子仍对称：$DA\cong A$ 按块分量），$\Ext^i_B(N,N)=0$（$i>0$，作为整体 Ext 的直加项消失）。
2. Chen–Fang–Xi 2024 Theorem 5.13 证明中的构造：从任意域上这种"对称块 + 非投射自正交模"对造**约化镜反射代数** $T_n$，不可分且对称。
3. 同文 Corollary 5.12(1) + Definition 4.7：$T_n$ 有长度 $\ge n$ 的幂等分层（互相正交幂等 $e_0,\dots,e_n$ 和为 1，$f_i=e_0+\cdots+e_i$ 在 $f_{i+1}T_nf_{i+1}$ 中生成分层理想且 $e_{i+1}\notin T f_iT$）。分层理想定义（原文）：$RfR$ 分层 ⇔ 乘法诱导 $Re\otimes_{eRe}eR\xrightarrow{\sim}ReR$ 且 $\Tor_i^{eRe}(Re,eR)=0$（$i>0$）——它诱导 $R/ReR$、$D(R)$、$D(eRe)$ 的标准 recollement。
4. 同文 Theorem 1.2(2)：给出至少 $n$ 步非平凡标准 recollement 链。取 $n=L$。
**注意**：$T_L$ 是"auxiliary"（辅助代数），不是 $\Gamma_K$ 本身——分层结论的对象是另一族不可分对称代数。

**(c) 机械理由**：(b) 的第 1 步"块内归约"必要，因为 Chen–Fang–Xi 机器要求代数**不可分**；$N$ 非投射不可分保证输入非平凡。**[推测]** 论文没解释 $T_L$ 相对 $A_K,\Gamma_K$ 的维数规模（镜反射构造是迭代矩阵代数，维数随 $L$ 与 $\dim B$ 增长——具体界 [论文未述]）。

**(d) [推测] 候选失败路线**：
1. [推测] tilting 补：若 Buan–Solberg 定理要求代数自 socle 正同构之类额外条件——实际该文对任意有限维代数陈述（论文未加限定地引用）；风险在 cotilting→tilting 对偶中"$U$ 内射"映成"$P_K$ 投射"依赖 $D_K$ 对有限模的精确性，无限模即断。
2. [推测] 分层：若 $M_K$ 的所有块分量都投射（只有非零自 Ext 分布在跨块 Ext？不可能：$\Ext^i_{A_K}(M,M)=\bigoplus_{\text{块}}\Ext^i_B(M_B,M_B)$ 块对角），"非投射必在某块"依赖块分解对 Ext 的正合性——若只取 $A_K$ 的某个商而非直积块则不成立。构造选直积块是刚性的一步。
3. [推测] 两条推论都完全外包文献机器（Buan–Solberg、Chen–Fang–Xi），本节的自含内容仅 prop:endomorphism + 两个 Ext-移位论证；若外部定理的表述版本（左/右、有限/任意模）与本节用法有出入，反例声明需相应改写——论文特意先给"finite left-module forms"的全部定义以对齐版本。

**Lean 覆盖状态**：§8（2.7 全部内容）**未在** `OAI/RingTheory/Tachikawa` 中形式化——comparator 配置 `E:\math\lean\ComparatorChallenges\Tachikawa.json` 的 `theorem_names` 只有 `OAI.Tachikawa.main_theorem`（对应 thm:main）。31 个模块的依赖链终点 `Counterexample.lean:293` 也止于 `main_theorem`。故 cor:homological / cor:finitistic / cor:tilting-complements / cor:stratifying 四个推论处于"论文有证明、机器未验证"状态；`Nakayama.lean` 的名字对应 Nakayama **函子**（$\nu=DR\otimes_R-$，`def Nakayama := Module.Dual k (M →ₗ[R] R)` 带上作用，`Nakayama.lean:252`），与 Nakayama **猜想**无形式化关联（后者未形式化）。

---

# 三、叙事时间线：论文自述的动机与文献障碍

> 规则：本节所有英文双引号内文本为论文 TeX 源**逐字引用**（保留原文连字 `--`），并标注所在文件；任何论文没有说的事一律写"论文未述"，推测一律标 [推测]。

## 3.1 问题定位（`introduction.tex` 第 1 段）

论文开篇给出猜想与它在全家桶中的位置：

> "Tachikawa's second conjecture asserts that every finite-dimensional self-orthogonal module over a finite-dimensional self-injective algebra is projective.  This question belongs to the homological conjectures surrounding quasi-Frobenius algebras and dominant dimension; see Tachikawa's 1973 monograph~\cite[pp.~VI--VII]{Tachikawa1973} and the account of the conjecture in~\cite[p.~7288]{ChenXi2025TAMS}."

与 Auslander–Reiten 猜想的嵌套关系（这是"为什么一个反例否定两个猜想"的自述）：

> "The Auslander--Reiten conjecture, originating in \cite{AuslanderReiten1975}, asks for finite-dimensional algebras whether the condition $\Ext_A^i(M,M\oplus A)=0$ for every $i>0$ forces $M$ to be projective. For a self-injective algebra, the groups $\Ext_A^i(M,A)$ vanish automatically, so Tachikawa's second conjecture is its self-injective case."

以及结果落在最小仍非平凡的类（对称类）：

> "Write $D=\Hom_k(-,k)$. An algebra $A$ is \emph{symmetric} if $A\simeq DA$ as $A$-bimodules; in particular, a symmetric algebra is self-injective. We prove the following result in this class."

摘要（`paper.tex`）对全局的自述：

> "We disprove Tachikawa's second conjecture by constructing a finite-dimensional symmetric algebra over $k=\mathbb F_2(q,H_1,H_2)$ with a finite-dimensional nonprojective module whose self-extension groups vanish in every positive degree. The associated endomorphism algebra also gives counterexamples to the classical, generalized, and strong Nakayama conjectures, the Auslander--Gorenstein conjecture, and the Wakamatsu tilting conjecture. These conclusions persist after every extension of $k$."

## 3.2 文献障碍逐条（`introduction.tex` "Related results." 段，逐字）

**障碍 1：Schulz 的前例不在"域上有限维"框架内，但其机制是祖先。**
> "Schulz's earlier example of a nonprojective module without positive self-extensions uses an algebra over a skew field, outside the finite-dimensional-over-a-field setting considered here; see \cite{Schulz1994} and the distinction recalled in \cite[Introduction]{DiverisPurin2012}."
> "His quantum-exterior example has nonzero first self-extension but no higher self-extensions \cite[Example~7]{Schulz1995}; the parameter-shifting syzygies in that example are an antecedent for our starting algebra."

（"parameter-shifting syzygies"——参数平移合冲——被明确认领为十维代数 $C$ 的血统；见 2.3/2.4 的 $\ell_i=x+q^iy$ 链。）

**障碍 2：稳定骨架的形状被 Diveris–Purin 钉死。**
> "For symmetric Artin algebras, Diveris and Purin show that a component containing a nonprojective module with eventually vanishing self-extensions has stable part of type $\mathbb Z A_\infty$ \cite[Theorem~A]{DiverisPurin2014}."

（[推测] 这解释为何构造里稳定自同态环必须是多项式环 $k[\tau_1,\tau_2]$ 加 Tate 对偶尾巴——$\mathbb ZA_\infty$ 型 AR 量子片正是这种周期结构；论文未把这句话与构造显式挂钩。）

**障碍 3：Erdmann 分类封锁"根立方零"低维路线。**
> "Over an algebraically closed field, Erdmann classifies, up to Morita equivalence, the indecomposable weakly symmetric algebras with radical cube zero and nonzero radical square that admit such modules. The classification singles out quantum exterior and double Nakayama algebras with parameters that are not roots of unity~\cite[Theorem~1.1]{Erdmann2017}."

（[推测] 因此反例代数必须离开 $\rad^3=0$ 世界——$E=T\otimes T$ 的根立方非零；1.1 末尾已有同一判断，此处补引文出处。）

**障碍 4：条件性归约已把"对称情形"与分层理想绑定。**
> "Chen, Fang and Xi characterize the symmetric case through stratifying ideals and give conditional mirror-reflective constructions from gendo-symmetric counterexamples to the Nakayama conjecture \cite[Theorems~1.1 and~1.2]{ChenFangXi2024}."
> "Chen and Xi relate self-orthogonal Nakayama-stable generators over self-injective algebras to additional categorical and Gorenstein--Morita conditions~\cite[Theorem~1.2 and Corollary~1.4]{ChenXi2025TAMS}. Their further criterion assumes virtual Gorensteinness of the relevant endomorphism algebra~\cite[Theorem~1.3]{ChenXi2025VG}."

**障碍 5：一批"某类代数上成立"的正结果划出雷区。**
> "Zhang and Zhou prove the self-injective case for split algebras with radical cube zero~\cite[Corollary~4.2]{ZhangZhou2026} and subsequently treat Igusa--Todorov algebras~\cite[Theorem~3.2]{ZhangZhouIgusaTodorov2026}."
> "Xia proves the Auslander--Reiten conjecture for quantum complete intersections~\cite[Corollary~4.3]{Xia2026}."
> "In a different direction, B\"ohmler and Marczinzik construct a nonprojective module over a commutative local self-injective algebra whose first two self-extension groups vanish, while the third does not~\cite[Theorem~3.1 and the end of Section~3]{BohmlerMarczinzik2026}. Theorem~\ref{thm:main} establishes vanishing in every positive degree."

（最后半句是本文与"部分消失"例子的分界线自述。）

**障碍 6：Enomoto–Marczinzik 归约的目标类不对，且"泛化版本等价"意味着反例连锁。**
> "Enomoto and Marczinzik prove that Tachikawa's second conjecture for the two-fold trivial extension of an Artin algebra implies the Auslander--Reiten conjecture for that algebra~\cite[Theorem~3.5]{Enomoto2026}. This reduction has a self-injective target, not a symmetric target in general. Our construction obtains a symmetric algebra by establishing the additional complete-resolution vanishing needed for transfer to the ordinary trivial extension."
> "Enomoto and Marczinzik also prove an equivalence among the universal versions of the Auslander--Reiten, generalized Nakayama, Nakayama, and both Tachikawa conjectures over a fixed commutative Artinian coefficient ring~\cite[Theorem~1.1]{Enomoto2026}."

（第一段是关键方法论自述：**二次**平凡扩张路线只能把 AR 归约到 Tachikawa；要拿到**对称**反例，必须为**一次**平凡扩张补充"完全消解负度数消失"——这正是 tr:transfer 的 (tr:two-sided-vanishing) 在论文叙事中的由来位置。）

## 3.3 构造自述（`introduction.tex` "The construction." 段，逐字）

与姊妹篇的关系与差异：
> "The companion article~\cite{OpenAIAR2026} constructs an explicit eight-simple triangular counterexample. We use the same ten-dimensional starting algebra and related cone and triangular-module constructions, and reproduce the algebra, resolutions, and arguments needed here. The passage to a symmetric algebra requires vanishing in negative degrees of a complete self-extension complex as well as positive Ext vanishing."

两步论：
> "Two steps organize the proof.  First, Proposition~\ref{tr:transfer} gives a general transfer principle."
> "The negative tail computes the positive extensions into $D\Lambda\otimes_\Lambda Z$, with the precise index $-a-1$. This transfer principle applies to any finite-dimensional algebra and module satisfying its hypotheses."
> "Second, we construct the data required by this transfer."

双模纤维的必要性（本节最重要的"为什么"句）：
> "To combine two twists, we need the nonzero line $W^0$ to be reached by evaluating genuine bimodule maps $U_H\to Y$; a module map $X\to Y\otimes_E X$ alone does not supply a bimodule fiber."
> "A trace obstruction for a character map $B\to DB$, combined with symmetric duality, produces precisely these maps $g_H$, with nonzero evaluations in degree zero. The sparse Hom profile and these bimodule lifts are the two conclusions of Proposition~\ref{b:bimodule}."

收尾与三角化：
> "After normalizing the maps for $H_1,H_2$, their fiber has a finite bimodule representative $F$, obtained as an ordinary kernel after adjoining a projective summand. It comes with a stable map $v:X\to F\otimes_E X$. The two twists act by distinct scalars on each nonzero positive or negative homogeneous self-map space of $X$. These actions make the self-extension comparison invertible in the required degree ranges. Forming a cone over $\Lambda=\begin{pmatrix}E&0\\ F&E\end{pmatrix}$ produces the totally acyclic resolution of $Z$ with \eqref{intro:profile}; the boundary degrees $1$ and $-2$ are checked separately."

有限性总账：
> "All bimodule representatives, kernels, and cokernels used to define the final algebra and module are finite-dimensional over the stated field.  Infinite complexes serve to prove their properties."

后果层自述（`consequences.tex` 第 1 段）：
> "The symmetric pair constructed in Theorem~\ref{thm:main} has a self-orthogonal generator $A\oplus M$. The classical relation between such generators and dominant dimension turns the module counterexample into an algebra whose entire regular injective resolution is projective. We first isolate this step, then extract the modules in Corollaries~\ref{cor:homological} and~\ref{cor:finitistic}."

代数闭域版本与一条澄清（`introduction.tex`）：
> "Taking $K$ to be an algebraic closure of $k$ gives examples over an algebraically closed field of characteristic two. This field contains the displayed transcendental parameters; the assertion does not concern the algebraic closure of a finite field."

组织与约定（`introduction.tex` 末两段，逐字摘录）：
> "Section~\ref{sec:triangular} forms the triangular module, establishes the complete vanishing profile, and applies the transfer to prove Theorem~\ref{thm:main}. Section~\ref{sec:consequences} studies the associated endomorphism algebra and proves Corollaries~\ref{cor:homological} and~\ref{cor:finitistic}."
> "Since the field has characteristic two, signs in their differentials and comparison maps disappear."

## 3.4 "时间线"的诚实版本

论文是结果导向写法，**没有**给出研究时间线。可依据文本重建的顺序仅有构造依赖顺序（1.3 五层积木即论文 Figure `proof-architecture` 的箭头顺序，其 caption 原文）：
> "Constructions and implications in the proof. The complete self-Hom vanishing for $(\Lambda,Z)$ supplies the hypotheses for transfer to $(A,M)$. Arrows indicate proof stages, not algebra maps."

以下条目**论文未述**（一律不许脑补成事实）：
1. **$C$ 的乘法表从哪来**——`algebra.tex` 直接给出 10 个结构常数（$q,q^2,1+q$ 系数）的表，无发现过程、无"为何这 10 维"的论证；[推测] 它是 Schulz 量子外代数"参数平移合冲"的自注入化包装（论文只说 antecedent 一句，见 3.2 障碍 1）。
2. **degree-5 的 $\cI=(c_5K)[5]$ 为何选 5**——`bimodule.tex` 说"$N_0=c_5K$……Take $Y=N_4$"，任何大于消解长度的度数都行，论文未论证 5 是最小选择；[推测] 5 = 4+1 是 $E$ 作为 $B^e$-模投射维数 4 加一。
3. **计算实验/机器搜索**——全文（包括本素材通读的 8 个 section 与 paper.tex）没有任何"computer search / we found by / experiment"字样的段落。是否使用定理证明器/枚举辅助发现：**论文未述**。
4. **Lean 形式化**——论文正文零处提及形式化验证；`OAI` 作者署名与 Lean 仓库的对应关系只存在于外部元数据。论文与形式化的相互校验关系：**论文未述**。
5. **与姊妹篇 `OpenAIAR2026` 的分工/时间先后**——只说 companion 已存在并复用其代数；两篇写作顺序、审稿顺序：**论文未述**。
6. **最小性问题**——反例代数 $A$ 的维数（$2\dim\Lambda=2(800+\dim_kF)$，$\dim_kF$ 论文未显式算出）是否最小、是否可交换化/局部化：论文未述（Böhmler–Marczinzik 那条"交换局部"路线停在第三度不消失，暗示交换情形仍是公开问题，但本文未讨论）。
7. **致谢、资助、代码可得性**——paper.tex 无 acknowledgments 节，无代码仓库链接：论文未述。

[推测] 唯一的"内在时间线"证据链是技术依赖本身：tr:transfer（一般原理）必须先于三角化被想出（第 4 层是第 3 层的顾客）；而 $W^{-3}=k$ 的负端点（b:profile）必须先于 (t:boundary-fiber) 的 $\mathcal V^{-2}=k$——因为 $-2$ 端点消失全靠 $W^{-3}$ 一维支撑。[推测] 姊妹篇（八单例、非对称）先完成、本文在其代数骨架上"补负度数账目"的说法与 3.3 第一段引文相容，但没有文本证据。

---

# 四、Lean 取证：`E:\math\lean\OAI\RingTheory\Tachikawa\` 的 31 个模块

> 取证方法：只读源码文本（`import` 图、`def/lemma/theorem/abbrev/instance` 声明、证明脚注内的战术），不运行 `lake build`。统计口径：`wc -l`=28,942 行；`^def/^abbrev/^lemma/^theorem/^instance` 匹配共约 2,626 条声明；`sorry` 全目录 **0** 处；`classical` 出现 23 处、分布在 12 个文件。

## 4.1 总体拓扑：一条 31 节点的依赖单链

每个模块恰好 `import` **一个** Tachikawa 前驱（`Symmetry.lean` 只 import Mathlib），因此模块依赖图是一条严格的**线性链**（不是 DAG）。从根到梢：

```
Symmetry → StableDuality → CompleteResolution → Tensor → CompleteTensor
→ StableShift → Twisting → Coresolution → TwistHom → OuterTensor → OuterExt
→ Nakayama → Corner → Period → Socle → ReverseResolution → Bimodule
→ RightInduction → Coinduction → Induction → DerivedInduction → Perfect
→ DerivedDescent → FiniteCoinduction → StableLift → HomProfile → Delta
→ Triangular → Cone → DownHom → Counterexample
```

（入口 `Counterexample.lean:1` 只 import `Cone`，但 `Cone → DownHom → Triangular → Delta → …` 逐级传递把全部 31 个拉进来。文件名排序 ≠ 建设顺序。）取证含义 [推测]：单链结构与"论文一节接一节"的推进顺序高度一致（前段：稳定 Hom/对偶/完美分解基础设施；中段：$C,T,E$ 与扭转；后段：bar/纤维/锥/装配），像是增量构建而非自顶向下设计；也意味着**无法并行编译**、任何前驱改动会全链重检。

**挑战配置** `E:\math\lean\ComparatorChallenges\Tachikawa.json`：
```json
{
  "challenge_module": "ComparatorChallenges.Tachikawa",
  "solution_module": "OAI.RingTheory.Tachikawa.Counterexample",
  "theorem_names": ["OAI.Tachikawa.main_theorem"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false
}
```
挑战骨架 `ComparatorChallenges/Tachikawa.lean` 自带 `Counterexample : Prop` 定义（与解法侧 `Symmetry.lean:17` 逐字同构，`k := FractionRing (MvPolynomial (Fin 3) (ZMod 2))` 亦同）与
```lean
theorem main_theorem : Counterexample := by
  sorry
```
——**唯一 sorry 在题目文件里，是待解占位符，不是解法缺口**；解法目录 0 sorry。comparator 只点名 `OAI.Tachikawa.main_theorem`（`definition_names` 为空 ⇒ 连 `Counterexample` 的定义本身都不强制逐字一致，只强制命题可证且公理在许可集内）。`enable_nanoda: false` ⇒ 无外部数值/符号计算 oracle，全部结论是纯内核证明项。

**主定理壳**（`Counterexample.lean:293`）：
```lean
theorem main_theorem : Counterexample :=
  counterexampleOf SourceField.sourceAlgebra SourceField.sourceModule
    SourceField.sourceAlgebra_symmetric SourceField.sourceModule_nonprojective
    SourceField.sourceModule_ext
```
`Counterexample` 这个 Prop 把论文 thm:main 的"存在 $A,M$……"翻译成**类型存在量词**（`∃ (A : Type) (rA : Ring A), …`，`Symmetry.lean:17-31`）：$\Ext_A^i(M,M)=0$ 写成 `Subsingleton (CategoryTheory.Abelian.Ext (ModuleCat.of A M) (ModuleCat.of A M) n)`——**Ext 群是商类型，机器里说"为零"的正规形态是"至多一个元素"**；`counterexampleOf`（`Symmetry.lean:297`）处理 $0<n$ 与 `n+1` 的索引换算。`SymmetricOver`（`Symmetry.lean:12`）= 存在 $k$-线性同构 $e:A\to A^*$ 满足两条结合式（论文"$A\simeq DA$ 作为双模"的展开形式，通过 $e(ab)c=e(b(ca))=e(a(bc))$ 的写法规避双模范畴）。

## 4.2 模块 ↔ 论文 §2–§7 对照表

| # | 模块（行数≈字节/1k） | 主要声明 | 论文对应 |
|---|---|---|---|
| 1 | Symmetry (340) | `SymmetricOver`、`Counterexample`、`DualBimodule`（左右作用 instance）、`TrivialExtension := TrivSqZeroExt R (DualBimodule k R)`、`symmetrizingForm`、`counterexampleOf` | §1 主定理外壳 + tr:trivial-symmetric（2.2.1） |
| 2 | StableDuality (54) | `projectiveFactors`、`StableHom := (M →ₗ[R] N) ⧸ projectiveFactors`、`stableClass`、`stablePostcompose` | §2 约定：$\sHom$ 的定义（2.1 开头） |
| 3 | CompleteResolution (50) | `CokerAt`、`π/ι/descend`、`ComplexExact`、`TotallyAcyclic` | §2 定义层（同调指标余核 $c_jP$、全循环） |
| 4 | Tensor (91) | `BalancedTensor.T/relations/mk/lift` | §2 平衡张量基础（$LX$ 等） |
| 5 | CompleteTensor (86) | `nullhomotopic_of_coker_factors`、`coker_factors_of_nullhomotopic` | h:comparison 的"同伦 ⇔ 余核过投射分解"双向（2.1.1 核心） |
| 6 | StableShift (63) | `VectorSplit`（`Z/inc/retract/boundary/H/quotient/representatives/rawLift/lift/complement`）、`completeHom := linearYoneda…P.op`、`CompleteHom.cokerCycles/boundary_iff/equiv` | §2 全 Hom 复形上同调 + h:comparison 的 $\Hom_R(P,Z)$ 上同调 ≅ 稳定 Hom（2.1.1） |
| 7 | Twisting (58) | `Bimod φ`、`functor/res`、`unit`、`extend` | §2/§5 代数自同构诱导的双模 Restrict/Induce（$h_H$ 扭） |
| 8 | Coresolution (74) | `coresolutionOfExact/coresolution`、`inverseTwistHom/inverseTwistComplex`、`mappedCoresolution` | h:duality 负端内射余消解拼装（2.1.2） |
| 9 | TwistHom (25) | `mappedResolution`、`resolutionTwistHom`、`positiveTwistLift` | e:twists 的消解层实现（2.4.4） |
| 10 | OuterTensor (99) | `map₂/total` 比较同构 `comparison/iso`、`forgetA` | §5 外张量：$E\otimes_B^- \simeq \mathcal J\otimes\mathcal J$ 的总复形机器 |
| 11 | OuterExt (59) | `bifunctor`、`resolution`、`TotalDualPairing.equiv` | §5 外 Ext / 双配对（$\Ext_E^*(X,X)=k[\tau_1,\tau_2]$ 的 Künnet 侧） |
| 12 | Nakayama (117) | `Nakayama k R M := (M →ₗ[R] R)^*`、`evaluation` 同构、`transpose`、`TrivialInduction.Obj/inducedResolution`、`ext_negative`、**`theorem transfer`** | §3 tr:transfer 全部（2.2.2 五步逐一对应；`ext_negative`=tr:negative-duality） |
| 13 | Corner (139) | `LeftCorner/generator/projection/lift/hom_ext/mulRight`、`GroundField/parameter/q/H₁/H₂`、**代数 `C` 乘法表 `mul` + `mul_assoc`**、`basis`、`f/e/u/ell`、**`trace_left_right_f (=2a₀+2a₁)`**、`trace_left_right_pf`、`outer_factorization_trace`、参数幂次引理组 | §4 a:table 的机器验证 + §6 b:trace-obstruction 的迹核算 + 参数域地基 |
| 14 | Period (140) | `TrivialInduction.functor`、`T := TrivialExtension k (C k q)`、`inducedObj/inducedD`（$T\otimes_C^{\mathbf L}s$ 的显式周期消解） | §4/§5：$T$ 上 $s$ 的周期 3 消解、$\tau$ 的生成（e:polynomial 前件） |
| 15 | Socle (89) | `characterT/characterE`、`formE : SymmetrizingForm (E q)`、`X_nonprojective`（302 行） | §4 $E$ 对称化型 + 2.6.4 步 4 的"X 非投射"弹药 |
| 16 | ReverseResolution (117) | `dualCoeff/leftDualZ/leftDualJ/leftDualAug/leftDualD₁` | §4 a:dual-dimensions：$DC$ 的左方投射消解（维数账 ≤4） |
| 17 | Bimodule (90) | `ModuleFiber`（映射纤维复形 `obj/differential/complex`）、`HomBimodule.rightAction`、`projective_of_contraction`（659）、`jjFiber/jjFiber_totallyAcyclic/finite/projective`（241-260）、`inducedRegularComplex_left/rightProjective` | §6 bar/纤维构造 + h:stable-image（2.1.4）的机器件 |
| 18 | RightInduction (90) | `rightEvaluation`、`rightObjEquiv/rightEvaluationEquiv/evalScalarEquiv` | h:evaluation 右侧（2.1.6） |
| 19 | Coinduction (189) | `rightDualZ/V/Aug/D₁`、`rightDualResObj/rightDualResD` | a:dual-dimensions 右侧消解（2.3.2） |
| 20 | Induction (110) | `rightRegularEndUnderlying`、`ordinaryEndEquiv`、`dualRegularUnderlying`、`ordinaryAlpha/ordinaryBeta` | h:evaluation/h:duality 的普通-双模伴随词典（2.1.6） |
| 21 | DerivedInduction (84) | `restrictedLeft/RightResolution(_above)`、**`Y := Enveloping.inducedY`**、`c5_left/right_projective`、`Y_side_projective`、`cSimpleCanon/cSimpleUnderlying` | b:bar-model（2.5.1）：$Y$ 的定义与两侧投射性（含"侧收缩"，见 4.7） |
| 22 | Perfect (81) | `perfect_factorization`、`cochain_perfect_factorization`、`StableEquiv` API（`refl/symm/ofLinearEquiv/post/pre`）、`natJJ/forwardJJ/jjNatIntIso` | h:perfect-factor（2.1.5）+ 稳定等价范畴语言 + ℕ/ℤ 双指标换算 |
| 23 | DerivedDescent (79) | **`restrictedBimoduleResolution(_above)`**（$E$ 的 $B^e$-消解，`8 < n` 项为零） | b:evaluated-lift 第 5 步"限制后 perfect（4+4=8）"（2.5.4） |
| 24 | FiniteCoinduction (94) | `dualTensorUnderlying/dualTensorLeftEquiv`、`dualRightObj/…` | tr:transfer 第 1 步 tr:nakayama-evaluation 的有限对偶张量核算 |
| 25 | StableLift (54) | `ordinary_inAdd_factorization_pf_zero`、**`characterBimoduleMap_not_derived_perfect_factor`**、`inducedSocleMap(_not_derived_perfect_factor/_stably_nonzero_lift)`、`finiteU`、`exists_nonzero_X_YX` | b:trace-obstruction + b:evaluated-lift（2.5.3/2.5.4）——全文最难的"存在性"在此 |
| 26 | HomProfile (100) | 参数域二次声明（`Base/K/parameter/q/H₁/H₂`、`parameter_ne_zero`、`one_add_q_pow_ne_zero`、`distinct_parameter_powers`、`H_powers_distinct`、`H_inverse_powers_distinct`）、`MissingYProfile.W/profile`（$W^a$ 廓形）、`selfHom` 全度数、`XTwistIso/XInverseTwistIso/XTwist_weight/XInverseTwist_weight`、`xTwistHom_positive/negative`（权重 $H^{-m}$、$H^{m+2}$）、`finiteX/xComplete`（956 起）、`jjFiberHomEquiv/jjFiber_stable_zero`、`completeCokerDuality`（441） | e:all-degrees + e:twists + b:profile（2.4.2/2.4.4/2.5.2） |
| 27 | Delta (94) | `WZeroEquiv/wZero`、`evaluatedStableMap/normalizedMap`（$g_H$ 归一化）、`Enveloping.fiber/fiberMiddle/fiberProjection/fiber/fiber_exact/fiber_left/right_projective`（112-195）、**`concreteF`**（205）、`concrete_evaluated_*`、`concreteLift := tensorCompleteLift`（828）、`delta/delta_pair/delta_bijective_weights/delta_bijective_of_zero/delta_minusTwo_injective`、`scalarPair(_bijective)`、`sourceDelta_positive/negative/bijective`、`sourceDelta_vanishing_ranges`（1102）、`exact_line_surjective` | §7 t:fiber/t:delta/t:comparison-maps（2.6.1/2.6.2） |
| 28 | Triangular (92) | **`Alg := TrivSqZeroExt (R×R) (Off F)`**（$\Lambda$）、`upper/lower/off`、`e₀/e₁`、`D₀Complex/D₁Complex`、`crossMap`、`low_identity/down_identity/cone_id_boundary`（在 Counterexample.lean 内） | §7 t:triangular-algebra + (t:diagonal-hom)/(t:cross-hom) |
| 29 | Cone (58) | `complex := homotopyCofiber v`、`termEquiv`、`CompleteCone.totallyAcyclic/boundary_of_delta`、`D₀/D₁_totallyAcyclic`、`cone_totallyAcyclic/cone_finite/cone_projective/cone_closed_boundary`、`homology_subsingleton`、`actionDelta_injective/actionDelta_surjective` | §7 t:cone/t:finite-module/t:vanishing（2.6.3-2.6.5） |
| 30 | DownHom (78) | `Cochain/Closed/Boundary`（全 Hom 复形的逐度语言）、`mapLinear/toStable/toHomotopy/equiv`、`down₀/down₁/downCross` 重标、`CompleteTranslate` | §2 h:comparison 语言 + §7 交叉块重标（"differentials agree"的机器形态） |
| 31 | Counterexample (39) | `SourceField` 装配区（`sourceF/sourceX/sourceP/sourceU/sourceTriangle/sourceCone/sourceConeModule/sourceAlgebra/sourceModule`）、`ofMap` 三连引理、`transfer_of_completeHom_vanishing`、`main_theorem` | §7 收尾 2.6.6 + 全局胶水 |

**对应缺失项**：论文 §8（consequences，即本素材 2.7）**无对应模块**；§1 的推论 cor:homological/cor:finitistic/cor:tilting-complements/cor:stratifying 均未形式化。形式化覆盖 = thm:main 的"存在对称反例"本体。

## 4.3 "论文一句话 ↔ Lean 一个模块"的病理标本

1. **tr:transfer 一个命题 → `Nakayama.lean` 全模块（63KB/117 声明）**。论文转移原理正文 1 页 + 证明 1.5 页；Lean 需要自建 Nakayama 函子（`def Nakayama k R M := Module.Dual k (M →ₗ[R] R)`——注意这是**实现选型**：Mathlib 无现成 $\nu=DR\otimes_R-$ 的良构对象，取转置对偶模型再证 `evaluation` 双射）、`transpose/paired/transposeFun` 一整套求值-转置词典、`TrivialInduction.Obj`（诱导模）、`inducedResolution`、`ext_negative`（负端消失 → Ext 消失的对偶引理链，含 `homologyMap_scalar*` 等杂件）。一句话的"教科书引理"在 Lean 里是 2000+ 行的地基。
2. **b:trace-obstruction 一句话（"每个角维数为偶 ⇒ 迹为 0"）→ `Corner.lean` 的 `trace_left_right_f` + `outer_factorization_trace` + `StableLift.lean` 的 `characterBimoduleMap_not_derived_perfect_factor`**。详见 4.5。
3. **"Algebraic independence of $H_1,H_2$ implies that each determinant is nonzero"（t:comparison-maps 一句）→ `HomProfile.lean:22-49` 的六条参数引理 + `Delta.lean` 的 `scalarPair_bijective`**。详见 4.4/4.6。
4. **"Such a choice is possible because $E$ is symmetric."（2.6.3 步 4 完全消解规格句）→ `Socle.lean` 的 `formE` + `HomProfile.lean` 的 `finiteX : Complete X`（`xComplete` 把"首负项 $Ep_f$、度 0 微分 $i_X\epsilon$"的规格内建于构造）**。`Counterexample.lean:36-44` 用 `sourceAug_exact`（`pos_augmentation_exact`）逐度核对增广正合。
5. **e:twists 的权重表（$H^{-m}$/$H^{m+2}$）→ `HomProfile.lean:1270-1283` 两条引理** `xTwistHom_positive/negative`，其下钻到 `XTwist_weight/XInverseTwist_weight`，再到 `TwistHom.lean` 的 `positiveTwistLift`（消解链映射层面的提升）。一个"读表"在机器里是三层函子等式。
6. **整节 §7 → 五模块接力**（Delta→Triangular→Cone→DownHom→Counterexample，约 200KB）：论文 §7 只有 12.5KB TeX，是"论文每 KB 的 Lean 密度"最高的一节——因为全部前面结论在此实例化。

## 4.4 参数域的形式化：不证代数独立，只证所需不等式

论文说"$q,H_1,H_2$ 代数独立"。Lean **没有**引入"代数独立"概念，而是把域具体造出来、把**用到的每族不等式**单独证明：

```lean
abbrev GroundField := FractionRing (MvPolynomial (Fin 3) (ZMod 2))   -- Corner.lean:92
noncomputable def parameter (i : Fin 3) : GroundField :=
  algebraMap (MvPolynomial (Fin 3) (ZMod 2)) GroundField (MvPolynomial.X i)
abbrev q : GroundField := parameter 0
abbrev H₁ : GroundField := parameter 1
abbrev H₂ : GroundField := parameter 2
```
（`HomProfile.lean:8-14` 以 `Base/K` 之名重复一遍，`Symmetry.lean:10` 再以 `k` 之名第三次——三处同型定义靠 `IsFractionRing` 结构唯一性相容；[推测] 重复是增量开发的沉积层。）

四条核心不等式（`HomProfile.lean:16-49`，`Corner.lean:850-884` 有孪生版）：

1. `parameter_ne_zero (i : Fin 3) : parameter i ≠ 0`——把等式拉回多项式环（`IsFractionRing.injective`），用 `MvPolynomial.X_ne_zero`。
2. `one_add_q_pow_ne_zero (n) (hn : 0 < n) : 1 + q^n ≠ 0`——**求值战术**：反设 $1+X_0^n=0$ 于 `MvPolynomial (Fin 3) (ZMod 2)`，施 `MvPolynomial.eval (fun _ => 0)`（全零赋值），得 `1 + 0 = 0` 即 `(1 : ZMod 2) = 0`，`one_ne_zero` 矛盾。原理：多项式 $1+X_0^n$ 常数项为 1，任何域上非零；全零赋值是把它投影到常数项的廉价代理。
3. `distinct_parameter_powers {i j} (hij : i ≠ j) (hn : 0 < n) : parameter i ^ n ≠ parameter j ^ n`——两版实现：`Corner.lean:866` 用 `MvPolynomial.X_pow_eq_monomial` + `monomial_left_inj (by decide : (1 : ZMod 2) ≠ 0)` 比单单项式指数向量；`HomProfile.lean:33` 用**交换赋值** $v(t)=\text{if }t=i\text{ then }0\text{ else }1$：$X_i^n\mapsto0$（$n>0$）而 $X_j^n\mapsto1$，像不等 ⇒ 原式不等。两种都是"多项式不等 ⇒ 找一格点求值分家"的构造性替代。
4. `H_powers_distinct`（= 3 的 `i=1,j=2` 特例，`by decide` 供 `(1:Fin 3) ≠ (2:Fin 3)`）与 `H_inverse_powers_distinct (H₁^n)⁻¹ ≠ (H₂^n)⁻¹`（由 `inv_injective` 转回）。

这些正是 2.6.2 步 4 行列式条款 $H_1^{-m}\ne H_2^{-m}$、$H_1^{m+2}\ne H_2^{m+2}$ 与 1.3 [推测] 参数账目的机器兑现。特征 2 由 `ZMod 2` 的分式环自动携带：`GroundField` 的 `CharP 2` 实例 + 各处的 `[CharP k 2]` 假设参数化（一般域版引理保留 `CharP k 2` 类假设，`SourceField` 实例化时闭合）。

**敏感度注意**：全部构造引理的假设形状是 `(hq : q ≠ 0) (hp : ∀ n, 0 < n → 1 + q^n ≠ 0) (H₁ H₂ : k) (h₁ h₂) …`（如 `Delta.lean:943-945`）——即机器验证的其实是**参数化命题族**，域 `k` 只是其中一个实例；这为"对每个扩域 $K/k$ 成立"（1.4）留了后门但论文推论未形式化。

## 4.5 角维数与迹的形式化：`Corner.lean` 的 `trace_left_right_f = 2a₀+2a₁`

**角（corner）的机器形态**：`LeftCorner p := {a : R // a * p = a}` 作为 `Submodule R R`（`Corner.lean:9`）——右乘幂等 $p$ 的不动点子模，即论文 $Rp$ 型左角。配套件：`generator hp := ⟨p, hp⟩`、`projection hp : R →ₗ[R] LeftCorner p`（右乘 $p$）、`projection_comp_inclusion`（复合恒等 ⇒ `projective`）、`hom_apply`（$f(a)=(a:R)\bullet f(\text{generator})$——角上的线性映射由生成元值唯一决定）、`lift`/`mulRight`（角间迁移）。这套小词典是"角维数"概念的载体：论文说某角同构于 $k$ 时，机器里是 `LeftCorner` 与某具体一维模型的 `LinearEquiv`。

**迹引理**（$C$ 上 $f$-双边乘的迹，`Corner.lean:214-232`）：
```lean
lemma trace_left_right_f (a : C k q) :
    LinearMap.trace k (C k q) ((LinearMap.mulLeft k a).comp (LinearMap.mulRight k (f q))) =
      2 * a 0 + 2 * a 1 := by
  rw [LinearMap.trace_eq_matrix_trace k (basis q)]
  simp only [Matrix.trace, Matrix.diag, LinearMap.toMatrix_apply,
    LinearMap.comp_apply, LinearMap.mulLeft_apply, LinearMap.mulRight_apply]
  change (∑ i : Fin 10, (a * ((basis q i) * f q)) i) = _
  simp only [mul_f]
  ...
  simp [Fin.sum_univ_succ, mul, basis_apply]
  ring
```
机械展开：`C k q := Fin 10 → k`（论文 §4 基 $1,e,f,...$ 的指标化，0..9），`f q = ![0,1,0,...]`（基元 $f$=指标 1），`basis := Pi.basisFun`。`mul_f`（211 行）先逐坐标算出 $a\cdot f_q=[0,a_1,0,0,0,a_5,a_6,0,0,a_9]$；迹 $=\sum_i(a\cdot(e_i\cdot f))_i$——$e_i\cdot f$ 非零仅当列 1（$i=1$：$e_1f=f$，$a f$ 的 1 号坐标 $=a_1$）与 $i=?$…（逐坐标贡献合计 $a_0$ 两次 + $a_1$ 两次；机器不解释，直接 10 项求和 + `ring`）。**关键推论** `trace_left_right_f_eq_zero [CharP k 2]`：$2a_0+2a_1=0$ 由 `CharP.cast_eq_zero k 2` 一行化零——这就是 2.5.3 迹障碍"特征 2 下恒为零"的机器本体。上层：`trace_left_right_pf`（$B=C\otimes C$ 上 $\mathrm{tr}(x\mapsto ax\,p_f)=\bigl(\mathrm{tr}_C(a?\cdot f)\bigr)^2$ 型，经 `LinearMap.trace_tensorProduct'` 分解为两个 $C$-迹之积，585-596 行）；`outer_factorization_trace`（667 行起：任何过"外因子 $E^e$-投射分解"的双模映射复合，其迹必等于 $\operatorname{tr}(\text{左乘}d\circ\text{右乘}p)$ 型 ⇒ 0），755 行处 `obtain ⟨d, hd⟩ := outer_factorization_trace ...; rw [hd, trace_left_right_pf]` 收尾。最终消费点在 `StableLift.lean:50` `characterBimoduleMap_not_derived_perfect_factor`：特征映射 $\eta:B\to DB$ 若能过 perfect $B^e$-复形分解则导出迹既为 0（障碍）又为 1（增广归一）矛盾。

**[推测] 形式化观察**：论文陈述障碍用"角维数为偶数"的语言，`Corner.lean` 却从未数维数——它直接算 $\operatorname{End}_k(C)$ 的矩阵迹。两者经"迹=对角和=维数 mod 2（对幂等算子）"连通，机器选了一条更陡但更直的坡：显式基 + 显式矩阵。

## 4.6 三角/锥/$\Delta$ 装配线取证（对应 2.6）

1. **$\Lambda$**：`Triangular.Alg F := TrivSqZeroExt (R × R) (Off F)`。上三角矩阵环被表示成"对角环 $R\times R$ + 平方零双侧模 $\operatorname{Off}F$"——避开自建矩阵乘法的 2×2 分块验算，直接吃 Mathlib `TrivSqZeroExt` 的环结构/模结构 API。`Off F := Enveloping.Obj F` 的双作用 instances（`Triangular.lean:15-29`）把 $E^e$-模改写为 $(R\times R)$-$\,(R\times R)^{\mathrm{op}}$-双模：左走第二分量、右走第一分量（`Module.compHom … RingHom.snd/fst∘op`）——**约定翻译层**，无论文对应物。
2. **列函子与 Hom 词典**：`D₀Obj/D₁Obj`（对象）、`D₀Complex/D₁Complex`（复形）、`diagonal₀/diagonal₁/cross₁₀`（(t:diagonal-hom)/(t:cross-hom) 三个块的显式同构，配 `_pre/_post/_comp` 相容性引理，见 `DownHom.lean:604-640`）。`cross₀₁_zero`：$\operatorname{Hom}(\mathsf D_0,\mathsf D_1)=0$ 的机器名。
3. **$\Delta^a$**：`Delta.delta a := Hmap(FAction)…coprod Hmap(VAction)…`——$F(g)v_0+v_0[a]h$ 中 $F(g)$、$v_0[a]h$ 两路各自先做成 `VectorSplit.Hmap`（上同调层面的线性映射搬运工）再 coprod。`FAction/VAction` 的配对经 `FAction_first/second`、`VAction_first/second` 四条 simp 引理落到 `xTwistHom`（扭转作用）与恒等——(t:projected-delta) 的机器形态是 `delta_pair`：`FHomPair (delta (x,y)) = (Hmap(xTwistHom H₁) x + y, Hmap(xTwistHom H₂) x + y)`。
4. **行列式条款的替代**：没有 `Matrix.det`——`scalarPair r s := Matrix 型 coprod`（`Delta.lean:903`），`scalarPair_bijective (r ≠ s)` 直接在 $(V\times V)$ 上构造双射（[推测] 内核是 $r\ne s$ 时 $(x,y)\mapsto(rx+y, sx+y)$ 可显式反解：$x=(r+s)^{-1}(\cdot)$，特征 2 需 $r+s\ne0\Leftrightarrow r\ne s$）。上游权重来自 `xTwistHom_positive/negative`（$H^{-m}$/$H^{m+2}$），正交性归约到 `H_inverse_powers_distinct`/`H_powers_distinct`（4.4）。边界两案特殊分岔：`delta_minusTwo_injective`（源 `selfHom_zero_near` 给 $\mathcal H^{-2}=0$ ⇒ `Subsingleton.elim`）与 `delta_zero_surjective`（$\mathcal V^0=kv_0$ 的 `exact_line_surjective` 抽象引理：单/满 + 正合 + 三个显式 `≃ₗ[k] k^?` 维数夹逼——对应 2.6.1 步 5 的核=对角线论证）。总装：`sourceDelta_vanishing_ranges a ha : Injective (Δ^a) ∧ Surjective (Δ^(a-1))`（`Delta.lean:1102`，两处分岔 `a=-2`/`a=1` 精确复刻论文"$\Delta^{-2}$ 单、$\Delta^0$ 满"）。
5. **锥与消失**：`Cone.cone = CompleteCone.complex (crossMap F u)`；`CompleteCone.totallyAcyclic`（两列全循环 ⇒ 锥全循环，2.6.4 步 2）；`Cone.boundary_of_delta a (hI : Injective (homologyDelta …)) (hS : Surjective (homologyDelta … (a-1))) …`——(t:end-cohomology) 的双零夹逼在机器里就是这对入参；`DownHom.actionDelta_injective/actionDelta_surjective`（`Cone.lean:688/708`）把 `sourceDelta_vanishing_ranges` 的 $k$-线性双射条款转译为 `Cochain` 语言的"闭=边"。核心桥 `downCross_delta`（`DownHom.lean:678`）：`downCross (pre crossMap f + post g crossMap) = actionDelta F u (down₀ f) (down₁ g)`——论文步 4"连接映射 $=F(g)v_0+v_0[a]h$"的逐点链等式，用 `erw [LinearEquiv.apply_symm_apply]` 三连化简。重标同构 `downCross` 不带 $a-1$ 显子（`Cochain … a ≃ Cochain P (tensorComplex F Q) a`），$-1$ 位移藏在 `Enveloping.tensorComplex` 的指标与 `boundary_of_delta` 的 $a/(a-1)$ 配对里——**2.6.5 步 2 的 "$\mathcal C^a=\Hom^{a-1}(P,FP)$" 在机器中是分布式的，没有单一对应引理**。
6. **非投射**：`Triangular.cone_id_boundary`（`Counterexample.lean:171`，锥恒等是边 ⇒ $\mathsf D_0$ 块恒等是边 ⇒ $P$ 恒等是边，经 `low`（下块投影）与 `down₀` 三级传导；关键引理 `low (crossMap F u) = 0` 即 $\operatorname{Hom}(\mathsf D_0,\mathsf D_1)$ 块为零的几何事实在传导中的角色）+ `DownHom.id_boundary_of_projective/projective_of_id_boundary`（投射 ⇔ 恒等边界，双向）+ `X_nonprojective`（`Socle.lean:302`，经 `XTensor_nonprojective`：$X=s\otimes s$ 投射会导出 $s$ 在 $T$ 上投射，而 $\Ext_T^3(s,s)=k\tau\ne0$）。

## 4.7 bar/Koszul 复形的"侧收缩"取证

论文侧（`bimodule.tex`）的收缩句：
> "The usual bar resolution of \(B\) has terms \(B\otimes B^{\otimes i}\otimes B\).  Its augmented complex is contracted as a complex of vector spaces by inserting a unit.  Inserting a unit at one end also proves that tensoring it with a module at the other end gives a projective resolution of that module on the remaining side."

以及 $c_5K$ 侧投射性的构造（"choose a homotopy from the identity of \(K\) to a map factoring through the complex ending in degree \(4\). In degree \(5\) it gives \(1_{K_5}=d_6h_5+h_4d_5\)" + $N_0\to N_4$ 五步滤波）。

**Lean 对应**（三层）：
1. **bar 模型本体**：`Enveloping.inducedRegularComplex (inclusionB q)`（$K$：把 $\operatorname{Bar}(B)$ 的两个外作用诱导成 $E^e$-复形）与 `Enveloping.inducedCokerFive`（$c_5K$）——定义在 `DerivedInduction.lean` 上游；$\mathcal J\otimes\mathcal J$ 侧由 `Perfect.lean` 的 `forwardJJ/natJJ` 双指标模型 + `jjNatIntIso`（ℕ-总复形 ≅ ℤ-截断）承担，`evaluatedKJComparison`（同伦等价 $K\simeq$ JJ 模型，对应"Tensoring two copies of this triangle"）。
2. **侧收缩 ⇒ 侧投射**：`Bimodule.projective_of_contraction`（`Bimodule.lean:659`）——输入是逐度同伦数据 $h_{n},h_{n+1}$（"$1=dh+hd$ 模 $\im d$ 后恒等因式分解穿过 $P_{n-1}$"），输出 $c_nK$ 投射；消费点 `c5_left_projective/c5_right_projective`（`DerivedInduction.lean:31-40`）= 论文"$c_5K$ 每侧都是投射之直加项"句；再经 `Enveloping.negative_side_projective` 归纳到 $Y=N_4$（`Y_side_projective`，42-47 行）。$N_r\hookrightarrow\Hom_k(E^e,N_r)\twoheadrightarrow N_{r+1}$ 五步滤波用 `Enveloping.inducedY` 的内嵌定义完成，中项"有限内射⇒投射（$E^e$ 对称）"由 `Symmetry.formE`/`SymmetrizingForm` API 供对称性。
3. **Koszul 侧**：论文 $\mathcal H^{\ge0}$ 上的"两变量 Koszul 序列"（$\tau_1,\tau_2$ 正则）在机器里的化身是 `HomProfile.MissingYProfile.W/profile`（$W^a$ 支撑 $\{-3,0\}$）与其证明链 `jjFiber_totallyAcyclic/jjFiber_stable_zero/jjFiberHomEquiv`——`jjFiber`（`Bimodule.lean:241`）是 JJ 复形连接映射的映射纤维，其全循环性即"Koszul 正合"的复形化陈述；`completeCokerDuality`（`HomProfile.lean:441`，Tate 对偶 $H^a\leftrightarrow H^{-a-1}$）把正端正合性翻到负端（h:duality 的机器名）。

**[推测] 观察**：Lean 中没有任何地方出现 "Koszul" 或 "bar" 命名——两条复形都以构造名（`jjFiber`、`inducedRegularComplex`）存在。这与论文"bar 复形/Koszul 序列"的讲述方式完全脱钩：机器只认**具体复形 + 具体同伦**，概念名留在 TeX 层。

## 4.8 战术卡点与绕行（取证清单）

战术词频（全目录）：`change` 1278、`show` 847、`simp` 769、`omega` 407、`refine` 203、`constructor` 112、`fin_cases` 35、`classical` 23、`ring` 13、`convert` 3、`decide` 9、`set_option/maxHeartbeats` **0**、注释行 **0**。异常分布本身就是卡点化石：

1. **`change`+`show` 双雄（合计 2125 次）**：Mathlib `HomologicalComplex`/`ChainComplex` 的 `d i j` 依赖 `ComplexShape.down ℤ.Rel i j` 证明项，指标 $(j+1)\to j$ 与 $(j-1)\to j-2$ 的"同一映射"在类型层由不同 `h : Rel` 参数区分。凡涉重标（4.6 步 5、`Counterexample.lean:81-98` 的 `dNext_eq/prevD_eq` 改写）都要先 `change` 到可比较形态再打——`Counterexample.lean:38` 的 `change Function.Exact ((sourceX.complete (formE q)).d (0+1) 0) sourceX.cover.map` 即典型：`0+1` 与 `1` 的 `Nat` 语法差都要显式抹平。这是**依赖类型索引手术**类卡点，论文里"$P[a]_j=P_{j-a}$"一句在机器里是一片 `omega` 森林（407 次）。
2. **10 维乘法表验证（`Corner.lean:133-183`）**：`mul_assoc` 用 `ext i; fin_cases i <;> simp [mul] <;> ring`——10 个坐标各展开成约 20–40 项多项式恒等式；`ring` 只出现 13 次但每次背着大多项式（[推测] 这是全库最重的单步算力点，但作者用 `fin_cases` 切成 10 个小题避免单题爆炸）。单位律/零律/分配律同型（`simp [mul, unit]`）。同类手术：`mul_f` 等逐坐标引理。
3. **`eqToIso/IXIsoOfEq`  rewriting**（`Counterexample.lean:81-113` 的 `ofMap` 三连）：把"链映射 → 度 0 上余循环"的翻译做成 `Cochain` 语言后，证明"恒等映射是边 ⇔ 零散同伦"要在 `i=j` 的 `eq_to_refl` 型路径上剥三层 `simp only [ofMap,XIsoOfEq,eqToIso_refl,Iso.refl_hom,Category.id_comp]`——**证明项不可约但语法等价**的卡点，靠 `simpa only` 白名单硬啃。
4. **`VectorSplit` 的 `choose` 卡点**（`StableShift.lean:12-56`）：Mathlib 无"子模线性收缩"与"商模线性截面"的存在性 API 的构造性版本；作者用 `exists_leftInverse_of_injective ... .choose`（内核 `Classical.choice`）把 $Z\hookrightarrow X$ 与 $H\twoheadrightarrow Z/\!B$ 的**选择**固化为 `def`（`retract/representatives/rawLift`），再补 `boundary_lift/retract_lift/complement_eq_lift` 等相容性——绕行代价：所有经 `H` 的语言都携带非构造选择，`noncomputable section` 遍布 31 文件。
5. **`Subsingleton` 惯用法**：消失条款一律 `Subsingleton (VectorSplit.H …)`/`Subsingleton (Abelian.Ext …)` 而非 `= 0`（商类型上 `0` 与整个类型的相等不可写，`Subsingleton` 是"至多一元"的正确命题形态）；配套 `delta_bijective_of_zero` 这类"两个 Subsingleton ⇒ 平凡双射"胶水（`fun _ _ _ => Subsingleton.elim _ _`）。
6. **instance 索卡点**：`local instance sourceF_left/right/finite`（`Counterexample.lean:14-21`）把 `concreteF_side_projective` 的两侧投射性注册为局部实例，防全局 instance 数据库污染；通篇大量 `let :=` 单独成行（如 `Delta.lean:211` 起）——不是废话，是**强制类型类求解**的惯用点火器（Mathlib 的 `Module.Projective`/`FiniteDimensional` 检索链需要显式触发）。
7. **`decide` 的克制使用**（9 处）：全部用在可判定小事实上——`(by decide : (1 : ZMod 2) ≠ 0)`、`Fin 3` 两点不等（`H_powers_distinct` 的 `by decide`）、`ComplexShape.Rel` 小整数、`positiveSelfHom_zero … (by decide)`。大事实从不 `decide`（与 `enable_nanoda:false` 一致：无内核外计算）。
8. **无 `set_option maxHeartbeats`** ⇒ [推测] 所有证明在内建超时内完成；没有性能补丁是这台机器"可复现性"的隐性加分项。
9. **零注释、零 docstring**：31 个文件没有一行 `--`/`/--` 注释。可维护性完全靠命名规范（`xTwistHom_positive`、`sourceCone_closed_boundary` 等自述式名字）与论文标签对齐——取证时"名字即论文标签的驼峰转写"是主线索（`b:evaluated-lift` → `evaluatedStableMap`/`exists_Y_lift_with_nonzero_composition`；`t:comparison-maps` → `sourceDelta_vanishing_ranges`）。

## 4.9 公理取证：`permitted_axioms` 三条为何必要且充分

- **`propext`**：所有 `simp` 改写命题等价的常规需要；`Subsingleton.elim` 路径亦涉。
- **`Quot.sound`**：`StableHom`（`⧸ projectiveFactors`）、`CokerAt`（`range.mkQ`）、`VectorSplit.H`（商）、`BalancedTensor`（`⧸ relations`）全是商类型上的 `def/lemma`，其正确性证明需商同余公理。
- **`Classical.choice`**：三处本质需要——(i) `VectorSplit.retract/representatives/rawLift` 的 `.choose`（4.8 步 4）；(ii) `classical` 策略 23 处（12 个文件；如 `StableLift.ordinary_inAdd_factorization_pf_zero` 中判定"$\in\add$ 分解"的存在性证明）；(iii) `Submodule.Quotient` API 内部。无 `sorryAx`、无自定义公理、无 `natoda`——与配置完全吻合，且这三条是 Mathlib 底座，等价于"纯 Mathlib 证明"。

## 4.10 sorry 位置的含义与覆盖缺口（再次钉死）

1. `ComparatorChallenges/Tachikawa.lean` 的 `sorry`：**题目**（"请证 main_theorem"），位于挑战侧。
2. 解法侧 31 文件：**0 个 sorry**；`main_theorem` 是完整证明项（`by exact?` 都到不了它——它是 `:= counterexampleOf …` 直接项）。
3. **真正的验证缺口不在 sorry 而在范围**：comparator 只点名 `OAI.Tachikawa.main_theorem` ⇒ 论文 §8 五连否定（2.7 全部内容）、推论的"对每个扩域 $K/k$"版本（1.4 末段基变换账）、以及 2.3–2.5 中被主定理消费但**自身未独立命名**的中间定理，均不在机器担保内。换言之：**Lean 验证了"反例存在"，未验证"反例好用"**。
4. [推测] `definition_names: []` 的取证含义：挑战允许解法用**任何**等价的 `Counterexample` 表述（只要命题闭合、公理合规）——但文件里挑战与解法两侧的定义逐字同构，实际未行使这种自由度。

---

# 五、常数与参数总表：全文每个具体数值的位置、作用与敏感度

> "敏感度"栏回答"把这个数改动/退化会发生什么"。标 [验证] 的是论文/机器文本明说或可直接推出；标 [推测] 的是分析者推断。位置记法：`文件:行`（TeX 源）或模块/定理标签；Lean 位置只在与论文行为成对出现时列出。

## 5.0 基础域与特征层

| 值/参数 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| $\mathbb F_2$（基域） | thm:main（introduction.tex:35）；Lean `ZMod 2`（Symmetry.lean:10, Corner.lean:92, HomProfile.lean:8） | 特征 2 总开关：微分/比较映射无符号（Conventions："signs in their differentials and comparison maps disappear"） | [验证] 三处符号节点（2.1 约定、t:vanishing 重标、$2a_0+2a_1=0$ 迹）同时依赖它；换奇特征则 (t:end-sequence) 重标、Δ 定义、b:trace-obstruction 三线崩溃 [推测：奇特征需整体重设计] |
| 三个参数 $q,H_1,H_2$ 代数独立 | thm:main；Lean `MvPolynomial (Fin 3)` | $q$：十维代数内部结构；$H_1,H_2$：双扭转权重 | [验证] $H_1=H_2$ ⇒ $\Delta^{a}$ 全部退化（秩 1），$q\in$ 单位根族 ⇒ $1+q^n=0$ 使合冲链断裂（`one_add_q_pow_ne_zero` 失效） |
| `Fin 3` | Corner.lean:92 等 | 参数个数=3 的机器编码 | [验证] 与论文 $\mathbb F_2(q,H_1,H_2)$ 严格一致；无冗余参数（$q$ 只进 $C$，$H_i$ 只进扭转，互不越界） |
| `parameter 0/1/2 = q/H₁/H₂` | Corner.lean:97-99 | 索引↔名字绑定 | 纯命名，零敏感度 |

## 5.1 十维代数 $C$ 层（论文 §4）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| $\dim_k C=10$；基指标 `Fin 10`（0..9） | algebra.tex §4 表；Corner.lean:91 `C := Fin 10 → k` | 两角 $eCe,eCf,fCf$ + 根空间的维数配方 | [推测] 10 = 4（量子外 $eCe$：$e,u?,…$）+ 桥向量 $x,y,z,t,j,n,v,f,\ell$ 的最小闭包；论文未论证不可再压缩 |
| 乘法表系数 $q$、$q^2$、$(1+q)$ | algebra.tex:39,70,76（表内 $q^2j$、$(1+q)n$ 等）；`Corner.mul` 第 3,5,9,10 行 | 量子外交接：$ty=q^2j$、$(1+q)$ 修正结合性 | [验证] $q=0$ 被 `hq : q ≠ 0` 全局禁止（否则 $a$-角配对退化，`Period` 周期消解断裂）；$q=1$（特征 2 下 $1+q=0$）被 `one_add_q_pow_ne_zero` 禁止 |
| $\ell_i=x+q^i y$ | algebra.tex:163 | 参数平移合冲向量（Schulz 血统，3.2 障碍 1） | [验证] 消解微分 $\rho_{\ell_i}$ 的下标线性性是全链的骨架；$q^i$ 重合（$q$ 单位根）即崩 |
| $1+q^{i+2}\ne0$ | algebra.tex:284（$(1+q^{i+2})j$ 分量）；`one_add_parameter_pow_ne_zero` | 合冲映射像的非退化（$j$-分量不被杀） | [验证] 每个 $i\ge -2$ 都用到；这就是 $q$ 非单位根的机器形式 |
| $\det=q^2\ne0$ | algebra.tex:205 | 配对 $(j^*,t^*,q^2t^*,0,qn^*,f^*)$ 非退化（对偶消解可解） | [验证] 系 $q\ne0$ 的直接推论 |
| $\pd_B({}_BE)\le4$、$\pd_{B^{\mathrm{op}}}(E_B)\le4$、$\idim{}_BB\le4$ | algebra.tex:189-191（a:dual-dimensions） | 消解长度预算：4 = bar 截断度 + 对偶尾部起点 | [验证] 下游三处硬消费：$K$ 的 $H_i=0\ (i>4)$、$c_5K$ 侧投射、$B^e$-perfect 界 $4+4=8$。若真值变 5，5/6/9 全线右移——构造平移但成立 [推测]；若无穷则全断 |
| 消解式 $d_1=\rho_u,\ d_{i+2}=\rho_{\ell_i}\ (i\ge0)$ | algebra.tex:262 | $s$ 的 $C$-投射消解显式形状 | 下标偏移 2 是记账约定 [推测：源于 $P_{-1},P_{-2}$ 已给] |

## 5.2 稳定自同态层（论文 §5）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| $|\tau|=3$（$\deg\tau_1=\deg\tau_2=3$） | introduction.tex:143-145；stable.tex e:polynomial | $\Ext_E^*(X,X)=k[\tau_1,\tau_2]$ 的生成元度数；周期 3 | [验证] 全部"模 3 分岔"（$a=3m$、$-3m-1$、`(n+1)/3`）由此来；3 由 $s$ 消解长度 2+1 决定（$d_{i+2}$ 偏移），改动需同步 §5.1 末行 |
| $\mathcal H^a$ 支撑：$a=3m\ (m\ge0)$ 与 $a=-3m-1\ (m\ge1)$ | stable.tex e:all-degrees；`HomProfile.selfHom` 廓形 | 正端多项式 + 负端 Tate 对偶尾巴 $\mathcal H^{-3m-1}=D(\mathcal P_m)$ | [验证] **$-3m-1$ 不含 $-2$** 是 t:vanishing 在 $a=-2$ 成立的地基（$\ker\Delta^{-2}$ 源为 0）；若支撑含 $-2$，反例失败于 $\Ext^1$ |
| $\mathcal P_m$/$D\mathcal P_m$（$\tau$-幂像空间） | stable.tex；`xTwistHom_positive/negative` 的载体 | 扭转作用的对角块 | — |
| 扭转权重 $H^{-m}$（正端 $3m$）与 $H^{m+2}$（负端 $-3m-1$） | stable.tex e:twists；`XTwist_weight/XInverseTwist_weight` | $\Delta^a$ 矩阵两行的来源；$m+2$ 的"2" = 对偶平移 $-a-1$ 与度数差 3 的组合常数 | [推测] $m+2$ 若为 $m+1$，则 $\Delta^{-1}$ 权重变 $H_i^{1}$，$a=-1$ 处可逆性仍成立，不影响边界；但 $+2$ 实际由 $D\mathcal P_m$ 的自然缩放定死，非可调参数 |
| $h_H$：固定 $C$、乘 $DC$ 以 $H$ | introduction.tex:165；`Twisting/TwistHom`（`sigma q H hH`） | 唯一自由度干净的自同构族（特征 $\chi\sigma_H=\chi$ 保持） | [验证] 2.5.4(d) 已析：换成任意不固定 $C$ 的自同构，$\Res U$ 分解碎裂 |

## 5.3 bar/双模层（论文 §6）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| $W^a$ 支撑 $=\{-3,0\}$（各一维 $k$） | triangular.tex:11（$W^a=k$ for $a=-3,0$）；`MissingYProfile.profile` | 纤维长正合列的全部非零信息；$-3=(-1)\times 3$：$\deg\tau$ 的镜像 | [验证] $W^{-3}$ 一维 ⇒ $\mathcal V^{-2}\cong k$；$W$ 若多出支撑（如 $W^{-6}\ne0$），$\mathcal V^{-5}$ 等混入，$\mathcal V^a$ 廓形不再干净 [推测：$K$ 换模型会引入] |
| $Y$ 的自由求值度：$YX$ 代表 $(\mathcal J\otimes\mathcal J)[-1]$，即 $\cI[-1]$，$\cI=(c_5K)[5]$ | bimodule.tex（b:bar-model，"$N_0=c_5K$……Take $Y=N_4$"） | 把 Koszul 复形的"度 $-1$ 位移"焊进 $Y$ | [验证] 5 的选择只要求"越过消解长度 4"；[推测] 6 也行，一切平移；论文未称 5 最小 |
| 五步滤波 $N_0\to N_1\to\cdots\to N_4=Y$（$n\mapsto(a\mapsto an)$ 嵌入 $\Hom_k(E^e,N_r)$） | bimodule.tex（b:bar-model 末段） | 侧投射性的归纳机器（$E^e$ 对称 ⇒ 内射=投射） | 4=滤波长，由 $c_5$ 起算；无独立敏感度 |
| $\pd_{B^e}(E)\le 8=4+4$ | 2.5.4 步 5；Lean `DerivedDescent.restrictedBimoduleResolution_above (hn : 8 < n)` | b:evaluated-lift 中"限制到 $B^e$ 后 perfect"的界 | [验证] 两个 $\le4$（5.1 行）之和；任一侧变差 8 即破，$h_{H}$ 提升链断 |
| $\zeta=f^*\otimes f^*$、$b_0(1)=\zeta$ | bimodule.tex（b:evaluated-lift 步 3）；`Socle` 上游 | 对偶转置空间的非零见证 | — |
| $\eta:B\to DB$ 特征映射不可过 perfect 分解 | b:trace-obstruction；`StableLift.characterBimoduleMap_not_derived_perfect_factor` | 全链条的"障碍源"；消费 5.4 行迹零 | [验证] 若 $\eta$ 可分解，所有 $g_H$ 不存在，第 2、3 层同时蒸发 |

## 5.4 迹/角维数层（论文 §6 的代数核算）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| $2a_0+2a_1$ | **Lean** `Corner.trace_left_right_f`（Corner.lean:214）；论文侧为"每个角维数都是偶数"的陈述 | $\operatorname{tr}(\text{左}a\circ\text{右}f)$ 的显式值；特征 2 下恒 0（`trace_left_right_f_eq_zero`） | [验证] 值由 $C$ 表第 1,2 行对角贡献定死（$a_0$：$e\cdot f$ 通路、$a_1$：$f$-角）；换 $\pm$ 在特征 2 无意义；奇特征下 $=2(a_0+a_1)\ne0$——迹障碍失效 |
| $f=[0,1,0,\dots]$、$p_f=f\otimes f$、$P_{-1}=Ep_f$ | Corner.lean:206；triangular.tex:141-146 | socle 嵌入 $i_X(1)=\zeta$ 的落点；完全消解规格锚 | [验证] $p_f$ 幂等性由 $f^2=f$（表行 2 对角 1）；规格换角（用 $e$）则 $\zeta$ 不再是 socle 生成元（e:socle 失效） |
| $\chi_B(ac)$ 判别（$\rho(\zeta)=\chi_B$） | 2.5.4 步 6 | 从限制分解中抽出 $\eta$ 的投影 | — |

## 5.5 三角/Δ 层（论文 §7）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| 边界线 $a>0$ 或 $a\le-2$ | intro:112-115 (intro:profile) = tr:two-sided-vanishing | 转移原理假设的形状 | [验证] $-2$ 由 $-a-1$ 对偶（$a=1\leftrightarrow-2$）定死，一步不能松（1.3 已证）；$-1$ 允许非零（Remark t:neighboring-degrees） |
| $\Delta^a$ 矩阵 $\begin{pmatrix}H_1^{-m}&1\\H_2^{-m}&1\end{pmatrix}$ / $\begin{pmatrix}H_1^{m+2}&1\\H_2^{m+2}&1\end{pmatrix}$，$m\ge1$ | triangular.tex:84-92 | 可逆性=行列式 $H_1^w+H_2^w\ne0$ | [验证] 第一列 1 不可换位置（否则矩阵变 $\begin{pmatrix}1&r\\1&s\end{pmatrix}$ 同型——无实质变化）；两列若都带权重则条件变交叉比，代数独立不再充分 [推测] |
| $\mathcal V^{-2}=k,\ \mathcal V^0=kv_0,\ \mathcal V^1=0,\ \mathcal V^{-1}=k^2$ | triangular.tex:70-72, 282-283 | LES 夹逼的四个度数账 | [验证] 每个都来自 $W/\mathcal H$ 支撑的精确交集；$W^0$ 若二维则 $\mathcal V^0$ 非线、$v_0$ 不唯一、$\Delta^0$ 满射公式失效 |
| $H^a\End_\Lambda^\bullet(P_Z)=k\ (a=-1,0)$，其余 0 | t:neighboring-degrees | 全廓形定位（含"设计允许的 $-1$ 非零"） | $a=0$ 的 $k=\ker\Delta^0$=对角——即 $\operatorname{End}^s_\Lambda(Z)$ 是 $k$：$Z$ 不可分解的暗示（论文未直接说 [推测]） |
| $\Delta^{-1}$ 两行 $(H_i^2,1)$ | triangular.tex:284-285 | $a=-1$ 反转性（用 $m=0$ 权重 $H^2$） | 与 $m\ge1$ 条款共用引理；$H_i^2$ 互异来自 `H_powers_distinct 2` |
| $\Lambda$ 的 $\dim_k=800+\dim_kF$；$A=\Lambda\ltimes D\Lambda$ 加倍 | t:triangular-algebra + tr:transfer | 最终代数规模 | [验证] $\dim_kF$ 论文未算（≈ $400\cdot 2+\dim Y\cdot 400-\dim Y$ 级，[推测] 由 (t:fiber) 分裂性可算）；总维数最小性论文未述 |

## 5.6 转移/后果层（论文 §3、§8）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| $-a-1$（对偶指标） | intro:123；tr:negative-duality | 正 $\Ext^a$ ↔ 负 $H^{-a-1}$ 的换算表 | [验证] 全文最"物理常数"的数字：它单独决定边界 $-2$、Remark 的 $-1$ 自由度、以及 e:all-degrees 必须铺到所有负度 |
| $\ltimes$ 一次（非二次平凡扩张） | tr:transfer + 3.2 障碍 6 | 保持对称性的最低扩张次数 | [推测] 二次扩张按 Enomoto–Marczinzik 只给自内射目标；且多次扩张会让 $\Ext(M,M)$ 分解项数增加，消失账翻倍 |
| Mueller 位移 $\domdim\ge n+2$ | consequences.tex:38-40 | 消失 $1\le i\le n$ → 主导维 $n+2$ | [验证] 全部 $i$ 消失 ⇒ $\infty$；若只有 $i\le n_0$ 则 $\domdim=n_0+2$ 有限，五否定全断 |
| $C_n$（$n\ge1$ 逐度构造）、$C_0=\Gamma$、$C_n=\im(I^{n-1}\to I^n)$ | cor:finitistic 证明 | 小 finitistic $=\infty$ | 每 $n$ 一个 Witness；起点 $C_1$ 用 $\Gamma\not\cong$ 内射，与 5.6 行共享回推分裂 |
| $T_L$ 的 $n=L$（mirror-reflective 参数） | cor:stratifying 证明末句 "Taking $n=L$" | 任意长幂等分层 | Chen–Fang–Xi 机器的输入自由度，本文无敏感度 |
| "每个扩域 $K/k$" | cor:homological/cor:finitistic/cor:tilting-complements/cor:stratifying 首句 | 结论的基变换稳健性 | [验证] 由 (c:basechange) 与忠实平坦性；扩域后 $q,H_i$ 像仍满足同一族不等式（域嵌入） |

## 5.7 Lean 侧独有常数（论文无对应物）

| 值 | 位置 | 作用 | 敏感度 |
|---|---|---|---|
| `Abelian.Ext … (n+1)` vs `$i>0$` | Counterexample.lean:273-277 | 自然数索引 $\operatorname{Ext}^{n+1}$ 对应论文 $\Ext^i\ (i=n+1>0)$ | 纯换算；`counterexampleOf`/`transfer_of_completeHom_vanishing` 双侧 `omega` 缝合 |
| `Int.negSucc (n+2)` | Delta.lean:1011 区 | Lean ℤ 负数表示：$-(n+3)$——sourceDelta_negative 的度数参数化 | 编码噪声，无数学敏感度；取证时注意 `negSucc n = -(n+1)` 偏移 1 |
| `(n+1)/3`（整除） | Delta.lean:1006,1013 | 从度数恢复 $m$：$a=3m\Rightarrow m=(n+1)/3$ 的 Lean 形态 | 依赖整除性事实 $3\mid(n+1)$ 由构造保证 [验证：`sourceDelta_positive` 只在 $a\equiv0\bmod3$ 需权重条款] |
| `2 * a 0 + 2 * a 1` | Corner.lean:216 | 5.4 迹行的机器母本 | 特征 2 归零 |
| `Y.cover.rank` | Delta.lean:131 `fiberCover` | $Q$ 的具体秩（自由覆盖 Y 所需） | 论文"$E^e\otimes_kY$"的紧凑替代（秩更小）：合法，因为任意有限自由满射均可 |

**总账**：全文数值骨架可压缩为一句因果链——$|\tau|=3$（来自 $\pd_C s$ 的 2 步消解）决定支撑集 $\{3m\}\cup\{-3m-1\}$，$-a-1$ 对偶决定边界 $-2$，$W$ 支撑 $\{-3,0\}$ 与 $\mathcal H^{-2}=0$ 决定 $\mathcal V^{-2}=k$，双权重 $H^{\pm}$ 的互异性决定 $\Delta$ 可逆，特征 2 决定上述一切无符号且迹恒零。任何单点改动至少击穿一条上述链环 [推测]。

---

*（素材采集完毕：论文 §7–§8 与推论层、叙事时间线、Lean 31 模块取证、常数总表均已入档。）*






