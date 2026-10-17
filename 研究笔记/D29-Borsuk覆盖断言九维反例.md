# D29 九维 Borsuk 覆盖断言反例：我把反例藏进秩一投影子的射影像里

对象论文：`A nine-dimensional counterexample to Borsuk's covering assertion`（2026-09-23，OpenAI）。
TeX 源码：`E:\math\preprints\A-nine-dimensional-counterexample-to-Borsuks-covering-assertion-September-23-2026\build\`（main.tex + preamble.tex + sections 下 7 个文件 + figures 下 3 个 tikz 文件，共 1303 行）。PDF 有密码，正文只以 tex 为准，我全程没有碰过 PDF。
Lean：`E:\math\lean\OAI\Geometry\Borsuk\`（269 个 .lean 文件、78,964 行），比较器 `ComparatorChallenges/BorsukNine.json` + `BorsukNine.lean`（34 行 stub）+ `formalization.yaml`（117-120 行书目条目、970-972 行形式化条目），另有一份 typst 转换副本（474 行、19 个扁平编号定理环境、411 条公式）可以交叉印证编号。
素材：`研究笔记\素材\Borsuk九维覆盖反例-素材.md`（145,898 字节，§一到§五齐全）。
行号记法 `geometry:125` 指 `build/sections/geometry.tex` 第 125 行。定理编号用 tex 的分节编号（Theorem 1.1、Lemma 2.1 等），typst 扁平编号对照在素材 1.5。

必须先交代一件事：这篇没有公开思维链。`E:/math/reasoning_traces/` 下的 10 篇里没有 Borsuk 篇（其中出现 "Borsuk-Ulam" 字样的那篇属于自由群因子同构）。所以下面所有失败路线都是我从文本证据反推的重构，证据来源分三类标注：措辞（论文原句的防御性写法）、图形（tikz 源码与图注）、Lean（形式化代码的平行结构与机器生成痕迹）。凡属我自己的推断一律挂 [推测]。写这篇笔记时我的姿态是"正在做这项研究的我在纸上演算"，但每一步都能被素材里引录的 tex 文本兜底，两者对不上的地方我宁可直接说对不上。

## 0 我进场时手里有什么

仓库里的 Borsuk 问题是这样的（introduction.tex 第 4-9 行，逐字）：

> Borsuk's partition problem asks whether every bounded set of positive
> diameter in $\mathbb R^d$ can be covered by $d+1$ subsets of strictly
> smaller diameter. For a bounded set $Y$ of positive diameter, write $b(Y)$ for the least
> number of such subsets needed to cover $Y$. Covers and partitions give
> the same number: overlaps may be removed without increasing diameters.
> We prove that $b(Y)>10$ for a compact set in $\mathbb R^9$.

我的目标函数只有一行：找一个紧集 $X\subset\mathbb R^d$ 使 $b(X)>d+1$，并让 $d$ 尽可能小。手里可用的武器按论文口径分两系。第一系是有限构型：Kahn-Kalai 1993 用 Frankl-Wilson 禁止相交定理在超高维否证，之后纪录沿 $946\to903\to561\to560\to323\to321\to298$ 下降，全是球码/两距离集路线；再往后 Bondarenko 65、Jenrich-Brouwer 64、Grinsztajn 63，靠的是强正则图族。第二系是拓扑：Borsuk-Ulam 及其变体，历史上主要用来给下界加码，没有人在 Borsuk 分割问题里把它当主攻武器用过 [推测：这是我的阅读印象，tex 里没有一句话直接说"拓扑路线此前无人尝试"，但 intro 第 69-78 行把 Walkup、Arnoux-Marin 列为"相关的拓扑前身"、没有列为"前例"，说明作者也认为从支集复形下手的做法在本文之前没有直接对标物]。

进场时我最关心的一件事是：断言允许的块数是 $d+1$，而反例要否决的恰恰是"$d+1$ 块"。所以我要造的 $X$ 必须让"$d+1$"这个数落在一个刚性位置上，块数哪怕多给一块（$d+2$）断言就可能重新成立。这句话后来被证明是全文的骨架问题：素材 1.3 里我把它整理成"三重锁定"，见第 5 节。进场时它还只是一个模糊的直觉：反例不能是"碰巧不够分"，必须是"$d+1$ 恰好等于某个组合不变量"，使得否决论证卡在等号上。

还有一个数量级判断我做在了前面。两距离集路线每降一维都要重找参数合适的强正则图，298 之后是 65、64、63，一次挪一两维，说明图族参数空间接近穷尽；照这个斜率走到 9 维要再砍 54 维，等于要求一个参数量级完全不同的图族存在。[推测] 我在笔记里把这个判断标成"没试透就放弃"，因为论文里没有任何文字记录这条路线的内部尝试，只有 intro 第 57-58 行那句差异声明（T5）：

> Theorem~\ref{thm:main} improves this dimension bound using the full
> compact image of projective space rather than a finite configuration.

"rather than a finite configuration" 这个短语值一次转折：作者连根拔起的预设是"反例应该是有限点集"本身，某张具体的图只是这预设的附庸。我在第 1 节按这个方向重构。

（补记一句：素材目录全名 `A-nine-dimensional-counterexample-to-Borsuks-covering-assertion-September-23-2026`，对应队列第 22 行号；本轮我用 python 逐行读 `.tools/lean_queue.txt`，第 22 行与该目录名逐字相同，上下两行分别是 Kahler 那篇与带 pdf 尾巴的下一家，`## 台账补表` 里所有 tex 行号都在这个目录的 build/ 下回读。）

## 1 第一条死路：沿着有限构型路线继续压维数

先把被我放弃的路线说清楚，因为它其实走到过 9 维附近两次，只是每次都以不同方式断掉。

有限构型路线的机件（论文口径，intro 第 36-56 行）是：取一个两距离集或强正则图生成的点集，直径归一后，"真小直径块"里能装的点数被线性代数秩界（Frankl-Wilson 型禁止相交 + 多项式方法）限制住，点数除以每块容量逼出块数下界。要在 $d=9$ 做成这件事，我需要一个足够小的两距离集 $S\subset\mathbb R^9$，使每个"距离受限子集"容量小到 $\binom{|S|}{\le 9}$ 级别 [推测：这是对所需参数的反向工程，tex 里没写具体不成立原因；素材也只记录了"前作是有限点集 + 秩/Frankl-Wilson 型禁止相交论证"的口径对比，见素材 1.3 末段]。

这条路断在三个地方。第一，秩界随维数退化：多项式次数受两距离比控制，维度越低、可用的不可约多项式族越小，秩界越弱。第二，强正则图参数在低维没有解，63→64→65 每一步都是精心解方程组的结果，往下没有现成族。第三，也是最要命的：有限点集的覆盖数 $b$ 往往比紧包的覆盖数宽松，点集反例的维数纪录会被"加一个点升一维"的标准机件（conclusion.tex 第 15-20 行承认它来自 Hinrichs-Richter Lemma 9 与 Bondarenko Corollary 1 的证明）单调搬运，但搬运只往高维走，不解决"往下"。

转折发生在重读 Kalai 2015 的 Kahn-Kalai 叙述时（论文 intro 第 60-65 行逐字，T6）：

> The projector embedding itself is classical. Kalai describes the map
> $x\mapsto x\otimes x$ and the full rank-one positive semidefinite
> configuration in his account of the Kahn--Kalai construction.
> Conway, Hardin, and Sloane use the same projection-matrix model for
> Grassmannian packing and its Euclidean metric.

我盯住的是 "the full rank-one positive semidefinite configuration" 里的 full。Kahn-Kalai 以前只从这个构型里挑有限子集，那为什么不直接把整个射影像拿去当反例？载体从"选点"变成"全像"，问题的性质就变了：紧集上没有"每块容量"这种离散账，取而代之的是连续结构，覆盖可以开化、可以光滑化，于是同伦与示性类突然全部可以调用。紧接着的 T7 是配套的贡献声明（intro 第 66-67 行）：

> Our contribution is the covering obstruction for the projector set
> associated with $\mathbb R^4$.

嵌入不新、度量不新，新的是"对这个集做不到 $d+1$ 覆盖"的阻碍。这一句我读成作者主动让出舞台新颖性、只认领阻碍论证，[推测] 目的是防止审稿人拿 CHS 1996 或 Kalai 2015 说"模型你们早就有了"。

## 2 第二条死路：把问题当成纯染色，以及凸化的诱惑

换成全像之后，我的第一反应仍然是离散化的：$X$ 里的"直径对"恰是正交直线对（这个等价要到 Lemma 2.1 才钉死，但我进场时从 $uu^{\mathsf T}$ 与 $vv^{\mathsf T}$ 的距离计算里立刻看得到），那么"10 块严格小覆盖"不就是要给 $\mathbb{RP}^3$ 的直线染 10 色、禁止正交对同色吗？这纯粹是正交性超图 $\mathbb G(\mathbb{RP}^3)$ 的着色问题，似乎可以直接查色数。

这条路断在信息层次上，论文对此有一句专门的防御（geometry.tex 第 125-127 行，T13，全论文最接近"路线自述"的句子）：

> The strict diameter inequalities are what permit the open neighborhoods
> and the smooth partition of unity; merely excluding individual orthogonal
> pairs from arbitrary color classes does not supply this reduction.

我把这句拆成三层批注。其一，色类是任意子集，没有开性、没有连续性，拓扑工具全部缴械；而"直径严格小于 $\sqrt2$"给的是带间隙的数据：每块直径 $d_i<\sqrt2$，间隙 $\sqrt2-d_i>0$ 可以拿来开邻域、做单位分解。其二，色数下界即使证出来，也只是"任意 10 个色类中必有一个含正交对"，它不排除"每个色类都是稠密碎块"的病态覆盖；而我要的是连续映射层面的不存在性，两者不是一个量级的陈述。[推测] 这一条是我的重构：素材没有直说"色数路线可能比可容许映射弱"，但它记录了 Lean 侧 `cover_iff_admissible` 双向成立 [Lean]，说明覆盖与可容许映射在带严格间隙的口径下等价，染色口径之所以弱，正是因为扔掉了间隙。其三，反过来，间隙化是有代价的单行道：从 $A_i$ 到 $U_i$ 到 $f_i$，每一步丢信息（直径从 $d_i$ 涨到 $(d_i+\sqrt2)/2$，块从任意集变成开集生成的光滑分派），代价可控正是因为它换来了可微性。

同阶段的另一个岔路是凸化。$X$ 的凸包是 $\{A\succeq0,\ \operatorname{tr}A=1\}$，密度矩阵体，一个 9 维凸体；Borsuk 问题在凸体子类里有自己的一串结论，网上流传的 $\sqrt{n/(2(n+1))}$ 型常数属于那条支线。我必须在这里照实记录：**本文 tex 里完全没有凸体语境**。全文用到的常数是 $\sqrt2$、$1/2$、$3/4$、$5/4$、$\sqrt2,\sqrt6,\sqrt{12}$ 这一组（见第 30 节参数表），没有任何 $\sqrt{n/(2(n+1))}$ 型表达式；intro 第 4-6 行明写 "every bounded set of positive diameter"，是一般集合口径。[推测] 把一般集合断言与凸体子问题混淆是最常见的误读来源，素材 1.2 第 2 条已经用同样口径警告过。凸化对我没用的技术性理由（素材 2.1(d)(3)）：凸包内混入了 $P_x+P_y$ 型内点，"块内无正交对"的逐点翻译失效，直径对不再由正交对控制，之后整个"距离 ⟺ 正交 ⟺ 支集不交"的三段桥全部塌掉。

## 3 载体定型：主定理与全部逐字口径

定稿的主定理（introduction.tex 第 18-26 行，Theorem 1.1，标签 `thm:main`，逐字）：

> \begin{theorem}\label{thm:main}
> The compact set
> \[
>  X=\{uu^{\mathsf T}:u\in\mathbb R^4,\ \|u\|=1\}
>  \subset\{A\in\operatorname{Sym}_4(\mathbb R):\operatorname{tr}A=1\},
> \]
> with the Frobenius metric, has diameter $\sqrt2$ and cannot be covered
> by ten subsets of diameter strictly less than $\sqrt2$.
> \end{theorem}

摘要（main.tex 第 11-16 行，逐字）：

> The compact set of rank-one orthogonal projectors on $\mathbb R^4$,
> with the Frobenius metric, cannot be covered by ten sets of strictly
> smaller diameter. It therefore gives a counterexample to Borsuk's
> conjecture in dimension nine.

定理后面的自我限定（intro 第 28-33 行，逐字，T2+T3）：

> Thus Borsuk's assertion fails in dimension nine. The theorem does not
> determine the smallest dimension in which it fails
> or the exact value of $b(X)$. Its witness is the full compact projector
> image of real projective three-space. Corollary~\ref{cor:higher-dimensions}
> extends the construction to compact counterexamples in every dimension
> $d\geq9$.

高维推论（conclusion.tex 第 22-26 行，Corollary 7.1 = typst 扁平编号 19，逐字）：

> \begin{corollary}\label{cor:higher-dimensions}
> For every integer $d\geq9$, there is a compact subset of $\mathbb R^d$
> of diameter $\sqrt2$ that cannot be covered by $d+1$ subsets of
> strictly smaller diameter.
> \end{corollary}

这四段是全文的口径合同。写笔记时我把每段都逐字抄下来过一遍，因为后来 Lean 取证（第 29 节）显示 `main_theorem` 的合取支拆分方式与 Theorem 1.1 的字面结构一一对应：紧性、trace-one 隶属、直径 $=\sqrt2$、不可十覆盖，四样各是一条证明义务，论文的每个词在 Lean 里都找到一个对应的字段。事后看，"does not determine the smallest dimension" 与 "does not determine the exact value of $b(X)$" 这两个豁免是我主动划的边界：证明只给出 $b(X)\ge 11$，11 是否可达从未被讨论 [措辞：素材 2.16(b) 指出上界 $b(X)\le11$ 需要显式 11-覆盖构造，文本没给]。

## 4 主定理措辞逐条解剖：每个词为什么长这样

素材 1.2 给了六条，我逐条消化，每条都问一遍"这个词在证明里哪一步被消费"。

**"compact set"**。$X$ 紧是因为它是 $S^3$ 在连续映射 $u\mapsto uu^{\mathsf T}$ 下的像。紧性有两处实质消费：Lemma 2.4 的开覆盖要有限子覆盖与从属的光滑单位分解；直径在紧集上可达，Lean 的 `compact_diam_lt` 用 `exists_isMaxOn` 把逐对 $<d$ 升为 $\operatorname{diam}\le d$ [Lean]。载体的几何身份要说透：$u$ 与 $-u$ 给同一矩阵，所以 $X\cong\mathbb{RP}^3$，它是 9 维仿射空间里的一张射影三维"Veronese 型"曲面，不是凸包、不是星形体、不是有限点集。

**"rank-one orthogonal projectors on $\mathbb R^4$" 与 $uu^{\mathsf T}$、$\|u\|=1$**。为什么是 4：见下节三重锁定。为什么承载对象要取投影子、线本身不够用：距离公式 (2.1) $\|P_x-P_y\|_F^2=2-2\langle u,v\rangle^2$ 把"线间夹角"变成矩阵空间的欧氏距离，之后延拓构造（Lemma 3.1）要积分的正是矩阵空间里的二次型，线没有代数运算可用。

**"with the Frobenius metric"** 与 $\|A\|_F^2=\operatorname{tr}(A^2)$（intro 第 12-13 行）。度量归一是全文命脉。geometry.tex 第 9-13 行交代：Conway-Hardin-Sloane 的 Grassmann 弦距恰是本文 Frobenius 距离的 $1/\sqrt2$ 倍 [措辞]。选 Frobenius 之后 $\operatorname{diam}X=\sqrt2$ 恰好等于正交直线对的距离，于是"真小直径块"逐字等价于"块内不含正交对"。选别的归一只是改常数，选谱范数则整个塌掉（素材 2.1(d)(1)：所有秩一投影子的谱范数都是 1，[1]-[1] 距离信息全丢）。

**"has diameter $\sqrt2$"**。先断言直径值、再断言覆盖失败，因为 Borsuk 断言里的"真更小"必须相对 $\operatorname{diam}X$ 谈；Lean 把 $\operatorname{diam}=\sqrt2$ 作为合取支直接写进 `main_theorem`，见第 29 节逐字。

**"cannot be covered by ten subsets"**。口径是覆盖（允许重叠），并非划分；T1（intro 第 7-8 行）预先豁免这个质疑："Covers and partitions give the same number: overlaps may be removed without increasing diameters."。把每个点任意分给包含它的一块，子集直径不增，所以两种口径的数相等，全文在覆盖框架下工作不损失一般性。"ten" $=d+1=9+1$，恰好是断言在 9 维允许的块数；否定它就是否定断言。

**"in dimension nine"**。维度按承载空间 $\mathbb R^9$ 计，不按载体自身的拓扑维数 3。承载空间是 trace-one 仿射超平面 $\cong\mathbb R^{N_4-1}=\mathbb R^9$，$N_k=\binom{k+1}{2}$。"9"与"10"这对数字各有刚性来源，且互相咬合：$d+1=N_4=10$。这最后一句话就是下一节的全部内容。

## 5 为什么"9"关键：三重锁定与前作差异

载体链（全部在 Lemma 2.1 内，素材 1.3）：$X_4=\{uu^{\mathsf T}:\|u\|=1\}\subset\{A\in\operatorname{Sym}_4(\mathbb R):\operatorname{tr}A=1\}\cong\mathbb R^9$；距离只依赖夹角余弦平方；最大距离 $\sqrt2$ 当且仅当正交；于是"$b(Y)\le10$ 的严格小覆盖"逐字翻译为"把 $\mathbb{RP}^3$ 的直线分成 10 类、每类内部无正交对"（外加开化光滑化的损失控制）。

三重锁定（素材 1.3，由证明结构反推）：

1. **标签数下界**：任何 $\mathbb{RP}^{k-1}$ 上的可容许映射要 $m\ge N_k$（Proposition 4.1）。机制是构造出奇映射 $S^{N_k-1}\to S^{m-1}$，而奇映射要求源球维数不超过目标球维数（Borsuk-Ulam 型事实，Hatcher 2B.6/2B.7）。$k=4$ 时 $N_4=10$。
2. **等号刚性**：$m=N_k$ 时拓扑反而最强（Theorem 4.3）：每个极大支集恰 $k$ 个标签、全体面之和是 mod-2 闭链。Borsuk 断言允许的块数 $d+1$ 恰好等于 $N_k$（因 $d=N_k-1$），所以"最难反驳的情形"正是等号情形，而等号情形被定理 4.3 单独钉死。这就是选"$\mathbb{RP}^3$ 投影像 + 10 块"作为攻击面的完整理由：$d+1=N_k$ 的联立方程在 $k=4$ 有整数解 $d=9$，且此时组合段恰好打得动，9 维的必然性在这里，运气成分可以排除。
3. **组合不相容的三级咬合**：Theorem 4.3 要 $k\ge3$；六标签三角系是 $\mathbb{RP}^2$ 等号情形（$m'=N_3=6$）的产物；$k=4,m=10$ 时四面体的补集恰为 6 个标签；三级结构 $10\to6\to$ 五环刚好咬合（第 22-23 节）。素材在这里给了一条克制的说明 [推测]：$k=3$（$d=5$）时同样落入等号情形，但六标签系统本身是相容的（存在），矛盾要到十标签层面才出现；tex 没有断言六标签系统的存在性，Lean 的搜索只做十标签层面，所以"低维为何撞不出矛盾"我不能写死，只能标存疑。

与前作的结构差异（素材 1.3 末段，论文口径）：前作是有限点集 + 秩界；本篇是紧的射影簇像 + 拓扑/组合。维度下降的实质是把"Borsuk 数"问题转译为 $\mathbb{RP}^3$ 上光滑函数支集的拓扑刚性。而载体虽是旧载体（T6/T7 已让渡优先权），阻碍是新的。

拓扑前作的排除声明（intro 第 69-78 行，逐字，T8+T9）：

> The relevant topological antecedents include Walkup's eleven-vertex
> minimum for triangulations of $\mathbb{RP}^3$ … and the projective-space vertex bounds
> of Arnoux and Marin …. These results cannot be
> applied directly to the complex here: its faces are positive coordinate
> supports of a map, not simplices in a triangulation of projective space.
> The central difficulty is to derive enough of its face structure from
> the map itself. We do this through an odd map on symmetric matrices,
> mod-two degree, and local preimage counts, and then give the finite
> combinatorial obstruction in full.

作者在这里防的是"为什么不直接查 $\mathbb{RP}^3$ 三角剖分的最小顶点数"这条借力路线：支集复形 $K$ 的顶点是标签、面是正支集，它根本不是 $\mathbb{RP}^3$ 的三角剖分，Walkup 的 11 顶点和 Arnoux-Marin 界不适用。$K$ 的面结构必须从映射 $f$ 自己"开采"。这句"central difficulty"声明我在第 15-21 节会反复回头看，它是整个拓扑段的立项书。

## 6 装配链：五个过渡与两处不可判定化断层

全文装配链（素材 1.4，我把每个过渡编号记住，后面各节按号认领）：

```
假设存在 10 块严格小直径覆盖 (diam < √2)
 ─(A) Lemma 2.4 [geometry.tex, 分析过渡]→  可容许光滑映射 f: ℝP³ → Δ⁹
 ─(B) Lemma 3.1 + 3.2 [extension.tex, 积分延拓 + 符号分解]→  奇映射
      F : Sym₄ → ℝ¹⁰,  ‖F(A)‖₁ = tr|A|  →  球间奇映射 Σ(V)→Σ₁₀
 ─(C) Prop 4.1 + Lemma 4.2 + Thm 4.3 [topology.tex, mod-2 度数 + 层论对撞]→
      支集复形 K：完备 10 顶、每面为四面体、全体面之和是 mod-2 闭链
 ─(C') Lemma 5.2（k=3 等号 ⇒ 六标签三角形系统）+ Lemma 5.3（系统刚性四性质）
 ─(D) Lemma 6.1-6.4 [ten-labels.tex, 纯组合运输]→  块结构 3,2,2 + |R|=3
 ─(E) Thm 6.5（最终不相容）；conclusion.tex 回收 ¬∃f ⇒ ¬∃覆盖，完成 Thm 1.1；
      Cor 7.1 用 Gram 矩阵加"直径距离新点"扩到 d≥9。
```

我在 Kaplansky 拟迹那篇笔记里见过论文自述"纯数值不等式不够"式的句子，这篇没有那种字面句 [措辞：素材 1.4 通读 7 个 section 确认无 "cannot" 与数值验证对举句]。但有两个功能等价的断层，论文用别的措辞标出。断层一在过渡 (A)：T13 的警告（染色信息不给光滑性）。断层二在过渡 (C)：T9 后半句 "We do this through an odd map on symmetric matrices, mod-two degree, and local preimage counts"，面结构来自解析/拓扑，并非枚举。

最有信息量的是反面佐证 [Lean]：论文在 ten-labels 第 36 行写下 T27 "The rest of the proof is purely combinatorial"，而 Lean 形式化恰好在这条线上换轨：此后的组合段被替换成机器生成的 145 文件、66,297 行、约 4,095 条编号引理（`FiniteCases/Cases001-145.lean`，引理编号 c3…c32921）的有限情形搜索；此前的 (A)(B)(C) 全部保留人工构造的长链拓扑/分析论证（Simplicial/MatrixGeometry/LocalParity 等约 12,400 行）。可判定化边界与论文的过渡划分严格吻合。这条吻合本身就是证据：作者自己也知道从哪一句开始证明变成"可以交给机器的事"。

## 7 维数纪录核对与未能核实的史实

论文给的历史链（intro 第 36-50 行，逐字，T4）：

> Borsuk posed the partition question in 1933 \cite{Borsuk1933}.
> Kahn and Kalai disproved it in high dimensions \cite{KahnKalai1993},
> using a forbidden-intersection theorem of Frankl and Wilson
> \cite{FranklWilson1981} to force many smaller-diameter parts.
> Early reductions in counterexample dimension include $946$
> by Nilli \cite{Nilli1994}, the announced bound $903$ of Grey and
> Weissbach \cite{GreyWeissbach1997}, $561$ by Raigorodskii
> \cite{Raigorodskii1997}, and $560$ by Weissbach \cite{Weissbach2000}.
> Spherical codes led to a further series of reductions. Hinrichs obtained
> dimension $323$ using vectors of the Leech lattice \cite{Hinrichs2002}. Pikhurko reduced the bound to
> $321$ and credited an independent discovery by Hinrichs and Richter \cite{Pikhurko2002};
> Hinrichs and Richter published their bound $298$ in 2003
> \cite{HinrichsRichter2003}.

独立网络核验（素材 1.6，2026-10 执行）的结果我照抄并保留不确定性：综述《Borsuk 猜想 80 年（1932-2013）》与论文链条一致（Nilli 946；Raigorodskii 561；Weissbach 560；Hinrichs 323；Pikhurko 321；Hinrichs-Richter 298；Bondarenko 65；Jenrich 64）。一处口径差：综述记 Borsuk 年份为 1932（会议报告），论文记 1933（Fund. Math. 20: 177-190 发表年；references.bib 的 Borsuk1933 条目给出完整出处 "Drei Sätze über die n-dimensionale euklidische Sphäre"，DOI 10.4064/fm-20-1-177-190，已核实一致）。Pikhurko 条目的 bib 标题是 "Borsuk's Conjecture Fails in Dimensions 321 and 322"，即 321/322 两维各有一个反例，纪录意义在 321。Grinsztajn 2026（5 月，作者仓库 6 页证明注记）是本篇之前的最小已知失败维数 63；本篇改进到 9，直降 54 维，同时把"有限点集"升级为"紧集"。

必须留下的 [未核实] 记录：素材检索时无法核实"Szarek 18 维、Kupka / Aubry 的 12、11、10 维改进、Schramm、Swanepoel 41 维"这组数字。多轮检索（含 "Szarek Borsuk 18"、"Aubry/Kupavskii Borsuk 12 11 10"、"Swanepoel Borsuk 41"）无可靠命中，两次 Wikipedia 抓取失败，且这些人名全部不在论文 references.bib 的 20 条文献里。撰写本笔记时我不引用这组数字作反例维数纪录；它们可能与 $b(n)$ 指数下界线的 Szarek/Schramm 贡献或凸体/照明问题混淆，但在可检索范围内无法验证。论文口径下可安全使用的句子只有一条：自 Kahn-Kalai 起维数纪录沿 946 → 903 → 561 → 560 → 323 → 321 → 298 → 65 → 64 → 63 单调下降；2026-09-23 的本篇给出 9，并推论覆盖一切 $d\ge9$；断言失败的最小维数与 $b(X)$ 精确值仍开放。

## 8 引理 2.1：投影子几何，直径对的完全刻画

**(a) 陈述**（geometry.tex 第 26-38 行 + 证明开头，逐字）：

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

注意论文在这里就把 $k$ 一般化写了。我读出的意图 [推测]：Prop 4.1、Thm 4.3、Lemma 5.2 都要在 $k=4$ 和 $k=3$（以及限制到 $x_0^\perp$ 时的 $k-1$）之间反复切换，载体几何若只证 $k=4$ 会在下游到处补洞。

**(b) 不跳步推导**。论文把核心计算压成一句 "$\operatorname{tr}(P_x^2)=\operatorname{tr}(P_y^2)=1$ and $\operatorname{tr}(P_xP_y)=\langle u,v\rangle^2$"（geometry:40-50），我补全展开：

- $\|P_x-P_y\|_F^2=\operatorname{tr}\bigl((P_x-P_y)^2\bigr)=\operatorname{tr}(P_x^2)-2\operatorname{tr}(P_xP_y)+\operatorname{tr}(P_y^2)$（Frobenius 范数由 $\langle A,B\rangle_F=\operatorname{tr}(AB)$ 生成于对称矩阵上；展开平方用 trace 线性）。
- $\operatorname{tr}(P_x^2)=\operatorname{tr}(P_x)=\|u\|^2=1$（幂等性 $P_x^2=P_x$ 更干净）。
- $\operatorname{tr}(P_xP_y)=\operatorname{tr}(uu^{\mathsf T}vv^{\mathsf T})=(u^{\mathsf T}v)(v^{\mathsf T}u)=\langle u,v\rangle^2$（trace 循环性）。合计得 (2.1)。
- 取值域：$\langle u,v\rangle^2\in[0,1]$（Cauchy-Schwarz），距离平方 $\in[0,2]$；$\sqrt2$ 可达当且仅当 $\langle u,v\rangle=0$；正交线对存在因为 $k\ge2$。
- 同胚：$u\mapsto uu^{\mathsf T}$ 对 $u\sim-u$ 不变，降到 $\mathbb P(V)$ 上连续单射；紧进 Hausdorff 的连续双射是同胚（论文原话 "A continuous injection from the compact space $\mathbb P(V)$ into a Hausdorff space is a homeomorphism onto its image"）。
- trace-one 仿射超平面维数：$\operatorname{Sym}(V)$ 维数 $N_k=k(k+1)/2$（$k$ 个对角 + $\binom k2$ 个非对角），trace 非零线性泛函，核余维 1。$k=4$：$N_4=10$、超平面 9 维。主定理的"9"在这一行定型。

**(c) 机械理由**。$k\ge2$ 是"$\sqrt2$ 真被取到"的最小要求；$N_k$ 是全文标签下界（Prop 4.1）与维度计数（$d=N_k-1$）的母参数；(2.1) 的"距离只依赖 $\langle u,v\rangle^2$"是把"直径 $<\sqrt2$"翻译成"块内无正交对"的唯一接口，Lemma 2.4 与 Corollary 7.1 都回用它。Lean 对应：`Projectors/Basic.lean` 的 `projector_inner`（⟪P_u,P_v⟫=⟪u,v⟫²，用 `Fintype.sum_prod_type` 拆双重和，正是上面补的第三步）、`projector_dist_sq`、`projector_dist_eq_sqrt_two_iff`（⟺ ⟪u,v⟫=0）、`diam_projectorSet`（上界 `Metric.diam_le_of_forall_dist_le`，下界取见证 `u = single 0 1`、`v = single 1 1`）、`isCompact_projectorSet` = 球面像。Lean 里 $k$ 固定为 4（`Vector4`），一般 $k$ 在 `Support/Purity.lean` 等处用 `EuclideanSpace ℝ (Fin (k+1))` 重新参数化 [Lean]。

**(d) [推测] 失败路线**。(1) 谱范数或算符范数替代 Frobenius：秩一投影子谱范数全是 1，距离信息塌缩，(2.1) 不成立；[措辞] geometry:9-13 专门交代 CHS 弦距差因子 $1/\sqrt2$，说明作者核对过归一化选择。(2) 用 $\mathbb C^4$ 复投影子：trace-one 仿射切片维数成 $k^2-1=15$，$N_k$ 型实对称坐标公式失效 [Lean：`projector_apply` 逐分量乘积无共轭]。(3) 取凸包（密度矩阵体）：混合点距离不同，"块内无正交对"逐点翻译失效；论文通篇零提及凸包且 intro 强调 "full compact projector image"，[推测] 是明确拒绝凸化。

## 9 注记 2.2：显式等距到 $\mathbb R^9$，"$\mathbb R^9$"三个字的兑现

**(a) 原文**（geometry.tex 第 52-70 行，逐字）：

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
> \end{equation}
> The first three coordinates use an orthonormal basis of the trace-zero
> diagonal matrices.  The factors $\sqrt2$ in the remaining six coordinates
> account for the two equal off-diagonal entries in the Frobenius norm.
> Thus the nine-dimensional witness will be $X_4$ with exactly its stated
> metric.

主定理说 $X\subset\mathbb R^9$，而构造给的是矩阵空间里的集合。这一注记是两者之间的兑现凭证，末句 "with exactly its stated metric" 声明不许换度量。

**(b) 补算**。论文称 "orthonormal basis" 但未验证，我验。对角基 $E_1=\frac1{\sqrt2}\mathrm{diag}(1,-1,0,0)$、$E_2=\frac1{\sqrt6}\mathrm{diag}(1,1,-2,0)$、$E_3=\frac1{\sqrt{12}}\mathrm{diag}(1,1,1,-3)$，内积 $\langle E_i,E_j\rangle_F=\operatorname{tr}(E_iE_j)$：$\|E_1\|^2=(1+1)/2=1$；$\|E_2\|^2=(1+1+4)/6=1$；$\|E_3\|^2=(1+1+1+9)/12=1$；$\langle E_1,E_2\rangle=(1-1)/\sqrt{12}=0$；$\langle E_1,E_3\rangle=(1-1)/\sqrt{24}=0$；$\langle E_2,E_3\rangle=(1+1-2)/\sqrt{72}=0$。三个向量张成 trace-zero 对角面（三维）。第 $i$ 个对角坐标恰是 $\langle A,E_i\rangle_F$。非对角：$\|A\|_F^2=\sum_ia_{ii}^2+2\sum_{i<j}a_{ij}^2$，坐标取 $\sqrt2a_{ij}$ 才把 $2a_{ij}^2$ 搬成 $(\sqrt2 a_{ij})^2$，这就是 "account for the two equal off-diagonal entries" 的所指。核：全空间上线性映射的核是 $\operatorname{span}\{I\}$（四对角元相等时三分式同时为零），限制在 trace-one 仿射超平面（两元差自动 trace-zero）上是双射等距。Lean 对应：`Main.lean` 的 `coordinates9`（逐字翻译此式，`WithLp.toLp 2` 即 $\ell^2$ 结构）、`coordinates9_norm_sq`（`Real.sq_sqrt` 处理 $\sqrt2,\sqrt6,\sqrt{12}$ 的平方，配合 `h33`：trace-zero 消元 $a_{44}=-a_{11}-a_{22}-a_{33}$）、`coordinates9_dist`/`coordinates9_isometry`、`coordinates9_diam`（等距保直径）、`coordinates9_cover_pullback`（$\mathbb R^9$ 里的覆盖拉回矩阵空间）、总装 `euclidean_nine_counterexample`。[Lean] Lean 里"$X$ 真的住在 $\mathbb R^9$"由这条定理链承担，并非 `main_theorem`，`main_theorem` 只在矩阵模型内陈述（见第 29 节）。

**(c) 机械理由**。$\sqrt2,\sqrt6,\sqrt{12}$ 是四步归一：$(1,-1,0,0)$ 范数 $\sqrt2$；$(1,1,-2,0)$ 范数 $\sqrt6$；$(1,1,1,-3)$ 范数 $\sqrt{12}=2\sqrt3$。它们是 $\mathfrak{sl}_4$ Cartan 子空间的递归构造 $e_1'-e_2'$、$(e_1'+e_2')-2e_3'$、$(e_1'+e_2'+e_3')-3e_4'$。[推测] 取 $A=uu^{\mathsf T}$ 时这些坐标是 $S^3$ 上二次球谐型函数，"用 4 维球上的二次谐波把 10 个标签装进 9 维"可能是选这组基的隐藏理由，但没有文本证据，只是从 CHS 打包类比反推。

**(d) [推测] 失败路线**。(1) 不显式给等距、直接引"任何 9 维仿射子空间互相同构"：存在性够用，但比较器与论文要求 "with exactly its stated metric"，且 Lean 必须有具体坐标才能算 `diam = Real.sqrt 2` 与覆盖拉回。(2) 用整个 $\{A:\operatorname{tr}A=1,A\succeq0\}$ 的内蕴度量嵌入：把秩 2、秩 3 的边界点也带上，直径断言不再由正交对控制。

## 10 定义 2.3：可容许映射与支集复形，问题的连续化立宪

**(a) 原文**（geometry.tex 第 72-91 行 + 第 129-139 行支集复形段，逐字）：

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

以及支集复形段：

> For an admissible map, define its \emph{support complex} $K$ on the label
> set $\{1,\ldots,m\}$ by
> \[
>  I\in K\quad\Longleftrightarrow\quad
>  I\subseteq S(x)\ \text{for some }x\in\mathbb P(V).
> \]
> It is a finite simplicial complex, possibly with unused labels, and $f$
> takes values in its geometric realization inside the standard simplex.
> No triangulation of $\mathbb P(V)$ is assumed.

**(b) 说明**。条件 (2.3) 只要求单向蕴含（正交 ⇒ 支集不交）；逆否之外没有任何要求，这是后面"补集三元组不可同为面"论证的方向性基础。$S(x)\ne\varnothing$ 自动（$\sum f_i=1$、非负）。子空间限制保持性：内积是限制的，$x,y\in\mathbb P(W)$ 在 $W$ 内正交当且仅当在 $V$ 内正交，(2.3) 继承；"恒零坐标可删除"允许把 $\mathbb P(x^\perp)$ 上的限制当 $\mathbb{RP}^2\to\Delta^5$（六标签）用，这是 Lemma 6.1 的关键接口。$K$ 向下封闭是定义级的。$f$ 取值在 $|K|$：$S(x)\in K$ 且 $i\notin S(x)$ 时 $f_i(x)=0$，故 $f(x)\in\Delta^{S(x)}\subset|K|$。末句 "No triangulation of $\mathbb P(V)$ is assumed." 与 T8 一脉（第 5 节），第二次排除三角化借力路线。

**(c) 机械理由**。$m=10$ 是覆盖块数；$\Delta^{m-1}$ 固定重心坐标口径；"possibly with unused labels" 允许空块，使"≤10 块覆盖"与"10 标签可容许映射"完全等价（配合 Lemma 2.4 的 padding）。Lean 对应 [Lean]：`Projectors/Basic.lean` 第 101-108 行 `structure Admissible`，口径是全空间偶函数 $f:\mathbb R^4\to(\operatorname{Fin}10\to\mathbb R)$：`smooth : ∀ i, ContDiff ℝ ∞ (fun u => f u i)`（要求 $\mathbb R^4$ 上 $C^\infty$ ，并非仅球面光滑）、`antipodal : ∀ u i, f (-u) i = f u i`、`nonneg/sum_one` 只在 $\|u\|=1$ 上要求、`orthogonal` 用 ⟪u,v⟫=0。$S(x)$ 换成 `positiveSupport`（`Finset.univ.filter`，Basic.lean 第 243-252 行）。`supportComplex` 在 `Simplicial/Supports.lean` 有定义，但主链实际用 `Support/SupportIncidence.lean` 第 13-14 行的 `SupportFace f S := ∃ u, ‖u‖ = 1 ∧ S ⊆ positiveSupport f u`，与 $I\in K$ 逐字等价。

**(d) [推测] 失败路线**。(1) 只要求连续不要求光滑：单位分解能活，Sard 定理（Thm 4.3 两处正则值）死；[措辞] 论文用 "smooth partition of unity … gives smooth nonnegative functions" 主动买光滑。(2) 把 (2.3) 强化为等价：多余且假，同块内可以任意混合非正交线。(3) Lean 的 `ContDiff ℝ ∞` 全局光滑化 + `antipodal` 字段在论文里没有对应物 [推测]：论文 $f$ 定义在 $\mathbb P(V)$ 上根本不需要奇偶性；Lean 用"球面限制提升为偶函数"绕开商流形微分结构的形式化成本，若直接在 `RP` 图卡上定义要记账 atlas 兼容性，代码量大概翻倍；旁证是 Lemma 2.4 的 Lean 版用 `SmoothPartitionOfUnity.exists_isSubordinate` 的 ambient（$\mathbb R^{16}$ 闭集）版本，并非商流形版本。

## 11 引理 2.4：严格间隙归约，全文唯一一条分析桥

**(a) 原文**（geometry.tex 第 92-127 行，陈述 + 证明全文逐字）：

> \begin{lemma}[The strict-gap reduction]
> \label{lem:cover-to-map}
> If $X_k$ is covered by at most $m$ subsets, each of diameter strictly less
> than $\sqrt2$, then there is an admissible map
> $f:\mathbb P(V)\to\mathbb R^m$.
> \end{lemma}
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
> Pull these sets back to a finite open cover $V_i$ of $\mathbb P(V)$.
> A smooth partition of unity subordinate to this cover
> \cite[Theorem~2.23]{Lee2013} gives smooth
> nonnegative functions $f_i$, with sum one and $f_i(x)>0$ only if
> $x\in V_i$.  Empty sets receive the zero function.  If $i$ belonged to
> both $S(x)$ and $S(y)$ for orthogonal lines $x,y$, then $P_x,P_y\in U_i$
> would be at distance $\sqrt2$ by Lemma~\ref{lem:projector-geometry},
> a contradiction.
> \end{proof}

这就是过渡 (A) 的本体，也是第 2 节染色死路的正式下葬处。intro 第 86-87 行（T10）给它补了一句口径声明："Section~\ref{sec:geometry} proves this reduction for arbitrary covering sets."，防"你的归约是否只对可测/正则覆盖成立"之问：证明确实不对 $A_i$ 加任何假设。

**(b) 补算**。覆盖性：$P\in A_j$ 某 $j$ ⇒ $\operatorname{dist}(P,A_j)=0<\varepsilon_j$。三角不等式链（论文压缩）：取 $p,q\in A_i$ 使 $\|P-p\|,\|Q-q\|<\varepsilon_i$，则 $\|P-Q\|<2\varepsilon_i+d_i$；代入 $\varepsilon_i=(\sqrt2-d_i)/4$ 得 $d_i+2\varepsilon_i=(d_i+\sqrt2)/2$，且 $<\sqrt2\iff d_i<\sqrt2$，严格性来自 $d_i$ 严格小。$\operatorname{diam}(U_i)\le(d_i+\sqrt2)/2$：逐对严格小于一个常数的集合，直径（上确界）取弱不等号，纯上确界论证、不需要紧性。回拉：$V_i=\{x:P_x\in U_i\}$，同胚保开、保覆盖、有限（$m$ 个）。Lee 2.23 给 $f_i\ge0$、$\sum f_i=1$、$\operatorname{supp}f_i\subset V_i$，故 $f_i(x)>0\Rightarrow x\in V_i$。验证 (2.3)：共享标签 $i$ 的正交对给 $P_x,P_y\in U_i$，距离 $<\sqrt2$，与引理 2.1 的正交距离 $=\sqrt2$ 矛盾。

**(c) 机械理由**。**4** 的来源：真正需求是 $2\varepsilon_i<\sqrt2-d_i$；取 $1/4$ 让间隙先被两侧三角不等式吃掉一半、再对折留一倍松弛，使 "$<$" 在任何 ≤ 化版本里也不塌。$1/2$ 勉强可行，$1/1$ 在闭包等号处爆。见第 30 节参数表 ε 行。padding 空集把 "at most $m$" 变成精确 $m$ 标签映射，空集配零函数，对应"unused labels"。引理是单向的（覆盖 ⇒ 映射）；Lean 把反向也补了：`admissible_to_cover` 取 $L_i=\{u:\|u\|=1\wedge f_i(u)\ge1/10\}$ 的投影像，鸽笼给覆盖、`compact_diam_lt`（`exists_isMaxOn`）把逐对严格小升为直径弱不等，最后 `cover_iff_admissible` 双向封装 [Lean]。反向阈值 $1/10$ 就是平均值 $\sum f_i=1$ 的鸽笼常数。依赖清单：Lee2013 Thm 2.23；Lean 侧换成 $\mathbb R^{16}$ ambient 的 `SmoothPartitionOfUnity.exists_isSubordinate`，印证 10(d)(3)。

**(d) [推测] 失败路线**。(1) 跳过开化直接分派特征函数：$f_i$ 不连续，(B)(C) 全断，T13 就是针对此路的墓碑。(2) 用连续版单位分解：Sard 需要 $C^\infty$（至少 $C^k$、$k>\dim$），Thm 4.3 正则值选取失效。(3) $\varepsilon_i=(\sqrt2-d_i)/2$：开邻域直径只压到 $\le\sqrt2$，正交对检验不再是矛盾；[推测] 间隙减半是标准失效模式，证据是 `/4` 被原样写进 Lean（`Basic.lean` 第 140 行 `(Real.sqrt 2 - Metric.diam (C i)) / 4`），作者把它当实质参数，并非装饰。(4) 无限覆盖 + 单位分解：$K$ 必须有限（$|[m]|=10$ 的计数贯穿组合段），Lean 全程 `Fin 10`。

## 12 引理 3.1：正延拓，把函数从射影空间搬到 PSD 锥上

**(a) 原文**（extension.tex 第 9-47 行，定义与陈述逐字）：

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

这个构造是过渡 (B) 的前半。我的动机重构 [措辞 + 结构]：需要把 $f$ 的"每条线的标签信息"扩展到整个矩阵空间，且扩展要兼容分块（Thm 4.3 后面要把 $A=\lambda P_x+(1-\lambda)B$ 的 $F$ 值拆回两块），逐点定义做不到，平均化（积分）是唯一同时保住连续性、支集精确性与齐次性的办法。

**(b) 证明补全**（论文 49-101 行）。连续性：$Q\mapsto Q^{1/2}$ 在 PSD 锥上连续，论文论证是含谱紧区间上 Weierstrass 多项式一致逼近 $\sqrt x$ 再代入矩阵；被积 $(Q,u)\mapsto H(Q^{1/2}u)$ 联合连续，紧球面上积分保连续。一次齐次：$H(cv)=c^2H(v)$（$c\ge0$），故 $E_V(tQ)=tE_V(Q)$（$(tQ)^{1/2}=t^{1/2}Q^{1/2}$，$H$ 吃出因子 $t$）。坐标和：$\sum_iE_V(Q)_i=k\int\|Q^{1/2}u\|^2d\mu=k\int\langle Qu,u\rangle d\mu$（用 $\sum f_i=1\Rightarrow\sum H_i(v)=\|v\|^2$）；$\int\langle Qu,u\rangle d\mu=\langle Q,\int uu^{\mathsf T}d\mu\rangle_F$；旋转不变 ⇒ $\int uu^{\mathsf T}d\mu=cI$；取迹定 $c$：$1=\int\|u\|^2=k\,c$ ⇒ $c=1/k$；得 $\sum E_i=\operatorname{tr}Q$。支集精确 (3.2)：$\subseteq$ 因 $Q^{1/2}u\in\operatorname{ran}Q$（同核）；$\supseteq$ 若 $i\in S(x)$、$x=\mathbb R\,Q^{1/2}u_0$（$Q^{1/2}$ 在其像上可逆保证 range 直线可达），第 $i$ 个被积量在 $u_0$ 处为正、附近开集正、球面开集正测 ⇒ 积分 $>0$。$E_V(P_x)=f(x)$：$P_x^{1/2}=P_x$，$P_xu'=\langle u,u'\rangle u$，$H(\cdot)=\langle u,u'\rangle^2f(x)$，$k\int\langle u,u'\rangle^2d\mu(u')=1$（二阶矩 $1/k$）。子空间恒等式（第 2 条，最关键）：像测度 $B\mapsto\int_{\mathbb S(V)}\|\pi_Wu\|^2\mathbf1_{\{\pi_Wu/\|\pi_Wu\|\in B\}}d\mu_V$ 是 $\mathbb S(W)$ 上旋转不变测度（$\pi_W$ 与 $O(W)$ 交换），故为 $c\mu_W$；总质量 $c=\int\|\pi_Wu\|^2d\mu_V=\sum_{j\le r}\int\langle w_j,u\rangle^2d\mu=r/k$。于是 $k\int_{\mathbb S(V)}H(Q^{1/2}u)d\mu_V=k\cdot(r/k)\int_{\mathbb S(W)}H((Q|_W)^{1/2}w)d\mu_W=E_W(Q|_W)$（用到 $Q^{1/2}|_{W^\perp}=0$）。平滑性（第 3 条）：局部光滑正交标架（Gram-Schmidt 于固定基投影）；$C\mapsto C^{1/2}$ 在正定锥光滑（PSD 边界只是连续，这就是要求 positive definite 的原因）；$H$ 在非零处光滑；紧球面参数微分。

**(c) 机械理由**。因子 $k$：恰抵消 $\int uu^{\mathsf T}=I/k$，$\sum E_i=\operatorname{tr}Q$ 归一是 Prop 4.1 里"$\|\cdot\|_1$-球面 $=\operatorname{tr}|\cdot|$-球面"等同的根基。"positive square root is meant throughout"：PSD 谱函数唯一，保 $\operatorname{ran}Q$ 精确（同核论证），(3.2) 依赖它。子空间恒等式用因子 $\dim W$ ，并非 $\dim V$：[措辞/结构] 没有这条，Thm 4.3 的 $G_x:\Sigma(x^\perp)\to\Sigma_a$ 就与 $F$ 脱钩，(4.6) 的分块恒等式 $A=\lambda P_x+(1-\lambda)B$ 要求 $E_V$ 对正交分块直接相加。$H$ 取 2 次齐次：$\sum H_i=\|v\|^2$ 与 $\int$ 出 $\operatorname{tr}Q$ 匹配（$Q^{1/2}$ 给两次 $u$）；1 次会得到 $\int\|Q^{1/2}u\|$，trace 等式失去。Lean 对应：`SphereGeometry/HomogeneousLift.lean`（`homogeneousLift`）、`IntegralLift.lean`（`integralLift f T`，$T=Q^{1/2}$ 以 `E →L[ℝ] E` 传入；`integralLift_nonneg/sum/pos_iff_sphere` 逐条对上）、`SphereMeasure.lean`（`sphereProbability` + `IsOpenPosMeasure` 实例，`sphereProbability_openPos`）、`SphereMoments.lean`（`sphere_coord_diag`：$\int u_i^2=1/\dim$；`sphere_coord_cross`；`sphere_quadratic_integral`：$\int\langle Au,u\rangle=\operatorname{tr}A/\dim$）；子空间恒等式在 `MatrixGeometry/MatrixCompression.lean`/`FibreTransport.lean` 一族（按 statement 级对应，素材未逐文件读证明）。

**(d) [推测] 失败路线**。(1) 高斯测度代替球面测度：二矩等向性照样有，但 $E_V(P_x)=f(x)$ 依赖"质量集中在 $\|u\|=1$"与二次齐次的耦合，高斯版每个 $x$ 多一个径向因子，且子空间换元的 $r/k$ 被污染 [结构论证，无文本证据]。(2) 不取平方根直接用 $Q$：$\sum_i$ 变 $\langle Q^2u,u\rangle$，积分出 $\operatorname{tr}Q^2$，trace 归一崩。(3) 对奇异 $Q$ 强行光滑化平方根：特征值穿零处 $\sqrt\lambda$ 不可微，第 3 条限定 positive definite 是不得不；[措辞] 论文专门写 "including its singular boundary"（连续）与 "positive definite"（光滑）两级口径。

## 13 引理 3.2：符号延拓与奇球映射，全文机件的点火器

**(a) 原文**（extension.tex 第 103-138 行，逐字）：

> For a symmetric operator $A$, let $|A|=(A^2)^{1/2}$ and
> $A_+=(|A|+A)/2$, $A_-=(|A|-A)/2$.  These are its positive and negative
> parts, so $A=A_+-A_-$ and their ranges are orthogonal.  Define
> \begin{equation}
>  F(A)=E_V(A_+)-E_V(A_-).
>  \label{eq:signed-extension}
> \end{equation}
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

**(b) 证明补全**（论文 140-174 行）。$A_\pm$ 逐项验证：谱分解 $A=\sum\lambda_jv_jv_j^{\mathsf T}$，$(|A|+A)/2$ 在 $\lambda>0$ 处给 $\lambda$、$\lambda<0$ 处给 0 ✓；range 正交（不同特征子空间）。奇性：$(-A)_+=A_-$ ⇒ $F(-A)=-F(A)$。一次非负齐次：$(tA)_\pm=tA_\pm$ 加 $E$ 一次齐次。**无对消**（(3.5) 引擎）：$\operatorname{ran}A_+\perp\operatorname{ran}A_-$，而可容许性 (2.3) 说正交线的支集不交，于是两个并集（(3.4) 左右）不交；由 (3.2)，$E(A_+)$ 正坐标在第一并集、$E(A_-)$ 正坐标在第二并集，逐坐标至多一边非零 ⇒ 无抵消 ⇒ $\|F(A)\|_1=\operatorname{tr}A_++\operatorname{tr}A_-=\operatorname{tr}|A|$，$\sum F_i=\operatorname{tr}A_+-\operatorname{tr}A_-=\operatorname{tr}A$（论文 "by summing coordinates" 一句压缩了这两条链）。核 ⇒ 零坐标：$x\in\ker A$ 线；$\operatorname{ran}A_\pm\subseteq\operatorname{ran}A$，$x$ 与二者都正交；取 $i\in S(x)$（非空），$i$ 不在任一并集（否则正交线共享标签，违 (2.3)）⇒ $F(A)_i=0$。逆否即"全坐标非零 ⇒ 无核"。全负 ⇒ 负定：第一并集空 ⇒ $E(A_+)=0$ ⇒ $\operatorname{tr}A_+=0$ ⇒ $A_+=0$（PSD 迹零）⇒ $A\le0$，再用无核逆否。光滑性：谱投影显式式 $\Pi_\pm(A)=\frac12(I\pm A(A^2)^{-1/2})$；验证：$A(A^2)^{-1/2}=Q\operatorname{sgn}(\Lambda)Q^{\mathsf T}$，故 $\Pi_+$ 投正特征子空间 ✓；$A$ 非异 ⇒ $\lambda\mapsto\lambda^{-1/2}$ 在正半轴光滑 ⇒ 复合光滑；局部正交标架下 Lemma 3.1 第 3 条给出 $E(A_\pm)$ 光滑。(3.6) 就是 (3.5) 第一式的水平集限制 + 已证的奇性连续。

**(c) 机械理由**。**奇性为什么关键**：Prop 4.1 的全部力量来自"奇映射 $S^n\to S^d$ 要求 $n\le d$"。$F$ 的奇性来源 = 正负部在 $A\mapsto-A$ 下交换 + 可容许性给无对消。若直接令 $F=E(A_+)$ 不做差，映射不奇，维度下界全部消失。$\|F(A)\|_1=\operatorname{tr}|A|$ 是两个不同范数（迹范数与 ℓ1）的恒等，是全文最精妙的归一：它让 $F$ 把"源单位球面"送到"目标单位球面"上，径向归一才能把奇性平移到球面。"degree one for nonnegative scalars" ，并非全体标量：定义只对 PSD 输入验证正射线，负射线由奇性补，两条合起来径向化良定义。Lean 对应：`MatrixGeometry/SignedExtension.lean`、`SphereGeometry/SphereExtension.lean`（`normalizedSignedExtension` 即 $A\mapsto F(A)/\operatorname{tr}|A|$）；`SphereGeometry/OddSphereMap.lean` 第 17-19 行把 (3.6) 复合进 `sphereExtension f := normalizedSignedExtension f ∘ symmetricCoordinates`；`sphereExtension_odd`、`Admissible.sphereExtension_norm`、`sphereExtension_continuousOn`；(3.4) 支集精确 = `Support/SpectralSupport.lean` 的 `signedExtension_pos_iff/neg_iff`；核 ⇒ 零坐标 = `Support/FullSupport.lean`；"全负 ⇒ 负定" = `Support/NegativeFibre.lean`；秩记账 = `MatrixGeometry/MatrixKernel.lean`、`Rank.lean`、`RankPreimage.lean`；`SymmetricCoordinates.lean`/`SymmetricEntries.lean` 把 `EuclideanSpace ℝ (UpperTriangle ν)` 与对称阵线性同构（$N_k$ = `Fintype.card (UpperTriangle ν)`）。

**(d) [推测] 失败路线**。(1) 对不定 $A$ 直接积分 $E(A)$：$A^{1/2}$ 出实数域，且失去奇性 [结构]。(2) 不做支集检查直接减：ℓ1 等式出现对消误差；[措辞] 论文第 148 行专门写 "There is no cancellation in their difference"，这是对消风险的正面回应。(3) 光滑性想一步到位：$\Pi_\pm$ 公式在奇异 $A$ 处 $(A^2)^{-1/2}$ 爆，所以只声明 nonsingular 开集光滑；[推测] 曾想全局横截的尝试由 Thm 4.3 的绕行方式反证：正则性只在每个原像点局部检验，配 Lemma 4.2 的"纤维外不需要光滑"许可。

## 14 norm-sphere 等同段：无编号但全节都在用它

**(a) 原文**（extension.tex 第 176-185 行，逐字，无编号但素材把它算作第 20 个环境外的关键段）：

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

这段是 T14 和 T15 两条防御句的出处，功能上是 Lemma 4.2 的许可证。我读它时在纸上演算的核对：$\operatorname{tr}|\cdot|$ 是范数（正齐次 + 三角不等式，迹范数标准事实），任何范数的单位球面经径向映射与欧氏球面对径同胚；$\ell^1$-球面是八面体表面，同理。光滑分段：$\operatorname{tr}|A|$ 在无零特征值邻域光滑（谱固定重数局部光滑求和）；$\|y\|_1$ 在每个开符号卦限内是 $\pm$ 线性形式。"when $m=N_k$"：只有同维才有 degree；$m<N_k$ 时存在性直接被奇映射维数界否决，$m>N_k$ 时无刚性。

**(b) 补注 + (c) 机械理由**："full-support value"（目标每坐标非零）处局部微分论证合法，因为两处范数都局部线性化、微分结构可搬运；Thm 4.3 选的所有正则值（$r$、$g$、$y=(\lambda r,(1-\lambda)g)$）都刻意落在这类点上，"full-support 取值"从本节起成为全文正则值选取铁律 [措辞]。Lean 对应 [Lean]：`Simplicial/UnitRadial.lean`（`unitRadial`、`annulus` 径向归一工具）、`SphereGeometry/NormSphere.lean`。这里有一个口径转换值得单独记录：Lean 里不存在 $\Sigma(V)$ 这个迹范数球面对象，`sphereExtension` 的定义域直接由欧氏球面给出，范数恒等式只作为引理携带（`symmetricCoordinates` 等距、`normalizedSignedExtension_norm` 证像仍在单位球面上）。即 Lean 把 "radial normalization identifies them antipodally" 实现为"替换成欧氏球再复合归一化"。若照搬叙述，要在 Mathlib 里形式化非光滑超曲面的 degree，成本不可控。

## 15 命题 4.1：标签数下界与等号刚性

**(a) 陈述**（topology.tex 第 28-53 行，typst 定理 8，逐字）：

> If $k\ge2$, every smooth admissible map $f:\mathbb P(\mathbb R^k)\to\Delta^{m-1}$ satisfies $m\ge N_k$. If $m=N_k$, its extension $F$ has mod-two degree one and is surjective. In this equality case, every pair of labels is an edge of the support complex of $f$.

节首两句（topology:4-8，T16）已经把本节的野心说破："The symmetric-matrix extension gives more than a lower bound on the number of labels. At equality, its degree controls every maximal support of the admissible map. We prove that these supports all have the same size and that their sum is a cycle. No triangulation of projective space is assumed." 延拓从计数工具升级为结构工具，这是过渡 (C) 的立项句。

**(b) 推导补全**，三段。第一段（下界 + 满射）：$F:\Sigma(V)\to\Sigma_m$ 经 14 节的径向同胚是 $S^{N_k-1}\to S^{m-1}$ 的奇映射（奇性来自 Lemma 3.2），奇映射要求源维数 ≤ 目标维数（Hatcher Prop 2B.6 与 Cor 2B.7），得 $m\ge N_k$。等号时 $F$ 是奇自映射，mod-2 次数为奇，非零；满射的理由论文逐字给的是 "A map of nonzero degree cannot omit a point of its target sphere, since the complement of a point is contractible"：若非满，$F$ 分解经过 $S^{N_k-1}\setminus\{p\}\cong\mathbb R^{N_k-1}$（可缩），经可缩空间分解的映射零次，与次数 1 mod 2 矛盾 [补]。第二段（边论断的前半）：设 $m=N_k$，取标签 $i\ne j$；在 $\Sigma_m$ 中选每坐标非零、仅第 $i,j$ 坐标为正的 $y$（如 $y_i=y_j=c>0$、其余 $-\varepsilon_l$、调 $\sum|y_l|=1$；具体取法不唯一，只要求符号型 $(++,--,\dots,-)$ [补]）。取原像 $A\in F^{-1}(y)$。断言 1：$A$ 的正谱子空间里每条线只用 $\{i,j\}$ 标签，由 (3.4) 精确谱支集：正特征值线的贡献坐标为正、只能落在正坐标处。断言 2：正谱子空间维数恰 1。若 ≥2，限制 $f|_{\mathbb P(\text{正子空间})}:\mathbb{RP}^1\to\Delta^{\{i,j\}}$ 由限制遗传性（10 节）是至多 2 标签的可容许映射，违反刚证的 $N_2=3$ 下界。第三段（边论断收尾）：$y_i,y_j>0$ 非零，精确谱支集读出 $\{i,j\}\subseteq S(x)$（$x$ 为正线），即 $\{i,j\}$ 是 $K$ 的边。

**(c) 机械理由**。$k\ge2$ 是硬条件：$k=1$ 时 $\mathbb{RP}^0$ 是点、$N_1=1$，边论断无意义。证明里"用 $N_2=3$ 否决 2 维正子空间"是自我引用：命题在 $k=2$ 的实例恰是一般 $k$ 论证里的局部障碍，下界 $N_k$ 从"二次型维数"，并非"同伦维数 $k-1$"涌现，机制就在这里。$m=N_k$ 时源目标同维 $N_k-1$，degree 概念才启动；$m>N_k$ 时只是低维往高维的奇映射，没有刚性。"每坐标非零、恰两正"是锐利选择：正坐标取 3 个以上时，3 标签不违反 $N_2=3$，维数排除法失效。

**Lean 对应** [Lean]：`Simplicial/` 的 `odd_sphere_dimension_bound` 经交叉复形（`FineCrossMap`、`CrossChainDimensionBound`）、细化、`hemisphereComplex`、`CharacteristicDegree` 与 Smith 理论（`SmithTheory/` 2 文件 147 行）证明，完全绕开 Hatcher 2B.6/2B.7 的光滑 degree 语言；满射性 `…_surjective`（`OddHomotopySurjective.lean`）；边论断在 `Support/AllPairs.lean`（179 行，选两正坐标符号向量、正谱线维数 1、精确支集读边，三步与论文逐一对应）。

**(d) [推测] 失败路线**。(1) [措辞] 节首 "No triangulation of projective space is assumed." 反向标记了一条被避开的路线：固定 $\mathbb{RP}^{k-1}$ 三角化、对 $f$ 做单纯逼近、用单纯同调数面。困难在于 $K$ 由 $f$ 动态定义，与任何预定三角化不兼容，逼近会破坏 (2.3) 的严格性。(2) [措辞] "since the complement of a point is contractible" 的一步到位暗示曾单独证满射（逐点 Borsuk-Ulam 反证之类），最后归约为"非零度 ⇒ 满"的标准事实。(3) [推测] 跳过 $N_2=3$ 用纯维数计数：正谱子空间 ≥2 维时 $\mathbb{RP}^1\to\Delta^1$ 不与球维数矛盾（$S^1\to S^1$ 可以有奇映射），必须用组合下界 $2<N_2=3$ 才有缺口。这是本命题必须"下界 + 刚性"并证的原因。

## 16 引理 4.2：局部次数公式，非光滑对象的计数许可证

**(a) 陈述**（topology.tex 第 55-86 行，typst 定理 9，逐字）：

> Let $M$ be a closed smooth $n$-manifold, possibly disconnected, and let $q:M\to Y$ be continuous, with $Y$ Hausdorff. Suppose a point $y\in Y$ has a neighborhood homeomorphic to an open subset of $\mathbb R^n$, and that $q$ is smooth in the corresponding coordinates near $q^{-1}(y)$, with invertible derivative at each point of that fiber. Then the fiber is finite, and the image of the total fundamental class of $M$ in
> \[
>  H_n(Y,Y\setminus\{y\})\cong\mathbb F_2
> \]
> is $|q^{-1}(y)|$ modulo two. In particular, if $Y$ is a connected closed $n$-manifold, this parity is the mod-two degree of $q$.

动机句（topology:55-57，T17）："We will count regular preimages of maps which need not be smooth everywhere. The following local form of the degree formula explains why this causes no problem."

**(b) 推导补全**，四步。①逆函数定理：纤维每点局部微分同胚 ⇒ 纤维离散；$M$ closed（紧无边界）⇒ 纤维紧 ⇒ 有限。②切除正合：$H_n(M,M\setminus q^{-1}(y))\cong\bigoplus_{x}H_n(M,M\setminus\{x\})$（纤维有限故逐点直和）；$Y$ 侧同胚于 $\mathbb R^n$ 开集给 $H_n(Y,Y\setminus\{y\})\cong H_n(\mathbb R^n,\mathbb R^n\setminus\{0\})\cong\mathbb F_2$，生成元是局部定向类 [补]。③全基本类在每个直和项的坐标是 1（mod 2 无符号问题，可定向与否、分支与否都无所谓）。④局部微分同胚把各 $x$ 处生成元送到 $y$ 处生成元，naturality 合成纤维基数 mod 2。证明六行、内容初等（教科书切除论证），单独立引理因为它被引用三次：(4.8) 奇数计数、SW 段偶数的对照、系数段 $|L|\equiv1$。

**(c) 机械理由**。每条假设精确对应 Thm 4.3 里 $F$ 的处境："Y Hausdorff" 保单点闭、切除合法；"possibly disconnected + total fundamental class" 是因为 Thm 4.3 的 $M$（纤维积）与 $\Sigma(V)$ 都可能有分支；"continuous everywhere but smooth only near the fiber" 是核心许可，$F$ 全局只在 nonsingular + full-support locus 光滑（14 节口径）。系数取 $\mathbb F_2$ 的微观原因：让"局部微分同胚保持还是翻转定向"的符号歧义消失，全节因此不需要可定向性。Lean 对应 [Lean]：形式化不调用"切除 + 基本类"同机，对应物分散在 `LocalParity/MatrixParity.lean`（`regular_facet_level_odd`，经 `trace_patch_models` 局部坐标片）与 `LocalParity/SphereParity.lean`（`regular_facet_level_even`，经 `sphere_null_patch_models`）：对具体空间手工构造有限原像双射计数与奇偶引理，引理 4.2 的"许可证"角色由 patch model 的局部同胚数据替代。

**(d) [推测] 失败路线**。(1) [措辞] T17 自己承认：直接引用光滑映射的 degree 定理这条最自然路线被 $F$ 的全局非光滑卡死（迹范数在奇异阵折点）。(2) [推测] 用光滑逼近 $F$ 再取同伦不变性：论文需要的是具体构造值 $y=(\lambda r,(1-\lambda)g)$ 的纤维与 $G^{-1}(g)$ 的精确双射，逼近只给"几乎所有值"的通用陈述，双射信息丢失。(3) [措辞] 证明末句 "This argument uses no smoothness away from the selected fiber."（T18）是边界声明，同时暴露曾经的坑：任何"先整体光滑化再计数"的中间尝试都在这句的防御范围里。

## 17 定理 4.3（一）：陈述、记号与面大小上界

全论文技术核心，topology.tex 第 88-312 行，typst 定理 10，六个带小标题的段落。我按素材 2.10 的分段拆成五节（17-21）重构。

**(a) 陈述逐字**：

> Let $k\ge3$ and $m=N_k$. Suppose $f:\mathbb P(\mathbb R^k)\to\Delta^{m-1}$ is a smooth admissible map. Its support complex $K$ has every pair of labels as an edge, every facet has $k$ vertices, and
> \[
>  \sum_{I\text{ a facet of }K} I
> \]
> is a simplicial cycle over $\mathbb F_2$. Consequently every $(k-2)$-dimensional face lies in a positive even number of facets.

intro 第 100-110 行（T11）给了官方一句话摘要："At the threshold of $k(k+1)/2$ labels on $\mathbb{RP}^{k-1}$, a maximal support with fewer than $k$ labels would give a positive-dimensional regular level set inside one affine projective chart. … The odd degree of the original extension forces an odd preimage count for this map, whereas the chart trivialization makes the same count even through the induced map on the projective bundle." 奇偶对撞框架先声明后执行。

**第 0 段（记号与上界）**，逐字：

> Let $I$ be a face of $K$, maximal for inclusion. Put
> \[
>  s=|I|,\qquad J=\{1,\ldots,m\}\setminus I,\qquad a=|J|,\qquad h=N_{k-1}.
> \]
> Since $I$ is a maximal support face, there is a line $x_0$ with $S(x_0)=I$. Every line in $x_0^\perp$ uses only labels in $J$. Proposition~\ref{thm:label-bound}, applied in $x_0^\perp$, gives
> \eqref{eq:facet-size-upper}:\quad $a\ge h,\qquad s=m-a\le N_k-N_{k-1}=k.$

[补] $N_k-N_{k-1}=k(k+1)/2-(k-1)k/2=k$，恰是上三角新增第 $k$ 行/列元素个数；直觉：maximal 支集至多吃掉"升一维新增的维数"。$x_0^\perp\cong\mathbb R^{k-1}$，Prop 4.1 在其中要用 $k-1\ge2$ ⇔ **$k\ge3$**：陈述里 $k\ge3$ 的全部用处之一（另一处见 SW 段）。"每线只用 $J$"：$x\perp x_0\Rightarrow S(x)\cap I=\varnothing$。(4.2) 左半是 $\mathbb P(x_0^\perp)\to\Delta^{a-1}$ 可容许 ⇒ 标签数 $\ge N_{k-1}$；$J$ 中若某标签全局未用，实际标签数更小，不等式只会更强 [补]。

**(c) 机械理由**：四个记号 $s,a,h$ 与 $m=N_k$ 的互锁关系 $s+a=m$、$a-h=s-(N_k-N_{k-1})+...$ 即 $k-s=a-h$，是后文分诊（正维/零维）的代数底座，18 节兑现。

## 18 定理 4.3（二）：仿射卡、水平集 $L$ 与球丛平凡化

**第 1 段（一个仿射卡上的紧水平集）**，逐字要点：

> \[
>  U_I=\{x\in\mathbb P(V):f_i(x)>0\text{ for every }i\in I\}.
> \]
> Maximality of $I$ implies $S(x)=I$ for all $x\in U_I$. … Moreover, $U_I$ lies in the affine projective chart $\mathbb P(V)\setminus\mathbb P(x_0^\perp)$, because a line orthogonal to $x_0$ cannot use any label in $I$. Choose a regular value $r\in\mathring\Delta_I$ of $f_I$, using Sard's Theorem (Lee Thm 6.10), and put $L=f_I^{-1}(r)\subset U_I$. For now $L$ is allowed to be empty. If $\widetilde r$ denotes $r$ extended by zero on $J$, then $L=f^{-1}(\widetilde r)$ … Hence $L$ is compact. It is a smooth manifold without boundary (Lee Cor 5.14) of dimension
> \eqref{eq:level-dimension}:\quad $\dim L=(k-1)-(s-1)=k-s=a-h.$

[补] 逐步：$x\in U_I\Rightarrow S(x)\supseteq I$；$I$ 极大 ⇒ $S(x)=I$ ⇒ $J$ 坐标恒 0 ⇒ $f_I:U_I\to\mathring\Delta_I$ 光滑。$L=f^{-1}(\tilde r)$ 双向包含：$\supseteq$ 因 $\tilde r$ 在 $I$ 上严格正、原像自动在 $U_I$ 内；$\subseteq$ 因 $x\in L\Rightarrow S(x)=I\Rightarrow$ $J$ 坐标为 0、和为 $1\Rightarrow f_I(x)=r$。紧：闭集于紧 $\mathbb P(V)$。维数：$\dim\mathbb P(V)=k-1$、目标开单形维 $s-1$，正则水平集余维 $s-1$；末等式用 $m=N_k$：$a-h=N_k-s-N_k+N_{k-1}=N_{k-1}-s=k-s$ ✓。"For now $L$ is allowed to be empty."（T19）：非空性此刻未知，赊到账上，第 19 节末由奇偶对撞免费回收。

**路线图段**（topology:142-147，T20，逐字，它同时是第 18-21 节的目录）：

> If $s<k$, the level-set dimension in \eqref{eq:level-dimension} is positive. We will construct a map on a sphere bundle over $L$ whose regular preimages have odd cardinality, by comparison with $F$. The affine-chart trivialization will force the induced map on the projective bundle to have degree zero when $\dim L>0$, contradicting that count. When $s=k$, the same count will determine the coefficient of $I$ in the desired cycle.

**第 2 段（球丛与乘积平凡化）**：对 $x\in U_I$，可容许性给 $f$ 在 $\mathbb P(x^\perp)$ 上只用 $J$ 标签；在第 $k-1$ 维空间做延拓构造得奇映射 $G_x:\Sigma(x^\perp)\to\Sigma_a$。论文断言 "The subspace-restriction and continuity properties of the extension make these maps a continuous map on the corresponding sphere bundle"：[补] 这就是 Lemma 3.1 第 2 条 $E_V(Q)=E_W(Q|_W)$ 的消费点，$G(x,B)=G_x(B)$ 的连续性由子空间恒等式与延拓连续性给出。纤维积

> \[
>  M=\{(x,B):x\in L,\ B\in\operatorname{Sym}(x^\perp),\ \operatorname{tr}|B|=1\}.
> \]

平凡化逐字要点："choose the unit representative $u$ of $x$ having positive inner product with a fixed unit representative of $x_0$. Orthogonal projection from $x_0^\perp$ onto $u^\perp$ is invertible and varies smoothly with $x$; orthonormalizing its images of a fixed basis gives a smooth orthonormal trivialization." 结论 (4.7)：$M\cong L\times S^{h-1}$ 且对径对应 $(x,B)\mapsto(x,-B)\leftrightarrow(x,z)\mapsto(x,-z)$；(4.9)：$\dim M=(a-h)+(h-1)=a-1$。

[补] 投影 $\pi:x_0^\perp\to u^\perp$ 可逆的机制：$\ker\pi=x_0^\perp\cap\mathbb Ru=\{0\}$（$\langle u,x_0\rangle>0\Rightarrow u\notin x_0^\perp$），两侧同维故同构；随 $x$ 光滑（$u(x)$ 在仿射卡内可局部光滑选取）。共轭 $B\mapsto T_xBT_x^{\mathsf T}$ 把 $\Sigma(x^\perp)$ 传输到固定 $\Sigma(x_0^\perp)\cong\mathbb R^h$ 的迹范数球面，再径向归一到欧氏 $S^{h-1}$（14 节口径），两步都等变故保对径。$h=N_{k-1}=\dim\operatorname{Sym}(x_0^\perp)$ 是纤维球面维数 $h-1$ 的来源。口径再收窄（topology:176-178，T21）："Equip $M$ with the smooth structure given by the Euclidean sphere bundle. The trace-norm parametrization is smooth near every definite $B$, which is all that will be needed."，光滑结构以欧氏球丛为准，迹范数坐标只在负定处启用。

**(c) 机械理由**：$U_I$ 必须落在仿射卡 $\mathbb P(V)\setminus\mathbb P(x_0^\perp)$ 内，这是承重件，便利的成分一点都没有（第 20 节 $H^1(L)$ 句会兑现）：卡内 $L$ 与 $x_0^\perp$ 中的线无交，平凡化才有全局光滑标架。$r\in\mathring\Delta_I$（开单形内部）保证原像支集恰为 $I$。$\lambda$ 与拼接推迟到 19 节。

## 19 定理 4.3（三）：丛上的奇数纤维与双射

**第 3 段**。取 $\Sigma_a$ 的开负卦限（$J$ 坐标全负）。原像处 $B$ 无正谱子空间（否则正坐标出现）、无核，逐字理由："the exact support property says that all $J$ labels occur on its range, leaving no label for a kernel line"。故 $B<0$，$G$ 在该原像邻域光滑（Lemma 3.2 的负定 locus 光滑 + 全负 ⇒ 负定）。Sard 在卦限内取正则值 $g$；紧性 ⇒ 纤维有限（可为空）。取 $0<\lambda<1$，

> \[
>  y=(\lambda r,(1-\lambda)g)\in\Sigma_m
> \]

[补] $\|\cdot\|_1$ 校验：$\lambda\cdot1+(1-\lambda)\cdot1=1$ ✓。$y$ 是 full-support（$r$ 内部正、$g$ 卦限负 ⇒ 每坐标非零）。双射断言 $F^{-1}(y)\leftrightarrow G^{-1}(g)$，正向逐链 [按论文补全]：$A\in F^{-1}(y)$ ⇒ $A$ 非异（核 ⇒ 某坐标 0，Lemma 3.2）；正谱线只用 $I$ 标签（正坐标只在 $I$ 位）；正谱子空间维数 1：若 ≥2，它与 $x_0^\perp$（超平面）之交含线（维数公式 $2+(k-1)-k\ge1$ [补]），该线 $\perp x_0$ 不能用 $I$ 中任何标签，与"正线只用 $I$ 且 $I$ 非空"矛盾。记正线为 $x$：正坐标全非零 ⇒ $S(x)\supseteq I$ ⇒ $x\in U_I$、$S(x)=I$（负标签不在正线上）。正坐标和 $=\lambda$ ⇒ 唯一正特征值 $=\lambda$。得 (4.6)：

> \eqref{eq:preimage-splitting}:\quad $A=\lambda P_x+(1-\lambda)B,\ B<0\ \text{on}\ x^\perp,\ \operatorname{tr}|B|=1.$

子空间恒等式给出 $f_I(x)=r$、$G_x(B)=g$；反向由 (4.6) 逐参数重建，双射成立。正则性：源坐标 $(\lambda',x',B')$（正质量 $\lambda'=\operatorname{tr}A_+$、正特征线 $x'$、归一负部分 $B'$；单根特征值谱投影局部光滑 [补]），目标坐标对应 $(\text{正质量},r\text{-块},\text{负块归一})$，$F$ 局部形如 (4.11)：

> \[
>  (\lambda',x',B')\longmapsto(\lambda',f_I(x'),G_{x'}(B')).
> \]

逐块可逆性论证（逐字）："The first derivative block is the identity. The second is surjective because $r$ is regular for $f_I$. On the kernel of these two blocks, the third block is the derivative of $G|_M$, which is surjective because $g$ is regular. Thus the full derivative is surjective, and is an isomorphism since source and target both have dimension $m-1$." 于是（Lemma 4.2 + $F$ 奇次数 (4.8)）：

> \eqref{eq:bundle-odd-count}:\quad $|G^{-1}(g)|=|F^{-1}(y)|\equiv1\pmod2.$

收束句（topology:240，T22）："This proves, in particular, that $L$ is nonempty." [补] 若 $L=\varnothing$ 则 $G^{-1}(g)=\varnothing$，偶数 0 与 (4.12) 矛盾，18 节赊的账在这里兑现。

**(c) 机械理由**：$\lambda\in(0,1)$ 开区间是双块非零的前提，两侧半轴各自塌掉（正块为零则无正线、负块为零则无 $g$ 可言）；质量守恒使第一雅可比块恰为恒等（$\lambda'=\operatorname{tr}A_+$ 直接读坐标）。负卦限选 $g$ 的唯一功能是把原像逼进"$B$ 负定"区域，那里 Lemma 3.2 的光滑性执照有效。[措辞] 论文把 "the exact support property" 引了两遍（无核论证与负定论证），说明支集精确性 (3.4) 是本段真正的弹药库，延拓没有它一切定性陈述（哪些标签在哪些坐标出现）都退化为不等式。

## 20 定理 4.3（四）：二重覆叠与 Stiefel-Whitney 对撞，强制 $s=k$

**第 4 段**。$G$ 对球变量奇 ⇒ 商映射 $\overline G:L\times\mathbb{RP}^{h-1}\to\mathbb{RP}^{a-1}$。$w,u$ 为各自对径二覆叠关联实线丛的一阶 Stiefel-Whitney 类。等变性 "identifies the pullback of the target sphere cover with $L\times S^{h-1}\to L\times\mathbb{RP}^{h-1}$"，具体同构逐字："the identification sends $(x,z)$ to $((x,[z]),G(x,z))$ and is an isomorphism on each two-point fiber." 由自然性（Hatcher VB Thm 3.1(a)）得 (4.13)：

> \[
>  \overline G^*w=\operatorname{pr}_2^*u,
> \]

并紧跟声明（topology:265，T23，全定理最关键的一句防御）："There is no contribution from $H^1(L)$ in this identity."

若 $a>h$：$u^h=0$（Hatcher 3.19：$H^*(\mathbb{RP}^{h-1};\mathbb F_2)=\mathbb F_2[u]/u^h$），于是 $\overline G^*(w^{a-1})=\operatorname{pr}_2^*(u^{a-1})=0$（$a-1\ge h$）。源、目标都是闭 $(a-1)$-流形，$w^{a-1}$ 是目标顶类，对顶基本类求值 ⇒ $\overline G$ 的 mod-2 次数为 0。但 $[g]$ 在商坐标中是正则值，且"every preimage of $[g]$ has exactly one representative mapping to $g$" [补]（$\{z,-z\}$ 中恰一个映到 $g$：负卦限与正卦限不交，另一代表映 $-g$），故 $[\bar g]$ 的原像数 $=|G^{-1}(g)|$ 为奇（4.12），与次数 0 矛盾。结合 (4.2) 的 $a\ge h$：得 $a=h$、$s=k$ 对每个极大面成立。

[补] 维数自洽：$\dim(L\times\mathbb{RP}^{h-1})=(a-h)+(h-1)=a-1=\dim\mathbb{RP}^{a-1}$ ✓。SW 论证只在 $\dim L=a-h>0$ 时"可杀"；$a=h$ 时源 $=\mathbb{RP}^{h-1}$、$u^{h-1}\ne0$，论证自动熄火，二分恰好。

**(c) 机械理由**：$h=N_{k-1}$ 同时是纤维球面维数 + 1 与 $u^h=0$ 的幂零指数，一个数两处用，$a$ 与 $h$ 的差恰是 $L$ 的维数，三量互锁没有自由度。$u^h=0$ 用的是严格不等号 $a>h\Rightarrow a-1\ge h$：若 $a=h$ 则 $a-1=h-1$、$u^{h-1}$ 是顶类、拉回是否消失无从判断，这正是"等号情形另开一段"的原因。

**(d) [推测] 失败路线**。(1) [措辞] T23 标出最大的坑：若平凡化失败（$M\to L$ 非平凡丛），则 $\overline G^*w=\operatorname{pr}_2^*u+\operatorname{pr}_1^*\beta$，$\beta\in H^1(L)$ 的幂次可以补足顶类、degree 不再为零，整个偶数论证崩盘。"no contribution from $H^1(L)$" 之所以要专门声明，是因为它依赖 18 节的仿射卡平凡化，那是前置投资在此处收息。(2) [推测] 用 Borsuk-Ulam/交错映射维数论直接证 $s\le k$ 并免掉循环结构：逐面独立论证给不出系数一致性，21 节必须逐面读系数再拼全局循环，说明"和是循环"是整体信息。(3) [Lean] 形式化侧证据：SW 特征类语言在 78,964 行里完全未出现（grep 无 Stiefel/Whitney/cup-product 论证），奇偶对撞被拆成 `MatrixParity`（奇）与 `SphereParity`（偶）两个独立 patch-model 引理、在 `NoFreeRidge` 里以 `zero_ne_one` 对撞，SW 段整体被 `Projectors/ChartSurgery.lean` 的 `chart_surgery_impossible`（单纯/组合的"卡手术"不可能性）替代 [推测]：数学证明原本就按"矩阵侧数一次、球面侧数一次"组织，Lean 保留了拆分、替换了拓扑机件，因为 Mathlib 没有现成特征环库。

## 21 定理 4.3（五）：零维回收系数，循环成形

**第 5 段（面系数）**。现在 $\dim L=0$，$L$ 有限；每个 $G_x:\Sigma(x^\perp)\to\Sigma_h$ 是同维奇映射 ⇒ 奇次数（Hatcher 2B.6）；$g$ 对每个纤维映射正则（[补] 因 (4.11) 的三角雅可比第三块 $=dG_x$），每纤维贡献奇数 ⇒ (4.14)：

> \eqref{eq:facet-odd-count}:\quad $|f^{-1}(\widetilde r)|=|L|\equiv1\pmod2.$

每个面 $k$ 顶点 ⇒ $\dim K=k-1$；经单纯同调与奇异同调的识别（Hatcher 2.27）考虑 $f_*[\mathbb P(V)]\in H_{k-1}(|K|)$。逐字构造："The interior point $\widetilde r$ of the facet $I$ has a neighborhood in $|K|$ contained in that facet. Passing to $H_{k-1}(|K|,|K|\setminus\{\widetilde r\})$ reads the coefficient of $I$ in a simplicial top cycle."

[补] 链条展开：$f$ 映入 $|K|$（$S(x)\in K$、坐标非负和 1 ⇒ $f(x)\in|\Delta_{S(x)}|\subseteq|K|$）。$\tilde r$ 是面 $I$ 的开单形内点；若其它面 $I'$ 的邻域也含 $\tilde r$ 附近点，则 $I\subseteq I'$，与 $I$ 极大矛盾 ⇒ 邻域含于 $I$。相对群 $H_{k-1}(|K|,|K|\setminus\{\tilde r\})\cong\mathbb F_2$ 的像是 $\langle I\rangle$ 的系数 mod 2；正则性 + Lemma 4.2 + (4.14) ⇒ 系数为 1。每个面同理 ⇒ $f_*[\mathbb P(V)]$ 由全部面之和表示；$(k-1)$-复形无 $k$-链 ⇒ 该表示是顶类 ⇒ 边界为 0 ⇒ 每个 $(k-2)$-面在偶数个 facet 中；再引 4.1 的边论断（每对标签是边）与"positive"（每面本身就是某 $S(x)$、至少出现一次）。陈述四件套全部到账：完备边、面大小 $k$、和是循环、脊在正偶数个面中。

**(c) 机械理由汇总**（素材 2.10(c)）：$k\ge3$（Prop 4.1 用于 $x_0^\perp$ 需 $k-1\ge2$；SW 段商丛维数才非平凡）；$m=N_k$（否则 degree 无定义）；$\lambda\in(0,1)$（双块非零 ⇒ full-support ⇒ 非异 ⇒ 局部坐标合法）；负卦限 $g$（逼 $B<0$ ⇒ $G$ 光滑可用）；$h=N_{k-1}$、$a=|J|$、$s=|I|$ 互锁，$s=k$ 时刻 $L$ 零维（系数段前提）；$u^h=0$ 与 $a>h$ 的严格不等号；Sard 用两次（$r$、$g$），都是"构造一个正则值"，并非全局调用。

**Lean 对应（整节映射）** [Lean]：第 0 段 ↔ `Support/` 面大小界链（`face_size_le_four`、`support_dim_bound` 型）；第 1-2 段 ↔ `Support/LocalMix.lean`、`BalancedChart`、`Chambers` 一族（仿射卡与室结构）；第 3 段奇数 ↔ `LocalParity/MatrixParity.lean` `regular_facet_level_odd`（经 `TracePatchModels`，即三角雅可比的实现化）；第 4 段偶数 ↔ `LocalParity/SphereParity.lean` `regular_facet_level_even`（`SphereNullPatch`）；对撞 ↔ `LocalParity/NoFreeRidge.lean`（63 行，`zero_ne_one`）；SW 段 ↔ `Projectors/ChartSurgery.lean`（122 行）`chart_surgery_impossible`；纯性 ↔ `Support/Purity*.lean`（Purity/PurityChart/PurityGeometry 三文件 280 行）；$G_x$ 连续性 ↔ `SphereGeometry/` 与 `MatrixGeometry/` 的延拓链（12 节）。全节人证拓扑在 Lean 里约 4,060（Simplicial）+ 2,272（MatrixGeometry）+ 1,857（Support）+ 1,217（LocalParity）+ 885（SphereGeometry）行支撑，组合段则整段让位给穷举机，见 29 节。

## 22 定义 5.1 与引理 5.2：六标签三角系从 $\mathbb{RP}^2$ 的等号情形里长出来

**(a) 定义**（six-labels.tex 第 1-38 行，逐字）：

> A \emph{six-label triangle system} on a set $C$ of cardinality six is a collection $\mathcal T\subseteq\binom{C}{3}$ such that
> \begin{enumerate}
> \item exactly one of $T$ and $C\setminus T$ belongs to $\mathcal T$ for each $T\in\binom{C}{3}$;
> \item every pair of elements of $C$ belongs to exactly two members of $\mathcal T$.
> \end{enumerate}

节首两句（T24+T25，逐字）："We call a face with three vertices a \emph{triangle}, and a face with four vertices a \emph{tetrahedron}. These names refer to faces of the support complex, not to geometric simplices in projective space." 和 "Our eventual application is to the six labels complementary to a tetrahedral facet of the ten-label support complex." 前者防术语混淆（第二次行使"非几何单纯形"排他，同 T8/T16 一脉），后者预告本节对十标签节的从属地位，防"凭空定义游戏"之讥。

引理 5.2（typst 12，逐字）："The triangles of the support complex of an admissible map $f:\mathbb{RP}^2\to\Delta^5$ form a six-label triangle system."

**(b) 推导补全**，四步。①Thm 4.3 在 $k=3,m=N_3=6$ 给：$K$ pure 2 维、全 15 条边、每边在正偶数个三角形中、面和是循环。②互补对排除（逐字）："Two complementary triples cannot both be triangles: choose witness lines $x,y\subset\mathbb R^3$ whose supports contain the respective triples. A line perpendicular to both exists and, by admissibility, could use none of the six labels." [补] 共同正交补 $(\mathbb Rx+\mathbb Ry)^\perp$ 维数 $\ge3-2=1$，取其中一线 $z$；$z\perp x,y$ ⇒ $S(z)$ 与 $S(x),S(y)$ 都不交，而 $S(x)\cup S(y)\supseteq T\cup(C\setminus T)=C$ ⇒ $S(z)=\varnothing$，与 $\sum f_i(z)=1$ 矛盾。③计数：$\binom63=20$ 个三元组配成 10 个互补对 ⇒ 三角形数 $\le10$；双面关联计数 $2\cdot15/3=10$ 给三角形数 $\ge10$（每边 $\ge2$ 面、每面 3 边）。④夹逼 ⇒ 每互补对恰一个、每边恰 2 三角形，公理 1、2 成立。

**(c) 机械理由**："恰 2"来自"正偶数 + $\ge2$ 且被总量 $\le10$ 钉死"；若 Thm 4.3 只给"偶数"无正性，$\ge$ 计数失效，纯性同样承重。三个 10 的相遇（互补对数 10、关联数 $2\cdot15/3=10$、$|\binom C3|/2=10$）是这套组合恰好闭合的核心算术，任何一边再大即矛盾，这解释了公理化把约束取为"恰 2"，"偶数"这个更弱版本给不出同样的钉死力。$N_3=6$ 恰是 $\mathbb{RP}^2\to\Delta^5$ 的等号情形：本节是 Thm 4.3 的最小实例，之后作为十标签四面体补集上的局部结构复用。

**Lean 对应** [Lean]：无独立六标签模块；`TenLabels/Labels.lean`（全目录仅 1 文件 140 行）的 `TenSystem` 六字段公理化把定义 5.1(1)(2) 吸收进十元系统（`complementary`、`pair_count`），引理 5.2 的"从映射导出"步骤对应 `Admissible.support_ten_system` 一次性给出全部组合公理，不分六/十两级。

**(d) [推测] 失败路线**。(1) [措辞] T24 暗示草稿曾用几何三角形状叙述，而 $\mathbb{RP}^2$ 里没有与标签对得上的直线三角形。(2) [推测] 不等号夹逼失败、改为直接构造 $\mathcal T$：$S(2,3,6)$ 型 Steiner 三元系不存在，$\lambda=2$ 的 BIBD 参数 $b=10,r=4$ 存在但加上互补性后唯一化为 5-圈结构；枚举可行（$2^{20}$ 剪到 $2^{10}$）但不可读，论文选"从映射自动存在"。(3) [推测] 统一引理化共同正交线论证：5.2②（$\mathbb R^3$ 两线，余量 1）与 6.1④（$\mathbb R^4$ 三线，余量 0）是同一机件按维数复用，论文分两处各写一遍（ten-labels 第 26-29 行重述），合并尝试被正交组大小差异挡住。

## 23 引理 5.3：三角系的四条刚性

**(a) 陈述**（six-labels.tex 第 40-99 行 + Figure `fig:six-label-paths`，逐字）：

> Let $\mathcal T$ be a six-label triangle system on $C$.
> \begin{enumerate}
> \item Every vertex link is a cycle of length five.
> \item Every four-element subset of $C$ contains a triangle, but does not contain all four of its triples as triangles.
> \item If $a,b\in C$ are distinct and $R\subset C\setminus\{a,b\}$ has cardinality three, the link graphs at $a$ and $b$, restricted to $R$, are different. In particular, no transposition of two labels preserves $\mathcal T$.
> \item The triangles contained in any five-element subset of $C$ determine $\mathcal T$ uniquely.
> \end{enumerate}

link graph 定义逐字："its \emph{link graph at $a$} has vertex set $C\setminus\{a\}$ and an edge $\{u,v\}$ precisely when $\{a,u,v\}\in\mathcal T$."

**(b) 推导补全**。(1) link 中顶点 $u$ 的度 = 含 $\{a,u\}$ 的三角形数 = 2（公理 2）；2-正则简单图是不交圈并，5 个顶点只能成单一 5-圈（$3+2$、$4+1$ 分解都违反每点度 2）。(2) 逐字引论文的 $\alpha(C_5)$ 论证："A five-cycle has no independent set of size three: if three vertices were independent, the three gaps following them around the cycle would each contain another vertex, requiring at least six vertices." 于是四元集 $A\setminus\{a\}$ 三点在 link 中有边 ⇒ $A$ 含三角形；若 $A$ 的 4 个三元组全是三角形，link 含 3-圈，而 $C_5$ 围长 5，矛盾 [补：4 个三元组对应 $a$ 遍历 $A$ 的四种删一点]。(3) 记 $C=\{a,b,c,d,e,f\}$，含 $\{a,b\}$ 的恰两个三角形为 $\{a,b,c\},\{a,b,d\}$。$a$ 的 5-圈删 $b$：剩 $\{c,d,e,f\}$ 上的路，端点 $c,d$、中间边 $\{e,f\}$，另两边是匹配 $M_1=\{\{c,e\},\{d,f\}\}$ 或 $M_2=\{\{c,f\},\{d,e\}\}$；$b$ 的 link 删 $a$ 得同端点同中间边的另一条路。逐字："if the first uses $M_1$, the triangles $\{a,c,e\}$ and $\{a,d,f\}$ exclude their complementary triples $\{b,d,f\}$ and $\{b,c,e\}$, forcing the second path to use $M_2$." 两路对称差是 4-圈 $\{c,e,d,f\}$，其中任 3 顶点仍含边 ⇒ 限制到任意 3 元 $R$ 两图不同；换位数 $(a\ b)$ 若保持 $\mathcal T$ 则两 link 限制相同，矛盾。(4) 五元子集 $C\setminus\{z\}$ 决定全系统：含 $z$ 的三元组 $T$ 由互补 $C\setminus T$（落在五元集内）经公理 1 读回。图注（T30，逐字要点）："The complementary-triple rule forces opposite matchings… share the edge $\{e,f\}$ and use opposite matchings between $\{c,d\}$ and $\{e,f\}$ (shown in blue). …The crossing in (c) is not a vertex." 末句是防误读：平面图交叉非顶点。

**(c) 机械理由**：5 = $6-1$（link 顶点数）是四条性质的共振点：无独立 3-集恰好支撑性质 2 前半，无 3-圈恰好支撑后半，删点成 4-点路（端点 + 中间边 + 匹配二择）恰好支撑性质 3 的匹配对论证。标签数若为 7（$C_6$ 有独立 3-集），性质 2 失效，"六"不能再少也不能再加。"$|R|=3$ 限制"，并非整图比较是最小够用口径：6.2 只消费限制版本。

**Lean 对应** [Lean]：性质 (2)(3)(4) 不作为 Lean 引理出现，被 `FiniteCases` 穷举整体吸收（机器验证"无十元系统"时不需要人手四性质）。

**(d) [推测] 失败路线**。(1) [措辞] 性质 3 把"无换位保 $\mathcal T$"写成后置 "In particular"，主干是限制版本：提示 6.2 真正消费的是"link 限制到 $R$ 不同"，全局换位数陈述只是 corollary 化。(2) [推测] 枚举验证四性质可行但不可读，Lean 反向选了枚举精神（FiniteCases 是十标签版），两版风格对照本身就是证据。(3) [措辞] 图注 "Panel (a) shows one complementary pair for this choice."：完整画图呈冗余、匹配对偶只有 $M_1/M_2$ 二选一（同构唯一），佐证性质 3 的两情形可合一处理。

## 24 引理 6.1 与 6.2：补集系统与"每三角形恰两个四面体"

**(a) 节首框架句**（ten-labels.tex 第 1-67 行，T26，逐字）：

> We prove that an admissible map $\mathbb{RP}^3\to\Delta^9$ cannot exist. Its support complex would have tetrahedral facets. Each facet forces a six-label triangle system on its complement; transporting these systems between adjacent facets will constrain the whole complex.

引理 6.1（typst 14）逐字：

> Suppose $f:\mathbb{RP}^3\to\Delta^9$ is admissible, let $K$ be its support complex, and let $S$ be a tetrahedron of $K$. The triangles of $K$ contained in the six-element set $C=[10]\setminus S$ form a six-label triangle system. In particular, two tetrahedra of $K$ cannot be disjoint.

引理 6.2（typst 15）逐字："Every triangle of $K$ belongs to exactly two tetrahedra." 其间过渡句（ten-labels:36，T27，全文最重要的方法论边界）："The rest of the proof is purely combinatorial."

**(b) 推导补全（6.1）**。①Thm 4.3（$k=4,m=10$）：$K$ pure 3 维、全边、面和循环、每三角形在正偶数个四面体中。②见证线 $x$（$S(x)=S$）限制到 $\mathbb P(x^\perp)\cong\mathbb{RP}^2$ 只用 $C$ 标签；逐字："It uses all six: otherwise the lower bound in Proposition 4.1, applied in dimension three, would be violated."（$<6=N_3$ 标签撑不起 $\mathbb{RP}^2$ 的可容许映射）。③引理 5.2 给限制系统的三角形构成六标签三角系。④无额外三角形：若互补对 $T,C\setminus T$ 都是 $K$ 的三角形，取 $S,T,C\setminus T$ 的见证线三条，逐字 "In $\mathbb R^4$ there is a line perpendicular to all three"（三线张成 $\le3$ 维，正交补 $\ge1$ 维 [补：与 5.2②同机件，余量从 1 降到 1，恰够]），该线支集避开 $S\cup T\cup(C\setminus T)=[10]$ 全部 ⇒ 空支集矛盾。⑤不交四面体排除：若 $S'\subseteq C$，其 4 个三元组全是三角形，违反 5.3(2) 后半。

**(c) 续（6.2）**。先建换位不变性引理：若两面差一个换位 $(a\ b)$（$S=(S'\setminus\{b\})\cup\{a\}$ 型），则 $(a\ b)$ 把 $S$ 的补系载到 $S'$ 的补系：共享 5 个标签上两系统都等于"$K$ 在其上的三角形"，由 5.3(4)（五元决定系统）得全域一致。再三四面体排除：设 $T\cup\{a\},T\cup\{b\},T\cup\{c\}$ 共含三角形 $T$，$R=[10]\setminus(T\cup\{a,b,c\})$（$|R|=10-3-3=4$ [补]），相继输运

> \[
>  R\cup\{b,c\}\xrightarrow{(a\ b)}R\cup\{a,c\}\xrightarrow{(b\ c)}R\cup\{a,b\}\xrightarrow{(c\ a)}R\cup\{b,c\}
> \]

逐字："preserves the initial system. The composite fixes $R$ and exchanges $b$ and $c$, contradicting Lemma 5.3(3)." [补] 净置换 $\sigma=(a\ b)\circ(b\ c)\circ(c\ a)$（右起先作用）：$\sigma(a)=a$、$\sigma(b)=c$、$\sigma(c)=b$，即 $\sigma=(b\ c)$；直觉上按"作用在当前位置标签"顺序算会误得 3-循环，关键是把每个换位看作补集命名空间的映射、右起复合。三步都是沿共三角形 $T$ 的相邻面输运、系统不变；净效果 $(b\ c)$ 保持 $S$ 补系，取 $R$ 中任一三元 $\{r,s,t\}$，link($b$) 与 link($c$) 限制到其上必须不同（5.3(3)），矛盾。故每三角形 $\le2$ 个四面体；Thm 4.3 的"正偶数"钉死恰 2。

**(c) 机械理由**：$|R|=4$ 让链条中每个"补集"恰为六元 $R\cup\{两标签\}$，正是六标签系统的舞台；三置换复合恰为一个换位是精算结果（两步则得 3-循环，5.3(3) 不禁 3-循环，只禁换位）。"恰 2" = 偶数性 + $\le2$ 夹逼。6.1⑤ 用掉 5.3(2) 两半中的后半。

**Lean 对应** [Lean]：`no_disjoint_tetrahedra`、`face_extends_four`/`four_support_face`；换位输运不变性无独立引理，`TenSystem` 公理面直接消费 `pair_count`/`complementary`；引理 6.2 体现为 `TenSystem` 字段 + 前置归约 `relabel`（`Equiv.Perm.exists_map_finset_eq` 把固定四面体归一为 $\{0,1,2,3\}$）。

**(d) [推测] 失败路线**。(1) [措辞] 先建输运引理再用的两层结构提示：对 $K$ 全局枚举四面体邻接图不可行（$K$ 未知、四面体数未定），只能沿链局部输运。(2) [推测] 用"每三角形 $\ge2$"配全局计数（三角形 $\times3$ = 四面体 $\times4$）推整体矛盾：存在满足全部计数的抽象复形，纯计数不矛盾，必须输运刚性。(3) [证据：Lean] Lean 没有 6.2 的等价人证（机器穷举替代），说明此引理可读且可机器化，两版本并存是"人证 vs 机证"的分水岭。

## 25 引理 6.3 与 6.4：短链接与伙伴块，组合段的顶峰

**(a) 定义与陈述**（ten-labels.tex 第 69-175 行 + Figure `fig:partner-links`，逐字）：

> For an edge $D$ of $K$, define its \emph{link graph} to have as vertices the labels $v\notin D$ for which $D\cup\{v\}$ is a triangle, and as edges the pairs $\{v,w\}$ for which $D\cup\{v,w\}$ is a tetrahedron.

引理 6.3（typst 16）："Every connected component of an edge link is a cycle of length three or four." 引理 6.4（typst 17）：

> Fix a tetrahedron $S$ of $K$. For $v\in S$, let $p(v)$ be the unique label outside $S$ such that $(S\setminus\{v\})\cup\{p(v)\}$ is a tetrahedron. For each distinct value $y$ of $p$, set
> \[
>  B_y=p^{-1}(y)\cup\{y\}.
> \]
> The sets $B_y$ are disjoint and have at least two elements. For every choice $q_y\in B_y$, the set
> \[
>  \bigcup_{y\in p(S)}(B_y\setminus\{q_y\})
> \]
> is a tetrahedron. Moreover, every tetrahedron of $K$ contains at least two elements of one of these blocks.

动机句（ten-labels:105-108，T28，逐字）："The short links let us describe every facet obtained by repeatedly crossing a triangular face of one fixed tetrahedron. The description will produce enough facets to contradict the complementary triangle system."

**(b) 推导补全（6.3）**。link 顶点 $v$ 的度 = 含 $D\cup\{v\}$ 的四面体数 = 2（6.2）⇒ 每分支是简单圈。禁 5-路：设 $v_0..v_4$ 相继相邻，$R$ 为 $D\cup\{v_0..v_4\}$ 之外 3 标签（$10-2-5=3$ [补]）。四个四面体补系沿链输运（每步是差一换位的相邻两面，由 6.2 的换位不变性）：

> \[
>  R\cup\{v_2,v_3,v_4\}\xrightarrow{(v_0\ v_2)}R\cup\{v_0,v_3,v_4\}\xrightarrow{(v_1\ v_3)}R\cup\{v_0,v_1,v_4\}\xrightarrow{(v_2\ v_4)}R\cup\{v_0,v_1,v_2\}.
> \]

[补] 核算第一步：$(v_0\ v_2)$ 把 $\{v_2,v_3,v_4\}\mapsto\{v_0,v_3,v_4\}$ ✓，对应相邻对 $D\cup\{v_0,v_1\}$ 与 $D\cup\{v_2,v_1\}$ 共三角形 $D\cup\{v_1\}$，链条顺序与 link 的边一致。复合 $\tau=(v_2\ v_4)\circ(v_1\ v_3)\circ(v_0\ v_2)$（右起）：$v_4\mapsto v_2$、$v_2\mapsto v_0$、$v_0\mapsto v_4$、$v_1\leftrightarrow v_3$、$R$ 逐点不动；论文只消费 $\tau(v_4)=v_2$（逐字 "The composite fixes $R$ and sends $v_4$ to $v_2$"）。系统不变 ⇒ 首系与末系满足 $\{v_4,r,s\}\in\mathcal T_{\text{first}}\iff\{v_2,r,s\}\in\mathcal T_{\text{last}}$（每对 $r,s\in R$）；中间三元组 $\{v_2,r,s\}$ 同时属于首补与末补，逐字 "its membership in either system is simply its membership in $K$" ⇒ 首系中 $v_4$ 与 $v_2$ 的 link 限制到 $R$ 相同，违反 5.3(3)。长 $\ge5$ 圈含 5-路 ⇒ 组件长 $\le4$。

**(c) 续（6.4）**。伙伴存在唯一：$S\setminus\{v\}$ 是三角形，6.2 给恰两面，另一面即 $(S\setminus\{v\})\cup\{p(v)\}$，$p(v)\notin S$（否则回到 $S$）。块 $B_y=p^{-1}(y)\cup\{y\}$ 不交（不同 $y$ 的纤维不交）、$\ge2$ 元（纤维非空）。块交换不变性（核心）：置 $S'=(S\setminus\{v\})\cup\{a\}$、$a=p(v)$，新伙伴映射 $p'$；已得 $p'(a)=v$（对称性 [补]）。对 $w\in S\setminus\{v\}$，$D=S\setminus\{v,w\}$（边），$b=p(w)$，$D$-link 含三条边（逐字）"$\{v,w\},\{w,a\},\{v,b\}$" [补机制：分别由四面体 $S$、$S'$、$(S\setminus\{w\})\cup\{b\}$ 给出]。图注逐字（`fig:partner-links`）："The known edges $\{v,w\}$, $\{w,a\}$ and $\{v,b\}$ form a triangle when $a=b$. When $a\ne b$, they form a path on four vertices; the short-link condition forces the closing edge $\{a,b\}$ (dashed). In both cases $p'(a)=v$, and the blocks retain their elements." 情形 $a=b$：3-圈因每点度 2 即整分支 ⇒ $p'(w)=v$；情形 $a\ne b$：路 $a,w,v,b$ 四顶点，6.3 限组件 $\le4$、度 2 ⇒ 补边 $\{a,b\}$ 成 4-圈 ⇒ $p'(w)=b$。合并公式逐字：

> \[
>  p'(a)=v,\qquad p'(w)=\begin{cases} v,&p(w)=a,\\ p(w),&p(w)\ne a.\end{cases}
> \]

块不变验证 [按素材补]：$p'^{-1}(v)=\{a\}\cup\{w:p(w)=a\}$ ⇒ 新块 $B'_v=\{a,v\}\cup\{w:p(w)=a\}=B_a$（$a$ 仍在、$v$ 原本就在）；其余 $y\ne a$ 有 $p'^{-1}(y)=p^{-1}(y)$ ⇒ $B'_y=B_y$。删一构造全部四面体：$S$ 含每块除指标伙伴外的全部元素（$\bigcup_y(B_y\setminus\{q_y\})$ 型，基数 $\sum_y(|B_y|-1)=|S|=4$）；交换不变性使断言对链上任何四面体成立；"To change the omitted element of a block from $q$ to $u$, replace the present element $u$ by its partner $q$"，各块独立改动可交换 ⇒ 所有删选组合都是四面体。尾断言：反设四面体 $T$ 每块至多 1 元，则对每块含 $T$ 元删之、否则任删，所得 $T^*$ 与 $T$ 不交，违反 6.1。

**(c) 机械理由**：link 长度上限 $\le4$ 是两情形分诊的引擎：3-圈封闭（$a=b$）或 4-圈补边（$a\ne b$）之外无第三种；若允许 5-圈，路 $a,w,v,b$ 可延而不闭、$p'(w)$ 不定，块不变性崩溃。$|S|=4$ 进入 $\sum(|B_y|-1)=4$ 的账本。"删一即跨面"把几何（四面体邻接）翻成组合（选删函数），是 partner 构造的全部动机。

**Lean 对应** [Lean]：6.3/6.4 的对应整体被 `FiniteCases/` 机器搜索替代：`TenSystem` 六字段（`tetra_card/down/pure/no_boundary/complementary/pair_count`）中 `no_boundary`（每三角形至少二面 ≈ 6.2 单向）与 `pair_count` 承载夹逼前半，伙伴块结构在 Lean 中**不存在**，穷举 `no_ten_system`（约 4,095 条 c-引理）直接验证无模型；Figure 2/3 式论证在形式化里没有平行文本。

**(d) [推测] 失败路线**。(1) [措辞] 6.4 先证 $p'(a)=v$ 再对 $w$ 分诊、用 case-split 显式给公式：提示曾尝试统一叙述（"块关于某对合不变"式抽象命题）未果，两情形图论机制本就不同（3-圈用度闭合、4-圈用短链接）。(2) [推测] 不设块、直接跟踪单个伙伴 $p(v)$：跨面链上 $p^{-1}(y)$ 每次交换都重排，纤维不守恒；块是 $p$ 纤维的交换不变聚合，是长程输运能找到的唯一不变量类。(3) [证据：Lean] Lean 放弃一切不变量搜索改用穷举，侧面反映块构造的偶然性：人证里它是唯一想到的不变量，机证不需要不变量。(4) [措辞] 图注把两个 case 分开画（(a)(b) 面板），并非合并示意，佐证分诊不可约。

## 26 定理 6.5：十标签不可能性，全部账本收口

**(a) 陈述**（ten-labels.tex 第 177-216 行，typst 18，逐字）：

> There is no admissible map $\mathbb{RP}^3\to\Delta^9$.

**(b) 五段账本**。①固定四面体 $S$，$t=|\,$块数$|$，$R=[10]\setminus\bigcup_yB_y$。逐字："The blocks contain $4+t$ labels in total, so $1\le t\le4,\qquad |R|=6-t.$" [补] $\sum|B_y|=\sum(|B_y|-1)+t=4+t$；$|R|=10-(4+t)=6-t$；$t\ge1$ 因 $p$ 有值，$t\le4$ 因每块 $\ge2$ 元。②$t\ne4$：逐字 "If $t=4$, each block has size two and $S$ meets each in just one element, contradicting the last assertion of Lemma 6.4." ⇒ $t\le3$。③$R$ 内无三角形：逐字 "There is no triangle entirely in $R$. By purity, such a triangle would extend to a tetrahedron; its one remaining vertex could not supply two vertices in a block."（$R$ 三角形扩成的四面体每块 $\le1$ 元，违反 6.4 尾断言 [补]）。又 $R\subseteq[10]\setminus S$：若 $|R|\ge4$，$R$ 的四元子集含 $K$ 三角形（逐字依据是同时引 Lemmas 6.1 与 5.3(2)："every four labels contain a triangle"，且 6.1 排除额外三角形 ⇒ 该三角形属六系 ⊂ $K$ [补：漏掉 6.1 半步会留逻辑洞]），矛盾 ⇒ $|R|\le3$ ⇒ $t\ge3$。④钉死：$t=3$、$|R|=3$、块尺寸和 $=7$、三块各 $\ge2$ ⇒ 尺寸 $\{3,2,2\}$（唯一分拆 [补]）。Figure 4 图注逐字："The only remaining block sizes are $3,2,2$, with three labels in $R$ outside the blocks. Filled dots are the vertices of the fixed tetrahedron $S$; the omitted block elements are $q_1,q_2,q_3$."（图中 $S=\{u_1,u_2,v,w\}$、$[10]\setminus S=\{q_1,q_2,q_3,r,s,r_3\}$。）⑤终杀：取 $r,s\in R$。六系里 $\{r,s\}$ 恰在 2 个三角形（公理 2），第三顶点不能在 $R$（$R$ 无 $K$-三角形）⇒ 是两个不同删元 $q_1,q_2$。两块 2 元 ⇒ 某个 $\{r,s,z\}$ 的 $z$ 在 2 元块 $B=\{z,q\}$ 中。逐字终段：

> Every tetrahedron containing $\{r,s,z\}$ must contain two vertices of some block. As $r,s$ lie outside all blocks, its fourth vertex must be the other element of $B$. Thus this triangle belongs to at most one tetrahedron, contradicting Lemma 6.2.

图注末行逐字："After relabeling the two-element blocks, the final argument selects a triangle $\{r,s,q_2\}$ with $r,s\in R$. Its only possible tetrahedral extension is obtained by adjoining $v$, contradicting the two required extensions."

**(c) 机械理由**：全链条是"10"的算术：$10=4(S)+6(C)$、$6=3$ 删元 $+|R|=3$；$t=3$ 是②③双向夹逼唯一解，$\{3,2,2\}$ 是唯一分拆，终杀需要"2 元块 + 块外对"共存。若 $k>4$，四面体更大、账本参数全变，不必然矛盾：这就是"恰 9 维失败、更高维不自动"的组合落点（与第 5 节三重锁定呼应）。

**Lean 对应** [Lean]：定理层 `no_admissible_ten`：路线不走伙伴块，`Admissible.support_ten_system` 把可容许映射喂给 `TenSystem` 六公理，`FiniteCases` 145 文件机械证 `no_ten_system`（`relabel` 归约固定 $\{0,1,2,3\}$ 后穷举）。人证 25-26 节的全部组合推理在 Lean 中是一台搜索机；`Counterexample.lean` 里 `no_admissible_ten` 另有空面入口（见 29 节不一致清单第 2 条）。

**(d) [推测] 失败路线**。(1) [措辞] "After relabeling the two-element blocks" 一句吃掉块 2 的对换自由度：提示曾逐块区分 $B_2/B_3$、靠对称性归并。(2) [推测] ③ 若不用纯性扩张而直接数 $\{r,s\}$ 关联四面体，会漏"三角形属于 $K$"这一步（需 6.1 排除额外三角形）；论文特意同时引 6.1 与 5.3(2)，说明此处踩过坑。(3) [证据：Lean] 穷举在④之前就否决所有模型、不产生 $t$/块尺寸信息：人证账本承担的是逻辑上不需要它也能走通的部分，其价值在可读性，是最短概念路径 [推测]。

## 27 定理 1.1 的收尾证明：四句话的组装

**(a) 原文**（conclusion.tex 第 1-13 行，逐字）：

> All ingredients now apply to the projector set in Theorem~\ref{thm:main}.
> \begin{proof}[Proof of Theorem~\ref{thm:main}]
> Lemma~\ref{lem:projector-geometry}, with $k=4$, proves compactness and
> identifies the trace-one affine space with Euclidean $\mathbb R^9$.
> It also gives the exact diameter $\sqrt2$. If ten subsets of strictly
> smaller diameter covered $X$, Lemma~\ref{lem:cover-to-map} would supply
> an admissible map $\mathbb{RP}^3\to\Delta^9$. This contradicts
> Theorem~\ref{thm:no-ten-labels}.
> \end{proof}

**(b) 组装复盘**：覆盖 $\{U_1..U_{10}\}$、$\operatorname{diam}U_i<\sqrt2$ ⇒（2.4，间隙 $(\sqrt2-d_i)/4$）可容许 $f:\mathbb{RP}^3\to\Delta^9$ ⇒（6.5）不存在 ⇒ $b(X)\ge11$。论文的谨慎在量化词上：只断言"不能 10 覆盖"，从未说 $b(X)=11$；上界需显式 11-覆盖，文本未给 [措辞：intro "we do not determine the exact value"]。$k=4$ 的唯一注入点：$N_4=10=d+1$、trace-one 切片 9 维、$X$ 紧供 2.4 的单位分解。

**(d) [推测] 失败路线**。(1) [措辞] 证明仅四句、全部难度前移；若曾尝试直接对 $X$ 构造覆盖矛盾（跳过 $f$），失败点正是 $X$ 无边界面结构、颜色类无刚性，即 T13 警告的内容。(2) [推测] 反证后直接取最优覆盖（紧集上半径可取到）：最优覆盖的类仍无光滑性，ε 间隙化是必需缓冲，论文没有走这条捷径。

## 28 推论 7.1：一次性加满所有新点的高维搬运

**(a) 陈述**：见第 3 节逐字（Corollary 7.1）。**(a') 动机段**（conclusion.tex 第 15-20 行，T29，逐字）：

> The spherical geometry of this witness also gives counterexamples in
> all higher dimensions. We use the familiar construction of adjoining
> points at diameter distance; see
> \cite[Lemma~9]{HinrichsRichter2003} and
> \cite[proof of Corollary~1]{Bondarenko2014}. The following Gram-matrix
> description adds all the new points at once.

**(b) 构造与账目**。①平移 $Y=\{P_x-\tfrac14I\}$ 入 9 维迹零空间（Remark 2.2 的 $\operatorname{Sym}_4/\mathbb RI$ 平移版）。逐字："Every $y\in Y$ has $\|y\|_F^2=3/4$." [补] $\|P-\frac14I\|_F^2=\operatorname{tr}(P^2-\frac12P+\frac1{16}I)=1-\frac12+\frac14=\frac34$ ✓。平移不改两两距离 ⇒ $\operatorname{diam}Y=\sqrt2$、$b(Y)\ge11$。②新点：$\mathbb R^s$ 中 $v_1..v_s$，Gram 矩阵 $I_s+\tfrac14\mathbf1\mathbf1^{\mathsf T}$。正定：$\mathbf x^{\mathsf T}(\cdot)\mathbf x=\|\mathbf x\|^2+\frac14(\sum x_i)^2>0$（非零 $\mathbf x$）[补] ⇒ 谱分解实现向量。逐字性质："They satisfy $\|v_i\|^2=5/4$ and $\|v_i-v_j\|^2=2$ for $i\ne j$." [补] 对角元 $1+\frac14=\frac54$；$\|v_i-v_j\|^2=\frac54+\frac54-2\cdot\frac14=2$（非对角 Gram 元 $=\frac14$）。③$Z=(Y\times\{0\})\cup\{(0,v_i)\}\subset\mathbb R^9\oplus\mathbb R^s$，$d=9+s$：新↔旧 $\sqrt{\frac34+\frac54}=\sqrt2$；新↔新 $\sqrt2$；旧↔旧 $\le\sqrt2$ ⇒ $\operatorname{diam}Z=\sqrt2$，每个新点与一切点都在直径距离处（刚性对）。紧：$Y$ 紧并有限点。④覆盖账目（逐字）："A subset of $Z$ of strictly smaller diameter containing a new point can contain neither a second new point nor a point of $Y\times\{0\}$."（否则该对距离 $=\sqrt2$、直径不严格小 [补]）；"Thus a cover of $Z$ by at most $d+1=10+s$ such subsets would leave at most ten subsets to cover $Y\times\{0\}$."（$s$ 个新点各占独立集 ⇒ 剩 $\le10$ 集覆盖 $Y$ ⇒ 违反 9 维定理。）

**(c) 机械理由**：$\frac14=\frac1k$ 是迹零平移 $P-\frac1kI$ 的唯一选择；$\frac34=\frac{k-1}k$、$\frac54=1+\frac14$、$\|v_i-v_j\|^2=2=\operatorname{diam}^2$ 全部由 $\operatorname{diam}X=\sqrt2$ 反向钉死。秩一扰动的关键算术：$\|v_i-v_j\|^2=2(\langle v_i,v_i\rangle-\langle v_i,v_j\rangle)=2(\frac54-\frac14)=2$，对角/非对角落差恒为 1，任意 $s$ 同时成立 [补]：这就是 "adds all the new points at once" 的机件。$s\ge1$ 任意 ⇒ 全 $d\ge9$ 失败。

**Lean 对应** [Lean]：**未形式化**。`Counterexample.lean` 只证 9 维（`main_theorem`/`euclidean_nine_counterexample`），高维推广、Gram 构造、$s$ 参数在 269 个文件里无踪迹。

**(d) [推测] 失败路线**。(1) [措辞] "familiar construction" 的让渡 + 差异化：曾想直接引他人的推广结论（Hinrichs-Richter Lemma 9、Bondarenko Corollary 1），但他们口径下直径常数归一不同、且需逐点迭代，条件对不上，改为自给的一次性版本。(2) [推测] 旧路线"加一点升一维"迭代 $s$ 次：每步重验正定与直径不增，归纳簿记冗长；Gram 版单步完成，"at once" 本身就是差异声明。(3) [推测] 用单纯形型新点集：新点互距与到 $Y$ 距离无法同时锁 $\sqrt2$（需 $\|v_i\|^2$ 与 $\langle v_i,v_j\rangle$ 精确耦合），秩一 Gram 是唯一解。

## 29 Lean 形式化取证

素材 §四 的账目我按取证笔记的口径搬过来，供后文审计比对。

**目录与行数**（`E:/math/lean/OAI/Geometry/Borsuk/`，共 269 文件 / 78,964 行）。根目录 3 文件：Counterexample.lean 60、Main.lean 131、Model.lean 27。模块（文件数/行数）：Projectors 18/1,871；Simplicial 34/4,060；SphereGeometry 9/885；MatrixGeometry 26/2,272；LocalParity 13/1,217；Support 18/1,857；SmithTheory 2/147；TenLabels 1/140；FiniteCases 145/66,297。总和 $218+1871+4060+885+2272+1217+1857+147+140+66297=78964$ ✓。逐文件行数清单在素材 4.1 全量保留（非 FiniteCases 124 文件各 52-217 行；FiniteCases 的 Cases001-144 每文件 432-599 行、Cases145 为 98 行收尾归约器；Cases076 起行数爬升对应搜索树深度增长）。依赖拓扑 [Lean]：Cases001 仅 import `TenLabels.Labels`，Case$i$（$i\ge2$）import Case$i-1$，线性 DAG；搜索体每文件约 50 个编号引理，c3…c32921 共约 4,095 条。

**主定理壳**（Counterexample.lean 49-56 行，逐字）：

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

**比较器**（`ComparatorChallenges/BorsukNine.json` 字段）：`challenge_module="ComparatorChallenges.BorsukNine"`、`solution_module="OAI.Geometry.Borsuk.Main"`、`theorem_names=["OAI.BorsukNine.main_theorem"]`、`definition_names=[]`、`permitted_axioms=["propext","Quot.sound","Classical.choice"]`、`enable_nanoda=false`。`BorsukNine.lean` 是 34 行模板（ambient 用 `EuclideanSpace ℝ (Fin 4 × Fin 4)` 的 `WithLp 2`），`main_theorem` 以 `sorry` 结尾待解。`HasTenSmallCover` 逐字：

```lean
def HasTenSmallCover : Prop :=
  ∃ C : Fin 10 → Set Matrix4,
    (∀ i, C i ⊆ projectorSet) ∧
    projectorSet ⊆ ⋃ i, C i ∧
    ∀ i, Metric.diam (C i) < Real.sqrt 2
```

`formalization.yaml` 两处登记：117-120 行书目条目（title "A nine-dimensional counterexample to Borsuk's covering assertion"、authors ["OpenAI"]、type article）；970-972 行 `comparator_config: ComparatorChallenges/BorsukNine.json`、`declaration: OAI.BorsukNine.main_theorem`、`file: OAI/Geometry/Borsuk/Counterexample.lean`。口径差一处：json 的 solution_module 写 Main、yaml 的 file 写 Counterexample（Main import Counterexample 故声明可达），属登记口径，并非矛盾 [事实]。

**MainClaim 与论文的差距（有限化/可判定化视角）**：(i) 覆盖量词未做闭包/多面体有限化，`HasTenSmallCover` 允许任意 `Set Matrix4`，不可覆盖性完全走解析桥 `cover_to_admissible`，不依赖机器算术。(ii) 组合部分才有限化：`TenLabels/Labels.lean` 的 `TenSystem (T Q : Family)`（`Labels := Fin 10`）六字段 `tetra_card/down/pure/no_boundary/complementary/pair_count`，只含六标签两律 + 十标签存在性/互补性，论文 5.3(2)(3)(4) 与 6.3/6.4 不作为引理、被穷举 `no_ten_system` 整体替代。(iii) `Admissible.support_ten_system`（Counterexample.lean 11-41 行）是人证 Thm 4.3 ⇒ 组合结构的接口，六个 constructor 消费 `hf.face_extends_four`、`hf.tetra_no_free_triangle`、`hf.facet_six_properties`，方法名即论文 6.2 与 5.2/6.1 的对应体。(iv) `no_admissible_ten`（43-47 行）用 `SupportFace f ∅` + 见证 `EuclideanSpace.single 0 1` 造四面体入口，是论文没有的路线 [事实：代码如此；语义存疑，见下]。

**映射总表**（论文条目 ↔ Lean，素材 4.3 全量搬入，逐行）：Lemma 2.1 ↔ `Projectors/Basic` 距离/直径/紧性引理族；Remark 2.2 ↔ `Main.lean` coordinates9 链；Def 2.3 ↔ `Admissible` 五字段 + `SupportFace` + `positiveSupport`；Lemma 2.4 ↔ `cover_to_admissible`（Lean 独有反向 `admissible_to_cover`、`cover_iff_admissible`）；Lemma 3.1 ↔ SphereGeometry 四文件（`HomogeneousLift`、`IntegralLift`、`SphereMeasure`、`SphereMoments`）；Lemma 3.2 ↔ `SignedExtension`、`SpectralSupport`、`BlockParts/BlockVector`、`MatrixKernel`、`sphereExtension_odd/norm/continuousOn`；norm-sphere 段 ↔ `NormSphere.lean`（欧氏球面替代口径）；Prop 4.1 ↔ Simplicial 五文件 + SmithTheory + `Support/AllPairs`；Lemma 4.2 ↔ LocalParity 的 patch-model 双文件；Thm 4.3 ↔ `regular_facet_level_odd` × `regular_facet_level_even` → `NoFreeRidge.zero_ne_one`，SW 段 ↔ `chart_surgery_impossible`，纯性 ↔ `Support/Purity*`；Def 5.1/Lem 5.2/5.3 ↔ 无独立层（并入 `facet_six_properties` 与 `TenSystem`）；Lem 6.1/6.2 ↔ `tetra_no_free_triangle`、`face_extends_four`、`TenPure.lean`；Lem 6.3/6.4/Thm 6.5 ↔ **人证独有**，Lean = `no_fixed_ten_system`（固定 $\{0,1,2,3\}$ 穷举）+ `no_ten_system`（`h.relabel e` 归约，Cases145 88-94 行）；Thm 1.1 ↔ `main_theorem`；Cor 7.1 ↔ 未形式化。

**Lean 独有 / 未形式化 / 不一致清单**（素材 4.4）。独有：(1) `Admissible.antipodal`（$\mathbb R^4$ 上 ContDiff∞ 偶函数实现 $\mathbb{RP}^3$ 映射）；(2) `admissible_to_cover`/`cover_iff_admissible` 反向（阈值固定 1/10）；(3) `euclidean_nine_counterexample`（Remark 2.2 定量化）；(4) `CompactTargetHits`/`FiniteClosedCutoffs`/`FiniteSmoothSliceMisses` 等紧集直径缺口工具（`compact_diam_lt` 经 `exists_isMaxOn`）；(5) `Simplicial/` 整条交叉复形 + Smith 理论机器（Hatcher 2B.6/2B.7 在 Mathlib 无对应，从零重建 4,060+147 行）。未形式化：Cor 7.1 与一切 $d\ge9$ 叙述；$b(X)$ 精确值；Walkup/Arnoux-Marin 语境；Stiefel-Whitney 演算（被 patch-parity + chart_surgery 替换）；全部图形与叙述内容。不一致/口径差：(1) 论文的 $\varepsilon_i=(\sqrt2-d_i)/4$ 弹性族 vs Lean 固定 1/10 阈值（Lean 版丢间隙大小信息）；(2) `no_admissible_ten` 的空面入口与论文"取任意极大面"路线不同，`SupportFace f ∅` 的 witness 语义（"单点支集"还是字面空支集）素材标记**存疑**，需逐字复核 `SupportFace` 定义 [事实：两种入口不同；笔记保留存疑]；(3) Thm 4.3 的"和是循环/系数为 1"化整为局部陈述，全局循环语言不出现；(4) json/yaml 模块路径差；(5) "恰二"在 Lean 退化为 `no_boundary`"至少二"+ 整体无模型，机器不需要夹逼；(6) $\Sigma(V)$ 不作为对象定义，欧氏球面 + `sphereExtension_norm` 恒等式携带（28 节 14 段的口径转换）。**许可公理**：propext、Quot.sound、Classical.choice（与 Mathlib 默认三件套一致；`Counterexample.lean` 顶部 `attribute [local instance] Classical.propDecidable` + `classical` 战术全落在 Classical.choice 内）；`enable_nanoda: false` 表明不依赖外部数值验证库，整条 Lean 证明无浮点/区间算术，组合穷举是纯离散判定 [事实]。

## 30 常数与参数总表：每一行补一句"动了会坏在哪"

素材 §五 全表照录，末列是我按审计要求补的"动了会坏在哪"。

| 符号/数值 | 定义处 | 被使用的性质 | 临界性 | 富余量 | 动了会坏在哪 |
|---|---|---|---|---|---|
| $k=4$ | intro | $\mathbb{RP}^3$、$\operatorname{Sym}_4$、$N_4=10$ | $N_k=\binom{k+1}{2}$ 与 $d+1=N_k$、$d=N_k-1$ 联立 ⇒ 目标维 9；组合矛盾需 $\lvert S\rvert=k=4$ 的块账本 | $k\ge4$ 机件通用，但穷举仅在 $k=4$ 可行 | 改 $k=3$ 则三级账本在六标签处相容、撞不出矛盾；改 $k\ge5$ 则 $d\ge14$ 且 26 节的 $t$/块分拆不再唯一，穷举也失去可行性 |
| $d=9$ | Thm 1.1 | $N_4-1$ | 同上联立唯一解 | 无 | 改任何 $d$ 使 $d+1\ne N_k$，等号刚性（Thm 4.3）整个失效 |
| $m=N_4=10$ | Def 2.3 | 标签数 $=d+1$ | Prop 4.1 等号情形才有刚性；$m>10$ 无约束 | 无（恰等号是全部论证前提） | 给 11 块则奇映射降维、degree 无从谈起，全文第一刀（否决 $m\ge N_k$ 的等号）落空 |
| $N_k=k(k+1)/2$；$N_2=3$；$N_3=6$ | Prop 4.1 | 下界链 | $N_k-N_{k-1}=k$ 是 (4.3) 引擎；$N_2=3$ 为底 | 无 | 底值 $N_2=3$ 若变，15 节"2 标签撑不起 $\mathbb{RP}^1$"与 24 节"6 标签全用"两处同时断 |
| $\sqrt2$ | Lemma 2.1 | $\operatorname{diam}X$ | $\sqrt{2-2\cos^2\theta}$ 于 $\theta=\pi/2$；归一 $\operatorname{tr}A=1$ 钉死 | 无 | 换归一（如 CHS 弦距 $\times1/\sqrt2$）常数全体重标，2.4 的间隙算术与 28 节的 $3/4,5/4$ 连锁改 |
| $\lVert P_x-P_y\rVert_F^2=2-2\langle u,v\rangle^2$ | 2.1 | 距离↔夹角刻画 | 直径对 ⟺ 正交对 ⟺ 支集不交的桥 | 无 | 距离一旦依赖夹角以外信息，"块内无正交对"翻译失效，(A) 桥断 |
| $\varepsilon_i=(\sqrt2-d_i)/4$；$\operatorname{diam}\bar U_i\le(d_i+\sqrt2)/2$ | Lemma 2.4 | 严格间隙化 | 四等分：邻域半径与闭包膨胀各占一份、留两份保险 | 2× | 取 $1/2$ 则正交对检验退化为 $\le\sqrt2$、矛盾消失（11 节 (d)(3)）；取 $1/1$ 闭包处爆 |
| $1/10$（仅 Lean） | `admissible_to_cover` | 反向构造 | 任意 $<\sqrt2$ 常数均可，取小者简化 | 大 | 换任何 $\le 1/10$ 的阈值仍成立；它是鸽笼平均值，动它不伤数学只伤代码 |
| $h=N_{k-1}=6$ | Thm 4.3 | 纤维球面维数 $h-1$；$u^h=0$ | $a>h\Rightarrow a-1\ge h$ 使 $\operatorname{pr}_2^*(u^{a-1})=0$；$a=h$ 论证熄火 | 0（临界即结论） | $h$ 若与 $a$ 脱钩，20 节的"幂零指数杀顶类"不再与 $L$ 维数二分同步 |
| $s=\lvert I\rvert\le k$、$a=\lvert J\rvert\ge h$ | (4.3) | 面大小上界 | $s\le N_k-N_{k-1}=k$ | 无 | 放宽上界则 18 节 $\dim L=k-s$ 可为负，分诊失去意义 |
| $\dim L=(k-1)-(s-1)=k-s=a-h$ | (4.4) | 正维/零维分诊 | $s<k\Rightarrow\dim L>0$（SW 矛盾）；$s=k\Rightarrow L$ 有限（系数） | 无 | 维数等式任何一环改动，19-21 节"奇数、偶数、系数"三步全部错位 |
| $\lambda\in(0,1)$ | (4.5)-(4.8) | 双块 full-support 拼接 | 开区间⇒两半非零⇒$A$ 非异；质量守恒使第一雅可比块 $=$ 恒等 | 结论与 $\lambda$ 具体值无关 | 取端点 0 或 1 各塌一侧卦限，双射 $F^{-1}(y)\leftrightarrow G^{-1}(g)$ 不再成立 |
| 负卦限选 $g$ | Thm 4.3 段 3 | 逼 $B<0$ | 全负 ⇒ 无正谱线无核 ⇒ $G$ 光滑 + full-support | 卦限内任取 | 换混合符号卦限则原像 $B$ 不定，14 节的局部光滑许可作废 |
| $\operatorname{tr}\lvert A\rvert=1$、$\lVert F(A)\rVert_1=\operatorname{tr}\lvert A\rvert$ | §14/3.2 | 球面归一 | 恒等式使 $F$ 在球面间取值 | 无 | 恒等式一破，奇映射不再住在球面之间，Prop 4.1 的维数界无从调用 |
| $\Pi^\pm(A)=\frac12(I\pm A(A^2)^{-1/2})$ | 3.2 证明 | 谱投影显式式 | 需 $A$ 非异，full-support 依赖再现 | 无 | 奇异处 $(A^2)^{-1/2}$ 爆，光滑性声明只能缩回非异开集（13 节 (d)(3)） |
| $\int uu^{\mathsf T}d\mu=I/k$；子空间质量 $r/k$ | 3.1 | $E$ 归一与限制恒等 | $\sum E_i=\operatorname{tr}Q$ 恰需该常数 | 无 | 因子 $k$ 改掉则 trace 等式带系数，(3.5) 的 $\ell^1$ 恒等与球面归一连锁偏 |
| $E(P_x)=f(x)$ | 3.1 | 秩 1 回收 $f$ | 二阶矩 $1/k$ | 无 | 若只到 $c\,f(x)$（高斯版），延拓与原始 $f$ 的支集读出要带缩放簿记 |
| 15 边、10 互补对、$2\cdot15/3=10$ | Lem 5.2 | 夹逼 | $\binom62=15$、$\binom63/2=10$、关联计数同为 10 | 0（双向取等） | 任何一边再大即"每边恰 2"不成立，公理化(2)崩，后续输运全部失去资格 |
| $C_5$、$\alpha(C_5)=2$、围长 5 | Lem 5.3 | 四性质 | 2-正则于 5 点唯一；独立数 2 ⟺ "4 元含三角形" | 无 | 顶点数变 6（$C_6$ 有独立 3-集）则 5.3(2) 前半失效 |
| $M_1=\{\{c,e\},\{d,f\}\}$、$M_2=\{\{c,f\},\{d,e\}\}$、对称差 4-圈 | 5.3(3) | 反向匹配强制 | 删点后 4-点路只有两种匹配延伸；互补规则禁同类 | 无 | 匹配种类若多一种，"$b$ 与 $c$ 的 link 限制必不同"失去确定性 |
| $\lvert R\rvert=4$；$(a\ b)(b\ c)(c\ a)=(b\ c)$ | Lem 6.2 | 三步输运净效果 | 复合恰为一个换位，被 5.3(3) 禁 | 0 | 少一步得恒等、多一步得 3-循环：5.3(3) 只禁换位，矛盾消失 |
| link 组件长 $\le4$；5-路禁 | Lem 6.3 | 6.4 分诊前提 | 输运复合净送 $v_4\mapsto v_2$；4-圈闭合唯一可能 | 无 | 允许 5-圈则 $a\ne b$ 时路不闭合、$p'(w)$ 不定，块不变性崩溃 |
| $B_y=p^{-1}(y)\cup\{y\}$、$\sum(\lvert B_y\rvert-1)=4$、$\bigcup(B_y\setminus\{q_y\})$ 四面体 | Lem 6.4 | 块不变性 | 和式 $=\lvert S\rvert$ 是"删选皆四面体"的基数许可 | 无 | 基数和若 $\ne4$，删选集不再是 4 元、不配叫四面体，26 节账本无从立起 |
| $1\le t\le4$、$\lvert R\rvert=6-t$、$t\ne4$、$t=3$、尺寸 $3,2,2$、$\{r,s,z\}$ 唯一扩张 | Thm 6.5 | 最终账本 | $10=4+6$ 算术锁定；"2 元块+块外对"共存是绝杀资源 | 0 | $t$ 若可为 2 或尺寸可为 $4,2,1$，唯一扩张论证给出的是"恰一个"，并非矛盾 |
| $3/4$、$5/4$、$\frac14$、$\sqrt{3/4+5/4}=\sqrt2$、$10+s$ | Cor 7.1 | 高维钉 | 平移 $P-\frac14I$ 强制 $3/4$；Gram $I_s+\frac14\mathbf1\mathbf1^{\mathsf T}$ 强制 $5/4$ 与新，新距 2 | 无 | $\frac14$ 动一格则三距同锁 $\sqrt2$ 断裂，新点不再独占覆盖块，$10+s$ 账目作废 |
| $\sqrt2,\sqrt6,\sqrt{12}$（Gell-Mann 型基） | Rmk 2.2 | 显式等距 | 分母即对角母题的 Frobenius 范数：$\sqrt2$、$\sqrt6$、$\sqrt{1+1+1+9}=\sqrt{12}$ | 无 | 分母错一个则坐标不再是等距，`coordinates9_norm_sq` 与"exactly its stated metric"同时挂 |
| $\sqrt2\,a_{ij}$（非对角） | Rmk 2.2 | Frobenius 双计 | $\lVert A\rVert_F^2$ 含 $2a_{ij}^2$ ⇒ 系数 $\sqrt2$ | 无 | 系数改 1 则非对角坐标带 $\sqrt2$ 残差，直径计算多因子 |
| $k\ge2$ / $k\ge3$ | Prop 4.1 / Thm 4.3 | 限制可迭代 | $k\ge3$ 才能向 $x_0^\perp$（维 $k-1\ge2$）复用下界 | 无 | $k=2$ 时 Thm 4.3 的第一段引用非法，$s\le k$ 与 $a\ge h$ 全断 |
| `Fin 10`、`EuclideanSpace ℝ (Fin 4)` | Lean Model | 全离散化 | 搜索空间 $\binom{10}3=120$、$\binom{10}4=210$ 有限可判定 | 无 | 标签数变大搜索组合爆炸，66,297 行的穷举机不可复制 |
| c3…c32921（4,095 引理） | FiniteCases | 机器穷举 | 索引上界 32921 ≈ 搜索节点编号，并非引理数 | 无 | 这只是机器账本；它若与 `no_ten_system` 断链，Lean 组合段失去全部证据链 |

补充注记（素材 §五 原三条）：(1) FiniteCases 的 4,095 个 c-引理对应"沿共三角形邻接可达四面体配置 × 六系相容检验"的机器展开 [推测：由文件线性 DAG、每文件约 50 引理、行数爬升节律推断；仓库未见生成器脚本]。(2) 表中"富余量=0"各行合起来构成对"为什么是 9"的最终定量回答：$N_k$ 序列在 $k=4$ 第一次同时满足 (i) $N_k-1$ 为整数维、(ii) 面补 $=N_{k-1}$ 进入刚性区、(iii) 块账本 $4+t$ 在 $t=3$ 处收口，三处零富余互相咬合，任何一环挪动即失效。(3) $\sqrt{12}$ 行的机制：三个对角基向量的分母就是母题矩阵的 Frobenius 范数本身（$\sqrt{1+1}=\sqrt2$、$\sqrt{1+1+4}=\sqrt6$、$\sqrt{1+1+1+9}=\sqrt{12}$），非对角系数 $\sqrt2$ 来自 $a_{ij}^2+a_{ji}^2=2a_{ij}^2$ 的双计，9 节 (b) 已逐向量验证正交归一。

## 31 最终思路与最初设想的差距

回看全程，我最初的设想是把这篇做成"Grinsztajn 63 维的又一次压维"：换一张强正则图、重跑秩界、纪录变成 62 或 61。实际成形的却是一个类别不同的陈述：反例的载体从点集换成了 9 维仿射空间里的射影子流形，否决工具从多项式方法换成了 mod-2 度数和覆叠示性类，最终裁决从不等式换成了有限组合系统的穷尽不相容。三处我完全没有预料到的形态：其一，"紧性"承担了两份实职（单位分解与直径可达），当初挑紧载体只图"看起来比点集强"；其二，$d+1=N_k$ 的等号刚性意味着降维到此不能继续用同一机件，9 应读作这套方法恰好咬合的位置，把它记成"当前技术下的新低点"属于误标；其三，组合段最终可机器化（Lean 用 66,297 行穷举替代 6.3-6.5 的人证），提示"纯组合"在方法论边界之后确实是另一种数学。仍开放的两问维持论文口径：断言失败的最小维数（$d<9$ 未排除）、$b(X)$ 精确值（只知 $\ge11$）。这两条与第 7 节那组 [未核实] 的数字一样，我再次声明：笔记里没有任何一处把它们写成了事实。

（全篇完。素材对应：§一 → 0-7 节；§二 2.1-2.17 → 8-28 节；§三 T1-T30 → 织入 3-28 节各处；§四 → 29 节；§五 → 30 节。）

## 常数与参数台账

这一节是后补的，落在"全篇完"标记之后；§30 那张六列表是临界性表（定义处/富余量口径），本表是五列逐字台账，两个表分工不同。本表的位置列全部落到行号：tex 文件均在 build/sections/（个别注 figures/），Lean 行号仅在 OAI/Geometry/Borsuk/、ComparatorChallenges/BorsukNine.json、formalization.yaml:117-120 与 :970-972 内取证，用于"被谁消费"列。每行行号这一轮都用 `grep -n` 定位后定点读回原文核对，两表冲突处本表为准，出入在表后备忘录里写勘误句，不动 §30 原文。

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $d=9$ | 断言首个被否定的见证维数；trace-one 超积欧氏结构维 $N_4-1=9$ | introduction.tex:9, introduction.tex:28, geometry.tex:29-31 | Thm 1.1 到 Cor 7.1 全链 (conclusion.tex:23); Lean `euclidean_nine_counterexample` (Borsuk/Main.lean:117-127) | 改 $d$ 即脱离 $d+1=N_k$ 锁定 (topology.tex:29-30)，九坐标等距 `coordinates9` (Main.lean:12-17) 失去对象；$d<9$ 论文未排除 (introduction.tex:29-30)，账本不许往低处搬 |
| $b(Y)>10$ | 覆盖数下界：至少 11 个严格小直径片 | introduction.tex:4-9 (定义 6, 声明 9) | Thm 1.1 的目标口径；Thm 6.5 矛盾 (ten-labels.tex:177-178) 是其唯一来源 | 若只证 $b(X)\ge10$，geometry.tex:102 的严格间隙前提 $(\sqrt2-d_i)/4>0$ 不再被"严格小于"逼出，第一桥塌 |
| $N_k=\binom{k+1}{2}$ | 标签数函数，二次增长 $N_k\sim k^2/2$；$N_4=10$, $N_3=6$, $N_2=3$ | geometry.tex:21-24 (式 22), topology.tex:50, introduction.tex:101 | 下界 $m\ge N_k$ (topology.tex:28-30)；$h=N_{k-1}$ (topology.tex:105-106)；差式 $N_k-N_{k-1}=k$ (topology.tex:112) | 序列任一格改值，$s\le k$、$10=4+6$ (ten-labels.tex:185-187)、$d+1=10+s$ (conclusion.tex:54) 三处算术同盘失灵 |
| $k=4$, $V=\mathbb R^4$ | 原型维数；$\mathbb P(V)=\mathbb{RP}^3$，环境空间 $\operatorname{Sym}_4(\mathbb R)$ | introduction.tex:11-16, conclusion.tex:7, geometry.tex:137-139 | $X$ 的定义 (introduction.tex:20-23)；Thm 4.3 前提 $k\ge3$ (topology.tex:89)；十标签节题头 (ten-labels.tex:3) | 改 $k=3$ 标签空间缩到 6，ten-labels.tex 的四面体与块账本失去对象；$k\ge5$ 则 $d\ge14$，ten-labels.tex:200 的穷举收口不再咬合 |
| $m=10$ ($[10]$, $\Delta^9$) | 覆盖片数=标签数，恰取等号 $m=d+1=N_4$ | geometry.tex:72, ten-labels.tex:3, ten-labels.tex:178 | Thm 6.5 全部标签操作；Lean `HasTenSmallCover` 的 `Fin 10 → Set Matrix4` (Borsuk/Model.lean:19-23) | $m=11$ 脱离 Prop 4.1 等号情形（度论证要求 $m=N_k$，extension.tex:184），刚性链条自起点断 |
| $\operatorname{diam}X=\sqrt2$ | 直径归一化：构型不变量，在正交线对上可达 | geometry.tex:36, introduction.tex:24-25, conclusion.tex:9 | 覆盖阈值"严格小于 $\sqrt2$" (introduction.tex:25)；Lean `Metric.diam projectorSet = Real.sqrt 2` (Counterexample.lean:52) | 换弦距归一后全文 $\sqrt2$ 全部换成 1，$1/4$、$3/4$、$5/4$ 三组派生常数需整盘重标 |
| $\lVert P_x-P_y\rVert_F^2=2-2\langle u,v\rangle^2$ | 两两距离只依赖线夹角 $\theta$：$\cos^2\theta=1-\tfrac12\lVert P_x-P_y\rVert_F^2$ | geometry.tex:32-37 | 直径对双充分诊 (geometry.tex:36-37)；Lem 2.4 正交矛盾 (geometry.tex:119-122)；Lean `projector_dist_eq_sqrt_two_iff` (Projectors/Basic.lean:216) | 距离一旦依赖夹角以外信息，"正交图=直径图"的双向桥塌，8 节到 11 节全部走形 |
| 距离图阈值 $\{\sqrt2\}$ | 临界距离图单边阈值：边集恰为正交线对，$x\perp y$ 当且仅当距离 $\sqrt2$ | geometry.tex:36-37 | 覆盖片禁含直径对 ⟺ 支集分离 (geometry.tex:80-83)；$b(Y)$ 定义 (introduction.tex:6-8) | 若加第二阈值（夹角近 $\pi/2$ 也算边），严格间隙不再严格，2.4 的平滑 f 造不出来，整条化约断 |
| 弦距因子 $1/\sqrt2$ | CHS 弦距 $=\tfrac1{\sqrt2}\times$ Frobenius 距离；本篇一律取后者 | geometry.tex:9-13 | "fix the normalization throughout the proof" (geometry.tex:13)；Lean `WithLp.toLp 2` (Main.lean:13) | 改用弦距口径后引理 2.1 的值 $\sqrt2$ 变 1，ε 四等分与推论段的平方和账目连锁重标 |
| 九坐标等距 | 对角位 $\tfrac{a_{11}-a_{22}}{\sqrt2}$, $\tfrac{a_{11}+a_{22}-2a_{33}}{\sqrt6}$, $\tfrac{a_{11}+a_{22}+a_{33}-3a_{44}}{\sqrt{12}}$；六非对角位系数 $\sqrt2 a_{ij}$ | geometry.tex:55-64 | "$\mathbb R^9$"三字在此兑现 (geometry.tex:68-69)；Lean `coordinates9` 逐位复制 (Main.lean:12-17)，`coordinates9_norm_sq` (Main.lean:24-38) | 任一分母或系数改一格，`coordinates9_norm_sq` 的等式 (Main.lean:27) 挂，Thm 1.1 的欧氏落点悬空 |
| 可容许映射 $f=(f_1,\ldots,f_m)$ | $f_i\ge0$，$\sum_i f_i=1$，$x\perp y\Rightarrow S(x)\cap S(y)=\varnothing$ | geometry.tex:75-86 (条件式 80-83) | 支集复形 $K$ 的构造 (geometry.tex:129-134)；11 节之后全部标签操作 | 丢掉"非负+和 1"任一条，单位分解造不出满足分离的 f (geometry.tex:116-118)，组合账本失去起点 |
| $\varepsilon_i=(\sqrt2-d_i)/4$ | 四等分比例常数：开邻域半径 $\varepsilon_i$，两邻域共占 $2\varepsilon_i$，恰剩一步到 $\sqrt2$ 的保险 | geometry.tex:102-105 | $U_i$ 的定义 (geometry.tex:104)；对距严格上界 $d_i+2\varepsilon_i$ (geometry.tex:110-111) | 分母 4 改 2 则 $d_i+2\varepsilon_i=\sqrt2$ 失去严格性，geometry.tex:119-122 的正交对矛盾被撤回，全文唯一分析桥断 |
| $\operatorname{diam}U_i\le(d_i+\sqrt2)/2$ | 每个开覆盖片的直径上界：$d_i$ 与 $\sqrt2$ 的算术平均，严格 $<\sqrt2$ | geometry.tex:110-113 | 平滑单位分区的从属构造 (geometry.tex:116-118)；拉回开覆盖 $V_i$ (geometry.tex:115) | 把平均改成向 $\sqrt2$ 偏的加权，$U_i$ 可含正交对（其距离 $\sqrt2$），2.4 的归约失效 |
| $H(v)=\lVert v\rVert^2 f([v])$ | 二次齐次提升；$\lVert H(v)\rVert_1=\lVert v\rVert^2$ 保原点连续 | extension.tex:9-14 | 正延拓 $E_V$ 的被积函数 (extension.tex:16-19) | 齐次数一改，子空间测度搬运 (extension.tex:83-88) 的次数抵消失效，$E_V=E_W$ 兼容断 |
| $E_V(Q)=k\int_{\mathbb S(V)}H(Q^{1/2}u)\,d\mu_V(u)$ | 正延拓；前因子 $k=\dim V$；后果 $\sum_i E_V(Q)_i=\operatorname{tr}Q$ | extension.tex:16-19, extension.tex:28-31 | $E_V(P_x)=f(x)$ 回收原型 (extension.tex:40, extension.tex:70-72)；符号延拓的原料 (extension.tex:106-108) | 因子 $k$ 改掉则 trace 守恒 (extension.tex:57-62) 差常数倍，$F$ 不再落在两侧范数球面之间，12 节点火器熄火 |
| $\int_{\mathbb S(V)}uu^{\mathsf T}\,d\mu_V(u)=k^{-1}I$ | 球面二阶矩常数 $1/k$（旋转不变概率测度） | extension.tex:57-58 | trace 守恒证明的唯一外部输入 (extension.tex:60-61) | 常数一动 $\sum_i E_V(Q)_i\ne\operatorname{tr}Q$，eq:norm-sphere-map 的等号 (extension.tex:133-136) 失去来源 |
| 子空间质量 $r/k$ | $Q$ 支撑于 $W$（$r=\dim W$）时像测度 $=(r/k)\mu_W$，故 $E_V(Q)=E_W(Q\rvert_W)$ | extension.tex:74-89 (质量式 82) | 局部标架的光滑公式 (extension.tex:91-96)；Thm 4.3 限制到 $x_0^\perp$ 的用法 (topology.tex:108-110) | $r/k$ 一破，同一标签在 $V$ 与 $W$ 中算法不兼容，$a\ge h$ 下界 (topology.tex:112) 无法在正交补里套用 |
| $A_\pm=\tfrac12(\lvert A\rvert\pm A)$；$F=E_V(A_+)-E_V(A_-)$ | 正负谱分解（半因子 $1/2$）与带号延拓 | extension.tex:103-109 | $F$ 的奇性 (extension.tex:113)；正负标签集等于两谱子空间的支集并 (extension.tex:121-127) | $1/2$ 改掉则 $A_+-A_-\ne A$，谱-支集读出 (eq:spectral-support) 全错，奇球映射不复存在 |
| $\lVert F(A)\rVert_1=\operatorname{tr}\lvert A\rvert$；$\sum_i F(A)_i=\operatorname{tr}A$ | 质量守恒与带号质量守恒的双恒等式 | extension.tex:115-119 | 范数球面自映射 (extension.tex:133-136)；与 $S^{N_k-1}$, $S^{m-1}$ 的反极等同 (extension.tex:176-185) | 任破一恒等式，mod-2 度失去舞台，Prop 4.1 的第一刀 (topology.tex:36-40) 落空 |

## 常数与参数台账

第 30 节那张六列表沿论文的叙述顺序排（几何 2.x → 延拓 3.x → 拓扑 4.x → 六标签 5.x → 十标签 6.x → 推论 7.1），列的是"临界性"和"富余量"，读起来像一份材料清单。本节把同一批常数按依赖链重排：先由 $k$ 定出 $N_k$ 与 $m$，再由直径把尺度钉成 $\sqrt2$，然后依次经过间隙化、球面延拓、mod-2 度、幂零类、组合账本、高维推论，末尾单列 Lean 侧被写死的数值。两表符号集合基本重合，但本节每行给的是 tex 里的实际文件与行号，而第 30 节只给章节标签；第 30 节那张表我一字未动。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $k=4$ | $V=\mathbb R^k$ 带 $k\ge2$、特化到 $\mathbb R^4$，$\mathbb P(V)=\mathbb{RP}^3$、$\operatorname{Sym}_4$ | sections/geometry.tex:15; sections/introduction.tex:14; sections/geometry.tex:138 | 下游一切索引：$N_k$、$X_k$、$S(x)$、四面体基数 $\lvert S\rvert=4$ | 取 $k=3$ 则 $N_3=6$、标签降到六个，5.3 的四性质自足、十标签账本无从起；取 $k\ge5$ 则 $\binom{k+1}{2}\ge15$，ten-labels 的 $\lvert R\rvert=6-t$ 与机器穷举同时失效 |
| $N_k=\dfrac{k(k+1)}2=\dim\operatorname{Sym}(V)$ | $N_4=10$、$N_3=6$、$N_2=3$、$N_k-N_{k-1}=k$ | sections/geometry.tex:22; sections/topology.tex:112 | 标签下界 Prop（topology.tex:30）与面大小上界 (4.3) | 差分 $N_k-N_{k-1}=k$ 是 (4.3) 的引擎，一旦 $N_k$ 不是二次式，topology.tex:112 的不等式链与 facet-odd-count 的基数读法一起断 |
| $m=10=N_4$ | 覆盖块数，也是 $\Delta^{m-1}$ 的维数加一 | sections/geometry.tex:139; sections/geometry.tex:72 | Def 2.3 的 admissible 条件、Prop（topology.tex:31）的等号情形 | 给 $m=11$ 则离开等号情形，topology.tex:31 的"mod-two degree one 且满射"作废，simplicial cycle 与整条 Smith 论证失去入口 |
| $d=9=N_4-1$ | 反例所在欧氏维数 | sections/introduction.tex:9; main.tex:6 | 定理 1.1 的陈述、Remark 2.2 的等距目标 $\mathbb R^9$ | $d+1\ne N_k$ 时命题本身还在，但等号刚性（topology.tex:31、topology.tex:282）不再适用，全文降为不等号下的弱陈述 |
| $\langle A,B\rangle_F=\operatorname{tr}(AB)$ | Frobenius 内积与 $\lVert\cdot\rVert_F$ | sections/geometry.tex:20 | 距离公式（geometry.tex:33）、直径、isometry 校验 | 换成 Hilbert--Schmidt 加权或 trace 归一不同版本，geometry.tex:33 的右端要带系数，2.4 的间隙算术与结论 7.1 的 $3/4,5/4$ 全部重标 |
| $\sqrt2=\operatorname{diam}(X_k)$ | 直径恰值，达到于正交线对 | sections/geometry.tex:36 | 覆盖假设"strictly less than $\sqrt2$"、lean 侧 diam_projectorSet | 阈值一旦不是 $\sqrt2$，geometry.tex:121 的矛盾（正交对距离恰为阈值）消失，2.4 整条"覆盖 → admissible 映射"的桥断 |
| $\lVert P_x-P_y\rVert_F^{2}=2-2\langle u,v\rangle^{2}$ | 距离与夹角的唯一桥梁 | sections/geometry.tex:33 | geometry.tex:36 的直径、geometry.tex:120-121 的正交对检验 | 若距离还依赖夹角以外信息，"$\lVert P_x-P_y\rVert_F=\sqrt2$" 与 "$x\perp y$" 不再等价，admissible 定义（geometry.tex:81）里的支集不交条件失去可验证性 |
| $P_x=uu^{\mathsf T}$、$\operatorname{tr}P_x=1$ | 秩一投影、迹一超平面 | sections/geometry.tex:17; sections/geometry.tex:45 | 紧性论证（geometry.tex:43-44）、$\mathbb P(V)\to X_k$ 同胚 | 换成非投影的秩一矩阵或改迹归一，几何.tex:33 的二次式化简不成立，$X_k$ 也不再落在维 $N_k-1$ 的仿射子空间里 |
| 显式等距分量 $\sqrt2,\sqrt6,\sqrt{12}$ | 三个对角方向的分母 | sections/geometry.tex:57-59; sections/geometry.tex:53-54 | Remark 2.2、lean 的 coordinates9 链 | 任一分母写错，geometry.tex:54 的"isometry to $\mathbb R^9$"断，geometry.tex:68 那句"exactly its stated metric"随之失效 |
| 非对角系数 $\sqrt2 a_{ij}$ | 六项，来自 $a_{ij}^{2}+a_{ji}^{2}=2a_{ij}^{2}$ 的双计 | sections/geometry.tex:60-61; sections/geometry.tex:66-67 | 等距性校验、coordinates9_norm_sq | 系数改成 1 则坐标带 $\sqrt2$ 残差，直径计算多出一个因子，$d=9$ 的载体度量与定理陈述脱钩 |
| $S(x)=\{i:f_i(x)>0\}$ | admissible 的核心对象 | sections/geometry.tex:79-81 | 支集复形 $K$（geometry.tex:129-133）、spectral-support | 把严格正改成非负则邻域论证（geometry.tex:104-113）读不出支集，正交对不交条件在边界上退化，2.4 的构造整体失效 |
| $\varepsilon_i=(\sqrt2-d_i)/4$ | 四等分间隙 | sections/geometry.tex:102 | $U_i$ 的半径（geometry.tex:104）、lean 的 thickening | 取 $1/2$ 则 $\lVert P-Q\rVert_F$ 只能推到 $\le\sqrt2$、geometry.tex:121 的严格不等号消失；取 $1/8$ 不坏但白亏单位分解的余量 |
| $(d_i+\sqrt2)/2<\sqrt2$ | 邻域与闭包的直径上界 | sections/geometry.tex:110-113 | 后续所有"直径仍严格小于 $\sqrt2$"的引用 | 若 $\varepsilon_i$ 与膨胀系数不同源，这一步与上一行脱节，$\operatorname{diam}\bar U_i<\sqrt2$ 不再成立，光滑单位分解（geometry.tex:117）无资格使用 |
| $\int_{\mathbb S(V)}uu^{\mathsf T}\,d\mu_V(u)=k^{-1}I$ | 球面二阶矩常数 | sections/extension.tex:58; sections/extension.tex:60-61 | trace 恒等式（extension.tex:30）、球面归一 | 因子 $k$ 若错，extension.tex:61 的 $\sum_i E_V(Q)_i=\operatorname{tr}Q$ 带系数，extension.tex:116 的 $\ell^1$ 恒等与 $\Sigma(V)$ 定义连锁偏 |
| 子空间质量 $r/k$ | 限制到 $W$ 时的总质量 | sections/extension.tex:82; sections/extension.tex:86-87 | 限制恒等 $E_V(Q)=E_W(Q\lvert_W)$ | 质量若不是 $r/k$，extension.tex:87 的 $k$ 对 $r$ 换式不成立，延拓在 $\operatorname{ran}A_\pm$ 上的光滑性声明断 |
| $E_V(P_x)$ 回收 $f(x)$ | 每个非零被积项是 $f(x)$ 的标量倍，标量和为 $\operatorname{tr}P_x=1$ | sections/extension.tex:70-71 | 支集读出 $\operatorname{supp}E_V(P_x)=S(x)$、球面延拓的起点 | 若只回收 $c\,f(x)$，延拓值与原始 $f$ 的支集比较要带缩放簿记，extension.tex:123-124 的并集表达式不再逐字成立 |
| $\lVert F(A)\rVert_1=\operatorname{tr}\lvert A\rvert$、$\sum_iF(A)_i=\operatorname{tr}A$ | 延拓的两条恒等式，正负谱支持无抵消 | sections/extension.tex:116-117; sections/extension.tex:144-148 | 把 $F$ 送进两个范数球面、spectral-support 的并集刻画 | 任一条恒等式破，$F$ 不再是球面之间的奇映射，topology.tex:19 的径向认同与 Prop（topology.tex:30）的维数界无从调用 |
| $\{A:\operatorname{tr}\lvert A\rvert=1\}\to\{y:\lVert y\rVert_1=1\}$ | 奇限制映射（eq:norm-sphere-map） | sections/extension.tex:132-136 | topology.tex:17 直接引用它做度论证 | 若限制不到球面上，topology.tex:31 的 mod-two degree one 没有载体，等号情形的整条拓扑段落空 |
| $\Pi_\pm(A)=\tfrac12\bigl(I\pm A(A^2)^{-1/2}\bigr)$ | 谱投影显式式，仅在非异处光滑 | sections/extension.tex:162-167 | extension.tex:171 的 $E_V(A_\pm)$ 光滑性、局部坐标合法性 | 奇异处 $(A^2)^{-1/2}$ 爆，光滑声明只能缩回非异开集；若显式式写错符号，正负谱子空间互换，extension.tex:129 的"全负 ⇒ 负定"断 |
| $\Sigma(V)=\{A:\operatorname{tr}\lvert A\rvert=1\}$ | 源球面，径向维数 $N_k-1=9$ | sections/topology.tex:14; sections/topology.tex:18-19 | 整节的度与示性类都在它上面做 | 半径归一常数一动，$\Sigma(V)$ 与 $S^{N_k-1}$ 的径向同胚不再是等距口径，topology.tex:19 的光滑结构输运失效 |
| $\Sigma_m=\{y:\sum_i\lvert y_i\rvert=1\}$ | 目标球面，跨 $m$ 个开卦限 | sections/topology.tex:16; sections/extension.tex:181-182 | $\ell^1$ 在每个卦限内是固定线性形式，从而局部光滑 | 换成 $\ell^2$ 球面则 extension.tex:181 那句"卦限内线性"失效，full-support 向量 $y$ 的卦限记账（topology.tex:196）失去依据 |
| $k\ge2$ 时 $m\ge N_k$ | 标签数下界（Prop） | sections/topology.tex:29-30; 限制可迭代见 sections/topology.tex:160-167 | 全文第一刀：先否决 $m<N_k$ | $k\ge2$ 若降为 $k\ge1$，向 $x_0^{\perp}$ 复用下界的归纳第一步非法；$m\ge N_k$ 一旦可违，10 块覆盖的拓扑障碍不存在 |
| $m=N_k$ 时 $\deg_2 F=1$ 且满射 | 等号刚性 | sections/topology.tex:31-32; 局部计数 sections/topology.tex:59-71 | 推出每对不同标签都是边、推出 simplicial cycle（topology.tex:96） | 度非零才不能漏值；若把等号换成 $m>N_k$，topology.tex:32 的"every pair of labels is an edge"不再被强制，$K$ 的纯度与 6.x 全部组合段失去资格 |
| $s=\lvert I\rvert$、$a=\lvert J\rvert$、$h=N_{k-1}=6$ | 面与其补的大小；$h$ 同时是纤维球面维数加一 | sections/topology.tex:105-106 | (4.3) 上界、(4.4) 维数式、幂零指数 $u^h=0$ | $h$ 若与 $N_{k-1}$ 脱钩，topology.tex:270 的 $u^h=0$ 不再杀掉顶类，"幂零指数杀顶类"与 $\dim L$ 的二分不再同步 |
| $a\ge h,\;s=m-a\le N_k-N_{k-1}=k$ | 面大小上界（4.3） | sections/topology.tex:112 | 四面体在 $k=4$ 处恰达到上界，撑开十标签账本 | 上界放宽则 $\dim L=k-s$ 可为负，topology.tex:139 的分诊失去意义，6.4 的"块外 $\lvert R\rvert=6-t$"无从立起 |
| $\dim L=(k-1)-(s-1)=k-s=a-h$ | 水平集维数（4.4） | sections/topology.tex:138-140 | $s<k$ 走示性类矛盾、$s=k$ 走系数计数 | 等式任一环改动，topology.tex:142-146 的"正维度零 / 有限集奇数"两步全部错位，facet-odd-count 无从落地 |
| $M\cong L\times S^{h-1}$ | 纤维丛平凡化（4.6） | sections/topology.tex:172-175 | 把 $\operatorname{pr}_2^{*}$ 的 pullback 算成球面上的类 | 若纤维不是 $S^{h-1}$（即 $h$ 换了），topology.tex:270-272 的两条形变同时错，$a>h$ 的消没论证熄火 |
| 负卦限取 $g$、$B<0$ on $x^{\perp}$ | 使 $G$ 光滑且 full-support | sections/topology.tex:184-190; sections/topology.tex:211 | Sard 选正则值、局部三角坐标（topology.tex:226-229） | 换混合符号卦限则原像 $B$ 不定，extension.tex:164 的投影光滑许可作废，局部度公式不能再点名 |
| $0<\lambda<1$、$y=(\lambda r,(1-\lambda)g)$ | 双块拼接权重；$A=\lambda P_x+(1-\lambda)B$ | sections/topology.tex:194-196; sections/topology.tex:209-211 | 使 $A$ 非异、雅可比块为上三角，从而 $\lvert G^{-1}(g)\rvert=\lvert F^{-1}(y)\rvert$ | 取端点 $0$ 或 $1$ 各塌一侧卦限，topology.tex:238 的双射计数断；结论与 $\lambda$ 具体值无关，但开区间性不可省 |
| $\lvert G^{-1}(g)\rvert=\lvert F^{-1}(y)\rvert\equiv1\pmod2$ | 纤维奇数（4.9） | sections/topology.tex:237-238 | 把全局度降到单个 $g$ 的纤维上 | 若奇偶性丢，topology.tex:280 的"odd number, a contradiction"消失，$a=h$、$s=k$（topology.tex:282）证不出来 |
| $u^{h}=0,\;\operatorname{pr}_2^{*}(u^{a-1})=0$ | 纤维上幂零类的消没 | sections/topology.tex:270-272 | $\dim L>0$ 分支的度零结论 | $a>h$ 时 $a-1\ge h$ 才成立；一旦 $h$ 与 $a$ 的关系改了，topology.tex:277 的"degree zero"整段失效，分诊回到原点 |
| $\lvert f^{-1}(\widetilde r)\rvert=\lvert L\rvert\equiv1\pmod2$ | facet 的奇数计数（4.10） | sections/topology.tex:290-291 | 纯度与"每边恰属两个四面体"的入口 | 若 $\dim L=0$ 不成立则 $L$ 不是有限集，这条计数没意义，ten-labels.tex:42 的 exactly two 失去拓扑来源 |
| 六标签基集 $\lvert C\rvert=6$ | $h=N_3=6$，恰是 $k=4$ 时 facet 的补 | sections/six-labels.tex:11; sections/topology.tex:106 | 六标签三角形系统的四条公理化性质 | 若基集不是 6，$\binom{6}{2}=15$ 与 $\binom{6}{3}/2=10$ 同时改，5.2 的夹逼两端不再相等，公理化(2)"每边恰两"崩 |
| 15 条边、10 对互补三元组、$2\cdot15/3=10$ | 双向夹逼，两端取等 | sections/six-labels.tex:28; sections/six-labels.tex:34-37 | 三角形数上界 10 与关联计数下界 10 | 富余量为 0：任何一边再大即"每对互补恰一三角形、每边恰两次"不成立，5.3 的四性质与后续输运全部失去资格 |
| 顶点 link 是五圈、独立数 2 | 5 点上 2-正则图唯一 | sections/six-labels.tex:47; sections/six-labels.tex:61-63 | "四元子集含三角形但不含其全部四三元" | 顶点数若变 6，$C_6$ 有独立三元集，5.3(2) 前半失效；围长若允许 3，四元子集可全为三角形，纯性读法改道 |
| $M_1=\bigl\{\{c,e\},\{d,f\}\bigr\}$、$M_2=\bigl\{\{c,f\},\{d,e\}\bigr\}$ | 删点后四元路的两种匹配延伸 | sections/six-labels.tex:77-80 | 互补规则强制两路用相反匹配 | 匹配若多一种，"$b$ 与 $c$ 处的 link 限制必不同"失去确定性，5.3(3) 禁换位的论证断 |
| 对称差四圈，边集 $M_1\cup M_2$ | 四圈上任取三点仍留边 | sections/six-labels.tex:89-93 | 换位 $(a\ b)$ 不可能保持三角形系统 | 若对称差是别的图，受限 link 可能相同，5.3(3) 不成立，6.2 的三步输运净效果无处被禁 |
| 每三角形恰属两个四面体 | 正偶重数被夹成"恰二" | sections/ten-labels.tex:39-42 | 边 link 的 2-正则性、块不变性 | 偶重数若只保证"至少二"，link 度数不定，ten-labels.tex:74 的分诊前提消失，6.3/6.4 整段散架 |
| 三步输运 $(a\ b)(b\ c)(c\ a)$，$\lvert R\rvert=4$ | 复合净效果恰为一个换位 | sections/ten-labels.tex:55-63 | 与 5.3(3) 冲突，逼出"恰二" | 少一步得恒等、多一步得 3-循环，5.3(3) 只禁换位，矛盾消失，ten-labels 层打不开 |
| 边 link 分量是 3-圈或 4-圈（长 $\le4$） | 五顶路被禁 | sections/ten-labels.tex:74; sections/ten-labels.tex:81-95 | 6.4 的分诊前提；复合把 $v_4$ 送到 $v_2$ | 允许 5-圈则 $a\ne b$ 时路不闭合、$p'(w)$ 不定，partner 映射与块不变性崩溃 |
| $B_y=p^{-1}(y)\cup\{y\}$ | 伙伴块，两元起步 | sections/ten-labels.tex:116-123 | 删选后仍得四面体的构造 | 若 $\lvert B_y\rvert$ 可以等于 1，删选集不再是 4 元、不配叫四面体，6.5 的账本立不起来 |
| $\sum_y(\lvert B_y\rvert-1)=\lvert S\rvert=4$ | 块规模的基数许可 | sections/ten-labels.tex:168 | Thm 6.5 的 $4+t$ 记账 | 和式一旦不等于 4，块外标签数 $\lvert R\rvert=6-t$ 与 $10=4+6$ 的算术锁定断开 |
| $4+t$ 个块内标签、$1\le t\le4$、$\lvert R\rvert=6-t$ | $t$ 是块数 | sections/ten-labels.tex:185-187 | 6.5 的分诊 | $t=0$ 或 $t\ge5$ 时 $\lvert R\rvert$ 越界，纯度与"块外对"资源同时不可用 |
| $t\ne4$、$\lvert R\rvert\le3\Rightarrow t\ge3$ | 两头夹到 $t=3$ | sections/ten-labels.tex:189; sections/ten-labels.tex:193-198 | 唯一剩下的账本分支 | $t=4$ 时全为二元块、$R$ 上无三角形却要被纯度扩张，两处矛盾之一若撤掉，$t$ 不再被钉住 |
| $t=3$、$\lvert R\rvert=3$、块尺寸 $3,2,2$ | 最终账本，零富余 | sections/ten-labels.tex:200-205 | 唯一扩张论证与 $no\_ten\_system$ | 尺寸若可为 $4,2,1$，唯一扩张给出的是"恰一个"，并非矛盾，十标签不存在这一结论失去最后一环 |
| $d=9+s$、$s\ge1$ | 高维推广的增量 | sections/conclusion.tex:23; sections/conclusion.tex:29 | 推论 7.1 的构造分诊 | $s=0$ 走定理 1.1 本体；若 $s$ 可为负，新点个数与 $10+s$ 的账目同时错 |
| 平移 $Y=\{P_x-\tfrac14 I\}$ | 把 $\operatorname{tr}=1$ 移到迹零子空间 | sections/conclusion.tex:32 | 让新点与 $Y$ 垂直、可用正交直和 | 平移量若不为 $\tfrac14 I$，$\lVert y\rVert_F^{2}=3/4$（conclusion.tex:35）不成立，与新点的距离锁不到 $\sqrt2$ |
| $\lVert y\rVert_F^{2}=3/4$、Gram $=I_s+\tfrac14\mathbf1\mathbf1^{\mathsf T}$、$\lVert v_i\rVert^{2}=5/4$、$\lVert v_i-v_j\rVert^{2}=2$ | 三个凑数：$3/4+5/4=2$ | sections/conclusion.tex:35; sections/conclusion.tex:39-44 | $\operatorname{diam}Z=\sqrt2$（conclusion.tex:49） | $\tfrac14$ 动一格，$3/4$ 与 $5/4$ 不再互补，新点与 $Y$ 的距离脱离 $\sqrt2$，直径锁失效 |
| $d+1=10+s$ | 覆盖块预算与新点独占额度 | sections/conclusion.tex:54-56 | 剩下至多十块去覆盖 $Y\times\{0\}$，回到定理 1.1 | 预算若为 $10+s-1$，新点不再独占一块，$Y\times\{0\}$ 可能拿到十一块，推论 7.1 的归约断链 |
| `HasTenSmallCover`：`C : Fin 10 → Set Matrix4`、`Metric.diam (C i) < Real.sqrt 2` | Lean 侧把阈值写死为 $\sqrt2$ | lean/OAI/Geometry/Borsuk/Model.lean:20; lean/OAI/Geometry/Borsuk/Model.lean:23 | `cover_to_admissible`（Projectors/Basic.lean:135）与 `main_theorem`（Counterexample.lean:49-52） | 阈值若改成别的 $<\sqrt2$ 常数，`diam_projectorSet`（Projectors/Basic.lean:86）给的是等号 $\sqrt2$，方向性立刻对不上 |
| `(Real.sqrt 2 - Metric.diam C) / 4` | 论文 $\varepsilon_i$ 的机器版，四等分照搬 | lean/OAI/Geometry/Borsuk/Projectors/Basic.lean:118; lean/OAI/Geometry/Borsuk/Projectors/Basic.lean:140 | thickening 的半径、正交对距离矛盾 | 分母 4 改成 2 会让严格不等号退化为 $\le\sqrt2$，Lean 里那条矛盾与 tex 侧 geometry.tex:110-113 同时熄火 |
| `(1 : ℝ) / 10` 鸽笼阈值 | 反向构造 `admissible_to_cover` 用的固定小常数 | lean/OAI/Geometry/Borsuk/Projectors/Basic.lean:187; lean/OAI/Geometry/Borsuk/Projectors/Basic.lean:205 | `cover_iff_admissible`（Projectors/Basic.lean:220-222） | 换成任何 $\le1/10$ 的值仍成立：它是 $\sum_{i:\operatorname{Fin}10}$ 平均值口径，动它只动代码不动数学，但改大就破 |
| `Labels := Fin 10`、`TenSystem.tetra_card : S.card = 4` | 组合层的全离散化 | lean/OAI/Geometry/Borsuk/TenLabels/Labels.lean:8; lean/OAI/Geometry/Borsuk/TenLabels/Labels.lean:13-14 | `support_ten_system`（Counterexample.lean:11）与 `no_ten_system` 穷举 | 标签数或四面体基数一变，六字段公理化与 $\binom{10}{3}=120$、$\binom{10}{4}=210$ 的有限搜索空间同时失去，穷举机不可复制 |
| `coordinates9` 的 `Real.sqrt 2 / 6 / 12` 与 `Real.sqrt 2 * A (i, j)` | Remark 2.2 的机器化 | lean/OAI/Geometry/Borsuk/Main.lean:12-17 | `coordinates9_norm_sq`（Main.lean:24）、`coordinates9_isometry`（Main.lean:55） | 任一分母或系数错一处，`sq_sqrt` 那三条（Main.lean:28-30）合不上，等距与"exactly its stated metric"同时挂 |
| `attribute [local instance] Classical.propDecidable` | 排中在机器侧的落点 | lean/OAI/Geometry/Borsuk/FiniteCases/Cases001.lean:8 | 六标签与十标签的全部判定式分支 | 去掉它，`no_ten_system` 的可判定穷举要重写为构造式版本，等价于换掉许可公理 `Classical.choice`（BorsukNine.json:8-12） |
| `enable_nanoda: false` 与许可三件套 | 无浮点、无区间算术 | lean/ComparatorChallenges/BorsukNine.json:13; lean/ComparatorChallenges/BorsukNine.json:8-12 | 整条 Lean 证明的算术口径 | 若需要外部数值库，间隙 $\sqrt2-\operatorname{diam}C$ 的严格性要交给数值验证，Lean 侧的证据链性质整体改变 |
| 登记口径：`solution_module` 写 Main、`file` 写 Counterexample | 声明可达但路径不同名 | lean/ComparatorChallenges/BorsukNine.json:3; lean/formalization.yaml:970-972; lean/formalization.yaml:117-120 | 覆盖脚本对 `OAI.BorsukNine.main_theorem` 的定位 | 两处路径若被"修成一致"而实际改文件，登记与 Main import Counterexample 的可达性关系被破坏，比对器找不到声明 |

**依赖链（主不等式链，六环）**：$k=4$（geometry.tex:15 给出 $V=\mathbb R^k$ 的一般口径、geometry.tex:138 把它钉在 4）先把 $N_k=k(k+1)/2$ 定成 $N_4=10$（geometry.tex:22），于是 $m=10$（geometry.tex:139）与 $d=N_4-1=9$（introduction.tex:9）是被联立钉死的，不是选出来的。第二环是尺度：$\langle A,B\rangle_F=\operatorname{tr}(AB)$（geometry.tex:20）经 $\lVert P_x-P_y\rVert_F^{2}=2-2\langle u,v\rangle^{2}$（geometry.tex:33）给出 $\operatorname{diam}X_4=\sqrt2$（geometry.tex:36），换任何归一都会把下游常数全体重标。第三环是间隙化：$\varepsilon_i=(\sqrt2-d_i)/4$（geometry.tex:102）与 $(d_i+\sqrt2)/2$（geometry.tex:113）合起来把"直径严格小于 $\sqrt2$ 的覆盖"翻译成 admissible 映射，这一步断则 (A) 桥不存在，Lean 侧对应 Projectors/Basic.lean:118。第四环是拓扑：$h=N_{k-1}=6$（topology.tex:106）同时决定纤维 $S^{h-1}$（topology.tex:173）与幂零指数 $u^h=0$（topology.tex:270），配合 $\dim L=k-s=a-h$（topology.tex:139）做分诊，$0<\lambda<1$（topology.tex:194）只负责把两侧卦限拼成非异 $A$，端点取值即断；伤到 Lean 就是 `chart_surgery_impossible` 与 `regular_facet_level_odd/even` 那一层没有对应命题可引。第五环是组合：$a=h$ 且 $s=k$（topology.tex:282）让 facet 全是四面体，六标签层用 $15/10/2\cdot15/3$（six-labels.tex:34-36）的零富余夹出"每边恰两"，十标签层再用 $t=3$、尺寸 $3,2,2$（ten-labels.tex:200）收口，机器侧落在 `TenSystem`（Labels.lean:13）与 `no_admissible_ten`（Counterexample.lean:43）。第六环是外扩：推论 7.1 用 $\tfrac14$、$3/4$、$5/4$、$10+s$（conclusion.tex:32-54）把 $d=9$ 抬到任意 $d\ge9$，它只依赖前两环的直径口径，一旦 $\sqrt2$ 被重标，这一环要整段重算。

链条上每一环都只被下一环消费，没有并行余量：把 $k$ 改到 3会在第四环与第五环同时失去载体（$N_3=6$ 使组合层退化为六标签自足系统），把 $h$ 与 $N_{k-1}$ 解耦会让第四环的分诊回到原点，把 $\varepsilon_i$ 的分母从 4 改到 2 则第三环与第四环之间彻底断开 [事实：这是论文 2.4 与 4.3 的接缝，两处都不给余量]。我在此只补一条自己的猜测 [推测]：如果哪天要在这套机件下把 $d$ 再往下压，动的不该是 $k$，是 $d+1\ge N_k$ 这条下界本身，即在 $m<N_k$ 时寻找别的刚性来源；目前 tex 里没有任何这样的替代物。

### 本表续体（接第 862 行表头的第一张五列表；两表之间被并发追加的台账整节隔开，续体行仍逐字沿用同表头与同列口径，第 20-43 行）

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\Pi^\pm(A)=\tfrac12(I\pm A(A^2)^{-1/2})$ | 显式谱投影；仅在非异点（$A^2$ 正定）光滑 | extension.tex:160-166 (式在 164) | $F$ 在非解开集光滑 (extension.tex:131, 167-173)；局部计数许可证 (topology.tex:59-85) 与正则值选取 (topology.tex:128-131 引 Sard) | 奇异处 $(A^2)^{-1/2}$ 爆，层集光滑流形保证 (topology.tex:135-137) 缩水，度公式与局部雅可比失去资格 |
| $\{A:\operatorname{tr}\lvert A\rvert=1\}\to\{y:\sum_i\lvert y_i\rvert=1\}$ | 两侧范数球面；径向归一后各自等同 $S^{N_k-1}$ 与 $S^{m-1}$ | extension.tex:133-136, topology.tex:11-19 | mod-2 度的舞台 (topology.tex:22-26, 36-40)；同维前提 $m=N_k$ (extension.tex:184) | 维数锁定一破，奇映射存在条件 ($n\le d$) 推不出等号刚性，标签下界退成渐近陈述 |
| 奇度两事实 | 奇映射 $S^n\to S^d$ 须 $n\le d$；$S^n$ 奇自映射度 $\equiv1\pmod 2$ | topology.tex:36-42 (引 Hatcher 2B.6/2B.7) | Prop 4.1 三句连跳 (topology.tex:29-33)；丛上奇数计数 (topology.tex:237-238)；零维回收 (topology.tex:290-291) | mod-2 换 mod-$p$ ($p>2$)，"正偶数、恰两个、唯一扩张"整条奇偶账本一起失效 |
| $m\ge N_k$ 与等号刚性 | $m=N_k$ 时 $F$ 度一且满射，每一对标签都是 $K$ 的边；底值 $N_2=3$ | topology.tex:28-33, topology.tex:44-52 (底值在 50) | Thm 4.3 整节 (topology.tex:88-98)；"限制须用满六标签" (ten-labels.tex:19-21) | 下界弱一格则等号情形蒸发，"面全是 $k$ 标签"证不出，17-21 节机件空转 |
| $s=\lvert I\rvert$, $a=\lvert J\rvert$, $h=N_{k-1}=6$ | 面大小上界 $a\ge h=6$, $s\le N_k-N_{k-1}=k=4$；补集尺寸 $m-k=6$ 恰等于 $h$ | topology.tex:104-113 (eq:facet-size-upper 在 111-112) | 层集维数公式 (topology.tex:139)；面补集体 $C=[10]\setminus S$ 六元 (ten-labels.tex:11) | $s\le k$ 放宽一格，"面是四面体"失去强制，22-26 节块账本没有头部 |
| $\dim L=(k-1)-(s-1)=k-s=a-h$ | 层集维数：$\mathbb{RP}^{k-1}$ 去掉仿射卡坐标 $s-1$ 维 | topology.tex:137-139 (eq:level-dimension 138-139) | 正维分支度零矛盾 (topology.tex:144-146)；零维分支回收系数 (topology.tex:285-291) | 等式任一项改动，二分诊两条腿不同步，$s=k$ 的强制悬空 |
| $M\cong L\times S^{h-1}$, $\dim M=a-1$ | 卡平凡化下的球丛；总空间维 $(a-h)+(h-1)$ | topology.tex:155-180 (积在 172-173；维在 179-180) | $\bar G:L\times\mathbb{RP}^{h-1}\to\mathbb{RP}^{a-1}$ (topology.tex:245-246)；奇数纤维计数 (topology.tex:237-238) | 纤维维 $h-1$ 一改，$G_x$ 不再是同维奇球映射 (topology.tex:285-286)，19 节丛论证两头脱手 |
| $0<\lambda<1$ | 拼接质量参数：目标 $y=(\lambda r,(1-\lambda)g)$；原像 $A=\lambda P_x+(1-\lambda)B$，$B$ 在 $x^\perp$ 负、签名 $(1,k-1)$ | topology.tex:194-211 (双射声明 199；剖分式 209-211), topology.tex:220 | full-support 双射 $F^{-1}(y)\leftrightarrow G^{-1}(g)$ (topology.tex:199, 214-216)；非异性 (topology.tex:200) | 取端点 0 或 1 各塌一侧卦限，双射与奇数传递 (topology.tex:237-238) 同断；区间内取值任意、开区间性不可省 |
| $u^h=0$；$\bar G^*w=\operatorname{pr}_2^*u$；$\bar G^*(w^{a-1})=0$ | SW 类幂零指数 $h$；拉回式不含 $H^1(L)$ 贡献 | topology.tex:245-249, topology.tex:262-263 (eq:cover-class), topology.tex:268-272 (幂零 270-272) | $a>h$（即 $s<k$）时顶类 $w^{a-1}$ 被杀、原像数取偶 (topology.tex:273-276)，与奇数 (topology.tex:237-238) 对撞 | 拉回身份任一改动，偶奇对撞失灵，$s=k$ 不再被强制，Thm 4.3 降格为部分陈述 |
| $\lvert f^{-1}(\tilde r)\rvert=\lvert L\rvert\equiv1\pmod 2$ | 零维回收系数：面全为 $k$ 顶点、$K$ 是 $(k-1)$ 维、$\sum_I I$ 成 $\mathbb F_2$ 循环 | topology.tex:285-294 (eq:facet-odd-count 290-291；$k$ 顶点 294), topology.tex:93-97 | 每 $(k-2)$ 面落在正偶数个面里 (topology.tex:96-97)；六标签层"15 边全在、三角正偶" (six-labels.tex:27-29) | mod-2 换其他系数环，"恰两个" (ten-labels.tex:41-43) 失去许可证，组合段奇偶账作废 |
| $\mathcal T\subseteq\binom{C}{3}$（$\lvert C\rvert=6$） | 六标签三角系双公理：互补三元组恰一入系；每一对恰落两个三角形 | six-labels.tex:10-19 (公理在 14-17) | Lem 5.2 夹逼 (six-labels.tex:27-37)；面的补被强制成系统 (ten-labels.tex:8-13) | 任一公理放松，"每三角恰两个四面体"与系统不再互锁，24-26 节起点断 |
| $\binom62=15$, $\binom63/2=10$, $2\cdot15/3=10$ | 双向夹逼：互补律给至多 10 个三角，边-三角入射给至少 10 个 | six-labels.tex:27-37 (fifteen 边在 28；十对在 34；均值在 36) | 取等：每互补对恰一、每边恰两次 (six-labels.tex:36-37)；link 的 2-正则 (six-labels.tex:60-61) | 任一侧松一格，"每边恰 2"不成立，公理 (2) 崩，输运全部失去资格 |
| link 为 5-圈且无 3-独立集 | 5 点上 2-正则唯一成 5-圈；$\alpha(C_5)=2$；故每 4 元子集含三角、其四三元组不全入系 | six-labels.tex:59-63 (成圈在 63), six-labels.tex:65-71 (两性质) | $\lvert R\rvert\le3$ 的推出 (ten-labels.tex:193-198)；$t=4$ 排除 (ten-labels.tex:189-191) | 顶点改 6（$C_6$ 有 3-独立集）则 5.3(2) 前半失效，26 节收口条件缺失 |
| 5 元子集决定整个系统 | 任意 5 点内的三角唯一恢复 $\mathcal T$：第 6 点参与的三元组全由互补律补回 | six-labels.tex:54-55 (陈述), six-labels.tex:95-98 (证明) | 6.2 的"交换后共享 5 标号即全系统一致" (ten-labels.tex:46-51) | 此条失效则输运后的系统不再唯一，24-26 节整条组合输运不可行 |
| $M_1=\{\{c,e\},\{d,f\}\}$, $M_2=\{\{c,f\},\{d,e\}\}$ | 端点 $c,d$、中边 $\{e,f\}$ 的 4-点路只有这两种匹配延拓；对称差为 4-圈 | six-labels.tex:73-90 (匹配在 79-80；4-圈在 89-90) | 换位不保系统 (six-labels.tex:50-53, 91-93)；6.2 三步输运矛盾 (ten-labels.tex:55-64)；6.3 五路矛盾 (ten-labels.tex:83-101) | 匹配若多一种，$a,b$ 两处 link 限制不再被强制不同，Lem 5.3(3) 报废 |
| 输运链 $(a\ b),(b\ c),(c\ a)$ | 三步复合净效果恰为一个换位，落在 5.3(3) 禁区；$R=[10]\setminus(T\cup\{a,b,c\})$ 四元 | ten-labels.tex:53-64 (链在 58-62；矛盾出口在 64) | Lem 6.2：正偶数配"至多两个"成"恰两个" (ten-labels.tex:41-43) | 少一步得恒等、多一步得 3-循环，5.3(3) 只禁换位，矛盾收回，"恰两个"退化为"至少两个" |
| 输运链 $(v_0\ v_2),(v_1\ v_3),(v_2\ v_4)$ | 复合固定 $R$ 且把 $v_4$ 送成 $v_2$；$\{v_4,r,s\}$ 与 $\{v_2,r,s\}$ 入系等价 | ten-labels.tex:83-97 (链在 88-93；净效果在 95-97) | Lem 6.3：边 link 连通组件只可能是 3-圈或 4-圈 (ten-labels.tex:73-76) | 净效果若非换位，5-路上 $v_4,v_2$ 的 link 限制不再必异 (ten-labels.tex:100-101)，长 link 禁不掉 |
| link 组件长 $\le4$ | link 顶点全 2-正则 (ten-labels.tex:79-80)、无 5-点路 (ten-labels.tex:81)、任何 $\ge5$-圈含禁路 (ten-labels.tex:101-102) | ten-labels.tex:78-81, ten-labels.tex:101-102 | 6.4 分诊：$a\ne b$ 时 4-路被强制补成 4-圈、$\{a,b\}$ 入 link (ten-labels.tex:144-146) | 允许 5-圈则 4-路不再闭合，$p'(w)$ 两分支 (ten-labels.tex:143, 146) 塌，块不变性断 |
| $B_y=p^{-1}(y)\cup\{y\}$；$\sum_y(\lvert B_y\rvert-1)=\lvert S\rvert=4$ | 伙伴映射 $p(v)$ 唯一；块两两不交、每块 $\ge2$ 元；任删每块一元仍是四面体 | ten-labels.tex:110-125 (定义在 116；性质在 118-124), ten-labels.tex:159-168 (块不变 159-160；基数许可 167-168) | Thm 6.5 的 $4+t$ 账 (ten-labels.tex:185)；删选自由实现全部取舍 (ten-labels.tex:162-166) | 基数和若 $\ne4$，"删选集"不再是 4 元、不配叫四面体，26 节账本立不住 |
| $1\le t\le4$, $\lvert R\rvert=6-t$, $t=3$, 块尺寸 $3,2,2$ | 双向夹逼：$t=4$ 被"每块只碰一元"排除 (189-191)；$R$ 内无三角、每 4 标号含三角给 $\lvert R\rvert\le3$ 即 $t\ge3$ (193-198)；合式 $4+t+(6-t)=10$ | ten-labels.tex:181-201 | 末杀 $\{r,s,z\}$ 的扩张分析 (ten-labels.tex:204-215) | 尺寸若变成两个 3-元块或 $4,2,1$，"只有一个 3-元块" (ten-labels.tex:209) 失力，末杀不再咬合 |
| $\{r,s,z\}$（$z$ 在 2-元块 $B$ 内） | 含此三角的四面体第四顶点被迫为 $B$ 的另一元，故它至多属于一个四面体 | ten-labels.tex:204-215 (外块条件 212-214；至多一在 214-215) | 与"每三角恰两个四面体"正面对撞 (ten-labels.tex:215-216 对 ten-labels.tex:41-43)，Thm 6.5 收口 (ten-labels.tex:177-178) | 此步若松，Thm 6.5 失去矛盾出口，$b(X)\ge11$ 断掉唯一来源 |
| $Y=\{P_x-\tfrac14I\}$, $\lVert y\rVert_F^2=3/4$ | 原型平移 $\tfrac14$ 进 trace-zero 空间；$Y$ 全体落在半径 $\sqrt{3/4}$ 球面；平移保持直径与覆盖数 | conclusion.tex:31-35 (平移式在 32；范数在 35), conclusion.tex:56-57 | 新旧两距装配 (conclusion.tex:43-50) | $\tfrac14$ 一改则 $3/4+5/4=2$ 断，新点"与一切成 $\sqrt2$"的身份失效 |
| $I_s+\tfrac14\mathbf1\mathbf1^{\mathsf T}$, $\langle v_i,v_j\rangle=\tfrac14$, $\lVert v_i\rVert^2=5/4$, $\lVert v_i-v_j\rVert^2=2$ | 新点构型两点间夹角：异对 $\cos=\tfrac{1/4}{5/4}=1/5$；新-新距 $\sqrt2$；新-$Y$ 因正交直和距离平方 $=3/4+5/4$ | conclusion.tex:37-44 (Gram 在 39；5/4 在 43；2 在 44), conclusion.tex:46-50 | "含新点的片既容不下第二新点也容不下旧点" (conclusion.tex:52-53) | Gram 与平移共用同一个 $\tfrac14$，它一动就同时松开新-新、新-旧两把距离锁，$10+s$ 账目空转 |
| $d=9+s$, $d+1=10+s$ | 高维搬运增长率：每加一维添一个新点，新点各自独占一块 | conclusion.tex:23, conclusion.tex:29, conclusion.tex:54 | Cor 7.1 全部 $d\ge9$ 反例；归结回 $d=9$ (conclusion.tex:55-57) | $s$ 账错一格，"至多十个块去盖 $Y\times\{0\}$" (conclusion.tex:54-55) 不再成立，搬运链断 |

附记（本表续体两条口径说明，非勘误）：Lean 侧与 $\varepsilon_i$ 同源的分母 4 实核在 `Real.sqrt 2 - Metric.diam ... , / 4` 处 (Projectors/Basic.lean:118，另一处同式 140 行附近)，比 §30 的"2× 富余"记法多给一个落点；$b(Y)$ 的定义在 introduction.tex:4-6 的语句里已经落定（正直径紧集所需严格小直径片的最小数），本表第 2 行按此口径写 $b(Y)>10$ 即 $b(X)\ge11$。figures/ 下三个 tikz 文件（partner-blocks.tex、partner-links.tex、six-label-paths.tex）通读后确认全部是插图排版坐标，不载数学常数，故不入台账。另记一条对账：`grep -oh 'theorem c[0-9]*'` 在 FiniteCases 下实得 4,093 条 c-引理（最大索引 c32921，145 个文件合计 66,297 行，行数与 §31 的口径一致），§30 表中"4,095"与本轮实测差 2，差额未能解释 [推测：旧版把个别非 c 编号的粘合引理计入]，§30 原文照旧不动。formalization.yaml:117-120 与 :970-972 核过：论文条目、`comparator_config: ComparatorChallenges/BorsukNine.json`、`declaration: OAI.BorsukNine.main_theorem`、`file: OAI/Geometry/Borsuk/Counterexample.lean` 逐字相符；BorsukNine.json 里 `solution_module` 写 `OAI.Geometry.Borsuk.Main` 而 yaml 的 file 写 Counterexample.lean，Main.lean:3 import Counterexample 使声明可达，两处登记并不矛盾，只是文件名不同层。

### 依赖链（本表版，与前一节自述的链并行留档）

挑六个最重的符号串一遍主链：$\sqrt2$（geometry.tex:36）、$N_k=\binom{k+1}{2}$（geometry.tex:22）、$\varepsilon_i=(\sqrt2-d_i)/4$（geometry.tex:102）、$h=N_{k-1}=6$ 与 $s\le k$（topology.tex:106, 112）、六标签三数 $(15,10,10)$（six-labels.tex:28, 34-36）、块账本 $(4+t,\,3,2,2)$（ten-labels.tex:185-200）。

第一环，$k=4$ 经 $N_4=10$ 定下标签预算 $m=10=d+1$（geometry.tex:138-139）；$\sqrt2$ 把构型尺度钉死，于是"十个严格小直径片覆盖 $X$"必须过 $\varepsilon_i$ 的 $1/4$ 间隙化（geometry.tex:102-113）才能变成 admissible 映射 $f:\mathbb{RP}^3\to\Delta^9$。改 $\varepsilon_i$ 的分母到 2，$d_i+2\varepsilon_i$ 撞上 $\sqrt2$，geometry.tex:119-122 的正交对矛盾熄火，全文第一座分析桥在源头就断。

第二环，延拓侧 $E_V$ 的前因子 $k$ 与二阶矩 $k^{-1}I$（extension.tex:17, 58）合成 trace 守恒，$\lVert F(A)\rVert_1=\operatorname{tr}\lvert A\rvert$（extension.tex:116）使 $F$ 落在两侧范数球面之间（extension.tex:133-136）；$m=N_k$ 时两球同维，mod-2 奇度给出 $m\ge N_k$ 与等号刚性（topology.tex:29-33）。把 $N_k$ 的二次式改一格，同维论证与 $s\le N_k-N_{k-1}=k$（topology.tex:112）连锁错位，拓扑段失去发力点。

第三环，$h=N_{k-1}=6$ 一物两用：它是层集维数 $\dim L=a-h$（topology.tex:139）的减数，又是 SW 幂零指数 $u^h=0$（topology.tex:270）的门槛；$a>h$ 时丛 $\bar G$ 上拉回杀顶类（topology.tex:262-272）与 $0<\lambda<1$ 拼接的奇数计数（topology.tex:194-238）对撞，$a=h$ 时零维回收奇系数（topology.tex:290-291），两头合逼 $s=k=4$，面全是四面体。$h$ 与 $N_{k-1}$ 解耦的那一刻，分诊两条腿同时骨折。

第四环，每个面的补集是六标签集体，三角系双公理经 $(15,10,10)$ 的零富余夹逼（six-labels.tex:27-37）逼出 link 全为 5-圈、$M_1,M_2$ 二选一匹配与换位禁区（six-labels.tex:47, 79-93）。15 或 10 任改一数，"每边恰两次"退化，5.3(3) 的禁区松绑，输运刚性不再可用。

第五环，换位禁区把三步输运 $(a\ b)(b\ c)(c\ a)$ 变成矛盾来源（ten-labels.tex:55-64），逼出"每三角恰两个四面体"，再由无 5-点路把 link 分量压到长 $\le4$（ten-labels.tex:73-102），伙伴块不变性与 $\sum(\lvert B_y\rvert-1)=4$（ten-labels.tex:116, 167-168）把账本立起来，$(4+t)+(6-t)=10$ 两面夹到 $t=3$、尺寸 $3,2,2$（ten-labels.tex:185-200），末杀 $\{r,s,z\}$ 至多属一个四面体与"恰两个"对撞（ten-labels.tex:209-216）。$(3,2,2)$ 或 $t=3$ 任改一格，Thm 6.5 没有矛盾出口。

第六环，$b(X)\ge11$ 回到 $\sqrt2$ 口径（introduction.tex:24-25），推论段用同一个 $\tfrac14$ 同时锁 $3/4$ 与 $5/4$（conclusion.tex:32-44），以 $10+s$ 预算把反例外推到一切 $d\ge9$（conclusion.tex:54）。链条上 $\sqrt2$ 动一下是全体重标，$1/4$ 动一下断第一环，$N_k$ 动一下断第二环，$h$ 动一下断第三环，$(15,10,10)$ 动一下断第四环，$(3,2,2)$ 动一下断第五环，$\tfrac14$（推论段那个）动一下断第六环，环环单点依赖，没有旁路。

## 台账补表

先记一笔我自己的口径失误。`## 常数与参数台账` 那两张表我是按"一个常数一行、一行里塞两三四个位置"写的，当时以为这样密度高；台账检查只数数据行，结果逐字规格那张数出 19 行，压在 28 行门槛下面。密度换成了行数亏空，这笔账算错了。第二个失误更实在：合并行让"位置"列变成清单式多锚点，读表的人没法拿一个行号回到 tex 里反查上下文，也就没法验证我写的行号对不对。

这一节把同一批常数按"一行一个可定位断言"重拆。位置列只给一个锚点（单行或紧邻两三行的区间），文件名一律不带 `sections/` 前缀；被谁消费列只填 tex 侧的下游，Lean 侧这一轮我没有取证（约束允许我查的只有 yaml 三行、module 目录和 comparator json，本节的断言行号全在 tex 里就能立住，我就没去动 Lean），所以那一列里没有出现任何 .lean 路径。

拆分时我试废过两条。第一条：把 introduction.tex:81-121 的证明概览整段抄成台账，四十来行里大半的位置列指向同一个句子区间，那是复述叙述、不是常数，删到只剩两处真正给出独立数值的行。第二条：我本想给 figures 里三个 tikz 源也配行号，读了 main.tex:20-26 的载入结构后停手了，那些坐标是本节的图件、进常数表属于凑数。剩下的行全部来自 main.tex 与 sections 下七个 tex 的定点回读，preamble.tex 本轮没有引用。

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $b(Y)$ | 覆盖 $Y$ 所需的严格小直径子集最少数；本文证 $b(Y)>10$ | introduction.tex:6-9 | 全文目标函数；geometry.tex:94-96 把"至多 $m$ 片覆盖"折成可容许映射；conclusion.tex:6-12 回销 | 定义若容许直径等于 $\operatorname{diam}Y$ 的片，geometry.tex:102 的 $\varepsilon_i>0$ 无从逼出，第一桥塌 |
| $\lVert A\rVert_F^2=\operatorname{tr}(A^2)$ 与 trace-one 超平面 | 该超平面是 $9$ 维欧氏空间 | introduction.tex:12-14 | geometry.tex:19-24 的 $N_k$ 计数；geometry.tex:55-69 的显式等距 | 内积口径一改，$\operatorname{tr}(A^2)$ 与九坐标长度脱钩，$\sqrt2$ 全体重标 |
| $X=\{uu^{\mathsf T}:\lVert u\rVert=1\}$，$\operatorname{diam}X=\sqrt2$ | 十片严格小直径覆盖不可能 | introduction.tex:19-25 | Thm 1.1 的见证集；conclusion.tex:6-12 的装配；Cor 的外推在 introduction.tex:31-32 挂号 | 阈值改写作 $1$ 后 geometry.tex:102、conclusion.tex:32、conclusion.tex:43 三组派生常数同时失配 |
| $946,903,561,560$ | 有限构型路线的四次下压，全部吃 Frankl-Wilson | introduction.tex:40-43 | 第 1 节的死路自述与此处的纪录表 | 把这四个数并进球码链，Nilli 与 Grey-Weissbach 的分工混掉，第 7 节的核对失去对象 |
| $323,321,298$ | Leech 格与 Hinrichs-Richter 的三次下压 | introduction.tex:45-50 | conclusion.tex:17-20 增点构造直引 Hinrichs-Richter 的引理 | 增点构造改引别家，conclusion.tex:17 那句"familiar construction"出处悬空 |
| $65,64,63$ | 强正则图族的三个有限反例维数 | introduction.tex:52-56 | introduction.tex:57-58 用它作对照，宣告改用射影空间紧影象 | 两系并读则"full compact image"与"finite configuration"的对立消失，第 0 节的转折无落点 |
| 弦距 $=\tfrac1{\sqrt2}$ 乘 Frobenius 距离 | CHS 口径与本篇口径差固定因子 | geometry.tex:9-13 | geometry.tex:13 声明以此"fix the normalization throughout the proof" | 两口径混用后某些步的阈值变 $1$，间隙算式与直径判定不同盘 |
| Walkup 的 $\mathbb{RP}^3$ 三角剖分 11 顶点下界 | 拓扑前身，论文写明不可直接套用 | introduction.tex:69-74 | geometry.tex:135-137 的"不假设任何三角剖分"由此得必要性 | 拿它当现成下界用即错，本文的面是坐标正支撑集合、并非剖分单纯形 |
| $N_k=\dim\operatorname{Sym}(V)=\binom{k+1}{2}$ | $N_2=3,N_3=6,N_4=10$，二次增长 | geometry.tex:21-24 | topology.tex:28-33 的 $m\ge N_k$；topology.tex:104-106 的 $h=N_{k-1}$；topology.tex:111-112 的差式 | 差分 $N_k-N_{k-1}=k$ 是面大小上界的引擎，二次式一改全节失配 |
| $\lVert P_x-P_y\rVert_F^2=2-2\langle u,v\rangle^2$ | 距离只依赖线夹角；系数 $2$ 来自迹一 | geometry.tex:32-35 | geometry.tex:36-37 的直径与正交判据；geometry.tex:119-122 的反证 | 系数或常数动一格，"$x\perp y$ 当且仅当距离取直径"双向失效 |
| 九坐标显式等距 | 对角三位分母 $\sqrt2,\sqrt6,\sqrt{12}$，非对角六位系数 $\sqrt2$ | geometry.tex:55-64 | geometry.tex:65-69 说明九维见证与所述度量一致 | 任一分母或系数改掉，$\lVert A\rVert_F$ 与 $\mathbb R^9$ 欧氏长度不再等值 |
| $[m]=\{1,\ldots,m\}$，$\Delta^{m-1}=\{t_i\ge0,\ \sum_i t_i=1\}$ | 标签集与标准形的记法 | geometry.tex:72-73 | six-labels.tex:22-23 的 $\Delta^5$；ten-labels.tex:3 的 $\Delta^9$ | 记法混用后 $m=6$ 与 $m=10$ 两处的上标口径不一，命题维数读不出 |
| $f_i\ge0$，$\sum_i f_i=1$，$x\perp y\Rightarrow S(x)\cap S(y)=\varnothing$ | 可容许映射的三条（eq:admissibility） | geometry.tex:75-86 | extension.tex:143-149 的无抵消论证；geometry.tex:129-134 的支集复形 | 丢掉分离条，$E_V(A_+)$ 与 $E_V(A_-)$ 可共享正坐标，extension.tex:116 只剩不等式 |
| $\varepsilon_i=(\sqrt2-d_i)/4$ | 四等分间隙，$U_i$ 的邻域半径 | geometry.tex:99-105 | geometry.tex:108-113 的对距上界；geometry.tex:115-123 的单位分解 | 分母改 $2$ 则 $d_i+2\varepsilon_i=\sqrt2$ 失严格性，第 11 节的桥整体断 |
| $\operatorname{diam}(U_i)\le(d_i+\sqrt2)/2<\sqrt2$ | $d_i$ 与 $\sqrt2$ 的算术平均给出保险 | geometry.tex:108-113 | 拉回开覆盖 $V_i$ (geometry.tex:115)；$f_i>0$ 只在 $V_i$ 内 (geometry.tex:118) | 改成偏向 $\sqrt2$ 的加权平均，$U_i$ 可含直径对，正交矛盾推不出 |
| $I\in K\iff I\subseteq S(x)$ 对某个 $x$ | 支集复形：有限抽象复形，容许未用标签 | geometry.tex:129-137 | topology.tex:88-98 的 facet 循环；six-labels.tex:27-28 的三角形来路 | 强求 $K$ 是某剖分子复形，introduction.tex:72-74 的不可适用性立刻反噬 |
| $H(v)=\lVert v\rVert^2f([v])$，$H(0)=0$ | 二次齐次提升；$\lVert H(v)\rVert_1=\lVert v\rVert^2$ 保零点连续 | extension.tex:9-14 | extension.tex:16-19 的被积函数；extension.tex:83-88 的次数抵消 | 齐次数改动后子空间搬运的次数抵消失配，$E_V=E_W$ 兼容断 |
| $E_V(Q)=k\int_{\mathbb S(V)}H(Q^{1/2}u)\,d\mu_V(u)$ | 前因子 $k=\dim V$；后果 $\sum_iE_V(Q)_i=\operatorname{tr}Q$ | extension.tex:16-19 | extension.tex:40 回收 $E_V(P_x)=f(x)$；extension.tex:103-109 供 $F$ 原料 | 因子 $k$ 与 $\int uu^{\mathsf T}d\mu_V=k^{-1}I$（extension.tex:57-58）须成对，单改一侧 trace 守恒差常数倍 |
| $\{i:E_V(Q)_i>0\}=\bigcup_{x\in\mathbb P(\operatorname{ran}Q)}S(x)$ | 正坐标恰为值域上用过的标签（eq:extension-support） | extension.tex:33-37 | extension.tex:120-127 的谱支撑式；topology.tex:184-192 的负 orthant 光滑性 | 只留单边包含则"$B$ 负定"读不出，正则值 $g$ 的光滑域失去 |
| 像测度质量 $\int\lVert\pi_Wu\rVert^2\,d\mu_V(u)=r/k$ | $r=\dim W$；正交不变性把测度定死 | extension.tex:74-89 | extension.tex:41-43 的 $E_V(Q)=E_W$（$Q$ 限制到 $W$ 后再作）；topology.tex:155-157 的球丛连续性 | 漏掉 $r/k$，$G_x$ 与 $F$ 的原像双对应在第 19 节断裂 |
| $A_\pm=(\lvert A\rvert\pm A)/2$，$F(A)=E_V(A_+)-E_V(A_-)$ | 带号延拓：连续、奇、一次齐次 | extension.tex:103-114 | extension.tex:115-119 的双恒等式；topology.tex:24-26 把 $F$ 限制到 $\Sigma(V)\to\Sigma_m$ | 半因子 $1/2$ 改掉则 $A_+-A_-\ne A$，谱分解与支撑读出全错 |
| $\lVert F(A)\rVert_1=\operatorname{tr}\lvert A\rvert$，$\sum_iF(A)_i=\operatorname{tr}A$ | 质量守恒与带号质量守恒（eq:extension-norms） | extension.tex:115-119 | extension.tex:133-137 的范数球面映射；topology.tex:11-17 的 $\Sigma$ 记号 | 任破一式 mod-2 度失去舞台，第 15 节命题的第一刀落空 |
| 坐标全非零推出 $A$ 可逆；坐标全负推出 $A$ 负定 | 支撑读谱的两侧推论，附 $F$ 在非异处光滑 | extension.tex:128-131 | topology.tex:184-192 的正则值选取；topology.tex:200-204 的正谱子空间一维化 | kernel 线允许全支撑标签时，$F^{-1}(y)$ 与 $G^{-1}(g)$ 的双向对应缺一半 |
| 两个范数球面径向等同于 $S^{N_k-1}$ 与 $S^{m-1}$ | 仅在可逆矩阵与全支撑向量处光滑 | extension.tex:176-185 | topology.tex:18-23 搬来的光滑结构；topology.tex:59-72 的局部计数许可 | 当作整体光滑超曲面，Sard 与反函数定理的适用域越界 |
| $m\ge N_k$；$m=N_k$ 时 $F$ 的 mod-2 度为 $1$ 且满射 | 奇映射 $S^n\to S^d$ 要求 $n\le d$ | topology.tex:28-34 | topology.tex:44-52 的每对标签成边（用到 $N_2=3$，第 50 行）；ten-labels.tex:19-21 以 $N_3=6$ 逼满六标签 | 只证 $m\ge N_k-1$ 则等号情形消失，四面体与循环结构无从谈起 |
| 局部计数：纤维有限，元素数模 $2$ 等于 mod-2 度 | 只要求所选纤维处局部光滑、导数可逆 | topology.tex:59-72 | topology.tex:236-239 的 $\lvert G^{-1}(g)\rvert$ 奇偶；topology.tex:285-292 的系数读取 | 去掉该许可，$F$ 与 $G$ 的奇偶读数都不成立，第 21 节回收系数无凭 |
| $s=\lvert I\rvert$，$a=\lvert J\rvert$，$h=N_{k-1}$，$a\ge h$ 且 $s\le k$ | facet 大小上界 $4$，补集下界 $6$（eq:facet-size-upper） | topology.tex:104-113 | topology.tex:137-140 的层集维数；topology.tex:281-282 的 $a=h,s=k$ 收口 | $h$ 若换成 $N_{k-2}$，不等式链两端不同盘，facet 尺寸锁不住 |
| $U_I\subset\mathbb P(V)\setminus\mathbb P(x_0^\perp)$ | 极大支撑所在线全落在一个仿射卡内 | topology.tex:115-127 | topology.tex:164-175 的丛平凡化；topology.tex:245-246 的 $\bar G$ 定义 | $U_I$ 触到超平面时 $x^\perp$ 丛不可平凡化，$M\cong L\times S^{h-1}$ 破 |
| $\dim L=(k-1)-(s-1)=k-s=a-h$ | 层集维数；$s<k$ 时为正（eq:level-dimension） | topology.tex:137-140 | topology.tex:142-147 的正维分支；topology.tex:285-286 的零维分支 | 维数错一格，第 20 节两侧同维的前提不成立，顶类被杀论断悬空 |
| $M\cong L\times S^{h-1}$，$\dim M=(a-h)+(h-1)=a-1$ | 球丛乘积化与总空间维数 | topology.tex:172-181 | topology.tex:245-246 的 $\bar G:L\times\mathbb{RP}^{h-1}\to\mathbb{RP}^{a-1}$ | 平凡化不同伦于对径映射时 $w$ 的拉回无从写出 |
| $0<\lambda<1$，$y=(\lambda r,(1-\lambda)g)$，$A=\lambda P_x+(1-\lambda)B$ | 签名 $(1,k-1)$ 的拼接坐标与预像分裂 | topology.tex:194-215 | topology.tex:226-239 的三角导数与奇偶计数 | $\lambda$ 取 $0$ 或 $1$ 时正谱线消失，$F^{-1}(y)$ 与 $G^{-1}(g)$ 的双射断 |
| $\bar G^*w=\operatorname{pr}_2^*u$，$u^h=0$，$\bar G^*(w^{a-1})=0$ | $a>h$ 时顶类被杀，度为零，$H^1(L)$ 无贡献（eq:cover-class） | topology.tex:248-273 | topology.tex:274-282 与奇数计数的对撞 | 源丛混入 $H^1(L)$ 项则拉回等式多一项，$a=h$ 逼不出 |
| $\lvert f^{-1}(\tilde r)\rvert=\lvert L\rvert\equiv1\pmod2$ | 零维层集势奇，facet 系数全为 $1$（eq:facet-odd-count） | topology.tex:285-292 | topology.tex:294-311 的 $\sum_I I$ 为 $\mathbb F_2$ 循环；six-labels.tex:27-28 的正偶数前提 | 系数非 $1$ 则第 22 节等号夹逼与第 24 节"恰两个"同时失去来路 |
| 六标签三角系双公理：互补三元子集恰取一，每对恰属两三角形 | $\mathcal T\subseteq\binom{C}{3}$，$\lvert C\rvert=6$ | six-labels.tex:10-19 | six-labels.tex:27-38 的计数；ten-labels.tex:8-13 由 facet 补集强制 | 第二公理松成"至少两"后 $2\cdot15/3=10$ 的等号不再锁死系统 |
| $(15,10,10)$：$\binom62=15$ 边，互补对 $10$，$2\cdot15/3=10$ 三角形 | 上界与下界同取 $10$，富余量为零 | six-labels.tex:27-38 | six-labels.tex:36-37 的等号；six-labels.tex:59-63 的 link 二次正则 | 三个数任改一个，"每边恰两次"退化，第 23 节的换位禁区随之松开 |
| 点 link 是 $5$-圈；$5$-圈无 $3$-独立集 | $5$ 顶点二次正则简单图必为单圈 | six-labels.tex:59-71 | six-labels.tex:65-71 的每个 $4$ 元子集含三角形；ten-labels.tex:31-33 排除互斥四面体 | 独立数容许 $3$ 则每个 $4$ 元子集含三角形失守，补集账本重排 |
| $M_1=\{\{c,e\},\{d,f\}\}$，$M_2=\{\{c,f\},\{d,e\}\}$，对称差成 $4$-圈 | 端点 $c,d$、中边 $\{e,f\}$ 的 $4$-点路只剩两种匹配 | six-labels.tex:73-90 | six-labels.tex:91-93 的换位禁区；ten-labels.tex:53-64 与 ten-labels.tex:83-97 的两次输运 | 匹配唯一性丢则第 23 节第 (3) 条失效，两处输运矛盾同时失去出口 |
| 任意 $5$ 元子集上的三角形决定整个 $\mathcal T$ | 被省顶点的全部三元子集由互补规则回收 | six-labels.tex:54-55 | ten-labels.tex:46-51 的"共 $5$ 标签故两系统相同" | 无唯一性则第 24 节第一观察作废，"恰两个"降级为上界 $2$ |
| 输运 $(a\ b),(b\ c),(c\ a)$ 复合固定 $R$ 并对换 $b,c$ | $R=[10]\setminus(T\cup\{a,b,c\})$，$\lvert R\rvert=4$ | ten-labels.tex:53-64 | ten-labels.tex:65-66 由"至多两个"加正偶数得"恰两个" | 复合若成三轮换就不与换位禁区冲突，三角形可属四个四面体，link 全部重算 |
| 输运 $(v_0\ v_2),(v_1\ v_3),(v_2\ v_4)$ 把 $v_4$ 送到 $v_2$ | 两个系统在 $R$ 上的 link 重合，$\lvert R\rvert=3$ | ten-labels.tex:83-101 | ten-labels.tex:101-102 排除 $5$-点路；ten-labels.tex:144-146 强制补成 $4$-圈 | $\lvert R\rvert$ 记账错则 edge link 长度上限拿不到，伙伴块不变性缺料 |
| edge link 每点度 $2$，连通分量只含 $3$-圈或 $4$-圈 | 顶点与边的定义在此，长度上限来自无 $5$-点路 | ten-labels.tex:69-81 | ten-labels.tex:110-125 的 $p(v)$ 与 $B_y$ | 容许 $\ge5$-圈时 $a\ne b$ 情形无法闭合，块结构不唯一 |
| $p(v)$ 唯一且落在 $S$ 外，$B_y=p^{-1}(y)\cup\{y\}$，$\lvert B_y\rvert\ge2$ | 每块删一元仍得四面体 | ten-labels.tex:110-125 | ten-labels.tex:159-168 的块不变性；ten-labels.tex:181-201 的 $t$ 记账 | 删元规则一改，"任意 $q_y\in B_y$ 的删选都给四面体"不再成立 |
| $\sum_y(\lvert B_y\rvert-1)=\lvert S\rvert=4$，块共含 $4+t$ 个标签 | 块大小与 $S$ 的双向记账，附 $\lvert R\rvert=6-t$ | ten-labels.tex:167-168 | ten-labels.tex:184-188 的 $1\le t\le4$ 与余量核算 | 等式差一，$t=3$ 与 $(3,2,2)$ 不再唯一，末杀手无 $2$ 元块可用 |
| $t=3$，$\lvert R\rvert=3$，块尺寸 $(3,2,2)$ | $t=4$ 由每块只占一元排除；$\lvert R\rvert\le3$ 由 $R$ 含于补集且每 $4$ 元含三角形逼出 | ten-labels.tex:189-201 | ten-labels.tex:204-215 的 $\{r,s,z\}$ 至多属一个四面体 | $(3,2,2)$ 改一格则第 26 节没有矛盾出口，$\mathbb{RP}^3\to\Delta^9$ 无从否决 |
| $Y=\{P_x-\tfrac14I\}$，$\lVert y\rVert_F^2=3/4$ | 平移到 trace-zero 空间，全体落在半径 $\sqrt{3/4}$ 球面 | conclusion.tex:28-35 | conclusion.tex:36-50 的新点装配；conclusion.tex:56-57 的平移不变性 | 平移量改则 $\sqrt2$ 距离不保持，Cor 的尺度账整盘重标 |
| Gram $=I_s+\tfrac14\mathbf1\mathbf1^{\mathsf T}$，$\lVert v_i\rVert^2=5/4$，$\lVert v_i-v_j\rVert^2=2$ | 新点两两夹角余弦 $1/5$，新点到 $Y$ 距离 $\sqrt2$ | conclusion.tex:36-44 | conclusion.tex:44-50 的直径断言；conclusion.tex:52-53 的一片一新点 | 正定性失则 $\mathbb R^s$ 中取不出该组向量，高维外推在起手处卡住 |
| $d=9+s$，$d+1=10+s$ | 每升一维添一个新点，新点各自独占一片 | conclusion.tex:22-29 | conclusion.tex:52-57 剩下十片去覆盖 $Y\times\{0\}$ 的归约 | $s$ 与片数配比一改，第 28 节的外推在算术上立不住 |
| main.tex 的 section 载入序 | 七个 section 依次 geometry、extension、topology、six-labels、ten-labels、conclusion | main.tex:20-26 | 全篇"引理 2.x 至 6.x"编号与笔记节标题的对应 | 顺序换则第 3 节到第 28 节的编号标签整体错位 |
| 概览句：正坐标绝对值之和等于特征值绝对值之和 | 归一两端得球间奇映射 | introduction.tex:92-98 | 与 extension.tex:115-119、topology.tex:28-34 的正文口径对照 | 概览若写成平方和，$F$ 不再落在 $\Sigma_m$ 上，度论证舞台消失 |
| 阈值 $k(k+1)/2$ 个标签配 $\mathbb{RP}^{k-1}$ | 概览层的等号叙述 | introduction.tex:100-103 | 对应 topology.tex:104-113 的 $a\ge h$ 与 $s\le k$ | 概览口径与正文不同盘，引用时须分别标注，否则行号核对必错 |

### 视角差异勘误

新旧两张表的差别在聚合口径，我把差别的来源逐条登记，旧表一个字没动。

第一层差别是表头字面。第 862 行那张用"符号"起列，第 888 行那张用"记号"起列，规格只认前者的字面，所以逐字统计时后者整节不计入。第 952 行 `### 本表续体` 声明自己沿用第 862 行的表头与列口径，实际续体那 24 行上面没有再落一行表头，按行号统计时它们也不入库。这是我这次行数亏空的主因：内容都在，只是没有以"合法行的形状"存在。

第二层是"位置"列的写法。862 表把两三个锚点用逗号串进一格（$N_k$ 行同时给 geometry.tex:21-24、topology.tex:50、introduction.tex:101），888 表统一带 `sections/` 前缀并用分号分隔；新表规定一行一个锚点、文件名不带目录前缀，于是同一个常数在新表里要占两三行。行数上去了，反查成本下来了，这是一次交换。

第三层是"被谁消费"列。862 表在第 864-868 行那几处直接把 Lean 路径写进消费列（`Borsuk/Main.lean:117-127` 一类），888 表也在消费列里挂 lean 侧名字；新表的消费列全部是 tex 内部的下游关系，一轮下来我没碰 Lean，所以那一列里没有任何 .lean 与 json 路径。两表在这一点上口径不同盘，交叉核对时别把新表的空格当成漏记。

第四层是同一常数在旧两表里锚点集合不一致，这属于我发现的真实口径差。$m=10$ 在 862 表记 geometry.tex:72、ten-labels.tex:3、ten-labels.tex:178，在 888 表记 sections/geometry.tex:139 与 sections/geometry.tex:72；geometry.tex 里 $m=10$ 的字面出现在第 138-139 行（第 139 行就是 "$m=10$."），第 72 行出现的其实是 $\Delta^{m-1}$ 与 $[m]$ 的记法。新表把记法行与等号行分开记，见 $[m]$、$\Delta^{m-1}$ 那一行（geometry.tex:72-73）。

第五层是第 981 行 `### 依赖链` 那段的合并引用。它把"link 全为 5-圈、$M_1,M_2$ 二选一匹配与换位禁区"三件事塞进一个括号，行号给 six-labels.tex:47 与 79-93，其中第 47 行是点 link 为 5-圈的陈述，第 79-80 行是两套匹配，换位禁令的陈述处 six-labels.tex:50-53 没被列出；新表按 59-71（5-圈）、73-90（匹配）、91-93（换位推论）分三行记。同段把块尺寸结论记作 ten-labels.tex:185-200，而"块尺寸 $3,2,2$"的字面落在第 200-201 行，新表记 189-201 一整段。两处旧文原样保留，我在新表里按实读行号另记。

### 本节自检

以下都是本轮真做过的动作，用的工具是 python 逐行统计，位置从第 997 行的节题开始。

1. 数据行数：50 行，满足本次要求的 30 行下限，也满足规格 28 行下限；表头在第 1005 行、分隔行在第 1006 行，两行字面与规格逐字一致。
2. 竖线计数：新节内每一行以 `|` 起首者恰含 6 个 `|`，违规行数实测 0，故单元格里没有裸竖线；绝对值一律写 `\lvert x \rvert`，范数一律写 `\lVert x \rVert`。
3. 配对检查：初稿有一处只写了半个竖线命令（把 $Q$ 限制到 $W$ 的那格），落盘后立即改写成文字，复检 `\lvert` 与 `\rvert`、`\lVert` 与 `\rVert` 每行计数相等，违规 0。
4. 空与占位：逐格扫描新节表格，空串、单横线、长横线占位命中 0。
5. 长横线：新节与全文件的 em dash 计数都是 0；姓名连接处本轮没有新增，数值区间一律用短横。全文件含三连短横的行只有规格要求的那一行表格分隔行。
6. 套语与转折连接词：按规格给出的五类逐项做子串统计，新节命中全部为 0；本小节按规矩不把这些词形抄在这里。
7. 行号可回读：新节的位置列取自 main.tex 与 sections 下七个 tex 的定点回读，`preamble.tex` 与 figures 下三个 tikz 文件本轮未读未引；对应说明见本节第三段。
8. 引用落点：本节只提到真实存在的标题，`## 0 我进场时手里有什么`、`## 29 Lean 形式化取证`、`## 30 常数与参数总表`、两处 `## 常数与参数台账`、`### 本表续体`、`### 依赖链`，以及本节的两个子标题。
9. 旧稿完整性：本次只做末尾追加与 §0 末尾补一句，未删除、未回滚、未改写任何既有行；文件从 168,499 B 增至 185,471 B，行数从 996 增至 1057（写这一条时另算 §0 那一句的增量）。

10. 补记，收尾第 9 条的两个数：§0 那句与本子节全部落盘后终测为 190,370 B、1087 行；第 9 条里的 185,471 B 与 1057 行是它自己落盘时刻的读数，两个数都实、只是先后两格。附带一笔位移：§0 末尾多出两行后，原第 862 行的规格表头下移到第 864 行，另一张带"记号"表头的下移到第 891 行，于是旧文 `### 本表续体` 里"接第 862 行表头"那半句在现盘行号偏了两格，现盘该读作第 864 行；这是追加的必然后果，旧文一字不改，只在此登记。表内的 tex 锚点不受位移影响，它们指向 build/ 下的源文件行。

11. 两条纠正与一次收尾。其一，第 5 条那句"全文件含三连短横的行只有规格要求的那一行表格分隔行"说过头了，重测的实际分布是四处：第 820 行（第 30 节那张六列表的分隔行，旧文原有）、第 865 行与第 891 行（两张旧台账的分隔行）、第 1008 行（本补表的分隔行）；真正要卡的是独占一行的长横线，实测全文件计数 0，本补表里也只有第 1008 行这一行规格强制的分隔行。其二，自检条目自己也在把文件撑大，第 10 条写下的 190,370 B、1087 行是第 10 条落盘前的读数，第 10 条落盘后实测 191,027 B、1089 行，本条落盘后的终值由交付报告重跑一遍给出，登记这个自指缺口是本节能给的最准口径。补表的实盘形状复述一遍收口：数据行 50，表头与分隔行各 1（第 1007、1008 行），每行竖线恰 6 个，违规行 0，空格与占位格 0，`\lvert` 与 `\rvert`、`\lVert` 与 `\rVert` 每行成对。
