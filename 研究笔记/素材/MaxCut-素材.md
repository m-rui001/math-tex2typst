# MaxCut-素材：A Direct Proof of Optimal Max-Cut Hardness（第一人称思维链复盘素材）

论文：*A Direct Proof of Optimal Max-Cut Hardness*（OpenAI，2026-09-23，38 页）。
源码：`E:\math\preprints\A-Direct-Proof-of-Optimal-Max-Cut-Hardness-September-23-2026\build\`（main.tex + sections/ 共 11 个 tex）。
思维 summary：`E:\math\rereasoning_traces`→`E:\math\reasoning_traces\basic-semidefinite-threshold-np-hardness.pdf`（16 页，标题 "BasicSDP threshold and Unique Games"，共 12 节正文 + 参考文献）。
约定：F = F₂；[推测] 标注的失败路线是本笔记的推演，非论文/summary 原文。

---

# 一、定理总览

## 1.1 主定理（Thm 1.1, introduction.tex thm:main）

> 对每个固定常数 α 满足 GW < α ≤ 1，在**简单无权图**上按因子 α 近似 Max-Cut 是 NP-难的。

即：多项式时间算法总返回权重 ≥ α·MaxCut 的割 ⇒ P=NP。GW = min_{−1≤ρ<1} 2·arccos ρ/(π(1−ρ)) = 0.878567…（Goemans–Williamson 随机超平面舍入的保证）。

## 1.2 精确 gap 定理（Thm 1.2, thm:gap）

记 B(t) = (2/π)·arcsin t（0<t<1；这是弧长–相关性换算：相关 t 的两 ±1 位点被分开的概率是 arccos(−t)/π = (1+B(t))/2… 准确说切概率 ½(1−t·相关) 给出稳定性换算）。

> 固定有理 t∈(0,1) 与常数 0 < ε < (t−B(t))/4。对带（有理）边概率分布的图，区分
> YES: Val ≥ (1+t)/2 − ε；NO: Val ≤ (1+B(t))/2 + ε
> 是 NP-难的。

关键点：**无条件**。UGC 只出现在历史叙述（KKMO07 在 UGC 下得到同一阈值；本文把 MOO 的 Majority Is Stablest 用作外部工具，但把"从影响坐标到 source game 标签"的提取步骤自己证明：树形 Fourier 分析、哈希引理、隐藏坐标解码均为本文新证）。

## 1.3 与既有结果的关系表

| 结果 | 阈值/曲线 | 假设 | 与本文关系 |
|---|---|---|---|
| GW95 | 算法比值 → GW（SDP+超平面舍入；有限精度给 GW−η） | 无 | 被本文匹配的上界 |
| Håstad01 + TSSW00 | 排除 > 16/17 | 无（PCP） | 旧的弱下界 |
| FS02 | SDP 整性间隙 → GW | 无 | 只排除该松弛，不是对所有算法的 hardness |
| KKMO07 | Max-Cut 阈值 = GW | UGC（解析输入 MOO 的 Majority Is Stablest） | 本文给同一阈值的无条件版本 |
| O'Donnell–Wu 08 | 整条 Max-Cut 近似曲线 | UGC | 本文只处理最坏情形比值（thm:gap 的 gap 族） |
| Raghavendra 08 | 一般有限 CSP 的 SDP 对应 | UGC | 本文范围收缩为 Max-Cut，不需要 UGC |
| DKKMS25 + KMS25/KMS23 + BKS19 | 2-to-1 博弈（不完全 completeness） | 无 | 本文的外部博弈输入（附录 A 重推导为仿射形式） |

## 1.4 机制一句话

从仿射 2-to-1 投影博弈（字母表 F^{n+1}/F^n，投影为满射仿射映射、每纤维两个元素）出发：把博弈自乘 T 次，每个左元组挂一个"树形 gate 码"词域 W: B→{±1}；Max-Cut 测试取共享右端点的两条边、拉回两份词、取负第二条边；gate 规则+二次遍历使**每个 Walsh 单项式恰好带一个噪声因子 t**（相关性 t 的 slice 表 + 行保持 r），于是任意割的切值 = ½ + ½E Stab_t(odd 平均) − ½E Stab_t(even 平均) ≤ ½ + ½E Stab_t(Ḡ)；NO 情形超阈值 ⇒ 超额稳定性 B(t)+δ ⇒ Majority Is Stablest（带 degree-cutoff 的 Lemma 2.1）找影响 slice 条目 ⇒ 在选中的 gate 上偶部分被平移不变性压扁、奇部分写成"仿射哈希" U(z)=Σ_q χ_q(L)c(q, z+J(q)) ⇒ 向量值哈希引理强迫某个标签 q* 带常量 Fourier 质量 ⇒ 隐藏坐标（乘积中植入一个零系数槽位 + total variation 比较）使 X 端无需知道入边投影即可拉回 context ⇒ 纤维 2^{2s} 损失的限制引理 ⇒ 两个端点 labeler 以 2^{−2s}p*θ/2 概率满足原博弈边，与 b 矛盾。

参数次序（防循环论证）：(t,ε,μ) → (s,m,p*,θ) → b → n → T → a。解码损失与 source soundness 先定，字母表维数 n 由 b 定，重复长度 T 由 n 定，最后才定 completeness 误差 a。

---

# 二、逐引理带批注重构

（按论文顺序；每条：(a) 精确陈述；(b) 证明机制推导；(c) 假设/常数的机械理由；(d) 候选失败路线 [推测]。）

## 2.0 标签–行对偶与行噪声（preliminaries.tex §2.1）

**(a) 陈述。** 设 A 为 F 上仿射空间，H = Aff(A, F)（A 上仿射形式全体，含常值 1）。对 q∈H*，χ_q(h)=(−1)^{q(h)}。求值等同
A ≅ {q∈H* : q(1)=1}（eq:labels-dual）。
**恰好取值 1 于 1 的泛函称为"标签"（label）**；H* 的一般非零泛函不必是标签。对 f: H^k→R，C=(q_1,…,q_k)， Fourier 系数 f̂(C)=E_R f(R)∏χ_{q_i}(R_i)，|C|=#{i: q_i≠0}。行噪声算子 T_r：每坐标以概率 r 保留行、否则换独立均匀行；T̂_rf(C)=r^{|C|}f̂(C)（eq:row-noise）。T_r 是与独立增量 E 的卷积，故与行的任何固定平移交换。

**(b) 机制。** 这是全文的"双 Fourier 字典"：行方向（H^k）的字符编码候选标签 q；Boolean 方向（gate 表条目）的字符承载影响（给 MIS 用）。"标签 = 在 1 上取值 1"是后面所有"奇部分 ⇒ 公共指标是标签"推理的支点：negate gate 表 F_v 的作用等价于给 P(v) 的所有行加 1，所以对 F_v 奇的系数满足 q_v(1)=1。

**(c) 机械理由。** 概率归一化的 Fourier（Parseval 给 Σ_C f̂(C)² = E f²）保证质量守恒式（eq:mass-bound、eq:hashing-total-mass）无因子漂移；T_r 保 [−1,1] 且与平移交换，是"平滑不破坏等变性"的原因。

**(d) 失败路线 [推测]。** ① 若标签定义放宽为"任意非零泛函"，则奇部分公共指标可为非常数泛函，表平移作用 (eq:table-translation-action) 中 q_{v,g1}(1) 可能取值无意义，隐藏坐标的 ρ 拉回（解码 §5.4）失去"纤维恰两元素"的齐性。② 若行噪声换成逐比特噪声而非整行保留/重采样，T_r 不再是行卷积、不与仿射拉回交换，m_q 在 pullback 下的比较（Lemma restriction）会带进 n 相关的损失。③ 若 A 取向量空间而非仿射空间（含零标签歧义），"negate 词 = 加 1"的恒等式破坏，奇偶分解与 cut 稳定性恒等式失效。

## 2.1 Majority Is Stablest 带 degree-cutoff（Lemma 2.1, lem:mis）

**(a) 陈述。** 固定 0<t<1, ξ>0。存在整数 K≥1 与 τ>0（只依赖 t, ξ），使每个 h: bits^Ω→[−1,1]、E h=0 满足
(∀a∈Ω, Inf_a^{≤K}(h) < τ) ⇒ Stab_t(h) ≤ B(t)+ξ。
这里 Inf_a^{≤K}(h)=Σ_{S∋a, |S|≤K} ĥ(S)²，Stab_t(h)=Σ_S t^{|S|}ĥ(S)²（t-相关对角耦合）。

**(b) 机制。** 未截断版本即 MOO10 Theorem 4.4 + Borell85（Gaussian 半空间在相关性 t 下最大化噪声稳定性，值换算回 {±1} 归一化后是 B(t)：g=(h+1)/2 的 Gaussian 值 ¼+arcsin(t)/(2π)，4·(¼+arcsin t/2π)−1 = 2 arcsin t/π）。截断归约：取位噪声参数 u<1，h_u=T_u h 保范围与均值；一致地（‖h‖≤1）
0 ≤ Stab_t(h) − Stab_t(h_u) ≤ sup_{j≥0} t^j(1−u^{2j}) → 0 (u↑1)。
先取有限 degree 截尾控制 t^j 尾巴，再令 u→1。选定 u 使误差 ≤ ξ/2；取未截断影响阈 δ（对 ξ/2），K 使 u^{2(K+1)} ≤ δ/2，τ=δ/2，则 Inf_a(h_u) ≤ Inf_a^{≤K}(h) + u^{2(K+1)}‖h‖² < δ，对 h_u 用未截断定理再加稳定性误差。

**(c) 机械理由。** cutoff K 的存在正是"低度影响 ⇒ 稳定性 ≤ B(t)+ξ"在 Boolean cube 上可用的形式；K,τ 只依赖 t,ξ（不依赖 Ω、不依赖维数）——这是"常数与维数无关"链条的第一环。ξ 在应用中取 δ/2（extraction Step 1），η=δ/2 是"有影响条目"事件的概率下界。

**(d) 失败路线 [推测]。** ① 若 h 的均值非零（奇性丢失），Stab_t 可为负方向的量（t<1 时稳定性下界不再有意义），MIS 前提破坏——论文用 "φ odd ⇒ 切片表同时取负时词取负 ⇒ 均值为零" 精确堵住。② 若允许 K 依赖维数 |Ω|，则 (eq:total-influence) ΣInf ≤ K 会随 n 增长，extraction 的 Λ 预算（ητ/8）与 K 的竞争失效。③ [推测] 若试图把 MIS 换成 KKL 影响定理（summary §9 提到 "small average influence across an enormous number of leaves does not give the sought contradiction"），只能得到平均影响小 ⇒ 存在影响坐标，但得不到稳定性上界 B(t)+ξ，即拿不到 NO 情形的方向（KKL 是"稳定 ⇒ 有影响"，MIS 是"稳定超 B(t) ⇒ 有影响"，前者不排除稳定性恰在 B(t) 附近的低影响函数）。

## 2.2 仿射 2-to-1 博弈定理（Prop 2.x, prop:affine-games；附录 A 推导）

**(a) 陈述。** 对每个常数 b∈(0,1) 存在整数 n≥1，使对每个常数 a∈(0,1−b)，以下 promise 问题 NP-难：输入是加权二部博弈，顶点集 X,Y，标签集 F^{n+1}, F^n，每边 e=(x,y) 有满射仿射映射 π_e: F^{n+1}→F^n。边被满足当 π_e(λ_X(x))=λ_Y(y)。promise：
YES: Val(G) ≥ 1−a；NO: Val(G) ≤ b。
**n 只依赖 b**；固定 a,b 时归约确定、多项式时间/输出规模。量化次序：∀b ∃n(b) ∀a∈(0,1−b)。

**(b) 机制（附录 A 的推导骨架，affine_games.tex）。**
- 起点：DKKMS25 Thm 4.1（由 Håstad01）给正则 binary 3Lin 的 gap：值 ≥ 1−ε vs ≤ s_*（绝对常数 s_*<1）。正则性含：变量出现有界、每方程三不同变量、两个不同方程至多共享一个变量。
- 空间与折叠：legitimate 元组 U 为 k_0 个两两不相交且相互分离的方程；V_U = F^{var(U)}（维 3k_0），H_U = span{x_e}（维 k_0），h_U(x_e)=b_e。左问题 (U,L)，L≤V_U、dim L=ℓ、L∩H_U={0}；右问题 (V,L')，dim L'=ℓ−1，L'≤L。折叠按等价类 L+H_U+H_{U'}=…，每类有固定 ℓ 维补空间 R_C 使 R_C+H_U = L+H_U（Lemma 4.2）；折叠答案 σ: R_C→F 的展开是 σ∘A_U + h_U∘B_U——**仿射双射** R_C*→L*，与满射限制 L*→(L')* 复合后是满射仿射映射，线性部分一维核 ⇒ 每纤维恰两个元素。这就是"仿射 2-to-1"的来源（论文在 affine_games.tex 明确说：affineness 是**答案空间之间**映射的性质）。
- 采样有效性：非 legitimate 概率 O(k_0²/|Z|)；L'∩H_U≠{0} 概率 ≤ 2^{ℓ−k_0}；L∩H_U≠{0} 概率 ≤ 2^{ℓ−2k_0}；总弃样 κ = O(k_0²/|Z|)+2^{ℓ−k_0}+2^{ℓ−2k_0}（eq:affine-invalid-probability），保留概率 q_all ≥ ½。边律 R = P(·|E)，TV(P,R) ≤ η = 2^{ℓ−k_0}+2^{ℓ−2k_0}。
- 完成表（completed tables）：把折叠标签延拓到所有 ℓ-空间——无效处填零线性函数；关键恒等式 H_U∩V_V = H(V)（eq:affine-validity-common-side-space，由 legitimacy 的分离条件：var(U) 上的输入方程必属于 U）保证 F_U[L]=F_V[L]（eq:affine-validity-completed-consistency）在有效与无效处一致。对每个 K⊇H_U、dim K=ℓ+k_0，同折叠类给一个 f_K: K→F，f_K|_{H_U}=h_U。
- 不变列表引理（Lemma A.x, lem:affine-validity-invariance）：X 维 3k_0，H 维 k_0，h: H→F 线性；表 F 满足上述 f_K 性质；Q∩H={0} 的 q-空间 Q；e_{k_0}=2^{ℓ+r−2k_0+1} ≤ τ_0/4。则每个极大 occurring 对 (g,W)（g: W→F 线性，P_{Q⊆L⊆W, dim L=ℓ}[F[L]=g|_L] > τ_i）满足 H⊆W 且 g|_H=h。证明：数非零向量得 L∩H≠{0} 概率 d_W ≤ e_{k_0}；若 g|_{H'}≠h|_{H'}，类内一致概率 ≤ 2^{q−ℓ}，总一致 ≤ e_{k_0}+2^{q−ℓ} ≤ τ_0/2 < τ_i 矛盾；再证明 agreement 在 W 与 W+H 两个环境下条件相同（补空间计数 2^{(ℓ−q)dim(H∩W)}），若 H⊄W 则得到更小 codim 的 occurring 扩张，违反极大性。
- 建议分布与覆盖：外层博弈先采 (U,V) 再采 Q；Q∩H_U≠{0} 概率 ≤ 2^{q−k_0}（eq:affine-validity-advice-loss）。事件 E_1（agreement(F_U)>δ²/8）、E_2（TV(L_{U,Q},L'_{U,Q}) ≤ 2^{ℓ+5}√β·k_0^{1/4}，即源文 Eq (4.3) 的 smoothness）、E_3（Q-列表非空）、E_4（Q∩H_U={0}）联合概率 ≥ δα(ℓ)/8。第二玩家用商空间表 T_γ（γ: Q→F）的极大列表，大小 ≤ M_0(ℓ−q, r, ζ_r) 与 k_0 无关；M=2^q M_0。成功概率 c_* = 2^{−r}·0.3τ_0/M > 0，总成功率 ≥ δα(ℓ)c_*/8 ⇒ raw valid acceptance ≤ δ（取 k_0 大使 DKKMS25 Lemma 5.4 的上界趋于零）。
- **先定 soundness 后定 completeness**：取 δ=b/4，Val ≤ δ/q_edge ≤ b/2 < b（q_edge ≥ ½）。然后取 k_0=j⁴、β=j^{−3}（βk_0→∞、β√k_0→0、√β k_0^{1/4}→0，含 2^ℓ β ≤ 1/8），**字母表维数 n=ℓ−1 至此只用 b 定死**。最后取 ε ≤ a/(2k_0)：completeness 给 Val ≥ 1−k_0ε/q_all ≥ 1−2k_0 ε，不动 n。

**(c) 机械理由。** "n 只依赖 b"是整篇论文防循环的锚：下游解码损失 2^{−2s}p*θ/2 只依赖目标 cut gap，若解码损失依赖 n（如经 Rao 重复或 CMM 型字母表相关的界），soundness 的选取将依赖自己引入的参数。κ 的三项都可以在 ℓ 固定后靠 k_0→∞ 压小——顺序是 ℓ 先、k_0 后、ε 最后。0.3、10^{−9}、τ_i 的 12 次幂衰减都继承自 DKKMS25 的 agreement lemma 常数。

**(d) 失败路线 [推测]。** ① 不做表完成直接在"只在有效顶点有定义"的表上跑 agreement/list：采样器会产出 L∩H_U≠{0} 的非法问题，soundness 证明里"每个极大对满足 g|_H=h"的归纳在非法处中断，cheater 可把欺骗标签藏在非法条目里。② 折叠若用线性（非仿射）投影：σ∘A_U + h_U∘B_U 中的 h_U·B_U 平移项丢失，纤维不再是"两元素"，Max-Cut 测试里同一右标签的两个拉回词的相关恒等式（Lemma 2.4 的 t·r^{2d}）带额外常量因子，completeness 的 (1+t r^{2d})/2 变形。③ [推测] 若把 legitimacy 的分离条件放宽（允许 var(U) 上其他方程），H_U∩V_V ⊋ H(V)，F_U 与 F_V 的表一致性 (eq:affine-validity-completed-consistency) 失败，第二玩家的商列表解码到与第一玩家方程相矛盾的函数——soundness 常数 c_* 的推导断裂。

## 2.3 树形 gate 码（Definition 3.1, def:tree-code）

**(a) 陈述。** 固定 s≥2, m≥1，k=(2s)^m（叶数），d=s^m。完全 2s-叉树深 m；内点 v 的孩子按 (g,b)∈[s]×{0,1} 索引。每个内点配表 F_v: F^s→{−1,1}，每叶配行 R_i∈H。词 W(R,F)∈{−1,1}^A 在 a∈A 处：叶 i 符号 (−1)^{R_i(a)}；内点在孩子符号 (Z_{g,b}) 下输出
(∏_{g=1}^s Z_{g,0})·F_v(z)，其中 (−1)^{z_g} = Z_{g,0}Z_{g,1}（eq:gate-rule）。
根输出即 W(R,F)(a)。

**(b) 机制。** gate 的"输入位"z_g 由第 g 对孩子的**异或**给出，而输出再乘上"第一孩子全积"。这个规则的 Walsh 展开：F_v(z)=Σ_{I⊆[s]} F̂_v(I)(−1)^{Σ_{g∈I} z_g} 代入后第 I 项是
F̂_v(I)·∏_{g∉I}Z_{g,0}·∏_{g∈I}Z_{g,1}——**每个单项式从每对孩子里恰取一个孩子**。这是"monomial 遍历"。

**(c) 机械理由。** s≥2 保证 gate 至少两对（不然"恰一个共享节点"的互补计数崩塌）；树的深度 m 与 (2s)^m 个叶给了足够多的"复制"把 slice 噪声摊到每个单项式恰好一个因子上。prefactor ∏Z_{g,0} 使 z 的定义对称（z_g 是对内差分），保证加同一 h∈H 到 P(v) 的所有行只乘 (−1)^{h(a)}（行对称性的根源）。

**(d) 失败路线 [推测]。** ① gate 换成"多数表决"：Walsh 展开是所有子集的对称函数，单项式不再"每对取一个"，与 slice 遍历的交集成为随机数量，"每个单项式恰一个 t 因子"失效，相关性恒等式变成依赖 F 的复杂量。② gate 换成线性函数 F_v(z)=Σc_g z_g：只有两个 Walsh 系数，码退化为"dictator 之积"，MIS 找到的影响坐标对应的孩子关系平凡化，NO 情形的分析退回 Håstad 式线性测试但失去 B(t) 阈值。③ [推测] 树深 m 若与输入规模相关（如 m=ω(1)），slice 深度平均化成本 s/(2emμ) 中 e·m 的收益被 M_0=Λ/(4·2^m) 的 2^m 罚抵消，p* 指数式变小，T 的界 2^{n(2k−2s)}/(p*θ)² 爆炸，多项式性丢失。

## 2.4 互补遍历与相关恒等式（Lemma 3.2, lem:tree-correlation）

**(a) 陈述。** 随机切片：J_0 ~ U{0,…,m−1}；从根出发，深度 < J_0 的每个到达节点均匀选一个孩子对、两孩子都走；深度 J_0 处的到达节点集为 D。条件于 J_0=j，|D|=2^j，每个深度 j 节点入 D 概率 s^{−j}。
第一组断言：固定表 F，根输出作为叶符号的多重线性多项式**只含次数 d 的单项式**；每个单项式在其到达的每个节点处从每对取一个孩子；每个这样的遍历与每个可能切片 D **恰交一个节点**。因此把一个切片上所有表取负会把 W 取负。
第二组（相关性）：0<t<1, 0<r<1。F 均匀，F' 在 D 外不变、D 上逐条目独立取相关 t 的均匀符号对；R∈H^k 均匀，R¹,R² 各以概率 r 保留每行否则独立重采。则对每 a∈A、每固定切片：
E[W(R¹,F)(a)·W(R²,F')(a) | D] = t·r^{2d}（eq:tree-correlation）。
特别地 r=1−μ/d（0<μ<1/2）时 r^{2d} ≥ 1−2μ（Bernoulli）。

**(b) 机制。** 迭代 gate 的 Walsh 展开得
W_F(x) = Σ_{P∈𝒫} a_P(F)·∏_{i∈P}x_i，|P|=d（eq:tree-polynomial），
𝒫 是"每节点每对取一个孩子"的叶集族；叶集决定遍历（选中的孩子与 P 相交非空，未选中的不相交），故不同遍历给出不同单项式，a_P(F) 是遍历经过各节点的 Walsh 系数之积。在根处 monomial 遍历与 slice 遍历同时存在；切片深度以上的公共节点处两者恰选同一孩子（门规则局部图：monomial 实线从每对选一个，slice 虚线选一对的两个，恰有一个紫色公共），归纳得**切片深度恰一个公共节点** ⇒ 每个 a_P 恰含一个来自 D 上表的因子 ⇒ negate 切片表 negate W；且 E[F̂'_v(I)|F_v] = t·F̂_v(I) ⇒ E[a_P(F')|F,D] = t·a_P(F)。行侧：固定 a，符号 x_i^b=(−1)^{R_i^b(a)} 均匀独立，E[x_i¹x_i²]=r²；两单项式乘积期望在叶集不同时为零、相同时 r^{2d}；W_F 是 Boolean 故 Parseval Σ_P a_P(F)²=1。先平均行再平均 F' 即得恒等式。

**(c) 机械理由。** "恰一个公共节点"把"每单项式恰一个 t 因子"变成确定性事实，而非期望意义上的——这是 NO 情形稳定性上界干净的 B(t)（无多余因子）的原因。r=1−μ/d 是"行噪声随深度 d 摊薄"的选择：r^{2d} ≥ 1−2μ 说明 completeness 损失 tμ 与 d 无关。

**(d) 失败路线 [推测]。** ① 若 slice 的深度 J_0 固定（不均匀随机），"恰一个公共节点"仍成立，但 (eq:unsplit-bound) 的深度平均 1/m Σ telescoping 没了，unsplit 投影成本变成最坏深度上的 s·|C|/d，m 的选择不再能分摊。② 若 F' 在 D 上取相关 t 但**同一节点内不同条目相关**（如相关 z 整体平移），E[F̂'_v(I)|F_v] 不再是逐系数乘 t， Walsh 质量会在 I 之间重新分布，"恰一个 t 因子"退化为不等式，稳定性上界多出依赖 s 的项。③ [推测] 若叶行不完全独立（例如 R 统一平移），E[x_i¹x_i²]=r² 的独立性破坏，Parseval 步骤出现交叉项，t·r^{2d} 恒等式不再对每个 a 一致成立。

## 2.5 "函数 of the code"类与奇性（tree.tex 末段 + reduction.tex）

**(a) 陈述。** f 是"码的函数"若 f(R,F)=φ(W(R,F))（eq:function-of-code）。该类对"先经固定仿射映射拉回词"的平均封闭。T_r 保 f 的界。若 φ 奇（φ(−w)=−φ(w)），则 f 与 f̄=T_r f 在切片表同时取负下都是奇的——特别地，在固定 ω, D, R, F_out 后，f̄ 在切片条目上均值为零。剩余随机输入是 |D|·2^s 个独立条目的立方体，索引 (v,z)∈D×F^s；**条目 Fourier 度与影响指这些条目的子集**（区别于固定 gate 的 z-参数 Walsh 展开）。

**(b) 机制。** 这是把"任意割"纳入 MIS 适用范围的关键接口：割函数 σ_{x}(w) 只看见词（看不见行、表、切片），φ_y(w)=E_{e|y} σ°_{x(e)}(w∘π_e) 是奇函数（因取负词变号），且不依赖 slice/行数据。于是 Ḡ_y=T_r G_y 是"bounded odd 函数 of the code"，extraction 命题恰好对这类函数陈述。

**(c) 机械理由。** "odd ⇒ 切片均值零"是 MIS 的 E h=0 前提；"只依赖词"保证割不能偷看测试的内部随机性（否则 (d) 中的作弊路线立即成立）。

**(d) 失败路线 [推测]。** ① 若允许割依赖 R 或 F（"看见生成数据"），则函数可以在切片条目上选高稳定的偶函数（如 1_A(F_D) 型指示），Stab_t 可逼近 1，NO 情形上界崩塌。② φ 非奇（如 σ^even）：其贡献在 cut-stability 恒等式中以 −Stab_t(Ā) 出现——这其实是被**减去**的良性项，论文靠 (eq:cut-upper-stability) 直接扔掉；但若试图对 even 部分也做 MIS，会得到错误方向的界。③ [推测] 拉回 π_e 若非满射（词域压缩），φ_y 的奇性仍在但 Parseval 质量恒等式 (eq:mass-bound) 的 Σm_q ≤ 1 失效（非满射拉回的 Fourier 质量可重叠）。

## 2.6 Max-Cut 测试与 completeness（reduction.tex, lem:completeness）

**(a) 陈述（测试）。** 固定 t, s, m, μ, r=1−μ/d；博弈 G 的 T 次自乘：B=(F^{n+1})^T, A=(F^n)^T。顶点：每 x∈X^T 配所有词 w∈bits^B（长码词域）。边采样：(1) y∈Y^T 从右端点乘积边际；e,e' 独立取条件边律（给定 y）；π_e, π_e': B→A 逐坐标投影。(2) 独立取随机切片 D；F,F' 如 Lemma 2.4（D 上逐条目 t-相关对，D 外相同）。(3) 公共行数组 R∈H^k 均匀；两份独立 r-保留重采得 R¹,R²。(4) 输出无序边：
(x, W(R¹,F)∘π_e) 与 (x', −W(R²,F')∘π_{e'})（eq:test-queries）。
边权 = 结果概率聚合。

**(b) Completeness 陈述与机制。** 若 Val(G)≥1−a，图有割值 ≥
(1−2Ta)·(1+t r^{2d})/2 ≥ (1+t)/2 − tμ − 2Ta（eq:completeness）。
证明：取博弈标签 ℓ_X, ℓ_Y，按 σ_x(w)=w(ℓ_X(x_1),…,ℓ_X(x_T)) 标号；union bound 得 2T 个采样约束全部满足的概率 ≥ 1−2Ta；满足时两查询元组投影到同一标签 l∈A，切符号积为 −W(R¹,F)(l)·W(R²,F')(l)，由 Lemma 2.4 条件切概率 (1+t r^{2d})/2；其余事件切概率非负。r^{2d}≥1−2μ 给第二界。

**(c) 机械理由。** "negate 第二词"把 dictatorship 的满足从"相等"变成"相反"，这正是 Max-Cut（而非 agreement）测试的形态；2Ta 的 union bound 是 completeness 里唯一与博弈相关的损失，因此 a 可最后取小（先 n 后 a 的次序）。注意第一界 (1−2Ta)(1+tr^{2d})/2 在 2Ta≤1 才有用——论文自己标注了这个 regime。

**(d) 失败路线 [推测]。** ① 两条边若从同一 y 的**同一条**边采两次（非独立条件边律），completeness 的 union bound 事件相关，2Ta 失真。② 测试不 negate 第二词：得 agreement 测试，dictator 切概率 (1−t r^{2d})/2 附近，对 Max-Cut 的 (1+t)/2 目标错号。③ [推测] 若把行重采的 r 提高依赖（r=1−μ/d 换成常数 r<1），t·r^{2d} 中 r^{2d} 指数衰减于 d=s^m，completeness 损失不可控——μ/d 的"深摊薄"是必要的。

## 2.7 割–稳定性恒等式（Lemma 4.1, lem:cut-stability）

**(a) 陈述。** 对每个割表 σ 定义偶/奇部 σ^even=(σ(w)+σ(−w))/2, σ°=(σ(w)−σ(−w))/2。令
G_e(R,F)=σ°_{x(e)}(W(R,F)∘π_e)，G_y=E_{e|y}G_e，Ḡ_y=T_r G_y（eq:edge-function, eq:average-function）；A_y, Ā_y 用 σ^even 同理。则对每个割：
cut(σ) = ½ + ½E Stab_t^{F_D}(Ḡ_y) − ½E Stab_t^{F_D}(Ā_y)（eq:cut-stability），
从而 cut(σ) ≤ ½ + ½E Stab_t^{F_D}(Ḡ_y)（eq:cut-upper-stability）。
（期望 over y, D, R, F_out。）

**(b) 机制。** 条件于 y,D,R,F_out：采样边元组与两份行重采在两份之间独立；平均后第一符号对 F_D 的期望是 Ā_y+Ḡ_y；第二词取负使第二符号是 Ā_y−Ḡ_y 在 F'_D。两份切片输入是普通 t-相关立方体输入。**negate 所有切片条目保持 Ā_y、negate Ḡ_y** ⇒ 两函数在切片条目上的 Fourier 支集总奇偶相反 ⇒ 交叉项消失。符号乘积期望 = Stab_t(Ā_y) − Stab_t(Ḡ_y)；边被切概率 = ½(1−符号乘积)。Ḡ_y = φ_y(W(R,F))、φ_y 奇 ⇒ 均值零于切片条目（§2.5）。
推论：割值 ≥ (1+B(t))/2 + δ/2 ⇒ 奇平均期望切片稳定性 ≥ B(t)+δ。

**(c) 机械理由。** 偶部以负号出现是测试取负第二词的直接红利：even 依赖**降低**切值，所以无需对它做任何分析（非负稳定性直接扔掉）。这正是 summary 里"local consistency does not supply one global labeling"所对偶的正面设计——解码只针对 odd 部分的质量。

**(d) 失败路线 [推测]。** ① 若两份切片输入共享部分条目（非独立 F,F'），交叉偶奇项不消，cut 值里多出 Stab(Ā,Ḡ) 型交叉谱项，上界不再只由 Ḡ 的稳定性控制。② 若 φ_y 非奇但非偶（混合），奇偶分解后仍有剩余项；分解本身总可行，问题只在不取负第二词时两者同号。③ [推测] 若边分布 y 的乘积边际换成联合（例如 y 元组间相关以模拟更省的重复），条件边律 e|y 不再逐坐标是原边律，completeness 的 "Each coordinate … has the original edge law" 失败，2Ta union bound 崩。

## 2.8 行对称性（Lemma 5.1, lem:row-symmetry）与生成子

**(a) 陈述。** 节点 v 的生成子 P(v)：叶处 {v}；内点 P(v)=P(v_{1,0})∪P(v_{1,1})（恒走第一对的两个孩子，无随机性）。给 P(v) 的所有行同加 h∈H，子树输出在 a 处乘 (−1)^{h(a)}（由 gate 规则归纳：同一对两孩子同乘符号 ⇒ z_g 不变、prefactor 乘该符号）。
行 Fourier 指标 C=(q_i)，q_v=Σ_{i∈P(v)}q_i, q_{v,gb} 为孩子指标。则 f 为码的函数时，每个非零行系数满足
q_{v,g0}+q_{v,g1} = q_v 对每 g（eq:row-relations）；
且 F^{v,−}（只 negate F_v）：f̂_C(F^{v,−}) = (−1)^{q_v(1)}·f̂_C(F)（eq:table-flip-action）；
F^{v,z}（把 F_v(u) 换成 F_v(u+z)）：f̂_C(F^{v,z}) = (−1)^{Σ_g z_g q_{v,g1}(1)}·f̂_C(F)（eq:table-translation-action）。
三者经行平滑、行 Fourier 投影、对指定 gate 表族的任意总度投影后仍成立。

**(b) 机制。** 对每 g，把第 g 对两孩子的生成子同加 h 对子树的效果 = 给 P(v) 加 h；两行平移在整词上等效 ⇒ 取行 Fourier 系数得 χ_{q_{v,g0}+q_{v,g1}}(h)·f̂ = χ_{q_v}(h)·f̂ 对一切 h ⇒ 字符相等 ⇒ eq:row-relations。negate F_v 等价于给 P(v) 全行加 1 ⇒ flip 作用；把 F_v 的输入平移 z 等价于在 z_g=1 的那些对里给第二孩子的生成子加 1 ⇒ translation 作用。

**(c) 机械理由。** eq:row-relations 说每对孩子共享同一个"公共和" q_v——这是后续"unsplit 化简"与"奇部 ⇒ q_v(1)=1 ⇒ q_v 是标签"的全部根据。两个 table action 说明：**对 F_v 奇的系数，其公共指标是标签且非零；对 F_v 偶的系数在 F_v 的定义域平移下不变**（提取 Step 2 用后者、Step 3 用前者）。"保留于任意度投影"是 extraction 里 P_{≤K}^{F_D} 与 S_v 可交换次序的许可。

**(d) 失败路线 [推测]。** ① 若 gate 规则没有 prefactor ∏Z_{g,0}，"给 P(v) 加 h ⇒ 乘 (−1)^{h(a)}"只在部分 z 下成立，eq:row-relations 变成带例外集的不等式，unsplit 引理的计数 B_j ≤ N_{j+1}−sN_j 失效。② 若树不"恒走第一对"定义 P(v) 而用随机生成子，q_v 的定义随机化，table action 的符号无法与固定指标绑定。③ [推测] 尝试更强的"每个孩子指标都相等"（而非和相等）：立即被否——允许 (q_v,0)/(0,q_v) 之外的分配是初始化 a_P 自由度的来源，强制相等会改变码本身，使 Walsh 展开项数不足（每 gate 只有 2 个而非 2^s 个单项式），MIS 找到的影响坐标不再对应仿射哈希结构。

## 2.9 unsplit 投影的平均成本（Lemma 5.2, lem:unsplit）

**(a) 陈述。** C 称为**在 v 处 unsplit**，若每 g 的有序对 (q_{v,g0}, q_{v,g1}) 是 (q_v,0) 或 (0,q_v)（q_v=0 时要求所有孩子指标为零）。S_v 为到这类指标的行 Fourier 正交投影。f 码的函数、|f|≤1、r=1−μ/d（0<μ<1/2）、f̄=T_r f、切片独立于 f 取，则
E_{J_0,D} Σ_{v∈D} ‖(I−S_v) f̄‖²_{2,R,F} ≤ s/(2emμ)（eq:unsplit-bound）。
对决定 f 的额外背景数据平均后同样成立（切片独立）。

**(b) 机制。** 固定满足 eq:row-relations 的指标 C，N_j=深度 j 处 q_v≠0 的节点数。q_v≠0 时每对至少一个非零孩子，split 失败再供至少一个额外非零孩子；q_v=0 时失败供至少两个。于是 B_j（深度 j 失败数）≤ N_{j+1} − sN_j。用切片包含概率与 telescoping：
E Σ_{v∈D} 1[C split at v] ≤ (1/m)Σ_{j=0}^{m−1}(N_{j+1}−sN_j)/s^j = (s/m)(N_m/s^m − N_0) ≤ s|C|/(md)。
由 eq:row-smoothing 与 Parseval，左侧 ≤ (s/m)Σ_C r^{2|C|}·(|C|/d)·E|f̂_C(F)|²。x e^{−2μx} ≤ (2eμ)^{−1} 且 log r ≤ −μ/d ⇒ 每个括号因子 ≤ (2eμ)^{−1}，Σ_C E|f̂_C|² = ‖f‖² ≤ 1。

**(c) 机械理由。** "平均 over 切片深度"是本引理的灵魂：不要求任何指标处处 unsplit，只要求**期望意义**下 split 成本可摊——这是把逐 gate 的结构化简从"全局改码"降级为"只在被选中的 gate 局部施加"的代价核算。r^{2|C|}·|C|/d ≤ (2eμ)^{−1} 是行平滑（大 |C| 被压）与深度摊薄（1/d）的合乘；s 上界来自 telescoping 的系数 s/m。

**(d) 失败路线 [推测]。** ① 用固定深度而非随机 J_0：N_0 的 −sN_0 项消失、telescoping 变成 N_m/s^m = |C|/d，损失仍是 O(|C|/d) 但失去 (2eμ)^{−1} 里 log r 的指数衰减配合——|C| 大时（|C|→∞）x e^{−2μx} 有界依赖 r^{2|C|}，若 r 不接近 1（μ 不可小），常数变坏但仍有限；真正的风险在 r 有下界时 |C|/d 因子需要 d 指数大。② 试图对所有节点同时 unsplit：投影 (I−S_v) 的损失按节点数 2^m 相加，成本 2^m·s/(2emμ) 爆炸——逐节点投影、只在 influential gate 使用的局部化是必需的。③ [推测] 若 f 不是码的函数（不满足 eq:row-relations），B_j ≤ N_{j+1}−sN_j 的每对计数论证失效，split 失败可能"免费"（不增加非零孩子数），telescoping 方向反转。

## 2.10 自由平移坐标（Lemma 5.3, lem:shift-coordinates）

**(a) 陈述。** 固定切片 D 与 v∈D。2s 个集合 P(v_{g,b}) 非空不交；每集合取代表叶 i_{g,b}，L_{g,b}=R_{i_{g,b}}；同生成子中其他行换成 R_i+L_{g,b}；其余行不动，记 Γ∈H^{k−2s}。则
R ↦ ((L_{g,b}), Γ) 是线性双射 H^k → H^{2s}×H^{k−2s}；均匀行下自由平移条件于 Γ 独立均匀。L_{g,b} 的行 Fourier 指标是 Q_{g,b}=q_{v,gb}。
从而在每个固定 Γ，S_v 恰是 2s 个平移上到 unsplit 平移指标的 Fourier 投影；码的函数（或其平滑）的平移系数在 Q_{g,0}+Q_{g,1} 诸 g 相同之外为零；table actions 在该固定 context 下对每个平移系数成立，q_v=Q_{1,0}+Q_{1,1}, q_{v,g1}=Q_{g,1}。

**(b) 机制。** 逆映射：代表行 = L_{g,b}，其余行 = 记录的差 + L_{g,b}。行字符里 L_{g,b} 的系数恰是 Σ_{i∈P(v_{g,b})}q_i = q_{v,gb}，故 S_v 的定义只看平移指标 Q。按 Q 分组全行展开即得逐 fiber 的断言。于是非零公共指标 q 的保留平移指标由子集 I⊆[s]（q 放第二孩子的那些对）给出，字符为 ∏_{g∉I}χ_q(L_{g0})·∏_{g∈I}χ_q(L_{g1})；q=0 时只有全零指标、字符 1。negate F_v 乘 (−1)^{q(1)}：在 F_v-奇部分 q 是标签故非零，(q,I) 描述唯一；平移 F_v 的参数 z 乘 (−1)^{Σ_{g∈I}z_g}——**同一 I 同时记录行字符与表平移字符**。

**(c) 机械理由。** "自由平移 + 固定 context"是把行空间分成 2s 个将被哈希引理"积分掉"的坐标与 k−2s 个将被"隐藏坐标植入"固定住的坐标的准备步骤。坐标变换只用行加法、只依赖树与 v ⇒ 与仿射拉回交换（解码 §5 开头强调），这是 X-labeler 能在不知道 π_e 的情况下重建 Γ′ 的前提。

**(d) 失败路线 [推测]。** ① 代表叶选择若依赖 R 或 F（非确定性规则），坐标变换不与拉回交换，X-labeler 重建失败。② 平移坐标的 (q,I) 双重角色依赖 "奇部 ⇒ q 是标签 ⇒ 非零 ⇒ 描述唯一"；若处理 F_v-偶部分，q(1)=0 使 q 与 −q 不可分（char 2 中同元）——论文正是用 Step 2 的平移不变性把偶部分按总影响 ≤ K/2^s 直接丢弃而非解码。③ [推测] s=1 时 I⊆[s] 只有 ∅ 与 {1}，"平移字符"与"行字符"合一，哈希引理的 s→∞ 色散机制（h=2^s）无空间。

## 2.11 向量值哈希引理（Lemma 6.1, lem:hashing）

**(a) 陈述。** H 为 F 上有限维向量空间，χ_q(u)=(−1)^{q(u)}；𝒱 实 Hilbert 空间；c(q,z)∈𝒱，q∈H*, z∈F^s。w_q=Σ_z‖c(q,z)‖²，M=Σ_q w_q。L, J_1,…,J_s 独立均匀于 H，J(q)=(q(J_1),…,q(J_s))，U(z)=Σ_q χ_q(L)·c(q, z+J(q))。则
(i) 总质量守恒：E Σ_z ‖U(z)‖² = M（eq:hashing-total-mass）；
(ii) 色散：对每 ζ>0 存在 γ>0 与 s_0（只依赖 ζ），s≥s_0 且 max_q w_q ≤ γM ⇒ E max_z ‖U(z)‖² ≤ ζM（eq:hashing-dispersion）。
**常数与 dim H、dim 𝒱 无关。**

**(b) 机制。** (i)：条件于 J_g，L 的字符正交 ⇒ E_L‖U(z)‖² = Σ_q‖c(q,z+J(q))‖²，对 z 求和换指标。
(ii) 定量核心：h=2^s, ρ=max_q w_q/M。对任意 C,D>0 证
E max_z‖U(z)‖² ≤ 2M[√(2ρ + 2C²/D² + 3D⁴/h) + (1/√C + 1/D)² + 1/h]（eq:hashing-quantitative）。
- Fourier 表示：α_q(p)=Σ_z(−1)^{p·z}c(q,z)；A_p(u)=Σ_qχ_q(u)α_q(p)；S_p=L+Σp_g J_g；反演 U(z)=E_p(−1)^{p·z}A_p(S_p)（eq:hashing-inversion）。m_p=E_u‖A_p(u)‖²=Σ_q‖α_q(p)‖²，E_p m_p=M，E_p‖α_q(p)‖²=w_q。不同 p,p' 的 (1,p),(1,p') 在 F 上线性无关 ⇒ S_p,S_{p'} 独立均匀；三个不同 p 的样本也独立（非空零和子集必含偶数个向量 ⇒ 两个相同向量）。
- 两次截断：A'_p(u) 在 m_p ≤ CM 且 ‖A_p(u)‖ ≤ D√M 时取 A_p(u)，否则 0。Parseval：Σ_q w'_q ≤ M；且 w'_q ≤ 2w_q + 2C²M/D²（截尾的 Cauchy–Schwarz：‖α_q(p)−α'_q(p)‖ ≤ m_p/(D√M) ≤ C√M/D）。截断误差：X_p=‖(A_p−A'_p)(S_p)‖，E max_z‖U−U'‖ ≤ X，重尾贡献 ≤ √(M/C)，截断贡献 ≤ √M/D，X_p 两两独立（S_p 两两独立）⇒ Var(X) ≤ M/h ⇒
E max_z‖U−U'‖² ≤ M[(1/√C+1/D)² + 1/h]（eq:hashing-truncation-error）。
- 四次矩：B_p=A'_p(S_p)。展开四次幂、对 z 求和字符得**精确恒等式**
E Σ_z‖U'(z)‖⁴ = h^{−3}Σ_{p₁,p₂,p₃}E[⟨B_{p₁},B_{p₂}⟩⟨B_{p₃},B_{p₁+p₂+p₃}⟩]（eq:hashing-fourth-expansion）。
p₄=p₁+p₂+p₃；任两指标相同的事件概率 ≤ 3/h，贡献 ≤ 3D⁴M²/h。四个不同指标时 S_{p₁},S_{p₂},S_{p₃} 独立均匀、S_{p₄}=S_{p₁}+S_{p₂}+S_{p₃}，字符平均迫使 q₁=q₂=q₃=q₄：
E[⟨B_{p₁},B_{p₂}⟩⟨B_{p₃},B_{p₄}⟩] = Σ_q⟨α'_q(p₁),α'_q(p₂)⟩⟨α'_q(p₃),α'_q(p₄)⟩（eq:hashing-common-character）。
右方可负，上界用 ∏‖α'_q(p_i)‖ 替换并放弃 distinct 约束；固定 q 用 Cauchy–Schwarz 得 E∏‖α'_q(p_i)‖ ≤ (w'_q)²（用 (p₁,p₂),(p₃,p₄) 的无条件独立均匀；**不**断言条件于 distinct 后独立）。于是 EΣ_z‖U'‖⁴ ≤ Σ_q(w'_q)² + 3D⁴M²/h ≤ M²(2ρ + 2C²/D² + 3D⁴/h)（用 eq:hashing-truncated-mass）。再 Cauchy–Schwarz：E max_z‖U'‖² ≤ M√(2ρ+2C²/D²+3D⁴/h)。
- 参数选取：ε̃=min{ζ,1}，C=64/ε̃，D=8C/ε̃，γ=ε̃²/128，2^{s₀} ≥ max{192D⁴/ε̃², 16/ε̃}。ρ≤γ 时平方根项 ≤ ε̃/4，另两项各 ≤ ε̃/16，总 3ε̃M/4 ≤ ζM。

**(c) 机械理由。** 为什么是向量值：应用里 c(q,z) 收集的是"条目 z 的影响"的所有 Fourier 系数（按 (A,D) 索引），‖c(q,z)‖² 恰是影响本身——标量版本无法把"影响"与"质量"同时记账。为什么截断两次：第一次（m_p ≤ CM）保证单个字符系数在逐点截断下变化均匀小；第二次（‖A_p‖ ≤ D√M）给四次矩指标重合时的逐点界。为什么 (1,p) 线性无关即可：F 上非空零和子集必含偶数个向量、即两相同向量，这是三/四指标独立性论证的 char-2 特殊性。h=2^s 只出现在 D⁴/h 与 1/h——s 由 extraction Step 4 与 ζ 的关系定（s→∞ 只需 h 大，无需 H 或 𝒱 有限维以外条件）。**这正是 summary §7 那句"scrutinizes whether the constants remain uniform for the construction's highly rectangular matrices"的论文版本：均匀性由"常数只依赖 ζ"显式成立。**

**(d) 失败路线 [推测]。** ① 若 J_g 不独立（如 J 共享一个公共行），S_p 的线性无关计数破坏，四次矩里出现额外非消失项，色散结论需要在更小的指数类上成立，γ 失效。② 若试图用二阶矩+Markov 替代四次矩：E max_z‖U‖² 只能从 E Σ_z‖U‖²=M 得平凡界 M，无法与 w_q ≤ γM 的色散产生 ζM——四次矩（"迫使同一 q"）是把字符色散转成条目色散的最小矩数。③ [推测] char ≠ 2 的推广：字符取值 ±1 依赖 (−1)^{q(u)}，若 F_p、p>2，"非空零和子集含两相同向量"失效，须改用复字符与正交性，独立性论证要重做——论文的 s₀、γ 常数是 char-2 专属。

## 2.12 维数无关提取（Proposition 7.2, prop:extraction）

**(a) 陈述。** 固定 t∈(0,1)、0<δ<1−B(t)、0<μ<1/2。存在树参数 s≥2,m≥1 与常数 p*,θ>0（只依赖 t,δ,μ），使得：对任意仿射标签空间 A 与任意族 φ_ω（奇、[−1,1]、依赖独立参数 ω），若
E_{ω,D,R,F_out} Stab_t^{F_D}(f̄_ω) ≥ B(t)+δ（eq:excess-stability），
则
Pr[ max_{q∈A} m_q(f̄_ω; Γ, F_out) ≥ θ ] ≥ p*（eq:extraction-event）。
采样：ω、随机切片 D、均匀节点 v∈D；条件于这些，独立均匀采 F_out 与 Γ。
m_q 的定义（eq:mass）：m_q(f;Γ,F_out) = E_{F_D} Σ_{Q∈(H*)^{2s}: Q_{g0}+Q_{g1}=q ∀g} |f̂^shifts(Q)|²——**保留所有把公共和分给孩子的分配方式**（为解码时在仿射拉回下比较质量）。|f|≤1 时 Σ_q m_q ≤ 1（Parseval，eq:mass-bound）。

**(b) 机制（四步）。**
- **Step 1 找影响切片条目。** 切片表同时取负 ⇒ 词取负 ⇒ φ 奇 ⇒ f̄ 在切片位均值为零、|f̄|≤1。用 Lemma 2.1（ξ=δ/2）得 K,τ（可再缩 τ≤1）。稳定性 ≤ 1 ⇒ 若无影响条目则稳定性 ≤ B(t)+δ/2，故事件"某 v∈D 的某条目 z 有 Inf^{≤K}_{v,z}(f̄) ≥ τ"概率 ≥ η=δ/2。
  unsplit 损失预算：要求 E Σ_{v∈D}‖(1−S_v)f̄‖² ≤ s/(2emμ) ≤ ητ/8（eq:choose-m，靠增大 m）。Markov：该和 ≤ τ/4 除概率 η/2。交事件上三角不等式：
  √Inf_{v,z}(H_v) ≥ √Inf^{≤K}_{v,z}(f̄) − ‖(1−S_v)f̄‖ ≥ √τ/2，其中 H_v = P_{≤K}^{F_D} S_v f̄。
  于是 E Σ_{v∈D} max_z Inf_{v,z}(H_v) ≥ ητ/8 =: Λ（eq:large-max-sum）。
  辅助：E Σ_{v,z} Inf_{v,z}(H_v) ≤ K（eq:total-influence；S_v 是行正交投影且与切片位 Fourier 投影交换，只能降积分影响；再 eq:degree-influence Σ_a Inf_a(P_{≤K}h) ≤ K‖h‖²）。**不主张 H_v 逐点有界。**
- **Step 2 丢弃偶依赖。** H_v 按 negate F_v 分偶奇，切片位 Fourier 支集不交，影响相加。偶部分由 sign action 有 q_v(1)=0；unsplit 下孩子指标全在 1 上取零；平移作用 ⇒ 偶部分对 F_v 的定义域平移不变，平移在其条目上传递 ⇒ v 的所有条目影响相等 ⇒ 由 eq:total-influence：
  E Σ_{v∈D} max_z Inf_{v,z}(H_v^even) ≤ K/2^s（eq:even-influence）。
- **Step 3 奇影响写成仿射哈希。** 固定 ω,D,v,Γ,F_out。奇部分公共和 q 是标签（非零）。unsplit 平移指标 (q,I) 的字符是 χ_q(L_Σ)·(−1)^{Σ_{g∈I}q(J_g)}，其中 L_Σ=Σ_g L_{g0}, J_g=L_{g0}+L_{g1}；s+1 个形式 L_Σ,J_1,…,J_s 独立均匀（满射线性映射）。平移恒等式 a_{q,I}(F_v(·+z),…)=(−1)^{Σ_{g∈I}z_g}a_{q,I}；令 Ψ_q=Σ_I a_{q,I} 得
  H_v^odd = Σ_{q∈A} χ_q(L_Σ)·Ψ_q(F_v(·+J(q)), F_{D∖{v}})（eq:odd-hash-form）——**把自由平移字符转成 gate 表的平移**。不同 I 的 a_{q,I} 在均匀切片位上正交（平移保内积、变号），故 ‖Ψ_q‖² ≤ m_q（eq:psi-mass）；每个 Ψ_q 度 ≤ K。
  把 Boolean Fourier 系数收集成向量：c(q,z)_{A,D}=Ψ̂_q(z+A,D)（0∈A⊆F^s；以 z 为参照使向量空间对所有 z,q 同一）；非标签 q 置零。则**精确地**
  Inf_{v,z}(H_v^odd) = ‖Σ_q χ_q(L_Σ)·c(q, z+J(q))‖²（eq:influence-hash）。
  w_q=Σ_z‖c(q,z)‖²，M_v=Σ_q w_q：w_q = Σ_{B,D}|B|·|Ψ̂_q(B,D)|² ≤ K‖Ψ_q‖² ≤ K·m_q（eq:wq-mq；|B| ≤ 单项式总度 ≤ K）。故 M_v ≤ K；且由哈希引理总质量恒等式 E Σ_v M_v ≤ K（eq:sum-M）。
- **Step 4 逼出重标签。** 取 ζ（ζK ≤ Λ/4）、用哈希引理得 γ 与 s 下界；取 s 使 K2^{−s} ≤ Λ/4；再取 m 满足 eq:choose-m。令 M_0=Λ/(4·2^m), θ=γM_0/K, p*=Λ/(4K·2^m)（eq:extraction-constants）。按 (i) w_q ≤ γM_v 全部 q；(ii) 否则 M_v<M_0；(iii) M_v≥M_0 且某 w_q>γM_v 分三类：(i) 由哈希引理界 E max odd influence ≤ ζM_v，Σ 起来 ≤ Λ/4；(ii) 由总影响 ≤ M_0 且 |D|≤2^m，≤ Λ/4；(iii) 每节点 ≤ K，记 N_iii 计数。偶贡献 ≤ Λ/4。合并：
  Λ ≤ K2^{−s} + ζK + 2^m M_0 + K·E N_iii ≤ 3Λ/4 + K·E N_iii ⇒ E N_iii ≥ Λ/(4K)。
  每个类 (iii) 节点由 eq:wq-mq 给 m_q > γM_0/K = θ 的标签；均匀取节点损失因子 2^m ⇒ 结论。

**(c) 机械理由。** 常数链：δ→(K,τ)→η=δ/2→Λ=ητ/8→(s 先由 ζ,K2^{−s} 定)→(m 由 s/(2emμ)≤ητ/8 定)→M_0,θ,p*。所有量只依赖 t,δ,μ，与 dim A（即 n、T）无关——**这是"解码损失与字母表无关"承诺的解析侧兑现**。|D|≤2^m 是均匀取节点的损失因子；Λ/(4K) 里除 K 是因为类 (iii) 每节点预算 K。不逐点界 H_v 是因为 S_v、度截断后的函数可以超界，只有 L² 控制。

**(d) 失败路线 [推测]。** ① 若把 c(q,z) 的参照点固定为 0 而非 z+A：向量空间随 z 变化，eq:influence-hash 的"同一向量空间求范数"结构丢失，哈希引理不适用。② 若在 Step 2 试图解码偶部分：其指标在 1 上取零 ⇒ 非标签，m_q 的定义按标签求和会漏掉这些质量，max_q m_q 可能全部小——偶部分的平移不变性（所有条目影响相等 ⇒ 总影响摊薄到 2^s 个条目）正是把它压入预算 K/2^s 的机制。③ [推测] 若 f̄ 的超额稳定性由少数 ω 贡献（非一致），η=δ/2 的事件概率论证仍成立（期望论证），但 p*θ 的组合在 Lemma unsmooth→planting 的 TV 步骤要求 [0,1] 有界分数——质量在 [0,1] 由 eq:mass-bound 保证，链条闭合。

## 2.13 去平滑（Lemma 5.x, lem:unsmooth）

**(a) 陈述。** R^new_i 独立均匀，B_i~Bernoulli(1−r)，E_i=B_i R^new_i；R+E 与单份行重采同分布。则对固定 y,D,v,Γ,F_out 与标签 q：
m_q(Ḡ_y; Γ, F_out) ≤ E_{E, e|y} m_q(G_e; Γ+E_Γ, F_out)（eq:unsmooth）。

**(b) 机制。** 把 (L,F_D) 函数视为实 Hilbert 空间元素；Π_q 为到平移指标 {Q: Q_{g0}+Q_{g1}=q ∀g} 的正交投影，质量 = 投影范数平方。恒等式 Ḡ_y(L,Γ,F) = E_{E,e|y} G_e(L+E_L, Γ+E_Γ, F) + Hilbert 范数的凸性给不等式；平移 E_L 与 Π_q 交换且保范数（逐系数乘符号）。

**(c) 机械理由。** 平滑算子 T_r 是"平均"，质量是凸函数 ⇒ 平滑后的质量 ≤ 平滑前质量的期望。这允许把 extraction 的结论（对 f̄_ω = Ḡ_y）转移到未平滑的单边函数 G_e 上——解码要在单条边上做，而质量是对单边函数定义的。

**(d) 失败路线 [推测]。** ① 若 T_r 不是"行级"而是"位级"噪声，E_L 平移不再逐系数乘符号（位噪声混入 Γ 坐标），交换性破坏。② 凸性方向：若试图反向不等式（用平滑后的质量下界未平滑质量），一般不成立——论文只需要 ≤ 方向把 p*θ 的期望传下去。

## 2.14 植入坐标与隐藏（Lemma 5.x, lem:planting）

**(a) 陈述。** 行在 A=(F^n)^T 上写坐标：每行一个常系数 + T 个 n 维线性系数块。Z_a = 事件"槽位 a 的块在全部 k−2s 个 context 行与全部 k 个潜行 R^new_i 中为零"（常系数不限制）。p_0 = Pr(Z_a) = 2^{−n(2k−2s)}（eq:zero-slot-probability；条件于树数据，Z_a 相互独立）。
**植入实验**：均匀选 a_*∈[T]，把 a_* 的块置零，其余不变；等价于"遗忘标记后的条件律"。则
TV(P, U) ≤ ½√((1−p_0)/(T p_0)) ≤ 1/(2√(T p_0))（eq:planting-tv）；
从而 T ≥ 1/(p_0 (p*θ)²)（eq:decoder-repetition）时
E_P m_{q*}(G_e; Γ+E_Γ, F_out) ≥ p*θ/2（eq:planted-score）。

**(b) 机制。** 密度比 dP/dU = Z/(T p_0)，Z=Σ_a 1[Z_a] 条件于树数据是 Binomial(T,p_0)（参数不依赖树数据）⇒ Cauchy–Schwarz：
TV = ½E_U|Z/(Tp_0)−1| ≤ ½√((1−p_0)/(Tp_0))。
分数 m_{q*} 是 [0,1] 值、不依赖标记的函数 ⇒ 两律期望差 ≤ TV。q* 的定义（eq:decoder-choice：按固定顺序取 argmax）**不用标记、不用被标记边及其投影、不用采到的噪声**——它对零槽位的统计依赖无妨。

**(c) 机械理由。** p_0 指数小（2^{−n(2k−2s)}）⇒ T 必须指数于 n——这就是为什么 T 是最后才选的参数、且 "T depends on n"。TV 界里 1/√(Tp_0) 的形式说明：需要的 T ≈ p_0^{−1}·(p*θ)^{−2}，即**植入的隐藏成本全部押在 T 上，而非解码损失上**。这是与 summary 中 Rao 重复路线的实质分野：这里"重复"不是去放大 soundness gap，而是去隐藏植入坐标。

**(d) 失败路线 [推测]。** ① 若 q* 的定义读了被标记边的投影，密度比论证失效（标记信息泄露给分布），TV 比较不适用。② 若把 Z_a 的条件改成"至少一个槽位为零"（OR 而非标记），条件律不再等价于"条件于 Z_{a_*}"，密度比 Z/(Tp_0) 变成非线性函数，TV 界需要二阶矩以上的控制。③ [推测] 若 T 个槽位的 Z_a 相关（例如行在槽位间共享系数块），Binomial(T,p_0) 变成一般和，E|Z/(Tp_0)−1|² 由方差控制——相关性若使 Var(Z) ≫ T p_0(1−p_0)，TV 界按 T 的平方根速度恶化，T 的指数常数变大但仍可行；完全相关（Z_a 全等）时 TV 界退化为常数级、机制崩溃。

## 2.15 仿射限制下的质量损失（Lemma 5.x, lem:restriction）

**(a) 陈述。** ρ: Ã→A 满射仿射、两元素纤维；H̃=Aff(Ã,F)，ι=ρ*: H↪H̃（拉回，线性、象余维 1、ι(1)=1）；ι*: H̃*→H* 两元素纤维、在求值泛函上与 ρ 一致。设 f̃(L̃,F_D) 的平移 Fourier 支集满足公共对和性质（Q̃_{g0}+Q̃_{g1} 诸 g,h 相同），f(L,F_D)=f̃(ιL,F_D)。则对每标签 q：
m_q(f) ≤ 2^{2s}·Σ_{q̃∈Ã: ρ(q̃)=q} m̃_{q̃}(f̃)（eq:restriction-mass）。

**(b) 机制。** Fourier 反演+字符正交：f̂(Q) = Σ_{Q̃: ι*Q̃_{gb}=Q_{gb} ∀g,b} f̃̂(Q̃)，和有 2^{2s} 项 ⇒ |和|² ≤ 2^{2s}·Σ|项|²。对 pair 和为 q 的 Q 求和：右侧每个非零项的公共对和 q̃ 满足 q̃(1)=q̃(ι(1))=q(1)=1 ⇒ q̃ 是求值泛函即 Ã 的标签且 ρ(q̃)=q；每个提升指标只计一次。对切片表平均。

**(c) 机械理由。** 2^{2s} 是"纤维两元素 × 2s 对孩子"的组合罚：每个 Q̃_{gb} 有两个原像选择。这是解码损失 2^{−2s} 的来源——只依赖 s（即只依赖目标 gap），与 n、T 无关。ι* 在求值泛函上与 ρ 一致保证"提升的标签投影回正确标签"。

**(d) 失败路线 [推测]。** ① 若 ρ 的纤维 >2（如把隐藏槽位换成维度 >1 的植入），罚变 (纤维大小)^{2s}，可能仍可接受但会改变 T 的选择次序——论文选择 1 维植入使罚恰为 2^{2s}。② 公共对和性质若不成立（f̃ 的平移支集各对和不同），f̂(Q) 的反演和不再按 pair-sum 分解，右侧的 q̃ 求和范围失控。

## 2.16 解码（Proposition 5.x, prop:decoding）

**(a) 陈述。** 设 extraction 结论以常数 p*,θ 成立，T 满足 eq:decoder-repetition。则原仿射博弈
Val(G) ≥ 2^{−2s}·p*θ/2（eq:decoded-value）。

**(b) 机制。** 构造只用各自端点与公共随机性的（允许低效的）labeler。
- 公共数据与 Y-labeler：随机输入边 e=(x,y)；均匀公共标记 a_*∈[T]；其余槽位公开采独立边（含端点与投影）；输入边插入标记槽。条件于任何标记，全边元组服从乘积边律、与标记独立。公开采深度、切片、节点、F_out、context、潜行、掩码（植入实验）。Y-labeler 由 y 计算 q*（eq:decoder-choice——它可用博弈与割作为背景数据计算条件平均 Ḡ_y），输出其标记分量 q*_{a_*}。
- X-labeler：把标记槽位的 A 因子换成 X-字母表：Ã=∏_{a≠a*}F^n × F^{n+1}；B=(F^{n+1})^T 分解 B →κ→ Ã →ρ→ A，κ 是公开投影（标记槽为恒等），ρ 在标记槽是未知的 π_e。植入零 ⇒ Γ、R^new、E、E_Γ、Γ′=Γ+E_Γ 在标记槽的线性块全为零 ⇒ ρ*Γ′ 对 X-labeler 已知（不动未标记系数与常系数、标记系数置零——**不需要 π_e，包括其平移部分**）。X-labeler 构造原始函数 G̃ = σ°_x(W_Ã(R̃,F)∘κ)，固定 context 为 ρ*Γ′、F_out，留 2s 个自由平移于 H̃；以 ∝ m̃_{q̃} 的概率采标签 q̃，输出标记分量。
- 比较验证公共对和性质：对任何 h∈H̃，把一对的两个孩子生成子同加 h 使 gate v 输出乘 (−1)^{h(l̃)}；在两个不同对做此操作词不变 ⇒ 字符正交 ⇒ G̃ 的每个平移 Fourier 指标有公共对和。词生成与行拉回逐点交换，π_e=ρ∘κ ⇒ G̃ 的自由平移限制到 ρ*H 恰是 context Γ′ 的 G_e。ρ 纤维两元素 ⇒ Lemma restriction：
  Σ_{ρ(q̃)=q*} m̃_{q̃} ≥ 2^{−2s}·m_{q*}(G_e;Γ′,F_out)。
  左侧下界"采到的全标签投影到 q*"的概率，该事件蕴含满足被标记输入边。平均并用 eq:planted-score ⇒ 成功概率 ≥ 2^{−2s}p*θ/2。最后固定全部公共随机性得确定性标号。

**(c) 机械理由。** "允许低效"是关键卸载：labeler 可以读整个博弈与割表（指数大也无所谓），因为只是拿它给博弈值做下界——不需要多项式时间解码器，多项式性由归约的图构造保证（conclusion 节单独验证）。2^{−2s} 罚与 p*θ/2（TV 损失一半）的组合给出 b 的选取条件 b < 2^{−2s}p*θ/2。

**(d) 失败路线 [推测]。** ① 若 X-labeler 试图高效实现（多项式时间计算 m̃ 或采样），需要解决 argmax_q m_q 的计算问题——论文完全回避（值下界不需效率），但读者不应误以为这里给出了算法化解码。② 若 G̃ 的奇函数 σ°_x(w∘κ) 中 κ 不是满射（不可能：κ 标记槽恒等、其余是满射仿射的积 ⇒ 满射），拉回限制的等式 "限制到 ρ*H = G_e" 失败。③ [推测] 若把隐藏坐标思想换成"X-labeler 猜测投影"（对 π_e 的 2^n 个可能值平均），成功概率除以 2^n——依赖字母表，破坏维数无关；植入坐标的整个目的就是把 2^n 的猜测换成与 n 无关的 2^{2s}。

## 2.17 收官与参数次序（conclusion.tex §8）

**(a) 陈述。** 参数次序：(t,ε,μ) → (s,m,p*,θ) → b → n → T → a。取 δ=ε、tμ ≤ ε/4、b < 2^{−2s}p*θ/2、T ≥ 2^{n(2k−2s)}/(p*θ)²、a 使 2Ta ≤ ε/4。YES：cut ≥ (1+t)/2−ε/2；NO：若 cut ≥ (1+B(t))/2+ε/2，则奇平均期望切片稳定性 ≥ B(t)+ε ⇒ extraction+decoding ⇒ Val(G) ≥ 2^{−2s}p*θ/2 > b 矛盾。图规模 |X|^T·2^{|B|} = |X|^T·2^{2^{(n+1)T}}；除 |X| 外全是常数；枚举测试结局得多项式位复杂的有理边权 ⇒ 确定性多项式构造。Thm 1.1 由 thm:gap + 连续性取有理 t 使 α(1+t)/2 > (1+B(t))/2 + 严格间隙，经 Lemma unweighted 去权去重。

**(b) Lemma unweighted（附录 B, lem:unweighted）。** 加权图 G（Σw_{uv}≤1，可有环），对每 ε′>0 可确定性多项式构造简单无权图 G′ 与尺度 Q=p^{12} 使 |MaxCut(G′)/Q − MaxCut(G)| ≤ ε′。构造：素数 p > 2N²/ε′；每顶点换成 F_p^6 簇；边 (u,v) 上取 I_{uv}⊆F_p、|I|=⌊p·w_{uv}⌋，连边当 x·y∈I_{uv}。矩形偏差估计：Fourier 反演 1_I(a)=Σ_h β_h ψ(ha)，|β_h|≤1，M_h(x,y)=ψ(hx·y) 满足 M_h M_h* = p^6 I ⇒ 算子范数 p³ ⇒ |#{(x,y)∈S×T: x·y∈I} − (|I|/p)|S||T|| ≤ p^{10} ⇒ (eq:rectangle-discrepancy) |e_{uv}(S,T)/p^{12} − w_{uv}(|S|/p^6)(|T|/p^6)| ≤ 1/p + 1/p²。任意割的簇比例 a_u 给随机割解释 ⇒ 上界；最大割的簇常数提升 ⇒ 下界；总误差 N(N−1)(1/p+1/p²) < ε′。

**(c) 机械理由。** 簇方法对**所有**割控制（不只在簇上常数的割）——任意割的簇比例描述原图的一个随机割，这一观察让单向不等式免费成立。F_p^6 与 p^{12}：内积 x·y 的双线性给 M_h 的谱范数 p^3，6 维使总边数 |S||T|/p^6 归一后矩形误差 p^{10}/p^{12}=1/p²。环贡献零自动删除。

**(d) 失败路线 [推测]。** ① 若用均匀随机采样边代替 Fourier 构造：得到的是高概率近似，确定性归约要求对**所有**割的偏差——randomized construction 需要 derandomization，论文用 F_p 谱方法一次性获得确定性的矩形谱界。② 若簇维数取 1：M_h 范数 p，误差 p·√(|S||T|)/p² = 1/p^{1/2} 级，p 需更大但仍可行；取 6 维是为让 Q=p^{12} 与误差匹配的整洁选择。③ [推测] 若权重和 >1（未归一），I_{uv} 的大小 ⌊p w⌋ 可超 p，构造失效——定理陈述里 Σ ≤ 1 与"删环不重归一"的约定即为此。

---

# 三、summary 时间线（重头戏）

summary 共 12 节正文（页 1–13）+ 参考文献。原始任务是"**每个固定有限 Max-CSP 的 BasicSDP 阈值 α_Γ = inf OPT(I)/BasicSDP(I) 的无条件 NP-难度**"（奖励-比值约定，UGC 动机下的 converse 假设）。最终论文把范围收缩为 Max-Cut、把框架换成 Max-Cut 测试直取 B(t)。以下逐节摘卡点（VERBATIM 保留英文原文），并映射到论文最终形态。

## §1（页 2–3）从 BasicSDP 阈值到投影泄露

- 内容：检查重复变量/逐 occurrence 局部分布是否弱化松弛——没有逃逸口；UGC 依赖促成 converse 想法。基线 gadget：加三个 dummy 标签保底值 1/3，配 Khot–Vishnoi SDP gap [38]。
- **转折念头（VERBATIM）**："Wait insight: baseline T constant and hardness YES near1 NO T+o(1) is already enough for UGC via parallel repetition! NO needs val bounded from1, not tiny, then repeat constant power depending alphabet."
  —— 这是 trace 的"重复放大"路线雏形：YES 接近 1、NO 有界离开 1，然后常数次 parallel repetition。对应论文：completeness 完全可以不接近 1（thm:gap 的 (1+t)/2−ε 离 1 很远），且论文**根本不用博弈级 parallel repetition 去放大 soundness**——T 次自乘的用途是隐藏坐标（Lemma planting 的 T ≥ 1/(p_0(p*θ)²)），soundness 放大交给"先取 δ=b/4、Val≤b/2"的一次性参数。
- 调 Rao 字母表无关重复 [51]、SSS（sum-of-squares）算法对比、KKMO reduction 启发仿射博弈。
- **第一个大卡点（VERBATIM）**："Thus at most one informative i. So cheater chooses arbitrary g_{v_i}, on exact duplicated input matches and passes, independent of actual satisfiability!"
  —— shortcode/tensor 测试的泄露：把单项式限制到单独块+稀疏噪声仍隐藏不了可识别的复制；投影后的 tensor 查询会暴露外层约束（答案可适应约束而非编码固定标签）。对应论文：最终设计里"函数 of the code 只见词不见行/表/切片/边"（§2.5、§2.6 的 reduc 约定）从公理层面堵死"cheater 看见重复输入"；树 gate 的 Walsh 结构让每个单项式对每对孩子恰取一个孩子（Lemma 2.4），配合公共行数组 R 的"共享+独立重采"，不存在"exact duplicated input"可对齐。
- 映射引理：prop:affine-games（外部博弈）+ def:tree-code（词域生成）。

## §2（页 3–4）隐藏结构与稳定性 gap 的寻找

- Tensor 诚实误差小但低秩表示泄露投影坐标或可恢复常量；availability flags 撞上 uniqueness 计数障碍；反复回到 affine 2-to-2 与 inverse-shortcode 框架 [39,8]。
- Khot–Moshkovitz 实码路线 [41] 之后转向 Eldan–Moshkovitz 的 Subspaces Near-Intersection [25]；Gaussian 查询的小几何扰动被非线性 Lipschitz 响应抵消——**（VERBATIM）**："So stability comparable to honest. Thus noise-based Gaussian tester fails because low-degree linear dependence not enforced; need linearity test via rank-one transformations that preserves F_x more than smooth functions."
  —— 对应论文：最终测试不是 Gaussian 查询而是 **Boolean gate 表 + 树**，"preserve F_x more than smooth functions"的角色由 Majority Is Stablest 反向承担——不是要非线性函数比线性函数稳定，而是：诚实 dictator 在相关恒等式里给出精确 (1+t r^{2d})/2（Lemma 2.4），而任意割的超额稳定性被 MIS 强制解出影响坐标。论文不需要"linearity test via rank-one transformations"。
- 放大洞见（ undesirable frequencies 每步丢更多）没有找到合适的高阶 walk；Kasami–Tokura 低重 Reed–Muller 分类、等变 decoder 草案。BLR、Friedgut junta 的稀疏噪声控制不覆盖投影测试的 singular padded inputs。
- 条件性联系：KV 构造 [38] + Raghavendra dictatorship test [50] + MOO 不变性原理 [47] + Bonami–Beckner [14,12]。

## §3（页 4–5）从 winding 障碍到全局一致性

- **卡点（VERBATIM，节首）**："The proposed Unique Games route toward the BasicSDP threshold encounters a recurring problem: local consistency does not supply one global labeling."
- 循环群 winding number 路线：小增量很少跨越区间边界、Khot–Moshkovitz 实线性方程 [42] 起点、不相容 winding number 逼欺骗函数丢稳定性——但被"高维球面映射击破"：**"A cyclic construction based on scalar winding appears vulnerable to vector-valued maps into higher-dimensional spheres. Tensoring these maps and projecting through a shared Gaussian could correlate their singularities and achieve the honest strategy's error scale. The assistant considers this a possible failure mechanism for the cyclic construction."**（ winding 检查对标量循环，向量值映射进高维球面绕开区间边界。）
  —— 对应论文：绕开整个"连续/圆值"路线，直接 Boolean 词域 + Max-Cut 符号。
- 仿射 Unique Games 算法侧：约束 α+β=c over F_2；KV noisy-cube 对 universal equivariant rounding；GW 逐坐标舍入误差不同步、图平方放大误差；Khot–Saket、Grigoriev/Schoenebeck Lasserre 下界、ABS subexponential、Bafna certified small-set expanders、alpha-expansion 的未知 gauge、connection-Laplacian、interleaved-code 解码（syndrome rank 小而错误多）、Papadimitriou–Yannakakis 度规约、Barto–Kozik 常数字母表无关性存疑、正交分离子字母表相关损失、BKS sum-of-squares rounding 维数相关条件数——**（VERBATIM）**："Missing mass could be filled, but to shrink p need *renormalize* near intersection and **realign** u'_0(v)."（条件在随机线性哈希 fiber 上的伪标签，剩余向量不再和到公共参考向量。）Holenstein correlated sampling 的 mismatch cost 威胁误差缩减；可数多近似一致 character 投影不保证连贯可测标号。
  —— 对应论文：这一大段"算法侧"探索在论文中**整体消失**——最终证明只需要值下界（labeler 允许低效，prop:decoding 明说 "No efficiency claim about the labelers is needed"），所有算法侧圆整障碍不复存在。

## §4（页 5–6）非线性解码器与放大壁垒

- **卡点（VERBATIM）**："Thus soundness gap , not enough. Need ensure dummy axes themselves hard so no arbitrary gating. Imbalanced cycle obstacle."（tensor 构造的稀有 gate 使诚实误差指数小，但同样 gate 保护了幸存矩阵通道上的任意函数。）
  —— 对应论文：树 gate 码不是"稀有 gate"，而是每个 Walsh 单项式都过同一批 gate；"dummy axes themselves hard"的问题被"函数 of the code 只见词"的公理消解——没有 dummy 轴可见，就没有任意 gating。
- 投影使 Fourier 频率混叠，低秩不必给出一致解码标签；包含–排除公式独立于外层坐标数地界定 Fourier 截断，但 controlling projected queries 未解决。Ellis–Kindler–Lifshitz Grassmann hypercontractivity [26] 启发更强秩界。
- 度区分：完美着色建议输出字符占单 Fourier 度的解码器；Nisan–Szegedy [48] 度界区分 Boolean 度与大字母表度。定义非线性噪声失败 β 与 ()（同时线性提升的最小噪声成本），要增长比 ()/β。
- **卡点（VERBATIM）**："But after many levels rank may collapse along branches; fixed b implies stabilization at factorb. Need increasing b or avoid collapse via mixing outer layers."
  —— simplex-mixing 保既有优势但递归放大仍碎片化。对应论文：**"rank potential"路线整体被放弃**；论文的解析核心不是非线性 vs 线性解码器分离，而是 MIS + 仿射哈希 + 隐藏坐标，所有"rank"仅出现在 summary 特征 2 二次 gadget 的 harmonic rank potential（§6–§7），最终论文连这个也不要了。
- 条件 fallback（KV + Raghavendra + MOO + Rao/DS 重复）再次挂起。

## §5（页 7）从协同误差障碍到候选解码器 gap

- Tensoring 非线性解码器把误差摊到逻辑坐标击败放大；Ellis–Keller–Lifshitz、Gowers–Hatami 都不给出想要的解码器；图形编码局部一致但要指数多 Fourier 查询；Håstad parity gap + Rao 重复是提议硬度路线。
- 独立控制的 transposition 词生成不了传递 period 作用；Barrington 定理既是表达障碍又是 escape。CLP 多项式方法、Lovett analytic rank 的逆秩估计太弱。
- 特征 2 的 quadratic seed：取参数（trace 里记号丢失希腊字母，按上下文为）δ₁=δ₂=3, ℓ=2, (α,β)=(2/3, 1/3, 1/2) 之类——"cubic monomials and finite-field specialization bound exceptional cancellations by 3 for rank-observable families"；"harmonic-potential estimate kept β ≥ 1/4 while α vanished"。
  —— 对应论文：**这些全部不在最终论文里**。论文没有任何二次/三次 gadget、没有 harmonic rank potential；树 gate 码是"表 + Walsh"的纯组合对象。

## §6（页 7–8）共享仿射表与高频解码建议

- 非线性编码 + 共享仿射表；等变解码器 β→β：噪声很少改变解码值、每个足够高秩线性字符族以常概率检测到它。
- 用**精确识别**（同 reduced support 的表）替代近似一致性检查——因为一致性误差会集中到 KMS/BKS shortcode soundness 用的 slices 上。
- **卡点（VERBATIM）**："Existence tiny row fiber via theorem not enough because advice U gets random A,S=AM. Need positive probability independent k of hitting a whole fiber."
  —— KMS/BKS 只给"存在一个有利 row fiber"，而建议 U 拿到的是随机的 (A, S=AM)；需要独立于 k 的正概率命中整条 fiber。对应论文：论文的"row fiber"角色由 **context Γ 的均匀条件分布**承担——Lemma shift-coordinates 直接证明自由平移条件于 Γ 独立均匀，随后 extraction 的采样协议（条件于 ω,D,v 取 F_out、Γ）与 decoding 的植入把"建议频率"变成 p*θ 的显式常数，不需要 row-fiber 命中论证。
- BasicSDP 迁移用 Raghavendra 框架：平滑、Gaussian 比较、影响坐标解码。
- **trace–论文分歧点 1（在此出现）**："It develops a direct Lindeberg comparison instead of invoking the Mossel–O'Donnell–Oleszkiewicz invariance theorem [47]."
  —— **论文直接引 Majority Is Stablest**（Lemma 2.1 的证明第一句 "The untruncated assertion follows from Majority Is Stablest [MOO10, Theorem 4.4]" + Borell85），并附一个自足的 degree-cutoff 归约（T_u 噪声逼近）。trace 想自建 Lindeberg 比较绕开 MOO——论文认为不必：MOO 是外部基础之一（introduction: "Together with Majority Is Stablest, that construction supplies the external foundation of the argument"）。另一个 trace 顾虑："repeated variables may obstruct the intended projection-game formulation, and ordinary Raz repetition [53] introduces an alphabet dependence that risks circular parameter choices"——论文的回答是把"重复"整个换成博弈自乘 T + 植入坐标，且解码损失显式不依赖字母表（prop:decoding 后的注记）。

## §7（页 8–9）矩形 shortcode 参数的均匀性

- gadget 等变解码器 β(β+h)=β(h)+β 平移等变；特征 2 域二次映射 + generic rank- 字符空间至多 3 个同时对齐 + harmonic potential。
- **卡点（VERBATIM）**："Matrix rank cannot rise under specialization because all larger minors zero *as polynomials*, even with rational combinations; rank over function field r implies determinants identically zero in F2[x]. yes. Good."
  —— 特征 2 shift-equivariant gadget + harmonic rank potential 的转折验证（specialization 不升秩）。**对应论文：不出现**。论文没有矩阵 gadget、没有 specialization 论证；"uniformity in rectangular parameters"的真正论文对应物是哈希引理的"常数只依赖 ζ"（lem:hashing）与 extraction 的"常数只依赖 t,δ,μ"（prop:extraction）——均匀性由解析陈述的量词结构直接给出，不需要矩形矩阵的秩论证。
- Håstad parity 方程硬度 [32] + cloning 修正（每方程三个变量不同）；MZ [46] 的 smooth variable-versus-equation game with advice 启发稀疏投影；稀疏 singleton 投影概率 p=m^{−2/3}（trace 记号丢失，"probability = -2/3" 应为 m^{−2/3}）"both to make distributional error vanish and to leave increasingly many coordinates available for decoding"；避免循环参数：比较 Raz/Holenstein [53,33] 与 Rao/DS [51,22]。
  —— 对应论文：m^{−2/3} 稀疏投影**不出现**。论文的"坐标预算"是 unsplit 深度平均 s/(2emμ) 与度截断 K 的解析预算，没有随机稀疏化。

## §8（页 9–10）Row-fiber 丰度与阈值迁移

- **卡点（VERBATIM）**："Row fiber abundance lemma is important to avoid conditioned advice rare due row values S0 exponential m. KMS just existence of one fiber, probability 2^{-m r}. Need union randomization argument ensure many."
  —— row-fiber 丰度随机化+反证（"too little total measure would contradict shortcode soundness"）。**对应论文：被 extraction 的四步预算替代**——"有用建议以常概率出现"由 Λ=ητ/8 的四项对账（类 (i)(ii)(iii)+偶部分各 ≤ Λ/4）直接逼出 E N_iii ≥ Λ/(4K)，无需 shortcode soundness 反证。注意 summary §6 的反证思想（质量太小 ⇒ 违反 soundness）在论文里以"质量太小 ⇒ 与 (eq:large-max-sum) 矛盾"的**解析**对账出现，不再依赖外部 shortcode soundness。
- 另一修正：goodness 概率应对问题取平均而非逐问题成立。重复依赖隐藏坐标在公共条件下保持独立。
- BasicSDP 迁移：有限 gap 实例（积分最优 α、可行 SDP 值 β、β/α < r）、平滑、Fourier 截断、Gaussian 替换界低影响接受 ≤ 积分最优；影响坐标给候选 UG 标签。参数次序与有理近似留 slack。GW 逐坐标 union bound 累积坐标数因子——不给出字母表无关障碍。

## §9（页 10–11）标量检测与条件独立

- **卡点（VERBATIM）**："Aha! We don't actually need simultaneous union per z; detection prob for subspace G equals 2 times average over its characters of scalar nonzero probability (because for each a with some g0, exactly half of linear subspace maps a to1)."
  —— 把"对每个 z 的同时 union"换成"子空间的平均标量成本"（char-2 线性子空间把每个非平凡 a 恰一半映到 1）。**对应论文：不出现**——论文没有"非线性 gadget 的检测概率"概念；最接近的结构对应是哈希引理的二次矩/四次矩机制（总质量恒等式承担"平均"角色，色散承担"无需逐 z union"角色）。KKL 对比："small average influence across an enormous number of leaves does not give the sought contradiction"——论文的 MIS（而非 KKL）恰好给出稳定性上界这一所需方向。
- 解码的两条一致性要求（共享仿射表从 reduced keys 选平移代表；行信息限于固定输出维、列 witness 用方程端信息）；m^{−2/3} 稀疏投影使 advice 分布接近、留零 advice 斜率坐标；条件独立对重复必需。
- Raghavendra 迁移的 singleton/pair 矩匹配、simplex projection 产生全局一致赋值。

## §10（页 11–12）标签相容性与 pair 矩

- 等变解码器分离的最终陈述形态（噪声 β 下几乎不变 vs 高秩字符族常概率检测）；二次 seed (2/3,1/3,1/2)（记号复原）；generic-subspace 限制对齐字符；harmonic rank potential 控制灭绝。
- 逐坐标线性舍入的反例尝试：separately corrected coordinates 不必留在要求的线性码里。
- 外层：Håstad parity-triple + 稀疏投影/矩阵建议（MZ）+ Raz 重复（干净坐标）+ Rao/DS（最终放大）；shortcode 桥（KMS/BKS）的有界行列 slice 解码 + 无条件 total-variation 迁移；folding 选有效仿射答案；零 advice 坐标恢复普通重复投影博弈；重复变量保留分离局部坐标。
  —— 对应论文：**"unconditional total-variation comparison" 存活下来了**——就是 Lemma planting 的 TV 界；"bounded row and column slices" 演化为 context Γ + 2s 自由平移的坐标分解；"folding 选择有效仿射答案"演化为附录 A 的折叠类与 R_C。

## §11（页 11–12 续/12）参数次序与均匀 slice 界

- 具体反制策略（固定 bit 于小表支持、他处满足局部答案）被"同时扰动方向施加不相容要求"反驳。
- 文献依赖检查：KMS/BKS 的 slice 界必须独立于后续放大的输出维数，"Otherwise the row constraints might consume the kernel needed for decoding"；矩形 padding 与投影为候选修法。
- m^{−2/3} 再确认；Raz（固定字母表干净坐标）vs Rao/DS（字母表无关）；Khot–Vishnoi 对照（二进制平移结构不自动给维数无关 SDP 舍入）。
- BasicSDP 迁移终检：full-support marginals、平滑、Gaussian moment matching、influence-list 解码；"The dimension dependence of the imported shortcode bounds remains under examination."
  —— 对应论文：这个"仍在检查"的维数依赖，最终由**抛弃 shortcode bounds 的直接引用**解决——论文的树 Fourier/hash/解码全部自证，从 DKKMS25 只取博弈本身（且 prop:affine-games 的量化次序 ∀b∃n∀a 使 n 不依赖 a）。

## §12（页 12–13）组装提议归约

- 两阶段：UG with 近完全 completeness 与任意小 soundness → 迁移到每个固定语言的 BasicSDP 阈值。二次 gadget 经 harmonic potential 检查；"nongeneric character spaces need only have small constant probability: fresh outgoing randomness supplies a further factor proportional to the loss parameter"——trace duality、character alignment、gadget 输出条件均匀。
- MZ 的子空间等同、DKKMS 的 clique folding；parity-triple 起点；gadget noise vs uniform rank-one noise 比较、有界行列 slice 上找仿射结构；参数次序"gadget 与 advice 维数先于 parity 块数 m 固定"；m^{−2/3} 稀疏投影使 2^m→0 而 m→∞（记号复原：分布误差 2^m 型项消失而干净块数 m 增长）；Rao/DS 字母表无关重复是必需依赖。
- 最后：Raghavendra SDP + dictatorship test 框架迁移；与 GW 近似比较无矛盾。
- 结论句："The assistant concludes with its proposed affirmative argument for the Unique Games consequence and the BasicSDP threshold claim."

## 论文 vs trace 的分歧逐条

1. **Lindeberg vs MOO**。trace（§6）："It develops a direct Lindeberg comparison instead of invoking the Mossel–O'Donnell–Oleszkiewicz invariance theorem." 论文：直接引 MOO10 Thm 4.4 + Borell85（Lemma 2.1），只自证 degree-cutoff 归约（h_u=T_u h 逼近）。论文引言把 Majority Is Stablest 与仿射博弈并列为两个"external foundation"。trace 的自建比较没有进入最终论文。
2. **Rao 字母表无关重复 vs 博弈自乘+隐藏坐标**。trace 反复依赖 Rao [51] / Dinur–Steurer [22] 的 alphabet-independent repetition 做最终放大、并警惕 Raz [53]/Holenstein [33] 的字母表相关造成循环参数。论文：**references.bib 里没有 Rao、Dinur–Steurer、Raz、Holenstein**。放大的需求消失（thm:gap 的 NO 阈值直接来自 B(t) 的解析上界，无需把小 soundness 重复放大）；T 次自乘的唯一用途是给植入坐标以 TV 隐藏空间（T ≥ 2^{n(2k−2s)}/(p*θ)²），且这个 T 依赖字母表 n 恰恰无妨，因为次序上 n 已先定死。
3. **范围收缩：一切 CSP → Max-Cut**。trace 的原任务是每个固定有限 Max-CSP 的 BasicSDP 阈值 α_Γ（Raghavendra 框架的 dictatorship test 迁移、simplex projection、full-support marginals、pair-moment matching 大量篇幅）。论文：**references.bib 只引 Raghavendra08 作历史对照**（introduction），正证明完全不经过 Raghavendra 迁移；Max-Cut 的奇偶分解（Lemma cut-stability 的 −Stab(Ā) 项）是 CSP 一般框架里没有的免费结构——even 部分自动以负号出现。trace 中"shared answers for repeated variables"的顾虑也随之消失（博弈自乘的乘积边际下每坐标是原边律）。
4. **未引 Minzer–Zheng 与 Khot–Vishnoi**。trace 把 MZ [46] 的"smooth variable-versus-equation game with advice"当作稀疏投影/矩阵建议的灵感来源、把 KV [38] 当作反复的算法对照与条件 fallback 组件。论文 references.bib **不含 MZ 与 KV**；相应功能分别由（a）解析预算（MIS→Λ 对账）与（b）完全弃用替代。
5. **特征 2 gadget 与 harmonic rank potential 消失**。trace 的 §5–§12 核心技术资产（二次 seed、specialization 不升秩、harmonic rank potential、generic 子空间对齐数 3、simplex mixing）在论文中一条都不剩；论文的"代数"只有 F_2 上的线性代数（折叠类、仿射投影、自由平移坐标）。summary 里那句验证成功的 "Matrix rank cannot rise under specialization… yes. Good." 是 trace 自身的转折点，对应论文中不存在的技术。
6. **shortcode/tensor 泄露问题的解法不同**。trace：exact identification of tables with the same reduced support（把近似一致性换成精确识别）+ row-fiber 丰度随机化。论文：从根上改测试——词域由树 gate 码生成、割只见词；"cheater chooses arbitrary g…" 型作弊没有可见的重复输入可对齐。
7. **完整性—soundness 的接法不同**。trace：Håstad near-one vs ½ parity + UG + 重复。论文：DKKMS25 的 2-to-1 博弈（不完全 completeness，1−a 任意小）+ "先 soundness 后 completeness"（δ=b/4 先、ε≤a/(2k_0) 后）。
8. **UGC 的角色**。trace 全程试图证"BasicSDP 阈值 ⇒ UGC 风格 hardness"的 converse（多处 "proposed Unique Games route"）。论文：无条件 NP-难度，UGC 只在引言历史叙述出现（"The Unique Games Conjecture enters only as historical context"）。

---

# 四、常数与参数表

## 主链（thm:gap 证明）

| 符号 | 定义/条件 | 出处 |
|---|---|---|
| GW | min_ρ 2arccos ρ/(π(1−ρ)) = 0.878567… | intro eq:gw-constant |
| B(t) | (2/π)arcsin t, 0<t<1（负 t 同式延拓） | intro eq:B |
| ε | 0<ε<(t−B(t))/4 | thm:gap |
| δ | =ε（extraction 输入），要求 δ<1−B(t) | completion |
| μ | 有理、0<μ<1/2、tμ ≤ ε/4 | completion |
| r | =1−μ/d；r^{2d} ≥ 1−2μ（Bernoulli） | reduction/tree |
| s, m | s≥2、m≥1，由 extraction Step 4 定（s 由 ζ 与 K2^{−s}≤Λ/4；m 由 s/(2emμ)≤ητ/8） | extraction |
| k, d | k=(2s)^m（叶数）、d=s^m | tree def |
| K, τ | MIS 的度截断与影响阈，只依赖 t, ξ=δ/2；τ 再缩至 ≤1 | lem:mis |
| η | =δ/2：影响条目事件概率下界 | extraction Step1 |
| Λ | =ητ/8 = 大 max-influence 期望下界（eq:large-max-sum） | extraction |
| ζ | 满足 ζK ≤ Λ/4（哈希引理的色散目标） | extraction Step4 |
| γ, s₀ | 哈希引理：γ=ε̃²/128、2^{s₀}≥max{192D⁴/ε̃², 16/ε̃}，ε̃=min{ζ,1}，C=64/ε̃, D=8C/ε̃ | lem:hashing |
| M_0 | =Λ/(4·2^m)（类 (ii) 预算） | eq:extraction-constants |
| θ | =γM_0/K | 同上 |
| p* | =Λ/(4K·2^m) | 同上 |
| b | 有理、0<b<2^{−2s}·p*θ/2（游戏 NO 值） | completion |
| n | 字母表维数，由 b 经 prop:affine-games 定（n 只依赖 b） | completion |
| T | ≥ 2^{n(2k−2s)}/(p*θ)²（=1/(p_0(p*θ)²) 阶） | completion/decoding |
| p_0 | =2^{−n(2k−2s)}=Pr(Z_a) | decoding eq:zero-slot-probability |
| TV(P,U) | ≤ ½√((1−p_0)/(Tp_0)) | lem:planting |
| a | 有理、0<a<1−b、2Ta ≤ ε/4（最后选） | completion |
| 解码损失 | Val(G) ≥ 2^{−2s}·p*θ/2 | prop:decoding |
| completeness | (1−2Ta)(1+t r^{2d})/2 ≥ (1+t)/2 − tμ − 2Ta ≥ (1+t)/2−ε/2 | lem:completeness |
| 图规模 | \|X\|^T · 2^{2^{(n+1)T}}（除 \|X\| 外全常数） | completion |

## 解析预算（extraction）

| 量 | 界 | 依据 |
|---|---|---|
| unsplit 投影损失 | E Σ_{v∈D}‖(1−S_v)f̄‖² ≤ s/(2emμ) | lem:unsplit（telescoping + x e^{−2μx}≤(2eμ)^{−1} + log r ≤ −μ/d） |
| 总影响 | E Σ_{v,z} Inf_{v,z}(H_v) ≤ K | eq:degree-influence（Σ_a Inf_a(P_{≤K}h) ≤ K‖h‖²） |
| 偶部贡献 | E Σ max_z Inf(H_v^even) ≤ K/2^s | Step 2（平移不变 ⇒ 条目影响相等） |
| w_q vs m_q | w_q ≤ K·m_q；M_v ≤ K | eq:wq-mq（|B| ≤ 单项式度 ≤ K） |
| Σ_v M_v | E Σ M_v ≤ K | lem:hashing 总质量恒等式 |
| 三类+偶对账 | K2^{−s}+ζK+2^m M_0+K·E N_iii ≤ 3Λ/4+K·E N_iii ⇒ E N_iii ≥ Λ/(4K) | Step 4 |

## 哈希引理定量界

- E max_z‖U(z)‖² ≤ 2M[√(2ρ + 2C²/D² + 3D⁴/h) + (1/√C + 1/D)² + 1/h]，h=2^s, ρ=max_q w_q/M。
- 截断：Σ_q w'_q ≤ M；w'_q ≤ 2w_q + 2C²M/D²；E max‖U−U'‖² ≤ M[(1/√C+1/D)² + 1/h]（Var(X) ≤ M/h 由 S_p 两两独立）。
- 四次矩：E Σ_z‖U'‖⁴ ≤ Σ_q(w'_q)² + 3D⁴M²/h ≤ M²(2ρ+2C²/D²+3D⁴/h)（重合指标 ≤ 3/h；Cauchy–Schwarz 得 Σ_q(w'_q)²）。
- 参数：C=64/ε̃, D=8C/ε̃, γ=ε̃²/128, 2^{s₀} ≥ max{192D⁴/ε̃², 16/ε̃} ⇒ 结论 3ε̃M/4 ≤ ζM。

## 附录 A（仿射博弈）参数

| 符号 | 值/条件 |
|---|---|
| s_* | DKKMS25 Thm 4.1 的 3Lin NO 绝对常数（<1） |
| ℓ, k_0, β | ℓ≥2、k_0≥ℓ、β∈(0,1) 有理；n=ℓ−1；最终 k_0=j⁴、β=j^{−3} |
| κ（弃样） | O(k_0²/\|Z\|) + 2^{ℓ−k_0} + 2^{ℓ−2k_0}；q_all ≥ ½ |
| η（TV） | =2^{ℓ−k_0}+2^{ℓ−2k_0}；q_edge = P(E) ≥ 1−η |
| agreement 阈 | δ²/8（δ 最终 = b/4） |
| τ_r, τ_i | τ_r=min{C/2,1/2}；τ_i = 10^{−9}·τ_{i+1}^{12}（0≤i<r） |
| ζ_r, ζ_i | ζ_r=τ_0/2；ζ_i = 10^{−9}·ζ_{i+1}^{12} |
| e_{k_0} | =2^{ℓ+r−2k_0+1} ≤ τ_0/4 |
| 指标 margin | 2^{q−ℓ} ≤ τ_0/4；q ≤ ℓ−1；3k_0−r>ℓ |
| 建议损失 | Pr[Q∩H_U≠{0}] ≤ 2^{q−k_0} ≤ δα(ℓ)/8 |
| smoothness E_2 | TV(L_{U,Q}, L'_{U,Q}) ≤ 2^{ℓ+5}√β·k_0^{1/4} → 0（β√k_0 与 √β·k_0^{1/4}→0） |
| 商列表大小 | M_0(ℓ−q, r, ζ_r) 与 k_0 无关；M=2^q M_0 |
| 成功概率 | c_* = 2^{−r}·0.3τ_0/M；总 ≥ δα(ℓ)c_*/8 ⇒ raw valid acceptance ≤ δ |
| soundness | Val ≤ δ/q_edge ≤ b/2 < b（q_edge ≥ ½） |
| completeness | 1 − k_0ε/q_all ≥ 1−2k_0ε；ε ≤ a/(2k_0) 最后取 |
| 覆盖概率 | ≥ 0.3τ_i ≥ 0.3τ_0（DKKMS25 Lem 4.11/5.5） |

## 附录 B（去权去重）

| 符号 | 值 |
|---|---|
| p | 素数 > max{2, 2N²/ε′}（Bertrand 保证多项式搜索） |
| 簇 | F_p^6（每顶点 N p^6 个副本） |
| Q | =p^{12} |
| 矩形偏差 | ≤ 1/p + 1/p²（经 M_h M_h* = p^6 I ⇒ 范数 p³） |
| 总误差 | N(N−1)(1/p+1/p²) < ε′ |

---

*素材完。summary 希腊字母复原说明：pdftotext 丢失的记号按上下文复原为：p = m^{−2/3}（稀疏投影率）、(2/3, 1/3, 1/2)（二次 seed 参数）、β ≥ 1/4（harmonic potential 下界）、α_Γ（CSP 阈值）、u_0/u_{v,d}（SDP 向量）。*
