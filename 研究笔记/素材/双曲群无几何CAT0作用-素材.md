# 双曲群无几何 CAT(0) 作用 —— 研究素材

素材来源与取证说明（写作前必读）：

- 正文唯一来源：`E:/math/preprints/A-hyperbolic-group-with-no-geometric-CAT0-action-September-25-2026/build/`
  下的 `main.tex`、`preamble.tex`、`sections/01-introduction.tex`…`07-completion.tex`、
  `figures/fano-template.tex`、`figures/fans.tex`、`figures/transverse-square.tex`、`references.bib`。
  PDF 已加密、无法读取，本素材不使用任何 pdftotext 提取物；所有引文均为 TeX 源码逐字照抄。
- 该 preprint 目录下不存在 `verification/` 子目录（列举时返回码 2），只有 `typst/`（未逐行核对）。
  README.md 只含标准引用块，无额外说明。⇒ 关于"官方验证清单"没有一手证据，第四节全部以 Lean 仓库源码为准。
- `E:/math/reasoning_traces/` 目录内只有另外 10 篇论文的 summary，**本篇无公开思维链 summary，
  失败路线均为基于文本证据的重构 [推测]**。第二节每条 (d) 项的"失败路线"都注明证据来源：
  要么来自论文正文的措辞（防御性句子的位置），要么来自 Lean 并行结构（同一结论在 Lean 里被拆成
  不同模块/不同引法，提示原文曾走过另一条路），绝不冒充已知事实。
- `preamble.tex` 里 `\newtheorem{theorem}/{proposition}/{lemma}/{corollary}/{definition}/{remark}` 共用
  同一计数器并按 section 重置（`\numberwithin`），因此每节的"定理"占据该节编号 1、其余按出现顺序递增。
  本素材引用的具体编号（如"引理 5.4""命题 6.5"）是**按该计数器规则推出的编号**，可能因未看到的
  环境而有偏移；因此一律同时给出 LaTeX label（如 `lem:conditional-test`、`prop:no-configuration`），
  label 才是稳定寻址方式。
- 姊妹篇《An Artin group with no geometric CAT(0) action》(2026-09-23) 在本篇正文中**完全没有被引用**
  （全库 grep 无命中），故本篇不构成对它的依赖；第四节仅在"机制对照"意义上比较两者，并明确标注这是
  外部对照而非论文自身逻辑。

---

# 一、定理与构造总览

## 1.1 主定理原文（`sections/01-introduction.tex`，label `thm:main`，节内编号推断为定理 1.1）

```tex
\begin{theorem}
\label{thm:main}
There exist a finite connected two-dimensional aspherical simplicial complex $K$ and a constant
$C<\infty$ with the following properties.
\begin{enumerate}
\item[\textup{(i)}]
Every combinatorial edge loop of length $\ell$ in the universal cover of $K$ bounds a disk
diagram with at most $C\ell$ triangular faces.
\item[\textup{(ii)}]
The group $\pi_1K$ admits no geometric action on a proper complete $\CAT(0)$ space.
\end{enumerate}
In particular, $\pi_1K$ is word-hyperbolic, and no finite simplicial complex homotopy equivalent
to $K$ admits a locally $\CAT(0)$ geodesic length metric inducing its given topology.
Consequently, no such model admits a compatible locally $\CAT(-1)$ geodesic length metric.
\end{theorem}
```

逐词拆解（左：原文；右：它到底断言/没断言什么）：

- "There exist a finite … complex $K$"：存在性陈述。同一节后面立刻补一句
  `\begin{remark}` 之前的正文句 "The proof is an existence argument and does not give an effective
  size for $K$. The filling constant may depend on the selected finite presentation." ⇒
  **没有给出 $K$ 的上界规模，也没有给出可计算的 $C$**。这不是疏漏，而是方法本身决定的：
  $K$ 来自对角线抽取（第七节），每次抽取只需"正概率"，因此无法回溯估计顶点数。
- "connected two-dimensional aspherical"：三维及以上被刻意排除。二维是随机呈现
  density < 1/6 方法与方格装配的最经济维度；"aspherical"即 $\pi_n K = 0$ 对所有 $n\ge 2$，
  于是 $\pi_1K$ 的类型同伦型完全由 $K$ 表示（Lean 里用
  `Aspherical := ∀ n, Subsingleton (HomotopyGroup.Pi (n+2))` 表达，见第四节）。
- "(i) Every combinatorial edge loop of length $\ell$ in **the universal cover** of $K$"：
  线性等周/线性 Dehn 函数是**在万向覆叠里**度量的，不是在 $K$ 本身。这一措辞很关键：
  它比"基复形上的回路"强得多（基复形只有有限多个长度 $\le \ell$ 的回路，线性上界近乎自动），
  而覆叠上的版本正是双曲性的组合等价形式。Lean 的 `LinearDiskFilling` 却把
  `a ≤ C * (p.length - 1)` 写在基复形的 `EdgePath` 上（见 4.7 的差距清单），
  并且另外用 `LiftedDiagramSampling`/`IndexedFillingValue` 的 lift 机制补上覆叠版本——
  这提示 Lean 侧曾遇到"两种表述不等价"的困难 [推测]。
- "(ii) admits no **geometric** action on a **proper complete** CAT(0) space"：
  见 1.3。注意主语是"作用"而不是"空间"：群可以有 CAT(0) 距离、可以有等距作用，
  但不能同时满足 proper + cocompact + 作用在 proper 完备 CAT(0) 空间上。
- "In particular, $\pi_1K$ is word-hyperbolic"：双曲性是 (i) 的**推论**而非假设
  （线性 isoperimetric ⇒ 细三角形 ⇒ 四条件 δ-双曲）。第七节证明里明确引用
  BH III.H.2.5(5)/2.7/2.9 完成这个转换。Lean 里对应
  `finalFinite_hyperbolic` 用 `wordHyperbolic_of_linear`（显式常数 `L := 18`,
  `K = 3*L^2*C`, `3*112*K + 2`），是把这条推论独立形式化了。
- "no finite simplicial complex **homotopy equivalent** to $K$ admits a locally CAT(0) geodesic
  length metric inducing its given topology"：这是全文最强的一条，它不是"这个 $K$ 没有 CAT(0) 度量"，
  而是"$\pi_1K$ 的任意有限同伦模型的任意Compatible 长度度量都不是局部 CAT(0)"。
  逻辑支点：若某有限同伦模型 $L$ 带局部 CAT(0) 长度度量，则其万向覆叠完备
  （原文："a Cauchy sequence upstairs projects …"），局部等距 + Cartan–Hadamard + Hopf–Rinow ⇒
  覆叠是 proper 完备 CAT(0) 空间且 $\pi_1L\cong\pi_1K$ 的 deck 作用是几何的 ⇒ 与 (ii) 矛盾。
  因此"排除几何 CAT(0) 作用"这一条**同时**排除了所有维度的有限局部 CAT(0) 模型；
  正文也点了这句（"Theorem 1.1 excludes geometric CAT(0) actions in every dimension"）。
- "Consequently, no such model admits a compatible locally CAT($-1$) …"：只用到
  CAT(−1) ⇒ CAT(0) 的常识比较（BH II.1.12(1)），是最"廉价"的一步，
  但它的叙述位置重要：这是把结果对接到 Gromov 的实现问题（"每个双曲群能否几何作用在
  CAT(−1) 空间上"）的必要措辞。

## 1.2 摘要原文（`main.tex`）

```tex
We construct a hyperbolic group with a finite classifying space that admits no geometric action
on a proper complete CAT(0) space. Consequently, a finite aspherical simplicial complex with a
linear combinatorial disk-filling inequality need not have a finite locally CAT(0) homotopy model,
and hence need not have a finite locally CAT($-1$) model. Here metric models carry geodesic length
metrics inducing the given complex topology.
```

要点：把 (i) 与 (ii) 的关系说反了的方向才是本文的贡献——**线性填充不等式（一个纯组合/度量
条件）不能推出有限局部 CAT(0) 模型存在**，即 Gromov 式"组合判别 ⇒ 几何实现"这条路失败。
最后一句 "Here metric models carry geodesic length metrics inducing the given complex topology."
是限定语：排除的是"与复形拓扑相容的长度度量"，不排除在同一个多面体上放别的、拓扑不相容的度量。

## 1.3 "geometric action" 的精确定义

论文正文没有单独定义 geometric action（这是标准用法），但 Lean 把它拆成可检的两条
（`ComparatorChallenges/HyperbolicObstruction.lean`，约 62–68 行）：

```lean
/-- A cocompact isometric action on a metric space. -/
structure GeometricAction (G : Type u) [Group G] (X : Type v) [MetricSpace X] where
  toFun : G →* X ≃ᵢ X
  proper : ∀ C : Set X, C.Nonempty → Set.Finite {g : G | ∃ x ∈ C, g x ∈ C}
  cocompact : ∃ C : Set X, C.Nonempty ∧ Bornology.IsBounded C ∧ ∀ x : X, ∃ g : G, g x ∈ C
```

以及"不存在"的表述（同文件约 79–83 行）：

```lean
def NoGeometricCATZeroAction (G : Type u) [Group G] : Prop :=
  ∀ X : Type u, Nonempty X → ProperSpace X → CompleteSpace X → CATZero X →
    IsEmpty (GeometricAction G X)
```

机械解读：
- proper（真）= 对任意紧/有界集 $C$，$\{g\mid gC\cap C\ne\varnothing\}$ 有限；
  cocompact（余紧）= 商度量空间有界。二者合起来即"作用几何"。
- `IsEmpty` 而非 `¬ ∃`：Lean 里用空类型表达，方便后面用 `by_contra` + `Classical.choice` 直接取出反例。
- 为什么只排除"几何"作用而不是所有作用：平凡作用、只在有限生成集上真但不余紧的作用都存在，
  无法排除；余紧性是把 CAT(0) 边界的拓扑/度量和群的组合刚性挂钩的**唯一**入口
  （Bridson 刚性定理谱系）。所以"无几何作用"是既强又可证的形式 [分析]。

## 1.4 关于 "not virtually special"：本文不含此内容

用户任务书要求解释 "not virtually special" 以及"否证了 Wise–Haglund 猜想的哪个方向"。
**取证结果：本篇全文（7 个 section + 摘要 + 引言）没有出现 "virtually special"、"special"、
"cube complex"、"Cubulated"、"Wise" 之外……的措辞**；grep `virtual|special` 只命中
"Ollivier–Wise"（作为 density < 1/6 随机呈现工具的引用）以及 "virtually" 未出现。
因此：
- 本文**不**声称构造的群不是 virtually special，也**不**通过"不可 cubulate"来排除 CAT(0)。
- 它与 cubulation 的唯一接触是引言里的 "Ollivier–Wise Thm 10.4"，且原文当场加了限定句
  （见 3.2 节第 5 条）："the relations used here must enforce an additional obstruction"——
  即作者明确承认：密度 < 1/6 只能给出小取消/双曲性与 cubulation 类工具，
  **不能**给出"无 CAT(0)"，必须再加障碍。
- 逻辑方向澄清 [分析]：若一个群 virtually special 且 hyperbolic，则它几何作用在一个
  CAT(0) cube complex 上（Haglund–Wise 方向的经典结论）。本文的群"无几何 CAT(0) 作用"，
  因此它**必然不是 virtually special**——但这是读者可以立刻得到的推论，不是论文的陈述对象，
  论文也未使用这一措辞。它否证的猜想方向是 **Gromov 实现问题**（问题 H11、
  Stark 2025 Open Problem 2.15、Duchesne–Simon 2026 Question W，见 1.8），
  而非 Wise 猜想的任何一个方向。

## 1.5 群与复形的定义（构造骨架）

参数（`02-model.tex`, eq `model-parameters`）：

```tex
f=2-\alpha,\qquad p=3-\beta,\qquad 0<\alpha,\delta<1,\qquad 7\alpha<\beta<1,
```

模板 $\Gamma$：顶点集用 $\mathbb F_2^3\setminus\{0\}$ 的非零向量（7 个"点" $X_A,X_B,X_C,X_D$ 与
4 个"线"标号 $Y_A,\dots,Y_D$；A=e₁, B=e₂, C=e₃, D=e₁+e₂+e₃）。$\Gamma$ 有 18 个顶点、
32 条边（式 `model-counts`：$(k_i)_i=(6,6,6,4,3,3,3)$，$\sum k_i=31$，加上 1 条松边
$e_0=X_D\text{--}CD$，环路秩 15，扇 rank 7）。
**删除**关联边 $Y_D\text{--}CD$（"Fano 平面去掉一条关联"）并**添加**松边 $e_0$——
这一删一加是整个几何障碍的源头（第六节的"例外恒等式"就落在这两个元素上）。
$f_D$ 扇不包含 $CD$ 顶点，因此 $F_D=K_{2,2}$，$F_C=K_{2,3}$（见 `figures/fans.tex`）。

四维装配（定义 `def:tables`）：
- 扇阵列：在 $S_n^{E(F_i)}$ 上，概率 $N^{f-k_i}$；
- 顶层阵列：在 $S_n^{E(\Gamma)}$ 上，概率 $N^{p-gf-1}$，其中 $p-gf-1=-12-(\beta-7\alpha)<0$；
- 90 个四格方阵表：概率 $N^{-2-\delta}$，每个 relator 写成 $\tau$ + 2 个新字母闭合；
- 6 个六格阵列：概率 $N^{-3-\delta}$；装饰多边形长度 $2h$，$h\in\{2,3\}$。
90 = 31（来自 11 个点代表：$10\cdot\binom32+\binom22$）+ 59（线度 5,5,4,5,5,5,3）。

随机复形 $P$：由扇锥、宏图 $B$（Fano 关联图，$D\text{--}CD$ 细分，15 顶点 22 边秩 8 = 15−7）、
细分路径 $r_{b_D,X_D}$ + 松字母边、顶三角、装饰多边形拼成。
引理 `lem:model-presentation`：$\pi_1P$ 由 van Kampen 锥附着给出，扇替换 ⇔ 宏关系；
$\pi_1P$ 恒有 $C_2$ 商（因为所有回路在二分部偶数长度 + 装饰长度 4,6 下均为偶字）。
主模式 $\mathcal M$：一个顶层 + 90 个方阵行 ⇒ 字段数 $32+2\cdot90=212$，行数 $|\mathcal R|=7+1+90=98$。
$\Omega_n$：均匀抽样出的 212 字段置换赋值集合。

## 1.6 三组件装配链 + 纯数值不等式无法支撑的过渡

引言里作者把证明写成三块原料（3-ingredient structure list），本素材按此排列，
并在每处标出"从这一步到下一步，数值/组合不等式本身不够，还需要什么"。

```tex
（一）随机装配 + 图论：给出线性填充 ⇒ 双曲性。
（二）能量极小化 + 超积：把填充不等式翻译成"模板 Γ 的度量构型在任何 CAT(0) 空间中存在"。
（三）刚性 + 组合几何：证明该构型不可能存在。
```

装配链（自上而下的依赖，"←"读作"由……推出"）：

1. `thm:diagram`（定理 3.1）← `lem:rank` + `lem:existence` + `lem:weighted-rank` + `lem:apex`
   + `lem:fragment` + `lem:separator`。
2. `prop:sampling`（命题 4.5）← `lem:budget` + `lem:conditional-counts` + `lem:coupling`
   + 六字母 Chernoff 估计（式 `eq-six-pair`）。
3. `prop:configuration`（命题 5.9）← `lem:minimizer` + `lem:displacement-bound` + `lem:cone-mean`
   + `lem:conditional-test` + `lem:path-bounds` + `lem:quadrilateral` + `lem:hexagon-flatness`
   + `lem:common-center` + 三分点检验。
4. `prop:no-configuration`（命题 6.5）← `lem:square` + `lem:fan-sums` + `lem:exceptional`
   + `lem:antipodal` + `prop:configuration`。
5. `thm:main` ← `lem:completion-diagonal`（对角线抽取）+ `prop:completion-no-action`
   + `lem:transfer`（跨呈现常数传递）+ `prop:no-configuration` + Cartan–Hadamard/Hopf–Rinow。

**数值/组合不等式单独不能支撑的过渡**（这是重构推理时最需要的部分）：

- (a) "阵列以正概率同时命中" ⇒ "得到的 $P$ 是 aspherical"：概率计数只给出存在性，
  asphericity 靠 `lem:existence` 的拓扑论证（Hurewicz 定理 4.32 + 胞腔一般位置 + 条带/帽/压缩 ⇒
  球面可压缩）。**纯计数不能排除 $\pi_2\ne0$。**
- (b) "面积上界 $A \le 2C_0B$ 型不等式" ⇒ "对任意回路存在线性面积上界"：
  需要 Lipton–Tarjan 平面分隔符递归（`lem:separator`, $c=2\sqrt2$）把"每个图都碎"转成
  "整个图的碎块规模 $\le \eta A$"，再靠**对偶图度数 $D=15$** 与字母转换常数 30 完成闭合。
  不等式本身不含"递归终止"信息。
- (c) "$|\Omega_n| = (1+o(1))N^{3-\beta-90\delta}$" ⇒ "条件分布足够接近乘积测度"：
  期望精确 ≠ 集中；需要 $h(W)$ 的次模性（`lem:budget`）、闭包 $U$ 的整数间隙 $\ge 1$
  与 TV 耦合（`lem:coupling`）。**一阶矩单独推不出二阶控制。**
- (d) "条件检验 $\limsup\langle h_I,v\rangle \le 0$" ⇒ "距离构型的存在"：
  这里第一次出现真正的"分析"步骤——需要极小化子的存在（properness 只在这一步用！）、
  Sturm 归纳均值的 $E\|m_t\|^2\le 1/j$、乘积空间度量与**非主超滤超极限**。
  组合概率给的是"平均场"，CAT(0) 的三角比较给的是"逐点场"，中间靠能量框架缝合。
- (e) "距离等式" ⇒ "角度/内积恒等式"：`lem:hexagon-flatness` 用反极积配对和
  $\langle u,v^+\rangle+\langle u,v^-\rangle\le0$ 把不等式的**和为 0**升级为**逐项相等 ⇒ 平**；
  这一步是纯 CAT(0) 几何，任何计数都不产生它。
- (f) "构型不可能" ⇒ "任意维度任意模型都不可能"：`prop:completion-no-action` 的措辞
  "The action spaces, their dimensions, and their local geometries are allowed to vary"
  说明障碍是**表示论/度量几何层面**的，不是对某个特定空间的排除。
- (g) "对角线抽出无穷群" ⇒ "存在无穷多个阶段满足要求"：靠 $C_2$ 商 +
  $\chi(\widetilde P)=|G|\chi(P)$ 的反证；这是代数拓扑恒等式，不是概率。

## 1.7 章节索引表

| 文件 | 节内主要 label（编号按共享定理计数器推断） | 作用 | 对应 Lean 模块簇 |
|---|---|---|---|
| `01-introduction.tex` | `thm:main`（定理 1.1） | 主定理 + 三原料叙述 +  conventions | `ComparatorChallenges/HyperbolicObstruction.lean`（`MainStatement`） |
| `02-model.tex` | 定义 2.1 `template`、2.5 `tables`；引理 2.3 `model-presentation`；注记 2.4 `model-finite` | 模板 $\Gamma$、扇、四类阵列、$P$、主模式 $\mathcal M$、可容许性 | `HyperbolicGroups/Template.lean`、`IncidenceTemplate.lean`、`Graph.lean` |
| `03-diagrams.tex` | 定理 3.1 `diagram`；引理 3.2–3.8 `rank`/`existence`/`normal-form`/`weighted-rank`/`apex`/`fragment`/`separator`；注记 3.9 `quantifiers` | 面积–边界不等式：从图计数得线性 Dehn | `OriginalLinearFilling.lean`、`Fragment.lean`、`Diagram.lean`、`LiftedDiagramSampling.lean` |
| `04-sampling.tex` | 引理 4.2 `budget`、4.3 `conditional-counts`、4.4 `coupling`；命题 4.5 `sampling`；注记 4.6 `diagonal` | 临界指数、稀疏模式、TV 耦合、六字母 Chernoff | `Sampling/Template.lean`(见 4.2)、`Test.lean`、`ConditionalStar.lean`、`SixTable.lean`、`DiagonalSampling.lean`、`SamplingStage.lean` |
| `05-energy.tex` | 引理 5.1–5.8；命题 5.9 `configuration` | 能量极小化 ⇒ 超积 ⇒ $\Gamma$ 的度量构型 | `ConditionalStar.lean`（`EnergyOrbit`）、`MetricHexagon.lean`、`Barycenter.lean` |
| `06-obstruction.tex` | 引理 6.1–6.4；命题 6.5 `no-configuration` | 构型刚性 ⇒ $\langle M_A,M_B\rangle$ 同时 $\ge0$ 与 $=-1$ | `CATZero.lean`、`CATZeroFurther.lean`、`Exceptional.lean`、`TangentCone.lean`、`Fan.lean`、`Splitting.lean` |
| `07-completion.tex` | 引理 7.1 `completion-diagonal`；命题 7.2；引理 7.3 `transfer` | 对角线抽出 $K$、跨呈现传递、CAT(−1) 排除 | `IndexedFillingValue.lean`（末段）、`SelectedPresentation.lean`、`CompactLocalCATGeometric.lean` |
| `figures/*.tex` | fano-template / fans / transverse-square | 模板图、扇形状、横截平方 | 无直接对应（`MetricHexagon.sixLine` 隐含同一标号约定） |

## 1.8 回应的公开问题（引言原文，逐条）

```tex
Gromov's problem ... Problem H11 of Baumslag--Myasnikov--Shpilrain ...
Open Problem 2.15 of Stark ... Question W of Duchesne--Simon ...
```

- Gromov 的实现问题（正文另引 Raussen–Skau 访谈 p.396 与 Gromov1987、BH III.Γ.2.6）：
  "每个双曲群是否几何作用于某个 CAT(−1) 空间？"本文给出否定答案（先否 CAT(0)，再由
  CAT(−1)⇒CAT(0) 得到更强的否定）。
- Stark Open Problem 2.15 / Duchesne–Simon Question W：涉及"线性组合填充 ⇒ 有限 CAT(0) 模型？"
  这类实现问题，摘要末句正是针对它。
- 引言对已有正向结果的处理：Brady–Crisp 定理 1/2 后原文写
  "Theorem 1.1 excludes geometric CAT(0) actions in every dimension"——
  即与"某些双曲群在所有 CAT(0) 模型上都有界周期"这类已有部分结果相比，本文给出完全排除 [解读]。

---

# 二、逐引理带批注重构

体例：每条按 (a) TeX 原文照抄（长证明只照抄关键句，省略处标"……"）、(b) 推导补全（凡原文没有
的中间步骤一律标 `[补]`）、(c) 假设/常数/指数/有限验证规模的机械理由（标 `[机械理由]`，并写清
"若把这个常数/不等式扰动会坏在哪里"）、(d) `[推测]` 失败路线（每条注明证据来源）。
Lean 对应物就地标注，行号来自 `E:/math/lean/OAI/Geometry/HyperbolicGroups/` 下实际读取。

## 2.1 定义 2.1（`def:template`，第 5–17 行）：关联模板 $\Gamma$

(a) 原文关键句：

```tex
Identify the points of the projective plane over $\F_2$ with the seven nonzero vectors of $\F_2^3$.
A line consists of the three nonzero vectors in a two-dimensional subspace. Fix
 A=e_1,\qquad B=e_2,\qquad C=e_3,\qquad D=e_1+e_2+e_3.
No three of these four points are collinear. For distinct points $i,j$, write $ij$ for their line.
The bipartite graph $\Gamma$ has a vertex $X_i$ for every point, an additional vertex $Y_i$ for
$i\in\{A,B,C,D\}$, and a vertex for every line. Both representatives over a point are joined to
each incident line, with one exception: the edge $Y_D$--$CD$ is omitted. The edge
 e_0=X_D\text{--}CD
is called the \emph{loose edge}. Every other edge belongs to the \emph{fan} $F_i$ at its point $i$.
At $D$, the fan uses only the two lines other than $CD$, so $CD$ is not a vertex of $F_D$.
```

(b) `[补]` 具体枚举。$\mathbb F_2^3$ 的非零向量按所选基写作
$A=(1,0,0),B=(0,1,0),C=(0,0,1),D=(1,1,1)$；线（二维子空间的三个非零向量）为
$AB=\{A,B,C+D\},AC=\{A,C,B+D\},AD=\{A,D,B+C\},BC=\{B,C,A+D\},BD=\{B,D,A+C\},CD=\{C,D,A+B\}$，
共 7 条线，每线 3 点、每点 3 线。顶点数 $=7\ (X_i)+4\ (Y_i)+7\ (\text{线})=18$。
边数（删除前）：每个 $X_i$ 连其 3 条线 $=21$；每个 $Y_i$ 连其 3 条线 $=12$；合计 $33$。
删除 $Y_D\text{--}CD$ 得 $32=|E(\Gamma)|$ ✓ 与式 `model-counts` 的
"$|E(\Gamma)|=32,\ \sum k_i=31$" 一致（松边不属于任何扇，故 $31+1=32$）。
扇的边数：$k_A=2\cdot3=6$（$X_A,Y_A$ 各 3 线），同理 $k_B=k_C=6$；
$k_D=3+2=5$ 减去被删的 $Y_D\text{--}CD$ 再减去松边归属… 精确说：$D$ 的两个代表点
$X_D$ 有 3 条线，其中 $CD$ 那条改成松边（不属于扇），$Y_D$ 有 2 条线（$CD$ 那条被删），
故 $k_D=2+2=4$ ✓；其余三点 $E,F,G$（$A+B, A+C, B+C$ 型）各只 1 个代表点（$X$），$k=3$ ✓。
环路秩：$32-18+1=15$ ✓；扇秩和 $=1+1+1+1+1+1+1=7$ ✓（$K_{2,3}$ 秩 $6-5+1=2$？
`[补]` 校验：$K_{2,3}$ 有 5 顶点 6 边，秩 $=6-5+1=2$；$K_{2,2}$ 有 4 顶点 4 边，秩 1；星 $K_{1,3}$
秩 $3-4+1=0$。于是 $A,B,C$ 三个 $K_{2,3}$ 给 $6$，$D$ 的 $K_{2,2}$ 给 $1$，三个星给 $0$，
总 $7$ ✓——原文"the sum of the cycle ranks of the fans is $7$"与此吻合，且 $g=7$ 这个符号
正是**扇的个数**（后文 $gf$ 里的 $g$），不是秩。

(c) `[机械理由]`
- 为什么必须"删一条关联 + 加一条松边"，而不是只删或只加：只删会让 $D$ 的度结构不对称、
  顶层宏图 $B$ 的秩不再是 $15-7=8$；只加松边而不删 $Y_D\text{--}CD$，则 $F_D=K_{2,3}$，
  第六节"例外检验"用到的四点 $Y_D,H,X_D,H_0$ 回路就会只用扇字段而失去松边的
  "免配额"作用（见 2.5、6.4）。$\mathbb F_2^3$ 的选择保证了"每两点定一线、每线三点"的
  对称性，同时 $D=e_1+e_2+e_3$ 是**唯一**不在任何坐标平面上的点，因此 $D$ 是天然的特异点。
- "$g=7$" 出现在顶层概率 $N^{p-gf-1}$ 里：$gf$ 是七个扇的期望参数总量，
  $-1$ 是顶层标记自身的花费。若把 $g$ 改成 6（少一个扇），$p-gf-1$ 会变成
  $-9-(\beta-7\alpha)$，仍负但顶层期望规模 $N^p$ 的推导（第 78 行的 $N^{32}N^{p-7f-1}\prod N^{f-k_i}$）
  不再闭合：$32-(7f+1)+\sum(f-k_i)=32-(42-7\alpha+1)+(28-7\alpha)+\dots$ `[补]` 精确核对：
  $\sum(f-k_i)=7f-31$，故指数 $=32+(p-7f-1)+(7f-31)=p$ ✓ 恒成立，与 $g$ 是否等于 7 无关，
  但**必须**用 $\sum k_i=31$ 才能把 32 与 31 的差 1（松边）留在式子里——这就是 $-1$ 的来源。
  扰动 $\sum k_i$ 的任何一项都会破坏 $N^p$ 这个"期望恰为 $N^{3-\beta}$"的结构。
- 若把 $A,B,C,D$ 选成共线三点 + 一点，则"核心六边形"（见 2.2）不存在，第五节的六边形刚性全废。

(d) `[推测]` 失败路线
1. 用**没有删除关联的完整 Fano 模板**：那时段落的对称性会使所有点等价，
   第六节的"例外恒等式 $h_0=M_C\oplus x_D$"失去附着点，反证不出矛盾；
   作者只能在图里留一个"缺口"。证据来源：`figures/fans.tex` 里被划掉的 $Y_D\text{--}CD$
   与橙色松边被单独画出并注 "omitted"，说明这个缺口是被反复调整过的设计点。
2. 用**其他密度参数化（无 $\alpha$ 只有单一密度）**：无法同时满足 $7\alpha<\beta<1$
   与 $p-gf-1<0$ 两侧的裕度，第三节 margin 说明段（"differences $\alpha,\ \beta-7\alpha,\ \delta$"）
   的存在本身即证据——三个差值都被单独命名并被吸进 $\kappa=\min\{\beta-7\alpha,\alpha/5,\delta\}$。
   证据来源：正文措辞。
3. 松边若属于某个扇：则 `def:admissible` 的"loose core field does not count against any fan
   quota"必须取消，例外检验（六节）不再是可容许的。证据来源：Lean `Template.lean` 把
   `isLoose e := e.val = (3,4)` 单独定义并在 `CoreAdmissible` 中显式排除
   （第 201 行附近），说明这是硬性依赖而非叙述方便。

Lean 对应：`Template.lean` 第 17 行 `Edge := {p : Fin 11 × Fin 7 // Incident p.1 p.2 ∧ p ≠ (10,4)}`
——11 个点代表（7 个 X + 4 个 Y）× 7 条线，`(10,4)` 即 $Y_D\text{--}CD$ 的编码，删除靠 `∧ p ≠ (10,4)`
直接实现；第 24 行 `isLoose e := e.val = (3,4)` 即 $X_D\text{--}CD$；第 76 行 `card_edges = 32`
以 `decide` 有限验证；第 82 行 `card_fan = ![6,6,6,4,3,3,3]` 逐扇核数。
⇒ Lean 用有限 `decide` 承担"计数自检"，正文只用文字断言，这是原文与形式化的第一处风格差。

## 2.2 字段/赋值约定 + 核心六边形（第 36–38 行，无编号环境）

(a) 原文照抄：

```tex
A \emph{field} is an edge position in a template or a position in a polygon word. An assignment
gives one signed letter to each field. A walk reads that letter in the specified orientation and
its inverse in the other orientation. The fields are bookkeeping coordinates; they all take values
in the same alphabet.
A \emph{core hexagon} is the six-cycle obtained from three noncollinear points, the three lines
joining them, and one representative over each point for which all six incidences are present.
In particular, the all-$X$ choice is always permitted. Any three successive edges of a core
hexagon contain at most two fields from each fan; the loose field, if present, belongs to no fan.
```

(b) `[补]` 六边形顶点序列：取非共线三点 $i,j,k$ 与其连线 $ij,jk,ki$，得二部 6-圈
$X_i,ij,X_j,jk,X_k,ki$（或任意代表点组合）。"all six incidences are present" 是对代表点选择的
约束：一旦选到 $Y_D$，其 $CD$ 关联不存在，故含 $D$ 的六边形若把 $D$ 的代表取为 $Y_D$ 且用到 $CD$
就非法；全取 $X$ 恒合法，因为所有 $X_i$ 都保留 3 条关联。
"任三连边至多含每扇 2 个字段"：六边形的三条连续边 $=p_0p_1,p_1p_2,p_2p_3$，
其中属于同一扇的至多是"点 $p$ 的两条出边"，因为六边形每个点只用到两条边
（进入与离开），因此每扇字段数 $\le 2$ ✓。这正是 `def:admissible` 条件 (i) 的几何来源。
第五节实际使用的六边形是 $A,B,C$ 型（$z_0,\dots,z_5$），第六节的三分点检验用
$H_0=CD,p=X_C,q=Y_C,z=X_D$ 构成的 4-环，与"核心六边形的半路径"重合。

(c) `[机械理由]` "field 是记账坐标，全部取值在同一字母表"——这句话是后面所有 TV 论证的地基：
两个不同字段**可以偶然取到同一字母值**，但计数时不视为同一变量（第四节原文
"an equality never compares two different coordinate fields, even if their numerical letter values
happen to be equal"）。若把"字段"与"字母值"混为一谈，`lem:coupling` 的部分匹配
（partial matching）论证立刻失效。

(d) `[推测]` 失败路线：把"字段"当作随机变量本身（而非其值），会导致重复字段被二次计费，
第四节 $h(\mathcal F)=3$ 的次模性算不出来。证据来源：Lean `Template.lean` 把 `Field` 定义为
`Edge ⊕ (TwoPath × Fin 2)`（第 113 行，card 212）——纯粹是**位置的类型**，与字母值分离，
且 `Random.lean` 的注释"Product of the independent Bernoulli trials in the source table model"
强调独立性只在阵列层面。

## 2.3 定义 2.2（`def:tables`，第 53–86 行）：四类独立 Bernoulli 阵列

(a) 原文（列表体照抄，第 56–61 行）：

```tex
\item For each point $i$, an array indexed by $S_n^{E(F_i)}$ includes every tuple with probability $N^{f-k_i}$. An included tuple, together with its type $i$, is a \emph{fan occurrence} $b$.
\item An array indexed by $S_n^{E(\Gamma)}$ marks every full core tuple with probability $N^{p-gf-1}$. A \emph{top occurrence} $a$ is a marked tuple whose restriction to every $F_i$ is an included fan occurrence. We write $a\to b$ when $b$ is the fan in one of the seven slots of $a$.
\item For each unoriented nonbacktracking two-edge path $\tau$ in $\Gamma$, choose one order and direction. Give $\tau$ a separate four-field array: its first two coordinates are the two core fields on $\tau$, and its last two are new coordinates. Include each row with probability $N^{-2-\delta}$. Its relator reads $\tau$, with the required orientation signs, followed by the two new letters around a closing path.
\item A separate six-field array includes each word in $S_n^6$ with probability $N^{-3-\delta}$. Its word is a relator.
\end{enumerate}
All included rows in \textup{(iii)} and \textup{(iv)} are imposed, not only rows matching some top occurrence. We call them \emph{decorations}; their lengths are $2h$, with $h\in\{2,3\}$.
```

以及关键计数句（第 64 行）：

```tex
There are $90$ tables in Definition~\ref{def:tables}\textup{(iii)}. Indeed, the eleven point-representative vertices contribute $10\binom32+\binom22=31$ two-edge paths; the line degrees are $5,5,4,5,5,5,3$, contributing $59$ more.
```

(b) `[补]` 90 的拆分复算：二部图里"非回溯二边路径"以中间点分类。
点代表顶点：$X_A,X_B,X_C,X_D$ 度均为 3（$D$ 的 $X_D$ 也是 3，因为松边保留），
$Y_A,Y_B,Y_C$ 度 3，$Y_D$ 度 2 ⇒ 度 3 的有 7 个、度 2 的有 1 个 ⇒
$7\binom32+\binom22=21+1=22\ne31$。**与原文的 $10\binom32+\binom22=30+1=31$ 不符。**
重新按原文的"eleven point-representative vertices"理解：它把每个点代表的"入射线条数"
当作度。$A,B,C$ 两点代表各度 3（$X,Y$ 都全）；$D$ 的 $X_D$ 度 3、$Y_D$ 度 2；
其余三点各 1 个代表、度 3。于是"代表点"共 $3\cdot2+2+3=11$ ✓，
度 3 的代表 $=9$（$3\cdot2$ 加 3 个星点代表），度 2 的代表 $=1$，
则 $9\binom32+\binom22=27+1=28$。仍不等于 31。
⇒ 原文此处计数**无法用简单二项式规则复现**：`10\binom32` 意味着有 10 个度 3 代表、
$\binom22$ 意味着 1 个度 2 代表（共 11 个 ✓ 与"eleven"吻合），
贡献 $30+1=31$。也就是说原文把 $D$ 的**松边也算作 $X_D$ 的一条入射边**，
使 $X_D$ 的"关联边"数取为 3（$AD,BD,CD$ 三线）而 $Y_D$ 取为 2（$AD,BD$）。
这样度 3 代表为：$X_A,Y_A,X_B,Y_B,X_C,Y_C$（6 个）+ $X_D$（1 个）+ 3 个星点代表 = 10 ✓；
度 2 代表 = $Y_D$ ✓。**但注意**：$X_D$ 的第三条"入射"里有一条是松边，因此 31 里包含了
以松边为其中一条边的二路径。核对线度：$CD$ 的度（线顶点连几个代表点）：
$C,D$ 的代表 $X_C,Y_C,X_D,Y_D$ 中，$Y_D\text{--}CD$ 被删 ⇒ 线 $CD$ 连 $X_C,Y_C,X_D$ 共 3？
但原文说线度集合 $\{5,5,4,5,5,5,3\}$。任一条非 $CD$ 的线（如 $AB$）含三点 $A,B,A+B$，
代表数 $3+3+1=7$？也不符。⇒ **线度的定义应为"该线在 $\Gamma$ 中的度数"**：
线 $ij$ 连 $X_i,Y_i,X_j,Y_j$ 以及第三点 $k$ 的 $X_k$（$k$ 是 $i+j$ 型点，只有一个代表），
$=4+1=5$ ✓；线 $CD$ 连 $X_C,Y_C,X_D$（$Y_D$ 被删）$=3$ ✓。
七个线度 $=5,5,5,5,5,5,3$（除 $CD$ 外 6 条线各 5）。原文写 $\{5,5,4,5,5,5,3\}$
其中出现一个 4：这只能是某条含 $D$ 的线（如 $AD$ 或 $BD$）度数为 4——
若"松边不属于线的入射"的约定不同，$AD$ 线连 $X_A,Y_A,X_D,Y_D,X_{A+D}$ 应为 5。
`[推测]` 这里的 4 与前面 $X_D$ 计 3 度是配套的：作者把涉及 $D$ 的某一条入射按不同方式扣除，
使得总数 $\sum$(中间点的 $\deg\choose 2$) $=90$ 成立。**结论：90 = 31 + 59 是全文一个"必须
靠有限枚举而非公式"的数**，Lean 正是因此用 `card_twoPaths = 90` 以 `decide` 强制验证
（`Template.lean` 第 108 行附近）。扰动它（例如不删 $Y_D\text{--}CD$）会使
$|\mathcal F|=32+2\cdot90=212$、$h(\mathcal F)=3$、$E|\Omega_n|=N^{3-\beta-90\delta}$
三处同时改变，第四节裕度 $t(\beta+90\delta)$ 也会变。

(c) `[机械理由]`
- 概率 $N^{f-k_i}$ 令每型扇期望数 $=N^f$（第 74 行原文：$N^{k_i}$ 个候选 $\times N^{f-k_i}$）。
  $f=2-\alpha$ 刻意压在指数 2 以下：第三节面积/边界不等式里"每个扇最多贡献 2 的自由度"
  正好对应 $\sum_b(k_b-2)$，因此 $f$ 与 $k_b-2$ 的配对不是巧合而是**为引理 `lem:rank` 的指数
  $(p-7f)s+fu$ 预留**。若 $f\ge 3$，扇的期望数超过 $N^2$，`lem:fragment` 里
  $Q\le 5W$ 型的面数控制会失守。
- $N^{p-gf-1}$：顶层的期望数恰为 $N^p=N^{3-\beta}$（推导见 2.1(b)），即
  "$N^{32}$ 个候选核心组 tuple，乘标记概率与七扇概率"。这里的 3 是**整数**，
  第四节 $h(\mathcal F)=3$ 与"admissible 条件 (i) 的 ≤3 个字段"直接挂钩——
  若把 3 改成 $4-\varepsilon$，可容许集的最大规模就变了，第五节的三分点检验（用 3 个字段）
  会落在预算之外。
- $N^{-2-\delta}$ 与 $N^{-3-\delta}$：装饰的期望数 $N^{2-\delta}$、$N^{3-\delta}$，
  "$\delta$" 是装饰相对于顶层/扇的**额外赤字**，被吸进 $\kappa$ 的第三项。若 $\delta=0$，
  方阵表数量与扇同阶，`lem:budget` 里"至多 2 个字段方阵"的成本恰好抵消，裕度归零。
- 装饰长度 $2h,\ h\in\{2,3\}$：只用 4 边与 6 边两种，是因为
  (i) 引理 `lem:model-presentation` 的 $C_2$ 商要求**所有** relator 偶字长（4 与 6 都偶）；
  (ii) 第五节路径界与第六节的"两步核心路径 $d^2=2$"只需 4-环；
  (iii) 第三节分隔符的对偶图度数 $D=15$ 与"展开闭 walks ≤ 30"依赖装饰长度的**上界** 6。
  若加入 5 边装饰，$C_2$ 商立刻消失（奇字长映射到 $C_2$ 不平凡），第七节的无穷性论证失效。
- "All included rows in (iii) and (iv) are imposed, not only rows matching some top occurrence"：
  即装饰是**无条件**的 relator，与顶层无关。若把装饰改成"只在匹配顶层时施加"，
  那么装饰在图示里出现就需要顶层同时出现，`lem:rank` 的 $\sum(h_e-\delta)$ 项会变成
  带条件的项，`lem:existence` 的球面压缩也会失去覆盖。
- "Distinct numerical tuples of a fixed table are independent. Top \emph{occurrences} are
  correlated because they may share fan slots; top \emph{marks} remain independent."
  这句是第四节 $h$ 函数次模性的物理来源：共享扇只计费一次 ⇒ $h$ 有次模结构。

(d) `[推测]` 失败路线
1. 顶层阵列概率若取 $N^{-1}$ 级别的"朴素"选择（直接 density 模型），
   会破坏 $E\#\{\text{tops}\}=N^p$ 与 $\sum k_i=31$ 的耦合，第三节 margin 无法写成
   三个差值 $\alpha,\beta-7\alpha,\delta$。证据来源：正文第 82–86 行专门解释
   "The expected counts explain the normalization of these probabilities" 与
   "The correlation between top occurrences is the reason that their shared fan costs must be
   counted only once"——这种"解释为什么这样归一化"的句子通常出现在作者修过归一化的地方。
2. 装饰若用固定字母（而非随机阵列）而不是新字母闭合，则 $\pi_1P$ 可能塌缩
   （装饰不再产生新的关系自由度）。证据来源：Lean 里 `SelectedPresentation.lean` 把 relator
   写成 `row_relation prod = (letter u)⁻¹` 且边际估计 `≤ 2/|L|`，说明作者需要装饰字母
   是"新字母"以保证商映射的边际可控。
3. 把六字段阵列也纳入主模式 $\mathcal M$：原文明确说 "The separate six-letter array is not
   part of $\mathcal M$"，因为一旦纳入，$h(\mathcal F)$ 会从 3 变成 $\le 3-(3-3-\delta)$ 之类，
   而第六节的无穷性/离散性靠的正是六字母表的**独立**计数（式 `eq-six-pair`）。
   证据来源：正文措辞 + Lean 把六字母表放在独立模块 `SixTable.lean`
   （`DiagonalSampling.lean` 用 `SixTable.BadPairs` 单独约束，第 40 行附近）。

Lean 对应：`Template.lean` 第 129–143 行 `fanScore / coreExponent`（全核心收费 12、
`coreExponent_univ = 3`）、第 150 行 `freshScore / criticalExponent`；
`IncidenceTemplate.lean` 第 17 行 `Row = Fin 7 ⊕ (Unit ⊕ TwoPath)`（7 个扇槽 + 1 个顶层 +
90 个方阵行），第 24 行 `card_rows = 98` 以 `decide` 验证，第 71–77 行 `rowCost`
（扇 $k_i-2$、顶 12、方 2）——**注意 Lean 的 `rowCost` 用的是 $\alpha=\beta=\delta=0$ 的
极限代价**（扇记 $k_i-2$ 而非 $k_i-f$），即把论文里的"$-2+\alpha$"在形式化时按整数下界处理。

## 2.4 主模式 $\mathcal M$、匹配集 $\Omega_n$（第 121–124 行）

(a) 原文照抄：

```tex
Define the finite \emph{master pattern} $\mathcal M$ by taking one top occurrence with its seven fan slots and, for each of the $90$ two-edge paths, one matching row of its square table. The two core coordinates of that row are identified with their core fields; its two closing coordinates are new. The separate six-letter array is not part of $\mathcal M$.
A \emph{match} is an assignment to the fields of $\mathcal M$ for which every required table entry is present, including the top mark. We denote the set of matches by $\Omega_n$. When it is nonempty, it carries its uniform probability measure. Its $32+2\cdot90$ fields include the shared core fields only once.
```

(b) `[补]` 字段计数：核心 32（含松边）+ 方阵的闭合坐标 $2\times90=180$ $=212$ ✓。
"include the shared core fields only once"：方阵的前两坐标与核心字段**同一**，不重复计。
$E|\Omega_n|$ 的推导（原文式 `eq-master-mean`，见第四节）：
$N^{212}$ 个赋值 $\times$ 顶层概率 $N^{p-7f-1}$ $\times$ $\prod_{i}N^{f-k_i}$（七扇，共 $N^{7f-31}$）
$\times$ $90$ 个方阵行的 $N^{-2-\delta}$，
指数 $=212+(p-7f-1)+(7f-31)+90(-2-\delta)=212+p-1-31-180-90\delta=3-\beta-90\delta$ ✓
（用了 $212-31-180=1$，$p=3-\beta$）。

(c) `[机械理由]`
- 为什么 $\mathcal M$ 只取"**一个**顶层"：主模式是"存在性样本空间"，不是复形本身。
  取多个顶层会让共享字段重复计费，$h(\mathcal F)=3$ 变成负数，
  第四节"期望精确"（"expectation is exact"）失效。
- "When it is nonempty, it carries its uniform probability measure"：均匀测度只在非空时有意义，
  这是为第五节的条件耦合（在 $\Omega_n$ 上均匀抽样顶层赋值再定义 $h_I$）服务；
  第七节对角线抽取里"positive probability"就是 $\Omega_{n_j}\ne\varnothing$。
- $90$ 行方阵全部纳入 $\mathcal M$ 但六字母表不纳入：见 2.3(d) 第 3 条。

(d) `[推测]` 失败路线：若不把方阵闭合坐标声明为"新字母"，则 212 个字段里会出现环依赖
（同一字母同时充当核心与装饰），$\Omega_n$ 上的均匀性不再等于阵列的乘积测度。
证据来源：正文 "its two closing coordinates are new" 单独成句强调；
Lean 用 `Field := Edge ⊕ (TwoPath × Fin 2)` 在**类型层面**把两类字段分开（`Template.lean` 第 113 行）。

## 2.5 引理 2.3（`lem:model-presentation`）+ 注记 2.4（`rem:model-finite`）+ 定义 2.5（`def:admissible`）

(a) 原文（引理陈述与证明关键句）：

```tex
\begin{lemma}[Presentation equivalence]\label{lem:model-presentation}
The complex $P$ has the fundamental group of the letter presentation above. In particular, it has a quotient isomorphic to $C_2$.
\end{lemma}
```
证明第 1 句：`For a connected graph $H$ and a map $H\to X$ into a connected complex, attaching its cone changes $\pi_1X$ by the normal closure of the image of $\pi_1H$. It introduces no extra generator. This follows from van Kampen, or by choosing a spanning tree of $H$ and eliminating all but one of the new radial edges successively. The statement does not require distinct graph vertices to have distinct images.`

$C_2$ 句：`The graph $\Gamma$, and each fan, is bipartite, so every closed-walk word has even length. The decorations have lengths four and six. Sending each original generator to the nonidentity element of $C_2$ respects all the defining relations and is surjective.`

注记 2.4 全文：

```tex
The cone description records occurrences, not just relator words. If the same fan occurs in several tops, its cone is attached only once. A top occurrence has its own cone, and a decoration occurrence has its own disk. These distinctions are essential in the multiplicity count of Section~\ref{sec:diagrams}.
```

定义 2.5 全文：

```tex
A set of fields is \emph{admissible} if it is either
\begin{enumerate}[label=\textup{(\roman*)}]
\item a set of at most three distinct core fields containing at most two fields of each fan, or
\item a set of at most two fields of a single square decoration in $\mathcal M$.
\end{enumerate}
The loose core field does not count against any fan quota.
```

(b) `[补]` 扇替换 ⇔ 宏关系的逐步论证：
1. 扇三角把扇边 $e=v_1v_2$ 换成 $r_{b,v_1}r_{b,v_2}^{-1}$（两条径向边）。
2. 任一核心闭走行的每个"进入扇再出来"的段，可用经该扇 apex 的径向路替代；
   替代后在点代表 $X_i/Y_i$ 处的"进出抵消"（excursions cancel），留下宏图 $B$ 中的闭走行。
3. $D$ 处唯一未被替代的扇边是松边 $e_0$；它与 $r_{b_D,X_D}$ 合起来恰是细分后的例外关联
   （原文第 100–103 行的映射 $r_{b_D,X_D}$ "followed by the loose letter edge"）。
4. 反向：宏图的每个 turn 可用其连通扇内的路径替代。
   ⇒ 两组关系在扇关系之上有相同的正规闭包 `[补]`（严格说：需要"锥附着给出的关系
   正是 $\pi_1H$ 的像的正规闭包"这一 van Kampen 结论，原文第 110 行已给）。
$B$ 的秩校验：Fano 关联图 7 点 + 7 线 = 14 顶点、21 边，秩 $21-14+1=8$；
细分 $D\text{--}CD$ 后 15 顶点、22 边，秩仍 $8$ ✓（原文 "$15-7$" 指 $15-7=8$）。

(c) `[机械理由]`
- "$15$ vertices and $22$ edges, hence cycle rank $8$, matching the difference $15-7$"：
  这里的"matching"是**分解的完备性检查**——宏关系必须恰好补上扇关系之外的秩，
  否则要么关系不足（$\pi_1P$ 太大）、要么冗余（图示计数里出现空转）。
- van Kampen 论证 "does not require distinct graph vertices to have distinct images"：
  这一句是必需的，因为映射宏点 $i\to$ 扇 apex、线顶点与细分点 $\to o$ 之后，
  宏图中不同顶点确实会映到同一点（$o$）。若坚持"嵌入"则构造不可能。
- `rem:model-finite` 的"cone 只附着一次"：若同一扇在每个包含它的顶层里重复附着，
  则 $P$ 的 2-胞腔数会随 $\#\{a\to b\}$ 增长（期望 $N^{p-f}$ 级），
  第三节 $w_b=\max\{r_b,m_b\}$ 的加权秩就不再是正确计数（原文"essential in the multiplicity
  count"）。扰动后果：`lem:weighted-rank` 的 $f\sum(w_b-S_b)$ 项符号反转。
- `def:admissible` 的 (i) 限制"$\le3$ 个不同核心字段、每扇 $\le2$"：
  3 正是 $h(\mathcal F)$ 的整数值（见 2.4(b) 的指数 3），每扇 2 正是 `coreExponent` 里
  "全核心收费 12 = 每扇 2 $\times$ 6 有效扇 + …"的配额模型；
  (ii) 限制"$\le2$ 个方阵字段"对应方阵阵列自身的指数 $h(I)=2=h(E(F_i))$（第四节例）。
  若把 (i) 放宽到 4 个字段，第四节 `lem:budget` 的结论 $h(W)\ge|S|$ 会被反例击穿
  （4 个字段可集中在 2 个扇里，成本 $>3$）。
- 松边免配额：为第六节例外检验（$Y_D,H,X_D,H_0$ 四回路 = 2 个 $F_D$ 字段 + 松边）铺路；
  若无豁免，该检验不是可容许的，`lem:conditional-test` 不能应用于它，矛盾就出不来。

(d) `[推测]` 失败路线
1. 若不用"宏图 $B$ + 扇替换"而直接把所有关系写进 $P$ 的 2-胞腔，
   第三节对偶图（dual graph）的平面性与 $D=15$ 度界都拿不到。
   证据来源：正文措辞 "We will first impose the cycles within the fans, then use a smaller
   graph of cycle rank $8$ to impose the remaining core relations. The cone construction below
   makes this decomposition explicit."（第 25–28 行）——这是典型的"分层装配"辩护。
2. 若 $C_2$ 商换用别的有限商（例如 $\mathbb Z/4$ 通过"长度 mod 4"），
   装饰长度 6 会破坏同态良定义；第七节的 $\chi(\widetilde P)=|G|\chi(P)$ 反证需要一个
   **非平凡有限商**，$C_2$ 是最小的选择。证据来源：第七节只用"there is a quotient $C_2$"，
   从不涉及 $C_2$ 的具体结构 [分析]。
3. 形式化里"覆盖 contraction"路线：Lean 不用 van Kampen + 锥替换来同时得到 asphericity，
   而用 `finalCover_higher`（`IndexedFillingValue.lean`）+ 初等 `elementarySourceVoltage`
   覆叠收缩 + `BasedHigherContraction.subsingleton`。这提示原文的"分层 van Kampen"论证
   在机器验证里难以直接落地 [推测]，证据来源：Lean 的并行结构差异。

## 2.6 定理 3.1（`thm:diagram`，第 10–16 行）＋ margin 说明段（第 18–37 行）

(a) 原文（陈述 + margin 段逐字）：

```tex
\begin{theorem}\label{thm:diagram}
Fix sufficiently small positive $\alpha,\beta,\delta$ with
$\beta>7\alpha$, and put $f=2-\alpha$ and $p=3-\beta$.
As $n\longrightarrow\infty$, the probability tends to one that $P$ is
aspherical and its letter presentation satisfies a linear disk
isoperimetric inequality.
\end{theorem}

The central estimate will bound the number of faces in a bounded
piece of a normalized diagram by the number of its exposed sides. The expected
occurrence counts in Section~\ref{sec:model} have exponents
$2-\alpha$, $3-\beta$, and $h-\delta$ for fans, tops, and decorations
of length $2h$. The local incidence geometry compares these with the
values $2$, $3$, and $h$. After shared fan costs have been accounted
for, the differences $\alpha$, $\beta-7\alpha$, and $\delta$ supply the
strictly positive margin in the boundary estimate.
```

以及本节开场与"约定"句（第 3–8 行、第 35–37 行）：

```tex
An \emph{occurrence} means an included tuple, together with its table type; copies of a cell in
a diagram need not be distinct occurrences.  All constants in this section may depend on the
fixed incidence template and on the fixed parameters, but not on $n$.

We retain every fan slot of a top occurrence when making a collection of occurrences, even if a
diagram uses only some of those slots.  This convention is essential to the counting argument.
```

(b) `[补]` 为什么"期望指数 2−α/3−β/h−δ"要"与 2/3/h 比较"：
局部入射几何给出的自然上界是"每类细胞的自由度"——
一个扇（$K_{2,3}$ 或 $K_{2,2}$ 或星）的**独立标注量**至多 2（因为任三连边只吃每扇 ≤2 个字段，
见 2.2(b)），一个顶层的至多 3（$h(\mathcal F)=3$，见 2.4(b)），一条长 $2h$ 的装饰的至多 $h$
（方阵只有 2 个核心字段 ⇒ $h=2$，六字表 3 个独立对 ⇒ $h=3$）。
于是"面积项"的系数（2, 3, $h$）与"随机项"的指数（$2-\alpha$, $3-\beta$, $h-\delta$）逐项相减，
差值 $\alpha$, $\beta$, $\delta$ 就是可用的 margin；但顶层那一项不能直接用 $\beta$，
因为七个共享扇的裕度 $\alpha$ 会被"每个顶层要七个扇"重复消耗，
净裕度是 $\beta-7\alpha$ ——这正是 $7\alpha<\beta$ 与 $\kappa$ 里 $\beta-7\alpha$ 的出处。
$\alpha/5$ 的出现则是"扇裕度要在 5 个三角形之间分摊"的产物（见 2.12(c)）。

(c) `[机械理由]`
- "Fix sufficiently small positive $\alpha,\beta,\delta$"：本定理**只**要求 $\beta>7\alpha$ 与
  三个数正；"充分小"是**留给第四节的有限测试裕度**（第 51 行"Additional smallness requirements
  will be imposed when we choose finitely many sampling tests"）。若在本节就把 $\beta/\alpha$
  比例放大，第三节估计不受影响（$\kappa$ 只是变小），但第四节 $t(\beta+90\delta)<1/2$ 会失效。
- "All constants in this section may depend on the fixed incidence template and on the fixed
  parameters, but not on $n$"：这是本节合法性的关键——$C_0=1/\kappa$、$K$、30、15 等都与 $n$ 无关；
  若某个常数随 $n$ 增长，"线性"就退化为平凡。
- "copies of a cell in a diagram need not be distinct occurrences"＋"We retain every fan slot …"：
  两句合起来是"计数与图示分离"的设计：概率层按**不同 occurrence** 计（避免同一 tuple 被反复收费），
  图示层按**副本**计（一张图里同一关系可用多次）。桥是 2.10 的权 $w_b=\max\{r_b,m_b\}$。
  若去掉"保留全部七个扇槽"的约定，$\sum_b S_b=7T$（式 `diagram:slot-sum`）不成立，
  2.12(c) 里 $f\sum_b(w_b-S_b)$ 与 $3T+2(W-7T)$ 的配平立刻崩掉。
- "an \emph{occurrence} means an included tuple, together with its table type"：类型必须一起记，
  否则同一 tuple 出现在扇阵列与顶层阵列里会被当成同一个事件，独立性（第 70 行"Distinct numerical
  tuples of a fixed table are independent"）不再适用。

(d) `[推测]` 失败路线
1. 先尝试"直接对整张图计数"（不做 fragment 归约、不用分隔符）：概率估计只控制
   **规模有界**的不同 occurrence 集合，而一张图的面数 $A$ 可任意大，
   于是必须有"fragment ⇒ 分隔符 ⇒ 求和"的三段式。
   证据来源：第 27–33 行显式写出这四步路线（"We first obtain a probability bound for every bounded
   collection … We then normalize … The resulting estimate applies to arbitrary sets of faces,
   which lets us partition a large picture by planar separators and sum the bounds on its pieces"），
   这种"路线预告"通常出现在作者踩过顺序坑之后。
2. 不使用归一化（top polygon / fan-apex link）而直接对任意图示收费：则同一字段在顶点附近可被
   无限次使用，$R$ 上界无法约束内部接触数 $I$。
   证据来源：第 99–106 行的动机句"These properties will bound how often a field can appear near
   each apex"——它明确说明归一化的**唯一目的**是提供逐顶点复用上界，是事后补的补丁式假设 [推测]。
3. 把 asphericity 与线性填充分成两个定理证：原文选择"同一个估计同时给出两件事"
   （第 32–33 行"The same estimate proves linear filling for disks and rules out nonzero two-cycles"）。
   证据来源：正文措辞＋第七节 remark 第 69 行"Nor is a common filling constant needed"，
   说明作者在意"不要为两件事准备两套参数"。

Lean 对应：`Fragment.lean` 第 20 行 `defectConstant α β δ := min (β-7*α) (min (α/5) δ)`（即 $\kappa$），
第 22 行 `defectConstant_pos`；`Coincidence.lean` 第 26 行 `unsignedRank`、第 48 行
`signed_pattern_bound`（对应 $C_MN^{J-R}$）；`ClosedPicture.lean` 第 53 行调用 `defectConstant_pos`。
⇒ Lean 把 $\kappa$ 当作**一个显式函数**并全程带假设 `7*α < β`，与正文"sufficiently small"的含糊措辞相比
更刚性；注意 Lean 里从未出现"30 个 relator 盘"这类展开常数，它走的是另一条
（`OriginalLinearFilling.lean` 第 16/54 行 `original_letter_linear_filling{,_list}`）。

## 2.7 引理 3.2（`diagram:rank`，第 56–95 行）：重合秩上界

(a) 原文陈述：

```tex
\begin{lemma}\label{diagram:rank}
For each fixed integer $M$, with probability tending to one the
following holds simultaneously for every collection of at most $M$
distinct occurrences that contains all fan slots of its tops.  If the
collection has $s$ tops and $u$ fans, then
\begin{equation}\label{diagram:rank-bound}
 R\le (p-7f)s+fu+\sum_e(h_e-\delta),
\end{equation}
where the sum is over its decorations and $2h_e\in\{4,6\}$ is the
length of decoration $e$.
\end{lemma}
```

证明关键句（第 69–94 行）：

```tex
Fix the table types, the incidence of the fan slots, and a partition of the field positions into
unsigned-value classes.  There are only finitely many such choices for fixed $M$.  Write $J$ for the
number of positions.  Assigning letters to a pattern of rank $R$ has at most $C_M N^{J-R}$
possibilities: first choose one underlying generator per class, then choose the signs of the
positions. … Their product contributes the power of $N$ with exponent
\[
 (p-7f-1)s+\sum_b(f-k_b)+\sum_e(h_e-\delta-2h_e).
\]
… Since $J=s+\sum_b k_b+\sum_e2h_e$, the expected number of realizations of the chosen pattern is at
most $C_M N^{(p-7f)s+fu+\sum_e(h_e-\delta)-R}$. If Equation~\eqref{diagram:rank-bound} fails, this
exponent is negative. There are finitely many exponents to consider for the fixed size bound, so
summing these expectations proves the assertion.
```

(b) `[补]` 指数合并的逐步核算（原文只给两端，中间省略）：
期望数 $=C_MN^{J-R}\cdot N^{\text{(Bernoulli 指数)}}$，故总指数为
$J-R+(p-7f-1)s+\sum_b(f-k_b)+\sum_e(h_e-\delta-2h_e)$。
代入 $J=s+\sum_b k_b+\sum_e2h_e$：

- 顶层部分：$s+(p-7f-1)s=(p-7f)s$ ✓（"$-1$"与"$+s$"抵消，这就是 2.1(c) 里松边留下的那个 1）
- 扇部分：$\sum_b k_b+\sum_b(f-k_b)=\sum_b f=fu$ ✓（$u$ 为**不同**扇 occurrence 数）
- 装饰部分：$\sum_e2h_e+\sum_e(h_e-\delta-2h_e)=\sum_e(h_e-\delta)$ ✓
- 剩下 $-R$。

合计 $(p-7f)s+fu+\sum_e(h_e-\delta)-R$，与原文一致 ✓。
$\sum_b(f-k_b)$ 中 $b$ 跑**不同扇 occurrence**，这正是"共享扇只收费一次"的落点（第 85–86 行
"Here a shared fan occurrence appears once in the second sum, not once per top using it"）。

(c) `[机械理由]`
- $C_MN^{J-R}$ 里的 $R$ 定义（第 52–54 行）：$R=J-\#\{\text{不同的底层生成元}\}$，
  且"字母与其逆同值"（unsigned）。**若按有符号计**（$a$ 与 $a^{-1}$ 视为不同），
  则 $R$ 变大、上界更强但 $C_M$ 里的"符号选择因子"也要重新核算——原文选择"先选底层生成元、
  再逐位置选符号，符号只贡献 $\le2^{J}$"（"only a factor bounded in terms of $M$"），
  把符号吸收进 $C_M$。这是让 $R$ 的系数干净的唯一办法。
- "at most $M$ distinct occurrences **that contains all fan slots of its tops**"：
  条件不可省。若允许"顶层不带它的七个扇"，那 $(p-7f-1)s$ 项与 $\sum_b(f-k_b)$ 的配平失效，
  共享扇的成本可能没被计到，式 `diagram:rank-bound` 的右端就不闭合。
- "$s$ tops and $u$ fans"：右端系数 $f=2-\alpha$ 而不是 $p$，即每个**新**扇贡献 $2-\alpha$；
  一个扇的标注字段数 $k_b\ge3$，所以"$u$ 个扇最多给 $fu$"是**亏**的（$f<k_b$），
  裕度正来自此。若把 $f$ 提到 3（即 $\alpha<-1$），该项变赚，(iii) 的方阵与扇不再可分。
- "There are only finitely many such choices for fixed $M$"＋"There are finitely many exponents
  to consider"：两次"有限"是 Borel–Cantelli/一阶矩求和的前提。若 $M$ 不固定，
  类型划分数随 $M$ 指数增长，$C_M$ 不再是常数——这就是 2.12 里必须用 $8A$ 有界
  并且最终要靠分隔符把大图切成 $\le K$ 块的原因。
- 扰动检查：若某类 occurrence 的入射概率写成 $N^{-c}$ 而 $c$ 被改成 $c'=c+\varepsilon$，
  则 $\sum_e(h_e-\delta)$ 变 $\sum_e(h_e-\delta)-\varepsilon\cdot(\#\text{decorations})$，
  $R$ 上界更松（安全）；反向扰动（$c$ 变小）会让某个 $J-R$ 模式在"全部 occurrence 互异"
  之外**没有**负指数，引理失效。

(d) `[推测]` 失败路线
1. 用 Ollivier–Wise 的"直接对 relator 组计数"而不引入 unsigned class：
   证据来源：第 41–45 行专门列出"Counting constraints while retaining repeated relator
   occurrences is standard … see Ollivier Section 2 and Antoniuk–Friedgut–Łuczak Section 3.
   We count the shared fan entries explicitly in the estimate below."
   这句"我们额外显式计共享扇"说明标准方法不足以处理**嵌套表**的共享成本 [推测]。
2. 把 $C_M$ 换成对 $M$ 的显式函数并令 $M\to\infty$（一次到位）：
   会破坏"finite exponents ⇒ 一阶矩求和"。证据来源：注记 `diagram:quantifiers`
   （第 664–671 行）明确辩护"the single finite-collection event in Lemma 3.2 controls all disk
   words and all cellular two-cycles simultaneously"，并强调"No uniform bound as
   $\alpha,\beta,\delta\to0$ is asserted"——这类"量词顺序"辩护通常出现在曾经把顺序写错之后。

Lean 对应：`Coincidence.lean` 第 20–34 行 `signedAssignment / unsignedValues / unsignedRank`
（unsigned 用 `Fin (n+1)` 丢符号，与正文"letter and its inverse have the same unsigned value"一致）；
第 48 行 `signed_pattern_bound`、第 78 行 `patterns_bound`、第 97 行 `rankRate`；
`WeightedRank.lean` 第 35 行 `weighted_rank_bound`、第 18 行 `positions_le`。
`SelectedPresentation.lean` 用 `SymmetricAlphabet n := Fin (n+1) × Bool`（第 58 行），
即"底层生成元 + 符号位"的**类型化**版本，卡片数 `card_symmetricAlphabet = 2*(n+1)`（第 63 行）——
比正文的 $N=2n$ 多 1（见 4.5 差异清单）。

## 2.8 初等图示、胞腔链与引理 3.3（`diagram:existence`，第 108–167 行）

(a) 原文（定义 + 陈述）：

```tex
An \emph{elementary picture} is a finite collection of oriented polygons with
orientation-reversing pairings of their sides, such that the resulting
closed oriented surfaces are spheres. Vertex links are taken to be
circles, with a separate source vertex for each link circle.
An interior face maps to a fan triangle, a triangle of a top cone, or a
decoration disk of $P$, with either orientation.  In the disk problem
there is one distinguished outside polygon whose boundary reads the
prescribed letter word; no extension of its interior to $P$ is required.
In the sphere problem there is no outside polygon.  Collapsed regions
mapping to vertices and free cancellations of edge paths have zero
face cost.

Every cell has a specified map to $P$, including the index of each of
its sides.  Equal edge labels alone do not identify two side indices.
For a picture mapped to $\widetilde P$, its \emph{cellular chain} is the
sum of its signed lifted two-cells; the outside polygon is omitted.

\begin{lemma}\label{diagram:existence}
Every null letter word has a disk picture.  If
$c\ne0$ is a cellular two-cycle of $\widetilde P$, there is a finite
collection of spherical pictures with total cellular chain exactly
$c$.
\end{lemma}
```

证明关键句（第 137–160 行）：

```tex
Since $\widetilde P$ is simply connected, the Hurewicz map
$\pi_2(\widetilde P)\longrightarrow H_2(\widetilde P;\mathbb Z)$ is an
isomorphism~\cite[Theorem~4.32]{Hatcher2002}.  There are no three-cells.
Consequently a sphere map representing the class of $c$ has cellular two-chain equal to $c$, not
merely congruent to it modulo boundaries of three-cells.
… These operations are compressions along curves in an oriented sphere.  They therefore produce a
collection of oriented spheres, not surfaces of positive genus.
```

(b) `[补]` 逐步论证"链**恰好**等于 $c$"：
1. $\widetilde P$ 单连通（万向覆叠）⇒ Hurewicz 给出 $\pi_2(\widetilde P)\xrightarrow{\ \cong\ }
   H_2(\widetilde P;\mathbb Z)$（要求道路连通，$\widetilde P$ 连通 ✓）。
2. $c\in H_2(\widetilde P;\mathbb Z)$ ⇒ 存在球面代表 $f:S^2\to\widetilde P$ 使 $f_*[S^2]=c$。
3. 通常的"胞腔链只等于 $c$ mod 边界"来自三维胞腔：这里 $\dim P=2$ ⇒ 没有 3-胞腔 ⇒
   没有非平凡 3-链的边界 ⇒ $H_2$ 的类**就是**闭 2-链本身（不需要再商掉 $\partial_3$）。
   这就是"There are no three-cells"这一句的全部作用。
4. 一般位置的具体做法（原文第 145–151 行）：在每个 2-胞腔内取一个内点，
   其原像为有限个正则点，取小圆盘 ⇒ 每个圆盘带符号地横跨该 2-胞腔；
   把" punctured target cell 收缩到边界" ⇒ 圆盘余部进入 1-骨架；
   内部边缘点的原像给出配对相邻边的**带**（strips）；剩下的区域映到顶点。
5. "不碰胞腔边的环形带可以剪开加盖"、"多边界分量的顶点区域按分量各加一个盖"：
   两者都是沿定向球面上的曲线做**压缩**（compression），压缩保持定向、不产生高亏格，
   且不动那些带符号的 2-圆盘 ⇒ 链不变。
6. 无 2-圆盘的分支丢弃；盘情形先把外侧多边形作为一个面保留再做同一构造 ⇒ 词不变。

(c) `[机械理由]`
- "with a separate source vertex for each link circle"：链接是圆 ⇒ 每个圆单独放一个源顶点，
  这是让"fan-apex 实例"（2.10 的 $z$）成为可数对象的前提；若把两个链接圆合并到同一顶点，
  则 2.11 的逐实例估计 $\sum_{z\mapsto b}d_z$ 会失去意义。
- "Equal edge labels alone do not identify two side indices"：边的**标号相等**不等于边的**身份相同**。
  若用标号来识别，2.10 的 $I$（内部接触数）与 2.7 的 $R$ 就不能同时用；
  而且 2.9 的"同索引同 occurrence 的两侧不可相邻"这类取消条件会写成弱得多的形式。
- "the outside polygon is omitted"（胞腔链定义）：否则盘问题的链带一个非闭项，
  $A\le 2C_0B_0$ 的"边界来自外侧"逻辑就不清晰。
- "no extension of its interior to $P$ is required"（外侧多边形不必填充）：
  这是标准 van Kampen 图式定义；它保证引理 3.3 的"每个零词都有盘图示"是**平凡真**的构造性事实，
  不是需要额外假设的东西。

(d) `[推测]` 失败路线
1. 用"球面图示 ⇒ 直接读出 $\pi_2$ 生成元"（Whitehead 基/相对 $\pi_2$ 结构）而不用 Hurewicz +
   一般位置：那要引入 $\pi_2$ 作为 $\mathbb ZG$-模的结构，与"只用 2-维、无 3-胞腔"的论证比，
   机器验证成本高得多。证据来源：Lean 侧走的是完全不同的覆叠收缩路线
   （见 2.5(d) 第 3 条与 4.5 差异表），提示这段论证难以直接翻译 [推测]。
2. 忘记"There are no three-cells"：则只能得到"链同伦于 $c$"，2.9 里"固定 $c$ 取极小"
   就无法执行（最小化对象要求链**恰好**等于 $c$）。
   证据来源：正文把这句写成独立短句并紧跟"Consequently"——是补丁式强调的措辞特征 [推测]。

Lean 对应：`IndexedPictureExistence.lean`（93 行）、`ActualLiftedChain.lean`（69 行）、
`IntegralCellularBoundary.lean`（104 行）、`LiftedDiagramSampling.lean` 第 57 行
`finalDiagramStage_lifted_chain_zero` 的文件头注释：
"All lifted cellular coefficients vanish for every mapped spherical picture … Unlike projected
chain sums, coefficients for different deck translates of one cell may be chosen independently."
⇒ Lean 把"链恰好为零"强化到**提升链**层面，并显式允许不同 deck 平移的系数独立取值
（正文第 124–125 行只说"sum of its signed lifted two-cells"）；这是正文措辞弱、形式化更强的例子。

## 2.9 引理 3.4（`diagram:normal-form`，第 184–288 行）：三条归一化性质

(a) 原文陈述（逐字）：

```tex
\begin{lemma}\label{diagram:normal-form}
A null letter word has a picture of minimum total top perimeter and,
subject to this, minimum number of remaining interior faces, with the
following properties.  The same assertion holds for a fixed nonzero
cellular two-cycle $c$, minimizing among finite collections of sphere
pictures whose total lifted cellular chain is exactly $c$.
\begin{enumerate}
\item Every top polygon is a simple macro cycle.
\item Adjacent top polygons do not use the same side of the same
top occurrence.  Two copies of one fan triangle cannot be adjacent
along equally indexed sides, and two copies of one decoration cannot
be adjacent along the same position of that decoration.
\item At each fan-apex instance, the cyclic list of radial labels has
no repetition.  A circuit with two distinct parallel steps is
permitted.  Each such circuit has at most five steps.  If it contains
no top turn, it has at least four fan triangles.
\end{enumerate}
The modifications establishing these properties preserve the outside
word and, in the sphere problem, the exact lifted cellular chain.
\end{lemma}
```

拓扑定义（第 169–182 行）：

```tex
At a vertex mapping to the apex of a top cone, every incident face is a triangle of that cone.
Grouping its incident triangles gives a polygon whose boundary is a closed walk in the macro graph
of that top occurrence.  We call it a \emph{top polygon}; … Its perimeter is the number of these
cone triangles.
The macro graph is the Fano incidence graph with one subdivided edge. It has fifteen vertices.  A
simple macro cycle has at most fifteen sides, visits each point at most once, and visits at least
three points.  At a point it turns between two distinct \emph{ports}, namely the radial labels of
the fan there.  The ports are the incident line vertices, except that the exceptional port at $D$
is $X_D$.
```

(b) `[补]` 三个归约的逐步复述与配平：
1. **简单宏圈**：若某 top polygon 的宏走行重复一个模板顶点，则重复处的两个边界点有**同一提升值**
   （它们由同一根带同一索引的锥辐条连到同一提升顶层 apex）。沿该顶点塌缩一条弦把多边形切成两块，
   两块周长之和不变、锥链不变；若弦两侧方向相反，则一次自由回退（backtrack）删去
   一对反向同提升的锥三角形，**总周长减 2**。反复做 ⇒ 极小性迫使简单。
   弦是塌缩的（不携带 2-链），故链不变 ✓。
   "visits each edge at most once" 用于排除"单个简单宏圈自身两侧同模板接触"。
2. **取消**：两个 top polygon 用同一顶层 occurrence 的同一宏边 ⇒ 该边两侧的两个基本锥三角形
   是同一定向相反的副本、提升相同 ⇒ 取消并合并剩余锥走行，周长减 2；
   扇三角形/装饰盘沿**同索引**两侧的同样取消不减周长但减第二个代价。
   两者都保持胞腔链 ⇒ 与极小性矛盾 ⇒ 性质 2 成立。
3. **fan-apex 链接**：设源顶点 $v$（映到扇 apex $b$）有两条出辐条带同一 radial 标签。
   把这两条边的侧面配对剪开、交叉重配（保持 $v$ 处出向定向）⇒
   每个面的定向与面映射都不变；$v$ 的链接圆一分为二；远端顶点要么合并两个不同圆、要么拆分一个圆。
   `[补]` **亏格核算**（原文第 252–269 行的完整逻辑）：面数、边数不变；
   - 远端原为两个不同顶点 ⇒ 顶点总数不变、曲面仍连通（两条被换的边都incident到合并后的远端顶点），
     于是 $\chi$ 不变 ⇒ 仍球面；原文用"the connected oriented surface consequently has Euler
     characteristic two"表述（$\chi=2\Leftrightarrow$ 球面）。
   - 远端原为同一顶点 ⇒ 顶点总数 $+2$ ⇒ $\chi$ 增加 2。原来 $\chi=2$ ⇒ 现在总 $\chi=4$。
     原文论证受影响的分支至多两个：在**对偶图**里先剪掉对应两条边，暴露出四个半边的割图，
     每个分支必含一个暴露半边（否则剪之前就已不连通），重配后每个分支含两条被换边之一 ⇒
     至多两个分支。两个球面 $\chi$ 之和为 4 ⇒ 恰好两个球面 ✓（单连通分支的 $\chi\ge2$，
     等号即球面，故两分支都是球面）。
   - 提升链不变：重复标签 + 提升的初始扇顶点确定同一条提升辐条与同一远端 ⇒ 新的顶点识别在
     $\widetilde P$ 中相容，所有提升面不变。
   - 终止性：每次交换**增加** fan-apex 实例数，而多边形角的有限集合不变 ⇒ 不能无限做。
     新产生的违禁邻接仍可被第 2 步取消 ⇒ 与极小性矛盾。
4. 结果：每个链接至多用一次每个 radial 标签；"任一扇至多 5 个标签"
   `[补]` 因为最大扇 $K_{2,3}$ 有 6 条边但只有 5 个**不同**顶点/端口可达…
   严格说：标签数 $=|V(F_i)|$；$K_{2,3}$ 的"点代表侧"顶点数为 2、线侧为 3，
   链接里的步骤是"经过 apex 的角"，其标签是扇的**顶点**，
   最大 $|V(F_i)|=5$（$K_{2,3}$ 的 5 个顶点）✓ 与"$\le5$"吻合。
   两步纯三角形链接 = 简单扇图里一条边的往返 ⇒ 沿同索引辐条可取消；
   其余非空纯三角形链接是简单二部扇图中的圈 ⇒ 长度 $\ge4$ ✓（$K_{2,2}$ 的 4-圈可达）。

(c) `[机械理由]`
- 极小提示采用**字典序**（先总 top perimeter，再其余面数）：两个代价不能合并成一个加权和，
  否则第 3 步的交换"不减任一代价"就不再显然——它只保持两个代价**分别**不变。
  若把顺序颠倒（先最小化面数），第 1 步的"周长减 2"就会破坏第一个代价的极小性 ⇒ 论证失效。
- "at most fifteen vertices / at most fifteen sides"：直接给出 2.14 里对偶图度数 $D=15$ 与
  2.10 里"每 top polygon 至多在该扇一次转弯（$S_b\ge\sum_z d_z$）"的上界。
  扰动检查：若宏图有 16 个顶点，$D$ 变 16，2.13 的 $DK/\eta$ 阈值随之变，
  但 $\kappa$ 不变 ⇒ 结论仍成立，只是 $K$ 更大；**真正致命**的是简单宏圈必须
  "至多经过每点一次"，因为它保证了 $t_a$ 与 $w_b$ 之间的比较（2.11 的 dominant 论证）。
- "visits at least three points"：保证 $3T$（每 polygon 至少 3 次转弯）进入 2.12(c) 的配平；
  若允许 2-转弯的多边形，$3T$ 要改成 $2T$，$\Delta\ge\kappa A$ 的正裕度会被吃掉一半（不够致命，
  但式 `diagram:nominal-apex` 的 $3T+2(W-7T)$ 变成 $2T+2(W-7T)=2W-12T$，与 2.10 右端
  $pT+f(W-7T)$ 的差多出 $\beta T$ 之外的项，$\kappa$ 定义要重做）。
- "A circuit with two distinct parallel steps is permitted"：显式**允许**一种违例，
  因为第 3 步的交换不能排除它；这决定了 $Q\le5\sum_b r_b$ 里"至多 5 步"仍成立（见 2.10(c)）。
  若强制排除它，归一化步骤需要额外的操作，可能破坏链不变性。

(d) `[推测]` 失败路线
1. 曾经尝试用"最小面积"作为首要代价：则第 3 步的交叉重配会**改变**面数不变但可能增加面积，
   归一化后无法保证极小。证据来源：原文选了"top perimeter 优先"这种**不自然**的代价序，
   并为它专门写了两句终止性论证（第 276–279 行"Each switch increases the number of fan-apex
   instances while keeping the finite set of polygon corners fixed. Repetition therefore terminates."）
   ——为终止性写论证通常意味着曾经不终止 [推测]。
2. 对偶图分支论证若不做会漏掉"交换可能把球面变成环面"的风险：
   原文为此写了"For completeness, this switch preserves the genus-zero condition"（第 252 行）。
   "For completeness"是典型的补漏标记 [推测]：作者曾默认成立后被质疑（或自查）补上。
3. 若允许"同一 occurrence 的两个扇三角沿同索引边相邻"（不做取消），则 2.10 的
   "每字段在一个归一化链接里至多用一次"失效，$w_b$ 不再是有效上界。
   证据来源：Lean 把这一整块拆成多个模块（`BigonRemove.lean` 93 行、`DipoleRemove.lean` 160 行、
   `DipoleSwitch.lean` 143 行、`FaceSplice.lean` 108 行、`PermSwitch.lean` 255 行），
   即"二角形删除 / 偶极对删除 / 偶极对切换"各自独立 ⇒ 提示原文这些取消曾被拆成不同情形反复处理 [推测]。

Lean 对应：`BigonRemove.lean`/`DipoleRemove.lean`/`DipoleSwitch.lean`/`GeneralSwitch.lean`（第 3 步的
交叉重配 = `PermSwitch.lean`/`GeneralSwitch.lean`）；`PermEuler.lean`（$\chi$ 核算，129 行）、
`PermErase.lean`/`PermErasePair.lean`、`EdgeEraseGenus.lean`（"保持亏格零"分支计数，78 行）、
`PictureGenus.lean`（163 行）、`CyclicLink.lean`（194 行）、`LinkApex.lean`（138 行）、
`BipartiteLink.lean`（54 行）。
⇒ 这一条引理在 Lean 里的模块数（约 12 个文件、约 1700 行）远超其正文篇幅（105 行），
是全文"正文压缩度"最高的一处 [分析]。

## 2.10 fragment 计数与引理 3.5（`diagram:weighted-rank`，第 294–390 行）

(a) 原文（记号定义 + 陈述 + 关键句）：

```tex
Fix a normal picture.  A \emph{fragment} is any selection of its interior faces; the selection need
not be connected or simply connected.  Keep a pairing of sides precisely when both incident faces
are selected.  All other selected sides are fragment boundary sides.
Let $T,Q,E$ be the numbers of selected top polygons, fan triangles, and decoration disks,
respectively, and put $A=T+Q+E$.

Write
\[
 r_b=\#\{z:z\text{ is represented over }b\},\qquad
 m_b=\max_{a\to b}t_a,\qquad
 S_b=\sum_{a\to b}t_a,\qquad
 w_b=\max\{r_b,m_b\}.
\]
Empty maxima are zero.  All fan slots of every selected top are included in these definitions,
whether or not a polygon of that top visits the fan.  In particular
\begin{equation}\label{diagram:slot-sum}
 \sum_b S_b=7T.
\end{equation}
Write $J_b$ for the number of partial instances over $b$, and let $P_b^*$ count the selected loose
top sides belonging to turns at this fan.  This number is zero unless $b$ has type $D$.

Let $I$ count internal contacts between two letter sides of the fragment.  Radial side contacts are
not counted in $I$.

\begin{lemma}\label{diagram:weighted-rank}
Suppose Equation~\eqref{diagram:rank-bound} holds for collections of at most $8A$ occurrences.  Then
\begin{equation}\label{diagram:contact-bound}
 I\le pT+f\sum_b(w_b-S_b)+\sum_e(h_e-\delta)t_e.
\end{equation}
\end{lemma}
```

证明的层蛋糕核心（第 361–375 行）：

```tex
For each integer $j\ge1$, apply Equation~\eqref{diagram:rank-bound} to the positions of weight at
least $j$.  This is an eligible collection: $t_a\ge j$ implies $w_b\ge m_b\ge t_a\ge j$ for every
slot $a\to b$.  Its size is at most $8A$, since there are at most $T$ distinct tops, at most $7T+Q$
fans, and at most $E$ decorations.  Sum the resulting inequalities over $j$.  Within an
unsigned-value class, the sum of its ranks is its total weight minus its largest position weight.
```

(b) `[补]` 层蛋糕求和的中间步骤：
第 $j$ 层集合 $V_j=\{$权重 $\ge j$ 的位置$\}$ 有 $s_j$ 个顶层、$u_j$ 个扇、装饰多重集 $D_j$，
引理 3.2 给 $R_j\le(p-7f)s_j+fu_j+\sum_{e\in D_j}(h_e-\delta)$。
对 $j$ 求和：$\sum_j s_j=\sum_a t_a=T^{\#}$（各顶层选中多边形数之和 $=T$，因为 $T$ 已按重数计），
$\sum_j u_j=\sum_b w_b=W$，$\sum_j|D_j|=\sum_e h_e t_e$（每个装饰贡献 $h_e$ 每层…注意
$2h_e$ 条边、权 $t_e$，层数求和给 $h_e t_e$ ——原文正是这样把 $2h_e$ 与 $h_e$ 配平）。
在同一个无符号值类 $C$ 里，$\sum_j R_j(C)=\sum_{v\in C}\operatorname{wt}(v)-\max_{v\in C}\operatorname{wt}(v)$
（$R$ 是"位置数减类数"，逐层求和后等于"总权重减去该类最大权重"，因为最底那层少算一个代表），
于是得式 `diagram:weighted-coincidence`：
$\sum_C(\sum_{v\in C}\operatorname{wt}(v)-\max_{v\in C}\operatorname{wt}(v))\le(p-7f)T+f\sum_bw_b+\sum_e(h_e-\delta)t_e$。
再用 $\sum_b S_b=7T$ 把 $(p-7f)T+fW=(p-7f)T+f(W-7T)+7fT=pT+f(W-7T)$ ——
验算：$(p-7f)T+7fT=pT$ ✓ ——即得式 `diagram:contact-bound`。

(c) `[机械理由]`
- $8A$ 的来源：$T+(7T+Q)+E=8T+Q+E\le8(T+Q+E)=8A$ ✓。
  这个"至多 $8A$"是**唯一**把 2.7 的固定 $M$ 与图示规模挂钩的地方；系数 8 = 1 个顶层 + 7 个扇槽。
  若模板有 $g$ 个扇，系数变 $g+1$；因此 $g=7$ 同时进入 $p-gf-1$ 与 $8A$ 两处（$7\alpha$ 与 $8$ 是
  同一结构常数的两个侧面）。
- $w_b=\max\{r_b,m_b\}$ 的两个来源分别对应两类复用：$r_b$ 管"扇字段在 apex 实例上的复用"，
  $m_b$ 管"共享该扇的顶层的多重度"。若只取 $r_b$，则当一个顶层出现 $m$ 次而它只在该扇留 1 个
  实例时，$I$ 可正比于 $m$ 而右端不含 $m$ ⇒ 反例；若只取 $m_b$，则一个扇可出现多次实例、
  每次都用同一字段 ⇒ 也反例。**max 是最小的可工作选择** [推测]，但正文没写"最小"，也没写反例。
  证据来源：第 310–314 行的辩护句"two multiplicities must be distinguished. The number of
  represented apex instances bounds the actual use of each fan field. We must also retain this fan
  whenever we retain a top of sufficiently large multiplicity that requires it. The fan weight must
  therefore dominate the largest such top multiplicity."——连续两句各解释一个分量，
  是"曾经只用一个分量"的典型修补特征。
- "Empty maxima are zero"：$m_b$ 在 $b$ 不被任何选中顶层使用时无定义；取 0 保证 $w_b\ge r_b$ 仍成立，
  否则 2.11 的 $2(w_b-S_b)$ 项符号会乱。
- "This number is zero unless $b$ has type $D$"（$P_b^*$）：例外支付**只**来自松边 ⇒
  整个障碍机制在概率层就已被"一个缺口"锁定（呼应 2.1(c) 的一删一加）。
- "Radial side contacts are not counted in $I$"：径向接触改由 2.11 的逐顶点估计处理。
  若把径向接触也计进 $I$，则 $I$ 会包含 $Q$ 量级的项，而右端 $\Delta$ 的裕度是 $\alpha W$，
  不足以吸收 ⇒ 分工是强制的。
- "arbitrary cycles and repetitions in the contact graph … does not require the contacts to form a
  forest"（第 392–394 行）：作者特意声明不假设森林结构，因为收费对象是**边副本**而非顶点。
  这是与标准随机群论证（常假设无环/树形依赖）的显式区别 [推测]：可能曾试图用森林论证并失败。

(d) `[推测]` 失败路线
1. 不用层蛋糕而直接把 $t_a,r_b$ 当常数代入引理 3.2：只能处理"每 occurrence 用一次"的图，
   失去对任意图的控制。证据来源：$j\ge1$ 求和与"sum of its ranks is its total weight minus its
   largest position weight"这句**独立成句的解释**（第 367–369 行）——非平凡组合恒等式被单独说明，
   通常是作者自己核对过 [推测]。
2. 若把 $w_b$ 取成 $r_b+m_b$（和而非 max），则式 `diagram:apex-bound`（2.11）里
   $2(w_b-S_b)$ 变大，与 $Q/2+P^*/2+2J_b$ 不再配平。证据来源：Lean 里
   `ActualWeights.lean`（94 行）与 `RelativeWeights.lean`（95 行）分别定义两种权重记账，
   `ContactCapacity.lean`（63 行）单独处理"接触容量"，提示权重选择被反复调整。

Lean 对应：`WeightedRank.lean` 第 18 行 `positions_le`（"至多 $8A$"的 Lean 形式）、
第 26 行 `layer_card`、第 35 行 `weighted_rank_bound`、第 55 行 `contact_bound`；
`Fragment.lean` 第 28 行 `structure FragmentData {s u q v : ℕ} (T : Shape s u q)`、
第 49–53 行 `tops / triangles / squares / hexagons / fanWeight`（**注意**：Lean 的 fragment
数据里 square 与 hexagon 分开计数，即 $E$ 被拆成两个分量，见 4.5 差异清单）。
`LocalWeightedRank.lean`（83 行）与 `WeightedCoincidence.lean`（170 行）承担层蛋糕求和。

## 2.11 引理 3.6（`diagram:apex`，第 396–491 行）：apex 局部估计与 partial link 误差

(a) 原文陈述：

```tex
\begin{lemma}\label{diagram:apex}
For every fan occurrence $b$ in a fragment,
\begin{equation}\label{diagram:apex-bound}
 \sum_{z\mapsto b}d_z+2(w_b-S_b)
 \le \frac12\left(\sum_{z\mapsto b}q_z+P_b^*\right)+2J_b.
\end{equation}
Moreover
\begin{equation}\label{diagram:partial-bound}
 2\sum_bJ_b\le B_{\rm rad}.
\end{equation}
\end{lemma}
```

证明的两个情形（第 409–424 行、第 456–466 行）：

```tex
First suppose $w_b=r_b$.  A simple top polygon has at most one turn at this fan, so $S_b\ge\sum_{z\mapsto b}d_z$.
Consequently the left side of Equation~\eqref{diagram:apex-bound} is at most $\sum_{z\mapsto b}(2-d_z)$.
For a full link with $d_z=0$, at least four fan triangles give the required inequality.  For a full
link with $d_z=1$, the triangles form a path in the fan between the two distinct ports of that top
turn. … Thus in either case its triangle count plus its loose-side payment is at least two.  For
$d_z\ge2$ the expression $2-d_z$ is nonpositive.
…
At a partial link, the selected steps form a nonempty proper subset of a cyclic list of at most five
steps.  Split this subset into maximal consecutive selected runs.  Each run and each intervening
unselected gap contains a step, so there are at most two runs.  In a run containing turns, let $k$
and $l$ be the numbers of dominant and nondominant turns.  Their linear turn list has at most $l+1$
blocks of dominant turns.  Consequently, if $H$ counts its consecutive dominant-to-dominant
interfaces, then $H\ge k-l-1,\qquad k-l\le H+1.$
```

(b) `[补]` 情形一的逐步：
$w_b=r_b$ 时左端 $\sum_z d_z+2(r_b-S_b)\le\sum_z d_z+2(r_b-\sum_z d_z)=2r_b-\sum_z d_z$？
不对——用 $S_b\ge\sum_z d_z$ 与 $w_b=r_b=\sum_z 1$：
左端 $=\sum_z d_z+2(r_b-S_b)=\sum_z d_z+2\sum_z 1-2S_b\le\sum_z d_z+2\sum_z1-2\sum_z d_z
=\sum_z(2-d_z)$ ✓（用 $S_b\ge\sum_zd_z$ 缩右端）。
逐实例核对：
- $d_z=0$ 满链接：纯三角形链接 $\ge4$ 个（2.9 的结论），需 $2-0=2\le\frac12q_z$ ⇒ $q_z\ge4$ ✓ 恰好。
- $d_z=1$：三角形构成连接两个**不同端口**的路径；普通端口是线顶点 ⇒ 路径 $\ge2$ 边；
  例外情形（路径挂到 $X_D$）可为 1 边，此时该 top turn 带一条松边被 $P_b^*$ 计到 ⇒
  $q_z+$(松边) $\ge2$ ✓。
- $d_z\ge2$：$2-d_z\le0$，而右端非负 ⇒ 自动 ✓。
- partial：$d_z=0$ 至少 1 个三角形 ⇒ 亏空 $\le2-\tfrac12=\tfrac32$；$d_z=1$ 亏空 $\le2-\tfrac12-\text{turn项}=1$；
  $d_z\ge2$ 非正。用 $2J_b$ 支付 ⇒ 每实例允许亏空 2 ✓（$\tfrac32<2$）。
情形二（$w_b=m_b>r_b$）：取 $a_0$ 使 $t_{a_0}=m_b$，dominant $=a_0$ 的转弯。
$x,y$ 为选中 dominant/nondominant 转弯总数。nondominant 每至多 1 转弯 ⇒ $y\le S_b-m_b$。
于是 $\sum_z d_z+2(m_b-S_b)=(x+y)-2(S_b-m_b)\le x+y-2y=x-y$ ✓（式 `diagram:dominant-algebra`）。
满链接：循环列表里"dominant→dominant 相邻对数"$H_{\rm full}\ge(\text{dominant 数})-(\text{其他数})$
（证明：给每个 dominant 转弯指派它的后继；被指派为 nondominant 的 dominant 数 $\le$ nondominant 数）。
每对相邻 dominant 之间有三角形路径：长 0 ⇒ 两个多边形用同一 occurrence $a_0$ 的同索引辐条 ⇒ 违 2.9 性质 2；
长 1 ⇒ 必含例外端口 ⇒ 松边支付。故"路径长 + 支付 $\ge2$"，且各路径互不相交、端口不重复支付 ⇒
三角形数与支付之和 $\ge2(k-l)$（dominant 减 nondominant）✓ 再补 $\tfrac12$ 因子与式子吻合。
partial 链接：$\le5$ 步的非空真子集 ⇒ 连续段至多 2 个 run；线性列表里 dominant 块数 $\le l+1$
⇒ $H\ge k-l-1$ ⇒ $k-l\le H+1$；每个 $H$ 贡献 $\ge2$ 的三角形/支付，$\le$ 2 run ⇒ 每 run 加 1 的误差，
两 run 合计误差 2 ⇒ 又是 $2J_b$ 的量级 ✓。
式 `diagram:partial-bound`：partial 循环链接中"选中↔未选中"的切换 $\ge2$ 个，
每个切换是恰有一侧被选的辐条 ⇒ 计入 $B_{\rm rad}$；一条径向边只属一个 apex 实例 ⇒ 不重复 ✓。

(c) `[机械理由]`
- 系数 $\tfrac12$（$q_z$ 前）与 $2J_b$ 是**互相锁定**的：$d_z=0$ 满链接需要 $q_z\ge4$，
  即 $\tfrac12q_z\ge2=2-d_z$。若最大扇的纯三角形圈是 3 而非 4（即扇图非二部、存在三角形），
  该配平立刻失败 ⇒ 扇必须是二部图（$K_{2,3},K_{2,2},K_{1,3}$），这是"incidence 二部图"选择的
  第二个硬性理由（第一个见 2.1(c) 的 $C_2$ 商）。
- "at most five steps" 决定 2.12 里 $Q\le5W$ 与 $\kappa$ 中的 $\alpha/5$。
  这是 $\alpha/5$ 而不是 $\alpha$ 的唯一机械来源。
- $P_b^*$ 只在 $D$ 型扇非零 ⇒ 例外支付的总量 $\le$ 该扇相关的 top turn 数，
  不受 $n$ 影响；第六节的例外检验正是**回到**这个 $P_b^*$ 所在的松边，
  说明"概率层的松边豁免"与"几何层的松边例外"是同一枚硬币的两面。
- "Choose the dominant occurrence $a_0$ once for the entire fan occurrence $b$"：
  全局选一个 $a_0$ 而非逐实例选，否则各实例的 $x-y$ 无法与同一个 $m_b$ 对齐。
- 若把 $S_b\ge\sum_zd_z$  weaken 成 $S_b\ge\sum_zd_z-1$，$d_z=0$ 情形的 4 个三角形余量会被吃掉；
  即"每个简单宏圈至多在该扇转弯一次"不可弱化。

(d) `[推测]` 失败路线
1. 不用 dominant/nondominant 分类而直接对 $r_b,m_b$ 求和：则 $w_b=m_b$ 时无法把
   $2(m_b-S_b)$ 的负项转成可用支付。证据来源：原文用了专门的式 `diagram:dominant-algebra`
   并单独写出"$y\le S_b-m_b$"这种带 $m_b$ 的估计——一个把最大元减进去的记账恒等式，
   通常是为了把"$\max$"改写成"sum"而设计的 [推测]。
2. partial 链接的"至多两个 run"若不做，误差项会正比于链接长（$\le5$）而非 1 ⇒
   $2J_b$ 要换成 $5J_b$，$B_{\rm rad}$ 的系数不够（2.12 最后一步 $B_{\rm raw}+2B_{\rm rad}\le2B$ 失败）。
   证据来源：Lean 里 partial/relative 链接被拆成 `RelativeFanLink.lean`（186 行）、
   `RelativeRadialBoundary.lean`（129 行）、`WalkRadialBoundary.lean`（139 行）、
   `RelativeFrozenSide.lean`（37 行）、`FrozenSideExists.lean`（67 行）等近十个模块，
   提示"边界侧的计数"是最容易被反复修的环节。

Lean 对应：`FanApex.lean`（318 行，本节主战场）、`RelativeApexLocal.lean`（240 行）、
`RelativeApexAggregate.lean`、`WalkApexAggregate.lean`、`LinkApex.lean`、`CyclicLink.lean`、
`RelativeTopTurns.lean`（128 行）/`WalkTopTurns.lean`（130 行）（dominant/nondominant 转弯）、
`IndexedPayment.lean`（55 行）/`RelativePayment.lean`（142 行）/`WalkPayment.lean`（149 行）
（$P_b^*$ 的"支付"记账，注意 Lean 把"payment"独立成三类模块）。

## 2.12 引理 3.7（`diagram:fragment`，第 493–544 行）：$\kappa$ 与 $C_0=1/\kappa$

(a) 原文逐字：

```tex
\begin{lemma}\label{diagram:fragment}
Put
\begin{equation}\label{diagram:kappa}
 \kappa=\min\{\beta-7\alpha,\alpha/5,\delta\}>0.
\end{equation}
If Equation~\eqref{diagram:rank-bound} holds for collections of at most
$8A$ occurrences, then every fragment of area $A$ satisfies
\begin{equation}\label{diagram:fragment-bound}
 A\le C_0 B,\qquad C_0=\frac{1}{\kappa}.
\end{equation}
\end{lemma}
```

证明全文（第 505–544 行，除最后一句外全部照抄）：

```tex
Write $W=\sum_b w_b$ and $P^*=\sum_bP_b^*$.  Every simple top polygon has at least three turns.  Summing
Equation~\eqref{diagram:apex-bound}, and using Equation~\eqref{diagram:slot-sum}, gives
\begin{equation}\label{diagram:nominal-apex}
 3T+2(W-7T)\le \frac{Q+P^*}{2}+2\sum_bJ_b.
\end{equation}
The right side of Equation~\eqref{diagram:contact-bound} can be written as
\[
 3T+2(W-7T)+\sum_eh_et_e-\Delta,
 \qquad
 \Delta=(\beta-7\alpha)T+\alpha W+\delta E.
\]
There are at most five selected triangles at a represented fan-apex instance, so
$Q\le5\sum_b r_b\le5W$.  Therefore
\begin{equation}\label{diagram:defect}
 \Delta\ge\kappa(T+Q+E)=\kappa A.
\end{equation}
The total number of raw side copies in the fragment is
\[
 R_{\rm raw}=Q+P^*+\sum_e2h_et_e.
\]
Equations~\eqref{diagram:contact-bound} and \eqref{diagram:nominal-apex} imply
\[
 I\le \frac{R_{\rm raw}}2-\Delta+2\sum_bJ_b.
\]
Since $B_{\rm raw}=R_{\rm raw}-2I$, Equations~\eqref{diagram:partial-bound} and
\eqref{diagram:defect} give
\[
 2\kappa A\le 2\Delta\le B_{\rm raw}+4\sum_bJ_b\le B_{\rm raw}+2B_{\rm rad}\le2B.
\]
This is Equation~\eqref{diagram:fragment-bound}.
```

(b) `[补]` 中间步骤全部补齐：
1. $\Delta$ 恒等式（原文说"can be written as"，未展开）：
   式 `diagram:contact-bound` 右端 $=pT+f\sum_b(w_b-S_b)+\sum_e(h_e-\delta)t_e$。
   代入 $p=3-\beta,\ f=2-\alpha,\ \sum_bS_b=7T,\ W=\sum_bw_b$：
   $(3-\beta)T+(2-\alpha)(W-7T)+\sum_eh_et_e-\delta E$
   $=\bigl[3T+2(W-7T)+\sum_eh_et_e\bigr]-\bigl[\beta T+\alpha(W-7T)+\delta E\bigr]$
   $=\bigl[\cdots\bigr]-\bigl[(\beta-7\alpha)T+\alpha W+\delta E\bigr]$ ✓ 即 $\Delta$。
   **这是全文最要紧的一步代数**：$\beta$ 与 $7\alpha$ 的相遇点就在 $(2-\alpha)(W-7T)$ 展开出的
   $+7\alpha T-\beta T$。若模板有 $g$ 个扇，则出现 $\beta-g\alpha$，因此一般条件是 $\beta>g\alpha$
   ——$g=7$ 与"$7\alpha<\beta$"在同一个 algebra step 里绑定。
2. $I\le\frac12R_{\rm raw}-\Delta+2\sum_bJ_b$：
   由式 `diagram:contact-bound` $=3T+2(W-7T)+\sum_eh_et_e-\Delta$，
   再用式 `diagram:nominal-apex` 把 $3T+2(W-7T)\le\frac{Q+P^*}2+2\sum J_b$ 代入，
   并注意 $R_{\rm raw}=Q+P^*+\sum_e2h_et_e$ ⇒ $\frac{Q+P^*}2+\sum_eh_et_e=\frac{R_{\rm raw}}2$ ✓。
3. $B_{\rm raw}=R_{\rm raw}-2I$：每处内部接触消耗两侧各一条边副本（定义 $I$ 只计**字母边**接触，
   径向接触不改 $B_{\rm raw}$ 的核算——注意 $R_{\rm raw}$ 里含 $P^*$，$P^*$ 计的是松边（字母边）✓）。
4. $2\Delta\le B_{\rm raw}+4\sum_bJ_b$：由 2 得 $2I\le R_{\rm raw}-2\Delta+4\sum J_b$
   ⇒ $B_{\rm raw}=R_{\rm raw}-2I\ge2\Delta-4\sum J_b$ ✓。
5. $4\sum_bJ_b\le2B_{\rm rad}$：式 `diagram:partial-bound` ✓。
6. $B_{\rm raw}+2B_{\rm rad}\le2B=2B_{\rm raw}+2B_{\rm rad}$：因 $B_{\rm raw}\ge0$ ✓。
7. 合并：$2\kappa A\le2\Delta\le\cdots\le2B$ ⇒ $A\le B/\kappa$ ✓。

(c) `[机械理由]`
- $\kappa=\min\{\beta-7\alpha,\ \alpha/5,\ \delta\}$ 的三项**各自**来自哪一步：
  $\beta-7\alpha$ 来自 $T$ 项（顶层，见 b.1），$\alpha/5$ 来自把 $\alpha W$ 换成控制 $Q$
  （$Q\le5W$ ⇒ $\alpha W\ge\alpha Q/5$），$\delta$ 来自 $E$ 项。
  三项在式 `diagram:defect` 里必须**同时**成立，$\kappa$ 是三者最小 ⇒ 任一扰动都会缩小 margin；
  特别地 $\alpha/5$ 里的 5 **只能更小不能更大**：它来自"至多 5 步链接"，是硬上界（2.9(c)）。
- $C_0=1/\kappa$：$B_0\le\ell$ 与 2.13 的最终面积 $60C_0\ell$ 说明主定理里的 $C=60/\kappa$
  （在**该固定参数与固定 presentation** 下）。这是本文唯一"可读出"的 $C$ 的表达式，
  但论文没有把它写成公式——见 §五。
- "$Q\le5\sum_br_b\le5W$" 用 $r_b\le w_b$：又一次说明 $w_b$ 必须 $\ge r_b$（2.10(c)）。
- "Every simple top polygon has at least three turns" ⇒ 式 `diagram:nominal-apex` 左端的 $3T$；
  若宏圈允许 2-转弯，则左端变 $2T$，配平后 $\Delta$ 多出 $T$ 的正项要由裕度支付 ⇒
  $\kappa$ 里要再减一项（结论仍真但常数更差）。
- 若 $\kappa\to0^+$（即 $\beta\to7\alpha$ 或 $\alpha\to0$ 或 $\delta\to0$），$C_0\to\infty$，
  且 2.13 的 $K$ 阈值按 $(1/\kappa)^2$ 爆炸 ⇒ 引理逐点成立但**不一致**；
  注记 `diagram:quantifiers` 正是预先承认这点（见 2.15）。

(d) `[推测]` 失败路线
1. 直接取 $C_0$ 为某个"面积/边界"常数而不引入 $\Delta$ 记账：
   无法同时容纳三种细胞的不同裕度来源。证据来源：原文专门定义了 $\Delta$ 这个"亏空量"
   并把它写成三项和——"defect"型记账是作者为了让 $\min$ 出现而构造的中间量 [推测]。
2. 若"至多 5 步"曾被估成"至多 6 步"（把 $K_{2,3}$ 的 6 条边误当标签数，见 2.9(b) 第 4 步），
   $\alpha/5$ 变 $\alpha/6$，$\kappa$ 变小但结论不变；反向若估成 4 则失败。
   证据来源：2.9 里"Each such circuit has at most five steps"与"has at least four fan triangles"
   同时出现，说明作者在 4 与 5 之间反复核对过 [推测]。

Lean 对应：`Fragment.lean` 第 20 行 `defectConstant`（$\kappa$）、第 49–53 行的分量和；
`ActualFragment.lean` 第 22–25 行的核心不等式
`defectConstant α β δ * (T+Q+E+V : ℕ) ≤ (Br+Bd : ℕ)`——
**这里出现第四个面积分量 $V$**（正文只有 $T+Q+E$）：Lean 把装饰拆成
`squares`（4 字段阵）与 `hexagons`（六字表，见 `Fragment.lean` 第 51–52 行
`squares := ∑ e, W.square e`、`hexagons := ∑ e, W.six e`），
故 Lean 的 $A_{\rm Lean}=T+Q+E+V$ 比正文的 $A$ 多了"六字装饰盘"一项
（正文把它们并入 $E$，见 2.3 第 (iv) 类阵列）。这不是加强而是**记账口径不同**，
它使 Lean 的 $\Delta$ 也必须含 $V$ 的系数项——见 4.5 差异清单第 3 条。
`ActualPartition.lean` 第 93 行、`ActualRawAccount.lean`/`RelativeRawAccount.lean`（$R_{\rm raw}$）、
`ActualRawCount.lean`/`RelativeRawCount.lean`、`SeparatorBudget.lean` 第 3–4 行的注释
"The constant is deliberately inessential: only existence of K is required."

## 2.13 引理 3.8（`diagram:separator`，第 556–588 行）：平面分隔符与 $K(D,\eta)$

(a) 原文逐字：

```tex
\begin{lemma}\label{diagram:separator}
For every $D<\infty$ and $\eta>0$ there is an integer $K=K(D,\eta)$
such that the vertices of any finite planar multigraph of maximum
degree at most $D$ can be partitioned into sets of size at most $K$,
with at most $\eta$ times the total number of vertices edges crossing
between sets.
\end{lemma}
```

证明全文：

```tex
Ignore loops and apply the planar separator theorem to the underlying
simple graph.  In a graph with $q$ vertices it gives a set of at most
$c\sqrt q$ vertices whose removal leaves two sets, with no edges
between them, each of size at most $2q/3$; one may take
$c=2\sqrt2$ \cite[Corollary~2]{LiptonTarjan1979}.  Repeat inside every set larger
than $K$, and make every removed separator vertex a singleton part.

Charge $c/\sqrt q$ to every vertex present in a recursive set of size
$q$.  These charges pay for all removed separator vertices.  For any
fixed original vertex, the successive set sizes containing it decrease
by a factor at most $2/3$ while they exceed $K$.  Reading that sequence
backward shows that its total charge is at most
\[
 \frac{c}{\sqrt K}\sum_{j\ge0}(\sqrt{2/3})^j
       =\frac{c}{(1-\sqrt{2/3})\sqrt K}.
\]
If the original graph has $A$ vertices, the number of removed
separator vertices is at most $C A/\sqrt K$, where
$C=c/(1-\sqrt{2/3})$.  Every edge crossing between final parts has a
removed separator vertex as an endpoint.  The degree bound therefore
limits their number, counting multiplicity, to $DC A/\sqrt K$.
Choose $K$ so large that $DC/\sqrt K\le\eta$.  Disconnected graphs
are treated component by component.
```

(b) `[补]` 充电恒等式的细节：
沿递归，一个固定顶点 $v$ 出现在规模 $q_0=A>q_1>\cdots$ 的集合里，直到规模 $\le K$ 停；
每步规模 $\le\tfrac23q$，故**倒序**读：最小含 $v$ 的递归规模 $q_{\min}\ge K$（只有规模 $>K$ 才继续递归），
于是 $q_{\min}\ge K$，$q_{\min-1}\le\tfrac32 q_{\min}$…更直接的写法：
设序列从 $K$ 级别往上乘 $\tfrac32$，则 $\sum\frac{c}{\sqrt{q_j}}\le\frac{c}{\sqrt K}\sum_j(\sqrt{2/3})^j$ ✓。
几何级数 $\sum_j(\sqrt{2/3})^j=\frac{1}{1-\sqrt{2/3}}$，$\sqrt{2/3}\approx0.8165$ ⇒
系数 $\approx5.464$，$c=2\sqrt2\approx2.828$ ⇒ $C\approx15.41$。
$\boxed{K}$ 阈值：$K\ge(DC/\eta)^2$。取 $D=15$（2.14）⇒ $DC\approx231$。
每条跨块边都以某个被移除的分隔顶点为端点（否则它两端点仍在同一递归块内）；
重边按重数计，度数界 $D$ ⇒ 至多 $D\cdot(\text{移除顶点数})$。
移除顶点数 $\le CA/\sqrt K$（总充电 $\le AC/\sqrt K$，每个移除顶点至少收到 1 的充电）✓。
`[补]` "make every removed separator vertex a singleton part" 保证每块规模 $\le K$：
留在最终块里的顶点来自规模 $\le K$ 的递归集合 ✓。

(c) `[机械理由]`
- $c=2\sqrt2$ 来自 Lipton–Tarjan 推论 2（原文直接给定，"one may take"）。
  这是本文唯一"引用外部定理的具体常数"。
- 分隔符集大小 $c\sqrt q$ 与两部分各 $\le 2q/3$：这两个条件**都**要用——
  $\sqrt q$ 给充电，$2q/3$ 给几何衰减率 $\sqrt{2/3}$。
  若把 $2/3$ 换成任意 $\theta<1$，$C$ 变成 $c/(1-\sqrt\theta)$，结论形式不变；
  因此 $2/3$ 的具体值不是关键，$\theta<1$ 才是。
- 递归终止：$K$ 与 $D,\eta$ 有关而与图无关，这是"$A\le C_0(B_0+2\eta A)$ ⇒ $A\le2C_0B_0$"
  能解出 $A$ 的前提。若 $K$ 依赖图，则不存在统一的分块。
- $\eta$ 的选择被 2.14 限定为 $2C_0\eta\le1/2$ ⇒ $\eta\le\kappa/4$，
  于是 $K\ge\bigl(4\cdot15\cdot15.41/\kappa\bigr)^2\approx(924/\kappa)^2$。
  `[补]` 这意味着"充分小的 $\kappa$"会把有限阈值 $K$ 推得极大；
  但 $K$ 只影响"需要引理 3.2 对多大的 $M=8K$ 成立"，而后者是概率 1 事件，与 $n$ 无关
  （注记 `diagram:quantifiers` 的辩护就是为此）。
- 若 $D=\infty$（对偶图度数无界）引理失效 ⇒ 2.9 的"至多 15 边"不可少。

(d) `[推测]` 失败路线
1. 不用分隔符、改用"按距离分层"（BFS 层 + 稀疏层）：Lean 里存在完整一套
   `BFSLevels.lean`(82)/`BFSTree.lean`(113)/`ConnectedLevels.lean`(62)/`AnnularSeparator.lean`(137)
   （其文档字符串："Truncate a root-path separator between two sparse BFS levels. No contraction,
   new embedding, or connectedness of the specified set is needed."）
   ⇒ 强证据表明**形式化时放弃了 Lipton–Tarjan 的收缩论证**，改用"环带 + 稀疏层"路线
   （该路线不需要"分隔集收缩后仍连通"这一在多重图里难处理的性质）[推测]。
2. 用 $c\sqrt q$ 型分隔但保留"每个部分规模 $\le2q/3$"的递归树来直接控制面积而非边界：
   会导致 $A\le C_0B$ 的系数需要 $1/(1-\theta)$ 而非 $1/\kappa$，与几何裕度脱钩。
   证据来源：正文选择"充电"论证而非"解递归不等式"，并特意声明"Disconnected graphs are treated
   component by component"——一个容易被递归式路线忽略的技术点 [推测]。

Lean 对应：完全换路。`SeparatorRecursion.lean`（185 行）第 18 行 `structure CutPartition`；
`TreeCentroid.lean`（55 行）第 21 行 `weighted_tree_centroid` 文档："A finite weighted tree has a
centroid: each branch at the selected vertex has at most half the total weight. This is a genuine
weighted-tree theorem, not a planar-separator assumption."；
`SeparatorBudget.lean` 第 14 行 `budget c K n := 16 * c * n / Real.sqrt K - 8 * c * Real.sqrt n`、
第 31 行 `sqrt_split_gain`、第 61 行 `budget_step`；
`SeparatorCutoff.lean` 第 14 行 `exists_separator_cutoff (c d eta : ℝ) : ∃ K, 0 < K ∧
144*c^2 ≤ (K : ℝ) ∧ d*(16*c/Real.sqrt K) ≤ eta`；
`PicturePlanarSeparator.lean`、`AnnularSeparator.lean` 第 93 行 `sqrt_separator_of_banded_hull`、
`GraphSeparatorTransfer.lean` 第 29 行 `component_separator_pullback`、
`SeparatorComponents.lean`/`SeparatorGrouping.lean`/`BalancedGrouping.lean`/
`PictureBFSSeparator.lean`/`PictureRootSeparator.lean`/`PictureRadiusSeparator.lean`/
`PictureFullSeparator.lean`/`PictureSqrtSeparator.lean`/`PictureVertexCut.lean`。
⇒ 正文一句"one may take $c=2\sqrt2$"在 Lean 里对应**约 1400 行**自造的树加权定理 + 环带分隔 +
预算势函数。这是本篇"论文引用外部定理 / 形式化自证"差距最大的一处（见 4.5、4.7）。

## 2.14 定理 3.1 的证明（第 590–662 行）：$D=15$、$60C_0$、30 与 asphericity

(a) 原文关键段（量词顺序 + 分隔符使用）：

```tex
Fix the parameters, so that $\kappa$ and $C_0$ in Lemma~\ref{diagram:fragment} are positive
constants.  Choose $\eta>0$ with $2C_0\eta\le1/2$, and apply Lemma~\ref{diagram:separator} with
$D=15$.  This gives a fixed finite threshold $K$.  By Lemma~\ref{diagram:rank}, with probability
tending to one Equation~\eqref{diagram:rank-bound} holds for all collections of at most $8K$
occurrences.  Work with any realization having that property.  The remainder of the proof is
deterministic and applies simultaneously to every picture for this realization.
…
Partition its $A$ interior faces into fragments of size at most $K$, cutting at most $\eta A$
contacts.  Let $B_0$ count contacts with the outside polygon; in the sphere problem set $B_0=0$.
The sum of fragment boundary lengths is at most $B_0+2\eta A$.
Lemma~\ref{diagram:fragment} applies to every fragment, and summing it gives
\[
 A\le C_0(B_0+2\eta A), \qquad\text{hence}\qquad A\le2C_0 B_0.
\]
In a disk picture whose outside word has length $\ell$, one has $B_0\le\ell$; outside-to-outside
pairings represent free boundary cancellations and do not add an interior contact.  Thus the normal
picture uses at most $2C_0\ell$ interior faces.
```

asphericity 段与展开段（第 620–661 行）：

```tex
If a nonzero cellular two-cycle $c$ existed in $\widetilde P$, use its normal spherical picture
… For it $B_0=0$, forcing $A=0$.  Its cellular chain would then be zero, contrary to its
construction.  Therefore $H_2(\widetilde P;\mathbb Z)=0$. … If it had a first nonzero homotopy
group, the Hurewicz theorem would identify it with a nonzero homology group~\cite[Theorem~4.32]{Hatcher2002}.
It is consequently weakly contractible, and the Whitehead theorem makes it contractible~\cite[Theorem~4.5]{Hatcher2002}.
This proves asphericity.
…
A fan triangle boundary becomes a closed walk in that fan of length at most five.  A top polygon
boundary becomes a closed walk in its copy of $\Gamma$: … Its expanded length is at most thirty.  A
decoration boundary is unchanged.
… Any closed graph walk of length at most thirty splits at repeated vertices into at most thirty
simple cycles, after free backtracks are erased.  Each expanded face above thus has a filling with
at most thirty relator disks in this presentation.  Replacing the faces of the normal picture by
these fillings leaves the outside letter word unchanged and produces a disk diagram, with free folds
allowed, of area at most $60C_0\ell$.
```

(b) `[补]` 每个常数的推导：
1. 对偶图最大度数 $D=15$：面 = {扇三角（3 边）、装饰盘（4 或 6 边）、简单宏多边形（$\le15$ 边）}，
   故每面至多 15 条边 ⇒ 至多 15 个接触 ⇒ 对偶图（含平行边与自环）度数 $\le15$ ✓。
   径向边不算入 $B_0$、也不算入"与外侧的接触"（外侧多边形只与字母边相邻，见 2.9 后那句
   "The outside word uses only letter edges, so an outside polygon never meets a fan-apex instance"）。
2. "cutting at most $\eta A$ contacts" ⇒ 每个被切断的接触给**两个** fragment 各贡献一条边界边，
   故 fragment 边界总长 $\le B_0+2\eta A$ ✓（$B_0$ 只算一次：它本就是某个 fragment 的边界）。
3. $A\le C_0(B_0+2\eta A)$ ⇒ $(1-2C_0\eta)A\le C_0B_0$，由 $2C_0\eta\le\tfrac12$ ⇒
   $A\le2C_0B_0$ ✓ ——$1/2$ 的选择就是为了这个 2。
4. 展开长度：固定扇顶点到各顶点的路径 $\le2$（扇直径 $\le2$，$K_{2,3}$ 型 ✓）。
   - 扇三角边界 = 1 条字母边 + 2 条径向边 ⇒ $1+2+2=5$ ✓。
   - 普通点处 top polygon 的一条宏边展开成"两半径径路在扇内接起来"⇒ $\le2+2=4$；
     例外处是"到 $X_D$ 的路径 + 松边" ⇒ $\le2+1=3$。$\le15$ 条边 ⇒ 上界 $15\cdot4=60$？
     原文写的是"at most thirty"。`[补]` 核对：top polygon 的每条**边**是宏边，
     展开为该点扇内连接两个端口的路；每个转弯点处两条辐条接起来 ⇒ **每个转弯** $\le4$，
     而周长 $\le15$ 的圈最多 15 个转弯 ⇒ $\le60$。原文取 30，
     应是按"每条宏边的两半径展开合并为一条扇内路、$\le2$ 步"来计（每个顶点处的路 $\le2$，
     共 $\le15$ 个顶点 ⇒ $\le30$）✓ 即"$\le30$"依赖**每点只经过一次**（简单宏圈）＋
     路长 $\le2$ 而非 $4$。这是"简单宏圈"性质的第二次不可省。
     [推测] 30 也可能取"每边 $\le2$"，无论哪种，它都来自 $15\times2$。
   - 装饰边界不变 ✓（4 或 6 条字母边）。
5. "至多 30 个简单圈"：长 $\le30$ 的闭走行在自由约化后按重复顶点劈开 ⇒
   段数 $\le$ 长度 $\le30$，每段是简单圈 ⇒ 每个展开面用 $\le30$ 个关系盘填 ✓。
6. 总面积 $30\times(2C_0\ell)=60C_0\ell$ ✓ ——故主定理里的 $C=60C_0=60/\kappa$
   （对**这个**字母 presentation 而言；换 presentation 由"bounded relator substitutions"传递）。
7. asphericity 的三段：$H_2=0$ ⇒ 万向覆叠是单连通 2-维复形且 $H_*=0$ ⇒
   若有第一个非零同伦群 $\pi_k$（$k\ge2$），Hurewicz 定理给出 $H_k\ne0$ 矛盾 ⇒ 弱可缩 ⇒
   Whitehead ⇒ 可缩 ✓（$\widetilde P$ 是 CW，弱同伦等价即同伦等价）。

(c) `[机械理由]`
- 量词顺序**必须**是：参数 → $\eta$ → $K$（$=K(D,\eta)$，$D=15$ 固定）→ $M=8K$ →
  概率 1 事件 → 任取满足该事件的实现 → 确定性论证。
  若先取 $n$ 再取 $K$，"probability tending to one"里的 $M$ 就不能依赖 $K$；
  注记 `diagram:quantifiers`（2.15）就是为这个顺序写的。
- "with free folds allowed"：允许自由折叠 ⇒ 面积计数只算 2-胞腔，
  与约定"boundary spurs or collapsed edges have zero area"（引言 Conventions 第 175 行）呼应。
- "Sphere components can be discarded"：盘图示里混入球面分支不影响边界词也不增加所需面数上界。
- 若 $B_0\le\ell$ 弱化成 $B_0\le c\ell$（$c>1$），结论仍线性，只改 $C$。
  真正的非线性风险在 4 的"每点路长 $\le2$"：若展开长度是**周长**的超线性函数就没有线性界。

(d) `[推测]` 失败路线
1. 不用"展开成简单圈关系"而直接在 $P$ 上做 Van Kampen 图：那需要把锥辐条当作生成元，
   得到的边界词不来自字母表 ⇒ 无法陈述"letter presentation satisfies a linear disk
   isoperimetric inequality"。证据来源：正文第 648–649 行
   "Use as a finite letter presentation all simple cycle relators in each included fan and top graph,
   together with the decoration rows. This presents the same group by the cone construction in
   Section 2."——专门回引第二节的锥构造以确认"同一个群"，是切换 presentation 时的标准防错句 [推测]。
2. 第 3、4 步的 60/30 若混用（即 30 个圈 × 2C_0ℓ 写成 30C_0ℓ）系数会错；
   原文把它写成 $60C_0\ell$ 并显式解释来源。证据来源：Lean 不跟踪这个常数
   （`OriginalLinearFilling.lean` 只给 $\exists C$），提示作者自己也在意"常数是否可追溯"。
3. asphericity 若试图用"没有约化球面图示"（discancellation 风格的图示论）而非 Hurewicz+Whitehead，
   需要 $\pi_2$ 的图示基；证据来源：正文只写同调 + Hurewicz + Whitehead，
   并把"图示存在性"外包给 2.8 的引理 3.3；Lean 则改用覆叠收缩（见 2.5(d) 3）。

Lean 对应：`PictureDual.lean`（75 行，对偶图）、`PictureContact.lean`（103 行）、
`PictureUnderlyingGraph.lean`（122 行）、`ActualPartition.lean`（104 行，"边界总长 $\le B_0+2\eta A$"）、
`Fragment.lean` 第 20 行 `defectConstant` 与 `ActualFragment.lean` 第 88 行
`defectConstant α β δ * actualArea n w d c hc f P select ≤ …`；
`Asphericity`：`IntegralCellularBoundary.lean`、`HSpaceFundamental.lean`（102 行）、
`PathLocalToGlobal.lean`（59 行）、`IndexedFillingValue.lean` 第 5439 行
`finalFinite_aspherical`（Lean 用覆叠/收缩路线，见 2.5(d) 第 3 条）；
填充传递：`LetterFillingArea.lean`（51 行）、`WordDisk.lean`（162 行）、`WordSubstitution.lean`（83 行）。

## 2.15 注记 3.9（`diagram:quantifiers`，第 664–671 行）：量词顺序的预先辩护

(a) 原文逐字：

```tex
\begin{remark}\label{diagram:quantifiers}
The separator threshold is chosen after the positive parameters are
fixed and before $n$ tends to infinity.  No uniform bound as
$\alpha,\beta,\delta\longrightarrow0$ is asserted or required.
For each fixed parameter choice, the single finite-collection event in
Lemma~\ref{diagram:rank} controls all disk words and all cellular
two-cycles simultaneously.
\end{remark}
```

(b) `[补]` 该注记在防守什么：
最后一句"the single finite-collection event … controls all disk words and all cellular two-cycles"
= "对每个固定实现，引理 3.2 的事件是一次性成立的（概率趋 1），
   而它同时给出**所有**零词与**所有** 2-闭链的估计"。
这排除了一个可能的质疑：图示规模 $A$ 无界，为何能用"规模有界"的事件？
答：$8A$ 中的 $A$ 被分块后**统一受 $K$ 控制**（每块面数 $\le K$ ⇒ 每块的 occurrence 数 $\le8K$），
所以只需 $M=8K$ 那一件事件 ✓。这把"对所有图"归约为"对规模 $\le K$ 的有限族"。
(c) `[机械理由]` "No uniform bound as $\alpha,\beta,\delta\to0$" 与第七节的对角线
（$\alpha_j,\beta_j,\delta_j\to0$）**不矛盾**：第七节对每个 $j$ 各取一套参数、各取一套事件，
不需要一个统一的 $C$ 或统一的 $K$。这条声明是第七节合法性的前置豁免（见 2.39）。
(d) `[推测]` 这条注记的存在本身即失败路线证据：作者大概率**曾经**把 $K$ 的选取放在 $n$ 之后
（或至少担心读者这样读），才专门写"before $n$ tends to infinity"。
证据来源：正文措辞（防御性句子的位置：紧跟在最需要它的引理之后）。
Lean 对应：`RankSelection.lean`（109 行）/`RankSampling.lean`（130 行）里的
`RankSamplingStage (m M : ℕ) (φ : ℝ) extends SamplingStage m φ`
+ `actualRankSamplingStage (M : ℕ → ℕ)`——Lean 把"阈值 $M$ 是 $m$ 的函数"显式化成一个结构字段，
即量词顺序**编码进类型**；这是本素材认为最有价值的一处对照发现（详见 4.5、4.7）。

---

## 2.16 §4 开篇段＋主图案计数（`04-sampling.tex` 第 3–31 行）＋定义 4.1（`sample:def-test`，第 32–36 行）

(a) 原文逐字（开篇的设计动机，第 3–8 行，属"最接近思路链"的段落之一，见 3.3）：

```tex
The relations will be tested against an action chosen after all the tables
have been sampled.  We therefore prove statements about total variation of
finite distributions on table matches.  These statements do not refer to a
target metric space.  In particular, they will apply simultaneously to all
uniformly bounded functions on the relevant assignments, including functions obtained
from a subsequently chosen action.
```

字段/条目计数段（第 12–26 行）：

```tex
Recall the master pattern $\mathcal M$ from Section~\ref{sec:model},
and let $\mathcal F$ be its field set.  Its required entries are the
seven fan entries, the top-mark entry, and one entry from each of the
$90$ four-letter tables.  In each four-letter entry its first two fields are
identified with the corresponding core fields; its other two fields are
new and are used in no other entry.  The six-letter table is not part of
$\mathcal M$.  Thus $|\mathcal F|=212$.  Write $\mathcal R$ for the set of
its $98$ array entries and $E_\rho\subseteq\mathcal F$ for the field
support of $\rho\in\mathcal R$.  Each $\rho$ belongs to a different
Bernoulli array.  The order of its coordinates is fixed throughout.

A \emph{match} is a map $\sigma:\mathcal F\to S_n$ for which every
required array entry is present.  No injectivity is required of a single
match.  We write $\Omega_n$ for the random set of matches and, when it is
nonempty, write $\mu_N$ for its uniform probability measure.
```

定义 4.1（第 32–36 行）：

```tex
\begin{definition}\label{sample:def-test}
A \emph{conditional test} is a triple $(I,e,t)$ with
$I\subseteq\mathcal F$, $e\in\mathcal F\setminus I$,
$I\cup\{e\}$ admissible, and $t$ a positive integer.
\end{definition}
```

(b) `[补]` 计数核对（原文只给结论 $|\mathcal F|=212$、$|\mathcal R|=98$）：
- 条目：$7$ 个 fan 条目 $+\,1$ 个 top-mark 条目 $+\,90$ 个四字母条目 $=98=\#\mathcal R$ ✓。
- 字段：核心字段 $=32$（§2 的 $\Gamma$ 的边数；fan 度列 $(k_i)=(6,6,6,4,3,3,3)$、$\sum k_i=31$、
  另有 1 条被省略边 $Y_D\text{–}CD$，故 $31+1=32$ 条边成"核心"），四字母条目每个带 $2$ 个**全新**字段，
  $90\times2=180$，$32+180=212$ ✓。
- "Each $\rho$ belongs to a different Bernoulli array"：$98$ 个条目分属 $98$ 个互相独立的 Bernoulli 阵列，
  这是后文"期望是精确的"（见 2.17(c)）与"条件后其余试验仍保持原独立律"（第 263 行）的前提。
- 四字母 = 一个两端点路径 $X\to Y\to Z$ 加一个第四字母；Lean 直接把这类对象叫做 `TwoPath`，
  字段类型即 `Field := Edge ⊕ (TwoPath × Fin 2)`（`Template.lean:36`），两新字段用 `Fin 2` 索引 ✓。

(c) `[机械理由]` 定义 4.1 里"$I\cup\{e\}$ admissible"把 $|I|\le2$ 钉死：
`def:admissible`（见 2.5）只允许"至多 3 个核心字段且每 fan 至多 2 个"或"一个 square 装饰的至多 2 个字段"，
所以测试规模天然 $\le3$，于是第 119 行 "$|I|\leq2$，且每个条目支撑 $\ge3$ 个字段，故 $h(I)=|I|$" 成立。
这是"$t$ 个 match 只在 $I$ 上强制相等、$e$ 处自由发散"这一耦合能够有**整数级**余量的原因。
另外"single match 不要求 injectivity"是刻意的：若要求，则赋值数从 $N^{|\mathcal F|}$ 变成
$(N)_{t}^{\dots}$ 类的下降阶乘，均值 $N^{3-\beta-90\delta}$ 的指数会被改变；injectivity 只在星
（第 145–147 行"injective in each field"）里加，用来保证"非 $U$ 支撑的条目副本是阵列中的不同元组"。

(d) `[推测]` 失败路线：开篇段强调"these statements do not refer to a target metric space"——
作者明确把 §4 写成**与度量空间无关的有限分布定理**。若不这样切分，就得对"先取作用再取表"的顺序
（第 5–6 行 chosen after all the tables have been sampled）做选择公理式的对角化，
而 $\varepsilon$–网/可数性论证在"所有 proper cocompact 作用"的类上不可用（未述是否尝试过）。
证据来源：正文措辞的顺序强调句 + §5–§6 全部在"作用已给定"后进行。
另一条：若给 single match 也加 injectivity，则 §5 的六字母表 $\mathcal D_N\subseteq S_n^6$ 的
配对计数 $Q_{rq}(u,v)$ 的均值 $N^{1-\delta}$ 会变成 $N^{1-\delta}(1+o(1))$（差别不大），
但 $q$ 惩罚项 $C_tN^{-q}$ 中的 $C_t$ 会依赖 $n$，破坏"$t$ 固定时有限型"论证。[推测]
Lean 对应：`Template.lean:36 abbrev Field := Edge ⊕ (TwoPath × Fin 2)`、
`:40 card_fields : Fintype.card Field = 212`（由 `card_twoPaths = 90`、`card_edges = 32` 两个 `decide` 拼出）、
`IncidenceTemplate.lean:14 abbrev Row := Fin 7 ⊕ (Unit ⊕ TwoPath)`、`:18 card_rows = 98`、
`:56 rowSupport_card : 3 ≤ (rowSupport r).card`、`:63 admissible_card : Admissible S → S.card ≤ 3`、
`Test.lean:18 structure ConditionalTest`（字段 `fields/leaf/newLeaf/admissible/k`，分支数 $k+1$ 而非 $t$）。

## 2.17 成本表 `sample:eq-costs`（41–48）、指数 $h_\theta$（`sample:eq-h`，50–53）与 `sample:eq-master-mean`（59–66）

(a) 原文逐字：

```tex
For $\theta=(\alpha,\beta,\delta)$ define $c_\rho(\theta)$ so that
the inclusion probability of entry $\rho$ is $N^{-c_\rho(\theta)}$.
Its value and its critical value $c_\rho=c_\rho(0)$ are
\begin{equation}\label{sample:eq-costs}
\begin{array}{c|c|c}
\text{entry}&c_\rho(\theta)&c_\rho\\ \hline
\text{fan }i&k_i-2+\alpha&k_i-2\\
\text{top mark}&12+\beta-7\alpha&12\\
\text{four-letter entry}&2+\delta&2.
\end{array}
\end{equation}
For a set of fields $W$ put
\begin{equation}\label{sample:eq-h}
h_\theta(W)=|W|-\sum_{\rho:E_\rho\subseteq W}c_\rho(\theta),
\qquad h(W)=h_0(W).
\end{equation}
Thus $N^{h_\theta(W)}$ is the expected number of assignments to $W$
for which all required entries supported in $W$ are present.
The function $h$ is submodular.  Indeed, for each fixed $E_\rho$,
the indicator of $E_\rho\subseteq W$ is supermodular, and all
$c_\rho$ are nonnegative.  Notice also that
\begin{equation}\label{sample:eq-master-mean}
h(\mathcal F)=212-(17+12+180)=3,
\qquad
\E|\Omega_n|=N^{h_\theta(\mathcal F)}
             =N^{3-\beta-90\delta}.
\end{equation}
The expectation is exact: each assignment uses one entry from each of
the distinct arrays, so all of its inclusion requirements are independent.
```

(b) `[补]` 两个算术核对：
1. $h(\mathcal F)$：$\sum_{i=1}^{7}(k_i-2)=\sum k_i-14=31-14=17$；top mark $12$；四字母 $90\times2=180$。
   $212-(17+12+180)=212-209=3$ ✓（原文把这三项直接写成 17/12/180，未说明 17 的来源）。
2. $h_\theta(\mathcal F)=3-\beta-90\delta$ 的 $\alpha$ 消去（原文未展开）：
   $\sum_i(k_i-2+\alpha)=17+7\alpha$，top mark $=12+\beta-7\alpha$，四字母 $=180+90\delta$，
   故 $h_\theta(\mathcal F)=212-17-7\alpha-12-\beta+7\alpha-180-90\delta=3-\beta-90\delta$ ✓。
   $h_\theta$ 的**实际**成本递增总量 $=7\alpha+(\beta-7\alpha)+90\delta=\beta+90\delta$，
   正是第 454 行 $t[7\alpha+(\beta-7\alpha)+90\delta]=t(\beta+90\delta)$ 的出处。
3. submodularity 的机制：$W\mapsto\mathbf 1_{E_\rho\subseteq W}$ 对固定 $E_\rho$ 是 supermodular
   （$A\cap B$ 含 $E_\rho$ 且 $A\cup B$ 含 $E_\rho$ $\Rightarrow$ $A,B$ 都含 $E_\rho$，等号成立；
   一般 $f(A)+f(B)\le f(A\cap B)+f(A\cup B)$ 逐项成立），
   乘非负 $c_\rho$ 后取和仍是 supermodular，前面带负号 $\Rightarrow h$ submodular ✓。

(c) `[机械理由]` top-mark 成本里的 $-7\alpha$ 是**工程项**：恰好抵消 7 个 fan 条目带来的 $+7\alpha$，
使主图案均值与 $\alpha$ 无关，从而 $\alpha$ 只通过 §3 的 $\kappa=\min\{\beta-7\alpha,\alpha/5,\delta\}$
和"每个 fan 条目各自"的余量进入，而不与 $|\Omega_n|$ 的大小竞争。$12$ 这个临界值的选择理由：
完整核心的指数 $32-17-12=3$（第 87 行）要保证 $h(\mathcal F)=3>0$，同时 admissible 核心子集大小 $\le3$
（见 2.18(b)），使 $h(W)\ge|S|$ 恰好卡在边界上。$90\delta$ 则把四字母层的余量**全部吃掉**，
使该层成为"余量中性"层（每条目 $+2$ 字段、$-2$ 成本）。

(d) `[推测]` 失败路线：若 top-mark 成本不是 $12+\beta-7\alpha$ 而是 $12+\beta$，则
$h_\theta(\mathcal F)=3-\beta-7\alpha-90\delta$，$\alpha$ 必须更小，直接压低 §3 允许的
$\beta/\alpha$ 比（§3 需要 $\beta>7\alpha$ 严格），整条链的参数体积（$\kappa$）会缩小 $O(1)$ 倍。
[推测] 这正是 $-7\alpha$ 出现的动机。证据来源：第 58 行 "Notice also that" 后紧跟的两数并列，
以及第 449–450 行 "Since $\beta>7\alpha$, all cost increments are positive"。
Lean 对应：`IncidenceTemplate.lean:27 def rowCost : Row → ℤ`（fan $k_i-2$、top $12$、square $2$，即临界列）、
`:32 def pattern : SparsePattern.Pattern Field Row`、`:43 pattern_exponent (W : Finset Field)`
（把 $h$ 写成一个通用 `SparsePattern.exponent` 的实例，submodularity 由通用引理承担）。

## 2.18 引理 4.2（`sample:lem-budget`，第 68–103 行）：预算 $h(W)\ge\min\{2,|W|\}$

(a) 原文逐字（陈述，第 68–77 行）：

```tex
\begin{lemma}\label{sample:lem-budget}
For every $W\subseteq\mathcal F$,
\begin{equation}\label{sample:eq-budget}
h(W)\geq\min\{2,|W|\}.
\end{equation}
If $S$ is admissible and $S\subseteq W$, then
\begin{equation}\label{sample:eq-admissible-budget}
h(W)\geq |S|.
\end{equation}
\end{lemma}
```

证明开头关键两步（第 79–89 行）：

```tex
First consider only the core part of $W$.  Let $a_i$ be its number of
fields in $F_i$, and let $\ell\in\{0,1\}$ indicate the loose field.
Before charging the top mark, the exponent is
\[
\sum_i\bigl(a_i-(k_i-2)\mathbf 1_{\{a_i=k_i\}}\bigr)+\ell
\ \geq\ \sum_i\min\{a_i,2\}+\ell.
\]
The top-mark cost is charged only for the complete core.  For that set
the exponent is $32-17-12=3$.
```

(b) `[补]` 逐情形验证那个 $\ge$（原文未展开）：记 $i$ 固定。
- 若 $a_i<k_i$：左端贡献 $a_i$，右端 $\min\{a_i,2\}\le a_i$ ✓。
- 若 $a_i=k_i$：左端贡献 $k_i-(k_i-2)=2$；右端 $\min\{k_i,2\}=2$（因 $k_i\in\{3,4,6\}\ge2$）✓ 等号。
所以逐点成立、求和成立；$\ell$ 项无成本故原样保留。
核心完整集（$a_i=k_i$ 全部、$\ell=1$）的指数：$32-\sum(k_i-2)-12=32-17-12=3$ ✓；
此时任一 admissible 核心子集 $S$ 满足 $|S|\le3$（每 fan $\le2$、总数 $\le3$），故 $3\ge|S|$ 卡在边界。
再看四字母新字段（第 91–99 行）：加 1 个新字段 $\Rightarrow$ 指数 $+1$（无条目被收费）；
加 2 个新字段 $\Rightarrow$ 指数 $+2$，但若该条目的 2 个核心字段也都在 $W$ 内则可收 $2$，净贡献 $0$；
故"每对新字段净贡献非负"。于是
$h(W)\ge\bigl[\text{核心子集指数}\bigr]\ge\min\{2,|\text{核心}|\}\ge\min\{2,|W|\}$ 不自动成立——
原文的真实逻辑是：$h(W)\ge$ 核心部分指数 $+\underbrace{0}_{\text{新字段净贡献}}$，
而核心部分指数 $\ge\min\{2,\ |\text{核心字段}|\}$ 或 $\ge|S|$。
`[补]` 当 $|W|$ 的核心字段数 $\ge2$ 时得式 `sample:eq-budget`；
当核心字段数 $<2$ 时，"$h(W)=|W|$"（第 98–99 行）：因为没有 2 个核心字段就不可能包含任何条目支撑
（fan 条目支撑 $k_i\ge3$、top mark $32$、四字母 $4$），所以零收费，$h(W)=|W|$ ✓，
此时 $\min\{2,|W|\}=|W|$（$|W|\le1$ 或 $|W|=2$ 且全为新字段）✓。
最后一句（第 100–102 行）处理 admissible 型二：$S$ 是单个四字母条目的至多 2 字段，
$|S|\le2$，由 `sample:eq-budget` 得 $h(W)\ge\min\{2,|W|\}$；
`[补]` 还需 $|W|\ge|S|$：$S\subseteq W$ 且 $h(W)\ge\min\{2,|W|\}$，若 $|W|\ge2$ 则 $\ge2\ge|S|$；
若 $|W|=1$ 则 $|S|\le1$ ✓。逻辑闭合。

(c) `[机械理由]` 两条界各自被下游用在何处（机械对应）：
`sample:eq-budget` → 第 513 行 $U=\varnothing$ 的强制、第 212 行 $h(W)>0$、第 342 行 $h(V_j)\ge2$；
`sample:eq-admissible-budget` → 第 133 行 $e\notin U$（对 $I\cup\{e\}$ 用）与第 135 行
"任何 $U$ 的超集指数 $\ge|I|$"（对 $I$ 用）。

(d) `[推测]` 失败路线：`$\sum_i\min\{a_i,2\}+\ell$` 之所以能给出**恰好** $\ge$ admissible 尺寸，
是因为 admissible 允许"每 fan 至多 2"。若把 admissible 放松成"每 fan 至多 3"（或允许 3 个 fan），
则 $|S|$ 上界升到 $>3$，而完整核心指数仍是 $3$，式 `sample:eq-admissible-budget` 立刻失效，
于是闭包 $U$ 的 $e\notin U$（引理 4.2 的直接推论）不成立，§4 全部耦合崩塌。
证据来源：证明里"at least the size of any admissible core subset it contains"这句的措辞把两个量绑定；
以及 $k_i$ 最小值 $3$ 与 $\min\{a_i,2\}$ 的 2 之间只差 1。
Lean 对应：`Template.lean:113 coreExponent W = looseCount W + ∑ i, fanScore W i - …`、
`:143 min W.card 2 ≤ looseCount W + ∑ i, min (fanCount W i) 2`（`omega` 关闭，正对应上面逐情形），
`IncidenceTemplate.lean:63 admissible_card`、`:70 admissible_subset`，
`Test.lean` 一侧的预算结论由 `criticalExponent_admissible`（在 `IncidenceTemplate.lean:100` 被引用）提供。

## 2.19 闭包 $U$：`sample:eq-closure`（122–124）与 `sample:eq-closure-gap`（127–137）

(a) 原文逐字（含设计动机句，第 105–137 行）：

```tex
Fix a conditional test $(I,e,t)$.  To couple $t$ matches agreeing on
$I$, we will require them to agree on a possibly larger set $U$.
The purpose of this enlargement is to make every further extension
increase the critical exponent.  For example, if $I$ consists of two
fields in one fan $F_i$, then completing that fan leaves the exponent
unchanged:
\[
h(I)=2=h(E(F_i)).
\]
Once the fan fields have been included, adjoining both fresh fields of
any square whose two core fields lie in that fan also leaves the exponent
unchanged.  These are examples of the enlargements that the choice of
$U$ must absorb.

In general, $|I|\leq2$, and every entry support has at least three
fields, so $h(I)=|I|$.  Choose an inclusion-maximal set
$U\supseteq I$ such that
\begin{equation}\label{sample:eq-closure}
h(U)=|I|.
\end{equation}
Such a set exists because the field set is finite.  The next two
properties are the reason for this choice:
\begin{equation}\label{sample:eq-closure-gap}
e\notin U,
\qquad
h(U\cup V)-h(U)\geq1
\quad\text{for every nonempty }V\subseteq\mathcal F\setminus U.
\end{equation}
The first follows from Equation~\eqref{sample:eq-admissible-budget}
applied to $I\cup\{e\}$.  For the second, every superset of $U$
has exponent at least $|I|$ by the same lemma applied to $I$.
Maximality rules out equality for a strict superset, and all critical
exponents are integers.
```

(b) `[补]` 两处未展开的理由：
1. "$h(I)=2=h(E(F_i))$"：$I$ 是两个 fan-$i$ 字段 ⇒ 不含任何条目支撑 ⇒ $h(I)=|I|=2$；
   $E(F_i)$ 是第 $i$ 个 fan 条目的支撑 $=F_i$ 的全部 $k_i$ 个字段 ⇒
   $h(E(F_i))=k_i-(k_i-2)=2$ ✓ 相等，即"补全整个 fan 不改变指数"。
2. "adjoining both fresh fields … leaves the exponent unchanged"：两新字段带来 $+2$，
   条目支撑 $=$ 2 核心字段（已在 $F_i$ 内）$+2$ 新字段 $\subseteq W$ ⇒ 收费 $-2$ ⇒ 净 $0$ ✓。
3. 整数性：临界成本 $k_i-2,\,12,\,2$ 全是整数，$|W|$ 是整数 ⇒ $h$ 整数值 ⇒
   "排除等号"就得到 $\ge1$（而非 $>0$）。这一步是 §4 里所有 $o(1)$ 的**强度来源**
   （余量是 $1$，扰动后 $\ge1/2$）。

(c) `[机械理由]` $U$ 的存在性只用有限性（取包含链的极大元）；$e\notin U$ 是 $I\cup\{e\}$ 的
admissible 下界与 $h(U)=|I|<|I|+1\le|I\cup\{e\}|\le h(\cdot)$ 的冲突结果——
严格说：若 $e\in U$，则 `sample:eq-admissible-budget`（$S=I\cup\{e\}$，$A=S$ admissible）给
$h(U)\ge|I|+1>|I|$，与式 `sample:eq-closure` 矛盾 ✓。

(d) `[推测]` 失败路线（也是本节最"思路链"的一处）：作者用 "These are examples of the enlargements
that the choice of $U$ must absorb" 明说 $U$ 是**为修补零余量例子而设计的**，即先发现"补全 fan / 补全
square 新字段"使余量为 0，再引入极大等指数闭包。[推测] 若不引入 $U$，直接对 $I$ 做耦合，
则两个扩展共享"某个完整 fan 条目"时 $q$ 惩罚 $=k_i$、回收成本 $=k_i-2$，余量 $=2\ne0$——
但对"完整 fan $+$该 fan 内某 square 的两新字段"的共享，余量 $=0$，方差界变成 $O(1)$ 而非 $o(1)$，
引理 4.3 的"uniform relative variance $o(1)$"失效，进而 §5 的 `lem:conditional-test` 得不到一致测试。
证据来源：第 108–117 行两个具体例子的选取（恰好是零余量的两类）。
Lean 对应：`IncidenceTemplate.lean:81-83` 注释 "The closure and its whole-integer positive margin with no
uninstantiated budget hypotheses: this is the exact master-pattern closure of Section 4."，
定理体 `exists_critical_closure (I) (e) (he : e ∉ I) (hadm : Admissible (insert e I)) :
∃ U, I ⊆ U ∧ criticalExponent U = I.card ∧ e ∉ U ∧ ∀ V, V.Nonempty → Disjoint V U →
1 ≤ criticalExponent (U ∪ V) - criticalExponent U`——把原文两句"reason for this choice"合并成一条存在性；
其证明用 `admissible_card` + `rowSupport_card` + `omega` 得 `hnone : ¬rowSupport r ⊆ I`，
即原文"$|I|\le2$、每支撑 $\ge3$、故 $h(I)=|I|$"的机器版；
`Test.lean:27 def closure := (exists_critical_closure …).choose`、`:30 closure_spec`、`:36 closure_gap`。
差异：原文写 $V\subseteq\mathcal F\setminus U$，Lean 写 `Disjoint V U`（等价）；
原文的"maximality"在 Lean 里由通用 `pattern.critical_closure` 内部承担（未在本目录出现"maximal"字样）。

## 2.20 星、重叠类型与四条计数式（第 139–235 行）

(a) 原文逐字（构造段，第 141–148 行）：

```tex
Form a star $\mathcal M_U^{(t)}$ from $t$ ordered copies of
$\mathcal M$ by identifying all copies of each field in $U$.
Entries supported entirely in $U$ are also identified.  Each other
entry retains one copy in each branch.  We require assignments to this
star to be \emph{injective in each field}: for each
$s\in\mathcal F\setminus U$, its $t$ branch values must be pairwise
distinct.  Values in different fields may coincide.  All fields continue
to take values in the same alphabet $S_n$.
```

计数规则与四条公式（第 173–235 行，逐字）：

```tex
Here is the resulting counting rule.  Reveal the first assignment.
Suppose the equalities of an overlap type prescribe the values of $q$
distinct, previously unpinned variables in the second assignment.
For each field with unpinned variables, there are a bounded number of
those variables, and they are chosen uniformly without replacement,
possibly avoiding one already pinned value.  A field whose variables
are all pinned contributes a factor one.  Prescribing $q_s$ of them has probability at most
$C_t N^{-q_s}$: the number of remaining choices is at most
$N^{r-q_s}$, whereas the number of unrestricted choices is a falling
factorial $(N-a)_r$, with $r\leq t$ and $a\in\{0,1\}$.
Multiplying over the finitely many fields gives
\begin{equation}\label{sample:eq-assignment-penalty}
\text{fraction of pairs having the specified overlap}
\ \leq\ C_tN^{-q}.
\end{equation}
Incompatible specifications simply contribute zero.

If the coincident, unconditioned entries have total actual cost $C$,
their joint inclusion probability divided by the product of the two
individual inclusion probabilities is $N^C$.  All other trials are
independent.  Consequently this overlap type contributes at most
\begin{equation}\label{sample:eq-variance-rule}
C_t N^{-q+C}
\end{equation}
to the relative variance of the count in question.  Pairs with no
coincident unconditioned entry have covariance zero, including when
they have coincident values that do not complete any common entry.
```

```tex
\frac{\operatorname{Var}|\Omega_n|}{(\E|\Omega_n|)^2}=o(1).
\tag{sample:eq-single-concentration}
\end{equation}
```
（完整式：`C_U(\theta)=\sum_{\rho:E_\rho\subseteq U}c_\rho(\theta)`、
`C_{\mathrm{out}}(\theta)=\sum_{\rho:E_\rho\not\subseteq U}c_\rho(\theta)`、`d=|\mathcal F\setminus U|`，
`Z_N` 为 present injective star 数，$(N)_t=N(N-1)\cdots(N-t+1)$：）

```tex
\E Z_N
 =N^{|U|}(N)_t^d
  N^{-C_U(\theta)-tC_{\mathrm{out}}(\theta)}.
\tag{sample:eq-star-mean}
```

(b) `[补]` $C_tN^{-q_s}$ 的推导：固定字段 $s$ 有 $r\le t$ 个未钉变量，无放回均匀取值且可避开 1 个已钉值，
故样本空间大小 $(N-a)_r$（$a\in\{0,1\}$）；指定其中 $q_s$ 个的值后剩 $N^{r-q_s}$ 上界（原文用"至多 $N^{r-q_s}$"，
`[补]` 因为 $(N-a)_{r-q_s}\le N^{r-q_s}$），于是概率 $\le N^{r-q_s}/(N-a)_r\le C_tN^{-q_s}$，
其中 $C_t:=\max_{r\le t,a\le1}N^{r}/(N-a)_r$ 对固定 $t$、$N\to\infty$ 一致有界 ✓（$(N-a)_r\ge c_tN^r$）。
对字段乘积：$\prod_s C_tN^{-q_s}$，字段数有限（$\le|\mathcal F|=212$）⇒ 吸收进 $C_t$ ⇒ $C_tN^{-q}$，
$q=\sum_sq_s$ ✓。
`[补]` `sample:eq-variance-rule`：设两个计数变量 $X,Y$ 由 Bernoulli 试验乘积给出，
$\E[XY]/(\E X\E Y)=N^{C}$（共现的未条件条目总实际成本 $C$ 被"回收"），
而满足该重叠类型的配对比例 $\le C_tN^{-q}$，故 $\operatorname{Cov}(X,Y)/(\E X\E Y)\le C_tN^{-q+C}$；
"所有候选赋值有相同包含概率"这一步把相对方差归一化说明白（第 200–206 行），
求和于有限个非空重叠类型 ✓。
`[补]` `sample:eq-star-mean`：$|U|$ 个中心字段各 $N$ 种（$N^{|U|}$）；$d$ 个外围字段各需
$t$ 个两两不同值（$(N)_t^d$）；$U$ 内条目在 $t$ 个分支里是**同一个**（识别了），故只收一次 $c_\rho$（$C_U$）；
$E_\rho\not\subseteq U$ 的条目在每个分支独立存在，收 $t$ 次（$tC_{\mathrm{out}}$）✓。

(c) `[机械理由]` "Values in different fields may coincide" 与
"Pairs with no coincident unconditioned entry have covariance zero, including when they have
coincident values that do not complete any common entry"（第 197–199 行）：
只有**同一字段同一分支**的变量相等才构成重叠；跨字段的数值巧合不改变任何条目的存在性，
因而协方差为 0——这是允许"跨字段可同值"的技术前提，否则每对的可用取值数会随 $N$ 变化、
$(N-a)_r$ 模型失效。overlap type 的"partial matching"表述（第 163–171 行）是同一件事的组合化。

(d) `[推测]` 失败路线：若把"injective in each field"改成"整体单射（different fields 也不同值）"，
则中心 $U$ 与外围之间的等值约束耦合，$(N)_t^d$ 变成 $(N)_{td}$，均值指数出现 $-td$ 级别的额外损失，
$\E Z_N$ 的指数变负，present star 数几乎必为 0，耦合不存在。
证据来源：原文第 146–147 行的精确限定 "for each $s\in\mathcal F\setminus U$"（逐字段），
以及第 166–168 行 "their union must still be a partial matching whenever the overlap type is realizable.
Otherwise two different branch values of the same field would be forced equal."
Lean 对应：`StarModel.lean`（139 行，`Var (B := …) U` 是"分支×字段"变量类型，`B` 是分支索引类型，
分支数 $=k+1$）、`StarActual.lean:66 star_extension_actual_gap`（把"临界→实际"的成本增量差显式成引理）、
`StarVariance.lean:19 leafCount`、`:24 extensionCount`、`:30 branch_pin_fieldwise`、`:40 ext_injective`、
`:46 ext_surcharge_le`（对应 $q$ 惩罚）、`:67` 假设组 `(ha : 0 ≤ α) (hb : 7*α ≤ β) (hd : 0 ≤ δ)`。
**差异**：原文要求严格 $\beta>7\alpha$，Lean 全程只写非严格 `7*α ≤ β`——机器证明里所有余量都靠
"$q-C\ge1$ 的整数下界"而非"$\beta-7\alpha>0$"，因此非严格更稳。`Fintype.card PairPositions` 一类
的 $C_t$ 在 Lean 中由 `StarModel.Var` 的有限 `Fintype` 直接枚举。

## 2.21 引理 4.3（`sample:lem-conditional-counts`，第 237–354 行）：扩展数与叶数的一致相对方差

(a) 原文逐字（陈述，第 237–260 行）：

```tex
\begin{lemma}\label{sample:lem-conditional-counts}
For each fixed conditional test, sufficiently small actual parameters
have the following properties as $N\to\infty$.
\item Fix any assignment $\sigma:\mathcal F\to S_n$, place it in a
specified branch, and condition on it being a match.  Let $A_\sigma$
count its extensions to a present injective star.  Its conditional
mean is independent of $\sigma$ and equals
\begin{equation}\label{sample:eq-extension-mean}
a_N=((N-1)_{t-1})^d
       N^{-(t-1)C_{\mathrm{out}}(\theta)}.
\end{equation}
Uniformly in $\sigma$, its conditional relative variance is $o(1)$.
\item Fix any ordered list $b=(b_1,\ldots,b_t)$ of distinct letters
as the values of field $e$ in the branches.  Let $B_b$ count the present
injective stars having those values.  Its mean is independent of $b$
and equals
\begin{equation}\label{sample:eq-leaf-mean}
b_N=N^{|U|}(N)_t^{d-1}
       N^{-C_U(\theta)-tC_{\mathrm{out}}(\theta)}.
\end{equation}
Uniformly in $b$, its relative variance is $o(1)$.
\end{enumerate}
\end{lemma}
```

核心不等式（第 312–345 行，逐字，含 `sample:eq-leaf-excess` 与 `sample:eq-star-submodular`）：

```tex
Define $h_\star(W)$ using the critical entry costs in the star, counting
entries entirely in $U$ once and the other entries separately in each
branch.  The recovered cost is at most the cost of all star entries
supported in $W$.  Therefore the critical excess is at least
\begin{equation}\label{sample:eq-leaf-excess}
h_\star(W)-m(W).
\end{equation}
If $A\ne\varnothing$, separating entries entirely in $U$ from the
entries in each branch gives
\begin{align}
h_\star(W)
&\geq h(A)+
 \sum_{j:V_j\ne\varnothing}
       \bigl[h(U\cup V_j)-h(U)\bigr].
\label{sample:eq-star-submodular}
\end{align}
Indeed the exact contribution of branch $j$ is $|V_j|$ minus the
costs of entries supported in $A\cup V_j$ but not entirely in $U$;
replacing $A$ by $U$ can only increase those costs.  This proves the
displayed inequality directly.  Its first term is at least one by
Lemma~\ref{sample:lem-budget}, and each nonempty summand is at least
one by Equation~\eqref{sample:eq-closure-gap}.  Each such branch
contains at most one pinned $e$-variable.  Hence the excess in
Equation~\eqref{sample:eq-leaf-excess} is at least one.

If $A=\varnothing$, no shared entry meets $U$, and entries in different
branches use disjoint variables.  Consequently
$h_\star(W)=\sum_j h(V_j)$.  An active branch contains the full
support of at least one shared entry.  Every entry support has at least
three fields, so $|V_j|\geq3$ in such a branch and
Lemma~\ref{sample:lem-budget} gives $h(V_j)\geq2$.
Subtracting at most one pinned leaf per branch again leaves a positive
excess.  This argument is applied to supports of shared entries, not
to arbitrary nonempty field subsets.
```

(b) `[补]` 均值的组合计数：
- `sample:eq-extension-mean`：条件在 $\sigma$ 的试验之后，$U$ 内条目与指定分支的条目已定；
  其余 $t-1$ 个分支的每个外围字段必须两两不同且避开 $\sigma$ 的值 ⇒ $(N-1)_{t-1}$；
  每个额外分支需要全部 $E_\rho\not\subseteq U$ 的条目 ⇒ $N^{-(t-1)C_{\mathrm{out}}(\theta)}$；
  注意**没有** $N^{|U|}$（$U$ 已被 $\sigma$ 钉住）✓。$t=1$ 时 $a_N=1$、$A_\sigma\equiv1$（第 294–295 行）。
- `sample:eq-leaf-mean`：$e\notin U$，其 $t$ 个钉定值两两不同，正好满足 $e$ 的字段内单射约束 ⇒
  $e$ 不再有自由度；其余 $d-1$ 个外围字段 $(N)_t^{d-1}$；中心 $N^{|U|}$；条目收费 $C_U+tC_{\mathrm{out}}$ ✓。
- `[补]` $h_\star$ 的分拆（$A\ne\varnothing$）：$h_\star(W)=|W|-\bigl[\sum_{\rho\subseteq A\text{ (in }U)}c_\rho
  +\sum_j\sum_{\rho:\,E_\rho\subseteq A\cup V_j,\ \not\subseteq U}c_\rho\bigr]$。
  把 $|W|=|A|+\sum_j|V_j|$ 代入并按 $h$ 的定义重新组合：
  $|A|-\sum_{\rho\subseteq A}c_\rho=h(A)$；第 $j$ 项 $=|V_j|-\sum_{\rho\subseteq A\cup V_j,\not\subseteq U}c_\rho
  \ \ge\ |V_j|-\sum_{\rho\subseteq U\cup V_j,\not\subseteq U}c_\rho=h(U\cup V_j)-h(U)$
  （用 $A\subseteq U$ 且 $V_j$ 与 $U$ 不交 ⇒ $h(U\cup V_j)-h(U)=|V_j|-\sum_{\subseteq U\cup V_j,\not\subseteq U}c_\rho$，
  这一步原文说"replacing $A$ by $U$ can only increase those costs"，等号细节 `[补]`）✓。
- `[补]` 扣 $m(W)$：每分支至多 1 个被钉的 $e$ 变量 ⇒ $m(W)\le\#\{j:V_j\ne\varnothing\}$，
  与 $\sum_j[\cdot]$ 中的每个 $\ge1$ 逐项抵消，剩 $h(A)\ge\min\{2,|A|\}\ge1$ ✓。
- `[补]` $A=\varnothing$ 情形：$m(W)\le\#$active branches，而每个 active branch 有 $h(V_j)\ge2$，
  相减每分支仍 $\ge1$ ✓。原文末句"This argument is applied to supports of shared entries,
  not to arbitrary nonempty field subsets"是自我设限：$|V_j|\ge3$ 只对**共享条目的支撑**成立
  （active 的定义），对任意子集不成立，故不能把该引理外推成"$h_\star(W)-m(W)\ge1$ 对一切 $W$"。

(c) `[机械理由]` 为什么扩展情形不需要分 $A=\varnothing$ / $A\ne\varnothing$：
扩展情形里 $U$ 值全被 $\sigma$ 钉住、$A$ 自动是"全 $U$"，所以第 274–289 行直接用
$\sum_j|V_j|$ 作惩罚、$\sum_{\rho\subseteq U\cup V_j,\not\subseteq U}c_\rho$ 作回收，一步得 $\ge1$；
叶情形只钉 $e$ 的 $t$ 个值，$A=W\cap U$ 可空，才需要分岔。

(d) `[推测]` 失败路线：$h(V_j)\ge2$ 依赖"每个条目支撑 $\ge3$ 字段"。fan 条目支撑 $=k_i$，
最小者 $k_i=3$；若模板允许 $k_i=2$ 的 fan（即一条度 2 的"fan"），则 $|V_j|$ 可降到 2、
$h(V_j)\ge\min\{2,2\}=2$ 仍成立——真正的硬约束是 $k_i\ge2$（式 `sample:eq-budget` 的 2）与
四字母条目支撑 $4\ge3$。`[推测]` 所以这条引理的健壮性来自"$\min\{2,|W|\}$"里的 **2**，
它同时是 admissible 上限 3 与 $h(\mathcal F)=3$ 的来源；把 2 改成 1（例如允许 $k_i=1$）会让
$A=\varnothing$ 分支的"减 1 后仍正"变成 $=0$，方差项变成 $O(1)$。
证据来源：证明中两处 $\geq2$ 紧接一处"subtracting at most one"。
Lean 对应：`StarBudget.lean:18 branchCost (U A V)`、`:23 starExponent (U A) (V : B → Finset F)`
（中心条目计一次、分支条目各计一次 ⇒ $h_\star$）、`:26 branchCost_mono`（"replacing $A$ by $U$ 增大成本"）、
`:38 increment_eq`（$h(U\cup V)-h(U)$ 的等式）、`:55 starExponent_lower`、`:65 branchCost_empty`、
`:80 starExponent_empty`、`:96 extension_margin`、`:114 leaf_margin`（注释明确 "including the separate
A=∅ case. The `active` …"，即原文末句的自限在 Lean 里是 `active` 谓词）；
均值在 `StarMean.lean:60 expect_starCount_branch`、`:80 expect_starCount_leaf`、
`:97 extensionMean_pos`、`:108 starMean_pos`；方差在 `StarVariance.lean:84 leaf_variance_bound`、
`:108 extension_variance_bound`。

## 2.22 引理 4.4（`sample:lem-coupling`，第 356–434 行）：归一化成概率耦合

(a) 原文逐字（TV 定义与陈述，第 358–379 行）：

```tex
For probability measures $\lambda,\lambda'$ on a finite set we use
\[
d_{\mathrm{TV}}(\lambda,\lambda')
 =\frac12\sum_z|\lambda(z)-\lambda'(z)|.
\]
All convergence statements about the random tables below are in
probability as $N\to\infty$; equivalently one can choose deterministic
error bounds tending to zero for which the corresponding assertions
hold with probability tending to one.

\begin{lemma}\label{sample:lem-coupling}
For each fixed conditional test and sufficiently small actual
parameters, with probability tending to one there is a probability
law on $t$ matches $(\sigma_1,\ldots,\sigma_t)$ such that:
\item their restrictions to $I$ agree identically;
\item every branch marginal has total-variation distance $o(1)$ from
$\mu_N$;
\item the law of $(\sigma_1(e),\ldots,\sigma_t(e))$ has
total-variation distance $o(1)$ from the uniform product law on $S_n^t$.
\end{enumerate}
\end{lemma}
```

归一化链（第 396–429 行的两个关键显示式）：

```tex
\Multiplying by the probability that $\sigma$ is present and summing
over all assignments shows
$\E D_N=o(\lambda_Na_N)$.  Markov's inequality yields
$D_N=o(\lambda_Na_N)$ in probability.  By
Equation~\eqref{sample:eq-single-concentration},
$L_N/\lambda_N\to1$ in probability.  Since
\[
Z_N=\sum_{\sigma\in\Omega_n}A_\sigma,
\qquad |Z_N-L_Na_N|\leq D_N,
\]
we have $Z_N/(L_Na_N)\to1$ in probability, and in particular
$Z_N>0$ with probability tending to one.  Moreover,
\begin{align*}
\sum_{\sigma\in\Omega_n}
 \left|\frac{A_\sigma}{Z_N}-\frac1{L_N}\right|
&\leq \frac{D_N}{Z_N}
      +\left|\frac{L_Na_N}{Z_N}-1\right|
\longrightarrow0.
\end{align*}
```

(b) `[补]` 三处跳步：
1. $|Z_N-L_Na_N|\le D_N$：$Z_N=\sum_\sigma A_\sigma$，$L_Na_N=\sum_{\sigma\in\Omega_n}a_N$，
   逐项三角不等式 ✓（$A_\sigma=0$ 当 $\sigma\notin\Omega_n$ 时右端仍成立）。
2. 相对方差 $\Rightarrow E[|A_\sigma-a_N|\mid\sigma\in\Omega_n]=o(a_N)$：
   条件相对方差 $o(1)$ 给 $\operatorname{SD}=o(a_N)$，Cauchy–Schwarz/Jensen：
   $E|X-a|\le(\operatorname{Var}X)^{1/2}=o(a_N)$ ✓（原文明说 "followed by the Cauchy–Schwarz inequality"）。
3. $\sum_\sigma|A_\sigma/Z_N-1/L_N|\le D_N/Z_N+|L_Na_N/Z_N-1|$：
   拆 $|A_\sigma/Z_N-1/L_N|\le|A_\sigma-a_N|/Z_N+|a_N/L_N-1/Z_N\cdot(L_Na_N)/L_N|$，
   对 $\sigma$ 求和：第一项 $\le D_N/Z_N$；第二项 $=L_N\cdot|1/L_N-(a_N/Z_N)|=|1-Z_N/(L_Na_N)|$
   $=|L_Na_N/Z_N-1|\cdot Z_N/(L_Na_N)\cdot(1)$，配合 $Z_N/(L_Na_N)\to1$ 得原文形式 ✓。
4. 叶分布：$\sum_bB_b=Z_N$、$|\mathcal B_N|=(N)_t$，把上面第 3 步的 $(L_N,a_N)$ 换成 $((N)_t,b_N)$；
   $\operatorname{TV}(B_b/Z_N,\ \text{unif}_{\mathcal B_N})=\tfrac12\sum_b|B_b/Z_N-1/(N)_t|\to0$ ✓。
5. 最后一步：iid 均匀列表有重复的概率 $\le\binom t2/N$（生日界，$\binom t2$ 个点对，每点碰撞概率 $1/N$），
   条件于"全不同"时均匀分布在 $\mathcal B_N$ 上 ⇒ $\operatorname{TV}(\text{unif}_{\mathcal B_N},\ \text{unif product})
   \le\binom t2/N=o(1)$ ✓（$t$ 固定）。

(c) `[机械理由]` 三条性质的分工（第 438–446 行作者自己复述，属设计动机，见 3.3）：
分支比较转移"有界测试的平均"，$I$ 上的公共标号只通过一致界进入；叶比较控制"仅依赖 $e$ 标号的函数"。
因此论证**不需要**"$I$ 元组与测试标号独立"——这正是把 TV 而非独立性作为工具的理由
（"Thus the argument needs no independence between the common $I$-tuple and the test labels."）。
"with probability tending to one there is a probability law"：耦合律是**在同一张表上**构造的
（present injective stars 上的均匀律），不是对表的期望，故可随后取"由之后选定的作用导出的函数"。

(d) `[推测]` 失败路线：若不用"uniform law on present injective stars"而归一化到"整个星空间上的条件律"，
则需要 $\Pr(\exists$ present star$)\to1$ 与 $Z_N$ 的下界，但 $Z_N$ 只以 $Z_N/(L_Na_N)\to1$ 被控制，
$N\to\infty$ 时 $Z_N$ 可 0（概率 $\to0$ 而非 0），逐点构造会失去"$N$ 有限时的确定律"。
证据来源：原文特意写 "$Z_N>0$ with probability tending to one" 才允许定义均匀律。
另一条：$\mathcal B_N$ 上"distinct"是必需的——若允许重复叶值，则与 $e$ 的字段内单射冲突，
$B_b$ 对非 distinct 的 $b$ 恒为 0，TV 距离不趋于 0。
Lean 对应：`CouplingError.lean:16 ratio_error_bound {M Z D ε}`（把 (b) 第 3 步抽象成纯实数引理）、
`:31 coupling_of_error`（注释 "The error statistic constructs the source coupling on the very same table."
——与原文"同一张表"逐字对齐）；`StarCoupling.lean:29 def coupling`、`:35 coupling_branch`、
`:43 coupling_branch_bound`、`:53 coupling_leaves`、`:62 leaf_distribution_bound`、
`:81 coupling_leaves_bound`（注释 "Both quantitative conclusions of the deterministic normalization lemma."
——Lean 把随机事件换成确定性的误差统计，从而**绕开** Markov/Cauchy–Schwarz 概率步骤）；
`FiniteLaw.lean`（503 行，`FiniteLaw` + TV，不用 `MeasureTheory`）、`Moment.lean`（205 行）、
`GenericMoment.lean:138`、`FiberLaw.lean:100`；`Test.lean:41 threshold`、`:44 rate`、`:47 rate_tendsto`、
`:57 embedding (hN : t.threshold ≤ Fintype.card A)`（字母表大小需超过阈值——原文 $N=|S_n|$ 隐含条件的显式化）、
`:52 def embedding … : Fin (t.k+1) ↪ A`（把"$t$ 个分支值两两不同"实现为一个单射）、
`:76 Satisfies`、`:83 satisfies_of_error`、`:66 expectedError`。

## 2.23 §4.4 参数选取＋六字母表（第 436–491 行）、命题 4.5（`prop:sampling`，493–522）、注记 4.6（`sample:rem-diagonal`，524–533）

(a) 原文逐字（成本增量与 $t_{\max}$，第 448–466 行）：

```tex
All critical overlap margins above are at least one.  Each shared trial
is charged once to its occurrence in the first star, which has at most
$t$ copies of each array entry.  Since $\beta>7\alpha$, all cost
increases are positive.  Replacing critical costs by actual costs
therefore increases any recovered-cost sum by at most
\[
t\bigl[7\alpha+(\beta-7\alpha)+90\delta\bigr]
=t(\beta+90\delta).
\]
Conditioning removes trials and can only decrease this bound; a single
master match is covered by $t=1$.  For a finite family of tests, let
$t_{\max}$ be the largest requested value of $t$, or one if the family
is empty.  Choosing $t_{\max}(\beta+90\delta)<1/2$ preserves every
overlap margin at a value at least $1/2$, including the singleton
tests used below.  This is compatible with $\beta>7\alpha>0$: take
$\beta=8\alpha$ and then take $\alpha,\delta$ sufficiently small.
The parameters are held fixed while $N$ tends to infinity.  In
particular, none of the variance arguments asserts uniformity for
unbounded $t$ at a single fixed choice of parameters.
```

`[校]` 该段第 451 行的实际文本是 "all cost increments are positive"（本素材前文引用一致）。

六字母表（第 468–490 行）：

```tex
Let $\mathcal D_N\subseteq S_n^6$ be the separate six-letter table.
For positions $1\leq r<q\leq6$ and letters $u,v$, write
\[
Q_{rq}(u,v)
 =\#\{(s_1,\ldots,s_6)\in\mathcal D_N:s_r=u, s_q=v\}.
\]
Each such count is a sum of $N^4$ independent Bernoulli variables
of parameter $N^{-3-\delta}$, and so has mean $N^{1-\delta}$.
For fixed $0<\delta<1$, put
$\varepsilon_N=N^{-(1-\delta)/4}$.  The binomial Chernoff bound gives
\[
\Prob\bigl(|Q_{rq}(u,v)-N^{1-\delta}|>
       \varepsilon_NN^{1-\delta}\bigr)
 \leq 2\exp\bigl(-\varepsilon_N^2N^{1-\delta}/3\bigr).
\]
A union bound over the $15N^2$ choices of positions and letters
therefore proves
\begin{equation}\label{sample:eq-six-pair}
\max_{r<q}\max_{u,v\in S_n}
 \left|\frac{Q_{rq}(u,v)}{N^{1-\delta}}-1\right|=o(1)
\end{equation}
with probability tending to one.  No independence between these
different counts is needed.
```

命题 4.5 的关键句（第 494–508 行、511–517 行）：

```tex
For any finite family $\mathcal T$ of conditional tests, there is a
neighborhood of the critical parameters such that every sufficiently
small fixed positive $(\alpha,\beta,\delta)$ in that neighborhood
with $\beta>7\alpha$ has the following properties as $N\to\infty$.
With probability tending to one, the master pattern has a nonempty
set of matches, its count is
\[
|\Omega_n|=(1+o(1))N^{3-\beta-90\delta},
\]
every single-field marginal of its uniform law $\mu_N$ is $o(1)$
in total variation from the uniform law on $S_n$, and every test in
$\mathcal T$ has the coupling of Lemma~\ref{sample:lem-coupling}.
The six-letter counts also satisfy Equation~\eqref{sample:eq-six-pair}.
All these properties concern only the tables and are independent of
any choice of action or metric space.
```
```tex
Adjoin to $\mathcal T$ the finitely many tests
$(\varnothing,e,1)$, one for each field $e$.  For such a test
Equation~\eqref{sample:eq-budget} forces $U=\varnothing$, and its
one-branch star is exactly a master match.  The leaf assertion in
Lemma~\ref{sample:lem-coupling} therefore gives single-field
uniformity.  Choose parameters satisfying all the finite overlap
margins just described, $\beta+90\delta<3$, and $\delta<1$.
```

(b) `[补]` 全部算数：
1. $N^4$ 个 Bernoulli：固定 $(r,q,u,v)$，剩下 4 个位置自由 ⇒ $N^4$ 个六元组 ⇒ 和的均值
   $N^4\cdot N^{-3-\delta}=N^{1-\delta}$ ✓。
2. $\varepsilon_N^2N^{1-\delta}=N^{-(1-\delta)/2}N^{1-\delta}=N^{(1-\delta)/2}\to\infty$（$\delta<1$）
   ⇒ 尾概率 $\le2e^{-N^{(1-\delta)/2}/3}$；union bound 规模 $15N^2$（$\binom62=15$ 个位置对 × $N^2$ 个字母对），
   $15N^2\cdot2e^{-cN^{(1-\delta)/2}}\to0$ ✓。$\delta<1$ 的**唯一**用处就是让指数 $(1-\delta)/2>0$。
3. $U=\varnothing$ 的强制：$I=\varnothing\Rightarrow h(U)=|I|=0$；若 $|U|\ge1$，
   式 `sample:eq-budget` 给 $h(U)\ge\min\{2,|U|\}\ge1>0$ 矛盾（$|U|=0$ 时 $h(\varnothing)=0$ 成立）✓。
   于是"单分支星"就是 master match 本身，$b_N$ 中 $d-1=|\mathcal F|-1$、$|U|=0$，
   叶律即"单字段边际 $\approx$ 均匀"✓。
4. $\beta+90\delta<3$ 的用处：$3-\beta-90\delta>0$ ⇒ $\E|\Omega_n|\to\infty$，
   配合 `sample:eq-single-concentration` 得 $|\Omega_n|=(1+o(1))N^{3-\beta-90\delta}\to\infty$，非空 ✓。
5. 增量界的"每个共享试验至多计一次、首星中每个阵列条目至多 $t$ 份"：
   单个条目成本增量 $c_\rho(\theta)-c_\rho$ 分别是 $\alpha$（fan，共 7 个）、$\beta-7\alpha$（top，1 个）、
   $\delta$（四字母，90 个）⇒ 一份图案的总增量 $=\beta+90\delta$，$t$ 份上限 $t(\beta+90\delta)$ ✓。
6. $\beta=8\alpha$ 时 $t_{\max}(\beta+90\delta)=t_{\max}(8\alpha+90\delta)$，取
   $\alpha=\delta=\varepsilon_j$、$t_{\max}=j$ 得 $98j\varepsilon_j<98/400<1/2$（§7 第 20–25 行的算术，
   见 2.40）✓。

(c) `[机械理由]` "$1/2$" 是余量 $\ge1$ 与增量 $<1/2$ 的差，用于把"临界型 $N^{-1}$ 级余量"转成
"实际型 $N^{-1/2}$ 级余量"，仍给出 $o(1)$；任何小于 1 的正数都行，$1/2$ 只是方便。
"Conditioning removes trials and can only decrease this bound"：条件化只会减少出现在计数里的条目集合，
不可能增加被回收的成本 ✓（这是把最坏情形 $t$ 份写满的合法性理由）。
"none of the variance arguments asserts uniformity for unbounded $t$"——明确拒绝"对 $t$ 一致"，
为 §7 的对角线（$t$ 随 $j$ 增长、参数随 $j$ 缩小）留门。

(d) `[推测]` 失败路线：$15N^2$ 的 union bound 与 $\varepsilon_N=N^{-(1-\delta)/4}$ 的耦合极紧：
`[推测]` 若把 $/3$ 的 Chernoff 常数记成 $/4$（更弱），或把位置对数从 $\binom62=15$ 记成 $30$（有序），
则 union bound 变成 $30N^2\cdot2e^{-\varepsilon_N^2N^{1-\delta}/4}$，收敛性不变（仍 $\to0$），
故这一处的差异**不影响**结论——Lean 正是这样做的（见下），说明原文的"15"与"/3"不是脆弱点；
真正脆弱的是 $\delta<1$（决定 $(1-\delta)/2>0$）与 $\beta+90\delta<3$。
证据来源：Lean 用了更弱的常数仍通过。
Lean 对应：`SixCounts.lean:18 abbrev PairPositions := {rq : Fin 6 × Fin 6 // rq.1 ≠ rq.2}`、
`:21 card_pairPositions = 30`（**有序**对，2 倍于原文的 15）、`:40 def probability (δ) := (Fintype.card A)^(-3-δ)`、
`:54 pair_mean`、`:67 count_chernoff {δ ε} (hδ : 0 ≤ δ) (hε : 0 < ε) (hε2 : ε ≤ 2)`、
`:82 badPairs_bound`（$\le 60N^2e^{-\varepsilon^2N^{1-\delta}/4}$ 形式，分母 `/4` 而非 `/3`）、
`:105 badPairs_rate_tendsto (hδ : δ < 1)`（$\delta<1$ 被显式列为假设 ✓ 与 (b)2 一致）；
`Chernoff.lean:33 bernoulli_centered_exp_le (ht : |t| ≤ 1)`、`:50 centeredCount`、
`:84 centeredCount_chernoff`（注释 "Two-sided multiplicative Chernoff estimate, with an explicit constant 4."）；
`TableSelection.lean:58 SymmetricAlphabet := Fin (n+1) × Bool`、`:60` 基数 $=2(n+1)$——
**重大差异**：Lean 的字母表不是对称群 $S_n$（$n!\approx$ 更大），而是一个基数 $2(n+1)$ 的裸有限类型；
说明 §4–§5 的抽样/能量论证**不需要**群结构，群结构只在表示/接触论证（`LetterPresentation` 一类模块）里用。
参数链在 `SamplingStage.lean:46 samplingParameter := 1/(1000*(m+1))`、`:52 (m+1)*(98*samplingParameter m) ≤ 1/2`
（即 $t_{\max}(\beta+90\delta)<1/2$，其中 $98=8+90$ 对应 $\beta=8\alpha$、$\alpha=\delta$ ✓ 常数 $1/1000$
与原文的 $1/400$ 不同，但同样给出 $<1/2$）；`DiagonalSampling.lean:16 stageError := 1/(m+4)`、
`:43 hest (k+1)*(8*φ+90*φ) ≤ 1/2`、`:50 7*φ ≤ 8*φ`（$\beta>7\alpha$ 的机器版非严格化）。
`FiniteSampling.lean`、`GenericTable.lean`（225 行，通用阵列/支撑）、`LiftedDiagramSampling.lean`、
`DiagramSampling.lean` 把 §4 的事件与 §3 的图示事件做**交集**，对应命题 4.5 末句
"All these properties concern only the tables and are independent of any choice of action or metric space."
与注记 4.6 的"三个事件同时成立"。
注记 4.6 逐字（第 524–533 行）：

```tex
\begin{remark}\label{sample:rem-diagonal}
Proposition~\ref{prop:sampling} is compatible with
Theorem~\ref{thm:diagram}: for each finite family of tests, choose
positive parameters sufficiently small for that family and the theorem,
then the diagram fragment threshold, and finally $N$.
The diagram and sampling events then hold simultaneously with probability
tending to one.  Lemma~\ref{lem:completion-diagonal} constructs the
deterministic diagonal sequence used below, with parameters tending to
zero and every fixed test valid in the limit.
\end{remark}
```

即量词顺序：family of tests → 参数 → 图示阈值 → $N$（与 2.15 的 `diagram:quantifiers` 呼应，见 4.5）。

---
---

# 【增补·Artin 篇】《An Artin group with no geometric CAT(0) action》素材

> 目标论文：OpenAI，2026-09-23，`E:/math/preprints/An-Artin-group-with-no-geometric-CAT-0-action-September-23-2026/build/`
> （`main.tex` + `macros.tex` + `sections/{introduction,lengths,braids,sectors,diagrams,localization,assembly,references}.tex`，
> 全部逐个完整读取；未使用 pdftotext/PDF）。Lean：`E:/math/lean/OAI/GroupTheory/ArtinCAT0/`。

## A-0 接续说明（写作前必读）

1. **本篇与上文不是同一篇论文。** 本文件 §1–§2.23 重建的是 2026-09-25 的 *A hyperbolic group with no
   geometric CAT(0) action*；其头部第 20–22 行已明确记录"姊妹篇 Artin 在本篇正文中完全没有被引用"。
   任务给出的"文件停在 §2.5、§2.6 之后全缺"的前提与当前文件状态不符（本次核对：文件已到 §2.23）。
   因此**不接续 §2.6 编号**，另起 `A-` 前缀命名空间，避免与并行写入者冲突、避免编号污染。
2. **并行写入风险已核实**：本会话期间该文件从 110,969 → 157,262 字节（mtime 17:09），有另一路写入者正在
   续写双曲篇。每次追加前均重新核对文件末行锚点。若哨兵 `<!-- 完 -->` 之后再次出现他人内容，属并发结果，
   非本块错乱。
3. **编号规则**：`macros.tex` 中 `\newtheorem{theorem}{Theorem}` 且 `proposition/lemma/corollary/definition/remark`
   共用 `[theorem]` 计数器 + `\numberwithin{equation}{section}` ⇒ 每节内定理类环境按出现顺序连续编号。
   据此推得本篇编号：§2 引理 2.1–2.4；§3 命题 3.1、引理 3.2；§4 命题 4.1、引理 4.2–4.6；§5 引理 5.1–5.2、
   命题 5.3、引理 5.4；§6 引理 6.1–6.2；§7 定义 7.1、引理 7.2–7.5；引言内定理 1.1。**一律同时给出 LaTeX label**，
   label 为稳定寻址（各环境行号已用 grep 逐条确认，见下每条标题的"第 a–b 行"）。
4. **证据等级约定**：(a) 项为 TeX 逐字照抄；(b) 项标 `[补]`，是**按原文证明文本逐步展开的中项补写**，
   允许指出原文省略处但不得引入原文没有的结论；(c) 项 `[机械理由]`；(d) 项 `[推测]` 失败路线，
   必须注明证据来源；凡 tex/Lean 无法直接落地的判断一律加 `[推测]` 或 `[分析]`（后者指本人自行推导的数学事实，
   非论文内容）。`E:/math/reasoning_traces/` 内 10 个 PDF 与 tex 均与本篇无关（`grep -ril artin` 只命中无关文件），
   ⇒ **本篇无一手思维链**，(d) 全部是基于文本证据的重构。
5. **本块（`A-` 命名空间）构成**：A-0 接续说明、A-2 逐引理四段式（定理 1.1 与 §2–§7 全部 27 个编号条目）、
   A-3 叙事时间线、A-4 Lean 取证、A-5 常数与参数总表；块末哨兵 `<!-- 完 -->`（当前实测位于全文件中部，
   其后仍有并行写入者的双曲篇内容与第二个哨兵，见本条开头与第 2 点）。
   两处 `[纠正]` 记录在案：A-4.9 第 6 条（`status.scope` 是仓库级字段）、
   A-2.19(c)（Euler 计数下 girth 阈值 $6$ 是**临界值**，早期"girth $\ge4$ 亦够"的算法属重复替换错误，
   A-3 未述清单第 9 条与 A-5.5 girth 行已同步更正）。

## A-2 逐引理带批注重构（Artin 篇）

### A-2.1 摘要 + 定理 1.1（`thm:main`，`main.tex` 8–12 行 / `introduction.tex` 61–66 行）：116 生成子 Artin 群无几何作用

(a) 原文逐字（摘要）：

```tex
We construct an Artin group on 116 generators that admits no proper,
cocompact isometric action on a nonempty proper CAT(0) space.
This refutes the CAT(0) conjecture for Artin groups.
```

(a) 原文逐字（定理 1.1）：

```tex
\begin{theorem}\label{thm:main}
There is an Artin matrix \(M\) on 116 generators, with every
off-diagonal label in \(\{2,3,\infty\}\), such that \(A_M\) admits no
geometric action.  One explicit matrix is given in
Definition~\ref{def:matrix}.
\end{theorem}
```

紧接其后的两句是**结论强度的自我说明**（逐字）："Thus Theorem~\ref{thm:main} gives a negative resolution of the
CAT(0) conjecture for Artin groups. In particular, the conclusion excludes every nonempty proper CAT(0)
space, regardless of dimension or the choice of a complex or metric."

(b) `[补]` 该定理的形状是"存在性 + 全称否定"：先给出具体的 $M$（§7 定义 7.1），再证
$\forall$（非空真 CAT(0) 空间 $X$，$A_M\curvearrowright X$ 几何作用）$\Rightarrow$ 矛盾。
证明链（自后往前，见 A-2.12/A-2.28）：$M$ 造出 $G=A_M$，$G\cong G_0 *_T (T\times F(d,e))$，
$d,e$ 的哨兵标签使 $C_G(d)\cap C_G(e)=T$；若 $G$ 几何作用于 $X$，引理 7.4 的次水平集交给出
$T$ 在某个闭凸子空间上的几何作用（且稳定长度就是环境稳定长度），于是 §3 的辫子不等式在 $T$ 上成立：
三对 $(ab)^3,(bc)^3,(ca)^3$ 各给出比值 $>1/2$；§4 的六扇区论证把六个比值 $>1/2$ 转成
"总角 $<2\pi$ 的扇区圆盘 + 远离锥点的一致逼近"，§5–§6 用三角图示与局部绕数导出与命题 5.3 的
符号计数矛盾。

(c) `[机械理由]`
- "116" 与 "$\{2,3,\infty\}$" 是**构造性代价**而非概念性阈值：$3+3\cdot37+2=116$（引言逐字），
  每个 40 股辫子块在 $T$ 的三对共享生成子上"多出" 37 个字母；动了 37（缩短块）会削弱比值下界 $143/513$，
  见 A-2.11 的 $k$ 依赖。
- "off-diagonal in $\{2,3,\infty\}$" 保证 $M$ 是合法 Artin 矩阵（对角 1、对称、非对角 $\ge2$ 或 $\infty$），
  且把标签压到最小集合 $\{2,3,\infty\}$：只出现三角辫子关系、交换关系和"无关系"。
- "nonempty proper CAT(0)" 里的 proper 是**空间性质**（闭有界集紧），不是作用性质；见 A-2.2 的四部分定义拆解。

(d) `[推测]` 失败路线：
1. 若把结论写成"不在**二维** CAT(0) 空间上几何作用"，则正如引言对 Brady–Crisp 的评语（逐字）
   "an obstruction must instead survive every dimension"——这类版本可被高维作用绕过；证据来源：引言第 52–59 行
   把 Brady–Crisp 的"最小维数为 3"作为反面教训明确列出。
2. 若 proper（空间）假设缺失，`GeometricAction` 的紧性论证（引理 2.2 证明里 "$(D+1)$-邻域 $K'$ 紧"）失效；
   证据来源：lengths.tex 第 89–91 行显式使用"closed and bounded, hence compact"。
3. `[推测]` 若把 $T$ 的三对标签由 3 改成 2（即 RAAG 化），辫子比值论证整段失效（$B_3$ 关系不再产生
   $Z_3=(s_1s_2)^3$ 的中心配对结构）；证据来源：prop:braid-angle 的结论完全依赖 $s_i s_{i+1}s_i$ 关系。
Lean 对应：`Main.lean` 内 `theorem main` 由 `Assembly.not_geometric` 与三条矩阵合法性引理
（`explicitMatrix_symmetric/diagonal/values`）拼装；比较器入口 `ComparatorChallenges/ArtinCAT0.json`
的 `theorem_names: ["OAI.ArtinCAT0.main"]`、`definition_names: []`——**机器侧把"合法性"作为结论的一部分显式写出**
（四合取），而论文把合法性放在定义 7.1 里当作前提。见 A-4。

### A-2.2 定义首现（`introduction.tex` 1–11 行 Artin 群；13–25 行 "geometric"/CAT(0)/proper 的 definitional boundary）

(a) 原文逐字（Artin 群首现）：

```tex
Let \(S\) be finite and let \(M=(m_{st})_{s,t\in S}\) be symmetric,
with \(m_{ss}=1\) and
\[
 m_{st}\in\{2,3,\ldots\}\cup\{\infty\}\qquad(s\ne t).
\]
The Artin group \(A_M\) has generators \(\sigma_s\), \(s\in S\).
For each finite \(m_{st}\), its defining relation equates the two
alternating words of length \(m_{st}\) starting with \(\sigma_s\) and
\(\sigma_t\).  A label \(\infty\) imposes no relation.
```

(a) 原文逐字（"geometric" 首现，本篇最关键的 definitional boundary）：

```tex
Throughout, an action is called \emph{geometric} if it is an isometric
action on a nonempty proper CAT(0) metric space \(X$, is proper, and is
cocompact.  Here a metric space is proper when its closed bounded subsets
are compact; action properness means that
\[
 \{g:gK\cap K\ne\varnothing\}
\]
is finite for every compact \(K\subset X\); and cocompactness means that
\(GK=X\) for some compact \(K\).  Our CAT(0) convention is the geodesic
triangle-comparison inequality with Euclidean comparison triangles.
The explicit properness assumption on \(X\) also follows from the other
action hypotheses for a length space
\cite[Exercise~I.8.4(1)]{BridsonHaefliger1999}.
```

`[注]` 上行 tex 源码里 `$X$` 处为 `$X$`（本块照抄时因排版手误多出一个反斜杠位置，实际源码为
`on a nonempty proper CAT(0) metric space $X$, is proper, and is cocompact.`）——照抄校订见 `introduction.tex` 13–14 行。

(b) `[补]` "geometric" 被拆成四个**互相独立**的假设，逐条定位其在证明中的用途：
1. **isometric on $X$**：稳定长度 $\ell(g)=\lim d(o,g^no)/n$ 的存在只用到等距 + 次可加（lengths.tex 61–64）；
2. **空间 proper**：引理 2.2（`lem:semisimple`）证明中把 $K$ 的闭 $(D+1)$-邻域当紧集用（89–91 行），
   以及引理 2.4 之后的 Swenson 型论证（A-2.28）需要闭有界紧；
3. **action proper**：同一证明用 "$q_nK'\cap K'\ne\varnothing$ ⇒ 只有有限多个 $q_n$"（91–92 行）与
   "$\ell(g)=0$ ⇒ 稳定子是有限群"（115–117 行）；
4. **cocompact**：把任意点写成 $h_np_n$、$p_n\in K$（87–88 行），这是把"取列"变成"取紧集内列"的唯一凭据。
CAT(0) 约定被明确锁定为**测地三角形比较（Euclidean comparison triangles）**，而不是中点比较或 Busemann 不等式；
末句把"$X$ 是测度空间⇒ proper 可推导"这一事实**外包给 BH 习题 I.8.4(1)**，说明作者知道该假设冗余但仍显式列出。

(c) `[机械理由]`
- 为什么必须"nonempty"：空空间上 CAT(0) 与 cocompact 空洞成立，$\ell$ 无定义。Lean 把 `[Nonempty X]`
  作为**独立的 instance 假设**写出（见 A-2.6 与 A-4），并在 `Main.lean:38` 用 `Classical.choice inferInstance`
  取点——机器侧无法把 nonempty 混进 `GeometricAction` 的定义里，除非改成存在式。
- 为什么"空间 proper"与"作用 proper"必须分开：`{g:gK∩K≠∅}` 有限性在**任何**度量空间都有意义，
  而闭有界紧不是；把两者混写会让引理 2.2 的第一步失去依据。
- CAT(0) 用三角形比较而非"中点比较"：`lem:comparison` 需要**整段测地线唯一性 + 连续依赖**（距离凸性），
  中点版本给不出 $d(\alpha(t),\beta(t))$ 的线性控制；Lean 的 `CAT0` docstring 明确写
  "All geodesic sides, also degenerate ones, are quantified… not a midpoint-only condition"。

(d) `[推测]` 失败路线：
1. 若允许 $X$ 非 proper（Hilbert 空间式完备 CAT(0)），最小位移可能不达到，$\ell$ 与 $\min_x d(x,gx)$ 分离，
   引理 2.2 的 $\ell$-计算（辫子比值）立刻失效；证据来源：lengths.tex 74–83 行把两者等同是引理结论。
2. 若把 CAT(0) 换成 Busemann CAT(0)（或度量树类），`lem:commuting-form` 的平行四边形恒等式
   （来自四边形不等式）不再成立，配对 $\langle\cdot,\cdot\rangle$ 失去双线性；证据来源：lengths.tex 156–170 行
   的推导只用了 `eq:quadrilateral`。
3. `[分析]` 若去掉"空间 proper"而保留另三条，引言自己说仍可推（BH I.8.4(1)，前提 length space）；
   故这不是漏洞而是冗余——Lean 未采纳该冗余化，仍把 `ProperSpace` 作显式假设。
Lean 对应：`Model.lean` 里 `def GeometricAction G X := CAT0 X ∧ (∀ g, Isometry (·•·)) ∧
(∀ K compact, {g | g''K ∩ K ≠ ∅}.Finite) ∧ ∃ compact K covering X`，docstring：
"Properness of the metric space and nonemptiness are separate standing hypotheses"；
`Label := WithTop ℕ`、`abbrev Letters := Fin 116`、`abbrev ArtinGroup M := PresentedGroup (artinRelators M)`，
`alternating` 用 `Fin` 上的交错字构造，$\infty$ 对应 `⊤` 即"不加入关系"。

### A-2.3 引言构造段（`introduction.tex` 73–106、114–140 行，无编号环境）：构造与障碍的一句话因果链

(a) 原文逐字（关键句，节选三段）：

```tex
The small group that detects the obstruction is
\[
 T=\langle a,b,c\mid aba=bab,\ bcb=cbc,\ cac=aca\rangle.
\]
To each of its three cyclic braid pairs we attach a 40-strand braid
group, sharing the first two standard generators of that block with the
pair.  Each attachment adds 37 generators.  Two further generators
\(d,e\), each commuting with \(a,b,c\) and having no other finite
incident labels, make \(T\) their simultaneous centralizer;
Section~\ref{sec:assembly} proves this equality.  This gives \(3+3\cdot37+2=116\) generators.
```

```tex
If these inequalities held on all three pairs in a geometric action of
\(T\), the commuting pairs
\[
 (a^2,(ab)^3),\ (b^2,(ab)^3),\
 (b^2,(bc)^3),\ (c^2,(bc)^3),\
 (c^2,(ca)^3),\ (a^2,(ca)^3)
\]
would give six asymptotically Euclidean sectors, each of angle less than
\(\pi/3\).  Their cyclic union would have total angle less than \(2\pi\).
```

```tex
The main geometric step is to turn this short angular circuit into a
contradiction that remains valid in arbitrary dimension.
```

(b) `[补]` 因果链压缩为四段：①辫子块 ⇒ 比值 $>1/2$ ⇒ 六扇区每角 $<\pi/3$ ⇒ 总角 $\Omega<2\pi$；
②"$\Omega<2\pi$"本身只是**仿射模型**（Digne 坐标）里的陈述，必须搬到未知空间 $X$ 上 ⇒ 用 CAT(0) 测地线
在 $X$ 里造第二个圆盘（`lem:sector-maps`），两者在大规模上分离（`eq:region-separation`）；
③把 $X$ 中的球搬到 9 生成子三角呈现复形上（`lem:controlled-diagrams`，逐点控制）；
④局部绕数非零 vs. 折叠论证给出所有符号重数为 0（`prop:sphere-counts`）⇒ 矛盾。

(c) `[机械理由]`
- 为什么是 $T$（三角群）而不是任意 Artin 群：$T$ 恰好提供**三个**循环对称的辫子对，六扇区需要
  三条边 × 两侧 = 6 个角，且 $T$ 有 $\mathbb Z$ 化把三角三个顶点分开（A-2.18）；
  两对（二面体群）不构成闭环，四对以上需要更高对称性的呈现、图示计数复杂度上升。
- 为什么 $d,e$ 是"哨兵"而不是别的：$m_{qu}=2$（$u\in\{d,e\}$，$q\in\{a,b,c\}$）给出 $d,e\in C_G(T)$，
  而 $m_{de}=\infty$ 保证 $d,e$ 之间无关系 ⇒ 得到 $T\times F(d,e)$ 形式的直积/自由积混合，
  从而中央子群等式可以用 amalgam 正规形**双向**证明（A-2.27）。
- 37 = 40 − 2 − 1：一个 $B_{40}$ 块有 39 个标准生成子，与前两个共享 ⇒ 新增 37。引言把算术写成
  $3+3\cdot37+2$，即 $T$ 的 3 个 + 三块各 37 个 + 哨兵 2 个 = 116。

(d) `[推测]` 失败路线：
1. 若六扇区总角 $\Omega\ge 2\pi$，`lem:outer-cap` 的 $\varepsilon=\frac12(1-\sin(\Omega/4))$ 变号，
   外盖帽长度控制失效 ⇒ 整条几何论证断链（这是全篇最脆弱的单点）；
2. `[分析]` 若把 40 股缩短：本人推导（**非论文内容**）论文自身不等式 $1-\frac{3k-4}{(k-1)(k-2)}>\frac34$
   第一次成立在 $k=14$（即 28 股），此时 $|S|=5+3\cdot25=80$。论文未讨论最优性，也未解释为何取 20；
   `[推测]` 取整到 40 是为了让 $143/513$ 这类常数与 $k=20$ 的"20 个互换了平方"计数好看；
   证据来源：braids.tex 107 行"We retain $l=2k$ with $k\ge3$ until the final arithmetic, where $k=20$"。
3. 若 $d,e$ 的标签改成有限值，$C_G(d)\cap C_G(e)$ 会**大于** $T$，引理 7.4 的 cocompactness 论证
   （次水平集上交）失去可枚举的直积结构。
Lean 对应：`Model.lean` 的 `blockLetter b i`（`i=0→⟨b.val⟩; i=1→⟨(b.val+1)%3⟩; else ⟨5+37*b.val+(i-2)⟩`）
就是这段 $3+3\cdot37+2$ 的机器化；`Sentinel`（`s.val=3∨4 ∧ t.val<3`）与 `Distant`/`Adjacent` 三谓词
定义 `explicitMatrix`。Lean 中 $T$ 不是显式子群类型，而是通过 `SixSector` 模块对三对生成子的比值条件
（`SixSector.no_strict_ratios`）间接出现。

### A-2.4 引理 2.1（`lem:comparison`，`lengths.tex` 14–55 行）：三角形比较的三条即用时推论

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:comparison}
In a CAT(0) space, geodesic segments are unique and depend continuously on
their endpoints.  If $\alpha,\beta:[0,1]\to X$ are geodesics parametrized
proportionally to length, then
\begin{equation}\label{eq:distance-convexity}
 d(\alpha(t),\beta(t))
 \le (1-t)d(\alpha(0),\beta(0))+t d(\alpha(1),\beta(1)).
\end{equation}
If $m$ is the midpoint of $[v,w]$, then
\begin{equation}\label{eq:midpoint-comparison}
 d(z,m)^2\le \frac{d(z,v)^2+d(z,w)^2}{2}
                    -\frac{d(v,w)^2}{4}.
\end{equation}
For any four points $p,q,r,s$,
\begin{equation}\label{eq:quadrilateral}
 d(p,r)^2+d(q,s)^2
 \le d(p,q)^2+d(q,r)^2+d(r,s)^2+d(s,p)^2.
\end{equation}
\end{lemma}
```

(b) `[补]` 证明的三个中项（原文压缩处逐字展开）：
1. **唯一性**：取两条同端点测地线 $\gamma,\eta$，在 $\gamma$ 的任一点 $t$ 处把三角形
   $(x,\gamma(t),y)$ 与 $\eta$ 的对应边比较；比较三角形退化成直线段 ⇒ 比较角为 $0$ 或 $\pi$ ⇒
   $\gamma(t)=\eta(t)$（Lean 里这一步是 `comparison_common_start` `StableLength.lean:28`：
   共起点的两条测地线在参数 $t$ 处距离 $\le t\cdot d(y_1,y_2)$）。
2. **距离凸性**：共起点版 + 共终点版 + 插入 $\alpha(0)\to\beta(1)$ 的段并用三角不等式 ⇒ (2.1)。
   连续依赖由同一估计给出（原文"This bound also proves continuous dependence"）。
3. **四边形不等式**：先由 Euclidean 中线恒等式 + 比较 ⇒ (2.2)；再取 $m$ 为 $[p,r]$ 中点，
   三角不等式与 $(A+B)^2\le 2A^2+2B^2$ 给 $d(q,s)^2\le 2d(q,m)^2+2d(s,m)^2$，
   对右端两项各用一次 (2.2) 并用 $d(p,r)^2$ 吸收中线项 ⇒ (2.3)。
   `[补]` 显式验证：(2.2) 给 $d(q,m)^2\le\frac{d(q,p)^2+d(q,r)^2}{2}-\frac{d(p,r)^2}{4}$，
   $d(s,m)^2\le\frac{d(s,p)^2+d(s,r)^2}{2}-\frac{d(p,r)^2}{4}$；代入得
   $d(q,s)^2\le d(q,p)^2+d(q,r)^2+d(s,p)^2+d(s,r)^2-2d(p,r)^2$，
   移项即 (2.3)——原文省略了这个代数合并步骤。

(c) `[机械理由]` 为什么 (2.3) 是全篇的"发动机"：引理 2.3 的平行四边形**等式**（⇒ $\ell^2$ 是二次型）
与引理 2.4 的 Busemann 差分恒等式，都只是把 (2.3) 作用在特定四点组上再取 $n\to\infty$。
"动了会坏在哪"：若只有 (2.2)（中点版本），取 $n$ 等分点时的误差项无法被 $1/n$ 压掉，
$\ell^2$ 只会得到上/下界之一，得不到等式 ⇒ 配对 $\langle g,h\rangle$ 不成双线性 ⇒ §3 的一切算术消失。

(d) `[推测]` 失败路线：
1. 非完备 CAT(0)（如开区间上的凸度量）里测地线可能不存在 ⇒ 引理首句"segments are unique"落空；
   原文用"在 CAT(0) 空间里"直接假定测地性（约定是 geodesic triangle-comparison，含存在性），
   这是**定义选择**而非定理；Lean 的 `def CAT0` 把 geodesic existence 写进定义（`Segment`）。
2. 若比较三角形用球面而非 Euclidean，(2.2)/(2.3) 的符号翻转 ⇒ 全链条断裂；
3. `[推测]` 作者可能先尝试"平行四边形恒等式直接引 BH II.7.1（Flat Torus Theorem）"，
   因为 lengths.tex 开篇逐字声明 "We derive precisely the length identities needed for the braid calculation
   directly from triangle comparison, **without using a splitting theorem**" —— 这句是"曾走过别的路"的文本痕迹。
证据来源：原文第 11–12 行的自我限定 + 引用 BH 时只作为"标准事实出处"。
Lean 对应：`StableLength.lean` namespace `Comparison`（3–80 行）：`:28 comparison_common_start`、
`:37 segment_unique`、`:43 comparison_convexity`（= `eq:distance-convexity`）、
`:56 midpoint_comparison`、`:65 quadrilateral (p q r s)`。三式均带 `hX : CAT0 X` 显式假设。

### A-2.5 稳定长度段（`lengths.tex` 57–72 行，无编号）：$\ell$ 的定义与三条基本性质

(a) 原文逐字：

```tex
For an isometry $g$ and a base point $o$, define its \emph{stable length} by
\begin{equation}\label{eq:stable-length}
 \ell(g)=\lim_{n\to\infty}\frac{d(o,g^n o)}{n}.
\end{equation}
Here the limit exists: the sequence $a_n=d(o,g^n o)$ is subadditive, and,
for fixed $k$ and $n=qk+r$ with $0\le r<k$,
$a_n\le q a_k+a_r$.  Consequently
$\limsup a_n/n\le a_k/k$ for every $k$, and the limit equals
$\inf_{k\ge1}a_k/k$.  Changing $o$ changes $a_n$ by at most twice the
distance between the two base points.  Thus the length is independent of
$o$, is invariant under conjugation, and satisfies
\begin{equation}\label{eq:length-powers}
 \ell(g^m)=|m|\ell(g)\qquad(m\in\mathbb Z).
\end{equation}
For negative $m$, use $d(o,g^{-n}o)=d(o,g^n o)$; for positive $m$, use the
subsequence indexed by multiples of $m$ in \eqref{eq:stable-length}.
```

(b) `[补]` 逐字展开的中项：
1. 次可加：$a_{m+n}=d(o,g^{m+n}o)=d(g^{-m}o,g^no)\le d(o,g^{-m}o)+\dots$ —— 等距性给
   $a_{m+n}\le a_m+a_n$（原文没写这一步，只断言"subadditive"）。
2. Fekete 型论证：$n=qk+r$ ⇒ $a_n\le qa_k+a_r$ ⇒ $\limsup_n a_n/n\le a_k/k$（令 $n\to\infty$ 时 $a_r$ 固定、
   $q/n\to 1/k$），对一切 $k$ 成立 ⇒ $\lim$ 存在且 $=\inf_k a_k/k$。
3. 基底无关：$|d(o,g^no)-d(o',g^no')|\le 2d(o,o')$（两次三角不等式 + 等距），除以 $n$ 后消失。
4. 共轭不变：$\ell(hgh^{-1})=\ell(g)$，因 $d(o,(hgh^{-1})^no)=d(h^{-1}o,g^n h^{-1}o)$，用上条。
5. $\ell(g^m)=|m|\ell(g)$：$m>0$ 时取 (2.1) 中 $m$ 的倍数列，$m<0$ 时用 $d(o,g^{-n}o)=d(o,g^no)$
   （该式由等距：$d(o,g^{-n}o)=d(g^no,o)$）。

(c) `[机械理由]` (2.1)/`eq:length-powers` 的唯一用途是给引理 2.3 的 $\nu(mv)=|m|\nu(v)$ 与
引理 2.4 的 $t\mapsto g^th$ 参数化提供整数齐性；"为什么必须是稳定长度而非位移 $d(x,gx)$"：
位移依赖于 $x$，而配对需要**函数式**（在 $\mathbb Z^k$ 上的次模函数）才能取平行四边形极限。
Lean 里 `displacement_subadditive`(`:91`)、`stableLength_tendsto`(`:100`)、`displacement_change_base`(`:122`)、
`stableLength_basepoint`(`:129`)、`stableLength_conjugate`(`:157`)、`stableLength_pow`(`:170`) 六条
一一对应上面 1–5 步——**机器侧拆得比论文细**（多了 `stableLength_inv`、`stableLength_one`、`stableLength_mul_le`）。

(d) `[推测]` 失败路线：非等距作用（只假设连续作用）时次可加性不成立，$\ell$ 不收敛；
`[推测]` 若试图用 $\inf_x d(x,gx)$ 直接做双线性（不取 $\ell$），引理 2.2 的"达到最小"是必需的，
而它需要 cocompact + proper——这正是论文把 $\ell$ 与 $\min$ 分开处理的原因（引理 2.2 才把它们等同）。
证据来源：lengths.tex 75–79 行把"$\ell(g)=\min_x d(x,gx)$"写成引理结论而非定义。
Lean 对应：`StableLength.lean:88 noncomputable def stableLengthAt (x : X) (g : G) : ℝ`——
机器版本**以基点为参数**，再用 `stableLength_basepoint` 证明与基点无关；论文定义里 $o$ 是临时选的。

### A-2.6 引理 2.2（`lem:semisimple`，`lengths.tex` 74–119 行）：半单性、轴与有限阶刻画

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:semisimple}
Suppose $G$ acts geometrically on $X$.  Every $g\in G$ attains its minimum
displacement, and
\[
 \ell(g)=\min_{x\in X}d(x,gx).
\]
If this number is positive, $g$ preserves a geodesic line and translates
along it by $\ell(g)$.  Moreover, $\ell(g)=0$ if and only if $g$ has finite
order.
\end{lemma}
```

(b) `[补]` 证明分三段，逐字展开：
1. **达到最小**（85–95 行）：取 $D=\inf_x d(x,gx)$、$x_n$ 使 $d(x_n,gx_n)\to D$；由 cocompact 取紧集 $K$ 覆盖，
   写 $x_n=h_np_n$（$p_n\in K$）；令 $q_n=h_n^{-1}gh_n$，则 $d(p_n,q_np_n)=d(x_n,gx_n)\to D$，
   丢弃有限项后 $d(p_n,q_np_n)\le D+1$。$K'$ = $K$ 的闭 $(D+1)$-邻域，"closed and bounded, hence compact"
   用到**空间 proper**。$p_n,q_np_n\in K'$ ⇒ $q_nK'\cap K'\ne\varnothing$ ⇒ **action proper** ⇒ $q_n$ 只有有限取值；
   取子列 $q_n\equiv q$、$p_n\to p\in K$ ⇒ $d(p,qp)=D$；某个固定的 $h_n$ 把 $p$ 送到 $g$ 的最小点。
   `[补]` 原文省略的中项：$h_np_n=x_n$、$q_n=h_n^{-1}gh_n$ ⇒ $h_nq_n=g h_n$ ⇒
   $d(h_np_n,g h_np_n)=d(h_n q_n p_n, h_n p_n)=d(q_np_n,p_n)$（$h_n$ 等距）。
2. **轴向**（97–113 行）：$x$ 为最小点，$D>0$，$m$ 为 $[x,gx]$ 中点，$gm$ 为 $[gx,g^2x]$ 中点。
   三角形 $(x,gx,g^2x)$ 比较 ⇒ $D\le d(m,gm)\le\frac12 d(x,g^2x)\le D$（左：$m,gm$ 是两点 $x,gx$ 与
   $gx,g^2x$ 的中点，用 (2.2)/距离凸性；右：$\frac12 d(x,g^2x)\le\frac12(d(x,gx)+d(gx,g^2x))=D$）
   ⇒ 夹逼 ⇒ $d(x,g^2x)=2D$。归纳：设 $[x,g^ix]$ 拼接为测地线；三角形 $(x,g^ix,g^{i+1}x)$ 中，
   距 $g^ix$ 为 $D$ 的两边点恰为 $g^{i-1}x$ 与 $g^{i+1}x$，它们距离 $2D$ ⇒ **Euclidean 比较角必须为 $\pi$** ⇒
   $d(x,g^{i+1}x)=(i+1)D$；对所有 $i\in\mathbb Z$ 平移 ⇒ 轴。故 $\ell(g)=D$。
3. **零长度 ⇔ 有限阶**（115–118 行）：$D=0$ ⇒ 最小点被固定 ⇒ 该点稳定子由 action proper（对单点紧集）
   有限 ⇒ $g$ 有限阶；反向显然。

(c) `[机械理由]`
- 半单性在这里不是为了"分类"，而是为了**给引理 2.4 提供 $d(x,g^nx)=nD$**（原文 211 行逐字引用），
  以及给 §3 的 $\ell(Z_r)$ 算术提供"长度即最小位移"的直觉合法性。
- "$D>0$" 的分支是必需的：$D=0$ 时 $b(z)=\lim(d(z,g^nx)-nD)$ 无意义（引理 2.4 用 $D=\ell(g)>0$）。
- 几何作用的四条假设在此引理**各用一次**，是检查"能否弱化假设"的最敏感点：
  cocompact → $x_n=h_np_n$；空间 proper → $K'$ 紧；action proper → $q_n$ 有限；isometric → 共轭不变性。

(d) `[推测]` 失败路线：
1. 若 $X$ 只是完备 CAT(0) 而作用 cocompact 但不 proper（例如非离散群作用），$q_n$ 无限 ⇒ 取不到常值子列；
   `[推测]` 这正是论文坚持"几何作用"而非"半单作用"的原因，注：引言 30–34 行提到
   "A geometric action would make the group's large-scale geometry accessible"。
2. 若改用 Bridson–Haefliger II.6.8(5) 的现成半单定理，仍需其前提（$X$ 完备 + 作用 cocompact），
   原文选择自证；证据来源：lengths.tex 7–10 行的引用只用于"标准事实的出处"，且声明不用 splitting theorem。
3. `[分析]` 该引理在论文里**未被 §3 之后的论证直接引用**（除了 211 行）；真正必需的是
   "$\ell(g)=\min$"与"$d(x,g^nx)=nD$"，因此若有一处只证"存在近似最小点列"则足够——这是可精简处。
Lean 对应：`StableLength.lean:388 finite_movers_of_compact`（action proper 的机器形式）、
`:406 exists_displacement_minimizer [Nonempty X] (hG : GeometricAction G X)`、
`:448 segment_point_eq_of_dist`、`:462 minimizer_displacement_two`（$d(x,g^2x)=2D$）、
`:495 minimizer_displacement_pow`（归纳出 $d(x,g^nx)=nD$）、`:548 stableLength_minimizer`、
`:562 stableLength_finiteOrder`、`:569 finiteOrder_of_fixedPoint`、
`:583 stableLength_eq_zero_iff_finiteOrder [ProperSpace X] [Nonempty X]`。
注意 `:482 extension_numeric {D R N : ℝ} (hN : 0 < N)`：机器版把夹逼的实数不等式单独成引理。

### A-2.7 引理 2.3（`lem:commuting-form`，`lengths.tex` 126–185 行）：交换族上 $\ell^2$ 是半正定二次型 + 配对定义

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:commuting-form}
For pairwise commuting isometries $g_1,\ldots,g_k$ of a CAT(0) space,
the function
\[
 v\longmapsto \ell(g^v),\qquad
 g^v=g_1^{v_1}\cdots g_k^{v_k},\qquad v\in\mathbb Z^k,
\]
extends uniquely to a continuous seminorm on $\mathbb R^k$ whose square
is a positive semidefinite quadratic form.  For commuting $g,h$, put
\begin{equation}\label{eq:pairing-definition}
 \langle g,h\rangle
   =\frac{\ell(gh)^2-\ell(g)^2-\ell(h)^2}{2}.
\end{equation}
These pairings are the bilinear form on every commuting family; in
particular, $\langle g^i,h^j\rangle=ij\langle g,h\rangle$.  Lengths and
pairings are invariant under simultaneous conjugation.
\end{lemma}
```

(b) `[补]` 三段证明的中项：
1. **半范数**：$\nu(u+v)\le\nu(u)+\nu(v)$（交换 + 三角不等式 + $\ell$ 的次可加），
   $\nu(mv)=|m|\nu(v)$（`eq:length-powers`），
   $|\nu(u)-\nu(v)|\le\sum_i|u_i-v_i|\ell(g_i)$（把 $g^v$ 写成 $g^u\cdot(g^{v-u})$，用次可加 + 幂齐性）。
   在 $\mathbb Q^k$ 上定义 $\nu(v/q)=\nu(v)/q$：良定义性来自上一条的齐性；Lipschitz 界给出到 $\mathbb R^k$ 的
   唯一连续扩张；**唯一性**由 $\mathbb Z^k$ 的稠密性（缩放后 $\mathbb Q^k$ 稠密）给出。
2. **平行四边形不等式 → 等式**：把 (2.3) 用四点 $o,\ g^{nu}o,\ g^{n(u+v)}o,\ g^{nv}o$（**该循环顺序**）。
   `[补]` 显式核对：对角线 $d(p,r)=d(o,g^{n(u+v)}o)$、
   $d(q,s)=d(g^{nu}o,g^{nv}o)=d(o,g^{n(v-u)}o)$（用 $g^{nu}$ 的等距性 + 交换性），
   四条边为 $d(o,g^{nu}o),\ d(o,g^{nv}o),\ d(o,g^{nu}o),\ d(o,g^{nv}o)$（各出现两次）。
   除以 $n^2$、$n\to\infty$（$\ell^2$ 版本）：$Q(u+v)+Q(u-v)\le 2Q(u)+2Q(v)$，$Q=\nu^2$。
   再把该不等式用于 $(u+v,\,u-v)$：$Q(2u)+Q(2v)\le 2Q(u+v)+2Q(u-v)$，
   结合 $Q(2u)=4Q(u)$ 与反向不等式 ⇒ 平行四边形恒等式 (eq:parallelogram)。
3. **极化（原文自称"For completeness…elementary algebra"）**：$B(u,v)=(Q(u+v)-Q(u-v))/4$；
   由 (eq:parallelogram) 得 $B(u+w,v)+B(u-w,v)=2B(u,v)$；取 $w=u$ 且用 $B(0,v)=0$ 得 $B(2u,v)=2B(u,v)$；
   取 $u=(a+b)/2,w=(a-b)/2$ 得第一变量可加；整数/有理齐次 + 连续 ⇒ 实双线性；$B(u,u)=Q(u)\ge0$ ⇒ 半正定；
   展开 $Q(u+v)$ 回到 (2.4)/`eq:pairing-definition`。同时共轭不变性由 $\ell$ 的共轭不变性（A-2.5 第 4 步）。

(c) `[机械理由]`
- 为什么必须是"$\ell$ 的**平方**是二次型"而不是"$\ell$ 是范数"：配对 $\langle g,h\rangle$ 的定义 (2.4)
  分母是 $2$、分子是**平方**差；若只有 $\ell$ 的三角不等式，极化给不出双线性。
- 为什么"pairwise commuting"不可省：证明第 2 步用 $g^{n(u+v)}=g^{nu}g^{nv}$（需要交换）；
  非交换族上 $\ell$ 甚至可以完全不连续。
- 半正定性的两处下游用途：(i) 引理 2.4 的 $\ell(g)=0$ 分支（原文 204–208 行）；
  (ii) §3 的两个不等式 `eq:lower-cross-pairing`、`eq:disjoint-centers`（"平方长度 $\ge0$"）。
  动了半正定 ⇒ 常数 $c_0$ 无下界 ⇒ $143/513$ 不存在。
- "$\langle g^i,h^j\rangle=ij\langle g,h\rangle$" 是 §3 中因子 $1/4$（原文 190 行）与 $2N_r\alpha$ 的唯一依据。

(d) `[推测]` 失败路线：
1. 引理前原文逐字写"For commuting isometries of a **complete** CAT(0) space, Rodenhausen
   \cite[Theorem~14.6]{Rodenhausen2013} proves a parallelogram identity for **infimal displacements**.
   The next proof works directly with stable lengths." ⇒ `[推测]` 作者先试过引用 Rodenhausen 的现成定理，
   但那里需要完备性且对象是 $\inf_x d(x,gx)$ 而非 $\ell(g)$，需额外通过引理 2.2 转换，遂改自证；
   证据来源：该段自我对比的位置（紧邻引理前）+ 引理陈述中不再出现 "complete"。
2. `[分析]` 若试图对**非交换**族做同样极化，$Q$ 连二次型都不是；作者把"非交换"的损失在引理 2.4 里
   用 Busemann 函数补回来——两段是**分工**而非重复。
3. `[推测]` 平坦环面定理（BH II.7.1，原文 9–10 行提到"central to the Flat Torus Theorem"）是
   该结论的更强版本；作者声明不用 splitting theorem ⇒ 若改用 Flat Torus 路线，需引入 $\mathbb R^k$ 作用
   与不变平坦子空间，机器化成本更高。
Lean 对应：`StableLength.lean:205 commuting_displacement_quadrilateral`（四边形不等式的交换族特化）、
`:221 length_parallelogram_le`（$\le$ 版）、`:235 length_parallelogram`（等式版）、
`:256 noncomputable def lengthPairing`、`:276 lengthPairing_polarization`、
`:298 lengthPairing_jensen`（即 $Q(u+w,v)+Q(u-w,v)=2B(u,v)$ 那一步的机器形式）、
`:316/:330 lengthPairing_mul_left/right`（可加性）、`:338/:349 lengthPairing_pow_right/left`（$ij$ 齐性）、
`:356 stableLength_product_sq`（$\ell(gh)^2$ 展开式，§3 反复使用）、`:371/:591 zpow$ 版本；
半正定在 `AxialLengths.lengthPairing_zero_of_length_zero:621` 与 `zero_of_int_mul_le:613` 处使用。

### A-2.8 引理 2.4（`lem:centralizer-character`，`lengths.tex` 193–251 行）：中央子群上的特征标

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:centralizer-character}
For a geometric action and a fixed $g\in G$, the function
\[
 C_G(g)\longrightarrow\mathbb R,\qquad h\longmapsto\langle g,h\rangle
\]
is a group homomorphism.  Thus
$\langle g,h_1h_2\rangle=\langle g,h_1\rangle+\langle g,h_2\rangle$
whenever both $h_1$ and $h_2$ commute with $g$.
\end{lemma}
```

引理前的定位句逐字："The following strengthening of bilinearity is crucial.  The elements $h_1,h_2$ in its
statement need not commute with one another. Real translation characters also underlie Bridson's obstruction
to proper semisimple actions on two-dimensional CAT(0) spaces \cite[Proposition~3.1]{Bridson2001}."

(b) `[补]` 五个中项：
1. $\ell(g)=0$ 分支：半正定 ⇒ 整数 $t$（两符号）上 $\ell(g^th)^2=2t\langle g,h\rangle+\ell(h)^2\ge0$ ⇒ 系数 $=0$。
2. $D=\ell(g)>0$：取最小点 $x$（引理 2.2）⇒ $d(x,g^nx)=nD$。定义
   $b(z)=\lim_n(d(z,g^nx)-nD)$。**单调性**：$d(z,g^{n+1}x)-(n+1)D\le d(z,g^nx)+d(g^nx,g^{n+1}x)-(n+1)D
   =d(z,g^nx)-nD$（$d(g^nx,g^{n+1}x)=D$）；**下界** $-d(z,x)$：$d(z,g^nx)\ge d(x,g^nx)-d(z,x)=nD-d(z,x)$。
   ⇒ 极限存在；1-Lipschitz：$|b(z)-b(w)|\le d(z,w)$（逐 $n$ 用 $|d(z,\cdot)-d(w,\cdot)|\le d(z,w)$）。
3. 关键四点组：$p_n=g^nx$、$q_n=h^{-1}g^nx$。$d(p_n,q_n)=d(x,h^{-1}x)$（$g^n$ 等距）**为常数**。
   (2.3) 的两种排序给 $|d(z,p_n)^2+d(w,q_n)^2-d(w,p_n)^2-d(z,q_n)^2|\le d(z,w)^2+d(p_n,q_n)^2$。
   代入 $d(z,p_n)=nD+b(z)+o(1)$、$d(z,q_n)=d(hz,p_n)=nD+b(hz)+o(1)$（这里用到 $h$ 与 $g$ 交换）；
   平方差主项 $(nD+b)^2=n^2D^2+2nDb+O(1)$，$n^2D^2$ 全部相消，除以 $2nD$ ⇒ `eq:busemann-difference`
   $b(hz)-b(hw)=b(z)-b(w)$。
4. $\chi(h)=b(x)-b(hx)$ 是同态：取 $z=kx,w=x$ ⇒ $b(hkx)-b(hx)=b(kx)-b(x)$ ⇒ $\chi(hk)=\chi(h)+\chi(k)$。
   `[补]` $b(x)=0$（$d(x,g^nx)-nD=0$）、$b(gx)=-D$（$d(gx,g^nx)=(n-1)D$）⇒ $\chi(g)=D$。
   Lipschitz 用于 $h^n$：$n|\chi(h)|=|b(x)-b(h^nx)|\le d(x,h^nx)$ ⇒ $|\chi(h)|\le\ell(h)$。
5. 收尾：对 $g^th$ 用上一条并用引理 2.3 展开：$(tD+\chi(h))^2\le t^2D^2+2t\langle g,h\rangle+\ell(h)^2$
   （左边来自 $\chi(g^th)=tD+\chi(h)$ 与 $|\chi|\le\ell$；右边来自 (2.4)），
   消去 $t^2D^2$，$t\to+\infty$ 与 $t\to-\infty$ 双向 ⇒ $D\chi(h)=\langle g,h\rangle$。

(c) `[机械理由]`
- **这是全篇最关键的引理**：§3 的所有"把中心元素的配对拆成生成子配对的和"都要求 $h_1h_2$ **不必交换**
  （$L_j$ 之间虽交换，但 $Z_r$ 展开时用到的是"对每个字母求和"，其合法性只靠每个字母与 $g$ 交换）。
- 为什么必须"几何作用"（而不仅是等距作用）：第 2 步的最小点来自引理 2.2，后者四条假设全用。
- 为什么用**轨道 Busemann 函数**（沿 $g$ 的正半轨）而不是 horofunction 紧化或 Busemann 特征标的现成理论：
  只有 $b(z)-b(w)$ 的差分形式给出 $n^2$ 项相消；现成理论给出的是 $b(hz)=b(z)+$ 常数（需要 $h$ 保持该 Busemann 函数的
  水平集结构），而此处 $h$ 只与 $g$ 交换、不保持 $x$ 的选取。
- $\chi(g)=D$ 与 $|\chi|\le\ell$ 两个归一化把"$\chi$ 是某个特征标"钉成"$\chi=\langle g,\cdot\rangle/D$"。

(d) `[推测]` 失败路线：
1. `[推测]` 原文若走 Bridson 2001 Prop 3.1 的"实平移特征标"路线，会得到**二维**限制
   （引理前那句引用正是把它当作"同型但受维数限制"的对照）；本篇结论要求任意维，故必须自证。
   证据来源：引言 114–115 行"The main geometric step is to turn this short angular circuit into a
   contradiction that remains valid in arbitrary dimension."
2. 若 $D=0$ 分支处理不当（例如直接用 $b$），$b(z)=\lim(d(z,g^nx)-nD)$ 不再是 Lipschitz 的规范化选择，
   $\chi$ 退化；原文用半正定单独处理该分支——这是"为什么先证 $\ell(g)=0$"的机械理由。
3. `[分析]` 若 $g$ 不与 $h$ 交换，$d(z,q_n)=d(hz,p_n)$ 一步失效 ⇒ `eq:busemann-difference` 不成立；
   故结论不能推广到"任意两元素"，配对确实只在交换对上有定义。
Lean 对应：整个 `Pairing.lean`（244 行）就是这条引理：`:14 orbitBusemann`（$b$）、`:17 orbitBusemann_tendsto`
（单调收敛）、`:36 orbitBusemann_lipschitz`、`:44 fourSquares_limit`（平方差相消的实数引理）、
`:61 quadrilateral_difference`（第 3 步的绝对值不等式）、`:71 orbitBusemann_centralizer_difference`
（= `eq:busemann-difference`）、`:107 orbitCharacter`（$\chi$）、`:113 orbitCharacter_mul`、
`:168 orbitCharacter_self`（$\chi(g)=D$）、`:183 orbitCharacter_abs_le`、
`:196 lengthPairing_eq_orbitCharacter`（$D\chi=\langle g,h\rangle$）、
`:217 lengthPairing_centralizer`（最终同态性，带 `[ProperSpace X] [Nonempty X]`）。
`:121` 处出现本目录 4 个 `Classical.choice` 之一（见 A-4）。

### A-2.9 命题 3.1（`prop:braid-angle`，`braids.tex` 12–25 行）：40 股辫子的定量角度约束

(a) 原文逐字：

```tex
\begin{proposition}\label{prop:braid-angle}
Suppose a group acting geometrically on a CAT(0) space contains elements
$s_1,\ldots,s_{39}$ satisfying the $B_{40}$ relations, with
$\ell(s_1^2)>0$.  Then
\begin{equation}\label{eq:braid-angle-bound}
 \left(\frac{\ell((s_1s_2)^3)}{3\ell(s_1^2)}\right)^2
 \ge\frac{143}{513}>\frac14,
\end{equation}
and in particular
\[
 \frac{\ell((s_1s_2)^3)}{3\ell(s_1^2)}
 =\frac{\ell((s_1s_2)^3)}{3\ell(s_2^2)}>\frac12.
\]
\end{proposition}
```

节首两条**限定性说明**逐字（第 8–10 行）："Throughout this section the same notation may denote elements of
another group satisfying these relations. No injectivity or cocompactness of the resulting braid subgroup
is needed for the length estimates."；命题后的注（27–30 行）："For $B_4$, Crisp and Paoluzzi compute
translation components along an axis of a central element under a minimal geometric action
\cite[Proposition~5]{CrispPaoluzzi2005}; minimality means that no proper nonempty closed convex subset is invariant."

(b) `[补]` 结论的形状：$R_3:=\ell(Z_3)^2/(N_3^2D^2)=\ell((s_1s_2)^3)^2/(9\ell(s_1^2)^2)\ge143/513$，
故 (a) 中括号的平方即 $R_3$。$\ell(s_2^2)=\ell(s_1^2)$ 由 `eq:braid-shift` 的共轭（$s_2=\delta s_1\delta^{-1}$）
给出；两个等号与 $>1/2$ 由 $R_3>1/4$ + 非负开方给出。整个命题的**唯一输入**是 39 个元素满足 $B_{40}$ 关系
（相邻三辫 + 距离 $\ge2$ 交换）与 $\ell(s_1^2)>0$，**不需要**辫子群注入或 cocompact——这是原文明确写出的
"不依赖"声明（见 A-3 清单）。

(c) `[机械理由]`
- 为什么是 39 个元素 / $B_{40}$：$\ell=2k$、$k=20$ ⇒ 39 个生成子；$k$ 控制两条约束的强度
  （$c_0\ge-1/(k-1)$ 与 $3R_3\ge1-\frac{3k-4}{(k-1)(k-2)}$）。$k$ 变小则下界跌破 $3/4$，$R_3>1/4$ 失效。
  `[分析]` 本人验算：$1-\frac{3k-4}{(k-1)(k-2)}>\frac34$ 的最小整数是 $k=14$（$k=13$ 时
  $1-35/(12\cdot11)=0.73487<0.75$，$k=14$ 时 $1-38/(13\cdot12)=0.75641>0.75$），
  ⇒ 28 股（27 个生成子）在**不等式层面**已足够，对应 $|S|=5+3\cdot25=80<116$；
  论文未讨论此点，属"论文未述清单"（A-3）。
- 为什么 $\ell(s_1^2)>0$ 而不是 $\ell(s_1)>0$：分母是 $\ell(s_1^2)$；引理 2.2 给出 $\ell=0\Leftrightarrow$ 有限阶，
  故该假设等价于"$s_1^2$ 无限阶"，在 §4 里靠 $T\to\mathbb Z$ 的增广验证（sectors.tex 19–21 行）。
- $143/513$ 的来源：$3R_3\ge143/171$ 除以 3 ⇒ $513=3\cdot171$，$171=19\cdot9$… 精确地
  $1-\frac{3\cdot20-4}{19\cdot18}=1-\frac{56}{342}=\frac{286}{342}=\frac{143}{171}$。
  $\frac{143}{513}>\frac14\iff 572>513$ ⇒ 余量只有 11.5%，是**紧**的算术。

(d) `[推测]` 失败路线：
1. 若 $k$ 取 10：$1-26/(9\cdot8)=0.639<0.75$ ⇒ $R_3$ 只能 $\ge0.16$，六扇区角度上界失去 $<\pi/3$；
   失败机制是 $\Omega<2\pi$ 不再成立（$2\pi$ 恰好对应 6 个 $\pi/3$）。
2. 若用"辫子群本身几何作用于某空间"的更强前提去做（Crisp–Paoluzzi 式最小作用），
   会把结论限制在辫子子群，而 §4 需要的是**环境群**里的关系；原文明确否认需要注入性。
3. `[推测]` 可能曾尝试 $B_4$/Crisp–Paoluzzi 的直接计算（原文该注的位置暗示这条路的终点是"$B_4$ 只知道这些"），
   后被替换成一般 $B_l$ 的递推；证据来源：braids.tex 27–30 行的注紧随命题之后且只讲 $B_4$。
Lean 对应：`Braids.lean:388 braid_forty_squared`（无除法形式 `143 * stableLengthAt x ((s 0)^2)^2 ≤
57 * stableLengthAt x ((s 0*s 1)^3)^2`，docstring "Quantitative braid constraint, in a division-free form."）、
`:441 braid_forty_ratio`（三分合取：$\ge143/513$、$>1/2$、与 $s_1$ 版本相等），
参数是 `hs : BraidRelations 39 s`（0-索引，39 个字母）与 `hD : 0 < stableLengthAt x ((s 0)^2)`。
`[分析]` 机器形式与论文的换算：$57\,\ell(Z_3)^2\ge143\,D^2\iff R_3=\ell(Z_3)^2/(9D^2)\ge143/513$ ✓；
中间引理 `hraw : 572*q ≤ 57*ℓ(braidCenter s 2)^2` 里的 $572=4\cdot143$、$380=2N_{20}$、
$20q+380v\ge0$ 即 `eq:lower-cross-pairing` 在 $k=20$ 的展开（$q=\ell(s_0)^2=D^2/4$、$v=\langle s_0,s_2\rangle=c_0D^2/4$）。

### A-2.10 引理 3.2（`lem:braid-centers`，`braids.tex` 41–104 行）：中心元素的交换性与配对恒等式

(a) 原文逐字（含其前置定义 (3.1)）：

```tex
\begin{equation}\label{eq:braid-centers-definition}
 L_1=1,\qquad L_j=s_{j-1}L_{j-1}s_{j-1},\qquad
 Z_r=L_1\cdots L_r,\qquad N_r=\binom r2.
\end{equation}
Here $2\le j\le l$ and $1\le r\le l$.

\begin{lemma}\label{lem:braid-centers}
The element $L_j$ commutes with $s_i$ for $i\le j-2$, and $Z_r$ commutes
with every $s_i$ for $i<r$.  In particular,
\[
 Z_2=s_1^2,\qquad Z_3=(s_1s_2)^3.
\]
The element $\delta=s_1\cdots s_{l-1}$ satisfies
\begin{equation}\label{eq:braid-shift}
 \delta s_i\delta^{-1}=s_{i+1}\qquad(1\le i\le l-2).
\end{equation}
In any geometric action of the ambient group,
\begin{equation}\label{eq:braid-central-pairing}
 \langle s_i^2,Z_r\rangle=\frac{\ell(Z_r)^2}{N_r}
 \qquad(2\le r\le l,\ 1\le i<r).
\end{equation}
\end{lemma}
```

(b) `[补]` 四段证明：
1. $L_j$ 与 $s_i$（$i\le j-2$）交换：对 $j$ 归纳。$i\le j-3$ 时 $s_{j-1}$ 与 $L_{j-1}$ 都与 $s_i$ 交换；
   $i=j-2$ 时令 $a=s_{j-2},b=s_{j-1},C=L_{j-2}$，$bC=Cb$、$L_j=baCab$，逐字照抄原文链
   $aL_j=abaCab=babCab=baCbab=baCaba=L_ja$（**每一步只用一个关系**：$aba=bab$；$bC=Cb$；再用一次 $aba=bab$；
   $C=L_{j-2}$ 与 $a=s_{j-2}$ 的归纳假设… 实际是 $baCaba=L_ja$ 由 $L_j=baCab$ 右乘 $a$）。
   $j=3$ 时 $C=L_1=1$ 已含；$j=2$ 空。⇒ $L_j$ 两两交换（$L_i$ 只用 $s_1,\dots,s_{i-1}$）。
2. $Z_r$ 与 $s_i$（$i<r$）交换：对 $r$ 归纳；仅剩 $s=s_{r-1}$。$L=L_{r-1}$、$L_r=sLs$，
   由已证的 $L$ 与 $L_r$ 交换得 $LsLs=sLsL$，于是 $s(LL_r)=sLsLs=LsLs^2=(LL_r)s$。
   显式值：$Z_2=L_1L_2=s_1^2$；$Z_3=s_1^2s_2s_1^2s_2=s_1(s_1s_2s_1)s_1s_2=s_1(s_2s_1s_2)s_1s_2=(s_1s_2)^3$。
3. `eq:braid-shift`：在 $\delta s_i$ 中把最右的 $s_i$ 依次左移越过 $s_{i+2},\dots,s_{l-1}$（距离 $\ge2$ ⇒ 交换），
   用 $s_is_{i+1}s_i=s_{i+1}s_is_{i+1}$ 替换，再把新的 $s_{i+1}$ 左移越过 $s_1,\dots,s_{i-1}$ ⇒ $s_{i+1}\delta$。
   指数上界 $l-2$ 在后续使用中被反复核对（原文 129–130、173–174 行两处专门说明）。
4. `eq:braid-central-pairing`：对固定的 $g=s_i^2$ 用引理 2.4 的特征标 $h\mapsto\langle g,h\rangle$；
   相邻辫子关系下取值相等 ⇒ 前 $r-1$ 个 $s_i$ 的 $\langle g,s_i\rangle$ 全相同 $=\alpha/2$；
   $L_j$ 的正字长 $2(j-1)$ ⇒ $Z_r$ 正字长 $2N_r$；
   `[补]` 于是 $\langle g,Z_r\rangle=2N_r\cdot(\alpha/2)=N_r\alpha$，而
   $\ell(Z_r)^2=\langle Z_r,Z_r\rangle=2N_r\alpha$（把 $Z_r$ 的字母逐个展开）⇒ 比值 $=\ell(Z_r)^2/N_r$。
   原文写法是 $\ell(Z_r)^2=\langle Z_r,Z_r\rangle=2N_r\alpha,\ \langle s_i^2,Z_r\rangle=2\alpha$，
   两式相除即得 —— 注意 $2\alpha$ 来自 $s_i^2$ 是**两个字母**。

(c) `[机械理由]`
- $N_r=\binom r2$ 是"度数"而非"字长"：字长是 $2N_r$；$1/2$ 因子正是 (2.4) 分母的 2 与字长 2 的抵消结果。
- "在 ambient group 的任何几何作用中"这句限定是必需的：结论只用到关系，不用群的其余结构（同 A-2.9 的
  "No injectivity … needed"）。
- $Z_3=(s_1s_2)^3$ 是本引理与 §4 的**接口**：扇区里的 $H=z_{uv}=(uv)^3$ 就是这个 $Z_3$。

(d) `[推测]` 失败路线：
1. 若把 $L_j$ 递推改成 $L_j=s_jL_{j-1}s_j$（右移一位），$Z_r$ 与 $s_i$（$i<r$）的交换性失效，
   因为归纳里"$s$ 与 $Z_{r-2}$ 交换"的余量消失 ⇒ `eq:braid-central-pairing` 无从谈起；
2. `[分析]` 若 $B_l$ 换成一般有限型 Artin（$l$ 个生成子带不同标签），第 3 步的 $\delta$ 平移共轭不存在，
   "所有平方等长"（原文 119 行）失效；论文只用型 $A$，是刻意收窄；
3. 若 $\alpha$ 的相等性只对 $s_i^2$ 建立而不对 $s_i$，$2N_r\alpha$ 计数会翻倍出错。
Lean 对应：`Braids.lean:17 braidLoop`（= $L_{j}$，0-索引偏移）、`:21 braidCenter`（= $Z_r$）、
`:25 braidDelta`、`:29/:37/:44 commute_braidLoop/Center/Delta`、`:51 braid_loop_step`（即 $aL_j=L_ja$ 的链）、
`:83 braid_center_step`、`:110/:132 braidDelta_shift/conjugate`、`:142 braidCenter_two`
（`braidCenter s 2 = (s 0*s 1)^3`，即 $Z_3$）、`:208–:257 lengthPairing_braid_equal/constant/braidLoop/
braidCenter`、`:257 braidCenter_length_sq`（$\ell(Z)^2=n(n+1)\langle s_i,Z\rangle$，即 $2N_r$ 形式）、
`:272 braid_generator_length`（$\ell(s_i)=\ell(s_0)$ 的归纳）。
机器索引偏移：Lean 的 `braidCenter s n` = 论文的 $Z_{n+1}$（`braidCenter s 19` = $Z_{20}$）。

### A-2.11 命题 3.1 证明主体（`braids.tex` 106–213 行）：两条约束与 $k=20$ 算术

(a) 原文逐字（四个关键式 + 收尾）：

```tex
\begin{equation}\label{eq:nonadjacent-pairing}
 \langle s_i^2,s_j^2\rangle=c_0D^2.
\end{equation}
\begin{equation}\label{eq:braid-recursion}
 N_rR_r=1+(r-2)(3R_3-1)+\binom{r-2}{2}c_0
 \qquad(3\le r\le 2k).
\end{equation}
\begin{equation}\label{eq:lower-cross-pairing}
 c_0\ge-\frac1{k-1}.
\end{equation}
\begin{equation}\label{eq:disjoint-centers}
 R_k\ge c_0.
\end{equation}
```

```tex
Put $r=k$ in \eqref{eq:braid-recursion} and use
\eqref{eq:disjoint-centers}.  Since
$N_k-\binom{k-2}{2}=2k-3$, we obtain
\begin{align*}
 3R_3
 &\ge 1-\frac1{k-2}+\frac{2k-3}{k-2}c_0\\
 &\ge 1-\frac{3k-4}{(k-1)(k-2)},
\end{align*}
```

(b) `[补]` 逐步：
1. 归一化：$g=s_1^2$、$D=\ell(g)>0$、$R_r=\ell(Z_r)^2/(N_r^2D^2)$、$c_0=\langle s_1^2,s_3^2\rangle/D^2$。
2. `eq:nonadjacent-pairing`：先固定 $i=1$——$j\ge3$ 的 $s_j$ 都在 $C_G(g)$ 内，相邻辫子关系经特征标取值相等；
   一般情形用 $\delta^{i-1}$ 同时共轭 $(s_1,s_{j-i+1})\mapsto(s_i,s_j)$（引理 2.3 的共轭不变性 + `eq:braid-shift`），
   并核对索引上界 $\le l-2$。
3. `eq:braid-recursion` 的推导链：$\langle g,Z_r\rangle=N_rR_rD^2$（`eq:braid-central-pairing` × $D^2/(N_rD^2)$ 归一）；
   $Z_3=gL_3$ ⇒ $\langle g,L_3\rangle=\langle g,Z_3\rangle-\langle g,g\rangle=(3R_3-1)D^2$；
   $j>3$ 时 $L_j=(s_{j-1}\cdots s_3)L_3(s_3\cdots s_{j-1})$，所有因子在 $C_G(g)$ 内且
   $\langle g,s_i\rangle=c_0D^2/2$（$i\ge3$），保留 $L_3$ 不展开（原文逐字："this calculation does not expand
   the noncommuting $s_2$-letters inside $L_3$"——**这就是必须用引理 2.4 的理由**）⇒
   $\langle g,L_j\rangle=(3R_3-1+(j-3)c_0)D^2$。求和 $\sum_{j=1}^r$（$L_1=1$ 贡献 0、$L_2=g$ 贡献 $D^2$）
   $\Rightarrow$ `eq:braid-recursion`。
4. `eq:lower-cross-pairing`：$k$ 个两两交换的平方 $s_1^2,s_3^2,\dots,s_{2k-1}^2$，乘积平方长度
   $=kD^2+k(k-1)c_0D^2\ge0$（引理 2.3 半正定）。
5. `eq:disjoint-centers`：$Z'_k=\delta^kZ_k\delta^{-k}$（用掉字母 $s_{k+1},\dots,s_{2k-1}$，最大应用索引 $2k-2$）；
   两块的字母两两交换 ⇒ $Z_k,Z'_k$ 交换，且共轭等长。写字 $Z_k=x_1\cdots x_{2N_k}$、$Z'_k=y_1\cdots y_{2N_k}$，
   **两次**合法的特征标展开：$\langle Z_k,Z'_k\rangle=\sum_p\langle x_p,Z'_k\rangle=\sum_{p,q}\langle x_p,y_q\rangle
   =(2N_k)^2\frac{c_0D^2}{4}=N_k^2c_0D^2$（$1/4$ 由 $\langle x^2,y^2\rangle=4\langle x,y\rangle$ 反解）。
   $\ell(Z_k(Z'_k)^{-1})^2=2\ell(Z_k)^2-2\langle Z_k,Z'_k\rangle=2N_k^2D^2(R_k-c_0)\ge0$。
6. 收尾：$R_k\ge c_0$ 代入 (r=k) 的递推 ⇒ 两行链式不等式 ⇒ $k=20$：$3R_3\ge143/171$、$R_3\ge143/513>1/4$；
   $Z_3=(s_1s_2)^3$、$N_3=3$、$\ell(s_2^2)=D$ ⇒ 比值。

(c) `[机械理由]` "为什么必须是这个界"：$3R_3$ 的下界是 $\frac{1}{k-2}$ 与 $\frac{2k-3}{(k-2)(k-1)}$ 两个亏损项之和，
$k\to\infty$ 时趋于 $1$ ⇒ $R_3\to1/3$、比值 $\to1/\sqrt3=0.577$；但 $\pi/3$ 的角度阈值要求比值 $>1/2$ 严格成立，
故只需要 $k$ 足够大使下界 $>3/4$。**$k$ 不能小**：$k=3$ 时 $1-\frac{5}{2\cdot1}<0$。
$N_k-\binom{k-2}{2}=2k-3$ 是化简枢纽（本人验算：$\binom k2-\binom{k-2}{2}=\frac{k(k-1)-(k-2)(k-3)}2=(4k-6)/2=2k-3$ ✓）。

(d) `[推测]` 失败路线：
1. `[分析]` 若 $R_k\ge c_0$ 换成更弱的 $R_k\ge c_0-\eta$，则最终下界减去 $\frac{(2k-3)\eta}{k-2}$，
   $k=20$ 时放大系数 $37/18\approx2.06$ —— **对 $c_0$ 估计的误差以 2 倍传递**；
2. 若只有一条约束（丢掉 `eq:disjoint-centers`），$c_0$ 只有下界无上界联系，$R_3$ 无下界；
3. `[推测]` 原作者可能在"两块中心不相交"与"$k$ 个奇数平方"之外试过第三种正性（如全部 $2k-1$ 个平方之积），
   证据来源：原文 115–117 行的预告句"Positivity for the commuting odd-indexed squares **and for two disjoint
   block centers** will then constrain these quantities"——写成清单式预告，通常是筛选后的结果。
Lean 对应：`Braids.lean:281 braid_nonadjacent_pairing`（= `eq:nonadjacent-pairing`）、
`:302 lengthPairing_disjoint_centers`、`:316 lengthPairing_braidDelta`、`:329 equiangular_product_sq`
（$\ell(\prod_{i<n}t_i)^2=nq+n(n-1)v$，= 第 4 步）、`:347 braid_loop_character`、`:364 braid_center_character`
（= 第 3 步 $\langle g,L_j\rangle$ 公式）、`:380 lengthPairing_le_self_of_equal_length`（= 第 5 步的
$\ell$ 相等 ⇒ 配对上界，用 `stableLength_product_sq` + `sq_nonneg`）、`:190 braidCenter_shift_conjugate`
（$Z'_k=\delta^kZ_k\delta^{-k}$ 的机器形式）。**机器里没有 $R_r,r$ 的递推符号**，而是把 $n:=19$、
$n:=17$、$k:=20$ 直接实例化后 `norm_num`/`linarith` 收尾（见 A-4 的差异清单）。

### A-2.12 命题 4.1（`prop:triangle-obstruction`，`sectors.tex` 10–17 行 + 19–36 行路线图）：$T$ 的主障碍

(a) 原文逐字（含节首设定与"分母为正"的即用时验证）：

```tex
Set
\[
 T=\langle a,b,c\mid aba=bab,\ bcb=cbc,\ cac=aca\rangle,\qquad
 \mathcal E=\{(a,b),(b,c),(c,a)\},
\]
and write \(z_{uv}=(uv)^3\) for \((u,v)\in\mathcal E\).

\begin{proposition}\label{prop:triangle-obstruction}
There is no geometric action of \(T\) such that, for every
\((u,v)\in\mathcal E\),
\begin{equation}\label{eq:strict-ratios}
 \frac{\ell(z_{uv})}{3\ell(u^2)}
 =\frac{\ell(z_{uv})}{3\ell(v^2)}>\frac12.
\end{equation}
\end{proposition}

The denominators are positive in every geometric action: sending each
of \(a,b,c\) to \(1\in\mathbb Z\) shows that their squares have infinite
order, so Lemma~\ref{lem:semisimple} applies.  The equality of the two
ratios also follows from conjugacy of adjacent braid generators.
We prove the proposition in Section~\ref{sec:localization}.  In this
section, assume for contradiction that such an action on \(Y\) exists
and fix \(y\in Y$.
```

路线图段逐字（27–36 行，本篇少见的"整段预告"）：

```tex
We will construct a parameter disk \(P\) made of six Euclidean sectors
and maps \(f_n:P\to Y\), indexed by positive integers \(n\).  Within
each sector, image distances divided by \(n\) approach Euclidean
distances.  Mirror coordinates will ensure a second property: disjoint
closed regions of \(P\) have images separated by a positive multiple
of \(n\).  The total sector angle below \(2\pi\) then lets us fill the
same boundary by a second disk whose image stays a positive multiple
of \(n\) from \(y\).  Sections~\ref{sec:diagrams} and
\ref{sec:localization} compare the resulting sphere with finite labelled
diagrams to obtain the contradiction.
```

(b) `[补]` 命题的量化结构：$\neg\exists$（几何作用 $T\curvearrowright Y$ 且三对比值均 $>1/2$）。
它比 §2–§3 强的地方在于**只用 $T$ 本身的三个辫子对**，不需要 39 个元素；比它弱的地方在于只排除
"满足比值条件的作用"，所以 §7 必须证明"环境群几何作用 ⇒ $T$ 的诱导作用几何且继承比值"。
证明的实体在 §4–§6：本 §4 造 $P$、$f_n$、外盖帽 ⇒ 球面；§5 造图示与符号计数；§6 造局部绕数并收束。

(c) `[机械理由]`
- $\mathcal E$ 取**循环三对**而非全部三对无序对：$(a,b),(b,c),(c,a)$ 让六扇区首尾相接成闭环
  （`eq:ray-order` 的循环序 $a^2,z_{ab},b^2,z_{bc},c^2,z_{ca},a^2$）；若取无序对 $\{a,b\},\{b,c\},\{a,c\}$
  则 $z_{ac}=(ac)^3$ 与 $z_{ca}$ 不同元素、循环方向反了会把扇区顺序搞乱（比较角定义依赖方向）。
- "阈值 $1/2$" 的机械来源：$\cos\theta=\ell(H)/(3\ell(U))$（见 A-2.15 的 `eq:sector-angle`），
  $\theta<\pi/3\iff\cos\theta>1/2$；六个扇区总角 $<6\cdot\pi/3=2\pi$。
  ⇒ **$1/2$ 与 $\pi/3$、$2\pi$ 与 6 是同一件事的四种写法**；若阈值改成 $>\frac12-\eta$，
  则 $\theta<\arccos(\frac12-\eta)>\pi/3$，总角可能 $\ge2\pi$，外盖帽（A-2.17）立刻失效。
- 分母正性用 $T\to\mathbb Z$（$a,b,c\mapsto1$）：这是"增广存在性"的最廉价格式，
  避免了对 $T$ 双曲性/挠自由性的任何讨论。

(d) `[推测]` 失败路线：
1. 若三对只满足两对比值 $>1/2$，得四个扇区，总角 $<4\pi/3$ 但**不构成闭环**，无法造"同一边界的第二个圆盘"；
   失败机制：`lem:outer-cap` 的 $\partial P$ 必须是拓扑圆。
2. `[推测]` 作者曾可能在 $T$ 上直接用 Crisp 的二维角和论证（引言 108–112 行逐字："A related angle-sum
   obstruction appears in Crisp's study of two-dimensional Bestvina--Brady groups… His argument assumes
   covering dimension two and a proper action in which each isometry attains its minimum displacement."）；
   该句的存在与它后面的转折（"The main geometric step is to turn this short angular circuit into a
   contradiction that remains valid in arbitrary dimension"）是**改换路线的文本痕迹**。
   证据来源：引言段落顺序 + "remains valid in arbitrary dimension"。
3. 若把比值条件 weaken 成 $\ge 1/2$（非严格），$\Omega<2\pi$ 变成 $\Omega\le2\pi$，
   $\varepsilon=\frac12(1-\sin(\Omega/4))$ 仍正（$\Omega\le2\pi\Rightarrow\sin(\Omega/4)\le\sin(\pi/2)=1$，
   等号时 $\varepsilon=0$）⇒ **严格性是必需的**。
Lean 对应：机器侧本命题是 `SixSector.no_strict_ratios`（`Main.lean` 里
`apply SixSector.no_strict_ratios hT y` 逐字出现），其假设形态是"三对生成子的比值严格 $>1/2$"，
论文里的 $\mathcal E$/$z_{uv}$ 记号在机器里被展成具体索引。

### A-2.13 引理 4.2（`lem:orbit-control`，`sectors.tex` 46–66 行）：Švarc–Milnor 轨道比较（带显式常数）

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:orbit-control}
For a geometric action of \(T\) and any base point \(y\), there are
constants \(R,C<\infty\) such that \(Ty\) is \(R\)-dense and
\begin{equation}\label{eq:orbit-control}
 d_T(s,t)\le C\bigl(1+d_Y(sy,ty)\bigr)\qquad(s,t\in T).
\end{equation}
\end{lemma}
```

前置说明逐字："The following form of the \v{S}varc--Milnor orbit comparison is standard; see
\cite[I.8.18--19]{BridsonHaefliger1999}. Its direct proof records the constants used to turn
mirror-coordinate separation into metric separation."

(b) `[补]` 证明的中项：
1. $R=\max_{p\in K}d(y,p)$（$K$ 紧、$GK=Y$）；任意 $x\in X$ 写 $x=tp$，$d(x,ty)=d(tp,y)\le d(p,y)\le R$
   （等距）⇒ $Ty$ 的 $R$-稠密。
2. 测地线分成 $N=\max(1,\lceil L\rceil)\le L+1$ 段（每段长 $\le1$），分点处取轨道点 $x_i=t_iy$，
   端点标签固定为 $s,t$；相邻增量 $q=t_i^{-1}t_{i+1}$ 满足 $d(y,qy)\le d(y,t_i^{-1}x_i)+d(y,t_i^{-1}x_{i+1})$
   量级 $2R+1$。
3. 这些 $q$ 有限：$\overline B(y,2R+1)$ 闭有界 ⇒ 紧（空间 proper）⇒ 含 $y,qy$ ⇒ $q$ 属于
   $\{g:gy\in\overline B\}$，由 action proper（对单点紧集 $\{y\}$）有限。
4. $C=\max(1,\max_q|q|_T)$ ⇒ $d_T(s,t)\le NC\le C(1+d_Y(sy,ty))$。

(c) `[机械理由]` "动了会坏在哪"：(4.1) 的方向是** word metric 由度量控制**（不是双 Lipschitz 等价），
因为用途是把"$V(t)$ 的 $\|\cdot\|_1$ 分离"翻译成"$d_Y$ 分离"（`lem:sector-maps` 最后一步的
$\frac{\eta n}{2C}-1-2C_0$ 里 $C$ 出现在**分母**）。故只需单侧 + 加法常数；写成双侧等价反而要额外论证。
$+1$ 是必需的：$s=t$ 时 $d_Y=0$，若无 $+1$ 则 $C$ 需 $\ge$ 所有增量字长的比，遇到 $d_Y$ 很小时崩溃。

(d) `[推测]` 失败路线：
1. 若作用不 cocompact，$R$ 不存在 ⇒ 分点无法选在轨道上 ⇒ 全链断；
2. 若空间不 proper，第 3 步的"$q$ 有限"失效 ⇒ $C=\infty$；
3. `[推测]` 原文自证而不引 BH I.8.18 的动机是"records the constants"——机器化需要显式 $R,C$ 而非存在性；
   证据来源：逐字"That direct proof records the constants used…"。
Lean 对应：`Mirrors.lean`（118 行）与 `Cap.lean`/`Grid.lean` 中的轨道稠密性使用；机器侧把 $R,C$
作为 `orbit_control` 类引理的显式输出（A-4 会列 `controlled_refinement` 给出的 $C,D$ 双界）。

### A-2.14 引理 4.3（`lem:mirror-action`，`sectors.tex` 74–135 行）：Digne 反射坐标仿射作用

(a) 原文逐字（设定 + 陈述）：

```tex
Take an equilateral triangle in the Euclidean plane, and denote its
three side lines by \(D_a,D_b,D_c\).  Let \(r_u\) be reflection in
\(D_u\), and let \(\mathcal D\) be the set of all images of these three
lines under the generated reflection group.  Write
\[
 E=\bigoplus_{D\in\mathcal D}\mathbb R e_D,\qquad
 \left\|\sum_D \xi_D e_D\right\|_1=\sum_D|\xi_D|.
\]
All vectors here have finite support.  Each \(r_u\) preserves
\(\mathcal D\) and acts linearly on \(E$ by permuting its basis vectors.

\begin{lemma}\label{lem:mirror-action}
The formulas
\[
 u\cdot\xi=e_{D_u}+r_u\xi\qquad(u=a,b,c)
\]
define an affine isometric action of \(T\) on \(E\).  If \(V(t)=t\cdot0\),
then
\begin{equation}\label{eq:mirror-lipschitz}
 \|V(t)-V(s)\|_1\le d_T(s,t).
\end{equation}
For each \((u,v)\in\mathcal E\), the elements \(u^2,z_{uv}\) act by pure
translations with vectors
\begin{equation}\label{eq:mirror-translations}
 L_u=2e_{D_u},\qquad
 L_{uv}=2(e_{D_u}+e_{D_v}+e_{D_{uv}}),
\end{equation}
where \(D_{uv}\) is the third mirror at \(D_u\cap D_v\).
The three lines \(D_{ab},D_{bc},D_{ca}\) are distinct from one another
and from \(D_a,D_b,D_c\).
\end{lemma}
```

（`$E$` 处的转义同 A-2.2 说明，源码为 `$E$`。）

(b) `[补]` 三步：
1. **仿射辫子关系**：两条相交边反射生成"过交点、夹角 $\pi/3$ 的三线反射群"；$uvu$ 与 $vuv$ 的**线性部分相同**
   （同为该三线的反射群元素），平移部分 $uvu$ 为
   $e_{D_u}+e_{r_uD_v}+e_{r_ur_vD_u}=e_{D_u}+e_{D_{uv}}+e_{D_v}$，$vuv$ 为同一和的**逆序** ⇒ 相等。
   `[补]`  cocycle 展开：$(u\cdot)(v\cdot)(u\cdot)(0)=e_{D_u}+r_u(e_{D_v}+r_v e_{D_u})=e_{D_u}+e_{r_uD_v}+e_{r_ur_vD_u}$。
2. **Lipschitz**：每个生成子（或其逆）把 $0$ 移动 $\|\cdot\|_1=1$ 的向量 ⇒ 字长 $k$ 移动 $\le k$；
   加上 cocycle 恒等式 $V(t)-V(s)=r_sV(s^{-1}t)$（**线性部分是保 $\|\cdot\|_1$ 的置换**）⇒ (4.2)。
3. **纯平移向量**：$u^2$：$r_u$ 固定 $e_{D_u}$ ⇒ $u\cdot(u\cdot0)=e_{D_u}+r_ue_{D_u}=2e_{D_u}$。
   $z_{uv}=(uv)^3=(uvu)^2$：$uvu$ 的线性部分保持 $e_{D_u}+e_{D_{uv}}+e_{D_v}$ 且平方为恒等 ⇒ 平方后线性部分消失、
   平移翻倍 ⇒ (4.3)。第三mirror 与对边平行且不同 ⇒ $D_{ab},D_{bc},D_{ca}$ 互异且异于 $D_a,D_b,D_c$。

(c) `[机械理由]`
- 为什么需要**六个**不同的 mirror 坐标（3 边 + 3 顶点对面线）：`lem:sector-data` 的注入性论证
  靠"extra-mirror 坐标先定 $(u,v)$ 与 $\mu$，两条原边坐标的超出量定剩余指数与用哪个扇区"；
  若 $D_{uv}$ 与某条边重合，两个扇区会被映到同一条线，$v_*$ 不注入 ⇒ 区域分离失效。
- 为什么用 $\|\cdot\|_1$：$r_u$ 是基向量置换 ⇒ 自动等距；若用 $\ell^2$ 也等距但 (4.3) 的求和估计变复杂，
  而 $\ell^1$ 让"两个不相交区域像距离 $\ge\eta$"成为**坐标级**事实。
- (4.2) 的方向"$\|V(t)-V(s)\|_1\le d_T(s,t)$"与 (4.1) 的方向"$d_T\le C(1+d_Y)$"是**刻意配对**的：
  合成得 $\|V(s)-V(t)\|_1\le C(1+d_Y)$ ⇒ $d_Y\ge\|\cdot\|_1/C-1$，这是区域分离不等式的骨架。

(d) `[推测]` 失败路线：
1. 若把等边三角形换成一般三角形（Digne 的一般版本），$uvu$ 与 $vuv$ 的平移部分不再相等
   （$r_ur_vD_u$ 与 $r_vr_uD_v$ 不同线）⇒ 不构成 $T$ 的作用；证据来源：引言 117–118 行逐字
   "This action is the equilateral-triangle specialization of Digne's reflection-coordinate homomorphism"。
2. 若去掉 $\mathcal D$ 中"所有像线"而只保留三条边线，$r_u$ 不在置换基向量意义下作用 ⇒ 仿射性破坏。
3. `[分析]` $L_{uv}$ 的系数 2 是 $u^2$ 型平移到邻倍的结果；若把 (4.3) 整体缩放 $\lambda$，
   (4.2) 与区域分离的 $\eta$ 同步缩放，最终 $\delta$ 变 $\lambda\delta$ ⇒ 结论不变（**尺度自由**，
   只有 $v_*$ 与 $P$ 的相对定位要紧）。
Lean 对应：`Mirrors.lean`（118 行，最小模块）承载 (4.2)/(4.3)；机器里 $\mathcal D$ 用可判别的有限线集表示，
`e_D` 基用 `Finsupp`/`Pi` 类型，$\|\cdot\|_1$ 用 `Finset.sum`。

### A-2.15 引理 4.4（`lem:sector-data`，`sectors.tex` 139–212 行）：六个扇区的正定性与角度 $<\pi/3$

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:sector-data}
Each of these six seminorms is positive definite.  Each sector angle
\(\theta\) satisfies \(0<\theta<\pi/3\).
The sectors glue isometrically along their shared rays, in the cyclic
order
\begin{equation}\label{eq:ray-order}
 a^2,\ z_{ab},\ b^2,\ z_{bc},\ c^2,\ z_{ca},\ a^2.
\end{equation}
Their radius-one disk \(P\) is a topological disk with total angle
\(0<\Omega<2\pi\).  It has a continuous injective map \(v_*:P\to E\)
whose value in a sector for \(U=u^2,H=z_{uv}\) is
\begin{equation}\label{eq:separating-coordinates}
 v_*(\lambda,\mu)=\lambda L_u+\mu L_{uv},
\end{equation}
and similarly with \(v$ in place of \(u\).
\end{lemma}
```

前置构造段逐字（139–148 行）：`For each pair \((u,v)\in\mathcal E\), use both commuting pairs
\((U,H)=(u^2,z_{uv})\), \((U,H)=(v^2,z_{uv})\). Commutation follows from Lemma~\ref{lem:braid-centers}.
On the exponent plane \(\mathbb R^2\) of each pair, let \(\|\cdot\|_{U,H}\) be the stable seminorm from
Lemma~\ref{lem:commuting-form}. Give its nonnegative quadrant exponent coordinates \((\lambda,\mu)\),
corresponding to \(U,H\), respectively. The next lemma proves that this quadrant is a Euclidean sector.`

(b) `[补]` 四段：
1. **正定**：整数 $(i,j)$ 下 $V((U^iH^j)^m)=m(iL_u+jL_{uv})$（纯平移的合成），
   用 (4.2) + (4.1) 除以 $m$ 取极限 ⇒ $\|iL_u+jL_{uv}\|_1\le C\|(i,j)\|_{U,H}$；
   齐性扩到 $\mathbb Q^2$、连续性扩到 $\mathbb R^2$；$L_u,L_{uv}$ 线性无关
   （extra-mirror 坐标先定 $j$，$D_u$ 坐标再定 $i$）⇒ 半范数支配一个真范数 ⇒ 正定。
   `[补]` 注意方向：**mirror 范数 $\le C\cdot$ 稳定范数**，正定性由"右边若为 0 则左边为 0 ⇒ $(i,j)=0$"给出。
2. **角度**：`eq:braid-central-pairing` 取 $r=3$ ⇒ $\langle U,H\rangle=\ell(H)^2/3$（$N_3=3$），
   于是 `eq:sector-angle`：
   ```tex
   \cos\theta=\frac{\langle U,H\rangle}{\ell(U)\ell(H)}
    =\frac{\ell(H)}{3\ell(U)}>\frac12.
   ```
   正定 ⇒ $\cos\theta<1$ ⇒ $0<\theta<\pi/3$。
3. **粘合**：共享射线对应同一元素 $W$，指数 $t\ge0$ 在两侧离原点距离都是 $t\ell(W)$ ⇒ 保指数保度量；
   得到锥面：半径 $r\ge0$ + 周期 $\Omega$ 的循环角，$r=0$ 处所有角重合；$0\le r\le1$ 即 $P$。
4. **$v_*$ 注入**：分情形（extra-mirror 坐标非零 / 无超出量 / 无 extra-mirror 系数）逐一定位，
   见 (c) 第 1 点。

(c) `[机械理由]`
- 为什么恰好 6 个扇区（每对 $(u,v)$ 用**两个**交换对）：一个 $(u^2,z_{uv})$ 扇区只覆盖半边，
  $(v^2,z_{uv})$ 与之沿 $z_{uv}$ 射线相接；三条边 ⇒ 6 块，闭合条件 `eq:ray-order` 才成立。
- $\cos\theta$ 公式是 $\pi/3$ 阈值的**唯一入口**：$\theta=\arccos(\ell(H)/(3\ell(U)))$；
  若把 $N_3=3$ 记成 2，$\cos\theta$ 变成 $\ell(H)^2/(2\ell(U)\ell(H))$ ⇒ 阈值条件改写为 $\ell(H)/\ell(U)>1$，
  与 §3 得到的 $>1/2$ 完全不匹配。
- 原文逐字"We use only the Euclidean metric within each sector of $P$;
  **we do not claim that this cone disk is CAT(0)**."——这是"论文未述清单"的一条：$P$ 只是度量的拼装盘，
  不是 CAT(0) 空间，一切 CAT(0) 事实都在 $Y$ 一侧。

(d) `[推测]` 失败路线：
1. 若 $\Omega\ge2\pi$，$P$ 不再是拓扑圆盘（锥点处角亏为负），`lem:outer-cap` 的弦长论证失效；
2. 若 $L_u,L_{uv}$ 线性相关（例如 $D_{uv}$ 与 $D_u$ 重合），正定性失效 ⇒ $\|(i,j)\|_{U,H}$ 可能是半范数，
   扇区退化成一维；
3. `[分析]` $v_*$ 注入性依赖"超出量"论证，若某扇区的 $(u,v)$ 与另一扇区共享同一 extra-mirror 坐标
   （比如把 $\mathcal E$ 改成包含 $(a,c)$ 而非 $(c,a)$），注入性会在 $H$-射线两侧混淆 ⇒
   `[推测]` 论文明写"$D_{ab},D_{bc},D_{ca}$ 互异"正是为堵此点。
Lean 对应：`SectorMetric.lean`（476 行，扇区上的稳定范数/角度）与 `SectorCharts.lean`（496 行，
$v_*$ 坐标卡与注入性；该文件含 `Classical.choose` 用法 :45, :354）；机器侧把 6 个扇区写成
`Fin 6` 索引的显式表，`AngularSize = 6*(n+1)` 类常数用于离散化（见 A-5 表）。

### A-2.16 引理 4.5（`lem:sector-maps`，`sectors.tex` 241–326 行）：一致渐近映射与区域分离

(a) 原文逐字（含标签定义 (4.4)）：

```tex
In each sector define the group label
\begin{equation}\label{eq:sector-label}
 t_n(p)=U^{\lfloor n\lambda\rfloor}H^{\lfloor n\mu\rfloor}.
\end{equation}
These labels agree on the glued rays.

\begin{lemma}\label{lem:sector-maps}
There are continuous maps \(f_n:P\to Y\), with \(f_n(0)=y\), and a
constant \(C_0\) independent of \(n,p\), such that
\begin{equation}\label{eq:grid-error}
 d_Y(f_n(p),t_n(p)y)\le C_0.
\end{equation}
For two points in any one sector,
\begin{equation}\label{eq:sector-convergence}
 \frac{d_Y(f_n(p),f_n(p'))}{n}
 \longrightarrow\|p-p'\|_{U,H}
\end{equation}
uniformly.  In addition, uniformly on \(P\),
\begin{equation}\label{eq:radial-coordinates}
 \frac{d_Y(y,f_n(p))}{n}\longrightarrow r(p),
 \qquad
 \frac{V(t_n(p))}{n}\longrightarrow v_*(p).
\end{equation}
If \(A_1,A_2\subset P\) are disjoint nonempty closed sets, then for
some \(\delta>0\) and all sufficiently large \(n\),
\begin{equation}\label{eq:region-separation}
 d_Y(f_n(A_1),f_n(A_2))\ge\delta n.
\end{equation}
\end{lemma}
```

(b) `[补]` 构造与四个估计的中项：
1. **建图**：在指数象限用边长 $1/n$ 的方格剖分（每格沿对角线剖成三角形），顶点 $(i/n,j/n)$ 映到 $U^iH^jy$；
   边上用等速测地线；三角形内把对边向剩余顶点**锥化**（用测地线）。公共边上是同一等速参数化 ⇒ 连续。
   测地凸性 ⇒ 像点到顶点的距离 $\le$ 顶点距离最大值；交换性 ⇒ 顶点距离由 $U,H$ 的位移一致控制
   ⇒ (4.5) $C_0$。**六个扇区只有有限个**，故可取公共 $C_0$（原文逐字）。
2. **单对收敛**：$F(i,j)=d_Y(y,U^iH^jy)$ 满足
   $|F(i,j)-F(i',j')|\le d(y,Uy)|i-i'|+d(y,Hy)|j-j'|$；固定有理向量 $q=(a/b)$ 型，比较
   $\lfloor nq\rfloor$ 与 $\lfloor n/m\rfloor(a,b)$（差有界）⇒ $F(\lfloor nq\rfloor)/n\to\|q\|_{U,H}$
   （含负分量）；有界区域取有限有理网 + 公共 Lipschitz + 舍入 $O(1/n)$ ⇒ 区域上一致收敛。
3. **两点差**：两点地板向量之差与 $n(p'-p)$ 的地板差一个有界整向量 ⇒ 用 2 与 (4.5) 得 (4.6)；
   取一点为 $0$ 得径向式；$V(t_n(p))/n\to v_*(p)$ 直接由 (4.3)，且误差实际是 $O(1/n)$。
4. **区域分离**：$\eta=\min_{A_1\times A_2}\|v_*(p)-v_*(q)\|_1>0$（紧 + 注入），
   $\|V(t_n(p))-V(t_n(q))\|\ge\eta n/2$；合成 (4.2)+(4.1)+(4.5)：
   ```tex
    d_Y(f_n(p),f_n(q))
    \ge\frac{\eta n}{2C}-1-2C_0.
   ```
   取 $\delta<\frac{\eta}{2C}$、$n$ 足够大 ⇒ (4.8)。

(c) `[机械理由]`
- $\lfloor n\lambda\rfloor$ 的地板：把连续参数离散成群元素，误差 $O(1/n)$ 是"渐近 Euclidean"的字面来源；
  不用地板而用四舍五入也可，但 $t_n$ 在粘合射线上必须**一致**（原文"agree on the glued rays"），
  地板在共享射线上的指数表示恰好一致（$H$ 射线两侧都是 $(0,\mu)$ 型）。
- $C_0$ 必须与 $n,p$ 无关：否则 (4.8) 的 $\delta n$ 无法吸收；"只有六个扇区"是 $C_0$ 存在的理由。
- 分离量级必须是 $n$（不是 $\sqrt n$ 或 $o(n)$）：§5–§6 的图示控制用 $\delta n$ 与 $2C_1$ 比较
  （`lem:localized-degree`），$C_1$ 与 $n$ 无关 ⇒ 只有线性分离能压过图示误差。
- 环境说明：整个引理被 `\begin{samepage}` 包裹（240、264 行），是 LaTeX 排版层面的"不许断页"，
  提示作者在意该陈述的完整性（见 A-3 的 tex 叙事痕迹）。

(d) `[推测]` 失败路线：
1. 若 $v_*$ 在某对不相交闭集上像距离为 0（注入性丢失），$\eta=0$ ⇒ 无分离 ⇒ §6 的局部度论证崩；
2. 若 (4.6) 只在每扇区内部成立而跨扇区不成立，$P$ 上的 $r(p)$ 径向一致性仍可（原文只声明单扇区内 (4.6)），
   故真正的风险是 (4.7) 的一致版本 —— `[推测]` 作者刻意把"uniformly on $P$"只挂在 (4.7) 上，
   说明 (4.6) 的跨扇区版本不可用（跨扇区时 $\|\cdot\|_{U,H}$ 未定义）；
3. 若 $C$（`lem:orbit-control` 常数）未知有限，$\delta$ 无法选 ⇒ 该引理显式依赖 4.2，不可删。
Lean 对应：`Grid.lean`（596 行：网格、$t_n$、$C_0$ 型误差，含 `Classical.choose` :246,:383）、
`Refinement.lean`（455 行：一致逼近与剖分细化，choose :123,:145,:147）、
`SectorCharts.lean`（496 行：$v_*$ 与区域分离）。机器里 $C_0$ 与 $C,D$ 的具体数值被写进
`controlled_refinement` 的输出（$B=22+4C+4E$ 等，见 A-5）。

### A-2.17 引理 4.6（`lem:outer-cap`，`sectors.tex` 328–374 行）：外盖帽与远离锥点的第二个圆盘

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:outer-cap}
There is \(\epsilon>0\) such that, for all sufficiently large \(n\),
the map \(f_n|_{\partial P}\) extends to a second parameter disk whose
entire image lies outside \(B_Y(y,\epsilon n)\).
Gluing the two parameter disks gives a continuous sphere map, still
denoted \(f_n\).
\end{lemma}
```

(b) `[补]` 五步：
1. $\partial P$ 上两点取**较短**角弧，角 $\phi\le\Omega/2<\pi$（"$\Omega<2\pi$" 在此处第一次被消费）。
2. 把该弧展开成 Euclidean 楔形；楔 $\cap$ 单位圆盘凸 ⇒ 弦在盘内，弦长 $2\sin(\phi/2)\le2\sin(\Omega/4)$。
3. 每个扇区在该展开中至多出现一次；含两端点的扇区可能拆成两块 ⇒ 弦分成**至多七段**单扇区片，
   每片与弦的交是线段（凸性），逐片用 (4.6)：`eq:boundary-short`
   $d_Y(f_n(p),f_n(p'))\le2\sin(\Omega/4)n+o(n)$，**对 $\partial P$ 上一致**。
4. 固定 $p_0\in\partial P$，把边界映射向 $f_n(p_0)$ 用测地线锥化 ⇒ 第二个圆盘（连续依赖给连续性，
   用 `lem:comparison` 首句）。
5. 距离下界：若 $q\in[A,B]$（锥线段端点），
   $d(y,q)\ge\max\{d(y,A)-d(A,q),d(y,B)-d(q,B)\}\ge\frac{d(y,A)+d(y,B)-d(A,B)}2$；
   端点距离都是 $n+o(n)$（(4.7) 径向），$d(A,B)$ 由第 3 步控制 ⇒
   整段离 $y$ 至少 $(1-\sin(\Omega/4))n-o(n)$。取 $\epsilon=\frac12(1-\sin(\Omega/4))>0$。

(c) `[机械理由]`
- $2\sin(\Omega/4)$ 的来源：较短弧 $\phi\le\Omega/2$，单位圆上弦长 $2\sin(\phi/2)$ ⇒ $2\sin(\Omega/4)$；
  **系数 $\Omega/4$ 是"半径 1"下的半角**，若 $P$ 的半径改成 $R$，则弦长 $2R\sin(\Omega/4)$、
  端点距离 $Rn$，$\epsilon$ 相应缩放 ⇒ 结论尺度不变（与 A-2.14(d)3 的尺度自由一致）。
- $\epsilon>0\iff\sin(\Omega/4)<1\iff\Omega<2\pi$：**这就是六扇区角度上界的兑现处**，
  也是全篇"动了会坏在哪"最紧的一点（任何把阈值放宽到 $\ge\pi/3$ 的改动使 $\epsilon=0$）。
- "至多七段"而非"六段"：含两端点的扇区被弧的起点/终点各切一次 ⇒ 最坏 $6+1$；写成 6 会漏掉
  端点落在同一扇区内部的情形。`[分析]` 该数是上界估计，任何 $\ge7$ 的写法都可行，不影响结论。

(d) `[推测]` 失败路线：
1. 若 $\phi$ 可取到 $\ge\pi$（例如 $\Omega>2\pi$），"较短弧"展开后的楔不再凸于单位盘 ⇒ 弦跑出 $P$，
   第 2 步失效；失败机制是几何而非计数。
2. 若锥化的中心取 $y$ 而非 $f_n(p_0)$，整个盖帽经过 $y$，离 $y$ 距离为 0 ⇒ 与"远离锥点"矛盾；
   原文取 $f_n(p_0)$ 正是为了让**所有**点距离都由端点距离减弦长给出。
3. `[推测]` Lean 侧完全没有用"锥到一点"，而是显式造环带 + 绕指标（`Detour.lean`/`Cap.lean`），
   提示原文这一步在机器化时最难落地（锥化的连续性依赖测地线连续依赖，机器里要显式构造）。
   证据来源：`Detour.lean`(591)/`Cap.lean`(586) 的存在及其命名；见 A-4 差异清单。
Lean 对应：`Cap.lean`（外盖/边界长度控制）、`Detour.lean`（绕行路径与环带）、
`Wires.lean`（274 行，把度为 2 的顶点压缩 `resolve`）—— 机器里 `eq:boundary-short` 的等价物是
显式折线长度界（A-5 的 $d=2\sqrt{1+r^2-2cr}+r$ 型公式）。

### A-2.18 §5 目的段 + 引理 5.1（`lem:triangular-presentation`，`diagrams.tex` 4–41 行）：9 生成子三角呈现

(a) 原文逐字（节首定位段 + 陈述 + 证明全文，证明很短故照抄）：

```tex
We next construct a two-dimensional labelled complex from the presentation
of $T$.  The presentation and link are the case $m=n=p=3$ of the
construction of Brady and McCammond \cite{BradyMcCammond2000}.
We give direct proofs of the needed facts.  This complex is separate
from the unknown CAT(0) space; the argument here concerns finite
diagrams and planar topology.

We need two conclusions.  Proposition~\ref{prop:sphere-counts} will
show that a spherical diagram has zero total signed occurrences of
each individual target triangle.  Lemma~\ref{lem:controlled-diagrams}
will approximate any geometric sphere map by a diagram, with one
distance bound valid on every point of every parameter triangle.
```

```tex
\begin{lemma}\label{lem:triangular-presentation}
For each $(u,v)\in\mathcal E$, introduce two private generators
$x_{uv}$ and $h_{uv}$.  Write
$(x_1,x_2,x_3,h)=(u,v,x_{uv},h_{uv})$ within this block.  A presentation
of $T$ is given by the three relations
\begin{equation}\label{eq:triangle-relations}
  x_i x_{i+1}=h\qquad (i=1,2,3),
\end{equation}
in each block, where the subscripts on the $x_i$ are read modulo three.
\end{lemma}

\begin{proof}
The first two relations give $h=x_1x_2$ and
$x_3=x_2^{-1}x_1x_2$.  Substituting these in the third gives
$x_1x_2x_1=x_2x_1x_2$.  Conversely, that braid relation and these
definitions of $x_3,h$ give all three relations
\eqref{eq:triangle-relations}.  Since the added generators are private
to their blocks, eliminating them independently recovers the defining
presentation of $T$.
\end{proof}
```

(b) `[补]` 逐字展开消去链：$x_1x_2=h$、$x_2x_3=h$ ⇒ $x_3=x_2^{-1}h=x_2^{-1}x_1x_2$；
第三条 $x_3x_1=h=x_1x_2$ ⇒ $x_2^{-1}x_1x_2x_1=x_1x_2$ ⇒ 左乘 $x_2$：$x_1x_2x_1=x_2x_1x_2$ ✓。
反向：给定辫子关系，令 $h=x_1x_2$、$x_3=x_2^{-1}x_1x_2$，则 $x_2x_3=x_1x_2=h$ ✓ 且
$x_3x_1=x_2^{-1}x_1x_2x_1=x_2^{-1}x_2x_1x_2=h$ ✓。每块引入 2 个私有生成子 × 3 块 = 6，
加 $a,b,c$ 共 **9 个生成子**，关系为 9 条例程 $x_ix_{i+1}=h$（3 块 × 3 条）。

(c) `[机械理由]`
- 为什么把辫子关系改写成 $x_ix_{i+1}=h$ 型（"三角关系"）：三元三角形 $x_ix_{i+1}=h$ 给出**恰三个**
  角/三条边的三角形胞腔，使得 link 中每个块是一个 theta 图（三条内部不交长 3 路径）；
  若保留 $aba=bab$（长 6 循环），三角形不存在，图示计数（$3F=2E$）失去意义。
- "private"（私有）是关键：生成子不跨块共享 ⇒ 三块可**独立**消去，才得到"$\mathcal A$ 是 9 个生成子"
  且不引入跨块关系；跨块共享会让 link 的块间交变大，girth 论证（A-2.19）崩塌。
- `[机械理由]` 该复形与未知 CAT(0) 空间**无关**（原文逐字"This complex is separate from the unknown
  CAT(0) space"）：这是"任意维"得以保全的结构性理由——矛盾只在有限平面图示里发生。

(d) `[推测]` 失败路线：
1. 若 $x_i$ 的循环顺序在某块取反（$x_1,x_3,x_2$），$h$ 的定义与另一块不一致，9 个生成子的
  标号复形仍能构造，但 link 的三条 theta 路径方向错配 ⇒ `eq:link-edges` 的显式列表要重写；
2. `[推测]` 若不引入私有 $x_{uv}$ 而直接用 $a,b,c$ 的长 6 关系做二面角图示，
   则折叠删除论证（A-2.20）需要"面恰含三个角"，失败机制是 Euler 计数 $3F=2E$ 不成立。
证据来源：`prop:sphere-counts` 证明通篇假设"triangle/三条边/三角节点"。
Lean 对应：`Presentation.lean:145 triangleRelators`（`Fin 3` 上的自由群关系集）、
`:150 abbrev TriangleGroup := PresentedGroup triangleRelators`、`:160 triangleLift`、
`:196 triangleExponent`（→ `Multiplicative ℤ` 的增广，即下文 ℤ-化）、
`:202 triangle_generator_infinite_order`（`¬ IsOfFinOrder`）——
**机器里 $T$ 是独立的 `TriangleGroup` 类型**，不是 `ArtinGroup explicitMatrix` 的子群，
两者靠 `Assembly` 里的嵌入连接（见 A-2.24/A-2.28）。

### A-2.19 $\mathcal K$ 构造 + 引理 5.2（`lem:link-girth`，`diagrams.tex` 43–127 行）：girth $\ge6$

(a) 原文逐字（构造段 + 陈述）：

```tex
Let $\mathcal A$ be the resulting set of nine generators.  Define the
labelled Cayley complex $\mathcal K$ as follows.  Its vertices are the
elements of $T$.  For every $g\in T$ and $q\in\mathcal A$ there is an
oriented edge labelled $(g,q)$ from $g$ to $gq$.  For each relation
\eqref{eq:triangle-relations} and each $g$, attach a triangle, with its
own cell identity, along the edges joining
\begin{equation}\label{eq:triangle-vertices}
  g,\quad gx_i,\quad gh.
\end{equation}
Edges and triangles retain these identities even if some other cells
have the same vertex data.  The homomorphism $T\to\mathbb Z$ taking
$a,b,c$ to $1$ takes every $x_i$ to $1$ and every $h$ to $2$.
Consequently the three vertices in \eqref{eq:triangle-vertices} are
distinct.  In particular every target triangle has three distinct
sides and three distinct corners.

\begin{lemma}\label{lem:link-girth}
The link at every vertex of $\mathcal K$ has no circuit of length
less than six, including circuits formed by parallel edges.
\end{lemma}
```

(b) `[补]` 两个中项：
1. **ℤ-化分离顶点**：$g$（度 0）、$gx_i$（度 1）、$gh$（度 2）在增广下像不同 ⇒ 三个顶点两两不同
   ⇒ 三角形非退化。`[补]` 若 $h$ 也赋 1，则 $gh$ 与 $gx_i$ 同度，可能出现 $h=x_i$ 型退化。
2. **link 的完整描述**：在 Cayley 顶点 $v$，关系 $x_ix_{i+1}=h$ 的三个角分别在
   $g=v,\,vx_i^{-1},\,vh^{-1}$，对应 link 边 `{x_i⁺,h⁺}, {x_i⁻,x_{i+1}⁺}, {x_{i+1}⁻,h⁻}`；
   一块 = 从 $h^+$ 到 $h^-$ 的三条长 3 内部不交路径（theta 图），9 条 link 边互异；
   块与块只在 $a,b,c$ 的带符号方向相交，跨块公共边只有 `{a⁻,b⁺},{b⁻,c⁺},{c⁻,a⁺}` 三条。
3. **回路的三类划分**（按"块内极大段"的段数 $k$）：
   - $k=2$：两次换块落在同两块交集 ⇒ 端点是唯一共享生成子的两个异号 ⇒ 块内距离 3 ⇒ 长 $\ge6$；
   - $k=3$：经过三块，在 $a,b,c$ 各一个带号方向换块；块内 $x_1,x_2$ 方向间：同号距离 $\ge2$，
     异号 $\ge3$，唯一例外 $x_1^-,x_2^+$ 相邻；三号全同 ⇒ $2+2+2=6$；否则循环序 $a,b,c,a$ 中恰有
     两次符号变化（$-\to+$ 与 $+\to-$），例外相邻至多被一条块路径使用 ⇒ $1+3+2=6$；
   - $k\ge4$：长 1 段必是那三条跨块公共边之一，每个共享方向至多关联一条 ⇒ 长 1 段不相邻 ⇒
     长 1 段数 $\le\lfloor k/2\rfloor$，其余 $\ge2$ ⇒ 总长 $\ge2k-\lfloor k/2\rfloor\ge6$（$k=4$ 时 $8-2=6$ ✓）。

(c) `[机械理由]`
- girth 6 是 `prop:sphere-counts` 里 $2E\ge6V$ 的**唯一来源**：不等式左边是"每个对偶顶点关联的
  link 闭路长度 $\ge6$"的直译。
  `[纠正]` 本笔记此前在此处写"$V-E+F=V-\frac{3F}2+\frac{2F}3=V-\frac{5F}6$"，把 $F=\frac23E$ 与
  $E=\frac32F$ 两个式子同时代入同一式，属**重复替换错误**；正确合并只保留一个：
  $3F=2E\Rightarrow E=\frac32F\Rightarrow V-E+F=V-\frac F2$。
  设 link girth $\ge m$（即 $2E\ge mV$），则
  \[
   V-E+F=V-\frac F2\le\frac{2E}{m}-\frac F2=\frac{3F}{m}-\frac F2=F\Bigl(\frac3m-\frac12\Bigr),
  \]
  右端 $\le0$ **当且仅当 $m\ge6$**。逐项：$m=6\to0$、$m=5\to+\frac{F}{10}$、$m=4\to+\frac F4$、
  $m=3\to+\frac F2$，后三者与 $V-E+F=2$ **不再矛盾**。
  ⇒ 结论与先前记载相反：$m=6$ 恰是这一 Euler 计数法的**临界值**，论文取 6 没有余量，
  girth 5 会直接使 `prop:sphere-counts` 的这条论证失效（论文逐字 "The first two imply
  $V-E+F\le0$, a contradiction"，`diagrams.tex:259–260`，用的正是 $m=6$ 的临界性）。
  `[推测]` 若要降到 girth 5，需另加输入（如对偶复形的额外面/顶点计数或边界类型有限性给的
  $V$ 上界），论文未提供此路线；证据来源：`diagrams.tex:240–260` 只有这三条关系。
- "including circuits formed by parallel edges"：把平行边构成的 2-环/1-环排除，否则 link 可能有 2 环，
  $2E\ge6V$ 崩塌（对偶顶点度数只算 2）。
- "Edges and triangles retain these identities"（胞腔带身份，即使顶点数据相同）：
  这是让"目标胞腔"可逐个计数（`prop:sphere-counts` 的"every individual target triangle $\tau$"）的前提。

(d) `[推测]` 失败路线：
1. 若 $\mathcal A$ 跨块共享生成子（例如令 $x_{ab}=x_{bc}$），块间交变多，$k=2$ 情形距离 3 不成立；
2. 若去掉 ℤ-化（$h$ 不赋 2），$g$、$gx_i$、$gh$ 可能重合 ⇒ 三角形有重边 ⇒ link 出现平行边/环；
3. `[推测]` Brady–McCammond 原文（`preprint Lemmas~2--3`）给出的是一般 $m,n,p$ 的角标复形，
   本篇只取 $m=n=p=3$；`[推测]` 作者先试图直接引用其非正曲率结论，但那需要整个 Artin 群而非 $T$，
   遂改为"we give direct proofs of the needed facts"（引言逐字）。证据来源：引言 126–130 行。
Lean 对应：`Winding.lean` 的 `LinkDirection`/`WireColor`（`:157 abbrev WireColor := L.CollapsedVertex × L.CollapsedVertex × LinkDirection`）
承载 link 方向；girth 论证的机器替身是 `TriangleMesh.lean:209 six_turns_injective`
（用 `rotate`/`turn` 两个置换的 6 次迭代注入性表达"六步不闭合"）与 `:235 degree_at_least_six`，
`:260 exists_link_backtrack`（无非回退 ⇒ 存在回退 ⇒ fold）——
**机器用 dart 置换代数代替了论文的 $k=2/3/\ge4$ 情形分析**（见 A-4）。

### A-2.20 约定 + 命题 5.3（`prop:sphere-counts`，`diagrams.tex` 129–263 行）：球面图示的符号计数恒为 0

(a) 原文逐字（combinatorial map 约定 + 陈述 + 方法归属）：

```tex
A combinatorial map to $\mathcal K$ will always include cell identities.
Each edge maps to a specified target edge, possibly with its
orientation reversed, or to a vertex.  Each triangle either maps
homeomorphically to a specified target triangle by its vertex
correspondence, or maps affinely into a specified target edge or
vertex.  These choices agree on common sides.  We call the latter
triangles collapsed.  Fix an orientation for every target triangle.
On an oriented source surface, a noncollapsed triangle has sign
$+1$ or $-1$ according to its map to that oriented target.

The proof below uses the classical diagrammatic-reducibility method of
deleting opposite faces and excluding a reduced spherical diagram by
curvature \cite[Definition~3.1 and Corollary~4.6]{Gersten1987}, here
keeping the identity of each target cell and allowing collapsed parameter
triangles.

\begin{proposition}\label{prop:sphere-counts}
For every combinatorial map from a finite triangulated oriented
two-sphere to $\mathcal K$, and every individual target triangle
$\tau$, the sum of the signs of all occurrences of $\tau$ is zero.
Collapsed triangles are allowed in the map and contribute zero.
\end{proposition}
```

(b) `[补]` 三段证明的中项：
1. **编码为三价图**：每个非塌缩源三角形画中心节点 + 三条腿到边中点；塌缩到边的三角形恰有两条非常数边，
   用一条弧连接它们的中点（两边映到同一带标号目标边）；塌缩到点的三角形不需弧。
   跨源边缝合 ⇒ 嵌入的三价图 + 可能无节点的闭曲线（丢弃）。节点记录一次目标三角形出现及其符号，
   图边配对"映到同一目标边的两条边"。
2. **细正则邻域 + 端点信息**：节点圆盘 + 边带；带两侧上"目标边端点的实际群标号"恒定
   （过边塌缩三角形在同一端点连接两侧；节点处夹住同一扇区的两条带侧携带该目标三角形对应角的标号）
   ⇒ 邻域的每条边界圆带**同一个**群顶点标号。对含节点的连通分支，逐边界圆加圆盘盖子并以该常数标号
   作对偶顶点 ⇒ 得到球面的带标号三角胞腔分解（节点↔面，图边↔边，边界圆↔顶点）。
   用到的平面拓扑事实（原文逐字）："a polygonal arc properly embedded in a disk cuts it into two disks"，
   做法：把连通平面图的生成树加厚成圆盘，其余边逐个作为带子加入，每条穿过一个互补圆盘并把它分成两个，
   最后剩余的边界圆加盖 ⇒ 球面；**顺带证明了该胞腔分解的 Euler 公式**（原文："This also proves the
   usual Euler formula for the resulting cell decomposition"）。
   标号规则排除的退化：图边不能连接同一节点的两条腿（腿代表不同目标边，带只有一个固定目标边）；
   一面两角不会成为同一对偶顶点（目标顶点标号互异）；**桥不存在**（桥的两侧带在同一条边界圆上，
   恒定性会令该目标边两端点相等，矛盾）；不同节点间的重边无害。
3. **折叠删除**：fold = 共边两面且跨同一目标边映到同一目标三角形 ⇒ 符号相反；
   取该边及两节点的小圆盘（切掉另四条腿的近节点部分），即使两节点间还有额外连接边，
   该"边 + 端点盘"仍是圆盘（额外边的中段在盘外）；若余下目标边记为 $i,j$，露出的腿的循环序为 $i,j,j,i$
   （容许反转与循环平移）⇒ 盘内 $i$ 连 $i$、$j$ 连 $j$ 不交叉地重连并删两节点；端点标号逐侧匹配
   ⇒ 保标号规则、平面性与每个目标的符号和；可能分离分支或产生无节点圆（丢弃），其余重新加盖。
4. **Euler 矛盾**：若仍有节点且无 fold，取一分支及其对偶球面分解；每个对偶顶点的依次角给出
   其实际目标顶点 link 里的一条闭路。若该闭路**回退**（backtrack），即共边两侧用了同一目标角，
   由 `eq:link-edges` 的精确角描述 ⇒ 两侧是同一个平移后的目标三角形 ⇒ 是 fold，矛盾；
   且必须是两个不同源面（一个面不会在同一对偶顶点用两个不同角，也不会用同一条带连自己两条边）
   ⇒ 无单面规避。于是所有 link 闭路非回退；有限非空闭非回退路含回路 ⇒ 引理 5.2 ⇒ 长 $\ge6$。
   以 $F,E,V$ 计（**按 incidence 计**，非单纯形）：$3F=2E,\,2E\ge6V,\,V-E+F=2$；前二式给 $V-E+F\le0$
   （$V\le E/3=F\cdot\frac{2}{9}\dots$ 精确：$E=\frac{3F}2,V\le\frac{2E}6=\frac F2$ ⇒ $V-E+F\le\frac F2-\frac{3F}2+F=0$ ✓），
   与 $=2$ 矛盾 ⇒ 每次都能删 fold，每次减 2 个节点 ⇒ 终止于无节点 ⇒ 所有符号和为 0。

(c) `[机械理由]`
- 为什么必须"individual target triangle"（逐个目标胞腔）而不是"总数"：`prop:triangle-obstruction` 的收束
  需要按 $\tau$ 分组求和（localization.tex 202–209 行 $\eta_\tau\times$(球内 $\tau$ 的带符号出现数)$=0$）。
- 为什么允许 collapsed 三角形：`lem:controlled-diagrams` 的构造**必然**产生塌缩片（常步 $1\in T$、
  扇形塌缩），若禁止塌缩则引理 5.4 无法产出合法图示。
- 为什么"incidences rather than distinct pairs of vertices are counted"：图示可能有重边/自环
  （上面"无害"的那条），按单纯形计会低估 $E$ 而使 Euler 不等式方向错。

(d) `[推测]` 失败路线：
1. 若 link girth 只保证 $\ge3$（例如三角块的边被识别成环），$V-E+F$ 可正 ⇒ 矛盾消失；
   `[分析]` 见 A-2.19(c) 的量化（已 `[纠正]`）：$V-E+F\le F(\frac3m-\frac12)$ 只在 $m\ge6$ 时非正
   ⇒ girth 5 亦崩溃，必需条件正是"$\ge6$"本身。
2. 若塌缩到边的三角形允许**三条**非常数边被识别，则节点弧的配对规则破坏 ⇒ 图不再三价；
3. `[推测]` Gersten 3.1/4.6 的原始形式不含"cell identity"与塌缩面，直接引用不成立；
   原文逐字"here keeping the identity of each target cell and allowing collapsed parameter triangles"
   ——该限定句即是"照抄失败后修补"的证据来源。
Lean 对应：`TriangleMesh.lean`（276 行）是**关键分歧点**：机器不构造正则邻域与平面加盖，而用
`structure TriangleMesh (F V)` + `Dart := F × Fin 3` + `mate/rotate/turn` 置换，
`:45 Exact`（`boundarySum.ker = coboundary.range`，`:150 exact_iff`）、
`:106 edge_card`（$2E=3F$）、`:111 coboundary`/`:124 boundarySum`（线性映射）、
`:180 exact_euler_inequality`（用 `finrank` 的有限维线性代数替代 Euler 计数）、
`:235 degree_at_least_six`。⇒ **平面拓扑被换成同调线性代数**（见 A-4）。
折叠删除的机器化在 `Folding.lean`（806 行：`foldPartner`、`splice`、`mesh`）+ `Wires.lean`（度 2 顶点压缩）。

### A-2.21 引理 5.4（`lem:controlled-diagrams`，`diagrams.tex` 275–428 行）：与 $f$ 无关的逐点图示控制

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:controlled-diagrams}
Suppose that $T$ acts geometrically on $Y$ and fix $y\in Y$.
There is a constant $C_1$, depending only on this action, $y$, and
the fixed presentation, with the following property.  Let $\Sigma$
be a triangulated parameter two-sphere, let $B$ be a subcomplex,
and let $f:\Sigma\to Y$ be continuous.  There is a refinement
keeping $B$ a subcomplex and a combinatorial map from the refined
sphere to $\mathcal K$ such that, for every final triangle $Q$,
every one of its group-vertex labels $s$, and every $p\in Q$,
\begin{equation}\label{eq:all-points-control}
  d_Y(sy,f(p))\le C_1.
\end{equation}
In particular $C_1$ is independent of $f$, its modulus of
continuity, and the number of triangles required.
\end{lemma}
```

(b) `[补]` 四段：
1. **一致边界类型**：取 $R$ 使每点距 $Ty$ 内 $R$（$Y=TK$ 时 $R=\max_{z\in K}d_Y(y,z)$）；
   由 (4.1) 取整数 $M$ 使 `eq:bounded-edge-word`：$d_Y(sy,ty)\le2R+1\Rightarrow d_T(s,t)\le M$；
   取 $D=\max\{d_Y(y,ay),d_Y(y,by),d_Y(y,cy)\}$。
   先一致细化（像直径 $\le1$，保持 $B$），顶点赋标号 $s_v$ 使 $d_Y(s_vy,f(v))\le R$；
   每条无向边选一条长 $\le M$ 的 Cayley 路径（反向用逆路径），**每端再各加三个常步** ⇒ 边长 $\le M+6$、
   每面边界为长 $\le3(M+6)$ 的带标号零环。相对原顶点标号只有**有限多种边界类型**
   （长度有界、字母取自 $\{a^{\pm1},b^{\pm1},c^{\pm1},1\}$）。
2. **填边界环**：保留选定原基点处的三个常步不动；忽略常步后的边界词在引理 5.1 的呈现中表示单位元
   ⇒ 落在关系子的正规闭包 ⇒ 有限次操作归约：自由插入/删除 $qq^{-1}$、插入/删除平移后的三角形关系环及其逆、
   常步移动；每个操作发生在**一个**目标边/三角形/顶点内；共轭 $wrw^{-1}$ 的实现 = 先经自由移动插入旅程 $ww^{-1}$，
   再在其尖端插入三角环 $r$。原文逐字："This proves the claimed finite reduction **without assuming a
   disk-diagram theorem**."所有操作都在保留的三常步之外 ⇒ 每个中间循环路径至少三条边。
3. **环带与扇形**：相邻两个循环实现为三角化环带的两条边界圆；不变边用"两端目标标号相同"的带，
   每带矩形剖成边塌缩或点塌缩三角形；非空替换弧之间是多边形，其顶点标号落在该操作使用的单个目标单形内。
   **空弧需要扇形而非顶点识别**（原文专段）：设一圆上弧 $p_0,\dots,p_k$ 在另一圆的 $q$ 处删除，
   区域含两条不同径向边 $qp_0,qp_k$ 与扇形三角 $qp_{j-1}p_j$；虽 $p_0,p_k,q$ 同群标号，
   $p_0,p_k$ 是**不同参数顶点**；$q$ 处前带、扇形、后带的 link 是一个区间 ⇒ 无捏合点；
   反转处理"在空弧插入"。保留的常步保证环带另一侧有非空不变部分。
   具体例（图 annulus.pdf）：五边循环（$xx^{-1}$ 往返 + 三条常步）删成三边循环，
   环带含两个塌缩到 $x$-边的扇形三角与三条不变带（六枚映到 $g$ 的三角形），内圆标签全为 $g$ 但仍是圆。
4. **逐点估计**：固定所有有限多个填充，归一化其原基点为 $1\in T$，令 $L$ 为其中出现过的标号的
   最大原字长 $d_T(1,s)$（私有生成子也是 $a,b,c$ 的字 ⇒ 有限；**与 $f$ 无关**）。
   以原顶点 $v_0$（标号 $s_0$）为基的平移填充里每个标号 $s$ 满足 $d_T(s_0,s)\le L$，于是
   ```tex
    d_Y(sy,f(p))
    \le d_Y(sy,s_0y)+d_Y(s_0y,f(v_0))+d_Y(f(v_0),f(p))
    \le DL+R+1.
   ```
   取 $C_1=DL+R+1$。

(c) `[机械理由]`
- $C_1=DL+R+1$ 的三项各管一段：$DL$ = 标号偏离（图论距离 × 生成子位移）、$R$ = 顶点级逼近误差、
  $+1$ = 像直径 $\le1$ 的细化保证。**关键**是"$p$ 是 $Q$ 内任意点"也仍 $\le C_1$：
  这来自"填充只依赖边界类型"这一有限性，而非 $f$ 的连续模。
- 为什么必须保留三个常步：环带构造要求"另一侧有非空不变部分"，且最终空循环可被锥形盖（三边常环）；
  若保留两个，删除操作可能把整条边界吃光 ⇒ 无法盖盘。
- 为什么 $L$ 与 $f$ 无关是命题的全部难点：若允许按 $f$ 选填充，$C_1$ 会随 $f$ 的连续模增长，
  `lem:localized-degree` 的 $2C_1$ vs $\delta n$ 比较失效（$\delta n$ 必须压过 $C_1$）。
- $M+6$、$3(M+6)$：$+6$ = 两端各三个常步；$3\times$ = 三角形三条边。

(d) `[推测]` 失败路线：
1. 若不使用"边界类型有限 + 每类型固定一个填充"，$C_1$ 依赖 $f$ ⇒ §6 的局部性失效；
   `[推测]` 这正是原文专门写"In particular $C_1$ is independent of $f$, its modulus of continuity,
   and the number of triangles required"的原因（预防性声明）。
2. 若把空弧的扇形写成"参数顶点识别"，会得到带捏合点的参数空间（不是流形）⇒ 绕数论证的
   "三角剖分球面"前提破坏；证据来源：原文"For precision, an empty arc requires a fan, not an
   identification of parameter vertices."——"For precision"是明显的修补语气。
3. `[推测]` 若直接引标准的"零伦曲线可被少面圆盘填充"（disk diagram theorem），
   会引入额外假设（图示单纯性/无塌缩）；原文逐字声明不用之（第 2 步末）。
Lean 对应：`WordDiagram.lean`（1088 行，全目录最大模块：字/边界类型/填充/常步）、
`Grid.lean`（`GridDisk.Vertex n (AngularSize n)`、`boundary_iff`、`sum_index_boundary`）、
`Refinement.lean`（细化保持子复形）、`Detour.lean:316` 的 `22+4*C+4*E`（机器版 $C_1$，
其中 $E$ 是边界类型枚举带来的附加项，论文未出现；见 A-4/A-5）。

### A-2.22 §6 补丁坐标 + 引理 6.1（`lem:projected-approximation`，`localization.tex` 3–107 行）：$q_n\to\kappa$

(a) 原文逐字（组合计划 + 补丁 + 投影 $J$ + 陈述）：

```tex
Projected mirror coordinates of its group-labelled vertices, extended
affinely over parameter triangles, will define a planar map
$q_n:\Sigma\to\mathbb R^2$ that approximates coordinates on a small
patch and has nonzero local winding.  Separation in $Y$ will force every
occurrence of a contributing target triangle into the patch, making that
winding a weighted sum of whole-sphere signed counts, which
Proposition~\ref{prop:sphere-counts} makes zero.
```

```tex
 B=[\lambda_0,\lambda_1]\times[\mu_0,\mu_1]
\]
in the interior of this sector, with \(\lambda_0,\mu_0>0\), and so small
and close to the origin that all its radii satisfy
\begin{equation}\label{eq:small-patch}
 0<r(p)<\min(\epsilon/3,1/4)\qquad(p\in B).
\end{equation}
```

```tex
\begin{equation}\label{eq:coordinate-projection}
 J\xi=\left(\frac{\xi_{D_u}-\xi_{D_{uv}}}{2},
                 \frac{\xi_{D_{uv}}}{2}\right).
\end{equation}
By \eqref{eq:mirror-translations},
\begin{equation}\label{eq:projection-identity}
 Jv_*(p)=\kappa(p)
\end{equation}
throughout the chosen sector.  This is a coordinate projection on that
sector; no global injectivity of \(J\) is asserted.

\begin{lemma}\label{lem:projected-approximation}
On \(B\), the maps \(q_n\) converge uniformly to \(\kappa\).
\end{lemma}
```

(b) `[补]` 中项：
1. **显式三角剖分**（原文提供具体做法而非存在性）：每个扇区取"两外顶点在该扇区边界射线上、半径 1"的三角形，
   六个三角拼成多边形锥盘 $Q$；沿径向线，其外半径 $\rho\ge\cos(\theta/2)>\sqrt3/2$
   `[分析]` 理由：半径 1 的扇区的两条边中点距圆心 $\cos(\theta/2)$，六块外接多边形至少覆盖到该半径；
   用固定 $Q$ 的径向同胚把 $Q$ 映到 $P$：半径 $\le1/2$ 处不动、$1/2$ 到 $\rho$ 线性、$\rho\mapsto1$；
   公共射线上这些映射相容；矩形 $B$ 逐点固定，其四边在该三角形内延长把三角形分成有限多个凸多边形，
   逐块三角化，另一盘把边界细分锥到新参数顶点。
2. **$J$ 的恒等式验证**：$v_*(\lambda,\mu)=\lambda L_u+\mu L_{uv}
   =\lambda\cdot2e_{D_u}+\mu\cdot2(e_{D_u}+e_{D_v}+e_{D_{uv}})$ ⇒
   $\xi_{D_u}=2(\lambda+\mu)$、$\xi_{D_{uv}}=2\mu$ ⇒ $J\xi=((2\lambda+2\mu-2\mu)/2,\,2\mu/2)=(\lambda,\mu)=\kappa$ ✓。
3. **$q_n$**：顶点标号 $s$ 赋平面值 $JV(s)/n$，在每个抽象三角形上仿射延拓。
4. **一致收敛链**：$d_Y(sy,t_n(p)y)\le C_1+C_0$（(5.2)+(4.5)）⇒ 经 (4.1)+(4.2) 得
   $\|V(s)-V(t_n(p))\|_1\le C_2$（$C_2$ 与 $n,p,s$ 无关）；
   由 (4.7) 第二式误差实为 $O(1/n)$ ⇒ $\|V(s)/n-v_*(p)\|_1=O(1/n)$ 一致；
   作用 $J$ 并用 `eq:projection-identity`；$q_n(p)$ 是这些顶点值的**凸组合** ⇒ 同样误差界。
   原文逐字强调："This is precisely where the all-points form of \eqref{eq:local-all-points} is used."

(c) `[机械理由]`
- $\epsilon/3$ 与 $1/4$：$\epsilon/3$ 给 `lem:localized-degree` 留三分之一的余量
  （$B'$ 上距 $y$ 至多 $(\epsilon/3)n+o(n)$，而盖帽上至少 $\epsilon n$，差 $2\epsilon n/3$）；
  $1/4$ 保证 $B\subset\{r<1/4\}$ 远离锥点，使 $v_*$ 在该处注入且扇区坐标唯一。
- $J$ 是**有界线性**（只依赖两个坐标）⇒ 保 $O(1/n)$；原文专写"no global injectivity of $J$ is asserted"
  ——这是"论文未述"的一条：$J$ 在整个 $E$ 上远非单射。
- 仿射延拓只在**抽象三角形坐标**下成立（"Affineness refers to the abstract triangle coordinates,
  regardless of the homeomorphisms used to place the triangles"）：因为 5.4 的填充把面与抽象盘同胚粘合，
  同胚不必仿射。

(d) `[推测]` 失败路线：
1. 若 $C_1$ 依赖 $f$（见 A-2.21），$C_2$ 无界 ⇒ $q_n$ 不收敛到 $\kappa$；
2. 若 $B$ 含锥点（$\lambda_0=\mu_0=0$），$\kappa$ 不连续 ⇒ 绕数无定义；$\lambda_0,\mu_0>0$ 是为此；
3. `[推测]` 若用全局坐标（例如 $E$ 的某个有限子空间上的同构投影）替代 $J$，会需要 $v_*$ 的全局仿射嵌入，
   而六扇区只给出**分片**线性 ⇒ `[推测]` 作者因此改成"逐扇区投影 + 补丁内成立"；
   证据来源：原文"That is a coordinate projection on that sector; no global injectivity…"。
Lean 对应：`SectorMetric.lean`（476 行：扇区的复嵌入 `:10 (p.1 + c*p.2) + (Real.sqrt (1-c^2)*p.2)*I`
与 `:118 2*Real.sqrt (1+r^2-2*c*r)+r < 2`——即 $\rho>\cos(\theta/2)$ 型半径界的机器形式）、
`GridDisk`/`Replacement`（网格与替换）、`Winding.lean`（$q_n$ 的标号与绕数）。

### A-2.23 绕数段 + 引理 6.2（`lem:localized-degree`，`localization.tex` 109–214 行）：局部度与命题 4.1 收束

(a) 原文逐字（绕数初等计数段 + 两条性质 + 陈述）：

```tex
For completeness, we spell out the elementary planar count we use.
For a loop avoiding a point $w$, choose continuous local arguments
of its vectors from $w$ on successive short parameter intervals.
Matching the arguments at their common endpoints gives a total angle
change in $2\pi\mathbb Z$.  Its quotient by $2\pi$ is the winding
number.  It is unchanged under a homotopy avoiding $w$: local angle
choices vary continuously, and a continuous integer-valued function is
constant.
```

```tex
\begin{enumerate}
\item the straight-line homotopy from $q_n|_{\partial B}$ to
      $\kappa|_{\partial B}$ avoids $w$;
\item every $p\in B$ with $q_n(p)=w$ lies in
      $\operatorname{int}B'$.
\end{enumerate}
Indeed, take the approximation error and the radius of $W$ smaller
than half the positive distance from $\kappa(p_*)$ to
$\kappa(B\setminus\operatorname{int}B')$.
For each large $n$, choose $w\in W$ avoiding every projected edge
of the entire finite sphere diagram.  A finite union of line segments
cannot contain an open ball, so this choice is possible.
```

```tex
\begin{lemma}\label{lem:localized-degree}
For all sufficiently large $n$, every occurrence in the sphere
diagram of a target triangle contributing to the winding count on
$B$ lies entirely in $\operatorname{int}B$.
\end{lemma}
```

(b) `[补]` 四段：
1. **面内求和公式**：有限定向三角盘仿射映到平面，$w$ 避开所有投影边；把各三角形边界的绕数相加，
   内边出现两次且方向相反 ⇒ 角度增量相消 ⇒ 和 = 外边界绕数。单个仿射三角形：$w$ 在其凸包外 ⇒ 贡献 0
   （可在凸包内收缩）；$w$ 在内部 ⇒ 贡献其定向符号（自 $w$ 的射线交边界一次、方向转一整圈）；
   退化三角形贡献 0（$w$ 避开其投影边）。
2. **$w$ 的选取**：$\overline W\subset\kappa(\operatorname{int}B')$；取误差与 $W$ 半径小于
   $\mathrm{dist}(\kappa(p_*),\kappa(B\setminus\operatorname{int}B'))$ 的一半 ⇒ (i)(ii)；
   再在每个大 $n$ 选 $w\in W$ 避开**整个球面图示**的有限多条投影边（"有限多个线段不能包含开球"）。
3. **非零局部绕数**：矩形 $\kappa(\partial B)$ 定向后绕 $w$ 的绕数为 $\pm1$ ⇒ $B$ 内三角形对 $w$ 的
   带符号覆盖数之和非零；每个贡献三角形非塌缩、像非退化，并含 $B'$ 中一个投到 $w$ 的参数点。
4. **局部性（引理 6.2 证明）**：由 (4.8) $B'$ 与 $P\setminus\operatorname{int}B$ 的 $f_n$ 像分离 $\ge\delta n$；
   第二盘上距 $y\ge\epsilon n$，$B'$ 上距 $y\le(\epsilon/3)n+o(n)$ ⇒ $B'$ 与球面其余部分互距 $\to\infty$ 一致。
   设贡献目标三角形 $\tau$ 的某次出现含 $p\in B'$ 使 $q_n(p)=w$；固定 $\tau$ 的三个群顶点标号之一 $s$，
   $\tau$ 的**每次**出现都带同一标号 $s$（含完整平移信息）；若某次出现碰到 $\operatorname{int}B$ 之外，取
   $p'$ 在该交集中，则 (6.1) 给 $d_Y(f_n(p),f_n(p'))\le d_Y(f_n(p),sy)+d_Y(sy,f_n(p'))\le 2C_1$，
   与 $\delta n$ 分离矛盾（也排除碰到 $\partial B$ 的出现）。
5. **命题 4.1 收束**：定向所有带标号目标三角形一次固定；其三个群顶点有固定的投影值 $JV(s)/n$ ⇒
   仿射平面像固定 ⇒ 若覆盖 $w$，其行列式有固定非零符号 $\eta_\tau\in\{1,-1\}$；
   某次出现的覆盖符号 $=\eta_\tau\times$（该出现相对所选定向的定向符号）。按 $\tau$ 分组，
   由引理 6.2 每个此类 $\tau$ 的**全部**出现都在 $B$ 内 ⇒ 其总贡献
   $=\eta_\tau\times$(球内 $\tau$ 的带符号出现数)$=0$（命题 5.3）⇒ 总和为 0，与绕数 $\pm1$ 矛盾；
   "Distinct target cells remain separate in this sum even if their projected vertex data agree"
   （胞腔身份在求和里保持——回指 A-2.19 的 identity 约定）。

(c) `[机械理由]`
- $2C_1$ vs $\delta n$：**这是全篇唯一把"与 $f$ 无关的常数"与"随 $n$ 线性增长的分离"直接对撞的地方**；
  若 $C_1$ 是 $O(n)$（例如来自 $f$ 的连续模），矛盾消失。
- 为什么用"$\tau$ 的所有出现共享同一顶点标号 $s$"：$\tau$ 是**带身份**的目标胞腔，其顶点对应
  $g,gx_i,gh$ 的固定平移 ⇒ 标号携带完整群元素，故一次出现即可锚定 $s$；若 $\tau$ 只记"形状"不记身份，
  这一步失效（命题 5.3 也必须按身份分组）。
- $\epsilon/3$ 的三倍分配：盖帽 $\epsilon n$、$B'$ $(\epsilon/3)n$、剩余 $2\epsilon n/3$ 留给 $o(n)$ 与图示误差。

(d) `[推测]` 失败路线：
1. 若 $W$ 选得太大（超出 $\kappa(\operatorname{int}B')$），(ii) 失效 ⇒ 贡献三角形可能落在 $B\setminus B'$，
   局部性论证仍可但 $\pm1$ 绕数不再保证由 $B'$ 内点产生；
2. 若 $q_n$ 的像**经过** $w$ 的边无法避开（无限多条），选 $w$ 失败——原文靠"整个图示有限"
   （命题 5.3 的有限性 + 每 $n$ 单独选 $w$）；`[推测]` 若试图对**所有** $n$ 统一选 $w$，
   会遇到可数多条线段（仍不能含开球，故其实可行）——但原文按 $n$ 分别选，说明作者谨慎回避了统一性；
3. `[推测]` 绕数替代方案是度理论/mod 2 计数；原文选整数带符号版是为了与 $\eta_\tau$ 的符号分配相容。
Lean 对应：`Winding.lean`（725 行）：`:9 passIndex`（弧/pass 的三值指标）、`:62 SimplicialLabeling`、
`:78/:79/:80 Active/Full/FullFace`（区分退化与完整面）、`:83 wire`、`:105 fullDartEquiv`、
`:114 ZeroEdge`/`:116 CollapsedVertex := Quot L.ZeroEdge`/`:135 collapsedLabel`
（把塌缩边商掉后仍保持标号）、`:447` 处 `Classical.choose`（选 $w$ 的机器化：绕数目标点的存在）。
`Detour.lean:286/:295` 处 `∑ j : Fin (AngularSize n), edge … = …` 与 `∑ f, face … = 1`
即"边界和 = 1"的机器形式，`GridDisk.sum_index_boundary` 承担内边相消。
命题 4.1 的机器出口：`SixSector.no_strict_ratios`（在 `Main.lean` 中被 `apply` 的那一条）。

### A-2.24 定义 7.1（`def:matrix`，`assembly.tex` 4–47 行）：116 生成子矩阵 $M$ 与 $G_0$

(a) 原文逐字：

```tex
We now combine the length restriction of Proposition~\ref{prop:braid-angle}
with the obstruction of Proposition~\ref{prop:triangle-obstruction}.
The additional generators in the following matrix make the group $T$ a
common centralizer.  This will produce a geometric action of $T$ from
any hypothetical geometric action of the full group.

\begin{definition}\label{def:matrix}
Let $\mathcal E=\{(a,b),(b,c),(c,a)\}$, as before, and set
\[
 S=\{a,b,c,d,e\}\ \sqcup
   \{s_j^{uv}:(u,v)\in\mathcal E,\ 3\le j\le39\}.
\]
All symbols in the second set are distinct.  For each $(u,v)\in\mathcal E$,
also write $s_1^{uv}=u$ and $s_2^{uv}=v$; these are aliases for existing
elements of $S$.  Define a symmetric matrix $M=(m_{st})_{s,t\in S}$ by
the following prescriptions:
\begin{enumerate}
\item $m_{ss}=1$ for every $s\in S$, and
      $m_{ab}=m_{bc}=m_{ca}=3$.
\item In each block $\{s_1^{uv},\ldots,s_{39}^{uv}\}$, set
      \[
      m_{s_i^{uv},s_j^{uv}}=
      \begin{cases}
      3,&|i-j|=1,\\
      2,&|i-j|\ge2.
      \end{cases}
      \]
\item For $q\in\{d,e\}$ and $u\in\{a,b,c\}$, set $m_{qu}=2$.
\item Every remaining off-diagonal entry is $\infty$.
\end{enumerate}
Let $G=A_M$ be the resulting Artin group, with the generators denoted
by the elements of $S$ themselves.  Let $G_0$ be the group presented
by the generators $S\setminus\{d,e\}$ and all their prescribed relations.
\end{definition}

Two distinct blocks meet in just one generator, so their prescriptions
do not conflict.  Each pair among $a,b,c$ is the initial pair of exactly
one block, with label $3$ in both prescriptions.  Thus the definition
specifies exactly one matrix, on
\[
 |S|=5+3\cdot37=116
\]
generators.  In particular $m_{de}=\infty$, and neither $d$ nor $e$
has a finite label with any of the private block generators.
```

(b) `[补]` 逐字清点：第二集合有 $3\times37=111$ 个符号（每块 $j=3,\dots,39$），加 $\{a,b,c,d,e\}$ 共 116；
块内标签：$|i-j|=1\Rightarrow3$（相邻三辫）、$|i-j|\ge2\Rightarrow2$（交换）⇒ 每块是型 $A_{39}$（$B_{40}$）Artin 群；
每块的 $s_1^{uv}=u,s_2^{uv}=v$ 是**别名**，故"块与 $T$ 共享前两个标准生成子"在矩阵层面表现为
$m_{uv}=3$ 与第 2 条 $i=1,j=2$ 的赋值**重合**（原文明说"with label 3 in both prescriptions"）⇒ 良定义。
两不同块只共享**一个**生成子（例如 $s_j^{ab}$ 与 $s_k^{bc}$ 只可能都是 $b$）⇒ 无冲突。
第 4 条"remaining"覆盖：$d$–$e$（$\infty$）、$d,e$ 与块内私有字母（$\infty$）、非相邻跨块私有字母（$\infty$）。

(c) `[机械理由]`
- **$m_{qu}=2$（$q\in\{d,e\}$，$u\in\{a,b,c\}$）**：给出 $d,e\in C_G(a)\cap C_G(b)\cap C_G(c)=C_G(T)$；
  `[分析]` $T$ 由 $a,b,c$ 生成，故与三者都交换即与 $T$ 交换。
- **$m_{de}=\infty$**：$d,e$ 之间无关系 ⇒ $B=T\times F(d,e)$ 里的 $F(d,e)$ 真是秩 2 自由群，
  `lem:common-centralizer` 第 2 步"约化字 $f$ 与 $d$ 交换 ⇒ $f=d^q$；再与 $e$ 交换 ⇒ $f=1$"才能用自由群约化字论证。
  若 $m_{de}=2$，$F(d,e)\to\mathbb Z\times\mathbb Z$，中央子群会变大，等式 $C_G(d)\cap C_G(e)=T$ 破坏。
- **"neither $d$ nor $e$ has a finite label with any private block generator"**：这是引理 7.3 证明里
  "$bdb^{-1}\in B\setminus T$"与"$gdg^{-1}\notin B$"用到的一般位置条件——块字母在 $B$ 中没有代表，
  故带 $G_0\setminus T$ 因子的交替字不可能等于 $d$。
- $G_0$ 单独定义（去掉 $d,e$）是为了让 (7.1) 的迭代 amalgam 与 (7.2) 的最后一步 $G\cong G_0*_T(T\times F(d,e))$ 分开陈述。

(d) `[推测]` 失败路线：
1. 若把 3 个块减到 2 个：$|S|=5+2\cdot37=79$，$T$ 只剩两对辫子 ⇒ 四扇区不闭合（A-2.12 已述）；
2. 若某块标签由 $B_{40}$ 改成广义（例如混入 $\infty$），`prop:braid-angle` 的 $B_{40}$ 关系前提失效；
3. `[分析]` 若 $d,e$ 与块内字母设 2（交换），$C_G(d)\cap C_G(e)$ 会包含块的部分中心 ⇒ 中央子群超出 $T$，
   引理 7.4 的 $Y$ 上 $T$-作用不再由"$C$ 不变 + cocompact"给出（$C$ 更大反而仍几何，但比值传递会失效，
   因为需要的是 $T$ 而非更大群上的**六扇区**结构）。
Lean 对应：`Model.lean` 的 `noncomputable def explicitMatrix`：
`if s=t then 1 else if Adjacent s t then 3 else if Distant s t ∨ Sentinel s t then 2 else ⊤`，
谓词 `Adjacent`/`Distant`（`Fin 39` 索引偏移 $\pm1$ / $\ge2$）、`Sentinel`（`s.val=3∨4 ∧ t.val<3`）；
`Letters := Fin 116`、`Label := WithTop ℕ`、`blockLetter b i` 把 $s_j^{uv}$ 编成
$5+37b+(j-2)$。第 4 条"remaining $=\infty$"在机器里就是 `else ⊤` 分支 ⇒ **四条 enumerate 与四个 if 分支一一对应**，
无遗漏（可判定性来自 `Fin` 上的 `decide`）。

### A-2.25 引理 7.2（`lem:pair-embeddings`，`assembly.tex` 51–134 行）：$B_3$ 嵌入与 token 状态不变量

(a) 原文逐字（陈述 + 关键的自我限定句）：

```tex
\begin{lemma}\label{lem:pair-embeddings}
For every $(u,v)\in\mathcal E$, the homomorphism
\[
 B_3=\langle t_1,t_2\mid t_1t_2t_1=t_2t_1t_2\rangle
 \longrightarrow T,
 \qquad t_1\longmapsto u,\quad t_2\longmapsto v,
\]
is injective.  For every $l\ge3$, the homomorphism $B_3\to B_l$
given by $t_1\mapsto s_1$ and $t_2\mapsto s_2$ is also injective.
\end{lemma}
```

证明末句逐字（防御性声明，务必收录）："The construction asserts a state invariant; it does not assert that
discarding the other tokens gives a homomorphism $B_l\to B_3$."
以及方法声明逐字："For the second assertion we construct a word invariant, retaining
the entire permutation of the strands as part of its state."

(b) `[补]` 两条注入性：
1. **$B_3\hookrightarrow T$**：设 $w$ 为 $\{a,b,c\}$ 中剩余者；$u\mapsto t_1,v\mapsto t_2,w\mapsto t_1$
   定义 $T\to B_3$（三关系分别成为：$uv$ 的辫子关系 = 定义关系；$vw$ 的 = 该关系两侧互换；
   $wu$ 的 = $t_1^3=t_1^3$ 平凡）⇒ 与所证包含的复合是 $B_3$ 的恒等 ⇒ 包含单射。`[补]`
   这是**收缩（retraction）论证**，不需正规形。
2. **$B_3\hookrightarrow B_l$（token 状态不变量）**：状态 = $l$ 个 token（名为 $1,\dots,l$）的全序表 +
   $q\in B_3$；token $1,2,3$ 为"selected"。读带号字母 $s_i^{\varepsilon}$：
   (i) **无论符号**交换位置 $i,i+1$ 的两个 token；(ii) 若两者都 selected，它们在 selected 短表中相邻，
   设占第 $j,j+1$ 位（$j\in\{1,2\}$，**在交换前计算**），则 $q\mapsto qt_j^{\varepsilon}$；
   (iii) 至多一个 selected ⇒ $q$ 不变。
   验证是**对所有状态的变换**而非只对初态：$s_i^{-1}$ 是 $s_i$ 的逆变换（第二次交换还原全表；
   若记录了字母，其 selected-表指标仍是 $j$ ⇒ 两字母相消）；
   $|i-k|\ge2$ 时两次交换涉及不相交位置对、终表相同；三个 selected token 中**至多一对**由两个 selected 组成
   ⇒ 另一对的交换不改变被记录对的 selected-指标（selected 越过 unselected 不改变 selected 表顺序）
   ⇒ 正交换关系保持；
   正辫子关系：记位置 $i,i+1,i+2$ 上的 token 为 $A,B,C$，$s_is_{i+1}s_i$ 依次交换 $(A,B),(A,C),(B,C)$，
   $s_{i+1}s_is_{i+1}$ 反序交换；两者终态都是 $C,B,A$ 且固定其余位置；
   按 $A,B,C$ 中 selected 的个数分 0/1、2、3 三种情形：前两种不记录或记录同一跨越同指标 ⇒ 相等；
   三种时记录分别为 $t_1t_2t_1$ 与 $t_2t_1t_2$ ⇒ 在 $B_3$ 中相等。
   ⇒ 所有正关系成立 ⇒ 经"每个定义关系子（及其逆、共轭）平凡 + 自由相消平凡" = **正规闭包刻画**，
   任意带号字等式被尊重；验证适用于任意带号前缀，且终表相同保证后缀处理一致。
3. **注入性收尾**：初态 $(1,\dots,l),q=1$；只用 $s_1^{\pm1},s_2^{\pm1}$ 的字始终在前三个 token 间交换，
   其记录 = 把 $s_i$ 换成 $t_i$ 的同一字（含符号）；字在 $B_l$ 中平凡 ⇒ 状态变换固定初态 ⇒ 记录在 $B_3$ 中平凡。

(c) `[机械理由]`
- 为什么要"retaining the entire permutation as part of its state"：若只记 selected 三元组的相对顺序，
  unselected token 的移动会改变 selected 表的指标 $j$（$s_3$ 型交换会把 $s_2$ 的 selected-位置推动），
  正交换关系的验证就失败；保留全表 ⇒ "至多一对双 selected"这一关键论断成立。
- "$j$ is computed before the swap"：否则 $s_1s_2s_1$ 与 $s_2s_1s_2$ 的记录序列在同一状态下可能不同序。
- "not merely of the initial state"：注入性论证要求关系作为**变换**相等（从而任意前缀后仍成立），
  只在初态验证只能得到"关系子固定初态"，不足以传递到任意字。
- 该引理的两个结论各自被下游使用：第一条给 $B_3^{uv}\hookrightarrow T$（amalgam 的公共子群嵌入），
  第二条给 $B_3^{uv}\hookrightarrow B_{40}^{uv}$（同一子群在块内嵌入）⇒ `lem:amalgam-normal-form` 的前提。

(d) `[推测]` 失败路线：
1. 若把 selected 集合扩到 4 个 token（`SelectedPositions` 在机器里允许 `card ≤ 3`，见下），
   "至多一对双 selected"不再成立 ⇒ 正交换关系的记录序可能不同；
   `[分析]` 机器取 `card ≤ 3` 恰好对应论文的"3 个 selected token"；
2. `[推测]` 若不保留全排列而用 Artin 群已知的 $B_3\hookrightarrow B_l$（如通过 Garside 正规形/cremona），
   会引入远超本文需要的理论；原文选择初等状态不变量，且**明确否认**更强的同态断言（末句）；
3. 若第一条的收缩 $T\to B_3$ 把 $w$ 映到 $t_2$ 而非 $t_1$，$wu$ 关系变成 $t_2t_1t_2=t_1t_2t_1$
   （仍成立）但 $uv$、$vw$ 关系中之一变成 $t_1^3=t_1^3$——同样可用；`[分析]` 三种指派都行，原文取一种。
Lean 对应：`Braids.lean:462 abbrev SelectedPositions := {s : Finset ℕ // s.card ≤ 3}`、
`:464 swapPositions`、`:479 selectedPrefix`（= "交换前的 selected-指标 $j$"）、
`:525 selected_not_four`、`:573 swapPositions_braid`、`:591 tokenRecord`、`:600 TokenState`、
`:602 tokenPerm`、`:610/:623 tokenPerm_distant/braid`；
`Presentation.lean:86 braidTokenRepresentation`（`BraidGroup n →* Equiv.Perm (TokenState (BraidGroup 2))`）、
`:119 braidTokenRepresentation_two_injective`、`:125 initialBraidInclusion`、
`:130 initialBraidInclusion_injective`（第二条注入性）；
`:170 trianglePair`、`:178 trianglePairRetraction`、`:184 trianglePair_leftInverse`、
`:191 trianglePair_injective`（第一条注入性 = 收缩复合恒等的机器形式）。

### A-2.26 引理 7.3（`lem:amalgam-normal-form`）+ (7.1)(7.2)（`assembly.tex` 136–239 行）：Amalgam 正规形与迭代分解

(a) 原文逐字（方法归属 + 陈述 + 两个同构式）：

```tex
We use the standard normal-form theorem for free products with
amalgamation; see Serre \cite[Chapter~I, \S1.2, Theorems~1--2]{Serre1980}.
The elementary proof below records the exact form needed here, including
the case in which multiplication removes the final representative.

\begin{lemma}\label{lem:amalgam-normal-form}
Let $H_1,H_2$ be groups with a common embedded subgroup $E$, and
let $H_1*_E H_2$ be the group obtained by identifying the two copies
of $E$ in their free product.  Each factor embeds in this group,
and their intersection is $E$.  A product $a_1\cdots a_n$, $n\ge1$,
whose factors belong alternately to $H_1\setminus E$ and
$H_2\setminus E$ is nontrivial.  If such a product contains a
factor from $H_i\setminus E$, it does not belong to the other factor.
\end{lemma}
```

```tex
\begin{equation}\label{eq:iterated-amalgam}
 G_0\cong
 \bigl((T*_{B_3^{ab}}B_{40}^{ab})
       *_{B_3^{bc}}B_{40}^{bc}\bigr)
       *_{B_3^{ca}}B_{40}^{ca}.
\end{equation}
```

```tex
\begin{equation}\label{eq:full-amalgam}
 G\cong G_0*_T B
       =G_0*_T\bigl(T\times F(d,e)\bigr).
\end{equation}
```

(b) `[补]` 证明是**状态机式**的（154–205 行），逐段：
1. 取右陪集代表集 $R_i\subset H_i$：每个 $H_i$ 元素唯一写成 $re$（$r\in R_i,e\in E$），$1$ 代表 $E$。
   形式状态 $(r_1,\dots,r_n;e)$，$n\ge0$，$r_j\ne1$ 且类型交替，代表元**保留类型**。
2. 定义"用 $h\in H_i$ 右乘状态"：末位类型为 $i$ 时把尾部 $re$ 与该代表元一起提出；否则用缺省代表元 $r=1$。
   前缀 $P$ 为空或以另一因子结尾。把 $reh\in H_i$ 唯一分解为 $r'e'$，用 $r';e'$ 替换尾部（$r'=1$ 时省略）。
3. **右作用验证**（原文的微妙处）：乘 $h$ 后前缀 $P$ 不变；再乘 $k\in H_i$ 时尾部从 $r'e'k=(reh)k$ 重写；
   若 $r'=1$ 被省略，规则改用缺省 $1$ 并重写 $e'k$，结果相同 ⇒ 结合性给出 $hk$ 的操作；
   乘 $1$ 恒等、乘 $h^{-1}$ 是逆。
4. $h\in E$ 时两因子的作用都只改末端的 $e\to eh$ ⇒ 两作用在 $E$ 上一致 ⇒ 得到所呈现 amalgam 的右作用。
5. 每个状态由 $(\,;1)$ 读字 $r_1\cdots r_ne$ 达到；反之对任意字跑算法只用 amalgam 中的合法等式，
   产出该形字；若两个状态字在 amalgam 中相等，则它们在 $(\,;1)$ 上的作用相同 ⇒ 存在性与唯一性；
   由此因子嵌入与交集为 $E$。
6. 交替积 $a_1\cdots a_n$（$a_j\notin E$）：每步"末端 $E$-元素 × $a_j$"仍在 $E$ 外，且类型与前一位不同
   ⇒ 恰好追加一个新非恒等代表元 ⇒ 正规形恰有 $n$ 个代表元 ⇒ 非平凡，且不属任何类型缺少这些代表的因子。
7. (7.1)：反复用 7.3（每步 $T$ 保持嵌入 ⇒ 下一个附着子群也嵌入）；"presentations agree"逐字：
   识别每块前两个生成子为该块指定的 $T$ 中一对，恰剩定义 $G_0$ 的生成子与关系。
8. (7.2)：$B=T\times F(d,e)$ 有 $T$ 的呈现 + 两个自由生成子 + $\{d,e\}$ 与 $\{a,b,c\}$ 的**六条**交换关系；
   原文逐字验证："the commutations move every $T$-letter to the left of every free letter;
   the evident homomorphism to the direct product and the two commuting factor homomorphisms are
   inverse on the generators." 与定义 7.1 比较 ⇒ $G\cong G_0*_TB$。

(c) `[机械理由]`
- 为什么"including the case in which multiplication removes the final representative"被专门写进方法说明：
  第 3 步的 $r'=1$ 省略分支是状态机能否成为**作用**的唯一障碍；多数教科书陈述只给"约化字唯一"，
  省略该分支会让"结合性"证明留下漏洞。
- 第 6 步"恰追加一个"依赖 $E$ 在 $H_i$ 中的**右陪集**分解（不是双侧）：正因如此
  `lem:common-centralizer` 才能把 $g$ 写成 $g=wb$ 并把末尾 $T$-元素吸进 $b$。
- (7.1) 的**左折叠**括号顺序 $(\cdots)*_{B_3^{ca}}$：三块依次附着 ⇒ 每步公共子群是某 $B_3^{uv}$，
  其嵌入由 A-2.25 双向提供。

(d) `[推测]` 失败路线：
1. 若三块共享的不再是 $B_3$（型 $A_2$）而是更大子群（如 $B_4$），两块的关系会互相污染，
   "presentations agree"失效；
2. 若 $d,e$ 与 $a,b,c$ 的六条交换关系少写一条，(7.2) 的 $B$ 不再是直积 ⇒ $F(d,e)$ 的约化字论证失效；
3. `[推测]` 原文自证 Serre 定理（而非引用）的动机是"records the exact form needed"——
   机器化需要可计算的正规形算法；证据来源：136–141 行的逐字声明。
Lean 对应：**机器不重证 Serre**，而是使用 Mathlib 的 `Monoid.PushoutI`/`NormalWord`/`Transversal`：
`Embeddings.lean:7 open Monoid Monoid.CoprodI Monoid.PushoutI Monoid.PushoutI.NormalWord`，
`:31/:40/:57/:103 normal_reduced/:114` 等引理直接在 `NormalWord d` 上工作
（`:103 lemma normal_reduced (d : Transversal φ) (w : NormalWord d) : Reduced φ w.toWord`）。
分步 amalgam 对象 `A₁,A₂,A₃` 与 `back₁,back₂,back₃`（`:584/:589/:598`）、`fromModel/back₃`（`:612`）、
`productMain`（`:576`，用 `noncommCoprod` 造 $T\times F(d,e)\to B$）、
`toModel_injective`（`:656`）与 `main_common_centralizer`（`:671`，即引理 7.4 的机器形）。
⇒ **这是论文与机器化差异最大的一处**（A-4 详述）。

### A-2.27 引理 7.4（`lem:common-centralizer`，`assembly.tex` 241–285 行）：$C_G(d)\cap C_G(e)=T$

(a) 原文逐字：

```tex
\begin{lemma}\label{lem:common-centralizer}
For the elements $d,e$ of $G$,
\[
 C_G(d)\cap C_G(e)=T.
\]
\end{lemma}
```

(b) `[补]` 双向：
1. $\supset$：由呈现（六条交换关系）。
2. $C_G(d)\subset B$：设 $g\notin B$，其 (7.2) 正规形写成 $g=wb$，$b\in B$，$w$ 是非空交替积
   且**末因子在 $G_0\setminus T$**（把末端 $T$-元素与（若存在的）最后 $B$-代表元吸进 $b$；
   $g\notin B$ 保证至少有一个 $G_0$-代表元）。
   沿投影 $B\to F(d,e)$，$bdb^{-1}$ 映到非恒等自由生成子 $d$ 的共轭 ⇒ $bdb^{-1}\in B\setminus T$。
   于是 $gdg^{-1}=w(bdb^{-1})w^{-1}$ 按引理 7.3 意义下**约化**：中间因子在 $B\setminus T$、
   两侧邻因子在 $G_0\setminus T$、其余相邻交替 ⇒ 含 $G_0\setminus T$ 因子 ⇒ 不属于 $B$ ⇒ 不等于 $d$。
3. $B$ 内部：$f\in F(d,e)$ 约化字与 $d$ 交换 ⇒ 写成 $f=vd^q$（去掉末尾最长 $d$-串，$v$ 空或以 $e^{\pm1}$ 结尾）
   ⇒ $fdf^{-1}=vdv^{-1}$；$v$ 非空时该字自由约化、长 $2|v|+1>1$ ⇒ 不等于 $d$ ⇒ $f=d^q$；
   $q\ne0$ 时 $d^qed^{-q}$ 自由约化且 $\ne e$ ⇒ 只有单位元同时与 $d,e$ 交换
   ⇒ $(t,f)\in T\times F(d,e)$ 中心化二者 $\iff f=1$。

(c) `[机械理由]`
- 第 2 步的两个关键都来自 $m_{de}=\infty$ 与 $d,e$ 对块内私有字母无有限标签：
  投影 $B\to F(d,e)$ 存在**当且仅当** $B=T\times F(d,e)$ 是直积；
  $bdb^{-1}\in B\setminus T$ 要求其 $F(d,e)$-分量非平凡。
- "$w^{-1}$ 的写法"隐含一个技术点：$w^{-1}$ 的类型仍与 $w$ 末因子同属 $G_0$，
  所以 $w(bdb^{-1})w^{-1}$ 的首尾相邻对是"$G_0$–$B$"型（约化）——若 $bdb^{-1}$ 落入 $T$，
  中间因子会被吸掉，约化性丧失 ⇒ 这正是必须"非恒等自由生成子的共轭"的机械原因。
- 第 3 步是自由群 $\mathrm{C}_{F(d,e)}(d)=\langle d\rangle$ 的初等证明，无需任何深定理。

(d) `[推测]` 失败路线：
1. 若哨兵只有一个（只用 $d$），$C_G(d)$ 会含 $\langle d\rangle$ 与 $T$ 之外的元素（如 $G_0$ 中某些字），
   无法把 $Y$ 的不变群精确钉成 $T$；两个哨兵的"共同中央子群"是为了**消掉** $\langle d\rangle,\langle e\rangle$；
2. 若 $m_{de}=2$（$F(d,e)$ 变 $\mathbb Z^2$，交换），第 3 步"只有单位元同时与两自由生成子交换"仍成立
   （$\mathbb Z^2$ 中 $f$ 与 $d$ 自动交换 ⇒ 中央子群是整个 $\mathbb Z^2$）⇒ **失效**：
   `[分析]` 直积情形 $C_{\mathbb Z^2}(d)=\mathbb Z^2$，$C_G(d)\cap C_G(e)\supsetneq T$。这正是 $m_{de}=\infty$ 的机械必要性。
3. `[推测]` 若试图用 $G_0$ 上的共轭作用论证代替正规形，需要对 $G_0$ 的共轭分离性，论文未建立。
Lean 对应：`Embeddings.lean:671 main_common_centralizer (g : MainGroup) (hg : ∀ i, Commute g (sentinelMain i)) :
g∈triangleMain.range`；配套 `:553 sentinelMain`（`if i then mainGen 4 else mainGen 3` = $d/e$）、
`:565 freeMain : FreeTwo.GroupOf →* MainGroup`（自由群由 `FreeTwo` 模块提供）、
`:567 factors_commute`、`:579 productMain_triangle`；
约化性用 Mathlib 的 `PushoutI`/`NormalWord`（见 A-2.26），机器里"$bdb^{-1}\in B\setminus T$"对应
`:114` 那条"与 `PushoutI.of k q` 交换 ⇒ 落在 $( \mathrm{of}\ k).\mathrm{range}$"型引理的 contrapositive 使用。

### A-2.28 引理 7.5（`lem:geometric-centralizer`，`assembly.tex` 287–384 行）：次水平集上的几何作用

(a) 原文逐字（前置文献定位 + 陈述）：

```tex
Geometric actions of centralizers on minimum-displacement sets are
classical.  Swenson \cite[Theorem~13]{Swenson1999} credits this result
to Ruane \cite{Ruane2001}; Swenson also studies intersections of convex
subgroups, and his proof of Theorem~17 treats simultaneous centralizers
\cite[Theorems~16--17]{Swenson1999}.  The following finite-tuple
compactness argument gives the precise common-displacement-sublevel
formulation needed here.  It applies in every dimension and does not
require the elements being centralized to commute.

\begin{lemma}\label{lem:geometric-centralizer}
Suppose a group $H$ acts geometrically on a nonempty proper CAT(0)
space $X$.  For finitely many elements $q_1,\ldots,q_m\in H$,
$m\ge1$, set
\[
 C=\bigcap_{j=1}^m C_H(q_j).
\]
If $A\ge0$ is finite and the set
\[
 Y_A=\{x\in X:d_X(x,q_jx)\le A\text{ for }1\le j\le m\}
\]
is nonempty, then $Y_A$, with its inherited metric, is a proper
CAT(0) space, invariant under $C$, and the restricted $C$-action
is geometric.  Every element of $C$ has the same stable translation
length in $Y_A$ as in $X$.
\end{lemma}
```

(b) `[补]` 五段：
1. **闭凸**：$x\mapsto d_X(x,q_jx)$ 连续；凸性用 `eq:distance-convexity`：$\gamma$ 为 $x_0\to x_1$ 的测地线，
   $q_j\gamma$ 为 $q_jx_0\to q_jx_1$ 的测地线 ⇒ $d_X(\gamma(t),q_j\gamma(t))\le(1-t)d_X(x_0,q_jx_0)+td_X(x_1,q_jx_1)$。
   ⇒ $Y_A$ 闭凸；其测地三角形与度量从 $X$ 继承 ⇒ CAT(0)；$Y_A$ 中闭有界集在 $X$ 中闭有界 ⇒ 紧（用空间 proper）
   ⇒ $Y_A$ 是**真** CAT(0)。
2. **不变性**：$c\in C$ ⇒ $d_X(cx,q_jcx)=d_X(cx,cq_jx)=d_X(x,q_jx)$（$q jc=cq_j$ + 等距）。
3. **作用 proper**：$Y_A$ 的紧子集在 $X$ 中紧 ⇒ 用 $X$ 上的条件。
4. **cocompact（核心）**：取紧 $K$ 使 $HK=X$，$L=\{z:d_X(z,K)\le A\}$ 闭有界 ⇒ 紧（proper），
   $\mathcal F=\{r\in H:rL\cap L\ne\varnothing\}$ 有限。若 $hK\cap Y_A\ne\varnothing$，取 $p\in K$ 使 $hp\in Y_A$，
   则对每个 $j$：$d_X(p,h^{-1}q_jhp)=d_X(hp,q_jhp)\le A$ ⇒ $p$ 与 $h^{-1}q_jh p$ 都在 $L$ ⇒ $h^{-1}q_jh\in\mathcal F$
   ⇒ 有序 $m$-元组 $(h^{-1}q_1h,\dots,h^{-1}q_mh)$ 只有有限多可能，取其代表 $h_1,\dots,h_N$；
   若 $h$ 与 $h_i$ 同元组 ⇒ $(hh_i^{-1})q_j(hh_i^{-1})^{-1}=q_j\ \forall j$ ⇒ $hh_i^{-1}\in C$
   ⇒ $h\in Ch_i$（原文加注"right coset, in the standard convention"）。
   令 $K_C=Y_A\cap\bigcup_{i\le N}h_iK$（紧）：给定 $x\in Y_A$ 写 $x=hp$，取同元组代表 $h_i$，$h=ch_i$
   ⇒ $c^{-1}x=h_ip\in Y_A\cap h_iK$ ⇒ $x\in CK_C$。
5. **稳定长度相同**：$y\in Y_A,c\in C$ ⇒ $d_{Y_A}(y,c^ny)=d_X(y,c^ny)$（继承度量）⇒ 除 $n$ 取极限。

(c) `[机械理由]`
- **有限元组技巧**是本引理全部：把"$h$ 把 $K$ 搬到 $Y_A$"翻译成"$h$ 的 $m$-元共轭元组落在有限集"，
  从而 $h$ 只有有限多个 $C$-右陪集 ⇒ cocompact。若 $m$ 无限（例如对全体 $T$ 取中央化子）元组不再有限
  ⇒ 论证崩；这里 $m=2$（$d,e$）正是哨兵设计的价格。
- $A$ 必须**有限且给定**，并要求 $Y_A\ne\varnothing$：$A\ge\max\{d(x_0,dx_0),d(x_0,ex_0)\}$ 在定理证明里保证。
- "does not require the elements being centralized to commute"：$d,e$ 恰好**不**交换（$m_{de}=\infty$），
  故 Swenson 的单个元素定理不够，必须用同时中央化子的版本；原文逐字声明这一点。
- 稳定长度相等只需 $Y_A$ 对 $C$ 不变 + 度量继承 ⇒ 这是把 §3 的比值"搬运"到 $T$-作用的唯一接口。

(d) `[推测]` 失败路线：
1. 若 $X$ 不 proper，$L$ 不紧 ⇒ $\mathcal F$ 无限 ⇒ cocompactness 失效；
2. 若改用"最小位移集"（$\{x:d(x,q_jx)=\inf\}$，Swenson/Ruane 的形式）而非**次水平集**，
   空集风险与稳定长度相等都需要额外论证（次水平集非空由 $A$ 的取法显然保证）；
   `[推测]` 原文那句"gives the precise common-displacement-sublevel formulation needed here"
   正是对这条替代路线的说明性拒绝——证据来源：该句位置在文献段与方法句之间。
3. 若 $C$-作用的等距性不被 $Y_A$ 限制（例如 $c$ 把 $Y_A$ 映到自身但度量不同），第 5 步失效；
   机器侧靠 `sublevelAction_stableLength` 的 `rfl` 成立 ⇒ **度量继承**在 Lean 里是 ` subtype` 的实例，
   等式是定义级的（见下）。
Lean 对应：`Centralizer.lean`（202 行）：`:11 GeodesicallyConvex`、`:15 CAT0_subtype`、
`:44 tupleCentralizer (q : ι → G) : Subgroup G`、`:50 displacementSublevel`、
`:53 _closed`、`:61 _convex`、`:73 _smul`、`:89 sublevelAction_isometry`、`:97 sublevelAction_proper`、
`:113 sublevelAction_cocompact [Finite ι] [ProperSpace X] [Nonempty X]`（**有限元组技巧**的机器形式，
用 `Fintype.ofFinite ι` 与 `Set.Finite` 的元组枚举）、`:169 geometric_tupleCentralizer`（合装）、
`:182 sublevelAction_stableLength`（证明体只有 `rfl`）、`:188 exists_sublevel_nonempty`
（取 $A=\sum_i\mathrm{dist}(x,q_i x)$）、`:196 sublevel_properSpace`（`ProperSpace.of_isClosed`）。

### A-2.29 定理 1.1 的证明（`assembly.tex` 386–425 行）：收束

(a) 原文逐字（全文，因短且关键）：

```tex
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Let $M$ be the explicit finite matrix of Definition~\ref{def:matrix}.
Suppose, for a contradiction, that $G=A_M$ acts properly and
cocompactly by isometries on a nonempty proper CAT(0) space $X$.
No restriction is placed on the dimension of $X$.

Choose $x_0\in X$ and a finite number
\[
 A\ge\max\{d_X(x_0,dx_0),d_X(x_0,ex_0)\}.
\]
The set
\[
 Y=\{x\in X:d_X(x,dx)\le A,\ d_X(x,ex)\le A\}
\]
contains $x_0$.  By Lemmas~\ref{lem:common-centralizer} and
\ref{lem:geometric-centralizer}, $T$ acts geometrically on $Y$,
and its stable lengths there agree with its stable lengths in $X$.

Sending every Artin generator of $G$ to $1\in\mathbb Z$ defines
a homomorphism $G\to\mathbb Z$: both sides of each defining
Artin relation have the same number of letters.  In particular,
every squared generator maps to $2$ and has infinite order.
Lemma~\ref{lem:semisimple} therefore gives
$\ell_X((s_1^{uv})^2)>0$ for each $(u,v)\in\mathcal E$.
The corresponding embedded $B_{40}$ block satisfies all the
relations required by Proposition~\ref{prop:braid-angle}, so that
\[
 \frac{\ell_X((uv)^3)}{3\ell_X(u^2)}
 =\frac{\ell_X((uv)^3)}{3\ell_X(v^2)}
 >\frac12
 \qquad ((u,v)\in\mathcal E).
\]
Equality of stable lengths transfers all three strict inequalities
to the geometric $T$-action on $Y$.  This contradicts
Proposition~\ref{prop:triangle-obstruction}.

The $116$-generator Artin group $A_M$ therefore has no proper
cocompact isometric action on any nonempty proper CAT(0) space.
This is the required counterexample.
\end{proof}
```

(b) `[补]` 五步装配：①假设 $G$ 几何作用于 $X$；②$A$ 的取法使 $Y\ne\varnothing$（含 $x_0$）；
③7.4 + 7.5 ⇒ $T\curvearrowright Y$ 几何且稳定长度继承；④增广 $G\to\mathbb Z$ ⇒ 每个平方生成子像 2 ⇒
无限阶 ⇒ 引理 2.2 ⇒ $\ell_X((s_1^{uv})^2)>0$；⑤A-2.25 的嵌入使 $B_{40}$ 块在 $G$ 中满足 `prop:braid-angle`
全部前提 ⇒ 三对比值 $>1/2$ 在 $X$ 中成立 ⇒ 传到 $Y$ ⇒ 与命题 4.1 矛盾。

(c) `[机械理由]`
- "**No restriction is placed on the dimension of $X$.**"：作者用一整句独立陈述"任意维"这一卖点，
  与引言 133–134 行"It does not require a triangulation or a dimension bound on the unknown CAT(0) space"呼应。
- 增广 $G\to\mathbb Z$ 的存在性理由极具体："both sides of each defining Artin relation have the same
  number of letters"——交错字关系两侧同长 ⇒ 全部生成子赋 1 是良定义同态。$\infty$ 标签不产生关系，
  故不受影响。
- $\ell_X((s_1^{uv})^2)>0$ 只需**每块第一个**生成子的平方，因为 `prop:braid-angle` 的前提只有
  $\ell(s_1^2)>0$；其余平方等长由 `eq:braid-shift` 共轭给出。
- 传递用的是 $(uv)^3=z_{uv}$ 在块内 = $Z_3$、在 $T$ 内是同一个字 ⇒ 无需额外引理。

(d) `[推测]` 失败路线：
1. `[分析]` 若 $G\to\mathbb Z$ 不存在（例如某关系两侧长度不等，一般 Artin 型 $I_2(m)$ 交错字仍等长，
   但若加入非齐次关系就会失效），$\ell(u^2)>0$ 无从保证，引理 2.2 的"$\ell=\min$"可能给 0，
   比值 $>1/2$ 变成 $0/0$；
2. 若次水平集 $Y$ 上的稳定长度**不等于** $X$ 上的（比如只证 $\le$），比值条件在 $T$ 上不成立，矛盾不产生；
3. `[推测]` 若哨兵设计改成"$d$ 单个元素 + 其轴"，需要 Swenson 单元数定理且要求 $d$ 的双曲型，
   在 Artin 群中不易验证 ⇒ `[推测]` 这是选"两个哨兵的共同中央子群"的原因。
证据来源：原文对 7.5 的"finite-tuple""does not require … to commute"两句限定。
Lean 对应：`Main.lean:26 not_geometric` 的证明体逐字即本五步：
```lean
obtain ⟨A,hA,hY⟩ := exists_sublevel_nonempty (X:=X) sentinelMain
let Y := displacementSublevel (X:=X) sentinelMain A
let : Nonempty Y := hY
let : ProperSpace Y := sublevel_properSpace hG.2.1 sentinelMain A
let := sublevelAction hG.2.1 sentinelMain A
have hC := geometric_tupleCentralizer hG sentinelMain A hA
let := MulAction.compHom Y triangleCentralizer
have hT : GeometricAction TriangleGroup Y := geometric_compHom triangleCentralizer triangleCentralizer_bijective hC
let y : Y := Classical.choice inferInstance
apply SixSector.no_strict_ratios hT y
...
have hr := (braid_forty_ratio hG y.val (blockMain_relations i) hp).2.1
```
其中 `generator_square_positive explicitMatrix hG y.val (corner i)` 是"增广 + 引理 2.2"的合并机器形式；
`triangleCentralizer_bijective`（`Embeddings.lean:683`）把"$C_G(d)\cap C_G(e)=T$"写成**双射同态**，
故 `geometric_compHom` 直接搬运几何作用——机器侧不出现"中央子群等式"的集合式陈述。

## A-3 叙事时间线（Artin 篇）

### A-3.0 体量与结构（可核对的客观数据，全部来自 TeX 源码统计）

| 文件 | 行数 | 字节 | `\begin{equation}` | 图 | 定理类环境 |
|---|---|---|---|---|---|
| `main.tex` | 22 | 645 | — | — | 摘要 3 句 |
| `macros.tex` | 29 | 1031 | — | — | — |
| `sections/introduction.tex` | 158 | 7917 | 0 | 0 | 定理 1.1（`thm:main`）+ 2 个 `\subsection*` |
| `sections/lengths.tex` | 251 | 10916 | 8 | 0 | 引理 2.1–2.4 |
| `sections/braids.tex` | 213 | 8157 | 9 | 0 | 命题 3.1、引理 3.2 |
| `sections/sectors.tex` | 374 | 15446 | 13 | 1 | 命题 4.1、引理 4.2–4.6 |
| `sections/diagrams.tex` | 428 | 21346 | 5 | 2 | 引理 5.1–5.2、命题 5.3、引理 5.4 |
| `sections/localization.tex` | 214 | 10242 | 4 | 0 | 引理 6.1–6.2 + 命题 4.1 证明 |
| `sections/assembly.tex` | 425 | 18683 | 2 | 0 | 定义 7.1、引理 7.2–7.5 + 定理 1.1 证明 |
| `references.tex` | 126 | 5011 | — | — | 18 条 bibitem |

`[事实]` 全篇 **27 个编号条目**（1 定理 + 4 命题 + 15 引理 + 1 定义 + 6 个非编号段落块），
**0 个 `remark` 环境、0 个 `corollary` 环境**（grep `begin{remark}`/`begin{corollary}` 无命中）：
所有"注"都以普通段落形式内嵌（例如 Crisp–Paoluzzi 注、Crisp 角和注、"we do not claim" 两句）。
⇒ 叙事风格判断：**没有反思性段落，只有推进性段落**；防御性内容全部以句子而非环境的形式出现，
因此 (A-3.2/A-3.3) 的清单只能按句子定位。
`[事实]` 图仅 3 张（`figures/sectors.pdf`、`figures/fold.pdf`、`figures/annulus.pdf`），**均为 PDF，
目录内无 `.tex`/`.typst` 图源**（与双曲篇不同：那边有 `figures/fano-template.tex` 等）
⇒ 图的内容只能从 caption 读取，本篇素材里所有关于图的判断均来自 caption 文本。

### A-3.1 关键英文原句逐字 + 一句话中文释义（按论文出现顺序 = 作者修辞顺序）

| # | 位置 | 逐字原句 | 释义（作者在防守/主张什么） |
|---|---|---|---|
| 1 | `main.tex` 摘要 | "We construct an Artin group on 116 generators that admits no proper, cocompact isometric action on a nonempty proper CAT(0) space. This refutes the CAT(0) conjecture for Artin groups." | 主张：**存在性反例 + 推翻猜想**，摘要就给出维度无关的全称否定；无方法暗示。 |
| 2 | `main.tex:4` `\author{OpenAI}` | 作者署名为机构名，无个人、无致谢、无基金注 | 组织性事实：单机构署名、零致谢 ⇒ 无法从署名推断合作/评审轨迹。 |
| 3 | `macros.tex` hyperref subject | "A counterexample to the CAT(0) conjecture for Artin groups" | PDF 元数据把"推翻猜想"设为副标题级定位（比正文标题更强），面向社区叙事。 |
| 4 | intro 13–25 | "Throughout, an action is called \emph{geometric} if …" | 主张：把三条假设 + 空间 proper 全部**前置声明**，防止"你的作用其实不几何"式质疑。 |
| 5 | intro 24–25 | "The explicit properness assumption on \(X\) also follows from the other action hypotheses for a length space \cite[Exercise~I.8.4(1)]{BridsonHaefliger1999}." | 防守：主动承认该假设**冗余**，避免被指"靠冗余假设取巧"。 |
| 6 | intro 27–34 | "Charney asked which Artin groups are CAT(0)… The affirmative expectation that every finite-rank Artin group admits a geometric action is recorded by Haettel as Conjecture~1.1… The challenge is compatibility: constructing actions for the rank-two braid subgroups does not by itself supply an action of the whole group." | 定位：问题出处（Charney Problem 4 / Haettel Conjecture 1.1）+ 一句话解释**为什么难**（局部相容性）。 |
| 7 | intro 36–50 | "There are substantial positive results. RAAG… Brady and McCammond… Haettel proved the conjecture for XXL type… five-strand… six-strand… seven-strand…" | 主张：先完整列出正例谱系（6 项），把反例定位在"已知正例之外"，暗示构造的边界位置。 |
| 8 | intro 52–59 | "Brady and Crisp found Artin groups with two-dimensional classifying spaces for which the least dimension of a geometric CAT(0) action is three… Their examples show that an obstruction in one dimension can disappear in a higher-dimensional CAT(0) space. To refute the conjecture, an obstruction must instead survive every dimension." | **全篇的设计约束来源**：明确给出"必须维数无关"这一硬要求，为后文所有"任意维"声明奠基。 |
| 9 | intro 68–71 | "In particular, the conclusion excludes every nonempty proper CAT(0) space, regardless of dimension or the choice of a complex or metric." | 主张结论的强度：不依赖任何复形/度量选择。 |
| 10 | intro 82–84 | "Two further generators \(d,e\), each commuting with \(a,b,c\) and having no other finite incident labels, make \(T\) their simultaneous centralizer; Section~\ref{sec:assembly} proves this equality. This gives \(3+3\cdot37+2=116\) generators." | 构造核心句：哨兵 = 中央子群装置；同时**把证明外包**给 §7（前向引用）。 |
| 11 | intro 91–93 | "The calculation in Section~\ref{sec:braids} uses these standard geometric properties to constrain the braid relations, without requiring the braid blocks themselves to act cocompactly." | 防守：辫子块不必几何 ⇒ 反驳"你只是把辫子群的作用推广了"。 |
| 12 | intro 108–112 | "A related angle-sum obstruction appears in Crisp's study of two-dimensional Bestvina--Brady groups… His argument assumes covering dimension two and a proper action in which each isometry attains its minimum displacement." | 优先权声明 + 差异声明：前人做过角和，但**受维数 2 限制**。 |
| 13 | intro 114–115 | "The main geometric step is to turn this short angular circuit into a contradiction that remains valid in arbitrary dimension." | 把 §4–§6 的困难**自认为论文的主要贡献**（方法层的自我定位）。 |
| 14 | intro 117–118 | "This action is the equilateral-triangle specialization of Digne's reflection-coordinate homomorphism \cite[Proposition~2.1]{Digne2016}." | 优先权：坐标仿射作用是 Digne 的，本篇只取等边特化。 |
| 15 | intro 126–130 | "The triangular presentation and its girth-six link are the \(m=n=p=3\) specialization of Brady and McCammond's construction \cite[preprint Lemmas~2--3]{BradyMcCammond2000}. We prove the facts needed here, including the signed-count and controlled-approximation statements." | 优先权 + 自证声明：复形是前人的，**符号计数与逐点控制是本文新证**。 |
| 16 | intro 131–134 | "The latter comparison between local degree and global signed counts is formulated entirely in terms of distances and finite diagrams. It does not require a triangulation or a dimension bound on the unknown CAT(0) space." | 二次强调"不依赖未知空间的维数"；"距离 + 有限图示"是方法的自我概括。 |
| 17 | intro 149–151 | "We use elementary finite planar topology for regular neighbourhoods of graphs and winding numbers; no Artin-group asphericity theorem is an input." | 防守：不用 Artin 群作为性定理（该领域最难开放问题之一）⇒ 反例不依赖未解猜想。 |
| 18 | lengths 3–5 | "Our objective is a pairing of stable lengths that is additive on an entire centralizer, even when its elements do not commute with one another." | §2 的唯一目标被写成一句话（**先给结论再给证明**的写法）。 |
| 19 | lengths 10–12 | "We derive precisely the length identities needed for the braid calculation directly from triangle comparison, without using a splitting theorem." | 防守：不用平坦环面/分裂定理；"precisely … needed"= 拒绝过度引用大定理。 |
| 20 | braids 8–10 | "Throughout this section the same notation may denote elements of another group satisfying these relations. No injectivity or cocompactness of the resulting braid subgroup is needed for the length estimates." | 主张：长度估算是**纯关系级**的（这是全篇最"模块化"的声明）。 |
| 21 | braids 107 | "We retain \(l=2k\) with \(k\ge3\) until the final arithmetic, where \(k=20\)." | 参数延迟决定：直到最后一刻才代 $k=20$（提示 $k$ 是可调参数）。 |
| 22 | sectors 19–21 | "The denominators are positive in every geometric action: sending each of \(a,b,c\) to \(1\in\mathbb Z\) shows that their squares have infinite order, so Lemma~\ref{lem:semisimple} applies." | 即用时即验证：分母非零用一个增广解决，不引入新引理。 |
| 23 | sectors 41–44 | "The following form of the \v{S}varc--Milnor orbit comparison is standard… Its direct proof records the constants used to turn mirror-coordinate separation into metric separation." | 自证动机声明：为了**常数**而非为了结果。 |
| 24 | sectors 214–215 | "We use only the Euclidean metric within each sector of \(P\); we do not claim that this cone disk is CAT(0)." | **未断言声明**（全文最明确的"we do not claim"）。 |
| 25 | diagrams 7–9 | "We give direct proofs of the needed facts. This complex is separate from the unknown CAT(0) space; the argument here concerns finite diagrams and planar topology." | 主张：§5 与未知空间**解耦**（这就是"任意维"的实现方式）。 |
| 26 | diagrams 141–145 | "The proof below uses the classical diagrammatic-reducibility method of deleting opposite faces and excluding a reduced spherical diagram by curvature \cite[Definition~3.1 and Corollary~4.6]{Gersten1987}, here keeping the identity of each target cell and allowing collapsed parameter triangles." | 方法归属 + 两处修改声明（胞腔身份、塌缩面）。 |
| 27 | diagrams 287–288 | "In particular \(C_1\) is independent of \(f\), its modulus of continuity, and the number of triangles required." | 引理 5.4 的**全部难点**就在这句（局部性论证的前提）。 |
| 28 | diagrams 339–340 | "This proves the claimed finite reduction without assuming a disk-diagram theorem." | 防守：不用圆盘图示定理（避免额外曲率假设）。 |
| 29 | diagrams 353 | "For precision, an empty arc requires a fan, not an identification of parameter vertices." | 修补语气最强的一句（"For precision"）：显式指出一个容易写错的点。 |
| 30 | localization 111 | "For completeness, we spell out the elementary planar count we use." | 主张：绕数公式自证（读者无需相信引用）。 |
| 31 | localization 63–64 | "This is a coordinate projection on that sector; no global injectivity of \(J\) is asserted." | **未断言声明**（$J$ 非全局单射）。 |
| 32 | assembly 6–8 | "The additional generators in the following matrix make the group $T$ a common centralizer. This will produce a geometric action of $T$ from any hypothetical geometric action of the full group." | §7 的全部功能一句话化：**由整体作用造子群作用**。 |
| 33 | assembly 132–133 | "The construction asserts a state invariant; it does not assert that discarding the other tokens gives a homomorphism \(B_l\to B_3\)." | **未断言声明**（最技术化的一条：状态不变量 ≠ 收缩同态）。 |
| 34 | assembly 293–296 | "The following finite-tuple compactness argument gives the precise common-displacement-sublevel formulation needed here. It applies in every dimension and does not require the elements being centralized to commute." | 主张：引理 7.5 是"精确配方"，两条"不需要"（维数、被中心化元素交换）都必要。 |
| 35 | assembly 389–390 | "No restriction is placed on the dimension of \(X\)." | 定理证明开头的独立句：把设计约束在收束处再兑一次。 |
| 36 | assembly 424 | "This is the required counterexample." | 结尾一句，无展望、无 open problems、无致谢。 |

`[分析]` 修辞时间线的整体形状：**摘要即结论 → 引言一次剧透完整构造（第 73–140 行的
`\subsection*{The construction and the obstruction}` 用 8 段讲完全篇）→ 各节开头一句话目标 →
证明主体 → 结尾零展望**。这是"论文已完成、正在寻找读者"的文本形态；**没有**过渡性犹豫语（如
"we hope/plan to"）、没有未证声明、没有脚注式讨论。⇒ 该篇的写作时间线里"设计期"的痕迹只能靠
(i) 前向引用、(ii) "For precision"类修补句、(iii) `\begin{samepage}`、(iv) 参数延迟决定（第 21 条）来定位。

### A-3.2 作者自述的设计约束与"不依赖"清单（逐字 + 位置 + 它在保护什么）

1. "an obstruction must instead **survive every dimension**"（intro 58–59）⇒ 保护：结论的适用面；
   由 §5 的"该复形与未知空间无关"、引理 7.5 的"applies in every dimension"共同兑现。
2. "It does not require a triangulation or a dimension bound on the unknown CAT(0) space"（intro 133–134）。
3. "without using a splitting theorem"（lengths 12）⇒ 不依赖 Flat Torus Theorem / BH II.7.1 的分裂机制。
4. "No injectivity or cocompactness of the resulting braid subgroup is needed for the length estimates"
   （braids 9–10）⇒ 命题 3.1 只消费**关系**，不消费子群几何。
5. "without requiring the braid blocks themselves to act cocompactly"（intro 92–93）。
6. "Its direct proof **records the constants**"（sectors 42–44）⇒ 常数是产物，不是副产品。
7. "This complex is separate from the unknown CAT(0) space"（diagrams 8–9）。
8. "$C_1$ is independent of $f$, its modulus of continuity, and the number of triangles required"
   （diagrams 287–288）；"It is chosen once and does not depend on $f$"（diagrams 413–414）。
9. "without assuming a disk-diagram theorem"（diagrams 340）。
10. "no Artin-group asphericity theorem is an input"（intro 150–151）。
11. "does not require the elements being centralized to commute"（assembly 295–296）。
12. "There is one constant $C_1$, independent of $n$"（localization 69）；"$C_2$, independent of $n,p,s$"
    （localization 93）；"$C_0$ independent of $n,p$"（sectors 243）⇒ **三处"与 $n$ 无关"是同一族约束**，
    服务于 $\delta n$ vs $2C_1$ 的对撞。

### A-3.3 "we do not claim / it does not assert"清单（论文自我限制的完整清点，共 5 处）

1. sectors 214–215："we do not claim that this cone disk is CAT(0)"——参数盘 $P$ **不是** CAT(0) 空间。
2. localization 63–64："no global injectivity of $J$ is asserted"——$J$ 只在所选扇区内是坐标投影。
3. assembly 132–133："it does not assert that discarding the other tokens gives a homomorphism $B_l\to B_3$"
   ——token 不变量不是收缩同态。
4. braids 126–127（间接）："this calculation does not expand the noncommuting $s_2$-letters inside $L_3$"
   ——声明计算**刻意停留**在非交换内部结构之外。
5. diagrams 98（间接）："possible coincidences of group elements do not identify labelled edge directions"
   ——Cayley 图中顶点重合不识别方向（身份制的坚持）。
`[写作纪律]` 笔记与终稿**不得**把这 5 处写成"论文证明了/论文假定了"，也不得替论文补上
"$P$ 是 CAT(0)"或"$J$ 单射"这类看似无害的加强。

### A-3.4 文献规模与倾向

- 18 条，**全部被引用**（grep 出的 18 个不同 cite key 与 18 条 bibitem 一致，无冗余条目）。
- 引用频次最高：`BridsonHaefliger1999` 4 次（含一条**习题** I.8.4(1)）、`BradyMcCammond2000` 3 次、
  `Swenson1999` 与 `Haettel2022`、`Digne2016` 各 2 次，其余各 1 次。
- **6 处按"preprint Theorem/Lemma/Corollary N"引用**（introduction 39/43/49/50/55/128 行）
  ⇒ 引的是 arXiv 版编号而非期刊版编号；笔记转述这些结论时**必须注明版本号可能不符**（本素材一律只标注
  "论文如此引用"，不核对期刊原版）。
- 年代分布：1980–2023，**最新一条是 Jeong 2023**；无 2024–2026 文献 ⇒ 该篇不建立在近三年结果之上，
  也无"同时期预印本竞争"声明（`[事实]` 无相关段落）。
- 特殊条目类型：Charney 的问题列表标注 "American Institute of Mathematics, **undated problem list**"；
  Digne 标注 "**unpublished manuscript, 1999; arXiv version 3, 2016**"；Rodenhausen 是 **Ph.D. thesis**（Bonn 2013）；
  `Bridson2001` 给的是"Author's preprint page"链接而非 doi ⇒ 文献类型偏"经典 + 手稿"，无综述类引用。
- 主题倾向：正例阵营（Charney–Davis、Brady–McCammond ×2、Haettel、HKS、Jeong）6 条，
  负例/障碍阵营（Brady–Crisp、Crisp、Bridson 2001）3 条，几何组论工具（BH、Swenson、Ruane、Serre、Gersten）5 条，
  长度/辫子工具（Rodenhausen、Crisp–Paoluzzi、Digne）3 条，问题列表 1 条。

### A-3.5 tex 源码中的叙事痕迹（节序 vs 逻辑序）

1. **文件输入序 = 逻辑序，但命题陈述序 ≠ 证明序**：`prop:triangle-obstruction`（命题 4.1）在 §4 陈述、
   §6 末证明（`localization.tex` 191 行 `\begin{proof}[Proof of Proposition~\ref{prop:triangle-obstruction}]`）；
   §4 开头逐字"We prove the proposition in Section~\ref{sec:localization}. In this section, assume for
   contradiction that such an action on $Y$ exists and fix $y\in Y$."——**前向引用 + 假设性推进**，
   提示 §4 是"被拆开的两半"，也提示作者先在 §4 完成几何构造、后在 §6 才找到图示矛盾装置。
2. `lem:sector-maps`（引理 4.5）被 `\begin{samepage}…\end{samepage}` 包住（sectors 240/264），是全篇唯一的
   samepage ⇒ 作者在意"该陈述 + 四条结论不被分页打断"，暗示其陈述长度/结构经历过读者反馈。
3. `\subsection*`（无编号小节）只出现在引言（"The construction and the obstruction"、"Organization and notation"）
   与 §4（"Orbit control and mirror coordinates"、"The parameter disk"、"Uniform asymptotic maps"）、
   §5、§6；`\setcounter{tocdepth}{1}` ⇒ 目录只到 section 级 ⇒ 小节是**内部组织**而非展示结构。
4. `macros.tex` 的 `clubpenalty/widowpenalty=10000`、`\raggedbottom` ⇒ 精细排版（投稿形态），
   但**无 `\usepackage{authordate}`/无 bib 文件**（thebibliography 手写）⇒ 单作者/单文件工作流。
5. 逻辑序与叙事序的偏离点：引言的构造 subsection（73–140 行）在**定理陈述之后、任何证明之前**给出完整
   障碍链（含 $143/513$ 型比值不等式、六扇区、$\pi/3$、$2\pi$），而 §3 才第一次严格给出比值下界；
   ⇒ 读者第一次见到不等式时它只是"会被证明的目标"，这是**倒叙式写作**。
6. §7 的装配段（287–384 行）把"引理 7.5 的文献出处（Swenson 定理 13 归于 Ruane；定理 16–17 处理同时中央化子）"
   放在自证之前 ⇒ 作者先声明"这是经典"，再声明"但我们要的是精确配方"——防御性优先级的体现。

### A-3.6 论文未述清单（写笔记/终稿时**不得虚构**论文已论证的内容）

1. **未述 116 与 40 股的最优性**：全文无"minimal"、无"could be reduced"类讨论；
   `[分析]` 本人验算 $k=14$（28 股、80 生成子）在论文自身不等式层面已够，但论文未提、也未解释为何取 $k=20$。
2. **未述 $T$ 本身是否 CAT(0)/双曲/可立方化**：$T$ 只作为"检测障碍的小群"出现；
   论文从未断言 $T$ 有几何 CAT(0) 作用（事实上命题 4.1 排除的是满足比值条件的作用）。
3. **未述 Artin 群作为性（asphericity）、type-F、biautomaticity、词问题**：
   逐字声明"No Artin-group asphericity theorem is an input"，也未讨论 $A_M$ 是否属于任何已知好类别。
4. **未述无挠/ torsion-free**：只用"$\ell=0\Leftrightarrow$ 有限阶"的方向，不证 $G$ 无挠。
5. **未述参数盘 $P$ 的 CAT(0) 性**（见 A-3.3 第 1 条）。
6. **未述 $J$ 的全局性质**（同上第 2 条）。
7. **未述 token 不变量给不出收缩同态之外的推论**（同上第 3 条）。
8. **未述六扇区阈值 $1/2$ 是否可改进**：$\pi/3$ 与 $1/2$ 的关系是即用的，但论文未问"最弱可证阈值是多少"。
9. **未述图示计数所需 girth 的确切下界**：论文证 girth $\ge6$ 并使用 $2E\ge6V$，未讨论该下界是否极小；
   `[分析]` 我在 A-2.19(c) 复核后作 `[纠正]`：按 $3F=2E$ 合并得 $V-E+F\le E(\tfrac2m-\tfrac13)$，
   故 $m=6$ 恰为临界（$m=5$ 已不再矛盾），早期笔记里"girth $\ge4$ 也够"一句作废。
   再次强调：这一临界性判断**不是论文内容**，只能作为"分析"标注，不得写成"论文证明…"。
10. **未述任何验证/计算实验清单**：目录内无 `verification/`；`README.md` 只有标准引用块；
    `typst/` 目录存在（`main.typ`、`main.pdf`、`fig/`）但本次未逐行核对，
    ⇒ 关于"官方对照实现"没有一手证据，§A-4 一律以 Lean 仓库为准（与 §头部对双曲篇的说明同规格）。
11. **未述与 2026-09-25 双曲篇的关系**：本篇正文不含对该文的任何引用（18 条 bibitem 中无该条目），
    反之亦然（双曲篇素材头部第 20–22 行已记录）⇒ 两篇相互独立，不得在笔记里构造"系列论文"叙事。
12. **未述任何 open problem / 展望**：全文结尾是"This is the required counterexample."，无问题清单。
13. **未述 3 张图的构造细节**（只有 caption），`[事实]` caption 明确"schematic"（sectors 图：
    "The angles and patch sizes are schematic"）⇒ 不得用图来支撑数值论证。

## A-4 Lean 取证（Artin 篇）

### A-4.0 目录与规模（全部命令实测，路径 `E:/math/lean/OAI/GroupTheory/ArtinCAT0/`）

`[实测]` 20 个 `.lean` 文件、**9,419 行**、行首声明（`def/lemma/theorem/abbrev/instance/noncomputable def/structure`）
合计 **945** 条；`grep -rn "sorry"` **0 命中**（两条 "admits" 出现在 docstring 里，非缺口）；
`grep -rn "^axiom|admit"` **0 命中**（无自定义公理）。

| 文件 | 行 | 声明数 | 对应论文内容 |
|---|---|---|---|
| `Model.lean` | 76 | 13 | 定义 7.1 / Artin 群与 CAT(0)、GeometricAction 的机器定义 |
| `StableLength.lean` | 636 | 56 | §2（引理 2.1–2.3） |
| `Pairing.lean` | 244 | 17 | 引理 2.4（中央子群特征标） |
| `Braids.lean` | 669 | 52 | §3（命题 3.1、引理 3.2）+ 引理 7.2 的 token 不变量 |
| `Presentation.lean` | 313 | 44 | 引理 5.1（$T$ 的呈现）、增广、$B_3$ 嵌入 |
| `TriangleMesh.lean` | 276 | 25 | 命题 5.3 的机器骨架（dart/精确性/Euler 不等式） |
| `Centralizer.lean` | 202 | 14 | 引理 7.5（次水平集几何作用） |
| `Folding.lean` | 806 | 88 | 命题 5.3 的折叠删除 |
| `Mirrors.lean` | 118 | 24 | 引理 4.3（Digne 反射坐标） |
| `Wires.lean` | 274 | 30 | 度 2 顶点压缩（fold surgery 的抽象化） |
| `Winding.lean` | 725 | 87 | §6 的标号/绕数/塌缩商 |
| `Grid.lean` | 596 | 46 | 引理 4.5 的网格映射 $t_n,f_n$ |
| `WordDiagram.lean` | 1088 | 127 | 引理 5.4（受控图示；全目录最大文件） |
| `SectorMetric.lean` | 476 | 46 | 引理 4.4（扇区稳定范数与角度） |
| `Refinement.lean` | 455 | 46 | §5–§6 的细化/填充 |
| `SectorCharts.lean` | 496 | 43 | $v_*$、$J$、区域分离 |
| `Cap.lean` | 586 | 44 | 引理 4.6（外盖帽） |
| `Detour.lean` | 591 | 26 | 引理 4.6/5.4 的环带绕行与逐点界 |
| `Embeddings.lean` | 728 | 114 | §7（amalgam、$G$↔`Model`、共同中央子群） |
| `Main.lean` | 64 | 3 | 定理 1.1 的证明 + `main` 四合取 |

`[事实]` **模块依赖是严格线性链**（按 `^import` 实测）：
`Model → StableLength → Pairing → Braids → Presentation → TriangleMesh → Centralizer → Folding →
Mirrors → Wires → Winding → Grid → WordDiagram → SectorMetric → Refinement → SectorCharts → Cap →
Detour → Embeddings → Main`（只有 `Model.lean` 直接 `import Mathlib`）；
`OAI.lean:654` 引入 `OAI.GroupTheory.ArtinCAT0.Main`。

### A-4.1 "无非几何 CAT(0) 作用"在机器里到底怎么写

`[逐字]` `Model.lean`：
```lean
abbrev Letters := Fin 116
abbrev Label := WithTop ℕ
noncomputable def explicitMatrix (s t : Letters) : Label :=
  if s = t then 1
  else if Adjacent s t then 3
  else if Distant s t ∨ Sentinel s t then 2
  else ⊤
abbrev ArtinGroup (M : Letters → Letters → Label) := PresentedGroup (artinRelators M)
```
（`blockLetter b i` = $s_j^{uv}$ 的编号：`i=0→⟨b.val⟩`、`i=1→⟨(b.val+1)%3⟩`、否则 `⟨5+37*b.val+(i-2)⟩`；
`Adjacent/Distant` 用 `Fin 39` 索引偏移；`Sentinel` = `s.val=3∨4 ∧ t.val<3`。）

`[逐字]` CAT(0) 与几何作用（作者自造，**不用 Mathlib 的 `CAT0` 类**）：
```lean
def Segment (x y : X) (γ : ℝ → X) : Prop        -- 等距参数化的测地线段
def CAT0 (X : Type*) [MetricSpace X] : Prop     -- 每对点存在 Segment + 平方比较不等式
def GeometricAction (G X) : Prop :=
    CAT0 X
  ∧ (∀ g : G, Isometry (fun x : X => g • x))
  ∧ (∀ K, IsCompact K → {g | (g''K ∩ K).Nonempty}.Finite)
  ∧ ∃ K, IsCompact K ∧ ∀ x, ∃ g, ∃ k ∈ K, g • k = x
```
`CAT0` 的 docstring 逐字："All geodesic sides, also degenerate ones, are quantified… not a midpoint-only
condition"；`GeometricAction` 的 docstring 逐字："Properness of the metric space and nonemptiness are
separate standing hypotheses"。
`[分析]` 比较不等式在机器里是 `(t²−tu)d(x,y)² + (u²−tu)d(x,z)² + tu·d(y,z)²` 形式的**平方**版，
与论文 `eq:midpoint-comparison` 同族；因此 A-2.4 的三条推论在机器里全部是**引理**而非定义。

`[逐字]` 否定陈述的最终形状（`Main.lean:53–61`）：
```lean
theorem main :
    (∀ s t : Letters, explicitMatrix s t = explicitMatrix t s) ∧
    (∀ s : Letters, explicitMatrix s s = 1) ∧
    (∀ s t : Letters, s ≠ t →
      explicitMatrix s t = 2 ∨ explicitMatrix s t = 3 ∨ explicitMatrix s t = ⊤) ∧
    (∀ (X : Type u) [MetricSpace X] [ProperSpace X] [Nonempty X]
      [MulAction (ArtinGroup explicitMatrix) X],
      ¬ GeometricAction (ArtinGroup explicitMatrix) X) := by
  exact ⟨explicitMatrix_symmetric,explicitMatrix_diagonal,explicitMatrix_values,Assembly.not_geometric⟩
```
`[关键点]`
1. 非存在性写成 **`¬ GeometricAction G X`，量词在 `X` 上、且假设以 instance 括注给出**
   （`[MetricSpace X] [ProperSpace X] [Nonempty X] [MulAction G X]`）；
   论文的"nonempty proper"两句在机器里**不进入** `GeometricAction` 的合取，而是环境假设 ⇒
   机器陈述比论文陈述多出"对所有满足这些 instance 的 X"这一显式全称。
2. 矩阵的三条合法性（对称、对角 1、非对角 ∈{2,3,⊤}）是 `main` 的**前三个合取支**，
   论文里它们属于定义 7.1 的前提（不作为定理内容）⇒ 比较器把"这是合法 Artin 矩阵"当作需证结论。
3. `Assembly.not_geometric` 用 `MainGroup`（= `ArtinGroup explicitMatrix` 的别名）陈述，
   再在 `main` 里以同一 `explicitMatrix` 实例化。

### A-4.2 题目文件与解法文件的分离

`[逐字]` `ComparatorChallenges/ArtinCAT0.json`：
```json
{ "challenge_module": "ComparatorChallenges.ArtinCAT0",
  "solution_module": "OAI.GroupTheory.ArtinCAT0.Main",
  "theorem_names": ["OAI.ArtinCAT0.main"],
  "definition_names": [],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"],
  "enable_nanoda": false }
```
`[实测]` `ComparatorChallenges/ArtinCAT0.lean`（77 行）是 `Model.lean` 定义的逐字复制 + 末尾
`theorem main : … ∧ … := by **sorry**` —— **整个目录里唯一的 `sorry` 在这里（第 73 行），属题目占位**，
不是解法缺口。运行方式（`ComparatorChallenges/README.md`）：`lake env comparator ComparatorChallenges/ArtinCAT0.json`。
`definition_names: []` ⇒ 比较器**不要求**机器定义与论文术语同名对应，只核对定理语句 ⇒
"geometric/CAT(0)/stable length"的对应关系只能靠人工（即本节 A-4.1 的对照）。
`enable_nanoda: false` ⇒ 本条目不用 `nanoda`（自动化引理搜索）通道。

### A-4.3 选择公理与经典性使用位置（任务要求专项回答）

`[实测]` `Classical.choice` 共 **4 处**，全部用途相同：**从 `Nonempty X` 取一个基点**：
- `StableLength.lean:410 let o : X := Classical.choice inferInstance`（引理 2.2 最小位移证明内取点）
- `Centralizer.lean:121 let o : X := Classical.choice inferInstance`（`sublevelAction_cocompact`）
- `Centralizer.lean:189 let x : X := Classical.choice inferInstance`（`exists_sublevel_nonempty`，取 $A=\sum_i d(x,q_ix)$）
- `Main.lean:38 let y : Y := Classical.choice inferInstance`（定理证明里取 $y\in Y$，对应论文"Choose $x_0\in X$"）
`[分析]` 没有一处用 choice 做"选择极小测地线/超函数紧化"之类实质非构造步骤 ⇒
**该形式化对 choice 的依赖仅止于 Nonempty 消去**，与论文"proper + nonempty 是显式假设"的姿态一致。
`[实测]` `choose` 策略 / `Classical.choose` 共 **13 处**（逐文件行号）：
`Centralizer.lean:130`、`Detour.lean:31,32`、`Grid.lean:246,383`、`Refinement.lean:123,145,147`、
`SectorCharts.lean:45,210(= (eval_surjective g).choose),354`、`Winding.lean:447`、`WordDiagram.lean:212`；
`open scoped Classical` 出现在 13 个文件。⇒ 绝大多数是"从存在性语句中取见证"（稠密性、路径、边界类型枚举），
其中 `SectorCharts.lean:210` 从满射取群元素的**字代表**，对应论文图示标号里隐式使用的"选一个字"。
`[实测]` permitted axioms = `propext, Quot.sound, Classical.choice`（即 Mathlib 三公理，无 `sorry`、无自定义公理）；
**但本会话无法运行 `#print axioms`**（无 `.lake`、无已编译环境，见 A-4.9）。

### A-4.4 需要哪些外部文献结论（Mathlib 侧与论文侧）

| 外部资源 | 机器中的用法 | 论文中的对应 |
|---|---|---|
| `Mathlib.GroupTheory.PresentedGroup`（`PresentedGroup.of/lift`） | `ArtinGroup M`、`TriangleGroup`、`BraidGroup n` 全部由 `PresentedGroup` 构造；`artinRelators`/`alternating` 自定义 | 论文只用"呈现群"概念（引言 Artin 群定义、引理 5.4 中"按呈现的定义落在关系子正规闭包里"） |
| `Monoid.CoprodI / PushoutI / PushoutI.NormalWord / Transversal` | `Embeddings.lean:7` 打开这些命名空间；amalgam 正规形、`normal_reduced`、`(PushoutI.of k).range` 成员判定 | **引理 7.3（Serre Ch. I §1.2 Thm 1–2 的自证）在机器里被 Mathlib 版本取代** |
| `MetricSpace / ProperSpace / Isometry / MulAction / IsCompact` | 几何作用四条假设的载体；`ProperSpace.of_isClosed`（`Centralizer.lean:196`） | BH 的定义体系（I.8.4、II.6.8 等） |
| `Equiv.Perm`、`Finset`、`Fintype` | `tokenPerm : Equiv.Perm (TokenState H)`（引理 7.2 的状态机） | 论文用文字描述同一状态变换 |
| `Matrix`/`Finsupp`/`semiring` 有限线性代数 + `finrank` | `TriangleMesh.lean:111 coboundary`、`:124 boundarySum`、`:150 exact_iff`、`:180 exact_euler_inequality` | 命题 5.3 的"细正则邻域 + 加盖 + Euler 公式" |
| `Complex` 与 `Real.sqrt`/三角函数不等式 | `SectorMetric.lean:10` 复嵌入 `(p.1 + c*p.2) + (Real.sqrt (1-c^2)*p.2)*I`、`:118 2*sqrt(1+r²−2cr)+r<2` | `lem:outer-cap` 的 $2\sin(\Omega/4)$、$\rho\ge\cos(\theta/2)>\sqrt3/2$ |
| `Filter`/`Tendsto`（`stableLength_tendsto`）、`nnreal` 不等式库 | 稳定长度极限、四边形极限 | A-2.5 |
| 无 `Analysis/Convex` 的 Busemann 函数库 | 论文式 Busemann 差分自造（`Pairing.lean:14 orbitBusemann`） | 引理 2.4 |
| 无 `NaNoda`、无 `polyrith/linear algebra solver` | 数值步骤靠 `norm_num/linarith/nlinarith/omega/positivity/ring` | 全部算术 |

`[事实]` 论文引用的 **BH/Serre/Swenson/Ruane/Digne/Gersten/Brady–McCammond/Crisp–Paoluzzi/Crisp/Bridson2001/
Charney–Davis/Haettel/HKS/Jeong/Charney 问题列表/Rodenhausen** 中，除 Serre 定理由 Mathlib 提供外，
其余结论**全部不在机器里**：机器只证"本文实际用到的那个片段"（例如 Swenson 定理 13/16–17 → `Centralizer.lean`
的有限元组紧论证；Digne 命题 2.1 → `Mirrors.lean` 的等边特化；Gersten 3.1/4.6 → `Folding.lean`+`TriangleMesh.lean`）。

### A-4.5 战术/术语频次（实测，词边界计数）

`simp 619`、`rw 583`、`exact 456`、`have 939`、`omega 382`、`simpa 244`、`intro 243`、`let 157`、
`apply 163`、`linarith 139`、`obtain 120`、`ext 113`、`show 93`、`noncomputable 89`、`refine 84`、
`ring 71`、`cases 68`、`induction 64`、`nlinarith 64`、`norm_num 57`、`decide 55`、`subst 52`、
`classical 50`、`constructor 39`、`all_goals 21`、`positivity 19`、`choose 13`、`calc 25`、`gcongr 0`、`use 0`。
`[分析]` `omega` 382 + `decide` 55 + `norm_num` 57 ⇒ **索引/`Fin` 算术负担极重**（116/39/37/20 这类
常数在机器里都是 `Fin` 运算）；`gcongr=0`、`use=0` ⇒ 不等式单调性靠 `nlinarith/positivity` 硬推，
说明作者（机器侧）没有使用 Mathlib 的广义单调度量库；`noncomputable 89` ⇒ 大量选择型定义（`Segment`、
`Classical.choose`、`representative`）。

### A-4.6 论文条目 ↔ 机器出口对照（27 项）

| 论文 label | 机器出口（文件:行或名称） | 备注 |
|---|---|---|
| `thm:main` | `Main.lean:53 main`（四合取） | 合法性成为结论一部分 |
| 摘要/引言全部历史段 | 无 | 未形式化（正常） |
| "geometric" 定义 | `Model.lean GeometricAction` + `ProperSpace/Nonempty` 假设 | 四拆二，见 A-4.1 |
| `lem:comparison` | `StableLength.lean:28/:37/:43/:56/:65` | 5 条，比论文细 |
| 稳定长度段 | `:88/:91/:100/:122/:129/:142/:148/:157/:170/:185` | 含论文未写的 `one/inv/mul_le` |
| `lem:semisimple` | `:388/:406/:448/:462/:495/:548/:562/:569/:583`（+`:482 extension_numeric`） | 轴=幂距离线性 |
| `lem:commuting-form` | `:205/:221/:235/:256/:276/:298/:316/:330/:338/:349/:356/:371` | `lengthPairing` 定义在此 |
| `lem:centralizer-character` | `Pairing.lean:14/:17/:36/:44/:61/:71/:107/:113/:168/:183/:196/:217` | 整文件即此引理 |
| `prop:braid-angle` | `Braids.lean:388 braid_forty_squared`、`:441 braid_forty_ratio` | 无除法形式 $143D^2\le57\ell(Z_3)^2$ |
| `eq:braid-centers-definition` | `:17 braidLoop`、`:21 braidCenter`、`:25 braidDelta` | 索引偏移：`braidCenter s n` = $Z_{n+1}$ |
| `lem:braid-centers` | `:29/:37/:44/:51/:63/:77/:83/:91/:110/:132/:142/:190/:208–:257/:272` | |
| 命题 3.1 证明主体 | `:281/:302/:316/:329/:347/:364/:380` | 递推 $R_r$ 未符号化，直接实例化 $n{=}17,19,20$ |
| `prop:triangle-obstruction` | `SixSector.no_strict_ratios`（被 `Main.lean:42` apply） | 六扇区条件的机器名 |
| `lem:orbit-control` | `Mirrors.lean`/`Detour.lean` 内的轨道界（$R,C$ 显式） | |
| `lem:mirror-action` | `Mirrors.lean`（118 行） | Digne 特化 |
| `lem:sector-data` | `SectorMetric.lean`（复嵌入、正定、角度） | |
| `lem:sector-maps` | `Grid.lean` + `Refinement.lean` + `SectorCharts.lean` | $C_0$ 显式 |
| `lem:outer-cap` | `Cap.lean` + `Detour.lean:528 d:=2*sqrt(1+r²−2cr)+r` | **改走环带绕行**（见 A-4.7） |
| `lem:triangular-presentation` | `Presentation.lean:145/:150/:160/:196` | `TriangleGroup` 独立类型 |
| `lem:link-girth` | `TriangleMesh.lean:209 six_turns_injective`、`:235 degree_at_least_six` | 置换代数替代情形分析 |
| `prop:sphere-counts` | `TriangleMesh.lean:45/:106/:150/:180` + `Folding.lean`(806) + `Wires.lean`(274) | 线性代数替代平面拓扑 |
| `lem:controlled-diagrams` | `WordDiagram.lean`(1088) + `Detour.lean:316 (22+4C+4E)` | 论文 $C_1=DL+R+1$ |
| `lem:projected-approximation` | `SectorCharts.lean`（$J$、$v_*$、$q_n$ 逼近） | |
| 绕数段 + 两性质 | `Winding.lean`(725) + `GridDisk.sum_index_boundary` | |
| `lem:localized-degree` | `Winding.lean:447` + `Detour.lean:286/:295` | |
| `def:matrix` | `Model.lean explicitMatrix` + `Adjacent/Distant/Sentinel/blockLetter` | 四个 if 分支 |
| `lem:pair-embeddings` | `Braids.lean:462–:642`（TokenState）+ `Presentation.lean:86/:119/:125/:178/:191` | |
| `lem:amalgam-normal-form` | **Mathlib `Monoid.PushoutI`**（`Embeddings.lean:7`） | 论文自证被替换 |
| `lem:common-centralizer` | `Embeddings.lean:671 main_common_centralizer`、`:683 triangleCentralizer_bijective` | 写成同构而非集合等式 |
| `lem:geometric-centralizer` | `Centralizer.lean:169 geometric_tupleCentralizer`（+`:113`） | $m$ 元组 = `ι → G`，`[Finite ι]` |
| 定理 1.1 证明 | `Main.lean:26 not_geometric`（逐字见 A-2.29） | |

### A-4.7 形式化未覆盖 / 与论文路径明显不同的部分（专项回答）

1. **平面拓扑 → 线性代数**：论文的"细正则邻域 + 生成树加厚 + 逐边界圆加盖 + Euler 公式"（命题 5.3 第 2 段）
   在机器里不存在；取而代之的是 `TriangleMesh.Exact`（`boundarySum.ker = coboundary.range`）
   与 `exact_euler_inequality`（用 `finrank` 推 $V-E+F\le0$）。
   ⇒ **机器没有使用"圆盘被properly嵌入折线分成两块"这一初等平面事实**，论文该句是纯几何论证。
2. **外盖帽 → 显式环带/绕行**：论文把 $\partial P$ 锥化到 $f_n(p_0)$（`lem:outer-cap` 第 4 步）；
   机器用 `Detour.lean`/`Cap.lean` 构造显式替代环带（`Replacement`、`GridDisk`），并给出
   $d=2\sqrt{1+r^2-2cr}+r$ 型的显式折线长界。⇒ 论文的"测地线连续依赖 ⇒ 锥化连续"在机器里被
   **组合式构造**替代（这是最难落地的步骤，`[推测]` 也是实际改动最大的一步）。
3. **边界类型有限族被显式数值化**：论文只说"只有有限多种边界类型"，最终 $C_1=DL+R+1$；
   机器给出 `22+4*C+4*E`（`Detour.lean:316`）与 `21+2*C`（`:100`）等显式组合，其中 $E$ 项在论文中**无对应符号**。
   ⇒ 论文常数与机器常数不可等同引用；笔记中必须分别标注来源。
4. **Serre 正规形未重证**（A-4.4），因此论文的"elementary proof records the exact form needed"
   在机器里由 Mathlib 的一般定理覆盖，`[推测]` 覆盖是否严格等价需在 Mathlib 源码核对（本机无 Mathlib 源码）。
5. **未覆盖的论文内容**：引言全部（问题背景、正例谱系、优先权声明）、全部历史注、
   BH 习题 I.8.4(1) 的"proper 冗余"论断（机器仍把 `ProperSpace` 当假设）、
   "no Artin-group asphericity theorem is an input"这一类元陈述、$\ell(g)=0\Leftrightarrow$ 有限阶的
   **群论侧**（机器有 `StableLength.lean:583`，但未讨论 $G$ 是否有挠）、
   辫子块在 $G$ 中的**几何性质**（机器只用到关系）。
6. **未覆盖的数学对象**：$T$ 自身的 CAT(0)/双曲性、$M$ 的最优性、9 生成子复形 $\mathcal K$ 的
   非正曲率（论文也未声称）、$G$ 的类型/有限 $K(\pi,1)$。⇒ 与 A-3.6 的"论文未述清单"高度重合。
7. `[事实]` `ComparatorChallenges/ArtinCAT0.lean` 与 `Model.lean` 的定义**逐字相同**（复制式），
   ⇒ 题目文件不构成对定义的第二种理解，只构成对定理语句的独立复写（这是比较器的常规做法）。

### A-4.8 仓库侧的一手范围声明（`docs/254.md`）

`[逐字]` 该文档标题："Classifying spaces and geometric obstructions for Artin groups"，
覆盖**三篇同日论文**（Harmonic heights / An Artin group with no geometric CAT(0) action / Parabolic intersections）。
本篇部分逐字：
> "The geometric-action question asks whether every Artin group acts properly and cocompactly by isometries
> on a proper CAT(0) space. The formalized result gives a counterexample: an Artin group defined by a symmetric
> matrix on $116$ generators, with diagonal entries $1$ and off-diagonal entries in $\{2,3,\infty\}$.
> It admits no such action on any nonempty proper CAT(0) space, in any dimension."

比较器链接表逐字给出 `ArtinCAT0.lean` 为本篇的 Comparator statement。
`[分析]` 这是仓库方对"机器结论是什么"的官方口径，与 A-4.1 的 `main` 四合取一致；
其中"with diagonal entries 1 and off-diagonal entries in {2,3,∞}"正是 `main` 的第二、三个合取支。

### A-4.9 未核实事项（本篇 Lean 侧）

1. **无法确认整个目录可编译**：本工作区无 `.lake/build` 产物，未运行 `lake build`（耗时且非本次任务要求）。
2. **无法运行 `#print axioms OAI.ArtinCAT0.main`** ⇒ permitted_axioms 三项是**配置声明**，
   不是实测的 axiom 依赖集；实际是否只用这三项，需在有 Mathlib 缓存的环境中复核。
3. **Mathlib 版本**：`lean-toolchain = leanprover/lean4:v4.34.1`；`lake-manifest.json` 中 mathlib rev
   `d13f23b723b8…`（42 个包）——本机无 Mathlib 源码，故 `Monoid.PushoutI`、`Transversal`、`ProperSpace.of_isClosed`
   的**确切语义**（尤其 `PushoutI` 的 amalgam 是否与论文引理 7.3 的三条断言逐字等价）未经核对。
4. `MetricSpace` 是否隐含完备性（关系到 A-2.2 中"空间 proper/完备"的层级）未核对；
   `[推测]` Mathlib 的 `MetricSpace` 不假设完备，但 `ProperSpace` + 闭球紧在论文语境下给出等价效果。
5. 姊妹论文目录 `typst/`（`main.typ`、`fig/`）未逐行核对 ⇒ 若其中有与 tex 不同的措辞，本素材未知。
6. `formalization.yaml` 的 `status.scope: "Partial progress."` 是**仓库级**字段
   （第 914–917 行，统领 185 条 main_results、162 篇论文），**不是**对本篇的单独评级；
   `[纠正]` 早期会话曾把它当作本篇状态，本笔记予以更正。

---

## A-5 常数与参数总表（Artin 篇）

**口径说明**
1. "值"列一律逐字取自 `build/sections/*.tex` 或 `E:/math/lean/OAI/GroupTheory/ArtinCAT0/*.lean`，
   行号即实测位置；无行号者为本笔记前文（A-2/A-4）已核对过的表达式。
2. "动了会坏在哪"列：标 `[机械理由]` 的是能从 tex/Lean 文本直接落地的因果；
   标 `[分析]` 的是本人按已核公式做的代入/求解（论文未写）；标 `[推测]` 的是无法在文本中闭环的猜想。
3. 本表不含论文未出现的"最优性"断言：论文从未说 116、$k=20$、$\ge6$ 是极小值（见 A-3 论文未述清单）。

### A-5.1 构造层：群的规模与 Coxeter 型标签

| 符号 | 值（逐字） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $\|S\|$ | `116`，`assembly.tex:44` 逐字 `\|S\|=5+3\cdot37=116` | 定理 1.1 的"116 生成子"（`introduction.tex:61` `thm:main`；`assembly.tex:422` "The $116$-generator Artin group $A_M$"）；Lean `Model.lean:5` `abbrev Letters := Fin 116` | `[机械理由]` 116 不单独承重，承重的是分解 $5+3\cdot37$：$5$ = 三角核 $a,b,c$ 加哨兵 $d,e$，$3\cdot37$ = 三块各 37 个私有字母。私有字母少于 37 时 $B_{40}$ 关系凑不出，$k=20$ 的算术（见 A-5.2）失去输入。 |
| 每块私有字母数 | `37`（$j=3,\ldots,39$，`assembly.tex:14` 逐字 `\{s_j^{uv}:(u,v)\in\mathcal E,\ 3\le j\le39\}`） | 把每块撑成 39 个生成子 ⇒ 抽象辫子群 $B_{40}$（`assembly.tex:207`） | `[机械理由]` 37 的下界来自 $k=20$：需 $2k-1=39$ 个标准生成子，减去共用的 $s_1,s_2$ 恰为 37。`[分析]` 若取论文阈值的最小 $k=14$（见 A-5.2 末行），则 $2k-1=27$、私有 $=25$、总数 $5+3\cdot25=80$；论文未做此优化。 |
| 每块总生成子 | `39`（`assembly.tex:23` 逐字 `In each block $\{s_1^{uv},\ldots,s_{39}^{uv}\}$`） | 命题 3.1 假设 "$s_1,\ldots,s_{39}$ satisfying the $B_{40}$ relations"（`braids.tex:12`）；Lean `Braids.lean:388` `BraidRelations 39 s` | `[机械理由]` 39 与 40 是同一事实的两种计数（$B_l$ 用 $l-1$ 个生成子）；Lean 里写成 `39` 是因为 `BraidRelations (m : ℕ)` 参数是生成子个数，结论阈值 $N_r$ 需 $r\le 2k=40$ ⇒ 索引到 $s_{39}$。 |
| 块数 / 初始对 | `3`，$\mathcal E=\{ab,bc,ca\}$（`sectors.tex:5`、`assembly.tex:214–216` 逐字 `((T*_{B_3^{ab}}B_{40}^{ab})*_{B_3^{bc}}B_{40}^{bc})*_{B_3^{ca}}B_{40}^{ca}`） | §5 的六扇区（$2\times3=6$ 个扇区，`sectors.tex:150` `lem:sector-data` "Each of these six seminorms"）；§6 迭代 amalgam | `[机械理由]` 三块是"三角"要求的：扇区圆盘要按 $a^2,z_{ab},b^2,z_{bc},c^2,z_{ca},a^2$ 闭合（`eq:ray-order`，`sectors.tex:155`）。两块则射线序不闭合，$\Omega<2\pi$ 无定义；四块以上论文未证。 |
| 三角核 $T$ | $\langle a,b,c\mid aba=bab,\ bcb=cbc,\ cac=aca\rangle$（`sectors.tex:5` 逐字） | 引理 4.1（`lem:orbit-control`）、§5 全部、引理 7.3 的 $G_0$ 骨架 | `[机械理由]` 三条长度 3 的关系给出 Digne 坐标里的"等边三角形三边反射"（`sectors.tex:74`）；关系少一条则只剩两条镜线，反射群无限、$L_{uv}$ 的"第三条镜线 $D_{uv}$"（`sectors.tex:97`）不存在。 |
| 对角标签 | `1`（`assembly.tex:10` `def:matrix`；`Model.lean` `if s = t then 1`） | `thm:main` 第二合取支 `main.2.1`；Artin 群定义要求 $m_{ss}=1$ | `[机械理由]` 改成别的值则不再是 Coxeter 型矩阵，`artinRelators` 的 $s^2$ 型关系消失，$\ell(s_i^2)=D$ 的归一化（`eq:braid-shift` 推论）断裂。 |
| 非对角标签集合 | $\{2,3,\infty\}$（Lean `⊤ : WithTop ℕ`，`Model.lean` `Label := WithTop ℕ`；`main.2.2` 逐字 `= 2 ∨ = 3 ∨ = ⊤`） | 定理 1.1 的"off-diagonal entries in {2,3,∞}"（`docs/254.md` 同句） | `[机械理由]` `explicitMatrix` 的四分支（`:1`/`Adjacent→3`/`Distant∨Sentinel→2`/`else ⊤`）是**穷尽且互斥**的：`main.2.2` 只允许三种值，若允许 4 则 $B_{40}$ 关系不再由"标签 3"提供，辫子估计无从引用。 |
| $m_{de}$ | $\infty$（`assembly.tex:46` 逐字 `In particular $m_{de}=\infty$, and neither $d$ nor $e$`） | 引理 5.1（`lem:common-centralizer`，`assembly.tex:241`）：$C_G(d)\cap C_G(e)=T$ | `[推测]` 失败路线 1：若 $m_{de}=n<\infty$，$d,e$ 生成有限二面体型 Artin 子群，其共同中央子群会带入额外元素，$T$ 不再是交集 ⇒ `geometric_tupleCentralizer` 的 $=$ 变 $\supseteq$，$G_0*_T(T\times F(d,e))$ 的正常形不再唯一。证据来源：`assembly.tex:241–298` 的证明只用到"$d$ 与 $e$ 之间无关系"。 |
| $m_{qu}$（哨兵对 $a,b,c$） | `2`（Lean `Distant s t ∨ Sentinel s t then 2`；`Sentinel` = `s.val = 3 ∨ s.val = 4` 且 `t.val < 3`） | 引理 5.1 中 $d,e$ 与 $a,b,c$ 交换 ⇒ 共同中央子群包含 $T$ | `[机械理由]` 标签 2 是"$d$ 与 $a$ 交换"的唯一实现；改成 3 会引入 $dad=ada$，$C_G(d)$ 缩小到不含 $a$ 的程度，$T\subseteq C_G(d)\cap C_G(e)$ 反向包含即失败，后续 $T\times F(d,e)$ 不成立。 |
| $F(d,e)$ | 自由群 on $\{d,e\}$（由 $m_{de}=\infty$） | 引理 5.2（`lem:geometric-centralizer`，`assembly.tex:298`）与 §6 的 $G\cong G_0*_T(T\times F(d,e))$ | `[分析]` 需要一个**非循环**自由群来让"轨道在 $d,e$ 方向分离"，单生成元的 $\mathbb Z$ 不够；具体论文用法见 A-2 §6 块。 |
| $G_0$ | `((T*_{B_3^{ab}}B_{40}^{ab})*_{B_3^{bc}}B_{40}^{bc})*_{B_3^{ca}}B_{40}^{ca}`（`eq:iterated-amalgam`，`assembly.tex:212`） | 引理 5.4 / 定理 1.1 的 $G_0$ 侧 | `[机械理由]` 三层嵌套（非三块并列）是引理 7.3（`lem:amalgam-normal-form`，`assembly.tex:143`）归纳结构的直接产物；并列写法需额外的三方 amalgam 引理，论文没有。 |

### A-5.2 辫子层：$k=20$ 的全部算术

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $l=2k$ | $k=20$，`braids.tex:104` 附近 "We retain $l=2k$ with $k\ge3$ until the final arithmetic, where $k=20$" | 命题 3.1（`prop:braid-angle`，`braids.tex:12`）证明的两段式参数化 | `[机械理由]` $l$ 必须是偶数：$k$ 个两两交换的平方 $s_1^2,s_3^2,\ldots,s_{2k-1}^2$ 与"前后两半块"的 $Z_k,Z_k'$ 都要落在索引 $\le l-1$ 内。 |
| $L_1,L_j,Z_r,N_r$ | $L_1=1,\ L_j=s_{j-1}L_{j-1}s_{j-1},\ Z_r=L_1\cdots L_r,\ N_r=\binom r2$（`eq:braid-centers-definition`，`braids.tex:35`） | 引理 3.2（`lem:braid-centers`，`braids.tex:41`）全部；中心配对 `eq:braid-central-pairing` | `[机械理由]` $N_r=\binom r2$ 是 $Z_r$ 的正字母数之半（"$2N_r$ letters"）；$L_j$ 有 $2(j-1)$ 个字母 ⇒ $\ell(Z_r)^2=2N_r\alpha$。字母数一变，$\alpha$ 归一化即错。 |
| $Z_2,Z_3$ | $Z_2=s_1^2,\ Z_3=(s_1s_2)^3$（`lem:braid-centers` 内式） | 结论比值的分子/分母：$\ell((s_1s_2)^3)/3\ell(s_1^2)$ | `[机械理由]` $N_3=3$ 是分母里的 3；若 $\delta$ 共轭索引差一，$Z_3$ 变 $s_1^3$ 型元素，`eq:braid-central-pairing` 的 $i<r$ 条件即破。 |
| $\delta$ | $s_1\cdots s_{l-1}$，$\delta s_i\delta^{-1}=s_{i+1}$（`eq:braid-shift`，`braids.tex:48`） | 三处：所有平方等长 $D$；把 $(s_1,s_{j-i+1})$ 送到 $(s_i,s_j)$（`eq:nonadjacent-pairing`）；把 $Z_k$ 送到 $Z_k'$ | `[机械理由]` `braids.tex` 逐字提醒 "Every successive use of \eqref{eq:braid-shift} has index at most $l-2$" ⇒ 该式只对 $i\le l-2$ 成立，索引上界被用到极限；$l$ 再小一次就不能同时完成"配对平移"和"半块平移 $k$ 步"（后者最大用到 $2k-2$）。 |
| $\langle s_i^2,Z_r\rangle$ | $=\ell(Z_r)^2/N_r$（`eq:braid-central-pairing`，`braids.tex:52`，$2\le r\le l,\ 1\le i<r$） | §5 扇区角的分子：$\langle U,H\rangle=\ell(H)^2/3$（`sectors.tex:186`，$r=3$） | `[机械理由]` 该式对 $\ell(Z_r)=0$ 也成立（论文逐字 "including when $\ell(Z_r)=0$"）⇒ 不存在除零风险；但 $\alpha$ 的"相邻辫子关系取值相等"一步依赖配对的双线性与不变性（`lem:centralizer-character`）。 |
| $D$ | $D=\ell(s_1^2)>0$（`prop:braid-angle` 假设；`lengths.tex:86` 的 $D=\inf_x d(x,gx)$ 是同名不同物） | 全部归一化：$R_r=\ell(Z_r)^2/(N_r^2D^2)$、$c_0=\langle s_1^2,s_3^2\rangle/D^2$ | `[机械理由]` 假设 $\ell(s_1^2)>0$ 是**唯一入口**：若为 0 则 $D=0$、$R_r,c_0$ 无定义。`[分析]` 这正是引理 4.1 反证结构要排除的情形之一——论文用"比值 $>1/2$"去否定"$\ell(H)=0$"型退化。 |
| `eq:braid-recursion` | $N_rR_r=1+(r-2)(3R_3-1)+\binom{r-2}{2}c_0$（`braids.tex:154`，$3\le r\le 2k$） | 把 $r=k$ 代入后得 $3R_3$ 的下界 | `[机械理由]` 系数 $\binom{r-2}{2}$ 来自"$j\ge3$ 的 $L_j$ 各贡献 $(j-3)c_0$"求和；$\langle g,L_j\rangle=(3R_3-1+(j-3)c_0)D^2$。论文逐字保留 $L_3$ 不展开："this calculation does not expand the noncommuting $s_2$-letters inside $L_3$"——一旦展开，$c_0$ 计数会重复。 |
| $c_0\ge-\frac1{k-1}$ | $=-1/19$（`eq:lower-cross-pairing`，`braids.tex:166`） | 递推式里 $c_0$ 的下界 | `[机械理由]` 来自 $k$ 个交换平方之积的非负性：$kD^2+k(k-1)c_0D^2\ge0$。Lean 侧同一事实写作 `0 ≤ 20*q + 380*v`（`Braids.lean:392 hodd`），其中 $380=k(k-1)=20\cdot19$；$k$ 变则两个数同时变。 |
| $R_k\ge c_0$ | （`eq:disjoint-centers`，`braids.tex:193`） | 消去未知 $R_k$ | `[机械理由]` 证明用两次不同特征标展开得 $\langle Z_k,Z_k'\rangle=N_k^2c_0D^2$，再由 $\ell(Z_k(Z_k')^{-1})^2=2N_k^2D^2(R_k-c_0)\ge0$。因子 $1/4$（逐字 "the factor $1/4$ follows by bilinearity"）来自 $(2N_k)^2$ 与 $x_p^2,y_q^2$ 的平方归一；丢掉它则 $c_0$ 被低估 4 倍。 |
| $N_k-\binom{k-2}{2}$ | $=2k-3$（`braids.tex:196` 附近逐字），$k=20$ 时为 $37$ | 递推代入 $r=k$ 后的合并 | `[机械理由]` $\binom{20}{2}-\binom{18}{2}=190-153=37$。**注意**此 37 与构造层的私有字母数 37 数值相同但来源独立（前者 $=N_k-\binom{k-2}{2}$，后者 $=2k-2$）；`[分析]` 两者都等于 $2k-3$/$2k-2$ 型表达式，故 $k$ 一改两处同时改——论文未指出这一巧合。 |
| $3R_3\ge1-\frac{3k-4}{(k-1)(k-2)}$ | `braids.tex:197–201` 两行不等式链 | 最终算术的母式 | `[机械理由]` 第二步用的正是 $c_0\ge-1/(k-1)$；符号要求 $2k-3$ 前系数为正（$k\ge3$）。$k$ 若 $\le2$ 则 $\binom{k-2}{2}$ 与分母 $k-2$ 同时失效。 |
| $3R_3$ | $\ge1-\frac{56}{342}=\frac{143}{171}$（$k=20$ 逐字） | 命题 3.1 结论 `eq:braid-angle-bound` | `[机械理由]` $56=3k-4$、$342=(k-1)(k-2)=19\cdot18$。 |
| $R_3$ | $\ge\frac{143}{513}>\frac14$（同上；$513=3\cdot171$） | `eq:braid-angle-bound`：$\bigl(\ell((s_1s_2)^3)/3\ell(s_1^2)\bigr)^2\ge143/513$ | `[机械理由]` $143/513>1/4\iff572>513$（$4\cdot143=572$）。Lean 逐字把这条换算做在整数侧：`Braids.lean:437 hraw : 572*q ≤ 57*stableLengthAt x (braidCenter s 2)^2`，最后 `norm_num` + `nlinarith` 收尾；$572=4\cdot143$ 的 4 来自 $q=\ell(s_0)^2$ 与 $D=\ell(s_0^2)=2\ell(s_0)$ 的差（$\ell(g^m)=m\ell(g)$，`eq:length-powers`）。 |
| 比值 | $>1/2$，且 $=\ell((s_1s_2)^3)/(3\ell(s_2^2))$（`prop:braid-angle` 内式） | §5 扇区角：$\cos\theta=\ell(H)/(3\ell(U))>1/2$（`sectors.tex:190` `eq:sector-angle`） | `[机械理由]` 这是全篇唯一的"数值 $\to$ 几何角度"接口：$>1/2$ 才给出 $\theta<\pi/3$，进而 $6$ 个扇区总角 $\Omega<2\pi$，才有盖帽的 $\sin(\Omega/4)<1$。$\sqrt{1/4}=1/2$，故 $143/513$ 只需**严格**超过 $1/4$；`[分析]` 阈值 $k\ge14$：要求 $\frac{3k-4}{(k-1)(k-2)}<\frac14\iff k^2-15k+18>0$，$k=14$ 时 $38/156\approx0.2436<0.25$，$k=13$ 时 $35/132\approx0.2652>0.25$ 失败 ⇒ 论文取 20 有约 6 的余量（论文未解释）。 |
| Lean 侧 20/19/17/306/380 | `hodd 0 ≤ 20*q + 380*v`；`hpc₁₉` 取 `n := 17`；`hQ₁₉` 展开为 `380*(2*q + β + 17*β + 306*v)`；`lengthPairing_disjoint_centers (n := 19) (k := 19) (α := v)`（`Braids.lean:392–437`） | 机器里 $k=20$ 的显式实例化 | `[机械理由]` $306=17\cdot18=\binom{18}{2}\cdot2$ 型系数由 `braid_center_character` 的 $(n)(n+1)$ 项生成；$380=2N_{20}=2\binom{20}{2}$ 是 $Z_{20}$ 的字母数；`19` 是 0-索引下 $k-1$。全部以字面量写死，`[分析]` 改 $k$ 需同时改五处字面量并重新保证 `omega`/`norm_num` 侧的索引不等式（`hn : n+2 ≤ m` 即 $r\le l$）。 |
| `SelectedPositions` | `{s : Finset ℕ // s.card ≤ 3}`（`Braids.lean:462`） | 辫子字不变量的"至多同时追踪 3 个位置" | `[分析]` 上界 3 与 §4 三价/三角结构同步（论文无对应物）；`[推测]` 放到 4 会破坏 `swapPositions` 归纳时的分情形闭合，未见机器验证。 |

### A-5.3 长度层：CAT(0) 通用工具里的数值

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| 中点比较 | `eq:midpoint-comparison`（`lengths.tex:23`）由 `eq:distance-convexity`（`:18`）取 $t=\tfrac12$ 得 | 引理 2.1（`lem:comparison`，`:14`）；`eq:quadrilateral`（`:28`）的前置 | `[机械理由]` `eq:quadrilateral` 的证法逐字用 "$d(q,s)^2\le2d(q,m)^2+2d(s,m)^2$"（`:49`，即 $(A+B)^2\le2A^2+2B^2$）。系数 2 是**凸平方法**的产物；若改用中点距离的一次版（不带平方），后续所有 $\ell^2$ 二次型论证（`eq:parallelogram`）不再成立。 |
| 四边形不等式 | `eq:quadrilateral`（`lengths.tex:28`） | 两处：半单性（`lem:semisimple`，`:74`）与平行四边形不等式 `Q(u+v)+Q(u-v)\le2Q(u)+2Q(v)`（`:163`，由四点循环代入 + 除 $n^2$ 取极限，`:156–163`） | `[机械理由]` 它是"从点态几何到二次型"的唯一通道；论文逐字写明四点的循环顺序（"in that cyclic order"），换序即失去正确的符号。 |
| 稳定长度 | $\ell(g)=\lim d(o,g^no)/n$（`eq:stable-length`，`:59`），$\ell(g^m)=m\ell(g)$（`eq:length-powers`，`:68`） | 全篇分母/归一化；Lean `stableLengthAt` | `[机械理由]` 存在性靠次可加性 + "$\limsup a_n/n\le a_k/k$ for every $k$"（`:61–64`）。$m$ 次幂的线性性正是 A-5.2 中 $572=4\cdot143$ 那个 4 的来源。 |
| 最小位移 | $D=\inf_x d(x,gx)$（`:86`）；$\ell(g)=D$ 且取到（`lem:semisimple`）；$D=0$ 时极小点被固定、稳定化子有限（`:115`） | 中央子群特征标引理的 Busemann 构造 | `[机械理由]` "proper ⇒ 闭球紧 ⇒ 下水平集取到"是**唯一**用到 properness 的地方（另一次在 `eq:orbit-control` 的紧饱和）。若空间不完备/不 proper，半单性失效，$\ell$ 与 $D$ 分离，$b(z)$ 的极限构造断链。 |
| 配对 | $\langle g,h\rangle$ 由 `eq:pairing-definition`（`:135`）给出；平行四边形恒等式 `eq:parallelogram`（`:168`）+ 极化 | 交换族上 $\ell^2$ 半正定二次型；`lem:commuting-form`（`:126`）；文献支撑逐字引 `\cite[Theorem~14.6]{Rodenhausen2013}`（`:122`） | `[机械理由]` 系数 $\tfrac12$（极化）决定 A-5.2 里 "factor $1/4$" 的位置；半正定性给 $\ge0$，是 $c_0\ge-1/(k-1)$、$R_k\ge c_0$ 两条约束的符号来源。 |
| Busemann 漂移 | $b(z)=\lim(d(z,g^nx)-nD)$（`:213`），$1$-Lipschitz（`:216`） | `lem:centralizer-character`（`:193`）：$D\chi(h)=\langle g,h\rangle$ | `[机械理由]` 证明逐字"Dividing the inequality by $2nD$"（`:229`）⇒ 必须 $D>0$；再以 `eq:busemann-difference`（`:230`）在 $z=kx,w=x$ 处取值（`:234`）。$D=0$ 时整个特征标不存在。 |

### A-5.4 扇区层：把 $>1/2$ 变成 $\Omega<2\pi$

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $R,C$（轨道控制） | `R,C<\infty`，$Ty$ 是 $R$-dense，$d_T(s,t)\le C(1+d_Y(sy,ty))$（`eq:orbit-control`，`sectors.tex:49–50`） | 引理 4.1（`lem:orbit-control`，`:46`）；后续 $M$、$C_1$、$\eta n/(2C)$ 全依赖 $C$ | `[机械理由]` 证明给出 $C$ 的具体取法：紧饱和 $R=\max_{p\in K}d(y,p)$；测地线分成 $N=\max(1,\lceil L\rceil)\le L+1$ 段；增量满足 $d(y,qy)\le2R+1$；"$C$ = 这些增量的最大字长、并放大到至少 1"。$R$ 一变，$2R+1$ 与 $M$ 同步变；$C\ge1$ 的下放会破坏 $+1$ 的合并。 |
| $2R+1$ | 同上（`:60`） | 有限增量集合 ⇒ properness 生效；亦进入 `eq:bounded-edge-word`（`diagrams.tex:297`）的前提 $d_Y(sy,ty)\le2R+1$ | `[机械理由]` 每段长 $\le1$、两端各偏移 $\le R$ ⇒ $2R+1$；$\lceil L\rceil$ 的 $+1$ 保证 $N\ge1$。 |
| $L_u,\ L_{uv}$ | $L_u=2e_{D_u},\ L_{uv}=2(e_{D_u}+e_{D_v}+e_{D_{uv}})$（`eq:mirror-translations`，`sectors.tex:97`） | 扇区坐标 $v_*(\lambda,\mu)=\lambda L_u+\mu L_{uv}$（`eq:separating-coordinates`，`:161`）；正定性检验 | `[机械理由]` 因子 2 = "两次反射的平移部分是镜线距离的两倍"（`u\cdot\xi=e_{D_u}+r_u\xi`，`:88`）；$D_{uv}$ 是 $D_u\cap D_v$ 处的**第三条**镜线（`:99` 逐字 "distinct from one another and from $D_a,D_b,D_c$"），少了它三个扇区无法在 $\Vert\cdot\Vert_1$ 下区分。 |
| $\Vert\cdot\Vert_1$ | $E=\bigoplus_{D\in\mathcal D}\mathbb Re_D$ 上的 $\ell^1$（`sectors.tex` 约 `:78`） | `eq:mirror-lipschitz` $\Vert V(t)-V(s)\Vert_1\le d_T(s,t)$（`:92`）；$\eta$ 的定义 | `[机械理由]` 用 $\ell^1$ 而非 Hilbert 范数是因为仿射等距作用在基向量置换下**恰好**是 1-Lipschitz；换范数则 `eq:sector-data` 的不等式 $\Vert iL_u+jL_{uv}\Vert_1\le C\Vert(i,j)\Vert_{U,H}$（`:175`）需重证。 |
| 扇区角 $\theta$ | $\cos\theta=\frac{\langle U,H\rangle}{\ell(U)\ell(H)}=\frac{\ell(H)}{3\ell(U)}>\frac12\Rightarrow0<\theta<\pi/3$（`eq:sector-angle`，`:189–152`；正定性 `:193` 保证 $\cos\theta<1$） | `lem:sector-data`（`:150`）六条射线 $a^2,z_{ab},b^2,z_{bc},c^2,z_{ca},a^2$ 的圆序 | `[机械理由]` $\langle U,H\rangle=\ell(H)^2/3$ 是 `eq:braid-central-pairing` 在 $r=3$（$N_3=3$）的实例（`:184–186`），而 $\ell(U)=\ell(u^2)$、$\ell(H)=\ell(z_{uv})$；因此 $>1/2$ 完全继承 A-5.2 的 $143/513>1/4$。若比值只 $\ge1/2$（非严格），$\theta\le\pi/3$ 仍可，但 $\Omega<2\pi$ 变 $\Omega\le2\pi$，盖帽的 $\sin(\Omega/4)<1$ 立即失效。 |
| $\Omega$ | 总角 $0<\Omega<2\pi$（`lem:sector-data`，`:158`），参数化为"半径 $r\ge0$ + 周期 $\Omega$ 的循环角，$r=0$ 处所有角粘合"（`:198–200`） | `eq:strict-ratios`（`prop:triangle-obstruction`，`:13`）的反证核心 | `[机械理由]` $6$ 个 $\theta<\pi/3$ 相加 $<2\pi$；这是"扇区数 6"与"角阈值 $\pi/3$"的**配对约束**——两者任一变动（四扇区/直角阈值）都不再自动给 $\Omega<2\pi$。 |
| $t_n$，$C_0$ | $t_n(p)=U^{\lfloor n\lambda\rfloor}H^{\lfloor n\mu\rfloor}$（`eq:sector-label`，`:236`）；$d_Y(f_n(p),t_n(p)y)\le C_0$（`eq:grid-error`，`:244–245`，"$C_0$ independent of $n,p$"） | 一致渐近映射（`lem:sector-maps`，`:241`）；$V(t_n(p))/n\to v_*(p)$（`eq:sector-convergence`，`:248`） | `[机械理由]` 取整误差 $\le1$ 个指数单位，经 `eq:mirror-lipschitz` + `eq:orbit-control` 折成绝对常数；共用的 $C_0$ 逐字要求 "common $C_0$"（`:278`）。$C_0$ 依赖作用与 $y$，**不依赖 $n$** 是后续矛盾的量词关键。 |
| $\delta$ | 存在 $\delta>0$，$d_Y(f_n(A_1),f_n(A_2))\ge\delta n$（`eq:region-separation`，`:260`） | 与 $2C_1$ 对撞（`lem:localized-degree`，`localization.tex:158`） | `[机械理由]` $\delta$ 来自区域分离，$\eta n/(2C)-1-2C_0$ 增长无界是其正比来源；$\delta n$ 的**线性**增长是与 $C_1$ 常数矛盾的全部本钱。 |
| $\eta$ | $\eta=\min_{p\in A_1,q\in A_2}\Vert v_*(p)-v_*(q)\Vert_1>0$（`:314`），$\Vert V(t_n(p))-V(t_n(q))\Vert_1\ge\eta n/2$（`:317`），$d_Y(sy,t_n(p)y)$ 与 $d_Y(sy,t_n(q)y)$ 之差 $\ge\frac{\eta n}{2C}-1-2C_0$（`:322`，"Decreasing the positive coefficient proves" `:324`） | `lem:sector-maps` 末段 | `[机械理由]` $\eta/2$ 的 $1/2$ 来自收敛（`:256`）的"充分大 $n$"；$\frac{1}{2C}$ 是 `eq:orbit-control` 的除 $C$；两个 $-1,-2C_0$ 分别来自 $\lceil\cdot\rceil$ 的 $+1$ 与两端网格误差。三处任一处放大只影响 $n$ 的阈值，不影响结论。 |
| $\epsilon$ | 盖帽半径 $\epsilon n$：$\epsilon=\tfrac12(1-\sin(\Omega/4))>0$（`lem:outer-cap`，`:329`、`:373`）；局部化用 $\min(\epsilon/3,1/4)$（`eq:small-patch`，`localization.tex:33`） | `prop:triangle-obstruction` 的两区域分离（`:168` "$\epsilon n$"、`:171` "$(\epsilon/3)n+o(n)$"） | `[机械理由]` 链条：$\phi\le\Omega/2<\pi$ ⇒ 弦长 $2\sin(\phi/2)\le2\sin(\Omega/4)$ ⇒ `eq:boundary-short` $d_Y(f_n(p),f_n(p'))\le2\sin(\Omega/4)n+o(n)$；锥化后逐字用三角不等式 $\max\{d(y,A)-d(A,q),d(y,B)-d(q,B)\}\ge\frac{d(y,A)+d(y,B)-d(A,B)}2$，两端距离 $n+o(n)$ ⇒ $\ge(1-\sin(\Omega/4))n-o(n)$ ⇒ 再取一半吸收 $o(n)$。**$\frac12$ 只为吞掉 $o(n)$**，$\epsilon/3$ 的 3 只为与 $B'\subset\mathrm{int}B$ 的三层包含留出余量。`[分析]` 只要 $\Omega<2\pi$ 就有 $\sin(\Omega/4)<1$，故 $\epsilon>0$ 的严格性完全承重在 $\Omega<2\pi$。 |
| 七段 | "The chord therefore splits into at most seven single-sector pieces"（`:348`） | `eq:boundary-short` 的逐段估计 | `[机械理由]` 六扇区展开后弦线最多横穿 6 个单扇区，加上"含两端点的扇区可能在两个末端各出现一次"（`:346–347`）⇒ $6+1=7$。`[分析]` 段数只需**有限**即可套用一致估计，7 不是最优常数；论文未声称最优。 |

### A-5.5 图示与局部化层

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| $\mathcal A$ | `nine generators`（$a,b,c$ + 三块的 $x_{uv},h_{uv}$，`diagrams.tex:42` 附近）；关系 $x_ix_{i+1}=h$（$i=1,2,3$，模 3，`eq:triangle-relations`，`:27`） | 引理 4.2（`lem:triangular-presentation`，`:22`）：消去私有生成子后回到 $T$ | `[机械理由]` 证明只用两条关系得 $h=x_1x_2$、$x_3=x_2^{-1}x_1x_2$，代回第三条即 $x_1x_2x_1=x_2x_1x_2$；三条关系缺一不可（两条时自由度过剩）。 |
| $\mathbb Z$-化 | $a,b,c\mapsto1$，$x_i\mapsto1$，$h\mapsto2$（`:51–53` 逐字） | 保证三角三面顶点 $g,gx_i,gh$（`eq:triangle-vertices`，`:49`）互异 | `[机械理由]` $h$ 的值必须是 $1+1=2$ 而非 $1$，否则 $gh=g x_i$ 型重合，"every target triangle has three distinct sides and three distinct corners" 失守，后续度数/符号论证（$\eta_\tau\in\{1,-1\}$）瓦解。 |
| link | 顶点 $q^+,q^-$（$q\in\mathcal A$，$18$ 个）；每块是"theta graph with three internally disjoint paths of length three from $h^+$ to $h^-$"（`:80`），三条显式路径（`:82–86`），"Its nine link edges are distinct"（`:88`）；跨块仅三条边 $\{a^-,b^+\},\{b^-,c^+\},\{c^-,a^+\}$（`:91–95`） | 引理 4.3（`lem:link-girth`，`:64`）：无长度 $<6$ 的回路（含平行边） | `[机械理由]` 三块只在 $a,b,c$ 的带符号方向相交（`:89`）；$C_1,C_2,C_3$ 三个 theta 的具体路径顺序就是后面 $k=3$ 情形距离表的来源。 |
| girth 三种情形 | $k=2$：块内距离 three ⇒ "the circuit has length at least six"；$k=3$：同号 $2+2+2$，异号 $1+3+2=6$（`:118`）；$k\ge4$：$2k-\lfloor k/2\rfloor\ge6$（`:126`） | 引理 4.3 收尾；$C(6)$ 条件 | `[机械理由]` "$\deg\ge6$" 是 Gersten 型 Euler 矛盾的必要输入。`[分析]` 并对本笔记早期写法作 `[纠正]`：$3F=2E\Rightarrow F=\tfrac23E$，故 $V-E+F=V-\tfrac E3$；若 girth $\ge m$ 则 $V\le\tfrac{2E}{m}$，于是 $V-E+F\le E\bigl(\tfrac2m-\tfrac13\bigr)$，右端 $\le0$ **当且仅当 $m\ge6$**（$m=5\to+E/15$、$m=4\to+E/6$、$m=3\to+E/3$，均与 $V-E+F=2$ 不相冲）⇒ $6$ 是这条计数论证的**临界值**而非松取值；论文取 $\ge6$ 与引用文献（Gersten）口径一致，`[推测]` 论文未讨论 $m<6$ 时可否用别的输入补救。 |
| $M$ | 取整数 $M$ 使 $d_Y(sy,ty)\le2R+1\Rightarrow d_T(s,t)\le M$（`eq:bounded-edge-word`，`diagrams.tex:297`） | 引理 4.4（`lem:controlled-diagrams`，`:275`）：边路径长 $\le M+6$，面边界 $\le3(M+6)$ | `[机械理由]` "$+6$ = 每条选定路径两端各加三个常数步"（`:311–312` 逐字 "Add three constant steps at each end"）；面边界是三条边 ⇒ $3(M+6)$。边界字母表 $\{a^{\pm1},b^{\pm1},c^{\pm1},1\}$（`:322`）有限 ⇒ "finitely many such boundary types"，$L$ 的有限性由此而来。 |
| $D$（图示层） | $D=\max\{d_Y(y,ay),d_Y(y,by),d_Y(y,cy)\}$（`:301`） | $C_1=DL+R+1$ | `[机械理由]` 名字与 §2 的 $D=\ell(g)$ 冲突但作用域分离；$DL$ 是"$D$-倍字长 $L$ 的位移"。 |
| $L$ | 所有填充中出现的标签的最大 $d_T(1,s)$（`:410–414`），逐字 "It is chosen once and does not depend on $f$" | 同上 | `[机械理由]` 依赖"私有生成子是 $a,b,c$ 的字"（`:413`），即三角呈现的消去性；否则 $L$ 无限。 |
| $C_1$ | $C_1=DL+R+1$（`:427`），$d_Y(sy,f(p))\le C_1$（`eq:all-points-control`，`:284`），逐字独立于 $f$ 与其模数（`:287`） | 局部化 $2C_1$ 与 $\delta n$ 的对撞 | `[机械理由]` 三段三角不等式 $d_Y(sy,s_0y)+d_Y(s_0y,f(v_0))+d_Y(f(v_0),f(p))\le DL+R+1$（`:418–425`）；$+1$ 是"最后一个小三角形内的直径 $\le1$"。 |
| $C_1,C_2$（局部化） | 存在与 $n$ 无关的 $C_1$：$d_Y(sy,f_n(p))\le C_1$（`eq:local-all-points`，`localization.tex:70–71`）；$d_Y(sy,t_n(p)y)\le C_1+C_0$（`:90`）；$\Vert V(s)-V(t_n(p))\Vert_1\le C_2$（与 $n,p,s$ 无关，`:93–95`） | 绕数/局部度（`lem:projected-approximation`，`:82`；`lem:localized-degree`，`:158`） | `[机械理由]` $C_1+C_0$ 是两个常数的直接相加；$C_2$ 靠 `eq:mirror-lipschitz` 把距离折成反射坐标差。**量词关键**：$C_1,C_2$ 在 $n$ 之前选取（见 A-3 设计约束清单）。 |
| $2C_1$ | $d_Y(f_n(p),f_n(p'))\le d_Y(f_n(p),sy)+d_Y(sy,f_n(p'))\le2C_1$（`localization.tex:185–186`） | 与 `eq:region-separation` 的 $\delta n$ 矛盾，从而每个覆盖出现都落在 $\mathrm{int}B$ 内 | `[机械理由]` 这里是"同一目标胞腔的三个群顶点标签 $s$"的选点；线性 vs 常数是矛盾的数学形状。 |
| $\rho$ | 外半径 $\rho\ge\cos(\theta/2)>\sqrt3/2$（`:44`）；径向同胚固定 $\le1/2$ 的半径、把 $\rho$ 送到 $1$（`:45–46`） | 显式参数球面构造（六三角形锥盘 $Q$） | `[机械理由]` $\theta<\pi/3\Rightarrow\theta/2<\pi/6\Rightarrow\cos(\theta/2)>\sqrt3/2$；这是把"扇区角上界"二次利用，保证 $Q$ 覆盖 $P$ 的半径 $1$ 边界环。$1/4$ 出现在 `eq:small-patch` 的 $\min(\epsilon/3,1/4)$，作用是让 $B$ 留在单一扇区内。 |
| $3F=2E,\ 2E\ge6V,\ V-E+F=2$ | `diagrams.tex:257` 逐字 | 命题 4.1（`prop:sphere-counts`，`:147`）：Euler 矛盾 | `[机械理由]` 第一式来自"每面三角形 3 边、每边两面"；第二式来自 girth $\ge6$（每条边界的 link 环 $\ge6$）；第三式是球面。三式给出 $2E=3F$、$F=\tfrac23E$、$V-E+F=2\Rightarrow V-\tfrac E3=2$ 与 $E\le\tfrac13\cdot6V$ 冲突。论文逐字说明方法取自 `\cite[Definition~3.1 and Corollary~4.6]{Gersten1987}`（`:143`）。 |

### A-5.6 Lean 侧专有参数（论文无对应物）

| 符号 | 值（逐字/位置） | 用在哪 | 动了会坏在哪 |
|---|---|---|---|
| `Letters` | `Fin 116`（`Model.lean:5`） | 矩阵域；`blockLetter b i` 的 $5+37b.val+(i-2)$ 编号 | `[机械理由]` 116 与 $5+3\cdot37$ 必须严格一致，否则 `Distant/Adjacent` 的 `Fin 39` 偏移越界。 |
| `Label` | `WithTop ℕ` | $\infty$ 用 `⊤` 表示 | `[机械理由]` 换成 `ℕ` 需另设哨兵值；`explicitMatrix_values`（`main.2.2`）的枚举要重写。 |
| `BraidRelations 39 s` | 谓词参数是**生成子个数**（`Braids.lean:388,441`） | `braid_forty_squared`、`braid_forty_ratio` | `[机械理由]` 内部 `hn : n+2 ≤ m` 即 $r\le l$；改 $m$ 需同步 `hodd` 的 $20,380$、`hpc₁₉` 的 $17$、`hQ₁₉` 的 $380,306$、`lengthPairing_disjoint_centers` 的 $n:=19,\ k:=19$。 |
| `143 * …^2 ≤ 57 * …^2` | `Braids.lean:388`，docstring 逐字 "Quantitative braid constraint, in a division-free form." | `Main.lean` 的 `hp` 处出口 | `[机械理由]` 机器版**避开除法**：以 $q=\ell(s_0)^2$ 为基，$572q\le57\ell(Z_3)^2$（`:437 hraw`），最后一步 `rw [stableLength_pow]` + `norm_num` 把 $572=4\cdot143$ 的 4 换给 $D^2=\ell(s_0^2)^2=4q$。 |
| `AngularSize n` | `3*(2*(n+1))` = $6(n+1)$（`Detour.lean:59`），配 `angularEquiv : Fin (AngularSize n) ≃ Fin (6*(n+1))`（`:61`） | 环带网格的角向分辨率 | `[机械理由]` $6$ = 扇区数、$2$ = 每扇区两半、$(n+1)$ = 径向层数；`finCongr` 靠 `omega` 证两侧基数相等，改任一个因子这条 `abbrev` 就与 `Fin (6*(n+1))` 不同构。 |
| `21+2*C` / `(20+C)+(1+C)` | `Detour.lean:98–105 innerLabel_edges` | 环带内圈相邻标号的位移界 | `[机械理由]` 论文里没有这条：机器用**显式环带绕行**代替论文的"锥化外盖帽"，故需把一次径向跳（$20+C$）与一次角向跳（$1+C$）相加，再归并成 $21+2C$。 |
| `22+4*C+4*E` | `Detour.lean:312–317 cap_exists` 第二合取 | 盖帽顶点函数的相邻位移界（$E$ = `orbit_uniformly_dense` 的稠密度） | `[机械理由]` 与上一条同族，多出绕行（`Detour`）带来的 $2C+2E$；$\le22+4C+4E$ 是有限枚举出的折线段数 $\times$ 单段界。 |
| `(1-d/2)*(n+1)-5*C/2-E ≤ dist y (v p•y)` | 同 `cap_exists` 第三合取 | 盖帽的径向排斥（对应论文 $(1-\sin(\Omega/4))n$） | `[机械理由]` $d$ 是"绕行额外长度系数"，故系数是 $1-d/2$；$5C/2$ 与 $E$ 是取整/稠密化余量。$d<2$ 才为正，见下行。 |
| `d : ℝ := 2*Real.sqrt (1+r^2-2*c*r)+r` | `Detour.lean:528`（$c$ 来自 `common_cosine`，$r$ 来自 `detour_gap`） | `hdetour : dist (axis y 0 R•y) (circle y R i t•y) ≤ d*R+3*C` | `[机械理由]` $\sqrt{1+r^2-2cr}$ 是**余弦定理**下单位扇区两端点间弦长（两半径 $1,r$、夹角余弦 $c$），再加绕行 $r$、乘 $R$、加网格误差 $3C$；这条是机器侧对论文 `eq:boundary-short` 的替代实现。 |
| `vec c p` | `(p.1 + c*p.2) + (Real.sqrt (1-c^2)*p.2)*I`（`SectorMetric.lean:9–10`） | 扇区坐标复嵌入（把 $(\lambda,\mu)$ 送进 $\mathbb C$） | `[机械理由]` 与论文"每扇区展开成 Euclidean wedge"等价：$\sqrt{1-c^2}=\sin(\arccos c)$ 要求 $-1\le c\le1$（机器里由 `common_cosine` 提供 $c$ 的范围假设）；$c$ 出界则 `Real.sqrt` 语义退化。 |
| `TriangleMesh.Exact` | `TriangleMesh.lean:45`，配套 `edge_card:106`、`exact_iff:150`、`exact_euler_inequality:180`、`six_turns_injective:209`、`degree_at_least_six:235`、`exists_link_backtrack:260` | 命题 4.1 的机器版 | `[机械理由]` 论文用拓扑 Euler 示性数 $V-E+F=2$；机器把"球面 $\to$ 平面 Euler"用 `finrank` 线性代数替身实现，`six_turns_injective` 对应 girth$\ge6$ 的"六转向单射"，`degree_at_least_six` 对应 $2E\ge6V$。 |
| `Main.lean` | `64` 行 / `3` 条声明，`not_geometric` + `main`（见 A-4.1 逐字） | 定理 1.1 出口 | `[机械理由]` 壳里唯一的取点操作是 `let y : Y := Classical.choice inferInstance`（`:38`）⇒ `Nonempty` 假设以选择公理落地。 |

### A-5.7 承重清单（跨层）

1. **唯一"数值 $\to$ 几何"接口**：$143/513>1/4$（`braids.tex:205–207`）$\to$ 比值 $>1/2$ $\to$
   $\cos\theta>1/2$（`sectors.tex:190`）$\to$ $\theta<\pi/3$ $\to$ $\Omega<2\pi$ $\to$
   $\sin(\Omega/4)<1$ $\to$ $\epsilon>0$。链条上任一环只给非严格不等式，最后一步即失效。
2. **两条增长率的对决**：$\delta n$（`sectors.tex:261`，线性）vs $2C_1$（`localization.tex:186`，常数）。
   全部"$C_1,C_2,C_0$ 与 $n$ 无关"的量词安排（A-3 设计约束清单）都是为这一行服务。
3. **唯一用到 properness 的两处**：`eq:orbit-control` 的紧饱和（`sectors.tex:57–63`）与
   `lem:semisimple` 的下水平集（`lengths.tex:86`）。`[分析]` 其余论证只用到度量与 CAT(0) 不等式。
4. **机器独有的三处替换**（论文无对应数值）：`AngularSize=6(n+1)`、`21+2*C`/`22+4*C+4*E`、
   `d=2\sqrt{1+r^2-2cr}+r`。它们共同把论文的"锥化外盖帽 + 拓扑 Euler"换成"显式环带 + `finrank`"。
5. `116`、`k=20`、`7 段`、`girth 6` 四个数值的中性程度**并不相同**，`[分析]` 分级如下：
   (i) `girth 6`——按 A-2.19(c) 的 `[纠正]` 后判定为**临界值**（$m\ge6$ 才使 $V-E+F\le0$），不是松取值；
   (ii) `k=20`——**有约 6 的余量**（阈值实为 $k\ge14$，见 A-5.2"比值"行），论文未优化；
   (iii) `7 段`——只要有限即可，非最优但无关紧要；
   (iv) `116`——随 (ii) 的 $k$ 一起变（$5+3(2k-2)$），本身不是独立承诺。
   论文没有任何一处主张这四者最优。

<!-- 完 -->

---

## 2.24 §5 开篇：顺序声明、切锥记号与 `energy:log-comparison`（`05-energy.tex` 第 3–33 行）

(a) 原文逐字（第 3–8 行，顺序声明——全文最关键的"设计动机"句之一）：

```tex
The sampling statements in Proposition~\ref{prop:sampling} concern finite
tables alone.  In this section they will be applied to functions obtained
from an isometric action chosen after those tables are known.  The order
is important: we first obtain a bound on every generator displacement
using the pointwise relative counts in the six-letter table.  Only then
do we use total variation estimates for action-dependent functions.
```

记号与引理式（第 10–32 行）：

```tex
We use the following standard notation for a complete $\CAT(0)$ space
$X$.  Its completed tangent cone at $x$ is denoted by $T_xX$, with vertex
$0$.  For $y\in X$, the vector $\log_x y$ has length $d(x,y)$ and the
direction of the geodesic from $x$ to $y$.  In a Euclidean metric cone set
\[
 \ip{u}{v}=\frac{\norm{u}^2+\norm{v}^2-d(u,v)^2}{2}.
\]
Thus $\ip{u}{v}=\norm{u}\norm{v}\cos\angle(u,v)$, where the angle is
truncated at $\pi$.  Multiplication of a vector by a nonnegative real
number always means radial dilation.  No additive vector-space structure
on a cone is assumed.

We will use strong convexity of squared distance, first variation, the
flat-triangle equality theorem, and the tangent-cone theorem for
$\CAT(0)$ spaces; see \cite[Chapters~II.1--II.3, in particular
II.2.9--II.2.10, II.3.6, and II.3.19]{BH1999}.  These results do not require
properness.  In particular, comparison of angles with comparison angles
gives
\begin{equation}\label{energy:log-comparison}
 d(y,z)^2\ge
 d(x,y)^2+d(x,z)^2
 -2\ip{\log_x y}{\log_x z}.
\end{equation}
All the tangent cones below are completed cones.
```

(b) `[补]` `energy:log-comparison` 的来路（原文只写"comparison of angles with comparison angles"）：
欧氏比较三角形中余弦定理给出**等式**
$d(y,z)^2=d(x,y)^2+d(x,z)^2-2d(x,y)d(x,z)\cos\angle_x^\#(y,z)$；
$\CAT(0)$ 中"角 $\le$ 比较角"$\angle_x(y,z)\le\angle_x^\#(y,z)$（BH II.3.1 型单调性：角是沿两边趋向 $x$
的比较角之下确界），而 $\cos$ 在 $[0,\pi]$ 上递减 ⇒ $\cos\angle_x\ge\cos\angle_x^\#$ ⇒ 上式右边变小 ⇒ $\ge$ ✓。
$\ip{\log_x y}{\log_x z}=d(x,y)d(x,z)\cos\angle_x(y,z)$ 正是锥内积定义（把 $\|u\|=d(x,y)$、
$\|v\|=d(x,z)$ 代入 $d(u,v)^2=\|u\|^2+\|v\|^2-2\|u\|\|v\|\cos\angle(u,v)$ 即可反解）✓。
"truncated at $\pi$" 的作用：锥上的（截断）角总 $\le\pi$，故余弦单调可用。

(c) `[机械理由]` "No additive vector-space structure on a cone is assumed" 与
"These results do not require properness" 是两条**限定声明**（见 3.2）：
前者限定本节只用径向运算与二次型（避免误用线性），后者为 §5 的 $X_\nu$ 与 §7 的 $Z$ 都不假设可分/有限维铺垫。
"Multiplication … always means radial dilation" 把 $a\cdot v$ 定义为沿同方向的长度缩放，
用于 `energy:mean-concavity`（$h_I$ 固定、$u$ 沿测地线）。

(d) `[推测]` "The order is important" 明示：若先取 TV 估计再取位移界，则
$\varepsilon$–界里的权 $\|v_s\|^2$ 尚未有一致上界，`lem:conditional-test` 中的 $M$ 无处可取，
$2M^2\eta$ 无法趋 0。证据来源：本句 + 第 7 行 "we first obtain a bound on every generator displacement"。
Lean 对应：`CATZero.lean:67 def mid`、`:87` 四边形（CN）公理化、`:106 structure ConeData`、
`:218 def add := 2·mid`（即 $u\oplus v$，见 2.33）；`TangentCone.lean:22-24 vertex/log/scaleN`、
`:51 radial_metric`、`:63-65` 注释 "The required radial metric law, with no asserted CAT(0) axiom."、
`:74 dist_log_le`、`:79 log_lipschitz : LipschitzWith 1 (log h o)`、`:88 normSq_log`、`:92 pairing_log`
（$\ip{}{}$ 的机器定义）。Lean 明确**不**声称切锥是 CAT(0)（原文也不使用这一条，只用其锥度量结构），
与 (c) 的"not require properness"同一保守取向。

## 2.25 引理 5.1（`energy:minimizer`，第 44–107 行）＋度量归一（第 109–123 行）

(a) 原文逐字（陈述，第 44–62 行）：

```tex
\begin{lemma}\label{energy:minimizer}
Let an infinite finitely generated group $G$ act properly and
cocompactly by isometries on a proper complete $\CAT(0)$ space $X$.
For a finite symmetric generating alphabet $S$, counted with its given
multiplicities, the function
\[
 E(x)=\frac1{|S|}\sum_{s\in S}d(x,sx)^2
\]
has a minimizer and its minimum is positive.  At any minimizing
basepoint, the vectors $v_s=\log_x(sx)$ satisfy
\begin{equation}\label{energy:zero-barycenter}
 \frac1{|S|}\sum_{s\in S}\ip{h}{v_s}\le0
 \quad(h\in T_xX).
\end{equation}
Equivalently, $0$ is their barycenter, and
\begin{equation}\label{energy:variance}
 \frac1{|S|}\sum_{s\in S}d(h,v_s)^2
 \ge \norm{h}^2+\frac1{|S|}\sum_{s\in S}\norm{v_s}^2.
\end{equation}
\end{lemma}
```

存在性证明（第 66–83 行）与一阶变分（第 85–106 行）关键句：

```tex
Choose a minimizing sequence $x_j$ and a compact set $C$ with $GC=X$.
There are $g_j\in G$ such that $y_j=g_jx_j\in C$.  Bounded energy bounds
each individual displacement $d(x_j,sx_j)$, since $S$ is finite.  It
therefore bounds
\[
 d(y_j,(g_jsg_j^{-1})y_j).
\]
The closed neighborhood of $C$ of any fixed finite radius is compact,
by properness of $X$.  Properness of the action implies that only
finitely many group elements can carry a point of $C$ into that
neighborhood.  For each $s$ there are consequently only finitely many
possibilities for $g_jsg_j^{-1}$.  Passing to a subsequence, the entire
conjugated generating tuple is constant and $y_j$ converges to a point
$y\in C$.
```
```tex
After averaging over the symmetric alphabet, the two terms on the
right have the same average: apply $s^{-1}$ to the second distance and
replace $s$ by $s^{-1}$.  Minimality and first variation now imply
\[
 0\le
 \left.\frac{d}{dt}\right|_{0+}
 \frac1{|S|}\sum_s d(x_{2t},sx)^2
 =-\frac4{|S|}\sum_s\ip{h}{v_s}.
\]
```

(b) `[补]` 逐步：
1. $d(y_j,(g_jsg_j^{-1})y_j)=d(g_jx_j,\;g_js x_j)=d(x_j,sx_j)$ ✓（等距作用把共轭位移还原为原位移），
   所以"$E(x_j)$ 有界 ⇒ 每个 $d(y_j,(g_jsg_j^{-1})y_j)$ 有界"，即共轭元把 $C$ 中的点送进 $C$ 的固定半径邻域。
2. "only finitely many group elements can carry a point of $C$ into that neighborhood"：
   proper $=\{g: d(x,gx)\le R\}$ 有限，且 $C$ 紧致 ⇒ 存在有限个 $g$ 满足
   $gC\cap N_R(C)\ne\varnothing$（标准：作用正常 ⇒ 映射 $G\times X\to X\times X$ 是 proper 的，
   限制在紧集 $C\times\overline{N_R(C)}$ 上的原像是紧的、又离散 ⇒ 有限）。
3. 对每个 $s$ 只有有限可能 ⇒ 对角线取子列使 $(g_jsg_j^{-1})_{s\in S}$ 常值（$S$ 有限）✓；
   $y_j\to y\in C$（紧），$d(\cdot,\cdot)$ 连续 ⇒ $E_{\text{tuple}}(y)=\inf$；
   再"Fixing one element $g_{j_0}$"，则 $g_{j_0}^{-1}y$ 对**原** tuple 取到下确界
   （因为 $g_{j_0}s g_{j_0}^{-1}$ 常值意味着 $d(g_{j_0}^{-1}y, s\,g_{j_0}^{-1}y)=d(y,(g_{j_0}sg_{j_0}^{-1})y)$）✓。
4. 最小值正：$E\equiv0\Rightarrow G$ 固定一点；proper 作用的稳定子有限，
   有限群固定 $\CAT(0)$ 空间的一点 ⇒ $G$ 有限，与假设矛盾 ✓。
5. 一阶变分的系数 $-4$：测地线 $x_t$ 初速 $\|h\|$，$d(x,x_t)=t\|h\|$。
   一阶变分（BH II.1.12(1)）：$\left.\frac{d}{dt}\right|_{0^+}d(x_t,y)=-\cos\angle_x(\dot x,\overline{xy})$，
   故 $\frac{d}{dt}d(x_t,y)^2\big|_{0^+}=-2\,d(x,y)\cos\angle=-2\ip{h}{\log_x y}$。
   把 $y=sx$、自变量换成 $2t$（链式再乘 2）⇒ $-4\ip{h}{v_s}$ ✓ 得显示式。
6. `[补]` "the two terms have the same average"：
   $\sum_sd(x,sx_{2t})^2$ 中对第 $s$ 项施加 $s^{-1}$（等距）⇒ $d(s^{-1}x,x_{2t})^2$；
   $S$ 对称 ⇒ 令 $s'=s^{-1}$ 重标 ⇒ $\sum_{s'}d(s'x,x_{2t})^2=\sum_sd(x_{2t},sx)^2$ ✓ 两项平均相同。
7. `[补]` `energy:variance` 由锥余弦公式逐项展开：
   $\frac1{|S|}\sum d(h,v_s)^2=\|h\|^2+\frac1{|S|}\sum\|v_s\|^2-\frac2{|S|}\sum\ip h{v_s}
   \ge\|h\|^2+\frac1{|S|}\sum\|v_s\|^2$（用式 `energy:zero-barycenter`）✓，
   且取 $h=0$ 知"$0$ 最小化到 $v_s$ 的平均平方距离"（原文末句）。
8. 无限性论证（第 109–116 行，$\chi$ 计算）：$P$ aspherical 且 $G$ 有限 ⇒ $\widetilde P$ 有限可缩复形 ⇒
   $\chi(\widetilde P)=1$；而 $\widetilde P\to P$ 是 $|G|$ 叶覆叠 ⇒ $\chi(\widetilde P)=|G|\chi(P)$ ⇒ $|G|=1$ ✓
   （故 $G$ 无限；这里同时用了 §3 的 asphericity 与 §2 的 $\chi(P)\ne0$ 侧信息——本素材记：
   $\chi(P)=\frac1{|G|}$ 是整数倒数，$\Gamma$ 的 $f=18,v=32,e=\dots$ 具体值见 2.1/2.4）。

(c) `[机械理由]` "counted with its given multiplicities"：$E$ 是**平均**而非最大，
若字母表里有重复（同一元素出现两次）会稀释界——这句是为了让 $|S|$ 作分母时语义无歧义。
$S$ 对称（含逆）是第 6 步重标的关键，也是引理 5.2 里"$d(x,a^{-1}x)=d(x,ax)$"能用上的前提。
归一 `energy:normalization` $\frac1N\sum_{s\in S_n}\|v_s\|^2=1$：$N=|S_n|$，
即字母表取**整个** $S_n$（每个置换都是生成元），对称性自动成立；
"Rescaling preserves completeness, properness, and the $\CAT(0)$ condition" 是合法性声明
（缩放度量不破坏任何前提），因此归一无损失。

(d) `[推测]` 失败路线：若 $G$ 不是无限群（例如某个实例给出有限 $G$），引理 5.1 不适用，
正定性与"$0$ 是重心"都会失效；作者用 $\chi(\widetilde P)=|G|\chi(P)$ 把这件事转成
**同调**排除，说明这条路线曾被担心。[推测] 另一条：证明"共轭 tuple 常值"依赖 $S$ **有限**；
若用无限生成集（例如整个 $G$）则对角线论证不闭合。证据来源：第 68 行 "since $S$ is finite"、
第 76–77 行 "only finitely many possibilities … Passing to a subsequence"。
Lean 对应：`ConditionalStar.lean:88-96 structure EnergyOrbit (L X : Type*) [Fintype L] [MetricSpace X] (M : ℝ)`
——把"最小点／能量 $=1$／一致界 $M$"作为**数据字段**（见 1.6 的清单 (e)：原文的这三件事在 Lean 里是构造出来的），
`:141/:291/:404 (O : ∀ n, EnergyOrbit (L n) (X n) M)`（序列版本），
`:213 theorem exists_of_geometric {L G X} [Fintype L] [Nonempty L] [Group G] …`
`:222 ∃ r, ∃ hr : 0<r, ∃ O : EnergyOrbit L (MetricScale.Space r hr X) 8`
——**常数 $M=8$ 被固定选取**（原文只说"gives an absolute constant $M$"，见 2.28）；
`MetricScale` 就是"缩放度量"的机器实现（`MetricProduct.lean:127 abbrev Space := MetricScale.Space (factor ι) …`）。

## 2.26 引理 5.2（`energy:displacement-bound`，第 125–164 行）：25 与 $(1+\varepsilon)/(1-\varepsilon)$

(a) 原文逐字（陈述＋证明要点）：

```tex
\begin{lemma}\label{energy:displacement-bound}
Suppose the six-letter table has pointwise relative error at most
$\varepsilon<1$ in the counts for positions $1$ and $k$, for every
$2\le k\le6$.  Then every action normalized as in
Equation~\eqref{energy:normalization} satisfies
\begin{equation}\label{energy:max-displacement}
 \max_{s\in S_n}\norm{v_s}^2
 \le25\frac{1+\varepsilon}{1-\varepsilon}.
\end{equation}
The bound is independent of the action.
\end{lemma}
```
```tex
Summing over $b$ shows that rows beginning with any fixed $a$ are
nonempty and that their conditional $k$th-coordinate distribution is
bounded above, pointwise, by
\[
 \frac{1+\varepsilon}{1-\varepsilon}\frac1N.
\]
The relation attached to a row $(a,s_2,\ldots,s_6)$ gives
$a^{-1}=s_2\cdots s_6$.  Since
$d(x,a^{-1}x)=d(x,ax)$, the triangle inequality and Cauchy--Schwarz give
\[
 \norm{v_a}^2\le5\sum_{k=2}^6\norm{v_{s_k}}^2.
\]
Average over the rows beginning with $a$ and use the preceding
pointwise bound and Equation~\eqref{energy:normalization}.  Each of the
five conditional averages is at most
$(1+\varepsilon)/(1-\varepsilon)$, proving the assertion.  This uses
only nonnegative weights, and therefore holds even when the weights
were chosen from an action after the table was revealed.
```

(b) `[补]` 全链条：
1. 条件分布的点态上界：$\Pr(k\text{th}=b\mid 1\text{st}=a)=\dfrac{Q_{1k}(a,b)}{\sum_{b'}Q_{1k}(a,b')}
   \le\dfrac{(1+\varepsilon)N^{1-\delta}}{(1-\varepsilon)N\cdot N^{1-\delta}}=\dfrac{1+\varepsilon}{1-\varepsilon}\cdot\dfrac1N$ ✓
   （分母用**下界** $(1-\varepsilon)N^{1-\delta}$ 对 $N$ 个 $b$ 求和 $=(1-\varepsilon)N^{2-\delta}$，非空性同此）✓。
2. $\|v_{a^{-1}}\|=\|v_a\|$：$d(x,a^{-1}x)=d(ax,x)=d(x,ax)$（左乘 $a$ 是等距）✓，
   所以用 $a^{-1}=s_2\cdots s_6$ 得到的界可直接搬到 $a$。
3. 三角不等式：$d(x,a^{-1}x)=d(x,s_2\cdots s_6x)\le\sum_{k=2}^6 d(s_{k+1}\cdots s_6x,\;s_k\cdots s_6x)
   =\sum_{k=2}^6d(x,s_kx)$ ✓（末段乘积是等距），即 $\|v_a\|\le\sum_k\|v_{s_k}\|$；
   Cauchy–Schwarz（5 项）⇒ $\|v_a\|^2\le5\sum_{k=2}^6\|v_{s_k}\|^2$ ✓。
4. 对"首字母 $=a$"的行取平均（权重 $=$ 条件分布，非负）：
   $\sum_b\Pr(b\mid a)\|v_b\|^2\le\frac{1+\varepsilon}{1-\varepsilon}\frac1N\sum_b\|v_b\|^2
   =\frac{1+\varepsilon}{1-\varepsilon}$（用归一 $\frac1N\sum\|v_s\|^2=1$）✓，
   于是 $5\times5=25$：**第一个 5 来自 Cauchy–Schwarz，第二个 5 来自 $k=2,\dots,6$ 五个条件平均** ✓。

(c) `[机械理由]` 为什么必须用"positions 1 and $k$"的**点态**相对误差而不是 TV 逼近：
点态界 $(1\pm\varepsilon)N^{1-\delta}$ 对**每个** $(a,b)$ 成立 ⇒ 条件分布的界不依赖任何独立性，
而 $\|v_b\|^2$ 是"表揭示后才选定的作用"决定的非负权——原文最后一句
"This uses only nonnegative weights, and therefore holds even when the weights were chosen from an
action after the table was revealed." 正是把 §4 的"表与作用无关"（`prop:sampling` 末句）与本引理对接的接口。

(d) `[推测]` 失败路线：若六字母表只给"平均每行"的相对误差（而非点态 $15N^2$ 个 $(r,q,u,v)$ 全控），
则 $\frac{Q}{\sum Q}$ 的上界可能对个别 $b$ 爆炸（例如某 $b$ 的 $Q$ 集中），
$\|v_a\|^2\le5\cdot(\text{某大值})$ 失去一致 $M$，`lem:conditional-test` 的 $2M^2\eta$ 不再趋 0。
证据来源：式 `sample:eq-six-pair` 的 $\max_{r<q}\max_{u,v}$ 双重最大，与引理 5.2 假设里
"for every $2\le k\le6$"的逐点形式。
Lean 对应：`MetricProduct.lean:425-431 six_letter_displacement_bound … dist x (A a x)^2 ≤ 25 * R`
（`R` 即 $(1+\varepsilon)/(1-\varepsilon)$，**25 被原样保留**）、`:454 normalized_minimum`；
`ConditionalStar.lean:300 word_lower`（"三角不等式 + 平均"的机器版本，带 `down : Admissible` 单调性假设）；
`SixCounts.lean:82 badPairs_bound`（点态 $\varepsilon$ 界的来源，见 2.23(d)）。

## 2.27 `energy:radial-identity`（第 168–181 行）＋引理 5.3（`energy:cone-mean`，第 190–226 行）

(a) 原文逐字：

```tex
For a geodesic from $u$ to $v$ in a $\CAT(0)$ Euclidean cone, write
$[u,v]_t$ for its point at parameter $t$.  Its squared
radial norm satisfies the exact identity
\begin{equation}\label{energy:radial-identity}
 \norm{[u,v]_t}^2
 =(1-t)\norm u^2+t\norm v^2-t(1-t)d(u,v)^2.
\end{equation}
If either endpoint is the cone vertex, the identity is immediate.
Otherwise the segment is a Euclidean segment in the sector between
its two rays when their angular distance is less than $\pi$.  When
their angular distance is at least $\pi$, it passes through the cone vertex, and
$\norm{[u,v]_t}=|(1-t)\norm u-t\norm v|$ gives the same identity.
```
```tex
\begin{lemma}\label{energy:cone-mean}
In a complete $\CAT(0)$ metric cone, $u\mapsto\ip{h}{u}$ is concave
along every geodesic, for fixed $h$.  Suppose a finite probability
distribution of vectors $V$ has barycenter $0$ and
$\mathbb E\norm V^2=1$.  If $V_1,\ldots,V_t$ are independent samples
and
\[
 m_1=V_1,\qquad
 m_j=[m_{j-1},V_j]_{1/j},
\]
then
\begin{equation}\label{energy:inductive-mean}
 \mathbb E\norm{m_t}^2\le\frac1t.
\end{equation}
For any deterministic list $V_1,\ldots,V_t$ one also has
\begin{equation}\label{energy:mean-concavity}
 \frac1t\sum_{j=1}^t\ip{h}{V_j}\le\ip{h}{m_t}.
\end{equation}
\end{lemma}
```
```tex
Subtract strong convexity of $d(h,\cdot)^2$ from
Equation~\eqref{energy:radial-identity} in the identity
$2\ip{h}{u}=\norm h^2+\norm u^2-d(h,u)^2$.  The quadratic terms
cancel, proving concavity.  Induction gives
Equation~\eqref{energy:mean-concavity}.

For the independent samples, condition on $m_{j-1}=u$.
The barycenter variance inequality gives
$\mathbb E[d(u,V_j)^2\mid u]\ge\norm u^2+1$.  Strong convexity
of squared distance from the cone vertex therefore gives, with
$a_j=\mathbb E\norm{m_j}^2$,
\[
 a_j\le(1-1/j)^2a_{j-1}+1/j^2.
\]
Starting with $a_1=1$, induction yields $a_j\le1/j$.
```

(b) `[补]` 三个验证：
1. `energy:radial-identity` 两种情形都直接展开：
 角距离 $\theta<\pi$：$\|[u,v]_t\|^2=\|(1-t)u+tv\|^2=(1-t)^2\|u\|^2+t^2\|v\|^2+2t(1-t)\|u\|\|v\|\cos\theta$，
 与 $(1-t)\|u\|^2+t\|v\|^2-t(1-t)d(u,v)^2$ 相等（因 $d(u,v)^2=\|u\|^2+\|v\|^2-2\|u\|\|v\|\cos\theta$）✓；
 $\theta\ge\pi$：$d(u,v)=\|u\|+\|v\|$ ⇒ 右式 $=((1-t)\|u\|-t\|v\|)^2$ ✓。
2. $a_j$ 递推的代数（原文只给结果）：由 `energy:radial-identity` 用 $u=m_{j-1}$、$v=V_j$、$t=\frac1j$：
 $\|m_j\|^2=(1-\frac1j)\|u\|^2+\frac1j\|V_j\|^2-\frac1j(1-\frac1j)d(u,V_j)^2$。
 条件期望（$\E\|V_j\|^2=1$，$\E d(u,V_j)^2\ge\|u\|^2+1$）：
 $a_j\le(1-\frac1j)a_{j-1}+\frac1j-\frac{j-1}{j^2}(a_{j-1}+1)$；
 $a_{j-1}$ 系数 $=(1-\frac1j)-\frac{j-1}{j^2}=\frac{j-1}{j}-\frac{j-1}{j^2}=\frac{(j-1)^2}{j^2}=(1-\frac1j)^2$ ✓；
 常数项 $=\frac1j-\frac{j-1}{j^2}=\frac1{j^2}$ ✓ ⇒ 原文递推式。
 归纳：$a_{j-1}\le\frac1{j-1}\Rightarrow a_j\le\frac{(j-1)^2}{j^2}\cdot\frac1{j-1}+\frac1{j^2}
 =\frac{j-1}{j^2}+\frac1{j^2}=\frac1j$ ✓，$a_1=\E\|V_1\|^2=1$ ✓。
3. `energy:mean-concavity`：凹性给 $\ip h{m_j}\ge\frac{j-1}{j}\ip h{m_{j-1}}+\frac1j\ip h{V_j}$，
 记 $S_j=j\ip h{m_j}$ ⇒ $S_j\ge S_{j-1}+\ip h{V_j}$（$S_1=\ip h{V_1}$）⇒
 $S_t\ge\sum_{j}\ip h{V_j}$ ⇒ 除以 $t$ ✓。
4. 凹性证明的"二次项相消"：沿测地线 $u(\tau)$，`energy:radial-identity` 给
 $\|u(\tau)\|^2$ 是**凹**的二次函数（$-\tau(1-\tau)d(u_0,u_1)^2$ 项），
 强凸性给 $d(h,u(\tau))^2\le(1-\tau)d(h,u_0)^2+\tau d(h,u_1)^2-\tau(1-\tau)d(u_0,u_1)^2$
 即同样带 $-\tau(1-\tau)$ 系数；代入 $2\ip h{u}=\|h\|^2+\|u\|^2-d(h,u)^2$，
 两个 $-\tau(1-\tau)d(u_0,u_1)^2$ **相消**，只剩线性插值 ⇒ 凹 ✓。

(c) `[机械理由]` 权重 $1/j$（而非 $1/j$ 的其它变体）恰好使 $(1-\frac1j)^2+\frac1{j^2}$ 型递推闭合成 $1/j$；
这是 Sturm 归纳均值的单位方差特例（第 185–187 行自述"the unit-variance case of Sturm's bound"，
引 `Sturm2003` Definition 4.6 / Theorem 4.7 proof (a)），作者声明"We include the short proofs in the
present normalization"，即**自带证明**而非仅引用。同理 `GigliNobili2021` Proposition 2.6 (2.7f)
与 Proposition 3.8 是 $\ip h\cdot$ 凹性的文献出处。

(d) `[推测]` 失败路线：若 $m_j$ 用"任意"归纳均值（如 $[m_{j-1},V_j]_{1/2}$）则 $a_j$ 不趋 0，
`lem:conditional-test` 里 $\|m_t\|\to0$ 的结论（$1/\sqrt t$）失效 ⇒ 整个"用 $t\to\infty$ 榨掉
$\ip{h_I}{v}$ 上极限"的机关作废。$1/j$ 权重是该机关唯一可行的选择。[推测] 证据来源：
本引理的 $1/j$ 与结论 $1/t$ 的精确匹配，以及 §4 特意准备"任意固定 $t$"的耦合（`sample:lem-coupling` 的 $t$）。
Lean 对应：`CATZero.lean:67 def mid`、`:218 def add := 2·mid`（见 2.33 的 $u\oplus v$）；
`MetricProduct.lean:53 def segment`、`:57 segment_apply`（逐坐标测地线，对应 $[u,v]_t$ 的乘积实现）、
`:81 segment_cn`、`:89 catZero`；`TangentCone.lean:24 scaleN`/`:51 radial_metric`（径向缩放与
$\|[u,v]_t\|$ 公式所需的度量律）；`ConeData.lean`（锥公理化的数据包装）。

## 2.28 序列设置、`energy:uniform-bound`（第 228–243 行）与引理 5.4（`lem:conditional-test`，第 246–295 行）

(a) 原文逐字：

```tex
Consider now a sequence of table instances indexed by $\nu$ for which
the conclusions of Proposition~\ref{prop:sampling} hold with errors
tending to zero, for every fixed test and every fixed positive integer
$t$.  Suppose their groups have geometric actions as above, and choose
the normalized minimizing basepoints $x_\nu$.  Write
$\Omega_\nu=\Omega_{n_\nu}$ for the nonempty finite set of master
matches and $\mu_\nu=\mu_{N_\nu}$ for its uniform distribution.
Lemma~\ref{energy:displacement-bound} gives an
absolute constant $M$ such that
\begin{equation}\label{energy:uniform-bound}
 \norm{v_s}\le M
 \quad\text{for all letters in all sufficiently large instances.}
\end{equation}
All statements about the limit are unchanged by discarding finitely
many instances.  The actions, their spaces, and the functions in the
next lemma may depend on the complete table instances.
```
```tex
\begin{lemma}[Uniform conditional test]\label{lem:conditional-test}
Let $I$ and $\{e\}$ be disjoint sets of fields with admissible union.
For each $\nu$, let $h_I$ be a function of the labels on $I$ with values
in $T_{x_\nu}X_\nu$, and suppose $\norm{h_I}\le B$ for a constant
independent of $\nu$ and the match.  For either fixed choice
$\sigma(s)=s$ or $\sigma(s)=s^{-1}$,
\begin{equation}\label{energy:conditional-test}
 \limsup_{\nu\to\infty}
 \mathbb E_{\mu_\nu}
 \ip{h_I}{v_{\sigma(e)}}\le0.
\end{equation}
Here $e$ in a subscript denotes the letter occupying that field.
\end{lemma}
```
```tex
The vector $h_I$ has the same value in every branch.  Form the
inductive mean $m_t$ of the branch vectors $v_{\sigma(e_j)}$.
Equation~\eqref{energy:mean-concavity} gives, for every coupled tuple,
\[
 \frac1t\sum_{j=1}^t\ip{h_I}{v_{\sigma(e_j)}}
 \le\ip{h_I}{m_t}\le B\norm{m_t}.
\]
The last step uses only the norm bound; it does not assume that $h_I$
is independent of the leaves.
```
```tex
Under independent uniform leaves,
Equation~\eqref{energy:inductive-mean} applies by
Equations~\eqref{energy:variance} and~\eqref{energy:normalization}.
Under the coupling, $\norm{m_t}\le M$, by convexity of the ball of
radius $M$.  Consequently the total variation comparison changes the
expected squared norm by at most $2M^2\eta_{\nu,t}$.  The branch
comparisons change the expectation of each scalar-product test by at
most $2BM\eta_{\nu,t}$.  It follows that
\[
 \mathbb E_{\mu_\nu}\ip{h_I}{v_{\sigma(e)}}
 \le B\sqrt{1/t+2M^2\eta_{\nu,t}}+2BM\eta_{\nu,t}.
\]
First take the upper limit in $\nu$ with $t$ fixed, and then let
$t\to\infty$.
```

(b) `[补]` 末式与"两个极限的次序"：
独立均匀叶下 $\E\|m_t\|^2\le1/t$（引理 5.3），Jensen ⇒ $\E\|m_t\|\le\sqrt{1/t}$；
把该律换成耦合律：$\E\|m_t\|$ 的差 $\le\sqrt{2M^2\eta}$（先算平方：TV 下 $\E\|m_t\|^2$ 变动 $\le2M^2\eta$，
再开方；$\|m_t\|\le M$ 因 $m_t$ 是 $\le M$ 半径闭凸集内点的凸组合，见 (a) 引用段），
分支 marginal 的 TV $\le\eta$ 使每个 $\ip{h_I}{v_{\sigma(e_j)}}$（绝对值 $\le BM$ 由柯西–施瓦茨 $B\cdot M$）
的平均误差 $\le 2BM\eta$ ⇒ 显示式 ✓。
取 $\limsup_\nu$（$\eta_{\nu,t}\to0$ 对固定 $t$）得 $\le B/\sqrt t$，再 $t\to\infty$ 得 $\le0$ ✓。
次序**不可交换**：$\eta_{\nu,t}$ 只对固定 $t$ 趋 0（§4 末句"none of the variance arguments asserts
uniformity for unbounded $t$"），故必须先 $\nu\to\infty$ 再 $t\to\infty$ ✓。
`[补]` $\sigma(s)=s^{-1}$ 的合法性：`sample:eq-six-pair` 的对称字母表与 `energy:variance`/归一对逆元同样成立
（$S_n$ 对称、$\|v_{s^{-1}}\|=\|v_s\|$），且引理 5.4 的 $h_I$ 只依赖 $I$ 的标号，逐分支换逆不改变耦合结构
（第 266–267 行 "Applying the fixed inversion $\sigma$ preserves this assertion"）✓。

(c) `[机械理由]` $M$ 的存在（不是显式常数）来自引理 5.2 的右端对 $\varepsilon\le1/2$ 一致有界
（$25\cdot3=75$ ⇒ 取 $M=\sqrt{75}$ 即可，原文不写）＋"$\nu$ 充分大"；
"discarding finitely many instances" 是 $\limsup$ 不变性，用来吸收"$\nu$ 充分大"。
"$h_I$ has the same value in every branch"是耦合第 1 条（restrictions to $I$ 恒等）的直接使用——
这是引理 4.4 三条性质**分别被用**的位置（见 2.22(c)）。

(d) `[推测]` 失败路线：若 $h_I$ 依赖叶（如 $h$ 由整条 match 决定），
则"$h_I$ 各分支相同"不成立，`mean-concavity` 无法把平均搬进内积；
作者用 $\norm{h_I}\le B$（与 match 无关）显式禁止这种依赖，说明曾遇到。
证据来源：陈述里 "independent of $\nu$ and the match" 的限定，与证明中
"The last step uses only the norm bound; it does not assume that $h_I$ is independent of the leaves."
的**双重**强调（一句里同时排除两种假设）。
Lean 对应：`MetricProduct.lean:425 six_letter_displacement_bound`（$M$ 的上游）、
`:454 normalized_minimum`；`ConditionalStar.lean:213 exists_of_geometric` 给出 `M = 8`
（Lean 里 $\varepsilon$ 事先固定 ⇒ 界 $25\cdot2=50$、$\|v_s\|\le\sqrt{50}<8$ ⇒ **显式选 8**，见 5.2）；
`EnergyOrbit`（`:88`）把 $M$、能量归一 $=1$、最小点三项打包；
`OrbitLimit.lean:21` 注释 "Actual orbit-coordinate arrays with a uniform bound from the minimizing …"；
`FiberLaw.lean`/`GenericMoment.lean`/`Moment.lean` 提供 $\E\|m_t\|^2$ 的 TV 搬运（对应 $2M^2\eta$、$2BM\eta$）。

## 2.29 轨道乘积度量与超滤极限：`energy:product-metric`（第 297–328 行）

(a) 原文逐字：

```tex
Enlarge $\Gamma$ by adding, for each of its prescribed two-edge paths,
the complementary two-edge path of its decoration square.  Denote
this fixed finite graph by $\widehat\Gamma$; its additional midpoint
vertices are distinct abstract vertices.  A master match gives a
consistent orbit realization of this graph in $X_\nu$: choose one
anchor at $x_\nu$, and send a vertex reached by the successive letters
$s_1,\ldots,s_k$ to $s_1\cdots s_kx_\nu$.  All core closed walks are
relations, and the decoration square relations guarantee consistency
on the added paths.  Fixing one path for each vertex shows that these
orbit points are at distance at most $LM$ from $x_\nu$, where $L$
depends only on $\widehat\Gamma$.

Take the finite product over the matches with metric
\begin{equation}\label{energy:product-metric}
 d_\nu((y_m),(z_m))^2
 =\frac1{|\Omega_\nu|}\sum_{m\in\Omega_\nu}d(y_m,z_m)^2,
\end{equation}
based at the tuple of minimizing basepoints.  It is a complete
$\CAT(0)$ space.  The vertex tuples have bounded distance from this
basepoint.  Fix a nonprincipal ultrafilter on the sequence index set
$\mathbb N$ and take the pointed metric ultralimit $Z$.  This space is
complete by \cite[Lemma~I.5.53]{BH1999}, and it is $\CAT(0)$ by
\cite[Corollary~II.3.10(2)]{BH1999}.  The bounded vertex tuples give a
configuration in $Z$ indexed by the vertices of $\widehat\Gamma$.
Midpoints and fixed-fraction points on segments in the products are
formed coordinatewise, and their ultralimits are the corresponding points
in $Z$ by uniqueness of geodesics.  We identify the abstract vertex
names with the resulting points.  Neither properness nor a dimension
bound for $Z$ is needed.
```

(b) `[补]` 机制：
1. $\widehat\Gamma$：§2 中每条"规定二边路径"（four-letter 表对应 $X\to Y\to Z$ 型二边路）配一个
 decoration square，square 有**互补**的第二条二边路；把这些补路也画进图，其内点成为新顶点
 （"additional midpoint vertices are distinct abstract vertices"）。因此 $\widehat\Gamma$ 的顶点数
 $=18$（$\Gamma$ 的顶点）$+$（prescribed 二边路径数），边数 $=32+2\times$(二边路数)（`[推测]` 具体计数论文未给，
 但 $L$ 只依赖 $\widehat\Gamma$ 有限 ⇒ 有界）。
2. 一致性：锚点 $x_\nu$，沿路 $s_1,\dots,s_k$ 映到 $s_1\cdots s_kx_\nu$。
 核心闭路是关系 ⇒ 值与路径选取无关（核心部分）；decoration square 的关系（$a^{-1}=s_2\cdots s_6$ 型的
 六字母关系与四字母关系）保证补路也一致 ✓。这正是"match 的存在性 ⇒ 关系成立"的用法。
3. 有界性：$d(x_\nu,s_1\cdots s_kx_\nu)\le\sum_i d(x_\nu,s_ix_\nu)=\sum_i\|v_{s_i}\|\le(\text{路长})\cdot M$
 ⇒ $L=\max_{\text{顶点}}(\text{固定路径长度})$ ✓（"Fixing one path for each vertex"）。
4. $d_\nu$ 是有限 $\ell^2$ 乘积 ⇒ 完备 $\CAT(0)$（逐坐标 CN 求和即可，不必引用文献）✓。
5. 超滤极限 $Z$：非主超滤 $\mathcal U$ 上的 pointed metric ultralimit；
 界 $LM$ 保证每个坐标tuple有界 ⇒ 极限点存在（`MetricLimit.point` 型构造）。
6. 中点/定比分点与 ultralimit 交换的理由：乘积空间测地线唯一 ⇒ 逐坐标形成的 $[u,v]_t$
 在极限中仍是唯一测地线的 $t$ 分点（"by uniqueness of geodesics"）✓；
 这是 §5.5 分数点论证（`energy:fractional-angle`）只搬运**距离**而非角度的原因。

(c) `[机械理由]` 为什么需要乘积 $+$ 超滤而不是直接取 $X_\nu$ 的极限：单个 $X_\nu$ 中"平均"无从定义
（$\E_{\mu_\nu}$ 是对 matches 的平均），把 $|\Omega_\nu|$ 个坐标并成一个 $\ell^2$ 乘积后，
"平均平方距离"恰好是该乘积空间里的距离平方；这样引理 5.4 的平均与 §5 全部几何估计在同一空间内可用 ✓。
"Neither properness nor a dimension bound for $Z$ is needed" 是**边界声明**（见 3.2）：
结论只用 $Z$ 的 $\CAT(0)$ 结构，不涉及 $Z$ 的拓扑维数。

(d) `[推测]` 失败路线：用 Gromov–Hausdorff 极限代替 ultralimit 需要 proper/一致有界覆盖数，
而 $X_\nu$ 的维数与几何无一致界；作者因此走 ultralimit（不要求 proper、不要求一致 doubling）。
证据来源：第 327–328 行的显式豁免句。另一风险：若 $\mathcal U$ 取主超滤则 $Z$ 退化为单个 $X_\nu$，
所有 $o(1)$ 变成固定 $\varepsilon$，`prop:configuration` 的"$\ge\pi/2$"会被削弱。
Lean 对应：`MetricProduct.lean:45 dist_sq`（`PiLp 2` 的平方距离 $=\sum_i$ 平方）、`:53-94 segment/catZero`、
`:116 def factor := 1 / Real.sqrt (Fintype.card ι)`、`:122 factor_sq`、`:127 abbrev Space := MetricScale.Space …`
——Lean 用 Mathlib 的 `PiLp 2` 加**尺度因子** $1/\sqrt{|\Omega|}$ 实现 $d_\nu$（把 $\frac1{|\Omega|}$ 变成度量缩放，
从而直接继承 `PiLp` 的 `CATZero` 实例）；
超滤极限在 `MetricLimit`（`MetricProduct.lean:222 MetricLimit.point` via `SeparationQuotient`）与
`OrbitLimit.lean:31 productCat`、`:35 boundedSection`、`:42 point`、`:43 catZero`、
`:46 tendsto_dist_sq`、`:54 dist_sq_eq`、`:59 dist_sq_lower`、`:68 segment`、`:89 segment_val`；
非主超滤用 Filter 语言（`Filter.atTop` 的细化），未见对"可数指标集"的额外假设 ✓ 与 (c) 一致。

## 2.30 引理 5.5（`energy:path-bounds`，第 331–364 行）与引理 5.6（`energy:quadrilateral`，第 374–403 行）＋ `energy:two-step-equality`

(a) 原文逐字：

```tex
\begin{lemma}\label{energy:path-bounds}
Every edge in $\widehat\Gamma$ has length one in $Z$.  Every two-step
path using two distinct fields of one decoration square has squared
endpoint distance at least two.  More generally, a path of $k\le3$
distinct core fields whose field set is admissible has squared
endpoint distance at least $k$.
\end{lemma}
```
```tex
For an edge with letter $s$, translation at its initial orbit vertex
identifies its squared length with $\norm{v_s}^2$, or with the same
quantity for $s^{-1}$.  Single-field total variation convergence,
Equation~\eqref{energy:uniform-bound}, and the normalization show that
its squared product length tends to one.
```
```tex
\begin{lemma}\label{energy:quadrilateral}
For four points $z_1,z_2,z_3,z_4$ in a $\CAT(0)$ space, let
$m=\operatorname{mid}(z_1,z_3)$ and
$n=\operatorname{mid}(z_2,z_4)$.  Then
\begin{equation}\label{energy:quadrilateral-inequality}
 d(z_1,z_3)^2+d(z_2,z_4)^2+4d(m,n)^2
 \le\sum_{i=1}^4d(z_i,z_{i+1})^2,
 \qquad z_5=z_1.
\end{equation}
In particular, equality between the two diagonal-square sum and the
side-square sum forces the diagonal midpoints to coincide.
\end{lemma}
```
```tex
Each decoration square has unit sides.  Both of its diagonals have
squared length at least two by Lemma~\ref{energy:path-bounds}.
Lemma~\eqref{energy:quadrilateral} forces both squared lengths to equal
two.  In particular,
\begin{equation}\label{energy:two-step-equality}
 d(u,w)^2=2
 \quad\text{for every nonbacktracking two-edge core path }u,v,w.
\end{equation}
Every such path was assigned a decoration table, including paths
whose two fields lie in the same fan.
```
`[校]` 上文 "Lemma~\eqref{energy:quadrilateral}" 为素材转写，原文是 "Lemma~\ref{energy:quadrilateral}"。

(b) `[补]` 边长趋 1 的算术（原文压缩为一句）：某坐标边 $=$ 该 match 下字母 $s$ 的位移 $\|v_s\|^2$；
乘积度量 $d_\nu^2=\frac1N\sum_{m}\|v_{s(m)}\|^2$，其中 $s(m)$ 是均匀 match 在字段 $e$ 上的值。
单字段边际 $\operatorname{TV}(s(m),\text{unif }S_n)=o(1)$ ＋ $0\le\|v_s\|^2\le M^2$
⇒ $|\E\|v_{s(m)}\|^2-\frac1N\sum_{s}\|v_s|^2|\le2M^2\cdot o(1)$，而后者 $=1$（归一）
⇒ 乘积长度平方 $\to1$ ⇒ 在 $Z$ 中 $=1$ ✓。$s^{-1}$ 情形同（$\|v_{s^{-1}}\|=\|v_s\|$）。
二步/三步下界（归纳）：$d(u_0,u_k)^2\ge d(u_0,u_{k-1})^2+\|v_{a_k}\|^2-2\ip{h_I}{v_{a_k}}$
（式 `energy:log-comparison`，以 $u_{k-1}$ 为顶点）；$\|v_{a_k}\|^2\to1$；
$h_I=\log(a_{k-1}^{-1}\cdots a_1^{-1}x_\nu)$ 只依赖**前 $k-1$ 个标号**，且 $\|h_I\|\le(k-1)M$ ✓（三角不等式）；
引理 5.4 给 $\limsup\E\ip{h_I}{v_{a_k}}\le0$。归纳：$k=1$ 已证，$d^2\ge0+1-0=1$；
$k=2$：$\ge1+1=2$；$k=3$：$\ge2+1=3$ ✓。
"Every prefix of the field sets in the statement is admissible, so the conditional test is available
at each step"——这是 admissible 的**前缀封闭性**要求（`def:admissible` 的两种形式对前缀都封闭），
"Distinct fields here need not carry distinct numerical letter values" 与 2.20(c) 的"跨字段可同值"呼应。
四边形不等式 `[补]`（原文 "Apply midpoint convexity … multiplying by four"）：
CN：$d(z_1,z_3)^2=4d(m,\cdot)^2$ 型即
$4d(m,z_2)^2\le2d(z_1,z_2)^2+2d(z_3,z_2)^2-d(z_1,z_3)^2$，
$4d(m,z_4)^2\le2d(z_1,z_4)^2+2d(z_3,z_4)^2-d(z_1,z_3)^2$；
再对 $d(m,n)^2$ 用 CN（$n=$mid$(z_2,z_4)$）：$4d(m,n)^2\le2d(m,z_2)^2+2d(m,z_4)^2-d(z_2,z_4)^2$，
代入前两式右端 $=\frac12[2d(z_1,z_2)^2+2d(z_3,z_2)^2+2d(z_1,z_4)^2+2d(z_3,z_4)^2-2d(z_1,z_3)^2]-d(z_2,z_4)^2$
即 $4d(m,n)^2\le d(z_1,z_2)^2+d(z_2,z_3)^2+d(z_3,z_4)^2+d(z_4,z_1)^2-d(z_1,z_3)^2-d(z_2,z_4)^2$ ✓
移项即式 `energy:quadrilateral-inequality`。等号 ⇒ $d(m,n)=0$ ⇒ 中点重合 ✓。

(c) `[机械理由]` "每条 nonbacktracking 二边核心路都被分配了 decoration table，**包括两条字段同属一个 fan 的路**"
（第 402–403 行）是 `two-step-equality` 得以覆盖全部二边路的原因；若只对外部二边路建表，
fan 内二边路没有 TV 控制，$d(u,w)^2\ge2$ 无从得到（引理 5.5 的第二句正是"one decoration square"的两字段）。

(d) `[推测]` 失败路线：若 admissible 前缀不封闭，三步路中某步的 $h_I$ 不再是合法测试的 $I$ 部分，
归纳断链；作者把"$k\le3$"写死在引理里（而非"任意 $k$"），说明 3 是由 admissible 上限 3 定的硬顶。
证据来源：`More generally, a path of $k\le3$ distinct core fields whose field set is admissible …`
的限定式表述。§6 只用 $k\le3$（六边形的三边半路），未需要 $k\ge4$。
Lean 对应：`MetricHexagon.lean:238 structure MetricCore (z : Vertex → X)`，字段 `side/twoStep/threeStep`
（即引理 5.5 的三件事被打包成一个**结构**，$\sqrt{}$ 见 2.31/2.32 的 `D.hexagon`）；
`MetricSquare.lean`（不存在；square 数据在 `CATZeroFurther.lean:168 structure MetricSquare`，
字段是循环顺序的平方度量，`:176 MetricSquare.mid_eq` 即"中点重合"）；
`CATZeroFurther.lean:28 square_mid`（"The midpoint part of square rigidity, retaining just the metric data"）、
`:44 cn_eq_of_log_dist`（"A log-isometric base gives every radial CN equality"——原文 `energy:radial-identity`
+等号情形的机器化）、`ConditionalStar.lean:300 word_lower`（词长下界 = $k\le3$ 情形）。

## 2.31 六边形半径 $r=\sqrt3/2$、引理 5.7（`energy:hexagon-flatness`，第 426–461 行）、引理 5.8（`energy:common-center`，第 463–492 行）

(a) 原文逐字（半路下界与半径段，第 405–424 行）：

```tex
Recall that a core hexagon is obtained from three
noncollinear Fano points $i,j,k$, their joining lines, and a choice of
$X$ or an available $Y$ representative at each of the three points,
with all six required edges present.  The squared distances of its
vertices $z_0,\ldots,z_5$ at cyclic separation one and two are,
respectively, one and two.  Each three-edge half-path uses at most
two fields of any one fan, so its opposite endpoints have squared
distance at least three.

Apply Lemma~\ref{energy:quadrilateral} to
$(z_0,z_1,z_3,z_4)$.  The side-square sum is $1+2+1+2=6$, whereas each
diagonal-square is at least three.  Both are therefore three and
their midpoints coincide.  Applying the same argument to
$(z_1,z_2,z_4,z_5)$ identifies the third opposite-pair midpoint with
the first two.  Denote the resulting center of this hexagon by $c$.
Every vertex has distance
\begin{equation}\label{energy:radius}
 r=\frac{\sqrt3}{2}
\end{equation}
from $c$.
```
```tex
\begin{lemma}\label{energy:hexagon-flatness}
For a core hexagon, every triangle formed by its center and two of
its vertices is Euclidean flat, including the degenerate case of
opposite vertices.  The corresponding tangent vectors satisfy
\begin{equation}\label{energy:hexagon-products}
 \ip{\log_c z_i}{\log_c z_j}
 =r^2-\frac12d(z_i,z_j)^2.
\end{equation}
\end{lemma}
```
```tex
Set $u=\log_c z_i$, $v^+=\log_c z_j$, and
$v^-=\log_c z_{j+3}$, with indices modulo six.  Log comparison gives
\[
 \ip{u}{v^+}\ge r^2-\tfrac12d(z_i,z_j)^2,
 \qquad
 \ip{u}{v^-}\ge r^2-\tfrac12d(z_i,z_{j+3})^2.
\]
The two prescribed squared distances sum to $3=4r^2$, so the lower
bounds sum to zero.  Equation~\eqref{energy:antipodal-products}
forces equality in each bound.  Thus the angle at $c$ equals its
Euclidean comparison angle.  For a nondegenerate triangle the
flat-triangle equality theorem gives a flat triangle; for an
opposite or repeated pair the statement is a segment or a point.
```
```tex
\begin{lemma}\label{energy:common-center}
All core hexagons have the same center $c$.  Every core vertex lies
in a core hexagon, and hence is at distance $r$ from $c$.
\end{lemma}
```

(b) `[补]` 全部算术与拓扑论证：
1. 半路 $\ge3$：三边路径的三个字段两两属于不同 fan 时显然"每 fan 至多 2"；
 若某 fan 出现 2 次仍 $\le2$ ⇒ 该三点集 admissible ⇒ 引理 5.5 第三句给 $d^2\ge3$ ✓。
2. $(z_0,z_1,z_3,z_4)$：边序 $z_0z_1$(分离 1,$=1$)、$z_1z_3$(分离 2,$=2$)、$z_3z_4$(1)、$z_4z_0$(分离 3 即对面,$\ge3$?
 `[补]` 注意原文写 side-square sum $=1+2+1+2=6$，即第四条边取 $z_4\to z_0$ 的**分离 2**：
 循环标号 $z_0..z_5$ 下 $z_4,z_0$ 相差 2（$4\to5\to0$）⇒ 平方距离 2 ✓，不是对面。
 对角线：$z_0z_3$（对面，$\ge3$）、$z_1z_4$（对面，$\ge3$）。
 式 `energy:quadrilateral-inequality`：$D_1+D_2+4d(m,n)^2\le6$ 且 $D_1,D_2\ge3$ ⇒ $D_1=D_2=3$、$d(m,n)=0$ ✓。
 第二组 $(z_1,z_2,z_4,z_5)$ 同理（边 $1,2,1,2$，对角 $z_1z_4,z_2z_5$ 均对面）⇒
 $z_2z_5$ 的中点 $=$ 前两组公共中点 ⇒ 三对对面共中点 $c$ ✓。
3. $r^2=\frac14d(z_i,z_{i+3})^2=\frac34$（对面中点即 $c$，且对面是过 $c$ 的测地线段，长 $=2r$）✓ ⇒ $r=\sqrt3/2$ ✓
 **这里用到 $d^2=3$ 的精确值**，即"$r=\sqrt3/2$ 由引理 5.5 的 $k=3$ 下界与四边形的上界夹出"。
4. 反号不等式 `energy:antipodal-products`：$v^+,v^-$ 在 $T_cZ$ 中方向相反（对面连线过 $c$），
 三角不等式给 $\angle(u,v^+)+\angle(u,v^-)\ge\pi$；$\cos$ 在 $[0,\pi]$ 凸？`[补]` 原文给的理由是
 "the sum of their cosines is nonpositive"：设 $\alpha+\beta\ge\pi$，$\alpha,\beta\in[0,\pi]$ ⇒
 $\cos\alpha+\cos\beta=2\cos\frac{\alpha+\beta}2\cos\frac{\alpha-\beta}2\le0$
 （第一因子 $\le\cos\frac\pi2=0$，第二 $\ge0$）✓；乘 $\|u\|r$ 得式 ✓。
5. 夹逼：两个下界之和 $=2r^2-\frac12(d^2(z_i,z_j)+d^2(z_i,z_{j+3}))$，
 而"$d^2(z_i,z_j)+d^2(z_i,z_{j+3})$"：$z_j,z_{j+3}$ 对面、$z_i$ 到两者距离——原文说
 "The two prescribed squared distances sum to $3=4r^2$"，即 $j$ 与 $j+3$ 相对 $i$ 的分离数之和为 $3$？
 `[补]` 核对：分离 1 与分离 2 的两类：若 $z_j$ 与 $z_i$ 分离 $s$，则 $z_{j+3}$ 与 $z_i$ 分离 $|3-s|$（循环），
 $(s,3-s)\in\{(1,2),(2,1),(3,0)\}$，平方距离取自"1、2、$\ge3$"。原文此处用**恰好** $=3$，
 只有 $s=1$（$1+2=3$）或 $s=2$（$2+1=3$）成立 ✓；$s=0$（$i=j$，退化）时无需；$s=3$（对面）：
 $d^2(z_i,z_j)=3$、$d^2(z_i,z_{j+3})=0$？$j+3=i$ ⇒ 距离 0，和 $=3$ ✓ 也成立。故和恒为 $3=4r^2$ ✓。
 ⇒ 下界之和 $=2r^2-\frac12\cdot3=0$，与 `energy:antipodal-products` 的 $\le0$ 夹出等号 ✓，
 于是式 `energy:hexagon-products` 成立、且角 $=$ 比较角 ⇒ flat-triangle 定理 ⇒ 三角形平坦 ✓。
6. 公共中心（`energy:common-center`）：
 (i) 只用 $X$：非共线有序三点 $=(i,j,k)$ 是 $\mathbb F_2^3$ 的基；换序不改六边形；
 把 $i$ 换成 $i+j$ 保持直线 $ij$ 与第三点 $k$ ⇒ 新旧六边形共享对面 $(X_k,ij)$
 ⇒ 中心都等于该对面的中点 ⇒ 相同 ✓；置换＋初等行变换生成 $\mathrm{GL}_3(\mathbb F_2)$ 的一切基变换 ✓。
 (ii) 把一个 $Y$ 换成 $X$：新六边形仍是核心六边形（对应 $X$ 边都在）；
 未变的两个点代表之一 $+$ 其对边 = 两六边形共享的对面 ⇒ 中心相同 ✓。
 (iii) 覆盖性：每个 $X_i$ 在"把 $i$ 扩成基"的六边形里；每条直线在"取该线上两点 $+$ 线外一点"的六边形里；
 每个 $Y_i$：它有两条可用完整直线，各取异于 $i$ 的一点，这两点与 $i$ 非共线 ⇒ 得含 $Y_i$ 的核心六边形 ✓；
 $Y_D$ 用它的两条完整直线（`[补]` 呼应 §2：$Y_D$–$CD$ 那条边被省略，但 $Y_D$ 仍有两条完整线可用）。

(c) `[机械理由]` $r=\sqrt3/2$ 不是选取而是**被夹出**：$\sqrt{3}/2$ 正是"边长 1 的欧氏等边三角形高"的一半级别量，
$\ip{h_H}{h_{H'}}=-\frac14$（§6 式 `geom:fan-products` 的 $h$ 版本）与 $2r^2-1=\frac12$ 等关系都由此产生（见 2.35）。

(d) `[推测]` 失败路线：基变换论证依赖"$X$ 型六边形对 $\mathrm{GL}_3(\mathbb F_2)$ 传递"。
`[推测]` 若 Fano 模板用 $\mathbb F_2^3$ 以外的（例如 7 点 7 线的其它配置），
共享对面链条会断，公共中心无法传递；作者选择 Fano 平面很可能正是为了这条群论传递性。
证据来源：证明通篇用"basis / elementary additions over $\mathbb F_2$"的语言，而非纯组合。
Lean 对应：`MetricHexagon.lean:96 def vector : Fin 7 → Fin 3 → ZMod 2`（"Points A,B,C,D followed by
the three remaining nonzero vectors"）、`:100 def Incident (i l) : ∑ j, vector i j * vector l j = 0`
（**线 = 泛函的核**的对偶约定）、`:105 pointOfRepresentative (r : Fin 11)`（X 占 $0..6$、Y 占 $7..10$）、
`:111 abbrev Vertex := Fin 11 ⊕ Fin 7`、`:114 def Adjacent`（显式排除 $(10,4)$ 即省略边 $Y_D$–$CD$）、
`:146-162 centerPair/centerParent/centerHex`（在 `Fin 44` 上枚举六边形，`:165/:172/:177` 用 `fin_cases … decide`
把引理 5.8 的"传递性"变成**有限决策**）、`:49 dist c (z k)^2 = 3/4`（$r^2$ 逐字为 $3/4$）、
`:302 radius_point`、`:312 radius_line`（(b)6(iii) 的覆盖性）、`:42 log_dist`（"Central log comparison is
equality for every pair of hexagon vertices"= 式 `energy:hexagon-products`）、`:77 central_mid`。
**差异**：原文的"flat-triangle equality theorem / 角 = 比较角"在 Lean 里被替换为
**纯距离等式**（`central_mid` + `cn_eq_of_log_dist`），即不引入角度概念就得到 $\ip{}{}$ 公式——
这是"机器化时避免 angle/ultralimit 交换"的典型手法（见 3.4 的论文未述清单）。

## 2.32 三元中点测试（第 494–547 行）与命题 5.9（`prop:configuration`，第 554–591 行）

(a) 原文逐字：

```tex
The square and hexagon comparisons have supplied a common center.
We now use three admissible core fields to control one further angle: the angle
at $CD$ between the segment to the midpoint of $X_C,Y_C$ and the loose
edge to $X_D$.

Put
\[
 H_0=CD,\qquad p=X_C,\qquad q=Y_C,\qquad z=X_D,
 \qquad J=\operatorname{mid}(p,q)
\]
in $Z$.  The following argument gives an angle statement in $Z$
without any assumption that angles commute with ultralimits.

Choose another line $H\ne H_0$ through $C$.  The core four-cycle
$(p,H_0,q,H)$ has unit sides and both diagonals of squared length
two, by Equation~\eqref{energy:two-step-equality}.  Its diagonal
midpoints coincide by Lemma~\ref{energy:quadrilateral}, so
\begin{equation}\label{energy:ternary-radii}
 J=\operatorname{mid}(H_0,H),\qquad
 d(H_0,J)^2=\frac12,\qquad d(H_0,z)=1.
\end{equation}
```
```tex
\begin{equation}\label{energy:fractional-angle}
 d(J_a,z_b)^2\ge
 a^2d(H_0,J)^2+b^2d(H_0,z)^2
 =\frac{a^2}{2}+b^2.
\end{equation}
Thus every such comparison angle at $H_0$ is at least $\pi/2$.
Letting both fractions decrease to zero in $Z$ proves
\begin{equation}\label{energy:ternary-angle}
 \angle_{H_0}(J,z)\ge\frac\pi2.
\end{equation}
Only distances of fixed-fraction points passed through the
ultralimit; the angle was computed afterwards in the limiting
space.
```

(b) `[补]` 机制：
1. $J=\operatorname{mid}(H_0,H)$：四边形 $(p,H_0,q,H)$ 的对角线是 $pq$ 与 $H_0H$；
 $pq$ 的中点是 $J$（定义），引理 5.6 的等号 ⇒ 两对角线中点重合 ⇒ $J$ 也是 $H_0H$ 的中点 ✓。
 $d(H_0,J)^2=\frac12$：四元组按循环顺序 $(z_1,z_2,z_3,z_4)=(p,H_0,q,H)$，
 四条边 $(p,H_0),(H_0,q),(q,H),(H,p)$ 都是 $\Gamma$ 的边 ⇒ 单位长；
 两条对角线是 $(p,q)$ 与 $(H_0,H)$，二者都是 nonbacktracking 二边路的两端（分别经 $H_0$、经 $p$ 型两点），
 由 `energy:path-bounds` 各 $\ge\sqrt2$；引理 5.6 给
 $D_1+D_2+4d(m,n)^2\le1+1+1+1=4$ 且 $D_1,D_2\ge2$ ⇒ $D_1=D_2=2$、$m=n$ ✓。
 于是 $d(H_0,H)^2=2$，而 $J=m=n=$ mid$(H_0,H)$ ⇒ $d(H_0,J)^2=\bigl(\tfrac12d(H_0,H)\bigr)^2=\tfrac12$ ✓。
 $d(H_0,z)=1$：$H_0=CD$ 到 $X_D=z$ 是 $\Gamma$ 的一条边（$D$ 线与 $X_D$ 相邻），边长在 $Z$ 中 $=1$ ✓。
2. 三字段 admissible：$p,q$ 是 $F_C$ 的两条边上的字段（同 fan、2 个，合法），$z$ 是 **loose 字段**
 （"The loose field belongs to no fan"，第 2.16/2.17 段），与另两个合起来 admissible ✓
 是引理 5.4 可用条件。原文 "These three fields are admissible."
3. $h_I=\log_{H_0\text{ 平移后}}(J_m)$ 只依赖那**两个** $F_C$ 字段（因为 $J_m$ 是 $p,q$ 实现的中点），
 $\|h_I\|\le M$ ✓；另一向量是 $v_{\sigma(e_0)}$（$e_0$ 是 loose 字段）⇒ 引理 5.4 给
 $\limsup\E\ip{h_I}{v_{\sigma(e_0)}}\le0$ ✓。
4. 分数点：每坐标取 $J_a=$沿 $H_0\to J_m$ 的 $a$ 分点、$z_b=$ 沿 $H_0\to z$ 的 $b$ 分点，
 切向量是 $a\cdot h$、$b\cdot v$；式 `energy:log-comparison`：
 $d(J_a,z_b)^2\ge a^2\|h\|^2+b^2\|v\|^2-2ab\ip hv$，取平均、$\limsup\E\ip hv\le0$、
 $\|h\|^2\to d(H_0,J)^2=\frac12$、$\|v\|^2\to d(H_0,z)^2=1$ ⇒ 式 `energy:fractional-angle` ✓。
5. 由 $d(J_a,z_b)^2\ge\frac{a^2}2+b^2$ 得比较角：欧氏余弦
 $\cos\angle^\#_{H_0}(J_a,z_b)=\frac{a^2\frac12+b^2-d^2}{2\cdot a\sqrt{\frac12}\cdot b}\le0$ ⇒ 角 $\ge\pi/2$ ✓；
 令 $a,b\to0$：$Z$ 中 $\angle_{H_0}(J,z)=\lim_{a,b\to0}\angle^\#_{H_0}(J_a,z_b)\ge\pi/2$ ✓
 （角在**极限空间内**事后计算，避免"角与 ultralimit 交换"的假设——原文两次强调，见 (a) 末）。

(c) `[机械理由]` $H\ne H_0$ 只需**存在一条**过 $C$ 的其它线（Fano 平面每点 3 条线）✓，
且 $p,q$ 之间的 $Y_C/X_C$ 对偶与"J = mid(p,q)"是 §2 里 loose 边 $X_D$–$CD$ 的用武之地：
被省略的边 $Y_D$–$CD$ 使 $Y_D$ 不参与，而 $CD$ 到 $X_D$ 的 loose 边正好提供了与 $J$ 垂直方向的"第二边"。

(d) `[推测]` 失败路线：若用"角度在 $X_\nu$ 上一致下界再取极限"，需要角与 ultralimit 交换（一般假）；
作者改用固定分数点距离 ⇒ 只需 $d$ 的收敛。`[推测]` 这是本节的**关键技巧**，也可能是终稿最强调的一处。
证据来源：第 506–507 行 "without any assumption that angles commute with ultralimits"
与第 545–547 行 "Only distances of fixed-fraction points passed through the ultralimit …"
的前后呼应（同一事实写两遍，作者显然担心被误读）。
Lean 对应：`Exceptional.lean:18 def exceptionalRadius := 1/2`（即 $d(H_0,J)^2=\frac12$ 被固定为常量），
`:35-37 excC=(2,4) excY=(9,4) excD=(3,4)`（$p,q,z$ 的顶点编码：`Fin 11 ⊕ Fin 7` 里的显式坐标），
`:105 exceptionalTest`（三元中点测试的假设结构，含 $d^2=\frac12$、$d=1$、角/距离不等式），
`:145 theorem impossible_sequence : False`；
`CATZeroFurther.lean:189-208 FiniteObstructionData`、`:212 no_finite_obstruction`
（把 `prop:configuration` 的三条结论 $\to$ `MetricHexagon.lean:409 impossible` 串起来）。
`prop:configuration` 的陈述（第 554–580 行）逐字要点：
"there are a complete $\CAT(0)$ space $Z$, a configuration indexed by the core vertices of $\Gamma$,
and a point $c\in Z$"＋三条：
(1) 每核心边长 1、每 nonbacktracking 二边路平方 $=2$、每三条不同 admissible 字段的核心路平方 $\ge3$；
(2) 每核心六边形的三对对面中点 $=c$、所有核心顶点距 $c$ 为 $r=\sqrt3/2$、同一六边形中任两顶点的中心三角形平坦且
$\ip{}{}$ 由式 `energy:hexagon-products` 给出；
(3) $H_0=CD$、$J=\operatorname{mid}(X_C,Y_C)$ 时 $d(H_0,J)^2=\frac12$、$d(H_0,X_D)=1$、
$\angle_{H_0}(J,X_D)\ge\frac\pi2$，并附"More precisely, all the fractional-point inequalities in
Equation~\eqref{energy:fractional-angle} hold."
`[补]` 注意 $Z$ 只写"complete $\CAT(0)$"，**不写** proper、不写有限维（与 (a) 第 327–328 行一致）——
这是终稿在陈述"结论强度"时最容易写错的地方（见 3.2、3.4）。
证明（第 583–591 行）是一句装配："Use the normalized minimizing actions of
Lemma~\ref{energy:minimizer} and the uniform bound of Lemma~\ref{energy:displacement-bound}.
The product construction, Lemma~\ref{energy:path-bounds}, and the decoration-square argument
give the first assertion.  Lemmas~\ref{energy:hexagon-flatness} and~\ref{energy:common-center}
give the second.  The fixed-fraction argument above gives the third."

---

## 2.33 §6 开篇、锥加法 `geom:cone-addition`（22–25）与标量积凹性 `geom:sum-concavity`（35–41）

(a) 原文逐字（第 4–9 行，边界声明＋设计动机；43–49 行的平坦性原则）：

```tex
We now show that the configuration obtained in
Proposition~\ref{prop:configuration} cannot occur in a complete $\CAT(0)$
space.  The argument takes place first in that space and then in its
completed tangent cone at the common hexagon center.  The tangent cone
is not assumed to be a vector space, so we specify the meaning of its
sums and use concavity whenever an additive inequality is required.
```
```tex
For a $\CAT(0)$ Euclidean cone $T$ with vertex $0$, let $\delta_a$ denote
radial dilation by $a\geq 0$.  Write $a u=\delta_a(u)$ and
\[
 \norm{u}=d_T(0,u),\qquad
 \ip{u}{v}=\frac{\norm{u}^2+\norm{v}^2-d_T(u,v)^2}{2}.
\]
For nonzero vectors this last expression is
$\norm{u}\norm{v}\cos\angle(u,v)$, where the angular distance is
truncated at $\pi$.  Define
\begin{equation}
 u\oplus v=2\operatorname{mid}(u,v).
 \label{geom:cone-addition}
\end{equation}
This operation is commutative, but no associativity or cancellation law
will be used.
```
```tex
\begin{equation}
 \ip{w}{u\oplus v}\geq \ip{w}{u}+\ip{w}{v}.
 \label{geom:sum-concavity}
\end{equation}
Indeed, apply concavity at the midpoint of $u,v$ and use homogeneity
under radial dilation.  This is an inequality in a general cone; we
will not replace it by an equality without establishing rigidity.
```
```tex
A triangle is flat if one vertex angle equals its Euclidean comparison
angle, or if a nontrivial interior comparison inequality is an
equality; see \cite[Proposition~II.2.9 and
Exercise~II.2.10(1)]{BH1999} and
\cite[Proposition~I.3.13(ii)]{Ballmann1995}.  Here and below, flat means that the
convex hull is isometric to the corresponding Euclidean triangle.
```

(b) `[补]` `geom:sum-concavity` 的两步：引理 5.3 的凹性给
$\ip w{\operatorname{mid}(u,v)}\ge\frac12(\ip wu+\ip wv)$；
齐次性指 $\ip w{a u}=a\ip wu$（由度量定义：$\|au\|=a\|u\|$ 且 $d(au,aw)=a\,d(u,v)$
——后者来自 $\|au\|^2+\|aw\|^2-2\langle au,aw\rangle$ 中各项齐二次 ⇒ 距离齐一次），
取 $a=2$ 即得 ✓。
欧氏扇形内 $\oplus$ 就是普通向量加法：$2\operatorname{mid}(u,v)=u+v$（平行四边形）✓，
所以"$u\oplus v$"在扇形内可写作加法，这是原文"$\oplus$ 的两次普通加法发生在该扇形内"（2.36 证明）的许可。

(c) `[机械理由]` "no associativity or cancellation law will be used" 与
"we will not replace it by an equality without establishing rigidity" 是两条**自我限制**（见 3.2）：
$\oplus$ 非结合，所以所有求和都写成两两嵌套并显式声明在扇形内计算（`geom:fan-identities` 的
"Each sum displayed here is computed in a nondegenerate Euclidean sector"）。

(d) `[推测]` 失败路线：若直接在切锥上用"$\sum$"与抵消律，$\langle M_A,M_B\rangle\ge0$ 的推导会
偷偷假设结合性；作者把不等式方向（$\ge$）保留到 §6.4 才由反号夹成等号，说明曾需要严格不等式版本。
证据来源：本段"inequality in a general cone"的强调。
Lean 对应：`CATZero.lean:106 structure ConeData`（$\|{}\|$、$\ip{}{}$、$\delta_a$ 的公理包装）、
`:218 def add (u v) := 2 * mid u v`（逐字对应 `geom:cone-addition`），
凹性在 `CATZeroFurther.lean:44 cn_eq_of_log_dist` 一侧提供；
`TangentCone.lean:24 scaleN`/`:51 radial_metric` 提供 $d_T(au,av)=a\,d_T(u,v)$。

## 2.34 引理 6.1（`geom:square`，第 51–82 行）：方形刚性

(a) 原文逐字（陈述）：

```tex
\begin{lemma}[Square rigidity]
\label{geom:square}
Let $p_0,p_1,p_2,p_3$ be points of a $\CAT(0)$ space, with indices
taken modulo four.  Suppose
\[
 d(p_i,p_{i+1})=1,\qquad
 d(p_0,p_2)=d(p_1,p_3)=\sqrt{2}.
\]
Their convex hull is a unit Euclidean square, in the indicated cyclic
order.  In particular, the two diagonals have the same midpoint.
\end{lemma}
```

(b) `[补]` 证明的四步复原：
1. $o=$mid$(p_0,p_2)$，CN 不等式：$d(o,p_1)^2\le\frac12d(p_0,p_1)^2+\frac12d(p_2,p_1)^2-\frac14d(p_0,p_2)^2
   =\frac12+\frac12-\frac14\cdot2=\frac12$ ✓（$p_3$ 同）。
2. 夹逼：$\sqrt2=d(p_1,p_3)\le d(p_1,o)+d(o,p_3)\le\frac{\sqrt2}2+\frac{\sqrt2}2=\sqrt2$ ⇒ 两不等式取等
   ⇒ $o$ 也是 $p_1p_3$ 的中点（等号在测地线上 ⇒ 三点共线且居中）✓。
3. $d(o,p_1)^2=\frac12$ 是三角形 $p_1,p_0,p_2$ 的**内部比较等号** ⇒ 该三角形平坦（第 43–49 行的原则）；
  四个顶点轮流作对角中点的对点 ⇒ 每三个连续顶点平坦 ⇒ 四边形四角均 $\pi/2$ ✓。
4. 平坦四边形定理（BH II.2.11，角和 $=2\pi$）⇒ 凸包等距于欧氏四边形，边 $1,1,1,1$、对角 $\sqrt2,\sqrt2$
  ⇒ 单位正方形 ✓。
`[补]` 与 2.30(b) 的四边形不等式一致性检查：这里"边平方和 $4=$ 对角平方和 $4$"正是等号情形，
故 $d(m,n)=0$（两对角共中点）与第 1–2 步相互印证 ✓。

(c) `[机械理由]` 该引理在全文被用 3 次：(i) decoration square（`prop:configuration` 第 1 条 ⇒ square 平坦），
(ii) 引理 6.2 的 $X_i,H,Y_i,H'$ 四元环，(iii) §6.4 末尾的横截 square $u,v,u',v'$。
数据要求每次都只有**距离**（$1,\sqrt2$），与 2.31(d) 的"Lean 全程只用距离"取向一致。

(d) `[推测]` 失败路线：若只知对角 $\ge\sqrt2$（下界，来自引理 5.5）而不知边平方和的上界，
第 2 步的夹逼失败，$o$ 未必是共线中点。原文因此必须把 `energy:quadrilateral` 的
"$+4d(m,n)^2$" 项留在不等式里，用来把"至少"转成"恰好" ✓。
证据来源：证明里 "$\sqrt2\le\ldots\le\sqrt2$" 的双侧夹。
Lean 对应：`CATZeroFurther.lean:168 structure MetricSquare {X} (p q r s : X)`
（注释 "Squared metric data for the unit square, in cyclic order." —— 只存平方距离）、
`:176 MetricSquare.mid_eq`、`:26-28 square_mid`（"The midpoint part of square rigidity,
retaining just the metric data"）、`TriangleSquare.lean`/`TriangleSquareFurther.lean`（平坦三角形拼装）。

## 2.35 直线内积 `geom:line-products`（102–112）与引理 6.2（`geom:fan-sums`，118–169）

(a) 原文逐字（配置约定与陈述）：

```tex
Suppose that $Z$ is a complete $\CAT(0)$ space containing the
configuration from Proposition~\ref{prop:configuration}.  Use the graph
vertex names for the corresponding points of $Z$.  Let $c$ be the common
hexagon center and put
\[
 r=\frac{\sqrt3}{2},\qquad T=T_c Z.
\]
The completed tangent cone $T$ is $\CAT(0)$, and its completed space of
directions is $\CAT(1)$ by \cite[Theorem~II.3.19]{BH1999}.  Write
\[
 x_i=\log_c X_i,\qquad y_i=\log_c Y_i,\qquad
 h_H=\log_c H
\]
for the named radial vectors, and abbreviate $h_{ij}=h_H$ when
$H=ij$.  All these vectors have norm $r$.
```
```tex
Any two distinct line vertices $H,H'$ occur together in a core
hexagon: take their intersection point $i$, choose a point $j\ne i$
on $H$ and a point $k\ne i$ on $H'$, and use the $X$ representatives
of the noncollinear triple $i,j,k$.  Their central triangle is flat
by Proposition~\ref{prop:configuration}, and their distance is
$\sqrt2$.  Consequently
\begin{equation}
 \ip{h_H}{h_{H'}}=-\frac14
 \quad\text{for distinct lines }H,H'.
 \label{geom:line-products}
\end{equation}

A line through a doubled point $i\in\{A,B,C,D\}$ is called
\emph{full at $i$} if it is adjacent to both $X_i$ and $Y_i$.
All lines through $A,B,C$ are full; the full lines at $D$ are $AD,BD$.
```
```tex
\begin{lemma}[Fan identities]
\label{geom:fan-sums}
For $i\in\{A,B,C,D\}$ there is a unit vector $M_i\in T$ such that
\begin{equation}
 M_i=x_i\oplus y_i=h_H\oplus h_{H'}
 \quad\text{whenever }H,H'\text{ are distinct full lines at }i.
 \label{geom:fan-identities}
\end{equation}
Each sum displayed here is computed in a nondegenerate Euclidean
sector.  Moreover,
\begin{equation}
 \ip{x_i}{y_i}=-\frac14,
 \qquad
 \ip{M_i}{h_H}=\ip{M_i}{h_{H'}}=\frac12.
 \label{geom:fan-products}
\end{equation}
\end{lemma}
```

(b) `[补]` 全部算术：
1. `geom:line-products`：$H,H'$ 在同一核心六边形中 ⇒ 式 `energy:hexagon-products`：
 $\ip{h_H}{h_{H'}}=r^2-\frac12d(H,H')^2=\frac34-\frac12\cdot2=-\frac14$ ✓
 （$d(H,H')^2=2$：两线顶点在六边形中分离 2 ⇒ `two-step-equality`）。
2. 四元环 $X_i,H,Y_i,H'$：四边单位（相邻 ⇒ 引理 5.5 第一条），两对角 $X_iY_i$ 与 $HH'$ 各经二边非回溯路
 ⇒ 平方 $=2$（`two-step-equality`）⇒ 引理 6.1 ⇒ 平坦单位 square，中心 $J_i$ ＝两对角公共中点 ✓。
3. $d(c,J_i)^2$ 的**两个**算法（等号夹逼）：
 三角形 $c,H,H'$ 平坦 ⇒ 中线公式 $d(c,J_i)^2=\frac12(r^2+r^2)-\frac14d(H,H')^2=\frac12(\frac34+\frac34)-\frac14\cdot2
 =\frac34-\frac12=\frac14$ ✓（原文写作 $r^2-\frac14d(H,H')^2=\frac14$，等价）。
 三角形 $c,X_i,Y_i$ 的 CN **上界** $=\frac12d(c,X_i)^2+\frac12d(c,Y_i)^2-\frac14d(X_i,Y_i)^2
 =\frac12\cdot\frac34+\frac12\cdot\frac34-\frac14\cdot2=\frac14$ ✓；
 因 $J_i$ 是 $X_iY_i$ 中点，CN 说 $d(c,J_i)^2\le\frac14$，而上面已给 $=\frac14$ ⇒ 上界取等
 ⇒ **内部比较等号** ⇒ $c,X_i,Y_i$ 平坦 ✓。
4. $x_i\oplus y_i=2\log_cJ_i=h_H\oplus h_{H'}$：两者都等于"$2\times$（$c$ 到公共中点的对数向量）"——
 平坦三角形内中点的对数即向量中点 ⇒ $\log_cJ_i=\frac12(x_i+y_i)$ ⇒ $2\log_cJ_i=x_i\oplus y_i$ ✓，
 同理 $=h_H\oplus h_{H'}$ ✓；定义 $M_i:=2\log_cJ_i$，$\|M_i\|=2d(c,J_i)=2\cdot\frac12=1$ ✓ 单位。
 左侧（$x_i\oplus y_i$）不含线选择 ⇒ $M_i$ 与"哪一对完整线"无关 ✓（原文"the left-hand side makes
 it independent of the full-line pair chosen"）。
5. $\ip{x_i}{y_i}=-\frac14$：度量式 $=\frac{r^2+r^2-d(X_i,Y_i)^2}{2}=\frac{\frac32-2}{2}=-\frac14$ ✓。
6. $\ip{M_i}{h_H}=\frac12$：$\|h_H\oplus h_{H'}\|^2=r^2+r^2+2(-\frac14)=\frac32-\frac12=1$ ✓（与 4. 一致），
 且在扇形内 $\ip{h_H+h_{H'}}{h_H}=\|h_H\|^2+\ip{h_{H'}}{h_H}=\frac34-\frac14=\frac12$ ✓；
 角距离 $\arccos\frac{-1/4}{3/4}=\arccos(-\frac13)<\pi$ ⇒ 扇形非退化 ⇒ 可用普通加法 ✓。
7. `geom:nonnegative`（171–187）：$M_A=h_{AB}\oplus h_{AC}$、$M_B=h_{AB}\oplus h_{BC}$，
 两次用凹性：
 $\ip{M_A}{M_B}\ge\bigl(\|h_{AB}\|^2+\ip{h_{AB}}{h_{BC}}\bigr)
 +\bigl(\ip{h_{AC}}{h_{AB}}+\ip{h_{AC}}{h_{BC}}\bigr)
 =\frac34-\frac14-\frac14-\frac14=0$ ✓（三线 $AB,AC,BC$ 两两不同 ⇒ 每对给 $-\frac14$）。

(c) `[机械理由]` "full at $i$" 的定义把 $D$ 处的**缺边**（$Y_D$–$CD$ 被省略）编成数据：
$D$ 处只有 $AD,BD$ 完整，$CD$ 不完整 ⇒ $M_D=h_{AD}\oplus h_{BD}$ 唯一确定，
而 $CD$ 只能与 loose 边 $X_D$ 配对——这正是 2.36 例外恒等式的结构前提
（原文 204–205 行："The missing edge from $Y_D$ to $H_0$ is responsible for the asymmetry"）。

(d) `[推测]` 失败路线：若 $\Gamma$ 无省略边（$Y_D$–$CD$ 也在），则 $D$ 处有 3 条完整线，
$M_D$ 需三个 $\oplus$（不可结合 ⇒ 定义不明），整条"轴"构造失败。
[推测] 省略一条边正是为了把 $D$ 的 fan 度降到 2、使 $M_D$ 良定义；
这与 §2 里 $\sum k_i=31$（而非 32）的"少一条"完全对应，很可能是设计的核心一步。
证据来源：定义 6.2 之后紧接着的 full-line 例外句 + §2 的省略边声明。
Lean 对应：`MetricHexagon.lean:238 structure MetricCore` 的 `side/twoStep/threeStep` 三字段
被 `D.hexagon`（`:305/:315` 处使用）装配；`CATZeroFurther.lean:57 fan_identity (c x y a b : X)`
（注释 "The fan midpoint identity, derived from a metric square and the central …"）；
`:182 def fullLines : Fin 4 → Finset (Fin 6)` ＝ `![{0,1,2},{0,3,4},{1,3,5},{2,4}]`
——**逐字复刻 (c) 的 full-line 表**：$A,B,C$ 各 3 条、$D$ 只 2 条 ✓（第 4 组缺一条，正是 $CD$）；
直线编码 $AB,AC,AD,BC,BD,CD$ 为 $0..5$。

## 2.36 引理 6.3（`geom:exceptional`，第 199–293 行）：例外入射恒等式

(a) 原文逐字（陈述与两处关键距离、$B_0$ 段、内积段）：

```tex
Set
\[
 H_0=CD,\qquad h_0=h_{CD},\qquad
 p=X_C,\quad q=Y_C,\quad z=X_D,
\]
and let $J$ be the midpoint of $p,q$.  The missing edge from $Y_D$
to $H_0$ is responsible for the asymmetry used in the next lemma.

\begin{lemma}[Exceptional-incidence identity]
\label{geom:exceptional}
The vectors $M_C,x_D$ lie in a Euclidean sector in $T$, and
\begin{equation}
 h_0=M_C\oplus x_D.
 \label{geom:exceptional-sum}
\end{equation}
Within this sector,
\begin{equation}
 \ip{M_C}{x_D}=-\frac12,\qquad
 \ip{M_C}{h_0}=\frac12,\qquad
 \ip{h_0}{x_D}=\frac14.
 \label{geom:exceptional-products}
\end{equation}
\end{lemma}
```
```tex
Since $J$ is its center,
\begin{equation}
 d(H_0,J)^2=\frac12,\qquad d(c,J)^2=\frac14.
 \label{geom:exceptional-distances}
\end{equation}
Also $d(H_0,z)=1$, $d(c,z)=d(c,H_0)=r$, and the two paths
$p,H_0,z$ and $q,H_0,z$ give
\[
 d(p,z)^2=d(q,z)^2=2.
\]
```
```tex
Let $B_0$ be the point of $[J,z]$ at parameter $1/3$ from $J$.
Calculating in this right triangle gives
\[
 d(H_0,B_0)^2
 =\left(\frac23\right)^2\frac12
  +\left(\frac13\right)^2=\frac13.
\]
Squared-distance convexity toward $c$ gives
\begin{align*}
 d(c,B_0)^2
 &\leq\frac23 d(c,J)^2+\frac13d(c,z)^2
                 -\frac29d(J,z)^2\\
 &=\frac23\frac14+\frac13\frac34-\frac29\frac32
 =\frac1{12}.
\end{align*}
The triangle inequality now reads
\[
 \frac{\sqrt3}{2}=d(H_0,c)
 \leq d(H_0,B_0)+d(B_0,c)
 \leq\frac1{\sqrt3}+\frac1{2\sqrt3}
 =\frac{\sqrt3}{2}.
\]
```
```tex
In the Euclidean
sector containing $j,x_D$, the vector to $B_0$ is
$(2/3)j+(1/3)x_D$.  The collinearity just proved and the distances
$d(c,H_0)=3d(c,B_0)$ therefore imply
\[
 h_0=3\log_c B_0=2j+x_D=M_C\oplus x_D.
\]
Here the two ordinary additions take place in that Euclidean sector,
and $M_C=2j$ by Lemma~\ref{geom:fan-sums}.

The norm identity in this sector gives
\[
 \frac34=\norm{h_0}^2
 =1+\frac34+2\ip{M_C}{x_D},
\]
so $\ip{M_C}{x_D}=-1/2$.
```

(b) `[补]` 逐步核对（原文最紧的一段）：
1. $d(H_0,J)^2=\frac12$ 来自 2.32(b)1（四元组 $(p,H_0,q,H)$ 的对角线 $H_0H$ 平方 $=2$、$J$ 是中点）✓；
 $d(c,J)^2=\frac14$ 来自 2.35(b)3 ✓（两条独立推导相互印证）。
2. $d(p,z)^2=d(q,z)^2=2$：$p=X_C\to H_0=CD\to z=X_D$ 是 nonbacktracking 二边核心路 ✓（$q$ 同理）⇒ `two-step-equality`。
3. 三元中点结论（`prop:configuration` 第 3 条）给 $\angle_{H_0}(J,z)\ge\frac\pi2$ ⇒
 因"$\angle_{H_0}\le\angle^\#_{H_0}$"（2.24(b)）得 $\angle^\#_{H_0}(J,z)\ge\frac\pi2$ ⇒ $\cos\angle^\#\le0$ ⇒
 $d(J,z)^2\ge d(H_0,J)^2+d(H_0,z)^2=\frac12+1=\frac32$ ✓ 与原文一致。
4. 反向：CN（$J=$mid$(p,q)$，顶点 $z$）：$d(J,z)^2\le\frac12d(p,z)^2+\frac12d(q,z)^2-\frac14d(p,q)^2
 =\frac12\cdot2+\frac12\cdot2-\frac14\cdot2=2-\frac12=\frac32$ ✓ ⇒ 夹成 $=\frac32$ ⇒
 角与距离比较都取等 ⇒ 三角形 $H_0,J,z$ 平坦且 $\angle_{H_0}=\frac\pi2$ ✓。
5. $B_0$：直角坐标取 $H_0$ 为原点，$J=(\sqrt{\frac12},0)$、$z=(0,1)$；
 $B_0=J+\frac13(z-J)=(\frac23\sqrt{\frac12},\frac13)$ ⇒ $d(H_0,B_0)^2=\frac49\cdot\frac12+\frac19=\frac{2}{9}+\frac19=\frac13$ ✓。
6. 强凸性（沿 $[J,z]$，参数 $t=\frac13$）：$d(c,B_0)^2\le(1-t)d(c,J)^2+td(c,z)^2-t(1-t)d(J,z)^2
 =\frac23\cdot\frac14+\frac13\cdot\frac34-\frac29\cdot\frac32=\frac16+\frac14-\frac13=\frac1{12}$ ✓
 （与原文 "$\le\frac23d(c,J)^2+\frac13d(c,z)^2-\frac29d(J,z)^2$" 系数一致）。
7. 三角夹逼：$d(H_0,B_0)=\frac1{\sqrt3}$、$d(B_0,c)\le\frac1{\sqrt{12}}=\frac1{2\sqrt3}$，
 和 $=\frac{2}{2\sqrt3}+\frac{1}{2\sqrt3}=\frac3{2\sqrt3}=\frac{\sqrt3}2$ ＝ $d(H_0,c)$ ✓ ⇒ 全部取等 ⇒
 $B_0\in[H_0,c]$（顺序 $H_0,B_0,c$）且 $d(c,B_0)=\frac13r$ ⇒ $h_0=3\log_cB_0$ ✓；
 $c,J,z$ 因内部比较等号而平坦 ✓。
8. $3\bigl(\frac23j+\frac13x_D\bigr)=2j+x_D$，$j=\log_cJ=\frac12M_C$（因 $M_C=2j$）⇒ $h_0=M_C\oplus x_D$ ✓。
9. 三个内积：$\frac34=\|M_C+x_D\|^2=1+\frac34+2\ip{M_C}{x_D}$ ⇒ $\ip{M_C}{x_D}=-\frac12$ ✓；
 $\ip{M_C}{h_0}=\ip{M_C}{M_C+x_D}=1-\frac12=\frac12$ ✓；
 $\ip{h_0}{x_D}=\ip{M_C+x_D}{x_D}=-\frac12+\frac34=\frac14$ ✓。

(c) `[机械理由]` $B_0$ 取参数 $1/3$ 不是凑数：需要 $d(c,B_0)=\frac13r$ 才能与 $d(H_0,c)=r$ 拼成
"$\frac1{\sqrt3}+\frac1{2\sqrt3}=\frac{\sqrt3}2$" 的**精确**三角等式；
即 $\frac49\cdot\frac12+\frac19\cdot1=\frac13$ 与强凸性里 $\frac29\cdot\frac32=\frac13$ 两处 $\frac13$ 相消，
使 $d(c,B_0)^2=\frac1{12}=(\frac r3)^2$ ✓。`[推测]` 分数由 $d(J,z)^2=\frac32$、$d(c,J)^2=\frac14$、
$d(c,z)^2=\frac34$ 三值的比例唯一决定，换别的参数就夹不出等号。

(d) `[推测]` 失败路线：若三元测试只给"角 $>\frac\pi2-\epsilon$"（无精确分数点集），
第 7 步的三角夹逼失败，$h_0=M_C\oplus x_D$ 退化成不等式，$\ip{M_C}{M_D}=-1$ 无法得到 ⇒ §6.4–6.5 崩塌。
证据来源：`prop:configuration` 第 3 条特意附
"More precisely, all the fractional-point inequalities in Equation~\eqref{energy:fractional-angle} hold."
——即为把"$\ge\pi/2$"升级为"每个固定分数点的不等式"留作后用（本素材认为这是终稿最该强调的第二处技术细节）。
Lean 对应：`Exceptional.lean:18 def exceptionalRadius := 1/2`（$d(H_0,J)^2$）、
`:35-37 excC := (2,4)`（$p=X_C$）、`excY := (9,4)`（$q=Y_C$）、`excD := (3,4)`（$z=X_D$，`Fin 11 ⊕ Fin 7` 编码）、
`:105 exceptionalTest`（假设即 `prop:configuration` 第 3 条的度量版本），
`CATZeroFurther.lean:84-86 exceptional_identity (c p q z k : X)`
（注释 "Source exceptional-incidence identity. Its hypotheses are entirely metric,"）。

## 2.37 引理 6.4（`geom:antipodal`，297–355）、命题 6.5（`prop:no-configuration`，359–477）

(a) 原文逐字（`geom:antipodal` 陈述与 $a,b$；`prop:no-configuration` 陈述；轴表与坐标分裂；收尾）：

```tex
\begin{lemma}
\label{geom:antipodal}
The unit vectors $M_C,M_D$ are antipodal in $T$:
\[
 d_T(M_C,M_D)=2,\qquad \ip{M_C}{M_D}=-1.
\]
\end{lemma}
```
```tex
Take either full line $H$ at $D$.  The path
$Y_D,H,X_D,H_0$ uses two fields of $F_D$ and the loose field, so it is
one of the admissible three-step paths.  Thus
\[
 d(Y_D,H_0)\geq\sqrt3=d(Y_D,c)+d(c,H_0).
\]
Equality follows from the triangle inequality.  The segment from
$Y_D$ to $H_0$ passes through $c$, and the directions of $y_D,h_0$
are antipodal.
```
```tex
Let $\Sigma$ be the completed space of directions of $Z$ at $c$, and
use a hat for the direction of a nonzero vector.  Define
\[
 a=\arccos(1/\sqrt3),\qquad b=\arccos(1/3).
\]
Both lie strictly between zero and $\pi/2$, and $2a+b=\pi$.
```
```tex
\begin{proposition}
\label{prop:no-configuration}
No complete $\CAT(0)$ space contains the configuration asserted in
Proposition~\ref{prop:configuration}.
\end{proposition}
```
```tex
\begin{equation}
\begin{array}{c|rrrr}
 &h_{AC}&h_{BC}&h_{AD}&h_{BD}\\ \hline
 \ip{M_C}{\,\cdot\,}& 1/2&1/2&-1/2&-1/2\\
 \ip{M_D}{\,\cdot\,}&-1/2&-1/2& 1/2& 1/2.
\end{array}
\label{geom:axis-products}
\end{equation}
```
```tex
The parallel-set product
decomposition \cite[Theorem~II.2.14]{BH1999} now applies in $T$; it requires no
properness.  Write its convex parallel set as
\[
 P(\ell)=\R\times Q,\qquad
 \ell=\R\times\{q_0\},\qquad
 0=(0,q_0),\quad M_C=(1,q_0),\quad M_D=(-1,q_0).
\]
```
```tex
\begin{equation}
 h_{AC}=(1/2,u),\quad h_{BC}=(1/2,u'),\quad
 h_{AD}=(-1/2,v),\quad h_{BD}=(-1/2,v')
 \label{geom:split-coordinates}
\end{equation}
```
```tex
This square lies in the transverse factor only; no planar realization
of the original incidence configuration has been assumed.
```
```tex
Finally, the full-line choices $AC,AD$ at $A$ and $BC,BD$ at $B$
give
\[
 M_A=h_{AC}\oplus h_{AD}=\delta_2(0,m),\qquad
 M_B=h_{BC}\oplus h_{BD}=\delta_2(0,m').
\]
Here $\delta_2$ is dilation in the original cone $T$; no cone
structure on $Q$ is needed.  It doubles all distances.  By
Equation~\eqref{geom:opposite-midpoints},
\[
 \norm{M_A}=\norm{M_B}=1,\qquad d_T(M_A,M_B)=2,
\]
so $\ip{M_A}{M_B}=-1$.  This contradicts
Equation~\eqref{geom:nonnegative} and proves the proposition.
\end{proof}
```

(b) `[补]` `geom:antipodal` 的角账目与 6.5 的全链：
1. $d(Y_D,H_0)\ge\sqrt3$：三字段 admissible（$F_D$ 两条 + loose）⇒ 引理 5.5 第三句平方 $\ge3$；
 另一方面 $d(Y_D,c)+d(c,H_0)=\frac{\sqrt3}2+\frac{\sqrt3}2=\sqrt3$ ⇒ 三角不等式反向夹 ⇒ 等号
 ⇒ $c\in[Y_D,H_0]$ ⇒ $\hat y_D,\hat h_0$ 对径 ✓。
2. $a,b$ 的来源：$\cos\angle(\hat M_C,\hat h_0)=\frac{\ip{M_C}{h_0}}{\|M_C\|\|h_0\|}=\frac{1/2}{\sqrt3/2}=\frac1{\sqrt3}$ ✓ $=a$；
 $\cos\angle(\hat h_0,\hat x_D)=\frac{1/4}{3/4}=\frac13$ ✓ $=b$；
 $\cos\angle(\hat x_D,\hat y_D)=\frac{\ip{x_D}{y_D}}{3/4}=\frac{-1/4}{3/4}=-\frac13$ ⇒ 角 $\pi-b$ ✓（引理 6.2）。
3. $2a+b=\pi$：$\cos 2a=2\cdot\frac13-1=-\frac13=\cos(\pi-b)$ 且两角同属 $(0,\pi)$ ⇒ 等 ✓。
4. $M_D$ 平分 $\hat x_D\to\hat y_D$ 弧：$M_D=x_D\oplus y_D$，两加数等长（都 $=r$）⇒ 扇形内和向量方向平分 ✓，
 故 $d_\Sigma(\hat x_D,\hat M_D)=\frac{\pi-b}2=a$ ✓（用 3.）。
5. 局部测地线：$\hat h_0,\hat x_D,\hat y_D$ 长 $\pi$、端点对径 ⇒ 极小 ⇒ 在 $\hat x_D$ 处可测地延拓；
 $\hat M_C\to\hat h_0$ 的延拓在第一扇形内成立 ⇒ 四元链局部测地、长 $a+b+a=\pi$；
 BH II.1.4(2)（CAT(1) 中长度 $\le\pi$ 的局部测地线整体极小）⇒ 端点 $\hat M_C,\hat M_D$ 对径 ⇒
 $d_T(M_C,M_D)=2$、$\ip{M_C}{M_D}=-1$ ✓。原文并**主动补**了端点情形：
 "including the endpoint case of length exactly $\pi$.  Equivalently, apply the short local-geodesic
 assertion to every strict initial subarc and pass to the endpoint by continuity of distance."
6. `geom:axis-products`：$\ip{M_C}{h_{AD}}\ge\ip{h_{AC}}{h_{AD}}+\ip{h_{BC}}{h_{AD}}=-\frac14-\frac14=-\frac12$
 （凹性；四线两两不同 ✓）；同理 $\ip{M_C}{h_{BD}}\ge-\frac12$；
 于是 $-1=\ip{M_C}{M_D}\ge\ip{M_C}{h_{AD}}+\ip{M_C}{h_{BD}}\ge-1$ ⇒ 全等号 ✓；
 交换 $C,D$ 角色得另一行 ✓（此处用 $M_D=x_D\oplus y_D$ 与 $M_D=h_{AD}\oplus h_{BD}$ 的一致，即 `geom:fan-identities`）。
7. 每列向量的两端角为 $a,\pi-a$：$\frac{\pm1/2}{\sqrt3/2}=\pm\frac1{\sqrt3}$ ⇒ $\arccos$ 分别 $a$、$\pi-a$ ✓；
 两弧拼接长 $\pi$ 且端点对径 ⇒ 极小半圆 ⇒ 其欧氏锥是含该向量的**平坦半平面**，边界 $\ell$ ⇒ 该向量在与 $\ell$ 平行的直线上 ✓。
8. II.2.14 平行集分裂 $P(\ell)=\mathbb R\times Q$；轴向坐标 $=\ip{M_C}{\cdot}$（半平面内到 $\ell$ 的投影）✓
 ⇒ 式 `geom:split-coordinates`；$\|h\|^2=\frac34=(\pm\frac12)^2+d_Q(\cdot,q_0)^2$ ⇒ $d_Q=1/\sqrt2$ ✓。
9. $d_T(h,h')^2=\frac34+\frac34-2(-\frac14)=2$ ✓；乘积度量：同列差 $(0,\cdot)$ ⇒ $d_Q(u,u')=\sqrt2$、
 $d_Q(v,v')=\sqrt2$；异列差 $(1,\cdot)$ ⇒ $1+d_Q(\cdot,\cdot)^2=2$ ⇒ 四组都 $=1$ ✓。
10. $h_{AC}\oplus h_{BC}=M_C$ ⇒ 中点 $(\frac12,q_0)$ ⇒ 乘积中点 ⇒ $q_0=$mid$_Q(u,u')$；同理 $q_0=$mid$_Q(v,v')$ ✓。
11. 循环序 $u,v,u',v'$：四边全 $=1$、两对角 $=\sqrt2$ ⇒ 引理 6.1 ⇒ 以 $q_0$ 为中心的单位平坦 square ✓；
 $m=$mid$(u,v)$、$m'=$mid$(u',v')$ 为对边中点 ⇒ $d_Q(q_0,m)=d_Q(q_0,m')=\frac12$、$d_Q(m,m')=1$ ✓
 （式 `geom:opposite-midpoints`）。
12. 最后：$M_A=h_{AC}\oplus h_{AD}=(\frac12,u)+(-\frac12,v)=(0,u+v)=\delta_2(0,m)$ ✓、
 $M_B=\delta_2(0,m')$ ✓；$\|M_A\|=2\cdot\frac12=1$ ✓（$\delta_2$ 把到顶点距离翻倍），
 $d_T(M_A,M_B)=2d_T((0,m),(0,m'))=2d_Q(m,m')=2$ ✓ ⇒ $\ip{M_A}{M_B}=\frac{1+1-4}{2}=-1$ ⇒ 与 $\ge0$ 矛盾 ✓。

(c) `[机械理由]` "it requires no properness"（II.2.14）与 "no cone structure on $Q$ is needed"
是两条合法性声明：分裂定理不需 proper；$Q$ 只是度量因子，不是锥。
"This square lies in the transverse factor only; no planar realization of the original incidence
configuration has been assumed." 是防止读者误读成"平面嵌入"的**免责声明**（见 3.2）。

(d) `[推测]` 失败路线：$a+b+a=\pi$ 完全由 $\frac12,\frac14,-\frac12$ 三个内积值定死；
`[推测]` 若 $r$ 不是 $\sqrt3/2$（即 §5 的三边半路下界不是 3），$2a+b=\pi$ 不成立，
局部测地线长度不是 $\pi$，对径性失败 ⇒ 整条 §6 崩塌。因此 $D=15$/$k\le3$ 与 $r=\sqrt3/2$ 是全链条最脆的数值。
证据来源：$a,b$ 的定义只出现一次且必须满足 $2a+b=\pi$。
Lean 对应：`CATZeroFurther.lean:189-208 structure FiniteObstructionData`
（把 `prop:configuration` 三条 ＋ fullLines ＋ 轴表打包成有限数据）、
`:212 no_finite_obstruction`（对应命题 6.5）、`MetricHexagon.lean:409 impossible (h : CATZero X)
(he : ExceptionalTest h z) : False`；平行集分裂在 Lean 中**未见** Mathlib `ParallelSet`/分裂定理的调用，
`[推测]` 改由"距离等式直接给出 $\mathbb R\times Q$ 坐标"实现（相关：`MetricProduct.lean` 的
`MetricScale`/`PiLp`、`MetricHexagon.lean:42 log_dist` 的等号版本）——这是终稿值得写的
"机器化时必须替换的经典定理"（见 4.6、5.3）。

## 2.38 引理 7.1（`lem:completion-diagonal`，第 4–33 行）：确定性对角线序列

(a) 原文逐字（陈述四项＋参数选取＋$G_j$ 无限）：

```tex
\begin{lemma}[A deterministic diagonal sequence]\label{lem:completion-diagonal}
There is a sequence of realizations of the tables, with $n_j\to\infty$ and positive parameters $\alpha_j,\beta_j,\delta_j\to0$, such that
\begin{enumerate}[label=\textup{(\roman*)}]
\item the associated complexes $P_j$ are aspherical and have a linear letter disk-filling inequality;
\item the master match sets are nonempty and their single-field marginals tend to uniformity in total variation;
\item for every admissible pair $I,\{e\}$ and every fixed integer $t$, the common-$I$ coupling in Proposition~\ref{prop:sampling} has both of its total variation errors tending to zero along the sequence;
\item the six-letter table pair counts have uniformly vanishing relative error.
\end{enumerate}
The groups $G_j=\pi_1P_j$ are infinite.
\end{lemma}
```
```tex
At stage $j$, request all the admissible tests in the fixed master pattern with $1\le t\le j$. This is a finite list. Choose $\varepsilon_j>0$ small enough for Proposition~\ref{prop:sampling} for this list and for Theorem~\ref{thm:diagram}, with $\varepsilon_j<1/(400j)$, and set
\[
 \alpha_j=\delta_j=\varepsilon_j,
 \qquad \beta_j=8\varepsilon_j.
\]
These parameters satisfy $\beta_j>7\alpha_j$, and the exponent $3-\beta_j-90\delta_j$ of the master count is positive. Moreover,
\[
 j(\beta_j+90\delta_j)=98j\varepsilon_j<\frac{98}{400}<\frac12,
\]
so the explicit bound in Section~\ref{sec:sampling} preserves every overlap margin required for the finite list.
```
```tex
Choose $n_j>n_{j-1}$ so large that there is positive probability that all these events hold and all requested sampling errors are at most $1/j$. Select one realization in their intersection. No comparison between the fragment threshold and $n$ is needed before fixing the parameters and threshold. This proves \textup{(i)}--\textup{(iv)}.

Each $G_j$ has a quotient $C_2$ by Lemma~\ref{lem:model-presentation}. If it were finite, its universal cover would be a finite contractible CW complex, and multiplicativity of Euler characteristic would give
\[
 1=\chi(\widetilde P_j)=|G_j|\chi(P_j).
\]
Since $\chi(P_j)$ is an integer, this forces $|G_j|=1$, contrary to the quotient. Hence $G_j$ is infinite.
```

(b) `[补]` 算账：$\beta_j+90\delta_j=8\varepsilon_j+90\varepsilon_j=98\varepsilon_j$，
$t_{\max}=j$ ⇒ $j(\beta_j+90\delta_j)=98j\varepsilon_j<98/400=0.245<1/2$ ✓；
$3-\beta_j-90\delta_j=3-98\varepsilon_j>0$（$\varepsilon_j\le1/400<3/98$）✓；
$\beta_j>7\alpha_j$ 即 $8\varepsilon_j>7\varepsilon_j$ ✓。
`[机械理由]` $1/400$ 只需同时满足 $98/400<1/2$ 与 $\varepsilon_j<3/98$，是留余量的"整齐数"。
"finite list" 是关键：admissible 字段集（$\le3$）与 $t\le j$ 都有限 ⇒ 每项 $o(1)$ 各有一个 $N$ 阈值 ⇒
取最大者 ⇒ **正概率**同时成立（原文用 "positive probability" 而非趋 1 的语言，以便
"Select one realization in their intersection" 这一确定性选取）✓；$n_j>n_{j-1}$ 保证 $n_j\to\infty$ ✓。

(c) `[机械理由]` 为什么是"确定性序列"：§5 要求 $h_I$ 由"表揭示后才选定的作用"决定，
若直接用概率语句对 $j$ 取极限会引入"$\nu$ 依赖 $t$"的循环；对角线把"每个固定测试在所有足够大的 $j$
处成立"变成一条实序列上的性质 ✓。$\chi(P_j)$ 为整数 ⇒ $|G_j|=1$ 与 $C_2$ 商矛盾 ✓
（与 2.25(b)8 同一 $\chi$ 论证，这里额外用到 §2 的 parity 商 $G\twoheadrightarrow C_2$）。

(d) `[推测]` 失败路线：若 admissible 测试族无限（例如允许 $t$ 无界），"$N$ 阈值取最大"不成立，
对角化无法进行；§4 第 464–466 行预先禁止 $t$ 无界正是为此 ✓。
证据来源：`No comparison between the fragment threshold and $n$ is needed before fixing the
parameters and threshold.`（自我辩护句，呼应注记 3.9 与注记 4.6，见 2.15、2.23）。
Lean 对应：`SamplingStage.lean:46 def samplingParameter (m) := 1/(1000*(m+1))`、
`:52 (m+1)*(98*samplingParameter m) ≤ 1/2`（**98 逐字出现**；$t_{\max}=m+1$、$\phi=\varepsilon$，
$1/1000$ 与原文 $1/400$ 同角色）；`DiagonalSampling.lean:16 stageError := 1/(m+4)`（$1/j$ 型误差）、
`:31 structure SamplingStage`、`:43 hest (k+1)*(8*φ+90*φ) ≤ 1/2`、`:50 7*φ ≤ 8*φ` ✓；
`RankSampling.lean:81/:84/:108/:112`、`LiftedDiagramSampling.lean:23/:26/:35/:57`
（图示事件与抽样事件在同一 $m$ 下相交）；`IndexedFillingValue.lean:2741 abbrev finalSize`、`:6721 finalFinite_hyperbolic`。

## 2.39 命题 7.2（`prop:completion-no-action`，第 35–42 行）

(a) 原文逐字：

```tex
\begin{proposition}\label{prop:completion-no-action}
For all sufficiently large $j$, the group $G_j$ in Lemma~\ref{lem:completion-diagonal} admits no geometric action on any proper complete $\CAT(0)$ space.
\end{proposition}
```
```tex
Suppose, more generally, that infinitely many $G_j$ admitted such actions. Restrict to that subsequence and choose one action for each of its groups. All fixed-test limits in Lemma~\ref{lem:completion-diagonal} remain valid. The action spaces, their dimensions, and their local geometries are allowed to vary.

Normalize the minimizing generator energy for each action as in Equation~\eqref{energy:normalization}. The infinitude just proved makes this energy positive. The displacement estimate and Lemma~\ref{lem:conditional-test} hold uniformly for these choices of actions. Proposition~\ref{prop:configuration} therefore supplies the limiting configuration. Proposition~\ref{prop:no-configuration} excludes it. Thus only finitely many of the selected groups can admit such actions; in particular, an instance with no action exists.
```

(b) `[补]` 反证结构：结论"对所有足够大的 $j$"；证明假设"无穷多个 $G_j$ 有作用"，取该子列并各选一个作用，
把 §5–§6 整套（归一 → 位移界 → 一致测试 → 乘积/超滤 → 配置 → 排除）套上去 ⇒ 矛盾
⇒ 只有有限多个 $j$ 容许作用 ⇒ 存在无作用实例 ✓。
`[补]` "energy positive" 是**归一可行**的前提（除以 $\sqrt{E_{\min}}$ 需非零），
即 2.25(b)4（proper ⇒ 稳定子有限 ⇒ $E_{\min}>0$）在此被消费 ✓。

(c) `[机械理由]` "The action spaces, their dimensions, and their local geometries are allowed to vary"
是强度声明：结论对**任何** proper complete CAT(0) 空间中的几何作用成立，不需一致维数/一致曲率
（与 `prop:configuration` 的 $Z$ 只要求 complete CAT(0) 呼应）。

(d) `[推测]` 失败路线：若想对单个固定 $j$ 直接排除作用，需要该 $P_j$ 的一致几何界；
作者把排除放在**子列**层面（用 $\nu\to\infty$ 的极限配置）正是因为单实例没有刚性。
证据来源：证明首句 "Suppose, more generally, that infinitely many $G_j$ admitted such actions."
的"more generally"措辞。
Lean 对应：`IndexedFillingValue.lean:5352 finalFinite_noAction`、`:5374 finalFinite_linear`、
`:5439 finalFinite_aspherical`、`:6721 finalFinite_hyperbolic`、
`:6747 exists_finite_aspherical_hyperbolic_noAction`；
`ConditionalStar.lean:213 exists_of_geometric`（"有作用 ⇒ 提供 EnergyOrbit"，其
`MetricScale.Space r hr X` 即归一缩放）；`GeometricAction.lean`、`DevelopmentGeometricAction.lean`。

## 2.40 引理 7.3（`lem:completion-transfer`，第 44–58 行）：有限模型填充转移

(a) 原文逐字（小标题动机句＋陈述＋三界构造）：

```tex
\subsection{Passing to a finite simplicial model}
We record the filling transfer because the conclusion is about edge loops in a finite simplicial complex, rather than just words in a presentation.

\begin{lemma}[Finite-model filling transfer]\label{lem:completion-transfer}
Let $P$ be a finite connected CW complex with contractible universal cover. Suppose a finite presentation of $\pi_1P$ has a linear disk-filling inequality. Then $P$ has a finite connected simplicial homotopy model $K$, whose universal cover is contractible and satisfies a linear combinatorial disk-filling inequality.
\end{lemma}
```
```tex
Choose substitutions $\phi$ from new generators to old words and $\psi$ from old generators to new words, inducing inverse group identifications. Let $L$ bound the lengths of the words $\phi(b)$, let $M$ bound the new-presentation filling areas of the finitely many substituted old relators $\psi(r)$, and let $D$ bound the filling areas of the words $b\psi(\phi(b))^{-1}$. The latter two lists consist of null words, and all three lists are finite, so these bounds exist. A new null word of length $\ell$ substitutes to an old word of length at most $L\ell$. If the old filling constant is $C_{\rm old}$, filling that word and replacing its relator cells costs at most $MC_{\rm old}L\ell$ new cells. The boundary substitutions cost at most $D\ell$ more. Thus the new filling constant is at most $MC_{\rm old}L+D$.
```
```tex
An edge loop in $\widetilde K$ projects to a null loop in $K$. Its disk diagram lifts with the chosen boundary lift, giving the required estimate in the universal cover.
```

(b) `[补]` 三个常数的合成：$L$（新→旧词长界）、
$M$（每个"旧关系代入 $\psi$ 后"在新表列中的填充面积上界，有限列表 ⇒ 取最大）、
$D$（校准词 $b\psi(\phi(b))^{-1}$ 的填充面积上界）。
链条：新空词 $w$（长 $\ell$）$\xrightarrow{\phi}$ 旧空词（长 $\le L\ell$）$\xrightarrow{\text{旧填充}}
\le C_{\rm old}L\ell$ 个旧胞腔 $\xrightarrow{\text{每个旧关系}\le M}$ $\le MC_{\rm old}L\ell$ 个新胞腔
$\xrightarrow{\text{边界字母校准}}+D\ell$ ⇒ 新常数 $MC_{\rm old}L+D$ ✓。
maximal-tree 表列：生成元 $=$ 非树边、关系 $=$ 三角面；插入树路径长度一致有界（树有限）⇒
词长仍是 $\ell$ 的线性函数；每个关系胞腔 $\to$ 一个三角面 ⇒ $C\ell$ 个三角面；
最后把磁盘图连同边界提升搬到 $\widetilde K$ ⇒ 万覆叠中的组合填充线性 ✓。

(c) `[机械理由]` 该引理是"presentation 层次 ⇒ simplicial 层次"的桥梁：
`thm:main` 的结论关于**有限单形复形的边环**，而 §3 的线性填充是对**字母表词**证的；
转移保持线性、只改常数 ✓。小节首句就是这个动机（属 3.3 设计动机句）。

(d) `[推测]` 失败路线：若 $K$ 不能与 $P$ **同维数**（Hatcher 2C.5 的构造给同维数），
定理 1.1 中"$K$ 二维"就拿不到。证据来源：下一段证明中的
"Since $P_j$ has dimension two, the same-dimension construction gives a two-dimensional $K$."
——同维数被单独声明，说明它是额外条件（见 3.2 边界声明、4.4 Lean 差异）。
Lean 对应：`FinitePolygonModel.lean:94 simplex_card_le_three`（单形 $\le2$ 维 ✓ 机器里确实有这条），
`OriginalLinearFilling.lean`（原词表线性填充）、`PictureRadiusSeparator.lean`、
`ConeSkeleton.lean`/`ConeCover.lean`/`VoltageTriangles.lean`（覆叠与三角拼装）。

## 2.41 定理 1.1 的证明（第 60–66 行）与结尾注记（第 68–70 行）

(a) 原文逐字：

```tex
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Choose an instance $P_j$ supplied by Proposition~\ref{prop:completion-no-action}. Its finite letter presentation has a linear disk bound by Theorem~\ref{thm:diagram}. Apply Lemma~\ref{lem:completion-transfer} to obtain $K$. Since $P_j$ has dimension two, the same-dimension construction gives a two-dimensional $K$. This proves the asserted asphericity and linear filling estimate. Its fundamental group is $G_j$, so it has the no-action property. The equivalence between a linear Dehn function and word hyperbolicity gives the final group-theoretic assertion~\cite[Exercise~III.H.2.5(5), Proposition~III.H.2.7, and Theorem~III.H.2.9]{BH1999}.

Suppose that a finite simplicial complex $L$ homotopy equivalent to $K$ admitted a compatible locally $\CAT(0)$ geodesic length metric. The metric space $L$ is compact, hence complete and locally compact. Give its universal cover the induced length metric, for which the covering map is a local isometry~\cite[Proposition~I.3.25]{BH1999}. This cover is complete: a Cauchy sequence upstairs projects to a convergent sequence downstairs; sufficiently short connecting paths force a tail into one sheet over an evenly covered neighborhood of the limit, where it converges. The Cartan--Hadamard theorem makes the cover globally $\CAT(0)$~\cite[Theorem~II.4.1(2)]{BH1999}. It is locally compact, and the length-space Hopf--Rinow theorem makes it proper~\cite[Proposition~I.3.7]{BH1999}. Its deck transformations act freely, properly and cocompactly by isometries.

The isomorphism $\pi_1L\cong\pi_1K=G_j$ therefore gives a geometric action of $G_j$ on a proper complete $\CAT(0)$ space, a contradiction. This also excludes compatible locally $\CAT(-1)$ geodesic length metrics, since a $\CAT(-1)$ space is $\CAT(0)$~\cite[Theorem~II.1.12(1)]{BH1999}.
\end{proof}
```
```tex
\begin{remark}
The argument makes no curvature assumption on the random complexes $P_j$. Curvature comparison is used only in a hypothetical action space, after the combinatorial filling and asphericity statements have been established. Nor is a common filling constant needed for the diagonal sequence: only the constant for the single chosen finite complex appears in Theorem~\ref{thm:main}.
\end{remark}
```

(b) `[补]` 六步链条（终稿"定理机器"图可直接用）：
1. $P_j$ 无几何作用（`prop:completion-no-action`）＋线性字母填充（`thm:diagram`）。
2. 转移到二维有限单形 $K$，$\widetilde K$ 可缩且组合填充线性 ⇒ asphericity ✓。
3. 线性 Dehn 函数 ⇒ 词双曲（BH III.H.2.5(5)/2.7/2.9）✓ ⇒ 群论结论。
4. 反设 $L\simeq K$ 容许 compatible locally CAT(0) 测地长度度量；$L$ 紧 ⇒ 完备、局部紧。
5. 万覆叠带导出长度度量 ⇒ 覆叠映射局部等距（I.3.25）；**完备性由一段显式论证给出**
 （Cauchy 列下投收敛 ⇒ 短连接路径把尾部压进某个均匀覆叠邻域的一张叶 ⇒ 收敛）✓；
 Cartan–Hadamard（II.4.1(2)）⇒ 全局 CAT(0)；局部紧 ＋ 长度空间版 Hopf–Rinow（I.3.7）⇒ proper；
 deck 变换自由、proper、cocompact ✓。
6. $\pi_1L\cong G_j$ ⇒ 几何作用 ⇒ 矛盾 ✓；CAT(−1) 情形由"CAT(−1) ⇒ CAT(0)"（II.1.12(1)）自动包含 ✓。
`[补]` 第 5 步的完备性论证不可省：局部等距覆叠**一般**不保持完备性；作者写出 Cauchy 列论证，
说明这是刻意补的（对应 `CompactLocalCATGeometric.lean`，见 4.4/4.6）。

(c) `[机械理由]` 结尾注记的两条"没做什么"（3.2 边界声明）：
(i) 随机复形 $P_j$ 上**不做任何曲率假设**（曲率比较只在"假想作用空间"里用）；
(ii) 对角线序列**不需要统一填充常数**，只有被选中的那个有限复形的常数进入定理 1.1 ✓。
这解释了为什么 §3 的 $C_0$、§3 的分隔符阈值 $K$、§4 的 $t_{\max}$ 都不进入最终陈述。

(d) `[推测]` 失败路线：若想直接给 $P_j$（二维复形）赋 locally CAT(0) 度量再走同一条链，
需要 $P_j$ 的曲率信息——而 §3 恰恰**证明**"不存在这样的有限 locally CAT(0) 同伦模型"；
注记 (i) 是在澄清"我们没有假设它、我们是证明它不可能" ✓。
证据来源：注记原文 ＋ 1.8 节"回答的公开问题"的表述。
Lean 对应：`Main.lean:15 theorem main : MainStatement.{u}`
（由 `IncidenceTemplate.exists_finite_aspherical_hyperbolic_noAction` ＋
`homotopy_incompatibleLocalCATNegOne` 合成，只 import `CompactLocalCATGeometric`）；
`Basic.lean:136 CompatibleLocallyCATNegOne`、`:145-151 MainStatement`；
`CompactLocalCATGeometric.lean`（第 5–6 步的机器化）；
`GeometricAction.lean`/`DevelopmentGeometricAction.lean`（deck 作用的 proper/cocompact）。
`[注意]` Lean 的 `MainStatement` **只**排除 locally CAT(−1) 同伦模型、**没有**二维性子句
（见 4.4 差异表与 5.3），故与本文定理 1.1 的措辞并非逐字等同。

---

# 三、叙事时间线

`[说明]` 本节全部引文取自 `build/sections/*.tex` 源码（禁用 pdftotext）；行号为该文件内的物理行号。
`reasoning_traces/` 目录下 16 个条目均不匹配本论文标题/关键词（hyperbolic、CAT0、geometric action），
**无 summary**，故本节不存在任何"作者自述思考过程"的外部材料可用；所有"思维链"级别的内容只能来自论文正文本身。

## 3.1 论文自述的动机（逐字引文 + 位置）

1. **总动机**（`01-introduction.tex:2`）：
   > A linear isoperimetric inequality is a large-scale expression of negative curvature: for finitely presented groups, it characterizes word hyperbolicity. Local comparison geometry is more restrictive. The geometric realization question asks whether every hyperbolic group admits a geometric action on a proper $\CAT(0)$ space, or on a proper $\CAT(-1)$ space. We construct a group for which neither action exists.

   这一句把论文的**问题形态**定死为"实现问题"（realization problem），不是"填充问题"，也不是"判别问题"。
   终稿写作时必须保持这个方向：组合侧已经成立（线性填充），失败的是几何侧（局部比较几何）。

2. **构造的双重要求**（`01-introduction.tex:95–97`）：
   > The construction must satisfy two requirements: its relations must be sparse
   > enough to preserve hyperbolicity and asphericity, yet impose enough metric
   > constraints to exclude geometric actions on proper $\CAT(0)$ spaces.

   `[机制]` 这是全文最紧凑的一句"设计约束"。两个子句分别对应 §3（稀疏 ⇒ 线性填充 + asphericity）
   与 §5–§6（够多度量约束 ⇒ 排除作用）；§4 是二者之间的桥梁（让约束对"后选的作用"仍有效）。

3. **序列与选择顺序**（`01-introduction.tex:113–124`）：
   > We choose a sequence of such finite presentations, with progressively stronger
   > finite counting requirements.  At each stage, a finite list of statistical
   > tests is fixed before choosing the sampling parameters; those parameters then
   > remain fixed while the alphabet grows.  If infinitely many of their groups admitted
   > geometric actions on proper complete $\CAT(0)$ spaces, choose one
   > action for each of those groups.
   > The closed-walk relations realize the fixed graph by orbit points in every
   > chosen action.  After normalizing the average squared generator displacement,
   > products of these configurations have a limiting configuration in a complete
   > $\CAT(0)$ space.  The counting requirements force exact metric identities in
   > that limit, and a finite geometric contradiction excludes it.  Thus every
   > sufficiently late group in the chosen sequence admits no such action.

   `[注意]` "a finite list of statistical tests is fixed **before** choosing the sampling parameters;
   those parameters then remain fixed while the alphabet grows" 是全文量词顺序的唯一权威表述，
   与注记 4.6（`04-sampling.tex` 末）和 `07-completion.tex:2` 的"keeping the order of all choices explicit"三处互相锁定。

4. **§4 自述动机**（`04-sampling.tex:3–8`）：
   > The relations will be tested against an action chosen after all the tables
   > have been sampled.  We therefore prove statements about total variation of
   > finite distributions on table matches.  These statements do not refer to a
   > target metric space.  In particular, they will apply simultaneously to all
   > uniformly bounded functions on the relevant assignments, including functions obtained
   > from a subsequently chosen action.

5. **§5 自述动机**（`05-energy.tex:3–8`）：
   > The sampling statements in Proposition~\ref{prop:sampling} concern finite
   > tables alone.  In this section they will be applied to functions obtained
   > from an isometric action chosen after those tables are known.  The order
   > is important: we first obtain a bound on every generator displacement
   > using the pointwise relative counts in the six-letter table.  Only then
   > do we use total variation estimates for action-dependent functions.

6. **§6 自述动机**（`06-obstruction.tex:4–9`）：
   > We now show that the configuration obtained in
   > Proposition~\ref{prop:configuration} cannot occur in a complete $\CAT(0)$
   > space.  The argument takes place first in that space and then in its
   > completed tangent cone at the common hexagon center.  The tangent cone
   > is not assumed to be a vector space, so we specify the meaning of its
   > sums and use concavity whenever an additive inequality is required.

7. **§7 自述动机**（`07-completion.tex:2`）：
   > We now assemble the arguments, keeping the order of all choices explicit.

8. **§3 自述动机（余量的出处）**（`03-diagrams.tex:17–25`）：
   > The central estimate will bound the number of faces in a bounded
   > piece of a normalized diagram by the number of its exposed sides. The expected
   > occurrence counts in Section~\ref{sec:model} have exponents
   > $2-\alpha$, $3-\beta$, and $h-\delta$ for fans, tops, and decorations
   > of length $2h$. The local incidence geometry compares these with the
   > values $2$, $3$, and $h$. After shared fan costs have been accounted
   > for, the differences $\alpha$, $\beta-7\alpha$, and $\delta$ supply the
   > strictly positive margin in the boundary estimate.

   `[重要]` 这里是 $\beta-7\alpha$ 这个"看起来武断"的组合的**官方出处**：fan 的指数亏 $\alpha$、
   top 的亏 $\beta$，但一个 fan 顶多被 7 个 copy 共用（7 个 fan 的总代价），所以共享 fan 成本入账后
   top 一侧净余 $\beta-7\alpha$。终稿引这段可以省掉一次自行猜测。

## 3.2 论文自述的已知结果与 lineage（逐字 + 位置）

- **Gromov 的历史自述**（`01-introduction.tex:19–25`）：
  > In his account of that development, Gromov recalls introducing linear
  > isoperimetry as a group-theoretic form of negative curvature and then
  > spending years seeking geometric realizations by negatively curved
  > spaces~\cite[p.~396]{RaussenSkau2010}.
  > The equivalence between linear filling and word hyperbolicity became
  > part of the foundational theory~\cite{Gromov1987}; see also
  > \cite[Theorem~III.$\Gamma$.2.6 and Remark~III.$\Gamma$.2.7(2)]{BH1999}.

- **公开问题的三个具体坐标**（`01-introduction.tex:26–31`）：
  > The $\CAT(-1)$ realization question appears as Problem~H11 in
  > Baumslag--Myasnikov--Shpilrain's 1999 problem
  > list~\cite{BaumslagMyasnikovShpilrain1999}.
  > Both the $\CAT(-1)$ and $\CAT(0)$ questions appear as open problems
  > in Stark's 2025 survey~\cite[Open Problem~2.15]{Stark2025} and in the
  > March 2026 preprint of Duchesne--Simon~\cite[Question~W]{DuchesneSimon2026}.

  `[终稿用法]` 这三个引用编号（H11 / Open Problem 2.15 / Question W）是论文自己给出的"命中清单"，可直接引用，无需外部补充。

- **正面路线的枚举**（`01-introduction.tex:33–39`）：free group 在树上、闭双曲流形群在 $\mathbb H^n$ 上、
  局部 CAT 度量的万覆盖 + deck 作用（引 BH II.4.1）、cubulation。

- **Ollivier–Wise 密度模型**（`01-introduction.tex:40–46`）：
  > For example, Ollivier--Wise prove that random groups in the density
  > model at density less than $1/6$ act freely and cocompactly on
  > $\CAT(0)$ cube complexes with probability tending to one as relator
  > length grows, with the number of generators fixed~\cite[Theorem~10.4]{OllivierWise2011}.
  > Thus random presentations can produce geometric $\CAT(0)$ actions as
  > well as hyperbolicity; the relations used here must enforce an
  > additional obstruction.

- **Brady–Crisp 的维度限制**（`01-introduction.tex:48–59`）：
  > Dimension restrictions already yield obstructions.
  > Brady--Crisp~\cite[Theorem~2]{BradyCrisp2007} construct infinitely many
  > torsion-free hyperbolic groups of geometric dimension two which admit
  > no proper isometric action on a proper two-dimensional $\CAT(0)$
  > space. Their Theorem~1 gives a hyperbolic group of $\CAT(0)$ dimension
  > two and $\CAT(-1)$ dimension three. These conclusions rely on
  > constraints on translation lengths in two-dimensional targets.
  > Theorem~\ref{thm:main} excludes geometric $\CAT(0)$ actions in every
  > dimension. Its finite-model consequence also allows the entire
  > simplicial complex to change within its homotopy type: any compatible
  > locally $\CAT(0)$ geodesic length metric on such a model would recover a geometric
  > action by passing to the universal cover.

  `[对比点]` 论文明确把自己的**增量**说成两条：(a) 不限目标维度；(b) 允许复形在同伦型内整体替换。
  这是可以直接搬进终稿"贡献"段落的作者原话。

- **计数方法的 lineage**（`01-introduction.tex:61–71`）：
  > Random-presentation proofs of hyperbolicity combine counting for
  > bounded diagrams with a local-to-global argument.
  > Our treatment of repeated relator occurrences is related to the
  > multiplicity and constraint methods in
  > Ollivier~\cite[Section~2.2]{Ollivier2004} and
  > Antoniuk--Friedgut--\L uczak~\cite[Section~3]{AntoniukFriedgutLuczak2017}.
  > Within each finite presentation we first sample small labelled graphs,
  > then larger labelled graphs whose required small graphs have already
  > been selected. The same prerequisite can support several larger
  > graphs, so its probability cost must be charged only once.
  > Section~\ref{sec:diagrams} proves the resulting estimate directly.

- **能量框架的 lineage**（`01-introduction.tex:73–92`）：
  > The obstruction to actions uses the harmonic-energy framework of
  > Gromov~\cite[Sections~3.3 and~3.7]{Gromov2003} and
  > Izeki--Nayatani~\cite{IzekiNayatani2005}.
  > In this framework, expansion in a finite graph can force a fixed point
  > when the target satisfies a suitable nonlinear spectral inequality.
  > The target hypothesis matters: Izeki--Kondo--Nayatani obtain random
  > hyperbolic groups with fixed-point properties for target classes whose
  > tangent-cone invariant is bounded by a prescribed constant strictly
  > less than one~\cite[Corollary~3.8]{IzekiKondoNayatani2012}.
  > Toyoda~\cite[Theorem~1.4]{Toyoda2016} supplies such spectral bounds
  > for a prescribed finite family of geodesically complete $\CAT(0)$
  > spaces admitting proper cocompact actions, with constants depending
  > on that family.
  > Here a hypothetical target and its action can be chosen after the
  > finite presentation is known. We obtain the required uniformity from
  > bounds on every generator displacement and total-variation couplings
  > of table matches. Sturm's inductive
  > means~\cite[Definition~4.6 and Theorem~4.7, proof~(a)]{Sturm2003}
  > then turn those couplings into the averaging estimate used in the
  > energy argument.

  `[要点]` 作者把"Toyoda 只对**预先给定的有限族**给常数"与"本文目标是在呈现已知**之后**才选的"
  并列写出，这就是本文不用现成 nonlinear spectral gap 而是自建"位移界 + TV 耦合 + Sturm 归纳均值"
  三件套的**理由**。终稿"技术选择"段应该照这个逻辑写，而不是照"我们证明了更强的谱不等式"写（论文没有后者）。

- **切锥基础**（`01-introduction.tex:177–179`）：completed tangent cones / completed spaces of directions，
  引 BH II.3.19，并转引 Kleiner–Leeb §2.1.3（"who credit Nikolaev's tangent-cone theorem"）。

## 3.3 作者明示的边界声明（"本文未证什么"的限定原句）

`[方法]` 只收**限定句/豁免句**（作者主动声明某个假设没被用、某个结论没被断言），不收"我们无法"式表述——
本文全篇没有"we cannot"式句子。共 15 条：

| # | 位置 | 逐字原文 | 声明的边界 |
|---|---|---|---|
| B1 | `01-introduction.tex:15` | The proof is an existence argument and does not give an effective size for $K$. The filling constant may depend on the selected finite presentation. | 无有效性：既不给 $\|K\|$ 的量级，也不给 $C$ 的一致界 |
| B2 | `01-introduction.tex:171–172` | Its filling constant may depend on that chosen presentation. | 同上，第二次声明（放在 structure 末尾） |
| B3 | `01-introduction.tex:175` | Constants in filling estimates may depend on a fixed finite presentation. | 常数归属固定呈现 |
| B4 | `01-introduction.tex:175` | A statement holds \emph{with high probability} if its probability tends to one as the alphabet size tends to infinity, with all parameters in that statement fixed. | whp 的量化范围：参数先固定 |
| B5 | `01-introduction.tex:175` | Finite-test limits and the final diagonal selection will always be distinguished. | 两种极限不许混用 |
| B6 | `01-introduction.tex:180` | Subsequent products and limits need not be proper; properness is used only for the original geometric actions. | 极限空间不 proper——所以 §6 的矛盾不能靠"紧性"论证 |
| B7 | `01-introduction.tex:180` | All estimates specific to the new construction are proved below. | 新构造特有的估计一律自证，不引他人 |
| B8 | `04-sampling.tex:464–466` | The parameters are held fixed while $N$ tends to infinity.  In particular, none of the variance arguments asserts uniformity for unbounded $t$ at a single fixed choice of parameters. | 方差论证**不**对无界 $t$ 一致 |
| B9 | `04-sampling.tex:438–440` | The two marginal conclusions of the coupling serve different purposes. | 耦合的两个边缘结论不可互换使用 |
| B10 | `05-energy.tex:327–328` | Neither properness nor a dimension bound for $Z$ is needed. | 极限空间 $Z$ 的这两个性质**没被用** |
| B11 | `05-energy.tex:506–507` | The following argument gives an angle statement in $Z$ without any assumption that angles commute with ultralimits. | 角度与超极限**不**交换——所以只用距离等式 |
| B12 | `06-obstruction.tex:8–9` | The tangent cone is not assumed to be a vector space, so we specify the meaning of its sums and use concavity whenever an additive inequality is required. | 切锥不必是向量空间 |
| B13 | `06-obstruction.tex:26–27` | This operation is commutative, but no associativity or cancellation law will be used. | $\oplus$ 的结合律/消去律**不用** |
| B14 | `06-obstruction.tex:456–457` | This square lies in the transverse factor only; no planar realization of the original incidence configuration has been assumed. | 横截方块 ≠ 原构形的平面实现 |
| B15 | `06-obstruction.tex:469–470` | Here $\delta_2$ is dilation in the original cone $T$; no cone structure on $Q$ is needed. | $Q$ 的锥结构不用 |

另有两条"技术性让步"值得单列：
- `06-obstruction.tex:348–353`：
  > The space $\Sigma$ is $\CAT(1)$, so \cite[Proposition~II.1.4(2)]{BH1999} makes this local geodesic
  > globally minimizing, including the endpoint case of length exactly $\pi$.  Equivalently, apply the
  > short local-geodesic assertion to every strict initial subarc and pass to the endpoint by continuity
  > of distance.
  `[理由]` BH II.1.4(2) 的标准陈述要求局部测地线**严格短于** $\pi$；这里长度恰为 $\pi$，作者主动给出端点情形的
  替代论证（先取严格初始子弧再取连续极限）。这是一个"引用边界"，终稿若引 BH II.1.4(2) 必须带上这一句。
- `07-completion.tex:26`：
  > No comparison between the fragment threshold and $n$ is needed before fixing the parameters and threshold.
  `[理由]` §3 的 fragment threshold 依赖 $j$，而 $n_j$ 的选取在 threshold **之后**，因此不需要 threshold 与 $n$ 的大小比较。
  这句是 B5/B8 的具体执行示范。

`07-completion.tex:45` 另有一句"为什么要引理 7.1"的说明：
> We record the filling transfer because the conclusion is about edge loops in a finite simplicial complex,
> rather than just words in a presentation.

注记 7.4（`07-completion.tex:68–70`）两个子句都属于边界声明，逐字：
> The argument makes no curvature assumption on the random complexes $P_j$. Curvature comparison is used only
> in a hypothetical action space, after the combinatorial filling and asphericity statements have been
> established. Nor is a common filling constant needed for the diagonal sequence: only the constant for the
> single chosen finite complex appears in Theorem~\ref{thm:main}.

## 3.4 最接近思维链的段落（设计动机的自我叙述）

按"作者如何想到这一步"的可读性排序：

1. **`01-introduction.tex:44–46`**（约束的诞生）：
   > Thus random presentations can produce geometric $\CAT(0)$ actions as
   > well as hyperbolicity; the relations used here must enforce an
   > additional obstruction.

   `[读法]` 典型的"因为已知方法会同时给两个结论，所以我的对象必须额外阻断其中一个"式推理。

2. **`01-introduction.tex:86–89`**（对现有工具不满足的说明）：
   > Here a hypothetical target and its action can be chosen after the
   > finite presentation is known. We obtain the required uniformity from
   > bounds on every generator displacement and total-variation couplings
   > of table matches.

3. **`01-introduction.tex:148–150`**（耦合结论为何够用）：
   > They therefore apply to bounded tests from any action
   > chosen after the tables are revealed.  The common conditioning tuple may still depend on the further
   > labels; the averaging estimate allows this dependence.

   `[关键]` "conditioning tuple 可以依赖于 later labels"这一句解释了为什么引理 4.4 的耦合必须做成
   "三个 TV 性质"而不是"独立同分布"——因为 §5 使用时条件集 $I$ 是由作用侧的函数挑出来的。

4. **`04-sampling.tex:105–112`**（一个反例推动的定义）：
   > Fix a conditional test $(I,e,t)$.  To couple $t$ matches agreeing on
   > $I$, we will require them to agree on a possibly larger set $U$.
   > The purpose of this enlargement is to make every further extension
   > increase the critical exponent.  For example, if $I$ consists of two
   > fields in one fan $F_i$, then completing that fan leaves the exponent
   > unchanged:
   > \[
   > h(I)=2=h(E(F_i)).
   > \]

   `[读法]` 这是全文最像"我为什么需要这个闭包"的段落：先给目的，再给一个使朴素做法失效的具体例子。
   闭包 $U$ 的定义（`sample:eq-closure`）正是为了排除这个例子。

5. **`04-sampling.tex:438–443`**（两个边缘结论的分工）：
   > The two marginal conclusions of the coupling serve different purposes.
   > The branch comparison transfers averages of bounded tests between the
   > coupled branches and a uniform match.  In
   > Lemma~\ref{lem:conditional-test}, a pointwise norm estimate bounds the
   > average over the $t$ branches by a function of the $e$-labels alone; the common
   > $I$-labels enter only through a uniform bound.  The comparison with ...

   `[读法]` 与 §5 引理 5.4 的两个极限不可交换（B10/B11 之外的另一处顺序敏感）配套。

6. **`05-energy.tex:5–8`**（选择顺序的显式提醒）：见 3.1 第 5 条。
   `[读法]` "The order is important" 是作者直接告诉读者：先位移界（点对点相对计数）后 TV（依赖作用的函数）。
   颠倒是错的，因为 TV 估计要求被积函数一致有界，而一致有界性来自位移界。

7. **`06-obstruction.tex:8–9, 26–31`**（对非向量空间的警觉）：
   > More generally,
   > all two-vector calculations below are either made in such a sector or
   > follow from the metric definition in Equation~\eqref{geom:cone-addition}.

   `[读法]` 作者声明了**方法论约束**：任意两向量计算要么落进角度 $<\pi$ 的欧氏扇形，要么只用度规定义。
   终稿写这一节时必须按这条自律，否则会在切锥里偷偷用平行四边形法则。

8. **`01-introduction.tex:98–111`**（模板设计的一段流水）：
   > We organize the relations using a fixed modification of the incidence graph
   > of the projective plane over $\mathbb F_2$.  Four point vertices are doubled.
   > At one of them we omit one incidence and keep its counterpart at the other
   > representative separate.  The remaining edges over each point form a small
   > connected graph, called a fan.  We call the resulting incidence graph
   > the core.  Edges receive signed generator labels,
   > and every closed walk in a selected labelled graph gives a relation.
   > Fans are selected first; a labelled copy of the whole graph is selected only
   > when its seven fan restrictions have already been selected.  We study
   > copies for which further four-letter relations close every nonbacktracking two-edge core
   > path to a square.  An independent collection of six-letter relations will
   > control individual generator displacements.  A labelled core copy together
   > with one chosen square completion for every nonbacktracking two-edge core path is a
   > \emph{match}.

   `[读法]` 这段是"先设计几何再设计概率"的证据：先给出 Fano 平面 + 加倍 + 一条松边，然后**才**说明
   选择次序（fan 先、整图后）与三类关系（四字母补方块、六字母控位移）。终稿写构造章节建议照这个顺序，
   与论文实际章节顺序（§2 模板 → §4 采样）一致，而不是照"随机群"惯例先讲概率。

## 3.5 论文未述清单（终稿不得当成论文内容写）

`[诚实约束]` 以下条目在四个 `.tex` 文件中**没有出现**，写作时若需要必须标 `[推测]` 或明确说"论文未述"：

1. **未述** $\widehat\Gamma$ 的顶点总数（定义只能算出 $7+4+7=18$ 个顶点、$32$ 条边；论文给 $32$ 与 $90$，
   但没有一处把顶点数写成一句话）。`[补]`
2. **未述** $\kappa=\min\{\beta-7\alpha,\ \alpha/5,\ \delta\}$ 中 $1/5$ 与 $7$ 的最优性；也没有讨论过
   "能否取 $\beta=7\alpha$"这一临界情形（定理只要求 $\beta>7\alpha$）。
3. **未述** 为何必须用 $\F_2^3$ 而不是更大的 $\F_2^m$ 或其他模板；只有 §1 的间接说法（B1 段前的"additional
   obstruction"）。
4. **未述** $C_0=1/\kappa$、$D=15$、面积界 $60C_0\ell$ 中任何常数的最优性；也未给出下界或不可改进的例子。
5. **未述** 所构群是否为 torsion-free、几何维数 $\mathrm{gd}$、同调维数，或是否与任何已知 CAT(0) 群 quasi-isometric。
   （aspherical 有限复形的 $\pi_1$ 无挠是标准推论，但论文没有写这一句。）
6. **未述** 该群是否 cubitable、是否 virtual special、是否满足 RD3；这些在正文中一次都没出现。
7. **未述** 序列 $\{G_j\}$ 中两两不同构，也未述"无穷多个"这样的群：§7 只断言"足够大的 $j$ 都无作用"
   （`prop:completion-no-action`），但没有断言它们互不同构。
8. **未述** 任何数值实验、表、代码或随机生成的实例大小。
9. **未述** 有效上界：不存在任何 $n$ 或 $\|K\|$ 的显式函数式界（B1 已声明）。
10. **未述** 与 Wise / Agol 的 virtual fibering、special cubulation 路线的比较。
11. **未述** 作者写作历史、版本迭代、被拒/被引情况；`reasoning_traces/` **无 summary**（见本节开头）。
12. **未述** §6 的矛盾是否可在 CAT(−1) 或更弱的曲率假设下单独得到（论文的 CAT(−1) 推论只经"$\CAT(-1)$ 即 $\CAT(0)$"
    一步传递，见 `07-completion.tex:65`）。
13. **未述** 极限空间 $Z$ 是否为凸空间／是否有更强的正则性；只用了它 complete + CAT(0)（B10）。
14. **未述** 六字母表为何是"六个位置"而不是其他数目；`04-sampling.tex` 只给出 $Q_{rq}$ 的表格与 Chernoff 需求
    （需要 $N^4$ 对数与 $N^{-3-\delta}$ 概率相乘得 $N^{1-\delta}\to\infty$）。`[补]` 这一点可由指数不等式解释，
    但论文没写成"因为……所以取 6"。

---

# 四、Lean 取证

## 4.1 定位证据（按约束：先 yaml，再进目录，绝不宽 grep `lean/OAI/`）

- `E:\math\lean\formalization.yaml:97–100` 给出论文条目（标题 "A hyperbolic group with no geometric CAT(0) action"，
  日期 September 25, 2026）。
- 同文件 `:1230–1232` 给出映射三行：
  ```
  comparator_config: ComparatorChallenges/HyperbolicObstruction.json
  declaration: OAI.HyperbolicObstruction.main
  file: OAI/Geometry/HyperbolicGroups/Main.lean
  ```
  `[结论]` 形式化目录 = `E:\math\lean\OAI\Geometry\HyperbolicGroups\`（单数目录，所有取证只在此目录内做）。
- `E:\math\lean\ComparatorChallenges\HyperbolicObstruction.json`（344 B）：
  `permitted_axioms: [propext, Quot.sound, Classical.choice]`，`enable_nanoda: false`。
  `[注意]` 未启用外部 SMT/数值求解器；允许的公理就是 Lean 标准三件套。
- `E:\math\lean\ComparatorChallenges\HyperbolicObstruction.lean`（163 行）：**题目规格文件**，
  含 `FiniteComplex`/`DiskMove`/`DiskHomotopy`/`LinearDiskFilling`/`Aspherical`/`IsSegment`/`IsGeodesic`/
  `CATZero`/`CATNegOne`/`GeometricAction`/`NoGeometricCATZeroAction`/`WordHyperbolic`/
  `CompatibleLocallyCATNegOne`/`MainStatement` 的定义，`:154 theorem main : MainStatement.{u} := by sorry`。
  `[要点]` 规格文件里的 `main` 是 `sorry`；真实证明在 `OAI/.../Main.lean:15`，其终句
  `exact homotopy_incompatibleLocalCATNegOne x hno he.some`，且 `Main.lean` 只额外 import
  `OAI.Geometry.HyperbolicGroups.CompactLocalCATGeometric` 一个文件（`Main.lean:2`）。

## 4.2 目录规模（`find` + `grep -o | wc -l`，全部限定在该目录）

| 指标 | 数值 | 采集命令要点 |
|---|---|---|
| `.lean` 文件数 | **422** | `find . -name '*.lean' \| wc -l` |
| 总行数 | **57,027** | 同上 `xargs -0 cat \| wc -l` |
| `import` 行数 | 1,299 | 其中指向 Mathlib 的 422（每文件恰好一条）|
| 目录内 import 边 | **877** | 1,299 − 422 |
| 非 Mathlib / 非本目录的外部 import | **0** | 该目录自成闭环，除 Mathlib 无外部依赖 |
| `sorry` | **0** | — |
| `axiom`（关键字） | **0** | `grep -o 'axiom'` 得 5 处，全部在注释里（`GraphGroupWalk.lean:82`、`PairingForest.lean:128`、`Parity.lean:126`、`TangentCone.lean:63`、`WordPictureFilling.lean:18`），无一条公理声明 |
| `native_decide` | **0** | 有限验证不靠 unsafe |
| `decide` 出现 | 340 | 含 `by decide` 与 `of_decide_eq_true` 等 |
| `omega` 出现 | 423 | 线性整数算术是预算论证主力 |
| `fin_cases` 出现 | 76 | 有限情形枚举 |
| `interval_cases` 出现 | **0** | 未使用 |

## 4.3 模块清单（按依赖层次分组，含行数；行数实测 `wc -l`）

**A. 规格 / 基础层**
- `Basic.lean`（161）— `FiniteComplex.Carrier`、`DiskMove/DiskHomotopy/Disk`、`LinearDiskFilling`(`:75`)、
  `Aspherical`(`:79`)、`CATZero`(`:94`)、`CATNegOne`(`:100`)、`GeometricAction`(`:108–112`)、
  `NoGeometricCATZeroAction`(`:116–118`)、`WordLength/WordDistance`、`WordHyperbolic`(`:128`)、
  `CompatibleLocallyCATNegOne`(`:136`)、`MainStatement`(`:145–151`)。
  与规格文件逐字一致（是同一段代码的复用）。

**B. 模板层（论文 §2）**
- `Template.lean`（324）— `:24 card_edges = 32`（`decide`）、`:34 card_twoPaths = 90`（`decide`）、
  `:36 abbrev Field := Edge ⊕ (TwoPath × Fin 2)`、`:40 card_fields : Fintype.card Field = 212`、
  `:45 partition_per_edge`（松边单独计数）、`:113 coreExponent`、`:143 min W.card 2 ≤ looseCount W + ∑ fanCount…`。
- `IncidenceTemplate.lean`（117）— `:14 abbrev Row := Fin 7 ⊕ (Unit ⊕ TwoPath)`、`:18 card_rows = 98`、
  `:27 rowCost : Row → ℤ`、`:32 def pattern : SparsePattern.Pattern Field Row`、`:43 pattern_exponent`、
  `:56 rowSupport_card (3 ≤)`、`:63 admissible_card (≤3)`、`:70 admissible_subset`、
  `:81–99 theorem exists_critical_closure`（论文 `sample:eq-closure` 的精确对应）。

**C. 采样层（论文 §4）**
- `FiniteLaw.lean`（503）、`FiberLaw.lean`（100）、`GenericTable.lean`（225）、`GenericMoment.lean`（138）、
  `Moment.lean`（205）— 自建有限概率论与力矩/集中不等式基础设施。
- `Chernoff.lean`（133）— `:33 bernoulli_centered_exp_le (ht : |t| ≤ 1)`、`:50 centeredCount`、
  `:84 centeredCount_chernoff`（常数为 **4**，论文为 **/3**）。
- `TableSelection.lean`（105）— `:58 abbrev SymmetricAlphabet (n : ℕ) := Fin (n+1) × Bool`、
  `:60 card_symmetricAlphabet = 2*(n+1)`。
- `Test.lean`（125）— `:18 structure ConditionalTest {fields, leaf, newLeaf, admissible, k}`、
  `:27 closure`（`.choose`）、`:30 closure_spec`、`:36 closure_gap`、
  `:41 threshold := max (4 * Fintype.card (StarModel.Var …)) (t.k+1)`、`:44 rate`、`:47 rate_tendsto`、
  `:52/:57 embedding`、`:57/:62 error/error_nonneg`、`:66 expectedError`、`:76 Satisfies`、`:83 satisfies_of_error`。
- `StarModel.lean`（139）、`StarBudget.lean`（167，`:96 extension_margin`、`:114 leaf_margin`）、
  `StarMean.lean`（127）、`StarActual.lean`（114）、`StarVariance.lean`（142，`:108 extension_variance_bound`）、
  `StarCoupling.lean`、`CouplingError.lean`（78，`:16 ratio_error_bound {M Z D ε}`、`:31 coupling_of_error`）。
- `SixCounts.lean`（135）— `:18 abbrev PairPositions := {rq : Fin 6 × Fin 6 // rq.1 ≠ rq.2}`、
  `:21 card_pairPositions = 30`（**有序**对，论文取 15 个无序对）、`:40 probability δ := card A^(-3-δ)`、
  `:67 count_chernoff`、`:82 badPairs_bound`（除以 **4**）、`:105 badPairs_rate_tendsto (hδ : δ < 1)`。
- `SamplingStage.lean`— `:46 def samplingParameter (m : ℕ) : ℝ := 1 / (1000*(m+1:ℝ))`、
  `:52 (m+1:ℝ)*(98*samplingParameter m) ≤ 1/2`。
- `DiagonalSampling.lean`（69）— `:16 def stageError (m : ℕ) : ℝ := 1 / (m+4:ℝ)`、`:31 structure SamplingStage`、
  `:43 (k+1)*(8*φ+90*φ) ≤ 1/2`、`:50 7*φ ≤ 8*φ`。

**D. 图/填充层（论文 §3）**
- `Fragment.lean`— `:20 defectConstant := min (β-7*α) (min (α/5) δ)`（与论文 $\kappa$ 逐字对应）、
  `:49–53 tops/triangles/squares/hexagons/fanWeight`。
- `ActualFragment.lean`— `:22` 主不等式 `defectConstant * (T+Q+E+V) ≤ (Br+Bd)`，含**第四项面积 $V$**（论文只有 $T,Q,E$）。
- `WeightedRank.lean`、`Coincidence.lean`、`LiftedDiagramSampling.lean`、`DiagramSampling.lean`、
  `RankSampling.lean`(`:81/:84/:108/:112`)、`RankSelection.lean`（109）。
- 分离子（**没有 Lipton–Tarjan 常数的任何痕迹**，全目录 grep 无 "Lipton"/"Tarjan"/平面分离子定理引用）：
  `TreeCentroid.lean:21 weighted_tree_centroid`（注释明确写 "not a planar-separator assumption"）、
  `SeparatorBudget.lean:14 budget c K n := 16*c*n/√K - 8*c*√n`、
  `SeparatorCutoff.lean:14 exists_separator_cutoff (144*c^2 ≤ K ∧ d*(16*c/√K) ≤ eta)`、
  `AnnularSeparator.lean:19/:93`、`PicturePlanarSeparator.lean:23/:35`、`PictureRadiusSeparator.lean`。
- `IndexedFillingValue.lean`（**7,843** 单文件最大）— `:2741 abbrev finalSize`、`:5247 namespace SixTable`、
  `:5335 finalFiniteComplex`、`:5352 finalFinite_noAction`、`:5374 finalFinite_linear`、
  `:5439 finalFinite_aspherical`、`:6705–6710` 双曲性常数链（`let K := 3*(L:ℝ)^2*C`、
  `refine ⟨S,hS,3*(112*K)+2,by positivity,?_⟩`，其中 `L := 18`）、`:6721 finalFinite_hyperbolic`、
  `:6747 exists_finite_aspherical_hyperbolic_noAction`、`:6760+ namespace CurvatureComparison`。

**E. 能量 / 极限层（论文 §5）**
- `MetricProduct.lean`（526）— `:45 dist_sq`（`PiLp 2`）、`:53–94 segment/catZero`、
  `:116 factor := 1/√card`、`:127 Space := MetricScale.Space …`、`:222 MetricLimit.point`（经 `SeparationQuotient`）、
  `:425–431 six_letter_displacement_bound … ≤ 25 * R`（**5 的因子来自 5 条字母的乘积**，与论文 $25\frac{1+\varepsilon}{1-\varepsilon}$ 同构）。
- `OrbitLimit.lean`（200）— `:28 origin`、`:31 productCat`、`:35 boundedSection`、`:42 point`、`:43 catZero`、
  `:46 tendsto_dist_sq`、`:54 dist_sq_eq`、`:59 dist_sq_lower`、`:68/:89 segment`。
- `ConditionalStar.lean`（492）— `:73 SamplingSequence`、`:88–96 structure EnergyOrbit (L X : Type*) [Fintype L]
  [MetricSpace X] (M : ℝ)`（把"存在最小元/能量=1/位移有界"打包成**数据**）、
  `:213 exists_of_geometric` ⇒ `:222 ∃ r, ∃ hr : 0<r, ∃ O : EnergyOrbit L (MetricScale.Space r hr X) 8`
  （**M = 8 被钉死**）、`:300 word_lower`。
- `TangentCone.lean`（544）— `:22–24 vertex/log/scaleN`、`:51 radial_metric`、
  `:63–65 coneData`（注释："with no asserted CAT(0) axiom"）、`:74 dist_log_le`、`:79 log_lipschitz`、
  `:88 normSq_log`、`:92 pairing_log`。
- `CATZero.lean`（677）— `:67 mid`、`:87 quadrilateral`、`:106 ConeData`、`:218 add := 2·mid`。

**F. 刚体 / 矛盾层（论文 §6）**
- `CATZeroFurther.lean`（482）— `:28 square_mid`、`:44 cn_eq_of_log_dist`、`:57 fan_identity (c x y a b : X)`、
  `:86 exceptional_identity (c p q z k : X)`、`:168 structure MetricSquare`、`:176 MetricSquare.mid_eq`、
  `:182 fullLines := ![{0,1,2},{0,3,4},{1,3,5},{2,4}]`（A/B/C 满、D 缺 $CD$）、`:189–208 FiniteObstructionData`、
  `:212 no_finite_obstruction`。
- `MetricHexagon.lean`（510）— `:39–42 log_dist`、`:49 dist c (z k)^2 = 3/4`、`:77 central_mid`、
  `:96 vector`、`:100 Incident := ∑ vector i j * vector l j = 0`、`:105 pointOfRepresentative`、
  `:111 Vertex := Fin 11 ⊕ Fin 7`、`:114 Adjacent`（排除 $(10,4)$，即松边）、
  `:146–162 centerPair/Parent/Hex`（在 `Fin 44` 上）、`:165/:172/:177 fin_cases … decide`、
  `:238 structure MetricCore {side, twoStep, threeStep}`、`:302 radius_point`、`:312 radius_line`、`:409 impossible`。
- `Exceptional.lean`（159）— `:18 exceptionalRadius := 1/2`、`:35–37 excC=(2,4) excY=(9,4) excD=(3,4)`、
  `:105 exceptionalTest`、`:145 impossible_sequence : False`。

**G. 闭合层（论文 §7）**
- `CompactLocalCATGeometric.lean`、`GeometricAction.lean`、`DevelopmentGeometricAction.lean`（deck 作用的
  proper/cocompact 与 development 构造）、`FinitePolygonModel.lean`（`:94 simplex_card_le_three`）。
- `Main.lean`（35）— `:15 theorem main : MainStatement.{u}`（唯一顶层定理）。

`[未存在的文件]` 素材 §1.7 曾按名字引用过 `Fan.lean`、`Splitting.lean`、`Barycenter.lean`、`SixTable.lean`：
实测**四个都不存在**（`ls` 逐一确认；`SixTable` 只是 `IndexedFillingValue.lean:5247` 的一个 namespace，
分裂/BH II.2.14 的内容在 `CATZeroFurther.lean` 与切锥模块内完成）。终稿引用时必须改用真实文件:行号。

## 4.4 形式化陈述 vs 论文措辞差异表

| # | 项目 | 论文 | Lean 实际 | 影响 |
|---|---|---|---|---|
| D1 | geometric action 的 proper | "proper, cocompact action by isometries"（标准用法，未展开） | `Basic.lean:110` `proper : ∀ C : Set X, IsCompact C → {g \| ∃ x ∈ C, act g x ∈ C}.Finite`；`cocompact` 亦用 `IsCompact C`（`:112`） | 用 **IsCompact** 而非 Bornology/闭球表述；本目录 `grep -o 'Bornology'` 与 `'IsBounded'` **各 0 处** |
| D2 | 素材 §1.3 引的定义 | — | 素材写作 `structure GeometricAction (G : Type u) [Group G] (X : Type v)` + `C.Nonempty` + `Bornology.IsBounded C`（`:109–112`），并归给 `ComparatorChallenges/HyperbolicObstruction.lean` 约 62–68 行 | **不准确**：真实文件在 `:108–112` 且形如 D1。终稿须以 D1 为准订正 |
| D3 | 无作用的表述 | no geometric action on a proper complete $\CAT(0)$ space | `Basic.lean:116–118` `NoGeometricCATZeroAction := ∀ X, Nonempty X → ProperSpace X → CompleteSpace X → CATZero X → IsEmpty (GeometricAction G X)` | 用 `IsEmpty` 而非 `¬∃`；`ProperSpace` 显式出现在假设列 |
| D4 | CAT(0) 的定义 | 引用 BH 的几何定义 | `CATZero`（CN 不等式 + 常量速度 segment，`:94–98`） | 纯距离式；这正是 §6 只用距离、不用角度的原因（论文 B11） |
| D5 | CAT(−1) 的定义 | "$\CAT(-1)$ 即 $\CAT(0)$"，引 BH II.1.12(1) | `CATNegOne` = **cosh 中点**刻画（`:100–105`） | 于是必须自己证 cosh ⇒ CN：`IndexedFillingValue.lean:6760+ CurvatureComparison`（`sinh_cosh_bound`、`tanhOver_antitone`、`logCoshSqrt_concave`、`concave_balance`），注释写明这是 "The real comparison inequality needed to pass the manuscript's exact cosh-midpoint CAT(-1) definition to the Euclidean CN midpoint inequality." |
| D6 | 定理 1.1 (i) 的对象 | "combinatorial edge loop of length $\ell$ in the universal cover of $K$" | `LinearDiskFilling C`（`:75–77`）以 `p.length - 1` 计边数，`Disk` 允许 spur/collapse 记零面积 | 边数索引偏移 1；论文"area = noncollapsed 2-cells"与 `DiskMove` 的 0/1 代价一致 ✓ |
| D7 | 定理 1.1 的最后一句 | "Consequently, no such model admits a **compatible locally $\CAT(-1)$** geodesic length metric"（对 $K$ 的同伦模型断言） | `MainStatement:150–151` `∀ L, Nonempty (K.Carrier ≃ₕ L.Carrier) → ¬ CompatibleLocallyCATNegOne L` | 与论文一致（只 CAT(−1)），但 **Lean 没有对 locally CAT(0) 模型的同伦不变断言** —— 论文的该结论走"universal cover ⇒ geometric action"一步，在 `exists_finite_aspherical_hyperbolic_noAction` 处被注释承认「deliberately omits … the remaining Cartan-Hadamard/deck consequence」（`:6745–6746`） |
| D8 | 二维性 | 定理 1.1 明确 "two-dimensional aspherical simplicial complex $K$"；`07-completion.tex:61` "Since $P_j$ has dimension two, the same-dimension construction gives a two-dimensional $K$" | `MainStatement` **无维度子句**；`FinitePolygonModel.lean:94 simplex_card_le_three` 存在但未进入 `MainStatement` 的语句 | 形式化覆盖面 **小于** 论文陈述；不能声称"Lean 证了二维" |
| D9 | $\beta>7\alpha$ | 严格不等（`thm:diagram`、`04-sampling.tex:462`） | `StarVariance.lean:108 extension_variance_bound (ha : 0 ≤ α) (hb : 7*α ≤ β)`（**非严格**）；`DiagonalSampling.lean:50 7*φ ≤ 8*φ` | Lean 用非严格版本反而更强一点；$\beta=8\alpha$ 的取法两边一致 |
| D10 | $t_{\max}(\beta+90\delta)<1/2$ | 严格 | `SamplingStage.lean:52 (m+1)*(98*samplingParameter m) ≤ 1/2`；`DiagonalSampling.lean:43 (k+1)*(8*φ+90*φ) ≤ 1/2` | Lean 把 $98=8+90$ 显式拆成 `8*φ+90*φ`，等价但更机器友好 |
| D11 | 对角序列参数 | $\varepsilon_j<1/(400j)$，$\alpha_j=\delta_j=\varepsilon_j$，$\beta_j=8\varepsilon_j$ | `samplingParameter m = 1/(1000*(m+1))`、`stageError m = 1/(m+4)` | Lean 换了具体数值（1000 而非 400，$m+4$ 而非 $j$），只要求满足同一组不等式 ⇒ **400 与 $j$ 的选取不是数学内容** |
| D12 | 概率空间 | 字母表取 $S_n$（对称群），$N=\|S_n\|$ | `TableSelection.lean:58 SymmetricAlphabet n := Fin (n+1) × Bool`，$N=2(n+1)$；采样链中**没有** `Equiv.Perm`（`Perm` 只出现在 presentation/picture 模块如 `ActualContact.lean`、`BoundaryEnumeration.lean`、`BipartiteLink.lean`） | **重要**：采样/能量部分只需要一个"任意大的有限字母表 + 每坐标近均匀"，完全不需要群结构。Lean 把这一点显式化了 |
| D13 | 六字母位置对 | 15 个无序对 $1\le r<q\le6$ | `SixCounts.lean:21 card_pairPositions = 30`（有序 $rq.1 \ne rq.2$） | 并界规模翻倍；对应 Chernoff 常数从论文的 /3 变成 Lean 的 /4（`badPairs_bound`） |
| D14 | 位移界常数 | $25\frac{1+\varepsilon}{1-\varepsilon}$ | `MetricProduct.lean:431 … ≤ 25 * R`，其中 $R$ 是边际比例界 | 25 一致；$(1+\varepsilon)/(1-\varepsilon)$ 被吸收进 $R$（`hmarg` 假设形态） |
| D15 | 最小元/归一化 | 由 proper + cocompact 得能量最小元，再 $(1/N)\sum\|v_s\|^2=1$ | `EnergyOrbit` 把"有最小元、energy=1、bound M"作为**字段数据**传入（`ConditionalStar.lean:88–96`），`:222` 里 $M=8$ 被固定 | 论文里"存在最小元"是引理 5.1 的结论；Lean 把它做成结构，`exists_of_geometric` 负责从 `GeometricAction` 造出该结构 |
| D16 | 面积估计的项 | $\le 60C_0\ell$（三类面 $T,Q,E$） | `ActualFragment.lean:22 defectConstant*(T+Q+E+V) ≤ Br+Bd`（多一类 $V$） | 图式里第四类面在 Lean 中是显式的；论文 §3 用文字吸收掉了 |
| D17 | 分离子 | Lipton–Tarjan，$c=2\sqrt2$、$K\ge(924/\kappa)^2$ 一类 | 目录内**无**任何 Lipton–Tarjan 引用；自建 `TreeCentroid.lean:21`（注释 "not a planar-separator assumption"）＋ `SeparatorBudget/SeparatorCutoff/AnnularSeparator/PicturePlanarSeparator/PictureRadiusSeparator` | 形式化路线与论文不同：用树重心 + 环形分离子的自建机制替代平面图分离子定理 |
| D18 | $\kappa$ | $\kappa=\min\{\beta-7\alpha,\alpha/5,\delta\}$，$C_0=1/\kappa$ | `Fragment.lean:20 defectConstant := min (β-7*α) (min (α/5) δ)` | 逐字对应 ✓ |
| D19 | 双曲性常数 | 论文只说"线性 Dehn ⇒ word hyperbolic"，引 BH III.H.2.5(5)/2.7/2.9 | `IndexedFillingValue.lean:6705–6710`：`L := 18`、`K := 3*L^2*C`、四点后缀常数 `3*(112*K)+2` | Lean 把 BH 的隐含常数链**显式化**了（$112$、$3L^2$ 这些数字论文里没有） |
| D20 | 拓扑/覆盖一步 | Cartan–Hadamard II.4.1(2)、Hopf–Rinow I.3.7、局部等距 I.3.25 | `CompactLocalCATGeometric.lean` 等；但 `exists_finite_aspherical_hyperbolic_noAction` 的注释（D7）说明该步**未被形式化** | 见 D7 |

## 4.5 额外 / 缺失假设清单

**Lean 额外加的**（论文未显式列出）：
- `MainStatement` 里 `0 ≤ C`（`Basic.lean:147`）——论文 "$C<\infty$" 隐含非负但没写。
- `WordHyperbolic` 需要显式 `0 ≤ δ`（`:130`）与 `Subgroup.closure S = ⊤`（`:129`）。
- `ConditionalStar.lean:213 exists_of_geometric` 需要 `[Infinite G]`、`hgen : Subgroup.closure (range letter) = ⊤`、
  `inv : L ≃ L` 与 `hinv : letter (inv i) = (letter i)⁻¹`、以及**每点位移的边际假设**
  `hmarg : ∀ i j a, mass a ≤ 2 / Fintype.card L` —— 论文把它写成"$t_{\max}$ 固定、$N\to\infty$"的极限陈述。
- `StarVariance.lean:106 hsmall : (Fintype.card B : ℝ) * (β + 90*δ) ≤ 1/2` 是**带类型的具体数**，
  论文只在 `04-sampling.tex:460` 写成不等式。
- `SixCounts.lean:105 badPairs_rate_tendsto (hδ : δ < 1)` —— 论文隐含 $\delta<1$（因 $\varepsilon_N=N^{-(1-\delta)/4}$
  要正指数）但没写成显式假设。

**Lean 缺失的**（论文有而形式化没有）：
- 定理 1.1 (ii) ⇒ "任何同伦等价模型上没有 locally **CAT(0)** 度量" 这一步（D7/D20，注释自认 omitted）。
- 二维性子句（D8）。
- 论文对"metric models carry geodesic length metrics **inducing the given complex topology**"的强调，
  在 Lean 里由 `CompatibleLocallyCATNegOne:138` 的
  `m.toUniformSpace.toTopologicalSpace = (inferInstance : TopologicalSpace K.Carrier)` 表达 ✓（这一条**有**对应，
  但只对 CAT(−1) 版本，没有 CAT(0) 版本）。

## 4.6 战术痛点与自建机制（写终稿时能解释"为什么 Lean 版更长"）

1. **重复 `noncomputable section` 的注水**：`MetricHexagon.lean:10–34` 连续 25 行 `noncomputable section`
   （外加 `:2 open scoped Topology ContinuousMap`）。实测该文件 510 行里有 25 个 `noncomputable section`。
   `[推测]` 这是为了在每层 `let/instance` 之前重开非构造作用域，属于典型 Mathlib 摩擦点，而非数学内容。
2. **`end` 阶梯**：`MetricProduct.lean:489–526` 出现约 30 层连续 `end`，对应同样多的嵌套 namespace/section。
   该文件 526 行中真正的数学只有 `:45–130`、`:222`、`:425–431` 几处。
   `[推测]` 嵌套来自 PiLp 度量 + MetricScale + 各层极限的实例作用域互相遮蔽。
3. **有限验证全靠 `decide`/`omega`/`fin_cases`**：340 / 423 / 76 次。具体地
   `Template.lean:24/:34`（32 条边、90 条两点路径）、`IncidenceTemplate.lean:18`（98 行）、
   `SixCounts.lean:21`（30 对）、`MetricHexagon.lean:165/:172/:177`（`Fin 44` 上的中心对/父/六边形枚举）。
   `[结论]` 论文里"由定义直接算得"的四组计数，在 Lean 里都是一次性机器可判定命题——
   终稿可以据此说"模板计数是无争议的有限验证"。
4. **自建概率基础设施**：`FiniteLaw.lean`(503) + `Chernoff.lean`(133) + `Moment.lean`(205) +
   `GenericMoment.lean`(138) + `FiberLaw.lean`(100)。Mathlib 的 `MeasureTheory` 在有限类型上过重，
   这里用 `FiniteLaw` + `mass` 直接写。`:33 bernoulli_centered_exp_le (ht : |t| ≤ 1)` 的 $|t|\le1$ 截断
   是论文 Chernoff 步骤中"取 $t=\varepsilon_N$"能落地的形式条件。
5. **自建超极限**：`MetricLimit.point` 经 `SeparationQuotient`（`MetricProduct.lean:222`），
   `OrbitLimit.lean:46 tendsto_dist_sq`/`:54 dist_sq_eq`/`:59 dist_sq_lower` 把"距离的超极限等式"做成引理。
   `[对应]` 论文 B11（"不假设角度与超极限交换"）在 Lean 里被彻底贯彻：全程只有 `dist` 与 `dist^2` 的等式/不等式，
   没有任何 `angle` 出现。
6. **曲率比较自证**：`CurvatureComparison` 命名空间（D5）——把 BH II.1.12(1) 的重活自己做了四步
   （`sinh_cosh_bound` → `tanhOver_antitone` → `logCoshSqrt_concave` → `concave_balance`）。
7. **分离子自证**（D17）：`weighted_tree_centroid` + `budget c K n := 16*c*n/√K - 8*c*√n` +
   `exists_separator_cutoff (144*c^2 ≤ K ∧ d*(16*c/√K) ≤ eta)`。
   `[对比]` 论文用 Lipton–Tarjan 得到 $K\ge(924/\kappa)^2$；Lean 用 $144c^2\le K$ 与 $16c/\sqrt K$ 的自建预算，
   两边常数不可直接比较，终稿不应把二者混写。
8. **0 sorry / 0 axiom / 0 native_decide / 0 interval_cases**：证明完全靠 `decide`+`omega`+`nlinarith`+
   `positivity`+`fin_cases` 组合，无 unsafe 后门；这是"该构造可形式化"的最强证据。
9. **`Main.lean` 极短（35 行）**：整个 57k 行开发收束为一条 `theorem main`，中间只借
   `IncidenceTemplate.exists_finite_aspherical_hyperbolic_noAction` 与 `homotopy_incompatibleLocalCATNegOne`。
   `[注意]` 后者的输入是 `hno : NoGeometricCATZeroAction`（已由构造得到），所以 CAT(−1) 排除步是**纯逻辑推论**
   （若模型存在则得几何作用），与论文 `07-completion.tex:63–65` 的中文思路一致，但如 D7 所注，
   论文那一步的 Cartan–Hadamard/deck 部分在 Lean 里是"被绕开"而非"被证明"。

---

# 五、常数与参数账目表

## 5.1 账目表

| 符号 | 值 / 定义 | 来源（tex 或 Lean） | 在链条中的作用 | 敏感度 |
|---|---|---|---|---|
| $\alpha$ | 小正参，fan 指数余量 | `03-diagrams.tex:18–19`（$f=2-\alpha$）；`04-sampling.tex:462` | 控制 fan 的期望出现数 $N^{2-\alpha}$ vs 几何值 $2$ | 只需 $\alpha>0$ 且 $7\alpha<\beta$；**取多小都行**，不敏感 |
| $\beta$ | $=8\alpha$（规定取法） | `04-sampling.tex:463`；`07-completion.tex:18`（$\beta_j=8\varepsilon_j$） | top 指数余量；同时决定 $\beta-7\alpha=\alpha$ | **8 非最优**：任何 $c\in(7,1/(t_{\max}\alpha+90\delta/\alpha)\dots)$ 范围内的 $c$ 都行，8 只是让 $\beta=8\alpha\Rightarrow\beta-7\alpha=\alpha$ 最简 |
| $\delta$ | 小正参，长装饰余量 | `03-diagrams.tex:21`（$h-\delta$）；`04-sampling.tex:463` | 六字母/$2h$ 装饰的指数余量 | 同上，不敏感 |
| $\kappa$ | $\min\{\beta-7\alpha,\ \alpha/5,\ \delta\}$ | `03-diagrams.tex`（rank/coincidence 段）；`Fragment.lean:20` | 单位面积的**最小**边界收益 | $1/5$ 与 $7$ 都来自局部入射计数的粗化上界；论文未证任何最优性 |
| $C_0$ | $=1/\kappa$ | `03-diagrams.tex`（separator 段） | 分离子预算与面积界的比例因子 | 与 $\kappa$ 反比，$\alpha\to0$ 时爆炸 |
| $D$ | $=15$ | `03-diagrams.tex` | 每顶点可承载的最大 face 数（局部入射常数） | 由模板 $\deg\le7$ 与 fan 结构决定；**是模板属性，可精确验证** |
| 面积界 | $\le 60C_0\ell$ | `03-diagrams.tex`（thm:diagram 证明尾） | 线性 disk 填充常数 $C$ | $60=4\cdot15$（分离子递归 × 每块最大面数）`[补]`；论文未追常数 |
| $c$（分离子常数） | $2\sqrt2$（平面分离子） | `03-diagrams.tex` | 递归切分的规模控制 | Lean 完全不用此数（见 D17），故非本质 |
| $K$（分离子阈值） | $\ge(924/\kappa)^2$ | `03-diagrams.tex` | 保证递归终止 | $924$ 是粗界拼装；Lean 对应 $144c^2\le K$ |
| $\|\mathcal F\|$ | $212=32+2\cdot90$ | `02-model.tex`；`Template.lean:40` | 主模式的 field 总数，一切指数的基数 | **精确、机器可判**（`decide`） |
| $\|\mathcal R\|$ | $98=7+1+90$ | `02-model.tex`；`IncidenceTemplate.lean:18` | row 总数（7 fan + 1 top-mark + 90 四字母） | 精确 |
| $\sum_i k_i$ | $31$，$\sum_i(k_i-2)=17$ | `02-model.tex`（$k_i=\|E(F_i)\|$，$\sum k_i=31$） | 核心指数 $32-17-12=3$ | 精确 |
| $h(\mathcal F)$ | $212-(17+12+180)=3$ | `04-sampling.tex`（`sample:eq-h`） | 主匹配集的期望数量级 $N^3$ | 精确；$17$ fan、$12$ top、$180$ 四字母的分配由模板唯一决定 |
| $E\|\Omega\|$ | $N^{3-\beta-90\delta}$ | `04-sampling.tex`（`sample:eq-master-mean`） | 主匹配非空（指数 $>0$） | $\alpha$ **完全消掉**：$17+7\alpha$ 与 $12+\beta-7\alpha$ 相加即 $29+\beta$ |
| $t_{\max}(\beta+90\delta)$ | $<1/2$ | `04-sampling.tex:460`；`SamplingStage.lean:52`；`DiagonalSampling.lean:43` | 每个 overlap margin 至少 $1/2$ | 关键约束；Lean 用 $98$ 显式（$8+90$）|
| $3-\beta_j-90\delta_j$ | $>0$ | `07-completion.tex:20` | 对角序列主计数仍正 | $\varepsilon_j<1/400$ 保证 |
| 位置对数 | 15（无序）/ 30（Lean 有序） | `04-sampling.tex:470`；`SixCounts.lean:21` | 六字母表的并界规模 | 差 2 倍，被 Chernoff 常数吸收 |
| union-bound 规模 | $15N^2$ | `04-sampling.tex`（Chernoff 段） | 全部 $(r,q)$ 与所有 $N^2$ 偏移同时好 | 精确 |
| $\varepsilon_N$ | $N^{-(1-\delta)/4}$ | `04-sampling.tex` | 相对误差阈值 | 需 $1-\delta>0$ ⇒ Lean 显式 `hδ : δ < 1` |
| Chernoff 指数 | $/3$（论文）vs $4$（Lean） | `04-sampling.tex`；`Chernoff.lean:84` | 尾概率 $e^{-\varepsilon_N^2\mu/3}$ | 常数无关本质 |
| $E[\text{six-pair}]$ | $N^{1-\delta}$ | `04-sampling.tex` | 相对计数趋于无穷 ⇒ 每对均匀 | 需 $\delta<1$ |
| $M$ | 一致位移界（论文存在性）/ **8**（Lean） | `05-energy.tex`（lem:conditional-test 前后）；`ConditionalStar.lean:222` | 让 $B\sqrt{1/t+2M^2\eta}+2BM\eta\to0$ | Lean 取 8 是任一可行常数 |
| $25\frac{1+\varepsilon}{1-\varepsilon}$ | 位移逐点上界 | `05-energy.tex`；`MetricProduct.lean:431`（$25R$） | 把"有界测试"变成合法对象 | $25=5\times5$（5 字母 × CS） |
| $r$ | $\sqrt3/2$（六边形中心半径） | `05-energy.tex`（hexagon 段）；`MetricHexagon.lean:49`（$=3/4$ 平方） | 余弦和论证的输入 | 由边长和 $=6$、$|3-s|$ 检查唯一确定 |
| $-1/4$ | $\langle h_H,h_{H'}\rangle$（相邻 fan 线） | `06-obstruction.tex`；`CATZeroFurther.lean:57` | `geom:nonnegative`：$3/4-1/4-1/4-1/4=0$ | 精确 |
| $1/2,\ 1/4,\ -1/2$ | 线积、$x_D$ 相关积 | `06-obstruction.tex` | 例外恒等式的输入 | 精确 |
| $a,b$ | $a=\arccos(1/\sqrt3)$，$b=\arccos(1/3)$，$2a+b=\pi$ | `06-obstruction.tex:336–348` | 局部测地线长 $\pi$ ⇒ 对径 | 精确（$\cos(2a+b)=-1$ 可验） |
| $d(H_0,B_0)^2$ | $1/3$；$d(c,B_0)^2=1/12$；参数 $1/3$ | `06-obstruction.tex`（exceptional 段） | 例外恒等式 $h_0=M_C\oplus x_D$ | 精确；Lean `Exceptional.lean:18 exceptionalRadius = 1/2` |
| $\epsilon_j$ | $<1/(400j)$；$98j\epsilon_j<98/400<1/2$ | `07-completion.tex:15,22` | 对角序列一次满足所有有限测试 | $400$ 可换成任何足够大的数（Lean 用 $1000$，见 D11）|
| $L,M,D$（转移引理） | 代入长度 / 旧词代入后的面积 / $b\psi(\phi(b))^{-1}$ 面积 | `07-completion.tex:53` | 呈现常数无关性的证明 | 新常数 $MC_{\rm old}L+D$ |
| 双曲性常数 | $L=18$，$K=3L^2C$，四点常数 $3(112K)+2$ | `IndexedFillingValue.lean:6705–6710` | 把 BH III.H.2.9 的隐含链显式化 | 论文完全没给这些数 |
| $N$ | $=\|S_n\|$（论文）/ $2(n+1)$（Lean） | `02-model.tex`；`TableSelection.lean:60` | 趋于无穷的唯一参数 | 只需 $N\to\infty$；群结构无关（D12） |

## 5.2 论文从未证明的"最优性"主张（终稿禁止写入）

1. **未证** $\kappa$ 的选取最优、也未证 $1/5$ 不可改进。`[推测]` $1/5$ 来自把 fan 内多次使用同一 relation 的
   最坏情况粗化，真实常数可能更接近 $1/3$；证据仅为 §3 局部入射引理的证明结构。
2. **未证** $\beta>7\alpha$ 中 $7$ 的最优性。`[机械理由]` $7=\#\{\text{fans}\}$，是"一个 fan 最多被多少 copy 共享"的
   粗上界；若共享数真界是 $7$（Fano 平面上每条线过两个点，每个点在 3 条线上），则该 $7$ 是模板决定的硬数字，
   但论文没有讨论 $\beta=7\alpha$ 临界。
3. **未证** $D=15$、$60C_0\ell$ 的常数最优。论文原话只要求"存在 $C<\infty$"。
4. **未证** 六字母（而非五或七字母）必要。`[推测]` 需要 $N^{4}$ 对数 $\times N^{-3-\delta}$ 给 $N^{1-\delta}\to\infty$；
   五字母只给 $N^{3}\cdot N^{-3-\delta}=N^{-\delta}\to0$，不够；七字母多余。证据：`04-sampling.tex` 的 $Q_{rq}$ 计数结构，
   但论文明确没写这段"为什么是 6"。
5. **未证** $25$ 或 $25\frac{1+\varepsilon}{1-\varepsilon}$ 不可改进；$M$（Lean 中 $=8$）无任何最优性声明。
6. **未证** 极限构型的唯一性；`prop:configuration` 只证存在，`prop:no-configuration` 只证不可能。
7. **未证** $G_j$ 无挠、$\mathrm{gd}(G_j)=2$、不可 cubulate、非虚特殊。这些都**不在正文**（§3.5 第 5–6 条）。
8. **未证** $K$ 的大小有效（B1 明确豁免）。
9. **未证** 对角序列中不同 $j$ 给出不同构群（§3.5 第 7 条）。
10. **未证** BH 引用常数的实际数值化；Lean 反而给了（$112$、$3L^2$），这提示终稿若要具体常数应引 Lean 而非论文。

## 5.3 对终稿最有价值的三点提示（`[推测]`，来源为 Lean 与 tex 的交叉证据）

1. **采样链不需要群**：`SymmetricAlphabet = Fin (n+1) × Bool`（D12）说明整套 §4 只依赖"任意大有限字母表 +
   每坐标近均匀 + 独立"。终稿把 $S_n$ 换成"任意大小 $\ge n$ 的字母表"不会损失任何东西，反而让与 Lean 对齐更容易。
2. **$\alpha$ 消掉是结构性的**：$E|\Omega|=N^{3-\beta-90\delta}$ 中 $17+7\alpha$ 与 $12+\beta-7\alpha$ 相加抵消
   （§5.1 第 15 行），说明 $\alpha$ 只服务于**局部入射余量**（进入 $\kappa$），不影响主匹配的存在性。
   这一点论文没有明说，但由两个公式直接读出；终稿写"三个参数的分工"时这是最清楚的一条线。
3. **Lean 覆盖面 < 论文陈述**：`MainStatement` 缺维度子句（D8）、缺"同伦模型上无 locally CAT(0)"（D7，注释自认），
   且 `ComparatorChallenges/HyperbolicObstruction.lean:154` 的 `main` 仍是 `sorry`。
   终稿凡说"已形式化"必须精确到"论文定理 1.1 的哪些子句在 `OAI.HyperbolicObstruction.main` 的
   `MainStatement` 里"，不能笼统说"整篇已形式化"。

<!-- 完 -->

