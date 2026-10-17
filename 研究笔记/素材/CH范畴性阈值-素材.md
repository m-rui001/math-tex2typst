# CH 范畴性阈值——超详细研究素材

> 论文：*A CH obstruction to a prescribed categoricity threshold*（OAI:A-CH-Obstruction-to-a-Prescribed-Categoricity-Threshold-September-24-2026），2026-09-24。
> TeX 源码：`E:\math\preprints\A-CH-Obstruction-to-a-Prescribed-Categoricity-Threshold-September-24-2026\build\`（paper.tex + sections/00--06）。
> Lean 形式化：`E:\math\lean\OAI\ModelTheory\Categoricity\`（15 个模块），目标声明 `OAI.CHObstruction.main`，comparator 配置 `E:\math\lean\ComparatorChallenges\CHObstruction.json`，permitted axioms：`propext`、`Quot.sound`、`Classical.choice`。
> 本素材用途：为撰写"第一人称反推思维链"笔记提供原始证据。所有 TeX 引文照抄源码（保留 LaTeX 形式）；凡属论文之外的推断一律标 [推测] 并注明。

---

# 一、定理总览

## 1.1 主定理精确陈述（TeX 原文照抄）

论文摘要（`sections/00-introduction.tex` 开头）：

```latex
Assuming the continuum hypothesis, we construct an abstract elementary
class with L\"owenheim--Skolem number \(\aleph_0\) that is categorical in
every sufficiently large cardinal but has at least two nonisomorphic
models of cardinality \(\beth_{\omega_2}\).
Thus categoricity does not transfer down to the proposed bound
\(\beth_{(2^{\aleph_0})^+}\), which equals \(\beth_{\omega_2}\) under CH.
Consequently, if ZFC is consistent, the prescribed-threshold
form of Shelah's categoricity conjecture is not provable in ZFC.
```

主定理 `thm:main`（照抄）：

```latex
\begin{theorem}\label{thm:main}
Assume the continuum hypothesis. There is an abstract elementary class
\(K\) in a countable finitary relational language such that
\begin{enumerate}[label=\textup{(\roman*)}]
 \item \(\LS(K)=\aleph_0\);
 \item \(K\) has at least two nonisomorphic models of cardinality
       \(\beth_{\omega_2}=H(K)\);
 \item putting \(\Lambda=\beth_{(2^{\aleph_1})^+}\),
       the class \(K\) is categorical in every cardinal
       \(\mu\ge\Lambda\).
\end{enumerate}
In particular, \(\lambda=\Lambda^+>H(K)\) is a categoricity cardinal
from which downward transfer to \(H(K)\) fails.
\end{theorem}
```

三个结论各自的作用：
- (i) `LS(K)=ℵ₀`：类足够小，使 `H(K)=h(ℵ₀)=beth_{(2^{ℵ₀})^+}` 是"被规定的阈值"本尊；若 LS 更大，阈值会右移，反例失去针对性。
- (ii) 在 `beth_{ω₂}` 处恰有至少两个互不同构的模型：这正是被规定阈值处的范畴性断言的**否定**（范畴性=恰一个同构型）。
- (iii) 在更高的尾部 `μ≥Λ` 上处处范畴：说明该反例只打击"被规定的下界"，与"定性 eventual categoricity"（存在某个不依赖具体构造的阈值）不矛盾——这是本反例精巧之处：它不是"处处不范畴"的粗糙反例，而是"错位"反例。

## 1.2 "CH 阻碍"的确切含义

**被规定的阈值（prescribed threshold）**。论文将 Shelah 范畴性猜想分为两种形式（引言 §1.1）：

- 定性（qualitative）形式：存在只依赖 κ 的函数 χ(κ)，使得 `LS(K)≤κ` 时，"某个 `λ≥χ(κ)` 处范畴 ⇒ 所有 `μ≥χ(κ)` 处范畴"。阈值不预先指明，由定理给出。
- 被规定形式：阈值**固定**为 Hanf 函数
  ```latex
  h(\kappa)=\beth_{(2^\kappa)^+},\qquad H(K)=h(\LS(K)).
  ```
  即 `eq:target`：
  ```latex
  \begin{equation}\label{eq:target}
   \begin{gathered}
   \text{If \(K\) is categorical in some \(\lambda\ge H(K)\),}\\
   \text{then it is categorical in every \(\mu\ge H(K)\).}
   \end{gathered}
  \end{equation}
  ```
  注意：**不假设 amalgamation、joint embedding、tameness、无极大模型**。两端（`H(K)` 本身与任意大的 μ）都含在断言内。

**CH 阻碍 = 在 CH 下构造一个 AEC，使 (eq:target) 失效**。机制的核心是数值巧合：在 CH 下 `2^{ℵ₀}=ℵ₁`，故

```latex
 H(K)=\beth_{(2^{\aleph_0})^+}=\beth_{\omega_2}=\beth_\eta
```

（结论节的原文，其中 `η=ω₂`）。而论文构造的类在 `beth_{ω₂}` 处有两个模型，在 `Λ=beth_{(2^{ℵ₁})^+} > beth_{ω₂}` 以上处处范畴。于是取 `λ=Λ⁺`：前提"在某个 λ≥H(K) 处范畴"成立，但结论"在 H(K) 处范畴"失败。

**为什么需要 CH？** 两处用到（都在卡片算术层，不在构造的组合层）：
1. `|S|=|2^ω/=^*|=2^{ℵ₀}=δ=ω₁`（Coding 引理中 `δ^{ℵ₀}=(2^{ℵ₀})^{ℵ₀}=2^{ℵ₀}` 需要 CH 把 δ 换成连续统；同时 `2^{ℵ₀}=ℵ₁` 使调色板 S 的基数是 ω₁，从而 `|S^{B^M}| ≤ δ^δ = 2^δ` 这一Palette 估计成立）。[注意：`|S|=2^{ℵ₀}` 本身不需要 CH；需要 CH 的是把它与 δ=ω₁ 等同。]
2. `H(K)=beth_{ω₂}` 与 `Λ=beth_{ξ⁺}`（ξ=2^{ω₁}）的相对位置：`ξ≥δ⁺=η`（Cantor），故 `Λ>H(K)`——"范畴尾部"严格在"双模型点"之上。

**逻辑结论**。论文不直接说"否定 CH 之上的独立"，而是给出精确的一阶表述（结论节）：定义句子 Θ（存在一组编码映射 p=(ι_k)，使固定公式定义的 K_p 满足 AEC 公理、LS=ℵ₀、在 h(ℵ₀) 处两个模型、在 Λ⁺ 处范畴），则 ZFC ⊢ CH⇒Θ；对任意被 ZFC 证明蕴含"固定族实例"的普遍断言 Φ（即 (eq:target) 的某种一阶形式化），ZFC ⊢ Θ⇒¬Φ。于是

```latex
 \Con(\mathrm{ZFC})
 \quad\Longrightarrow\quad
 \Con(\mathrm{ZFC}+\Theta)
 \quad\Longrightarrow\quad
 \Con(\mathrm{ZFC}+\neg\Phi).
```

即：若 ZFC 一致，Φ 不是 ZFC 定理。**这是单侧不可证性，不是双侧独立性**——论文明确说"neither an unconditional ZFC proof of ¬Φ nor consistency of Φ is asserted"。

## 1.3 与经典范畴性理论的对比

- **Morley 定理（1965）**：可数语言完备一阶理论，在一个不可数基数范畴 ⇒ 在所有不可数基数范畴。转移无阈值概念，因为一阶情形结构太受控。本论文的类不是任何一阶理论的模型类（对象条件"坏集可数"不可一阶表达，论文明言 "Neither the countability restrictions nor the condition using these tests needs to be first-order expressible"）。
- **Shelah 的 AEC 框架**：1970 年代中期为无穷逻辑模型类引入。存在性 Hanf 界 `H(K)`：该基数处存在模型、可扩张到任意大（presentation + Ehrenfeucht–Mostowski 方法，引 Shelah 1999 Claim 0.6）；但**存在性≠唯一性≠可向上延拓**。本反例正是钻这个空隙：`beth_{ω₂}` 处有模型、且全类在任意大处有模型（可数基座），但 `beth_{ω₂}` 处不唯一。
- **带 amalgamation + tameness 的转移定理**（如 Vasey 2017, Corollary 9.10）：从 ≥H(K) 的后继范畴基数向下转移到 H(K)。本反例**同时失败于 amalgamation 与 joint embedding**（Proposition prop:no-amalgamation，甚至可在可数模型上 witnessing amalgamation 失败），因此不与这些定理冲突——论文专设一节解释这一点。
- **与 Grossberg 讲义的关系**：两种形式（定性/被规定）的区分与"被规定界可能失败"的可能性在 Grossberg 2021 讲义 Conjectures 4.4–4.6 中已显式分开。
- **与 espíndola 2023 的正面冲突**：`[Theorem 4.1]{Espindola2023Spectra}` 声称对任意 AEC 在被规定界处有转移。本文构造与该断言矛盾，因此论文额外做了两件事：(a) 显式验证全部 AEC 公理（防止"构造的类不是 AEC"的质疑）；(b) 第 6 节给出该证明中"canonical point 步骤"的具体阻碍（稠密余筛 dense cosieve 不被大范畴模型提升），定位分歧点。注意论文措辞极其克制：这是"对该特定分解的阻碍"，不是"该 topos 论证无救"。

## 1.4 构造的全景（引言 §1.2 的机械转述）

两个主料：
- **指标排序 I**：控制模型大小。
- **基座排序 B**：无端点稠密线序，所有有界区间可数（故 `|B|≤ℵ₁`）。

对每个非空有限有序**互异**元组 t⊆I：行纤维以 ω 编号（Z_{t,n}，n<ω），列纤维以 B 编号（W_{t,b}）。行纤维是 `[B]^{<ω}`（对称差群）的 torsor，列纤维是 `[ω]^{<ω}` 的 torsor；语言**不命名原点**。选定每条纤维一个代表元后，比特关系显示为 ω×B 的 0-1 矩阵；换行原点 = 每行改有限多个条目；换列原点 = 每列改有限多个条目。

三个技术机制：
1. **例外与强子结构相容**：对象允许每个元组有可数多个例外列；强包含要求"所有新列对老元组通过检验"。行支撑有限使外部检验与老原点选择**完全无关**（不只是 mod =*）。
2. **局部秩逼近**：ω₂ 长的函数族 `f_α:ω₁→ω₁`（mod 可数递增），让从 `V_{ω₂}` 取的可数隶属图在**除可数多个坐标外**通过秩检验 → 造出基座不可数、大小 `beth_{ω₂}` 的模型。
3. **大指标集的阻碍**：若 `|I|≥Λ` 且 B 不可数，有限分划论证 + 无界样本选取逼出"每个 arity 一个固定颜色、通过一切有限检验"的模式；而该模式被 Mostowski 塌缩（值域 ⊆ V_{ω₁}）否定。

先例与谱系（引言原文）：有限支撑群、无命名原点的 torsor、奇偶关系 —— Hart–Shelah 例子（HartShelah1990 §1）；颜色取 `2^ω/2^{<ω}` 同样是 Hart–Shelah 的做法。本文的推进：**行、列两方向的有限平移 + 局部可数基座耦合**，幸存颜色编码端点阻碍所需的扩展秩图。允许的有限颜色图与秩也出现在 Kolesnikov–Lambie–Hanson 的着色类（KolesnikovLambieHanson2016），但此处图是可数的、且 full-subsequence 检验恰好给出其极限所需的相容性。

## 1.5 章节地图与依赖

```
§1 colors      定义图 (E,R,ρ)、有效图、编码 ι_k:S、限制 ℓ_J、全子序列检验 T_k、
               商图引理 col:quotients；预告"无固定模式"阻碍 col:no-pattern。
§2 aec         AEC 公理定义；基本结构（ torsor+比特律）；基本包含；
               基座基数 ≤ℵ₁ (aec:order-size)；结构大小公式 (aec:size)；
               行选择系统、颜色 c_t^z(b)、代表无关性 (aec:representatives)；
               对象/强包含定义 (aec:objects)；自由实现 (aec:arrays)；
               同构不变/偏序/相干 (aec:order-coherence)；有向并+光滑 (aec:directed)；
               凸包 (aec:convex-hull)；向下 LS (aec:ls)；总装 (aec:class)。
§4 endpoint    支配函数族 f_α (end:domination)；|V_{ω+γ}|=beth_γ (end:hierarchy-size)；
               可数闭包 D_X (end:countable-closures)；图 D_{t,β} 及其性质 (end:diagrams)；
               在对象中实现颜色；两个端点模型 (end:two-models)。
§3 categoricity 塌缩引理 (col:collapse)；无固定模式 (col:no-pattern)；
               基数算术 (cat:cardinals)；有限分划估计 (cat:finite-partition)；
               逐 arity 提取 (cat:finite-patterns)；|I|<Λ 阻碍 (cat:bounded)；
               可数基座同构 (cat:countable-base)；尾部范畴 (cat:tail)。
               （注意 paper.tex 中 04 在 03 之前 input。）
§5 conclusion  thm:main 证明；Θ 与 cor:consistency；失败 JEP/AP (prop:no-amalgamation)。
§6 booleanization 可数模型加基座点 (bool:extension)；countable-model site、
               ¬¬ 拓扑、canonical point (bool:point)；稠密余筛阻碍 (bool:obstruction)；
               与 Espíndola 定理 4.1 的精确比较。
```

章节次序的一个反推信号：端点构造（§4）排在"无固定模式"（§3）**之前**——先要有一个"基座不可数的对象"存在，§3 的上界论证才有目标可言；而 §3 的尾部范畴性又依赖 §2 的可数基座同构。整条逻辑链是"先造出反例点，再证明它是孤岛，再证明岛外全是同构的平原"。

---

# 二、逐引理带批注重构

> 约定：以下每条引理按 (a) 精确陈述（TeX 照抄）、(b) 证明机制逐步展开、(c) 假设/常数的机械性理由、(d) [推测] 候选失败路线 四段记录。`d[i]` 编号对应论文 `\label`。

## 2.0 约定与常备卡片（introduction eq:standing-cardinals）

```latex
\begin{equation}\label{eq:standing-cardinals}
 \delta=\omega_1,\qquad \eta=\delta^+=\omega_2,\qquad
 S=2^\omega/=^*,\qquad \xi=2^\delta,\qquad
 \Lambda=\beth_{\xi^+}.
\end{equation}
```

`=^*` = 除有限多个自然数外相等。"可数"含有限。颜色检验中的"元组"永远指**非空、有限、有序、互异**。子序列保持剩余位置的原顺序。`V_α` 是普通累计层级，与模型的 sort 无关。"We use choice for set-indexed families only"——即只用集合论型的选择公理（对集合参数化的族），不做类选择。beth 层级起点 `beth_0=ℵ₀`；基数后继作为 beth 指标时视为初始序数。

Lean 对应：`Model.lean` 中 `CH := (2)^ℵ₀ = ℵ_ 1`；`hanf κ := beth (succ (2^κ).ord)`；`endpoint := beth (ω_ 2)`；`tailThreshold := beth (succ (2^{ℵ_ 1}).ord)`。Lean 里 beth 的指标是序数，所以"succ 基数 = 初始序数"由 `(succ ξ).ord` 显式写出——这是论文"cardinal successors are identified with their initial ordinals"这句话的形式化落点。

## 2.1 §1 colors：可数图与检验

### 2.1.1 图与有效图（Definition col:diagram）

对正整数 k，`[k]={1,…,k}`，标签集

```latex
 \mathcal L_k
   =\{(J,i):\varnothing\ne J\subseteq[k],\ i<\omega\}.
```

可数无限。一个标签 = "元组位置的非空子集 + 一个整数坐标"。

**arity-k 图** = 三元组 `𝒟=(E,R,ρ)`，E,R 是 `ℒ_k` 上二元关系，`ρ:ℒ_k→δ`。**有效** 当且仅当：
- (i) E 是等价关系；R 与标签 respect E：`aEa' ∧ bEb' ⇒ (aRb ↔ a'Rb') ∧ ρ(a)=ρ(a')`。
- (ii) 在商 `Q_𝒟=ℒ_k/E` 上诱导的 R 满足**严格降秩**：`yRx ⇒ ρ(y)<ρ(x)`；且 R **外延**：不同 x,x′ 的前驱集 `{y:yRx}` ≠ `{y:yRx'}`。
- (iii) 单点标签 `({j},0)`（j∈[k]）落在两两不同的 E-类里。

**批注（机械性理由）**：
- (ii) 的降秩条件使图成为"良基的带秩标记关系结构"，是后面 Mostowski 塌缩的直接输入；(ii) 的外延性保证塌缩是**单射**。(iii) 保证单点标签在极限构造里给出 `|X|` 个互异元素——这正是 no-pattern 矛盾的计数来源。
- 有效图**允许包含"非法"编码**——`𝔇_k` 定义为所有 arity-k 图（含无效的）。这一点专门为端点构造服务：在例外坐标 β∈F_X 处 `𝒟_{t,β}` 可能无效，但仍需编码成颜色（否则颜色函数在例外处无定义）。

Lean 对应：`Diagrams.lean` 的 `structure Diagram A := eqv, rel, tag : Label A → Tag`，其中 `Label A = {J : Finset A // J.Nonempty} × ℕ`（J 非空有限子集——Lean 用 Finset 而非"⊆[k]"，本质相同），`Tag := (ω_ 1).ToType`，即 **Tag 是一个其基数恰为 ℵ₁ 的类型**（Tag := ordinals < ω₁ as a type），`tagOrdinal t = t.toOrd.val`。`Valid` 结构体恰好是 (i)(ii)(iii) 六个字段：equivalence, rel_congr, tag_congr, decreases, extensional, roots。注意 Lean 的 `Label.root a = ({a},0)` 与论文的 `({j},0)` 对应。

[推测] 失败路线候选：
1. 若把 (ii) 的外延性删掉，塌缩引理 col:collapse 的单射性失效，no-pattern 的矛盾在最后一步（`|X|≤|Q|≤|V_δ|`）断裂——但注意：外延性只在塌缩的单射性用到，端点构造的图 D_{t,β} 靠 CountableClosures 的闭包性质获得外延性，若闭包构造少补一轮 witness，`C(A)` 不外延，`diagram_valid` 的 extensional 字段无法证明。
2. 若把 (iii) 改成"单点标签同 E-类"，则 no-pattern 中 `q_u ≠ q_v`（u≠v）不成立，`|X|≤|Q|` 失败，整条矛盾链断裂。
3. 若把 ρ 的值域从 δ 放宽到任意序数，TaggedCollapse 的值域界 `V_{ρ(x)+1}` 变成 `V_δ` 的断言失去意义——必须保证所有 tag < 某固定序数 δ 才能塌进同一个 V_δ。

### 2.1.2 编码引理（Lemma col:coding）

```latex
\begin{lemma}[Coding]\label{col:coding}
There are injections
\[ \iota_k:\mathfrak D_k\longrightarrow S \qquad(k\ge1) \]
whose ranges are pairwise disjoint.
\end{lemma}
```

证明机制，逐步：
1. 每个 `=^*`-类可数（改一个序列在有限多个整数上的值，只有可数多种改法——确切说对每个有限集 F 有 2^{|F|} 种，对所有有限 F 取并可数）。于是由选择，`2^{ℵ₀} ≤ κ·ℵ₀`，其中 κ=|S|。
2. 商不可能可数（否则 2^ω 可数，与 Cantor 矛盾）。无穷基数乘法 + 反向不等式 `κ≤2^{ℵ₀}` 给出 `|S|=2^{ℵ₀}`。
   *中间步骤展开*：κ·ℵ₀ = max(κ,ℵ₀)（无穷基数），若 κ<ℵ₀ 则 κ·ℵ₀=ℵ₀<2^{ℵ₀} 矛盾，故 κ≥ℵ₀，于是 κ·ℵ₀=κ，得 2^{ℵ₀}≤κ；又 κ≤2^{ℵ₀} 显然（商的基数 ≤ 原集合基数）。注意这步**没用 CH**。
3. 对每个 k：E,R 都是 `ℒ_k×ℒ_k→Prop`，至多 `2^{ℵ₀}` 种；由 CH，`δ^{ℵ₀}=(2^{ℵ₀})^{ℵ₀}=2^{ℵ₀}`，故 ρ 也至多连续统多种。（CH 的用点：δ=ω₁=2^{ℵ₀}，所以 δ^{ℵ₀} 可以化简。）
4. 于是 `|∐_{k≥1} 𝔇_k| ≤ ℵ₀·2^{ℵ₀} = |S|`，取单射即得，且可安排两两不交的值域（把 disjoint union 嵌入 S 时按 k 分段）。

**机械性理由**：编码映射是**集合参数**（"The coding maps are fixed set parameters in the definition of the class, not symbols of its language"）——这是语言保持可数的关键伎俩：如果 ι_k 是语言符号，语言就不可数了（或至少需要参数）。允许非法图编码（𝔇_k 含无效图）是为了例外坐标处仍能赋色。

Lean 对应：`Colors.lean`。注意 Lean 的做法**更强也更省**：`def code (hCH : CH.{u}) : (Σ n : ℕ, Diagram.{u} (Fin (n + 1))) ↪ Palette.{u}` 是从**带 arity 的 Σ-类型**到 Palette 的单一嵌入，不要求值域两两不交。原因是 Lean 的检验 `Passes` 直接以 `(d.restrict e.toEmbedding).Valid ∧ code ⟨m, d.restrict e⟩ = s m e` 表述——arity 已在 Σ-型里，颜色不必自带 arity 信息。这是"论文一句带过（两两不交），Lean 里绕开（Σ-型携带 arity）"的对应差异，见 Lean 取证章。`Colors.cardinal : #Color = 𝔠` 的证明对应论文第 1–2 步，且**不用 CH**（用 `repeat_injective`：把 a 映到 n ↦ a(unpair n .1) 的颜色，给出 `2^{ℵ₀} ≤ #Color` 的具体单射，避免论文的"选择 + 反证商不可数"）。`diagram_bound` 对应第 3 步（`ht : #(A → Tag) ≤ 𝔠` 用 CH：`Cardinal.mk_toType` + `two_power_aleph0` + hCH）。

[推测] 失败路线候选：
1. 若 `|S|` 的计算被弱化为"至多连续统"（没有下界），`code` 的存在性仍成立但 Lean 中 `palette_cardinal` 失败，后续 `profile_cardinal`（`#(B→Palette) ≤ ξ`）的等式链断在第一环。
2. 若允许 ι_k 的值域相交且检验按颜色直接解码 arity，会出现同一颜色是两种 arity 的合法码——Lean 用 Σ-型绕开了，但论文表述若删去"pairwise disjoint"而不改检验定义，`D_J = D_{[k]}↾J` 的唯一解码性丢失。
3. CH 只在 `δ^{ℵ₀}=2^{ℵ₀}` 处进入；若在 ¬CH 下尝试，δ=ω₁ 而 |S|>ℵ₁，`|𝔇_k|` 可达 (2^{ℵ₁})^{ℵ₀}，编码失败——这就是标题里 "CH obstruction" 的第一处刚性。

### 2.1.3 限制与全子序列检验（eq:restriction-composition, Definition col:test）

对 `∅≠J⊆[k]`，把 J 递增枚举为 `{j₁<⋯<j_m}`，定义

```latex
 \ell_J:\mathcal L_m\longrightarrow\mathcal L_k,
 \qquad
 \ell_J(U,i)=(\{j_u:u\in U\},i).
```

`𝒟↾J` = 沿 ℓ_J 拉回两个关系与 ρ 得到的 arity-m 图（保留位置集 ⊆J 的那些标签）。合成律：

```latex
\begin{equation}\label{col:restriction-composition}
 (\mathcal D\restriction J)\restriction U
       =\mathcal D\restriction\{j_u:u\in U\}.
\end{equation}
```

**全子序列检验** `T_k((s_J)_{∅≠J⊆[k]})`：
- (i) 每个非空 J⊆[k]，s_J 在 `ι_{|J|}` 下解码为**有效**图 `𝒟_J`；
- (ii) 每个 J：`𝒟_J = 𝒟_{[k]}↾J`。

对有序元组 t=(x₁,…,x_k)（互异），`t↾J=(x_{j₁},…,x_{j_m})`；t 的颜色组通过检验即 `T_k((s_{t↾J}))`。

**批注**：(a) "The order in this definition is the order of the tuple positions. It requires no order on the set from which tuple entries are chosen"——被着色的对象是**有序元组**，不是集合；基座集 I 上不需要线序。这后面在 cat:bounded 里非常要紧：那里要给 I 临时配良序（只为证明用），再把 j-元子集按递增枚举变成有序元组去着色。(b) eq:restriction-composition 保证"与全图一致"自动蕴含"任意两个嵌套子序列相互一致"——所以检验只需锚定全图。(c) 论文提前声明："Validity of a diagram does not by itself guarantee extensionality of a restriction; the tests below require validity of every constituent diagram separately"——限制图可能失去外延性（限制会丢掉区分两元素的前驱），所以 (i) 要求**每个** J 的图各自有效，不是白给的。

Lean 对应：`Tuples.lean` 命名空间里 `Tuple I := Σ n, Fin (n+1) ↪ I`（Σ-型，长度+嵌入；"互异"由嵌入性保证，"有序"由 Fin 的序保证），`sub t e` 对 `e : Fin (m+1) ↪o Fin (t.1+1)`（**OrderEmbedding**——递增重标）做子元组，`sub_comp` 对应 eq:restriction-composition 的组合律。`Tests.Passes` 即 T_k 的 Lean 形态：`∃ d, ∀ m e, (d.restrict e.toEmbedding).Valid ∧ code ⟨m, d.restrict e.toEmbedding⟩ = s m e`——注意 (i)(ii) 合并成一条：有效性与"等于全图限制"由 code 的单射性从颜色等式反推（`Tests.no_pattern` 里正是用 `code.injective` 从 `hcode m ▸ hd n m e` 得到 `d m = (d n).restrict e`）。

[推测] 失败路线候选：
1. 若子元组改用任意（非递增）嵌入 `Fin(m+1) ↪ Fin(k+1)`，则"子序列保持原顺序"被破坏，`sub_color`（TailBound.lean）把分划齐次集转成元组的桥断掉——分划着色天然在**集合**上，转成元组必须选 canonical 的递增枚举。
2. 若检验只要求全图有效、不要求每个限制图有效，端点构造里 subtuple 的闭包 `D_Y` 各自外延的性质（end:diagrams 的证明要逐个 subtuple 重做）就不必成立，可能存在"全图有效但某个子图无效"的反例颜色组混进对象。

### 2.1.4 商图引理（Lemma col:quotients）

```latex
\begin{lemma}[Maps between quotient diagrams]\label{col:quotients}
Suppose the test in Definition~\ref{col:test} passes.  If
\(\varnothing\ne J\subseteq[k]\), then the label map \(\ell_J\)
induces an injective map
\[ Q_{\mathcal D_J}\longrightarrow Q_{\mathcal D_{[k]}}. \]
This map preserves tags and preserves and reflects \(R\).
The quotient maps for nested subsequences compose.
\end{lemma}
```

证明机制：写 `𝒟_J=(E_J,R_J,ρ_J)`。`𝒟_J = 𝒟_{[k]}↾J` 给出：对标签 a,b∈ℒ_{|J|}，
`a E_J b ↔ ℓ_J(a) E_{[k]} ℓ_J(b)`。
- 前向 ⇒ 商映射良定义；
- 反向 ⇒ 单射；
- R 的类似等价式 ⇒ 保持且反射 R；
- 限制后 tag 函数相等 ⇒ 保持 tag。
- 标签层映射按定义合成，故诱导的商映射也合成。

**机械性理由**：这个引理是 no-pattern 极限构造的"相容性工具箱"：极限里 `j_{A,B}:Q_A→Q_B` 的单射性、保 tag、保且反射 R、合成律全部从此处来。没有"反射 R"，极限关系 (col:limit-relation) 的良定义性断掉；没有合成律，∼ 的传递性断掉。

Lean 对应：`Diagram.qMap D E hD hE e h : D.Q hD ↪ E.Q hE`（h : D = E.restrict e），`qMap_mk` 给出在等价类上的显式作用；单射性证明与论文逐字同构（`Quotient.exact` + 拉回）；合成律在 `NoPattern.directedSystem` 的 `map_map` 中经 `Label.map_comp` + `restrict_comp` 处理（`rfl` 收尾）。

[推测] 失败路线候选：
1. 若某个 s_J 解码出的图与全图限制**不同构**（检验 (ii) 松弛为"同构"），qMap 的单射性仍可成立但"preserves and reflects R"依赖**字面相等** `D = E.restrict e`——Lean 里 h 是 Prop-level 相等；松弛后需要改用同构提升，商上 R 的反射性可能失败（同构可能把不同的前驱集粘合）。
2. 嵌套子序列的合成在 Lean 里靠 `positions X Y h`（Finset 序嵌入的 canonical 表示）+ `sub_comp`；若用非 canonical 的枚举，`map_map` 会差一个重标置换，合成律字面失败。

### 2.1.5 §1 结尾的预告

"The tests permit the tuple-dependent diagrams constructed in Section 4. They do not permit one fixed color s_j for each arity j such that T_k((s_{|J|})) holds for every k≥1. Lemma col:no-pattern will prove this obstruction"——即：检验**允许**每个元组用自己的图（元组依赖），**不允许**全 arity 统一的固定颜色序列。后者是 §3 的上界引擎，前者是 §4 的端点燃料。两者的分界线正是本反例的几何：局部（元组级）可任意，全局（arity 级）必矛盾。

## 2.2 §2 aec：AEC 公理与基本结构

### 2.2.0 AEC 定义（Definition aec:definition，照抄）

```latex
\begin{definition}[Abstract elementary class]\label{aec:definition}
An \emph{abstract elementary class} is a pair
\(K=(\mathcal C,\le_K)\), where \(\mathcal C\) is a class of set-sized
structures in one fixed set-sized finitary language \(\tau\), and
\(\le_K\) is a partial order on \(\mathcal C\), with the following
properties. ...
\begin{enumerate}[label=\textup{(\arabic*)}]
\item \emph{Isomorphisms and substructures.} ...
\item \emph{Coherence.} If \(M_0\) is a \(\tau\)-substructure of \(M_1\), and
\(M_0\le_K M_2\) and \(M_1\le_K M_2\), then \(M_0\le_K M_1\).
\item \emph{Unions and smoothness.} For every nonzero ordinal \(\gamma\) and
every increasing chain \((M_i:i<\gamma)\) under \(\le_K\), its union \(U\)
belongs to \(\mathcal C\), and \(M_i\le_K U\) for all \(i<\gamma\).
If also \(M_i\le_K N\) for every \(i<\gamma\), where \(N\in\mathcal C\),
then \(U\le_K N\).
\item \emph{Downward L\"owenheim--Skolem property.} There is an infinite
cardinal \(\theta\ge|\tau|+\aleph_0\) such that, for every \(M\in\mathcal C\)
and every \(A\subseteq |M|\), there exists \(N\le_K M\) with
\(A\subseteq |N|\) and \(\|N\|\le |A|+\theta\).
\end{enumerate}
The least such infinite cardinal \(\theta\) is denoted by \(\LS(K)\).
\end{definition}
```

论文声明将对**任意非空集合指标的有向族**直接证并与公共上界断言——比逐条链公理强（"This in particular proves all the chain assertions in Definition 2.4, with no restriction on the chain's cofinality"）。这一加固是防审稿人质疑"可数余链情形"（smoothness 在 cf=ω 的链上最容易翻车，论文在 aec:directed 证明末尾专门点出 "This is what permits both the object-condition argument and smoothness at chains of countable cofinality"）。

Lean 对应：`Model.lean` 的 `ClassData.IsAEC`。差异：Lean 的 `chain_union` 就是论文的公理 3（非零序数 γ 的链 + IsUnion + 两个转移），`coherence` 单列；`LSBound θ` 多含一项 `#(Σ n, L n) ≤ θ`（语言基数计入 LS 界——论文定义里是 `θ ≥ |τ|+ℵ₀`，同一件事）；`HasLSNumber` = 是最小界，对应"least such θ"。Lean 的 `Categorical μ` 显式含存在性半句（"categoricity includes existence"，论文引言 conventions 也强调了）。Lean 的结构是**集合编码**的：`RelModel` 的 carrier 是 `ZFSet`，即模型本身是集合、关系解释为 `ZFSet` 上的谓词——论文"set-sized structures"的直译。

### 2.2.1 基本结构（Definition aec:basic）

四条数据（载体两两不交）：
- (a) 非空集 I；非空无端点稠密线序 B，**所有有界区间可数**。
- (b) 群 sort `G(B)` 通过关联关系编码 `[B]^{<ω}`（对称差群）：`supp: G(B) → [B]^{<ω}` 是双射且 `supp(u+u') = supp(u)△supp(u')`。另有群 sort `G_*`，由**逐元素一元单点标签**_identified_ with `[ω]^{<ω}`：即每个有限自然数子集 v 有一个专属一元谓词，这些标签穷尽 G_*。
- (c) 对每个 t∈𝒯(I), n<ω：非空集 `Z_{t,n}` 带 `G(B)` 的自由传递作用；对每个 t∈𝒯(I), b∈B：非空集 `W_{t,b}` 带 `G_*` 的自由传递作用。
- (d) 行点×列点上的二元关系（写成指示函数 e(z,w)∈{0,1}），只能在不同行/列同元组时成立，且满足**比特平移律**：

```latex
\begin{equation}\label{aec:bit}
 e(z+u,w+v)
 =
 e(z,w)+\boldsymbol 1_{b\in\supp(u)}
       +\boldsymbol 1_{n\in v}\pmod 2
\end{equation}
```

（z∈Z_{t,n}，w∈W_{t,b}，u∈G(B)，v∈G_*；v 通过其固定有限子集标签读出。）

"The domain consists exactly of the listed carriers. There are no additional relations or distinguished representatives."——**没有命名原点**是全部戏法所在：若语言命名了每条纤维的原点，行/列平移就都是语言可定义的，颜色就会变成结构不变量而不是"mod 例外集"的近似量，§2 的全部灵活性（例外列、强包含）消失。

语言的显式描述（正文段落，要点转录）：一元谓词给 I,B,G(B),G_* 与各载体 `Z_{k,n}=⋃_{|t|=k} Z_{t,n}`、`W_k`、以及 G_* 的各单点标签；(k+1) 元投影图把行点连到其 k 个元组坐标；(k+2) 元投影图把列点连到元组坐标与 b；二元关系给序、有限集关联、比特；三元图给群运算与两个作用。"bits between different tuple fibers are zero"——不同元组纤维之间比特强制为零，排除任何未指明的跨元组结构。所有符号由可数集指标、有限 arity ⇒ 语言可数有限。**用运算图而非函数符号是无害的**：包含的诱导子结构里，小对象的语义全性在新对象中保持，语义唯一性迫使图给出同一个值（正文专门论证了这一点——这是"关系化语言下子结构封闭性"的经典小陷阱）。

Lean 对应：`Arrays.lean`。`inductive Point I B` 有六个构造子：`index | base | group (Finset B) | star (Finset ℕ) | row (Tuple I) ℕ (Finset B) | col (Tuple I) B (Finset ℕ)`——即 Lean **不设独立的群 sort 载体与纤维载体，而是把行点直接表示为 (t,n,u)、u:Finset B**（= 论文自由实现 aec:arrays 里的 `(t,n,u), u∈[B]^{<ω}`）。`Symbol` 枚举全部语言符号（index/base/group/star 一元；row k n 一元；col k 一元；label s 一元；rowProjection k n (k+2) 元；colProjection k (k+3) 元；order/incidence/bit 二元；groupAdd/starAdd/rowAct/colAct 三元），`Symbol.arity` 给 arity，`Language n := {s // s.arity = n}`，`language_countable` 证明 Σn, Language n 可数（单射到 Symbol，Symbol Encodable）。`Data.rawRel` 是全部关系的逐符号显式定义——论文"Use binary relations for the order, finite-set incidence, and the bit relation, and ternary graphs for group operations and the two actions"的逐条落地。**关键建模差异**：Lean 的 `Data` 只含 `I, B, bits : Tuple I → ℕ → B → Bool` 七个字段（order/dense/noMin/noMax/locallyCountable 是性质字段），整个纤维+群结构是**隐式的**（由 Point 的语法给出），因此 Lean 形式化的类只覆盖论文的"canonical 自由实现"（aec:arrays 的构造产物）及其诱导子结构，不覆盖任意 torsor 选择的基本结构。这是 Lean 取证章要重点记录的差异之一。

`G_*` 的单点标签：Lean 中 `Symbol.label s`（s:Finset ℕ）一元关系 `.label s, [.star t] => s = t`——每 个 v:Finset ℕ 一个谓词，恰对应论文"by a separate unary singleton label for each of its elements"。

### 2.2.2 基本包含（Definition aec:basic-inclusion）

`M₀ ≼_b M₁` 当且仅当 M₀ 是诱导 τ-子结构，且：
- (i) `G_*^{M₀} = G_*^{M₁}`（作为底集合相等）；
- (ii) `B^{M₀}` 是 `B^{M₁}` 的**凸**子序；
- (iii) 对每个 `u∈G(B)^{M₀}`：`supp^{M₁}(u)=supp^{M₀}(u)`。

**机械性理由**：(i) 列平移群跨结构固定 ⇒ 列平移不变量（mod =*）跨结构可比；(ii) 凸性是"有界区间可数"在有向并下存活的必要条件（并之后取两老点之间的新点必须已在某个成员里——aec:directed 证明里 convexity 的用法）；(iii) 禁止老有限集码在更大的 B 里获得新成员——否则 old group 不再是 `[B^{M₀}]^{<ω}` 的自然包含副本，比特律 (aec:bit) 的 `1_{b∈supp(u)}` 在新 b 处会"变节"。论文注：群元素自身的底层码可以任意。

基本包含可合成：四条各自合成。

Lean 对应：没有字面的 `≼_b`；由 `RawEmbedding`（ArrayEmbeddings.lean）承担：`toEmbedding : M.Carrier ↪ N.Carrier` + `relates`（关系保持反射）+ `supports`（incidence 的行为限定 `.group s` 的像 = 支撑映射——即论文 (iii)）。`star_apply : f.toEmbedding (.star v) = .star v` 即论文 (i)（G_* 逐点固定）。凸性不进 RawEmbedding 而进 `Map.Strong` 的 `convex : Set.OrdConnected (Set.range f.base)`——即论文 (ii) 被移到强包含条件里。这是结构重组：论文把 (i)(ii)(iii) 都放进"基本包含"，再叠加检验条件得 `≤K`；Lean 把 (ii) 并入 Strong，(i)(iii) 并入 RawEmbedding→Map。数学内容等价，拆分位置不同。

### 2.2.3 基座序大小（Lemma aec:order-size）

```latex
\begin{lemma}[Size of the base order]\label{aec:order-size}
Every order \(B\) in a basic structure has cardinality at most
\(\aleph_1\).
\end{lemma}
```

证明机制（论文版）：取 p∈B。
- 情形 A：p 上方的最终段有可数上稠密子集，则该最终段 = 可数多个以 p 为一端的有界区间 ∪ 端点，可数。
- 情形 B：否则递归选严格递增列 (b_α)_{α<ω₁} 于 p 上方：每步只有可数多个先选点，由"无可数上稠密集"假设给出更高点。该列必在 p 上方上稠密：若有更高点包住整列，则有界区间含 ℵ₁ 个点，违反局部可数。于是最终段 ≤ ℵ₁ 个可数区间。
- 反向对称。故 |B|≤ℵ₁。

**机械性理由**：`|B|≤ℵ₁` 是全局上界，使 (a) `|S^B|≤δ^δ=2^δ=ξ`（cat:palette，B 至多 δ 个位置），(b) 尾部范畴性里 `|B^M|≤δ<Λ≤μ` 迫使大模型容量全在 I 上。局部可数 ⇒ ≤ℵ₁ 这一步是"每点上方最多 ω₁ 个可数区间"的标准开关；ω₁ 的正规性在情形 B 的递归里用（可数个先选点 < ω₁）。

Lean 对应：`BaseOrders.initial_bound` + `BaseOrders.cardinal_le`（TailBound.lean）。**证明路线不同**：Lean 若 #B≤ℵ₀ 直接完事；否则 `ℵ₁ ≤ #B`，取嵌入 `e : (ω_ 1).ToType ↪ B`，再证每个 b 被某个 e i 从右压住（否则 b 下方……准确说是 `∀ i, b ≤ e i` 不成立时，i ↦ ⟨e i, (hb i).le⟩ 单射入 `Set.Iic b`，与 Iic b 可数矛盾），于是 `b ↦ ⟨ix b, b, hix b⟩ : B → Σ i, Set.Iic (e i)` 单射，得 `#B ≤ ℵ₁·ℵ₀ = ℵ₁`。Lean 用"嵌入 ω₁ + 初始段覆盖"代替论文的"递归构造上稠密列 + 分类讨论"——同一定理的两条证明。差异点见 Lean 章。

[推测] 失败路线候选：
1. 若把"有界区间可数"弱化为"有界区间 <δ"，结论变 |B|≤2^δ 级别，cat:palette 估计 `|S^B|≤2^δ` 恰好还在临界上（δ^δ=2^δ），但小凸包引理与 LS 论证的算术（`κ·ℵ₀=κ` 等）全面改写，`small_subarray` 的 `#T ≤ κ` 失败。
2. 情形 B 的递归若漏掉"该列必上稠密"论证，只得上最终段 ≤ ℵ₁·ℵ₁ 而非 ≤ℵ₁——不影响最终界但影响与 `endpoint` 的等式核对。

### 2.2.4 基本结构大小（Lemma aec:size）

```latex
\begin{lemma}[Size of a basic structure]\label{aec:size}
For every basic structure \(M\),
\begin{equation}\label{aec:size-equation}
 \|M\|=\max\bigl(|I^M|,|B^M|,\aleph_0\bigr).
\end{equation}
\end{lemma}
```

证明：下界由 I、B 是 sort、G_* 可数无限。上界：κ=max(|I|,|B|,ℵ₀)；I 上有限单射元组至多 κ 个；B 无穷 ⇒ |G(B)|=|B| ⇒ 行纤维大小 |B|，列纤维大小 |G_*|=ℵ₀；行纤维 ≤κ 个（指标 𝒯(I)×ω），列纤维 ≤κ 个（指标 𝒯(I)×B）；合计 ≤κ。

**机械性理由**：这条公式是全程的"换算器"——端点模型大小 = max(|V_η|,ℵ₁,ℵ₀)=beth_η；尾部模型大小 = max(μ,ℵ₀)=μ；cat:tail 里从 `μ=max(|I|,|B|,ℵ₀)` 且 |B|<Λ≤μ 推出 |I|=μ。注意 |G(B)|=|B| 需要 B 无穷（[B]^{<ω} 与 B 等势）。

Lean 对应：`Data.cardinal_le`（把 Carrier 单射入 `I ⊕ B ⊕ Finset B ⊕ Finset ℕ ⊕ (Tuple I × ℕ × Finset B) ⊕ (Tuple I × B × Finset ℕ)` 再算卡片）与 `Data.cardinal_eq`（`#M.Carrier = max (max #M.I #M.B) ℵ₀`，le_antisymm）。Lean 版更"组合"：显式六分量的编码映射，与论文"行纤维列纤维计数"是同一估计的两种记账。

### 2.2.5 颜色与代表无关性（eq:color, Lemma aec:representatives）

行选择系统：`𝐳=(z_{t,n})`，`z_{t,n}∈Z_{t,n}`（结构集合大小 ⇒ 选择公理可用）。对 b∈B：

```latex
\begin{equation}\label{aec:color}
 c_t^{\mathbf z}(b)
 =
 \bigl[(e(z_{t,n},w))_{n<\omega}\bigr]_{=^*}\in S,
 \qquad w\in W_{t,b}.
\end{equation}
```

**Lemma aec:representatives**（照抄要点）：
- 颜色与列代表 w 无关；
- 两个行选择系统 𝐳,𝐳′：固定 t，颜色 `c_t^𝐳(b), c_t^{𝐳'}(b)` 在 B 的一个**可数**子集外一致；故全检验对该元组的真值在可数集外相同；
- **更强的断言**：`M₀≼_b M₁`，t∈𝒯(I^{M₀})，b∈B^{M₁}∖B^{M₀}，用 M₀ 的行代表在 M₁ 中算颜色——**与行选择完全无关，无例外坐标**。

证明机制：
1. 列代表差一个平移 v∈G_*；(aec:bit) 使二进制序列只在 v 的有限多个指标上变 ⇒ mod =* 同类。
2. 固定 t，写 `z'_{t,n}=z_{t,n}+u_{t,n}`；令 `D_t=⋃_n supp(u_{t,n})`（可数）。b∉D_t 时同列代表下两序列逐位相同。长度 k 的全检验只涉及 2^k−1 个非空子序列；在 `⋃_J D_{t↾J}` 之外全部颜色一致。
3. 强断言：老代表间的平移子属于 `G(B)^{M₀}`，由基本包含 (iii) 其 M₁-支撑仍在 `B^{M₀}` 内；b∉B^{M₀} 时 (aec:bit) 的 `1_{b∈supp(u)}` 项为 0，**逐位不变**。

**机械性理由**：这条引理是"对象条件良定义"的全部根据：坏集 E_t(𝐳) 的"对某一行选择系统可数 ⟺ 对所有系统可数"。强断言是强包含条件只用 M₀ 行代表即可检验的原因——新列处的颜色是**绝对**的，不依赖任何选择。这正是引言机制 1："Finite row supports make these outside tests exactly independent of old choices of origins"。

Lean 对应：分三处。(1) 列代表无关 = `Map.colors` 里的 `color_column`（`a n ^^ decide (n∈v)` 与 a 同 =*-类）与 `Map.colors_base`。(2) 行平移的可数例外 = `Map.exceptions f t := ⋃ m, ⋃ e, ⋃ n, (f.rowShift (sub t e) n : Set N.B)` 及 `exceptions_countable`（行支撑的有限性 ⇒ 每片有限、可数并）。(3) 强断言 = `Map.test_away`：b ∉ exceptions t 时 `Test (fun s => f.colors s b) t ↔ Test N.colors (map f.index t)`——即"新列处的检验与代表平移无关"。Lean 用 Map 上的 rowShift 显式记录老→新的行平移，把论文的"任选行系统"量化**替换成**"沿映射的平移数据"。

[推测] 失败路线候选：
1. 若把 `[B]^{<ω}` 换成 `[B]^{≤ω}`（可数支撑），D_t 不再可数，代表无关性的"可数例外"膨胀为"≤ℵ₁ 例外"，对象条件失效为空（任何结构都不是对象），类空。
2. 若列群 G_* 换成 `[B]^{<ω}`（即行列都用大群），列平移可在不可数多个 b 上变比特，(aec:bit) 的第三项不再"有限支撑"，颜色不再是 =*-类而是 mod-[B]^{<ω} 类——整个 S 编码机制（可数类！）崩溃。
3. 强断言若失败（例如 (iii) 删去），则 `M₀≤K M₁` 的检验依赖 M₀ 里具体选了哪些行，AEC 的传递性/相干性论证中"选一次到处用"的论证（aec:order-coherence 的 transitivity、aec:directed 的 common-upper 论证）全部需要重做。

### 2.2.6 坏集、对象与强包含（Definition aec:objects）

```latex
\begin{equation}\label{aec:bad-set}
 E_t(\mathbf z)=
 \left\{b\in B:
 \neg T_k\bigl((c_{t\restriction J}^{\mathbf z}(b))_{\varnothing\ne J\subseteq[k]}\bigr)
 \right\},
\end{equation}
```

**对象**：E_t(𝐳) 对每个 t 可数（对某个 ⟺ 每个行选择系统）。**强包含** `M₀≤K M₁`：`≼_b` + 对每个 t∈𝒯(I^{M₀})、每个 `b∈B^{M₁}∖B^{M₀}`，用 M₀ 行代表在 M₁ 中算的 t 及其非空子序列的颜色通过全检验。

**批注**：
- 例外集**允许依赖 t**："no single countable set is required to work for all tuples"——这是与 cat:bounded 的关键接口：那里恰好只用可数多个 t（witness 元组列 t_k），并才可数。
- 强包含中**新基座点无例外**——这是"对象允许坏、扩张不允许新坏"的不对称，AEC 公理（光滑性、相干性）全靠它。
- 论文随后一段（aec:directed 证明后的 "The proof does not put an arbitrary preselected countable set of union row points into one stage…"）是方法论注记：先把有限元组放进一个成员、再在该成员内选全部行代表——顺序不能反。

Lean 对应：`Data.IsObject hCH := ∀ t, {b | ¬ Test (fun t => colors t b) t}.Countable`——注意 Lean 直接用**canonical 颜色**（Data.bits 决定，无行选择量化），IsObject 是 `∀ t` 的坏集可数。`Data.countable_object`：B 可数 ⇒ 自动对象（对应论文"when B is countable, each E_t is countable automatically"）。强包含 = `Map.Strong`（convex + outside 检验）+ `Data.restrict_strong`。Lean 里"对象条件对某个系统 ⟺ 对所有系统"的等价性不存在（不需要），因为 canonical 系统是定义的一部分。

### 2.2.7 自由实现（Lemma aec:arrays）

```latex
\begin{lemma}[Free realization of bit arrays]\label{aec:arrays}
Let \(I\ne\varnothing\), and let \(B\) be an order satisfying
Definition~\ref{aec:basic}(a).  For every family of binary
sequences
\((a_{t,b}\in 2^\omega:t\in\mathcal T(I),\,b\in B)\),
there is a basic structure whose index and base sorts are disjoint
copies of \(I\) and \(B\), with row-choice colors, under these
identifications,
\[ c_t(b)=[a_{t,b}]_{=^*}. \]
If \(B\) is countable, every basic structure with base sort
\(B\) is an object.
\end{lemma}
```

证明机制：取不相交带标签副本；行点 (t,n,u)、u∈[B]^{<ω}，列点 (t,b,v)、v∈[ω]^{<ω}；正则平移作用；比特

```latex
\begin{equation}\label{aec:array-realization}
 e((t,n,u),(t,b,v))
 =
 a_{t,b}(n)+\boldsymbol 1_{b\in u}
           +\boldsymbol 1_{n\in v}\pmod2.
\end{equation}
```

跨元组比特置零；平移的对称差性质给出 (aec:bit)；零行代表+零列代表实现 a_{t,b}。B 可数时 E_t⊆B 自动可数。

**机械性理由**：这是"任意指定颜色谱皆可实现"的万能构造器——端点模型（§4）、尾部存在性模型（cat:tail）、bool:extension 的扩张全部调用它。它的存在把"造模型"化归为"造颜色族"，把全部难度集中到颜色层。

Lean 对应：Lean **不需要单独的引理**——`Data` 类型本身就是自由实现：给 I、B、bits 就是结构；`Data.colors t b := color (fun n => bits t n b)` 恰是 `c_t(b)=[a_{t,b}]`。论文引理的两个结论拆成：存在性=直接给出 Data；"B 可数 ⇒ 对象"= `Data.countable_object`。

### 2.2.8 同构不变、偏序、相干（Lemma aec:order-coherence）

断言：类与强关系同构不变；≤K 是偏序且比较都是诱导子结构包含；相干性成立。

证明机制要点：
- 同构保持载体谓词、每个行号 n、元组坐标投影、G_* 的固定标签、序、支撑、作用、比特 ⇒ 沿同构搬运行选择系统保颜色、坏集搬运、强关系保持。
- 自反：空的新基座点集。反对称：诱导子结构包含。传递：设 M₀≤K M₁≤K M₂，取 t 与 b∈B^{M₂}∖B^{M₀}：若 b∈B^{M₁}∖B^{M₀}，在 M₁ 选列代表，M₂ 中对老行的比特不变（诱导子结构），检验由 M₀≤K M₁ 供给；若 b∉B^{M₁}，M₀ 的选行也是 M₁≤K M₂ 意义下的合法老代表，后者供给检验。
- 相干：M₀⊏M₁，M₀≤K M₂，M₁≤K M₂ ⇒ G_* 相等（都等于 M₂ 的）、凸性传递、支撑限制相等 ⇒ ≼_b；颜色在 M₂ 中算与在 M₁ 中算相同，M₀≤K M₂ 供给检验。

**机械性理由**：传递性证明是"两个不同的老代表合法性"的交接舞蹈——M₀≤K M₁ 与 M₁≤K M₂ 的检验条款各自覆盖一半新点，靠"老代表在更大结构中仍是老代表"衔接。这就是强断言（aec:representatives 最后一句）存在的理由：没有"无例外坐标"，两半不能无琏拼接。

Lean 对应：`AEC.lean` 的 `refl, antisymm, trans, coherence, iso_objects, iso_strong`。注意 Lean 的 `trans` 用 `strong_rebase`（把 strong 里的 presentation 换成任选的 P,Q）+ `Map.comp`，而相干性 `coherence` 用 `Map.factor`（ArrayIsomorphisms.lean：给定 `∀ x, ∃ y, g.onPoint y = f.onPoint x`，分解出 k:Map M N 使 g∘k=f）+ `Map.Strong.factor`。Lean 把论文的"颜色检验交接"重新表述为映射的分解与 strong 性沿分解的传递——是同一数学的映射论包装。

### 2.2.9 有向并与光滑（Lemma aec:directed）

断言：非空集合指标、按强包含有向的族 (M_i)_{i∈D}（任两成员在族内有公共强上界）：并 U 是对象、每个 M_i≤K U；若还有对象 N 是所有成员的强上界则 U≤K N。

证明机制（分段转录，这是全文最长的单条引理之一）：
1. **良定义性**：有限多个成员有公共上界（由有向性归纳）；两成员经诱导子结构嵌入公共成员 ⇒ 关系在交上一致 ⇒ 并是良定义的关系结构。
2. **基本数据**：载体谓词仍分拆并域；I^U 的每个有限元组落在某成员里 ⇒ 该成员供给每个 n 的行纤维；元组+基座点也落进公共成员 ⇒ 列纤维。投影图单值全性用同一有限参数论证。
3. **G_\* 相等**：任意两指标有公共上界其 G_* 同时等于二者 ⇒ 全族 G_* 是同一集合。
4. **支撑双射**：每个 u∈G(B)^U 源于某成员；若并中有额外关联点，公共上界成员不能给 u 添加支撑 ⇒ 支撑 = 老支撑、有限。反之每个有限子集落在某成员且在那里有码，码的唯一性在含两个候选码的公共成员里检查 ⇒ supp 在 U 上是到 [B^U]^{<ω} 的双射。
5. **群/作用/比特律**：所有参数落在公共成员 ⇒ 语义全性、唯一性、群律、纤维保持；同一纤维两点在公共成员里有唯一平移子 ⇒ torsor；(aec:bit) 的有限多个参数放公共成员。并中不出现规定类型之外的关系。
6. **序性质**：稠密、无端点、线性——有限点的见证在包含成员里；b 在 a,c∈B^{M_i} 之间 ⇒ 取含 b 的成员、再取与 M_i 的公共上界，凸性给 b∈B^{M_i} ⇒ B^{M_i} 在 B^U 凸；并的有界区间 = 含端点成员中的区间 ⇒ 可数。故 U 基本、M_i≼_b U。
7. **对象条件**：固定 t∈𝒯(I^U)，取含其条目的成员 M_i，在 M_i 内选 t 及其全部子序列的行代表（每个 n）；在 B^{M_i} 上坏集可数（M_i 的对象条件）；这些颜色可借 M_i 的列在 U 中重算，老例外界仍有效。对 b∈B^U∖B^{M_i}：取含 b 的成员、再取与 M_i 的公共上界；M_i 到该公共上界的强包含用所选行在 b 处通过全检验；同一批行、列点在 U 中算出相同颜色 ⇒ 检验只在原可数集上失败。
8. **全局系统换算**：上面选的代表依赖 t；要与 U 的单一全局行选择系统核对，用 aec:representatives 对 t 及其有限多个子序列比较，每次加至多可数差 ⇒ 全局系统下坏集也可数 ⇒ U 是对象。
9. **成员强性**：同一公共上界计算用 M_i 行 ⇒ M_i≤K U。
10. **公共上界**：设每个 M_i≤K N。并是 N 的诱导子结构（每个有限关系实例在含其条目的成员里可查）；G_*^U=G_*^N；每个并群元素在 N 中保持原支撑。两个 B^U 点取含两者的成员，该成员在 N 中凸 ⇒ 其间 N 点都进该成员 ⇒ 进 B^U ⇒ U≼_b N。固定 t∈𝒯(I^U)、b∈B^N∖B^U：取含 t 的成员 M_i 与全部所需行；因 b∉B^{M_i}，M_i≤K N 供给 b 处的全检验；这些代表也在 U 中且对其强包含检验合格；aec:representatives 的 canonical 性（B^U 之外）使一次选择足矣 ⇒ U≤K N。

**机械性理由**：整个证明就是"有限多个参数永远可以塞进一个成员"的反复运用（directedness 的有限交性质）；唯一的全局性断言（对象条件、强包含）靠 (a) 例外集可数的可数并稳定性、(b) 代表无关性强断言来消化。第 8 步的换算是防止"t-依赖选择"与"全局系统"之间出现不可数多的差。

Lean 对应：`DirectedLimits.lean` 整个文件 + `AEC.directed_union`。Lean 把并构造做成 **DirectLimit**：System.Data（对象 + 相容映射族），极限 I、B、Carrier 各取 DirectLimit；极限序 `S.le` 经 `DirectLimit.lift₂` 定义并证明 LinearOrder；dense/noMin/noMax 逐条经 DirectLimit.induction 提升到极限；`rowDiffAt/colDiffAt`（Option (Finset _)）记录同纤维两点的平移差，并证明对称差演算（rowDiff_trans 等）——这是论文"torsor 性质在并中保持"的形式化对应；`bitAt`/`bit` 经 `bitAt_map`（(aec:bit) 沿映射不变）降到极限；`limitData` 组装；`toLimit i : Map (obj i) (limitData)` 是"老成员 → 极限"的强包含（`toLimit_strong`：凸性 base_convex + 外部检验沿公共上界传递）；`limit_object`（对象条件：元组先落一个阶段 + exceptions 可数 ∪ 老坏集像可数）；`liftMap/liftRaw/liftMap_strong` 对应论文第 10 段（到公共上界 N 的光滑性方向）。**Lean 的 J 是任意 Preorder+IsDirectedOrder+Nonempty**，与论文"集合指标有向族"一致。

[推测] 失败路线候选：
1. 第 7 步若不"先落成员再选行"，而是预先在并里全局选行再找阶段，第 8 步的全局换算可能出现不可数差（因为全局系统的平移子支撑不再自动有限/可数并）——这正是论文末尾方法论注记警告的。
2. 若 JEP/AP 假设被暗中引入（例如要求族的并关系一致由某公共超模型保证），证明会变平凡但类会失去反例资格——本构造的 directedness 只在**族内部**使用，从不假设外部合并。
3. 极限序的稠密性：Lean 里 `dense` 的证明对 (a,b)∈B×B 做 DirectLimit.induction——若 B 的序定义不是经 lift₂（而是想在每个阶段分别定义再"粘合"），稠密性提升会因代表选取不兼容失败。

### 2.2.10 凸包与向下 LS（Lemma aec:convex-hull, Lemma aec:ls, Theorem aec:class)

**convex-hull**：B 无端点稠密、有界区间可数；κ 无穷基数，D⊆B、|D|≤κ ⇒ 存在非空凸子序 B₀⊇D、|B₀|≤κ、稠密无端点。

证明：必要时加点使 D 非空；T₀=D；T_{m+1}=T_m∪{每点 x 配 x⁻<x<x⁺}；T=∪T_m（无端点、≤κ）；B₀=T 的凸包=≤κ²=κ 个闭有界区间之并（各含端点可数）⇒ ≤κ；B 的凸性+稠密性 ⇒ B₀ 稠密；b∈B₀ 介于 x,y∈T 之间 ⇒ 取 T 中 x 下方、y 上方的点 ⇒ B₀ 中 b 两侧有点 ⇒ 无端点。

**ls**：对 M∈𝒞、A⊆|M|，存在 N≤K M、A⊆|N|、‖N‖≤|A|+ℵ₀。

证明机制（逐步）：
1. κ=|A|+ℵ₀。选 I₀⊆I^M：含 A∩I 与 A 中每个行/列元素的元组坐标投影，|I₀|≤κ。
2. 对每个 t∈𝒯(I₀)、n<ω 选代表 z_{t,n}；**计算坏集时对子序列用同一套选择**；M 的对象条件（或扩展成全系统）给每个 E_t 可数。
3. 收集 D⊆B^M：(i) A∩B 的点与 A 中列点的基座投影；(ii) A∩G(B) 中元素的 supp(u)；(iii) 对 A 中每个行点 z∈Z_{t,n}，唯一 u 使 z=z_{t,n}+u 的 supp(u)；(iv) 所有 E_t（t∈𝒯(I₀)，按并收入）。前三个 ≤κ（每个支撑/投影有限），第四个 ≤κ·ℵ₀=κ ⇒ |D|≤κ。
4. convex-hull 给 B₀⊇D、|B₀|≤κ、稠密凸无端点。
5. `H={u∈G(B)^M: supp^M(u)⊆B₀}`——恰是 [B₀]^{<ω} 的码子群。保留 I₀,B₀,H,整个 G_*^M，行纤维 `Z^N_{t,n}={z_{t,n}+u:u∈H}`，列纤维 `W^N_{t,b}=W^M_{t,b}`（t∈𝒯(I₀), b∈B₀），关系限制。
6. 行轨道是 H-torsor；列是整个老 G_*-torsor；投影落在保留 sort；(aec:bit) 限制 ⇒ N 基本、N≼_b M。
7. z_{t,n} 本身在 N（零平移）；每个 b∈B₀ 处 N 与 M 算出相同颜色（用保留的整列纤维）⇒ N 中坏集 = E_t∩B₀ 可数 ⇒ N 对象。
8. b∈B^M∖B₀：全部检验通过，因为 E_t⊆D⊆B₀；同一批行是 N 的合法老代表 ⇒ 强条件 ⇒ N≤K M。
9. 请求包含逐载体核对；(aec:size) 给 ‖N‖=max(|I₀|,|B₀|,ℵ₀)≤κ。

**机械性理由**：(iii) 是整个 LS 论证的**心脏**——行点 z 的"支撑坐标"必须进 B₀，否则 z 不在保留轨道里；(iv) 把坏集整体搬进 B₀，是"新点处检验全通过"的来源（强包含的 vacuous 供给）。这就是"可数坏集"设计最终偿还的地方：可数 ⇒ 能塞进 κ 大的 D。

**Theorem aec:class**：K=(𝒞,≤K) 是固定可数有限关系语言中的 AEC，LS(K)=ℵ₀，且对任意非空集合指标有向族有并与公共上界性质。证明=前面引理的拼装；"语言可数且 LS 定义为无穷 ⇒ 最小可能值 ℵ₀，而这里已达到"。

Lean 对应：`small_subarray`（ArrayIsomorphisms.lean）与 `AEC.small`、`AEC.lsBound`、`AEC.isAEC`。Lean 版：κ=#A+ℵ₀；J = (⋃ a:A, indexSupport a)∪{p}（对应第 1 步，indexSupport = 元组坐标投影的 Finset 化）；T = (⋃ a, baseSupport a) ∪ (⋃ t:Tuple J, 坏集)（对应第 3 步 (i)–(iv) 合并）；`small_hull` 给 S（=B₀）；`M.restrict J S` 是限制结构（对应 H 与保留纤维：restrict 的 bits 直接在子集上读 M.bits，row/col 纤维由 Point 语法自动限制）；`restrictMap` 空平移嵌入；`restrict_object`（坏集预像可数）；`restrict_strong`（hbad: 坏集⊆S ⇒ 新点检验通过——正是第 8 步）；`Data.cardinal_le` 收尾。**注意 Lean 版把"行代表选择"这一步整个省掉**：因为 Data 的行点是语法对象 (t,n,u)，"选择 z_{t,n}"对应 Lean 中 restrictMap 的空 rowShift——canonical 结构里零平移就是代表。这是 Lean 简化掉论文 §2 最微妙一步（代表系统的全局换算）的原因。

[推测] 失败路线候选：
1. (iv) 若忘收 E_t 而只收 D 的 (i)–(iii)，B₀ 之外的 E_t 点成为 N 的列，检验在老元组上失败，N≰K M——LS 性质断在"强"字上（N 可能还是对象，但不是强子结构）。
2. κ=|A|+ℵ₀ 中 ℵ₀ 不可少：G_* 整个保留（论文明确"the whole group G_*"），它已含 ℵ₀ 个点；若试图只保留 A 需要的 G_* 元素，列纤维的 G_*-torsor 结构（自由传递作用）会破。
3. [推测] 若想改进界到 |A|（去掉 +ℵ₀），G_* 保留是立即障碍；除非把 G_* 做成"按需生成的子群"，但列纤维要求整个 G_* 作用，会破坏列纤维完整性。

## 2.3 §4 endpoint：两个端点模型

> 开场白照抄：对象指标排序为 `V_η`、序排序基数为 δ；"Actual ranks below η are replaced, separately at each order point, by tags below δ. For any one tuple, all required inequalities hold outside a countable set of order points."——即真秩（<ω₂ 的序数）在每个基座坐标 β 处被**局部地**用 <ω₁ 的 tag 近似，例外集依赖元组。

### 2.3.1 支配函数族（Lemma end:domination）

```latex
\begin{lemma}\label{end:domination}
There are functions \(f_\alpha:\delta\longrightarrow\delta\), for
\(\alpha<\eta\), such that for all \(\gamma<\alpha<\eta\) the set
\[ E_{\gamma,\alpha}
  =\{\beta<\delta:f_\gamma(\beta)\geq f_\alpha(\beta)\} \]
is countable.
\end{lemma}
```

证明机制：
1. 对每个 α<η=δ⁺ 固定单射 `j_α:α→δ`（α 可数基数 ≤δ，故存在；"These form a set-sized family of choices"——集合多次选择，ZFC 允许）。
2. 超限递归定义
```latex
\begin{equation}\label{end:diagonal-formula}
  f_\alpha(\beta)
  =
  \sup\{f_\gamma(\beta)+1:
        \gamma<\alpha,\ j_\alpha(\gamma)<\beta\},
  \qquad \sup\varnothing=0.
\end{equation}
```
3. 对固定 β<ω₁：sup 的指标集 `{γ: j_α(γ)<β} = j_α^{-1}[β]` 可数（j_α 单射、β 可数序数）。ω₁ 正规 ⇒ 可数多个 <ω₁ 序数的 sup 仍 <ω₁。故 f_α 落在 δ 内，递归合法。
4. 若 γ<α 且 β > j_α(γ)，则 f_γ(β)+1 出现在 sup 里 ⇒ `f_γ(β) < f_α(β)`，于是 `E_{γ,α} ⊆ j_α(γ)+1`——可数序数，可数。

**机械性理由**：这是经典的 "scale mod countable"（可数集上的 ω₂-长 mod-可数递增列）的对角构造。用途：给每个隶属边 y∈x（真秩 rank(y)<rank(x)<η）配"除可数多个 β 外 `f_{rank(y)}(β)<f_{rank(x)}(β)`"的逐坐标近似——把 ω₂ 级的秩不等式**压到 ω₁ 级的 tag**，使图 (E,R,ρ) 的 ρ 值域落在 δ 内（合法图！），而不等式检验在几乎处处成立。例外集依赖边 (γ,α)，进而依赖元组——恰与对象条件的 t-依赖例外兼容。

Lean 对应：`Collapse.lean` 命名空间 `Domination`。`Alpha := {a // a < ω_ 2}`，`Beta := {b // b < ω_ 1}`；`indexEmbedding a : Set.Iio a.val ↪ Beta`——由 `Classical.choice` 从卡片不等式 `#Iio a < ℵ₂ = succ ℵ₁` 构造（Lean 用 `Cardinal.lt_omega_iff_card_lt` + `succ_aleph`）。`values a : Beta → Beta` 用 `WellFounded.fix`（对 a 的序数良基递归）定义，`values_eq` 展开递归式：`(values a b).val = ⨆ g : Prior a b, succ (values g b).val`，其中 `Prior a b = {g : Iio a // indexEmbedding a g < b}`——恰是 (end:diagonal-formula) 的指标集。`eventually_lt`：`(indexEmbedding a g).val < b.val → values g b < values a b`（对应 f_γ(β)<f_α(β) 当 β>j_α(γ)）。`countable_exceptions`：坏集单射入 `Iio (succ (indexEmbedding a g))` ——对应 E_{γ,α}⊆j_α(γ)+1。

**差异**：论文的 sup 对空集取 0（sup∅=0），Lean 的 iSup 对空 Prior 取 ⊥=0（Ordinal 的 iSup 空集 = 0），一致。Lean 的 `values` 直接产出 `Beta` 类型元素（用 `Ordinal.iSup_lt_omega_one` 保证 <ω₁），把"正规性论证"封装在构造里。

[推测] 失败路线候选：
1. 若 j_α 不选单射而选任意映射，sup 指标集可能共尾 α（不可数），ω₁ 正规性失效，f_α(β) 可能 =δ——递归在 α=δ 附近爆掉。
2. 若把 f_α 的递归改成"同时取 sup 于 β"（即 f_α(β)=sup_{γ<α} f_γ(β)+1 不加 j_α 条件），同样爆。j_α 条件是"对角化预留"：每个 (γ,α) 对只牺牲 β≤j_α(γ) 这一段。
3. [推测] 此构造与 PCF/.scale 理论中 (ω₁,ω₂)-scale 的存在性相关；在 ¬CH 下 η 仍是 ω₂、构造照旧成立——注意本引理**不用 CH**（对比 col:coding 用 CH）。

### 2.3.2 累计层级大小（Lemma end:hierarchy-size）

```latex
\begin{lemma}\label{end:hierarchy-size}
The cumulative hierarchy satisfies
\[ |V_{\omega+\gamma}|=\beth_\gamma \quad\text{for every ordinal }\gamma. \]
In particular, \(|V_\eta|=\beth_\eta\), and every element of \(V_\eta\)
has rank below \(\eta\).
\end{lemma}
```

证明：V_ω（遗传有限集）可数 ⇒ γ=0。后继：`|V_{ω+(γ+1)}| = |𝒫(V_{ω+γ})| = 2^{beth_γ} = beth_{γ+1}`。非零极限：`V_{ω+γ}=⋃_{ζ<γ}V_{ω+ζ}`（序数加法与层级的连续性）；下界 sup beth_ζ = beth_γ；上界 |γ|·beth_γ；beth 严格递增 ⇒ ζ↦beth_ζ (ζ<γ) 单射入序数 beth_γ ⇒ |γ|≤beth_γ ⇒ 上界 = beth_γ。最后 `ω+ω₂=ω₂`（ω₂ 极限序数吸收前面的 ω）。

**机械性理由**：给出 |V_η|=beth_η=beth_{ω₂}=H(K)（CH 下），即端点模型指标集大小正是被规定阈值；"每元素秩 <η"是 tag 构造合法性的来源（rank(y)<rank(x)<η 是合法 tag 指标）。

Lean 对应：**没有一般形式的引理**。`EndpointDiagrams.cardinal : #D = endpoint` 的证明：`change V.card = _; rw [ZFSet.card_vonNeumann]; apply Cardinal.preBeth_of_omega0_sq_le; ...`——用 Mathlib 关于 vonNeumann 序数集合基数的引理（|V_α| = beth_α 型结果）直接算 |V_{ω₂}|，再核对 `ℵ₀·ℵ₀<…`。即 Lean 只需要 γ=ω₂ 一个特例，论文的一般归纳（含 |γ|≤beth_γ 的论证）在 Lean 中被 Mathlib 现成结果吸收。这是"论文一句带过 / Lean 引标准库"的对应差异（方向与"Lean 必须展开"相反：这里 Lean 更省）。

### 2.3.3 可数闭包（Lemma end:countable-closures）

```latex
\begin{lemma}\label{end:countable-closures}
There is a family
\[ (D_X:\varnothing\ne X\in[D]^{<\omega}) \]
of nonempty countable subsets of \(D\) such that:
(i) \(X\subseteq D_X\);
(ii) \(D_Y\subseteq D_X\) whenever \(\varnothing\ne Y\subseteq X\);
(iii) the relation of actual membership on \(D_X\) is
extensional: for distinct \(a,b\in D_X\), some \(w\in D_X\) belongs to
exactly one of \(a,b\).
We may also fix surjections \(d_X:\omega\longrightarrow D_X\)
such that \(d_{\{x\}}(0)=x\) for each \(x\in D\).
\end{lemma}
```

证明机制：
1. 固定 D 的良序；对互异 a,b∈D 令 `w(a,b)`= a△b 在该良序下的第一个元素——存在（集合外延性：a≠b ⇒ a△b≠∅）且 ∈D（D=V_η 传递）。
2. 对非空可数 A⊆D：`A₀=A; A_{n+1}=A_n∪{w(a,b): a,b∈A_n, a≠b}; C(A)=∪_n A_n`。每层可数 ⇒ C(A) 可数；C(A) 中任意两不同元素同落某 A_n，其见证在 A_{n+1} ⇒ 隶属在 C(A) 上外延。
3. 对有限 X 递归（按基数）：`D_X = C(X ∪ ⋃_{∅≠Y⊊X} D_Y)`。种子非空可数（X 的真子集只有有限多个）⇒ (i)(iii)；真包含时 (ii) 直接由构造，相等时平凡。
4. 每个 D_X 非空至多可数 ⇒ 有 ω-满射（有限时允许重复）；X={x} 时选首项为 x 的。全部选择由集合指标的选择公理供给。

**机械性理由**：这是"大集合的局部可数外延快照"——V_η 的元素可以极大，但每个有限元组只需要一个可数的、外延的、随子集单调的邻域。(ii) 的单调性保证元组的子元组用同一快照的子部分（end:diagrams 的 (i)）；(iii) 保证图的外延性（diagram_valid 的 extensional 字段）；d_X 的首项约定保证单点标签互异（Validity 的 roots 字段）。**为什么用对称差首个元素而不用"任意外延见证"？**——确定性的 w(a,b) 使闭包单调性 (ii) 的构造不需要额外协调。[推测]

Lean 对应：`Collapse.lean` 命名空间 `CountableClosures`，且是**泛化形式**：对任意 `(R : A → A → Prop)` 满足 `separates : ∀ a b, a≠b → ∃ w, ¬(R w a ↔ R w b)`（外延性抽象掉），定义 `witness/separates`（`if a=b then a else choose (separates a b)`）、`stage`（n 步闭包）、`closure`（∪ stage）、`closure_mono`、`closure_countable`、`witness_mem`、`extensional`、`FiniteSeed := {X : Finset A // X.Nonempty}`、`entries`、`entries_mono`、`enumeration`（0 号位给第一个元素 + 满射）、`enumeration_singleton`。实例化时 `membership_separates (D := ZFSet) (transitive)` 供给 separates。差异：论文用固定良序取对称差首元，Lean 用 `Classical.choose (separates a b h)`（选择公理直接取见证）——同一层抽象的两种实现；论文版有规范性、Lean 版更通用。另外论文的 `D_X` 定义对**真子集取并**（保证 (ii) 对所有 Y⊆X），Lean 的 `entries_mono` 是事后引理（closure 单调）——等价。

[推测] 失败路线候选：
1. 若去掉 (ii) 的单调性（每个 X 独立闭包），子元组图 `𝒟_{t↾J}` 的条目集合 `D_{X_J} ⊆ D_X` 失败，`q_t` 的像不再守恒，限制图与子元组图不再相等（end:diagrams (i) 的"Both labels denote the same entry"断裂）。
2. 若闭包只做一轮（A₁ 而非 C(A)），外延性失败：a,b∈A 的见证在 A₁，但 A₁ 中新增的 w₁,w₂ 的区分见证需要第二轮。迭代 ω 步才闭合。
3. 若 D 不传递（例如用 V_{η+1}），w(a,b)∈a△b 可能逃出 D，闭包出界。

### 2.3.4 图 D_{t,β} 与 end:diagrams

准备工作：固定 end:domination 的 f_α、end:countable-closures 的 D_X 与 d_X。对非空有限 X⊆D：

```latex
\begin{equation}\label{end:bad-set}
  F_X=
  \bigcup_{\substack{x,y\in D_X\\y\in x}}
       E_{\rank(y),\rank(x)}.
\end{equation}
```

可数（可数多个对的并）；单调 `Y⊆X ⇒ F_Y⊆F_X`（D_Y⊆D_X ⇒ 定义 F_Y 的每条边也被 F_X 用到）。

对互异元组 t=(x₁,…,x_k)⊆D，X={x₁,…,x_k}，X_J={x_j:j∈J}；`q_t(J,i)=d_{X_J}(i)`；对每个 β<δ 定义 arity-k 图 `𝒟_{t,β}=(ℰ_t,R_t,ρ_{t,β})`：

```latex
\begin{align}
  \ell\mathcal E_t\ell'
  &\quad\Longleftrightarrow\quad
      q_t(\ell)=q_t(\ell'), \label{end:diagram-equality}\\
  \ell R_t\ell'
  &\quad\Longleftrightarrow\quad
      q_t(\ell)\in q_t(\ell'), \label{end:diagram-membership}\\
  \rho_{t,\beta}(\ell)
  &=f_{\rank(q_t(\ell))}(\beta).
      \label{end:diagram-tags}
\end{align}
```

q_t 的像 ⊆D_X（闭包的包含性），且 (=[k],i) 枚举全部 D_X ⇒ q_t 满射 D_X。

**Lemma end:diagrams**（照抄）：

```latex
\begin{lemma}\label{end:diagrams}
For every tuple \(t\) as above, the equality quotient of
\(\mathcal D_{t,\beta}\) identifies with \(D_X\), with its
actual membership relation, for every \(\beta<\delta\).
The diagrams satisfy the following additional properties.
(i) If \(\varnothing\ne J\subseteq[k]\), restriction of
\(\mathcal D_{t,\beta}\) to the labels belonging to
\(J\), with the increasing reindexing of positions,
is exactly \(\mathcal D_{t\restriction J,\beta}\).
(ii) If \(\beta\notin F_X\), then every diagram
\(\mathcal D_{t\restriction J,\beta}\), including the full
diagram, is valid.
Consequently, for every \(\beta\notin F_X\), the colors
\[ s_{t\restriction J,\beta}
    =\iota_{|J|}(\mathcal D_{t\restriction J,\beta}), \]
pass the full subsequence test of Definition~\ref{col:test}.
\end{lemma}
```

证明机制：
- 满射 q_t + eq:diagram-equality ⇒ 商 ≅ D_X（双射）；eq:diagram-membership ⇒ 关系=真隶属（D_X 上外延，由闭包 (iii)）；tag 只依赖 q_t 像 ⇒ R 与 tag respect 等价。
- (i)：J 递增列出 {j₁<⋯<j_m}；子元组标签 (A,i) 对应原元组标签 ({j_a:a∈A},i)，两者都代表同一个 d_{X_J}(i)（**枚举 d_Y 只依赖底层集合 Y，不依赖元组中的位置**）⇒ 等价、隶属、tag 全部逐字相等。
- (ii) 全图：β∉F_X ⇒ 每条边 y∈x（x,y∈D_X）有 `f_{rank(y)}(β) < f_{rank(x)}(β)`（F_X 的定义的逆用）——恰是该边的严格 tag 不等式；`q_t({j},0)=x_j` ⇒ 单点标签互异。全有效性成立。
- (ii) 子元组：底层集 Y=X_J 的商是 D_Y，隶属外延（自身构造）；β∉F_Y 由单调性 ⇒ 同论证给子图有效。
- (i)+(ii) = 全检验的 (i)+(ii) 两条款 ⇒ 颜色组通过 T_k。

随后：对**所有** t 与所有 β（含例外坐标）定义 `s_{t,β}=ι_k(𝒟_{t,β})`——"The coding maps are defined on arbitrary diagrams, so this prescription also makes sense at the exceptional coordinates in F_X"（合法图允许无效——呼应 §1 的 𝔇_k 含无效图）。

**机械性理由**：
- **为什么 tags 是 f_{rank(q_t(ℓ))}(β) 而不是 rank 本身？** rank<η=ω₂ 超出图的 ρ 值域 δ=ω₁；f 把 ω₂ 个秩"投影"到 ω₁ 个 tag，且除可数 β 外保序（end:domination）——每个元组只需自己的可数例外集，全局无 monotone 投影 ω₂→ω₁ 存在（会破坏 ω₂ 的正则性）。这是"局部秩逼近"的精确含义。
- **为什么 B=δ×ℚ 字典序？** 论文明确：稠密无端点（有理块内取邻点；跨块时前块取大点夹住）；区间 ⊆ ([α,α']∩ω₁)×ℚ 可数；|B|=δ。再取双射 β↦b_β（"this indexing is independent of the order"——颜色按 β 标号，与序结构无关）。B 是"ω₁ 长的有理块列"，即 η 上的离散骨架 × 可数纤维——使得每个 β（秩-坐标）有自己的一列列点。
- 实现：对每个 t、β 选代表序列 `a_{t,b_β}` 表示 s_{t,β}（集合多次选择）；调 aec:arrays 得基本结构 M_u 与行选择系统 𝐳 使 `c_t^𝐳(b_β)=s_{t,β}`；于是 `E_t(𝐳) ⊆ {b_β: β∈F_X}`（可数）⇒ M_u∈K。"The chosen representatives verify that condition; they are not named in the structure"——验证用的代表不是语言成分。

Lean 对应：`EndpointDiagrams.lean` 全文件。
- `V := ZFSet.vonNeumann (ω_ 2)`，`D := Shrink V`（把 V_η 收缩到一个固定 universe 的类型），`element : D ≃ V`，`membership a b := (element a).val ∈ (element b).val`，`separates`（= V 的 ∈ 外延性，经 `membership_separates` + 传递性）。
- `rank a : Alpha`（= 元素真秩，<ω₂）。
- `seed t J`：元组位置子集 J 映到 D 的 Finset；`fullSeed t`；`entry t l := enumeration membership separates (seed t l.1) l.2`——**即 d_{X_J}(i)**；`entry_comp : entry (e.trans t) l = entry t (Label.map e l)`——对应 (i) 的"both labels denote the same entry"；`entry_root : entry t (root i) = t i`——对应 `q_t({j},0)=x_j`。
- `localTag b a := Ordinal.ToType.mk (values (rank a) (beta b))`——对应 ρ_{t,β}(ℓ)=f_{rank(q_t(ℓ))}(β)。
- `diagram t b`：eqv=entry 相等、rel=membership、tag=localTag——对应 (eq) 三式。
- `diagram_restrict : diagram (e.trans t) b = (diagram t b).restrict e`——对应 (i)，且是**字面等式**（因为 entry_comp）。
- `Good X b := ∀ a c ∈ entries X, membership a c → localTag … a < localTag … c`；`countable_bad X : {b | ¬ Good X b}.Countable`——对应 F_X 的可数性（Lean 不定义 F_X 本身，直接证坏 β 集可数：对每条边用 countable_exceptions）。
- `good_mono`（X⊆Y ⇒ Good Y b → Good X b）——对应 F_Y⊆F_X。
- `diagram_valid t b hb`——六个字段逐一：quotation 识别、rel_congr、tag_congr、decreases（=Good）、extensional（经 `CountableClosures.extensional` + `entry_surjective`）、roots（entry_root + t 单射）。
- `colors hCH t b := code ⟨t.1, diagram t b⟩`——对应 s_{t,β}=ι_k(𝒟_{t,β})，**所有 β 统一定义**（包括例外坐标，因为 code 定义在全体 Diagram 上）。
- `passes hCH t b hb : Test (fun t => colors hCH t b) t`——经 diagram_restrict + good_mono + diagram_valid，逐字对应"Consequently"一句。
- `countable_failures hCH t : {b | ¬ Test …}.Countable`——坏集可数，即对象条件。

[推测] 失败路线候选：
1. 若把 d_X 的首项约定（d_{x}(0)=x）删去，单点标签 (j,0) 可能同 E-类，Validity 的 roots 失败——图在 β∉F_X 时也无效，端点模型的对象条件崩。
2. 若对子元组重新选枚举 d'_Y（不与 d_X 相容），(i) 的字面相等断，需改用"同构"版检验——但全检验的 (ii) 条款是字面相等 `𝒟_J = 𝒟_{[k]}↾J`，同构不够。
3. 若 F_X 的定义漏掉子元组的边（例如只对 X 的元素取并），单调性 F_Y⊆F_X 破裂，可能出现"全图 β 处有效而某子图无效"的 β——全检验 (i) 条款失败。

### 2.3.5 端点双模型（Theorem end:two-models）

```latex
\begin{theorem}\label{end:two-models}
The class \(K\) has two nonisomorphic models of
cardinality \(\beth_\eta\).  One has an order sort
of cardinality \(\aleph_1\), and the other has a
countable order sort.
\end{theorem}
```

证明：M_u 由上文：|I|=|V_η|=beth_η、|B|=ℵ₁ ⇒ 总大小 κ=beth_η（aec:size）。M_c：指标集 κ、B=ℚ、全零序列——B 可数 ⇒ 对象条件自动 ⇒ M_c∈K，‖M_c‖=κ。同构保序 sort 的一元谓词 ⇒ 不可数序 sort 不能同构于可数序 sort。

**机械性理由**：分离不变量选"序 sort 的基数"是**语言可表达的**（一元谓词 B）且在两模型处取不同基数——最廉价的不变量。注意分离不依赖颜色结构：M_c 的全零颜色平凡，M_u 的颜色是精心构造的图码，但同构与否根本不用看它们。

Lean 对应：`Main.lean` 的 `EndpointModels`。`Base := Tag.{u} ×ₗ RationalBase.{u}`（Tag=ω₁ 型 × ℚ 的字典序——对应 δ×ℚ）；`locallyCountable`（Icc a b 单射入 Iic(π₁ b)×ℚ——Lean 的证明路线：tag 初始段可数 `tag_initial_countable`）；`base_cardinal : #Base = ℵ_ 1`；`data hCH : Data`，`I := D`，`bits t n b := representative (colors hCH t (baseEquiv b)).down n`（baseEquiv: Base ≃ Tag——**用选择公理把 B 的元素标号成 β**，对应论文"Fix a bijection β↦b_β"）；`object`（countable_failures 沿 baseEquiv 拉回）；`cardinal : #(data).Carrier = endpoint`。`twoModels`：M = countableData endpoint（可数基座、零 bits），N = data hCH；反证有同构 e ⇒ `(P.transport e).comparison Q` 的 base 满射 ⇒ N.B 可数（满射像的可数原像）⇒ `#Base ≤ ℵ₀` 与 base_cardinal=ℵ₁ 矛盾。**差异**：论文用"一元谓词在同构下保持"直接说基数不变；Lean 走 RawIso→Map→base 满射的机械路线（因为 Lean 的 Iso 是载体的双射+关系保持，需要从 .base 判别子推出 base sort 之间的双射）。

## 2.4 §3 categoricity：上界与尾部范畴

### 2.4.0 本章战略

三步：(A) col:collapse + col:no-pattern：固定 arity 模式不可能；(B) cat:cardinals + cat:finite-partition + cat:finite-patterns + cat:bounded：不可数基座 ⇒ |I|<Λ；(C) cat:countable-base + cat:tail：可数基座 + 等大指标 ⇒ 同构，故 μ≥Λ 处范畴。

### 2.4.1 塌缩引理（Lemma col:collapse）

```latex
\begin{lemma}[Collapse of the tagged relation]\label{col:collapse}
Let \(Q\) be a set with an extensional binary relation \(R\) and
a function \(\rho:Q\to\delta\) such that
\[ yRx\ \Longrightarrow\ \rho(y)<\rho(x). \]
Then there is an injection \(F:Q\to V_\delta\) satisfying
\[ F(x)=\{F(y):yRx\}. \]
More precisely, \(F(x)\in V_{\rho(x)+1}\) for every \(x\in Q\).
\end{lemma}
```

证明机制：按 tag α<δ 递增递归定义 F：tag α 处所有前驱已有更小 tag、其像已定义，公式给出 tag α 元素的像。Q 是集合 ⇒ 这些是集合；超限递归+Replacement 给出 Q 上的函数。界：归纳 α=ρ(x)：yRx 时 β=ρ(y)<α，归纳假设 F(y)∈V_{β+1}⊆V_α ⇒ F(x)⊆V_α ⇒ F(x)∈V_{α+1}；α=0 时前驱集空，同结论；δ 极限 ⇒ α+1<δ ⇒ 值域 ⊆V_δ。单射：归纳 max(ρ(x),ρ(x'))：F(x)=F(x') 时每个 yRx 有 y'Rx' 且 F(y)=F(y')，归纳假设 y=y' ⇒ 前驱集相等，外延性 ⇒ x=x'；归纳基 0 处两个前驱集都空，直接外延性。

证明后注记（照抄）："The proof uses the whole powerset V_{α+1}=𝒫(V_α). Thus the bound remains valid when many local diagrams contribute predecessors to the same element."——即界对"多源汇聚"稳健，不需要 R 的任何可数性。

**机械性理由**：这是 Mostowski 塌缩的带秩版本：外延+良基（由 tag 降序导出良基）⇒ 可塌缩；tag<δ ⇒ 值域 ⊆V_δ 而非整个宇宙。用途在 col:no-pattern 的最后一步：极限 (Q,R,ρ) 塌缩进 V_δ，故 |Q|≤|V_δ|。

Lean 对应：`TaggedCollapse`（Collapse.lean）。**路线差异**：Lean 不按 tag 层次递归，而直接假设 `wf : WellFounded R`，用 `wf.fix` 定义 `collapse x = ZFSet.range (fun y : {y // R y x} => collapse y)`；良基性由 tag 单独供给：`wellFounded_of_tags ρ decreases : WellFounded R`（InvImage.wf ρ Ordinal.lt_wf 的子关系闭包）。`injective`（外延性+归纳）、`rank_le ρ decreases : rank (collapse x) ≤ ρ x`（注意：Lean 证的是 `rank ≤ ρ x`，论文是 `F(x)∈V_{ρ(x)+1}` 即 `rank < ρ(x)+1`，即 `rank ≤ ρ x`——完全一致）。`embedding` 组装成 `Q ↪ ZFSet.vonNeumann δ`。

[推测] 失败路线候选：
1. 若 ρ 值域含 δ 本身（非 <δ），F(x)∈V_{ρ(x)+1} 可越出 V_δ，最终 |Q|≤|V_δ| 失效。
2. 单射性归纳的参数是 max(ρ(x),ρ(x'))；若 R 允许同 tag 的环（yRx 且 ρ(y)=ρ(x)），良基性失败，塌缩无定义—— decreases 的严格性是必需输入。

### 2.4.2 无固定模式（Lemma col:no-pattern + Remark col:pattern-quantifiers）

```latex
\begin{lemma}[No fixed pattern at all finite arities]\label{col:no-pattern}
There is no sequence \((s_j:j\ge1)\) of elements of \(S\) such that
\begin{equation}\label{col:fixed-pattern}
           T_k\bigl((s_{|J|})_{\varnothing\ne J\subseteq[k]}\bigr)
           \quad\text{holds for every }k\ge1.
\end{equation}
\end{lemma}
```

证明机制（完整展开）：
1. 反设有 (s_j)。每个 s_k 解码出图 𝒟_k，检验断言每个 𝒟_k 有效且
```latex
\begin{equation}\label{col:pattern-restrictions}
 \mathcal D_k\restriction J=\mathcal D_{|J|}
       \qquad(\varnothing\ne J\subseteq[k]).
\end{equation}
```
2. 取线序集 X，|X|>|V_δ|（可取基数 |V_δ|⁺ 的初始序数）。对每个非空有限 A⊆X：把 𝒟_{|A|} 沿 A 的递增枚举搬运，标签变成 {(U,i): ∅≠U⊆A, i<ω}；记商 Q_A、商关系 R_A、tag 函数 ρ_A。
3. A⊆B 有限非空时，标签包含 + eq:pattern-restrictions 给 `j_{A,B}:Q_A→Q_B`；由 col:quotients：单射、保 tag、保且反射 R、合成 `j_{B,C}∘j_{A,B}=j_{A,C}`。
4. **显式极限**：`P={(A,a): ∅≠A⊆X 有限, a∈Q_A}`（集合指标的、每片可数的并——仍是集合）；等价 `(A,a)∼(B,b) ⟺ j_{A,A∪B}(a)=j_{B,A∪B}(b)`。传到更大的公共阶段保持等式、单射反射之；合成律 ⇒ ∼ 是等价关系（传递性的两个见证可同时读进三指标并的阶段）。Q=P/∼；`j_A:Q_A→Q`，`a↦[(A,a)]`；单射；`j_B∘j_{A,B}=j_A`；Q 的每个有限子集落在某个 j_A 的像里。
5. 极限上的结构：tag `ρ(j_A(a))=ρ_A(a)`；关系经有限公共阶段定义：
```latex
\begin{equation}\label{col:limit-relation}
 j_B(b)\,R\,j_A(a)
 \quad\Longleftrightarrow\quad
 j_{B,C}(b)\,R_C\,j_{A,C}(a)
 \qquad(C=A\cup B).
\end{equation}
```
代表无关：描述同一极限点的代表在有限公共阶段相等；把该阶段与 (col:limit-relation) 用到的所有阶段取并 ⇒ 同时相等 ⇒ tag 同、关系真值同。每个 j_A 保且反射 R；`yRx ⇒ ρ(y)<ρ(x)`。
6. **极限外延**：互异 x,x′∈Q，放公共阶段 Q_A（x=j_A(a), x′=j_A(a′)）；单射 ⇒ a≠a′；Q_A 外延给出区分前驱 b（bR_A a 且 ¬bR_A a′）；j_A 保反射 ⇒ j_A(b)Rx 且 ¬j_A(b)Rx′。**"This witness remains valid even if larger stages add other predecessors"**——前驱集不同已由该见证确定，新增前驱不影响"存在一个 z 区分"。
7. 对 u∈X 取 Q_{{u}} 中标签 ({u},0) 的元素、其 Q-像 q_u；u≠v 时 col:diagram (iii) 在阶段 Q_{{u,v}} 给两元素互异；阶段映射单射 ⇒ q_u≠q_v。故 |X|≤|Q|。
8. col:collapse 用于 (Q,R,ρ) ⇒ |X|≤|Q|≤|V_δ|，与 |X| 的选取矛盾。

**Remark col:pattern-quantifiers**（照抄要点）："To obtain the contradiction, it is enough to find, for each k, a separate ordered k-tuple whose j-element subsequences all have color s_j, and whose full subsequence test passes. … The tuples need not be nested or come from a common infinite homogeneous set: the fixed colors determine the same decoded diagrams, and the tests determine every increasing position restriction between them."——即 no-pattern 消耗的假设**弱于**"存在无穷齐次集"：只需要"每个 arity 有一个（各自的）见证元组"。这是下一步 cat:bounded 的接口：有限分划论证恰好只供给这种弱形式的见证（不需要 Erdős–Rado 的无穷齐次集）。

**机械性理由**：
- 为什么矛盾指向 |V_δ|？因为 tags <δ，塌缩值域是 V_δ；若允许 tags<η，值域变 V_η，矛盾要 |X|>|V_η| 才出现——而 |X| 在应用处是 |I^M|≥Λ=beth_{ξ⁺}>beth_{ω₂}=|V_η|，其实也够。论文选 δ=ω₁ 的 tag（更紧），使端点构造的图合法（ρ 值域必须 <δ，因为 ι_k 编码所有 tag<δ 的图）——**δ 是被 col:coding 固定的**，no-pattern 必须用同一个 δ。
- P 是集合：X 是集合、每个 Q_A 可数、指标集 [X]^{<ω} 是集合。

Lean 对应：`Diagrams.lean` 的 `NoPattern`。架构差异明显：
- Lean 不构造 P/∼ 的自由极限，而用 Mathlib 的 `DirectLimit`：对线序类型 J（将取 X 的有限子集 Finset J 按包含预序），`stage X := (d X.card).restrict (X.orderIsoOfFin rfl).symm.toEquiv.toEmbedding`（arity=|X| 的图按 X 的 canonical 枚举搬运），`stage_valid`、`stage_restrict`（相容性），`transition X Y h := qMap …`，`directedSystem` 实例（map_self/map_map 经 Label.map_comp），`Limit := DirectLimit F transition`。
- `root x : Limit` 是标签 ({x},0) 的像；`root_injective` 经 `(stage_valid …).roots`。
- `TaggedLimit.embedding`（Collapse.lean）把 DirectLimit 嵌入 vonNeumann δ：前提是 respect（关系沿转移保反射）、tags（tag 沿转移相等）、每阶段 q_extensional/q_decreases/q_bound。极限关系 `relation := DirectLimit.lift₂ R …`、`rankTag := DirectLimit.lift ρ …`——论文第 5 步的"经公共阶段定义"在 Lean 里由 DirectLimit.lift₂ 的相容性条件（respect）承担，代表无关性是 Mathlib DirectLimit 的内置内容（Quotient 的存在代表 + 相容性）。
- **外延性提升**：`TaggedLimit.extensional`——极限外延由各阶段外延 + j_A 保反射推得；对应论文第 6 步（Lean 里"new predecessors don't spoil the witness"体现为：两个元素先取公共代表阶段，在那个阶段里区分，关系的 lift₂ 定义读的就是该阶段）。
- 最终矛盾 `impossible`：`V := ZFSet.vonNeumann (ω_ 1)`；`J := (succ V.card).ord.ToType`（= 论文的 X）；`e : J ↪ Shrink V` 由 rootsEmbedding 复合 equivShrink；得 `succ V.card ≤ V.card`，矛盾。**注意 Lean 的 J 是 (ω₁ 层级 V) 的后继基数型**，即 |X| = |V_δ|⁺，与论文一致。
- Tests.no_pattern 把论文的 (s_j) 假设翻译成 `∀ n, Passes (fun m _ => p m)`，用 choose 取出 (d n)，hvalid/hcode/hcoh 三条经 code.injective 得到全 arity 的有效+相容图族 allD，调 NoPattern.impossible。**Remark 的弱形式**在 Lean 中体现为 no_pattern 的假设形态：`Passes` 只要求每个 arity 的 Passes 成立，不涉及任何公共元组族。

[推测] 失败路线候选：
1. 第 6 步是全引理最脆弱处：若极限关系定义允许"后期阶段新增的前驱"参与区分（即 R 的定义不是经公共阶段而是"存在某阶段见证"），外延性可能**过剩**（两个不同极限点可能变得不可区分，因为区分见证所在阶段与检验阶段不同）——col:limit-relation 的公共阶段定义是精确的平衡点。
2. 第 7 步：若 col:diagram (iii) 删去，q_u=q_v 可能发生，|X|≤|Q| 断——端点构造恰好需要 (iii)（roots），两者用同一条有效性条款，无法只删一边。
3. Lean 的 stage 用 `X.orderIsoOfFin`（Finset 的 canonical 递增枚举）搬运 arity-|X| 图；若 X 不是 Finset 而是任意有限集类型，两个"相同"子集的不同枚举会给出不同 stage——Lean 用 Subtype+Finset 的 canonical 化解决；论文的"along the increasing enumeration of A"同义。

### 2.4.3 基数算术（Lemma cat:cardinals）

```latex
\begin{lemma}\label{cat:cardinals}
The cardinal \(\Lambda\) is a strong limit and
\[ \cf(\Lambda)=\xi^+>\xi. \]
If \(\zeta<\Lambda\) is infinite, then both \(\xi^\zeta\) and
\((\xi^\zeta)^+\) are below \(\Lambda\).
\end{lemma}
```

证明：κ=ξ⁺ 正规且是极限序数；beth 严格递增、极限处连续 ⇒ `Λ=sup_{α<κ} beth_α` ⇒ cf(Λ)≤κ；反之 <κ 个 <Λ 的序数可用 <κ 个 beth 指标有界，正规性把指标压到 <κ ⇒ 原集 <Λ 有界 ⇒ cf(Λ)=κ。强极限：无穷 ν<Λ 取 α<κ 使 ν≤beth_α；α+1<κ ⇒ `2^ν ≤ 2^{beth_α}=beth_{α+1}<Λ`。也是极限基数。特别 ξ<Λ，且无穷 ζ<Λ 时 `ξ^ζ ≤ (2^ξ)^ζ = 2^{ξ·ζ} < Λ`（ξ·ζ<Λ + 强极限），后继也 <Λ。

**机械性理由**：ξ=2^{ω₁} 可能远小于 Λ；Λ 的强极限性+大共尾性是分划论证的燃料——有限分划估计里每步的"源基数 μ<Λ"与"调色板 ≤ξ<cf(Λ)"都需要它。共尾性专用于 cat:finite-patterns 的"至多 ξ 个颜色、每个颜色的目标界 <Λ、ξ<cf(Λ) ⇒ sup 界仍 <Λ"的抽色论证。

Lean 对应：`ThresholdArithmetic`（Partition.lean）：`ξ := 2^{ℵ_ 1}`；`strongLimit : tailThreshold.IsStrongLimit`（`isStrongLimit_beth` + `index_limit : IsSuccLimit (succ ξ).ord`）；`cofinality : tailThreshold.ord.cof = succ ξ`（经 `Ordinal.cof_map_of_isNormal`，用的组合 ord∘beth 的正规性）；`palette_lt_cofinality : ξ < cof`；`power_lt`（FinitePartition 命名空间内：强极限 + ξ,ζ<Λ ⇒ ξ^ζ<Λ）。差异：论文还证 `(ξ^ζ)^+ < Λ`（"The successor of ξ^ζ is also below the limit cardinal"）；Lean 里对应处直接取 `μ = succ q` 并用 `hΛ.isSuccLimit.succ_lt hq`——不单列引理。

### 2.4.4 有限分划估计（Lemma cat:finite-partition）

```latex
\begin{lemma}[Finite partition estimate]\label{cat:finite-partition}
For every positive integer $m$ and every infinite cardinal
$\chi<\Lambda$, there is a cardinal $\mu<\Lambda$ such that every
map $c:[\mu]^m\to C$ with $|C|\le\xi$ has a homogeneous subset of
cardinality $\chi$.
\end{lemma}
```

证明机制（论文版，完整展开）：
1. 调色板换成 ξ。对 m 归纳；每步对**所有**无穷目标 χ<Λ 证。
2. m=1：`μ=(max(ξ,χ))⁺<Λ`。若每色类 <χ，并 ≤ξ·χ<μ 矛盾 ⇒ 某色类 ≥χ，取恰 χ。
3. 归纳步：已知 m 的断言。固定 χ。选无穷 ζ<Λ 使得"每个 [ζ]^m 的 ξ-着色有 χ 元齐次子集"（即 m 情形的源基数）。令 `q=ξ^ζ`，`μ=q⁺<Λ`（cat:cardinals）。
4. 设 c:[μ]^{m+1}→ξ。目标：找**递增代表列** 与一个后点 x，使得任取 m+1 个代表，把最后一位换成 x 后颜色不变。然后对 m-元着色 d(A)=c(A∪{x}) 用归纳假设。"The residual-set tree below groups points by their profiles on the named representatives along each branch. Its node count leaves an unnamed x, whose residuals determine the required branch."
5. 对每个 α<ζ 固定单射 `ι_α: ^{[α+1]^m} ξ → q`（存在因 |[α+1]^m|≤ζ；q=ξ^ζ）。树节点由序列 s∈^α q (α≤ζ) 指标，剩余集 X_s⊆μ 递归定义：
   - 根 X_∅=μ。
   - 后继：s 长 α<ζ、X_s 非空；命名最小点 `r_s=min X_s`；对 y∈X_s∖{r_s} 定义 profile `u_{s,y}(a)=c({r_{s↾β}:β∈a}∪{y})`，a∈[α+1]^m；`X_{s⌢i}={y∈X_s∖{r_s}: ι_α(u_{s,y})=i}`。X_s 空则后继全空。
   - 极限：`X_s=⋂_{α<γ} X_{s↾α}`。
6. 非空节点的祖先都非空 ⇒ profile 中代表全定义；沿枝代表严格递增（每个是当前剩余的最小点，后继剩余排除之）⇒ c 的参数是 m+1 个互异点；α+1≥m 后指标集 [α+1]^m 含含 α 自身的子集 ⇒ profile 含"刚命名点 r_s"的检验。
7. 节点计数：`|⋃_{α≤ζ} ^α q| ≤ |ζ+1|·q^ζ = ζ·(ξ^ζ)^ζ = ξ^ζ = q`。特别 ≤q 个点被命名；μ=q⁺ ⇒ 存在 x∈μ 从未被命名。
8. 含 x 的剩余枝唯一存在到所有 ≤ζ 层：后继步 x∈X_s ⇒ x≠r_s ⇒ 恰一个 profile 类含 x；极限步 x 属于已构造枝的交集 ⇒ 枝不在极限消失。记命名代表 `r_α (α<ζ)`，P={r_α}；严格递增且都 <x ⇒ |P|=ζ。
9. 定义 `d:[P]^m→ξ, d(A)=c(A∪{x})`。考虑 α₀<⋯<α_m<ζ：在层 α_{m-1} 枝上，前 m 个代表已出现（含刚命名者）；r_{α_m} 与 x 属于该层同一后继剩余 ⇒ 其 profile 在 {α₀,…,α_{m-1}} 上一致：
```latex
\begin{equation}\label{cat:arity-reduction}
 c(\{r_{\alpha_0},\ldots,r_{\alpha_m}\})
   =d(\{r_{\alpha_0},\ldots,r_{\alpha_{m-1}}\}).
\end{equation}
```
10. 由 ζ 的选取，d 有 χ 元齐次集 H⊆P；eq:arity-reduction ⇒ H 对 c 也齐次。

**机械性理由**：这是 Erdős–Rado 端点齐性方法（end-homogeneous，论文引 ErdosRado1956）的有限 arity 版。树是"按 profile 分桶"的经典装置；"从未被命名的 x"的存在性是计数结论（节点 ≤q < μ）；x 的枝给出与 x"同 profile"的 ζ 长代表列——**x 永不出现在 c 的参数里**，所以 d 的齐次性可以搬到 c。ζ 与 χ 的关系（第 3 步）需要 ζ→(χ)^m_ξ 型的估计，由归纳假设供给。μ=q⁺ 是后继：保证"未被命名的点"存在（q 个节点 < μ 个点）。

Lean 对应：`EndHomogeneous` + `FinitePartition.estimate`（Partition.lean）。**架构重构**：Lean 把论文的"全局树 + 未命名点"换成"**固定 x 的剩余递归**"：
- `residual c x α f := {y | (∀ β<h α, f β < y) ∧ ∀ a:Finset {β//β<α}, c (insert y (image f a)) = c (insert x (image f a))}`——直接定义"x 的剩余集"：所有与 x 在（此前命名代表，y）组合上同色的、且大于全部已命名代表者。
- `step x α f := if residual 非空 then wX.min residual else x`（最小元选择，WellFounded min）；`rep x : J → X` 由 `wJ.fix` 递归。
- `active`：x 的剩余非空（x 自己在其中）时，rep x α = min，满足三条：大于之前代表、与 x 同 profile、≤x。
- `lt_of_no_stop` / `Stops x` / `first`：若 x 从不被"追上"，rep x 严格递增且 <x。
- `stopCode x := (first x, profile x)` 且 `stopCode_injective`——**这是计数论证的替身**：若每个 x 都 Stops，则 X ↪ J×(Finset J→C)（x ↦ 停止码），与 `hcard : #(J × (Finset J → C)) < #X` 矛盾 ⇒ 存在不停者 x。
- `exists_sequence`：取不停者 x，得 `r : J ↪o X`（= rep x 的严格递增序嵌入）且 ∀ α a, `c(insert (r α) (image r a)) = c(insert x (image r a))`——恰是论文第 9 步 eq:arity-reduction 的无穷版（对**所有** α 与所有 m-子集 a 一致，比论文需要的更强）。
- `estimate` 归纳：m=0 取 χ 本身（univ）；m+1 步：从归纳假设得 ζ（源）与 m-arity 齐性保证 `hζpart`；`q := max ℵ₀ (ζ * ξ^ζ)`，`μ := succ q`；J := ζ.ord.ToType；`hcode : #(J × (Finset J → C)) < #X`（节点计数：#(Finset J→C) ≤ (…)^ζ·… ≤ q——对应论文 eq:tree-count；注意 Lean 的 q 多乘了 ζ 与 max ℵ₀，更宽松但同样 <Λ）；调 exists_sequence 得 x 与 r；对 `c' a := c (insert x (a.image r))`（m-arity）用归纳假设得 Y 齐次；`arity_step`（组合同余引理）把 c'-齐次提升为 c 在 `r '' Y` 上的 (m+1)-齐次；`mk_image_eq` 保基数。

**论文 vs Lean 的对应差异（本引理内）**：
- 论文的树按**序列 s∈^α q** 指标、剩余集 X_s 是全局对象、从未命名点 x 找枝。Lean 的 residual 是**以 x 为参数**的一元序列，把"枝"直接作为主对象；"节点计数 ≤q ⇒ 存在未命名 x"被"stopCode 单射 ⇒ 存在不停 x"替换。数学内核相同（都是鸽笼：J×(Finset J→C) 的基数 < μ），但 Lean 的组织对形式化更友好（避免处理 ^α q 的树与截段）。
- 论文的 profile 指标是 [α+1]^m（含含 α 的子集，对应"刚命名点"参与检验）；Lean 的 `residual` 条款 `∀ a : Finset {β // β < α}` 的 insert y/r α 加进去——同一含义（a 的像 ∪{y}）。
- 论文第 2 步 m=1 的基情形与"选恰 χ"；Lean m=0 基情形（arity 0 空集着色，任何 Y 齐次，色= c ∅）+ 归纳到任意 m——错位一格但等价（Lean 的 m 是"集合大小"，论文的 m 同义；Lean 的 zero 情形处理空集）。
- μ 的取值：论文 q=ξ^ζ、μ=q⁺；Lean q=max ℵ₀ (ζ·ξ^ζ)、μ=succ q。Lean 的 q 更大（吸收了 ζ≤q 与 ℵ₀），因为 Lean 的计数 `hcode` 产物是 `#(J×(Finset J→C))`（含 ζ 因子与 ℵ₀ 下界）——论文的 eq:tree-count 里 `ζ·(ξ^ζ)^ζ=ξ^ζ` 用了 q≥ζ；Lean 干脆把 ζ 乘进 q 定义，避免单独论证 q≥ζ。

[推测] 失败路线候选：
1. `residual` 的第二条（同色条款）若漏掉 `insert x` 的对照（即只要求 c(insert y …) 对所有 a 是**某个常值**），则不同 x 的剩余不可比较，exists_sequence 的等式条款（c(r α …)=c(x …)）失去推导来源。
2. μ 必须是**线序**且良序的（WellFounded X）：估计的结论对任意着色 c:[μ]^m，代表取最小元——若 X 无良序，`wX.min` 无定义。论文用 μ 的初始序数身份；Lean 用 `WellFounded ((·<·): X→X→Prop)` 假设 + 调用处 `wellFounded_lt`。
3. stopCode 单射性依赖 `equal_reps`（同 profile ⇒ 代表逐位相等，经 residual 递归构造性归纳）——若 residual 的"大于所有前代表"条款删去，两个不同的停止点可能有相同 profile 而代表不同，计数矛盾失效。

### 2.4.5 逐 arity 提取（Lemma cat:finite-patterns）

```latex
\begin{lemma}\label{cat:finite-patterns}
Let $X$ be a set with $|X|\ge\Lambda$. For each positive integer
$j$, let $c_j:[X]^j\to C_j$, where $|C_j|\le\xi$. There are colors
$p_j\in C_j$ such that for every positive integer $k$ there is
$A_k\in[X]^k$ satisfying
\[ c_j(A)=p_j\qquad (1\le j\le k,\ A\in[A_k]^j). \]
The sets $A_k$ need not be nested.
\end{lemma}
```

证明机制：
1. 递归选 p_j。不变量：选定 p₁,…,p_j 后，对每个无穷 χ<Λ 存在 Y⊆X、χ≤|Y|<Λ，使各 c_i (i≤j) 在 [Y]^i 上恒取 p_i。（j=0 由 |X|≥Λ。）
2. 归纳步：对每个无穷 χ<Λ，cat:finite-partition 供给 arity j+1、目标 χ 的源 μ_χ<Λ；取既有样本中 ≥μ_χ 者，限到 μ_χ 个点，应用引理得 |Z_χ|=χ 且 c_{j+1} 在其上常值 q_χ（老颜色保住）。
3. **抽色**：至少一个颜色作为 q_χ 出现在无界多个目标 χ 上。否则每个 q∈C_{j+1} 有一个 <Λ 的目标界；|C_{j+1}|≤ξ<cf(Λ) ⇒ 这些界的 sup 仍 <Λ，与"对每个 χ 都构造了"矛盾。取该色为 p_{j+1}，其样本建立 j+1 层不变量。
4. 固定 k：k 层不变量给无穷样本，其任 k 点即 A_k。

**机械性理由**："The sets A_k need not be nested"与 col:no-pattern 的 Remark 呼应——本引理的输出恰是"每 arity 一个见证"的弱形式。cf(Λ)>ξ 的用点在第 3 步（ξ 个 <Λ 界的 sup<Λ）。不变量里 χ≤|Y|<Λ 的"<Λ"部分保证样本仍是可继续约束的集合。

Lean 对应：`FinitePatterns`（Partition.lean）。`Prefix c n p Y := ∀ j<n, Constant (c j) j Y (p j)`（注：Lean 的 j 从 0 起、Constant 对 card=j 的 s）；`Unbounded c n p := ∀ χ<Λ, ∃ Y, χ≤#Y ∧ Prefix …`。`extend`：反证 + `choose b hb hfail`（每个 q 的失败界 χ_q）+ `Cardinal.iSup_lt_of_lt_cof_ord (hC.trans_lt hcof) hb`（**即"ξ 个界 <cf(Λ) ⇒ sup<Λ"**）+ 取 χ=max ℵ₀ sup + `inside`（= finite-partition 的"在任意足夠大的 Y 内找齐次子集"版本）+ 对老 j 用 update 之外恒等 ⇒ 得 q 使 Unbounded 在 n+1 层成立。`states`：递归定义 `{p // Unbounded Λ c n p}`（0 层取常值 c 0 ∅）；`colors n := (states (n+1)).val n`；`states_agree`（前缀一致）；`colors_unbounded`。`exists_patterns : ∃ p, ∀ k, ∃ A:Finset X, A.card=k ∧ ∀ j≤k, ∀ s⊆A, s.card=j → c j s = p j`——k 层取 ℵ₀ 目标的无界样本（无穷）+ 无穷集有任意 k 元子集。**差异**：Lean 的着色定义域是 `Finset X → C`（含基数条款）而非 [X]^j；结论里 `∀ j ≤ k`（含 j=0 与 j=k）比论文的 1≤j≤k 稍宽（j=0 平凡）。`inside` 是"齐次子集可从任意 ≥μ 的 Y 内提取"的加强版（论文在 cat:finite-patterns 第 2 步内联使用"取既有样本限到 μ_χ"；Lean 把它独立成引理，用嵌入 `μ.ord.ToType ↪ Y` + `Constant.image`）。

[推测] 失败路线候选：
1. 若 |C_{j+1}| 可以 ≥cf(Λ)，第 3 步失败：ξ 个界可 cofinal 于 Λ。这正是调色板必须 ≤ξ=2^{ω₁}（而非任意 ≤Λ）的原因——链条：颜色谱 |S^B|≤δ^δ=2^δ=ξ（cat:palette），CH 进来一次，永远绑定。
2. [推测] 若想强化结论为"A_k 可嵌套"（即存在无穷齐次集），需要 Erdős–Rado 型强结论，其源基数会跳到 beth 层级的更高处（2^ξ 级），突破 μ<Λ——论文 Remark 明确不走这条路。

### 2.4.6 上界引理（Proposition cat:bounded）

```latex
\begin{proposition}\label{cat:bounded}
If $M\in K$ and $B^M$ is uncountable, then $|I^M|<\Lambda$.
\end{proposition}
```

证明机制：
1. 反设 |I^M|≥Λ。固定 I^M 的良序（**只在本证明用**）与全体元组的行代表 z_{t,n}。颜色剖面 `c_t:B^M→S`。
2. CH ⇒ |S|=δ；aec:order-size ⇒ |B^M|≤δ ⇒ 剖面调色板
```latex
\begin{equation}\label{cat:palette}
 |S^{B^M}|\le\delta^\delta=2^\delta=\xi.
\end{equation}
```
中间等式：2^δ≤δ^δ（2≤δ）；δ^δ≤(2^δ)^δ=2^δ。
3. 对每个 j≥1：给 I^M 的 j 元子集着色 = 其递增枚举的剖面。对全体着色用 cat:finite-patterns（调色板统一为 S^{B^M}）⇒ 得剖面 p_j∈S^{B^M} 与每个 k 的递增见证元组 t_k（长 k），其递增 j-子元组剖面全为 p_j (j≤k)。
4. 对固定全局行代表，令 E_k⊆B^M 为 t_k 的全对象检验的可数例外集（含其全部非空子序列的所需检验）。`E=⋃_k E_k` 可数。B^M 不可数 ⇒ 取 b∈B^M∖E。令 `s_j=p_j(b)`。
5. 每个 k：在 t_k 上求值证明 `T_k((s_{|J|}))`——即 col:no-pattern 禁止的序列。矛盾。

**Remark cat:separate-witnesses**（照抄要点）："The witness tuples t_k may be unrelated. At the chosen coordinate b, the length-k witness certifies validity of the one diagram decoded from s_k, together with its restrictions along every increasing inclusion of positions. Those fixed diagrams are exactly the data to which Lemma col:no-pattern applies. The proof uses only countably many full-tuple exceptional sets; it does not seek a coordinate good for every tuple in I^M."——只需要**可数多个**元组的例外集可数（对象条件按 t 给例外，并才可数），不找一个对全部元组都好的坐标。

**机械性理由**：
- cat:palette 是 CH 的第二次出场（第一次在 coding）：|S|=δ 需要 CH；δ^δ=2^δ 纯算术。
- 为什么调色板是 S^{B^M}（剖面）而非 S（逐点颜色）？因为 cat:finite-patterns 需要在**同一着色函数族**上同时抽所有 arity 的模式；着色 j-元子集的"颜色"必须是整个剖面 c_t（B 上每点的颜色向量），否则不同 b 处的 s_j 无法统一起来——固定 b 后 s_j=p_j(b) 自动兼容全部 j。这是本证明最优雅的一步：把"逐坐标"的齐次性升级为"剖面"的齐次性，一次性对整个 B 求值。
- "Fix a well-order of I^M, used only in this proof"——良序只是把 [I]^j 变成有序元组的手段（检验定义在有序元组上），不入语言、不入类。

Lean 对应：`TailBound.index_lt`（TailBound.lean）+ 包装 `Data.uncountable_index_bound`（Arrays.lean）。
- `profile_cardinal (hB : #B ≤ ℵ_ 1) : #(B → Palette) ≤ ξ`——eq:cat:palette（`power_le_power_left` + `mul_eq_right`；注意 Lean 直接证 `#(B→Palette) ≤ (2^{ℵ₁})` 形：#(B→Palette)=#Palette^#B ≤ 𝔠^{ℵ₁}=(2^{ℵ₀})^{ℵ₁}，在 CH 下 = 2^{ℵ₁}……Lean 的实际推导：`palette_cardinal` 给 #Palette=𝔠，`← two_power_aleph0` 即 𝔠=2^{ℵ₀}，然后 power 运算把 `#B ≤ ℵ₁` 吸收成 `(2^{ℵ₀})^{ℵ₁}=2^{ℵ₀·ℵ₁}=2^{ℵ₁}=ξ`——最后 `mul_eq_right` 用 ℵ₀·ℵ₁=ℵ₁。与论文 δ^δ=2^δ 的路线略不同但同值）。
- `TuplePatterns`：`sorted s (hs : s.card=n+1) : Tuple I`（Finset 的 orderEmbOfFin——**递增枚举**）、`support`、`sub_sorted`（子元组的支撑是子集的 canonical 排序）、`setColor c p0 s`（把"着色 Finset"提升为与 FinitePatterns 接口匹配的形式：card=0 时取 p0）、`sub_color`（齐性条件 `∀ j≤n+1, ∀ r⊆s, r.card=j → setColor c p0 r = p j` ⇒ 子元组颜色 `c (sub (sorted s hs) e) = p (m+1)`——恰是论文第 5 步"在 t_k 上求值"的形式化）。
- `index_lt`：反证 #I ≥ tailThreshold；`let : LinearOrder I := linearOrderOfSTO WellOrderingRel`（**良序化为线序**——对应论文"Fix a well-order of I^M"）；p0 = 常零剖面的包装（card=0 情形的哑色）；调 `FinitePatterns.exists_patterns tailThreshold ξ (fun _ => setColor c p0) … (profile_cardinal hB) hI` 得 p 与 A_n；`t n := sorted (A n)`；`hcount := ⋃ n, {b | ¬ Test … (t n)}` 可数（**可数多个元组的坏集之并**——Remark 的形式化）；B 不可数 ⇒ 取 b∉∪；`hb' n : Test … (t n)`；最后 `apply Tests.no_pattern hCH (fun n => p (n+1) b)`——s_j := p_j(b)，再对每个 n 用 sub_color 把 (hd m e).2 的 code 等式转成 `c (sub (t n) e) b = p (m+1) b`。
- `Data.uncountable_index_bound`：把抽象定理接到 Data：`TailBound.index_lt hCH M.base_bound hB M.colors hM`——base_bound 即 aec:order-size 的 Lean 版，hM 即对象条件。

[推测] 失败路线候选：
1. 若 B^M 可数，第 4 步取 b∉E 失败——所以命题必须假设 B 不可数；这也解释了端点模型为何恰好卡在"基座不可数"上：可数基座的一切都被 matrix 分解抹平（见 cat:countable-base）。
2. 若对象条件的例外集要求**全体元组共用一个**可数集，则 ⋃_k E_k 不可数（可数多个 t 也未必共用），b 的选取失败，cat:bounded 崩——同时端点构造也崩（F_X 依赖 t）。对象条件的 t-依赖是全链条的润滑剂。
3. [推测] 若把 Λ 降为 beth_{ξ}（去掉 +），则 cf 问题：Λ'=beth_ξ 可能共尾 ξ（若 ξ 奇异则更糟），第 3 步抽色需要 ξ<cf(Λ')，而 cf(beth_ξ) 可 = cf(ξ) ≤ ξ——分划论证失效。这就是指标必须取**后继** ξ⁺ 的原因（正规性）。

### 2.4.7 可数基座同构（Lemma cat:countable-base + 图）

```latex
\begin{lemma}\label{cat:countable-base}
If $M,N\in K$ have countable base orders and $|I^M|=|I^N|$, then
$M\cong N$.
\end{lemma}
```

证明机制：
1. 取双射 f:I^M→I^N。两个基座都是非空可数无端点稠密线序 ⇒ 良序构造线序同构 g（交替把两边枚举的下一个未用点配进去；稠密性在中点处供点、无端点性在外侧供点；合适区间无穷多点 ⇒ 避开有限个已用点；取并得 g）——Cantor 背同构定理的手工版。
2. g 诱导群同构 `ĝ:G(B^M)→G(B^N), u↦g[u]`（把码群元素等同于其支撑）；G_* 按固定元素配对；B^M 枚举为 (b_k)（**不必保序**）。
3. 固定一个元组 t 与其像 f(t)，选代表 z_n∈Z^M_{t,n}, w_k∈W^M_{t,b_k}, z′_n∈Z^N_{f(t),n}, w′_k∈W^N_{f(t),g(b_k)}；比特矩阵 a(n,k)=e^M(z_n,w_k), a′(n,k)=e^N(z′_n,w′_k)，差 `d(n,k)=a(n,k)+a′(n,k)`（Z/2）。
4. **三角分解**：
```latex
\begin{equation}\label{cat:triangle-supports}
 \begin{split}
 U_n&=\{g(b_k):k\le n\text{ and }d(n,k)=1\}\in G(B^N),\\
 V_k&=\{n:n<k\text{ and }d(n,k)=1\}\in G_*.
 \end{split}
\end{equation}
```
U_n 有限（只用前 n+1 列）、V_k 有限（只用前 k 行）；两区域分拆矩阵 ⇒
```latex
\begin{equation}\label{cat:triangle-equation}
 \boldsymbol 1_{g(b_k)\in U_n}
       +\boldsymbol 1_{n\in V_k}=d(n,k)\pmod2.
\end{equation}
```
5. 平移：z̃′_n=z′_n+U_n、w̃′_k=w′_k+V_k；(aec:bit)+eq:triangle-equation ⇒ `e^N(z̃′_n,w̃′_k)=a′+d=a`。
6. 纤维双射（等变映射）：
```latex
\begin{equation}\label{cat:equivariant-maps}
 z_n+u\longmapsto z̃′_n+ĝ(u),\qquad
 w_k+v\longmapsto w̃′_k+v.
\end{equation}
```
等变 ⇒ 保作用图；对任意 u,v 的目标比特三行计算（(aec:bit) 展开、ĝ 保关联、与 e^M 比较）⇒ 保整个比特关系。
7. 每个元组单独做；不同元组纤维不交、无跨元组关系；连同 f,g,ĝ,G_* 固定元素映射构成全域双射，保且反射一切 ⇒ 同构。

**机械性理由**：**可数性在三角分解处进入**：列必须可枚举 (b_k)，U_n 的"只用前 n+1 列"才是有限。不可数 B 时 d 的支撑可散布在不可数列上，U_n 不可能有限——这就是 cat:bounded 的上界与 cat:countable-base 的同构之间的**互补分界**：基座可数 ⇒ 全同构；基座不可数 ⇒ 大小被 Λ 截断。图（matrix-decomposition）：行区 (k≤n) 与列区 (n<k) 分拆 ω×ω，每行至多 n+1 个修改位、每列至多 k 个修改位——"finite row and column translations remove every difference matrix"。
- **为什么这个引理是尾部范畴性的全部？** μ≥Λ 的模型：B≤δ<Λ≤μ 强制 |B| 可数（反证不可数 ⇒ |I|<Λ≤μ=max(|I|,|B|,ℵ₀) 矛盾）；μ=max(...)=μ ⇒ |I|=μ；于是任意两模型等大指标+可数基座 ⇒ 同构。存在性由 aec:arrays（基座 ℚ、零序列）。

Lean 对应：`Matrix`（Arrays.lean）+ `countableMap`/`countable_isomorphic`（ArrayEmbeddings.lean）。
- `Matrix.bit a n u b v := a n b ^^ decide (b∈u) ^^ decide (n∈v)`——(aec:bit) 的规范形。
- `Matrix.decompose [Countable B] (d : ℕ → B → Bool) : ∃ U V, ∀ n b, (decide (b∈U n) ^^ decide (n∈V b)) = d n b`——**eq:triangle-supports 的 Lean 形态**：`ix := Encodable.encode b`（可数 B 的编码 ℕ-值），`U n := range(n+1).preimage ix |>.filter (d n ·)`（行区：编码 ≤n 的列），`V b := range (ix b).filter (d · b)`（列区：行 n < ix b）。逐格 case split（ix b ≤ n 与 > n）验证。**差异**：论文按任意枚举 (b_k) 三角分拆；Lean 用 canonical 编码序 ix——同一个"下三角/上三角"分拆思想，Lean 的枚举由 Encodable 结构给出（仍不必保 B 的序）。
- `Matrix.normalize a a'`：对差 d 分解 ⇒ 存在 U,V 使 `bit a' n (U n) b (V b) = a n b`——即"有限平移抹平任意差矩阵"。
- `countableMap ei eb : Map M N`：对每个 t 调 normalize，rowShift=(U t n).map eb（把 N 基座中的平移搬回 M 侧）、colShift=V；bit_agrees 经 simp。**注意 Lean 的 Map 方向与平移的分配**与论文 eq:equivariant-maps 的 z̃′=z′+U 一致（onPoint 里 `rowShift t n ∆ s.map …`）。
- `countable_isomorphic [Countable M.B] [Countable N.B] (hI : #M.I = #N.I) : ∃ f, 满射 index ∧ 满射 base`：ei 由 hI，eb 由 `Order.iso_of_countable_dense`（Mathlib 的 Cantor 定理——论文第 1 步的手工构造在 Lean 中被库吸收）。
- 等变映射与全关系保持：`Map.onPoint` + `Map.rel`/`Map.rawRel`（ArrayMaps.lean：16 个符号逐条 `N.rawRel s (xs.map f.onPoint) ↔ M.rawRel s xs`）+ `Map.bit_all`（(aec:bit) 的平移不变性）——对应论文第 6–7 步。
- 同构封装：`Map.equiv`（Bijective）、AEC.Presentation.isoOfMap。

[推测] 失败路线候选：
1. 三角分解是**逐元组**的（每个 t 自己的 U_n,V_k）；若想跨元组统一平移，不同元组的比特矩阵无关，统一 U 不存在——论文"Carry out this construction separately for every tuple t"必须逐字执行。
2. Countable B 的要求出现在 `nonempty_encodable B`：若无编码，U_n/V_k 的定义失去"有限"性；此处也是 Lean 侧 `Matrix.decompose` 的实例前提。
3. [推测] g 的构造若用"back-and-forth 长度 ω 的超限版本"会在可数情形退化（多走无害），但若 B 不可数时会误以为同构存在——与 cat:bounded 的矛盾互为镜像。

### 2.4.8 尾部范畴（Theorem cat:tail）

```latex
\begin{theorem}\label{cat:tail}
The class $K$ is categorical in every cardinal $\mu\ge\Lambda$.
\end{theorem}
```

证明：固定 μ。存在性：aec:arrays 取 |I|=μ、基座 ℚ、零序列 ⇒ 对象自动；aec:size 给大小恰 μ。唯一性：M∈K、‖M‖=μ ⇒ |B^M|≤δ<Λ≤μ 且 μ=max(|I|,|B|,ℵ₀) ⇒ |I|=μ ⇒ cat:bounded 迫使 B^M 可数 ⇒ 任意两模型等大指标+可数基座 ⇒ cat:countable-base ⇒ 同构。含 μ=Λ 本身（两端点包含）。

Lean 对应：`Categoricity.tail`（Main.lean）：`Existence.models hCH μ`（countableData：I=μ.ord.ToType、B=RationalBase=ULift ℚ、bits 恒 false；countableData_object/cardinal）+ 唯一性半句（`countable P.data …`、`countable Q.data …`、`countable_isomorphic`、`isoOfMap`）。辅助：`aleph_one_lt : ℵ₁ < tailThreshold`（Cantor+palette_lt——对应 δ<Λ）；`index_eq`（大载体 ⇒ #I=μ——对应 μ=max 推 |I|=μ：反证 #I<μ 时 max(max #I #B) ℵ₀ < μ 与 hM 矛盾，其中 #B<μ 由 base_bound+aleph_one_lt）；`countable`（大对象 ⇒ B 可数：反证 ⇒ uncountable_index_bound 给 #I<tailThreshold≤μ 与 index_eq 矛盾）。

## 2.5 §5 conclusion：总装与逻辑范围

### 2.5.1 thm:main 的证明

照抄：
```latex
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Work in ZFC with CH. Theorem~\ref{aec:class} gives an AEC \(K\) with
\(\LS(K)=\aleph_0\). Hence
\[ H(K)=\beth_{(2^{\aleph_0})^+}=\beth_{\omega_2}=\beth_\eta. \]
Theorem~\ref{end:two-models} supplies two nonisomorphic models of this
cardinality. Theorem~\ref{cat:tail} gives categoricity in every
\(\mu\ge\Lambda\). Finally, Cantor's theorem gives
\(\xi=2^\delta\ge\delta^+=\eta\), so \(\xi^+>\eta\). By strict
increase of the beth hierarchy,
\[ \Lambda=\beth_{\xi^+}>\beth_\eta=H(K). \]
Thus \(\lambda=\Lambda^+\) satisfies the premise of the proposed
transfer and its conclusion fails at \(\mu=H(K)\), as claimed.
\end{proof}
```

四步：AEC 存在（aec:class）→ CH 数值核对 H(K)=beth_η → 双模型（end:two-models）+ 尾范畴（cat:tail）→ Cantor+beth 严格增给 Λ>H(K) ⇒ 取 λ=Λ⁺：前提成立（λ≥H(K) 且在 λ 处范畴——因为 λ≥Λ），结论失败（H(K) 处双模型）。

Lean 对应：`main hCH`（存在 L 可数、K：IsAEC ∧ HasLSNumber ℵ₀ ∧ endpoint=hanf ℵ₀ ∧ TwoModels endpoint ∧ ∀ μ≥tailThreshold, Categorical μ）与 `endpoint_lt_tailThreshold`（beth_strictMono + ord 层面 ℵ₂ < succ(2^{ℵ₁})，用 Cantor：ℵ₂= succ ℵ₁ ≤ 2^{ℵ₁}< succ 2^{ℵ₁}）与 `prescribed_transfer_fails hCH`（存在 L,K：IsAEC ∧ HasLSNumber ℵ₀ ∧ `hanf ℵ₀ < succ tailThreshold` ∧ `Categorical (succ tailThreshold)` ∧ `¬ Categorical (hanf ℵ₀)`）——**Lean 的最终定理直接就是"转移失败"形态**，对应论文 thm:main 的"In particular"句 + Θ 的核心内容。`endpoint = hanf (ℵ₀:Cardinal)` 在 CH 下成立：`endpoint_eq_hanf` 展开 `rw [hCH, succ_aleph, ord_aleph]; congr 2; norm_num`（2^{ℵ₀}=ℵ₁ ⇒ succ=ℵ₂ ⇒ ord ω₂）。

### 2.5.2 集合论表述与一致性（Θ, Corollary cor:consistency）

Θ 的定义（转录）：Θ 断言存在集合 p=(ι_k:k≥1)（col:coding 型编码映射），使 Definition aec:objects 的特定公式定义 AEC K_p，且 LS(K_p)=ℵ₀、在 h(ℵ₀) 处两个互不同构模型、在 Λ⁺>h(ℵ₀) 处范畴，Λ=beth_{(2^{ℵ₁})⁺}。"Here the fixed definitions and the AEC and categoricity conditions are expanded into one sentence of set theory; all quantified parameters, structures, maps, and sequences are sets."——一切量化的都是集合，Θ 是一阶集合论语句。

Φ 的固定族实例：对 (eq:target) 的任一一阶形式化 Φ，ZFC 证明其蕴含"固定族实例"：对每个合法 p，若 K_p 是 AEC、LS=ℵ₀、Λ⁺>h(ℵ₀)、在 Λ⁺ 处范畴，则 K_p 在 h(ℵ₀) 处范畴。

cor:consistency：ZFC ⊢ CH⇒Θ；ZFC ⊢ CH⇒¬Φ；Con(ZFC)⇒Con(ZFC+Θ)⇒Con(ZFC+¬Φ)；ZFC 一致 ⇒ 无此类 Φ 是 ZFC 定理。证明：Θ 由固定公式+参数 p 表达，构造即其验证；Gödel 相对一致性给 Con(ZFC)⇒Con(ZFC+CH)；后者证 Θ；Θ⇒¬Φ 已证 ⇒ Con(ZFC+¬Φ)。最后一段的限定（照抄）："The corollary gives one-sided nonprovability, not independence in both directions: neither an unconditional ZFC proof of ¬Φ nor consistency of Φ is asserted."

**机械性理由**：为什么要绕 Θ 而不直接说"ZFC+CH ⊢ ¬(eq:target)"？因为 (eq:target) 是**图式/二阶味**的陈述（"对每个 AEC…"量化真类），需要固定一个一阶替代 Φ 才能谈 Con。Θ 的参数化（存在 p）使 K_p 的定义是**固定公式**——把"类的定义"降为集合参数，从而 ZFC 能证明"CH⇒存在满足 Θ 的 p"。

Lean 对应：**未形式化 Con 层面**（元逻辑不可在 Lean 内直证）。Lean 的 `prescribed_transfer_fails` 是 Θ 的**逐点实例**（给定 hCH 直接构造 K 并证明三性质+失败），即论文"ZFC ⊢ CH⇒Θ"中被 ZFC 证明的那个蕴含的内部内容。Lean 的 CH 是假设 `hCH : CH.{u}` 而非定理——Gödel 一致性部分在形式化范围之外。

### 2.5.3 结构性转移定理为何不适用（Proposition prop:no-amalgamation）

```latex
\begin{proposition}\label{prop:no-amalgamation}
The class \(K\) has neither joint embedding nor amalgamation.
The failure of amalgamation can be witnessed over a countable model.
\end{proposition}
```

证明：M=端点不可数基座模型；取可数 A≤K M（aec:class 的向下 LS）。构造 N：A 的扩张，**只放大指标排序**到 Λ⁺，B^N=B^A、两个老群 sort、老元组的纤维与比特全保留；新元组加独立 torsor 与任意满足平移律的比特数组。B^N 可数 ⇒ 对象条件自动；A⊆N 是基本包含，强条件**空虚成立**（基座没长）⇒ A≤K N。若 M,N 强嵌入公共 P：M 的像迫使 B^P 不可数、N 的像迫使 |I^P|≥Λ⁺ ⇒ 违反 cat:bounded。故无 JEP，特别无 AP。

**机械性理由**：这段是"防御性证明"——解释为什么 Vasey 式（amalgamation+tameness）转移定理不与本反例矛盾：反例类连 AP/JEP 都没有。"although neither failure was needed as an input to the proof"——AP/JEP 失败是**产出**不是**原料**。最后一段（照抄要点）："the existence Hanf theorem does not imply that the particular model M has arbitrarily large extensions. The full class has arbitrarily large models with countable base; its uncountable-base part has the separate bound proved in Proposition cat:bounded. That part cannot itself have Löwenheim–Skolem number ℵ₀, because it has no countable models."——存在 Hanf 定理给的是"类中某处"的大模型（可数基座者），不是"给定模型的扩张"；不可数基座子类甚至没有可数模型，谈不上 LS=ℵ₀。

Lean 对应：**未形式化**（prop:no-amalgamation 与该节讨论不在 Lean 中）。

## 2.6 §6 booleanization：对 topos 论证的具体阻碍

> 本节独立于主定理的证明链，是对 Espíndola 2023 Theorem 4.1 的证明步骤的针对性分析。Lean 未形式化本节。

### 2.6.1 可数模型加基座点（Lemma bool:extension）

每个可数 M∈K 有可数强扩张 M′：I^{M′}=I^M、B^M⊊B^{M′}。

证明机制：
1. **造相容颜色**：取单射 j:I→ω；对非空有限 X⊆I 取满射 d_X:ω→ω，约定 d_{x}(0)=j(x)（例如 d_X(n+1)=n，第 0 值按约定）；`q_t(J,n)=d_{{x_r:r∈J}}(n)`；图 D_t 由这些值的相等/序数隶属/tag ρ_t(J,n)=q_t(J,n) 定义；商=ω；ω 上的序数隶属外延且 tag 严格降（tag<δ）⇒ D_t 有效；限制到子序列恰是其单独的有效图（**d_X 只依赖底层有限集，不依赖在更大元组中的位置**）⇒ 颜色 s_t=ι_k(D_t) 通过一切全检验。I 无穷时一元颜色互异；I 有限时大 arity 无元组 ⇒ **不产生 col:no-pattern 禁止的固定模式**（固定模式要求所有 arity；这里arity 上界 |I|）。[批注：这句是防御——本构造与 no-pattern 并不冲突，因为 I 可数时 arity 有界，I 有限时更大 arity 无着色对象；"unary colors distinct"只在 I 无穷时需要，而那正好对应"ω 上的序数隶属在 j[I] 上外延"。]
2. **扩基座**：B′=B^M+ℚ（有序和，不交 ℚ 副本）——可数稠密无端点，B^M 凸。保 I^M 与老 G_*^M 精确不变；G(B^M) 扩到 G(B′)（老码保老支撑+每个剩余有限子集一枚新码）；选老行原点 z_{t,n}，把老行 torsor 扩成 G(B′)-torsor；老列 torsor 保留并选原点 w_{t,b}；每个新 b 加一个带原点的新 G_*^M-torsor。
3. **比特 prescription**：选 a_t∈2^ω 代表 s_t，
   `a_{t,b}(n)= e^M(z_{t,n},w_{t,b}) (b∈B^M)； a_t(n) (b∈B′∖B^M)`，
   其余点用 torsor 公式 `e′(z_{t,n}+u, w_{t,b}+v)=a_{t,b}(n)+1_{b∈supp(u)}+1_{n∈v} (mod 2)`。唯一 torsor 坐标保证良定义；老平移律 ⇒ 老比特（无论真假）不变；群与作用在老参数上的值不变。恰给所要求的关系、跨元组零比特 ⇒ 基本包含；可数基座 ⇒ 对象。
4. 新基座点处（用选定的老行）颜色=s_t ⇒ 老元组检验全过；换成其他老行无影响（平移子支撑 ⊆B^M）；换列原点 mod =* 保色 ⇒ 包含是强的。aec:size ⇒ 可数。

**机械性理由**：这是 §2 强包含定义的"右可逆性"展示：对象可以永远向基座右边加点而保持可数与强——在 site 上意味着 y_A 的"加基座点"覆盖总是可实现**于可数对象内部**。

### 2.6.2 site 与 canonical point

- 𝒞₀：K 的可数模型+强嵌入范畴的小骨架；P=Set^{𝒞₀}（covariant 预层）；y_A=Hom(A,−)；cosieve=A 出发的映射对后合成封闭（=y_A 的子预层）；¬¬ 拓扑：cosieve R 覆盖 ⟺
```latex
\begin{equation}\label{bool:density}
 \text{for every } f:A\to D\text{ there is }g:D\to E
 \text{ with }gf\in R.
\end{equation}
```
Sh(𝒞₀^{op},J_{¬¬}) 是 P 的 full double-negation Booleanization。
- internal-size site 的认同：对正规无穷 θ>ℵ₀，|M|<θ 的模型 θ-presentable（θ-有向 colimit 的像落在一个阶段；coherence 给强分解；嵌入给唯一性）；反之每个模型是其 <θ 强子模型的 θ-有向并（向下 LS+θ 正规）；|M|≥θ 时恒等映射不能经成员分解。故不可数模型 ν 的 presentability rank=ν⁺；可数模型 rank 为 ℵ₀ 或 ℵ₁。引 Espíndola 2022 的约定：rank ν⁺ 记 internal size ν；极限 rank 记自身。**"Thus internal and underlying cardinalities agree here, including at ℵ₀"**——本 site 恰是可数 internal-size site。
- 对 H∈K：𝒞₀/H（对象=强映射 c:C→H，箭头=交换三角）是 ℵ₁-filtered（可数多个像装进 H 的一个可数强子模型；coherence 给转移映射；到 H 的映射单射 ⇒ 平行箭头相等）。canonical point p_H: Set→P：`p_H^*(X)=colim_{(C,c)∈𝒞₀/H} X(C)`，`p_H^*(y_A)=Hom_K(A,H)`。第一个公式保余极限与有限极限（事实上保可数极限，因指标 ℵ₁-filtered）⇒ 是 point。"No identification of all points of P with models of K is needed"——克制声明：只用了 canonical point，不假设 point 范畴=模型。

### 2.6.3 稠密余筛阻碍（Proposition bool:obstruction）

```latex
\begin{proposition}\label{bool:obstruction}
If \(H\in K\) has countable base, its canonical point \(p_H\)
does not factor through
\(\operatorname{Sh}(\mathcal C_0^{\mathrm{op}},J_{\neg\neg})\).
This applies, in particular, to every model on the categoricity tail
\(\|H\|\ge\Lambda\).
\end{proposition}
```

证明：
1. 取可数强映射 a:A→H 使像含 B^H（向下 LS+骨架代表）。
2. 定义 `R_A={r:A→D in 𝒞₀: r[B^A]⊊B^D}⊆y_A`。单射性使之为 cosieve。
3. **稠密性**：任 f:A→D，bool:extension（+同构到骨架代表）给可数强映射 g:D→D′ 添加基座外点 ⇒ gf∈R_A。(eq:density) 成立，**不用任何 amalgamation 假设**。
4. **p_H 漏掉元素**：p_H^*(R_A)→p_H^*(y_A) 的像=可分解为 h∘r（r∈R_A、h:D→H 强）的映射 A→H。但 a 不可分解：若 a=h∘r，取 b∈B^D∖r[B^A]；h(b)∈B^H=a[B^A] ⇒ 有 x∈B^A 使 h(b)=a(x)=h(r(x))，违反 h 单射。
5. ¬¬-sheafification 会翻转稠密包含 R_A↪y_A；若 p_H 穿过 sheaf 子topos，其逆像须把该包含送到同构；漏掉的元素 a 证明连满射都不是。最后：‖H‖≥Λ 的模型基座可数（aec:order-size+aec:size+cat:bounded）且存在（cat:tail）。

**机械性理由**：被否定的步骤是 Espíndola 证明中"大范畴模型给 ¬¬-sheaf subtopos 一个 point"的 canonical 实现——本类中每个可数基座模型（包括尾部上的范畴模型）的 canonical point 都**不**穿过 Booleanization。"A topology generated by a smaller chosen family of covers could omit R_A; in that case it would not be the full double-negation topology used in that step."——阻碍是**对特定拓扑（full ¬¬）与特定点（canonical）**的，不是"Booleanization 无点"的存在性否定；替代的点构造与修复所需假设均未分析（本节末句明确限定范围）。

[推测]（关于第 6 节在全文中的角色）：主定理的证明完全不依赖第 6 节；第 6 节的存在是因为论文声称与 Espíndola 2023 的 Theorem 4.1 矛盾，审稿人自然要问"对方证明哪一步在本例中失效"——第 6 节给出精确失效点（canonical point 不穿 ¬¬-sheafification），同时不越界宣称对方定理整体不可修复。这是负责任的反例论文的标准结构。[推测完毕]

---

# 三、Lean 取证（形式化对照）

> 取证范围：`E:\math\lean\OAI\ModelTheory\Categoricity\` 下 15 个模块，共约 4900 行；目标声明 `OAI.CHObstruction.main`；`formalization.yaml` 条目（行 17–19、1000 附近）：comparator_config `ComparatorChallenges/CHObstruction.json`，declaration `OAI.CHObstruction.main`，file `OAI/ModelTheory/Categoricity/Main.lean`。
> comparator 配置内容（`E:\math\lean\ComparatorChallenges\CHObstruction.json` 全文）：
> ```json
> {
>   "challenge_module": "ComparatorChallenges.CHObstruction",
>   "solution_module": "OAI.ModelTheory.Categoricity.Main",
>   "theorem_names": ["OAI.CHObstruction.main"],
>   "definition_names": [],
>   "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
>   "enable_nanoda": false
> }
> ```
> challenge 文件 `E:\math\lean\ComparatorChallenges\CHObstruction.lean` 是**题目文件**：内含 RelModel/ClassData/IsAEC/Categorical/TwoModels/CH/hanf/endpoint/tailThreshold 的定义与 `theorem main (hCH : CH) : … := sorry`——即把论文的 AEC 骨架定义作为"给定接口"，要求填 `main`。`OAI/ModelTheory/Categoricity/Model.lean` 的前 108 行与该 challenge 文件逐字相同（ definitions 复制），第 110 行起是解法侧的同一套定义。**permitted axioms 恰为 Lean 三个标准公理**：无额外集合论公理、无 godlike axioms；CH 全程作为显式假设 `hCH : CH.{u}` 出现。

## 3.1 模块依赖链

import 链（箭头 = "被 import"）：

```
Model.lean (import Mathlib)
  └─ Collapse.lean        [TaggedCollapse | Domination | CountableClosures | TaggedLimit]
       └─ Partition.lean  [EndHomogeneous | FinitePartition | ThresholdArithmetic | FinitePatterns]
            └─ Diagrams.lean  [Diagrams(标签/图/有效/限制/商) | NoPattern]
                 └─ Colors.lean   [Colors(=*商/编码) | Tuples | Tests(Passes/no_pattern)]
                      └─ EndpointDiagrams.lean  [端点图的构造与有效性]
                           └─ TailBound.lean  [TuplePatterns | TailBound.index_lt | BaseOrders]
                                └─ Arrays.lean  [Matrix | Arrays(Point/Symbol/Data) | FiniteSupports]
                                     └─ ArrayMaps.lean     [Map 的关系保持/rawRel 全表/id/comp]
                                          └─ ArrayEmbeddings.lean  [Tests.congr/map | Map.colors/exceptions/Strong | RawEmbedding | countableMap]
                                               └─ Subarrays.lean  [BaseOrders.small_hull | Data.restrict* | cardinal_eq]
                                                    └─ ArrayIsomorphisms.lean  [RawIso | Map.factor | small_subarray]
                                                         └─ DirectedLimits.lean  [LimitTools | Arrays.System(极限构造)]
                                                              └─ AEC.lean  [RelModel 运算 | Arrays.classData | AEC 公理验证 | Coding]
                                                                   └─ Main.lean  [Existence | Categoricity | EndpointModels | main]
```

值得注意的分层设计：
- **纯集合论层**（Model/Collapse/Partition/Diagrams/Colors/EndpointDiagrams）不接触"结构"概念：=* 商、编码、支配函数、可数闭包、塌缩、分划估计、固定模式否定、端点图。这一层基本是 ZFC 组合。
- **结构层**（Arrays/ArrayMaps/ArrayEmbeddings/Subarrays/ArrayIsomorphisms/DirectedLimits）定义六 sort 点类型、语言、映射与强包含、子结构、有向极限。
- **公理层**（AEC.lean）把结构层包装成 `ClassData`（objects/strong 两个谓词）并验证 `IsAEC` 的九个字段。
- **组装层**（Main.lean）存在性、端点双模型、尾部范畴、`main` 与 `prescribed_transfer_fails`。

论文 → Lean 模块的粗映射（论文节 → 模块）：
- §1 colors → Colors.lean + Diagrams.lean（Tests 命名空间）；
- §2 aec → Arrays.lean、ArrayMaps.lean、ArrayEmbeddings.lean、Subarrays.lean、ArrayIsomorphisms.lean、DirectedLimits.lean、AEC.lean；
- §4 endpoint → Collapse.lean（Domination/CountableClosures/TaggedCollapse）+ EndpointDiagrams.lean；
- §3 categoricity → Partition.lean + TailBound.lean（NoPattern 在 Diagrams.lean）；
- §5 conclusion → Main.lean；
- §6 booleanization → **无对应模块**。

## 3.2 最终定理组装

`OAI.CHObstruction.main`（Main.lean，照抄）：

```lean
theorem main (hCH : CH.{u}) :
    ∃ (L : ℕ → Type), Countable (Σ n, L n) ∧
      ∃ K : ClassData.{u} L, K.IsAEC ∧ K.HasLSNumber ℵ₀ ∧
        endpoint = hanf (ℵ₀ : Cardinal.{u}) ∧ K.TwoModels endpoint ∧
        ∀ μ, tailThreshold ≤ μ → K.Categorical μ := by
  refine ⟨Arrays.Language, Arrays.language_countable, Arrays.classData hCH,
    Arrays.AEC.isAEC, Arrays.AEC.hasLSNumber, ThresholdArithmetic.endpoint_eq_hanf hCH,
    Arrays.EndpointModels.twoModels hCH, Arrays.Categoricity.tail hCH⟩
```

五个合取项各自由一个名字给出：`language_countable`（语言可数）、`AEC.isAEC`（九字段结构体一次性构造）、`AEC.hasLSNumber`（LS=ℵ₀ 及最小性）、`endpoint_eq_hanf`（CH 数值核对）、`twoModels`（端点）、`tail`（尾部范畴）。

配套的"失败"定理（论文 thm:main 的 In particular + Θ 实例）：

```lean
theorem prescribed_transfer_fails (hCH : CH.{u}) :
    ∃ (L : ℕ → Type), Countable (Σ n, L n) ∧
      ∃ K : ClassData.{u} L, K.IsAEC ∧ K.HasLSNumber ℵ₀ ∧
        hanf (ℵ₀ : Cardinal.{u}) < succ tailThreshold ∧
        K.Categorical (succ tailThreshold) ∧ ¬ K.Categorical (hanf ℵ₀)
```

由 main + `endpoint_lt_tailThreshold`（endpoint < tailThreshold，经 beth_strictMono 与 Cantor）组装：`Categorical (succ tailThreshold)` 由 tail 的单调部分给；`¬ Categorical (hanf ℵ₀)` 由 TwoModels 的第五分量（`¬ Nonempty (M.Iso N)`）经 `fun h => hne (h.2 M N hm hn hmc hnc)` 抽出——Lean 的 Categorical 定义是"存在 ∧ 唯一"，所以"不范畴"取第二分量的否定。

**AEC 公理的字段级对应**（Lean IsAEC ↔ 论文 Definition aec:definition）：

| Lean 字段 | 论文条款 | 备注 |
|---|---|---|
| strong_objects | (1) 前半 | strong 蕴含两端都是对象 |
| refl | —（平凡条款） | 对象 M 有 M≤K M |
| antisymm | —（偏序） | Lean 给 `R = T`（RelModel 相等：载体 ZFSet 相等+关系逐点相等） |
| trans | —（偏序） | 经 strong_rebase + Map.comp |
| substructure | (1) 后半 | strong ⇒ 诱导子结构 |
| iso_objects | (1) 同构封闭 | 经 Presentation.transport |
| iso_strong | (1) 同构封闭（关系） | 有额外的载体重合假设 he（对应论文"f[M]≤K N'"需要 f 与包含相容） |
| coherence | (2) | 经 Map.factor 的分解 |
| chain_union | (3) | 非零序数链；实现为 directed_union（有向族版本） |
| downward | (4) | ⟨ℵ₀, lsBound⟩ |

Lean 的 `HasLSNumber ℵ₀ := ⟨lsBound, fun _ h => h.1⟩`——最小性证明只有一行：任何 LSBound θ' 都有 `ℵ₀ ≤ θ'`（LSBound 定义的第一条款 `ℵ₀ ≤ θ`），所以 ℵ₀ 最小。论文的对应论证："Since the language is countable and LS(K) is by definition infinite, its least possible value is ℵ₀, which is therefore the value attained here."——两侧同构：可数语言把下界钉在 ℵ₀。

## 3.3 论文引理 ↔ Lean 声明对应差异表

| 论文条目 | Lean 位置 | 状态与差异 |
|---|---|---|
| Definition col:diagram（有效图） | Diagrams.Diagram.Valid（六字段） | 一致；Lean 的 tag 类型是 `Tag := (ω_1).ToType`（类型化 <ω₁ 序数），降秩用 `tagOrdinal` 比较 |
| Lemma col:coding（编码 ι_k，两两不交值域） | Colors.code（Σ-型单射，无"不交值域"要求） | **重组**：Lean 把 arity 放进 Σ-型，检验用 `code ⟨m, d.restrict e⟩ = s m e`，避免解码歧义；`Colors.cardinal : #Color = 𝔠` 不用 CH；`diagram_bound` 用 CH |
| eq:restriction-composition（限制合成） | Diagram.restrict_comp + Tuples.sub_comp | 字面成立（rfl/simp 层） |
| Definition col:test（全子序列检验） | Tests.Passes | (i)(ii) 合并为单式；(ii) 的字面相等由 code.injective 反推 |
| Lemma col:quotients | Diagram.qMap（单射、保 tag、保反射 R）+ NoPattern.directedSystem（合成） | qMap 的良定义性用 propext（rel_congr 的 Iff 提升）——permitted axiom 的一个实际用点 |
| Definition aec:definition（AEC） | Model.ClassData.IsAEC | Lean 的 chain_union 把并的存在性做成 ∃ U（构造性）；smoothness 并入同字段 |
| Definition aec:basic（基本结构） | Arrays.Data + Point + Symbol | **收窄**：Lean 只建模自由实现（行点=(t,n,u)，u:Finset B），无任意 torsor 载体；群 sort G(B) 由 `Point.group (Finset B)` 承担、G_* 由 `Point.star (Finset ℕ)` + `Symbol.label`（每 v 一个一元谓词）承担 |
| Definition aec:basic-inclusion | RawEmbedding（(i)(iii)）+ Map.Strong.convex（(ii)） | **重组**：凸性移入 Strong |
| Lemma aec:order-size | BaseOrders.initial_bound + cardinal_le | **证明不同**：Lean 用"嵌入 ω₁ 到 B + 初始段覆盖 + Σ-单射"，论文用"可数上稠密/递归列"二分 |
| Lemma aec:size | Data.cardinal_le + cardinal_eq | 显式六分量编码 vs 论文的纤维计数 |
| eq:color / aec:representatives | Map.colors_base、color_column、Map.exceptions(_countable)、test_away | **降维**：Lean 无"行选择系统"量化（canonical 代表内置），代表无关性只以 Map 平移形式出现；强断言（老行在无例外处逐位不变）= test_away + bit_all |
| Definition aec:objects（对象/强包含） | Data.IsObject；Map.Strong（convex + outside） | Lean 对象条件无"某个 ⟺ 所有行系统"等价（不需要）；坏集按 t 量化（∀ t）与论文一致 |
| Lemma aec:arrays（自由实现） | Data 类型的直接构造性（无独立引理）+ countable_object | Lean 把引理化入类型定义 |
| Lemma aec:order-coherence | AEC.refl/antisymm/trans/coherence/iso_objects/iso_strong | trans/coherence 经 strong_rebase + Map.factor + Map.Strong.factor |
| Lemma aec:directed | DirectedLimits 全文件 + AEC.directed_union | **重构为 DirectLimit**：论文"并"= Lean 极限（对非空 Preorder-有向族）；torsor 差演算 = rowDiff/colDiff 的 Option(Finset) 对称差演算 |
| Lemma aec:convex-hull | BaseOrders.small_hull | Lean 的凸包是 `⋃ (a,b)∈T×T, Ioo (lo a) (hi b)`（显式并），论文是"凸包"抽象——同物 |
| Lemma aec:ls | Arrays.small_subarray + AEC.small | Lean 免去"行代表选择/全局换算"（canonical 结构零平移即代表）；(iii) 行支撑、(iv) 坏集并都以 indexSupport/baseSupport/坏集并实现 |
| Theorem aec:class | AEC.isAEC + lsBound + hasLSNumber | 一致 |
| Lemma end:domination | Collapse.Domination（indexEmbedding/values/eventually_lt/countable_exceptions） | 递归式经 WellFounded.fix；j_α 由 Classical.choice 从卡片不等式选 |
| Lemma end:hierarchy-size | EndpointDiagrams.cardinal（特例 η=ω₂） | **Lean 只证特例**，用 ZFSet.card_vonNeumann + preBeth_of_omega0_sq_le；一般 |V_{ω+γ}|=beth_γ 未形式化 |
| Lemma end:countable-closures | CountableClosures（泛化于 separates 参数） | 论文用固定良序的对称差首元；Lean 用 Classical.choose 取见证；d_X = enumeration（0 号位=第一个元素约定 = enumeration_singleton） |
| eq:bad-set / end:diagrams | EndpointDiagrams：F_X → 不定义 F_X 而直接证 countable_bad；diagram_restrict（字面等式）；diagram_valid；passes；countable_failures | Lean 的 Good/Good_mono 对应 F_X 可数+单调；end:diagrams (i) 在 Lean 中是**字面相等**（entry_comp） |
| δ×ℚ 字典序 | EndpointModels.Base := Tag ×ₗ RationalBase；locallyCountable；base_cardinal | Tag=ω₁ 型；b↦b_β 的双射 = baseEquiv（Classical.choice） |
| Theorem end:two-models | Main.EndpointModels.twoModels | 分离论证：论文"一元谓词保基数"；Lean"同构 ⇒ RawIso ⇒ Map.base 满射 ⇒ N.B 可数 ⇒ 矛盾" |
| Lemma col:collapse | TaggedCollapse.collapse/injective/rank_le/wellFounded_of_tags/embedding | Lean 拆出良基性为独立假设（由 tag 供给）；rank ≤ ρ x = 论文 V_{ρ(x)+1} |
| Lemma col:no-pattern | Diagrams.NoPattern（stage/transition/Limit/root/rootsEmbedding/impossible）+ Tests.no_pattern | **重构为 DirectLimit over Finsets**；矛盾 = `succ V.card ≤ V.card`（V=vonNeumann(ω₁)）；Remark 的弱形式 = no_pattern 的假设形态（逐 arity 的 Passes，无公共齐次集） |
| Lemma cat:cardinals | ThresholdArithmetic（strongLimit/cofinality/palette_lt_cofinality）+ FinitePartition.power_lt | (ξ^ζ)⁺<Λ 未单列（在 estimate 内联 isSuccLimit.succ_lt） |
| Lemma cat:finite-partition | FinitePartition.estimate（归纳）+ EndHomogeneous（residual/step/rep/exists_sequence） | **最大重构**：论文的全局 profile 树+未命名点 ↔ Lean 的"固定 x 的剩余递归 + stopCode 计数"；μ: 论文 (ξ^ζ)⁺ ↔ Lean succ(max ℵ₀ (ζ·ξ^ζ)) |
| Lemma cat:finite-patterns | FinitePatterns（Prefix/Unbounded/extend/states/colors/exists_patterns） | 抽色 = `Cardinal.iSup_lt_of_lt_cof_ord`（ξ<cf(Λ) 的直接用点）；j 从 0 起（论文从 1 起，差一位平凡） |
| Proposition cat:bounded | TailBound.index_lt + Data.uncountable_index_bound + TuplePatterns | eq:cat:palette = profile_cardinal；良序 = `linearOrderOfSTO WellOrderingRel`；"可数多个 t 的坏集之并" = Set.countable_iUnion |
| Lemma cat:countable-base | Matrix.decompose/normalize + countableMap + countable_isomorphic + Map.rawRel 全表 | 三角分解：论文枚举 (b_k) ↔ Lean `Encodable.encode`；Cantor 定理 = `Order.iso_of_countable_dense`（库） |
| Theorem cat:tail | Main.Categoricity.tail（+ index_eq/countable/aleph_one_lt） | 一致 |
| thm:main | Main.main + endpoint_lt_tailThreshold + prescribed_transfer_fails | Lean 最终定理直接是"失败"形态 |
| Θ / cor:consistency | **未形式化**（Con 层面） | prescribed_transfer_fails 是 Θ 的逐点实例 |
| Proposition prop:no-amalgamation | **未形式化** | — |
| 第 6 节 booleanization（bool:extension/site/bool:obstruction） | **未形式化** | Lean 只覆盖 §1–§5 |

## 3.4 只在 Lean 里暴露的细节

1. **Palette 的宇宙提升**。`Colors.Palette := ULift.{u} Color`：颜色商定义在低宇宙，逐宇宙提升；`palette_cardinal` 用 `Cardinal.lift_continuum`。论文完全无此关注（非形式化的基数论平铺宇宙）。同理 `EndpointDiagrams.D := Shrink.{u} V`——把 `V_η`（一个大 ZFSet）收缩到 universe u 的类型，`element : D ≃ V` 是显式搬运。这类"universe 管道"是 Lean 侧的纯开销，数学内容零。
2. **良基性的显式供给**。论文的塌缩"按 tag 递增递归"自动良基；Lean 的 TaggedCollapse 要求 `wf : WellFounded R` 作为独立参数，再由 `wellFounded_of_tags` 从 tag 降序**推导**——两步分开使同一定理可复用于 TaggedLimit（极限处的良基性同样从 tag 推）。
3. **DirectLimit 需要显式 DirectedSystem 实例**。论文的 `j_{B,C}∘j_{A,B}=j_{A,C}` 一句带过；Lean 里要给 `DirectedSystem F (fun i j h => f i j h)` 提供 `map_self`/`map_map` 两个字段——`map_self` 处 `inclusion X X le_rfl` 与 `Function.Embedding.refl` 的语义重合需要单独证明（`ext x; rfl`），是"显然但形式化可见"的典型。
4. **`Finset` vs "[k] 的子集"**。Lean 全程用 `Finset`（含判定相等实例，由 `Classical.decEq` 供给），元组是 `Fin (n+1) ↪ I` 嵌入而非"互异元组"。`Label A := {J : Finset A // J.Nonempty} × ℕ`。互异性由 `↪` 携带；`entriesList_injective`（元组→列表的单射性）用于 RawEmbedding 的 row/col 存在性论证——论文不会写这个引理（显然），Lean 必须显式。
5. **可数性的两种表达**。Lean 的 `Countable` 是类型谓词，与基数算术（`mk_le_aleph0_iff`）之间频繁换算；`Domination.prior_countable`、`EndpointDiagrams.tag_initial_countable` 等处都是"先证 Countable 再转卡片"的双语并用。论文一句话的地方 Lean 可能五步。
6. **CH 的精确进入点被 Lean 锁死**。grep `hCH` 的实际使用点：`Colors.diagram_bound`（δ^{ℵ₀} 化简）、`Colors.code`（传递）、`ThresholdArithmetic.endpoint_eq_hanf`（2^{ℵ₀}=ℵ₁）、`Main` 各处传递。`Colors.cardinal`（|S|=𝔠）**不用 CH**——与论文一致（论文 §1 coding 证明里 |S|=2^{ℵ₀} 也在 CH 之前证）。这为"反推 CH 用点"提供了机器可查的清单。
7. **`WellOrderingRel` 的出现**。`TailBound.index_lt` 中 `let : LinearOrder I := linearOrderOfSTO WellOrderingRel`——全局良序关系（Mathlib 由选择公理定义的 global well-order）。这暴露论文"Fix a well-order of I^M, used only in this proof"在 Lean 里的具体身份：不是任意良序，而是类型类的 canonical 良序。
8. **DirectLimit 的非空性要求**。`LimitTools`/`System` 要求 `[Nonempty J]`（有向族非空）与 `IsDirectedOrder`——论文"nonempty set-indexed directed family"的形式化对应；`exists_ge_ge`（任两指标有公共上界）用于 toLimit_strong/limit_object 的"跨阶段公共上界"论证。
9. **选项类型的差演算**。`rowDiffAt` 返回 `Option (Finset S.B)`：不同纤维/不同行号给 none。论文"同一纤维内两点差一个唯一平移子"的 torsor 公理在 Lean 里变成 `rowDiff_exists`（存在性：同 shape ⇒ some）与 `rowDiff_unique`（唯一性：some s = some s' ⇒ 相等，经 rowDiff_trans + symmDiff_self）。
10. **baseEquiv 的方向**。`Main.EndpointModels.data` 的 bits 定义 `… (baseEquiv b)).down n` 用了 `Base ≃ Tag` 的**任意**（Classical.choice 选出的）双射——对应论文"Fix a bijection β↦b_β; this indexing is independent of the order"。Lean 注释式的"independent of the order"在这里变成事实陈述：colors 经 data_colors 与 baseEquiv 无关地等于 EndpointDiagrams.colors（representative_color）。
11. **`Data.restrict` 的实例前提**。Lean 的限制结构要求 `[Nonempty J] [Nonempty S] [DenselyOrdered S] [NoMinOrder S] [NoMaxOrder S]` 四个类型类在 restrict 时显式携带（由 small_hull 的产出填入）——论文"N 是基本结构"一句在 Lean 里是四个 instance 参数的搬运。
12. **Lean 侧缺失/弱化的断言清单**（论文有、Lean 无）：
    - |V_{ω+γ}|=beth_γ 的一般形式（只有 γ=ω₂ 特例）；
    - `(ξ^ζ)^+<Λ` 的独立陈述；
    - col:coding 的"两两不交值域"（被 Σ-型绕开，非缺失）；
    - aec:representatives 的"两个行选择系统在可数集外一致"的**双向**陈述（Lean 只需要单向：canonical vs 沿 Map 平移）；
    - §5 的 Θ 句子、cor:consistency、AP/JEP 失败；
    - §6 全部（bool:extension、site、canonical point、bool:obstruction）。
13. **Lean 侧强化的断言清单**（Lean 有、论文弱或无）：
    - `EndHomogeneous.exists_sequence` 的等式对**所有** α 与所有有限子集 a 成立（论文只需 α₀<⋯<α_m 的链）；
    - `EndHomogeneous`/`FinitePartition.estimate`/`FinitePatterns` 全部对**抽象参数** (Λ,ξ) 表述（强极限+ℵ₀≤ξ+ξ<Λ+ξ<cf(Λ)），而非绑定 ω₁/2^{ω₁}——ThresholdArithmetic 才实例化。即 Lean 的组合核心是参数化的，论文直接绑定。
    - `CountableClosures` 对任意分离关系 R 泛化（论文只用于 ∈）。
14. **`enable_nanoda: false`** 与 permitted axioms 的含义：整条链不使用 nano-dash 目标协助，只依赖三个标准公理；`Quotient.sound`/`propext` 在颜色商（Quotient eventaSetoid）、图商（Quotient (D.setoid hD)）、以及 rel_congr 的 Iff-lift 处实质进入；`Classical.choice` 在 j_α、行代表、witness、baseEquiv、`Classical.arbitrary`（Nonempty J 的点）、`Order.iso_of_countable_dense` 的选取等处大量进入——与论文"We use choice for set-indexed families only"完全同构（所有选择都是集合上的）。

## 3.5 Lean 形式化给出的可信度增量

- **AEC 九字段全部机器验证**：论文 §2 最容易被质疑的部分（"这个类真的是 AEC 吗"，尤其 smoothness 与相干性）在 Lean 中以 `IsAEC` 结构体的构造一次通过类型检查——没有隐藏假设的余地。
- **端点模型的基数等式** `#(data).Carrier = endpoint = beth(ω₂)` 与 `endpoint = hanf ℵ₀`（CH）都在 Lean 内核对——论文的"H(K)=beth_{ω₂}=beth_η"数值巧合由机器确认。
- **no-pattern 的矛盾终点** `succ V.card ≤ V.card` 是纯序数算术的荒谬式，机器验证无误——即 col:no-pattern 的逻辑终点无缺口。
- **尾部范畴性**的推理链（大模型 ⇒ B 可数 ⇒ 等大指标 ⇒ countableMap ⇒ iso）每步是独立引理，全部形式化。
- **未被形式化的部分**（Θ/con：Con、AP/JEP 失败、第 6 节）恰是"逻辑范围声明"与"与文献的对比"，它们不承担主定理的数学正确性，但承担"反驳对象是否被精确命中"的责任——这部分仍需人工审读（见第五节）。

---

# 四、常数与参数表

## 4.1 论文侧常数（§0–§5）

| 符号 | 定义 | 首现 | 作用 | 依赖 CH？ |
|---|---|---|---|---|
| δ | ω₁ | eq:standing-cardinals | 图 tag 值域；f_α 的定义域；B 的上界尺度 | 否（其与 2^{ℵ₀} 的等同才是 CH） |
| η | δ⁺=ω₂ | 同上 | beth 指标：端点 beth_η；V_η 的层级 | 否 |
| S | 2^ω/=^* | 同上 | 颜色集合；编码值域；调色板基底 | 否（|S|=2^{ℵ₀} 无条件） |
| ξ | 2^δ=2^{ω₁} | 同上 | 分划调色板上界；Λ 的 beth 指标 = ξ⁺ | 否（其值不受 CH 影响，因为 ω₁≥ℵ₁ 时 2^{ω₁} 由 ZFC 决定不了具体 aleph，但作为卡片符号自足） |
| Λ | beth_{ξ⁺} | 同上 | 尾部范畴下界；|I| 上界 | 否 |
| H(K) | h(ℵ₀)=beth_{(2^{ℵ₀})⁺} | eq:hanf-function | 被规定阈值 | **CH 下 = beth_{ω₂}** |
| κ（cat:finite-partition 局部） | 目标齐次基数 | 引理内 | 每步归纳的目标 | 否 |
| ζ / q / μ | 源基数 / ξ^ζ（Lean: max ℵ₀(ζ·ξ^ζ)）/ μ=q⁺ | 引理内 | 分划估计的源与宿 | 否 |
| 2^k−1 | k 元组的非空子序列数 | aec:representatives 证明 | 全检验的输入个数 | 否 |
| F_X | ⋃_{y∈x, x,y∈D_X} E_{rank(y),rank(x)} | eq:bad-set (endpoint) | 元组 X 的例外 β 集 | 否 |
| E_{γ,α} | {β<δ: f_γ(β)≥f_α(β)} | end:domination | 支配例外，⊆j_α(γ)+1 | 否 |

## 4.2 Lean 侧对应

| Lean 名 | 定义（Model.lean / Partition.lean） | 对应论文 |
|---|---|---|
| `CH` | `(2 : Cardinal) ^ ℵ₀ = ℵ_ 1` | 连续统假设 |
| `hanf κ` | `beth (succ ((2:Cardinal) ^ κ).ord)` | h(κ)=beth_{(2^κ)⁺} |
| `endpoint` | `beth (ω_ 2)` | beth_η（=beth_{ω₂}） |
| `tailThreshold` | `beth (succ ((2:Cardinal) ^ (ℵ_ 1)).ord)` | Λ=beth_{ξ⁺} |
| `ThresholdArithmetic.ξ` | `(2:Cardinal) ^ (ℵ_ 1)` | ξ |
| `Colors.Sequence/equivalent/eventualSetoid/Color` | ℕ→Bool / 有限差集 / Setoid / Quotient | 2^ω、=^*、S |
| `Colors.Palette` | `ULift.{u} Color` | S（宇宙提升） |
| `Diagrams.Tag` | `(ω_ 1).ToType` | {β<δ}（tag 值域） |
| `Diagrams.Label A` | `{J : Finset A // J.Nonempty} × ℕ` | ℒ_k 的标签 |
| `Tuples.Tuple I` | `Σ n : ℕ, Fin (n+1) ↪ I` | 非空有限有序互异元组 |
| `Domination.Alpha/Beta` | `{a // a < ω_ 2}` / `{b // b < ω_ 1}` | α<η / β<δ |
| `Domination.values a b` | `⨆ g : Prior a b, succ (values g b)` | f_α(β) |
| `EndpointDiagrams.V/D` | `vonNeumann (ω_ 2)` / `Shrink V` | V_η / 其 universe 化 |
| `EndpointDiagrams.localTag b a` | `values (rank a) (beta b)` 的 ToType 包装 | ρ_{t,β}(ℓ) |
| `EndpointModels.Base` | `Tag.{u} ×ₗ RationalBase` | δ×ℚ 字典序 |
| `RationalBase` | `ULift.{u} ℚ` | ℚ |
| `IsObject hCH` | `∀ t, {b \| ¬ Test … t}.Countable` | 对象条件（E_t 可数） |
| `NoPattern` 的 `V` / `J` | `vonNeumann (ω_ 1)` / `(succ V.card).ord.ToType` | V_δ / 线序集 X（|X|=|V_δ|⁺） |

## 4.3 数值关系速查

- CH 下：`2^{ℵ₀}=ℵ₁=δ`；`H(K)=beth_{(2^{ℵ₀})⁺}=beth_{ℵ₂⁺-初始序数}=beth_{ω₂}=beth_η=endpoint`。
- Cantor：`ξ=2^δ≥δ⁺=η`（严格：`2^{ω₁}>ω₁`），故 `ξ⁺>η`，故 `Λ=beth_{ξ⁺}>beth_η=H(K)`。Lean：`endpoint_lt_tailThreshold`。
- `cf(Λ)=ξ⁺>ξ`（正规后继）——分划抽色条款。
- `|B|≤δ`（局部可数线序）；`|S^B|≤δ^δ=2^δ=ξ`（cat:palette；Lean profile_cardinal）。
- 端点：`|I|=|V_η|=beth_η`、`|B|=δ` ⇒ `‖M_u‖=beth_η`；`M_c`：|I|=beth_η、|B|=ℵ₀ ⇒ 同大小。
- 尾部：μ≥Λ 时 `max(|I|,|B|,ℵ₀)=μ`、|B|≤δ<Λ≤μ ⇒ |I|=μ 且 B 可数（否则 |I|<Λ≤μ 矛盾）。
- |V_δ|=beth_{ω₁}（no-pattern 的塌缩值域基数；|X|=beth_{ω₁}⁺）。

---

# 五、开放问题与可信度审查

## 5.1 论文明确留下的问题

1. **单侧性**：cor:consistency 只给 Con(ZFC)⇒Con(ZFC+¬Φ)。¬Φ 在 ZFC 中是否可证？Φ（被规定阈值的转移）与 ZFC 是否一致？论文明确"neither … is asserted"。[推测] 若 espíndola 定理的证明可以在某种更强的拓扑/点构造下修复，¬Φ 可能不可证——但这属外部文献动态。
2. **被规定的界是否可以下移**：反例的"H(K) 处双模型"依赖指标排序的 beth 结构；对更小的被规定界（例如 beth_{ω₁}）本构造不说话。
3. **定性 eventual categoricity 的兼容性**：本反例在 Λ 以上处处范畴，故不打击定性形式；"是否有 AEC 在 H(K) 与任意大处都双模型"是本方法之外的问题。[推测]
4. **第 6 节的修复空间**：论文只证明 canonical point 不穿 full ¬¬-Booleanization；"what additional hypotheses would suffice to repair the cited argument" 明确留白。
5. **构造的 amalgamation 失败是产出**：是否存在同时满足 AP/JEP 但仍在被规定界失败的反例？本文不回答。

## 5.2 可信度审查（按证据强度排序）

**A 级（机器验证，最高）**：
- AEC 九公理（IsAEC 构造通过类型检查）；
- LS=ℵ₀ 与最小性；
- 端点双模型（基数计算 + base sort 分离）；
- 尾部范畴性（含 cat:bounded 的 |I|<Λ）；
- no-pattern（DirectLimit 塌缩矛盾）；
- endpoint=hanf ℵ₀（CH 数值）；
- main 与 prescribed_transfer_fails 的组装。
以上全部落在 permitted axioms（propext/Quot.sound/Classical.choice）内。

**B 级（论文有、Lean 无，但论证自足且常规）**：
- |V_{ω+γ}|=beth_γ 的一般归纳（特例已被 Lean 覆盖）；
- 论文版 aec:order-size 的二分证明（Lean 有等价的另一证明）；
- prop:no-amalgamation（论证短，依赖已 A 级验证的 cat:bounded + aec:class）；
- bool:extension 与 bool:obstruction（第 6 节全部；依赖已验证的类性质 + 标准位值圆几何/预层层析）；
- Θ 的一阶展开与 Gödel 一致性推演（元逻辑，常规）。

**C 级（需要人工审读的点）**：
1. **Lean 的类 ≠ 论文的类（严格意义）**：Lean 只形式化了"自由实现 + 其诱导子结构"构成的类（classData），论文的 K 含任意 torsor 实现的基本结构。两者对**同构闭包**是否一致未证明（可数基座下由 cat:countable-base 一致；不可数基座下论文类可能含更多同构型——但论文自身也只在 canonical 实现上构造模型）。**含义**：Lean 证明的是"存在一个 AEC 具有主定理性质"，这正是 challenge 接口要求的命题；论文的 K 与 Lean 的 K 的逐点同一性不影响主定理真值。[推测] 若审稿人坚持论文的 K 原样，需补"任意基本结构都同构于某 canonical 结构的诱导子结构/或反之"的核对；从 aec:arrays 的构造看，每个基本结构选定行/列代表后比特矩阵被 (aec:bit) 完全决定，应能做成同构——但这一步论文也未明写。
2. **cat:finite-partition 的 Lean 重构**（固定 x 的剩余递归 vs 论文的全局树）数学等价性我方判断成立（stopCode 计数 ↔ 未命名点计数；exists_sequence 的等式 ⊇ 论文 eq:arity-reduction），但两者文本不同，审读时应逐条对。
3. **第 6 节的 site 认同**（"Our site is also the countable internal-size site"）涉及 Espíndola 2022 的约定翻译，论文自证了 presentability rank 的两个方向；无 Lean 支持，需对照 Espíndola 原文核对约定（尤其 ℵ₀ 处 internal size 的边界约定——论文专门写了一句对齐）。
4. **与 Espíndola 2023 Theorem 4.1 的冲突定位**：论文的立场是"canonical-point 步骤受阻"，未断言该定理整体错误；冲突的最终裁决需读对方原文（本文未提供对方证明的复述，只引用）。[外部来源判断：本素材未上网核对 Espíndola 文本。]
5. **permitted axioms 与"ZFC with CH"的匹配**：Lean 的三个公理在 ZFC 内解释（Classical.choice 对应选择公理的类型论形式），CH 是显式假设——与论文"ZFC with CH"声明一致；未用到 Lean 中可能泄漏的额外原理（如 `Classical.choice` 之外的 Prop-resizing 类问题不在 permitted 列表、也未使用）。

## 5.3 反推思维链的入口提示（供后续笔记使用）

按"从结论逆推"的顺序，本证明的强制路径是：
1. 要让"被规定阈值转移"失败，需要在 H(K) 处**有两个模型**、在某个 >H(K) 处**恰有一个**——纯反例不够，必须"上范畴、下不范畴"。
2. 上范畴的可行来源：把不可数基座全部排除（|I|<Λ 上界），剩余结构由"可数基座 + 等大指标 ⇒ 同构"吸收——需要有限行/列平移能抹平**任意**差矩阵（三角分解），故基座必须可数。
3. 下不范畴的可行来源：一个基座不可数的大模型——需要颜色编码"某种真类级的秩信息"且在每个坐标处只局部有效（支配函数 + 可数闭包图）。
4. 两者相容需要：不可数基座模型的大小被截断（no-pattern 的固定 arity 模式否定 + 分划论证提取该模式），而可数基座模型可以在**任意**大小存在（自由实现）。
5. 全部塞进一个 AEC：对象条件"逐元组可数例外"+ 强包含"新点无例外"恰好给出光滑性与相干性，同时让"可数例外集"在 LS 论证中被吸收进凸包（aec:ls 第 (iv) 条）。
6. CH 的角色：把 H(K) 精确钉在 beth_{ω₂}（双模型点），使"上范畴的下界 Λ>beth_{ω₂}"与"双模型点=被规定阈值"同时成立——若 ¬CH，H(K) 右移出 beth_{ω₂}，本构造的两点不再错位。[推测：构造本身（颜色/图/AEC）在 ¬CH 下大多照旧成立，坏的只是"H(K) 处双模型"的数值命中。]

（本文件完。全篇约 9.7 万字符；如需再扩，可在 2.2.9/2.4.4 两处按 Lean 代码行号做逐行批注。）
