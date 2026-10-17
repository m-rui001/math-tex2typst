# D14 · CH 阻碍：范畴性阈值不能被规定

> 论文：OAI:A-CH-Obstruction-to-a-Prescribed-Categoricity-Threshold-September-24-2026
> 主定理（CH 下）：存在抽象初等类（AEC）K，LS(K)=ℵ₀，在 beth_{ω₂}=H(K) 处至少两个互不同构的模型，在 Λ=beth_{(2^{ℵ₁})⁺} 以上处处范畴，于是从 Λ⁺ 向下转移到 H(K) 的"被规定阈值"形式失败；若 ZFC 一致，被规定形式的 Shelah 范畴性猜想不是 ZFC 定理。
> 笔记性质：第一人称反推。不确定处标 [推测]。
> 取证材料：论文 TeX（paper.tex + sections/00–06）+ Lean 形式化（lean/OAI/ModelTheory/Categoricity/，15 模块约 4900 行）+ CHObstruction.json。

## 0. 写在前面

这篇证明的强制路径（从结论逆推）是：要让"被规定阈值转移"失败，必须在 H(K) 处**有两个模型**、在某个 >H(K) 处**恰有一个**，纯"处处不范畴"的粗糙反例不够，必须是"上范畴、下不范畴"的**错位**反例。上范畴的来源：把不可数基座全部排除（|I|<Λ），剩余结构由"可数基座 + 等大指标 ⟹ 同构"吸收；下不范畴的来源：一个基座不可数的大模型，其颜色编码"真类级的秩信息"且在每个坐标只局部有效。两者相容需要：不可数基座模型的大小被截断，而可数基座模型可以在任意大小存在。全部塞进一个 AEC 的胶水是对象条件"逐元组可数例外"+ 强包含"新点无例外"。CH 的角色只有一个：把 H(K) 精确钉在 beth_{ω₂}，使"范畴尾部 Λ>beth_{ω₂}"与"双模型点=被规定阈值"同时成立。

Lean 的 4900 行把 §1–§5 全部数学内容机器验证了（AEC 九公理、端点双模型、尾部范畴、no-pattern 的矛盾终点 `succ V.card ≤ V.card`），但类被收窄为"自由实现"，这个收窄的含义和它在逻辑上的安全边界，第七节细说。

本笔注叙事对应的论文目录为 preprints/A-CH-Obstruction-to-a-Prescribed-Categoricity-Threshold-September-24-2026，在 .tools/lean_queue.txt 队列第 2 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 一、开局：两种形式与"错位"的设计目标

### 1.1 靶子：被规定阈值的转移

Shelah 范畴性猜想有两种形式。定性形式：存在只依赖 κ 的函数 χ(κ)，使 LS(K)≤κ 时"某个 λ≥χ(κ) 处范畴 ⟹ 所有 μ≥χ(κ) 处范畴"，阈值由定理给出。被规定形式：阈值**固定**为 Hanf 函数

$$h(\kappa)=\beth_{(2^\kappa)^+},\qquad H(K)=h(\operatorname{LS}(K)),$$

即（eq:target）：

> 若 K 在某个 λ≥H(K) 处范畴，则 K 在每个 μ≥H(K) 处范畴。

不假设 amalgamation、joint embedding、tameness、无极大模型，两端（H(K) 本身与任意大的 μ）都在断言内。这两种形式的区分与"被规定界可能失败"的可能性在 Grossberg 2021 讲义的 Conjectures 4.4–4.6 中已显式分开；我的靶子就是被规定形式。

[推测] 为什么以前没人做这个反例：非退化情形（带 amalgamation + tameness）的转移定理（如 Vasey 2017 Corollary 9.10）非常成功，社区直觉是"Hanf 界是安全的"；而 Espíndola 2023 的 Theorem 4.1 更是声称对**任意** AEC 在被规定界处有转移，大家默认这条线是通的。要看到缝隙，必须先注意"存在性 Hanf 界"（该基数处**有**模型、可扩张到任意大）与"唯一性"之间的空隙：Shelah 的存在性 Hanf 定理（presentation + Ehrenfeucht–Mostowski 方法）从没承诺过唯一性，更没承诺"给定模型 M 可以扩张到任意大"。

### 1.2 错位的数值

CH 下的数值巧合是全文的枢纽：

$$H(K)=\beth_{(2^{\aleph_0})^+}\overset{\text{CH}}{=}\beth_{\omega_2}=\beth_\eta\qquad(\eta=\omega_2),$$

而构造的类在 beth_{ω₂} 处有两个模型、在 Λ=beth_{(2^{ℵ₁})⁺} 以上处处范畴。Cantor 给 ξ=2^δ≥δ⁺=η，故 ξ⁺>η，beth 严格递增给 Λ>H(K)。取 λ=Λ⁺：前提"在 λ≥H(K) 处范畴"成立（λ≥Λ），结论"在 H(K) 处范畴"失败。

CH 的两个精确用点（都在卡片算术层，不在构造的组合层）：
1. 编码引理里 δ^{ℵ₀}=(2^{ℵ₀})^{ℵ₀} 的化简需要 δ=2^{ℵ₀}，同时 |S|=2^{ℵ₀} 需要与 δ=ω₁ 等同。注意 |S|=2^{ℵ₀} 本身**不需要** CH，需要的是那个等同。
2. H(K)=beth_{ω₂} 与 Λ=beth_{ξ⁺} 的相对位置（ξ≥η 由 Cantor），"范畴尾部"严格在"双模型点"之上。

[推测] 这是机器可查的：Lean 里 grep `hCH` 的实际使用点只有三处（diagram_bound、code 的传递、endpoint_eq_hanf）；`Colors.cardinal`（|S|=𝔠）确实不用 CH。所以在 ¬CH 下构造本身大概率照旧成立，坏的只是"H(K) 处双模型"的数值命中，H(K) 右移出 beth_{ω₂}，两个主角色不再错位。

### 1.3 主定理的精确形态与逻辑结论

```latex
\begin{theorem}
Assume the continuum hypothesis. There is an abstract elementary class
\(K\) in a countable finitary relational language such that
 (i) \(\LS(K)=\aleph_0\);
 (ii) \(K\) has at least two nonisomorphic models of cardinality
      \(\beth_{\omega_2}=H(K)\);
 (iii) putting \(\Lambda=\beth_{(2^{\aleph_1})^+}\), the class \(K\) is
      categorical in every cardinal \(\mu\ge\Lambda\).
In particular, \(\lambda=\Lambda^+>H(K)\) is a categoricity cardinal
from which downward transfer to \(H(K)\) fails.
\end{theorem}
```

三个结论各有分工：(i) 使 H(K) 是被规定阈值的本尊（LS 更大则阈值右移、失去针对性）；(ii) 是被规定阈值处范畴性的**否定**；(iii) 保证与定性 eventual categoricity 不冲突，这是精巧之处：错位，不是全面战争。

逻辑结论的表述极其克制：定义一阶集合论句子 Θ（存在一组编码映射 p，使固定公式定义的 K_p 满足 AEC 公理、LS=ℵ₀、在 h(ℵ₀) 处两个模型、在 Λ⁺ 处范畴），则 ZFC ⊢ CH⇒Θ；对 (eq:target) 的任一一阶形式化 Φ，ZFC ⊢ Θ⇒¬Φ；于是

$$\operatorname{Con}(\mathrm{ZFC})\Rightarrow\operatorname{Con}(\mathrm{ZFC}+\Theta)\Rightarrow\operatorname{Con}(\mathrm{ZFC}+\neg\Phi).$$

即：若 ZFC 一致，Φ 不是 ZFC 定理。**单侧不可证性，不是双侧独立性**，论文明说 neither an unconditional ZFC proof of ¬Φ nor consistency of Φ is asserted。为什么要绕 Θ？因为 (eq:target) 量化真类，是图式/二阶味的陈述；Θ 的参数化（"存在 p"）把"类的定义"降为集合参数，才有一阶语句可谈。

### 1.4 先例与两块主料

主料：**指标排序 I**（控制模型大小）+ **基座排序 B**（无端点稠密线序、所有有界区间可数，故 |B|≤ℵ₁）。对每个非空有限有序互异元组 t⊆I：行纤维 Z_{t,n} 是 [B]^{<ω}（对称差群）的 torsor，列纤维 W_{t,b} 是 [ω]^{<ω} 的 torsor，**语言不命名原点**。选定代表元后比特关系显示为 ω×B 的 0-1 矩阵；换行原点 = 每行改有限多格，换列原点 = 每列改有限多格。

先例谱系：有限支撑群、无命名原点的 torsor、奇偶关系，Hart–Shelah 例子的三件套；颜色取 2^ω/=^* 同样是 Hart–Shelah 的做法。我的推进：**行、列两方向的有限平移 + 局部可数基座耦合**，幸存颜色编码端点阻碍所需的扩展秩图。允许的有限颜色图与秩也出现在 Kolesnikov–Lambie–Hanson 的着色类，但那里图是可数的、且这里的 full-subsequence 检验恰好给出极限所需的相容性。

## 二、颜色层：图、编码与全子序列检验（§1）

### 2.1 图与有效性

arity-k 标签集 ℒ_k = {(J,i): ∅≠J⊆[k], i<ω}（可数）。arity-k 图 𝒟=(E,R,ρ)：E,R 是 ℒ_k 上二元关系、ρ:ℒ_k→δ=ω₁。**有效**三条款：

- (i) E 是等价关系；R 与 ρ respect E；
- (ii) 商 Q_𝒟 上的 R **严格降秩**（yRx ⟹ ρ(y)<ρ(x)）且**外延**（不同元素的前驱集不同）；
- (iii) 单点标签 ({j},0) 落在两两不同的 E-类。

机械理由：(ii) 的降秩使图成为良基带秩结构（Mostowski 塌缩的直接输入），外延性保证塌缩**单射**；(iii) 保证单点标签在极限构造里给 |X| 个互异元素，no-pattern 矛盾的计数来源。有效图**允许包含非法编码**（𝔇_k 含全部图，含无效的），这一点专门为端点构造服务：例外坐标 β∈F_X 处 𝒟_{t,β} 可能无效但仍需编码成颜色。

### 2.2 编码引理与 CH 的第一用点

$$\iota_k:\mathfrak D_k\longrightarrow S\qquad(k\ge1)\quad\text{单射、值域两两不交},\qquad S=2^\omega/={}^*.$$

逐步：每个 =*-类可数（有限多格改动）⟹ 2^{ℵ₀}≤κ·ℵ₀（κ=|S|）；商不可数（否则 2^ω 可数），无穷基数乘法给 |S|=2^{ℵ₀}，**这步没用 CH**。对每个 k：E,R 至多 2^{ℵ₀} 种；由 CH，δ^{ℵ₀}=(2^{ℵ₀})^{ℵ₀}=2^{ℵ₀}，故 ρ 也至多连续统多种（**CH 的用点**：δ=ω₁=2^{ℵ₀} 才能化简）。于是 |∐_k𝔇_k|≤ℵ₀·2^{ℵ₀}=|S|，按 k 分段嵌入 S 得两两不交值域。

编码映射是**集合参数**："The coding maps are fixed set parameters in the definition of the class, not symbols of its language"，语言保持可数的关键伎俩。Lean 的做法更强也更省：`code : (Σ n, Diagram (Fin (n+1))) ↪ Palette` 单一嵌入，arity 在 Σ-型里，不需要值域不交（检验直接以 `code ⟨m, d.restrict e⟩ = s m e` 表述）。

### 2.3 限制与全子序列检验

对 ∅≠J⊆[k]，ℓ_J 把 arity-|J| 标签嵌入 arity-k 标签（位置集提升 + 同坐标）；𝒟↾J = 沿 ℓ_J 拉回。合成律 (𝒟↾J)↾U=𝒟↾{j_u:u∈U}。**全子序列检验** T_k((s_J)_{∅≠J⊆[k]})：

- (i) 每个 s_J 在 ι_{|J|} 下解码为**有效**图 𝒟_J；
- (ii) 每个 J：𝒟_J = 𝒟_{[k]}↾J。

三个批注。第一，被着色的是**有序元组**，基座集上不需要线序（"It requires no order on the set from which tuple entries are chosen"），这在 cat:bounded 里要紧：那里给 I 临时配良序（只为证明用），j 元子集按递增枚举变成有序元组去着色。第二，合成律保证"与全图一致"自动蕴含嵌套子序列相互一致，检验只需锚定全图。第三，论文明言"Validity of a diagram does not by itself guarantee extensionality of a restriction"，限制会丢掉区分两元素的前驱，可能失去外延性，所以 (i) 要求每个 J 的图**各自**有效。

### 2.4 商图引理与 §1 结尾的预告

检验通过时，ℓ_J 诱导单射 Q_{𝒟_J}→Q_{𝒟_{[k]}}，保 tag、保且反射 R、嵌套子序列的商映射合成。这是 no-pattern 极限构造的"相容性工具箱"：没有"反射 R"，极限关系不良定义；没有合成律，∼ 的传递性断掉。

§1 结尾的预告就是本反例的几何："The tests permit the tuple-dependent diagrams constructed in Section 4. They do not permit one fixed color s_j for each arity j such that T_k((s_{|J|})) holds for every k≥1."，**局部（元组级）可任意，全局（arity 级）必矛盾**。

## 三、AEC 机器：基本结构与强包含（§2）

### 3.1 基本结构

四条数据：(a) 非空 I；非空无端点稠密线序 B、所有有界区间可数。(b) 群 sort G(B) ≅ [B]^{<ω}（对称差群）；群 sort G_* ≅ [ω]^{<ω}（每个有限子集 v 一个专属一元单点标签）。(c) 行纤维 Z_{t,n}（G(B)-自由传递作用）、列纤维 W_{t,b}（G_*-自由传递作用）。(d) 比特关系满足**平移律**：

$$e(z+u,w+v)=e(z,w)+\mathbf 1_{b\in\mathrm{supp}(u)}+\mathbf 1_{n\in v}\pmod 2.$$

**"There are no additional relations or distinguished representatives"，没有命名原点是全部戏法所在**：若语言命名了每条纤维的原点，行/列平移都是语言可定义的，颜色就变成结构不变量，"mod 例外集"的全部灵活性消失。语言用运算图，并非函数符号是无害的（诱导子结构里语义全性 + 唯一性迫使图给出同一个值，关系化语言下子结构封闭性的经典小陷阱）；不同元组纤维之间比特强制为零。

### 3.2 基本包含的三个条款

M₀≼_b M₁：(i) G_*^M₀=G_*^M₁（列平移群跨结构固定 ⟹ 列平移不变量跨结构可比）；(ii) B^M₀ 凸（有界区间可数在有向并下存活的必要条件）；(iii) 老群元素的支撑不因换结构而增长（否则比特律的 1_{b∈supp(u)} 在新 b 处"变节"）。可合成。

### 3.3 颜色与代表无关性（Lemma aec:representatives）

行选择系统 𝐳=(z_{t,n})；颜色 c_t^𝐳(b)=[(e(z_{t,n},w))_{n<ω}]_{=*}∈S。三条：

1. 颜色与列代表无关（列平移 v∈G_* 只在 v 的有限指标上变比特 ⟹ 同 =*-类）。
2. 两个行系统：固定 t，颜色在 B 的**可数**子集外一致，例外集 D_t=⋃_n supp(u_{t,n})（行平移支撑的并，行支撑有限 ⟹ 可数），检验只涉 2^k−1 个子序列、并仍可数。
3. **强断言**：M₀≼_b M₁ 时，b∈B^{M₁}∖B^{M₀} 处用 M₀ 的行代表在 M₁ 中算颜色，**与行选择完全无关，无例外坐标**。因为老代表间的平移子支撑仍在 B^{M₀} 内（条款 (iii)），b∉B^{M₀} 时比特律的第三项为 0，逐位不变。

**强断言是"对象条件良定义"的全部根据**：坏集 E_t(𝐳) 的"对某行系统可数 ⟺ 对所有系统可数"；也是强包含检验只用 M₀ 行代表即可的原因（新列处的颜色是**绝对**的）。引言机制 1 原话："Finite row supports make these outside tests exactly independent of old choices of origins."

[推测] 若把行支撑放宽为可数支撑，D_t 膨胀到 ≤ℵ₁ 例外，对象条件失效为空类；若列群换成 [B]^{<ω}，列平移在不可数多 b 上变比特，S 的可数类编码机制崩溃。行有限、列可数是整个设计的骨架。

### 3.4 对象与强包含

**对象**：E_t(𝐳)={b∈B: ¬T_k((c_{t↾J}^𝐳(b))_J)} 对每个 t 可数。例外集**允许依赖 t**（"no single countable set is required to work for all tuples"），这是与 cat:bounded 的关键接口：那里恰好只用可数多个 witness 元组，并才可数。**强包含** M₀≤_K M₁：≼_b + 对每个老 t、每个新 b∈B^{M₁}∖B^{M₀}，用 M₀ 行代表算的颜色组通过全检验。新基座点**无例外**，"对象允许坏、扩张不允许新坏"的不对称，AEC 公理全靠它。

### 3.5 自由实现（万能构造器）

给定任意颜色族 (a_{t,b})，行点 (t,n,u)、列点 (t,b,v)、比特 e((t,n,u),(t,b,v))=a_{t,b}(n)+1_{b∈u}+1_{n∈v} (mod 2) 的基本结构实现 c_t(b)=[a_{t,b}]；B 可数时自动是对象。它的存在把"造模型"化归为"造颜色族"，全部难度集中到颜色层。Lean 里这一条**不需要独立引理**，Data 类型本身就是自由实现（给 I、B、bits 就是结构），论文引理化入了类型定义。

### 3.6 偏序、相干、有向并（Lemma aec:order-coherence, aec:directed）

同构不变、偏序、相干都是"老代表合法性"的交接舞蹈：传递性里 M₀≤_K M₁ 与 M₁≤_K M₂ 的检验条款各自覆盖一半新点，靠"老代表在更大结构中仍是老代表"衔接，没有 3.3 的强断言，两半不能无缝拼接。

有向并（全文最长的单条引理，十个段）：良定义性（有限参数塞进公共成员）、支撑双射、序性质（凸性 + 有界区间可数在并中存活）、对象条件（先落成员、在成员内选行代表、对全局系统用 3.3 的可数换算）、光滑性（到公共上界 N 的强包含）。论文明言对**任意非空集合指标的有向族**直接证，比逐条链公理强，这是防"可数余链情形 smoothness 翻车"的加固。方法论警告（第 8 步的来历）："先把有限元组放进一个成员、再在该成员内选全部行代表"顺序不能反，否则 t-依赖选择与全局系统之间出现不可数差。

### 3.7 凸包与向下 LS（Lemma aec:ls）

κ 无穷、D⊆B、|D|≤κ ⟹ 存在凸稠密无端点 B₀⊇D、|B₀|≤κ（逐轮加点 + 区间并记账）。向下 LS：对 A⊆|M|、κ=|A|+ℵ₀，收集四类基座点 D：(i) A 的基座投影；(ii) A∩G(B) 的支撑；(iii) **A 中每个行点的支撑坐标**；(iv) **全部 E_t（t∈𝒯(I₀)）**。|D|≤κ，凸包 B₀，保留 I₀、B₀、支撑⊆B₀ 的群、整个 G_*、行轨道与列纤维，得 N≤_K M、‖N‖≤κ。

**(iii) 是 LS 论证的心脏**，行点的支撑坐标不进 B₀ 则行点不在保留轨道里；**(iv) 是"可数坏集"设计最终偿还的地方**：B₀ 之外没有坏点 ⟹ 强包含的检验空虚成立。κ 里的 +ℵ₀ 不可少：G_* 整个保留（已含 ℵ₀ 点），否则列纤维的 torsor 结构破。

**Theorem aec:class**：K 是固定可数有限关系语言中的 AEC、LS(K)=ℵ₀（语言可数 + LS 定义为无穷 ⟹ 最小可能值被达到）。

## 四、端点双模型（§4）

### 4.1 支配函数族（Lemma end:domination）

存在 f_α:δ→δ（α<η），使 γ<α 时 E_{γ,α}={β<δ: f_γ(β)≥f_α(β)} 可数。构造：每个 α<δ⁺ 固定单射 j_α:α→δ（α 的基数 ≤δ）；超限递归

$$f_\alpha(\beta)=\sup\{f_\gamma(\beta)+1:\gamma<\alpha,\ j_\alpha(\gamma)<\beta\}.$$

固定 β 时 sup 的指标集 j_α^{-1}[β] 可数（单射 + β 可数），ω₁ 正规 ⟹ sup<ω₁；γ<α、β>j_α(γ) 时 f_γ(β) 出现在 sup 里被 +1 压过 ⟹ E_{γ,α}⊆j_α(γ)+1 可数。

**用途与机械理由**：这是"mod 可数的 ω₂-长递增 scale"的对角构造。用途：给每条隶属边 y∈x（rank(y)<rank(x)<η）配"除可数 β 外 f_{rank(y)}(β)<f_{rank(x)}(β)"的逐坐标近似，把 ω₂ 级的秩不等式**压到 ω₁ 级的 tag**。例外集依赖边、进而依赖元组，与对象条件的 t-依赖例外兼容。j_α 条件是"对角化预留"：每个 (γ,α) 对只牺牲 β≤j_α(γ) 这一段；[推测] 若不加条件取全体 sup，f_α(β) 在 δ 附近爆掉，递归失败。本引理**不用 CH**。

### 4.2 层级大小与可数闭包

|V_{ω+γ}|=beth_γ（特别 |V_η|=beth_η=H(K)；每元素秩 <η 是 tag 合法性的来源）。Lean 只证 γ=ω₂ 特例（Mathlib 的 vonNeumann 基数引理直接吸收），这里方向与"Lean 必须展开"相反：Lean 更省。

可数闭包：对非空有限 X⊆D=V_η，有非空可数 D_X⊇X、对子集单调、**隶属在 D_X 上外延**（不同元素有区分见证），且有 ω-满射 d_X、d_{x}(0)=x。构造：良序取对称差首元 w(a,b)（确定性使单调性不需要额外协调 [推测]）；迭代 ω 步闭包（一轮不够，新增见证自己需要区分见证）；有限 X 对真子集取并保证 (ii)。**这是"大集合的局部可数外延快照"**：V_η 的元素可以极大，但每个有限元组只需要一个可数的、外延的、单调的邻域。外延性 (iii) 供图的外延字段；d_X 首项约定供单点标签互异。

### 4.3 图 𝒟_{t,β} 与 end:diagrams

对元组 t（X={x₁,…,x_k}），F_X=⋃_{y∈x, x,y∈D_X} E_{rank(y),rank(x)}（可数、对子集单调）。q_t(J,i)=d_{X_J}(i)；图：

$$\ell\mathcal E_t\ell'\iff q_t(\ell)=q_t(\ell'),\quad \ell R_t\ell'\iff q_t(\ell)\in q_t(\ell'),\quad \rho_{t,\beta}(\ell)=f_{\mathrm{rank}(q_t(\ell))}(\beta).$$

Lemma end:diagrams：(0) 商识别于 D_X 带真隶属；(i) 限制恰是子元组的图，**字面相等**，因为"枚举 d_Y 只依赖底层集合 Y，不依赖元组中的位置"；(ii) β∉F_X 时每个 𝒟_{t↾J,β}（含全图）有效，β∉F_X ⟺ 每条边有严格 tag 不等式（F_X 定义的逆用），子元组由 F_Y⊆F_X 单调性覆盖。consequently 颜色组通过全检验。**所有 β（含例外）定义 s_{t,β}=ι_k(𝒟_{t,β})**，合法图允许无效，呼应 §1。

**为什么 tag 是 f_{rank(q_t(ℓ))}(β) ，并非 rank 本身**：rank<ω₂ 超出图的 ρ 值域 δ=ω₁；f 把 ω₂ 个秩投影到 ω₁ 个 tag、除可数 β 外保序。**全局无单调投影 ω₂→ω₁ 存在**（会破坏 ω₂ 的正则性），所以必须逐坐标局部化、例外依赖元组。**δ 为什么是 ω₁**：它被编码引理固定（ι_k 编码所有 tag<δ 的图），no-pattern 必须用同一个 δ。

实现：B=δ×ℚ 字典序（"ω₁ 长的有理块列"：稠密无端点、区间可数、|B|=δ）；双射 β↦b_β（"this indexing is independent of the order"）；对每个 t、β 选代表序列 a_{t,b_β} 表示 s_{t,β}，调 aec:arrays 得 M_u 与行系统使 c_t(b_β)=s_{t,β}；E_t(𝐳)⊆{b_β:β∈F_X} 可数 ⟹ M_u∈K。"The chosen representatives verify that condition; they are not named in the structure."

### 4.4 两个端点模型（Theorem end:two-models）

M_u：|I|=|V_η|=beth_η、|B|=ℵ₁ ⟹ ‖M_u‖=beth_η。M_c：指标集 beth_η、B=ℚ、全零序列，B 可数 ⟹ 对象自动 ⟹ ‖M_c‖=beth_η。分离不变量选"**序 sort 的基数**"：语言可表达（一元谓词 B）、两模型取不同基数。注意分离不依赖颜色结构，M_c 的全零颜色平凡、M_u 的颜色是精心构造的图码，但同构与否根本不用看它们。最廉价的不变量，最干净的分离。

## 五、上界与尾部范畴（§3）

### 5.1 塌缩引理（col:collapse）

外延 + 良基（由 tag 降秩导出）+ ρ:Q→δ ⟹ 有单射 F:Q→V_δ、F(x)={F(y):yRx}、F(x)∈V_{ρ(x)+1}。按 tag 递归；单射性归纳（F(x)=F(x′) ⟹ 前驱集相等 ⟹ 外延性）。证明后注记："The proof uses the whole powerset V_{α+1}=𝒫(V_α). Thus the bound remains valid when many local diagrams contribute predecessors to the same element."，界对"多源汇聚"稳健。Lean 把良基性拆成独立假设（由 tag 供给，复用于 TaggedLimit）。

### 5.2 无固定模式（col:no-pattern），§3 的上界引擎

**断言**：不存在序列 (s_j)_{j≥1} 使 T_k((s_{|J|})) 对一切 k≥1 成立。

推导八步（这是全文最漂亮的构造）：

1. 反设；每个 s_k 解码出有效图 𝒟_k 且 𝒟_k↾J=𝒟_{|J|}。
2. 取线序 X、|X|>|V_δ|。对每个非空有限 A⊆X：把 𝒟_{|A|} 沿 A 的递增枚举搬运，得商 Q_A、R_A、ρ_A。
3. A⊆B 时标签包含 + 相容性给 j_{A,B}:Q_A→Q_B：单射、保 tag、保且反射 R、合成（col:quotients 的全部产出）。
4. **显式极限**：P={(A,a)}，(A,a)∼(B,b) ⟺ j_{A,A∪B}(a)=j_{B,A∪B}(b)；Q=P/∼；j_A 单射、合成；Q 的有限子集落在某 j_A 的像里。
5. 极限结构经**有限公共阶段**定义：tag 与关系都在 C=A∪B 处读（col:limit-relation）；代表无关（同一极限点的代表在有限公共阶段相等）。
6. **极限外延**：x≠x′ 放公共阶段 Q_A，Q_A 外延给区分前驱 b；j_A 保反射 ⟹ j_A(b)Rx 且 ¬Rx′。**"This witness remains valid even if larger stages add other predecessors"**，前驱集不同已由该见证确定，新增前驱不影响"存在一个区分者"。
7. 对 u∈X 取单点标签的 Q-像 q_u；u≠v 时有效性 (iii) 在公共阶段给互异 ⟹ |X|≤|Q|。
8. 塌缩 ⟹ |X|≤|Q|≤|V_δ|，矛盾。

Lean 把第 4 步的 P/∼ 换成 Mathlib 的 DirectLimit（对 Finset 按包含预序），第 5 步的"经公共阶段定义"由 DirectLimit.lift₂ 的相容性承担，第 6 步的"新增前驱不破坏见证"由 lift₂ 读公共阶段自动获得。**第 6 步是全引理最脆弱处**：若 R 的定义是"存在某阶段见证"，并非"公共阶段"，外延性可能过剩（区分见证所在阶段与检验阶段不同），公共阶段定义是精确的平衡点。

**Remark（反推的关键接口）**：no-pattern 消耗的假设**弱于**"存在无穷齐次集"，只需要"每个 arity 有一个（各自的）见证元组"："The tuples need not be nested or come from a common infinite homogeneous set."这是下一步分划论证恰好供给的弱形式（不需要 Erdős–Rado 的无穷齐次集）。

### 5.3 基数算术与有限分划估计

Λ=beth_{ξ⁺}：强极限、cf(Λ)=ξ⁺>ξ；ζ<Λ 无穷时 ξ^ζ、(ξ^ζ)⁺<Λ。共尾性专用于后面的抽色。

**有限分划估计（cat:finite-partition）**：对每个 m≥1 与无穷 χ<Λ，存在 μ<Λ 使每个 c:[μ]^m→C（|C|≤ξ）有 χ 元齐次子集。对 m 归纳：

- m=1：μ=(max(ξ,χ))⁺，鸽笼。
- 归纳步：取 m 情形的源 ζ<Λ；q=ξ^ζ、μ=q⁺。**树构造**：剩余集 X_s 递归（命名最小点 r_s、其余点按 profile u_{s,y}(a)=c({r_{s↾β}:β∈a}∪{y}) 分桶，桶数 ≤q）；节点计数 |⋃_{α≤ζ}^α q|≤q<μ ⟹ **存在从未被命名的 x**；x 的枝给出 ζ 长严格递增代表列 P，且 c({r_{α₀},…,r_{α_m}})=d({r_{α₀},…,r_{α_{m-1}}})（d(A)=c(A∪{x})），**x 永不出现在 c 的参数里**；由 ζ 的选取 d 有 χ 元齐次集，搬到 c。

这是 Erdős–Rado 端点齐性方法的有限 arity 版。μ 取后继：保证"未被命名的点"存在（q 个节点 < μ 个点）。

**Lean 的最大重构发生在这里**：论文的"全局 profile 树 + 从未命名点找枝"换成"**固定 x 的剩余递归 + stopCode 计数**"，residual 以 x 为参数（与 x 在此前命名代表上同色、大于全部已命名者），step 取最小元，`stopCode x = (first x, profile x)` **单射** ⟹ 若每个 x 都停止则 X ↪ J×(Finset J→C)，与基数矛盾 ⟹ 存在不停者 x，给出对所有 α 与所有有限子集一致的同色等式（比论文需要的更强）。数学内核相同（都是鸽笼：J×(Finset J→C)<μ），但 Lean 的组织对形式化更友好。μ 的取值也随之不同：Lean q=max ℵ₀(ζ·ξ^ζ)（把 ζ 乘进定义，避免单独论证 q≥ζ）。

### 5.4 逐 arity 提取与上界（cat:finite-patterns, cat:bounded）

**逐 arity 提取**：|X|≥Λ、每 arity j 有 c_j:[X]^j→C_j（|C_j|≤ξ），则存在颜色 p_j 使每个 k 有 k 元 A_k：j≤k 时 [A_k]^j 上 c_j≡p_j。**A_k 不必嵌套**。递归选 p_j，不变量"对每个无穷 χ<Λ 有 χ≤|Y|<Λ 的样本"；归纳步的关键是**抽色**：至少一色出现在无界多个目标 χ 上，否则 |C_{j+1}|≤ξ<cf(Λ) 个 <Λ 的界之 sup 仍 <Λ，矛盾。[推测] 若调色板可以 ≥cf(Λ)，抽色失败，这正是调色板必须 ≤ξ（，并非任意 ≤Λ）的原因，链条：颜色谱 |S^B|≤δ^δ=2^δ=ξ，CH 进来一次、永远绑定。

**上界（cat:bounded）**：M∈K、B^M 不可数 ⟹ |I^M|<Λ。反设：良序 I^M（只在本证明用）；颜色剖面 c_t:B^M→S；调色板 |S^{B^M}|≤δ^δ=2^δ=ξ（**CH 的第二次出场**：|S|=δ）；对全体 j-元子集按递增枚举的剖面着色，用逐 arity 提取得剖面 p_j 与每个 k 的递增见证元组 t_k（其 j-子元组剖面全为 p_j）；固定全局行代表，E=⋃_k E_{t_k} **可数**（对象条件按 t 给例外，Remark："it uses only countably many full-tuple exceptional sets; it does not seek a coordinate good for every tuple"）；B 不可数 ⟹ 取 b∉E；令 s_j=p_j(b)；在 t_k 上求值 ⟹ T_k((s_{|J|})) 成立，no-pattern 禁止的序列。矛盾。

**本证明最优雅的一步**：调色板取**剖面** c_t（B 上每点的颜色向量），并非逐点颜色，固定 b 后 s_j=p_j(b) 自动兼容全部 j，把"逐坐标"的齐次性升级为"剖面"的齐次性，一次性对整个 B 求值。若对象条件要求全体元组共用一个可数例外集，⋃_k E_k 不可数、b 的选取失败，**对象条件的 t-依赖是全链条的润滑剂**。

### 5.5 可数基座同构（cat:countable-base）与尾部范畴

可数基座 + 等大指标 ⟹ 同构。三步：基座线序同构（Cantor 背同构的手工版；Lean 直接用 `Order.iso_of_countable_dense`）；群同构 ĝ(u)=g[u]；**三角分解**：对每个元组单独做，比特差矩阵 d(n,k)=a(n,k)+a′(n,k) 分拆成行区与列区：

$$U_n=\{g(b_k):k\le n,\ d(n,k)=1\}\in G(B^N),\qquad V_k=\{n:n<k,\ d(n,k)=1\}\in G_*,$$

两区域分拆 ω×ω ⟹ 平移 z̃′_n=z′_n+U_n、w̃′_k=w′_k+V_k 抹平差矩阵；纤维等变映射 z_n+u↦z̃′_n+ĝ(u)、w_k+v↦w̃′_k+v 保整个比特关系。

**可数性在三角分解处进入**：列必须可枚举 (b_k)，U_n 的"只用前 n+1 列"才是有限。不可数 B 时差的支撑散布在不可数列上，U_n 不可能有限，这就是 cat:bounded 的上界与 cat:countable-base 的同构之间的**互补分界**：基座可数 ⟹ 全同构；基座不可数 ⟹ 大小被 Λ 截断。[推测] 跨元组统一平移不存在，不同元组的比特矩阵无关，"separately for every tuple t"必须逐字执行。Lean 的枚举用 Encodable.encode 的 canonical 序（不必保 B 的序），同一个下三角/上三角分拆思想。

**尾部范畴（cat:tail）**：μ≥Λ 时存在性由 aec:arrays（基座 ℚ、零序列）；唯一性：‖M‖=μ=max(|I|,|B|,ℵ₀) 且 |B|≤δ<Λ≤μ ⟹ |I|=μ；B^M 不可数则 |I|<Λ≤μ 矛盾 ⟹ B^M 可数 ⟹ 任意两模型等大指标 + 可数基座 ⟹ 同构。μ=Λ 本身含（两端点包含）。

## 六、总装、逻辑范围与 booleanization（§5–§6）

### 6.1 thm:main 与 no-amalgamation

四步总装：AEC 存在 → CH 数值核对 H(K)=beth_η → 双模型 + 尾范畴 → Cantor+beth 严格增给 Λ>H(K) ⟹ 取 λ=Λ⁺ 转移失败。

Proposition no-amalgamation 是**防御性证明**：K 无 JEP、无 AP（甚至可在可数模型上见证 AP 失败），构造 N"只放大指标排序到 Λ⁺、基座不动"，强包含空虚成立；若 M,N 强嵌入公共 P，M 的像迫使 B^P 不可数、N 的像迫使 |I^P|≥Λ⁺，违反 cat:bounded。这解释了为什么 Vasey 式转移定理不与本反例冲突："although neither failure was needed as an input to the proof"，AP/JEP 失败是**产出**不是**原料**。另一段澄清存在 Hanf 定理的边界：它给的是"类中某处"的大模型（可数基座者），不是"给定模型的扩张"；不可数基座子类甚至没有可数模型，谈不上 LS=ℵ₀。

### 6.2 §6 booleanization：与 Espíndola 定理的分歧点

本节独立于主定理证明链，是对 Espíndola 2023 Theorem 4.1 证明步骤的针对性分析。可数模型加基座点（bool:extension）：每个可数 M 有可数强扩张 M′（基座右端加 ℚ；造相容颜色，**I 可数时 arity 有界、I 有限时更大 arity 无着色对象，故不产生 no-pattern 禁止的固定模式**；比特 prescription 用 torsor 公式良定义）。site 认同：𝒞₀=可数模型骨架、¬¬ 拓扑、presentability rank 与 internal size 对齐（含 ℵ₀ 处）。核心阻碍（bool:obstruction）：**基座可数的 H（含尾部上的范畴模型）的 canonical point 不穿过 ¬¬-Booleanization**，稠密余筛 R_A={r:A→D: r[B^A]⊊B^D} 被可数强扩张稠密化（bool:extension 供给，不用任何 amalgamation），但 p_H^*(R_A)→p_H^*(y_A) 不是满射：a:A→H（像含 B^H）不可分解 h∘r（否则取 b∈B^D∖r[B^A]，h 单射被违反）。

[推测]（第 6 节在全文中的角色）：主定理完全不依赖它；它的存在是因为声称与 Espíndola 定理矛盾后，审稿人必然问"对方证明哪一步失效"，给出精确失效点（canonical point 步骤），同时不越界宣称对方定理整体不可修复。论文原话把范围限死："A topology generated by a smaller chosen family of covers could omit R_A; in that case it would not be the full double-negation topology used in that step."这是负责任的反例论文的标准结构。[推测完毕]

Lean **未形式化** §6、Θ/Con 层面、prop:no-amalgamation，`prescribed_transfer_fails` 是 Θ 的逐点实例（给定 hCH 直接构造并证明失败），即 ZFC ⊢ CH⇒Θ 中被 ZFC 证明的那个蕴含的内部内容；Gödel 一致性推演在形式化范围之外。

## 七、Lean 镜子：4900 行的对照

### 7.1 覆盖与收窄

Lean 覆盖 §1–§5 全部数学内容，四层架构：纯集合论层（Model/Collapse/Partition/Diagrams/Colors/EndpointDiagrams，=* 商、编码、支配函数、可数闭包、塌缩、分划、no-pattern、端点图，不接触"结构"概念）→ 结构层（Arrays 到 DirectedLimits，六 sort 点类型、语言、映射、强包含、有向极限）→ 公理层（AEC.lean 的 IsAEC 九字段验证）→ 组装层（Main.lean）。permitted axioms 仅 propext/Quot.sound/Classical.choice；challenge 文件的 sorry 是题面。

**最大结构差异：Lean 的类只含"自由实现"**（Data 七字段：I、B、bits；行点=(t,n,u) 语法对象），并非论文的任意 torsor 基本结构。含义：Lean 证明的是"存在一个 AEC 具有主定理性质"，这正是 challenge 接口要求的命题；[推测] 论文的 K 与 Lean 的 K 的逐点同一性不影响主定理真值（每个基本结构选定代表后比特矩阵被平移律完全决定，应能做成同构，但这一步论文也未明写）。若审稿人坚持论文的 K 原样，需补核对。

### 7.2 逐条对应里最有信息量的差异

- **编码**：论文"两两不交值域"被 Lean 的 Σ-型绕开（arity 在型里，检验直接以 code 等式表述）；`Colors.cardinal` 不用 CH（`repeat_injective` 给具体单射，避免"选择+反证"）。
- **|B|≤ℵ₁ 两条证明**：论文"可数上稠密/递归列"二分；Lean"嵌入 ω₁ + 初始段覆盖 + Σ-单射"，同一定理的两条路线。
- **代表无关性降维**：Lean 无"行选择系统"量化（canonical 代表内置），强断言以 Map 平移形式出现（`test_away`）；这使 LS 论证里"行代表选择 + 全局换算"整个省掉，论文 §2 最微妙的一步在 Lean 里是 restrictMap 的零平移。
- **有向并 → DirectLimit**：论文的"并"是 Lean 的极限（对任意非空 Preorder-有向族）；torsor 性质在并中保持 = rowDiff/colDiff 的 Option(Finset) 对称差演算。
- **分划估计重构**（5.3 已述）：全局树+未命名点 ↔ 固定 x 的剩余递归+stopCode 计数；Lean 版还对抽象参数 (Λ,ξ) 表述（强极限+ξ<Λ+ξ<cf(Λ)），组合核心与 ω₁/2^{ω₁} 解耦，论文直接绑定。
- **良序的身份**：`linearOrderOfSTO WellOrderingRel`，论文"Fix a well-order of I^M, used only in this proof"在 Lean 里是类型类的 canonical 良序，不是任意良序。
- **CH 精确进入点清单**（机器可查）：diagram_bound（δ^{ℵ₀} 化简）、code 传递、endpoint_eq_hanf。与论文一致，且证实 |S|=𝔠 无条件。
- **宇宙管道**：`Palette := ULift Color`、`D := Shrink V`，纯开销、零数学，论文无此关注。
- **Lean 强化的断言**：exists_sequence 的等式对**所有** α 与所有有限子集成立（论文只需链）；CountableClosures 对任意分离关系泛化。
- **Lean 缺失**：|V_{ω+γ}|=beth_γ 一般式（只有特例）、(ξ^ζ)⁺<Λ 独立陈述、Θ/Con、AP/JEP、§6 全部。

### 7.3 可信度增量

AEC 九公理（尤其 smoothness 与相干，最易被质疑处）一次通过类型检查，无隐藏假设余地；端点基数等式与 `endpoint = hanf ℵ₀` 的数值巧合机器确认；no-pattern 的逻辑终点 `succ V.card ≤ V.card` 是纯序数算术荒谬式；尾部范畴链每步独立引理。未形式化部分（Con 层面、AP/JEP、§6）不承担主定理正确性，但承担"反驳对象是否被精确命中"的责任，C 级人工审读点：Lean 类的收窄、分划重构的逐条对审、§6 的 site 认同涉及 Espíndola 2022 约定翻译、与 Espíndola 2023 的冲突定位（本素材未核对对方原文）。

## 八、终局

### 8.1 与最初设想的差异

1. **我最初想造"处处不范畴"的反例**，很快意识到不需要也不够：与定性 eventual categoricity 冲突的粗反例说服力弱，且造起来更难。"错位"设计（上范畴、下不范畴）反而让构造的两个部分各自独立变简单。
2. **我最初以为难点在 AEC 公理验证**（smoothness 名声在外），实际它被对象条件的设计自动解决，"逐元组可数例外 + 新点无例外"的不对称直接给出有向并与光滑性；真正难的是让不可数基座模型存在且可数基座模型同构。
3. **支配函数的对角化我一开始想全局化**（找单调投影 ω₂→ω₁），被正则性挡住后才接受"逐坐标局部化 + 元组依赖例外"，这恰好与对象条件同构，是设计收敛，并非巧合。
4. **CH 我以为会进组合层**，实际全在卡片算术层（三个机器可查的进入点）；这使反例对 ¬CH 的鲁棒性成为可检验的问题，并非感觉。
5. **分划论证我按 Erdős–Rado 的完整齐次集设计**，发现 no-pattern 只需要"每 arity 一个见证"，弱化假设后源基数降了一整层（不需要 beth 层级的高处），这是 cat:bounded 能卡在 Λ 的原因。

### 8.2 常数备忘

δ=ω₁、η=δ⁺=ω₂、S=2^ω/=^*、ξ=2^δ、Λ=beth_{ξ⁺}；h(κ)=beth_{(2^κ)⁺}、H(K)=h(ℵ₀)；CH 下 H(K)=beth_{ω₂}=beth_η；|V_{ω+γ}|=beth_γ；E_{γ,α}⊆j_α(γ)+1；F_X 可数、单调；|S^B|≤δ^δ=2^δ=ξ；cf(Λ)=ξ⁺>ξ、ξ^ζ<Λ；μ=(max(ξ,χ))⁺（m=1）、q=ξ^ζ、μ=q⁺（Lean：q=max ℵ₀(ζ·ξ^ζ)）；2^k−1（全检验输入数）；|V_δ|=beth_{ω₁}（no-pattern 塌缩值域）。

### 8.3 可信度审查

A 级（机器）：AEC 九公理、LS=ℵ₀、端点双模型、尾部范畴、no-pattern、endpoint=hanf、main 与 prescribed_transfer_fails，全部在 permitted axioms 内。B 级（常规论证）：|V_{ω+γ}| 一般式、aec:order-size 论文版、no-amalgamation、§6、Θ 展开。C 级（人工审读）：Lean 类的收窄、分划重构的逐条对审、§6 约定翻译、与 Espíndola 冲突的最终裁决。开放问题：单侧性（¬Φ 是否可证、Φ 是否一致）、更小被规定界、AP/JEP 相容反例是否存在、§6 的修复假设。

*（素材来源：E:\math\研究笔记\素材\CH范畴性阈值-素材.md；论文 TeX 七节；Lean 15 模块约 4900 行；formalization.yaml；CHObstruction.json。）*

## 九、第二轮深拆：四个未拆单元的四段式条目

第一轮我把 §1–§6 的主干都过了一遍，但写法偏"综述＋结论"，中间步骤是跳的。这一轮挑四个第一轮只登记了名字或只写了结论的单元，逐引理重做：`end:hierarchy-size`（端点模型的势从哪来）、`cat:finite-patterns`（把逐 arity 的分划估计缝成一个模式序列的那一步）、`cat:cardinals`（$\Lambda$ 的强极限性与共尾性，全篇所有 "$<\Lambda$" 的通行证）、`cor:consistency`（从 CH 下的构造到 $\operatorname{Con}$ 层面的那句话）。每个单元按四段写：(a) tex 逐字引用与行号；(b) 把论文压缩的中间步骤补出来；(c) 每个假设、常数、指数的机械理由，含 CH 的精确进入点与去掉 CH 后的退化位置；(d) 我试过或能想到的失败路线，标注 `[推测]`。

### 9.1 `end:hierarchy-size`：$\beth_\gamma$ 从幂集里长出来

**(a) 逐字引用。** 陈述在 `04-endpoint.tex:56-64`：

> "The cumulative hierarchy satisfies $\vert V_{\omega+\gamma}\vert=\beth_\gamma$ for every ordinal $\gamma$. In particular, $\vert V_\eta\vert=\beth_\eta$, and every element of $V_\eta$ has rank below $\eta$."

证明的前半 `04-endpoint.tex:66-75`：

> "The set $V_\omega$ of hereditarily finite sets is countably infinite, giving the assertion at $\gamma=0$. At a successor stage, $\vert V_{\omega+(\gamma+1)}\vert=\vert\mathcal P(V_{\omega+\gamma})\vert=2^{\beth_\gamma}=\beth_{\gamma+1}$."

极限步 `04-endpoint.tex:76-89`：

> "If $\gamma$ is a nonzero limit ordinal, continuity of ordinal addition and of the cumulative hierarchy gives $V_{\omega+\gamma}=\bigcup_{\zeta<\gamma} V_{\omega+\zeta}$. The inductive hypothesis gives a lower bound of $\sup_{\zeta<\gamma}\beth_\zeta=\beth_\gamma$ for the cardinality of this union. It also gives the upper bound $\vert\gamma\vert\cdot\beth_\gamma$. Strict increase of the beth sequence implies $\vert\gamma\vert\leq\beth_\gamma$: the map $\zeta\mapsto\beth_\zeta$, for $\zeta<\gamma$, is an injection into the ordinal $\beth_\gamma$. The upper bound is therefore $\beth_\gamma$, completing the induction."

收尾 `04-endpoint.tex:91-93`：

> "Since $\omega+\omega_2=\omega_2$, the first conclusion follows. The rank assertion is the defining property of membership in $V_\eta$."

**(b) 中间步骤补全。** 论文把三处当显然，我逐个补。

第一处，$\gamma=0$ 需要 $V_\omega$ 恰可数无穷。$V_\omega=\bigcup_{n<\omega}V_n$，每个 $V_n$ 有限（$V_0=\varnothing$，$\mathcal P$ 迭代保持有限），可数个有限集的并可数；无穷性由 $n\in V_{n+2}$ 的遗传有限序数链给出。这里我给补的是"hereditarily finite"到 $\omega$ 的双射来源：每个遗传有限集对应一棵有限的外延树，有限树集可数；反过来 $n\mapsto\{0,\dots,n-1\}$ 给单射。可数无穷成立，于是 $\beth_0=\aleph_0$ 与 $\vert V_\omega\vert$ 对上，$\gamma=0$ 这条基例靠的是偏移 $\omega$。

第二处，极限步的下界。归纳假设给每个 $\zeta<\gamma$ 的 $\vert V_{\omega+\zeta}\vert=\beth_\zeta$，链 $\zeta\mapsto V_{\omega+\zeta}$ 递增（$\omega+\zeta$ 随 $\zeta$ 递增），所以并的势 $\ge\sup_{\zeta<\gamma}\beth_\zeta$；而 $\beth$ 在极限指标处的定义就是 $\beth_\gamma=\sup_{\zeta<\gamma}\beth_\zeta$，下界正好是 $\beth_\gamma$。上界：并是 $\gamma$ 个集合的和，每项 $\le\beth_\gamma$（严格增），故 $\le\vert\gamma\vert\cdot\beth_\gamma$；论文再证 $\vert\gamma\vert\le\beth_\gamma$，乘积塌回 $\beth_\gamma$。那个注入值得写清：$\zeta\mapsto\beth_\zeta$ 把 $\gamma$ 单射进**序数** $\beth_\gamma$，因为每个 $\beth_\zeta<\beth_\gamma$（严格增），单射的像落在 $\beth_\gamma$ 内，故 $\vert\gamma\vert\le\beth_\gamma$。

第三处，$\omega+\omega_2=\omega_2$。左加 $\omega$ 对初序数 $\omega_2$ 不动，因为 $\omega_2$ 是极限序数且 $\omega\le\omega_2$：$\omega+\omega_2=\sup_{\beta<\omega_2}(\omega+\beta)=\omega_2$。于是 $\gamma=\eta=\omega_2$ 代入 $\omega+\gamma$ 得 $\eta$ 本身，才有 $\vert V_\eta\vert=\beth_\eta$。这一步纯是序数算术，但它是"端点模型的势正好落在 $\beth_{\omega_2}$"的唯一算术理由，我第一轮漏写了。

**(c) 机械理由。**

- **为什么是 $\beth$ 层。** 每层幂集，$\beth$ 的定义就是幂集迭代；论文全文的卡片核算（$\Lambda=\beth_{\xi^+}$、$H(K)=\beth_{(2^{\aleph_0})^+}$、$\vert V_\delta\vert=\beth_{\omega_1}$）都跟这个层同调。若要换成 $\aleph$ 层的陈述，就得在每层用 GCH；这正是本条引理**不**需要 CH 的原因：ZFC 里 $\beth$ 层是定义，$\aleph$ 层才是假设。
- **$\eta=\omega_2$ 这个下标为何是这个值。** 链条：`04-endpoint.tex:6` 定 $\delta=\omega_1,\ \eta=\delta^+=\omega_2$；`04-endpoint.tex:98` 与 `04-endpoint.tex:309` 取 $D=V_\eta$、$I=D$；本引理给 $\vert I\vert=\beth_\eta$；`03-categoricity.tex:619` 的 $\mu=\max(\vert I^M\vert,\vert B^M\vert,\aleph_0)$ 与 `04-endpoint.tex:350-351` 合成总势 $\kappa=\beth_\eta$；`05-conclusion.tex:7` 用 CH 把 $H(K)=\beth_{(2^{\aleph_0})^+}$ 写成 $\beth_{\omega_2}$。所以 $\eta$ 必须是 $(2^{\aleph_0})^+$ 在 CH 下的取值 $\omega_2$，同时它还得是 $f_\alpha$ 族（`04-endpoint.tex:18` 要求 $\alpha<\eta$）的指标上界。**若 $\eta$ 改成 $\omega_1$**，则 $\beth_{\omega_1}$ 严格小于 $H(K)=\beth_{\omega_2}$（`05-conclusion.tex:16` 的严格增论证），端点模型落错基数，主定理 (ii) 直接失效；**若 $\eta$ 改成 $\omega_3$**，$H(K)$ 不动（它由 $\operatorname{LS}(K)=\aleph_0$ 决定），两个模型的势就超过被规定界，(ii) 变成"高于 $H(K)$ 处不范畴"，那已经不构成对转移的否证。
- **$\vert V_\eta\vert$ 与"每个元素秩 $<\eta$"两处都被消费。** 前者进 `04-endpoint.tex:346`；后者是 `04-endpoint.tex:186-200` 一带取 $f_{\operatorname{rank}(\cdot)}$ 的定义域前提：$f_\alpha$ 族只对 $\alpha<\eta$ 存在（`04-endpoint.tex:18`），元素秩若等于 $\eta$ 就没有对应函数。论文在 `04-endpoint.tex:92-93` 用"membership in $V_\eta$ 的定义性质"一句话打发，这是真定义性质（秩 $<\eta$ 当且仅当属于 $V_\eta$，$\eta$ 为极限序数），不算缺口，但它同时依赖 $\eta$ 是极限序数：$\eta=\delta^+$ 作为后继序数是极限序数（$\omega_2$ 无最大元），成立。
- **CH 在本条引理里的使用情况：** 零次。CH 的使用点在 `03-categoricity.tex:452`（$\vert S\vert=\delta$）与 `05-conclusion.tex:5-7`（$H(K)$ 的指标塌成 $\omega_2$）。去掉 CH 的退化位置：本引理的结论原样保留，$\gamma=\eta$ 处仍是 $\beth_\eta$；断的是 `05-conclusion.tex:7` 的等式 $H(K)=\beth_{\omega_2}$，此时端点模型的势 $H(K)=\beth_{(2^{\aleph_0})^+}$ 与 $\Lambda=\beth_{(2^{\aleph_1})^+}$（`00-introduction.tex:94`）之间只剩 $\xi^+>\eta$（`05-conclusion.tex:13`，Cantor 定理 $\xi=2^\delta\ge\delta^+=\eta$）这一条不等式；构造本身要重跑的是 $D=V_{(2^{\aleph_0})^+}$ 那一支，而它要求 tag 层与色集大小对齐，见下一条的 $\vert S\vert=\delta$。
- **两个互不同构模型的分离不变量**（`04-endpoint.tex:360-364`）：同构保持序排序的一元谓词，故不能把势 $\aleph_1$ 的基座与可数基座等同；本引理只给"两个模型的总势都恰是 $\beth_\eta$"这一侧，分离侧完全不用 $\beth$ 算术。

**(d) 失败路线。**

- `[推测]` 把 $D$ 换成 $H(\theta)$（$\theta$ 大正则）以避开整层幂集：失败理由具体可查，`04-endpoint.tex:129` 的传递性论证 "$D=V_\eta$ is transitive" 在 $H(\theta)$ 里也能成立，但秩不再被 $\eta$ 界住，$f_\alpha$ 族（`04-endpoint.tex:18`）的指标上界失效，端点图的 tag 无处安放。
- `[推测]` 只证 $\gamma=\omega_2$ 的特例而不证一般式：数学上够用（端点只用一个值），但 `03-categoricity.tex:94` 与 `03-categoricity.tex:194` 取的 $X$ 要 $\vert X\vert>\vert V_\delta\vert=\beth_{\omega_1}$，即同一引理要在 $\gamma=\omega_1$ 再取一次值；写成一般式让两处复用同一行，Lean 版只给了特例（第七节记的"Lean 缺失：$\vert V_{\omega+\gamma}\vert=\beth_\gamma$ 一般式"）。
- `[推测]` 用 $L$ 里的 GCH 把 $\beth$ 换成 $\aleph$ 以图更小的端点势：no-pattern 的塌缩值域是整个 $V_\delta$（`03-categoricity.tex:34`、`03-categoricity.tex:194`），在 $L$ 内部重算 $\delta$-层的势时，外延标签集 $\{(U,i):\varnothing\ne U\subseteq A,\ i<\omega\}$（`03-categoricity.tex:99`）的势不变，但界 $\beth_{\omega_1}$ 变成 $\aleph_{\omega_1}$，$X$ 的取法与后续 $\vert Q\vert$ 的计数都要重跑；收益只是把不可数基座的势压低一阶，与主定理的"错位"设计无关。

### 9.2 `cat:finite-patterns`：缝合逐 arity 的见证

**(a) 逐字引用。** 引理前的动机句 `03-categoricity.tex:395-396`：

> "The next lemma combines the finite partition estimates without asserting the existence of a common infinite homogeneous subset."

陈述 `03-categoricity.tex:398-408`：

> "Let $X$ be a set with $\vert X\vert\ge\Lambda$. For each positive integer $j$, let $c_j:[X]^j\to C_j$, where $\vert C_j\vert\le\xi$. There are colors $p_j\in C_j$ such that for every positive integer $k$ there is $A_k\in[X]^k$ satisfying $c_j(A)=p_j\ (1\le j\le k,\ A\in[A_k]^j)$. The sets $A_k$ need not be nested."

证明里的两处关键 `03-categoricity.tex:411-416` 与 `03-categoricity.tex:426-433`：

> "Choose the colors recursively. After choosing $p_1,\ldots,p_j$, maintain the following invariant: for every infinite cardinal $\chi<\Lambda$, there is a set $Y\subseteq X$ with $\chi\le\vert Y\vert<\Lambda$ such that each $c_i$ for $1\le i\le j$ is constantly $p_i$ on $[Y]^i$. For $j=0$ this follows from $\vert X\vert\ge\Lambda$."

> "At least one color occurs as $q_\chi$ for target cardinals $\chi$ unbounded below $\Lambda$. Otherwise, for every $q\in C_{j+1}$ there would be a bound below $\Lambda$ for the targets assigned color $q$. Since $\vert C_{j+1}\vert\le\xi<\operatorname{cf}(\Lambda)$, the supremum of these bounds would still be below $\Lambda$. This contradicts the fact that we made the construction for every infinite target below the limit cardinal $\Lambda$. Choose such a color as $p_{j+1}$; its samples establish the invariant at $j+1$."

**(b) 中间步骤补全。**

不变式的正确读法：$\chi\le\vert Y\vert<\Lambda$ 里下界是**任意**无穷 $\chi$，上界是 $\Lambda$。$j=0$ 时"每个 $c_i$ 常值"是空条件，只需 $\chi\le\vert Y\vert<\Lambda$；$X$ 本身 $\ge\Lambda$，任取一个介于 $\chi$ 与 $\Lambda$ 之间的势的子集即可（$\Lambda$ 是极限基数，下面总有更大的基数，见 9.3 的 (c)）。

归纳步里论文把两次"实例化不变式"压成了一句 `03-categoricity.tex:421-423` "Choose an existing sample of size at least $\mu_\chi$, restrict to $\mu_\chi$ points"。补开：给目标 $\chi$，`cat:finite-partition`（`03-categoricity.tex:269-271`）先返回一个源基数 $\mu_\chi<\Lambda$（ arity $j+1$、目标 $\chi$）；要对 $\mu_\chi$ 用这个源，就得有 $\mu_\chi\le\vert Y'\vert$ 的样本，所以先在不变式里取 $\chi:=\mu_\chi$（它 $<\Lambda$ 且无穷，合法），得到 $Y'$ 与 $\mu_\chi\le\vert Y'\vert<\Lambda$；再从 $Y'$ 里选出恰好 $\mu_\chi$ 个点的子集 $Y''$。齐次性对**子集遗传**：$Y'$ 上每个 $c_i\ (i\le j)$ 在 $\binom{Y'}{i}$ 上常值 $p_i$，则限制到 $Y''$ 仍常值。对 $Y''$ 的 $\binom{\cdot}{j+1}$ 用 `cat:finite-partition` 得到 $\chi$ 元子集 $Z_\chi$ 与颜色 $q_\chi\in C_{j+1}$，$Z_\chi$ 同时保住前 $j$ 个颜色。

抽取 $p_{j+1}$ 的论证是反证：若每个 $q\in C_{j+1}$ 只出现在有界的 $\chi$ 集合上，即存在 $\beta_q<\Lambda$ 使 $q_\chi=q\Rightarrow\chi\le\beta_q$；$\chi$ 跑遍 $\Lambda$ 下所有无穷基数时，$\sup_{q}\beta_q$ 是 $\le\xi$ 个 $<\Lambda$ 的基数的上确界，由 $\operatorname{cf}(\Lambda)=\xi^+>\xi$（`cat:cardinals`，`03-categoricity.tex:231`）严格小于 $\Lambda$。取一个无穷 $\chi$ 大于该上确界且 $<\Lambda$（$\Lambda$ 是极限基数保证存在），它的 $q_\chi$ 无 $q$ 可容，矛盾。

收尾 `03-categoricity.tex:435-437`：定 $k$ 后，用不变式在 $j=k$ 处、取 $\chi=\aleph_0$ 得无穷样本 $Y$，$Y$ 在 $\binom{Y}{i}$ 上 $c_i$ 常值 $p_i$（$i\le k$）；任取 $A_k\in\binom{Y}{k}$，则每个 $A\in\binom{A_k}{j}$ 属于 $\binom{Y}{j}$，故 $c_j(A)=p_j$（$j\le k$）。$A_k$ 之间不嵌套，因为每步换的是"当前 $j$ 的样本"，论文在 `03-categoricity.tex:407` 明写。

**(c) 机械理由。**

- **调色板上界 $\xi$ 的来源与 CH 的位置。** 本引理只假设 $\vert C_j\vert\le\xi$ 作为一个参数；把它实例化为 $C_j=S^{B^M}$ 的是 `cat:bounded`，那里的界 $\vert S^{B^M}\vert\le\delta^\delta=2^\delta=\xi$ 写在 `03-categoricity.tex:455-457`，而 $\vert S\vert=\delta$ 需要 CH（`03-categoricity.tex:452` "By CH, $\vert S\vert=\delta$"，$S=2^\omega/=^*$ 的势是 $2^{\aleph_0}$）。$\delta^\delta=2^\delta$ 这步本身无条件（$\kappa^\kappa=2^\kappa$，论文在 `03-categoricity.tex:458-461` 双向夹出来），所以 CH 只进在色集大小，不进在指数算术。
- **为什么必须 $\xi<\operatorname{cf}(\Lambda)$。** 全篇只有 `03-categoricity.tex:429` 一处显式用共尾性，就是这里的"少数颜色不能覆盖共尾的一族目标"。若把 $\Lambda$ 换成 $\operatorname{cf}(\Lambda)\le\xi$ 的基数（例如 $\beth_{\xi}$ 或 $\xi^{+\omega}$），抽色步断，`cat:bounded` 断，尾部范畴 `cat:tail`（`03-categoricity.tex:621`）随之断。
- **为什么不直接要无穷齐次集。** 用 Erdős–Rado 一次拿到 $\chi$ 元（甚至 $\chi^{+\omega}$ 级）公共齐次集，源基数要推到 $\beth_{(2^\xi)^+}$ 一层，$\Lambda$ 就得整体抬高；更关键的是抬高之后 $\Lambda$ 与 $H(K)$ 的大小关系要重新核对（`05-conclusion.tex:13-16` 只用 $\xi^+>\eta$），并且可数例外集 $E=\bigcup_k E_k$（`03-categoricity.tex:474-476`）的"只用可数个全元组例外集"论证会变成"要用一个共同点"，而共同点对**所有**元组都好是拿不到的（`03-categoricity.tex:494` 明写"it does not seek a coordinate good for every tuple in $I^M$"）。这条弱化正是本引理存在的理由，也是 `03-categoricity.tex:396` 那句 "without asserting" 的份量。
- **$k$ 与 $2^k-1$ 的关系**（第一轮 8.2 记过的常数）：全子序列检验（`01-colors.tex:139` 起）对长度 $k$ 的元组检验的是全部非空子序列，共 $2^k-1$ 个输入；这正是 `03-categoricity.tex:481` 处 $T_k\bigl((s_{\vert J\vert})_{\varnothing\ne J\subseteq\{1,\dots,k\}}\bigr)$ 的指标集大小，也是本引理结论里"$1\le j\le k$"能喂满 $T_k$ 的原因：见证元组 $t_k$ 的每个 $j$-子元组剖面都是 $p_j$。
- **$\chi$ 取无穷基数、$A_k$ 不必嵌套**：这两点在证明里都是装饰性的（不影响界），但 (a) 段的逐字读法要求承认它们；论文在 `03-categoricity.tex:413` 与 `03-categoricity.tex:407` 分别写死。

**(d) 失败路线。**

- `[推测]` 把逐 arity 抽色换成一次超幂/紧致性论证（对全体 $j$ 同时抽）：需要一个 $\kappa$-完备的非主超滤，$\kappa=\operatorname{cf}(\Lambda)=\xi^+$ 处的完备性等价于可测式假设，比 CH 强得多；论文的 $\operatorname{LS}(K)=\aleph_0$ 与"可数基座模型全同构"（`cat:countable-base`，`03-categoricity.tex:499-501`）都不给这个强度。
- `[推测]` 用 Galvin–Prikry 型定理把 $c_j$ 换成 Borel 染色以省掉树构造：这里的色集是 $S^{B^M}$（函数空间），拓扑只在 $S$ 的 $=^*$ 商上，指标 $B^M$ 不可数时该拓扑与序数无关，没有可测结构可用；而 `03-categoricity.tex:464-465` 的"以递增枚举的剖面着色"完全是组合的，任何拓扑化都要先把 $\vert B^M\vert\le\delta$（`03-categoricity.tex:453`）换成可数，那与 $B^M$ 不可数的假设矛盾。
- `[推测]` 在 $j$ 的递归上做到 $\omega$ 之外（ transfinitely 抽色到序数 $\ge\omega$）：不变式只在每个有限 $j$ 处成立，极限处要 intersections of samples，样本不嵌套（`03-categoricity.tex:407`）就没有可交的链，直接回到"公共无穷齐次集"的老困难。

### 9.3 `cat:cardinals`：$\Lambda$ 的两张通行证

**(a) 逐字引用。** 常数定义 `03-categoricity.tex:7-8`：

> "$\delta=\omega_1,\qquad \xi=2^\delta,\qquad \Lambda=\beth_{\xi^+}.$"

陈述 `03-categoricity.tex:228-235`：

> "The cardinal $\Lambda$ is a strong limit and $\operatorname{cf}(\Lambda)=\xi^+>\xi$. If $\zeta<\Lambda$ is infinite, then both $\xi^\zeta$ and $(\xi^\zeta)^+$ are below $\Lambda$."

共尾性部分证明 `03-categoricity.tex:237-248`：

> "Put $\kappa=\xi^+$. This is a regular cardinal and a limit ordinal. The beth sequence is strictly increasing and continuous at limit ordinals, so $\Lambda=\sup_{\alpha<\kappa}\beth_\alpha$. This gives $\operatorname{cf}(\Lambda)\le\kappa$. Conversely, a set of fewer than $\kappa$ ordinals below $\Lambda$ can be bounded by beth values with fewer than $\kappa$ indices. Regularity of $\kappa$ bounds these indices below $\kappa$, and therefore bounds the original set below $\Lambda$. This proves $\operatorname{cf}(\Lambda)=\kappa$."

强极限与指数部分 `03-categoricity.tex:250-264`：

> "Given an infinite cardinal $\nu<\Lambda$, choose $\alpha<\kappa$ with $\nu\le\beth_\alpha$. Since $\alpha+1<\kappa$, $2^\nu\le 2^{\beth_\alpha}=\beth_{\alpha+1}<\Lambda$. Thus $\Lambda$ is a strong limit. It is also a limit cardinal: for every cardinal below it, a strictly larger beth value still lies below it. In particular $\xi<\Lambda$, and for infinite $\zeta<\Lambda$, $\xi^\zeta\le (2^\xi)^\zeta=2^{\xi\cdot\zeta}<\Lambda$. The last inequality uses $\xi\cdot\zeta<\Lambda$ and strong limitness. The successor of $\xi^\zeta$ is also below the limit cardinal $\Lambda$."

**(b) 中间步骤补全。**

$\Lambda=\sup_{\alpha<\kappa}\beth_\alpha$：$\Lambda=\beth_\kappa$，而 $\kappa=\xi^+$ 作为后继基数（取初始序数）是极限序数，$\beth$ 在极限指标处按定义连续，故 $\beth_\kappa=\sup_{\alpha<\kappa}\beth_\alpha$。这条连续性同时发两张通行证：共尾上界（显式的长 $\kappa$ 尾共尾列 $\alpha\mapsto\beth_\alpha$）与"$\Lambda$ 是极限基数"。

共尾下界那句压缩得最狠，补开：设 $Y\subseteq\Lambda$ 且 $\vert Y\vert<\kappa$。对每个 $y\in Y$，由 $y<\Lambda=\sup_{\alpha<\kappa}\beth_\alpha$ 存在 $\alpha_y<\kappa$ 使 $y<\beth_{\alpha_y}$。指标集 $\{\alpha_y:y\in Y\}$ 势 $<\kappa$，$\kappa$ 正则蕴其上确界 $\alpha^\ast<\kappa$；再由 $\alpha^\ast+1<\kappa$（$\kappa$ 是极限序数）得 $Y\subseteq\beth_{\alpha^\ast+1}<\Lambda$，即 $Y$ 在 $\Lambda$ 内有界。$Y$ 任意，故 $\operatorname{cf}(\Lambda)\ge\kappa$，与上界合起来取等。正则性用在"少于 $\kappa$ 个 $<\kappa$ 的序数的 sup 仍 $<\kappa$"，即后继基数的正则性，ZFC 定理，不需要 CH。

强极限步补三处依据：$\nu\le\beth_\alpha$ 时 $2^\nu\le 2^{\beth_\alpha}$ 是幂集单调；$2^{\beth_\alpha}=\beth_{\alpha+1}$ 是 $\beth$ 的后继定义；$\alpha+1<\kappa$ 是 $\kappa$ 的极限性。合起来对每个 $<\Lambda$ 的无穷基数都成立，正是"强极限"的定义式。

$\xi^\zeta$ 那条补一处读法与一处不等式：论文写 $\xi^\zeta\le(2^\xi)^\zeta$，用的是 $\xi\le 2^\xi$ 的单调幂；指数律 $(2^\xi)^\zeta=2^{\xi\cdot\zeta}$ 是基数算术定理；$\xi\cdot\zeta=\max(\xi,\zeta)<\Lambda$ 需要 $\xi<\Lambda$（论文在 `03-categoricity.tex:257` 单独点出 "In particular $\xi<\Lambda$"，来源是 $\xi<\beth_\xi\le\beth_{\xi^+}$ 的严格增）与 $\zeta<\Lambda$（假设），再因 $\Lambda$ 是极限基数而最大值仍 $<\Lambda$。$(\xi^\zeta)^+<\Lambda$ 依赖 `03-categoricity.tex:255-257` 那句"also a limit cardinal"：极限基数下面没有最大基数。

**(c) 机械理由。**

- **四条结论各自的消费者，逐条钉行号。** $\operatorname{cf}(\Lambda)=\xi^+>\xi$ 只被 `03-categoricity.tex:429` 用（抽色步 $\vert C_{j+1}\vert\le\xi<\operatorname{cf}(\Lambda)$）；强极限被 `03-categoricity.tex:259-261`（$\xi^\zeta<\Lambda$ 自身）与 `03-categoricity.tex:290-292` 用，后者论文写了 "where the last inequality follows from Lemma~\ref{cat:cardinals}"，即 $\mu=q^+<\Lambda$ 完全挂在本引理上；$\delta<\Lambda$ 参与 `03-categoricity.tex:617` 的 $\vert B^M\vert\le\delta<\Lambda\le\mu$ 链条（$\delta<\Lambda$ 由 $\delta<\xi\le\xi^\aleph_0<\Lambda$ 或更直接地 $\delta<2^\delta=\xi<\beth_\xi\le\Lambda$）。
- **$\Lambda>\beth_\eta=H(K)$ 的出处在本引理之外。** `05-conclusion.tex:13-16` 用 Cantor 定理 $\xi=2^\delta\ge\delta^+=\eta$，故 $\xi^+>\eta$，$\beth$ 严格增给 $\Lambda=\beth_{\xi^+}>\beth_\eta=H(K)$。这一步不经过 $\operatorname{cf}$ 或强极限：本引理管"$\Lambda$ 之下的算术"，`05-conclusion.tex:13-16` 管"$\Lambda$ 与 $H(K)$ 谁大"。第一轮 8.2 把两件事列在同一行（"cf(Λ)=ξ⁺>ξ、ξ^ζ<Λ"），第二轮分开，并把"$\Lambda>H(K)$ 需要 $\eta=\omega_2$ 而 $\omega_2$ 需要 CH"这条依赖显式写进依赖链。
- **CH 在本引理的使用次数：零。** $\xi=2^\delta$、$\delta=\omega_1$ 在 `03-categoricity.tex:7-8` 无条件定义；$\Lambda=\beth_{\xi^+}=\beth_{(2^{\aleph_1})^+}$ 与 `00-introduction.tex:94` 的写法吻合，这条吻合本身也不需要 CH（$\xi=2^{\aleph_1}$ 直接由 $\delta=\omega_1$）。CH 的三处进入点：`03-categoricity.tex:452`（$\vert S\vert=\delta$）、`05-conclusion.tex:5-7`（$H(K)=\beth_{\omega_2}=\beth_\eta$）、`00-introduction.tex:88` 与 `05-conclusion.tex:4`（"Work in ZFC with CH" 的总入口）。
- **$\eta$ 与 $\xi$ 的关系是 CH 的靶，也是本引理改动的断点。** 若 CH 失效而仍沿用 `04-endpoint.tex:6` 的 $\delta=\omega_1,\ \eta=\delta^+=\omega_2$，则 $H(K)=\beth_{(2^{\aleph_0})^+}$ 的指标 $(2^{\aleph_0})^+$ 可能达到甚至超过 $\xi^+$（例如 $2^{\aleph_0}=2^{\aleph_1}=\aleph_2$ 时 $(2^{\aleph_1})^+=\aleph_3=(2^{\aleph_0})^+$，$\Lambda=H(K)$），主定理的 (ii)(iii) 同时成立就会自相矛盾（$\Lambda$ 处既"至少两个模型"又"唯一"）。所以 `03-categoricity.tex:228-235` 的结论本身与 CH 无关，**受 CH 影响的是 $\Lambda$ 与 $H(K)$ 的相对位置**。若改用 $\delta=2^{\aleph_0},\ \eta=(2^{\aleph_0})^+$ 重跑端点构造，`03-categoricity.tex:7` 的 $\delta=\omega_1$ 与 §1 编码引理（`01-colors.tex:72`）钉住的 tag 层都要换，那是第一轮 4.3 记过的"δ 被编码引理固定"这颗钉。论文没有讨论 $\neg\mathrm{CH}$ 下能否重跑，我不替它补，登记为缺口 G3。

**(d) 失败路线。**

- `[推测]` 把 $\Lambda$ 降到 $\beth_\xi$：$\operatorname{cf}(\beth_\xi)=\operatorname{cf}(\xi)$（$\beth$ 连续），当 $\operatorname{cf}(\xi)=\omega$ 时 $\operatorname{cf}(\Lambda)\le\xi$，`03-categoricity.tex:429` 的抽色要求 $\xi<\operatorname{cf}(\Lambda)$，直接断；即使挑 $\xi$ 使 $\operatorname{cf}(\beth_\xi)>\xi$，`03-categoricity.tex:263-264` 的 $(\xi^\zeta)^+<\Lambda$ 也断，$\mu=q^+<\Lambda$ 失依据。
- `[推测]` 假设 $\Lambda$ 强不可达以换取更整齐的算术：公理成本抬到可及基数级别，而主定理只声明 CH（`00-introduction.tex:88`）；`05-conclusion.tex:74-77` 的相对一致性步只用 Gödel 的 $L$ 模型，$L$ 里没有可及基数，这条替换会把 $\operatorname{Con}$ 链条整个作废。
- `[推测]` 把 $\xi=2^\delta$ 换成 $\delta^{+\omega}$：`03-categoricity.tex:455-457` 的 $\vert S^{B^M}\vert\le\delta^\delta=2^\delta$ 是实算出来的上界，与 $\xi$ 的定义绑死；换定义后除非额外假设 $2^\delta\le\delta^{+\omega}$，否则 `cat:bounded` 的调色板计数没有依据。

### 9.4 `cor:consistency`：从构造到 $\operatorname{Con}$ 层面的那句单向话

**(a) 逐字引用。** $\Theta$ 的写法 `05-conclusion.tex:24-34`：

> "For a literal first-order consistency statement, let $\Theta$ assert that there is a set $p=(\iota_k:k\ge1)$ of coding maps as in Lemma~\ref{col:coding} for which the particular formulas of Definition~\ref{aec:objects} define an AEC $K_p$ with $\operatorname{LS}(K_p)=\aleph_0$, two nonisomorphic models of cardinality $h(\aleph_0)$, and categoricity in $\Lambda^+>h(\aleph_0)$, where $\Lambda=\beth_{(2^{\aleph_1})^+}$. Here the fixed definitions and the AEC and categoricity conditions are expanded into one sentence of set theory; all quantified parameters, structures, maps, and sequences are sets."

$\Phi$ 的处理 `05-conclusion.tex:36-44`：

> "For the statements involving $\Phi$, fix a first-order formulation of the universal assertion~\eqref{eq:target} such that ZFC proves its implication to the following fixed-family instance: for every valid $p$, if $K_p$ is an AEC with $\operatorname{LS}(K_p)=\aleph_0$, $\Lambda^+>h(\aleph_0)$, and categoricity in $\Lambda^+$, then $K_p$ is categorical in $h(\aleph_0)$. The conclusions about $\Phi$ below are read separately for each such formulation. In particular, ZFC proves $\Theta\Rightarrow\neg\Phi$."

推论本身 `05-conclusion.tex:46-57`：

> "ZFC proves $\mathrm{CH}\Rightarrow\Theta$. For each fixed $\Phi$ as above, it also proves $\mathrm{CH}\Rightarrow\neg\Phi$, and $\operatorname{Con}(\mathrm{ZFC})\Longrightarrow\operatorname{Con}(\mathrm{ZFC}+\Theta)\Longrightarrow\operatorname{Con}(\mathrm{ZFC}+\neg\Phi)$. If ZFC is consistent, no such $\Phi$ is a theorem of ZFC."

Gödel 步与单向性声明 `05-conclusion.tex:74-88`：

> "G\"odel's relative-consistency theorem \cite{Godel1938} gives $\operatorname{Con}(\mathrm{ZFC})\Rightarrow\operatorname{Con}(\mathrm{ZFC}+\mathrm{CH})$. Since the latter theory proves $\Theta$, its consistency implies $\operatorname{Con}(\mathrm{ZFC}+\Theta)$, and the proved implication $\Theta\Rightarrow\neg\Phi$ then gives $\operatorname{Con}(\mathrm{ZFC}+\neg\Phi)$."

> "The corollary gives one-sided nonprovability, not independence in both directions: neither an unconditional ZFC proof of $\neg\Phi$ nor consistency of $\Phi$ is asserted."

**(b) 中间步骤补全。**

$H(K)$ 在 $\Theta$ 里为何写成 $h(\aleph_0)$：`00-introduction.tex:21` 定义 $h(\kappa)=\beth_{(2^\kappa)^+}$。$\Theta$ 要是一句**不带"由本篇构造得出的 $K$"** 的一阶语句，而 $H(K)=h(\operatorname{LS}(K))$ 在 $\operatorname{LS}(K)=\aleph_0$ 时就是 $h(\aleph_0)$；`05-conclusion.tex:5-7` 那行 CH 下的等式 $H(K)=\beth_{(2^{\aleph_0})^+}=\beth_{\omega_2}=\beth_\eta$ 只出现在证明里。这个分别我第一轮没看透：$\Theta$ 必须能被 $L$ 满足，所以它自己不能含 CH，也不能含"$K$ 是本文那个类"的指称，只能用参数 $p$ 把类内建进公式。

"$\mathrm{CH}\Rightarrow\Theta$ 在 ZFC 内可证"（`05-conclusion.tex:61-66`）的实质：类与强关系由固定公式给出，唯一自由参数是编码映射集 $p$。于是一阶集合论里有公式 $\varphi_K(x)$ 与 $\varphi_{\le_K}(x,y)$，把 AEC 的每条公理、两个模型的存在性、以及"$\mu\ge\Lambda^+$ 处唯一"逐条展开成有限长合取；证明该蕴含就是把这些展开在 ZFC 内验一遍，等于复述 §2–§4 全部论证。论文只声明"expanded into one sentence"，没有写出展开式，也没有给出长度或公式编号，这处我登记为缺口 G1。

$\operatorname{Con}$ 链条里被跳过的两个逆否，补开。第一个：若 $\mathrm{ZFC}+\Theta$ 不一致，则 $\mathrm{ZFC}\vdash\neg\Theta$，于是 $\mathrm{ZFC}+\mathrm{CH}$ 也证 $\neg\Theta$；又 $\mathrm{ZFC}\vdash\mathrm{CH}\Rightarrow\Theta$，故 $\mathrm{ZFC}+\mathrm{CH}$ 不一致。逆否即 $\operatorname{Con}(\mathrm{ZFC}+\mathrm{CH})\Rightarrow\operatorname{Con}(\mathrm{ZFC}+\Theta)$。第二个：若 $\mathrm{ZFC}+\Theta$ 一致而 $\mathrm{ZFC}+\neg\Phi$ 不一致，则 $\mathrm{ZFC}\vdash\Phi$；配上 $\mathrm{ZFC}\vdash\Theta\Rightarrow\neg\Phi$ 得 $\mathrm{ZFC}\vdash\neg\Theta$，与 $\mathrm{ZFC}+\Theta$ 一致矛盾。

末句"ZFC 一致则无此类 $\Phi$ 可证"的完整反证（`05-conclusion.tex:57`、`05-conclusion.tex:82-83` 只给了一句）：设 $\mathrm{ZFC}$ 一致且 $\mathrm{ZFC}\vdash\Phi$。Gödel 给 $\operatorname{Con}(\mathrm{ZFC}+\mathrm{CH})$；$\mathrm{ZFC}\vdash\mathrm{CH}\Rightarrow\Theta$ 使 $\mathrm{ZFC}+\mathrm{CH}\vdash\Theta$；$\mathrm{ZFC}\vdash\Theta\Rightarrow\neg\Phi$ 使 $\mathrm{ZFC}+\mathrm{CH}\vdash\neg\Phi$；与 $\mathrm{ZFC}\vdash\Phi$ 冲突，故 $\mathrm{ZFC}+\mathrm{CH}$ 不一致，矛盾。逐形式化都成立，因为 $\Theta\Rightarrow\neg\Phi$ 按 `05-conclusion.tex:42-43` 是对每个固定形式化分别证的。

**(c) 机械理由。**

- **为何 $\Theta$ 用 $\Lambda^+$ ，并非 $\Lambda$**（`05-conclusion.tex:30`、`05-conclusion.tex:40`）：靶子断言（论文记作 `eq:target`，见 `05-conclusion.tex:37`）的前提形态是"某个高于 $\operatorname{LS}(K)$ 的后继范畴基数"；`00-introduction.tex:65-67` 引 Vasey 的定理也是从 successor categoricity cardinal 出发。$\Lambda^+$ 由 `cat:tail`（`03-categoricity.tex:603`，含 $\mu=\Lambda$ 本身，见 `03-categoricity.tex:626`）当然范畴，选它是贴靶子的形状，数学上不必需。
- **$\Lambda^+>h(\aleph_0)$ 是 $\Theta$ 的合取支**（`05-conclusion.tex:31`）：它靠 `05-conclusion.tex:13-16` 的 $\Lambda>H(K)$，即 Cantor $\xi\ge\eta$ 与 $\beth$ 严格增；因此 $\Theta$ 的一致性把 CH 下的等式 $H(K)=\beth_\eta$ 一起打包了。若有人把 $\Theta$ 里这条不等式删掉，$\Theta$ 在 $\neg\mathrm{CH}$ 的模型里可能自相矛盾。
- **CH 进入点的 tex 与 Lean 对应**：tex 三处见 9.3 (c)；Lean 侧本轮实测 `ComparatorChallenges/CHObstruction.json` 的 `permitted_axioms` 只含 `propext`/`Quot.sound`/`Classical.choice`，`theorem_names` 只含 `OAI.CHObstruction.main`，`solution_module` 为 `OAI.ModelTheory.Categoricity.Main`，`enable_nanoda` 为 false。模块目录 `OAI/ModelTheory/Categoricity/` 实到 15 个 .lean 文件（AEC、ArrayEmbeddings、ArrayIsomorphisms、ArrayMaps、Arrays、Collapse、Colors、Diagrams、DirectedLimits、EndpointDiagrams、Main、Model、Partition、Subarrays、TailBound）。permitted axioms 里没有 CH 型公理，说明 CH 在 Lean 侧是 `main` 的假设，并非 axiom，与 tex 的"ZFC 证明蕴含式"口径一致。$\vert S\vert=\delta$ 对应 `Colors.lean` 的界引理，$H(K)=\beth_\eta$ 的重合对应 `Main.lean` 里 `endpoint = hanf ℵ₀` 那条等式（第一轮 7.2 已核）。
- **诚实声明的位置与作用**（`05-conclusion.tex:86-91`）：它把结论限定为单向不可证，两处空白（$\mathrm{ZFC}\vdash\neg\Phi$ 与 $\operatorname{Con}(\mathrm{ZFC}+\Phi)$）论文明说未断言。我把它们记为 G2、G3，不去猜论文"其实可以"。

**(d) 失败路线。**

- `[推测]` 想补"$\Phi$ 与 ZFC 一致"以凑独立性：需要 $\neg\Theta$ 的相对一致性，等于在被规定界处证转移，即原猜想本身；循环。
- `[推测]` 想把 $\Theta$ 里的 $h(\aleph_0)$ 写成 $H(K_p)$：$\operatorname{LS}(K_p)=\aleph_0$ 本身是 $\Theta$ 的合取支（`05-conclusion.tex:28-29`），$H(K_p)$ 的定义要外折叠加一层"最小无穷 $\theta$"的量词，展开式变复杂而结论不变，纯亏。
- `[推测]` 想用 forcing 抬高 $2^{\aleph_0}$ 使 $\Phi$ 有机会成立：`05-conclusion.tex:13-16` 的 $\Lambda>H(K)$ 会反号（见 9.3 (c) 的 $\aleph_2$ 例），但 `cat:tail` 依赖 $\operatorname{cf}(\Lambda)=\xi^+>\xi$ 与 $\xi=2^{\aleph_1}$ 在扩张后的取值，同时端点构造需要 $\vert S\vert=\delta$ 即 CH；两条拉扯之下我没找到干净方案，记为未试成。

## 十、我走过的错路（第二轮补记）

第一轮我在第八节记了五条"设计收敛"，那是从成功侧回看。这一节记纯粹的错路：我确实按错的形状想过，并且现在能从论文文本里指出它为什么必须错。每条给反证的 tex 位置（行号）或失效的具体理由。

### 10.1 想用一次 Erdős-Rado 拿到共同无穷齐次集

走进去的理由很自然：`cat:finite-patterns` 的结论长得像分划定理的弱化版，而我习惯把分划问题一步做到底（拿一个 $Y$ 同时齐次于所有 $c_j$）。反证文本两处：`03-categoricity.tex:395-396` 明写这一步 "combines the finite partition estimates without asserting the existence of a common infinite homogeneous subset"；`03-categoricity.tex:493-494` 更直白："The proof uses only countably many full-tuple exceptional sets; it does not seek a coordinate good for every tuple in $I^M$."

失效的具体理由（这是集合大小的差别，与写法无关）：`cat:bounded` 需要选一个 $b\in B^M$ 同时躲开所有见证元组的例外集，它躲的是 $E=\bigcup_{1\le k<\omega}E_k$（`03-categoricity.tex:474-476`），可数个可数集之并可数，而 $B^M$ 不可数（`03-categoricity.tex:477-478`），故躲得开。若改成"共同齐次集"路线，我要的 $b$ 得对 $I^M$ 的**所有**元组都好，例外集变成 $\bigcup_{t\in I^{<\omega}}E_t$，项数 $\ge\Lambda$，并集完全不可数，$B^M$ 减去它可能为空。这一条差异就是弱形式存在的理由。

### 10.2 想把支配函数全局化（找一个保序投影 $\eta\to\delta$）

我一开始想要一个 $\pi:\eta\to\delta$ 满足 $\alpha<\alpha'\Rightarrow\pi(\alpha)\le\pi(\alpha')$，这样端点图的秩可以直接换算成 tag，例外集统一处理。反证文本：`04-endpoint.tex:28-29` 论文的做法是**对每个** $\alpha<\eta$ 分别固定单射 $j_\alpha:\alpha\to\delta$，并写明 "These form a set-sized family of choices"（承认用了选择）；`04-endpoint.tex:33-38` 的 $f_\alpha$ 由 $\sup\{f_\gamma(\beta)+1:\gamma<\alpha,\ j_\alpha(\gamma)<\beta\}$ 逐坐标递归；`04-endpoint.tex:45-51` 的结论是例外集 $E_{\gamma,\alpha}\subseteq j_\alpha(\gamma)+1$ **依赖坐标 $\beta$**。

必然失效的理由有两条，都硬。其一：$\eta=\delta^+$ 的定义就是 $\delta$ 之后的第一个基数，故不存在单射 $\omega_2\hookrightarrow\omega_1$；任何"全局保序"必须放弃单射，而放弃单射就无法区分 $\gamma,\gamma'$ 的秩。其二：即使只要求不减，$\omega_1$ 上长 $\omega_2$ 的不减序列必定最终常值（$\omega_1$ 正则），常值就丢掉全部不等式。论文的逐坐标局部化把两条都绕开：每个 $\beta$ 处递归里出现的项数可数（因 $j_\alpha$ 单射且 $\beta$ 是可数序数），$\sup$ 仍在 $\delta$ 内（`04-endpoint.tex:39-43`，用了 "Regularity of $\omega_1$"），把不可数长度的困难压进"每个坐标只见可数多事"。

### 10.3 想用颜色层不变量区分端点双模型

我以为两个模型要靠 $2^\omega/=^*$ 上的颜色族不同来分开，毕竟 §1 的整个设计就是让颜色存活。反证文本：`04-endpoint.tex:360-364` 给出的分离只用"同构保持序排序的一元谓词"，于是 $\aleph_1$ 的基座与可数的基座不能等同；`04-endpoint.tex:353-354` 里可数基座模型 $M_{\mathrm c}$ 取的是常值零序列（原文 "base order $B=\mathbb Q$, and constant zero sequences $a_{t,b}$"）。颜色层要比较，得先把两个模型的列指标对齐，而两者基座势不同，连"在同一列上比较"都无从谈起。

更深一层的失效理由写在机制概述里：`00-introduction.tex:126-128` "When $B$ is countable, these changes absorb every matrix of bits. All models in $K$ with countable base orders and equally sized index sorts are therefore isomorphic." 可数基座下颜色被原点平移吸收干净，颜色作为不变量在可数侧恒等于不存在。所以分离只靠基座势这条粗线，颜色负责的是**上界**（`cat:bounded`），分离侧用不上它。我第一轮把两件事挤在第五节一句话里，第二轮分开钉。

### 10.4 以为主定理要靠 AP、JEP 或既存转移定理搭骨架

我一开始准备先证 K 有 amalgamation（或至少 JEP），再用 Vasey 型 downward transfer 把范畴性从 $\Lambda^+$ 拉下来，当作 (iii) 的短路。反证文本三处：`05-conclusion.tex:95-97` "the construction fails both joint embedding and amalgamation, although neither failure was needed as an input to the proof"；`05-conclusion.tex:101-104` 命题本身（两个都失败，且 AP 的失败可在可数模型上见证）；`00-introduction.tex:108-109` "The construction and both cardinal bounds are proved here without a qualitative eventual-categoricity theorem."

失效的具体机制就在 `05-conclusion.tex:106-124`：取不可数基座模型 $M$ 与只放大指标排序到 $\Lambda^+$ 的扩张 $N$（`05-conclusion.tex:109-116`，基座不动使强包含条件空虚成立），若两者有公共强扩张 $P$，则 $B^P$ 不可数**且** $\lvert I^P\rvert\ge\Lambda^+$，直接违反 `cat:bounded`（`05-conclusion.tex:118-121`）。也就是说 (iii) 的证明与 AP 的存在互相排斥：AP 一旦成立，`cat:bounded` 就得失效，而后者是尾部范畴的唯一引擎。这里不存在"先用 AP 再用转移"的路；AP、JEP 的失败是本构造的产出。

### 10.5 以为 $\Theta$ 里该写 $H(K)$，并把 CH 写进语句

写第一版笔记时我以为一致性语句 $\Theta$ 会含 CH（标题毕竟是 CH obstruction）。反证文本：`05-conclusion.tex:28-31` 里 $\Theta$ 用的是 $h(\aleph_0)$ 与 $\Lambda=\beth_{(2^{\aleph_1})^+}$，两条都是无条件写法；CH 只出现在 `05-conclusion.tex:47`（"ZFC proves $\mathrm{CH}\Rightarrow\Theta$"）的**前件**位置。理由：`05-conclusion.tex:74-77` 的 Gödel 相对一致性要把 $\Theta$ 塞进 $\mathrm{ZFC}+\mathrm{CH}$ 的模型，若 $\Theta$ 自身含 CH，它就不再是"被 CH 推出的内容"，$\operatorname{Con}(\mathrm{ZFC})\Rightarrow\operatorname{Con}(\mathrm{ZFC}+\Theta)$ 的读法会变模糊；更关键的是 $\Theta$ 要作为**一阶集合论句子**参与 $\operatorname{Con}$ 编码（`05-conclusion.tex:32-34`），把公理搬进定理对不可证性陈述毫无增益。

### 10.6 以为 $\operatorname{LS}(K)=\aleph_0$ 全凭 `aec:ls` 的构造性论证

`aec:ls`（`02-aec.tex:575`）证的是上界方向（每个模型有可数强子模型），而 $\operatorname{LS}(K)\ge\aleph_0$ 是定义约束。反证文本 `02-aec.tex:710-715`：证明 aec:class 时论文用 "Since the language is countable and $\operatorname{LS}(K)$ is by definition infinite, its least possible value is $\aleph_0$"。下界来自两处定义事实（语言可数、$\operatorname{LS}$ 取无穷基数），一行构造都不用。我第一轮在第五节把 $\operatorname{LS}(K)=\aleph_0$ 整体归给 `aec:ls`，属记账错误。这条错误会改变台账里"若改动断在哪一步"的读法：若把语言加一个不可数关系符号，上界仍在（构造可扩），下界立刻 $\ge\aleph_1$，$H(K)$ 上移一层，端点模型就不在被规定界处了。

## 十一、常数与依赖台账

### 11.1 台账

表内位置一律"分片名:行号"，全部本轮在 `build\sections\` 下逐行核出；核不到的符号我没有写进来。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\delta$ | $\omega_1$（固定值） | 03-categoricity.tex:7 | 调色板界 `03-categoricity.tex:456`；tag 层 `04-endpoint.tex:18`；塌缩值域 `03-categoricity.tex:194` | 与 §1 编码引理 `01-colors.tex:72` 钉死；改大使端点图 tag 溢出 $\delta$，改小使 $\lvert S\rvert=2^{\aleph_0}$ 超过 $\delta$ |
| $\eta$ | $\delta^+=\omega_2$ | 04-endpoint.tex:6 | $D=V_\eta$ `04-endpoint.tex:98`；$\lvert I^{M_{\mathrm u}}\rvert=\beth_\eta$ `04-endpoint.tex:346` | 改小则端点势低于 $H(K)$（`05-conclusion.tex:7`），主定理 (ii) 落空；改大则不在被规定界处 |
| $\operatorname{LS}(K)$ | $\aleph_0$ | 00-introduction.tex:91 | $H(K)=h(\operatorname{LS}(K))$ `00-introduction.tex:21` | 语言加不可数符号使下界升到 $\aleph_1$（下界论证在 `02-aec.tex:710-715`），$H(K)$ 上移一层 |
| $h(\kappa)$ | $\beth_{(2^\kappa)^+}$（两层跳） | 00-introduction.tex:21 | $H(K)$ 与 $\Theta$ `05-conclusion.tex:29-31` | 指数不带 $+$ 则 $H(K)$ 不再是存在界形态，`00-introduction.tex:58-61` 的引用对象改变 |
| $H(K)$ | $\beth_{(2^{\aleph_0})^+}=\beth_{\omega_2}$（用 CH） | 05-conclusion.tex:7 | thm:main (ii) `00-introduction.tex:93` | 去 CH 后指标停在 $(2^{\aleph_0})^+$，`05-conclusion.tex:16` 的 $\Lambda>H(K)$ 可能反号 |
| $\Lambda$ | $\beth_{(2^{\aleph_1})^+}$ | 00-introduction.tex:94 | 尾部范畴 (iii) `00-introduction.tex:95-96` | 必须与 `03-categoricity.tex:8` 的 $\beth_{\xi^+}$ 同值，否则 `cat:tail` 与主定理 (iii) 谈的是两个基数 |
| $\xi$ | $2^\delta=2^{\aleph_1}$ | 03-categoricity.tex:7 | 调色板 $\delta^\delta=2^\delta$ `03-categoricity.tex:456`；$\xi<\operatorname{cf}(\Lambda)$ `03-categoricity.tex:429` | 若 $\lvert S^{B^M}\rvert>\xi$，`cat:finite-patterns` 的 $\lvert C_j\rvert\le\xi$ 前提断，`cat:bounded` 全线断 |
| $\operatorname{cf}(\Lambda)$ | $\xi^+>\xi$ | 03-categoricity.tex:231 | 抽色步 `03-categoricity.tex:429`（全篇唯一用途） | 若 $\operatorname{cf}(\Lambda)\le\xi$，$\xi$ 个界可共尾于 $\Lambda$，无颜色能覆盖共尾一族目标 |
| $\Lambda$ 的表示 | $\sup_{\alpha<\kappa}\beth_\alpha$，$\kappa=\xi^+$ | 03-categoricity.tex:242 | 共尾上界与"极限基数"两条 `03-categoricity.tex:244`、`03-categoricity.tex:255-257` | $\kappa$ 若奇异则正则性论证 `03-categoricity.tex:244-248` 失效 |
| $2^{\beth_\alpha}$ | $\beth_{\alpha+1}$（幂集定义） | 03-categoricity.tex:253 | 强极限结论 `03-categoricity.tex:255` | 换成 $\aleph$ 层写法需 GCH；本行是"该处不需 CH"的凭证 |
| $\xi^\zeta$ | $\le 2^{\xi\cdot\zeta}<\Lambda$（$\zeta<\Lambda$ 无穷） | 03-categoricity.tex:259-260 | $q=\xi^\zeta$ `03-categoricity.tex:290` | 若 $\xi^\zeta\ge\Lambda$，树节点计数 `03-categoricity.tex:348-352` 不 $<\Lambda$，源基数选不出 |
| $(\xi^\zeta)^+$ | 仍 $<\Lambda$ | 03-categoricity.tex:263-264 | $\mu=q^+<\Lambda$ `03-categoricity.tex:291` | $\Lambda$ 若非极限基数则该后继可越过 $\Lambda$，`cat:finite-partition` 的归纳步断 |
| $\mu$（$m=1$） | $(\max(\xi,\chi))^+$ | 03-categoricity.tex:279 | 鸽笼 `03-categoricity.tex:281-283` | 取 $\mu=\chi$ 则 $\xi\cdot\chi<\mu$ 失，"某色类 $\ge\chi$"不成立 |
| $q,\mu$（归纳步） | $q=\xi^\zeta$、$\mu=q^+$ | 03-categoricity.tex:290-291 | 未命名点 `03-categoricity.tex:356-357` | 若 $\mu\le q$，$\mu$ 个点可全被命名，找不到 $x$，arity 归约断 |
| $\iota_\alpha$ | ${}^{[\alpha+1]^m}\xi\hookrightarrow q$ | 03-categoricity.tex:302-305 | 分桶 `03-categoricity.tex:325-326` | 存在性理由写在 `03-categoricity.tex:305`（$\lvert[\alpha+1]^m\rvert\le\zeta$）；$\zeta$ 改动则单射不存在 |
| 树节点总数 | $\le\zeta\cdot(\xi^\zeta)^\zeta=q$ | 03-categoricity.tex:348-352 | "至多 $q$ 点被命名" `03-categoricity.tex:355-356` | 依赖 $\zeta\cdot\zeta=\zeta$ 与 $q\ge\zeta$（`03-categoricity.tex:354-355`）；$\zeta$ 有限则不塌回 $q$ |
| 递增枚举剖面 | $j$ 元子集染到 $S^{B^M}$ | 03-categoricity.tex:463-465 | `cat:finite-patterns` 的实例化 `03-categoricity.tex:465` | 良序只在本证明用（`03-categoricity.tex:445`）；去掉递增枚举要求则 $p_j$ 无定义 |
| $\lvert S^{B^M}\rvert$ | $\le\delta^\delta=2^\delta=\xi$ | 03-categoricity.tex:455-457 | 抽色前提 `03-categoricity.tex:465` | 基座势更大则界升为 $\delta'^{\delta'}$，$\Lambda$ 需整体重定义 |
| $\lvert S\rvert$ | $\delta$（CH 的第一使用点） | 03-categoricity.tex:452 | 上一行的指数底数 | 去 CH 则 $\lvert S\rvert=2^{\aleph_0}>\omega_1=\delta$，`cat:bounded` 断，尾部范畴断 |
| $\lvert B^M\rvert$ | $\le\delta$ | 03-categoricity.tex:453 | 上一行；$\delta<\Lambda\le\mu$ `03-categoricity.tex:617` | 界来自 `aec:order-size`（`02-aec.tex:167`）；局部可数性改动则整条链断 |
| $E_k$、$E$ | 逐元组可数；可数个并可数 | 03-categoricity.tex:470-476 | 取 $b\notin E$ `03-categoricity.tex:477-478` | 若要共同坐标则项数 $\ge\Lambda$，可数性失效（见 10.1） |
| $\mu$（模型总势） | $\max(\lvert I^M\rvert,\lvert B^M\rvert,\aleph_0)$ | 03-categoricity.tex:619 | 迫使 $\lvert I^M\rvert=\mu$ `03-categoricity.tex:621` | 公式来自 `aec:size`（`02-aec.tex:190`）；纤维势更大则 $\mu$ 回收不了 $\lvert I\rvert$ |
| $\lvert V_{\omega+\gamma}\rvert$ | $\beth_\gamma$（一般式，ZFC） | 04-endpoint.tex:59 | $\lvert V_\eta\rvert=\beth_\eta$ `04-endpoint.tex:62`；$\lvert V_\delta\rvert=\beth_{\omega_1}$ 用于 `03-categoricity.tex:94` | 只证特例则 `03-categoricity.tex:194` 的 $\lvert Q\rvert\le\lvert V_\delta\rvert$ 无出处 |
| $\lvert X\rvert$（no-pattern） | $>\lvert V_\delta\rvert=\beth_{\omega_1}$ | 03-categoricity.tex:94 | 矛盾收束 `03-categoricity.tex:194` | 取 $\lvert X\rvert\le\lvert V_\delta\rvert$ 则 $\lvert X\rvert\le\lvert Q\rvert\le\lvert V_\delta\rvert$ 不成矛盾，模式禁不掉 |
| $E_{\gamma,\alpha}$ | 可数，且 $\subseteq j_\alpha(\gamma)+1$ | 04-endpoint.tex:51 | end:diagrams 的逐坐标 tag 相容 | 例外不可数则对象条件（逐元组可数例外）断，$M_{\mathrm u}\in K$ 失 |
| $\kappa$（端点势） | $=\beth_\eta$ | 04-endpoint.tex:351 | thm:main (ii) `00-introduction.tex:92-93` | 若 $\kappa\ne H(K)$，"在被规定界处不范畴"变成无关陈述 |
| $\lambda$ | $\Lambda^+>H(K)$ | 00-introduction.tex:98 | $\Theta$ 的前提形态 `05-conclusion.tex:30`、`05-conclusion.tex:40` | 用 $\Lambda$ 也范畴（`03-categoricity.tex:626`），但形状不合后继式靶子 |
| $f_\alpha$ | $\delta\to\delta$（$\alpha<\eta$，长 $\omega_2$ 族） | 04-endpoint.tex:18 | 支配 `04-endpoint.tex:45-51`；端点图 tag | 递归需 $\sup\varnothing=0$（`04-endpoint.tex:37`）；$\alpha$ 达到 $\eta$ 则族缺项，秩无法换算 |
| 全子序列检验输入数 | $2^k-1$（长度 $k$ 的非空子序列） | 01-colors.tex:139 | $T_k((s_{\lvert J\rvert}))$ `03-categoricity.tex:481` | 只检初始子序列则 `col:no-pattern` 限制力不足，模式可以存在 |

### 11.2 依赖链（改动一个常数会沿这条线撞墙）

链条 $\operatorname{LS}(K)\Rightarrow$ 各个 $\beth$ 下标 $\Rightarrow$ CH 的使用点 $\Rightarrow$ 阈值不可规定，逐段展开如下。

$\operatorname{LS}(K)=\aleph_0$（上界由 `aec:ls` 给，下界由语言可数加定义逼出，`02-aec.tex:710-715`）代入 $h(\kappa)=\beth_{(2^\kappa)^+}$（`00-introduction.tex:21`）得 $H(K)=\beth_{(2^{\aleph_0})^+}$；CH 第一次进入（`05-conclusion.tex:7`），把指标 $(2^{\aleph_0})^+$ 认成 $\omega_2=\eta$，于是 $H(K)=\beth_\eta$。另一端，$\delta=\omega_1$（`03-categoricity.tex:7`，与 §1 编码引理 `01-colors.tex:72` 的 tag 层同值）给出 $\xi=2^\delta$ 与 $\Lambda=\beth_{\xi^+}$；$\beth_\eta$ 与 $\beth_{\xi^+}$ 的比较只用 Cantor $\xi\ge\delta^+=\eta$（`05-conclusion.tex:13`）与 $\beth$ 严格增，得 $\Lambda>H(K)$。有了 $\Lambda>H(K)$，才谈得上"高处范畴、被规定界处不范畴"的错位：$\beth_\eta$ 处两个模型靠 $f_\alpha$ 族的逐坐标支配（`04-endpoint.tex:18-54`）与可数闭包端点图（`04-endpoint.tex:107-123`）造出 $M_{\mathrm u}$，其势核算走 $\lvert V_{\omega+\gamma}\rvert=\beth_\gamma$（`04-endpoint.tex:59`）；$\mu\ge\Lambda$ 处唯一走 `cat:tail`，内部依赖 $\lvert B^M\rvert\le\delta<\Lambda\le\mu$（`03-categoricity.tex:617`），再依赖 `cat:bounded`，于是 CH 第二次进入（$\lvert S\rvert=\delta$，`03-categoricity.tex:452`），给出调色板 $\le\xi$，喂给 `cat:finite-patterns`，那里消费 $\operatorname{cf}(\Lambda)=\xi^+>\xi$（`03-categoricity.tex:231`，全篇唯一用途），其源基数合法性由 `cat:cardinals` 的 $\xi^\zeta<\Lambda$、$(\xi^\zeta)^+<\Lambda$（`03-categoricity.tex:259-264`）供给 `cat:finite-partition` 的 $q=\xi^\zeta$、$\mu=q^+$（`03-categoricity.tex:290-291`）；`cat:finite-patterns` 的剖面序列喂给 `col:no-pattern`，后者取 $\lvert X\rvert>\lvert V_\delta\rvert$（`03-categoricity.tex:94`）并由 `col:collapse` 收出 $\lvert X\rvert\le\lvert Q\rvert\le\lvert V_\delta\rvert$（`03-categoricity.tex:194`）。最末端的 $\Theta$（`05-conclusion.tex:24-34`）把这条链打包成一阶句子，Gödel 步（`05-conclusion.tex:74-77`）把 CH 变成前件，给出单向不可证（`05-conclusion.tex:57`）。

三个"若改动"的落点因此很清楚：改 $\delta$ 会撞 §1 的编码层与 CH 使用点；改 $\eta$ 会撞 $H(K)$ 的重认；改 $\Lambda$ 的指数会同时撞 $\operatorname{cf}(\Lambda)>\xi$（抽色）与 $\Lambda>H(K)$（错位方向）。CH 的两处使用彼此独立：一处管色集大小（`03-categoricity.tex:452`），一处管被规定界的 beth 指标（`05-conclusion.tex:7`）；$\Lambda$ 与 $H(K)$ 的相对位置只由后者决定，尾部范畴只由前者决定。

## 十二、缺口登记（论文交给引用或未写出的地方）

按"不替它补"的原则，这里只登记，不做修复。

- **G1，$\Theta$ 的展开式未写出。** `05-conclusion.tex:32-34` 说 "the fixed definitions and the AEC and categoricity conditions are expanded into one sentence of set theory"，但没有给出该句子的公式、长度或逐条展开。风险面：AEC 公理里"对每个有向链取上界"这类量化要展开成一阶集合论句子，涉及 $\le_K$ 是公式还是类（`02-aec.tex:280` 的 Definition aec:objects 给了公式形态），论文把可形式化当显然处理。我的判定：可信度较高，因为 Lean 侧 `AEC.lean`（本轮实测存在于 `OAI/ModelTheory/Categoricity/`）用九字段结构机器验证过同样的公理集；但"$\Theta$ 恰是那句展开"在本篇内没有凭证。
- **G2，单向性。** `05-conclusion.tex:86-88` 明写既不主张 $\mathrm{ZFC}\vdash\neg\Phi$，也不主张 $\Phi$ 一致。缺口在于：某个 $\Phi$ 的形式化会不会强到在 ZFC 内可证否；论文对"每个固定形式化"分别给 $\Theta\Rightarrow\neg\Phi$，对一致性方向没有任何讨论。
- **G3，$\neg\mathrm{CH}$ 下的鲁棒性。** 全篇没有 $\neg\mathrm{CH}$ 的讨论文本；CH 的两个使用点是 `03-categoricity.tex:452` 与 `05-conclusion.tex:5-7`。反例能否在 $\neg\mathrm{CH}$ 下搬到别处（例如把 $\delta$ 换成 $2^{\aleph_0}$ 重跑端点构造），我没有从论文得到任何依据。第一轮 8.1 记的"鲁棒性成为可检验的问题"到此为止，检验本身没做。
- **G4，$H(K)$ 作为存在界的性质。** `00-introduction.tex:58-61` 把"该基数处有模型即可扩到任意大"交给 `\cite[Claim~0.6]{Shelah1999CategoricityAP}`，本篇未重证；我只核对了断言形态（存在性不等于唯一性，`00-introduction.tex:62-64`），对方原文未核。
- **G5，被反驳对象的原文认同。** `00-introduction.tex:74-77` 把靶子定为 `\cite[Theorem~4.1]{Espindola2023Spectra}` 在被规定界处对任意 AEC 的转移；§6 的阻碍只针对 canonical point 穿过 $\neg\neg$-Booleanization 这一个分解因子（`00-introduction.tex:81-85`，`06-booleanization.tex:15` 与 `06-booleanization.tex:153`）。对方论文的约定翻译（site、presentability rank、internal size 的对应）我未核，所以"反驳精确命中"这条只到 B 级。
- **G6，论文 K 与 Lean 的 K 的同一性。** `04-endpoint.tex:332-333` 强调 "The chosen representatives verify that condition; they are not named in the structure."，即选定代表不入语言；Lean 的类只含自由实现（第一轮 7.1）。两侧逐点同一性未证，也不影响主定理真值，但影响"Lean 验的是不是同一个类"。
- **G7（非缺口，反向登记）。** `03-categoricity.tex:23-25` 引 Mostowski 1949，同一句立刻声明 "the construction and its range bound are proved below"，随后 `03-categoricity.tex:41-70` 给出完整递归、界与单射性。这条引用属溯源，不构成论证外包，继续不计入缺口。

术语核对：派单用语"不能被规定"对应 tex 的 prescribed 一词，实测在 `00-introduction.tex:71`（a prescribed bound）、`00-introduction.tex:74-75`（the prescribed bound）、`00-introduction.tex:102`（the prescribed-threshold transfer）。"threshold" 一词我在七个分片里只见到与标题同形的短语，正文没有独立的 threshold 定义句；因此本笔记统一用"被规定界"，不硬造术语。第二轮追加到此为止，下一轮优先做 G1 的展开式核对与 `01-colors.tex:139` 起全子序列检验的逐字重读。

### 12.1 第二轮收尾的订正与追加核验

- **9.1 (c) 的行号要精确化。** 我在那里写"后者是 `04-endpoint.tex:186-200` 一带取 $f_{\operatorname{rank}(\cdot)}$ 的定义域前提"，逐字位置应是 `04-endpoint.tex:204-206`，标签 `end:diagram-tags`，原文 "$\rho_{t,\beta}(\ell)=f_{\operatorname{rank}(q_t(\ell))}(\beta)$"（tex 里写作 `\rank`，是自定义宏）。同一块里的前件：$q_t(J,i)=d_{X_J}(i)$ 在 `04-endpoint.tex:193`；"所有 $q_t$ 的条目落在 $D_X$、且标签 $([k],i)$ 枚举整个 $D_X$ 故 $q_t$ 满射"在 `04-endpoint.tex:208-210`；$R_t$ 用真实属于关系定义在 `04-endpoint.tex:201-203`，其良定义依赖 $D=V_\eta$ 的传递性（`04-endpoint.tex:129`）。结论不变，只是消费点比我原先写的区间早一行到三行；这条订正说明台账的严格度要求：凡写"一带"的位置都不能进表。
- **本轮实测的取证布局**（供下一轮直接复用）：`build\` 下是 `paper.tex`（20 行，装载）、`preamble.tex`（43 行，宏）、`figures`、`references.bib`，正文全部在 `build\sections\*.tex` 七个分片，行数依次为 00-introduction 204、01-colors 203、02-aec 716、03-categoricity 627、04-endpoint 365、05-conclusion 134、06-booleanization 207。§十一台账的每一个位置都落在这七个分片内，没有一个来自 `paper.tex` 或 `preamble.tex`。骨架是先 `grep -n` 抓 `\begin{theorem}` 一类环境与 `\label`，再按行区间定点读；未碰任何 PDF。
- **Lean 三件套的实测行号**：`lean\formalization.yaml` 的书目条目在 `:17-20`（title "A CH obstruction to a prescribed categoricity threshold"、authors、id 指向 `../preprints/A-CH-Obstruction-to-a-Prescribed-Categoricity-Threshold-September-24-2026/paper.pdf`、type article），形式化登记在 `:998-1000` 三行：comparator_config `ComparatorChallenges/CHObstruction.json`、declaration `OAI.CHObstruction.main`、file `OAI/ModelTheory/Categoricity/Main.lean`。json 侧实测：`theorem_names` 只有 `OAI.CHObstruction.main`，`definition_names` 为空数组，`permitted_axioms` 为 `propext`/`Quot.sound`/`Classical.choice`，`enable_nanoda` 为 false；模块目录 `OAI/ModelTheory/Categoricity/` 实到 15 个 .lean 文件（AEC、ArrayEmbeddings、ArrayIsomorphisms、ArrayMaps、Arrays、Collapse、Colors、Diagrams、DirectedLimits、EndpointDiagrams、Main、Model、Partition、Subarrays、TailBound）。我没有对整个 lean 仓做递归检索，因此 TailBound.lean 与 `cat:cardinals`、Partition.lean 与 `cat:finite-partition` 的对应关系仍属命名推断，标 `[推测]`，下一轮要逐字读这两个文件才能升级为凭据。
- **两处第一轮的记账修正**：第一轮 7.2 的"CH 精确进入点清单（机器可查）"与本轮 tex 侧三处（`03-categoricity.tex:452`、`05-conclusion.tex:5-7`、`05-conclusion.tex:4`）方向一致，Lean 侧的 diagram_bound 对应 $\lvert S\rvert=\delta$ 那条、endpoint_eq_hanf 对应 $H(K)=\beth_\eta$ 那条；第一轮 5.3 把 $\operatorname{cf}(\Lambda)=\xi^+>\xi$ 与 $\Lambda>H(K)$ 写成同一段，本轮在 9.3 (c) 拆成两条并给出各自的行号出处。
- **下一轮的入口**：G1 的展开式核对（把 `02-aec.tex:280` 的 Definition aec:objects 与 `03-categoricity.tex:602` 的 `cat:tail` 之间的量化逐条列成一阶句子清单），以及 `01-colors.tex:139` 起的全子序列检验与 `03-categoricity.tex:481` 处 $T_k$ 输入集的对照（$2^k-1$ 这个数在台账里挂了行号，但检验条款本身的逐字引用本轮没做）。`04-endpoint.tex:125-180`（可数闭包的递归与 $F_X$ 的定义）同样是本轮跳过的一段，缺口 G8 记在这里：该段的单调性论证我只读到 `04-endpoint.tex:180-181` 的 "Indeed, \(D_Y\subseteq D_X\), so every edge used to define \(F_Y\) is also used to define \(F_X\)."，前面的构造步骤未逐字核。