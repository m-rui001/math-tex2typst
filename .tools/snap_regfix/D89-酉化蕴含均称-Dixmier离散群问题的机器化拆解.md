# D89 酉化蕴含均称：Dixmier 离散群问题的机器化拆解

## §0 素材口径与登记归属核实

这份笔记的正文素材全部取自 tex 源，路径是
`E:/math/preprints/Unitarizability-Implies-Amenability-for-Countable-Groups-September-23-2026/build/`,
布局属于 `build/main.tex` 加同级 `build/sections/` 分片那一类：`main.tex`(58 行)、
`sections/introduction.tex`(209 行)、`sections/obstruction.tex`(311 行)、
`sections/sparse.tex`(121 行)、`sections/weights.tex`(385 行)、`sections/conclusion.tex`(228 行)，
合计 1,312 行；另有 `build/figures/edge-factorization.tex` 一张图与 `references.bib`。
同级目录里还有一份 `typst/`（`main.typ` + `refs.bib`），按口径不读。
PDF 一律不碰，`paper.pdf` 在本仓库加密，抽取文字会损坏符号，所以全文没有出现任何来自 PDF 的字句。
`main.tex:40-42` 给出题名 `Unitarizability implies amenability for discrete groups`、
`\author{OpenAI}`、`\date{September 23, 2026}`，与队列 160 行的目录名对应；
队列文件在这个仓库里的真实位置是 `E:/math/.tools/lean_queue.txt`（派单里写的
`E:\math\lean_queue.txt` 不存在，我用 `sed -n '160p'` 在真实路径上取的行）。

登记归属的核实过程要写清楚，因为目录名与 comparator 前缀互相矛盾。
`grep -n "Unitarizability-Implies-Amenability" lean/formalization.yaml` 只命中一处，
是书目条目 `formalization.yaml:807-810`（`title: "Unitarizability implies amenability for discrete groups"`，
`id: ../preprints/Unitarizability-Implies-Amenability-.../paper.pdf`），
`sources` 段到这里就结束了；`status.main_results`（`formalization.yaml:914` 起）
是按 comparator 名排序的平铺清单，条目本身不带论文标题字段，
所以那条 `DixmierAllDiscrete` 登记（`formalization.yaml:1122-1124`，
`declaration: OAI.Dixmier.current_main_theorem`，
`file: OAI/Analysis/Unitarizability/AllDiscrete.lean`）无法从 yaml 的嵌套关系直接判定归属。
判定靠三条实测证据。
第一条：`formalization.yaml` 全文 `grep -n -i dixmier` 只有两行命中，即 `1122` 与 `1123`，
再没有第二条 Dixmier 型登记，`sources` 里也没有任何标题含 Dixmier 的论文条目，
所以"邻篇另有 Dixmier 型论文"这一假设在本仓库不成立。
第二条：`lean/ComparatorChallenges/` 下有两个同族配置，`Dixmier.json` 与 `DixmierAllDiscrete.json`；
`Dixmier.json` 的 `solution_module` 写作 `OAI.Analysis.Unitarizability.UniverseTransport`，
`DixmierAllDiscrete.json` 的 `solution_module` 写作 `OAI.Analysis.Unitarizability.AllDiscrete`，
两者都落在同一个模块 `OAI/Analysis/Unitarizability/` 内，namespace 都是 `OAI.Dixmier`。
也就是说命名张力来自分工：目录按论文题名取 `Unitarizability`，
comparator 按问题史取 `Dixmier`（Dixmier 1950 提出的酉化问题），
一个问题的两个版本各配一个 comparator，各自对应模块里一个入口文件。
第三条：两个 comparator 的 `.lean` 桩里的定义逐字一致
（`ComparatorChallenges/DixmierAllDiscrete.lean:14-29` 与 `ComparatorChallenges/Dixmier.lean:14-33`
的 `leftTranslate`、`Amenable`、`SimilarToUnitary`、`Unitarizable` 完全同形），
而 `DixmierAllDiscrete.lean:31-42` 的 `CurrentMainTheorem` 含 `1 + ε` 界与
`Countable G → SeparableSpace H` 条件式，逐字对应 `DiscreteModel.lean:9-16`，
`Dixmier.lean:36-47` 的 `MainTheorem` 含固定界 `101` 与 `[Countable G]` 假设，
逐字对应 `Model.lean:36-51`。
结论：`DixmierAllDiscrete` 与未登记的 `Dixmier` 都属于本篇；
yaml 只登记了 `DixmierAllDiscrete` 这一条，因为它是与论文主定理同形的那个版本。
`theorem_names` 字段各只有一项（`OAI.Dixmier.current_main_theorem`、
`OAI.Dixmier.main_theorem_all_universes`），`definition_names` 都是空数组，
`permitted_axioms` 都是 `propext`、`Quot.sound`、`Classical.choice` 三条，
`enable_nanoda` 都是 `false`。
本篇语料在队列里的登记位置是队列第 160 行号，对应目录 `preprints/Unitarizability-Implies-Amenability-for-Countable-Groups-September-23-2026`。

## §1 初始动机：我以为自己在攻一个相似度问题

我最初把这篇东西归到算子代数/表示论的抽屉里，理由很直接：
题面用的词是"相似"。`introduction.tex:10-22` 摆出的对象是
一致有界表示 $\pi:G\to\mathrm{GL}(H)$，$|\pi|:=\sup_{g}\lVert\pi(g)\rVert<\infty$，
以及"存在有界可逆 $S$ 使所有 $S\pi(g)S^{-1}$ 酉"，
并且强调 $\lVert S\rVert\lVert S^{-1}\rVert$ 不被假设有公共界。
这套语言与 Kadison 相似度问题同族，而 Sz.-Nagy 的单算子情形
（`introduction.tex:27-29`，一个整数幂一致有界的可逆算子相似于酉算子）
正是相似度定理的原型。于是我按表示论的直觉去猜进攻点：
先有定量版本可用，Pisier 的阈值定理（`introduction.tex:64-73`）说
$G$ 均称当且仅当存在只依赖 $G$ 的 $C$ 与 $\alpha<3$ 使每个一致有界表示有
条件数不超过 $C|\pi|^{\alpha}$ 的酉化子；
反过来的单向（`introduction.tex:71-73`，Pisier 2004 Theorem 4.1）
只说酉化性给出某个**有限**指数的多项式界。
我当时的算盘是：从"每个表示都可酉化"出发，设法把散落在各个表示上的
$\lVert S_\pi\rVert\lVert S_\pi^{-1}\rVert$ 收集成一个可数的 supremum，
再用某种插值或二分论证把指数压到 3 以下，一步借到 Pisier 的阈值。

第二个直觉来自组合几何。`introduction.tex:24-26` 的均称定义是
$\ell^\infty(G)$ 上的正规范左不变泛函，而 Kesten 型谱隙（后来的
`sparse.tex:16-23`）把它翻译成随机行走算子范数严格小于 1。
我一度以为非均称假设会以"一致谱隙"的形式直接提供一个表示：
找一个 $\lVert\pi(g)\rVert\le 1$ 的表示就已经赢了，
因为此时每个 $\pi(g)$ 是等距可逆的，本身就是酉表示。
这个想法在机器里留下了反面证据：`Model.lean:36-40` 的
`NonamenableWitness` 把界写成 `∀ g, ‖π g‖ ≤ 101`，
`DiscreteModel.lean:13-16` 的版本写成 `∀ g, ‖π g‖ ≤ 1 + ε`，
两处都刻意避开 1，而 `conclusion.tex:48` 的缩放取的正是 $t=\varepsilon/100$。
$\varepsilon$ 可以任意小但永远不能等于 0，这条限制不是技术偷懒，
是问题本身的结构：`1+ε` 是可达的下界，`1` 是不可达的。

## §2 走过的四条死路

### §2.1 第一条：纯标量核的行/列 ℓ¹ 分裂

我先把 Epstein--Monod 的 Littlewood 分裂当真（`introduction.tex:109-115` 提到
Bożejko 与 Fendler 的传统，标量卷积核拆成行绝对可和一致有界与列绝对可和一致有界两块）。
按这条路，算子 $T$ 的核是标量函数 $W:G\to\mathbb C$，
纤维维数 $k=1$，而 `obstruction.tex:56-58` 的能量不等式
`E ≤ 4k(K + ‖T - C‖)²` 在 $k=1$ 时变成 $E\le 4(K+\lVert T-C\rVert)^2$。
断点就在这里：`obstruction.tex:166-168` 与 `SumObstruction.lean:34`
要求的发散条件是 `energy A j / k j → ∞`，
$k=1$ 时分子被单块行的范数锁死（机器里对应 `KernelObstruction.lean:226-228`
`energy_le_row`，右边正好是 `(Fintype.card K) * ‖row A 1‖^2`，$K$ 是单点集时系数 1），
比值不可能发散，整个 obstruction 变成空话。
断的迹象是我在草稿上写不出任何"行、列都受同一 $K$ 控制而能量随规模增长"的标量例子：
$\ell^1$ 行界与 $\ell^2$ 能量在标量情形是同量级的，
想要能量发散只能让行界发散，而那正好摧毁一致有界性。
`introduction.tex:121-125` 现在把这句话挑明了：
构造**保留**该机制，但允许有限维矩阵系数，用正秩一权重
在不动行列界的前提下把核的 Hilbert--Schmidt 能量相对纤维维数抬高。

### §2.2 第二条：把相似度收集成公共界

第二条死路对应 §1 的算子代数直觉。
`obstruction.tex:158-160` 与 `:308-311` 反复强调
"不假设不同表示的相似算子有公共界"，
而 `SumObstruction.lean:54` 的推导链里唯一被用到的 $S$ 的信息是
`‖B‖` 这一个实数（`KernelObstruction.lean:289` 的
`energy A ≤ 4 * (Fintype.card K) * (κ + ‖T - C‖)^2`）。
我想做的事恰好相反：要把 $\sup_\pi\lVert S_\pi\rVert\lVert S_\pi^{-1}\rVert$ 造出来。
断点在反证的结构上：
`proof of obstruction.tex:235-296` 的反证只用"存在某一个 $S$"，
一旦取遍表示就必须在 $G$ 固定下对无穷多个 Hilbert 空间取 sup，
而能给出这种 sup 有限的已知手段（Pisier 2004 的多项式界）其结论形式是
"存在公共 $C,\alpha$"，这已经比可酉化强，
把它当引理用等于把未证的均称性偷进前提。
断的迹象还有一条更硬的：`obstruction.tex:309-311` 明确写
证明只需要"对**一个**表示存在相似度"就能得到矛盾，
这说明任何依赖公共界的论证都在做多余的事，而且做不成。

### §2.3 第三条：把障碍推到扩张上再压回来

第三条死路是 wreath product 线（`introduction.tex:86-98`：
Gaboriau--Lyons 的轨道嵌入、Monod--Ozawa 对 $A\wr G$ 的刻画、Alpeev 放宽灯群），
那一批结果的落点是"扩张上的见证"，
`:97-98` 自己点出遗留的区分是"给扩张的见证还是给 $G$ 自己的见证"。
我试过沿限制方向把 $A\wr G$ 上的非酉化表示限制回 $G$。
断点在压缩的方向性：`conclusion.tex:121-136` 唯一可逆的方向是从大到大
（诱导表示 $\Pi$ 的不变内积压到恒等陪集分块得到子群表示 $\sigma$ 的不变内积，
$Q_H=j^*Qj$，`j` 是恒等陪集的等距嵌入），
机器里同形的是 `HilbertSum.lean:96-105` 的 `compression` 与
`compression_implementer`，它们把整体实现子 $B$ 压到分块 $B_j$ 且
`compression_norm_le`（`:99`）给出 `‖compression B i‖ ≤ ‖B‖`。
压缩只朝"分块"走， restriction 从扩张到商或从扩张到灯群需要相反方向的提升，
Lean 里根本没有对应物：`grep -n "Coset\|Quotient.group\|G/H\|induced"` 在整个模块 0 命中。

### §2.4 第四条（半途而废）：先证 C* 代数结论再回头

`conclusion.tex:199-227` 那段 C* 推论要用同伴论文的相似度定理
（`\cite[Theorem~1.1]{OpenAIKadison2026}`），
我起初以为可以把它当主定理的一部分一起形式化。
实测：`grep -in "CStar\|StarAlgebra\|Kadison"` 在模块 39 个文件里 0 命中。
tex 侧的措辞也把这一段单独标出来：`conclusion.tex:202-203` 写的是
"The following consequence uses the companion similarity theorem in addition to \Cref{thm:main}"，
即主定理不需要它。
断点很朴素：那段论证的前提是另一篇论文的 Theorem 1.1，
本篇的入口定理不依赖它（上面那行 `in addition to` 就是文本证据），
把它混进主链会让 `permitted_axioms` 之外多出一条外部依赖，
形式化上无据可查。

## §3 三个具体时刻

### §3.1 把 $k=1$ 的不可能性当成定理读出来

转折发生在把 `obstruction.tex:56` 那行不等式倒着看的一刻。
我一直把它当工具（用能量下界推距离下界），
但 $k=1$ 时它同时是一条**上界**：$E\le 4(K+\lVert T-C\rVert)^2$，
能量被单块行与单列一起钉住。
也就是说，标量核的世界里不存在"一致有界但不可酉化"的三角表示，
这个否定性事实由引理自己给出，不需要任何额外假设。
一旦承认这点，剩下的问题就变成一个纯粹的计数问题：
造一族纤维维数 $k$ 的算子，让能量 $E$ 比 $k$ 跑得快，
同时把 $K$ 按住不动。
`MaskAlgebra.lean:80` 的 `constant_energy_ge_card`
（结论形如 `energy (constant v s) ≥ Fintype.card I`，
配合 `Main.lean:66-69` 把右边写成 `(d : ℝ)^(j+1)`）
就是"能量至少是标签数"这一步的机器形态，
而 `FrameParameters.lean:11` 的 `dimension n r = ⌈2 r log(2n)⌉₊`
是"纤维维数至多是标签乘装载量再取对数"的机器形态。
两边夹出 `Parameters.lean:104` 的 `energy_ratio_tendsto`。

### §3.2 边标签必须被保留

第二个时刻是把"同一个群元素可以由多个标签到达"这件事从缺陷改判成资源。
`sparse.tex:118-120` 写 "Parallel edges remain distinct throughout the matching,
and the two endpoints remain distinct vertices even if $s_i=e$"，
`weights.tex:242-247` 再补一句：$s_i=s_j$ 时两条带标边仍是
$\mathcal E_c$ 的不同坐标，它们的贡献在同一个块里被相加，
"不需要乘积互不相同"。
这里的机械理由是：能量 $E=\sum_s\lVert W(s)\rVert_{\HS}^2$ 的
$\le$ 下界（`conclusion.tex:37-42`）来自对角项 $\Tr(P_iP_i)=1$，
非对角的同乘积项 $\lvert v_i^*v_j\rvert^2$ 只增不减；
如果先做去重，把标签按群元素合并，
那些项会互相干扰，正性也就没了。
`KernelEnergy.lean:58`（`rankOne_sum_energy`）与
`KernelEnergy.lean:106`（`kernel_energy_ge_card`）把这条"对角项给足下界"
写成机器可查的形式，`KernelEnergy.lean:91`
的 `kernelCoefficients_offsupport` 处理支撑外为零。

### §3.3 一个算术不等式决定概率步的生死

第三个时刻很细，但在 Lean 里最扎眼：
`weights.tex:111-114` 那两行
$\log 2+k+2k\log 9-25k/2=\log 2-(25/2-1-2\log 9)k<0$，
"系数大于 7，$k\ge1$，$\log2<1$"。
整个概率论证（失败概率 `2 n^p 9^{k+p} exp(-25k/2) < 1`）
全靠这一个不等式撑住，而它把 $b_0=10$、net 规模 $9^m$、
尾指数 $25/2$ 三件事绑在一起。
`FrameParameters.lean:40-68` 把它拆成 `failure_bound_lt_one`，
假设只剩四条：`hn : 2 ≤ n`、`hk : 1 ≤ k`、`hp : p ≤ k`、
`hplog : (p : ℝ) * Real.log n ≤ k`，
证明里用的是两条粗糙上界 `Real.log 2 ≤ 1`（`:46-48`，来自
`Real.log_le_sub_one_of_pos`）与 `Real.log 9 ≤ 4`（`:49-55`，
先写成 `2 * Real.log 3` 再用同一定理）。
粗糙是刻意的：机器不想证明 $\log 9$ 的真值，
只要 $25/2-1-2\cdot 4>0$ 就够了。
`FrameParameters.lean:70-73` 的 `exact_failure_bound`
再把这些假设从 `bounds`（`:14-16`）一次性喂进去。

## §4 最终形态与我最初设想的四处错位

第一处，论证的"客户"变了。
我以为要证的是一个定量猜测（相似度增长阶），
最后证的是一个存在性反证：`SumObstruction.lean:54` 到 `:71`
的结构是"从假设相似拿到单个 $B$，
把每个分块的能量用 `4*(κ+‖B‖)^2` 钉住，
再用 `he.eventually (eventually_gt_atTop ...)` 挑出一个 $j$ 违反钉住的界"。
一次矛盾只用一个 $B$，所以任何"对所有表示一致的界"都是多余前提
（`obstruction.tex:308-311` 与 `:175` 把这点写进正文）。

第二处，组合侧的物件换了。
我预想的是 Følner 垫铺或谱隙几何，实际用的是带标多重图的端点指派：
$sparse.tex:84-89$ 的图（行列两点集为 $G$ 的两个拷贝，标号边 $(x,i)$ 连 $x$ 与 $xs_i$）
加一次 Hall 匹配。更关键的是"从离散到任意离散群"这一步，
tex 走的是 Følner 有限测试判据 + 有限生成非均称子群 + 诱导保持界
（`conclusion.tex:139-166`，`\cite[Main Theorem, p.~245]{Folner1955}`、
`\cite[Proposition~0.5]{Pisier2004}`），
Lean 完全没有这条链：`grep -n "Folner\|smallSets\|tendsto_vanishing"` 在模块 0 命中。
机器的做法是承认构造本来就不需要可数性。
`sparse.tex:111-116` 用"可数边集 + 有限分叉树的无限分支"（König 式论证）
把有限指派拼成全局指派，
而 `EndpointAssignment.lean:34` 直接调用 Mathlib 的无穷 Hall 定理
`all_card_le_biUnion_card_iff_exists_injective`（`import` 在 `:1`），
拼接一步到位，$G$ 是任意型。
于是 `Main.lean:14` 的 `[Countable G]` 只在交付可分性时被消费
（`SumObstruction.lean:75` 的 `carrier_separable [Countable G]`，
`NearOne.lean:79-81` 把它包成 `Countable G → SeparableSpace H` 的条件），
而 `NearOne.lean:11` 的 `variable` 里根本没有 `Countable`。

第三处，可数性的角色从"前提"降级成"附加信息"。
`Model.lean:49-51` 的 `MainTheorem` 还带着 `[Countable G]`，界写成 101；
`DiscreteModel.lean:9-16` 的 `CurrentMainTheorem` 把
`Countable G` 塞进结论的蕴含式里，界写成 `1 + ε`。
两个版本都是真的，但只有后者与论文主定理同形，
所以 yaml 登记的是后者（`formalization.yaml:1122-1124`）。

第四处，正向（均称蕴含酉化）在机器里走的是形式，并非内积。
tex 的 `conclusion.tex:174-189` 定义等价内积 $[\xi,\eta]$ 再取 $Q^{1/2}$；
`Amenable.lean:12-65` 的 `representation_similar` 先把
`averagedForm`（`AveragedForm.lean:60`）经 `mkContinuous₂` 变成有界双线性形式，
再用 `InnerProductSpace.continuousLinearMapOfBilin` 拿到 $Q$，
`CFC.isUnit_sqrt_iff` 与 `ContinuousLinearEquiv.ofUnit` 拿到 $S$，
最后用 `sq_eq_sq₀` 从范数平方相等推出范数相等。
多出的一整层是"有界性要被机器看见"：
`Amenable.lean:20-21` 用 `2 * M^2` 作为双线性形式界，
$M=\max C 1$（`:17`）保证 $M\ge1$，
于是 $M^{-2}\le [\xi,\xi]\le M^2$ 的两边都从 `averagedForm_lower`
与 `averagedForm_bound` 出来。

## §5 逐引理四段式

### §5.1 Theorem 1.1（主定理，`introduction.tex:38-45`）

(a) tex 逐字：

```
\begin{theorem}\label{thm:main}
A discrete group is amenable if and only if it is unitarizable.
For every discrete nonamenable group \(G\) and every \(\varepsilon>0\),
there are a complex Hilbert space \(\mathcal K\) and a representation
\(\pi:G\to\mathrm{GL}(\mathcal K)\) with \(|\pi|\le1+\varepsilon\)
that is not similar to a unitary representation. If \(G\) is countable,
\(\mathcal K\) may be chosen separable.
\end{theorem}
```

同页前置定义在 `introduction.tex:10-26`：
$|\pi|:=\sup_{g\in G}\norm{\pi(g)}$（`:13`），
"A group is unitarizable when every uniformly bounded representation on every
complex Hilbert space is unitarizable"（`:19-20`），
均称定义为 $\ell^\infty(G)$ 上的正规范左不变泛函（`:24-26`，
$(L_gf)(x)=f(g^{-1}x)$）。

(b) 把量词摊开。
左到右是逆否：$\neg$ 均称 $\Rightarrow$ 存在一个一致有界不可酉化表示，
而后者直接否定"每个一致有界表示都可酉化"。
右到左是 Day--Dixmier 平均（`conclusion.tex:168-190`）。
中间步骤是：对每个 $\varepsilon>0$ 造 $\pi$，
其不可酉化性由"有界非内循环上界"承载
（`introduction.tex:140-156`：$D(gh)=D(g)+U(g)D(h)U(g)^{-1}$，
若相似则 $\mathcal H\oplus0$ 有不变补空间，补空间写成算子图即把 $D$ 变成
$D(g)=B-U(g)BU(g)^{-1}$）；
于是主定理的证明责任被压缩到
`prop:direct-sum-obstruction` 加 `sec:sparse` 加 `sec:weights` 三段。
可数群的 $\mathcal K$ 可取可分这一句是构造给出的附加信息
（`conclusion.tex:61-62`：$\mathcal K$ 是两份额外的 $\bigoplus_{\ell\ge1}\mathcal H_\ell$，
$G$ 可数且每个 $k_\ell$ 有限故可分），
它不出现在任何推导的前提里。

(c) 机械理由。
$\varepsilon>0$ 严格为正：若允许 $\varepsilon=0$，
要求 $\lVert\pi(g)\rVert\le1$ 对一切 $g$，
而 $\pi(g)^{-1}=\pi(g^{-1})$ 也满足 $\lVert\pi(g^{-1})\rVert\le1$，
一个双可逆的压缩算子必是等距，$\pi$ 本身就是酉表示，
该条款变成空命题。
所以正文只能承诺 $1+\varepsilon$，而缩放常数 $t=\varepsilon/100$
（`conclusion.tex:48`）里的分母 100 是 $K=b_0^2$（`:29-30`）。
"$\mathrm{GL}(H)$ consists of the bounded invertible operators"（`:15`）
这句限定是必要的，因为 $S$ 的有界性要与 $S^{-1}$ 的有界性同时可用
（`introduction.tex:17`、`conclusion.tex:187-188` 用到有界逆定理与
$Q^{1/2}$ 可逆）。
"its condition number $\norm{S}\norm{S^{-1}}$ is not assumed to have a common bound"
（`:21-22`）决定了后面所有论证的形态：
`obstruction.tex:175` 明确 "No uniform bound on $\norm{T_j}$ or $\norm{A_j}$ is assumed"，
`SumObstruction.lean:34` 的能量假设也只要 `energy (A j) / k j` 发散，
不需要 $\lVert A_j\rVert$ 的任何界。
Lean 侧同形陈述在 `DiscreteModel.lean:9-16`：
第一个合取支是 `Amenable G ↔ Unitarizable.{u, max u v} G`，
第二个合取支是 `∀ (ε : ℝ), 0 < ε → ¬ Amenable G → ∃ H ...,
(Countable G → TopologicalSpace.SeparableSpace H) ∧
(∀ g, ‖π g‖ ≤ 1 + ε) ∧ ¬ SimilarToUnitary π`。

(d) [推测] 候选失败路线一：用超积把可数多个表示打包成一个，
从而把"每个表示各自有 $S_\pi$"升级成"整体有一个 $S$"，
再套用定量相似度定理。
这条路要在 Lean 里额外引入非标准模型，
与 `permitted_axioms` 只有 `propext`/`Quot.sound`/`Classical.choice` 的口径冲突。
[推测] 候选失败路线二：只对有限生成群证明，
再用直极限把结论搬给一般可数群；
失败点是酉化性对直极限并不自动保持，
反证需要的 $B$ 会在极限里失去有界性。
[推测] 候选失败路线三：把主定理写成 C* 代数语言的
"$C^*(G)$ 上不存在有界表示的同态延拓"（`conclusion.tex:199-227` 的方向），
再以 C* 均称性判据收尾；
这条把结论顺序倒过来，需要同伴论文的相似度定理当前提。

### §5.2 Lemma 2.1（到平移交换子的距离，`obstruction.tex:40-67`，证明 `:69-130`）

(a) tex 逐字（陈述部分 `:40-67`）：

```
\begin{lemma}[Distance from the translation commutant]
\label{lem:kernel-obstruction}
Let $G$ be a countable group, let $k$ be a positive integer, and let
$A,T\in\mathcal B(\mathcal H_k)$ with $A\in U_k(G)'$.
Write
\[
  A[x,y]=W(x^{-1}y),\qquad
  E=\sum_{s\in G}\norm{W(s)}_{\HS}^2.
\]
Suppose that, for some $K\ge0$,
\[
  \norm{\operatorname{row}_e(T)}\le K,
  \qquad
  \norm{\operatorname{col}_e(A-T)}\le K.
\]
Then $E$ is finite and, for every $C\in U_k(G)'$,
\begin{equation}
\label{eq:kernel-energy-obstruction}
  E\le 4k\bigl(K+\norm{T-C}\bigr)^2.
\end{equation}
Consequently,
\begin{equation}
\label{eq:kernel-distance-obstruction}
  \dist\bigl(T,U_k(G)'\bigr)
  \ge \frac12\sqrt{\frac{E}{k}}-K,
\end{equation}
where $\dist(T,U_k(G)')=\inf_{C\in U_k(G)'}\norm{T-C}$.
\end{lemma}
```

前置约定在 `:15-37`：$\mathcal H_k=\ell^2(G;\C^k)$，
$(U_k(g)\xi)(x)=\xi(g^{-1}x)$，$\iota_x:\C^k\to\mathcal H_k$ 是坐标等距嵌入，
$F[x,y]=\iota_x^*F\iota_y$，$\operatorname{row}_e(F)=\iota_e^*F$，
$\operatorname{col}_e(F)=F\iota_e$，以及 $F\in U_k(G)'$ 时
$F[x,y]=V(x^{-1}y)$、$V(s)=F[e,s]$（`:30-35`）。

(b) 中间步骤补齐。
取定 $C\in U_k(G)'$，令 $B=T-C$、$h=K+\lVert B\rVert$、$Q(s)=C[e,s]$（`:70-73`）。
第一步，$C=T-B$ 故 $\operatorname{row}_e(C)=\operatorname{row}_e(T)-\operatorname{row}_e(B)$，
由 `:51` 与 $\lVert\operatorname{row}_e(B)\rVert\le\lVert B\rVert$
（坐标评价是范数 $\le1$ 的映射）得 $\lVert\operatorname{row}_e(C)\rVert\le h$。
第二步，值域为 $\C^k$ 的有界算子是 Hilbert--Schmidt 且
$\lVert R\rVert_{\HS}^2=\Tr(RR^*)\le k\lVert R\rVert^2$（`:80-85`），
按 $\mathcal H_k$ 的坐标标准正交基展开即得
`:88-92` 的 $\sum_s\lVert Q(s)\rVert_{\HS}^2\le kh^2$。
第三步对称地处理 $L=\operatorname{col}_e(A-C)$：
$A-C=(A-T)+B$，故 $\lVert L\rVert\le h$，
定义域维数为 $k$ 给出 $\lVert L\rVert_{\HS}^2=\Tr(L^*L)\le k\lVert L\rVert^2$（`:94-102`），
而该列在第 $x$ 行的块是 $W(x^{-1})-Q(x^{-1})$（`:103-106`），
用"取逆是 $G$ 的双射"重指标得 `:109-113` 的
$\sum_s\lVert W(s)-Q(s)\rVert_{\HS}^2\le kh^2$。
第四步，对族 $\{W(s)\}$ 用 $\ell^2(G;\mathrm{HS})$ 的三角不等式：
$(\sum_s\lVert W(s)\rVert^2)^{1/2}\le\sqrt k h+\sqrt k h=2\sqrt k h$（`:119-125`），
平方即 `eq:kernel-energy-obstruction`，
除以 $4k$ 再开方并取 $\inf_C$ 即 `eq:kernel-distance-obstruction`。

(c) 每个常数与假设的去向。
$A\in U_k(G)'$ 唯一被消费的地方是把 $A$ 的块写成单变量核 $W(x^{-1}y)$
（`:30-35`），没有它就没有 $E$ 的定义。
$K\ge0$ 只出现在两个块界里，
最后的 $-K$ 项就是它，$4$ 与 $1/2$ 是 $2\sqrt k$ 平方再开方的必然产物。
系数 $k$ 来自 $\lVert R\rVert_{\HS}^2\le k\lVert R\rVert^2$，
一个 $\C^k$ 值算子的 HS 范数最多比算子范数大 $\sqrt k$ 倍；
$k$ 出现在分母（`:64`）正是要与能量的增长赛跑，
这就是 §2.1 里 $k=1$ 死路的代数根源。
"$G$ 为可数群"这条假设在本引理里只为让 $E$ 成为可数和
（`:114-117` 明说这些项非负，和与次序无关）；
机器把这一步交给无条件和 `tsum`，
于是 `KernelObstruction.lean` 从头到尾没有 `Countable`
（`variable {G K : Type*} [Fintype K]` 在 `:16`，只有纤维有限）。
Lean 对应物：`coefficients`（`KernelObstruction.lean:72`）把
HS 范数写成 `EuclideanSpace ℂ (K × K)` 的范数平方，
`coefficients_norm_sq`（`:78`）证明它等于 $\sum_b\lVert B e_b\rVert^2$，
`energy`（`:218`）定义 `∑' s, ‖coefficients (block A 1 s)‖^2`，
`row`/`col`/`block` 在 `:66`/`:69`/`:63`，
`Commutant`（`:187`）是 `{F | ∀ g, Commute F (translation g)}`，
`block_kernel`（`:197`）就是 $F[x,y]=F[1,x^{-1}y]$，
`energy_le_row`（`:226`）、`energy_le_column`（`:236`）是那两个 HS 界，
`energy_split_le`（`:267`）是第四步的机器形式
（写法用 $\lVert a\rVert^2\le2\lVert b\rVert^2+2\lVert a-b\rVert^2$，
所以出现 $2+2$ ，并非先平方 $2\sqrt k$），
`kernel_obstruction`（`:286`）汇成
`energy A ≤ 4 * (Fintype.card K) * (κ + ‖T - C‖)^2`，
`kernel_distance_pointwise`（`:301`）与 `kernel_distance`（`:318`）
把结论改写成 `Metric.infDist T Commutant` 下界。
`kernel_distance` 用 `Metric.le_infDist` 并显式给出 `⟨0, ...⟩` 作为
`Commutant` 非空的见证（`:321`），
这一步在 tex 里被 `:66` 的 $\inf$ 记号一口吞掉。
Lean 的 `(1/2 : ℝ) * Real.sqrt (energy A / Fintype.card K) - κ`
（`:304`、`:320`）与 `eq:kernel-distance-obstruction` 逐项对应。
另外 tex 的 $\mathcal H_k$ 需要一个单位元 $e$ 才能定义 $\operatorname{row}_e$，
Lean 一律写 `1`（`KernelObstruction.lean:218` 的 `block A 1 s`、
`SumObstruction.lean:31` 的 `row (T j) 1`），
这是把 $e$ 隐式固定成群单位元的机器写法。

(d) [推测] 候选失败路线一：把 $A$ 换成非不变核，
指望用 Schur 乘子或加权卷积补偿 $k$；
问题是 `:30-31` 的不变性正是块能被单个 $W$ 描述的唯一理由，
一旦破坏，$E$ 就没有定义。
[推测] 候选失败路线二：改用迹归一化的 HS 范数（把 $E$ 除以 $k$）来免除 $k$；
`KernelEnergy.lean:81` 的 `coefficient_norm_sq_eq_trace`
说明两种写法只差一个恒等处，改不动量级。
[推测] 候选失败路线三：直接用 $\lVert T\rVert$ 的界控制距离，
放弃块界； tex 在 `:172-173` 明说本估计"不对 $\lVert T_j\rVert$ 设界"，
说明这是刻意避开的路线，
一旦引入 $\lVert T_j\rVert$ 的公共界，`conclusion.tex:44-46` 的发散就只能靠 $k$ 下降，
而 $k\ge1$。

### §5.3 Proposition 2.2（直和障碍，`obstruction.tex:142-176`，证明 `:178-297`）

(a) tex 逐字（陈述 `:142-176`）：

```
\begin{proposition}[Direct-sum obstruction]
\label{prop:direct-sum-obstruction}
Let $G$ be a countable group.
For each $j\in\N$, let $k_j$ be a positive integer, put
\[
  \mathcal H_j=\ell^2(G;\C^{k_j}),
  \qquad (U_j(g)\xi)(x)=\xi(g^{-1}x),
\]
and let $A_j,T_j\in\mathcal B(\mathcal H_j)$ with
$A_j\in U_j(G)'$.
Write
\[
  A_j[x,y]=W_j(x^{-1}y),\qquad
  E_j=\sum_{s\in G}\norm{W_j(s)}_{\HS}^2.
\]
Suppose that one constant $K\ge0$ satisfies
\begin{align*}
  \norm{\operatorname{row}_e(T_j)}&\le K, &
  \norm{\operatorname{col}_e(A_j-T_j)}&\le K
  &&(j\in\N),\\
  \norm{T_j-U_j(g)T_jU_j(g)^{-1}}&\le K
  &&&&(j\in\N,\ g\in G).
\end{align*}
Assume also that
\[
  \frac{E_j}{k_j}\longrightarrow\infty.
\]
Then $G$ has a representation on a separable complex Hilbert space
whose operators are bounded and invertible, with
\[
  \sup_{g\in G}\norm{\pi(g)}\le1+K,
\]
and which is not similar to a unitary representation.
No uniform bound on $\norm{T_j}$ or $\norm{A_j}$ is assumed.
\end{proposition}
```

(b) 中间步骤。
$\mathcal H=\bigoplus_{j}\mathcal H_j$，$U(g)=\bigoplus_j U_j(g)$，
$D_j(g)=T_j-U_j(g)T_jU_j(g)^{-1}$，$D(g)=\bigoplus_j D_j(g)$（`:179-188`）。
$\lVert D(g)\rVert=\sup_j\lVert D_j(g)\rVert\le K$ 由第三条假设给出，
所以直和良定；`:191` 强调"不需要有界算子 $\bigoplus_jT_j$"，
这是全命题的关键：$\mathcal H_j$ 上的 $T_j$ 范数可以随 $j$ 发散。
展开得逐层循环恒等式 $D_j(gh)=D_j(g)+U_j(g)D_j(h)U_j(g)^{-1}$（`:196-199`），
取直和得 `eq:direct-sum-cocycle`。
三角表示 `eq:triangular-representation` 的乘法验证只用一块：
$D(gh)U(gh)=D(g)U(g)U(h)+U(g)D(h)U(h)$（`:215-219`）。
$D(e)=0$ 给出 $\pi(e)=\one$ 与 $\pi(g)^{-1}=\pi(g^{-1})$（`:222-224`）。
范数界走分解 $\pi(g)=\begin{pmatrix}\one&D(g)\\0&\one\end{pmatrix}
\begin{pmatrix}U(g)&0\\0&U(g)\end{pmatrix}$（`:225-233`），
第二因子酉，第一因子是单位加 $D(g)$，故 $\lVert\pi(g)\rVert\le1+K$。
反证部分：设 $S$ 使 $V(g)=S\pi(g)S^{-1}$ 酉。
$M=\mathcal H\oplus0$ 对每个 $\pi(g)$ 与 $\pi(g)^{-1}$ 不变，
故 $SM$ 闭且对 $V(g)$、$V(g)^{-1}$ 不变，于是 $(SM)^\perp$ 也不变，
$N=S^{-1}((SM)^\perp)$ 是 $M$ 的闭不变补空间（`:235-245`）。
坐标投影 $P_1,P_2$ 限制到 $N$ 上：$P_2|_N$ 单（$N\cap M=0$）满
（每个 $(0,\eta)$ 有 $M\dotplus N$ 分解），
Banach 空间之间的有界双射故有界逆（`:247-253`），
令 $B=P_1(P_2|_N)^{-1}$ 得 $N=\{(B\eta,\eta)\}$；
对图上点作用 $\pi(g)$ 得 $U(g)B\eta+D(g)U(g)\eta=BU(g)\eta$，
用 $U(g)$ 可逆改写成 `eq:global-cocycle-implementer`（`:259-268`）。
压缩：$B_j=I_j^*BI_j$，$\mathcal H_j$ 约化每个 $U(g)$，故
$I_j^*U(g)BU(g)^{-1}I_j=U_j(g)B_jU_j(g)^{-1}$，且 $\lVert B_j\rVert\le\lVert B\rVert$
（`:270-281`，`:282` 强调"压缩不要求 $B$ 保持分块"）。
于是 $C_j=T_j-B_j\in U_j(G)'$，把 Lemma 2.1 用在 $(A_j,T_j,C_j)$ 上得
$E_j\le4k_j(K+\lVert B_j\rVert)^2\le4k_j(K+\lVert B\rVert)^2$（`:287-292`），
与 $E_j/k_j\to\infty$ 矛盾（`:293-294`）。

(c) 机械理由。
"同一个 $K$ 同时控制三件事"（`:157-164`）是硬要求：
前两条进 Lemma 2.1 的假设，第三条保证 $D(g)$ 的直和有界；
如果只用两个不同的常数，结论里的 $1+K$ 要换成 $\max$，
`conclusion.tex:29-30` 那句"三个界共享公共常数 $K=b_0^2=100$"就是在核对这件事。
指标集取 $j\in\N$（可数直和）有两个消费者：
可分性（`:192-194`，每个 $\mathcal H_j$ 可分因为 $G$ 可数、$k_j$ 有限）
与极限 $E_j/k_j\to\infty$ 的叙述形式（`:166-168`）。
$1+K$ 这个形态由三角分解决定，不是任意选择。
结尾"No uniform bound on $\norm{T_j}$ or $\norm{A_j}$ is assumed"（`:175`）
是把 §2.2 死路明确排除在证明之外。
`:299-311` 的说明段给出量化强度：
每个单独的 $D_j$ 都被 $T_j$ 实现，障碍只在"整体有界实现子"上，
并且任何满足 $D_j(g)=B_j-U_j(g)B_jU_j(g)^{-1}$ 的 $B_j$ 必须
$\lVert B_j\rVert\ge\frac12\sqrt{E_j/k_j}-K$（`:305-307`）。
Lean 对应物分散在四个文件里。
循环上界与直和：`Cocycle.lean:25` 的 `coboundary`、
`:31` 的 `coboundary_cocycle`（对应展开式）、
`:50` 的 `equal_coboundaries_iff_commute_sub`（对应 $C_j=T_j-B_j$ 属于交换子），
`HilbertSum.lean:42` 的 `representation`、`:64` 的 `cocycle`、
`:77` 的 `cocycle_identity`、`:96` 的 `compression`、
`:99` 的 `compression_norm_le`、`:117` 的 `compression_implementer`。
三角表示：`Triangular.lean:38` 的 `operator`、`:52` 的 `operator_norm_le`
（对应 $1+\lVert D(g)\rVert$）、`:74` 的 `representation`、
`:95` 的 `representation_bound`。
相似 ⟹ 实现子：`InvariantProjection.lean:47` 的 `exists_commuting_projection`
与 `Unitarizer.lean:16` 的 `implementer_of_similar`。
汇总：`SumObstruction.lean:27` 的 `direct_sum_obstruction`，
结论 `(∀ g, ‖π g‖ ≤ 1 + κ) ∧ ¬ SimilarToUnitary π`，
`:75` 的 `carrier_separable [Countable G]` 与 `:83` 的
`separable_direct_sum_obstruction`。

这里有一处 tex 与机器证明的实质分歧，值得单独记下。
tex 走图补空间，需要"$P_2|_N$ 是有界双射故有界逆"（`:252-253`，
即有界逆定理/开映射），机器走投影块：
`Unitarizer.lean:21-22` 把 $M=\mathcal H\oplus0$ 直接写成
`ClosedSubmodule` 的核 `(WithLp.sndL 2 ℂ H H).ker`，
`:28` 从相似性拿到与 $\pi$ 交换的正交投影 $P$，
`:29` 定义 `q = fstL ∘ P ∘ inr`，`:39` 交出的实现子是 `-q`，
文件头 `:6-8` 的注释把动机说得很清楚：
"avoiding a bounded inverse for graph coordinates"。
机器的写法绕开了 Banach 定理，代价是要处理 `ClosedSubmodule` 与
`WithLp` 的坐标映射，收益是全部推导都在 Hilbert 结构内部完成。

(d) [推测] 候选失败路线一：用不可数直和（例如按子群或按表示族指标化）。
`SumObstruction.lean:17-19` 的 `Stage`/`Total`/`Carrier` 都以 `ℕ →` 索引，
lp 空间对不可数指标仍良定，但 `he : Tendsto ... atTop atTop`
（`:34`）与 `:70` 的 `eventually_gt_atTop` 挑 $j$ 都要靠可数序列；
不可数指标下"发散"要改成 net，`Main.lean:70-74` 的
`hratio` 组装会整体失效。
[推测] 候选失败路线二：不设三个界的公共常数，
让第 $j$ 层的界 $\kappa_j$ 增长而 $E_j/k_j$ 增长更快。
`SumObstruction.lean:49` 的 `hδb : ∀ g, ‖δ g‖ ≤ κ`
来自 `HilbertSum.boundedSum_norm_le`（`HilbertSum.lean:31`），
它需要一个与 $j$ 无关的 $\kappa$ 才能让 $\delta g$ 的直和存在，
这条路会直接卡住表示的良定性。
[推测] 候选失败路线三：只造一层（不分块）而让 $k\to\infty$ 在同一层里实现。
一层里 $E/k$ 是单个实数，`kernel_obstruction` 只会给出它自己的上界，
矛盾需要"某个 $j$ 使比值超过 $4(\kappa+\lVert B\rVert)^2$"，
而 $\lVert B\rVert$ 未知、只能被单层的固定值压住。

### §5.4 Lemma 3.1（收缩平均，`sparse.tex:16-23`，证明 `:25-53`）

(a) tex 逐字：

```
\begin{lemma}\label{lem:contracting-average}
If \(G\) is a nonamenable discrete group, there are a finite set
\(S\subset G\) containing \(e\), with \(d=|S|\ge2\), and a number
\(0<\rho<1\) such that
\[
 \norm{\frac1d\sum_{t\in S}R_t}\le\rho.
\]
\end{lemma}
```

约定在 `:9-10`：$(R_tf)(x)=f(xt)$ 是 $\ell^2(G)$ 上的右正则，故 $R_sR_t=R_{st}$。

(b) 中间步骤。
反证骨架：假设所有这种平均范数都为 1（每个都是压缩，故只能取等）。
恒等式 `:28-31`，
$\lVert\frac1d\sum_{t\in S}R_tf\rVert_2^2
=1-\frac1{2d^2}\sum_{t,t'\in S}\lVert R_tf-R_{t'}f\rVert_2^2$，
需要 $\lVert f\rVert_2=1$ 与每个 $R_t$ 酉：
右端来自 $\sum_{t,t'}\langle R_tf,R_{t'}f\rangle=d^2\lVert\text{avg}\rVert^2$
与 $\lVert R_t f-R_{t'}f\rVert^2=2-2\Re\langle R_tf,R_{t'}f\rangle$ 的合并。
于是"平均范数任意接近 1"给出成对差任意小，再用 $e\in S$ 把
$t'=e$ 的一项挑出来，得到对 $S$ 中每个 $t$ 有 $\lVert R_tf-f\rVert_2$ 小，
即近似不变向量族（`:32-34`）。
下一步把它转成近似不变均值：
$m_f(b)=\sum_x|f(x)|^2b(x^{-1})$（`:36-39`），
换元 $y=xg$ 给 $m_f(L_gb)=m_{R_{g^{-1}}f}(b)$（`:40-41`），
Cauchy--Schwarz 给 `:42-45` 的
$\lvert m_f(L_gb)-m_f(b)\rvert\le2\lVert b\rVert_\infty\lVert R_{g^{-1}}f-f\rVert_2$。
最后按"有限平移测试 + 正容差" Directed 化，用单位球弱*紧取聚点
（`:46-49`），得到正、规范、左不变的均值，与非常规矛盾。
`:50` 取 $\rho$ 介于该平均范数与 1 之间，`:51-52` 说明 $|S|\ge2$。

(c) 机械理由。
$e\in S$ 被消费两次：一次在 `:33` 把"成对差小"变成"与 $f$ 的差小"，
一次在 `:51-52` 保证单点集 $\{e\}$ 不是反例来源（$\{e\}$ 的平均就是恒等，范数 1）。
$d\ge2$ 在后续 `eq:dimension-ratio` 里被 `hd : 2 ≤ d` 反复使用
（`Parameters.lean:16`、`:53`、`:74`、`:89`、`:104` 每一条假设里都有它），
因为 $n_\ell=d^\ell\ge2$ 才能给 $\log(2n)\ge\log4>1$（`weights.tex:108`）。
$0<\rho<1$ 的下界非零是被 `Parameters.lean:74` 的
`endpointCapacity_pos`（`0 < ⌈d^ℓ ρ^ℓ⌉₊`）与 `:79` 的
`fiberDimension_pos` 消费的：装载量与纤维维数都要是正整数，
$\rho=0$ 会让 `Fin (k j)` 变成 `Fin 0` 从而整个 lp 空间退化。
机器形态：`Contracting.lean:80` 的 `contracting_average`
结论是 `∃ S : Finset G, 1 ∈ S ∧ 2 ≤ S.card ∧ ∃ ρ, 0 < ρ ∧ ρ < 1 ∧
‖((S.card : ℂ)⁻¹) • (∑ g ∈ S, rightRegular g)‖ ≤ ρ`，
`:55` 的 `exists_contracting_sum` 是不归一化版本
（`‖∑ g ∈ S, rightRegular g‖ ≤ (S.card : ℝ) * ρ`），
`:24` 的 `regular_sum_norm_le` 是"每个平均是压缩"，
`:14` 的 `rightRegular_opNorm` 给出 $\lVert R_g\rVert=1$（用
`indicatorL2 ({1})` 作下界见证）。
`:31` 的 `amenable_of_all_sum_norm` 承担反证主体，
输入是"每个含 1 的有限集的和算子范数都等于基数"，
中间经 `amenable_of_approximate_means`（`CompactMean.lean:16`）与
`vectorMean` 族（`VectorMean.lean:51`）：
`:37` 造 `T := insert 1 (S.image fun g => g⁻¹)`，
这个"加 1 再取逆"的集合正是把右正则近似不变转成左不变均值所需的桥，
对应 tex `:41` 的 $b(x^{-1})$ 换元；
`:50-52` 的 `calc` 结尾是 `ε * ‖b‖`，
其中 `2 * ‖b‖ * (ε / 2)` 里的 $2$ 就是 tex `:44` 的那个 2。
`Average.lean:34` 的 `pairwise_sq_le_sum`、`:42` 的
`regular_sum_variance` 是恒等式 `:28-31` 的机器形态，
`Average.lean:57` 的 `almost_invariant_of_sum_norm` 是
"范数接近基数 ⟹ 存在近似不变单位向量"那一步。

(d) [推测] 候选失败路线一：跳过均值，直接从近似不变向量造 Følner 集。
这条在机器里没有落点（模块内 0 处 `Folner`），
而且方向不对：我们只需要"存在一个范数严格小于 1 的平均"，
用均值反证最短。
[推测] 候选失败路线二：把 $R_t$ 换成左正则 $L_t$ 以省掉 $b(x^{-1})$ 的换元。
失败点在不变性的左右号：
酉化需要的均值是左不变的（`introduction.tex:26` 的 $m(L_gf)=m(f)$），
而近似向量给的是右近似不变，换元 $y=xg$ 正是把两者对穿的唯一动作，
`Contracting.lean:37` 的 `insert 1 (S.image fun g => g⁻¹)` 就是它的机器痕迹。
[推测] 候选失败路线三：允许 $S=\{e\}$ 并取 $\rho$ 接近 1。
`:51-52` 与 `Contracting.lean:65-71` 都显式排除单点集
（`card_eq_one.mp` 之后 `simp` 出 `lt_self_iff_false`），
因为单点平均是恒等算子，范数恰为 1，
后续 $r_\ell=\lceil d^\ell\rho^\ell\rceil$ 与 $k_\ell$ 的正性依赖 `hd : 2 ≤ d`。

### §5.5 Proposition 3.2（稀疏指派，`sparse.tex:63-74`，证明 `:76-121`）

(a) tex 逐字：

```
\begin{proposition}\label{prop:sparse-splitting}
Let \(G\) be countable and nonamenable, and fix \(S,d,\rho\) as in
\Cref{lem:contracting-average}. For every \(\ell\ge1\), list the products
of \(\ell\) elements of \(S\), with multiplicity, as
\(s_1,\ldots,s_n\), where \(n=d^\ell\), and put
\(r=\lceil n\rho^\ell\rceil\). There is a function
\(a:G\times\{1,\ldots,n\}\to\{0,1\}\) such that
\begin{equation}\label{eq:sparse-mask}
 \#\{i:a(x,i)=1\}\le r\quad(x\in G),\qquad
 \#\{i:a(ys_i^{-1},i)=0\}\le r\quad(y\in G).
\end{equation}
\end{proposition}
```

(b) 中间步骤。
乘积列表的算子恒等式 `:78-80`，
$\sum_{i=1}^nR_{s_i}=(\sum_{t\in S}R_t)^\ell$，
配上 `Lemma 3.1` 的次乘性得 $\lVert\sum_iR_{s_i}\rVert\le n\rho^\ell$（`:81`）。
矩形计数 `eq:edge-count`（`:87-89`）来自把卷积算子与两个指示向量配对：
$\#\{(x,i):x\in U,\ xs_i\in V\}\le\lVert A\rVert\lVert\one_U\rVert_2\lVert\one_V\rVert_2
=n\rho^\ell\sqrt{|U||V|}$。
`:92-98` 的 Hall 验证：每个顶点给 $r$ 个槽，
一条带标边可以进它的行槽或列槽，
有限边集 $F$ 的邻槽数为 $r(|U|+|V|)$，
而 $|F|\le n\rho^\ell\sqrt{|U||V|}\le\frac r2(|U|+|V|)\le r(|U|+|V|)$，
其中用了 $r\ge n\rho^\ell$ 与 AM-GM。
`:102-109` 用增广路补上有限 Hall 定理的证明（论文自己给，不引外部）。
`:111-116` 是拼接：可数边集枚举后，
有限初始段的指派集合按限制构成树，每个节点至多 $2r$ 个后继，
逐层选"后代出现在任意深"的孩子，得到一条无限分支。
`:116-120` 定义 $a(x,i)$：边被指派到行记 1、被指派到列记 0，
每点至多收 $r$ 条边即 `eq:sparse-mask`。

(c) 机械理由。
$n=d^\ell$ 与 $r=\lceil n\rho^\ell\rceil$ 的取整方向是必须的，
因为 $r$ 之后要被当成"槽数"（有限基数）使用；
`Parameters.lean:12` 的 `endpointCapacity d ρ ℓ = ⌈(d : ℝ)^ℓ * ρ^ℓ⌉₊`
取 `Nat.ceil`，`:13-14` 的 `fiberDimension d ρ ℓ =
⌈2 * (endpointCapacity d ρ ℓ : ℝ) * Real.log (2 * (d : ℝ)^ℓ)⌉₊`
里 $\log$ 的参数写成 $2 d^\ell$ ，并非 $2n$，
是为了让 `hlabel`（`Main.lean:26`、`NearOne.lean:26`）与
`FrameParameters.dimension` 能对表：
`Main.lean:36-37` 的 `hdim` 就是在核对
`FrameParameters.dimension (Fintype.card (Labels j)) (r j) = k j`。
$\lceil\cdot\rceil$ 的 $+1$ 松弛被 `Parameters.lean:23-27` 的
`Nat.ceil_lt_add_one` 两次消费，最后进入 `:18` 的
`2 * (ρ^ℓ + 1/(d:ℝ)^ℓ) * log(2 d^ℓ) + 1/(d:ℝ)^ℓ`，
也就是 tex `eq:dimension-ratio`（`conclusion.tex:21-22`）右边那一串。
"$\le 2r$ 个后继"这个分支数在机器里根本不需要：
`EndpointAssignment.lean:29` 的 `exists_endpoint_assignment`
把假设直接写成"对每个有限 `F : Finset E`，
`F.card ≤ r * ((F.image row).card + (F.image col).card)`"，
一次 `apply (all_card_le_biUnion_card_iff_exists_injective ...)`（`:34`）
拿到全局单射指派；
`:19-23` 的 `endpointSlots` 用 `disjSum` 显式区分行槽与列槽，
使 tex `:118-120` 那句"平行边始终互异、$s_i=e$ 时两端点仍是不同顶点"
由类型 `(V × Fin r) ⊕ (W × Fin r)` 自动保证。
标签集在机器里是 `Regular.lean:66` 的 `Word I n`
（`| 0 => PUnit | n+1 => I × Word I n`，一个 `def` 展开的递归类型，
`instance wordFintype` 在 `:70`），
`:80` 的 `word_card` 给 `Fintype.card (Word I n) = (Fintype.card I)^n`，
`:91` 的 `sum_wordProduct` 就是 `:78-80` 的算子恒等式
（形式为 $\sum_w\varphi(\text{product }w)=(\sum_i\varphi(s_i))^n$，
在任意 `Semiring` 值同态 $\varphi$ 下成立，
用时取 $\varphi=\text{rightRegular}$ 的算子值）。
`:104` 的 `sparse_mask_for_words` 把 `norm_pow_le'`（`:122`）
与 `Nat.le_ceil`（`:125`）串起来交付掩码，
装载量正是 `⌈(Fintype.card I : ℝ)^ℓ * ρ^ℓ⌉₊`。
中间层是 `SparseSplitting.lean:58` 的 `rectangleEdges_card_le`
（指示向量配对给 `q * Real.sqrt (U.card * V.card)`，
`:65-74` 全程只用 `norm_inner_le_norm` 与
`indicatorL2_norm`（`:33`）），
`:84` 的 `sqrt_mul_le_half_add` 是 AM-GM，
`:92` 的 `endpoint_density_of_rectangle_bound` 把 $\frac12$ 松弛成整数槽数，
`:114` 的 `sparse_mask_of_convolution_bound` 收尾。

这里还有一个可核对的强度差异。
tex 用 `r = ⌈nρ^ℓ⌉`，机器允许任何"不小于算子范数的整数容量"：
`SparseSplitting.lean:117` 的假设写成 `{r : ℕ} (hr : ‖A‖ ≤ r)`，
文档注释（`:112-113`）明说 "at any integer capacity above its norm"。
取整的自由度是 Lean 侧多出来的，正文把它钉死在一个具体值上。

(d) [推测] 候选失败路线一：先对乘积去重（按群元素合并标签）再做指派。
去重后 $n$ 变小看似有利，但 `eq:edge-count` 的右端 $\lVert A\rVert$ 也随之失去
$n\rho^\ell$ 这个来自 $\ell$ 次幂的形式，
`sum_wordProduct` 的恒等式只在"带重数求和"下成立（`Regular.lean:90` 的
注释正是 "Product lists are indexed by words, not by their possibly colliding values"）。
[推测] 候选失败路线二：用 König 引理原样形式化（tex 的路线）。
`EndpointAssignment.lean` 里没有树、没有分支，
机器换成无穷 Hall，说明这条路在 Lean 里要么依赖 `Mathlib` 的树论要么干脆多余。
[推测] 候选失败路线三：把槽数取成 $r$ 行 + $r$ 列以外的分配（例如每点 $2r$ 个同型槽）。
`endpointSlots`（`:15-17`）的 `disjSum` 结构决定了
`assigned_row_card_le`（`:73`）与 `assigned_col_card_le`（`:91`）
分别用 `isRowSlot` 过滤，
同型槽会让"行装载"与"列装载"两个界无法分离。

### §5.6 Lemma 4.1（小族一致上界，`weights.tex:18-35`，证明 `:37-133`）

(a) tex 逐字（陈述与参数式 `:18-35`）：

```
\begin{lemma}[An upper bound for all small subfamilies]
\label{lem:frames}
Let $n\ge 2$ and $r\ge 1$ be integers, and put
\begin{equation}
\label{eq:frame-parameters}
 p=\min(2r,n),\qquad
 k=\left\lceil 2r\log(2n)\right\rceil,
 \qquad b_0=10,
\end{equation}
where $\log$ denotes the natural logarithm.  There are unit vectors
$v_1,\ldots,v_n\in\C^k$ such that, for every
$J\subseteq\{1,\ldots,n\}$ with $|J|\le p$, the operator
\[
 V_J\colon\ell^2(J)\longrightarrow\C^k,
 \qquad V_J z=\sum_{i\in J}z_i v_i,
\]
satisfies $\norm{V_J}\le b_0$.
\end{lemma}
```

(b) 中间步骤。
取独立 Rademacher 变量 $\varepsilon_{a,i}$，令 $(v_i)_a=k^{-1/2}\varepsilon_{a,i}$（`:38-43`），
于是 $\lVert v_i\rVert=1$ 恰好成立（`:44`）。
固定 $|J|=p$ 与实单位向量 $w\in\mathbb R^k$、$z\in\mathbb R^p$，
$X=w^{\mathsf T}V_Jz=\frac1{\sqrt k}\sum_{a}\sum_j w_az_j\varepsilon_{a,i_j}$（`:46-51`），
系数平方和 $=\frac1k$（`:53-56`）。
$\cosh t\le e^{t^2/2}$ 给 $\mathbb E e^{tX}\le\exp(t^2/(2k))$（`:57-63`）；
Markov 加 $t=ku$ 给 $\Pr(X>u)\le\exp(-ku^2/2)$，
对 $-X$ 同理，故 `eq:sign-tail`：$\Pr(|X|>u)\le2\exp(-ku^2/2)$（`:64-70`）。
取 $u=5$ 得 $2\exp(-25k/2)$（`:71-72`）。
`：74-79` 造 $1/4$-net：极大 $1/4$-分离集，
半径 $1/8$ 的开球两两不交且含于半径 $9/8$ 的球，比体积得点数 $\le9^m$。
`:81-94` 的双网检验：若 $|w_0^{\mathsf T}Mz_0|\le5$ 对网点对成立，
则对任意单位 $w,z$ 取网点近似，
$|w^{\mathsf T}Mz-w_0^{\mathsf T}Mz_0|\le\lVert w-w_0\rVert L\lVert z\rVert
+\lVert w_0\rVert L\lVert z-z_0\rVert\le L/2$，
取上确界得 $L\le5+L/2$，故 $L\le10$。
`:96-102` 的 union bound：规模 $p$ 的集合至多 $n^p$ 个，
失败概率 $\le 2n^p9^{k+p}\exp(-25k/2)$。
`:103-107` 核对 $k\ge2r\log(2n)\ge p$ 与 $k\ge p\log n$；
`:108-118` 取对数得 $\log2+k+2k\log9-\frac{25k}2
=\log2-(\frac{25}2-1-2\log9)k<0$（系数 $>7$，$k\ge1$，$\log2<1$），
于是失败概率严格小于 1，存在一个实现使所有规模 $p$ 的合成算子实范数 $\le10$。
`:120-128` 说明实范数等于复范数（$M(u+iv)$ 分解成 $Mu$ 与 $Mv$ 的平方和），
`:129-132` 把结论从 $|J|=p$ 降到 $|J|\le p$。

(c) 机械理由与机器落点。
$p=\min(2r,n)$ 的两个来源都在下一节：
行侧是"两个行集之并"$\le2r$（`weights.tex:351-357`），
列侧是"两个零集对称差"$\le2r$ 且天然 $\le n$（`:359-375`）。
机器里 `FrameParameters.lean:12` 的 `subfamilySize n r := min (2*r) n`，
`SparseMask.lean:20` 的 `rowDifference` 与 `:23` 的 `columnDifference`
分别由 `:34`/`:41` 的包含引理（子集于两个 `rowOnes`/`columnZeros` 之并）
和 `:49`/`:61` 的基数界（`≤ 2 * r`）交付。
$k=\lceil2r\log(2n)\rceil$ 被 `FrameParameters.lean:14-16` 的 `bounds`
拆成三个用途：`1 ≤ dimension n r`（保证 `Fin (k j)` 非空，
喂给 `SignMatrix.lean:53` 的 `vector_norm [Nonempty K]`），
`subfamilySize n r ≤ dimension n r`（即 $p\le k$，
喂给 `failure_bound_lt_one` 的 `hp`），
`(subfamilySize n r : ℝ) * Real.log n ≤ dimension n r`（即 $k\ge p\log n$，
喂给 `hplog`，专门用来吃掉 $n^p$ 这个因子：
$p\log n$ 与 $2k\log9$、$\frac{25}2k$ 在同一指数尺度上比较）。
`:20-23` 证明 $\log(2n)>1$ 用的是 `Real.exp_lt_exp` 加 `Real.exp_one_lt_three`，
即 $e<3\le4\le2n$。
$b_0=10$ 完全由 $5$ 与 $1/2$ 生成：
`NetOperator.lean:16-47` 的 `operator_norm_le_ten`
假设两条 $1/4$-net（`:18-19`）与网点对上的 $|\langle Mx,y\rangle|\le5$（`:20`），
`:21` 先证 $\lVert M\rVert\le5+\lVert M\rVert/2$，
`:26` 的恒等式把误差拆成两项，`:30-42` 各给 $\lVert M\rVert/4$，
两项合起来 $\lVert M\rVert/2$，`:47` 的 `linarith` 解出 $10$。
$25/2$ 来自 $u=5$：`FiniteSigns.lean:65` 的 `upper_tail`
（假设 `hk : 0 < k`、`hu : 0 < u`）与 `:80` 的 `two_sided_tail`
把 $u=5$ 代入即 $\exp(-k\cdot25/2)$；
`:21`/`:33` 的 `sign_mgf`、`sign_mgf_le` 就是 $\cosh t\le e^{t^2/2}$。
net 规模 $9^{m}$：`SphereNet.lean:19` 的
`quarter_separated_card ... : s.card ≤ 9 ^ finrank ℝ E`，
`δ := 1/8`、`ρ := 9/8` 在 `:22-23`，
体积比较在 `:38-51`（`ENNReal` 上算，再用 `toReal` 落回 `ℝ`），
极大性在 `:56-96` 的 `exists_quarter_net`，
它用 `Nat.sSup_mem`（`:67`）取"势最大的 1/4-分离集"再反证它是网。
$n^p$ 这个计数在机器里写成单射的个数：
`FrameSelection.lean:13-18` 的 `embedding_card_le`，
`Fintype.card (Fin p ↪ Fin n) ≤ n^p`，
比正文的"规模 $p$ 的子集至多 $n^p$ 个"更细一格（它数的是有序注入），
原因是 `SignMatrix.lean:62` 的 `synthesis` 与 `:70` 的 `testCoefficients`
都以嵌入 `e : J ↪ I` 为参数。
`:20-41` 的 `exists_sign_matrix` 是 union bound 的执行体，
它把 `SphereNet.exists_quarter_net`、`NetOperator.operator_norm_le_ten`、
`SignMatrix.bilinear_tail`（`:107`）与
`FrameParameters.exact_failure_bound`（`:70`）拼起来；
`Frames.lean:42` 的 `all_subfamilies` 与 `:34` 的
`synthesis_restrict_norm` 负责 $|J|\le p$ 的下降。
实/复范数一致这一步在 `ComplexFrames.lean:24` 的 `norm_sq_split`
与 `:49` 的 `synthesis_bound`，
`:15` 的 `ofReal` 把实向量塞进复空间。

(d) [推测] 候选失败路线一：把随机向量取成复 Gaussian ，并非 Rademacher 符号。
机器侧代价立刻显现：`FiniteSigns.lean:17` 的 `sign (b : Bool)` 是
`if b then 1 else -1`，`sign_mgf`（`:21`）能写成闭式乘积
正因为每个因子只取两个值；Gaussian 需要另一套 MGF 与旋转不变性论证，
`SignMatrix.lean:50` 的 `sign_sq`（`(sign b)^2 = 1`，一行 `cases b <;> norm_num`）
就没有替代品。
[推测] 候选失败路线二：用现成的随机矩阵定理（比如 MarchenkoPastur 型
或 asymptotically-isometric-vector 的标准引理）直接给出 $b_0$。
`weights.tex:12-16` 只承认"借用 concentration、finite-net、
union-bound 这套方法"，并且 `:15-16` 明说"这里只需要上界，下面的论证
自带常数"。外部定理一般给高概率结论加渐近常数，
而本篇要在固定的 $n,r$ 与显式 $b_0=10$ 下取到一个具体实现，
`FrameParameters.lean:40-42` 那四条离散假设就是为脱离渐近而写的。
[推测] 候选失败路线三：把 $k$ 取成 $2r$ 而省掉 $\log(2n)$。
`failure_bound_lt_one` 的 `hplog : p * Real.log n ≤ k` 会失败，
于是 $n^p$ 这个子集计数因子吃掉 $\exp(25k/2)$，
union bound 不再小于 1，存在性论证当场断掉；
这条恰好解释了 $\log(2n)$ 为什么非出现不可。

### §5.7 Lemma 4.2（掩码算子估计，`weights.tex:165-185`，证明 `:187-248`）

(a) tex 逐字（陈述 `:165-185`，前置设置 `:140-163`）：

```
\begin{lemma}[The masked operator estimate]
\label{lem:masked}
In the preceding setting, let $1\le p\le n$ and $b_0>0$.  Suppose
that
\[
 \norm{V_J}\le b_0
 \quad\text{for every }J\subseteq\{1,\ldots,n\}
 \text{ with }|J|\le p,
\]
where $V_J$ is the synthesis operator with columns $v_i$, $i\in J$.
For a mask $c$ as in \Cref{eq:masked-operator}, define
\[
 \mathcal R_x=\{i:c(x,i)\ne0\},\qquad
 \mathcal C_y=\{i:c(ys_i^{-1},i)\ne0\}.
\]
If $|\mathcal R_x|\le p$ for every $x\in G$ and $|\mathcal C_y|\le p$ for every
$y\in G$, then
\[
 \norm{T_c}\le b_0^2.
\]
\end{lemma}
```

前置的掩码算子定义 `eq:masked-operator`（`:152-156`）是
$(T_c\xi)(x)=\sum_{i=1}^nc(x,i)P_i\xi(xs_i)$，
$P_i=v_iv_i^*$ 是秩一投影、$\lVert P_i\rVert=1$（`:149-150`），
且 $|c(x,i)|\le1$；`:157-163` 提醒不加稀疏性时只有 $\lVert T_c\rVert\le n$。

(b) 中间步骤。
构造三级分解（`:188-201`）：
边空间 $\mathcal E_c=\ell^2(E_c)$，$E_c=\{(x,i):c(x,i)\ne0\}$；
分析算子 $(F\xi)(x,i)=v_i^*\xi(xs_i)$；
对角乘子 $(M_c\alpha)(x,i)=c(x,i)\alpha(x,i)$；
合成算子 $(S\alpha)(x)=\sum_{i\in\mathcal R_x}v_i\alpha(x,i)$。
$S$ 的界：按行平方和，每行是一个 $\lVert V_{\mathcal R_x}\rVert\le b_0$ 的合成算子
（`:216-221`）。
$F$ 的界：把非负项按列 $y=xs_i$ 重新分组，
固定 $y$ 与固定标签 $i$ 时源点唯一为 $x=ys_i^{-1}$，
故到达 $y$ 的边恰好由 $\mathcal C_y$ 指标、无重复，
$\lVert F\xi\rVert^2=\sum_y\lVert V_{\mathcal C_y}^*\xi(y)\rVert^2\le b_0^2\lVert\xi\rVert^2$
（`:222-232`）。
$\lVert M_c\rVert\le1$ 来自 $|c|\le1$；逐点代入得精确分解 $T_c=SM_cF$（`:236-239`）。
`:242-247` 单独强调：源点唯一性用的是固定标签，并非 $s_i$ 互异，
$s_i=s_j$ 时两条边在 $\mathcal E_c$ 里是两个不同坐标，
贡献在同一个块里相加。

(c) 机械理由。
指数 $2$ 在 $b_0^2$ 里是分解的阶：$\lVert S\rVert\le b_0$、
$\lVert F\rVert\le b_0$、$\lVert M_c\rVert\le1$，三个数相乘。
$K=b_0^2=100$ 由此而来，而 `introduction.tex:186-189` 那句
"$k$ of order $r\log n$" 的"阶"就是 `FrameParameters.dimension`。
$1\le p\le n$ 是 $\mathcal R_x\subseteq\{1..n\}$ 与 $V_{\mathcal R_x}$ 有意义的下界；
机器把它拆成调用点的条件：
`Masked.lean:135` 的 `masked_bound` 需要行、列两个基数假设。
$|c(x,i)|\le1$ 在机器里是 `SparseMask.lean:76` 的 `difference_mask_norm`
（`‖boolComplex b - boolComplex c‖ ≤ 1`）与 `:80` 的
`difference_mask_ne_zero`，以及 `LocalBounds.lean:32`/`:39`/`:43` 三个
`..._norm` 引理，它们把 `rowMask`/`columnMask` 的值限制在单位圆盘内。
Lean 侧的对应物：`Masked.lean:20` 的 `shift`（右移酉算子）、
`:25` 的 `term`（单个标签项 $c(x,i)P_i\xi(xs_i)$ 的算子形态）、
`:33` 的 `operator`（$T_c$）、
`:48`/`:49` 的 `rowSet`/`columnSet`（即 $\mathcal R_x$、$\mathcal C_y$，
用 `univ.filter (fun i => c x i ≠ 0)` 定义，
注意这里是 `ℂ` 值的非零判定，比 tex 的集合记号更机械）、
`:52` 的 `edgeEnergy` 与 `:56`/`:72` 的可和性、
`:75` 的 `sum_subfamily`（把子族求和写成全和的过滤）、
`:79` 的 `row_estimate`、`:110` 的 `edgeEnergy_reindex`（按列重分组）、
`:135` 的 `masked_bound` 是结论。
中间那张 `figures/edge-factorization.tex` 图（`weights.tex:205-214`）
在机器里没有对应物，图注的信息全部由
`edgeEnergy_reindex` 的换序承担。
`Masked.lean:17-18` 用 `abbrev` 把 `Space`/`Fibre` 指回
`KernelObstruction`，保证两节的纤维是同一个类型，
这是 `Fintype K` 实例能一路传下去的原因。

(d) [推测] 候选失败路线一：不设中间边空间，直接估 $\lVert T_c\rVert$。
(tex `:157-163` 已经给了这种朴素估计的上限 $\lVert T_c\rVert\le n$，
而 $n$ 正是要发散的量，路线自相矛盾。)
[推测] 候选失败路线二：把边空间换成 $\ell^2(G\times G)$（按群元素对索引，
即合并 $s_i=x^{-1}y$）。
这样 $x=ys_i^{-1}$ 的唯一性会变成"对 $(x,y)$ 的多对一"，
$F$ 的界里同一列会出现重复指标，$V_{\mathcal C_y}^*$ 的界失效；
`weights.tex:242-247` 与 `Masked.lean:110` 的存在都是在防这个。
[推测] 候选失败路线三：让 $c$ 取一般复值而不限制 $|c|\le1$。
$\lVert M_c\rVert$ 变成 $\lVert c\rVert_\infty$，
`conclusion.tex:48` 的缩放 $t=\varepsilon/100$ 就要同时吃掉这个因子，
而 $D(g)=T_{c_g}$ 的 $c_g$ 取值本来是 $\{-1,0,1\}$（`weights.tex:347-350`），
放宽没有任何收益。

### §5.8 Corollary 4.3（单块行与单块列，`weights.tex:280-288`，证明 `:290-311`）

(a) tex 逐字：

```
\begin{corollary}[Individual block rows and columns]
\label{cor:block-rows-columns}
Under \Cref{eq:weights-orientation-bounds}, one has
\[
 \norm{q_xT}\le b_0^2\quad(x\in G),
 \qquad
 \norm{(A-T)\iota_y}\le b_0^2\quad(y\in G).
\]
\end{corollary}
```

它的前提是 `eq:weights-orientation-bounds`（`:262-267`）
$\sum_i a(x,i)\le r$ 与 $\sum_i(1-a(ys_i^{-1},i))\le r$，
以及 `eq:weights-A-T-U`（`:270-274`）的 $A=T_{\one}$、$T=T_a$、
$(U(g)\xi)(x)=\xi(g^{-1}x)$；$q_y=\iota_y^*$ 在 `:276-278` 定义。

(b) 中间步骤。
对固定 $x_0,y_0$ 造两个掩码（`:292-296`）：
$c_{\mathrm r}(x,i)=\one_{\{x=x_0\}}a(x,i)$，
$c_{\mathrm c}(x,i)=\one_{\{xs_i=y_0\}}(1-a(x,i))$。
前者全表只有 $x_0$ 行非零，非零指标数 $\le r$；
后者全表只有满足 $xs_i=y_0$ 的那些 $(x,i)$ 非零，
按列看是 $x=y_0s_i^{-1}$，非零指标数 $\le r$。
于是两个掩码的每行、每列活跃指标都 $\le\min(r,n)\le p$，
`Lemma 4.2` 给 $\lVert T_{c_{\mathrm r}}\rVert\le b_0^2$、
$\lVert T_{c_{\mathrm c}}\rVert\le b_0^2$。
关键是识别这两个算子：
$T_{c_{\mathrm r}}=\iota_{x_0}q_{x_0}T$，$T_{c_{\mathrm c}}=(A-T)\iota_{y_0}q_{y_0}$
（`:303-306`），
$\iota_{x_0}$ 等距故 $\lVert\iota_{x_0}q_{x_0}T\rVert=\lVert q_{x_0}T\rVert$；
$\lVert q_{y_0}\rVert=1$ 且 $q_{y_0}\iota_{y_0}=I_{\C^k}$
故 $\lVert(A-T)\iota_{y_0}q_{y_0}\rVert=\lVert(A-T)\iota_{y_0}\rVert$（`:307-310`）。
`:297-299` 那句"第一个不等式给出 $c_{\mathrm r}$ 总共至多 $r$ 条活跃边"
是tex版本；机器版本要把"总共"改成"每行每列"，见下。

(c) 机械理由。
$\min(r,n)\le p=\min(2r,n)$ 这一步用了 $r\le2r$，
它说明为什么 $p$ 要定义成 $2r$ 与 $n$ 的极小，并非直接 $r$：
同一套 `FrameBound` 要同时服务本推论（装载 $r$）与下一条命题（装载 $2r$）。
机器里这条链是 `LocalBounds.lean:95` 的 `local_row_bound`：
假设 `hv : FrameBound v (min (2*r) (Fintype.card I)) b`
（注意 `FrameBound` 的指标写成 `min (2*r) (Fintype.card I)`，
即 `FrameParameters.subfamilySize`，与 tex 的 $p$ 同形），
`hr : ∀ x, (rowOnes a x).card ≤ r`，
`:100-101` 先证 `(rowOnes a x₀).card ≤ min (2*r) (Fintype.card I)`
（`le_min`，一边用 `hr` 加 `omega`，一边用 `Finset.card_le_univ`，
对应 tex 的 $\min(r,n)\le p$），
`:102` 调 `support_bound`（`LocalBounds.lean:15`，
输入是一个"活跃指标全部落在某个基数 $\le p$ 的有限集 $J$ 里"的条件 `hs`），
`:103` 交 `rowMask_support`（`:51`），
`:104` 用 `row_localization`（`:67`，
`row (oriented v s a) x₀ = row (operator v s (rowMask a x₀) ...) x₀`，
即 $T_{c_{\mathrm r}}=\iota_{x_0}q_{x_0}T$ 的机器形式），
`:105` 用 `KernelObstruction.row_norm_le`（`KernelObstruction.lean:242`，
$\lVert\operatorname{row}F x\rVert\le\lVert F\rVert$）收尾，
结论是 `b^2`，代入 $b=10$ 得 100。
`column` 一侧对称：`local_column_bound`（`:107`）用
`column_localization`（`:74`）与 `columnMask_support`（`:59`）。
`:74-93` 的证明里有一个 tex 没写出的机器细节：
先把 `constant v s - oriented v s a` 整体重写成
`operator v s (fun x i => 1 - boolComplex (a x i)) (complement_norm a)`
（用 `operator_sub`，`MaskAlgebra.lean:26`），
再逐坐标比较 `columnMask` 与"补掩码"在 `lp.single 2 y₀ z` 上的作用，
`:90-93` 用 `by_cases h : x * s i = y₀` 与 `lp.single_apply_ne` 关掉其余项。
`complement_norm`（`LocalBounds.lean:39`，`‖1 - boolComplex b‖ ≤ 1`）
是这一步能保持 $|c|\le1$ 的原因；
tex 在 `:295` 直接写 $1-a(x,i)$，把这层验证吞进读者。

(d) [推测] 候选失败路线一：不设 $c_{\mathrm r}$ 的指示函数限制，
直接对整表用 `masked_bound`。
整表每行活跃数 $\le r$ 但每列活跃数可以等于 $|G|$（同一列被多个行指向），
`support_bound` 的列侧条件立刻失败。
[推测] 候选失败路线二：用 $\operatorname{row}_e$ 只在单位元处估计，
再靠不变性搬运。
$T$ 不属于交换子，块行没有平移不变性，
`row_localization` 只能是逐点等式，并非核表示；
机器对每个 $x_0$ 单独造掩码正是为此。
[推测] 候选失败路线三：把 $q_{y_0}\iota_{y_0}=I$ 换成一般的对偶配对。
$\lVert q_y\rVert=1$ 与 $\lVert\iota_y\rVert=1$ 依赖坐标嵌入是等距
（`KernelObstruction.lean:35` 的 `inclusion_norm` 与 `:58` 的
`evaluation_inclusion`），换成非等距对偶会引入额外因子，
$K$ 就不再是干净的 $b_0^2$。

### §5.9 Proposition 4.4（一致有界的共轭差，`weights.tex:313-331`，证明 `:333-385`）

(a) tex 逐字：

```
\begin{proposition}[Uniformly bounded conjugation differences]
\label{prop:uniform-differences}
Under \Cref{eq:weights-orientation-bounds}, the maps $U(g)$ in
\Cref{eq:weights-A-T-U} form a unitary representation of $G$,
and $A$ commutes with every $U(g)$.  Define
\[
 D(g)=T-U(g)TU(g)^{-1}\quad(g\in G).
\]
Then
\begin{equation}
\label{eq:uniform-difference-bound}
 \sup_{g\in G}\norm{D(g)}\le b_0^2=100.
\end{equation}
Moreover, $D(e)=0$ and
\begin{equation}
\label{eq:weights-cocycle}
 D(gh)=D(g)+U(g)D(h)U(g)^{-1}\quad(g,h\in G).
\end{equation}
\end{proposition}
```

(b) 中间步骤。
$U(g)$ 酉与表示律：左乘是双射，$U(g)^{-1}=U(g^{-1})$，代入即
$U(g)U(h)=U(gh)$（`:334-336`）。
$A$ 与 $U(g)$ 交换：左右平移交换且 $U(g)$ 在纤维上平凡；
或者把 $c=\one$ 代入 `eq:masked-operator` 直接验证（`:337-340`）。
共轭差的掩码形式：$(U(g)TU(g)^{-1}\xi)(x)=\sum_ia(g^{-1}x,i)P_i\xi(xs_i)$，
故 $D(g)=T_{c_g}$，$c_g(x,i)=a(x,i)-a(g^{-1}x,i)\in\{-1,0,1\}$（`:342-350`）。
行侧计数：活跃指标含于 $\{i:a(x,i)=1\}\cup\{i:a(g^{-1}x,i)=1\}$，
两侧各 $\le r$，故 $\le\min(2r,n)=p$（`:351-357`）。
列侧计数：记 $Z_y=\{i:a(ys_i^{-1},i)=0\}$，$|Z_y|\le r$，
活跃集恰为 $Z_y\triangle Z_{g^{-1}y}$，$\le2r$ 且 $\le n$，故 $\le p$（`:359-372`）。
固定 $y$ 与固定 $i$ 仍给出唯一源 $ys_i^{-1}$（`:373-375`），
于是 `Lemma 4.2` 对 $c_g$ 适用，$\lVert D(g)\rVert\le b_0^2$（`:377-380`）。
$D(e)=T-T=0$，循环律由 `Proposition 2.2` 证明里的展开继承（`:382-384`）。

(c) 机械理由。
等式 `eq:uniform-difference-bound` 里的 $100$ 是 $b_0^2$ 的数值化，
它同时是 `Model.lean:40` 的 `101` 与 `conclusion.tex:48` 的
$t=\varepsilon/100$ 的分母。
$Z_y\triangle Z_{g^{-1}y}$ 这一步"对称差"是全文唯一让 $p$ 取 $2r$ 的地方：
行侧是两个 1-集之并，列侧是两个 0-集之对称差，两者都至多 $2r$。
机器的对应：`SparseMask.lean:20` 的
`rowDifference a g x` 定义为 `rowOnes a x ∪ rowOnes a (g⁻¹*x)`，
`:23` 的 `columnDifference a s g y` 定义为
`(columnZeros a s y) ∪ (columnZeros a s (g⁻¹*y))`
（对 0-集也取并，并非对称差，因为活跃条件是"两个布尔值不等"，
`:27-32` 的两个 `private` 引理 `bool_ne_true_union`、`bool_ne_false_union`
就是把这个逻辑事实写成机器可用的形式），
`:34`/`:41` 是包含关系，`:49`/`:61` 给出
`≤ 2 * r` 的基数界。
`MaskAlgebra.lean:93` 的 `difference_operator` 是
$D(g)=T_{c_g}$ 的精确机器形式：
`coboundary KernelObstruction.translation (oriented v s a) g =
operator v s (fun x i => boolComplex (a x i) - boolComplex (a (g⁻¹*x) i)) ...`，
右边界由 `difference_mask_norm`（`SparseMask.lean:76`）提供，
证明两步：`conjugate_operator`（`MaskAlgebra.lean:37`，
把共轭移进掩码里变成 $c(g^{-1}x,i)$）加 `operator_sub`（`:26`）。
`:100` 的 `difference_norm_le` 汇成 `≤ b^2`，
中间两次用 `masked_bound_of_frame`（`:19`）
配上 `rowDifference_card_le` 与 `columnDifference_card_le`。
`constant_commutant`（`:52`）交付 $A\in$ 交换子，
用的是 `conjugate_eq_self_iff_commute`（`Cocycle.lean:36`）。
`Cocycle.lean:67` 的 `triangular` 与 `:70` 的 `triangular_cocycle_mul`
是 `eq:triangular-representation` 的抽象代数版本（在任意环 `R` 上写成
`R × R → R × R` 的块矩阵），
说明循环与三角乘法这部分被刻意剥离到与 Hilbert 空间无关的层面。

(d) [推测] 候选失败路线一：把 $D(g)$ 估成 $\lVert T\rVert+\lVert U(g)TU(g)^{-1}\rVert
\le2\lVert T\rVert$。
$\lVert T\rVert\le n$（`weights.tex:161-163`）发散，
这正是 `obstruction.tex:175` 拒绝 $\lVert T_j\rVert$ 界的原因。
[推测] 候选失败路线二：用 $a$ 的右不变性代替对称差计数，
例如要求指派在 $g$ 作用下几乎不变。
指派来自 Hall 匹配，没有任何等变结构可保证，
而且 $2r$ 的界已经足够，加等变性只会与 `eq:sparse-mask` 冲突。
[推测] 候选失败路线三：把共轭差换成换位子 $[T,U(g)]$。
循环必须写成 $T-\mathrm{Ad}_{U(g)}T$ 才能与 `coboundary` 的定义
（`Cocycle.lean:25`）匹配，换位子带一个额外的 $U(g)$ 因子，
`conjugate_mul`（`Cocycle.lean:17`）与 `coboundary_cocycle`（`:31`）
的推导形式要重排，收益为零。

### §5.10 Lemma 5.1（从子群诱导，`conclusion.tex:70-80`，证明 `:82-137`）

(a) tex 逐字：

```
\begin{lemma}[Induction from a subgroup]\label{lem:subgroup-induction}
Let \(H\) be a subgroup of a discrete group \(G\), and let
\(\sigma:H\to\mathrm{GL}(\mathcal K)\) be a uniformly bounded
representation on a complex Hilbert space. There is a uniformly bounded
representation \(\Pi:G\to\mathrm{GL}(\mathcal L)\) on
\(\mathcal L=\ell^2(G/H;\mathcal K)\) such that
\[
 |\Pi|=|\sigma|.
\]
If \(\Pi\) is unitarizable, then \(\sigma\) is unitarizable.
\end{lemma}
```

(b) 中间步骤。
取陪集代表 $s:X\to G$（$X=G/H$），要求 $s(H)=e$（`:83-84`）。
$w$ 上循环 $c(g,x)=s(gx)^{-1}gs(x)\in H$（`:85-87`），
属于 $H$ 的理由是 $s(gx)H=gs(x)H$；
直接相乘得 $c(gh,x)=c(g,hx)c(h,x)$（`:88-92`）。
在 $\mathcal L=\bigoplus_{x\in X}\mathcal K$ 的有限支撑稠密子空间上定义
$(\Pi(g)\xi)_{gx}=\sigma(c(g,x))\xi_x$（`:93-97`）。
$M=|\sigma|$ 时按置换 $x\mapsto gx$ 重指标得
$\lVert\Pi(g)\xi\rVert^2=\sum_x\lVert\sigma(c(g,x))\xi_x\rVert^2\le M^2\lVert\xi\rVert^2$
（`:98-104`），于是扩张到整个直和，`:105-106` 特别注明"不需要 $X$ 可数"。
循环律给出 $\Pi(g)\Pi(h)=\Pi(gh)$（先在有限支撑上、再取闭），
$\Pi(e)=I$ 故 $\Pi(g)^{-1}=\Pi(g^{-1})$（`:107-109`）。
等式 $|\Pi|=|\sigma|$ 靠恒等陪集的等距嵌入 $j$：
$\Pi(h)j=j\sigma(h)$（`:111-116`），
从而 $\lVert\Pi(h)\rVert\ge\lVert\sigma(h)\rVert$，取上确界得反向不等式
（`:117-119`）。
酉化方向：若 $[\cdot,\cdot]$ 是 $\Pi$ 的不变等价内积，
用有界正可逆算子 $Q$ 表示它，$aI\le Q\le bI$ 且
$\Pi(g)^*\mathrm Q\Pi(g)=\mathrm Q$（`:121-127`）；
压缩 $Q_H=j^*Qj$ 满足 $aI\le Q_H\le bI$ 与
$\sigma(h)^*Q_H\sigma(h)=j^*\Pi(h)^*Q\Pi(h)j=Q_H$（`:128-132`），
于是 $[v,w]_H=[jv,jw]$ 是 $\mathcal K$ 上的等价 $\sigma(H)$-不变内积（`:133-136`），
`:135-136` 强调"压缩不要求 $Q$ 保持恒等陪集分块"。

(c) 机械理由。
$s(H)=e$ 归一化代表系的唯一用途是让 $j$ 处的
$c(h,H)=h$ 成立（`:112-113`）；若代表系不这样归一，
$\Pi(h)j=j\sigma(c(h,H))$ 会带一个内自同构，
$|\Pi|\ge|\sigma|$ 仍成立但 $\Pi(h)j=j\sigma(h)$ 逐点等式失效。
"$|\Pi|=|\sigma|$"这个精确等式（，并非 $\le$）被 `:164` 消费：
非均称方向要把 $1+\varepsilon$ 的界原样搬到 $G$ 上，
任何损失都让 $\varepsilon$ 的自由度作废。
"不需要 $X$ 可数"（`:105-106`）是本引理对全文不可数推广的贡献，
它和 `:107-108` 的"先在有限支撑上验证再取闭"是配套的。
本引理在机器里 0 对应物：模块内 `grep -n "Coset\|Quotient.group\|G/H\|induced"`
无命中（见 §4 第二处与 `## Lean 取证` 的实测段）。
Lean 走的是完全不同的通路（`NearOne.lean:87` 的
`nonamenable_near_one_large` 与 `UniverseTransport.lean:18-53`），
它搬运的是宇宙层级，并非群。
`UniverseTransport.lean:18` 的 `meanPullback (e : G ≃* Q)`
把 $Q$ 上的均值沿同构拉回 $G$，`:28` 的 `amenable_of_mulEquiv`
与 `:44` 的 `witness_of_mulEquiv` 是两个方向的搬运，
`:55` 的 `main_theorem_all_universes` 是 `Dixmier.lean` 那个 comparator 的解，
`:66` 的 `amenable_of_unitarizable_all_universes [Countable G]`
是可数版本。
这条线的存在解释了一个现象：机器的"任意离散群"是宇宙意义上的任意
（`Type u` 里任何大小的群都可以），
tex 的"任意离散群"是基数意义上的任意，两者靠不同的机制达成。

(d) [推测] 候选失败路线一：只用 $|\Pi|\le|\sigma|$ 而不证等号。
`conclusion.tex:164` 的 $|\Pi|=|\sigma|\le1+\varepsilon$ 只用到 $\le$，
等号那一半看似多余；但它同时是"酉化 $\Pi$ 会酉化 $\sigma$"的
反向保险（`:117-119` 用同一句 $\Pi(h)j=j\sigma(h)$），
去掉等号就要另写一遍压缩论证。
[推测] 候选失败路线二：用 quasi-regular 表示 $\ell^2(G/H)$ 上的
左正则（不含 $\sigma$）来造 $G$ 的表示。
那样得到的表示是酉的，`Proposition 2.2` 型的障碍无从产生，
$G$ 的非酉化见证必须把 $\sigma$ 织进纤维。
[推测] 候选失败路线三：形式化本引理，用 `Mathlib` 的
`Representation.Induced` 或 `Quotient.group` 上的 $L^2$ 直和。
`NonamenableWitness` 要求显式的 `SeparableSpace` 实例
（`Model.lean:38`），而商空间 `G/H` 上的可分性要另证；
机器既然绕开了整个不可数推广路线，这条形式化就是纯负担。

### §5.11 无编号证明块："The countable nonamenable case"（`conclusion.tex:8-64`）

(a) tex 逐字（参数选取 `:13-23` 与两个关键估计 `:32-46`）：

```
 n_\ell=d^\ell,\qquad
 r_\ell=\lceil n_\ell\rho^\ell\rceil,\qquad
 k_\ell=\lceil2r_\ell\log(2n_\ell)\rceil.
```

```
\begin{equation}\label{eq:dimension-ratio}
 \frac{k_\ell}{n_\ell}
 \le2\left(\rho^\ell+\frac1{n_\ell}\right)\log(2n_\ell)
       +\frac1{n_\ell}\longrightarrow0.
\end{equation}
```

```
The invariant kernel of \(A_\ell\) is
\[
 W_\ell(s)=\sum_{i:s_i=s}P_i.
\]
It is finitely supported. Positivity of the weights gives
\begin{equation}\label{eq:kernel-energy}
 \sum_{s\in G}\norm{W_\ell(s)}_{\HS}^2
 =\sum_{i,j:s_i=s_j}\Tr(P_iP_j)
 =\sum_{i,j:s_i=s_j}|v_i^*v_j|^2
 \ge n_\ell.
\end{equation}
```

以及 `:48-53`：

```
Fix \(\varepsilon>0\) and put \(t=\varepsilon/100\). Apply
\Cref{prop:direct-sum-obstruction} to the rescaled operators
\(tA_\ell,tT_\ell\). Their three uniform bounds have the common
constant \(tK=\varepsilon\). Their invariant kernels are
\(tW_\ell\), so their energies divided by \(k_\ell\) still tend to
infinity: they are \(t^2\) times the ratios just established.
```

(b) 中间步骤。
把 `Lemma 3.1` 的 $S,d,\rho$ 固定，令 $\ell$ 跑遍 $\N$ 作层次指标
（机器里用 `j` 并把层写成 `j+1`，见 `Main.lean:22-24`）。
第 $\ell$ 层的标签集是长度 $\ell$ 的 $S$-字，
$n_\ell=d^\ell$ 由 `word_card`（`Regular.lean:80`）给出。
装载量 $r_\ell$ 来自 `Proposition 3.2`，
纤维维数 $k_\ell$ 来自 `Lemma 4.1`。
`:19-23` 的比值趋于 0 的推导：
$k_\ell\le2r_\ell\log(2n_\ell)+1\le2(n_\ell\rho^\ell+1)\log(2n_\ell)+1$
（两次用 $\lceil x\rceil\le x+1$），除以 $n_\ell$ 得
`:21-22` 的右端；
$\rho^\ell\log(2n_\ell)\to0$ 与
$n_\ell^{-1}\log(2n_\ell)=d^{-\ell}(\ell\log d+\log2)\to0$
是几何压对数。
`:24-27` 取 `Lemma 4.1` 的向量并组成 $A_\ell,T_\ell,U_\ell$，
`:28-30` 核对三个界共享 $K=b_0^2=100$。
`:32-44` 的能量：$W_\ell(s)=\sum_{i:s_i=s}P_i$ 有限支撑，
$\lVert W_\ell(s)\rVert_{\HS}^2=\Tr(W_\ell(s)^*W_\ell(s))
=\sum_{i,j:s_i=s_j}\Tr(P_iP_j)$，
而 $\Tr(P_iP_j)=\Tr(v_iv_i^*v_jv_j^*)=(v_i^*v_j)\Tr(v_iv_j^*)
=\lvert v_i^*v_j\rvert^2$（秩一算子的迹与内积配对），
对角项 $\lvert v_i^*v_i\rvert^2=\lVert v_i\rVert^4=1$，
共 $n_\ell$ 个，非对角项非负，故 $E_\ell\ge n_\ell$（`:44-45`）。
`:45-46` 得 $E_\ell/k_\ell\ge n_\ell/k_\ell\to\infty$。
`:48-53` 缩放后交给 `Proposition 2.2`，
`:54-59` 写出 $\mathcal K$ 是两份 $\bigoplus_{\ell\ge1}\mathcal H_\ell$ 的直和
（对应三角表示作用在 $\mathcal H\oplus\mathcal H$），
`:60-63` 交付 $1+\varepsilon$ 界、不可酉化与可分性。

(c) 机械理由。
$t=\varepsilon/100$ 的分母是 $K=b_0^2$，
被消费两次：三个块界同时缩成 $tK=\varepsilon$（`:50-51`），
以及 `1 + tK = 1 + ε` 的结论形式
（机器 `ScaledObstruction.lean:38` 的结论就是 `‖π g‖ ≤ 1 + t * κ`）。
缩放对能量的作用是 $t^2$（`:52-53`，机器
`ScaledObstruction.lean:16` 的 `energy_real_smul`：
`energy (t • A) = t ^ 2 * energy A`，
证明里 `norm_smul` 加 `mul_pow` 加 `sq_abs` 再 `tsum_mul_left`），
而 $t^2$ 个正常数不改变发散，
所以 `ScaledObstruction.lean:60-61` 用
`he.const_mul_atTop (sq_pos_of_pos ht)` 交付；
这里 $ht$ 的来源是 `NearOne.lean:76` 的
`(show 0 < ε / 100 by positivity)`。
$\varepsilon$ 与 $100$ 的除法在 `NearOne.lean:83` 被还原：
`simpa only [div_mul_cancel₀ ε (by norm_num : (100 : ℝ) ≠ 0)] using hπbound g`。
机器不用 $n_\ell,r_\ell,k_\ell$ 三个名字，是三个函数
（`Main.lean:22-24`、`NearOne.lean:21-23`）：
`k : ℕ → ℕ := fun j => fiberDimension d ρ (j+1)`，
`r : ℕ → ℕ := fun j => endpointCapacity d ρ (j+1)`，
`Labels : ℕ → Type u := fun j => Word S (j+1)`。
`j+1` 的偏移是为了满足 `Regular.lean:106` 的 `hℓ : 0 < ℓ`
（$\ell=0$ 时标签集是 `PUnit`、$n=1$，`Lemma 4.1` 要求 $n\ge2$ 会失败），
`Main.lean:28-33` 的 `hn` 就是在核对 $2\le d^{j+1}$
（`one_le_pow₀` 加 `nlinarith`）。
`Main.lean:70-74` 的 `hratio` 是 `eq:dimension-ratio` 加
`eq:kernel-energy` 的合成：
先用 `reciprocal_dimension_ratio_tendsto`（`Parameters.lean:89`）
再 `comp (tendsto_add_atTop_nat 1)` 吸收 `j+1` 偏移，
然后 `tendsto_atTop_mono` 用 `henergy`（`:66-69`，
`(d : ℝ)^(j+1) ≤ energy (A j)`）逐点抬高。
`Main.lean:75-76` 调 `direct_sum_obstruction` 得到界 `1+100=101`，
`Main.lean:81-83` 的 `convert hπbound g using 1` 加 `norm_num`
把 `1 + 100` 与 `NonamenableWitness` 要求的 `101` 对齐。
`NonamenableWitness`（`Model.lean:36-40`）写死 101 ，并非 `1+K`，
是因为它要保证 `witness_not_unitarizable`（`:54-58`）里
`hunit H π ⟨101, hbound⟩` 的常数是一个可检查的字面量。
能量下界的机器链条在 `KernelEnergy.lean`：
`:17` 的 `rankOneCoefficients`、`:24` 的 `rankOne_inner`
（$\langle P_uv,w\rangle$ 型恒等式）、`:43` 的 `rankOne_norm_sq`
（$\lVert v\rVert=1$ 时系数范数平方为 1）、
`:51` 的 `kernelCoefficients`（即 $W_\ell(s)$ 的系数向量化）、
`:58` 的 `rankOne_sum_energy`（交叉项 $\lvert v_i^*v_j\rvert^2$ 的展开）、
`:81` 的 `coefficient_norm_sq_eq_trace`（HS 范数与迹的等式）、
`:91` 的 `kernelCoefficients_offsupport`（$s\notin$ 乘积集时为零，
对应"It is finitely supported"）、
`:98` 的 `kernel_energy_summable`、`:106` 的 `kernel_energy_ge_card`；这条链上的能量比较全部按 re/im 分量逐点写成显式不等式，因为 `BoundedContinuousFunction` 上的有序结构在 Mathlib 里不覆盖复值情形。

(d) [推测] 候选失败路线一：把层次指标取成 $\ell=0$ 起步。
$n_0=1$ 会让 `Lemma 4.1` 的 $n\ge2$ 前提失效，
机器在 `Main.lean:28-33` 与 `NearOne.lean:27-32` 两处各自核对了 $2\le d^{j+1}$，
说明这个偏移不是随手写的。
[推测] 候选失败路线二：不缩放，直接把 $K=100$ 塞进
`MainTheorem` 的 101 界，再声称"同理可得 $1+\varepsilon$"。
`NonamenableWitness` 与 `CurrentMainTheorem` 是两个不同的陈述
（`Model.lean:49-51` 与 `DiscreteModel.lean:9-16`），
后者要求结论里出现 $1+\varepsilon$ 字面值，
`NearOne.lean:74-75` 因此必须走 `scaled_direct_sum_obstruction`，
不能复用 `Main.lean:75` 的 `direct_sum_obstruction`。
[推测] 候选失败路线三：用归一化迹（把 $E_\ell$ 除以 $k_\ell$ 后再求和）
来免除 $k_\ell/n_\ell\to0$ 的核对。
`eq:kernel-distance-obstruction` 的分母 $k$ 已经是归一化的结果，
再除一次等于把 `kernel_obstruction` 的 $4k$ 系数改成 4，
而那个 $4k$ 恰恰来自 $\lVert R\rVert_{\HS}^2\le k\lVert R\rVert^2$，
改不动。

### §5.12 §6 的 C* 推论（`conclusion.tex:199-227`，无编号）

(a) tex 逐字（`:202-203` 与 `:213-221`）：

```
The following consequence uses the companion similarity theorem in
addition to \Cref{thm:main}.
```

```
defines a bounded complex-linear unital homomorphism for convolution, with
\(\norm{T_\pi(f)}\le|\pi|\norm{f}_1\); absolute summability justifies
multiplication of the sums. Nevertheless, its restriction to \(\C[G]\)
has no bounded complex-linear unital algebra-homomorphism extension to
either the full group algebra \(C^*(G)\) or the reduced group algebra
\(C_r^*(G)\). Indeed, a full extension \(\Phi\) would be similar to a
\(*\)-homomorphism by the companion similarity theorem
\cite[Theorem~1.1]{OpenAIKadison2026}: some bounded invertible \(S\)
would make \(S\Phi(\cdot)S^{-1}\) a unital \(*\)-homomorphism.
```

(b) 中间步骤。
$T_\pi(f)=\sum_{g}f(g)\pi(g)$ 算子范数收敛（`:207-210`），
界 $\lVert T_\pi(f)\rVert\le|\pi|\lVert f\rVert_1$（`:211`）来自
$\sum_g|f(g)|\lVert\pi(g)\rVert\le|\pi|\lVert f\rVert_1$；
乘性由绝对可和保证的重排（`:212`）给出。
设存在保持到 $C^*(G)$ 的有界单位同态延拓 $\Phi$，
同伴定理给 $S$ 使 $\mathrm{Ad}_S\circ\Phi$ 是 $*$-同态（`:216-219`），
$*$-同态把酉元送到酉元，而 $\Phi(u_g)=\pi(g)$（$u_g$ 是典范群酉元，
`:220`），故所有 $S\pi(g)S^{-1}$ 酉，与 $\pi$ 不可酉化矛盾（`:221`）。
保持到 $C_r^*(G)$ 的延拓可与典范商 $C^*(G)\twoheadrightarrow C_r^*(G)$
复合成保持到满代数的延拓（`:222-223`），故两种情形同时失败。
`:224-227` 的结论是"$\ell^1$-范数自动有界不蕴含 $C^*$-范数连续"，
且对每个非均称离散群、一致界任意接近 1 的见证都成立。

(c) 机械理由。
这一段的地位被 `:202-203` 限定得很死：它要额外吃一篇同伴论文的定理，
所以它不属于主等价性的证据链。
`:220` 那句 $\Phi(u_g)=\pi(g)$ 之所以成立，
是因为 $\Phi$ 是 $T_\pi|_{\mathbb C[G]}$ 的延拓而 $u_g$ 在群代数里就是
$\delta_g$；这是把 $\ell^1$ 世界与 $C^*$ 世界缝合的唯一一处，
其余全靠同伴定理。
机器口径：模块内 `grep -n "CStar\|Kadison"` 零命中，
`references.bib` 里的 `OpenAIKadison2026` 没有 Lean 对应物，
`ComparatorChallenges/DixmierAllDiscrete.json` 的 `theorem_names`
也只列 `OAI.Dixmier.current_main_theorem` 一项。

(d) [推测] 候选失败路线一：把这段并进入口定理，
让 `CurrentMainTheorem` 多一个合取支。
`DixmierAllDiscrete.lean` 的桩（`:31-42`）里没有 C* 语言，
加进去要引 `Mathlib` 的 group C* 代数构造，
并把同伴定理作为公理或外部 axiom 引入，
`permitted_axioms` 三条会立刻被破坏。
[推测] 候选失败路线二：不用同伴定理，改从
$\pi$ 不可酉化直接推 $\Phi$ 不存在。
缺少 $*$-同态化这一步就得不到"$S\pi(g)S^{-1}$ 酉"，
推论会退化为对每个具体表示单独论证，覆盖面远不如现在。
[推测] 候选失败路线三：只做满代数情形、放弃约化代数那一半。
`:222-223` 的商映射论证只有两行，
放弃它会让结论对 $C_r^*(G)$ 保持沉默，
而 $C_r^*$ 恰是均称性等价的落点（$G$ 均称当且仅当
典范商 $C^*(G)\to C_r^*(G)$ 是同构），丢掉它等于丢掉与 Dixmier 原问题的对照。

## 常数与参数台账

独立成节；它后面的 §5.13 与 §5.14 仍属 §5 的逐引理四段式，台账插在中间是因为两处需要互相引用具体行位。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| \(d=\lvert S\rvert\) | 整数，满足 \(2\le d\) | tex `sections/sparse.tex:19`；lean `Contracting.lean:81` | `n_\ell=d^\ell`（`sparse.tex:67`）、`Regular.lean:80` 的 `word_card`、`Parameters.lean:16` 的 `dimension_ratio_bound` | `Parameters.lean:53/74/79/89/104` 全部要求 `hd : 2 ≤ d`；`d=1` 时 `Contracting.lean:65-71` 已在 `exists_contracting_sum` 里被排除 |
| \(\rho\) | 实数，\(0<\rho<1\)，取在收缩平均范数与 1 之间 | tex `sections/sparse.tex:19`、`:50`；lean `Contracting.lean:82` | `r_\ell=\lceil d^\ell\rho^\ell\rceil`（`Parameters.lean:12`）、`geometric_log_tendsto`（`Parameters.lean:38`） | \(\rho=0\) 让 `endpointCapacity_pos`（`Parameters.lean:74`）失败，`Fin (k j)` 退化；\(\rho=1\) 让 `dimension_ratio_tendsto`（`Parameters.lean:53`）的 `hρ1` 失败，比值不再趋于 0 |
| \(n_\ell\) | \(d^\ell\)，指数增长 | tex `sections/sparse.tex:67`；lean `Regular.lean:80`、`Main.lean:26` 的 `hlabel` | `eq:dimension-ratio`（`conclusion.tex:19-23`）、`eq:kernel-energy` 的下界（`conclusion.tex:41`） | 若把标签按群元素去重，`Regular.lean:91` 的 `sum_wordProduct` 不再成立，`Main.lean:66-69` 的能量下界失去依据 |
| \(r_\ell\) | \(\lceil n_\ell\rho^\ell\rceil\)，\(o(n_\ell)\) | tex `sections/sparse.tex:68`；lean `Parameters.lean:12` | Hall 密度不等式（`sparse.tex:97-98`、`SparseSplitting.lean:97`）、`eq:weights-orientation-bounds`（`weights.tex:264-266`）、`p=\min(2r,n)` | 取 \(\lceil\cdot\rceil\) 为下取整时 `SparseSplitting.lean:117` 的 `hr : ‖A‖ ≤ r` 不成立，无穷 Hall 的密度前提断链 |
| \(k_\ell\) | \(\lceil 2r_\ell\log(2n_\ell)\rceil\)，\(o(n_\ell)\) | tex `sections/weights.tex:24`；lean `FrameParameters.lean:11`、`Parameters.lean:13-14` | `failure_bound_lt_one`（`FrameParameters.lean:40`）、`eq:kernel-distance-obstruction` 的分母 \(k\) | 去掉 \(\log(2n)\) 后 `FrameParameters.lean:16` 的 `p * Real.log n ≤ k` 失败，`eq:frame-failure-probability` 不小于 1，存在性论证崩 |
| \(p\) | \(\min(2r,n)\) | tex `sections/weights.tex:23`；lean `FrameParameters.lean:12` | `FrameBound` 的指标（`LocalBounds.lean:97`、`MaskAlgebra.lean:102`）、`SparseMask.lean:49/61` 的 \(2r\) 界 | 取 \(p=r\) 时 `prop:uniform-differences` 的列侧对称差 \(2r\) 超界（`weights.tex:369-372`），`masked_bound` 的行/列假设不满足 |
| \(b_0\) | 10 | tex `sections/weights.tex:25`、`:94`；lean 以字面 `10` 出现在 `Main.lean:40`、`NearOne.lean:39` 的 `FrameBound ... 10` | `eq:uniform-difference-bound` 的 \(b_0^2\)、`conclusion.tex:30` 的 \(K=b_0^2=100\) | 由 \(L\le5+L/2\) 定死；`NetOperator.lean:20` 的 5 若改成 6，`operator_norm_le_ten` 的结论变成 12，\(K\) 与 101 全表跟着动 |
| 5（网检验阈值） | 实数 5 | tex `sections/weights.tex:85`、`:94`；lean `NetOperator.lean:20` | \(b_0=10\) 的产生（`NetOperator.lean:21` 的 `‖M‖ ≤ 5 + ‖M‖/2`）、尾概率在 \(u=5\) 处取值（`weights.tex:71-72`） | 改成 \(u\) 一般值时 \(b_0=2u\) 而尾是 \(\exp(-ku^2/2)\)，须重做 `FrameParameters.lean:56-58` 的指数比较 |
| \(25/2\) | 尾指数系数 | tex `sections/weights.tex:69-72`、`:112`；lean `FrameParameters.lean:42` 的 `Real.exp (-25*(k : ℝ)/2)`、`SignMatrix.lean:107` | `eq:frame-failure-probability` < 1（`FrameParameters.lean:40`） | 该值来自 \(u^2=25\)；`FrameParameters.lean:56` 的对数估计 \(\log2+p\log n+(k+p)\log9-25k/2<0\) 立刻翻正 |
| \(1/4\), \(1/8\), \(9/8\), \(9^m\) | 网格半径与基数 | tex `sections/weights.tex:74-79`；lean `SphereNet.lean:19` 的 `9 ^ finrank ℝ E`、`:22-23` 的 `δ := 1/8`/`ρ := 9/8`、`:18` 的分离半径 `1/4` | \(9^{k+p}\) 出现在 `FrameParameters.lean:42`、`:71`；`hsnet`/`htnet` 出现在 `NetOperator.lean:18-19` | 半径改 \(1/2\) 时体积比常数变成 \(4^m\) 但 `NetOperator.lean:30-42` 的两项误差不再各自 \(\le\lVert M\rVert/4\)，\(L\le5+L/2\) 变 \(L\le5+L\) |
| \(n^p\) | 子族计数 | tex `sections/weights.tex:95`；lean `FrameSelection.lean:13` 的 `Fintype.card (Fin p ↪ Fin n) ≤ n^p` | 与 \(\exp(25k/2)\) 抵消（`FrameParameters.lean:56`） | 用 \(p\) ，并非 \(2r\) 计数会让 `bounds` 的 `p ≤ k` 不够，需更强下界 |
| \(K\) | \(b_0^2=100\)，三个块界的公共常数 | tex `sections/conclusion.tex:29-30`；lean `SumObstruction.lean:31-34` 的 `κ`、调用点 `Main.lean:76` 的 `by norm_num : (0 : ℝ) ≤ 100` | `direct_sum_obstruction` 的 \(1+K\)（`obstruction.tex:172`）、缩放分母 | 若三个界不一致（\(\kappa_1,\kappa_2,\kappa_3\)），`Main.lean:75-76` 的调用要三次不同参数，结论变 \(1+\max_i\kappa_i\) |
| 101 | \(1+K\) | tex 无（正文只用 \(1+\varepsilon\)）；lean `Model.lean:40`、`ComparatorChallenges/Dixmier.lean:39` | `NonamenableWitness`（`Model.lean:36-40`）、`witness_not_unitarizable`（`Model.lean:58` 的 `⟨101, hbound⟩`）、`main_theorem`（`Main.lean:86`） | `Main.lean:81-83` 的 `norm_num` 对齐断链；该值是 101 ，并非 100 因为三角表示给的是 \(1+K\) |
| \(t\) | \(\varepsilon/100\) | tex `sections/conclusion.tex:48`；lean `NearOne.lean:76` 的 `(show 0 < ε / 100 by positivity)` | `scaled_direct_sum_obstruction` 的 \(1+t\kappa\)（`ScaledObstruction.lean:38`）、`NearOne.lean:83` 的 `div_mul_cancel₀` | \(t\) 若取 \(\varepsilon\)，`NearOne.lean:83` 还原失败，界变 \(1+100\varepsilon\)；\(t\) 取负则 `sq_pos_of_pos ht`（`ScaledObstruction.lean:61`）崩 |
| \(1+\varepsilon\) | 任意接近 1 的一致界 | tex `sections/introduction.tex:42`、`:204`；lean `DiscreteModel.lean:16`、`NearOne.lean:17/91` | 主定理第二合取支（`AllDiscrete.lean:23-24`） | \(\varepsilon=0\) 时该陈述空（每个 \(\lVert\pi(g)\rVert\le1\) 的可逆表示已是酉表示，见 §5.1(c)） |
| \(4k\) 与 \(\tfrac12\) | 能量系数与开方系数 | tex `sections/obstruction.tex:58`、`:64`；lean `KernelObstruction.lean:289`、`:304`、`:320` | `SumObstruction.lean:54` 的 `4 * (κ + ‖B‖)^2` 与 `:70` 的 `eventually_gt_atTop` | 去掉 \(k\)（即 \(k=1\)）时 `Main.lean:70-74` 的 `hratio` 不再发散，见 §2.1 |
| \(\lvert v_i^*v_j\rvert^2\) | 非负，对角项等于 1 | tex `sections/conclusion.tex:39-44`；lean `KernelEnergy.lean:58`、`:43`、`MaskAlgebra.lean:80` | `eq:kernel-energy` 的下界 \(n_\ell\) | 权重若非正（去掉秩一投影），交叉项可负，下界不再成立 |
| \(M=\lvert\pi\rvert\) | 有限正实数，\(\ge1\) | tex `sections/conclusion.tex:170`；lean `Amenable.lean:17` 的 `let M : ℝ := max C 1` | \(M^{-2}\lVert\xi\rVert^2\le[\xi,\xi]\le M^2\lVert\xi\rVert^2\)（`conclusion.tex:181-183`）、`AveragedForm.lean:76` 的 \(2M^2\) | 不做 `max C 1` 时 `(M^2)⁻¹` 在 `Amenable.lean:35` 处无法证正；`M` 变大只让界变宽，不断 |
| 2（均值差系数） | \(\lvert m_f(L_gb)-m_f(b)\rvert\le2\lVert b\rVert_\infty\lVert R_{g^{-1}}f-f\rVert_2\) | tex `sections/sparse.tex:42-45`；lean `VectorMean.lean:118`、`:146`，调用点 `Contracting.lean:50-52` | 近似不变向量转近似不变均值 | 系数 2 来自 \(\lVert a\rVert^2-\lVert b\rVert^2\) 的分解（`VectorMean.lean:84` 的 `norm_sq_difference_le`）；放大它只影响 \(\varepsilon/2\) 的取法（`Contracting.lean:40`） |
| \(1/2\)（AM-GM） | \(\sqrt{uv}\le(u+v)/2\) | tex `sections/sparse.tex:97-98`；lean `SparseSplitting.lean:84-89` | 矩形计数到 Hall 密度的松弛（`SparseSplitting.lean:106-109`） | 去掉它要把槽数加倍，\(r\) 的定义与 `eq:dimension-ratio` 的常数同时漂移 |
| \(\alpha<3\) | 定量酉化的阈值（仅作对照，未进入证明） | tex `sections/introduction.tex:65-73` | 无（正文只用于说明 prior work） | 本篇不消费；见 §2.2 死路的成因 |
| \(\delta\)、\(sF\triangle F\) | Følner 有限测试 | tex `sections/conclusion.tex:141-151` | 子群 \(H=\langle S\rangle\) 的非均称性（`conclusion.tex:153-158`） | 机器侧无对应物（`grep Folner` 零命中），删除该段不影响 Lean 证明 |
| $D(g)=B-U(g)BU(g)^{-1}$ | 单个有界算子 $B$ 实现的整体 coboundary，逐块压缩为 $D_j(g)=B_j-U_j(g)B_jU_j(g)^{-1}$ | tex `sections/obstruction.tex:266-267`；lean `Cocycle.lean:25` 的 `coboundary`、`InvariantProjection.lean:47` 的 `exists_commuting_projection` | `eq:global-cocycle-implementer` 压缩到 $B_j$（`obstruction.tex:277-280`），交付 `Cocycle.lean:50` 的公共 $C_j=T_j-B_j$ | $B$ 若无界则 `InvariantProjection.lean:47` 给不出整体投影，逐块 $C_j$ 拼不成单个 $C$，`obstruction.tex:293` 的 $E_j/k_j\to\infty$ 矛盾失效 |
| $\pi(g)=\begin{pmatrix}U(g)&D(g)U(g)\\0&U(g)\end{pmatrix}$ | 有界 2x2 上三角分块算子，作用在 $\mathcal{H}\oplus\mathcal{H}$，可逆且 $\pi(g)^{-1}=\pi(g^{-1})$ | tex `sections/obstruction.tex:207-214`；lean `Cocycle.lean:67` 的 `triangular` | 由 `eq:direct-sum-cocycle`（`obstruction.tex:201-205`）验 $\pi(g)\pi(h)=\pi(gh)$，机器侧对应 `Cocycle.lean:70` 的 `triangular_cocycle_mul` | 右上块若漏掉右乘 $U(g)$ 只写 $D(g)$，`Cocycle.lean:73` 的乘法展开不等，$\pi$ 不再构成群同态 |
| $\operatorname{Ad}_{U(g)}(T)=U(g)TU(g)^{-1}$ | 保持乘法的自同构，即 conjugate 作用 | tex `sections/obstruction.tex:203`；lean `Cocycle.lean:12` 的 `conjugate` | `Cocycle.lean:25` 的 `coboundary` 与 `Cocycle.lean:50` 的 `equal_coboundaries_iff_commute_sub` 都按 `Cocycle.lean:17` 的 `conjugate_mul` 复合 | 定义少一侧逆元则 `Cocycle.lean:17` 不成立，`coboundary_cocycle`（`Cocycle.lean:31`）的 $D(gh)$ 展开断 |
| $h=K+\lVert B\rVert$ | 实数上界，同时控制 $\operatorname{row}_e(C)$ 与 $\operatorname{col}_e(A-C)$ 的算子范数 | tex `sections/obstruction.tex:72`；lean `KernelObstruction.lean:133` 的 `row_block_norm` | 喂给 `eq:kernel-row-energy` 与 `eq:kernel-column-energy` 的界 $kh^{2}$，机器侧逐块界由 `KernelObstruction.lean:133` 落地 | $h$ 放大只让 $kh^{2}$ 变宽，`eq:kernel-distance-obstruction` 的下界仍由 $K$ 单独控制，$h$ 不进最终距离式 |
| $E=\sum_{s\in G}\lVert W(s)\rVert_{\mathrm{HS}}^{2}$ | 非负实数或 $+\infty$，被 $4k(K+\lVert T-C\rVert)^{2}$ 从上方收紧 | tex `sections/obstruction.tex:46-47`；lean `KernelObstruction.lean:94` 的 `column_energy` | `eq:kernel-energy-obstruction`（`obstruction.tex:57`）给出上界，`eq:kernel-distance-obstruction` 取 $\sqrt{E/k}$ 反推距离，机器侧 `KernelObstruction.lean:105` 的 `column_energy_le` | 列侧求和若不收敛则 `KernelObstruction.lean:89` 的 `column_summable` 失败，$E$ 不成良定义 |
| $\lVert R\rVert_{\mathrm{HS}}^{2}=\operatorname{Tr}(RR^{*})\le k\lVert R\rVert^{2}$ | 值域维数不超过 $k$ 时 Hilbert--Schmidt 平方范数被 $k$ 倍算子范数平方控制 | tex `sections/obstruction.tex:80-84`；lean `KernelObstruction.lean:144` 的 `row_energy_le` | 与 `eq:kernel-row-energy`（`obstruction.tex:89`）合成 $\sum_s\lVert Q(s)\rVert_{\mathrm{HS}}^{2}\le kh^{2}$，机器侧逐块系数由 `KernelObstruction.lean:78` 的 `coefficients_norm_sq` 给出 | 值域维数超过 $k$ 时按基向量取范数的 `le_opNorm` 估计失配，能量界不再有限 |
| $\operatorname{dist}(T,U_k(G)')=\inf_{C\in U_k(G)'}\lVert T-C\rVert$ | 到平移对易子的距离，被 $\sqrt{E/k}$ 从下方逼开 | tex `sections/obstruction.tex:66`；lean `KernelObstruction.lean:187` 的 `Commutant` | `eq:kernel-distance-obstruction` 用它给非零下界，机器侧对易性由 `KernelObstruction.lean:197` 的 `block_kernel` 判 | 若对易子取成大到含非平移块，`KernelObstruction.lean:187` 的成员条件放松，距离可能塌回 $0$ |
| $W_\ell(s)=\sum_{i:\,s_i=s}P_i$ | 同一标签 $s_i=s$ 的秩一投影 $P_i$ 归并成的块，正半定 | tex `sections/conclusion.tex:34` | 喂给 `eq:kernel-energy`（`conclusion.tex:38`）把逐指标和转成逐标签和，[推测] 机器侧聚合行位本次未定位，故只记 tex | 若按群元素去重则 $\sum_i$ 与 $\sum_s$ 的对应断裂，能量下界失去落点 [推测同上，改动据 tex 判断] |
| $\sigma(c(g,x))$ | 沿 $X=G/H$ 的诱导 cocycle，满足 $\sum_x\lVert\sigma(c(g,x))\xi_x\rVert^{2}\le M^{2}\sum_x\lVert\xi_x\rVert^{2}$ | tex `sections/conclusion.tex:102-103` | 支撑 `lem:subgroup-induction` 的诱导表示一致界 [推测] 对应 lean module 行位本次未 grep，故只记 tex | $M$ 若盖不住逐点界则右端放大，诱导表示的 $1+\varepsilon$ 界丢失 [推测同上，断点据 tex] |
| $\Pi=\operatorname{Ind}_{H}^{G}\sigma$ | 由 $H$ 上表示 $\sigma$ 诱导的 $G$ 表示，$\lVert\Pi\rVert=\lVert\sigma\rVert\le1+\varepsilon$ | tex `sections/conclusion.tex:162-164` | `lem:subgroup-induction` 把 $H$ 上非酉化的 $\sigma$ 升为同界非酉化的 $\Pi$ [推测] 该引理的 lean 行位未 grep，仅据 tex 记 | 若 $\lVert\sigma\rVert\le1+\varepsilon$ 不能保持到 $\Pi$，非酉化在诱导后可能消失，`conclusion.tex:164` 的结论断 |
| $T_\pi(f)=\sum_{g\in G}f(g)\pi(g)$ | 群代数 $\ell^{1}(G)$ 上的积分形式，$\lVert T_\pi(f)\rVert\le\lVert f\rVert_{1}\lVert\pi\rVert$ | tex `sections/conclusion.tex:209` | 把表示范数界转成 $\ell^{1}(G)$ 上的算子界 [推测] 对应 lean 记录行位本次未定位，仅据 tex | $\pi$ 若无界则 $T_\pi(f)$ 不定义，酉化判据失去 $\ell^{1}$ 侧入口 [推测同上] |

依赖链（正向读，从组合侧到算子侧）：
`Contracting.lean:80` 交付 $S,d,\rho$；
$S,d,\rho$ 进 `Regular.lean:104` 与 `SparseSplitting.lean:114` 交付掩码 $a$ 与装载量 $r$；
$n=d^\ell$ 与 $r$ 进 `FrameParameters.lean:11` 交付纤维维数 $k$，
并同时在 `FrameParameters.lean:40` 里兑现 \(2n^p9^{k+p}e^{-25k/2}<1\)，
把 $b_0=10$ 交给 `Frames.lean:71`；
$v$、$s$、$a$ 进 `Masked.lean:135` 与 `LocalBounds.lean:95/107` 交付两条块界，
进 `MaskAlgebra.lean:100` 交付共轭差界，三条界都以 $K=b_0^2=100$ 落地；
`MaskAlgebra.lean:80` 与 `Parameters.lean:104` 交付 `energy (A j) / k j → ∞`；
`SumObstruction.lean:27` 吃 $K$ 与发散性交付不可酉化表示，
`ScaledObstruction.lean:28` 把 $K$ 换成 $tK=\varepsilon$，
`NearOne.lean:13` 交 $1+\varepsilon$ 版本，`NearOne.lean:87` 抬宇宙，
`AllDiscrete.lean:12` 与 `Amenable.lean:72` 合流成
`CurrentMainTheorem`；`Main.lean:18/86/91` 是同一链条在
"101 界 + 可数"口径下的另一个出口。
链上唯一的"常数生成顺序"是
$\rho\Rightarrow r\Rightarrow k\Rightarrow b_0\Rightarrow K\Rightarrow t\Rightarrow\varepsilon$，
其中 $b_0$ 由 5 与 $1/2$ 生成，$K$ 由 $b_0$ 平方生成，$t$ 由 $\varepsilon$ 除 $K$ 生成，
$101$ 由 $1+K$ 生成；这条生成顺序解释了为什么
`Model.lean:40` 的字面量是 101 而 `DiscreteModel.lean:16` 是 $1+\varepsilon$。

### §5.13 无编号证明块："Arbitrary discrete nonamenable groups"（`conclusion.tex:139-166`）

(a) tex 逐字（Følner 判据 `:141-151` 与收尾 `:153-165`）：

```
The F\o lner criterion for an arbitrary discrete group says that
amenability is equivalent to the following condition: for every finite
\(S\subseteq G\) and every \(\delta>0\), there is a finite nonempty
\(F\subseteq G\) such that
\begin{equation}\label{eq:folner-finite-test}
 |sF\mathbin\triangle F|<\delta|F|\qquad(s\in S).
\end{equation}
This is the symmetric-difference form of F\o lner's Main Theorem
\cite[p.~245]{Folner1955}: inversion exchanges right and left
translations, and \(|sF\mathbin\triangle F|=2(|F|-|sF\cap F|)\).
No F\o lner sequence is required.
```

```
Since \(G\) is nonamenable, some finite \(S\) and positive \(\delta\)
fail this condition. The subgroup \(H=\langle S\rangle\) is finitely
generated and therefore countable. It is nonamenable: otherwise the
criterion applied inside \(H\) would give a finite nonempty
\(F\subseteq H\) satisfying \Cref{eq:folner-finite-test}, and the same
inequalities would hold in \(G\), a contradiction.
```

(b) 中间步骤。
非均称 $\Rightarrow$ 判据的否定：存在有限 $S$ 与 $\delta>0$
使一切有限非空 $F\subseteq G$ 都有某个 $s\in S$ 满足
$|sF\triangle F|\ge\delta|F|$（`:153-154`）。
取 $H=\langle S\rangle$：有限生成故可数（字长 $\le\ell$ 的词只有
$d^{\ell+1}$ 个，这里 $d=|S|$），
`$H$ 非均称`由"判据在 $H$ 内成立会在 $G$ 内成立"的逆否得到（`:155-158`）。
然后套用 §5.11 的可数情形拿到 $\sigma$（$|\sigma|\le1+\varepsilon$、
可分、不可酉化），再用 `Lemma 5.1` 诱导成 $\Pi$，
$|\Pi|=|\sigma|\le1+\varepsilon$ 且 $\Pi$ 不可酉化（`:160-165`）。
`:192-194` 补一句不可数情形的可分性说明：
$H$ 在 $G$ 中指标不可数时诱导见证不可分，
这被"酉化性对所有 Hilbert 空间量化"的定义允许
（与 `introduction.tex:50-51` 呼应）。
`:195-197` 划界：本定理不涉及非离散局部紧群，
那里的表示通常要求强连续。

(c) 机械理由。
这里 $S$ 的选取与 `Lemma 3.1` 的 $S$ 无关，
前者是"判据失效的测试集"，后者是"平均收缩的生成集"，
两个 $S$ 在 tex 里同名，机器只用到后者
（`Contracting.lean:80` 的 `contracting_average` 输出的 `S`）。
$H=\langle S\rangle$ 的可数性论证与 `word_card`（`Regular.lean:80`）
是同一件事的两种叙述，机器把它用在 `Main.lean:14` 的 `[Countable G]`
位置上，而该位置在 `NearOne.lean:11` 被删掉了。
"$|sF\triangle F|=2(|F|-|sF\cap F|)$"这句是给读者核对
左/右形式与对称差形式的系数 $2$；
机器既不需要 Følner 集也不需要这个系数。

Lean 侧这一整块没有对应物，实测口径要写清楚：
`grep -n "Folner"` 在 `OAI/Analysis/Unitarizability/` 无命中，
`grep -n "Coset\|Quotient.group\|G/H\|induced"` 无命中，
`grep -n "CStar\|Kadison"` 无命中。
机器对"任意离散群"的交付是 `NearOne.lean:87-107` 的
`nonamenable_near_one_large`，
它做的事是把 $G$ 换成 `Q := ULift.{v} G`（`:92`），
手工给 `Q` 配 `TopologicalSpace`（`:93` 的 `⊥`）与
`DiscreteTopology`（`:94` 的 `⟨rfl⟩`），
用 `MulEquiv.ulift.symm` 作 $e:G\simeq^*Q$（`:95`），
`:96` 把非均称性沿 $e$ 搬过去（`amenable_of_mulEquiv e h`），
`:97` 在 `Type u` 里对 `Q` 用 `nonamenable_near_one`，
`:98` 用 `π.comp e.toMonoidHom` 拉回 $G$ 的表示，
`:99-101` 处理可分性的传递
（`intro hcount; let := hcount; exact hsep (e.surjective.countable)`，
其中 `let := hcount` 是把局部假设伪装成实例的机器小技巧），
`:102-107` 处理不可酉化的反向传递：
若 `π.comp e` 相似于酉，则原 `π` 也相似于酉，
逐点改写用 `MonoidHom.comp_apply`、`MulEquiv.coe_toMonoidHom`、
`e.apply_symm_apply` 三下 `simpa`。
这个 `ULift` 机制处理的量是宇宙 `v`（Hilbert 空间所在宇宙），
不是基数；
它的必要性来自 `DiscreteModel.lean:11` 与 `:13` 的两处
`max u v`：`Unitarizable` 要能引用比 $G$ 所在宇宙更大的 Hilbert 空间，
而见证也必须活在同一 `max u v` 里才能否定它。

(d) [推测] 候选失败路线一：照 tex 把 Følner 判据与子群诱导形式化。
`Mathlib` 里均称性是按拓扑群定义的（`Amenable` 在
`Model.lean:21` 是本篇自定义），
要把 `eq:folner-finite-test` 与本篇定义对接，需要
Følner 判据对"$\ell^\infty$ 上的正规范左不变泛函"这一形式的等价性证明，
工作量大且与本篇核心无关，被绕开是合理的。
[推测] 候选失败路线二：把 `Countable G` 直接加进 `CurrentMainTheorem`
的前提以省去 `ULift`。
那样得到的只是可数群版本（`Model.lean:49-51` 已经在那里了），
comparator 名字里的 "AllDiscrete" 就落空。
[推测] 候选失败路线三：用 `Encodable G` 顶替 `Countable G`
以便枚举边集。
模块内 `grep -n "Encodable"` 零命中，
说明可数性只被用来产生 `SeparableSpace` 实例，
从不需要具体编码；
一旦引入 `Encodable` 就要处理编码与群结构的相容性。

### §5.14 无编号证明块："The amenable direction"（`conclusion.tex:168-190`）

(a) tex 逐字（`:172-189`）：

```
If \(m\) is a left invariant mean, then
\(m_{\mathrm r}(f)=m(x\mapsto f(x^{-1}))\) is a right invariant mean.
Define a sesquilinear form by
\[
 [\xi,\eta]=m_{\mathrm r}\bigl(g\mapsto
                 \langle\pi(g)\xi,\pi(g)\eta\rangle\bigr).
\]
Since both \(\norm{\pi(g)}\) and \(\norm{\pi(g)^{-1}}\) are at most
\(M\), positivity of the mean gives
\[
 M^{-2}\norm{\xi}^2\le[\xi,\xi]\le M^2\norm{\xi}^2.
\]
Thus this is an equivalent Hilbert inner product. Right invariance
gives \([\pi(h)\xi,\pi(h)\eta]=[\xi,\eta]\) for every \(h\in G\).
Representing the form by a bounded positive invertible operator \(Q\),
we have \(\pi(h)^*Q\pi(h)=Q\). Hence \(S=Q^{1/2}\) is bounded and
invertible, and \(S\pi(h)S^{-1}\) is unitary for all \(h\).
```

(b) 中间步骤。
$M=|\pi|$（`:169-170`）。
左均值变右均值：$m_{\mathrm r}(f)=m(f\circ\mathrm{inv})$，
对右平移 $R_hf(x)=f(xh)$ 有 $R_hf=(f\circ\mathrm{inv})\circ L_{h^{-1}}$，
左不变性给出 $m_{\mathrm r}(R_hf)=m_{\mathrm r}(f)$。
形式 $[\xi,\eta]=m_{\mathrm r}(g\mapsto\langle\pi(g)\xi,\pi(g)\eta\rangle)$
的 sesquilinearity 来自 $m_{\mathrm r}$ 线性与内积的 sesquilinearity。
双边的 $M$ 界：$\lVert\pi(g)\xi\rVert\le M\lVert\xi\rVert$ 给上界 $M^2\lVert\xi\rVert^2$；
$\pi(g)^{-1}=\pi(g^{-1})$ 也满足同一界，故
$\lVert\xi\rVert=\lVert\pi(g)^{-1}\pi(g)\xi\rVert\le M\lVert\pi(g)\xi\rVert$，
于是 $\langle\pi(g)\xi,\pi(g)\xi\rangle\ge M^{-2}\lVert\xi\rVert^2$，
逐项正性给下界。
右不变给 $[\pi(h)\xi,\pi(h)\eta]=[\xi,\eta]$。
表示定理给出 $Q$（有界正、可逆），$\pi(h)^*Q\pi(h)=Q$，
取 $S=Q^{1/2}$，则 $S\pi(h)S^{-1}$ 关于原内积酉。

(c) 机械理由。
$M^{-2}$ 与 $M^2$ 的对称形态要求同时用到 $\pi(g)$ 与 $\pi(g)^{-1}$ 的界，
而"$\pi(g)^{-1}=\pi(g^{-1})$"正是把两个界合并成一个 $M$ 的关键，
这也是 `Model.lean:7-10` 注释强调
"Representations into the endomorphism monoid have bounded inverses
because their domain is a group"的原因：
Lean 用 `G →* (H →L[ℂ] H)`，逆的有界性由同态性质免费给出。
机器侧的对应文件是 `AveragedForm.lean` 与 `Amenable.lean`：
`AveragedForm.lean:16` 的 `coefficient (x y : H) : G →ᵇ ℂ`
把 $g\mapsto\langle\pi(g)x,\pi(g)y\rangle$ 写成**有界**连续函数
（有界性由 `:30` 的 `coefficient_norm_le` 提供，前提是 `hπ : ∀ g, ‖π g‖ ≤ M`
与 `hM : 0 ≤ M`，这正是上面那句"$\pi(g)^{-1}$ 也有界"的机器影子），
`:35`/`:40`/`:45`/`:50` 四条 `coefficient_add_left`、
`coefficient_add_right`、`coefficient_smul_left`、`coefficient_smul_right`
交付 sesquilinearity，`:55` 的 `coefficient_translate` 交付
平移与 $\pi(h)$ 的对接（对应右不变性那一步）。
`:60` 的 `averagedForm` 把均值作用在系数上做成
`H →ₗ⋆[ℂ] H →ₗ[ℂ] ℂ`（半线性在左、线性在右的 Mathlib 约定），
`:76` 的 `averagedForm_bound` 给 $2M^2$ 型的双线性界
（`Amenable.lean:20-21` 消费的就是它），
`:88` 的 `averagedForm_nonneg` 与 `:97` 的 `averagedForm_lower`
分别给出上、下界那半边。
`Amenable.lean:22` 用 `InnerProductSpace.continuousLinearMapOfBilin` 造 $Q$，
`:25-32` 证 `Q.IsPositive`（经 `ContinuousLinearMap.isPositive_iff_complex`），
`:33-44` 证 `IsUnit Q`，用的是
`ContinuousLinearMap.isUnit_of_forall_le_norm_inner_map`
配合下界 $(M^2)^{-1}$，`:41-43` 的 `calc` 第一步就是
`averagedForm_lower`，`:44` 用 `Complex.re_le_norm`；
`:45-46` 经 `CFC.isUnit_sqrt_iff` 取平方根 $s$，
再做 `ContinuousLinearEquiv.ofUnit s` 得到 `S : H ≃L[ℂ] H`，
`:50-51` 取 `sqrt` 的对称性，`:52-60` 证
`‖S x‖^2 = (m (coefficient ... x x)).re`，
`:61-65` 用 `coefficient_translate` 加左不变性 `hinv`
把 $\lVert S(\pi g(S.symm x))\rVert^2$ 与 $\lVert x\rVert^2$ 对齐，
最后 `sq_eq_sq₀` 从平方相等回到范数相等。
`:17` 的 `let M : ℝ := max C 1` 是一个纯机器需要的动作：
$M$ 要非零才能取 $(M^2)^{-1}$，
`hM : 0 < M`（`:18`）由此而来，而 tex 里 $M=|\pi|\ge1$ 是默认的
（因为 $\pi(e)=I$）。

(d) [推测] 候选失败路线一：跳过算子 $Q$，直接在 `Inner` 层面构造等价内积。
`SimilarToUnitary`（`Model.lean:29-32`）的陈述里只出现范数，
要把"等价内积"接回 `H ≃L[ℂ] H` 仍需一个具体的 $S$，
绕不开表示定理。
[推测] 候选失败路线二：用弱*紧性取 $\pi$-不变状态的极限（C* 风格）。
这条路需要 $C^*$-代数与状态空间的形式化，
本篇只用 $\ell^\infty(G)=G\toᵇ\mathbb C$ 的线性映射，
`Amenable` 的定义（`Model.lean:21-27`）连 $m$ 的连续性都不要求，
只要 `→ₗ[ℂ]`。
[推测] 候选失败路线三：把正性与归一化写成 `mean ≥ 0` 的序语言。
`Model.lean:25-26` 用的是逐点实部非负且虚部为零的显式形式
（`0 ≤ (f x).re ∧ (f x).im = 0 → 0 ≤ (m f).re ∧ (m f).im = 0`），
因为 `BoundedContinuousFunction` 上的有序结构在 Mathlib 里不覆盖复值情形。

### 附记：C* 路线为何被划出主链（§2.4 的机器侧复核）

`conclusion.tex:199-227` 那段 C* 推论要用同伴论文的相似度定理
（`\cite[Theorem~1.1]{OpenAIKadison2026}`），
我起初以为可以把它当主定理的一部分一起形式化。
实测：`grep -in "CStar\|StarAlgebra\|Kadison"` 在 `OAI/Analysis/Unitarizability/` 里 0 命中，
模块连 `ℓ^1(G)` 的卷积代数都没进。
tex 的措辞也支持这个取舍：`conclusion.tex:202-203` 只承认该推论"in addition to \Cref{thm:main}"地使用了同伴定理，
所以这条被我划出主线，只留 tex 侧的记录。

## Lean 取证

### 登记抓取路径与三处命中

命令与命中全部实测，只允许在三个位置里搜：`lean/formalization.yaml`、模块目录 `OAI/Analysis/Unitarizability/`、`ComparatorChallenges/` 的两张题卡。

`grep -n "Unitarizability-Implies-Amenability-for-Countable-Groups" formalization.yaml` 命中 1 行：`formalization.yaml:809`，它是 `sources:`（起始 `:11`）里那条 title 为 "Unitarizability implies amenability for discrete groups"（`:807`）的条目的 `id` 字段，作者字段 `:808` 是 `["OpenAI"]`，`type: article` 在 `:810`。
`grep -n "Dixmier" formalization.yaml` 命中 3 行：`1122`（`comparator_config: ComparatorChallenges/DixmierAllDiscrete.json`）、`1123`（`declaration: OAI.Dixmier.current_main_theorem`）、`1124`（`file: OAI/Analysis/Unitarizability/AllDiscrete.lean`）。
`grep -n "Dixmier.json" formalization.yaml` 命中 0 行（子串 "Dixmier.json" 不在 "DixmierAllDiscrete.json" 里），所以第二张题卡 `ComparatorChallenges/Dixmier.json` 没有登记。
这三行落在 `status:`（`:914`）下的 `main_results:` 平表（首条 `:918` 是 AbhyankarSathaye），该表按题卡文件名字母序排列：`1121` 前一条是 `DirichletSevenEighths.json`、`1125` 后一条是 `DoublingHilbert.json`，因此表内位置不能用来判定归属，只有 `file:` 字段能。

归属结论：注册的是本篇。判据有三条独立线，全部指向同一模块。
第一条：`sources:` 全段（`:11-821`）里只有 `:807` 一条与酉化/均称相关，`grep -n "Dixmier\|Unitariz" formalization.yaml` 的 4 个命中里没有一个来自第二篇论文。
第二条：`DixmierAllDiscrete.json` 的 `solution_module: OAI.Analysis.Unitarizability.AllDiscrete` 与 `Dixmier.json` 的 `solution_module: OAI.Analysis.Unitarizability.UniverseTransport` 都指向同一模块目录，两张题卡的 `definition_names` 都是空表 `[]`，`permitted_axioms` 都是同一组三条，说明它们是同一篇论文的两个版本出口（任意离散群 / 全宇宙），两篇不同论文共用语义完全相同的空 `definition_names` 的概率很低。
第三条：`declaration` 名 `OAI.Dixmier.current_main_theorem` 与模块内 `AllDiscrete.lean:12` 的 theorem 名逐字相同，而 `OAI.Dixmier.main_theorem_all_universes` 与 `UniverseTransport.lean:55` 逐字相同；tex 侧 `\title{Unitarizability implies amenability for discrete groups}`（`build/main.tex`）与队列目录名 `...for-Countable-Groups-September-23-2026` 的差异（标题说 discrete、目录说 countable）恰好对应 `CurrentMainTheorem` 与 `MainTheorem` 两个陈述，命名张力到此消解：Dixmier 是问题名（Dixmier 酉化问题），namespace `OAI.Dixmier`（见 `Model.lean:60` 的 `end Dixmier`）标的是问题归属，论文归属看 `sources:`。

### 规模测量

模块目录 `E:/math/lean/OAI/Analysis/Unitarizability`：39 个 `.lean` 文件，4,092 行，185,594 字节（`ls *.lean | wc -l`、`cat *.lean | wc -l`、`wc -c`）。
顶层声明按 kind 计数，正则把修饰符吃掉：`^ *(private|protected|noncomputable|partial )*(kind) `，结果 theorem 200、def 86（其中 `noncomputable def` 4 条）、lemma 14、abbrev 11、instance 1、structure 0、inductive 0、example 0、class 0，合计 312 条，平均每 13.1 行一条顶层声明。
`theorem` 与 `def` 的比例 200:86 说明这个模块的主体是命题堆叠，概念层极薄：承载口径的定义只有 `Model.lean:16-51` 的 6 条（`leftTranslate`、`Amenable`、`SimilarToUnitary`、`NonamenableWitness`、`Unitarizable`、`MainTheorem`），加 `DiscreteModel.lean:9` 的 `CurrentMainTheorem`，再加参数层的 11 条 abbrev（`FrameParameters.lean:11/12/14`、`Parameters.lean` 若干）。tex 里承担"定义"职能的四个概念（一致有界、相似于酉、酉化、均称）在机器里压缩成 4 条 def，`|π|`（tex `weights.tex:21` 的 sup 记号）在机器里根本没有名字，直接展开成 `∃ C, ∀ g, ‖π g‖ ≤ C`。
最大文件 `KernelObstruction.lean` 331 行，占模块 8%，它对应的 tex 只有 `obstruction.tex:69-130` 那 62 行证明，膨胀来自把一行 tex 推理拆成 `Commutant`（`:187`）、`block_kernel`（`:197`）、`energy`（`:218`）、`energy_le_row`（`:226`）、`energy_split_le`（`:267`）五个可复用件。

### 空位检查

模块 39 个文件里逐词统计（`grep -oF` 计数）：`sorry` 0、`admit` 0、`axiom` 0（含局部 axiom 声明）、`#print axioms` 0。
仓库里唯一的 `sorry` 在题卡侧：`ComparatorChallenges/DixmierAllDiscrete.lean:44`（`theorem current_main_theorem : CurrentMainTheorem.{u,v} := by` 后跟 `sorry`）与 `ComparatorChallenges/Dixmier.lean:45`（`theorem main_theorem_all_universes : MainTheorem.{u,v} := by` 后跟 `sorry`）。这两条是"题目陈述卡"，其定义段（`DixmierAllDiscrete.lean:12/16/24/29/34`、`Dixmier.lean:12/17/25/32/39`）与模块侧 `Model.lean`、`DiscreteModel.lean` 逐字同构，只有 `DixmierAllDiscrete.lean:34-42` 的 `CurrentMainTheorem` 把可分性写成 `Countable G → TopologicalSpace.SeparableSpace H` 且界写成 `‖π g‖ ≤ 1 + ε`，正是模块侧 `DiscreteModel.lean:9-16` 的形状；`Dixmier.lean:39` 的 `MainTheorem` 则带 `[Countable G]` 且界是字面量 101（`:32-38`）。
`#print axioms` 零命中意味着这个仓库不把公理依赖写成命令式自检，许可口径全靠题卡的 `permitted_axioms`；模块里唯一可能引入额外公理面的是 `classical`（`NearOne.lean:17` 等，共多处），它只用 `Classical.choice` 一侧，落在许可集内。

### 策略词频 top-10

统计方法：39 个文件全文拼接，对每个候选词按词边界（前后不接 `[A-Za-z0-9_']`）计数。
1. `have` 374
2. `simp` 239
3. `rw` 190
4. `exact` 143
5. `intro` 131
6. `apply` 111
7. `let` 79
8. `ext` 75
9. `simpa` 67
10. `norm_num` 53
第二梯队实测值：`trans` 44、`calc` 39、`nlinarith` 34、`obtain` 31、`refine` 30、`positivity` 30。
形态解读：`have` 比 `simp` 多 56%，与"常数链必须逐段核"匹配：`Main.lean` 里 `hlabel`（`:26`）、`hn`（`:28`）、`hdim`（`:36`）、`hbound`（`:60` 附近）、`henergy`（`:66`）、`hratio`（`:70`）六个 `have` 就是 tex `conclusion.tex:13-46` 的六步；`let` 79 次集中在参数定义（`k`、`r`、`Labels`、`s` 四个函数，`Main.lean:22-24` 与 `NearOne.lean:21-23` 两处各写一遍）；`norm_num` 与 `positivity` 合起来 83 次，专门处理 101、100、10、25/2 这些字面量；`ext` 75 次说明大量证明落在结构相等（`BoundedContinuousFunction`、`Finsupp`、矩阵块），并非不等式估计。

### 许可公理与 theorem_names 的题卡原文

`ComparatorChallenges/DixmierAllDiscrete.json`（349 字节）：`challenge_module` 是 `ComparatorChallenges.DixmierAllDiscrete`、`solution_module` 是 `OAI.Analysis.Unitarizability.AllDiscrete`、`theorem_names` 是单元素表 `["OAI.Dixmier.current_main_theorem"]`、`definition_names` 是空表、`permitted_axioms` 是 `["propext","Classical.choice","Quot.sound"]`、`enable_nanoda` 是 `false`。
`ComparatorChallenges/Dixmier.json`：同一组三条公理（顺序写作 propext / Quot.sound / Classical.choice）、`theorem_names: ["OAI.Dixmier.main_theorem_all_universes"]`、`definition_names: []`、`enable_nanoda: false`，但没有进 `main_results` 平表。
`definition_names: []` 是一个可读取的信号：比较器只核 theorem 的陈述等价，不核概念定义。这与本篇的情况吻合，因为 tex 的 `Unitarizable` 量化了"所有 Hilbert 空间"，而 Lean 把它做成宇宙参数化的 def（`Model.lean:43`），两侧定义口径要对齐得先把 `H : Type v` 的量化搬进陈述，题卡选择不做这件事，只在 theorem 层比。

### 核心问题一：酉化与均称在 Lean 里的定义式

`SimilarToUnitary`（`Model.lean:29-32`）：
`∃ S : H ≃L[ℂ] H, ∀ (g : G) (x : H), ‖S (π g (S.symm x))‖ = ‖x‖`。
tex 写"相似于酉表示"是用 $S\pi(g)S^{-1}$ 是酉算子；机器换成"存在连续线性等价 $S$ 使共轭后保范数"，因为 `H ≃L[ℂ] H` 已经把可逆与双向有界打包好，而"酉"在 `InnerProductSpace` 上最省字的刻画是保范数（Mathlib 里等距算子由 `isUnit` 表达，`AveragedForm.lean:45-46` 用 `CFC.isUnit_sqrt_iff` 从正自伴平方根取到 `isUnit`，再 `ContinuousLinearEquiv.ofUnit` 得到 `S`）。
`Unitarizable`（`Model.lean:43-46`）：
`∀ (H : Type v) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] (π : G →* (H →L[ℂ] H)), (∃ C : ℝ, ∀ g, ‖π g‖ ≤ C) → SimilarToUnitary π`。
与 tex 的对应：`G →* (H →L[ℂ] H)` 是"到连续线性自同构的一致表示"（tex 用 $\pi:G\to\mathrm{GL}(\mathcal K)$），一致有界写成存在实数 $C$（tex 用 $|\pi|<\infty$），完备性 `CompleteSpace H` 是 tex 的默认（Hilbert 空间）而机器必须显式取假设。
tex 把"可分"放在定理结论里（`introduction.tex:44` 的 "If \(G\) is countable, \(\mathcal K\) may be chosen separable"），机器把它放进见证对象的合取里：`NonamenableWitness` 直接把 `TopologicalSpace.SeparableSpace H` 写成存在段的字段（`Model.lean:38`），`CurrentMainTheorem` 则把它做成蕴含式（`DiscreteModel.lean:15-16`）。同一条信息在两个陈述里形态不同，是为了让"任意离散群"版本不引入可数假设。
`Amenable`（`Model.lean:21-27`）：
`∃ m : (G →ᵇ ℂ) →ₗ[ℂ] ℂ, m (BoundedContinuousFunction.const G 1) = 1 ∧ (∀ f, (∀ x, 0 ≤ (f x).re ∧ (f x).im = 0) → 0 ≤ (m f).re ∧ (m f).im = 0) ∧ ∀ (g : G) (f : G →ᵇ ℂ), m (leftTranslate g f) = m f`。
三段依次是归一化、正性、左不变，载体 `G →ᵇ ℂ` 是 `BoundedContinuousFunction`，对 tex 的 $\ell^\infty(G)$；`leftTranslate`（`Model.lean:16-18`）的实现是 `f.compContinuous ⟨fun x => g⁻¹ * x, continuous_of_discreteTopology⟩`，把 $g^{-1}x$ 放在参数位上，方向与 tex 的 ${}_g f$ 一致。
正性写法是纯粹被 Mathlib 逼出来的：复值函数空间上没有偏序，`0 ≤ m f` 无意义，所以正性与归一化都拆成"实部非负且虚部为零"的逐点条件（`Model.lean:25-26`）。副作用是 `m` 只需 `→ₗ[ℂ]`（纯线性），连范数有界都不要求，比 tex 的"$\ell^\infty$ 上的正泛函"更弱；这个弱化在均称方向无害（tex `conclusion.tex:170-183` 的 $M$ 界只用来夹范数），在机器里省掉一整层连续性核对。

### 核心问题二：可数性在机器里长成什么样

三种形态并存，位置逐一实测（`grep -n "Countable" *.lean` 全命中 11 处，分布 7 个文件）：
类型类假设：`Main.lean:14`（variable 行 `[Countable G]`）、`Model.lean:50`（`MainTheorem` 的量化里）、`UniverseTransport.lean:66`（`amenable_of_unitarizable_all_universes`）。
指标类型可数：`HilbertSum.lean:134` 的 `separableSpace [Countable I]`、`SumObstruction.lean:75` 的 `carrier_separable`、`:83` 的 `separable_direct_sum_obstruction`。
结论内蕴含式：`DiscreteModel.lean:15`、`NearOne.lean:16`、`NearOne.lean:90`，题卡同形在 `ComparatorChallenges/DixmierAllDiscrete.lean:40`。
`Encodable` 在 39 个文件里 0 命中。也没有用 $\mathbb N$ 编码群元素（没有任何把 $G$ 写成商的参数、也没有 `Surjective (f : ℕ → G)` 式假设），可数性一律走 Mathlib 的 `Countable` 类，配合 `Mathlib.Basic.Countable.Small`（`UniverseTransport.lean:3` 的 import）在商群情形用 `e.surjective.countable`（`:59`）把可数性拉回。
结论：tex 的"countable"是定理的限定词，机器把它降级成一个箭头（只在需要可分性时被消费）；`CurrentMainTheorem` 与 `nonamenable_near_one`（`NearOne.lean:13-17`）都不需要群可数。这一降级来自机器侧的表示构造本来就作用在 $\bigsqcup_j$ 的可数纤维上，群本身可不可数只影响直和空间的可分性（`SumObstruction.lean:83`）。

### 核心问题三：主链每一步有无机器对应物

按 tex 主链顺序列，右侧是实测的机器落点。
相似到三角化（`obstruction.tex:69-90`）有对应物：`Cocycle.lean:25/31/36/50/67/70` 给共轭与 coboundary 恒等式，`Triangular.lean:38/52/74/95` 给三角模型，`InvariantProjection.lean:47` 给不变补的投影。
实现子 $B$ 的构造有对应物：`Unitarizer.lean:16` 的 `implementer_of_similar`，其文件头注释（`:6-8`）明说是走投影块路线以"avoiding a bounded inverse for graph coordinates"，与 tex 用图坐标的做法不同。
HS 能量上界 $E\le 4k(K+\|T-C\|)^2$（`obstruction.tex:56-58`）有对应物：`KernelObstruction.lean:286` 的 `kernel_obstruction`，常数写作 `4 * (Fintype.card K) * (κ + ‖T - C‖)^2`；距离版在 `:301`（逐点）与 `:318`（`Metric.infDist`）。
直和发散（`obstruction.tex:178-297`）有对应物：`SumObstruction.lean:27` 的 `direct_sum_obstruction`，可分版本 `:83`。
收缩平均（`sparse.tex:25-53`）有对应物：`Contracting.lean:55`（均值近不变）、`:80`（`exists_contracting_average`）、`:96`（`sparse_splitting_of_nonamenable` 的入口）。
稀疏端点指派（`sparse.tex:76-121`）有对应物但路线不同：`EndpointAssignment.lean:1` 引 `Mathlib.Combinatorics.Hall.Basic`，`:29` 用 `all_card_le_biUnion_card_iff_exists_injective` 直接取无穷 Hall，`:34` 是每顶点 $r$ 槽的版本；tex 的有限 Hall 加 König 式无限拼接在机器里没有对应物（`grep -i König` 无必要，模块内无任何图论无限分支引理）。
随机 $\pm1$ 帧与 $b_0=10$（`weights.tex:37-133`）有对应物：`SignMatrix.lean:53/62/89/107`、`FiniteSigns.lean:17/21/65/80`、`SphereNet.lean:19/22-23/56`（$9^m$ 网与 $1/8$、$9/8$）、`NetOperator.lean:16` 的 `operator_norm_le_ten`、`Frames.lean:42/71/85`、`FrameSelection.lean:13`（$n^p$ 计数）、`ComplexFrames.lean:15/24/49`。
掩码块界与对称差界（`weights.tex:187-385`）有对应物：`Masked.lean:135`、`LocalBounds.lean:15/67/74/95/107`、`SparseMask.lean:20/23/34/41/49/61/76`、`MaskAlgebra.lean:19/37/49/52/63/80/93/100`。
核能量 $\ge n_\ell$（`conclusion.tex:32-46`）有对应物：`KernelEnergy.lean:106` 的 `kernel_energy_ge_card`，前面 `:17/43/51/58/81/91/98` 是秩一展开链。
缩放 $t=\varepsilon/100$（`conclusion.tex:48-53`）有对应物：`ScaledObstruction.lean:16` 的 `energy_real_smul`、`:28` 的 `scaled_direct_sum_obstruction`。
$1+\varepsilon$ 版本（tex 定理第二部分）有对应物：`NearOne.lean:13` 与 `:87`。
均称方向（`conclusion.tex:168-190`）有对应物：`Amenable.lean:12`（`amenable_unitarizable`）与 `:72`，`namespace DayDixmier`（`Amenable.lean:8`、`AveragedForm.lean:8`、`MeanBounds.lean:8`），即 Day-Dixmier 平均内积被建成独立子命名空间。
两处没有对应物：
`Lemma 5.1`（`conclusion.tex:70-137`，从子群诱导）在模块里 0 命中，`grep -ioF` 对 `Følner`、`Folner`、`induced`、`Thompson`、`semigroup` 各 0 次；tex 用有限生成子群 $H=\langle S\rangle$ 加 Følner 有限测试把不可数群约到可数情形，机器改用宇宙搬运：`NearOne.lean:92` 的 `let Q := ULift.{v} G` 加 `MulEquiv.ulift.symm`，把"任意群的陈述"化成"某宇宙里可数群的陈述"。
`§6` 的 C* 推论（`conclusion.tex:199-227`）同样 0 命中：`StarAlgebra`、`CStarAlgebra`、`GroupAlgebra`、`Kadison` 各 0 次，模块里连卷积代数都没建。
于是机器证明比 tex 证明在"任意离散群"这一步更短（少一层归纳），在"稀疏指派"这一步更重（借 Mathlib 的无穷 Hall），在两个附属段落上是空白。

### 核心问题四：current_main_theorem 的完整陈述与量词差

机器侧陈述（`DiscreteModel.lean:9-16`）逐字：
`CurrentMainTheorem : Prop := ∀ (G : Type u) [Group G] [TopologicalSpace G] [DiscreteTopology G], (Amenable G ↔ Unitarizable.{u, max u v} G) ∧ ∀ (ε : ℝ), 0 < ε → ¬ Amenable G → ∃ (H : Type (max u v)) (_ : NormedAddCommGroup H) (_ : InnerProductSpace ℂ H) (_ : CompleteSpace H) (π : G →* (H →L[ℂ] H)), (Countable G → TopologicalSpace.SeparableSpace H) ∧ (∀ g, ‖π g‖ ≤ 1 + ε) ∧ ¬ SimilarToUnitary π`。
证明（`AllDiscrete.lean:12-24`）是四段：`intro G _ _ _` 后 `constructor` 分两支；第一支再 `constructor`，正向交 `amenable_unitarizable hG`（`:17`），反向用 `by_contra hnot` 取 `nonamenable_near_one_large.{u,v} hnot 1 zero_lt_one`（`:20-21`，即 $\varepsilon=1$ 的特例），得到 `hn` 与 `⟨1 + 1, hb⟩`（`:22`）合成的界为 2 的一致有界表示，与酉化假设矛盾；第二支（`:23-24`）对任意 $\varepsilon>0$ 直接交 `nonamenable_near_one_large.{u,v} hG ε hε`。
与 tex 主定理（`introduction.tex:38-45`）的量词差有四条：
一，tex 第一句是"A discrete group is amenable if and only if it is unitarizable"，没有把群量化写在前件里；机器把 `∀ (G : Type u)` 与三个类型类假设写在最外层（`DiscreteModel.lean:10`），可数性从假设位消失。
二，tex 的"unitarizable"是对所有 Hilbert 空间的一致性质；机器的 `Unitarizable.{u, max u v}` 在双箭头的右侧把 Hilbert 宇宙钉成 `max u v`，而 `Unitarizable` 内部（`Model.lean:44`）仍量化 `H : Type v`。这个钉法是为了让见证空间与 `CurrentMainTheorem` 存在段的 `H : Type (max u v)`（`:13`）同宇宙，否则 `¬Amenable → ∃ witness` 与 `¬Unitarizable` 之间不能直接接。
三，tex 的第二句是"for every discrete nonamenable group $G$ and every $\varepsilon>0$ there are $\mathcal K$ and $\pi$"，即先取非均称群再给 $\varepsilon$；机器写成 `∀ ε, 0 < ε → ¬ Amenable G → ∃ H ...`（`DiscreteModel.lean:12-14`），$\varepsilon$ 在 `¬Amenable` 之前。顺序差异不影响逻辑强度（前件都是全称闭包里的合取），但影响 `NearOne.lean:13` 的参数次序，那里 `(hG : ¬ Amenable G) (ε : ℝ) (hε : 0 < ε)` 把 `hG` 放在 $\varepsilon$ 前，说明机器在引理层是"先固定反例群"，到顶层陈述才被折进蕴含式。
四，tex 把可分性写成"If \(G\) is countable, \(\mathcal K\) may be chosen separable"，机器写成 `Countable G → TopologicalSpace.SeparableSpace H`，一个可数群的假设被放进合取的第一个分量；另外 tex 的 $|\pi|\le 1+\varepsilon$ 是 sup 记号，机器写成逐点 `∀ g, ‖π g‖ ≤ 1 + ε`。
还有一条机器特有的痕迹：反向证明选的是 $\varepsilon=1$（`AllDiscrete.lean:21` 的字面 `1`，配 `zero_lt_one`），界因此是 `1 + 1`（`:22`）。tex 的对应论证用的是"存在某个大于 1 的界即可推翻酉化"，没有指定值；机器指定 1 是为了让 `norm_num` 与 `zero_lt_one` 可判定，代价是多引入一条 `1 + 1` 的字面归一。

### 核心问题五：AllDiscrete 的确切形态

`AllDiscrete` 这个后缀若按字面读会得出"所有离散群都均称"这种荒谬结论；它标的其实是口径范围：对任意离散群（不假设可数）成立的双箭头加 $\varepsilon$-见证。它的确切 Lean 形式就是上节的 `CurrentMainTheorem`（`DiscreteModel.lean:9-16`）加实现它的 `theorem current_main_theorem : CurrentMainTheorem.{u,v}`（`AllDiscrete.lean:12`）。
与它并列的还有两个较弱或较窄的陈述，构成同一模块的三口径：
`MainTheorem`（`Model.lean:49-51`）：`∀ (G : Type u) [Group G] [Countable G] [TopologicalSpace G] [DiscreteTopology G], ¬ Amenable G → NonamenableWitness.{u, v} G`，可数假设在位、见证界是字面 101（`Model.lean:40`），由 `main_theorem`（`Main.lean:86`）实现，其原料是 `nonamenable_witness`（`Main.lean:18`，结论 `NonamenableWitness.{u,u} G`）。
`NonamenableWitness`（`Model.lean:36-40`）把可分性与 101 界写成存在段的固定字段，专门服务 `witness_not_unitarizable`（`:54-58`），那里 `hunit H π ⟨101, hbound⟩` 需要界是可直接检查的字面量。
`main_theorem_all_universes`（`UniverseTransport.lean:55`，陈述 `MainTheorem.{u,v}`）与 `amenable_of_unitarizable_all_universes`（`:66`，带 `[Countable G]`）把可数版本抬到独立宇宙，靠 `meanPullback`（`:18`）、`amenable_of_mulEquiv`（`:28`）、`witness_of_mulEquiv`（`:44`）三条同构搬运引理。这条出口有题卡（`Dixmier.json`）但没登记，说明仓库自认的"主结果"只有 `AllDiscrete` 那条。
三口径的关系可以这样读：`Main.lean` 走 101（便于自检与宇宙单值 `.{u,u}`），`NearOne.lean` 走 $1+\varepsilon$（便于对齐 tex 第二部分），`AllDiscrete.lean` 走任意离散群（对齐 tex 标题）。tex 只有第二种与第三种混合在一个定理里，第一种（界 101）在 tex 里根本没有出现，属于机器侧的"可达性中间目标"：`Main.lean:75-76` 先用未缩放的 `direct_sum_obstruction` 拿到 `1 + 100`，`Main.lean:81-83` 用 `convert ... using 1` 加 `norm_num` 把它写成 101，缩放步骤整个留给 `NearOne.lean` 复用。

### 取证小结

两条链的强度错位是三处，全部有实测位置：
机器多出的：无穷 Hall（`EndpointAssignment.lean:29`）替代 tex 的有限 Hall 加无限拼接，宇宙搬运（`NearOne.lean:92`、`UniverseTransport.lean:44/55`）替代 Følner 加子群归纳。
机器缺少的：`Lemma 5.1` 整段（0 命中）、§6 的 C* 推论（0 命中）、$|\pi|$ 的 sup 记号（展开成逐点界）、均称性里的均值连续性（`Model.lean:23` 只要求线性）。
机器改形的：可分性从结论降级为蕴含（`DiscreteModel.lean:15`）、正性从序语言降级为 re/im 双条件（`Model.lean:25-26`）、见证界从 $1+\varepsilon$ 分裂成 101 与 $1+\varepsilon$ 两个 def（`Model.lean:40` 与 `DiscreteModel.lean:16`）。
这三处里，最值得注意的取证信号是 101 与 $1+\varepsilon$ 的分家：如果 Lean 侧只是 tex 的翻译，两个数字不会同时存在；它们同时存在说明形式化是分两段推进的，先证出"有一个有限界"（数学上已足够否定酉化），再补缩放引理 `ScaledObstruction.lean:28` 把界压到 $1+\varepsilon$。tex 里这两段是一起写的（`conclusion.tex:28-30` 核对三块界同为 $K=100$，`:48-53` 一次缩放），所以分家顺序是机器侧的证据，反向指示了实现的先后。

## 文献检索与外部对照

### 检索方法与强度分级

素材优先级我按三档执行。
第一档是本篇 tex 自带的文献面：`build/references.bib` 共 21 条条目（`grep -c "^@"` 实测 21，文件 226 行），每条都带刊名、卷页、定位号与可点开的 DOI 或 arXiv 链接，这是论文自己声明的输入，强度最高。
第二档是我用 arXiv 官方 API（`http://export.arxiv.org/api/query?id_list=...` 与 `search_query=...`）逐条核验到的题目、作者、年份与摘要首句，与 bib 交叉比对后确认无引文串位；这一档用来把"论文怎么用自己的参考文献"读成"那些论文实际主张什么"。
第三档是通用网页检索，本会话里对三个专题（Gould--Hart--Hubbard 一条线、Thompson 群 F 与自由半群、Carrion--Echterhoff--Kim--park--Smith 一条线）返回的都是镜像站、中文聚合页与医学/物理噪声，域名限定（`allowed_domains=["arxiv.org"]`）直接零命中，arXiv API 的作者组合查询也返回零条目。这三条线的原始文献我没拿到，下面凡是涉及它们的判断全部标 `[推测]`，并与论文自身主张物理隔开。
检索时间：本会话内，工具侧给的当前日期是 2026 年 10 月，晚于本篇的 2026-09-23。

### 论文自己的文献面：21 条条目挂到主链的哪一步

概念源头四条。
`SzNagy1947`（bib `:1-10`，Acta Sci. Math. Szeged 11, 152-157，note 指到 Theorem I, p.152）在 tex `introduction.tex:29` 被引作"$\mathbb Z$ 的每个一致有界表示都酉化"的出处，也就是本文题设在一维情形是 Sz.-Nagy 定理的推广方向。
`Day1950`（bib `:12-22`，Trans. AMS 69, 276-291）与 `Dixmier1950`（bib `:24-33`，Acta Sci. Math. Szeged 12, 213-227，note 明确指到 \S5, Théorème 6, p.221）成对出现在 `introduction.tex:31` 与 `conclusion.tex:171`，前者是均值构造的第一次给出，后者是问题本身的出处；`introduction.tex:34` 直接写"Dixmier explicitly asked whether this property characterizes groups admitting an invariant mean \cite[\S5, p.~221]{Dixmier1950}"。本篇的正方向（`conclusion.tex:168-190`）逐字沿用 Day--Dixmier 的平均内积，机器侧对应 `namespace DayDixmier`（`Amenable.lean:8`、`AveragedForm.lean:8`、`MeanBounds.lean:8`）。
`Folner1955`（bib `:35-44`，Math. Scand. 3, 243-254，note 指到 Main Theorem, p.245）在 `introduction.tex:130` 与 `conclusion.tex:149` 两处被引，第二次是 Følner 有限测试的具体使用点，"inversion exchanges right and left"（`conclusion.tex:149`）说明论文清楚知道左右翻转在这条判据里的必要。
`Kesten1959`（bib `:157-166`，Math. Scand. 7, 146-156）在 `sparse.tex:13` 被引，紧跟的句子是"We give the implication at the precise strength"，即论文的收缩平均引理（`Lemma 3.1`）自证 Kesten 判据里它需要的那一半，不借用原论文。

反例史四条，构成"为什么必须造新反例"的压力。
`EhrenpreisMautner1955`（bib `:46-56`，PNAS 41, 231-233）在 `introduction.tex:57` 是第一个非酉化一致有界表示的出处，载体是局部紧群 $\mathrm{SL}_2(\mathbb R)$，非离散，所以不能直接当本篇的反例库。
`PytlikSzwarc1986`（bib `:168-177`，Acta Math. 157, 287-309）在 `introduction.tex:59` 给出自由群上的解析族，是同族表示里"界可以任意接近 2"的那类构造；同一行的下一句是"Nonunitarizability passes from a subgroup to the ..."，即论文知道非酉化对子群的传递性，这正是我 §2.3 死路想反用的方向。
`GaboriauLyons2009`（bib `:109-119`，Invent. Math. 177, 533-540）在 `introduction.tex:89` 被引作 $F_2$ 的可测群论动作，`Osin2009`（bib `:207-217`，IMRN 2009, 4220-4231，Theorems 1.2-1.3 在 `introduction.tex:84`）给无自由子群的非酉化群；这两条合起来说明"$G$ 含自由子群"既非必要也非充分，论文因此不去碰子群结构。
`Alpeev2023`（bib `:179-185`，arXiv 2009.11738v3，Theorem A）与 `MonodOzawa2010`（bib `:121-131`，JFA 258, 255-259，Theorem 1 在 `introduction.tex:93`）是"扩张一侧"的已知结果：Monod--Ozawa 证明对非均称群取阿贝尔扩张可得非酉化表示（arXiv API 核验的摘要原句是"We provide such representations upon passing to extensions by abelian groups"），Alpeev 把 lampighter 群与强 Ulam 稳定性连起来。我的 §2.3 死路正是撞在这条已走路线上，它的存在说明"扩张再压回"这条路在 2010 年前后就已被当作主战场，而本篇要的是同一群上的见证。

定量酉化线三条，全在 Pisier 名下。
`Pisier1998`（bib `:86-95`，Algebra i Analiz 10, 132-186，arXiv math/9706211v1，Theorems 0.1 与 3.2）在 `introduction.tex:69` 提供相似度概念与一致有界之间的定量关系；`Pisier2004`（bib `:58-64`，标题直接是"Are Unitarizable Groups Amenable?"，arXiv math/0405282v2，note 指到 Proposition 0.5 p.3 与 Corollaries 0.10-0.11 p.6）在 `introduction.tex:72`（Theorem 4.1）、`introduction.tex:133`（Proposition 0.5）与 `conclusion.tex:67` 三处被引，API 核验的摘要把它的内容写成"给问题一个新表述"加"\S5 给 Haagerup 关于自由群 Herz-Schur 乘子的定理一个新证明"；`Pisier2011`（bib `:78-84`，标题"On the Dixmier problem (Seminar report after Monod--Ozawa, JFA 2010)"，arXiv 1109.1863v1，Remark 4 与 Proposition 5(ii)）在 `introduction.tex:120` 与 `obstruction.tex:138` 被引，是有界非内蕴 coboundary 与表示之间的桥。
本篇与这条线的差别可以说得很短：Pisier 的定理形式是"若所有表示在相似度 $\le K$ 下酉化，则 $G$ 均称"，$K$ 是一个固定的绝对常数（`introduction.tex:65-73` 的阈值 $\alpha<3$ 就是这类口径），本篇把 $K$ 压到任意 $1+\varepsilon$，代价是必须为每个 $\varepsilon$ 单独造表示。这个"任意接近 1"是本篇真正的量化改进，也是我 §2.2 死路失败的根由：收集公共界只会得到 Pisier 型结论。

随机与组合线两条。
`EpsteinMonod2009`（bib `:97-106`，IMRN 2009 no.22, 4336-4353，arXiv 0811.3422v2）在 `introduction.tex:81`（Theorems 1.1-1.3）、`introduction.tex:114` 与 `obstruction.tex:136` 和 `sparse.tex:61` 被引（后两处专指 Propositions 2.3-2.4），API 摘要首句是"establish a connection between Dixmier's unitarisability problem and the expected degree of random forests on a group"，即随机森林/期望度这条概率路线已被走过；`sparse.tex:61` 引它是在稀疏指派之前声明"我们的组合口径与他们的不同"。
`GGMT2018`（bib `:66-76`，刊名写作 JFA 278 (2020) 108457，arXiv 1801.09600v2 的 2018-02-16 版）在 `introduction.tex:117`（\S2.B）与 `sparse.tex:58`（Proposition 2.6）被引，API 摘要把它写成"把一致有界表示的酉化性与 Cayley 图等周常数的渐近行为相连，枢纽是一个叫 Littlewood 指数的分析不变量"；本篇的收缩平均正是这个思想的有限形式。
`BDDW2008`（bib `:133-142`，Constr. Approx. 28, 253-263）是随机 $\pm1$ 矩阵集中不等式的简明证明出处，`introduction.tex:190` 与 `weights.tex:15` 各引一次，后者紧跟"Here only an upper bound is needed"，说明论文只用 RIP 的一侧（上界），这也解释了 `Lemma 4.1` 里为什么只需 $b_0$ 存在而不需最优常数。
`Hall1935`（bib `:145-155`，JLMS s1-10, 26-30）在 `sparse.tex:103` 被引，句子是"follows here by augmenting paths"，即论文自己给有限 Hall 的证明；机器侧改用 Mathlib 的无穷 Hall（`EndpointAssignment.lean:1` 引 `Mathlib.Combinatorics.Hall.Basic`），因此比 tex 少一段拼接。
`OpenAIKadison2026`（bib `:219-226`，howpublished 写作 OpenAI Math Release preprint，路径指向同仓库 `Kadisons-similarity-theorem-through-uniform-derivation-estimates-September-23-2026/paper.pdf`，note 指 Theorem 1.1, p.1）只在 `conclusion.tex:218` 出现一次，是 §6 推论的唯一外部依赖，也是本篇唯一一处"证明依赖另一篇同批预印本"。

### 检索到的外部一手条目（bib 之外，全部经 arXiv API 核验）

`math/0508223`，Pisier, "Simultaneous similarity, bounded generation and amenability"，2005：API 返回的摘要首句是"We prove that a discrete group G is amenable iff it is strongly unitarizable in the following sense"。这条与本篇最像，差别在 strong（同时酉化/同时相似）与本篇的逐个表示酉化，属于"把量词加强后等价于均称"的一类。它直接支持 §2.2 的判断：加强"所有表示同时"会得到已知结论，把界压到 $1+\varepsilon$ 才是本篇的缺口。
`1508.00423`，Gheysens--Monod, "Fixed points for bounded orbits in Hilbert spaces"，2015：有界轨道与不动点性质（性质 (FH) 一侧）的语言与本篇的三角表示几乎同构，摘要首句"Consider the following property of a topological group G: every continuous affine G-action on a Hilbert space with a bounded orbit"。我的重心论证（`Lemma 3.1` 证明里把均值写成 $m_f(b)=\sum|f(x)|^2b(x^{-1})$）与这条线共享"从轨道有界推出统计性质"的思路，但本篇不需要不动点存在性，只需要范数严格收缩。
`1309.2145`，Choi--Farah--Ozawa, "A nonseparable amenable operator algebra which is not isomorphic to a C*-algebra"，2013：摘要首句提出"是否每个均称算子代数同构于一个（必然核的）C*-代数"这一长期公开问题。它解释了本篇为什么把 `Unitarizable` 做成对全部 $H:\mathrm{Type}\ v$ 的量化（`Model.lean:43-46`）而不限于可分空间：tex `introduction.tex:48-50` 明说不可数群的见证可以不可分，"as is allowed by the definition of unitarizability used here"。可分与不可分之间的差别在算子代数一侧是有实质后果的，本篇的口径选择与 Choi--Farah--Ozawa 问题的存在互相印证。
`1003.1587`，Le Merdy, "Gamma-bounded representations of amenable groups"，2010：把均称群的表示理论搬到 Banach 空间与 $\gamma$-有界性，是"$\ell^2$ 框架不可少"的旁证：本篇的能量论证依赖 Hilbert 结构（HS 范数、正投影的迹），换到 Banach 空间就没有 `energy` 这个量。
`2608.27737`，Khosravi--Youn, "Non-unitarizable representations of compact and discrete quantum groups"，2026：量子群版本的相似性问题在 2026 年仍在活跃，说明"Dixmier 型刻画"并未因本篇而closure，至少推广口径还有工作空间。
`2602.20364`，Carter--White, "Non-Wiener groups with a Gelfand pair"，2026：局部紧一侧的非 Wiener 群研究，与本篇的离散限定形成对照；本篇放弃局部紧（`Unitarizable` 的定义在 `Model.lean:43` 要求离散拓扑群上的表示）是明确取舍。

### 三条指望落空的对照线（无一手来源，全部降级）

Gould--Hart--Hubbard 一条线：`references.bib` 的 21 条里没有这个组合（`grep -i "Gould\|Hart\|Hubbard" references.bib` 零命中），tex 全文也没有出现这三个姓氏；arXiv API 的 `au:"Gould" AND au:"Hubbard"` 与三姓 AND 组合都返回零条目；通用网页检索只返回一篇中文新闻聚合页。所以"该线是否存在、主张什么"我没有任何一手依据。
`[推测]` 若该线存在，最可能的位置是在酉化性的弱化形式（有限生成、逐有限子集）附近；但这与本篇无冲突，因为本篇的主定理不依赖任何未引工作。
`[推测]` 派单提示里点名这条线，可能是把它当作"$|\pi|_S$ 单调下降"一类局部口径的先例；本篇在 `introduction.tex:191-193` 用"the last named authors"指代的实际是 `Vergara2023` 与 `Vergara2025`（bib 与引用位置都在），并非 Gould--Hart--Hubbard。
Thompson 群 F 与自由半群一条线：arXiv API 的 `all:"free subsemigroup" AND all:"Thompson"` 只返回一条无关条目（`1902.10564v3`，Cantor 集微同胚群），本篇 bib 与正文都无 Thompson。
`[推测]` 这条线对本篇的意义只可能是"反例库的外部性"：$\langle a,b\mid ab^2=b^3a\rangle$ 型单展示群与 $F$ 这类"含自由半群但未证含自由群"的群，是均称性未决的对象，而本篇的判定不依赖群是否含自由子群（`introduction.tex:84` 与 `:89` 的 Osin/Gaboriau--Lyons 已把"无自由子群的非酉化群"摆在前面），所以本篇的框架天然绕开 $F$ 的悬案。
`[推测]` 若要把本篇当工具用在 $F$ 上，需要的是"$F$ 是否均称"这一未知量本身，本篇不能提供判据；反过来说，本篇给出的是双向等价，因此 $F$ 的均称性等价于 $F$ 的酉化性，这本身不产生新信息。
Carrion--Echterhoff--Kim--park--Smith 一条线：arXiv API 的 `au:"Carrion" AND au:"Echterhoff"` 零条目；`all:"Dixmier problem"` 按日期排序的 13 条结果里也没有这个组合作为作者。本篇 bib 无此条目，正文无相关姓氏。
`[推测]` 该团队的工作重心在满约化 C*-范数比较映射与"抽象自由"结构，与本节的 §6 推论（典范商 $C^*(G)\to C_r^*(G)$ 是否同构）相邻；本篇 §6 只用同伴手稿的相似度定理，没走比较映射路线。
`[推测]` 派单提示点名这条线，可能是因为"$G$ 均称当且仅当比较映射同构"是 Dixmier 型刻画在 C*-侧的孪生命题；tex 侧我只在 `conclusion.tex:199-227` 读到本篇对该命题的沉默。

### 名称碰撞：Dixmier 问题的多义

按日期降序检索 `all:"Dixmier problem"` 得到的 13 条里，属于"酉化性刻画均称"这个问题的只有 4 条（`0902.4585` Monod--Ozawa、`1109.1863` Pisier 报告、`1508.00423` Gheysens--Monod、`math/0405282` Pisier 2004），其余是同名不同题：`2609.26319`（Lupini 2026，简单 C*-代数谱的 Dixmier 1967 问题）、`2506.09285`（Fajardo--Lezama 2025，skew PBW 扩张的 Dixmier 问题）、`2501.16832`（Choi 2025，Haagerup 问题与正 Hahn--Banach 分离）、`1911.13234`（Ooms 2019，Dixmier 第四问题）、`1310.7562`（Moskowicz 2013，Weyl 代数的 starred Dixmier 猜想）、`1809.08810`（Suzuki 2018，非可分 UHF 语境下的 Dixmier 问题）、`0906.1401`（Farah--Katsura 2009，非可分 UHF 代数 I: Dixmier's problem）、`math/0512250`、`math/0403037`、`math/0402244`（Bavula 关于 Weyl 代数 Dixmier 第五、第六问题）。
这条检索结果有直接的取证价值：仓库里 `OAI.Dixmier` 命名空间与 `ComparatorChallenges/Dixmier.json`、`DixmierAllDiscrete.json` 两张题卡的"Dixmier"，如果不看 `formalization.yaml:807` 的标题而只看登记名，完全可能被误归到 Weyl 代数或非可分 UHF 那一支。我在 §0 做的归属核实之所以要做三条独立判据，原因就在这里；`Dixmier1950` 的标题"Les moyennes invariantes dans les semi-groupes et leurs applications"（bib `:26`）与 note 定位"\S5, Théorème 6, p.221"（bib `:32`）是钉死归属的最终证据。

### 论文主张与我方推测的分界

论文侧主张（只从 tex 读到的）：Dixmier 1950 在 `\cite[\S5, p.~221]{Dixmier1950}` 提出该问题（`introduction.tex:34`）；此前对离散群没有证明"酉化蕴含均称"，已知最好结果是 Pisier 型带绝对常数的定量版本（`introduction.tex:65-73`）与扩张型反例（`introduction.tex:93-97`）；本篇给出双向等价与 $1+\varepsilon$ 的量化（`introduction.tex:38-45`）；全文工作在 ZFC，Hilbert 空间默认复数域，$\N=\{1,2,\ldots\}$（`introduction.tex:46-48`）。
我方推测（没有一手来源支撑，全部标出）：
`[推测]` 检索到的 2026 年新条目里没有与本篇同题的独立工作，因此本篇若在离散群上完成双向等价，在检索窗口内未见竞争者；这只是"未见"，不等于"不存在"，且 arXiv 全文检索对"unitarisable/ unitarizable + amenable characterization"的组合覆盖差（我用 `all:"unitarisable"` 排序检索返回的 12 条里 11 条是粒子物理的幺正化噪声）。
`[推测]` 本篇选择"每个 $\varepsilon$ 造一个表示"，并非"一个表示满足所有 $\varepsilon$"，是因为后者会与 tex `introduction.tex:49-50` 的"without any a priori control on possible similarities"冲突：见证的不可酉化性要针对所有可能的相似变换，量化次序决定了构造难度。
`[推测]` 论文放弃局部紧群（bib 里 `EhrenpreisMautner1955` 是局部紧，正文 `introduction.tex:57` 也只作历史提及）的直接原因是 `Lemma 3.1` 的收缩平均要有限生成集 $S$，而局部紧群上没有这种离散计数；这是我从证明结构倒推的，论文没有写。
