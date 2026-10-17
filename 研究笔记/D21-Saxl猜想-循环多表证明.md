# D21 · Saxl 猜想的循环多表证明：把归纳载体做成一个显式生成子

> 对象：A Cyclic Polytabloid Proof of Saxl's Conjecture（2026-09-24）。
> 主定理（Saxl 猜想）：对每个 $m\ge1$ 与每个 $\lambda\vdash N_m$（$N_m=\frac{m(m+1)}2$），$g(\rho_m,\rho_m,\lambda)>0$，$\rho_m=(m,m-1,\dots,1)$，阶梯表示的张量平方包含 $S_{N_m}$ 的每个不可约表示。
> 实际证明的是更强的循环定理：$W_m=\mathbb C[S_{B_m}](v_{R_m}\otimes v_{C_m})$ 已含全部 $S^\lambda$。
> Lean：单条目 `OAI.Saxl.saxl_conjecture`，39 模块严格线性 import 链、约 7558 行，零新公理零 sorry；与论文有**五处实质证明路线差异**。

## 0. 我接手时的格局

Saxl 2012 年在 UCLA 组合讨论班上提出：阶梯分拆 $\rho_m$ 的不可约表示张量平方全覆盖。到我动手前，已知的是一堆"部分覆盖"：Ikenmeyer 处理支配序可比的 $\lambda$；Pak–Panova–Vallejo 处理 hook 与两行（充分大 $m$）；Bessenrodt 双钩、Li 三钩；Bessenrodt–Bowman–Sutton 用 2-模分解数覆盖全部奇次数表示；Harman–Ryba 证明了**张量立方**全覆盖；Luo–Sellke 证明渐近覆盖趋于 1。

这张清单教了我两件事。第一，所有逐类覆盖都在"支配序可比"或"高度受限"的框架里，它们没有一个能拼成全覆盖。第二，立方全覆盖与渐近覆盖是两块夹板：立方多用了张量因子，渐近不排除例外成分，**平方断言恰好卡在两者的空隙里**。所以我不该去"补类"，我需要一个对所有 $\lambda$ 同时工作的机制。

Brown–van Willigenburg–Zabrocki 的旧结果给了我最关键的暗示：$S^{(m,m-1)}\otimes S^{(m,m-1)}$ 是所有行数 $\le4$ 的 $S_{2m-1}$ 不可约的无重数直和。这说明"小带宽的带生成子"能做重活。我由此决定：不要追着 $\lambda$ 分类，是**造一个显式的生成子，让它的循环模自己装下一切**，归纳时追踪的是这个生成子，并非环境张量积的支撑。

## 1. 循环生成子的构造，与"更强结论"的哲学

把 $N_m$ 个张量位置放进三角形 $B_m=\{(i,j):i+j\le m+1\}$，$R_m,C_m$ 是行、列集合分划。在长度 $r$ 的块上用 $e_1,\dots,e_r$ 交错化（符号和），行块连乘得 $v_{R_m}$、列块连乘得 $v_{C_m}$，由 polytabloid 引理这两个都生成 $S^{\rho_m}$（$\rho_m$ 自共轭！）。核心对象：

$$W_m=\mathbb C[S_{B_m}](v_{R_m}\otimes v_{C_m}).$$

循环定理断言 $W_m$ 已含全部 $S^\lambda$；由 $W_m\subseteq S^{\rho_m}\otimes S^{\rho_m}$，Saxl 猜想随之。我特意在论文里写明："The proof establishes it inside one explicitly generated submodule of the tensor square, a stronger conclusion that retains the vector needed at each induction step."，**归纳假设必须是"生成子在"，并非"模在"**：每步切割带之后，小三角形的 $W_h$ 和带的 $U_{m,s}$ 都是具体的循环模，下一层假设恰好供给它们。这是整个方案对"归纳载体"的重新设计，也是"只需一份拷贝"（伴随论文万有平方定理的接口）的来源。

为什么锁死在阶梯：$\rho_m^t=\rho_m$ 使符号扭转 $S^{\rho_m}\otimes\operatorname{sgn}\cong S^{\rho_m^t}=S^{\rho_m}$ 可以在两个因子间自由搬运；行列两层形状互为转置使带切割的跨段符号成对抵消。[推测] 我最初试过矩形 $\square_{a\times b}$，自共轭性破坏，第一步符号平均就断了。

证明骨架五步：支配情形（起点）→ 扇区诱导 + 带商（切割）→ 宽 1 带平凡 → 宽 2 带的四行矩阵检测 → 水平扫除归约 + 强归纳组装。

## 2. 工具层：四个引理（specht-tools.tex）

### 2.1 交替块 = polytabloid

**Lemma 2.1**：$\theta_i=\#\{A\in L:|A|\ge i\}$（块大小 = $\theta$ 的列长），则 $\mathbb C[S_B]v_L\cong S^\theta$，对偶空间任取有序基亦然。

证明的字典是"块 = 列"：块按大小递减排成表 $t$ 的各列，$\theta_i$ 恰数长度 $\ge i$ 的块数。行 tabloid 经字映射（第 $i$ 行位置赋字母 $i$）实现为置换模 $M^\theta$；列子群 $C_t$ 的 polytabloid $e_t=\sum\operatorname{sgn}(c)c\{t\}$ 映到 $v_L$，列内置换下位置作用给 $\pi^{-1}$ 而 $\operatorname{sgn}(\pi^{-1})=\operatorname{sgn}(\pi)$，符号不翻转。非零性：行字在 $e_t$ 中系数为 1（$C_t$ 的非单位元必把某列元素移出该行）。

[推测] 失败路线：把块按**行**摆放，$v_L$ 生成 $S^{\theta^t}$，整个共轭链条错位（Lean 的 `stairRowTableau`/`staircaseSwap` 管理的正是这个对偶）；位置作用少了逆号，得 $S^\theta\otimes\operatorname{sgn}=S^{\theta^t}$，第 4 步失效；块大小超过字母数 $d$ 则 $v_A=0$，生成子整体消失（Lean `columnAlt_eq_zero_of_rows` 是这个现象的独立化身）。

### 2.2 共轭反转支配序

$\lambda\unrhd\mu\iff\mu^t\unrhd\lambda^t$。两条恒等式：$\sum_i\max(\lambda_i-q,0)=\max_k(\sum_{i\le k}\lambda_i-kq)$（固定 $k$ 的超额和当 $k$ 越过长行时被截断，最大值在长 $>q$ 的行数处取得），及 $\sum_{j\le q}\lambda^t_j=n-\sum_i\max(\lambda_i-q,0)$（$\min=\lambda-\max$）。前缀支配 ⟺ 超额和单调 ⟺ 共轭前缀单调。这是"$\tau=\lambda^t$ 这一步的全部依据"：$\rho_m\unrhd\lambda$ 经共轭变 $\lambda^t\unrhd\rho_m^t=\rho_m$，落进 Young 规则要求的支配方向。

[推测] 若对非自共轭形状套用，$V_R\otimes\epsilon\cong S^{\rho^t}\ne S^\rho$，$\operatorname{Hom}$ 维数计算崩塌，构造对自共轭的依赖在最底层。

### 2.3 Pieri 规则

LR 规则的一行特化：诱导的 $b$ 个添加字母全是 1，列严格性 ⟹ 水平带；lattice-word 自动满足。我没有直接引用这个同构，**我需要的是构造性的正方向**（给定水平带能造非零映射），其证明是显式的三复合 $F=\mathrm{pr}\circ T\circ\iota$：$T=$ 在被删带位置固定字母、其余位置求和的收缩；$\mathrm{pr}=$ 到 Specht 子模的等变正交投影；非零性由"只有单位元存活"的配对系数给出，水平带没有两盒同列 ⟹ 列群中固定所有被删位置的元素必为恒等。Lean 里这一步是 200 行的显式构造（`strip_contraction_pair`），LR 理论完全没进来。

### 2.4 Young 规则（支撑 + 对角重数）

$M^\theta=\operatorname{Ind}\,\mathbf1$；$S^\tau$ 出现 ⟺ $\tau\unrhd\theta$；$S^\theta$ 恰一次。重数 = 水平带链计数。必要性：每条带使第一列高度至多加一 ⟹ 链的前 $k$ 项至多 $k$ 行。重数一：等号压死前缀与行数，链唯一。

**充分性我必须构造性证明**（后面 dominated 与扫除归约都要在具体图上执行删带）：归纳于 $\ell$，令 $t=\theta_\ell$，从 $t$ 个**最高的**列（等高取最右）各删底盒得 $\nu$。关键的前缀损失公式：

$$\sum_{i\le k}\tau_i-\sum_{i\le k}\nu_i=\max(0,t-\tau_{k+1}).$$

推导：列高 $>k\iff$ 第 $k{+}1$ 行有盒子，故高为 $k$ 的列恰 $\tau_{k+1}$ 个；"取最高、等高取最右"保证删除优先发生在高列 ⟹ 恰 $\max(0,t-\tau_{k+1})$ 个被删盒落在前 $k$ 行。损失为零直接传递支配；损失为正且 $k<\ell$ 时 $\sum_{i\le k}\nu_i=\sum_{i\le k+1}\tau_i-t\ge\sum_{i\le k+1}\theta_i-t\ge\sum_{i\le k}\theta_i$（$t\le\theta_{k+1}$）。$k=\ell$ 的边界：支配给 $\operatorname{len}(\tau)\le\ell$、$\tau_\ell\le t$，高为 $\ell$ 的列全被选中，第 $\ell$ 行消失。[推测] 失败路线：删"最左列"会掏空中间列高破坏分拆性，"后缀减一"是弱减性封闭的唯一选择；漏掉 $k=\ell$ 边界则归纳断链。

## 3. 支配情形：十个步骤（Prop 2.5）

若 $\rho_m\unrhd\lambda$，则 $S^\lambda$ 出现在 $W_m$。这是整个证明的"起点模"，机制最重，我逐步记录。

**步 1（化归）**：由 Young 规则 + 共轭反转 + 符号恒等式 $(S^\lambda)^*\cong S^\lambda$、$S^\lambda\otimes\operatorname{sgn}\cong S^{\lambda^t}$，只需证 $W_m\otimes\epsilon$ 包含 $M^{\rho_m}$ 的每个成分。

**步 2（符号平均 = 重复行生成子）**：行子群 $H_R=\prod S_{R_{m,i}}$ 以 $\epsilon$ 作用于 $v_{R_m}$（行内交错向量的定义）。未规格化的符号对角平均**恰好**

$$\sum_{h\in H_R}\epsilon(h)\,hw_m=v_{R_m}\otimes u,\qquad u=\sum_{h\in H_R}hv_{C_m}.$$

第一因子被重新交错化（不变），第二因子被平均成 $u$。

**步 3（$u\ne0$）**：取"行号字" $e_{a_0}$（$a_0(i,j)=i$）。它被 $H_R$ 固定；在 $v_{C_m}$ 中系数为 1（每列递增 $i$ 排序时恰为恒等赋值）；故在 $u$ 中系数 $=|H_R|=\prod r!\ne0$。[推测] 选字是最容易错的地方：列号字系数为 0，平均后可能整体抵消，"行号字"是唯一同时被行群固定且在 $v_{C_m}$ 支撑中的字。

**步 4（交错线唯一）**：Frobenius 互反 + 符号扭转 + Young 规则重数一：

$$\dim\operatorname{Hom}_{H_R}(\epsilon,\operatorname{Res} V_R)=\dim\operatorname{Hom}_G(M^{\rho_m},V_R\otimes\epsilon)=1.$$

$v_{R_m}$ 非零且 $H_R$-交错，张满这条唯一的线，**任何 $H_R$-交错向量都是 $v_{R_m}$ 的倍数**。

**步 5（扭转搬进第二因子）**：结合律同构 $(x\otimes y)\otimes z\mapsto x\otimes(y\otimes z)$ 把扭转放哪都行；取 $\phi:V_C\otimes\epsilon\xrightarrow\sim V_R$（自共轭！），$u\otimes z$ 是 $H_R$-交错 ⟹ $\phi(u\otimes z)=c\,v_{R_m}$。结论：$W_m\otimes\epsilon$ 的像包含 $Z_m=\mathbb C[G](v_{R_m}\otimes v_{R_m})$。

**步 6（加法投影）**：逐位置 $q(e_a\otimes e_b)=f_{a+b-1}$（$E_{\rm out}$ 有 $2m-1$ 个字母），投影到内容 $\alpha=(1,2,\dots,m)$ 的字空间。输出表故意取 $2m-1$ 个字母：若只给 $m$ 个，$q$ 要截断、不再是"处处同一映射"，等变性成本暴涨。

**步 7（平方刚性）**：$v_{R_m}\otimes v_{R_m}$ 的每项在长 $r$ 行上两层赋值都是 $1..r$ 的排列，$c_j=a_j+b_j-1$ 满足

$$\sum_jc_j=r^2,\qquad\sum_jc_j^2-r^3=\sum_j(c_j-r)^2\ge0.$$

内容正确要求全三角形平方和 $=\sum r^3$；每行用不等式再求和迫使**每行取等**，即每格 $c_j=r$。唯一存活的字：$t_m=\bigotimes f_{m+1-i}$。机械解读：Cauchy–Schwarz 等号条件把"内容正确"强化为"逐格正确"。[推测] 若改用一次幂比较，等号只给行内平均 $r$，多个存活字、相消重现，平方（或任何严格凸函数）是必需的。

**步 8（系数无相消）**：长 $r$ 行上 $a_j=\pi(j)$ 的唯一配对是 $b_j=r+1-\pi(j)$，即 $b=\omega_r\pi$（$\omega_r$ 行反序）。两项符号之积 $\operatorname{sgn}(\pi)\operatorname{sgn}(\omega_r\pi)=\operatorname{sgn}(\omega_r)=(-1)^{\binom r2}$ **与 $\pi$ 无关**，所有 $r!$ 项同号相加：

$$Q(v_{R_m}\otimes v_{R_m})=\Bigl((-1)^{\sum\binom r2}\prod_{r=1}^m r!\Bigr)t_m\ne0.$$

**步 9（满到置换模）**：$t_m$ 的等字母集合恰是行 ⟹ 稳定子 $=H_R$、轨道是 $\mathcal M_\alpha$ 的基 ⟹ $Q(Z_m)=M^{\rho_m}$。

**步 10（收尾）**：一切 $\tau\unrhd\rho_m$ 的 $S^\tau$ 在商中；取 $\tau=\lambda^t$；扭回 $\epsilon$ 得 $S^\lambda\subseteq W_m$。

这一段的"巧合"我必须诚实标注：行和 $r^2$ 与内容平方和 $\sum r^3$ 严丝合缝，**是证明对阶梯形状的特殊依赖**，非阶梯没有这个刚性，整个支配情形塌掉。

## 4. 扇区诱导与带商：切割的引擎

### 4.1 坐标扇区诱导（Lemma 3.1，一般有限群陈述）

$G$ 传递作用于 $\Omega$、模有扇区分解 $T=\bigoplus_A T_A$、$z\in T_D$、$H=\mathrm{Stab}(D)$、$A_0=\mathbb C[H]z$，则 $\Phi:\mathbb C[G]\otimes_{\mathbb C[H]}A_0\to\mathbb C[G]z$ 是同构。关键是显式逆

$$\Psi(y)=\sum_{A\in\Omega}g_A\otimes g_A^{-1}\pi_A(y),$$

良定义靠张量平衡关系；$\mathbb C[G]z=\bigoplus g_AA_0$ 的直和性来自 $g_AA_0\subseteq T_A$（字基不相交）与 $A_0$ 对 $H$ 封闭。我特意把显式逆写进论文，后续商映射定义为"投影后接 $\Psi$"，逆的存在让"满射"变成"同构后限制"。

### 4.2 带商（Prop 3.2）

$s\in\{1,2\}$、$h=m-s$、$D=B_h$、$F=B_m\setminus D$、$|F|=s(2m-s+1)/2$（$s=1$ 时 $=m$，$s=2$ 时 $=2m-1$，正是扫除归约要移走的数，两种情形分别匹配）。带生成子 $u_{m,s}=v_{R_F}\otimes v_{C_F}$（两层字母表 $1..s$）。

**第一段：投影与高位置的唯一性。** 逐位置投影 $p_s$ 保留"两字母同高"的字对（都 $\le s$ 或都 $>s$），$P_s=p_s^{\otimes B_m}$。保留字的高位置集合 $A$ 受行列两层交错化的计数约束：行高计数 $r_i=\max(h+1-i,0)$、列高计数 $d_j=\max(h+1-j,0)$，且前缀恒等式

$$\sum_{i\le k}r_i=\#\{(i,j)\in B_h:i\le k\}=\sum_j\min(k,d_j)$$

成立，左端是 $B_h$ 前 $k$ 行格子数（$r_i$ 恰是 $B_h$ 第 $i$ 行长），右端是各列贡献上界之和。左 = 右 ⟹ **每列都取等**：列 $j$ 的全部 $d_j$ 个高位置都在前 $d_j$ 行。于是 $A=B_h=D$，高位置被组合唯一强制。这是 Ryser 型 margin 取等论证，是整个商构造的引擎：它同时保证 $P_s(w_m)\ne0$（行号字的平方保留）与扇区分解的前提。

**第二段：带符号的因子化。** 长 $r$ 的行/列块与 $D$ 交前段长 $a=\max(r-s,0)$、与 $F$ 交后段长 $b=\min(r,s)$；指定高集的块张量恰为 $(-1)^{ab}\,\operatorname{Alt}(e_{s+1},\dots,e_r)\otimes\operatorname{Alt}(e_1,\dots,e_b)$，高字母在位置序上先于低字母 ⟹ 恰 $ab$ 个跨段逆序，其余逆序被两段独立求和吸收。行与列的长度列表相同，跨段符号**成对抵消**：$\prod_r(-1)^{2ab}=1$，这是唯一用到"两层形状互为转置"的地方。按 $D,F$ 重排张量因子（无符号）得

$$z:=P_s(w_m)=\widetilde w_h\otimes u_{m,s}\ne0,\qquad A_0=\mathbb C[H]z=\widetilde W_h\boxtimes U_{m,s}.$$

**第三段：扇区与商。** $\Omega=\{A:|A|=|D|\}$，扇区 $T_A$ 是"恰在 $A$ 上高"的字坐标张成；$z\in T_D$、稳定子恰 $H$。Lemma 3.1 给 $\mathbb C[G]z\cong\operatorname{Ind}_H^G(W_h\boxtimes U_{m,s})$；$P_s$ 等变 ⟹ 限制到 $W_m$ 接 $\Psi$ 得满射

$$W_m\twoheadrightarrow\operatorname{Ind}_{S_D\times S_F}^{S_{B_m}}(W_h\boxtimes U_{m,s}).$$

论文里我写了一句明确的警告：**商映射的象不必落在原来的两个 Specht 因子里**，任何想把商改成子模包含的重构都会方向反转（商里出现的东西不必出现在子模里），归纳传递就断了。

$s\le2$ 的限制：$s\ge3$ 时带内块大小 $\le s$，而四行检测只覆盖 $\le4$ 行，且矩阵论证依赖 $\operatorname{Mat}_2$ 的 $\operatorname{adj}=\operatorname{tr} I-X$ 线性性，这是 $2\times2$ 特有。[推测] 若 $\operatorname{Mat}_k$ 有类似的"反交换线性基 + 伴随线性"结构则可推广，目前未知。

## 5. 宽 1 带与宽 2 带的路径机制

宽 1 带 = 对角线 $i+j=m+1$ 的 $m$ 个位置；每个行列块都是单点、两层字母表只有字母 1，$u_{m,1}$ 是被一切置换固定的常数字，$U_{m,1}\cong S^{(m)}$（平凡模）。配 Pieri 一步覆盖"第一行 $\ge m$"的 $\lambda$。

宽 2 带有 $K=2m-1$ 个位置，沿**蛇形路径**编号 $p_{2j-1}=(m+1-j,j)$、$p_{2j}=(m-j,j)$：行块 = 单点 $\{1\}$ 与相邻对 $(2,3),(4,5),\dots$；列块 = 相邻对 $(1,2),(3,4),\dots$ 与单点 $\{K\}$。列对反转递增方向给 $u=(-1)^{m-1}u_{m,2}$。蛇形编号的唯一目的：让行块与列块都成为**相邻对**，后文把检验表列放在连续段上全靠它。

### 5.1 路径收缩（Lemma 4.3）

配对 $V^*\cong\operatorname{Mat}_2(\mathbb C)$，$J=\begin{pmatrix}0&1\\-1&0\end{pmatrix}$：

$$\langle u,X_1\otimes\cdots\otimes X_K\rangle=(-1)^{m-1}\bigl[X_1\operatorname{adj}(X_2)X_3\cdots X_{K-2}\operatorname{adj}(X_{K-1})X_K\bigr]_{11}.$$

推导：端点单点钉死 $a_1=b_K=1$（单点块的字母表）；对块的系数是 $J_{ab}$；指数和从 $a_1$ 到 $b_K$ 逐次收缩给 $X_1JX_2^{\mathsf T}JX_3\cdots$，偶位置的转置记录"列指标先于行指标被收缩"；最后用 $\operatorname{Mat}_2$ 恒等式 $JX^{\mathsf T}J=-\operatorname{adj}(X)$，$m-1$ 个偶位置给 $(-1)^{m-1}$。

**为什么用 $\operatorname{adj}$ 不用逆**：配对是双线性（多项式）的，逆非线性且奇异矩阵无定义；$\operatorname{Mat}_2$ 中 $\operatorname{adj}$ **恰好线性**（$\operatorname{tr}(X)I-X$），这是"段矩阵是矩阵的交错**和**"能有意义的根本原因，也是整个 §4 依赖 $n=2$ 的硬约束。[推测] $3\times3$ 以上 $\operatorname{adj}$ 是 $n-1$ 次多项式，段无法合并进乘积。

### 5.2 段交错（Lemma 4.5）

取 $V^*$ 的基 $M_1=I,M_2=Z=\mathrm{diag}(1,-1),M_3=T=\begin{pmatrix}0&1\\1&0\end{pmatrix},M_4=J=ZT$。后三个无迹且两两反交换；$D_q$（奇位恒等、偶位取伴随）。段交错矩阵

$$A_{r,p}=\sum_{\pi\in S_r}\operatorname{sgn}(\pi)\,D_p(M_{\pi(1)})\cdots D_{p+r-1}(M_{\pi(r)})=r!(-1)^{e-\delta}M_1\cdots M_r,$$

全部可逆；表：$r=1,2,3,4$ 给 $\pm I,\pm2Z,\mp6J,\pm24I$（$r=3$ 两列同为 $-6J$，$e-\delta$ 同奇偶）。

证明的灵魂是三行论证：固定 $\pi$，$I$ 占槽 $j$；反交换矩阵重排到标准序的符号 + $I$ 挪槽的 $(-1)^{j-1}$（**$I$ 与一切交换，挪槽不改变乘积**）+ $\operatorname{adj}$ 在偶位翻转无迹矩阵（$\epsilon_j\equiv\delta+j-1$），总符号 $(-1)^{e-\delta}$ 与 $\pi$ 无关，$r!$ 项相同。

**选 $\{I,Z,T,J\}$ 的四条理由**：(i) 全可逆；(ii) 非单位元无迹（$\operatorname{adj}$ = 取负，$D_q$ 在基上只是乘 $\pm1$）；(iii) 两两反交换（交错符号整体提出）；(iv) 两两乘积仍落 $\pm$ 基元素，整条路径的乘积是单个基元素的倍数，端点元素是否为零变成查表。这是检验 $2\times2$ 多项式恒等式的标准代数基（Drensky–Giambruno）。[推测] 若基里有迹非零的元素，$D_q$ 把基元素打成基元素的**和**，封闭性丧失；若 $I$ 换成别的矩阵，挪槽论证断。

段长 $\le4$ 的上限不是公式失效，论证对任意 $r$ 成立！上限来自**表列长**：$\eta$ 至多 4 行 ⟹ 每列长 $\le4$；更深一层是 $V^*$ 恰 4 维，$r>4$ 时无足够的不同基元素可供交错，$t_N$ 定义失败。

### 5.3 四行检测（Prop 4.6）

对每个 $\operatorname{len}(\eta)\le4$ 的 $\eta\vdash2m-1$：把 $\eta$ 的表列（列长 $r_1,\dots,r_c\le4$）放在路径的连续段上，对偶张量 $t_N$（每段因子为 $\sum\operatorname{sgn}(\pi)N_{\pi(1)}\otimes\cdots$）是 polytabloid，$\mathcal T_N$ 是 $\eta$ 型不可约模。第一配对取 $N_i=M_i$：段独立求和 = 分配展开 ⟹ $\langle u,t_M\rangle=(-1)^{m-1}[B]_{11}$，$B=A_{r_1,s_1}\cdots A_{r_c,s_c}$ 可逆。

**共轭自由度是关键一步**：$\operatorname{adj}(QXQ^{-1})=Q\operatorname{adj}(X)Q^{-1}$ ⟹ $D_q$ 与共轭交换。取 $B$ 的特征向量 $v$（$\beta\ne0$）、$Q$ 把 $v$ 送到第一坐标、$N_i=QM_iQ^{-1}$，则乘积变 $QBQ^{-1}$、$(1,1)$ 端点 $=\beta\ne0$，**只有检验余向量变了，$u$ 与其端点字母不变**。于是配对在生成子上非零，检测映射 $\Phi(x)(t)=\langle x,t\rangle$ 非零，目标不可约 ⟹ 满 ⟹ $S^\eta\subseteq U_{m,2}$。

Example 4.7 是我放进论文的警示：$m=3$、$\eta=(2,2,1)$ 时 $B=(-6J)(2Z)=12T$、$[T]_{11}=0$，**不共轭就配对为零**！取 $Q=\begin{pmatrix}1&1\\1&2\end{pmatrix}$ 后 $QTQ^{-1}$ 的 $(1,1)=1$，配对 $12\ne0$。共轭步骤不可省。

检验基可以依赖 $\eta$（$Q$ 依赖 $B$ 依赖段划分），这是"对每个成分单独检测"，并非构造万有检验的策略。

## 6. 扫除归约与归纳组装

### 6.1 水平带归约（Lemma 5.1）

不被 $\rho_m$ 支配的 $\lambda$ 二选一：

**(i)** $\lambda_1\ge m$：删最右 $m$ 个非空列的底盒（右端后缀减一保分拆），得 $\nu\vdash N_{m-1}$、水平带大小 $m$，宽 1 带一步 Pieri 吃掉。注意与 Lemma 2.4 的差别：这里**不必保持支配**，"最右列"只要保分拆即可；而 2.4 里"取最高列"是为了支配传递。两处规则不同却形似，是移植时最容易出错的地方。[推测]

**(ii)** $\lambda_1\le m-1$：支配失败给 $k<m$ 使 $\sum_{i\le k}\lambda_i>km-\binom k2$（$\rho_m$ 前 $k$ 行和）。$k\le3$ 时 $\sum_{i\le k}\lambda_i\le k(m-1)\le km-\binom k2$（⟺ $k\le3$）矛盾，故 $4\le k<m$，**特别 $m\ge5$**。前四行容量：

$$\sum_{i\le4}\lambda_i\ge\frac4k\sum_{i\le k}\lambda_i>4m-2(k-1)\ge2m+4>2m-1$$

（第一步用"前 4 项均值 ≥ 前 $k$ 项均值"，$\lambda$ 递减；[推测] 误用"前 4 项均值 ≥ 全体均值"就错了）。**整扫** = 每个非空列删底盒一次，行长序列 $(\alpha_1,\alpha_2,\dots)\to(\alpha_2,\alpha_3,\dots)$，被删盒是水平带；四次整扫移走 $\lambda_1+\cdots+\lambda_4>2m-1$ 盒，故至多四次非空整扫 + 至多一次部分扫（最右列收尾，仍保分拆）恰好移走 $2m-1$ 盒，余 $\nu\vdash N_{m-2}$。

**锐性示例**：$m=13$、$\lambda=(8^{11},3)\vdash91$，支配在 $k=12$ 失败（$91>90$）；每条带至多 8 盒 ⟹ 三条带拿不下 $25=2m-1$；实际 $8+8+8+1=25$。$q\le4$ 是紧的。

### 6.2 主归纳

对 $m$ 强归纳。$\lambda\vdash N_m$：支配走 Prop 2.5；情形 (i) 宽 1 切割 + 归纳假设 + Pieri；情形 (ii) 宽 2 切割，把 $q\le4$ 条带的大小 $b_1,\dots,b_q$ 放到 $F$ 的互不相交子集上，迭代 Pieri + 诱导传递得 $\sum_\eta a_\eta c_{\nu,\eta}^\lambda>0$（$A=\operatorname{Ind}\,\mathbf1\cong\bigoplus(S^\eta)^{\oplus a_\eta}$）；每个 $A$ 的成分至多 $q$ 行（每条水平带至多引入一行新行），故存在 $\eta$ 使 $a_\eta>0$ 且 $c_{\nu,\eta}^\lambda>0$。$S^\eta\subseteq U_{m,2}$（四行检测）、$S^\nu\subseteq W_{m-2}$（归纳）、**各取一份拷贝**进 $\operatorname{Ind}(W_{m-2}\boxtimes U_{m,2})$，它是 $W_m$ 的商，半单性回到 $W_m$。

$m\le4$ 的边界核查：支配在 $m\le4$ 并不覆盖全部（如 $m=3$ 的 $(3,3)$ 走情形 (i)），但 (ii) 需要的 $m\ge5$ 从不被边界触发；[推测] 若把 (i) 判据 $\lambda_1\ge m$ 写成 $>$，$(3,3)$ 类会被错误推向 (ii) 而崩溃。

## 7. Lean 镜子：39 模块、五处路线差异

登记：`ComparatorChallenges/Saxl.json`、declaration `OAI.Saxl.saxl_conjecture`、文件 `OAI/RepresentationTheory/Saxl/Main.lean`；permitted axioms 恰为 propext/Quot.sound/Classical.choice；39 模块构成**严格线性 import 链**（每文件只 import 链上前一个），零 axiom 零 sorry。

Lean 的基础设施取向与论文截然不同：一切张量在**字坐标**里（`WordSpace n d := (Fin n → Fin d) → ℂ`，对偶化的系数函数），$S^\theta$ 直接定义为循环模（轨道 span），并非 James 商，Kronecker 系数定义为 finrank Hom 但**从不计算维数**，只需要"存在非零 intertwining map"（`kronecker_pos_iff`）。

五处实质路线差异（这是本篇形式化的最高取证价值，两条独立路线到达同一结论）：

1. **显式诱导逆 $\Psi$ ⟹ 群平均 + 半单提升**。Lean 不构造诱导模：`averagedMap`（任意映射的群平均自动等变）+ `sector_average_nonzero`（等变 + 投影保持象 + 杀死扇区外 ⟹ 平均非零）+ `cyclic_projection_support`（等变投影下成分可回提，用 Mathlib 的 `IsSemisimpleModule.lifting_property` = Maschke 的模论形式）。论文两处"semisimplicity ⟹ 成分回到 $W_m$"的机器化落点。
2. **Ryser margin 取等 ⟹ 签名和取等**。高位置唯一性（(3.4)/(3.5)）在 Lean 里是 `high_positions_rigidity`：保行置换 $g$、保列置换 $k$、两层高集合相同 ⟹ 高集合 $=\{i+j<h\}$，用签名权 $w(x)=2h-1-2i-2j$（$B_h$ 上正、外负）的 `finset_eq_of_signed_sum` 取等。同一抽象引理还支撑 `ferrers_rearrangement`（列单射重排的字支撑必为 Ferrers 图，论文完全没有的引理）与 `specht_shape_rigidity` 的 `mixed_moment_le`。**三个 margin 型论证在 Lean 共享一个签名和引理**，而论文里它们是三处独立的手算。
3. **依赖 $\eta$ 的共轭 $Q$ ⟹ 统一 $Q=\begin{pmatrix}1&1\\1&2\end{pmatrix}$**，恰是论文 Example 4.7 的矩阵！Lean 逐基元素验证 $(Q\,\mathrm{basis}_i\,Q^{-1})_{00}\ne0$（4 个 case 查表），把"对每个 $\eta$ 找 $Q$"（特征向量法）换成"统一的 $Q$ 对四种基元素都行"。命题形式仍是 ∃Q，但证明里 $Q$ 从不依赖段划分，**均匀版本，强于论文**。Lean 的 Example 4.7 由此失去形式化必要，但作者取这个矩阵暗示知道该例。
4. **LR 一行特化 ⟹ 显式收缩构造**；**(5.3) 的 $\sum a_\eta c_{\nu,\eta}^\lambda>0$ ⟹ 简单子模分离**。Lean 的 `strip_product_support` 里，带因子假设是"带循环模含每个 $\le k$ 行的 Specht 型"，用 `word_support_separates`（半单模的支撑 = 简单子模全覆盖）+ `specht_rows_of_hom`（**映射非零进 $d$ 字母表示的 Specht 至多 $d$ 行**，论文没有的引理）逐个简单子模命中。注意机制差异：论文数"新增行"（每条水平带至多加一行），Lean 数"颜色字母数 $k\le4$"，结论一致，前提不同，混合两种表述要小心。
5. **检测方向相反**。论文：带循环模 $\to\mathcal T_N^*$（配对非零 + 不可约 ⟹ 满）；Lean：$S^\eta\to$ 带循环模（`hom_to_cyclic_of_pair`），由配对对称性（bandWord 实值）与双模自对偶等价。

其他值得记录的 Lean-only 工作：**Specht 理论从零重建**（论文引 James Theorem 4.12；Lean 的 `specht_irreducible` 走"非零向量可检测 + columnAlt 秩一 + 循环保持"的路，附带 star-正定性的类型类搭桥）；`pair_sum_rigidity` 把论文步 7 的 $\sum(c_j-r)^2$ 特化一般化为抽象实变量论证（$r^2,r^3$ 数据消失）；`repeated_alt_projection` 的系数 $|H|\operatorname{sgn}(\omega)$ 与论文 $(-1)^{\sum\binom r2}\prod r!$ 数值逐项吻合；段表 8 个 `fin_cases` 暴力式与 `ScaledBasis` 代数式双路线并存；旋转对称性实现为 `rotateColumn = swap∘rotateRow∘swap`（"同一符号出现两次"替代论文的 $\prod(-1)^{2ab}=1$）；收缩公式走单元展开 + 归纳闭式（`chain_entries`），并非指标收缩 + 转置吸收。**Lean 缺失**：Kronecker 数值/LR 理论（从不需要）、锐性示例 $(8^{11},3)$（不证紧性）、历史叙述与插图。**Lean 额外**：`saxl_contains_every_irreducible`（任意不可约复表示单射入阶梯平方，需 `irreducible_equiv_specht` 分类，论文摘要的话、Lean 显式组装）、`saxl_kronecker_pos`（字面次数 $m(m+1)/2$）。

## 8. 常数总表

| 常数 | 值 | 机械角色 | Lean 落点 |
|---|---|---|---|
| $N_m$ | $m(m+1)/2$ | 两条切割恒等式 $N_m-m=N_{m-1}$、$N_m-(2m-1)=N_{m-2}$ | `staircase_card` |
| $\rho_m$ | 自共轭 | 支配 $\operatorname{Hom}$ 计数、$\phi$ 存在性、符号成对抵消 | `staircaseSwap` |
| $s$ | 1 或 2 | 平凡带 / $\operatorname{Mat}_2$ 路径 | `bandSize h s` |
| $\lvert F\rvert$ | $m$ / $2m-1$ | 与扫除目标匹配 | `bandPath_card` |
| $K$ | $2m-1$（奇） | 蛇形路径位置数 | `bandSize h 2 = 2(h+1)+1` |
| $\{I,Z,T,J\}$ | 4 维基 | 检测行数上限 4 的硬来源 | `basis 0..3` |
| 段表 | $\pm I,\pm2Z,\mp6J,\pm24I$ | 可逆段矩阵 | `segment_*_even/odd` |
| $Q(v_R\otimes v_R)$ | $(-1)^{\sum\binom r2}\prod r!$ | 无相消系数 | `Nat.card H * signC ω` |
| $Q$ | $\begin{pmatrix}1&1\\1&2\end{pmatrix}$ | 论文依赖 $\eta$ / Lean 统一 | `Band.Q` |
| (2.13) | $\sum c_j=r^2$，$\sum c_j^2-r^3\ge0$ | 平方刚性 | `pair_sum_rigidity` |
| (3.4) | margin 前缀取等 | 高位置 $=B_h$ | `high_positions_rigidity`（签名和版） |
| (5.1)/(5.2) | 支配失败点 / 前四行容量 | $k\ge4$、$m\ge5$、4 次扫除 | `strip_reduction_capacity`、`rowPrefix_mean` |

## 9. 可信度审查与倒推锚点

可信度：主定理有完整形式化（39 模块），且 Lean 与论文**五处路线实质不同**，双路线交叉验证使出错概率大幅降低。数值抽查全部吻合（多边形块系数、段表含 $r=3$ 双列细节、$K=2m-1$、$m\ge5$、$m=1$ 基）。三个自我警告：$\sum r^3$ 与行和 $r^2$ 的"巧合"是对阶梯形状的特殊依赖；Example 4.7 表明省略 $Q$ 共轭即错；论文"数新增行"与 Lean"数字母数"机制不同。论文自认边界：只证支撑不给公式；循环强化需"一份拷贝"（$n\in\{2,4,9\}$ 例外归伴随论文）；$s\le2$ 带宽受 $\operatorname{Mat}_2$ 伴随线性性限制；商的象不在原 Specht 因子内。

倒推锚点：为什么追踪生成子，并非环境支撑（第 1 节）；$\rho_m$ 自共轭在哪些层被消耗（第 1、3、4 节）；符号平均为何取"行号字"（第 3 节步 3，[推测] 标注）；平方刚性为什么必须平方（步 7，[推测]）；margin 取等为什么是引擎（4.2 第一段）；蛇形编号的目的（第 5 节）；$\operatorname{adj}$ 为什么必须是线性的（5.1）；Example 4.7 为什么值得写进论文（5.3）；"取最高列"与"取最右列"的规则差异（6.1，[推测]）；Lean 为什么恰好取了 Example 4.7 的矩阵（第 7 节）。

## 10. 两条定理陈述的逐字对账：量词、谓词与"更强"到底强在哪

第 1 节只登记了"实际证明的是更强的定理"这句话，没把两条陈述的逐字形式与量词结构拆开。这一节补上。符号约定说明一条：本笔记的绝对值一律写作 `\lvert\;\rvert`，tex 原文里是裸竖线字符（`dominance.tex:86` 处群 $H_R$ 的阶，原文用两个竖线字符围住），下面的逐字引用我已按本仓约定改写记号，行号仍指向原式。

**(a) tex 逐字**

`introduction.tex:6--12`：`The Kronecker coefficient`，随后独立公式行 `g(\alpha,\beta,\lambda)=\dim\Hom_{S_n}(S^\lambda,S^\alpha\otimes S^\beta)`，接 `is the multiplicity of $S^\lambda$ in the tensor product, with $S_n$ acting diagonally`。

`introduction.tex:13--15`（式 `intro:staircase`）：`N_m=\frac{m(m+1)}2,\qquad \rho_m=(m,m-1,\ldots,1)`。

`introduction.tex:18--25`（`thm:saxl`，标题 `[Saxl's conjecture]`）：

> `For every integer $m\ge1$ and every partition $\lambda\vdash N_m`,`
> `g(\rho_m,\rho_m,\lambda)>0.`
> `Equivalently, $S^{\rho_m}\otimes S^{\rho_m}$ contains every irreducible`
> `complex representation of $S_{N_m}$.`

`dominance.tex:42--49`（`thm:cyclic-saxl`，标题 `[Cyclic staircase support]`）。前置句在 42--43：`Here and throughout, the action on a tensor product of two $G_m$-modules is diagonal. Thus it suffices to prove the following stronger statement.` 定理体两行：

> `For every $m\ge1$ and every partition $\lambda\vdash N_m$, the irreducible`
> `$S^\lambda$ occurs in $W_m$.`

`completion.tex:150--156` 是从强化定理退回原猜想的全文：

> `The two factors generating $W_m$ have Specht type $\rho_m$. Thus $W_m$ is a submodule of $S^{\rho_m}\otimes_{\C}S^{\rho_m}$ under the diagonal action. \Cref{thm:cyclic-saxl} supplies every $S^\lambda$ in that submodule, so $g(\rho_m,\rho_m,\lambda)>0$ for every permitted $m$ and $\lambda$.`

`introduction.tex:27--30` 是这个强化的自我说明：`The assertion is uniform in both the staircase size and the constituent. The proof establishes it inside one explicitly generated submodule of the tensor square, a stronger conclusion that retains the vector needed at each induction step.`

**(b) 推导补全**

两条陈述的量词前缀完全同形：$\forall m\,(m\ge1\Rightarrow\forall\lambda\,(\lambda\vdash N_m\Rightarrow\cdots))$。差异只在末尾谓词，从 `$S^\lambda$ occurs in $W_m$' 到 `$g(\rho_m,\rho_m,\lambda)>0$' 的退回链有四环，我把它补开。

环 1：`occurs in $W_m$` 的展开。$W_m$ 是 $G_m=S_{B_m}$ 模（`dominance.tex:11--15` 给 $B_m$ 与 $G_m$），$S^\lambda$ 是 $S_{N_m}$ 模。二者能对话靠 $B_m$ 的大小：$\lvert B_m\rceil=\#\{(i,j):i+j\le m+1\}=\sum_{i=1}^{m}(m+1-i)=\sum_{r=1}^{m}r=N_m$，于是 $G_m=S_{B_m}\cong S_{N_m}$ 作为抽象群（选一个编号同构即可，重数不依赖该选择，因为共轭同构的群作用只改标签）。

环 2：包含关系。`dominance.tex:34--41` 先写 `Both set partitions have block sizes $m,m-1,\ldots,1$`，再由 $\rho_m^t=\rho_m$ 与 `lem:polytabloid` 得 $V_R:=\mathbb C[G_m]v_{R_m}\cong S^{\rho_m}$、$V_C:=\mathbb C[G_m]v_{C_m}\cong S^{\rho_m}$，并把 $W_m\subseteq V_R\otimes V_C$ 直接写进式 `dom:square-inclusion`。这里的关键是 $w_m=v_{R_m}\otimes v_{C_m}$（`dominance.tex:28--33`）的两份拷贝各自落在**不同的** Specht 型里，而对角作用把两者绑在一起，所以 $W_m$ 是张量积的**子模**，并非张量积本身。

环 3：`completion.tex:150--153` 把 `The two factors generating $W_m$ have Specht type $\rho_m` 用作 $W_m\subseteq S^{\rho_m}\otimes_\mathbb C S^{\rho_m}$，这正是环 2 的复述，说明作者刻意让退回证明只依赖 `dom:square-inclusion` 一行。

环 4：子模含 $S^\lambda$ $\Rightarrow$ 重数为正。$S^{\rho_m}\otimes S^{\rho_m}$ 半单（`specht-tools.tex:99--100`），故其子模是直和项，$\dim\operatorname{Hom}_{S_n}(S^\lambda,\,\cdot\,)\ge1$，即 $g(\rho_m,\rho_m,\lambda)\ge1>0$。

"更强"的层次要辨清两处，否则容易高估。第一，谓词强度：`occurs in $W_m$' 蕴含 `occurs in $S^{\rho_m}\otimes S^{\rho_m}$'，反向不成立，所以是严格更强。第二，量化范围：两者对 $m$ 与 $\lambda$ 的量化范围完全相同，强化没有多覆盖任何 $(m,\lambda)$ 对；`introduction.tex:27` 的 `uniform in both the staircase size and the constituent` 讲的是这个"没有额外假设"的性质。真正的额外内容在 `introduction.tex:29--30` 后半句 `retains the vector needed at each induction step`：被保留的对象是生成子本身，这让归纳假设可以携带一个向量穿过投影 $P_s$。第三，"更强"有外部消费者：`introduction.tex:32--36` 说伴随论文用 `the stronger cyclic statement of \Cref{thm:cyclic-saxl}, together with additional arguments` 构造每个 $n\notin\{2,4,9\}$ 的自全覆盖不可约表示；即循环版本是伴随论文的输入，原猜想版本不够用。

`thm:saxl` 陈述里那句 `Equivalently ... contains every irreducible complex representation of $S_{N_m}$` 依赖一个我原先当成背景的事实：`specht-tools.tex:91--93` 的 `the $S^\lambda$, for $\lambda\vdash n$, form the complete list of irreducible $S_n$-modules`（引 James Theorem 4.12）。没有这条分类，"每个 $\lambda\vdash N_m$"与"每个不可约复表示"就是两个不同断言，`Equivalently` 无从成立。这一条在 Lean 侧被显式消费：`Main.lean:96--104` 的 `saxl_contains_every_irreducible` 对任意 `Representation.IsIrreducible ρ` 先 `obtain ⟨p,⟨e⟩⟩ := irreducible_equiv_specht ρ`，再喂给 `full_cyclic_support`；论文里这句话只在量词层面用了一次，Lean 把它做成了一条独立定理。

**(c) 机械理由**

为什么必须是循环 polytabloid ，并非普通 tabloid。三条独立的机制各自要求交替化：

其一，重数线唯一。`dominance.tex:73` 说 $H_R$ 以 $\epsilon$ 作用于 $v_{R_m}$，这是**定义级**的事实：行内交错向量 $v_A=\sum_{\pi}\operatorname{sgn}(\pi)\bigotimes e_{\pi(i)}$（`specht-tools.tex:47--51`）在行子群置换下恰按符号变化。有了这个 $\epsilon$-特征性质，才有式 `dom:signed-average` 的精确因子化 $v_{R_m}\otimes u$，也才有 `dom:alternating-line` 那条重数一的线。若生成子是行 tabloid（对 $H_R$ 不变，并非交错），$\sum_{h}\epsilon(h)h$ 作用在它上面直接为零，步 2 一开始就死。

其二，系数记账无相消。`specht-tools.tex:54--55` 的 `Its nonzero word coefficients are $\pm1$` 是全部符号计算的立足点：`dominance.tex:82--86` 要说行号字 $a_0(i,j)=i$ 在 $v_{C_m}$ 中系数为 $1$，靠的是"每列递增排序时恒等赋值是唯一给出该字的置换"；tabloid 基底下同一行的所有赋值系数相同，唯一性消失，$\lvert H_R\rvert$ 型计数就变成了盲目求和，步 8 的同号相加也无从谈起。

其三，检测落在正确的型上。`path-band.tex:306--308` 需要目标 $\mathcal T_N^*$ 的型是 $\eta$ ，并非 $\eta^t$，这由 polytabloid 引理把"列分块交错"识别为 $S^\eta$ 保证（`specht-tools.tex:57--62` 的 $\theta_i=\#\{A\in L:\lvert A\rvert\ge i\}$ 把块大小读成**列长**）。tabloid 生成的是置换模 $M^\theta$，其成分是所有 $\tau\unrhd\theta$，无法指定单一型。

$m\ge1$ 起点为何够。$N_1=1$，唯一切分是 $\lambda=(1)$，$W_1$ 按 `completion.tex:88--89` 是 `the one-dimensional representation of the one-element group`，断言平凡成立。真正要保证的是归纳不落到非正指标：情形 (ii) 由 `completion.tex:52` 给出 $4\le k<m$ 从而 $m\ge5$，$m-2\ge3$；情形 (i) 只需 $m-1\ge1$，即 $m\ge2$，而 $m=1$ 已被支配分支吸收。Lean 把这个吸收做成了显式引理：`Main.lean:47--52` 的 `staircase_one_dominates` 证明任何满足 `μ.card = (staircase 1).card` 的 `μ` 都被 `staircase 1` 支配（用 `rowPrefix_eq_card` 把前缀和换成基数），`Main.lean:67--70` 再由此反推 `have hm2 : 2 ≤ m`。也就是说 $m=1$ 在 Lean 里是"支配分支自己关掉"，比论文的"$W_1$ 平凡"更结构化。$U_{m,1}\cong S^{(m)}$ 只在 $m\ge2$ 陈述（`path-band.tex:14`）、$K=2m-1$ 的路径论证要求 $m\ge3$（`path-band.tex:21`）、带切割要求 $h=m-s\ge1$（`band-quotient.tex:9`）：三处阈值都被情形分析的下界覆盖，无一需要额外基例。

三角数 $N_m$ 在哪个组合计票里被消费。三处，层层相扣。第一处是内容投影的计票本身：`dominance.tex:134--136` 要求字 $r$ 出现 $r$ 次，于是位置总数 $\sum_{r=1}^{m}r=N_m$ 必须等于 $\lvert B_m\rceil$，这就是三角数形状的第一次消费；同一投影下字值平方和为 $\sum_{r=1}^{m}r\cdot r^2=\sum r^3$（`dominance.tex:158--159` 的 `the sum of squared output letters over the whole triangle is $\sum_{r=1}^m r^3$`），而每行贡献的下界恰是 $r^3$（式 `dom:square-minimum`），两串 $\sum r^3$ 相等的唯一原因是"第 $r$ 行长度 $=r$ 的多重度也是 $r$"这个阶梯自配对：行长列表是 $(m,m-1,\ldots,1)$，内容重数列表是 $(1,2,\ldots,m)$，同一多重集反序。第二、三处是切割的收支平衡：`completion.tex:37--38` 的 `Since $N_m-m=N_{m-1}$` 与 `completion.tex:74--75` 的 `Their remainder has size $N_m-(2m-1)=N_{m-2}$`，配上 `band-quotient.tex:14` 的 $\lvert F\rvert=N_m-N_h=s(2m-s+1)/2$ 在 $s=1,2$ 分别给出 $m$ 与 $2m-1$。带宽度与扫除目标数不是两件事，是同一个二次式 $N_m-N_{m-s}$ 的两次展开。

两份拷贝的张量平方为何必然覆盖所有 $\lambda\vdash N_m$。在证明内部，覆盖性是分支穷尽性的推论，而穷尽性来自一次全分割：`completion.tex:32` 与 40 分别处理 $\lambda_1\ge m$ 与 $\lambda_1\le m-1$，这是整除式的二分；支配成立的 $\lambda$ 走 `prop:dominated`。剩下要问的是：支配失败且 $\lambda_1\le m-1$ 时，宽 2 带为何总能吃下。答案是容量不等式 `comb:four-row-capacity` 给出 $\sum_{i\le4}\lambda_i>2m-1=\lvert F\rvert$，即前四行的盒数严格多于带的容量，所以至多四次整扫就能恰移走 $2m-1$ 盒。这里 $2m-1$ 与"四"的相遇并非巧合：$2m-1$ 来自 $N_m-N_{m-2}$，四来自 $V^*$ 的维数（两层 $\times$ 两字母 $=\operatorname{Mat}_2(\mathbb C)$ 四维），把两者钉在一起的是"层数 $=2$"。若只做一层（$W_m$ 变成 $V_R$ 自己），它是不可约的，含不了任何别的型；若做三层，配对空间变成 $\operatorname{Mat}_2^{\otimes 3}$ 型八维，检测上限升到 8 行，但 $N_m-N_{m-3}$ 的带大小是 $3m-3$，而 $\sum_{i\le8}\lambda_i$ 的下界是否超过 $3m-3$ 需要另一套均值放缩，我没有验证过。立方全覆盖由 Harman--Ryba 用别的办法做到（`introduction.tex:81--83`），与本机制无关。[推测] 层数 $=2$ 之所以恰好够用，是因为"带大小 $\sim 2m$"与"检测行数上限 $\sim 2^2$"的常数匹配，这是我在写第 6 节时才看出的耦合。

**(d) [推测] 候选失败路线**

一，若把强化定理的谓词写成"$W_m$ 的半单包络含 $S^\lambda$"，环 4 会反向失效：半单包络在ambient张量积里取，丢掉的正是 `introduction.tex:29--30` 的"保留向量"，归纳里 $P_s(w_m)=\tilde w_h\otimes u_{m,s}$（`band-quotient.tex:158--160`）就无法拆成两个生成子的张量，切割链断裂。二，若在原猜想里把 $\lambda\vdash N_m$ 放宽为"任意不可约复表示"而不引 James 分类，`Equivalently` 一句失去依据；Lean 必须补 `irreducible_equiv_specht`，论文必须补 `specht-tools.tex:91--93`。三，若试图让 $W_m$ 等于整个张量积（去掉循环限制），$g>0$ 变成平凡但强化陈述失效，伴随论文的接口立刻断供。

## 11. 路径编号与带生成子符号：逐字拆开 `path:positions` 与 `path:generator-sign`

第 5 节我一句话带过"蛇形编号的唯一目的是让行列块都成相邻对"，没把编号核验、$K$ 的计数、$(-1)^{m-1}$ 的来源与两个端点单点的作用拆开。这一节补成完整条目。先记一条术语核对结果：`snake`、`zigzag` 这些词论文未用，tex 里的说法是 `Number its positions along the path`（`path-band.tex:22`）与 `path:positions`；"路径"是本笔记的叫法。

**(a) tex 逐字**

`path-band.tex:19--35`：

> `Let $m\geq3$, $K=2m-1$, and $F=B_m\setminus B_{m-2}.`
> `Number its positions along the path by`
> `p_{2j-1}=(m+1-j,j)\quad(1\leq j\leq m),\qquad p_{2j}=(m-j,j)\quad(1\leq j<m).`
> `In this numbering, the row blocks are the singleton $1$ and the pairs $(2,3),(4,5),\ldots,(K-1,K)$; the column blocks are $(1,2),(3,4),\ldots,(K-2,K-1)$ and the singleton $K$.`
> `Order each pair by increasing path index and let $u$ denote the resulting alternating band tensor. The row orders agree with increasing $j$, while each of the $m-1$ column pairs reverses increasing $i$. Consequently`
> `u=(-1)^{m-1}u_{m,2},\qquad U_{m,2}=\C[S_F]u.`

端点作用在证明里：`path-band.tex:125--126` 的 `The two singleton blocks require the first row-layer index and last column-layer index to be $1$`，`path-band.tex:149` 的 `There are $m-1$ even positions, yielding the stated sign`。连续性用在 `path-band.tex:277--278`：`The segments are consecutive, so no matrix factors are interchanged in this factorization.`

**(b) 推导补全**

$F$ 的形状。$B_m=\{(i,j):i+j\le m+1\}$、$B_{m-2}=\{(i,j):i+j\le m-1\}$，故 $F=\{(i,j)\in B_m:i+j\in\{m,m+1\}\}$，即斜边 $i+j=m+1$ 一行斜线加上它内侧 $i+j=m$ 的斜线。计数：$i+j=m+1$ 有 $m$ 组正整数解（$j=1,\ldots,m$），$i+j=m$ 有 $m-1$ 组，$\lvert F\rvert=m+(m-1)=2m-1=K$，与 `band-quotient.tex:14` 代入 $s=2$ 的 $2(2m-1)/2=2m-1$ 相互核对一致。

编号是合法双射。奇指标 $p_{2j-1}=(m+1-j,j)$ 满足 $i+j=m+1$，$j=1,\ldots,m$ 遍历该斜线全部 $m$ 个点，故给出 $p_1,p_3,\ldots,p_{2m-1}$ 共 $m$ 个互异点。偶指标 $p_{2j}=(m-j,j)$ 满足 $i+j=m$，$j=1,\ldots,m-1$ 给出 $p_2,p_4,\ldots,p_{2m-2}$ 共 $m-1$ 个互异点。两集合分处两条斜线故不相交，并起来正好 $K$ 个点，编号是双射。$p_1=(m,1)$，$p_{2m-1}=p_K=(1,m)$。

行块核验。固定行 $i$，$F$ 中该行的点满足 $m-i\le j\le m+1-i$，即 $j=m-i$ 与 $j=m+1-i$ 两个候选，前者要求 $m-i\ge1$ 即 $i\le m-1$。$i=m$ 时只剩 $j=1$，得单点 $\{(m,1)\}=\{p_1\}$，这就是"the singleton $1$"。$1\le i\le m-1$ 时两点为 $(i,m+1-i)$ 与 $(i,m-i)$。用 $i=m+1-j$ 反解第一个：$p_{2j-1}$ 的 $i$ 坐标为 $m+1-j$，令其等于 $i$ 得 $j=m+1-i$，指标 $2(m+1-i)-1$；第二个 $p_{2j}$ 的 $i$ 坐标为 $m-j$，令其等于 $i$ 得 $j=m-i$，指标 $2(m-i)$。两者之差 $2(m+1-i)-1-2(m-i)=1$，故行块是相邻对 $\{2k,2k+1\}$，$k=m-i$。$i$ 从 $m-1$ 降到 $1$ 时 $k$ 从 $1$ 升到 $m-1$，遍历 $(2,3),(4,5),\ldots,(2m-2,2m-1)=(K-1,K)$，与 tex 逐字一致。

列块核验。固定列 $j$，$F$ 中该列两点 $(m+1-j,j)=p_{2j-1}$ 与 $(m-j,j)=p_{2j}$（后者存在当 $j\le m-1$），故列块是 $\{2j-1,2j\}$，$j=1,\ldots,m-1$ 给出 $(1,2),(3,4),\ldots,(2m-3,2m-2)=(K-2,K-1)$；$j=m$ 时 $(0,m)$ 非法，只剩 $p_{2m-1}=p_K$，即"the singleton $K$"。

行的字序与列的字序。行块 $\{p_{2k},p_{2k+1}\}$ 中 $p_{2k}=(i,m-i)$ 的 $j$ 坐标 $m-i$ 小于 $p_{2k+1}=(i,m+1-i)$ 的 $j$ 坐标 $m+1-i$，故"沿路径指标递增"就是"$j$ 递增"，与 $R_m$ 继承来的行内序（`dominance.tex:25` 的 `Order each row by increasing $j$`）同向，无符号。列块 $\{p_{2j-1},p_{2j}\}$ 中前者 $i=m+1-j$、后者 $i=m-j$，沿路径递增时 $i$ 递减，与 $C_m$ 的 `increasing $i$` 反向，故每个列块贡献一个 $-1$。列对个数 $=m-1$（$j=1,\ldots,m-1$），故按路径序交错出来的 $u$ 与按 $R_F,C_F$ 继承序交错出的 $u_{m,2}$ 相差 $(-1)^{m-1}$，这就是 `path:generator-sign`。长度 2 的块张量是 $v_A=e_1\otimes e_2-e_2\otimes e_1$，位置序反向即整体取负，这个"$-1$ 成块"的最小情形我核对过。

收缩式的端点作用。式 `path:index-sum`（`path-band.tex:129--135`）的求和带约束 $a_1=b_K=1$：$p_1$ 是行单点，其行层赋值只能是字母 1；$p_K$ 是列单点，其列层赋值只能是字母 1。这两个约束把缩并链的两个自由端钉死，于是整条链的输出是乘积矩阵的 $(1,1)$ 元，并非迹。[推测] 若两端都是对（即路径闭合或两端各延长一格），指标环会成圈，输出变成 $\operatorname{tr}(\cdots)$，迹对共轭不变，第 5.3 节靠"把特征向量送到第一坐标"来救 $(1,1)$ 元的整套自由度就完全不需要，看起来更简单，但迹对 $J$ 型因子为零（$\operatorname{tr} J=0$），奇偶段长的乘积一旦含单个 $J$ 就整体归零，检测覆盖面反而碎裂。

**(c) 机械理由**

编号为何非"相邻对"不可。检测段是路径的连续子区间（`path-band.tex:251--254`：`Partition the path into consecutive segments of these lengths, beginning at $s_j=1+\sum_{i<j}r_i$`），而收缩式 `path:contraction-formula` 里 $D_q$ 的奇偶性按**全局路径位置** $q$ 定（`path-band.tex:181--188`）。段划分与奇偶结构必须同时可读，编号就得把行块和列块都做成相邻对：这样原始 pair 块本身就是段的细化，段的端点奇偶只由 $s_j$ 与 $r_j$ 决定，`path:segment` 的两个起始奇偶情形（表 `path:segment-table` 的两列）就已穷尽所有可能。若行块跨步不连续，原始交错与段交错不再是同一族划分，`path-band.tex:275--276` 的"段内独立求和 $=$ 有序乘积分配展开"就不再成立，因为分配展开要求不同段的因子不相交错。

$(-1)^{m-1}$ 为何无害。$U_{m,2}=\mathbb C[S_F]u$ 只取决于 $u$ 生成的模，乘以非零标量不改模，故 tex 在 `path:generator-sign` 直接把 $u$ 当作生成子写下来，不必修正 $u_{m,2}$ 的定义。符号非无害的地方只有一处：`path:contraction-formula` 与 `path:ordered-factorization` 两式各带一个 $(-1)^{m-1}$，二者相乘给 $(-1)^{2m-2}=1$，所以配对值 $\langle u,t_N\rangle$ 的符号完全由 $B=A_{r_1,s_1}\cdots$ 决定，与 $m$ 的奇偶无关。`path-band.tex:320` 在 $m=3$ 的例子末尾写 `since $(-1)^{m-1}=1$`，配对值 $=12$，与 $[12T]_{11}$ 经共轭后为 $1$ 再乘 $12$ 吻合，我按这个口径核过。

$K$ 为奇数的作用。$K=2m-1$ 是奇数，于是"奇位置个数 $=m$、偶位置个数 $=m-1$"，恰好等于行块（$1$ 个单点 $+\,(m-1)$ 个对）与列块的交错计数需要：$X_1$ 前无 $\operatorname{adj}$、$X_K$ 后无 $\operatorname{adj}$（式 `path:contraction-formula` 的首尾两项都不带伴随）。若 $K$ 为偶，则首或尾必有一个带伴随，端点字母 $1$ 的钉法失效，因为 $\operatorname{adj}$ 把 $e_1\otimes e_2$ 型系数换成反对角元，$a_1=b_K=1$ 的约束形式会变。$K$ 的奇偶来自 $2m-1$，即 $N_m-N_{m-2}$，所以"带大小为奇"同样是三角数形状的下游结论。[推测] 我在第 5 节写下"蛇形编号的唯一目的是让行块列块都成相邻对"时低估了这一点：编号同时负责 $K$ 的奇偶呈现，即 $p_1$ 必须是行单点、$p_K$ 必须是列单点，两端各承担一次钉字母。

**(d) [推测] 候选失败路线**

一，把行块与列块的成对方式互换（行块取 $(1,2),(3,4),\ldots$，列块取 $(2,3),\ldots$ 并把两端单点分别移到列端与行端），则 $a_1$ 与 $b_K$ 变成同一层的指标，收缩式退化为单矩阵的 $(1,1)$ 元，段交错矩阵失去乘积结构，`prop:two-band` 的检测对 $\eta$ 有多列完全无效。二，若把 $u$ 的符号直接吸收进 $u_{m,2}$ 的定义（即宣布 $u_{m,2}:=u$），则 `band:generator` 处按 $R_F,C_F$ 继承序定义的那份会与本节那份差 $(-1)^{m-1}$，`band:generator-factorization` 中 $z=\tilde w_h\otimes u_{m,s}$ 的符号账要在 `band:block-factorization` 的 $(-1)^{ab}$ 之外重列，两处混合极易双计或漏计。三，若段划分改为按行块，并非按连续位置（每段含完整原始块），段间矩阵必然交错，`path:ordered-factorization` 右端的有序乘积 $A_{r_1,s_1}\cdots A_{r_c,s_c}$ 会散成一组带符号的重排项之和，重排符号与 $\pi$ 有关，`path:segment` 的"$r!$ 项同号"论证当场失效。

## 12. 被复用最多的四行工具：James 清单、自对偶、半单提升与配对等变

`specht-tools.tex:91--116` 这一段我此前只当作背景引用，没拆。它的实际地位是：全文四个"回到 $W_m$ 自身"的落点、两个"型不变"的落点与一个"等价于每个不可约"的落点全部由这 26 行供给。第 2 节拆的是四个带名字的引理，这一节拆这组无名事实。

**(a) tex 逐字**

`specht-tools.tex:91--93`：`We use the usual complex representation-theoretic facts \cite[Theorems~4.12 and~6.7]{james1978}: the $S^\lambda$, for $\lambda\vdash n$, form the complete list of irreducible $S_n$-modules, and`

`specht-tools.tex:95--98`（式 `tools:dual-sign`）：

> `(S^\lambda)^*\cong S^\lambda,`
> `S^\lambda\otimes\sgn\cong S^{\lambda^t}.`

`specht-tools.tex:99--100`：`Every complex representation of a finite group is semisimple \cite[Proposition~1.5 and Corollary~1.6]{fultonharris1991}, so any irreducible quotient is also a constituent.`

`specht-tools.tex:101--107`（式 `tools:frobenius`）：`For $H\le G$, Frobenius reciprocity \cite[Proposition~3.17]{fultonharris1991} takes the form $\Hom_G(\Ind_H^G A,V)\cong\Hom_H(A,\Res_H^G V)$.`

`specht-tools.tex:108--111`：`Induction, modeled by $\C[G]\otimes_{\C[H]}A$, is transitive and distributes over direct sums. The symbol $\boxtimes$ denotes the outer tensor product for separate group actions; ordinary tensor products of two $S_B$-modules carry the diagonal action.`

`specht-tools.tex:112--116`：`The natural pairing of $E^{\otimes B}$ and $(E^*)^{\otimes B}$ satisfies $\langle gu,gt\rangle=\langle u,t\rangle$. Thus pairing with an invariant subspace $T$ of the dual tensor space defines an equivariant map $u\mapsto(t\mapsto\langle u,t\rangle)$ into $T^*$.`

**(b) 推导补全**

配对等变的来源。`specht-tools.tex:41--42` 定义位置作用为 $g e_a=e_{a\circ g^{-1}}$，即 $(ge_a)(b)=a(g^{-1}b)$。对偶空间上的作用是 $(g\varphi)(w)=\varphi(g^{-1}w)$，于是 $\langle g e_a, g\varphi\rangle=(g\varphi)(g e_a)=\varphi(g^{-1}g e_a)=\varphi(e_a)=\langle e_a,\varphi\rangle$；张量积上逐因子相乘得 $\langle gu,gt\rangle=\langle u,t\rangle$。这里的逆号是定义自带的，不是选择：如果我改用 $g e_a=e_{a\circ g}$，就得到反作用，第 2.1 节里"$C_t$ 的置换作用给 $\pi^{-1}$，而 $\operatorname{sgn}(\pi^{-1})=\operatorname{sgn}(\pi)$"这条救命论证会换成不带逆的版本，符号仍对，但 `path-band.tex:303--304` 的显式验证 $\Phi(gx)(t)=\langle x,g^{-1}t\rangle=(g\Phi(x))(t)$ 要在两边各补一个逆，等价性保持。

映射 $\Phi$ 的等变方向。令 $\Phi(x)(t)=\langle x,t\rangle$。左边 $\Phi(gx)(t)=\langle gx,t\rangle=\langle x,g^{-1}t\rangle$（用刚证的不变性，把 $g$ 从 $u$ 移到 $t$ 上变为 $g^{-1}$）。右边按 $T^*$ 的作用 $(g\Psi)(t)=\Psi(g^{-1}t)$，得 $(g\Phi(x))(t)=\Phi(x)(g^{-1}t)=\langle x,g^{-1}t\rangle$。两式相同，$\Phi$ 等变。$T$ 需为 $S_F$-不变子空间才能让 $\Phi(x)$ 限制在 $T$ 上仍落在 $T^*$，这正是 $\mathcal T_N=\mathbb C[S_F]t_N$ 的定义性质（`path-band.tex:265`）。

不可约商即成分。设 $\pi:U\twoheadrightarrow Q$ 满、$Q$ 不可约。半单性给 $\ker\pi$ 的补 $U=\ker\pi\oplus W$；$\pi\lvert_W:W\xrightarrow{\sim}Q$ 是同构，故 $W\subseteq U$ 是同型 $Q$ 的子模，$Q$ 是 $U$ 的成分。论文四个使用点我都对齐了：`band-quotient.tex:203--204`（商回到 $W_m$）、`dominance.tex:193--194`（`Semisimplicity and \Cref{dom:repeated-row-cyclic} imply that it occurs in $W_m\otimes\epsilon$`）、`path-band.tex:308`（`semisimplicity proves the claimed occurrence in $U_{m,2}$`）、`completion.tex:144--145`（`Complete reducibility again gives the constituent in $W_m$ itself`）。四处结构相同：先造一个从循环模出发的满等变映射，再用半单性把成分提回子模。`dominance.tex:193--194` 那处还额外要求"提回的对象在 $W_m\otimes\epsilon$ 里"，靠的是 `dom:repeated-row-cyclic` 的 $Z_m\subseteq\mathrm{im}(W_m\otimes\epsilon)$，这与 `completion.tex:144` 的用法相比多绕了一层等构。

自对偶与扭转的两处不可替代用途。(i) `path-band.tex:306--308`：$\Phi$ 的目标 $\mathcal T_N^*$ 必须型为 $\eta$。$\mathcal T_N\cong S^\eta$ 由 `lem:polytabloid` 给（列长 $=r_j$ 的段交错），对偶按 `tools:dual-sign` 第一式不变，故型仍 $\eta$。若对偶把型翻成 $\eta^t$，我检测到的就是 $\eta^t$ ，并非 $\eta$，而归纳需要的是行数 $\le4$ 的那个 $\eta$，$\eta^t$ 的行数条件会换成列数条件（即 $\eta_1\le4$），与 `comb:strip-reduction` 的产出对不上。(ii) `dominance.tex:97--99` 与 `dominance.tex:63--64`：$\operatorname{Hom}_G(M^{\rho_m}\otimes\epsilon,V_R)$ 要变成 $\operatorname{Hom}_G(M^{\rho_m},V_R\otimes\epsilon)$ 再识别为 $1$，需要 $V_R\otimes\epsilon\cong S^{\rho_m^t}=S^{\rho_m}$，扭转的第二式与自共轭性同时消费。

`(108--111)` 那句 `Induction ... is transitive and distributes over direct sums` 在 `completion.tex:115--117` 被消费两次：`Repeated application of \Cref{lem:pieri}, followed by transitivity of induction` 先做传递性，再在 `A\cong\bigoplus_\eta(S_F^\eta)^{\oplus a_\eta}` 上分配，才能把 $\operatorname{Ind}(S^\nu\boxtimes A)$ 拆成 $\bigoplus_\eta(\operatorname{Ind}(S^\nu\boxtimes S^\eta))^{\oplus a_\eta}$，进而与式 `comb:positive-multiplicity` 的加权和等价（见第 13 节）。分配性一次都不能少，因为 $c_{\nu,\eta}^\lambda$ 是按单个 $\eta$ 定义的。

**(c) 机械理由**

为什么 James 分类必须以"清单完整"的形式进入。`thm:saxl` 的第二句用 `every irreducible complex representation`；`completion.tex:154--155` 的退回只说 `supplies every $S^\lambda$ in that submodule`。两者之间的桥是"每个不可约都同构于某个 $S^\lambda$"，唯一一次被引用是 `specht-tools.tex:92--93`。Lean 侧这条桥更粗：`Main.lean:96--104` 直接把它做成对外部表示 $\rho$ 的定理，靠 `irreducible_equiv_specht`。[推测] 论文没有把这条单列成引理，因为对组合读者它是常识；一旦形式化，"常识"就变成一条需要显式命名的假设，这正是我预期移植成本最高的一类差异。

为什么 $(S^\lambda)^*\cong S^\lambda$ 只能在这里用。全文的不可约目标有两个来源：$W_m$ 侧（子模，用包含）与 $\mathcal T_N$ 侧（对偶空间，用配对）。只有后者涉及对偶。第 5.3 节曾把这条写成"双模自对偶"，容易误读成一般事实；`tools:dual-sign` 的原文限定在 Specht 型上，而一般不可约复表示的自对偶性来自特征标取值实（对称群的不可约特征标整数值），论文没有走特征标路线。

为什么半单性必须写在工具层，并非每处重证。四个使用点的结构是"满射 + 目标不可约 $\Rightarrow$ 目标出现在源里"，其前半（源半单）与群无关、与形状无关，`specht-tools.tex:99--100` 一次引用 Fulton--Harris 的 Prop 1.5 与 Cor 1.6 就覆盖全部。这也解释了 `band-quotient.tex:200--203` 的警告为什么必要：半单性只保证成分存在，不保证它们落在你原本期望的那两个 Specht 因子里，投影 $P_s$ 的象住在更大的配对字空间里。

**(d) [推测] 候选失败路线**

一，若把 $\Phi$ 的目标从 $\mathcal T_N^*$ 改成 $\mathcal T_N$（去掉对偶），等变性需要 $\langle gx,t\rangle=\langle x,gt\rangle$ 这种不成立的恒等式，符号会错一个逆；整条检测论证的"配对非零 $\Rightarrow$ 满"结构崩掉。二，若在 `dominance.tex:97--99` 用非自共轭形状，$V_R\otimes\epsilon\cong S^{\rho_m^t}\ne V_R$，$\dim\operatorname{Hom}$ 的那条链给 $0$ ，并非 $1$，重数线唯一失效（与第 2.2 节的结论呼应，但机制不同：那里断在支配方向，这里断在线上）。三，若源模不过半单（换到模 $p$ 情形），满射不再分裂，`band-quotient.tex:203--204` 的归纳传递失效；[推测] 论文把基域锁在 $\mathbb C$（`specht-tools.tex:9` 的 `All representations and tensor products are over $\C$`）正是为这一条，而 Bessenrodt--Bowman--Sutton 的 2-模分解数路线（`introduction.tex:69--72`）恰好是半单性缺失一侧的工作，两者不可混用。

## 13. 正重数不等式与 $A$ 的分解：`comb:positive-multiplicity` 逐字拆

第 6.2 节我写了"$\sum_\eta a_\eta c_{\nu,\eta}^\lambda>0$"一句就转到下一步，没交代 $a_\eta$ 从哪来、$c$ 的下标是什么群、$q\le4$ 如何变成"行数 $\le4$"、以及"存在某个 $\eta$ 同时满足 $a_\eta>0$ 与 $c_{\nu,\eta}^\lambda>0$"这一步的非平凡性。这一节补全。

**(a) tex 逐字**

`completion.tex:107--114`：

> `In case \textup{(ii)}, put $K=2m-1$ and use the cut with $s=2$. Write $b_i=\lvert\lambda^{(i)}\rvert-\lvert\lambda^{(i-1)}\rvert$, so that $b_1+\cdots+b_q=K$ and $q\le4$. Choose disjoint subsets of $F$ of these sizes and form the permutation module`
> `A=\Ind_{S_{b_1}\times\cdots\times S_{b_q}}^{S_F}\mathbf1\cong\bigoplus_{\eta\vdash K}(S_F^\eta)^{\oplus a_\eta}.`

`completion.tex:115--118` 前半：`Repeated application of \Cref{lem:pieri}, followed by transitivity of induction, shows that $S_{B_m}^\lambda$ is a constituent of $\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes A)$.`

`completion.tex:118--128`（式 `comb:positive-multiplicity`）：

> `\sum_{\eta\vdash K}a_\eta c_{\nu,\eta}^{\lambda}>0,`
> `c_{\nu,\eta}^{\lambda}=\dim\Hom_{S_{B_m}}\!\left(S_{B_m}^\lambda,\Ind_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes S_F^\eta)\right).`

`completion.tex:128--134`：

> `Here the coefficients are nonnegative integers. Moreover, every constituent of $A$ has at most $q$ rows: starting from the empty diagram, each of the $q$ horizontal-strip additions can introduce at most one new row, because two new rows would both require a new box in the first column. Thus \Cref{comb:positive-multiplicity} provides some $\eta$ with at most four rows, $a_\eta>0$, and $c_{\nu,\eta}^{\lambda}>0$.`

`completion.tex:136--143`：`By \Cref{prop:two-band}, this $S_F^\eta$ occurs in $U_{m,2}$. By induction, $S_D^\nu$ occurs in the specified cyclic module $W_{m-2}$. One copy of each suffices to give $S_{B_m}^\lambda$ in $\Ind_{S_D\times S_F}^{S_{B_m}}(W_{m-2}\boxtimes U_{m,2})$.`

术语核对：`permutation module` 一词在 tex 里出现于 `specht-tools.tex:69` 与 `dominance.tex:135`（`the span $\mathcal M_\alpha$ of words...`），`completion.tex:113` 处论文说的是 `form the permutation module`，逐字一致。

**(b) 推导补全**

$b_i$ 的定义与总长。`comb:strip-reduction` 的 (ii) 给出链 $\nu=\lambda^{(0)}\subset\lambda^{(1)}\subset\cdots\subset\lambda^{(q)}=\lambda$，$q\le4$，每 $\lambda^{(i)}/\lambda^{(i-1)}$ 是非空水平带，"Their total size is $2m-1$"（`completion.tex:25`）。于是 $b_i=\lvert\lambda^{(i)}\rvert-\lvert\lambda^{(i-1)}\rvert\ge1$（非空）且 $\sum_{i=1}^{q}b_i=\lvert\lambda\rvert-\lvert\nu\rvert=N_m-N_{m-2}=2m-1=K$（后一等式即 `completion.tex:74--75`）。$\lvert F\rvert=K$ 由 `band-quotient.tex:14` 代入 $s=2$：$2(2m-2+1)/2=2m-1$。故 $\sum b_i=\lvert F\rvert$，"Choose disjoint subsets of $F$ of these sizes"（`completion.tex:111`）才能取到并集恰为 $F$ 的一组分拆。这一步不是装饰：只有并集为全 $F$，$S_{b_1}\times\cdots\times S_{b_q}$ 才是 $S_F$ 的一个 Young 子群（各因子作用在互不相交的位置集上，且合起来覆盖 $F$），$\operatorname{Ind}$ 才有意义；若只取到真子集，诱导群是 $S_{b_1}\times\cdots\times S_{b_q}\times S_{\lvert F\rvert-\sum b_i}$，多出平凡因子，后面的 Pieri 迭代多一步空带（`specht-tools.tex:122--123` 用 $\mathbf 1$ 与空分割处理 $b=0$，技术上可行但会打乱 $q$ 与行数上限的对应）。

$A$ 的分解与 $a_\eta$ 的计数意义。对 $S_{b_1}\times\cdots\times S_{b_q}\le S_F$ 用传递性：先在某 $S_{b_1\cup b_2}$ 内部诱导，逐层叠加。每一层用 `lem:pieri`：$\operatorname{Ind}_{S_a\times S_b}^{S_{a+b}}(S^\mu\boxtimes\mathbf 1)\cong\bigoplus_{\mu'/\mu\text{ 水平带},\,\lvert\mu'/\mu\rvert=b}S^{\mu'}$。$q$ 层合起来给出
$$A\cong\bigoplus_{\eta}S^\eta\ \ \text{其中}\ \ a_\eta=\#\{\varnothing=\mu^{(0)}\subseteq\mu^{(1)}\subseteq\cdots\subseteq\mu^{(q)}=\eta:\ \mu^{(i)}/\mu^{(i-1)}\ \text{是大小为}\ b_i\ \text{的水平带}\}.$$
这与 `tools:strip-chain`（`specht-tools.tex:165--170`）形式相同，只有两处差别：那里的带长序列是 $\theta_1,\ldots,\theta_\ell$（分拆的分量），这里是 $b_1,\ldots,b_q$（扫除实际移走的盒数）；那里的链终点是任意 $\tau$，这里限定为 $\eta\vdash K$。$a_\eta\ge0$ 是整数计数，`completion.tex:128` 的 `nonnegative integers` 由此而来，与重数定理的半单性无关。

加权和与成分的等价。由 `specht-tools.tex:108--109` 的分配性，
$$\operatorname{Ind}_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes A)\cong\bigoplus_{\eta\vdash K}\Bigl(\operatorname{Ind}_{S_D\times S_F}^{S_{B_m}}(S_D^\nu\boxtimes S_F^\eta)\Bigr)^{\oplus a_\eta}.$$
$S_{B_m}^\lambda$ 在右端的重数 $=\sum_\eta a_\eta\dim\operatorname{Hom}_{S_{B_m}}(S^\lambda,\operatorname{Ind}(\cdots))=\sum_\eta a_\eta c_{\nu,\eta}^\lambda$，按 `comb:positive-multiplicity` 第二式的定义。故"$S^\lambda$ 是成分"与"$\sum_\eta a_\eta c_{\nu,\eta}^\lambda\ge1$"等价，因为重数是整数。tex 的写法是 `Equivalently`（`completion.tex:118`）。

"$q$ 条带 $\Rightarrow$ 至多 $q$ 行"的论证补开。$\mu^{(i-1)}\subseteq\mu^{(i)}$ 且差集每列至多一盒，故新增盒数 $b_i$ 全部分布在不同列。设 $\mu^{(i)}$ 比 $\mu^{(i-1)}$ 多出两行，即 $\operatorname{len}(\mu^{(i)})\ge\operatorname{len}(\mu^{(i-1)})+2$：新行 $\operatorname{len}(\mu^{(i-1)})+1$ 与 $+2$ 各至少含一盒，而这两盒都在第 $1$ 列吗？分拆图的行是左对齐的，第 $r$ 行非空 $\Rightarrow$ 第 $1$ 列高度 $\ge r$，故两新行都在第 $1$ 列各加一盒，第 $1$ 列新增 $\ge2$ 盒，违反水平带条件（每列至多一盒）。所以每条带至多加一行，$\operatorname{len}(\eta)\le q\le4$。tex 的压缩写法是 `two new rows would both require a new box in the first column`（`completion.tex:132--133`）。注意这里用的是"行数"版本，而 Lean 用的是"字母数"版本（`Main.lean:34--36` 的假设 `η.colLen 0 ≤ bs.length`，即第一列高 $=b_s$ 长度 $\le$ 带条数），两者由"列长 $=$ 行数"这一共轭对应互译；我在第 7 节第 4 条记过这个机制差异，这里补上具体式的对应。

存在性抽取。$\sum_\eta a_\eta c_{\nu,\eta}^\lambda>0$ 且每项 $\ge0$ 的整数 $\Rightarrow$ 存在 $\eta$ 使 $a_\eta c_{\nu,\eta}^\lambda>0$，即 $a_\eta>0$ 与 $c_{\nu,\eta}^\lambda>0$ 同时成立（tex：`provides some $\eta$ with at most four rows, $a_\eta>0$, and $c_{\nu,\eta}^{\lambda}>0$`）。"at most four rows"是对**所有** $\eta$ 成立的界（上一步），所以挑出的 $\eta$ 自动满足，无需二次筛选。这一点值得记：界是集合级的，正性是个点级的，两者交叉才给出可用的 $\eta$。

"一份拷贝"的用法。$c_{\nu,\eta}^\lambda>0$ 说的是 $\operatorname{Hom}_{S_{B_m}}(S^\lambda,\operatorname{Ind}(S^\nu\boxtimes S^\eta))$ 非零。已知 $S^\nu\subseteq W_{m-2}$、$S^\eta\subseteq U_{m,2}$ 各**至少一份**（存在非零 intertwining map）。取各一份，$\operatorname{Ind}$ 对张量双函子保持，得非零 $\operatorname{Hom}(S^\lambda,\operatorname{Ind}(W_{m-2}\boxtimes U_{m,2}))$。这里 $W_{m-2}\boxtimes U_{m,2}$ 是 $S_D\times S_F$-模，其子模 $S^\nu\boxtimes S^\eta$ 的嵌入诱导 $\operatorname{Ind}$ 层面的单射（特征 0 上半单，诱导正合），故一份足够。若 $S^\nu$ 需要两份，我就得在 $W_{m-2}$ 里追踪两份生成子，切割处的因子分解 $z=\tilde w_h\otimes u_{m,s}$（单一向量）无法提供，这正是 `introduction.tex:180--184` 强调 `Only one copy of a suitable intermediate irreducible is needed` 的理由，也是 `introduction.tex:29--30` 那句"保留归纳步所需向量"的兑现点。

**(c) 机械理由**

为何必须用 $A$（置换模），并非直接指定 $\eta$。带的大小 $b_i$ 由扫除过程的几何决定（每次整扫移走 $\alpha_1$ 个盒，见 `completion.tex:61--67`），我**无法预先指定**剩下的 $\eta\vdash K$ 是什么分拆；能指定的只有"存在一条大小序列 $b_1,\ldots,b_q$"。把所有满足该序列的 $\eta$ 打包进 $A$，让 $a_\eta$ 承担计数，是被动选择。[推测] 若试图先固定 $\eta$ 再反推 $b_i$，我会得到"给定 $\eta$，是否存在水平带分解"的另一种 NP 型问题，四行检测的普适性（`prop:two-band` 对**每个** $\operatorname{len}(\eta)\le4$ 都成立）就用不上了。

$q\le4$ 与"行数 $\le4$"的双重身份。前者来自容量不等式 `comb:four-row-capacity`（$\sum_{i\le4}\lambda_i>2m-1$ 保证四次整扫够），后者来自 $V^*=\operatorname{Mat}_2(\mathbb C)^*$ 的维数 4（`path-band.tex:163--168`）。两个"四"在 `comb:positive-multiplicity` 的抽取处对齐，这是整个证明里最紧的一次耦合：容量给出 $q\le4$ 用的是**前四行**，检测覆盖 $\le4$ 行用的是**矩阵空间维数**，两者都写"4"但来源完全不同。[推测] 把层数从 2 改成 3 时，维数上限变 8 而容量上限（前 $r$ 行）里的 $r$ 也要同步变，两处"4"的巧合会立刻散架，我当时以为这是设计出来的常数，现在倾向认为是 $2\times2$ 情形独有的重合。

为何"非空"带是必要条件。若允许 $b_i=0$，链中会出现重复项，$q$ 作为"行数上限"仍然成立，但 `comb:strip-reduction` 的陈述 `every $\lambda^{(i)}/\lambda^{(i-1)}$ a nonempty horizontal strip`（`completion.tex:24`）保证 $q$ 严格等于实际扫数，进而 $q\le4$ 的"至多"才有物理意义（至多四次非空整扫加至多一次部分扫，`completion.tex:73--75`）。若去掉非空，$q$ 可任意大，$a_\eta$ 的计数会重复计入同一 $\eta$ 的冗余链，虽然 $a_\eta$ 仍 $\ge0$、和式仍正，但"每条带至多加一行"的界失效（空带也能记为一行），我可能挑出行数无界的 $\eta$。

**(d) [推测] 候选失败路线**

一，若 $b_i$ 子集只要求互不相交而并集不填满 $F$，$\operatorname{Ind}$ 的基群变大，$A$ 换成 $\operatorname{Ind}\mathbf 1$ 多一个平凡因子，Pieri 迭代多一步空带，$\eta$ 的行数上限被"$\eta\vdash K-\sum b_i$"改写，`comb:positive-multiplicity` 与 `prop:two-band`（要求 $\eta\vdash2m-1$，`path-band.tex:246`）的 $K$ 不一致，检测定理不适用。二，若把 $c_{\nu,\eta}^\lambda$ 误认成 Littlewood--Richardson 系数 $c_{\nu,\eta}^\lambda$（外张量积诱导的重数确实用同一记号，tex 用 $\dim\operatorname{Hom}$ 定义它，`completion.tex:122--126`），我会以为 $\nu$ 与 $\eta$ 大小之和为 $N_m$ 是 LR 规则可用的条件；这里 $S_D$ 与 $S_F$ 是两个不相交位置集的群，$\operatorname{Ind}_{S_D\times S_F}^{S_{B_m}}(S^\nu\boxtimes S^\eta)$ 的重数确实是 LR 系数（$\lvert\nu\rvert+\lvert\eta\rvert=N_m$ 恰好满足），但论文刻意不引 LR 一般理论，只在 $b\ge0$ 的单行特化上用 Pieri（`specht-tools.tex:138--141`），把这条当作 LR 来用会引入论文未声明的 machinery。三，若 $a_\eta$ 全为 1 的猜测成立（即链唯一），"$\sum a_\eta c_\eta>0$"会退化为"某条特定链的 $\eta$"，我可以省去半单论证直接构造，但 `completion.tex:133` 的"at most four rows"仍必要；我没有验证 $a_\eta$ 能否 $>1$，[推测] 在 $q<4$ 且某些 $b_i$ 相等时可以有重复链，故 $a_\eta>1$ 应会发生，这正是必须走和式，并非走单条链的原因。

## 14. Lean 的验收面只有一条名字：签名进什么、declaration 外留什么

登记表与书目我都按点名文件读了。书目在 `lean/formalization.yaml:71--73`（title 为 `A Cyclic Polytabloid Proof of Saxl's Conjecture`，authors 为 `["OpenAI"]`，id 指向该 preprint 目录下的 paper.pdf），形式化登记在 `lean/formalization.yaml:1478--1480`：`comparator_config: ComparatorChallenges/Saxl.json`、`declaration: OAI.Saxl.saxl_conjecture`、`file: OAI/RepresentationTheory/Saxl/Main.lean`。

先补一条对第 7 节的实测修正：`OAI/RepresentationTheory/Saxl/` 目录里我数到 38 个 `.lean` 文件（列目录后逐行计数，结果 38），模块总行数 7558 与第 7 节一致，`Main.lean` 本身 128 行。第 39 个模块是 `ComparatorChallenges/Saxl.lean`，即 json 里 `challenge_module: ComparatorChallenges.Saxl` 指向的那个，它不在表示论目录下。[推测] 第 7 节说"39 模块严格线性 import 链"时把 challenge 模块也计入了链，这条我没法从 `Main.lean:1` 的单一 import 语句验证到底（它 import `OAI.RepresentationTheory.Saxl.StripReduction`，链的走向是逐个文件单 import，与"每文件只 import 前一个"的描述吻合）。

**(a) 逐字**

`Saxl.json` 全文的验收面：`"theorem_names": ["OAI.Saxl.saxl_conjecture"]`，`"definition_names": []`，`"permitted_axioms": ["propext","Quot.sound","Classical.choice"]`，`"enable_nanoda": false`。

`Model.lean:107--110`：

> `def SaxlConjecture : Prop :=`
> `∀ (m : ℕ), 1 ≤ m → ∀ (μ : YoungDiagram) (hμ : μ.card = (staircase m).card),`
> `0 < kronecker (canonicalTableau (staircase m) rfl)`
> `(canonicalTableau (staircase m) rfl) (canonicalTableau μ hμ)`

`CyclicTensor.lean:139--143`（含注释行）：

> `/- Every Specht type occurs in the specified staircase cyclic module. -/`
> `def CyclicSaxlConjecture : Prop :=`
> `∀ m, 1 ≤ m → ∀ (μ : YoungDiagram) (hμ : μ.card = (staircase m).card),`
> `∃ f : Representation.IntertwiningMap (spechtRep (canonicalTableau μ hμ))`
> `(staircaseCyclic m).toRepresentation, f ≠ 0`

`Main.lean:81--92`：

> `/- The strengthened cyclic form of Saxl's conjecture. -/`
> `theorem cyclic_saxl_conjecture : CyclicSaxlConjecture := by`
> `intro m hm μ hμ`
> `exact full_cyclic_support m hm μ (canonicalTableau μ hμ)`
> `theorem saxl_conjecture : SaxlConjecture := saxl_of_cyclic_support cyclic_saxl_conjecture`
> `theorem cyclic_saxl : CyclicSaxlConjecture := cyclic_saxl_conjecture`

`CyclicTensor.lean:145--150` 的桥：

> `/- A proof of cyclic support proves the original Kronecker-multiplicity target. -/`
> `theorem saxl_of_cyclic_support (h : CyclicSaxlConjecture) : SaxlConjecture := by`
> `intro m hm μ hμ`
> `apply (kronecker_pos_iff _ _ _).mpr`
> `obtain ⟨f, hf⟩ := h m hm μ hμ`
> `refine ⟨(staircaseToTensor m).comp f, ?_⟩`

`Main.lean:56--65` 的归纳载体：

> `/- Strong induction, including m=1 and every partition of the exact triangular size. -/`
> `theorem full_cyclic_support (m : ℕ) (hm : 1 ≤ m) (μ : YoungDiagram)`
> `(t : Tableau (staircase m).card μ) :`
> `∃ F : Representation.IntertwiningMap (spechtRep t) (staircaseCyclic m).toRepresentation, F ≠ 0 := by`
> `induction m using Nat.strong_induction_on generalizing μ with`

**(b) 对应关系补全**

tex 主定理 `thm:cyclic-saxl`（`dominance.tex:45--49`）拆成三段，逐段找 Lean 落点。

第一段量词 `For every $m\ge1$`。Lean 里是 `∀ m, 1 ≤ m →`（`CyclicTensor.lean:141`），即 $m\ge1$ **进了签名**，成为第一条假设。tex 把它写在自然语言里，Lean 必须显式携带，因为下游每个 `staircase m` 的性质（如 `staircase_colLen`）在 $m=0$ 时会退化。

第二段 `every partition $\lambda\vdash N_m$`。Lean 拆成两项数据加一项假设：`μ : YoungDiagram`（分拆本身）与 `hμ : μ.card = (staircase m).card`（尺寸方程）。尺寸方程作为 Prop 假设进入签名，但它同时是**构造性依赖**：`canonicalTableau μ hμ` 需要 `hμ` 才能造出该 Tableau，从而 `spechtRep` 才有输入。所以 tex 记号 `$\lambda\vdash N_m$` 在 Lean 里被摊成两层：类型那一层是 `YoungDiagram`（它自身不带尺寸信息），命题那一层是尺寸方程的证明，两层合起来才够 `spechtRep` 用，这是我在前几篇移植里反复遇到的同一种张力。

第三段谓词 `$S^\lambda$ occurs in $W_m$`。Lean 的版本是存在性陈述 `∃ f : IntertwiningMap (spechtRep (canonicalTableau μ hμ)) (staircaseCyclic m).toRepresentation, f ≠ 0`。tex 的 `occurs in`（成分）在这里被换成"存在非零交织映射"，二者在半单范畴里等价，而 Lean 依赖的正是第 12 节那条 `tools:dual-sign` 与半单性，只是它的机器化形态是 Mathlib 的类型类。`full_cyclic_support` 的输出形式与 `CyclicSaxlConjecture` 一致，说明整个证明的对外接口只有一种：给一个 Specht 型，交一个非零 map。`kronecker` 的数值定义 `0 < kronecker ...`（`Model.lean:109--110`）只在最外层的 `SaxlConjecture` 出现一次，经 `kronecker_pos_iff`（`CyclicTensor.lean:148`）折回存在性，此后全仓不再算重数（与第 7 节"从不计算维数"的观察一致）。

退回原猜想所需的额外一件东西是 `staircaseToTensor m` 及其单射性（`CyclicTensor.lean:114--137`，注释 `attribute [irreducible] staircaseToTensor` 在 126 行）。`saxl_of_cyclic_support` 的证据主体是 `refine ⟨(staircaseToTensor m).comp f, ?_⟩` 再对 `he` 用 `staircaseToTensor_injective m`（156 行）把"合成 map 为零"反推成"$f$ 为零"。tex 的对应处只有 `completion.tex:150--153` 那句 `Thus $W_m$ is a submodule of $S^{\rho_m}\otimes_\C S^{\rho_m}$`，一句话就把"循环模嵌入张量积"带过；Lean 必须把这个嵌入做成一个具体的单射交织映射并逐点证其单射。[推测] 这正是第 7 节列出的路线差异 1 的底层原因之一：论文默认包含关系已知，形式化里"包含"必须给证据。

留在 declaration 之外的东西，我列出六项并给出它们各自的藏身处。其一，$\rho_m^t=\rho_m$（`dominance.tex:35`）：不在任何签名里，被吸收进 `stairTableau`、`staircaseSwap` 与 `StaircaseSign.lean` 的引理。其二，对角作用的声明（`dominance.tex:42--43`、`introduction.tex:11--12`）：由 `spechtRep` 与 `tprod` 的定义内置。其三，基域 $\mathbb C$（`specht-tools.tex:9`）：由 `noncomputable section` 与 `Module ℂ` 类假设分散携带。其四，James 分类"清单完整"（`specht-tools.tex:91--93`）：只在 `saxl_contains_every_irreducible`（`Main.lean:96--104`）通过 `irreducible_equiv_specht` 出现，而那条定理**不在**验收面内。其五，半单性（`specht-tools.tex:99--100`）：以 Mathlib 类型类形式在 `cyclic_projection_support` 等处被使用（第 7 节差异 1）。其六，$q\le4$ 与"新增行"的计数口径（`completion.tex:129--133`）：Lean 换成 `η.colLen 0 ≤ bs.length`（`Main.lean:34--36`），即第一列高不超过带的条数，这个假设进了 `band_cut_support` 的签名，而它对应的 tex 命题在 `comb:positive-multiplicity` 的推导里。

验收面只有一条名字，这件事我起初当作琐碎，读完 `CyclicTensor.lean:146` 与 `Main.lean:88` 才改变看法：论文的"更强结论"（第 10 节整节在讲的那件事）在 Lean 侧**不被登记、不被验收**，`definition_names` 是空数组，连 `CyclicSaxlConjecture` 这个 Prop 名字本身都不在表里。`Main.lean:92` 的 `cyclic_saxl` 只是 `cyclic_saxl_conjecture` 的别名，同样未被登记。也就是说形式化的对外承诺与论文的自我定位在这一点上刻意不一致：把强化定理证出来是为了内部复用（伴随论文与归纳本身），而 comparator 只看原猜想。[推测] `enable_nanoda: false` 与单条 `theorem_names` 是同一取向的两面，评审面刻意收窄到最难伪造的一句。

**(c) 机械理由**

为什么 $m\ge1$ 必须进 Lean 签名而 tex 可以写在句子里。`full_cyclic_support` 的分支里 `ih (m-1) (by omega)` 与 `ih (m-2) (by omega)`（`Main.lean:73,76`）要把递减后的指标重新送进归纳假设，`by omega` 证的是"仍 $\ge1$"，这一步的可行性依赖当前 $m\ge2$ 或 $m\ge5$；`Main.lean:67--70` 先用 `staircase_one_dominates` 把 $m=1$ 挤掉再得到 `hm2 : 2 ≤ m`。第 10 节我论证过 $m\ge1$ 起点为何够，Lean 把同一论证变成了一个显式的算术引理加一次 `by_cases hd : Dominates (staircase m) μ` 分诊，两条分支对应 `dominated_support`、`strip_reduction`（`Main.lean:65--71`），与 tex 的 `prop:dominated` / `comb:strip-reduction` 一一对齐。

为什么尺寸假设不能省成 `μ.card = m*(m+1)/2`。`Main.lean:116--122` 的 `saxl_kronecker_pos` 里，作者写了 `∀ (n : ℕ) (hn : (staircase m).card = n) ...` 再用 `staircase_card m` 把 `(staircase m).card` 与字面次数 $m(m+1)/2$ 对接（122 行 `exact H _ (staircase_card m) hμ`）。这说明 Lean 内部统一用 `(staircase m).card` 这一形式，字面二次式只在最外层出现一次。[推测] 若把签名改成字面 `m*(m+1)/2`，每个需要 Tableau 尺寸匹配的地方都要补一次算术重写，`canonicalTableau` 的输入证明会长成 `Nat` 等式的链，代价远大于收益。

为什么 `f ≠ 0` ，并非 `Function.Injective f`。`CyclicTensor.lean:142--143` 与 `Main.lean:61--62` 都用非零性；`saxl_contains_every_irreducible`（`Main.lean:100--102`）才要 `Function.Injective F`，因为那里的源是抽象不可约表示 $\rho$，非零自不蕴含单。对 Specht 源，不可域 ⟹ 核为 0 ⟹ 单，所以"非零"够用且更省事；tex 全程说 `occurs`，与"非零 map 存在"这一较弱的形式对齐。第 7 节差异 5（检测方向相反）也建立在这一点上：Lean 只要造出一个方向的非零 map。

**(d) [推测] 候选失败路线**

一，若把 `theorem_names` 改成 `OAI.Saxl.cyclic_saxl`，验收面就退化成只检查强化陈述，而强化 $\Rightarrow$ 原猜想那一环（`CyclicTensor.lean:146--160`，依赖 `staircaseToTensor_injective`）落在检查之外，移植复核时会漏掉最容易错的一环。二，若 `definition_names` 里补上 `CyclicSaxlConjecture`，登记表会把一个 Prop 别名当验收对象，而它没有独立证明体，检查语义变模糊。三，若 `hμ` 被写成可派生的事实（例如把 `μ` 换成 `Fin (staircase m).card` 上的 Tableau 后反推 diagram），`spechtRep` 的输入形状改变，`full_cyclic_support` 的 `generalizing μ`（`Main.lean:63`）就要改成同时 generalize 尺寸证明，归纳结构可能塌成依赖具体 $\mu$ 的失败形式。

## 15. 我走过的错路

这一节记我自己读错、推错的地方，每条给出把错误顶回去的文本位置或必然失效的理由。论文没写的动机我一律标 [推测]。

一，我以为强化定理在量化范围上比原猜想大。`dominance.tex:47` 与 `introduction.tex:19` 逐字对读后，两个前缀同形（`For every $m\ge1$ and every partition $\lambda\vdash N_m$`），强化的全部内容是谓词换成"在 $W_m$ 里"。我原先把 `introduction.tex:27` 的 `uniform in both the staircase size and the constituent` 误读成"对更多尺寸一致成立"，那句话其实是在说没有例外尺寸、没有例外成分。

二，我把支配情形的平方刚性当成通用 Cauchy--Schwarz 论证。`dominance.tex:158--159` 的目标数 $\sum_{r=1}^{m}r^3$ 只在"第 $r$ 行长度 $=r$ 的重数也 $=r$"时与行下界逐行吻合；换成矩形形状，行长全相等而内容重数仍是 $(1,\ldots,m)$，求和不给出取等，第 7 步只剩"每行平均等于 $r$"，多个字存活、相消重现。第 3 节步 7 我写过这条 [推测]，现在升级为已核实的形状依赖。

三，我以为带成分的存在可以直接从 Brown--van Willigenburg--Zabrocki 的环境结果取。`introduction.tex:96--105` 逐字写着 `Our induction needs each of these constituents in the cyclic module of one prescribed band vector, rather than merely somewhere in that ambient square. Explicit nonzero pairings supply this additional generator-specific statement.` 论文自己把这条列成差异，而我在第 0 节只把它当作"暗示"。[推测] 我之所以容易滑过去，是因为 `prop:two-band` 的结论形式（`$S^\eta$ occurs in $U_{m,2}$`）与 BVZ 的结论形式看起来只差一个模的名字。

四，我以为高位置集合只要基数对就行。`band-quotient.tex:119--121` 由式 `band:margin-equality` 的前缀取等强制 $A=B_h$，而 `band-quotient.tex:188--189` 进一步要求 `the stabilizer of $D$ in $G$ is exactly $H$`。若只固定基数，$z$ 未必落在 $T_D$，$\Psi$ 的良定义（`band-quotient.tex:55--61`）与 $A_0=\widetilde W_h\boxtimes U_{m,s}$ 的识别（`band-quotient.tex:167--174`）同时失去依据，商映射根本造不出来。

五，我用全体均值代替前 $k$ 项均值去推前四行容量。`completion.tex:52--57` 的放缩是 `Because the parts decrease, the mean of the first four is at least the mean of the first $k$`，即 $\sum_{i\le4}\lambda_i/4\ge\sum_{i\le k}\lambda_i/k$。若用全体均值，右端会变成 $4N_m/\ell$，而 $\ell$ 可达 $m-1$，得到的界低于 $2m-1$，情形 (ii) 的宽 2 切割失去可行性。第 6.1 节我已标过这条 [推测]，此处确认 tex 用的是"前 $k$ 项"版本。

六，我以为 Lean 的登记名会是循环版本。`Saxl.json` 的 `theorem_names` 只有一条 `OAI.Saxl.saxl_conjecture`，`definition_names` 为空数组（第 14 节 (a) 已逐字抄出）。[推测] 这个选择与 `enable_nanoda: false` 一致，指向"验收面尽量小"的策略。

七，术语用错。本笔记第 5 节称"蛇形路径"，而我对六个分片做过不区分大小写的 snake 与 zigzag 检索，无命中，tex 的说法是 `Number its positions along the path`（`path-band.tex:22`）与 `path:positions`；同样，"循环多表"对应的是标题里的 `Cyclic Polytabloid` 与 `polytabloid` 一词（`specht-tools.tex:57,76,82`），tex 从未把"循环"与"多表"合成一个新术语，它说的是 `the cyclic module generated by`（如 `dominance.tex:66--67`）。派单里的"带商"、"扇区诱导"两词在 tex 里有对应物（`Band quotient`、`Induction from coordinate sectors`，`band-quotient.tex:70,32`），"扫除"对应 `full sweep`（`completion.tex:61,69`），"刚性"是我自己的词，tex 未用。

八，我曾以为四行检测里 $Q$ 的共轭是锦上添花。`path-band.tex:311--321` 的 Example 用 $m=3$、$\eta=(2,2,1)$ 给出 $B=12T$ 而 $[T]_{11}=0$，未共轭时配对确实为零；第 5.3 节我记过这条，但在推导 `prop:two-band` 时仍一度以为"$B$ 可逆就够了"。可逆只保证存在特征向量，$(1,1)$ 元非零必须由共轭送过去，这两件事之间的空隙就是那个例子存在的全部理由。

## 16. 逐字台账

下表的"位置"一栏一律是"分片名:行号"，全部由我在 `build/sections/` 与 `lean/OAI/RepresentationTheory/Saxl/` 里逐行核出；凡核不到的符号我已换成能核到的。表内绝对值一律写作 `\lvert\;\rvert`。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $N_m$ | $m(m+1)/2$ | introduction.tex:14 | $\lambda\vdash N_m$ 的量化范围（introduction.tex:19）与两条收支（completion.tex:38,75） | 支配分支与两情形分诊失去共同尺寸基准，归纳假设无共同语言 |
| $\rho_m$ | $(m,m-1,\ldots,1)$，满足 $\rho_m^t=\rho_m$ | introduction.tex:14；dominance.tex:35 | $V_R,V_C\cong S^{\rho_m}$（dominance.tex:36--41）与 $\phi:V_C\otimes\epsilon\to V_R$（110--112） | 扭转无法在两因子间搬运，步 5 与 `dom:alternating-line` 同时失效 |
| $B_m$ | $\{(i,j):i+j\le m+1\}$，基数恰 $N_m$ | dominance.tex:11--15 | $G_m=S_{B_m}$ 的定义、$R_m,C_m$ 两个分划（dominance.tex:16--24） | 位置集一改，$W_m$ 不再是 $S_{N_m}$ 模，`occurs in` 无从表述 |
| $w_m$ 与 $W_m$ | $\mathbb C[G_m](v_{R_m}\otimes v_{C_m})$ | dominance.tex:28--33 | `thm:cyclic-saxl` 的谓词（dominance.tex:48--49）、全篇归纳载体 | 换成环境张量积即丢掉"保留向量"，`band:generator-factorization` 无处投影 |
| $E_m$ | 字母表大小 $m$，基 $e_1,\ldots,e_m$ | dominance.tex:26--27 | 块交错 $v_A$ 要求块大小 $\le$ 字母数（specht-tools.tex:45--46） | 最大块恰为 $m$，少一个字母则 $v_A=0$，生成子直接消失 |
| $m\ge1$ | 唯一起点，$N_1=1$ | introduction.tex:19；completion.tex:88--89 | $W_1$ 为幺元群上一维模，基例闭合 | 起点一缺则强归纳无底，$m=1$ 只能由支配分支关掉 |
| $\epsilon$ | 一维符号表示 | dominance.tex:61--62 | `dom:signed-average`、`dom:twist-one-factor`、步 10 扭回 | 去掉扭转，$M^{\rho_m}$ 的成分识别方向不反转，支配用不上 |
| $H_R$ | $\prod_{i}S_{R_{m,i}}$，$\lvert H_R\rvert=\prod_{r=1}^{m}r!$ | dominance.tex:69--72；86 | $u\ne0$ 的系数计数（步 3）、$t_m$ 的稳定子（181--182） | 稳定子一旦大于 $H_R$，$Q(Z_m)=\mathcal M_\alpha$ 断，步 9 失效 |
| $\dim\operatorname{Hom}_{H_R}(\epsilon,\operatorname{Res} V_R)$ | 恰为 $1$ | dominance.tex:88--96 | 步 4"任何 $H_R$-交错向量都是 $v_{R_m}$ 的倍数" | 重数大于 1 时 $\phi(u\otimes z)=c\,v_{R_m}$ 不成，$Z_m$ 进不了像里 |
| $E_{\mathrm{out}}$ | 字母数 $2m-1$ | dominance.tex:127 | $q(e_a\otimes e_b)=f_{a+b-1}$ 的值域（128--131） | 只给 $m$ 个字母时 $q$ 需截断，等变性的"处处同一映射"论证断 |
| 内容 $\alpha$ | $(1,2,\ldots,m,0,\ldots,0)$，字 $r$ 出现 $r$ 次 | dominance.tex:133--136 | 投影到 $\mathcal M_\alpha$、步 9 与 $M^{\rho_m}$ 的同构（183--187） | 重排多重集要靠 `lem:young-rule` 末句的共轭子群论证补一步识别 |
| $\sum_j c_j=r^2$ | 每行一次矩 | dominance.tex:151--153 | 内容匹配的必要条件，与 $\sum r^2$ 的全局和配套 | 单靠一次矩只给行平均 $r$，钉不死逐格赋值 |
| $\sum_j c_j^2-r^3$ | 等于 $\sum_j(c_j-r)^2\ge0$ | dominance.tex:153--157 | 与全三角目标 $\sum r^3$（158--159）夹出逐行取等 | 换一次或三次矩，等号条件不再给出 $c_j=r$，存活字多于一个 |
| $t_m$ | $\bigotimes f_{m+1-i}$，唯一存活字 | dominance.tex:162--165 | 步 9 的轨道基 $\mathbb C[G]t_m=\mathcal M_\alpha$ | 存活字大于一个时系数需逐项比较，无相消论证失效 |
| $\operatorname{sgn}(\pi)\operatorname{sgn}(\omega_r\pi)$ | $(-1)^{\binom r2}$，与 $\pi$ 无关 | dominance.tex:166--173 | 步 8 的 $r!$ 项同号相加 | 符号一旦依赖 $\pi$，系数成带符号和，可能整体为零 |
| $Q(v_{R_m}\otimes v_{R_m})$ | 系数 $(-1)^{\sum_r\binom r2}\prod r!\ne0$ | dominance.tex:176--180 | `dom:permutation-quotient` 的满射性 | 系数为零则 $Q(Z_m)=0$，支配情形整段塌陷 |
| $s$ 与 $h$ | $s\in\{1,2\}$，$h=m-s\ge1$ | band-quotient.tex:9--13 | $D=B_h$、$F=B_m\setminus D$、$H=S_D\times S_F$ | $h\ge1$ 一破 $W_h$ 无定义；$s\ge3$ 则带块大小超四行检测覆盖 |
| $\lvert F\rvert$ | $s(2m-s+1)/2$，即 $m$ 或 $2m-1$ | band-quotient.tex:14 | 与 `comb:strip-reduction` 两分支移走盒数匹配（completion.tex:38,75） | 收支一错，余子大小不是 $N_{m-1}$ 或 $N_{m-2}$，归纳断链 |
| $p_s$ 与 $P_s$ | 逐位置同高保留投影 | band-quotient.tex:88--98 | 高位置刚性、$z=P_s(w_m)$（158--160） | 投影若逐位置不同，$P_s$ 不再与 $G$ 交换，商映射无从定义 |
| $r_i$ 与 $d_j$ | $\max(h+1-i,0)$、$\max(h+1-j,0)$ | band-quotient.tex:104--106 | 式 `band:margin-equality` 两端（108--112） | 计数一换形状，前缀不再取等，$A=B_h$ 的强制失效 |
| margin 前缀取等 | $\sum_{i\le k}r_i=\sum_j\min(k,d_j)$ 对每个 $k$ 成立 | band-quotient.tex:108--112 | `band:unique-high-set`（119--121），Ryser 引文在 123--125 | 只给不等式时高位置集不唯一，扇区直和与 $z\in T_D$ 同时断 |
| $(-1)^{ab}$ | 高字母先于低字母的逆序数 $a b$，$a=\max(r-s,0)$、$b=\min(r,s)$ | band-quotient.tex:128--140 | 行列成对抵消 $\prod_r(-1)^{2ab}=1$（147--151） | 不抵消则 $z$ 带依赖分块的符号，$\widetilde W_h\boxtimes U_{m,s}$ 的识别要重做 |
| $\Omega$ 与 $T_A$ | $\{A:\lvert A\rvert=\lvert D\rvert\}$，$T_A$ 为字坐标扇区 | band-quotient.tex:178--186 | `lem:sector-induction` 的假设 $T=\bigoplus_A T_A$（32--43） | 扇区基不相交一旦破坏，$\Phi$ 只剩满射，显式逆（55--58）无处安放 |
| $K$ | $2m-1$，奇数，$m\ge3$ | path-band.tex:21 | 收缩式与 `prop:two-band` 的 $\eta\vdash K$（245--247） | $K$ 为偶时首尾伴随结构改变，$a_1=b_K=1$ 的钉法失效 |
| $u$ 与 $u_{m,2}$ | 相差 $(-1)^{m-1}$，$m-1$ 为列对数 | path-band.tex:27--35 | 收缩式与配对式各带一个该符号，相乘为 $1$（116--122,271--274） | 若两处只出现一次，配对符号随 $m$ 奇偶漂移，Example 的 12 需重算 |
| $\{M_1,\ldots,M_4\}$ | $I,Z,T,J$，$\dim_\mathbb C V^*=4$，$Z^2=T^2=I$、$J^2=-I$ | path-band.tex:164--175 | 段长上限与"行数 $\le4$"的检测覆盖 | 基维数小于 4 则四行检测失去覆盖；大于 4 时交错和含重复基元素，$r!$ 同号论证断 |
| $A_{r,p}$ | $r!(-1)^{e-\delta}M_1\cdots M_r$ | path-band.tex:197--203 | 段表的可逆性与 `prop:two-band` 的 $B$ | 反交换或 $\operatorname{adj}$ 线性任一失效，各 $\pi$ 项不再同号，$r!$ 系数消失 |
| 段表 | $I,\pm2Z,-6J,\pm24I$（$r=1$ 到 $4$） | path-band.tex:204--212 | $B=A_{r_1,s_1}\cdots A_{r_c,s_c}$ 可逆（269--279） | 任一格奇异，凡含该列长的 $\eta$ 都检测不到 |
| $B$ 与 $Q$ | $B$ 可逆，取 $Q$ 使 $(QBQ^{-1})_{11}=\beta\ne0$ | path-band.tex:280--294 | 配对非零 $\Rightarrow\Phi\ne0\Rightarrow$ 满 | 不共轭时 $[B]_{11}$ 可为 $0$，Example 的 $12T$ 就是现成反例（311--321） |
| $b_i$ 与 $q$ | $\sum_{i\le q}b_i=K$，$b_i\ge1$，$q\le4$ | completion.tex:108--114 | $A$ 的 Young 子群分解与 $a_\eta$ 的链计数（112--114） | $b_i$ 子集不满 $F$ 时多出平凡因子，$\eta\vdash K$ 的口径与检测定理错开 |
| $a_\eta$ | 链 $\varnothing=\mu^{(0)}\subseteq\cdots\subseteq\mu^{(q)}=\eta$ 的计数 | completion.tex:112--128 | 正和式 $\sum_\eta a_\eta c_{\nu,\eta}^\lambda>0$ | 允许空带则 $q$ 不再界住行数，挑出的 $\eta$ 可超四行 |
| $c_{\nu,\eta}^\lambda$ | $\dim\operatorname{Hom}_{S_{B_m}}(S^\lambda,\operatorname{Ind}_{S_D\times S_F}^{S_{B_m}}(S^\nu\boxtimes S^\eta))$ | completion.tex:122--126 | 抽取同时满足 $a_\eta>0$ 与 $c_{\nu,\eta}^\lambda>0$ 的 $\eta$（133--134） | 若误当作一般 LR  machinery 使用，论文只声明了 Pieri 一行特化（specht-tools.tex:138--141） |
| $4\le k<m$ | 支配失败点下界，推出 $m\ge5$ | completion.tex:40--52 | 情形 (ii) 的可用性与 $m-2\ge3$ | $k\le3$ 若可能，前四行容量推不出来，宽 2 切割失去依据 |
| $\sum_{i\le4}\lambda_i$ | $>4m-2(k-1)\ge2m+4>2m-1$ | completion.tex:54--59 | 至多四次整扫加一次部分扫恰移走 $2m-1$（69--75） | 界若只到 $\ge2m-1$，末次部分扫可能无盒可移，余数不是 $N_{m-2}$ |
| 锐性例 | $m=13$、$\lambda=(8^{11},3)$、大小 $91$、失败于 $k=12$、$25$ 盒、$\nu=(8^7,7,3)$ 大小 $66$ | completion.tex:78--85 | 说明 $q\le4$ 不可普遍改小 | 删去不影响正确性，但会让人误以为三次带足够 |
| `CyclicSaxlConjecture` | $\forall m,\,1\le m\to\forall\mu\,\forall h\mu,\exists f\ne0$ | CyclicTensor.lean:140--143 | `saxl_of_cyclic_support`（CyclicTensor.lean:146--160） | 去掉 `hμ` 则 `canonicalTableau μ hμ` 造不出，`spechtRep` 无输入 |
| `SaxlConjecture` | $0<\text{kronecker}(\text{staircase},\text{staircase},\mu)$ | Model.lean:107--110 | `Main.lean:88` 的 `saxl_conjecture` | 换回 $\dim\operatorname{Hom}$ 表述需重走 `kronecker_pos_iff`（CyclicTensor.lean:148） |
| `full_cyclic_support` | 强归纳 `Nat.strong_induction_on generalizing μ` | Main.lean:58--80 | `cyclic_saxl_conjecture`（Main.lean:82--84） | `ih (m-1)` 与 `ih (m-2)` 的 `by omega` 一旦失去 `hm2`，$m=1$ 漏进情形 (i) |
| `band_cut_support` 的带假设 | `η.colLen 0 ≤ bs.length`（列高界，非新增行界） | Main.lean:34--36 | `strip_product_support`（Main.lean:39--41） | 与论文的"每条带至多加一行"混用会给出不同前提，移植时两侧不可互证 |
| 登记表验收面 | `theorem_names` 一条、`definition_names` 空 | formalization.yaml:1478--1480；Saxl.json | comparator 只看 `OAI.Saxl.saxl_conjecture` | 换成登记 `cyclic_saxl` 则强化到原猜想的桥（含单射性论证）脱离检查 |

依赖链四条，都是表里行的串联。

链一，三元数链。$m$ 定 $N_m=\frac{m(m+1)}2$（introduction.tex:14），$N_m$ 定 $B_m$ 的大小（dominance.tex:11--15），$B_m$ 的行斜线长定 $\rho_m=(m,m-1,\ldots,1)$（introduction.tex:14 与 dominance.tex:34），$\rho_m$ 再定两个 Specht 因子（dominance.tex:36--41）。同一条链倒过来读就是：$\rho_m$ 的行长度多重集与内容投影的重数多重集互为反序（dominance.tex:133--136 与 158--159），这个重合是三角数的直接产物，$N_m$ 一旦换成别的二次式，第 7 步的取等即散。

链二，生成子的规模。$m$ 定字母表 $\mathbb C^m$（dominance.tex:26），两层定字空间规模 $m^{2N_m}$（dominance.tex:28--33 的 $E_m^{\otimes B_m}\otimes E_m^{\otimes B_m}$），其中"每行一次矩 $r^2$、二次矩不低于 $r^3$"（dominance.tex:151--157）把参与计票的字筛到只剩 $t_m$ 一个；$t_m$ 的稳定子回到 $H_R$（dominance.tex:181--182），其阶 $\prod_{r=1}^{m}r!$（dominance.tex:86）同时是系数 $Q(v_{R_m}\otimes v_{R_m})$ 的绝对值（dominance.tex:176--180）。也就是说生成子的"阶"在这套证明里以两处不同的身份出现，尺寸相同、机制不同：一次是系数计数，一次是轨道基的规模。[推测] 论文没把这两处写成同一条观察，是我在列表时注意到的。

链三，LR 系数下标链。$\lambda\vdash N_m$ 的扫除决定 $b_1,\ldots,b_q$（completion.tex:108--114），$b_i$ 决定 $A$ 的 Young 子群与 $a_\eta$（completion.tex:112--128），$a_\eta$ 与 $c_{\nu,\eta}^\lambda$（completion.tex:122--126）的和式决定可选 $\eta$，$\eta$ 的行数上限 $\le q\le4$ 决定 `prop:two-band` 是否适用（path-band.tex:245--247）。链条上每一环都是计票，并非构造，环与环之间靠"和非零"这一条薄冰连接：把 $c_{\nu,\eta}^\lambda$ 换成任何需要额外选择的量，整链立刻断。

链四，归纳步被推进的参数。情形 (i) 推进的是 $m\to m-1$，同时把 $\lambda$ 换成 $\nu\vdash N_{m-1}$（completion.tex:15--16,96--99）；情形 (ii) 推进的是 $m\to m-2$ 与 $\lambda\to\nu\vdash N_{m-2}$（completion.tex:17--25,107）。真正被推进的实体是"余子的尺寸方程"，而 $q$、$b_i$、$\eta$ 都是当层的一次性数据、不进归纳假设；这与第 1 节"追踪生成子，并非环境支撑"的取向是同一件事的两面：归纳假设里携带的是 $(h,\nu)$ 与生成子，不带 $m$ 的其他信息。Lean 侧对应 `full_cyclic_support` 只 generalize `μ`（Main.lean:63），而 `band_cut_support` 把 $h,s$ 全部当显式参数（Main.lean:27--31），两者结构一致。
