# D122 迹投影方法与一致性质 $\Gamma$：从有限分拆到非单侧吸收的反推笔记

取证范围限定在 `preprints/Tracial-projection-methods-and-uniform-property-Gamma-September-23-2026/build/` 下的 `main.tex` 与 `sections/` 编号分片，以及 Lean 侧 `lean/OAI/Analysis/TracialSplitting/` 的代表文件与 `lean/ComparatorChallenges/UniformGamma.json`、`lean/formalization.yaml:1622-1624`。下面所有引文都按 `文件名:行号` 落地，行号取自 build 目录里的分片本身。

## 1. 起手时我手里只有半个问题

我把 Schafhauser--Tikuisis--White 的 Problem XXI 读成一句话：如果 uniform tracial completion 的 ultrapower 有 real rank zero，那么 $A$ 就有一致性质 $\Gamma$。我当时的猜测很朴素，real rank zero 给你谱投影，谱投影给你分拆，trace 空间紧，所以一致化大概是一步 compactness 论证。这个猜测在我写下第一行计算之后就崩了。

论文把目标写成这样（`01_introduction.tex:62-67`）：

> If $B^\omega$ has real rank zero in its quotient $C^*$-norm, then there is
> a projection $p\in B^\omega\cap B'$ such that
> \[
>  \lambda(px)=\tfrac12\lambda(x)
>  \qquad(x\in B,\ \lambda\in\Lambda_\omega).
> \]

卡点全在 $x$ 上。标量迹对半分是 $\lambda(p)=\tfrac12\lambda(1)$，那个是 rank zero 直接可及的对象；带上系数以后 $\lambda(px)$ 是一个双线性泛函，投影 $p$ 必须同时对整条系数族成立。作者自己把这句话挑明了（`01_introduction.tex:84-85`）：

> The coefficient $a$ is essential: equality
> of scalar traces of the $p_i$ alone does not give uniform property $\Gamma$.

我的初始猜想里第二个误判是"一个 $p$ 就够"。Definition~16 的 halving 形式与 standard 的 all-$m$ 形式靠 `\cite[Propositions~5.7, 5.20 and 5.23]{CCEGSTW}` 对接（`01_introduction.tex:81-83`），这一步是外部接口，不是我要证的东西；但 $B$ 的常数拷贝在 $B^\omega$ 里是否忠实、$\Lambda_\omega$ 之外那些抽象 trace 会不会跑进来捣乱，这两件事必须自己交代。`02_rr_preliminaries.tex:76-82` 给了 faithful 的论证，`02_rr_preliminaries.tex:61-62` 明确"没有额外的抽象 trace 进入这套记号"，这是我读完全稿才意识到的、必须写进定义的防线。

## 2. 第一条走错的路线：在 $A^\omega$ 里直接切谱

我最初试图在 $D=A^\omega$ 里对某个自伴元做谱截断，希冀截出来的投影已经几乎中心。失败原因很具体：rank zero 是对 $D$ 里的元素说的，谱截断 $1_{(\alpha,\infty)}(a)$ 与系数代数 $A$ 的中心化毫无关系；把 $\alpha$ 变动只能让我得到一族投影，它们的 trace 值连续变化，但它们的交换子范数不会因此变小。论文从头到尾没有走这条路，它在 $D=B^\omega$ 里做的第一件事是核平均（`04_rr_weighted.tex`），也就是先造一个几乎中心的正压缩 $\Phi(q)$，再谱离散化它。这个顺序和我的猜测正好相反：先中心化，后谱截断。

第二条相关误判：我以为既然 hypothesis 里 $B^\omega$ 有 rank zero，那 $B^\omega$ 里每个投影角都有 rank zero，可以随便切。这半句是对的（`03_rr_projections.tex:12` 的 `Every projection corner $rDr$ has real rank zero.`），但我用它的方式错了：角内 rank zero 只保证能把有限个测试压成近似标量（`03_rr_projections.tex:16-19`），它完全不保证这些块之间正交或可移动。真正需要"移动"的工具是 orthogonal insertion（`03_rr_projections.tex:326-340`），那里 rank zero 只用来切一个 $1/8$ 近的自伴近似。

## 3. 第二条走错的路线：把"块数"当成本

在 packing 阶段我一度写下 $\sum_j w_j\le C$ 这种伪界，认为加权块族的权重总和可以被吸收常数控制。这是错的，Proposition~\ref{r:weighted:family} 明确允许 $q_j$ 重复、$p_j$ 不正交、族可以为空（`04_rr_weighted.tex:129-131`），块数随压缩精度发散。作者在第 5 节末尾专门把这条纪律写出来（`05_rr_packing.tex:288-290`）：

> All sums in this argument are controlled by weighted projection masses
> or energies. No bound on the raw sum $\sum_jw_j$, or on the number of
> blocks, has been used.

于是记账单位换成了两类量：总加权质量 $\sum_j w_j\tau(p_j)$ 与总加权能量 $\sum_j w_j\lVert[x,p_j]\rVert_{2,\tau}^2$。我在第 3 节里对 energy 的处理方式也错过一次：想用 $\lVert[x,\sum p_j]\rVert$ 去控制，这会把交叉项引进来；正确方向是反向的，正交和的能量被分项和支配（`05_rr_packing.tex:77-85`），交叉项在正交情形只增不减地消失。

## 4. 02 节地基：三个看似无关的约定其实各挡一个坑

(a) 原文（`02_rr_preliminaries.tex:35-44`）：

> Every contraction in a unital $C^*$-algebra is a linear combination of four
> unitaries whose coefficient absolute values sum to at most two. Indeed,
> write $a=h+ik$, where $h,k$ are self-adjoint contractions, and use
> \[
>  h=\frac{u_h+u_h^*}{2},\qquad
>  u_h=h+i(1-h^2)^{1/2},
> \]

(b) 中间步骤：$h$ 自伴压缩给出 $u_h$ 酉，$h=(u_h+u_h^*)/2$，系数绝对值和 $\tfrac12+\tfrac12=1$；对 $k$ 再做一次，总共四项、系数和为 $2$。$h\pm i(1-h^2)^{1/2}$ 的酉性来自 $h^2+(1-h^2)=1$ 与交换性。

(c) 机械理由：这个约定在 `05_rr_packing.tex:129-131` 被真正消费，backward 构造 $K_{i-1}$ 时要把 $\Phi_i$ 的系数压缩 $v_l$ 拆成 unitary 组合并纳入下一层测试；"系数绝对值和至多 $2$"这个 $2$ 一路传到 `05_rr_packing.tex:157` 的 $\le 4E_{i-1}$（那里是 $2^2$ 的来源）。半径 $R>0$ 出现在 `02_rr_preliminaries.tex:38-42` 的 ball 约定里，配合 `07_unital_preliminaries.tex:244-255` 的 clipping lift。

(d) 失败路线（推测）：其一，直接对一般 contraction 做测试而不化归到 unitary，那么 $\Phi$ 的中心化估计只有对 $K\subset\U(A)$ 才成立，backward 链条会在第二环断掉。其二，试图用两酉线性组合替代四酉（把 $a$ 写成 $\tfrac12(u_1+u_2)$）会失败，因为不是每个 contraction 都是酉的平均。其三，若把系数和放宽为不控常数，则第 5 节的 $E_i$ 递推会失去闭合性。

(a) 原文（`02_rr_preliminaries.tex:84-90`）定义了本笔记全程使用的 $\Gamma$：

> We say that $B$ has property $\Gamma$, or equivalently that $A$
> has \emph{uniform property $\Gamma$}, if there is a projection
> $p\in B^\omega\cap B'$ such that
> \begin{equation}\label{r:eq:gamma-definition}
>  \lambda(px)=\tfrac12\lambda(x)
>  \quad(x\in B,\ \lambda\in\Lambda_\omega).
> \end{equation}

(b) 中间步骤：$p\in B^\omega\cap B'$ 与 $\lambda(px)=\tfrac12\lambda(x)$ 是两个独立结论，前者来自对中心子的检测（`06_rr_completion.tex:100-102`），后者是恒等式；$\Lambda_\omega$ 的闭凸包扩张由仿射弱星连续性完成（`02_rr_preliminaries.tex:93-97`）。

(c) 假设理由：$B^\omega$ 的商范数与指定 2-范数在同一条链上，`02_rr_preliminaries.tex:96-97` 说"the supremum tracial 2-norm is unchanged"，这是为什么 convex hull 的扩张不引入新误差。

(d) 失败路线（推测）：若把 $\Lambda_\omega$ 换成 $T(B^\omega)$ 全体抽象 trace，则第 5 节给出的测试族与最终 identity 不一致，且 `05_rr_packing.tex:153` 的 $\tau\in\T(D)$ 全体一致性会变成不可控；`main.tex:123-135` 的推论实际上是在假设成立之后才反证 $T(B)$ 就是指定扩张。

(a) 原文（`02_rr_preliminaries.tex:41-45`）：

> Let \(C\) be the \(C^*\)-algebra of operator-norm-bounded sequences in \(A\)
> which are Cauchy for this norm, and let \(J\) consist of those sequences
> whose uniform tracial 2-norm tends to zero.

(c) 为什么同时要求算子范数有界：`06_rr_completion.tex:49` 要把 $D$ 中的投影提升为 $B$ 中逐坐标正压缩序列，没有界性则 $\ell^\infty$ 商不成立；`02_rr_preliminaries.tex:69` 那句 "Here and below the sequences in \(I_\omega\) are operator-norm bounded" 是同一个防线的重复。

(d) 失败路线（推测）：不加范数有界而只用 uniform 2-Cauchy 序列的等价类，$B^\omega$ 不再是 $C^*$-代数，rank zero 假设失去意义；用 $A$ 的 norm ultrapower 替代 $B^\omega$ 会让 constant copy of $B$ 不忠实。

## 5. 03 节前半：thin-full 元素是全场唯一"只用简单性"的杠杆

(a) 原文（`03_rr_projections.tex:54-62`）：

> \begin{lemma}[Full positive elements with small tracial support]
> \label{u:lem:thin-full}
> Let $A$ be simple, unital and infinite dimensional, with
> $T(A)\ne\varnothing$.  For every $\delta>0$ there is a full positive element
> $e\in A$ with $\norm e=1$ such that
> \[
>  \tau(\supp(e))<\delta\qquad(\tau\in T(A)).
> \]

(b) 中间步骤（论文在 `03_rr_projections.tex:65-111` 给全了，我把骨架抄给自己）：先证任意大的正交正元族存在，$E\cong C(X)$ 且 $X$ 无限；再由 $cAd\ne 0$ 得到 $z=cyd$，用极分解把 $\supp(z^*z)$ 与 $\supp(zz^*)$ 的 trace 拉平；迭代 $k$ 次得到 $\tau(\supp(e))\le 1/k$。

(c) 关键处：`03_rr_projections.tex:98-99` 强调 "The elements $y,z$ are chosen independently of $\tau$"。这一步是"一致"性质唯一的免费来源，整个构造里没有任何地方对 trace 取 supremum 后再选元素；如果我按 trace 逐点选取 witness，一致性立刻丢。另一个机械点是 `03_rr_projections.tex:85-88`：$cAd=0$ 推出 $c=0$ 靠的是 $d$ 生成的理想是全体。

(d) 失败路线（推测）：其一，试图用 $A$ 里的 projection 代替 positive element，这在投影稀少的简单代数里根本不存在；论文正是把这条正元版本同时供给 `08_unital_ranks.tex:20-25` 的 rank approximation 用。其二，MASS 换成 $\supp$ 的连续演算近似（$(e-1/n)_+$ 之类）会让 trace 等式变成不等式，最后 $1/k$ 的除法式 `03_rr_projections.tex:106-109` 就闭合不了。其三，若 $A$ 有有限维表示，$\tau(\supp(e))<\delta$ 与 faithful 性冲突；`main.tex:57` 与 `01_introduction.tex:96-97` 的排除条件就是为这类反例留的。

(a) 原文（`03_rr_projections.tex:136-141`）：

> Choose a finite-spectrum self-adjoint $a\in D$ with
> $\norm{a-b}<1/8$, and set $g=1_{[1/2,\infty)}(a)$.  Then
> $gbg\ge(3/8)g$, so restriction of any $\tau\in\T(D)$ to $A$ gives
> \begin{equation}\label{r:proj:small-projection-bound}
>   \tau(g)\le\frac83\tau(b)\le\frac{8}{3n}.
> \end{equation}

(b) 中间步骤：$\lVert a-b\rVert<1/8$ 且 $g$ 谱在 $[1/2,\infty)$ 上，故 $a\ge \tfrac12$ 于 $g$ 角内、$b> \tfrac12-\tfrac18=\tfrac38$ 于该角；$\tau(g)\cdot\tfrac38\le\tau(gbg)\le\tau(b)$。fullness 的论证用商范数（`03_rr_projections.tex:142-149`）：$\lVert\pi(a)\rVert\le 1/2$ 与 $\lVert\pi(b)\rVert\le 5/8$，而 $\pi|_A$ 等距 contradict $\lVert b\rVert=1$。

(c) 常数理由：$1/8$ 与 $1/2$ 的间距决定 $3/8$ 与 $5/8$；$\tfrac83$ 是它的倒数。同一个 $1/8$/$3/8$ 模板在 `03_rr_projections.tex:170-177`（column splitting）与 `03_rr_projections.tex:343-353`（insertion，$\tfrac83$ 与 $\tfrac58$）反复复用，说明这是一个刻意固定的"谱切割余量"，不是巧合。$n$ 与 $\delta$ 的关系是 $8/(3n)<\delta$，即 $n>8/(3\delta)$，这是我第一次推导时漏掉的 $8/3$ 放大。

(d) 失败路线（推测）：若 $D$ 不是 rank zero 而只有 $A$ 是，就无法把 $b$ 切成真投影；若允许 $\lVert b\rVert$ 不标准化，$\lVert\pi(b)\rVert\le 5/8$ 与 $\lVert b\rVert=1$ 的矛盾不成立，fullness 论证崩。

## 6. 03 节后半：Zhang 式有序分拆与那个求和分部

(a) 原文（`03_rr_projections.tex:227-233`）：

> We next replace this family by one, say $s_1,\ldots,s_m$, satisfying
> \begin{equation}\label{r:proj:ordered-partition}
>   s_1\precsim s_2\precsim\cdots\precsim s_m\precsim g.
> \end{equation}
> This ordering makes the trace weights increase in the same order for
> every trace, so that one choice of rounding coefficients will work
> simultaneously for all of them.

(b) 中间步骤：相邻操作把 $x,y$（都 subordinate 到共同上界 $h$）换成 $k,\,x+l$，其中 $\xi=w^*\alpha+l$ 给出 $\xi^*\xi=y,\ \xi\xi^*\le x+l$，$\zeta=w+\beta$ 给出 $\zeta^*\zeta=x+l,\ \zeta\zeta^*\le h$（`03_rr_projections.tex:248-254`）。交叉项消失的理由是 $x\perp l$ 与 $x'\perp(h-x')$。左起一趟使最后那块支配之前所有块，冻结它、缩短列表、递归。

(c) 舍入常数的机械理由：$c_i=\lfloor si\rfloor-\lfloor s(i-1)\rfloor\in\{0,1\}$ 与求和分部（`03_rr_projections.tex:271-286`）给出
$\lvert\tau(e)-s\tau(f)\rvert\le t_m\le\tau(g)$。这里 $-1\le D_j\le0$ 与 $t_1\le\cdots\le t_m$ 同号是关键：一旦失去单调性，两项不能同向抵消，界就会是 $m$ 倍。误差随维度增长率：这里完全无增长，$m$ 不出现在最终界里，这正是"one choice of rounding works for all traces"的含义。

(d) 失败路线（推测）：其一，直接按 $s\tau(s_i)$ 逐个 floor 舍入（即 $c_i$ 依 trace 而变）会得到依赖 $\tau$ 的投影，一致性作废。其二，若不排序而只用任意正交分拆，误差界退化为 $\lVert\cdot\rVert$ 意义下的 $m\cdot\sup$ 项，`03_rr_projections.tex:283-285` 的两端符号论证失效。其三，用连续函数 $(si-\lfloor si\rfloor)$ 之外的高阶差分去舍入需要额外可加性，$C^*$-代数里没有。

(a) 原文（`03_rr_projections.tex:326-339`，orthogonal insertion）：

> \begin{lemma}[Orthogonal insertion]\label{r:proj:move}
> For projections $z,y\in D$, there is a projection $t\le1-z$ such that
> \begin{align}
>   \tau(y)-3\tau(yz)&\le\tau(t)\le\tau(y),
>        \label{r:proj:move-mass}\\
>   \normtwo{t-y}{\tau}^{2}&\le5\tau(yz)
>        \label{r:proj:move-distance}
> \end{align}

(b) 中间步骤：$f=1_{(-\infty,1/2)}(a)$ 近似 $y-yzy$ 的支集，$d=y-f$ 满足 $d(yzy)d\ge\tfrac38 d$，从而 $\tau(y-f)\le\tfrac83\tau(yz)$ 且 $A_f=f(1-z)f\ge\tfrac38 f$；$v=(1-z)fA_f^{-1/2}$ 是部分等距，$t=vv^*$。距离界 $\lVert t-y\rVert_{2,\tau}^2\le(\tfrac83+2)\tau(yz)\le 5\tau(yz)$。线性测试界靠分解 $t-y=t(t-y)-(1-t)y$，两边支撑分别 $\le t$ 与 $\le y$，得 $\lVert t-y\rVert_{1,\tau}\le(\sqrt{\tau(t)}+\sqrt{\tau(y)})\lVert t-y\rVert_{2,\tau}\le 2\sqrt{\tau(y)}\lVert t-y\rVert_{2,\tau}$。

(c) 常数理由：质量损失系数 $3$ 与距离系数 $5$ 都来自同一个 $1/8$ 谱余量（$\tfrac83$ 与 $\tfrac83+2$）。`05_rr_packing.tex:210-213` 逐字复用这两个常数，`05_rr_packing.tex:313-319` 的 Cauchy--Schwarz 求和里那个 $5$ 直接进到 $\sqrt{15HE_N}$（$5\times 3$ 来自 $Y_i$ 的 $3\eta$ 上界与 $L_i$ 累加到 $E_N$）。

(d) 失败路线（推测）：其一，试图要求 $t$ 与 $y$ Murray--von Neumann 等价（trace 严格相等），一般不可能，$1-z$ 的 trace 未必够。其二，若把 $y$ 换成一般正元，极分解与 $A_f^{-1/2}$ 的可逆性需要谱间隙，正元没有。其三，用 $\lVert t-y\rVert$ 的算子范数界替代 2-范数界，会在 `05_rr_packing.tex:313-319` 处丢掉 $\sqrt{\tau(y_a)}$ 权重，误差变成与块数成正比。

## 7. 04 节：先定平均映射，后给输入投影

(a) 原文（`04_rr_weighted.tex:39-43`）：

> Haagerup's virtual diagonal theorem
> \cite[Theorem~3.1]{Haa83} gives a virtual diagonal $M\in E^{**}$ in
> the weak-star closed convex hull of
> $\{v\otimes v^*:v\in A,\ \norm v\leq1\}$.

(b) 中间步骤：把 $T:E\to E^K\oplus A$ 取二伴随，$T(M)=(0,\dots,0,1)$；弱星闭凸包映射到弱闭凸包，再由 Hahn--Banach 得弱闭包等于范数闭包，于是有限凸组合 $\sum_l\lambda_l v_l\otimes v_l^*$ 同时满足 `04_rr_weighted.tex:56-57` 的两条近似。质量损失 $c=1-\sum_l\lambda_l v_l^*v_l$ 满足 $0\le\tau(c)<\mu$，而 $\tau(q)-\tau(\Phi(q))=\tau(qc)$。中心化估计用映射 $a\otimes b\mapsto aqb$ 的范数不超过 $\tau(q)$。

(c) 指数理由：$\mu=\eta^2$（`04_rr_weighted.tex:115`）。为什么是平方：$\Phi$ 的质量误差以 $\mu$ 线性出现，而能量界 `04_rr_weighted.tex:263` 是 $\lVert b_q-xb_qx^*\rVert_{1,\tau}\le 3\mu\tau(q)$，经过 Lemma~\ref{r:weighted:square-root} 开方以后成为 $\sqrt{\mu}\sim\eta$ 的一次项，这正是 `04_rr_weighted.tex:140-141` 里那条 $\tfrac{2\beta}{\sigma}+\tfrac{(2+\sqrt2)\beta}{\sigma^2}<\eta$ 的匹配要求。

(d) 失败路线（推测）：其一，用 Kasparov 型平凡化或近似单位代替 virtual diagonal，会丢"系数在 $A$ 内"这一条，而 `05_rr_packing.tex:129-131` 要求 $v_l\in A$ 才能把它们的 unitary 分解放进 $K_{i-1}$。其二，直接取 $\Phi=\mathrm{id}$ 让质量误差为零，但中心化完全失败。其三，若把 $M$ 取成无穷凸组合，`04_rr_weighted.tex:56` 的有限 $m$ 就消失，而 `04_rr_weighted.tex:139` 的 $m(\sigma+2\beta)<\mu$ 无法选参数。

(a) 原文（`04_rr_weighted.tex:84-89`）：

> \begin{lemma}[A square-root trace estimate]\label{r:weighted:square-root}
> For positive \(b,c\in D\) and \(\tau\in\T(D)\),
> \[
>  \normtwo{\sqrt b-\sqrt c}{\tau}^2
>  \leq\normone{b-c}{\tau}.
> \]

(b) 中间步骤：$b-c=\sqrt b\,d+d\sqrt c$，traciality 给 $\tau(\sgn(d)(b-c))=\tau((\sqrt b+\sqrt c)\lvert d\rvert)$；用 $\sqrt b+\sqrt c\ge\pm d$ 分别对 $d_+,d_-$ 取下界得 $\tau(d^2)$。

(c) 理由：这是 Powers--St\o rmer 不等式的 tracial $C^*$-版本，论文在 `04_rr_weighted.tex:78-82` 说明为什么要自证：原文只覆盖 Hilbert 空间算子上的通常迹，而这里 $D$ 上的 $\tau$ 未必是因子迹。

(d) 失败路线（推测）：用算子范数版 $\lVert\sqrt b-\sqrt c\rVert\le\lVert b-c\rVert^{1/2}$ 会在能量累加时丢掉 trace 权重；用非交换 $L^p$ 插值需要额外有界性假设。

(a) 原文（`04_rr_weighted.tex:138-142`）：

> \begin{equation}\label{r:eq:block-parameters}
>  \beta<\sigma/2,\qquad m(\sigma+2\beta)<\mu,\qquad
>  \frac{2\beta}{\sigma}
>        +\frac{(2+\sqrt2)\beta}{\sigma^2}<\eta.
> \end{equation}
> This is possible by choosing \(\sigma\) with \(m\sigma<\mu\) first.

(b) 中间步骤：$G\simeq$ 标量 Gram 矩阵，保留特征值 $\ge\sigma$ 的列成 $W$，删去列满足 $\lVert W_-^*W_-\rVert\le\sigma+\beta$，故 $\tau(W_-W_-^*)\le m(\sigma+\beta)\tau(q)$；$X=W^*W\ge(\sigma/2)(1_k\otimes q)$ 保证 $X^{-1/2}$ 存在，`04_rr_weighted.tex:201-208` 的 resolvent 公式给出 $\lVert X^{-1/2}-Y^{-1/2}\rVert\le\lVert X-Y\rVert/(2a^{3/2})$，$a=\sigma/2$，于是 $\beta$ 项被 $1/\sigma$ 与 $1/\sigma^2$ 放大，形成 $\tfrac{(2+\sqrt2)\beta}{\sigma^2}$。

(c) 增长率理由：$m$ 是 virtual diagonal 的项数，它进入 $m(\sigma+2\beta)<\mu$，所以 $\sigma$ 必须取 $\sim\mu/m$，而压缩容差取 $\beta/(2m)$（`04_rr_weighted.tex:151`），因为 $m\times m$ 矩阵元素范数 $\le c$ 时矩阵范数 $\le mc$（`04_rr_weighted.tex:166-168`）。这是全节唯一显形的"$m$ 依赖"；$k_j$（块尺寸）与块数都不进入最终界，靠的是 `04_rr_weighted.tex:229-233` 的 layer-cake 分解 $\sum_j w_jp_j$ 与 `04_rr_weighted.tex:238` 的对 partition 求和。

(d) 失败路线（推测）：其一，不设 eigenvalue 阈值 $\sigma$ 而直接极化分解 $V$，$X^{-1/2}$ 无界，压缩估计随块尺寸发散。其二，把 layer-cake 换成单一谱截断，则质量误差变成 $O(1)$ ，并非 $\le\mu\tau(q)$。其三，若试图让 $q_j$ 互不相同来省掉重复，压缩细化过程（`03_rr_projections.tex:41-44`）本来就不保证跨角唯一，硬推会让 $h_a$ 测试量失控。

## 8. 关键转折：小比例采样不需要中心

第一个让我改变整个想法的段落是 `01_introduction.tex:284-286`：

> A small proportion of a base projection can be
> sampled inside each block without making that subprojection central:
> scalar matrix compressions retain the coefficient traces and squared
> commutators.

我之前一直想"让 $e\le q_j$ 几乎中心"。真相是：$e$ 可以极不中心，只要 $U_j^*xU_j$ 是近似标量矩阵，$y=U_j(1_{k_j}\otimes e)U_j^*$ 的系数 trace 与能量就只通过标量 $\alpha=\Tr(T_0)/k$、$\beta_0=\Tr(T_0^*T_0)/k$ 依赖于 $e$，剩下的误差全部由 $\eta$ 与 mass discrepancy $\delta_\tau$ 支付（`05_rr_packing.tex:19-27`）。这是本节后面所有估计能不看块数的根本原因。

## 9. 05 节：采样引理与两轮之间的能量递推

(a) 原文（`05_rr_packing.tex:18-27`）：

> Then, for \(0\leq c\leq1\), every \(\tau\in\T(D)\), and
> \(\delta_\tau=|\tau(y)-c\tau(p)|\),
> \begin{align}
> |\tau(yx)-c\tau(px)|
> &\leq\eta\big(\tau(y)+c\tau(p)\big)+2\delta_\tau,
> \label{r:eq:sampling-linear}\\
> \left|\normtwo{[x,y]}{\tau}^2
>        -c\normtwo{[x,p]}{\tau}^2\right|
> &\leq6\eta\big(\tau(y)+c\tau(p)\big)+10\delta_\tau.
> \label{r:eq:sampling-energy}
> \end{align}

(b) 中间步骤：取 $T_0\in M_k(\C)$ 使 $\lVert T-T_0\otimes q\rVert<\eta$；由 $T$ 是压缩得 $\lVert T_0\rVert\le 2$（`05_rr_packing.tex:31-33`）。用 $\tau(yx)=(\Tr\otimes\tau)(P_eTP_e)$ 把迹搬到矩阵 corner 里，$T_0\otimes q$ 与 $P_e=1_k\otimes e$ 交换，所以把 $P_eTP_e$ 换成 $T_0\otimes e$ 只付 $\eta\tau(y)$（一次迹）与 $3\eta\tau(y)$（平方迹，靠 $\lVert R^*R-S^*S\rVert\le(\lVert R\rVert+\lVert S\rVert)\lVert R-S\rVert$ 与 $\lVert R\rVert,\lVert S\rVert\le 2$）。标量参照量 $\alpha=\Tr(T_0)/k$、$\beta_0=\Tr(T_0^*T_0)/k$ 满足 $\lvert\alpha\rvert\le2$、$0\le\beta_0\le4$。能量式来自逐字展开的恒等式（`05_rr_packing.tex:64-68`）

> \normtwo{[x,f]}{\tau}^2
> =2\tau(f)-2\tau(|fxf|^2)

系数 $10$ 的来源在 `05_rr_packing.tex:71-72`：mass discrepancy 的系数是 $2+2\beta_0\le 10$；$6\eta$ 则是 $\eta$ 乘以 $(1+2\beta_0)\le 1+\!8$ 再被压成 $6$ 与 $\eta$ 的一次项组合（原文把 $\eta(\tau(y)+c\tau(p))$ 与平方项合并后写成 $6\eta$，我核对到的是"一次项 $\eta$ 系数 1，平方项 $\eta$ 系数 3，两者对 $y$ 与 $p$ 各一份"）。

(c) 为什么必须同时留 $\delta_\tau$：$e$ 的 trace 不可能恰好等于 $c\tau(q)$，Corollary~\ref{r:proj:tests} 给的是带误差的选择；$\delta_\tau$ 项把这部分误差线性传下去，而 $\eta$ 项传的是中心化误差。误差随维度增长率：$k_j$（块尺寸）在两条界里都不出现，只通过 $\Tr(P_e)=k_j\tau(e)=\tau(y)$ 被吸收进质量。

(d) 失败路线（推测）：其一，把 $y$ 直接取成 $q_j$ 的子投影而不放进矩阵 block，$\alpha,\beta_0$ 就不存在，中心化误差无法用 $\eta$ 表示。其二，试图用 $\lVert[x,y]\rVert$ 的算子范数版本，$P_eTP_e$ 与 $T_0\otimes e$ 的差在算子范数下仍然只由 $\eta$ 控制，但 $\tau(y)$ 权重换成 1，`05_rr_packing.tex:262-266` 的加权求和立刻发散。其三，若允许 $c$ 依赖 $\tau$，(a) 中的 $c\tau(p)$ 项就不是标量倍，正负抵消失败。

(a) 原文（`05_rr_packing.tex:139-141`）：

> \begin{equation}\label{r:eq:energy-recurrence}
>  E_0=0,\qquad E_i-E_{i-1}=1000\eta(E_{i-1}+\eta).
> \end{equation}

(b) 中间步骤：第 $i$ 轮的老块重叠 $\tau(Z_{i-1}\Phi_i(r))=\sum_l\lambda_l\lVert Z_{i-1}v_lr\rVert_{2,\tau}^2\le 4E_{i-1}$（`05_rr_packing.tex:154-158`，系数 $4=(2)^2$ 来自 $\lVert[Z_{i-1},v_l]\rVert\le 2\sqrt{E_{i-1}}$ 与 $\lVert v_l\rVert$ 拆分系数和 2 的两倍）。轮内目标质量 $\eta\tau(r)-2\eta^3\le C_i\le\eta(1+\eta^2)\le 2\eta$，采样质量 `05_rr_packing.tex:232-234` 给出 $\eta\tau(r)-3\eta^2\le Y_i\le 3\eta$。重叠的四行链 `05_rr_packing.tex:238-243` 得到 $L_i\le 4\eta E_{i-1}+5\eta^2$，因而 $L_i\le E_i-E_{i-1}$（`05_rr_packing.tex:250-252`）。插入后的能量 `05_rr_packing.tex:272-278`：$\le 120\eta^2+40L_i\le 160\eta E_{i-1}+320\eta^2\le E_i-E_{i-1}$。

(c) 常数 1000 的机械理由：闭合需要同时容纳两对系数，重叠界 $4\eta E_{i-1}+5\eta^2$ 与插入界 $160\eta E_{i-1}+320\eta^2$，于是任何 $\ge 320$ 的乘数都够用；取 $1000$ 留下约三倍余量，使得"每一步不必重新核对哪个界先饱和"。$160=2\times 60+40\times 4$ 来自 $\lVert[x,t_a]\rVert\le\lVert[x,y_a]\rVert+\lVert t_a-y_a\rVert$ 的平方展开系数 $2$ 与 $5\tau(z_ay_a)$ 的 $8$ 倍；$120=2\cdot 60$、$40\cdot L_i$ 中 $40=8\cdot 5$。轮线性误差 $7\eta^2$ 来自 $\eta(Y_i+C_i)+2\eta^2\le\eta(3\eta+2\eta)+2\eta^2=5\eta^2+2\eta^2$。

(d) 失败路线（推测）：其一，把 $E_i$ 定义成累加，并非递推闭合量，则 $L_i\le E_i-E_{i-1}$ 这一可求和结构不见，`05_rr_packing.tex:298` 的 $3N\eta^2$ 会变成 $3N^2\eta$。其二，让 $1000$ 降为 $321$，插式闭合勉强，但 `05_rr_packing.tex:300` 的余项式需要 $\sum_i L_i\le E_N$，$L_i$ 界与 $E_i-E_{i-1}$ 界必须同号，一旦余量不足整轮论证要重排。其三，若把 $\eta$ 与 $N$ 独立选取（不满足 $N\eta=H$），`05_rr_packing.tex:321-325` 的 $E_N\le\eta e^{1000H}$ 与 $N\eta^2=H\eta$ 无法同时趋零。

(a) 原文（`05_rr_packing.tex:296-303`）：

>  \normtwo{[x,P]}{\tau}^2&\leq E_N,\label{r:eq:final-energy}\\
>  \tau(1-Z_N)&\leq e^{-H}+3N\eta^2+3E_N,
>        \label{r:eq:final-remainder}\\
>  |\tau(Px)-\tau(Sx)|
>  &\leq7N\eta^2+2\sqrt{15HE_N}.

(c) 三个常数的出处：$(1-\eta)^N\le e^{-H}$ 给出 $e^{-H}$，它只由 $H$ 控制，是"先选 $H$ 再放大 $N$"这条顺序的全部理由；$3N\eta^2$ 来自每轮 $3\eta^2$ 的质量残留，$3E_N$ 来自 $3L_i$ 的累加；$\sqrt{15HE_N}$ 中的 $15=3\times 5$，因为 $\sum_i Y_i\le 3N\eta=3H$ 与 $\sum_i L_i\le E_N$ 相乘再乘位移界里的 $5$（`05_rr_packing.tex:313-319`）。半化误差 (line 330-333) $\tfrac12 e^{-H}+5H\eta+\tfrac32 E_N+\sqrt{15HE_N}$ 里 $5H\eta=\tfrac12\cdot 10 N\eta^2$ 是把 $7N\eta^2$ 与残余项合并后的粗界。

(d) 失败路线（推测）：若只有正标签（$S=0$），$|\tau(Px)-\tfrac12\tau(x)|$ 的抵消项就没有对照，必须靠额外的比例选择，而 Corollary~\ref{r:proj:tests} 的比例误差是 $\delta$ 级不是 $\eta^2$ 级。若让正负标签在同一轮内共享同一个 $z_a$，$\tau(z_ay_a)$ 的双计会使 $L_i$ 变成两倍，$1000$ 的余量仍够，但 $Y_i$ 与 $C_i$ 关系错位。

## 10. 06 节：检测引理与"同一个 $\omega$"

(a) 原文（`06_rr_completion.tex:10-15`）：

>  \sup_{\lambda\in\Lambda_\omega}\lambda([d]^*[d])
>  &=\lim_{j\to\omega}\sup_{\tau\in\T(A)}
>              \bar\tau(d_j^*d_j),\label{r:eq:limit-two}\\
>  \sup_{\lambda\in\Lambda_\omega}|\lambda([d])|
>  &=\lim_{j\to\omega}\sup_{\tau\in\T(A)}
>              |\bar\tau(d_j)|.\label{r:eq:limit-linear}

(b) 中间步骤：反向不等式靠逐坐标近似取 sup 的 $\tau_j$（误差 $1/j$）构成一条 limit trace；线性式还额外用"绝对值与有界复数列的 ultralimit 交换"。

(c) 这条引理是"指定族 $\Lambda_\omega$"与"$D$ 的范数"之间的唯一桥梁；`06_rr_completion.tex:17-18` 的 "if $\lVert z\rVert_{2,\lambda}=0$ for every $\lambda\in\Lambda_\omega$, then $z=0$" 后面被用了三次（`06_rr_completion.tex:57-68`、`:100-102`）。误差随维度增长率：无，纯 sup/limit 交换。

(d) 失败路线（推测）：若用 $T(B^\omega)$ 全体抽象 trace 代替 $\Lambda_\omega$，反向不等式的"逐坐标选近似 sup"未必落在指定族里，检测性可能失效；若把 $\sup_\tau$ 换成固定 $\tau$，则第 5 节的一致界无法闭合。

(a) 原文（`06_rr_completion.tex:52-55`）：

> Lift \(P_n\) to positive contractions \((c_{n,j})_j\) in \(B\).
> Such lifts exist by first taking a self-adjoint lift and then applying
> the continuous function which clips the real line to \([0,1]\).

(b) 中间步骤：投影提升先取自伴，再用 $g(s)=\max(0,\min(s,1))$ 逐坐标 clip；clip 不改变商元素，因为它在 $I_\omega$ 的零元邻域上是连续泛函演算。$P_n$ 是投影给出 $\lim_{j\to\omega}\lVert c_{n,j}^2-c_{n,j}\rVert_{2,\T(A)}=0$。之后对每个固定 $n$，用检测引理在 $\omega$-大集上同时满足三条（$1/n$、$2/n$、$2/n$），有限条件交仍属 $\omega$，取一个坐标 $j(n)$ 得 $b_n=c_{n,j(n)}$。这里的 $2/n$ ，并非 $1/n$，是留给提升误差的余量。

(c) 为什么可以"取一个坐标"：条件是有限条，每条在 $\omega$-大集上成立；这是 `05_rr_packing.tex` 的一致估计能够逐 $n$ 落地的机制，也是作者反复强调 "no further ultrapower is taken"（`06_rr_completion.tex:81-82`）的原因。

(d) 失败路线（推测）：若对 $n$ 再取一次 ultrapower，指定 trace 族会变成二重 limit trace，与 Definition~16 的形式不符；若不 clip 而直接用自伴提升，正性丢失，$c^2-c$ 的 2-范数论证仍成立但 $\lambda(px)$ 的符号论证需要额外处理。

(a) 原文（`06_rr_completion.tex:92-99`）：

> Given \(x\in B\), choose \(a\in A\) with
> \(\normtwo{x-a}{\T(A)}<\delta\).
> For every \(\lambda\in\Lambda_\omega\), multiplication by the
> contraction \(p\) and tracial Cauchy--Schwarz give
> \[
>  \normtwo{[p,x]}{\lambda}\leq2\delta,\qquad
>  \left|\lambda(px)-\tfrac12\lambda(x)\right|\leq\tfrac32\delta.
> \]

(c) 系数理由：$[p,x]=[p,x-a]$，两端各 $\le\lVert p\rVert\lVert x-a\rVert_{2,\lambda}\le\delta$，和为 $2\delta$；$\lambda(px)-\tfrac12\lambda(x)$ 拆成 $\lambda(p(x-a))-\tfrac12\lambda(x-a)$ 加两项 $\le\delta$，其中 $\lvert\lambda(p(x-a))\rvert\le\lVert x-a\rVert_{2,\lambda}<\delta$（因 $\lVert p\rVert\le1$ 且 $\lambda$ 正），合计 $1+\tfrac12=\tfrac32$。这一步是 uniform 2-density 的用法，也是为什么 $B$ 不必范数可分（`06_rr_completion.tex:103-104`）。

(d) 失败路线（推测）：若 $A$ 在 $B$ 中不 dense（例如只取 norm closure），$\delta$ 无法趋零，中心性与 half 恒等式只能对 $A$ 成立；若跳过 `06_rr_completion.tex:84-91` 的密度证明（用 uniform 2-Cauchy 逐点收敛），推论的 $T(B)\to T(A)$ 同胚就缺一环。

(a) 原文（`06_rr_completion.tex:119-122`）：

> Evington's trace theorem
> \cite[Theorem~B]{EvingtonTraces25} then gives $T(B)=X_B$ provided the
> pair is of type $\mathrm{II}_1$: each designated GNS von Neumann algebra
> must have no nonzero type I central summand.

(c) 为什么 type $\mathrm{II}_1$ 检查放在最后：需要定理~\ref{r:thm:main} 的结论（property $\Gamma$ 对这对 $(B,X_B)$）先成立，才有 complemented partitions of unity；所以推论 Corollary~\ref{r:cor:completion-traces} 的假设里必须重述"including real rank zero of $B^\omega$"（`01_introduction.tex:124-126`）。排除 type I 齐次 summand 靠"复合 $Z$ 的 character 给出有限维表示，与简单性加无限维矛盾"（`06_rr_completion.tex:124-130`）。

(d) 失败路线（推测）：若 $A$ 允许有限维表示，$\lvert\sigma(b)\rvert\le\lVert b\rVert_{2,T(A)}$ 会在纯型 I summand 上失败，因为 character 不受 2- seminorm 控制；若用 `01_introduction.tex:113-116` 的 Evington--Tikuisis 强化版本（代数本身 rank zero），则假设方向反过来，无法从 ultrapower rank zero 推出。

## 11. 07 节：三条路线的接口，以及分离性究竟用在哪

(a) 原文（`07_unital_preliminaries.tex:46-48`）：

> When $T(A)=\varnothing$, this requires
> $a\precsim b$ for every positive $a$ and every nonzero positive $b$
> in the stabilization.

(c) 为什么要把空迹情形写进定义，并非另立一节：`main.tex:61-63` 的 unital Toms--Winter 结论包含 $T(A)=\varnothing$；若只在有迹时定义严格比较，空迹分支就得引入"纯无限比较"这一新词。`01_introduction.tex:181-182` 明确"it is more than the absence of traces"。我在读到这里之前以为空迹情形靠外部定理直接解决；实际上 `11_unital_gamma.tex:392-448` 是自证的 hereditary 无限投影加 Kirchberg--Phillips。

(a) 原文（`07_unital_preliminaries.tex:124-128`）：

> This finite bound uses the same $k$ for every $\tau$. Consequently, if
> $d_\tau(v)=\infty$, then
> $d_\tau((u-s)_+)<d_\tau(v)$ as well.

(b) 中间步骤：$P=1_{(s,\infty)}(u)$ 在 tracial von Neumann 表示里，$PcP\ge\frac s2 P$ 使 $c^{1/2}P$ 的极分解初投影为 $P$、终投影 $\le\supp(c)$，故 $d_\tau((u-s)_+)=\tau(P)\le\tau(\supp(c))\le k$，$k$ 是有限 matrix corner 的尺寸。

(c) 这条"同一个 $k$ 对所有 $\tau$"是 Lemma~\ref{u:lem:comparison-convention} 的核心，它把 2-范数世界（$d_\tau$ 无界情形）拉回可比较的有限秩；没有它就无法处理 $d_\tau(v)=\infty$ 的 trace。

(a) 原文（`07_unital_preliminaries.tex:282-287`，bounded diagonal principle 的关键选择）：

> These are decreasing members of $\omega$ with empty intersection.
> For each $l$ that belongs to at least one $F_n$, let
> $r(l)=\max\{n:l\in F_n\}$, which is finite and at most $l$,
> and set $x_{i,l}=x^{(r(l))}_{i,l}$. At the remaining coordinates
> set $x_{i,l}=0$.

(b) 中间步骤：$F_n=\{l\ge n\}\cap\bigcap_{j\le n}E_j$；$l\in F_n$ 蕴含 $r(l)\ge n$ 且 $l\in E_{r(l)}$，故 $t_{k,l}<c_k+1/r(l)\le c_k+1/n$（$k\le n$）。$r(l)\le l$ 保证"越靠后的坐标用越高级的近似"，这是取 ultralimit 后误差消失的机制。

(c) 半径与 lift 的理由：`07_unital_preliminaries.tex:240-255` 给出三种定义域（ball、selfadjoint、positive）各自的 lift 构造，正元用 $g_R$ clip 到 $[0,R_i]$；`07_unital_preliminaries.tex:306-315` 说明分离性的唯一用途是把"对全体系数"化为"对 countable 稠密集"，多项式在固定 ball 上对系数的范数连续性给出延伸。

(d) 失败路线（推测）：其一，若直接用对角线 $x_{i,l}=x^{(l)}_{i,l}$，无法保证 $l\in E_j$ 对所有 $j\le l$，因为 $E_j$ 随 $j$ 变化而无嵌套关系，$r(l)$ 的选取正是补上嵌套。其二，若不固定半径而允许 trial tuple 的范数增长，lift 序列可能无界，不构成 $D$ 的元素。其三，若 $A$ 不可分，countable 稠密集不存在，`07_unital_preliminaries.tex:258` 的 "Only countably many parameters occur" 断链。

## 12. 08 节：整数谱切割是全场最"无害"却也最容易做错的一步

(a) 原文（`08_unital_ranks.tex:82-88`）：

> For $0\le s\le\norm{c}$, let
> $N_L(s)=\sum_{j=1}^L\mathbf 1_{(j,\infty)}(s)$.  The elementary
> counting identity gives
> \begin{equation}
>  0\le s-N_L(s)\le\mathbf 1_{(0,\infty)}(s).
>  \label{u:eq:integer-cuts}
> \end{equation}

(b) 中间步骤：$v=\bigoplus_{j=1}^{L}(c-j)_+$，$L\ge\max\{1,\lVert c\rVert\}$；$(\tau\otimes\Tr)(\supp(c-j)_+)=\tau(\mathbf 1_{(j,\infty)}(c))$，于是 $d_\tau(v)=\sum_j\tau(\mathbf 1_{(j,\infty)}(c))$，与 $\tau(c)=\sum_j\tau(\mathbf 1_{(j,j+1]}(c))\cdot$（阶梯积分）比较得 $0\le\tau(c)-d_\tau(v)\le d_\tau(c)$。

(c) 常数的机械理由：为什么开集用 $(j,\infty)$ 而闭集用 $[j,\infty)$ 会让界差一：非整正 $s$ 计数为 $\lfloor s\rfloor$；正整数 $s$ 计数为 $s-1$，差恰为 $1$；$s=0$ 差为 $0$（`08_unital_ranks.tex:89-92`）。这个"至多一"的偏置正是被 $d_\tau(c)<\delta$ 吸收的量。上端点 $\lVert c\rVert=L$ 的情形也被单独核对（`08_unital_ranks.tex:91-92`）。$L$ 无关于 $b,\delta$ 的一致界（`08_unital_ranks.tex:38-39` 明说），因为 $\lVert c\rVert$ 可能任意大：压缩 $c=\sum e^{1/2}x_i b x_i^*e^{1/2}$ 的范数由 frame 系数控制，而 `08_unital_ranks.tex:56-58` 给的是 $\lVert s^{-1}\rVert^{-2}\le\lVert U\rVert^2\lVert y\rVert$ 这种与 $\tau$ 无关的粗界。

(d) 失败路线（推测）：其一，直接用 $\lfloor s\rfloor$ 的下取整阶梯而不处理整数点，会得到 $\tau(c)-d_\tau(v)\le d_\tau(c)+(\text{整数原子})$，而整数原子的 trace 无法一致控制。其二，把 $(c-j)_+$ 换成 $f_j(c)$ 的线性 ramp（如非单侧 13 节的做法）会破坏"计数=秩"的关系，$d_\tau$ 就不再等于支持投影的 trace。其三，若 $e$ 不是 full，`08_unital_ranks.tex:44-45` 的 $\overline{AeA}=A$ 无法给出 $\sum x_i^*ex_i=1$ 这条精确 frame 恒等式，$\tau(c)=\tau(b)$ 立刻降级为近似。

(a) 原文（`08_unital_ranks.tex:144-149`）：

> There is a single $t>0$ such that
> \begin{equation}
>  d_\tau((v-3t)_+)>\tau(b)-2\delta
>  \qquad(\tau\in T).
>  \label{u:eq:uniform-rank-cut}
> \end{equation}

(b) 中间步骤：对固定 $t$，左端是 $\sup_m(\tau\otimes\Tr)(\min\{1,m(v-3t)_+\})$ 的上升极限，故为 $\tau$ 的下半连续函数；$U_t=\{\tau:d_\tau((v-3t)_+)>\tau(b)-2\delta\}$ 随 $t$ 下降而增大并覆盖 $T$（因 $d_\tau(v)>\tau(b)-\delta$）；紧性取有限子覆盖，最小切割参数给出统一的 $t$。

(c) 三层切割 $3t>2t>t$ 的理由：比较 witness 的误差 $\alpha=\lVert w-v\rVert<t$，于是 $E(w-2t)_+E\ge(t-\alpha)E$ 与 $FvF\ge(t-\alpha)F$ 中的 $\gamma=t-\alpha>0$ 与 $\tau$ 无关（`08_unital_ranks.tex:179-202`）。若只用两层切割，$\gamma$ 可能为零，极分解的初投影就不再等于 $E$。$g$ 在 $[0,t]$ 为零、在 $[2t,\infty)$ 为一，使 $\mathbf 1_{(2t,\infty)}\le g\le\mathbf 1_{(t,\infty)}$，从而 $\tau(p_0-p_0^2)\le d_\tau((w-t)_+)-d_\tau((w-2t)_+)$ 是良定义的有限差。

(d) 失败路线（推测）：其一，跳过紧性而逐 trace 选 $t_\tau$，则 $\gamma$ 无正下界，witness 矩阵形状随之漂移；其二，$T$ 若不紧（$A$ 非单侧或有非归一化 trace），下半连续的 sup 论证崩；其三，把 $v\precsim b$ 在 $M_L(A)$ 内做而不放进 $A\otimes\K$ 的角，`08_unital_ranks.tex:169-176` 的 $x=P_1XP_L$ 压缩会失去 $\lVert x^*bx-v\rVert<t$。

(a) 原文（`08_unital_ranks.tex:246-258`）：

>  p\le\mathbf 1_{[\eta,1]}(h)\quad\text{in }D^{**},
>  \qquad
>  \tau(p)=\tau((h-\eta)_+)
>        \quad(\tau\in\Lambda).
>  \label{u:eq:projection-supply}
> \end{equation}
> In addition, for $k_\eta(s)=\min\{s/\eta,1\}$ on $[0,1]$, one has
> \begin{equation}
>  k_\eta(h)p=p=pk_\eta(h)\quad\text{in }D.

(c) 为什么需要 $k_\eta$ 这条精确恒等式：$p\le\mathbf 1_{[\eta,1]}(h)$ 是 $D^{**}$ 里的序关系，不能直接代入乘积；而 $k_\eta(h)p=p$ 是 $D$ 内的等式，靠 $(1-k_\eta(h))p=0$ 与核投影 $\mathbf 1_{\{1\}}(k_\eta(h))=\mathbf 1_{[\eta,1]}(h)$ 才把序关系搬回来（`08_unital_ranks.tex:296-305`）。作者特意补一句"does not require any normal trace on $D^{**}$ to be faithful"。$\delta=1/\ell$ 的逐坐标选取使投影缺陷 $(p_\ell-p_\ell^2)^2\le p_\ell-p_\ell^2$ 的 2-范数趋零，这是 $p$ 真为投影的原因。

(d) 失败路线（推测）：若试图在 $D$ 内部直接对 $h$ 做 Borel 谱切割（$1_{[\eta,1]}(h)$ 未必属于 $D$），会得到 $D^{**}$ 中的元素，并非 $D$ 中的投影；若用连续函数近似而不引入 $k_\eta$，$\tau(p)=\tau((h-\eta)_+)$ 的等号退化为不等式，后续 $r=2p-q$ 的 $\tau(r)=0$ 就不成立。

(a) 原文（`08_unital_ranks.tex:308-322`，corner symmetry）：

> For every projection $q\in D$ there is $r=r^*\in qDq$ such that
> \[
>  r^2=q,\qquad \tau(r)=0\quad(\tau\in\Lambda).
>  \]

(c) 取 $\eta=1/2$：$p\le q$ 且 $\tau(p)=\tau((q-\tfrac12)_+)=\tfrac12\tau(q)$（因 $q$ 的谱在 $\{0,1\}$，$(1-\tfrac12)_+$ 恰为 $\tfrac12$ 于支集上）；$r=2p-q$ 给出 $r^2=4p^2-4p+q$，用 $p^2=p$ 得 $q$。$q=0$ 时 $r=0$ 自动包含。

(d) 失败路线（推测）：若 $\eta$ 取其他值 $\ne\tfrac12$，只能得 $\tau(p)=\eta\tau(q)$（当 $\eta<1$ 时 $(1-\eta)_+=1-\eta$），$r=(p-(1-\eta)q)/(1-\eta)$ 之类的表达式会引入分母而破坏 $r^2=q$ 的整洁形式；若 $q$ 只是 $D^{**}$ 中的投影、并不落在 $D$ 里，$p$ 无法在 $qDq$ 内取得。

## 13. 09 节：把"移动的角"变成可数的固定构造

(a) 原文（`09_unital_centering.tex:92-97`）：

> \begin{equation}
> \label{u:eq:moving-corner-modulus}
>  \left|\tau\bigl(f^u(uxu)\bigr)
>           -\tau\bigl(f^v(vxv)\bigr)\right|
>  \le 2a+C_P\sqrt{\tau(u-v)}.
> \end{equation}

(b) 中间步骤：$\lVert(u-v)\rVert_{2,\tau}=\sqrt{\tau(u-v)}$（$u-v$ 是投影）；$\lVert uxu-vxv\rVert_{2,\tau}\le 2\sqrt t$ 由 $(u-v)xu+vx(u-v)$；望远镜恒等式给 $\lVert(uxu)^k-(vxv)^k\rVert_{2,\tau}\le 2k\sqrt t$；于是 $C_P=\lvert a_0\rvert+2\sum_{k\ge1}k\lvert a_k\rvert$。

(c) 三层容差的机械理由（`09_unital_centering.tex:101-110`）：多项式逼近误差 $a=\delta/(16m)$ 给出 $2a=\delta/(8m)$；$\alpha=\delta/(4m)$ 是投影供给的切割损失；$\kappa=\min\{\delta/(4m),(\delta/(8mC))^2\}$ 保证只要 $\tau(u-v)<\kappa$ 就有整条移动角界 $\le\delta/(4m)$。run 推进量 $\tau(a_j)>\delta/(2m)>\kappa$ 里三个 $\delta/(4m)$ 相加恰好是 $\tfrac{3\delta}{4m}$，与 $\delta/m$ 之间留下 $\delta/(4m)$ 的余量；$K=\lfloor1/\kappa\rfloor+1$ 使 $K\kappa>1$ 与 $\tau(q-w)\le1$ 矛盾。误差随维度增长率：无，$m$ 是覆盖 $[-1,1]$ 的 hat 函数个数，$\kappa\sim(\delta/m)^2$ 所以 $K\sim(m/\delta)^2$，块数 $L$ 会随精度平方增长；这正是后面所有"块数不进界"的动机所在。

(d) 失败路线（推测）：其一，若用 Borel 函数 $1_{[\lambda_j-\varepsilon,\lambda_j+\varepsilon]}$ 代替连续 hat 函数，移动角时的模量不存在（下半连续但不连续），$K$ 无从固定。其二，若不在每一步重跑整组函数而只跑一遍，某些 trace 上可能所有 $f_j^u(uxu)$ 都小于 $\delta/m$ 但和为 $\tau(u)>\delta$（当 $m$ 大时不成立），$K$ 的有限性论证依赖 $\sum_j f_j=1$ 的严格划分。其三，$n$ 个系数分层细化时容差取 $\delta/(n\max\{1,L_{j-1}\})$，若统一用 $\delta/n^2$ 会浪费；$\max\{1,L_{j-1}\}$ 是防止 $L_{j-1}=0$ 除零，这是我第一遍读时误以为的技术性赘余。

(a) 原文（`09_unital_centering.tex:252-255`）：

>  |\tau(br)|\le2M\theta\sum_s\tau(p_s)+M\theta
>              \le3M\theta\le\frac{3\zeta}{8}<\zeta.

(c) $\theta\le\min\{1/4,\zeta/(8M)\}$：$1/4$ 保证 $2M\theta\le M/2$ 即压缩估计不超过平凡界，$\zeta/(8M)$ 使 $3M\theta\le 3\zeta/8$。残块 $w$ 的贡献是 $M\tau(w)\le M\theta$，与块数无关；每块贡献按 $\tau(p_s)$ 加权，$\sum_s\tau(p_s)\le1$。

(d) 失败路线（推测）：若对每块都用 $\zeta/(\text{块数})$ 的容差，$K$ 与 $\theta$ 互为隐函数，$\kappa$ 的推进量论证与 $\theta$ 的选择循环依赖，构造无法闭合。若 $r_s$ 不取 trace-zero 对称而取 $\tfrac12$-分拆投影本身，$\tau(br_s)$ 里会留下标量项 $\nu_{s,b}\tau(r_s)$，而 $\tau(r_s)$ 未必为零。

(a) 原文（`09_unital_centering.tex:262-270`）：

> Let $E\subset D$ be a finite-dimensional $C^*$-subalgebra, possibly
> nonunital, and let $S\subset D$ be a unital norm-separable
> $C^*$-subalgebra.  There is a selfadjoint unitary $r\in D\cap E'$ such
> that
> \begin{equation}
> \label{u:eq:centered-symmetry}
>  \tau(sr)=0\qquad(s\in S,\ \tau\in\Lambda).
> \end{equation}

(b) 中间步骤：$E$ 添单位仍有限维（只多一个 $\C(1_D-e)$ summand）；取矩阵单位后，在每个 $e^{(\ell)}_{11}De^{(\ell)}_{11}$ 角里对 $H_\ell=\{e^{(\ell)}_{1i}s e^{(\ell)}_{i1}:s\in H,\,i\le n_\ell\}$ 用 Lemma~\ref{u:lem:coefficient-symmetry}，容差 $\xi/N_0$，$N_0=\sum_\ell n_\ell$；$R=\sum_{\ell,i}e_{i1}u_\ell e_{1i}$ 靠矩阵单位关系给出 $R^2=1_D$ 与 $Re_{jk}=e_{jk}R$；最后用对角引理把有限测试提升到全部 $s_k$。

(c) $N_0$ 的角色：$\tau(sR)=\sum_{\ell,i}\tau(e_{1i}se_{i1}u_\ell)$ 共有 $N_0$ 项，所以容差必须除以 $N_0$；$N_0$ 依赖 $E$ 的矩阵尺寸，而 $E=\rho_i(F_i)$ 在第 10 节里尺寸不受控，这是为什么第 10 节的加权估计必须按 $\beta_i$ 求和，并非逐项相加。

(d) 失败路线（推测）：若要求 $r$ 同时中心于 $S$，`09_unital_centering.tex:345-349` 明确说明本命题不给出这个，而第 10 节的逐步添加正依赖"$r_i$ 只需对前驱的中心化"；若把 $u_\ell$ 放在 $e^{(\ell)}_{ii}$ 上（$i>1$）会与 $R^2$ 的对角结构冲突。$E$ 非单侧时若忘记 $\C(1_D-e)$ summand，$R^2$ 只等于 $e$，不是 $1_D$。

## 14. 10 节：HKW 的无界 summand 数逼出 clipping

(a) 原文（`10_unital_averaging.tex:39-41`）：

> where each $\phi_i:F\to N$ is completely positive, contractive, and of
> order zero.  The number $M$ is finite for the chosen approximation;
> no bound on $M$ independent of $K$ and $\varepsilon$ is asserted.

(c) $M$ 无界是本节的结构性约束。它一路传染：`10_unital_averaging.tex:340-343` 的 $\lVert z\rVert\le\sum_i\sqrt{\beta_i}\le\sqrt M$ 意味着不能把 $z$ 直接送进对角引理（对角引理要求固定半径 ball），于是必须 clipping，而 clipping 的代价是首二阶系数矩各丢 $3/R^3$ 与 $3/R^2$。

(a) 原文（`10_unital_averaging.tex:57-63`）：

>  \tau(P)\ge\tau(h)-\eta,
>  \qquad
>  \norm{\phi(c)-\rho(c)}_{2,\tau}^{2}
>  \le 4(1-\tau(h))+2\eta
>  \quad (c\in F,\ \norm{c}\le1).

(b) 中间步骤：$\pi_t(x)=(h+t1)^{-1/2}\phi(x)(h+t1)^{-1/2}$ 逐点强收敛到 $F\to D^{**}$ 的单射同态 $\pi$，$\phi(x)=h\pi(x)=\pi(x)h$，$\pi(1_F)=q=\supp(h)$；Schwarz 等号论证（对 $e+zx$ 全体复数 $z$ 展开比较线性项）给出乘性。回到 $D$：$p$ 来自 Proposition~\ref{u:prop:projection-supply} 作用于 $a=\phi(e_{11})$，$g(s)=k(s)/s$ 使 $\pi(e_{s1})k(a)=\phi(e_{s1})g(a)\in D$；$\rho(e_{st})=v_spv_t^*$。

(c) $4(1-\tau(h))+2\eta$ 的出处：$\lVert\phi(c)-\pi(c)\rVert_{2,\tau}^2\le\tau(q-h)\le 1-\tau(h)$ 与 $\lVert\rho(c)-\pi(c)\rVert_{2,\tau}^2\le\tau(q-P)\le 1-\tau(h)+\eta$，平方三角不等式 $(a+b)^2\le 2a^2+2b^2$ 给出 $2(1-\tau(h))+2(1-\tau(h)+\eta)$。损失以 $\tau(q)$ 计量所以无矩阵尺寸因子（`10_unital_averaging.tex:177-179`）。

(d) 失败路线（推测）：其一，直接在 $D^{**}$ 里用 $\pi$ 而丢弃 $p$，则 $\rho(F)\subset D^{**}\setminus D$，后续对称 $r_i$ 不属于 $D$，对角引理无法执行。其二，把 $\eta$ 取成与 $c$ 的范数相关，$\tau(P)\ge\tau(h)-\eta$ 与压缩误差耦合。其三，若用 Winter--Zakharevich 结构定理的黑箱而不重述 $\pi_t$ 的收敛细节，就无法精确指出 $p\le\pi(e_{11})$ 这条支撑包含，$v_s\in D$ 的论证缺环。

(a) 原文（`10_unital_averaging.tex:202-207`）：

>   \norm{[z,a]}_{2,\tau}^{2}&\le72\eta &&(a\in E),\\
>   \tau(bz)&=0,\qquad \tau(bz^2)=\tau(b) &&(b\in A),\\
>   \tau(z^4)&\le3.

(c) 指数链条：$3\eta$（`10_unital_averaging.tex:235-241`，来自 $T_0$ 在 $\{1\}\cup E\cup\{a^2\}$ 上的 $\eta$ 逼近与 Schwarz 的 $T_i(a)^2\le T_i(a^2)$）；$6\eta$（$4\sum\beta_i(1-\tau(h_i))+2\eta$，其中 $4=2^2$ 来自 replacement 界里的 $4(1-\tau(h))$）；$18\eta=2(3\eta)+2(6\eta)$；$72\eta=4\cdot18\eta$，因子 $4$ 是 $\lVert[r_i,a]\rVert\le 2\lVert a-\rho_i\psi_i(a)\rVert$ 的平方。四阶矩 $3-2\sum_i\beta_i^2$ 来自 $\tau(z_i^4)\le\tau(z_{i-1}^4)+6\beta_i\sum_{j<i}\beta_j+\beta_i^2$ 的逐项累加，$6=4+2$ 是六个双 $r$ 词中四个归为 $\tau(X^2)$、两个交错项由 Cauchy--Schwarz 同样界为 $\tau(X^2)$。$\tau(|d|^3)\le\tau(d^4)^{3/4}$ 是概率测度上的 Hölder。

(d) 失败路线（推测）：其一，若 $r_i$ 只对 $A$ 中心化而不对 $S_i=C^*(A,r_1,\dots,r_{i-1})$ 中心化，混合项 $\tau(r_ir_j)$（$i\ne j$）不为零，$\tau(bz^2)=\tau(b)$ 直接失败，CLT 步骤的二阶系数矩也无从谈起。其二，若四阶矩估计用 $\lVert z\rVert^4$ 替代 $\tau(z^4)$，clipping 的尾部界 $R^{-3}\tau(z^4)$ 变成 $R$ 依赖 $M$ 的量。其三，把权重取成 $\sqrt{\beta_i}$ 之外（例如 $\beta_i^{1/2}$ 换 $\beta_i$）会破坏 $\sum\beta_i=1$ 与二阶矩的归一。

(a) 原文（`10_unital_averaging.tex:353-366`）：

>  g_R(s)=\max(-R,\min(s,R)),\qquad d=g_R(z)
> ...
>  \norm{[d,a]}_{2,\tau}\le\norm{[z,a]}_{2,\tau}.
> ...
>  |\tau(b(d-z))|&\le R^{-3}\tau(z^4),\\
>  |\tau(b(d^2-z^2))|&\le R^{-2}\tau(z^4),\\
>  \tau(d^4)&\le\tau(z^4).

(b) 中间步骤：在 tracial $L^2$ 上左右乘 $z$ 给出交换的有界自伴算子 $L_z,R_z$，联合谱测度 $E_z$ 使 $\lVert[d,a]\rVert_{2,\tau}^2=\int\lvert g_R(s)-g_R(t)\rvert^2\,d\mu_a\le\int\lvert s-t\rvert^2d\mu_a$。系数任意性由 $|\tau(bx)|\le\tau(|x|)$（$\lVert b\rVert\le1$，极分解 $x=u|x|$、$y=|x|^{1/2}$、$c=bu$）提供。

(c) $R^{-3}$ 与 $R^{-2}$ 的指数理由：标量不等式 $|s-g_R(s)|\le|s|^4/R^3$ 在 $|s|>R$ 时给 $|s|-R\le|s|\le|s|^4/R^3$，在 $|s|\le R$ 时为零；$|s^2-g_R(s)^2|\le|s|^4/R^2$ 同理。这两个幂次决定了最终一致性质 $\Gamma$ 里误差的可见度：取 $R=N$ 时它们是 $3/N^3$ 与 $3/N^2$，`11_unital_gamma.tex:159-164` 的 $\epsilon_N(t)$ 里那两个次级项 $\frac{3|t|}{N^{7/2}}$、$\frac{3t^2}{2N^3}$ 正是它俩与 $N^{-1/2}$、$N^{-1}$ 组合的结果。

(d) 失败路线（推测）：若用谱截断（把 $|s|>R$ 的特征值直接删掉）代替 clip，交换子界 $\lVert[d,a]\rVert\le\lVert[z,a]\rVert$ 不再成立（截断函数在 $R$ 处不连续，1-Lipschitz 性丢），二阶矩界也变成尾部 trace ，并非 $R^{-2}$。若 $R$ 依赖核近似数据（即随 $M$ 变），对角引理的固定 ball 前提失效。

## 15. 续写前先把手稿的分片编号对齐

(a) 原文（`main.tex:69-84`）：

> \input{sections/11_unital_gamma}
> \input{sections/12_nonunital_framework}
> \input{sections/13_nonunital_selection}
> \input{sections/14_nonunital_models}
> \input{sections/16_nonunital_amplification}
> \input{sections/17_nonunital_absorption}

(b) 我列了 build 目录，15 号分片确实不存在，`main.tex` 也没有 input 它。把文件名与 LaTeX 自动编号对齐之后事情就清楚了：01 到 14 号文件是论文的第 1 到第 14 节，16 号文件是论文第 15 节，17 号是第 16 节。缺的是文件名槽位，正文的节计数没断，编译日志里也不会有悬空引用。真正让我怀疑这里曾经有过独立一节的，是 `14_nonunital_models.tex:24` 的 `\subsection{Averaged finite-dimensional models}\label{n:sec:models}` 与 `14_nonunital_models.tex:113` 的 `\subsection{Truncation and the combined cost}`：一个 9,150 B 的分片里塞了两个带自己标号的小节，而它自己的节标题 `Small central splittings from finite-dimensional models` 同时覆盖"造模型"与"合并代价"两件事，正好是两节的体量。

(c) 引用图能支撑这个读法。我把 `n:sec` 系引用全 grep 了一遍：`01_introduction.tex:320-321` 用区间引用 `\ref{n:sec:framework}`--`\ref{n:sec:absorption}` 把非单侧路线整体点名；`14_nonunital_models.tex:7` 前向引用 `n:sec:amplification`；`16_nonunital_amplification.tex:3` 回引 `n:sec:small`。`n:sec:models` 这个标签定义了却没有任何 `\ref` 用过它，`n:sec:selection`、`n:sec:framework`、`n:sec:absorption` 都只在引言的区间引用里被消费一次。一个从未被单独引用的节标签，最常见的来历是它曾经是 `\section`，降级成 `\subsection` 后原引用点被就地删了。这条只作为我的推测记下，正文内容不受它影响：我要补的实体是五个块，框架、选择、模型与截断、放大、吸收，按文件号还是按节号都不改变它们的因果顺序。

(d) 我的前两条路都白跑了。第一条：按文件名把 16 号当第 16 节，于是在第 14 节里找"第 15 节"的前向引用，grep 了两次空手而归，其实是编号口径错了。第二条：以为缺号意味着 `\ref` 指向不存在的 label，去翻 build 目录里的 aux 与 log，结论是 `main.tex` 从来没 input 过 15，LaTeX 侧根本无从断链。这两次绕路的共同原因我把教训记在这里：分片文件名是给作者自己排序用的工程产物，把它当成论文的拓扑来推，就会推出正文里不存在的约束。

## 16. 12 分片：单位元来自紧基，其余全是外部输入

(a) 原文（`12_nonunital_framework.tex:14-17`）：

>  D=\Aw=\ell^\infty(A)/I_T,\qquad
>  I_T=\{(a_n):\lim_\omega\|a_n\|_{2,T}=0\}

(c) 与前面第 4 节的单侧框架对照：那边的 $D$ 是单侧代数按迹族取的商，天生有单位；这边 $A$ 满足 `01_introduction.tex:237-243` 的假设（非零、单、可分、核、$A\otimes\K$ 无非零投影），$\ell^\infty(A)$ 的 tracial 商一般仍非单侧。作者在这一节开头就把赌注下清楚了（`12_nonunital_framework.tex:3`）：紧的归一化迹基提供单位，后面的投影与模型构造全在这个商里做。$T:=T_1(A)$ 记法在 `12_nonunital_framework.tex:6`，而"每条非零密有限迹是唯一 $T$ 元素的正标量倍"与"单性使 $T$ 中每条迹 faithful"（`:7-8`）是后面两处关键不等式的公共前提。$A$ 经常数序列嵌入 $D$（`:23`），这一句决定了后面所有把 $D$ 中结论搬回 $A$ 的措辞。

(a) 原文（`12_nonunital_framework.tex:25-31`）：

> The algebra $D$ is unital, $\Lambda$ consists of tracial states, and every
> $\tau\in \Lambda$ restricts to an element of $T$. Moreover,
> \[
>  \|[(a_n)]\|_{2,\Lambda}=\lim_\omega\|a_n\|_{2,T},
> \]
> and this norm detects zero in $D$.

(b) 中间步骤（`:33-49`）：取递增的压缩近似单位 $(u_n)$（可分性给序列版本）；$\sigma\mapsto\sigma(u_n)$ 在紧集 $T$ 上单调递增趋于 $1$，Dini 定理给一致收敛；在 tracial von Neumann 表示里对任意有界序列 $\|(1-u_n)a_n\|_{2,\sigma}^2\le\lVert a_n\rVert^2\sigma((1-u_n)^2)\le\lVert a_n\rVert^2(1-\sigma(u_n))$，右边同样；于是 $(u_n)$ 代表 $1_D$，它在每条 limit trace 下取值 $1$；限制到 $A$ 的每条 limit trace 范数为 $1$ 也是靠这个一致收敛；范数恒等式靠逐坐标挑选与上确界任意接近的迹；最后一句就是商的定义。

(c) 我原来以为难点在于 $\omega$-极限下单位的存在性，需要额外的完备性论证。真正的机制简单得多：一致收敛与逐点收敛之差。只有逐点收敛时得到的是对每条 $\sigma$ 有 $\|(1-u_n)a_n\|_{2,\sigma}\to0$，而商范数是 $\lVert\cdot\rVert_{2,T}=\sup_{\sigma\in T}$，上确界可能不趋于零，$(u_n)$ 的类就不是单位。Dini 在这里的作用是把"单调递增趋于 $1$"这一条序信息转成上确界意义下的收敛，紧性只是把单调极限的连续性买回来。第二个我起初低估的细节是"this norm detects zero"（`:31`）：它在 13 分片 `13_nonunital_selection.tex:147-149` 处被消费，那里的论证是"正元素压缩亏量 trace 趋于零，于是它在 $\lVert\cdot\rVert_{2,\Lambda}$ 下趋于零，于是类是投影"，检零性是这一句从 trace 语言跨到范数语言的唯一桥梁。第三处消费是 `14_nonunital_models.tex:109`：模型误差的界先在 $T$ 上成立，再靠"limit trace 限制到 $T$"搬到 $\Lambda$ 上。

(a) 原文（`12_nonunital_framework.tex:60-70`）：

> Matrix order-zero maps lift across
> arbitrary $C^*$-quotients \cite[Proposition 1.8]{CETW}. For such a map
> $\theta$ from a unital algebra there is a supporting homomorphism $\pi$
> in the bidual of its target such that
> \[
>  \theta(d)=h\pi(d),\qquad h=\theta(1),\qquad [h,\pi(d)]=0.
> \]
> If $f\in C([0,1])$ and $f(0)=0$, then $f(h)\pi(d)$ is in the target
> algebra \cite[Theorem 3.3 and Corollary 4.2]{WZ}.

(c) 这三条外部输入（CETW 的 Prop 1.8 提升、$\theta=h\pi$ 支撑式、Winter--Zakharevich 的 $f(h)\pi(d)\in D$）就是 14 分片把 order-zero 模型换成 $D$ 中有限维子代数的全部弹药，本分片一次列清后文不再补引理。紧接着的 `:72-79` 是一个我必须记住的复合引理：有限矩阵直和到商的同态有 order-zero 提升。做法是两个正交像单位 $e_1,e_2$ 时把 $e_1-e_2$ 作为自伴压缩提升，正负部生成的 hereditary 子代数分别映到 $e_1,e_2$ 角，逐个 summand 递推，值域两两正交所以和仍压缩且 order zero。它跟第 6 节里我用过的单侧提升的区别只在于这里没有单位可依赖，必须靠自伴压缩的正负部自己造两块正交支撑。

(a) 原文（`12_nonunital_framework.tex:81-90`）：

> For $\sigma\in T$, let $M_\sigma=\pi_\sigma(A)''$. Kaplansky density gives
> a surjection
> \begin{equation}\label{n:eq:kaplansky}
>  \ell^\infty(A)\longrightarrow M_\sigma^\omega.
> \end{equation}
> ... Consequently,
> the inclusion of any finite-dimensional unital subalgebra of $M_\sigma$
> into $M_\sigma^\omega$ has a coordinatewise order-zero lift to $A$.

(b) 中间步骤（`:86-90`）：满射靠逐坐标近似，$M_\sigma$ 中序列的第 $n$ 项用 $A$ 中同球的元素以 $2$-norm 误差小于 $1/n$ 逼近；作者特意补一句"This works also for the unit of $M_\sigma$"，因为 $M_\sigma$ 的单位一般不在 $\pi_\sigma(A)$ 里，只在强闭包里，这正是 Kaplansky 密度给的球内稠密性；随后把满射与上一段 order-zero 提升合成。`:92-95` 再补两条：同一手法见 CETW 的 Lemma 4.4；核性与 Connes 注入性定理使每条 $M_\sigma$ 是 hyperfinite 且 predual 可分，明确写了 "including nonextreme traces"。

(c) "including nonextreme traces" 这句我一开始当成多余的谨慎，对照 14 分片才看清它的消费点：`14_nonunital_models.tex:53-57` 在每个固定 $\sigma$ 处把误差函数 $L(\sigma)$ 压到任意小，而 `14_nonunital_models.tex:64-66` 的分离泛函归一化成的概率测度 $\mu$ 取 barycenter $\sigma_\mu\in T$，这个 $\sigma_\mu$ 几乎必然落在 $T$ 的内部，并非极值边界。若 hyperfiniteness 只在极值迹上成立，"逐点任意小"就覆盖不到 barycenter，凸平均论证直接断。predual 可分也不是装饰：它保证后续 GNS 与表示层面可数化操作合法。

(d) 失败路线（推测）：其一，若把 $I_T$ 换成按单个 $\sigma$ 取的零 ideal $I_\sigma$，得到的 $D_\sigma$ 上有 faithful trace 但没有一致范数，检零性失效，13 分片从 trace 亏量到范数亏量那一步没有替代品。其二，若 $T_1(A)$ 只是非空而不弱$*$紧（`01_introduction.tex:239-240` 把"整个密有限迹锥在有界单位球上有界"与"归一化基紧"列为两条独立假设），$\sigma(u_n)$ 单调逐点趋于 $1$ 不保证一致，Dini 用不上，$D$ 是否单侧就成了开放问题。其三，若忘记simplicity 给的 faithfulness，17 分片 `17_nonunital_absorption.tex:91` 的 $m=\min_{\sigma\in T}\sigma(b)>0$ 不成立，无界标量 $r_n$ 的界 $C/m$ 无从取得。

(a) 原文（`12_nonunital_framework.tex:97-101`）：

> For a positive element $b$ in an ambient $C^*$-algebra $C$, write
> $\Her(b)=\overline{bCb}$.
> All trace calculations involving supports or supporting homomorphisms
> may be made in the relevant tracial von Neumann representation. Matrix
> extensions always use $\Tr$, not the normalized matrix trace.

(c) 最后那句约定在后面两处是实质性的。13 分片 `13_nonunital_selection.tex:50-55` 造 $k=\bigoplus_{j=1}^{N}f_j(c)$ 时，$\sigma(k)=\sigma(c)$ 的严格等号靠未归一化迹（每层 $f_j$ 的贡献直接相加），若用归一化迹每条 summand 要带 $N$ 相关因子，而 $N\ge\lVert c\rVert$ 无上界。14 分片 `14_nonunital_models.tex:139-155` 的矩阵技巧同样以 $\Tr$ 计，否则 $\lVert[V,Z]\rVert_2$ 的平方与 $\sum_i\lVert[p_i,x]\rVert_{2,\tau}^2$ 之间会差 $N$ 的幂。"支与支撑同态的 trace 计算可在 tracial von Neumann 表示里做"这句让我在 13 分片的极分解与支投影比较时不再纠结 $D$ 与 $D^{**}$ 的层次，与第 14 节里 $\pi_t$ 收敛到 $D^{**}$ 的处理是同一族手法的两种环境。

## 17. 13 分片第一引理：先用 II_1 因子摊薄秩，再用层叠加消超额

(a) 原文（`13_nonunital_selection.tex:11-17`）：

> For $g\in A_+$ and $\xi>0$ there is a positive contraction $k$ in a finite
> matrix algebra over $A$ such that, for every $\sigma\in T$,
> \begin{equation}\label{n:eq:rank}
>  |\sigma(k)-\sigma(g)|<\xi,\qquad
>  0\le d_\sigma(k)-\sigma(k)<\xi.
> \end{equation}

(b) 中间步骤分三段。第一段造小秩元素（`:20-31`）：取 $T$ 的极值点，其 tracial GNS 表示是因子表示；表示 faithful（单性）且维数无穷，因为有限维因子会迫使 $A$ 有限维；所以它是 II_1 因子，含任意尺寸的矩阵单位。经 `\ref{n:eq:kaplansky}` 的满射与逐坐标 order-zero 提升，对每个 $l$ 有非零 order-zero 映射 $M_l\to A$；其对角像的支投影两两正交且在每个 tracial 表示中等价，和的迹至多 $1$，所以每条对角的迹至多 $1/l$；取 $l>1/\xi$ 得非零 $b\in A_+$ 满足 $d_\sigma(b)<\xi$ 对所有 $\sigma\in T$。第二段把迹搬进 hereditary 子代数（`:32-44`）：单性给 $c\in\Her(b)_+$ 使 $|\sigma(c)-\sigma(g)|<\xi$ 在 $T$ 上成立，且不带 $\lVert c\rVert$ 的界；手术是把 $g^{1/2}$ 用 $UD_bV$ 逼近（$U$ 行、$V$ 列、$D_b=\operatorname{diag}(b,\ldots,b)$），使 $(UD_bV)^*(UD_bV)$ 与 $g$ 差 $\xi$；置 $C=(D_bU^*UD_b)^{1/2}\in M_N(\Her(b))$、$v=CV$，每个 $v_j$ 属于 $\overline{bA}$，于是 $c=\sum_j v_jv_j^*\in\Her(b)_+$ 且 traciality 给 $\sigma(c)=\sigma(v^*v)$。第三段层叠加（`:45-55`）：取整数 $N\ge\lVert c\rVert$，令 $f_j(s)=\min(1,\max(0,s-j+1))$，$k=\bigoplus_{j=1}^{N}f_j(c)$；在 $c$ 的谱上 $\sum_j f_j(s)=s$，同时 $0\le\sum_j 1_{\{f_j(s)>0\}}-s\le 1_{\{s>0\}}$；故 $\sigma(k)=\sigma(c)$ 且 $d_\sigma(k)-\sigma(k)\le d_\sigma(c)\le d_\sigma(b)<\xi$。

(c) 三段的分工我起初完全读反了：以为第一段是技术准备、第三段是核心。实际上第三段解决的才是本引理真正的困难，即"迹近似"与"秩近似"的兼容。第一段的 output 只有 $d_\sigma(b)<\xi$，它把 $b$ 的支秩摊薄到 $\xi$ 以下，靠的是 $M_l$ 的 $l$ 条等价正交支投影，摊薄倍数 $1/l$ 可以任意小而不碰 trace 的归一化。第二段只搬迹，不控范数，$\lVert c\rVert$ 可能是任何值，这一点在第三段被 $N\ge\lVert c\rVert$ 吸收掉；这正是"$N$ 不进界"的来源：第三段的两条不等式右端 $\xi$ 与 $N$ 无关，因为 $1_{\{f_j(s)>0\}}$ 的层叠过剩是每层 $[j-1,j]$ 区间上的指示函数与 $s$ 的差，逐点不超过 $1_{\{s>0\}}$。我最初想把这段换成"取 $k$ 为 $g$ 的连续函数截断"，那就必须有 $g\in\Her(b)$，而单性只给迹近似下的 hereditary 包含，给不了元素级包含。

(d) 失败路线（推测）：其一，第一段若直接在 $A$ 里缩放正元素求小秩，$d_\sigma$ 是秩型不变量，缩放不改变它，必须靠矩阵维数摊薄；这里等价支投影的论证还依赖"每个 tracial 表示中"这一全称，若只在一条迹上等价，$d_\sigma(b)<\xi$ 对全体 $\sigma$ 就不成立。其二，第二段若只写"$c$ 在 $\Her(b)$ 里迹逼近 $g$"而不给 $UD_bV$ 的具体分解，第三段要用的严格等号 $\sigma(k)=\sigma(c)$ 无从落地，hereditary 逼近只给近似等号，而近似等号会与 $\xi$ 的预算冲突（$|\sigma(c)-\sigma(g)|<\xi$ 已经把这 $\xi$ 用满）。其三，第三段若 $N<\lVert c\rVert$，谱上 $\sum_j f_j(s)$ 达不到 $s$，迹等式坏掉；这就是 $N\ge\lVert c\rVert$ 的全部作用，我第一遍误以为它还控制误差量级。

## 18. 13 分片选择命题：$\tau(a)\le\tau(z)$ 如何变成 $hp=p$ 的投影

(a) 原文（`13_nonunital_selection.tex:58-64`）：

> Let $h,z,a\in D$ be positive contractions satisfying $hz=z$ and
> $\tau(a)\le\tau(z)$ for all $\tau\in \Lambda$. There is a projection $p\in D$
> such that
> \[
>  hp=p,\qquad \tau(p)=\tau(a)\quad(\tau\in \Lambda).
> \]

(b) 中间步骤（`:66-149`，我按作者自己的四段划分重排）：取正压缩提升 $h_n,z_n,a_n$，置 $\alpha_n=\sup_{\sigma\in T}(\sigma(a_n)-\sigma(z_n))_+$、$\beta_n=\lVert(1-h_n)z_n\rVert_{2,T}$，两者沿 $\omega$ 趋于零；选 $0<\delta_n<1$ 慢到 $\beta_n/\delta_n\to_\omega0$，置 $\gamma_n=\alpha_n+\beta_n/\delta_n+\delta_n$、$H_n=(h_n-1+\delta_n)_+$。在 tracial 表示里 $H_n$ 的支 $Q$ 满足 $\delta_n(1-Q)\le 1-h_n$，于是 tracial Cauchy--Schwarz 给 $\sigma(z_n)\le\sigma(Q)+\sigma((1-Q)z_n)\le d_\sigma(H_n)+\beta_n/\delta_n$，进而 $\sigma(a_n)\le d_\sigma(H_n)+\gamma_n$。对 $g=a_n$、$\xi=\gamma_n$ 用引理 `\ref{n:lem:rank}` 得 $k_n$；另取 $u\in A$ 正压缩使 $\inf_T\sigma(u)>7/8$，把同一引理用于 $8\gamma_n u$ 得 $c_n$，满足 $5\gamma_n\le d_\sigma(c_n)\le10\gamma_n$；在互不相关的有限矩阵块里有 $d_\sigma(k_n)\le d_\sigma(H_n)+3\gamma_n<d_\sigma(H_n\oplus c_n)$（`:102-103`），于是比较假设（目标非零、各坐标秩有限、密有限迹都是 $T$ 的倍数）给 $k_n\precsim H_n\oplus c_n$。接下来是带 trace 控制的 cutdown（`:109-133`）：写 $b=H_n\oplus c_n$，取 $x$ 使 $\lVert x^*bx-k\rVert<1/4$，置 $d=(k-1/2)_+^{1/2}$、$y=b^{1/2}xd$，则 $\lvert y\rvert^2\ge d^2/4$；在 bidual 中取极分解 $y=v\lvert y\rvert$，$d$ 的支在 $v^*v$ 之下，且 $\lVert(\lvert y\rvert+\epsilon)^{-1}d\rVert\le2$、$\lVert vd-y(\lvert y\rvert+\epsilon)^{-1}d\rVert\le2\epsilon$；令 $w=\sqrt2\,vd$，得 $w^*w=2(k-1/2)_+$、$r=ww^*\in\Her(b)$、$0\le r\le1$。对 $f(s)=2(s-1/2)_+$ 有标量不等式 $0\le s-f(s)\le 1_{\{s>0\}}-s$ 与 $0\le f(s)-f(s)^2\le 1_{\{s>0\}}-f(s)$，traciality 把它们从 $f(k_n)=w^*w$ 传到 $r_n=ww^*$，于是 $|\sigma(r_n)-\sigma(a_n)|$ 与 $\sigma(r_n-r_n^2)$ 沿 $\omega$ 一致趋于零。最后压缩到 $H_n$ 的矩阵槽（`:135-146`）得 $p_n$，补角由 $c_n$ 支撑故至多丢 $10\gamma_n$ 的迹；亏量恒等式 $Pr_nP-(Pr_nP)^2=P(r_n-r_n^2)P+Pr_n(1-P)r_nP$ 的末项迹至多 $d_\sigma(c_n)$（用 $r_n^2\le r_n$）；于是 $|\sigma(p_n)-\sigma(a_n)|$ 与 $\sigma(p_n-p_n^2)$ 都至多 $12\gamma_n$，且 $p_n\in\Her(H_n)$ 给 $\lVert(1-h_n)p_n\rVert\le\delta_n$。

(c) $\gamma_n$ 的三项各挡一个坑，我逐个对过：$\alpha_n$ 是"迹不等式在坐标上不成立"的超额，$\beta_n/\delta_n$ 是"$h_nz_n=z_n$ 在坐标上只是近似"的支亏损摊薄，$\delta_n$ 是 $H_n$ 相对 $h_n$ 的切割损失，第三项同时控制 $\lVert(1-h_n)p_n\rVert$。$\delta_n$ 必须双极限（趋于零且 $\beta_n/\delta_n$ 趋于零），这是本原坐标系下常见的取法，我第一遍以为作者写得冗余。

严格不等式那一步的常数余量我全部算过，值得记下，因为 $7/8$ 与 $8$ 这两个数看着刺眼。上界：$d_\sigma(c_n)\le\sigma(c_n)+\gamma_n\le 8\gamma_n\lVert u\rVert+\gamma_n=9\gamma_n\le10\gamma_n$。下界：$d_\sigma(c_n)\ge\sigma(c_n)\ge\sigma(8\gamma_n u)-\gamma_n\ge 8\gamma_n\cdot\tfrac78-\gamma_n=7\gamma_n-\gamma_n=6\gamma_n\ge5\gamma_n$。左边：$d_\sigma(k_n)\le\sigma(k_n)+\gamma_n\le\sigma(a_n)+2\gamma_n\le d_\sigma(H_n)+3\gamma_n$。三项合起来给 $d_\sigma(H_n)+3\gamma_n<d_\sigma(H_n)+5\gamma_n\le d_\sigma(H_n\oplus c_n)$，中间余量 $2\gamma_n$。所以 $7/8$ 的作用是保证辅助块的秩与它的 trace 同阶（II_1 里 $\inf\sigma(u)>7/8$ 意味着 $u$ 的支几乎全空间），$8$ 的作用是把 $c_n$ 的量级顶到 $\gamma_n$ 的常数倍上，两个数都不是精度要求，只是把余量凑成整数倍。$w=\sqrt2\,vd$ 的 $\sqrt2$ 我也核过：它使 $w^*w=2d^2=2(k-1/2)_+=f(k_n)$，从而落在 $[0,1]$ 内且 $r=ww^*$ 是正压缩。

(d) 失败路线（推测）：其一，我最初打算只用比较假设的标准推论（Cuntz 次等价给 $w$ 使 $w^*w=f(k_n)$）然后取 $r=ww^*$ 就完事，但这样拿不到 $\sigma(r_n-r_n^2)$ 的界；作者在这里多写了两条标量不等式并把它们经 traciality 从 $w^*w$ 传到 $ww^*$，才是"迹也受控"的那半步，而这半步正是整个命题给出严格 $\tau(p)=\tau(a)$ 的原因。其二，若把辅助块 $c_n$ 去掉、直接用 $k_n\precsim H_n$，严格不等号 $d_\sigma(k_n)<d_\sigma(H_n)$ 一般拿不到（只有一般不等式），比较假设需要的是"目标秩严格大"这一形式的可加性版本；$c_n$ 就是买这个严格性的缓冲区，代价是后来压缩时要丢掉它并付出 $10\gamma_n$。其三，$12\gamma_n$ 的具体组合我没能从原文完全复原（原文只给结论），按我的推算它来自"辅助块迹上界 $10\gamma_n$ 加上 cutdown 自带的 $\gamma_n$ 与层叠余量 $\gamma_n$"，属推测；要紧的只是它是 $\gamma_n$ 的常数倍，沿 $\omega$ 消失。其四，末段"$p=[(p_n)]$ 是投影，因为正压缩亏量的 trace 趋于零于是 uniform $2$-norm 趋于零"（`:147-149`）依赖 12 分片 `\ref{n:lem:unit}` 的检零性；若在那里改用逐条迹的商，这句话会退化为"在每条迹上是投影"，而后续对角化与中心化都需要同一条范数。

## 19. 13 分片收尾：一侧代价引理与它的矩阵化推论

(a) 原文（`13_nonunital_selection.tex:152-158`）：

> Let $q\in D$ be a projection, $Y\in(qDq)_+$, $0<t<1$, and
> $\varepsilon>0$. There is a projection $r\le q$ such that, for $\tau\in \Lambda$,
> \begin{equation}\label{n:eq:cost-corner}
>  \tau(r)=t\tau(q),\qquad
>  \tau(rY)\le t\bigl(\tau(Y)+\varepsilon\tau(q)\bigr).
> \end{equation}

(b) 中间步骤（`:160-199`）：三个退化情形先行处理（$q=0$ 取 $r=0$；$Y=0$ 直接对 $(h,z,a)=(q,q,tq)$ 用选择命题；一般情形靠缩放 $Y$ 与容差归约到 $0\le Y\le q$，以下函数都在单侧角 $qDq$ 中对 $Y$ 求值）。取大整数 $m$，令 $F_0=0$、$F_m=1$；对 $1\le j<m$，$F_j$ 在 $(j-\tfrac12)/m$ 之前为 $1$，线性降到 $j/m$ 处为 $0$，其后为零；$G_j$ 在 $j/m$ 之前为 $1$，到 $(j+\tfrac13)/m$ 降为零，$G_m=1$。两组函数满足 $G_jF_j=F_j$ 与 $F_{j+1}G_j=G_j$。递归取投影 $r_j$ 使 $G_jr_j=r_j$、$\tau(r_j)=t\tau(F_j-F_{j-1})$：设 $R=\sum_{i<j}r_i$，则 $F_jR=G_jR=R$ 且 $\tau(R)=t\tau(F_{j-1})$，对 $(h,z,a)=(G_j-R,\;F_j-R,\;t(F_j-F_{j-1}))$ 用选择命题；三者是正压缩，$hz=z$，且 $\tau(z)-\tau(a)=(1-t)\tau(F_j)\ge0$；选出的投影与 $R$ 正交、在 $q$ 之下、被 $G_j$ 固定。求和得 $r=\sum_j r_j$，$\tau(r)=t\tau(q)$。谱支撑条件给 $r_jYr_j\le\tfrac{j+1/3}{m}r_j$，而 $F_j-F_{j-1}$ 的支在至少 $(j-\tfrac32)/m$ 上，两个阈阈之差 $11/(6m)<2/m$；于是 $\tau(rY)\le t\sum_j\tfrac{j+1/3}{m}\tau(F_j-F_{j-1})\le t(\tau(Y)+(2/m)\tau(q))$，取 $2/m<\varepsilon$。

(c) 我对 $hz=z$ 这条前提能不能成立心里没底，逐乘展开才确认它是 $F_{j+1}G_j=G_j$ 的全部用途：$(G_j-R)(F_j-R)=G_jF_j-G_jR-RF_j+R=F_j-R-R+R=F_j-R=z$，其中用了 $G_jF_j=F_j$、$G_jR=R$、$F_jR=R$ 三条，前两条来自 $r_i$ 被 $G_i$ 固定且 $i<j$ 时 $G_i\le F_j$、$G_i\le G_j$ 的逐项继承。迹不等式也是同样干净：$\tau(F_j-R)-t\tau(F_j-F_{j-1})=\tau(F_j)-t\tau(F_{j-1})-t\tau(F_j)+t\tau(F_{j-1})=(1-t)\tau(F_j)\ge0$。也就是说，$F$ 与 $G$ 两套阶梯的存在只为一个目的：让第 $j$ 步的支撑条件与上一步已用掉的投影相容，使得选择命题的前提每步都能重新满足。我一开始想用单一阶梯（只用 $F_j$）做这件事，那时 $h$ 与 $z$ 无法同时来自同一阶梯，$hz=z$ 就破。

(c) 另一处关键是这个界只有单侧。$\tau(rY)$ 只被上界控制，没有对称的下界；$F_j$ 与 $G_j$ 的阈值错位（$r_j$ 的谱支撑至多 $(j+\tfrac13)/m$，$F_j-F_{j-1}$ 的谱支撑至少 $(j-\tfrac32)/m$）恰好也是单侧设计：把"$r_j$ 落在哪段谱"往高估、把"$F_j-F_{j-1}$ 携带多少迹"往低估，两头都朝同一方向偏，才有 $\tau(rY)$ 相对 $t\tau(Y)$ 的超出量 $\le 2/m$。若 $rY$ 也要求下界，就必须把 $r_j$ 限制在精确的谱带里，而选择命题给不了这种限制（它只保证 $hp=p$ 与迹相等）。14 分片 $Y_i=s_{i-1}+KE_i$ 的用法完全只需要这个上界形式，两侧代价会白白付出可分性论证。

(a) 原文（`13_nonunital_selection.tex:202-208`）：

> If $E\subset D$ is finite dimensional and unital, $Y\in D_+$,
> $0<t<1$, and $\varepsilon>0$, there is a projection $p\in D\cap E'$ with
> \begin{equation}\label{n:eq:cost}
>  \tau(pd)=t\tau(d)\quad(d\in E),\qquad
>  \tau(pY)\le t\bigl(\tau(Y)+\varepsilon\bigr)\quad(\tau\in \Lambda).
> \end{equation}

(b) 中间步骤（`:210-218`）：对尺寸 $l$ 的矩阵 summand（矩阵单位 $e_{ij}$）在角 $e_{11}De_{11}$ 中对可观察量 $l^{-1}\sum_j e_{1j}Ye_{j1}$ 用角内引理，再把得到的投影沿对角用矩阵单位重复；重复后的投影与该 summand 交换并把它的各条迹按比例劈开；代价是所选角代价的 $l$ 倍；对所有正交 summand 相加得 `\ref{n:eq:cost}`，因为它们的单位之和为 $1_D$。

(c) 这个推论就是非单侧一侧的"中心化"入口，与第 11--13 节单侧路线里的中心对角引理扮演同一角色，但构造上简单得多：单侧那边要把 $r$ 做成自伴酉元并对 $S$ 中每条迹中心化（`09_unital_centering.tex:262-270`），这边只需一个与有限维 $E$ 交换的投影，代价是 $\tau(pd)=t\tau(d)$ 对 $d\in E$ 严格成立。$l^{-1}$ 与 $l$ 的互逆因子我验算过：可观察量取 $l^{-1}\sum_j e_{1j}Ye_{j1}$ 是它的归一化对角平均，$e_{11}$ 角里的代价 $\varepsilon'\tau(e_{11})$ 沿对角重复 $l$ 次后累成 $l\varepsilon'\tau(e_{11})$，而 $\tau(e_{11})=\tau(1_{\text{summand}})/l$，所以每个 summand 的净代价是 $\varepsilon'\tau(1_{\text{summand}})$，对 summand 求和给 $\varepsilon'\tau(1_D)=\varepsilon'$。因此 $\varepsilon$ 里不含矩阵尺寸，这与推论陈述中 $\tau(pY)\le t(\tau(Y)+\varepsilon)$ 不带 $\tau(q)$ 因子一致。这跟第 13 节里 $N_0=\sum_\ell n_\ell$ 必须除进容差的情形形成对照：那里是中心化元素数目不受控，这里是矩阵尺寸看似不受控却被归一化抵消。

(d) 失败路线（推测）：其一，若角 $e_{11}De_{11}$ 里的引理直接对 $Y$ 本身用（不取 $l^{-1}\sum_j e_{1j}Ye_{j1}$），得回的投影只中心化 $e_{11}$，沿对角重复时不同对角位置选出的投影彼此不正交，迹的按比例劈开会失败。其二，若 $E$ 非单侧，单位之和不为 $1_D$，推论里的 $\varepsilon$ 项要乘上 $\tau(1_E)$；14 分片使用的 $D_i$ 全是单侧有限维子代数（`:36` 与 `:93` 的 $D_i=\C(1-Q)+Q\pi(D_i^0)$ 显式添了单位），所以不需要这个扩展。其三，$Y\in D_+$ 而推论内引理要 $Y\in(qDq)_+$，$q=1_D$ 时两者同形，这就是我为什么在归约阶段对 $Y$ 做缩放到 $0\le Y\le 1_D$ ，并非别的界。

## 20. 14 分片：模型平均里分离泛函那一手

(a) 原文（`14_nonunital_models.tex:34-42`）：

> For a finite set $\mathcal F$ of self-adjoint contractions in $A$ and
> $\Delta>0$, there are unital finite-dimensional subalgebras $D_i\subset D$,
> self-adjoint contractions $x^{(i)}\in D_i$ for each $x\in\mathcal F$, and
> positive weights $w_i$ summing to one, such that
> \begin{equation}\label{n:eq:models}
>  E_i=\sum_{x\in\mathcal F}(x-x^{(i)})^2,
>  \qquad \sum_iw_i\tau(E_i)<\Delta\quad(\tau\in \Lambda).
> \end{equation}

(b) 中间步骤（`:44-66`）：考虑所有有限维单侧 $E^0$、order-zero 映射 $\theta:E^0\to A$ 与自伴压缩 $b_x\in E^0$，误差函数 $L(\sigma)=1-\sigma(\theta(1))+\sum_{x\in\mathcal F}\sigma((x-\theta(b_x))^2)$ 是 $T$ 上非负连续仿射函数。固定 $\sigma$ 时用 `12_nonunital_framework.tex:92-95` 的 hyperfiniteness 在 $M_\sigma$ 里取有限维单侧子代数按 $2$-norm 逼近该元组（仍用自伴压缩），经 `\ref{n:eq:kaplansky}` 提升并选一个坐标，使 $L(\sigma)$（含单位亏量项）任意小。断言：对每个 $\kappa>0$ 存在有限凸组合使最大值小于 $\kappa$。反证：否则把该凸包与开凸集 $\{f\in C(T,\R):\max_T f<\kappa\}$ 分离，分离泛函正（因为后者对加任意负函数封闭），归一化为概率测度 $\mu$，其 barycenter $\sigma_\mu\in T$（$T$ 紧凸），仿射性给 $L(\sigma_\mu)=\int L\,d\mu\ge\kappa$ 对每个候选 $L$ 成立，矛盾。记结果为 $D_i^0,\theta_i,b_{i,x},w_i$。

(c) 这一手是我这次读全文得到的最大方法论收获。第 9--10 节单侧路线里，我在 HKW 分解上付出 $M$ 无界的代价（第 14 节记的 clipping）才换来"权重求和，并非逐项求和"；这里的写法完全平行但更省：单个模型的尺寸压根不进估计，做法是先把逐迹的近似打包成 $T$ 上的连续仿射函数，再用凸性把"每点任意小"升级成"凸组合的最大值任意小"。这里用到的只有紧凸性与分离定理，没有可分性、没有覆盖数、没有块数。被分离泛函的"正性"这个细节我起初当显然，它是从 $\{f:\max_T f<\kappa\}$ 对加任意负函数封闭来的，否则分离泛函可能带符号部分，无法归一化为测度，也就没有 barycenter 落在 $T$ 里这件事。

(d) 失败路线（推测）：其一，若跳过凸平均而试图在单条迹 $\sigma$ 上取一个模型然后声明界对全体 $T$ 成立，$\theta$ 的选取依赖 $\sigma$，$M_\sigma$ 里的有限维子代数在另一条迹 $\sigma'$ 下可能毫无逼近力；作者必须声明在每个 $\sigma$ 处 $L(\sigma)$ 可任意小（`:55-57`），这个全称才能进入分离论证。其二，若用 $C(T)$ 上的紧集覆盖加逐块模型，块数会进界，这正是第 14 节末尾我说过的"块数不进界"动机在另一条路线上的体现。其三，$E_i$ 用平方和 $\sum_x(x-x^{(i)})^2$ ，并非范数和，是为了让 $\tau(E_i)$ 与 tracial $L^2$ 几何直接对接，后面 `14_nonunital_models.tex:203` 的 $|\tau(p_i(x-x^{(i)}))|\le\sqrt{t_i\tau(p_iE_i)}$ 就是 Cauchy--Schwarz 对平方和的开根；若用范数和，那里只剩 $\sum_x\lVert x-x^{(i)}\rVert$ 型的粗界，$\lambda^{3/2}$ 会变成 $\lambda$。

(a) 原文（`14_nonunital_models.tex:68-95`）：

> We next replace each $\theta=\theta_i$, now viewed in $D$, by a
> homomorphism on a projection, controlling the loss of unit trace by
> the original unit defect. Write $\theta=h\pi$, and put
> $f(s)=(2s-1)_+$, $g(s)=\min(1,2s)$. For the $e_{11}$ corner of a matrix
> summand, apply Proposition~\ref{n:prop:selection} to
> \[
>  (g(\theta(e_{11})),f(\theta(e_{11})),f(\theta(e_{11}))).
> \]
> ... Set $D_i=\C(1-Q)+Q\pi(D_i^0)$ and $x^{(i)}=Q\pi(b_{i,x})$.

(b) 中间步骤：支撑式 $\theta=h\pi$ 来自 `12_nonunital_framework.tex:64-68`。选择命题的三元组用 $(h,z,a)=(g(\theta(e_{11})),f(\theta(e_{11})),f(\theta(e_{11})))$：支撑条件 $hz=z$ 就是 $gf=f$（逐点验：$s\ge\tfrac12$ 时 $g=1$、$f=2s-1$，乘积 $=f$；$s<\tfrac12$ 时 $f=0$），迹不等式取等号；得投影 $v$ 满足 $g(\theta(e_{11}))v=v$、$\tau(v)=\tau(f(\theta(e_{11})))$，且 $v\le\pi(e_{11})$。$\pi(e_{j1})v\in D$ 因为 $\pi(e_{j1})g(\theta(e_{11}))=\pi(e_{j1})g(h)\in D$（这里是 `12_nonunital_framework.tex:69-70` 的 $f(h)\pi(d)\in D$，用 $f(0)=0$ 的函数 $g$）。沿每个矩阵对角重复 $v$ 并对 summand 求和得 $Q\in D$，它与 $\pi(D_i^0)$ 交换且 $Q\pi(d)\in D$；traciality 与重复给 $\tau(Q)=\tau(f(h))$。

(c) 我第一遍把这段当成第 14 节（HKW 与 $\pi_t$ 收敛）的重复劳动，读完发现它比单侧版本轻：单侧那里需要论证 $\pi_t$ 逐点强收敛到单射同态、$p\le\pi(e_{11})$ 与 $v_s\in D$（`10_unital_averaging.tex:57-63` 与 `:177-179`），这里直接拿支撑式与 $f(h)\pi(d)\in D$ 一条引理就把矩阵单位放回 $D$，原因是 $v$ 由选择命题在 $D$ 中取得（选择命题的输出在 $D$ 里），而单侧版本需要额外的 $g(s)=k(s)/s$ 论证。作者还专门写了一句 "No commutation of $Q$ with $h$ is needed"（`:95`），这句对我是个提醒：若误以为要 $Q$ 与 $h$ 交换，就会去要求 $g$ 与 $f$ 交换（它们确实交换，因为是同一元素的函数）并把论证绕向不必要的方向；真正需要的是 $Q$ 与 $\pi(D_i^0)$ 交换，那靠沿对角重复同一投影的矩阵单位技巧得到。

(c) 误差迁移的常数：$\lVert\theta(b)-Q\pi(b)\rVert_{2,\tau}\le\lVert 1-h\rVert_{2,\tau}+\lVert 1-Q\rVert_{2,\tau}\le(1+\sqrt2)\tau(1-h)^{1/2}$，用了 $1-f(s)\le 2(1-s)$ 使 $\lVert1-Q\rVert_{2,\tau}^2=\tau(1-f(h))\le 2\tau(1-h)$，故 $\sqrt2$ 来自这个因子 $2$ 的开根。与 $m=\lvert\mathcal F\rvert$、$C_0=(1+\sqrt2)^2$ 合成 $\tau(E_i)\le 2\sum_x\tau((x-\theta_i(b_{i,x}))^2)+2mC_0\tau(1-\theta_i(1))$，加权后不超过 $(2+2mC_0)\kappa$，取 $\kappa$ 足够小；界从 $T$ 搬到 $\Lambda$ 靠 `\ref{n:lem:unit}`（`:109`）。这里 $2mC_0$ 中 $m$ 的来历值得盯住：单位亏量项在平方和 $E_i$ 里对每个 $x\in\mathcal F$ 各贡献一次，所以 $\lvert\mathcal F\rvert$ 进界；而模型个数完全不进界（`:31-32` 明说 "The number of models may grow as the accuracy improves; only their weighted total error will enter the next construction"）。

(d) 失败路线（推测）：其一，若把 $v$ 直接在 $D^{**}$ 里取 $\pi(e_{11})$ 而不走选择命题，$Q$ 会落在 $D^{**}\setminus D$，与第 14 节我记过的同一坑一样：后续中心化与对角化都在 $D$ 内做，出 $D$ 即断。其二，$f(s)=(2s-1)_+$ 与 $g(s)=\min(1,2s)$ 的阈值 $\tfrac12$ 与 $1/2$ 我试着挪动过：$f=(s-\eta)_+$ 时 $g$ 需为 $(s-\eta)_+/\,$ 型，迹等式与 $\tau(1-h)$ 的关系会多出 $\eta$ 相关常数，且 $g(\theta(e_{11}))$ 未必 $\le 1$；这个选择与 13 分片 cutdown 里 $f(s)=2(s-\tfrac12)_+$ 是同一个 $1/2$ 阈值的两次使用，两处都是为了让支撑条件恰好取等。其三，若 $D_i^0$ 的某些 summand 在 $\pi$ 下像为零，作者的处理是"零像 summand 直接不存在"（`:94-95`），我最初想给它们保留 $\C$ 单位，那会让 $Q$ 的迹多出与像无关的项，$\tau(Q)=\tau(f(h))$ 不再成立。

## 21. 14 分片后半：截断引理与 $\lambda^{3/2}$ 的出处

(a) 原文（`14_nonunital_models.tex:121-136`）：

> Let $p_1,\ldots,p_N$ be projections in a unital $C^*$-algebra with a
> tracial state $\tau$. Put
> \[
>  s=\sum_ip_i,\qquad e=\min(s,1),\qquad
>  \lambda=\sum_i\tau(p_i),\qquad R=\sum_i\tau\Bigl(p_i\sum_{j<i}p_j\Bigr).
> \]
> For every self-adjoint $x$,
> \begin{equation}\label{n:eq:trunc-comm}
>  \|[e,x]\|_{2,\tau}
>  \le2\Bigl(2\sum_i\|[p_i,x]\|_{2,\tau}^2\Bigr)^{1/2}.
> \end{equation}
> Moreover,
> \begin{equation}\label{n:eq:trunc-trace}
>  \tau(s-e),\ \tau(e-e^2)\le\sqrt{2\lambda R}.
> \end{equation}

(b) 中间步骤（`:138-171`）：交换子部分用未归一化矩阵迹，置 $W=(p_1,\ldots,p_N)$、$V=\begin{pmatrix}0&W\\W^*&0\end{pmatrix}$、$Z=\operatorname{diag}(x,\ldots,x)$；对 $l(r)=\min(r^2,1)$，$l(V)$ 的首对角角恰为 $e$，且 $l$ 全局 2-Lipschitz；左右乘 $V$ 是 tracial $L^2$ 上交换的自伴算子，联合谱演算给 $\lVert[l(V),Z]\rVert_2\le 2\lVert[V,Z]\rVert_2$；右边平方（在乘 $4$ 之前）是 $2\sum_i\lVert[p_i,x]\rVert_{2,\tau}^2$；压缩到首角得 `\ref{n:eq:trunc-comm}`。作者补了一句 "This argument uses scalar Lipschitzness on $L^2$, not operator-norm Lipschitzness"（`:154-155`）。迹部分：$S$ 为 $s$ 在 tracial von Neumann 表示里的支；行 $W$ 被 $\operatorname{diag}(p_1,\ldots,p_N)$ 右侧支撑，故极分解给 $\tau(S)\le\lambda$；由 $\tau(s^2)=\lambda+2R$ 得 $\tau((s-S)^2)=2R-\lambda+\tau(S)\le 2R$；$s-e$ 与 $e-e^2$ 均正、被 $S$ 支撑且不超过 $\lvert s-S\rvert$；Cauchy--Schwarz 给 $\tau(\lvert s-S\rvert)\le\tau(S)^{1/2}\tau((s-S)^2)^{1/2}\le\sqrt{2\lambda R}$。

(c) 谱截断在这里回来了，但与第 14 节的 clipping 处境不同：$l(r)=\min(r^2,1)$ 在 $[0,\infty)$ 上标量 2-Lipschitz（导数 $2r$ 与 $0$，在 $r=1$ 处连接；$|l(a)-l(b)|\le 2|a-b|$ 对全体非负实数成立），所以在 tracial $L^2$ 上保持，而在算子范数下矩阵值函数 $r\mapsto\min(r^2,1)$ 并非算子 Lipschitz（这是 Klein--Koosis 型的反例区）。作者把这一点明写出来，说明他知道同一手法在第 14 节给的是范数界、在这里只能给 $2$-norm 界。我的第一反应是"能不能用同一个截断技巧把单侧路线里的 clipping 改成 $2$-norm 版本从而省掉 $R^{-3}$ 与 $R^{-2}$ 两项"，答案是不能：第 14 节的界需要对全体的 $\tau(bz)$ 型陈述在 $\lVert b\rVert\le1$ 下一致，靠的是 $|s-g_R(s)|\le|s|^4/R^3$ 这类标量逐项界，与 Lipschitz 常数无关；这里 $e$ 只需进入 $\lVert\cdot\rVert_{2,\tau}$ 型界，两者对截断函数的要求不同。

(c) $\tau(s^2)=\lambda+2R$ 我展开验过：$s^2=\sum_{i,j}p_ip_j$，$\tau(p_ip_j)=\tau(p_jp_i)$，对角项和为 $\lambda$，非对角项按 $j<i$ 与 $i<j$ 配对各贡献 $R$。$\tau(S)\le\lambda$ 靠 $W$ 的右支撑维数：$W^*W=\sum_ip_i$ 的支就是 $S$，而行向量在 tracial $L^2$ 里的支迹不超过其行元素迹之和。这两条合起来使 $\sqrt{2\lambda R}$ 同时含"总迹"与"两两重叠"，与 $N$ 无关，这正是本节开头（`:115-119`）声明的目的：和式 $\sum p_i$ 未必是压缩，必须截断，而截断代价要与模型个数无关。

(d) 失败路线（推测）：其一，若不截断而直接用 $s$，$\tau(sx)-\lambda\tau(x)$ 的界仍然成立，但 $s$ 的范数可达 $N$，而 16 分片要的正压缩必须在单位区间内才能谈投影亏量；作者选择付出 $\sqrt{2\lambda R}$ 换回压缩性。其二，若把 $e=\min(s,1)$ 换成 $(1+s)^{-1}s$ 之类的连续函数，$l(V)$ 首对角不再是 $e$（矩阵值函数与取角不交换），压缩到首角的技巧失效，只有 $l$ 为多项式或有理函数时才易处理，而 $\min$ 不是。其三，$\tau(S)\le\lambda$ 若只由 $\tau(S)\le\tau(s)$ 粗估，$\tau(s)=\lambda$ 恰好也行，但 $s$ 的支与 $S$ 的关系仍需极分解论证，作者用 $W$ 的右支撑一句话解决了；我第一遍误以为需要 $\tau(S)$ 与 $\lambda$ 的更精细关系。

(a) 原文（`14_nonunital_models.tex:173-195`）：

> We first work in $D$. Choose a large parameter $K>1$, and apply
> Proposition~\ref{n:prop:models} with $\Delta=K^{-2}$. Recursively use
> Corollary~\ref{n:cor:cost} to choose $p_i\in D\cap D_i'$ with
> \[
>  t_i=\lambda w_i,\qquad Y_i=s_{i-1}+KE_i,\qquad
>  s_j=\sum_{i\le j}p_i,
> \]
> and tolerance $K^{-1}$. ...
> \begin{align}
>  R_\tau+KH_\tau
>  &\le\sum_it_i\Bigl(\sum_{j<i}t_j+K\tau(E_i)+K^{-1}\Bigr)
>  \le\lambda^2/2+2\lambda/K.\label{n:eq:joint-cost}
> \end{align}

(b) 中间步骤（`:197-221`）：$p_i$ 与 $x^{(i)}$ 交换（$p_i\in D\cap D_i'$），故对 $x\in\mathcal F$ 有 $\sum_i\lVert[p_i,x]\rVert_{2,\tau}^2\le 4H_\tau$（把 $(x-x^{(i)})^2$ 的迹展开进 $E_i$）；正泛函 $z\mapsto\tau(p_iz)$ 范数为 $t_i$，故 $|\tau(p_i(x-x^{(i)}))|\le\sqrt{t_i\tau(p_iE_i)}$；标量 Cauchy--Schwarz 与 `\ref{n:eq:models}` 合给 $|\tau(sx)-\lambda\tau(x)|\le\sqrt{\lambda H_\tau}+\lambda/K$。置 $e_D=\min(s,1)$，截断引理给 $\lVert[e_D,x]\rVert_{2,\tau}\le 2\sqrt{8H_\tau}$、$\tau(s-e_D)$ 与 $\tau(e_D-e_D^2)\le\sqrt{2\lambda R_\tau}$；把 $s$ 换成 $e_D$ 在矩等式上最多多付 $\tau(s-e_D)$；由 `\ref{n:eq:joint-cost}`，$K\to\infty$ 时迹与投影亏量界趋于 $\lambda^{3/2}$，交换子界趋于零；取 $K$ 使严格不等式有余量小于 $\rho$，正压缩提升加一个良好坐标把结论搬回 $A$。

(c) 联合代价 $\tau(p_iY_i)\le t_i(\tau(Y_i)+K^{-1})$ 一次给出 $R_\tau+KH_\tau$ 两项，这是我读到本节最欣赏的一处设计。展开：$\tau(p_i(s_{i-1}+KE_i))\le t_i(\tau(s_{i-1}+KE_i)+K^{-1})$，而 $\tau(s_{i-1})=\sum_{j<i}t_j$、$\tau(p_iE_i)$ 被 $K$ 乘进去，对 $i$ 求和得 $R_\tau+KH_\tau\le\sum_it_i(\sum_{j<i}t_j+K\tau(E_i)+K^{-1})$。三项分别：$\sum_it_i\sum_{j<i}t_j\le\lambda^2/2$（$\sum w_i=1$ 与 $t_i=\lambda w_i$，严格说它等于 $\lambda^2\sum_{j<i}w_iw_j\le\lambda^2/2$）；$\sum_it_iK\tau(E_i)=\lambda K\sum_iw_i\tau(E_i)<\lambda K\Delta=\lambda/K$（$\Delta=K^{-2}$）；$\sum_it_iK^{-1}=\lambda/K$。合起来 $\lambda^2/2+2\lambda/K$，与 `:192` 一致。于是 $H_\tau\le\lambda^2/(2K)+2\lambda/K^2$（除以 $K$），代回 $\sqrt{\lambda H_\tau}$ 得 $\lambda\sqrt{\lambda/(2K)+2/K^2}\to0$。等等：若 $K\to\infty$ 则 $\sqrt{\lambda H_\tau}\to0$，而迹亏量目标 $\lambda^{3/2}$ 从哪里来？看 $\sqrt{2\lambda R_\tau}$：$R_\tau\le\lambda^2/2+2\lambda/K$，故 $\sqrt{2\lambda R_\tau}\le\sqrt{\lambda^3+4\lambda^2/K}\to\lambda^{3/2}$。$H_\tau$ 那一项除以 $K$ 所以是 $O(\lambda^2/K)$，进 $\sqrt{\lambda H_\tau}$ 为 $O(\lambda^{3/2}/\sqrt K)$，也趋于零。两者相加，极限 $\lambda^{3/2}$ 由 $R_\tau$ 的 $\lambda^2/2$ 项提供，这是整个构造里唯一不可压的误差来源。

(c) 所以 $\lambda^{3/2}$ 的 $3/2$ 次幂有明确的组合理由：$\lambda$ 来自所选投影的总迹，$R_\tau$ 里的 $\lambda^2/2$ 来自两两重叠（无序对计数除以 $2$），二者在 $\sqrt{2\lambda R_\tau}$ 里合成 $\lambda^{3/2}$。它与模型个数、矩阵尺寸、$\lvert\mathcal F\rvert$ 都无关，这正是 16 分片能用 $\lambda^{-1}$ 步放大到任意比例的前提：每步代价 $\lambda^{3/2}$、步数 $\lambda^{-1}$，累积 $\lambda^{1/2}\to0$（`16_nonunital_amplification.tex:4-8` 的说明）。

(d) 失败路线（推测）：其一，$Y_i$ 里 $K$ 的选择是自由参数，我试着把 $Y_i=s_{i-1}+E_i$（不带 $K$）代进去，那么联合代价给不出 $H_\tau$ 的小界，$R_\tau+H_\tau\le\lambda^2/2+\lambda(1+\Delta)+\lambda K^{-1}$ 里 $K$ 消失，交换子界 $\sqrt{H_\tau}$ 不趋于零；$K$ 的作用就是用同一份代价在重叠与模型误差之间做加权，把权重 $K$ 放在 $E_i$ 上使后者除 $K$ 后更小。其二，若把容差从 $K^{-1}$ 改为与 $i$ 相关（比如 $K^{-1}/N$），代价求和会引入 $N$，破坏"与模型个数无关"。其三，从 $D$ 搬回 $A$ 只取"一个良好坐标"，这一步依赖 `12_nonunital_framework.tex:51-57` 那条通用推论（有限多个连续表达式的 limit-trace 界给沿 $\omega$ 的一致坐标界），我起初以为需要 $\rho$ 与 $\lambda^{3/2}$ 之间的额外留白分配，其实作者用"严格不等式且留白小于 $\rho$"一句话就概括了：先在 $D$ 上取严格不等式，再靠坐标选取落地。

## 22. 16 分片：相对小劈裂、乘积放大与有界对角

(a) 原文（`16_nonunital_amplification.tex:11-18`）：

> For every separable unital $E\subset D$ and $0<\lambda<1$, there is a
> positive contraction $e\in D\cap E'$ such that, for $\tau\in \Lambda$,
> \begin{equation}\label{n:eq:relative-small}
>  |\tau(ex)-\lambda\tau(x)|\le\lambda^{3/2}
>  \quad(x\in E_{\mathrm{sa}},\ \|x\|\le1),
>  \qquad \tau(e-e^2)\le\lambda^{3/2}.
> \end{equation}

(b) 中间步骤（`:20-28`）：取 $E$ 中自伴压缩的稠密序列，每个都表成 $A$ 中的自伴压缩；在坐标 $n$ 对前 $n$ 个代表元用命题 `\ref{n:prop:small}`，$\rho=1/n$；所得序列在 $D$ 中给出正压缩，它与稠密序列的交换子在 uniform $2$-norm 下为零，于是在 $D$ 中为零；对 limit trace 取极限把 `\ref{n:eq:relative-small}` 在稠密序列上证出，范数连续性扩到整个自伴单位球。

(c) 这一步我把"可分性"当成技术假设，其实它是这一句唯一的重量：$E$ 可分才有序列，坐标 $n$ 上才能同时处理前 $n$ 个元素并让 $\rho=1/n\to0$。14 分片的输出只对有限集 $\mathcal F$ 陈述，$A$ 本身可分所以有限集序列可枚举；若 $E$ 不可分（例如 $E=D$），这条提升办法直接失效，而后文所有需要 $E=D\cap A'$ 规模的场合都靠 $A$ 可分来绕。第二处值得记下的是这里 $\lambda^{3/2}$ 的系数从"$+\rho$"变成绝对值：因为 $\rho$ 可以任意小，稠密序列的极限给严格不等式，这正是 `:16` 里不等号没有 $\rho$ 的原因。

(d) 失败路线（推测）：若跳过逐坐标递增而在固定 $n$ 上一次处理整个稠密序列，$\mathcal F$ 无穷，`14_nonunital_models.tex:108` 的 $2mC_0$ 里 $m=\lvert\mathcal F\rvert$ 就发散，模型误差界失去意义。递增 $n$ 与 $\rho=1/n$ 的配对是这个发散的唯一解药。

(a) 原文（`16_nonunital_amplification.tex:38-56`）：

> For an integer $m\ge1$, put $\lambda=1-c^{1/m}$. Successively choose
> $e_1,\ldots,e_m$ from Lemma~\ref{n:lem:relative-small}, enlarging $E$ to
> contain the previous choices at each step. They commute, and
> \[
>  P_j=\prod_{i=1}^j(1-e_i),\qquad P_0=1,
> \]
> are positive contractions commuting with $E$...
>  |\tau(P_mx)-c\tau(x)|\le m\lambda^{3/2}.
> ... Since
> $\lambda\le(-\log c)/m$, both errors tend to zero.

(b) 中间步骤：每步把 $P_{j-1}x$ 当作第 $j$ 步允许的测试元（$E$ 已扩大包含前面所有选择，故 $P_{j-1}x\in E_{\mathrm{sa}}$ 且 $\lVert P_{j-1}x\rVert\le1$），得递推 $|\tau(P_jx)-c\tau(P_{j-1}x)|\le\lambda^{3/2}\lVert P_{j-1}x\rVert$，望远镜求和给 $|\tau(P_mx)-c\tau(x)|\le m\lambda^{3/2}$（$m$ 项各 $\lambda^{3/2}$，且 $(1-\lambda)^m=c$ 逐层替换时留下的几何级数余量被 $\lambda^{3/2}$ 吸收；作者直接写结论，我按 $m$ 项累加核对）。对交换的正压缩 $a,b$ 有 $ab-(ab)^2=b(a-a^2)+a^2(b-b^2)\le(a-a^2)+(b-b^2)$，归纳给 $\tau(P_m-P_m^2)\le m\lambda^{3/2}$。因 $\lambda=1-c^{1/m}\le(-\log c)/m$（用 $1-e^{-t}\le t$，$t=-\log c/m$），两误差均 $\to0$。

(c) 我最初想直接令 $e_i$ 全等于同一个 $\lambda$ 比例的投影，然后取 $P_m$ 的迹极限，那样每步因子 $(1-\lambda)$ 会给出 $(1-\lambda)^m$；$\lambda=1-c^{1/m}$ 的选取使这个乘积恰好等于 $c$，于是目标比例在模型层面精确达成，唯一损失是累积误差 $m\lambda^{3/2}$。这是整段放大论证的核心设计，也是 $\lambda^{3/2}$ 必须优于 $\lambda$ 的原因：$m$ 步放大要求 $m\lambda^{3/2}\to0$ 而 $m\propto\lambda^{-1}$，即 $\lambda^{1/2}\to0$（`:4-8` 的说明）。若 14 分片的误差只是 $O(\lambda)$，放大一步都走不动。

(d) 失败路线（推测）：其一，若不扩大 $E$，第 $j$ 步的测试 $P_{j-1}x$ 不在 $E$ 内，`\ref{n:eq:relative-small}` 不适用；这条与我在第 13 节记过的"逐步添加中心化"是同族现象，那里是 $S_i=C^*(A,r_1,\dots,r_{i-1})$，这里是 $C^*(E,e_1,\dots,e_{j-1})$。其二，$P_m$ 是正压缩，命题要的是投影；作者用对角选取把 $m\to\infty$ 的过程压进一个元素里，我第一遍以为可以直接取 $\omega$-极限（$D$ 中没有这种序极限），白折腾一次。

(a) 原文（`16_nonunital_amplification.tex:58-74`）：

> We spell out the diagonal passage because $E$ need not consist of constant
> sequences. Fix representatives for a dense sequence of self-adjoint
> contractions of $E$. For each $k$, choose $m$ large enough and a positive
> contraction lift $P_n^{(k)}$ so that on an $\omega$-large set $G_k$, the
> first $k$ commutators and trace moments, and the uniform $2$-norm projection
> defect, are all within $1/k$ of their targets. ... Put
> \[
>  F_k=\{n:n\ge k\}\cap G_1\cap\cdots\cap G_k.
> \]
> These sets decrease, belong to $\omega$, and have empty intersection. At
> coordinate $n\in F_1$, use $P_n^{(k(n))}$ for the largest $k(n)$ with
> $n\in F_{k(n)}$; use zero off $F_1$. Then $k(n)\to_\omega\infty$.

(c) 与第 13 节的 $K=\lfloor1/\kappa\rfloor+1$ 那种"有限推进量导出矛盾"不同，这里的递减集技巧是把无穷多个精度等级装进同一条序列：$F_k$ 属于 $\omega$、递减、交为空，所以坐标 $n$ 上"仍有效的最大等级 $k(n)$"沿 $\omega$ 趋于无穷，而每个固定等级最终不再被检查。我把它和第 10 节的采样两轮递推放在一起记，两处都是"沿 $\omega$ 逐坐标提高精度"的同一模板，只是那里的推进量是 $\delta/(2m)$，这里是 $1/k$。第二处细节是作者明说要用 $\tau((P_m-P_m^2)^2)\le\tau(P_m-P_m^2)$ 把投影亏量的 $2$-norm 从 trace 陈述换成平方陈述（`:64-65`），因为 $0\le P_m-P_m^2\le1$；这条标量不等式 $t^2\le t$ 在 $[0,1]$ 上是所有亏量估计的后盾。

(d) 失败路线（推测）：若 $E$ 的元素全是常数序列代表，就不必做这套对角：直接取 $m\to\infty$ 的 $\omega$-极限即可。作者专门写出这一段的理由就是 $E\subset D$ 一般只由非常数序列构成，$P_m$ 依赖 $m$ 与所选代表，没有单一坐标上的收敛可言。若把 $F_k$ 定义里的 $\{n:n\ge k\}$ 去掉，交未必为空，$k(n)$ 可能沿 $\omega$ 有界，误差 $1/k$ 就压不下去。

(a) 原文（`16_nonunital_amplification.tex:77-84`）：

> For every $n\ge2$ there are orthogonal projections $f_1,\ldots,f_n\in
> D\cap A'$ summing to $1_D$ such that
> \[
>  \tau(f_i a)=\frac1n\tau(a)\qquad(a\in A,\ \tau\in \Lambda).
> \]
> In particular, $A$ has uniform property $\Gamma$.

(b) 中间步骤（`:85-95`）：从可分单侧代数 $C^*(A,1_D)$ 出发；第 $j=1,\dots,n-1$ 步把已选投影添进系数代数，用 $c=1/(n-j+1)$ 施命题 `\ref{n:prop:split}`，并把所得投影乘上剩余补元 $q$；因子交换故得 $f_j\le q$；把 `\ref{n:eq:split}` 用于扩大后代数里的 $qa$，归纳有 $\tau(qa)=(n-j+1)\tau(a)/n$，故 $\tau(f_ja)=\tau(a)/n$；最后补元作 $f_n$。作者指出这正是 CETW 一致性质 $\Gamma$ 定义里的投影恒等式（`:94-95`，引 `\cite[Definition 2.1]{CETW}`）。

(c) $c=1/(n-j+1)$ 是望远镜归一：剩余质量 $n-j+1$ 份要均分，每次取 $1$ 份。我核对过 $n=2$ 的情形，此时只有一步，$c=1/2$，输出正是一个把每条 limit trace 与每个 $a\in A$ 同时对半劈的投影，且它自动与 $1_D$ 交换，落在 $D\cap A'$。这里我要把机器侧的记号对齐一句：CETW 的定义只需要 $1/n$ 型劈裂，所以 14 分片的 $\lambda^{3/2}$ 与 16 分片的乘积放大合起来够用；$c$ 为任意实数的 `\ref{n:prop:split}` 是中间强度，不是最终目标。

(d) 失败路线（推测）：若在第 $j$ 步忘记把已选投影添入系数代数，第 $j+1$ 步的输出可能与 $f_j$ 不交换，$f_jf_{j+1}$ 型正交性失效，和式 $\sum f_i=1_D$ 无法保证。若最后一步取 $f_n$ 为补元而不去检查它属于 $D\cap A'$，$q$ 是已选投影的多项式，交换性继承，所以这一步其实免费；我第一遍以为还要再跑一次选择命题，多余。

## 23. 17 分片前半：中心提升与 $\mathcal F_\omega$ 的单位从近似单位来

(a) 原文（`17_nonunital_absorption.tex:2-7`）：

> By \cite[Theorem 4.6 and Definition 4.2]{CETW}, a separable nuclear algebra
> with no finite-dimensional quotients, compact nonempty $T$, and uniform
> property $\Gamma$ admits unital homomorphisms
> \begin{equation}\label{n:eq:mcduff}
>  M_n\longrightarrow D\cap A'\qquad(n\ge1).
> \end{equation}
> The theorem permits nonunital algebras. We verify the passage from
> \eqref{n:eq:mcduff} to the nonunital absorption criterion explicitly.

(c) 这一节的存在理由是接口验证：`\ref{n:eq:mcduff}` 给的是 $D\cap A'$ 里的单侧同态，CLS 的非单侧吸收判据要的是 $\Fw=(\Aom\cap A')/(\Aom\cap A^\perp)$ 里 tracially large 的 order-zero 映射。中间隔着三件事：$\Fw$ 有单位、消影 ideal 落在 $J$ 内、中心像可以提升到 $\Aom\cap A'$。作者逐条验证，并指出第三件就是 CETW Lemma 1.2 的中心满射内容（`:53`）。

(a) 原文（`17_nonunital_absorption.tex:11-25`）：

> \[
>  \Aom=\ell^\infty(A)/\{(a_n):\lim_\omega\|a_n\|=0\},
>  \quad J=\ker(\Aom\to D),
>  \quad \Fw=(\Aom\cap A')/(\Aom\cap A^\perp).
> \]
> ...
> The quotient $\Fw$ is unital, the annihilator is contained in $J$, and
> the map $\Aom\cap A'\to D\cap A'$ is onto. Consequently, for each $n$
> there is an order-zero map $\psi:M_n\to\Aom\cap A'$ satisfying
> $\psi(1)+J=1_D$.

(b) 中间步骤（`:27-57`）：近似单位序列在 $\Aom$ 中定义 $u\in\Aom\cap A'$，对常数 $a\in A$ 有 $ua=a=au$；对 $y\in\Aom\cap A'$，$(uy-y)a=(ua-a)y=0$，左边同理，故 $u$ 在模消影意义下是单位。若 $y$ 消影 $A$，取范数不超过 $M$ 的代表 $(y_n)$：固定 $k$ 有 $\lVert y_nu_k\rVert\to_\omega0$，同时 $\lVert y_n(1-u_k)\rVert_{2,T}^2\le M^2\sup_{\sigma\in T}(1-\sigma(u_k))\to0$（$k\to\infty$），按此顺序取极限得 $y\in J$。满射部分：取 $v\in\Aom$ 提升 $D\cap A'$ 的元素，其与 $A$ 的交换子属于 $J$；对该 ideal 的准中心近似单位给出正压缩 $d^{(k)}\in J$，与 $A$ 中稠密序列前 $k$ 个元素交换到 $1/k$，且 $d^{(k)}[v,a]=[v,a]$ 在这些元素上精确到该精度；选正压缩代表后，在 $\omega$-大集上 uniform $2$-norm 小于 $1/k$、坐标范数误差小于 $2/k$；再用命题 `\ref{n:prop:split}` 里那套递减集选取得 $d\in J\cap A'$ 使 $d[v,a]=[v,a]$ 对一切 $a\in A$，于是 $v-dv$ 是所定元素的中心提升。最后把矩阵 order-zero 提升用于商映射与 `\ref{n:eq:mcduff}` 得 $\psi$，复合到 $\Fw$ 得 $\varphi$，$\psi(1)$ 在 $D$ 中的像为 $1_D$。

(c) 两个极限的顺序我重算过，它是这一小段的全部实质。固定 $k$ 时 $u_k\in A$，$y$ 消影 $A$ 给出 $yu_k=0$ 在 $\Aom$ 中，故坐标 $\lVert y_nu_k\rVert\to_\omega0$；另一侧 $\sup_\sigma(1-\sigma(u_k))\to0$ 靠 `12_nonunital_framework.tex:35-36` 的 Dini 一致收敛；把 $y_n=y_nu_k+y_n(1-u_k)$ 合起来，先 $\omega$ 后 $k$ 才得到 $y\in J$。若顺序反过来（先 $k\to\infty$ 再取 $\omega$），$y_nu_k$ 项对固定 $k$ 的 $\omega$-极限尚未用过，论证不闭合。这一句也解释了为什么 $\Aom$（按范数取商）与 $D$（按 uniform $2$-norm 取商）两个商必须同时出现：前者是 CLS 框架里的 $\mathcal F_\omega$ 底座，后者是本项目里所有迹论证的舞台，$J$ 是两者之间的桥。

(d) 失败路线（推测）：其一，我想把 `\ref{n:eq:mcduff}` 的单侧同态沿 $\Aom\cap A'\to D\cap A'$ 提升成同态，这条路一般不通：跨商提升同态需要额外维数或抬升条件，而 `12_nonunital_framework.tex:62-63` 只保证 order-zero 映射可跨任意商提升，所以 $\psi$ 只能是 order-zero，$\psi(1)+J=1_D$ ，并非 $\psi(1)=1$；CLS 的 tracially large 定义正是为补偿这一点而设。其二，$u$ 在 $\Fw$ 中作单位只用到了模消影；若消影 ideal 不完全落在 $J$ 内，$\Fw$ 与 $D$ 上的迹不能同时谈，引理 `\ref{n:lem:generalized}` 的"每条广义极限迹是过 $D$ 的迹的有限倍数"就没有可乘的结构。其三，若 $A$ 有有限维商（本假设下单性与无单位排除了它，见 `12_nonunital_framework.tex:9`），CETW Theorem 4.6 的前提失效，`\ref{n:eq:mcduff}` 一步就没来源。

## 24. 17 分片后半：广义迹的有界化与 Cu 部的几乎不可穿透

(a) 原文（`17_nonunital_absorption.tex:60-72`）：

> A generalized limit trace on $\Aom$ comes from lower-semicontinuous traces
> $\nu_n$ on $A$ by
> \begin{equation}\label{n:eq:generalized}
>  \nu([(b_n)])=\sup_{\epsilon>0}\lim_\omega\nu_n((b_n-\epsilon)_+)
>  \quad(b_n\ge0).
> \end{equation}
> The coordinate traces here need not initially be densely finite. ...
> The relevant largeness condition for $\varphi$ is
> $\nu_a(\varphi(1))=\nu(a)$ \cite[Definition 2.4]{CLS}.

(b) 中间步骤（`:80-126`，引理 `\ref{n:lem:generalized}`）：取 $\epsilon>0$ 使 $b=(a-\epsilon)_+\ne0$；每条 $T$ 中迹 faithful，紧性给 $m=\min_{\sigma\in T}\sigma(b)>0$；$\nu(a)<\infty$ 与 `\ref{n:eq:generalized}` 给出 $\omega$-大集上 $\nu_n(b)\le C$。断言：单代数上在某非零正元素处有限的下半连续迹必为密有限，做法是令 $N_\eta=\{x:\eta(x^*x)<\infty\}$，由 $(x+y)^*(x+y)\le2x^*x+2y^*y$ 得线性，由 $\eta((xy)^*(xy))=\eta(xyy^*x^*)\le\lVert y\rVert^2\eta(x^*x)$ 与 $\eta((yx)^*(yx))\le\lVert y\rVert^2\eta(x^*x)$ 得双侧 ideal，非零且按单性范数稠密；再靠开方逼近说明有限迹正元素稠密。于是该集上假设有 $\nu_n=r_n\sigma_n$，$\sigma_n\in T$，$0\le r_n\le C/m$；零迹由 $r_n=0$ 包括，"每条非零正元素上无穷"的迹不可能出现在该集上；在集外把标量与状态有界地延拓。对任意有界正代表 $z_n$ 与 $\delta>0$ 有 $0\le r_n\sigma_n(z_n)-r_n\sigma_n((z_n-\delta)_+)\le(C/m)\delta$，故 `\ref{n:eq:generalized}` 的正则化可以去掉，$\nu=(\lim_\omega r_n)(\lim_\omega\sigma_n)$，即过 $D$ 的迹的有限（可为零）倍数。取 $z=\psi(1)$，其在 $D$ 中像为 $1_D$，故对每个允许的测试有 $\nu_a(\varphi(1))=\nu(az)=\nu(a)$；公式在模消影下与代表无关，因该 ideal 消影 $a$。

(c) 我在这一段的初始动机被自己的错误猜测拖累了一次：我以为需要像 CLS 原文那样引入 2-quasitrace 与 $T_2(A)=T(A)$ 之类的深结果。这里完全不需要，作者只用了两条本项目自带的假设（$T_1(A)$ 紧、密有限迹锥全体在有界单位球上有界）加上单性，就把"广义迹"缩小到"过 $D$ 的迹的倍数"，界 $C/m$ 是紧性给的。$m>0$ 的来源是 faithful $+$ 紧 $+$ $b\ne0$ 三条，缺一即失；$0\le r_n\le C/m$ 里 $m$ 在分母，所以它也是全节里唯一由 faithfulness 直接产出的显式常数。正则化 $(\cdot-\epsilon)_+$ 的可去掉性我也逐步核了：上界 $(C/m)\delta$ 与 $\delta$ 线性，故 $\sup_{\epsilon>0}$ 与"直接取 $\lim_\omega\nu_n(z_n)$"重合。

(d) 失败路线（推测）：其一，若允许坐标迹 $\nu_n$ 中存在"在所有非零正元素上无穷"的下半连续迹，它在该 $\omega$-大集上不可能出现（$\nu_n(b)\le C$），但集外延拓时若把它塞进去，$\nu$ 就不是有限倍数；作者的写法是先只在集上表示，集外有界延拓，从而规避。其二，若 $\nu(a)=\infty$ 对每个非零 $a$ 都不成立（即 $\nu$ 处处无穷），Pedersen ideal 测试 $\nu_a$ 无从定义，CLS 的 largeness 条件失去可测对象。其三，若忘记 $\psi(1)+J=1_D$ 与 $z$ 的关系，$\nu(az)=\nu(a)$ 这一步会把 $z$ 当作 $D$ 里的单位，而它只是模 $J$ 单位。

(a) 原文（`17_nonunital_absorption.tex:129-152`）：

> It is \emph{almost unperforated} if $(k+1)[x]\le k[y]$ implies $[x]\le[y]$
> for every integer $k\ge1$.
> ...
>  d_\tau(x)\le\frac{k}{k+1}<1
>  \qquad\text{whenever }d_\tau(y)=1.
> The stated comparison gives $[x]\le[y]$. The case $y=0$ is immediate.
> This uses precisely the specified finite-target-rank tests, including
> the case that this family is empty.

(c) 与 `01_introduction.tex:245-251` 的假设原文对读可以看出，这里的比较假设把测试迹限制在"目标有限秩"的射线族上，即 $\{\tau:d_\tau(b)=1\}$；几乎不可穿透论证需要的正是当 $d_\tau(y)=1$ 时 $d_\tau(x)\le k/(k+1)$，由 $(k+1)[x]\le k[y]$ 与维数函数的加性、单调性得到。若该族为空，前提对一切 $x$ 成立，结论 $[x]\le[y]$ 直接落，作者专门补了"包括该族为空的情形"（`:147-148`），与引言 `:320` 提到的"empty-trace case"呼应；这是本项目里我认为最容易漏掉的一个边界情形。维数函数单调性靠 cutdown 与增大 cutdown 的支得到（`:149-152`），手法与命题 `\ref{n:prop:selection}` 中 `13_nonunital_selection.tex:109-133` 那段同源。

(b) 收尾链条（`:134-159`）：定理 `\ref{n:thm:gamma}` 加 `\ref{n:eq:mcduff}`，再经引理 `\ref{n:lem:central-lift}` 与 `\ref{n:lem:generalized}`，得每个 $n$ 上 tracially large 的 order-zero 映射 $M_n\to\Fw$，即 CLS 意义下的非单侧 uniform McDuffness（`\cite[Definition 2.4]{CLS}`）；比较假设另给 $\Cu(A)$ 几乎不可穿透，对单代数即 CLS 2.3 节的严格比较形式；CLS 的非单侧吸收判据（`\cite[Proposition 5.4]{CLS}`：单、可分、核、有此比较、下半连续迹非平凡、uniformly McDuff 则 $\Z$-稳定）前提全部验证，得 $A\cong A\otimes\Z$。

(d) 失败路线（推测）：若把 CLS 判据当黑箱整体引用，$\Fw$ 的单位、消影包含、tracially large 三件事都会被隐没在"由 CLS 得"里；作者在第 2-9 行明写要"显式验证从 `\ref{n:eq:mcduff}` 到非单侧吸收判据的过渡"，第 23 节我记的那三个接口就是这段显式的产物。若下半连续迹锥中存在无界元（`01_introduction.tex:239-240` 排除的情形），$r_n$ 无界，$\lim_\omega r_n$ 可能为 $\infty$，"有限倍数"就退化为无穷倍数，Pedersen 测试上的 largeness 等式失去意义。至此非单侧一侧的五个块全部走完，它与单侧路线的接口在第 11 节记过的三条路线图上，两条路线共享的都是"投影劈系数迹"这一目标，差别在劈裂的产生方式：单侧走核近似与中心对角引理，非单侧走模型平均与乘积放大。

## 25. Lean 机器侧取证：`OAI.ComparatorModel.CurrentMain.main` 声明的是哪一层

(a) 原文（`formalization.yaml:1622-1624`）：

>     - comparator_config: ComparatorChallenges/UniformGamma.json
>       declaration: OAI.ComparatorModel.CurrentMain.main
>       file: OAI/Analysis/TracialSplitting/Challenge.lean

(b) 中间步骤，登记信息的其余部分（`ComparatorChallenges/UniformGamma.json`）：`challenge_module` 为 `ComparatorChallenges.UniformGamma`，`solution_module` 为 `OAI.Analysis.TracialSplitting.Challenge`，`theorem_names` 只有一条 `OAI.ComparatorModel.CurrentMain.main`，`definition_names` 为空，`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice` 三条，`enable_nanoda` 为 `false`。目录 `OAI/Analysis/TracialSplitting/` 共 51 个 `.lean`，最大的是 `Model.lean` 40,758 B、`ProjectionSampling.lean` 36,743 B、`TraceEstimates.lean` 33,672 B、`RowEstimates.lean` 29,816 B、`SpectralLayers.lean` 27,392 B；登记指向的 `Challenge.lean` 只有 3,618 B，`Main.lean` 1,540 B，`ChallengeDefinitions.lean` 26,244 B。

(a) 原文（`Challenge.lean:14-22`）：

> def OriginalGammaStatement : Prop := ∀
>     {A : Type} [CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]
>     [Nontrivial A] [TopologicalSpace.SeparableSpace A]
>     (_hsimple : TopologicallySimple A) (_hinf : ¬FiniteDimensional ℂ A)
>     (_hA : IsNuclear.{0, uNuclear} A) (_hfinite : StablyFinite A)
>     [Nonempty (TracialState A)] (U : Ultrafilter ℕ)
>     (_hfree : (U : Filter ℕ) ≤ atTop)
>     (_hRR : RealRankZero (FamilyUltrapower (completionTrace (fun τ : TracialState A => τ)) U)),
>     UniformPropertyGammaAt A U

(c) 这条声明覆盖的代数类与它声明的一致界，我按四项拆开记录。第一项，代数类：$A$ 是带 `CStarAlgebra`、`PartialOrder`、`StarOrderedRing` 结构的类型，要求 `Nontrivial`、拓扑可分、`TopologicallySimple`（`Model.lean:981` 自定义，避开 Mathlib 的 `Simple` 实例搜索）、非有限维、`IsNuclear.{0,uNuclear}`、`StablyFinite`（`Model.lean:992`）、`Nonempty (TracialState A)`，外加自由超滤 $U\le$ `atTop`。这正好是手稿 `01_introduction.tex:58` 附近那条单侧定理（实秩零蕴含一致性质 $\Gamma$）的假设集，`StablyFinite` 对应 abstract 里的 stably finite，非单侧一侧的"密有限迹全体有界加归一化基紧加有限目标秩比较"没有对应物。第二项，核性的定义方式（`Model.lean:17-18`）是 $\forall B$，`CStarAlgebraNorm (A ⊗[ℂ] B)` 为 `Subsingleton`，即极小与极大张量范数重合；因为 `enable_nanoda` 为 `false`，机器侧没有 Nanoda 的 cp 近似库可用，只能用张量范数版本。第三项，结论的一致界：`UniformPropertyGammaAt`（`ChallengeDefinitions.lean:590-602`，与 `Model.lean:996-1008` 内容相同）声明存在 $p\in$ `FamilyUltrapower (completionTrace (fun τ => τ)) U`，是 `IsStarProjection`，并且对所有 `UniformTracialCompletion (fun τ => τ)` 中的 $x$ 与所有序列 $s:\mathbb N\to$ `TracialState A` 成立两条：$p$ 与 $\iota(x)$ 交换，以及
$(\texttt{familyLimitTrace}\;\_\;U\;s)(p\cdot\iota(x))=\tfrac12(\texttt{familyLimitTrace}\;\_\;U\;s)(\iota(x))$。所以这里的"一致"是量词层面的一致：同一个 $p$ 同时对所有系数与所有极限迹成立，且劈裂比例 $1/2$ 是精确等式，带 $\epsilon$ 的近似版本在陈述里根本不出现。第四项，声明的包装结构（`ChallengeDefinitions.lean:620-626`）：`MainClaim` 是五个 existential 的嵌套，依次交出 `NormConstruction`（`ChallengeDefinitions.lean:131-137`，三条字段 `mul_le`、`star_eq`、`square_le`，即商范数的次乘、星不变与 C$^*$ 型不等式）、`NullConstruction`、`CauchyConstruction`、`LimitConstruction`、`TraceConstruction`，之后才是 `Statement.{uNuclear}`。`Challenge.lean:31-59` 用 `_root_.OAI.CurrentMain` 里的引理把这五个类逐条 instance 掉，`:62-63` 证 `statement_iff_original` 为 `Iff.rfl`（定义级相等），`:66-73` 把双向蕴含拼出，`:75-76` 的 `main` 就是 `main_iff_original.mpr _root_.OAI.CurrentMain.real_rank_zero_uniform_gamma`。

(d) 机器路线为什么要多插这几层，我按 import 链读了一遍：`Main.lean` 引 `FiniteSplitting`，`TraceEstimates.lean` 引 `Model.lean`，`ProjectionSampling.lean` 引 `ProjectionRounding`，`SpectralLayers.lean` 引 `ProjectionSampling.lean`，`RowEstimates.lean` 引 `MatrixNormalization`。理由各自不同。`Model.lean`（33 个 `def`、58 个 `lemma`）承担的是手稿里当成公用的解析底座：`traceTwoNorm`（`:34`）、`familyTwoNorm a = ⨆ i, traceTwoNorm (τ i) a`（`:389`）、`IsFamilyNull`、`familyNullIdeal`、`familyCauchyAlgebra`、`familyCauchyNullIdeal`、`descendedTrace`（`:699`）、`ultraTrace`、`familyLimitTrace`（`:830`）、`completionMap`、`familyUltrapowerMap`、`UniformPropertyGammaAt`。手稿写一句 $D=\ell^\infty(A)/I_T$ 就过去了，Lean 里得先把 `lp` 有界序列、闭星 ideal、商上的序与星序结构、迹下降到商（`trace_congr` 前提）逐一定义，这就是那五个 `Construction` 类存在的原因：商范数与下降迹的存在性被拆成可交代的字段，交由外部证明供给。`TraceEstimates.lean` 承担"一致"二字的实现：它定义了 `uniformTwoNorm` 与 `uniformHalvingError`（都是 $\bigsqcup$ over `TracialState D`），把逐迹陈述升级成 sup 对象，`Main.lean:34-36` 的收尾正是 `(familyTwoNorm_le_uniform σ _).trans_lt (htest u hu).1` 与 `familyHalvingError_le_uniform σ P (j u)` 两条，把对每个 $\epsilon$ 的严格不等式压成 $0=\tfrac12$ 型精确等式；这一步对应我在第 10 节记的"同一个 $\omega$"，机器侧的等价物是 sup 对象加 `htest` 的双分量。`ProjectionSampling.lean`（3 个 `def`、34 个 `lemma`、3 个 `theorem`，section 名为 `FiniteLinearTests`、`OrthogonalInsertion`、`MatrixRows`、`SamplingEstimates`、`SamplingConclusion`）把我第 9 节那两条采样引理化成一串具名不等式，例如 `trace_norm_projection_mul_le`（`:22-30`，$\lVert\tau(eb)\rVert\le\lVert b\rVert\tau(e)$）与 `trace_compression_error`（`:33-43`，$e\le q$ 时 $\lVert\tau(eb)-\alpha\tau(e)\rVert\le\lVert qbq-\alpha q\rVert\tau(e)$）；手稿里一句 tracial Cauchy--Schwarz，机器侧需要显式的角压缩与线性测试两层。`SpectralLayers.lean`（5 个 `def`、42 个 `lemma`、4 个 `theorem`，section 为 `SpectralEnergy`、`SpectralRoot`、`SpectralEstimate`、`LayerCake`、`LayerWeights`、`LayerComplete`）是实值泛函演算的层次化：开头 `scalar_inv_sqrt_near_one`（`:17-35`，$t\ge\tfrac12$ 时 $\lvert t^{-1/2}-1\rvert\le 2\lvert t-1\rvert$）说明它服务的是 $(h+t1)^{-1/2}$ 型归一化与 $\sqrt{\tau(u-v)}$ 型模量；机器没有现成的算子 Lipschitz 演算，层叠（layer cake）与权重必须显式展开，这跟我第 14 节记录的 clipping 是同一族代价。`RowEstimates.lean` 用 `ProjectionRow` 结构（带 `gram_diag`、`right_support`、`entry i`）把"在互不相关的有限矩阵块里"这句话变成二重求和引理 `compression_expand`，我第 21 节记的 $N$ 不进界在机器侧就是靠这个结构把矩阵尺寸显式管住。

(e) 两处错位我按读到的内容记录。命名族：登记的声明在 `ComparatorModel.CurrentMain` 名下（`Challenge.lean:25`、`Challenge.lean:75`），而 `OriginalGammaStatement` 在 `OAI.CurrentMain` 名下（`:10`、`:14`），真正的定理 `real_rank_zero_uniform_gamma` 也在 `OAI.CurrentMain`（`Main.lean:11`）；目录名 `TracialSplitting` 与两个 namespace 都不同族。我的读法是 `ComparatorModel` 前缀标的是"自洽挑战包"这一层，`OAI.CurrentMain` 是实际开发区，`Challenge.lean` 只做包装与保守性证明，所以 `statement_iff_original` 必须是 `Iff.rfl`。覆盖面：我在 51 个模块里查过 `projectionless`、`JiangSu`、`ZStable`、`Absorb`、`Pedersen` 这一族词，全部零命中，`StablyFinite` 只出现在 `Challenge.lean`、`ChallengeDefinitions.lean`、`Main.lean`、`Model.lean` 四处，`Hereditary` 只在 `FullProjections.lean` 出现。据此我确认机器侧覆盖的是第 1--11 节那条实秩零路线，本笔记第 16 到 24 节的非单侧五块（12、13、14、16、17 分片）在机器侧没有对应声明；`ComparatorChallenges/UniformGamma.json` 的 `theorem_names` 只有一条也与此一致。顺带一条：机器陈述只给 $n=2$ 的对半劈，CETW 定义里的 $1/n$ 族要靠定理 `\ref{n:thm:gamma}` 那种乘积迭代补上，而机器侧那条精确 $1/2$ 等式的强度反而高于第 14 节的 clipping 输出（那边是误差界，这边是等式），这个不对称我在读第 11 节时没有预料到。

## 26. 台账：非单侧路线与机器侧的常数总表

本节把第 16 到 25 节出现过的量集中登记，位置一律用 `分片名:行号`，机器侧用 `模块名:行号`。前三十行是手稿，后十一行是 Lean。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $D=\ell^\infty(A)/I_T$ | 按 uniform $2$-norm 取商 | `12_nonunital_framework.tex:14-17` | 本 `\ref{n:lem:unit}` 与其后全部构造 | 无统一范数，检零性断 |
| $\tau([(a_n)])=\lim_\omega\sigma_n(a_n)$ | 坐标迹限于 $T=T_1(A)$ | `12_nonunital_framework.tex:20-22` | 选择命题与代价引理的全称前提 | limit trace 限制回 $A$ 范数为 $1$ 断 |
| $\sigma(u_n)\uparrow1$ | Dini 给 $\sup_{\sigma\in T}(1-\sigma(u_n))\to0$ | `12_nonunital_framework.tex:35-36` | 同片 `:39-42` 与 `17_nonunital_absorption.tex:36-38` | $(u_n)$ 的类不是 $1_D$，$D$ 单侧性断 |
| $\lVert(1-u_n)a_n\rVert_{2,\sigma}^2$ | 不超过 $\lVert a_n\rVert^2(1-\sigma(u_n))$ | `12_nonunital_framework.tex:39-42` | 单位身份 `:43-44` | 两条路线的近似单位论证同断 |
| $\lVert[(a_n)]\rVert_{2,\Lambda}=\lim_\omega\lVert a_n\rVert_{2,T}$ | 等式，无常数因子 | `12_nonunital_framework.tex:29` | `13_nonunital_selection.tex:147-149`；`14_nonunital_models.tex:109` | trace 亏量推不出范数亏量 |
| $\Tr$ 未归一化约定 | 矩阵扩展一律用 $\Tr$ | `12_nonunital_framework.tex:101` | `13_nonunital_selection.tex:50-55`；`14_nonunital_models.tex:139-155` | 尺寸 $N$ 的因子进入迹等式 |
| $l>1/\xi$ | 摊薄倍数 $1/l$ | `13_nonunital_selection.tex:29-30` | 秩引理第一段的 $d_\sigma(b)<\xi$ | II_1 摊薄失效，$b$ 不存在 |
| $0\le d_\sigma(k)-\sigma(k)<\xi$ | 与 $\lVert c\rVert$ 无关 | `13_nonunital_selection.tex:14-17` | `:102-103` 缓冲与 `:131-133` 亏量传递 | 严格秩不等失，比较假设无从套用 |
| $\gamma_n=\alpha_n+\beta_n/\delta_n+\delta_n$ | 三项均沿 $\omega$ 消失 | `13_nonunital_selection.tex:81` | `:93-103`、`:133`、`:145` 的容差 | 余量 $3\gamma_n$ 对 $5\gamma_n$ 塌 |
| $\delta_n(1-Q)\le 1-h_n$ | 支亏损与切割参数线性 | `13_nonunital_selection.tex:84-85` | `:86-91` 的 $d_\sigma(H_n)$ 上界 | $\sigma(a_n)\le d_\sigma(H_n)+\gamma_n$ 断 |
| $\inf_T\sigma(u)>7/8$ | 缓冲块几乎满支 | `13_nonunital_selection.tex:95` | `:98` 的下界 $5\gamma_n$ | 严格不等号失，比较前提断 |
| $5\gamma_n\le d_\sigma(c_n)\le10\gamma_n$ | 线性于 $\gamma_n$ | `13_nonunital_selection.tex:98` | `:102-103`；`:137` 的丢迹上界 | $10\gamma_n$ 与 $12\gamma_n$ 同断 |
| $\lVert x^*bx-k\rVert<1/4$ | 与 $d=(k-1/2)_+^{1/2}$ 配对 | `13_nonunital_selection.tex:110-111` | `:112` 的 $\lvert y\rvert^2\ge d^2/4$ | `:115` 的 $\lVert(\lvert y\rvert+\epsilon)^{-1}d\rVert\le2$ 失 |
| $w=\sqrt2\,vd$ | $w^*w=2(k-1/2)_+=f(k_n)$ | `13_nonunital_selection.tex:123` | `:126-133` 的 traciality 传递 | $r_n$ 的迹等号与亏量同断 |
| $12\gamma_n$ | 绝对常数乘 $\gamma_n$ | `13_nonunital_selection.tex:145` | `:147-149` 的检零 | $p=[(p_n)]$ 不是投影 |
| 阈值差 $11/(6m)<2/m$ | 与 $m$ 反比 | `13_nonunital_selection.tex:193` | `:196-199` 的单侧代价 | 代价引理结论断 |
| $2/m<\varepsilon$ | 整数 $m$ 自由 | `13_nonunital_selection.tex:199` | `:202-208` 推论 | `14_nonunital_models.tex:179` 的 $K^{-1}$ 无来源 |
| $l^{-1}\sum_j e_{1j}Ye_{j1}$ | 乘 $l$ 的代价被归一化抵消 | `13_nonunital_selection.tex:212-217` | `14_nonunital_models.tex:176-181` | 矩阵尺寸进入联合代价 |
| $L(\sigma)=1-\sigma(\theta(1))+\sum_x\sigma((x-\theta(b_x))^2)$ | $T$ 上非负连续仿射 | `14_nonunital_models.tex:49-51` | `:59-66` 的分离论证 | barycenter 不在 $T$，凸平均断 |
| $L(\sigma_\mu)=\int L\,d\mu\ge\kappa$ | 矛盾量级为 $\kappa$ | `14_nonunital_models.tex:65` | `:66` 的数据 $D_i^0,\theta_i,b_{i,x},w_i$ | $\Delta$ 不能任意取小 |
| $f(s)=(2s-1)_+,\ g(s)=\min(1,2s)$ | $gf=f$ 使支撑条件取等 | `14_nonunital_models.tex:73` | `:76-81` 的投影 $v$ | $\tau(v)=\tau(f(\theta(e_{11})))$ 断 |
| $\tau(Q)=\tau(f(h))$ | 沿对角重复后的严格等式 | `14_nonunital_models.tex:91` | `:93` 的 $D_i=\C(1-Q)+Q\pi(D_i^0)$ | $D_i$ 的单位迹与模型亏量脱钩 |
| $C_0=(1+\sqrt2)^2$ | 来自 $1-f(s)\le2(1-s)$ | `14_nonunital_models.tex:100-103` | `:105-108` 的 $2mC_0$ | $\tau(E_i)$ 界断，$\Delta$ 无法闭合 |
| $(2+2mC_0)\kappa$ | 与模型个数无关 | `14_nonunital_models.tex:108` | `:175` 的 $\Delta=K^{-2}$ | 截断引理的 $\lambda$ 定义失配 |
| $\lVert[e,x]\rVert_{2,\tau}\le2(2\sum_i\lVert[p_i,x]\rVert_{2,\tau}^2)^{1/2}$ | 开根，标量 2-Lipschitz | `14_nonunital_models.tex:130-131` | `:212` 的 $2\sqrt{8H_\tau}$ | 交换子界不随 $K$ 消失 |
| $\tau(s^2)=\lambda+2R$ | 对角给 $\lambda$，非对角给 $2R$ | `14_nonunital_models.tex:160` | `:161-169` 的 $\sqrt{2\lambda R}$ | 截断的 trace 代价断 |
| $\sqrt{2\lambda R}$ | 不超过 $\sqrt{\lambda^3+4\lambda^2/K}$，极限 $\lambda^{3/2}$ | `14_nonunital_models.tex:135` 与 `:192` | `16_nonunital_amplification.tex:4-8` 的预算 | 每步代价劣于 $\lambda^{3/2}$ 时放大一步都不能走 |
| $R_\tau+KH_\tau\le\lambda^2/2+2\lambda/K$ | 单一代价同时控两项 | `14_nonunital_models.tex:192` | `:194` 与 `:199-207` | $H_\tau$ 不小，矩等式与交换子同断 |
| $\lvert\tau(sx)-\lambda\tau(x)\rvert$ | 不超过 $\sqrt{\lambda H_\tau}+\lambda/K$ | `14_nonunital_models.tex:207` | `:215-217` 的 $s$ 换 $e_D$ | 替换代价与 $\tau(s-e_D)$ 不匹配 |
| $\lambda=1-c^{1/m}$ | $(1-\lambda)^m=c$ 精确 | `16_nonunital_amplification.tex:39` | `:48-50` 的递推 | 目标比例只能靠误差凑 |
| $\lambda\le(-\log c)/m$ | $m\lambda^{3/2}\to0$ | `16_nonunital_amplification.tex:56` | `:54-56` 的两个误差 | 命题 `\ref{n:prop:split}` 无投影输出 |
| $1/k$ 三级目标与 $F_k$ | 递减、属 $\omega$、交为空 | `16_nonunital_amplification.tex:61-67` | `:69-71` 的 $k(n)\to_\omega\infty$ | $k(n)$ 沿 $\omega$ 有界，误差压不下 |
| $c=1/(n-j+1)$ | 望远镜归一 | `16_nonunital_amplification.tex:88` | `:90-92` 的归纳 $\tau(qa)$ | $\tau(f_ja)=\tau(a)/n$ 断 |
| $\psi(1)+J=1_D$ | 模 $J$ 单位，非真单位 | `17_nonunital_absorption.tex:23-24` | `:122-124` 的 $\nu(az)=\nu(a)$ | tracially large 断，CLS 判据前提失 |
| $m=\min_{\sigma\in T}\sigma(b)>0$ | faithfulness 加紧 | `17_nonunital_absorption.tex:91` | `:107` 的 $0\le r_n\le C/m$ | 标量无界，$\nu$ 非有限倍数 |
| $(C/m)\delta$ | 正则化可去掉 | `17_nonunital_absorption.tex:111-116` | `:118-120` 的 $\nu=(\lim_\omega r_n)(\lim_\omega\sigma_n)$ | 广义迹与 $D$ 脱钩 |
| $d_\tau(x)\le k/(k+1)$ | 严格小于 $1$ | `17_nonunital_absorption.tex:144` | `:145-146` 的 $[x]\le[y]$ | 几乎不可穿透断，吸收闭合断 |
| $1/2$ 的精确等式 | 对一切 $s:\mathbb N\to$ `TracialState A` | `ChallengeDefinitions.lean:593-602` | `ChallengeDefinitions.lean:604-612` 的 `Statement` | 机器结论与 CETW 定义脱钩 |
| `MainClaim` 五个构造 | `Norm`、`Null`、`Cauchy`、`Limit`、`Trace` 的 existential | `ChallengeDefinitions.lean:620-626` | `Challenge.lean:66-73` 的双向 | 商范数与下降迹的良定义断 |
| `NormConstruction` 三字段 | `mul_le`、`star_eq`、`square_le` | `ChallengeDefinitions.lean:131-137` | `Challenge.lean:31-34` 的 instance | 商不是 C$^*$-代数，`Iff.rfl` 失效 |
| `Iff.rfl` 保守性 | 打包前后定义级相等 | `Challenge.lean:62-63` | `Challenge.lean:75-76` 的 `main` | 打包改变了原命题 |
| `familyTwoNorm` | $\bigsqcup_i$ over 迹族 | `Model.lean:389` | `Main.lean:34-35` 的 `.trans_lt` | 逐迹界升不成一致界 |
| `uniformHalvingError` | $\bigsqcup_\tau$ 的劈裂误差 | `TraceEstimates.lean:24-26` | `Main.lean:35-36` | 严格不等式压不成精确 $1/2$ |
| `RealRankZero` | 自伴元以有限谱自伴元稠密 | `Model.lean:30-32` | `Main.lean:19` 假设 `hRR` | `small_full_projections` 无输入 |
| `IsNuclear` 的张量范数式定义 | 极小与极大范数 `Subsingleton` | `Model.lean:17-18` | `Main.lean:16` 假设 `hA` | `enable_nanoda` 为 `false` 时没有替代来源 |
| 模块规模 | 51 个 `.lean`，`Model.lean` 40,758 B | `formalization.yaml:1622-1624` | 登记的 `file` 与 `declaration` | 口径混淆，误以为目录名即 namespace |
| 词表零命中 | `projectionless`、`ZStable`、`Pedersen` 全目录无 | `OAI/Analysis/TracialSplitting/` 全 51 模块 | 本笔记第 16 到 24 节的覆盖面判断 | 误信机器已覆盖非单侧路线 |

台账读法补两句。手稿行的"被谁消费"一栏我尽量指向后文实际引用点，并非就近的解释；`13_nonunital_selection.tex:145` 的 $12\gamma_n$ 与 `12_nonunital_framework.tex:29` 的范数恒等式是整套构造里最容易被略过的配对，前者给量级、后者把量级翻译成"这是投影"。机器行的"位置"一栏与手稿的 `分片名:行号` 同构，只是文件换成 `.lean`；`Main.lean` 只有 1,540 B 却承担最后两步转换（严格不等式到等式、有限集到全体），这个体量分布我按第 25 节的分层解释记录，不再重复。
