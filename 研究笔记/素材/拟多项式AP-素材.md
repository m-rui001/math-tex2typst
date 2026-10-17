# 《Quasipolynomial Bounds for Arithmetic Progressions》素材提取
## ——第一人称研究思维链复盘（带批注的证明重构级深度）

论文：OpenAI, *Quasipolynomial Bounds for Arithmetic Progressions*, 2026-09-23，198 页（正文 §1–§11 + 附录 foundations）。
素材来源：`/e/math/preprints/Quasipolynomial-Bounds-for-Arithmetic-Progressions-September-23-2026/build/`（main.tex + sections/）；41 页思维 summary：`/e/math/reasoning_traces/quasipolynomial-arithmetic-progressions.pdf`（Part I 27 段 + Part II 12 段）。

---

# 一、定理总览

## 1.1 主定理与推论

**Theorem 1.1（主定理，tex 标签 ap:main）**. 对每个固定整数 k≥3，存在常数 C_k, c_k, ε_k>0，使对一切 N≥2，
$$ r_k(N)\le C_k N\exp\bigl(-c_k(\log N)^{\varepsilon_k}\bigr), $$
其中 r_k(N) 是 [N]={1,…,N} 中不含非平凡 k 项等差数列（a, a+d, …, a+(k−1)d, d>0）的子集的最大基数。等价的密度阈值形式：存在 A_k≥1，使得 [N] 的 α-稠密子集只要
$$ \log N\ge A_k\bigl(2+\log(1/\alpha)\bigr)^{A_k},\qquad 0<\alpha\le1, $$
就必含非平凡 k 项等差数列——阈值对 1/α 是**拟多项式**的（充分区间长度的对数是 2+log(1/α) 的固定幂）。

**推论 1.2（倒数和发散）**. 若 A⊆N 满足 ∑_{a∈A} 1/a=∞，则 A 含每个有限长度的非平凡等差数列。证明只需把 [2^m,2^{m+1}) 平移为长度 2^m 的区间，用主定理得 ∑_{a∈A∩[2^m,2^{m+1})} 1/a ≤ 2^{−m}r_k(2^m) ≤ C_k exp(−c_k(m log 2)^{ε_k})，而 e^{−dm^ε} 可和（因 m^ε/log m→∞，尾项 ≤ m^{−2}）。关键点：**定性衰减 r_k(N)=o(N) 不够**，需要的恰是更强的 dyadic 可和性 ∑_m r_k(2^m)/2^m<∞——这正是本文与 Leng–Sah–Sawhney（LSS）边界的分水岭。

**van der Waerden 数推论（§1.4）**. 记 W_r(k) 为使 r-染色 [N] 必含单色非平凡 k 项 AP 的最小 N。最大色类密度 ≥1/r，代入阈值形式得
$$ W_r(k)\le \lceil \exp(A_k(2+\log r)^{A_k})\rceil. $$
配套下界（姊妹篇 Theorem 7.2）：W_r(k) > exp((log r)²/(64 log 2))，r≥256。于是固定 k 时 W_r 关于色数 r **超多项式但至多拟多项式**增长。

**加权推论（§11）**. dyadic 加权求和命题给出：均匀调和上界 ∑_{a∈A}1/a ≤ H_k；拉伸指数权 w_a(n)=exp(a(log n)^{ε_k})/n（0<a<c_k）与 w_{*,η} 可和；对每个固定 B≥0，∑(log(2+a))^B/a 发散 ⇒ 任意长度 AP；r_k(N) ≤ C_{k,B}N(log N)^{−B}；由此 B=2 恢复 Green–Tao 素数稠密子集定理（r_k(N)=o(N/log N) 加素数定理）；调和尾估计 ∑_{a∈A,a>x}1/a ≤ C'_k (log x)^{1−ε_k} e^{−c_k(log x)^{ε_k}}。

## 1.2 与既有界比较

| 结果 | 长度 | 上界 | log N 节省 | dyadic 可和？ |
|---|---|---|---|---|
| Roth (1953) → Sanders → Bloom–Sisask (2016) | k=3 | N/(log N)^{1+c} | (log N)^{1+c} | 首次跨过三项倒数和门槛 |
| Kelley–Meka (2023)；Bloom–Sisask 改进；Raghavan (2026) | k=3 | N exp(−c(log N)^{1/12})；1/9；(log N)^{1/6−o(1)} | (log N)^c | 是（但只三项） |
| Gowers (1998/2001) | k≥4 | N/(log log N)^{c_k} | log log N | **否** |
| Green–Tao (2017) | k=4 | N/(log N)^c | (log N)^c | 是（仅四项） |
| Leng–Sah–Sawhney (2024) | k≥5 | N exp(−(log log N)^{c_k}) | (log log N)^{c_k} | **否**（"does not give the dyadic summability"） |
| **本文** | 一切 k≥3 | N exp(−c_k(log N)^{ε_k}) | (log N)^{ε_k} | **是，全部长度** |

下界侧：Behrend 给 r_3(N) ≥ N exp(−C√log N)，故 N 的固定幂节省不可能；k≥3 无任何改进三项指数的声称。论文自我定位："Its contribution to Erdős's conjecture is this all-length, summable bound; no improvement of the three-term exponent is claimed."

## 1.3 核心机制一句话

**三角多项式胞腔上的密度增量 + 降序精度预算**：增量区域是"三角胞腔"——空间变量 u（权重 1）逐层决定整块 b_1,…,b_D（权重 h），约束形如 ‖b_h−C_h(u,b_{<h})−l_h‖_∞ ≤ w_h（0<w_h≤1/32）；第 h 层宽度的对数损失 Q'_h−Q_h 只允许依赖 p、维度数据与**严格更高层**的宽度 Q_{h+1..D}，绝不允许依赖 Q_h 本身或更低层（Theorem 2.1 的宽度规则 (1.2)）。由于层数 D=D_k 固定，降序归纳使所有宽度与维度经 T=O_k(p) 轮增量后仍被 p 的多项式控制——总对数损失 poly(p)，而阈值每轮乘固定因子 (1+η_k)，O_k(p) 轮后突破 1，与逐点不等式 fB⁻≤B⁺ 矛盾。反面警告（§2 原文）："A bound polynomial in all current width logs would not suffice: repeated substitution could raise the polynomial degree at every round."——即若允许依赖 Q_h，多项式复合会逐轮升次，p 轮后爆炸。

## 1.4 证明路由（§2.8 "From a cell to the next certificate"）

准备（秩切割，Prop 4.1）→ 受约束路径把证书送到终端盒（Prop 6.2 forward mass）→ 绝对规则（Lemma 2.2）供给定量分数 → 被动回传（Prop 7.x passive replacement）与主动回传（Thm 8.1 active replacement）把分数抬回各层 → 提取（Prop 9.1 one-layer extraction）把分数变回三角胞腔 → 根压缩（Lemma 10.1）闭合一步增量 → §10 验证维度/宽度递推并迭代出 Theorem 1.1。两个外部解析输入：LSS 拟多项式逆定理（区间型）、Schoen–Sisask 半径敏感几乎周期性（其 Theorem 5.4，保留入射半径为乘法因子——对移位比较 essential）。

---
# 二、逐引理带批注重构（§2–§10）

约定：每条按 (a) 精确陈述（公式原样转写）；(b) 证明机制推导；(c) 假设/常数机械理由；(d) 候选失败路线[推测]展开。

## §2 多项式胞腔与增量定理（setup）

**定义（三角胞腔与证书）**. 固定 D≥s（s=k−2），空间变量 u 权重 1，整块 b_h∈Z^{d_h} 权重 h。三角胞腔由多项式 C_h(u,b_{<h})∈R^{d_h}（加权 deg≤h，**系数无界**）、有界中心 l_h、宽度 0<w_h≤1/32 给出；Q_h=log(2/w_h)。对 γ>0 定义两个示性函数 B⁻/B⁺（分别要求 ‖b_h−C_h−l_h‖_∞≤w_h 与 ≤(1+γ)w_h 对全部 h 同时可解）。**密度证书**：𝔼fB⁻ > a𝔼B⁺，0≤f≤1 且 f 进制-free（支撑无 k 项 AP）。超额量不设定量下界。

- (b) 三角性+窄宽度 ⇒ 满足条件的整数元组唯一（含在稍加垫的盒上也唯一）——这是"每个整数槽恰好一次"的根基，保证旧决定方程在新约束加入时通过**精确整数重参数化**保持。B⁻/B⁺ 可暂时换成乘积光滑截断（小截断在严格示性之下、大截断盖住扩大盒），覆盖体积比 (1+O(γ))^{O(∑d_h)}；γ 从维度预报独立于一切宽度选出，用对目标的小乘法折扣偿还。这样**不需要任何点分布的边界正则性**。
- (c) "系数无界"是全论文最重要的机械约定：高层的决定多项式可以以任意大系数引用低层整数槽，因此任何"对旧整数变元做连续性/近似"的论证都被禁止，只有精确代入合法。
- (d) [推测] 失败路线一：若放宽 w_h≤1/32（如允许 O(1) 宽度），同权重内可能有多于一个元组，三角唯一性失效，回传时旧方程须对近似整数求值，系数无界立刻放大误差。失败路线二：若证书只有"超额 ≥ δ"的定量形式，准备阶段的几何覆盖选择会要求逆超额代价，正好是 Part I 思维链反复撞墙的"charging the inverse of the excess"。

**Theorem 2.1（Triangular increment）**. 存在 D=D_k、η=η_k>0 与仅依赖 k 的多项式：设 p≥2、a≥e^{−p}、正维整数盒上进制-free 输入有证书 𝔼fB⁻>a𝔼B⁺，宽度对数 Q_h=log(2/w_h)。若每根边充分大（对数门槛关于 p、维度数据与一切 Q_h 多项式），则**要么假设不可能，要么某根切片承载阈值 (1+η)a 的新证书**；新胞胞经精确整数重参数化保留旧决定数据，新增至多 d_0=(2+p)^{C_k} 个"绝对槽"外加向下准备的拷贝，且
$$ d'_i-d_i\le d_0+P_i(p,d_{i+1},\ldots,d_D),\qquad
   Q'_i-Q_i\le P'_i(p,\text{维度预报},Q_{i+1},\ldots,Q_D). $$
根切片代价对所有同型数据（含全部 Q_i）有多项式对数界；多项式指数与固定增益与增量轮数无关；gap 与折扣可由维度/切割计数预报**预先**选定。

- (b) 关键是 (1.2) 右端**不出现 Q_i 与 Q_{<i}**。迭代段（§10）先降序界维度（顶部块先、逐层向下），得整轮统一多项式预报 d_*(p)；再取控制宽度损失的非降多项式 R_i，定义包络 V_D=Q_D(0)+T R_D(p,d_*), V_i=Q_i(0)+T R_i(p,d_*,V_{i+1},…,V_D)（i=D−1,…,1），降序归纳给 Q_i(t)≤V_i；D 固定 ⇒ 每个 V_i 是 p 的多项式 ⇒ 根边对数门槛与全部根切片对数代价均为多项式。阈值每轮 ×(1+η)，T=O_k(p) 轮后 ≥1，而 fB⁻≤B⁺ 逐点成立 ⇒ 证书不可能。
- (c) d_0 只依赖 p（不依赖盒维 n）来自 Lemma 2.2 的"维度无关新鲜秩"；η 固定来自各处"固定比例折扣"总和 < 绝对增益。p≥2 与 a≥e^{−p} 是规范化：一切对数预算都写成 p 的多项式。
- (d) [推测] 失败路线一：把宽度规则改成 Q'_i−Q_i ≤ P'(p,…,Q_1..Q_D)（允许依赖自身）——每轮复合使多项式次数乘 |P'|，T=p 轮后为 p^{C^T}，爆炸。失败路线二：允许增量固定增益依赖 a（如增益 (1+a^θ)）——轮数变少但每轮精度门槛含 log(1/a) 的更高幂，回到同一问题。失败路线三：绝对槽与准备拷贝不分家——若准备把高权重块拷贝到低权重时不保持加权次数界，则 D 无法事先固定。

**Lemma 2.2（维度无关新鲜秩，ap:absolute）**. 存在 ξ>0、C=C_k：设 p≥2，f 为进制-free [0,1] 值函数，均值 ≥a≥e^{−p}，在正维 n 的盒上；各边充分大（对数门槛关于 2+p+n 多项式）。则除非假设不可能，f 在某切片上有次数 s 的多项式 patch，在目标 (1+ξ)a 处得正分；槽数 ≤ d_0=(2+p)^C **与 n 无关**；逆分数、Lipschitz 范数、切片代价、边门槛的对数均为 2+p+n 的多项式。

- (b) 证明结构 = **固定小维 n_0 上的绝对规则 + 加性相对提升**：Prop 11.x counting:relative-target 固定基维与素数边可比常数；counting:absolute + counting:conversion + shift:required（Kelley–Meka 去平衡/筛选 adapted 到 Bohr 集）给固定维规则，增益 1+ξ_0、秩 (2+p)^{C_k}。实际均值 α≥(1−c)a 时预算 O(1+p)，在普适缩小目标 Λ=(1+ξ_0)(1−c)a 处正分。相对定理用常数旧检验 1（秩 0、阈值 (1−c)a、旧分 ≥ca），资源参数放大到 p+n 的多项式以覆盖维度；关键句："Its rank conclusion is d+d_0, so the enlarged resource parameter does not enlarge the fresh rank d_0"——**相对提升只加性加槽**。最后选 ε_0、c 使 (1−ε_0)(1+ξ_0)(1−c)>1+ξ。
- (c) 素数（可取奇）边是有限群逆定理与计数引理的标准载体；"impossibility clause"（Λ≥1 时非负检验直接矛盾）使规则在密度饱和时自动转化为矛盾出口——迭代闭合用的就是这一支。
- (d) [推测] 失败路线一：若相对提升的秩结论是 d+d_0 的多项式（如 d·d_0），则 p 轮后槽指数化，与 summary §30 "rank growth must be additive/hierarchical" 呼应。失败路线二：绝对规则在维 n 上若边门槛含 n 的指数（非对数多项式），大维终端盒撑不起；这正是把 LSS 逆定理的维度依赖压到"多项式对数"的原因。

**定义（降序预算 warm/cold/late，ap:budgets）**. 层 j 的 **warm 数据**=p、维度/结构变量计数预报、仅依赖这些的 gap 参数、以及严格高于 j 的各层已选宽度与数值预算；warm 对数界不得使用任何 i≤j 的 Q_i。**cold 预备数据**可另用当前 Q_j（含预报的 Preparation 损失），但不得用本层的最终秩阈值、长路径尺度、prepared 值空间高度、父边门槛。**late 数据**=预备建模与代数需求之后的扰动/范围/秩/边选择，其对数为 cold 预备预算的多项式。选择顺序与路径采样顺序**相反**。

- (b/c) 图示（fig ap:budget-figure）："There is no arrow from the current width or its cold outputs back to its relative width loss." 冷复杂度可进辅助模型，但其回到原变量的返回必须有 warm 相对宽度损失——这是 warm/cold 分离的全部意义。

**多项式 patch（ap:patch-definition）**. 整数槽 b_1..b_d 带非降权 1≤ω_i≤q，B(u)=∑_{b∈Z^d}Φ(S_u(b))，S_u(b)_i=b_i−A_i(u,b_1..b_{i−1})，deg_wt A_i≤ω_i，Φ∈[0,1] Lipschitz 支撑于 [−1/4,1/4]^d。秩=d（槽数）；对数复杂度只含参数个数、d、log(2+Lip Φ)，**A_i 系数不入账**。逐个确定槽 ⇒ 至多一个非零求和项 ⇒ 0≤B≤1。非负检验 B 在目标 a 的分数=𝔼(f−a)B。

## §3 受约束路径及其检测估计（paths）

**Lemma 3.2（chart mass，ap:path:chart）**. W⊆R^d 有理，Λ=W∩Z^d，Λ'=proj_{W⊥}Z^d，K_i=max(1,⌈|v_i|^{−1}⌉)、k_i=max(1,⌈K_i v⌉)（v 为 w_j 的 warm 小分数），m_j=v^{dim W}∏_i k_i/covol(Λ)。则 m_j 与 m_j^{−1} 有**与 W 的高度无关**的 cold-pre 界；垫图上 y_W/v、z_i/k_i 的范数由 y/v 维度控制；warm 放大图 Haar 测度 ≤ warm 倍 m_j，可行环点周围 τv 球 Haar 测度 ≥ warm 逆倍 m_j。

- (b) 骨架：格子图引理 covol(Λ) ≍_{exp(poly d)} ∏K_i；k_i≍max(1,K_i v)；Haar = (W 上 Lebesgue)×(sheet 计数)/covol；下界需 τ^q∏i k_i 与 τ^{dim W} 两个因子拼起来。要点：log m_j^{−1} 含 log v^{−1} 但**不含子空间高度**。
- (d) [推测] 若用 K 的任意有理尺度基而非原始格 Λ，实条件数可能极差，上下界失去维度控制——summary §32 "Freezing sheets…thresholds depend on covolume" 即此坑的前身。

**系数律与实际路径系综（§3.2）**. 参考律在系数环面上：主部 y_a^ideal/v = η_a+∑_B c_{aB}∏_{ℓ∈B} t_ℓ/L，各轴专用不相交的 j 列块；inactive 轴系数恒 1、专用边 ≍k_i^{1/j}，过短则整轴置零省略；moderate/enormous 轴分类以 L^j、L^{C_*} 为界；尺度缺口选法："among more than dim W⊥ consecutive disjoint multiplicative intervals of ratio A, at least one contains none of these numbers"，A≤L≤A^{O(1+d)}。实际仿射律为倾斜积
$$ d\mathbb P_c(\psi)=\rho(x,V)\,\mathcal D_c(\operatorname{coeff}C(x+Vt))/Z_c,\qquad Z_c=\mathbb E_\rho\mathcal D_c(\operatorname{coeff}C(x+Vt)). $$

**Lemma 3.4（normalized one-layer ensemble，ap:path:ensemble）**. 充分大的秩与父边门槛给出：(1) Z_c=1+o(1)，且每条保留路径上 C(ψ(t))−c=y(ψ(t))+β(ψ(t)) 是**多项式恒等式**，y 全慢于宽 v，β∘ψ 整单项系数；(2) 非-过-格点模的 Fourier 移除与各体模剩余乘积图/甲板律成立到任意小全变差；(3) 非单射路径可按任意 cold-pre 概率丢弃；定点单点律密度 ≤B/m_j（warm B）；(4) 混合中心后单点上界 (1+ε)×均匀、去掉 warm 厚条带后下界 (1−ε)，空间尺度与条带厚度**不依赖 Q_j**。

- (b) Z_c=1 的机理：系数密度的 Haar 积分为 1；非平凡系数特征被解析移除（Lemma sampling:analytic-removal，秩+父边以对数规模多项式依赖频率、模、误差、log L、log σ^{−1}，**不依赖 W 高度**）。齐次张量独立性的核心计算：固定 α，代 x_{a,α_a}=t_a z、其余为 0，提取 t_1^{j−q+1}…t_q 系数得 (j!/(j−q+1)!)λ_α C_{[j]}(z)——故"联合符号 slow+rational"证书给出某非零行 λ_α C_{[j]} 的同类证书，与秩条件矛盾。
- (c) 顶阶恒等式 β_{[j]}−C_{[j]}(ψ_{[1]})=−y_{[j]}：这正是"无 C 系数界仍能恢复方向"的原因——把无界系数移到恒等式的整数一侧。
- (d) [推测] 失败路线一：若把纯自由列的均匀律换成"给定实 sheet 系数后条件均匀"，则实际采样器不具备该条件独立性（原文明确警告），比较论证在联合剩余律处断裂。失败路线二：若省略尺度缺口（直接取 L 为最方便值），moderate 轴纯自由系数宽 A^jσ 不再保证对任意个体模均匀，各素数剩余律失效。

**Niltest 约定**. 滤过有理 nilmanifold G=G_1⊇…⊇G_{q+1}=1，[G_i,G_j]⊆G_{i+j}；adapted 轨道 log g mod g_{i+1} 次数 ≤i；复杂度 ≤p 指 dim G、结构常数/滤基的对数高、log(2+‖F‖_∞+Lip F)≤p，且 lZ^{dim G}⊆log Γ⊆l^{−1}Z^{dim G}，1≤l≤e^p；**对轨道系数无界**。

**Lemma 3.6（cube comparison in chart units，ap:path:comparison）**. 固定切片代价、固定立方阶 q、精度：采样泛函 (P_ω)↦E_ψ E_{t∈Cub_q(B)}∏_ω P_ω(ψ(t_ω)) 对 |P_ω|≤1 可用 ∑_α c_α E_{u∈Cub_q(U)}∏_ω P_ω(u_ω)J_{α,ω}(u_ω) 逼近，J、∑|c_α|、项数 cold-pre 有界；若 q≤j 且请求为 warm，可写成环境立方平均，位置因子为 J_{α,ω}(u_ω)/m_j，warm 系数质量与 warm 位置扭量，warm 加性误差任意小。

- (b/c) 因子只依赖单个环境位置——"This is the feature that lets a large sampled cube average yield an ambient niltest correlation."

**Theorem 3.7（pathwise detection and approximation，ap:path:detection）**. 预先给有限个测试次数、局检复杂度、切片代价、输入帽、精度。X_r(g)=E_ψ sup_{B,F}|E_{t∈B}g(ψ(t))F(t)|。**cold 条款**：cold-pre 有界输入若 X_r(g)≥a（log(1/a) cold-pre），则 g 在父均匀测度下与 cold-pre 复杂度的环境原子相关，逆相关对数 cold-pre 有界；任意 |g|≤1 可按原子线性组合以 X_r 逼近。**warm 条款**：若 r<j 且请求为 warm，warm 有界输入 X_r(g)≥a（log(1/a) warm）⇒ 在归一化图测度 μ_c 下与 warm 复杂度原子相关，全部对数 warm 有界；**不使用 Q_j 或 W 的高度**。

- (b) cold 证明：网格端点+枚举步长把逐路径切片化成有限可能 ⇒ 一条公共切片上大 U^{r+1} 范数 ⇒ cube comparison 转成混合环境立方相关 ⇒ Gowers–Cauchy–Schwarz + 逆定理给环境 niltest×位置扭量。逼近方向用 X_r(φ)≤δ_sl^{−1}E_U m_U|φ| 与超额质量、双倍帽、Lemma cube:separation。
- (d) [推测] 失败路线一：若 warm 条款试图对"包含多个稀疏因子的条件对偶"断言逐点帽，则在第 q 步 Cauchy–Schwarz 后的支撑交不干净——论文明确说 "no pointwise cap for a conditional dual containing several sparse factors has been asserted"，改由 pairwise 均匀性绕过（见 §5）。

**停时树（ap:path:stopped-tree）**. 层按 1..D 采样；入层 j 时把已有仿射映射与整提升多项式精确代回 C_j；先测秩（失败停），再在可行中心集 C_j={c: ‖c+l_j−b_{j,0}‖_∞<(1+γ/2)w_j}（对某 b_{j,0}∈Z^{d_j}）上取 Haar 中心，采样 ψ，恒等式 C_j(ψ(t))−c=y_j(t)+β_j(t)，**原始决定槽 b_j(t)=β_j(t)+b_{j,0}**。丢弃规则删概率、**不重归一**幸存者——各层到达历史携带次概率律；rank-stop 概率只许计入 Q_{≥j}。无"全体层最细精度的单一根均匀性检验"。

## §4 秩切割准备（preparation）

**Proposition 4.1（prepared system with triangular costs，ap:major:preparation）**. 给三角两盒证书与降序预算：经多项式次秩切割交易后，得到任意小 prescribed 比例目标折扣的证书，使实际采样程序中每个秩停概率 ≤ prescribed 界；每次交易后可重启检验。块 i 新增维度是严格上方维度的多项式；其宽度对数增量是维度数据、p、更高层数值预算的多项式，**除加性携带自身初值外不依赖自己的初始宽度对数**。

**Lemma 4.2（backward rank transfer，ap:major:backward）**. 若停时采样在块 h 以超阈概率失败秩检验，则存在整行 λ（在 W_h 上非零、‖λ‖≤R_h）使在 R^n×⊕_{i<h}K_i 上
$$ \lambda A_h=S\Bigl(\tfrac{u}{\widetilde H},\Bigl(\tfrac{b_i-A_i(u,b_{<i})}{w_i\varepsilon_i}\Bigr)_{i<h}\Bigr)+R(u,b_{<h}), $$
S 的对数系数界与 R 的原始整变量公分母对数是 **h 层 cold 预算单独**的多项式；每个 log(ε_i^{−1}) 在 i 层 warm；慢项与有理项分别有相应界的 ambient 延拓。

- (b) 证明三步：鸽笼一个失败行并剪枝到条件成功率固定幂的前缀；逐层 j<h 回抬失败关系——对度元组按"最高层优先"的字典序，从原始多项式残差与局部 slow+rational 分裂两处同时提取系数张量，用 Lemma 4.6（major refinement）同时锐化，再"慢张量×偏差单项 (b_i−A_i)^α"对"有理张量×原始单项 b_i^α"相减；相减合法性靠 Lemma 4.4 前向算子维度控制 ⇒ "evaluating a deviation divided by υ_j does not introduce an inverse power of υ_j"，再由 prelim:separation **逐系数精确相等**（不是近似相等——"No assertion of approximate equality is used before multiplication by a possibly very large coefficient of a later A_i"）。度 0 层鸽笼常数张量对：有理差公分母有界、大小被慢范数控制 ⇒ 有界区域的有界分母格子有限、对数基数可控。
- (c) 有理高度不作"每切一次幂一次"：把所有已施整行堆叠、连同 λe=1 一起解，Cramer 法则给多项式高界（同时性计算）。
- (d) [推测] 失败路线一：若回抬时允许"偏差张量与原始张量近似相等"，则乘以后续 A_i 的无界系数后误差失控——相减不合法。失败路线二：若慢/有理界共用一个预算（不分 real/rational 双账），分离引理需要边长超过公分母与慢界**两者**，会把下层宽度拖进上层代价。

**Lemma 4.3（relative rank-cut transaction，ap:major:transaction）**. 证书 𝔼fB⁻>a𝔼B⁺ 若有关系 (4.1)（λ 在 W_h 非零），经空间切片、低层残差细化、小比例折扣后得新证书：(1) h 层新多项式取值于 W_h∩ker λ；h>1 时在权重 h−1 至多加一整个 R^{d_h} 拷贝；(2) h 层相对宽度损失只用维度与 gap 因子，**独立于 R_h、Q_h 与切的有理截面大小**；h 层以上无宽度损失；更低层相对损失是其 warm 数据+h 层 cold 数据的多项式对数；(3) 每个旧高层多项式经**精确加权多项式代入**变换于其真实整数变元；(4) 空间切片代价与根边门槛对数多项式；**无与旧检验实际质量成反比的损失**。

- (b) 切割恒等式 C_h^old = C_h^new + C_in + c + I + E，‖E‖_∞≪γw_h：选有理 e∈W_h（λe=1），C_h^new=(1−eλ)C_h；先把关系两边取权重 h 齐次部（保持恒等式不放大界）；空间格点 u_*、低层残差中心 r_i 代入得完成的慢多项式 Ŝ；残差坐标细化使 λŜ 振荡 ≪γw_h；λC_h−(Ŝ+R) 在 R^n×⊕K_i 上权重 h 部分为零，用有理仿射投影**形式化**为权重 ≤h−1 的多项式；低层残差限制 b_i=Mb'_i+b_{i0}、C'_i=C_i/M；元组搬运恒等式 b_h^old=b_h^new+b_in+I 精确代入一切 i>h。选中心 l_in 均匀于单位立方："For any old strict tuple, the total center measure of admissible incoming strict choices is exactly their box volume"——覆盖计数 ∫B_new⁻≥c_−B_old⁻、∫B_new⁺≤c_+B_old⁺、c_+/c_−≤(1+O(γ))^{O(∑d_i+d_h)}，取 a'=ac_−/c_+。新 h 半径是 w_h 的固定维度/gap 分数，**独立于 e 与 R_h**。
- (c) "误差只要求在旧 h-gap 内小，不要求在新 incoming 尺度小"——incoming 盒可以任意小于 γw_h 而无须重算 E，这避免把切割的有理截面大小记到 h 层宽度上。
- (d) [推测] 失败路线一：若 incoming 拷贝只取 e-线（R^1）而非全 R^{d_h}，则 C_in 不落在线内（原文："It need not take values in the line spanned by e"），切割恒等式破裂。失败路线二：若用"旧盒缩小后按点值计数"而非连续平移覆盖，边界元组的整数索引跨 wrap 处计数不精确，覆盖不等式 c_− 需要旧检验质量的正下界——恰是"无除以旧质量"要防的坑。

**Lemma 4.4（normalized real recovery，ap:major:real-recovery）**. 替换 Φ(t)=(ψ_{[1]}(t),β_{[j]}(t))∈R^n×K。在系数坐标 (u_i/(a_jH_i))_i、(b−A(u))/v（参数侧 t_ℓ/T_ℓ）下，Φ^* 在其像上有界可逆，前向与逆算子范数均为维度控制因子；参数半径 ζ 时 a_j→a_jζ、v→vζ^j。

- (b) 恒等式 b−A(u)=−y_{[j]} 使 A 的无界系数在换坐标后消失；空间核块+各保留提升方向的专用乘积块给满维仿射像，固定次数插值给出系数界。
- (c) "先与预测值 A(u) 比较再量系数"——不同于给 K 选整数基（其条件数可能差）。

**Lemma 4.5（prime-power polynomial test，ap:major:padic）**. 固定 r：对每素数 p、e≥1、Z/p^eZ 上总次数 ≤r 且有单位系数的多项式 P，Pr(P(X)=0 mod p^e) ≤ C_r(p^e)^{−c_r}，X 坐标独立均匀，常数**与变元个数无关**。

- (b) 单变元：若零集占 >r 个 mod p^ℓ 类，取 r+1 个异类零点，Vandermonde 赋值 ≤(ℓ−1)B<ηe/2（B=binom(r+1,2)），伴随矩阵迫一切系数赋值 >(1−η)e，矛盾。多变元：主单调链至多 r 步定住一个低赋值单项，固定其余变元后用 ≤r 变元归纳界 mr p^{−(e−v)/(2B2^{m−1})}；样例常数 C_r=r²、c_r=1/(2^{2r}B)。

**Lemma 4.5'（simultaneous denominator recovery，ap:major:denominator）**. cold-pre 预算公分母上界 H 与例外概率 δ：late 采样参数可选得使在概率 ≤δ 的事件之外存在 D_0（log D_0≤poly(d+n+log(2/δ))，**与 H 无关**），同时为一切允许子空间 K：若 F 权重齐次、原始格坐标公分母 ≤H，d'F∘Φ 整系数 ⇒ d'D_0F 整系数。d' 无上界要求。

- (b) 纯自由轴上：q^N(C_rq^{−c_r})^M 型联合界（M 为固定多项式多轴）允许"多项式在路径之后才选"（对全部系数向量并集）；CRT 使各素独立；有限见证界——若 ∏p^{b_p}>R，或单因子超 R，或有子积落 (R,R²]，O(R^{−9}) 界；整除性推论"substitution 整多项式被 p^a 整除 ⇒ 系数被 p^{a−b_p} 整除"；inactive 方向按最低未除度 a_in 用系数 1 专用积提取（次数 ja_in），度归纳逐层恢复，总损失 ≤ 次数相关倍数的 b_p。
- (c) "输入精度可依赖 H，但例外积的界不依赖"——这把公分母控制从 H 的依赖里解放出来，是 warm 输出的前提。

**Lemma 4.6（relative major refinement，ap:major:refinement）**. D(u,b) 权重齐次、系数无界；若在 ≥prescribed cold-pre 比例的路径上其完整前导替换有 slow+rational 分解（慢范数 ≤B 于半径 ζ 参数盒、有理公分母 ≤ρ，输入界/比例倒数/ζ^{−1} 均cold-pre 对数），且路径有 Lemma 4.5' goodness（乘子 ≤D_0），则在 R^n×K 上
$$ D(u,b)=S\Bigl(\bigl(\tfrac{u_i}{H_ia_j\zeta}\bigr)_i,\tfrac{b-A(u)}{v\zeta^j}\Bigr)+R(u,b), $$
‖S‖_系数 ≤B exp(poly(d+n))，R 公分母对数 ≤poly(d+n+log(2+D_0+ρ))。同时对多项式多个分量成立；实范数的 pre-scaling 与整坐标 pre-height **不进入锐化实界**。

- (b) 两项分别恢复：对已冻结短坐标的固定 ambient 延拓用 lifting:candidate-major（cold-pre）得 K_0⊇W 上的分解；**然后**升纯长阈值删进一步 pre-短方向得 K'，包含 K'⊆K_0 的证明——K_0 的整消灭行在保留投影格向量 v_i 上取整值且 |v_i|≪1/K_i 超过高度界 ⇒ <1 ⇒ 为零；在 K' 上比较两分解，正次数系数"有理差=−慢差"，prelim:separation 使两者皆零 ⇒ 候选项分别继承原界 B、ρ；再用 4.4（慢）与 4.5'（有理）锐化。恢复被删方向：按最低额外 sheet 度 a 展开 ∑_{|α|=a}z^αD_α，系数 1 专用积（次数 ja、归一化大小 ≍k_iζ^j）提取，损失 exp(poly)∏(k_iζ^j)^{−α_i}，乘回 z^α **恰好抵消**（因 z_i(A(u))=0），逐度归纳，深度=固定多项式次数而非维度。
- (d) [推测] 失败路线一：若提取不用"最低度"而逐单项进行，深度=维度，损失的乘积爆炸；论文强调 "The recursion depth is bounded by the fixed polynomial degree, not by the dimension."

## §5 与当前宽度无关的检测（relative-detection）

图权 ν(u)=χ(C(u)−c)/a_χ，a_χ=∫χ；由 Lemma 3.2，a_χ≍_warm m_j；每个稀疏因子 |F_ω|≤Bν。

**Lemma 5.2（bounded-grid moments，ap:path:grid）**. 1≤q≤j、任意有界笛卡尔网格 S（选择向量互异）：
$$ \mathbb E\prod_{\alpha\in S}\nu\Bigl(\sum_{a=1}^q x_{a,\alpha_a}\Bigr)=1+o(1), $$
x_{a,b} 独立均匀于 H=∏Z/(4H_aZ)。

- (b) 计算核心：非平凡特征的相位为 ∑_αλ_α C(∑_a x_{a,α_a})；固定 α 代 x_{a,α_a}=t_a z 提取 t_1^{j−q+1}t_2…t_q 系数得 (j!/(j−q+1)!)λ_αC_{[j]}(z)——张量独立性把"联合 slow+rational"化归为单行秩矛盾；wrap 单元细分丢条带后逐盒平移不变。误差须先于 late 截断选定。
- (d) [推测] 若允许选择向量重复，t_1^{j−q+1}…t_q 提取不再孤立出单一 α，独立性论证失效——这正是 summary Part I 里 repeated Hölder "correlated grids" 卡点的严格版。

**Lemma 5.3（relative cube detection，ap:path:relative-cube）**. 混合 q-立方平均 |·|≥δ、因子 F_ω=P_ωJ_ω/m_j（|P_ω|≤1，warm 扭量），|F_ω|≤Bν，B、δ^{−1} warm。固定检测顶点 s：其输入 P_s 在归一化图测度下与 warm 归一化扭量×普通 (q−1) 次 niltest warm 逆相关；q=1 时 niltest 可为常数。

- (b) 机制（CFZ 稠密化的立方版）：逐个把非检测顶点换成单位界函数。顶点 i 处写平均为 E F_iD_i（条件对偶），Cauchy–Schwarz 给 E(1+ν)|D_i|²≥δ²/((B')²E(1+ν))。两条关键矩估计
  $$ \mathbb E(\nu-1)|D_i|^2=o(1),\qquad \mathbb E|D_i|^4=O_{\rm warm}(1): $$
  四阶矩用四棵共享根的立方，非根顶点各有 copy-专属备用坐标，distinct choice vectors 保持，乘积优界由 (5.1) 控制；(ν−1) 估计用两棵根共享立方、对根输入逐次加权 Cauchy–Schwarz，"A previously introduced positive majorant is carried once at this step, not squared"，q 步后 ν−1 拷贝占据互异根专属选择、其余因子在互异非根选择上被优界，主项相消。插值 E|D_i|≥(E|D_i|²)^{3/2}/(E|D_i|^4)^{1/2} 后**只有 s 顶点稀疏**；对 i≠s，条件在位置 u 上稀疏位置为 u+∑(s_a−i_a)h_a，某系数=±1 ⇒ 恰在 H 上均匀，逐点
  $$ |D_i(u)|\le B\,\mathbb E_{\mathcal H}\nu=O_{\rm warm}(1) $$
  ——"uses pairwise uniformity of group cube sites, not a pointwise conditional pseudorandomness assertion"。Gowers–CS 给 ‖D_i‖_{U^q} warm 大；**逆定理从未被施加于帽 m_j^{−1} 的函数**；q=1 两群点独立直接得大均值。最后除以 ν 归一化到 μ_c。
- (c) 这就是"与当前宽度无关"的机关：m_j^{−1} 的逆质量**从未**作为输出复杂度被收取——它只出现在被消去的稀疏因子里。
- (d) [推测] 失败路线一：若试图先对 ν 断言逐点条件伪随机性再套标准 CFZ，则在窄图（χ 支撑为薄管）上失败——summary §7 "estimates adequate for ordinary averages could fail when tested against the sparse set itself" 的镜像。失败路线二：若把非检测顶点一次全部替换（而非逐个），条件对偶 D_i 含多个稀疏因子，无逐点帽。

**Lemma 5.4（weighted separation，ap:path:weighted-separation）**. cube:separation 对任意正概率测度 μ 成立，系数质量与原子数界只依赖帽/尾/检测数据，**不依赖 μ 的最小原子**。证明用有限维分离 X^*(χ)≤η^{−1}、单点检验 |χ|≤Cm/η（正原子质量从此不等式中消去）、径向截断、X(v)≥η/2 与检测矛盾。

**warm 条款合成**. 换测 dμ=(ν/E_Uν)dU、m_rel=(E_Uν)m_U/ν；ν≍_warm m_j^{−1} 于实际支撑 ⇒ m_rel 的帽与超额质量 warm；X_r(g)≤δ_sl^{−1}E_μ m_rel|g；调 Lemma 5.4 得全逼近断言。

## §6 前向采样（scalar）

**Lemma 6.1（selected planes and flags，ap:scalar:flags）**. b(t)=(ψ,w,z_act)（tag 1,j,j），纯自由列 x∈F_ϖ^{v_f}、系数 1 线性 inactive 列 r_0，ℓ=m_b+dim r_0，J=∑_i{binom(ℓ+d_i,d_i)−1}，n_der=∑_i binom(ℓ+d_i−1,d_i−1)。仿射截面恒等式
$$ b\bigl(x+V(s,h),r_0+h\bigr)=b(x,r_0)+s. $$
选择 V 仅当：解数 ≤(1+ε_ϖ)ϖ^{v_fℓ−J}（ε_ϖ=c_⋆ϖ^{−2}）且系数方程 Jacobian 秩 J。记 w_{ϖ,a}(t)=选后 mod ϖ^a 解数/ϖ^{a(v_fℓ−J)}。则 (1) 选择沿平面平移不变、w_{ϖ,a}=w_{ϖ,1}(t mod ϖ) **精确**；(2) 0≤w≤1+ε_ϖ，均匀非常数系数律下 Pr(|w_{ϖ,1}−1|>Cε_ϖ)≤c_⋆ϖ^{−10}；(3) 坏旗=下界失效；W_*(t)=∏_{ϖ≤Z}w_{ϖ,a_ϖ}(t) ≤1+O(c_⋆) 处处、无坏旗时 ≥1−O(c_⋆)；squarefree d 的联合坏旗概率 ≤d^{−10}；(4) 实际系综在各体模传递，中心 Haar 平均后坏旗总单点损失 ≤O(c_⋆)×父均值+可忽略 cold-pre 误差。一切旗只依赖非常数系数数据与 t mod ϖ。

- (b) 有限域核：满秩 V 的限制把非常数系数**满射**到 (s,h) 次数 ≤d_i 的多项式（取线性左逆），故恒等式概率恰 P^{−J}；一阶/二阶矩 E(N_0/H)=1+O(ℓP^{ℓ−N})、E[(N_0/H)²]=1+O(ℓP^{2ℓ−N+2J})；条件矩 O(ℓP^{3ℓ−N+2J})；Jacobian 检查用横截导数独立均匀于 E_der=⊕_i Pol_{≤d_i−1}(F_P^ℓ)，"It uses neither factorial division nor a derivative of a high power and is valid also when P≤j"；N=poly(结构维度) 使 Chebyshev+并界给 c_⋆ε_P²P^{−20}；Hensel：选中解 mod ϖ 处 Jacobian 满射 ⇒ 深 a→a+1 恰 ϖ^{Nℓ−J} 个解，归纳给深度无关。实际路径用 Lemma 3.4 的联合有限剩余律（须所有非自由度均匀，不只首度）；带任意位置插入的成比例估计用解析移除+逐剩余类 Haar 图旗概率 q_ϖ(A_sp)，"the conditional probability itself need not be small"——只在平均宽空间斜率剩余后才用 E q_ϖ≤c_⋆ϖ^{−10}。
- (c) ε_ϖ=c_⋆ϖ^{−2} 保证 ∑_ϖ ε_ϖ=O(c_⋆) 与 d^{−10} 尾；旗与常数系数无关，因为恒等式减去 b(x,r_0)。
- (d) [推测] 失败路线一：若 Jacobian 论证用通常导数（除以幂次的阶乘），P≤j（小素数）时失效——论文为此专门写了低特征标安全的版本。失败路线二：若条件在"精确实 sheet 系数"后断言均匀性，实际采样器不满足（只有联合剩余律），flag 传递失败。

**Proposition 6.2（forward mass，ap:scalar:forward）**. 固定小 η>0：阈值 a 的 prepared 证书给存活终端单射路径集，期望终端输入均值（停路径记 0）≥(1−η)a；输入被逐层拉回并被各 active 层无坏旗掩码；支撑进制-free。≥ηa 比例的终端路径均值 ≥(1−2η)a。层 h 的秩停概率只需对**层 ≥h 的数据**有多项式对数代价；h 层后紧接的丢弃可在把层 >h 的可行中心比例入账后要求 warm 小——"this proposition does not require a lower-layer width in a higher-layer rank budget"。

- (b) 树记账：S_j、T_j 为到达 j 层秩检验的前缀上"严格+掩码输入质量"与"仅扩大质量"，s_j=S_j/∏_{i≥j}e_i、t_j^*=T_j/∏_{i≥j}e_i。单点计算给两个不等式
  $$ e_j^{-1}(1-\epsilon)S-O\bigl(\epsilon a\textstyle\prod_{i>j}e_i\bigr)\ \text{（严格步）},\qquad
     (1-\epsilon)e_jT_{\rm child}-O\bigl(\epsilon\textstyle\prod_{i\ge j}e_i\bigr)\ \text{（扩大步）}, $$
  积分得递推 s_{j+1}≥(1−O(ε))s_j−O(εa)、t_j^*≥(1−O(ε))t_{j+1}^*−O(ε)；终端 t_{D+1}^*=1−O(Dε) ⇒ E B⁺=T_1≥(1−O(Dε))∏e_i、s_{D+1}≥(1−O(Dε))a。边界损失 𝔼1_boundary1_strict≤O(nθ)e_j+δ，θ warm 小于 a∏_{i>j}e_i、δ cold 小于 a∏_{i≥j}e_i——"only later feasible-center proportions enter after cancelling e_j"。
- (c) 证书只出**严格不等式**（"its selections do not charge the inverse of that inequality's excess"），故全部后续逼近精度可从记录预算选出、与原超额无关。
- (d) [推测] 失败路线一：若把秩停概率预算写成对 Q_j 也多项式（cold 含 Q_j），则上层宽窄会放大下层停概率，违反降序规则。失败路线二：若边界条带 θ 取 cold 尺度，边界损失除以 e_j 后失控。

## §7 回传 I：比较测度与被动层（04-return + 05-ascent）

**Lemma 7.1（pairing the absolute patch，ap:ascent:paired-cutoffs）**. 绝对 patch 可换成乘积截断对 U_{r,c}^{±}（小截断在 (1−γ)r 内为 1、r 外为 0；大截断在 (1+γ)r 内为 1、(1+2γ)r 外为 0），目标小比例下降后全参数盒质量分数为正、逆对数关于 p 与维度多项式；绝对半径同型界、**不依赖任何决定宽度**；槽权重不变。覆盖比 1≤V_+/V_−≤(1+Cγ)^d。

- (b) 卷积误差 |V_±^{−1}∫Φ(c)U^±(z)dc−Φ(z)|≤C Lip(Φ)poly(d_0')r；支撑并集仍是唯一盒 ⇒ 整元组和至多一项，"without an uncontrolled sum over tuples"。选 γ 使 λV_+/V_−≤λ_0，再选 r。
- (d) [推测] 若用非乘积截断或Plateau过窄，整数元组在扩区可能多解，逐元组和失控。

**Definition（ascent format）**. 回传到层 j 时的不变量：(i) warm 切片带全质量分数 ≥δ（正收益含拉回输入 f_0；j≤s 时还含 1_no bad；负收益乘 −λ）；(ii) 两收益用绝对槽与 i>j 决定槽 b_i−C_i(u,b_{≤i−1}) 的实际残差截断（半径对数损失在 i 层 warm），扩大支撑落在旧盒固定垫版内，和为积分元组求和、每个无符号和 ≤1；(iii) 决定多项式永不用绝对槽；绝对多项式可用 j<i≤s 的决定槽、不用被动槽 i>s；绝对权重在被动步不变、主动步可膨胀，且一旦有主动决定槽则绝对权重超过之；(iv) 多项式延拓与决定恒等式是**形式恒等式**，"Equality of integer slot arguments is never inferred merely from closeness of the corresponding real polynomials."

**比较测度 𝒦（ap:scalar:measure）**. 对 modular-good 路径与固定 t_I：全父平均 E_{u∈U}×图示性（不条件化）×独立 t_I×独立均匀 t_∥^res mod 𝔐，强加 z_I(X)=z_I(t_I)、b(X)=b(t_∥^res,t_I) mod 𝔐，乘归一化 m_j^{−1}(∏_{i∈I}k_i)𝔐^{m_b}；实侧用归一化平行参数，主输出 (u/H, y_W(u)/v, z_act(u)/k)，选 pivot 线性解出、按逆行列式加权。站点函数上即归一化图预报权；无限制站点权 ≤B m_j^{−1}；帽与逼近误差**与 Z 无关**。

**Proposition 7.4（scalar comparison，ap:scalar:comparison）**. 产出模 good 路径概率 ≥τ（log(1/τ) pre 有界）、各带 pre 代价切片；有界分数可按 pre 数目 pre 代价切片被**同一菜单**的站点函数一致逼近（实际路径与 𝒦 支撑两处）。则在小于产出概率的路径集之外，实际标量平均与 𝒦 积分相差 prescribed pre-小误差；同时成立于一整个 pre-count 菜单与路径依赖切片；主动层还对 1_no bad 乘积成立。

- (b) 机制：度 0 局检半范数扩上全部归一化切片预报权 ⇒ 检测 ⇒ cube:separation 分离出阶 0 扭量模型；先在 Z 之前固定原子数/系数质量/复杂度，Markov+菜单并界。旗版：截断容斥
  $$ \sum_{d\le T\ {\rm squarefree}}\mu(d)\,1_{\{\rm bad\ at\ every\ \varpi|d\}}\ \text{（误差 O(T^{−8})）}, $$
  见证模 Q_d=∏_{ϖ|d}ϖ^{a_ϖ}，log Q_d≤2log T log Z/log 2；𝒦 上关键消去 𝒦(1_{E_d})≤C_pre E 1_{E_d}+o(1)，"There is no factor Q_d^{m_b} left"——保留匹配因子对盖上均匀输出质量的消去。选择次序：先 T 后 Z 后各体见证比较后 late 采样参数，避免依赖不可负担的 𝔐=lcm(1,…,Z)。
- (d) [推测] 失败路线一：若在 𝔐（而非个体模/见证积）上做 Fourier 展开，log 𝔐~(log Z)²/…（实际上 log lcm(1..Z)~Z）爆炸。失败路线二：截断容斥若不用"乘到首次越过 T"的见证构造，例外事件无 O(T^{−9}) 尾。

**Lemma 7.5（representation with exact determining projection，ap:ascent:representation）**. 被动层 j>s：一个次数 ≤s 的三角剪切群 G⁰ 承载绝对槽+路径依赖轨道 g_ψ。主动层 j≤s：一个联合三角群 G⁰（主动决定槽 j<i≤s+绝对槽）+**强**有理投影 π⁰:G⁰→Y（决定剪切群），及固定加权滤过多项式 P_Y 使
$$ \pi^0g_\psi(t)=P_Y(X_\psi(t)),\qquad X_\psi(t)=(\psi(t),\beta(\psi(t))). $$
两收益（除切片/旗/目标外）为 [0,1] 值域 F^±_{ψ,u}:G⁰/Γ⁰→[0,1]，公共 warm Lipschitz 界，点值网格+域网格两种逼近，**不依赖轨道系数大小**。

- (b) 构造：图外固定公共值；图内固定垫盒（半径 2w_i）逐个算高槽得站点乘子 L_ψ^±——"the separated expression agrees with the original joint expression at every point at which it will be tested, including when either expression is zero"。剪切构造：残差三角映射中按槽序做三角整变量替换归一化满目的权重系数（早先产生的大系数在其自身槽被约化），得 S⁰∘g_ψ；满权槽系数不能依赖正权变量 ⇒ 决定部分固定于父；余下变换严格降槽权、构成滤群 G⁰（滤由权亏给出）；"Forgetting absolute slots is a group homomorphism to Y"，决定剪切经作用于决定槽、冻结绝对槽而提升 ⇒ π⁰ 在每滤层强。
- (d) [推测] 失败路线一：若决定归一化用分数部分（而非系数 1 三角整替换），绝对槽与决定槽耦合，"forgetting absolute slots" 不再是同态。

**Lemma 7.6（refiltration under a strong projection，lifting:refiltration）**. π:G→F 有理、π(G_i)=F_i 每层；v 为 gr G 的分次有理子代数，v_F=gr(π)(v)；预像 H、H_F 为滤有理群且 π(H_i)=H_{F,i}。若 v_r→(v_F)_r 单射，则
$$ H\longrightarrow (H/H_r)\times_{H_F/H_{F,r}}H_F,\quad h\mapsto(hH_r,\pi(h)) $$
是分次逐层满的有理同构。核平凡性来自顶层 H_r→H_{F,r} 双射。

- (c) 这是"度归约同时保标记投影"的代数心脏：投影记录被移除的顶坐标，局部相关提供 v_r→(v_F)_r 单射（顶核中向量投影为零 ⇒ 每对约束迫使对应收益频率在 G⁰ 坐标为零，而该坐标落在 L 中，商后为零）。

**Lemma 7.7（warm ordinary matching，ap:passive:warm-matching）**. j>s、1≤d≤s：次数 d 加权齐次标量形式若在 warm 逆比例路径上其前导路径求值有公共 warm 界的 slow+rational 分解，则形式本身在 u 上有 slow+rational 分解（u/H 系数界+warm 公分母）；辅助 cold-pre 请求可在 late 尺度/秩门槛前预报，且**不对产出计分切片造成 cold 限制**。

- (b) 关键动作：对辅助论证只保留平行长参数（边 L 在 cold-pre 输出界**之后**选），两分解在长轴上求值相等、差同时慢且有理 ⇒ 分离使其正次数部分为零 ⇒ 求值继承原 warm 界；空间核的可逆块以 warm 逆范数恢复 S 的 u/H 系数；有理侧乘公分母后用 Lemma 4.5' 于纯自由空间输出，损失只依赖维度与保留路径比例逆——"not on the cold a priori denominator ceiling"。
- (c) 结尾警告："It is not a restriction of the scoring slice. Its long thresholds therefore do not become cold subslice costs in globalization."——把辅助限制与目标切片切开是 warm 输出的前提。

**Proposition 7.8（passive micro replacement，ap:passive:replacement）**. j>s 且 ascent 格式在 warm 逆比例路径成立：存在**单个** ambient 普通滤过多项式 g^U(u)∈G⁰（次数 ≤s、无 β 变元），warm 逆比例的产出路径有 warm 代价子切片，把 g_ψ 换成 g^U∘ψ 后保正号全质量分数（允许小目标折扣），继承截断与全部精确决定条件。

- (b) 沿 lifting:candidate-globalization 改造的次数归纳：顶模截断+显著频率（按分数/模式数阈值）、核顶环面联合消灭子 L、平均两域；路径依赖外场先做**同时域网格**再按点值网格分箱——"The masked site inputs belonging to these bins now form a fixed controlled menu over all paths"；对菜单逐项用 Theorem 3.7 warm 逼近，Markov/并界（κτ/(4J) 分账）在保留比例上同时有效；分离+匹配每级用 Lemma 7.7；重建保持标记投影；**去平均只在低次返回之后、只用带号分数**："If its average is at least δ_1>0, the score is bounded above by B and the set of translations giving score at least δ_1/2 has measure at least δ_1/(2B)"，Fubini 给单一平移在 warm 逆比例路径可行。
- (d) [推测] 失败路线一：若在顶环面平均**之前**去平均，带号分数的正性无法从 Haar 平均传递到单平移（负收益同乘）。失败路线二：若把点值网格直接当站点菜单而不先做域网格，路径依赖检验无法被固定菜单覆盖。

**Corollary 7.9（passive scalar return）**. 固定 g^U 后选一条 modular-good 路径+warm 子切片使 𝒦 有 warm 带号盈余；再一次小比例目标折扣后，平行剩余匹配可施加到整模 M_*（warm 对数代价），位置收益仍在 g^U(u) 上取原截断值、旧决定条件精确。机制：P_0 以上素点的密度积 ‖d_ℓ−1‖_∞≤2ℓ^{−2} 落在 1±η，两收益分别乘法比较，B_−−λ(1−η)/(1+η)B_+≥(A_−−λA_+)/(1+η)；M_* 保留 D_0'、联合切片步长 q、≤P_0 的素点的全部测深幂次，log M_*≤(C_{P_0}+log₂D_0'+log₂q)log Z。"P_0 need not grow with the inverse of that possibly tiny surplus."

## §8 回传 II：主动层（active）

**Theorem 8.1（active replacement，ap:active:replacement）**. j≤s。G⁰ 次数 r 受控、π⁰:G⁰→Y 强有理；pre 逆比例路径 modular-good、各带多项式 g_ψ(v,z)（log 坐标有界总次数、固定 z 时对 v adapted）满足形式标记 π⁰g_ψ(v,z)=P_Y(X_ψ(v,z);z)。受控外域对 F^± 带号分数（原切片掩码+全参数质量）
$$ \mathbb E_t1_{\mathcal S}(t)\bigl[1_{\rm no\ bad}F^-_{\psi,\psi(t)}(g_\psi(t)\Gamma^0)-\lambda F^+_{\psi,\psi(t)}(g_\psi(t)\Gamma^0)\bigr]\ge\delta>0. $$
则**一条保留的 modular-good 路径**允许随机多项式 g^♯(X,θ,t̃)∈G⁰，π⁰g^♯=P_Y(X;z) 形式成立，其 𝒦-分数（同切片/旗掩码、两收益取期望）≥δ−η。随机多项式=带独立随机常数参数的多项式公式；对数坐标总次数只由输入次数界控制，系数可不界。在精确 inactive 轨迹 z_I(X)=z_I(t_I) 上，每个期望收益**逐点独立于平行剩余标签的代表元选取**。保留路径比例与辅助对数代价可为 cold pre；预算增次与度增次数只依赖固定输入次数。

- (b) 对 r 归纳，三个阶段：
  1. **造单射顶投影**。dummy 短变量 z' 的多项式函数群 Ĝ⁰（层 i 上 z'-次数帽 Ci，BCH 封闭；一个受控深格 Γ̂⁰ 同时对所有整 z' 求值入 Γ⁰）；顶核环面逐 z' 显著模式（条件检验平均超过 tol/模式数），取联合连通消灭子 L_0⊆Ĝ⁰_r∩ker π̂⁰，鸽笼基（不枚举全部子集）；L_0/(L_0∩Γ̂⁰) 平移平均两收益、保持 [0,1]、分数只变可忽略误差。每个 pivot 经"域网格→点值分箱→固定 pre 菜单"给带偏配对，采样器次数 r 逼近+Markov/并界给固定 ambient 伙伴 Q_i(u)；prelim:step-drop 冻结过短轴后给纯长符号分裂；联合群
     G=(Ĝ⁰/L_0)×∏_i G_{Q_i}，F=Ŷ×∏_i G_{Q_i}，
     v_r→(v_F)_r 单射（顶核向量零伙伴坐标 ⇒ 被 pivot 消灭 ⇒ 落 L_0）。
  2. **公共站点上的精确因子**。标记符号论证给 P_F 慢/有理外符号 E、R 于受控高 tag 空间 K⊇W；离 K 多项式 proj_{K⊥}β(ψ(v_L,z_all))=o(z_all)（凡含长变量的系数有 pre 分母且由全慢被其分母倒数压住 ⇒ 零）；p(X,z_all)=(u,proj_Kβ+o(z_all))，P_F^*=P_F∘p，在路径与预报轨迹上均满足 p(X_ψ,z_all)=X_ψ。**公共站点校正**（对应 summary "align entire map into SAME"）：先于商化把局部映射换成
     $$ z'\mapsto \rho^0\bigl(P_Y(X_a;z')P_Y(X_{z'};z')^{-1}\bigr)\,g_\psi(v_L,z',z_{\rm new}), $$
     纯长符号恒等（X_a、X_{z'} 纯长首输入相同）⇒ 联合符号分裂整体保留，但完全投影变为 P_F^*(X_a,z_all)——"This correction is why we do not need evaluation to commute with refiltration."外因子提升：符号差 (πe)^{−1}e_F、d_F(πd)^{−1}∈exp v_F 分别慢/有理，经受控分次截面提升进核、复位分裂；次序 E_ψ=K_{E,ψ}ρ(E_F)、R_ψ=ρ(R_F)K_{R,ψ} 保证 R_ψ^{−1}R_ψ'=K_{R,ψ}^{−1}K_{R,ψ'}——"unrestricted coefficients of R_F will not enter a mesh of the rational discrepancies"。阈值次序："Any final increases needed for separation compare the pure-long family symbols with the already constructed matched symbols. Those symbols have no cost from lengths of axes made short by this very increase."——无逐轴阈值迭代。
  3. **度归约与分数恢复**。𝒦 上 h↦F̄^±(E_ψ hR_ψ) 经 (7.6) 纤维同构 H≃(H/H_r)×_{H_F/H_{F,r}}H_F 降至 H/H_r；域条件由有限维参数网格验证（慢因子系数网格、有理因子右陪集场——BCH 差的每个未消项含系数差、整标签处差属 prescribed 深格）；归纳输出 h^♯ 经纤维提升，左乘 ρ(P_F P_F^{*−1}) 恢复形式标记（在精确 inactive 轨迹上恒等）；商化后乘独立均匀常数∈L_0/(L_0∩Γ̂⁰)、在 z'=z 求值得 g^♯；"Haar invariance removes any dependence on the selected family lift" ⇒ 期望逐点代表无关、𝒦-分数保持——"This is an identity of expectations; an individual restored polynomial need not be periodic in the parallel integer labels."
- (c) 度不增的原因："Taking simultaneous partners, solving all component equations, or intersecting many subspaces does not iterate a degree increase once per component."—— dummy 次数帽 Ci 固定于输入度之后、BCH 闭合于 C(i+h)。
- (d) [推测] 失败路线一：若随机常数在恢复标记前固定，个别 g^♯ 需对整标签周期——summary §37 "an individual restored polynomial need not be periodic" 正是被避免的坑。失败路线二：若公共站点校正省略，家族投影停留在 P_Y(X_{z'};z')，标记在重建时引用"近似正确的整数变元"，违反 ascent 格式 (iv)。失败路线三：若把 partner 选择施加于目标分数的切片，warm 分数被 cold 因子削减——引言明言这是主动/被动的分界。

## §9 提取（extraction）

**Proposition 9.1（one-layer extraction，ap:macro:extraction）**. 在上述假设下，经 prescribed 小比例目标折扣得父切片+截断盒对，把当前原始块 b_j 加入决定系统；继承决定多项式与整数变元**精确恢复**；新切片与当前块同余 warm 对数；当前半径 r'_j=log(w_j/r'_j)≤poly(warm log data)；返回全质量分数逆对数在 j 层 cold；被动层绝对权重不变；主动层固定乘法膨胀即可；度界与预算维度无关。

- (b) 步骤：**去旗**：主动层把 W_* 插入预报泛函、从正收益删 1_no bad；W_*(P−λ'N)≥(1−η)∫(1_no bad P−λN)，λ'=(1−η)λ/(1+η)——"it does not require the flag constant to be smaller than δ"。**解 inactive 方程**：系数 1 线性列 r_i 的精确解 r_i=z_i(X)−z_i(0)−∑_blocks∏t_column（无整除/舍入条件），平均因子 C_I=∏_{omitted}k_i∏_{nonomitted}k_i/T_{0i} warm 对数。**实 pivot 与边界**：Lemma ap:macro:boundary——小行列式与端点条带可丢，总损失 ≤prescribed δ 的小分数，用备用独立块卷积给输出密度 warm 帽与固定 inactive 质量界
  $$ \mathbb E_U1_{\rm chart}1_{z_I(X)=z_I(t_I)}\le B\,m/\textstyle\prod_{i\in I}k_i, $$
  "Multiplying … cancels the possible cold concentration"——帽与预报前因子相消。**消去全主动模**：Lemma ap:macro:sections 的有限环恒等式
  $$ \mathbb E_x M^{m_b}1_{b(x,r)=B\bmod M}W_*(x,r)F(x)=M^{-v_f+m_b-v_fl+J}\sum_{(a,V)\ {\rm sel}}F(a+V(B,r)), $$
  每原点质量 M^{−v_f+m_b−v_fl+J}、原点集与权**与 B、r 无关**（对 r 无关在 r 为站点依赖整数时至关重要）；证明用 b(x+V(s,h),r+h)=b(x,r)+s 的形式恒等式与 (s,h)=(−B,−r) 平移到原点 b(a,0)=0；"The number of origins may be enormous, but it is their total measure, not their number"——**log M 不入任何账**。**定量冻结**：剩余测度 μ 总质量 ≤warm B，Fubini 从 m^{−1}∫E_U[1_{D_−}P_ω−λ1_{D_+}N_ω]dμ≥cδ 得单 ω 的 𝔼_U[1_{D_−}P−λ1_{D_+}N]≥cδm/B——"Neither an unknown support mass nor the cardinality of the section set is divided out."**暖域定位**：公共归一化尺度 ℓ（warm log），空间子盒+β 同余类+半径 r'_j=ℓv 的平移截断对保正分数；每个 D_− 点收到全小截断覆盖、每个计入大截断的整元组是真提升（小轴整数相等+同余+区间边际）；"This reasoning needs no derivative bound on C in physical coordinates: we localize separately in u/H and y/v."**权重检查**：S⁰g^♯ 中绝对成本=目的权的单项必为常数系数（来自不变满权部 S⁰），其余单项有 ≥L_wt 的隙 absorb 其他变元的固定次数成本；只有 s 个主动步 ⇒ 权重倍数由深度 s 的递归固定、**与维度/宽度/密度轮数无关**；D 取至少最大绝对权。
- (d) [推测] 失败路线一：若对返回多项式近似其系数（如截断展开），"mesh depends on a truncated expansion whose bound already depends exponentially on the truncation parameter"——summary §26 的循环顾虑；论文以"只定位定义域、不改公式"绕过。失败路线二：若原点集权重依赖 B，匹配测度非平移不变，冻结后切片约束带 B 依赖的模。

## §10 迭代闭合（iteration）

**Lemma 10.1（root compression，ap:iteration:compression）**. 根返回可转成 Theorem 2.1 的同时两盒证书（再小比例折扣），不加槽；权重 i 的额外对数宽度损失与同余代价在 i 层 warm。机制：光滑截断换回严格/扩大盒示性；同余写成 b_i=M_ib_i'+α_i 后目标精确除以 M_i；同权重槽按三角序做**逐次三角整替换**把系数化到固定有界区间，得 Tb−C（T 幺模、界有控）；旧严格残差盒的 T^{−1} 像 P 上平均 ρ-盒，0<ρ≤min{1/32, γw_min/(4max{1,‖T‖_∞})}，"Every old strict point receives full coverage volume (2ρ)^m"，扩大覆盖 (2(1+γ)ρ)^m，比例 (1+γ)^m 由目标折扣偿还；最小半径贡献最大对数逆宽——旧坐标=Q_i+warm 损失、新坐标=poly(p,维度)，取 max 即 Q_i+允许 warm 损失。可重置值空间到全空间。

**Proposition 10.2（triangular dimension bounds，ap:iteration:dimensions）**. 一轮内权重 i 的维度增量 ≤d_0+严格上方维度的固定多项式；制备切割数与结构变量计数是入维度与 p 的多项式；对 T=O_k(1+p) 轮的区间运行（从无槽开始），全部量有 **2+p 的多项式界、在任何数值精度之前选定**。

- (b) 制备内递归 H_D=d_D、H_i=d_i+H_{i+1}²：i 处每切一次 dim W_i 减一、只能由 i+1 的 incoming 满拷贝补充 ⇒ 至多 H_i 次切割，每次向 i−1 输出至多 H_i 维 ⇒ 总输出 ≤H_i²。输出 d_i^out≤d_i+d_0+H_{i+1}²。包络 B_D=d_D(0)+TP_D(p)、B_i=d_i(0)+TP_i(p,B_{>i})，先降序再按轮归纳。d_*、N_c 的预报**不使用任何宽度、秩、尺度、精度参数**。
- (c) "Restarting a probability test does not reset its value space"——重测不计入切割数。

**Proposition 10.3（triangular width bounds，ap:iteration:widths）**. 一轮 Q_j^out≤q_j+P_j(p,d_*,q_{>j})，P_j 固定多项式、**不依赖 q_j 与一切更低宽度对数**；根对数切片损失与根 log-边门槛是 p、d_* 与全部入宽度对数的多项式；T 轮从无槽、平凡宽度出发，宽度对数与根代价之和为 2+p 的多项式。数值日程四步（降序 j=D..1）：① 归一化几何与最小边（只用 p、结构/gap 界、U_{>j}——分离所需的"路径求值慢系数与公分母界只用高层数据"正是 Lemma 4.2/4.6 双账分离的用途）；② 制备宽度预报 A_j（同数据、独立于 q_j；低宽绝对小于高宽时"the corresponding relative shrink factor suffices because every old width is less than one"）；③ warm 上升预报 A'_j；④ cold-pre 与 late 选择（此刻才许计入 q_j+N_cA_j；"Auxiliary cold computations that establish a sharpened warm conclusion do not enlarge that conclusion's output budget"）。

**Proposition 10.4（finite-horizon closure，ap:iteration:closure）**. 存在 C_k、A_k：进制-free A⊆[N]、密度 α>0 不能有 log N≥C_k(2+log(1/α))^{A_k}。证明：p=C(2+log(1/α))、T=⌈log(2/α)/log(1+η_k)⌉+1=O_k(1+p) 轮；用此视野做维度/宽度预报；初始 log N 大于诸根损失之和即撑起每一轮；若永无不可能出口则 a_t≥(α/2)(1+η_k)^t ⇒ a_T≥1，而 fB⁻≤B⁺ 逐点 ⇒ 矛盾。

**Theorem 1.1 收尾**. 取 α=r_k(N)/N 的逆命题得 (1.1)；阈值形式端点用 log N≥(log(2C̄_k/α)/c_k)^{1/ε_k} ⇒ r_k(N)≤αN/2 覆盖全 0<α≤1；r-染色取 α=1/r 得 W_r(k)≤⌈exp(A_k(2+log r)^{A_k})⌉。

- (d) [推测] 失败路线一：若 T 轮的预报先于 T 的选取（循环），或若每轮重选 p，则 d_*、V_i 失去"轮前固定"性。失败路线二：根重切片若不再是原区间的整数仿射切片，进制-free 性（f 拉回后支撑无 AP）丢失——"Only the root is spatially resliced from one round to the next; it remains an integer-affine slice of the original interval."

---
# 三、summary 时间线（重头戏）：41 页思维链逐段复盘

summary 结构：Part I「倒数和问题」共 27 段（§1–§27），Part II「拟多项式强化」共 12 段（§28–§39）。以下按段跟踪，卡点引 summary 英文原文，救活观察后注映射到的论文引理。

## Part I 倒数和问题（段 1–27）

**§1 寻找不丢密度增益的结构**。基线：Bloom–Sisask 三项倒数和结果 + Green–Tao 四项 polylog + Gowers 一般界；读 LSS 指向"结构化密度增量转成普通 AP 时损失累积"的问题。尝试把 FHHK（Filmus–Hatami–Hosseini–Kelman）网格范数与二元系统计数引理推广到高阶，并参考 JLLLO–Sawhney 的角（corners）相对筛选。**卡点①（positivity 不延伸）**："The positivity mechanism useful for three-term progressions does not directly extend to longer rooted counts."——Kelley–Meka 的三项正性机制对更长 root 计数失效。同段提出"一次对齐全部频率"以避免迭代损失："No iterative losses if align all frequencies at once. Great. Need ensure S_h can be recovered from frequencies with large correlations ≥exp(−poly)."→ 后者成为 §2 胞腔方法中"一次固定全体中心/全部宽度预算"的前身（对应 Theorem 2.1 的预算预报预先选定的要求）。

**§2 稀疏计数、乘积障碍、熵路线**。**卡点②（上界估计排除不了稀疏空洞）**："Centered products can concentrate on those holes"（前文："upper density bounds on structured pieces permit rare empty pieces"）；补充："However majorant on *all* rare atoms likely unrealistic due to impossible upper and lower simultaneously for constructions with systematic holes."——用上界做伪随机优挂（majorant）不可行。**卡点③（乘积放大）**："fiber bounds did not multiply automatically"——沿纤维的界不能自动相乘，乘积放大路线死。FHHK 高阶推广继续受限于"the simple-graph encoding did not directly handle longer progressions"（二元系统需简单图）。JLLLO corners 不自动拼成长 AP；四项盒计数的正性不控例外对角。→ 救活观察：这些"上界不够、要两 sided 信息"的反复受挫，最终导致 Part II 把问题改写成**两盒证书**（B⁻/B⁺ 同时计数）+ 几何覆盖（Lemma 4.3 的 ∫B_new⁻≥c_−B_old⁻ 型不等式），用"扩大盒上界"替代"伪随机 majorant"。

**§3 端点限制与稀疏计数极限**。尝试 Ben-Sasson–Ron-Zewi 近似对偶迭代——"the contemplated iteration loses too much quantitatively"。**卡点④（ℓ³ 端点门槛）**："Aha! Exactly weak ℓ^3 from convolution and cap. Need strictly better (<3) for interpolation."——Kelley–Meka 卷积+帽给弱 ℓ³，但计数论证需要严格 <3 才能插值；计算到端点处不越界。**卡点⑤（CFZ 转移循环）**："the required two-sided linear-forms information would already include the lower counts sought here"——Conlon–Fox–Zhao 稠密化所需的双侧线性型估计恰好就是想证的下界计数，循环。**卡点⑥（反例试探）**：Keleti 全维 AP 回避构造的离散化"does not obtain the logarithmic-density lower bound"；Rankin 构造"whose known density scale left a large gap"。自适应稠密模型（norm q≥2 局部化："Great! Norm q≥2 localizes by averaging across disjoint equal subspace partitions"）死于"an increment can occur on an extremely rare child…refinement depth uncontrolled"。

**§4 多项式因子与更低 AP 计数**。有限域模型 ν≤ν_max=α^{−1/2}。**卡点⑦（上界测不出洞）**："Testing upper over subfunctions and anchoring constants can't rule holes."联合高秩二次因子模型出现希望："Good! Degree2 polynomial structure *doesn't obstruct same-set 4AP lower* when high-rank jointly. Obstruction roots in low-rank/lower-degree factors."——但谱增长论证遇 product-set 反例、需附加条件稳定性；熵提取仍丢密度。**卡点⑧（矩估计被洞击穿）**："Need lower tail at μ_H. Upper moments no."——完成函数的正矩控不住目标权集中的零点。凸性增益尝试（独立移位的 ∏g(x+id) 展开用 Fourier ℓ³ 一致凸性，"This solves k=4 counting lemma via Holder! Also arbitrary matrices S3 via cotype martingale?"）死于"shift grids whose cycles destroyed independence"。

**§5 从稀洞到条件凸性增益**。Hahn–Banach 分离尝试："no need residual cap except in dual where bounded. Excellent!"——残差只需在对偶里有界；但迭代仍买不起。→ 论文对应物：分离论证最终进入 Lemma 5.4（weighted separation，任意正测度 μ、与最小原子无关），"the positive atom mass cancels from this inequality" 正是当年"residual cap 只在对偶"想法的成品。

**§6 随机限制与消去障碍**。重复 Hölder 放大相关网格、对齐洞破坏独立消去；Janzer–Milićević 多项式 rank 界用于 bias→低度结构，但"Small partition-boundary probabilities became inadequate after multiplication by large coefficient sums"——**卡点⑨**："Need a norm-based operator bound for Schur multiplier error rather than entry absolute."→ 论文对应：大系数和与界相乘的问题最终由"系数无界但恒等式精确"（§2 (iv) "formal identities"）+ 系数张量整体处理（Lemma 4.6 "entries of a tensor are processed simultaneously rather than one monomial at a time"）解决。

**§7 自适应洞到压缩多项式约束**。高阶范数（固定 cube norms）"undercount many independent polynomial modes"；KL LM 全局超压缩"concentrated dependencies and high levels still obstructed"。嵌套 affine flats 想按度分层秩需求（Lampert–Ziegler relative rank、Janzer rank 界为输入）——定量逆定理输入不确定。整数进位（summing lifted field coordinates，carries 以多项式概率相消）图像太小。→ 对应论文最终放弃有限域、直接在整数盒上做（附录 sampling/cube 的整数理论）。

**§8 slab 塌缩到熵计数**。有限域嵌入强制二阶差分为零，但"nonzero vector directions could lie in the kernel of every block sum, producing constant images"。**卡点⑩（有限域转移结构性失败）**："Finite-field linear tests fully expose residue at small cost (log q bits), so reduction fails structurally, not just counts."——线性检验以 log q 比特代价完全暴露剩余类，**结构性**（非定量）失败。→ 对应论文：彻底弃用有限域模型，附录 foundations 直接建立整数格/环面上的全部机制。**卡点⑪（简单鞅失败）**："Thus simple martingale fails. Maybe choose **adaptive basis via polynomial inverse** such that relevant frequencies revealed early before spikes materialize."——坐标滤波中简单鞅的绝对创新估计把无关晚期尖峰也计入；"adaptive basis via polynomial inverse" 的想法在论文中化为采样器的专用不相交乘积块与纯自由列（§3.2），让"相关频率早显露"。**卡点⑫（CFZ 再次循环）**："the linear-forms conditions in Conlon–Fox–Zhao's relative theorem supplied more than its upper-only spread assumption"——上界假设不满足 CFZ 线性型条件。

**§9 熵跳变到正网格与整数障碍**。**救活观察①（协方差核）**：相关仿射函数产生逐点非负协方差核
$$ \mathbb E\,\sigma\nu_i(u)\nu_i(v)=1-t+tuv,\qquad 0<t<\tfrac12, $$
而交叉核有负系数——"A deficit in the full progression count could consequently become an excess in a mixed average." 紧接着："This is big. Need convert single-grid excess to density increment over integers with manageable complexity, avoid previous integer relative transfer burden."→ 论文对应：该核计算落入 §5 的有界网格矩与相对立方检测（Lemma 5.2/5.3）：网格超额（E∏ν=1+o(1) 的偏差）通过 Gowers–CS 与逆定理转成图测度下与 niltest 的相关，m_j^{−1} 从不进入输出复杂度——"convert single-grid excess to density increment" 的严格实现。

**§10 度归约与交替局部分解**。目标暂定 r_k(N)≪N/(log N)²。Leng 高效均匀化"horizontal-character obstructions did not supply the required degree reduction: lowering nilpotent step can leave polynomial degree unchanged"。悬挂想法："Key idea! Linearize polynomial nilsequence via suspension to linear sequence in s-step nilmanifold…"——**卡点⑬（nilsequence 悬挂）**："an integral drift can disappear modulo the lattice, defeating its proposed subgroup restriction"——整漂移在格上消失，子群限制被击穿；除以小相位均值的导数表示代价爆炸。→ 论文对应：度归约不走 suspension，而走**符号账+精确因子**：顶频率显著的联合消灭子 L_0 平均（Theorem 8.1 阶段 1）+ refiltration 纤维同构（Lemma 7.6）+ 公共站点校正（Theorem 8.1 阶段 2），逐步降度而保持形式标记；"integral drift" 问题由"慢/有理双账分离"（Lemma 4.6 实界与公分母独立锐化）绕开。

**§11 保持相对密度增量可负担**。**救活观察②（相对逆定理按密度计费）**："Need relative inverse theorem *increment count* depending only relative density*, rather than black-box HB paying b."（HB=Hahn–Banach 分解）。→ 论文对应：复杂度用"对数密度参数 p=log(1/a)"计量而非逆超额（证书超额无定量下界的约定，§2），检测/逼近代价全部写成 p 的多项式（Theorem 3.7、Lemma 2.2）。同段尝试把 g 表示为光滑检验乘积："If every added test retained sufficient relative mass and stable output size, logarithmic mass and complexity costs could accumulate additively"→ 化为 §7.4 的被动标量返回（乘法比较、M_* 保留）与 Lemma 7.9。

**§12 为什么控制维度不控制宽度**。条件 AP 计数生成的加性网格经重复 Hölder，"Their final two positions remained coupled"；有界耦合密度可在分离 Gram 核非负时仍偏正内积。低秩正二次相 ‖x‖²/α 强制大幅缩短：**卡点⑭**："Positivity smooth irrational low-rank counterexample forces log cost factor 2 independent d!"——正性+光滑+无理+低秩反例强制 log 代价因子 2（与维度无关的额外损失）。→ 论文对应：宽度损失全部走"相对 shrink factor"（"every old width is less than one"，§10 日程步②）与覆盖比 (1+O(γ))^{O(∑d_i)}（Lemma 4.3），不存在固定的额外因子 2 累积。

**§13 放大密度增益而不乘维度**。**救活观察③（packet 增量，全文最重要的一句）**："Several small increments might form a packet giving a large fixed factor K." → "Then multiplicative increment factor K per iteration, choose K huge enough to absorb block constants! This is extremely important."→ 论文对应：固定增益 (1+η_k)（Theorem 2.1）+ "Polynomial exponents and the fixed gain are independent of the number of increments"；"absorb block constants" 化为各处固定比例折扣总和 < 绝对增益的日程设计（§10.3 开头：gaps and proportional discounts 消耗 "an arbitrarily small fixed part of the absolute gain"）。同段区分坐标数与精度："Widths might deteriorate rapidly, provided the exponent controlling their recurrence remained independent of p"——正是 triangular 预算的雏形。

**§14 通过重复密度增量控制维度**。递归 d_{new}≤d_old(2+p)^C 击败 packet 策略。短坐标方向的具体想法：P(x)−P(x_long,x̂)=∑(αν−αν(x̂))t_ν(x)（deg t_ν≤r−1），**卡点⑮**："For degree r≥2, if difference has fast variations depending short axes, can express via lower-degree polynomials t_j and mixed terms without Weyl!"——无 Weyl 的降度表达式；扩展到 nilsequence 时"Rational and smooth corrections introduced floor coordinates whose number was still uncontrolled"。→ 论文对应：整楼层坐标计数由 dummy 短变量的多项式函数群 Ĝ⁰ 的次数帽（层 i 上 Ci）统一封顶（Theorem 8.1），"Taking simultaneous partners…does not iterate a degree increase once per component"。

**§15 从相对光滑化到正采样律**。相对 Croot–Sisask："This yields relative Croot-Sisask almost-periodicity under mere β autocorr and β' Fourier. Major progress."（对应论文采纳 Schoen–Sisask 半径敏感几乎周期性，保留入射半径乘法因子）。**救活观察④（ annihilator 指数）**："This implies finite group generated by needed annihilators has exponent <D0 (or |group|≤D0^n), eliminating lcm! This is key."——消去巨型 lcm。→ 论文对应：𝔐=lcm(1,…,Z) 从不作整体均匀性断言（§6 "No equidistribution assertion below uses the whole modulus 𝔐"），一切走个体模+见证积（Lemma 7.4 的 Q_d），与"eliminating lcm"完全一致。

**§16 通过分级提升控制维度**。递归 d_{new}≤d_old^{poly} 击败分组；大环境比较序列引入隐藏整数部坐标。**救活观察⑤（同时对齐）**："Better: align entire map g_P (auxiliary okay large) into SAME via iterative Fourier pruning and simultaneous splittings, preserving local tests as modifications of one map into original target with Y fixed."→ 论文对应：Theorem 8.1 的把局部映射经公共站点校正对齐为单一映射、伙伴作为修改——"preserving local tests as modifications of one map" 字面实现于 (8.5) 的 ρ⁰(P_Y(X_a;z')P_Y(X_{z'};z')^{−1})g_ψ。

**§17 从分级正则化到结构化比较问题**。采样长度晚于正则化选取："This previous failure was *power gap* L^{poly} requiring log L multiplying D times ->tower. Here gap only factor A independent L!"——幂间隙改乘法间隙。→ 论文对应：§3.2 尺度缺口 "among more than dim W⊥ consecutive disjoint multiplicative intervals of ratio A, at least one contains none of these numbers"，A≤L≤A^{O(1+d)}——乘法间隙选择定理化。反例："A counterexample then concentrated an arbitrary baseline on a union of rare congruence events"→ 论文用 W_* 平面选择权（Lemma 6.1）把罕见同余事件的权重均匀化。

**§18 从物理剩余混合到符号正则化**。两个采样点差坐标的 gcd 控制共享同余条件；**救活观察⑥（分级 nil 正则性）**："Number of modes dimension poly. Iteration depth d bounded, so logS growth polynomial okay. This could solve! Let's formulate hierarchical nil regularity."→ 论文对应：分层正则性落地为"逐层符号账"：每层 C_j 的符号（权重 h 齐次部）+秩条件（Definition ap:rank-conventions），秩切割沿层降序传递（Lemma 4.2 向后秩转移），深度=固定 D 而非维度。度 1 基案："it reread Theorem 17 of Bloom and Sisask to obtain regular Bohr sets of almost-periods for sifted convolutions"——即 shift 比较的度 1 基础。

**§19 从绝对增量到相对提升瓶颈**。正网格计数打包成增量 packet；LSS Lemma 2.1（*Improved Bounds for Szemerédi's Theorem* 的引理 2.1）用于"partitioning into progressions on which the niltest oscillates little, then discarding short pieces using the average-length bound"——**LSS Lemma 2.1 把 niltest 分割到长 AP**：正 patch 分数重置为普通密度增量、结构区域重置为普通区间。计算："sufficiently large packet gains, together with its transfer and reduction steps, would establish log N ≪ (log N)^3 型（log r_k(N)≪(log N)³）"（原文 log r_k(N) ≪ (log N)^3），dyadic 求和给倒数和结论。两个障碍："sampled nilsequence tests varied too freely to select a small fixed candidate family"（→ 论文以域网格+固定菜单解决，Theorem 3.7/8.1）与"the sampler's marginal density lacked the bound needed for a Hahn–Banach separator argument"（→ 随机化常数多项式标签界边缘密度，Theorem 8.1 的"randomized constant polynomial labels to bound the marginal"）。

**§20 采样几何与对齐框架极限**。约束仿射采样器 ψ(t)=x+Vt：有理子空间投影格高度可能巨大；"Cancellation between continuous covolume and lattice spacing suggested a route to estimates independent of orientation"——连续协体积与格间距相消 ⇒ 方向无关估计。**救活观察⑦（参数定序）**："We cannot choose m after post-b because b may be (p+m)^D from all recursion. Need m fixed function p before defining b."→ 论文对应：全部"结构数在数值精度之前固定"的约定（§3.1 "Structural numbers of columns are fixed polynomials in the structural dimensions, before any numerical precisions"；§10.2 d_* 预报"before any numerical precision"）。简化②："Can avoid integration by parts many derivatives; just one L¹ variation."→ 论文对应：§7.2 比较测度的"one L¹ variation"式处理（截断有理 Fourier 密度按个体阶、均匀绝对尾恢复）。

**§21 加权提升到收缩审计**。慢变要求"required substituting full constraint polynomials rather than just their leading terms"（完整约束多项式代入，不只首项）。加权提升以势 ∑_h h·dim W_h 处理楼层坐标；最终坐标界 d_0+dC^{poly}、递归预算先于 late 秩/采样门槛固定。LSS Lemma 2.1 再次用于重置："The assistant questioned whether this recursion preserved positivity"——**救活观察⑧（收缩符号）**："terminal zero. Thus γ positive."——收缩率 γ 为正的验证完成。→ 论文对应：绝对规则不可能出口+固定增益使"positivity preserved"成为迭代闭合（§10.4）。

**§22 检验所提转移架构**。审计链条：多项式 nilsequence 检验的 bias 迫使结构路径顶阶代数归约（移位比较、格协体积、慢/有理系数去除逐一查）→ 单侧支配经平移正权乘法向低度传播（Bohr 集、(hμ)^{1/4} 凹势）→ LSS 逆定理在阈值 e^{−p} 给 nilsequence 维数 poly(p)、复杂度/逆相关 exp(poly(p))。**LSS Lemma 2.1 的正式角色**："partitioning into progressions on which the niltest oscillates little, then discarding short pieces using the average-length bound [35]"——迭代若缺相对提升控制"the length losses could overwhelm density amplification"。→ 对应论文：该重置角色由 Lemma 2.2 的证明结构承担（固定维绝对规则+相对提升），interval reset 在 Lemma 2.2 的"slice"与 §10.4 的"root slice remains an integer-affine slice"中体现。

**§23 提议密度增量的参数均匀性**。加权多项式的慢+有理分解：平移编码成多项式群产生闭多项式 1-形式，其势给可积性步骤。**救活观察⑨（逐扭量比较）**："This comparison for **each** twist J no global joint test, so no lcm growth."→ 论文对应：见证积 Q_d 与个体模比较（Lemma 7.4），从无联合 𝔐 检验。LSS Lemma 2.1 第三次出现："seeking long progressions on which the nilsequence test varied negligibly compared with the score. But approximation bounds had to remain independent of late sampling scales, lattice heights, and prime-depth cutoffs."→ 该独立性最终由 warm/cold/late 三账 Definition ap:budgets 形式化。

**§24 审计转移、提升与定量秩控制**。秩准备把失败方向降一权："Potential many cuts O(jD) because ∑h dim W_h starts jD, each violation reduces dimension h by1 and adds dimension h−1 line, net drop1."→ 论文对应：切割计数势（§4.6 "Each such cut removes one dimension of W_h…c_h is at most the initial dimension at h plus its total incoming dimension"）与堆叠行同时解（无重复幂化）。

**§25 定量修补与基础审计**。Taylor 数组与 Haar 测度比较（不称全变差收敛）；格纤维指数依赖固定输出行数而非输入系数数。慢/有理因子调整在基础"步降+移位比较"复核前完成。度 1 移位比较关键危险："repeated increments must avoid dependence on the parent rank that would accumulate into a tower"→ 论文对应：Theorem 2.1 宽度规则不含本层秩阈值与父秩（Definition ap:budgets 的 late 数据次序）。

**§26 定量审计与新的循环顾虑**。归一化问题："the sampling-density domination may exceed the error budget unless the logarithmic parameter is enlarged first"→ 修复=先放大对数参数（对应论文先固定 p 再定精度）。立方密度比较正则性随扰动变小而退化→改用 Jacobian+全变差比较理想/扰动推前律。**卡点⑯（截断展开循环）**："a physical mesh depends on a truncated expansion whose bound already depends exponentially on the truncation parameter. The assistant leaves this circularity concern unresolved."→ 论文对应：提取定理反其道——"We therefore localize only its domain, in the joint normalized coordinates (u/H,y/v), and keep the formula unchanged"（§9 开头），完全绕开网格化返回多项式。

**§27 倒数和证明的收尾审视**。packet-秩界 log rank ≤ poly(2+p_0)·polylog；重复 O(p log p_0) 个 packet 保多项式秩。**兜底检查**："The assistant checked for hidden dependence that could defeat this calculation."→ Part I 交付了候选证明（r_k(N)≪N(log N)^{−3} 目标），Part II 随即被要求强化。

## Part II 拟多项式强化（段 28–39）

**§28 更强目标与精度代价**。目标 r_k(N)≤C_kN exp(−c_k(log N)^{ε_k})，阈值 exp(A_k polylog)。**核心诊断**：相对提升加 patch 秩（加性、好），但反复把对数资源界升至固定幂（坏）：递归对
$$ a_{n+1}=a_n\,2^{a_n\,C}\ \text{（增益）},\qquad b_{n+1}=b_n+(2+b_n)^C\ \text{（资源）} $$
增益快但 log b_T ≪ a_T log(2+p)——"amplify density rapidly while still giving log b_T ≪ a_T log(2+p)"。**卡点⑰（精度递归）**：早先提升论证"could replace a logarithmic budget p by (2+p)^C"；"iterating whole operations still threatened the desired threshold exp((log(1/α))^{1+o(1)})"。**救活观察⑩（输出不含旧精度的存在性使用）**："Height encoded but pre-precision governs occupancy; to target a rare high-density cell cannot ignore tiny mass for detection/global inverse. Could use full old complexity in proof of existence/globalization without incurring it in output patch Lip!"——存在性/全局化可用旧的全部复杂度，只要输出 patch 的 Lipschitz 不入账。→ 论文对应：cold 辅助计算与 warm 输出分离（"Auxiliary cold computations that establish a sharpened warm conclusion do not enlarge that conclusion's output budget"，§10.3 步④）。**救活观察⑪（每轮 exp(−p^C) 因子独立于旧精度）**："Need domains retain structure for each of O(p) increments at cost exp(−p^C) factor independent of old precision."

**§29 归一化符号与相对提升**。两预算强化：新增益 poly(p)，旧图宽 α^{−p}、p≫p₀。度 h 图被次数 r<h 函数检验时用多项式张量独立性转移归一化相关（→ Lemma 5.2 的张量提取）；r≥h 时受约束立方顶点依赖阻断同一论证。**卡点⑱（同时实现失败）**："Violation cannot be distributed; amplification pointed from first slow requirement to endpoint. So simultaneous realization fails even approximate."——违反不能摊派，同时实现连近似都失败。→ 论文对应：放弃"同时实现"目标，改为**分账**：warm=宽度损失、cold=代数代价，hybrid 检验 g(φ(g(u))g(u,h)g(β))（慢实因子×环境多项式映射×有理剩余因子）——正是 Theorem 8.1 的随机多项式输出与其 𝒦 期望分离。救活观察："Real mesh of u can be in slice cost only; width of y_h determined by chart-relative smooth derivatives e^{poly(p)} if t-slice simple."

**§30 仿射限制与度控制**。环境度 d≈p²、检测度 s=k−2。**卡点⑲（同时制备）**："Processing old layers separately could yield p²D > d, defeating a fixed degree bound."**卡点⑳（递归放大禁令）**："At depth log p yields p^{C log p}. Need avoid using amplified rule recursively (side length multiplication). Thus constant increment iteration only: rank growth must be additive/hierarchical, widths same."→ 论文对应：固定增益+加性秩（d_i+d_0+P_i）+层级宽度正是把此禁令写成定理（Theorem 2.1）。Hensel 线性化尝试："Could use Hensel linearization of polynomial map along some structured affine subspace of t to right-inverse low-coordinate variables as genuine linear polynomials with rational coefficients mod M plus small-modulus restrictions."→ 论文对应：仿射平面恒等式 b(x+V(s,h),r_0+h)=b(x,r_0)+s + 有限环上的 Hensel 提升（Lemma 6.1/9.3）。

**§31 分离内部精度与输出宽度**。精确纤维 F(t)=c 与粗邻域在检验 F(t(t,h)Γ)（对 h 均匀）下的比较；块间耦合破坏独立。**卡点㉑（张量独立不可与任意 nf 检验共存）**："Cannot tensor independence B blocks with arbitrary nf test coupling all blocks. But can Cauchy-Schwarz and apply high-rank inverse estimate with dimensions m huge; exponent degrades poly(m), rank maybe enough but circular."→ 论文对应：主动层保留短变量于多项式族+逐 pivot 伙伴（"Symbol slices for distinct pivots need not intersect: we use only their common remaining pure-long variables"），把耦合从独立性假设转移到公共纯长变量上。有限调色板 d 层把"层权重复乘"改 d↦d(d²) 型 cap p²α⁻¹——**救活观察⑫（依赖图层级）**："The final idea preserved a dependency graph between levels. Rank-preparation downgrades, integer carries, and short parameter directions remained obstacles to closing that scheme."→ 即 triangular 依赖图（权重 h 只引用 <h）的最终形式。

**§32 反复回到区间的问题**。**卡点㉒（旧宽驱动失控）**："Old slot complexity maybe rank O(poly(p)) widths tiny exp(-poly(p)); losses in outputs depending old widths lead runaway recursion."→ 论文对应：宽度规则 Q'_j−Q_j ≤ P'_j(p,预报,Q_{>j}) 的三角性。主动/被动分离萌芽："It revisited…retaining passive old constraints and transforming only active low-degree data."固定 sheet 的代价："for ν=(v,av₁), fixing v′−av₁ can impose a width of order 1/α on the fractional part of v"——薄层条件化坑。

**§33 受约束采样与标量转移**。拒绝 ultraproduct（"quasipolynomial does not give a uniform exponent"）。**救活观察⑬（缓冲盒证书）**："a buffered invariant 𝔼 f·B₋^strict ≥ a 𝔼 B₊^buffer. This would protect positive mass from tangencies to chart boundaries. Passive determining masks would remain ambient functions; active ones would be preserved exactly by a marked projection while new coordinates alone acquired larger degree."→ 论文对应：B⁻/B⁺ 双盒证书（Definition §2.2）+ "(1+γ/2)" 可行中心集（停时树 (3.2)）+ 被动掩码保持环境函数/主动标记精确投影（ascent format (ii)(iii)）。**卡点㉓（带号稠密模型循环）**："improving approximation enlarged the model cap, and the inverse theorem could return a correlation smaller than the approximation error."→ 论文对应：逼近在**预报测度/图测度**里做、相关性在 X_r 半范数里测（两个不同泛函），分离引理的帽-尾-检测三角避开该循环。**救活观察⑭（全局强亏损）**："Absence of AP is global strong deficit, requires correlation affecting almost all f or severe concentration."→ 绝对规则的两分支（相关或不可能）。

**§34 秩准备与分层宽度预算**。重读"height-independent lattice charts"、"abstract coefficient normalization vs normalization of the actual tilted law"、"cube-image errors controlled by total mass rather than a large density supremum"。递归对再现。**救活观察⑮（先插新槽后测集中）**："Instead of replacing B with selecting chart cells immediately, insert new slots with unrestricted centers and update evaluation map candidate masks. Need measure concentrations only after prep complete."→ 论文对应：准备交易在**覆盖选择**后才固定中心（Lemma 4.3 "measurable, for example by using fixed projections for each discrete sheet value"），且"no loss proportional to the inverse of the actual mass of the old test"。缓冲盒："Strict and buffered boxes satisfy 𝔼1_strict≥𝔼1_buffer. Their gap protects against tangency during refinements."

**§35 三角密度增量提案**。被动层稠密化："densifying a sparse cube average one vertex at a time before applying LSS inverse theorem to bounded dual functions. This avoided directly inverting a function with the large cap imposed by a narrow chart."→ 逐字对应 Lemma 5.3 的证明（"First replace all vertices other than the designated detector by unit-bounded functions, one at a time"）。**救活观察⑯（三角记账正式化）**："The intended bookkeeping let dimensions grow from higher blocks and each logarithmic width loss depend only on higher widths. The assistant calculated that, with those preparation and transfer bounds, repeated constant multiplicative increments would yield the desired quasipolynomial progression bound."**救活观察⑰（宽度规则命名）**："The crucial requirement was that the loss in Q_{h,new}=log(2/w_{h,new}) depend on higher widths, not on Q_{h,new} itself; descending induction would then control O(log(1/α)) increments."**卡点㉔（奇异水平集）**："Cannot ensure at least many V for all t if B level set singular at some t. Flags needed."→ 论文对应：旗/几何覆盖不需要点分布正则性（§2.2 "Boundary conventions may be chosen consistently and do not require any regularity of the point distribution"）+ 备用块密度帽（Lemma 9.2）。

**§36 全局化主动与被动层**。顶单射重建 g≃(g/G_{r,top})×_{F}πg 型分解。**救活观察⑱（主动层关键账）**："Major issue replacing candidates (globalization) without consuming w_j. For active j layers r maybe high, detection cold in Q_j; symbolic lifting uses P_j coefficients unconstrained; want paired score width lower at j = w_j exp(-poly(warm)), at all >j same."→ 论文对应：主动检测 cold 于 Q_j 允许（Theorem 3.7 cold 条款 + 主动论证 "the auxiliary bounds may depend on Q_j"），但**配对分数与宽度损失** warm 于 j（Theorem 8.1 末段 "when δ, the original slice, and η have warm bounds, the resulting score and slice still have those bounds"）。被动层逐字对应："degree r<j excludes weight-j arguments, suggesting sharper bounds from separation and modular goodness"（Lemma 7.7 的"d<j 无 β 变元"论证）。

**§37 分离度预算迭代**。**救活观察⑲（降序预算全名）**："Need check thresholds from *lower or same layer repeatedly* charged as cost of width resetting w_i. Need independent Q_i. In preparation tests multiple cuts potentially need shrink h width by direction scaling 1/(‖e‖) etc."与"width budgets additive-by-layer enables O(p) steps polynomial."→ 论文对应：§10.3 四步日程的逐字实现。分解式：Φ₁=Φ(φ/(𝔐_ph), (φ−Φ(φ))/(𝔐_ph V))+Φ₂(φ,φ̂)——实插值与分母控制分离（→ Lemma 4.6 的 S/R 双账与 "real bounds in normalized residual coordinates from rational denominators independent of lower widths"）。

**§38 审计密度检测与族参数**。**救活观察⑳（warm 检测 vs 全盒检测的区分）**："The key correction distinguished warm approximation from whole-box detection: the detector could be large only relative to normalized chart measure. The proposed argument used a mean-one sparse chart weight, bounded-grid linear-forms estimates, and weighted Cauchy-Schwarz to replace sparse factors by bounded ones before applying inverse theory. The inherited niltest-to-Gowers estimate was specifically attributed to Leng, Sah, and Sawhney, Lemma B.5 [36]."→ 逐字对应 §5 全部机制（mean-one chart weight=ν；bounded-grid linear forms=Lemma 5.2；weighted CS=densification；LSS Lemma B.5=prelim:inverse 的 Gowers→niltest 桥）。**救活观察㉑（旗概率相对化）**："Need flag bad probability ≤c_*𝔼φ+ε with centers Haar, not c_* unconditional, due thin strict sets at layers all; cannot pick c_* depending on widths because v_f structural."→ 论文对应：Lemma 6.1(4) "the total one-site loss from flags…is at most O(c_⋆) times its parent mean"——比例（相对父均值）而非绝对。**救活观察㉒（停时缩放）**："Forward sampling normalizes strict mass by feasible-center proportions. A stop before h divides by ∏_{i≥h} e_i; later discards divide by ∏_{i>h} e_i."→ 逐字对应 Proposition 6.2 的 s_j、t_j^* 记账。**救活观察㉓（每轮输出宽度损失独立）**："Q_j^out ≤ Q_j + poly(p, d_*, Q_{>j}) excludes current width from added losses and permits O(1+η) rounds."

**§39 拟多项式界的最终提案**。收尾审计：canonical-lift 恒等式只在**实际轨道与精确投影输出**上要求（"arbitrary group points instead retained independent site multipliers"——对应 ascent format (ii) 的图外自由值）；共同竖直 Fourier 展开保持分组路径的网格；运输残差盒用 r_h^old=r_h^new+c_in−c−err 且新盒中心取 l_h+c−l_in、误差远小于旧扩大 gap（对应 Lemma 4.3 的 (4.2)/(4.3) 与"误差只要求在旧 h-gap 内小"）；内部剩余细分在主动返回前消失；缓冲图与当前宽度半径可比。最终主张：p≍2+log(1/α)、固定乘法密度增益、O(1+η) 轮 ⇒ r_k(N)≪_k N exp(−c_k(log N)^{ε'_k})。收尾引文："Given incoming center l_in∈[0,1]^{d_h}, new width-in τ, want r_h^n center around l_h+c−l_in."——与 Lemma 4.3 证明中 "Let the new h-center range within radius (1+γ/2)w_h about l_h+c−l_in" 完全一致。

**映射总表（卡点→救活→引理）**

| 卡点（原文短语） | 救活观察 | 论文落点 |
|---|---|---|
| FHHK positivity 只对三项 | 换计数模型：两盒证书+几何覆盖 | Lemma 4.3, Lemma 2.2 |
| Centered products concentrate on holes | 上界 majorant 弃用，改扩大盒上界 | §2.2 证书设计 |
| CFZ 转移循环（两 sided 线性型） | 稠密化立方版+逐顶点替换 | Lemma 5.3 |
| fiber bounds did not multiply | packet 固定增益 (1+η_k) | Theorem 2.1 |
| 熵/Chang 端点 ℓ³ 门槛 | 弃 Fourier 限制，走网格矩 | Lemma 5.2 |
| 有限域转移结构性失败 | 直接整数理论 | 附录 sampling/cube |
| simple martingale fails | 专用不相交乘积块/纯自由列 | §3.2 系数律 |
| integral drift disappears mod lattice | 符号账+refiltration+公共站点校正 | Lemma 7.6, Theorem 8.1 |
| 协方差核 1−t+tuv | single-grid excess→密度增量 | §5 全章 |
| 相对提升按密度计费 | p-多项式对数账、超额无下界 | Definition ap:budgets, Theorem 3.7 |
| packet 增量 K | (1+η_k) 独立于轮数 | Theorem 2.1, §10.3 |
| hierarchical nil regularity "This could solve!" | 逐层符号+降序秩切割 | §4, Lemma 4.2 |
| LSS Lemma 2.1 niltest→长 AP | 分数重置/区间重置 | Lemma 2.2 证明, §10.4 |
| Schoen–Sisask 半径敏感 Thm 5.4 | 入射半径乘法因子保留 | shift 比较输入（§1.3, 附录） |
| simultaneous realization fails | warm/cold 分账替代 | Definition ap:budgets |
| width budgets additive-by-layer | 降序日程四步 | §10.3 |
| 带号稠密模型循环 | 双泛函分离 | Lemma 5.4, Lemma 7.4 |
| 截断展开循环 | 只定位定义域、不改公式 | §9 开头 |

---
# 四、常数与参数表

**全局固定量（只依赖 k）**

| 符号 | 含义 | 出处/界 |
|---|---|---|
| k | AP 长度，k≥3 | 全文固定 |
| s=k−2 | 检测次数/主动层数 | §2 开头 "Fix k≥3 and put s=k−2" |
| D=D_k | 胞腔权重层数，D≥s，由主动步权重递归（深度 s）定出后**事先固定** | Theorem 2.1；§9.5 权重检查 |
| ε_k, c_k, C_k | 主定理指数/常数；可减 ε_k 增 C_k 使 ε_k<1 | Theorem 1.1, §11 |
| η_k>0 | 每轮固定密度增益因子 (1+η_k) | Theorem 2.1；T=⌈log(2/α)/log(1+η_k)⌉+1 |
| A_k≥1 | 阈值形式指数/常数 | Theorem 1.1 等价形式；W_r(k) 界 |
| ξ, C=C_k | 绝对规则增益 1+ξ、d_0=(2+p)^C 的指数 | Lemma 2.2 |
| d_0=(2+p)^{C_k} | 每轮新增绝对槽上限（与盒维 n 无关） | Theorem 2.1, Lemma 2.2 |
| T=O_k(1+p) | 区间运行的增量轮数 | Prop 10.4 |
| C_*, A | sheet 轴分类阈值指数 L^{C_*} 与尺度比 A（A≤L≤A^{O(1+d)}） | §3.2 |
| P_i, P'_i, R_i | 维度/宽度递推的固定多项式（只依赖 k） | Theorem 2.1 |
| d_*, N_c | 轮前固定的一轮结构预报（维度包络、切割数上界） | Prop 10.2, §10.3 |
| H_i=d_i+H_{i+1}²（H_{D+1}=0） | 制备中块 i 达到的最大环境维度 | Prop 10.2 |
| V_D=Q_D(0)+TR_D, V_i=Q_i(0)+TR_i(p,d_*,V_{>i}) | 宽度包络：Q_i(t)≤V_i，全部为 p 的多项式 | §2.3, Prop 10.3 |
| B_D, B_i | 维度包络（同型） | Prop 10.2 |

**预算参数**

| 符号 | 含义 | 界 |
|---|---|---|
| p≥2 | 对数密度参数；一切"对数预算"按 p 的多项式计 | a≥e^{−p}；p=C(2+log(1/α)) |
| a | 证书阈值（目标密度） | a≥e^{−p}，迭代中 a_t≥(α/2)(1+η_k)^t |
| 𝒫(P)=(2+P)^C, 𝓑(P)=exp((2+P)^C) | 多项式/指数对数代价记号，C 只依赖固定次数且可增大 | §2.1 |
| warm/cold-pre/late | 降序预算三账（warm 不得用 Q_{i≤j}；cold 可用 Q_j；late 为 cold 的多项式） | Definition ap:budgets |
| γ | 两盒扩大比参数；γ 可取"固定增益相关常数/充分大 poly(2+p+d_*+N_c)" | §2.2, §10.3 |

**胞腔与几何量**

| 符号 | 含义 | 界 |
|---|---|---|
| w_h（≤1/32） | 权重 h 层残差宽度 | 三角唯一性 |
| Q_h=log(2/w_h) | 宽度对数 | 递推 Q_j^out≤q_j+P_j(p,d_*,q_{>j}) |
| B⁻, B⁺ | 严格/扩大两盒示性；缓冲不变量 𝔼fB⁻>a𝔼B⁺ | §2.2；§33 summary |
| e_j | 可行中心集 C_j 的 Haar 测度；s_j=S_j/∏_{i≥j}e_i | 停时树 (3.2)；Prop 6.2 |
| v（=υ_j） | 提升图物理宽度，v/w_j warm | §3.1；m_j 定义 |
| K_i=max(1,⌈\|v_i\|^{−1}⌉), k_i=max(1,⌈K_iv⌉) | 投影格基尺度与舍入 | §3.1 |
| m_j=v^{dim W}∏_ik_i/covol(Λ) | 图质量；log m_j^{±1} cold-pre、不含子空间高度 | Lemma 3.2 |
| L | 采样列公共边；inactive/moderate/enormous 以 L^j, (AL)^j, L^{C_*} 分类 | §3.2 |
| σ<1, T_ℓ | 扰动参数（L 之后选）与参数盒边 | §3.2 |
| U=∏{0,…,H_a−1} | 父整数盒 | §3 |
|inactive 判据 k_i≤L^j / omitted 轴 k_i warm 有界 | §3.2, Lemma 9.2 |

**主动层有限环量**

| 符号 | 含义 | 界 |
|---|---|---|
| Z, 𝔐=lcm(1,…,Z)=∏_{ϖ≤Z}ϖ^{a_ϖ} | 预算模（log Z 有 pre 界；log 𝔐 从不入账） | §6.1 |
| ε_ϖ=c_⋆ϖ^{−2} | 平面选择容差；∑ε_ϖ=O(c_⋆) | Lemma 6.1 |
| J=∑_i{binom(ℓ+d_i,d_i)−1}, n_der=∑_i binom(ℓ+d_i−1,d_i−1) | 系数方程数/导数空间维 | Lemma 6.1 |
| w_{ϖ,a}(t), W_*(t)=∏_{ϖ≤Z}w_{ϖ,a_ϖ}(t) | 选中平面计数权；W_*≤1+O(c_⋆)、无旗时 ≥1−O(c_⋆) | Lemma 6.1, (9.1) |
| 坏旗概率 | Pr(|w_{ϖ,1}−1|>Cε_ϖ)≤c_⋆ϖ^{−10}；squarefree d 联合 ≤d^{−10}；截断容斥误差 O(T^{−8}) | Lemma 6.1, Prop 7.4 |
| M_* | 被动返回保留模：log M_*≤(C_{P_0}+log₂D_0'+log₂q)log Z（warm） | Cor 7.9 |
| Q_d=∏_{ϖ\|d}ϖ^{a_ϖ} | 见证模，log Q_d≤2log T log Z/log 2 | Prop 7.4 |
| M^{−v_f+m_b−v_fl+J} | 仿射平面原点质量（与 B、r 无关） | Lemma 9.3 |
| m_b, ℓ=m_b+dim r_0, v_f | 同余输出维、自由列维 | §6, §9 |

**回传/提取量**

| 符号 | 含义 | 界 |
|---|---|---|
| U_{r,c}^{±}, V_±, V_+/V_−≤(1+Cγ)^d | 配对乘积截断与覆盖比 | Lemma 7.1 |
| λ | 回传目标（绝对规则给出，逐步 ×(1−ε)） | §7 开头 |
| δ, κ, τ | 分数、产出路径概率、比较概率；log 均有对应账 | Def ap:ascent:format 等 |
| (1−ε_0)(1+ξ_0)(1−c)>1+ξ | 绝对规则目标折扣链 | Lemma 2.2 证明 |
| L_wt | 主动步绝对权重膨胀因子（L_wt>s after first active step，深度 s 递归固定） | §9.5 |
| r'_j=ℓv, log(w_j/r'_j) warm | 提取后的当前半径 | Prop 9.1, Lemma 9.4 |
| C_I=∏_{omitted}k_i∏_{nonomitted}k_i/T_{0i} | inactive 平均因子（warm 对数） | (9.4) |
| ρ≤min{1/32, γw_min/(4max{1,‖T‖_∞})} | 根压缩盒半径 | Lemma 10.1 |
| ε（步损失）, η（前向目标差） | s_{j+1}≥(1−O(ε))s_j−O(εa) 中的固定小量 | Prop 6.2 |
| (j!/(j−q+1)!)λC_{[j]}(z) | 网格矩张量提取系数 | Lemma 5.2 证明 |
| E(ν−1)\|D_i\|²=o(1), E\|D_i\|⁴=O_warm(1) | 稠密化两条矩 | Lemma 5.3 |
| H_k=∑_m 2^{−m}r_k(2^m) | 均匀调和上界 | Cor 11.2 |
| c_r=1/(2^{2r}B), C_r=r², B=binom(r+1,2) | 素数幂多项式检验样例常数 | Lemma 4.5 |

**外部输入的定量形态（使用点）**

- LSS 拟多项式逆定理（区间型；Leng–Sah–Sawhney [36] Theorem 1.2）：阈值 e^{−p} 下 nilsequence 维数 poly(p)，复杂度/逆相关 exp(poly(p))；附录证明盒与积循环群归约；Gowers→niltest 桥为其 Lemma B.5。
- LSS *Improved Bounds for Szemerédi's Theorem* [35] Lemma 2.1：niltest 在长 AP 上振荡小的分割+平均长度丢短块——思维链中的"重置"工具（论文中该角色由绝对规则的切片形式承担）。
- Schoen–Sisask Theorem 5.4 [49]：几乎周期性半径界保留入射半径为**乘法因子**——移位比较 essential 输入；度 1 基案对应 Bloom–Sisask Theorem 17。
- Kelley–Meka [33]：去平衡（unbalancing）、筛选（sifting）、大矩——度 1 移位比较的骨架。
- Conlon–Fox–Zhao [7]：稠密化（densification）的立方版本（Lemma 5.3），仅取其"稀疏因子换有界函数"机制、不需其双侧线性型假设。
- Green–Tao 轨道定量理论 [23]、Leng 高效均匀化 [37]：多项式轨道的 smooth/等分布/有理分解、步骤降低——附录 prelim 与 lifting 的工具。

---

## 补充：思维链的元方法观察（供复盘用）

1. **基准先行**：每一段开头都重读同一组基准文献（Gowers、Green–Tao、Bloom–Sisask、Kelley–Meka、Leng–Sah–Sawhney），并明确"哪个量该依赖哪个量"。Part II 的整个突破（warm/cold 分账）本质上是把 Part I 末尾已经造好的机器重新**记账**，而不是重新发明。
2. **失败清单的复用**：卡点①②③⑤⑩在 Part I 反复出现（平均每两段重查一次 CFZ 循环与 FHHK 适用域）。复盘时应注意：同一卡点换装重现不等于思路错误，而是在等待一个"改变问题形状"的新假设——这里就是"两盒证书 + 三角预算"。
3. **可验证的口头里程碑**：思维链中带情绪标记的句子（"This is big"、"This is extremely important"、"This could solve!"）恰好对应论文的三个承重结构：协方差核→§5、packet 增益→(1+η_k)、分级 nil 正则性→§4 的降序符号账。复现时优先检查这三处。
4. **自我审计的密度**：Part I §21–§27 与 Part II §36–§39 几乎全是审计（"checks"、"audits"、"scrutinizes"），其产出是把每个"先选 A 再选 B"的次序写死。论文里所有 "before choosing Z"、"before any numerical precision"、"the order will let us compare…" 的句子都是这些审计的沉淀。
5. **显式放弃的路线**：有限域模型（结构性失败）、简单鞅、熵/端点 ℓ³、伪随机 majorant、CFZ 直接转移五条路线在最终论文中**完全缺席**——这对判断"论文没有讨论 X"是否为疏漏很有用：X 大多在思维链里被证伪过。

## 附：论文章节↔素材对应（文件路径）

| 论文章 | 文件 | 关键命题 |
|---|---|---|
| §2 胞腔与增量定理 | build/sections/01-setup.tex | Thm 2.1, Lemma 2.2, Def budgets |
| §3 受约束路径 | build/sections/02-paths.tex | Lemma 3.2/3.4/3.6, Thm 3.7, 停时树 |
| §4 秩切割准备 | build/sections/03-major.tex | Prop 4.1, Lemma 4.2/4.3/4.4/4.5/4.6 |
| §5 宽度无关检测 | build/sections/03-relative-detection.tex | Lemma 5.2/5.3/5.4 |
| §6 前向采样 | build/sections/04-scalar.tex | Lemma 6.1, Prop 6.2 |
| §7 比较与被动层 | build/sections/04-return.tex + 05-ascent.tex | Lemma 7.1/7.5/7.6/7.7, Prop 7.4/7.8, Cor 7.9 |
| §8 主动层 | build/sections/06-active.tex | Theorem 8.1 |
| §9 提取 | build/sections/07-extraction.tex | Prop 9.1, Lemma 9.2/9.3/9.4 |
| §10 迭代 | build/sections/08-iteration.tex | Lemma 10.1, Prop 10.2/10.3/10.4 |
| §11 加权推论 | build/sections/09-consequences.tex | Prop 11.1, Cor 11.2–11.5 |
| 思维链 41 页 | /e/math/reasoning_traces/quasipolynomial-arithmetic-progressions.pdf | Part I §1–27, Part II §28–39 |
