# D15 · 有限欧氏 Ramsey 配置的分类：一张张量证书

> 论文：OAI:A-classification-of-finite-Euclidean-Ramsey-configurations-September-23-2026
> 主定理（Theorem 1.1）：有限点集 $A$（至少两点、仿射张成）是 Ramsey 的 ⟺ 存在 $B=F\otimes_\Q F$ 上矩阵 $P$ 使 $(p_i\otimes1)^TP(1\otimes p_i)=0$（张量级，乘前）且 $m_F(P_{\alpha\beta})=\delta_{\alpha\beta}$（空间块乘后为单位阵）。
> 笔记性质：第一人称反推。不确定处标 [推测]。
> 取证材料：论文 TeX（main.tex + sections 01–07）+ Lean 形式化（lean/OAI/Combinatorics/EuclideanRamsey/，46 模块 8620 行，28 层线性链）+ EuclideanRamsey.json。

## 0. 写在前面

先亮终稿骨架：**必要性**走代数分离，判据无解 ⟹ 分离出 $\Q$-线性泛函 ⟹ 造 $r_0=K^s$ 色染色在每个维度避开 $A$；**充分性**分三阶段，张量条件 ⟹ 精确坐标置换双尺度拷贝（§3–§4：格点恒等式 + bump + 卷积 + 有理化），置换对 ⟹ 等端点小权重比路径（§6：轨道平均把端点差压进 $s-2$ 层导出子群），路径对 ⟹ Ramsey（§5：$\beta\mathcal S$ 幂等角群 + Hales–Jewett + 超滤子实现）。

全文唯一的"为什么非平凡"点是**乘前 vs 乘后**：$B=F\otimes_\Q F$ 里相等严格强于乘后相等（$m_F$ 有核）。其余一切，格点恒等式、双尺度、路径、超滤子、平均，都是把这一区分兑换成 Ramsey 的机器。Lean 的 46 个模块给了六处实质路线分歧（第八节），最大的亮点是：**论文 §3 的 $\mathfrak m$-adic 完备化（含 Stacks Project 平坦性引用）在 Lean 中完全消失**，被幂零 exp/log 与 jet 理想替代，完备化是表述性的，不是逻辑必需。

## 一、开局：判据从哪里来

### 1.1 定义里的量词位置

Ramsey 定义：对每 $r\ge2$ 存在 $D\ge1$，使 $\R^D$ 的**每个**染色 $c$（任意函数，无连续性无可测性）在某与 $A$ **全等**（原尺度）的拷贝上取常值。两个反复强调的点：染色任意 ⟹ 一切靠"逼近/连续性吸收误差"的路线天然不可用，必须用**精确代数恒等式**；原尺度（不缩放）⟹ 与 Gallai 型缩放版本有本质距离，这是欧氏 Ramsey 理论的核心困难。

### 1.2 坐标数据

齐次化 $p_i=\binom{1}{a_i}\in F^{d+1}$；坐标域 $F=\Q((a_i)_\alpha)$；张量环 $B=F\otimes_\Q F$；乘法 $m_F(x\otimes y)=xy$。$W=\R\times\R^d$ 作为 **$\Q$-向量空间**（不是 $\R$ 的！），元素 $(v,u)$ 是仿射函数 $a\mapsto v+a\cdot u$，求值泛函 $e_i(v,u)=v+a_i\cdot u$。

[推测] 我犯过的第一个错：把 $W$ 取成 $\R$-向量空间。那样 $W\otimes_\R W\simeq\R$，张量条件退化为"乘后"条件即纯球面性，判据会错误地宣称所有球面集 Ramsey，与 Pálvölgyi 的七点反例矛盾。失败机制：$\R\otimes_\R(\cdot)$ 摧毁核结构。**有理系数是必须的**：Ramsey 构造最终用"有限列表 + 重复次数"实现，重复次数只能是整数、权重只能是有理的；实系数组合无法拆成正负两个有限列表。

### 1.3 主定理的两个条件

条件 (1.1)：$B$-值二次型 $(p_i\otimes1)^TP(1\otimes p_i)=0$，"增强版球面方程"，在 $m_F$ **之前**成立；乘开它得到 $\|a_i\|^2+\ell\cdot a_i+c=0$（球面方程），但原式更强。条件 (1.2)：$P$ 的空间块乘后是 $I_d$；**常数行列不单独约束**（"There are no separate conditions on the multiplied constant row or constant column"），它们是球心与半径参数的载体（§7 推论 spherical 的来路）。判据是精确代数的、对全等代表选取无关（Remark alg:congruence 的共轭映射 $H(v,u)=(v-t\cdot Qu,Qu)$ 直接验证：$e_i'\circ H=e_i$、$G((H\otimes H)T)=QG(T)Q^{\mathsf T}$、$I_d$ 在 $O(d)$-共轭下不动）。

### 1.4 文献版图与本文定位

正面谱系：EGM-RSS（每个 Ramsey 集球面 + 紧性原理 + 实变量染色引理）、Frankl–Rödl（非退化单纯形）、Kříž（可解传递群）、Cantwell（正多面体）、LRW（传递集猜想）。球面性充分性被 Pálvölgyi 否证（七点圆上配置不 Ramsey；其附录的泛型七点主张注明"未经本人检查、思想归 ChatGPT"，论文脚注 1 逐字记录了这一点）。LRW 猜想"Ramsey ⟺ subtransitive"：本文修正为，必要方向**错**（超越风筝 Ramsey 但非 subtransitive）、充分方向**对**（subtransitive ⟹ 显式张量证书）。

## 二、必要方向：代数分离染色（Prop alg:necessity）

### 2.1 从"判据无解"到分离泛函

设张量条件无解。$\mathcal Y=(\R\otimes_\Q\R)^s\oplus\Sym_d(\R)$，$\Phi(T)=((e_i\otimes e_i)(T))_i\oplus G(T)$ 是 $\Q$-线性；$y_0=(0,\dots,0,I_d)\notin\operatorname{im}\Phi$。在商空间中把 $y_0$ 的类扩张成 $\Q$-基、映到 $1$、其余映到 $0$，得 $\ell:\mathcal Y\to\R$：$\ell\circ\Phi=0$、$\ell(y_0)=1$。写分量 $\ell_i$、$L$，令 $h_i(x)=\ell_i(x\otimes x)$。

**两条恒等式**：对 $w=(v,u)$，$w\otimes w$ 对称，$\Phi(w\otimes w)$ 的第 $i$ 分量是 $e_i(w)\otimes e_i(w)$，故

$$\sum_i h_i(v+a_i\cdot u)+L(uu^{\mathsf T})=0,\qquad L(I_d)=1.$$

取 $u=0$ 得**点恒等式** $\sum_ih_i(x)=0$（对每个 $x$）。注意 $\ell$ 纯代数（Hamel 基构造），**不连续不可测**，这是特性：$L$ 不必正交不变，但 $\Q$-线性给出**加性**（$L(A+B)=L(A)+L(B)$），后面只用到加性和 $L(I_d)=1$。

### 2.2 拷贝上的和式

固定 $D$，$H_i(z)=\sum_jh_i(z_j)$。每个有序全等拷贝 $(b_i)$ 满足 $\sum_iH_i(b_i)=-1$。推导：全等 ⟹ 极化恒等式给 Gram 矩阵相等 ⟹ $a_i-a_1\mapsto b_i-b_1$ 保持内积（线性关系检验：$\sum c_i(a_i-a_1)=0$ 时 $\|\sum c_i(b_i-b_1)\|^2$ 与左边同时为零）⟹ 因 $A$ 仿射张成，延拓为线性等距 $Q$、$b_i=t+Qa_i$。写 $u_j$ 为 $Q$ 的行：$(b_i)_j=e_i(t_j,u_j)$、$\sum_ju_ju_j^{\mathsf T}=I_d$。于是

$$\sum_iH_i(b_i)=\sum_j\sum_ih_i(e_i(t_j,u_j))=\sum_j\bigl(-L(u_ju_j^{\mathsf T})\bigr)=-L(I_d)=-1.$$

（$L$ 的加性只对有限和用，$D$ 有限，安全。）同时点恒等式给每个点 $\sum_iH_i(z)=0$。

### 2.3 染色与奇整数矛盾

$K=2s+1$、$[0,2)$ 等分 $K$ 段（长 $2/K<1/s$）；点 $z$ 染 $s$ 元组（各 $H_i(z)\bmod 2$ 所落区间标签），至多 $r_0=K^s$ 色，**与 $D$ 无关**。反证同色拷贝 $(b_i)$：$H_i(b_i)-H_i(b_1)=2n_i+\varepsilon_i$、$|\varepsilon_i|<2/K$。求和：左 $=-1-0=-1$；右 $=2\sum n_i+\sum\varepsilon_i$。故 $\sum\varepsilon_i$ 是**奇整数**；但 $|\sum\varepsilon_i|<s\cdot2/K=2s/(2s+1)<1$，矛盾。

**常数的机械理由**：$K>2s$ 保证误差和 $<1$ 与奇整数矛盾（$K=2s$ 时 $\le$ 边界不干净）；模 2 是把"和为 $-1$"的全局信息与"同色 ⟹ 同区间"的局部信息对接的转换器；$\ell(y_0)=1$ 的归一化让"$-1$ 是奇数"这步干净。[推测] 试图把染色改成可测的会失败：$h_i$ 依赖 Hamel 基、天生不可测，而且可测 $h$ 加点恒等式会迫使 $L$ 连续线性化、(2.4) 变成真实球面方程，分离不复存在。Lean 把这步换成 `ZMod K` 下取整编码（一个整除式替代 $s$ 个实误差求和，数学等价更紧凑）。

## 三、等价与降环（Prop alg:equivalence）

### 3.1 方向一：对称化（平凡半）

矩阵条件 ⟹ 对称张量条件：取 $Q'=\tfrac12(Q+Q^*)$（flip 对称化）；$E_i(Q^*)=\tau(E_i(Q))$、$E_i(Q)=0$ ⟹ $E_i(Q')=0$；乘后空间块 $\tfrac12(I_d+I_d^{\mathsf T})=I_d$。$\tfrac12$ 是有理数，在 $\Q$-张量世界里合法。**这一半只用对称化，不需要任何深度**，而且 Lean 里根本不需要（见第八节：Lean 全程非对称）。

### 3.2 方向二：降环，把系数环从 $\mathscr B=\R\otimes_\Q\R$ 缩回 $B$

实质内容：扩环不引入新解。取 $\R$ 的 $F$-基 $(r_\lambda)$（Zorn，选择公理在全文的实质出场点之一）；关键分解

$$\mathscr B=\bigoplus_{\lambda,\mu}B(r_\lambda\otimes r_\mu)$$

（$\R=\bigoplus Fr_\lambda$ 两边张量 + 域上张量正合；各和项是 $B$-子模，$B$-模**自由**分解）。解 $Q$ 只用有限多对，写 $Q=\sum(r_\lambda\otimes r_\mu)P^{\lambda\mu}$。求值系数全在 $B$ ⟹ 直和唯一性给 $E_i(P^{\lambda\mu})=0$ 逐对成立。梯度：$I_d=\sum r_\lambda r_\mu C^{\lambda\mu}$（$C^{\lambda\mu}$ 是乘后空间块）；**行化简在 $F$ 上进行**，"$F$-线性系统在扩域相容 ⟹ 在 $F$ 相容"（消元是域内运算），故有 $c_{\lambda\mu}\in F$ 使 $I_d=\sum c_{\lambda\mu}C^{\lambda\mu}$；$P=\sum(c_{\lambda\mu}\otimes1)P^{\lambda\mu}$ 即所求。

两个容易漏的点（论文原文提醒）：各 $C^{\lambda\mu}$ 不必对称，降环发生在全矩阵空间，对称性之后另行对称化；$\det$ 型论证不可用，$\mathscr B$ 有零因子，非单位不可逆，所以用**模直和 + 域上线性系统**，并非高斯消元于 $\mathscr B$-值矩阵。

Lean 的降环是**不同的构造**：取 $F$-基后不再行化简，是取 $F$-线性对偶泛函 $\varphi:\R\to_FF$、$\varphi(1)=1$（Mathlib 的 `Module.Projective.exists_dual_eq_one`，"投影性 ⟹ 存在泛函把指定非零元映到 1"），定义 $c_{\lambda\mu}:=\varphi(r_\lambda r_\mu)$。$\varphi$ 的线性性自动给出 $I_d=\sum c_{\lambda\mu}C^{\lambda\mu}$（对恒等式条目作用 $\varphi$），**论文的"线性系统相容性下降"一步 Lean 根本不做**，$\varphi$ 本身就是该系统的解选择器。形式化对证明的实质重组：更短、更典范。这个泛函随后在球面方程处第三次出场，全文 Lean 证明的"隐形主角"。

## 四、格点恒等式：从张量到有限权函数（§3–§4）

### 4.1 求值格的设置

$T$ 只用有限多向量：取 $\Q$-基 $w_1,\dots,w_k$，$T=\sum C_{ab}w_a\otimes w_b$（$C$ 对称有理），$U=(u_1\cdots u_k)$，梯度恒等式 $UCU^{\mathsf T}=I_d$。格 $\Gamma=\Z^k$，$\Lambda_i=\{\lambda:e_i(w(\lambda))=0\}$，$V_i=\operatorname{span}_\Q\Lambda_i$。"Clearing denominators"：$\lambda\in\Q^k$ 零求值 ⟹ $N\lambda\in\Lambda_i$ ⟹ $\lambda\in V_i$，$V_i$ 恰是 $\Q^k\to\R$ 有理线性映射的核，故 $\Q^k/V_i\hookrightarrow\R$ 单射；域上张量平坦 ⟹ 单射张单射仍单射 ⟹ $C$ 在 $(\Q^k/V_i)^{\otimes2}$ 中为零。这一步把抽象张量条件改写成**纯代数**输入。

### 4.2 Lemma stencil:finite（有限格点恒等式），代数最重的引理

**断言**：存在有限支撑 $\nu:\Gamma\to\Q$，使 (i) 每个 $\Lambda_i$-陪集上权和为零（= 逐求值值正负相消），(ii) 总质量 0、一阶矩 0、二阶矩恰为 $C$。

推导六步：

1. **群代数**：$R=\Q[X_1^{\pm1},\dots,X_k^{\pm1}]$；陪集零和 ⟺ $f\in J_i=(X^h-1:h\in\Lambda_i)$（验证：零和多项式按代表元拆成 $X^{\gamma_0}(X^{\gamma-\gamma_0}-1)$ 型项之和）。
2. **完备化 + 对数坐标**：$\mathfrak m$-adic 完备化 $\widehat R=\Q[[Z]]$；形式换元 $Y_j=\log(1+Z_j)$；$X^h-1=\exp(h\cdot Y)-1=(h\cdot Y)\cdot$（单位），**理想扩张后变成线性式理想**：$J_i\widehat R=(h\cdot Y:h\in\Lambda_i)\widehat R$。核心技巧是"对数坐标把乘法结构线性化"，与 p-adic/形式群论证同源。
3. **二次型匹配**：$Q_2(Y)=\tfrac12Y^{\mathsf T}CY$ 在对称代数 $\operatorname{Sym}(\Q^k/V_i)$ 中为零 ⟺ 假设；故 $Q_2\in(h\cdot Y:h\in V_i)$，换 $\Q$-系数生成元为格点生成元（$\widehat R$ 是 $\Q$-代数、理想对数乘封闭，这解释了为何要 $V_i=\operatorname{span}_\Q\Lambda_i$ 而不直接用 $\Lambda_i$）。
4. **从逐个理想到交集**：$R$ Noetherian、$\widehat R$ 平坦（Stacks Tag 00MB）⟹ $I\widehat R=\bigcap_iJ_i\widehat R$，$Q_2\in I\widehat R$。
5. **退回有限多项式**：$Q_2=\sum f_a\alpha_a$（$f_a\in I$），截断 $\alpha_a$ 到二次、取 $b_a\in R$ 逼近至 $\mathfrak m^3$；$f=\sum f_ab_a\in I$ 且 $f(e^Y)=\tfrac12Y^{\mathsf T}CY\pmod{(Y)^3}$。
6. **读出矩**：$\sum\nu(\gamma)=0$（常数）、$\sum\nu(\gamma)\gamma=0$（一次）、$\sum\nu(\gamma)\gamma\gamma^{\mathsf T}=C$（二次）。

(2.6) 与 (2.7) 的分工：只有 (2.7)，坐标多重集不必相等；只有 (2.6)，得到零 Gram 差（同尺度），无法得 $q<1$。二者缺一不可。

**为什么完备化、为什么只到二阶**：对数坐标需要 $\exp/\log$ 的形式合法性，完备化让它们收敛；但三阶以上项被 $\mathfrak m^3$ 吸收，所以精度只需 3。这也解释了 §4 只能控制梯度二阶矩。**Lean 把完备化整个删掉**：只在幂零商 $I^N/I$ 里用有限多项式的 exp/log（互逆！），交提升用显式幂零算术、矩泛函差被 $I^3$ 吸收对应 jet 理想，Stacks 引用在 Lean 中无对应物。这是"论文表述性 vs 逻辑必需"的最佳标本：完备化叙述更自然，但不是必需。

### 4.3 Lemma pairs:bump，"负部可以做小"的分析引擎

$UCU^{\mathsf T}=I_d$ ⟹ $U$ 满秩、$H=\operatorname{im}U^{\mathsf T}$ 上 $C$ **正定**（$h=U^{\mathsf T}y\Rightarrow h^{\mathsf T}Ch=\|y\|^2$）。取 $S=\epsilon P_H+LP_V$（$\epsilon\tr(UU^{\mathsf T})<\eta/8$；大 $L$ 吸收 $C$ 在核上的任意负曲率，且 $UP_V=0$ ⟹ $\tr(USU^{\mathsf T})=\epsilon\tr(UU^{\mathsf T})<\eta/8$，**$V$ 方向的代价不出现在估计里**）；Schur 补给 $S+C\succ0$，凸性给全程 $S+tC\succ0$。

Gaussian 路径积分：$\frac{d}{dt}\phi_{S+tC}=D_C\phi_{S+tC}$（$C$ 不必半正定！），微积分基本定理给 $D_Cb_*=\phi_{S+C}-\phi_S$，$b_*=\int_0^1\phi_{S+tC}dt$。负部 $(\phi_{S+C}-\phi_S)_-\le\phi_S$，加权积分 $\le\tr(USU^{\mathsf T})<\eta/8$。紧化：截断乘积法则的交叉项量级 $R^{-1},R^{-2}$ 被 Schwartz 衰变压制，负部 1-Lipschitz ⟹ 误差 $<\eta/8$；合计 $<\eta/4<\eta\int b$（$\int b>1/2$）。预算分解 $\eta/8+\eta/8$。

[推测] 用各向同性 Gaussian（$S=\epsilon I$）替代会在 $C$ 有大负特征值时爆掉（$S+tC$ 失去正定性，$\phi$ 变成不可积的 $e^{+\lambda\|x\|^2}$）；省略紧化则格点数超线性增长、$O(n^{-1})$ 误差控制崩溃。Lean 的构造完全不同：**显式径向幂 bump**（带显式指数与显式常数 $K$），协方差对换成代数分裂 $C=RR^{\mathsf T}+ZCZ^{\mathsf T}$（$R=CU^{\mathsf T}$ 右逆、$Z=1-RU$ 斜投影）、无 Schur 补、正定性由分裂和直接验，预算从 $\eta/8$ 变 $\eta/2$（$\epsilon=\eta/(2(d+1))$、$\tr(USU^{\mathsf T})=\epsilon d$ 精确）。

### 4.4 Lemma pairs:rational，卷积 + 有理化

$\mu_n=\nu*d_n$（$d_n(\lambda)=n^{2-k}b(\lambda/n)$）。三个层次的保持：**陪集零推前在卷积下保持**（陪集平移不变性提出公共因子 $\sum\nu=0$）；**矩恒等式是纯代数**（(4.2)：$\sum(\nu*d)\lambda\lambda^{\mathsf T}=(\sum d)C$，展开后一阶矩零杀交叉项、零总质量杀高阶项，**不依赖 $d$ 的形状**）；**负部不等式走极限**（Taylor：$n^k\mu_n\to D_Cb$，$\sum\nu=0$ 杀常数项、$\sum\nu\gamma=0$ 杀一次项；$O(n^{-1})$ 一致误差 + Riemann 和收敛）。指数 $2-k$ 的来历：$n^{-k}$ 原子近似 × $n^2$ 补偿二阶矩的自然 $n^{-2}$ 缩小。最后有理化：两个严格不等式在 $d_n$ 处成立 ⟹ 在 $\R^E$ 开邻域内成立 ⟹ $\Q^E$ 稠密取有理点。

输出 $(n,\mu,\zeta)$：$\sum\mu(\lambda)\frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}=\zeta C$（精确）、$\sum\mu(\lambda)_-\|U\lambda/n\|^2<\eta\zeta$、零推前逐 $i$。"The inequalities will only be used to add a common positive semidefinite Gram increment; no further approximation is needed"，不等式下游只用一次（证明 $P=\eta I-B_-$ 半正定），之后全是精确代数。

## 五、双尺度置换对（Lemma pairs:two-scale），几何出口

**断言**：存在 $\ell$ 与 $f_i,g_i\in\R^\ell$：$\|f_i-f_j\|^2=\|a_i-a_j\|^2$（**原尺度**）、$\|g_i-g_j\|^2=q\|a_i-a_j\|^2$、$q=\eta/(1+\eta)$、且 $g_i$ 是 $f_i$ 的**坐标置换**。

八步：取 $M$ 使 $M\mu\in\Z$（有理权 ⟹ 分母 l.c.m.）；正列表 = $w(\lambda/n)$ 重复 $M\mu_+$ 次、负列表重复 $M\mu_-$ 次；等长（零总质量）；**逐值相消 ⟹ 坐标多重集相等**（求值等值类 = $\Lambda_i$-陪集，零推前给陪集上正部和 = 负部和，把正部展开成一份坐标列表、负部另一份，逐 $i$ 逐值配对 ⟹ $f_i$ 与 $g_i$ 互为坐标置换）；Gram 差 $B_+-B_-=I_d$（$U(\zeta C)U^{\mathsf T}=\zeta I_d$ 除以 $\zeta$）、$\tr B_-<\eta$；补公共半正定增量 $P=\eta I-B_-$（追加**相同**行 $(0,r_j)$ 到两个列表，免费保持置换性）；终缩放 $\div\sqrt{1+\eta}$：正列表精确归一到原尺度，负列表随之缩为 $\eta/(1+\eta)$。

**为什么 $q$ 是 $\eta/(1+\eta)$ ，并非 $\eta$**：缩放次序，原尺度全等要求正列表精确为 1，所以最后除以 $\sqrt{1+\eta}$，负列表被动缩到 $\eta/(1+\eta)$。**为什么 $q$ 严格正**：$q=0$ 需要负列表退化成常向量，即 $A$ 单点，所以 $q$ 的残余必须被 §5–§6 的权重比机制吸收，不能取极限（$\eta\to0$ 时 $n\to\infty$、列表长度爆炸，无有限拷贝，**这就是必须引入路径/自由群机制的根本原因**）。Lean 里"坐标多重集相等"落成显式置换 `Equiv.Perm τ`；半正定增量用谱定理（C*-式），并非"特征值 ≤ 迹"。

## 六、路径判据（§5），超滤子与 Hales–Jewett

### 6.1 路径与两个预备引理

环境 $\mathcal E=\R^{(\N)}$（所有有限维空间的公共并）；自由群 $K$ 生成元 $\xi_z$。路径 = 对角因子（权重 0）与拷贝因子 $X_b$（$\|b_i-b_j\|^2=u\|a_i-a_j\|^2$，权重 $u$）的有限序列；端点 = $K^s$ 中乘积，权重 = 和。**"The weight belongs to the chosen path, not to its endpoint"**，同一端点可有多条不同权重的路径，整个判据建立在非唯一性上。

**紧性（paths:compactness）**：若 $\mathcal E$ 的每个 $r$-染色有单色拷贝，则某有限 $D$ 也如此。反证 + Tychonoff（$\{1,\dots,r\}^{\mathcal E}$ 紧，"拷贝非单色"是柱集）+ 有限交性质。EGM-RSS Proposition 4 的重述，但"对任意染色"。**Lean 用不同的路线**：维数上的超滤子极限（$\beta\mathbb N$，截断相容性），"存在 $D$"经典成立，超滤子极限给出构造性的选 $D$。

**权重同步化（paths:synchronization）**：等端点、权重 $\lambda,\mu$、$\rho=\mu/\lambda<1/n$ ⟹ 存在端点 $w$ 具有对每个 $1\le t\le n$ 的权重 $1/t$ 路径。机制：$\alpha_t=\frac{1/t-\rho}{1-\rho}$ 切 $[0,1]$；每段用缩放自同构 $\xi_z\mapsto\xi_{\sqrt{l/\lambda}z}$（$\mathcal E$ 双射线性映射 ⟹ 生成元被置换 ⟹ 真自同构）；**固定顺序拼接**（"no commutation of factors is used"，$K^s$ 非交换，固定序保证所有 $t$ 共享同一端点）。总重 $\alpha_t+\rho(1-\alpha_t)=1/t$ 精确。

**为什么需要这个引理**：Hales–Jewett 线的变量位置个数 $t$ 在染色之前未知，LRW 的群表述预先规定 $t$，这里允许线自己选 $t$，所以必须**预先**把权重 $1,1/2,\dots,1/n$ 全部备在同一端点上，染色后按需取用。$t(1/t)=1$ 给出原尺度：$t$ 个变量位置各贡献权重 $1/t$。

### 6.2 角群与实现

**角群（paths:corner-group）**：$\beta\mathcal S$（字符串幺半群的 Stone–Čech）以 $B\in uv\iff\{x:x^{-1}B\in v\}\in u$ 成为紧右拓扑半群；极小左理想（Zorn）⟹ 极小子半群 ⟹ **幂等元 $p$**（Ellis 型论证：$H_0x=H_0$ 给 $yx=x$ 型不动点）⟹ $p(\beta\mathcal S)p$ 是群（每个 $y$ 的左逆 $pvp$ 由 $(\beta\mathcal S)y=L_0$ 的均匀性供给；幺半群中每元素有左逆 ⟹ 群：$b=b(ay)=(ba)y=y$）。用**幺半群** $\mathcal S$ ，并非群：Ramsey 拷贝要"字符串逐位对齐"，不可逆拼接才对应。**为什么需要群而不只幂等元**：自由群同态的像必是群，$\psi:K\to p(\beta\mathcal S)p$、$\psi(\xi_z)=p\delta_{(z)}p$ 需要目标有群结构。Lean 的 `exists_group_corner` 是推广形态（任意紧 Hausdorff 右拓扑半群），幂等元直接调 Mathlib 库、群性用 `Group.ofLeftAxioms`。

**同时实现（paths:realization）**：若 $B\in q_{i,1}\cdots q_{i,M}$（每行），列分为共同列（$q_{i,j}=q_j$ 与行无关）与主列（$q_{i,j}=\delta_{z_{i,j}}$），则可从左到右选串 $x_{i,j}$：共同列所有行取**同一**串（超滤子有限交）、主列取指定串，使每行积 ∈ $B$。归纳不变量 $P_i^{-1}B\in q_{i,j}\cdots q_{i,M}$。这是 Hindman–Strauss 式"超滤子成员资格 = 可实现性"的标准转换；Lean 把列类型做成归纳类型 `UltraColumn := common | principal`。

### 6.3 判据本体（paths:criterion）

等端点、权重比 $<1/n$ 的路径对对每个 $n$ 存在 ⟹ Ramsey。七步：固定 $r$ 与任意染色；取 Hales–Jewett 长度 $n$（**只引存在性**，"All choices are made after fixing $n$; no bound uniform in $n$"）；同步化备好权重 $1/t$；用 $c\circ\Phi$ 染 $\mathcal S$（$\Phi$ = 两两正交坐标块求和，等长串距离 = 列距离和）；字 $i_1\cdots i_n$ 染成唯一的 $k$ 使 $B_k\in\psi(w_{i_1})\cdots\psi(w_{i_n})$（超滤子对有限划分恰含一类 ⟹ 良定义）；HJ 单色线的 $s$ 个字在**每个变量位置**用权重 $1/t$ 路径展开 $\psi(w_i)$，对角因子变共同列、拷贝因子变"$p$ 公共 + 主列 + $p$ 公共"三列；实现引理产出逐列对齐的等长串（公共串零距离贡献）；距离 $=t\cdot\frac1t\|a_i-a_j\|^2=\|a_i-a_j\|^2$；紧性降维。

[推测] 若 $\psi$ 的像有非平凡关系（$K$ 不自由），列数因行而异、串长不等、距离公式失效，自由群是"长度对齐"的保证。若 $\lambda=0$（全对角路径），不产生距离，$\lambda>0$ 是"至少一个单位拷贝"的最低要求。

## 七、端点校正与组装（§6）

### 7.1 右分数演算（groups:pairs, groups:fractions)

校正幺半群 $M$（对角 + 单位尺度拷贝因子）；**校正原理**：$D_+^{-1}D_-=uv^{-1}$ ⟹ $D_+u=D_-v$，代价 $=\deg u+\deg v$。$N=\ker(K\to\Z)$（总指数和为零的字）。

$M_{ij}$ 是群含 $N\times N$：任意 $r$-距离对可扩成拷贝（正交架塞进 $\mathcal E$ 的有限坐标子空间）；$(x,y)^{-1}=(x^{-1},x^{-1})(y,x)(y^{-1},y^{-1})$，**无需逆的拷贝分解**（$M$ 的生成元不含逆元，逆必须用拷贝表达，这是度数计数能运作的结构前提）；$r$-距离图连通（$\le2r$ 分段 + 弦高公式 + 垂直位移用 $\mathcal E$ 的额外坐标）；差生成元的正规闭包 = $N$。

$L_i=\{g:g^{[i]}=uv^{-1}\}$ 是正规子群、代价 $c_i$ 对称/共轭不变/次可加：单坐标乘法规则 $uv^{-1}g^{[i]}=uh^{[i]}v^{-1}=(ua)(vb)^{-1}$（$h=v_i^{-1}gv_i$，共轭保代价；逐坐标核对论文的恒等式）；对坐标乘法规则 (6.2)（辅助 $b\in M$ 使 $vb$ 在目标对上单位、支撑不交给交换性，**$b$ 的代价不需估计**，平均引理会用别的方式控制比率）。

**导出子群包含 $N^{(s-2)}\subseteq L_i$**（归纳按坐标数）：$s=2$ 平凡；$s\ge3$ 时投影掉 $j$ 与 $k$ 分别得支撑 $\{i,j\}$、$\{i,k\}$ 的分数 $z_a,z_b$，换位子 $z_az_bz_a^{-1}z_b^{-1}$ 的 $j,k$ 坐标相消、$i$ 坐标 $=[a,b]$ ⟹ $[a,b]\in L_i$。**深度为何是 $s-2$**：换位子机一次消耗两个辅助坐标，$s$ 个坐标支撑 $s-2$ 层，"坐标数买导出深度"。论文强调 "No closure assertion for the whole set $MM^{-1}$ is needed"，$L_i$ 的群性由演算证明，不靠 $MM^{-1}$ 封闭（一般不成立）。

### 7.2 轨道平均（groups:averaging），代价/度数比压到任意小

$H$ 坐标置换群（等距 ⟹ 拷贝因子合法）、$Z$ 有限 $H$-不变。两阶段：

**阶段一（压进 $L$）**：起点差 $w_xw_y^{-1}\in N$（两生成元商）。每轨道：右规范化（度数不变、差不变）、**轨道平均** $w'_x=\prod_{h\in H}w_{hx}$（固定序），轨道均匀遍历 ⟹ 阿贝尔化 $N^{(r)}/N^{(r+1)}$ 中像相同 ⟹ 差异深度 +1；已处理轨道不被破坏（$K/G$ 像多重集相同）。$s-2$ 轮后差异 ∈ $L$。

**阶段二（压比率）**：收缩 $w'_x=(\prod_hw_{hx})w_{x_0}^{-1}$，积中恰一个因子是 $a=w_{x_0}$，写 $PaQ$，$c(w'_x)\le c(P)+c(Q)\le(h-1)B$（共轭不变 + 次可加）；度数 $\times h$ ⟹ 比率 $\times\frac{h-1}{h}$ 几何衰减 $2B/m_0\cdot((h-1)/h)^k\to0$。**不破坏其他轨道**：(6.9) 归纳 $c((a_1\cdots a_h)(b_1\cdots b_h)^{-1})\le\sum_jc(a_jb_j^{-1})$（望远镜 + 共轭）⟹ 其他轨道的差代价至多乘 $h$、度数恰乘 $h$ ⟹ 比率不升。

### 7.3 组装（groups:endpoints + 收尾）

$H$ 取**全**置换群（只需 $g_i$ 与 $f_i$ 同轨道，每个 $i$ 可以有自己的置换 $\sigma_i$，无需统一）；Lemma averaging 给 $w$（度数 $m$、同轨道差 ∈ $L$、代价 $\le\delta m$）。限制到 $f_i$：每个因子 $(\xi_{hf_i})_i$ 是**权重 1 的拷贝**（$h$ 等距）⟹ 路径权重 $m$；限制到 $g_i$：权重 $q$ ⟹ 权重 $qm$。校正：$r_i=w_{f_i}w_{g_i}^{-1}\in L$、$c\le\delta m$；$D_+^{-1}D_-$ 的分量是 $r_i$ 的共轭 ⟹ 元组分数代价 $\le s\delta m$（**因子 $s$ 不可漏**，漏掉会把最终界错成 $q+\delta$，$\delta=1/(2sn)$ 不够小）。拼接：$\lambda=m+\deg u$、$\mu=qm+\deg v$、$\mu/\lambda\le q+s\delta$。

**最终数值**：$q<1/(2n)$、$\delta=1/(2sn)$ ⟹ $q+s\delta<1/n$ ⟹ 路径判据 ⟹ Ramsey。（Lean 取 $\eta=1/(4n)$、$\delta=1/(4ns)$，$q=\eta/(1+\eta)<\eta$，把"$q+s\delta<1/n$"做成**精确等式链**利于 linarith。）[推测] $q$ 与 $s\delta$ 的分工：$q$ 是几何残差（二阶矩不可为零），$s\delta$ 是群论代价（端点校正），都可任意小但都严格正。

## 八、推论与反例（§7）

### 8.1 三个正面推论（全是"造张量证书"，无新构造机器）

**Ramsey ⟹ 球面（cons:spherical）**：乘后 $H=m_F(P)$，(1.1) 乘后给 $p_i^{\mathsf T}Hp_i=0$ 即球面方程，$\ell_\alpha=H_{0\alpha}+H_{\alpha0}$（$H$ 不必对称，**常数行列的自由度恰是球面参数的载体**，这解释了主定理为何不对常数行列单独提条件）。EGM-RSS Theorem 13 的重推；逻辑上无循环（依赖链里没用它）。

**subtransitive ⟹ Ramsey（cons:transitive）**：LRW 充分方向的新证，不再经 Hales–Jewett 块集，直接给显式张量证书 $T=\frac1{|H|}\sum_{h,j}(w_{hj}\otimes w_{hj}-c_{hj}\otimes c_{hj})$。$G(T)=I_d$（等距坐标行的 Gram 平均）；求值相消（传递性 ⟹ 每点以相同重数遍历 $Y$）。**$\frac1{|H|}$ 的有理性**是把"平均"写进张量的唯一非整数系数。

**二次插值（cons:quadratic）与圆上五点（cons:quadrilateral）**：若二次求值行在 $F$ 上独立（= 二次多项式可在 $A$ 上插值），则伴随恒等式 $z=(\det M)b-\iota\,\mathrm{adj}(M)\,Db\in\ker D$ 把"乘后球面解"提升为"张量级解"，**不除法**：$\det M$ 可能是 $B$ 的非单位，用行列式乘法吸收误差、最后 $\delta^{-1}$ 在 $F$ 中消去。圆上点：每点的"两割线方程之积"在其余四点为零、本点非零（圆无三点共线）⟹ 五行独立 ⟹ Ramsey。"至多五点"的来源：割线构造只能杀 4 个其余点，6 点起失效，判据对圆上 6–8 点留白。Lean 里补足五点用球极投影、$r=0$ 退化圆单独处理。

### 8.2 两个反例（用必要方向）

**九点（cons:nine）**：$t_1,\dots,t_9$ 代数独立、单位圆的球极投影参数化。$B$ 是整环、嵌入 $\Q(T,U)$（双变量局部化）；张量求值矩阵 $D$ 的行列式**特判网格** $\{0,1,-1\}^2$ 验证非零（$\det(C\otimes C)=2^6=64\ne0$；"This evaluates the specific determinant expression; no specialization of the entire localized ring is asserted"，**只特判行列式这一个多项式表达式**，$B$ 整体没有特判同态）⟹ 判据无解 ⟹ 不 Ramsey。**为什么是 9**：超越次数 9 = 二次单项式数 $(2+1)^2$，让 $D$ 方阵可逆。Lean 里数值分歧：行未除以 $1+t^2$，$\det C=8$、总 $8^6=2^{18}$，非零结论同，中间数值不同，取证时勿混同。

**十二点（cons:twelve）**：Liouville 常数 $t$（超越 + 足够小使 $\theta=2\arctan t<\pi/4$ 三块不交）的三个旋转方块。**导子障碍**：$\partial=\frac{1+t^2}2\frac{d}{dt}$（$\partial u=-v,\partial v=u$ 的角变导）、权重 $\beta=(1,1,-2)$（解"三矩同时为零"的线性系统）、三个增广矩恒等式，得 (7.5)：

$$\sum_i\beta_i\Phi\bigl((p_i\otimes1)^{\mathsf T}P(1\otimes p_i)\bigr)=4\sum_{\alpha=1}^2m_F(P_{\alpha\alpha}),\qquad \Phi(a\otimes b)=(\partial a)(\partial b).$$

判据的解要被 $\Phi$-加权求和杀死（左端为零）又被 $m_F$ 固定（右端 $=8$），$0=8$ 矛盾。**为什么必须超越**：数域上到自身的导子只有零导子（代数关系强制 $\partial t=0$），整个机制失效。[推测] 障碍对 $t$ 敏感：$t=0$ 时三块合一、$X=Q_0$ 正方形顶点集 transitive ⟹ Ramsey。**这是与 Pálvölgyi 导子障碍的独立平行版本**（论文强调计算独立）。未形式化。

**风筝（cons:kites）**：超越 $a$ 的 $K_a$ Ramsey（四圆点）且非 subtransitive（LRW Corollary 2，文献引用），一举否定 LRW 特征猜想的必要方向与其 Conjecture 3。[推测] $a$ 代数时（如正方形）可能 subtransitive，范围不能放宽。

## 九、Lean 镜子：46 模块 8620 行的六条分歧

1. **对偶泛函 $\varphi(1)=1$ 是隐形主角**：三次出场（降环、球面方程、分离泛函），对应论文的"行化简、Gaussian 消元、扩基"。机械原因：Mathlib 对"自由模上泛函扩张"有现成 API，对"线性系统相容性下降"没有，形式化自然滑向泛函路线。
2. **完备化完全消失**：幂零 exp/log + `adic_intersection_lifting` + jet 理想替代 $\mathfrak m$-adic 完备化与 Stacks Tag 00MB。Lean 证明严格更初等。
3. **对称张量层整体被绕过**：$\mathcal T(W)$、flip、$\tfrac12(Q+Q^*)$ 无对应物；判据天然非对称。反推时若以对称性为必要组件会走错。
4. **紧性换路线**：维数超滤子极限替代 Tychonoff 积空间，超滤子在 Lean 里出现两次（$\beta\mathcal S$ 角群与维数极限），第二次是论文没有的。
5. **bump 换构造**：显式径向幂函数（显式指数、显式常数）替代 Gaussian 混合路径积分；斜投影 + 右逆替代正交投影 + Schur 补。
6. **常数三处分歧（无害）**：$\det C=2$ vs $8$（行约分与否）；预算 $\eta/8$ vs $\eta/2$；$q<1/(2n)$ vs $\eta/(1+\eta)<1/(4n)$（等式链）。另有 `classification_nonempty` 的析取形态与 `full_affine_representative`（"选全仿射张成代表"一句话被完整展开成构造：差向量子模 + 标准正交基 + 坐标表示），后者是"论文一句带过、Lean 显式展开"的典型。Hales–Jewett 直接用 Mathlib 库版本（变量数上界 = 网格维数 + 1）。

未形式化：cons:kites（依赖 LRW 文献）、cons:twelve（导子障碍）、Remark noetherian（Lean 的下降不需要 Noether 性）、Remark congruence 的证书传输（Lean 用 `ramsey_congruent_iff` + `classification_nonempty` 间接达成）。

### 10.4 本轮追加的读法说明

前十节是骨架式速记，很多单元只给了一句结论。以下十一到十九节按"逐字引用 + 中间步骤 + 常数的机械理由 + 候选失败路线"四段式重做五个我此前只擦过边界的单元，并把主定理那条张量证书的每个零件钉回 tex 行号。取证范围限定在 `build/sections/01–07` 七个分片（`build/` 下另有 `main.tex`、`refs.bib`、`figures/`，正文只来自分片）。所有行号是本轮 grep 与 offset 读取实测的，未实测的行号一律不写。

## 十一、张量证书的零件清单

这一节把 Theorem 1.1 的两个条件拆到最小可核对单位。分片名省略前缀 `sections/`。

### 11.1 数据层：对象逐个出处

`01-introduction.tex:55` 起头："The problem is to characterize these finite sets up to congruence."，紧接着 `01-introduction.tex:56` 是"let $d\ge1$ be its affine dimension"，`01-introduction.tex:57-58` 给出代表选取"choose a congruent representative $A=\{a_1,\ldots,a_s\}\subset\R^d$ whose affine span is $\R^d$"，`01-introduction.tex:59` 一句独立陈述："The points are distinct and $s\ge2$."

齐次化与域在 `01-introduction.tex:60-64` 的同一个 display 里，三个对象并排：$p_i=\binom{1}{a_i}$（`:61`）、$F=\Q\bigl((a_i)_\alpha:1\le i\le s,\ 1\le\alpha\le d\bigr)$（`:62`，由全部坐标生成）、$B=F\otimes_{\Q}F$（`:63`）。乘法同态在 `01-introduction.tex:65-68`："The commutative ring $B$ has a multiplication homomorphism $m_F:B\longrightarrow F,\ m_F(x\otimes y)=xy$"。

判据强弱关系被论文明说在 `01-introduction.tex:69-70`："An equality in $B$ is stronger than the equality obtained by applying $m_F$; this map need not be injective." 这句是全文的枢纽，前十一节里我把它复述了七八次，这里给出它唯一的原始出处。

指标约定在 `01-introduction.tex:71-72`："Index the entries of $p_i$ and the rows and columns of a $(d+1)$-by-$(d+1)$ matrix by $0,1,\ldots,d$. Thus index $0$ is the constant coordinate." 注意它同时规定了 $P$ 的尺寸是 $(d+1)\times(d+1)$，行 78 才写 $\operatorname{Mat}_{d+1}(B)$，两处必须一起读，否则容易把 $P$ 误记成 $d\times d$。

`01-introduction.tex:74` 打开 theorem 环境（`[Classification]\label{thm:classification}`），未知数在 `:78`（"$P\in\operatorname{Mat}_{d+1}(B)$"），第一族条件在 `:80-81`（label `eq:field-evaluations`，量词 $1\le i\le s$），第二族在 `:82-83`（label `eq:field-spatial`，量词 $1\le\alpha,\beta\le d$）。`01-introduction.tex:85-86` 补一句"Here the entries of $p_i\otimes1$ and $1\otimes p_i$ are formed componentwise"，`:86-87` 补一句"There are no separate conditions on the multiplied constant row or constant column of $P$."

§2 开场把假设复述一遍：`02-tensors.tex:6-8` "Throughout, $s\geq2$, $d\geq1$, and $A=\{a_1,\ldots,a_s\}$ affinely spans $\R^d$; the field $F$, ring $B$, columns $p_i$, and multiplication map $m_F$ are as in the theorem." 这句给了 §3–§7 全部下游单元的合法输入。

### 11.2 张量积为什么只能取在 $\mathbb Q$ 上

`01-introduction.tex:62` 的生成式写法已经把答案写出来了：$F$ 是 $\Q$ 添加坐标得到扩张得到的域，它在结构上只是 $\Q$-代数。要让 $F\otimes_{?}F$ 有意义，底环必须同时是两边 $F$ 的标量环，而 $F$ 作为 $\R$ 的子域对一般实数不封闭（含 $\sqrt2$ 的坐标域连 $\tfrac12\cdot\sqrt2$ 的除法之外的实标量都不保），所以候选底环只有 $\Q$（特征零域的素域）。

反面算例更直白：若取 $\R\otimes_{\R}\R$，它同构于 $\R$，$m_F$ 型映射的核为零，于是"乘前相等"与"乘后相等"重合，判据的第一族条件就退化成 `01-introduction.tex:98-102` 那个普通球面方程 $\|a_i\|^2+\ell\cdot a_i+c=0$。`01-introduction.tex:103-106` 正是用这个对比来界定论文的贡献："The tensor condition requires the evaluation identities to hold before multiplication. This is the distinction between sphericity and the Ramsey property that the classification detects."

我原来的理解停在一个更弱的说法上（"有理系数最终要拆成整数重数"）。那句话是 §1.2 的 [推测]，站得住，但它只解释了 $W$ 取 $\Q$-空间（`02-tensors.tex:10` "Put $W=\R\times\R^d$, regarded as a vector space over $\Q$"）与权重有理化（`04-pairs.tex:163` "$\mu:\Gamma\to\Q$"）的需求。$B$ 这一层的理由是纯范畴论意义上的张量积定义域，与重数整数性无关。把两者混为一条理由会让我错误地认为"取 $\R$ 上张量后只要再把系数逼近成有理数就能救回来"；实际救不回来，因为 $\R\otimes_{\R}\R$ 里根本没有可逼近的核结构，信息在选择底环那一刻就已丢失。

### 11.3 两族条件各自的缺件后果

第一族（`01-introduction.tex:80-81`）共 $s$ 个 $B$-值方程，未知量共 $(d+1)^2$ 个 $B$-元素，所以方程数与未知量数无关（$s$ 与 $d$ 独立变化），这一族负责"每个点落在同一个增强版球面上"。第二族（`01-introduction.tex:82-83`）是 $d^2$ 个 Kronecker 条件，它约束的是乘后空间块等于 $I_d$。

若把第二族弱化成"空间块乘后非退化"（$\det\ne0$）：下游 $UCU^{\mathsf T}=I_d$（`03-stencil.tex:30`）就变成 $UCU^{\mathsf T}=A$（某可逆实对称阵），于是 `04-pairs.tex:60` 的"$U$ 有秩 $d$"仍真、但 `04-pairs.tex:63-66` 的 $h^{\mathsf T}Ch=\|y\|^2$ 变成 $h^{\mathsf T}Ch=y^{\mathsf T}Ay$，$C$ 在 $H=\operatorname{im}(U^{\mathsf T})$ 上的正定性只剩 $A\succ0$ 的情形，$A$ 有负特征值时整套 $S=\epsilon P_H+LP_V$ 构造失效（`04-pairs.tex:71`）。归一到 $I_d$ 是把"$A$ 的正负惯性"这一额外自由度从证明里彻底消除的做法。

若把第二族整个删掉：证书只剩"所有点在乘前张量意义下共球面"，$P$ 可以取零矩阵，判据对所有 $A$ 平凡成立，与 `07-consequences.tex:153`（cons:nine，九点不 Ramsey）直接冲突。

若把第一族的 $1\le i\le s$ 改成 $1\le i<s$（少一个点）：`05-paths.tex:317-323` 的距离恒等式只保证 $s-1$ 个点位正确，最后一点失去求值相消，双尺度列表的坐标多重集配对（`04-pairs.tex:8` 起的 pairs:two-scale 结论）无法闭合。

### 11.4 无约束的常数行列与它的下游

`01-introduction.tex:86-87` 那句"There are no separate conditions..."我起初当成疏漏，怀疑论文忘了写 $P_{00}$ 的条件。核到 `07-consequences.tex:8` 的 cons:spherical 才确认它是设计：对该矩阵作用 $m_F$ 得到 $H\in\operatorname{Mat}_{d+1}(F)$，第一族乘后成 $p_i^{\mathsf T}Hp_i=0$，展开即球面方程，而 $\ell$ 与 $c$ 这两个自由参数恰由乘后的常数行与常数列提供。给它们加约束等于把球心与半径预先钉死，判据会失去全部几何自由度。这与 §8.1 的记法一致，本轮补上它的原始行号（`01-introduction.tex:98-102` 给出乘后球面方程本身）。

## 十二、深拆一：Remark alg:noetherian（`02-tensors.tex:104-116`）

### 12.1 (a) 逐字引用

`02-tensors.tex:104` 开 remark（`\begin{remark}\label{alg:noetherian}`），正文 `:105-115`：

> "The finite coordinate presentation explains the algebraic nature of the criterion. Let $F_0=\Q[(a_i)_j]$, the subring of $\R$ generated by all coordinates. It is a finitely generated domain and $F=\operatorname{Frac}(F_0)$. The ring $B$ is the localization of $F\otimes_{\Q}F_0$ at the elements $1\otimes f$ for $0\ne f\in F_0$. The latter ring is a finitely generated $F$-algebra, so $B$ is Noetherian. The kernel of the finite evaluation system therefore has finitely many $B$-module generators. Its multiplied spatial image is the $F$-span of their multiplied spatial blocks, because every scalar $c\in F$ lifts to $c\otimes1$. This description uses exact coordinate-field relations; it makes no claim to recover those relations from numerical real inputs."

remark 在 `:116` 结束。§九 只把它列为"未形式化"，本轮第一次做完整拆解。

### 12.2 (b) 中间步骤

第一步，$F_0$ 的结构。生成元集是 $\{(a_i)_j:1\le i\le s,\ 1\le j\le d\}$，至多 $sd$ 个，故 $F_0$ 是 $\Q$ 的多项式环在这些生成元上的商：取 $S=sd$ 个不定元的多项式环映射过去，像即 $F_0$，商环保持有限生成（多项式环的有限生成 $\Q$-代数，Hilbert 基定理的语法层面）。$F_0\subset\R$ 是域的子环，无零因子，因此是整环。

第二步，$F=\operatorname{Frac}(F_0)$ 的核对。这里我起初以为是句显然的话，实际有内容：按 `01-introduction.tex:62`，$F$ 是坐标在 $\Q$ 上的域扩张（添加逆元与除法），而 `02-tensors.tex:107` 说 $F_0$ 只是添加坐标的环。两者差别正是"商域化"，$F$ 里每个元素形如 $g/h$（$g,h\in F_0$，$h\ne0$），$F_0$ 是整环保证分母可逆不塌。

第三步，$B$ 的局部化表述。$B=F\otimes_{\Q}F$。先在左边把第二个因子换掉：$F\otimes_{\Q}F_0$ 是 $F$-代数（$F$ 只作用在左因子），生成元是 $1\otimes x_1,\dots,1\otimes x_S$（$x_j$ 遍历坐标），所以有限生成；Hilbert 基定理给它是 Noetherian 环。再对乘集 $\{\,1\otimes f:0\ne f\in F_0\,\}$ 局部化：局部化保持 Noetherian（ ideals 与乘集不交的 ideal 一一对应，升链条件传递），局部化后右因子恰好被域化，$F\otimes_{\Q}F_0[(1\otimes f)^{-1}]=F\otimes_{\Q}\operatorname{Frac}(F_0)=B$。$B$ Noetherian 得证。

第四步，有限求值系统的 kernel 有限生成。系统指 `02-tensors.tex:44-49` 的 $E_i(Q)=\sum_{\alpha,\beta}(p_{i,\alpha}\otimes1)Q_{\alpha\beta}(1\otimes p_{i,\beta})$，即把 `\operatorname{Mat}_{d+1}(B)` 映到 $B^{s}$（再加空间块到 $\operatorname{Mat}_d(F)$ 的 $m_F$ 复合）。前一半是 $B$-线性映射（系数 $p_{i,\alpha}\otimes1\in B$，行 81 的求值对 $Q$ 是双线性的），其 kernel 是 $B$-子模；$B$ Noetherian ⟹ 子模有限生成，设生成元 $g_1,\dots,g_N$。

第五步，像的表述。把 $m_F$ 逐条目作用到空间块，得映射 $\sigma:g\mapsto(m_F(g_{\alpha\beta}))_{1\le\alpha,\beta\le d}$。断言 $\sigma(\ker E)$ 等于 $F$-span$\{\sigma(g_1),\dots,\sigma(g_N)\}$。包含"$\supseteq$"是 $\sigma$ 的加性与 $\ker E$ 对 $B$-数乘封闭：对 $c\in F$，$c\otimes1\in B$ 且 $E_i((c\otimes1)g)=0$（`02-tensors.tex:113-114` 的 "because every scalar $c\in F$ lifts to $c\otimes1$" 就是这一步），而 $m_F((c\otimes1)_{\alpha\beta}\cdot g_{\alpha\beta})=c\,m_F(g_{\alpha\beta})$，所以 $c\,\sigma(g)\in\sigma(\ker E)$。反向包含由任意 $\ker E$ 元素写成 $\sum b_k g_k$ 后逐条 $m_F(b_{k,\alpha\beta}g_{k,\alpha\beta})=m_F(b_{k,\alpha\beta})\,m_F(g_{k,\alpha\beta})$ 得到，系数落在 $F$。

第六步，判据的可行性归约。于是"是否存在解"化为：仿射子空间 $\{Q:E_i(Q)=0\}$ 的 $\sigma$-像是否碰到 $I_d$。像是一个 $F$-线性子空间，由 $N$ 个显式 $d\times d$ 矩阵张成，$I_d$ 是否属于它 = 一个 $F$-上线性方程组是否有解 = 行化简可判定。这与 `02-tensors.tex:90-92` 的 "row reduction over $F$ shows that it is consistent over $F$" 是同一台机器的两次使用。

### 12.3 (c) 假设、常数与指数的机械理由

- 为何要"有限坐标呈现"：若坐标无限多，$F_0$ 不再是有限生成 $\Q$-代数，Hilbert 基定理失效，$B$ 可能非 Noetherian，kernel 的有限生成元就不存在，第五步的 $N$ 是无穷、判定化约崩掉。$F_0$ 的有限生成是整条化约链唯一的"有限性来源"。
- 为何要整环：局部化的乘集要求排除 $0$；若 $F_0$ 有零因子，$\operatorname{Frac}$ 不是域，$1\otimes f$ 可能是零因子，局部化后 $B$ 与 $F\otimes_\Q F$ 不再同构。这里 $F_0\subset\R$ 天生无零因子，理由外部（实数域是域），并非内部。
- 为何用 $F\otimes_\Q F_0$ ，并非 $F_0\otimes_\Q F_0$：后者局部化时要同时 invert 两边的非零元，$F$-代数结构（左因子已经是域）让"Hilbert 基定理"这一步有左系数域可用；用 $F_0\otimes F_0$ 得到的是 $\Q$-代数，Noether 性仍真但第五步的 $c\otimes1$ 提升只能覆盖 $c\in F_0$，无法处理 $F$ 中的分式标量。
- "$c\otimes1$"的定向选择：$B$ 里有两个拷贝，$c\otimes1$ 与 $1\otimes c$。选前者是因为求值系数在 `02-tensors.tex:46-48` 就写成 $(p_{i,\alpha}\otimes1)$ 与 $(1\otimes p_{i,\beta})$ 分居两侧，$Q_{\alpha\beta}$ 的左乘标量取自第一因子。选错侧会让 $\sigma(\ker E)$ 的 $F$-结构变成右模，$I_d$ 的检验式在转置一侧。
- 指数与量级：$S\le sd$ 是 $F_0$ 生成元数；$E_i$ 个数 $s$；未知条目 $(d+1)^2$；$N$ 无显式上界（依赖 ideal 生成元数，可能远大于 $s(d+1)^2$）。这就是 remark 结尾（`:114-115`）"exact coordinate-field relations"的代价：$N$ 只能存在性得到。

### 12.4 (d) 候选失败路线

[推测] 路线一，把 $B$ 直接当成 $\R$-代数并用 $\R$-线性代数判 kernel。$B$ 上没有 $\R$-结构（只有 $\Q$ 与 $F$ 的标量），要硬加就必须选 $\R$ 作为 $B$-模基，而 $B$ 的势与 $\R$ 相同但 $F$-维数一般无穷，选基会引入非典范的 $\R$-线性映射，第五步的 $F$-span 表述失去意义，判定不再在 $F$ 内闭合。

[推测] 路线二，用 Groebner 基代替 kernel 生成元。求值系统对 $Q_{\alpha\beta}$ 是一次线性的，Groebner 基在此退化；一旦想把它用于"从坐标数值近似猜测关系"（remark 明确拒绝，`:115`），就得引入 ideal 的近似饱和，Noether 性给不出误差控制，判据的精确性（`01-introduction.tex:92-94`）被破坏。

[推测] 路线三，跳过 $B$ Noether 性，直接在 $\mathscr B=\R\otimes_\Q\R$ 上取 kernel 生成元。$\mathscr B$ 不是 Noetherian（$\R$ 在 $\Q$ 上无穷维，$\mathscr B$ 含无穷直和分解 `02-tensors.tex:67-71`），kernel 未必有限生成；即使有限生成，生成元的系数含超越实数，降回 $F$ 需要 `02-tensors.tex:90-92` 的相容性下降，多绕一层而无所获。这条路线的失败点与 §九 记下的"Lean 的下降不需要 Noether 性"呼应：形式化选了另一侧，说明这台 Noether 机器确实是表述性的。

## 十三、深拆二：Lemma paths:compactness（`05-paths.tex:47-67`）

### 13.1 (a) 逐字引用

引理陈述 `05-paths.tex:47-51`：

> "\begin{lemma}\label{paths:compactness} Fix an integer $r\ge2$. If every $r$-coloring of $\mathcal E$ contains a monochromatic congruent copy of $A$, then the same holds for every $r$-coloring of $\R^D$, for some finite $D$."

它前面有出处声明 `05-paths.tex:43-45`："The following finite-dimensional reduction is the compactness principle used in Euclidean Ramsey theory; compare \cite[Proposition~4]{egm-rss}. We include its proof for arbitrary colorings."

证明 `05-paths.tex:54-66`：

> "Suppose instead that every $\R^D$ admits an $r$-coloring avoiding $A$. Consider the compact product space $\{1,\ldots,r\}^{\mathcal E}$. For each ordered congruent copy $(b_1,\ldots,b_s)$ of $A$ in $\mathcal E$, impose the condition that the colors of the $b_i$ are not all equal. This is a clopen condition depending on finitely many coordinates of the product space. Every finite collection of these conditions involves finitely many finite-support vectors. They all lie in the first $D$ coordinate positions for some $D$. An avoiding coloring of this $\R^D$, extended arbitrarily to $\mathcal E$, satisfies the finite collection. Compactness therefore gives a coloring satisfying all the conditions, contrary to the hypothesis."

§6.1 只写了"反证 + Tychonoff + 有限交性质"三行，本节补全。

### 13.2 (b) 中间步骤

第一步，空间与点。$\mathcal E=\R^{(\N)}$（有限支撑向量），染色全集 $X=\{1,\dots,r\}^{\mathcal E}$，配乘积拓扑：每个因子 $\{1,\dots,r\}$ 是有限离散空间，紧；Tychonoff 给 $X$ 紧。$X$ 的元素是任意函数，无正则性假设，这正是 `05-paths.tex:45` "for arbitrary colorings" 的内容。

第二步，闭开性核对。固定有序拷贝 $\beta=(b_1,\dots,b_s)$，令 $C_\beta=\{c\in X:\neg(c(b_1)=\cdots=c(b_s))\}$。补集是 $\bigcup_{k=1}^{r}\bigcap_{i=1}^{s}\{c:c(b_i)=k\}$；每个 $\{c:c(b_i)=k\}$ 是单坐标柱集，在乘积拓扑里既开又闭（因子离散 ⟹ 单点子集 clopen，柱集是它的原像）。有限交、有限并仍 clopen，故 $C_\beta$ clopen，且只读 $s$ 个坐标。

第三步，有限交性质（FIP）。给有限族 $C_{\beta^{(1)}},\dots,C_{\beta^{(M)}}$，涉及的点是 $\bigcup_{m,i}b^{(m)}_i$，有限个、每个支撑有限，故落在某个前 $D$ 坐标子空间，且（经 $\mathcal E$ 内的线性等距把该有限集搬回标准位置后）可视为 $\R^D$ 中的点集。反证假设给该 $\R^D$ 一个避开 $A$ 的 $r$-染色；把它沿 $\mathcal E$ 的坐标分解"arbitrarily"延拓（`:63-64`），得到的 $c\in X$ 在这 $M$ 个拷贝上全都非单色（因为这些条件只读那 $D$ 个坐标，延拓值无关）。FIP 成立。

第四步，紧性收尾。紧空间中一族闭集若有 FIP 则总交非空，取 $c\in\bigcap_\beta C_\beta$，它在 $\mathcal E$ 上避开 $A$ 的每一有序拷贝，与前提"每个 $r$-染色有单色拷贝"矛盾。

第五步，"ordered"的作用。前提针对无序点集，$C_\beta$ 用有序组只是把条件加密（有序拷贝非单色 ⟹ 无序集合非单色的逆否仍成立，方向上不损失），加密后仍 FIP，所以用有序写法纯粹为了让"$s$ 个坐标"的记号齐整。

第六步，它在整个证明里的位置。`05-paths.tex:326-328` 组装段末句"Lemma~\ref{paths:compactness} now supplies a forcing dimension for $r$"：判据在无穷维 $\mathcal E$ 上产出拷贝，Ramsey 定义要求有限 $D$，此引理是唯一的收口。

### 13.3 (c) 假设、常数与指数的机械理由

- 为何必须先固定 $r$：$X=\{1,\dots,r\}^{\mathcal E}$ 的紧性来自有限离散因子。若把 $r$ 也当作变量在同一空间里做，因子集是 $\bigcup_r\{1,\dots,r\}$，不是有限集，乘积不紧，FIP 无结论。定义里"$r$ 任意但逐个处理"的结构与此严格对应。
- 为何"every $\R^D$ admits an avoiding coloring"是正确否定式：前提是"存在某 $D$ 使每个染色有单色拷贝"，否定是"对每个 $D$ 都存在避开染色"。第三步需要的正是对某特定 $D$（由有限族决定）的存在性，所以必须让否定式带全称量词在 $D$ 上。
- 为何延拓可以"arbitrarily"：$C_\beta$ 只依赖 $s$ 个具体点的坐标；把 $\R^D$ 的染色逐点搬到 $\mathcal E$ 的那 $D$ 个坐标位置、其余点任意赋值，涉及的拷贝读到的值不变。若条件涉及无穷多点（例如要求"每个有限维子空间的染色都避开"），任意延拓就会破坏条件。
- 为何需要"finite-support vectors"这一句（`:61-62`）：$\mathcal E$ 的元素是有限支撑的，故 $s$ 个点的支撑并集仍有限，才能被"前 $D$ 个坐标"覆盖；若环境取 $\ell^2$ 或 $\R^\N$ 全体，坐标可能无穷多，第三步失效。这一句是 $\mathcal E$ 作为公共无穷维环境的本质用处。
- "$D$ 有限"与 $s$ 无关：$D$ 由有限族的点数决定，可能远大于 $s$（一般 $D\le$ 支撑并的坐标数），引理不声明 $D$ 的上界；这与 `05-paths.tex:262` 的"We use only existence of the length"是同一种克制：只取存在性、不取界。

### 13.4 (d) 候选失败路线

[推测] 路线一，把 $X$ 换成"可测染色"的子空间以求更强的结论。可测染色集合在乘积拓扑里不闭（逐点极限可破坏可测性），FIP 取到的 $c$ 未必仍可测；同时该子空间非紧，第四步失去依据。更根本的是 Ramsey 定义里没有任何正则性，加上可测性只会削弱定理。

[推测] 路线二，不用 Tychonoff，改用"逐维增大 $D$"的构造式对角论证。对每个 $D$ 取避开染色 $c_D$，想从 $(c_D)$ 抽一个 $\mathcal E$ 上的极限染色；这需要超滤子极限或紧致性，等价于把 Tychonoff 换了一层皮。Lean 走的恰是这条（`TensorNecessity.lean` 与 `ColoringCompactness.lean` 分处不同模块，形式化用维数上的超滤子），说明两种写法都绕不开某种选择原理：`ComparatorChallenges/EuclideanRamsey.json:8-12` 的 permitted_axioms 里就有 `Classical.choice`。

[推测] 路线三，直接在有限维 $\R^D$ 上做完全部构造、不引入 $\mathcal E$。§5 的字符串拼接与 `05-paths.tex:110-111` 的逐块嵌入 $J_j$ 需要任意多个两两正交坐标块，块数由 Hales-Jewett 线长 $n$ 与展开路径长度决定，而 $n$ 在染色之前未知（`:258-262`），所以坐标总量事先无法有界；固定 $D$ 会砍掉一部分展开长度，判据的前提（对所有 $n$ 存在路径对）就用不上。

## 十四、深拆三：pairs:bump 的正定性构造（`04-pairs.tex:55-90`）

### 14.1 (a) 逐字引用

引理本体 `04-pairs.tex:42-53`（`\begin{lemma}[A compactly supported smoothing function]\label{pairs:bump}`）：

> "Let $C$ be a real symmetric $k\times k$ matrix and let $U\in\operatorname{Mat}_{d\times k}(\R)$, where $d\geq1$ and $UCU^{\mathsf T}=I_d$. For every $\eta>0$, there is a nonnegative $b\in C_c^\infty(\R^k)$ such that $\int_{\R^k}b(x)\,dx>0$, $\int_{\R^k}(D_Cb)_-(x)\|Ux\|^2\,dx<\eta\int_{\R^k}b(x)\,dx$."

本轮拆的是它证明的前半，`04-pairs.tex:56-58` 与 `:60-71` 与 `:82-90`：

> "We will average Gaussian densities with covariance matrices running from $S$ to $S+C$. We first construct a positive definite $S$ for which $S+C$ is positive definite and $\tr(USU^{\mathsf T})$ is small."（`:56-58`）
> "The identity $UCU^{\mathsf T}=I_d$ implies that $U$ has rank $d$. Set $H=\operatorname{im}(U^{\mathsf T})$ and $V=\ker U$, so that $\R^k=H\oplus V$ orthogonally. The restriction of the quadratic form $C$ to $H$ is positive definite: if $0\ne h=U^{\mathsf T}y$, then $h^{\mathsf T}Ch=y^{\mathsf T}UCU^{\mathsf T}y=\|y\|^2>0$."（`:60-66`）
> "Choose $\epsilon>0$ with $\epsilon\tr(UU^{\mathsf T})<\eta/8$. We claim that, for a sufficiently large $L>0$, the matrix $S=\epsilon P_H+LP_V$ is positive definite and so is $S+C$."（`:67-73`）
> "Choose $L$ such that $C_{VV}+LI_V-B^{\mathsf T}A^{-1}B>0$ and use the Schur complement. If $V=\{0\}$, the second block is absent. Since $UP_V=0$, this construction also gives $\tr(USU^{\mathsf T})=\epsilon\tr(UU^{\mathsf T})<\eta/8$."（`:82-88`，其中 `:86-88` 是 label `pairs:small-covariance` 的公式）
> "Every matrix $S+tC$, $0\leq t\leq1$, is positive definite, being a convex combination of $S$ and $S+C$."（`:89-90`）

### 14.2 (b) 中间步骤

第一步，秩与分解。$UCU^{\mathsf T}=I_d$ 取秩：$d=\operatorname{rank}(I_d)\le\operatorname{rank}(U)\le\min(d,k)$，故 $U$ 满行秩，$k\ge d$，且 $\ker U$ 的余维数恰为 $d$。$\operatorname{im}(U^{\mathsf T})=(\ker U)^{\perp}$ 是标准事实（对任意实矩阵成立），于是 $H\oplus V=\R^k$ 正交分解，$P_H+P_V=I_k$。

第二步，$C$ 在 $H$ 上正定。取 $h=U^{\mathsf T}y\ne0$：$h^{\mathsf T}Ch=y^{\mathsf T}UCU^{\mathsf T}y=y^{\mathsf T}I_dy=\|y\|^2$。这里要核对 $y\mapsto U^{\mathsf T}y$ 从 $\R^d$ 到 $H$ 是双射（单射因 $U$ 满行秩，满射因 $H$ 定义为像），所以 $H$ 中每个非零元都能写成该形式，正定性对 $H$ 全体成立；同时说明 $C$ 在 $H$ 上的限制非退化。

第三步，$\epsilon$ 的预算。$\epsilon$ 只被一个约束限制（$\epsilon\tr(UU^{\mathsf T})<\eta/8$），可任取小。为什么预算里出现 $\tr(UU^{\mathsf T})$ ，并非 $\|U\|$：后面 `:120-124` 用的是零均值 Gaussian 的二阶矩公式 $\int\phi_S(x)\|Ux\|^2dx=\tr(USU^{\mathsf T})$，而 $USU^{\mathsf T}=\epsilon UP_HU^{\mathsf T}+LUP_VU^{\mathsf T}=\epsilon UU^{\mathsf T}$（第二步末的 $UP_V=0$ 消掉 $L$ 项，迹线性给出 $\tr$）。所以 $\epsilon$ 与 $\tr(UU^{\mathsf T})$ 成反比，$L$ 完全自由。

第四步，$S+C$ 的正定性与 Schur 补。在 $H\oplus V$ 基下把 $C$ 分块为 $\begin{pmatrix}C_{HH}&B\\ B^{\mathsf T}&C_{VV}\end{pmatrix}$，于是 $S+C$ 的 $(1,1)$ 块是 $A=C_{HH}+\epsilon I_H$。第二步给 $C_{HH}\succ0$，故 $A\succ0$（甚至 $\epsilon=0$ 也成立；留 $\epsilon$ 是为了 $S$ 本身正定）。对分块对称矩阵，若 $A\succ0$，则整体正定当且仅当 Schur 补 $C_{VV}+LI_V-B^{\mathsf T}A^{-1}B\succ0$。该式对 $L$ 是仿形的：$(C_{VV}-B^{\mathsf T}A^{-1}B)+LI_V$，其最小特征值随 $L\to\infty$ 线性趋于 $+\infty$，故存在有限的 $L_0$ 使 $L>L_0$ 时正定。$V=\{0\}$ 情形（即 $k=d$、$U$ 可逆）第二块不存在，$S+C=C_{HH}+\epsilon I\succ0$ 自动。

第五步，整条线段正定。$S\succ0$ 与 $S+C\succ0$ ⟹ 对 $t\in[0,1]$，$S+tC=(1-t)S+t(S+C)$ 是正定锥中的凸组合（正定锥是凸锥：$x^{\mathsf T}((1-t)S_1+tS_2)x=(1-t)x^{\mathsf T}S_1x+tx^{\mathsf T}S_2x>0$ 对 $x\ne0$）。$t\mapsto Q_t=S+tC$ 给出连接两端的道路。

第六步，为什么必须整条线段正定：`:92-96` 的 Gaussian 密度 $\phi_Q$ 只对正定 $Q$ 有定义（$\det Q>0$ 与 $Q^{-1}$ 都要存在）；`:100-105` 求导 $\frac{d}{dt}\phi_{Q_t}=D_C\phi_{Q_t}$，`:111-113` 对 $t$ 积分定义 $b_*=\int_0^1\phi_{S+tC}dt$，`:116` 用微积分基本定理得 $D_Cb_*=\phi_{S+C}-\phi_S$。若某 $t$ 处 $Q_t$ 退化，密度不归一、积分号下的求导合法性全断。这正是第三步选 $S$ 形式的唯一动机：让 $S$ 与 $S+C$ 同时正定且 $S$ 在 $U$ 看来"几乎为零"。

第七步，$D_C$ 的含义（`:106` 补一句"This identity does not require $C$ to be positive semidefinite"）。$D_C=\sum_{j,l}C_{jl}\partial_j\partial_l$ 是按 $C$ 做二阶微分；对 Gaussian 求 $\partial_j\partial_l\phi_Q$ 会得到 $(x^{\mathsf T}Q^{-1}CQ^{-1}x-\tr(Q^{-1}C))\phi_Q$ 的一半，与 $\frac{d}{dt}\det(S+tC)^{-1/2}$、指数里 $Q_t^{-1}$ 的导数合并后正好对上。$C$ 的符号无关，因为它是微分算子的系数。

### 14.3 (c) 假设、常数与指数的机械理由

- 为何要 $d\ge1$（`:44`）：$d=0$ 时 $U$ 是空矩阵、$I_d$ 为空，$\|Ux\|^2\equiv0$，结论对任意 $b$ 平凡成立但 $\eta$ 比较失去内容；更重要的是 $H=\operatorname{im}(U^{\mathsf T})=\{0\}$，第二步的正定性论证无对象，$A$ 的构造（`:80$ 的 $C_{HH}+\epsilon I_H$）在零维块上无定义。$d\ge1$ 保证 $H\ne\{0\}$。
- 为何要 $UCU^{\mathsf T}=I_d$ 归一到单位：若只要求非退化，第二步得 $h^{\mathsf T}Ch=\|y\|_A^2$（$A$ 为某对称阵），$A$ 有负特征值时 $C|_H$ 不定，$S+C$ 的正定性无法靠放大 $L$ 补救（$H$ 方向的负项不受 $L$ 控制）。归一化把 $H$ 上的惯性钉成正的，这是整个引理成立的唯一入口。
- 为何 $\eta/8$：预算分三处（第一步 $D_Cb_*$ 的负部积分 $<\eta/8$，见 `:120-124`；截断误差 $<\eta/8$，见 `:135-143`；合计 $<\eta/4$，见 `:144-146`）。$:146$ 写 $\eta/4<\eta\int b_R$，因为 $\int b_R>1/2$（`:143`）。若把 $\epsilon$ 预算取成 $\eta/2$，第三步与截断误差之和只压到 $\eta$，末式 $\eta<\eta\int b_R$ 因 $\int b_R<1$ 不成立，引理结论失去严格不等号。$8$ 这个数字本身没有数学内容，它是"$2\times2\times2$"式的三段预算分配。
- 为何 $L$ 只需存在、不需估计：$L$ 出现在 $V$ 方向，而 $UP_V=0$ 让它从 $\tr(USU^{\mathsf T})$ 中彻底消失（`:84-85` 明确点出这一句）。所以 $L$ 越大越好，证明不付出代价；这是 $S$ 取两个投影加权和、，并非取 $\epsilon I$ 的全部理由。
- 为何 $b$ 只需 $\int b>0$ ，并非 $=1$：下游 `04-pairs.tex:198-202` 把 $\int b$ 吸收进 $\zeta_n$，`:230-231$ 要求 $\zeta_n>0$；归一化在 Riemann 和那一步会额外引入 $n^{-k}$ 的取整误差，留着 $\int b$ 反而让 $\zeta_n\to\int b$ 的极限形式干净。

### 14.4 (d) 候选失败路线

[推测] 路线一，$S=\epsilon I_k$（各向同性）。$S+tC$ 在 $C$ 有绝对值大于 $1/\epsilon$ 的负特征值时失正定（最小特征值 $\epsilon+\lambda_{\min}(C)<0$），而 $\lambda_{\min}(C)$ 在 $V$ 方向可任意负（$C$ 在 $\ker U$ 上无任何约束，第二步只管 $H$）；$\epsilon$ 受 $\eta$ 与 $\tr(UU^{\mathsf T})$ 限制，无法自适应。失败机制：无法同时满足"小迹"与"全线段正定"，这两条需求在 $V$ 方向上互相拉扯，只有用 $L$ 在 $V$ 上单独抬高才能解耦。

[推测] 路线二，去掉 $H\oplus V$ 分解，直接在 $C$ 的正部上取 $S$。$C$ 的正特征子空间一般与 $H$ 不重合（$C$ 在 $H$ 上正定不排除它在别处也正定或在 $H$ 内混合），拿 $C$ 自己的谱分解会让 $UP_V=0$ 失效，迹的估计里漏进不可控项。$H$ 是由 $U$ 决定的，与 $C$ 的谱无关，这个分解方向是单向可用的。

[推测] 路线三，用均匀分布的指示函数代替 Gaussian 来做 $D_C$ 计算。$D_C$ 是二阶微分，指示函数分布值，`:100-105` 的密度求导与 `:118` 的点态不等式 $(\phi_{S+C}-\phi_S)_-\le\phi_S$ 都没有对应物；而 `04-pairs.tex:204-210` 的 Taylor 展开还要求 $b$ 有三阶有界导数（`:211-212` "the third derivatives of $b$ are bounded"），$C_c^\infty$ 是最低要求。

## 十五、深拆四：Lemma paths:synchronization（`05-paths.tex:69-102`）

### 15.1 (a) 逐字引用

陈述 `05-paths.tex:69-74`：

> "Fix an integer $n\ge1$. Let two paths have the same endpoint and weights $\lambda>0$ and $\mu\ge0$. If $\rho=\mu/\lambda<1/n$, then there is an endpoint $w\in K^s$ admitting a path of weight $1/t$ for every integer $1\le t\le n$."

证明要点 `05-paths.tex:77-82`、`:84-90`、`:92-101`：

> "Set $\alpha_t=\frac{1/t-\rho}{1-\rho}$ $(1\le t\le n)$. These numbers satisfy $0<\alpha_n<\cdots<\alpha_1=1$. Partition $[0,1]$ at these points."
> "For each resulting interval of length $l>0$, apply to both paths the endomorphism of $K$ defined by $\xi_z\longmapsto\xi_{\sqrt{l/\lambda}\,z}$. It preserves diagonal factors and multiplies every copy-factor weight by $l/\lambda$. The two new paths thus have the same endpoint and weights $l$ and $\rho l$."
> "Concatenate the interval paths in increasing interval order. The resulting endpoint is independent of which of the two paths is chosen on each interval. For a given $t$, choose the larger weight on the intervals before $\alpha_t$ and the smaller weight on the remaining intervals. The total weight is $\alpha_t+\rho(1-\alpha_t)=\frac1t$. The fixed order of concatenation gives one endpoint $w$ for all $t$; no commutation of factors is used."

§6.1 用五行带过，本节把 $\alpha_t$ 的单调性、自同构合法性与拼接顺序逐条补开。

### 15.2 (b) 中间步骤

第一步，$\alpha_t$ 的定义域。$\rho<1/n\le1$ 保证 $1-\rho>0$，分母不零。$\alpha_1=(1-\rho)/(1-\rho)=1$ 恒成立（$t=1$ 时分子即 $1-\rho$），这是切点序列右端锚定的原因。

第二步，$\alpha_n>0$ 的等价条件。$\alpha_n=(1/n-\rho)/(1-\rho)$，分母正，故 $\alpha_n>0\iff\rho<1/n$，正是假设。$t$ 增大时 $1/t$ 严格减，分子严格减而分母固定，故 $\alpha_t$ 严格减：$1=\alpha_1>\alpha_2>\cdots>\alpha_n>0$。$n=1$ 时序列退化为单点 $\{1\}$，区间 $[\alpha_1,1]=\varnothing$（长度零），第二个选项只在 $[\alpha_n,\alpha_1]=[0,1]$ 上取，结论平凡：需一条权重 $1$ 的路径，而 $\lambda$ 可缩放为 $1$。

第三步，切点产生区间。切点集 $\{\alpha_n<\cdots<\alpha_1=1\}$ 与左端 $0$ 一起把 $[0,1]$ 分成 $n$ 段：$[\alpha_{t+1},\alpha_t]$（$t=1,\dots,n-1$）与 $[0,\alpha_n]$，长度记 $l$，全部严格正，且总和 $1$。$t$ 段（长度 $\alpha_t-\alpha_{t+1}$）与 $[0,\alpha_n]$ 一起给出"位于 $\alpha_t$ 之前"的总长 $\alpha_t$，其余总长 $1-\alpha_t$。

第四步，缩放自同构。$\mathcal E=\R^{(\N)}$ 中 $z\mapsto\sqrt{l/\lambda}\,z$ 是双射线性映射（把有限支撑映到有限支撑，逆为乘 $\sqrt{\lambda/l}$），故它诱导字母表 $\mathcal E$ 的置换，进而给出自由群 $K$（生成元 $\{\xi_z:z\in\mathcal E\}$）的自同构：生成元被双射置换唯一决定群自同构。它把拷贝因子 $X_b$（权重 $u$，满足 $\|b_i-b_j\|^2=u\|a_i-a_j\|^2$）送到 $X_{\sqrt{l/\lambda}b}$，新权重 $l/\lambda\cdot u$；对角因子由 $s$ 个相同分量构成、权重 $0$，缩放后仍是对角因子（`:85$ 的"It preserves diagonal factors"）。所以路径结构（因子序列的形状）不变，只有每个拷贝因子的尺度值变了，权重整体乘 $l/\lambda$。

第五步，两条路径同时缩放。原路径权重 $\lambda$、$\mu=\rho\lambda$，缩放后 $l$、$\rho l$。端点仍在同一 $s$-元组空间 $K^s$：两条原路径端点相同，逐因子映射同态后仍相同（每条区间路径的端点等于 $w^{(l)}$ 的某个 $K^s$ 元素，两条区间路径给出同一个 $s$-元组）。

第六步，拼接与端点无关性。按区间递增顺序拼接 $n$ 段，每段在两条区间路径里选一条。$K^s$ 中的乘积是 $s$ 个坐标分量的逐坐标乘积，每段对第 $i$ 分量的贡献都是该段端点的第 $i$ 分量；拼接顺序全局固定 ⟹ 乘积顺序对所有 $t$ 一致，逐段选择只影响该段插入的字，不影响顺序。权重相加（权重定义是各因子权重之和），所以总权重只取决于"哪些段选了大权重"。

第七步，精确算权重。对给定 $t$，$\alpha_t$ 之前总长 $\alpha_t$、之后 $1-\alpha_t$，取 $\lambda$-型（权重 $l$）于前者、$\mu$-型（权重 $\rho l$）于后者，总权重 $\alpha_t\cdot1+(1-\alpha_t)\rho$（这里长度已归一，故 $l$ 直接是权重）；代入 $\alpha_t$：$\frac{1/t-\rho}{1-\rho}+\rho\frac{1-1/t}{1-\rho}=\frac{1/t-\rho+\rho-\rho/t}{1-\rho}=\frac{(1/t)(1-\rho)}{1-\rho}=1/t$。分子分母的 $\rho$ 项精确相消，无近似。

### 15.3 (c) 假设、常数与指数的机械理由

- $\lambda>0$ 严格：第四步的缩放因子 $\sqrt{l/\lambda}$ 要除得开；若 $\lambda=0$（全对角路径）则端点无距离贡献、缩放无定义。$n=1$ 时也仍要 $\lambda>0$。
- $\mu\ge0$ 允许零：$\rho=0$ 时 $\alpha_t=1/t$，切点合法（只需 $0<1/n$），结论给出权重 $1/t$（"$\mu$-型"段贡献零）；这是"$t$ 段里只有一段真展开"的退化情形，机制不退化。$0\le\mu$ 来自权重是拷贝因子尺度平方之和，天然非负。
- $\rho<1/n$ 的强度：它要保证所有 $\alpha_t$ 都落在 $(0,1]$，最紧的是 $\alpha_n>0$；$n$ 越大要求越强，与 $1/t$ 中最小目标 $1/n$ 一致。若 $\rho\ge1/n$，$\alpha_n\le0$，切点出界，第六步的"之前/之后"分配无定义，总权重最小只能到 $\rho$（全用小权重段也达不到 $1/n$）。
- $1/t$ ，并非任意 $\theta$：下游 `05-paths.tex:316-323` 用 $t$ 个变量位置各贡献权重 $1/t$，总距离 $t\cdot(1/t)\|a_i-a_j\|^2=\|a_i-a_j\|^2$，精确回到原尺度。$1/t$ 是"$t$ 个相同拷贝因子拼成尺度 $1$"的唯一分配，写成 $1/n$ 会让距离变成 $(t/n)\|a_i-a_j\|^2$，只有 $t=n$ 时全等；而 $t$ 由染色后的 Hales-Jewett 线决定（`:294-296`），事先未知。
- "no commutation of factors is used"（`:101`）：$K$ 是非交换自由群，$K^s$ 的逐坐标乘积顺序敏感。若允许交换，不同 $t$ 的选择可能给出不同顺序的乘积，端点随之不同，"$w$ 对所有 $t$ 同一个"就断链。固定顺序是让 $n$ 条权重各异的方案共享一个端点的唯一办法。
- $n\ge1$：$n$ 就是 Hales-Jewett 长度（`:258-260` 选定），必须正。

### 15.4 (d) 候选失败路线

[推测] 路线一，只准备一个权重 $1/n$。`:294-296` 处 $t$ 由单色线决定，若 $t<n$ 则 $t\cdot(1/n)\ne1$，拷贝尺度错成 $\sqrt{t/n}$；这正是 `05-paths.tex:267-272` 讨论的 LRW 群表述困境（变量位数被预先规定）。

[推测] 路线二，用交换 $K^s$ 的因子来对齐端点。自由群没有交换律，商掉换位子会毁掉端点的信息（对角因子与拷贝因子的乘积次序正是距离的来源）；一旦取阿贝尔化，`:118-119` 的等长串距离公式失去逐位对应。

[推测] 路线三，把缩放自同构换成一般线性映射。$\mathcal E$ 上的非相似线性映射会破坏拷贝因子条件"$\|b_i-b_j\|^2=u\|a_i-a_j\|^2$"（距离被各向异性拉伸），新点列不再是 $A$ 的拷贝；用正交变换则尺度不变，权重仍为 $u$，得不到 $l/\lambda$ 的缩放。标量相似是唯一同时保形状与调尺度的选择。

## 十六、深拆五：pairs:rational 的有理化段（`04-pairs.tex:233-248`）

### 16.1 (a) 逐字引用

引理陈述 `04-pairs.tex:151-173` 的关键句：

> "Suppose that a finitely supported function $\nu:\Gamma\to\Q$ has zero pushforward on each $\Gamma/\Lambda_i$, and satisfies $\sum_\gamma\nu(\gamma)=0$, $\sum_\gamma\nu(\gamma)\gamma=0$, $\sum_\gamma\nu(\gamma)\gamma\gamma^{\mathsf T}=C$. ... For every $\eta>0$, there are an integer $n\geq1$, a finitely supported $\mu:\Gamma\to\Q$, and $\zeta\in\Q_{>0}$ such that $\mu$ has zero pushforward on each $\Gamma/\Lambda_i$ and $\sum_\lambda\mu(\lambda)\frac{\lambda}{n}\frac{\lambda^{\mathsf T}}{n}=\zeta C$（label `pairs:exact-moment`，`:166-168$）与 $\sum_\lambda\mu(\lambda)_-\|U\frac{\lambda}{n}\|^2<\eta\zeta$（label `pairs:small-negative`，`:169-171`）。"

本轮拆末尾的有理化论证 `:233-248`：

> "It remains to obtain rational coefficients. Let $E\subset\Gamma$ be a finite set supporting $d_n$. For functions $d$ supported in $E$, the maps $d\longmapsto\nu*d$, $d\longmapsto\zeta=n^{-2}\sum_\lambda d(\lambda)$ are linear, and the function $d\longmapsto\sum_{\lambda\in\supp\nu+E}(\nu*d)(\lambda)_-\|U\lambda/n\|^2$ is continuous on $\R^E$. The two strict inequalities $\zeta>0$ and \eqref{pairs:small-negative} consequently persist in an open neighborhood of $d_n$. Choose a rational vector $d$ in that neighborhood and extend it by zero outside $E$. Put $\mu=\nu*d$. Both $\mu$ and $\zeta$ are rational. Convolution still gives zero quotient pushforwards, and \eqref{pairs:convolution-moments} still gives the exact second moment \eqref{pairs:exact-moment}. This proves the lemma."

### 16.2 (b) 中间步骤

第一步，参数空间。$E$ 固定为 $d_n$ 的支撑（有限），$\R^E$ 即以 $E$ 为支撑的实值函数全体，带欧氏拓扑（有限维，一切 Hausdorff 拓扑等价）。$n$ 已在 `:230-231` 固定，故 $d_n\in\R^E$ 是该空间里一个确定的点。

第二步，线性映射。$(\nu*d)(\lambda)=\sum_\gamma\nu(\gamma)d(\lambda-\gamma)$（`:180-181` 的定义）对 $d$ 线性：固定 $\lambda$，它是 $d$ 在有限个偏移点上的值的有限线性组合，系数 $\nu(\gamma)$ 与 $d$ 无关。$\zeta=n^{-2}\sum_\lambda d(\lambda)$ 显然线性。线性在这里的作用是"连续性免费"（有限维线性映射自动连续），并且保证有理输入给有理输出。

第三步，连续泛函。$(\nu*d)(\lambda)_-$：先取线性泛函 $d\mapsto(\nu*d)(\lambda)$，再复合 $r\mapsto r_-=\max(-r,0)$（1-Lipschitz，`:141-142` 已用过同一事实），有限和 $\sum_{\lambda\in\supp\nu+E}$ 与常数权重 $\|U\lambda/n\|^2$ 保持连续性。支撑写成 $\supp\nu+E$：$\nu*d$ 的支撑含于 $\supp\nu+\supp d$，$d$ 支撑在 $E$，故求和实际只跑有限个点，这是"$\R^E$ 上连续"的具体理由。

第四步，开邻域。$\zeta(d)>0$ 与 `pairs:small-negative` 都是严格不等式，左边两个量分别是 $d$ 的连续函数与连续函数之差，故各自确定一个开集，交仍开，且含 $d_n$（`:230-231` 选 $n$ 时已验证两条严格不等式对 $(\mu_n,\zeta_n)$ 成立）。

第五步，取有理点。$\Q^E$ 在 $\R^E$ 稠密 ⟹ 该开集含点 $d$ 使 $d(e)\in\Q$ 对每个 $e\in E$。在 $E$ 外零延拓，$d$ 成为有限支撑有理函数。

第六步，逐性质复查。$\mu=\nu*d$：系数有理（有理卷积有理）。$\zeta=n^{-2}\sum d(\lambda)$ 有理且 $>0$（邻域条件）。`pairs:exact-moment`：由 `pairs:convolution-moments`（`:187-192`），$\sum(\nu*d)\lambda\lambda^{\mathsf T}=(\sum_\beta d(\beta))C$，而 $\zeta=n^{-2}\sum_\lambda d(\lambda)$，配上缩放 $\lambda/n$ 的二阶矩即 $n^{-2}\cdot n^{2}\cdot(\sum d)C/n^0$ 的核算（`:178` 的 $n^{2-k}$ 已把 $n^{-k}$ 与 $\sum d\approx n^k\int b$ 吸收，`pairs:exact-moment` 因此精确成立）。零推前：`:183-184` 的论证"$d\mapsto\nu*d$ 与陪集推前交换"只用卷积定义与 $\sum\nu=0$，对任意 $d$ 成立，有理 $d$ 同样成立。`pairs:small-negative`：邻域保持。

第七步，为什么不能只对 $\mu_n$ 整体乘一个大整数。乘整数保持有理为整，但 $\zeta$ 也同倍放大，$\eta\zeta$ 右端同倍放大，比例不变（看似可行）。真正的障碍在下游 `04-pairs.tex:8` 的 pairs:two-scale：列表长度取 $M\mu_\pm$（$M$ 是分母公倍数），若把 $\mu_n$ 先换成整数值就丢失"$M\mu$ 为正负两列表的重数"的可行性吗？不丢失。区别在别处：$\mu_n$ 本身是实数（含 $b$ 的实值），乘整数仍是实数，无法变成整数重数。所以"取有理 $d$"这一步不可用整倍化替代；它把实数权重换成有理权重，$M$ 的存在性因此成立。

### 16.3 (c) 假设、常数与指数的机械理由

- 为何必须两条不等式都严格：开邻域论证依赖严格性。`:230-231` 特意选 $n$ 使两条都严格（$\zeta_n>0$、`pairs:small-negative` 严格），若 $\zeta=0$ 或不等式取等，有理逼近可能把它推出可行域，$\mu$ 失去正质量或负部失控。$n^{-1}$ 型误差（`:216-221`）给足余量，严格性可保证。
- 为何 $E$ 必须在扰动之前固定：若允许 $d$ 的支撑随扰动变化，$\R^E$ 就不是固定的有限维空间，连续性无处安放，$\Q^E$ 的稠密性也不适用。`:233` 的"Let $E\subset\Gamma$ be a finite set supporting $d_n$"就是这一固定。
- 为何线性与连续要分开写：线性给"有理输入 ⟹ 有理输出"，连续给"严格不等式可开邻域保持"。二者合起来才是稠密有理点可用的完整理由，缺一半都不成立（只连续不能保证取到有理；只线性不保证不等式稳定，虽然有限维线性自动连续，论文仍逐项列出以便下游核查）。
- $n$ 固定后再有理化的次序理由：$\zeta_n$ 与 `pairs:small-negative` 都依赖 $n$，$n$ 一变整条估计重算；先固定 $n$ 再在 $\R^E$ 里扰动，是唯一使参数空间有界的次序。
- $\supp\nu+E$ 的加法记法：卷积支撑的标准包含式，写清求和有限，避免读者以为要跑整个 $\Gamma$（无限求和的连续性不显然）。

### 16.4 (d) 候选失败路线

[推测] 路线一，跳过有理化，直接把实值 $\mu_n$ 送进 pairs:two-scale。那里的正负列表要按 $M\mu_\pm$ 份重复仿射函数，实重数无法实现为有限列表；即便允许"以概率 $\mu(\lambda)$ 抽样"，实现出的拷贝是随机的，而染色是任意函数，没有概率空间可依托（`01-introduction.tex:139-141` 的"arbitrary colorings provide no continuity"在此同样致命）。

[推测] 路线二，用有理逼近直接贴 $\mu_n$ 而不走开邻域。逐条目逼近 $\mu_n$ 会使零推前条件（$\Lambda_i$-陪集和为零，是精确线性方程组）被破坏；陪集零推前是等式，不是不等式，逼近只能在满足等式的仿射子空间内进行，而该子空间与"扰动 $d$"的参数化恰好重合（卷积自动保持），这正是论文绕道扰动 $d$ 的原因。绕开它就等于要在有理数里解一个精确线性系统，自由度未必够。

[推测] 路线三，把 $\zeta$ 也当成设计变量、要求 $\zeta$ 精确等于某个预定值。此时 $\{\zeta=\zeta_0\}$ 是 $\R^E$ 中的闭超平面，与开集交可能为空；引理只需要 $\zeta>0$，把 $\zeta$ 留成自由正标量正是为了让开邻域有厚度。

## 十七、我走过的错路（第二批）

本节只记本轮重读时新撞上的弯路，前十节写过的不复述。每条给出论文里的反证位置或该路线必然失效的具体理由。

一，我以为判据应当直接写成 $\mathscr B=\R\otimes_\Q\R$ 上的矩阵条件，"反正 $B\subset\mathscr B$"。论文的 `02-tensors.tex:63-64` 明确说明 converse 的全部工作就是"For the converse, we show that extending the coefficient ring from $B$ to $\mathscr B$ introduces no new solutions"，即扩环方向需要一个定理，它天生不显然。反证文本还有 `02-tensors.tex:98-101`："The individual matrices $C^{\lambda\mu}$ need not be symmetric; the descent took place in the full space $\operatorname{Mat}_d(F)$"，说明在 $\mathscr B$ 上取到的解降回 $B$ 后连对称性都要重新补。我把这一层当成"技术细节"跳过了，结果第十二节的 $F$-可判定性（`02-tensors.tex:111-114`）无处安放：$\mathscr B$ 上的 kernel 没有有限生成元保证。

二，我一度想用"先用连续近似造出误差很小的拷贝、再靠紧性取极限"来完成充分性。`01-introduction.tex:139-141` 把这条路正面堵死："For sufficiency, the difficulty is to convert the tensor cancellations into a congruent copy at scale one: arbitrary colorings provide no continuity with which to absorb approximation errors." 取极限需要某个紧空间上的连续量，而染色是任意函数，$\{1,\dots,r\}^{\mathcal E}$ 上的乘积拓扑只给存在性层面的紧性（`05-paths.tex:55`），不能给"距离随近似参数连续变化"；误差在拷贝条件 $D_C$ 型二阶矩上是加法性的，没有可吸收它的拓扑。

三，我曾打算让判据对"给定实坐标的数值近似"输出结论，把 $F$ 当成某有限精度有理域。`01-introduction.tex:92-94` 是直接反驳："It uses exact relations in the coordinate field. It is not a procedure for recovering those relations from numerical approximations to arbitrary real coordinates."，`02-tensors.tex:114-115` 再重申一次"This description uses exact coordinate-field relations; it makes no claim to recover those relations from numerical real inputs."。理由层面：判据的成立与否取决于 $B$ 中某 ideal 是否含特定元素，实数逼近无法改变 $\Q$-线性关系的存在性，而数值输入根本不给 $\Q$-线性关系。

四，我按 Pálvölgyi 附录的"泛型七点圆不 Ramsey"直接给圆上一般位置配置判负。论文 `01-introduction.tex:44-49` 处理该文献时特意标注附录主张"states that generic seven-point circle configurations are not Ramsey"且脚注（`:47-49`）记录"attributes the writing, proofs, and ideas in that manuscript to ChatGPT...labels the additional appendix claims as unchecked by him"。更重要的是 `01-introduction.tex:119-124` 只把九点反例作为"我们的行列式计算如何直接使用判据"的示例，并未依赖外部泛型主张。把它当既成事实引用，等于把未检查的来源塞进自己的依赖链。

五，我在 §6.3 的组装里默认 Hales-Jewett 线的变量位数可以事先规定，从而只需要准备一个权重。`05-paths.tex:267-272` 逐字说明了这条路线的来源与限制："In the group formulation of Leader, Russell and Walters \cite[Conjecture~C and the following discussion]{lrw-transitive}, the number of varying positions is prescribed before coloring; without that restriction, ordinary Hales--Jewett applies. Here we allow the line to choose that number and prepare all the required path weights in advance."。必然失效的理由：`:258-262` 表明 $n$ 由 $r$ 与 $s$ 决定而 $t$ 由染色后的单色线决定，$t$ 是 $[1,n]$ 中未知值，必须把 $1,1/2,\dots,1/n$ 全备齐（`05-paths.tex:273-275` 是 synchronization 的调用点）。

六，我以为 $q$ 可以取零，从而省掉 §5–§6 的全部路径机制。`04-pairs.tex:45`（$\eta>0$ 任意但固定）与 `04-pairs.tex:230-231`（需"fix a sufficiently large $n$"）给出反证：把 $\eta\to0$ 需同时令 $n\to\infty$，列表长度与支撑随之爆炸，pairs:two-scale 的输出是有限列表，取不到极限对象。真正让 $q$ 严格为正的是 $UCU^{\mathsf T}=I_d$（`04-pairs.tex:44-45`）：负部二阶矩若为零，$U$ 的像上就没有梯度信息，$d\ge1$ 时不可能。

七，我曾以为 `05-paths.tex:306-308` 那句"The identity of the corner group is $p$; if an empty group product occurs, it is retained as this common factor"是可有可无的补充。拆到实现引理（`05-paths.tex:213` 起）才看清它的必要性：列结构必须逐行对齐，空乘积若不保留为公共因子，列数在行之间产生错位，`paths:realization` 的前提直接不成立。这一条属于"读太快而漏掉的簿记"，而这类簿记正是形式化时最容易掉的地方。

## 十八、逐字台账：判据与构造机器

本轮实测的符号、数值与出处。位置栏为"分片名:行号"，分片在 `build/sections/` 下；最后一行的位置是 `lean/ComparatorChallenges/EuclideanRamsey.json`。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $s\ge2$ | 点数下界 2 | 01-introduction.tex:59 | 02-tensors.tex:6-8 的全程约定；07-consequences.tex:8 | 下界失效则第一族 $s$ 条方程空转，单点集由 01-introduction.tex:56 另行处理 |
| $d\ge1$ | 仿射维数下界 1 | 01-introduction.tex:56 | 04-pairs.tex:44 的 $U$ 满秩；05-paths.tex:73 的 $K^s$ | $d=0$ 时空间块不存在，eq:field-spatial 空真，任意 $P$ 都通过判据 |
| 仿射张成 $\R^d$ | 坐标行满秩 | 01-introduction.tex:57-58 | 02-tensors.tex:6-8；06-groups.tex:39 的拷贝扩张 | 张成不满则 $I_d$ 的归一化目标落不到该子空间上 |
| $p_i$ | 长度 $d+1$ 的齐次列 | 01-introduction.tex:61 | eq:field-evaluations（01-introduction.tex:80）；02-tensors.tex:46-48 | 缺常坐标则球面方程的 $c$ 无载体 |
| $F$ | 由至多 $sd$ 个坐标生成 | 01-introduction.tex:62 | 02-tensors.tex:106-107 的 $F_0$ 与 $\operatorname{Frac}$；02-tensors.tex:90-92 | 生成元无限则 02-tensors.tex:110 的 Noether 性断 |
| $B=F\otimes_{\Q}F$ | 张量环 | 01-introduction.tex:63 | 01-introduction.tex:78 的 $P$；02-tensors.tex:39-41 的 $\mathscr B$ | 底环换成 $\R$ 则 $\R\otimes_{\R}\R\cong\R$，乘前等于乘后 |
| $m_F$ | 乘法同态，未必单射 | 01-introduction.tex:65-68 与 01-introduction.tex:69-70 | eq:field-spatial；07-consequences.tex:8 | 当成单射则判据塌成球面性，与 07-consequences.tex:153 的九点反例冲突 |
| 指标 $0,\dots,d$ | 指标 0 是常坐标 | 01-introduction.tex:71-72 | 02-tensors.tex:43-48 的数组分解；01-introduction.tex:82 的范围 | 指标错侧则空间块与常数行列混叠，$I_d$ 落在错位置 |
| $P$ | $(d+1)^2$ 个 $B$-未知量 | 01-introduction.tex:78 | 02-tensors.tex:42-43；03-stencil.tex:19-21 的 $C$ | 尺寸降为 $d\times d$ 则齐次化整体失效 |
| eq:field-evaluations | $s$ 条 $B$-值方程 | 01-introduction.tex:80-81 | 02-tensors.tex:27 的 $(e_i\otimes e_i)T=0$；03-stencil.tex:12 | 少一条点的相消则 04-pairs.tex:8 的坐标多重集配不上对 |
| $\delta_{\alpha\beta}$ | $d^2$ 条 Kronecker 条件 | 01-introduction.tex:82-83 | 02-tensors.tex:28 的 $G(T)=I_d$；03-stencil.tex:30 | 弱化为非退化则 04-pairs.tex:63-66 的正定性论证断 |
| 常数行列无约束 | 附加条件 0 条 | 01-introduction.tex:86-87 | 07-consequences.tex:8 的球面参数 $\ell,c$ | 加约束则球心与半径被钉死，cons:spherical 的自由度消失 |
| $W$ 的 $\Q$-结构 | $\dim_{\Q}W$ 无穷 | 02-tensors.tex:10-11 | 02-tensors.tex:16-18 的 $\mathcal T(W)$；03-stencil.tex:9-10 | 改 $\R$-结构则张量层退化为一层 |
| $e_i(v,u)=v+a_i\cdot u$ | 求值泛函 | 02-tensors.tex:12-15 | 02-tensors.tex:27；03-stencil.tex:35 的 $\Lambda_i$ | 定义改动则 04-pairs.tex:164 的陪集零推前失去含义 |
| $\mathcal T(W)$ | flip 不变子空间 | 02-tensors.tex:16-18 | 02-tensors.tex:23 的 $G$ 定义域；02-tensors.tex:58 的对称化 | 去掉 flip 则 $\tfrac12(Q+Q^{*})$ 无处作用，第三节的方向一失效 |
| $G(w\otimes w)=uu^{\mathsf T}$ | 梯度 Gram 映射 | 02-tensors.tex:19-24 | 02-tensors.tex:28；03-stencil.tex:26-30 | 改成 $\det$ 非零条件则 04-pairs.tex:71 的 $S$ 构造失效 |
| $E_i(Q)$ | $B$-线性求值 | 02-tensors.tex:44-49 | 02-tensors.tex:81-83 的逐对相消；12.2 第四步 | 系数越出 $B$ 则直和分解不能给出逐对为零 |
| $(r_\lambda)_{\lambda\in\Lambda}$ | $F$-基；解只用有限集 $J$ | 02-tensors.tex:64-71 与 02-tensors.tex:77 | 02-tensors.tex:82-89 的降环 | 若 $J$ 无限则有限线性系统不存在，行化简无从下手 |
| row reduction over $F$ | 相容性由 $\R$ 降到 $F$ | 02-tensors.tex:90-93 | 02-tensors.tex:94-98 的 $P$ | 在 $\mathscr B$ 上消元则遇零因子，非单位不可逆 |
| $B$ 的局部化表述 | 乘集 $\{\,1\otimes f:0\ne f\in F_0\,\}$ | 02-tensors.tex:108-110 | 02-tensors.tex:111-112 的 kernel 有限生成 | 直接用 $F_0\otimes_{\Q}F_0$ 则分式标量 $c\in F$ 提不进 $B$ |
| $c\otimes1$ 提升 | $F$-标量注入 $B$ | 02-tensors.tex:113-114 | 12.2 第五步的 $F$-span 表述 | 取 $1\otimes c$ 一侧则像变右模，$I_d$ 的检验落到转置侧 |
| $H(v,u)=(v-t\cdot Qu,Qu)$ | 共轭传输映射 | 02-tensors.tex:120-127 | 02-tensors.tex:129-132 的代表无关性 | 漏掉平移项 $t$ 则 $e_i'\circ H=e_i$ 不成立 |
| $\epsilon\tr(UU^{\mathsf T})<\eta/8$ | 预算第一份 | 04-pairs.tex:67-68 | 04-pairs.tex:86-88 的 pairs:small-covariance | 放宽到 $\eta/4$ 则 04-pairs.tex:144-146 的合计越过 $\eta\int b$ |
| $S=\epsilon P_H+LP_V$ | 双标量正定核 | 04-pairs.tex:70-73 | 04-pairs.tex:89-90 的凸组合 | 取 $\epsilon I$ 则 $S+tC$ 在 $\ker U$ 方向失正定 |
| $D_Cb_*=\phi_{S+C}-\phi_S$ | Gaussian 路径积分差 | 04-pairs.tex:116 | 04-pairs.tex:118-124 的 pairs:gaussian-bound | 线段某处退化则密度不归一，微积分基本定理前提断 |
| $\int b_R>1/2$ | 截断后的质量下界 | 04-pairs.tex:143 | 04-pairs.tex:146 的 $\eta/4<\eta\int b_R$ | 该下界退到 $0$ 则末式的严格性消失 |
| $d_n(\lambda)=n^{2-k}b(\lambda/n)$ | 指数 $2-k$ | 04-pairs.tex:178 | 04-pairs.tex:198-199 的 $\zeta_n$ | 改成 $n^{-k}$ 则二阶矩缩放差一个因子 $n^{2}$ |
| $\zeta_n\to\int b$ | Riemann 和收敛 | 04-pairs.tex:198-202 | 04-pairs.tex:230-231 选 $n$ | $\int b=0$ 则 $\zeta>0$ 无来源（引理只要求正） |
| $n^{k}\mu_n=D_Cb+O(n^{-1})$ | 一致 Taylor 误差 | 04-pairs.tex:206-210 | 04-pairs.tex:216-222 的负部收敛 | 误差降为 $O(1)$ 则极限不等式不可控 |
| $O(n^{k})$ 个格点 | 固定球内点数增长 | 04-pairs.tex:215 | 04-pairs.tex:216-222 同一段 | 支撑随 $n$ 扩张则误差被格点数吃掉 |
| $\rho<1/n$ | 权重比阈值 | 05-paths.tex:72 | 05-paths.tex:79 的 $\alpha_n>0$ | 取等号则切点出界，15.2 第二步的分区不存在 |
| $\alpha_t+\rho(1-\alpha_t)=1/t$ | 精确相消（无余项） | 05-paths.tex:96-99 | 05-paths.tex:273-275 的调用点 | 变成近似则 05-paths.tex:321-323 的原尺度闭合断 |
| $\lVert\Phi(z)-\Phi(z')\rVert^{2}=\sum_{j}\lVert z_j-z_j'\rVert^{2}$ | 正交块的距离可加 | 05-paths.tex:114-120 | 05-paths.tex:318-323 的距离核算 | 块不正交则交叉项出现，距离不再等于权重和 |
| $t\cdot(1/t)=1$ | 原尺度闭合 | 05-paths.tex:321-323 | 05-paths.tex:326-328 交给 compactness | 事先规定 $t$ 则见十七节第五条 |
| permitted axioms | 3 条：propext、Quot.sound、Classical.choice | EuclideanRamsey.json:8-12 | 该篇 46 个模块的全部证明 | 引入额外公理则与队列登记规格冲突 |

### 18.1 依赖链与断点定位

判据侧链条：$A$（01-introduction.tex:57-58，含 $s\ge2$ 与仿射张成两件前提）$\Rightarrow$ $p_i,F,B,m_F$（01-introduction.tex:60-68）$\Rightarrow$ 未知数 $P\in\operatorname{Mat}_{d+1}(B)$（01-introduction.tex:78）$\Rightarrow$ 两族条件（01-introduction.tex:80-81 与 01-introduction.tex:82-83）$\Rightarrow$ §2 的张量改写 $T\in\mathcal T(W)$（02-tensors.tex:26-29）$\Rightarrow$ 降环（02-tensors.tex:64-98）$\Rightarrow$ $C,U,w(\lambda)$（03-stencil.tex:15-31）。构造侧链条：$\Lambda_i,V_i$（03-stencil.tex:33-39）$\Rightarrow$ $\nu$（03-stencil.tex:48-66）$\Rightarrow$ $b$（04-pairs.tex:42-53）$\Rightarrow$ $(n,\mu,\zeta)$（04-pairs.tex:151-173）$\Rightarrow$ 双尺度对（04-pairs.tex:8-21）$\Rightarrow$ 等端点路径对（06-groups.tex:295）$\Rightarrow$ synchronization（05-paths.tex:69-74）$\Rightarrow$ $\psi$ 与字染色（05-paths.tex:280-292）$\Rightarrow$ Hales-Jewett（05-paths.tex:256-265）$\Rightarrow$ realization（05-paths.tex:213）$\Rightarrow$ compactness（05-paths.tex:47-51）$\Rightarrow$ Ramsey。

断点按环节给出。断在 $m_F$ 的单射化（01-introduction.tex:69-70）：判据塌成 01-introduction.tex:98-102 的球面方程，正面结论被 07-consequences.tex:153 的九点反例否证，全链停止。断在 $\delta_{\alpha\beta}$（01-introduction.tex:82-83）：03-stencil.tex:30 的 $UCU^{\mathsf T}=I_d$ 失去，04-pairs.tex:63-66 的 $C$ 在 $H$ 上正定不再成立，于是 04-pairs.tex:67-73 的 $\epsilon,L$ 无法同时满足两个要求，构造侧从第一环就断。断在降环（02-tensors.tex:90-93）：$P$ 只能定义在 $\mathscr B$ 上，$B$-值判据的 $F$-可判定性（02-tensors.tex:111-114）不存在，定理失去"充要"的可验证性。断在 $\nu$ 的矩条件（03-stencil.tex:63-66）：04-pairs.tex:187-192 的卷积矩恒等式右边变成 $(\sum d)\cdot 0$，04-pairs.tex:166-168 的精确二阶矩失去。断在 $\rho<1/n$（05-paths.tex:72）：05-paths.tex:273-275 拿不到覆盖全部 $t$ 的权重集，05-paths.tex:321-323 的 $t\cdot(1/t)$ 闭合失败，原尺度拷贝无从谈起。断在 compactness（05-paths.tex:47-51）：$\mathcal E$ 中的拷贝落到 05-paths.tex:326-328 的交棒处，Ramsey 定义要求的有限 $D$ 得不到，前面全部工作只给出无穷维结论。

## 十九、记号与核算补记

### 19.1 两处核算的重写

十四节 14.2 与十六节 16.2 有两处我写得含混，此处按原样另述（前文不动，避免改动已落盘的段落）。

第一处，16.2 第六步关于 $\zeta$ 与缩放二阶矩的关系。设 $d$ 支撑在有限集 $E$，$\zeta=n^{-2}\sum_{\lambda}d(\lambda)$。取 $d=d_n$ 时由 `04-pairs.tex:178` 有 $\sum_{\lambda}d_n(\lambda)=n^{2-k}\sum_{\lambda}b(\lambda/n)$，两乘 $n^{-2}$ 得 $\zeta_n=n^{-k}\sum_{\lambda}b(\lambda/n)$，与 `04-pairs.tex:198-199` 逐字一致，其极限为 $\int b$（`04-pairs.tex:202`）。二阶矩方面，由 `04-pairs.tex:187-192`，$\sum_{\lambda}(\nu*d)(\lambda)\lambda\lambda^{\mathsf T}=(\sum_{\beta}d(\beta))C$；两边乘 $n^{-2}$ 并把左侧写成 $\sum_{\lambda}\mu(\lambda)(\lambda/n)(\lambda/n)^{\mathsf T}$，右侧写成 $(n^{-2}\sum_{\beta}d(\beta))C=\zeta C$，即 `pairs:exact-moment`。整段推导对 $d$ 的形状无任何假设，只用 $\nu$ 的零阶与一阶矩为零（`04-pairs.tex:193-196` 的逐项相消）。

第二处，16.2 第七步关于"整倍化不能替代有理化"。$\mu_n$ 取值在 $\R$（`04-pairs.tex:206-210` 里它逼近 $D_Cb$ 的实值），乘一个大整数仍是实值函数。下游 `04-pairs.tex:8` 的 pairs:two-scale 要把 $\mu$ 的正部与负部写成两份有限列表的重数，重数必须是整数；这要求 $\mu$ 本身取值在 $\Q$（取分母公倍数后即整数），与 $\mu$ 的绝对大小无关。所以这一步的作用是把"实值"换成"有理值"，整倍化换不了这一点。

### 19.2 范数与绝对值写法

本轮追加的表格里，范数一律用 $\lVert\cdot\rVert$、绝对值用 $\lvert\cdot\rvert$、可除性用 $\mid$；单元内不出现裸的竖线字符。前文正文引用 tex 原文时保留了 tex 源里的 `\|` 写法（例如 14.1 与 14.2 引用的不等式），那是逐字引用的忠实形式，属于正文段落，表格单元不受其影响。涉及的三处逐字式子是：`04-pairs.tex:50-51` 的负部加权积分、`04-pairs.tex:120-124` 的 pairs:gaussian-bound、`05-paths.tex:117-119` 的 pairs:string-distance；它们的非竖线写法分别是 $\lVert Ux\rVert^{2}$、$\lVert Ux\rVert^{2}$、$\lVert\Phi(z)-\Phi(z')\rVert^{2}$，含义一致。

## 二十、Lean 取证补录

书目登记在 `lean/formalization.yaml:22`（title "A classification of finite Euclidean Ramsey configurations"，authors 为 OpenAI，`:24` 给出 `id` 指向该 preprint 目录下的 paper 条目，类型 article）。形式化登记在同文件后半：`lean/formalization.yaml:1150` 的 `comparator_config: ComparatorChallenges/EuclideanRamsey.json`、`:1151` 的 `declaration: OAI.EuclideanRamsey.classification`、`:1152` 的 `file: OAI/Combinatorics/EuclideanRamsey/Main.lean`。三件套里被点名的主声明名是 `OAI.EuclideanRamsey.classification`，与 §九 引用的 `classification_nonempty` 是同族的两个形态（前者是双向 iff，后者是其析取改写）。

`ComparatorChallenges/EuclideanRamsey.json` 全文 14 行，逐字要点：`:2` 的 `challenge_module` 为 `ComparatorChallenges.EuclideanRamsey`；`:3` 的 `solution_module` 为 `OAI.Combinatorics.EuclideanRamsey.Main`；`:4-6` 的 `theorem_names` 只列一条（即上述 classification）；`:7` 的 `definition_names` 为空数组；`:8-12` 的 `permitted_axioms` 恰三条：`propext`、`Quot.sound`、`Classical.choice`；`:13` 的 `enable_nanoda` 为 `false`。

三条许可公理对本篇不是装饰。第十三节的 Tychonoff 型紧性与 `02-tensors.tex:64` 的 $\R$ 的 $F$-基都需要选择；`Classical.choice` 覆盖这两处。`definition_names` 为空说明对照卷只把主定理当作被验对象，中间构造（bump、卷积、角群）不作为接口的一部分，这与 §九 记下的"Lean 的 bump 构造与论文不同"并不冲突：接口相同、内部实现自由。`enable_nanoda` 为 `false` 与本篇无算子代数内容一致。模块目录实测 46 个 `.lean` 文件、合计 8620 行（`wc -l` 实测），其中九点反例一族占 7 个文件（Circle 与 Nine 两个前缀），是论文 §7 未展开而形式化补足的部分。

## 廿一、追加部分的定位与行内勘误

本轮追加（第十一至第二十节）落在原第十节"终局"之前。原因是第一次追加时我选的锚点是第九节末尾那条"未形式化"清单，它位于终局节之前；本仓规格要求新节接在文件末尾，因此这是定位失误，编号顺序仍即阅读顺序：九之后读十一至二十，最后读十（终局）。已落盘的原有一至十节内容一字未动，我不去搬动它，只在此登记。

行内定界符勘误四处，均为把代码片段尾反引号误写成美元符，位置与应读作的内容如下（原文保留，不做删除）：

1. 第 390 行的 `` `:80$ `` 应读作 `` `:80` ``，指向 `04-pairs.tex:80` 的分块 $(1,1)$ 项 $A=C_{HH}+\epsilon I_H$。
2. 第 394 行的 `` `:230-231$ `` 应读作 `` `:230-231` ``，指向 `04-pairs.tex:230-231` 固定 $n$ 的那句。
3. 第 428 行的 `` `:85$ `` 应读作 `` `:85` ``，指向 `04-pairs.tex:85` 附近关于 $UP_V=0$ 的句子；同段的"It preserves diagonal factors"在 `04-pairs.tex:88` 之上、`:85-88` 区间内。
4. 第 459 行的 `` `:166-168$ `` 应读作 `` `:166-168` ``，即 `pairs:exact-moment` 的公式行号。

另外 16.2 第七步有一句写成了自问自答且夹带了多余引号，其准确表述已在 19.1 第二处给出：整倍化改变的是权重的绝对大小，改变不了权重取值在 $\R$ 这一事实，而 `04-pairs.tex:8` 的双尺度构造需要 $\Q$-值权重才能取分母公倍数化为整数重数。

台账一节的位置栏说明：36 行数据全部来自 `build/sections/` 下 01 至 07 七个分片的实测行号，另加 `lean/ComparatorChallenges/EuclideanRamsey.json:8-12` 一行；表中未使用竖线字符作绝对值或范数，凡涉范数写 $\lVert\cdot\rVert$、绝对值写 $\lvert\cdot\rvert$、可除性写 $\mid$。正文里对 tex 原文的逐字引用保留了源文件的 `\|` 写法，这一点在 19.2 已登记。

## 十、终局

### 10.1 与最初设想的差异

1. **我最初想推广 EGM-RSS 的"球面 ⟹ Ramsey"**，Pálvölgyi 七点反例宣判此路不通。转念：不找充分性的"好"几何条件，而找**充要**的代数刻划，把"球面"细分成"张量级球面"（乘前为零 vs 乘后为零），球的几何被判据的两个条件精确编码。
2. **我最初以为充分性要走"构造染色拷贝"的正面路线**，实际主引擎是"格点权函数的逐值相消"，一个纯代数的有限组合对象（有限列表），加上把 $q$ 残余用群论吸收的权重比机制。几何（距离）只在最后一步经 Gram 矩阵进入。
3. **超滤子我以为只是紧性工具**，实际角群的群结构（不只幂等元）是自由群同态的强制要求；且 Lean 在紧性处用了**第二个**超滤子，论文的 Tychonoff 路线与 Lean 的维数极限路线分叉。
4. **$s-2$ 的导出深度我最初想取 $s-1$**，换位子机消耗两个辅助坐标，$s$ 个坐标只能买 $s-2$ 层；深度取错则轨道平均的终点与 (6.3) 脱节。
5. **必要性方向我以为是"旧思想的搬运"**（EGM-RSS Lemma 15 的张量化），实际染色论证的奇整数细节（逐 $i$ 独立取模 2，不是 $K$ 进制标签）与 Lean 的 `ZMod` 整除式，都比预想精细。

### 10.2 常数备忘

$K=2s+1$、$r_0=K^s$（$2/K<1/s$ ⟹ 误差和 $<1$ vs 奇整数）；$UCU^{\mathsf T}=I_d$；$\mathfrak m^3$ 截断（二阶精度）；$\epsilon\tr(UU^{\mathsf T})<\eta/8$、$LP_V$、$\eta/8+\eta/8$；$d_n=n^{2-k}b(\lambda/n)$、$\zeta_n\to\int b$；$M$ = 分母 l.c.m.；$P=\eta I-B_-$、终缩放 $\div\sqrt{1+\eta}$、$q=\eta/(1+\eta)$；$\alpha_t=(1/t-\rho)/(1-\rho)$、$1/t$（$1\le t\le n$）；$N^{(s-2)}=L$、$c=\max_ic_i$；收缩比率 $((h-1)/h)^k$；$q<1/(2n)$、$\delta=1/(2sn)$、$q+s\delta<1/n$；九点 $\det=2^6=64$（Lean $8^6$）；$\beta=(1,1,-2)$、导子矩 $4I_2$、右端 $8$。

### 10.3 可信度审查

主定理双证书（论文 + Lean 28 层链）且两证路线实质不同 ⟹ 高可信；无循环引用（cons:spherical 不回流）。未形式化部分（kites/twelve/noetherian/congruence 传输）由论文文本支撑，其中 (7.4) 矩恒等式已逐步手工复核。两处易误读：染色是逐 $i$ 取模 2 不是 $K$ 进制；字染色是 $c\circ\Phi$ 经 $\psi$ 的超滤子极限不是 $c$ 本身。文献外部依赖（LRW Corollary 2、Pálvölgyi 定理及其未检查附录）已逐条标注。开放：圆上 6–8 点分界、判据可计算性、非 Ramsey 最小点数。

*（素材来源：E:\math\研究笔记\素材\欧氏Ramsey分类-素材.md；论文 TeX 七节；Lean 46 模块 8620 行；formalization.yaml 第 1150–1152 行；EuclideanRamsey.json。）*