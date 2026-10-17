# D32 Tingley 问题正解：我把球面等距的线性延拓做成一个缺陷二难

对象论文：`A positive solution to Tingley's problem`（2026-09-23，OpenAI）。
TeX 源码：`E:\math\preprints\A-positive-solution-to-Tingleys-problem-September-23-2026\build\main.tex`，单文件 544 行，另有 `references.tex`；typst 目录里有一个 `main.typ` 并行版本，我写作一律以 TeX 为准。
Lean：`E:\math\lean\OAI\Analysis\SphereIsometry\`，70 个 `.lean` 文件、9273 行，被认证的只有 `OAI.Tingley.tingley_sphere_isometry_full` 这一条（`Extension.lean:101`）。
素材：`E:\math\研究笔记\素材\Tingley问题正解-素材.md`，13.9 万字节，§一到§五完整；本文把它逐节展开成第一人称倒推。

记号约定与论文一致。$X,Y$ 是实 Banach 空间，$S_X=\{x\in X:\|x\|=1\}$ 带继承自 $X$ 的距离，$\|\cdot\|$ 不带下标（论文第 112 行末句："Norm subscripts are omitted when their spaces are clear."）。引文行号形如 `main:49` 指 `main.tex` 第 49 行，Lean 形如 `Basic.lean:50`。中文正文一律不写破折号，需要范围时用"到"或 ASCII 连字符；公式里的英文原句我保留 TeX 写法，行号标记也保留。

先钉一件事。任务下发时给的背景口径把这个 Tingley 问题说成"无穷维 Hilbert 空间上任意两个非零自伴算子是否酉等价于彼此的可数直和"。这个说法与本论文无关，`main.tex` 全文不支持它，我在动笔前逐段核过：论文从头到尾谈的是实 Banach 空间单位球之间的满射保距映射能否线性延拓，是一个 Mazur–Ulam 型的度量延拓问题，不涉及 Hilbert 空间、自伴算子、酉算子、谱测度或直和分解。论文里唯一用到"不动点定理"的地方是几何不动点（Kuratowski 非紧测度加 Darbo，再用 Sperner/Brouwer 证 Schauder），不是算子共轭意义上的不动点。若有人记忆中的"算子直和 Tingley 问题"另有所本（Tingley 的名字确实挂在不止一个问题上），那是本论文未述的内容，本文严格忠于 TeX 原文，不往这里塞算子代数。下文凡是模板要求核对"算子/谱参数"的位置，我一律换成对应的"泛函/范数参数"。

## 0 我进场时手里有什么

我进场时手里有一个明确的正面目标和一个已经失败的入口。目标是 Tingley 问题的全称版本：任意两个非零实 Banach 空间的单位球之间，任何满射保距映射 $f:S_X\to S_Y$ 是否都唯一地线性延拓到整个空间。失败的入口是经典机器：Mankiewicz 定理说凸集之间（有内点者）的满射保距可以仿射延拓，而单位球在环境空间里内点为空，Mankiewicz 直接够不着（`main:61-65`）。

> Mazur and Ulam proved that every surjective isometry between real normed spaces is affine \cite{MazurUlam1932}; Mankiewicz obtained an extension theorem for surjective isometries between convex sets with nonempty interiors \cite{Mankiewicz1972}. A unit sphere has empty ambient interior, so this does not directly provide the desired extension.

我读这段话时记住的，是最后一句造成的缺口。球面只携带"同半径两点之间"的距离 $\|x-y\|$（$x,y\in S_X$），而线性延拓一旦存在就必须是径向映射 $T(x)=\|x\|f(x/\|x\|)$，它要在全空间保距，就得同时管住"不同半径两点之间"的距离 $\|x-qy\|$（$0<q<1$）。这个跨半径距离在球面度量里根本没有出现。我把这层障碍原样抄进导言（`main:49`）：

> Any such extension must be the radial map below. This candidate preserves norms and distances at each fixed radius; the difficulty is to recover distances between points at different radii from the metric on a single sphere.

这第三句是全篇的立项句，后面所有机器都围着它转。我把它翻译成一句可操作的判据：径向映射保距，等价于球面图在所有半径上的跨半径距离误差恒为零。于是我引入缺陷量。给定 $f$，定义

$$D_q(x,y)=\|f(x)-qf(y)\|-\|x-qy\|,\qquad M=\sup_{x,y\in S_X,\ 0\le q\le1}|D_q(x,y)|.$$

$M$ 就是我手里唯一的可操作对象：它精确量化"跨半径距离恢复失败了多少"。$M=0$ 时 $T$ 保距，我直接进 Mazur–Ulam；$M>0$ 时我假设反例存在，目标是把它逼死。整个证明因此是一个二难，这个骨架是我进场第一晚就定下的。

第二条我进场时就有的东西是文献给我的路径地图。到这篇之前，问题在若干具体空间类上已被逐类攻克：Wang 处理复 $C_0$-空间球面（`main:71-73`），Ding 处理 $\ell^p(\Gamma)$（$p>1$、$p\ne2$，`main:73-75`），Cheng–Dong 把"任意目标"版本正式命名为 Mazur–Ulam 性质（`main:76-78`），Tan 证了 $\sigma$-有限测度上实 $L^p$（$1<p<\infty$、$p\ne2$，`main:80-82`），Tanaka 走面几何（`main:84-86`），算子代数程序则把任意复 von Neumann 代数、其预对偶、以及幺复 $C^*$-代数视作实空间的情形都拿下（Fernández-Polo–Peralta、Mori、Mori–Ozawa，`main:87-92`）。有限维一侧，Banakh 对每个二维实 Banach 空间证了 Mazur–Ulam 性质（`main:97-98`）；最近的成果仍锁定具体空间或球面自等距：Fakhoury 处理 Schreier 空间及其 $p$-凸化的球面自等距（`main:99-101`），Huang–Zhu 处理任意 von Neumann 代数配套的 Haagerup 非交换 $L_p$（$1<p<\infty$、$p\ne2$）以及 $0<p<\infty$、$p\ne2$ 的 Schatten $p$-类含拟 Banach 情形（`main:102-107`）。这些结果全部依赖具体结构：$p$、光滑性、面结构、算子积。我要证的是去掉一切结构假设的版本（`main:59`）：

> The spaces may have arbitrary dimension and need not be separable, reflexive, smooth, or strictly convex. Applied to complex Banach spaces regarded as real spaces, the conclusion is real linearity; complex linearity is not asserted.

这条范围声明反过来限制了我能用什么工具：任何依赖严格凸（次梯度唯一）、光滑（范数可微）、自反（闭球弱紧）或可分（对角线抽取）的路线都不许走。我在 §0 结束前给自己划的红线就是这个。

第三条：我知道最后一步（仿射到线性）是经典的，不需要我发明。$T$ 只要证成满射保距且 $T(0)=0$，Mazur–Ulam 就给仿射性，我再补齐次。这一段的机器我打算借 Nica 的中点反射短证（`main:463`）。所以我真正的战场被压缩在"$M$ 必为零"这一件事上，其余全是接口。我后来把这条自我定位写进导言（`main:93-95`）：

> Our common-support propagation has a geometric affinity with facial methods; the invariant set and its return-map estimate are constructed directly below.

"有亲缘、但直接构造"，这是我对自己的诚实描述。面方法的机器我不搬，我只要它的几何直觉。

本笔注叙事对应的论文目录为 preprints/A-positive-solution-to-Tingleys-problem-September-23-2026，在 .tools/lean_queue.txt 队列第 25 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 问题精确陈述、勘误点与主定理

先把主定理钉死（`main:51-57`，Theorem 1.1）：

```latex
\begin{theorem}\label{thm:main}
Let $X,Y$ be nonzero real Banach spaces and let $f:S_X\to S_Y$ be a surjective isometry. Then
\[
T(0)=0,\qquad T(x)=\norm{x}f\left(\frac{x}{\norm{x}}\right)\quad(x\ne0)
\]
is a surjective real-linear isometry. It is the unique linear extension of $f$.
\end{theorem}
```

摘要（`main:43-45`）把整个证明压成三句：

> Every surjective isometry between the unit spheres of real Banach spaces extends uniquely to a surjective real-linear isometry, giving an affirmative solution to Tingley's problem. If distances between different radii are not preserved, we realize the positive maximal defect in a possibly enlarged pair of Banach spaces. We then align extremal chords using common supports and Darbo's fixed-point theorem and obtain a contradiction from support and convexity estimates.

我把这三句拆成我的三步。"realize the positive maximal defect in a possibly enlarged pair"，是"取极值"：把缺陷 $M$ 在一个可能被我扩出去的新空间对里精确取到；"align extremal chords using common supports and Darbo's fixed-point theorem"，是"找对齐"：用公共支撑加不动点造出两条共线的极值弦；"obtain a contradiction from support and convexity estimates"，是"定量矛盾"：用支撑符号和凸性割线把取到的正缺陷逼成不可能。"possibly enlarged"三个字我特意保留，因为它承认了新空间（超滤商再加完备化）是手段不是对象，这一步不是把问题搬回原空间能做到的。

问题的原始出处我给准。`main:49` 那句 `\cite{Tingley1987}` 对应 references.tex 第 127-131 行：D. Tingley, *Isometries of the unit sphere*, Geometriae Dedicata **22** (1987), 371-378。论文没有更早年份的细节，它只在 `main:66-69` 陈述该文做了什么：

> Tingley's original paper established preservation of antipodal points for surjective isometries between finite-dimensional Banach-space spheres \cite{Tingley1987}.

也就是对径点保持、有限维。我在稿子里不写"1970 年代提出"这种凭印象的话，原文只把出处钉到 1987 这一篇。标题里的 "real" 是关键字：这里 $S_X$ 是实 Banach 空间单位球；复空间被当作实空间处理，结论只到实线性（`main:59` 末句"complex linearity is not asserted"）。我在 Lean 里也严格从不出现 $\mathbb C$，见 §15。

我进场时最容易踩空的，恰恰就是这个背景陈述本身。市面上流传的"自伴算子酉等价于可数直和"版本，量化的是 $B(\mathcal H)$ 里的算子、用的是酉共轭与谱测度；那套语汇（共轭、谱、直和分解）在本论文里一个都不出现，硬套会逼我去写根本不存在的算子构造。我核对全文后确认这里的对象是赋范空间几何，并非内积几何：Lean 侧用到的 Mathlib 分析面是 `NormedAddCommGroup`、`Isometry`/`IsometryEquiv`、Hahn–Banach、Mazur–Ulam、`SeparationQuotient`、超滤、Kuratowski 非紧测度、凸性与介值，`Mathlib/Analysis/InnerProductSpace/*` 与谱定理任何部件都未 import。我把这条勘误放在最前面，就是防止自己在后面 460 行里无意识地滑进算子直和的框架。

## 2 五层构造与它们之间的接口

在拆层之前，我把自己在导言写的那段"作者注"抄出来，因为它就是我脑子里的分层草稿（`main:110`，Proof strategy 段，全引）：

> The argument measures the largest error in preserving a distance between two radius levels. Its central geometric step turns a hypothetical positive error into two aligned chords. Extremality propagates through common supports, producing an invariant closed convex set of directions. On this set an opposite-endpoint return map contracts the Kuratowski measure of noncompactness. Darbo's fixed-point theorem then supplies an aligned direction. The proof-specific work is the construction of this invariant set and the quantitative return-map estimate, followed by the chord contradiction; the supporting-functional, ultrapower, fixed-point and affine-extension tools are classical.

这段是我对自己的诚实清点：自造的三件（不变集构造、回返映射的定量估计、弦矛盾）与借用的四件（支撑泛函、超滤器、不动点、仿射延拓）。后面所有分层的重心都压在这三件自造物上，其余全是接口。

`main:112` 是章节路线图，原文逐字：

> Section~\ref{sec:supports} supplies the finite-dimensional supports and continuous radial contacts. Section~\ref{sec:attainment} makes a positive defect attain its maximum in a new pair of Banach spaces while retaining the bound at every radius. Section~\ref{sec:alignment} constructs the invariant directions and applies the fixed-point theorem. Section~\ref{sec:comparison} eliminates the resulting aligned configuration: one parameter regime contradicts maximality after a small radial perturbation, and the remaining regime contradicts a preserved sphere distance by convexity. Section~\ref{sec:extension} deduces the onto radial metric extension and proves real linearity by midpoint reflection. All auxiliary arguments are included, with the fixed-point proofs in Appendix~\ref{sec:appendix}.

据此我把证明拆成五层产出物，每层只吃前一层的输出对象，接口干净。这也是 Lean 能 1:1 对齐的原因。

层 0（§2 supports）交两件几何小工具。其一（Lemma 2.1）：三角等式 $\|\alpha v+\beta w\|=\alpha+\beta$ 逼出同时在 $v,w$ 取值 1 的公共支撑泛函；这是全篇所有"支撑传播"的原子。其二（Lemma 2.2）：从内点 $c$（$\|c\|<1$）出发的每条射线 $c+\mathbb R_+v$ 与球面有唯一切点，半径函数 $\rho(v)$ 连续且有 $1-\|c\|\le\rho\le1+\|c\|$；这是回返映射连续性的原子。

层 1（§3 attainment）把"是否存在正缺陷"规范化成一个取到配置。若某满射球等距 $M>0$，我用 $\mathbb N$ 上自由超滤器造 ultraproduct 商空间 $Q_X,Q_Y$ 再完备化，把缺陷搬进一对新的 Banach 空间，使得逐点半径 $t$ 处 $\|f(x_0)-tf(y)\|-\|x_0-ty\|=M>0$ 精确取到，且全局界 $|D_q|\le M$ 对所有对、所有 $q$ 保留（Lemma 3.1）。产出物登记为 eq:maximal。此后 §4-5 全程只谈这个配置。

层 2（§4 alignment）在取到配置内围绕基点 $ty$ 造回返映射 $g$：方向 $v\mapsto$ 球面切点 $x(v)=ty+pv\mapsto$ 像 $f(x(v))=tb+sw\mapsto$ 沿 $-w$ 另一侧球面切点 $f(z)=tb-uw\mapsto$ 拉回 $z\mapsto$ 反向归一 $g(v)=(ty-z)/r$。证 $g$ 保持一个不变闭凸集 $C\subset\overline{\operatorname{conv}}\{v_0,v_1,\dots\}\subset E$，其中 $E=\{v:s(v)-p(v)=M\}$ 是极值方向集；并且 $g$ 以系数 $\gamma=(1-M/(1+t))^2<1$ 压缩 Kuratowski 非紧测度 $\chi$。Darbo 定理给不动点 $v\in C$。产出物是 Proposition 4.2 的对齐弦：同一方向线上四个端点 $x=ty+pv,\ z=ty-rv,\ f(x)=tb+sw,\ f(z)=tb-uw$，满足 $s-p=r-u=M$，$d:=p+r=s+u=\|x-z\|\le2$。

层 3（§5 comparison）对对齐弦做两分支消元。$A=p/d$、$B=u/d$、$\epsilon=1-t$。secant 引理（Lemma 5.1）用缺陷界在两个特殊半径 $t-sh$、$t+uh$ 榨出支撑下界 $\epsilon/p\le\varphi(v)$ 与上界 $K\le1-B$（当 $B\le\epsilon$）或 $K\le B$（当 $B>\epsilon$）。若 $B>\epsilon$：径向微扰（Lemma 5.2）经逆构型传播得 $A>\epsilon$ 与支撑符号矛盾，故 $A,B\le\epsilon$。剩下小参数支用凸函数 secant 斜率单调给出两侧不一致（Proposition 5.3）。产出物：取到的正缺陷不可能存在。

层 4（§6 extension）合流：层 1 加层 3 $\Rightarrow$ 原球面图 $M=0\Rightarrow$ 径向映射 $T$ 保所有跨半径距离（含与 0 的距离）且满 $\Rightarrow$ Nica 中点反射给仿射 $\Rightarrow T$ 实线性、唯一。产出物 Theorem 1.1。

附录 A 自足地证 Darbo（Theorem 4.1），链条是 $\chi$ 基本性质（Lemma A.1）$\to$ 单纯形 Sperner 不动点（Lemma A.2）$\to$ 紧凸 Schauder（Lemma A.3）$\to$ condensing 迭代取交。

`[推测]` 我把分层讲得这么干净，部分是事后归整。真实的依赖我核对过接口对象：层 1 输出 eq:maximal，层 2 只吃 eq:maximal 输出 AlignedConfiguration 结构，层 3 只吃那个结构做纯标量与有限维论证，完全不回头碰不动点线。这个"对齐一旦交出去、后面就是有限维算术"的切断，是 Lean 里弦矛盾线（ChordSecant/Large/Small）不 import 任何 Darbo 文件的结构原因，我在 §15 会拿依赖图对齐这件事。

## 3 记号条目：单位球、缺陷 $D_q$ 与最大值 $M$

这一节没有对应的编号环境，定义性内容以正文段落与编号公式出现（论文没启用 `\begin{definition}`；`remark` 计数器 `main:17` 定义了但全文未用）。我把它当第一条重建，因为后面 13 条里的每个常数都从这里出发。

精确陈述（`main:49` 与 eq:defect，`main:147-160`）：

```latex
\begin{equation}\label{eq:defect}
D_q(x,y)=\norm{f(x)-qf(y)}-\norm{x-qy},\qquad
M=\sup_{x,y\in S_X,\ 0\le q\le1}|D_q(x,y)|.
\end{equation}
```

> The map $f$ is bijective. If $D_q^{f^{-1}}$ denotes the inverse map's defect, then

```latex
\begin{equation}\label{eq:inverse-defect}
D_q^{f^{-1}}(f(x),f(y))=-D_q(x,y)
\qquad(x,y\in S_X,\ 0\le q\le1),
\end{equation}
```

> so the inverse has the same absolute defect bound. Each $D_q$ is 2-Lipschitz as a function of $q$, uniformly in $x,y$, and $D_0=D_1=0$. Thus

```latex
\begin{equation}\label{eq:defectbound}
|D_q(x,y)|\le2\min(q,1-q),\qquad 0\le M\le1.
\end{equation}
```

机制我一步步推，不跳。

$f$ 是球面间等距。度量等距自动单射，满射是假设给的，所以 $f$ 双射，$f^{-1}$ 也是球面等距，这让 $D_q^{f^{-1}}$ 有定义。eq:inverse-defect 是纯代入：取 $(u,v)=(f(x),f(y))$，则 $D_q^{f^{-1}}(u,v)=\|f^{-1}(u)-qf^{-1}(v)\|-\|u-qv\|=\|x-qy\|-\|f(x)-qf(y)\|=-D_q(x,y)$。这里不需要 $f^{-1}$ 的任何额外性质，符号变号完全来自定义。这一条后面在层 3 反复被用：我可以随时把构型换成它的逆，缺陷绝对值不变。

$D_q$ 关于 $q$ 是 2-Lipschitz：固定 $x,y$，记 $a=f(x)$。$\big|\|a-qy\|-\|a-ry\|\big|\le\|(q-r)y\|=|q-r|\|y\|=|q-r|$（反向三角不等式，用 $\|y\|=1$）。于是 $q\mapsto\|f(x)-qf(y)\|$ 与 $q\mapsto\|x-qy\|$ 各自 1-Lipschitz，两个 1-Lipschitz 函数之差 $D_q$ 关于 $q$ 是 2-Lipschitz，且对 $x,y$ 一致。

端点归零：$D_0(x,y)=\|f(x)\|-\|x\|=1-1=0$（保范）；$D_1(x,y)=\|f(x)-f(y)\|-\|x-y\|=0$（$f$ 是球面等距）。这两句是整个估计引擎：$|D_q|=|D_q-D_0|\le 2q$，同时 $|D_q|=|D_q-D_1|\le2(1-q)$，取较小者得 $|D_q|\le2\min(q,1-q)$。再因为 $\min(q,1-q)\le1/2$，得 $|D_q|\le1$ 对所有 $q,x,y$，从而 $M=\sup|D_q|\le1$；$M\ge0$ 由取绝对值。eq:defectbound 就这么来的。

Lean 对应（`Basic.lean`）：`signedDefect`（:50，用 `q • (f y : Y)` 表示 $qf(y)$）；`HasDefectBound f M := ∀ q ∈ Set.Icc 0 1, ∀ x y, |signedDefect f q x y| ≤ M`（:54）；`absoluteDefects`（:57）把逐点可取到的绝对值做成集合；`maxDefect := sSup absoluteDefects`（:60）。论文说 $M$ 是 sup，Lean 用 `sSup` 并证 `hasDefectBound_maxDefect`（:136），界对所有对与 $q$ 成立且恰是 `sSup`，把论文合并在一句里的两件事拆开。2-Lipschitz 拆两层：单侧 `norm_sub_smul_lipschitz`（:83，证明即 `abs_norm_sub_norm_le` 加 `norm_smul`），合成 `signedDefect_lipschitz`（:94，`abs_sub` 拼装）。端点归零是 `signedDefect_zero`、`signedDefect_one`（:62,:66）。eq:defectbound 逐字对应 `signedDefect_le_endpoints`（:110，"分别对 0 与对 1"）与 `signedDefect_abs_le_one`（:119），再到 `maxDefect_le_one`（:145）。`IsometryEquiv (≃ᵢ)` 把"bijective"变成类型事实；`HasDefectBound.symm`（:76）是 eq:inverse-defect 加界不变的形式化，证明里需要满射展开 `f.surjective`，与论文口径一致。

假设与常数的机械理由，我逐条追。

为什么 $q$ 限制在 $[0,1]$。缺陷只在"单位球内跨半径插值"这个范围里测，接口在层 4（`main:455`）："For $a=\alpha x$ and $c=\beta y$, where $x,y$ are unit and $\alpha\ge\beta>0$, put $q=\beta/\alpha$"。任意两点归一化后总落进 $q\in[0,1]$（交换两点处理另一半）。一旦放开 $q$：端点 $D_1=0$ 仍保留，但 $D_0=0$ 对应的估计变成 $|D_q|\le2|q|$，于是 $M\le1$ 崩掉，$M$ 的上确界集不再一致有界，后面超滤器"有界实序列沿 $\mathcal U$ 有唯一极限"的前提直接失效。所以 $q\in[0,1]$ 与 $D_0=D_1=0$ 是绑在一起的。

因子 2 与 $\min(q,1-q)$ 喂给谁。喂给 Lemma 3.1 里 $M/2\le t\le1-M/2$ 这一步（`main:174`）。若极值半径 $t$ 落在该区间外，则 $2\min(t,1-t)<M$，与 $|D_t|=M$ 矛盾。这个夹逼保证后面 $h=\min\{t/s,\epsilon/u\}$ 给出的两个测试半径 $t-sh$、$t+uh$ 都落在 $[0,1]$（Lean `secant_radii_mem`，`ChordSecant.lean:111`）。缺陷界的形状不是随便挑的，它决定极值半径被卡在内部、不被推到端点。

为什么缺陷沿单一基方向 $y$ 定义（$x-qy$ ，并非一般二元组）。全篇一切支撑、secant、凸性计算都住在 $\operatorname{span}\{v,y\}$ 这个二维子空间或其有限扩张里；$x-qy$ 的一参数族是保住这种低维性的最小信息集。`[推测]` 这句动机论文没写，是我按证明反推的：如果一开始就写二元缺陷 $D(x,y;q,r)=\|qf(x)-rf(y)\|-\|qx-ry\|$，那我永远无法把比较降回 $\operatorname{span}\{v,y\}$ 的对偶紧性上，Lemma 2.1 的"有限张成"条款和层 3 的有限维子列极限都会失去落脚点。

`[推测]` 我进场时试过的三个变体，都在这里记掉。其一，只测 $q=1/2$（中点缺陷）。单端归零让双端挤压消失，$|D|\le$ 那个界没了，Lemma 3.1 里 $t$ 的选取无从谈起；就算允许 $t\equiv1/2$，层 3 的 secant 需要在 $t-sh$、$t+uh$ 两个半径上玩"一个免费零、一个吃 $M$ 界"的加权相消 $u\Delta_x+s\Delta_z$，只剩一种半径可用时公共目标范数 $\|w+hb\|$ 无法同时消掉（详见 §9）。其二，允许非满射等距。eq:inverse-defect 断，因为 $f^{-1}$ 不存在；超滤器构造里"Applying $f^{-1}$ termwise gives the inverse of $F$"（`main:189`）断；$M=0$ 后 $T$ 只保距单射，满射与后面 Mazur–Ulam 反射（要求 onto）全断。其三，用 $\|f(x)-f(y)\|-\|x-y\|$ 型球面缺陷。这项恒为 0（等距定义），毫无信息；跨半径参数 $q$ 正是问题的实质所在，把它去掉等于去掉问题本身。

## 4 Lemma 2.1：支撑存在与公共支撑（lem:support）

这是层 0 的第一件工具。前置定义段（`main:116`）先把"支撑"这个词钉死，术语首现我给全定义：

> A \emph{support} at a vector $a$ in a finite-dimensional normed space is a linear functional $\varphi$ with $\left\lVert\varphi\right\rVert\le1$ and $\varphi(a)=\left\lVert a\right\rVert$. All supporting functionals below may be taken on the finite-dimensional span of the vectors under discussion. The next lemma is the finite-dimensional Hahn--Banach extension argument \cite{Banach1929}; we include its elementary proof.

注意定义里是 $\|\varphi\|\le1$（至多），不是等于 1。这个"至多"在零向量处让零泛函也算支撑，是后面整条扩张链能从 $0$ 起步的关键。陈述（`main:118-124`）：

```latex
\begin{lemma}\label{lem:support}
Supports exist, and can be extended with the same norm bound to any specified finite-dimensional enlargement of their domain. If unit vectors $v,w$ and positive numbers $\alpha,\beta$ satisfy
\[
\norm{\alpha v+\beta w}=\alpha+\beta,
\]
then they have a common support: a norm-bounded linear functional taking value one at both.
\end{lemma}
```

我把证明（`main:125-133`）推到中间步骤。

起点：$a\ne0$ 时在直线 $\operatorname{span}\{a\}$ 上取 $L(\lambda a)=\lambda\|a\|$，它被范数控制（$|L(\lambda a)|=|\lambda|\|a\|=\|\lambda a\|$）且在 $a$ 取满。$a=0$ 时取零泛函。论文明写"or the zero functional at zero"，这句是为了让扩张链条从 $0$ 也能起步。

单步扩张 $V\to V+\mathbb R e$：要在 $e$ 处定一个值 $L(e)$，使得扩张后仍被范数控制。对每个 $a\in V$，相容条件 $|L(a)-\lambda L(e)|\le\|a+\lambda e\|$ 在 $\lambda=\pm1$ 给出 $L(e)\in[L(a)-\|a-e\|,\ L(a)+\|a-e\|]=:I_a$。于是可行值是闭区间族 $\{I_a\}_{a\in V}$。两两相交：需 $L(a)-\|a-e\|\le L(b)+\|b-e\|$，等价于 $L(a)-L(b)\le\|a-e\|+\|b-e\|$。左边 $L(a)-L(b)=L(a-b)\le\|a-b\|$（用 $|L|\le\|\cdot\|$ 在 $V$ 上），再 $\|a-b\|\le\|a-e\|+\|b-e\|$（三角不等式）。这正是 `main:131` 那一句 "$L(a)-L(b)\le\left\lVert a-b\right\rVert\le\left\lVert a-e\right\rVert+\left\lVert b-e\right\rVert$"。

全体共点：这些是 $\mathbb R$ 里的闭区间，有两两交非空（一维情形两两交等价于有限交性质 FIP），而 $a=0$ 对应的区间 $[-\|e\|,\|e\|]$ 是紧的，紧集上一族闭子集若有 FIP 则总交非空（`main:132`）。选一个公共点作 $L(e)$。选定后对所有 $a$ 有 $|L(a)-L(e)|\le\|a-e\|$。要证 $|L(a+\lambda e)|\le\|a+\lambda e\|$ 对一切 $\lambda$：分 $\lambda\ge0$ 与 $\lambda\le0$，把 $a+\lambda e$ 写成 $\lambda(\frac1\lambda a+e)$ 或 $(-\lambda)(-\frac1\lambda a-e)$，用 $|L(\cdot)-L(\cdot)|$ 的相容不等式除以 $|\lambda|$，即"rescaling proves the norm bound"。

有限次重复单步扩张，就把支撑延到任意指定的有限维扩张。

公共支撑尾部：设 $\|\alpha v+\beta w\|=\alpha+\beta$。取 $a=\alpha v+\beta w$ 的一个支撑 $\varphi$（$\|\varphi\|\le1$，$\varphi(a)=\|a\|=\alpha+\beta$）。则 $\alpha+\beta=\varphi(\alpha v+\beta w)=\alpha\varphi(v)+\beta\varphi(w)$。而 $\varphi(v)\le\|\varphi\|\|v\|\le1$、$\varphi(w)\le1$，故 $\alpha\varphi(v)+\beta\varphi(w)\le\alpha+\beta$。两个严格正权重 $\alpha,\beta>0$ 乘上 $\le1$ 的量要取到等号之和，必须每一项都取等，即 $\varphi(v)=1$、$\varphi(w)=1$。$\varphi$ 就是公共支撑。

Lean 对应（`Supports.lean`）不重证单步 HB，直接调 Mathlib：`SupportAt φ a := ‖φ‖ ≤ 1 ∧ φ a = ‖a‖`（:24）；存在性 `exists_support := exists_dual_vector'' ℝ a`（:28）；等范数扩张 `extension_norm_eq`（:73，包 `_root_.exists_extension_norm_eq`，即 Hahn–Banach）；有限扩张特化 `supportAt_finite_enlargement`（:110，docstring 强调这是更强版本、不需要子空间有限维）；"限制与扩张把全空间支撑断言化归到有限张成"是 `forall_supportAt_apply_iff_submodule`（:120），这是 `main:116` "may be taken on the finite-dimensional span"的形式化替身；公共支撑 `common_support_of_norm_add_eq`（:155），中间有双向引理 `norm_add_eq_iff_exists_common_supportAt`（:132）与 `supportAt_pos_smul_iff`（:48）；支撑的次梯度性质 `SupportAt.subgradient`（:67，$\varphi(z-a)\le\|z\|-\|a\|$），论文在层 3 的"support inequalities"处以同种不等式使用。

假设与常数的机械理由。

$\alpha,\beta>0$ 严格正，用在尾部逐项取等。若 $\alpha=0$，$\varphi(v)$ 完全失控，公共支撑结论直接假：两个向量的支撑面可以不相交。这条我在 §8 传播规则里要再吃一次。

$\|v\|=\|w\|=1$ 把 $\varphi\le1$ 与目标"取值 one"对齐。一般向量版 Lean 已证（:132），论文只声明单位版，因为全篇传播都在 $S_X$ 内进行。

"finite-dimensional enlargement"这个限定服务两处下游：层 2 传播需要同一个 $\varphi$ 在 $\operatorname{span}\{v_0,\dots,v_n,v_{n+1}\}$ 上对每个 $v_i$ 都取 1（`main:259` "extended to their finite span with the $v_i$"）；层 3 的 $L_n$ 收敛子列需要 $\operatorname{span}\{v,y\}$ 的对偶闭球紧（`main:406-413`）。去掉"有限维"三字论文依然对（用抽象 HB 加 Tychonoff 要更多拓扑），但论文的初等证明和紧性论证都得重写。Lean 干脆用无限维 HB（:110）把这条假设从形式化里删掉，这是论文与形式化的一个差异点。

$\|\varphi\|\le1$ ，并非 $=1$：零泛函在 $0$ 处也算支撑（`supportAt_zero_iff`，`Supports.lean:39`），全链因此没有 $a=0$ 的特判分支。

`[推测]` 候选失败路线三条。其一，把标量泛函换成向量值 Hahn–Banach（延到 $Y$-值算子）。区间法失效：$\mathbb R$ 的 FIP 与闭区间紧性没有向量值的对应物，需要 Dugundji 型扩张而且保不住等范数。这解释了为什么全篇只用标量泛函，$Y$ 侧只出现范数值。其二，改用次微分 $\partial\|\cdot\|$ 语言。等价但无节省：公共支撑存在性就是 $\partial\|v\|\cap\partial\|w\|\ne\emptyset$ 的重述，而该等价性本身正是本引理的内容，用它是循环论证。其三，放弃 $\|\varphi\|\le1$ 只要求 $\varphi$ 在组合处取范数。则归一 $\varphi(v)=1$ 失效，层 2 里"$1=\varphi(l)\le\|l\|\le1$"的夹逼两端全缺。

## 5 Lemma 2.2：径向切点（lem:radial）

层 0 的第二件工具，也是回返映射的定义前提。陈述（`main:135-139`）：

```latex
\begin{lemma}\label{lem:radial}
If $\norm{c}<1$, each ray $c+\R_+v$, $v\in S_X$, meets $S_X$ at a unique point $c+\rho(v)v$. The radius is continuous and satisfies
\[
1-\norm{c}\le\rho(v)\le1+\norm{c}.
\]
\end{lemma}
```

证明（`main:141-143`）四步，我把"内点凸组合"那句展开成可独立读的论证。

存在性："Continuity of the norm and boundedness of the unit ball give contact."。固定 $v$，$\lambda\mapsto\|c+\lambda v\|$ 连续，$\lambda=0$ 处 $\|c\|<1$，$\lambda=1+\|c\|$ 处 $\|c+(1+\|c\|)v\|\ge(1+\|c\|)-\|c\|=1$（反向三角不等式）。介值定理给某 $\rho$ 使 $\|c+\rho v\|=1$。这里没有用完备性，也没有用任何几何假设，普适性正来自此。

唯一性是这段的几何核心。原文："Every point strictly between an interior point of a convex ball and a point of that ball is interior: the corresponding convex combination contains a ball of positive radius about it." 展开：设 $\lambda_1<\lambda_2$ 都是切点。$\lambda_1=0$ 不可能（$\|c\|<1$）。取 $\theta=1-\lambda_1/\lambda_2\in(0,1)$，则 $c+\lambda_1v=\theta c+(1-\theta)(c+\lambda_2v)$。$c$ 是开球 $B_1(0)$ 的内点，故存在 $\varepsilon>0$ 使 $B_\varepsilon(c)\subset B_1(0)$。开球与闭凸球的凸组合满足 $\theta B_\varepsilon(c)+(1-\theta)(c+\lambda_2v)\subset B_1(0)$ 的内部，而该组合是以 $c+\lambda_1v$ 为心、半径 $\theta\varepsilon$ 的球。于是 $c+\lambda_1v$ 是内点，与 $\|c+\lambda_1v\|=1$ 矛盾。所以切点唯一。这一步是整条证明里唯一用到"凸球几何"的地方，也是它对任意赋范空间成立的原因。

界：$1=\|c+\rho v\|\le\|c\|+\rho$ 给 $\rho\ge1-\|c\|$；$\rho=\|(c+\rho v)-c\|\le\|c\|+\|c+\rho v\|=1+\|c\|$ 给上界。两次三角不等式。

连续性：子列论证。$\rho(v_n)$ 落在 $[1-\|c\|,1+\|c\|]$，有界；任一收敛子列的极限 $\rho_*$ 满足 $\|c+\rho_*v\|=1$（范数连续加 $v_n\to v$），唯一性给 $\rho_*=\rho(v)$；有界实数列若每个收敛子列同极限则全列收敛。注意这里用的是 $\mathbb R$ 的列紧（波尔察诺魏尔斯特拉斯），只作用在半径这个标量上，不涉及 $X$ 的单位球紧性，所以无穷维无障碍。

Lean 对应（`RadialContact.lean`）：`existsUnique_radialContact (c : X) (hc : ‖c‖ < 1) (v : UnitSphere X)`（:97），存在性走介值（该文件 import `Mathlib.Topology.Order.IntermediateValue`）；唯一性 `contact_unique`（:69）经比较引理 `contact_comparison_ordered`/`contact_comparison`（:25,:53，内点论证的代数化）；`radialRadius`（:124）配 `radialRadius_spec/_pos/_bounds/unique`（:127-141）；连续性给定量 Lipschitz：`radialRadius_sub_le`（:155）$\Rightarrow$ `lipschitz_radialRadius`（:184）$\Rightarrow$ `continuous_radialRadius`（:190）；切点本体 `radialContact`（:194）、`continuous_radialContact`（:200）。Lean 比论文强：给了显式 Lipschitz 常数，为层 2 回返映射连续性提供机器可用的形式。

假设的机械理由。

$\|c\|<1$ 必须严格。第 2 步需要起点是内点；$\|c\|=1$ 时非严格凸空间里射线可与球面交于一段线段，唯一性失效，$\rho$ 不再是函数。全篇 $c=ty$ 与 $c=tb$，两次消费 $t<1$（$p$ 侧切点与 $u$ 侧切点）。Lean `returnCenter_lt_one`（`ReturnMap.lean:43`）明确记录 $t<1\Rightarrow\|ty\|<1$。

区间 $[1-\|c\|,1+\|c\|$ 在层 2 以"四个半径 $\in[1-t,1+t]$"出现（`main:241`、`main:230`），直接喂收缩估计：$up/rs=(1-M/r)(1-M/s)\le(1-M/(1+t))^2=:\gamma$ 用到 $r,s\le1+t$；分母正性 $r,s\ge1-t>0$ 再次消费 $t<1$。Lean：`radii_bounds`（`ReturnMap.lean:148`）、`unit_radius_bounds_of_*`（`AlignedConfiguration.lean:46-84`）、`return_factor_mem_Ico`（`ReturnMapBounds.lean:81`）。

完备性：本引理在任意赋范空间成立，Lean 陈述里没有 `CompleteSpace`，与论文一致。论文的 Banach 假设在别处消费（超滤商完备化、Darbo、Mazur–Ulam）。

`[推测]` 候选失败路线三条。其一，用最佳逼近元唯一性（近凸性）替代内点论证。一般赋范空间不近凸，机制直接断，论文论证的普适性正是它的卖点。其二，改用整条过 $c$ 的直线与球面相交。直线给两个交点，需要连续选择分支，$g$ 的定义会引入选择歧义；论文以 $+v$ 取 $x$、$-w$ 取 $z$ 的方向半射线显式管住分支，Lean 的 `sphereNeg`（`ReturnMap.lean:28`）形式化"对侧 $=-w$ 归一"，证实分支必须显式管理。其三，在无穷维改用弱紧性证存在。单位球弱紧需要自反，论文不假设自反（`main:59` 明示），违背定理强度；介值路线不花任何几何假设，是我唯一愿意走的那条。

## 6 Lemma 3.1：正缺陷的取到（lem:attainment）

层 1。这一层把"缺陷是否可能为正"这个全局存在性问题，规范化成一个取到的配置。前置句（`main:162`）："The attainment argument uses the standard Banach-space ultrapower construction \cite{DacunhaCastelle1972}. We give the construction and verify its sphere-map and defect properties directly." 陈述（`main:164-172`）：

```latex
\begin{lemma}\label{lem:attainment}
If some surjective sphere isometry has $M>0$, there are nonzero real Banach spaces, a surjective sphere isometry, still denoted by $f:S_X\to S_Y$, and $x_0,y\in S_X$, $0<t<1$, such that
\begin{equation}\label{eq:maximal}
\begin{aligned}
|D_q(a,c)|&\le M &&(a,c\in S_X,\ 0\le q\le1),\\
\norm{f(x_0)-tf(y)}-\norm{x_0-ty}&=M>0.
\end{aligned}
\end{equation}
\end{lemma}
```

注意"still denoted by $f$"这个改名重载：新空间上的映射与旧映射同名，但那是不同的映射。这个记法欺骗性很强，我在 Lean 里绝不让它发生（Lean 显式构造成 `completedUltraSphereEquiv`）。

证明（`main:173-197`）分四段，我一段一段推。

第一段序列预备（`main:174`）。由 $M=\sup|D_q|>0$ 取三元组序列 $(x_n,y_n,q_n)$ 使 $|D_{q_n}(x_n,y_n)|\to M$。取符号子列使缺陷同号趋于 $+M$ 或 $-M$；若为 $-M$，用 eq:inverse-defect 把映射换成 $f^{-1}$，缺陷变号，不失一般性设为 $+M$。$q_n\in[0,1]$ 紧，取子列 $q_n\to t\in[0,1]$。$|D_{q_n}(x_n,y_n)-D_t(x_n,y_n)|\le2|q_n-t|\to0$（关于 $q$ 的一致 2-Lipschitz），所以可把所有半径换成同一个 $t$，仍保持 $D_t(x_n,y_n)\to M$。由 eq:defectbound，$M=\lim|D_t|\le2\min(t,1-t)$，逼出 $M/2\le t\le1-M/2$。因 $M>0$，$t\in(0,1)$。这是"$0<t<1$"出处的唯一一行，后面 $t$ 的双重身份（缺陷半径、内点系数）全靠它。

第二段超滤器地基（`main:176`）。取 $\mathbb N$ 上自由超滤器 $\mathcal U$："a maximal proper filter containing all cofinite sets. It exists by the maximal principle, since a union of a chain of such filters is again a proper filter. We use the usual set-theoretic framework with choice here." 滤子链的并仍真（真滤子不含空集，链并也不含），故 Zorn 给极大元，极大滤子即超滤。性质：任一子集或其补属于 $\mathcal U$。有界实序列沿 $\mathcal U$ 有唯一极限：设序列落在紧区间 $J$，闭集族 $\{\overline{\{a_n:n\in A\}}:A\in\mathcal U\}$ 有 FIP（两 $A,B\in\mathcal U$ 的交在 $\mathcal U$ 且非空），紧性给总交非空，超滤性质把它压成单点（若含两点可用某子集分离成两个 $\mathcal U$-大集矛盾）。记 $\lim_{\mathcal U}a_n$。这些极限保和、保序、与连续实函数交换。

Lean 第 6 步用具体构造 `freeUltrafilter := Filter.hyperfilter ℕ`（`UltraRealLimit.lean:135`，$\mathbb N$ 乘积超滤，不调 Zorn），配套 `freeUltrafilter_le_cofinite`（:137）、`not_mem_freeUltrafilter_of_finite`（:144）；第 8 步是 `tendsto_realULim`（:76，闭区间紧加 Hausdorff 极限唯一）；第 9 步拆成 `realULim_add/_neg/_sub/_const_mul/_abs/_le_realULim` 等（:97-133）与 `RealSeqBounded` 结构（:24，把论文"bounded real sequence"变成类型类假设）。`realULim_eq_of_tendsto`（:88）说滤子极限唯一则等于 ULim。

第三段商空间 $Q_X$（`main:178-182`）。在有界序列空间上放半范数 $\|(a_n)\|_{\mathcal U}=\lim_{\mathcal U}\|a_n\|$。三角不等式逐点 $\|a_n+b_n\|\le\|a_n\|+\|b_n\|$，经保序性传递到极限。$Q_X$ 是对该半范数核取商，带诱导范数。常数序列等距嵌入 $X,Y$：常数类范数 $\lim_{\mathcal U}\|x\|=\|x\|$，$X\ne0$ 则 $Q_X\ne0$。单位代表引理很关键：商里每个单位向量类都有全由单位向量组成的代表。做法是逐项归一（$a_n\ne0$ 时 $a_n'=\|a_n\|^{-1}a_n$），零项换成固定单位向量 $e$。误差估计 $\|a_n'-a_n\|\le|\|a_n\|-1|$：$\|a_n\|\ne0$ 时 $\|a_n/\|a_n\|-a_n\|=\|a_n\||1-\|a_n\|^{-1}|=\||\|a_n\|-1|\|$；$\|a_n\|=0$ 时 $a_n'=e$、$a_n=0$，差 $=\|e\|=1=|0-1|$。类是单位的意味着 $\lim_{\mathcal U}\|a_n\|=1$，故 $|\|a_n\|-1|$ 沿 $\mathcal U$ 极限为 0，于是 $\lim_{\mathcal U}\|a_n'-a_n\|=0$，$a_n'$ 与 $a_n$ 同类。

Lean 半范数与商在 `UltraNormed.lean`：`boundedSequenceSubmodule`（:26，统一有界 $\exists B,\forall n,\|a\,n\|\le B$ 的子模，用统一界保证 $\lim_{\mathcal U}\|a_n\|$ 存在）、`structure UltraSequence`（:42，docstring 自述这是 fresh wrapper，只搬运代数，拓扑从 ultralimit 半范数构造）、`UltraQuotient := SeparationQuotient (UltraSequence U X)`（:146）、`norm_classOf`（:175）、`constantEmbedding : X →ₗᵢ[ℝ] UltraQuotient U X`（:190）、`ultraQuotient_nontrivial`（:198）；完备化 `UltraCompletion := UniformSpace.Completion ...`（:205）加 `ultraCompletion_nontrivial`（:209）。单位代表在 `UnitRepresentatives.lean`（48 行）。

第四段 $F$、缺陷传递、完备化（`main:184-196`）。对单位代表序列逐项作用 $f$：$F([a_n]):=[(f(a_n))]$。良定义与保距同源：$\lim_{\mathcal U}\|f(a_n)-f(b_n)\|=\lim_{\mathcal U}\|a_n-b_n\|$ 一次同时给出代表无关（两代表差半范数 0，逐项 $f$ 后差半范数也 0）与距离保持（$\|F([a])-F([b])\|=\lim_{\mathcal U}\|a_n-b_n\|=\|[a]-[b]\|$）。逐项作用 $f^{-1}$ 给 $F$ 的逆，故 $F$ 满。缺陷逐半径传递：固定 $q$，$\|F([a_n])-qF([b_n])\|-\|[a_n]-q[b_n]\|=\lim_{\mathcal U}D_q(a_n,b_n)\in[-M,M]$，左等右由半范数定义把两范数各写成 ultralimit 再相减，右不等由逐点 $|D_q|\le M$ 加保序性。由于对与 $q$ 任意（单位代表引理保证每个类都有单位代表，"任意对"覆盖整个商球面），界对所有对、所有半径成立。选定的极大化序列在 $q=t$ 取等：$\lim_{\mathcal U}D_t(x_n,y_n)=M$。

完备化那一步是论文一句带过、我形式化时最吃力的段落之一。原文："Complete both quotient spaces. Their unit spheres are the metric completions of their previous spheres, by density and normalization. Extending the induced isometry and its inverse gives inverse maps by continuity and density, hence a surjective isometry of these completed spheres. Continuity preserves the defect bound and the selected equality." 展开：商空间稠密嵌入完备化，球面像稠；$F$ 与 $F^{-1}$ 都是等距，对 Cauchy 列保持等价类，由一致连续延拓定理各自连续延到完备化，密度加连续性保证延拓后仍互为逆（在一方像稠的点上已互逆），故得到完备球面间的满射等距；$D_q$ 作为完备球面上连续函数（等式两边连续），逐点界与取等点在极限下保留。

Lean：第 14-16 步在 `UltraSphere.lean`：`ultraSphereEquiv`（:108，要求 `[Nontrivial X] [Nontrivial Y]`，归一化需要固定单位向量存在）、`signedDefect_ultraSphereEquiv`（逐项缺陷 = ULim 缺陷，`DefectAttainment.lean:35` 复合用）。第 17 步在 `SphereCompletion.lean`：`sphereCoe`（:34）、`sphereCoe_isometry`（:42）、`sphereCoe_denseRange`（:60）、`sphereCompletionEquiv`（:112）、`completedSphereEquiv`（:145，把 ≃ᵢ 提升到完备化）、`HasDefectBound.completedSphereEquiv`（:192）、`attainedDefect_completedSphereEquiv`（:205），其中 `continuous_signedDefect_pair`（:179）就是"$D_q$ 连续"这一步。总装在 `DefectAttainment.lean`：`completedUltraSphereEquiv`（:25）加 `positive_maxDefect_attained_or_inverse`（:51）。

Lean 与论文的关键措辞差：论文陈述用"若某个满射球等距有 $M>0$"，Lean 主链不需要"存在某 $f$"这层析取，因为 `maxDefect` 就是对给定 $f$ 定义的 `sSup`（`Basic.lean:60`），`maxDefect_eq_zero`（`Extension.lean:39`）对任意 $f$ 直接证 $=0$：反设 `0 < maxDefect f`，`positive_maxDefect_attained_or_inverse` 构造型给 $F$、$t$、取等对，而且双向（$F$ 或 $F^{-1}$ 之一取到，取决于 $-D_q$ 符号朝向），正是论文"if necessary, replace the map by its inverse"的形式化，用 `Or` 显式携带两个朝向（`DefectSequence.lean:67`）。

引理证完后论文紧跟一句守恒声明（`main:199`），这句决定了后面两节的取材边界："It therefore suffices to rule out the attained configuration \eqref{eq:maximal}, which we retain throughout the next two sections." 我读它时的重点是"retain throughout"：层 2 与层 3 不再回到原空间，全程只在取到配置里工作，eq:maximal 是它们唯一的输入。

假设的机械理由。

"some $M>0$"是反证起点。全篇是缺陷二难：要么 $M=0$ 直接进层 4，要么造取到配置再矛盾。去掉反证框架，$M$ 可能只是上确界不取到，后面"$v_0\in E$ 非空"（`main:243`）就断了。

自由超滤器存在：这里不需要可数饱和性，只用 FIP；论文用 choice，Lean 用 `Classical.choice` 加具体 `hyperfilter ℕ`，连 Zorn 都省了。

$t\in[M/2,1-M/2]$ 消费两处：其一 $t\in(0,1)$ 让回返映射中心 $\|ty\|=t<1$，可用 Lemma 2.2；其二 $1-t\ge M/2>0$ 给 $a=1-t>0$（收缩分母）与 $\epsilon>0$。若允许 $t\to0$ 或 $1$，$a\to0$，收缩分步里的 $4\eta/a$ 会爆，半径区间 $[1-t,1+t]$ 退化。

完备化不可省。后面 Darbo 定理要在 Banach 空间对闭凸集用（Lean `CondensingFixedPoint.lean:22` 要求 `[CompleteSpace E]`），商 $Q_X$ 未必完备。

去掉"retaining the bound at every radius"会怎样：若只把缺陷取到而不把 $|D_q|\le M$ 全带过去，层 2 的 $s+u\le p+r$（用全局界于反向对）与 $r-u\le M$ 立即失去依据，eq:equality 的"两个不等式同时取等"机制整体塌。

`[推测]` 候选失败路线三条。其一，不用超滤器、改用弱紧或 Banach–Alaoglu。非自反空间闭球不弱紧，论文不假设自反，路线违背强度；即便自反，缺陷 $D_q$ 关于 $(x,y)$ 只是 Lipschitz ，并非弱连续（范数弱下半连续，差不是），"$D\to M$"取极限要 $f$ 更多结构，而 $f$ 无线性，弱拓扑对它毫无连续性。超滤器只依赖度量收敛，恰好够。其二，直接在原空间对 $(x_n,y_n)$ 取收敛子列。一般空间球面不列紧，无从保证。超滤器把列紧性失败外包给滤子极限。其三，只延拓到完备化而不处理"球面的完备化"与"完备化空间的球面"这对区别。论文的 $F$ 连续延拓到完备化球面要等距加满射双向延拓互为逆；若只单向延拓（用一致连续延拓定理）得到等距嵌入，并非满射，$f^{-1}$ 的存在与后续 `HasDefectBound.symm` 断链。Lean 的 `completedSphereEquiv` 用"先对 $f$ 与 $f^{-1}$ 各做 `sphereIsometryCompletion` 再证互逆"绕开这点（`SphereCompletion.lean:128-163`）。

## 7 Kuratowski 非紧测度 $\chi$ 与 Darbo 定理（thm:condensing 的陈述层）

层 2 的引擎是几何不动点，工具是 Darbo。术语首现我给定义。$\chi$ 是 Kuratowski 非紧测度：衡量一个集合离"能被有限个小直径集覆盖"还差多少，$\chi=0$ 恰对应完全有界。陈述（`main:203-215`）：

> For a bounded subset $H$ of a normed space, its Kuratowski measure of noncompactness \cite{Kuratowski1930} is
\[
\chi(H)=\inf\{\delta>0:H\text{ is covered by finitely many sets of diameter at most }\delta\}.
\]
> We use the uniform strict-contraction form of Darbo's fixed-point theorem \cite{Darbo1955}, proved in Appendix~\ref{sec:appendix}.

```latex
\begin{theorem}\label{thm:condensing}
Let $C$ be a nonempty closed bounded convex subset of a Banach space. If $g:C\to C$ is continuous and, for some $0\le\gamma<1$,
\[
\chi(g(H))\le\gamma\chi(H)\qquad(H\subset C),
\]
then $g$ has a fixed point.
\end{theorem}
```

定理本体在附录证明（§13），这里只记陈述层的机械理由，因为它每个词都有下游消费点。

"for all $H\subset C$"：不是只对某个特定集压缩。附录迭代 $C_{n+1}=\overline{\operatorname{conv}}(g(C_n))$ 时，每层的 $\chi$ 衰减都要假设对任意子集成立：$\chi(C_{n+1})=\chi(g(C_n))\le\gamma\chi(C_n)$，其中 $g(C_n)\subset C$。若只对 $H=C$ 成立，第一次迭代后即失控。

"uniform $\gamma<1$"：非均匀版本（每个 $H$ 有各自的 $\gamma_H<1$）不足以让 $\chi(C_n)\to0$，需要一致几何衰减 $\chi(C_n)\le\gamma^n\chi(C)$。

"$C$ closed bounded convex"：closed 加 Banach 让 $C$ 完备（嵌套闭集引理要用）；bounded 让 $\chi(C)<\infty$；convex 让 $\overline{\operatorname{conv}}$ 不跑出 $C_n\supset C_{n+1}$ 的归纳成立。

Lean：定义 `FiniteDiameterCover H δ`（`KuratowskiBasic.lean:20`，用 fintype 指标族显式"有限覆盖"）、`coverRadii`（:71）、`chi := sInf coverRadii`（:75）。定理本体 `exists_fixedPoint_of_kuratowski_contraction`（`CondensingFixedPoint.lean:26`）：假设表 `hCne hclosed hbounded（Bornology.IsBounded）hconv` 加 `hg : ContinuousOn g C` 加 `hmap : MapsTo g C C` 加 `hγ0 : 0 ≤ γ`、`hγ1 : γ < 1` 加对 `∀ H ⊆ C, chi (g '' H) ≤ γ * chi H`。Lean 把"Banach 空间"体现为 `[CompleteSpace E]`（:22），把 $g:C\to C$ 拆成环境映射 `g : E → E` 加 `MapsTo`，因为后续要在环境（ambient）空间上组合回返映射（在 subtype 上做拓扑不便）。docstring "No compactness premise on `C` is required" 与论文一致：这正是不动点定理对无穷维可用的全部凭据。论文 "$\chi(g(H))$" 在 Lean 是 `chi (g '' H)`。

$\gamma\ge0$ 的下界：$\chi\ge0$ 时可有 $\gamma=0$（紧情形退回 Schauder）；Lean 仍显式带 `hγ0`，因为几何级数衰减的单调性要用 $0\le\gamma$。完备性只用在附录嵌套集引理（"by completeness"），不用在 Darbo 证明其他处。

`[推测]` 候选失败路线三条。其一，用 Hausdorff 非紧测度 $\beta$（球覆盖版）替代 Kuratowski $\chi$（直径覆盖版）。两者等价（$2\beta\le\chi\le2\beta$ 型），但回返映射估计里"按 $p,u$ 值分箱给出像的直径控制"自然产出直径覆盖，并非球覆盖，且 $\beta(\operatorname{conv} H)\le\beta(H)$ 在一般度量空间不成立（要 Minkowski 型引理且带常数损失），换 $\beta$ 会把 §13 的 $\chi(\operatorname{conv} H)=\chi(H)$ 无损性质丢掉。这是选 $\chi$ 的硬理由，论文未述但机制清楚。其二，用 Darbo–Sadovskii 渐近版本或非压缩不动点。假设更弱，结论给近似不动点序列仍要闭性收尾，机制相当而无实质节省。其三，直接在 $E\subset S_X$ 上用 Schauder。$E$、$C$ 在无穷维不紧（$X$ 无穷维时单位球不列紧，$\chi(C)$ 可能大于 0），不压缩就没有固定点定理可用；回返映射恰好压缩 $\chi$ 是设计的内核，不是可替换的外壳，见 §8 的 eq:contraction。

## 8 Proposition 4.2：极值弦的对齐（prop:alignment，全篇几何核心）

层 2 的产出物。这是我在整篇里花纸最多的地方，也是 Lean 文件数最多的一层（对齐族约 1100 行）。陈述（`main:217-232`，整段包在 `\begin{samepage}` 防跨页）：

```latex
\begin{proposition}\label{prop:alignment}
Under \eqref{eq:maximal}, put $b=f(y)$ and keep $y,t$ fixed. There are endpoints $x,z\in S_X$, directions $v\in S_X$, $w\in S_Y$, and positive numbers $p,r,s,u$ such that
\begin{equation}\label{eq:chords}
\begin{aligned}
x&=ty+pv\in S_X,& z&=ty-rv\in S_X,\\
f(x)&=tb+sw\in S_Y,& f(z)&=tb-uw\in S_Y,
\end{aligned}
\end{equation}
and
\begin{equation}\label{eq:radii}
s-p=r-u=M,\qquad d:=p+r=s+u=\norm{x-z}\le2.
\end{equation}
All four radii belong to $[1-t,1+t]$.
\end{proposition}
```

读法要点：$z=ty-rv$ 与 $x=ty+pv$ 在同一条过 $ty$ 的直线上（方向 $v$ 与 $-v$），$f(x),f(z)$ 同理在过 $tb$ 的直线（方向 $w$）上。"aligned"就是指两端点各自共线。层 3 后面所有比较都靠这个共线结构，一旦不对齐就全盘散架。论文配的图注（`main:315`，fig:chords）把这条账目画成一句话，我在下面模块里逐条兑现它：

> The aligned chords of Proposition~\ref{prop:alignment}. Each segment is drawn along its own unit direction. The inner points are $ty$ and $tb$; the endpoints lie on the respective unit spheres. The diagram records lengths only, with $p+r=s+u$ and $r-u=s-p=M$.

"records lengths only"是关键提醒：图里没有任何角度或正交信息，$X$ 与 $Y$ 两条弦各自沿自己的单位方向摊开，两空间之间除了 $f$ 之外没有几何对应。层 3 的消元也只吃这张长度账，不吃任何被图误导出的"两弦平行"直觉。

我把证明（`main:233-294`）拆成五个模块。

模块 1，回返映射的定义（`main:234-241`）。概念蓝图（原文逐字）：

> Starting from a direction at $ty$, we map its sphere contact to $S_Y$ and take the opposite sphere contact on the line through $tb$. Pull this opposite endpoint back to $S_X$, and reverse its direction from $ty$. A fixed direction for this return map will align the two chords.

这条五步链条：$v\Rightarrow x(v)\Rightarrow f(x(v))\Rightarrow$ $Y$ 侧对面切点 $\Rightarrow z:=f^{-1}(\cdot)\Rightarrow g(v):=(ty-z)/\|ty-z\|$。形式定义 eq:return（`main:236-240`）：

```latex
f(x(v))=tb+sw,\qquad f(z)=tb-uw\in S_Y,\qquad
r=\norm{z-ty},\quad g(v)=\frac{ty-z}{r},
```

其中 $p=p(v)>0$ 由 Lemma 2.2 定出 $x(v)=ty+pv\in S_X$（中心 $ty$，$\|ty\|=t<1$）；$s=s(v):=\|f(x(v))-tb\|$，$w=w(v):=(f(x(v))-tb)/s$ 是 $Y$ 侧归一（方向非零由 $\|f(x(v))\|=1>t=\|tb\|$）；$u=u(v)>0$ 是中心 $tb$ 沿方向 $-w$ 的径向切点半径，$f(z)=tb-uw$（原文："where $w\in S_Y$ and $u>0$ is determined by radial contact in direction $-w$"）；$z:=f^{-1}(tb-uw)$；$r:=\|z-ty\|$；$g(v)=(ty-z)/r$。良定义与连续性："These quantities are continuous in $v$, and their positive radii lie in $[1-t,1+t]$." $p,u$ 由 Lemma 2.2 连续，$s,w,r$ 由范数与归一连续（分母非零：$\|f(x(v))-tb\|=s\ge1-t>0$），$g$ 复合连续；半径界 $p,u\in[1-t,1+t]$ 由 Lemma 2.2 直接给，$s,r$ 由"单位向量减 $t$ 倍单位向量"的三角夹逼同样落在 $[1-t,1+t]$。

Lean 把这条链逐一化名（`ReturnMap.lean`）：`pRadius`（:71，`= radialRadius (t • y) …`）、`xPoint`（:79）、`sRadius`（:83）、`wDirection`（:87，normalize）、`uRadius`（:92，对 `sphereNeg ∘ wDirection` 取 $tb$ 中心径向半径）、`zPoint`（:96，`= f.symm (radialContact …)`）、`rRadius`（:100）、`returnSphere`（:104，normalize $(ty-z)$）；界与正性 `pRadius_pos/_bounds`（:109-116）、`radii_pos`（:142）、`radii_bounds`（:148）；等式还原 `xPoint_eq/fxPoint_eq/fzPoint_eq/zPoint_eq`（:157-186）；`xPoint_surjective`（:219，把层 1 输出 $x_0$ 反解出 $v_0$ 的关键）；连续性逐条 `continuous_*`（:231-263）；环境版本 `pAmbient/sAmbient/uAmbient/rAmbient/returnAmbient`（:266-283）配 `continuousOn_*`（:303-343）。

模块 2，极值集 $E$ 与传播规则（`main:243-256`）。定义 $E=\{v\in S_X:s(v)-p(v)=M\}$。闭：$S_X$ 闭、$s-p$ 连续。非空：取 $v_0=(x_0-ty)/\|x_0-ty\|$，由径向切点唯一性 $x(v_0)=x_0$，此时 $s(v_0)=\|f(x_0)-tb\|$、$p(v_0)=\|x_0-ty\|$，eq:maximal 第二行说 $s(v_0)-p(v_0)=M$，故 $v_0\in E$。这里"唯一性"三个字是 Lemma 2.2 兑现给层 1 的接口。

对 $v\in E$ 有两不等式（`main:244-246`）：

$$s+u=\|x(v)-z\|\le p+r,\qquad r-u\le M.$$

第一式：$f(x(v))=tb+sw$ 与 $f(z)=tb-uw$ 共线分居 $tb$ 两侧，故 $\|f(x(v))-f(z)\|=s+u$；等距把它拉回 $X$：$s+u=\|f(x(v))-f(z)\|=\|x(v)-z\|$；再插入 $ty$ 作中间点用三角不等式 $\|x(v)-z\|\le\|x(v)-ty\|+\|ty-z\|=p+r$。第二式：$u=\|tb-f(z)\|$、$r=\|ty-z\|$，而 $|D_t(z,y)|=|\|f(z)-tb\|-\|z-ty\||=|u-r|\le M$（全局缺陷界），故 $r-u\le M$。

夹出等号（`main:246-250`）：已知 $s=p+M$（$v\in E$）。$(s+u)-(p+r)=M+(u-r)$。由 $r-u\le M$ 得 $u-r\ge-M$，故 $(s+u)-(p+r)\ge0$，即 $s+u\ge p+r$；结合第一不等式 $s+u\le p+r$，两者同时取等：$s+u=p+r$ 且 $r-u=M$。这就是 eq:equality（`main:248-250`）：

```latex
r=u+M,\qquad \norm{pv+rg(v)}=p+r.
```

第二式来源：把取等 $s+u=p+r$ 回代距离链得 $\|x(v)-z\|=p+r$，而 $z=ty-r\,g(v)$（按定义 $g(v)=(ty-z)/r$）故 $x(v)-z=(ty+pv)-(ty-rg(v))=pv+rg(v)$，其范数 $=\|x(v)-z\|=p+r$。

$\|pv+rg(v)\|=p+r$，权重 $p,r>0$、两向量单位（$v\in S_X$，$g(v)$ 是归一故单位），正好是 Lemma 2.1 公共支撑条款的原样输入，于是 $v$ 与 $g(v)$ 共享一个支撑。

传播规则（`main:251-256`）：任何与 $g(v)$ 共享支撑的单位方向 $l$ 都属于 $E$。证明用 $v$ 固定的那组 $z,r,u$：

$$p(l)+r=\|x(l)-z\|=\|f(x(l))-f(z)\|\le s(l)+u.$$

第一等号：$l$ 与 $g(v)$ 共支撑给 $\|(x(l)-ty)+(ty-z)\|=\|x(l)-ty\|+\|ty-z\|=p(l)+r$，而 $x(l)-z=(x(l)-ty)+(ty-z)$。第二等号：$f$ 等距。不等号：三角，$\|f(x(l))-f(z)\|\le\|f(x(l))-tb\|+\|tb-f(z)\|=s(l)+u$。于是 $s(l)-p(l)\ge r-u=M$；反向"$M$ 是全局 sup"给 $s(l)-p(l)\le M$，夹成等号，故 $l\in E$。特别取 $l=g(v)$（它与自身当然共支撑）得 $g(v)\in E$。

Lean 在 `ExtremalPropagation.lean`：`extremalSphere := {v | sRadius … v - pRadius … v = M}`（:30）、`extremalSet`（:33，环境像）；闭性 `isClosed_extremalSphere/_extremalSet`（:51-57）；非空 `extremalSphere_nonempty_of_attained`（:71，经 `signedDefect_xPoint`（:64）加 `xPoint_surjective`）；取等三连 `extremal_radius_identities`（给 $r=u+M$、$p+r=s+u$、$\|pv+rg(v)\|=p+r$）；传播规则是 `positive_prefix_extension` 族，配合 `PositiveConvexFace.lean` 的 `supportFace`（:73）、`convexHull_insert_subset_of_common_support`（:129）、`closed_convex_extremal_hull`（:191）。`PositiveConvexFace` 的抽象是"支撑面 $\{\varphi=1\}\cap S_X$ 凸、闭、含凸包与闭凸包"，这是传播规则的形式化身。

模块 3，不变闭凸集 $C$（`main:258-267`）。归纳：$v_0\in E$；设 $\operatorname{conv}\{v_0,\dots,v_n\}\subset E$。取严格正凸组合 $a_n$（所有权重 $>0$），置 $v_{n+1}=g(a_n)$。设 $\varphi$ 同时支撑 $a_n$ 与 $v_{n+1}=g(a_n)$（模块 2 第 $v$ 与 $g(v)$ 共支撑条款，把 $v$ 换成 $a_n$ 即可），用 Lemma 2.1 把 $\varphi$ 扩张到含 $v_0,\dots,v_{n+1}$ 的有限张成。对每个 $i\le n$：$1=\varphi(a_n)=\sum_jw_j\varphi(v_j)\le\sum_jw_j=1$（$w_j>0$），逼逐项 $\varphi(v_i)=1$。于是对增大后凸包内任意 $l=\sum c_iv_i$：$\varphi(l)=\sum c_i\cdot1=1$，而 $\|l\|\le\sum c_i=1$，得 $1=\varphi(l)\le\|l\|\le1$，所以 $l$ 是单位向量且与 $v_{n+1}$ 共享支撑 $\varphi$，由传播规则 $l\in E$。这样 $\operatorname{conv}\{v_0,\dots,v_{n+1}\}\subset E$。

稠密调度（`main:265-267` 原文照录）：

> Choose the coefficients so that the $a_n$ are dense in $C=\overline{\operatorname{conv}}\{v_0,v_1,\ldots\}$. Explicitly, enumerate all finite rational probability vectors on initial lists of indices, repeat each arbitrarily late, and at stage $n$ use one whose list is contained in $\{0,\ldots,n\}$. Mix its zero-padded coefficients with the uniform positive vector on that list of $n+1$ indices, using a weight $0<\lambda_n<1$ tending to zero. This changes the prescribed combination by at most $2\lambda_n$, because every $v_i$ is unit. Each prescribed rational combination is therefore a limit of $a_n$'s. Such combinations are dense in $C$, proving the assertion.

这段我一开始读得很别扭，重读才想清楚为什么非要"混合"。目标是让 $\{a_n\}$ 在 $C$ 稠密，同时每个 $a_n$ 都在严格正凸组合的集合里（这样才能触发逐项 $\varphi(v_i)=1$）。纯有理凸组合能稠密但会碰到零权重；纯均匀正向量处处严格正但不稠密。折中：把一个有理组合补零成 $n+1$ 维，再与该指标列上的均匀正向量以权重 $\lambda_n$ 混合，混合结果严格正（均匀向量分量全 $>0$ 保证），而它离那个有理组合不超过 $2\lambda_n$（两概率向量 $\ell_1$ 距离 $=2\lambda_n\times$（各自 $L_1$ 差的一半），配上每个 $v_i$ 单位，向量差 $\le2\lambda_n$）。$\lambda_n\to0$ 让误差消失，稠密性与严格正性同时到手。结论清点（`main:267`）："The set $C$ is nonempty, closed, bounded, convex, and contained in $E\subset S_X$. Since $g(a_n)=v_{n+1}\in C$, continuity gives $g(C)\subset C$. Only this constructed set is separable; the ambient spaces are unrestricted." 最后这句是定理强度的凭据：$C$ 是可数点凸包的闭包故可分，而 $\chi$ 机器只涉及 $C$ 内覆盖，全空间的非可分障碍被绕开。

Lean：`InvariantConvexSet.lean` 加 `PositiveScheduling.lean`。`recursivePrefix/recursiveVector`（:22,:27）造 $v_n$；`recursiveConvexSet := closure(convexHull(range))`（:106）；属性 `recursiveConvexSet_nonempty/_isClosed/_convex`（:116-126）；不变性 `recursiveConvexSet_invariant`（:127）；总出口 `exists_invariant_closed_convex`（:148）。调度账目在 `PositiveScheduling.lean`：`stageMixing n := 1/(n+2)`（:90，$\lambda_n$ 的具体实现，$0<\lambda_n<1$ 且 $\to0$），`norm_stageMean_sub_rational_le`（:153，"$\le2\lambda_n$"的形式化），`closure_range_stageMean_eq`（:350），`convexHull_range_subset_of_prefixes`（:331）。

模块 4，非紧测度严格下降（`main:269-291`）。两点估计（`main:270-278`）对 $v,v'\in E$（撇号记 $v'$ 的量）：

$$r\|g(v)-g(v')\|\le|r-r'|+\|z-z'\|\le|r-r'|+|u-u'|+u\|w-w'|,$$
$$s\|w-w'\|\le|s-s'|+\|f(x(v))-f(x(v'))\|\le|s-s'|+|p-p'|+p\|v-v'|.$$

第一链：$rg(v)=ty-z$、$r'g(v')=ty-z'$，故 $rg(v)-r'g(v')=z'-z$；写 $rg(v)-rg(v')=(rg(v)-r'g(v'))+(r'-r)g(v')$，取范数（$\|g(v')\|=1$）得 $r\|g(v)-g(v')\|\le\|z-z'\|+|r-r'|$。第二步：$z-z'=f^{-1}(tb-uw)-f^{-1}(tb-u'w')$ 用 $f^{-1}$ 等距回到 $\|(tb-uw)-(tb-u'w')\|=\|u'w'-uw\|\le|u-u'|+u\|w-w'|$（添项 $uw$）。第二链同理：$sw=f(x(v))-tb$，$\|f(x(v))-f(x(v'))\|=\|x(v)-x(v')\|\le|p-p'|+p\|v-v'\|$。

合并（`main:280-284`）用 $s=p+M$、$r=u+M$，得 eq:contraction：

```latex
\norm{g(v)-g(v')}
\le\frac{up}{rs}\norm{v-v'}
 +\frac{2|u-u'|}{r}+\frac{2u|p-p'|}{rs}.
```

我逐项复算确认。$r\|g-g'\|\le|r-r'|+\|z-z'\|$，$|r-r'|=|(u+M)-(u'+M)|=|u-u'|$，故前两项和 $=2|u-u'|$；$\|z-z'\|\le|u-u'|+u\|w-w'\|$，代入 $u\|w-w'\|\le\frac us(|s-s'|+\|f(x)-f(x')\|)\le\frac us(|p-p'|+|p-p'|+p\|v-v'\|)$（$|s-s'|=|p-p'|$）。于是 $r\|g-g'\|\le2|u-u'|+\frac{2u}{s}|p-p'|+\frac{up}{s}\|v-v'\|$，两边除 $r$：主项 $\frac{up}{rs}\|v-v'\|$、尾项 $\frac{2|u-u'|}{r}$ 与 $\frac{2u|p-p'|}{rs}$。与 eq:contraction 吻合。

收缩系数（`main:285-290`）：记 $a=1-t>0$、$U=1+t$，四半径全在 $[a,U]$；$r=u+M$、$s=p+M$ 给 $0<M<r,s$。于是

$$\frac{up}{rs}=\Bigl(1-\frac Mr\Bigr)\Bigl(1-\frac Ms\Bigr)\le\gamma:=\Bigl(1-\frac M{U}\Bigr)^2<1.$$

单调性：$1-M/r$ 关于 $r$ 递增（$M>0$ 固定，$r$ 越大 $M/r$ 越小因子越大），$r\le U$ 给 $1-M/r\le1-M/U$，两因子同界相乘。$0<M/U$ 且 $M\le1\le U$ 给 $1-M/U\in(0,1)$，故 $\gamma<1$。

分箱论证（`main:291`）：给 $H\subset C$ 与直径 $\le\delta$ 的有限覆盖 $\{H_i\}$。对 $\eta>0$，把每块与 $H$ 交，再按 $p$、$u$ 的值域各分成长度 $\le\eta$ 的有限区间族做预像细分（$p,u$ 值域在 $[a,U]$ 内，区间数有限 $\lceil(U-a)/\eta\rceil$）。同一小块内 $v,v'$ 满足 $\|v-v'\|\le\delta$、$|p-p'|\le\eta$、$|u-u'|\le\eta$。eq:contraction 的尾两项在此小块上：$\frac{2|u-u'|}{r}\le\frac{2\eta}{a}$（$r\ge a$），$\frac{2u|p-p'|}{rs}\le\frac{2\eta}{a}$（用 $u<r$，因 $r=u+M$，与 $s\ge a$）。原文："Since $r,s\ge a$ and $u/r<1$, the last two terms sum to at most $4\eta/a$ on each resulting part." 于是每块像直径 $\le\gamma\delta+4\eta/a$。$\eta\downarrow0$（覆盖结构固定）再对 $\delta$ 取 inf，得 $\chi(g(H))\le\gamma\chi(H)$。这一步是全篇最细的账：主项吃掉覆盖直径 $\delta$ 并乘 $\gamma$，尾项靠分箱（对 $p,u$ 两个标量函数分箱）压成任意小的 $4\eta/a$。

Lean：两点不等式本体在 `ReturnMapEstimate.lean`（`returnSphere_pair_estimate` :82、`returnAmbient_pair_estimate` :170、`returnAmbient_pair_estimate_on` :188）；纯标量归约在 `ReturnMapBounds.lean`（`return_pair_error_le` :35、`return_pair_uniform_bound` :58、`radius_ratio_le_factor` :12、`return_coefficient_le` :21；$\gamma$ 区间性 `return_factor_mem_Ico` :81、`return_contraction_factor_mem_Ico` :94）；分箱在 `ScalarBins.lean` `exists_finite_scalar_bins`（:20）加 `CoefficientBins.lean` 加 `ReturnMapNoncompactness.lean` `finiteDiameterCover_image_of_scalar_bins`（:21，"$\gamma\delta+4\eta/a$"的实现，论文"letting $\eta\downarrow0$"在 Lean 用 $\eta=1/k$ 序列取 inf）、`chi_return_image_le`（:60，输出 `chi (g '' H) ≤ (1 - M/(1+t))^2 * chi H`，docstring 明示"including the empty subset"，空集 $\chi(\emptyset)=0$ 单独处理）。

模块 5，收尾（`main:293`）："Theorem 4.1 now gives $v\in C$ with $g(v)=v$. Set $x=x(v)$; this endpoint may differ from $x_0$. Substitution in (eq:return) gives (eq:chords). Equation (eq:equality) and distance preservation give (eq:radii)." 不动点 $g(v)=v$ 让 $z=ty-r\,g(v)=ty-rv$（因 $rg(v)=ty-z$），于是 $x=ty+pv$、$z=ty-rv$ 共线，eq:chords 四式成立；eq:radii 里 $d=\|x-z\|$：对齐后 $x-z=(p+r)v$ 故 $\|x-z\|=p+r$；$\le2$ 由两单位向量距离。注意"this endpoint may differ from $x_0$"：不动点 $v$ 未必是取等点 $v_0$，所以新的 $x$ 未必等于 $x_0$，但缺陷等式 $s-p=r-u=M$ 仍成立，这就够了。

假设与常数的机械理由，本条最丰。$0<t<1$：$\|ty\|=t<1$ 让两侧径向切点存在唯一（Lemma 2.2）；$t>0$ 由 $M/2\le t$ 自动。$M>0$ 用在 $\gamma<1$ 严格（$M=0$ 则 $\gamma=1$，Darbo 失效，而 $M=0$ 正是我要证的，届时根本不需要不动点，这个反讽我留着 §16 说）；用在 $0<M<r,s$；用在 $A+B=1-M/d<1$。"$s-p=M$" ，并非 $\ge M-\text{tol}$：传播规则的夹逼 $s(l)-p(l)\ge M$ 配全局界 $\le M$ 必须精确取等，带容差则 $E$ 不闭、不传播。"$v\in S_X$"（$E\subset S_X$）：$1=\varphi(l)\le\|l\|\le1$ 右端 $\|l\|\le1$ 依赖凸包在单位球内（凸性），若 $E$ 含非单位向量则 $C$ 跑出球面。"$\lambda_n\to0$、权重严格正"见模块 3。"$X$ 完备"：Darbo 载体，$Y$ 完备性本条不消费（Lean `Alignment.lean:61` 只要求 `[CompleteSpace X]`，Extension 层才双完备，与论文口径同精细度）。

Lean 接口差异：`exists_alignedConfiguration`（`Alignment.lean:61`）输入含 `x₀` 与 `hatt : signedDefect f t x₀ y = M`，输出 `Nonempty (AlignedConfiguration f y t M)`；`AlignedConfiguration`（`AlignedConfiguration.lean:23-44`）携带 eq:chords/eq:radii 全部 17 个场（$x,z,v,w,p,r,s,u$ 加 4 正性加 4 等式加 2 缺陷等式加 chord_sum 加 chord_le_two）；`aligned_of_return_fixed`（`Alignment.lean:25`）把不动点填进结构；`chord_le_two` 从 $\|x-z\|\le2$ 显式算出（`Alignment.lean:49-58`）。

`[推测]` 候选失败路线三条。其一，直接对 $C$ 用 Schauder ，并非 Darbo：$C$ 在无穷维不紧（一般 $\chi(C)>0$），Schauder 不适用，只有压缩 $\chi$ 的 Darbo 可用；而这要求 eq:contraction 尾项 $|u-u'|,|p-p'|$ 可控，恰恰因为 $C$ 内 $s=p+M$、$r=u+M$ 把 $r,s$ 的波动转嫁给 $p,u$，使半径函数在分箱内一致小。若 $E$ 上不持 $s-p=M$ 恒等式（例如放宽到 $s-p\ge M-\text{tol}$ 的宽集），$|s-s'|\le|p-p'|+\text{tol}$ 会破坏分箱尾项口径，$\chi$ 压缩断。其二，跳过不动点直接取 $v_0$：$g(v_0)$ 未必等于 $v_0$，$z$ 侧由 $g(v_0)$ 决定而 $x$ 侧方向是 $v_0$，两弦不对齐，eq:chords 的共线结构（尤其 $z=ty-rv$ 用同一个 $v$）不成立，层 3 的 $F(r/\epsilon)$/$G(u/\epsilon)$ 比较（依赖 $x-z=(p+r)v$ 单一方向）整体失效。对齐正是不动点唯一提供的东西。其三，传播规则若只有"存在一个支撑"，并非"每个共支撑方向都入 $E$"：$C=\overline{\operatorname{conv}}\{v_n\}$ 的内点（非生成元）不再有理由在 $E$ 中，$g(C)\subset C$ 断；而"选唯一支撑"在非光滑空间不可行（支撑不唯一）。论文用全称传播"every unit direction $l$ sharing a support with $g(v)$ belongs to $E$"，这是非光滑性下唯一的活路。

## 9 弦参数与 secant 引理（§5 开头 加 Lemma 5.1）

层 3 的第一件事，是从对齐弦上榨出一个定量估计。设参（`main:321-325`）：

```latex
\begin{equation}\label{eq:AB}
A=\frac p d,\qquad B=\frac u d,\qquad \epsilon=1-t.
\end{equation}
```
> Then $A,B>0$ and $A+B=1-M/d<1$.

分枝预告（`main:327`）："We first derive a secant estimate from the defect bound. If either $A$ or $B$ exceeds $\epsilon$, this estimate leads to a radial perturbation that increases the maximal defect. In the remaining case, convexity gives incompatible bounds for the preserved distance from $y$ to $z$." 这预告了 §10 与 §11。

secant 引理陈述（`main:330-345`）：

```latex
\begin{lemma}\label{lem:secant}
Put
\[
h=\min\left\{\frac t s,\frac\epsilon u\right\},\qquad
\theta=\frac{hs}{p},\qquad
K=\frac{\norm{(r/u)v+hy}-\norm{(p/s)v+hy}}{r/u-p/s}.
\]
For every support $\varphi$ at $v+\theta y$,
\begin{equation}\label{eq:K}
\frac\epsilon p\le\varphi(v)\le K\le
\begin{cases}
1-B,& B\le\epsilon,\\
B,& B>\epsilon.
\end{cases}
\end{equation}
\end{lemma}
```

先算 $A+B$。$A+B=(p+u)/d$；由 eq:radii 有 $d=p+r=s+u$，故 $p+u=d-(s-p)=d-M$，于是 $A+B=1-M/d<1$（用 $M>0$、$d>0$）。又 $d\le2$（Prop 4.2）、$d=p+r\ge2(1-t)=2\epsilon$（半径下界）。

两个测试半径 $q_1=t-sh$、$q_2=t+uh$。$h\le t/s$ 给 $q_1\ge0$；$h\le\epsilon/u$ 给 $q_2=t+uh\le t+\epsilon=1$。故两半径 $\in[0,1]$，缺陷界可用。$h$ 是 min，所以至少一个约束取等，即 $q_1=0$ 或 $q_2=1$，在那一端缺陷自动为 0。这就是"免费零"的机关。

算 $\Delta_x:=D_{t-sh}(x,y)$。代入 eq:chords：$f(x)-(t-sh)b=(tb+sw)-(t-sh)b=s\,w+sh\,b$，其范数 $=s\|w+hb\|$；$x-(t-sh)y=(ty+pv)-(t-sh)y=p\,v+sh\,y$，其范数 $=s\|(p/s)v+hy\|$。于是 $\Delta_x=s(\|w+hb\|-\|(p/s)v+hy\|)$（`main:348-350`）。同理 $\Delta_z:=-D_{t+uh}(z,y)$：$f(z)-(t+uh)b=(tb-uw)-(t+uh)b=-u(w+hb)$，范数 $=u\|w+hb\|$；$z-(t+uh)y=(ty-rv)-(t+uh)y=-rv-uh\,y$，范数 $=u\|(r/u)v+hy\|$。于是 $-\Delta_z$ 定义下 $\Delta_z=u(\|(r/u)v+hy\|-\|w+hb\|)$（`main:352-353`）。

加权相消（`main:355-358`）：$u\Delta_x+s\Delta_z$ 里公共项 $\|w+hb\|$ 系数 $us-su=0$ 相消，余 $=us(\|(r/u)v+hy\|-\|(p/s)v+hy\|)$。分母账：$r/u-p/s=(rs-up)/(us)$，而 $sr-up=Md$。验算 $sr-up$：用 $r=u+M$、$s=p+M$，$sr-up=(p+M)(u+M)-up=M(p+u)+M^2=M(p+u+M)=M(p+u+r-u)=M(p+r)=Md$（最后用 $p+u+M=p+u+(r-u)=p+r=d$）。于是

$$\frac{u\Delta_x+s\Delta_z}{d}=M\cdot\frac{\|(r/u)v+hy\|-\|(p/s)v+hy\|}{r/u-p/s}=MK.$$

上界分枝。等价性"$t/s\le\epsilon/u\Leftrightarrow B\le\epsilon$"（`main:359`，Lean 单独证 `step_comparison_iff`）。情形 $B\le\epsilon$：$h=t/s$ 使 $q_1=0$，$\Delta_x=D_0=0$，故 $MK=s\Delta_z/d\le sM/d$（$\Delta_z\le M$），得 $K\le s/d=1-B$（$s/d=(d-u)/d=1-B$）。情形 $B>\epsilon$：$h=\epsilon/u$ 使 $q_2=1$，$\Delta_z=D_1=0$，$MK=u\Delta_x/d\le uM/d$，得 $K\le u/d=B$。边界 $B=\epsilon$ 两缺陷同零，$K=0\le\min\{B,1-B\}$，上界仍真。

下界 $\varphi(v)\ge\epsilon/p$，这是引理里我最花时间的部分。先看 $\varphi(v)\le K$：$r/u>p/s$（等价 $rs>up$ 即 $Md>0$）。$K$ 是凸函数 $\lambda\mapsto\|\lambda v+hy\|$ 在 $\lambda_1=p/s<\lambda_2=r/u$ 的割线斜率。$\varphi$ 支撑 $v+\theta y$，$\theta=hs/p$，正标量倍后 $\varphi$ 也支撑 $(p/s)v+hy$（$(p/s)v+hy=(p/s)(v+\theta y)$）。次梯度给 $\|(r/u)v+hy\|\ge\varphi((r/u)v+hy)$、$\|(p/s)v+hy\|=\varphi((p/s)v+hy)$，两式相减：$\|(r/u)v+hy\|-\|(p/s)v+hy\|\ge\varphi((r/u-p/s)v)=(r/u-p/s)\varphi(v)$，除以正分母得 $K\ge\varphi(v)$。

再证 $\epsilon/p\le\varphi(v)$，分 $\theta=\beta$ 与 $\theta<\beta$（$\beta:=t/p$，注意 $\theta=hs/p\le(t/s)s/p=t/p=\beta$）。$\theta=\beta$ 时：$pv+ty=x\in S_X$ 故 $\|v+\beta y\|=1/p$；$\varphi$ 支撑 $v+\beta y$ 给 $\varphi(v+\beta y)=1/p$，即 $\varphi(v)+\beta\varphi(y)=1/p$，$\varphi(v)=\frac1p-\beta\varphi(y)=\frac{1-t\varphi(y)}{p}\ge\frac{1-t}{p}=\frac{\epsilon}{p}$（$\varphi(y)\le1$）。$\theta<\beta$ 时：取 $\psi$ 支撑 $v+\beta y$。两条支撑不等式 $\psi(v+\theta y)\le\|v+\theta y\|=\varphi(v+\theta y)$ 与 $\varphi(v+\beta y)\le\|v+\beta y\|=\psi(v+\beta y)$ 展开移项，得双链（`main:369-371`）$\theta(\psi(y)-\varphi(y))\le\varphi(v)-\psi(v)\le\beta(\psi(y)-\varphi(y))$。由 $\theta<\beta$ 与左端 $\le$ 右端逼 $\psi(y)-\varphi(y)\ge0$，进而 $\varphi(v)\ge\psi(v)$；$\psi$ 落在 $\theta=\beta$ 型（它支撑 $v+\beta y$），已证 $\psi(v)\ge\epsilon/p$，故 $\varphi(v)\ge\epsilon/p$。

支撑对象非零性（`main:361`）：若 $v+\theta y=0$ 则 $\theta=1$、$v=-y$；而 $\|ty+pv\|=1$ 与 $v=-y$ 逼 $\|pv-ty\|=1$，非严格时给 $p=1+t$，则 $\theta\le t/p<1$，与 $\theta=1$ 矛盾。这段只为让"$\varphi$ 支撑 $v+\theta y$"非平凡。

Lean（`ChordSecant.lean`）：`secantStep := min (t/s) ((1-t)/u)`（:67，$h$）、`secantTheta := secantStep*s/p`（:68）、`secantSlope`（:69，$K$）；`secantStep_pos/_Theta_pos/_Theta_le`（:74-86）；`secant_denominator_pos`（:87）；`step_comparison_iff`（:95）；`secantStep_eq_smallB/_largeB`（:103,:106）；`secant_radii_mem`（:111）；`secant_defect_first/_opposite`（:125,:142，$\Delta_x,\Delta_z$）；`secant_weighted_identity`（:159，$u\Delta_x+s\Delta_z=Md\cdot K$ 含 $sr-up$ 账）；`secant_upper_smallB/_largeB`（:173,:196）；`secant_bounds`（:221，eq:K 三合一，下界调 `support_direction_lower` :22，即双支撑夹逼的逐字翻译）；`small_secant_product`（:256，$\epsilon\le dA(1-B)$：取 $\varphi$ 于 $v+\theta y$，链 $\epsilon/p\le\varphi(v)\le K\le1-B$ 逼 $1-t\le(1-B)p=(1-B)dA$）。

假设的机械理由。$h$ 取 min ，并非任意值：保证两测试半径 $\in[0,1]$（缺陷界定义域），且至少一个落在端点（$D_0=D_1=0$ 免费零），让加权和中一半 $\Delta$ 归零、剩一半吃 $M$ 界，这是上界分枝来源。若 $h$ 更小：两 $\Delta$ 都只用 $M$ 界、无零项，$K\le(s+u)/d=1$ 无用。$\theta=hs/p$ 把 $h$ 半径处的向量归一为单位系数 $v$，让"support at $v+\theta y$"成为全篇统一记号并对接 $\beta=t/p$ 的比较。分支阈值 $B\le\epsilon$ 的等价性 Lean 单独证，若不等价整个分枝覆盖有洞。"每个支撑"的全称量化在 §10 被用来推"$v$ 的所有支撑在 $y$ 上负"，是后续符号结论的原料。

`[推测]` 候选失败路线三条。其一，用固定中点 $q=1/2$ 替代自适应 $h$：$1/2$ 不在 $\{t-sh,t+uh\}$ 的构造位，公共范数项 $\|w+(\cdot)b\|$ 无法同时出现在两个 $\Delta$ 里相消，加权消元依赖两个半径上的同一个 $h$ 缩放。其二，直接对 $v$ 取支撑，并非 $v+\theta y$：$v$ 自己的支撑对 $y$ 无信息（$\varphi(y)$ 任意），$\epsilon/p$ 的来源恰是"支撑 $v+\theta y$ 把 $v,y$ 分量通过范数等式绑住"。其三，$K$ 定义分母取反号 $p/s-r/u$：$r/u-p/s>0$ 靠 $Md>0$；反向会让"支撑从下方界割线"变成"从上方"，方向感反、下界链断。

## 10 Lemma 5.2：大参数分支不可能（lem:large）

陈述（`main:376-378`）："Neither $A>\epsilon$ nor $B>\epsilon$ is possible." 这是分枝消元的一半。证明（`main:379-415`）我分四段推。

第一段，$B>\epsilon$ 的即时效应（`main:380-383`）。$B>\epsilon$ 使 $h=\epsilon/u$。secant 引理左链 $\epsilon/p\le\varphi(v)\le K$ 配右枝 $K\le B$ 给 $\epsilon/p\le u/d$，即 eq:product（`main:381-383`）：$\dfrac{pu}{d\epsilon}\ge1$。（Lean `largeB_product_bounds`，`LargeChord.lean:28`。）

第二段，支撑符号引理（`main:384-393`）。取任意 $L$ 支撑 $v$，记 $j:=L(y)$。对 $v+\theta y$ 的支撑 $\varphi$，eq:strictchain（`main:385-388`）：

$$B\ge\varphi(v)=\|v+\theta y\|-\theta\varphi(y)\ge1+\theta j-\theta.$$

第二等号：$\varphi(v)=\varphi(v+\theta y)-\theta\varphi(y)=\|v+\theta y\|-\theta\varphi(y)$（支撑等式）。最后一步 $\ge$：$\|v+\theta y\|\ge L(v+\theta y)=L(v)+\theta L(y)=1+\theta j$（$L$ 范数 $\le1$ 给 $L(v+\theta y)\le\|v+\theta y\|$，反向即 $\|v+\theta y\|\ge1+\theta j$），再 $-\theta\varphi(y)\ge-\theta\cdot1$（$\varphi(y)\le1$、$\theta\ge0$）。

严格化（`main:389`）："In fact $B>1+\theta j-\theta$."。若全程取等则 $\|v+\theta y\|=L(v+\theta y)$，$L$ 也是 $v+\theta y$ 的支撑，secant 引理对它成立给 $1=L(v)\le B<1$（$B<1$ 由 $A+B<1$、$A>0$），矛盾。故严格。重排：$1-j>\frac{1-B}{\theta}$。

结合 eq:product 与 $\theta$ 账（`main:391`）：$\frac{1-B}{\theta}=\frac{pu}{d\epsilon}\ge1$。核对：$1-B=s/d$（`AlignedConfiguration.lean:131` `one_sub_B`），$\theta=hs/p=(\epsilon/u)s/p$，故 $\frac{1-B}{\theta}=\frac{s/d}{\epsilon s/(up)}=\frac{pu}{d\epsilon}$。于是 $1-j>1$，$j<0$：每个 $v$ 的支撑在 $y$ 上严格负（`main:392` "Every support at $v$ is strictly negative on $y$"）。

推论（`main:392-393`）：对 $rv-ty=-z$ 应用一个 $v$ 的支撑 $L$（$L$ 支撑 $v$ 则支撑 $rv$）：$1=\|z\|=\|ty-rv\|\ge L(ty-rv)=tj-r$，重排 $r-tj\le1$。$j<0$ 给 $r<1+tj<1$。又 $r=u+M>u$，故 $u<r<1$。eq:product 写成 $Au\ge\epsilon$（$A=p/d$），除以 $u\in(0,1)$ 得 $A>\epsilon$。合起来：$B>\epsilon\Rightarrow A>\epsilon$ 且 $v$ 侧支撑全负于 $y$。

第三段，逆构型搬运（`main:395-400`）。eq:inverse（`main:396-399`）：

```latex
(p',s',r',u')=(u,r,s,p),\quad
(v',w',y',b')=(-w,-v,b,y).
```

这是把 eq:chords 的五元组 $(X,Y,f,y,b)$ 换成 $(Y,X,f^{-1},b,y)$：以 $f(z)$ 为第一端点、$b$ 为基方向、$f(x)$ 为对面端点。逐一核对四弦式：$x'=f(z)=tb-uw=ty'+p'v'$（$y'=b$、$p'=u$、$v'=-w$）；$z'=f(x)=tb+sw=ty'-r'v'$（$r'=s$）；$f^{-1}(x')=z=ty-rv=tb'+s'w'$（$w'=-v$、$s'=r$）；$f^{-1}(z')=x=ty+pv=tb'-u'w'$（$u'=p$）。新缺陷 $s'-p'=r-u=M$（用 eq:radii）。$(A',B')=(u/d,p/d)=(B,A)$，$d'=p'+r'=u+s=d$。eq:inverse-defect 保证 $|D_q^{f^{-1}}|\le M$ 全局界保留（`main:400` "the inverse retains the bound in (eq:maximal)"）。

把第一、二段施于逆构型：$A>\epsilon$（即逆构型的 $B'>\epsilon$）逼 $B>\epsilon$（逆构型的 $A'>\epsilon$），且每个 $-w$ 的支撑严格负于 $b$；等价地每个 $w$ 的支撑严格正于 $b$（$\varphi$ 支撑 $w\Leftrightarrow-\varphi$ 支撑 $-w$，符号翻一次）。于是合成双向锁定：任一严格大不等式成立 $\Rightarrow$ 两个符号结论同时成立（`main:402` "Consequently, if either strict inequality holds, both support-sign conclusions hold"）。

第四段，径向微扰矛盾（`main:402-414`）。对 $0<\eta<t$，eq:perturb（`main:403-405`）：

```latex
\norm{sw+\eta b}-\norm{pv+\eta y}\le M=s-p.
```

来源：$D_{t-\eta}(x,y)\le M$ 且 $t-\eta\in[0,1]$（$\eta<t$ 保 $>0$、$\eta>0$ 保 $<t\le1$）：$\|f(x)-(t-\eta)b\|-\|x-(t-\eta)y\|=\|sw+\eta b\|-\|pv+\eta y\|\le M$。

左项严格大：取 $w$ 的支撑 $\varphi$（符号结论给 $\varphi(b)>0$）：$\|sw+\eta b\|\ge\varphi(sw+\eta b)=s+\eta\varphi(b)>s$。

右项严格小（反证加有限维紧性，`main:406-413`）：设存在 $\eta_n\downarrow0$ 使 $\|pv+\eta_n y\|\ge p$。在 $\operatorname{span}\{v,y\}$（二维）上取 $pv+\eta_ny$ 的支撑 $L_n$。由 $L_n(v)\le1$：$p\le\|pv+\eta_ny\|=L_n(pv+\eta_ny)=pL_n(v)+\eta_nL_n(y)$，故 $L_n(y)\ge p(1-L_n(v))/\eta_n\ge0$。有限维对偶闭球紧，取收敛子列 $L_n\to L$（逐点），$L(y)\ge0$；支撑等式取极限：$pL(v)=\lim_n(\|pv+\eta_ny\|-\eta_nL_n(y))=p$，故 $L(v)=1$、$\|L\|\le1$，$L$ 支撑 $v$ 且 $L(y)\ge0$，与"$v$ 的每个支撑在 $y$ 上严格负"矛盾。所以所有充分小 $\eta>0$ 有 $\|pv+\eta y\|<p$。

收尾（`main:414`）：两严格范数不等式 $\|sw+\eta b\|>s$、$\|pv+\eta y\|<p$ 合起来 $\|sw+\eta b\|-\|pv+\eta y\|>s-p=M$，违反 eq:perturb 的 $\le M$。故 $B>\epsilon$ 不可能；经逆构型环，$A>\epsilon\Rightarrow B>\epsilon$，$B>\epsilon$ 已否，故 $A>\epsilon$ 也不可能。

Lean：`largeB_impossible`（`LargeChord.lean:133`）总装；`largeB_forces_largeA_and_negative_support`（:49）打包第二至五步；`largeB_support_signs`（:112）符号结论；微扰侧独立文件 `RadialPerturbation.lean`：`exists_dual_gap_of_supportAt_neg`（:21 private）、`exists_radial_perturbation_lt_finiteDimensional`（:53，第四段紧子列，用 `Mathlib.Topology.Order.Compact` 加 `FiniteDimension` 局部紧）、`exists_radial_perturbation_lt`（:87 公开形）、`exists_radial_perturbation_lt_with_cap`（:110，带 $\eta<t$，对应"For $0<\eta<t$"与"$\eta$ 充分小"两句合并）；逆构型 = `AlignedConfiguration.inverse`（`AlignedConfiguration.lean:178`）。

假设的机械理由。$0<\eta<t$ 保 $t-\eta\in[0,1]$；$\eta$ 不能越过 $t$。"$\varphi(b)>0$、$L(y)<0$ 严格"：第 9、10 步都吃严格性，若只 $\ge0/\le0$ 则 eq:perturb 不再被严格违反；严格性来自"若取等则 $1\le B<1$"这个自举，$B<1$ 来自 $A+B<1,A>0$（即 $M>0$、$d<\infty$）。$\epsilon>0$（$t<1$）是 eq:product 分母；$A>\epsilon$ 分支若 $\epsilon=0$ 恒真、分支塌。$u<1$ 用在 $Au\ge\epsilon\Rightarrow A>\epsilon$，若 $u\ge1$ 只得非严格 $A\ge\epsilon$。有限维紧性只用于 $\operatorname{span}\{v,y\}$ 对偶闭球，全空间不必局部紧，这是 Lemma 2.1"有限扩张"条款的兑现处。

`[推测]` 候选失败路线三条。其一，不用逆构型、直接证 $A>\epsilon$ 分支矛盾：原文是 $B>\epsilon\Rightarrow A>\epsilon$（第二段）与 $A>\epsilon\Rightarrow B>\epsilon$（第三段经逆）成环，再单否 $B>\epsilon$。若缺这个环，$A>\epsilon$ 分支没有独立微扰矛盾（$\|sw+\eta b\|>s$ 要 $w$ 支撑在 $b$ 正号，这信息只有经逆构型第一类推导才有）。对称化搬运是必需工序。其二，用二阶凸性或光滑性论证替微扰：一般空间无光滑性（定理允许任意范数），次微分可能多值且不连续，第四段"取支撑子列极限"正是规避光滑性需求。其三，eq:perturb 取半径 $t+\eta$（另一侧）：$\|sw-\eta b\|-\|pv-\eta y\|$ 的符号方向不可控（$t+\eta$ 处缺陷含 $z$ 侧，其支撑符号是"$-w$ 上 $b$ 负"，方向相反），机制不闭合。

## 11 Proposition 5.3：小参数分支的凸性矛盾（prop:no-defect）

分枝消元的另一半，也是全篇的收口。陈述（`main:417-419`）："An attained positive maximum as in \eqref{eq:maximal} is impossible." 证明（`main:420-450`）我逐七步推。

第一步，由 Lemma 5.2 得 $A,B\le\epsilon$。对原构型用 secant 的 $B\le\epsilon$ 枝（$\epsilon/p\le K\le1-B$，$\Rightarrow\epsilon\le p(1-B)=dA(1-B)$）；对逆构型（其 $B'=A\le\epsilon$）用同一枝得 $\epsilon\le dB(1-A)$。eq:small（`main:422-424`）：

```latex
\epsilon\le dA(1-B),\qquad \epsilon\le dB(1-A).
```

Lean `small_secant_product`（`ChordSecant.lean:256`）加 `alignedConfiguration_impossible` 里对 `C.inverse` 的同调用（`ChordContradiction.lean:22-27`，注意传 `hb.symm` 逆界）。

第二步，$\min\{A(1-B),B(1-A)\}<1/4$（`main:425`）。设 $A\le B$，则 $A(1-B)\le A(1-A)$（$B\ge A$）；$A+B<1$ 给 $A<1/2$，故 $A(1-A)<1/4$。另一侧对称。较小的 $\epsilon$ 界 $<d/4\le2/4=1/2$（$d\le2$），逼 $\epsilon<1/2$，于是 $t=1-\epsilon>1/2$。

第三步，比例推论 eq:ratios（`main:426-429`）：

```latex
\frac p t<\frac r\epsilon,\qquad
\frac s t\ge\frac u\epsilon.
```

第一式重构：$A\le\epsilon=1-t$ 给 $p\le d\epsilon$；要 $\epsilon p<rt$，用 $p\le d\epsilon$ 得 $\epsilon p\le\epsilon^2d$；又 $r=d-p\ge d(1-A)\ge d(1-\epsilon)=dt$，故 $rt\ge dt^2$；$\epsilon<1/2<t$ 给 $\epsilon^2<t^2$，即 $\epsilon^2d<dt^2\le rt$。第二式：要 $\epsilon s\ge tu$，$B\le\epsilon$ 给 $u\le d\epsilon$ 故 $tu\le td\epsilon$；$s=d-u\ge d(1-B)\ge d(1-\epsilon)=dt$，故 $\epsilon s\ge dt\epsilon\ge tu$（$t\le1$）。Lean `smallChord_coefficients`（`SmallChord.lean:45`）连同前提 $A,B\le\epsilon,\epsilon<1/2$ 一起证。

第四步，凸函数 setup（`main:431-439`）：$F(\lambda)=\|y+\lambda v\|$、$G(\lambda)=\|b+\lambda w\|$（$\lambda\ge0$，范数是凸函数，加常向量与缩放后仍凸）。单位性给 $F(0)=\|y\|=1$、$F(p/t)=\|y+(p/t)v\|=\|(ty+pv)/t\|=\|x\|/t=1/t$；同理 $G(0)=1$、$G(s/t)=\|f(x)\|/t=1/t$。注意 $1/t>1$（$t<1$）。

第五步，凸函数割线斜率单调（`main:441-443`）。$\lambda\mapsto(F(\lambda)-F(0))/\lambda=(F(\lambda)-1)/\lambda$ 在 $\lambda>0$ 递增（凸函数过定点的割线斜率单调）。由 $r/\epsilon>p/t$（第一比例式）：

$$\frac{F(r/\epsilon)-1}{r/\epsilon}\ge\frac{F(p/t)-1}{p/t}=\frac{1/t-1}{p/t},$$

故 $F(r/\epsilon)\ge1+\frac{r/\epsilon}{p/t}(1/t-1)>1/t$（$\frac{r/\epsilon}{p/t}>1$ 且 $1/t-1>0$，严格大于 $F(p/t)=1/t$ 自身）。

第六步，另一侧用上界（`main:444`）。$u/\epsilon\le s/t$（第二比例式）且 $u/\epsilon\ge0$，即 $u/\epsilon\in[0,s/t]$。凸函数在闭区间内部值不超过端点最大值：$G(u/\epsilon)\le\max\{G(0),G(s/t)\}=1/t$。

第七步，等距夹逼（`main:445-449`）：$y-z=y-(ty-rv)=(1-t)y+rv=\epsilon(y+(r/\epsilon)v)$，故 $\|y-z\|=\epsilon F(r/\epsilon)$；$b-f(z)=(1-t)b+uw=\epsilon(b+(u/\epsilon)w)$，故 $\|b-f(z)\|=\epsilon G(u/\epsilon)$；$f$ 等距给 $\|y-z\|=\|f(y)-f(z)\|=\|b-f(z)\|$。于是 $\epsilon F(r/\epsilon)=\epsilon G(u/\epsilon)$，但第五、六步给 $F(r/\epsilon)>1/t\ge G(u/\epsilon)$，矛盾。

这里我想强调一处：两条比例式是异向的（一个 $<$、一个 $\ge$），这是精心选择的结构约束。$F$ 侧要"越过 $1/t$"故自变量 $r/\epsilon$ 必须超出锚点 $p/t$（第一比例式给 $<$ 即超出）；$G$ 侧要"不越过 $1/t$"故自变量 $u/\epsilon$ 必须落在 $[0,s/t]$ 内（第二比例式给 $\ge$ 即在内）。若两条同向，两侧就只剩同一类界，比较失效。这也解释了 secant 引理里 $h$ 取 min、这里取出的比例为何互补。

Lean：`SmallChord.lean` 把第 2-7 步参数化为纯标量加范数引理 `smallChord_contradiction`（:134），假设表逐项对应 `ht.2`（$t<1$）、`C.p_pos…`、`rfl`（$A=p/d$ 展开）、`chord_sum`、`chord_le_two`（$d\le2$）、`A_add_B_lt_one`、`hA hB`（$A,B\le\epsilon$）、`heA heB`（eq:small 双向）、`y.property (f y).property`（$\|y\|=\|b\|=1$）、`hx hfx`（$\|ty+pv\|=\|tb+sw\|=1$，对应 $F(p/t)=G(s/t)=1/t$ 的未除原型）、`hiso`（$\|\epsilon y+rv\|=\|\epsilon b+uw\|$，即第七步等距显式形，由 `sphere_norm_sub f y C.z` 提供，`ChordContradiction.lean:41-44`）。`smallChord_epsilon_lt_half`（:21）是第二步；凸性割线单调走 Mathlib `ConvexOn`（该文件 import `RCLike.Real`）。

假设的机械理由。$d\le2$（来自 $\|x-z\|\le\|x\|+\|z\|=2$）是 $\epsilon<1/2$ 的定量来源；若允许 $d>2$ 则 $d/4>1/2$，第三步比例推论断。$A,B\le\epsilon$ 用在 $A\le\epsilon<t$（需 $\epsilon<1/2$）与 $1-B\ge t$，两处分别喂两条比例式。$M>0$ 全链：$A+B<1$、$\epsilon/p\le K$ 分枝非退化、$h$ 非退化；$M=0$ 时命题真空成立。$F,G$ 只需 $\lambda\ge0$。$F(p/t)=G(s/t)=1/t$ 用 $x,f(x)$ 双双在球面：$F$ 侧下界与 $G$ 侧上界各需一个锚点，等距性给第三个锚 $\epsilon F=\epsilon G$，三条信息恰好锁定矛盾，少一条即松。$f$ 这里是等距，并非仅保范：$\|y-z\|=\|f(y)-f(z)\|$ 是两点距离，这是球面度量传进跨半径几何的唯一一次直接出手，前面全靠 $M$ 中介。

`[推测]` 候选失败路线三条。其一，用平行四边形恒等式（Hilbert 风格）替凸性：一般 Banach 空间无平行四边形律，Jordan–von Neumann 型偏差无界，凸性（割线单调）是范数凸函数的普适性质，恰好吃满"无附加几何假设"。其二，第六步若误用于 $u/\epsilon>s/t$：比例式选错分枝就没上界，见上面异向结构。其三，$\epsilon F=\epsilon G$ 若改成不等式（$f$ 只保序距离单侧）：等号是把 $F,G$ 数值钉死的唯一通道；缺陷界只给 $\pm M$ 级松弛，而超出量 $\frac{r/\epsilon}{p/t}(1/t-1)$ 无 $M$ 的显式下界保障（只依赖 $r/\epsilon>p/t$ 的严格差），一加松弛严格不等号可能被淹没。

至此层 1 加层 3 闭合：attained 正缺陷不可能存在，于是原球面图的 $M=0$。下面进层 4。

## 12 主定理证明（§6，thm:main 的证明体）

层 4。这一段我把前面全部退化到经典定理。证明体在 `main:454-475`。

第一步，$M=0$（`main:455`）："If the defect of the original sphere map were positive, Lemma~\ref{lem:attainment} and Proposition~\ref{prop:no-defect} would contradict one another. Thus $M=0$." 逻辑链：原 $f$ 若 $M>0$，Lemma 3.1 造出取到的正最大配置（界随构型带过去），Prop 5.3 否定它，矛盾。这里有个我不能忽略的细节：用到的不仅是 $D_q$ 在新空间取到，还要原空间的 $M$ 与新空间的 $M$ 是同一个数（缺陷在超滤商里精确传递，`main:192-194`），否则"原 $M>0$"与新配置的矛盾无涉。这正是 §6 第四段"$|D_q|\le M$ 全带过去"那句的兑现。

第二步，$T$ 保跨半径距离（`main:455-461`）。取 $a=\alpha x$、$c=\beta y$，$x,y$ 单位、$\alpha\ge\beta>0$，令 $q=\beta/\alpha\in[0,1]$：

$$\|T(a)-T(c)\|=\alpha\|f(x)-qf(y)\|=\alpha\|x-qy\|=\|a-c\|.$$

第一、三等号是提因子（$T(a)=\alpha f(x)$、$T(c)=\beta f(y)=\alpha q f(y)$，差提 $\alpha$）；中等号是 $M=0$（$D_q=0$ 对所有 $q,x,y$）。交换两点处理 $\beta>\alpha$；涉及 0 的距离 $\|T(a)-T(0)\|=\|\alpha f(x)\|=\alpha=\|a-0\|$ 由保范（这正是 $q=0$ 端的锚）。满射：$b\in Y\setminus0$，$f$ 满取 $y$ 使 $f(y)=b/\|b\|$，则 $T(\|b\|y)=b$。于是 $T$ 是保距、满、$T(0)=0$。

第三步，Mazur–Ulam 仿射步，自足的 Nica 反射表述（`main:463-472`，credits Väisälä–Vogt）。设 $F:E\to F_0$ 满等距，$a,c\in E$，$m=(a+c)/2$、$m'=(F(a)+F(c))/2$、$\delta=\|F(m)-m'\|$。界：$\delta\le\|a-c\|/2$（三角：$\|F(m)-m'\|\le\frac12(\|F(m)-F(a)\|+\|F(m)-F(c)\|)=\frac12(\|m-a\|+\|m-c\|)=\|a-c\|/2$）。反射 $R(z)=2m'-z$ 是 $F_0$ 的满等距；共轭 $H=F^{-1}RF$ 是 $E$ 的满自等距，交换 $a,c$（$H(a)=F^{-1}(2m'-F(a))=F^{-1}(F(c))=c$），且中点缺陷 $\|H(m)-m\|=\|RF(m)-F(m)\|=2\delta$（$R$ 是点反射，位移翻倍）。迭代：对 $H$ 再施同一构造（$H$ 仍满等距、仍交换 $a,c$、中点仍 $m$），第 $n$ 次缺陷 $2^n\delta$，统一被 $\|a-c\|/2$ 界住，逼 $\delta=0$。于是满等距保中点。

第四步，线性化与唯一性（`main:474`）。$T$ 满等距加 $T(0)=0$ 保中点，取 $c=0$ 得 $T(a/2)=T(a)/2$ 即 $T(2a)=2T(a)$；$T(a+c)=2T((a+c)/2)=T(a)+T(c)$；有理齐次由加法；实齐次由连续性（$T$ 等距故连续，$\|T(qx)-T(ax)\|=|q-a|\|x\|$）。唯一性："a linear extension is determined on every nonzero vector by its norm and its unit direction"（$x=\|x\|\cdot x/\|x\|$，线性延拓必送 $\|x\|f(x/\|x\|)$）。

Lean（`RadialExtension.lean` 加 `Extension.lean`）：$M=0$ 供给 `hasDefectBound_zero`（`Extension.lean:53`）；`radialExtension`（`RadialExtension.lean:27`，if-then-0 定义）、`scaled_norm_sub_eq`（:79，提因子链）、`radialExtension_norm_sub`（:101）、`radialExtension_isometry`（:125）、`radialExtension_surjective`（:132）、`radialIsometryEquiv`（:143）；仿射步不在 OAI 内重证，`radialLinearIsometryEquiv`（:157-161）调 Mathlib `Mathlib.Analysis.Normed.Affine.MazurUlam`（该文件 :3 import）；唯一性 `linear_extension_eq_radial`（:176）、`existsUnique_linearIsometryEquiv_of_zero_defect`（:199）。`signedDefect_eq_zero_of_bound_zero`（`Basic.lean:167`）是 $M=0\Rightarrow D_q\equiv0$ 的桥。这是我记录的一处实质差异：论文 §6 自带约 10 行 Nica 反射证明，Lean 直接引 Mathlib 现成定理，比较器因此把 Mazur–Ulam 视为已允许经典工具。

假设的机械理由。满射：反射迭代要求每步共轭仍满（$F^{-1}$ 与 $R$ 都满），单射等距无反射迭代；球面 $f$ 满逼 $T$ 满。$T(0)=0$：Mazur–Ulam 结论形如"等距加一点映 0 逼线性"，$T(0)=0$ 由定义。$X,Y$ Banach：本步不消费完备性（Mazur–Ulam 只需赋范），完备性在 Darbo 处消费，所以标题假设恰是 Banach 而各步只用所需片段。"nonzero"：$S_X\ne\emptyset$ 否则 $f$ 无从定义；Lean 用 `[Nontrivial X]`（`Extension.lean:37`），对实赋范空间等价，且 `Nontrivial` 才给 `Nonempty (UnitSphere X)`（`Basic.lean:41`）。实线性 vs 复线性的边界在 Lean 表现为 `≃ₗᵢ[ℝ]`，从不出现 ℂ。

`[推测]` 候选失败路线三条。其一，直接证 $T$ 加法跳过中点：球面数据只控两点距离，中点是"两点等距逼定位"的最小可迭代对象，Väisälä–Vogt 选中点缺陷正因为它在反射下精确翻倍。其二，若 $M=0$ 只对 $q\in[0,1)$：$q=1$ 本免费（$D_1=0$），但少 $q=0$ 就丢保范（$\|T(a)\|=\|a\|$ 来自 $q=0$ 端）。其三，用 Tzafriri/Wittstock 型算子空间延拓替 Mazur–Ulam：需要 Hilbert 结构或线性前提，而 $T$ 的线性正是要证的，循环。

## 13 附录：不动点组件（§A）

论文把 Darbo 的证明放进附录，自足到不依赖任何未证经典定理。前置声明（`main:480`）："We prove Theorem~\ref{thm:condensing}, including the compact convex fixed-point theorem it uses. The measure-of-noncompactness argument is the classical mechanism of Darbo \cite{Darbo1955}; the compact case is the Schauder fixed-point theorem \cite{Schauder1930}, obtained below from the simplex argument using Sperner's labeling lemma \cite{Sperner1928}." 链条是 Lemma A.1（$\chi$ 性质）$\to$ A.2（单纯形 Sperner 不动点）$\to$ A.3（紧凸 Schauder）$\to$ Thm 4.1（condensing 迭代取交）。

### 13.1 Lemma A.1：$\chi$ 的性质（lem:chi）

陈述（`main:482-489`）：对任意有界非空集 $H$，$\chi(\overline H)=\chi(H)$、$\chi(\overline{\operatorname{conv}}H)=\chi(H)$；若 $C_n$ 是 Banach 空间中非空闭有界子集、$C_{n+1}\subset C_n$、$\chi(C_n)\to0$，则交非空且紧。

机制（`main:490-499`）。$\chi(\cl H)=\chi(H)$：有限直径覆盖每块取闭包，直径不变、仍覆盖 $\cl H$；反向由单调。$\chi(\overline{\operatorname{conv}}H)=\chi(H)$ 的正方向是核心计算：给 $H$ 的 $\delta$-直径有限覆盖 $H_1,\dots,H_N$，$R$ 界住范数。每块凸包直径 $\le\delta$："expand their difference using products of their coefficients"，两组凸组合差用 $\sum_{i,j}\lambda_i\mu_j\|z_i-z_j'\|\le\delta$（同块内点对距离 $\le\delta$）。系数单纯形按 $\ell_1$-直径 $\le\eta$ 分有限块；同块混合差 $\le\delta+R\eta$（一组系数配同一组 $z_i$ 差 $\le\delta$，剩下系数差 $\times R$）。故 $\chi(\operatorname{conv} H)\le\delta+R\eta$，$\eta\downarrow0$、$\delta\to\chi(H)$。嵌套引理：取 $x_n\in C_n$，对每 $k$ 足够晚的 $C_n$ 有 $<2^{-k}$ 直径有限覆盖，无穷子序列落某块，对角线抽 Cauchy 子列，极限在每 $C_n$（完备、嵌套、闭）；交本身 $\chi(\bigcap C_n)\le\chi(C_k)\to0$ 逼完全有界加闭逼紧。

Lean：`KuratowskiBasic.lean` `chi_closure`（:124）；`KuratowskiConvexHull.lean` `dist_weighted_mixtures_le`（:25，$\delta+R\eta$ 计算）、`chi_convexHull`（:125）、`chi_closedConvexHull`（:143）；分箱辅助 `CoefficientBins.lean`、`ConvexCoverRegroup.lean`、`ConvexDiameter.lean`；`KuratowskiNested.lean` `nonempty_isCompact_iInter_of_chi_tendsto_zero`（:80）；`KuratowskiTotalBounded.lean` `chi_eq_zero_iff_totallyBounded`（:73）。

`[推测]` 失败路线：用 Hausdorff $\beta$ 则 $\beta(\operatorname{conv} H)\le\beta(H)$ 一般不成立（要 Minkowski 型且带常数损失），选 $\chi$ 的硬理由在此；嵌套引理不用对角线只给有限覆盖不给单块直径趋 0，对角线必需；省略 $R\eta$ 项（误以为凸包不涨直径）会漏掉跨块混合的系数扰动。

### 13.2 Lemma A.2：单纯形自映射不动点（lem:simplex）

陈述（`main:502-504`）："Every continuous self-map of a finite-dimensional probability simplex has a fixed point." 这是 Brouwer 在单纯形上的版本，用 Sperner 标号引理证。

机制（`main:505-515`）。三角剖分加标号：顶点 $a$ 标一个满足 $a_i>0$ 且 $a_i\ge P(a)_i$ 的 $i$；存在性"otherwise summing over the positive coordinates of $a$ would give $1<\sum_iP(a)_i=1$"。边界条件：顶点标号属于包含它的每个原面的顶点标号集（缺坐标 $i_0$ 则 $a_{i_0}=0$、标号 $\ne i_0$）。Sperner 奇偶计数：模 2 数"小 $m$-单纯形 $\times$ 标号 $0,\dots,m-1$ 的 $(m-1)$-面"的入射对，内部面计 2 次，边界好面落在缺标号 $m$ 的原面内、个数奇（对维数归纳），全标号形恰贡献 1，逼全标号形个数奇。网格细化：面先细分再锥到重心（barycentric subdivision），嵌套面 $k\le l$ 重心差 $\le(1-k/l)\times$ 原直径，$m\ge1$ 维每层直径缩 $m/(m+1)$。极限：每层取全标号小形，$m+1$ 顶点在 mesh$\to0$ 下聚于 $a$，$a_i\ge P(a)_i$ 逐坐标传极限、求和逼相等，$a=P(a)$。

Lean：全形式化最大独立板块（Sperner/FiniteComplex/Barycentric 约 20 文件、约 2900 行）。`FiniteComplex.lean`（`sd` 重心细分 :52、`Pure` :89-92）；`BarycentricMesh.lean`（网格界 `norm_finiteBarycenter_sub_le_mesh` :143）；`SpernerFacet/SpernerIncidence/SpernerBoundary`（奇偶计数 `sperner_count_mod_two` :38、`sperner_odd_of_boundary_odd` :88）；`Sperner.lean` `iterated_sperner_odd`（:20）、`iterated_sperner_exists`（:91）；`SimplexLimit.lean` `probabilitySimplex_fixedPoint_of_shrinking_family`（:63）；`SimplexFixedPoint.lean` `continuous_probabilitySimplex_fixedPoint`（:83，本体）。

`[推测]` 失败路线：直接引 Mathlib Brouwer 数学等价，但本形式化自建 Sperner 链（可能因比较器要求解模块自足）；用 Knaster–Tarski 序不动点，离散格条件不满足连续映射；省略 mesh 收缩率证明，极限形退化顶点不共点。

### 13.3 Lemma A.3：紧凸 Schauder（lem:compactfixed）

陈述（`main:517-519`）："Every continuous self-map $g$ of a nonempty compact convex subset $K$ of a normed space has a fixed point." 机制（`main:520-533`）：取有限严格 $\delta$-网 $P_1,\dots,P_N\subset K$；近似映射系数 $\lambda_i(x)=\frac{\max\{\delta-\|P_i-g(x)\|,0\}}{\sum_j\max\{\delta-\|P_j-g(x)\|,0\}}$（分母正：$g(x)\in K$、网覆盖逼存在 $\|P_j-g(x)\|<\delta$）；单纯形自映射 $(a_i)\mapsto(\lambda_i(\sum_ja_jP_j))$，A.2 给固定系数向量，其 $x$ 满足 $\|x-g(x)\|\le\sum_i\lambda_i(x)\|P_i-g(x)\|<\delta$（正权逼对应距离 $<\delta$）；$\delta\downarrow0$ 得近似不动点列，$K$ 紧取收敛子列收尾。

Lean：`CompactApproximation.lean` `compactNetWeight/_Total/_Coefficients`（:28-34，即 $\lambda_i$）、`compactNet_sum_sub_lt`（:119）、`exists_approximate_fixedPoint_of_isCompact_convex`（:152）；`CompactConvexFixedPoint.lean` `exists_fixedPoint_of_isCompact_of_approximate`（:22）、`exists_fixedPoint_of_isCompact_convex`（:39，本体）、`extendSelfMap`（:49，把 $g:K\to K$ 延到全空间以满足 A.2 输入格式，论文未提的胶水）。凸性用在 $x=\sum a_jP_j\in K$；"strict $\delta$-网网心属 $K$"保证自映射目标在参数域内，非修饰词。

### 13.4 Theorem 4.1 的证明（附录版）

原文（`main:535-541`）："Set $C_0=C$ and $C_{n+1}=\overline{\operatorname{conv}}(g(C_n))$. These are nonempty closed bounded convex subsets of $C$ satisfying $C_{n+1}\subset C_n$. By Lemma~\ref{lem:chi}, $\chi(C_{n+1})=\chi(g(C_n))\le\gamma\chi(C_n)$, so their intersection $K$ is nonempty, compact, and convex. If $x\in K$, then $g(x)\in g(C_n)\subset C_{n+1}$ for every $n$, so $g(K)\subset K$. Apply Lemma~\ref{lem:compactfixed}."

我把 $C_{n+1}\subset C_n$ 那步补全：需 $g(C)\subset C$ 与像的单调性 $A\subset B\Rightarrow g(A)\subset g(B)$（恒成立），故 $C_{n+1}=\overline{\operatorname{conv}}g(C_n)\subset\overline{\operatorname{conv}}g(C_{n-1})=C_n$。$\chi(C_{n+1})=\chi(\overline{\operatorname{conv}}g(C_n))=\chi(g(C_n))$（A.1 两连）；压缩假设消费 $H=g(C_n)\subset C$，全部子集版本在此兑现。$\chi(C_n)\le\gamma^n\chi(C)\to0$；A.1 嵌套引理给 $K$ 非空紧凸；$g(K)\subset K$；Schauder 收尾。Lean 全程模拟在 `CondensingIteration.lean`（`condensingSequence` :31、`condensingSequence_chi_tendsto_zero` :162），组装在 `CondensingFixedPoint.lean:26`（§7 已记）。$g$ 连续性在附录只用于 Schauder（$K$ 上），与主文"回返映射连续"接口吻合。

## 14 常数与参数台账

这一节把散在 13 条里的所有常数收进一张表，并标注哪些值论文已证、哪些是我外部推算。论文对几乎所有参数只给"够用"的界，从不声称最优；凡涉及最优性我都在敏感度栏写明。出处给 TeX 行号，Lean 给 `文件:行`。

| 对象/常数 | 取值或定义 | 出处（TeX） | Lean | 用途与敏感度 |
|---|---|---|---|---|
| $S_X$ | $\{x:\lVert x\rVert=1\}$，继承度量 | 49 | `Model.lean:12` | 全篇舞台 |
| $D_q(x,y)$ | $\lVert f(x)-qf(y)\rVert-\lVert x-qy\rVert$ | eq:defect(149) | `Basic.lean:50` | 跨半径缺陷度量 |
| $M$ | $\sup\lvert D_q\rvert$，$0\le M\le1$ | eq:defect(150), eq:defectbound(159) | `Basic.lean:60`（sSup） | 反证对象；$\gamma<1$、$A+B<1$ 引擎 |
| $\lvert D_q\rvert\le2\min(q,1-q)$ | Lipschitz 加 $D_0=D_1=0$ | eq:defectbound(159) | `Basic.lean:110` | 挤 $t\in[M/2,1-M/2]$；$M\le1$ |
| $D^{f^{-1}}=-D^{f}$ | 双射代入 | eq:inverse-defect(154) | `Basic.lean:76` | 符号朝向归一；逆构型界 |
| $\mathcal U$ | $\mathbb N$ 上自由超滤（choice） | 176 | `UltraRealLimit.lean:135`（hyperfilter） | ultralimit 存在唯一 |
| $\lVert (a_n)\rVert_{\mathcal U}$ | $\lim_{\mathcal U}\lVert a_n\rVert$ | 179-181 | `UltraNormed.lean:175` | 半范数逼商 $Q_X$ |
| $Q_X,Q_Y$ 加完备化 | 半范数核的商，再 $\widehat{Q_X}$ | 182, 196 | `UltraNormed.lean:146,205`；`SphereCompletion.lean:145` | 缺陷取到载体；Banach 环境给 Darbo |
| $x_0,y,t$ | $\lVert f(x_0)-tf(y)\rVert-\lVert x_0-ty\rVert=M$，$M/2\le t\le1-M/2$ | eq:maximal(167-170), 174 | `DefectAttainment.lean:51` | attained 入口；$t\in(0,1)$ |
| $b$ | $f(y)$ | 219 | `Alignment.lean:61` 参数 | $Y$ 侧基点 |
| $p,s,u,r$ | 四弦半径（eq:return 链） | 236-240 | `ReturnMap.lean:71-107` | 弦账基本量 |
| $g(v)$ | 回返映射 | 236-240 | `ReturnMap.lean:104,278` | 不动点对象 |
| 半径区间 | $p,r,s,u\in[1-t,1+t]$ | 230, 241 | `ReturnMap.lean:148`；`AlignedConfiguration.lean:46-84` | $a,U$ 界；分箱尾 $4\eta/a$ |
| $E$ | $\{v\in S_X:s(v)-p(v)=M\}$ | 243 | `ExtremalPropagation.lean:30` | 极值方向集；传播域 |
| eq:equality | $r=u+M$、$\lVert pv+rg(v)\rVert=p+r$ | 248-250 | `extremal_radius_identities` | 公共支撑产生点 |
| $C$ | $\overline{\operatorname{conv}}\{v_n\}$，$a_n$ 稠密，$\lambda_n\to0$，扰动 $\le2\lambda_n$ | 258-267 | `InvariantConvexSet.lean:106`；`PositiveScheduling.lean:90,153` | Darbo 域；唯一可分对象 |
| eq:contraction | $\lVert g(v)-g(v')\rVert\le\frac{up}{rs}\lVert v-v'\rVert+\frac{2\lvert u-u'\rvert}{r}+\frac{2u\lvert p-p'\rvert}{rs}$ | 280-284 | `ReturnMapEstimate.lean:82,170` | $\chi$ 压缩原型 |
| $a,U$ | $a=1-t>0$，$U=1+t$ | 285 | `ReturnMapFixedPoint.lean:27` | 分母正性；bin 宽 |
| $\gamma$ | $(1-M/U)^2\in(0,1)$；$\frac{up}{rs}\le\gamma$ | 287-289 | `ReturnMapBounds.lean:81-110` | Darbo 压缩常数；非最优（外部推算，见下） |
| 尾项界 | $\le4\eta/a$（用 $r,s\ge a$、$u<r$） | 291 | `ReturnMapNoncompactness.lean:21,60` | $\chi(gH)\le\gamma\chi(H)$ |
| eq:chords/radii | 四弦式；$s-p=r-u=M$，$d=p+r=s+u\le2$ | 220-231 | `AlignedConfiguration.lean:23-44` | 层 3 全输入 |
| $A,B,\epsilon$ | $A=p/d$，$B=u/d$，$\epsilon=1-t$；$A+B=1-M/d<1$ | eq:AB(322-325) | `AlignedConfiguration.lean:92-131` | 分枝阈值 |
| $h$ | $\min\{t/s,\epsilon/u\}$ | 333 | `ChordSecant.lean:67` | 免费零半径选择 |
| $\theta,K$ | $\theta=hs/p\le t/p=\beta$；$K$ secant 斜率 | 334-335 | `ChordSecant.lean:68,69` | 支撑向量与上下界枢纽 |
| $sr-up$ | $=Md$ | 355 | `chord_identity` `AlignedConfiguration.lean:150` | 加权消元分母 |
| eq:K | $\epsilon/p\le\varphi(v)\le K\le1-B$ 或 $\le B$ | eq:K(339-343) | `secant_bounds` `ChordSecant.lean:221` | 分枝上界 |
| eq:product | $pu/(d\epsilon)\ge1$（$B>\epsilon$ 时） | 381-383 | `largeB_product_bounds` `LargeChord.lean:28` | 符号自举第一环 |
| $j=L(y)$ | $<0$（每 $v$ 支撑）；逆侧 $\varphi(b)>0$ | 384-400 | `largeB_forces_largeA_and_negative_support` :49；`largeB_support_signs` :112 | 微扰两翼 |
| $u<r<1$ | $r-tj\le1$ 推论 | 393 | `LargeChord.lean:49` 内部 | $Au\ge\epsilon\Rightarrow A>\epsilon$ |
| eq:inverse | $(p',s',r',u')=(u,r,s,p)$，$(A',B')=(B,A)$ | 396-399 | `AlignedConfiguration.lean:178` | 对称闭合 |
| eq:perturb | $\lVert sw+\eta b\rVert-\lVert pv+\eta y\rVert\le M$（$0<\eta<t$） | 403-405 | `RadialPerturbation.lean:87,110` | 大分支矛盾主不等式 |
| eq:small | $\epsilon\le dA(1-B)$，$\epsilon\le dB(1-A)$ | 422-424 | `small_secant_product`；`ChordContradiction.lean:22-27` | 小分支定量 |
| $\min<1/4$ | $A\le B\Rightarrow A(1-B)\le A(1-A)<1/4$ | 425 | `smallChord_epsilon_lt_half` `SmallChord.lean:21` | $\epsilon<1/2$（用 $d\le2$） |
| eq:ratios | $p/t<r/\epsilon$；$s/t\ge u/\epsilon$ | 426-429 | `smallChord_coefficients` :45 | 凸比较自变量排布 |
| $F,G$ | $\lVert y+\lambda v\rVert$、$\lVert b+\lambda w\rVert$，$F(0)=G(0)=1$、$F(p/t)=G(s/t)=1/t$ | 431-439 | `hx hfx` 传入 `SmallChord` | secant 单调双函数 |
| 终结等式 | $\epsilon F(r/\epsilon)=\lVert y-z\rVert=\lVert b-f(z)\rVert=\epsilon G(u/\epsilon)$ | 444-449 | `hiso` `ChordContradiction.lean:41-44` | 矛盾收口 |
| $q=\beta/\alpha$ | 跨半径归一化 | 455 | `scaled_norm_sub_eq` `RadialExtension.lean:79` | $M=0$ 兑现为全局保距 |
| $\delta$（中点缺陷） | $\lVert F(m)-m'\rVert\le\lVert a-c\rVert/2$，反射翻倍 $2\delta$ | 465-472 | （Mathlib MazurUlam，未重证） | 仿射步 |
| $\chi$ | $\inf\{\delta$：有限 $\delta$-直径覆盖$\}$ | 203-206 | `KuratowskiBasic.lean:20,71,75` | 非紧度量 |
| $C_n$ | $\overline{\operatorname{conv}}(g(C_{n-1}))$，$\chi\le\gamma^n\chi(C_0)\to0$ | 536-539 | `CondensingIteration.lean:31-176` | 紧核 $K$ |
| $\lambda_n$（调度） | $0<\lambda_n<1$、$\to0$；实现 $1/(n+2)$ | 265-267 | `PositiveScheduling.lean:90` | 稠密化扰动界 $2\lambda_n$ |
| $N,\eta,R$（A.1） | 覆盖块数/系数分割宽/范数界 | 491-496 | `dist_weighted_mixtures_le` :25 | $\chi(\operatorname{conv} H)\le\delta+R\eta$ |
| 细分缩率 | $m/(m+1)$ | 512 | `BarycentricMesh.lean:143` | mesh$\to0$ |

跨行敏感度检查（反推备忘，也是我认为这篇最脆弱的几处定量环节）。

$M$ 三次消费：$\gamma<1$（`main:289`）、$A+B<1$（`main:325`）、严格支撑符号自举 $1=L(v)\le B<1$（`main:389`）。若 $M=0$ 三处全塌，但那正是目标结论，逻辑不循环。

$t<1$ 四次消费（径向中心内点、$a=1-t>0$、$\epsilon>0$、$A\le\epsilon<t$）；$t>0$ 两次（$h>0$ 逼割线非退化、$\eta<t$ 微扰窗）。$d\le2$ 专属 $\epsilon<1/2$；$A<1/2$ 只用 $A+B<1$。$d\ge2\epsilon$（$p,r\ge1-t$）未单独命名，隐含在 eq:product 分母各处，形式化里由 `p_bounds/r_bounds` 直供。$\beta=t/p$ 看似多余，只为 $\theta\le\beta$ 三分与 $v+\theta y\ne0$ 的 $\theta<1$ 界服务，两处都吃 $p\le1+t$。

`[推测]` 关于最优性。$\gamma=(1-M/U)^2$、$\epsilon<1/2$、$\min<1/4$、$4\eta/a$ 这些常数，论文只证到"够用"，从未证它们是最优可容许值。比如 $\gamma$ 的真实收缩率是 $up/rs$，论文用 $(1-M/U)^2$ 放大；能否取更小（从而在更弱的 $M>0$ 假设下也压缩）论文不回答，是我从证明需求外部推算的界。同样，$\epsilon<1/2$ 只用来逼 $t>1/2$ 与两条比例式；$1/2$ 是否阈值、换成别的分割是否仍闭合，我没有证据，只知现证够用。凡此类"卡够即可"处，我都当悬案看待（§16）。

## 15 Lean 取证

模块在 `E:\math\lean\OAI\Analysis\SphereIsometry\`，70 文件、9273 行。登记：`formalization.yaml:132-134` 记 `title: "A positive solution to Tingley's problem"`、`authors: ["OpenAI"]`；`formalization.yaml:1598-1600` 记比较器三元组：config `ComparatorChallenges/TingleySphereIsometry.json`、主声明 `OAI.Tingley.tingley_sphere_isometry_full`、文件 `OAI/Analysis/SphereIsometry/Extension.lean`。比较器 JSON（15 行）：`solution_module: "OAI.Analysis.SphereIsometry.Main"`、`theorem_names: ["OAI.Tingley.tingley_sphere_isometry_full"]`、`definition_names: []`、`permitted_axioms: ["propext", "Quot.sound", "Classical.choice"]`、`enable_nanoda: false`。`definition_names` 空意味着比较器只核主定理语句，不要求把 `UnitSphere`/`SignedDefect` 对齐到挑战模块命名；允许公理面恰是 Mathlib 基线，说明全链无集合论强假设（连续统假设、饱和超滤都没用，超滤只用可数集上构造性的 `Filter.hyperfilter`）。

模块按功能分组（行数为近似值）：基座与记号约 277 行（`Model`、`Basic`、`DiameterBounds`、`ProbabilitySimplex`）；支撑与径向约 379 行（`Supports`、`RadialContact`、`PositiveConvexFace`）；缺陷取到约 800 行（`UltraRealLimit`、`UltraNormed`、`UnitRepresentatives`、`UltraSphere`、`SphereCompletion`、`DefectSequence`、`DefectAttainment`）；对齐约 1100 行（`ReturnMap` 353、`ExtremalPropagation` 251、`InvariantConvexSet`、`PositiveScheduling` 380、`ReturnMapEstimate`、`ReturnMapBounds`、`ScalarBins`、`CoefficientBins`、`ReturnMapNoncompactness`、`ReturnMapFixedPoint`、`Alignment`、`AlignedConfiguration` 234）；弦矛盾约 900 行（`ChordSecant` 271、`RadialPerturbation`、`LargeChord`、`SmallChord`、`ChordContradiction`）；不动点与凸几何约 2900 行（Kuratowski 四件套、`CondensingIteration`、`CondensingFixedPoint`、`CompactConvexFixedPoint`、`CompactApproximation`、`SimplexFixedPoint`、`SimplexLimit`、Sperner 系列、`FiniteComplex`、`SubdivisionData`、Barycentric 系列、`ConvexCoverRegroup`、`ConvexDiameter`）；延拓收尾（`RadialExtension` 214、`Extension` 120）。

依赖拓扑主干：

```
Model → Basic → {Supports, RadialContact, DefectSequence, SphereCompletion}
Supports → PositiveConvexFace → ExtremalPropagation
RadialContact → ReturnMap → ExtremalPropagation → AlignmentSet
InvariantConvexSet(←PositiveScheduling) → AlignmentSet
ReturnMapEstimate → ReturnMapFixedPoint ← ReturnMapNoncompactness ← CondensingFixedPoint
   ← {CondensingIteration, KuratowskiNested, CompactConvexFixedPoint ← CompactApproximation ← SimplexFixedPoint ← Sperner 线}
AlignmentSet + ReturnMapFixedPoint + AlignedConfiguration → Alignment
AlignedConfiguration + Supports → ChordSecant
ChordSecant + RadialPerturbation → LargeChord；SmallChord（独立标量化）
LargeChord + SmallChord → ChordContradiction
UltraSphere + DefectSequence + SphereCompletion → DefectAttainment
{DefectAttainment, Alignment, ChordContradiction, RadialExtension} → Extension → Main
```

三条拓扑特征我拿来验证分层是否诚实。两条基础设施支线只在末端合流：Kuratowski/Darbo 线（不动点）与 Sperner/Barycentric 线（单纯形组合学）互不 import，仅在 `CompactConvexFixedPoint` 衔接；ultraproduct 线（Ultra* 加 SphereCompletion）只服务 `DefectAttainment`。弦矛盾线（ChordSecant/Large/Small）完全不依赖不动点线，对齐一旦以 `AlignedConfiguration` 结构交付，后续是纯有限维与标量论证，这正是我在 §8 末尾强调的"切断"的形式化证据。全模块对 Mathlib 分析库只有三个重依赖点：Hahn–Banach（`Supports.lean:2`）、Mazur–Ulam（`RadialExtension.lean:3`）、RCLike 实数基（`ChordSecant.lean:3`）。

形式化语句与论文措辞的差异，我列关键的十二条：主定理形状（论文"$T$ 径向公式定义、满射实线性等距、唯一"，Lean `tingley_sphere_isometry_full`（`Extension.lean:101-109`）输出存在式合取，唯一性量化在所有 `X →ₗ[ℝ] Y` 上且只要求球面限制相等，`T 0 = 0` 从定义变结论合取支）；输入形式（Lean 拆 `f`/`Isometry f`/`Surjective f`，再 `sphereIsometryEquiv`（:89，`Equiv.ofBijective`）折成 `≃ᵢ`）；完备性显式化（`Extension.lean:24-25` 双 `CompleteSpace`，`Alignment.lean:61` 只要 `CompleteSpace X`，形式化精确追踪了完备性消费面而论文未明说）；非零 vs `Nontrivial`（等价，`Basic.lean:41`）；实线性载体 `≃ₗᵢ[ℝ]` 比"real-linear isometry"多了可逆捆绑；径向公式逐字对应 `normalize x hx = ‖x‖⁻¹ • x`；缺陷取到引理论文改名重载 $f$、Lean 不重载用 `Or` 携带两朝向；回返映射论文在 $S_X$ 上定义、Lean 双轨 `returnSphere` 加 `returnAmbient`；$\chi$ 压缩量化 Lean 显式含空集且用 `Bornology.IsBounded`；附录取舍（唯一一处"论文有、Lean 无"的实质论证是 Nica 反射，Lean 引 Mathlib，反之 Lean 有 `extendSelfMap`、`UltraSequence` 包装、`sphereCompletionEquiv` 等胶水）；超滤器论文用 Zorn 加 choice、Lean 用具体 `hyperfilter ℕ` 只吃 `Classical.choice`；稠密调度论文两句、Lean 是 `PositiveScheduling.lean` 380 行显式机器。

算子理论核对项（模板要求，如实报告）：本论文与 Hilbert 空间、算子理论无关。未使用 `InnerProductSpace`、`Unitary`、`SelfAdjoint` 与任何谱定理部件。实际使用的 Mathlib 分析面是 `NormedAddCommGroup`/`NormedSpace ℝ`、`Isometry`/`IsometryEquiv`、`SeparationQuotient`、`UniformSpace.Completion`、`Filter/Ultrafilter`、Hahn–Banach（`exists_dual_vector''`、`exists_extension_norm_eq`）、Mazur–Ulam、凸性基础（`Analysis.Convex.*`）、紧致/列紧（`Topology.Order.Compact`、`Metric.totalBounded`）、介值（`Topology.Order.IntermediateValue`）。任务模板里"谱测度计算/酉构造/直和分解"等核对项在本论文没有对应物，我在 §二未虚构任何此类内容。假设总账：Lean 相对论文额外的是 `Nontrivial` 类捆绑、`Bornology.IsBounded`、`ContinuousOn`/`MapsTo` 拆分、空集 $\chi$ 情形、ultraproduct 需统一范数界序列；论文相对 Lean 无额外假设（每个假设都有 Lean 消费点）；双方共同的是实标量域、完备性只在所需层出现、满射双向使用（`f.symm` 在 `HasDefectBound.symm`、`zPoint`、`AlignedConfiguration.inverse` 三处）。

## 16 剩下的悬案，以及我如果继续做会走的三条岔路

先老实交代素材与本文都没闭合的地方，即论文的"未述"清单，我一条不藏。

论文未述的动机类问题有四。其一，为何缺陷沿单一基方向 $y$ 定义，并非双参数，我在 §3 给了 `[推测]`，但没有反证说别的定义一定不行。其二，为何 eq:maximal 里选 $s-p=M$ 来定义 $E$、，并非直接用 $D_t(x,y)=M$，我的重构是让极值变成方向的内在性质以便支撑关系传播（传播要等号不要估计），但"最初怎么想到的"仍是 `[推测]`。其三，$h=\min\{t/s,\epsilon/u\}$ 与 §11 取出的异向比例式的互补性，我能证明它闭合，却没证据说没有更对称的构造。其四，$t\in[M/2,1-M/2]$ 的阈值 $M/2$、$\epsilon<1/2$ 的阈值 $1/2$、$\min<1/4$ 里的 $1/4$，论文都只证够用不证最优，这是 §14 敏感度栏里最薄的一块。

论文未述的技术问题有两条。一是稠密调度里 $\lambda_n$ 的具体选择：论文明说"mix... using a weight $0<\lambda_n<1$ tending to zero"，Lean 用 $1/(n+2)$，但收敛速度对 $\chi$ 估计的影响没有任何一处需要，$C$ 只要稠密就够了，这条线索在我这里是断的。二是逆构型环（$A>\epsilon\Leftrightarrow B>\epsilon$）里那个"$\Rightarrow$"我只在反证框架下用到（先假设某者成立再逼矛盾），若想在构造层面直接利用它的对偶性，我没有方向。

`[推测]` 全篇我读得最不安的一句是 §8 模块 5 那句"this endpoint may differ from $x_0$"。不动点 $v$ 给的 $x=x(v)$ 未必是取等点 $x_0$。取等点是 $M$ 被达到的位置，不动点却只是 $g$ 的不动位置；两者只在 $s-p=r-u=M$ 这条等式上相连。我的整个层 3 论证只吃这条等式与四半径界，不吃 $x=x_0$，所以逻辑上无懈；但直觉上"我费尽力气对齐的弦，其一端根本不是我最初取到缺陷的那个点"这件事，说明取到配置（层 1）与对齐配置（层 2）之间丢掉了什么。素材与论文都没追究这个丢掉的量是否可回收，我把它列进悬案。

如果我继续做，三条岔路按代价从低到高排。

第一条，参数最优化与定量强化。现在的证明在 $M>0$ 与 $\gamma<1$ 之间留了很大余量：$\gamma$ 真值是 $up/rs$ 而放大到 $(1-M/U)^2$，$\epsilon<1/2$ 只服务 $t>1/2$。把常数链精细记账，可能给出"$M$ 一旦为正就有 $M\ge c$ 这种间隙"型的定量加强，从而把缺陷二难换成对某类空间显式的 Lipschitz 常数估计。这条路纯记账，风险最低，但很可能撞回"$1/2$ 到底是不是阈值"这个我自己都没答的问题。

第二条，把不动点机器换掉。回返映射压缩 $\chi$ 是设计的内核，但它逼我造不变闭凸集 $C$、做稠密调度、在附录自建 Sperner 到 Schauder 到 Darbo 的整条 2900 行链。若存在一个直接构造对齐方向的变体（例如证明 $g$ 在某个可显式写出的面上必有不动点，绕开 condensing 迭代），整层 2 可大幅瘦身。我试过用面几何（Cheng–Dong、Tanaka 的最大凸子集语言）直接指认 $E$ 的极值结构，但 $E$ 的定义 $s-p=M$ 是缺陷等式、不是面等式，在非光滑空间里我没能把它翻成面语言，这条暂时封死；论文自己也只承认"geometric affinity"（`main:93-95`），不声称等价。

第三条，跨半径缺陷定义的更高维推广。我把 $D_q$ 限制在单基方向 $y$ 上才把一切压进 $\operatorname{span}\{v,y\}$ 的二维对偶紧性。若想把方法推广到"多个跨半径参数同时取极值"（比如球面到自身的高阶保距结构、或度量球到度量球的一般情形），缺陷就得是二参数甚至无穷参数族，超滤器与 secant 消元都会失去低维落点。这条路我最想试，也最清楚现在走不通：它要求我先把 §3 那条"$x-qy$ 是保持低维的最小信息集"从推测升级成定理，而我还做不到。走到这里停笔，这一篇的正解我已经复现到每一处估计；剩下的悬案我留着，不在稿子里假装它们已经关上。

## 17 常数与参数台账

§14 那张账是我早先按"对象 / 取值 / TeX 行 / Lean 行 / 用途与敏感度"立的，消费方与风险混在最后一栏，位置也分成了两处。这里按五栏定式另立一账，与 §14 并存、不改写它：位置一律给单个 `文件:行`，全部回 `build\main.tex` 逐行核过；消费方只写"谁吃它"，改动后果只写"塌在哪一步"。范数统一写 `\lVert \rVert`，绝对值统一写 `\lvert \rvert`，单元内不出现竖线字符，表列因此不会破。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $S_X$ | $\lVert x\rVert=1$ 的点集，距离从 $X$ 继承 | main.tex:49 | thm:main 里 $f$ 的等距性(main.tex:52)；$E\subset S_X$(main.tex:243)；层 4 的归一 $x/\lVert x\rVert$(main.tex:54) | 换成闭球则 $D_0=D_1=0$ 两端锚(main.tex:157)失配，$M\le1$ 与 $t$ 的夹逼一起断 |
| 维数与几何假设 | 任意维，不要求可分、自反、光滑、严格凸 | main.tex:59 | 层 0 的选型红线；全篇唯一可分对象是构造出的 $C$(main.tex:267)；支撑只在有限维张成内取(main.tex:116) | 补严格凸会让公共支撑唯一化，lem:support(main.tex:118-124)失去必要性；补自反可把 Darbo 换成弱紧。两条都只缩覆盖面，不断证明 |
| $D_q(x,y)$ | $\lVert f(x)-qf(y)\rVert-\lVert x-qy\rVert$，$q\in[0,1]$ | main.tex:149 | $M$ 的定义(main.tex:150)；eq:maximal 取等(main.tex:169)；两个测试缺陷 $\Delta_x,\Delta_z$(main.tex:349,353) | 把 $q$ 放到 $1$ 以外则 $\min(q,1-q)$ 形状失配，main.tex:159 往后的区间论证全需重排 |
| $M$ | $\sup\lvert D_q(x,y)\rvert$，$0\le M\le1$ | main.tex:150 与 159 | 取等式(main.tex:169)；$E$ 的定义(main.tex:243)；$\gamma$(main.tex:289)；$A+B=1-M/d$(main.tex:325)；$sr-up=Md$(main.tex:355) | 界若退化到 $M\le2$，则 $M\le1\le U$ 不成，$\gamma$ 可 $\ge1$，Darbo 无输入(main.tex:210) |
| $2\min(q,1-q)$ | 逐点缺陷界，系数 2 是两个 1-Lipschitz 函数之差给的 | main.tex:157 与 159 | 把 $t$ 卡进 $[M/2,1-M/2]$(main.tex:174)；保证 $t-sh,t+uh\in[0,1]$(main.tex:355) | 系数写成 1 则 $M/2$ 变 $M$，该区间可为空，层 1 给不出 $0<t<1$ |
| $f$ 的双射性 | 单射来自等距，满射来自假设 | main.tex:152 | eq:inverse-defect(main.tex:154)；$F$ 的逆由 $f^{-1}$ 逐项给出(main.tex:189)；层 4 的 $T$ 满(main.tex:461) | 只留单射则反射共轭 $H=F^{-1}RF$(main.tex:468)无定义，仿射步整段停 |
| $D_q^{f^{-1}}$ | $-D_q(x,y)$，绝对值同界 | main.tex:154 | 层 1 换号取同号子列(main.tex:174)；层 3 逆构型的合法性(main.tex:400) | 符号弄反则 $E$ 上的双向夹逼(main.tex:246-256)方向倒转，$g(v)\in E$ 断 |
| $\mathcal U$ | $\mathbb N$ 上的自由超滤，由极大性原理给，用 choice | main.tex:176 | 序列半范数(main.tex:180)；有界实序列沿 $\mathcal U$ 的极限存在且唯一(main.tex:176) | 换普通极限则 $M$ 未必可达，lem:attainment 的陈述(main.tex:164-172)落空 |
| $\lVert(a_n)\rVert_{\mathcal U}$ | $\lim_{\mathcal U}\lVert a_n\rVert$，只是半范数 | main.tex:180 | 商 $Q_X$ 的范数诱导(main.tex:182)；单位代表可调成逐项单位(main.tex:182) | 不商掉核则 $Q_X$ 不分离，$F$ 的距离不变性(main.tex:186-189)失去意义 |
| $Q_X,Q_Y$ 及完备化 | 商再完备化，常数列给出等距嵌入，故非零 | main.tex:182 与 196 | 缺陷界逐 $q$ 全带过去(main.tex:192-194)；Darbo 需要的 Banach 环境(main.tex:210) | 省掉完备化则嵌套交(main.tex:488)不保紧，附录整条不动点链断 |
| $t$ | $M/2\le t\le1-M/2$，故 $0<t<1$ | main.tex:165 与 174 | $a=1-t>0$ 与 $U=1+t$(main.tex:285)；$\epsilon=1-t$(main.tex:323)；微扰窗 $0<\eta<t$(main.tex:402) | $t\to1$ 时 $a\to0$，$4\eta/a$(main.tex:291)发散，$\eta\downarrow0$ 取不到 inf |
| $x_0,y$ 与 $b$ | 取等对；$Y$ 侧基点 $b=f(y)$ | main.tex:169 与 219 | 回返映射的两个中心 $ty$ 与 $tb$；种子方向 $v_0$(main.tex:243) | 基点若随 $v$ 变动，$s-p$ 不再是单一函数的差，$E$ 与 eq:chords(main.tex:220-225)无从定义 |
| $\rho(v)$ | 径向切点半径，$1-\lVert c\rVert\le\rho(v)\le1+\lVert c\rVert$，连续且唯一 | main.tex:136-138 | 四半径的界 $[1-t,1+t]$(main.tex:230,241)；$g$ 的连续性来源(main.tex:241) | $\lVert c\rVert=1$ 时唯一性失效，非严格凸下射线可交球面成一段，$p,r,s,u$ 不再是函数 |
| $p,r,s,u$ | 四弦半径，全为正且落在 $[1-t,1+t]$ | main.tex:219 与 230 | eq:radii(main.tex:228)；eq:contraction(main.tex:281-283)；$A,B,h,\theta,K$ 全由它们组装 | 越出该区间则 $1-M/r$ 的单调放大(main.tex:287-289)失去依据 |
| $d$ | $d=p+r=s+u=\lVert x-z\rVert\le2$ | main.tex:228 | $A=p/d$ 与 $B=u/d$(main.tex:323)；$sr-up=Md$(main.tex:355)；$\epsilon<1/2$ 靠 $d\le2$(main.tex:425) | $d$ 的上界若放宽，eq:small 只能给 $\epsilon<1$，$A\le\epsilon<t$ 与 $1-B\ge t$ 断 |
| $g(v)$ | 回返映射 $(ty-z)/r$，随 $v$ 连续 | main.tex:238-239 | 传播规则 $g(v)\in E$(main.tex:256)；$g(C)\subset C$(main.tex:267)；Darbo 的映射输入 | $g$ 不连续则不动点定理前提缺，main.tex:293 给不出对齐方向 |
| $E$ | $\{v\in S_X : s(v)-p(v)=M\}$，闭且非空 | main.tex:243 | 公共支撑的产生(main.tex:249)；$C\subset E$(main.tex:267) | 等号换成带容差的不等式则双向夹逼(main.tex:246-256)失效，传播链断 |
| $v_0$ | $(x_0-ty)/\lVert x_0-ty\rVert$ | main.tex:243 | 证 $E$ 非空的第一颗种子；$C=\overline{\operatorname{conv}}\{v_0,\dots\}$ 的起点(main.tex:259,266) | 分母为零需要 $t=1$，已被 main.tex:174 排除，此处正是 $t<1$ 的兑现点 |
| $C$ | $\overline{\operatorname{conv}}\{v_n\}$，非空闭有界凸，含于 $E\subset S_X$ | main.tex:266 | Darbo 的域(main.tex:210)；分箱覆盖的对象(main.tex:291) | $C$ 若跑出球面，$1=\varphi(l)\le\lVert l\rVert\le1$ 的右端(main.tex:261)不再成立 |
| $\lambda_n$ | $0<\lambda_n<1$，$\lambda_n\to0$；混合扰动至多 $2\lambda_n$ | main.tex:267 | 使 $a_n$ 在 $C$ 中稠密，从而把 $g(C)\subset C$ 从生成元推到闭包(main.tex:267) | 权重不趋零则稠密性丢，闭包处靠连续性收尾的那一步断 |
| eq:contraction 三系数 | 主项 $up/rs$，尾项 $2/r$ 与 $2u/(rs)$ | main.tex:281-283 | 主项吃覆盖直径 $\delta$，两尾项吃分箱宽度(main.tex:291) | 第二尾项丢 $u$ 因子则 $u/r<1$ 的用法落空，$4\eta/a$ 合不出来 |
| $a,U$ | $a=1-t>0$，$U=1+t$，全部半径在 $[a,U]$ | main.tex:285 | $\gamma$ 的定义(main.tex:289)；尾项 $4\eta/a$(main.tex:291)；分箱区间数有限(main.tex:291) | $U$ 若取成 $1$，$1-M/r\le1-M/U$ 方向反，$\gamma$ 不再是上界 |
| $\gamma$ | $(1-M/U)^2$；由 $0<M/U$ 与 $M\le1\le U$ 得严格小于 1 | main.tex:289 | $\chi(g(H))\le\gamma\chi(H)$(main.tex:291)；附录的几何衰减 $\gamma^n$(main.tex:538) | 取 $M=0$ 则 $\gamma=1$，Darbo 的 $\gamma<1$(main.tex:210)无输入；那正是待证结论，所以不成循环 |
| $4\eta/a$ | 两尾项之和的界，用 $r,s\ge a$ 与 $u/r<1$ | main.tex:291 | 像直径 $\gamma\delta+4\eta/a$，随后固定覆盖令 $\eta\downarrow0$ 再对 $\delta$ 取 inf | 预算里 $a$ 若换 $U$，界变 $4\eta U/a^2$ 量级，仍可令 $\eta\to0$，但 $a$ 趋零时失控 |
| $A,B,\epsilon$ | $A=p/d$，$B=u/d$，$\epsilon=1-t$；$A+B=1-M/d<1$ | main.tex:323 与 325 | lem:secant 的分枝判据(main.tex:341-342)；lem:large(main.tex:377)；prop:no-defect(main.tex:421) | $\epsilon$ 若另取写法（例如 $a/2$），分枝阈值与两侧的 $A,B\le\epsilon$ 同时失配 |
| $h$ | $\min\{t/s,\epsilon/u\}$ | main.tex:333 | 令 $t-sh$ 与 $t+uh$ 都在 $[0,1]$，且至少一端落在缺陷为零的端点(main.tex:355) | 取 $\max$ 则测试半径越界，$\Delta\le M$ 无从引用，$MK=(u\Delta_x+s\Delta_z)/d$(main.tex:357)断 |
| $\theta$ | $hs/p$，满足 $0<\theta\le\beta$ | main.tex:334 与 363 | 被支撑向量 $v+\theta y$ 的非零性(main.tex:361)；放大 $(1-B)/\theta$(main.tex:391) | $\theta=1$ 会逼出 $v=-y$ 与 $p=1+t$，main.tex:361 整段就是为排除这一情形而写 |
| $\beta$ | $t/p$；当 $p=1+t$ 时 $\beta<1$ | main.tex:361 与 363 | $\varphi(v)\ge\epsilon/p$ 的两分支证明(main.tex:364-373) | 丢掉 $\beta$ 分支则第二支撑 $\psi$ 的符号比较(main.tex:369-371)写不出来 |
| $K$ | secant 斜率，分子是 $\lVert(r/u)v+hy\rVert-\lVert(p/s)v+hy\rVert$，分母 $r/u-p/s$ | main.tex:335 | eq:K 的分枝上界 $1-B$ 或 $B$(main.tex:339-343) | $M=0$ 时 $sr-up=0$，分母为零(main.tex:355,363)，secant 无从定义 |
| $B=\epsilon$ 边界档 | 两缺陷同时为零，$K=0$，上界仍成立 | main.tex:359 | eq:K 分枝的边界闭合(main.tex:339-343) | 边界不补则分枝讨论留缝，$\varphi(v)\le K$ 在该点无归属 |
| $j=L(y)$ | 每个 $v$ 处的支撑在 $y$ 上严格负：$1-j>(1-B)/\theta\ge1$ | main.tex:384 与 391 | $r-tj\le1$ 逼出 $u<r<1$(main.tex:393)；逆侧转成 $\varphi(b)>0$(main.tex:400) | 允许取等则 $L$ 同时支撑 $v+\theta y$，得 $1=L(v)\le B<1$(main.tex:389)，严格性正省在此 |
| 逆构型字典 | $(p',s',r',u')=(u,r,s,p)$，$(v',w',y',b')=(-w,-v,b,y)$，$(A',B')=(B,A)$ | main.tex:397-400 | 把"$B>\epsilon$ 推 $A>\epsilon$"对称化，两侧支撑符号同时到手(main.tex:400) | 丢这张字典则 lem:large(main.tex:377)只消掉一半分支，$A,B\le\epsilon$(main.tex:421)无从建立 |
| $\eta$（微扰预算） | $0<\eta<t$；$\lVert sw+\eta b\rVert>s$ 而 $\lVert pv+\eta y\rVert<p$ | main.tex:402-406 | 与 eq:perturb(main.tex:404)正面冲突，收掉两个分枝 | 允许 $\eta=0$ 则两严格不等式退化成等号，矛盾消失；$\eta<t$ 保证半径 $t-\eta$ 仍可引用缺陷界 |
| eq:small | $\epsilon\le dA(1-B)$ 与 $\epsilon\le dB(1-A)$ | main.tex:423 | 下一行的小于 $1/4$ 与 $\epsilon<1/2$(main.tex:425) | 只留一式则 $t>1/2$ 逼不出，eq:ratios(main.tex:427-428)的方向失配 |
| $1/4$ 与 $1/2$ | $A\le B$ 时 $A(1-B)\le A(1-A)<1/4$；配 $d\le2$ 得 $\epsilon<1/2$ | main.tex:425 | $A\le\epsilon<t$ 与 $1-B\ge t$，继而 eq:ratios | 抛物线峰值 $1/4$ 是代数事实动不了，能动的是 $d\le2$ 那一档，改松即断 |
| $F,G$ | $F(\lambda)=\lVert y+\lambda v\rVert$，$G(\lambda)=\lVert b+\lambda w\rVert$；$F(0)=G(0)=1$，$F(p/t)=G(s/t)=1/t$ | main.tex:433-438 | secant 单调给 $F(r/\epsilon)>1/t$(main.tex:442)；凸性给 $G(u/\epsilon)\le1/t$(main.tex:444) | 若 $1/t$ 退化成 $1$，增长量消失，$\epsilon F>\epsilon G$ 的矛盾无从起 |
| 终结等式 | $\epsilon F(r/\epsilon)=\lVert y-z\rVert=\lVert b-f(z)\rVert=\epsilon G(u/\epsilon)$ | main.tex:446-447 | prop:no-defect 的收口(main.tex:449) | 中间等号靠 $f$ 在球面上的等距，两端点一旦不同在球面上就不可比 |
| $q=\beta/\alpha$ | 跨半径归一化，$\alpha\ge\beta>0$ 故 $q\in(0,1]$ | main.tex:455 | 提因子链 $\lVert T(a)-T(c)\rVert=\alpha\lVert f(x)-qf(y)\rVert$(main.tex:457-459) | $q=0$ 端供保范，$q=1$ 端免费（因 $D_1=0$）；缺 $q=0$ 则 $\lVert T(a)\rVert=\lVert a\rVert$ 断(main.tex:461) |
| $\delta$（中点缺陷） | $\delta=\lVert F(m)-m'\rVert\le\lVert a-c\rVert/2$，共轭反射后变 $2\delta$ | main.tex:466-470 | 迭代 $2^n\delta$ 与同一上界逼出 $\delta=0$(main.tex:472) | 反射若非满射则下一步共轭施不出，翻倍链第一次就停 |
| $\chi$ | 有限 $\delta$-直径覆盖的下确界 | main.tex:205 | thm:condensing 的前提(main.tex:210-212)；A.1 两条不变性(main.tex:485-486) | 换 Hausdorff 测度则凸包不变性不成立，main.tex:491-496 的账无处安放 |
| $N,R,\eta$（附录 A.1） | 覆盖块数 $N$、范数界 $R$、系数单纯形 $\ell_1$ 分割宽 $\eta$；$\chi(\operatorname{conv} H)\le\delta+R\eta$ | main.tex:491 与 496 | A.1 的凸包等式(main.tex:486)；迭代层 $\chi$ 的传递(main.tex:536) | 丢 $R\eta$ 项等于假设凸包不涨直径，跨块混合的系数扰动没被记账 |
| $2^{-k}$ | 足够晚的 $C_n$ 有直径小于 $2^{-k}$ 的有限覆盖 | main.tex:498 | 对角线抽 Cauchy 子列，交非空且紧(main.tex:488) | 只给 $\chi(C_n)\to0$ 而无嵌套则交可空，$K$ 建不起来，Schauder 无输入 |
| $C_n$ | $C_{n+1}=\overline{\operatorname{conv}}(g(C_n))$，$\chi(C_n)\le\gamma^n\chi(C_0)$ | main.tex:536-538 | thm:condensing 的证明收口(main.tex:540) | 压缩若只对 $H=C$ 成立，第一次迭代后 $\chi(g(C_n))$ 就失控 |
| $m/(m+1)$ | 重心细分每层直径至多缩此因子，$m\ge1$ | main.tex:512 | mesh 趋零使全标号小形的顶点聚成一点(main.tex:514) | 缩率取 $1$ 时极限点不共点，A.2 给不出 $a=P(a)$ |

依赖链（哪个常数喂哪条引理，改动它之后从哪一步塌）。

先交代词汇。验收口径要我挂近边缘点、各 epsilon 与 delta 预算、维数与半径假设、Schröder--Bernstein 型双射构造的参数。我把 main.tex 连同 references.tex 全查过，edge 一词零命中，没有叫 near edge point 的概念，也没有 Schröder--Bernstein 式论证，硬造名词我做不到。我按实际机制对号：这篇的"近边缘"是"半径离 $1$ 有多远"那一族量，即 $\rho$、$[1-t,1+t]$、$a$、$U$、$E$ 里的单位方向；"两侧对称的双射构造"是 $f$ 的双射加逆构型字典。下面四条链就是这张对应表的骨架，账目本身都在上表。

链一，近边缘到压缩常数。起点是 lem:radial 的前提 $\lVert c\rVert<1$ 与它的产物 $1-\lVert c\rVert\le\rho(v)\le1+\lVert c\rVert$（main.tex:136-138）；层 2 把 $c=ty$ 与 $c=tb$ 代入，得到"四个半径都在 $[1-t,1+t]$"（main.tex:230 与 241）；main.tex:285 给区间两端改名 $a=1-t$、$U=1+t$；随后分两路出口，主项走 $up/rs=(1-M/r)(1-M/s)\le(1-M/U)^2=:\gamma$（main.tex:287-289），尾项走 $4\eta/a$（main.tex:291）。这条链上唯一的边缘是球面自身，所有常数都在计量"离球面多远"：$a$ 是基点 $ty$ 到球面的最小裕度，$U$ 是外裕度，$E\subset S_X$ 把极值方向钉在球面上（main.tex:243）。改动的塌法分两支。若 $t$ 被推到 $1$（等价于放弃 main.tex:174 的双侧夹逼），$a=0$ 让 $4\eta/a$ 发散，main.tex:291 的像直径停在 $\gamma\delta+c$（$c>0$），$\eta\downarrow0$ 失效，Darbo 的压缩前提在第一次引用处就缺；若把半径上界从 $U$ 收紧成 $1$，$1-M/r\le1-M/U$ 的方向反过来，$\gamma$ 不再是上界，main.tex:293 的不动点失去存在依据，层 2 整层塌，层 3 的 eq:chords（main.tex:220-225）连输入都拿不到。

链二，epsilon 与 delta 预算的总账。同名符号在这篇里被复用，我拆开挂。
$\epsilon=1-t$（main.tex:323）是分枝阈值，喂 lem:secant 的判据 $B\le\epsilon$ 对 $B>\epsilon$（main.tex:341-342）、喂 lem:large 的假设（main.tex:377），最后由 prop:no-defect 收成 $A,B\le\epsilon$（main.tex:421）。它若换成 $\epsilon/2$，$h=\min\{t/s,\epsilon/u\}$（main.tex:333）随之移动，两个测试半径 $t-sh$、$t+uh$ 一起挪，main.tex:355 那句"至少一个半径是端点"落空，加权相消式 $(u\Delta_x+s\Delta_z)/d=MK$（main.tex:357）断。
$\eta$ 有两个互不相干的用量：分箱宽度 $\eta$（main.tex:291，要令 $\eta\downarrow0$）与微扰窗 $\eta$（main.tex:402，须 $0<\eta<t$）。前者进 $4\eta/a$，后者进 eq:perturb（main.tex:404）。把两者混成一个预算会同时坏两处：分箱受 $t$ 约束仍能趋零，无害；微扰一旦不受 $t$ 约束，半径 $t-\eta$ 出 $[0,1]$，缺陷界无从引用，main.tex:414 的"两严格范数不等式与 eq:perturb 矛盾"整段作废。
$\delta$ 有三个：覆盖直径 $\delta$（main.tex:291）、A.1 里被写作 $\eta$ 的系数分割宽（main.tex:496）、中点缺陷 $\delta$（main.tex:466）。最后一个只喂 Nica 反射的翻倍链（main.tex:470-472），与前面两条无关，我在 §12 已单独记过。
$\lambda_n$ 与扰动预算 $2\lambda_n$（main.tex:267）只喂稠密化，兑现 $g(C)\subset C$。$N,R,\eta$（main.tex:491-496）喂 $\chi(\overline{\operatorname{conv}} H)=\chi(H)$，间接喂迭代层 $\chi(C_{n+1})=\chi(g(C_n))$（main.tex:537）。$2^{-k}$（main.tex:498）只喂嵌套交的紧性。
按消费顺序看后果：$\epsilon$ 预算错则分枝漏；微扰窗 $\eta$ 错则大分支矛盾不成立；$\lambda_n$ 错则 $C$ 不 invariant，不动点根本不在 $C$ 里；分箱与覆盖预算错则 $\chi$ 压缩失去输入。四条预算彼此独立，没有一处可以互相顶替，这也是我认为这篇在记账上最干净的地方。

链三，维数与半径假设的落点。"任意维、不需可分自反光滑严格凸"（main.tex:59）与"支撑只在有限维张成里取"（main.tex:116）是配套的两句话，后者靠 main.tex:132 那句 "Finitely many such extensions suffice" 与前者的普适性并不冲突。三个下游点各吃一次：层 2 传播要同一个 $\varphi$ 在 $\operatorname{span}\{v_0,\dots,v_n,v_{n+1}\}$ 上对每个 $v_i$ 都取 $1$（main.tex:259）；层 3 的 $L_n$ 收敛子列需要 $\operatorname{span}\{v,y\}$ 上对偶闭球紧（main.tex:410）；可分性只在构造出的 $C$ 上兑现（main.tex:267）。完备性有四处消费：商空间的完备化（main.tex:196）、Darbo 的 Banach 环境（main.tex:210）、嵌套集引理（main.tex:488）、以及附录里 $\chi(C_n)\to0$ 后的极限归属（main.tex:498）。改动：删掉有限维张成条款，main.tex:410 的子列抽取要换成弱*加 Tychonoff，论文的初等证明随之重写；允许 $X$ 不完备，main.tex:196 与 488 两处同时失，$K$ 可空，Schauder 无输入。这两处我在 §4、§7 都留过话，这里补上它们与常数的接口：维数假设本身不带数值，但它决定 $a,U$ 这类标量预算能不能被有限分箱吃下。

链四，双射构造的参数。链条是：$f$ 满（main.tex:52）加等距自动单，得双射（main.tex:152）；代入定义得 $D_q^{f^{-1}}(f(x),f(y))=-D_q(x,y)$（main.tex:154），故逆有同一绝对界；层 1 用这条换号挑同号子列（main.tex:174），并在商空间里逐项用 $f^{-1}$ 造出 $F$ 的逆（main.tex:189）；层 3 用逆构型字典 $(p',s',r',u')=(u,r,s,p)$、$(v',w',y',b')=(-w,-v,b,y)$（main.tex:397-399），把 $(A,B)$ 换成 $(B,A)$（main.tex:400），于是"$B>\epsilon$ 推 $A>\epsilon$"与"每支撑在 $w$ 上对 $b$ 严格正"同时到手；两翼符号合起来喂微扰 eq:perturb（main.tex:403-405），矛盾收在 main.tex:414。这张字典是全篇真正的两侧对称来源：它是一个保持全部假设的对合，一侧证过的蕴含式在对侧自动成立。改动：丢 eq:inverse-defect 的界不变性，逆构型不再满足 eq:maximal 前提，main.tex:400 那句 "The preceding argument thus says" 落空，lem:large 只消掉一半分支，prop:no-defect 的 $A,B\le\epsilon$（main.tex:421）与紧随的 eq:small（main.tex:423）同时失据，最后的凸性矛盾（main.tex:444-449）无从起步。丢满射性则断得更早：$F$ 无逆（main.tex:189）、反射共轭 $H=F^{-1}RF$ 无定义（main.tex:468）。

同一量的两口径并列（只列出处，原文一字不改）。

其一，$1-t$。既存第 661 行把它写作 $a$（同量还以区间 $[1-t,1+t]$ 的形式记在既存第 656 行），出处给 main.tex:285 与 230、241；既存第 665 行把它写作 $\epsilon$，出处给 eq:AB(322-325)。tex 本身也用两个字母分别命名（main.tex:285 的 $a$ 与 main.tex:323 的 $\epsilon$），我在新账的 $a,U$ 行与 $A,B,\epsilon$ 行把两格并列。

其二，$\gamma$。既存第 86 行与第 412 行写作 $(1-M/(1+t))^2$；既存第 662 行写作 $(1-M/U)^2$ 并标区间 $(0,1)$；既存第 291 行引的定理陈述口径是 $0\le\gamma<1$（main.tex:210）。tex 里 $U$ 就是 main.tex:285 定义的 $1+t$，故前两种写法同值；区间宽窄的差来自"定理许可集含 $0$"对"构造所得 $0<\gamma$"（由 $0<M/U$ 与 $M\le1\le U$ 在 main.tex:289 定）。

其三，Lean 规模。既存第 5 行与第 698 行口径是"70 个 `.lean` 文件、9273 行"；既存第 700 行给的七档分组近似（约 277、约 379、约 800、约 1100、约 900、约 2900，再加 214 与 120）合计约 6690 行。两处并列，我的实测见下节勘误。

其四，tex 行数。既存第 4 行口径"单文件 544 行"；既存第 66 行说"后面 460 行"。实测 main.tex 共 544 行，从 §1 起始 main.tex:47 到 §6 末 main.tex:475 是 429 行，含附录至 main.tex:541 是 495 行。第 66 行的 460 是我的粗略口径，未加定义，与 544 属两码事，此处并列记录。

### 17.1 核对记录与勘误

TeX 侧无改判。我把 §14 那张旧账的每一条 TeX 出处回 main.tex 逐行核了一遍（涉及 149、150、154、159、167-170、174、176、179-181、182、196、203-206、219、220-231、236-241、243、248-250、258-267、280-284、285、287-289、291、322-325、333-335、339-343、355、381-383、384-400、393、403-405、422-429、431-439、444-449、455、465-472、491-496、512、536-539），全部落在同一行，新账沿用不改。§3 到 §13 里的 `main:NNN` 我抽样核了六十多处，同样对得上，包括 main.tex:17 那条"`remark` 计数器定义了但全文未用"。

Lean 侧一处要更正。`E:\math\lean\OAI\Analysis\SphereIsometry\` 实测 67 个 `.lean` 文件（清单含 `Main.lean`），既存第 5 行与第 698 行写的"70 个 / 70 文件"应当读作 67；行数 9273 实测吻合（全部 `.lean` 的 `wc -l` 合计）。

分组行数与逐文件行数分属两档。既存第 700 行点名的单文件规模全部实测吻合：`ReturnMap.lean` 353、`ExtremalPropagation.lean` 251、`AlignedConfiguration.lean` 234、`ChordSecant.lean` 271、`PositiveScheduling.lean` 380、`RadialExtension.lean` 214、`Extension.lean` 120、`UltraSphere.lean` 180。七档小计则偏差明显，按该行列出的文件清单实测为：基座与记号 362（原记约 277）；支撑与径向 587（原约 379）；缺陷取到 1022（原约 800）；对齐 2131（原约 1100）；弦矛盾 787（原约 900，此处是高估）；不动点与凸几何 4002（原约 2900）；延拓收尾 334；另加 `AlignmentSet.lean` 44、`Main.lean` 4。合计 9273，与总数闭合。结论：那七档近似是写作时的粗算，凡我在新账里给规模都回目录实测，不再引用第 700 行的小计。

两处口径差记为不算错。既存第 652 行把 $t$ 的区间与取等式并入一行，与 main.tex:167-170 加 174 相容；既存第 662 行把 $\gamma$ 的取值域写成 $(0,1)$ 而定理陈述（main.tex:210）许可 $0\le\gamma<1$，这是许可集与构造所得的宽窄差，我在上面第二条已并列标出，原文不回改。

## 18 加深：Lemma A.3，紧凸自映射的不动点（lem:compactfixed）

选它的理由：§13 四个附录条目里只有它没有 `[推测]` 段，四段式的 (d) 那一栏在既存正文里是空的；而它是 thm:condensing（main.tex:209-215）唯一的紧情形出口，main.tex:540 那句 "Apply Lemma~\ref{lem:compactfixed}" 全压在这条上。§13.3 已有陈述、机制与 Lean 映射，下面补齐中间步并按四段式重挂。本节不引入新常数，只给 δ 预算的机制细节。

### 18.1 （a）tex 逐字与行号

陈述（main.tex:517-519）：

```latex
\begin{lemma}\label{lem:compactfixed}
Every continuous self-map $g$ of a nonempty compact convex subset $K$ of a normed space has a fixed point.
\end{lemma}
```

证明体逐字。main.tex:521："For $\delta>0$, choose a finite strict $\delta$-net $P_1,\ldots,P_N\in K$. For $x\in K$ set"。main.tex:523-525：

```latex
\lambda_i(x)=
\frac{\max\{\delta-\norm{P_i-g(x)},0\}}
 {\sum_j\max\{\delta-\norm{P_j-g(x)},0\}}.
```

main.tex:527："The denominator is positive, and these are continuous probability weights. Map the probability simplex to itself by sending coefficients $(a_i)$ to $(\lambda_i(\sum_j a_jP_j))$. By Lemma~\ref{lem:simplex} there is a fixed coefficient vector. Its convex combination $x\in K$ satisfies"。main.tex:529-530：

```latex
\norm{x-g(x)}
\le\sum_i\lambda_i(x)\norm{P_i-g(x)}<\delta,
```

main.tex:532："since a positive weight implies the corresponding distance is less than $\delta$. Letting $\delta\downarrow0$ and taking a convergent subsequence in $K$ gives a fixed point."。

### 18.2 （b）推导补到中间步

第一步，网的存在与"strict"的可得性。$K$ 紧故全有界：对 $\delta>0$ 存在有限覆盖 $K\subset\bigcup_i B(z_i,\delta)$。两处修正是论文跳过的。其一，把开球半径统一缩成某个 $\delta'<\delta$（取 $x\mapsto\min_i\lVert x-z_i\rVert$ 在紧集上的最大值，它 $<\delta$），得到严格版本；其二，网心换成 $K$ 内的点：每个 $z_i$ 取附近 $P_i\in K$ 使 $\lVert P_i-x\rVert<\delta$ 仍成立，靠的是 $K$ 非空且我只需距离估计。合起来才是 main.tex:521 那句 "finite strict $\delta$-net $P_1,\ldots,P_N\in K$" 的三个成分：有限、严格、网心在内。

第二步，分母为正。给定 $x\in K$，$g(x)\in K$（自映射）。严格网给某 $j$ 使 $\lVert P_j-g(x)\rVert<\delta$，于是分子第 $j$ 项 $\max\{\delta-\lVert P_j-g(x)\rVert,0\}=\delta-\lVert P_j-g(x)\rVert>0$，其余项非负，和式严格正。Lean 形态与此一一对应：`compactNetWeight P δ y i := max (δ - dist (P i) y) 0`（`CompactApproximation.lean:28-29`）、`compactNetTotal` 求和（:31-32）、`compactNetCoefficients` 归一（:34-35）、`compactNetWeight_pos`（:42-44）与 `compactNetTotal_pos`（:47-53）的前提都写成 `∃ i, dist (P i) y < δ`，那个 $y$ 就是这里的 $g(x)$。归一后 $\sum_i\lambda_i(x)=1$（`compactNetCoefficients_sum`，:62-67，用 `mul_inv_cancel₀` 消化分母非零）。

第三步，权重的连续性。$x\mapsto\lVert P_i-g(x)\rVert$ 连续（$g$ 连续加范数连续），$\max$ 连续，分母连续且恒正，商连续。所以 $\Phi:\Delta_N\to\Delta_N$，$a\mapsto(\lambda_i(\sum_ja_jP_j))$ 连续，这正是 A.2 要的输入格式。

第四步，$\Phi$ 确实落在 $\Delta_N$ 内且是自映射。输入 $a\in\Delta_N$，点 $x(a)=\sum_ja_jP_j$ 属于 $K$：$K$ 凸且组合有限，逐项归纳即可。于是 $\Phi(a)$ 是 $K$ 内某点的权重族，非负且和为 $1$，落在 $\Delta_N$。这里 $N=N(\delta)$ 是有限指标数，A.2 处理的单纯形维数是 $N-1$，与 $K$ 的维数无关，$K$ 可以无穷维。

第五步，固定系数给的估计，含论文省掉的塞入。取 A.2 给的固定系数向量 $a^*$，令 $x=\sum_ja_j^*P_j$。由固定性 $a_i^*=\lambda_i(x)$，故 $\sum_i\lambda_i(x)P_i=x$。关键中间步是用 $\sum_i\lambda_i(x)=1$ 把 $g(x)$ 塞进同一个凸组合：

$$x-g(x)=\sum_i\lambda_i(x)P_i-\Bigl(\sum_i\lambda_i(x)\Bigr)g(x)=\sum_i\lambda_i(x)\bigl(P_i-g(x)\bigr).$$

取范数并用三角不等式得 $\lVert x-g(x)\rVert\le\sum_i\lambda_i(x)\lVert P_i-g(x)\rVert$，这就是 main.tex:530 的左半。右半的严格号要按权拆和：$\lambda_i(x)>0$ 的那些 $i$ 满足 $\max\{\delta-\lVert P_i-g(x)\rVert,0\}>0$，即 $\lVert P_i-g(x)\rVert<\delta$；$\lambda_i(x)=0$ 的项对和没有贡献。于是

$$\sum_i\lambda_i(x)\lVert P_i-g(x)\rVert=\sum_{\lambda_i(x)>0}\lambda_i(x)\lVert P_i-g(x)\rVert<\sum_{\lambda_i(x)>0}\lambda_i(x)\,\delta=\delta,$$

最后一步的严格号来自至少存在一个正权（第二步）且每个正权项都严格小于 $\delta$。论文在 main.tex:532 用一句 "since a positive weight implies the corresponding distance is less than $\delta$" 承担了这个拆分，Lean 侧对应 `compactNet_sum_sub_lt`（:119）。

第六步，$\delta\downarrow0$ 的收尾（按论文口径）。取 $\delta_k=1/k$，得 $x_k\in K$ 与 $\lVert x_k-g(x_k)\rVert<1/k$。$K$ 紧故列紧，取收敛子列 $x_{k_l}\to x^*\in K$；$g$ 连续给 $g(x_{k_l})\to g(x^*)$，而 $\lVert x_{k_l}-g(x_{k_l})\rVert\to0$，两边夹出 $g(x^*)=x^*$。论文这里只写 "Letting $\delta\downarrow0$ and taking a convergent subsequence"，没写 $g$ 的连续性在哪一消费点落地，我按机制补上：它用在把 $g(x_{k_l})$ 的极限认成 $g(x^*)$。

第七步，Lean 换了收尾办法，且不碰完备。`CompactConvexFixedPoint.lean:22-35` 的 `exists_fixedPoint_of_isCompact_of_approximate` 不抽子列，改成直接处理位移函数 $x\mapsto\lVert x-g(x)\rVert$：它在 $K$ 上连续（:27，`(continuousOn_id.sub hg).norm`），紧集上取到最小元 $z$（:28，`hK.exists_isMinOn`）；若最小值 $>0$，把它当 $\delta$ 代入近似性（:33）就得到更小的位移，与最小性矛盾（:34），故 $\lVert z-g(z)\rVert=0$。文件头 docstring（:9-11）自述 "Finite-net approximate fixed points force the minimum of the continuous displacement function to be zero. Ambient completeness is not required."。组装在 `exists_fixedPoint_of_isCompact_convex`（:39-45），五条输入是 IsCompact、Nonempty、Convex、ContinuousOn、MapsTo。我判定这个最小元版本比论文的序列版本干净：省掉对角线，也不需要把 $g$ 的值列成 Cauchy。

第八步，胶水与接口。A.2 与主定理的映射形态不同：附录这条吃 subtype 自映射 $g:K\to K$，主线的 $g$ 定义在环境空间上。Lean 用 `extendSelfMap`（:49-51，$K$ 外取恒等）加 `continuousOn_extendSelfMap`（:71）拼出 `ContinuousOn`，出口是 `continuous_compactConvex_fixedPoint`（:78-85）。论文没有这一步，因为 main.tex:210 的 $g:C\to C$ 本来就写在环境空间上。往上一层，main.tex:540 调 A.3 时的 $K=\bigcap C_n$ 由 main.tex:488 的嵌套引理供非空紧凸，那里才消费完备性；所以 A.3 自身不吃 Banach，这条分工我在 §7 记过一句，文件级证据是上面 docstring 那句 "Ambient completeness is not required"。

### 18.3 （c）假设与常数的机械理由

nonempty。两处消费：网的构造需要 $K$ 内有点（第一步的网心修正），Lean 的 `exists_isMinOn` 需要集合非空（:28 传 `hne`）。空集情形整条陈述无意义。

compact。两处消费：有限 $\delta$-网存在（全有界），收尾处给收敛子列或最小元。若只给闭加有界，无穷维里闭有界不必然全有界，第一步就没有输入；即便近似网勉强有，第六步的子列也没有。Schauder 需要紧因子的位置正在这里。

convex。两处消费：$x(a)=\sum_ja_jP_j\in K$（第四步，否则 $g(x(a))$ 无定义、$\Phi$ 不成自映射），以及第五步把 $g(x)$ 塞进凸组合时仍在 $K$ 内取值。$K$ 不凸时断点是 main.tex:527 的 "Map the probability simplex to itself"。

continuous。两处消费：$\lambda_i$ 的连续（第三步，$\Phi$ 才满足 A.2 前提），收尾的极限识别（第六步）。Lean 拆成 `ContinuousOn g K`（:24）与位移函数连续（:27）两条，比我按论文口径读出的两处消费更分明。

strict（严格网）。承重词，不是修饰。若只给 $\lVert P_i-g(x)\rVert\le\delta$，可能出现所有 $i$ 都取等，此时每个分子 $\max\{\delta-\lVert P_i-g(x)\rVert,0\}=0$，分母为零，$\lambda_i$ 无定义；第五步的严格号也退成 $\le\delta$。Lean 在 :43、:48、:57、:63 四处重复要求 `∃ i, dist (P i) y < δ`，与这个词严格对应。

网心属于 $K$。一般全有界的定义允许网心在环境空间里；此处必须要求 $P_i\in K$，因为 $x=\sum a_jP_j$ 要留在 $K$ 内供 $g$ 取值。论文用 "$P_1,\ldots,P_N\in K$" 七个字符把这条件写死（main.tex:521）。

$\max\{\cdot,0\}$ 截断与整体归一。截断把"谁离 $g(x)$ 近谁得权"做成连续函数，避免负距离产生权，也避免在距离为零处出现奇性；分母求和给 $\sum\lambda_i=1$，第五步塞 $g(x)$ 恰靠这个 $1$。去掉归一则右端要再乘分母，正权推距离的论证也失。

$N$ 与 $\delta$ 的依赖。$N=N(\delta)$ 随 $\delta$ 缩小可任意增大，A.2 对单纯形维数没有任何预算（维数 $N-1$ 有限即够用），因此整条证明对 $K$ 的维数零假设。这就是它能在无穷维闭凸紧集上用的全部理由，也是它比直接搬有限维多线性工具更省的地方。

$\delta$ 只给存在性，不给速率。第六步取 $\delta_k=1/k$ 是任意的：任何趋零的正列都行，指数 $1/k$ 无实质内容，Lean 的最小元版本干脆不列 $\delta_k$，只用一次代入。这条预算在台账里对应 "$\delta$（中点缺陷）" 与 "覆盖直径 $\delta$" 之外的第三种同名量，见 §17 链二。

### 18.4 （d）候选失败路线

[推测] 把 A.3 换成直接引 Mathlib 的 Schauder 定理。机制上可行，但本文形式化把 Sperner 到 A.2 到 A.3 整条自建（§13.2 我猜的原因是解模块自足），外部定理会新增未登记的依赖面；若真要换，塌点不在数学而在 Lean 侧的依赖登记与比较器口径。

[推测] 用平滑单位分解替 $\max$ 截断，例如权取 $\exp(-\lVert P_i-g(x)\rVert/\delta)$ 再归一。连续性与正性都变好，但第五步的"正权推距离小于 $\delta$"消失：所有指标都得正权，远网心的小正权项在加权和里带着不受 $\delta$ 控制的距离，末估多出的尾巴在 $\delta\downarrow0$ 时是否仍趋零我没有账。失败点判定在 main.tex:530 那个 $<\delta$。

[推测] 跳过近似网，直接对 $g$ 迭代用 Kuratowski 测度收 A.3。那是 thm:condensing 自身的机器，而 thm:condensing 的证明（main.tex:535-541）要以 A.3 为出口；在附录里用 A.3 之前，$K=\bigcap C_n$ 的紧性已经建好，再拿 $\chi$ 回证 A.3 会把待证定理当输入。这条我判定必坏，坏的是一阶循环，并非估计。

[推测] 只假 $K$ 紧不假凸，把 $g$ 先从 $K$ 延到 $\operatorname{conv} K$。延拓需要 Tietze 型（值域得是绝对收缩外像）或 Dugundji 型装置，而 $g$ 只连续不见得满足任何 Lipschitz 条件，代价高于重证一遍。这条的第一个断点与 convex 那栏同一个位置：main.tex:527 的自映射性。


