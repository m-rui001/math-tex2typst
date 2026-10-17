# D02 · Kaplansky 直接有限性猜想·特征 2 反例，反推笔记（深版）

> 依据：论文 tex（paper.tex + sections 01–06）、23 页 reasoning summary、Lean 形式化（126 文件，challenge 认证 `OAI.KaplanskyCounterexample.main_theorem`）。[推测] 标注反推成分。

## 0. 起点：我想证"正"的，直到我发现正的证不了

Kaplansky 的猜想：对每个域 K、每个群 G，K[G] 里 ab=1 ⇒ ba=1（直接有限性）。特征 0 有 von Neumann 代数的正性机器，所以真问题在正特征、含挠群。我最初的计划是找正结果的边界：以 Ceccherini–Silberstein–Coornaert–Phung 的 surjunctivity 和 Elek–Szabó（sofic 群稳定有限）为已知充分类，用幂等缺陷 e=1−ε 组织搜索。然后是一条接一条的死路，summary 前 10 节几乎全是尸体清单，我在第 17 节把它们分级登记。

关键的心态转折发生在 §11：我不再试图对"任意群"证正结果，是反过来问，**什么样的代数恒等式在某个特征里是自洽的、在别的特征里自爆？** 我发现了一组"看似矛盾实则兼容"的恒等式：每点正则度 D=ℓ+1 条线、每条线上秩一矩阵和为零、全空间秩一矩阵和为 −I_m。在特征 0 里把线恒等式对全体线求和立得 D·(−I_m)=0，即 I_m=0，自爆。但若 D=0 作为标量（特征 2 且 ℓ 奇），三条恒等式和平共处。summary §14 的自审原话一字未改地留了下来："Our mod2 D divisible q ensures. **Thus no lift. Positive characteristic essential.**"，我试过的每一个特征 0 提升都死于同一点，§21 再确认："characteristic-p identity inherently due D=0. p-adic lift must alter supports adding higher-order terms from nonlocal group elements."这一刻我明白反例的引擎找到了：**不是我要绕开正性，正性在那个特征里根本不成立。**

ℓ 奇与特征 2 的分工精确对位，这是我反复调对的参数组合：ℓ 奇供分母（子群平均 P_v=κ⁻¹Σu、特征幂等 e=ℓ⁻¹Σζ^{-r}z^r、坐标幂等 p_i=|B|⁻¹Σζ^{-w_i}w，κ=ℓ²、|B|=ℓᵐ 都要可逆，若 ℓ=2 则 κ=4=0 in K，P_v 无定义）；特征 2 供 D=0（线零和与正则性兼容）。两半缺一不可，缺一半整个构造不存在。

## 1. 引理 3.1：单纯形上的 Newton 插值，从"哪来的多项式"开始

我要在打孔的仿射空间上造"每个孔的指示函数"型多项式。最自然的第一反应：Vandermonde 的 n 维直积。试了，死在一个具体的点：直积基的全次数不受控，而后面的线和恒等式（引理 3.2）需要**任意线上的限制次数封顶在 2d₀=q−2**，直积基做不到。解法是把插值信息集从全空间 Qⁿ 换成**下集**（单纯形）S_d={(a_{k₁},…,a_{k_n}): Σk_i≤d}，配 Newton 骨架多项式 N_k(X)=Π_{i≤n}Π_{0≤u<k_i}(X_i−a_u)。可逆性的证明是纯三角化：赋值矩阵按字典序排列后下三角全零（N_k 在 j 点取值，只要有 j_i<k_i 就含因子 a_{j_i}−a_u=0），对角元 Π(a_{k_i}−a_u) 是不同域元素之差、非零。d<q 不可去，d≥q 时 X_i^q−X_i 在 Qⁿ 上恒零但作为多项式非零，赋值不单射。

为什么用下集就解决了次数问题：|S_{d₀}|≈qⁿ/(3ⁿn!)，远小于 qⁿ，后续概率估计的密度才成立；而次数 ≤d₀ 的多项式限制到任何线上次数 ≤d₀，两个秩一矩阵的乘积元素 f_o(v)f_{o'}(v) 次数 ≤2d₀=q−2，恰好卡在引理 3.2 的归零阈值上。**次数预算 2d₀=q−2 是整个几何层的硬通货**，我后来每一次想"再利用"它都被迫放弃（见 §14 的失败路线）。Lean 侧对应 `PolynomialPairing`/`simplexPoints a n ((q-2)/2)`，枚举 a:Fin q≃Q 作为显式参数贯穿全部几何层，因为 prescription 要"对任意枚举一致"，三角化论证恰好对任何枚举成立，这是免费的一致性。

## 2. 引理 3.2：线和，整个构造的求和引擎

陈述：全次数 ≤q−2 的多项式 P 在每条仿射 Q-线上之和为零、在 Qⁿ 上总和为零。证明我写得很省，但找到它花了很久。线的参数化把 P 限制成一元 p(z)，deg≤q−2，然后三段：Σ1=q=0（特征 2）；对 1≤k<q−1，取 c∈Q× 使 c^k≠1（Q× 循环、阶 q−1），乘 c 是 Q 的置换，Σz^k=Σ(cz)^k=c^kΣz^k ⇒ (1−c^k)Σz^k=0 ⇒ Σz^k=0；整空间按平行线族分块。

两个我踩过的坑值得记。其一，**次数 q−2 精确不可放松到 q−1**：Σz^{q−1}=Σ_{z≠0}1=q−1=1≠0，一步越界全线崩。其二，我一度想用乘法特征的正交关系（对 Q× 求和）代替平移消去，特征 2 中 −1=1，复特征正交性整个失效；平移消去（乘 c 置换）不依赖任何符号，这才是特征 2 友好的论证。事实上全篇我强迫自己只用"不需要 −1≠1"的论证，转写公式时转置上标 T 都注明 "without any involution on the coefficient field"。Lean 侧 `sum_line_gram`、`sum_complement_gram` 对抽象特征 2 有限域（`CharP Q 2`）证明，并非 F_q 具体模型，同一理由：prescription 外层搜索需要对任意实现一致。

## 3. 命题 3.3：x_v 与 −I_m 的诞生

现在组装几何层的心脏。设 O⊂S（孔集），线族 F 躲开 O 且每点恰属 D=ℓ+1 条线、incidence 图围长 ≥12、|O| 满足 2N_pt/D²≤|O|≤7N_pt/D²。对每个孔 o，引理 3.1 给唯一 d₀ 次多项式 f_o 在 S 上是 {o} 的指示函数。定义列向量 x_v=(f_o(v))_{o∈O}∈K^m，W_v=x_vx_v^T。

推导的中间步骤我要全写出来，因为它们承载了两个恒等式的诞生：W_v 的 (o,o') 元是 f_o(v)f_{o'}(v)，次数 ≤q−2 的多项式取值，引理 3.2 给 Σ_{v∈f}W_v=0（线）与 Σ_{v∈A}W_v=0（全空间）。关键一步在孔处：f_{o'}(o)=δ_{oo'}（插值的定义！），所以 x_o 是坐标单位向量、W_o=e_oe_o^T，于是 Σ_{o∈O}W_o=I_m，从而

Σ_{v∈V}W_v = Σ_A W_v − Σ_O W_o = 0 − I_m = −I_m.

（特征 2 里 −I_m=I_m 语义相同，但我坚持写 −I_m：这个负号是特征 0 的幽灵，它让"为什么不能提升"在记号层面可见。）尺寸核算：D≥4 ⇒ 7N_pt/D²<N_pt/2 ⇒ m<N_pt/2<t；且

t/m = N_pt/m − 1 ≤ D²/2 − 1 ≤ (D−1)² = ℓ²,

最后一步等价于 (D−2)²/2≥0。**t≤mℓ² 就是打包层的鸽笼预算，m<t 就是缺陷侦测的预算**，一个孔数假设同时喂两张嘴，这是我把 |O| 的界从粗调到 [2M,7M] 的原因。

[推测]死路一：用随机函数值代替插值指示函数，线零和需要次数 ≤q−2 结构，随机列的 Σ_{v∈f}W_v 是随机矩阵，并非 0，UT=I_m 修不回来。summary §11–12 的多轮审查后我才固定 "interpolation at the holes"。死路二：让 x_v 带 ζ-扭曲坐标，W_v 次数翻倍超 q−2，预算挪用即死。

## 4. 粘合群 N：Fano 划分与共享生成元

几何有了，要把它实现成群。每个点 v 一个坐标副本 K_v=(Z/ℓ)²，每条线 f 一个 L_f=(Z/ℓ)，ι_{vf}:L_f→K_v 单射。这里的组合引擎是一个 Fano 型划分：(Z/ℓ)² 恰有 ℓ+1 个一维子空间，每条含 ℓ−1 个非零元，(ℓ+1)(ℓ−1)=ℓ²−1 恰好划分全部非零元，这就是"每点属 D=ℓ+1 条线"的代数化身，也是后面子群平均划分恒等式 (3.3) 的来源。生成元 s_{f,c} 对所有非零 c；定义关系是所有"局部零和"：若某点 v 同时属于 s_{f₁,c₁}…s_{f_k,c_k} 的所有线且 Σε_iι_{vf_i}(c_i)=0 in K_v，则该有符号字是关系。

设计选择上我摔过跤：最初把 K_v 沿"共享 L_f"做 amalgam（自由积再商），读不出局部划分恒等式，子群平均的幂等性在商里丢了。改成**共享生成元**（L_f 同时落在每个 K_v 内）才让 (3.3) 成立。另一个被否决的方案：局部群用 (Z/ℓ)^d，d≥3，方向数变成 ℓ^{d−1}+…+1，与 incidence 正则度 D=ℓ+1 的匹配断裂，D=0 的特征 2 机制失效。Lean 侧 `GluedGroup`（`PointGroup ℓ = Multiplicative (Fin 2 → ZMod ℓ)`）+ `ShortRelators`（长度 ≤3 的局部关系子列表 + `N_shortEquiv`）；`IncidenceDirections.directionMap : Option K → K →ₗ[K] (Fin 2 → K)` 把 ℓ+1 个方向编码为 none↦(0,c)、some a↦(c,a·c)，这个 Option 编码是我很得意的一个形式化技巧，ℓ+1 个方向被参数化成 ℓ+1 个"仿射坐标值"。

## 5. 引理 2.2：围长 12 ⇒ θ_v 单射，平面平衡图论证

这是论文里最长的初等论证，也是 summary §12–§15 反复恐慌的地方。目标：证没有生成元 s_{f,c}（c≠0）在 N 中死去。路线：若 s_{f,c}=1，则单字母字可经有限次"插入/删除连续定义关系"归约为空字。把 successive words 画在水平层上，持久 token 用保序导线连接，插入块占一条导线间的空隙、**无交叉**；每个被插入的 token 有诞生/消亡两顶点，生命周期导线上加白顶点（标号 i∈F），两侧边权 εy 与 −εy；初始 token 以例外白顶点收尾。得到有限平面二部多图：黑标 V、白标 F、非零边权，每顶点平衡（在 ι 下和为零），只有一个例外白点平衡非零。

然后是**极小化**，这一步的范围我在 summary §13 里专门澄清过（"Minimal graph argument doesn't require planar balanced graph remains drawable as word diagram after contractions; minimal among all graphs satisfying combinatorial balances, not diagrams"）：在**所有**满足组合条件的连通平面二部多图中按（顶点数，边数）字典序取极小，不限于归约图的像。§15 的恐慌原话值得留档："Could N actually be trivial despite planar argument due to non-planarity of reduction? Need scrutinize signed wires again."，归约图本身可能不平面，Euler 就完了；解法是极小化类的抽象性：平衡图必然有平面实现，论证只消费组合条件。Lean 侧 `PlanarBalance.Balanced` 结构体（`blackLabel/whiteLabel/weight/balances/exception`，`weight_ne` 与 `exceptional_sum` 是字段）就是把这个抽象类对象化。

极小图上的手术三连：平行边加和/删除（平衡与例外和非零性保持，例外点落在被删平行边上则其和归零，但例外和≠0 由权非零保护）；同标签相邻邻居沿空扇区收缩（各平衡在群里相加，加的是零）；然后度数核算，黑度≠1（ι 单射）、≠2（两个不同一维子空间的非零向量之和为零不可能，Lean `hind`=`directionMap_independent`）⇒ 黑度≥3；白度≠1（权非零）⇒ 白度≥2（例外 +1）。面边界无立即回折 ⇒ 面长≥围长=12。Euler 预算：

n_b≤E/3, n_w≤(E+1)/2, n_f≤E/6+1 ⇒ n_b+n_w+n_f≤E+3/2<E+2，

与 Euler 矛盾。这个预算我核算得极细：黑 1/3、白 1/2、面 1/6，总计恰好 E、富余 3/2，而 Euler 要求富余 2，**任何面长 <12（比如 10 ⇒ n_f≤E/5+1）都会超支**。例外白点的 +1/2 与 +1 恰好吃掉 3/2 与 2 的差。这也解释了 summary §21 那次失败的投机：把围长提到 14 换双曲性（面≥14 ⇒ n_f≤E/7），预算方向富余了，但六步多边形需要 12 个独立空间而 n=10b 只够 10 个（"For k5 count 10. k=6 not covered by Vandermonde in n=10b"），一边富余一边短缺，两头堵死，放弃。

[推测]曾走过的替代路线：small cancellation，零和关系长度无界、无 C'(1/6) 结构，不可用；Haefliger 可展复形（link 围长 6/4/12），summary §12 记录被 "replaced this route with a proposed planar balanced-diagram argument" 换血；Wise 锐角多边形残余有限性要求 ≥4 边，三角构造不适用（§18–§20 反复核查）。

## 6. 定理 2.1：代数部分的输入输出契约

到这里我把所有几何装进一个纯代数判据：给定 (V,F)、每点 ℓ+1 条线、围长 ≥12、列 x_v 满足 0<m<t≤mκ 与两条配对恒等式，则存在有限表现群 G（含 ℓ 阶元）与 a_out,b_out∈K[G]，ab=1 而 ba≠1。四条假设四个用途，一一对位（论文原话："Incidence girth preserves the local subgroups, while Equation (2.2) produces a rectangular matrix identity. The upper bound t≤mκ permits character packing into square matrices; the strict inequality m<t then detects their reverse-product defect in an embedded subgroup algebra. An explicit finite group supplies matrix units."）。Lean 侧 `ChosenCriterion.products` 的显式假设列表 hInc/hg/hlt/hglobal/hlocal/hα 逐一对应，`hlt : card m < card V`、`hglobal : X*Xᵀ=-1`、`hlocal : ∀ f i j, ∑ v∈Inc f, X i v * X j v = 0`、`hα : ∀ v w, v≠w → slot v = slot w → α v ≠ α w`。判据层已无几何（"no further geometric assumption enters"），使 §4 的概率构造可以独立审计，这是我有意设计的模块边界。

## 7. 子群平均与矩形恒等式 UT=I_m

P_v=κ⁻¹Σ_{u∈K_v}u。幂等性：P_v²=κ⁻²Σ_{u,u'}uu'，对每个 w 方程 uu'=w 恰有 κ 组解（固定 u 得 u'=u⁻¹w，注意 K_v 是加法群写乘法记号），故 P_v²=κ⁻²·κ·Σw=P_v。划分恒等式 (3.3)：过 v 的 ℓ+1 条线的一维子空间像划分 K_v∖{1}：

Σ_{u∈K_v}u = 1 + Σ_{f∋v}(Σ_{u∈L_f}u − 1).

主计算逐列：UT = −κΣ_v x_vx_v^T·P_v² =(P_v²=P_v)= −κΣ_v W_vP_v = −Σ_v W_v Σ_{u∈K_v}u，代入 (3.3) 交换求和：

UT = −Σ_v W_v − Σ_f (Σ_{v∈f}W_v)(Σ_{u∈L_f}u − 1) = I_m，

末步用 (2.2)：两项分别为 I_m 与 0。**整条论证里"线项自动归零"按 f 分组的结构，靠的是 T_{v,-}=P_vx_v^T 只带左 P_v**，[推测]我曾试 T 取 P_vx_v^TP_v，右乘多余的 P 把混合项 W_vP_v(·)P_w' 引进来，线归零不再按 f 分组，一步毁掉吸收结构。

[推测]另一条死路：用 P_v 的谱分解（正则表示对角化）。特征 2 里 K[K_v] 其实半单（ℓ∤ℓ²，Maschke 成立），路没堵死，但要对 ℓ² 个加法特征求和、ζ 逐个出现，计算爆炸且 (3.3) 的"线项归零"结构被掩盖。(3.3) 的三元划分恒等式一次求和交换就完，我最终选它不因为优雅，因为短。

## 8. 特征扭转的扩张 L：z、e、Q_α 与打包的正交性预算

现在把 t 个中间坐标塞进 m 个槽。加中心 z（ℓ 阶循环），H=N×⟨z⟩；对每个 v 加稳定字母 τ_v，关系 τ_v(uz^r)τ_v⁻¹=φ_v(u)z^{r+α_v(φ_v(u))}。三个幂等元：e=ℓ⁻¹Σζ^{-r}z^r（ez=ζe、e²=e）、Q_α=κ⁻¹Σ_{u∈K_*}ζ^{α(u)}u（Q_αQ_β=δ_{αβ}Q_α）、扭转投影 τ_veP_vτ_v⁻¹=eQ_{α_v}。

逐项推导我要记下 Q_α 正交性的机制（有限域上的标准几何级数，特征 2 友好）：Q_αQ_β 中 w 的系数含 Σ_u ζ^{α(u)−β(u)}；α≠β 时取 u₀ 使 ζ^{α(u₀)−β(u₀)}≠1，平移 u↦u+u₀ 使内和乘以该标量而集合不变 ⇒ 内和=0。α=β 时内和=κ。**平移消去再次出场**，和第 2 节的线和引理同源，我全篇只保留这一种消去技术。

为什么需要 α_v 两两互异（同槽内）：[推测]若让 τ_v 直接共轭 K_v 进 K_* 不带 z-扭转，则所有 τ_veP_vτ_v⁻¹=eQ₀ 相同，同槽两个坐标的交叉项 eQ₀eQ₀=eQ₀≠0，J₀C=eP 失败。**槽-型对 (s(v),α_v) 的鸽笼预算 t≤mℓ² 恰好是为买到互异 α_v 而设**，这是我参数设计里最紧的一处：预算少一个，正交性崩；预算多要，几何层给不出。Lean 侧 `PrescribedSlots.slotAssignment : V ↪ m × (Fin 2 → ZMod ℓ)` 把槽与特征合成一个类型对、按全序取前 t 个对（`slotAssignment_first_pairs`：无一跳过）。

嵌入证书论文走轨道配对的置换表示（H 左作用于自身，把 ψ_v 定义域/像的轨道配对，F_v(ah_i)=ψ_v(a)k_i），关键依赖 "no defining relation couples two distinct stable letters"。Lean 走了另一条路：自制 `MultiHNN`（`conGen` 商 + 泛性质 `lift` + 字归纳），嵌入用 `finite_partial_realization`，对指标有限集归纳，每次借 Mathlib 单 HNN 的 Britton 式嵌入（注释 "Mathlib's complete Britton-lemma proof supplies the embedding at each step"），空集用 `ULift H` 垫基解决宇宙。[推测]论文路线对读者友好，Lean 路线对形式化友好；两条路数学等价。

## 9. 打包成方阵：J₀C=eP 与补身份 (1−e)I_m

C_{s,v}=τ_veP_v（s=s(v) 时）、(J_0)_{v,s}=eP_vτ_v⁻¹，则 J₀C=eP。逐项核验：(J₀C)_{vw} 非零仅当 s(v)=s(w)；对角 eP_v²=eP_v；同槽异 v 用扭转投影改写 eP_vτ_v⁻¹τ_weP_w=τ_v⁻¹eQ_{α_v}eQ_{α_w}τ_w=0（α_v≠α_w、e 中心）。然后 a_mat=UJ₀+(1−e)I_m、b_mat=CT+(1−e)I_m：

a_mat b_mat = U(J₀C)T + (1−e)I_m = U(eP)T + (1−e)I_m =(UP=U, PT=T)= eI_m + (1−e)I_m = I_m.

$(1-e)I_m$ 这个"补身份"项要专门说：[推测]我曾省掉它，得 a_mat b_mat=eI_m≠I_m，只在 e-块内单侧可逆，方阵层就失败了。补身份的作用是把 e-块的缺陷"填平"到全单位阵，而缺陷最终在反向乘积里重新露出。交叉项的相消机制：C、J₀ 的每个非零元都含中心因子 e，(1−e)·eX=eX−e²X=0。Lean 侧 `CharacterTwist.aMatrix/bMatrix` 与 `matrix_products`；幂等机制在 `CharacterIdempotents`（`pushed_idempotent`、`pushed_orthogonal`、`projector_one_coeff = |A|⁻¹`）。

## 10. 缺陷侦测：三明治、特化 ε 与秩论证

Δ=b_mat a_mat−I_m=CTUJ₀−eI_m（交叉项 (1−e)e(·)=0 消掉）。三明治：

J₀ΔC = (J₀C)TU(J₀C) − eJ₀C = (eP)TU(eP) − eP = e(PT)(UP) − eP = e(TU−P).

顺序要点是 (eP)TU(eP)=e(PT)(UP)=eTU，e 中心、吸收恒等式连用两次。

侦测靠标量特化 ε:K[H]→K，ε(nz^r)=ζ^r，把 e↦1、P_v↦κ⁻¹·κ=1。于是 ε(U_{−,v})=−κx_v、ε(T_{v,−})=x_v^T，而 −κ=1 in K 需要**两个独立原因**：κ 奇（κ mod 2=1）与特征 2（−1=1），参数组合的精确依赖在这里兑现。ε(e(TU−P))=X^TX−I_t。由 t>m 取 0≠y∈ker X：X^TX 的秩 ≤m<t ⇒ I_t−X^TX≠0，且 X(I_t−X^TX)=XX^TX−X=X−X=0（用 XX^T=I_m，即 (2.2) 全局恒等式在特征 2 下的改写），列在核里。显式见证：I_t−X^TX 的第一个非零列（prescription 第 4 步用有限域线性代数可执行）。

**ε 只用在 K[H] 上**，论文原话 "The homomorphism ε has been applied only to elements of K[H]; no extension of it to K[L] is used."。ε 与 τ_v 共轭不相容，扩展到 K[L] 根本不是同态。[推测]死路一：直接在 K[L] 中给 Δ 找非零系数，涉及稳定字母的字等价问题，"unproved word equalities"不可依赖，我的 certificates 设计原则是独立于字问题的判定程序；三明治+子群特化正是绕开它的装置。Lean 侧 `matrix_products` 里 b*a≠1 的证明链通过 `hξ1 : ξ ≠ 1`（特征单射性 `cyclicCharacter_injective`），并非任何群字计算。死路二：迹/行列式论证，特征 2 无序无正定，迹是卷积循环类信息（summary §6 verbatim："This yields Hattori trace over conjugacy class as expected. Want individual h not sum."）只能证"不全是零"，给不出可计算见证；秩+核向量给的是**显式元素**。死路三：把 ε 换成增广型映射 ε₀(nz^r)=r，ζ-相位消失，Q_α 结构在特化后退化，X^TX 的矩阵结构被抹平，缺陷可能被特化吞掉。summary §20 有一条值得记的等价洞察：配对恒等式排除完美匹配，"the uncovered vertices must supply a rank-m sum of rank-one matrices, requiring at least m uncovered vertices"，同一秩论证的匹配论版本，我在想清楚它之前一直在两种语言间摇摆。

## 11. 矩阵→标量：有限辅助群与矩阵单位

B=(Z/ℓ)^m，F=B⋊S_m，p_i=|B|⁻¹Σ_{w∈B}ζ^{−w_i}w，p_{ij}=σ_ip₁σ_j⁻¹，矩阵单位律 p_{ij}p_{kr}=δ_{jk}p_{ir}。G=L×F，f_blk=Σp_ii，Φ:Mat_m(K[L])→K[G]，Φ(Z)=ΣZ_{ij}p_{ij}，输出

a_out = 1−f_blk+Φ(a_mat),  b_out = 1−f_blk+Φ(b_mat).

a_out b_out = (1−f_blk)+Φ(I_m) = (1−f_blk)+f_blk = 1；b_out a_out −1 = Φ(Δ)≠0（Φ 单射，按 L-基分组+矩阵单位线性无关逐个清零）。

两个"只需 X 奇"的细节：p_i 的正交性只需 |B|=ℓ^m 奇（坐标特征 ζ^{−w_i} 的平移消去），**从不需要 |S_m|^{−1}**，S_m 只以共轭身份出场（σ_i 交换坐标），它的偶阶完全无害。这是[推测]我曾经卡过的地方：最初想用"含 m 阶元的大群取群平均"造幂等，|S_m| 的偶因子在特征 2 里不可逆，平均幂等无法定义；换成 B 的**坐标特征**才通。p_ip_jp_kr=0 的机制：j≠k 时 σ_j⁻¹σ_k≠1 共轭把 p₁ 移到 p_{j⁻¹k}≠p₁，与 p₁ 正交。Lean 侧 `FiniteBlock.Auxiliary m C = SemidirectProduct (m → C) (Equiv.Perm m) permAction`、`p ξ i = pushed SemidirectProduct.inl (coordinate ξ i)`、`output a = 1 − block f q 1 + block f q X` 与式 (3.25) 逐项对应，两个非退化条件 `(card (m → C):K)≠0` 与 `ξ≠1` 就是"奇"与"ζ 非平凡"。

这一步的思想源头是 Dykema–Juschenko 的有限因子归约（summary §2 的工具箱遗产），但论文最后强调："the last step does not infer stable finiteness from direct finiteness for an arbitrary ring: it uses the explicit finite group F and the injective map Φ"，我不做抽象推理，只做这个显式实例。

## 12. 有限表现与奇挠率的保留

N 的有限表现靠**长度 ≤3 的局部零和关系子列表**：在一个 K_v 内部任何有符号字可逐步用 ≤3 关系折叠成其和的生成元（局部折叠），故子列表与无限关系系统表现同一个群（Lean `N_shortEquiv : PresentedGroup shortRelators ≃* Base`）。H 加 z、z^ℓ、[z,s]；L 加 |V| 个稳定字母与 ≤|V|ℓ³ 个关系；F 有限给乘法表；G=L×F 加交换子。嵌入链 K_v≤N≤H≤L≤G 里 K_v≅(F_ℓ²,+) 的非恒等元全是 ℓ 阶 ⇒ G 含奇素数阶元（Lean `OddTorsion`）。[推测]若指望"有限生成⇒有限表现"就错了，局部折叠归约才是有限化的承重结构，Lean 的 `ShortRelators` 正是形式化它。

## 13. 几何层总装（定理 4.1）：从 Linnik 到 trade 的八个小战役

这是 §4 的概率几何，也是我算得最苦的一章。参数：q=2^h，ℓ=最小素数 ≡−1 mod q^100（Linnik），D=ℓ+1，s=⌊log_q D⌋，b=s+20，n=10b，N_pt=qⁿ。

**方向空间（引理 4.2）**。D/q 个 bundle、每 bundle q 个指标；取 b 次扩张 Q'/Q 把 A 等同 (Q')^{10}；参数向量 (1,ξ,…,ξ⁹) 的任意 ≤10 个线性无关（前 k 坐标 Vandermonde）。每个 W_r（2 维）、E_j（b−1 维）各占一个参数；参数够用因 D+D/q<q^{s+2}≤q^b。U_j=d_j⊕E_j（b 维）的交点性质：U_j∩U_{j'}=0、U_j∩e_r=0、U_j∩W_r=d_j（r=ρ(j)）否则 0。**"至多十个成员直和"是 n=10b 的直接来源**，每步至多牵涉两个 W/E-空间、至多五步多边形，2×5=10。

**相容孔洞（引理 4.3）**。随机以 θ=5M/|S| 选点（M=N_pt/D²）；Chebyshev 得 4M≤|X|≤6M w.h.p.；occupancy：Pr[∃(j,r,C):|X∩(C+W_r)|>100]≤D²N_pt(θq^{b+2})^{100}=O(q^{2402−88s})=o(1)，**s≥100 就是让这个指数负掉的**；标记碰撞对与例外矩形四见证组，E Z/M=O(q/D+q⁸/D⁴)=o(1)，Markov 删去。剩 3M≤|O|≤6M，三条性质（每 W_r-平移至多一孔；每平移 ≤100 孔；无四见证矩形）各喂后面的引理。

**替换线（4.4）与多边形分类（4.5）**。替换线=各 o+W_r 内方向 e_r 的线除去 o+e_r 本身；四替换线矩形⟹四个互异孔见证⟹与孔条件 (iii) 矛盾。候选序列：k∈{3,4,5} 步闭标记序列，步型 G_j（generic，E-分量非零）与 R_r（exceptional，端点在 T_r 中）；闭性对每个 generic 标签强制 E_j-分量和为零⇒每标签至少两次；循环不相邻⇒至多两次⇒g∈{1,2}。三类：G,R 交替矩形、G,G' 交替矩形、五边形（两个 G_j、两个 G_j'、一个 R_r，ρ(j)=ρ(j')=r，exceptional 的 e_r-分量只能被同 bundle 的两个 d_j 的 W-分量消去）。坏事件概率 p_*^{2g}，p_*=(q²−1)/(q^{b−1}−1)≤2q^{3−b}；独立性来自两次出现之间隔一个不在 U_j 中的步向量⇒不同随机变量。

**事件界（4.6）**：μ≤O(q^{−s−17}+q^{−7}+q^{−s−33}+q^{−2s−31}+q^{−s−6})=O(q^{−7})，各项分别吃 b=s+20、p_*≤2q^{3−b}、D<q^{s+1}；混合矩形项 100²Dp_*²∼q^{s+1}q^{6−2b} 化简为 q^{−s−6}=q^{−106}，**这里用到"每平移 ≤100 孔"的条件 (ii)**，100 这个 occupancy 上限以 100² 因子进入 μ。

**局部引理（4.7）**：非对称 LLL，每事件 ≤4 变量、每变量事件概率和 ≤1/16，x_A=2Pr(A)≤1/8，邻居和 ≤1/2。

**slab 内线划分（4.8），punctured-plane tiling 的家**。无孔 slab 任意划；有孔 o：取 0≠δ∈d 与 P 上无 Q-特征向量的算子 J（P 等同二次扩张的向量空间，J=乘 η∉Q；若 ηx=λx 则 η=λ 矛盾），o+d 之外用 {o+x+γ(Jx)δ: x∈P, γ(x)=1}（0≠γ∈Hom_Q(P,Q)）共 q²−1 条线划分 q³−q 个点。机制：**无特征向量保证提升线的方向投影互不相同**，这正是 summary §11 那个"救活"的观察：线性映射无 Q-特征向量时提升线划分 fiber。三角形与 LLL 参数冲突的死锁（verbatim："Need b<a−1 for rare. Generic LLL wanted b>a+4. **Conflict!**"）就是被 3 维 slab+随机 P_{j,C} 解开的。

**trade（4.9）与围长**。对每个孔 o、bundle r：删去 q 条 o+d_j（ρ(j)=r），插入 q−1 条替换线。逐点净变化我核算过：o+W_r 内删除扇形用过除 e_r 外所有方向；非 o+e_r 的点恰失一得一次（净 0）；孔失 q 得 0；o+e_r 其他点不动。无双重删除（同 partition 中两孔同 slab 已排除）；不同 partition 方向落在零交的 U_j ⇒ 无重复线。初始每点在 D 个 partition 各 1 次⇒**度 D 保持**。这是对"直接删过孔的线"这个天真方案的修复，天真方案让其他点度数下降，正则度 D（=特征 2 消失因子）丢失，配对与正则性不再兼容。围长收尾：短圈⇒k≤5 步多边形；全 R 步情形靠闭性+循环不相邻+W_r 独立性强制"每标签恰两次"才能归结为矩形（标签出现奇数次则闭性给出 e_r 方向的非平凡和=0，与"至多五个 W_r 独立"矛盾，这是围长证明自己的机制，孔条件 (iii) 只管矩形）；含 G 步⇒坏事件发生，矛盾。

## 14. Prescription：把存在性变成可终止的搜索

定理 5.1：对每个 h≥2 依次执行，(1) q=2^h、ℓ=最小素数≡−1 mod q^100（Linnik 保终止）；(2) K=F_2[Z]/(g)，g 字典序最小的 h(ℓ−1) 次首一不可约多项式；(3) Q={x∈K:x^q=x}、ζ=K 中第一个 ℓ 阶元（Fermat：ℓ|2^{ℓ−1}−1 ⇒ ℓ||K×|，循环群）；(4) 按尺寸/线含于 V/正则度/围长逐对测试 (O,F)，全败则 h+1。定理 4.1 保证所有充分大 h 成功**且对枚举一致**，外层搜索终止。关键自白："The search enumerates the required incidence data directly, not the auxiliary random choices used to prove their existence. The auxiliary extension field in that proof is only a model for a Q-vector space; it is not required to embed in K."，存在性证明里的随机选择与扩张域都不进搜索。[推测]我曾想搜索"随机构造的辅助数据"，立刻意识到终止性只能来自概率分支、不可判定；把存在性证明与被枚举对象分离是唯一的活路。

## 15. 细胞自动机迁移与推论

(T_cx)(g)=Σ_{u∈G}c_u x(gu)。引理 6.1：c↦T_c 忠实（(T_cδ_h)(1_G)=c_h）且 T_a∘T_b=T_{ab}，展开 (T_a(T_bx))(g)=Σ_w(Σ_{uv=w}a_ub_v)x(gw)。命题 6.2：ab=1 ⇒ T_a∘T_b=id ⇒ τ=T_b 单射；且 im(τ)={y:T_{ba}y=y}（⊃：y=T_b(T_ay)）；若 (ba−1)_h≠0 则 (T_{ba}δ_h−δ_h)(1_G)=(ba−1)_h≠0 ⇒ δ_h∉im τ ⇒ 不满。像由一致有限局部方程刻画。summary §23 的自检原话："Correct order? T_c(x)(g)=Σc_mx(gm). T_a(T_b(x))(g)=Σa_hb_kx(ghk). T_bT_a=T_{ba}. So yes."；范围自省："Our use is not identifying equivalence; direct finite failure gives one counterexample, no reverse."[推测]曾考虑把见证群嵌入 Sym(N) 等熟悉群，放弃，嵌入不保持"同一局部规则"的形式。特征 2 只用于造见证；命题本身对任意域成立。

## 16. summary 时间线：十条死路的完整清单（它们各自的墓志铭）

1. **Witt 向量提升**（§1），给不出零迹幂等的强制消失；positivity/continuation 双缺。
2. **熵方法**（§1），非顺畅群阻碍 naive entropy；§5 补刀："equality of entropy densities for pure finite-depth states is false."
3. **Pivot 密度维度守恒**（§1），需要对可能的相变做无穷体积微分，"did not establish this step"。
4. **斜群环扩系数**（§2），归于 unresolved rank condition；(1−g)ε=0⇒(1−g)⁻¹ε=0 只挡单元素压缩。
5. **谱放大**（§2），Thom/Lück 行列式条件化于群假设，任意群无下界。
6. **特征 2 符号提升**（§6），"odd spherical diagrams can collapse the required central involution"；§14/§21 把失败转成武器：D=0 不可提升。
7. **信息论**（§7–8），I–MMSE "would be a full proof if derivative identity works"（不成立，无穷远漏信息）；Brownian bridge "This is huge." 但无唯一性定理；"Poincaré alone no compact embedding (infinitely many shifts e_i)"。
8. **固定支撑系数环**（§9），缺陷是有限素数上的 vertical component，"Excluding that component remained the missing step"，注意：反例最终就**活在**那个分量上，prescription 的有限域是对它的显式取样。
9. **迹/telescoping**（§10），循环性强制 (τ−τ̃)(1)=0；"compactness retained trace-bearing tails instead of producing the required cancellation"。
10. **矩阵+高围长超图**（§11），"polynomial evaluation examples defeated a proposed minimum-support rank inequality"；LLL 参数冲突 "Conflict!"；3 维 slab 解锁。

以及两次重要的"回头路"：coset 语言（§3，"Cosets give much more flexibility! Any hyperedge set affine copies..."）最终以子群平均+划分恒等式的形态存活；Euler 特征（§4 第一次以武器身份出现，"maybe use Euler characteristic"）成熟为引理 2.2。summary §11 一段话就是最终证明的骨架预告："attaching additive groups ℓ² to vertices, identifying one-dimensional subgroups along hyperedges ... Subgroup averages ... character twists in HNN extensions and a finite-group matrix corner for the scalar passage. Linnik's theorem remained a possible dependency."

## 17. Lean 取证：Mersenne 翻案与置换化 Euler

**Lucas–Lehmer/Mersenne 路线**。`PrimeCertificate.lean` 全文 11 行：`mersenne_21701_prime : (mersenne 21701).Prime := by apply lucas_lehmer_sufficiency; norm_num; norm_num`，对 21701 位模数做 21699 次模平方，全库最重的具体计算之一。消费端：`2·(2^217)^100−1 = mersenne 21701`（`21701=217*100+1` 由 `decide`），于是 q^100 | (2q^100−1)+1 是平凡整除。**这是倒装设计**：论文/summary 里 Linnik 从 q 出发找 ℓ（存在性、常数不可显），Lean 从已知 Mersenne 素数 2^21701−1（第 24 个）反推 q=2^217。红利是精确参数链：`sourceD_log : Nat.log sourceQ sourceD = 100` ⇒ b=120 ⇒ n=1200（`dimension_217 = 1200`），`Fin 119 → Q`、`4*1200=4800`、`13*1200 ≤ 217*72` 全部 `decide`，**Linnik 的未知常数 c,L 让下游只能"有界"，Mersenne 让下游全部数值化**。注意与 summary §13 的张力："explicit Mersenne primes ran into divisibility or interpolation-size obstacles, so it retained the theorem as a dependency"，当时失败的原因应是没有找到 q^100|p+1 形状的已知 Mersenne 素数（符号是 −1 剩余类、整除 p+1 ，并非 p−1）；21701=217·100+1 恰好命中。`sourcePrime = Nat.find` 仍取最小候选，Mersenne 只认证上界。另有两个数值引理：`sourceQ_density : 4800^1200 ≤ sourceQ^72`（密度界的 Lean 化身，13·1200=15600≤15624=217·72）。

**Ribbon：平面图的置换代数化**。没有拓扑、没有"画在球面上"的语义：`Ribbon α := {black, white : Perm α}`，面=white∘black 的轮换，**Euler 公式=三个置换的轮换数之和=边数+2**。局部手术也是置换级：`mergeWhite R e` 把白顶点沿相邻黑边合并（`white := swap e (R.face e) * R.white`，注释 "The newly created digon is a one-cycle of the face permutation"）。`PlanarBalance.Balanced` 把平衡图对象化（五个字段含 `exceptional_sum ≠ 0`），度数下界按假设拆分（`hinj` 杀度 1、`hind`=`directionMap_independent` 杀度 2），`not_spherical` 合并三项调 `euler_contradiction`。入口 `GroupEmbedding.theta_injective`：字等式→`Planar.OpenDiagram`→Balanced/Ribbon→置换版 Euler。[推测]这个代数化的动因是 Mathlib 没有平面组合映射的 Euler 理论，被迫发明的同时，"极小化在抽象类上进行"（summary §13 的澄清）获得了精确的数学表达：Balanced 结构体就是那个抽象类。

**MultiHNN 与 PrescribedPresentation**。见第 8、12 节。主定理的强度差异要如实记录：JSON challenge 只认证 `main_theorem`（**有限生成**版，`MainClaim`），论文的"有限表现"放在 `PrescribedPresentation.prescribed_finitelyPresented` 单独证明、不受比较器检查。`PrescribedOutputs.G` 是显式缩写，a,b 由 zeta、X、槽分配等指定数据构造，"The two product assertions are for the specified first successful data and specified sums, not merely for some field, some group or some pair"。`PrescribedSearch.succeeds217` 把存在定理绑定到 h=217，注释强调 "The exact least successful outer input, not the convenient existence bound 217"。

## 18. 常数表（参数链）

h=217 ⇒ q=2^217 ⇒ ℓ=2^21701−1 ⇒ D=2^21701、s=100 ⇒ b=120 ⇒ n=1200 ⇒ N_pt=2^260400 ⇒ m≈3N_pt/D²、t=N_pt−m ⇒ K=F_{2^{217(ℓ−1)}}∋ζ ⇒ G=L×F 与 a_out,b_out。各常数的角色：217（Mersenne 反推）；100（s=⌊log_qD⌋，控孔估计指数 2402−88s<0）；20（b=s+20 的事件权重松弛）；10（=每步 2 空间×5 步多边形，Vandermonde 十一直性预算）；(q−2)/2（插值次数，2d₀=q−2 线和归零阈值）；72（密度指数，3ⁿn!≤(2^13)ⁿ≤q^72）；κ=ℓ²（奇⇒可逆且 mod 2 =1，ε(U)=X 的双重机制）；100（occupancy 上限，以 100² 进 μ）；1/16、1/8、1/2（LLL 阈值）。

## 19. 复盘：三次"身份"的转变

回头看，这个证明经历了三次身份转变。第一，**从正结果到反例**：不是策略性撤退，是发现特征 2 里"D·(−I_m)=0 与 −I_m≠0 兼容"这个自洽的代数世界，正性在那里根本不是公理。第二，**从解析到组合**：信息论、熵、谱放大的整条解析战线（§7–§10）全部阵亡，最后的武器全是有限域初等数学，Newton 插值、平移消去、Chebyshev、LLL、Euler 公式；"信息不能凭空压缩"的直觉最终以 rank(X^TX)≤m<t 的秩论证复活。第三，**从存在性到 prescription**：证明不再是"存在一个反例"，是一个可终止的搜索程序+对枚举一致的数值参数（h=217 全靠 Mersenne 翻案）。三次转变的共同驱动力是一件事：每一次我发现"我需要的东西恰好是某个结构不被允许的性质"时（D 不可逆、ℓ 偶不可、S_m 不可平均、字问题不可判定），正确的动作不是绕开它，是把它变成机制。Lean 的一行 `norm_num` 顶掉 Linnik 定理，是这个哲学最极端的注脚。
