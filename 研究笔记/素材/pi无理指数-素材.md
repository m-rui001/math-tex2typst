# 素材：《The irrationality exponent of π is 2》（OpenAI，2026-09-24）

> 用途：第一人称研究思维链复盘（带批注的证明重构级深度）。
> 素材来源：论文 tex 源码 `E:\math\preprints\The-irrationality-exponent-of-pi-is-2-September-24-2026\build\`（main.tex + sections/{interpolation,determinant,conclusion,series}.tex）；42 页思维 summary `E:\math\reasoning_traces\irrationality-exponent-of-pi.pdf`（已 pdftotext 提取为 p1/p11/p21/p31/p41 五段）。无 Lean 形式化。

> **导读（30 秒版）**：论文声称用"分离权多变量插值 + 插值行列式双界比较"证明 μ(π)=2 并推出 Flint Hills 级数收敛；证明的几何心脏是命题 2.3（曲线不等式），算术心脏是引理 3.1（Gauss 整数清分母），解析心脏是引理 3.3（同组重复 Taylor 次数强制相消）。42 页思维 summary 记录了 Part I 44 节为寻求 μ(π)<5/2 的大规模失败史（约 30 个辅助函数家族、多轮 Liouville 压力测试）、一次未展开的 "breakthrough possibility"（固定 Padé 次数）、以及 62/25 候选界的十节自我审计（含共享极点危险 "Danger e_C/h_C>1"）；Part II 从"方法而非结论"出发重跑出指数 2。正文与 summary 之间最大的一致性缺口：62/25 与全部审计数字不迁移；最大的技术风险点：解析–代数衔接（log→多项式替换）与相消均匀性。以下按"定理总览 → 逐引理带批注重构 → summary 时间线 → 可信度审计 → 常数参数表"展开。

---

## 一、定理总览

### 1.1 主定理（论文 Theorem 1.1）

对无理实数 x，无理数度 μ(x) = sup{ ν>0 : 0<|x−p/q|<q^{−ν} 对无穷多组互素整数 p,q（q≥2）成立 }。鸽笼原理给出 μ(x)≥2。

**定理 1.1**：μ(π)=2。更精确地：对每个实数 ν>2，存在整数 Q(ν)，使得对一切整数 p、q（q≥Q(ν)）有

  |π − p/q| ≥ q^{−ν}。

要点（原文明确强调）：
- 不等式对**未约简**的分数与零误差情形也成立（正文里靠"若 π 有理则精确表示给出任意大分母的零误差、与上界矛盾"来顺带证明 π 无理）。
- 阈值 Q(ν) **非有效**：证明用反证法 + 无效的插值阈值 H，不给显式常数。
- 指数 2 ≠ "一致正下界 c/q²"（即 ≠ 连分数部分商有界）。

### 1.2 推论

**推论 1.2（Flint Hills 级数）**：级数 Σ_{n≥1} 1/(n³ sin² n)（弧度制）收敛。

背景链条：Alekseyev 证明收敛**要求** μ(π)≤5/2；Meiburg 证明 μ(π)<5/2 **充分**。定理 1.1 供给这个条件（取任一 2<ν<5/2）。两者都未解决 5/2 边界的等号情形——本文绕过：直接取严格内点。

**推论 1.3（一般化判据）**：对固定实数 a,b>0，级数 Σ 1/(n^a |sin n|^b)（弧度制）收敛 **当且仅当 a > max{1, b}**。必要性用连分数收敛子 p_j/q_j 的 |sin p_j| ≤ |p_j−π q_j| < 1/q_j 导出 p_j^{b−a} 型不趋零项；充分性用同一 dyadic 间距论证。

### 1.3 方法一句话

**分离权多变量插值 + 插值行列式的算术/解析双界比较**：在 Y=e^t 这条对数曲线上取中心 c_{ji}=2ijπ·p_i/q_i（用.exceptionally good 逼近 p_i/q_i 近似 2π 的整数倍关系，j=0..K−1 为"行平移"指标），用分离权插值定理（权 w_i 在中心**选定之前**逐次选定）构造满射的 jet 插值矩阵，取含全部行的非零方子式；用 Gauss 整数（Z[i]）清分母得算术下界 log|Δ|/MH ≥ −(1−b̄)−E_ar；再把每行平移到**精确周期** 2πij（同一组行检验同一族整函数 f_{a,P}(z)=[u^a]P(e^z, z+u_1,…,z+u_m)），**同组内重复的 Taylor 次数强制行列式展开项相消**（Cauchy 展开 + 几何衰减），得解析上界的两个分支——多数行横截指标小则碰撞节省 −cΣn_a²（Cauchy–Schwarz 给 ≥ η²M²/D_A(H)），少数行指标大则小逼近误差以 ν(A(1−η)−b̄) 的幂进入；双情形与算术下界比较，参数选取得使上界严格更负，矛盾。维数 m、权、中心、逼近分母全部在次数 H→∞ **之前**固定，且权的选择与中心位置无关（"分离权"的核心，堵住循环选择）。

### 1.4 与已有工作的定位

- 定量上界谱系：Mahler 1953（42，后来 30）→ Mignotte 1974（21/20）→ Chudnovsky 1982（Hermite–Padé 渐近）→ Hata 1993（8.01604539…）→ Salikhov（7.606308…）→ Zeilberger–Zudilin 2020（7.103205334137…）→ Bai 2026-09（7.101862832357）。正文原话："These quantitative bounds are **context, not inputs** to our proof."——从 7.10 直接到 2 的跳变没有任何中间台阶，这是可信度问题的最大来源（见第四节）。
- 对 Carella（arXiv:1902.08817，声称 μ(π)=2 且部分商有界）的反驳放在脚注：在其 Theorem 8.1 的记号下，令 C = p_{n+1}−πq_{n+1}−1/q_n，由收敛子估计 |p_{n+1}−πq_{n+1}|<1/q_{n+2}<1/q_n 得 −2/q_n<C<0，于是大 n 时 sin C<0，与其论证中的正下界矛盾。注：此反驳只针对"更强命题（有界部分商）的展示证明"，不判定其指数 2 命题本身。
- Mantzakouras–López Zapata 的 Flint Hills 收敛声明于 2026 年 9 月撤稿（"its proof did not establish convergence or the asserted irrationality bound"）。本文引用它只为划界。
- 方法谱系：Laurent 1991 插值行列式、Laurent 2000 的 Taylor 展开消去机制、Roth 1960 多变量法中"逐次分离的逼近分母"、Philippon 1986 零点估计、Demailly 1992 的曲线正性→jet 生成、Esnault–Viehweg/Dyson 引理、Farhi 的 Roth 引理分离 multidegree。

### 1.5 记号约定（贯穿全文）

对数均自然；ii²=−1；ω=2πii；多重指标非负整数组，α!=∏α_i!，二项式系数按坐标定义（除非 β≤α 逐坐标，否则为 0）。对正有理权向量 W，monomial Y^hX^α 的 W-次数为 w_0h+Σw_iα_i；𝒫_W(H) 为 W-次数 ≤H 的多项式空间；𝒥_V(H) 为按 V-权 <H（**严格**）截断的形式 Taylor 系数包（商环 C[[t,u]] / (所有 V-权 ≥H 的级数)）。

---

## 二、逐引理带批注重构

> 每节结构：(a) 精确陈述；(b) 证明机制推导（到中间步骤）；(c) 假设/常数的机械理由；(d) 候选失败路线（标[推测]）。

### 2.1 定理 2.1（分离权插值，separated-weight interpolation）

**(a) 陈述。** 固定整数 m,K≥1 与正有理数 w_0,v_0,θ，0<θ<1，满足体积假设

  K·θ^m < 1,  K·(w_0/v_0)·θ^m < 1.  (式 2.1，geom:volume-hypotheses)

则存在正有理数 w_1,…,w_m 的**逐次下阈值**（只依赖上述固定数据与已选的更小指标权，不依赖插值点位置），使得取 W=(w_0,w_1,…,w_m)，V=(v_0, w_1/θ,…,w_m/θ) 后：对任意点 a_j=(1,c_{j1},…,c_{jm})∈C^{m+1}（0≤j<K，每个 i 的坐标 c_{0i},…,c_{K−1,i} 两两不同），jet 映射

  𝒫_W(H) → ⊕_{j=0}^{K−1} 𝒥_V(H),  P ↦ ( P(1+t, (c_{ji}+u_i+log(1+t))_{i=1}^m) )_j   (式 2.2)

对所有"充分大且充分可除"的 H **满射**。可除性要求只用权即可选；最后一个 H 的下阈值可以依赖点。

**(b) 证明机制。** 三步：曲线不等式（命题 2.3）→ blow-up 上的 nef/ample → Serre 消没给满射。

1. *形状约定*：插值中心在"常数坐标 Y=1 的图"内，横截坐标 X_i 沿对数曲线 t↦c_{ji}+log(1+t) 偏移。这是为了让后面 determinant 节里的行恰好是沿 e^z 的 Taylor 检验（见 3.2 节批注）——几何节只需知道中心在仿射空间里、横截坐标有 log Y 的平移结构。
2. *代数化*：把 log(1+t) 在每个坐标里换成固定 Taylor 多项式 G_i(t)（截断误差的 t-权 > v_i）。批注（论文自证）：该替换保持 h_P（分支接触量，见命题 2.3），因为在分支上要么 t≠0，此时被省略项的 ord/v_i 严格大于 ord(t)/v_0；要么 t≡0，尾部恒零。它还保持每个有限系数包上的插值满射：形式坐标变换固定 t、只以权 >v_i 的项改动 u_i，与其逆在有限系数包上互为三角同构。**这一步是"解析对数→代数多项式"的衔接点，也是整个证明最脆的一环**（第四节点名的审查对象之一）。
3. *曲线不等式→ideal*：在 a_j 处做有限余长度理想 I_j=(t^{R/v_0},(u_1')^{R/v_1},…,(u_m')^{R/v_m})，u_i'=X_i−c_{ji}−G_i(t)，R 选大使 R/w_a、R/v_a 均为正整数。点互异 ⇒ 这些局部理想加上图外的单位理想拼成 X 上连贯理想层 I。对过中心的分支，ord_P I = min_a (R/v_a)·ord_P z_a = R·h_P（式 2.7，z_0=t, z_i=u_i'）——**ord I 恰好线性于分支接触量**，这是曲线不等式能翻译进几何的关键恒等式。
4. *blow-up 与 nef*：p:X′→X 为 I 的普通 blow-up（Rees 代数的相对 Proj），I·O_{X′}=O(−E)。取 A=p*L（L=O_X(1) 由所有 W-次数 ≤R 的 monomial 嵌入；该图里常数 monomial 的图恰是原仿射空间）。两个度数换算：deg(L|_C)=R·deg_W C（式 2.8：在每个点清最大极点后，各 monomial 极点阶 ≤R×式 2.6 的 max，纯幂取等）；E·Γ=R·Σh_P。于是命题 2.3（deg_W C ≥ (1+σ)Σh_P）给出 **A−(1+σ)E 是 nef**：对未收缩曲线 A·Γ−(1+σ)E·Γ=R(deg_W−(1+σ)Σh_P)≥0；收缩曲线 A-度零且 −E 相对丰富故正；避开仿射图的曲线避开 E。
5. *ample*：对大 a>1，aA−E ample（构造性证明：取 b 使 I⊗L^b 全局生成，Rees 构造把 X′ 嵌入 X×P^r，第二超平面层限制为 bA−E，再加第一很丰富层得 (b+1)A−E ample）。然后恒等式

   A−E = [(a−1)/(a(1+σ)−1)]·(A−(1+σ)E) + [σ/(a(1+σ)−1)]·(aA−E)  (式 2.10)

   把 A−E 写成 nef 正倍数 + ample 正倍数 ⇒ A−E ample（Lazarsfeld Cor. 1.4.10，对射影概形成立、**不需要 blow-up 光滑**）。
6. *消没→满射*：Rees 代数的分层件与相对消没给 p_*O(−nE)=I^n、R^q p_* O(−nE)=0（q>0，n≫0；用的是**普通幂** I^n，不涉积分闭包、不对小 n 声明）。投影公式+Leray+Serre：H¹(X, I^n⊗L^n)=H¹(X′,O(n(A−E)))=0。由 I^n 的正合列，H⁰(X,L^n) 打满所有局部 mod I^n 系数数据；有限余长度局部商在完备化下不变 ⇒ 这些代数类就是定理要的形式系数数据。最后 I^n ⊆ {权 ≥nR 的局部级数}（每个生成元权恰 R），故"mod I^n 满射"推出"打到更小的目标（权 <nR 的包）满射"。H=nR，撤回 Taylor 多项式替换即得式 2.2 满射。

**(c) 假设的机械理由。**
- K·θ^m<1：行数（≈K·θ^m·H^{m+1}/((m+1)!v_0∏w_i)）的**密度**小于列数密度 ⇒ 体积上有多余系数。这是"满射在计数层面可能"的一阶条件。
- K(w_0/v_0)θ^m<1：同一比较在"条件数/系数数"以 v_0 计权时也成立；两者分别在曲线论证第一段（整体）、第二段（Y=1 纤维内）用到。
- V=(v_0,w_i/θ)：接触（order）权比次数权细 θ 倍，使得曲线不等式里的 (1+σ) 松弛与 θ<1 的余量互相咬合——细的接触权意味着同一接触量 h_P 对应更大的真实阶，从而"接触超额"更容易被检测出来。
- 权逐次选择：式 (2.5) 分离条件 ∏_{a∈A}w_a > C_*∏_{b∈B}v_b（对基数相同的 A,B⊆{0,…,m}，对称差最大正指标属 A）——当最大相异指标为 i 时该条件是 w_i 乘以一个只依赖**更低**权与固定 w_0,v_0 的表达式（更高指标要么两边都有、比值为 θ，要么都没有），故可从 i=1 起逐次取足够大的 w_i，且后续选择不破坏已成立者。**整个过程不涉及任何插值点**——这就是"权先于中心"的统一性。
- σ 的三条不等式 (2.3)：(1+3σ)^{m+1}K(w_0/v_0)θ^m<1、(1+3σ)^m Kθ^m<1、(1+σ)θ<1，分别对应曲线论证第一段计数、第二段计数、最后的 θ^{−1}>(1+σ) 收尾；由 (2.1) 取 σ 充分小即可。C_*=max_{1≤k≤m} 2k!(L_0/σ)^k（L_0=m+2）吸收引理 2.2 里的 2k!ε^{−k}，ε=σ/L_0。

**(d) 候选失败路线。**
- [推测] **解析-代数衔接失效**：第 2 步的 G_i 替换声称"保满射"依据是三角同构。若权 v_i 与截断指标 T_i 的搭配在某 H 的整除类上出现非三角项（例如 log(1+t) 的展开与 t=Y−1 的复合在中心 y≠1 处产生非常数零阶项），则 jet 包的识别失败。本文通过固定中心图 Y=1（t 是局部坐标）规避；对"中心不在 Y=1 图内"没有声明，但定理也只对 a_j=(1,·) 陈述——自洽。
- [推测] **nef 论证中被收缩/奇异曲线的遗漏**：A−E nef 的验证遍历"未收缩/收缩/避开图"三类曲线，依赖 p 在中心外是同构与 −E 相对丰富。若 X′ 在奇异纤维上存在既不映到仿射图、又有 E-度正的曲线，第一步度数换算 deg(L|_C)=R·deg_W C 需在完备正规化上逐点验证；论文用"清最大极点后无公共零点"论证，机制成立，但该论证对**非正规** X 的-section 层是否良定着墨不多（论文自辩"ordinary projective schemes and the ordinary blow-up; smoothness or normality will not be needed"）。
- [推测] **可除性陷阱**：H 需"充分大且充分可除"，可除性只由权决定。若 R 的选取（清 w_a、v_a 的分母）与 I_j 的指数 R/v_a 之间出现 parity 类冲突（如 v_0 有理分母与 nR 的倍数类不匹配），满射会在某个剩余类上失效；论文用"n 充分大"吸收，但未展示具体的整除引理，这是数值复核的候选点。

### 2.2 引理 2.2（加权横截重数比较，weighted transverse multiplicity）

**(a) 陈述。** 给坐标 x_1,…,x_d 正有理次数权 ρ_1,…,ρ_d。在 C^d 的一个开集上设 D_1,…,D_d 为交换解析向量场构成标架，赋正有理代价 κ_1,…,κ_d；固定 ε>0，N>0。设多项式 f_1,…,f_r 的加权次数 ≤N，Z 为其公共零点集的不可约分支、余维 k≥1，且"导数持续性"：

  D^γ f_ℓ|_Z = 0 只要 Σ_b κ_b γ_b < εN  (式 2.9)。

则对任意坐标法基 A 与任意 D-场法基 B（各含 k 个元素）：

  ∏_{a∈A} ρ_a ≤ 2·k!·ε^{−k}·∏_{b∈B} κ_b  (式 2.10)。

界对全部数据一致，**不需要 N 的下阈值**。

**(b) 证明机制。** 两个局部长度估计夹逼：
1. *下界（流坐标 + 单项式理想）*：在 Z 的光滑点 x（两种法基条件同时成立、不含其他分支）沿 B 的场流得局部解析坐标 (z,b)，b 为横截流参数；交换性使所选场恰是 ∂/∂b 方向导数。于是式 2.9 说明 f_ℓ(z,b)=Σ_α f_{ℓ,α}(z)b^α 中所有 B-权 <εN 的系数在 Z 的邻域上恒零。取穿过 x、固定 A 外坐标的仿射切片 S（横截于 Z，限制方程的零点在 x 孤立），b 是 S 的正则解析坐标。代入不会生成缺失的低权项：每个存活项已含权 ≥εN 的 monomial b^α，其解析系数只有 b 的非负幂。故限制方程的理想含于权 ≥εN 的单项式理想，商长度 ≥ #{α: Σκ_b α_b<εN}。
   论文给了一个漂亮的**精确计数**（把 1/2 因子去掉）：单纯形 {x∈R^≥0^k: Σκ_b x_b<εN} 被以容许整点 α=⌊x⌋ 为指标的半开单位立方体 α+[0,1)^k **不交覆盖**，体积 =(εN)^k/(k!∏κ_b)。故下界 (εN)^k/(2k!∏κ_b) 对一切 N>0 成立（实际上论文论证到无 1/2 也成立，保留 1/2 作安全余量）。解析局部坐标保长度，无需流映射的半径/系数界。
2. *上界（加权 Bézout）*：在 k 维切片的正规局部环里，限制方程理想是极大理想的准素理想；C 无穷 ⇒ 取 k 个足够一般的常系数线性组合仍以 x 为孤立公共零点（逐次泛组合避开剩余的正维分支），其理想含于原理想，商长度是原长度的**上**界。每个组合在 A-变量中加权次数 ≤N。取整数 M_0 清 ρ_a 分母，作代换 x_a=λ_a+z_a^{M_0ρ_a}（λ_a 选得无分支前像），有 ∏(M_0ρ_a) 个前像、每个局部交局长度相同；代换后普通总次数 ≤M_0N；用孤立完全交零点的普通 Bézout（局部重数=商长度，完成化不变；引 Mondal）得长度和 ≤(M_0N)^k。除掉 M_0^k 得上界 N^k/∏ρ_a。
3. 合并：(εN)^k/(2k!∏κ) ≤ N^k/∏ρ ⇒ 式 2.10。

**(c) 常数的机械理由。** 2k!ε^{−k}：k! 与 2 来自单纯形计数，ε^{−k} 来自"持续性阈值 εN"对 N 的齐次性；k 个泛组合对应余维 k。**一致性（常数与 f、Z、解析标架无关）是本引理的真正卖点**：命题 2.3 里嵌套零点链的分支 Z 会随 N 变化，只有在"无 N 阈值 + 常数一致"时才能对每个 N 反复套用。

**(d) 候选失败路线。**
- [推测] **泛组合在解析范畴的选点**：常系数线性组合"逐次避开正维分支"在复解析集上要对**不可数**多分支类作归纳；论文诉诸"Noetherian 性 + C 无穷"（多项式环的素分支只有可数多），机制成立但写法略快——若 Z 非约简或方程在切片上退化为零恒等式，准素性论证需重新检查（f_ℓ 在切片上恒零的情形被"Z 是分支、x 孤立零点"排除，但该排除依赖切片选取与 Z 横截）。
- [推测] **Bézout 引用的精确性**：Mondal 的 Corollary VIII.3 是射影交环语境；这里用其"局部重数=完成化商长度"部分。若某个 z_a^{M_0ρ_a} 代换在所选 λ 处**分歧**，前像数减少但每个长度不变——论文已用"选 λ 无分歧"处理，属于机械可修。
- [推测] **解析标架的法基存在性**：D-场法基 B 的存在性要求 D 场的像模 Z 切空间张满法空间；命题 2.3 的用法是在"公共光滑开集"上同时取 A、B，论文以"指标集只有有限多种，可在同一开集上检查所有一般秩条件"带过——若某指标组合的法基只在空开集上存在，论证退化为空真，反而安全；真正的风险是 B 的存在集合与 A 的不交（有限多个条件的公共非空开性，机制标准）。

### 2.3 命题 2.3（曲线不等式，curve inequality）

**(a) 陈述。** 取 σ 充分小满足三条不等式 (2.3)（见上），v_i=w_i/θ（i>0），L_0=m+2，C_* 同上，权 w_1,…,w_m 按式 (2.5) 逐次分离。设 C 为一般点落在仿射坐标图内的不可约代数曲线，在其光滑射影模型上定义

  deg_W C = Σ_P max{0, −ord_P Y/w_0, −ord_P X_1/w_1, …, −ord_P X_m/w_m}  (式 2.6)

（恒零坐标的阶记 +∞，不贡献极点）。对过 a_j 的分支 P，

  h_P = min{ ord_P(Y−1)/v_0, ord_P(X_1−c_{j1}−log Y)/v_1, …, ord_P(X_m−c_{jm}−log Y)/v_m }  (式 2.7)

（log 为 Y=1 处的形式展开；非常曲线上 min 有限）。则

  deg_W C ≥ (1+σ)·Σ_{P↦a_j} h_P  (式 2.11)。

**(b) 证明机制。** 反证 + "超额接触→大量导数在 C 上为零→嵌套零点链平台→法基比较→坐标纤维化→逐层归约到一点"。
1. *辅助多项式的存在*：若式 2.11 失败，对充分大 N，线性代数给出非零 F_N、W-次数 ≤N、在所有点上 V-阶 ≥(1+3σ)N。计数：系数数 ~ N^{m+1}/((m+1)!∏w_a)，条件数 ~ K(1+3σ)^{m+1}N^{m+1}/((m+1)!∏v_a)；比值由 (2.3) 第一条 <1 控制。**不需要条件独立**——只用到条件数<系数数。
2. *接触→导数消没*：在 Y≠0 上取交换标架 D_0=Y∂_Y+Σ∂_{X_i}，D_i=∂_{X_i}（式 2.12；形式坐标下 D_0=(1+t)∂_t）。D 保多项式次数；D_a 微分使加权阶至多降 v_a。故 D^γF_N（Σv_aγ_a≤σN）在每个点仍阶 ≥(1+2σ)N，在分支 P 上阶 ≥(1+2σ)N·h_P。多项式限制到 C 的完备模型上总极点度 ≤N·deg_W C；既然假设式 2.11 失败，总零点阶超过极点界，除子等式强制 D^γF_N|_C=0（式 2.13，Σv_aγ_a≤σN）。此处所有"分支阶"断言对形式幂级数成立：每个 monomial 阶 ≥权×h_P，相消只增阶。
3. *嵌套零点链找平台*：δ=σN/L_0；V_r = 代价 ≤rδ 的导数的公共零点集（Y≠0 内），r=0..L_0=m+2。链递减，式 2.13 把 C°（C 在此仿射开集内的部分）放进 V_{L_0}。取含 C° 的不可约分支并向上嵌回各 V_r；每个被选分支维数在 1..m 之间（含曲线、含在 F_N 的真零点集内）。共 L_0+1=m+3 层 ⇒ 有相邻两层重合，记该持续分支为 Z，k=codim Z。于是"更低层方程 + 任何代价 <δ 的进一步导数在 Z 上为零"。对引理 2.2 取 ε=σ/L_0 得式 (2.14)：∏_{a∈A}w_a ≤ C_*∏_{b∈B}v_b 对一切法基对 A,B——与分离条件 (2.5) 直接冲突的结构由此产生。
4. *Y 在 Z 上为常*（第一情形：某正坐标方向横截于 Z，取最大指标 i）：任一坐标法基含 i；若某 D-场法基不含 i，则两集的最大正相异指标为 i，(2.5) 与 (2.14) 矛盾。故每个 D-场法基都含 D_i=∂_{X_i}；其余 D-场向量张不满法商，其环境张成是超平面 ker(dX_i−dY/Y)，故 T_Z⊆ker(dX_i−dY/Y)，即 **dX_i=dY/Y 在 Z 上**。若 Y 非常，取 dY≠0 的光滑点、过它作一般代数超平面切出 Y 非常的曲线，在其光滑完备模型上 dY/Y 有极点/零点处留数 ord_P Y≠0，而恰当微分 dX_i 处处零留数——矛盾。故 Y 常且 X_i 常。
5. *第二情形*：所有正坐标方向切于 Z ⇒ m 个独立向量 ∂_{X_i} 全在切空间，properness 强制切空间是它们的张成，dY=0 于 Z。两情形都得 Y|_Z 为常；C°⊂Z 且过 Y=1 的指定点 ⇒ Y≡1 于 C°，稠密性给出 Y≡1 于 C。
6. *Y=1 纤维内收尾*：在纤维 Y=1 中次数权为 w_i、阶权为 v_i=w_i/θ，h_P=min_i ord_P(X_i−c_{ji})/v_i。取新的 m 元辅助多项式 G_N：条件/系数之比 → K(1+3σ)^m θ^m <1（(2.3) 第二条）。同一套"导数消没+零点链"在维数 m 里跑，得 Z′ 的余维 1≤k≤m−1（G_N≠0 排除全维）。此处坐标法基与 D-场法基**相同**，必须唯一（两套不同基可排序使最大相异指标属 A，与 (2.5) 矛盾）——唯一法基含某指标 i ⇒ 切空间 ⊆ker dX_i ⇒ X_i 在 Z′ 上为常。**坐标互异性**（每个 i 上 c_{ji} 两两不同）⇒ Z′ 至多过一个指定点；而 C 的指定点都在 C°⊂Z′ ⇒ C 至多过一个指定点，设为 a_j。取 C 上非常的坐标 X_l，则 X_l−c_{jl} 的总极点度 ≤w_l·deg_W C，而在过 a_j 的分支上阶 ≥(w_l/θ)h_P，故 deg_W C ≥ θ^{−1}Σh_P > (1+σ)Σh_P（(2.3) 第三条），与"式 2.11 失败"矛盾。∎

**(c) 结构批注。**
- 这是整个证明的**几何心脏**，本质是加权、多中心、奇异概形版的 Seshadri 型曲线不等式（Demailly 式 "curvewise positivity ⇒ jet generation"）。论文明确声明并在正文里补出了加权理想、多中心、可能奇异方案上的全部过场（普通幂而非积分闭包、Rees 消没、Lazarsfeld nef+ample）。
- 维数记账：曲线不等式的"面积"来自 **(m+1) 维**单纯形（Y 与 X_1..X_m 共享一个次数预算），而收尾在 **m 维**纤维里做，多出的 (1+σ) 因子由 θ^{−1}>(1+σ) 供给——"曲率"从哪里来的几何直觉：对数曲线 Y=e^t 使 Y-方向与 log-平移方向的接触互换率是 1，而次数/阶权之比 θ<1 制造不对称。
- (2.5) 与 (2.14) 的对偶：前者说坐标权乘积"大"、后者说"小"，冲突的前提是**存在**法基对 A,B 使对称差落在受控指标上。第一情形的论证是"坐标含 i ⇒ 任何 D-法基必含 i"（否则冲突），第二情形是"基唯一"——两种穷尽对应 Z′ 余维 <m（有切向坐标）与可能的极值情形。
- **nef/ample→jet 满射的机制**（衔接定理 2.1）：曲线不等式 ⇔ A−(1+σ)E nef ⇔ A−E ample（正组合）⇔ H¹(I^n⊗L^n)=0 ⇔ 全局多项式打满局部 jet。中间每个箭头都在射影概形层面成立、不假设光滑，这正是 summary 里 §32–34 反复重建的链条（"It rebuilt affine Cech exactness, Serre-type vanishing and positivity"）。

**(d) 候选失败路线。**
- [推测] **"至多一个指定点"的收尾漏洞**：第二段（纤维内）的 Z′ 由 G_N 的导数零点链产生，Z′ 含 C°。若 C 在 Y=1 纤维外还有指定点——不可能，指定点 a_j=(1,·) 全在纤维内。但若 C 在纤维 Y=1 中的部分 C° 非不可约/含嵌入点（C 奇异于指定点），"取非常坐标 X_l、在过 a_j 的分支上估计阶"需要对每个分支分别成立再求和；论文的求和式直接对 Σ_{P↦a_j} h_P 进行，机制成立，但"分支"定义为 C 的光滑模型上的点，需 C 在 a_j 上的原像点数与 h_P 的定义一致——这是可查但论文未展开的细节。
- [推测] **两段论证权制的切换**：第一段用 (w_0; w_i)，第二段只用 (w_i) 且把 Y 固定。若 Z（第一段平台）与 Z′（第二段平台）重叠方式使 (2.14) 的法基含指标 0（Y-方向）而第二段无法基含 0，则在边界 k=m（Z′ 为纤维中的超曲面截口）处可能双计；论文以"1≤k≤m−1"排除，依赖 G_N≠0 在纤维内的真零性——若 C° 恰是 G_N 的一个不可约分支且维数 m−1 的情形被"两相邻层重合"论证吸收，需确认 G_N 的辅助次数 N 与 F_N 的 N 独立选取（论文取"new auxiliary polynomial"，机制上是独立的）。
- [推测] **(1+2σ)N·h_P 与极点度的比较**：D^γF_N 在分支上的阶 ≥(1+2σ)N·h_P 用了"每个 monomial 阶 ≥权×h_P"。这是 min-型权的基本性质（V-权 ≤s 的包 ⇒ 阶 ≥h_P·V-权），但相消可能使**某个** D^γF_N 的实际阶更高——这只会帮助论证方向（更多消没），不构成失败；真正的潜在失败是若 log Y 的形式展开在分支 P 上 Y≡1（t≡0 情形）时 X_i−c_{ji}−log Y 的阶由 u_i' 决定而 Y−1 阶无穷，min 的定义仍良定（论文注明"所有条目阶为正、可能无穷，min 在非常曲线上有限"）。

### 2.4 引理 3.1（算术下界，arithmetic lower bound）

**(a) 陈述。** 本节固定除 H 外一切参数。记 wα=Σw_iα_i，w_*=min_{i>0}w_i，ω=2πii。设 ν>2，整数 p_i、q_i≥2 满足

  |π−p_i/q_i| ≤ q_i^{−ν},  w_i=⌈log q_i⌉,  r_i=2ii·p_i/q_i  (式 3.1)

（p_i≠0），且 m,K,w_0,v_0,θ,w_1..w_m 满足定理 2.1 假设，中心 c_{ji}=j·r_i。取 F_0>2/θ，截断

  T_i=⌈F_0·w_i/v_0⌉,  G_i(t)=Σ_{1≤k<T_i} (−1)^{k+1}t^k/k  (式 3.2)。

（首个省略项权 v_0T_i ≥ F_0w_i > w_i/θ，替换 u_i↦u_i+G_i(t)−log(1+t) 可逆、保权滤过、在每个权 <H 的有限系数空间上可逆——故替换 log 后定理 2.1 的满射仍在。）以 monomial 列 Y^hX^α（w_0h+wα≤H）与行 ρ=(j,s,β)（v_0s+wβ/θ<H）组矩阵，行元素为 P(1+t, jr_1+G_1(t)+u_1,…,jr_m+G_m(t)+u_m) 中 t^s u^β 的系数。对充分大、充分可除的 H 取含全部行的非零方子式 Δ_H（定理 2.1 保证存在），尺寸 M，记 b̄=(1/MH)Σ_ρ wβ（式 3.3）。单纯形格点计数给

  M ~ Kθ^m·H^{m+1}/((m+1)!·v_0·∏_{i=1}^m w_i),  0 ≤ b̄ ≤ θ  (式 3.4)。

令 Λ=4log2，

  E_ar = ΛF_0m/v_0 + ΛΣ_i 1/w_i + θ/w_*  (式 3.5)。

则**每个**这样选出的子式满足

  log|Δ_H| / MH ≥ −(1−b̄) − E_ar  (式 3.6)。

**(b) 证明机制。** 清分母 + Gauss 整数非零下界：
1. 令 L_i=lcm(1,…,T_i−1)，D_H=∏_i L_i^{⌊H/w_i⌋}。列 Y^hX^α 乘 ∏q_i^{α_i}、行 (j,s,β) 乘 ∏q_i^{−β_i}。缩放后元素为零（除非 α≥β 逐坐标）或等于 ∏C(α_i,β_i)·[t^s](1+t)^h·∏(q_i(jr_i+G_i(t)))^{α_i−β_i}；关键恒等式 **q_i·j·r_i = 2ii·j·p_i ∈ Z[ii]**——逼近误差不出现在清分母后的算术里（它在解析侧才出场）。G_i 系数在 L_i^{−1}Z 中 ⇒ 元素分母整除 ∏L_i^{α_i−β_i} | D_H。整体乘 D_H 后矩阵在 Z[ii] 上、行列式非零，非零 Gauss 整数模 ≥1：
   log|Δ_H| ≥ −M·log D_H − Σ_{列}Σ_i α_i log q_i + Σ_{行}Σ_i β_i log q_i  (式 3.7)。
2. 列的代价：所选列 Σα_i log q_i ≤ wα ≤ H（每列至多 H）。行的收益：0≤w_i−log q_i<1 ⇒ 行项 ≥ MH·b̄ − Σβ_i ≥ MH·b̄ − MH·θ/w_*（行的 β-质量上界 b̄≤θ 来自单纯形体积的形状——β 的 w-权被 H/θ 以下截断）。
3. lcm 上界 log lcm(1..n) ≤ Λn（Λ=4log2）：素数幂 ℓ<p≤2ℓ 的对数素权计入 C(2ℓ,ℓ)，后者其余项非负 ⇒ 跨 dyadic 区间 lcm 对数增量 ≤2ℓlog2；加总到大于 n 的最小 2 的幂，≤4nlog2。于是 log D_H/H ≤ ΛΣ_i T_i/w_i ≤ ΛF_0m/v_0 + ΛΣ_i 1/w_i。代入式 3.7 即得。

**(c) 常数的机械理由。** (1−b̄) 是主算术代价：b̄ 是行 β-权的单纯形平均值，行被 q_i^{−β_i} 缩放后"赚回"的 q_i 幂平均正是 b̄；算术上"最贵"的行是 β 小的行。E_ar 三项：ΛF_0m/v_0 来自截断对数分母（T_i~F_0w_i/v_0，共 m 个坐标）、ΛΣ1/w_i 来自 log q_i 与 ⌈log q_i⌉ 的圆整、θ/w_* 来自行的 β-质量与 log q_i 的差。**w_i=⌈log q_i⌉ 是把逼近质量换算成权的一次同调**：逼近越好分母越大权越大，行数 M 随 ∏w_i 增大反而变小——这正是第 4 节参数选择的张力来源。

**(d) 候选失败路线。**
- [推测] **非唯一子式的下界依赖**：定理只说存在非零方子式，引理声称"每个"入选子式都满足下界——因为清分母论证对任何含全部行的方子式一致成立（M 行全用），这点成立；但若 Z[ii] 中"非零 ⇒ 模 ≥1"在行列式经列缩放后产生**额外** q_i 幂公因子未被行缩放抵消，式 3.7 的行项收益会被高估。论文的缩放是列乘 q^α、行乘 q^{−β}，净效果=行列式乘 ∏q^{α}·∏q^{−β}，而式 3.7 恰把两项分开估计——机制自洽。
- [推测] **lcm 引理的素数幂边界**："素数幂 ℓ<p≤2ℓ 的权计入 C(2ℓ,ℓ)"要求 p 的最高次幂 p^a∈(ℓ,2ℓ] 时 p^a | C(2ℓ,ℓ)；当 2ℓ < 2p^a 时成立（v_p(C(2ℓ,ℓ))=进位次数），边界 ℓ=p^a/2 附近的进位恰为 1 次可用——机械可查但论文未给出显式验证，属可复核点。
- [推测] **中心互异的退化**：c_{ji}=jr_i 两两不同（每个 i 固定）要求 r_i≠0（p_i≠0，由充分大的 q_i 保证）且 j 值互异；若 p_i/q_i 使 2iip_i/q_i 与某 jr_{i'} 重合无妨（定理只要求逐坐标互异）。零误差逼近（π 有理情形）在 q→∞ 时 |ε_i|=0，G_i 截断仍有效——论文在末节用"π 有理 ⇒ 精确表示与上界矛盾"单独处理，机制闭合。

### 2.5 引理 3.2（精确行平移，exact row translation）

**(a) 陈述。** 对每个多重指标 a 与所选列 P 定义**整函数**

  f_{a,P}(z) = [u^a] P(e^z, z+u_1, …, z+u_m)  (式 3.8)

对 monomial P=Y^hX^α 显式为 f_{a,P}(z)=C(α,a)e^{hz}z^{|α|−|a|}（a≤α 时；否则 0）。每个行 ρ=(j,s,β) 是至多

  Q_H=(⌊H⌋+1)^{2m}(⌊H/v_0⌋+1)  (式 3.9)

个形如 ([t^ℓ]f_{a,P}(jω+log(1+t)))_P（a≥β, wa≤H, 0≤ℓ≤s）的行向量的标量倍之和；出现于指标 a 的每个标量 ξ 满足

  log|ξ| ≤ −ν·w(a−β) + H·E_tr，E_tr = ν/F_0 + log2/v_0 + (log4+log(2K)+ν)/w_*  (式 3.10)。

**(b) 证明机制。** 令 ε_i=j(r_i−ω)（小逼近误差，|ε_i|≤2Kq_i^{−ν}≤2Ke^ν e^{−νw_i}）、τ_i(t)=G_i(t)−log(1+t)（截断尾）。因 e^{jω}=1，式 3.3 的代换可写成 Y=e^z、X_i=z+u_i+ε_i+τ_i(t)，z=jω+log(1+t)。先按 u 展开、再按常数 ε 与尾 τ 展开得**精确的行向量恒等式**（式 3.11），所有标量因子与列 P 无关 ⇒ 可直接用行列式多线性。尾的乘积消失阶 ≥Σd_iT_i ⇒ 非零项满足预算 Σd_iw_i ≤ (v_0/F_0)Σd_iT_i ≤ v_0s/F_0 < H/F_0（式 3.12）。|τ_i| 在 |t|=1/2 上 ≤Σ2^{−k}/k≤1，Cauchy 给尾系数 ≤2^k≤2^s；二项式乘积 C(a,β)C(a−β,d)≤4^{|a|}、|a|≤H/w_*；合并即式 3.10。项计数：a、d 每坐标 ≤H（w_i≥1）、k≤H/v_0。

**(c) 机制批注（关键一步）。** 这里发生了一件事：**行从"中心 c_{ji}"被精确平移到周期 jω=2πii·j**，代价是每行分裂为 Q_H 个"检验整函数在 jω 处 Taylor 系数"的行。同一 a 的所有行检验**同一族**整函数 f_{a,P}——这是引理 3.3 相消的前提；而指标 a≥β 的"下三角"结构与标量里的 −νw(a−β) 正是**逼近误差 p_i/q_i↔2π 的 ν-幂收益入口**：a−β 大的行收益 e^{−νw(a−β)}，即解析上界把小逼近误差"吃"进行列式。F_0>2/θ 保证截断尾预算 (H/F_0) 严格小于可用权余量。

**(d) 候选失败路线。**
- [推测] **ε_i 的 ν-幂与 w_i 的圆整**：|ε_i|≤2Kq_i^{−ν} 用了 |π−p_i/q_i|≤q_i^{−ν} 且 |r_i−ω|=2ii(p_i/q_i−π) 的模；2K 因子来自 j≤K−1。若逼近误差定义在**未约简**分母上（q_i 可非本原），q_i^{−ν} 的估计仍对（更强），安全。
- [推测] **Q_H 的计数与相消均匀性**：Q_H 是 a、d、k 的格点粗界；在命题 3.4 中 log Q_H/H→0 需 M→∞ 由固定参数保证。若 m 固定后 H 的"充分可除"类迫使 M 停在小值，ε_H 不趋零——论文在 3.4 节用"先固定一切、再让 H→∞"的次序声明处理，但"充分可除"类的存在性由定理 2.1 的可除性（只依赖权）承担，两处可除性要求须同时满足：潜在的一致化缺口。
- [推测] **log(1+t) 在 |t|=1/2 的收敛**：log(1+t)=Σ(−1)^{k+1}t^k/k 在 |t|≤1 收敛（t=−1 条件收敛），|t|=1/2 上 τ_i 的界 Σ_{k≥T_i}2^{−k}/k≤1 是粗而安全的；真正的边界情形是 t=1 处 z 的定义域，Cauchy 估计在 |t|=1/2 圆上取系数、检验点 jω+log(1+t) 的模 ≤2π(K−1)+log2<50K=R/2，留给引理 3.3。

### 2.6 引理 3.3（碰撞估计，collision estimate）

**(a) 陈述。** 从引理 3.2 的每个行展开中选一个已平移的检验行、去掉标量因子，得方阵 T；设 n_a 为指标 a 的行数。取 c=log2/4，

  E_hol = 100K/w_0 + log2/v_0 + log(200K)/w_*  (式 3.13)

则存在 ρ_H→0（**与所有行选择及所选列无关**），使

  log|det T| ≤ −c·Σ_a n_a² + MH·(E_hol+ρ_H)  (式 3.14)。

**(b) 证明机制。** Taylor 展开相消（Laurent 2000 机制在组内的使用）：
1. 整函数的界：式 3.8 的显式形给 |f_{a,P}(z)|≤exp{H(R/w_0+log(2R)/w_*)}=:𝒟_H（|z|≤R，R=100K）。展开 f_{a,P}(z)=Σ_d c_{a,d,P}(z/R)^d，Cauchy 给 |c_{a,d,P}|≤𝒟_H。
2. 行的位置：检验行是阶 ℓ≤s、中心 j 的 (z/R)^d 系数检验；|jω+log(1+t)|≤2π(K−1)+log2<50K=R/2（|t|=1/2），故其在 (z/R)^d 上的值模 ≤2^ℓ·2^{−d}。
3. **相消的核心**：按幂级数行展开行列式（绝对收敛：系数行列式 ≤M!𝒟_H^M，Σ2^{−d} 收敛）。若两行有相同的 (a,d)，其系数向量 (c_{a,d,P})_P **相同**，该和项为零。于是每个非零和项在每组 a 内的 Taylor 次数 d 两两不同 ⇒ Σ_行 d ≥ Σ_a C(n_a,2)。
4. 几何衰减分配：把 2^{−d} 的衰减"用一半"做下界、另一半自由求和：|det T| ≤ M!·𝒟_H^M·2^{MH/v_0}·2^{−(1/2)Σ_a C(n_a,2)}·(1−2^{−1/2})^{−M}。用 Σn_a=M 与 ρ_H=(log M+(log2)/4−log(1−2^{−1/2}))/H 即得；ρ_H→0 由式 3.4（M 随 H 的多项式增长）保证。

**(c) 常数的机械理由。** c=log2/4：来自"一半衰减"2^{−(1/2)ΣC(n_a,2)}，因 ΣC(n_a,2) ≥ (Σn_a²−M)/2，指数里 2 的 log2/4·Σn_a²。100K：检验点模 <50K 加倍的安全余量，保证 Cauchy 圆覆盖所有中心。E_hol 三项分别来自 𝒟_H 的 h·R/w_0 部分（exp H·R/w_0）、log(2R)/w_*、与 2^{MH/v_0} 的 Taylor 阶预算。**均匀性（ρ_H 与行选择无关）**使命题 3.4 能对 Q_H^M 个项选择统一取界。

**(d) 候选失败路线。**
- [推测] **同一 (a,d) 两行"系数向量相同"的精确性**：两行若来自**不同 j**（不同中心 jω）但同 (a,d)，行向量的 d 次 Taylor 系数检验的是同一 c_{a,d,P} 在**不同中心**的取值 2^{−d}(z₀/R)^d 的系数——按幂级数行展开后，"行"是 (c_{a,d,P})_P 的线性泛函，线性泛函由 (a,d) 与标量 (z₀(j)/R)^d 决定；同 (a,d) 不同中心的两行泛函**成正比**（标量不同），行列式仍为零——机制成立，但论文的表述"their coefficient vectors agree"把中心标量藏在行向量定义里，读者需自行确认 (t^ℓ) 检验展开后每行确为 (c_{a,d,P})_P 的纯标量倍。这是行文最压缩的一处。
- [推测] **绝对收敛与 M! 因子**：M!𝒟_H^M 被吸进 ρ_H（log M/(H)→0 需 M 次多项式于 H）；若定理 2.1 的"充分大 H"类上 M 超多项式（例如可除性类稀疏使可选 H 跳跃），ρ_H 不趋零——依赖式 3.4 的 M~H^{m+1} 渐近，该渐近要求 H 沿可除类趋于无穷，机制成立但两处可除性需相容（同 2.5(d)）。
- [推测] **"一半衰减"的分配**：Σ_行 d 的下界用一半 2^{−d}、另一半求和到无穷给 (1−2^{−1/2})^{−M}——若某行的 ℓ 大（最高 H/v_0），2^ℓ 因子已在 2^{MH/v_0} 里被**整体**计入而非按行，逐行的 2^ℓ 分布不均时总界仍成立（上界方向），仅损失常数；安全。

### 2.7 命题 3.4（行列式比较，determinant comparison——双情形）

**(a) 陈述。** E_an=E_tr+E_hol。取 0<A<1（横截权截断 AH）与 0<η<1（行比例）。记

  g = ν(A(1−η)−θ) − (1−θ),  L = η²Kθ^m / ((m+1)v_0A^m)  (式 3.15)。

若

  g>0,  E_ar+E_an<g,  cL > 1+E_ar+E_an  (式 3.16)

则式 3.1 的逼近与定理 2.1 的插值假设不能同时成立。

**(b) 证明机制。** 展开与双情形统一上界：
1. 记 D_A(H)=#{a: wa≤AH}（m 维单纯形计数 ~(AH)^m/(m!∏w_i)），L_H=η²M/(H·D_A(H))→L（用式 3.4）。
2. 按引理 3.2 展开行列式：给定项选择 (a_ρ)，标量因子乘积 ≤exp{−νΣw(a_ρ−β_ρ)+νMH·b̄+MH·E_tr}；项选择至多 Q_H^M 个；对每个选择用引理 3.3。
3. **情形一（≥ηM 行有 wa≤AH）**：这些指标落在 ≤D_A(H) 个值里，Cauchy–Schwarz：Σn_a² ≥ (ηM)²/D_A(H) = MH·L_H。标量主指数 −νΣw(a_ρ−β_ρ)≤0（a≥β），弃之得每项 ≤−cL_H+E_an+ρ_H（除以 MH 后）。
4. **情形二（>(1−η)M 行有 wa>AH）**：Σw(a_ρ)≥MH·A(1−η)，弃碰撞项得 ≤−ν(A(1−η)−b̄)+E_an+ρ_H。
5. 统一（先取绝对值再求和）：

   log|Δ_H|/MH ≤ E_an+ε_H+max{−cL_H, −ν(A(1−η)−b̄)},  ε_H=ρ_H+log Q_H/H→0  (式 3.17)。

   均匀性（引理 3.2、3.3 对行选择一致）使 max 对所有 Q_H^M 个选择成立。
6. **与下界碰撞**：b̄≤θ 时第二支与 (1−b̄) 的差 ≥g：ν(A(1−η)−b̄)−(1−b̄)=νA(1−η)−1−(ν−1)b̄ ≥ ν(A(1−η)−θ)−(1−θ)=g。于是式 3.16 下两支加 E_an+ε_H 都严格 < −(1−b̄)−E_ar（第一支用 L_H→L 与 1−b̄≤1，第二支用一致间隙 g），与引理 3.1 的式 3.6 矛盾。∎

**(c) 结构批注。** 这是"两条不相容估计"的标准插值行列式结构，但两个分支的来源不对称：**情形一**的节省来自几何/组合（碰撞 cL→∞ 随维数增长，见 4.1 的 L=η²(B/A)^m/2(m+1)→∞）；**情形二**的节省来自算术（逼近误差 ν-幂）。max 结构= "两支都要低于下界"，等价于要求 g>E_ar+E_an 且 cL>1+E_ar+E_an。**g>0 即 ν(A(1−η)−θ)>1−θ**，是"算术收益超过行主代价"的一阶条件——summary §36 里"ν(A−θ)>1−θ ⇒ 阈值趋 2"的来源。

**(d) 候选失败路线。**
- [推测] **"先取绝对值再求和"**：式 3.17 在展开求和前对每项取 |·|，丢掉一切相消——这是保守方向（上界只会更松），但意味着若 E_an+ε_H 与主项的间隙太小，实际行列式可能有额外相消使上界更小；不影响矛盾成立，只影响 margin 的解释。
- [推测] **情形一的 D_A(H) 计数与"指标 ≠ 行"**：n_a 是行数而 D_A(H) 是指标数；ηM 个行分布到 D_A(H) 个指标上，Cauchy–Schwarz 的下界 (ηM)²/D_A(H) 是**最优情形**（均匀分布）；若分布更偏，Σn_a² 更大、对论证有利。安全。
- [推测] **b̄≤θ 的锐性**：b̄ 是行的 wβ-权平均除以 H，行区域 v_0s+wβ/θ<H ⇒ wβ<Hθ，故 0≤b̄≤θ 是体积形状的直接推论（β 单纯形沿 θ 压缩）。若行定义改为非严格不等号，边界格点贡献 O(H^m) 于 M~H^{m+1} 中可忽略——论文用 Riemann 和/边界零体积论证处理，机制成立。

### 2.8 引理 4.1（参数选择）

**(a) 陈述。** 对每个实数 ν>2，存在正有理数 θ,A,B,C 使

  0<θ<A<B<1,  ν(A−θ)>1−θ,  C>1,  B<1/C,  B<Cθ<1  (式 4.1)

并可再选 0<η<1 使 g:=ν(A(1−η)−θ)−(1−θ)>0  (式 4.2)。

**(b) 证明机制。** 取有理 b∈(1/2, 1−1/ν)（ν>2 保证区间非空），小有理 δ>0，令 θ=1−δ、A=1−bδ。则 ν(A−θ)−(1−θ)=(ν(1−b)−1)δ>0（b<1−1/ν），且 θ−A²=(2b−1)δ−b²δ²>0（b>1/2）⇒ A²<θ ⇒ 区间 (A/θ, 1/A) 非空（因 A/θ<1/A ⇔ A²<θ）。取有理 C 于其中：A>θ ⇒ C>1；θ<A ⇒ Cθ<θ/A<1。再取 B∈(A, min(1/C, Cθ))。η：式 4.2 左端在 η=0 处为 ν(A−θ)−(1−θ)>0，严格性给小 η>0。∎

**(c) 三个比率的角色**（论文自注）：ν(A−θ)>1−θ 供给**逼近误差间隙**（g>0）；A²<θ 允许 A/θ<C<1/A，从而选出 B 使 CB<1（误差 100K/w_0=(CB)^m·C^{-m}… 衰减）、Cθ/B>1（v_0~2(Cθ/B)^m→∞ 吸收 m）、B/A>1（碰撞 L=η²(B/A)^m/2(m+1)→∞）。**这三个指数不等式是"维数换 margin"的全部引擎**。

**(d) 候选失败路线。**
- [推测] **θ 接近 1 的退化**：δ→0 时 θ→1、v_0=2Kθ^m w_0 与 K=⌊C^m⌋ 的竞争要求 (Cθ)^m<1 严格对一切 m——Cθ<1 由构造保证但余量 (1−Cθ) 随 δ→1−A/… 而变薄，m 的下界（cL>2 等）随之指数增大；非障碍，只影响无效性。
- [推测] **η 的双角色冲突**：η 同时出现在 g（要求小）与 L（要求不太小）里；式 4.2 取 η 小有利于 g、式 3.16 第三条 cL>1+E 与 η² 成比例要求 η 不太小——论文先用 margin ε_0=min(g/2,1/2) 分配三段误差（ν/F_0<ε_0/3 等），η 只需固定一次，机制自洽；但若 E_ar+E_an 无法压到 g 以下（第 5 节的维数平衡失败），整套无解。

### 2.9 第 4 节：主定理的组装（Theorem 1.1 的证明骨架）

固定 ν>2 与式 4.1/4.2 参数，ε_0=min(g/2,1/2)，取 F_0>2/θ 使 ν/F_0<ε_0/3。维数参数：

  K=⌊C^m⌋,  w_0=B^{−m},  v_0=2Kθ^m w_0  (式 4.3)

（可除性验证：Kθ^m≤(Cθ)^m<1、K(w_0/v_0)θ^m=1/2 恰好满足式 2.1——**注意 w_0/v_0=1/(2Kθ^m) 使第二条取等**）。极限：K/w_0≤(CB)^m→0、v_0~2(Cθ/B)^m→∞、m/v_0→0（式 4.4）；碰撞增长 L=η²Kθ^m/((m+1)v_0A^m)=η²(B/A)^m/2(m+1)→∞（式 4.5）。取 m 大到 (ΛF_0m+2log2)/v_0+100K/w_0<ε_0/3 且 cL>2（式 4.6）。**固定 m 与 K,w_0,v_0。** 然后逐次选逼近 p_i/q_i（式 4.7：ΛΣ1/w_i + (θ+log4+log(2K)+ν+log(200K))/w_* < ε_0/3；先给每个 w_i 统一下界（Σ1/w_i≤m/w_*），再加逐次几何阈值；分母无界假设保证可行）。误差总和恰好为

  E_ar+E_an = ν/F_0 + (ΛF_0m+2log2)/v_0 + 100K/w_0 + ΛΣ1/w_i + (θ+log4+log(2K)+ν+log(200K))/w_*

三段各 <ε_0/3 ⇒ <ε_0 ≤ g；cL>2>1+E_ar+E_an。命题 3.4 全部假设成立，矛盾。最后 μ(π)≥2 由鸽笼（0,π,…,Nπ mod 1 给 |π−p/q|≤1/q²、约简后同）＋已证上界 ⇒ μ(π)=2。**次序纪律**：维数→权→中心（逼近分母）→然后才 H→∞；权阈值与中心无关堵循环选择。

### 2.10 第 5 节：Flint Hills（引理 5.1 dyadic 间距、推论 5.2、推论 5.3）

**(a) 引理 5.1**：α 无理，若对某 c>0、1<ν<5/2 有 ‖qα‖≥c·q^{1−ν}（q≥1），则 Σ 1/(q³‖qα‖²)<∞。
证明：固定 K，d=c(2K)^{1−ν}；K≤q<2K 的点 qα（mod 1）彼此圆距 ≥d（差整数 |q−q′|<2K 用假设 + 1−ν<0）、与 0 距 ≥d。半圆上按距 0 递增排列：第 j 个距离 ≥jd。故 Σ_{K≤q<2K} 1/(q³‖qα‖²) ≤ (2/K³d²)Σj^{−2}=O(K^{2ν−5})；2ν−5<0，dyadic 求和收敛。

**(b) 推论 5.2（Flint Hills）**：取 2<ν<5/2，定理 1.1 给 ‖qπ‖≥q^{1−ν}（q≥Q）；有限例外并入 c=min({1}∪{q^{ν−1}‖qπ‖:q<Q})>0。再按"最近的 n≈qπ"分组：n 最近的非负整数 q=n/π 的四舍五入，组内整数 ≤4 个、n≥πq/2、|sin n|=|sin(n−qπ)|≥(2/π)‖qπ‖（正弦凹性），组贡献 ≤(8/π)·1/(q³‖qπ‖²)。求和即收敛。

**(c) 推论 5.3（判据 a>max{1,b}）**：充分性同一 dyadic 论证（∑_{K≤q<2K} q^{−a}‖qπ‖^{−b} 的半圆排序给三种 K-幂，均负）；再换组。必要性：a≤1 时 |sin n|≤1 与 Σn^{−a} 比较发散；1<a≤b 时取收敛子 p_j/q_j，|sin p_j|≤|p_j−πq_j|<1/q_j、p_j≤(π+1)q_j 终归成立 ⇒ 1/(p_j^a|sin p_j|^b) > p_j^{−a}q_j^b ≥ (π+1)^{−b}p_j^{b−a}，a=b 时不趋零、a<b 时趋于无穷。**注意**：此推论只需要 μ(π)=2 的推论 ‖qπ‖≥cq^{−1−ε}（任取 ε>0），这是定理 1.1 的直接形式；也正因如此 5/2 边界的非有效阈值不碍事。

**(d) 候选失败路线。**
- [推测] **引理 5.1 的"半圆排序"边界**：无正整数倍 α 落在半圆端点（否则 α 有理/半整数误差为整数），依赖 α 无理——定理 1.1 恰先证明了 π 无理，次序正确。
- [推测] **组划分中 q=0 的有限组**：n<π/2 的有限多项，sin n≠0 由 π 无理保证——同样依赖次序。
- [推测] **推论 5.3 的 (2/π) 凹性常数在 b>1 时的自举**：|sin x|≥(2/π)x 只在 [0,π/2]；组内 n−qπ 可能落入 [π/2,π]，用 |sin|对称性与 n−qπ≤π/2 的"最近倍数"取法保证——机制成立，边界取整需 n∈[qπ−π/2, qπ+π/2]，与"nearest nonnegative integer to n/π"的定义一致。


### 2.11 行列式的几何记账：列单纯形与行单纯形的对偶（补充批注）

整个第 3 节的定量骨架可以压缩成**两个单纯形的体积比**与**一个组内碰撞项**，值得单独摆平：

- **列单纯形**（维数 m+1）：{(h,α): w_0h+wα≤H}。体积 ~H^{m+1}/((m+1)!·w_0·∏w_i)。列的算术代价来自 Σα_i log q_i≤H（每列）——即列的 α-部分最多贡献一整个 H。
- **行单纯形**（维数 m+1）：{(s,β): v_0s+wβ/θ<H}。体积 ~K·θ^m·H^{m+1}/((m+1)!·v_0·∏w_i)（对 j=0..K−1 求和给因子 K；θ^m 来自 β 沿 θ 压缩）。行的"收益"来自 β-权平均 b̄∈[0,θ]。
- 两者共享同一个 ∏w_i 因子：**逼近分母的权同时压缩列数与行数**，故在 M 与 b̄ 里抵消，剩下的比较是 K·θ^m·(w_0/v_0) 对 1 的比较——这正是定理 2.1 的第二条体积假设。这不是巧合：插值满射的可行性（定理 2.1）与行列式的尺寸记账（式 3.4）是同一个单纯形体积的两次出现。
- **碰撞项**是第三种记账：ηM 个行挤进 D_A(H)~(AH)^m/(m!∏w_i) 个指标里，Cauchy–Schwarz 的 (ηM)²/D_A(H) 与 M 的比 L_H=η²M/(H·D_A(H))→L=η²Kθ^m/((m+1)v_0A^m)。代数上 L 的分子（Kθ^m）来自行单纯形、分母（v_0A^m·(m+1)）来自指标单纯形——**m+1 维行数对 m 维指标数**的维数差正是 L→∞ 的来源（第 4 节把它实现为 (B/A)^m/2(m+1)）。这就是正文引言"Comparing the row count in dimension m+1 with the transverse-index count in dimension m produces a collision saving that can grow with m"的确切含义。
- **相消的强制机制**（引理 3.3 的"强制"从哪来）：行列式展开按幂级数行进行后，每个非零求和项是"每行选一个 (a,d,ℓ)"的选择函数；若两行选中同 (a,d)，两行作为 (c_{a,d,P})_P 上的线性泛函全等 ⇒ 该项行列式为零。于是非零项必须是"组 a 内 d 互异"的选择，而 d 的可用范围又受 |z₀|<R/2 的 Cauchy 衰减 2^{−d} 约束——非零项要么付出 ΣC(n_a,2) 的 Taylor 阶、要么在情形二中让大 a 的行付出逼近误差 ν-幂。**强制来自"全等列不可区分"，而非来自任何非零性引理**：这是与经典 Padé 论证（需要显式非零性）最大的结构差异，也是 summary §16 里"unit residual determinant could not remove the integral obstruction"教训的反面运用。

### 2.12 次序结构与循环风险清单（第 4 节的纪律）

正文重复了三次的次序声明可以列成一张 DAG：

  ν（给定）→ (θ,A,B,C,η)（引理 4.1，纯有理运算）→ m（式 4.6，两个不等式）→ K,w_0,v_0（式 4.3）→ w_1..w_m 的**分离阈值**（定理 2.1 的逐次构造，与中心无关）→ 逼近子 p_i/q_i（式 4.7 的逐次几何阈值，分母无界假设保证可行）→ 中心 c_{ji}=jr_i 与 G_i 截断（式 3.2）→ H→∞（命题 3.4 内部的极限）。

每个箭头的"只依赖前面"性质对应一个潜在循环风险：
1. 权阈值 ← 中心位置：被定理 2.1 的"下阈值只依赖固定数据与已选权"堵死。summary §20–21 的多轮失败（"Roth-style separated approximants and two modular cusps sought expansion gaps"）正是没有这层统一性时的形态。
2. 逼近子 ← 行列式的成功与否：反证法结构使逼近子只需满足式 3.1，不需要知道行列式行为——与 summary §9 里"add approximation-specific contacts"式的构造性依赖（循环风险）根本不同。
3. m ← 逼近子：式 4.6 的 m 选择只用到 ν 与参数，不用到具体逼近子；随后"分母无界 ⇒ 任何有限阈值可满足"。**这是"62/25 论证"与"指数 2 论证"的分水岭**：前者在 summary 里反复出现 "Insufficient low-index saving required increasing dimension before fixing approximants" 的挣扎（§32），后者把这一挣扎写成了严格的引理次序。
4. H ← 一切：定理 2.1 与式 3.4 都要求 H 沿固定参数的极限；两处"充分可除"类的相容性（见 2.5(d)）是残余风险。

### 2.13 各引理的"承重墙"一览（复盘用）

| 引理 | 承重墙（若倒则全塌） | 次承重 |
|---|---|---|
| 定理 2.1 | 权先于中心的统一性；G_i 替换保满射 | Rees/Serre 消没对奇异概形 |
| 引理 2.2 | 常数一致 + 无 N 阈值 | 单纯形立方体覆盖计数；加权 Bézout |
| 命题 2.3 | 曲线不等式 (2.11)；两段论证的穷尽 | 嵌套零点链平台；(2.5)–(2.14) 冲突 |
| 引理 3.1 | q_i·j·r_i∈Z[ii]；非零 Gauss 整数 ≥1 | Λ=4log2；b̄ 的行收益下界 |
| 引理 3.2 | 行恒等式与列无关（可多线性）；尾预算 (3.12) | Q_H 计数；E_tr 各项 |
| 引理 3.3 | 同 (a,d) 行全等 ⇒ 零项；均匀 ρ_H | R=100K 覆盖；一半衰减分配 |
| 命题 3.4 | 双情形 max 结构；b̄≤θ 的间隙 g | L_H→L；ε_H→0 |
| 引理 4.1 | A²<θ ⟺ 区间 (A/θ,1/A) 非空 | b∈(1/2,1−1/ν) 非空 ⟺ ν>2 |
| 引理 5.1 | dyadic 间距排序 | 2ν−5<0 |

---

## 三、summary 时间线（重头戏）：42 页思维链复盘

> 说明：summary 是 OpenAI 对内部推理链的"summarized chain of thought"，Part I（§1–44）为寻求 μ(π)<5/2（Flint Hills 收敛）的长途失败史并最终声称 62/25=2.48 的逼近界；Part II（§45 起）另起炉灶声称 μ(π)=2，明确"不假设早前逼近界"。pdftotext 提取的 VERBATIM EXCERPT 有符号丢失（π、ν、θ 等希腊字母被抽空），下文引号内为原样或按上下文补回符号（以〔·〕标注补回）。

### 3.1 Part I 失败清单（按章节，附卡点原文 + 机制解读 + 映射）

**§1 辅助形式与反复出现的高度壁垒。** Catalan 行列式、arctan Padé、Salikhov 复端点、Chudnovsky 级数（有理高度与平方根消去代价）全部碰壁。多变量 Roth 提案被 Liouville 级数暴露越界：
> "Testing a multivariable Roth proposal against Liouville series exposed overreach." 及 VERBATIM："Then Roth would give exponent〔2 for〕all numbers."（若该法对所有超越数成立则与 Liouville 数矛盾——非凭空适用。）
BBP：最小公倍数增长（[4]）；Calegari–Dimitrov–Tang 无界分母定理 [7] 警告积分非同余展开；椭圆延拓找共同目标遇到 nuisance periods、缩放与 Wronskian 规范化障碍。

**§2 维数收益被非零性与算术代价抵消。** 对角熵陷阱 VERBATIM：
> "Thus all constructed F likely vanish identically on diagonal, not just at r. Need derivative transverse directions to escape. Exactly entropy trap."
（构造的多项式在平衡对角上恒零——只有对角上的值被用掉，"熵"全花在对角方向。这正是后来正文里"横截变量 u_i"存在的原因。）维数 vs codim VERBATIM：
> "Roth height threshold far tinier than analytic contact codim. This kills approach by dimension alone."
体积障碍 VERBATIM："Filtration cannot contradict pure volume. Must exploit link across levels or additional algebraic/arithmetic structure not captured by per-level count."（滤过计数不可能反驳纯体积论证——每层计数不看跨层关联。）

**§3 接触预算、熵壁垒、逆矩构造。** 相位调节循环 VERBATIM：
> "Thus phase tuning and divisibility jointly equivalent to approximant existence already; can't constructive via simple continuity."
（可除性+相位条件联合等价于逼近子存在性本身——用连续性构造是循环的。）

**§4 正性恒等式、共轭损失、Mellin 开口。** 得到连分数判据（μ(ξ)<5/2 充分于 Flint Hills 收敛的 dyadic 形式）。Vojta moving-target Roth [22] 与 moving-target 子空间定理 [20]：conductor 高度节省不足。体积障碍再现 VERBATIM："Exactly lower equality baseline! Any q/C losses make upper worse. This is same volume obstruction yet again."

**§5 小角、平台 jet、指数网格回归。** 低秩 Gauss 角组合遇 Liouville 反例 VERBATIM：
> "If t Liouville, impossible, so linear rank + individual exponents insufficient."
（该构造若成立将对 Liouville 数给出错误结论——线性秩+个体指数结构不足。）多次逼近的 Roth 浓缩论证遇直接 Siegel 构造 VERBATIM："Roth height threshold far tinier than analytic contact codim. This kills approach by dimension alone."（§2 同款，再次）。simplex 成本 0.867@2.5 绝望时刻 VERBATIM："Since s_0 n d fixed, all vertical errors exhausted, hopeless!"

**§6 丢失的行列式收益与分母依赖的正形式。** Gauss Wronskian 收益在指数投影分裂成一维频率类时蒸发 VERBATIM："Gaussian p-adic density lost, precisely dimension cancels!"（维数恰把 p-adic 密度收益吃掉。）分母成本 2.917 > 可用 1.85@指数 2.5。

**§7 可除性、正方向、消失的放大。** 三角接触计算看似指数 2 仍有余，暴露遗漏角振幅成本 VERBATIM："Extra huge slack even µ=2, impossible — missing y amplitude/length cost exactly."。构造性饱和恢复独立性但所需接触超过 (2+2ε) 对可用 (2−ε)。Hermite–Padé 反转 VERBATIM：
> "Thus imposing h just above all possible divisions collapses coefficients globally to proportional polynomials, losing amplifier."
（把可除性阈值抬到刚好高于所有可能除法，系数整体塌缩成比例多项式——放大器自毁。）

**§8 扰动损失与 prime-adic 节省的转向。** Calegari–Dimitrov–Tang 有界分母障碍 [7] 再次出场。对数列插值/膨胀 Krylov 链的 apolarity 预算 κd<2 对维数 m、次数 n、余维 κ=m+1−d 失衡。

**§9 尖点平衡、集中模、短段行列式。** "Leading residual exactly canceled by q cross. This is direction. Now add approximation-specific contacts..."、"Thus equality AGAIN when L=A! Good; no far residual."——短暂乐观后又因中点分母、全约束变成冗余多项式可除性而失败。

**§10 算术代价、周期核、逼近误差的秩。** 增大 k 不增独立真误差方向 VERBATIM：
> "Increasing k does not add independent true error directions!"
（逼近误差向量的秩有内在上界——多中心不带来新的独立误差方向。这条直觉最终以另一种形态进入正文：中心是 c_{ji}=j·r_i 的确定重复结构，相消由 Taylor 次数而非误差方向承担。）

**§11–13 对数权→ramified Pell 与循环覆盖的绕行。** "So no exact translation-invariant conic."；Pell 型需 log a > 5 不可得；π/8、π/12 的共轭符号问题；"Need w< −3.08, far."；Brouncker 矩阵 "Dominant p=2 cost. Need balance using shifts alternating half-integer n"；Cyclotomic 单位给出率 ±1.166 加 lcm 代价 → 无理数度估计只有 ~14。

**§14–17 共轭弧、Beta 链、Brouncker/Stirling。** 二尖点辅助、Legendre Toeplitz、Cauchy 核相消 VERBATIM："Thus numerator divisible by 1−xy. Leaves polynomial-kernel/separable finite rank rational."（积分被 (1−xy) 整除——构造塌缩到有限秩有理核。）Fischler–Rivoal 限制分母 E-函数估计 [12]：一般 Padé 非零性失败，计数要求 ε>1+…−… 对解析小量 ε<1−…−… 不可满足。

**§17 转折点："breakthrough possibility"。** 长期"导数高度壁垒"的解除猜想 VERBATIM：
> "Derivative height obstruction unneeded if n fixed and B large. This is a breakthrough possibility!"
即：固定 Padé 次数、让求值规模/分母 B 变大，导数带来的高度代价不再按次数增长。summary 注明 "The assistant left this construction undeveloped."——它只是提出而未展开；正文的实现是"行平移到精确周期 + 固定权下 H→∞"（次序反转：先固定维数/权/中心，再让次数趋于无穷），与"固定次数、增大求值规模"同构。

**§18–21 相位调制循环与 Fourier 提取。** "To allow generic existence number of k choices large enough by equidistribution conditional Diophantine. Circular."（等分布条件下的存在性论证是循环的。）Fourier 提取的大发现 VERBATIM："Upper for coefficient (not sup) permits cancellations of unmatched baseline via Cauchy selection! This is big."（系数级而非 sup 级的界允许未匹配基线的相消——这正是正文引理 3.3 里"组内相消 + 自由度求和"的雏形。）绕行论证的根本障碍 VERBATIM："Fundamental catch: exact positive circulation implies consistent accumulation of local Padé errors between layers."（精确正环绕=逐层局部 Padé 误差一致积累——不可能同时要求。）

**§22–26 分母转移、digamma 代价。** "H huge because Q=A denominator includes A size and denomin, not normalized. Need diagonal matrices. Basic method far."（未归一化的分母吃掉增益。）反射 gamma 插值的大改善 VERBATIM："No derivative, no harmonics, h_i! p2 potential via binomial factors. This is big improvement."；digamma 稀疏极点疑似突破 VERBATIM："Sparse poles density 1 vs sample density M! Error (R/(MR))^{MR} exp(−MR log M) while denom exp(MR). Maybe breakthrough. Let's detail."——随后高度/误差比较把系数指数压到 0.5–0.6：VERBATIM "Our attempts expecting huge gain necessarily missing .5."（期望巨大收益的尝试必然漏了 0.5——自我怀疑的标记。）极点隔离壁垒 VERBATIM："Barrier! Can't isolate EACH pole individually."（Koebe/乘积公式/判别式：分离每个极点的阈值以 |T|/log|T| 增长，|T| 为分母素因子个数。）

**§27–30 theta 尖点与倒数间隙。** "Thus at ALL roots of order odd h, a enters same rational algebraic scaling for every embedding; no monodromy mismatch."（奇数阶根上所有嵌入有同一有理代数缩放——无单值性错配，一度像突破口。）"Fractional denomin constants independent w! This is huge."随后反转 "So any small f with reciprocal gap must =0!"（小解必须深消失于物理尖点）。eta 商修正 VERBATIM："Indeed p* formula missing M dilation!"；"Aha equations at reciprocal might factor HUGE common series from all basis powers!"（倒数点方程可能从所有基幂提出巨大公因子级数——又一循环）。Phragmén–Lindelöf 试用被否 VERBATIM："their leading coefficients are integers 1 -> impossible!"（首系数为整数 1 的两个级数不能在整圆上同时极小。）覆盖论证的遗留问题 VERBATIM："Thus index trajectory across n; all short Q vanish => can iterate comparing lattice covolume per degree layer rather than bound k for same vector!"（逐层格余体积迭代而非对同一向量定界——未完成。）

**§31–33 单纯形熵与几何插值雏形。** 不加甄别更强的 Roth 引理与 Liouville 例子不相容（这是 Liouville 压力测试的正式化）。权分解 w_i ≥ 1/log q_i（正文 w_i=⌈log q_i⌉ 的前身）："Rational scales w_i ≥ 1/log q_i supported its arithmetic reconstruction: logarithmic truncation transformed the complete jet matrix triangularly with unit diagonal."（对数截断把完全 jet 矩阵三角化、单位对角——正文引理 3.2 的截断机制成型。）§32 的行列式重建（ν=2.48, A=.8, η=.887, τ=.89）：算术代价 1−(1−τ)≈.20008 对相干节省 >.213；"Insufficient low-index saving required increasing dimension before fixing approximants, then letting degree grow"（先增维、再固定逼近子、再让次数增长——正文第 4 节次序纪律的直接来源）。§33 audit 参数表：ν=62/25, A=.8, η=.887, τ=.89, F=−θ/2, G=F_0/(ν−2)，下界 >−.204、节省 >.213、增长余量 ~.004。§34 重建加权插值：流论证用指数周期排除乘性相切、加性重复归到一点、坐标幂矛盾——即命题 2.3 的骨架。

**§34–44 自我审计（候选证明的反复压力测试）。**
- §35 共享极点 Padé 的发现与归因 VERBATIM："Aha! Need examine simultaneous rational Padé across all i with common poles weighted to minimize max. This is a crucial stress test."——随后归因于极点记账（分离极点对每个坐标分别计费；限制到早前极点的分母失去自由度），"Higher-genus tests remained open."
- §36–37 惊人强度：优化发现 (A−θ)ν>1−θ 配 θ→1 给出指数趋 2——"appeared to accommodate every ν>2"，作者反复检查 62/25 是否被低估，最终保留 62/25 并持续审计。
- §38–39 定量审计重算：算术损失 ~0.200、解析节省 >0.213、dyadic (2ν−5)=(−0.04)；隐藏 jet 依赖 VERBATIM："Dimension condition global doesn't ensure local subsets; ampleness handles but our curve proof could miss these if equivalent to subvarieties dimension>1 rather than curves."（整体维数条件不保证局部子集——若 offending 集合等价于维数 >1 的子簇而非曲线，曲线论证会漏；作者以"加性体积条件排除该 regime"自答。）
- §40–41 共享极点/嵌套分母/代数根反例继续失败："disjoint poles increased degree, while separated coordinate weights made reuse expensive"。
- §42 共享极点危险正式化 VERBATIM：
  > "Danger e_C/h_C>1 where same poles aligned across i!"
  （同一极点跨坐标 i 对齐时，接触度/高度比 e_C/h_C 可能 >1——若成立则碰撞节省被吃掉。作者检验后认为分离权使极点复用昂贵、对角 Padé 表面上的减半不成立。）
- §43–44 Liouville 压力测试："Simultaneous Liouville approximations gave no immediate contradiction: approximating the exponential coordinate added denominator height and a Taylor index; making the best approximation exact disrupted degree hierarchy."（对替换周期与对数斜率的同时 Liouville 逼近需要跨尺度同步指数高度——同步失败，故未构成反例。）最终保留结论：|π−p/q| ≥ q^{−62/25} 型界（声称）+ dyadic (2·(62/25)−5)=(−1/25) ⇒ Flint Hills 收敛。

### 3.2 Part II 与 "context, not inputs"

summary 开篇即声明结构："Part II takes the earlier report's interpolation-and-determinant technique as a starting point and claims exponent two, explicitly without assuming the earlier approximation bound." 正文把这条立场写成一 phrase："These quantitative bounds are context, not inputs to our proof."——7.10…7.60…8.02 的谱系与 Part I 自称的 62/25 都只是语境；证明内部唯一用到的逼近输入是反证假设式 3.1（ν>2 时存在任意好的 p_i/q_i）。
- §45 的独立重跑：从"62/25 论证的方法"而非"62/25 的结论"出发，再遇 Liouville 反例 VERBATIM："Wait this would work for any transcend, contradiction with Liouville. Examine."（"等等，这对任何超越数都行——与 Liouville 矛盾。检查。"——同一条压力测试在 Part II 开头再次触发。）
- 加权单纯形的参数雏形（summary）："w_0 log q_i ≤ H_0、w_0(1−θ)、v_0(1−θ)、θ≥1−1/ν"，希望 η²θ^m/(mv_0A^m) 对每个 ν>2 成立。随后"被微分的多项式轨迹→曲线次数不等式→blow-up 上的 ampleness→最终 jet 满射"，正是正文定理 2.1 的路线。自述（VERBATIM）："For interpolation rank I use differentiated polynomial loci to get a curve degree inequality and hence ampleness on a blow-up. In the archimedean determinant estimate the test functions run along the exponential, and the volumes controlling translation-error terms and overcrowding of Taylor coefficients are tuned by increasing the dimension. No effective denominator threshold is obtained."——与正文逐条对应（定理 2.1、引理 3.3 的 Taylor 拥挤、维数调节、非有效阈值）。

### 3.3 时间线→引理映射总表

| summary 事件 | 正文落点 |
|---|---|
| 多变量 Roth 被 Liouville 数暴露（§1、§31、§39、§45） | 定理 2.1 的"权先于中心"统一性 + 引理 3.1 的 w_i=⌈log q_i⌉ 依赖逼近分母（对任意超越数族该结构退化，故不越界到 Liouville） |
| 对角熵陷阱（§2） | 横截变量 u_1..u_m 与对数曲线 t 的分离（式 2.2 的 jet 结构） |
| 维数 vs codim（§2） | 引理 2.2 的余维 k 法基比较 + 命题 2.3 的嵌套零点链（L_0=m+2 层） |
| 体积障碍（§2、§4） | 定理 2.1 的两条体积假设 K·θ^m<1（计数层面的"可能"） |
| 固定 Padé 次数 breakthrough possibility（§17） | 次序纪律：维数/权/中心固定后 H→∞（第 4 节）；行平移到精确周期后固定组内 Taylor 检验（引理 3.2） |
| Fourier 系数级相消 "This is big"（§18） | 引理 3.3 的组内 Taylor 次数相消 + 一半衰减分配 |
| 逼近误差秩有界 "Increasing k does not add…"（§10） | 中心 c_{ji}=jr_i 的重复结构；相消由重复 Taylor 次数承担而非误差方向 |
| 对数截断三角化、单位对角（§32–33） | 引理 3.2 的 G_i 截断与式 3.11 的行恒等式 |
| 62/25 audit：算术 .20008 对节省 .213（§32–35） | 引理 3.1 的 E_ar 与命题 3.4 的 g、cL 结构（正文重新选参：θ→1、B、C 指数化，不再有 0.213 这些具体数） |
| 共享极点危险 "Danger e_C/h_C>1"（§42） | 引理 3.3 的"同 (a,d) 列成比例⇒为零"是有利相消；危险情形（共享极点降低列的独立自由度）由分离权 w_i 的逐次选择堵住 |
| Liouville 压力测试（§43、§45） | 第 4 节"分母无界 ⇒ 逐次几何阈值可满足"；以及反证法本身只对 π 引用式 3.1 |
| Vojta moving-target 不足（§4、§23） | 未被正文采用——正文纯插值行列式，无 moving-target 输入 |
| CDT 无界分母障碍（§2、§8、§22、§28） | 未直接引用；正文清分母用 lcm(1..T_i−1)（Λ=4log2 上界），是"有界分母"路线的正面实现 |


### 3.4 未入正文的其余卡点原文拾遗（供对照"哪些路线被试过"）

以下 VERBATIM 在 summary 中出现、但正文完全不见其痕迹，列出以还原搜索空间的宽度：
- §12 格点体积 vs 秩："But under exceptional q, feasible lattice points in strip can be rank1 despite large volume."（例外分母下，带内可行格点可以秩 1——大体积不保证独立方向。）
- §15 个体误差 vs 总和："Unless errors individual *not* small, only sum integral small via interference (orthogonal to total measure), back to generic moments."（只有"和"小而"个体"不小 ⇒ 干扰相消 ⇒ 退回一般矩问题。）
- §16 单位残余行列式不能去障碍："h1 unit, obstruction persists!"（det(f,g)=−2 的显式 Padé 对表明：即使残余行列式是单位，积分障碍仍在——清分母不是万灵药。）
- §19 静态极点策略被否："Strategy need target small coefficients at true, not divide by static pole independent of t."（必须针对真值压小系数，不能除以与 t 无关的静态极点。）
- §20 对数常数的列歧视："But only columns l<n see log constants; for l=n derivatives constants vanish. Very important!"（log 常数只进入低列——高阶导数列看不见它；这是"哪些列能利用 π 逼近"的列层面结构，正文中对应于行指标 β 与 Taylor 阶 s 的分工。）
- §21 交换不变性："Exactly constant! Indicates determinant invariant under swaps algebraically (Darboux dual via Jacobi complementary minors)."（行列式在位点交换下代数地不变——Jacobi 互补 minors 的 Darboux 对偶。）
- §23 结构相消要求："Need structural cancellation of unmatched blocks, not just suppression. Right."（未被匹配的块需要结构性相消而非压制——引理 3.3 的相消是结构性的（全等列为零），恰满足此要求。）
- §24 正性自动性的自省："Positivity, B0 automatically. Then irrationality measure near arbitrarily close to 1? Must examine why impossible."（若正性自动成立则 μ 可任意接近 1——不可能，必须找出原因；这条自省等价于意识到"下界 c/q² 级别不可达"，与定理 1.1 中"指数 2 ≠ 一致下界"的区分呼应。）
- §27 指数对齐不便宜："Usually O(1/n), not exponential."（代数方向的逼近精度通常只有 1/n，不是指数级——子空间定理型对齐不可得。）
- §28 亚单位精度："Need make ratio without approximating each constant independently to subunit."（要做的比值不能靠把每个常数独立逼近到亚单位精度——自对偶格不解决它。）
- §31 齐权要求："Fatal. Need coefficient functions same weight w independent e"（齐次模系数抹掉了信号——系数函数必须同权、与分母尺度无关；正文以分离权 W=(w_0,…,w_m) 的显式分离回应。）
- §31 Roth 引理的边界："It found indiscriminately stronger Roth lemmas incompatible with Liouville examples."（不加甄别更强的 Roth 引理与 Liouville 例子不相容——这是全文最重要的一条方法论自省：**任何候选引理都先拿 Liouville 数压力测试**。正文的定理 2.1 之所以可能通过该测试，是因为其阈值非有效、且 w_i=⌈log q_i⌉ 与特定数 π 的逼近史挂钩——若把定理 2.1 的数值后果无差别地用于任意超越数，结论会强到不可能；定理本身只断言"插值满射"这一代数事实。）
- §25–26 疑似突破的两次自灭：digamma 稀疏极点 "Maybe breakthrough. Let's detail." 与反射 gamma "This is big improvement."——两次都在高度/误差核算后回落到 0.5–0.6 的系数指数；这种"big improvement → 回落"的节奏在 §9、§17、§18、§27、§28 反复出现，构成 summary 的情绪曲线：乐观峰值从不高于一次局部核算。
- 搜索空间的广度（计数）：Part I 的 44 节里被明确点名并放弃的辅助函数家族至少包括：Catalan 行列式、arctan/Salikhov Padé、Gauss 有理对数、正性矩矩阵、Chebyshev/实根矩、指数多项式、BBP、低秩 Hankel、半圆 Toeplitz、预像与 p-adic 对数、椭圆延拓/CM 共轲/Hecke 平均、Mellin 权、Farey 角、Cijsouw 指数插值、HCIZ 界、平台 jet、Bessel/谱/共振、Poisson/三基数二项、Brouncker、Stirling、cyclotomic 单位、Legendre 二尖点、beta 链、二次/Gauss 极点、cotangent 矩、digamma、theta/eta 商、Radchenko–Viazovska 插值、Phragmén–Lindelöf、Schur 补、Pell/循环覆盖。正文保留的只有一条线：对数曲线上的分离权插值 + 双情形行列式——即从 §32 起定型的结构。

---

## 四、可信度审计

### 4.1 结论跳变：从 7.10 直接到 2

Zeilberger–Zudilin（2020）7.103205…、Bai（2026-09）7.10186…，本文一个月内跳到 μ(π)=2，且方法不是在既有 Hermite–Padé/积分框架上改进，而是另起一套"分离权多变量插值 + 双情形行列式比较"。谱系上没有中间台阶（例如先到 6、再到 5、再到 <5/2 的逐级下降）。summary 显示 62/25=2.48 的候选界先于指数 2 出现、且 §36–44 反复"保留 62/25"——这表明作者自己也不完全信任"更强结论"，或者至少在候选论证的适用范围上摇摆。正文用 "context, not inputs" 一笔带过 62/25（论文文本里其实**没有出现 62/25**，只存在于 summary），使得 Part I 的全部审计工作在正文里不可追溯。

### 4.2 未经外部检验

- 无 Lean/形式化（本次素材确认无 .lean 文件）；几何部分（定理 2.1 的证明链：曲线不等式→blow-up nef/ample→Rees 消没→Serre 消没→满射）涉及大量"对可能奇异射影概形成立"的标准事实的组合使用，恰恰是最需要机器或专家逐条核对的地方。
- 论文自列的依赖清单："polynomial Bézout with isolated local multiplicities, ordinary blowups, nef-plus-ample, eventual Proj recovery, Serre vanishing, smooth projective models of curves. Their exact hypotheses are checked at use."——"checked at use" 的声明在 summary 里对应 §35–44 的多轮审计，但 summary 也记录了这些检查"no correction"的全过程，属于**自我审计闭环**，无外部独立信号。
- 结果强度本身构成贝叶斯疑点：μ(π)=2 是数学里最著名的未决问题之一（与 μ(e)=2 相对，e 有 Hermite–Padé 结构而 π 的 log 结构长期被 Liouville 类反例卡住）；正文方法若正确，其机制（对数曲线上的分离权插值）应当可以立刻推广到 log 代数数的情形——论文没有讨论任何推广边界。

### 4.3 对 Carella 的反驳

脚注反驳聚焦 Carella 声称的**更强命题**（有界部分商）：在 Carella Theorem 8.1、式 (52)(55) 的记号下，C = p_{n+1}−πq_{n+1}−1/q_n 满足 −2/q_n<C<0，故大 n 时 sin C<0，与其正下界矛盾。论文小心地声明该反驳"does not decide the exponent-two claim or the truth of the stronger conclusion"——即它只判定 Carella 的**展示证明**有符号错误，不否定其结论。这本身公允；但值得记录：本文与 Carella 结论相同（指数 2），而学界对 Carella 的结论同样未接受，两者互相独立、互不作为佐证。

### 4.4 撤稿记录

- Mantzakouras–López Zapata（arXiv:2502.03474v2）声称 Flint Hills 收敛与一个无理数度界，2026-09-14 撤稿，理由是"its proof did not establish convergence or the asserted irrationality bound"。本文引用该撤稿划界（"leaves convergence undecided"指的是 Dan 2026 与 López Zapata 2026 的后续）。
- summary 自身记录了大量**内部未发表候选**（62/25 界）反复保留/怀疑的循环；与本论文同期发表的 OpenAI 系列（Catalan 常数无理性等）共享"moment determinant/finite-prime vs real bound"的方法语汇（summary 中 17 号引用反复出现），这些论文彼此未互检。

### 4.5 最该被外部审查的环节（按风险排序）

1. **引理 2.2/命题 2.3 的解析–代数衔接**：log(1+t)→G_i(t) 替换"保 h_P、保插值满射"的双断言（interpolation.tex 第 458–472 行）。这是纯几何与纯解析两个世界的接口；若替换在某个分支上改变 h_P 的 min 结构（例如 t 恒零分支与 u_i' 阶的竞争），定理 2.1 的满射对象就不再是行列式实际用的系数包。summary §34–36 显示作者在这附近重建了多次（"Taylor substitution required analytic absolute convergence because the substituted series had nonzero constant term"——绝对收敛条件出现在审计里而非正文）。
2. **相消的均匀性（引理 3.3）**：同 (a,d) 行系数向量相同⇒行列式项为零。需核对：不同中心 j 的行在 (t^ℓ) 检验下确为同一 (c_{a,d,P})_P 的纯标量倍；ρ_H 与"行选择、列选择"无关的声明支撑命题 3.4 对 Q_H^M 项选择的统一取界。若均匀性只在"固定的列集"上成立而对定理 2.1 选出的任意非零子式不成立，下界（引理 3.1 对每个子式成立）与上界（可能只对某个子式）会失配——这是双界比较的结构性风险点。
3. **可除性的一致性**：定理 2.1 的"充分可除 H 只用权"、引理 3.2 的 Q_H 计数、式 3.4 的 M~H^{m+1} 渐近，三处对 H 的整除类要求须相容（正文未给出具体整除引理）。
4. **曲线不等式收尾的"至多一个中心"**（命题 2.3 末段）：依赖 G_N≠0 在 Y=1 纤维内的真零性与 Z′ 余维 1≤k≤m−1 的排除；奇异曲线/非既约支持是 summary 审计的高频词（§34–44 反复出现 singular curves, nonreduced jets, embedded support）。
5. **引理 2.2 的泛组合选点与解析范畴适用**（2.2(d) 第 1 条）。
6. **参数链的代数恒等式**：式 4.3–4.6（v_0=2Kθ^mw_0 使第二条体积假设取等、L=η²(B/A)^m/2(m+1)）——纯计算，风险最低，适合机器优先复核。


### 4.6 正文与 summary 的一致性核对（可用事实清单）

以下逐条可在两个来源中交叉验证，供后续复盘或质疑时快速定位：

1. **62/25 只存在于 summary**：论文全文（tex 源码检索）无 "62/25" 字样；summary §32–44 中 62/25 是 Part I 候选界，Part II §45 明确"without assuming that bound"。正文 "context, not inputs"（main.tex 第 134–135 行）指的是 Mahler…Bai 的定量谱系，未提 62/25——严格说，正文没有义务提，但读者无法从正文知道存在一个先前的、被放弃的 62/25 候选及其全部审计史。
2. **权=对数分母的来源**：summary §31 "With exceptional-approximant degrees q = e^w/log…"（符号残缺）与 §32 "Rational scales ≥ 1/log q"；正文式 3.1 的 w_i=⌈log q_i⌉ 是其定式。这是"分母质量→权"的一次同调，两条来源一致。
3. **对数截断三角化**：summary §32 VERBATIM "logarithm truncation transformed the complete jet matrix triangularly with unit diagonal"；正文引理 3.2 的式 3.11（行恒等式）+ 引理 3.1 的 L_i 清分母共同实现；正文另在定理 2.1 证明里有第二处截断（G_i 替换）。两处截断分工不同（一处保满射、一处保算术），summary 未区分。
4. **审计数字不迁移**：summary 的 0.20008/0.213/0.004/−0.04 是 ν=2.48 的一组具体参数下的数值；正文第 4 节重新参数化（θ→1、指数化 B,C），数值全部消失，换成 ε_0 三段分配。若要复算 summary 的数字，需按正文式 4.3–4.6 重选参数——两组参数不通用，对照时须注意。
5. **Liouville 测试的正文形态**：summary 中至少 4 次显式 Liouville 反例（§1、§5、§31、§45 的 "Wait this would work for any transcend"）；正文没有任何 Liouville 讨论——它被"消化"进两点：定理 2.1 的权阈值不依赖中心（否则可对 Liouville 数的中心构造同样的插值）、以及反证法只对 π 使用式 3.1。外部审查者若想压力测试定理 2.1，最自然的问题就是：把 π 换成 Liouville 数 L，让 p_i/q_i 是 L 的超收敛逼近，式 3.1 变为 |L−p_i/q_i|≤q_i^{−ν} 对一切 ν——此时 w_i=⌈log q_i⌉ 无界增长，而第 4 节式 4.6 要求 w_* 大于某个只依赖 m 的阈值：逼近越超常、权越大、行数 M 越小，论证在参数层面是否仍闭合？正文第 4 节只处理"逐次几何阈值可满足"的存在性（分母无界 ⇒ 可行），并未对"所有 ν 同时成立"的 Liouville 情形逐条检查式 4.7——这是可检验的具体疑点（对应 2.4(d) 与 4.5 第 2 条）。
6. **撤稿与反驳的对称性**：正文脚注对 Carella 的反驳（符号障碍）与对 Mantzakouras–López Zapata 撤稿的引用都是"防守性引用"；summary Part I §4 的连分数判据（μ(ξ)<5/2 充分）与 Meiburg Theorem 2.5 同型——正文第 5 节的 dyadic 引理 5.1 实质上是 Meiburg/Alekseyev 型间距论证的自足重写，未引入新数学。

---

## 五、常数与参数表

### 5.1 论文正文的常数

| 常数 | 值/定义 | 出处 | 角色 |
|---|---|---|---|
| ν | >2，任意实数 | 式 3.1、定理 1.1 | 反证假设的逼近指数；非有效 |
| Λ | 4·log 2 | 引理 3.1 | log lcm(1..n) ≤ Λn 的 dyadic 常数 |
| c | (log 2)/4 | 引理 3.3 | 碰撞节省系数：−cΣn_a² |
| R | 100K | 引理 3.3 | 整函数 Cauchy 圆半径（中心模 <50K=R/2） |
| F_0 | >2/θ，且 ν/F_0<ε_0/3 | 式 3.2、第 4 节 | 对数截断深度参数（T_i=⌈F_0w_i/v_0⌉） |
| θ | 有理，0<θ<1；构造 θ=1−δ | 式 2.1、4.1 | 接触权/次数权之比（v_i=w_i/θ） |
| w_0, v_0 | B^{−m}；2Kθ^m·w_0 | 式 4.3 | 0 次坐标（Y）的次数权与接触权；第二条体积假设恰取等 1/2 |
| w_i | ⌈log q_i⌉（正整数） | 式 3.1 | X_i 的次数权 = 逼近分母的对数 |
| w_* | min_{i>0} w_i | 第 3 节 | 最小横截权，控制格点/组合误差 |
| A | 1−bδ（A²<θ） | 引理 4.1 | 横截权截断 AH |
| B, C | B<1/C、B<Cθ<1、C∈(A/θ,1/A) | 式 4.1 | 维数指数：K=⌊C^m⌋、误差衰减 (CB)^m、碰撞增长 (B/A)^m |
| η | ∈(0,1)，小 | 式 4.2 | 双情形的行比例阈值 |
| g | ν(A(1−η)−θ)−(1−θ)>0 | 式 4.2 | 逼近误差间隙 |
| L | η²Kθ^m/((m+1)v_0A^m)=η²(B/A)^m/2(m+1) | 式 3.15、4.5 | 碰撞参数，→∞ |
| ε_0 | min(g/2, 1/2) | 第 4 节 | 三段误差预算的总量 |
| b̄ | (1/MH)Σ_ρ wβ ∈[0,θ] | 式 3.3 | 行 β-权平均（算术主代价 1−b̄） |
| σ | 充分小，满足式 2.3 三条 | 命题 2.3 | 曲线不等式的松弛（1+σ） |
| L_0, C_* | m+2；max_{1≤k≤m} 2k!(L_0/σ)^k | 式 2.4 | 零点链层数；引理 2.2 常数的包络 |
| Q_H | (⌊H⌋+1)^{2m}(⌊H/v_0⌋+1) | 式 3.9 | 行展开项计数（log Q_H/H→0） |
| E_tr | ν/F_0+log2/v_0+(log4+log(2K)+ν)/w_* | 式 3.10 | 平移误差 |
| E_hol | 100K/w_0+log2/v_0+log(200K)/w_* | 式 3.13 | 整函数/Cauchy/Taylor 误差 |
| E_ar | ΛF_0m/v_0+ΛΣ1/w_i+θ/w_* | 式 3.5 | 清分母误差 |
| E_an | E_tr+E_hol | 式 3.14 | 解析侧总误差 |
| K, m | K=⌊C^m⌋（先定 m 再定 K） | 式 4.3 | 行平移数与维数 |
| Q(ν) | 非有效整数 | 定理 1.1 | 阈值，证明不给 |

### 5.2 summary（Part I，62/25 候选）的审计参数（对照）

| 参数 | summary 值 | 含义 |
|---|---|---|
| ν（候选指数） | 62/25 = 2.48 | 声称的 μ(π) 上界（Part I），正文未采用 |
| A | 0.8 | 横截权截断 |
| η | 0.887 | 行比例 |
| τ | 0.89 | 算术侧折扣 |
| F | −θ/2；G = F_0/(ν−2) | 次数/截断参数 |
| 算术代价 | 1−(1−τ) ≈ 0.20008 | 引理 3.1 原型的上界指数 |
| 相干节省 | > 0.213（另一处 >0.214） | 双情形的解析节省指数 |
| 增长余量 | ~0.004 | 维数增长吸收项 |
| dyadic 指数 | 2ν−5 = −0.04 = −1/25 | Flint Hills dyadic 贡献 |
| 阈值恒等式 | (A−θ)ν−(1−θ) 型 ⇒ 1−(1−τ)/(1+…) = 1+1/θ… >2 | §36–43 反复发现的"指数趋 2"优化 |

### 5.3 引用文献速览（summary/正文共用编号体系）

Alekseyev 2011（Flint Hills 必要条件 μ(π)≤5/2）[2]；Meiburg 2022（充分条件 μ(π)<5/2，arXiv:2208.13356）[16]；Bai 2026（7.101862832357）[3]；Zeilberger–Zudilin 2020（7.103205334137…）[23]；Salikhov 2008（7.6063…）[21]；Carella 2022（声称 2，被脚注反驳）[8]；Calegari–Dimitrov–Tang 2025（Unbounded Denominators, JAMS）[7]；Esnault–Viehweg 1984（Dyson 引理）[11]；Fischler–Rivoal（E-函数）[12,13]；Vojta 1996 / Ru–Vojta 1997（moving targets）[22,20]；Laurent 1991/2000、Philippon 1986、Demailly 1992、Lazarsfeld 2004、Mondal 2021、Stacks（正文几何工具）；Mantzakouras–López Zapata 2025（已撤稿）；OpenAI 内部引用：Catalan's constant is irrational [17]、joint Dickman law [18]（后者"no theorem from that paper was used"）。
