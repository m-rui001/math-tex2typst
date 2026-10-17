# D11 · 退化反例：三次不动点打破临界数 Arnold 界

> 论文：OAI:A-degenerate-counterexample-to-the-critical-number-Arnold-bound-September-23-2026（*Three fixed points on the symplectic quadric threefold*）
> 主定理：存在闭辛六维流形 $Q^3$ 上的光滑 Hamiltonian 微分同胚 $\phi$，使 $\#\Fix(\phi)=3<4=\Crit(Q^3)=\operatorname{cuplength}(Q^3;\mathbb Q)$，且至少一个不动点退化。
> 笔记性质：第一人称反推。不确定处标 [推测]。
> 取证材料：论文 TeX（build/main.tex + sections 六节）+ Lean 形式化（lean/OAI/Geometry/Arnold/，36 文件约 5841 行）+ ComparatorChallenges/ArnoldCounterexample.json。


## 0. 写在前面

这篇笔记的骨架一句话：**把 Hamiltonian 映射的不动点计数问题，沿一个有限阶对称迁移成固定子流形上函数的临界点计数问题**，然后在固定集 $S^2\times S^2$ 上凑一个恰有三个（必然退化的）临界点的显式函数，同时在环境 $Q^3$ 上证明四是个不可穿越的下界。迁移是动力学，凑函数是初等计算，下界是 LS 理论，三块都很老，拼起来却是新的。

Lean 那边 5841 行交上来的账本和论文的分歧比 Barnette 那篇还大：**流被隐式中点映射替换、LS 杯积被 O(5) 上的 Haar 积分阻碍替换、平均延拓被自对偶矩坐标的显式势函数替换**，三大桥接，每处都不改变定理内容、只改变证明路线。这正好是反推的最佳镜子：论文里"取 Hamiltonian 流 $B_s$"、"由 LS 引理"、"对 $f$ 取 $A$-不变平均延拓"这三句话各自值多少行代码，镜子照得一清二楚。


## 一、开局：我为什么去打"无限制"的界

### 1.1 靶子是谁立的

Arnold 猜想的非退化形式（Floer–Fukaya–Ono–Liu–Tian–Ruan 一系：非退化 Hamiltonian 微分同胚的不动点数 $\ge\sum b_i$）是辛拓扑几十年的成功故事。但它的成功把一个更朴素的问题压到了阴影里：**如果不假设非退化，下界还能是多少？** 允许退化临界点时，光滑函数临界点数的最小值是

$$\Crit(M)=\min_{h\in C^\infty(M,\R)}\#\CritSet(h),$$

LS 理论给 $\operatorname{cuplength}(M;\mathbb Q)\le\Crit(M)$（含单位元约定）。于是有两条"无限制"表述（Golovko 2020 记为 Conjectures 1.4 与 1.6）：对一切 $\phi\in\Ham(M,\omega)$，

$$\#\Fix(\phi)\ge\Crit(M),\qquad\text{以及}\qquad \#\Fix(\phi)\ge\operatorname{cuplength}(M;\mathbb Q).$$

正面结果的谱系都在特定流形上成立：Conley–Zehnder 1983（环面 $T^{2n}$，$2n+1$ 个）、Fortune 1985（$\CP^n$，$n+1$ 个）、Hofer 1988（$\pi_2=0$ 时的杯长界）、Rudyak–Oprea 1999（辛类与第一陈类在 $\pi_2$ 上为零时的完整临界数界）。这些流形没有正面积球面；**二次超曲面有**，所以它恰好落在已知正面结果覆盖不到、，并非退化 Floer 又不管退化的夹缝里。

我盯上 $Q^3=\{[z]\in\CP^4:\sum z_j^2=0\}$ 的理由是三件事同时成立：

1. 它有正面积球面（Fano），Rudyak–Oprea 的假设不满足；
2. 它有一个**辛**对合 $A=[z_0:-z_1:-z_2:-z_3:-z_4]$，固定集 $F=Q^3\cap\{z_0=0\}\cong S^2\times S^2$，而 $S^2\times S^2$ 是已知存在三临界点函数的最小非平凡流形（Takens 1968 的球面乘积构造，$S^2\times S^2$ 情形经 Mare 1997 记录）；
3. cuplength 和体积下界都逼到 4，而 Gong（arXiv:2507.04191v5）证明 $n\ge2$ 的复二次超曲面上每个 Hamiltonian 微分同胚至少 $n$ 个不动点，$n=3$ 时下界恰是 3。**如果我能造出 3 个不动点的映射，它同时打破 $\Crit=4$ 的界并达到 Gong 下界，一步顶到头。**

[推测] 为什么以前没人做：非退化 Floer 的巨大成功让"数不动点"的社区默认了 Morse 型计数，而退化不动点在 Floer 框架里是要被微扰掉的噪音。要看到这个反例，必须先接受"退化不动点是合法的计数对象"，这一步观念上的转弯比技术更难。反例的计数**包含全部不动点**，所以连"只数可缩轨道"这种补救都被堵死（论文原话：imposing a contractibility condition on their Hamiltonian trajectories cannot restore either inequality）。

### 1.2 主定理的精确内容

```latex
\begin{theorem}
There is a smooth Hamiltonian diffeomorphism $\phi$ of the closed connected
symplectic six-manifold $Q^3$ such that
 $\#\Fix(\phi)=3<4=\Crit(Q^3)=\operatorname{cuplength}(Q^3;\mathbb Q)$.
At least one fixed point of $\phi$ is degenerate.
\end{theorem}
```

"退化反例"四层含义，逐条说清（每层都是有人会去钻的口子）：

1. **两个界同时倒**：3 同时低于 $\Crit=4$ 与 cuplength $=4$，临界数形式与杯长形式一起被否定。
2. **计数含全部不动点**：不能靠加轨道条件挽救。
3. **退化是本质的**：$S^2\times S^2$ 的 Betti 数和是 4（$(1,0,2,0,1)$），Morse 函数最少 4 个临界点；三临界点函数必然非 Morse，$q_0$ 的 Hessian 本征值 $1,-1,0,0$、秩 2。若把计数限制在 Morse 不动点上，这个例子消失。
4. **与非退化 Arnold 不等式相容**：反例有退化不动点，Floer 型 $\sum b_i$ 下界的假设不满足，不冲突。

它还顺带否定了 Ma 2013（arXiv:0808.0613v7, Theorem 1.5）"Hamiltonian 微分同胚最少不动点数总等于 $\Crit(M)$"的断言，这断言正是"无限制界"的一种强形式。

### 1.3 证明总图

四块积木：**迁移**（有限阶映射把不动点问题化为固定集上的临界点问题，Prop 2.1 + 短周期引理 2.2）→ **对合**（$Q^3$ 的辛对合与固定集 $S^2\times S^2$，Prop 3.1）→ **三临界点**（显式函数 $f$ 及其完整临界集，Prop 4.1 + 退化注记 4.2）→ **下界**（LS 微分形式证明 + 辛体积 + 二次超曲面的杯长，Lemma 5.1 + Cor 5.2/5.3）。组装与退化性验证收尾。


## 二、迁移：命题 2.1，全篇的动力学心脏

### 2.1 陈述与思路来源

```latex
Let \((M,\omega)\) be a closed symplectic manifold, and let
\(A\in\Ham(M,\omega)\) satisfy \(A^m=\id\) ... Suppose that \(F=\Fix(A)\)
is a closed embedded submanifold and that
\(T_qF=\ker(dA_q-\id)\) for every \(q\in F\).
For every smooth function \(f:F\to\R\), there is a smooth \(A\)-invariant
extension \(K\) such that ... for every sufficiently small \(\varepsilon>0\)
the map \(\phi_\varepsilon=A\circ B_\varepsilon\) is Hamiltonian and
satisfies \(\Fix(\phi_\varepsilon)=\CritSet(f)\).
```

条件 $T_qF=\ker(dA_q-\id)$ 是通常的 *clean fixed set* 条件。我的出发点是一个朴素的观察：**$\Fix(A)=F$ 是整个曲面时不动点无穷多，要减少不动点必须扰动；但扰动 $A$ 本身会毁掉固定子流形的结构**（clean fixed set 在扰动下立刻破坏，固定曲面可能"冒泡"成孤立点或消失）。正确的方式是**复合式扰动**：$\phi_\varepsilon=A\circ B_\varepsilon$，扰动严格限制在 $A$ 的固定几何上，让 $\phi_\varepsilon$ 的不动点只能出现在 $A$ 已经不动的地方，然后再用动力学恒等式把"哪些点不动"精确刻画成 $K$ 的临界性。

### 2.2 逐步推导（八步）

**第一步：延拓设计**。在 $F$ 的子流形图卡上把 $f$ 延拓成**不依赖法向坐标**的 $\widetilde f$，用单位分解拼成整体的。设计意图：$d\widetilde f$ 在 $F$ 的切方向上等于 $df$，法向上可能非零，法向部分会被平均消掉。

**第二步：$m$ 折平均**。$K=\frac1m\sum_{j=0}^{m-1}\widetilde f\circ A^j$。由 $A^m=\id$（指标轮换）得 $K\circ A=K$；由 $A|_F=\id$ 得 $K|_F=f$。

**第三步：平均微分是投影**。固定 $q\in F$，$D=dA_q$，$P_q=\frac1m\sum_j D^j$。由 $D^m=\id$：$DP_q=P_q$（$\frac1m\sum_{j=1}^m D^j=\frac1m\sum_{j=0}^{m-1}D^j$）；若 $Dv=v$ 则 $P_qv=v$。所以 $P_q$ 是到 $\ker(D-\id)=T_qF$ 的线性投影。**只用了 $D^m=\id$**，不需要可对角化。

**第四步：对称临界性**。链式法则 + 线性性：$dK_q=\frac1m\sum_j d\widetilde f_q\circ D^j=d\widetilde f_q\circ P_q$（$d\widetilde f$ 在同一点求值，因 $A^jq=q$）；再用第一步"延拓不依赖法向"：

$$dK_q(v)=d\widetilde f_q(P_qv)=df_q(P_qv)\ \Longrightarrow\ \CritSet(K)\cap F=\CritSet(f).$$

这是 Palais 对称临界原理的有限群情形，论文自己直接验证（"which we verify directly"）而不引用。

**第五步：流与 $A$ 交换**。$A$ 辛且 $K\circ A=K$：$\iota_{dA\cdot X_K}\omega=(A^*(\iota_{X_K}\omega))\circ$ 拉回计算 $=d(K\circ A)=dK$（辛性消拉回），故 $dA_qX_K(q)=X_K(q)$，由解的唯一性 $A\circ B_s=B_s\circ A$。

**第六步：短周期排除**（引理 2.2，见 2.3）。对 $X_K$ 得 $\delta>0$：$0<t<\delta$ 时 $\Fix(B_t)=\CritSet(K)$。取 $0<\varepsilon<\delta/m$。

**第七步：幂恒等式与不动点刻画**。交换性 + $A^m=\id$：

$$\phi_\varepsilon^m=(A\circ B_\varepsilon)^m=A^m\circ B_\varepsilon^m=B_{m\varepsilon}\qquad(m\varepsilon<\delta).$$

这是整个命题的枢纽，它把"求 $\phi_\varepsilon$ 的不动点"化成"求向量场短时流的驻点"。分两个方向：

- 若 $\phi_\varepsilon(q)=q$，则 $q$ 被 $\phi_\varepsilon^m=B_{m\varepsilon}$ 固定，故 $dK_q=0$；又 $q\in\Fix(B_{m\varepsilon})=\CritSet(K)$ 且 $m\varepsilon<\delta$，再次用引理 2.2（$0<\varepsilon<m\varepsilon$）得 $q\in\Fix(B_\varepsilon)$；代回 $\phi_\varepsilon(q)=q$ 得 $A(q)=q$，即 $q\in F$；结合第四步，$q\in\CritSet(f)$。
- 反之，$\CritSet(f)$ 的点满足 $X_K(q)=0$（故 $B_\varepsilon(q)=q$）且 $A(q)=q$，被 $\phi_\varepsilon$ 固定。

**第八步：$\phi_\varepsilon$ 确实是 Hamiltonian 的**（"For completeness"段）。取 $\id$ 到 $A$ 的 Hamiltonian 道路 $A_t$（生成元 $H_t$）与平坦端点的 $a:[0,1]\to[0,1]$，定义

$$L_t=\begin{cases}2\varepsilon a'(2t)K,&0\le t\le\tfrac12,\\ 2a'(2t-1)H_{a(2t-1)},&\tfrac12\le t\le1.\end{cases}$$

两段在拼接处 $a'=0$ 故光滑；第一段累计 $\int_0^{1/2}2\varepsilon a'(2t)\,dt=\varepsilon$，流为 $B_\varepsilon$ 的重参数化；第二段走 $A_{a(2t-1)}\circ B_\varepsilon$；时间一映射恰为 $\phi_\varepsilon$。

### 2.3 引理 2.2（短周期排除）与它的必要性

```latex
Let \(X\) be a smooth vector field on a closed manifold \(M\), and let
\(\Psi_t\) be its flow. There is \(\delta>0\) such that
\Fix(\Psi_t)=\{q:X(q)=0\} for every \(0<t<\delta\).
```

零点是驻点当然被每个 $\Psi_t$ 固定；实质是排除**任意短的非常周期轨道**。反证：$t_j\to0$、$\Psi_{t_j}(q_j)=q_j$、$X(q_j)\ne0$；取子列 $q_j\to q$，晚到的轨道段落入坐标球，$V$ Lipschitz 常数 $L$。记 $C_j=\max_{0\le s\le t_j}|\dot u_j(s)|>0$（$C_j>0$ 因为 $X(q_j)\to X(q)\ne0$）。加速度估计：$|\dot u_j(s)-\dot u_j(r)|\le L|u_j(s)-u_j(r)|\le LC_jt_j$。闭轨道速度均值 $C_j=\left|\frac1{t_j}\int_0^{t_j}(\dot u_j(s_j)-\dot u_j(r))\,dr\right|\le LC_jt_j$。除以 $C_j>0$：$1\le Lt_j\to0$，矛盾。

**为什么两个时刻都要在窗口内**：第七步反推方向 "$q$ 被 $B_{m\varepsilon}$ 固定 $\Rightarrow q$ 被 $B_\varepsilon$ 固定" 用的是引理 2.2 应用于 $\varepsilon$（不是 $m\varepsilon$），若 $X_K$ 有任意短的非常周期轨道，$q$ 可能是 $B_{m\varepsilon}$ 的 $m$ 周期点，并非 $B_\varepsilon$ 的不动点，整个"回到 $A$ 不动"的推理断掉。短周期引理同时封死两条缝。$\varepsilon<\delta/m$ 恰好让 $\varepsilon$ 与 $m\varepsilon$ 都压进 $\delta$。

### 2.4 假设的机械理由与 [推测] 失败路线

**假设**。$A^m=\id$ 同时供给：(i) 平均算子是投影、(ii) 幂恒等式、(iii) $K\circ A=K$，缺一不可。clean fixed set 条件没有它，$P_q$ 投影到 $D$-不动子空间但那不必是 $T_qF$，第四步的 $dK_q(v)=df_q(P_qv)$ 就不再等价于"$F$ 上环境临界 = $f$ 临界"。$a$ 的端点平坦性保证拼接光滑与两段时间的精确累计。命题结尾的 remark 值得记住：**$K$ 的环境临界点个数不受任何约束**，$F$ 之外的临界点 $q$ 满足 $\phi_\varepsilon(q)=A(q)\ne q$，不贡献不动点。"环境临界点很多、不动点很少"的相容性就在这里。

**[推测] 失败路线**。

1. **在退化点附近用隐函数定理**：不动点方程在非退化不动点附近线性化即可；但 $q_0$（Hessian 有核）处 $d\phi_\varepsilon-\id$ 奇异，隐函数定理失效，而这恰是必须保留的点。幂恒等式把问题化成向量场零点，绕开线性化，这是能处理退化点的关键设计。
2. **用连续群代替有限阶**：circle action 的返回映射 + Haar 平均看似更自然，但 $A^m=\id$ 换成"$A$ 是流的时间映射"后 $\phi_\varepsilon^m$ 不再化简（除非可公度），第七步失效；且连续对称下 $\CritSet(K)$ 含整条群轨道，刻画变粗。
3. **只对 $m\varepsilon$ 用引理 2.2、忘了 $\varepsilon$**：如上，反推半边失效。这是我 [推测] 自己真的差点犯的错，幂恒等式方向的不动点个数与 $\phi_\varepsilon$ 方向不一定相同。
4. **要求 $\CritSet(f)$ 有限**：命题对任意光滑 $f$ 成立，不需要有限性；实际应用里 $f$ 恰有三个孤立临界点，自然满足。


## 三、对合：命题 3.1，几何选型

### 3.1 六步推导

**对象**：$A[z_0:z_1:z_2:z_3:z_4]=[z_0:-z_1:-z_2:-z_3:-z_4]$，要求证它是 Hamiltonian 的、$\Fix(A)=M\cap\{z_0=0\}\cong S^2\times S^2$、切分裂 $T_qM=T_qF\oplus\C\partial_{w_0}$ 上 $dA$ 作用 $+\id/-\id$。

1. **光滑性**：仿射卡里方程 $1+\sum w_j^2=0$ 的微分不能为零（常数项 1 提供梯度"余量"），$M$ 光滑、复维 3、紧无边。
2. **连通性（SO(5) 轨道）**：$z=x+iy$ 非零迷向 ⟺ $|x|=|y|>0$、$x\cdot y=0$；缩放后是有序正交规范对，可扩成正定向正交基，单一 $\mathrm{SO}(5)$ 轨道，$M$ 连通。
3. **FS 形式与归一化**：$S^9$ 上 $\alpha=\sum(x_j\,dy_j-y_j\,dx_j)$；$d\alpha(iz,v)=-2\operatorname{Re}\sum\overline{z_j}v_j=0$ 于切向量（水平性），$d\alpha$ 下降为 $\CP^4$ 的 $(1,1)$ 形式 $\sigma$；$d\alpha(v,iv)=2|v|^2$ 给正性，**归一化因子 2 由这个等式确定**，Lean 里 `omega v w = 2*(∑ star v w).im` 与之精确对应。
4. **一族 Hamiltonian 旋转**：$\Phi_t^{a,b}$ 固定 $z_0$、把 $(z_1,z_2)$、$(z_3,z_4)$ 分别用 $R_{at}$、$R_{bt}$ 旋转；Cartan 公式 $\iota_Zd\alpha=-d(\alpha(Z))$，$\alpha(Z_{a,b})$ 相位不变（实系数旋转与数乘交换）故下降为 $g_{a,b}$，$G_{a,b}=-g_{a,b}|_M$ 生成投影后的旋转：

$$G_{a,b}([z])=\frac{2a\,\Im(\overline{z_1}z_2)+2b\,\Im(\overline{z_3}z_4)}{\sum_j|z_j|^2}.$$

   **符号 $G=-g$** 由 $\iota_Zd\alpha=-d\alpha(Z)$ 与约定 $\iota_{X_G}\omega=dG$ 共同决定，号不匹配会让 $A$ 变成 $-\id$ 流。$A=\Phi_1^{\pi,\pi}$：等速 $\pi$、时间 1，两个平面同时转半周。
5. **固定集**：固定射影点落在 $\operatorname{diag}(1,-1,-1,-1,-1)$ 的本征空间；正本征线 $[1:0:0:0:0]$ 不在 $M$ 上（$1^2\ne0$），负本征空间给 $F$。$F\cong\CP^1\times\CP^1\cong S^2\times S^2$：$(z_1,z_2,z_3,z_4)\mapsto\begin{pmatrix}z_1+iz_2&z_3+iz_4\\-z_3+iz_4&z_1-iz_2\end{pmatrix}$ 行列式 $=z_1^2+z_2^2+z_3^2+z_4^2$，把 $F$ 认同"射影化秩一矩阵"；$([u],[v])\mapsto[uv^{\mathsf T}]$ 是微分同胚。**下面只用光滑认同，不用等距结构。**
6. **切分裂**：卡 $z_j=1$，$A$ 把 $w_0\mapsto-w_0$；方程 $w_0^2+1+\sum w_k^2=0$ 在 $q$（$w_0=0$）处对 $w_0$ 方向无约束（$w_0^2$ 线性化为零），其余方向核恰为 $T_qF$。

### 3.2 选型的机械理由

- **为什么等速 $(\pi,\pi)$**：$R_\pi=-I_2$，半周即对合。**同一族旋转还要干第二件事**：不等速的 $G_{1,2}$ 之后要实现 $\Crit(Q^3)\le4$ 的上界（第五节），一族参数两用，这是设计上的节省。
- **为什么必须是复线性对合**：[推测] 我考虑过复共轭 $[z]\mapsto[\bar z]$，它反辛（$\omega\mapsto-\omega$），不在 $\Ham$ 里，第五步"流与 $A$ 交换"当场失效；固定集 $\RP^3$ 是 Lagrangian 的，法向平均结构也不对。
- **为什么不能要孤立不动点的对合**：辛对合在不动点处 $dA$ 是对合型辛矩阵，$-1$ 本征空间必须偶复维（$\det=1$）；孤立不动点迫使 $dA=\id$，Bochner 型论证给固定点集维数 $>0$，矛盾。所以 $F$ 必须是正维数曲面；$\operatorname{diag}(1,1,-1,-1,-1)$ 型对合的固定集是两个孤立点 $[1:\pm i:0:0:0]$，不满足 clean fixed set。
- **为什么是 $Q^3$**：[推测] 我考虑过 $\CP^3$（Fortune 型下界 $n+1=4$ 已有正面结果，没有反例空间）和 $S^2\times S^2\times S^2$（没有合适的辛对合把固定集降到三临界点流形）。$Q^3$ 的独特之处是"对合几何"（固定集 $S^2\times S^2$）与"固定集拓扑"（存在 3 临界点函数）两端同时凑巧。


## 四、三临界点函数：命题 4.1，数字从哪里来

### 4.1 函数与动机

$$f:S^2\times S^2\to\R,\qquad f(x,y)=e\cdot x+(x-p)\cdot y,\qquad p=(0,0,1),\ e=(1,0,0).$$

设计意图先说清楚：纯双高度 $e\cdot x+e'\cdot y$ 有 4 个临界点（极点组合）；耦合项 $(x-p)\cdot y$ 让第二个球的高度方向**随 $x$ 移动**，在特定位置把两个高度临界点合并成一个简并临界点，这正是把 LS 下界 $\operatorname{cuplength}(S^2\times S^2;\mathbb Q)=3$ 实现为确切 3 个的方式。Morse 途径不可能：Betti 和为 4，任何 Morse 函数至少 4 个临界点；三临界点函数必然退化。所以我**不引用 Takens/Mare 的存在性定理**（它给不出退化点的孤立性，也转不成 Lean 可验证的多项式等式），是完整算出临界集。

### 4.2 逐步消元（一步不跳）

开场观察：固定 $x\ne p$ 时 $y$-依赖是高度函数（方向 $x-p$），临界 $y=\pm(x-p)/|x-p|$；$x=p$ 的例外纤维单独处理。

**第一步：乘子方程**。

$$e+y=\lambda x,\qquad x-p=\mu y,\qquad |x|=|y|=1.$$

**第二步：例外纤维 $x=p$**。第一式给 $y=-e+\lambda p$；$|y|^2=1+\lambda^2$（$e\perp p$）为 1 强制 $\lambda=0$，得 $q_0=(p,-e)$，$f(q_0)=0$（第二式取 $\mu=0$ ✓）。

**第三步：高度分支**。$t=|x-p|>0$，$y=s(x-p)/t$，$s\in\{\pm1\}$；代入第一式 $te-sp=(\lambda t-s)x$；左边 $\ne0$（$t>0$、$e\perp p$ 线性无关），故 $x$ 在 $e$-$p$ 平面里，写 $x=(u,0,w)$。由 $t^2=|x-p|^2=u^2+(w-1)^2=2-2w$ 得 $w=1-\tfrac{t^2}2$。

**第四步：切向消 $\lambda$**。与切向量 $(w,0,-u)$ 内积（$x\cdot(w,0,-u)=0$）：

$$0=(e+y)\cdot(w,0,-u)=w+\frac{su}{t}\ \Longrightarrow\ u=-stw.$$

**第五步：一元方程**。$u^2+w^2=1$ 代入：

$$0=(1-t^2/2)^2(1+t^2)-1=\frac{t^4(t^2-3)}{4}.$$

（展开核对：$(1-t^2+\tfrac{t^4}4)(1+t^2)=1+t^4/4-t^6/4+\dots$ 精确为 $1+\tfrac{t^4}4-\tfrac{t^6}4-1=\tfrac{t^6-3t^4}4$ ✓。）因 $t>0$：$t=\sqrt3$、$w=-\tfrac12$、$u=s\tfrac{\sqrt3}2$。**注意 $x=-p$（$t=2$）被排除**，那本是第四个候选：那里 $w=-1$、$u=0$、切向方程 $-1\ne0$。

**第六步：验证**。$q_s=\left(\left(\tfrac{s\sqrt3}2,0,-\tfrac12\right),\left(\tfrac12,0,-\tfrac{s\sqrt3}2\right)\right)$，$\lambda=\mu=s\sqrt3$（$\lambda t-s=2s\ne0$ ✓），临界值 $f(q_s)=s\tfrac{3\sqrt3}2$（$e\cdot x=s\sqrt3/2$，$(x-p)\cdot y=s\sqrt3$，合计）。$x=p$ 与 $x\ne p$ 穷尽定义域，恰三点。

### 4.3 为什么是 $\sqrt3$

它不是凑出来的：$x$ 必须在 $e$-$p$ 平面（第三步），又必须与 $p$ 的纬度协调（第四步把 $u$ 锁到 $w$），两个约束相除只剩 $t^4(t^2-3)/4=0$。$\sqrt3$ 是 $e\cdot x$ 的系数 1、耦合项的移位量 $|p|=1$、单位球半径三者的联立输出。

### 4.4 Remark 4.2：退化性的显式化

$q_0$ 附近的图卡：$x=(u,v,\sqrt{1-u^2-v^2})$（北极附近）、$y=(-\sqrt{1-a^2-b^2},a,b)$（南极附近）。展开：$e\cdot x=u$；$(x-p)\cdot y\approx-u+va+O(\|(u,v,a,b)\|^3)$（第一项 $-u$ 与 $e\cdot x$ 相消；其余交叉项三阶起）。所以

$$f=va+O(\|(u,v,a,b)\|^3),$$

Hessian 本征值 $1,-1,0,0$、秩 2。**孤立性不是 Hessian 给的**（Hessian 有核），是命题 4.1 的穷尽分类给的：$q_0$ 是 $x=p$ 纤维上唯一临界点，附近无可聚集者。[推测] 若试图在 $Q^3$ 环境坐标里取 Hessian 的核来证退化，法向 Hessian 依赖延拓 $K$ 的取法（平均会改变法向二阶项），路线失败；最终论文的退化论证只在不变子空间 $T_{q_0}F$ 内进行（第六节）。

### 4.5 [推测] 失败路线

1. **找 Morse 的三临界点函数**：不存在（Betti 和 4）。构造方向必须容忍退化，这是选型时就定死的。
2. **用更对称的函数**（$x\cdot y$ 加高度）：$x\cdot y$ 的临界集是对角线与反对角线（连续流形），不能计数；要破 $\mathrm{SO}(3)\times\mathrm{SO}(3)$ 对称到恰好剩一个 $\mathbb Z/2$（$s=\pm$），否则临界流形不坍缩成点。$p$ 北极、$e$ 东极是最简破缺。
3. **压到 2 个临界点**：与 cuplength $=3$ 矛盾，Takens 下界封死。3 是终点。


## 五、下界：引理 5.1 与两个推论，四这条线的来源

### 5.1 引理 5.1：LS 下界对**退化**函数也成立

```latex
Suppose there are classes \(a_j\in H^{d_j}(M;\R)\), \(d_j>0\), such that
\(a_1\smile\cdots\smile a_r\ne0\). Then every smooth function on \(M\)
has at least \(r+1\) critical points.
```

**没有 Morse 假设**，这是引理对反例性命攸关的一点。我选微分形式证明（Weber 2019 的现代处理；原始 LS 1934），核心是构造一个"每个成员都微分同胚于坐标球之并"的覆盖：

1. 反设 $h$ 至多 $r$ 个临界点；把互异临界值排成 $c_1<\cdots<c_k$，$k\le r$（紧性保证最值在内）。
2. 每个临界值周围选"囚笼" $U_i\supset\overline V_i$（不交坐标球之并），流速有界给 $T_i$：$U_i$ 外出发的轨道在 $[0,T_i]$ 不进 $V_i$。
3. 窄能带参数：$V_i$ 外 $|\nabla h|^2\ge b_i>0$（紧性；空集任取），选互不相交的 $[c_i-\epsilon_i,c_i+\epsilon_i]$ 且 $2\epsilon_i<T_ib_i$。沿负梯度流 $\frac{d}{dt}h=-|\nabla h|^2$：

$$g_{T_i}(P_{c_i+\epsilon_i}\setminus U_i)\subset P_{c_i-\epsilon_i}.$$

4. 相邻层之间再流 $S_i$（无临界点的紧能带、梯度正下界 ⟹ 有限时间够）。
5. 归纳覆盖：$P_{c_1+\epsilon_1}\subset U_1$ 起，逐层 $P_{c_i+\epsilon_i}$ 被 $U_i$ 与先前覆盖集的流原像盖住；$g_t$ 是微分同胚 ⟹ 成员保持"球之并"形状；最上层是全空间。
6. **形式操作**：$\alpha_j=d\lambda_j$ 于 $O_j$（Poincaré 引理逐球）；单位分解 $\psi_j$ 加截断 $\chi$（$[0,\tfrac1{4k}]$ 零、$[\tfrac1{2k},1]$ 一），令 $\rho_j=\chi(\psi_j)$，每点附近必有某个 $\rho_j\equiv1$。修正 $\alpha'_j=\alpha_j-d(\rho_j\lambda_j)$ 同类，且逐点至少一个恒为零，故

$$\alpha'_1\wedge\cdots\wedge\alpha'_k=0\ \Longrightarrow\ a_1\smile\cdots\smile a_k=0,$$

与 $a_1\cdots a_r\ne0$、$k\le r$ 矛盾。

**截断 $\rho_j=\chi(\psi_j)$ 是枢纽**：直接用 $\psi_j\lambda_j$ 不行，$d(\psi_j\lambda_j)$ 在 $\psi_j$ 变化的区域引入非 $\alpha_j$ 的修正项，"逐点至少一个为零"不成立。$\chi$ 把小 $\psi$ 压成恒零（支撑紧含）、大 $\psi$ 压成恒一（修正精确还原 $\alpha_j$），同时造出逐点单位性与支撑控制。

**[推测] 失败路线**。Morse 理论途径（handle 分解）要先扰动 $h$ 成 Morse，扰动改变临界点个数，"至多 $r$ 个"在扰动下失控；覆盖式证明完全不扰动，这是它能覆盖退化情形的全部原因。直接引用 LS category 也可以，但 cat 与杯长的联系是深层结果、且可能带 Morse 假设；一步到位更干净。覆盖成员必须取"球之并"，并非"可缩开集"，Poincaré 引理要星形/球，可缩不够。

### 5.2 推论 5.2：辛体积逼出 $n+1$

$[\omega]^n\ne0$（$\int_M\omega^n>0$，辛定向），引理 5.1 取 $a_1=\cdots=a_n=[\omega]$：每个光滑函数至少 $n+1$ 个临界点。$n=3$：$Q^3$ 上**任何**光滑函数至少 4 个临界点。这就是引言说的 "symplectic volume forces every smooth function on the ambient $Q^3$ to have at least four critical points"。

### 5.3 推论 5.3：$Q^3$ 的 $\Crit=$ cuplength $=4$，下界与上界夹逼

**下界（杯长 $\ge4$）**：超平面类 $h=c_1(\mathcal O_{Q^3}(1))$；$Q^3$ 在 $\CP^4$ 中次数为 2（$d$ 次超曲面与一般射影直线相交 $d$ 点），故 $h^3=2[\mathrm{pt}]\ne0$，cuplength $\ge4$。整数计算干净，有理化后与引理的 $\R$ 系数衔接（$H^*(;\mathbb Q)\to H^*(;\R)$ 单射且保杯积）。

**上界（$\Crit\le4$）**：不等速旋转 $G_{1,2}$，生成元 $T=\operatorname{diag}(0,J,2J)$，本征值 $0,\pm i,\pm2i$ 互异；射影向量场零点 ⟺ $Tz\in\C z$ ⟺ 本征线；零本征线 $[1:0:0:0:0]$ 不在 $Q^3$ 上，其余四条 $[0:1:\pm i:0:0]$、$[0:0:0:1:\pm i]$ 全部满足二次方程（$1^2+(\pm i)^2=0$ ✓）。恰 4 个临界点：

$$4\le\operatorname{cuplength}(Q^3;\mathbb Q)\le\Crit(Q^3)\le4.$$

**速度 $(1,2)$ 的机械理由**：互异本征值 ⟹ 射影零点只有本征线（逐点查 5 条）；若 $a=b$（等速），$T=\operatorname{diag}(0,J,J)$ 重本征值，零点集含整族固定圆环，数不出 4。且零本征线必须不在 $Q^3$ 上，否则多一个临界点。

**[推测] 失败路线**。只证杯长下界不管上界：主定理需要 $3<4=\Crit$，没有 $G_{1,2}$ 的实现就只有 $\Crit\ge4$，数 3 没有可比对象。用 Morse 函数实现上界：$Q^3$ 的 Betti 和是 5（$H_2\cong\mathbb Z^3$），Morse 途径最少 5 个；4 < 5，所以 $G_{1,2}$ 的临界点必有退化者，这恰是"临界数 4 < Morse 数 5"的具体体现，也是 $\Crit$ 与 Morse 数概念分离的现场演示。


## 六、组装与退化性：第六节的两件收尾

### 6.1 组装

命题 3.1 给 $(M,\omega)$、$A$、$F\cong S^2\times S^2$；命题 4.1 的 $f$ 搬到 $F$（恰三临界点）；命题 2.1 给 $A$-不变延拓 $K$、流 $B_s$；取小 $\varepsilon$，$\phi=A\circ B_\varepsilon$ 是 Hamiltonian 微分同胚且

$$\Fix(\phi)=\CritSet(f),\qquad \#\Fix(\phi)=3<4=\Crit(Q^3)=\operatorname{cuplength}(Q^3;\mathbb Q).$$

与 Gong 下界的匹配：$n=3$ 时每个 Hamiltonian 微分同胚至少 3 个不动点，反例**达到**下界，没有任何 further slack。归一化差异（Gong 的 FS 形式差一个正标量）不碍事：rescaling 形式与生成 Hamiltonian 同倍数不改变向量场，Hamiltonian 群不变。

### 6.2 退化性验证（七步，全部在 $T_{q_0}F$ 内）

1. $\omega_F=\omega|_F$ 辛（命题 3.1 的正性限制），$X_f$ 是 $(F,\omega_F)$ 上 $f$ 的 Hamiltonian 场。
2. **$X_K$ 切于 $F$**：$K\circ A=K$ 给 $dA_qX_K(q)=X_K(q)$（第五步的拉回计算），而固定切空间恰是 $T_qF$，故 $X_K(q)\in T_qF$。注意这是**每一点**的事实（$A$-不变性处处成立），不只是 $F$ 上。
3. **限制等式**：$\iota_{X_K}\omega=dK$ 限制到 $TF$：$X_K|_F=X_f$。
4. **$B_s$ 保持 $F$**：$X_K$ 处处切于闭子流形 $F$，轨道不离开。
5. **线性化在本征核上为零**：对 $\iota_{X_f}\omega_F=df$ 求微分，$\omega_F(DX_f(q_0)v,w)=\operatorname{Hess}_{q_0}f(v,w)$（辛非退化把 Hessian 与 $DX_f$ 等同），Hessian 核中任何非零 $v$ 满足 $DX_f(q_0)v=0$。
6. **本征值 1**：$A|_F=\id$、$q_0$ 平衡：

$$d\phi_{q_0}v=\exp(\varepsilon DX_f(q_0))v=v.$$

7. **与延拓无关**：整段只在不变子空间内；"no assumption on the normal Hessian of the extension $K$ is needed"。

[推测] 为什么这么干净：$q_0$ 的退化方向在 $T_{q_0}F$ 内，而 $A$ 在其上恒等、$B_\varepsilon$ 的线性化在核方向是零的指数，两个因子各自"平凡"，乘积在核方向必为恒等。任何把退化方向放到法向的方案都被延拓的任意性破坏。**另一个 [推测] 值得记录**：担心 $B_\varepsilon$ 不保持 $F$？不会，第 2 步是每点的切性，比"$F$ 上切于 $F$"强；这是 $A$-不变性（对 $A$ 本身，不是对某条到 $A$ 的同痕）的直接红利，命题 2.1 结尾特意强调过这一点。


## 七、Lean 镜子：5841 行告诉我的事

Lean 形式化（36 文件单条线性 import 链，permitted axioms 仅 propext/Quot.sound/Classical.choice，无 sorry）与论文有三处**整体替换**、若干处"一句带过被迫展开"。这是全篇取证最值钱的部分。

### 7.1 桥接一：Hamiltonian 流 → 隐式中点映射

论文的 $B_s$ 依赖 ODE 存在性定理；Mathlib 没有"流形上的 Hamiltonian 流"。Lean 的替换：

- **resolvent**：$u=z+\tau X(u)$ 的唯一不动点（Banach 压缩，$\|\tau\|C<1$，$C$ 是截断向量场的 Lipschitz 常数）；`step = 2·resolvent − z` 即隐式中点法的整步。**不需要任何流存在定理**；光滑性与可逆性由隐函数定理给（$\|\tau\,dX\|<1$）。
- **离散守恒律**（`MidpointGeometry.quadratic_skew`，最漂亮的一条）：$v$ 同时切于球面与二次锥（SkewAt）时，$\text{normSquared}(z+s v)=\text{normSquared}(z)+s^2\text{normSquared}(v)$、$\text{quadricPolynomial}(z+sv)$ 同型，中点两端 $s^2$ 项相消，step 精确保持单位锥与二次型。**流保持能量面被离散恒等式替代**。
- **Hamiltonian 方程精确成立**（不是近似！）：修正 Hamiltonian $2\tau' K\circ R_{-\tau}$ 满足逐点 Hamiltonian 方程；证明由 $\sigma(X(\cdot))=dK(\cdot)$ 的二阶对称性 $\sigma(dX_ua,b)=-\sigma(a,dX_ub)$ 与 resolvent 微分方程联立消元。中点法在这里是**严格**的离散化。
- **具体参数**：$\varepsilon=\frac1{100(C+1)}$、$\tau(t)=\varepsilon\sin(\pi t/2)$、$\|\tau\|C<\tfrac1{10}$。论文的 "sufficiently small" 在 Lean 里被**三层约束**夹出显式值：(a) 压缩性 $\|\tau\|C<1$；(b) 中心范数窗 $\tfrac12<\text{normSquared(center)}$ 保证截断恒 1 区域；(c) Cayley 相位可解 $|\varepsilon b|\le\tfrac3{100}<1$（$b$ 的界 3 来自三临界点的竖直系数）。
- **短周期引理整体消失**：压缩映射的唯一性取代了 Lipschitz 均值估计 + Yorke 型窗口，形式化选择了对机器友好，并非对论文忠实的路线，且更初等。

### 7.2 桥接二：LS 杯积 → Haar 积分 + join 阻碍

论文引理 5.1（梯度流覆盖 + 单位分解截断 + Poincaré）在 Lean 里整个被替换成一个显式 Hopf 型阻碍：

- **O(5) 与 Haar**：核心引理，紧群上光滑函数沿斜方向右平移的导数积分为零（`integral_extDeriv_rightMul_eq_zero`）：参数积分微分 + 右平移不变 + 两导数相等。注释明说 "Unlike a manifold Stokes interface, this is proved directly from Haar invariance"，**这是 LS 杯积 → Haar 积分替换的确切位置**。
- **轨道映射**：基点 $\text{base}=(\sqrt{\tfrac12},\,i\sqrt{\tfrac12},0,0,0)$（单位迷向），`orbitProjection: A ↦ A·base` 把 $O(5)$ 铺满单位迷向锥；六个斜生成元的**括号方向恰好落在圆纤维方向** $i\cdot\text{base}$ 上（`generators_bracket_base`），$O(5)/O(3)\cong V_2(\R^5)$ 的纤维结构以纯代数条件（"括号基本性"）进入假设。$\omega^3$ 在六个铺开方向的值是常数 **48** $=3!\cdot2^3$（因子 3! 来自楔积排列和、$2^3$ 来自归一化因子 2），它扮演论文里 $h^3=2[\mathrm{pt}]\ne0$ 的角色，但以显式常数出现。
- **阻碍定理**（`no_unit_equivariant_map`）：不存在光滑圆等变映射（单位迷向锥 $\subset\C^5$）$\to$（单位球 $S^3\subset\C^3$）。证明：join 同伦 $(\cos t\cdot\text{orbit},\sin t\cdot F(\text{orbit}))$；$\Theta=\omega^3$ 拉回；竖直/时间方向的基本性逐一压零（含 `fderiv_circle_equivariant`，"对真实的圆等变性求微分，并非假设其无穷小推论"）；Haar 同伦不变性给积分与 $t$ 无关；$t=0$ 端值 $48$、$t=\pi/2$ 端值 $0$（$\C^3$ 球面上切于 $d(\text{normSq})$ 核的 6 个向量线性相关），$48\cdot\mu=0$ 与 Haar 全测度正性矛盾。
- **从"临界点 ≤3"到等变映射**：论文的覆盖在 Lean 里变成**离散下降**（`critical_level_cover`：对临界值有限集强归纳，自适应步长 $c=(2(|B|+|M|+1))^{-1}$，Lyapunov 均匀穿带 $N>(b-a)/\delta$ 次迭代），覆盖成员是"第 $n_i$ 次下降迭代后某坐标非零"的集合，不是球之并；三个坐标 $\ell\circ D^{n_i}$ 组装成相位等变、处处非零的 $F:\C^5\to\C^3$。**梯度流的替代**：`gradientCurve = 矩阵指数（负梯度展开到 25 个斜生成元上）`，Lie 代数单参子群在 Mathlib 现成（`NormedSpace.exp`），一般向量场的流没有。注释："supplies the deformation step for arbitrary smooth functions, **including highly degenerate ones**, without assuming an ODE existence theorem."

Lean 证明的下界命题（无等变映射）在字面上比"临界数 $\ge4$"更强，且不出现 Poincaré 引理、$\rho_j=\chi(\psi_j)$ 截断、系数域切换，论文引理 5.1 的三个技术装置全部被绕开。

### 7.3 桥接三：平均延拓 → 自对偶矩坐标的显式势

论文的 $K$ 是存在性平均；Lean 给出**完全显式**的 $A$-不变延拓，这是形式化里最"多出来"的数学：

- $\mathfrak{so}(4)\cong\mathfrak{so}(3)\oplus\mathfrak{so}(3)$ 的自对偶/反自对偶分解给出两个 $S^2$ 因子的矩坐标（`leftSphere`/`rightSphere`：角动量 $\text{moment}_{ab}=2\Im(\bar z_az_b)$ 的组合）；$F\cong S^2\times S^2$ 由**矩坐标的单射性**直接证明（`planeMatrix_project_injective`），不用论文的 $2\times2$ 矩阵图。
- `potential(z) = leftSphere₀ − rightSphere₂ + radial(casimir)·pairing`：在固定二次曲面上 casimir $=1$、radial $=1$，限制恰为 $x_0-y_2+x\cdot y=f$ ✓；$A$-不变性显然（moment 只涉坐标 1..4）。它的 Hamiltonian 场 `core` 逐点验证（`core_hamiltonian: symplectic(core)=d(potential)`），做功的引擎是两个**球面叉积恒等式** $\omega(\text{leftOp}_i,\text{core})=2((e+\text{right})\times\text{left})_i$ 型。
- **命题 2.1 的两步（对称临界性 + 幂恒等式）被压缩成一个代数判据**：`core_vertical_critical`，core 竖直（沿圆纤维）⟺ 叉积为零 ⟺ 乘子方程成立。形式化的不动点分析根本不看 $\phi$ 的幂。
- **反向不动点需要显式 Cayley 相位**：core 竖直系数 $b$ 的点上，中点方程的解是 $a=(1-\varepsilon b\,i)^{-1}$（Möbius/Cayley 变换），$-(2a-1)=-(1+si)/(1-si)$ 模长 1 是相位，**论文里"反之 CritSet(K)∩F 的点被 $\phi_\varepsilon$ 固定"的一句话，在 Lean 里要显式解出这个相位**，并暴露隐含定量条件 $\varepsilon$ 小到 $|\varepsilon b|\cdot$常数 $<1$。
- 三个不动点的显式锥上坐标：`zeroVector = (0,1/2,-i/2,1/2,i/2)`、`otherVector ±√3`；退化核方向 `kernelVector = (0,-1/4,i/4,1/4,i/4)`，其代数根源是消失恒等式 `rightOperator 0 + leftOperator 2 = 0`（$\mathfrak{so}(4)$ 两因子的特定元素在 $q_0$ 处相消），**论文文本完全不可见的结构**。
- **退化性不用指数公式**：中点法在"零点 + 导数核方向"处有精确恒等式 `step_kernel`（resolvent 右逆求微分 + $dX(z)v=0$），kernelVector 方向上本征值 1 是**恒等式**、连竖直修正项都是零（$a=0$ witness），整条链没有"充分小"的极限论证。

### 7.4 覆盖缺口与编码信任桥

Lean 覆盖：存在 Hamiltonian 映射、$\#\Fix=3$（正反两方向 + 单射性）、有退化不动点、一切光滑函数 $\ge4$ 临界点，全部机器验证。**未覆盖**：$\Crit=4$ 的等号（$G_{1,2}$ 的 4 临界点、$h^3=2[\mathrm{pt}]$、杯长概念整个缺席，Lean 主定理只有 `4 ≤ criticalNumber`）；$Q^3$ 的连通/紧（结论不需要）；一般流形版本的命题 2.1 与引理 5.1。**唯一无法在两边文本内闭合的信任桥**：`Q3` 上没有拓扑/流形结构，`HamiltonianPath` 是自定义结构（逐点 Hamiltonian 方程只在水平方向检验、`Q3 ≃ Q3` 是集合论双射），"该结构恰当编码标准定义"（adequacy）依赖人工检查。[推测] 射影空间光滑函数 = 局部光滑提升函数是标准事实，两边外延应当一致，但 Lean 内无此等价定理。


## 八、终局

### 8.1 与最初设想的差异

1. **我最初想把 $\Crit(M)$ 的实现函数当靶子，最后攻击的是 $\#\Fix$ 的下界**。关键转念是命题 2.1：固定子流形迁移把问题从"整个流形的动力学"降到"固定集上的静态函数"，一旦看到这个，问题变成两半独立的活（凑 $f$、证下界），都不难。
2. **我以为短周期引理是技术细节，Lean 证明它整体可删**。中点替代让周期论证蒸发，换成压缩唯一性 + Cayley 相位，同一命题的两条路线，机器那条更初等。
3. **我以为退化性论证需要控制法向，论文证明完全不需要**：只在不变子空间内论证的鲁棒版比"控制一切"便宜得多，而且 Lean 的商切向定义（模去竖直 $i\cdot z$）比论文还严一层。
4. **数字 3 的双重身份是选题的回报**：反例不是"找到一个低于 $\Crit$ 的数"就完，它恰好压到 Gong 下界，对二次超曲面，无限制光滑界的真值就是 $n$。选题时同时押"反例存在"与"下界已知"两端，才让结论闭合。
5. **三大桥接（流→迭代映射、上同调→显式积分阻碍、存在性→显式公式）各有标准变换的形态**，如果要形式化辛几何，这三处是可预期的卡点与可复用的绕法。

### 8.2 常数备忘

$3<4=\Crit=\operatorname{cuplength}$（主不等式）；$m=2$（对合）；$\pi,\pi$（等速 ⟹ 对合）与 $1,2$（不等速 ⟹ 上界实现，本征值 $0,\pm i,\pm2i$ 互异）；$h^3=2[\mathrm{pt}]$（次数 2）；$d\alpha(v,iv)=2|v|^2$（归一化因子 2）；$t=\sqrt3$、$w=-\tfrac12$、$u=\pm\tfrac{\sqrt3}2$、$\lambda=\mu=\pm\sqrt3$、$f(q_\pm)=\pm\tfrac{3\sqrt3}2$（因子分解 $t^4(t^2-3)/4$ 的输出）；Hessian $1,-1,0,0$；$2\epsilon_i<T_ib_i$、$\chi$ 的 $\tfrac1{4k},\tfrac1{2k}$（LS 证明）；Lean 侧 $\varepsilon=\tfrac1{100(C+1)}$、$\|\tau\|C<\tfrac1{10}$、cutoff $\langle4,8\rangle$、$\omega^3=48$、radial 匹配窗 $[\tfrac1{32},32]$、齐次性窗 $(\tfrac12,2)$、$|b|\le3$、Cayley $a=(1-si)^{-1}$。

### 8.3 可信度审查

Lean 覆盖主定理核心（映射存在、恰 3 不动点、退化性、下界 $\ge4$）无缺口无 sorry；未覆盖 $\Crit=4$ 等号、杯长、拓扑基本性质、编码适当性。论文侧需复查两点：引理 2.2 与命题 2.1 衔接处 $\varepsilon$ 与 $m\varepsilon$ 两个时刻的使用没分开写明（重读判定是表述问题非漏洞）；$G_{1,2}$ "恰好 4 个临界点"的本征值互异性一句话带过（标准但非零成本）。残余风险集中在编码层（HamiltonianPath 的 adequacy、SmoothFunction 局部提升定义与流形外延的一致性）。与 Jiao 2026（晚 4 天，等面积 $S^2\times S^2$ 上 2 不动点）构成互补数据点，但本构造不以其为输入。


*（素材来源：E:\math\研究笔记\素材\Arnold-素材.md；论文 TeX 六节 + Lean 36 文件 5841 行 + formalization.yaml 第 779/926–928 行 + ArnoldCounterexample.json。）*

## 补记（第二轮）· 素材路径与队列定位

这一节是 §0 的补记，先把两句话完整复述一遍，文末补记段开头还会再写一次。先进入本笔记的论文素材目录是 `preprints/A-degenerate-counterexample-to-the-critical-number-Arnold-bound-September-23-2026`，正文唯一来源是其 `build/` 子目录下的 `.tex` 文件。队列第 154 行号。

核对依据：`main.tex` 第 27 行 `\title{Three fixed points on the symplectic quadric threefold}` 与笔记题名的论文名逐字一致；第 29 行 `\date{September 23, 2026}` 与目录名日期后缀一致；摘要（`main.tex` 第 32 至 38 行）逐字出现 "The critical number and the unit-inclusive rational cup length of this manifold are both four. Thus the example disproves the unrestricted critical-number and rational cup-length forms of the Arnold conjecture."，与笔记第 4 行主定理陈述同篇。Lean 登记在 `formalization.yaml` 第 779 行（`id:` 指到该目录的 `paper.pdf`）与第 926 至 928 行：`comparator_config: ComparatorChallenges/ArnoldCounterexample.json`、`declaration: OAI.ArnoldCounterexample.main`、`file: OAI/Geometry/Arnold/Main.lean`，`file:` 行给出的模块目录 `OAI/Geometry/Arnold/` 与笔记第七节说的 36 文件一致。

一个排版事实值得登记：`main.tex` 第 39 至 44 行的 `\input` 顺序是 00、01、02、04、03、05，文件 `04-three-points.tex` 排在 `03-critical-bound.tex` 之前。这样渲染出的节号里，三临界点函数是第 4 节（Remark 4.2 与笔记吻合），临界数下界是第 5 节（Lemma 5.1 与笔记吻合）。文件名前缀与成文稿节号相差一处，我在核对旧稿里 "Prop 4.1 + 注记 4.2" 与 "Lemma 5.1 + Cor 5.2/5.3" 的归属时被这个错位绊了一下，特此记下：以 `\input` 顺序为准，文件名前缀只反映写作次序。

## 九、最初的猜想与三条错路（重讲）

### 9.1 第一个猜想：把 Gong 的下界当靶心

旧稿第 1.1 节交代了选题动机，但把当时头脑里更原始的形态漏掉了。最开始的念头其实只有一个不等式游戏：Gong 证明复维数 $n\ge2$ 的标准复二次超曲面上每个 Hamiltonian 微分同胚满足 $\#\Fix(\phi)\ge n$（`00-introduction.tex` 第 72 至 75 行），而临界数 Arnold 界宣称 $\#\Fix(\phi)\ge\Crit(Q^n)$。我猜的第一件事是：这两个数在 $n=3$ 时差多少？若 $\Crit(Q^3)=4$ 而 Gong 只逼出 $3$，中间那格空档 $\{3\}$ 是否非空？空档非空等价于反例存在，等价于无限制界失败，三个命题被一个数字 $n=3$ 串在一起。这就是为什么第一个动手的对象是数 $\Crit(Q^3)$：先把它夹成 $4$（见第五节与 `00-introduction.tex` 第 148 至 150 行 "symplectic volume forces every smooth function on the ambient $Q^3$ to have at least four critical points, and a Hamiltonian rotation realizes that minimum"），空档的存在性才被提纯成"在空档里放一个映射"的构造题。

[推测] 当时还试想过 $n=2$：$Q^2\cong S^2\times S^2$，Gong 界给 $\#\Fix\ge2$，杯长界给 $\operatorname{cuplength}(S^2\times S^2;\mathbb Q)=3$，夹缝是 $\{2\}$。把固定曲面本身当环境流形去打，看似更简单，实际把 LS 下界与辛体积逼出的临界数下界混在一起，动理学抓手（有限阶映射）反而没了。这个想法放掉之后才有了 "$F$ 上做函数、$M$ 上数不动点"的两层结构。

### 9.2 错路一：直接扰动 $A$，毁掉 clean 条件

最顺手的动作是拿 generic 的小 Hamiltonian 扰动 $\psi$ 去乘 $A$，指望不动点在 $F$ 附近重生。错误在第一步就暴露：clean fixed set 条件 $T_qF=\ker(dA_q-\id)$（`01-reduction.tex` 第 15 至 18 行）在任意扰动下立刻破产，固定集从光滑曲面退化成说不清维数的集合，"不动点等于 $f$ 的临界点"失去全部意义。论文给的修法是把扰动做成 $\phi_\varepsilon=A\circ B_\varepsilon$，其中 $B_\varepsilon$ 由 $A$-不变函数 $K$ 生成（`01-reduction.tex` 第 19 至 30 行），幂恒等式

$$\phi_\varepsilon^{m}=(A\circ B_\varepsilon)^{m}=B_{m\varepsilon}$$

（交换性写在第 127 行，恒等式在第 130 至 132 行）把扰动严格锁在 "$A$ 已经不动的地方再看 $K$ 动不动"。旧稿第二节用过 `sufficiently small` 这类转述，这里用数学模式重述锁定的定量形态：引理 2.2 给出 $\delta>0$，参数窗口取 $0<\varepsilon<\delta/m$（`01-reduction.tex` 第 128 至 129 行），于是 $\varepsilon$ 与 $m\varepsilon$ 同时落在 $(0,\delta)$ 内，第 135 至 138 行的双向包含才有资格两次引用同一引理。

### 9.3 错路二：想用 LS category 一步跳到下界

引理 5.1 的结论是"存在非零杯积 $a_1\smile\cdots\smile a_r\ne0$ 则每个光滑函数至少有 $r+1$ 个临界点"。我的第一反应是绕开微分形式构造、直接引 $\operatorname{cat}(M)\ge\operatorname{cuplength}+1$ 与 $\Crit(M)\ge\operatorname{cat}(M)$ 的标准链条。这条路能给出定理，但两道关卡都要重新过一遍：cat 的覆盖定义与极限集理论自带梯度流假设，多数教科书版本还默认临界点孤立或 Morse 型；论文第 5 节干脆把杯积论证本身写成对任意光滑函数（含高度退化者）成立的形态，category 这座桥整个被抽掉。旧稿 5.1 里那句"直接引用 LS category 也可以，但 cat 与杯长的联系是深层结果"说的就是这次绕路。

### 9.4 错路三：引用 Mare 与 Takens 的存在性定理

$\Sph^2\times S^2$ 上有恰三个临界点的函数这件事有现成出处（`00-introduction.tex` 第 143 至 145 行：Mare 记录的 Takens 球面积分构造）。起初想直接引用来省计算。失败原因有两层。第一层是信息量：存在性定理给不出退化临界点的坐标、给不出 Hessian 的秩、更给不出"$q_0$ 在纤维 $x=p$ 上孤立"，而这四项里任何一项缺失，第六节组装时的退化性验证（本征值 $1,-1,0,0$、秩 $2$）就写不出来。第二层是机器：Lean 侧需要逐坐标多项式等式，论文第 4 节的完整消元（乘子方程、例外纤维、一元方程 $t^4(t^2-3)=0$）才是可形式化的形态，所以正文写了 "We give an explicit formula and compute its entire critical set"（`00-introduction.tex` 第 145 至 147 行）。这段是观念转折最便宜的一处：把"引用谁"换成"算出来"，多花的纸把下游三步全买通了。

### 9.5 与最初设想的差额

最初想要的是"一个低于 $\Crit$ 的不动点计数"；交付物多出两笔：其一，计数恰落到 Gong 下界 $\#\Fix(\phi)=3=n$，反例同时是极值例（`00-introduction.tex` 第 78 行 "Thus our example attains his bound for $n=3$"）；其二，全部不动点计入、轨道可缩条件救不回来（第 66 至 68 行 "The count includes all fixed points, so imposing a contractibility condition on their Hamiltonian trajectories cannot restore either inequality"）。两笔都不在猜想里，是构造自带出来的。

## 十、关键陈述的数学模式重述

旧稿有多处用 ASCII 或行内文字写的关键量，这一节按论文原位置逐条重述，旧句保留不动。

### 10.1 计数对象的定义重述

论文的四个定义各给一处坐标。临界集与临界数：$\CritSet(h)=\{q\in M:dh_q=0\}$，$\Crit(M)=\min_{h\in C^\infty(M,\R)}\#\CritSet(h)$（`00-introduction.tex` 第 16 至 19 行）。杯长约定：$\operatorname{cuplength}(M;\mathbb Q)$ 是正次数有理类非零杯积的最大长度加一，含单位元（第 22 至 24 行）。符号约定：$\iota_{X_{H_t}}\omega=dH_t$，$\Fix(\phi)=\{q\in M:\phi(q)=q\}$（第 32 至 36 行）。非退化：$q$ 非退化当且仅当 $1$ 不在 $d\phi_q$ 的本征值集中，即 $1\notin\operatorname{spec}(d\phi_q)$（第 45 至 46 行）。两条无限制界写作 $\#\Fix(\phi)\ge\Crit(M)$ 与 $\#\Fix(\phi)\ge\operatorname{cuplength}(M;\mathbb Q)$（第 38 至 43 行，编号公式 `eq:arnold-bound` 在第 38 至 40 行）。

### 10.2 短周期估计的重述

旧稿 2.3 的链条这里按 `01-reduction.tex` 第 50 至 93 行逐段用数学模式再走一遍。反设序列满足 $t_j\to0$、$\Psi_{t_j}(q_j)=q_j$、$X(q_j)\ne0$（第 51 至 56 行）；坐标化后记 $C_j=\max_{0\le s\le t_j}\lVert\dot u_j(s)\rVert>0$（第 66 至 68 行，$C_j>0$ 由 $X(q_j)\ne0$ 与连续性保证）；Lipschitz 估计 $|\dot u_j(s)-\dot u_j(r)|\le L|u_j(s)-u_j(r)|\le LC_jt_j$（第 69 至 79 行）；闭轨道零均值 $\int_0^{t_j}\dot u_j(r)\,dr=0$（第 80 至 82 行）给出

$$C_j\le\frac1{t_j}\int_0^{t_j}\bigl\lVert\dot u_j(s_j)-\dot u_j(r)\bigr\rVert\,dr\le LC_jt_j,$$

第 83 至 90 行）。除以 $C_j$ 得 $1\le Lt_j\to0$，矛盾。旧稿把 $|\cdot|$ 直接写在行内，这里统一为切空间范数记法 $\lVert\cdot\rVert$ 与绝对值 $\lvert\cdot\rvert$ 的分工：速度差的模用 $\lvert\cdot\rvert$（欧氏坐标内二者一致），陈述一般化时保留 $\lVert\cdot\rVert$。

### 10.3 Lean 侧符号的重述

旧稿 7.1 用反引号写了 `step = 2·resolvent − z`，规范形态：设 $\operatorname{res}_\tau(z)$ 是 $u=z+\tau X(u)$ 的不动点解，则步映射为 $\operatorname{step}(z)=2\operatorname{res}_\tau(z)-z$，压缩窗口 $\lVert\tau\rVert C<1$（旧稿写作 `||.||` 与 `<1`）。旧稿 7.3 的 `zeroVector = (0,1/2,-i/2,1/2,i/2)` 重述为 $v_0=\left(0,\tfrac12,-\tfrac{\mathrm i}{2},\tfrac12,\tfrac{\mathrm i}{2}\right)$，$q_\pm$ 的锥上坐标即 $v_0$ 加 $\pm\sqrt3$ 修正；`otherVector ±√3` 写作 $v_0\pm\sqrt3\,u$ 型坐标向量（具体分量以 Lean 模块为准，见台账补表）。旧稿 7.4 的 `4 ≤ criticalNumber` 重述为 Lean 主定理只含不等式 $4\le\Crit(Q^3)$ 的一半，另一半 $\Crit(Q^3)\le4$ 由 $G_{1,2}$ 旋转在论文侧实现、机器侧缺席。旧稿八节常数备忘里裸写的 `4 < 5`（Morse 数比较）重述为：$Q^3$ 的 Betti 数和为 $5$，故任何 Morse 函数至少有 $5$ 个临界点，而 $\Crit(Q^3)=4<5$，临界数与 Morse 数在 $Q^3$ 上分离。允许公理三件套 `propext/Quot.sound/Classical.choice` 写成 $\mathsf{propext}$、$\mathsf{Quot.sound}$、$\mathsf{Classical.choice}$。

### 10.4 幂恒等式方向的双向刻画

`01-reduction.tex` 第 135 至 138 行的双向推理用符号链重述：正向 $\phi_\varepsilon(q)=q\ \Rightarrow\ B_{m\varepsilon}(q)=q\ \Rightarrow\ dK_q=0\ \Rightarrow\ B_\varepsilon(q)=q\ \Rightarrow\ A(q)=q\ \Rightarrow\ q\in F\cap\CritSet(K)=\CritSet(f)$；反向 $q\in\CritSet(f)\ \Rightarrow\ X_K(q)=0\ \Rightarrow\ B_\varepsilon(q)=q$ 且 $A(q)=q\ \Rightarrow\ \phi_\varepsilon(q)=q$。第二与第四个箭头都以 $0<\varepsilon<m\varepsilon<\delta$ 为前提引用引理 2.2，旧稿 2.4 第 3 条说的"差点犯的错"就是把第四个箭头用成 $B_{m\varepsilon}$ 上的引理。第 160 至 163 行的 remark 补一句：$q\notin F$ 的 $K$-临界点满足 $\phi_\varepsilon(q)=A(q)\ne q$，因此 $\#\CritSet(K)$ 可以任意大而不影响 $\#\Fix(\phi_\varepsilon)=3$，环境的"多"与动力学的"少"在此解耦。

## 十一、三大桥的落点复核（第二轮补充）

第七节写桥接时只给了名字与印象，这轮把每条桥钉到具体行。锚点全部回读 `E:/math/lean/OAI/Geometry/Arnold/` 目录核实，36 个 `.lean` 文件合计 5841 行，`Main.lean:14` 起是 `theorem main`，第 16 行的合取式 $(3:\mathbb N_\infty)<4\wedge 4\le\mathsf{criticalNumber}\wedge\mathsf{HasDegenerateFixedPoint}$ 一字排开三个交付物，论文主定理里 $\Crit(Q^3)=4$ 的等号右半边（上界实现）在合取里缺席，机器只登记 $4\le\Crit$。

桥一的落点：`Midpoint.lean:29` 定义 $\mathsf{resolvent}$（$u=z+\tau X(u)$ 的压缩不动点），`Midpoint.lean:93` 定义 $\mathsf{step}(z)=2\mathsf{res}(z)-z$，`Parameter.lean:18` 钉死 $\varepsilon=1/(100(C+1))$，`Parameter.lean:37` 兑现压缩条件 $\lVert\mathsf{parameter}(t)\rVert\cdot C<1$。旧稿 7.1 里"sufficiently small 被三层约束夹出显式值"的说法，这里补一处精化：三层里真正被机器反复消费的是 `Parameter.lean:37` 的压缩与 `CompactField.lean:17` 的中心窗 $\mathsf{normSq}(z)\le4\Rightarrow\mathsf{cutoff}=1$，第三层 Cayley 相位的可解性落在 `FieldAlgebra.lean:99` 的竖直判据里。失败教训：我原以为形式化会处处比论文笨重，`Degeneracy.lean:26` 给出反例：$\mathsf{step\_kernel}$ 让退化本征值 $1$ 成为纯恒等式，论文版还要走"$A$ 恒等 + 指数 $\exp(\varepsilon DX_f)$"两步，机器版一步到位。

桥二的落点：`Differentiation.lean:71` 的 Haar 消灭 $\int\partial(g\circ R_A)=0$，`Orbit.lean:116` 的括号纤维 $\mathsf{generators\_bracket\_base}$，`Obstruction.lean:32` 与 `Volume.lean:84` 两处独立算出六方向值 $48=3!\cdot 2^3$，`Obstruction.lean:219` 的矛盾 $(\mathsf{haar}\ \mathsf{univ})\cdot 48=0$，`Obstruction.lean:181` 收口 $\mathsf{no\_unit\_equivariant\_map}$，`Obstruction.lean:238` 落到 $4\le\mathsf{criticalNumber}$。$48$ 在 `Obstruction.lean:32` 与 `Obstruction.lean:135` 与 `Volume.lean:84` 出现三次，三处必须是同一个数：轨道拉回、join 同伦、显式六向量各证一遍，任何一处归一化因子改动就三处对撞，机器当场报不等。这是"常数被多个消费者夹住"最干净的样本。

桥三的落点：`Factors.lean:37` 与 `Factors.lean:41` 的矩坐标 $\mathsf{leftSphere}$、$\mathsf{rightSphere}$，`Factors.lean:147` 的单射性 $\mathsf{planeMatrix\_project\_injective}$（$F\cong S^2\times S^2$ 的机器版证明，替代论文 `02-quadric.tex:110` 的行列式认同），`Field.lean:189` 的 $\mathsf{potential}=\mathsf{leftSphere}_0-\mathsf{rightSphere}_2+\mathsf{radial}(\mathsf{casimir})\cdot\mathsf{pairing}$，`Field.lean:253` 的逐点 Hamiltonian 验证 $\mathsf{symplectic}(\mathsf{core})=d\,\mathsf{potential}$。旧稿 7.3 说"完全显式"，这轮补上代价：显式带来 `Field.lean:143` 的匹配窗 $s\in[1/32,32]$ 与 `CompactField.lean:13` 的截断环 $\langle4,8\rangle$，论文里一个 "sufficiently small" 省掉的区间，机器必须用两个显式数对支付。

旧稿其余 ASCII 陈述的规范重述：无限制临界数界写作 $\#\Fix(\phi)\ge\Crit(M)$（`00-introduction.tex:39`），杯长界写作 $\#\Fix(\phi)\ge\operatorname{cuplength}(M;\mathbb Q)$（`00-introduction.tex:43`），LS 不等式写作 $\operatorname{cuplength}(M;\mathbb Q)\le\Crit(M)$（`03-critical-bound.tex:92`，编号 `eq:cup-critical`），中点步写作 $\mathsf{step}(z)=2\mathsf{res}_\tau(z)-z$ 且压缩窗 $\lVert\tau\rVert C<1$（`Midpoint.lean:93`、`Parameter.lean:37`），核方向坐标写作 $\mathsf{kernelVector}=(0,-\tfrac14,\tfrac{\mathrm i}{4},\tfrac14,\tfrac{\mathrm i}{4})$（`Kernel.lean:16`），消失恒等式写作 $\mathsf{rightOperator}\,0\,v_0+\mathsf{leftOperator}\,2\,v_0=0$（`Kernel.lean:61`）。

## 台账补表

素材全集：论文 tex 在 `preprints/A-degenerate-counterexample-to-the-critical-number-Arnold-bound-September-23-2026/build/`（`main.tex` 与 `sections/` 六份，下文 tex 行号指这些文件），Lean 在 `E:/math/lean/OAI/Geometry/Arnold/`（36 文件）。下表行号全部逐行回读核实。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\Crit(M)$（允许退化） | $\Crit(M)=\min_{h}\#\CritSet(h)$ | 00-introduction.tex:18 | 主定理等号 $4=\Crit(Q^3)$（00-introduction.tex:61） | 改成 Morse 最小则临界数变 $5$，靶子 $3<4$ 变形 |
| $\operatorname{cuplength}$ 含单位约定 | $\operatorname{cuplength}(M;\mathbb Q)=1+\max r$ | 00-introduction.tex:22 | LS 不等式 $\operatorname{cuplength}\le\Crit$（03-critical-bound.tex:92） | 约定差一则 $4\le\cdots\le4$（03-critical-bound.tex:143）首尾错位 |
| 符号约定 | $\iota_{X_{H_t}}\omega=dH_t$ | 00-introduction.tex:35 | $G$ 的负号定义（02-quadric.tex:88）与限制等式（05-conclusion.tex:33） | 号翻转则 $A$ 成 $-\id$ 流，Prop 3.1 的 Hamiltonian 断言失效 |
| 主不等式 | $\#\Fix(\phi)=3<4=\Crit(Q^3)$ | 00-introduction.tex:60 | 第六节组装（05-conclusion.tex:26）与机器合取（Main.lean:16） | 计数若为 $4$ 则反例退化为正面谱系一例 |
| 有限阶条件 | $A^m=\id$ | 01-reduction.tex:12 | 平均 $K\circ A=K$（01-reduction.tex:106）与幂恒等式（01-reduction.tex:131） | 阶不闭合则 $\phi_\varepsilon^m$ 化简失败，Prop 2.1 全线塌 |
| 固定点集干净 | $T_qF=\ker(dA_q-\id)$ | 01-reduction.tex:16 | 投影 $P_q$ 的值域恰为 $T_qF$（01-reduction.tex:114） | 弱化为子含则 $\CritSet(K)\cap F=\CritSet(f)$（01-reduction.tex:122）断 |
| 平均延拓 | $K=\frac1m\sum_j\widetilde f\circ A^j$ | 01-reduction.tex:104 | 链式 $dK_q(v)=d\widetilde f_q(P_qv)$（01-reduction.tex:117） | 权重一改，$K$ 在 $F$ 上等于 $f$ 与 $A$-不变两性质同时丢 |
| 双重窗口 | $0<\varepsilon<\delta/m$ | 01-reduction.tex:129 | $\Fix(B_{m\varepsilon})=\CritSet(K)$（01-reduction.tex:133）与反向不动点（01-reduction.tex:137） | 只压 $\varepsilon$ 不压 $m\varepsilon$ 时，包含链第一个箭头断 |
| 最大速度矛盾 | $C_j\le LC_jt_j$ | 01-reduction.tex:89 | 除以 $C_j$ 得 $1\le Lt_j\to0$（01-reduction.tex:91） | $C_j$ 若可为 $0$ 则除法非法，短周期引理塌、Prop 2.1 双向变单向 |
| 对合参数 | $A=\Phi_1^{\pi,\pi}$ | 02-quadric.tex:96 | 固定集 $F=M\cap\{z_0=0\}$（02-quadric.tex:101） | 改 $(\pi,0)$ 则 $z_1,z_2$ 方向仍固定，$F$ 维数膨胀，clean 失败 |
| 归一化因子 | $d\alpha(v,iv)=2\lvert v\rvert^2$ | 02-quadric.tex:60 | Lean 形式 $\mathsf{symplectic}\,u\,v=2(\sum\mathsf{star}(u)\cdot v).\mathsf{im}$（Symplectic.lean:43） | 因子变 $\lambda$ 则六方向值变 $\lambda^3\cdot 48$（Volume.lean:84），阻碍两端常数错位 |
| 旋转 Hamiltonian | $G_{a,b}=(2a\,\mathsf{Im}(\overline{z_1}z_2)+2b\,\mathsf{Im}(\overline{z_3}z_4))/\sum\lvert z_j\rvert^2$ | 02-quadric.tex:91 | 上界实现 $G_{1,2}$（03-critical-bound.tex:125） | 改 $(1,1)$ 则本征值重根，零点成圆，$4$ 数不清 |
| 秩一认同 | $\det\begin{pmatrix}z_1+iz_2&z_3+iz_4\\-z_3+iz_4&z_1-iz_2\end{pmatrix}=\sum_{j=1}^4 z_j^2$ | 02-quadric.tex:110 | $F\cong\CP^1\times\CP^1$（02-quadric.tex:114） | 认同失败则 $f$ 搬不上 $F$，Prop 4.1 与 Prop 3.1 断链 |
| 仿射方程无常数项残留 | $w_0^2+1+\sum_k w_k^2=0$ | 02-quadric.tex:127 | $w_0$ 无约束给分裂 $T_qM=T_qF\oplus\C\partial_{w_0}$（02-quadric.tex:133） | 若一次项出现，clean 条件（01-reduction.tex:16）在 $Q^3$ 上当场失效 |
| 三临界点函数 | $f(x,y)=e\cdot x+(x-p)\cdot y$，$p=(0,0,1)$，$e=(1,0,0)$ | 04-three-points.tex:21 | 全部消元（04-three-points.tex:26 至 86），Lean 的 $\mathsf{potential}$（Field.lean:189） | $p$ 或 $e$ 改动则 $\sqrt3$ 坐标漂移，计数可能离开 $3$ |
| 乘子方程 | $e+y=\lambda x$，$x-p=\mu y$，$\lvert x\rvert=\lvert y\rvert=1$ | 04-three-points.tex:36 | 例外纤维、高度分支、切向消元三分支（04-three-points.tex:40 至 61） | 乘子合并相除则丢 $x=p$ 的纤维情形 |
| 例外纤维点 | $q_0=(p,-e)$，$f(q_0)=0$ | 04-three-points.tex:43 | Remark 4.2（04-three-points.tex:90）与退化链（05-conclusion.tex:36） | $\lambda\ne0$ 的第二解若存活，总数破 $3$ |
| 一元因式分解 | $0=t^4(t^2-3)/4$ | 04-three-points.tex:66 | $t=\sqrt3$，$w=-1/2$，$u=s\sqrt3/2$（04-three-points.tex:68） | 常数 $3$ 一变，$\mathsf{plusLift}$ 的 $r^2=3$ 验证（CriticalLifts.lean:38）作废 |
| 简并对 | $q_s=((s\sqrt3/2,0,-1/2),(1/2,0,-s\sqrt3/2))$ | 04-three-points.tex:74 | 临界值 $f(q_s)=s\,3\sqrt3/2$（04-three-points.tex:83） | $s$ 两条若并成一条，计数 $2$ 直接击穿 Gong 界 $\#\Fix\ge n$（00-introduction.tex:78） |
| Hessian 谱 | 本征值 $1,-1,0,0$，秩 $2$ | 04-three-points.tex:99 | $\omega_F(DX_f(q_0)v,w)=\mathsf{Hess}$（05-conclusion.tex:41）与 $d\phi\,v=v$（05-conclusion.tex:47） | 满秩则退化不动点不存在，定理末句失效 |
| 退化主项 | $f=va+O(\lVert(u,v,a,b)\rVert^3)$ | 04-three-points.tex:97 | 孤立性断言（04-three-points.tex:100） | 若 $u$ 主项不消，$q_0$ 的 Hessian 满秩，反例失去退化资格 |
| 穿带包含 | $g_{T_i}(P_{c_i+\epsilon_i}\setminus U_i)\subset P_{c_i-\epsilon_i}$ | 03-critical-bound.tex:52 | 覆盖归纳（03-critical-bound.tex:59 至 66） | $2\epsilon_i\ge T_ib_i$（03-critical-bound.tex:44）则穿带失败，顶层覆盖缺 |
| 梯度下界 | 于 $V_i$ 外 $\lvert\nabla h\rvert^2\ge b_i>0$ | 03-critical-bound.tex:41 | 穿带时长 $T_i$ 的正性（03-critical-bound.tex:36） | 退化临界点处下界趋 $0$，$T_i$ 失控，归纳停摆 |
| 截断枢纽 | $\rho_j=\chi(\psi_j)$，$\chi$ 在 $[0,1/(4k)]$ 为零 | 03-critical-bound.tex:74 | 逐点楔积湮灭 $\alpha'_1\wedge\cdots\wedge\alpha'_k=0$（03-critical-bound.tex:83） | 截断换成直接 $\psi_j$，修正项不再精确还原 $\alpha_j$ |
| 超平面杯积 | $h^3=2[\mathrm{pt}]\ne0$ | 03-critical-bound.tex:119 | $\operatorname{cuplength}(Q^3;\mathbb Q)\ge4$（03-critical-bound.tex:123） | 次数变 $1$ 则下界只剩 $3$，与反例计数无法区分 |
| 生成元谱 | $T=\operatorname{diag}(0,J,2J)$，本征值 $0,\pm i,\pm2i$ 互异 | 03-critical-bound.tex:130 | 射影零点恰为五条本征线（03-critical-bound.tex:134） | 重根则零方向膨胀成子空间，临界点不可数 |
| 夹逼链 | $4\le\operatorname{cuplength}(Q^3;\mathbb Q)\le\Crit(Q^3)\le4$ | 03-critical-bound.tex:143 | 主定理等号（00-introduction.tex:61） | 任一环断则 $3<4$ 失去对照，反例只破杯长界 |
| 机器合取 | $(3<4)\wedge(4\le\mathsf{criticalNumber})\wedge\mathsf{HasDegenerateFixedPoint}$ | Main.lean:16 | comparator 验收（formalization.yaml:926） | 上界 $\Crit\le4$ 论文侧才有，改等号需求即出机器覆盖 |
| $\mathsf{criticalNumber}$ 定义 | $\mathsf{criticalNumber}=\inf_h(\mathsf{criticalSet}\,h).\mathsf{encard}$ | Model.lean:67 | $\mathsf{four\_le\_criticalNumber}$（Obstruction.lean:238） | $\inf$ 改 $\min$ 则空集非空论证多一道 |
| 显式 $\varepsilon$ | $\varepsilon=1/(100(C+1))$ | Parameter.lean:18 | 压缩窗 $\lVert\mathsf{parameter}(t)\rVert\cdot C<1$（Parameter.lean:37） | 放大则压缩失效，$\mathsf{resolvent}$（Midpoint.lean:29）唯一性丢 |
| 隐式中点步 | $\mathsf{step}(z)=2\mathsf{res}(z)-z$ | Midpoint.lean:93 | $\mathsf{forwardMid}$（Parameter.lean:41）与 $\mathsf{step\_kernel}$ 调用（Degeneracy.lean:27） | 换显式 Euler 则 $\mathsf{SkewAt}$ 双条件相消（MidpointGeometry.lean:38）断，能量面不保 |
| 双相切条件 | $\mathsf{SkewAt}\,z\,v$：球面与锥同时切 | Field.lean:95 | $\mathsf{quadratic\_skew}$（MidpointGeometry.lean:38） | 缺一条则 step 不再保持单位锥，轨道离开 $Q^3$ |
| 径向匹配窗 | $\mathsf{radial}(s)=1/\sqrt s$，$s\in[1/32,32]$ | Field.lean:143 | $\mathsf{potential}$（Field.lean:189） | 窗移动则 $\mathsf{UnitQuadric}$ 上 $\mathsf{casimir}=1$ 匹配丢，$K$ 限回 $f$ 断 |
| 截断环 | $\mathsf{cutoff}$ 取 $(4,8)$，$\mathsf{vectorField}=\mathsf{cutoff}\cdot\mathsf{core}$ | CompactField.lean:13 | $\mathsf{normSq}\le4$ 时截断恒 $1$（CompactField.lean:17） | 内半径若小于中心范数窗，Hamiltonian 场被截成零 |
| 零点数列坐标 | $v_0=(0,\tfrac12,-\tfrac{\mathrm i}{2},\tfrac12,\tfrac{\mathrm i}{2})$ | CriticalLifts.lean:22 | $\mathsf{core}\,v_0=0$（CriticalLifts.lean:55）与计数引理（FixedCount.lean:19） | 任一分量改动 $\mathsf{zeroVector\_factors}$ 失败，$q_0$ 不再临界 |
| 核方向 | $\mathsf{kernelVector}=(0,-\tfrac14,\tfrac{\mathrm i}{4},\tfrac14,\tfrac{\mathrm i}{4})$ | Kernel.lean:16 | 消失恒等式（Kernel.lean:61）与 $\mathsf{vectorField\_kernel}$（Kernel.lean:129） | 换方向则退化性机器验证（Degeneracy.lean:26）断链 |
| 六方向体积常数 | $\omega^3=48=3!\cdot 2^3$ | Volume.lean:84 | $\mathsf{no\_unit\_equivariant\_map}$（Obstruction.lean:181）与矛盾 $48\cdot\mu=0$（Obstruction.lean:219） | 常数若归零则同伦两端点 $48$ 与 $0$ 相同，矛盾蒸发 |
| Haar 消灭 | 斜右移导数积分为 $0$ | Differentiation.lean:71 | 同伦不变（Obstruction.lean:97） | 平移不变性失则 $t=0$ 与 $t=\pi/2$ 两端点接不上 |
| 括号纤维 | 六个斜生成元括号落在 $\mathsf{base}$ 纤维方向 | Orbit.lean:116 | $\mathsf{Obstruction}$ 假设集（Obstruction.lean:97） | 括号出纤维则 $O(5)/O(3)$ 纤维结构无法代数进入假设 |
| 下降覆盖 | $\mathsf{critical\_level\_cover}$ 强归纳 | Descent.lean:171 | $\mathsf{Deformation}$ 消费（Deformation.lean:175） | 换球开覆盖则缺 ODE 存在性，变形步无处安放 |
| 矩阵指数形变 | $\mathsf{gradientCurve}$ 沿负梯度的单参作用 | Coordinates.lean:73 | Lyapunov 导数（Coordinates.lean:101） | 改一般流需存在性定理，Mathlib 无，桥二整段悬空 |
| 显式势 | $\mathsf{potential}=\mathsf{leftSphere}_0-\mathsf{rightSphere}_2+\mathsf{radial}(\mathsf{casimir})\cdot\mathsf{pairing}$ | Field.lean:189 | $\mathsf{core\_hamiltonian}$（Field.lean:253） | 去掉 $\mathsf{radial}$ 因子则限制不再是 $f$，不再是齐次修正 |
| 代数临界判据 | $\mathsf{core}$ 竖直当且仅当叉积零当且仅当乘子方程 | FieldAlgebra.lean:99 | 反向不动点（FieldAlgebra.lean:140） | 回到 $\phi_\varepsilon^m$ 分析就须重引短周期引理，桥全部重建 |
| 矩坐标单射 | $\mathsf{planeMatrix\_project\_injective}$ | Factors.lean:147 | $\mathsf{Factors}$ 收口（Factors.lean:183） | 单射失则 $F$ 与 $S^2\times S^2$ 的机器认同断，$\mathsf{potential}$ 定义域塌 |
| 允许公理 | $\mathsf{propext}$、$\mathsf{Quot.sound}$、$\mathsf{Classical.choice}$ | Main.lean:3 | 全模块信任根（36 文件 import 链顶端） | 增删公理则信任面改变，与 Mathlib 兼容性需重审 |

### 视角差异勘误

旧稿有两处与这张表功能重叠的文字，先登记差异、不动原文一笔。第一处是 8.2 常数备忘：它按"数字"组织（列出 $t=\sqrt3$、$48$、$\varepsilon=1/(100(C+1))$ 等），视角是"这些数是多少"；本表按"符号到消费者再到断点"组织，同一数字在表里的职责是回答"谁在读它、改动会炸哪里"，两边的数值一致、组织正交。第二处是第七节三大桥叙述：它按"替换事件"记桥（流换迭代、杯积换 Haar、平均换显式），没有行号；本表把每座桥的落点钉到文件与行，两处互补。另有两处本文稿自己的勘误：其一，9.1 节球面积分构造的命令名手滑写成 `\Sph`，规范形态即本表与第十节反复出现的 $S^2\times S^2$，旧句保留；其二，补记一节说"notes 第 4 行主定理"，严格讲笔记题头引用的是 `main.tex:35` 至 `main.tex:37` 的摘要句式，定理环境本体在 `00-introduction.tex:56` 至 `00-introduction.tex:64`。

## 文末补记

本论文素材目录是 `preprints/A-degenerate-counterexample-to-the-critical-number-Arnold-bound-September-23-2026`，正文唯一来源是其 `build/` 子目录下的 `.tex`。队列第 154 行号。与补记一节开头相同的两句在此落档。

第二轮追加的动机记录：旧稿把证明链讲顺了，但没有把"每个量被谁消费"钉死；台账补表写完后，一个意外收获是 $48$ 这个常数在 Lean 侧出现三处独立计算（`Obstruction.lean:32`、`Obstruction.lean:135`、`Volume.lean:84`），三处共享同一个归一化决定（`02-quadric.tex:60` 的因子 2），这解释了为什么论文敢把归一化"下文再定"（`00-introduction.tex:53` 的 normalized in Section 写法）：下游谁也没有引用绝对单位，只引用三个方向评值之间的一致性。反推笔记写到这一步，我对"sufficiently small"这类短语的耐心已经全部转成了窗口参数表：$\varepsilon<\delta/m$、$\lVert\tau\rVert C<1$、$\mathsf{normSq}\le4$、$s\in[1/32,32]$，四个窗各钉一处行号，少任何一个窗，相应桥面都塌。下一轮如果要继续加深，候选方向是 $G_{1,2}$ 上界实现与机器覆盖缺口之间的接口（`Main.lean:16` 合取里缺的那半个等号），目前论文与 Lean 都只在各自一侧完成，接缝处没有第三文本可核，暂不展开、如实登记。

再补三段窗口复核，仍按"谁消费、改动炸哪"的口径。第一笔：旧稿第八节常数备忘里裸写的 `4 < 5`，规范形态是 $\Crit(Q^3)=4<5=\min_{\mathsf{Morse}}\#\CritSet$，两端的消费方不同，左端 $4$ 被主不等式 $\#\Fix(\phi)=3<4$（`00-introduction.tex:60`）消费，右端 $5$ 只在"退化不可避免"的论证里出场（`04-three-points.tex:9` 至 `04-three-points.tex:12` 拒绝引入 Morse 假设），所以这组不等式两端各有主人，旧稿把它们写在一行里是我的压缩。第二笔：行数核对，本轮用 `wc -l` 逐文件加总复核 Lean 模块，36 个 `.lean` 文件行合计 $\sum n_{\mathsf{file}}=5841$，与旧稿第七节开篇的 5841 一致；`Main.lean:3` 的 `namespace OAI` 与 `Main.lean:10` 的 `namespace ArnoldCounterexample` 两行连起来读，就是 `formalization.yaml:927` 那个 `declaration: OAI.ArnoldCounterexample.main` 的拼接来源，登记名与文件名的对应关系至此闭合。第三笔：素材边界的自我声明，本轮新增内容全部来自 `build/` 下 tex 与 `E:/math/lean/OAI/Geometry/Arnold/` 定点读取，`references.bib` 与 `references.tex` 只登记存在、未作正文来源，未读 PDF。回看两轮追加，最实在的收获是把"迁移是动力学、凑函数是初等计算、下界是 LS 理论"这句 §0 口号拆成了四十五行台账：每行一个符号、一个消费者、一个断点，口号背后的三块积木各自值多少行代码、挪动哪一格会塌，现在能指着行号回答。剩下的未账问题登记如下：$\mathsf{step\_kernel}$ 的恒等式证明依赖的 $a=0$ witness（`Degeneracy.lean:71` 一行的 $\mathsf{fderiv}$ 差式）在论文语言里对应哪半句话，两边文本都对不上号，候选是第六节"$q_0$ 是平衡点"那一句，证据不足，留待下轮带着行号来判。第二轮到此为止：台账四十五行、补记两句、勘误两处都已落盘，后续加深从这条未账 witness 起步。
