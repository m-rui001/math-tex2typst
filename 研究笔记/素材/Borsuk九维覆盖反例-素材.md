# 《A nine-dimensional counterexample to Borsuk's covering assertion》单篇素材

来源：论文 tex 源码（`E:/math/preprints/A-nine-dimensional-counterexample-to-Borsuks-covering-assertion-September-23-2026/build/`，main.tex + preamble.tex + sections/ 7 个文件 + figures/ 3 个 tikz 文件，共 1303 行，2026-09-23）、Lean 形式化 `E:/math/lean/OAI/Geometry/Borsuk/`（269 个 .lean 文件，78,964 行）、比较器 `E:/math/lean/ComparatorChallenges/BorsukNine.json` + `BorsukNine.lean`（34 行 stub）+ `formalization.yaml`（第 117–120 行书目条目、第 970–972 行形式化条目）、typst 转换副本 `E:/math/typst/A-nine-dimensional-counterexample-to-Borsuks-covering-assertion-September-23-2026/main.typ`（474 行，含扁平定理编号 19 个定理环境与 411 条公式，可与 tex 交叉印证编号与措辞）。公式一律按 tex 原样转写。PDF 加密不可读，禁止 pdftotext，正文只以 tex 为准。

**本篇无公开思维链 summary**：`E:/math/reasoning_traces/` 下的 10 篇论文（含 `trace_utf8.txt`，其 "Borsuk–Ulam" 字样属于自由群因子同构一篇）没有 Borsuk 篇；因此下文中所有 [推测] 失败路线均为基于文本证据（论文措辞、figure 的 tikz 源码、Lean 代码的平行结构与机器生成痕迹）的重构，使用时需更加谨慎。

写作约定：定理编号采用 tex 的分节编号（Theorem 1.1、Lemma 2.1 等），并在索引表中给出 typst 扁平编号对照（typst 中 Theorem 1.1 即 main typ 第 28 行的 `#thm([Theorem 1.1.])`，Corollary 19 = 高维推论）。所有 [推测] 标注的证据来源在括号内注明（措辞/图形/Lean）。

## 一、定理与构造总览

### 1.1 主定理与摘要的 TeX 原文照抄

摘要（`build/main.tex` 第 11–16 行，原文照抄）：

> The compact set of rank-one orthogonal projectors on $\mathbb R^4$,
> with the Frobenius metric, cannot be covered by ten sets of strictly
> smaller diameter. It therefore gives a counterexample to Borsuk's
> conjecture in dimension nine.

主定理（`sections/introduction.tex` 第 18–26 行，Theorem 1.1，标签 `thm:main`，原文照抄）：

> \begin{theorem}\label{thm:main}
> The compact set
> \[
>  X=\{uu^{\mathsf T}:u\in\mathbb R^4,\ \|u\|=1\}
>  \subset\{A\in\operatorname{Sym}_4(\mathbb R):\operatorname{tr}A=1\},
> \]
> with the Frobenius metric, has diameter $\sqrt2$ and cannot be covered
> by ten subsets of diameter strictly less than $\sqrt2$.
> \end{theorem}

问题背景与全文口径（`sections/introduction.tex` 第 4–9 行，原文照抄）：

> Borsuk's partition problem asks whether every bounded set of positive
> diameter in $\mathbb R^d$ can be covered by $d+1$ subsets of strictly
> smaller diameter. For a bounded set $Y$ of positive diameter, write $b(Y)$ for the least
> number of such subsets needed to cover $Y$. Covers and partitions give
> the same number: overlaps may be removed without increasing diameters.
> We prove that $b(Y)>10$ for a compact set in $\mathbb R^9$.

定理后的自我限定（`sections/introduction.tex` 第 28–33 行，原文照抄）：

> Thus Borsuk's assertion fails in dimension nine. The theorem does not
> determine the smallest dimension in which it fails
> or the exact value of $b(X)$. Its witness is the full compact projector
> image of real projective three-space. Corollary~\ref{cor:higher-dimensions}
> extends the construction to compact counterexamples in every dimension
> $d\geq9$.

高维推论（`sections/conclusion.tex` 第 22–26 行，Corollary 7.1 = typst 扁平编号 19，标签 `cor:higher-dimensions`，原文照抄）：

> \begin{corollary}\label{cor:higher-dimensions}
> For every integer $d\geq9$, there is a compact subset of $\mathbb R^d$
> of diameter $\sqrt2$ that cannot be covered by $d+1$ subsets of
> strictly smaller diameter.
> \end{corollary}

### 1.2 主定理措辞逐条解释（为什么每个词都长这样）

1. **"compact set"**：$X$ 是紧集，因为它是单位球面 $S^3$（紧）在连续映射 $u\mapsto uu^{\mathsf T}$ 下的像（Lemma 2.1 证明里明确写 "A continuous injection from the compact space $\mathbb P(V)$ into a Hausdorff space is a homeomorphism onto its image"；Lean 侧 `isCompact_projectorSet` 就是 `isCompact_sphere … .image continuous_projector`）。紧性在全文有两处实质用途：(i) Lemma 2.4 的开覆盖需要有限子覆盖与从属于它的 smooth partition of unity；(ii) 直径在紧集上可达（Lean 的 `compact_diam_lt` 用 `exists_isMaxOn` 把"逐对 < d"升为"diam ≤ d"，供反方向的 `admissible_to_cover` 用）。
2. **"rank-one orthogonal projectors on $\mathbb R^4$"、$uu^{\mathsf T}$、$\|u\|=1$**：载体是 $\mathbb{RP}^3$ 的投影矩阵嵌入像，而不是任何凸体。注意 $u$ 与 $-u$ 给出同一矩阵，所以 $X\cong\mathbb{RP}^3$。载体不是凸包、不是星形体、也不是有限点集——它是 9 维仿射空间里的一张射影三维" Veronese 型"曲面。用户提示中出现的"凸体/星形"与 $\sqrt{n/(2(n+1))}$ 型常数**在本文 tex 中完全不存在**：全文只用 $\sqrt2$、$1/2$、$3/4$、$5/4$、$\sqrt{2},\sqrt6,\sqrt{12}$ 等常数（见五、常数表）。若后续笔记需要凸体语境，那是 Borsuk 问题的另一条支线（凸体情形在低维成立），不是本篇 [推测：把一般集合的 Borsuk 断言与凸体子问题混淆是常见误读，证据是 intro 第 4–6 行明确写 "every bounded set of positive diameter"]。
3. **"with the Frobenius metric"** 及 $\|A\|_F^2=\operatorname{tr}(A^2)$（intro 第 12–13 行）：度量归一化是全文的命脉。Conway–Hardin–Sloane 的 Grassmann 弦距是本文 Frobenius 距离的 $1/\sqrt2$ 倍（geometry.tex 第 11–13 行原话），选 Frobenius 后 $\operatorname{diam}X=\sqrt2$ 恰好等于"正交直线对"的距离，从而"严格更小直径"等价于"同一块内不含正交对"。
4. **"has diameter $\sqrt2$"**：先断言直径值再断言覆盖失败——因为 Borsuk 断言里的"真更小直径"必须相对 $\operatorname{diam}X$ 来谈；Lean 的 main_theorem 把 $\operatorname{diam}=\sqrt2$ 作为合取支直接写进 MainClaim。
5. **"cannot be covered by ten subsets of diameter strictly less than $\sqrt2$"**：口径是**覆盖**（cover，允许重叠）而不是划分（partition）；intro 第 7–8 行专门解释二者等价（"overlaps may be removed without increasing diameters"——把点任意分给包含它的块，子集直径不增）。"ten" = $d+1=9+1$，正好是 Borsuk 断言在 9 维允许的块数；否定它即否证断言。注意论文**不**声称 $b(X)$ 的确切值：证明只排除"10 块严格小覆盖"，即 $b(X)\ge 11$ [措辞："The theorem does not determine … the exact value of $b(X)$"]。
6. **"counterexample to Borsuk's conjecture in dimension nine"**（摘要）+ **"assertion fails in dimension nine"**（intro）：维度计数按**承载空间** $\mathbb R^9$（trace-one 仿射超平面 $\cong\mathbb R^9$），不按载体本身的拓扑维数 3。$9=N_4-1$，其中 $N_k=\binom{k+1}{2}$；4 维向量空间的对称矩阵仿射 trace-one 切片是 9 维——"9"与"10 块"这对数字在证明里各自有刚性来源（见 1.3、五）。

### 1.3 反例载体的精确描述与"9 为什么关键"

载体：$X_4=\{uu^{\mathsf T}:\|u\|=1\}\subset\{A\in\operatorname{Sym}_4(\mathbb R):\operatorname{tr}A=1\}\cong\mathbb R^9$。几何学事实链（全部在 Lemma 2.1 内）：

- $\|P_x-P_y\|_F^2=2-2\langle u,v\rangle^2$（eq. (2.1)）：距离只依赖两直线夹角的余弦；
- 最大距离 $\sqrt2$ 当且仅当 $\langle u,v\rangle=0$（正交）；
- 因此"$b(Y)\le 10$ 的严格小覆盖" 逐字翻译为 "把 $\mathbb{RP}^3$ 的直线分成 10 类，每类内部不含正交对"（再加开化与光滑化的损失控制）。

9 维关键的三重锁定 [由证明结构反推]：

1. **标签数下界** $m\ge N_k=\binom{k+1}{2}$（Proposition 4.1）：任何可容许映射 $\mathbb{RP}^{k-1}\to\Delta^{m-1}$ 必须 $m\ge N_k$，因为构造出的奇映射把 $S^{N_k-1}$ 映到 $S^{m-1}$，而奇映射要求源球维数 $\le$ 目标球维数（Borsuk–Ulam 型事实，Hatcher 2B.6/2B.7）。$k=4$ 时 $N_4=10$。
2. **等号情形的刚性**（Theorem 4.3）：当 $m=N_k$（恰是 Borsuk 断言允许的 $d+1$ 块，$d=N_k-1$）时拓扑反而最强：每个极大支集恰有 $k$ 个标签、所有面构成 mod-2 闭链。也就是说"块数=断言允许数"这一最难反驳的情形被单独钉死。这正是选择"10 块覆盖 $\mathbb{RP}^3$ 的投影像"作为攻击面的原因：$d+1=10=N_4$ 恰好落在等号情形。
3. **组合不相容需要 $k\ge3$ 且 $m=N_k$**：Theorem 4.3 要求 $k\ge3$（$h=N_{k-1}\ge3$，球丛纤维 $S^{h-1}$ 非退化）；六标签三角形系统需要 $\mathbb{RP}^2$ 的等号情形 $m'=N_3=6$；而 $k=4,m=10$ 时补集恰为 6——三级结构 $10\to6\to$ 五环刚好咬合。$k=3$ 时 $d=N_3-1=5$、断言允许 $6=N_3$ 块，同样落入等号情形，但 Theorem 4.3 的奇偶对撞在 $h=3$ 时给出的三角系统只有六标签版（Lemma 5.2），而 6 标签系统本身是相容的（存在，如 Petersen 型配置——[推测]：论文没有断言六标签系统存在与否，Lean 的搜索只在十标签层面做不相容证明，见四、4.6 与 Cases 文件；此处只说明"低维为何撞不出矛盾"需谨慎下结论，tex 无直接文本证据）。

与前作的结构差异（论文自己给的口径，intro 第 52–67 行原文）：

> Bondarenko constructed a two-distance counterexample in dimension $65$ …; Jenrich and Brouwer obtained dimension $64$ …. Grinsztajn's public proof note gives a finite counterexample in dimension $63$ …. Theorem~\ref{thm:main} improves this dimension bound using the full compact image of projective space rather than a finite configuration.

- 前作（两距离集/强正则图系列）是**有限点集 + 秩/Frankl–Wilson 型禁止相交论证**：直径归一化后每个小块最多含若干点，靠线性代数秩界逼出块数下界。
- 本篇是**紧的射影簇像 + 拓扑/组合论证**：覆盖 → 光滑可容许映射 → 对称矩阵奇延拓 → mod-2 度数 → 面结构与闭链 → 有限不相容。维度下降靠的是把"Borsuk 数"问题转译为 $\mathbb{RP}^3$ 上连续/光滑函数支集的拓扑刚性。
- 嵌入本身不新：$x\mapsto x\otimes x$ 与秩一半正定配置出自 Kalai 对 Kahn–Kalai 构造的叙述（Kalai 2015 §2.3）与 Conway–Hardin–Sloane 的 Grassmann 打包模型（CHS 1996 §5 Thm 2），论文明确说 "Our contribution is the covering obstruction for the projector set associated with $\mathbb R^4$"。

与拓扑前作的差异（intro 第 69–78 行原文）：

> The relevant topological antecedents include Walkup's eleven-vertex
> minimum for triangulations of $\mathbb{RP}^3$ … and the projective-space vertex bounds
> of Arnoux and Marin …. These results cannot be
> applied directly to the complex here: its faces are positive coordinate
> supports of a map, not simplices in a triangulation of projective space.
> The central difficulty is to derive enough of its face structure from
> the map itself.

即：支集复形 $K$ 不是 $\mathbb{RP}^3$ 的三角剖分，不能直接套最小顶点数定理（Walkup 11 顶点、Arnoux–Marin 界）；必须从映射 $f$ 自己"开采"面结构——这就是全文的中央难点声明。

### 1.4 证明装配链（五个过渡）

全文装配链（各节文件与定理编号）：

```
假设存在 10 块严格小直径覆盖 (diam < √2)
 ─(A) Lemma 2.4 [geometry.tex, 分析过渡]→  可容许光滑映射 f: ℝP³ → Δ⁹
 ─(B) Lemma 3.1 + 3.2 [extension.tex, 积分延拓 + 符号分解]→  奇映射
      F : Sym₄ → ℝ¹⁰,  ‖F(A)‖₁ = tr|A|  →  球间奇映射 Σ(V)→Σ₁₀
 ─(C) Prop 4.1 + Lemma 4.2 + Thm 4.3 [topology.tex, mod-2 度数 + 层论对撞]→
      支集复形 K：完备 10 顶、每面为四面体、全体面之和是 mod-2 闭链、
      每脊恰在（后由组合得）偶数个正多个四面体中
 ─(C') Lemma 5.2（k=3 等号 ⇒ 六标签三角形系统）+ Lemma 5.3（系统刚性四性质）
 ─(D) Lemma 6.1–6.4 [ten-labels.tex, 纯组合运输]→  块结构 3,2,2 + |R|=3
 ─(E) Thm 6.5（最终不相容）；conclusion.tex 回收：¬∃ f ⇒ ¬∃ 覆盖，
      完成 Thm 1.1；Cor 7.1 用 Gram 矩阵加"直径距离新点"扩到 d≥9。
```

关于"纯数值/有限判定不能覆盖的过渡"——**本篇 tex 没有类似 Kaplansky 篇的 "numerical rank inequalities alone cannot justify" 式自述句** [措辞证据：通读 7 个 section 无 "cannot" 与数值验证对举句]。但存在两个功能上等价的"不可判定化断层"，论文用别的措辞标出：

1. **过渡 (A) 的开化/光滑化**——geometry.tex 第 125–127 行原话：

   > The strict diameter inequalities are what permit the open neighborhoods
   > and the smooth partition of unity; merely excluding individual orthogonal
   > pairs from arbitrary color classes does not supply this reduction.

   这正是在警告：把问题弱化成"组合地给正交对禁止同色"（图着色式有限问题）**不会**给出可容许映射；必须有严格直径间隙才能做开邻域 + 单位分解。有限判定（如图灵机可搜的色类检查）覆盖不到这一步。
2. **过渡 (C) 的拓扑对撞**——intro 第 75–78 行："The central difficulty is to derive enough of its face structure from the map itself. We do this through an odd map on symmetric matrices, mod-two degree, and local preimage counts"——面结构来自解析/拓扑而非枚举。
3. 反面佐证（Lean 侧）[Lean]：论文把过渡 (D)(E) 声明为 "The rest of the proof is purely combinatorial"（ten-labels 第 36 行），Lean 形式化中恰好只有这一段被替换成**机器生成的 145 文件、66,297 行、约 4,095 条派生引理（编号到 c32921）的有限情形搜索**（`FiniteCases/Cases001–145.lean`），而 (A)(B)(C) 全部保留了人工构造的长链拓扑/分析论证（Simplicial/MatrixGeometry/LocalParity 等约 12,400 行）。这个"可判定化边界"与论文的过渡划分严格吻合，是本篇最有信息量的结构性事实之一。

### 1.5 章节索引表（tex 分节编号 ↔ typst 扁平编号 ↔ 本文第二节小节号）

| tex 章节 | 文件 | 定理环境（tex 编号 / typst 扁平编号） | 本文索引 |
|---|---|---|---|
| §1 Introduction | introduction.tex | Theorem 1.1 / 1 | 一、1.1；二、2.16 |
| §2 From diameter covers to projective maps | geometry.tex | Lemma 2.1 / 2；Remark 2.2 / 3；Definition 2.3 / 4；Lemma 2.4 / 5；（无编号）支集复形 | 二、2.1–2.4 |
| §3 An extension to symmetric matrices | extension.tex | Lemma 3.1 / 6；Lemma 3.2 / 7；（无编号）norm-sphere 段 | 二、2.5–2.7 |
| §4 The equality case gives a simplicial cycle | topology.tex | Proposition 4.1 / 8；Lemma 4.2 / 9；Theorem 4.3 / 10 | 二、2.8–2.10 |
| §5 Triangle systems on six labels | six-labels.tex | Definition 5.1 / 11；Lemma 5.2 / 12；Lemma 5.3 / 13；Figure 1 | 二、2.11–2.12 |
| §6 The obstruction on ten labels | ten-labels.tex | Lemma 6.1 / 14；Lemma 6.2 / 15；Lemma 6.3 / 16；Lemma 6.4 / 17（Figure 2, 3）；Theorem 6.5 / 18 | 二、2.13–2.15 |
| §7 The diameter obstruction | conclusion.tex | Corollary 7.1 / 19 | 二、2.16–2.17 |

注意：文件名叫 `conclusion.tex` 但 `\section` 标题是 "The diameter obstruction"；它包含 Thm 1.1 的证明与 Cor 7.1。preamble.tex 只含宏包与 `\DeclareMathOperator{\tr,\rank,\Sym,\supp}`，无自定义记号冲突。references.bib 共 20 条（见三、史实核对）。

### 1.6 史实核对（Borsuk 断言与已知反例维度；含未能核实项）

论文 intro 第 36–50 行给出的历史链（原文照抄）：

> Borsuk posed the partition question in 1933 \cite{Borsuk1933}.
> Kahn and Kalai disproved it in high dimensions \cite{KahnKalai1993},
> using a forbidden-intersection theorem of Frankl and Wilson
> \cite{FranklWilson1981} to force many smaller-diameter parts.
> Early reductions in counterexample dimension include $946$
> by Nilli \cite{Nilli1994}, the announced bound $903$ of Grey and
> Weissbach \cite{GreyWeissbach1997}, $561$ by Raigorodskii
> \cite{Raigorodskii1997}, and $560$ by Weissbach \cite{Weissbach2000}.
>
> Spherical codes led to a further series of reductions. Hinrichs obtained
> dimension $323$ using vectors of the Leech lattice \cite{Hinrichs2002}. Pikhurko reduced the bound to
> $321$ and credited
> an independent discovery by Hinrichs and Richter \cite{Pikhurko2002};
> Hinrichs and Richter published their bound $298$ in 2003
> \cite{HinrichsRichter2003}.

独立网络核验（2026-10 执行）：

- 综述文章《Borsuk 猜想 80 年（1932–2013）》（搜狐转载）与论文链条一致：Borsuk 1932/1933 提出；Kahn–Kalai 在（其原文量级约 1305 级别的）高维否证；Nilli 946；Raigorodskii 561；Weissbach 560；Hinrichs 323；Pikhurko 321；Hinrichs–Richter 298；Bondarenko 65（两距离集）；Jenrich 64。注意该综述把 Borsuk 年份记作 1932（会议报告）而论文记 1933（Fund. Math. 20: 177–190 发表年）；references.bib 的 Borsuk1933 条目给出完整出处 "Drei Sätze über die n-dimensionale euklidische Sphäre"，DOI 10.4064/fm-20-1-177-190 [已核实：bib 字段与综述一致]。
- Pikhurko 条目的 bib 标题为 "Borsuk's Conjecture Fails in Dimensions 321 and 322"（arXiv:math/0202112v1），与 intro 的 "reduced the bound to $321$" 吻合——即 321/322 两维各有一个反例，而记录意义在 321。
- Grinsztajn 2026（bib：5 月、作者仓库 6 页证明注记，"A 63-dimensional counterexample to Borsuk's conjecture"）：按论文口径这是本篇之前**已知反例的最小维度**纪录（63），本篇改进到 9。差值：63 → 9，直降 54 维，且同时把"有限点集"升级为"紧集" [措辞：intro "improves this dimension bound … rather than a finite configuration"]。
- **用户提示中的"Szarek 18 维、Kupka / Aubry / Kupka 的 12、11、10 维改进、Schramm、Swanepoel 的 41 维"未能核实** [检索记录]：多轮 WebSearch（含 "Szarek Borsuk 18"、"Aubry/Kupavskii Borsuk 12 11 10"、"Swanepoel Borsuk 41"、"counterexample dimension 2024/2025"）未获得任何可靠命中，两次 Wikipedia 抓取失败（en.wikipedia.org 与 en.m.wikipedia.org 均 fetch failed），且这些人名**全部不在论文 references.bib 的 20 条文献里**。据此撰写笔记时不要引用这组数字作为反例维度纪录；它们可能与其他量（如 $b(n)$ 指数下界线的 Szarek/Schramm 贡献，或凸体/照明问题）混淆，但在本次检索范围内无法验证，一律标注[未核实]。
- 论文口径下可安全使用的表述："自 Kahn–Kalai 起维度纪录沿 946 → 903 → 561 → 560 → 323 → 321 → 298 → 65 → 64 → 63 单调下降；2026-09-23 的本篇给出 9，并推论覆盖一切 $d\ge9$；断言失败的最小维度与 $b(X)$ 精确值仍开放。"

---

## 二、逐引理带批注重构

每条引理四样东西：(a) TeX 原文照抄；(b) 不跳步推导（论文省掉的中间计算补出并注明"补"）；(c) 假设/常数/指数/label 集合规模的机械性理由；(d) 2–3 条 [推测] 失败路线（注明证据来源：措辞/图形/Lean）。Lean 对应物就地标注（路径均在 `E:/math/lean/OAI/Geometry/Borsuk/` 下）。

### 2.1 引理 2.1（投影子几何，`lem:projector-geometry`）

**(a) 陈述**（geometry.tex 第 26–38 行 + 证明开头设定）：

> Let $V=\mathbb R^k$ have its usual inner product, with $k\geq2$, and let
> $\mathbb P(V)$ denote its space of one-dimensional linear subspaces.
> For a line $x=[u]$, represented by a unit vector $u$, write $P_x=uu^{\mathsf T}$
> for the orthogonal projector onto $x$. … put
> \[
>  N_k=\dim\operatorname{Sym}(V)=\frac{k(k+1)}2,
>   \qquad X_k=\{P_x:x\in\mathbb P(V)\}.
> \]
> … The map $x\mapsto P_x$ identifies $\mathbb P(V)$ homeomorphically with the
> compact set $X_k$ in the trace-one affine subspace of
> $\operatorname{Sym}(V)$.  This affine subspace is Euclidean of dimension
> $N_k-1$.  If $u,v$ are unit representatives of $x,y$, then
> \begin{equation}
>  \|P_x-P_y\|_F^2=2-2\langle u,v\rangle^2.
>  \label{eq:projector-distance}
> \end{equation}
> Consequently $\operatorname{diam}(X_k)=\sqrt2$, and two projectors are at
> this distance exactly when their lines are orthogonal.

**(b) 不跳步推导**（证明在第 40–50 行，论文把核心计算压缩成一句 "$\operatorname{tr}(P_x^2)=\operatorname{tr}(P_y^2)=1$ and $\operatorname{tr}(P_xP_y)=\langle u,v\rangle^2$"。补全部展开）：

- Frobenius 范数由 $\langle A,B\rangle_F=\operatorname{tr}(AB)$ 生成（对称矩阵上 $\|A\|_F^2=\operatorname{tr}(A^2)$，intro 第 12–13 行对 $k=4$ 声明过）。
- $\|P_x-P_y\|_F^2=\operatorname{tr}\bigl((P_x-P_y)^2\bigr)=\operatorname{tr}(P_x^2)-2\operatorname{tr}(P_xP_y)+\operatorname{tr}(P_y^2)$（展开平方，trace 线性；补）。
- $\operatorname{tr}(P_x^2)=\operatorname{tr}((uu^{\mathsf T})(uu^{\mathsf T}))=\operatorname{tr}(u(u^{\mathsf T}u)v^{\mathsf T}v)=\|u\|^2\|v\|^2=1$。更简洁地：$P_x^2=P_x$（幂等），$\operatorname{tr}P_x=\|u\|^2=1$。
- $\operatorname{tr}(P_xP_y)=\operatorname{tr}(uu^{\mathsf T}vv^{\mathsf T})=\operatorname{tr}((u^{\mathsf T}v)\,uv^{\mathsf T})$……标准做法：$\operatorname{tr}(uu^{\mathsf T}vv^{\mathsf T})=(u^{\mathsf T}v)(v^{\mathsf T}u)=\langle u,v\rangle^2$（循环性，补）。
- 合计得 (2.1)。取值域：$\langle u,v\rangle^2\in[0,1]$（Cauchy–Schwarz），故距离平方 $\in[0,2]$；$\sqrt2$ 可达当且仅当 $\langle u,v\rangle=0$；正交直线对存在因为 $k\ge2$（论文末句）。
- 同胚：$u\mapsto uu^{\mathsf T}$ 对 $u\sim-u$ 不变 ⇒ 给出 $\mathbb P(V)$ 上连续单射（像恰为直线 $x$ 证单射）；紧 → Hausdorff 连续双射是同胚。
- trace-one 仿射超平面维数 $N_k-1$：$\operatorname{Sym}(V)$ 维数 $N_k=k(k+1)/2$（$k$ 个对角 + $\binom k2$ 个非对角），trace 是非零线性泛函，核余维 1。$k=4$：$N_4=10$、超平面 9 维——主定理的"9"在这里定型。

**(c) 机械理由**：$k\ge2$ 是"$\sqrt2$ 真被取到"的最小要求；$N_k$ 是全文标签下界（Prop 4.1）与维度计数（$d=N_k-1$）的母参数；(2.1) 的对角化性质（距离只依赖 $\langle u,v\rangle^2$）是把"直径 $<\sqrt2$"翻译成"块内无正交对"的唯一接口，之后 Lemma 2.4 与 Corollary 7.1 都回用它。Lean 对应：`Projectors/Basic.lean` 的 `projector_inner`（⟪P_u,P_v⟫=⟪u,v⟫²，用 `Fintype.sum_prod_type` 把双重和拆成两个一重和的乘积——正是补的第二步）、`projector_dist_sq`、`projector_dist_le`、`projector_dist_eq_sqrt_two_iff`（⟺ ⟪u,v⟫=0）、`diam_projectorSet`（上界用 `Metric.diam_le_of_forall_dist_le`，下界取见证 `u = single 0 1`、`v = single 1 1`，用 `Metric.dist_le_diam_of_mem` 从紧有界集取到该对距离）。`isCompact_projectorSet` = 球面像。$k$ 在 Lean 中固定为 4（`Vector4`），一般 $k$ 的陈述在 `Support/Purity.lean` 等处用 `EuclideanSpace ℝ (Fin (k+1))` 重新参数化。

**(d) [推测] 失败路线**：(1) 用谱范数或算符范数替代 Frobenius：所有秩一投影子的谱范数都是 1，距离信息塌缩，(2.1) 不成立——[措辞] geometry.tex 第 9–13 行专门交代 CHS 的弦距差因子 $1/\sqrt2$，说明作者核对过归一化选择。(2) 用 $u\in\mathbb C^4$ 复投影子：trace-one 仿射切片维数变成 $k^2-1=15$（复），$N_k$ 型组合（实对称）的坐标公式失效 [Lean：`projector_apply` 是逐分量乘积无共轭]。(3) 直接取 $X_k$ 的凸包 $\{A\succeq0,\operatorname{tr}A=1\}$（密度矩阵体）：凸体内 $P_x+P_y$ 型混合点距离不同，"块内无正交对"的逐点翻译失效——[推测：论文通篇对凸包零提及，且 intro 强调 "full compact projector image"，说明作者明确拒绝凸化]。

### 2.2 注记 2.2（Euclidean 坐标，`eq:euclidean-coordinates`）

**(a) 原文**（geometry.tex 第 52–70 行）：

> An explicit isometry from the trace-one symmetric $4\times4$
> matrices to $\mathbb R^9$ is
> \begin{equation}
> \begin{split}
>  A\longmapsto\bigg(&\frac{a_{11}-a_{22}}{\sqrt2},\;
>  \frac{a_{11}+a_{22}-2a_{33}}{\sqrt6},\;
>  \frac{a_{11}+a_{22}+a_{33}-3a_{44}}{\sqrt{12}},\\
>  &\sqrt2a_{12},\sqrt2a_{13},\sqrt2a_{14},
>    \sqrt2a_{23},\sqrt2a_{24},\sqrt2a_{34}\bigg).
> \end{split}
> \label{eq:euclidean-coordinates}
> \end{equation}
> The first three coordinates use an orthonormal basis of the trace-zero
> diagonal matrices.  The factors $\sqrt2$ in the remaining six coordinates
> account for the two equal off-diagonal entries in the Frobenius norm.
> Thus the nine-dimensional witness will be $X_4$ with exactly its stated
> metric.

**(b) 补算（Gell-Mann 型对角基的正交归一验证，论文称"orthonormal basis"但未验）**：对角基矩阵 $E_1=\frac1{\sqrt2}\mathrm{diag}(1,-1,0,0)$、$E_2=\frac1{\sqrt6}\mathrm{diag}(1,1,-2,0)$、$E_3=\frac1{\sqrt{12}}\mathrm{diag}(1,1,1,-3)$。$\langle E_i,E_j\rangle_F=\operatorname{tr}(E_iE_j)$：$\|E_1\|^2=(1+1)/2=1$；$\|E_2\|^2=(1+1+4)/6=1$；$\|E_3\|^2=(1+1+1+9)/{12}=1$；$\langle E_1,E_2\rangle=(1-1)/\sqrt{12}=0$；$\langle E_1,E_3\rangle=(1-1)/\sqrt{24}=0$；$\langle E_2,E_3\rangle=(1+1-2)/\sqrt{72}=0$。三向张成 trace-zero 对角面（三维）。映射的第 $i$ 个对角坐标恰是 $\langle A,E_i\rangle_F$（因 $\operatorname{tr}(AE_i)$ 即所写分式）。非对角：$\|A\|_F^2=\sum_i a_{ii}^2+2\sum_{i<j}a_{ij}^2$，所以坐标取 $\sqrt2 a_{ij}$ 才把 $2a_{ij}^2$ 搬成 $(\sqrt2 a_{ij})^2$——这就是"the factors $\sqrt2$ … account for the two equal off-diagonal entries"。合计 $\sum_{i=1}^3(\text{diag coord})^2+\sum_{i<j}2a_{ij}^2=\|A-\frac{\operatorname{tr}A}{4}I\|_F^2$；在 trace-one 切片上这是到 $\frac14 I$ 的平方距离。核：全空间 $\operatorname{Sym}_4$ 上该线性映射的核是 $\operatorname{span}\{I\}$（四个对角元相等时三个分式同时为零），故限制在 trace-one **仿射**超平面上是双射等距。Lean 对应：`Main.lean` 的 `coordinates9`（逐字翻译此式，`WithLp.toLp 2` 即 $\ell^2$ 结构）、`coordinates9_norm_sq`（用 `Real.sq_sqrt` 处理 $\sqrt2,\sqrt6,\sqrt{12}$ 的平方与 `h33`：trace-zero 消元 $a_{44}=-a_{11}-a_{22}-a_{33}$）、`coordinates9_dist`/`coordinates9_isometry`（trace-one 差为 trace-zero，套用之）、`coordinates9_diam`（等距保直径）、`coordinates9_cover_pullback`（把 $\mathbb R^9$ 里的覆盖拉回矩阵空间）与总装定理 `euclidean_nine_counterexample`——Lean 里"$X$ 真的住在 $\mathbb R^9$"由此定理而非 main_theorem 承担（见四、4.5）。

**(c) 机械理由**：常数 $\sqrt2,\sqrt6,\sqrt{12}$ 是四步归一：$(1,-1,0,0)$ 范数 $\sqrt2$；$(1,1,-2,0)$ 范数 $\sqrt6$；$(1,1,1,-3)$ 范数 $\sqrt{12}=2\sqrt3$——它们正是 $\mathfrak{sl}_4$ Cartan 子空间的递归构造 $e_1'-e_2', (e_1'+e_2')-2e_3', (e_1'+e_2'+e_3')-3e_4'$。取 $A=uu^{\mathsf T}$ 时这些坐标是二阶球谐函数（$S^3$ 上次数 2 的坐标乘积模去 trace）——[推测：这是"用 4 维球上的二次谐波把 10 个标签函数装进 9 维"的隐藏理由，无文本证据，仅从结构类比 (CHS 打包) 反推]。

**(d) [推测] 失败路线**：(1) 不显式给等距而直接引用"$\mathbb R^9$ 中任何 9 维仿射子空间同构"——对存在性够用，但比较器/论文要求"with exactly its stated metric"（第 68–69 行），且 Lean 需要具体坐标计算才能证 `diam = Real.sqrt 2` 与覆盖拉回。(2) 用 $\{A:\operatorname{tr}A=1,A\succeq0\}$ 整体的内蕴度量做嵌入：凸体的 9 维嵌入像会把边界（秩 2、秩 3 投影子组合）也带上，直径断言不再由正交对控制。

### 2.3 定义 2.3（可容许映射，`def:admissible`）与支集复形

**(a) 原文**（geometry.tex 第 72–91 行 + 第 129–139 行支集复形段）：

> Write $[m]=\{1,\ldots,m\}$ and
> $\Delta^{m-1}=\{(t_1,\ldots,t_m):t_i\ge0,\ \sum_i t_i=1\}$.
> \begin{definition}
> \label{def:admissible}
> A smooth map $f=(f_1,\ldots,f_m):\mathbb P(V)\to\mathbb R^m$ is
> \emph{admissible} if each $f_i$ is nonnegative, $\sum_i f_i=1$, and,
> writing $S(x)=\{i:f_i(x)>0\}$,
> \begin{equation}
>  x\perp y\quad\Longrightarrow\quad S(x)\cap S(y)=\varnothing.
>  \label{eq:admissibility}
> \end{equation}
> Here smoothness means smoothness of the real coordinate functions on the
> usual smooth manifold $\mathbb P(V)$.
> \end{definition}
> Restricting an admissible map to $\mathbb P(W)$ for a nonzero linear
> subspace $W\subseteq V$ preserves admissibility.  Coordinates that vanish
> identically on this subspace may be omitted.
> …
> For an admissible map, define its \emph{support complex} $K$ on the label
> set $\{1,\ldots,m\}$ by
> \[
>  I\in K\quad\Longleftrightarrow\quad
>  I\subseteq S(x)\ \text{for some }x\in\mathbb P(V).
> \]
> It is a finite simplicial complex, possibly with unused labels, and $f$
> takes values in its geometric realization inside the standard simplex.
> No triangulation of $\mathbb P(V)$ is assumed.

**(b) 说明**：条件 (2.3) 只要求**单向**蕴含（正交 ⇒ 支集不交），逆否之外（同支集不交 ⇏ 正交）没有要求——这是后面所有"补集三元组不可同为面"论证的方向性基础。$S(x)\ne\varnothing$ 自动成立（$\sum f_i=1$ 且非负）。子空间限制保持性：$x,y\in\mathbb P(W)$ 在 $\mathbb P(W)$ 中正交当且仅当在 $\mathbb P(V)$ 中正交（内积是限制的），故 (2.3) 继承；"恒零坐标可删除"允许把 $\mathbb P(x^\perp)$ 上的限制视为 $\mathbb{RP}^2\to\Delta^5$（六标签）——Lemma 6.1 的关键接口。支集复形向下封闭是定义级的（$I\subseteq S(x)$ 的子集也 $\subseteq S(x)$）。$f$ 取值在 $|K|$ 里：对任意 $x$，$S(x)\in K$（$S(x)\subseteq S(x)$）且 $f_i(x)=0$ 对 $i\notin S(x)$，故 $f(x)$ 落在单纯形 $\Delta^{S(x)}\subset|K|$。

**(c) 机械理由**：$m=10$ 是覆盖块数；$[m]$ 记号服务 Label 集合；"$\Delta^{m-1}$ 标准单纯形"固定重心坐标口径。"possibly with unused labels"：允许空块（Lemma 2.4 的 padding），保证"≤10 块覆盖"与"10 标签可容许映射"完全等价。Lean 对应：`Projectors/Basic.lean` 第 101–108 行 `structure Admissible`——注意 Lean 口径是**全空间上的偶函数** $f:\mathbb R^4\to(\operatorname{Fin}10\to\mathbb R)$：`smooth : ∀ i, ContDiff ℝ ∞ (fun u => f u i)`（要求 $C^\infty$ 而非仅在球面上光滑）、`antipodal : ∀ u i, f (-u) i = f u i`、`nonneg/sum_one` 只在 $\|u\|=1$ 上要求、`orthogonal` 用内积 ⟪u,v⟫=0 陈述。$S(x)$ 换成 `positiveSupport f u = {i | 0 < f u i}`（`Finset.univ.filter`，Basic.lean 第 243–252 行）。"support complex" 本身在 `Simplicial/Supports.lean` 有 `def supportComplex (f : E → ι → ℝ)`（PreAbstractSimplicialComplex），但主链实际用的是 `Support/SupportIncidence.lean` 第 13–14 行的 `SupportFace f S := ∃ u, ‖u‖ = 1 ∧ S ⊆ positiveSupport f u`——与 $I\in K$ 逐字等价。

**(d) [推测] 失败路线**：(1) 不要求光滑、只要求连续——单位分解与 Sard 定理（Thm 4.3 的两处正则值）失效；[措辞] 论文用 "smooth partition of unity … gives smooth nonnegative functions" 主动买光滑性。(2) 把 (2.3) 强化为等价——多余且假：同块内可以任意混合非正交线。(3) Lean 的 `ContDiff ℝ ∞` 全局光滑化：论文在 $\mathbb P(V)$ 上定义光滑；Lean 用"球面限制提升为偶函数"绕过商流形微分结构的形式化成本——[推测] 若直接在 `RP` 流形图卡上定义，会需要 atlas 兼容性记账，代码量翻倍；证据是 `antipodal` 字段在论文里没有对应物（论文 $f$ 定义在 $\mathbb P(V)$ 上根本不需要奇偶性），是纯 Lean 侧的编码选择。

### 2.4 引理 2.4（严格间隙归约，`lem:cover-to-map`）

**(a) 原文**（geometry.tex 第 92–127 行，证明全文照抄）：

> \begin{lemma}[The strict-gap reduction]
> \label{lem:cover-to-map}
> If $X_k$ is covered by at most $m$ subsets, each of diameter strictly less
> than $\sqrt2$, then there is an admissible map
> $f:\mathbb P(V)\to\mathbb R^m$.
> \end{lemma}
>
> \begin{proof}
> Pad the cover by empty sets to write it as $A_1,\ldots,A_m$.
> For every nonempty $A_i$, set $d_i=\operatorname{diam}(A_i)$ and
> $\varepsilon_i=(\sqrt2-d_i)/4>0$, and define the relatively open set
> \[
>  U_i=\{P\in X_k:\operatorname{dist}_F(P,A_i)<\varepsilon_i\}.
> \]
> Set $U_i=\varnothing$ if $A_i=\varnothing$.  The sets $U_i$ cover $X_k$.
> For any $P,Q\in U_i$, points of $A_i$ within $\varepsilon_i$ of $P,Q$
> and the triangle inequality give
> \[
>  \|P-Q\|_F<d_i+2\varepsilon_i
>  =\frac{d_i+\sqrt2}{2}<\sqrt2.
> \]
> In particular $\operatorname{diam}(U_i)\leq(d_i+\sqrt2)/2<\sqrt2$.
>
> Pull these sets back to a finite open cover $V_i$ of $\mathbb P(V)$.
> A smooth partition of unity subordinate to this cover
> \cite[Theorem~2.23]{Lee2013} gives smooth
> nonnegative functions $f_i$, with sum one and $f_i(x)>0$ only if
> $x\in V_i$.  Empty sets receive the zero function.  If $i$ belonged to
> both $S(x)$ and $S(y)$ for orthogonal lines $x,y$, then $P_x,P_y\in U_i$
> would be at distance $\sqrt2$ by Lemma~\ref{lem:projector-geometry},
> a contradiction.
> \end{proof}

**(b) 补算**：

- $\operatorname{dist}(P,A_i)<\varepsilon$ 的开邻域在 $X_k$ 中相对开（距离函数连续）；覆盖性：$P\in A_j$ 某 $j$ ⇒ $\operatorname{dist}(P,A_j)=0<\varepsilon_j$（补）。
- 三角不等式链（论文压缩了中间步）：取 $p,q\in A_i$ 使 $\|P-p\|<\varepsilon_i$、$\|Q-q\|<\varepsilon_i$，则 $\|P-Q\|\le\|P-p\|+\|p-q\|+\|q-Q\|<2\varepsilon_i+d_i$。代入 $\varepsilon_i=(\sqrt2-d_i)/4$：$d_i+2\varepsilon_i=d_i+(\sqrt2-d_i)/2=(d_i+\sqrt2)/2$ ✓，且 $<\sqrt2\iff d_i<\sqrt2$ ✓（严格性来自 $d_i$ 严格小于）。
- $\operatorname{diam}(U_i)\le(d_i+\sqrt2)/2$：逐对 $< (d_i+\sqrt2)/2$ 的集合其直径取 $\le$（直径是上确界，严格不等号退为弱不等号——论文第 113 行 "In particular" 就是这个逻辑，补注：这里不需要紧性，纯上确界论证）。
- 回拉覆盖：$V_i=\{x\in\mathbb P(V):P_x\in U_i\}$，$\{P_x:x\in V_i\}=U_i$ 因为 $X_k$ 中的 $P$ 都是某 $P_x$。$x\mapsto P_x$ 同胚 ⇒ $V_i$ 开、覆盖 $\mathbb P(V)$、有限（$m$ 个）。Lee 定理 2.23（光滑单位分解，从属于流形的任意开覆盖）给出 $f_i\ge0$、$\sum f_i=1$、$\operatorname{supp}f_i\subset V_i$。正支集条件 $f_i(x)>0\Rightarrow x\in V_i$。
- 验证 (2.3)：$x\perp y$ 且共享标签 $i$ ⇒ $P_x,P_y\in U_i$ ⇒ $\|P_x-P_y\|<(d_i+\sqrt2)/2<\sqrt2$，但正交对引理 2.1 说距离恰为 $\sqrt2$，矛盾。

**(c) 机械理由**：

- $\varepsilon_i=(\sqrt2-d_i)/4$ 里的 **4**：间隙 $\sqrt2-d_i$ 先被 $2\varepsilon_i$（两侧各一次三角不等式）吃掉一半，再对折一次留余量。真正需求是 $2\varepsilon_i<\sqrt2-d_i$，取 $1/4$ 使 "$<$(严格)" 在闭包/≤ 版本里也安全（Lean 用 `Metric.thickening ε` 的开版本配 `/4`，`dist_lt_of_mem_thickening_small` 的推导与论文逐字同型）。$1/2$ 勉强可行、$1/1$ 失效（闭包等号处爆），$1/4$ 给 2 倍松弛度。见五、常数表行 "ε_i"。
- padding 空集：让 "at most $m$" 变成精确 $m$ 标签映射；空集 ↦ 零函数 ↔ "unused labels"（定义 2.3 后段与支集复形 "possibly with unused labels" 呼应）。
- 引理是**单向**的（覆盖 ⇒ 映射）；反向（映射 ⇒ 覆盖）在 Lean 里也有（`admissible_to_cover`：$L_i=\{u:\|u\|=1\ \wedge\ f_i(u)\ge 1/10\}$ 的投影像，10 块鸽笼 + 紧集 `compact_diam_lt`），并且 Lean 最终用 `cover_iff_admissible` 双向封装——比论文口径强，论文只需单向 [Lean]。反向的 $1/10$：$\sum_i f_i(u)=1$ ⇒ 存在 $i$ 使 $f_i(u)\ge1/m=1/10$（覆盖性论证），阈值取"平均值"即可，1/10 是 $m=10$ 的实例。
- 依赖清单：Lee2013 Thm 2.23（单位分解）；Lean 用 `SmoothPartitionOfUnity.exists_isSubordinate`（针对 $\mathbb R^{16}$ 中闭集 $X_k$ 的 ambient 版本，而非商流形版本——再次印证 2.3(d) 的编码选择）。

**(d) [推测] 失败路线**：(1) 跳过开化直接对 $A_i$ 做"特征函数"分派——$f_i$ 不连续，(B)(C) 全断。[措辞] 第 125–127 行的警告句就是针对此路。(2) 用连续但不光滑的单位分解（拓扑版）——Sard 定理需要 $C^\infty$（或至少 $C^k$ 的 $k>\dim$），Thm 4.3 的正则值选取失效。(3) 用 $\varepsilon_i=(\sqrt2-d_i)/2$：开邻域版本的直径只压到 $\le\sqrt2$ 弱不等号，正交对检验（$=\sqrt2$）不再是矛盾而是"可能贴合"——[推测：这是间隙减半的标准失效模式；证据只有 `/4` 这个数字本身被写进 Lean（`Basic.lean` 第 140 行 `(Real.sqrt 2 - Metric.diam (C i)) / 4`），说明作者把它当作实质参数而非可替换装饰]。(4) 无限覆盖 + 单位分解：$m$ 必须是有限标签数（$K$ 有限、组合段依赖 $|[m]|=10$ 的计数），Lean 全程用 `Fin 10`。

### 2.5 延拓 $H$、$E_V$ 与引理 3.1（正延拓，`lem:positive-extension`）

**(a) 原文**（extension.tex 第 9–47 行，定义与陈述照抄；证明 49–101 行较长，(b) 中分步引）：

> Define the continuous degree-two homogeneous function
> $H:V\to\mathbb R^m$ by
> \[
>  H(v)=\begin{cases}\|v\|^2f([v]),&v\ne0,\\0,&v=0.\end{cases}
> \]
> Continuity at zero follows from $\|H(v)\|_1=\|v\|^2$.
> For a positive semidefinite operator $Q$, let
> \begin{equation}
>  E_V(Q)=k\int_{\mathbb S(V)}H(Q^{1/2}u)\,d\mu_V(u),
>  \label{eq:extension}
> \end{equation}
> where $\mu_V$ is rotation-invariant probability measure on the unit sphere.
> The positive square root is meant throughout.
>
> \begin{lemma}[Properties of the positive extension]
> \label{lem:positive-extension}
> The map $E_V$ is continuous on the full positive semidefinite cone,
> including its singular boundary.  For $t\geq0$ it satisfies
> \[
>  E_V(tQ)=tE_V(Q),\qquad E_V(Q)_i\geq0,\qquad
>  \sum_{i=1}^m E_V(Q)_i=\operatorname{tr}Q.
> \]
> Its positive coordinates are exactly the labels used on the range of $Q$:
> \begin{equation}
>  \{i:E_V(Q)_i>0\}
>  =\bigcup_{x\in\mathbb P(\operatorname{ran}Q)}S(x),
>  \label{eq:extension-support}
> \end{equation}
> where the right side is empty for $Q=0$.  Moreover:
> \begin{enumerate}
> \item $E_V(P_x)=f(x)$ for every line $x$;
> \item if $Q$ is supported on a nonzero subspace $W\subseteq V$, then
> $E_V(Q)=E_W(Q|_W)$, where the latter construction uses $f|_{\mathbb P(W)}$
> and the factor $\dim W$;
> \item this last expression is smooth when $W$ varies smoothly with fixed
> dimension and $Q|_W$ varies smoothly through positive definite operators.
> \end{enumerate}
> \end{lemma}

**(b) 证明补全**（论文证 49–101 行；中间计算补齐）：

- **连续性**：$Q\mapsto Q^{1/2}$ 在 PSD 锥上连续——论文给的论证：在含谱的紧区间上多项式一致逼近 $\sqrt x$（Weierstrass），对矩阵代入（谱半径一致界下多项式映射连续）。被积函数 $(Q,u)\mapsto H(Q^{1/2}u)$ 联合连续（$Q^{1/2}u=0$ 时按 $H(0)=0$ 解释；$H$ 连续因 $f$ 光滑与 $\|v\|^2$），紧球面上积分保连续（控制收敛/一致连续）。
- **一次齐次**：$H(cv)=c^2H(v)$（$c\ge0$ 情形；$(tv)^{\mathsf T}$ 缩放），故 $E_V(tQ)=tE_V(Q)$：$(tQ)^{1/2}=t^{1/2}Q^{1/2}$，$H(t^{1/2}Q^{1/2}u)=t\,H(Q^{1/2}u)$。
- **坐标和 = trace**（论文给链，逐项展开）：$\sum_iE_V(Q)_i=k\int\sum_iH(Q^{1/2}u)_i\,d\mu=k\int\|Q^{1/2}u\|^2d\mu=k\int\langle Qu,u\rangle d\mu$。用到 $\sum_i f_i=1\Rightarrow\sum_iH_i(v)=\|v\|^2$。然后 $\int\langle Qu,u\rangle d\mu(u)=\langle Q,\int uu^{\mathsf T}d\mu\rangle_F$；旋转不变性 $\Rightarrow\int uu^{\mathsf T}d\mu=cI$；取迹 $\operatorname{tr}\int uu^{\mathsf T}=\int\|u\|^2=1=k\cdot c\Rightarrow c=1/k$。得 $=k\cdot\operatorname{tr}(Q)/k=\operatorname{tr}Q$ ✓（论文第 58–62 行）。
- **支集精确性 (3.2)**：$\subseteq$：$Q^{1/2}u\ne0$ 总在 $\operatorname{ran}Q$ 中（$Q^{1/2}$ 与 $Q$ 同核），被积支撑在 $\bigcup_{x\subset\operatorname{ran}Q}S(x)$ 的标签上。$\supseteq$：若 $i\in S(x)$，$x=\mathbb R\,Q^{1/2}u_0$（$\|u_0\|=1$，$Q^{1/2}$ 在其像上可逆保证任意 range 直线可达），第 $i$ 个被积分量在 $u_0$ 处为正、由连续性在 $u_0$ 附近开集上为正；球面开集 $\mu$-正测（`IsOpenPosMeasure`，Lean 的 `sphereProbability_openPos`）⇒ 积分 $>0$。
- **$E_V(P_x)=f(x)$**：$P_x^{1/2}=P_x$（投影子自身半正定平方根是它）。$Q^{1/2}u=uu^{\mathsf T}u'=\langle u,u'\rangle u$；$H(\langle u,u'\rangle u)=\langle u,u'\rangle^2 f(x)$（$\|\cdot\|^2$ 提系数）。$k\int\langle u,u'\rangle^2d\mu(u')=k\cdot\frac1k=1$（对角第二矩：$k$ 个坐标各贡献 $1/k$）⇒ $E_V(P_x)=f(x)$ ✓（论文第 70–72 行"每个非零被积项是 $f(x)$ 的标量倍，标量积分成 $\operatorname{tr}P_x=1$"）。
- **子空间恒等式（第 2 条）**：核心引理：测度 $B\mapsto\int_{\mathbb S(V)}\|\pi_Wu\|^2\mathbf1_{\{\pi_Wu\ne0,\ \pi_Wu/\|\pi_Wu\|\in B\}}d\mu_V(u)$ 是 $\mathbb S(W)$ 上旋转不变测度（$\pi_W$ 与 $O(W)$ 交换；$V$ 中旋转不变限制到 $W$ 仍不变），故为 $c\mu_W$；$c$=总质量 $=\int\|\pi_Wu\|^2d\mu_V=\int\sum_{j=1}^r\langle w_j,u\rangle^2d\mu=r/k$（$\{w_j\}$ 为 $W$ 正交基，每项 $\int\langle w_j,u\rangle^2=1/k$）。论文第 82 行 "Its total mass is … $r/k$"。于是 $k\int_{\mathbb S(V)}H(Q^{1/2}u)d\mu_V(u)$：把 $u$ 沿 $\pi_W$ 分解，$Q^{1/2}u=Q^{1/2}\pi_Wu$（$Q$ 在 $W^\perp$ 上为零 ⇒ 其半根也如此，$Q^{1/2}|_{W^\perp}=0$），令 $w=\pi_Wu/\|\pi_Wu\|$ 得被积 $=\|\pi_Wu\|^2H((Q|_W)^{1/2}w)$，对不变测度换元 ⇒ $=k\cdot(r/k)\int_{\mathbb S(W)}H((Q|_W)^{1/2}w)d\mu_W=r\int_{\mathbb S(W)}\cdots=E_W(Q|_W)$ ✓（$E_W$ 的定义因子是 $\dim W=r$）。
- **平滑性（第 3 条）**：局部选取光滑正交标架 $T:\mathbb R^r\to W$（Gram–Schmidt 于固定基的投影，第 91–92 行）；$Q|_W$ 在标架下为正定阵 $C$；$E_V(Q)=r\int_{S^{r-1}}H(TC^{1/2}w)d\mu(w)$；$C\mapsto C^{1/2}$ 在正定锥光滑（不同于 PSD 边界仅连续——这就是第 3 条要求"positive definite"的原因）；$TC^{1/2}w\ne0$；$H$ 在非零处光滑；紧球面上对参数微分（Leibniz 积分法则）⇒ 局部光滑。

**(c) 机械理由**：

- 因子 $k$：恰抵消 $\int uu^{\mathsf T}=I/k$，使 $\sum_iE_i=\operatorname{tr}Q$ 归一化成立——若用 $1$ 或 $r$ 之外的因子会破坏 trace 等式（这是 Prop 4.1 里 $\|\cdot\|_1$-球与 $\operatorname{tr}|\cdot|$-球等同的根基）。
- "positive square root is meant throughout"：$Q^{1/2}$ 唯一（PSD 锥上谱函数），保证 $Q^{1/2}u$ 的像 $=\operatorname{ran}Q$（同核论证），支集精确式 (3.2) 依赖它。
- 子空间恒等式对 $W$ 用因子 $\dim W$ 而非 $\dim V$：**没有这条，(C) 的 $G_x$ 层构造就失去与 $F$ 的预像对应**——$G_x$ 是 $x^\perp$ 内按 $k-1$ 归一的延拓，(4.6) 的分块恒等式 $A=\lambda P_x+(1-\lambda)B$ 要求 $E_V$ 对正交分块直接相加。
- $H$ 的次数 2 齐次：$\|v\|^2f([v])$——次数 2 是为了 $\sum H_i=\|v\|^2$ 与 $\int$ 出 $\operatorname{tr}Q$ 匹配（$Q^{1/2}$ 给两次 $u$）；次数 1 会得 $\int\|Q^{1/2}u\|d\mu$（非多项式、支集性质仍真但 trace 等式失去）。[措辞/结构]
- Lean 对应：`SphereGeometry/HomogeneousLift.lean`（$H$ = `homogeneousLift`：论文 $H(v)=\|v\|^2f([v])$ 在 Lean 里等价实现为按范数齐次提升）；`SphereGeometry/IntegralLift.lean`（$E_V$ = `integralLift f T`，参数是线性算子 `Q^{1/2}` 的实现方式：以 $T=Q^{1/2}$ 作为 `E →L[ℝ] E` 传入；字段 `integrand_continuous/integrand_integrable/integralLift_nonneg/integralLift_sum/integralLift_pos_iff_sphere` 分别对应上面四条）。球面测度与第二矩：`SphereGeometry/SphereMeasure.lean`（`sphereProbability`、`IsOpenPosMeasure` 实例）+ `SphereGeometry/SphereMoments.lean`（`sphere_coord_diag`：$\int u_i^2=1/\dim$，`sphere_coord_cross`：交叉项为零，`sphere_quadratic_integral`：$\int\langle Au,u\rangle=\operatorname{tr}A/\dim$——论文的 $\int uu^{\mathsf T}=I/k$）。子空间恒等式（$r/k$ 换元）在 `MatrixGeometry/MatrixCompression.lean`/`FibreTransport.lean` 一族（按 statement 级对应标注，未逐文件读证明）。**注意**：Lean 的积分定义在 `MeasureTheory` 的 Haar/volume 上，因子 `k` 以 `Fintype.card` 显式出现——与论文一致。

**(d) [推测] 失败路线**：(1) 用高斯测度代替球面测度：$\mathbb R^k$ 上旋转高斯也有二矩等向性，但 $H$ 的二次齐次与球面测度的"总质量集中在 $\|u\|=1$"耦合才给出 $E(P_x)=f(x)$（标量积分恰好 $=\operatorname{tr}P_x$）；高斯版本会在每个 $x$ 上多出径向因子，$E_V(P_x)=c\,f(x)$（$c$ 可归一但子空间恒等式里 $r/k$ 换元被污染）[推测：结构论证，无文本证据]。(2) 不取平方根而直接用 $Q$：$H(Qu)$ 的支集会漏掉 $\operatorname{ran}Q$ 直线（核上的信息丢失？其实 $Qu$ 像仍 $\subset\operatorname{ran}Q$，但 $\sum_i$ 变成 $\langle Q^2u,u\rangle$ 积分出 $\operatorname{tr}Q^2$——归一化崩，(3.4) 失效）。[结构：与 (3.4) 的 trace 等式对照]。(3) 对奇异 $Q$ 强行用光滑平方根：PSD 边界上 $Q\mapsto Q^{1/2}$ 仅是连续（特征值穿零时 $\sqrt\lambda$ 不可微），Lemma 3.1 第 3 条把光滑性限定在 positive definite 是**不得不**的（措辞：论文专门写 "including its singular boundary" 的连续 vs "positive definite" 的光滑两级）。

### 2.6 符号延拓 $F$ 与引理 3.2（奇球映射，`lem:signed-extension`）

**(a) 原文**（extension.tex 第 103–138 行，定义 + 陈述照抄）：

> For a symmetric operator $A$, let $|A|=(A^2)^{1/2}$ and
> $A_+=(|A|+A)/2$, $A_-=(|A|-A)/2$.  These are its positive and negative
> parts, so $A=A_+-A_-$ and their ranges are orthogonal.  Define
> \begin{equation}
>  F(A)=E_V(A_+)-E_V(A_-).
>  \label{eq:signed-extension}
> \end{equation}
>
> \begin{lemma}[The odd sphere map]
> \label{lem:signed-extension}
> The map $F:\operatorname{Sym}(V)\to\mathbb R^m$ is continuous, odd,
> and homogeneous of degree one for nonnegative scalars.  It satisfies
> \begin{equation}
>  \|F(A)\|_1=\operatorname{tr}|A|,
>   \qquad \sum_iF(A)_i=\operatorname{tr}A.
>  \label{eq:extension-norms}
> \end{equation}
> More precisely, its positive and negative label sets are
> \begin{equation}
> \begin{aligned}
>  \{i:F(A)_i>0\}&=\bigcup_{x\in\mathbb P(\operatorname{ran}A_+)}S(x),\\
>  \{i:F(A)_i<0\}&=\bigcup_{x\in\mathbb P(\operatorname{ran}A_-)}S(x).
> \end{aligned}
>  \label{eq:spectral-support}
> \end{equation}
> If every coordinate of $F(A)$ is nonzero, then $A$ is nonsingular.
> If all coordinates of $F(A)$ are strictly negative, then $A$ is negative
> definite; the analogous statement holds with both signs reversed.
> The map $F$ is smooth on the open set of nonsingular symmetric operators.
> In particular, it restricts to a continuous odd map
> \begin{equation}
>  \{A:\operatorname{tr}|A|=1\}\longrightarrow
>  \{y\in\mathbb R^m:\|y\|_1=1\}.
>  \label{eq:norm-sphere-map}
> \end{equation}
> \end{lemma}

**(b) 证明补全**（证 140–174 行）：

- $A_\pm$ 公式验证：谱分解 $A=\sum\lambda_jv_jv_j^{\mathsf T}$，$|A|=\sum|\lambda_j|v_jv_j^{\mathsf T}$，$A_+=\sum_{\lambda_j>0}\lambda_jv_jv_j^{\mathsf T}$（把 $(|A|+A)/2$ 逐项代入，$\lambda>0$：$(\lambda+\lambda)/2=\lambda$；$\lambda<0$：$(-\lambda+\lambda)/2=0$）。$A_+-A_-=A$ ✓，range 正交（特征子空间互正交）✓。
- 奇性：$(-A)_+=A_-$（谱取反交换正负部）⇒ $F(-A)=E(A_-)-E(A_+)=-F(A)$。非负齐次一次：$F(tA)=tF(A)$（$t\ge0$，$ (tA)_\pm=tA_\pm$ + $E$ 一次齐次）。
- **无对消**（(3.5) 的引擎）：$\operatorname{ran}A_+\perp\operatorname{ran}A_-$ ⇒ 两个并集 $\bigcup_{x\subset\operatorname{ran}A_+}S(x)$ 与 $\bigcup_{y\subset\operatorname{ran}A_-}S(y)$ 不交（可容许性 (2.3)）。由 (3.2)，$E(A_+)$ 的正坐标集是第一并集、$E(A_-)$ 的正坐标集是第二并集，二者不交 ⇒ 逐坐标 $(E(A_+)-E(A_-))_i$ 至多一边非零、无抵消 ⇒ (3.5) 成立，且 $\|F(A)\|_1=\sum_i|F_i|=\sum E(A_+)_i+\sum E(A_-)_i=\operatorname{tr}A_++\operatorname{tr}A_-=\operatorname{tr}|A|$；$\sum F_i=\operatorname{tr}A_+-\operatorname{tr}A_-=\operatorname{tr}A$ ✓（论文 "by summing coordinates" 一句压缩了这两条链）。
- 核 ⇒ 零坐标：$x\in\ker A$ 直线；$x\perp\operatorname{ran}A_+$ 与 $\operatorname{ran}A_-$（$A$ 自伴：$\ker A=(\operatorname{ran}A)^\perp$，补一步：$\operatorname{ran}A_\pm\subseteq\operatorname{ran}A$）。取 $i\in S(x)$（非空因 $\sum f=1$）：$i$ 不在任一并集里（否则与 $x$ 正交线共享标签，违 (2.3)）⇒ $F(A)_i=0$。逆否 = "全坐标非零 ⇒ 无核"。
- 全负 ⇒ 负定：第一并集为空 ⇒ $E(A_+)=0$ ⇒ $\operatorname{tr}A_+=0$ ⇒ $A_+=0$（PSD 且迹零 ⇒ 零）⇒ $A\le0$；再上条逆否给无核 ⇒ 负定。正方向由奇性。
- 光滑性（ nonsingular 开集）：$\Pi_\pm(A)=\frac12(I\pm A(A^2)^{-1/2})$——验证：$A=Q\Lambda Q^{\mathsf T}$，$A(A^2)^{-1/2}=Q\,\Lambda|\Lambda|^{-1}Q^{\mathsf T}=Q\operatorname{sgn}(\Lambda)Q^{\mathsf T}$，故 $\Pi_+$ 投到正特征子空间 ✓；$A^2\succ0$（无零特征值）⇒ $\lambda\mapsto\lambda^{-1/2}$ 光滑于正半轴 ⇒ $A\mapsto(A^2)^{-1/2}$ 光滑（谱微积分）。局部正交标架（投影固定基 + Gram–Schmidt，缩小邻域保线性无关）⇒ $A_\pm|_{\operatorname{ran}\Pi_\pm}$ 正定光滑族 ⇒ Lemma 3.1(3) 给出 $E(A_\pm)$ 光滑。
- (3.6)：$\operatorname{tr}|A|=1$ 的水平集经 $F$ 映到 $\|y\|_1=1$ 水平集——正是 (3.4) 第一式；奇性与连续性已证。

**(c) 机械理由**：

- **奇性为什么关键**：Prop 4.1 的全部力量来自"奇映射 $S^n\to S^d$ 要求 $n\le d$"（Borsuk–Ulam）。$F$ 的奇性来源 = 正负部在 $A\mapsto-A$ 下交换 + 可容许性的"正交 ⇒ 支集不交"给无对消。若直接令 $F'=E(A_+)$（不做差），映射不奇，一切维度下界消失。
- $\|F(A)\|_1=\operatorname{tr}|A|$：**两个不同范数（Ky Fan 迹范数 vs ℓ1）恒等**是全文最精妙的归一化——它使 $\Sigma(V)\to\Sigma_m$ 是"满范数对满范数"的映射，径向归一才能保持奇性到球面。
- "homogeneous of degree one for nonnegative scalars"（而非全部标量）：$F$ 的定义只对 PSD 输入有意义于 $A_\pm$，齐次性只沿正射线验证；奇性补上负射线——两条合起来给出径向化良定义。
- Lean 对应：符号延拓本体在 `MatrixGeometry/SignedExtension.lean` / `SphereGeometry/SphereExtension.lean`（`normalizedSignedExtension`：即 $A\mapsto F(A)/\operatorname{tr}|A|$ 的 $\|y\|=1$ 目标版本——Lean 直接把 (3.6) 复合进 `sphereExtension f := normalizedSignedExtension f ∘ symmetricCoordinates`，定义在 `SphereGeometry/OddSphereMap.lean` 第 17–19 行）；`sphereExtension_odd`（奇性）、`Admissible.sphereExtension_norm`（单位球到单位球）、`sphereExtension_continuousOn`。谱支集精确性 (3.5) = `Support/SpectralSupport.lean` 的 `signedExtension_pos_iff/neg_iff/positive_support/negative_support`；核 ⇒ 零坐标 = `Support/FullSupport.lean` 的 `signedExtension_kernel` 一族；"全负 ⇒ 负定"= `Support/NegativeFibre.lean`（`negPart_kernel_of_positiveLine` 等）。`MatrixGeometry/MatrixKernel.lean`、`Rank.lean`、`RankPreimage.lean` 管正负谱子空间秩记账；`SymmetricCoordinates.lean`/`SymmetricEntries.lean` 把 `EuclideanSpace ℝ (UpperTriangle ν)` 与对称阵双向线性同构（$N_k$ = `Fintype.card (UpperTriangle ν)` 的实现）。

**(d) [推测] 失败路线**：(1) 用 $F(A)=E(A)$ 对不定 $A$ 直接积分——$A^{1/2}$ 出实数域，且失去奇性 [结构]。(2) 正负部分支不做支集检查直接减——ℓ1 等式出现对消误差；论文专门写 "There is no cancellation in their difference"（第 148 行）说明这是对消风险的正面回应 [措辞]。(3) 光滑性想一步到位用谱投影公式 $\Pi_\pm$——在奇异 $A$ 处 $(A^2)^{-1/2}$ 爆，故只声明 nonsingular 开集光滑；若试图在奇异点做微分（Sard 需要），会要求把正则值选在满支集区域（Thm 4.3 正是这样绕：正则性只在"每个原像点局部"检验，配 Lemma 4.2 的"纤维外无光滑"许可）。

### 2.7 norm-sphere 等同段（extension.tex 第 176–185 行，无编号但全节有效）

**(a) 原文照抄**：

> The two norm spheres in \eqref{eq:norm-sphere-map} are not being regarded
> as globally smooth hypersurfaces.  Radial normalization identifies them
> antipodally with the ordinary Euclidean spheres of dimensions $N_k-1$
> and $m-1$.  These identifications are homeomorphisms everywhere and
> smooth diffeomorphisms locally at nonsingular matrices and label vectors
> with every coordinate nonzero.  Indeed, $\operatorname{tr}|A|$ is smooth
> near a nonsingular $A$, while the $\ell^1$ norm is a fixed linear form
> within each open sign orthant.  Consequently ordinary sphere degree
> applies to \eqref{eq:norm-sphere-map} when $m=N_k$, and local differential arguments
> are valid at every preimage of a full-support value.

**(b) 补注**：$\operatorname{tr}|\cdot|$ 是 $\operatorname{Sym}(V)$ 上的范数（正齐次 + 三角不等式：迹范数在矩阵范数理论中标准；正定 $A$ 时 $=\operatorname{tr}A$）——任何范数的单位球面经径向映射 $x\mapsto x/\|x\|_{\text{new}}\cdot\|\cdot\|_2^{-1}$ 型同胚等同于欧氏球面，保对径作用（范数正齐次 ⇒ 径向线双射）。$\ell^1$-球面同理（八面体表面 $\cong S^{m-1}$）。光滑性分段：$\operatorname{tr}|A|$ 在无零特征值邻域光滑（谱固定重数局部光滑求和）；$\|y\|_1$ 在每个开符号卦限是 $\pm$ 线性形式。"when $m=N_k$"：仅此时源/目标同维，degree 才有意义；$m<N_k$ 时直接由"无奇映射降维"否决存在性（Hatcher 2B.6 的另一半）。

**(c) 机械理由**："full-support value"（目标每坐标非零）处局部微分论证合法——因为两处范数都局部线性化，微分结构可搬运；Thm 4.3 选的所有正则值（$r,\ g,\ y=(\lambda r,(1-\lambda)g)$）都在这种点。**这段是 Lemma 4.2 的许可证**：把"非全局光滑流形的连续映射"纳入正则纤维计数框架。Lean 对应：`Simplicial/UnitRadial.lean`（`unitRadial` 与 `annulus`——径向归一工具）、`SphereGeometry/NormSphere.lean`（`normSphere n = {‖u‖=1}`——Lean **直接用欧氏球面**定义 sphereExtension 的定义域，绕开了"两种球面等同"的叙述：`symmetricCoordinates` 把 `EuclideanSpace ℝ (UpperTriangle ν)` 等距于 Sym（Frobenius），`normalizedSignedExtension_norm` 证明像也在 $\|\cdot\|=1$ 上——即 Lean 把"radial normalization identifies them antipodally"**实现为把范数球替换为欧氏球再复合归一化**）。

**(d) [推测] 失败路线**：(1) 直接把 $\Sigma(V)$ 当光滑超曲面用微分拓扑——$\operatorname{tr}|\cdot|$ 在奇异阵处不可微（特征值穿零，绝对值折点），Sard/隐函数定理全局调用非法；论文的"not being regarded as globally smooth"就是防这个 [措辞]。(2) ℓ1-球面上用光滑度论证——棱（坐标零超平面）处同样失效，故只在 full-support 原像处做局部论证。(3) Lean 若照搬"两种球面同胚"叙述，需要在 Mathlib 中形式化非光滑超曲面的 degree——代码选择直接住在光滑欧氏球面里，把全部范数恒等式作为引理携带（`sphereExtension_norm`），这是"数学叙述 → 形式化"的一次口径转换 [Lean]。

### 2.8 命题 4.1（标签数下界与等号刚性，`thm:label-bound`；typst 定理 8）

**来源**：topology.tex 第 28–53 行。

**(a) TeX 原文（陈述逐字）**：
> If $k\ge2$, every smooth admissible map $f:\mathbb P(\mathbb R^k)\to\Delta^{m-1}$ satisfies $m\ge N_k$. If $m=N_k$, its extension $F$ has mod-two degree one and is surjective. In this equality case, every pair of labels is an edge of the support complex of $f$.

**(b) 推导补全**：证明分三段。第一段：奇映射 $S^n\to S^d$ 要求 $n\le d$，奇自同胚 $S^n\to S^n$ 的 mod-2 次数为奇（引 Hatcher Prop 2B.6 与 Cor 2B.7）；$F:\Sigma(V)\to\Sigma_m$ 是 $S^{N_k-1}\to S^{m-1}$ 的奇映射（Lemma 3.2 给出奇性），故 $N_k-1\le m-1$ 即 $m\ge N_k$。等号时 $F$ 是奇自映射 ⇒ 次数为奇 ⇒ 非零 ⇒ 满射：论文给的理由是逐字"A map of nonzero degree cannot omit a point of its target sphere, since the complement of a point is contractible"——若非满射，$F$ 分解经过 $S^{N_k-1}\setminus\{p\}\cong\mathbb{R}^{N_k-1}$（可缩），任何经可缩空间分解的映射零次，与次数 1 mod 2 矛盾 [补]。第二段（边论断）：设 $m=N_k$，取标签 $i\ne j$；在 $\Sigma_m$ 中选每坐标非零、仅第 $i,j$ 坐标为正的向量 $y$（例如 $y_i=y_j=c>0$，其余为 $-\varepsilon_l$，调 $\sum|y_l|=1$）[补：具体取法不唯一，只要求符号型 $(++,\cdots-)$]。取原像 $A\in F^{-1}(y)$。断言 1：$A$ 的正谱子空间里每条线只用 $\{i,j\}$ 两个标签——由 Lemma 3.2 的精确谱支集：正特征值线的坐标贡献为正，只能落在正坐标处。断言 2：正谱子空间维数恰为 1。若 $\ge2$，限制 $f|_{\mathbb P(\text{正子空间})}:\mathbb{RP}^1\to\Delta^{\{i,j\}}$ 经限制遗传性（2.3(c)）是至多 2 个标签的可容许映射，违反刚证的 $N_2=3$ 下界（$k=2$ 时 $\mathbb P(\mathbb R^2)=\mathbb{RP}^1$，$N_2=3$）。故维数 $=1$ [补：负子空间与零空间不需要排除——它们不影响"$i,j$ 是否在正线的支集里"]。第三段：$y_i,y_j>0$ 都非零，精确谱支集性质（$F(A)_l\ne0\iff l\in S(x)$，$x$ 为正线）给出 $\{i,j\}\subseteq S(x)$，即 $\{i,j\}$ 是支集复形的一条边。

**(c) 机械理由**：$k\ge2$ 是硬条件：$k=1$ 时 $\mathbb{RP}^0$ 是点、$N_1=1$，边论断无意义；整个证明中"用 $N_2=3$ 否决 2 维正子空间"是自我引用——命题自身在 $k=2$ 的实例恰是排除 $\dim\ge2$ 的工具（把 $k$ 一般情形的论证化归到 $k=2$ 的局部障碍，这是下界 $N_k$ 从"二次型维数"而非"同调维数 $k-1$"涌现的机制）。$h$-计数：$N_k=\binom{k+1}{2}$，$m=N_k$ 时源与目标球同维 $N_k-1$，degree 概念才启动；$m>N_k$ 时 $F$ 只是低维往高维的奇映射，无任何刚性。"every pair is an edge"只用到两点正、其余负——如果把 $y$ 取成正坐标 $\ge3$ 个，正子空间维数排除法失效（3 个标签不违反 $N_2=3$），所以恰两个正是最锐利选择。

**Lean 对应**：[Lean] `Simplicial/` 的 `odd_sphere_dimension_bound`（奇映射维数界，经由单纯链/交叉复形 `cross complexes`、`fineCrossMap`、细化、`hemisphereComplex`、`characteristicDegree` 与 Smith 理论证明，完全绕开 Hatcher 2B.6/2B.7 的光滑 degree 语言）；满射性 `…_surjective`；等号边论断在 `Support/` 侧由 `AllPairs`/TwoLabels 型引理承担：选两正坐标的符号向量、正谱线维数 1、精确支集读出边——与论文三步逐一对应。

**(d) [推测] 失败路线**：(1) [措辞] 节首句 "No triangulation of projective space is assumed."（topology.tex 第 7–8 行）反向说明存在一条被避开的路线：先固定 $\mathbb{RP}^{k-1}$ 的某个三角化、对 $f$ 做单纯逼近、再用单纯同调数面。该路线的困难：支集复形 $K$ 由 $f$ 动态定义，与任何预定三角化无兼容性，逼近会破坏"正交 ⇒ 支集不交"的严格性。(2) [措辞] "since the complement of a point is contractible" 这种一步到位的满射论证暗示曾尝试过单独证明满射（例如逐点用 Borsuk–Ulam 反证），最后归约成"非零度 ⇒ 满"的标准事实。(3) [推测] 若跳过 $N_2=3$ 直接用维数计数：正谱子空间 $\ge2$ 维时 $\mathbb{RP}^1\to\Delta^1$ 并不与"球维数"矛盾（$S^1\to S^1$ 可以有奇映射），必须用标签数 $2<N_2=3$ 的组合下界——纯同伦论证给不出这个缺口，这是本命题必须"下界+刚性"两条并证的原因。

### 2.9 引理 4.2（局部计数，`lem:local-degree`；typst 定理 9）

**来源**：topology.tex 第 55–86 行。

**(a) TeX 原文（陈述逐字）**：
> Let $M$ be a closed smooth $n$-manifold, possibly disconnected, and let $q:M\to Y$ be continuous, with $Y$ Hausdorff. Suppose a point $y\in Y$ has a neighborhood homeomorphic to an open subset of $\mathbb R^n$, and that $q$ is smooth in the corresponding coordinates near $q^{-1}(y)$, with invertible derivative at each point of that fiber. Then the fiber is finite, and the image of the total fundamental class of $M$ in
> \[
>  H_n(Y,Y\setminus\{y\})\cong\mathbb F_2
> \]
> is $|q^{-1}(y)|$ modulo two. In particular, if $Y$ is a connected closed $n$-manifold, this parity is the mod-two degree of $q$.

**(b) 推导补全**：四步。①逆函数定理：每点纤维处局部微分同胚 ⇒ 纤维离散；$M$ 紧（closed）⇒ 纤维作为闭子集紧 ⇒ 有限。②切除正合：$H_n(M,M\setminus q^{-1}(y))\cong\bigoplus_{x\in q^{-1}(y)}H_n(M,M\setminus\{x\})$——纤维有限故切除逐点直和成立 [补：这里 $Y$ 侧同胚于 $\mathbb{R}^n$ 开集的假设给出 $H_n(Y,Y\setminus\{y\})\cong H_n(\mathbb R^n,\mathbb R^n\setminus\{0\})\cong\mathbb F_2$，生成元是局部定向类]。③全基本类 $[M]=\sum_x1\cdot[M_x,\dots]$ 在每个直和项坐标为 1（mod 2 无符号问题，即使 $M$ 可定向或不可定向、可分支）。④局部微分同胚把每个 $x$ 处生成元送到 $y$ 处生成元； naturality 合起来即纤维基数 mod 2。

**(c) 机械理由**：每条假设都精确对应 Thm 4.3 里 $F$ 的处境——"$Y$ Hausdorff"保证单点闭、切除合法；"possibly disconnected + total fundamental class"是因为 Thm 4.3 中 $M=\coprod$ 型纤维积与 $\Sigma(V)$ 都可能有分支；"$q$ continuous everywhere but smooth only near the fiber"是核心许可：$F:\Sigma(V)\to\Sigma_m$ 全局只在 nonsingular/full-support  locus 光滑（2.7 节口径）。mod 2 系数让"局部微分同胚保持还是翻转定向"的符号歧义消失——这是全节选 $\mathbb F_2$ 同调的微观原因。证明只有六行、内容初等（教科书切除论证），单独立引理的原因是它被引用三次：(4.8) 的奇数计数、SW 段"degree zero"的对照、系数段 $|L|\equiv1$。

**Lean 对应**：[Lean] 该引理的形式化对应分散在 `LocalParity/MatrixParity.lean`（`regular_facet_level_odd`，经 `trace_patch_models` 局部坐标片）与 `LocalParity/SphereParity.lean`（`regular_facet_level_even`，经 `sphere_null_patch_models`）：Lean 不调用"切除 + 基本类"的同机，而是对具体空间手工构造有限原像的双射计数与奇偶引理——引理 4.2 的"许可证"角色在 Lean 里由 patch model 的局部同胚数据替代。

**(d) [推测] 失败路线**：(1) [措辞] 引言句 "We will count regular preimages of maps which need not be smooth everywhere. The following local form of the degree formula explains why this causes no problem." 直接承认：直接引用光滑映射的 degree 定理这条最自然路线被 $F$ 的全局非光滑性卡死（$\operatorname{tr}|\cdot|$ 在奇异阵折点）。(2) [推测] 备选修补：用光滑映射逼近 $F$ 再取同伦不变性——失败在于论文需要的是"某个具体构造的 $y=(\lambda r,(1-\lambda)g)$ 的纤维与 $G^{-1}(g)$ 双射"这一精确等式，逼近只能给"几乎所有值"的通用陈述，双射信息丢失。(3) [措辞] 末句 "This argument uses no smoothness away from the selected fiber." 是防审稿人质疑的边界声明：它同时告诉读者曾经的坑——任何"先整体光滑化再计数"的中间尝试。

### 2.10 定理 4.3（等号时支集复形是单纯循环，`thm:equality-complex`；typst 定理 10）——全论文技术核心

**来源**：topology.tex 第 88–312 行（全节最长证明，分六个段落小标题）。

**(a) TeX 原文（陈述逐字）**：
> Let $k\ge3$ and $m=N_k$. Suppose $f:\mathbb P(\mathbb R^k)\to\Delta^{m-1}$ is a smooth admissible map. Its support complex $K$ has every pair of labels as an edge, every facet has $k$ vertices, and
> \[
>  \sum_{I\text{ a facet of }K} I
> \]
> is a simplicial cycle over $\mathbb F_2$. Consequently every $(k-2)$-dimensional face lies in a positive even number of facets.

证明逐段重构（论文自带小标题分段，下面每段独立处理）。

**第 0 段（记号与上界）**：边论断引 Prop 4.1。任取面 $I$，置
> \[
>  s=|I|,\qquad J=\{1,\ldots,m\}\setminus I,\qquad a=|J|,\qquad h=N_{k-1}.
> \]
> Since $I$ is a maximal support face, there is a line $x_0$ with $S(x_0)=I$. Every line in $x_0^\perp$ uses only labels in $J$. Proposition~\ref{thm:label-bound}, applied in $x_0^\perp$, gives
> \eqref{eq:facet-size-upper}:\quad $a\ge h,\qquad s=m-a\le N_k-N_{k-1}=k.$

[补] 恒等式 $N_k-N_{k-1}=k(k+1)/2-(k-1)k/2=k$：$k$ 恰是上三角矩阵新增的第 $k$ 行/列元素个数——"$s\le k$"的直觉：一个 maximal 支集至多吃掉"升一维新增的维数"。$x_0^\perp\cong\mathbb{R}^{k-1}$，Prop 4.1 在 $k-1$ 维用 $k-1\ge2$ ⇔ **$k\ge3$**：这就是陈述里 $k\ge3$ 的全部用处之一（另见 SW 段）。"每线只用 $J$"由可容许性：$x\perp x_0\Rightarrow S(x)\cap S(x_0)=\varnothing$。$a\ge h$ 是"$\mathbb P(x_0^\perp)\to\Delta^{a-1}$ 可容许 ⇒ 标签数 $\ge N_{k-1}$"（若 $J$ 中某标签全局未用，实际标签数更小，不等式只会更强 [补]）。

**第 1 段（一个仿射卡上的紧水平集）**：
> \[
>  U_I=\{x\in\mathbb P(V):f_i(x)>0\text{ for every }i\in I\}.
> \]
> Maximality of $I$ implies $S(x)=I$ for all $x\in U_I$. … Moreover, $U_I$ lies in the affine projective chart $\mathbb P(V)\setminus\mathbb P(x_0^\perp)$, because a line orthogonal to $x_0$ cannot use any label in $I$. Choose a regular value $r\in\mathring\Delta_I$ of $f_I$, using Sard's Theorem (Lee Thm 6.10), and put $L=f_I^{-1}(r)\subset U_I$. For now $L$ is allowed to be empty. If $\widetilde r$ denotes $r$ extended by zero on $J$, then $L=f^{-1}(\widetilde r)$ … Hence $L$ is compact. It is a smooth manifold without boundary (Lee Cor 5.14) of dimension
> \eqref{eq:level-dimension}:\quad $\dim L=(k-1)-(s-1)=k-s=a-h.$

[补] 逐步：$x\in U_I\Rightarrow S(x)\supseteq I$；极大性 ⇒ $S(x)=I$ ⇒ $J$ 坐标恒 0 ⇒ $f_I:U_I\to\mathring\Delta_I$ 光滑满到开单形内部（坐标和 1、严格正）。$L=f^{-1}(\tilde r)$ 双向：$\supseteq$ 因 $\tilde r$ 在 $I$ 上严格正 ⇒ 原像在 $U_I$ ⇒ $f_I=r$；$\subseteq$ 因 $x\in L\Rightarrow S(x)=I\Rightarrow$ $J$ 坐标为 0 且和为 $1\Rightarrow f(x)=\tilde r$。紧：闭集于紧 $\mathbb P(V)$。维数：$\dim\mathbb P(V)=k-1$、$\dim\mathring\Delta_I=s-1$，正则水平余维 $s-1$；末等式 $k-s=a-h$ 用 $m=N_k$：$a-h=N_k-s-N_k+N_{k-1}=N_{k-1}-s=k-s$ ✓（此处 $k=N_k-N_{k-1}$ 复用）。"For now $L$ is allowed to be empty"：非空性此刻未知，推迟到 (4.8)。

**路线图段（逐字，重要防御文本，兼入第三节）**：
> If $s<k$, the level-set dimension in \eqref{eq:level-dimension} is positive. We will construct a map on a sphere bundle over $L$ whose regular preimages have odd cardinality, by comparison with $F$. The affine-chart trivialization will force the induced map on the projective bundle to have degree zero when $\dim L>0$, contradicting that count. When $s=k$, the same count will determine the coefficient of $I$ in the desired cycle.

**第 2 段（球丛与乘积平凡化）**：对 $x\in U_I$，可容许性给出 $f$ 在 $\mathbb P(x^\perp)$ 上只用 $J$ 标签，在第 $k-1$ 维空间做延拓构造得奇映射 $G_x:\Sigma(x^\perp)\to\Sigma_a$；引文断言"The subspace-restriction and continuity properties of the extension make these maps a continuous map on the corresponding sphere bundle"——即 Lemma 3.1 的子空间恒等式 $E_V(Q)=E_W(Q|_W)$ 保证 $G(x,B)=G_x(B)$ 连续。纤维积
> \[
>  M=\{(x,B):x\in L,\ B\in\operatorname{Sym}(x^\perp),\ \operatorname{tr}|B|=1\}.
> \]
> 平凡化（逐字要点）："choose the unit representative $u$ of $x$ having positive inner product with a fixed unit representative of $x_0$. Orthogonal projection from $x_0^\perp$ onto $u^\perp$ is invertible and varies smoothly with $x$; orthonormalizing its images of a fixed basis gives a smooth orthonormal trivialization." 结论 \eqref{eq:product-sphere-bundle}：$M\cong L\times S^{h-1}$ 且 $(x,B)\mapsto(x,-B)\leftrightarrow(x,z)\mapsto(x,-z)$；\eqref{eq:bundle-dimension}：$\dim M=(a-h)+(h-1)=a-1$。

[补] 投影 $\pi:x_0^\perp\to u^\perp$ 可逆的机制：$\ker\pi=x_0^\perp\cap\mathbb Ru=\{0\}$（$u$ 与 $x_0$ 内积 $>0$ ⇒ $u\notin x_0^\perp$），维数相同故同构；随 $x$ 光滑（$u(x)$ 局部光滑选取——正内积条件在 $U_I\subset$ 仿射卡内开）。共轭作用 $B\mapsto T_x B T_x^{\top}$ 把 $\Sigma(x^\perp)$ 传输到固定 $\Sigma(x_0^\perp)\cong\mathbb R^{h}$ 中的迹范数球面；再径向归一到欧氏 $S^{h-1}$（2.7 口径），保对径因两步都等变。$h=N_{k-1}=\dim\operatorname{Sym}(x_0^\perp)$ 是纤维球面维数 $h-1$ 的来源。"Equip $M$ with the smooth structure given by the Euclidean sphere bundle. The trace-norm parametrization is smooth near every definite $B$, which is all that will be needed."——光滑结构以欧氏球丛为准，迹范数坐标只在负定处用。

**第 3 段（丛上的奇数纤维）**：取 $\Sigma_a$ 的开负卦限（$J$ 坐标全负）。原像处 $B$ 无正谱子空间（否则正坐标出现）、无核（"the exact support property says that all $J$ labels occur on its range, leaving no label for a kernel line"——逐字）。故 $B<0$，$G$ 在该原像邻域光滑（Lemma 3.2 负定 locus 光滑），Sard 取卦限内正则值 $g$，紧性 ⇒ 纤维有限（可为空）。取 $0<\lambda<1$，$y=(\lambda r,(1-\lambda)g)\in\Sigma_m$（$\|\cdot\|_1$ 和：$\lambda\cdot1+(1-\lambda)\cdot1=1$ ✓ [补]），full-support（$r$ 内部正、$g$ 卦限负 ⇒ 每坐标非零）。双射断言 $F^{-1}(y)\leftrightarrow G^{-1}(g)$：$A\in F^{-1}(y)$ ⇒ $A$ 非异（核 ⇒ 某坐标 0）；正谱线只用 $I$；正谱子空间维数 1，否则 $\ge2$ 维子空间与 $x_0^\perp$（超平面）之交含线（维数公式 $2+(k-1)-k=1$ [补]），该线 $\perp x_0$ 不能用 $I$ 中任何标签，矛盾。记正线为 $x$：正块坐标全非零 ⇒ $S(x)\supseteq I$；负标签不在正线上 ⇒ $S(x)=I$、$x\in U_I$。正坐标和 $=\lambda$ ⇒ 正特征值 $=\lambda$（唯一正线）。得 \eqref{eq:preimage-splitting}：$A=\lambda P_x+(1-\lambda)B,\ B<0\ \text{on}\ x^\perp,\ \operatorname{tr}|B|=1$。子空间公式给出 $f_I(x)=r$、$G_x(B)=g$；反向逐一重建。正则性：源坐标 $(\lambda',x',B')$（正特征值 $\lambda'=\operatorname{tr}A_+$、正特征线 $x'$、归一负部分 $B'$——单根特征值谱投影光滑 [补]），目标坐标 $(\text{正质量},r\text{-块},\text{负块归一})$，$F$ 局部形如 \eqref{eq:triangular-derivative}
> \[
>  (\lambda',x',B')\longmapsto(\lambda',f_I(x'),G_{x'}(B')).
> \]
> 逐块可逆性论证（逐字要点）："The first derivative block is the identity. The second is surjective because $r$ is regular for $f_I$. On the kernel of these two blocks, the third block is the derivative of $G|_M$, which is surjective because $g$ is regular. Thus the full derivative is surjective, and is an isomorphism since source and target both have dimension $m-1$." 于是（Lemma 4.2 + $F$ 奇次数）\eqref{eq:bundle-odd-count}：$|G^{-1}(g)|=|F^{-1}(y)|\equiv1\pmod2$。"This proves, in particular, that $L$ is nonempty."（若 $L=\varnothing$ 则 $G^{-1}(g)=\varnothing$，偶数 0，矛盾 [补]。）

**第 4 段（二重覆叠强制面大小 $=k$）**：$G$ 对球变量奇 ⇒ 商映射 $\overline G:L\times\mathbb{RP}^{h-1}\to\mathbb{RP}^{a-1}$。$w,u$ 为各自对径二覆叠关联实线丛的一阶 Stiefel–Whitney 类。等变性"identifies the pullback of the target sphere cover with $L\times S^{h-1}\to L\times\mathbb{RP}^{h-1}$"，具体同构逐字："the identification sends $(x,z)$ to $((x,[z]),G(x,z))$ and is an isomorphism on each two-point fiber." 由自然性（Hatcher VB Thm 3.1(a)）得 \eqref{eq:cover-class}：$\overline G^*w=\operatorname{pr}_2^*u$，且声明"There is no contribution from $H^1(L)$ in this identity."。若 $a>h$：$u^h=0$（Hatcher 3.19：$H^*(\mathbb{RP}^{h-1};\mathbb F_2)=\mathbb F_2[u]/u^h$），$\overline G^*(w^{a-1})=\operatorname{pr}_2^*(u^{a-1})=0$（$a-1\ge h$）。源、目标都是闭 $(a-1)$-流形，$w^{a-1}$ 是目标顶类 ⇒ 对顶基本类求值 ⇒ mod-2 次数 0。但 $[g]$ 在商坐标中是正则值且"every preimage of $[g]$ has exactly one representative mapping to $g$"（$\{z,-z\}$ 中恰一个映到 $g$——负卦限与正卦限不交，另一代表映到 $-g$ [补]）⇒ $[\bar g]$ 的原像数 $=|G^{-1}(g)|$ 为奇（4.8），与次数 0 矛盾。结合 $a\ge h$：$a=h,\ s=k$ 对每个面成立。

[补] 维数自洽：$\dim(L\times\mathbb{RP}^{h-1})=(a-h)+(h-1)=a-1=\dim\mathbb{RP}^{a-1}$ ✓——SW 论证只在 $\dim L=a-h>0$ 时有"可杀"的空间；$a=h$ 时源 $=\mathbb{RP}^{h-1}$、$u^{h-1}\ne0$，论证自动失效，恰与二分吻合。

**第 5 段（面系数）**：现在 $\dim L=0$，$L$ 有限；每个 $G_x:\Sigma(x^\perp)\to\Sigma_h$ 同维奇映射 ⇒ 奇次数（Hatcher 2B.6）；$g$ 对每个纤维映射正则（"Regularity of $g$ for $G$ implies its regularity for each such fiber map" [补：因 $G$ 的三角雅可比第三块 $=dG_x$]），每纤维贡献奇数 ⇒ \eqref{eq:facet-odd-count}：$|f^{-1}(\widetilde r)|=|L|\equiv1\pmod2$。每个面 $k$ 顶点 ⇒ $\dim K=k-1$；经单纯–奇异同调识别（Hatcher 2.27）考虑 $f_*[\mathbb P(V)]\in H_{k-1}(|K|)$（逐字构造："The interior point $\widetilde r$ of the facet $I$ has a neighborhood in $|K|$ contained in that facet. Passing to $H_{k-1}(|K|,|K|\setminus\{\widetilde r\})$ reads the coefficient of $I$ in a simplicial top cycle."）。正则性 + Lemma 4.2 + (4.10) ⇒ 该系数为 1；每个面同理；$(k-1)$-复形无 $k$-链 ⇒ 顶同调类恰是顶循环 ⇒ $f_*[\mathbb P(V)]$ 由全部面之和表示；其边界为 0 ⇒ 每个余维 1 面在偶数个面中出现；pure ⇒ 正。

[补] "$f$ 映入 $|K|$"：$f(x)$ 的支集 $S(x)\in K$、坐标非负和 1 ⇒ $f(x)\in|\Delta_{S(x)}|\subseteq|K|$ [补]。"$\tilde r$ 在 $|K|$ 有邻域含于面 $I$"：$\tilde r$ 是面 $I$ 的开单形内点；其它面 $I'$ 若含 $\tilde r$ 邻域点则 $I\subseteq I'$……由 $I$ 极大 ⇒ 只 $I$ 自己 [补]。读系数：相对群 $H_{k-1}(|K|,|K|\setminus\{\tilde r\})\cong\mathbb F_2$ 的像 $=\langle I\rangle$ 系数 mod 2；而 $\sum I$ 在局部与 $f_*[\mathbb P(V)]$ 一致，$f_*[\mathbb P]$ 局部像 $=|f^{-1}(\tilde r)|\equiv1$。

**(c) 机械理由汇总**：$k\ge3$（Prop 4.1 用于 $x_0^\perp$ 需 $k-1\ge2$；SW 段的商丛维数才非平凡）；$m=N_k$（否则 degree 无定义）；$\lambda\in(0,1)$ 开区间（双块非零 ⇒ full-support ⇒ 非异 ⇒ 局部坐标合法；端点 $\lambda=0,1$ 各自塌掉一侧论证）；负卦限选 $g$（逼 $B$ 负定 ⇒ $G$ 光滑可用）；$h=N_{k-1}$、$a=|J|$、$s=|I|$ 三分量互锁 $s+k=a=h$ 时刻 $L$ 零维（系数段前提）；$u^h=0$ 与 $a>h$ 的严格不等号；Sard 用两次（$r$ 与 $g$）都是"构造正则值"而非全局定理。

**Lean 对应（整节映射）**：[Lean] 第 0 段 ↔ `Support/` 面大小界链（`face_size_le_four`、`support_dim_bound` 型）；第 3 段奇数 ↔ `LocalParity/MatrixParity.lean` `regular_facet_level_odd`（经 `trace_patch_models`——迹范数坐标片模型，即论文三角雅可比的实现化）；第 4 段偶数 ↔ `LocalParity/SphereParity.lean` `regular_facet_level_even`（`sphere_null_patch_models`）；两者对撞 ↔ `NoFreeRidge`（无自由脊）里 `zero_ne_one`；SW 段整体被 `chart_surgery_impossible`（补界不可能性引理，单纯/组合的"卡手术"语言）替代——特征环计算在 Mathlib 中无现成库，Lean 改走覆叠-示性类初等化的组合等价物；$G_x$ 丛映射连续性 ↔ `MatrixGeometry/` 延拓模块的 subspace 恒等式（2.5 节 `SphereMoments` 链）。

**(d) [推测] 失败路线**：(1) [措辞] 路线图段本身宣告放弃"直接对 $f$ 用 Sard 数 $f^{-1}(\tilde r)$"：那样只能得到 $|L|\equiv\deg F$ 当 $s=k$；$s<k$ 时水平集正维数、Sard 不适用（目标维数 $s-1$ 可超过源维数 $k-1$ 时正则值可为空、无信息）——论文把 $s<k$ 的排除外包给球丛上的对径/示性类论证。(2) [措辞] "There is no contribution from $H^1(L)$ in this identity."：若平凡化失败（非仿射卡上 $M\to L$ 非平凡），$\overline G^*w=\operatorname{pr}_2^*u+\pi_1^*\beta$，$\beta\in H^1(L)$ 的幂次可以补足顶类、degree 不再为零——此句标记了该坑；对应地 $U_I$ 必须在仿射卡内（正交线禁用 $I$ 标签），这不是装饰而是承重墙。(3) [推测] 用 Borsuk–Ulam/交错映射维数论直接证 $s\le k$ 并期望免掉循环结构——但定理要的是"和是循环"这一整体信息，逐面独立论证给不出系数一致性；(4.10) 段必须把每个面单独"读系数"，说明作者需要逐面局部论证拼接全局循环。(4) [Lean] 形式化侧证据：SW 特征类语言完全未出现（grep 无 Stiefel/Whitney/cup-product 论证），奇偶对撞被拆成两个独立 patch-model 引理——提示数学证明曾按"先在矩阵侧、再在球面侧各数一次"组织，Lean 保留了这一拆分而替换了中间的拓扑机件 [推测]。

### 2.11 定义 5.1（六标签三角系，`def:six-system`；typst 定义 11）与引理 5.2（`lem:six-from-map`；typst 引理 12）

**来源**：six-labels.tex 第 1–38 行。

**(a) TeX 原文（定义逐字）**：
> A \emph{six-label triangle system} on a set $C$ of cardinality six is a collection $\mathcal T\subseteq\binom{C}{3}$ such that
> \begin{enumerate}
> \item exactly one of $T$ and $C\setminus T$ belongs to $\mathcal T$ for each $T\in\binom{C}{3}$;
> \item every pair of elements of $C$ belongs to exactly two members of $\mathcal T$.
> \end{enumerate}

节首句（兼入第三节）："We call a face with three vertices a \emph{triangle}, and a face with four vertices a \emph{tetrahedron}. These names refer to faces of the support complex, not to geometric simplices in projective space." 以及 "Our eventual application is to the six labels complementary to a tetrahedral facet of the ten-label support complex."

引理 5.2 陈述逐字：
> The triangles of the support complex of an admissible map $f:\mathbb{RP}^2\to\Delta^5$ form a six-label triangle system.

**(b) 推导补全（引理 5.2 证明四步）**：①Thm 4.3（$k=3,m=N_3=6$）给 $K$ pure 2 维、全 15 条边、每边在正偶数个三角形中。②互补对排除（逐字）："Two complementary triples cannot both be triangles: choose witness lines $x,y\subset\mathbb R^3$ whose supports contain the respective triples. A line perpendicular to both exists and, by admissibility, could use none of the six labels." [补] $\mathbb R^3$ 中两线 $x,y$ 的共同正交补 $(\mathbb Rx+\mathbb Ry)^\perp$ 维数 $\ge3-2=1$，取其中一线 $z$；$z\perp x\Rightarrow S(z)\cap S(x)=\varnothing$，$z\perp y\Rightarrow S(z)\cap S(y)=\varnothing$，而 $S(x)\cup S(y)\supseteq T\cup(C\setminus T)=C$ 全 6 标签 ⇒ $S(z)=\varnothing$，与 $\sum f_i(z)=1$ 矛盾（可容许映射每点至少一个正坐标）。③计数：$\binom{6}{3}=20$ 个三元组配成 10 个互补对 ⇒ 三角形数 $\le10$；边–三角形关联计数：15 条边每条 $\ge2$ 个三角形、每三角形载 3 条边 ⇒ 三角形数 $\ge 2\cdot15/3=10$。④夹逼 ⇒ 处处等号：每互补对恰一个、每边恰 2 个三角形 ⇒ 条件 1、2 成立。

**(c) 机械理由**："恰 2"来自"正偶数 + $\ge2$ 且被 $\le10$ 总量钉死"——若 Thm 4.3 只给"偶数"而无正性，$\ge$ 计数失效；纯在性（pure）同样承重。$N_3=6$ 恰是 $\mathbb{RP}^2\to\Delta^5$ 的等号情形——本节是 Thm 4.3 的最小实例，随后在十标签节里作为"面补集上的局部结构"复用。关联数 $2\cdot15/3=10$ 与互补对数 10 的相等是这套组合"恰好闭合"的核心算术：$|\binom{C}{3}|/2=10$、$2|E|/3=10$ 两条独立给出同一个 10——任何一边再大就矛盾，这解释了为什么公理化时选"恰 2"而不是"偶数"。

**Lean 对应**：[Lean] 无直接对应模块——数学论文的六标签组合在 Lean 中被并入十标签十元系统 `TenLabels/Labels.lean` 的 `TenSystem` 六字段公理化（`complementary`、`pair_count` 两字段即定义 5.1 的 (1)(2)），六标签引理 5.2 的"从映射导出"步骤对应 `Admissible.support_ten_system`（2.3/四节）一次性给出全部组合公理，而非分六/十两级。

**(d) [推测] 失败路线**：(1) [措辞] "These names refer to faces of the support complex, not to geometric simplices in projective space."——防混淆声明暗示草稿曾用几何三角形状叙述，而 $\mathbb{RP}^2$ 里根本没有直线三角形与标签对得上。(2) [推测] 若不等号夹逼、直接构造 $\mathcal T$：已知此类三元组的例子（如 Steiner 三元系 $S(2,3,6)$ 不存在！——$2\cdot15/3=10$ 与 $v=6,k=3$ 的可解性恰卡边界，BIBD $\lambda=2$ 参数 $b=10,r=4$ 存在但再加互补性后唯一化为 5-圈结构），论文选"从映射自动存在"而非枚举。(3) [推测] 共同正交线论证在 $\mathbb R^3$ 里维数余量恰 1（两线张成 $\le2$ 维），若换 $\mathbb R^4$ 中三四面体（6.1 用"线 $\perp$ 三线"，余量恰 0）——同一机件按维数反复使用，失败路线是"统一引理化"（论文实际就分两处各写一遍，因正交组大小不同 [措辞：ten-labels 第 26–29 行重述])。

### 2.12 引理 5.3（三角系四性质，`lem:six-properties`；typst 引理 13）

**来源**：six-labels.tex 第 40–99 行 + Figure `fig:six-label-paths`（102 行 input）。

**(a) TeX 原文（陈述逐字）**：
> Let $\mathcal T$ be a six-label triangle system on $C$.
> \begin{enumerate}
> \item Every vertex link is a cycle of length five.
> \item Every four-element subset of $C$ contains a triangle, but does not contain all four of its triples as triangles.
> \item If $a,b\in C$ are distinct and $R\subset C\setminus\{a,b\}$ has cardinality three, the link graphs at $a$ and $b$, restricted to $R$, are different. In particular, no transposition of two labels preserves $\mathcal T$.
> \item The triangles contained in any five-element subset of $C$ determine $\mathcal T$ uniquely.
> \end{enumerate}

Link graph 定义逐字："its \emph{link graph at $a$} has vertex set $C\setminus\{a\}$ and an edge $\{u,v\}$ precisely when $\{a,u,v\}\in\mathcal T$."

**(b) 推导补全**：
(1) 度正性：$a$ 的 link 图中顶点 $u$ 的度 $=$ 含 $\{a,u\}$ 的三角形数 $=2$（公理 2）。2-正则简单图 = 长度 $\ge3$ 的圈的不交并；5 个顶点 ⇒ 只能单一 5-圈（$5=3+2$ 不允许、$4+1$ 不允许、$5$ ✓）。
(2) 设 $A$ 四元、取 $a\in A$：link 是 5-圈 $C_5$；"A five-cycle has no independent set of size three: if three vertices were independent, the three gaps following them around the cycle would each contain another vertex, requiring at least six vertices."（逐字；$\alpha(C_5)=2$ 的标准证明）。于是 $A\setminus\{a\}$（3 点）在 link 中有边 ⇒ $A$ 含三角形。若 $A$ 的 4 个三元组全是三角形：link 在 $a$ 含 $A\setminus\{a\}$ 上的 3-圈，而 $C_5$ 无 3-圈（无弦、围长 5）⇒ 矛盾 [补：4 个三元组对应 $a$ 遍历 $A$ 时 $A\setminus\{a\}$ 的四种删一点，全三角形 ⇒ 对某 $a$ 其删余三点两两相邻]。
(3) 记 $C=\{a,b,c,d,e,f\}$，含 $\{a,b\}$ 的恰两个三角形设为 $\{a,b,c\},\{a,b,d\}$（$e,f$ 不与 $\{a,b\}$ 成三角形，由公理 2"恰 2"）。从 $a$ 的 5-圈中删 $b$：剩 $\{c,d,e,f\}$ 上的路，端点 $c,d$（它们在圈上恰与 $b$ 相邻 [补：$b$ 在 link($a$) 中的邻点是 $\{c,d\}$，因 $\{a,b,c\},\{a,b,d\}\in\mathcal T$ 且恰 2]），中间边 $\{e,f\}$；另两边是匹配 $M_1=\{\{c,e\},\{d,f\}\}$ 或 $M_2=\{\{c,f\},\{d,e\}\}$。同理 $b$ 的 link 删 $a$ 得同端点同中间边的另一条路。"The two paths must use opposite matchings"：若同为 $M_1$，三角形 $\{a,c,e\},\{a,d,f\}$ 的互补 $\{b,d,f\},\{b,c,e\}$ 被禁，而这两恰是 $M_1$ 路径在 $b$-link 需要的边……逐字："if the first uses $M_1$, the triangles $\{a,c,e\}$ and $\{a,d,f\}$ exclude their complementary triples $\{b,d,f\}$ and $\{b,c,e\}$, forcing the second path to use $M_2$." 两路对称差 = $M_1\cup M_2$ 的 4-圈 $\{c,e,d,f\}$；4-圈中任 3 顶点仍含边（$\binom{4}{3}$ 子图是 3 顶点 2–3 条边，总相邻）⇒ 限制到任意 $R$（3 元）两图不同。换位数：$(a\ b)$ 保持 $\mathcal T$ ⇒ $a,b$ 的 link 在置换下同构、限制到 $R$ 相同，矛盾 ⇒ "no transposition preserves $\mathcal T$"。[补] 图注（Figure 3 逐字要点）："The complementary-triple rule forces opposite matchings… share the edge $\{e,f\}$ and use opposite matchings between $\{c,d\}$ and $\{e,f\}$ (shown in blue). …The crossing in (c) is not a vertex." 最后一句是给读者的防误读提示——交叉非顶点。
(4) 五元子集 $C\setminus\{z\}$ 决定全系统：含 $z$ 的三元组 $T\ni z$ 的互补 $C\setminus T$ 落在五元子集内，公理 1 用互补对偶读回 $T\in\mathcal T\iff C\setminus T\notin\mathcal T$。不含 $z$ 的三元组本来就在其中。

**(c) 机械理由**：5 = $6-1$（link 顶点数），2-正则 + 5 顶点 ⇒ $C_5$ 唯一——"5"是所有四个性质的共振点：无独立 3-集（$\alpha(C_5)=2$）恰好支撑"任意 4 元含三角形"；无 3-圈恰好支撑"不含全部 4 三元组"；删一点成 4-点路（端点+中间边+匹配二择）恰好支撑性质 (3) 的匹配对论证。若标签数是 7（$C_6$ 有独立 3-集），性质 (2) 失效——这就是六标签恰好够用、而不能再少的机制。"$|R|=3$ 限制"而非整图比较：后面 6.2 只用 3 元限制（换 $b,c$ 固定 $R$ 四点中作用在非 $R$ 部分），最小够用。

**Lean 对应**：[Lean] 无独立六标签层：`TenLabels/Labels.lean` 的 `TenSystem.complementary/pair_count` 是公理 1、2；性质 (2)(3)(4) 在 Lean 中不作为引理出现，而是被 `FiniteCases` 穷举搜索整体吸收（机器验证"无十元系统"时不需要人手四性质）。

**(d) [推测] 失败路线**：(1) [措辞] 性质 (3) 陈述里"In particular, no transposition of two labels preserves $\mathcal T$"是后置推论式写法——主干是"link 限制不同"，换位数只是 corollary 化；提示 6.2 真正消费的是限制版本（三换位循环固定 $R$），若只证"无换位自同构"（全局层面）对 6.2 不够用。(2) [推测] 直接枚举所有六标签三角系（$\le 2^{20}$ 剪枝到 $2^{10}$ 互补对选择）验证四性质——数学证明选了图论论证，Lean 反过来用穷举精神（145 文件机器搜索是十标签版），说明作者知道枚举路线可行但不可读 [证据：两种风格的对照 + FiniteCases 存在]。(3) [措辞] 图注 "Panel (a) shows one complementary pair for this choice."——(a) 面板只画一个互补对而非整个系统，暗示完整画图会呈现冗余，匹配对偶只有 $M_1/M_2$ 二选一（同构唯一），这是性质 (3) 的"两种情形合一"证据。

### 2.13 引理 6.1（面补集系统，`lem:facet-complement`；typst 引理 14）与引理 6.2（每三角形恰两个四面体，`lem:two-tetrahedra`；typst 引理 15）

**来源**：ten-labels.tex 第 1–67 行。

**(a) TeX 原文（节首框架句，兼入第三节）**：
> We prove that an admissible map $\mathbb{RP}^3\to\Delta^9$ cannot exist. Its support complex would have tetrahedral facets. Each facet forces a six-label triangle system on its complement; transporting these systems between adjacent facets will constrain the whole complex.

引理 6.1 陈述逐字：
> Suppose $f:\mathbb{RP}^3\to\Delta^9$ is admissible, let $K$ be its support complex, and let $S$ be a tetrahedron of $K$. The triangles of $K$ contained in the six-element set $C=[10]\setminus S$ form a six-label triangle system. In particular, two tetrahedra of $K$ cannot be disjoint.

引理 6.2 陈述逐字：
> Every triangle of $K$ belongs to exactly two tetrahedra.

**(b) 推导补全（6.1）**：①Thm 4.3：$k=4,m=10$，$K$ pure 3 维、全边、面和循环、每三角形在正偶数个四面体中。②见证线 $x$（$S(x)=S$）限制到 $\mathbb P(x^\perp)\cong\mathbb{RP}^2$ 只用 $C$ 标签；"It uses all six: otherwise the lower bound in Proposition 4.1, applied in dimension three, would be violated."（逐字；$<6=N_3$ 个标签不可能支持 $\mathbb{RP}^2$ 的可容许映射）。③由引理 5.2，限制系统的三角形是 $K$ 在 $C$ 上三角形的子集，且自身构成六标签三角系。④无额外三角形：若有互补对 $T,C\setminus T$ 都是 $K$ 的三角形，取 $S,T,C\setminus T$ 的见证线（3 条），"In $\mathbb R^4$ there is a line perpendicular to all three"——3 条线张成 $\le3$ 维，正交补 $\ge1$ 维 [补：与 5.2②同一机件，余量从 1 降到 $4-3=1$ 仍够]；该线的支集避开 $S\cup T\cup(C\setminus T)=[10]$ 全部 ⇒ 空支集矛盾。⑤若 $S'$ 与 $S$ 不交：$S'\subseteq C$ 的 4 个三元组全是三角形，违反 5.3(2)（四元集不能含全部 4 三元组）。

**过渡句（逐字，全节纲领，兼入第三节）**："The rest of the proof is purely combinatorial."

**(c) 续（6.2）**：先证换位不变性引理（第一段）：若两面差一个换位 $(a\ b)$（即 $S=(S'\setminus\{b\})\cup\{a\}$ 型），则 $(a\ b)$ 把 $S$ 的补系载到 $S'$ 的补系：共享 5 个标签上两系统都是"$K$ 在其上的三角形"（交换不动共享标签的三角形），由 5.3(4)（五元决定系统）⇒ 全域一致。第二段（三四面体排除，逐字图示）：设 $T\cup\{a\},T\cup\{b\},T\cup\{c\}$ 含同一三角形 $T$，$R=[10]\setminus(T\cup\{a,b,c\})$（$|R|=10-3-3=4$ [补]）。相继输运
> \[
>  R\cup\{b,c\}\xrightarrow{(a\ b)}R\cup\{a,c\}\xrightarrow{(b\ c)}R\cup\{a,b\}\xrightarrow{(c\ a)}R\cup\{b,c\}
> \]
> "preserves the initial system. The composite fixes $R$ and exchanges $b$ and $c$, contradicting Lemma 5.3(3)." [补] 链条把三个换位依次作用在"当前补集"上，净置换 $\sigma=(a\ b)\circ(b\ c)\circ(c\ a)$（右起先作用）：$\sigma(a)=a$（轨道 $a\to c\to b\to a$）、$\sigma(b)=c$（$b\to b\to c\to c$）、$\sigma(c)=b$（$c\to a\to a\to b$），即 $\sigma=(b\ c)$——与逐字结论"fixes $R$ and exchanges $b$ and $c$"吻合（先按"作用在当前位置标签"直觉算会误得 3-循环，关键是把每个换位看作对补集命名空间的映射、右起复合）。] 由换位不变性，三步输运都是"沿共三角形 $T$ 的相邻面输运"、系统不变；净效果 $(b\ c)$ 保持 $S$ 补系 ⇒ 违反 5.3(3)（取 $R$ 中任一三元 $\{r,s,t\}$：link($b$) 与 link($c$) 限制到其上必须不同，而 $(b\ c)$ 保持系统则相同）。故每三角形 $\le2$ 个四面体；Thm 4.3 的"正偶数"钉死恰 2。

**(c) 机械理由**：$|R|=4$：$10-|T|-3=10-3-3=4$，链条中每个"补集"$=R\cup\{两标签\}$（六元）——正是六标签系统的舞台。三置换复合恰为一个换位是精算结果：$(a\ b)(b\ c)(c\ a)=(b\ c)$（上面已核）；若只两步则得 3-循环、5.3(3) 不适用（3-循环不被禁止——禁的只有换位）。"恰 2"用到偶数性与 $\le2$ 夹逼。6.1 中"不交四面体排除"用到 5.3(2) 的"4 元含三角形但不含全部 4 三元组"两半中的后半。

**Lean 对应**：[Lean] `no_disjoint_tetrahedra`（`Support/` 或 `TenLabels` 上游，26–31 行对应物）；`face_extends_four`/`four_support_face`；换位输运不变性无独立引理——`TenSystem` 公理化层面直接消费 `pair_count`/`complementary`；引理 6.2 在 Lean 中体现为 `TenSystem` 字段与 `FiniteCases` 前置归约 `relabel`（`Equiv.Perm.exists_map_finset_eq` 把固定四面体归一为 $\{0,1,2,3\}$）。

**(d) [推测] 失败路线**：(1) [措辞] 证明先建立"输运引理"再用的两层结构提示：直接对 $K$ 全局枚举四面体邻接图（按共面相邻）不可行——$K$ 未知、四面体数未定，只能沿链局部输运。(2) [推测] 若用"每三角形 $\ge2$"（Thm 4.3 原话）配合全局计数（$e\cdot2=t\cdot4$：三角形 $\times$3 与四面体 $\times$4 关联数）推整体矛盾——10 标签 $\binom{10}{3}=120$ 个可能三角形，全局计数不矛盾（存在满足全部计数的抽象复形），失败在于循环 + 纯性 + 边全只约束局部；需要输运刚性。(3) [证据：Lean 差异] Lean 完全没有 6.2 的等价人证——机器穷举替代，说明作者亦承认此引理"可读但可机器化"，两版本并存是素材里"人证 vs 机证"的分水岭。

### 2.14 引理 6.3（短链接，`lem:short-links`；typst 引理 16）与引理 6.4（伙伴块，`lem:partner-blocks`；typst 引理 17）

**来源**：ten-labels.tex 第 69–175 行 + Figure `fig:partner-links`（157 行 input）。

**(a) TeX 原文（edge link 定义逐字）**：
> For an edge $D$ of $K$, define its \emph{link graph} to have as vertices the labels $v\notin D$ for which $D\cup\{v\}$ is a triangle, and as edges the pairs $\{v,w\}$ for which $D\cup\{v,w\}$ is a tetrahedron.

引理 6.3 陈述逐字：
> Every connected component of an edge link is a cycle of length three or four.

引理 6.4 陈述逐字：
> Fix a tetrahedron $S$ of $K$. For $v\in S$, let $p(v)$ be the unique label outside $S$ such that $(S\setminus\{v\})\cup\{p(v)\}$ is a tetrahedron. For each distinct value $y$ of $p$, set
> \[
>  B_y=p^{-1}(y)\cup\{y\}.
> \]
> The sets $B_y$ are disjoint and have at least two elements. For every choice $q_y\in B_y$, the set
> \[
>  \bigcup_{y\in p(S)}(B_y\setminus\{q_y\})
> \]
> is a tetrahedron. Moreover, every tetrahedron of $K$ contains at least two elements of one of these blocks.

**(b) 推导补全（6.3）**：顶点度 2：link 顶点 $v$（$D\cup\{v\}$ 三角形）关联的 link 边数 $=$ 含该三角形的四面体数 $=2$（6.2）⇒ 每分支简单圈。禁 5-路：设 $v_0,\dots,v_4$ 相继相邻（即 $D\cup\{v_i,v_{i+1}\}$ 四面体，$i=0..3$），$R$ 为 $D\cup\{v_0..v_4\}$ 之外的 3 个标签（$10-2-5=3$ [补]）。四个四面体的补系沿链输运（逐字链条）：
> \[
>  R\cup\{v_2,v_3,v_4\}\xrightarrow{(v_0\ v_2)}R\cup\{v_0,v_3,v_4\}\xrightarrow{(v_1\ v_3)}R\cup\{v_0,v_1,v_4\}\xrightarrow{(v_2\ v_4)}R\cup\{v_0,v_1,v_2\}.
> \]
> [补：每步是相邻两四面体（差一换位）间输运，由 6.2 第一段换位不变性；如第一步 $R\cup\{v_2,v_3,v_4\}=[10]\setminus(D\cup\{v_0,v_1\})$ 经 $(v_0\ v_2)$ 映到 $[10]\setminus(D\cup\{v_1,v_2\})$ 的补 $R\cup\{v_0,v_3,v_4\}$？核算：$(v_0\ v_2)$ 把 $\{v_2,v_3,v_4\}\mapsto\{v_0,v_3,v_4\}$ ✓，相邻对 $D\cup\{v_0,v_1\}\to D\cup\{v_2,v_1\}$——是共 $D\cup\{v_1\}$ 边的两面，链条顺序与图中边一致。] 复合置换 $\tau=(v_2\ v_4)\circ(v_1\ v_3)\circ(v_0\ v_2)$（右起先作用）直接演算：$v_4\to v_4\to v_4\to v_2$；$v_2\to v_0\to v_0\to v_0$；$v_0\to v_2\to v_2\to v_4$；$v_1\leftrightarrow v_3$；$R$ 逐点不动——即 $\tau$ 在 $\{v_0,v_2,v_4\}$ 上是 3-循环 $v_4\mapsto v_2\mapsto v_0\mapsto v_4$ 并乘 $(v_1\ v_3)$；论文只消费 $\tau(v_4)=v_2$，与逐字结论"The composite fixes $R$ and sends $v_4$ to $v_2$"吻合。系统不变 ⇒ 首系 $\mathcal T_{\text{first}}$（$D\cup\{v_0,v_1\}$ 之补 $R\cup\{v_2,v_3,v_4\}$ 上的六系）与末系（$D\cup\{v_3,v_4\}$ 之补 $R\cup\{v_0,v_1,v_2\}$）满足：$\{v_4,r,s\}\in\mathcal T_{\text{first}}\iff\{v_2,r,s\}\in\mathcal T_{\text{last}}$ 对每对 $r,s\in R$。中间三元组 $\{v_2,r,s\}$ 同时属于首补（$R\cup\{v_2,v_3,v_4\}\supseteq\{v_2,r,s\}$）与末补（$R\cup\{v_0,v_1,v_2\}$）——两处成员资格都等于其在 $K$ 中的成员资格（"its membership in either system is simply its membership in $K$"，逐字）。⇒ 首系中 $v_4$ 与 $v_2$ 的 link 限制到 $R$ 相同，违反 5.3(3)。长 $\ge5$ 圈含 5-路 ⇒ 组件长 $\le4$。

**(c) 续（6.4）**：伙伴存在唯一：$S\setminus\{v\}$ 是三角形（$|S|=4$ 删一点），6.2 给恰两面含它，其一为 $S$，另一面 $=(S\setminus\{v\})\cup\{p(v)\}$，$p(v)\notin S$（$S$ 的顶点集上唯一四面体是 $S$ 本身——纯性 + 极大性 [补：若 $p(v)\in S$ 则面 $=S$]）。块定义 $B_y=p^{-1}(y)\cup\{y\}$：像点并入原像纤维 ⇒ 不交（不同 $y$ 的纤维不交、$\{y\}$ 互异）；$\ge2$ 元（纤维非空）。

**块交换不变性**（核心段）：置 $S'=(S\setminus\{v\})\cup\{a\}$，$a=p(v)$，伙伴映射 $p'$。已得 $p'(a)=v$（对称性：$S'$ 删 $a$ 回到 $S\setminus\{v\}$，其两面为 $S,S'$，$S$ 补 $S'$ 缺的正是 $v$ [补]）。对 $w\in S\setminus\{v\}$：$D=S\setminus\{v,w\}$（二元 = 边），$b=p(w)$。$D$-link 含三条边（逐字）：
> \[
>  \{v,w\},\qquad \{w,a\},\qquad \{v,b\}.
> \]
> [补机制：$\{v,w\}$ 因 $D\cup\{v,w\}=S$ 四面体；$\{w,a\}$ 因 $D\cup\{w,a\}=S'\setminus\{v\}\cup... = (S\setminus\{v\}\cup\{a\})\setminus\{w\}\cup\{w,a\}$——即 $S'$ 含 $D\cup\{w,a\}$？$S'=(S\setminus\{v\})\cup\{a\}\supseteq D\cup\{w,a\}$ ✓ 是四面体；$\{v,b\}$ 因 $D\cup\{v,b\}=(S\setminus\{w\})\cup\{b\}$ 是 $w$ 面 ✓。] 两情形（Figure `fig:partner-links` 逐字图注："The known edges $\{v,w\}$, $\{w,a\}$ and $\{v,b\}$ form a triangle when $a=b$. When $a\ne b$, they form a path on four vertices; the short-link condition forces the closing edge $\{a,b\}$ (dashed). In both cases $p'(a)=v$, and the blocks retain their elements."）：
- 情形 $a=b$：三边成 3-圈；每顶点度 2 ⇒ 该圈是整个组件 ⇒ $D\cup\{a,v\}$ 是另一四面体 ⇒ $p'(w)=v$。
- 情形 $a\ne b$：路 $a,w,v,b$ 四顶点；6.3 ⇒ 组件 $\le4$、度 2 ⇒ 补边 $\{a,b\}$ 成 4-圈 ⇒ $D\cup\{a,b\}$ 四面体 ⇒ $p'(w)=b=p(w)$。
合并公式（逐字）：
> \[
>  p'(a)=v,\qquad p'(w)=\begin{cases} v,&p(w)=a,\\ p(w),&p(w)\ne a.\end{cases}
> \]
> 块结构不变（逐字）："The block formerly indexed by $a$ is now indexed by $v$ and has the same elements; all other blocks are unchanged." [补验证：$p'^{-1}(v)=\{a\}\cup\{w:p(w)=a\}=p^{-1}(a)\cup\{v\}$? $p^{-1}(a)\ni v$ 且含全部 $p(w)=a$ 的 $w$ ⇒ $p'^{-1}(v)=p^{-1}(a)$，块 $B_a=p^{-1}(a)\cup\{a\}\to B'_v=p'^{-1}(v)\cup\{v\}=p^{-1}(a)\cup\{v\}$——元素集只差把指标 $a$ 换成 $v$？核对：$B_a$ 含 $a$ 与 $p^{-1}(a)\ni v$；新块含 $v$ 与 $p^{-1}(a)$（含 $v$ 与那些 $w$）——$\{a\}$ 换出、$\{v\}$ 已在内 ⇒ 新块 $=(B_a\setminus\{a\})\cup\{v\}$? 论文断言"has the same elements"——当 $a\in B_a$ 被 $v$ 顶掉？不：$B'_v=p'^{-1}(v)\cup\{v\}$，$p'^{-1}(v)=\{a\}\cup\{w:p(w)=a\}$（上面两式），故 $B'_v=\{a,v\}\cup\{w:p(w)=a\}=B_a$ ✓ 同元素（$a$ 仍在、$v$ 原本就在）。其余 $y\ne a$：$p'^{-1}(y)=p^{-1}(y)$（$w$ 们伙伴不变）⇒ $B'_y=B_y$ ✓。]

**删一构造全部四面体**：$S$ 含每块除其指标伙伴 $y$ 外的全部元素（$B_y\cap S=p^{-1}(y)$，删的是 $y\notin S$）；交换不变性使此断言对任何链上四面体成立。"To change the omitted element of a block from $q$ to $u$, replace the present element $u$ by its partner $q$"——对想改动的每个块做一次交换（沿该块某 $v$ 跨面），实现任意删选组合；基数 $\sum_y(|B_y|-1)=|S|=4$ 保证结果集恰 4 元（四面体大小）。[补] 各块独立改动可交换（一次交换只动一个块），故所有 $\prod_y|B_y|$ 种删选都给出四面体。

**尾断言**（每四面体在某块中 $\ge2$ 元）：反设 $T$ 每块至多 1 元；对每块：含 $T$ 元则删它，否则删任意；所得删选四面体 $T^*\subseteq\bigcup B_y$ 与 $T$ 不交（$T$ 的每元被对应块删掉，$T^*$ 取的是其余元），违反 6.1（不交四面体禁）。

**(c) 机械理由**：link 长度上限 $\le4$ 是 6.4 两情形分诊的引擎——3-圈封闭（$a=b$）或 4-圈补边（$a\ne b$），无第三种；5-圈允许时路 $a,w,v,b$ 可延而不闭、$p'(w)$ 不定，块不变性崩溃。$|S|=4$ 进入 $\sum(|B_y|-1)=4$：块数 $t$ 与总元数 $4+t$ 的账本（2.15 用）。"删一即跨面"把几何（四面体邻接）翻成组合（选删函数），是 partner 构造的全部动机。

**Lean 对应**：[Lean] 6.3/6.4 的对应整体被 `FiniteCases/` 的机器搜索替代：`TenSystem` 公理（`tetra_card/down/pure/no_boundary/complementary/pair_count`）中 `no_boundary`（无自由脊 ≈ 每三角形偶面）与 `pair_count`（每对恰 2 三角形）承载 6.2；伙伴块结构在 Lean 中**不存在**——穷举 `no_ten_system`（4095 个 c-引理，c3…c32921）直接验证无模型。数学论文的 Figure 2/3 式论证在形式化里没有平行文本 [证据：TenLabels 目录仅 1 文件 140 行 + 搜索层 66,297 行]。

**(d) [推测] 失败路线**：(1) [措辞] 6.4 证明里先证 $p'(a)=v$ 再分诊 $w$ 的两case写法，且公式用 case-split 显式给出——提示曾尝试统一叙述（如"块关于对合不变"的抽象命题）未果，因为两情形的图论机制不同（3-圈用度闭合、4-圈用短链接条件）。(2) [推测] 不设"块"而直接跟单个伙伴：跨面链上 $p$ 的演化不可控（每次交换 $p^{-1}(y)$ 的重排），块是 $p$ 纤维的**交换不变聚合**——"块不变性"是为长程输运找到的唯一不变量类。(3) [证据：Lean] Lean 干脆放弃不变量搜索改用穷举：侧面反映"块"构造的偶然性——人证里它是唯一想到的不变量，机器证明不需要不变量。(4) [措辞] 图注末句 "In both cases $p'(a)=v$, and the blocks retain their elements."——两个 case 分开画（(a)(b) 面板）而非合并示意，佐证分诊不可约。

### 2.15 定理 6.5（十标签不可能性，`thm:no-ten-labels`；typst 定理 18）

**来源**：ten-labels.tex 第 177–216 行 + Figure `fig:partner-blocks`（202 行 input）。

**(a) TeX 原文（陈述逐字）**：
> There is no admissible map $\mathbb{RP}^3\to\Delta^9$.

**(b) 推导补全（全文五段账本）**：
①设存在，固定四面体 $S$；$t=|$块数$|$，$R=[10]\setminus\bigcup_y B_y$。逐字账本："The blocks contain $4+t$ labels in total, so $1\le t\le4,\qquad |R|=6-t.$" [补：$\sum|B_y|=\sum(|B_y|-1)+t=4+t$；$|R|=10-(4+t)=6-t$；$1\le t$ 因 $p$ 有值（$S$ 非空），$t\le4$ 因每块 $\ge2$ 元、$\sum(|B_y|-1)=4\ge t\cdot1$。]
②$t\ne4$：逐字 "If $t=4$, each block has size two and $S$ meets each in just one element, contradicting the last assertion of Lemma 6.4."（$t=4\Rightarrow$ 全块 2 元 $\Rightarrow$ $S$ 每块恰 1 元（含 $|B_y|-1=1$ 个），违反"某块 $\ge2$"）。⇒ $t\le3$。
③$R$ 内无三角形：逐字 "There is no triangle entirely in $R$. By purity, such a triangle would extend to a tetrahedron; its one remaining vertex could not supply two vertices in a block."（$R$ 三角形 $\subseteq$ 块外 ⇒ 扩张四面体每块 $\le1$ 元 [补：该面至多补 1 元、$T$ 在块外，每块交 $\le$ 1]，违反 6.4 尾断言）。又 "$R$ is contained in $[10]\setminus S$": $|R|=6-t$；若 $|R|\ge4$：$R$ 四元子集含 $K$ 三角形（6.1+5.3(2)："every four labels contain a triangle"——$[10]\setminus S$ 上的六系在其 4 元子集给三角形，且 6.1 排除额外三角形 ⇒ 该三角形属六系 ⊂ $K$）⇒ 与无三角形矛盾。故 $|R|\le3\Rightarrow t\ge3$。
④钉死：$t=3$、$|R|=3$、块大小和 $=4+3=7$、三块各 $\ge2$、$\sum(|B_y|-1)=4$ ⇒ 尺寸 $\{3,2,2\}$（唯一分拆 $7=3+2+2$ [补]）。Figure 4 图注逐字："The only remaining block sizes are $3,2,2$, with three labels in $R$ outside the blocks. Filled dots are the vertices of the fixed tetrahedron $S$; the omitted block elements are $q_1,q_2,q_3$." 图中 $S=\{u_1,u_2,v,w\}$、$[10]\setminus S=\{q_1,q_2,q_3,r,s,r_3\}$。
⑤终杀：取 $r,s\in R$ 二元。$C=[10]\setminus S$ 上的六系里 $\{r,s\}$ 在恰 2 个三角形（公理 2），第三顶点不能在 $R$（$R$ 无 $K$-三角形）⇒ 是两个不同删元 $q_1,q_2$（不同 ⇒ 否则同一三角形）。两块 2 元 ⇒ 至少一个 $\{r,s,z\}$ 的 $z$ 在 2 元块 $B=\{z,q\}$ 中。逐字终段："Every tetrahedron containing $\{r,s,z\}$ must contain two vertices of some block. As $r,s$ lie outside all blocks, its fourth vertex must be the other element of $B$. Thus this triangle belongs to at most one tetrahedron, contradicting Lemma 6.2." [补：两面要求 vs "至多一个"——第四个顶点唯一强制 $=q$（$\ge2$ 元条件只能由 $B$ 满足：$r,s\notin$ 任何块、$z$ 所在块只有 $B$，3 元块只 1 元 $z$? $z$ 在 2 元块 ⇒ 3 元块交该面 $\le1$），而 6.4"删选皆面"给的面若含 $\{r,s,z\}$……实际只用到唯一性：可能的扩张只有 $\{r,s,z,q\}$ 一个。图注末行逐字："After relabeling the two-element blocks, the final argument selects a triangle $\{r,s,q_2\}$ with $r,s\in R$. Its only possible tetrahedral extension is obtained by adjoining $v$, contradicting the two required extensions."（图中 $v$ 是 $B_2$ 的另一元素。）]

**(c) 机械理由**：全链条是"10"的算术：$10=4(S)+6(C)$、$6=t+|R|+? $——$|C|=6=3$ 删元 $+|R|=3$；$t=3$ 是唯一与 ②③ 双向夹逼兼容的块数；$\{3,2,2\}$ 是唯一分拆；终杀需要"2 元块 + 块外对"共存——若 $k>4$（更大四面体）账本参数全变、不必然矛盾 ⇒ "恰 9 维失败、更高维不再自动"。$d=9$ 的临界性在组合层的最终落点就是这条账本链（与 1.3 节的三层锁扣呼应）。

**Lean 对应**：[Lean] 定理层对应 `no_admissible_ten`：Lean 路线不走伙伴块——`Admissible.support_ten_system` 把可容许映射喂给 `TenSystem` 六公理，再由 `FiniteCases` 145 文件（66,297 行，~4095 引理 c3…c32921）机械证明 `no_ten_system`（经 `relabel` 归约固定四面体 $\{0,1,2,3\}$ 后穷举）。人证 2.14–2.15 的全部组合推理在 Lean 中= 一台搜索机。`Counterexample.lean` 内空面论证：`no_admissible_ten` 用 empty SupportFace + `face_extends_four`。

**(d) [推测] 失败路线**：(1) [措辞] "as in Figure~\ref{fig:partner-blocks}" 与图注"After relabeling the two-element blocks"：块 2 的对换自由度被一句 relabeling 吃掉——提示曾逐块区分 $B_2/B_3$，靠对称性归并。(2) [推测] 若 ③ 不用纯性扩张而用 6.2 直接数 $\{r,s\}$ 关联四面体：$|R|\ge4$ 时六系给三角形但"属于 $K$"要 6.1 排除额外三角形那半步——漏用该半步会留逻辑洞（三角形在六系外）；论文特意同时引 6.1 与 5.3(2)（"by Lemmas~\ref{lem:facet-complement} and~\ref{lem:six-properties}(2)"）说明此处曾经踩坑。(3) [证据：Lean] 机器路线完全不产生 $t$/块尺寸信息——穷举在 ④ 之前就已否决所有模型，说明人证链条"块账本"并非必需逻辑路径，而是为可读性选择的最短概念路径 [推测]。

### 2.16 定理 1.1 的收尾证明（conclusion.tex 第 1–13 行，typst 定理 1 证明）

**(a) TeX 原文（逐字全文）**：
> All ingredients now apply to the projector set in Theorem~\ref{thm:main}.
> \begin{proof}[Proof of Theorem~\ref{thm:main}]
> Lemma~\ref{lem:projector-geometry}, with $k=4$, proves compactness and identifies the trace-one affine space with Euclidean $\mathbb R^9$. It also gives the exact diameter $\sqrt2$. If ten subsets of strictly smaller diameter covered $X$, Lemma~\ref{lem:cover-to-map} would supply an admissible map $\mathbb{RP}^3\to\Delta^9$. This contradicts Theorem~\ref{thm:no-ten-labels}.
> \end{proof}

**(b) 组装链复盘**：覆盖 $\{U_1..U_{10}\}$，$\operatorname{diam}U_i<\sqrt2$ ⇒（Lemma 2.4，ε 间隙 $(\sqrt2-d_i)/4$）可容许 $f:\mathbb{RP}^3\to\Delta^9$ ⇒（Thm 6.5）不存在 ⇒ $b(X)\ge11$。注意论文的谨慎：只断言"不能 10 覆盖"（$b(X)>10$），从未断言 $b(X)=11$——1.2 节"自我限制句"与此对应；上界 $b(X)\le11$ 需要显式 11-覆盖构造，文本未给（[措辞] intro 57–58 行原文已声明"we do not determine the exact value"）。

**(c) 机械理由**：$k=4$ 唯一注入点：$N_4=10=d+1$、$\dim\operatorname{Sym}_4-\{tr\}=9$；$X$ 紧（Lemma 2.1）供 2.4 用单位分解。

**(d) [推测] 失败路线**：(1) [措辞] 证明只有四句——组装即引理索引，说明所有难度前移；若曾尝试"直接对 $X$ 构造覆盖矛盾"（跳过 $f$），失败点是 $X$ 无边界面结构、颜色类无刚性，正是 intro "merely excluding individual orthogonal pairs…" 警告的内容。(2) [推测] 用反证 $b(X)\le10$ 后直接取最优覆盖（紧集上直径可取到）——论文仍走 ε 间隙化，因为最优覆盖的类无光滑性，2.4 的严格不等式化归是必需的缓冲。

### 2.17 推论 7.1（高维推广，`cor:higher-dimensions`；typst 推论 19）

**(a) TeX 原文（陈述逐字）**：
> For every integer $d\geq9$, there is a compact subset of $\mathbb R^d$ of diameter $\sqrt2$ that cannot be covered by $d+1$ subsets of strictly smaller diameter.

**(b) 推导补全（构造 + 账目）**：①平移 $Y=\{P_x-\tfrac14 I\}$ 入 9 维迹零空间（Remark 2.2 的 $\operatorname{Sym}_4/\mathbb RI$ 平移版：$P_x-\frac14I$ 迹零，$\{tr=0\}$ 即 2.2 的 $\mathbb R^9$）。逐字："Every $y\in Y$ has $\|y\|_F^2=3/4$." [补算：$\|P-\frac14I\|_F^2=\operatorname{tr}(P^2-\frac12P+\frac1{16}I)=1-\frac12\cdot1+\frac4{16}=\frac34$ ✓（用 $P^2=P$、$\operatorname{tr}P=1$）。] 平移不改两两距离：$\|y-y'\|=\|P_x-P_{x'}\|$ ⇒ $\operatorname{diam}Y=\sqrt2$、$b(Y)\ge11$。
②新点：$\mathbb R^s$ 中 $v_1..v_s$，Gram 矩阵 $I_s+\tfrac14\mathbf1\mathbf1^{\mathsf T}$。正定性：$\mathbf x^{\mathsf T}(I+\frac14\mathbf1\mathbf1^{\mathsf T})\mathbf x=\|\mathbf x\|^2+\frac14(\sum x_i)^2>0$（非零 $\mathbf x$）[补] ⇒ Cholesky/谱分解给向量实现。逐字性质："They satisfy $\|v_i\|^2=5/4$ and $\|v_i-v_j\|^2=2$ for $i\ne j$." [补：对角元 $1+\frac14=\frac54$；$\|v_i-v_j\|^2=\frac54+\frac54-2\cdot\frac14=2$ ✓（非对角 Gram 元 $=\frac14$）。]
③距离核算 $Z=(Y\times\{0\})\cup\{(0,v_i)\}\subset\mathbb R^9\oplus\mathbb R^s$，$d=9+s$：新点↔$Y$ 点：$\sqrt{\frac34+\frac54}=\sqrt2$（正交分量平方和）；新↔新：$\sqrt2$；$Y$ 内 $\le\sqrt2$ ⇒ $\operatorname{diam}Z=\sqrt2$ 且每对"新点–一切"恰在直径处达到（刚性对）。紧性：$Y$ 紧、有限点并 ⇒ 紧。
④覆盖账目（逐字）："A subset of $Z$ of strictly smaller diameter containing a new point can contain neither a second new point nor a point of $Y\times\{0\}$."（含新点的严格小集若含另一点，该对距离 $=\sqrt2$ 为 diam，不严格小 [补：diam 取到 $\ge\sqrt2$ 矛盾]）。"Thus a cover of $Z$ by at most $d+1=10+s$ such subsets would leave at most ten subsets to cover $Y\times\{0\}$."（$s$ 个新点各需独立集 ⇒ 剩 $\le(10+s)-s=10$ 集覆盖 $Y$ ⇒ 违反 9 维定理）。平移与乘 0 嵌入保直径与集数 [补：$Y\times\{0\}$ 与 $Y$ 等距]。

**(c) 机械理由**：$\frac14=\frac1k$（迹零平移 $P-\frac1kI$ 的唯一选择：$\operatorname{tr}=0$）；$\frac34=\frac{k-1}k$、$\frac54=1+\frac14$、$\|v_i-v_j\|^2=2=\operatorname{diam}^2$——全部由 $\operatorname{diam}X=\sqrt2$ 归一反向钉死：Gram 扰动 $\frac14\mathbf1\mathbf1^{\mathsf T}$ 使新↔新恰 $2$：$\|v_i-v_j\|^2=(1+\frac14)\cdot2-2\cdot\frac14=2$ ✓ 任意 $s$ 同时成立（秩一扰动的对角/非对角元差恒为 1：$\|v_i-v_j\|^2=2(\langle v_i,v_i\rangle-\langle v_i,v_j\rangle)=2(\tfrac54-\tfrac14)=2$ ✓——这就是"一次加满所有新点"的 Gram 机件，与逐点构造相比免去兼容性归纳，正对 19–20 行自述 "The following Gram-matrix description adds all the new points at once."）。$s\ge1$ 任意大 ⇒ 全 $d\ge9$ 失败 ⇒ "9 是最小已知失败维数"的意义：$d\ge9$ 全部无 Borsuk 性。

**Lean 对应**：[Lean] **未形式化**——`Counterexample.lean` 只证 9 维（`main_theorem`/`euclidean_nine_counterexample`）；高维推广、Gram 构造、$s$ 参数在 Lean 中无踪迹 [证据：文件清单与 grep]。

**(d) [推测] 失败路线**：(1) [措辞] "We use the familiar construction of adjoining points at diameter distance; see Hinrichs–Richter Lemma 9 and Bondarenko proof of Corollary 1."——论文自认这是标准机件的重装；曾尝试直接引用他人推广结论（附条件不同：他们的直径常数是别的归一、且要逐点迭代）未果，改为一次性 Gram 版本。(2) [推测] 旧路线"加一个点、升一维"迭代 $s$ 次：每步要重验正定性与直径不增，归纳簿记冗长；Gram 版本单步完成——这是被替换的中间形态 [措辞："adds all the new points at once" 本身即是差异声明]。(3) [推测] 用 $Y$ 直接乘标准形如单纯形加入：新点间距离与到 $Y$ 距离无法同时锁 $\sqrt2$（需要 $\|v_i\|^2$ 与 $\langle v_i,v_j\rangle$ 精确耦合），秩一 Gram 是唯一解 [证据：$\frac14\mathbf1\mathbf1^{\mathsf T}$ 结构唯一性]。

## 三、叙事时间线：全部防御性/说明性原句逐字引录

说明：以下按论文文本顺序（introduction → geometry → extension → topology → six-labels → ten-labels → conclusion）收录所有"防质疑/划边界/自述路线"的英文原句，每条配一句中文，说明它防的是哪个叙事分叉或读者疑问。行号为 build/sections 下 tex 的行号。部分句子已在第二节就近分析过，此处集中成交底清单，便于后续写第一人称笔记时按时间线取用。

**T1（intro 7–8）** "Covers and partitions give the same number: overlaps may be removed without increasing diameters." —— 预先豁免"覆盖 vs 划分/染色"的口径质疑，允许全文在"集合族可重叠"框架下工作而不损失一般性。

**T2（intro 28–31）** "The theorem does not determine the smallest dimension in which it fails or the exact value of $b(X)$. Its witness is the full compact projector image of real projective three-space." —— 双边界声明：不主张 9 是最小失败维数、不主张 $b(X)=11$；"full compact"是与有限构型系列的差异标记（见 T5）。

**T3（intro 31–33）** "Corollary~\ref{cor:higher-dimensions} extends the construction to compact counterexamples in every dimension $d\geq9$." —— 声明单点反例自动升级为维数族，防止"9 维孤例"的贬读。

**T4（intro 35–39）** "Borsuk posed the partition question in 1933 … Kahn and Kalai disproved it in high dimensions … using a forbidden-intersection theorem of Frankl and Wilson … to force many smaller-diameter parts." —— 谱系自述：承认 Kahn–Kalai–Frankl–Wilson 路线是"高维首次否定"的优先权归属。

**T5（intro 57–58）** "Theorem~\ref{thm:main} improves this dimension bound using the full compact image of projective space rather than a finite configuration." —— 与 Grinsztajn 63 维有限构型的差异声明：本论文靠"紧像"而非"有限点集"取胜，暗示两类路线机件不同、不可简单比较。

**T6（intro 60–65）** "The projector embedding itself is classical. Kalai describes the map $x\mapsto x\otimes x$ and the full rank-one positive semidefinite configuration in his account of the Kahn--Kalai construction; Conway, Hardin, and Sloane use the same projection-matrix model for Grassmannian packing and its Euclidean metric." —— 主动让出"模型新颖性"：投影子嵌入/Chessmann 度量早有出处。

**T7（intro 66–67）** "Our contribution is the covering obstruction for the projector set associated with $\mathbb R^4$." —— 与 T6 配对的"贡献重述"：新的是阻碍论证，不是舞台。

**T8（intro 69–74）** "The relevant topological antecedents include Walkup's eleven-vertex minimum for triangulations of $\mathbb{RP}^3$ and the projective-space vertex bounds of Arnoux and Marin. These results cannot be applied directly to the complex here: its faces are positive coordinate supports of a map, not simplices in a triangulation of projective space." —— 否决最直接可想到的借力路线（三角化顶点数下界），理由：$K$ 不是 $\mathbb{RP}^3$ 的三角化而是"支集复形"——这条排除宣告了本论文必须自带面结构机器。

**T9（intro 75–78）** "The central difficulty is to derive enough of its face structure from the map itself. We do this through an odd map on symmetric matrices, mod-two degree, and local preimage counts, and then give the finite combinatorial obstruction in full." —— 方法论纲领三件套 + "in full"强调组合部分完整呈现（对照：Lean 侧该部分被 145 文件穷举替代）。

**T10（intro 86–87，Proof overview 段）** "Section~\ref{sec:geometry} proves this reduction for arbitrary covering sets." —— 强调引理 2.4 不对覆盖集加可测/正则等附加假设，堵住"你的归约是否只对好覆盖成立"之问。

**T11（intro 100–110，主拓扑步概述）** "The main topological step is the equality argument in Section~\ref{sec:topology}. At the threshold of $k(k+1)/2$ labels on $\mathbb{RP}^{k-1}$, a maximal support with fewer than $k$ labels would give a positive-dimensional regular level set inside one affine projective chart. … The odd degree of the original extension forces an odd preimage count for this map, whereas the chart trivialization makes the same count even through the induced map on the projective bundle." —— 论文官方给出的 Thm 4.3 一句话摘要：奇偶对撞框架（后续第一人称笔记可据此安排"发现顺序"）。

**T12（intro 112–121，最后阶段概述）** "The last stage converts this topological information into a finite obstruction. The same degree argument in $\mathbb R^3$ produces a rigid triangle system on six labels … Their compatibility restricts the cycles around edges and organizes a subset of the labels into small blocks. The blocks and the remaining labels give the final contradiction." —— 六标签/十标签两节的叙事蓝图："restricts the cycles around edges"对应 6.3 短链接，"small blocks"对应 6.4 伙伴块。

**T13（geometry 125–127）** "The strict diameter inequalities are what permit the open neighborhoods and the smooth partition of unity; merely excluding individual orthogonal pairs from arbitrary color classes does not supply this reduction." —— 全论文最接近"纯数值/纯组合验证不能替代解析步骤"自我声明的句子（第一节 1.4 已述：不存在字面的"数值验证覆盖不了"句，功能等价物即此句）：染色级别的信息（正交对不共色）不足以造可容许映射，必须有严格间隙 ⇒ 开邻域 ⇒ 单位分解的分析机器。

**T14（extension 176–177）** "The two norm spheres in \eqref{eq:norm-sphere-map} are not being regarded as globally smooth hypersurfaces." —— 口径声明：$\Sigma(V),\Sigma_m$ 只经径向同胚携带球面拓扑、局域光滑；防止读者对其整体调用 Sard/横截性。

**T15（extension 183–185）** "Consequently ordinary sphere degree applies to \eqref{eq:norm-sphere-map} when $m=N_k$, and local differential arguments are valid at every preimage of a full-support value." —— 给 degree 与"局部微分论证"分别划定合法作业域；"full-support value"自此成为全文正则值选取的铁律（Thm 4.3 三次使用）。

**T16（topology 4–8）** "The symmetric-matrix extension gives more than a lower bound on the number of labels. At equality, its degree controls every maximal support of the admissible map. We prove that these supports all have the same size and that their sum is a cycle. No triangulation of projective space is assumed." —— 声明本节把"计数工具"升级为"结构工具"；末句与 T8 呼应，二次排除三角化路线。

**T17（topology 55–57）** "We will count regular preimages of maps which need not be smooth everywhere. The following local form of the degree formula explains why this causes no problem." —— 引出 Lemma 4.2 的动机句：承认对象（$F$）非光滑是全局的，随后用局部化豁免。

**T18（topology 84–85）** "This argument uses no smoothness away from the selected fiber." —— 引理 4.2 证明的收束防御句：切除论证的取材范围仅限所选纤维邻域。

**T19（topology 133）** "For now $L$ is allowed to be empty." —— 预防"正维数正则水平集非空吗"之问：非空性被推迟到 (4.8) 之后由奇偶对撞免费获得（顺序设计声明）。

**T20（topology 142–147）** "If $s<k$, the level-set dimension … is positive. We will construct a map on a sphere bundle over $L$ whose regular preimages have odd cardinality, by comparison with $F$. The affine-chart trivialization will force the induced map on the projective bundle to have degree zero when $\dim L>0$, contradicting that count. When $s=k$, the same count will determine the coefficient of $I$ in the desired cycle." —— Thm 4.3 的官方路线图：三步棋（构造丛映射 / 平凡化逼出偶 / 零维回收系数）先声明后执行。

**T21（topology 176–178）** "The trace-norm parametrization is smooth near every definite $B$, which is all that will be needed." —— 光滑结构口径二次收窄：$M$ 的光滑 atlas 取欧氏球丛，迹范数坐标只在负定点使用。

**T22（topology 240）** "This proves, in particular, that $L$ is nonempty." —— 兑现 T19 的赊账：奇数纤维 ⇒ 底集非空，一行回收。

**T23（topology 265）** "There is no contribution from $H^1(L)$ in this identity." —— SW 段最关键防御：$\overline G^*w=\operatorname{pr}_2^*u$ 无来自底空间的挠动项；该项一旦出现，degree 零论证崩塌——此句等于宣告"仿射卡平凡化"是承重墙而非便利选择。

**T24（six-labels 5–8）** "We call a face with three vertices a \emph{triangle}, and a face with four vertices a \emph{tetrahedron}. These names refer to faces of the support complex, not to geometric simplices in projective space." —— 术语防混淆声明（第二次行使"非几何单纯形"的排他，同 T8/T16 一脉）。

**T25（six-labels 8–9）** "Our eventual application is to the six labels complementary to a tetrahedral facet of the ten-label support complex." —— 提前交代六标签节的从属地位，防止"凭空定义游戏"之讥。

**T26（ten-labels 3–6）** "We prove that an admissible map $\mathbb{RP}^3\to\Delta^9$ cannot exist. Its support complex would have tetrahedral facets. Each facet forces a six-label triangle system on its complement; transporting these systems between adjacent facets will constrain the whole complex." —— 本节蓝图："transporting"预告 6.2–6.4 的输运技术是主角。

**T27（ten-labels 36）** "The rest of the proof is purely combinatorial." —— 全文最重要的一句话级边界：此前（几何/分析/拓扑）与此后（六/十标签组合）的方法论分界线；Lean 形式化恰好在这条线上换轨（此后=FiniteCases 机器穷举，此前=人类拓扑/分析库约 1.2 万行），见第四节。

**T28（ten-labels 105–108）** "The short links let us describe every facet obtained by repeatedly crossing a triangular face of one fixed tetrahedron. The description will produce enough facets to contradict the complementary triangle system." —— 6.4/6.5 的动机句：短链接（6.3）的存在意义在此交代——为"反复跨面可达"的每个面给出显式描述。

**T29（conclusion 15–20）** "The spherical geometry of this witness also gives counterexamples in all higher dimensions. We use the familiar construction of adjoining points at diameter distance; see [Hinrichs--Richter, Lemma 9] and [Bondarenko, proof of Corollary 1]. The following Gram-matrix description adds all the new points at once." —— 优先权让渡（推广机件是"熟悉的"）+ 差异化（一次性 Gram 版本 vs 逐点迭代版本），与 T4/T6 的让渡—认领句式同构。

**T30（figure 注，fig:six-label-paths 图注末句）** "The crossing in (c) is not a vertex." —— 最小尺度的防误读句：平面图交叉非图顶点；连同 fig:partner-links 的 "(dashed)" 标记说明作者对组合图的歧义高度警觉。

数量统计：intro 12 句、geometry 1 句、extension 2 句、topology 8 句、six-labels 2 句、ten-labels 3 句、conclusion 1 句、图注 1 句（T30），共 30 条。[事实：对 7 个 section tex + 3 个 figure tex 通读后的人工收录，非关键词过滤——凡含 "does not / cannot / not being / no … is assumed / for now / purely / in full / familiar / eventual" 等防御标记的句子均已纳入]

## 四、Lean 形式化勘验

### 4.1 目录全量清单与行数（E:/math/lean/OAI/Geometry/Borsuk/，共 269 文件 / 78,964 行）

根目录 3 文件：Counterexample.lean 60、Main.lean 131、Model.lean 27（合计 218）。各子模块（文件数/行数）：Projectors 18/1,871；Simplicial 34/4,060；SphereGeometry 9/885；MatrixGeometry 26/2,272；LocalParity 13/1,217；Support 18/1,857；SmithTheory 2/147；TenLabels 1/140；FiniteCases 145/66,297。总和 218+1,871+4,060+885+2,272+1,217+1,857+147+140+66,297 = 78,964 ✓。

非 FiniteCases 逐文件行数（`模块/文件 行数`）：
Projectors/Basic 286、ChartSurgery 122、CompactLocalHomotopy 75、CompactTargetHits 136、CoordinateSum 84、FiniteClosedCutoffs 78、FiniteOpenGlue 59、FinitePatch 81、FiniteSmoothSliceMisses 55、FiniteSmoothSliceMissesBounded 75、NegativeQuadratic 151、NullImage 89、RaySet 81、Restrict 88、SimplexPoint 54、Tangent 144、TenPure 94、Within 119；
Simplicial/Approximation 150、BarycenterNeg 82、BoolCubeConstant 105、CharacteristicDegree 136、Coefficients 120、CompactAdditiveLocality 151、ContigSimplexBoundary 126、CrossChainDimensionBound 142、CrossEmbedding 77、DoubleEraseSumFun 148、Equivariance 140、EventuallyFineSphereLabel 117、F2 136、FineCrossMap 149、FineCrossMapMesh 93、Flip 130、GeneralTarget 98、LabelRegion 149、LinearMapSupport 121、MapChainsEquivSimplexAll 107、Maps 153、MaxIndex 101、MemSupportSimplex 56、NormMap 107、NullHomotopyLocalModels 87、OddHomotopySurjective 73、OddSphereDimensionBoundFintype 99、Refinement 112、SignVector 130、SignedVertex 217、SimplexMemDegreeAll 153、SubdivSimplex 78、Supports 93、UnitRadial 124；
SphereGeometry/HemisphereChart 85、HomogeneousLift 124、IntegralLift 137、NormSphere 99、OddSphereMap 94、SphereExtension 66、SphereMeasure 81、SphereMoments 102、TraceSphere 97；
MatrixGeometry/BlockLine 90、BlockParts 112、BlockVector 90、CenterApproximation 111、FibreContinuity 86、FibreHomotopy 134、FibreTransport 90、FinitePositiveBound 89、LineRepresentative 104、MatrixCompression 64、MatrixFibre 81、MatrixKernel 99、MatrixNorm 62、MatrixReflection 75、MatrixTransport 74、ModelRay 71、PositiveSlice 61、Rank 97、RankPreimage 97、ReflectionTransport 68、SignedExtension 115、SpectralChart 122、SymmetricCoordinates 67、SymmetricEntries 57、TraceHomotopy 89、TracePatchModels 67；
LocalParity/ChartRegular 81、LocalModel 102、LocalRegular 52、MatrixParity 144、NoFreeRidge 63、RegularBase 91、RegularModel 59、RegularPatch 117、Sard 56、SphereBlock 106、SphereNullPatch 66、SphereParity 164、TraceLocalModels 116；
Support/ActiveChambers 86、AllPairs 179、BalancedChart 68、ChamberPath 72、Chambers 111、DisjointChambers 124、FacetTangent 54、FullSupport 93、LocalMix 146、MixedHits 108、MixedHomotopy 121、NegativeFibre 75、Purity 100、PurityChart 70、PurityGeometry 110、SixFaces 114、SpectralSupport 120、SupportIncidence 106；
SmithTheory/CharacteristicCochains 86、Involution 61；TenLabels/Labels 140。

FiniteCases 全部 145 文件行数（Cases001–144 为生成搜索体，Cases145 为收尾归约器）：
447, 446, 448, 433, 437, 432, 439, 432, 432, 436, 448, 432, 436, 443, 445, 435, 437, 443, 443, 436, 439, 433, 437, 435, 435, 433, 435, 433, 437, 433, 439, 437, 441, 435, 439, 439, 441, 435, 441, 435, 439, 435, 435, 439, 435, 439, 433, 439, 433, 439, 437, 435, 441, 441, 437, 439, 439, 439, 441, 435, 433, 435, 441, 435, 441, 437, 439, 435, 439, 433, 439, 435, 441, 439, 433, 452, 482, 515, 581, 530, 577, 457, 599, 497, 523, 432, 484, 449, 433, 515, 526, 469, 511, 487, 442, 463, 481, 466, 463, 449, 588, 523, 442, 438, 439, 442, 448, 443, 543, 463, 496, 547, 451, 439, 463, 454, 493, 441, 433, 475, 472, 433, 493, 502, 478, 535, 541, 448, 460, 562, 454, 487, 511, 505, 442, 485, 448, 499, 457, 436, 541, 481, 526, 442（Cases001–144）与 98（Cases145）。搜索体每文件约 50 个编号引理（`c3 … c32921`，共约 4,095 个），Cases001 仅 `import … TenLabels.Labels`，Case$i$（$i\ge2$）import Case$i-1$（线性 DAG）；Cases076 起行数明显爬升（452→599），对应搜索树深度增长 [事实：grep 计数]。

### 4.2 入口陈述逐字与比较器（comparator）

**已证定理**（Counterexample.lean 49–56 行，逐字）：
```lean
theorem main_theorem :
    IsCompact projectorSet ∧
    projectorSet ⊆ traceOneSymmetric ∧
    Metric.diam projectorSet = Real.sqrt 2 ∧
    ¬ HasTenSmallCover := by
  refine ⟨isCompact_projectorSet,projectorSet_subset_traceOneSymmetric,diam_projectorSet,?_⟩
  intro h
  exact no_admissible_ten (cover_to_admissible h)
```
**比较器挑战**（ComparatorChallenges/BorsukNine.json 全文逐字）：`challenge_module = "ComparatorChallenges.BorsukNine"`、`solution_module = "OAI.Geometry.Borsuk.Main"`、`theorem_names = ["OAI.BorsukNine.main_theorem"]`、`definition_names = []`、`permitted_axioms = ["propext","Quot.sound","Classical.choice"]`、`enable_nanoda = false`。ComparatorChallenges/BorsukNine.lean 是 34 行模板（ambient 用 `EuclideanSpace ℝ (Fin 4 × Fin 4)` 的 `WithLp 2`；`projector`、`projectorSet`、`traceOneSymmetric`、`HasTenSmallCover` 定义与论文同口径），`main_theorem` 以 `sorry` 结尾待解。`HasTenSmallCover` 定义逐字（json 侧模板，与 Counterexample 上游 Model.lean 同式）：
```lean
def HasTenSmallCover : Prop :=
  ∃ C : Fin 10 → Set Matrix4,
    (∀ i, C i ⊆ projectorSet) ∧
    projectorSet ⊆ ⋃ i, C i ∧
    ∀ i, Metric.diam (C i) < Real.sqrt 2
```

**formalization.yaml 两处登记**：117–120 行条目（title "A nine-dimensional counterexample to Borsuk's covering assertion"、authors ["OpenAI"]、id 指 preprints 目录 paper.pdf、type article）；970–972 行 `comparator_config: ComparatorChallenges/BorsukNine.json`、`declaration: OAI.BorsukNine.main_theorem`、`file: OAI/Geometry/Borsuk/Counterexample.lean`。**口径差一处**：json 的 solution_module 写 `OAI.Geometry.Borsuk.Main`（Main.lean import Counterexample 故声明可达），yaml 的 file 写 Counterexample.lean——同一定理的两种模块路径，属登记口径而非矛盾，但值得在笔记中标注 [事实]。

**MainClaim 与论文陈述的差距（finitization/decidability 视角）**：(i) 论文的 ¬覆盖量词是"存在 10 个任意子集"，Lean 的 `HasTenSmallCover` 同样允许任意 `Set Matrix4`——未做闭包/多面体有限化；不可覆盖性的证明完全走"覆盖⇒可容许映射⇒组合矛盾"的解析桥（`cover_to_admissible`），不依赖任何机器算术。(ii) 组合部分才有限化：`TenLabels/Labels.lean` 把支集复形抽象为 `TenSystem (T Q : Family)`（`Labels := Fin 10`），六字段逐字：`tetra_card : ∀ S, Q S → S.card = 4`；`down`（四面体的 3 元面是三角形）；`pure`（三角形可扩为四面体 ≈ Thm 4.3 纯性 + 6.2 存在性）；`no_boundary`（每三角形至少两个四面体 ≈ 引理 6.2"恰二"的单向）；`complementary`（固定四面体 $S$ 的补六元集上互补三元组二择一，`T U ↔ ¬ T (Sᶜ \ U)` ≈ Def 5.1(1)）；`pair_count`（$S^c$ 中每个二元集恰在 2 个三角形中 ≈ Def 5.1(2)）。注意：Lean 公理面**只含六标签系统两律 + 十标签存在性/互补性**，没有把论文 5.3(2)(3)(4) 与 6.3/6.4 作为引理——它们被 `FiniteCases` 穷举（`no_ten_system`）整体替代。(iii) `Admissible.support_ten_system`（Counterexample.lean 11–41 行）是人证 Thm 4.3 ⇒ 组合结构的接口：六个 constructor 分别消费 `SupportFace` 结构与 `hf.face_extends_four`、`hf.tetra_no_free_triangle`、`hf.facet_six_properties`——方法名即论文引理 6.2（无自由三角形/恰二面）与 5.2/6.1（面补六性质）的对应体。(iv) `no_admissible_ten`（43–47 行）另有人证没有的入口：`SupportFace f ∅` 由 witness `EuclideanSpace.single 0 1` 恒真，再经 `face_extends_four` 直接生成四面体——Lean 用"空支集也是面"绕过了论文"先证存在四面体"的需要 [事实：代码如此；其语义依赖 `SupportFace` 定义细则，见 4.4 不一致清单第 2 条]。

### 4.3 论文定理 ↔ Lean 模块映射总表

| 论文条目 | Lean 对应 |
|---|---|
| Lemma 2.1 投影子几何 | Projectors/Basic：`projector_inner`、`projector_dist_sq`、`projector_dist_eq_sqrt_two_iff`、`diam_projectorSet`、`isCompact_projectorSet` |
| Remark 2.2 九维坐标 | Main.lean：`coordinates9`、`coordinates9_norm_sq`、`coordinates9_isometry`、`coordinates9_diam`、`coordinates9_cover_pullback`、`euclidean_nine_counterexample` |
| Def 2.3 可容许映射 | `Admissible`（`smooth/antipodal/nonneg/sum_one/orthogonal` 五字段，ContDiff∞ 偶函数于 ℝ⁴ 上编码）、`SupportFace`、`positiveSupport` |
| Lemma 2.4 覆盖⇒映射 | `cover_to_admissible`（经 `SmoothPartitionOfUnity.exists_isSubordinate`；`dist_lt_of_mem_thickening_small`）；Lean 独有反向 `admissible_to_cover`（阈值 1/10）、`cover_iff_admissible` |
| Lemma 3.1 正延拓 | SphereGeometry：`HomogeneousLift`、`IntegralLift`、`SphereMeasure`（`sphereProbability_openPos`）、`SphereMoments`（`sphere_quadratic_integral` ⟺ $\int uu^{\mathsf T}d\mu=I/k$） |
| Lemma 3.2 符号延拓 | MatrixGeometry：`SignedExtension`、`SpectralSupport`、`BlockParts`/`BlockVector`（$\Pi^\pm$）、`MatrixKernel`；`sphereExtension_odd/norm/continuousOn` |
| norm-sphere 段 | SphereGeometry/NormSphere（欧氏球面替代口径） |
| Prop 4.1 标签界 | Simplicial：`CrossChainDimensionBound`、`FineCrossMap`、`OddSphereDimensionBoundFintype`、`OddHomotopySurjective`、`CharacteristicDegree` + SmithTheory 2 文件；边论断 Support/AllPairs |
| Lemma 4.2 局部计数 | LocalParity：`RegularPatch`、`LocalRegular`、`ChartRegular`、`Sard` + patch-model 双文件（TraceLocalModels/SphereNullPatch） |
| Thm 4.3 奇偶对撞 | `MatrixParity.regular_facet_level_odd`（TracePatchModels）×`SphereParity.regular_facet_level_even`（SphereNullPatch）→ `NoFreeRidge`（`zero_ne_one`）；SW 段由 Projectors/ChartSurgery `chart_surgery_impossible` 替代；Support/Purity* ⟺ 纯性 |
| Def 5.1 / Lem 5.2/5.3 | 无独立层：并入 `facet_six_properties`（`Admissible` 方法）与 `TenSystem.complementary/pair_count` |
| Lem 6.1/6.2 | `tetra_no_free_triangle`、`face_extends_four`、Projectors/TenPure.lean |
| Lem 6.3/6.4、Thm 6.5 | **人证独有**；Lean 侧 = FiniteCases `no_fixed_ten_system`（固定 `{0,1,2,3}` 后穷举）+ `no_ten_system`（经 `h.relabel e` 归约，Cases145 88–94 行） |
| Thm 1.1 | `main_theorem` |
| Cor 7.1 | **未形式化** |

### 4.4 Lean 独有结构 / 未形式化清单 / 不一致点

**Lean 独有**：(1) `Admissible.antipodal`——以 ℝ⁴ 上 ContDiff∞ 偶函数实现 ℝP³ 上的映射（论文流形定义的代数化包装）；(2) `admissible_to_cover` + `cover_iff_admissible`——论文只证单向，Lean 补齐反向且用固定阈值 1/10 取代 $\varepsilon_i$ 族；(3) `euclidean_nine_counterexample`（Main.lean 把反例搬到标准 ℝ⁹——Remark 2.2 的定量化）；(4) `CompactTargetHits/FiniteClosedCutoffs/FiniteSmoothSliceMisses` 等紧集直径缺口工具（`compact_diam_lt` 经 `exists_isMaxOn`）；(5) `Simplicial/` 整条"交叉复形 + Smith 理论"机器（论文的 Hatcher 2B.6/2B.7 引用在 Mathlib 生态中无现成对应，被从零重建，4,060+147 行）。

**未形式化**：Cor 7.1 与一切 $d\ge9$ 叙述；$b(X)$ 精确值讨论；Walkup/Arnoux–Marin 语境；Stiefel–Whitney 特征类演算（被 patch-parity + chart_surgery 完全替换）；全部图形与叙述性内容。

**不一致/口径差清单**：(1) 论文的 $\varepsilon_i=(\sqrt2-d_i)/4$ 弹性化在 Lean 变为固定 1/10 阈值——两者都是"严格小⇒严格小"，但 Lean 版丢掉间隙大小信息；(2) `no_admissible_ten` 从空面 `SupportFace f ∅` 出发造四面体，其 witness 是 `EuclideanSpace.single 0 1`（某点处坐标 1 其余 0 的赋值——语义上对应"单点支集"而非字面空支集；`Finset.empty_subset _` 只约束支集包含于 ∅?）——笔记阶段需对 `SupportFace` 定义逐字复核，此处标记**存疑**；论文则始终"取任意极大面 $I$"，不存在空面入口 [事实：两种入口不同]；(3) 论文 Thm 4.3 的"和是循环/系数为 1"在 Lean 中化整为 `tetra_no_free_triangle` 型局部陈述，全局循环语言不出现；(4) json `solution_module` 与 yaml `file` 的模块路径差（Main vs Counterexample）；(5) FiniteCases 对"恰二"的处理退化为 `no_boundary`"至少二"+ 整体搜索无模型，与论文 6.2 的双向夹逼路线不同——机器不需要夹逼；(6) 论文 $\Sigma(V)$（迹范数球面）在 Lean 中不定义为一个流形对象，而是欧氏球面 + `sphereExtension_norm` 恒等式携带——口径转换（见 2.7）。

**许可公理**：propext、Quot.sound、Classical.choice（json 与 Mathlib 默认三件套一致；Counterexample.lean 顶部 `attribute [local instance] Classical.propDecidable` + `classical` 战术全部落在 Classical.choice 许可内）；`enable_nanoda: false` 表明不依赖外部数值验证库——整条 Lean 证明无浮点/区间算术组件，组合穷举是纯离散判定 [事实]。

## 五、常数与参数总表

| 符号/数值 | 定义处 | 被使用的性质 | 临界性（为什么恰是这个数） | 富余量 |
|---|---|---|---|---|
| $k=4$ | intro | $\mathbb{RP}^3$、$\operatorname{Sym}_4$、$N_4=10$ | $N_k=\binom{k+1}{2}$ 与 $d+1=N_k$、$d=N_k-1$ 联立 ⇒ 目标维 9；组合矛盾需 $|S|=k=4$ 的块账本 | $k\ge4$ 机件通用，但穷举仅在 $k=4$ 可行 |
| $d=9$ | Thm 1.1 | $N_4-1$ | 同上联立唯一解 | — |
| $m=N_4=10$ | Def 2.3 | 标签数 $=d+1$ | Prop 4.1 等号情形才有刚性；$m>10$ 无约束 | 无（恰等号是全部论证前提） |
| $N_k=k(k+1)/2$；$N_2=3$；$N_3=6$ | Prop 4.1 | 下界链 | $N_k-N_{k-1}=k$（新增行/列元素数）是 (4.3) 引擎；$N_2=3$ 为底 | — |
| $\sqrt2$ | Lemma 2.1 | $\operatorname{diam}X$ | $\sqrt{2-2\cos^2\theta}$ 于 $\theta=\pi/2$；归一 $\operatorname{tr}A=1$ 钉死 | 无 |
| $\|P_x-P_y\|_F^2=2-2\langle u,v\rangle^2$ | 2.1 | 距离↔夹角刻画 | 直径对 ⟺ 正交对 ⟺ 支集不交的桥 | — |
| $\varepsilon_i=(\sqrt2-d_i)/4$；$\operatorname{diam}\bar U_i\le(d_i+\sqrt2)/2$ | Lemma 2.4 | 严格间隙化 | 四等分：邻域半径与闭包膨胀各占一份、留两份保险；中值 $<\sqrt2$ | 2×（见 2.4(c)） |
| $1/10$（仅 Lean） | `admissible_to_cover` | 反向构造 | 任意 $<\sqrt2$ 常数均可，取小者简化 | 大 |
| $h=N_{k-1}=6$ | Thm 4.3 | 纤维球面维数 $h-1$；$u^h=0$ | $a>h\Rightarrow a-1\ge h$ 使 $\operatorname{pr}_2^*(u^{a-1})=0$；$a=h$ 论证熄火——二分恰好 | 0（临界即结论） |
| $s=|I|\le k$、$a=|J|\ge h$ | (4.3) | 面大小上界 | $s\le N_k-N_{k-1}=k$ | — |
| $\dim L=(k-1)-(s-1)=k-s=a-h$ | (4.4) | 正维/零维分诊 | $s<k\Rightarrow\dim L>0$（SW 矛盾）；$s=k\Rightarrow L$ 有限（系数） | — |
| $\lambda\in(0,1)$ | (4.5)–(4.8) | 双块 full-support 拼接 | 开区间⇒两半非零⇒$A$ 非异；质量守恒使第一雅可比块 $=$ 恒等 | 结论与 $\lambda$ 具体值无关 |
| 负卦限选 $g$ | Thm 4.3 段 3 | 逼 $B<0$ | 全负 ⇒ 无正谱线无核 ⇒ $G$ 光滑 + full-support | 卦限内任取 |
| $\operatorname{tr}|A|=1$、$\|F(A)\|_1=\operatorname{tr}|A|$ | §2.7/3.2 | 球面归一 | 恒等式使 $F$ 在球面间取值 | — |
| $\Pi^\pm(A)=\frac12(I\pm A(A^2)^{-1/2})$ | 3.2 证明 | 谱投影显式式 | 需 $A$ 非异——full-support 依赖再现 | — |
| $\int uu^{\mathsf T}d\mu=I/k$；子空间质量 $r/k$ | 3.1 | $E$ 归一与限制恒等 | $\sum E_i=\operatorname{tr}Q$ 恰需该常数 | — |
| $E(P_x)=f(x)$（$k\int\langle u,u'\rangle^2d\mu=1$） | 3.1 | 秩 1 回收 $f$ | 二阶矩 $1/k$ | — |
| 15 边、10 互补对、$2\cdot15/3=10$ | Lem 5.2 | 夹逼 | $\binom{6}{2}=15$、$\binom{6}{3}/2=10$、关联计数同为 10——三个 10 相遇 | 0（双向取等） |
| $C_5$、$\alpha(C_5)=2$、围长 5 | Lem 5.3 | 四性质 | 2-正则于 5 点唯一；独立数 2 ⟺ "4 元含三角形" | — |
| $M_1=\{\{c,e\},\{d,f\}\}$、$M_2=\{\{c,f\},\{d,e\}\}$、对称差 4-圈 | 5.3(3) | 反向匹配强制 | 删点后 4-点路只有两种匹配延伸；互补规则禁同类 | — |
| $|R|=4$；$(a\ b)(b\ c)(c\ a)=(b\ c)$ | Lem 6.2 | 三步输运净效果 | 复合恰为一个换位，被 5.3(3) 禁 | 0 |
| link 组件长 $\le4$；5-路禁 | Lem 6.3 | 6.4 分诊前提 | 输运复合净送 $v_4\mapsto v_2$；4-圈闭合唯一可能 | — |
| $B_y=p^{-1}(y)\cup\{y\}$、$\sum(|B_y|-1)=4$、$\bigcup(B_y\setminus\{q_y\})$ 四面体 | Lem 6.4 | 块不变性 | 和式 $=|S|$ 是"删选皆四面体"的基数许可 | — |
| $1\le t\le4$、$|R|=6-t$、$t\ne4$、$t=3$、尺寸 $3,2,2$、$\{r,s,z\}$ 唯一扩张 | Thm 6.5 | 最终账本 | $10=4+6$ 上算术锁定；"2 元块+块外对"共存是绝杀资源 | 0 |
| $3/4$、$5/4$、$\frac14$、$\sqrt{3/4+5/4}=\sqrt2$、$10+s$ | Cor 7.1 | 高维钉 | 平移 $P-\frac14I$ 强制 $3/4$；Gram $I_s+\frac14\mathbf1\mathbf1^{\mathsf T}$ 强制 $5/4$ 与新—新距 2；三距同锁 $\sqrt2$ | 无 |
| $\sqrt2,\sqrt6,\sqrt{12}$（Gell-Mann 型基） | Rmk 2.2 | 显式等距 | 分母即对角母题的 Frobenius 范数：$\operatorname{diag}(1,-1)\to\sqrt2$、$\operatorname{diag}(1,1,-2)\to\sqrt6$、$\operatorname{diag}(1,1,1,-3)\to\sqrt{12}$（$3+9=12$） | — |
| $\sqrt2\,a_{ij}$（非对角） | Rmk 2.2 | Frobenius 双计 | $\|A\|_F^2$ 含 $2a_{ij}^2$ ⇒ 系数 $\sqrt2$ | — |
| $k\ge2$ / $k\ge3$ | Prop 4.1 / Thm 4.3 | 限制可迭代 | $k\ge3$ 才能向 $x_0^\perp$（维 $k-1\ge2$）复用下界 | — |
| `Fin 10`、`EuclideanSpace ℝ (Fin 4)` | Lean Model | 全离散化 | 搜索空间 $\binom{10}{3}=120$、$\binom{10}{4}=210$ 有限可判定 | — |
| c3…c32921（4,095 引理） | FiniteCases | 机器穷举 | 索引上界 32921 ≈ 搜索节点编号而非引理数 | — |

补充注记：(1) FiniteCases 的 4,095 个 c-引理对应"沿共三角形邻接关系可达四面体配置 × 六系相容检验"的机器展开 [推测：由文件线性 DAG、每文件 ~50 引理、行数爬升节律推断；仓库未见生成器脚本]。(2) 表中"富余量=0"各行合起来构成对"为什么是 9"的最终定量回答：$N_k$ 序列在 $k=4$ 第一次同时满足 (i) $N_k-1$ 为整数维、(ii) 面补 $=N_{k-1}$ 进入刚性区、(iii) 块账本 $4+t$ 在 $t=3$ 处收口——三处零富余互相咬合，任何一环挪动即失效。(3) $\sqrt{12}$ 行的机制：三个对角基向量的分母就是母题矩阵的 Frobenius 范数本身（$\sqrt{1+1}=\sqrt2$、$\sqrt{1+1+4}=\sqrt6$、$\sqrt{1+1+1+9}=\sqrt{12}$），非对角系数 $\sqrt2$ 则来自 $\|A\|_F^2$ 中 $a_{ij}^2+a_{ji}^2=2a_{ij}^2$ 的双计——2.2(b) 已逐向量验证正交归一。
