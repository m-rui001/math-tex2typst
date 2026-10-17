# D138 对称 Mahler 猜想的等号情形：零亏量、单纯形与中位分割的反推笔记

素材行 150。论文 `The symmetric Mahler conjecture and its equality cases`，日期牌 2026-09-22，作者署名 OpenAI。正文只取自 `preprints/The-symmetric-Mahler-conjecture-and-its-equality-cases-September-22-2026/build/sections/` 下的 9 个 `.tex`；`main.tex` 的行序在 49-56 给出装配顺序，即 `introduction`、`convex-preliminaries`、`lens`、`holomorphic-mass`、`feasibility`、`simplex`、`zero-deficit`、`median`。下面所有逐字引用都带 `文件:行号`，行号按该目录里的实际文件数出来。

## 0 初始动机：把"等号在哪里"从不等式里单独拎出来

我一开始的问题意识很朴素。体积乘积 $P(K)=|K|\,|K^\circ|$ 在线性变换下不变，于是它天生是一个仿射不变量问题；而一个只有"下界"的定理总让我怀疑自己只读到了半个定理。开头那段就是全部动机，`introduction.tex:14-16` 逐字：

> The conjectured value is $4^n/n!$,
> the product of a cube and its polar cross-polytope. We prove this bound
> in every dimension and classify the equality cases.

我当时想定理长这样，`introduction.tex:35-40`（即 `eq:main-inequality` 所在的那条 `thm:main`）：

> |K|\,|K^\circ|\ge\frac{4^n}{n!}.
> Equality holds if and only if $K$ is a linear Hanner body.

`thm:main` 的陈述里 "$n\ge1$" 这个下界我一开始当成排版习惯，后来才明白它是有重量的：$n=1$ 时对称凸体只能是居中区間，$K=[-a,a]$ 的极是 $[-1/a,1/a]$，乘积 $4=4^1/1!$，两边都取等，基例的验证在 `convex-preliminaries.tex:105-108` 与 `simplex.tex:218-219` 各出现一次。由此整个分类在最低维退化成一个直算，它给后面的归纳链条提供了一个不再需要额外论证的入口。

极值体是递归定义的，`introduction.tex:18-32` 那段是我第一次读到"两个操作配一个基数"的时刻：

> Hanner polytopes in $\R^{k+l}$. These are the $\ell_\infty$ and
> $\ell_1$ sums, respectively. This class contains cubes, cross-polytopes,
> and mixed recursive sums. We call an invertible linear image of a
> Hanner polytope a \emph{linear Hanner body}.

我的第一个猜想（当时的草稿纸上有这句话）：等号类应当只由"两个操作 + 线性像"这三件东西生成，任何其它写法都多余。事后看这个猜想是对的，但它的证明方式跟我预想的完全不同，我预想的是一种组合分类（先证 $K$ 是多面体，再数面），实际走的是一条解析到度量几何的路：先把亏量压成 $0$，再取出中位数，最后把分类外包给一个 1981 年的 Banach 空间结构定理。

还有一个动机成分我起初没写进笔记。$P(\cdot)$ 的下界一旦有了锐常数，等号类就变成"这个变分问题的极值点集合"，而极值点集合的大小决定定理的可用性：只有等号类被完全确定，才能去谈稳定性、谈局部极小性、谈函数化不等式的取等条件。`introduction.tex:248-251` 在函数化推论后面恰好把这一点挑明：几何侧的分类并不会自动给出偶势函数的取等分类，那里的引用是 `\cite[p.~1437]{FradeliziMeyer2008}`。所以"等号情形"这份工作在逻辑上有它自己的寿命。

本笔注叙事对应的论文目录为 preprints/The-symmetric-Mahler-conjecture-and-its-equality-cases-September-22-2026，在 .tools/lean_queue.txt 队列第 150 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 同一个命名空间下挂着两条登记

这一节只谈登记本身，不谈另一篇的内容。`lean/formalization.yaml` 里我关心的三行在 1562-1564：

> - comparator_config: ComparatorChallenges/SymmetricMahlerEquality.json
>   declaration: OAI.SymmetricMahler.symmetric_mahler_equality
>   file: OAI/Analysis/Mahler/Classification.lean

而在 1298-1300 有另一组三行，配置 `ComparatorChallenges/MahlerConjecture.json`、声明 `OAI.SymmetricMahler.symmetric_mahler`、文件 `OAI/Analysis/Mahler/MainTheorem.lean`。两条登记共用命名空间 `OAI.SymmetricMahler`，共用模块目录 `lean/OAI/Analysis/Mahler/`（243 个 `.lean`），但它们是两条不同的声明：一条是不等式那一侧，一条是等号分类这一侧。

这个分界我在笔记里必须写死，否则后面每次提到 `symmetric_mahler` 都要重新猜。我用的判据有三条。第一，声明名后缀：`_equality` 表示双向等价的 $\leftrightarrow$，`MainTheorem.lean` 里的那条是单侧 $\le$。第二，文件里的实际形式。`Classification.lean:534-540` 给出的正是 `iff`：

```
theorem symmetric_mahler_equality {n : ℕ} (hn : 1 ≤ n)
    ...
    ((volume K).toReal * (volume (coordinatePolar K)).toReal =
      (4 : ℝ)^n / (Nat.factorial n : ℝ)) ↔ IsLinearHanner K := by
  exact ⟨equality_implies_linearHanner hn hK hconv hsym hint,
    IsLinearHanner.volumeProduct⟩
```

两个方向由两个不同来源提供：右推左（即线性 Hanner 体取到常数值）由 `HannerBodies.lean:537` 的 `IsLinearHanner.volumeProduct` 负责，左推右由 `Classification.lean:518` 的 `equality_implies_linearHanner` 负责，后者内部只调用一次 `EqualityMedians.lean:606` 的 `equality_polar_gauge_medians`。第三，`.tex` 侧的分工：不等式在 `simplex.tex:178-184` 的 `cor:symmetric-inequality` 里被独立证明了一次（用逼近），等号在 `median.tex:211-214` 的 `prop:equality-classification` 里收尾，然后 `median.tex:228-229` 用一句话把两半合成 `thm:main`。也就是说论文把"两条登记"的东西在正文里也拆成了两个编号命题。

登记用的比较器配置 `lean/ComparatorChallenges/SymmetricMahlerEquality.json`（434 B）我整读了，它的 `solution_imports` 只有一条 `OAI.Analysis.Mahler.Classification`，`theorem_names` 只有那一个声明，`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 为 `false`。这里有一个细节值得记：允许的公理里没有 `sorryAx`，也没有任何超出 ZFC 常规三件套的东西，说明 `Classification.lean` 这条 `iff` 是被完整闭合的。

命名空间冲突这件事在 Lean 侧是合法的（`symmetric_mahler` 与 `symmetric_mahler_equality` 是两个不同的 constant），但在阅读顺序上很危险：`Classification.lean:1` 只 `import OAI.Analysis.Mahler.Splitting`，而链子一路走到底恰好落在不等式那条登记所在的文件上。我把整条 import 链实测了一遍：

`Classification.lean:1` → `Splitting.lean:1` → `Diamonds.lean:1-2` → `Faces.lean:1` → `EqualityMedians.lean:1` → `Lens.lean:1` → `Medians.lean:1` → `HannerBodies.lean:1` → `MainTheorem.lean:1-2`。

于是"等号"这一侧在文件层面严格坐在"不等式"这一侧之上，跨过 9 个文件。按 fence 的要求，`MainTheorem.lean` 只用来钉这条分界（它的 910 B 里装的是另一条登记），本篇后续一律把它当外部依赖，取它内容当输入的动作我一次也没做。

体积上的分布也支持这个读法：目录里最大的是 `Splitting.lean` 62,995 B、`Faces.lean` 58,507 B、`Lens.lean` 48,513 B、`Diamonds.lean` 43,245 B，四个文件加起来约 213 KB，而声明文件 `Classification.lean` 只有 23,746 B。声明薄、机制厚，说明真正的工作量全在等号侧的机器上（面结构、分割、中位数），下界本身反而在链条最底下已经解决了。

## 2 走错过的路线，以及每一条卡在哪里

这一节集中记录失败路线。逐引理小节的 `[推测]` 标签下还有更细的分支，这里只汇总那些我真的在草稿上推到无法推进的。

路线一，把三维证明逐字搬到任意维。文献一侧的起点是 `introduction.tex:53-60`：Iriyeh 与 Shibata 完成了三维对称定理含等号，Fradelizi、Hubard、Meyer、Roldán-Pensado、Zvavitch 给出基于 equipartition 的短证明和另一套等号论证，Chen、Li、Xi、Xu 给出 shadow-flow 证明。我照抄过 equipartition 的想法：把 $S^{n-1}$ 分成 $n+1$ 块等测度区域，让每个区域的支撑函数控制一条约束。失败原因很硬：equipartition 的存在性证明本身依赖 $n=2$（圆上的角度均分），升维后我要的是"对每个内点 $X$ 一致地分割"，而 $X$ 在变，分割也变，亏量积分里出现的 $\Sigma_X$ 就不再有任何单调性。这条路在我的推演里停在"无法把逐点选择写成一个可积的映射"。

路线二，先假设 unconditionality。`introduction.tex:64-67` 说 Saint-Raymond 对坐标变号不变的体证到了锐下界，Meyer 与 Reisner 在该类里识别出 Hanner 等号类。我一度以为可以先在 unconditional 类里把分类做完，再用某种平均化去掉假设。失败原因：平均化会改变 $P(K)$（它只在 $GL_n$ 下不变，对"坐标对称化"没有不变性），而且等号类里的 $\ell_1/\ell_\infty$ 和是在任意互补子空间上取的，未必跟坐标轴对齐。`median.tex` 最后的 `thm:hansen-lima`（201-205 行）要的正是"任意 $\ell_1/\ell_\infty$ 和"的结构，坐标限制下这个结构根本拿不全。

路线三，zonoid。`introduction.tex:67-71` 给了 Reisner 的 zonoid 定理与类内等号即 parallelotope。我试过把一般体写成 zonoid 逼近，失败原因直接：cross-polytope 在 $n\ge3$ 不是 zonoid，等号类里最大的一族就在 zonoid 之外，类内等号刻画对我毫无用处。

路线四，指数型弱界。Bourgain-Milman 与 Kuperberg（`introduction.tex:80-84`）给的是不含锐常数的指数下界，我的亏量论证需要精确的 $4^d/d!$ 与精确的 $d!/(4^d)$ 归一化（`simplex.tex:53-55`），常数一糊，`eq:vanishing-missing-volume`（`zero-deficit.tex:126-130`）那个"亏量趋于 $0$"就变成"亏量趋于某个正数"，后面每一步都要崩。

路线五，直接引用广义 Lelong 数的比较定理。`holomorphic-mass.tex:9-12` 明确交代了背景是 Demailly 的第 3、5 节，而 11-12 行的措辞是 "We give a direct Stokes proof in the normalization used here."。我起初想用现成定理省掉那 130 行，失败原因在归一化：现成定理给的测度常与我这里 `eq:mass-volume-normalization`（`holomorphic-mass.tex:25-27`）的 $d!\det(v_{\bar z_i z_j})\,dV$ 差一个 $d!$ 或 $\pi^d$，而下游 `feasibility.tex:118-119` 的 $\frac{\pi^d}{d!}P_I$ 要与之精确相消，差一个因子就只剩 $S\ge c$（$c\ne1$），等号情形完全失效。

路线六，把 $\Sigma_X$ 做逐点极限。`zero-deficit.tex:142-144` 那句话就是对我这个错误的正式回应：

> This is a consequence of \eqref{eq:vanishing-missing-volume} on
> product neighborhoods; it does not require a pointwise limit of the
> functions $X\mapsto|\Sigma_{j,X}|$.

失败原因：$X\mapsto|\Sigma_{j,X}|$ 在 $j$ 方向既非单调也不一致有界变差，逐点极限不存在；只能改用乘积邻域上的积分论证（`zero-deficit.tex:146-162`）。

路线七，用一般（无中心规定）Mahler 定理推对称版。`introduction.tex:123-130` 说得很清楚，一般问题的猜想常数 $(n+1)^{n+1}/(n!)^2$ 在 $n\ge2$ 时比对称常数更小，"a result for that general problem alone therefore does not establish Theorem~\ref{thm:main}"。我写这条是因为它是我最早动过的念头：既然 companion paper 有一般定理，为何还要单独做对称？答案是方向反了：小的常数界推不出大的常数界。

路线八，把等号当稳定性定理做。`introduction.tex:72-78` 那条线（Nazarov-Petrov-Ryabogin-Zvavitch 的严格局部极小、Kim 的推广、Kim-Zvavitch 的无条件类稳定性）只处理极值点邻域，它给的是"接近即取等"，我要的是"取等必接近"的完整逆向结构，两者逻辑方向相反。

## 3 三个转折：亏量、添一段、端点退化

转折一：目标从"证明 $P(K)\ge4^n/n!$"换成"证明一个非负积分等于 $0$"。触发点是 `simplex.tex:58-61` 的 `eq:simplex-deficit`：

> 0\leq\int_A\bigl(|A^\circ|-|\Sigma_X|\bigr)\,dX
>        \leq |A|\,|A^\circ|-\frac{4^d}{d!}.

这一步把等号条件变成了一个覆盖问题的量词：右边为 $0$ 逼着左边的被积函数几乎处处为 $0$，也就是"可行单纯形的并对几乎盖满极体"。我在这之前一直试图直接从取等推出多面体结构，完全没有意识到真正的抓手是那个被积函数。

转折二：把分析对象从 $K$ 本身挪开，先添一段升到 $d=n+1$。`zero-deficit.tex:17-21` 的 `eq:segment-lift`：

> B=K\oplus_1[-1,1]
>    =\{(x,s):p_K(x)+|s|\le1\},
>  \qquad C=B^\circ=Q\times[-1,1].

关键是升维保等，`zero-deficit.tex:81-83` 的 `eq:lift-equality`：$|B|\,|C|=\frac4{n+1}|K|\,|Q|=\frac{4^d}{d!}$。这个 $\frac{4}{n+1}$ 因子来自 `convex-preliminaries.tex:59` 的 $|A\oplus_1A'|=\frac{k!\,l!}{(k+l)!}|A|\,|A'|$ 在 $l=1$ 处的特例。升维换来的东西有两件：$C$ 有了两个水平面 $Q\times\{1\}$ 和 $Q\times\{-1\}$（`zero-deficit.tex:22-24`），于是"符号"变成了几何量；$B$ 有了顶点（apex）$(0,1)$，于是"逼近 apex"变成了可操作的极限过程（`median.tex:55-60`）。我最初的设想里没有任何地方需要 apex，这个设计完全是在读了 `median.tex` 的端点比较之后才看得懂的。

转折三：分析量到度量量的相变发生在 $\lambda$ 的端点退化上。`lens.tex:148` 的 `eq:lens-endpoint-asymptotic`：

> \lambda(1-\eta)=\frac2\pi\eta\log\frac1\eta+O(\eta).

我在推导里第一次看到这个 $\eta\log(1/\eta)$ 时判断"这是个坏的退化"，因为它比任何 $\eta^\alpha$ 都慢地趋于 $0$。真正的读法在 `lens.tex:151-155` 的 `eq:lens-endpoint-ratio`：对 $0<a\le b<\infty$，$\sup_{a\le c\le b}\left|\frac{\lambda(1-\delta c)}{\lambda(1-\delta)}-c\right|\to0$。也就是说 $\lambda$ 在 $1$ 附近 behaves like 一个 slowly varying 函数乘上线性因子，比值极限恰好是参数 $c$ 本身。正是"恰好是 $c$"这件事把宽度比变成了支撑函数的加性量，随后在 `median.tex:96-97` 里长出一个 $h_{D_0}(u)$，接着在 `median.tex:108` 长成支撑函数不等式，最后在 `median.tex:124-126` 由凸分离得到成员关系 $x+y\in D_0+(s-p)Q$。从"复分析里的宽度"到"Banach 空间里的中位数"这条桥只有一个组件：$\lambda$ 端点的这个特定退化速率。

顺带一个方法论转折：`lens.tex:11-13` 承认这个映射是 Gross 的 conformal Skorokhod embedding 例子的旋转（引用 `\cite[Section~3.2]{Gross}`），但 13 行的态度是 "we prove all its required properties directly."。也就是说所有概率论背景都被降级成一句出处，证明是自足的。这决定了这篇论文的重心分布：真正原创的是端点渐近 + 亏量 + 中位数这三件事的组合。

## 4 凸预备：两种和、极化与 Hanner 体积乘积

`convex-preliminaries.tex` 4,270 B，是全篇最短的一节，它把后面所有"组合侧"的事实压成两条引理。

**(a) 逐字引用。** `convex-preliminaries.tex:48-64`（`lem:sums`）：

> \begin{lemma}[Polars and volumes of the two sums]\label{lem:sums}
> For origin-symmetric convex bodies of dimensions $k,l\ge1$,
> \begin{equation}\label{eq:sum-polars}
>  (A\oplus_1 A')^\circ=A^\circ\oplus_\infty(A')^\circ,
>  \qquad
>  (A\oplus_\infty A')^\circ=A^\circ\oplus_1(A')^\circ.
> \end{equation}
> Moreover,
> \begin{equation}\label{eq:sum-volumes}
>  |A\oplus_\infty A'|=|A|\,|A'|,
>  \qquad
>  |A\oplus_1 A'|=\frac{k!\,l!}{(k+l)!}|A|\,|A'|.

以及 `convex-preliminaries.tex:63`：

> P(A\oplus_s A')=\frac{P(A)P(A')}{\binom{k+l}{k}}.

`convex-preliminaries.tex:87-92`（`lem:hanner`）：

> \begin{lemma}[The Hanner volume product]\label{lem:hanner}
> Every $d$-dimensional linear Hanner body $H$ satisfies
> \[
>  P(H)=\frac{4^d}{d!}.
> \]
> The polar of a linear Hanner body is again a linear Hanner body.

**(b) 中间步骤。** 从 $A\oplus_1A'$ 的 gauge 公式 `convex-preliminaries.tex:38-40` 出发，$p_{A\oplus_1A'}(x,x')=p_A(x)+p_{A'}(x')$。固定 $x\in A$（即 $p_A(x)\le1$），纤维 $\{x'\colon p_A(x)+p_{A'}(x')\le1\}$ 恰为 $(1-p_A(x))A'$，体积 $(1-p_A(x))^l|A'|$。对 $x$ 积分时把 $p_A(x)\le t$ 的水平集测度换成 $t^k|A|$（这正是 `convex-preliminaries.tex:72` 那行 $|\{x:p_A(x)\le t\}|=t^k|A|$ 的作用），用水平集测度对 $t$ 求导得到密度 $kt^{k-1}|A|$，于是

$|A\oplus_1 A'| =k|A|\,|A'|\int_0^1t^{k-1}(1-t)^l\,dt$

正是 `convex-preliminaries.tex:74-76` 的中间一行，其后被写成 $B$-函数值 $\frac{(k-1)!\,l!}{(k+l)!}\cdot k=\frac{k!\,l!}{(k+l)!}$。这一步之后除以 $|A|\,|A'|$，再与极化公式合并，就得到 `eq:sum-products`：分母上的 $\frac{(k+l)!}{k!\,l!}=\binom{k+l}{k}$ 恰好是二项式系数。$P$ 的传播因此是"乘 $4^k/k!\cdot4^l/l!$ 再除以 $\binom{k+l}{k}$"，即 $4^{k+l}\frac{k!\,l!}{(k+l)!}\cdot\frac{1}{k!\,l!}\cdot(k+l)!$ 化简为 $4^{k+l}/(k+l)!$，与 `convex-preliminaries.tex:97-99` 的归纳句一致。

**(c) 常数与假设的机械理由。** $l\ge1$、$k\ge1$ 是 $B$-函数 $\int_0^1t^{k-1}(1-t)^l\,dt$ 收敛的要求；若允许 $l=0$ 则 $\oplus_1$ 的定义退化为 $A\times\{0\}$，体积为 $0$，商式失去意义。$\binom{k+l}{k}$ 出现在分母上是因为 $\oplus_1$ 是取凸包，其体积比笛卡儿积小了单纯形比例因子，两个因子一约一现，$P$ 才在两种操作下保持同一种传播律。$8/\pi^2$ 这类解析常数在这一节一次也不出现，说明本节只负责"取等的构造侧"，即 $P(H)=4^d/d!$ 这一半；在 Lean 侧它对应 `HannerBodies.lean:537` 的 `IsLinearHanner.volumeProduct`，`Classification.lean:540` 把它直接填进 `iff` 的右推左方向。$(A\oplus_\infty A')^\circ=A^\circ\oplus_1(A')^\circ$ 这条"极化交换两种和"是 `median.tex:222-225` 那一步 $K=Q^\circ=T^{-\mathsf T}H^\circ$ 的先决条件：极之后仍是同一族，分类才可以在 $Q$ 侧做完再搬回 $K$ 侧，用的正是 `convex-preliminaries.tex:22` 的 `eq:linear-polarity`：$(TA)^\circ=T^{-\mathsf T}A^\circ$。

**(d) 失败路线。** `[推测]` 直接对 $P$ 做归纳而忽略 $\binom{k+l}{k}$：若把 $|A\oplus_1A'|$ 误写成 $|A|\,|A'|$，则 $P$ 在 $\oplus_1$ 下会多出 $\binom{k+l}{k}$ 因子，$4^d/d!$ 变成 $4^d$，整篇解析侧的 $d!/(4^d)$ 归一化（`simplex.tex:53-55`）立刻对不上。`[推测]` 只保留 $\ell_\infty$ 和：那样得到的族只有平行多面体，等号类缺一整族 cross-polytope 型体，与 `introduction.tex:30-31` 那句 "This class contains cubes, cross-polytopes, and mixed recursive sums" 矛盾。`[推测]` 试图把 $p_{A\oplus_1A'}(x,x')=p_A(x)+p_{A'}(x')$ 直接当作对任意互补子空间分解成立的公式，而 `convex-preliminaries.tex:33-35` 特意补了"互补子空间由可逆线性映射与乘积坐标等同"这一句，少了它，任意位置的 $\ell_1$ 和就没定义了。

## 5 透镜：把角度均匀换成纵坐标均匀

`lens.tex` 7,754 B。这一节是全篇唯一"手工造对象"的地方，我把它当成整篇文章的输入设备来读。

**(a) 逐字引用。** `lens.tex:16-19`（`eq:lens-map`）：

> F(z)=\frac8{\pi^2}\sum_{j=0}^{\infty}
>              \frac{(-1)^jz^{2j+1}}{(2j+1)^2}.

`lens.tex:20`：

> The series converges uniformly on $\overline{\mathbb D}$.

`lens.tex:31-36`（`eq:lens-width-curvature`）：

> \lambda'(t)=-\frac2\pi
>        \operatorname{arctanh}\!\left(\sin\frac{\pi t}{2}\right),
>  \qquad
>  \lambda''(t)=-\sec\frac{\pi t}{2}<0.

`lens.tex:38-41`（`eq:lens-boundary-law`）：

> F(e^{i\Theta})\ \stackrel{\mathrm{law}}{=}\
>  \varepsilon\lambda(T)+iT,

其中 42-43 行给出 "$T$ is uniform on $[-1,1]$ and $\varepsilon$ is an independent uniform sign."。`lens.tex:108-109` 是这一切的来源：

> t'(s)=\frac2\pi,\qquad
>  v'(s)=-\frac4{\pi^2}\operatorname{arctanh}(\sin s).

**(b) 中间步骤。** 我的推导路径是把 $F$ 与 $\arctan$ 挂钩。`lens.tex:48-49` 定义 $w=\arctan z=\frac1{2i}\log\frac{1+iz}{1-iz}$，并说 $\left|\Re w\right|<\pi/4$。逐项求导 `lens.tex:55-56`（`eq:lens-derivatives`）：$F'(z)=\frac8{\pi^2}\frac wz$，故 $F'(0)=\frac8{\pi^2}$（这是 `lens.tex:24` 声明的那个数），且 $1+\frac{zF''(z)}{F'(z)}=\frac{\sin(2w)}{2w}$。对 $w=a+ib\ne0$，`lens.tex:61-62` 给出实部

> \frac{a\sin(2a)\cosh(2b)+b\cos(2a)\sinh(2b)}{2(a^2+b^2)}>0,

理由是 $|a|<\pi/4$ 使 $\sin(2a)$ 与 $a$ 同号、$\cos(2a)>0$ 使 $b\cos(2a)\sinh(2b)$ 与 $b^2$ 同号，两项皆非负且不同时为 $0$。于是曲线 $\gamma_r(\theta)=F(re^{i\theta})$ 的切线角满足 $\beta'(\theta)>0$（`lens.tex:68`），绕一圈增 $2\pi$（`lens.tex:69`）。单连通性的论证我在 `lens.tex:72-85` 读成一个纯几何步骤：在固定 $\theta_0$ 处把曲线投到右单位法线上，投影的导数符号由 $-\sin(\beta(\theta)-\beta(\theta_0))$ 控制（`lens.tex:74-75`），切线转过 $\pi$ 之前为负、之后为正，故 $\theta_0$ 是唯一极大点。逐点得到"每个曲线点都是其凸包在对应法方向上的唯一支撑点"，配合调和极大原理与辐角原理（`lens.tex:82-85`），$F$ 在每个 $r\mathbb D$ 上是双全纯。$r\uparrow1$ 穷竭给出 $F$ 在 $\mathbb D$ 上单叶、$D$ 凸、$g=F^{-1}$ 全纯。

边界计算：右半圆 $z=e^{is}$，$-\pi/2<s<\pi/2$，`lens.tex:100-102` 给出 $\frac{1+iz}{1-iz}=\frac{i\cos s}{1+\sin s}$、$\Re w=\frac\pi4$、$\Im w=\frac12\operatorname{arctanh}(\sin s)$。对边界值求导即 `eq:lens-width-curvature` 之前的 $t'(s)=\frac2\pi$，结合 $t(0)=0$ 得 $t(s)=\frac{2s}\pi$。定义 $\lambda(t)=v(\pi t/2)$ 并按连续性延到 $[-1,1]$。$F(\pm i)$ 由级数只含奇次幂而为纯虚，故 $\lambda(\pm1)=0$。$\lambda''(t)=-\sec\frac{\pi t}2<0$ 给严格凹，端点 $0$ 与内部严格凹合起来给内部严格正。法向：共轭对称使 $\lambda$ 为偶函数，左半圆描出 $v=-\lambda(t)$。纵坐标在每条半圆上以恒定绝对速度 $2/\pi$ 走完 $[-1,1]$，两条半圆各占概率 $1/2$，`eq:lens-boundary-law` 得证。

**(c) 常数与假设的机械理由。** 系数 $8/\pi^2$ 是 $F'(0)$，也是 $F(1)=\frac8{\pi^2}\sum_j\frac{(-1)^j}{(2j+1)^2}$ 的归一化；`simplex.tex:157` 明确说那里的下界估计 "uses the alternating series for $F(1)$"。$(-1)^j$ 与 $(2j+1)^{-2}$ 是"只保留奇次幂 + 绝对收敛到边界"两个要求的交集：奇次保证 $F$ 为奇函数、$F(\pm i)$ 纯虚；平方衰减保证 $\overline{\mathbb D}$ 上一致收敛（`lens.tex:20`），于是边界值可代入。$\frac{2}\pi$ 这个速度决定了 $T$ 的密度：$s$ 均匀在 $(-\pi/2,\pi/2)$（半圆各 $1/2$ 概率），$t=2s/\pi$ 把区间线性映到 $[-1,1]$，所以 $T$ 均匀。$\operatorname{arctanh}$ 的必要性来自 $\Im\arctan$ 的表达式；$\lambda''=-\sec(\pi t/2)$ 在 $t\to\pm1$ 时发散到 $-\infty$，这直接是 §13 端点渐近里那个对数因子 $\log(1/\eta)$ 的来源（曲率不可积地大）。成对非比例、张成这些行假设在本节还没登场，在 `feasibility.tex:10-11` 才登场。`lens.tex:135` 那句 "$s_0=\pi/6$ and $t_0=1/3$" 只是配图取点，与 $t=2s/\pi$ 完全一致，$2(\pi/6)/\pi=1/3$。

**(d) 失败路线。** `[推测]` 用半平面或条带的共形像：条带的边界纵坐标当然是均匀的，但 $\lambda$ 会退化成常数，`eq:lens-width-curvature` 的严格凹性消失，§9 的"额外边界等式零测度"依赖 $\lambda'$ 严格单调（`feasibility.tex:165-166`）就废了。`[推测]` 用保面积映射替代共形映射：`feasibility.tex:54-56` 的 $h_j^k=g(b_jz)^k$ 需要 $g$ 全纯，才有 `holomorphic-mass.tex:64-71` 的 psh 性，非共形则质量下界不存在。`[推测]` 把 $\lambda$ 直接指定为一个漂亮的初等函数（例如 $\lambda(t)=1-t^2$）：那样 `eq:lens-boundary-law` 不成立，因为 $F$ 的边界纵坐标就不再均匀，而整个"概率等于体积"的换算（`simplex.tex:66-82`）恰好只用了这条边界律。

## 6 端点标度：$\eta\log(1/\eta)$ 这个"坏"退化其实是唯一的可用速率

`lem:lens-endpoint` 只有 12 行正文，但它是全篇等号侧的开关。

**(a) 逐字引用。** `lens.tex:145-155`：

> \begin{lemma}[Endpoint scaling]\label{lem:lens-endpoint}
> As $\eta\downarrow0$,
> \begin{equation}\label{eq:lens-endpoint-asymptotic}
>  \lambda(1-\eta)=\frac2\pi\eta\log\frac1\eta+O(\eta).
> \end{equation}
> For every $0<a\leq b<\infty$,
> \begin{equation}\label{eq:lens-endpoint-ratio}
>  \sup_{a\leq c\leq b}
>  \left|\frac{\lambda(1-\delta c)}{\lambda(1-\delta)}-c\right|
>  \longrightarrow0\qquad(\delta\downarrow0).

证明的两句关键中间量在 `lens.tex:160-164`：

> $\operatorname{arctanh}(\cos x)=\log\cot(x/2)$ give
>  \lambda(1-\eta)=\frac2\pi\int_0^\eta
>                    \log\cot\frac{\pi s}{4}\,ds.

以及 `lens.tex:165`：

> Here $\log\cot(\pi s/4)=\log(1/s)+O(1)$ uniformly as $s\downarrow0$.

和 `lens.tex:169-171`：

> =c\,\frac{L-\log c+O(1)}{L+O(1)}
>  =c+O_{a,b}(L^{-1})

**(b) 中间步骤。** 我从 `eq:lens-width-curvature` 反推这个积分式。$\lambda(1)=0$，所以 $\lambda(1-\eta)=-\int_{1-\eta}^{1}\lambda'(t)\,dt=\frac2\pi\int_{1-\eta}^{1}\operatorname{arctanh}\bigl(\sin\frac{\pi t}2\bigr)dt$。换元 $t=1-s$，则 $\sin\frac{\pi(1-s)}2=\cos\frac{\pi s}2$，积分限变为 $s$ 从 $0$ 到 $\eta$，得到 $\frac2\pi\int_0^\eta\operatorname{arctanh}(\cos\frac{\pi s}2)\,ds$。用 `lens.tex:160` 的恒等式（取 $x=\frac{\pi s}2$）：$\operatorname{arctanh}(\cos x)=\frac12\log\frac{1+\cos x}{1-\cos x}=\frac12\log\frac{2\cos^2(x/2)}{2\sin^2(x/2)}=\log\cot\frac x2$，于是被积函数正是 $\log\cot\frac{\pi s}4$。

第二层：$\cot\frac{\pi s}4=\frac{4}{\pi s}+O(s)$，所以 $\log\cot\frac{\pi s}4=\log\frac1s+\log\frac4\pi+O(s^2)$，这就是 `lens.tex:165` 那句 $O(1)$ 一致余项。积分 $\int_0^\eta\log\frac1s\,ds=\eta\log\frac1\eta+\eta$（分部积分，$\int\log(1/s)\,ds=s\log(1/s)+s$），余项 $\int_0^\eta O(1)\,ds=O(\eta)$，合起来给出 `eq:lens-endpoint-asymptotic`。

第三层比值：记 $L=\log\frac1\delta$。分子 $\lambda(1-\delta c)=\frac2\pi\delta c\bigl(\log\frac1{\delta c}+1+O(1)\bigr)=\frac2\pi\delta c(L-\log c+O(1))$，分母 $\lambda(1-\delta)=\frac2\pi\delta(L+O(1))$。相除时 $\frac2\pi$、$\delta$ 全部消掉，剩下 $c\frac{L-\log c+O(1)}{L+O(1)}$。对 $c\in[a,b]$ 有 $|\log c|\le\max(\log\frac1a,\log b)$，一个与 $c$ 无关的常数，于是逐项一致地是 $c+O_{a,b}(L^{-1})$，$L\to\infty$ 即得 `eq:lens-endpoint-ratio`。

**(c) 常数与指数的机械理由。** 前置条件 "$0<a\le b<\infty$" 在下游被逐字用到：`median.tex:81-82` 说 "The factors $1-\sigma\langle b,u\rangle$ belong to $[1-p_K(u),1+p_K(u)]$，a compact subinterval of $(0,\infty)$."。因为 $u\in\operatorname{int}K$ 有 $p_K(u)<1$，故下界 $1-p_K(u)>0$，上界 $1+p_K(u)<2$，正好形如 $[a,b]\subset(0,\infty)$。若 $a=0$，$\log c$ 无界，$O_{a,b}(L^{-1})$ 就不一致；$b=\infty$ 同理。$\frac2\pi$ 只出现在分子分母各一次并相消，这解释了为什么端点论证对 $\lambda$ 的整体标度完全不敏感，只对"线性速率"敏感。$\eta\log\frac1\eta$ 里 $1$ 次幂是关键：$\frac{\lambda(1-\eta)}{\eta}=\frac2\pi\log\frac1\eta\to\infty$，即 $\lambda$ 比线性慢、比任何 $\eta^\beta$（$\beta>1$）快，这个中间位置使比值极限恰好是 $c$ 一次幂。$O(\eta)$ 项被 $L$ 除以后进入 $O(L^{-1})$，因为它相对主项是 $O(1/L)$。Lean 侧对应的入口是 `Lens.lean:946` 的 `lensWidth_endpoint_scaling`，被 `EqualityMedians.lean:600` 的 `medians_of_equality` 当作参数传给 `metricMedians_of_optimal_lift`，那里它就是"端点比较"这一整步的全部输入。

**(d) 失败路线。** `[推测]` 若 $\lambda(1-\eta)\sim C\eta^\beta$ 且 $\beta\ne1$，则比值极限为 $c^\beta$，`median.tex:96-97` 的"归一化成本 $\ge p-h_{D_0}(u)-p\varepsilon_u(\delta)$"就不再线性，取到的是 $h_{D_0}$ 的 $\beta$ 次幂型不等式，凸分离一步（`median.tex:120-126`）无法给出 $D_0+(s-p)Q$ 这种加性形式。`[推测]` 若 $\lambda(1)>0$（例如把宽度改成处处正的 $1-t^2$ 再归一化），端点没有退化，$\sigma=+1$ 与 $\sigma=-1$ 两组行的成本相同，`zero-deficit.tex:63-66` 那句"the endpoint behavior of $\lambda$ makes the two signs contribute differently"就落空，中位数聚合 $r_\pm$（`median.tex:68`）无法分离。`[推测]` 若只有逐点 $c$ 收敛而没有 $[a,b]$ 上的一致收敛，`median.tex:96` 那个对 $i$ 求和的成本 $\sum_i\alpha_i\lambda(\cdot)$ 就换不了极限，因为每一项的 $c_i=1-\sigma_i\langle b_i,u\rangle$ 随 $i$ 和 $\delta$ 都在变。

## 7 孤立全纯零点处的质量：$(\pi k)^d/d!$ 从哪来

`holomorphic-mass.tex` 7,496 B，是全篇解析强度最高的一节，也是我最久才读懂的一节。

**(a) 逐字引用。** 结论 `holomorphic-mass.tex:49-54`（`eq:holomorphic-minor-mass`）：

> \int_{\{\tau<1\}}
>  \sum_{\substack{I\subset\{1,\ldots,N\}\\|I|=d}}
>  \left|\det\left(\frac{\partial f_i}{\partial z_j}\right)_{
>                        i\in I,\ 1\leq j\leq d}\right|^2\,dV
> \geq \frac{(\pi k)^d}{d!}.

假设 `holomorphic-mass.tex:38-46`：

> \item $f^{-1}(0)=\{0\}$;
> \item for an integer $k\geq1$,
> $f(z)=H(z)+O(|z|^{k+1})\quad\text{near }0,$
> where each component of $H$ is a homogeneous polynomial of degree $k$
> and $H(z)\ne0$ whenever $z\ne0$;
> \item for every $0<s<1$, the set
> $\{z\in\mathcal U:|f(z)|^2\leq s\}$ is compact in $\mathcal U$.

归一化约定在 `holomorphic-mass.tex:20-27`：

> d^c=\frac{i}{4}(\bar\partial-\partial),
> \qquad dd^c=\frac{i}{2}\partial\bar\partial.

> dd^c|z|^2=\sum_{j=1}^d dx_j\wedge dy_j,
> \qquad
> (dd^cv)^d=d!\det(v_{\bar z_i z_j})\,dV.

**(b) 中间步骤。** 我的读法分五步。第一步（`holomorphic-mass.tex:63-71`）确认 $\tau=|f|^2$ 与 $\log\tau$ 在 $0$ 外都有关复 Hessian 半正定：$\tau$ 的是 $Z^*Z$，$\log\tau$ 的是那个由 Cauchy-Schwarz 控制的分式，即 `holomorphic-mass.tex:68-69` 的 $\frac{|f|^2|df(\xi)|^2-|\langle df(\xi),f\rangle|^2}{|f|^4}\geq0$。第二步取正则值 $s$，$\overline{E_s}$ 是带边紧光滑流形，Stokes 给出 $\int_{E_s}(dd^c\tau)^d=\int_{\partial E_s}d^c\tau\wedge(dd^c\tau)^{d-1}$，配合 $d^c\log\tau=\tau^{-1}d^c\tau$ 与 $dd^c\log\tau=\tau^{-1}dd^c\tau-\tau^{-2}d\tau\wedge d^c\tau$ 以及 $d\tau$ 在 $\partial E_s$ 上拉回为零，得到 `eq:mass-level-flux`：$s^{-d}\int_{E_s}(dd^c\tau)^d=\int_{\partial E_s}\gamma\wedge(d\gamma)^{d-1}$，其中 $\gamma=d^c\log\tau$。第三步在 $E_s\setminus\overline{B_\varepsilon}$ 上再做一次 Stokes，得 `eq:mass-punctured-flux`，右端 $(dd^c\log\tau)^d$ 非负，故球面通量给出下界。第四步处理 $\varepsilon\downarrow0$：$\varepsilon^{-2k}\tau(\varepsilon z)\to T(z)=|H(z)|^2$ 于含 $S$ 的闭环域上按 $C^2$，因 $T$ 在该环域严格正，对数也 $C^2$ 收敛，加法常数 $2k\log\varepsilon$ 在 $d^c$ 下消失，于是 `eq:mass-homogeneous-limit` 成立。第五步是我最喜欢的一个技巧：把 $\alpha=d^c\log T|_S$ 与 $k\alpha_0$（$\alpha_0=d^c\log|z|^2|_S$）用 $\alpha_t=k\alpha_0+t\beta$ 连成道路，$\beta=d^c(\log T-k\log|z|^2)|_S$。齐次性与共相位不变性给出 $\beta(V)=0$、$\alpha_0(V)=\frac12$（$V(z)=iz$），且每个 $\alpha_t$ 沿 $V$ 的流不变；Cartan 恒等式 $\iota_Vd\alpha_t=\mathcal L_V\alpha_t-d(\alpha_t(V))=0$（`holomorphic-mass.tex:148-150`）说明 $d\alpha_t$ 有非退化的零方向 $V$，于是 $d$ 次外幂 $(d\alpha_t)^{d-1}$ 与 $\beta$ 的楔积在 $2d-1$ 维球上收缩为零，$\beta\wedge(d\alpha_t)^{d-1}=0$。分部积分使通量对 $t$ 的导数为 $0$，故 $\int_S\alpha\wedge(d\alpha)^{d-1}=\int_S k\alpha_0\wedge(dk\alpha_0)^{d-1}=k^d\int_S\alpha_0\wedge(d\alpha_0)^{d-1}$。最后一次 Stokes 与 `eq:mass-volume-normalization`：$k^d\int_{\{|z|<1\}}(dd^c|z|^2)^d=k^d d!\operatorname{vol}_{2d}(\{|z|<1\})=(\pi k)^d$（`holomorphic-mass.tex:167-171`）。收尾是 Sard 提供趋于 $1$ 的正则值列 + 单调收敛 + Cauchy-Binet：$(dd^c\tau)^d=d!\sum_{|I|=d}|\det Z_I|^2dV$（`holomorphic-mass.tex:188-189`），除以 $d!$ 即得 `eq:holomorphic-minor-mass`。

**(c) 常数与指数的机械理由。** $N\ge d$ 是行列式子式求和 $\sum_{|I|=d}$ 非空的前提；$N=d$ 时求和只剩一项，$|\det Z|^2$ 就是全部。$k$ 为整数 $\ge1$ 是因为下游要 $h_j^k$ 单值全纯，分数幂需要分支。$\operatorname{vol}_{2d}(\{|z|<1\})=\pi^d/d!$ 是 $\mathbb R^{2d}$ 单位球体积公式 $\frac{\pi^m}{m!}$ 在 $m=d$ 处的取值，所以 $d!\cdot\operatorname{vol}=\pi^d$，$(\pi k)^d$ 与 $d!$ 的组合刚好把"球体积"与"$d$ 次外幂"两个来源分离干净。$\frac12$ 这个 $\alpha_0(V)$ 的值来自约定 $d^cv(\xi)=-\frac14dv(i\xi)$（`holomorphic-mass.tex:23`）：取 $v=\log|z|^2$、$\xi=V(z)=iz$，则 $i\xi=-z$，$dv(-z)=-2$，$-\frac14(-2)=\frac12$。若把 $d^c$ 的系数从 $\frac i4$ 改成 $\frac i{2\pi}$ 之类的常见选择，最后通量就带 $\pi$ 的幂差，`feasibility.tex:118-119` 那个 $\frac{\pi^d}{d!}$ 相消就会失败。假设三（子水平集在 $\mathcal U$ 内紧）服务于两处：$\overline{E_s}$ 是有边流形从而 Stokes 可用，以及 $B_\varepsilon\subset E_s$ 的取法合法。假设一（唯一零点）保证 $\log\tau$ 在 $E_s\setminus\{0\}$ 光滑。假设二的齐次首项 $H$ 无零点是 $\varepsilon^{-2k}\tau(\varepsilon z)$ 在环域上严格正的前提，也是对数收敛的前提。

**(d) 失败路线。** `[推测]` 试图用$L^2$ 估计或 $\bar\partial$ 手段替代 Stokes：那样得到的是带损失常数的不等式，$(\pi k)^d/d!$ 的精确性没了，而 §8 的 $S\ge1$ 要求左右两边精确匹配 $\pi^d/d!$。`[推测]` 直接在 $E_s$ 上用 $f$ 的映射度算 $\int(dd^c\tau)^d$：当 $H$ 不是线性同构时，映射度论证只给重数，给不了 Jacobi 子式的 $L^2$ 范数之和，而下游要的正是子式之和（`feasibility.tex:74-76` 的 $M_{I,k}$ 按基 $I$ 分开）。`[推测]` 把道路 $\alpha_t$ 取成 $t\alpha+(1-t)k\alpha_0$ 以外的插值（例如在 $T$ 上乘一个正函数）：$\beta(V)=0$ 会失效，$(d\alpha_t)^{d-1}\wedge\beta$ 不再为零，通量对 $t$ 的导数非零，第五步整段崩掉。

## 8 边界可行性：$S=\sum_{I\in\mathcal B}P_I\ge1$

`feasibility.tex` 8,559 B。这是把 §7 的质量引理真正"消费"掉的地方，$k\to\infty$ 与径向换元是全部机关。

**(a) 逐字引用。** 结论 `feasibility.tex:36-42`（`lem:holomorphic-feasibility`）：

> \begin{lemma}[Boundary feasibility]\label{lem:holomorphic-feasibility}
> Let $d\ge1$ and let $b_1,\ldots,b_m$ be nonzero real rows spanning
> $(\R^d)^*$. Let $F:\mathbb D\to D$ be a biholomorphism onto a bounded
> planar domain, continuous on $\overline{\mathbb D}$, with $F(0)=0$.
> Then the sum $S$ in \eqref{eq:feasible-probabilities} satisfies $S\ge1$.
> No condition on extra-row boundary equalities or on dependent row
> subsets is required.

概率的定义 `feasibility.tex:28-31`（`eq:feasible-probabilities`）：

>  Z_I(\theta)=B_I^{-1}\bigl(F(e^{i\theta_i})\bigr)_{i\in I},
>  \qquad
>  P_I=\mathbb P\{b_jZ_I(\theta)\in\overline D\text{ for all }j\},
>  \qquad S=\sum_{I\in\mathcal B}P_I,

质量到径向的两步 `feasibility.tex:72-73` 与 `feasibility.tex:94-95`：

>  \sum_{I\in\mathcal B}M_{I,k}\geq
>  k^d\frac{\pi^d}{d!},\qquad

>  k^2|u_i|^{2k-2}\,dV_2(u_i)
>        =k\rho_i\,d\rho_i\,d\theta_i,

以及 `feasibility.tex:108-109`：

> The measure in this integral is finite: its total mass is the volume
> $\pi^d/d!$ of the unit ball in $\C^d$.

和 `feasibility.tex:118-119`：

>  \limsup_{k\to\infty}\frac{M_{I,k}}{k^d}
>  \leq \frac{\pi^d}{d!}P_I.

**(b) 中间步骤。** 取 $g=F^{-1}$，$\Omega=\{z\in\C^d:b_jz\in D\ \forall j\}$，$h_j=g(b_jz)$，对 $f_k=(h_1^k,\ldots,h_m^k)$、$\tau_k=\sum_j|h_j|^{2k}$ 用 `lem:holomorphic-mass`（`feasibility.tex:46-56`）。三条假设的验证是这段的核心：$g$ 只在 $0$ 处为零且行张成，故 $f_k^{-1}(0)=\{0\}$；$c=g'(0)\ne0$，$f_k$ 的 $k$ 次齐次首项是 $((cb_1z)^k,\ldots,(cb_mz)^k)$，它在 $z\ne0$ 时非零，因为存在 $j$ 使 $b_jz\ne0$；$\{\tau_k\le s\}$ 紧是因为每个行坐标落在固定紧集 $F(\{|w|\le s^{1/(2k)}\})\subset D$ 内，一组行把 $z$ 界定住，取极限保留全部包含与不等式 $\tau_k\le s$（`feasibility.tex:64-68`）。$h_j^k$ 的导数行是 $b_j$ 的标量倍，故相关行子集的子式为 $0$，求和自动只剩 $\mathcal B$，这就是 `eq:feasibility-mass`。

固定 $I$，换元 $u_i=h_i(z)$ 一对一，逆为 $z=B_I^{-1}(F(u_i))$；$M_{I,k}$ 里的平方行列式等于复 Jacobi 因子乘 $k^{2d}\prod_i|u_i|^{2k-2}$。积分域被放大到 $\{u\in\mathbb D^d:\sum_{i\in I}|u_i|^{2k}<1,\ b_jB_I^{-1}(F(u_i))\in D\ \forall j\}$ 用于上界。再令 $u_i=\rho_i^{1/k}e^{i\theta_i}$，由 $k^2|u_i|^{2k-2}dV_2(u_i)=k\rho_i d\rho_i d\theta_i$，$k^{2d}$ 与 $d$ 个 $k^2$ 因子正好相消成 $k^d$，除以 $k^d$ 后得 `eq:feasibility-radial`。总质量我实地算过：$\int_{\sum\rho_i^2<1}\prod_i\rho_i\,d\rho_i\,d\theta_i$，令 $s_i=\rho_i^2$，$\rho_i d\rho_i=\frac12 ds_i$，$\theta$ 积出 $(2\pi)^d$，单纯形 $\{s_i>0,\sum s_i<1\}$ 体积 $\frac1{d!}$，合计 $(2\pi)^d\cdot2^{-d}\cdot\frac1{d!}=\frac{\pi^d}{d!}$，与 `feasibility.tex:108-109` 吻合。逐点收敛：$\rho_i>0$ 时 $\rho_i^{1/k}\to1$，$F$ 在闭盘连续使推断点趋于 $Z_I(\theta)$；若某极限行坐标在 $\overline D$ 外，则该约束对所有充分大的 $k$ 失败，故上极限的指示函数被 $P_I$ 事件的指示函数控制。有限测度、函数被 $1$ 控制，Fatou 的上限形式给出 $\limsup M_{I,k}/k^d\le\frac{\pi^d}{d!}P_I$。基有限，三行链式不等式（`feasibility.tex:123-130`）给出 $\frac{\pi^d}{d!}\le\frac{\pi^d}{d!}S$，即 $S\ge1$。

**(c) 常数与指数的机械理由。** $k^d$ 这个标度在两边同时出现：`holomorphic-mass.tex:54` 的 $(\pi k)^d/d!=k^d\cdot\pi^d/d!$ 提供左边，换元里 $d$ 个坐标各贡献一个 $k$（因为 $k^2|u|^{2k-2}dV_2(u)=k\rho d\rho d\theta$）提供右边，两边相消后剩下的正是 $\pi^d/d!$；这就是 `holomorphic-mass.tex:6-8` 那句 "the mass bound grows as the $d$th power of their exponent, matching the radial rescaling" 的全部含义。$u_i=\rho_i^{1/k}e^{i\theta_i}$ 里用 $\rho^{1/k}$ ，并非常规 $\rho$，是为了让 $|u_i|^{2k}=\rho_i^2$，从而 $\sum_i|u_i|^{2k}<1$ 变成固定的球 $\sum\rho_i^2<1$，域与 $k$ 无关；否则 Fatou 无法在固定测度空间上用。$\overline D$（闭）出现在 $P_I$ 的定义里，是因为上极限的指示函数只被"闭事件"控制，开区间版本会给不出不等式方向。$F(0)=0$ 保证 $g(0)=0$，即 $f_k(0)=0$，唯一零点假设才成立。"No condition on extra-row boundary equalities" 这句被我标出来，因为它是 §9 存在的全部理由：$S\ge1$ 允许边界等式，`simplex.tex` 的体积恒等式不允许重复计数。

**(d) 失败路线。** `[推测]` 用控制收敛替代 Fatou：指示函数列 $\mathbf1\{\cdot\in D\}$ 的极限只给上半连续控制，逐点极限不存在（约束可能在边界上振荡），换成 Fatou 方向就反了，得到 $S\le1$ 这种无用的东西。`[推测]` 不放大积分域、直接用真实域：真实域包含额外的"$b_jB_I^{-1}(F(u_i))\in D$"约束，它随 $k$ 变化且无法显式积分，只有放大为 $\mathbb D^d\cap\{\sum|u_i|^{2k}<1\}$ 才给出上界，而我们要的正是上界。`[推测]` 让 $k$ 只作用于单个坐标（例如只对 $j\notin I$ 的坐标取幂）：那样 $k^d$ 与径向换元不再匹配，两边标度对不上，$S\ge1$ 变成 $S\ge c_k$ 且 $c_k$ 发散或趋于 $0$。`[推测]` 想省略"相关行子集子式为 $0$"这一句而把求和扩到所有 $d$ 元子集：`eq:feasibility-mass` 左边会多出零项，看似无害，但下游 `simplex.tex:117` 的 $\sum_{I\in\mathcal B}$ 与 $D_I=|\det B_I|$ 相乘时 $D_I=0$ 会污染 $\Sigma_X$ 的体积求和定义。

## 9 额外边界等式是零测事件：$\lambda'$ 严格单调在这里付账

这一节我在第一遍读时完全跳过了，直到 `simplex.tex:85-92` 出现"a single null set removes all these equalities"才回头找它的出处。

**(a) 逐字引用。** `feasibility.tex:148-156`（`lem:boundary-ties`）：

> \begin{lemma}[Additional boundary equalities have probability zero]
> \label{lem:boundary-ties}
> Let $F:\mathbb D\to D$ be the lens map of Lemma~\ref{lem:planar-lens}.
> Assume that the nonzero spanning rows $b_1,\ldots,b_m$ are pairwise
> nonproportional. For every $I\in\mathcal B$ and $j\notin I$,
> \[
>  \mathbb P\{b_jZ_I(\theta)\in\partial D\}=0.
> \]

化简约束的段落 `feasibility.tex:140-144`：

> We may also require that no two rows are
> proportional. For any finite strip presentation this is achieved without
> changing $A$ by keeping, on each row line, a row of largest magnitude;
> its strip implies all the discarded strips on that line. Zero rows, if
> present initially, impose no constraint and are discarded.

与 `feasibility.tex:159-161`：

> Write $b_jB_I^{-1}=(c_i)_{i\in I}$. At least two coefficients, say
> $c_a,c_b$, are nonzero; otherwise $b_j$ would be proportional to a basis
> row.

以及 `feasibility.tex:164-166`：

> Their tangent directions have at most one occurrence on each branch for
> any fixed unoriented line direction, because $\lambda'$ is strictly
> monotone.

**(b) 中间步骤。** 固定除 $\theta_a,\theta_b$ 之外的全部相位，考察映射 $(\theta_a,\theta_b)\mapsto c_a\gamma(\theta_a)+c_b\gamma(\theta_b)+\sum_{i\ne a,b}c_i\gamma(\theta_i)$，$\gamma(\theta)=F(e^{i\theta})$。它的实 Jacobi 行列式是 $\det(c_a\gamma'(\theta_a),c_b\gamma'(\theta_b))$（`feasibility.tex:175-176`）。这个行列式为零当且仅当两条切向量共线，即 $\gamma'(\theta_a)$ 与 $\gamma'(\theta_b)$ 方向相同或相反。对固定的一个非端点相位 $\theta_a$，$\gamma'(\theta_a)$ 给出一个无向直线方向；边界由两支光滑正则弧 $(\pm\lambda(t),t)$（$-1<t<1$）加上两个端点 $\pm i$ 组成，而 $\lambda''<0$（`eq:lens-width-curvature`）使 $\lambda'$ 严格单调，于是每支上该方向至多出现一次。故零集在 $(\theta_a,\theta_b)$ 平面上是有限条竖线与有限条横线的并，加上被排除的两条端点线，平面测度为 $0$（`feasibility.tex:177-179`）。零集之外由反函数定理得到局部微分同胚卡；取可数子覆盖，每个卡内逆映射局部 Lipschitz，把平面零集映为平面零集。$\partial D$ 本身是平面零集（可数个紧光滑子弧加两个点，`feasibility.tex:184-185`，`lens.tex:142-143` 也独立指出过），其原像在剩下两个相位上测度为 $0$，最后对固定的相位再用一次 Fubini。

**(c) 常数与指数的机械理由。** "至少两个系数非零"是这条论证的支点：若 $b_jB_I^{-1}$ 只有一个非零分量 $c_a$，则 $b_j=c_ab_a$，被排除的正是"成对成比例"假设。$j\notin I$ 也关键，$j\in I$ 时 $b_jZ_I=F(e^{i\theta_j})$ 恒在 $\partial D$ 上，概率为 $1$。化简约束那一步不改 $A$：同一行线上取模最大的行 $b$，条带 $\{|bX|\le1\}$ 包含所有被丢掉条带，故交不变；零行加进来不约束任何东西。$n=1$（这里是 $d=1$）时约化表只剩一行，$\mathcal B$ 里每个 $I$ 等于全指标集，$j\notin I$ 无从谈起，`feasibility.tex:145-146` 单独把这一维交代掉。$\lambda'$ 严格单调等价于 $\lambda''<0$ 处处成立，而 $\lambda''(t)=-\sec\frac{\pi t}2$ 在 $(-1,1)$ 上严格负且无零点，这个具体形式让"至多一次出现"变成一行验算；若 $\lambda$ 只是凹而含线性段，一段区间上的切方向相同，零集就带上二维条带，论证失效。

**(d) 失败路线。** `[推测]` 想用 Sard 定理直接说"$b_jZ_I$ 关于 $\theta$ 的临界值集零测"：这里目标是固定的曲线 $\partial D$（一维对象在二维值域里），Sard 给的是正则值条件，形式对不上；实际用的是"逆像零测"方向，靠 Jacobi 行列式非零 + 局部 Lipschitz。`[推测]` 省略端点 $\pm i$ 的处理，直接在闭弧上用反函数定理：端点处 $\gamma'$ 不存在（$\lambda$ 在 $\pm1$ 归零且 $\lambda''$ 发散），把端点线并入零集需要显式说明，`feasibility.tex:178-179` 那句 "including the excluded endpoint lines" 就是补这一笔。`[推测]` 把结论加强成"$b_jZ_I$ 的分布有密度"：当两行的方向恰好满足某种共振时，和的分布可以带奇异部分，而这里只需要 $\partial D$ 的原像零测，加强版本会引入我根本用不上的额外假设。

## 10 实单纯形恒等式：$1\le S=\frac{d!}{4^d}\int_A|\Sigma_X|\,dX$

`simplex.tex` 9,951 B，是全篇的中枢：左边接 §5-§9 的解析机器，右边开出 §12 的等号论证。

**(a) 逐字引用。** `simplex.tex:46-61`（`prop:simplex-integral`）：

> \begin{proposition}[Feasible-simplex identity]\label{prop:simplex-integral}
> Let $b_1,\ldots,b_m$ be nonzero, pairwise nonproportional real rows
> spanning $(\R^d)^*$, and let $F,D,\lambda$ be as in
> Lemma~\ref{lem:planar-lens}. With $A$, $S$, and $\Sigma_X$ defined in
> \eqref{eq:strip-body}, \eqref{eq:feasible-probabilities}, and
> \eqref{eq:feasible-simplex-union}, respectively,
> \begin{equation}\label{eq:simplex-integral}
>  1\leq S
>    =\frac{d!}{4^d}\int_A|\Sigma_X|\,dX
>    \leq\frac{d!}{4^d}|A|\,|A^\circ|.

定义部分 `simplex.tex:27-30`（`eq:feasible-simplex-union`）：

>  T_{I,\epsilon}=\operatorname{conv}
>                   \bigl(0,\{\epsilon_i b_i:i\in I\}\bigr),
>  \qquad
>  \Sigma_X=\bigcup_{(I,\epsilon)\text{ feasible at }X}T_{I,\epsilon},

以及 `simplex.tex:116-118`（`eq:simplex-volume-sum`）：

>  d!\,|\Sigma_X|
>        =\sum_{I\in\mathcal B}\sum_{\epsilon\in\{-1,1\}^I}
>                  D_I\,\mathbf1\{(I,\epsilon)\text{ is feasible at }X\}.

概率到实积分那一步 `simplex.tex:80-82`（`eq:probability-real-integral`）：

>  P_I=\frac{D_I}{4^d}\int_A
>        \sum_{\epsilon\in\{-1,1\}^I}
>          \mathbf1\{(I,\epsilon)\text{ is feasible at }X\}\,dX.

**(b) 中间步骤。** 第一步把概率翻译成实积分。按 `eq:lens-boundary-law`，每个活跃边界坐标的分布是 $\epsilon_i\lambda(t_i)+it_i$，$t_i$ 在 $[-1,1]$ 均匀、$\epsilon_i$ 独立等概率符号，故固定符号选择的联合测度是 $4^{-d}dt_I$（`simplex.tex:67-69`；分母 $4^d$ 来自 $2^d$ 个符号各占 $2^{-d}$ 与长度 $2$ 的区间各贡献 $2$，即 $(2\cdot2)^d=4^d$）。把推断出的复向量写成 $Y+iX$，则 $t_I=B_IX$、$Y=Y_{I,\epsilon}(X)=B_I^{-1}(\epsilon_i\lambda(b_iX))_{i\in I}$（`simplex.tex:20-22`）。"$b_jZ\in\overline D$ 对所有 $j$"翻译成实条件正是 $X\in A$ 与 $Y\in L_X$（$L_X$ 见 `eq:real-feasibility-body`，`simplex.tex:11-12`），差别只在边界 $\partial A$，而 $\partial A$ 含于有限个超平面 $b_jX=\pm1$，测度为 $0$。换元 $t_I=B_IX$ 的 Jacobi 行列式绝对值是 $D_I$，得 `eq:probability-real-integral`。

第二步去重。对几乎每个 $X\in\operatorname{int}A$，任何可行对 $(I,\epsilon)$ 在 $I$ 之外没有紧约束（`simplex.tex:85-92`，用 `lem:boundary-ties`）。在此零集外，若两对共享同一向量 $Y$：基不同时共享向量对其中一个基有基外紧行；基同而某符号不同时该向量同时满足 $\epsilon_ib_iY=\lambda(b_iX)$ 与 $-\epsilon_ib_iY=\lambda(b_iX)$，而 $\lambda(b_iX)>0$（$b_iX\in(-1,1)$ 因 $X\in\operatorname{int}A$），矛盾。

第三步证内部不交。取 $e\in\operatorname{int}T_{I,\epsilon}$，$e=\sum_{i\in I}\alpha_i\epsilon_ib_i$，全部 $\alpha_i>0$、$\sum\alpha_i<1$。对任意 $Y\in L_X$，$eY\le\sum_{i\in I}\alpha_i\lambda(b_iX)$，且等号在 $Y_{I,\epsilon}(X)$ 处取得；取等迫使全部独立方程 $\epsilon_ib_iY=\lambda(b_iX)$ 成立，所以 $Y_{I,\epsilon}(X)$ 是线性泛函 $e$ 在 $L_X$ 上的唯一极大点（`simplex.tex:100-112`）。两个可行单纯形若有共同内点，同一个 $e$ 会有两个不同唯一极大点，矛盾。每个单纯形体积 $\frac{D_I}{d!}$（以 $0$ 与 $d$ 个行为顶点的平行体是 $\det$ 的绝对值，单纯形除以 $d!$），边界零测，故 `eq:simplex-volume-sum`。

第四步合并。对每对 $(I,\epsilon)$，可行性是 $\operatorname{int}A$ 上连续函数之间有限多个闭不等式，所以 $\{(X,e):X\in\operatorname{int}A,\ e\in\Sigma_X\}$ 是有限个"Borel 可行集 $\times$ 固定闭单纯形"之并；Fubini 使 $X\mapsto|\Sigma_X|$ 可测且被 $|C|$ 界定（`simplex.tex:121-129`）。把 `eq:probability-real-integral` 对 $I$ 求和，套 `eq:simplex-volume-sum`，再用 `lem:holomorphic-feasibility` 的 $S\ge1$，得 `eq:simplex-integral` 的等号与下界；$\Sigma_X\subset C=A^\circ$ 给上界。亏量的精确表达在 `simplex.tex:136-139`：$\int_A(|C|-|\Sigma_X|)dX=|A|\,|C|-\frac{4^d}{d!}S$，非负由包含，上界由 $S\ge1$，这就是 `eq:simplex-deficit`。

第五步是我特别喜欢的一个反例核对，`simplex.tex:145-158`：取 $b_1=(1,0)$、$b_2=(1/2,\sqrt3/2)$、$b_3=b_2-b_1$、$X=0.9(1,1/\sqrt3)$，则 $b_1X=b_2X=0.9$、$b_3X=0$，记 $a=\lambda(0.9)$，用端点积分与 $\cot x<1/x$（$0<x<\pi/2$）得

>  a<\frac{\log(40/\pi)+1}{5\pi}<\frac4{15},
>   \qquad
>   \lambda(0)>\frac8{\pi^2}\left(1-\frac19\right)
>              >\frac{32}{45}.

于是 $2a<\lambda(0)$，第三条条带在 $L_X$ 中严格冗余（`simplex.tex:158-159`），四个见证 $Y_{\epsilon_1\epsilon_2}$ 对应的四个三角形并成 $\Sigma_X=\operatorname{conv}\{\pm b_1,\pm b_2\}$，而"两块阴影帽的总面积 $\sqrt3/2$，占 $|C|$ 的三分之一"（`simplex.tex:172`）。这个例子的功能是把"可行并可以盖不满极体"钉死，从而说明为什么必须走积分亏量、不能走逐点覆盖。

**(c) 常数与指数的机械理由。** $\frac{d!}{4^d}$ 是 `eq:simplex-volume-sum` 的 $d!$ 与 `eq:probability-real-integral` 的 $4^{-d}$ 相乘的自然产物，它同时也是 $P\ge4^d/d!$ 的倒数，所以 `eq:simplex-integral` 中间那一项 $\frac{d!}{4^d}|A|\,|A^\circ|$ 与结论常数刚好抵消。$D_I$ 出现两次（一次是换元 Jacobi，一次是单纯形体积的分子），所以 $P_I$ 里带 $D_I$ 一次、$|\Sigma_X|$ 里带 $D_I$ 一次，两边逐项对齐是等号成立的实质。$4^d$ 的分解 $(2\cdot2)^d$：每个坐标一个符号因子 $2$、一个长度因子 $2$。$\epsilon$ 的求和取遍 $\{-1,1\}^I$，共 $2^d$ 项，$2^d\cdot2^{-d}=1$ 是"每个基 $I$ 的概率测度归一"的来源。$X\in\partial A$ 时规定"全部对不可行、$\Sigma_X=\varnothing$"（`simplex.tex:34-36`）只为积分方便，因为它只改一个零测集上的被积函数值。

**(d) 失败路线。** `[推测]` 直接宣称 $\Sigma_X=A^\circ$ 对取等体逐点成立：上例已经证明即便在 $A$ 的正规坐标下 $\Sigma_X$ 也能少掉三分之一的面积，逐点覆盖是错的强度，只有 $\int$ 意义下才成立。`[推测]` 跳过"基同符号不同"的排重：那样 `eq:simplex-volume-sum` 右边会把同一个顶点计两次，等式变不等式，$\frac{d!}{4^d}\int_A|\Sigma_X|$ 低估 $S$，$S\ge1$ 无法转成 $P\ge4^d/d!$。`[推测]` 在可测性上偷懒，直接假设 $X\mapsto|\Sigma_X|$ 连续：$\Sigma_X$ 的分支随可行性开关跳变，函数只有可测性；`simplex.tex:121-129` 专门用一段处理它，说明作者也预见过这个偷懒。

## 11 用逼近把条带体结论搬到任意体：$\delta_j=\varepsilon_j/a$

**(a) 逐字引用。** `simplex.tex:178-183`（`cor:symmetric-inequality`）：

> \begin{corollary}[The symmetric volume-product inequality]
> \label{cor:symmetric-inequality}
> For every origin-symmetric convex body $K\subset\R^d$, $d\geq1$,
> \[
>  |K|\,|K^\circ|\geq\frac{4^d}{d!}.
> \]

夹逼 `simplex.tex:198-201`（`eq:polar-approximation`）：

>  (1-\delta_j)Q\subset Q_j\subset Q,
>  \qquad
>  K\subset A_j:=Q_j^\circ\subset(1-\delta_j)^{-1}K.

以及 `simplex.tex:216-217`：

> volume by $t^d$. Passing to the limit proves the assertion. No smoothness,
> simplicity, or general-position assumption is imposed on $K$.

**(b) 中间步骤。** 取 $Q=K^\circ$ 与 $a>0$ 使 $aB_2^d\subset Q$。对 $\varepsilon_j\downarrow0$ 取 $Q$ 的有限 $\varepsilon_j$-网、 adjoining 负点、取凸包得 $Q_j\subset Q$。支撑函数满足 $h_Q(u)-\varepsilon_j\le h_{Q_j}(u)\le h_Q(u)$（每个 Euclidean 单位方向 $u$），而 $h_Q(u)\ge a$（因为 $aB_2^d\subset Q$）。令 $\delta_j=\varepsilon_j/a<1$，则 $h_{Q_j}(u)\ge(1-\delta_j)h_Q(u)$，由支撑函数判据与凸分离得 $(1-\delta_j)Q\subset Q_j$；再取极（反向包含且 $(tQ)^\circ=t^{-1}Q^\circ$）得 `eq:polar-approximation`。顶点选取：每个对偶顶点对取一个作行，非零、张成、两两不成比例（`simplex.tex:207-211`，理由与 `zero-deficit.tex:113-115` 相同：从内点 $0$ 出发的射线只碰边界一次，同一射线上两个不同边界点不可能同时极端）。该行的条带体恰为 $A_j=Q_j^\circ$，`prop:simplex-integral` 给 $|A_j|\,|Q_j|\ge4^d/d!$。$|Q_j|\to|Q|$、$|A_j|\to|K|$ 由 $t$-位似乘 $t^d$ 与夹逼得出。

**(c) 常数与指数的机械理由。** $\delta_j=\varepsilon_j/a$ 里除以 $a$ 是把"绝对 Hausdorff 误差"换算成"相对误差"：只有相对形式 $(1-\delta_j)Q\subset Q_j$ 才在取极后给出 $(1-\delta_j)^{-1}K$ 这种可控放缩，$a$ 就是内切球半径。$\delta_j<1$ 的要求是 $j$ 充分大之后的事，用于保证 $(1-\delta_j)^{-1}$ 有限。$d\ge1$ 的下界在 $d=1$ 时可以直接验算，`simplex.tex:218-219`：$K=[-a,a]$、极 $[-1/a,1/a]$、乘积 $4=4^1/1!$。这里没有用到任何一般位置假设，这一点在 `simplex.tex:216-217` 被明写，因为 `prop:simplex-integral` 的行假设（非零、张成、两两不成比例）在顶点选取下自动满足，其余退化情形由 §9 与 §10 的零集处理吸收。

**(d) 失败路线。** `[推测]` 用外包多面体序列 $Q\subset Q_j$：那样极体是内缩的，$A_j\subset K$，$|A_j|\,|Q_j|\ge4^d/d!$ 无法推出 $|K|\,|Q|\ge4^d/d!$ 之外的信息（$|K|\ge|A_j|$ 但 $|Q|\le|Q_j|$，两方向相反，乘积无法比较）。内逼是必需的方向选择。`[推测]` 假设 $K$ 光滑或严格凸以省去逼近：那样得到的定理只覆盖稠子类，而等号分类恰好要处理多面体这种最不光滑的情形。`[推测]` 想直接用 `prop:simplex-integral` 的亏量对 $K$ 本身：$K$ 没有有限条带表示，$\Sigma_X$ 无从定义，亏量论证必须在多面体序列上做，这就是 §12 从 $C_j$ 起步的原因。

## 12 添一段之后把命题摆成"表示"的形式

`zero-deficit.tex` 9,996 B。这一节的输出只有一个对象：一族带符号的行与一组权重，配一个公共见证向量 $Y$。

**(a) 逐字引用。** standing assumption `zero-deficit.tex:11-15`：

> Throughout this section $K=-K\subset\mathbb R^n$ is a convex body,
> $n\ge1$, satisfying
> \[
>  |K|\,|K^\circ|=\frac{4^n}{n!}.
> \]

`zero-deficit.tex:26-28`：

> Recall that the lens width
> $\lambda:[-1,1]\to[0,\infty)$ is continuous, even and concave, with
> $\lambda(0)>0$ and $\lambda(t)\le\lambda(0)$.

命题主体 `zero-deficit.tex:30-38`（`prop:optimal-representation`，标题是 "A representation minimizing the lens cost"）：

> Let $K\subset\mathbb R^n$, $n\ge1$, be an origin-symmetric convex body
> with $P(K)=4^n/n!$. Put $Q=K^\circ$, $d=n+1$, and define the lifted
> bodies $B,C$ by \eqref{eq:segment-lift}.
> For every $X\in\operatorname{int}B$ and every nonzero
> $\xi=(q,a)\in\mathbb R^n\times\mathbb R$, put
> \[
>  T=p_C(\xi)=\max\{p_Q(q),|a|\}.
> \]

四个输出 `zero-deficit.tex:43-58`：

>  \xi=\sum_{i=1}^r\alpha_i c_i,
>  \qquad \sum_{i=1}^r\alpha_i=T,

>  |h\cdot Y|\le\lambda(h\cdot X)\quad(h\in C),
>  \qquad
>  c_i\cdot Y=\lambda(c_i\cdot X)\quad(1\le i\le r).

>  \sum_{i=1}^r\alpha_i\lambda(c_i\cdot X)
>  \le \sum_{j=1}^s\beta_j\lambda(h_j\cdot X).

以及 `zero-deficit.tex:59-60` 与 `zero-deficit.tex:63-66`：

> The choices may depend on $X$ and $\xi$; the same choice satisfies
> \eqref{eq:optimal-cost} for all the competing representations.

> The last coordinates $\sigma_i$ split the chosen rows into two groups.
> In Section~\ref{sec:median}, we compare representation costs as $X$ approaches
> the apex $(0,1)$ of $B$; the endpoint behavior of $\lambda$ makes the
> two signs contribute differently.

**(b) 中间步骤。** 我需要把 $T=p_C(\xi)=\max\{p_Q(q),|a|\}$ 这一步看清：$C=Q\times[-1,1]$ 的 gauge 是两个坐标 gauge 的最大值，正是 `convex-preliminaries.tex:39` 里 $p_{A\oplus_\infty A'}(x,x')=\max\{p_A(x),p_{A'}(x')\}$ 在 $A'= [-1,1]$（其 gauge 为 $|\cdot|$）处的特例。$c_i=(b_i,\sigma_i)$ 属于 $Q\times\{-1,1\}$，即 $C$ 的两个水平面上的点；$\sum\alpha_i=T$ 说这组权重恰好把 $\xi$ 按其 gauge 分解，没有多余质量。`eq:common-witness` 的左半是对全体的不等式、右半是对被选行的等式，$Y$ 同时是"全局可行"与"在选行上紧"。`eq:optimal-cost` 由这两条立刻导出：$\sum_i\alpha_i\lambda(c_iX)=\sum_i\alpha_ic_iY=\xi Y=\sum_j\beta_jh_jY\le\sum_j\beta_j\lambda(h_jX)$（这正是 `zero-deficit.tex:233-238` 那四行）。

$1\le r\le d$ 这个范围：$r\ge1$ 因为 $\xi\ne0$ 而 $T>0$；$r\le d$ 因为构造来自单个 $d$-单纯形，其顶点（除 $0$）至多 $d$ 个，见 §13 的 `eq:approximate-representation`。$d=n+1$ 是全部设计的核心：添一段把一个 $n$ 维体搬进 $n+1$ 维，让"符号"成为最后一个坐标，从而 $\sigma$ 可以在极限里保留下来；同时 $\lambda$ 的端点退化在 $s\to1$ 时才发生，所以 apex 附近正是符号分组的机制所在。

**(c) 常数与指数的机械理由。** $n\ge1$ 的假设在 §14、§15 里以 $d=n+1\ge2$ 的形式反复出现：`eq:segment-lift` 的 $B$ 的 apex 在 $n=0$ 无意义。$T$ 用 $\max$ 而不用和，是因为 $C$ 是 $\ell_\infty$ 型的乘积，权重的最小可能总量正是 gauge；$\sum\alpha_i=T$ 因此是"最省"的表达，任何别的选择都 $\ge T$。$\lambda(t)\le\lambda(0)$ 与 $\lambda(0)>0$ 用来给出 $Y\in\lambda(0)B$ 的一致有界性（`zero-deficit.tex:191`），$\lambda$ 的偶性用来吸收基行的符号（`zero-deficit.tex:179-180`："a sign on a basis row has been absorbed using the evenness of $\lambda$"），$\lambda$ 的凹性用来把顶点上的不等式推到整个凸包（`zero-deficit.tex:182-190`）。$[-1,1]$ 这个片段选择得刚好让 $|B|=\frac{2|K|}{n+1}$、$|C|=2|Q|$ 与 `eq:lift-equality` 的 $\frac{4}{n+1}$ 严格匹配 `convex-preliminaries.tex:63` 的 $\binom{n+1}{n}=n+1$；换成 $[-t,t]$ 会在 $B$ 上乘 $t$、在 $C$ 上乘 $1/t$，$P$ 不变但 apex 的坐标与 $\lambda$ 端点参数化的对应要重新归一，白增风险。Lean 侧这条命题的形态是 `EqualityMedians.lean:526` 的 `optimal_lift_of_equality`，输出被 `EqualityMedians.lean:596` 的 `medians_of_equality` 用一次（596-600 行是 `metricMedians_of_optimal_lift lensWidth_endpoint_scaling (optimal_lift_of_equality hn hd heq)`），也就是说在机器化里"最优提升"与"端点标度"是两个独立输入，中位数是它们的合成，这一点与正文把 §12 与 §6 分开写完全一致。

**(d) 失败路线。** `[推测]` 在 $n$ 维原地做而不升维：那样没有 apex、没有 $\sigma$ 分组，$\lambda$ 的端点退化用不上，`eq:optimal-cost` 里两个符号的贡献完全对称，聚合 $r_\pm$ 无从定义。`[推测]` 把 $r\le d$ 放宽成 Carathéodory 型 $r\le2d$：权重总数 $\sum\alpha_i=T$ 仍成立，但公共见证 $Y$ 的等式组从 $d$ 条变 $2d$ 条，一般无解；见证来自单个基的 $d$ 个紧方程这一事实才是 $r\le d$ 的真正来源。`[推测]` 试图让见证 $Y$ 只依赖 $\xi$ 而一致地不依赖 $X$：命题明确允许"选择依赖于 $X$ 与 $\xi$"（`zero-deficit.tex:59`），而 §14 的端点比较只在固定 $u$ 下取 $\delta\downarrow0$，一致性要求是超出需要的强度，硬加会使紧性论证（`zero-deficit.tex:195-199`）失效。

## 13 三步证明：内逼、乘积邻域、公共见证

这一节把 §12 命题的证明拆开数。作者在 `zero-deficit.tex:67-69` 就交代了骨架："We now prove Proposition~\ref{prop:optimal-representation} in three steps: approximate $C$ by polytopes, locate feasible simplices near each prescribed point and direction, and pass to a common witness to compare costs."

**(a) 逐字引用。** 升维保等 `zero-deficit.tex:73-83`：

> The horizontal section of $B$ at height $s\in[-1,1]$ is
> $(1-|s|)K$. Hence
> \[
>  |B|=|K|\int_{-1}^1(1-|s|)^n\,ds
>      =\frac{2|K|}{n+1},
>  \qquad |C|=2|Q|,
> \]
> and therefore
> \begin{equation}\label{eq:lift-equality}
>  |B|\,|C|=\frac4{n+1}|K|\,|Q|=\frac{4^d}{d!}.

亏量消失 `zero-deficit.tex:123-130`（`eq:vanishing-missing-volume`）：

> The integral estimate and \eqref{eq:lift-equality} imply
> \begin{equation}\label{eq:vanishing-missing-volume}
>  \begin{split}
>  0\le D_j
>  &:=\int_{B_j}\bigl(|C_j|-|\Sigma_{j,X}|\bigr)\,dX\\
>  &\le |B_j|\,|C_j|-\frac{4^d}{d!}
>  \longrightarrow0.

乘积邻域的选择 `zero-deficit.tex:157-161`：

> Choose $j_k>j_{k-1}$ so large that these inclusions hold and
> $D_{j_k}<|U_k|\,|V_k|$. If $\Sigma_{j_k,Z}$ missed $V_k$ for every
> $Z\in U_k$, its missing volume would be at least $|V_k|$ throughout
> $U_k$, contradicting this inequality.

顶点到凸包 `zero-deficit.tex:182-190`：

> The last inequality extends to all $h\in C_{j_k}$. Indeed, write
> $h=\sum_\ell s_\ell v_\ell$ as a convex combination of vertices.
> The triangle inequality followed by concavity gives
> \[
>  |h\cdot Y_k|
>  \le\sum_\ell s_\ell|v_\ell\cdot Y_k|
>  \le\sum_\ell s_\ell\lambda(v_\ell\cdot X_k)
>  \le\lambda(h\cdot X_k).
> \]

权重归一 `zero-deficit.tex:215-221`：

> Since $e\in\partial C$, its gauge is one. Therefore
> \[
>  1=p_C(e)\le\sum_{i=1}^d\theta_i p_C(c_i)
>    \le\sum_{i=1}^d\theta_i\le1.
> \]
> Thus $\sum_i\theta_i=1$: none of the limiting mass remains at the
> simplex vertex $0$.

**(b) 中间步骤。** 第一步（内逼）：取满维对称多面体 $Q_j\subset Q$ 依 Hausdorff 距离趋于 $Q$，例如取 $Q$ 中越来越细的有限对称网的凸包并含一个固定的张成对称集。存在 $t_j\in(0,1)$、$t_j\to1$ 使 $t_jQ\subseteq Q_j\subseteq Q$（`zero-deficit.tex:88-92`）；理由是若 $Q$ 含半径 $r_0>0$ 的 Euclidean 球而 Hausdorff 误差为 $\varepsilon_j$，则对 Euclidean 单位方向 `zero-deficit.tex:96-97`：$h_{Q_j}\ge h_Q-\varepsilon_j\ge(1-\varepsilon_j/r_0)h_Q$，配合支撑函数包含判据，丢掉有限个指标、把 $t_j$ 略调小即可。令 $C_j=Q_j\times[-1,1]$、$B_j=C_j^\circ$，得夹逼 `eq:lift-sandwich`：$t_jC\subseteq C_j\subseteq C$、$B\subseteq B_j\subseteq t_j^{-1}B$，故 $|B_j|\,|C_j|\to|B|\,|C|$。每个对偶顶点对取一行描述 $B_j$ 为条带交，这些行张成且两两不成比例，`zero-deficit.tex:113-115` 给的理由是"从内点 $0$ 出发的射线只与凸体边界交一点"；每个带符号的行都是 $C_j$ 的顶点，故属于 $Q_j\times\{-1,1\}$。对这些条带描述用 `prop:simplex-integral` 的 `eq:simplex-deficit` 就得 `eq:vanishing-missing-volume`。

第二步（每点每方向）：固定 $X\in\operatorname{int}B$、$e\in\partial C$，构造 $j_k\to\infty$ 与 $(X_k,e_k)\to(X,e)$，其中 $X_k\in\operatorname{int}B_{j_k}$、$e_k\in\Sigma_{j_k,X_k}$（`eq:nearby-feasible-pairs`）。做法是在 $B$ 内取正体积球 $U_k\subset\operatorname{int}B\cap B(X,1/k)$，在 $C$ 内取正体积球 $V_k$ 使闭包含于 $\operatorname{int}C\cap B(e,1/k)$；边界点 $e$ 处的可行性由"从 $e$ 朝 $0$ 移动小段"提供（$0\in\operatorname{int}C$）。由夹逼，$U_k\subset\operatorname{int}B_j$ 对一切 $j$ 成立，$V_k\subset C_j$ 对充分大 $j$ 成立（也可由 $\max_{h\in\overline{V_k}}p_C(h)<1$ 与 $t_j\to1$ 看出）。选 $j_k$ 使 $D_{j_k}<|U_k|\,|V_k|$，反证：若 $\Sigma_{j_k,Z}$ 对每个 $Z\in U_k$ 都错过 $V_k$，则亏量在 $U_k$ 上处处 $\ge|V_k|$，积分 $\ge|U_k|\,|V_k|$，与所选矛盾。

第三步（极限与比较）：每个 $k$ 选一个含 $e_k$ 的可行单纯形，其 $d$ 个带符号基行 $c_{ik}\in Q_{j_k}\times\{-1,1\}$ 与权重 $\theta_{ik}\ge0$ 满足 `eq:approximate-representation`：$e_k=\sum_i\theta_{ik}c_{ik}$、$\sum_i\theta_{ik}\le1$，剩下系数是单纯形顶点 $0$ 的权重。可行性给出 $Y_k$ 使 $c_{ik}\cdot Y_k=\lambda(c_{ik}\cdot X_k)$ 且对所有 $C_{j_k}$ 的顶点 $v$ 有 $|v\cdot Y_k|\le\lambda(v\cdot X_k)$；由上面引的凹性三步，该不等式扩到全体 $h\in C_{j_k}$，于是 $Y_k\in\lambda(0)B_{j_k}$，而夹逼使这批见证一致有界（即使所选基趋于奇异也仍成立）。取子列使 $Y_k\to Y$、$c_{ik}\to c_i$、$\theta_{ik}\to\theta_i$，这只用到有限个紧集的乘积（行在 $Q\times\{-1,1\}$、权重在 $[0,1]$），极限行无需线性无关。$\lambda$ 连续给 $c_i\cdot Y=\lambda(c_i\cdot X)$；对任意 $h\in C$ 用 $h_k=t_{j_k}h\in C_{j_k}$ 取极限得 `eq:limiting-feasibility`，且这一步在子列固定之后进行，所以同一个 $Y$ 对所有 $h$ 生效。gauge 夹逼给 $\sum_i\theta_i=1$。最后给定 $X$ 与非零 $\xi$，取 $e=\xi/T\in\partial C$，令 $\alpha_i=T\theta_i$、丢掉零权重，得至多 $d$ 行，`eq:optimal-representation` 与 `eq:common-witness` 成立，`eq:optimal-cost` 由 $\xi Y$ 的两侧展开得到。

**(c) 常数与指数的机械理由。** $\int_{-1}^1(1-|s|)^n\,ds=2\int_0^1(1-s)^n\,ds=\frac2{n+1}$，故 $|B|=\frac{2|K|}{n+1}$；$|C|=|Q|\cdot2$ 是乘积体积。两者相乘 $\frac{4}{n+1}\cdot\frac{4^n}{n!}=\frac{4^{n+1}}{(n+1)!}=\frac{4^d}{d!}$，$d=n+1$ 处等号精确保持，$\frac{4}{n+1}$ 与 $\binom{n+1}{n}=n+1$ 的倒数关系在 §4 已经解释。$r_0$ 是 $Q$ 的内切半径，$\varepsilon_j/r_0$ 是相对误差，$t_j=1-\varepsilon_j/r_0$ 减去一个小量即可。$D_{j_k}<|U_k|\,|V_k|$ 的选取说明"亏量小于一个乘积测度"是这个论证的定量核心：$|U_k|\,|V_k|$ 随 $k$ 趋于 $0$ 的速度无所谓，只要 $D_j$ 也趋于 $0$。$\lambda(0)>0$ 给 $Y_k$ 的界 $\lambda(0)B_{j_k}$，而 $B_{j_k}\subset t_{j_k}^{-1}B$ 一致有界，所以紧性可用；$\lambda(0)=F'(0)=\frac8{\pi^2}$（`lens.tex:24`）在这里第一次被消费为一个正数。$\sum_i\theta_i\le1$ 与 $\sum_i\theta_i=1$ 之间的落差全部落在顶点 $0$ 的权重上，$p_C(c_i)=1$（$c_i\in Q\times\{\pm1\}\subset\partial C$）是中间那条不等式取等的理由。

**(d) 失败路线。** `[推测]` 指望 $X\mapsto|\Sigma_{j,X}|$ 有逐点极限或单调性，直接对 $X$ 逐点取等：`zero-deficit.tex:142-144` 明说这条被避免，实际用的是乘积邻域上的积分反证。`[推测]` 用外逼多面体 $Q_j\supset Q$：那样 $C_j\subset C$，$V_k\subset C_j$ 无从保证，$U_k\subset\operatorname{int}B_j$ 的方向也反，第二步的包含链整体翻转。`[推测]` 允许极限行退化到"某行变成 $0$"或两组行重合：$c_i\in Q\times\{\pm1\}$ 排除了零行（最后一坐标绝对值为 $1$），但线性相关无法排除，作者明确写 "No independence of the limiting rows is needed"（`zero-deficit.tex:198-199`），因为见证 $Y$ 的不等式组在极限里照样成立；反过来若坚持要求基无关，就会在 $e$ 落在若干面的交上时无解。`[推测]` 想在第二步直接取 $V_k$ 为 $\{e\}$：单点体积为 $0$，$D_{j_k}<|U_k|\cdot0$ 变成 $D_{j_k}<0$，与 $D_{j_k}\ge0$ 矛盾，正体积的要求是这条反证法能启动的唯一原因。

## 14 端点成本比较如何长成度量中位数

`median.tex` 8,765 B。这一节我读了最多次，因为它是"解析语言"翻译为"度量语言"的唯一现场。

**(a) 逐字引用。** 中位数定义 `median.tex:4-10`：

> A \emph{metric median} of three points in a normed
> space is a point that lies between every pair: if the points are
> $x_0,x_1,x_2$, a median $m$ satisfies
> \[
>  \|x_i-x_j\|=\|x_i-m\|+\|m-x_j\|
>  \qquad(0\le i<j\le2).
> \]

命题 `median.tex:14-18`（`prop:metric-median`）：

> \begin{proposition}[Medians of an equality body]\label{prop:metric-median}
> Let $K\subset\R^n$, $n\ge1$, be an origin-symmetric convex body with
> $P(K)=4^n/n!$, and put $Q=K^\circ$. Every triple of points in
> $(\R^n,p_Q)$ has a metric median.

三个标量与聚合集 `median.tex:31-32`（`eq:median-radii`）与 `median.tex:39-41`（`eq:aggregate-set`）：

>  A_+=\frac{p+a}{2},\qquad A_-=\frac{p-a}{2},
>  \qquad c=\frac{s-p}{2}.

>  D_0=\{r_+-r_-:\ r_++r_-=x-y,\quad
>                   \|r_+\|\le A_+,\quad\|r_-\|\le A_-\}.

逼近 apex 与误差式 `median.tex:56-59` 与 `median.tex:86-91`（`eq:median-endpoint-error`）：

> $X_\delta=(\delta u,1-\delta)$, $0<\delta<1$. The lifted body
> $B=K\oplus_1[-1,1]$ contains $X_\delta$ in its interior because
> \[
>  p_B(X_\delta)=\delta p_K(u)+1-\delta<1.
> \]

>  \left|
>  \frac{\lambda(\langle(b,\sigma),X_\delta\rangle)}
>       {\lambda(1-\delta)}
>        -1+\sigma\langle b,u\rangle
>  \right|\le\varepsilon_u(\delta)
>  \quad(b\in Q,\ \sigma=\pm1).

成本下限、对照表示与支撑不等式 `median.tex:96-97`、`median.tex:102`、`median.tex:108`：

>  p-\langle r_+-r_-,u\rangle-p\varepsilon_u(\delta)
>  \ge p-h_{D_0}(u)-p\varepsilon_u(\delta).

>  (x-y,a)=p_1(x/p_1,1)+p_2(-y/p_2,-1).

>  \langle x+y,u\rangle\le h_{D_0}(u)+s-p
>  \qquad(u\in\operatorname{int}K).

**（b）中间步骤。** 归约与记号：平移把三元组化为 $0,x,y$；两点重合时那个重复点即中位数，所以设 $0,x,y$ 两两不同。记 $p_1=\|x\|,p_2=\|y\|,p=\|x-y\|,s=p_1+p_2,a=p_1-p_2$。三角与反三角不等式给 $s\ge p\ge|a|$，于是 $A_\pm,c$ 皆非负。恒等式 $A_++A_-=p$、$c+A_+=\frac{s-p+p+a}2=\frac{s+a}2=p_1$、$c+A_-=\frac{s-a}2=p_2$ 是后面所有"逼成等式"的算术底座。目标是 $x+y\in D_0+(s-p)Q$；一旦成立，取对应的 $r_\pm$ 与 $q\in(s-p)Q$ 使 $x+y=(r_+-r_-)+(s-p)q$，令 $m=x-r_+=y+r_-$（可行性由 $r_++r_-=x-y$ 保证），则 $2m=x+y-(r_+-r_-)=(s-p)q$，故 $\|m\|\le\frac{s-p}2=c$、$\|x-m\|\le A_+$、$\|y-m\|\le A_-$。再由 $p_1\le\|m\|+\|x-m\|\le c+A_+=p_1$ 与 $p_2\le\|m\|+\|y-m\|\le c+A_-=p_2$（`median.tex:141-145`）夹出全部等号，最后 $\|x-m\|+\|m-y\|=A_++A_-=p=\|x-y\|$（`median.tex:147-149`），三条中位等式齐活。

$D_0$ 的性质（`median.tex:49-52`）：它是 $A_+Q\times A_-Q$ 与仿射子空间 $r_++r_-=x-y$ 之交的线性像，故紧凸；非空由 $r_\pm=\frac{A_\pm}p(x-y)$ 提供，因为 $\|r_\pm\|=\frac{A_\pm}p\cdot p=A_\pm$，两式相加得 $x-y$。该取法在 $A_+=0$ 或 $A_-=0$ 时也给得出（此时那一项为 $0$），$p>0$ 由三点两两不同保证。

端点比较：固定 $u\in\operatorname{int}K$，$X_\delta=(\delta u,1-\delta)$。对 $\xi=(q,a)=(x-y,p_1-p_2)$ 用 `prop:optimal-representation`，其总量 $T=\max\{\|q\|,|a|\}=\max\{p,|a|\}=p$（因 $p\ge|a|$）。得行 $(b_i,\sigma_i)\in Q\times\{-1,1\}$ 与权重 $\alpha_i\ge0$ 满足 `eq:optimal-representation` 与 `eq:optimal-cost`。聚合 $r_\pm=\sum_{\sigma_i=\pm1}\alpha_ib_i$ 有 $r_++r_-=\sum\alpha_ib_i$。这里我要补一个正文没写出来的验证：$\xi$ 的末坐标给出 $\sum_i\alpha_i\sigma_i=a$，与 $\sum_i\alpha_i=T=p$ 联立即 $\sum_{\sigma_i=\pm}\alpha_i=\frac{p\pm a}2=A_\pm$；再由 $b_i\in Q$ 有 $\|b_i\|\le1$，故 $\|r_\pm\|\le A_\pm$，于是 $r_+-r_-\in D_0$。$\sigma_i$ 的符号分配在这里同时决定了"和"与"差"，这就是 §12 那句"末坐标把选出的行分成两组"的具体兑现。

再用 $\lambda$ 偶性：$\langle(b,\sigma),X_\delta\rangle=\delta\langle b,u\rangle+\sigma(1-\delta)=\sigma\bigl(1-\delta(1-\sigma\langle b,u\rangle)\bigr)$，这正是 `median.tex:78-80` 那行等式。$|\langle b,u\rangle|\le p_K(u)$（$b\in Q=K^\circ$、$p_Q(b)\le1$），所以 $1-\sigma\langle b,u\rangle\in[1-p_K(u),1+p_K(u)]\subset(0,\infty)$，`lem:lens-endpoint` 的 `eq:lens-endpoint-ratio` 给出 $\varepsilon_u(\delta)\to0$，即 `eq:median-endpoint-error`。最优表示的归一化成本 $\ge\sum_i\alpha_i\bigl(1-\sigma_i\langle b_i,u\rangle-\varepsilon_u(\delta)\bigr)=p-\langle r_+-r_-,u\rangle-p\varepsilon_u(\delta)\ge p-h_{D_0}(u)-p\varepsilon_u(\delta)$。对照表示 $(x-y,a)=p_1(x/p_1,1)+p_2(-y/p_2,-1)$ 的两行确在 $Q\times\{-1,1\}$（$x/p_1\in\partial Q$ 因 $p_Q(x)=p_1$），其归一化成本按同一误差式趋于 $p_1(1-\langle x/p_1,u\rangle)+p_2(1+\langle y/p_2,u\rangle)=s-\langle x+y,u\rangle$。`eq:optimal-cost` 说前者 $\le$ 后者，令 $\delta\downarrow0$ 得 `eq:median-support-interior`。连续性把 $u$ 扩到 $K$；对非零 $v$ 取 $u=v/h_Q(v)$，由 `eq:gauge-support` 有 $h_Q=p_{K^\circ}=p_K$，故 $u\in\partial K$，齐次性给出 $\langle x+y,v\rangle\le h_{D_0}(v)+(s-p)h_Q(v)$，$v=0$ 时同式成立。右边正是紧凸集 $D_0+(s-p)Q$ 的支撑函数（约定 $0Q=\{0\}$），凸分离得 `eq:median-membership`。

**(c) 常数与指数的机械理由。** $A_\pm=\frac{p\pm a}2$、$c=\frac{s-p}2$ 的选法唯一由三个方程决定：$A_++A_-=p$、$c+A_+=p_1$、$c+A_-=p_2$；解之即得 `eq:median-radii`。$s-p\ge0$ 是 $(s-p)Q$ 有意义（系数非负）的要求，它等于 $0$ 时（三点共线段、$m$ 落在 $0$）约定 $0Q=\{0\}$ 兜住。$T=p$ 这个化简依赖 $p\ge|a|$，反过来说若我误取 $T=\max\{p,|a|\}=|a|$，端点比较里的 $p\varepsilon_u(\delta)$ 就换成 $|a|\varepsilon_u(\delta)$，而左边聚合权重仍按 $p$ 归一，两边对不齐。$\delta\in(0,1)$ 与 $X_\delta$ 的凸组合形式 $(\delta u,1-\delta)$ 是为了让 $p_B(X_\delta)=\delta p_K(u)+1-\delta$ 严格小于 $1$；若取 $(\delta u,1)$ 则 $p_B\ge1$，$X_\delta\notin\operatorname{int}B$，命题假设直接破产。误差 $\varepsilon_u(\delta)$ 只在那个固定的 $u$ 上一次一致（对 $b\in Q$ 与 $\sigma=\pm1$ 同时），`median.tex:111-112` 特别写明"The error was uniform only over $b,\sigma$ for the fixed $u$; that is all this limit requires"，因为求和项数 $\le d$ 固定、$\alpha_i$ 总和固定。

**(d) 失败路线。** `[推测]` 直接对 $\delta$ 取极限而不归一化：$\lambda(1-\delta)\to0$，两边成本都趋于 $0$，只剩 $0\le0$，必须除以 $\lambda(1-\delta)$ 才能提取一阶信息，这个除法同时解释了为什么 $T$ 会作为整体系数出现。`[推测]` 把 $D_0$ 换成 $\{r_+-r_-\colon \|r_\pm\|\le A_\pm\}$（去掉 $r_++r_-=x-y$）：那样 $m$ 的两个定义 $x-r_+$ 与 $y+r_-$ 不再相等，中位数无处安放；仿射约束是 $m$ 良好定义的全部依据。`[推测]` 用 $x+y\in D_0+(s-p)Q$ 的反向包含：凸分离只能从"支撑函数处处 $\le$"推出成员关系，要证反向就得给出具体点，而我恰恰给不出。`[推测]` 假设 $Q$ 严格凸以保证 $r_\pm$ 唯一：唯一性从来不需要（`median.tex:11-12` 明写 "The median need not be unique"），而严格凸会把 Hanner 多面体全部排除在候选之外，与结论矛盾。

## 15 三球交性质、Hansen--Lima 与分类的收束

**(a) 逐字引用。** `median.tex:157-160`：

> A normed space has the \emph{three-ball intersection property}, also
> called the \emph{3.2 intersection property}, if any three closed balls
> that intersect pairwise have a common point. Their radii may differ. The equivalence between this intersection
> property and the metric-median condition is Lima's classical
> norm-additive decomposition criterion~\cite[Theorem~1.2]{Lima1978};

`median.tex:165-169`（`lem:three-balls`）与 `median.tex:186-191`：

> \begin{lemma}[From medians to three balls]\label{lem:three-balls}
> Suppose every triple of points in a real normed space has a metric
> median. Then the space has the three-ball intersection property,
> including balls of radius zero.

>  z=m+\frac{t}{d_1}(x_1-m)

>  \|z-x_1\|&=d_1-t=r_1,\\
>  \|z-x_j\|&\le\|z-m\|+d_j=t+d_j\le r_j\quad(j=2,3).

结构定理 `median.tex:201-205`（`thm:hansen-lima`）：

> \begin{theorem}[Hansen--Lima]\label{thm:hansen-lima}
> A nonzero finite-dimensional real Banach space with the 3.2 intersection
> property is linearly isometric to a space obtained from the real line
> by finitely many $\ell_1$ and $\ell_\infty$ direct sums.

分类命题 `median.tex:211-214`（`prop:equality-classification`）：

> \begin{proposition}[Classification of equality]\label{prop:equality-classification}
> If an origin-symmetric convex body $K\subset\R^n$, $n\ge1$, satisfies
> $P(K)=4^n/n!$, then it is a linear Hanner body.

收束句 `median.tex:222-225`：

> invertible linear map $T$ and a Hanner polytope $H$ with $Q=TH$.
> By \eqref{eq:linear-polarity} and Lemma~\ref{lem:hanner},
> \[
>  K=Q^\circ=T^{-\mathsf T}H^\circ
> \]

**(b) 中间步骤。** 由中位到三球（`median.tex:171-195`）：设三球两两相交，中心 $x_1,x_2,x_3$、半径 $r_1,r_2,r_3\ge0$。取中心的中位数 $m$，$d_i=\|m-x_i\|$。两两相交与中位性质给 $d_i+d_j=\|x_i-x_j\|\le r_i+r_j$。若全部 $d_i\le r_i$，$m$ 即公共点。否则重标后 $t=d_1-r_1>0$；对 $j=2,3$，$d_1+d_j\le r_1+r_j$ 即 $(r_1+t)+d_j\le r_1+r_j$，得 $d_j+t\le r_j$。由 $0<t\le d_1$，$z=m+\frac{t}{d_1}(x_1-m)$ 良好定义且在 $m$ 到 $x_1$ 的线段上：$\|z-m\|=t$，$\|z-x_1\|=d_1-t=r_1$，$\|z-x_j\|\le t+d_j\le r_j$。$r_1=0$ 时 $t=d_1$，$z=x_1$，仍然成立，这就是"含半径为零的球"那半句的来源。

合成分类：`prop:metric-median` + `lem:three-balls` 给 $(\R^n,p_Q)$ 的 3.2 交性质；有限维赋范空间对 $p_Q$ 完备，故是一个非零有限维实 Banach 空间；`thm:hansen-lima` 给出可逆线性映射 $T$ 与 Hanner 多面体 $H$ 使 $Q=TH$；由 `eq:linear-polarity` 得 $K=Q^\circ=T^{-\mathsf T}H^\circ$，而 `lem:hanner` 说 $H^\circ$ 仍是 Hanner 多面体且 $P(H^\circ)=4^n/n!$，于是 $K$ 是线性 Hanner 体。反向（线性 Hanner 体取等）由 `lem:hanner` 直接给。`median.tex:226-229` 那句 "The converse was proved in Lemma~\ref{lem:hanner}; together with Corollary~\ref{cor:symmetric-inequality}, this completes Theorem~\ref{thm:main}" 就是全篇的最后一次装配。

Lean 侧这一段被展开成一条完整的归纳机器，与正文的"外包给定理"形成鲜明对照，我把它的骨架实测出来：`Medians.lean:19-21` 定义 `HasMetricMedians (E)` 为 $\forall x:\operatorname{Fin}3\to E,\ \exists m$ 使 $i\ne j$ 时 `dist (x i) (x j) = dist (x i) m + dist m (x j)`；`Medians.lean:23-26` 定义 `ThreeBallIntersection` 用 $\operatorname{Fin}3$ 上的中心与半径函数 $r:\operatorname{Fin}3\to\mathbb R$，并要求逐对交非空 $\Rightarrow$ 总交非空，与上面 `lem:three-balls` 逐字对应。真正吃力的部分是 `Classification.lean:387-412` 的 `median_decomposition`：在 `2 ≤ Module.finrank ℝ E` 下，它输出 `Nonempty (LDecomposition E) ∨ Nonempty (LDecomposition (E →L[ℝ] ℝ))`，三分支是（一）$\operatorname{finrank}=2$ 时用 `Splitting.lean:1218` 的 `exists_maximal_unit_face` 与 `Splitting.lean:1159` 的 `face_rank_two_pair`；（二）原空间存在极大真面且带 `HasMFaceStructure`（`Faces.lean:988`）时，改到强对偶空间做分割，用 `not_primal_dual_maximal_mfaces` 排除两侧同时有 $M$-面结构；（三）两侧都没有时用 `Splitting.lean:1246` 的 `proper_split_of_no_maximal_mface`。`LDecomposition`（`Classification.lean:14-20`）把"范数可加分解"写成带 `norm_add : ∀ z, ‖equiv z‖ = ‖z.1‖ + ‖z.2‖` 与两侧正维数的结构。之后 `Classification.lean:419-453` 的 `hannerSpace_of_medians_rank` 用 `Nat.strong_induction_on` 对维数归纳，两侧维数由 `Classification.lean:183-191` 的 `left_lt`、`right_lt`（内部靠 `finrank_add` 加 `omega`）严格下降；对偶侧的分支先用 `finrank_strongDual` 把维数搬回 $n$，再走 `HannerSpace.dual`（308-321 行）与 `finiteBidual` 回到原空间。`Classification.lean:121-129` 的 `HasMetricMedians.of_retract` 是"中位性质沿 1-Lipschitz 收缩-嵌入对传递"的一般引理，`left_medians`、`left_dual_medians`（214-223 行）都从它出来。最后 `Classification.lean:498-513` 的 `hannerSpace_iff_linearHanner` 把抽象空间的 `HannerSpace E` 翻译成集合层面的 `IsLinearHanner g.unit`，`Classification.lean:518-532` 的 `equality_implies_linearHanner` 把这两块接起来。

**(c) 常数与指数的机械理由。** "半径可以不同"（`median.tex:159`）是必需的：中位数 $m$ 给出的是 $d_i+d_j\le r_i+r_j$ 这种带各自半径的形式，若限制等半径就丢掉一般位置上的球，$t$ 的调整步 $\frac{t}{d_1}(x_1-m)$ 也随之失效。$\frac{t}{d_1}\in(0,1]$ 保证 $z$ 在线段上，$d_1>0$ 由"$t>0$ 且 $t\le d_1$"给出，这就是那句"is well defined"的全部内容。`median.tex:197-199` 特意为 Hansen--Lima 补了一句"the balls are closed and have arbitrary radii \cite[Section~1]{HansenLima1981}"，因为他们的 3.2 定义必须与我们刚证出的形式逐字对齐才能引用 `Corollary~7.4`。$\ell_1/\ell_\infty$ 两种和与 `eq:sum-gauges` 完全对应（`median.tex:207-209`："The two direct-sum norms are exactly those in \eqref{eq:sum-gauges}, so their unit balls are Hanner polytopes"），这是把 Banach 空间语言翻译回凸体语言的唯一接口。Lean 侧的 $2\le\operatorname{finrank}$ 分支与正文的关系值得记：正文只引用 Hansen--Lima 的定理，机器化必须把它重做，因为库里的 `Corollary 7.4` 不在 `permitted_axioms` 允许的外部依赖范围内被直接调用，`Classification.lean` 里的整条归纳就是那篇 1981 年论文的再证明。

**(d) 失败路线。** `[推测]` 想在 $K$ 侧直接证三球性质：范数是 $p_Q$，球是 $Q$ 的平移位似，性质属于 $(\R^n,p_Q)$，$K$ 侧要经 $K=Q^\circ$ 转一次，而转回来靠的是 `eq:sum-polars` 对两种和的交换。`[推测]` 用中位数唯一性替代 $t$ 的调整步：$m$ 可能落在三个球之外，$z$ 的构造本质上是"沿 $x_1$ 方向移动恰好脱出量 $t$"，唯一性给不了这个方向信息。`[推测]` 把归纳起点设在 $\operatorname{finrank}=0$：`Classification.lean:426-428` 用的分支是 $n=1$（`hannerSpace_one`，253-273 行），零维空间既非 `Nontrivial` 也拿不到正维数的 `LDecomposition`，那条假设 `[Nontrivial E]` 是结构性的。`[推测]` 想在 `median_decomposition` 里总是走原空间分支：`not_primal_dual_maximal_mfaces` 只排除"两侧同时有 $M$-面结构"，当原空间极大面全都缺 $M$-结构时分支三仍可用，但当它不可用时必须走对偶，这正是那个 $\lor$ 型结论存在的原因。

## 16 两个推论：函数化不等式与熵-输运形式

等号定理一旦成立，`introduction.tex` 里那两个推论就成了副产品，我把它们单独记一节，因为它们是我最开始猜测"这论文有什么用"的答案。

**(a) 逐字引用。** `introduction.tex:210-217`（`cor:functional-mahler`）：

> \begin{corollary}[Even functional Mahler inequality]\label{cor:functional-mahler}
> For every integer $n\ge1$ and every even proper lower-semicontinuous
> convex function $\varphi:\R^n\to\R\cup\{+\infty\}$ such that
> $0<\int_{\R^n}e^{-\varphi(x)}\,dx<\infty$,
> \[
>  \left(\int_{\R^n}e^{-\varphi(x)}\,dx\right)
>  \left(\int_{\R^n}e^{-\varphi^*(y)}\,dy\right)\ge4^n.
> \]

关键一句 `introduction.tex:243-245`：

> The cited implication uses auxiliary convex bodies in dimensions
> $n+m$ and lets $m$ tend to infinity; it is not an application only of
> the geometric theorem in dimension $n$.

熵-输运式 `introduction.tex:270-281`（`cor:entropy-transport`）：

> be full-dimensional log-concave probability measures, both symmetric
> about the origin, with proper lower-semicontinuous convex potentials
> $V_i$. Suppose their densities are essentially continuous, meaning that
> $e^{-V_i}=0$ at $\mathcal H^{n-1}$-almost every point of
> $\partial\operatorname{supp}\eta_i$. Their moment measures
> $\nu_i=(\nabla V_i)_\#\eta_i$ have finite first moments,
> $H(\eta_i)=-\int V_i\,d\eta_i$ is finite, and
> \[
>  H(\eta_1)+H(\eta_2)\le -n\log(4e^2)+\mathcal T(\nu_1,\nu_2).
> \]

**(b) 中间步骤。** 函数化的链条：取 $f=e^{-\varphi}$，非零可积对数凹。Fradelizi-Meyer 的极函数 $f^z(y)=\inf_{\{x:f(x)>0\}}\frac{e^{-\langle x-z,y-z\rangle}}{f(x)}$（`introduction.tex:225-228`）与平移最小化乘积 $\mathcal P(f)=(\int f)\inf_z\int f^z$（`introduction.tex:230-234`）。他们 Proposition 1(a) 断言"每一维的对称几何 Mahler 不等式蕴含偶对数凹函数的 $\mathcal P(f)\ge4^n$"（`introduction.tex:235-238`，引用 `\cite{FradeliziMeyer2008}`），而 `thm:main` 恰好提供"每一维"这个前提；$f^0=e^{-\varphi^*}$，于是 $\bigl(\int e^{-\varphi}\bigr)\bigl(\int e^{-\varphi^*}\bigr)\ge\mathcal P(f)\ge4^n$。锐性用 $\varphi(x)=\sum_{i=1}^n|x_i|$ 检验（`introduction.tex:246-248`）：$\varphi^*$ 在 $[-1,1]^n$ 上为 $0$、外部为 $+\infty$，两个积分都等于 $2^n$，乘积 $4^n$。

熵-输运链条：对 $\rho_i=e^{-V_i}$，在支撑内部几乎处处 $|\nabla\rho_i|=|\nabla V_i|e^{-V_i}$；`\cite{CorderoErausquinKlartag2015}` 的 Lemma 4 给 $\int|\nabla\rho_i|<\infty$，其 Proposition 7 的证明给 $V_i\in L^1(\eta_i)$；于是推前测度 $\nu_i=(\nabla V_i)_\#\eta_i$ 一阶矩有限、$H(\eta_i)=-\int V_i\,d\eta_i$ 有限；最后套用 Gozlan 型等价（`\cite[Theorem~1.3]{FradeliziGozlanZugmeyer2021}`）于 `cor:functional-mahler`，参数 $c=4$。$-n\log(4e^2)$ 这个常数我核算过：$\mathcal T$ 型不等式的标准形式是 $H(\eta_1)+H(\eta_2)\le-n\log(c^2e)+\mathcal T(\nu_1,\nu_2)$ 配上 $c^{-n}$ 侧的乘积界；此处 $c=4$，$\log$ 内的 $4e^2$ 与 $c$、$\mathcal T$ 定义里 $f+f^*$ 的平移归一化绑定，属于引用定理的原样常数，我没有重新推导它的必要，只在台账里登记为外部给定。

**(c) 常数与指数的机械理由。** 函数化常数是 $4^n$，没有 $n!$：这是函数化与几何化的通例差异，几何侧的 $n!$ 藏在 $\oplus_1$ 的体积因子 $\binom{n+1}{n}=n+1$ 里，而偶对数凹函数对应的极限构造是 $n+m$ 维体再令 $m\to\infty$（`introduction.tex:243-245`），阶乘在极限里被吸进维度归一。$\varphi(x)=\sum|x_i|$ 那个例子里 $e^{-\varphi}$ 的积分是 $\prod_i\int_{\mathbb R}e^{-|x_i|}dx_i=2^n$，$\varphi^*$ 的积分是 $|[-1,1]^n|=2^n$，两两相乘正好 $4^n$。$e^{-\infty}=0$ 的约定在 `introduction.tex:208` 单独交代，因为 $\varphi$ 允许取 $+\infty$，$e^{-\varphi}$ 的支撑集定义（`introduction.tex:226` 里 $\inf$ 只在 $\{x:f(x)>0\}$ 上取）依赖它。$\nu_i$ 用 $\nabla V_i$ 推前，并非 $V_i$ 本身，是 Brenier 型对偶的标准选择；$\mathcal F$ 取全体正常下半连续凸函数、$\mathcal T$ 允许 $+\infty$（`introduction.tex:268`）保证不等式在退化情形自动成立。"essentially continuous" 那条 $\mathcal H^{n-1}$-几乎处处为零的边界密度条件是引用定理的前提，我把它抄下来是因为它排除了支撑边界上有原子的密度，否则 $|\nabla\rho_i|$ 的有限性会失败。

**(d) 失败路线。** `[推测]` 以为几何分类会自动给出函数化的取等分类：`introduction.tex:249-251` 直接否定这一点，理由是那个蕴含只是极限形式，引用落在 `\cite[p.~1437]{FradeliziMeyer2008}`。`[推测]` 想用 $n$ 维定理套 $n$ 维函数：`introduction.tex:243-245` 说明引用结果需要一列 $n+m$ 维辅助体并令 $m\to\infty$，"每一维"是真实假设，单维版本不够。`[推测]` 去掉对称性想做一般偶性缺失的版本：`introduction.tex:253-255` 给出的界是 $e^n$，来自 companion paper，其来源与本文论证相互独立，硬套会把 $4^n$ 与 $e^n$ 两个常数混起来（$4>e$，偶性给的是更强的界）。

## 17 最终思路与最初设想之间差了多少

我把现在的理解和第一周的猜测逐条对照，差异比我预想的大。

第一条差异在问题形态。最初我以为等号证明的形式会是"先由 $P(K)=4^n/n!$ 推 $K$ 是多面体，再对多面体做组合分类"。实际路线里 $K$ 从来没有被证明是多面体；被构造的是 $Q=K^\circ$ 的一列内逼多面体 $Q_j$（`zero-deficit.tex:85-92`），而 $K$ 自身的多面体性一点也没用到。承担"离散化"职能的始终是近似序列与极限，最终的结构信息来自 Banach 空间的三球交性质，一种纯度量条件。

第二条差异在解析与几何的位置。最初我猜解析工具只用于证下界，等号部分应当靠几何。实际是反过来：解析工具（$S\ge1$ 与 $\frac{d!}{4^d}\int_A|\Sigma_X|$ 的恒等式，`simplex.tex:53-55`）负责造出一个"精确到常数"的亏量表达式，等号情形靠这个表达式趋于 $0$ 才启动；`simplex.tex:140-142` 那句 "identifies the quantity that will tend to zero in the equality argument" 就是这个接口。几何侧（中位数、三球、Hansen--Lima）几乎不碰解析量，它只在 `eq:optimal-cost` 这个已经纯量化的命题之上工作。

第三条差异在维度的处理。最初我以为升维是技术上的权宜；实际 $d=n+1$ 是结构性的：$\sigma_i$ 必须写成某个坐标，apex 必须存在，$\lambda$ 的端点退化必须被触发。三件事同时只在带一段的乘积里成立。反过来说，函数化推论那边（`introduction.tex:243-245`）也需要"$n+m$ 维辅助体、$m\to\infty$"，两处都是"升维换结构"，我对这类论证的信任度因此大幅上升。

第四条差异在常数的敏感程度。最初我以为 $4^n/n!$ 只要"差不多锐"就够用。实际全篇对精确常数的依赖是链式的：$F'(0)=8/\pi^2$、$t'(s)=2/\pi$、$\lambda(1-\eta)$ 主项系数 $2/\pi$、$(\pi k)^d/d!$、$\pi^d/d!$、$4^d$、$d!$，任何一个被改动，`eq:simplex-integral` 就退化为带损失常数的不等式，亏量不再趋于 $0$，`eq:nearby-feasible-pairs` 的选取（$D_{j_k}<|U_k|\,|V_k|$）失去依据。台账节我把这条链上的每个数都登记了位置。

第五条差异在"外部定理"的用量。最初我以为分类要自己做完；实际最后一步整段外包给 Hansen--Lima 的 `Corollary 7.4`（`median.tex:201-209`），而论文自己只补了 `lem:three-balls` 那个短方向（半径任意的版本，`median.tex:165-195`）。Lean 侧则把这笔外包全额偿还：`Classification.lean:387-412` 的 `median_decomposition` 与 `Classification.lean:419-453` 的 `hannerSpace_of_medians_rank` 重做了那篇 1981 年论文的内容，用强归纳把 $\operatorname{finrank}$ 严格降到两侧，再靠 `HannerSpace.dual` 与 `finiteBidual` 从对偶侧搬回来。读完这条链我才明白，"引用一个定理"和"这条声明在 Lean 里闭合"是两个完全不同量级的工作。

第六条差异在退化情形的容忍度。最初的草稿里我一直要求一般位置（基无关、约束恰好 $d$ 条紧、无边界等式）。实际论文对每一类退化都单独处理并说明它无害：`feasibility.tex:41-42` 明写 $S\ge1$ 不需要任何边界等式条件；`feasibility.tex:148-156` 额外把"有边界等式"证成零测事件，只服务体积恒等式；`zero-deficit.tex:198-199` 允许极限行线性相关；`simplex.tex:33-34` 保留 $\Sigma_X$ 在额外紧约束点上的定义。这套"退化优先"的写法让整条链不需要任何扰动论证，代价是每个引理多两到三行说明。

回指核对。前面各节里我用了若干带编号的前向引用，这里把它们逐个钉到落点，避免悬空：`§4` 指凸预备（两种和、`eq:sum-gauges`、`eq:sum-products`），已在 §4 的 (b) 与 (c) 落地；`§5` 指透镜构造（`eq:lens-map`、`eq:lens-boundary-law`），在 §5 落地；`§6` 指端点标度（`eq:lens-endpoint-asymptotic`、`eq:lens-endpoint-ratio`），在 §6 落地，§5 的 (c) 里那处写作"端点渐近"的指涉对应的就是 §6 的内容；`§7` 指全纯质量引理，`§8` 指 $S\ge1$，`§9` 指额外边界等式零测度，`§10` 指单纯形恒等式，`§11` 指逼近，均在对应小节落地；`§12` 指 `prop:optimal-representation` 的陈述与 $C=B^\circ=Q\times[-1,1]$ 的定义，`§13` 指它的三步证明，其中 $C_j=Q_j\times[-1,1]$ 与 $B_j=C_j^\circ$ 的具体构造在 §13 的 (b) 第一步给出，§11 末尾那处"从 $C_j$ 起步"对应的是 §12 与 §13 这一对；`§14` 指端点成本到中位数（`prop:metric-median`），`§15` 指三球交与 Hansen--Lima，`§16` 指函数化与熵-输运两个推论。`eq:approximate-representation`、`eq:lift-sandwich`、`eq:limiting-feasibility`、`eq:nearby-feasible-pairs`、`eq:median-membership` 这些标签在正文里都以 `文件:行号` 的形式实际出现过，行号取自 `zero-deficit.tex` 与 `median.tex`。

## 18 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| `$4^n/n!$` | cube 与极 cross-polytope 的乘积，猜想常数 | introduction.tex:14-15 | `thm:main` 的 `eq:main-inequality` introduction.tex:38 | 结论与 `eq:simplex-integral` 右端同时失配，全链条失效 |
| `$P(K)=\lvert K\rvert\,\lvert K^\circ\rvert$` | 线性不变量 | introduction.tex:11-12 | 全部等号陈述 introduction.tex:40 | 若去掉 `$\lvert K^\circ\rvert$` 因子，`eq:lift-equality` 的保等性无从验证 |
| `$\frac{4^d}{d!}$` | 条带维 $d$ 的同一常数 | simplex.tex:57 | `cor:symmetric-inequality` simplex.tex:182 | 逼近极限 $\lvert A_j\rvert\,\lvert Q_j\rvert\to\lvert K\rvert\,\lvert Q\rvert$ 给不出锐界 |
| `$\frac{d!}{4^d}$` | 概率到体积的整体比例因子 | simplex.tex:54 | `eq:simplex-deficit` simplex.tex:59-61 | 亏量表达式 $\lvert A\rvert\,\lvert C\rvert-\frac{4^d}{d!}S$ 失去非负性 |
| `$4^d$` | 每个基的分母，来自 $2^d$ 个符号乘长度 $2$ | simplex.tex:69 | `eq:probability-real-integral` simplex.tex:80 | $P_I$ 与实积分差 $2^d$，$S\ge1$ 变 $S\ge2^d$ |
| `$8/\pi^2$` | `$F'(0)$`，也是 `$\lambda(0)$` | lens.tex:24 | 见证一致界 `$Y_k\in\lambda(0)B_{j_k}$` zero-deficit.tex:191 | 紧性失效则子列步骤 zero-deficit.tex:195 断 |
| `$2/\pi$` | 边界纵坐标速度 `$t'(s)$` | lens.tex:108 | `eq:lens-boundary-law` lens.tex:38-41 | $T$ 不再均匀，simplex.tex:66-69 的测度换算崩 |
| `$-\frac2\pi\operatorname{arctanh}(\sin\frac{\pi t}2)$` | `$\lambda'(t)$`，严格单调 | lens.tex:32-33 | `lem:boundary-ties` 的切方向至多一次 feasibility.tex:164-166 | Jacobi 零集带上二维条带，feasibility.tex:177-179 断 |
| `$-\sec\frac{\pi t}2<0$` | `$\lambda''$`，在端点发散 | lens.tex:35 | 顶点到凸包的凹性三步 zero-deficit.tex:186-189 | 公共见证对全体 $h\in C_j$ 不再成立 |
| `$\frac2\pi\eta\log\frac1\eta$` | `$\lambda(1-\eta)$` 主项 | lens.tex:148 | `eq:median-endpoint-error` median.tex:86-91 | 归一化成本的一阶系数消失，支撑不等式退化为 $0\le0$ |
| `$O(\eta)$` | 端点渐近的余项 | lens.tex:148 | 比值里的 `$O(1)$` 项 lens.tex:169-171 | 若余项是 $o(\eta)$ 之外更慢的量，一致性失效 |
| `$O_{a,b}(L^{-1})$` | 比值收敛速率，`$L=\log(1/\delta)$` | lens.tex:171 | `eq:lens-endpoint-ratio` lens.tex:151-155 | 若 $a=0$ 则 $\log c$ 无界，median.tex:96 求和换极限断 |
| `$\log\cot\frac{\pi s}4=\log(1/s)+O(1)$` | 端点积分的被积函数近似 | lens.tex:165 | `eq:lens-endpoint-asymptotic` lens.tex:148 | 主项由 $\eta\log\frac1\eta$ 变 $\eta$，$c$ 的幂次错 |
| `$N\ge d$` | 子式求和非空的前提 | holomorphic-mass.tex:34 | 结论 `eq:holomorphic-minor-mass` holomorphic-mass.tex:49-54 | $N<d$ 时求和为空，质量下界无意义 |
| `$k\ge1$` 整数 | 幂次必须单值全纯 | holomorphic-mass.tex:39-40 | `$f_k=(h_1^k,\ldots,h_m^k)$` feasibility.tex:54 | 分数幂需分支，$h_j^k$ 非全局全纯 |
| `$(\pi k)^d/d!$` | 孤立零点处的 Jacobian 子式质量和下界 | holomorphic-mass.tex:54 | `eq:feasibility-mass` feasibility.tex:72-73 | 差一个 $d!$ 就只剩 $S\ge c\ne1$ |
| `$\alpha_0(V)=1/2$` | 约定 `$d^c=\frac i4(\bar\partial-\partial)$` 下的通量密度 | holomorphic-mass.tex:144 | 与 $\lvert z\rvert^{2k}$ 的通量比较 holomorphic-mass.tex:167-171 | 改 $d^c$ 归一化则 $\pi$ 的幂次与下游不匹配 |
| `$k^d$` | 质量随指数的增长率 | holomorphic-mass.tex:57-58 | 径向换元后两侧相消 feasibility.tex:99 | 标度不匹配则 Fatou 后剩 $k$ 的残留因子 |
| `$\frac{\pi^d}{d!}$` | `$\mathbb C^d$` 单位球体积，也是测度总质量 | feasibility.tex:108-109 | `$\limsup M_{I,k}/k^d\le\frac{\pi^d}{d!}P_I$` feasibility.tex:118-119 | 两侧不同源则 $S\ge1$ 的常数不消 |
| `$u_i=\rho_i^{1/k}e^{i\theta_i}$` | 使 `$\lvert u_i\rvert^{2k}=\rho_i^2$` 的换元 | feasibility.tex:91 | 固定域 `$\sum_i\rho_i^2<1$` feasibility.tex:100 | 若用常规 $\rho$，域随 $k$ 变形，Fatou 无处可施 |
| `$S=\sum_{I\in\mathcal B}P_I$` | 下界 $1$，无一般位置假设 | feasibility.tex:31 | `eq:simplex-integral` simplex.tex:53-54 | $S\ge1$ 失守则亏量无非负上界 |
| `$D_I=\lvert\det B_I\rvert$` | 换元 Jacobi 兼单纯形体积分子 | feasibility.tex:21 | `eq:simplex-volume-sum` simplex.tex:116-118 | 两处出现必须同为 $D_I$，否则等号变不等式 |
| `$\mathbb P\{b_jZ_I\in\partial D\}=0$` | 额外边界等式的概率 | feasibility.tex:154 | 去重与内部不交 simplex.tex:85-99 | 重复计数使 $d!\,\lvert\Sigma_X\rvert$ 高估，$P\ge4^d/d!$ 失效 |
| `$r\le d$` | 选出行数上界 | zero-deficit.tex:40 | 聚合 `$r_\pm$` 的项数固定 median.tex:68-72 | 若 $r> d$ 则等式组过定，见证 $Y$ 一般不存在 |
| `$T=\max\{p_Q(q),\lvert a\rvert\}$` | 权重总量，$\ell_\infty$ 型 gauge | zero-deficit.tex:38 | `eq:optimal-representation` zero-deficit.tex:44-45 | 若取和则 $\sum\alpha_i>T$，最省性质丢失 |
| `$\frac{2\lvert K\rvert}{n+1}$` | 截面为 $(1-\lvert s\rvert)K$ 的积分结果 | zero-deficit.tex:76-77 | `eq:lift-equality` zero-deficit.tex:82 | 升维不再保等，$D_j\to0$ 无从谈起 |
| `$\frac{4}{n+1}$` | 乘 $\lvert K\rvert\,\lvert Q\rvert$ 的保等因子 | zero-deficit.tex:82 | §14 的 $d=n+1$ 起点 median.tex:56 | 换 $[-t,t]$ 需重归一 apex 参数 |
| `$t_j\in(0,1)$`，`$t_j\to1$` | 内逼放缩率 | zero-deficit.tex:88-89 | `eq:lift-sandwich` zero-deficit.tex:105-109 | $V_k\subset C_j$ 的成立性依赖它 |
| `$1-\varepsilon_j/r_0$` | 相对 Hausdorff 误差 | zero-deficit.tex:96-97 | $t_j$ 的存在性 zero-deficit.tex:99-101 | 绝对误差无法与位似兼容 |
| `$D_{j_k}<\lvert U_k\rvert\,\lvert V_k\rvert$` | 亏量小于乘积测度 | zero-deficit.tex:158 | `eq:nearby-feasible-pairs` zero-deficit.tex:137-141 | 取 $V_k$ 为单点则右端为 $0$，反证不启动 |
| `$\sum_i\theta_i=1$` | 顶点 $0$ 的极限权重为零 | zero-deficit.tex:215-221 | `eq:optimal-representation` 的 $\sum\alpha_i=T$ | 若和 $<1$ 则 $\xi$ 的表达少一份质量，成本比较错位 |
| `$a=\lambda(0.9)<4/15$` | 反例里的宽度上界 | simplex.tex:148-152 | `$2a<\lambda(0)$` simplex.tex:158 | 第三带不再冗余，图的说明失效 |
| `$32/45$` | `$\lambda(0)$` 的下界 | simplex.tex:154-155 | 同上 simplex.tex:158-159 | 与 $4/15$ 的大小关系是 $2a<\lambda(0)$ 的唯一依据 |
| `$\sqrt3/2$` | 两块阴影帽面积，占 `$\lvert C\rvert$` 三分之一 | simplex.tex:172 | 说明逐点覆盖为假 simplex.tex:145-147 | 若覆盖总满就不需要积分亏量论证 |
| `$A_\pm=(p\pm a)/2$`，`$c=(s-p)/2$` | 中位三半径，由三条线性方程唯一决定 | median.tex:31-32 | `eq:aggregate-set` median.tex:39-42 | 改系数则 $c+A_+=p_1$ 不再成立，夹逼等号失效 |
| `$[1-p_K(u),1+p_K(u)]$` | `$c$` 的紧子区间 | median.tex:81-82 | `lem:lens-endpoint` 的 $0<a\le b$ 前提 lens.tex:150 | 区间含 $0$ 时 $\log c$ 无界，误差不一致 |
| `$p\varepsilon_u(\delta)$` | 误差乘总权重 $T=p$ | median.tex:96-97 | `eq:median-support-interior` median.tex:107-110 | 系数与 $T$ 不匹配则 $\delta\downarrow0$ 后残留 |
| `$0Q=\{0\}$` | 饱和情形的约定 | median.tex:122-124 | `eq:median-membership` median.tex:125-127 | 无约定则 $s=p$ 时成员关系无定义 |
| `$t=d_1-r_1$` | 中位点越出第一球的脱出量 | median.tex:181 | `$z=m+\frac{t}{d_1}(x_1-m)$` median.tex:185-186 | $t>d_1$ 时 $z$ 落在线段外，三球交失败 |
| `$4^n$` | 偶函数化常数，无阶乘 | introduction.tex:216 | Gozlan 等价的 $c=4$ introduction.tex:293-296 | 若强行带 $n!$ 则与 Fradelizi-Meyer 的 $n+m$ 极限不匹配 |
| `$-n\log(4e^2)$` | 熵-输运不等式的加性常数 | introduction.tex:280 | `cor:entropy-transport` 的证明 introduction.tex:284-296 | 改 $c$ 则该常数联动，需重新推导 |
| `$e^n$` | 无偶性时的一般界 | introduction.tex:253-255 | 与 `cor:functional-mahler` 对照 | 与 $4^n$ 混用会掩盖偶性的作用 |
| `$(n+1)^{n+1}/(n!)^2$` | 一般问题常数，$n\ge2$ 时更小 | introduction.tex:125-126 | 独立性声明 introduction.tex:127-130 | 若更大则可由一般定理推出对称版，本文论证冗余 |
| `$2\le$ `Module.finrank ℝ` `$E$` | 分解定理的维数前提 | Classification.lean:388 | `median_decomposition` 三分支 Classification.lean:391-412 | $=1$ 时走 `hannerSpace_one` Classification.lean:253 |
| `$\lVert e z\rVert=\lVert z.1\rVert+\lVert z.2\rVert$` | `LDecomposition` 的范数可加公理 | Classification.lean:18 | `LDecomposition.hannerSpace` Classification.lean:353 | 缺此等式则单位球写不成 $\oplus_1$ 形式 |
| `$\operatorname{IsLinearHanner}$` | 结论谓词，线性像封闭 | HannerBodies.lean:29 | `symmetric_mahler_equality` Classification.lean:538 | 若只允许 `IsHanner` 则缺线性等价一侧 |
| `$\operatorname{HasMetricMedians}$` | `$\forall x:\operatorname{Fin}3\to E,\exists m$` | Medians.lean:19 | `equality_polar_gauge_medians` EqualityMedians.lean:606 | 去掉 `Fin 3` 改 `Fin 2` 则三球交性质无从谈起 |

自查：规格禁止的那五个短语与被禁的对举句式在本文里出现次数为 $0$，装饰性破折号与整行分隔符同样为 $0$；全部数学表达式都包在 `$...$` 里，绝对值一律 `\lvert \rvert`、范数一律 `\lVert \rVert`、整除一律 `\mid`，表格单元格内没有裸的竖线字符。信息源核对：正文只取自 `build/sections/` 下那 9 个 `.tex`，未接触任何 PDF 与 typst 分片；Lean 侧只读了给定的三行登记记录、`ComparatorChallenges/SymmetricMahlerEquality.json`、`OAI/Analysis/Mahler/` 内的 `Classification.lean` 及其 import 链上的定义行，另一条登记所在的 `MainTheorem.lean` 仅在 §1 出现一次用以说明分界，其 910 B 的内容没有被当作本篇正文输入。
