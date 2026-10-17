# 《A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Characteristic Two》单篇素材

来源：论文 tex 源码（`E:\math\preprints\A-Counterexample-to-...\build\`，paper.tex + sections/01–06）、23 页思维链 summary（`E:\math\reasoning_traces\kaplansky-direct-finiteness-characteristic-two.pdf`）、Lean 形式化（`E:\math\lean\OAI\RingTheory\DirectFiniteness\`，126 文件 + `E:\math\lean\ComparatorChallenges\KaplanskyDirectFiniteness.json`）。公式按 tex 原样转写。标注 [推测] 的失败路线为基于文本证据的重构。

---

## 一、定理与构造总览

### 1.1 主定理精确陈述

论文主定理（`sections/01-introduction.tex`，Theorem 1.1）：

> There exist a finite field $K$ of characteristic two, a finitely presented group $G$ containing an element of odd prime order, and elements $a_{\mathrm{out}},b_{\mathrm{out}}\in K[G]$ such that
> $$a_{\mathrm{out}}b_{\mathrm{out}}=1,\qquad b_{\mathrm{out}}a_{\mathrm{out}}\ne1.$$
> The field, group, and finite sums are specified by a terminating prescription involving finite sets and finite-field arithmetic.

即：Kaplansky 直有限性猜想（对每个域 $K$、每个群 $G$，$ab=1\Rightarrow ba=1$）在特征 2 处被否证。推论：$K[G]$ 不稳定有限；$G$ 非不可对接（nonsofic，由 Elek–Szabó 的 sofic 群稳定有限性定理反证）；$G$ 非 surjunctive（由第六节的细胞自动机迁移直接给出 Gottschalk 猜想反例）。注意论文明确区分直有限与稳定有限：构造先造出矩阵级的失败 $AB=I\ne BA$，再通过有限群代数中的矩阵单位把矩阵代数嵌入更大的群代数得到**标量**输出——"Producing matrices $AB=I\ne BA$ over a group algebra does not by itself produce scalar elements with the same property."

### 1.2 特征 2 机制：$D=\ell+1$ 在系数域中为零的完整展开

设 $\ell$ 为奇素数， incidence 系统让每个点恰属于 $D=\ell+1$ 条线。三条约束同时成立：

$$\sum_{v\in V}x_vx_v^{\mathsf T}=-I_m,\qquad \sum_{v\in f}x_vx_v^{\mathsf T}=0\quad(f\in\mathcal F),\qquad \deg(v)=D\ \forall v.$$

把线恒等式对全体 $f\in\mathcal F$ 求和：每个点 $v$ 被计入 $D$ 次（正则性），故左边 $=D\cdot\sum_{v\in V}W_v$，其中 $W_v=x_vx_v^{\mathsf T}$。在特征 2 中 $D=\ell+1$ 是奇数加一、即偶数，而 $K$ 的特征是 2，所以 $(\ell+1)\cdot 1_K=0$，求和自动归零——与 $\sum_v W_v=-I_m\ne0$ **不矛盾**。论文 Remark 3.4 的原话："The simultaneous identities ... are compatible with regularity because $D=\ell+1$ is zero as a scalar in characteristic two. Summing the line identities multiplies the total point sum by $D$, rather than recovering that total point sum."

在特征 0 或任何 $D\ne0$ 的特征里，同一组恒等式立即自爆：$D\cdot(-I_m)=0\Rightarrow I_m=0$。summary §14 的 verbatim 证实了这个双计数检验是作者自审的关键：*"Our mod2 D divisible q ensures. Thus no lift. Positive characteristic essential."*（把权重提升到特征 0 的所有尝试都死于同一点；§21 再现："Thus characteristic-p identity inherently due D=0. p-adic lift must alter supports adding higher-order terms from nonlocal group elements."）

这正是"奇阶挠率 + 特征 2"的组合拳：$\ell$ 奇保证分母 $\kappa=\ell^2$、$\ell$、$|B|=\ell^m$ 在 $K$ 中可逆（子群平均 $P_v$、特征幂等元 $e$、坐标幂等 $p_i$ 都需要）；特征 2 保证正则度 $D$ 作为标量消失（线恒等式与全局配对共存）。两半缺一不可。

### 1.3 矩形分解 $UT=I_m$ 的来源

装配顺序（论文 §2–§3）：

1. **几何层**（§4 供应，§3 消费）： punctured affine space $V=\mathcal A\setminus O$ 上的正则高围长线族 $\mathcal F$ + 插值列向量 $x_v\in K^m$，给出两条配对恒等式。
2. **子群层**（§2a）：把 incidence 数据实现为群 $N$ 的有限子群 $K_v\cong(\mathbb Z/\ell)^2$、$L_f\cong(\mathbb Z/\ell)$，围长 12 保证嵌入。子群平均 $P_v=\kappa^{-1}\sum_{u\in K_v}u$ 是幂等元，且 $\sum_{u\in K_v}u=1+\sum_{f\ni v}(\sum_{u\in L_f}u-1)$。
3. **矩形层**（§3.1）：$U_{-,v}=-\kappa x_vP_v$（$m\times t$），$T_{v,-}=P_vx_v^{\mathsf T}$（$t\times m$），计算得 $UT=I_m$。
4. **打包层**（§3.2–3.3）：多重 HNN 扭转 + 特征幂等元把 $t$ 个中间坐标塞进 $m$ 个槽（鸽笼 $t\le m\ell^2$），得方阵 $a_{\rm mat}b_{\rm mat}=I_m$。
5. **缺陷层**（§3.4）：三明治 $J_0\Delta C=e(TU-P)$ 把逆运算拉回嵌入子群代数 $K[H]$，用标量特化 $\varepsilon$ 化为 $X^{\mathsf T}X-I_t\ne0$（秩论证 $t>m$）。
6. **标量层**（§3.5）：有限群 $F=(\mathbb Z/\ell)^m\rtimes S_m$ 的矩阵单位 $p_{ij}$ 给出代数嵌入 $\Phi:\Mat_m(K[L])\to K[G]$，$a_{\rm out}=1-f_{\rm blk}+\Phi(a_{\rm mat})$，$b_{\rm out}$ 同理；$a_{\rm out}b_{\rm out}=1$，$b_{\rm out}a_{\rm out}-1=\Phi(\Delta)\ne0$。

一句话总览：**"低次多项式在整条仿射线上求和为零"供应矩阵配对；"特征 2 让正则度 $D$ 消失"使配对与正则性兼容；"围长 12 + Euler 公式"保证局部子群在粘合中存活；"特征幂等元的正交性"完成矩形到方阵的打包；"$t>m$ 的秩论证"在嵌入子代数上侦测反向缺陷；"有限群矩阵单位"把方阵失败提升为标量失败。**

---

## 二、逐引理带批注重构

### 2.1 引理 3.1（index 单纯形上的插值）

**(a) 陈述**（tex 原样）：设 $Q$ 是阶为 $q$ 的域，元素枚举为 $a_0,\ldots,a_{q-1}$，$0\le d<q$。对 $n\ge1$，令
$$S_d=\{(a_{k_1},\ldots,a_{k_n}):\ k_i\ge0,\ \sum_i k_i\le d\}\subset Q^n.$$
则"在 $S_d$ 上取值"是从 $\{$全次数 $\le d$ 的多项式$\}$ 到 $Q^{S_d}$ 的同构。

**(b) 证明机制推导**：对每个指标元组 $k=(k_1,\ldots,k_n)$（$\sum k_i\le d$）造 Newton 骨架多项式
$$N_k(X_1,\ldots,X_n)=\prod_{i=1}^n\prod_{0\le u<k_i}(X_i-a_u).$$
在点 $j$ 处的取值：只要某个 $j_i<k_i$，乘积里含因子 $(a_{j_i}-a_u)=0$，故取值为 0。于是按字典序排列后，赋值矩阵对角线以下全为零——**三角化**。对角元为 $\prod_{i=1}^n\prod_{0\le u<k_i}(a_{k_i}-a_u)$：每个因子是不同域元素的差，非零。非对角元全零 + 对角非零 ⇒ 可逆。$|S_d|=\binom{d+n}{n}$ 恰为次数 $\le d$ 多项式空间维数，而条件 $d<q$ 保证坐标约束（$(X_i)^q-X_i$ 归零）不会进来。注意批注：这里用的是"下集"（lower set）而非全空间，因为后面只需要对 $S_{d_0}$（含孔洞候选集）上的插值，而 $|S_{d_0}|\approx q^n/(3^n n!)$ 远小于 $q^n$，使后面的密度估计成立。

**(c) 假设的机械理由**：$d<q$ 不可去——若 $d\ge q$，$X_i^q-X_i$ 在 $Q^n$ 上恒为零但作为多项式非零，赋值不再单射；枚举任意（无需特殊序）：三角论证对任何枚举成立，这正是后面 prescription 可以"任取枚举再取字典序最小"的原因。Lean 对应：`PolynomialPairing`/`simplexPoints a n ((q-2)/2)` + `simplex_density_bound`，枚举 $a:\mathrm{Fin}\ q\simeq Q$ 作为显式参数贯穿全部几何层。

**(d) 候选失败路线**：
- 用全空间 $Q^n$ 插值代替下集 $S_{d_0}$ [推测]：可行但孔洞选择空间变为 $2^{q^n}$，概率估计（Chebyshev、事件计数）里的 $|S|$ 因子失控，$(100\ldots)$ 类常数估计在 $q^{2402-88s}$ 型指数中崩塌。证据：论文刻意取 $S=S_{d_0}$ 并在 prescription 第(4)步只搜 $O\subset S$。
- 用单变量乘积结构（Vandermonde 的 $n$ 维直积）直接造对偶基 [推测]：可行，但$S_d$ 的"单纯形"形状与直积形状不同，求 $\sum_{v\in f}W_v$ 时需要对**任意**线上的限制次数封顶（$2d_0=q-2$），直积基的全次数不受控。证据：`DynFloater2014` 引用与"lower-set Newton interpolation"措辞。

### 2.2 引理 3.2（线和）

**(a) 陈述**：$n\ge1$。若 $P$ 是 $Q^n$ 上全次数 $\le q-2$ 的多项式，则 $P$ 在每条完整仿射 $Q$-线上的和为零；在 $Q^n$ 上的总和也为零。

**(b) 证明机制推导**：线的参数化把 $P$ 限制为一元多项式 $p(z)$，$\deg p\le q-2$。分三段：$\sum_{z\in Q}1=q=0$（特征 $p$、$|Q|=q$）；对 $1\le k<q-1$，$\mathbb F_q^\times$ 循环、阶 $q-1$，故存在 $c\in Q^\times$ 使 $c^k\ne1$；乘以 $c$ 是 $Q$ 的置换，所以
$$\sum_{z\in Q}z^k=\sum_{z\in Q}(cz)^k=c^k\sum_{z\in Q}z^k\ \Rightarrow\ (1-c^k)\sum_z z^k=0\ \Rightarrow\ \sum_z z^k=0.$$
整空间断言：$Q^n$ 按平行线族分块，每块和为零。批注：这条引理是整个构造的"求和引擎"——它把"低次"转化为"局部零和"，而 $2d_0=q-2$ 这个取值正是为了让 $W_v$ 的每个**元素**（即 $f_o(v)f_{o'}(v)$）次数 $\le 2d_0$ 卡在阈值上。

**(c) 假设的机械理由**：次数上界 $q-2$ 精确不可放松到 $q-1$：$\sum_z z^{q-1}=\sum_{z\ne0}1=q-1=1\ne0$。$q\ge4$（2 的幂）保证 $d_0\ge1$、非退化。Lean 对应：`sum_line_gram`、`sum_complement_gram`，直接对 $Q$ 是抽象特征 2 有限域的情形证明（`CharP Q 2`，用 `Fintype.card Q = q` 而非 $\mathbb F_q$ 的具体模型，保证对任意枚举/任意实现一致——`succeeds_217` 的 uniformity 正是 prescription 外层搜索需要的）。

**(d) 候选失败路线**：
- 只对单项式证、再对"支撑集小的多项式"求和 [推测]：低次多项式的单项式展开在限制到线后次数混合，中间步骤需要重新聚项，Lean 中对应处改用整体 `Polynomial` 求和后 `map_sum` 一次完成，绕开逐项归零。
- 用乘法特征（对 $Q^\times$ 求和的正交关系）代替平移论证 [推测]：特征 2 中 $-1=1$，复特征正交性失效；平移消去论证（乘 $c$ 置换）不依赖符号。证据：论文通篇避免任何需要 $-1\ne1$ 的论证，转写公式时上标 $\mathsf T$ 明确注明"without any involution on the coefficient field"。

### 2.3 命题 3.3（孔洞供应的配对）——$x_v$ 与 $-I_m$ 的诞生

**(a) 陈述**：$q\ge4$ 为 2 的幂，$Q=\mathbb F_q$，$n\ge1$，$d_0=(q-2)/2$，$S=S_{d_0}\subset\mathcal A=Q^n$，$N_{\rm pt}=q^n$。$\ell$ 奇素数，$D=\ell+1$。设 $O\subset S$，$\mathcal F$ 是含于 $V=\mathcal A\setminus O$ 的完整仿射线族，满足
$$\frac{2N_{\rm pt}}{D^2}\le |O|\le\frac{7N_{\rm pt}}{D^2},\tag{3.1}$$
每个 $v\in V$ 属于 $D$ 个成员、incidence 图围长 $\ge12$。$K$ 为含本原 $\ell$ 次根 $\zeta$ 的 $Q$ 的有限扩张。则 $m=|O|$、$t=|V|$，存在列 $x_v\in K^m$ 使
$$0<m<t\le m\ell^2,\qquad \sum_{v\in V}x_vx_v^{\mathsf T}=-I_m,\qquad \sum_{v\in f}x_vx_v^{\mathsf T}=0\ \ (f\in\mathcal F).$$

**(b) 证明机制推导**：对每个孔 $o\in O$，引理 3.1 给出唯一 $d_0$ 次多项式 $f_o$，其值在 $S$ 上是 $o$ 的指示函数。定义列向量
$$x_v=(f_o(v))_{o\in O}\in Q^m\subset K^m,\qquad W_v=x_vx_v^{\mathsf T}.$$
$W_v$ 的 $(o,o')$ 元是 $f_o(v)f_{o'}(v)$——全次数 $\le 2d_0=q-2$ 的多项式在 $v$ 的取值。于是引理 3.2 给出线零和与全局零和：$\sum_{v\in f}W_v=0$、$\sum_{v\in\mathcal A}W_v=0$。关键一步：在孔处 $f_{o'}(o)=\delta_{oo'}$（插值的定义），故 $x_o$ 是坐标单位向量、$W_o=e_oe_o^{\mathsf T}$，从而
$$\sum_{o\in O}W_o=I_m\quad\Rightarrow\quad \sum_{v\in V}W_v=\sum_{v\in\mathcal A}W_v-\sum_{o\in O}W_o=0-I_m=-I_m.$$
（特征 2 中 $-I_m=I_m$ 语义上相同，但保持 $-I_m$ 记号使特征 0 的"幽灵"可见——这正是不能提升的原因。）尺寸：$D\ge4\Rightarrow$ 上界 $7N_{\rm pt}/D^2<N_{\rm pt}/2$，故 $m<N_{\rm pt}/2$、$t=N_{\rm pt}-m>N_{\rm pt}/2>m$；且
$$\frac tm=\frac{N_{\rm pt}}m-1\le\frac{D^2}2-1\le(D-1)^2=\ell^2,$$
最后一步等价于 $(D-2)^2/2\ge0$。$t\le m\ell^2$ 就是后续打包的鸽笼预算。

**(c) 假设的机械理由**：$|O|$ 的下界 $2N_{\rm pt}/D^2$ 保证 $t/m\le\ell^2$（打包预算）；上界 $7N_{\rm pt}/D^2$ 保证 $m<t$（缺陷侦测预算）且 $m\ll N_{\rm pt}$（§4 概率估计中 $M=N_{\rm pt}/D^2\to\infty$ 且孔稀疏）。$O\subset S$：孔必须落在插值信息集里，否则 $f_o$ 不存在。$K\supset Q$ 含 $\zeta$：后续特征幂等元 $Q_\alpha,e$ 需要 $\zeta$，而 $x_v$ 本身只需 $Q$ 系数。Lean 对应：`complementMatrix a O : Matrix O {v // v ∉ O} K`，`complementMatrix_global`（$XX^{\mathsf T}=-1$）、`complementMatrix_local`（线上零和）——注意 Lean 的 $X$ 是 $|O|\times|V|$ 的"补矩阵"，行指标是孔、列指标是 $V$。

**(d) 候选失败路线**：
- 用删除点的**随机**函数值代替插值指示函数 [推测]：线零和需要次数 $\le q-2$ 结构，随机列没有该结构，$\sum_{v\in f}W_v$ 是随机矩阵而非 0，矩形恒等式 $UT=I_m$ 修不回来。证据：summary §11–12 多轮审查后固定"interpolation at the holes"方案。
- 让 $x_v\in Q^m$ 但在 $K$ 上补充 $\zeta$-扭曲坐标 [推测]：$W_v$ 的次数翻倍超 $q-2$，线和恒等式即死。这是"次数预算"不能挪用的直接体现。

### 2.4 粘合群 $N$ 的定义（§2a，未编号定义）

**(a) 定义**：对每个 $v\in V$ 取坐标副本 $K_v^0=(\mathbb F_\ell^2,+)$；对每个 $f\in\mathcal F$ 取 $L_f^0=(\mathbb F_\ell,+)$。因恰有 $\ell+1$ 条线过 $v$，取单射 $\iota_{vf}:L_f^0\to K_v^0$，其像为 $K_v^0$ 的 $\ell+1$ 个不同一维子空间。生成元 $s_{f,c}$（$f\in\mathcal F$，$0\ne c\in L_f^0$）；**定义关系**：对每个有符号字 $s_{f_1,c_1}^{\varepsilon_1}\cdots s_{f_k,c_k}^{\varepsilon_k}$，只要存在 $v\in V$ 属于所有 $f_i$ 且
$$\sum_{i=1}^k\varepsilon_i\iota_{vf_i}(c_i)=0\quad\text{in }K_v^0,$$
它就是定义关系。$N$ 为此表现给出的群。同构 $\theta_v:K_v^0\to N$ 由 $\theta_v(\iota_{vf}(c))=s_{f,c}$ 给出（非零元表达式唯一）；加法关系 $\theta_v(a)\theta_v(b)\theta_v(a+b)^{-1}$ 恰为定义关系。**有限表现化**：长度 $\le3$ 的局部零和关系子列表已表现同一个群（局部乘法表 + 逆关系可归约任意字）。

**(b) 机制推导**：$\theta_v$ 是良定义的同态，因为每个非零元有唯一表达式 $\iota_{vf}(c)$；"字 $\Rightarrow$ 关系"的归约：在一个 $K_v^0$ 内部，任何有符号字可逐步用长度 $\le3$ 关系折叠成其和的生成元。这个"局部折叠"性质后面在平面图中表现为白色顶点的度为 2 平衡。

**(c) 假设的机械理由**：$\ell+1$ 条线过 $v$ 对应 $(\mathbb Z/\ell)^2$ 恰有 $\ell+1$ 个一维子空间（每条含 $\ell-1$ 个非零元，$(\ell+1)(\ell-1)=\ell^2-1$ 恰好划分非零元）——这是**Fano 型划分**，是矩形恒等式 (2.7) 的组合引擎；围长条件暂不进入定义，只进入引理 2.2。Lean 对应：`GluedGroup`（生成元 `Generator ℓ`、关系 `relators`、`PointGroup ℓ = Multiplicative (Fin 2 → ZMod ℓ)`）、`ShortRelators`（长度 ≤3 子列表 + `N_shortEquiv`）、`IncidenceDirections.directionMap : Option K → K →ₗ[K] (Fin 2 → K)`（`none ↦ (0,c)`、`some a ↦ (c,a·c)`——把 $\ell+1$ 个方向参数化为 `Option (ZMod ℓ)`）。

**(d) 候选失败路线**：
- 只把 $K_v$ 粘到"共享 $L_f$"而非用共享生成元 [推测]：自由积再商的形式无法读出局部划分恒等式 (2.7)，子群平均的幂等性会在商中丢失；共享生成元 $s_{f,c}$ 让 $L_f$ **同时**落在每个 $K_v$ 内。
- 用 $\mathbb F_\ell^d$（$d\ge3$）作局部群 [推测]：方向数变为 $\ell^{d-1}+\cdots+\ell+1$，不再是 $D=\ell+1$ 与 incidence 正则度匹配；且 (2.7) 的划分需要每个非零元落在唯一一维子空间——任何 $d$ 都成立，但方向总数与 $\ell+1$ 的匹配断裂，$D=\ell+1=0$ 的特征 2 机制失效。

### 2.5 引理 2.2（嵌入引理：围长 12 ⇒ $\theta_v$ 单射）——论文的平面平衡图论证

**(a) 陈述**：若 $(V,\mathcal F)$ 的 incidence 图围长 $\ge12$，则每个同态 $\theta_v:K_v^0\to N$ 单射。等价地：没有生成元 $s_{f,c}$（$c\ne0$）在 $N$ 中死去。

**(b) 证明机制推导**（论文最长的初等论证，分四步）：

*第 1 步：字等式 ⇒ 平面带符号图。* 若 $s_{f,c}=1$，则该单字母字可经有限次"插入/删除连续定义关系"归约为空字（形式逆对 $uu^{-1}$ 本身是定义关系，故该合同就是群的等式）。把 successive words 画在水平层上，持久 token 用"保序导线"连接；插入块占据一条导线间的空隙，**无交叉**。每个被插入的 token $s_{i,y}^\varepsilon$ 有"诞生"与"消亡"两个顶点，在其生命周期导线上加一个白色顶点（标号 $i\in\mathcal F$），两侧边权 $\varepsilon y$ 与 $-\varepsilon y$；初始 token 以例外白色端点（标号 $f$）加边权 $-c$ 收尾。得有限平面二部多图：黑顶点标 $V$、白顶点标 $\mathcal F$，边权非零，且平衡条件
$$\sum_{a\ni x}\iota_{v,i(a)}(\omega(a))=0\ (\text{黑 }x),\qquad \sum_{a\ni y}\omega(a)=0\ (\text{普通白 }y),$$
只有**一个**例外白顶点和非零。取例外点的连通分支。

*第 2 步：极小化。* 在**所有**满足上述组合条件（标签、非零权、平衡、唯一例外）的连通平面二部多图中，按（顶点数，边数）字典序取极小。论文明确强调（summary §13 verbatim 也复述）："We do not require this comparison graph to come from a word reduction"——极小化在抽象组合类上进行，不限于归约图的像。Lean 对应：`PlanarBalance.Balanced` 结构体（`blackLabel/whiteLabel/weight/balances/exception`），极小化被"归约操作"（`Ribbon.mergeWhite`、`Ribbon.detach`、`VertexMerging`）直接在抽象层执行。

*第 3 步：消平行边、收缩同标签相邻邻居。* 平行边：同一 $L_i^0$、同一 $\iota_{vi}$，可加和成一条（或对消删除），平衡与例外和保持。度为 $\ge2$ 的顶点处，轮换相邻的两个邻居若同标签，则沿两邻边与空扇区作辅助弧并收缩——合并同色同标签顶点，各平衡在相应群里相加，例外和非零性不变（加的是零），顶点数严格减少，矛盾。

*第 4 步：度数/面长/Euler。* 由第 3 步，度 $\ge2$ 顶点处轮换相邻邻居标签互异。普通白顶点度 $\ne1$（权非零）；黑顶点度 $\ne1$（$\iota$ 单射）、度 $\ne2$（两个不同一维子空间中的非零向量之和为零不可能，`hind` 在 Lean 中即 `directionMap_independent`）。故黑度 $\ge3$、白度 $\ge2$（例外 $\ge1$）。面边界行走经度 $\ge2$ 顶点时无立即回折，其像在 incidence 图中是无回折闭行走 ⇒ 含圈 ⇒ 长 $\ge12$（桥的两侧分开计，至多一个度 1 例外白点只属一个面）。于是
$$n_{\rm b}\le\frac E3,\qquad n_{\rm w}\le\frac{E+1}2,\qquad n_{\rm f}\le\frac E6+1
\ \Rightarrow\ n_{\rm b}+n_{\rm w}+n_{\rm f}\le E+\frac32<E+2,$$
与连通平面图 Euler 公式矛盾。

**(c) 假设的机械理由**：围长 12 直接变成"面长 $\ge12$"，即 $n_{\rm f}\le E/6+1$。Euler 预算的精确核算：黑贡献 $1/3$、白贡献 $1/2$、面贡献 $1/6$，总计 $E$，富余 $3/2$，而 Euler 要求富余 $2$——**任何**面长 $<12$（比如 10）都会让 $n_f\le E/5+1$，预算超支，论证失败。这就是后面 §21 想把围长提到 14（面 $\ge14$、$n_f\le E/7$）换取双曲性的来源——那是富余方向的尝试，不是必要修改。例外白点的 $+1/2$ 与 $+1$ 恰好吃掉 $3/2$ 与 $2$ 之间的差——"even with the one exceptional vertex"。

**(d) 候选失败路线**：
- 用小消去（small cancellation）处理粘合关系 [推测]：零和关系 $\sum\varepsilon_i\iota_{vf_i}(c_i)=0$ 的长度不设界、片段重叠无 $C'(1/6)$ 结构；summary §12 记录曾用 Haefliger 非正曲率复形（link 围长 6/4/12、角 $\pi/3,\pi/2,\pi/6$），后因"replaced this route with a proposed planar balanced-diagram argument"放弃；Wise 的锐角多边形残余有限性定理要求 $\ge4$ 边，三角构造不可用（§17、§19、§20 反复核查）。
- 允许归约图非平面 [推测]：Euler 公式失效——summary §15 verbatim 正是这个恐慌："Could N actually be trivial despite planar argument due to non-planarity of reduction? Need scrutinize signed wires again."解法：极小化类是抽象平衡图（必然平面实现），不依赖归约图平面性。
- 在极小图中允许平行边或同标签相邻 [推测]：两者分别被"加和/删除仍保持例外和非零"与"收缩仍保持平衡类非空"封死；若例外点落在被删的平行边上，其和会归零，但例外和 $\ne0$ 由权的非零性保护（Lean 中 `weight_ne` + `exceptional_sum` 是结构体字段）。

### 2.6 定理 2.1（incidence 判据）——代数部分的输入输出契约

**(a) 陈述**：$\ell$ 奇素数，$K$ 特征 2 有限域含本原 $\ell$ 次根 $\zeta$，$\kappa=\ell^2$。$V$ 有限（$|V|=t$），$\mathcal F$ 为 $V$ 的非空子集族，每点恰属 $\ell+1$ 个成员，incidence 图围长 $\ge12$。设 $m$ 与列 $x_v\in K^m$ 满足
$$0<m<t\le m\kappa,\tag{2.1}$$
$$\sum_{v\in V}x_vx_v^{\mathsf T}=-I_m,\qquad \sum_{v\in f}x_vx_v^{\mathsf T}=0\ \ (f\in\mathcal F).\tag{2.2}$$
则存在有限表现群 $G$（含 $\ell$ 阶元）与 $a_{\rm out},b_{\rm out}\in K[G]$：$a_{\rm out}b_{\rm out}=1$、$b_{\rm out}a_{\rm out}\ne1$。

**(b) 机制**：论文明确分工："Incidence girth preserves the local subgroups, while Equation (2.2) produces a rectangular matrix identity. The upper bound $t\le m\kappa$ permits character packing into square matrices; the strict inequality $m<t$ then detects their reverse-product defect in an embedded subgroup algebra. An explicit finite group supplies matrix units."四条假设四个用途，一一对位。Lean 对应：`ChosenCriterion.products` 的显式假设列表 `hInc/hg/hlt/hglobal/hlocal/hα` 一一对应（`hlt : Fintype.card m < Fintype.card V`，`hglobal : X * Xᵀ = -1`，`hlocal : ∀ f i j, ∑ v ∈ Inc f, X i v * X j v = 0`，`hα : ∀ v w, v ≠ w → slot v = slot w → α v ≠ α w`）。

**(c) 注意**：判据层面已无几何——"All groups and group-algebra elements in its conclusion are constructed in this section and Section 3; no further geometric assumption enters."这使 §4 的概率构造可以独立审计。

**(d) 候选失败路线**：
- 把 $m<t$ 换成 $t\le m$ 并指望 packing 层自身出缺陷 [推测]：$X^{\mathsf T}X-I_t$ 可能恰好为零（$X$ 列满秩正交时），缺陷侦测需要 $m<t$ 的核非空；$t\le m$ 反向预算使鸽笼分配 $(s(v),\alpha_v)$ 也不够用。
- 不假设 $\zeta\in K$，改用 $K$ 的扩张做特征幂等再"拉回" [推测]：幂等元 $e$ 的中心性依赖 $z$ 在 $L$ 中居中、$\zeta\in K$ 保证 $K[L]$ 的直分解在原域上进行；扩张会把输出元素留在 $K'[G]$ 而 $K[G]$ 中可能无缺陷（缺陷元素不在子代数中）。证据：prescription 第(2)步把 $K$ 直接造成 $\deg=h(\ell-1)$，一步到位。

### 2.7 子群平均与矩形恒等式（§3.1，式 3.2–3.5）

**(a) 定义与陈述**：$P_v=\kappa^{-1}\sum_{u\in K_v}u\in K[N]$；$W_v=x_vx_v^{\mathsf T}$；
$$U\in\Mat_{m\times t}(K[N]),\quad T\in\Mat_{t\times m}(K[N]),\quad U_{-,v}=-\kappa x_vP_v,\quad T_{v,-}=P_vx_v^{\mathsf T},\quad P=\diag_{v\in V}(P_v).$$
结论：$UP=U,\ PT=T,\ UT=I_m$。

**(b) 证明机制推导（写到中间步骤）**：
- *幂等*：$P_v^2=\kappa^{-2}\sum_{u,u'\in K_v}uu'$；对每个 $w\in K_v$，方程 $uu'=w$ 恰有 $\kappa=|K_v|$ 组解（固定 $u$ 得 $u'=u^{-1}w$——注意这里 $K_v$ 是加法群写成乘法记号！$uu'$ 指**群的乘法**即坐标加法），故 $P_v^2=\kappa^{-2}\kappa\sum_w w=P_v$。$\kappa=\ell^2$ 奇 ⇒ 在 $K$ 中可逆。
- *局部划分*：过 $v$ 的 $\ell+1$ 个 $L_f$ 的一维子空间像划分 $K_v\setminus\{1\}$：
  $$\sum_{u\in K_v}u=1+\sum_{f\ni v}\Big(\sum_{u\in L_f}u-1\Big).\tag{3.3}$$
  这是 $K_v$ 内部恒等式，"no assertion about intersections between different $K_v$ is needed"。
- *主计算*：$x_v$ 系数在域里、与群代数交换。逐列算 $UT$：$U$ 的第 $v$ 列是 $-\kappa x_vP_v$，$T$ 的第 $v$ 行是 $P_vx_v^{\mathsf T}$，
  $$UT=-\kappa\sum_{v\in V}x_vx_v^{\mathsf T}P_v^2\overset{P_v^2=P_v}=-\kappa\sum_{v\in V}W_vP_v=-\sum_{v\in V}W_v\sum_{u\in K_v}u.$$
  代入 (3.3)：
  $$UT=-\sum_{v\in V}W_v-\sum_{v\in V}\sum_{f\ni v}W_v\Big(\sum_{u\in L_f}u-1\Big)\overset{\text{交换求和}}=-\sum_{v\in V}W_v-\sum_{f\in\mathcal F}\Big(\sum_{v\in f}W_v\Big)\Big(\sum_{u\in L_f}u-1\Big)=I_m,$$
  末步用 (2.2)：两项分别为 $-(-I_m)=I_m$ 与 $0$。
- *吸收*：$UP=U$、$PT=T$ 由 $P_v^2=P_v$ 逐块立得——这两个等式在打包层重复使用。

**(c) 假设的机械理由**：$-\kappa$ 的符号在特征 2 中消失（$-\kappa=\kappa=1$ in $K$，因为 $\ell$ 奇 ⇒ $\ell\equiv1\bmod2$ ⇒ $\ell^2\equiv1$），但保留 $-\kappa$ 使公式在任意特征下形式正确、并让 $\varepsilon(U)=X$ 的特化计算干净。$P_v$ 用 $\kappa^{-1}$ 而非 $|K_v|^{-1}$ 记号强调"奇 ⇒ 可逆"。若 $\ell=2$：$\kappa=4=0$ in $K$，$P_v$ 无定义；这正是"奇阶挠率"必要性的代数现身点。Lean 对应：`subgroup_decomposition`、`CharacterTwist.P v = f(∑_a single (ι v a) 1)`、`hdec`——注意 Lean 中 $P$ 由 `pushed (localHom v) 1`（平凡特征的平均投影）实现，幂等/划分恒等式在 `CharacterIdempotents`/`GluedGroup` 层证明。

**(d) 候选失败路线**：
- 用 $P_v$ 的"谱分解"（把 $K_v$ 的正则表示对角化）代替划分恒等式 [推测]：需要对 $\ell^2$ 个不可约特征求和，特征 2 中群代数 $K[K_v]$ 半单（$\ell\nmid\ell^2$，Maschke 成立！），但分块对应 $\F_\ell^2$ 的加法特征需要 $\zeta$ 逐个出现，计算量爆炸且 $UT$ 的"线项自动归零"结构被掩盖。证据：论文用 (3.3) 的三元划分恒等式，一次求和交换即完成。
- 把 $T_{v,-}$ 取成 $P_vx_v^{\mathsf T}P_v$ [推测]：$PT=T$ 要求 $T$ 只带左 $P_v$；右乘多余 $P$ 会破坏 $UT$ 中 $P_v^2=P_v$ 的吸收位置，$UT$ 变成 $-\sum W_vP_v(\cdots)P_v'$ 型混合项，线归零不再按 $f$ 分组。

### 2.8 特征扭转的群扩张 $L$（§3.2）

**(a) 定义**：$z$ 生成 $\ell$ 阶循环群，$H=N\times\langle z\rangle$。取定 $v_*$ 与 $K_*=K_{v_*}$；$\phi_v:K_v\to K_*$ 为坐标同构。$K_*$ 上恰有 $\kappa=\ell^2$ 个线性型；由 $t\le m\ell^2$ 可指定 $(s(v),\alpha_v)\in\{1,\ldots,m\}\times(\F_\ell^2)^*$ 两两不同（同槽内 $\alpha_v$ 必互异）。对每个 $v$ 加稳定字母 $\tau_v$，关系
$$\tau_v(uz^r)\tau_v^{-1}=\phi_v(u)\,z^{r+\alpha_v(\phi_v(u))}\qquad(u\in K_v,\ r\in\mathbb Z/\ell).\tag{3.6}$$
$L$ 为所得群。中心幂等元与局部特征幂等元：
$$e=\ell^{-1}\sum_{r=0}^{\ell-1}\zeta^{-r}z^r\in K[L]\ (ez=\zeta e,\ e^2=e,\ \text{恒等系数 }=\ell^{-1}\ne0),\tag{3.7}$$
$$Q_\alpha=\kappa^{-1}\sum_{u\in K_*}\zeta^{\alpha(u)}u,\qquad Q_\alpha Q_\beta=\begin{cases}Q_\alpha,&\alpha=\beta,\\0,&\alpha\ne\beta,\end{cases}\tag{3.8, 3.9}$$
以及扭转投影
$$\tau_veP_v\tau_v^{-1}=eQ_{\alpha_v}.\tag{3.10}$$

**(b) 证明机制推导**：
- *$\psi_v$ 是同构*：$\psi_v(uz^r)=\phi_v(u)z^{r+\alpha_v(\phi_v(u))}$；逆为 $wz^r\mapsto\phi_v^{-1}(w)z^{r-\alpha_v(w)}$——扭转变换是"半直积式的仿射提升"，指数部分的 $\alpha_v$ 是从 $K_v$ 到 $\langle z\rangle$ 的同态（经 $\F_\ell$ 指数群），乘法保持性靠 $(r+\alpha(a))+(\alpha(b))=r+\alpha(ab)$。
- *$H\hookrightarrow L$ 的嵌入证书（论文路线）*：让 $H$ 左作用于自身；限制到 $\psi_v$ 的定义域/像子群（均 $\ell^3$ 阶），都是正则作用的 копий。把两者的轨道配对（$H$ 有限时各 $|H|/\ell^3$ 条；无限时可数无穷多条），选代表 $h_i,k_i$，令 $F_v(ah_i)=\psi_v(a)k_i$——这是 $H$ 上置换，共轭左乘 $a$ 到左乘 $\psi_v(a)$。各 $\tau_v$ 独立指定，因为"no defining relation couples two distinct stable letters"。于是 $L$ 有一个在 $H$ 上忠实的作用 ⇒ $H\le L$ ⇒ $K[H]\subseteq K[L]$。Lean 对应：`MultiHNN.of_injective` 走的是另一条路——**有限部分实现**（`finite_partial_realization`，用 Finset 归纳逐个加 Mathlib 的单 HNN 扩张 `HNNExtension.of`，空集时用 `ULift H` 垫底），再用泛性质 `lift` 把两个嵌入粘合成 $L$ 的作用。两条路证明同一件事；Lean 的评论注明 "Mathlib's complete Britton-lemma proof supplies the embedding at each step"。
- *$Q_\alpha$ 正交性*：$Q_\alpha Q_\beta$ 中 $w$ 的系数为 $\kappa^{-2}\zeta^{\beta(w)}\sum_{u\in K_*}\zeta^{\alpha(u)-\beta(u)}$。$\alpha=\beta$：内和 $=\kappa$。$\alpha\ne\beta$：取 $u_0$ 使 $\zeta^{\alpha(u_0)-\beta(u_0)}\ne1$；平移 $u\mapsto u+u_0$ 使内和乘以该标量而集合不变 ⇒ 内和 $=0$。这是有限域上的标准"几何级数"论证，特征 2 友好（不需要 $-1\ne1$）。
- *扭转投影*：$\tau_veP_v\tau_v^{-1}$：把 (3.6) 逐项共轭，$e$ 从中间穿过（$ez^r=\zeta^re$ 且 $e$ 中心），$\sum_u e\phi_v(u)z^{\alpha_v(\phi_v(u))}=\kappa\, eQ_{\alpha_v}$，系数 $\kappa^{-1}$ 相消。

**(c) 假设的机械理由**：$z$ 的中心性由两条关系链保证：取 $u=1$ 得 $\tau_v z\tau_v^{-1}=z$（$\alpha_v$ 在 $u=1$ 时为 0）；$z$ 在 $H$ 中本就中心。$\alpha_v$ 只定义在 $K_*$ 上、经 $\phi_v$ 拉回——不同 $v$ 用不同 $\alpha_v$ 才能在同槽内正交（$hα$）。$\ell^{-1}$、$\kappa^{-1}$ 都存在（$\ell$ 奇）。指数 $r+\alpha_v(\cdots)$ 在 $\mathbb Z/\ell$ 中读数。

**(d) 候选失败路线**：
- 让 $\tau_v$ 共轭 $K_v$ 直接进 $K_*$（不带 $z$-扭转）[推测]：则 $\tau_veP_v\tau_v^{-1}=eQ_0$ 对所有 $v$ 相同，同槽两个坐标的交叉项 $eQ_0eQ_0=eQ_0\ne0$，$J_0C=eP$ 失败——**正交性预算** $(s,\alpha)$ 恰好是为制造互异 $\alpha_v$ 而设。证据：summary §11–12 中"character twists in HNN extensions"反复与 packing 配对出现。
- 用有限多个 HNN 的**同步**嵌入定理（如直接对 coproduct 商证明 Britton 型引理）[推测]：论文自己给了置换表示证书绕开；Lean 的 `finite_partial_realization` 显示逐个 HNN（每次保持单射）同样够用且可形式化， homemade `MultiHNN` 用 `conGen` 商 + 泛性质即可，无需完整多稳定字母 Britton 引理。
- 把 $e$ 放进 $K[H]$ 的分解式而非 $K[L]$ [推测]：$e$ 需要 $z$ 与 $\tau_v$ 的交换性才能穿过共轭；在 $K[H]$ 中定义则 $\tau_veP_v\tau_v^{-1}$ 里的 $e$ 无法移出共轭，(3.10) 失效。

### 2.9 打包成方阵（§3.3）：$J_0C=eP$ 与 $a_{\rm mat}b_{\rm mat}=I_m$

**(a) 定义与陈述**：
$$C_{s,v}=\begin{cases}\tau_veP_v,&s=s(v),\\0,&s\ne s(v),\end{cases}\qquad (J_0)_{v,s}=\begin{cases}eP_v\tau_v^{-1},&s=s(v),\\0,&s\ne s(v),\end{cases}\tag{3.11}$$
$$J_0C=eP,\tag{3.12}$$
$$a_{\rm mat}=UJ_0+(1-e)I_m,\qquad b_{\rm mat}=CT+(1-e)I_m,\tag{3.13}$$
$$a_{\rm mat}b_{\rm mat}=U(eP)T+(1-e)I_m=eI_m+(1-e)I_m=I_m.\tag{3.14}$$

**(b) 证明机制推导**：
- *$J_0C=eP$ 逐项核验*：$(J_0C)$ 的 $(v,w)$ 元非零仅当 $s(v)=s(w)$。$v=w$：对角元 $eP_v\tau_v^{-1}\tau_veP_v=eP_v^2=eP_v$ ✓。$v\ne w$ 同槽：用 (3.10) 改写
  $$eP_v\tau_v^{-1}\tau_weP_w=\tau_v^{-1}(\tau_veP_v\tau_v^{-1})\tau_weP_w=\tau_v^{-1}eQ_{\alpha_v}eQ_{\alpha_w}\tau_w=0,$$
  因为 $\alpha_v\ne\alpha_w$（同槽内互异正是打包预算 $t\le m\ell^2$ 买到的东西）。$eQ_\alpha eQ_\beta=eQ_\alpha Q_\beta$ 用 $e$ 的中心性。
- *前向乘积*：$C,J_0$ 的每个非零元都含中心因子 $e$，故 $(1-e)$ 与一切交叉项相消：$(1-e)\cdot eX=eX-e^2X=0$。于是
  $$a_{\rm mat}b_{\rm mat}=(UJ_0)(CT)+(1-e)I_m=U(J_0C)T+(1-e)I_m=U(eP)T+(1-e)I_m,$$
  再用 $UP=U,\ PT=T$：$U(eP)T=e(UP)T=eUT=eI_m$。

**(c) 假设的机械理由**：$C$ 的行按槽分组、每槽只留一个"入口"（$s(v)$ 对应列）；$J_0$ 转置对称地按槽分"出口"。槽内正交由 (3.9)，槽间零由支撑不相交。$(1-e)I_m$ 项是让方阵乘积凑出 $I_m$ 的"补身份"——它就是 Dykema–Juschenko 有限因子归约的思想在方阵层的预演。Lean 对应：`CharacterTwist.aMatrix/bMatrix` 与 `CharacterTwist.matrix_products`；$P$ 记为 `CharacterTwist.P v`，$e$ 相关公式在 `CharacterIdempotents`（`projector`、`pushed`、`pushed_idempotent`、`pushed_orthogonal`、`projector_one_coeff = |A|⁻¹` 保证非零）。

**(d) 候选失败路线**：
- 一个槽放两个坐标但共用同一 $\alpha$ [推测]：交叉项 $eQ_\alpha eQ_\alpha=eQ_\alpha\ne0$，$J_0C$ 变成"对角 + 槽内满块"，$U(eP)T\ne eI_m$，前向恒等式死。
- 把 $(1-e)I_m$ 省略 [推测]：$a_{\rm mat}b_{\rm mat}=eI_m\ne I_m$（$e\ne1$），得到的是"在 $e$-块内的一侧逆"，方阵层即失败；补身份项正是把 $e$-块的缺陷"填平"到全单位阵的装置，而缺陷最终在 $b_{\rm mat}a_{\rm mat}$ 侧重新露出（见 2.10）。

### 2.10 反向缺陷的侦测（§3.4）：三明治与秩论证

**(a) 陈述**：$\Delta=b_{\rm mat}a_{\rm mat}-I_m$。直接乘法给出 $\Delta=CTUJ_0-eI_m$，且
$$J_0\Delta C=(eP)TU(eP)-eP=e(TU-P).\tag{3.15}$$
（顺序要点：$(eP)TU(eP)=e(PT)(UP)=eTU$。）取标量特化
$$\varepsilon:K[H]\to K,\qquad \varepsilon(nz^r)=\zeta^r\quad(n\in N),\tag{3.16}$$
它把 $e\mapsto1$、$P_v\mapsto1$。设 $X\in\Mat_{m\times t}(K)$ 列为 $x_v$。因特征 2 且 $\kappa$ 奇：
$$\varepsilon(U)=X,\qquad \varepsilon(T)=X^{\mathsf T},\qquad XX^{\mathsf T}=I_m,\tag{3.17}$$
$$\varepsilon\bigl(e(TU-P)\bigr)=X^{\mathsf T}X-I_t.\tag{3.18}$$
由 $t>m$ 取 $0\ne y\in\ker X$：$\varepsilon(e(TU-P))y=-y\ne0$（式 3.19）。显式见证：$I_t-X^{\mathsf T}X$ 的第一个非零列——该矩阵非零因 $\rank(X^{\mathsf T}X)\le m<t$，且 $X(I_t-X^{\mathsf T}X)=0$。结论：$e(TU-P)\ne0$ in $\Mat_t(K[H])$ ⇒ $\Delta\ne0$ in $\Mat_m(K[L])$。

**(b) 证明机制推导**：
- *$\Delta=CTUJ_0-eI_m$ 的展开*：$b_{\rm mat}a_{\rm mat}=CTUJ_0+CT(1-e)J_0+(1-e)CTJ_0+(1-e)I_m$。$CT$ 的元含 $e$（来自 $C$），$J_0$ 的元含 $e$，故 $(1-e)$ 的两个交叉项各为 $(1-e)e(\cdots)=0$。
- *三明治*：$J_0CTUJ_0C=(J_0C)TU(J_0C)=(eP)TU(eP)$；$e$ 中心 + $PT=T,UP=U$ ⇒ $=eTU$；$eJ_0C=e^2P=eP$。
- *特化的良定义*：$H=N\times\langle z\rangle$ 是直积，$nz^r$ 表达唯一；$\varepsilon$ 就是"沿 $N$ 增广、沿 $\langle z\rangle$ 取 $\zeta$-特征"的代数同态。$\varepsilon(P_v)=\kappa^{-1}\sum_{u\in K_v}\zeta^0=\kappa^{-1}\kappa=1$。
- *$\varepsilon(U)=X$ 的符号机制*：$\varepsilon(U_{-,v})=-\kappa x_v\varepsilon(P_v)=-\kappa x_v$；$\kappa$ 奇 ⇒ $\kappa\bmod2=1$ in $K$；特征 2 ⇒ $-1=1$ ⇒ $-\kappa=1$。两个独立原因（奇性 + 特征 2）合成"前系数消失"，这正是构造对参数组合的精确依赖。
- *秩论证*：$\rank(X^{\mathsf T}X)\le\rank X\le m<t$ ⇒ $I_t-X^{\mathsf T}X\ne0$；而 $X(I_t-X^{\mathsf T}X)=XX^{\mathsf T}X-X=X-X=0$（用 $XX^{\mathsf T}=I_m$）——列在 $\ker X$ 中。注意 $XX^{\mathsf T}=I_m$ 是 (2.2) 的全局恒等式在特征 2 下的改写（$-I_m=I_m$），Lean 里 `hglobal` 经 `CharTwo.neg_eq` 直接重写成 `X*X.transpose=1`。

**(c) 假设的机械理由**：特化 $\varepsilon$ **只用在** $K[H]$ 上："The homomorphism $\varepsilon$ has been applied only to elements of $K[H]$; no extension of it to $K[L]$ is used."——$\varepsilon$ 不保持在 $\tau_v$ 共轭下相容，扩展到 $K[L]$ 根本不是同态。$t>m$ 是缺陷存在的唯一来源；$XX^{\mathsf T}=I_m$（而非某别的可逆阵）保证 $I_t-X^{\mathsf T}X$ 的列确实是核向量。

**(d) 候选失败路线**：
- 直接在 $K[L]$ 中给 $\Delta$ 找非零系数 [推测]：$\Delta$ 的群基系数涉及稳定字母 $\tau_v$ 的字等价问题，"unproved word equalities"不可依赖——论文强调 certificates 独立于字问题的判定程序；三明治 + 子群特化正是绕开它的设计。Lean 对应：`CharacterTwist.matrix_products` 中 $b*a\ne1$ 的证明链通过 `hξ1 : ξ ≠ 1`（特征单射性 `cyclicCharacter_injective`）而非任何群字计算。
- 用 $X^{\mathsf T}X$ 的行列式/迹论证 [推测]：特征 2 中无序、无正定；迹是卷积循环类信息（summary §6 verbatim："This yields Hattori trace over conjugacy class as expected. Want individual h not sum."），只能证明"不全是零"，给不出具体非零元；秩 + 核向量给出**可计算的**见证（prescription 第 4 步可用有限域线性代数执行）。
- 把 $\varepsilon$ 换成增广理想商 $\varepsilon_0(nz^r)=r$ 型映射 [推测]：$z$-特征缺失则 $e\mapsto\ell^{-1}\sum 1=1$ 仍成立，但 $Q_\alpha$ 的正交结构在特化后全并成 1，$e(TU-P)$ 的像会丢失 $X^{\mathsf T}X$ 的矩阵结构（$U,T$ 的 $\zeta$-相位消失，变成 $\sum$ 型退化），缺陷可能被特化抹平为 0。

### 2.11 从矩阵到两个群代数元素（§3.5）：有限辅助群与矩阵单位

**(a) 定义与陈述**：$B=(\mathbb Z/\ell)^m$，$F=B\rtimes S_m$（$S_m$ 置换坐标）；
$$p_i=|B|^{-1}\sum_{w\in B}\zeta^{-w_i}w\in K[F],\qquad p_{ij}=\sigma_ip_1\sigma_j^{-1}\ (\sigma_i\in S_m \text{ 交换坐标 }1,i,\ \sigma_1=1),\tag{3.20, 3.22}$$
$$p_{ij}p_{kr}=\delta_{jk}p_{ir},\tag{3.23}$$
$G=L\times F$，$f_{\rm blk}=\sum_ip_{ii}$，$\Phi:\Mat_m(K[L])\to K[G]$，$\Phi(Z)=\sum_{i,j}Z_{ij}p_{ij}$，且
$$\boxed{\ a_{\rm out}=1-f_{\rm blk}+\sum_{i,j}\bigl((UJ_0)_{ij}+(1-e)\delta_{ij}\bigr)p_{ij},\quad b_{\rm out}=1-f_{\rm blk}+\sum_{i,j}\bigl((CT)_{ij}+(1-e)\delta_{ij}\bigr)p_{ij}.\ }\tag{3.25}$$
$a_{\rm out}b_{\rm out}=1-f_{\rm blk}+\Phi(I_m)=1$；$b_{\rm out}a_{\rm out}-1=\Phi(\Delta)\ne0$（$\Phi$ 单射）。

**(b) 证明机制推导**：
- *$p_i$ 正交幂等*：与 (3.9) 同一个特征和论证搬到 $B$：$p_ip_j$ 的 $w$-系数含 $\sum_{u}\zeta^{-u_i}\zeta^{u_j}$ 型和，$i\ne j$ 时线性型 $w\mapsto w_j-w_i$ 非零，平移消去 ⇒ 0。$p_i\ne0$ 因恒等系数 $|B|^{-1}$ 存在——**只需 $|B|=\ell^m$ 奇，从不需要 $|S_m|^{-1}$**（$S_m$ 只以共轭身份出场）。
- *矩阵单位律*：$p_ip_{ij}p_j=p_{ij}$（直接消去 $\sigma_ip_1^2\sigma_j^{-1}$）；$j\ne k$ 时 $p_{ij}p_{kr}=0$（$p_{ij}p_{kr}=\sigma_ip_1\sigma_j^{-1}\sigma_kp_1\sigma_r^{-1}$，中间 $p_1\sigma_j^{-1}\sigma_kp_1$：若 $j\ne k$，$\sigma_j^{-1}\sigma_k\ne1$ 且共轭把 $p_1$ 移到 $p_{j^{-1}k}\ne p_1$，与 $p_1$ 正交 ⇒ 0）。线性无关：左乘 $p_i$、右乘 $p_j$ 抽出 $p_{ij}$ 的系数。
- *$\Phi$ 单射*：$K[L\times F]\cong K[L]\otimes_K K[F]$（群基分解）；若 $\Phi(Z)=0$，把 $Z_{ij}=\sum_{g\in L}c_{ij,g}g$ 展开，按 $L$-基元素 $g$ 分组比较得 $\sum_{i,j}c_{ij,g}p_{ij}=0$，由线性无关逐个清零。
- *补身份机制*：$f_{\rm blk}^2=f_{\rm blk}$，$f_{\rm blk}\Phi(Z)=\Phi(Z)$；$1-f_{\rm blk}$ 两侧零化 $\Phi$ 的像。$a_{\rm out}b_{\rm out}=(1-f_{\rm blk})+\Phi(a_{\rm mat}b_{\rm mat})=(1-f_{\rm blk})+\Phi(I_m)=1-f_{\rm blk}+f_{\rm blk}=1$。

**(c) 假设的机械理由**：$F$ 有限但**不用** $|S_m|$ 可逆——因为 $S_m$ 的元素在 $K[F]$ 里是群基元素而非被平均的对象；平均只发生在交换群 $B$ 上（坐标特征 $\zeta^{-w_i}$）。$F$ 的作用是把 $\Mat_m(K[L])$ 实现为 $K[G]$ 的幂等角 $f_{\rm blk}K[G]f_{\rm blk}$：这是 Dykema–Juschenko [Theorem 2.2] 归约的显式实例。论文最后强调："the last step does not infer stable finiteness from direct finiteness for an arbitrary ring: it uses the explicit finite group $F$ and the injective map $\Phi$"。Lean 对应：`FiniteBlock.Auxiliary m C = SemidirectProduct (m → C) (Equiv.Perm m) permAction`，$C=$ `Multiplicative (ZMod ℓ)`；`p ξ i = pushed SemidirectProduct.inl (coordinate ξ i)`；`permElt` 给 $\sigma_i$；`translated : permElt σ * p i * permElt σ⁻¹ = p (σ i)`；`ScalarFormulas.output a = 1 - block f q 1 + block f q X` 与 `output_products`（用 `hc : card (m → C) ≠ 0` 与 `hξ : ξ ≠ 1`）。

**(d) 候选失败路线**：
- 用 $\Mat_m$ 直接等于 $K[F']$ 的子代数而取 $F'$ 为含 $m$ 阶元的大群并平均整个 $|F'|$ [推测]：$|S_m|$ 有偶因子，$K$ 特征 2 中 $|S_m|^{-1}$ 不存在，平均幂等无法定义——这就是为什么用 $(\mathbb Z/\ell)^m$ 的**坐标特征**而非群平均来造对角幂等。
- 跳过 $F$，直接把 $a_{\rm mat}$ 的 $m\times m$ 元素堆成一个有限和（如 $\sum_{ij}(a_{\rm mat})_{ij}g_{ij}$）[推测]：没有矩阵单位律，乘法封闭性丧失，$a_{\rm out}b_{\rm out}$ 的展开出现不受控交叉项；$\Phi$ 的可乘性恰恰是 $p_{ij}p_{kr}=\delta_{jk}p_{ir}$。
- 取 $F=B\rtimes S_m$ 的某真商群 [推测]：$\sigma_i$ 的共轭作用需自由（$p_1$ 的 $S_m$-轨道给出互异 $p_i$），商并轨道会破坏线性无关计数。

### 2.12 有限表现与奇挠率的保留（§3.6）

**(a) 陈述与机制**：$N$ 的有限表现 = 生成元 $\mathcal S_N$ + 长度 $\le3$ 局部零和关系 $\mathcal R_N$。$H$ 的表现：加 $z$、$z^\ell$、$[z,s]$。$L$ 的表现：在 $H$ 上加 $|V|$ 个稳定字母与 $\le|V|\ell^3$ 个关系 (3.6)（指标 $v\times u\times r$；$u$ 用局部生成元代表，恒等元用空字）。$F$ 有限 ⇒ 乘法表给有限表现；$G=L\times F$ = 两因子表现 + 全部交换子。嵌入链 $K_v\le N\le H\le L\le G$，$K_v\cong(\F_\ell^2,+)$ 的非恒等元都是 $\ell$ 阶 ⇒ $G$ 含奇素数阶元。

**(b) 批注**：表现追踪只需要"添加生成元/关系"的计数，嵌入证书（置换表示）不进入表现——"its choices do not add generators or relators"。Lean 对应：`PrescribedPresentation.prescribed_finitelyPresented`（`N_shortEquiv` 把 `PresentedGroup shortRelators` 与 `AssignedDevelopment.Base` 等同；`CurrentMain.characterTwist_finitelyPresented` + `finitelyPresented_prod`）、`ChosenCriterion.groupFG`、`OddTorsion`。

**(c) 失败路线** [推测]：用无限表现然后指望"有限生成 ⇒ 有限表现"——不成立；论文用长度 ≤3 的局部关系子列表把无限关系系统有限化，靠的是局部折叠归约（2.4）。若该归约失败（局部关系的组合不足以推出全部定义关系），$N$ 的有限表现与 $L$ 的关系计数都塌。Lean 的 `ShortRelators`/`GluedGroup.shortEquiv` 正是形式化这一步。

### 2.13 定理 4.1（正则高围长仿射线系的存在性）——几何层总装

**(a) 陈述**：$q=2^h$，$\ell$ 为最小素数 $\equiv-1\pmod{q^{100}}$（Linnik：$\ell\le cq^{100L}$）；$D=\ell+1$，$s=\lfloor\log_qD\rfloor$，$b=s+20$，$n=10b$，$N_{\rm pt}=q^n$。则 $q^{100}\mid D$、$s\ge100$、$s$ 一致有界；对充分大 $h$，存在 $O\subset S$ 与线族 $\mathcal F\subset V=\mathcal A\setminus O$ 满足
$$\frac{2N_{\rm pt}}{D^2}\le|O|\le\frac{7N_{\rm pt}}{D^2},\qquad \deg(v)=D\ \forall v\in V,\qquad \text{incidence 围长}\ge12.$$

**(b) 各引理的机制（推导要点）**：

- **引理 4.2（方向空间）**：$D/q$ 个 bundle、每 bundle $q$ 个指标。取 $b$ 次扩张 $Q'/Q$，把 $\mathcal A$ 等同 $(Q')^{10}$；不同参数 $\xi$ 的 $(1,\xi,\ldots,\xi^9)$ 的任意 $\le10$ 个 $Q'$-线性无关（前 $k$ 坐标 Vandermonde）。每个 $W_r$（2 维）、$E_j$（$b-1$ 维）各占一个参数 $\xi$；参数够用因 $D+D/q<q^{s+2}\le q^b$。$U_j=d_j\oplus E_j$（$b$ 维），交点性质：
  $$U_j\cap U_{j'}=0,\quad U_j\cap e_r=0,\quad U_j\cap W_r=\begin{cases}d_j,&r=\rho(j),\\0,&r\ne\rho(j).\end{cases}\tag{4.3}$$
  机制：任何等式先把 $E$-分量逐标签清零（直和），剩下的 $W$-部分要么属独立 $W_r$、要么是同一 $W_r$ 内不同方向 $d_j\ne e_r$。**"至多十个成员直和"是 $n=10b$ 的直接来源**。
- **引理 4.3（相容孔洞）**：随机以 $\theta=5M/|S|$（$M=N_{\rm pt}/D^2$）选点；Chebyshev 得 $4M\le|X|\le6M$ w.h.p.（$\operatorname{Var}\le5M$、$M>q^{8s+198}\to\infty$）；occupancy：$\Pr[\exists(j,r,C):|X\cap(C+W_r)|>100]\le D^2N_{\rm pt}(\theta q^{b+2})^{100}=O(q^{2402-88s})=o(1)$（$s\ge100$）；标记碰撞对（同一 $W_r$-平移内的选中点对）与例外矩形四见证组，$\mathbb EZ/M=O(q/D+q^8/D^4)=o(1)$，Markov 删去 $Z\le M$ 个标记点。剩 $3M\le|O|\le6M$。三条性质：(i) 每个 $W_r$-平移至多一孔（分离替换平面）；(ii) $|O\cap(C+W_r)|\le100$（事件计数预算）；(iii) 无四见证全在 $O$ 的例外矩形（替换线矩形排除）。
- **引理 4.4（替换线）**：替换线 $=$ 各 $o+W_r$ 内方向 $e_r$ 的线除 $o+e_r$ 本身。互不相交（性质 (i)：不同孔在固定 $W_r$ 的不相交平移中）且避开 $O$；四替换线矩形 ⟹ 四个互异孔见证（对边 $W_r$-平面被 $e_{r'}\notin W_r$ 分离、邻边平面交于共享角 ≠ 见证）⟹ 与 (iii) 矛盾。
- **引理 4.5（多边形分类）**：候选序列 = $k\in\{3,4,5\}$ 个非零步的闭标记序列，步型 $G_j$（generic，$u\in U_j$，$E$-分量非零）与 $R_r$（exceptional，$u\in e_r\setminus0$，端点均在 $T_r$ 中），相邻标签互异、至少一个 $G$。每步至多牵涉两个 $W/E$-空间，$2k\le10$ ⇒ 直和可用；闭性对每个 generic 标签强制 $E_j$-分量和为零 ⇒ 每标签至少出现两次；循环不相邻 ⇒ 至多两次 ⇒ $g\in\{1,2\}$。三类：(i) $G_j,R_r$ 交替矩形；(ii) $G_j,G_{j'}$ 交替矩形；(iii) 五边形（两个 $G_j$、两个 $G_{j'}$、一个 $R_r$，$\rho(j)=\rho(j')=r$——exceptional 的 $e_r$-分量只能被同 bundle 的两个 $d_j,d_{j'}$ 的 $W$-分量消去）。坏事件概率 $p_*^{2g}$，$p_*=(q^2-1)/(q^{b-1}-1)\le2q^{3-b}$（$E_j$ 的二维子空间含 $q^2-1$ 个非零向量，$\mathrm{GL}$ 传递性）。独立性：两次出现之间隔一个不在 $U_j$ 中的步向量 ⇒ 属不同 $U_j$-coset ⇒ 用不同随机变量 $P_{j,C}$。
- **引理 4.6（事件界 $\mu=O(q^{-7})$）**：固定 $P_{j,C}$：孔对 $\le100^2p_*$；generic 矩形 $O(Dq^{3b}p_*^4)$；混合矩形 $O(100^2(q^3+D)p_*^2)$（$C\cap T_r$ 至多 $100q$ 或 $100$ 点——这里用到 (ii)！）；五边形 $O(q^{3b+2}p_*^4)$。合计
  $$\mu\le O\bigl(q^{-s-17}+q^{-7}+q^{-s-33}+q^{-2s-31}+q^{-s-6}\bigr)=O(q^{-7}),$$
  各项分别吃 $b=s+20$、$p_*\le2q^{3-b}$、$D<q^{s+1}$。$q^{-s-6}=q^{-106}$ 是混合矩形项 $100^2D\,p_*^2\sim q^{s+1}q^{6-2b}$ 的化简。
- **引理 4.7（局部引理）**：经典非对称 LLL 的条件概率归纳证明；每事件至多 4 个变量、每变量事件概率和 $\le1/16$；$x_A=2\Pr(A)\le1/8$，邻居和 $\le2\cdot4\cdot\frac1{16}=\frac12$。
- **引理 4.8（slab 内线划分）**：无指定点：任意 $P$ 中固定方向的平行线。有指定孔 $o$：取 $0\ne\delta\in d$ 与 $P$ 上无 $Q$-特征向量的算子 $J$（$P$ 等同于 $Q$ 的二次扩张的向量空间，$J=$ 乘 $\eta\notin Q$；$\eta x=\lambda x\Rightarrow\eta=\lambda$ 矛盾）；$o+d$ 之外用
  $$\{o+x+\gamma(Jx)\delta:\ x\in P,\ \gamma(x)=1\}\qquad(0\ne\gamma\in\mathrm{Hom}_Q(P,Q))\tag{4.9}$$
  共 $q^2-1$ 条线划分 $q^3-q$ 个点（对每个 $x\ne0$，$\gamma(x)=1,\gamma(Jx)=c$ 的泛函唯一存在，因 $x,Jx$ 是 $P$ 的基）。机制：**"无特征向量"保证提升线的方向投影非平凡且互不相同**——这正是 summary §11 的 punctured-plane tiling 构造。
- **引理 4.9（trade）**：对每个孔 $o$、bundle $r$：删去 $q$ 条 $o+d_j$（$\rho(j)=r$），插入 $q-1$ 条替换线。逐点净变化：$o+W_r$ 内删除扇形用过除 $e_r$ 外所有方向；非 $o+e_r$ 的点恰失一得一次（净 0）；孔失 $q$ 得 0；$o+e_r$ 其他点不动。无双重删除（同 partition 中两孔同 slab 已排除）；不同 partition 方向落在零交的 $U_j$ 中 ⇒ 无重复线。初始每点在 $D$ 个 partition 中各 1 次 ⇒ 度 $D$ 保持。
- **围长证明**：短圈 ⇒ $k\le5$ 步多边形。全 $R$ 步的情形：$\le5$ 个 $W_r$ 独立 ⇒ 每标签至少两次 ⇒ 只能 4 步交替矩形 ⇒ 已被引理 4.4 排除。含 $G$ 步 ⇒ 是候选序列 ⇒ 对应坏事件发生，矛盾。

**(c) 假设的机械理由**：$q\mid D$ 允许 bundle 大小 $q$；$s\ge100$ 让孔选择估计指数 $2402-88s<0$；$b=s+20$ 的 20 是事件权重 $q^{-7}$ 里的松弛（$3-b$ 的指数项）；$n=10b$ 是"每步两空间、五步多边形"的直和预算。$d_0<q$ 使 $|S|=\binom{d_0+n}n\ge q^n/(3^nn!)\ge c_SN_{\rm pt}$（$n$ 有界）。Lean 对应：`DirectionFrame`（$W_r,E_j$ 与直和性质，$E=\mathrm{Fin}\ 119\to Q$）、`HoleExistence/HoleSelection/HoleEvents/HoleNumerics`（Chebyshev/Markov/occupancy）、`SlabEvents/SlabAvoidance/SlabNumerics`（事件计数与 $\mu$）、`ReplacementPolygon/ReplacementGeometry`（分类）、`LocalLemma` 相关的 `SlabAvoidance`、`SlabPartition/PlaneOperators`（$J$ 的无特征向量与 $q^2-1$ 线划分）、`TradeLines/TradeDegree/TradeGirth/TradeFamily`。

**(d) 候选失败路线**：
- 直接删除过孔的线 [推测]：其他点的度同时下降，正则度 $D$（= 特征 2 消失因子）丢失，配对与正则性不再兼容——这是"Starting from line partitions gives regularity, but simply deleting the lines through a hole would lower the degree of other points as well"的原文警告。
- 用 2 维平面内的 trade（不做 3 维 slab）[推测]：summary §11 verbatim 的死锁："Need b<a-1 for rare. Generic LLL wanted b>a+4. Conflict!"——平面内三角形太密与 LLL 参数冲突；3 维 slab + 随机 $P_{j,C}$ 把事件概率降到 $p_*^{2g}$，$\mu=O(q^{-7})$ 解锁。
- 把围长从 12 提到 14（排除 6 步多边形）[推测]：6 步序列每步两空间共 12 个 > 10，$n=10b$ 的 Vandermonde 直和不够用（summary §22 verbatim："Without direct for all six G, E labels may not repeat! For k5 count 10. k=6 not covered by Vandermonde in n=10b"）；需 $n=12b$，孔/事件计数全部重算，六边形分类未知。论文未采用。
- 全 $R$ 步短圈交给孔条件 (iii) [推测]：(iii) 只排除**矩形**；3、5 步全 $R$ 序列靠闭性 + 循环不相邻 + $W_r$ 独立性强制"每标签恰两次"才能归结为矩形——若标签出现奇数次，闭性给出 $e_r$ 方向的非平凡和 = 0，与"至多五个 $W_r$ 独立"矛盾，这是围长证明的收尾机制而非 (iii)。

### 2.14 定理 5.1（终止 prescription）与定理 1.1 的完成

**(a) 机制**：对每个 $h\ge2$ 依次执行：(1) $q=2^h$，$\ell=$ 最小素数 $\equiv-1\pmod{q^{100}}$（Linnik 保证终止）；(2) $K=\F_2[Z]/(g)$，$g$ 为字典序最小的 $h(\ell-1)$ 次首一不可约多项式；(3) $Q=\{x\in K:x^q=x\}$，$\zeta=K$ 中第一个 $\ell$ 阶元（存在性：Fermat $\ell\mid2^{\ell-1}-1$ ⇒ $\ell\mid|K^\times|=2^{h(\ell-1)}-1$，循环群）；(4) 按 (a) 尺寸、(b) 线含于 $V$、(c) 正则度 $D$、(d) 围长 $\ge12$ 逐对测试 $(O,\mathcal F)$，全败则 $h{+}1$。定理 4.1 保证对所有充分大 $h$ 成功（**对枚举一致**），外层搜索终止。关键自白："The search enumerates the required incidence data directly, not the auxiliary random choices used to prove their existence. The auxiliary extension field in that proof is only a model for a $Q$-vector space; it is not required to embed in $K$."输出：$a_{\rm out},b_{\rm out}$ 的显式公式 (5.1)（= 3.25），且"define finite sums whether or not distinct displayed words represent the same group element; no word-equality oracle is used to normalize them"。

**(b) 批注**：定点 $v_*=$ 第一个 $V$ 元素；槽-型分配取字典序前 $t$ 对 $(s,\alpha)$（预算 $t\le m\ell^2$）。$\iota_{vf}$ 把 $1\in L_f^0$ 映到按序匹配方向的第一个非零向量。Lean 对应：`PrescribedSearch`（外层 `selectedH = Nat.find`，`selectedH ≤ 217`）、`PrescribedFields`（$K$ = `CoefficientField (217*(prime−1))`、`zeta = first IsPrimitiveRoot`）、`PrescribedSubfield`（$Q=$ `rootSubfield`）、`PrescribedIncidence`（`succeeds_217` 直接给出 $h=217$ 处的成功对）、`PrescribedPairing`（`complementMatrix`）、`PrescribedSlots/PrescribedData/PrescribedOutputs`。

**(c) 失败路线** [推测]：让搜索枚举"随机构造的辅助数据"（slab 选择等）——终止性只能来自存在定理的概率分支，不可判定；论文明确把存在性证明与枚举对象分离。或：对 $K$ 要求含 $Q$ 的指定嵌入——"the auxiliary extension field ... is not required to embed in $K$"，只要求 $|Q|=q$ 的抽象子域。

### 2.15 命题 6.2（细胞自动机迁移）与两个推论

**(a) 陈述与机制**：$(T_cx)(g)=\sum_{u\in G}c_ux(gu)$（右邻域约定）。引理 6.1：$c\mapsto T_c$ 忠实（$(T_c\delta_h)(1_G)=c_h$）且 $T_c\circ T_d=T_{cd}$——展开：
$$(T_a(T_bx))(g)=\sum_ua_u\sum_vb_vx(guv)=\sum_w\Big(\sum_{uv=w}a_ub_v\Big)x(gw)=(T_{ab}x)(g).$$
命题 6.2：$ab=1$ ⇒ $T_a\circ T_b=T_1=\id$ ⇒ $\tau=T_b$ 单射；且
$$\im(\tau)=\{y:T_{ba}y=y\}$$
（⊂：$T_{ba}T_bx=T_bT_aT_bx=T_bx$；⊃：$y=T_b(T_ay)$）。若 $(ba-1)_h\ne0$：$(T_{ba}\delta_h-\delta_h)(1_G)=(ba-1)_h\ne0$ ⇒ $\delta_h\notin\im\tau$ ⇒ 不满。像由一致有限局部方程 $\sum_{u\in\supp(ba-1)}(ba-1)_uy(gu)=0$ 刻画。推论 6.3：$T_{b_{\rm out}}$ 单射不满，$G$ 非 surjunctive。推论 6.4：经伴侣论文的嵌入定理把同一标量反例搬到 type $F_\infty$ 群 $U$（线性扩张 $i_*$ 保持两个乘积断言，因 $BA-1=i_*(ba-1)\ne0$）。

**(b) 批注**：summary §23 的 verbatim 记录了顺序检查："Correct order? $T_c(x)(g)=\sum c_mx(gm)$. $T_a(T_b(x))(g)=\sum a_hb_kx(ghk)$. $T_bT_a=T_{ba}$. So yes."以及范围自省："Our use is not identifying equivalence; direct finite failure gives one counterexample, no reverse."（直有限失败 ⇒ surjunctivity 失败，反之不然）。特征 2 只用于造见证，命题 6.2 对任意域成立；域有限性供字母表，标量性供"字母表就是 $K$ 本身"。

**(c) 失败路线** [推测]：只对有限支撑配置证单射/像刻画 [推测]：$\im\tau$ 的固定点方程对**所有**配置成立，限制到有限支撑会把"缺失配置"的论证弱化为近似陈述；论文强调"applies to all configurations, not just finitely supported ones"。用 $\Sym(G)$ 嵌入把见证群换成熟悉群 [推测]：summary §23 记录曾考虑并放弃——嵌入不保持有限记忆规则的"同一局部规则"形式，且 embedding 后 $ba-1$ 的非零系数虽保持但字母表与记忆集都要重推。

---

## 三、summary 时间线（§1–§22 + Part II §23）

以下逐段提炼 23 页 summary（OpenAI, "Summarized chain of thought"），每段给出：想干什么 → 卡点（引 verbatim 英文）→ 被什么救活 → 映射到第二部分的哪个引理/假设。

**§1 From candidate dimensions to characteristic-two sign lifting**。想干：以 surjunctivity [12,13]、Elek–Szabó [19] 为已知充分类，找任意特征的正/反结果；用幂等缺陷 $e=1-\epsilon$ 组织搜索。卡点：Witt 向量提升给不出零迹幂等的强制消失；熵法在非顺畅群上失效；随机优先枢轴密度"required differentiating infinite-volume quantities across possible phase transitions"。特征 2 转向："Pairing cells with equal products suggested replacing these relations by ... where a central involution would supply minus signs"；"Reduced row cycles yielded reduced column words ... but candidate odd-area spherical diagrams defeated the simple parity justification"。救活：无（本段留下"row graph 作为 column-labeled 浸入"的未解控制问题）。映射：这一段的特征 2 配对直觉最终变成引理 3.2/命题 3.3；"odd-area spherical diagrams"的恐慌预示 §6 的符号提升障碍（即最终 $D=0$ 不可提升机制）。

**§2 Positivity barriers and asymmetric cancellation**。想干：Dykema–Juschenko [18] 的稳定有限 ⇔ 与每个有限群直积后直有限；Dykema–Heister–Juschenko [17] 的 ULIE 表现编码特征 2 消去。卡点：随机赋值"Distinct leading weights prevented finite cancellations, but infinite elimination could fail to converge"；Lück 行列式放大条件化于群假设；"$ (1-g)\epsilon=0 \Rightarrow (1-g)^{-1}\epsilon=0$"只挡单元素压缩。救活：无，但把"矩阵失败 ⇒ 标量失败"的通道（$K[\Gamma\rtimes F]$）记入工具箱。映射：定理 2.1 之后的 §3.5（矩阵单位 + 有限因子）；ULIE 的"left-invertible 元素的泛表现"思想变形为粘合群 $N$ 的零和表现（2.4）。

**§3 Coset constructions and the search for positive dimension**。想干：奇阶有限子群、非恒等元偶重数消去；"Their averaging projectors could provide a rectangular factorization"——矩形分解的第一次显形。卡点：faithful subgroup embeddings 与 compatible character projections 缺位；"Dense identifications threatened collapse, while high-girth constructions exceeded the required size bound"。verbatim："Cosets give much more flexibility! Any hyperedge set affine copies. Equality mod p means symmetric difference of t odd-size cosets leaves singleton."救活：Slofstra embedding [35] 与 MIP=RE [25] 被引入又被搁置；真正存活的是"coset/超边"的语言。映射：子群平均 $P_v$（2.7）与 (3.3) 划分恒等式；"compatible character projections"变成 (3.10) 与槽-型分配（2.8–2.9）。

**§4 From modular cancellation to restricted incidence obstructions**。想干：$k$ 个 $\ell$ 阶初等交换子群覆盖、偶重数 ⇒ $\sum u=0$ 型恒等式；cylinder set 压缩。卡点："A proposed conversion to a one-sided inverse remained conditional on faithful subgroup realization"；Lyons–Nazarov 匹配没有对应版本。verbatim："Excellent. This kills path/star if neighbors always leaves. If neighbors internal, cost shared; each line may participate in growing network, maybe use Euler characteristic."——**Euler 特征第一次以武器身份出现**。救活：de Bruijn–Erdős 有限线性空间界给出受限障碍。映射：Euler 论证成熟为引理 2.2 的第 4 步；"incidence designs"的曲率/塌缩困难预示 §11 的仿射线方案。

**§5 Restricted obstructions and the limits of local information**。想干：稳定有限视角（失败 ⇒ $\Delta=I-BA\ne0$ 幂等）；分裂反例作为 local isomorphism $X\to X\times Y$。卡点：熵差分需"global path independence, positivity, preservation of a finite-range Gibbs description"；信息分配遭遇无界传播（Gross–Nesme–Vogts–Werner 指数 [23] 无非顺畅对应）。verbatim："So equality of entropy densities for pure finite-depth states is false."救活：无；但 $\tau=(v_0e)\tau_v$ 型剪切分解（"whose inverse and elementary-shear decomposition follow from the split relations"）预告了稳定字母 $\tau_v$ 的用法。映射：$e$、$(1-e)$ 的补身份机制（2.9）；熵路线整体被放弃，其"信息不能凭空压缩"直觉后来由**秩论证**（$t>m$）代数化（2.10）。

**§6 Obstructions to sign lifting and modular corner constructions**。想干：把特征 2 消去对提升到特征 0（中心对合供负号）。卡点：**"odd spherical diagrams can collapse the required central involution"**——奇面积球面图使提升死；张量积配对保持该障碍；"correction ranks consumed the entire proposed saving"。verbatim："This yields Hattori trace over conjugacy class as expected. Want individual h not sum."救活：无——但这成为**反向武器**：§14/§21 明确总结为"特征 $p$ 恒等式本质因 $D=0$，提升必改支撑"。映射：主定理的"不可提升"侧证（一、1.2）；也是为什么全篇只用特征 2 友好的平移消去论证（2.2 的批注）。

**§7 Modular decoding meets information at infinity**。想干：整数算子 $A\equiv B\pmod p$、实核正维、$\bmod p$ 局部可解码 vs 低 von Neumann 秩的矛盾；I–MMSE [24] + 张量放大。卡点：verbatim："This would be a full proof if derivative identity (no lost information to infinity) works."——导数恒等式不成立，无穷远漏信息；Ornstein–Weiss 梯度例 [31] 击败只看输出的论证。救活：无。映射：这一整族"局部可解码 vs 全局秩"的失败，其代数骨架最终以最简形态出现在 $\varepsilon(U)=X$、$\rank(X^{\mathsf T}X)\le m<t$（2.10）——局部基数字可恢复，全局矩阵不满秩。

**§8 Information arriving from infinity**。想干：排除正维实核的有限传播算子。卡点：非顺畅群上"finite independence need not exclude an infinite square-summable kernel"；Brownian bridge 反向扩散的兴奋（verbatim："This is huge."）没有唯一性定理兜底；verbatim："Poincaré alone no compact embedding (infinitely many shifts e_i)."救活：无。映射：无直接产物；其"信息从无穷远到达"的教训与 §6 一起构成放弃解析路线、回到有限组合的动因。

**§9 From Gaussian rank bounds to vertical defect components**。想干：模算术 ↔ 解析秩。卡点：格 theta 界"Excellent! No support degree!"但无穷体积行列式比较缺失；wrapped Gaussian 隐藏环绕数。固定支撑环 $\mathbb Z[\Gamma,p]/(\cdots)$ 的提议把缺陷推到"open-and-closed component supported over finitely many primes"——"Excluding that component remained the missing step"（vertical component 障碍）。救活：无。映射：vertical component 的不可排除性即最终构造的**合法性**：反例就活在那个正特征分量上；prescription 的有限域 $K$（2.14 第(2)步）可视为对该分量的显式取样。

**§10 Trace, entropy, and boundary barriers**。想干：分布 telescoping $\tau-\tilde\tau=\delta$ 带非零系数迹。卡点：循环性强制 $(\tau-\tilde\tau)(1)=0$——"compactness retained trace-bearing tails instead of producing the required cancellation"；MTP（mass transport）需要无穷体积极限；Bombieri–Vaaler [8] 的短解集中在边界。verbatim："Offdiag conditions impose additional square density, likely second link counts."救活：无。映射：迹-循环性冲突是后来"缺陷必须经 $\Phi$ 单射性而非迹"侦测（2.11）的原因。

**§11 Matrix cancellation and punctured affine geometry——最终构造的诞生段**。想干：rank-one 矩阵权重 $W_v$ 每超边求和为零、总秩 $m$ 大、incidence 围长 $\ge12$；从 $Q^n$ 挖孔、低次多项式、trade 保正则。卡点：三角形计数与 LLL 参数冲突（verbatim："Need b<a-1 for rare. Generic LLL wanted b>a+4. Conflict!"）。救活：**punctured-plane tiling**——线性映射无 $Q$-特征向量时提升线划分 fiber（即引理 4.8 的 $J$）；插值信息集挖孔。计划明确列出："attaching additive groups ℓ² to vertices, identifying one-dimensional subgroups along hyperedges ... Subgroup averages ... character twists in HNN extensions and a finite-group matrix corner for the scalar passage. Linnik's theorem remained a possible dependency for choosing ℓ+1 divisible by q^100 within polynomial bounds [26]."映射：2.13 各引理 + 2.7/2.8/2.11 全套，一段话就是最终证明的骨架。

**§12 From a characteristic-two construction to a complete draft**。想干：组装完整候选稿。关键节点：把 $D=\ell+1\equiv0\pmod q$ 的 Linnik 选法固定；"An earlier route appealed to Haefliger's developability theorem ... It then replaced this route with a proposed planar balanced-diagram argument using degree bounds, long faces, and Euler's formula"——嵌入证明换血；"With t remaining points, the bounds m < t ≤ mℓ² allowed the proposed packing"；反向恒等式"after applying augmentation in the embedded base group algebra, would equate ... with a matrix factoring through dimension m"。卡点："Repeated scrutiny focused on whether repeated polygon labels really involved independent variables."映射：引理 2.2（2.5）、2.9、2.10。

**§13 Repeated audits**。想干：自审短循环、度保持替换、LLL 独立性。verbatim（极小化范围的澄清）："Minimal graph argument doesn't require planar balanced graph remains drawable as word diagram after contractions; minimal among all graphs satisfying combinatorial balances, not diagrams."——与 Lean 的 `Balanced` 抽象结构完全对位。卡点：尝试用初等素因子论证、更大 spread、**显式 Mersenne 素数**替换 Linnik，"ran into divisibility or interpolation-size obstacles, so it retained the theorem as a dependency"——注意：Lean 最终（见第四部分）恰用 Mersenne 素数 $2^{21701}-1$ 成功替换。映射：2.5(b) 极小化；五、常数表。

**§14 Stress-testing**。想干：外证审计。双重计数检验：特征 0 不可能（$D\cdot\sum W_v=0$ vs $\sum W_v=-I_m$）；verbatim："Our mod2 D divisible q ensures. Thus no lift. Positive characteristic essential."检查 Farrell–Jones/CAT(0)/DLMSY 特征值限制均不构成障碍（无普适群类覆盖）。映射：一、1.2 的机制总述；2.6 的假设对位。

**§15 Auditing the proposed counterexample**。verbatim 恐慌与解决："Could N actually be trivial despite planar argument due to non-planarity of reduction? Need scrutinize signed wires again. If relators all local and group trivial, s reduces via conjugations in free group."修订后：签名归约、桥、平行边、邻居合并、孔删除界、重复标签独立性、插值选择全部显式；Euler 界 $n_b\le E/3,n_w\le(E+1)/2,n_f\le E/6+1$ 落定。映射：2.5(b)(c)(d) 全节。

**§16 Testing the links**。想干：聚焦嵌入与打包关节。确认"minimization was over finite graphs satisfying the balance conditions, rather than only graphs obtained by particular reductions"；"Assuming a reverse inverse would force $X^{\mathsf T}X$ to factor through dimension $m<t$, after applying a homomorphism on an embedded base algebra"。映射：2.10 的三明治-特化路线在此定形。

**§17 Auditing through algebra and geometry**。卡点：有限整体维数、代数 K 理论信息不供正性；Bartels–Lück–Reich [6] 把稳定有限当独立假设。verbatim："But collective conditional MI can be greater than sum due synergies (noises cancel via relations)."围长 12→14 的投机（角 $\pi/7,\pi/3,\pi/2$ 双曲猜想）保持探索态。映射：2.10(d) 的"为什么不用正性"与 2.13(d) 的围长 14 路线。

**§18 Testing against geometric and algebraic obstructions**。检查 Berlai 判据 [7]（无合适正规子群）、Wise 锐角多边形 [39]（≥4 边不适用）、virtual special/sofic/surjunctive 担忧、Slofstra 非闭合 [36]（局部交换约束未必有忠实有限维实现——对构造**有利**）。映射：2.5(d) 路线 A 的证据链。

**§19 Testing against finiteness and geometry**。卡点：能保持每个局部群的有限商将矛盾于 $t>m/\kappa$ 型不等式，但非正曲率给不出该商；proper edge coloring 被多项式恒等式挡住。verbatim："FJ computes K0 as abelian group with action but not monoid positivity."映射：2.6(b) 的假设对位与 2.10 的秩论证再次确认。

**§20 Repeated audits and an unused elementary alternative**。想干：用 Chebyshev 素数计数 + Rankin 光滑数估计替换 Linnik、变换系数特征、放大局部有限域——"retained the original dependency"。新洞见：配对恒等式排除完美匹配——"the uncovered vertices must supply a rank-m sum of rank-one matrices, requiring at least m uncovered vertices"——这是 $t>m$ 秩论证的匹配论版本。映射：2.10；五、ℓ 的来历。

**§21 Testing the limits**。想干：围长 14 + $n=12$ 空间。verbatim："Without direct for all six G, E labels may not repeat! For k5 count 10. k=6 not covered by Vandermonde in n=10b."——6 步多边形需要 12 个独立空间，$n=10b$ 不够；提高 $n$ 则插值密度估计重算，放弃。特征提升再败："Thus characteristic-p identity inherently due D=0. p-adic lift must alter supports adding higher-order terms from nonlocal group elements."映射：2.13(d) 路线 3；一、1.2。

**§22 Repeated scrutiny**。收尾审查：概率估计、插值、嵌入、打包再过一遍；整数提升给出非整有理谱原子 $-1/2$ 的自伴算子图像，DLMSY [16] 无普适排除；"Simple retractions available for graph products failed to apply because of the local linear dependencies; it identified no applicable residual-finiteness theorem."留下未探索：负曲率、残余有限、行列式推论（后者由伴侣论文承接）。映射：全篇的稳定性总结。

**Part II §23 From one-sided inverses to a cellular automaton**。输入：Part I 的存在性断言；产出：实际局部规则。verbatim（顺序检查）："Correct order? $T_c(x)(g)=\sum c_mx(gm)$. $(T_a(T_b(x)))(g)=\sum a_hb_kx(ghk)$. $T_bT_a=T_{ba}$. So yes."；verbatim（范围）："Our use is not identifying equivalence; direct finite failure gives one counterexample, no reverse."曾考虑把见证群嵌入 $\Sym(\mathbb N)$ 等熟悉群，最终保留原群。映射：2.15 全节。

---

## 四、Lean 结构取证

### 4.1 PrimeCertificate：Lucas–Lehmer / Mersenne $2^{21701}-1$ 路线

文件 `PrimeCertificate.lean`（全文 11 行）：

```lean
theorem mersenne_21701_prime : (mersenne 21701).Prime := by
  apply lucas_lehmer_sufficiency
  · norm_num
  · norm_num
```

`mersenne` 与 `lucas_lehmer_sufficiency` 来自 Mathlib（`NumberTheory/MersennePrimes`）：后者要求指数 $p$ 为素数且 Lucas–Lehmer 残差为零（即 $s_{p-2}=0$，$s_{k+1}=s_k^2-2\ \bmod\ 2^p-1$）。两个 `norm_num` 目标分别是 21701 的素性与残差计算——对 21701 位模数的 21699 次模平方，是全库最重的具体计算之一。`FiniteParameters.lean` 的消费方式：

```lean
def sourceQ : ℕ := 2^217
lemma source_prime_exists : ∃ p : ℕ, p.Prime ∧ sourceQ^100 ∣ p+1 := by
  have hp : 2*sourceQ^100-1 = mersenne 21701 := by
    unfold sourceQ mersenne
    have h : 21701=217*100+1 := by decide
    rw [h,pow_add,pow_mul,pow_one]; rw [Nat.mul_comm]
  refine ⟨2*sourceQ^100-1, ..., ?_⟩
```

**指数 21701 = 217·100 + 1 的凑法**：$2^{21701}-1=2\cdot(2^{217})^{100}-1\equiv-1\pmod{q^{100}}$ 自动成立，故 $q^{100}\mid(2q^{100}-1)+1$ 是平凡整除 `dvd_mul_left`。这是"先选已知 Mersenne 素数、再反推 $q$"的倒装设计：论文/summary 里 Linnik 是从 $q$ 出发找 $\ell$（存在性、常数不可显），Lean 反过来从已知 Mersenne 素数 $2^{21701}-1$（第 24 个，Noll 1978）出发定 $q=2^{\lceil 21700/100\rceil}=2^{217}$。**为什么换成这个**：Linnik 的 $\ell\le cq^{100L}$ 带未知常数 $c,L$，下游 $s=\lfloor\log_qD\rfloor$ 只能"有界"而非定值，$b,n$ 全部参数化；Mersenne 路线给出**精确值**：`sourceD_log : Nat.log sourceQ sourceD = 100`（用 $D\le2q^{100}<q^{101}$），于是 $b=s+20=120$、$n=10b=1200$ 是具体数字（`PrescribedParameters.dimension_217 : dimension 217 = 1200`），`Fin 119 → Q`、`4*1200=4800`、`13*1200 ≤ 217*72` 等数值判定都能 `decide`。注意与 summary §13 的张力：当时"explicit Mersenne primes ran into divisibility or interpolation-size obstacles"——失败原因应是当时未找到 $q^{100}\mid p+1$ 的已知 Mersenne 素数；$21701=217\cdot100+1$ 恰好命中（$p+1=2^{21701}$ 被 $q^{100}$ 整除而非整除 $p-1$，符号是 $-1$ 剩余类）。

另外两个数值引理值得记录：`sourceQ_density : 4800^1200 ≤ sourceQ^72`（经 `exponent_comparison : (x^13)^1200 ≤ (x^217)^72`，因 $13\cdot1200=15600\le15624=217\cdot72$）——这是 §4 的 $|S|\ge c_SN_{\rm pt}$ 密度界的 Lean 化身（$4n=4800$、$c_S=q^{-72}$）；`sourcePrime = Nat.find source_prime_exists` 仍取"最小素数"，所以 Lean 实际使用的 $\ell$ 是 $\le 2q^{100}-1$ 的最小候选，只是上界由 Mersenne 素数认证。

### 4.2 Ribbon：平面图的置换代数化

Lean 没有引入拓扑/组合映射的平面性理论，而是把组合映射（combinatorial map）**代数化为置换对**（`RibbonGeometry.lean`）：

```lean
structure Ribbon (α : Type u_2) where
  black : Perm α
  white : Perm α
def Ribbon.face (R : Ribbon α) : Perm α := R.white * R.black
def Ribbon.Spherical (R : Ribbon α) : Prop :=
  Nat.card (Cycles R.black) + Nat.card (Cycles R.white) +
    Nat.card (Cycles R.face) = Fintype.card α + 2
```

面就是面置换 $R_{\rm white}\cdot R_{\rm black}$ 的轮换；**Euler 公式被置换计数化**：三个置换的轮换数之和 = 边数 + 2，无任何"画在球面上"的语义。局部手术同样置换化：`mergeWhite R e` 把白顶点沿相邻黑边合并——`white := swap e (R.face e) * R.white`（对换乘法），注释明言"The newly created digon is a one-cycle of the face permutation"；`detach a` 删边及其连通分支计数（`Ribbon.detach_components_card` 的 `+ if ... then 1 else 2`）。`PlanarBalance.Balanced` 结构体把引理 2.2 的平衡图对象化：

```lean
structure Balanced (R : Ribbon α) (Inc : V → F → Prop) (ι : V → F → (A →+ B)) where
  blackLabel / whiteLabel / incident / weight (weight_ne : ∀ a, weight a ≠ 0)
  exception : Cycles R.white
  black_sum : ∀ c, ∑ a ∈ cycleSet R.black c, ι (blackLabel a) (whiteLabel a) (weight a) = 0
  white_sum : ∀ c ≠ exception, ∑ a ∈ cycleSet R.white c, weight a = 0
  exceptional_sum : (∑ a ∈ cycleSet R.white exception, weight a) ≠ 0
```

度数下界按假设拆分：`Balanced.black_degree` 用 `hinj`（$\iota$ 单射，杀度 1）与 `hind`（$\iota_{vf}x+\iota_{vg}y=0\Rightarrow x=y=0$，即方向独立 `directionMap_independent`，杀度 2）得黑度 $\ge3$；`Balanced.white_degree` 得白度 $\ge2$（例外 +1）。面长从围长导出：`PlanarBalance` 尾部的边界行走构造把 incidence 图的 `egirth ≥ 12` 转成面轮换长 $\ge6$（行走长 $2n$），`Balanced.not_spherical` 合并三项调用 `euler_contradiction`（`RibbonGeometry.lean:318`，同一引理在 `Algebra/OddKaplansky/Diagrams.lean` 有一份平行副本）。embedding 的入口是 `GroupEmbedding.theta_injective`：从假死的生成元出发，经 `Planar.OpenDiagram`（带符号 token 的开放图，`related_iff`、`initial`、`D.not_empty`）把它转化为平衡图矛盾。即论文的"word equality → planar graph"在 Lean 中是"word equality → OpenDiagram → Balanced/Ribbon 置换系统 → 置换版 Euler"。

### 4.3 MultiHNN：自制多重 HNN 扩张

Mathlib 只有单稳定字母的 `HNNExtension`（含 Britton 引理式的嵌入定理 `HNNExtension.of_injective`）。`MultiHNN.lean` 自制多稳定字母版本：基础对象是 `Monoid.Coprod H (FreeGroup I)` 的同余商

```lean
def con : Con (Monoid.Coprod H (FreeGroup I)) := conGen fun x y =>
  ∃ (i : I) (a : A i), x = Coprod.inr (FreeGroup.of i) * Coprod.inl (a : H) ∧
    y = Coprod.inl (φ i a : H) * Coprod.inr (FreeGroup.of i)
abbrev Extension := (con A B φ).Quotient
```

带 `of`（基群嵌入）、`letter`（稳定字母）、`lift`（泛性质：任给满足共轭关系的 $f,t$ 可提升）、`induction_on`（字归纳）、`of_central`（在被所有关联子群固定的中心元保持中心——对应论文"$z$ 在 $L$ 中中心"）。**嵌入的证明路线与论文不同**：论文用轨道配对的置换表示证书；Lean 用 `finite_partial_realization`——对指标有限集归纳，每次用 Mathlib 的单 HNN `HNNExtension.of`（保单射）加一个稳定字母，空集情形用 `ULift H` 垫基（解决宇宙问题），然后对 `Fintype I` 用 `lift` 把两个实现粘合出 `of_injective`。注释明言借力："Mathlib's complete Britton-lemma proof supplies the embedding at each step"。`CharacterTwist.lean` 在其上包装扭转：$H=N\times C$（$C=$ `Multiplicative (ZMod ℓ)`，即 $\langle z\rangle$），`src v = (ι v) × id`、`dst v a = (ι v₀ a.1, a.2 * α v a.1)`——论文的 $\psi_v$ 扭转被实现为**目标侧的乘法扭曲**；`edgeIso` 拼接、`conjugacy : τ v * emb (ι v a, c) = emb (ι v₀ a, c * α v a) * τ v` 即关系 (3.6)；`emb_injective` 即 $H\hookrightarrow L$。

### 4.4 PrescribedPresentation 与主定理的分离

比较器配置 `KaplanskyDirectFiniteness.json`：

```json
{"solution_module": "OAI.RingTheory.DirectFiniteness.Main",
 "theorem_names": ["OAI.KaplanskyCounterexample.main_theorem"],
 "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}
```

`Model.lean` 的目标命题 `MainClaim` 只要求：特征 2 有限域 + **有限生成**群 + `a*b=1 ∧ b*a≠1`；`Main.lean` 四行：`main_theorem : MainClaim := Prescription.Output.prescribed_main`。也就是说 **Lean 主定理验证的是"有限生成"版，不是论文的"有限表现"版**。有限表现被放在旁边单独证明：`PrescribedPresentation.lean` 的 `prescribed_finitelyPresented`（经 `N_shortEquiv : PresentedGroup shortRelators ≃* Base`、`shortRelators_finite`、`characterTwist_finitelyPresented`、`finitelyPresented_prod`），它不在 `main_theorem` 的陈述里——这正是任务说明里"PrescribedPresentation 与主定理分离"的含义：challenge 只认证最小命题，更强的表现论断作为附注定理存在但不受比较器检查。同时注意 `PrescribedOutputs.G` 是显式缩写：`ChosenCriterion.Group (m := Slots) ell Inc assignment ...`，$a,b$ 是由 `zeta`、$X$、槽分配等**指定数据**构造的具体元素——"The two product assertions are for the specified first successful data and specified sums, not merely for some field, some group or some pair"（`prescribed_products` 注释）。

### 4.5 打包槽 $m\times(\mathrm{Fin}\ 2\to\mathbb Z/\ell)$ 的放大

Lean 中槽与特征被合并成**一个类型对**（`PrescribedSlots.lean`）：

```lean
def slotPairOrder : LinearOrder (m × (Fin 2 → ZMod ℓ)) := ...
def slotAssignment (hsize : Fintype.card V ≤ Fintype.card m * ℓ^2) :
    V ↪ m × (Fin 2 → ZMod ℓ)
```

即 $V$ 的每个点按全序秩映射到前 $t$ 个对 $(s,\alpha)$，$\alpha\in(\mathrm{Fin}\ 2\to\mathbb Z/\ell)$ 是 $\ell^2$ 个线性型的坐标系化身；`slotAssignment_first_pairs` 刻画像恰为前 $t$ 对、无一跳过。而 $m$ 本身被实例化为 `Slots := ↥holes`（`PrescribedData.lean`）——**槽的指标集就是孔洞集**，$m=|O|$ 在类型层面强制。槽内互异性 $hα$（$\alpha_v\ne\alpha_w$）由 `ChosenCriterion.products` 的假设传入，正交性消费在 `CharacterTwist.matrix_products`。辅助有限群是 `FiniteBlock.Auxiliary m C = SemidirectProduct (m → C) (Equiv.Perm m) permAction`（$C=$ `Multiplicative (ZMod ℓ)`），坐标幂等 `p ξ i = pushed SemidirectProduct.inl (coordinate ξ i)`（`CharacterIdempotents.projector` 的沿单射推前），$\sigma_i$ 用 `permElt`，`translated : permElt σ * p i * permElt σ⁻¹ = p (σ i)` 给 $p_{ij}$；最终输出走 `ScalarFormulas.output a = 1 - block f q 1 + block f q X : MonoidAlgebra K (L × Auxiliary m C)`，与论文式 (3.25) 的 $1-f_{\rm blk}+\Phi(\cdot)$ 逐项对应，`output_products` 用两个关键非退化条件 `(card (m → C) : K) ≠ 0`（$=\ell^m$ 奇）与 `ξ ≠ 1`（$\zeta$ 非平凡，保证 $p_i$ 互异）。

其它与第二部分对位的取证点：`IncidenceDirections.directionMap : Option K → K →ₗ[K] (Fin 2 → K)` 把 $\ell+1$ 个方向编码为 `none ↦ (0,c)`、`some a ↦ (c,a·c)`，`directionMap_independent` 是黑度 $\ge3$ 中 hind 假设的源头；`AssignedDevelopment.point_injective` 组合 `theta_injective` + 围长，供 `OddTorsion`（$\ell$ 阶元保留）；`PrescribedSearch.succeeds217` 把几何存在定理绑定到 $h=217$（`selectedH = Nat.find`，`selectedH_le217`），注释强调 "The exact least successful outer input, not the convenient existence bound 217"。

---

## 五、常数表

| 常数 | 值 | 角色 | 来历与约束 |
|---|---|---|---|
| $h$ | 217 | 基域指数：$Q=\mathbb F_{2^{217}}$ | 由 Mersenne 素数反推：$217\cdot100+1=21701$ 须使 $2^{21701}-1$ 为已知素数；Lean `sourceQ=2^217`、`selectedH ≤ 217`（实际取最小成功 $h$）。summary/论文用 Linnik 版时 $h$ 自由（充分大即可） |
| $q$ | $2^{217}$ | 仿射空间基域大小、bundle 大小 | 需 $q\ge4800$（`sourceQ_large`，密度与 $s\ge100$ 估计）、$q\mid D$ |
| $\ell$ | $2q^{100}-1=2^{21701}-1$ | 奇素数：局部群 $(\mathbb Z/\ell)$、$(\mathbb Z/\ell)^2$；特征根阶 | 论文：最小素数 $\equiv-1\pmod{q^{100}}$（Linnik/Xylouris）；Lean：Mersenne 素数认证，`Nat.find` 取更小者 |
| $D$ | $\ell+1=2^{21701}$ | incidence 正则度、方向数 | $q^{100}\mid D$、$q\mid D$（bundle）、$D=0$ in $K$（特征 2 机制核心）；$(\ell+1)(\ell-1)=\ell^2-1$ 划分 |
| $s$ | $100$ | $s=\lfloor\log_qD\rfloor$ | Lean `sourceD_log` 精确等于 100（Mersenne 路线红利）；控制孔估计指数 $2402-88s$ |
| $b$ | $s+20=120$ | $E_j$ 维度 $b-1$、$U_j$ 维度 $b$ | 20 是事件权重松弛：$p_*\le2q^{3-b}$、$\mu=O(q^{-7})$ 需要 $-s-6$ 型指数 |
| $n$ | $10b=1200$ | 仿射空间维度 $\mathcal A=Q^n$ | **10 = 每步至多 2 个 $W/E$-空间 × 至多 5 步多边形**（Vandermonde 十一直性）；提到围长 14 需 $n=12b$，未采用 |
| $N_{\rm pt}$ | $q^n=2^{260400}$ | 全空间点数 | $t+m=N_{\rm pt}$ |
| $d_0$ | $(q-2)/2$ | 插值次数上界 | $2d_0=q-2$：线和归零阈值（引理 3.2 的极限次数） |
| $S$ | 下集 $S_{d_0}$ | 插值信息集/孔洞候选域 | $\|S\|\ge N_{\rm pt}/q^{72}$（Lean `q^72*S.card ≥ N_pt`；$4800^{1200}\le q^{72}$，即 $13\cdot1200\le217\cdot72$） |
| $M$ | $N_{\rm pt}/D^2$ | 孔数标尺 | $m\in[3M,6M]$（删标记后），形式界 $[2M,7M]$ |
| $m$ | $|O|$（Lean `Slots := ↥holes`） | 行数/秩参数、槽总数 | 下界供 $t\le m\ell^2$，上界供 $m<t$；$M>q^{8s+198}\to\infty$ |
| $t$ | $|V|=N_{\rm pt}-m$ | 列数、中间坐标数 | $m<t$（缺陷侦测：$\ker X\ne0$）；$t\le m\ell^2$（槽-特征对鸽笼） |
| $\kappa$ | $\ell^2$ | $|K_v|$、特征个数、$P_v$ 分母 | 奇 ⇒ $K$ 中可逆且 $\kappa\bmod2=1$（$\varepsilon(U)=X$ 的机制之一） |
| $h(\ell-1)$ | $217(\ell-1)$ | $K=\F_2[Z]/(g)$ 的次数 | 使 $\ell\mid|K^\times|$（Fermat），$\zeta$ 存在；$Q$ 为 $x^q=x$ 子域 |
| $72$ | — | 密度指数 $c_S=q^{-72}$ | 由 $3^n n!\le(2^{13})^n\le q^{72}$（$n=1200$ 有界） |
| $119$ | $b-1$ | $E_j=\mathrm{Fin}\ 119\to Q$ 的维度 | `DirectionFrame` 的第二空间参数 |
| $21701$ | $217\cdot100+1$ | Mersenne 指数 | Lean `FiniteParameters` 中 `decide` 验证分解；$2^{21701}-1$ 为第 24 个 Mersenne 素数 |
| $F$ 的规模 | $(\mathbb Z/\ell)^m\rtimes S_m$ | 矩阵单位载体 | 只需 $|B|=\ell^m$ 奇（`card (m → C) ≠ 0`）；$|S_m|$ 永不求逆 |
| $1/16,\ 100,\ 20$ | — | LLL 阈值、occupancy 上限、bundle 松弛 | $x_A\le1/8$、邻居和 $\le1/2$；$100$ 点 occupancy 上限进入 $\mu$ 的 $100^2$ 因子 |

**参数链一览**：$h=217\Rightarrow q=2^{217}\Rightarrow\ell=2^{21701}-1\Rightarrow D=2^{21701},\ s=100\Rightarrow b=120\Rightarrow n=1200\Rightarrow N_{\rm pt}=2^{260400}\Rightarrow m\approx3N_{\rm pt}/D^2,\ t=N_{\rm pt}-m\Rightarrow K=\F_{2^{217(\ell-1)}}\supset Q,\zeta\Rightarrow G=(L\times F)$ 与 $a_{\rm out},b_{\rm out}$。

---

*素材完。文件由分段写入生成：第一部分 + 2.1–2.9（第一段）、2.10–2.15（第二段）、第三部分（第三段）、第四、五部分（第四段）。*
