# 对称 Mahler 猜想与等号分类——第一人称研究思维链复盘素材（证明重构级）

论文：《The symmetric Mahler conjecture and its equality cases》（OpenAI，2026-09-22）。
tex 源码：`E:\math\preprints\The-symmetric-Mahler-conjecture-and-its-equality-cases-September-22-2026\build\`（main.tex + sections/ 共 8 节，约 73 KB）。
思维 summary：`E:\math\reasoning_traces\symmetric-and-general-mahler-conjectures.pdf`（45 页，三部分：Part I 对称下界 / Part II 等号分类 / Part III 一般情形）。
Lean：`E:\math\lean\OAI\Analysis\Mahler\`（243 文件，约 1.38 MB）+ `E:\math\lean\ComparatorChallenges\MahlerConjecture.json`、`SymmetricMahlerEquality.json`。

---

## 一、定理总览

**主定理（thm:main）**：对每个整数 n≥1 与每个原点对称凸体 K⊂R^n，
|K|·|K°| ≥ 4^n/n!，等号成立当且仅当 K 是 Hanner 多胞体的可逆线性像（"线性 Hanner 体"）。
Hanner 体由区间 [−a,a] 出发，对 ⊕∞（笛卡尔积）与 ⊕₁ = conv((H₁×{0})∪({0}×H₂)) 递归封闭生成；极运算交换两种和（(A⊕₁A')°=A°⊕∞A'°），体积满足 |A⊕₁A'|=(k!l!/(k+l)!)|A||A'|，从而 P(A⊕_s A')=P(A)P(A')/C(k+l,k)，归纳得 Hanner 体恰取 4^d/d!（lem:sums、lem:hanner）。

**Gross 共形透镜机制**：取 F(z)=(8/π²)Σ_{j≥0} (−1)^j z^{2j+1}/(2j+1)²（arctan 相关的奇级数），是单位圆盘到"透镜"D 的双全纯同构，其关键性质是**边界虚部均匀**：F(e^{iΘ}) ≟ ελ(T)+iT，T 均匀于 [−1,1]、ε 独立公平符号。这个边界律把"复可行性概率"翻译成"实体积"——这是全篇的概率—几何转换器。透镜的另一个不可替代的性质是水平半宽 λ 严格凹（λ''=−sec(πt/2)<0），它保证额外边界重合计概率为零，从而概率和可以精确等于不交单形并的体积。

**完整图景**：对条带表示 A={X:|b_iX|≤1}，C=A°=conv{±b_i}，每个行基 I 上采样边界值解出 Z_I，定义"其余行坐标仍落入闭透镜"的概率 P_I，可行和 S=Σ_I P_I。

- **ΣP_I ≥ 1（下界方向，解析）**：把孤立零点质量估计（Stokes + log-势复 Hessian 正性 + 齐次通量）应用到逆映射的 k 次幂 f_k=(h_j^k)，得 Σ_I M_{I,k} ≥ k^d·π^d/d!；径向换元 u_i=ρ_i^{1/k}e^{iθ_i} 恰好吃掉 k^d 因子，Fatou 上界形式把 limsup M_{I,k}/k^d 压到 (π^d/d!)P_I，故 S≥1。
- **反向不等式（组合）**：透镜边界律把每个 P_I 变成实积分 P_I=(D_I/4^d)∫_A Σ_ε 1{(I,ε) 在 X 处可行}dX；不同可行对的 d-单形 conv(0, ε_i b_i) 内部不交（每个单形内部点是线性泛函在 L_X 上的唯一最大化子），故 1 ≤ S = (d!/4^d)∫_A|Σ_X|dX ≤ (d!/4^d)|A||A°|。
- **等号路线**：缺体积恒等式 ∫_A(|A°|−|Σ_X|)dX = |A||A°|−(4^d/d!)S 把"等号"变成"缺体积积分为零"；提升 B=K⊕₁[−1,1]（B°=Q×[−1,1]，Q=K°）在 d=n+1 维保持等号，内逼近使缺体积趋零，紧性提炼出每个点、每个方向的**共同可行性见证**与最优表示成本不等式；X 趋向 B 的顶点 (0,1) 时 λ 的端点渐近 λ(1−η)=(2/π)η log(1/η)+O(η) 把成本变成仿射表达式，支撑函数分离给出度量 median；median ⇒ 三球交性质（Lima 判据）⇒ Hansen–Lima Cor 7.4 ⇒ Q 是 ℓ₁/ℓ∞ 迭代和 ⇒ K 是线性 Hanner 体。

函数论推论：偶函数版 functional Mahler（∫e^{−φ}·∫e^{−φ*} ≥ 4^n，经 Fradelizi–Meyer 传递，注意传递用 n+m 维辅助体，不是只用 n 维几何定理）；对称熵—输运不等式 H(η₁)+H(η₂) ≤ −n log(4e²)+T(ν₁,ν₂)（经 Gozlan 等价，c=4）。

---

## 二、逐引理带批注重构（核心）

### 2.1 预备节（convex-preliminaries.tex）

**规范与恒等式**：gauge p_A、支撑 h_A，双极性给 p_A=h_{A°}；(TA)°=T^{-T}A°，P(TA)=P(A)。两种和的 gauge：p_{A⊕∞}(x,x')=max{p_A,p_A'}，p_{A⊕₁}(x,x')=p_A+p_A'。lem:sums 的关键计算是 ⊕₁ 的体积：过 x∈A 的纤维是 (1−p_A(x))A'，用层集体积 |{p_A≤t}|=t^k|A| 得
|A⊕₁A'| = k|A||A'|∫₀¹ t^{k−1}(1−t)^l dt = k!l!/(k+l)! · |A||A'|，
Beta 积分靠反复分部积分。批注：这是唯一需要真正计算的引理，其余都是逐点检验泛函；机械理由是后面提升 B=K⊕₁[−1,1] 要用 |B||C|=(4/(n+1))P(K) 精确保持等号——常数 4/(n+1)=2|B|因子×2|Q|因子，来自 ∫_{−1}^1(1−|s|)^n ds = 2/(n+1)。

**引理 lem:sums 的极性方向的推导细节**：检验泛函 (y,y') 在 A⊕₁A' 上：⟨(y,y'),(x,0)⟩=⟨y,x⟩≤1、⟨(y,y'),(0,x')⟩=⟨y',x'⟩≤1 ⟺ (y,y')∈A°×A'°，即 (A⊕₁A')°=A°⊕∞A'°；再取一次极（双极性）得第二条。批注：这两条极性恒等式是"极运算交换 ⊕₁ 与 ⊕∞"的全部内容，等号分类收尾时 K=Q°=T^{-T}H° 依赖它；机械理由是 ⊕₁ 的 gauge 是和、⊕∞ 的 gauge 是 max，而 polar 交换"和"与"max"正是支撑函数与 gauge 的对偶关系 p_A=h_{A°} 的二维版本。

**[推测] 候选失败路线 1**：直接对一般 K 用 ⊕₁ 提升——若 K 不取等，|B||C|>4^d/d!，缺体积 D_j 不趋于零，紧性提炼失败；机制：整个等号论证以 P(K)=4^n/n! 为输入，D_j ≤ |B_j||C_j|−4^d/d! 的收敛性本质上依赖原体已取等。
**[推测] 失败路线 2**：把 ⊕₁ 体积公式换成 Blaschke 积或混合体积——极体纤维不再是缩放副本，k!l!/(k+l)! 精确值丢失；机制：只有 ⊕₁ 的纤维结构（1−p_A(x))A' 是精确齐次的。

### 2.2 透镜（lens.tex，lem:planar-lens + lem:lens-endpoint）

**精确陈述**：F(z)=(8/π²)Σ_{j=0}^∞ (−1)^j z^{2j+1}/(2j+1)² 在闭圆盘一致收敛；F 是 D→透镜 D 的双全纯同构，F'(0)=8/π²，且 D̄={v+it: |t|≤1, |v|≤λ(t)}；λ 连续偶、(−1,1) 上光滑、内部正、端点零，λ'(t)=−(2/π)arctanh(sin(πt/2))，λ''(t)=−sec(πt/2)<0；边界律 F(e^{iΘ}) ≟ ελ(T)+iT。

**推导**（三步全部显式）：
1. **无零导数与曲率正性**：令 w=arctan z=(1/2i)log((1+iz)/(1−iz))，对数内分数在右半平面，主支合法，|Re w|<π/4。求导给
F'(z)=(8/π²)(w/z)，1+zF''/F' = sin(2w)/(2w)。
对 w=a+ib≠0，实部 = [a sin(2a)cosh(2b)+b cos(2a)sinh(2b)]/(2(a²+b²))>0（因 |a|<π/4 使 a 与 sin 2a 同号、cos 2a>0；零点处极限为 1）。这就是"1+zF''/F'"版的曲率正条件——注意不是 Re F''/F'，而是带 1 的组合，它同时给出曲线正则（F'≠0）与正转向。
2. **凸性与单叶**：对每个 r<1，γ_r(θ)=F(re^{iθ}) 的切角 β 满足 β'=Re(1+zF''/F')>0 且 β(θ+2π)=β+2π；把曲线投影到固定点的右单位法向，投影导数符号为 −sin(β−β₀)：先负后正，唯一极大在 θ₀——于是每个点都是凸包在对应法向的唯一支撑点，曲线就是凸包边界；调和极大原理把 F(rD) 严格放内侧，辐角原理给内外各一原像。r↑1 穷竭得单叶、D 凸、g=F^{-1} 全纯。边界点不属于 D 的论证：否则 g 的连续性给 g(F(ζ))=ζ∉D，矛盾。
3. **边界参数化与均匀性**：右半圆 z=e^{is}（|s|<π/2）上 Re w=π/4，Im w=½arctanh(sin s)；t'(s)=2/π、v'(s)=−(4/π²)arctanh(sin s)。t(s)=2s/π，定义 λ(t)=v(πt/2)。**虚坐标在两支上以恒定绝对速率 2/π 走完 [−1,1]，每支概率 1/2**——这就是边界律的全部来源，没有任何分布计算。λ''=−sec<0 由 arctanh 递增直接得到；λ(±1)=0 来自 F(±i) 纯虚（级数奇性）。

**端点渐近（lem:lens-endpoint）**：λ(1−η)=(2/π)∫₀^η log cot(πs/4)ds（用 λ'(t) 公式 + arctanh(cos x)=log cot(x/2)），而 log cot(πs/4)=log(1/s)+O(1) 一致成立，积分得 λ(1−η)=(2/π)η log(1/η)+O(η)；比值版 sup_{a≤c≤b}|λ(1−δc)/λ(1−δ)−c|→0 由 c(L−log c+O(1))/(L+O(1))=c+O(L^{-1})，L=log(1/δ)。**log 因子是一阶的，这正是后面 median 论证里成本极限"减去线性项"的解析来源。**

**每个常数的机械理由**：8/π² 使 F'(0)=8/π² 且虚速率恰为 2/π（把 [0,2π) 的弧长参数映射成 [−1,1] 的均匀坐标）；指数上的 1/(2j+1)²（而非 1/(2j+1)）是让 F'=(8/π²)w/z 成为"arctan 型"的关键——若用 1/(2j+1) 则 F 是 log 型、边界有角点，严格曲率消失。summary Part I 原来选的是"实部为三角波"的归一化（(2/π²)Σ_{k odd} ζ^k/k² 型），论文版把它旋转成虚部均匀并显式验证曲率——三角波在 ±1 处的角点会摧毁 lem:boundary-ties。
**[推测] 候选失败路线 1**：用任何保圆双全纯映射（Möbius）+ 多项式修正代替此级数——均匀虚部性质等价于"两支上参数化速度恒定"，这强迫 ODE t'(s)=2/π 有解析解，唯一解即 arctan 族；机制：均匀性是刚性的，F 的自由度其实极小。
**[推测] 失败路线 2**：只要求 λ 连续凹不要 C² 光滑——lem:boundary-ties 的"固定切向每支至多出现一次"依赖 λ' 严格单调，凹而不严格单调时切向可重复，重合事件测度为正，S 与单形体积恒等式断裂。
**[推测] 失败路线 3**：把透镜换成对称带角点的多边形域——边界律仍可均匀，但 ∂D 的弧是线段、切向集离散化的"有限性"变平庸的同时，feasibility 概率对应的 L_X 顶点数退化为组合计数问题，Stokes 质量侧的 C² 收敛（rescale 后 log τ 的 C² 收敛需要 |H|² 在环上严格正、光滑）失去。

### 2.3 孤立全纯零点质量（holomorphic-mass.tex，lem:holomorphic-mass）

**精确陈述**：d≥1，N≥d，f=(f₁,…,f_N):U→C^N 全纯，满足 (i) f^{-1}(0)={0}；(ii) f(z)=H(z)+O(|z|^{k+1})，H 各分量是 k 次齐次多项式且 H(z)≠0 对 z≠0；(iii) 每个 {τ≤s}（τ=|f|²，0<s<1）在 U 内紧。则
∫_{τ<1} Σ_{|I|=d} |det(∂f_i/∂z_j)_{i∈I,1≤j≤d}|² dV ≥ (πk)^d/d!。
**规范**：d^c=(i/4)(∂̄−∂)，dd^c=(i/2)∂∂̄，dd^c|z|²=Σdx_j∧dy_j，(dd^c v)^d=d!·det(v_{z̄_i z_j})dV（由外积展开或 Hermite Hessian 酉对角化）。

**推导链**（每一步标明 Stokes 到哪、正性从哪来、渐近怎么取）：
1. **正性来源**：τ 的复 Hessian 是 Z*Z（Z 为 f 的复导数矩阵），半正定；log τ 在 z≠0 处的方向 Hessian 是 (|f|²|df(ξ)|²−|⟨df(ξ),f⟩|²)/|f|⁴ ≥ 0（Cauchy–Schwarz）。两个外幂顶 (dd^cτ)^d、(dd^c log τ)^d 因此非负。
2. **Stokes 到"通量 = 质量比较"**：取正则值 s，E_s={τ<s} 是紧流形带边，Stokes 给 ∫_{E_s}(dd^cτ)^d = ∫_{∂E_s} d^cτ∧(dd^cτ)^{d−1}。令 γ=d^c log τ；恒等式 d^c log τ = τ^{-1}d^cτ 与 dd^c log τ = τ^{-1}dd^cτ − τ^{-2}dτ∧d^cτ（后者是 log 的乘积法则展开）加上 dτ 在 ∂E_s 上拉回为零，给出 **质量—通量恒等式** s^{-d}∫_{E_s}(dd^cτ)^d = ∫_{∂E_s}γ∧(dγ)^{d−1}。这一步的机制：除以 s^d 是把 {τ=s} 上的 γ=τ^{-1}d^cτ 归一化成纯 d^c log 形式，为挖洞做准备。
3. **挖洞**：小闭球 B_ε⊂E_s，在 E_s∖B̄_ε 上用 Stokes（这次对 log τ，全纯域内 dd^c log τ 处处有定义）得
s^{-d}∫_{E_s}(dd^cτ)^d − ∫_{S_ε}γ∧(dγ)^{d−1} = ∫(dd^c log τ)^d ≥ 0。
**正性在这里第二次使用**：挖去项非负，所以质量 ≥ 球面通量。剩下只需算收缩球面的通量。
4. **齐次通量（渐近怎么取）**：ε^{-2k}τ(εz)→|H(z)|²=：T(z) 在含 S 的固定闭环上 C² 收敛（Taylor 级数逐项求导），T 在环上严格正 → log 同样 C² 收敛；拉回到 S 时加性常数 2k log ε 在 d^c 下消失（d^c 常数为零），得 lim_{ε↓0}∫_{S_ε}γ∧(dγ)^{d−1}=∫_S α∧(dα)^{d−1}，α=d^c log T|_S。
5. **通量的 t-不变性（Cartan 恒等式步）**：T 齐次（T(rz)=r^{2k}T(z)）且相旋转不变。在 S 上令 α₀=d^c log|z|²|_S，β=d^c(log T − k log|z|²)|_S，α_t=kα₀+tβ。对切向量场 V=iz：β(V)=0（ dilation 不变性）、α₀(V)=1/2；相旋转不变性使每个 α_t 沿 V 的流不变，Cartan 恒等式给 ι_V dα_t = L_V α_t − d(α_t(V))=0。于是顶维形式 β∧(dα_t)^{d−1} 在 (2d−1) 维球面上收缩非零向量后为零 → d/dt ∫_S α_t∧(dα_t)^{d−1} = d∫_S β∧(dα_t)^{d−1} = 0。**通量沿整条路径恒定，无需逐项计算 H 的具体形状。**
6. **端点值**：∫_S α∧(dα)^{d−1} = k^d ∫_S α₀∧(dα₀)^{d−1} = k^d∫_{|z|<1}(dd^c|z|²)^d = k^d·d!·vol_{2d}(单位球) = (πk)^d。
7. **收尾**：∫_{E_s}(dd^cτ)^d ≥ s^d(πk)^d 对正则 s；Sard 供给递增正则值列趋 1，单调收敛（被积函数非负）得 ∫_{τ<1}(dd^cτ)^d ≥ (πk)^d；最后 Cauchy–Binet 把 Hessian 行列式拆成子式：(dd^cτ)^d = d!·Σ_{|I|=d}|det Z_I|² dV（Z*Z 的 Cauchy–Binet），除以 d! 收工。

**假设的机械理由**：N≥d 保证有 |I|=d 的子式；(ii) 的 H 无零点是齐次通量 limit 中 log T 全纯化的前提（否则 log 奇点）；(iii) 紧子水平集是 Stokes 与 Sard 阶段的几何前提，在应用中由"基行束缚 z"提供。d^c 前因子 i/4 刻意选成 dd^c|z|²=Σdx∧dy，使 (πk)^d 恰为 2d 维单位球体积 π^d/d! 的 d! 倍×k^d——常数完全规范化，无隐形 π。
**[推测] 候选失败路线 1**：试图对非齐次 leading 项（如 H 的最低齐次部分在某方向退化）工作——通量 limit 中 log T 出现 −∞ 奇点，C² 收敛失败，端点通量无法与 (πk)^d 比较；机制：齐次无零性是 log 的正则性假设的几何化身。
**[推测] 失败路线 2**：绕开 Stokes 用 Bergman 核/∂̄ 方法直接算质量——Nazarov 路线可行但只给指数型常数，无法精确匹配 (πk)^d；机制：Lelong 数理论给的是比较公式，这里的直接 Stokes 证明的优势恰在保留精确归一化（summary 与论文均注明 Demailly §3、§5 是背景而非前提）。
**[推测] 失败路线 3**：把 Sard 换成"所有 s 正则"——τ 可能有临界值堆积在 1 附近；机制：论文用非负性 + 单调收敛吸收正则值列的存在性，若被积函数变号（如对复值行列式不带绝对值）此步崩塌。

### 2.4 可行基与 ΣP_I≥1（feasibility.tex，lem:holomorphic-feasibility + lem:boundary-ties）

**设置**：A={X:|b_iX|≤1}，C=A°=conv{±b_i}；行非零、张满（A 有界），复线性延拓。B_I=(b_i)_{i∈I}，D_I=|det B_I|。固定任意双全纯 F:D→D̄ 有界域、F(0)=0 连续到闭盘。对独立均匀角 θ_i，Z_I(θ)=B_I^{-1}(F(e^{iθ_i}))_{i∈I}，P_I=P{b_j Z_I(θ)∈D̄ 对所有 j}，S=Σ_{I∈B}P_I。**P_I 只测"其余行"——活跃坐标已在 D̄ 内。**

**推导**：
1. 令 g=F^{-1}，Ω={z: b_j z∈D ∀j}，h_j(z)=g(b_j z)。对 f_k=(h₁^k,…,h_m^k)、τ_k=Σ|h_j|^{2k} 应用质量引理。**孤立零点**：g 只在 0 为零、行张满；**齐次 leading**：g'(0)=c≠0，f_k 的 k 次项是 ((cb₁z)^k,…)，z≠0 时非零（c 可逆 + 行张满）；**紧子水平集**：每行坐标落入固定紧集 F({|w|≤s^{1/2k}})⊂D，基行束缚 z。全部假设验证。
2. **相关行集自动归零**：h_j^k 的导数行是 b_j 的标量倍 → 相关行子集的子式为零，求和只剩基。得 Σ_{I}M_{I,k} ≥ k^d·π^d/d!。
3. **径向换元（渐近怎么取）**：换元 u_i=h_i(z)（i∈I），逆映射 z=B_I^{-1}(F(u_i))，平方复 Jacobian = 实体积 Jacobian × k^{2d}Π|u_i|^{2k−2}；放大域为 {u∈D^d: Σ|u_i|^{2k}<1, 其余行约束}；u_i=ρ_i^{1/k}e^{iθ_i} 后 **k²|u_i|^{2k−2}dV₂(u_i) = kρ_i dρ_i dθ_i**，d 个坐标共产生 k^d，与质量下界的 k^d 逐坐标抵消。总测度有限 = 单位球体积 π^d/d!。
4. **Fatou 上界形式**：正 ρ 处 ρ^{1/k}→1，F 在闭盘连续 → 推断点趋于 Z_I(θ)；极限行坐标落在 D̄ 外则大 k 时约束失败。函数被 1 控制于有限测度空间，limsup M_{I,k}/k^d ≤ (π^d/d!)P_I（含所有边界等式情形）。有限多个基，三步不等式链 π^d/d! ≤ limsup Σ ≤ Σ limsup ≤ (π^d/d!)S 给 **S≥1**。注意：此处 F 只需一般有界域双全纯映射——透镜的特殊性只在下一步。
5. **额外边界等式概率为零（lem:boundary-ties）**：设行两两不成比例（归约：每条行线保留模最大的行，其余条带被蕴含；零行丢弃；d=1 时无其余行）。对 I、j∉I：b_jB_I^{-1}=(c_i)，至少两个系数非零（否则 b_j 与某基行成比例）。固定其余相位，两参数映射 (θ_a,θ_b)↦c_aγ(θ_a)+c_bγ(θ_b)+常数 的实 Jacobian 是 det(c_aγ'(θ_a),c_bγ'(θ_b))；对每个非端点 θ_a，γ'(θ_b) 方向恒定速率、λ' 严格单调 → 每支至多一个 θ_b 使方向重合 → 零集是有限条曲线+端点线，Fubini 后测度为零；逆函数定理局部微分同胚把零测的 ∂D 原像拉回零测；再对固定相位 Fubini。**这是 λ''<0 付账的地方。**

**假设的机械理由**：两两不成比例不是损失——它只是把同一条带的多余拷贝删掉；非退化 lens 的严格曲率让成比例行检验（单系数）与一般行检验（至少两系数）之间出现本质差别。Fatou 用上界形式而非下界：因为质量不等式是 ≥，把它除以 k^d 后要变成 P_I 的下界，方向上需要 limsup ≤，即反向 Fatou。
**[推测] 候选失败路线 1**：直接对固定 k 取极限而不走 k→∞——Jacobian 集中在 |u_i|≈1 处但可行动点族 {Σρ²<1} 与 {ρ=1} 边界之间的缝隙不可控；机制：k^d 因子只在 k→∞ 时与径向测度精确抵消，有限 k 有 O(1) 误差，S≥1 的精确常数丢失。
**[推测] 失败路线 2**：允许成比例行——b_jZ_I∈∂D 的概率不再为零（单系数时 b_jZ_I=c_aγ(θ_a)，γ 的像落在 ∂D 的概率就是 θ_a 落在零测集的概率，看似没问题，但两组基 (I,ε)、(I',ε') 可能指定同一顶点，单形不交性崩塌）；机制：disjointness 论证用"紧约束在基外"排除共享顶点，成比例行让基外紧约束以正概率出现。
**[推测] 失败路线 3**：用 F(0)≠0 的映射——h_j 的孤立零点性质破坏（g(b_j z) 的零点集是 b_j z=0 的交，仍孤立，但齐次 leading 项不再是 (cb_jz)^k 而有常数项，H(z)≠0 对 z≠0 失败）；机制：质量引理的 (ii) 需要 f_k 的最低阶项无公共零点。

### 2.5 实单形恒等式（simplex.tex，prop:simplex-integral）

**精确陈述**：L_X={Y∈R^d: |b_jY|≤λ(b_jX) ∀j}（X∈int A；所有宽度严格正 → 含 0 邻域；基行束缚 → 有界）。Y_{I,ε}(X)=B_I^{-1}(ε_iλ(b_iX))，(I,ε) 在 X 可行 ⇔ Y_{I,ε}(X)∈L_X。T_{I,ε}=conv(0,{ε_i b_i})，Σ_X=可行对的单形并 ⊂ C。则
1 ≤ S = (d!/4^d)∫_A|Σ_X|dX ≤ (d!/4^d)|A||A°|，
且缺体积 0 ≤ ∫_A(|A°|−|Σ_X|)dX ≤ |A||A°|−4^d/d!。

**推导**：
1. **概率→实积分**：边界律给每个活跃坐标 ε_iλ(t_i)+it_i，固定符号组合占测度 4^{-d}dt_I；写成推断向量 Y+iX，则 t_I=B_I X、Y=Y_{I,ε}(X)；"所有行坐标∈D̄" ⇔ X∈A 且 Y∈L_X（∂A 测度零，含于有限个超平面 b_jX=±1）。换元 t_I=B_I X 给
P_I = (D_I/4^d)∫_A Σ_{ε∈{±1}^I} 1{(I,ε) 在 X 可行} dX。   (∗)
2. **去重合**：对几乎每个 X，可行对无基外紧约束（lem:boundary-ties 的事件经边界律与可逆换元 t_I=B_IX 变成 X 的零测集；有限并仍零测）。固定这样的 X：不同可行对的 Y_{I,ε}(X) 不同——基不同则共享向量有基外紧约束；同基异号则同向量满足相反等式且宽度严格正，不可能。
3. **不交性（正性从哪来）**：e∈int T_{I,ε} 有表示 e=Σα_iε_i b_i（α_i>0，Σα_i<1）；对每个 Y∈L_X，eY ≤ Σα_iλ(b_iX)，等号在 Y_{I,ε}(X) 达成；等号迫使每条独立方程 ε_ib_iY=λ(b_iX) 成立 → 该向量是线性泛函 e 在 L_X 上的唯一最大化子。若 e 属于两个可行单形内部，两个不同向量都是唯一最大化子，矛盾。**单形体积各为 D_I/d!**，边界零测，故 d!|Σ_X| = Σ_IΣ_ε D_I·1{可行}。与 (∗) 求和、代入 S≥1 即得恒等式；Σ_X⊂C 给上界；缺体积 = |A||C|−(4^d/d!)S 精确成立。
4. **可测性**：可行性是连续函数的有限组闭不等式 → {(X,e)} 是有限个 Borel 集×闭单形之并，Fubini。
5. **具体反例（缺体积可为正）**：b₁=(1,0)、b₂=(1/2,√3/2)、b₃=b₂−b₁、X=0.9(1,1/√3)；λ(0.9)<4/15（端点积分 + cot x<1/x）、λ(0)>32/45（F(1) 交错级数），2a<λ(0) → 第三条带冗余，Σ_X=conv{±b₁,±b₂}，两顶帽面积 √3/2=|C|/3。**这个例子证明等号论证不能走"Σ_X=C 逐点成立"的路线，必须走积分+紧性。**

**[推测] 候选失败路线 1**：试图证明对每个 X 都 Σ_X=C——上图反例否决；机制：可行顶点集是 L_X 的"对偶骨架"的像，冗余条带在 L_X 侧不产生顶点，C 的对应帽不被覆盖。
**[推测] 失败路线 2**：把不交性证明换成体积论的标准"几乎处处单形不交"——需要 L_X 的顶点泛化性，而 X 有紧约束多处同时成立时 L_X 退化；机制：论文的线性泛函最大化子论证对退化 X 仍然逐点成立，且 X∈∂A 时约定 Σ_X=∅，避开边界。
**[推测] 失败路线 3**：只对单纯形极体（m=d，唯一基）建立恒等式再逼近——S≥1 的和里每个基贡献概率，丢掉多基求和就丢了 4^d/d! 里的组合因子 1/C(d,…)；机制：π^d/d! 的每个基按 D_I 权重瓜分，缺一个基概率和就小于 1。

### 2.6 缺体积与共同见证（zero-deficit.tex，prop:optimal-representation）

**设置**：K 取等，Q=K°，d=n+1，B=K⊕₁[−1,1]={ (x,s): p_K(x)+|s|≤1 }，C=B°=Q×[−1,1]（两条水平面 Q×{±1}）。|B||C|=(4/(n+1))·(4^n/n!)=4^d/d!——**等号在新维度保持**，这是提升的全部意义。

**推导（三步）**：
1. **内多胞体与缺体积趋零**：Q_j⊂Q 全维对称多胞体 Hausdorff 收敛，存在 t_j↑1 使 t_jQ⊂Q_j⊂Q（支撑函数 h_{Q_j} ≥ h_Q−ε_j ≥ (1−ε_j/r₀)h_Q）。C_j=Q_j×[−1,1]，B_j=C_j°，夹层 B⊂B_j⊂t_j^{-1}B → |B_j||C_j|→|B||C|。取 C_j 的每对对极顶点之一作行（张满、两两不成比例：内点出发的射线与凸体边界只交一点），prop:simplex-integral 给
D_j := ∫_{B_j}(|C_j|−|Σ_{j,X}|)dX ≤ |B_j||C_j|−4^d/d! → 0。
2. **从积分亏量到每个点与方向**：取 X∈int B、e∈∂C。选正体积球 U_k⊂int B∩B(X,1/k)、V_k⊂int C∩B(e,1/k)（在 e 处先向 0 挪一小步取球）；j_k 大到使包含成立且 D_{j_k}<|U_k||V_k|——若 Σ_{j_k,Z} 对每个 Z∈U_k 都错过 V_k，缺体积 ≥ |U_k||V_k|，矛盾。于是 X_k∈U_k、e_k∈Σ_{j_k,X_k}∩V_k。
3. **紧性提炼（无独立性假设）**：可行单形给 d 个带号基行 c_{ik}∈Q_{j_k}×{±1} 与权重 θ_{ik}≥0、Σθ≤1（余量是单形顶点 0 的权重），及见证 Y_k：c_{ik}·Y_k=λ(c_{ik}·X_k) 且对所有顶点 v 满足 |v·Y_k|≤λ(v·X_k)；凸组合+凹性把后一不等式延到全 C_{j_k}（三角不等式先于凹性——|h·Y_k|≤Σs_ℓ|v_ℓ·Y_k|≤Σs_ℓλ(v_ℓ·X_k)≤λ(h·X_k)）→ Y_k∈λ(0)B_{j_k} 一致有界（**即使基趋奇异**）。子序列极限：c_i∈Q×{±1}，e=Σθ_ic_i，c_i·Y=λ(c_i·X)，|h·Y|≤λ(h·X) 对全 C（用 h_k=t_{j_k}h∈C_{j_k} 过渡）。e∈∂C → 1=p_C(e)≤Σθ_i≤1 → **Σθ_i=1，极限质量不落在顶点 0**。
4. **成本比较**：对 ξ=(q,a)≠0，T=p_C(ξ)=max{p_Q(q),|a|}，取 e=ξ/T，α_i=Tθ_i，得
ξ=Σ_{i≤r}α_i c_i，Σα_i=T，c_i·Y=λ(c_i·X)，且对每个竞争表示 ξ=Σβ_jh_j（β_j≥0，h_j∈C）：
Σα_iλ(c_i·X) = ξ·Y = Σβ_j h_j·Y ≤ Σβ_j λ(h_j·X)。
**共同见证 Y 同时服务于最优表示与一切竞争表示**——这是"最优成本不等式"的机制，也是下一步 median 论证里"两个表示的成本可以比较"的原因。

**假设的机械理由**：为什么提升恰好一维、为什么 σ_i∈{±1}：C 的水平面 Q×{±1} 使行向量带符号 σ，后面 X_δ→(0,1) 时 λ(1−δ(1−σ⟨b,u⟩)) 的 1−σ⟨b,u⟩ 因子按 σ 分裂成两组，端点渐近的 log 把两组的贡献差变成 ⟨r_+−r_−,u⟩——**符号分裂是 endpoint 渐近能产生仿射信息的前提**。为什么允许退化极限表示（行不独立）：引理结论对"每个 prescribed 方向"成立，包括一切极限表示退化的方向；不需要独立性。
**[推测] 候选失败路线 1**：试图对 |Σ_{j,X}| 做逐点收敛——不存在；机制：Σ_{j,X} 在行集变化时完全不连续，论文明确说"不需要逐点极限"，靠的是积分亏量 + 乘积邻域 + 紧性，任何逐点路线都会卡在例外 X 集。
**[推测] 失败路线 2**：用外逼近（C_j⊃C）代替内逼近——极体方向包含反向：C_j⊃C 给 B_j⊂B，可行单形不再位于 C_j 内，缺体积恒等式的 containment 失效；机制：S≥1 与 Σ_X⊂C 的组合是不等式的两腿，只有内逼近两条腿都完整。
**[推测] 失败路线 3**：只对 e∈∂C 的光滑点建立表示——median 论证需要的 (q,a) 方向可以落在 ∂C 的非光滑骨架（Q 的棱×{±1}）；机制：紧性论证对任意 e∈∂C 工作，但若在提炼时要求行独立，退化方向（a=±T 或 q 平行某行）会丢。

### 2.7 中位数（median.tex，prop:metric-median）

**精确陈述**：K 取等 ⇒ (R^n, p_Q) 中任意三点 0,x,y 有度量 median m：‖x_i−x_j‖=‖x_i−m‖+‖m−x_j‖ 对三对同时成立。

**推导**（每步标明机制）：
1. **几何预算**：p₁=‖x‖、p₂=‖y‖、p=‖x−y‖、s=p₁+p₂、a=p₁−p₂；s≥p≥|a|。定义 A_+=(p+a)/2、A_-=(p−a)/2、c=(s−p)/2，满足 A_++A_-=p、c+A_+=p₁、c+A_-=p₂。目标：x+y ∈ D₀+(s−p)Q，其中
D₀={r_+−r_-: r_++r_-=x−y, ‖r_+‖≤A_+, ‖r_-‖≤A_-}
（紧凸、非空：r_±=(A_±/p)(x−y)）。一旦有成员关系，m=x−r_+=y+r_- 与三对三角不等式等号化。
2. **端点比较（渐近怎么取）**：固定 u∈int K，X_δ=(δu,1−δ)∈int B（p_B(X_δ)=δp_K(u)+1−δ<1）。对 (q,a)=(x−y,p₁−p₂) 用 prop:optimal-representation：总权重 T=p，行 (b_i,σ_i)、聚合 r_±=Σ_{σ_i=±1}α_i b_i，则 r_++r_-=x−y、Σ_{σ_i=±1}α_i=(p±a)/2=A_± → r_+−r_-∈D₀。成本（除以 λ(1−δ)）下界 ≥ p−⟨r_+−r_-,u⟩−pε_u(δ) ≥ p−h_{D₀}(u)−pε_u(δ)：这里 **λ(1−δ(1−σ⟨b,u⟩))/λ(1−δ) → 1−σ⟨b,u⟩** 对 (b,σ) 一致（引理 2.2 的比值渐近，1−σ⟨b,u⟩ 落在紧区间 [1−p_K(u),1+p_K(u)]⊂(0,∞)），误差 ε_u(δ)→0。
3. **与两项表示比较**：竞争表示 (x−y,a)=p₁(x/p₁,1)+p₂(−y/p₂,−1)（两行都在 Q×{±1}），其归一化成本 → s−⟨x+y,u⟩。最优性迫使 p−⟨r_+−r_-,u⟩ ≥ s−⟨x+y,u⟩（极限后），即
⟨x+y,u⟩ ≤ h_{D₀}(u)+s−p 对 u∈int K。
4. **分离**：连续性延到 u∈K；一般 v≠0 取 u=v/h_Q(v)∈∂K，齐次性给 ⟨x+y,v⟩≤h_{D₀}(v)+(s−p)h_Q(v)；右侧是紧凸集 D₀+(s−p)Q 的支撑函数（约定 0Q={0}）→ x+y∈D₀+(s−p)Q → m=x−r_+ 满足 ‖m‖≤c、‖x−m‖≤A_+、‖y−m‖≤A_-，三角不等式强制三个都是等式（p₁≤c+A_+=p₁ 等闭合链）→ median。
**注意成本极限只需对固定 u 的 (b,σ) 一致误差**——不需要对 u 一致，论文原文强调"The error was uniform only over b,σ for the fixed u; that is all this limit requires."

**常数的机械理由**：为什么取 X_δ 趋顶点 (0,1) 而不是一般点：顶点处 B 的两条"棱"（Q×{1} 的两个方向）退化，λ 的端点 log 渐近把指数级小的成本差异放大成一阶仿射差——在任何内点，λ 的凹性只给次优不等式，信号被平滑掉。为什么聚合集 D₀ 是 r_+−r_- 而不是 r_++r_-：median 条件里出现的是 x+y=（x−y)+2y 的对称化，符号差结构对应 ±1 行分裂。
**[推测] 候选失败路线 1**：直接用最优表示的 r_± 作为 median 的定义分量而不做支撑函数分离——D₀ 的成员关系只在"某个方向 u"验证，需要全方向；机制：凸分离是把逐方向不等式升级为集合包含的唯一通路，跳过则只得到弱化的"几乎 median"。
**[推测] 失败路线 2**：把端点渐近换成 λ 的一般凹性上界 λ(1−η)≤λ(0)——成本比较失去 1−σ⟨b,u⟩ 线性项，极限只给平凡不等式；机制：凹性是"≤λ(0)"方向，而 median 论证需要"→1−σ⟨b,u⟩"的精确一阶信息。
**[推测] 失败路线 3**：在 (R^n, p_Q) 直接构造 median 而不经提升——p_Q 的最优表示是抽象定义，没有 σ 分裂与端点几何；机制：一维提升把"两条路径"编码成 σ=±1 的两组行，这是 median 三对等号的组合来源。

### 2.8 函数论推论的推导（introduction.tex，cor:functional-mahler 与 cor:entropy-transport）

**偶函数版 functional Mahler**：设 φ 偶、真、下半连续凸，0<∫e^{−φ}<∞。令 f=e^{−φ}，用 Fradelizi–Meyer 的极函数 f^z(y)=inf_{f(x)>0} e^{−⟨x−z,y−z⟩}/f(x) 与平移极小化乘积 P(f)=∫f·inf_z∫f^z。他们的 Proposition 1(a) 说：**每一维**的对称几何 Mahler 不等式 ⟹ 对每个偶 log-凹 f 有 P(f)≥4^n——传递不是在 n 维内完成的，而是在 n+m 维构造辅助体后令 m→∞，因此"全维定理"是必要输入而非可有可无的加强。Theorem thm:main 供给该假设，f^0=e^{−φ*}，得 ∫e^{−φ}·∫e^{−φ*} ≥ 4^n。**常数验证**：φ(x)=Σ|x_i| 时 φ* 在 [−1,1]^n 上为零、外部 +∞，两个积分各 2^n，乘积 4^n 达到等号。批注：等号分类**不**随传递——Fradelizi–Meyer 明确指出极限传递不能分类取等的偶势（p.1437），这与几何侧的完整分类形成有意对照；非偶情形的下界 e^n 由一般情形论文（companion）给出。

**熵—输运形式**：log-凹概率 η_i=e^{−V_i}dx 对称、密度本性连续（e^{−V_i} 在支撑边界的 H^{n-1}-几乎处处为零——这是 Fradelizi 的密度边界衰减定理的内容，保证动量测度一阶矩有限），ν_i=(∇V_i)#η_i。推导只需两件现成事实：|∇ρ_i|=|∇V_i|e^{−V_i} a.e. 与 Cordero-Erausquin–Klartag 的 ∫|∇ρ_i|<∞、V_i∈L¹(η_i)（其 Lemma 4 与 Proposition 7 的证明），再套 Gozlan 的"对称函数逆 Santaló ⟺ 熵—输运"等价（Fradelizi–Gozlan–Zugmeyer Thm 1.3，c=4），得 H(η₁)+H(η₂) ≤ −n log(4e²)+T(ν₁,ν₂)。批注：−n log(4e²)=−n−2n log 2 中的 2n log 2 正是 4^n 常数的熵化身；**这条推论是主定理的"免费副产品"，但它的假设清单（本性连续密度、有限熵）每一个都有独立用途，是"假设的机械理由"的典型：没有密度边界衰减，∇V 的可积性失效，ν_i 的一阶矩可能无穷，输运问题的框架塌掉。**

**[推测] 候选失败路线**：试图直接对 φ 做分析（复 Hessian、Stokes）证明函数不等式而不经几何传递——传递所需的 n+m 维辅助体把等号信息彻底抹平，任何直接路线都必须同时重现"全维下界+分类"两件事；机制：函数侧的等号类（取等偶势）理论上应回投为 Hanner 体的极限，但目前没有已知的直接论证。

---

## 三、等号分类线：从 lens 等号到 Hansen–Lima 的逐引理机制

**链条**：缺体积→提升→共同见证（prop:optimal-representation）→ 端点成本→median（prop:metric-median）→ 三球交（lem:three-balls）→ Hansen–Lima Cor 7.4（thm:hansen-lima）→ 分类（prop:equality-classification）。

**1) 为什么等号侧要概率随机化（指数随机化平方半径 + Cauchy–Binet）**。summary Part II 原文："The assistant obtains the circle value P(0+)=1 by randomizing squared radii exponentially, integrating complex Gaussians, and applying Cauchy–Binet." 机制：S≥1 的极限论证取 k→∞，径向变量 ρ_i^{1/k}→1，极限测度集中在边界——把 ρ_i² 按 Exp(1) 随机化后，Σρ_i²<1 的事件概率与复 Gaussian 积分精确相配，Cauchy–Binet 把 Gaussian 行列式矩拆回基子式，S(0+)=1 由此而来；论文最终版改用直接的孤立零点质量计算（Stokes 齐次通量），但"概率和 = 边界采样"的解释结构保留。

**2) 为何不用确定性解释（VERBATIM 原句）**。summary Part II：
> VERBATIM EXCERPT
> "Then some phase none to balance. Thus no deterministic. Laplace solution concise."

（summary 保留的原始笔记格式，一字未改。）机制：确定性路线试图找出确定性的相位选择使 Σ_I 1{可行}≥1 逐点成立；反例存在——某些相位使两个基同时可行而另一些相位使所有基都不可行，逐点可行计数没有下界；把半径平方按 Laplace（指数）分布随机化后，"权重集中于边界"用积分全局补偿逐点失败，一行 Laplace 论证代替整个确定性组合搜索。**这是从 Part I 到论文定稿一直保留的概率内核，Lean 侧对应 MassLimit/SpecialSourceMass 链条的 Fatou 上界步。**

**3) 三球交与 median 途径的选择**。summary Part II："The earlier candidate argument also discusses a facial route using Lima's intersection characterization [43]; the assistant chooses the median route and checks the real, finite-dimensional hypotheses of Hansen–Lima's structure theorem, particularly Corollary 7.4 [35]. It concludes that Q is an iterated ℓ₁- and ℓ∞-sum of segments and applies polarity to conclude the stated classification for K."
机制拆解：median ⇒ 三球交（lem:three-balls）是初等但精巧的：三点中心 x₁,x₂,x₃、半径 r₁,r₂,r₃ 两两相交，取 median m，d_i=‖m−x_i‖；若 d_i≤r_i 全部成立完毕；否则设 t=d₁−r₁>0，median 性质给 d_j+t≤r_j，z=m+(t/d₁)(x₁−m) 落在 m 到 x₁ 的线段上，‖z−x₁‖=r₁、‖z−x_j‖≤t+d_j≤r_j——**z 沿着"超出球₁最多的方向"往回走**，含 r=0 的情形（z=x₁）。
**4) 为什么选 median 而不是 facial route**：facial route 需要对面结构（faces of the unit ball）的先验正则性，而 median 途径从最优成本不等式直接读出，对退化极限表示一律工作；Lima 1978 的 norm-additive 分解判据（=Hansen–Lima Thm 3.6(4)）恰好以"每三点有 median"为输入，且其逆方向的有限维分类 Cor 7.4 直接产出 ℓ₁/ℓ∞ 迭代和。Reisner 1987 的无条件情形已提示"最小体积积 ↔ 球交结构"的联系，但那里以 unconditional 为前提；这里的端点论证在无 unconditionality 假设下得到同一结构。
**5) 收尾**：Hansen–Lima 给 Q=TH（H Hanner 体），K=Q°=T^{-T}H° 仍是线性 Hanner（极运算交换 ⊕₁/⊕∞ 且保持区间基例）。 converse 方向由 lem:hanner。

---

## 四、summary 时间线：45 页失败清单

### Part I（对称下界，summary §1）
- **想干什么**：直接在 n≥4 建立尖锐常数。**先试**：截面归纳、面旗（face flags）、等测度锥分割、熵、张量化——"finds no sharp constant along these routes"。**卡点**：这些路线全部给出指数常数或维度损失，无法收敛到 4^n/n! 的精确组合因子。共通机制：任何"先界两个因子再相乘"的路线在常数上是相加误差，而 Mahler 是乘积型不变量，只有"同一个概率/积分同时编码两侧体积"的结构（边界律）才可能保住精确常数——这正是最后采用的结构。
- **Stanley h-向量**：对中心对称单纯多胞体用 Stanley 的 h-向量下界（[62]），**卡点**：还需配套的"体积分数"界（associated volume fractions），没有。映射到论文：论文根本不需要单纯形多胞体假设——条带表示 A 是一般极多胞体，体积分数的空缺被 P_I 的概率和整体替代。
- **Kuperberg neck / Berndtsson / Nazarov Bergman / Klartag 各自 revisited**：Kuperberg 的 Gauss linking 积分、Berndtsson 的复积分重构、Nazarov 的 ∂̄+Bergman 核、Klartag 的 isotropic 常数—Mahler 体积关系（[39,9,49,38]）——全部只提供非常数下界或不同不变量的估计，作为**参照**而非组件。论文 introduction 明确切割："their estimates are not hypotheses of our proof"。
- **Lundin/Baran 转折（救活的观察）**：Lundin 的极值函数公式与 Baran 度量（[44,5,6]）把注意力引向"平面边界律 + 复化条带"：选映射使**边界实部为三角波**（均匀分布于 [−1,1]），对每个条带行基定义可行性概率 P_I。**救活机制**：三角波=均匀分布 ⟺ 逆映射的幂把体积 Jacobian 集中到边界采样 ⟹ S≥1；反向用不交单形给出 ∫|Σ_X| ≤ |A||A°|。summary §1 原文列出 powers of the inverse conformal map、positivity of the complex Hessian of a logarithmic potential、Stokes、homogeneous flux calculation to derive S≥1，以及 "associates feasible bases with disjoint simplices, obtaining ∫|Σ_X| ≤ d!|A||A°|/4^d"，并反复检查 normalization、genericity、boundary ties、Hanner examples。论文定稿把三角波旋转成虚部均匀的 Gross 透镜（获得严格曲率 λ''<0，这是三角波没有的），并用直接 Stokes 代替 summary 的简化叙述——两者的数学内容一致，但曲率是论文版能做等号分类、summary 版不能的分水岭。

### Part II（等号分类，summary §2）
- **Hanner 方向（成功）**：极性交换两种和 + 体积积 P()P()/C(k+l,k)，归纳得 Hanner 取等。
- **converse 的透镜重构**：凸性经 Re(1+zF''/F')>0 检查；边界支 ±λ(t)+it、均匀高度、λ''=−sec(πt/2)；S 的单调性论证用"平滑复 Hessian 行列式拆成含常数行/不含常数行的 minors"（这是 summary 版的通量恒定性论证，论文定稿改为 α_t=kα₀+tβ + Cartan 恒等式，更干净）；rank-two 相位图查 extra-row ties；圆与透镜端点用控制收敛。
- **P(0+)=1**：指数随机化平方半径 + 复 Gaussian + Cauchy–Binet（见上节）；**确定性解释被否决**（VERBATIM："Thus no deterministic. Laplace solution concise."）。
- **等号侧**：lift 到 K⊕₁[−1,1]；内逼近 + 缺体积积分趋零 → 成本最优表示；λ(1−η)=(2/π)η log(1/η)+O(η) 把成本变成仿射；两表示比较 + 紧凸聚合集分离 → metric median；median 移向"球错过的中心" → 三球公共点。**facial route vs median route 的抉择**已在上节引用。

### Part III（一般情形——十条代表性死路，供旁证；注意此线不属于对称论文）
1. **张量幂放大渐近常数→单纯形常数**（§3）：光滑体可有内部 projective 极小，普遍的 trace 估计不存在。
2. **三角剖分/松弛矩阵匹配面旗**（§3）：光滑单纯形的精细逼近可使匹配和任意小——"长而近平的 primal 块对应极小的 dual 块"。
3. **Zonoid 比较**（§3、§6）：投影体归一化后 Zhang 反向 Petty 不等式方向相反；切锥归纳"leads tangent arbitrary unknown, no induction"（VERBATIM）。
4. **切锥归纳 / Brascamp–Lieb 双向亏量**（§3）：分别界的两个积分不控制它们的乘积。
5. **anti-blocking / Saint-Raymond 坐标归纳**（§3–4、§8）：primal 权重趋于锥积分而 dual 权重集中到暴露面一点——"Need |B| factor, not obtained"（VERBATIM）。
6. **Klartag projective 协方差 + 顶点—面 incidence 测度**（§4–6）：随机矩阵特征值 1,−1/n,0 的确定性损失；barycentric coupling 被自否决——"So no scalar alone. Need coupling constraints relating r and r' and z conditional facets"（VERBATIM）。
7. **shadow-flow / CLXX 计数扩展**（§4、§12）：高维 incidence（24-胞体等）提示"Need lower bound for rigid cases, not classification"（VERBATIM）——变形消去路线需要的是刚性情形的下界而非分类。
8. **熵/输运路线**（§7、§13、§19）：score 鞅端点问题——"That would even stronger than Mahler (contradiction extremal). Issue endpoints r random unequal, can't align log scales pathwise causally"（VERBATIM）；尖截断指数的 Fisher 信息爆炸——"For sharply truncated Exp, Fisher huge. CLT route fails"（VERBATIM）。
9. **Gaussian 正则化 / canonical barrier（Cheng–Yau 仿射球）**（§8、§24）：无约束极小让尺度逃逸；水平集体积演化需要法向速度为支撑函数——"Thus p is *far* from support precisely near simplex, ODE fails drastically, can't bootstrap"（VERBATIM）；标量归纳失败——"So iterative scalar e false"（VERBATIM）。
10. **复分析簇**（§10–12）：Nazarov 型矩 ψ_n 的三方锥计算出现负三阶导（与高阶导数正性矛盾）；moment body 的比较"taut"（VERBATIM："Mahler target becomes compare … products to m_B/m ratios (taut)"）；zonotope 纯并编码任意对称体上的双锥——"So pure union Mahler as hard as symmetric general!"（VERBATIM）；全纯收缩被否决——"Thus no holomorphic contraction on any bounded fixed domain in general"（VERBATIM）。
（其后 §33–49 转入**条件性证明链**：cone 归一化 ∫_C e^{−φ}·∫_{C*} e^{−φ*} ≥ 1、biased Gaussian 投影场 + Riccati 协方差 + 熵比较 + 标量段不等式，条件是 §37–44 的逐段标量估计；等号论证经"损失为零 → 线性 Gaussian 系数交换 → 投影导数对角 → 坐标积锥 → 正交锥 → 单纯形截面"。该链条的最终状态在 summary §49 明确：'Its proposed conclusion remains dependent on the uniform scalar inequalities used in the entropy comparison.'）

### 失败路线 → 引理映射
Part I 的三角波边界律 → 论文 lem:planar-lens（旋转 + 曲率）；逆映射幂的集中 → lem:holomorphic-feasibility；齐次通量 → lem:holomorphic-mass；"缺体积" → prop:simplex-integral 的 eq:simplex-deficit；Part II 的 lift + 内逼近 + 端点渐近 → prop:optimal-representation + prop:metric-median；median→三球→Hansen–Lima → lem:three-balls + thm:hansen-lima + prop:equality-classification。

---

## 五、Lean 取证

**总量**：243 个 .lean 文件，共约 1,382,164 字节；~1982 个声明（712 theorem、994 lemma，其余 def/structure）；无 sorry、无 admit、无自定义 axiom（ComparatorChallenges 允许的 propext/Quot.sound/Classical.choice 为 Mathlib 标准）。tactic 粗计：have 3149、rw 1393、exact 1376、simp 1066、intro 801、apply 702、obtain 418、refine 202、unfold 135、constructor 95、rcases 91、funext 92。

**MainTheorem 为何只有 910 字节**。`MainTheorem.lean` 全文只有一条定理 `symmetric_mahler`：`cases n` 后调用 `symmetric_mahler_from_special_homogeneous_values`，而该定理（在 `HomogeneousMassAssembly.lean`）把"齐次球面通量值"作为**假设**：
```
theorem symmetric_mahler_from_special_homogeneous_values (n : ℕ)
    (hvalue : ∀ N (A : Matrix (Fin N) (Fin (n+1)) ℝ),
      Function.Injective (measurement A) → ∀ m, 2 ≤ m →
      Mahler.homogeneousSphereFlux n N (specialLeadingPolynomial A m) = (π*m)^(n+1))
    {K : Set (Fin (n+1) → ℝ)} … :
    4^(n+1)/(n+1)! ≤ volume K * volume (coordinatePolar K)
```
MainTheorem 里只需为特殊条带多项式族 `specialLeadingPolynomial A m` 提供 hvalue（一行 `exact (euclideanSpecial_massHypotheses A …).homogeneousSphereFlux_value`）。**关键点**：注释原文——"The final body theorem needs the homogeneous value only for the actual finite-strip polynomial family. A general isolated-zero mass theorem or Sard theorem is not an additional premise." 也就是说：
- 论文里一般形式的 lem:holomorphic-mass（任意 f 满足三假设 → 质量 ≥ (πk)^d/d!，证明用了 Sard 供给正则值列）在 Lean 里对应的 `MassBoundTarget`（`MassTarget.lean`：MassHypotheses → ∫⁻ ≥ ENNReal.ofReal (πm)^n）**不是主定理链的必需前提**；Lean 链条直接对特殊族计算球面通量值，绕开了"任意 f"的一般性。
- Sard/正则值阶段被绕开的方式：`MassHypotheses.regular_massBelow_of_homogeneous_value` 把正则水平 `hreg : τ=R 处 fderiv ≠ 0` 留作假设，而特殊链条在 `HomogeneousSphereIntegral.lean` 里用 α-路径（`alphaPath`：t↦m(1−t)·dc(log|coordinate|²)… 的线性插值，对应论文的 α_t=kα₀+tβ）证明通量沿路径恒定，t=0 端点的值 = m^{k+1}×参考通量 `reference_boundary_flux`（`ReferenceSphereIntegral.lean`，用酉不变性归约到坐标球面积分），t=1 端点即任意 G 的通量——**通量恒定性 + 参考端点值代替了 Sard + 单调收敛**。d=1 的圆情形单独处理（"Dimension one is handled by the already proved circle calculation"）。
- 这解释了 910 字节：所有实质工作在 240 个支撑文件里，MainTheorem 只是三行拼装。

**MassHypotheses 结构体**（`MassTarget.lean`）：10 个字段——dimension_pos、degree_pos、open_domain、zero_mem、holomorphic（DifferentiableOn ℂ）、isolated_zero（∀z∈U,(∀j,f_j z=0)↔z=0）、homogeneous（G_j IsHomogeneous m）、leading_nonzero（z≠0 → ∃j, eval z (G j)≠0）、taylor_remainder（IsBigO ‖z‖^{m+1}）、compact_sublevels（closure 紧且含于 U）。质量密度 `massDensity = n!·det(sourceHessian(energy f)).re`、质量积分 ∫⁻ 于 U∩{tau<1}。特殊族的实例化在 `SpecialMassHypotheses.lean`（3,596 字节）：`specialMap_mass_hypotheses` 把条带几何（StripGeometry、specialLeadingPolynomial 的齐次性、specialMap_leading_remainder、specialTau 紧子水平）打包成 MassHypotheses——与论文 lem:holomorphic-feasibility 证明里的"全部假设验证"逐条对应。

**等号侧 15 万字节 vs 论文一节**。等号链 Lean 文件：`Lens.lean`（48,513，含 λ 的端点 profile、logCot 比值、concave_ratio_antitone、uniform_profile_ratio 等——论文 lem:lens-endpoint 的完整展开）、`Medians.lean`（33,425，SignedUnitRepresentation、optimal representation、aggregateSet、`zero_median_of_optimal`、`metricMedians_of_optimal_lift`）、`EqualityMedians.lean`（33,551，`equality_common_lens_witness`、`optimal_lift_of_equality`、`medians_of_equality`、`equality_polar_gauge_medians`）、`HannerBodies.lean`（37,491，RealNormData、coordinatePolar_bipolar、`hannerSpace_iff_linearHanner`、`IsLinearHanner.volumeProduct`）、`Classification.lean`（23,746，HasMetricMedians → LDecomposition → `hannerSpace_of_medians` → `equality_implies_linearHanner` → `symmetric_mahler_equality`）。其下还有三层"面部代数"：`Faces.lean`（58,507，IsFace 偏序/交/传递/eq_convexHull_inter）、`Diamonds.lean`（43,245，IsParallelPair、facial_diamond——单位球面上平行面对偶结构的"菱形"引理，对应 Hansen–Lima 3.2IP 的面部分析）、`Splitting.lean`（62,995，maximal_unit_face_vertex_sign、IsSplitPair、supporting_sum_eval）。**论文里 median.tex 一节约 8.7 KB 就带过（引用 Hansen–Lima 为黑箱），Lean 侧必须自建 HasMetricMedians 的面部—分裂机制，因为 Mathlib 没有现成的"3.2IP 范数空间 = ℓ₁/ℓ∞ 迭代和"理论**——这 15 万字节（Faces+Diamonds+Splitting+EqualityMedians+Medians+Classification ≈ 255 KB，若含 Lens/Hanner 则 ~340 KB）是 Lean 版与论文版差异最大的区域。注意 Classification 里 LDecomposition 的构造（norm_add：‖e z‖=‖z.1‖+‖z.2‖）正是论文 eq:sum-gauges 的 ⊕₁ 情形，而 hannerSpace 的递归对应 lem:hanner。
另注意：Lean 里 Hansen–Lima 定理本身似乎未被引入为黑箱（JSON 的 solution 只 import Classification），而是由 `hannerSpace_of_medians` 从 median 性质直接重建 ℓ₁/ℓ∞ 分解（LDecomposition + 递归），即把 Cor 7.4 的有限维论证内化了。

**Source*/Raw* 桥接文件群**（约 20 个）：`SourceRawJets.lean`（"Forget continuity only after taking the actual bundled derivative"——ContinuousAlternatingMap 世界与裸 MultilinearMap 世界的 jet 对应）、`SourceRawCoefficient.lean`（rawCovector/HasRawFDerivAt 桥）、`SourceRawOrientation.lean`、`RawExteriorPower.lean`/`RawAlternatization.lean`（rawProduct = domCoprod 后的交替化，对应 Cauchy–Binet 的外代数侧）、`SourceCoordinateForms/Measure/Exterior.lean`（坐标侧 exterior 微积分）、`SourceStokes/SourcePrimitiveStokes/SourceRadiusFlux/SourceLevelFlux/SourceRegularMass/SourceHomogeneous.lean`（Stokes 与通量的源定义层）。机制：Mathlib 的 exterior algebra / ContinuousAlternatingMap 对"沿参数族的微分 + 交替化 + 与 MvPolynomial 求值对齐"不够直接，Source* 层定义论文所需的正则对象，Raw* 层给裸微积分对象，桥接引理（如 `sourceHomogeneousPrimitive_eq_homogeneousPrimitive`，经 `sourcePrimitiveSlots_eq_primitiveFinEquiv` 的槽位对齐）把两层钉死——这是 Lean 版比论文版多出的纯形式化开销。
**桥接层的必要性（Source*/Raw* 为何存在）**。Mathlib 的 exterior algebra / ContinuousAlternatingMap 对"沿参数族的微分 + 交替化 + 与 MvPolynomial 求值对齐"不够直接。Source* 层定义论文所需的正则对象（例如 `sourceHomogeneousPrimitive` 用固定槽位序 α, β, 交错 dα），Raw* 层给裸微积分对象（rawCovector、rawFirstJet/rawSecondJet、rawProduct=domCoprod 后交替化），桥接引理把两层钉死：`sourcePrimitiveSlots_eq_primitiveFinEquiv`（槽位序对齐）、`sourceHomogeneousPrimitive_eq_homogeneousPrimitive`（经 ContinuousAlternatingMap.toAlternatingMap_injective）、`rawCovector_hasRawFDerivAt`（裸方向导数与 bundled fderiv 对齐）。这是 Lean 版比论文版多出的纯形式化开销：论文里一句"由 Cauchy–Binet 展开"，Lean 侧对应 RawExteriorPower + MatrixHessian + Cauchy–Binet 的完整链（约十几个文件的量级）。

**通量常数的数值化**：`HomogeneousSphereIntegral.lean` 中 t=0 端点把 m^{k+1} 提出积分外（`orientedDensity_smul` + `integral_const_mul`），剩下 `reference_boundary_flux k : sphereFlux k (boundaryFormFin (dcLinear (logTau (coordinateMap (k+1)))))` 型的参考值（`UnitaryReference.lean` 用 normEnergy 的 dc 与酉群不变性证明任意酉框架同值：`normEnergy_twoForm_unitary`）——对应论文 ∫_S α₀∧(dα₀)^{d−1}=d!·vol(球)=π^d。**α-路径的两端**：`alphaPath_zero`（t=0 时 = m·dc(logTau coordinate)，纯坐标项）与 `alphaPath_one`（t=1 时 = dc(logTau f)，目标项）精确复刻论文 α_t=kα₀+tβ 的插值，`FluxVariation.lean` 的 `extDeriv_oneForm_affine` 给参数导数的线性性，Cartan 恒等式的角色由"路径通量恒定"引理承担。

**Lean 命名—论文引理对照表（主链）**：
- lem:planar-lens ↔ Lens.lean 内 conformal 系列（配合 ConformalSeries/ConformalInjectivity/ComplexStripMap）
- lem:holomorphic-mass ↔ MassTarget.lean（MassHypotheses/MassBoundTarget）+ SourceStokes/PuncturedSublevelStokes（Stokes 阶段）+ HomogeneousSphereIntegral（通量阶段）
- lem:holomorphic-feasibility ↔ StripGeometry/RescaledMassMap/MassLimit/SpecialSourceMass（径向换元 + Fatou）
- lem:boundary-ties ↔ 对应的 ties/ rank-two 论证文件（PlanarSymmetry/RegularBoundaryAtlas 系列）
- prop:simplex-integral ↔ SimplexVolume/DisjointSimplices 系（配合 CovectorVolume）
- prop:optimal-representation ↔ EqualityMedians.lean（`equality_common_lens_witness`、`optimal_lift_of_equality`）
- prop:metric-median ↔ Medians.lean（`zero_median_of_optimal`、`metricMedians_of_optimal_lift`）
- lem:hanner ↔ HannerBodies.lean（`IsLinearHanner.volumeProduct`）
- 分类 ↔ Classification.lean（`equality_implies_linearHanner`、`symmetric_mahler_equality`）

---

## 六、常数与魔法数字（全部属于 Part III 一般情形线，仅供旁证）

出处：summary §37–45（"A conditional proof chain and its remaining obligations" 及后续审计章节）。**再次强调：这些常数服务于一般（非对称）Mahler 的条件性证明链，与对称论文的常数（8/π²、2/π、(πk)^d/d!、4^d/d!）无关。**

- **b = .602、c = .365、r = .22**（§38）：标量段估计的三个参数。原句（原文符号部分被 PDF 提取吞掉）："The assistant developed the segment estimate linking averages of the scalar profiles K, C and a rotating diagnostic ξ=(c,s) to the variance of Y. Here b=.602, c=.365, …, r=.22, K = …"。配套：坐标 x=3.6 sinh u（把实轴压成双曲坐标），圆分量 ξ(u)=.22(cos(4.6u), sin(4.6u))——**.22 是圆的半径、4.6 是角频率、3.6 是 sinh 尺度**；b、c 是 K、C 两条标量 profile 的线性组合系数（§37 另记 K = c−2、C = −c+6.5 的写法，即 profile 由频率与常数偏移定义）。
- **1.94 σ² vs 1.8 σ²**（§38）：Riccati 恒等式供给的二次罚 ≥1.94σ²，而声明的误差预算 1.8σ²——0.14σ² 的余量是整条条件链的安全边际。
- **2 log 2 − 1/3 与 log 2 + 1/4**（§38）：谱阈值两侧的几何相减常数与另一积分常数，用于支付换位子项。
- **0.0812**（§13）：早期输运矩路线累计的对数缺口（目标 c/(2e) 对上 1/e −1/2 +O(1) 的比较），是"差多少"的量化记录。
- **w = 0.5**（§32）：行列式权重的半权修正（"w=0.5 may fix both"）——对应平均 Hessian 的黎曼体积元；随后即撤销一个导数估计（"Oops B_γ HS bound impossible unless gradient zero"）。
- **中间宽度 [.16, .54]、立方增益 .193、.540 与 .5551090、尾阈 64**（§40–41、§43、§45）：标量估计的三段式分割——半宽 ≤.16 用联合曲率+端点成本 ≤.540（其中 Q₀=222/3 的量，PDF 提取有损，存疑）对余量约 .5551090；中段保留 Var(s) 的立方下界 (coth u−ℓ)³u³ ≤.193 型，超额 ≤.027；|x|>64 的正部积分用 K(u)≤u^{-2}log u。
- **Bernstein 多项式（30 次与 32 次）**（§40、§43）：剩余不等式归约为 deficit 多项式的正性，VERBATIM："if T(l+du)=Σc_i u^i, then representation Σ_{r=0}^n b_r C(n,r) u^r(1−u)^{n−r}, b_r=Σ_{i≥r} C(r,i)/C(n,i) c_i. all b_r>0 ensures"——Bernstein 系数全正是充分判据。
- **27/4**（§48）：二维单纯形的体积积验算（sanity check）。
- **锥归一化常数 (n!)²/d!**（§40、§46）：d=n+1 维锥上 Laplace 积之积与体积分的换算因子，即 ((n!)²/d!)·vol(K)… 的来源；等价性审计 VERBATIM："Cone Laplace inequality exactly equivalent for hyperplane sections, not all log-concave."
- **(φ+1)(φ+2) 协方差条件、γ=φ+1**（§9、§33–36）：指数倾斜笛卡尔幂的 formal 极小协方差条件与方差修正 Var(X)+Var(X̃) ≥ 2 的混合阈值否定（"This kills mixed small-threshold model (both variances O(r²)!)"）。
- **其他死路编号常量**：§19 的 tight frame、§22 的 "cross-cost kernel is *exactly* orth reference"（VERBATIM，拼接路径的核恰为正交锥参考核）、§24 的 Cheng–Yau 屏障、§26 的 det·P(支持面非负)=D(n)、§47 的等号论证"不需要极值唯一性"（VERBATIM："Equality from negative losses doesn't require proving uniqueness of fixed point Q,T; for any one, if product=1 then all inequalities saturate"）。

---

### 附：素材定位索引
- 定理陈述与结构：`build/sections/introduction.tex`（thm:main）、`convex-preliminaries.tex`（lem:sums、lem:hanner）。
- 解析核：`lens.tex`（lem:planar-lens、lem:lens-endpoint）、`holomorphic-mass.tex`（lem:holomorphic-mass）、`feasibility.tex`（lem:holomorphic-feasibility、lem:boundary-ties）。
- 几何核：`simplex.tex`（prop:simplex-integral）、`zero-deficit.tex`（prop:optimal-representation）、`median.tex`（prop:metric-median、lem:three-balls、thm:hansen-lima、prop:equality-classification）。
- Lean 主链：`MainTheorem.lean` → `HomogeneousMassAssembly.lean` → `HomogeneousSphereIntegral.lean`/`ReferenceSphereIntegral.lean`/`UnitaryReference.lean` → `SpecialMassHypotheses.lean` → `MassTarget.lean`；等号链 `Classification.lean` → `EqualityMedians.lean` → `Medians.lean` → `Lens.lean`；面部代数 `Splitting.lean`/`Diamonds.lean`/`Faces.lean`；桥接 `Source*/Raw*`。
- 挑战配置：`MahlerConjecture.json`（定理 `OAI.SymmetricMahler.symmetric_mahler`）、`SymmetricMahlerEquality.json`（定理 `OAI.SymmetricMahler.symmetric_mahler_equality`，solution 模块 `OAI.Analysis.Mahler.Classification`）。
