# D72 反推：L1 的 Daugavet 子空间里那两个模数为什么只能是 $\max\{t/2,t-1\}$ 与 $\max\{0,t-2\}$

对象论文：`Exact asymptotic moduli in a Daugavet subspace of L1`（2026-09-27，OpenAI）。
TeX 源码：`E:\math\preprints\Exact-asymptotic-moduli-in-a-Daugavet-subspace-of-L1-September-27-2026\build\`。分片是 `sections/introduction.tex`（123 行，6815 字节）、`sections/moduli.tex`（343 行，14082 字节）、`sections/construction.tex`（365 行，14772 字节），加 `main.tex`（51 行）、`figures/moduli.tex`（24 行）、`references.bib`（100 行，8 条文献）。
Lean：`E:\math\lean\OAI\Analysis\Daugavet\`，28 个 `.lean` 文件，4307 行，205985 字节。入口模块 `Main.lean`，被登记的顶层声明是 `OAI.ExactModuli.exact_example`，comparator 配置 `ComparatorChallenges\DaugavetModuli.json`。
引文行号形如 `moduli:24`，指 `sections/moduli.tex` 第 24 行。`clipping:109` 这类指 Lean 文件名与行号。

## 0 我进场时手里有什么

摘要只给我一句话的结果形状（`main:37-45`）：

```tex
For an infinite-dimensional real subspace of $L^1$ whose unit ball is
totally bounded in measure and whose norm has the Daugavet property,
we compute the averaged midpoint and one-sided asymptotic moduli at
every unit center. They are $\max\{t/2,t-1\}$ and $\max\{0,t-2\}$,
respectively. The same weak-neighborhood geometry excludes every
equivalent asymptotically uniformly convex norm. A quantitative realization
of the Kadets--Werner construction supplies a space with both hypotheses.
```

我读到的第一层信息是：结果对 $t$ 是分段线性的两条折线，一条在原点斜率 $1/2$、到 $t=2$ 处折成斜率 $1$，另一条在 $[0,2]$ 上恒为零、之后斜率 $1$。分段点两处在同一个 $t=2$。这个"两处折点重合"的形状在正文里被明写为一句核对（`moduli:285-286`）："In particular the argument includes $t=2$, where the two branches meet."

我手里第二个信息是两条假设各管一头：单位球按测度收敛意义 totally bounded，范数按 rank-one 算子意义 Daugavet。摘要用 "the same weak-neighborhood geometry excludes every equivalent asymptotically uniformly convex norm" 把排除 AUC 改写的任务挂到第二条假设上，用 "A quantitative realization" 声明第三条（存在性）是自带构造。

我进场前的先验判断有三条，第一条立刻就是错的。我以为两个模数会像经典的凸性模数那样以 $t^2$ 起步（自反一致凸空间的范数是 $2$-凸的，模数 $\delta(t)\asymp t^2/(1+t^2)$ 之类）。但渐近模数取的是"任意余维有限子空间之后"的下确界，它只看到无穷维尾部的方向，所以它跟有限维方向上的曲率完全脱钩；$L^1$ 上尾部方向的中点增长本来就是线性的。第二条先验判断：我以为 $\max\{t/2,t-1\}$ 与 $\max\{0,t-2\}$ 里的 $1/2$、$1$、$2$ 是"取遍 $F$ 的上确界"过程带来的某种优化常数，需要某种对偶或极值论证。读完正文我发现它们全部来自定义里的归一化与逐点恒等式，一个都不是优化出来的。第三条：我以为排除 AUC 需要用到模数公式本身（既然 $\overline\delta_E(t)=0$ 对 $t\le2$ 成立，那原范数当然不 AUC），但 `moduli:294-299` 明确说这一步需要弱邻域性质本身，因为换等价范数以后原公式对它没有任何约束。这一点我在第 12 节会详细说明它怎样改变我对整篇结构的理解。

本笔注叙事对应的论文目录为 preprints/Exact-asymptotic-moduli-in-a-Daugavet-subspace-of-L1-September-27-2026，在 .tools/lean_queue.txt 队列第 72 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 先把两个模数的定义逐字钉死

一切推导都要回到 `intro:13-19` 的定义块，我把它整块抄下来，因为我后面每个常数都要在这里结账：

```tex
\begin{align*}
 H_N(x,t)&=\sup_{F\in\operatorname{cof}(X)}
   \inf_{\substack{y\in F\\N(y)\ge1}}
   \left(\frac{N(x+ty)+N(x-ty)}2-1\right),\\
 D_N(x,t)&=\sup_{F\in\operatorname{cof}(X)}
   \inf_{\substack{y\in F\\N(y)=1}}\bigl(N(x+ty)-1\bigr).
\end{align*}
```

`intro:20-25` 补两句：$\widehat\delta_N(t)$、$\overline\delta_N(t)$ 分别是 $H_N(\cdot,t)$、$D_N(\cdot,t)$ 在单位球心上的下确界；"a subspace of finite codimension is chosen for each center before the perturbing direction is chosen"，所以量化顺序是 $\sup_F\inf_y$，$F$ 可以随 $x$ 变、$y$ 不能逃出 $F$。AUC 的定义是 $\overline\delta_N(t)>0$ 对每个 $t>0$。

四个符号我都要单独结账，因为它们决定后面所有位移常数：

1. `cof(X)`：`intro:11-12` 定义为闭的有限余维线性子空间。Lean 对应 `Model:16-17`，`Cofinite F := IsClosed F ∧ FiniteDimensional ℝ (X ⧸ F)`。这是把"有限余维"翻译成商有限维，我用它核对过：闭性在 Lean 里是显式条件，论文里藏在记号里。
2. $H_N$ 里 $y$ 的约束是 $N(y)\ge1$（大于等于），$D_N$ 里是 $N(y)=1$（等于）。这个不对称我一开始当排版疏忽，后来发现它是 `moduli:58-60` 那句 "The same bound holds for $\|y\|_1\ge1$ by radial monotonicity" 的必需前提。若 $H_N$ 也只取 $N(y)=1$，则 `moduli:58` 这句"radial monotonicity"就没地方落脚；若 $D_N$ 也取 $\ge1$，则 `moduli:239` 那个 $t-2$ 会变成 $t\|y\|-2\ge t-2$，结果不变，但 Lean 的 `D` 定义（`Model:27-29`）写的是 `N y = 1`，与论文一致。
3. $H_N$ 的被减数是两项的平均 $\frac12(\cdot+\cdot)$，然后减 $1$。这个 $1$ 是 $N(x)=1$ 的归一化，它同时是后面 $t/2$ 分支的分子与 $t-1$ 分支的那一个 $1$。
4. $D_N$ 只有一项、然后减 $1$。它是 $t-2$ 里"两个 $1$"的第二个：第一个来自反向三角不等式吃掉 $\|x\|=1$，第二个就是这里的 $-1$。

`intro:27-37` 有一段关键的、不编号的比较论证，我读它的时候卡过一次，因为它的"上界""下界"两个词的指向和直觉相反。论文原话：

```tex
For each fixed $y$, both the average and the maximum of $N(x+ry)$ and
$N(x-ry)$ are even convex functions of $r$.  Thus unit directions give
the same inner infimum in $H_N$ and in its maximum-based counterpart.  Let $m_N$ be the modulus obtained by replacing the average in $H_N$ by
the maximum and then taking the infimum over unit centers.  It satisfies
$\tfrac12m_N(t)\le\widehat\delta_N(t)\le m_N(t)$.
Indeed, the upper bound is immediate; for the lower bound, intersect a
candidate subspace with the kernel of a norm-one functional norming $x$.
Both perturbed norms are then at least one, and the average of their
excesses is at least half their maximum excess.  Taking the infima and
suprema gives the comparison.
```

我的读法：$m_N$ 用 $\max\{N(x+ty),N(x-ty)\}-1$ 替换平均。对固定的 $F$ 与 $y$，$\max-$平均 $=$ 平均减 $1$ 与 $\max$ 减 $1$ 之间的关系是 $\max-1\le$ ... 设 $A=N(x+ty)-1$、$B=N(x-ty)-1$，则平均 $=(A+B)/2$，$\max=A\vee B$。有 $(A+B)/2\le A\vee B$，所以 $H_N\le m_N$ 的对应量，这是"upper bound is immediate"。另一侧要用一个技巧：把 $F$ 与"norming $x$ 的范数一泛函的核"求交，交仍是有限余维闭子空间，而在核的方向上 $\varphi(x\pm ty)=\varphi(x)=1$，于是 $N(x\pm ty)\ge1$，即 $A,B\ge0$，此时 $(A+B)/2\ge(A\vee B)/2$，这就是"average of their excesses is at least half their maximum excess"。这里我必须注意：这个技巧要求 $\ker\varphi$ 与 $F$ 的交里还有单位向量，也就是 $X$ 无穷维。`intro:36-37` 的收尾一句 "Positivity of the averaged modulus is therefore the usual asymptotic midpoint uniform convexity (AMUC)" 就是 DKRRZ 那篇的口径。

我在纸上把 $H_N$ 与 $m_N$ 的关系写成双向不等式链，是因为它预告了本篇的主定理：在 $E$ 上二者精确相等到 $\max\{t/2,t-1\}$ 这一条折线，比 $\tfrac12 m_N\le\widehat\delta_N\le m_N$ 强得多。也就是说，本篇实际给出的是"在这类空间里平均与最大两条曲线的比值恰好是 1"（对 $t\ge2$）或 $1/2$（对 $t\le2$，因为平均 $=t/2$ 而最大 $=t$，比值 $1/2$，正好命中比较下界）。这个观察在正文里没写，是我自己核的，标 [推测] 性质。

## 2 主定理原文与我自己重排的两条双侧不等式

`intro:63-76` 的定理是全篇的靶：

```tex
\begin{theorem}\label{thm:exact}
Let $E$ be an infinite-dimensional closed real subspace of
$L^1(\Omega,\mathbb P)$, where $\mathbb P$ is a probability measure.
Suppose its closed unit ball is totally bounded for convergence in
measure and its inherited norm has the Daugavet property.  Then every
$x\in S_E$ and $t>0$ satisfy
\[
 H_E(x,t)=\max\{t/2,t-1\},\qquad
 D_E(x,t)=\max\{0,t-2\}.
\]
Consequently these are also the formulas for
$\widehat\delta_E(t)$ and $\overline\delta_E(t)$.  The space $E$ admits
no equivalent AUC norm.
\end{theorem}
```

这里 $H_E$、$D_E$ 是 $H_N$、$D_N$ 取 $N=\|\cdot\|_1$ 的缩写，我在 `moduli:61` 见到 $H_E(x,t)$ 就直接这么用了，论文没有另行声明这个缩写，属于我补的。

我把定理拆成四条独立的双侧不等式，因为正文正是四条：

- (L1) $H_E(x,t)\ge\max\{t/2,t-1\}$：只吃 total boundedness（`moduli:17-22` 的 Lemma 2.1），其中 $t/2$ 分支吃 clip 与符号泛函，$t-1$ 分支只吃逐点恒等式（连 total boundedness 都不需要）。
- (U1) $H_E(x,t)\le\max\{t/2,t-1\}$：只吃 Daugavet（`moduli:234-290`）。
- (L2) $D_E(x,t)\ge\max\{0,t-2\}$：吃无穷维性 + Hahn-Banach（`moduli:235-241`），连 Daugavet 都不需要。
- (U2) $D_E(x,t)\le\max\{0,t-2\}$：吃 Daugavet，与 (U1) 同一族方向。

这个拆分方式是我在第 11 节做假设账本的根据：真正被"用光"的假设只有 total boundedness 和 Daugavet 各一条半。

## 3 第一条死路：把 $x\pm ty$ 的联合律当独立变量算期望

我的第一反应是：既然 $E\subseteq L^1$ 且范数是 $\|f\|_1=\int|f|\,d\mathbb P$，那就直接对被积函数动手。设 $x$ 固定、$y$ 在某个余维有限子空间里跑。逐点地，

$$\frac{|x(\omega)+t y(\omega)|+|x(\omega)-t y(\omega)|}{2}=\max\{|x(\omega)|,t|y(\omega)|\}.$$

这个逐点恒等式在 `moduli:7-13` 出现，我一开始把它当成"整节的引理"，后来发现它本身就是全部的 $L^1$ 特殊性，剩下的都是测度论。写成论文原样：

```tex
For $x\in S_E$, $y\in E$, and $t>0$, the real scalar identity
$(|a+b|+|a-b|)/2=\max\{|a|,|b|\}$ gives
\begin{equation}\label{eq:overlap-identity}
 \frac{\|x+ty\|_1+\|x-ty\|_1}{2}-1
 =\int(t|y|-|x|)_+\,d\mathbb P
 =t\|y\|_1-\int\min\{|x|,t|y|\}\,d\mathbb P.
\end{equation}
```

我当时的错误路线是这样的：我想直接对 $\int(t|y|-|x|)_+$ 从下面估。若我把 $y$ 想成一个"和 $x$ 独立"的随机函数，那我就能算出 $(t|y|-|x|)_+$ 的期望，例如 $\sim t\mathbb E|y|\cdot\mathbb P(t|y|>|x|)$ 这样。$E$ 里的单位向量看起来"到处都跟 $x$ 错开"，所以我猜这个下界能给出 $t$ 的某个倍数。

机械原因是三步同时崩掉：

1. $L^1$ 上没有"独立"可言。$E$ 是一个线性子空间，$x$ 与 $y$ 都是它的元素，$y-x$、$y+x$ 都要留在 $E$ 里。我一旦要求 $y$ 与 $x$ 独立，就不再是线性子空间的元素选择。更硬的一点：$y$ 要落在给定 $F$ 里，而 $F$ 是"先于 $y$ 给出"的（`intro:22-23` 的顺序声明），我没有任何自由度去让 $F$ 里的成员彼此独立。
2. 即使 $x$ 与 $y$ 支撑不交，$\int(t|y|-|x|)_+=t\|y\|_1$，增量是 $t\|y\|_1-1\ge t-1$，只是 $t-1$ 分支的强度，$t/2$ 分支反而丢掉了。反过来若 $y$ 完全被 $x$ 支撑住、且 $|y|\le|x|/t$，则 $(t|y|-|x|)_+=0$，增量是零。也就是说"重叠"是让平均增量变小的唯一机制，我需要的是"控制重叠有多少"，而独立性假设根本没有触碰重叠的量。
3. 我在 $F$ 里只能取 $\inf_y$，所以任何"存在某个 $y$ 让增量小"的事实都会把 $H_N$ 压下去。这条路线只能给我下界的反面。

第 2 点是转折点的前身：重叠 $\int\min\{|x|,t|y|\}$ 是唯一的敌人。于是 `moduli:24-27` 定义的那个 clip 就是把敌人按高度切掉：

```tex
Fix $x$ and $t$.  Clip a function $y$ at the pointwise height $|x|/t$:
\[
 C(y)=\operatorname{sgn}(y)\min\{|y|,|x|/t\}.
\]
```

高度为什么是 $|x|/t$：把它乘回 $t$ 恰好等于 $\min\{t|y|,|x|\}$，于是重叠项变成 $t\|C(y)\|_1$，增量

$$\text{(eq \ref{eq:overlap-identity})}=t\|y\|_1-t\|C(y)\|_1=t\bigl(\|y\|_1-\|C(y)\|_1\bigr),$$

而这最后一步依赖 clip 的签名保持性质：$\|y\|_1=\|C(y)\|_1+\|y-C(y)\|_1$。这正是 `moduli:48-50` 那句 "Clipping preserves signs and reduces absolute values, so $\|y-C(y)\|_1=1-\|C(y)\|_1$"。我核对了 $\|y-C(y)\|=(|y|-|x|/t)_+$ 逐点成立：$|y|\le|x|/t$ 时 $C(y)=y$ 差为 $0$；$|y|>|x|/t$ 时 $|C(y)|=|x|/t$，差 $=|y|-|x|/t$。签名同向所以绝对值差就是差的绝对值。于是恒等式 (L1) 的下界问题被压缩成一件事：在某个余维有限子空间里，让 clip 抓不住一半以上的质量。

## 4 第二条死路：把"测度意义 totally bounded"直接当成范数紧

看到 "unit ball is totally bounded in measure" 我第二个念头是：那 $B_E$ 在 $d$（`intro:56-58` 的度量）意义下预紧，于是我可以拿一个有限 $d$-网 $\{b_i\}$，把每个 $y$ 用某个 $b_i$ 逼近，然后直接算 $\int\min\{|x|,t|y|\}\le\int\min\{|x|,t|b_i|\}+O(\text{误差})$。这条路我在 `moduli:28-39` 之前就在纸上试过，撞在两个机制上。

第一个：$d$-逼近给的是"大偏差集测度小"，而重叠积分 $\int\min\{|x|,t|y|\}$ 对测度小但幅度大的那部分完全不敏感。$y$ 与 $b_i$ 在一个测度 $\delta$ 的集合上相差 $1000$，$d$ 距离照样小，重叠可以差很多，因为 $|x|$ 可能在那 $\delta$ 集上正好很大。测度距离与 $L^1$ 距离之间唯一的通用桥梁是 Markov 与 $\min$ 的分摊，而这正是论文 `moduli:32-38` 做的：

```tex
indeed, every sequence in $B_E$
has a subsequence Cauchy in measure.  Clipping is pointwise
$1$-Lipschitz, so the clipped subsequence is also Cauchy in measure.
For two of its terms $b_i,b_j$ and any $a>0$,
\[
 \|b_i-b_j\|_1
 \le a+\int_{\{|b_i-b_j|>a\}}2|x|/t\,d\mathbb P.
\]
Choose $a$ small, then use absolute continuity of the integral and the
measure-Cauchy property.
```

这里我逐字核对右端的 $2|x|/t$：$b_i,b_j$ 是 clip 过的，绝对值都不超过 $|x|/t$，所以差值的绝对值 $\le|b_i|+|b_j|\le 2|x|/t$。分摊是 $|b_i-b_j|\le a\cdot\mathbf 1+a$ 型的：$|b_i-b_j|\le a$ 在好集上、$\le 2|x|/t$ 在坏集上，逐点取 $|b_i-b_j|\le a+(2|x|/t)\mathbf 1_{\{|b_i-b_j|>a\}}$ 再积分。"绝对连续性"用来让 $\int_{坏集}2|x|/t$ 随坏集测度趋于 $0$：$|x|\in L^1$，所以集列测度 $\to0$ 时积分 $\to0$。这一步把 $d$-Cauchy 变成 $L^1$-Cauchy。$a$ 先固定为小量、再让 $i,j$ 大，顺序不能反，因为坏集测度是随 $i,j$ 变的。

第二个：即便我证明了 $K=\overline{C(B_E)}^{L^1}$ 紧，$K$ 的元素都在 $L^1$ 而不在 $E$。$C(y)\notin E$ 是硬事实（`moduli:28` 明写"The clipped functions need not belong to $E$"）。我的原始打算是在 $E$ 内部拿有限网，然后写 $y=b+\text{小}$ 且 $b\in E$，那根本做不到，因为 $C$ 不是 $E$ 上的映射到 $E$。论文的解法是把有限网从 $E$ 挪到 $K$（$L^1$ 的紧集），然后从网里每个 $b_i$ 抽一个**泛函**，并非抽一个**向量**：

```tex
Fix $\varepsilon>0$ and take a finite $\varepsilon$-net
$b_1,\ldots,b_m$ of $K$.  Set $\sigma_i=\operatorname{sgn}(b_i)$ and
\[
 F=\bigcap_{i=1}^m\ker\left(y\longmapsto
                 \int\sigma_i y\,d\mathbb P\right)\subseteq E.
\]
This is a closed subspace of finite codimension.
```

这个"从向量到泛函"的换手是我认为本篇真正聪明的动作。$\sigma_i=\operatorname{sgn}(b_i)$ 作为 $L^\infty$ 函数给出 $L^1$ 上的连续线性泛函（范数 $\le1$），$m$ 个核的交余维 $\le m$。而 $y\in F$ 的意义是：$y$ 在每个网点的符号方向上均值为零，也就是 $y$ 在 $\sigma_i$ 这个"最坏的重叠模式"上自我抵消。这就是我原本要的"和 $b_i$ 错开"，只不过我错在用支撑集去定义错开，而对的手段是用符号函数去定义错开，因为重叠的质量核算只跟符号有关：$\int\sigma_i b_i=\|b_i\|_1$。

## 5 Lemma 2.1 逐字与逐块推导（四段式的第一个）

**(a) 原文陈述。** `moduli:17-22`：

```tex
\begin{lemma}\label{lem:clips}
Let $E$ be an infinite-dimensional closed real subspace of
$L^1(\Omega,\mathbb P)$, where $\mathbb P$ is a probability measure.
If its unit ball $B_E$ is totally bounded in measure, then
$H_E(x,t)\ge\max\{t/2,t-1\}$ for every $x\in S_E$ and $t>0$.
\end{lemma}
```

**(b) 推导，不跳步。** 我要把 `moduli:47-57` 那段不等式链在纸上重做一遍，因为它是整个 $1/2$ 的来源，而我第一次读的时候差点滑过去。取 $y\in S_F$（$\|y\|_1=1$）。选 $i$ 使 $\|C(y)-b_i\|_1<\varepsilon$。三个事实叠起来：

事实一（反向三角）：$\bigl|\|C(y)\|_1-\|b_i\|_1\bigr|\le\|C(y)-b_i\|_1<\varepsilon$，给出左端 $\|C(y)\|_1-\varepsilon\le\|b_i\|_1$。论文链里左边那一段写的正是这个。

事实二（符号抵消）：$\|b_i\|_1=\int|b_i|=\int\sigma_i b_i=\bigl|\int\sigma_i b_i\bigr|$，而 $\int\sigma_i y=0$ 因为 $y\in F$。所以 $\int\sigma_i b_i=\int\sigma_i(b_i-y)$，于是

$$\|b_i\|_1=\left|\int\sigma_i(b_i-y)\,d\mathbb P\right|\le\|b_i-y\|_1,$$

用到 $|\sigma_i|\le1$。论文 `moduli:52-55` 把这两步合并写成那一行带绝对值的中段。

事实三（分解）：$\|b_i-y\|_1\le\|b_i-C(y)\|_1+\|C(y)-y\|_1<\varepsilon+(1-\|C(y)\|_1)$，最后这个 $1-\|C(y)\|_1$ 是第 3 节末尾的 clip 分解，用了 $\|y\|_1=1$。

串起来：$\|C(y)\|_1-\varepsilon\le\varepsilon+1-\|C(y)\|_1$，移项得 $2\|C(y)\|_1\le1+2\varepsilon$，即

$$\|C(y)\|_1\le\frac12+\varepsilon .$$

这就是 `moduli:57` 那句 "Thus $\|C(y)\|_1\le1/2+\varepsilon$."。然后由 (eq:overlap-identity)：

$$\text{平均增量}=t\bigl(\|y\|_1-\|C(y)\|_1\bigr)\ge t\bigl(1-\tfrac12-\varepsilon\bigr)=\frac t2-t\varepsilon .$$

`moduli:58-61` 收束："The same bound holds for $\|y\|_1\ge1$ by radial monotonicity. Taking the supremum over $F$ and letting $\varepsilon\downarrow0$ gives $H_E(x,t)\ge t/2$."

radial monotonicity 这一步我补全了：令 $\phi(r)=\bigl(N(x+rw)+N(x-rw)\bigr)/2-1$。$r\mapsto N(x+rw)$ 与 $r\mapsto N(x-rw)$ 都是凸函数，所以 $\phi$ 在 $r\ge0$ 上凸、$\phi(0)=0$、且作为偶函数一半在 $r>0$ 单调不减（偶凸函数在 $[0,\infty)$ 不减：若 $0\le r_1<r_2$ 且 $\phi(r_2)<\phi(r_1)$，则中点处凸性会与 $\phi(0)=0$ 冲突）。对 $\|y\|_1=\rho\ge1$，取 $w=y/\rho\in S_F$，$\phi$ 在 $y$ 方向半径 $t$ 的值等于 $w$ 方向半径 $\rho t$ 的值 $\ge$ 半径 $t$ 的值 $\ge t/2-t\varepsilon$。所以下界从球面扩到 $\{N\ge1\}$。

**(c) 为什么是这个值。** 分母 $2$ 我结账到 $2\|C(y)\|_1\le1+2\varepsilon$ 这一步的移项：左边是 clip 抓住的质量，右边那个 $1$ 是 $\|y\|_1=1$，而"移到左边变 $2$"是因为 clip 质量同时出现在不等式两侧，一次来自反向三角、一次来自 clip 分解。所以 $1/2$ 是一个**二分**结果：符号泛函把单位质量强制劈成"与 $\sigma_i$ 同号的部分"和"异号的部分"，二者相等（因为总和为 $0$），而 clip 抓住的部分至多是同号部分加上 $\varepsilon$ 的网误差。这与中点定义里的 $\frac12$ 是**两个不同的 $1/2$**：定义里的 $\frac12$ 在 (eq:overlap-identity) 推导时被逐点恒等式吸收掉了（因为 $\max\{|a|,|b|\}$ 已经不含 $\frac12$），剩下的 $t/2$ 纯粹来自质量二分。这一点我原本以为要用到 AMUC 与最大模数的比值 $\tfrac12 m_N\le\widehat\delta_N$（`intro:31`），核对之后确认无关，$H_E$ 的 $t/2$ 与 $m_N$ 无关。

$\varepsilon$ 前面为什么带 $t$：因为整个式子被乘了 $t$（clip 高度是 $|x|/t$，重叠项是 $t\|C(y)\|_1$）。$t$ 越大，同样的网误差被放大得越多，但这无伤大雅，因为 $\varepsilon$ 可以随 $t$ 选。

$t-1$ 分支不需要引理的任何部分（除了 $x\in S_E$）：`moduli:65-68`：

```tex
For every $\|y\|_1\ge1$, the triangle inequality also gives
\[
 \frac{\|x+ty\|_1+\|x-ty\|_1}{2}-1\ge t\|y\|_1-1\ge t-1.
\]
```

我把这行的"triangle inequality"核到具体是哪一条：由 (eq:overlap-identity)，平均增量 $=\int(t|y|-|x|)_+\ge\int(t|y|-|x|)=t\|y\|_1-1$，用掉的 $\le$ 是 $(a-b)_+\ge a-b$。等号什么时候取不到：$t|y|\le|x|$ 处处成立时左边是 $0$、右边是负的。所以这条 $t-1$ 分支在 $t$ 小时是负的、被 $t/2$ 支配；两分支交点由 $t/2=t-1$ 给出，即 $t=2$。我把两条分支的支配关系写成 $t<2\Rightarrow t/2>t-1$、$t>2\Rightarrow t-1>t/2$、$t=2$ 时都等于 $1$。这与 `figures/moduli.tex:11` 画的 `blue` 折线 `(0,0)--(2,1)--(4.3,3.3)` 完全对上（斜率 $1/2$ 到 $(2,1)$、之后斜率 $1$），也与 `moduli:278` 那句 "converges to $1+(t-2)_+=\max\{1,t-1\}$" 对上：上界一侧的对应量是 $1+$ 增量，所以位移差 $1$。

这里我要登记一个我在论文措辞上发现的滑点，不是批评，是我第一次读错了：`moduli:65` 说 "the triangle inequality also gives"。若我照字面用反向三角不等式做，$\|x\pm ty\|\ge t\|y\|_1-\|x\|_1=t\|y\|_1-1$，两项平均再减 $1$ 只给 $t\|y\|_1-2\ge t-2$，比论文要的 $t-1$ 弱一个 $1$。真正成立的路径必须经过 max 恒等式（等价于 (eq:overlap-identity) 第二段），因为 max 恒等式让"中心 $x$ 的贡献"整体消失，并非只被减一次。也就是说：$H_E$ 的 $t-1$ 分支里那唯一被减的 $1$ 是定义里的归一化 $-1$，并非 $\|x\|=1$；$\|x\|=1$ 已经被 $\max\{|x|,t|y|\}\ge t|y|$ 吃干净了。相比之下 $D_E$ 的 $t-2$ 分支必须付两次 $1$，因为单侧量 $N(x+ty)$ 没有伙伴可以平均，只能对 $x$ 做一次反向三角（付 $1$）再减定义里的 $1$。这就是我说的"位移 $1$ 与 $2$ 分别从哪个归一化来"的答案。

**(d) 候选失败路线，三条，标 [推测]。**

其一：不用有限网、直接用整个紧集 $K$ 上的"平均符号泛函"。机制性停住点：$K$ 在 $L^1$ 里连续统般多，我要的 $F$ 必须余维**有限**，因为 $H_N$ 是 $\sup_{F\in\operatorname{cof}}$，取无限个条件后 $F\notin\operatorname{cof}(E)$，$H_N$ 的定义根本不认这个 $F$。而有限网恰好给有限个条件。这条路线的代价是 $\varepsilon$ 项，而 $\varepsilon$ 恰好能在取 sup 之后被 $\varepsilon\downarrow0$ 抹平（`moduli:60-61`）。[推测]
其二：让 $F$ 固定、不随 $\varepsilon$ 变。`moduli:62-63` 专门写了一句免责声明："The subspace is allowed to change with $\varepsilon$; this step does not assert that one subspace attains the limiting bound." 我试着反向做（先固定一个 $F$ 再让 $\varepsilon\to0$），停住点很硬：网必须为 $F$ 里出现的**所有** $y$ 而存在，而 $F$ 又由网定义，循环。定义里的 $\sup_F$ 恰好允许"逐 $\varepsilon$ 造 $F$"，所以我原本想要的"存在一个万能方向 $F$"在这类问题里几乎不可能成立，$H_E$ 的上界证明（第 10 节）也同样是逐 $\varepsilon$ 的，两者对称。[推测]
其三：把 clip 高度从 $|x|/t$ 改成常数高度 $M$（也就是截断，并非 clip）。停住点：$C(y)$ 与 $y$ 的关系变成 $\|y-C(y)\|_1=\int_{|y|>M}(|y|-M)$，它与 $|x|$ 无关；而重叠项 $\int\min\{|x|,t|y|\}$ 与它无法对齐，我就得不到"$\|C(y)\|_1$ 控制增量"的等式，符号泛函那条 $\int\sigma_i y=0$ 的等式也断了（$\sigma_i$ 对应的 $b_i$ 不再是"抓住的形状"）。[推测]

## 6 Remark 2.2：同一件事的反证版本，以及它为什么更短但更弱

`moduli:72-93` 的 remark 我读得很仔细，因为它是"另一种可能已经被作者检查过"的记录：

```tex
\begin{remark}[A separated-sequence proof]\label{rem:separated}
There is also a short contradiction argument giving the same half-mass
bound. Fix a unit center $x$, a radius $t>0$, and $0<a<1/2$.
Suppose no subspace of finite codimension had averaged increment at
least $at$ in every direction of norm at least one. By radial monotonicity and
Equation~\eqref{eq:overlap-identity}, every subspace of finite
codimension would then contain a unit vector $y$ with
$\|y-C(y)\|_1<a$. Inductively choose such $y_j$ in the kernels of
norm-one functionals norming the preceding vectors.  Then
$\|y_i-y_j\|_1\ge1$ for $i\ne j$.  Compactness of the clipped set gives
a subsequence whose clips are Cauchy in norm, whereas along this
subsequence
\[
 \|y_i-y_j\|_1
 \le\|y_i-C(y_i)\|_1+\|C(y_i)-C(y_j)\|_1
          +\|C(y_j)-y_j\|_1<2a+o(1)<1,
\]
a contradiction for sufficiently late pairs. Thus this argument yields
$H_E(x,t)\ge t/2$ by taking the supremum over the corresponding subspaces
and then letting $a\uparrow1/2$. The finite-net proof above identifies
an explicit finite family of functionals that removes the overlap.
\end{remark}
```

**(b) 推导。** 反设命题：没有任何有限余维子空间在所有 $\ge1$ 方向上给出 $\ge at$ 的平均增量。由 $H_N(x,t)=\sup_F\inf_{y}$，反设给出：每个 $F\in\operatorname{cof}(E)$ 都有 $\inf_{y\in S_F}$ 平均增量 $<at$（严格说 $\le at$ 就够了，因为定义是 sup，取不到上确界时逐个 $F$ 只能给出一个略小的方向；论文写"contain a unit vector $y$ with $\|y-C(y)\|_1<a$"，用的是 $t\|y-C(y)\|_1<at$ 的等价形式，即把 $\le$ 与 $a$ 的余量吸收进"取稍大的 $a$"）。$y$ 与 $-y$ 的地位在平均里对称，所以 $\|y-C(y)\|_1<a$ 就是"clip 抓住至少 $1-a$"。

归纳取 $y_1,y_2,\dots$：给定 $y_1,\dots,y_{j-1}$，取 norming 它们的范数一泛函 $\varphi_i$（$\varphi_i(y_i)=\|y_i\|_1=1$），令 $F_j=\bigcap_{i<j}\ker\varphi_i$，仍余维有限，按反设里面有单位 $y_j$ 满足 $\|y_j-C(y_j)\|_1<a$。分离性：$i<j$ 时 $\varphi_i(y_i)=1$ 而 $\varphi_i(y_j)=0$，所以

$$\|y_i-y_j\|_1\ge\varphi_i(y_i-y_j)=1 .$$

clip 集紧给出子列 $\|C(y_i)-C(y_j)\|_1\to0$。沿该子列

$$\|y_i-y_j\|_1\le a+\|C(y_i)-C(y_j)\|_1+a<2a+o(1)<1,$$

最后一步用 $a<1/2$。与 $\ge1$ 矛盾，对充分晚的对成立。于是原反设不成立，$H_E(x,t)\ge at$ 对每个 $a<1/2$，取 $a\uparrow1/2$。

**(c) 参数为什么这样。** $a$ 的上界 $1/2$ 出现在三处，是同一件事：$\|y_i-y_j\|\ge1$（这是"分离阈值"，来自 norming 泛函取值差 $1-0=1$）与 $\|y_i-y_j\|\le2a+o(1)$ 相撞，$1$ 与 $2a$ 相遇就是 $a=1/2$。这个 $1$ 之所以是 $1$ ，并非别的数，是因为 norming 泛函在 $y_i$ 上取 $\|y_i\|=1$、在 $y_j$ 上取 $0$。如果我把 norming 泛函换成别的（比如只要求 $\varphi_i(y_i)\ge c$），分离阈值变 $c$，矛盾条件变成 $2a<c$，而反设里的"抓不住"强度与 $c$ 无关，所以最优选 $c=1$。Remark 最后一句给出两个证明的真正差别："The finite-net proof above identifies an explicit finite family of functionals that removes the overlap." 也就是有限网证明给的是**构造性**的 $m$ 个泛函，反证版只给存在性。这对 Lean 那边有实际影响（`clipping:109` 起是显式的 $\sup$ 构造链），我在第 17 节对账。

**(d) 候选失败路线，两条，标 [推测]。** 其一：把归纳里的 norming 泛函改成"分隔 $y_i$ 支撑"的泛函。停住点：$L^1$ 的单位向量未必有支撑可言（一般函数支撑是测度集，不是开集），而且第 $j$ 步的 $F_j$ 必须是闭的有限余维子空间，只有连续泛函的核能保证；用支撑分隔造出的条件未必连续。其二：让 $a\uparrow1/2$ 之前先把 $t$ 送出去。停住点：分离阈值与 $t$ 无关，而 $2a+o(1)$ 里的 $o(1)$ 只依赖子列，跟 $t$ 也无关，所以 $t$ 只能乘在最后的结果上，$H_E\ge a t$ 里 $t$ 是纯外因子；这条路线对 $t-1$ 分支毫无帮助（$t-1$ 来自逐点 max 恒等式，与紧性无关）。[推测]

## 7 转折点：从"抓不住一半质量"到"任何弱邻域里都有几乎对径的点"

第 3、4、5、6 节给我的是下界。我原来的计划是继续在同一条 $L^1$ 逐点路线上做出上界，也就是找一个具体的余维有限子空间，在里面造出具体的方向 $y$ 使平均增量恰好是 $\max\{t/2,t-1\}$。我很快发现方向错了：$H_E(x,t)$ 的定义是 $\sup_F$，所以上界必须对**每一个** $F\in\operatorname{cof}(E)$ 都成立，我不能挑 $F$。逐点 $L^1$ 技巧在这里全部失效，因为任意一个给定的 $F$（比如"$\int_\Omega y=0$"这种条件）可能把 $x$ 的支撑整个覆盖掉，我没有关于 $F$ 的任何结构信息。

这个"上界要对所有 $F$ 成立"的要求，加上"下界只要构造一个 $F$"的不对称，是我这次研究里最大的认知转折。它意味着上界必须依赖一个**对一切余维有限约束都成立**的几何性质，而 $E$ 上唯一具有这种普适度性质的假设就是 Daugavet 性质。`intro:104-113` 那段路线宣言现在读起来就是这件事：

```tex
Section~\ref{sec:weak-neighborhoods} develops the other
input: every weak neighborhood of a unit vector contains points almost
at distance two from it.  This is the needed case of Shvydkoy's
weak-open characterization of the Daugavet property
\cite[Lemma~3]{Shvydkoy2000}, obtained from the slice characterization
of Kadets, Shvidkoy, Sirotkin, and Werner \cite[Lemma~2.2]{KSSW2000}.
In Section~\ref{sec:curves}, correcting a finite-dimensional quotient
coordinate turns those almost diametral differences into directions in
any prescribed subspace of finite codimension, giving both upper curves.
```

链条是三层：Daugavet $\Rightarrow$ slice 版本（引理 2.3）$\Rightarrow$ 凸组合 of slices 塞进弱邻域（Bourgain 引理 2.4）$\Rightarrow$ 弱邻域里直径为 $2$（引理 2.5）。三层我都要单独结账，因为每一层的损失方式不同。

## 8 Lemma 2.3（Daugavet 的 slice 刻画）四段式

**(a) 原文。** `moduli:100-104` 的 slice 定义与 `moduli:110-114` 的陈述：

```tex
A \emph{slice} of $B_X$ is a nonempty set
\[
 H=\{y\in B_X:\ell(y)>\alpha\},\qquad
 \ell\in X^*,\quad\alpha\in\mathbb R.
\]
```

```tex
\begin{lemma}[Daugavet slice characterization]\label{lem:daugavet-slices}
A nonzero real Banach space $X$ has the Daugavet property if and only if,
for every $w\in S_X$, every $\rho>0$, and every slice $H$ of $B_X$,
there is $y\in H$ with $\|w+y\|\ge2-\rho$.
\end{lemma}
```

注意两处量化：$y$ 只要求在 $H\subseteq B_X$ 里（$\|y\|\le1$），而 slice 定义里"nonempty"是 slice 概念的一部分（`moduli:100` 那个词）。这两点在 Lean 里都被改动过，我在第 17 节对账。

**(b) 推导。** 正向（`moduli:116-127`）。$H$ 的定泛函为零时 $H=B_X$（因为 slice 非空要求 $\alpha<0$），取 $y=w$，$\|w+w\|=2\ge2-\rho$。一般情形把泛函与阈值同除其范数：$\|\ell\|=1$、$\alpha<1$（后者由非空：存在 $y$ 使 $\ell(y)>\alpha$，而 $|\ell(y)|\le\|y\|\le1$，所以 $\alpha<1$）。取 $0<\eta<\min\{1-\alpha,\rho/2\}$。rank-one 算子 $Ty=\ell(y)w$ 的范数 $=\|\ell\|\|w\|=1$，Daugavet 给 $\|I+T\|=1+\|T\|=2$，于是存在 $y\in S_X$ 使 $\|y+\ell(y)w\|>2-\eta$（严格不等号来自算子范数是 sup，未必取到；这正是 Lean 里 `exists_unit_near_opNorm`（`slices:15`）的作用）。把 $y$ 换成 $-y$ 使 $\ell(y)\ge0$：$\|-y-\ell(y)w\|=\|y+\ell(y)w\|$ 不变。于是

$$2-\eta<\|y+\ell(y)w\|\le\|y\|+|\ell(y)|\|w\|=1+\ell(y)\ \Rightarrow\ \ell(y)>1-\eta>\alpha,$$

所以 $y\in H$。再补回 $w$：

$$\|y+w\|\ge\|y+\ell(y)w\|-\|(1-\ell(y))w\|>2-\eta-(1-\ell(y))\ge 2-\eta-\eta=2-2\eta>2-\rho.$$

用到 $0\le\ell(y)\le\|y\|=1$，所以 $1-\ell(y)\le\eta$；以及 $\eta<\rho/2$。

反向（`moduli:129-141`）。$Tz=\ell(z)v$ 非零 rank-one，$\|\ell\|=1$，$a=\|v\|=\|T\|$，$w=v/a\in S_X$。取 $0<\eta<1$，slice 条件作用在 $H=\{y\in B_X:\ell(y)>1-\eta\}$（非空因为 $\|\ell\|=1$，sup 是 $1$，所以有 $y$ 使 $\ell(y)>1-\eta$）。得 $y$：$\ell(y)>1-\eta$、$\|w+y\|\ge2-\eta$。取 norming $w+y$ 的范数一泛函 $\varphi$（$\varphi(w+y)=\|w+y\|$）。$\|w\|=1$、$\|y\|\le1$，所以 $\varphi(w)\le1$、$\varphi(y)\le1$，而和 $\ge2-\eta$，于是各 $\ge1-\eta$。因此

$$\|I+T\|\ge\|y+Ty\|=\|y+\ell(y)v\|=\|y+a\ell(y)w\|\ge\varphi(y)+a\ell(y)\varphi(w)\ge(1-\eta)+a(1-\eta)^2 .$$

$\eta\downarrow0$ 得 $\|I+T\|\ge1+a=1+\|T\|$；反向 $\|I+T\|\le\|I\|+\|T\|=1+\|T\|$ 恒成立。$T=0$ 时等式 $\|I\|=1=\|I\|+\|0\|$ 显然。

**(c) 每个常数与指数的机械理由。** $\eta$ 的 $0<\eta<\min\{1-\alpha,\rho/2\}$ 两个分量分别锁死两处使用：$1-\alpha$ 保证 $\ell(y)>1-\eta>\alpha$，即"造出来的点确实落在给定的 slice 里"；$\rho/2$ 保证 $2-2\eta>2-\rho$。$2\eta$ 是两次损失之和：第一次来自 sup 不取到的逼近误差 $\eta$，第二次来自把 $\ell(y)w$ 换成 $w$ 时多出的 $(1-\ell(y))w$，而后者被同一个 $\eta$ 控制。所以 $2$ 是"两个 $\eta$ 级误差"，与任何优化无关。反向里的 $(1-\eta)^2$ 也是两次损失的乘积形式：$\ell(y)>1-\eta$ 贡献一个 $(1-\eta)$，$\varphi(w)\ge1-\eta$ 贡献第二个；而 $\varphi(y)\ge1-\eta$ 贡献第三个一次项 $(1-\eta)$。三个损失合起来是 $(1-\eta)+(1-\eta)^2$ 的形态，$\eta\to0$ 时它 $=2+\mathcal O(\eta)$。

为什么必须有"$y\in H$ 且 $\|w+y\|\ge2-\rho$"里 $w$ 与 $H$ 的地位不对称：Daugavet 等式对 $I+T$ 里的 $w$（算子的值方向）与 $y$（定义域方向的近乎极值点）不对称，因为 $\ell(y)$ 是标量、可以 $\ge0$ 化，而 $w$ 是单位向量、只能补回差。这个不对称决定了正向证明里"flip $y$"那一步是唯一的符号处理，Lean 在 `slices:29` 的 `daugavet_normalized_slice` 把它显式做掉了。

**(d) 候选失败路线，三条，标 [推测]。** 其一：跳过 slice、直接用弱开集。停住点：Daugavet 等式只给我"存在 $y$ 使 $\|(I+T)y\|$ 接近 $2$"，它天然给出的是由 $\ell$ 定义的半空间（slice），并非弱开集；弱开集是有限多个 $\ell_i$ 的交，Daugavet 等式只带一个 $\ell$。所以必须有个"从单个 slice 到有限交"的桥，那就是 Bourgain 引理。其二：把 $T$ 取成 $\ell(\cdot)v$ 但让 $v$ 不单位化，直接 $\|y+\ell(y)v\|\ge\ldots$。停住点：这样 $a=\|v\|$ 与 $\varphi(v)$ 的关系要重新算，论文把它拆成 $w=v/a$ 加 $a$ 外因子，正好让 $\varphi(w)\ge1-\eta$ 与 $a$ 相乘，所以单位化是把 $a$ 从估计里剥出来。其三：我想把反向证明里的 $\varphi$ 一次取好（先固定 $\varphi$ 再选 $y$）。停住点：$\varphi$ 要 norm $w+y$，而 $y$ 是 slice 条件给的，二者互相依赖；论文的写法是先有 $y$ 后有 $\varphi$，所以损失变成三次，并非可控的一次。[推测]

## 9 Bourgain 引理（引理 2.4）四段式：凸包与 exposed points

**(a) 原文。** `moduli:151-155`：

```tex
\begin{lemma}[Bourgain's lemma]\label{lem:slice-combination}
Every nonempty relatively weakly open subset $U$ of a real Banach
space's closed unit ball contains a convex combination of nonempty
slices of that ball.
\end{lemma}
```

论文在 `moduli:144-150` 交代出处与做法："We give a finite-dimensional proof. Its use in passing to weak neighborhoods follows the same pattern as Shvydkoy's proof of the weak-open characterization"，文献记到 `\cite{ANP2019}`。

**(b) 推导。** 我要把 `moduli:157-195` 的完整链条补出来，因为这里面藏着一个我觉得最容易被略过的紧性论证。

第一步（局部化到有限维像）。$U$ 相对弱开且非空，取 $u\in U$。相对弱开集在 $B_X$ 里可由有限个连续泛函控制：存在连续线性 $T:X\to\mathbb R^k$ 与 $\mathbb R^k$ 中开集 $O$，使 $u\in B_X\cap T^{-1}(O)\subseteq U$。$D=\overline{T(B_X)}$ 是 $\mathbb R^k$ 里的紧凸集。目标：把 $D$ 内部一小块凸组合拉回 $B_X$ 成 slices 的凸组合。

第二步（exposed points 稠到能生成 $D$）。用欧氏范数，$M=\max_{q\in D}|q|$。给单位向量 $a$ 与 $R>M$，取 $p_R\in D$ 使 $|p_R+Ra|$ 最大（即离 $-Ra$ 最远）。对任意 $q\in D$：$|q+Ra|^2\le|p_R+Ra|^2$ 展开得 $|q|^2+2Ra\cdot q\le|p_R|^2+2Ra\cdot p_R$，即 $2Ra\cdot(q-p_R)\le|p_R|^2-|q|^2$。又 $|q-p_R|^2=|q|^2-2q\cdot p_R+|p_R|^2$ 给出 $2p_R\cdot(q-p_R)=|q|^2-|p_R|^2-|q-p_R|^2$。两式相加：

$$2(p_R+Ra)\cdot(q-p_R)=|q|^2-|p_R|^2-|q-p_R|^2+2Ra\cdot(q-p_R)\le-|q-p_R|^2,$$

因为 $2Ra\cdot(q-p_R)\le|p_R|^2-|q|^2$。这正是 `moduli:168` 那行。右端 $\le0$ 且等号仅在 $q=p_R$ 时成立，所以 $p_R$ 是线性泛函 $q\mapsto(p_R+Ra)\cdot q$ 在 $D$ 上的**唯一**极大点，即 exposed point。

第三步（exposed 的支撑值逼近任意方向的 sup）。设 $q_a$ 是 $a\cdot q$ 在 $D$ 上的极大点。用同一比较式（把 $q=q_a$ 代入 $2Ra\cdot(q_a-p_R)\le|p_R|^2-|q_a|^2$）：

$$0\le a\cdot q_a-a\cdot p_R\le\frac{|p_R|^2-|q_a|^2}{2R}\le\frac{M^2}{2R},$$

因为 $|p_R|\le M$、$|q_a|\ge0$。$R\to\infty$：对每个方向 $a$，exposed points 上的 sup 与 $D$ 上的 sup 相同。若 $D$ 不等于 exposed points 的闭凸包，分离定理给一个方向 $a$ 使二者 sup 不同，矛盾。论文 `moduli:179` 那句 "also when $D$ is a singleton" 处理的正是退化情形：$D$ 单点时它自己就是 exposed point（任何非零泛函唯一极大），且分离论证要单独说。

第四步（塞进 $O$）。$T(u)\in O$ 且 $O$ 开，$T(u)\in\overline{\operatorname{co}}$(exposed)，所以存在 exposed points $p_1,\dots,p_l$ 与**严格正**权重 $\lambda_i$（和为 $1$）使 $p=\sum\lambda_ip_i\in O$。取 $r>0$ 使欧氏球 $B(p,r)\subseteq O$。$p_i$ 由 $a_i\cdot q$ unique-exposed，紧性给阈值 $\beta_i<a_i\cdot p_i$ 使 $\{q\in D:a_i\cdot q>\beta_i\}\subseteq B(p_i,r)$（唯一性 + 紧性 $\Rightarrow$ 上水平集随 $\beta_i\uparrow a_i\cdot p_i$ 收缩到 $\{p_i\}$）。令 $H_i=\{y\in B_X:a_i\cdot T(y)>\beta_i\}$，非空因为 $T(B_X)$ 在 $D$ 中稠密且 $\beta_i<a_i\cdot p_i\le\sup_D a_i\cdot$。$y_i\in H_i$ 时 $T(y_i)\in B(p_i,r)$，所以

$$\Bigl|T\bigl(\sum\lambda_iy_i\bigr)-p\Bigr|\le\sum\lambda_i|T(y_i)-p_i|<\sum\lambda_ir=r,$$

即 $\sum\lambda_iy_i\in T^{-1}(O)\cap B_X\subseteq U$。$\sum\lambda_iH_i\subseteq U$。

**(c) 每个量的理由。** $k$ 有限、$l$ 有限：这是引理的全部意义，因为下一步引理 2.5 的损失是 $(1-\eta)^l$，$l$ 有限才能 $\eta\to0$。$R>M$：保证 $p_R+Ra\ne0$（否则"由该系数定义的线性泛函"是零泛函，谈不上 exposed）。$M^2/(2R)$：$R$ 在分母一次，所以 $R\to\infty$ 提供逼近，$M$ 是 $D$ 的欧氏半径、有限因为紧。$\lambda_i>0$（严格正）：下一步 $z_i$ 的递推 $\|z_i\|\ge(1-\eta)(\|z_{i-1}\|+\lambda_i)>0$ 需要 $\lambda_i>0$ 才不为零，否则归纳在第 $i$ 步断掉。$B(p_i,r)$ 的半径 $r$：论文只要求存在，最后靠 $\sum\lambda_i|T(y_i)-p_i|<r$ 加权平均掉，所以每个 slice 的像落在以 $p_i$ 为中心、半径 $r$（不是 $r/\lambda_i$）的球里就够了，因为最后取的是加权和与 $p=\sum\lambda_ip_i$ 的距离。

**(d) 失败路线，三条，标 [推测]。** 其一：跳过 exposed points、直接用 Krein-Milman 说 $D=\overline{\operatorname{co}}$(extreme points)。停住点：extreme point 给不出"唯一极大"，而 $\{q:a_i\cdot q>\beta_i\}\subseteq B(p_i,r)$ 这一步依赖唯一性 $\times$ 紧性；非唯一极大时上水平集会是一整段，塞不进小球。Bishop-Phelps 定理（exposed points 稠）在这里可以用，但要另立引理且要凸紧集版本；论文选择用"离外部点最远"的初等论证自给自足。其二：直接用 $U$ 的标准弱开表示（$\{|\varphi_j(x-u)|<\delta\}$）当 slices 的交，跳过 Bourgain。停住点：有限个 slice 的**交**是弱开集，但我需要反过来：给定的弱开集要含 slices 的**凸组合**，并非它的交。$T^{-1}(O)$ 里的点集是 $T$ 的原像，原像本身不是 slice，而且凸组合是必需的，因为下一步的归纳是沿"权重 $\lambda_i$"累加 $z_i=z_{i-1}+\lambda_iy_i$ 的。其三：把 $T(B_X)$ 的闭包换成 $T$ 的限制到某个有限维子空间上。停住点：$B_X$ 无穷维，$T(B_X)$ 已经紧，换成子空间会破坏"$U$ 里"的定位。[推测]

## 10 引理 2.5：弱邻域里直径等于 2，以及 $(1-\eta)^l$ 的来源

**(a) 原文。** `moduli:202-208`：

```tex
\begin{lemma}\label{lem:diametral}
If $X$ has the Daugavet slice property, then, for every $x\in S_X$ and
every relatively weakly open neighborhood $U$ of $x$ in $B_X$,
\[
 \sup_{v\in U}\|v-x\|=2.
\]
\end{lemma}
```

**(b) 推导。** Bourgain 给 slices $H_i$ 与正权重 $\lambda_i$，$\sum\lambda_i=1$、$\sum\lambda_iH_i\subseteq U$。固定 $0<\eta<1$，令 $z_0=-x$（$\|z_0\|=1$）。第 $i$ 步：slice 条件用在 $z_{i-1}/\|z_{i-1}\|\in S_X$ 与 $H_i$ 上，得 $y_i\in H_i$ 使 $\|z_{i-1}/\|z_{i-1}\|+y_i\|\ge2-\eta$。取 norming 该和的单位泛函 $\varphi_i$：两个加数分别有范数 $1$ 与 $\le1$（$y_i\in B_X$），和 $\ge2-\eta$，故 $\varphi_i(z_{i-1}/\|z_{i-1}\|)\ge1-\eta$、$\varphi_i(y_i)\ge1-\eta$。令 $z_i=z_{i-1}+\lambda_iy_i$：

$$\|z_i\|\ge\varphi_i(z_i)=\|z_{i-1}\|\varphi_i\Bigl(\frac{z_{i-1}}{\|z_{i-1}\|}\Bigr)+\lambda_i\varphi_i(y_i)\ge(1-\eta)\|z_{i-1}\|+(1-\eta)\lambda_i .$$

这同时给出 $\|z_i\|\ge(1-\eta)(\|z_{i-1}\|+\lambda_i)>0$（因 $\lambda_i>0$），归纳良定义。解递推：记 $c=1-\eta$，$a_i=\|z_i\|$，$a_i\ge ca_{i-1}+c\lambda_i$，$a_0=1$。迭代：

$$a_l\ge c^la_0+\sum_{i=1}^lc^{l-i}\cdot c\lambda_i=c^l+\sum_{i=1}^l\lambda_ic^{l-i+1},$$

与 `moduli:224-226` 完全一致。因为 $i\ge1$ 时 $l-i+1\le l$ 且 $0<c<1$，$c^{l-i+1}\ge c^l$，所以第二项 $\ge c^l\sum\lambda_i=c^l$，合起来 $a_l\ge2c^l=2(1-\eta)^l$。末了 $v=\sum\lambda_iy_i\in U$ 且 $z_l=v-x$（因 $z_0=-x$ 与逐步加 $\lambda_iy_i$）。令 $\eta\downarrow0$ 得 $\sup_U\|v-x\|\ge2$；反向 $\le\|v\|+\|x\|\le2$。

**(c) 指数的理由。** $l$ 是 slices 的个数，有限；$(1-\eta)^l\to1$ 需要 $l$ 在 $\eta$ 之前固定。这就是我核对出的整节结构约束：Bourgain 引理必须给**有限**个 slices（它给的是有限凸组合，因为 $O$ 里的点用有限凸组合逼近），否则 $2(1-\eta)^l$ 在 $l\to\infty$ 时趋于 $0$，整个论证归零。$2(1-\eta)^l$ 里的 $2$ 来自 $a_0=1$（即 $\|-x\|=1$）与 $\sum\lambda_i=1$ 两个单位量之和，展开到 $\eta$ 小量：$2(1-l\eta)+o(\eta)$，所以给定 $\rho$ 需要 $\eta\lesssim\rho/(2l)$，论文用极限语言回避了这个显式关系。

$z_0=-x$ ，并非 $x$：结论要 $\|v-x\|$，而 slice 条件给 $\|w+y\|\ge2-\rho$（**加**号），所以必须把负号预先吸进 $z_0$，让归纳目标成为 $\|z_l\|=\|v-x\|$。这是个纯记号选择，但它决定递推里所有 $\varphi$ 的取值符号，我核对过若取 $z_0=x$ 则末项是 $\|v+x\|$，是另一件事。

**(d) 失败路线，两条，标 [推测]。** 其一：把 slice 条件直接用在 $U$ 上（把 $U$ 当 slice）。停住点：$U$ 未必是 slice，它是 $k$ 个泛函条件的交，slice 条件只保证"单个 slice 里能找到几乎对径点"，一次一个泛函。这正是需要 Bourgain 的原因。其二：把归纳换成"一次取 $l$ 个 $y_i$ 使 $\|\sum\lambda_iy_i-x\|\ge\ldots$"。停住点：对径性只对**当前**部分和方向成立，不能同时对 $-x$ 与后面所有增量成立；论文的做法是在每一步把中心更新为"当前部分和"，这正是 slice 条件里 $w$ 可以任意选（只是必须单位化）带来的自由度。这个"w 每步更新"是我认为引理 2.5 的全部难点，其余都是记号。[推测]

## 11 上界证明逐块拆：一条方向族同时给两条曲线

第 3 节 `moduli:232-290` 是一整个 `proof` 环境，标题写的是"Proof of the formulas in Theorem 1.1"。它包含我列的 (L2)、(U1)、(U2) 三块。

**(a) 原文（下界那块）。** `moduli:235-241`：

```tex
Lemma~\ref{lem:clips} gives the averaged lower bound.  For the one-sided
bound, choose a norm-one functional $\varphi$ with
$\varphi(x)=1$.  Every $y\in S_{\ker\varphi}$ satisfies
\[
 \|x+ty\|\ge1,\qquad \|x+ty\|\ge t-1.
\]
Hence $D_E(x,t)\ge\max\{0,t-2\}$.
```

**(b) 推导。** $\varphi$ 由 Hahn-Banach 给出（Lean 里是 `exists_dual_vector`，`lower:216`）。$\ker\varphi$ 闭、余维 $1$，且因为 $E$ 无穷维它非零，所以 $S_{\ker\varphi}\ne\varnothing$；这是 $D_E\ge\max\{0,t-2\}$ 里唯一用到无穷维的地方（在 $\sup_F$ 的定义下，我只需 exhibits 一个 $F$）。第一条：$\|x+ty\|\ge\varphi(x+ty)=\varphi(x)+t\varphi(y)=1+0=1$，所以 $D$ 的增量 $\|x+ty\|-1\ge0$。第二条：反向三角 $\|x+ty\|\ge t\|y\|-\|x\|=t-1$，所以增量 $\ge t-2$。两条合起来 $\ge\max\{0,t-2\}$，对每个 $y\in S_{\ker\varphi}$ 成立，取下确界、再对 $F$ 取上确界。

**(c) 位移 2 的账。** 这里 $2=1+1$：第一个 $1$ 是反向三角里被减去的 $\|x\|=1$，第二个 $1$ 是 $D_N$ 定义里的归一化 $-1$。与第 5 节 $H_E$ 的 $t-1$ 分支对照：那边只付一个 $1$，因为 $\max\{|x|,t|y|\}\ge t|y|$ 把中心的贡献整体吞掉；这边 $D_N$ 是单侧量，没有伙伴可平均，所以中心的 $1$ 必须显式付出来。这就是两个模数在 $t$ 轴上错开一个单位的根本原因，也是 $\overline\delta_E$ 在 $[0,2]$ 上恒为零而 $\widehat\delta_E$ 从原点就线性增长的原因。图 `figures/moduli.tex:11-12` 的两条线 `(0,0)--(2,1)--(4.3,3.3)`（蓝，实，averaged）与 `(0,0)--(2,0)--(4.3,2.3)`（橙，虚，one-sided）在 $t=4.3$ 处纵坐标差正好 $1$，与此一致。

**(a)(b)(c) 上界那块。** `moduli:243-289` 我把它按七个动作拆：

动作一（给任意 $F$ 配投影）。"fix any $F\in\operatorname{cof}(E)$ and choose a bounded finite-rank projection $P$ with kernel $F$. Such a projection is obtained by composing the quotient map with a linear section of $E/F$."。机制：$E/F$ 有限维，任一 algebraic section $s:E/F\to E$ 自动连续（有限维上线性映射连续），$P=s\circ q$，$q:E\to E/F$ 商映射。$\ker P=F$，$\operatorname{ran}P=s(E/F)$ 有限维，$P^2=sq\,sq=s(\operatorname{id})P=P$？核对：$P^2=s\circ(q\circ s)\circ q=s\circ\operatorname{id}_{E/F}\circ q=P$，因为 $q\circ s=\operatorname{id}$。是投影。

动作二（造弱邻域）。$0<\varepsilon<1/2$，$U_\varepsilon=\{v\in B_E:\|P(v-x)\|<\varepsilon\}$。论文 `moduli:250-251` 的理由："The finite-dimensional range of $P$ makes it weak-to-norm continuous." 展开：$P$ 连续线性故弱-弱连续；有限维值空间的弱拓扑 $\tau$ 上任何线性泛函连续，且弱=欧氏拓扑；所以 $v\mapsto\|P(v-x)\|$ 作为 $E$ 上弱连续函数取实值，其 $<\varepsilon$ 水平集与 $B_E$ 的交是相对弱开。$x\in U_\varepsilon$ 因为 $P(x-x)=0$。

动作三（取对径点）。引理 2.5 给 $v_\varepsilon\in U_\varepsilon$，$\|v_\varepsilon-x\|>2-\varepsilon$。

动作四（投影修正）。$z_\varepsilon=(I-P)(v_\varepsilon-x)$，$L_\varepsilon=\|z_\varepsilon\|$，$y_\varepsilon=z_\varepsilon/L_\varepsilon$。核对 $y_\varepsilon\in S_F$：$(I-P)$ 的值在 $\ker P=F$（因 $P(I-P)=P-P^2=0$），所以 $z_\varepsilon\in F$。$L_\varepsilon>0$ 由下面的夹逼。这一步就是我第 7 节说的"correcting a finite-dimensional quotient coordinate"：对径点 $v_\varepsilon-x$ 落在商坐标 $P$ 的小球里，把它抹掉就得到一个真正在 $F$ 里的方向，代价至多 $\varepsilon$。

动作五（两个夹逼，`moduli:260-263`）。左：$L_\varepsilon=\|(I-P)(v_\varepsilon-x)\|\ge\|v_\varepsilon-x\|-\|P(v_\varepsilon-x)\|>(2-\varepsilon)-\varepsilon=2-2\varepsilon$。右：$L_\varepsilon\le\|v_\varepsilon-x\|\le\|v_\varepsilon\|+\|x\|\le1+1=2\le2+\varepsilon$。第二条 $x+z_\varepsilon$：$x+z_\varepsilon=x+(I-P)(v_\varepsilon-x)=x+v_\varepsilon-x-P(v_\varepsilon-x)=v_\varepsilon-P(v_\varepsilon-x)$，故 $\|x+z_\varepsilon\|\le\|v_\varepsilon\|+\|P(v_\varepsilon-x)\|\le1+\varepsilon$。这里"终点离球不远"是关键：$x+z_\varepsilon$ 接近 $B_E$，因为它是球内点 $v_\varepsilon$ 减去一个小量。

动作六（凸分解，`moduli:267-277`）。任意 $t>0$，$\lambda=\min\{t/L_\varepsilon,1\}$，恒等式

$$x+ty_\varepsilon=(1-\lambda)x+\lambda(x+z_\varepsilon)+(t-L_\varepsilon)_+y_\varepsilon .$$

我在纸上验算过右端：$(1-\lambda)x+\lambda x+\lambda z_\varepsilon+(t-L_\varepsilon)_+y_\varepsilon=x+\lambda L_\varepsilon y_\varepsilon+(t-L_\varepsilon)_+y_\varepsilon$，而 $\lambda L_\varepsilon=\min\{t,L_\varepsilon\}$，$\min\{t,L\}+(t-L)_+=t$。成立。三角不等式给

$$\|x+ty_\varepsilon\|\le(1-\lambda)\|x\|+\lambda\|x+z_\varepsilon\|+(t-L_\varepsilon)_+\|y_\varepsilon\|\le(1-\lambda)+\lambda(1+\varepsilon)+(t-L_\varepsilon)_+\le1+\varepsilon+(t-L_\varepsilon)_+,$$

用了 $\|x\|=\|y_\varepsilon\|=1$、$\lambda\le1$。这正是 `moduli:273-277` 说的 "the single bound"。

动作七（取极限并分账）。$\varepsilon\to0$ 时 $L_\varepsilon\to2$（夹逼），$(t-L_\varepsilon)_+\to(t-2)_+$，右端 $\to1+(t-2)_+=\max\{1,t-1\}$。$D$ 的增量上界 $\le\max\{1,t-1\}-1=(t-2)_+=\max\{0,t-2\}$。$H$ 那边补一条 $\|x-ty_\varepsilon\|\le\|x\|+t\|y_\varepsilon\|=1+t$，于是平均 $\le\bigl(1+\varepsilon+(t-L_\varepsilon)_++1+t\bigr)/2$，增量 $\le\bigl(t+(t-L_\varepsilon)_++\varepsilon\bigr)/2\to\bigl(t+(t-2)_+\bigr)/2$。`moduli:282-285` 明写这两个上极限是 "$(t-2)_+,\ \frac{t+(t-2)_+}2$"，然后"$\max\{0,t-2\}$ and $\max\{t/2,t-1\}$"。我核对最后这个等式：$t\le2$ 时 $\bigl(t+0\bigr)/2=t/2$ 且 $t\le t-1$ 不成立（$t/2\ge t-1$ 当 $t\le2$）；$t\ge2$ 时 $\bigl(t+t-2\bigr)/2=t-1$ 且 $t-1\ge t/2$ 当 $t\ge2$。所以 $\bigl(t+(t-2)_+\bigr)/2=\max\{t/2,t-1\}$ 逐点成立，两个分支在 $t=2$ 交接，交接处值都是 $1$。

**(c) 为什么这个上界写法非用不可。** 我原来想的是"取一族方向使增量恰好等于目标值"。论文的写法是"取一条方向族 $y_\varepsilon$，令 $\varepsilon\to0$ 取极限，把内层 $\inf$ 压到极限以下"。机制区别：$\inf_{y\in S_F}$ 只需一个测试方向就给上界，所以对任意给定的 $F$，只要 $F$ 里有**一个**方向族的增量趋于目标即可。这就是"one family of directions gives both curves"（`moduli:232` 标题）的含义：同一条 $y_\varepsilon$，配合 $\lambda$ 凸分解与反向三角这两条不同的加量方式，同时钉住 $H$ 与 $D$ 两条曲线。$\lambda=\min\{t/L_\varepsilon,1\}$ 的作用是把"半径 $L_\varepsilon\approx2$"的对径信息转换成"任意半径 $t$"：$t\le L_\varepsilon$ 时纯凸组合（不用 $(t-L)_+$），$t>L_\varepsilon$ 时额外加一段长度 $t-L_\varepsilon$，加段带来的增量正好 $(t-L_\varepsilon)_+$，这就是 $t-2$ 的线性尾巴的来源。$t\le2$ 那段 $t/2$ 则是 $1+t$（反向三角给的下线方向 $\|x-ty\|\le1+t$）与 $1$（上线方向的极限）平均的结果：$(1+t+1)/2-1=t/2$。我特意核对了 $t\le2$ 时上界其实是"$-y_\varepsilon$ 方向被反向三角钉在 $1+t$、$+y_\varepsilon$ 方向被对径几何钉在 $\approx1$"，两条不对称，平均后剩 $t/2$。所以 $H$ 的 $t/2$ 分支在上界一侧来自"对径几何 + 反向三角"的混合，在下界一侧来自"clip 质量二分"，两个来源给出同一个数，这就是精确性等式的实质内容。

`moduli:286-289` 收尾：每固定 $F$ 的两个内层下确界都 $\le$ 对应极限；对 $F$ 取上确界得两条上界；公式对每个单位球心成立，所以对中心取下确界不变。这最后一句是我核对 $\widehat\delta_E$、$\overline\delta_E$ 公式的直接依据。

## 12 换范数排除 AUC：一个 $R$ 在分母上的原因

`moduli:292-299` 先把适用范围划出来，这一段对我最初的理解方式有直接纠正作用：

```tex
The one-sided modulus vanishes for $0<t\le2$, so the inherited norm is not AUC.
Ruling out all equivalent norms requires the weak-neighborhood
property itself. The following argument applies to any infinite-dimensional
real Banach space in which every relatively weakly open neighborhood of a unit
vector contains points of the unit ball arbitrarily close to distance
two from that vector, as in Lemma~\ref{lem:diametral}.
```

我一开始以为 $\overline\delta_E(t)=0$（$t\le2$）加上"模数在等价范数下有某种单调性"可以推出结论。不存在这种单调性：换等价范数后 $D_N$ 完全不受 $D_{\|\cdot\|}$ 控制，因为 $N(x+ty)-1$ 里的 $-1$ 是 $N(x)=1$ 归一化，与 $\|\cdot\|$ 无关。所以必须直接引用引理 2.5 的几何陈述，而它只依赖弱拓扑（等价范数弱拓扑相同）与单位球的相对弱开子集。

**(a) 原文（`moduli:301-316`）。**

```tex
\begin{proof}[Proof of the renorming assertion in Theorem~\ref{thm:exact}]
Suppose $N$ is an equivalent AUC norm.  Choose $a>0$ with
$N(u)\ge a\|u\|$ for all $u$, and put
$R=\sup_{u\in B_E}N(u)<\infty$.  Fix, in this order,
\[
 t_0=\frac{a}{4R},\qquad
 0<\gamma<\overline\delta_N(t_0),\qquad
 x_0\in S_E\ \text{with}\ (1+\gamma)N(x_0)>R.
\]
The last choice is possible since $R=\sup_{u\in S_E}N(u)$.
The definition of $\overline\delta_N(t_0)$ at $x_0/N(x_0)$ supplies
$F\in\operatorname{cof}(E)$ such that
\begin{equation}\label{eq:auc-outside}
 N(x_0+z)\ge(1+\gamma)N(x_0)
 \quad\text{if }z\in F,\quad N(z)\ge t_0N(x_0).
\end{equation}
```

**(b) 推导。** $N$ 与 $\|\cdot\|$ 等价给 $a\|u\|\le N(u)\le b\|u\|$，论文只显式用下界 $a$，上界信息被打包进 $R=\sup_{B_E}N<\infty$。$\overline\delta_N(t_0)>0$（AUC 假设），取 $\gamma$ 在其下。$x_0\in S_E$ 使 $(1+\gamma)N(x_0)>R$：由 $R=\sup_{S_E}N$ 与 $\gamma>0$，存在 $x_0\in S_E$ 使 $N(x_0)>R/(1+\gamma)$。而 $R=\sup_{B_E}N=\sup_{S_E}N$ 的理由我在纸上补了一步：$N$ 正齐次，$u\in B_E\setminus\{0\}$ 时 $N(u)=\|u\|N(u/\|u\|)\le N(u/\|u\|)\le\sup_{S_E}N$，反向包含显然（$S_E\subseteq B_E$）。

把 AUC 定义作用在中心 $c=x_0/N(x_0)$（$N(c)=1$）与半径 $t_0$：$D_N(c,t_0)\ge\overline\delta_N(t_0)>\gamma$，故存在 $F\in\operatorname{cof}(E)$ 使 $\inf_{y\in S_F}\bigl(N(c+t_0y)-1\bigr)>\gamma$，即对 $y\in S_F$ 有 $N(c+t_0y)\ge1+\gamma$。乘 $N(x_0)$：$N(x_0+t_0N(x_0)y)\ge(1+\gamma)N(x_0)$。令 $z=t_0N(x_0)y$，则 $z\in F$ 且 $N(z)=t_0N(x_0)$，得 (eq:auc-outside) 在**边界** $N(z)=t_0N(x_0)$ 上成立。

论文 `moduli:317-322` 处理"整个半径范围"：

```tex
To justify the entire range of radii, convexity gives, for $N(w)=1$ and
$r\ge t_0$,
\[
 N(x_0/N(x_0)+rw)-1
 \ge\frac r{t_0}\bigl(N(x_0/N(x_0)+t_0w)-1\bigr).
\]
```

这是"增量的差商单调"：$\psi(r)=N(c+rw)-1$ 是凸函数（$r\mapsto N(c+rw)$ 凸），$\psi(0)=N(c)-1=0$，故 $r\mapsto\psi(r)/r$ 在 $r>0$ 不减（凸函数除以自变量、且过原点，单调是标准结论：$\psi(t_0)=\psi\bigl(\frac{t_0}{r}r+(1-\frac{t_0}{r})0\bigr)\le\frac{t_0}{r}\psi(r)$）。这就是全部理由。

`moduli:324-341` 是收尾：

```tex
Choose
$0<\eta<\min\{(1+\gamma)N(x_0)-R,a/4\}$.  The set
\[
 U=\{u\in B_E:\inf_{z\in F}N(u-x_0-z)<\eta\}
\]
is a relatively weakly open neighborhood of $x_0$: the infimum is the
norm in the finite-dimensional quotient $E/F$.  Equivalent norms have
the same continuous functionals, hence the same weak topology.
For $u\in U$, choose $z\in F$ with $N(u-x_0-z)<\eta$.
If $N(z)\ge t_0N(x_0)$, Equation~\eqref{eq:auc-outside} gives
\[
 N(u)>(1+\gamma)N(x_0)-\eta>R,
\]
contrary to $u\in B_E$.  Thus
\[
 N(u-x_0)<t_0N(x_0)+\eta\le t_0R+\eta<a/2,
 \qquad\|u-x_0\|<1/2.
\]
This contradicts Lemma~\ref{lem:diametral}.
```

我逐步核：$U$ 相对弱开 $\iff$ 商范函 $u\mapsto\inf_{z\in F}N(u-x_0-z)=\|Q(u-x_0)\|_{E/F}$（$Q$ 商映射，且因 $N$ 在 $E$ 上是范数、$F$ 闭，下确界就是商范数）。$Q$ 弱-弱连续，$E/F$ 有限维故商范数是弱连续，$\{<\eta\}$ 原像弱开。$x_0\in U$ 因为 $Q(x_0-x_0)=0$。$u\in U$ 取 $z$。若 $N(z)\ge t_0N(x_0)$，则 $N(u)\ge N(x_0+z)-N(u-x_0-z)>(1+\gamma)N(x_0)-\eta>R$，用了 $u-x_0=(u-x_0-z)-z$？我核对方向：$u=(u-x_0-z)+(x_0+z)$，所以 $N(u)\ge N(x_0+z)-N(u-x_0-z)>(1+\gamma)N(x_0)-\eta$。与 $u\in B_E$ 时 $N(u)\le R$ 矛盾。故 $N(z)<t_0N(x_0)$。于是 $N(u-x_0)\le N(z)+N(u-x_0-z)<t_0N(x_0)+\eta$。$N(x_0)\le R$（$x_0\in B_E$）给 $t_0N(x_0)\le t_0R$。$t_0R=\frac{a}{4R}R=a/4$，加 $\eta<a/4$ 得 $<a/2$。$\|u-x_0\|\le N(u-x_0)/a<1/2$。所以 $\operatorname{diam}(U)\le1$（任意两点距 $x_0$ 都 $<1/2$），与引理 2.5 在**原范数**弱拓扑下给的 $\sup_{v\in U}\|v-x_0\|=2$ 冲突（引理 2.5 要求 $U$ 相对弱开相对于原范数的弱拓扑，两者相同，且 $U\subseteq B_E$ 是原范数单位球的子集）。$U$ 作为 $B_E$ 的相对弱开子集确实符合引理 2.5 的形式。

**(c) $4$ 与 $R$ 在分母的机械理由。** $t_0=\frac{a}{4R}$ 里 $R$ 在分母，是为了让"用 $N$ 度量的扰动半径 $t_0N(x_0)$"换算回原范数时不超过 $a$ 的固定分数：$t_0N(x_0)\le t_0R=a/4$，$R$ 自动消掉。$4$ 是把 $a/2$ 的总预算分成"来自 $t_0N(x_0)$"与"来自 $\eta$"两份，各占 $1/4$，最终 $<a/2$ 使 $\|\cdot\|$ 意义下半径 $<1/2$。任何把 $4$ 换成足够大的数 $\kappa$ 都可以（要求 $\frac{a}{\kappa}+\eta<a/2$，即 $\kappa>2$ 并留余量给 $\eta$）；选 $4$ 让 $\eta$ 也受 $a/4$ 约束，两个约束同一形式，最省事。$1/2$ 与 $2$ 之间差得很远：只要 $\|u-x_0\|<2$ 就矛盾，所以 $4$ 没有任何优化意义，纯粹是给 $\eta$ 留位置。$x_0/N(x_0)$ 这个中心的出现是因为 $\overline\delta_N$ 是对 $N$-单位中心取 inf，我要用 AUC 就必须先把 $x_0$ 归一到 $N$-球面。$\eta$ 的第一项上界 $(1+\gamma)N(x_0)-R$ 保证严格 $>R$ 的结论（这是矛盾点），与 $a/4$ 取 min 把两个用途合并在同一个 $\eta$ 上。

**(d) 失败路线，三条，标 [推测]。** 其一：直接对 $N$ 用模数公式。停住点：公式 $D_N(x,t)=\max\{0,t-2\}$ 只在 $N=\|\cdot\|_1$ 时被证明，$t-2$ 里那两个 $1$ 都绑在原范数归一化上，换 $N$ 后归一化基准变了；这条路线在定义层面就没意义。其二：用"等价范数下 AUC 可互相控制"的粗估计。停住点：$N(x+ty)-1$ 与 $\|x+ty\|-1$ 之间除线性比较外没有可用关系，而 AUC 要求的是"$>0$"这种非线性小量，线性比较给不出正下界。其三：我想把 $F$ 固定后再选 $x_0$。停住点：(eq:auc-outside) 里的 $F$ 由 $x_0/N(x_0)$ 与 $\gamma$ 决定，而 $x_0$ 又要由 $R$ 与 $\gamma$ 决定，顺序必须如论文 "Fix, in this order"（`moduli:304`）；反过来的话 $\gamma$ 与 $F$ 循环依赖。这个顺序声明我读作作者有意留下的提醒。[推测]

## 13 存在性一侧：$\operatorname{Ef}=1$ 与"几乎对径"是互相冲突的需求

第 4 节 `construction.tex:1-22` 把任务重述得很直白：

```tex
The idea is to multiply an old unit vector by a positive random variable
which has mean one but is small with high probability.  Each product has
small $L^1$ overlap with every old unit vector, so the norm of their sum is
almost two.  Averaging sufficiently many products recovers the old vector
in norm.  The main additional task is to control every vector in the
new unit ball, which permits the iteration to preserve precompactness
in measure.
```

我读第一遍时觉得这句话自相矛盾，后来才明白矛盾正是构造的内容。要 $\|u_k f\|=1$（新向量单位），需要 $\operatorname{E}f=1$（配合独立性：$\operatorname{E}|u_k|f=\|u_k\|_1\operatorname{E}f$）。要"几乎对径"，即 $\|w+u_kf\|_1\approx2$，由第 5 节的 max 恒等式，重叠 $\operatorname{E}\min(|w|,|u_k|f)$ 要小，也就是 $f$ 要在大部分概率上**很小**。可 $\operatorname{E}f=1$ 又要求 $f$ 偶尔极大。所以 $f$ 必须是重尾的：以高概率接近 $0$、以极低概率巨大来补回均值。这正是 `construction.tex:94` 的 $f=sV^{-1/p}$（$V$ 均匀在 $(0,1)$）：它是 Pareto 型，$\operatorname{P}(f>u)=(s/u)^p$，尾指数 $p\downarrow1$ 时均值仍为 $1$ 但质量全部推向 $0$（`construction.tex:89-91`："The following variable has mean one for every $p>1$, although it converges to zero in probability as $p\downarrow1$"）。

**(a) 原文（`construction.tex:93-104`）。**

```tex
\begin{lemma}\label{kw:heavy-tail}
Let $1<p\le3/2$, $s=(p-1)/p$, and $f=sV^{-1/p}$, where $V$ is uniform
on $(0,1)$.  Let $Y_1,\dots,Y_n$ be independent variables, each distributed
as the difference of two independent copies of $f$.  For real scalars
$a_1,\dots,a_n$, put
$A=(\sum_{j=1}^n\abs{a_j}^{p})^{1/p}$ and $Z=\sum_{j=1}^n a_jY_j$.
Then $\E f=1$ and
\begin{equation}\label{kw:heavy-bounds}
 \PP(\abs Z>u)\le10(sA/u)^p\quad(u>0),
 \qquad \E\abs Z\ge A/54.
\end{equation}
\end{lemma}
```

**(b) 推导。** 均值：$\operatorname{E}f=s\operatorname{E}V^{-1/p}=s\int_0^1v^{-1/p}dv=s\cdot\frac{1}{1-1/p}=s\cdot\frac{p}{p-1}=1$，因为 $s=\frac{p-1}{p}$。尾分布：$\{\omega:f(\omega)>u\}=\{V<(s/u)^p\}$，故 $\operatorname{P}(f>u)=(s/u)^p$ 当 $u\ge s$（此时 $(s/u)^p\le1$）；$u<s$ 时右端 $>1$ 故仍为上界，这就是 `construction.tex:111` 的 "for all $u>0$ the same expression is an upper bound"。

差 $Y=f-f'$：对称（两 copies 同分布独立，$f-f'$ 与 $f'-f$ 同律）。$\{|Y|>u\}=\{f-f'>u\}\cup\{f'-f>u\}$，而 $f-f'>u\Rightarrow f>u+f'\ge u$（$f'\ge0$），故 $\operatorname{P}(f-f'>u)\le\operatorname{P}(f>u)\le(s/u)^p$；对称给 $\operatorname{P}(|Y|>u)\le2(s/u)^p$（`construction.tex:112-113`）。注意阈值是 $u$ ，并非 $u/2$，全靠"$f'$ 非负"；这个细节决定了后面的截断也用 $u$。

上界（截断 + Chebyshev）：$X_j=a_jY_j\mathbf 1_{|a_jY_j|\le u}$ 独立、中心化（对称截断仍对称，故 $\operatorname{E}X_j=0$；需 $\operatorname{E}|X_j|<\infty$，成立因有界）。$X_j$ 与 $a_jY_j$ 只在 $\{|a_jY_j|>u\}$ 上不同，所以 $Z=\sum X_j$ 除非某个 $|a_jY_j|>u$。二阶矩：$\operatorname{E}X_j^2=\int_0^u2v\operatorname{P}(|X_j|>v)dv\le\int_0^u2v\cdot2(s|a_j|/v)^pdv=4(s|a_j|)^p\int_0^uv^{1-p}dv=\frac{4(s|a_j|^pu^{2-p})}{2-p}$，用了 $1<p<2$ 使 $v^{1-p}$ 在 $0$ 可积（积分 $=u^{2-p}/(2-p)$）。求和：$\operatorname{Var}(\sum X_j)=\sum_j\operatorname{E}X_j^2\le\frac{4s^pu^{2-p}}{2-p}\sum_j|a_j|^p=\frac{4(sA)^pu^{2-p}}{2-p}$。Chebyshev：$\operatorname{P}(|\sum X_j|>u)\le\frac{4(sA)^pu^{-p}}{2-p}$。union bound：$\operatorname{P}(\exists j:|a_jY_j|>u)\le\sum_j2(s|a_j|/u)^p=2(sA/u)^p$。合起来

$$\operatorname{P}(|Z|>u)\le\Bigl(2+\frac{4}{2-p}\Bigr)(sA/u)^p\le10(sA/u)^p,$$

最后一步用 $p\le3/2\Rightarrow2-p\ge1/2\Rightarrow\frac{4}{2-p}\le8$，$2+8=10$。

下界：先给单个 $Y$ 的尾部下界。对 $u\ge s$，事件 $\{f>u+2s,\ f'\le2s\}$ 蕴含 $Y>u$（$f-f'>u+2s-2s=u$）。其概率 $=\operatorname{P}(f>u+2s)\operatorname{P}(f'\le2s)=\bigl(\frac{s}{u+2s}\bigr)^p(1-2^{-p})$，其中 $\operatorname{P}(f'>2s)= (s/2s)^p=2^{-p}$。三项放缩（`construction.tex:138` 明写）：$u\ge s\Rightarrow u+2s\le3u$；$p\ge1\Rightarrow2^{-p}\le1/2\Rightarrow1-2^{-p}\ge1/2$；$p\le3/2<2\Rightarrow3^p<9$（论文写 $3^p\le9$，即 $p\le2$）。乘积 $\ge\frac{1}{2\cdot9}(s/u)^p=\frac1{18}(s/u)^p$。

再给最大值：设 $A>0$ 并丢掉零系数。$|a_j|\le A$ 且 $u\ge sA\Rightarrow u\ge s|a_j|$，故上面单项下界可用（阈值换成 $u/|a_j|\ge s$，得 $\operatorname{P}(|a_jY_j|>u)\ge\frac1{18}(s|a_j|/u)^p$）。独立：$\operatorname{P}(\max_j|a_jY_j|\le u)=\prod_j(1-p_j)\le\exp(-\sum_jp_j)\le\exp\bigl(-\frac1{18}(sA/u)^p\bigr)$，用了 $\sum_j(s|a_j|/u)^p=(sA/u)^p$。$u\ge sA\Rightarrow(sA/u)^p\le1\Rightarrow v=\frac1{18}(sA/u)^p\le\frac1{18}\le1$，用 $1-e^{-v}\ge v/2$ 得 $\operatorname{P}(\max_j|a_jY_j|>u)\ge\frac1{36}(sA/u)^p$。

符号平均：附独立等概率符号 $\varepsilon_j$。固定 $|a_jY_j|$ 的实现，取绝对值最大的指标 $i$，令 $b=\sum_{j\ne i}\varepsilon_ia_jY_j$、$c=\varepsilon_ia_iY_i$：对 $\varepsilon_i=\pm1$ 平均得 $\frac{|b+c|+|b-c|}2\ge|c|$（逐点恒等式 $\max$ 或反向三角），故 $\operatorname{E}_\varepsilon|\sum_j\varepsilon_ja_jY_j|\ge\max_j|a_jY_j|$。由 $Y_j$ 对称独立，$\sum\varepsilon_ja_jY_j$ 与 $Z$ 同律，所以 $\operatorname{E}|Z|\ge\operatorname{E}\max_j|a_jY_j|\ge\int_0^\infty\operatorname{P}(\max>u)du\ge\int_{sA}^\infty\frac1{36}(sA/u)^pdu=\frac1{36}(sA)^p\cdot\frac{(sA)^{1-p}}{p-1}=\frac{sA}{36(p-1)}=\frac{A}{36p}\ge\frac A{54}$。最后 $36p\le36\cdot\frac32=54$。$A=0$ 时两条都显然。

**(c) 常数 $10$、$54$、$p\le3/2$ 的机械理由。** `construction.tex:12-14` 特意登记："The explicit multipliers below and the constants $10$, $54$, and $108$ belong to the quantitative realization given here; the enlargement and iteration scheme is the credited construction." 我把这三个数各自钉到一个约束上：

$10=2+\frac{4}{2-p}\big|_{p=3/2}=2+8$。它的唯一用途是吸收 Chebyshev 分母里的 $2-p$。若把 $p$ 的上限从 $3/2$ 抬到 $2-\theta$，$10$ 变成 $2+4/\theta$。所以 $10$ 与 $3/2$ 是同一决定的两面，$p\le3/2$ 存在的唯一理由是让 $2-p$ 有下界 $1/2$，从而上界常数有限；同时下界那条 $\frac1{18}$ 里的 $3^p\le9$ 也需要 $p\le2$。$p>1$ 则是 $\operatorname{E}V^{-1/p}<\infty$ 与 $u^{2-p}$ 可积的必需。

$54=36\cdot\frac32=2\cdot18\cdot\frac32$：$18$（单项尾下界）$\to36$（union 到 max 时 $1-e^{-v}\ge v/2$ 折一半）$\to36p\le54$（最后用 $p\le3/2$）。所以 $54$ 是"两次折半加一次上界"的累积，不含任何优化。

$108=54\cdot2$：`construction.tex:229-232` 的 $A_k\le108$ 是把下界反向用：$\operatorname{E}|z_k-z_k'|\ge A_k/54$ 与 $\operatorname{E}|z_k-z_k'|\le2$（两个单位球元素差的 $L^1$ 范数 $\le1+1=2$）联立，$A_k\le54\cdot2=108$。所以 $108$ 里的 $2$ 是"球内两点距离上限"，与 $54$ 是一对：论文 `construction.tex:106-107` 那句 "The lower estimate bounds $A$ from an $L^1$ bound on $Z$; the upper estimate then gives concentration in probability uniformly in $n$" 就是在说这个双向用法。整个引理的形状是必然的：下界把 $L^1$ 控制翻成系数范数控制，上界再把系数范数控制翻回概率集中。$n$ 完全不进这两个常数，这是"uniformly in $n$"的全部含义，也是第 14 节能把 $n$ 留到最后再选的原因。

**(d) 失败路线，三条，标 [推测]。** 其一：用有界重尾变量（例如 $f$ 取 Rademacher 型缩放）。停住点：$\operatorname{P}(f>c)$ 不能任意小同时保持 $\operatorname{E}f=1$ 与 $f\ge0$；有界非负变量 $\operatorname{E}f=1$ 时 $\operatorname{P}(f>c)\ge(1-c)/\|f\|_\infty$ 有下界，而第 14 节需要 $\operatorname{P}(f>c)$ 随 $p\downarrow1$ 趋于 $0$。其二：用 Kolmogorov 不等式替代 Chebyshev 来做 $\max$ 的上界。停住点：$X_j$ 只中心化、其部分和没有可控的独立增量结构（截断破坏独立性带来的矩条件？），而论文的 union bound 只要 $2(sA/u)^p$，用 Kolmogorov 反而引入 $\log n$，破坏"uniformly in $n$"。[推测] 其三：用 Rosenthal 或 $p$-稳定律直接算 $\operatorname{E}|\sum a_jY_j|$ 的双边界。停住点：这样得到的是同阶常数，并非显式 $54$，且需要引用深定理；论文要的是"$\operatorname{E}|Z|$ 与 $A$ 成正比、比例常数与 $n$ 无关"这一弱得多的信息，所以 $\max$ + 符号平均的初等路线更省。这个"为什么故意不用现成不等式"我只有间接证据（`construction.tex:84-85` "this is what the whole-ball conclusion requires beyond control of the selected vectors themselves"），标 [推测]。

## 14 有限维扩张（引理 4.2）：三个结论与四种参数的选取顺序

**(a) 原文（`construction.tex:66-80`）。**

```tex
\begin{lemma}\label{kw:enlargement}
Suppose $G\ne\{0\}$ is a finite-dimensional subspace of $L^1$ depending
on finitely many coordinates, $m\ge1$, $u_1,\dots,u_m\in S(G)$, and $0<h<1$.
There are a finite-dimensional $G'\supseteq G$ depending on finitely
many coordinates, an integer $n\ge1$, and vectors
$v_{kj}\in S(G')$ $(1\le k\le m,\ 1\le j\le n)$ such that
\begin{align}
 \norm{w+v_{kj}}&\ge2-h
 &&(w\in S(G),\ k\le m,\ j\le n),\label{kw:enlarge-a}\\
 \norm{u_k-\frac1n\sum_{j=1}^n v_{kj}}&\le h
 &&(k\le m),\label{kw:enlarge-b}\\
 \text{for every }g\in B(G')\text{ there is }\psi_0\in B(G)
 &\text{ with }d(g,\psi_0)\le h.\label{kw:enlarge-c}
\end{align}
\end{lemma}
```

`construction.tex:61-64` 交代第三条的动机："We need the new unit vectors to be almost additive in norm with every old unit vector, and their averages to approximate selected old vectors. The third conclusion below keeps the entire new unit ball close, in measure, to the old unit ball." 这第三条就是 Kadets-Werner 原文里被"refined"的部分（`intro:91-93`："Kadets and Werner refined its finite-dimensional enlargement to obtain the Daugavet property"），也是本篇声明为"quantitative realization"的核心：`construction.tex:12-14` 明写显式乘子与 $10,54,108$ 属于本文。

我先在纸上确认这三条为什么必须同一条引理。迭代时我需要：(a) 给 Daugavet 的 slice 条件提供"新单位向量与所有旧单位向量几乎对径"；(b) 给 slice 的最终命中提供"平均值回到旧向量"，也就是旧向量是新向量的极限点，从而任何非空 slice 迟早包含某个新向量；(c) 给测度预紧性提供"新球整体贴旧球"。若只有 (a)(b) 而无 (c)，$B_E$ 在测度意义下可以跑到无穷远，预紧性丢；若只有 (a)(c) 而无 (b)，Daugavet 性只能对特定新向量成立而 slice 里未必有它们。

**(b) 推导与参数顺序。** `construction.tex:171-189` 的顺序声明我全部照抄，因为这就是本篇最容易读错的地方：

```tex
\emph{Parameter choices.}
Choose $c\in(0,h/4)$, and then $r,q>0$ sufficiently small that
\begin{equation}\label{kw:rq-choice}
 mq<1,\qquad
 mq+h^{-1}\bigl(2mr+(1-mq)^{-1}-1\bigr)<h.
\end{equation}
With $s=(p-1)/p$, choose $1<p\le3/2$ close enough to $1$ that
\begin{equation}\label{kw:p-choice}
 s<c,\qquad 2\bigl((s/c)^p+c\bigr)<h,
 \qquad 10(108s/r)^p<q.
\end{equation}
These choices are possible because $s\to0$ as $p\downarrow1$.
We fix $p$ now; the integer $n$ will be chosen last.
```

顺序是 $c\Rightarrow(r,q)\Rightarrow p\Rightarrow n$，而 $m$ 是给定的（网的大小）。$n$ 必须最后，因为 (a)(c) 的证明要对**每个** $n$ 成立（`construction.tex:207` "Thus \eqref{kw:enlarge-a} holds for every $n$"，`construction.tex:270` "This proves \eqref{kw:enlarge-c} for every $n$"，`construction.tex:272-273` "We have now proved both near-additivity and whole-ball approximation without placing an upper bound on $n$"）；$p$ 必须先于 $n$，因为 $n$ 的选取要用到 (kw:lln) 里的 $f$，而 $f$ 由 $p$ 决定。

近加性（`construction.tex:190-207`）。取 $mn$ 个独立 copies $f_{kj}$（各占一个新坐标），$v_{kj}=u_kf_{kj}$，$G_n'=\operatorname{span}(G\cup\{v_{kj}\})$。$\|v_{kj}\|=E|u_k|f_{kj}=\|u_k\|_1\operatorname{E}f=1$（独立性）。对 $w\in S(G)$，用逐点 $|a+b|\ge|a|+|b|-2\min(|a|,|b|)$：

$$\|w+v_{kj}\|_1\ge\|w\|_1+\|u_kf_{kj}\|_1-2E\min(|w|,|u_k|f_{kj})=2-2E\min(|w|,|u_k|f_{kj}).$$

再看 min：在 $\{f_{kj}>c\}$ 上 $\min(|w|,|u_k|f_{kj})\le|w|$；在补集 $\{f_{kj}\le c\}$ 上 $\le|u_k|f_{kj}\le c|u_k|$。独立性让指标与旧坐标独立，于是

$$E\min(|w|,|u_k|f_{kj})\le E\bigl[|w|\mathbf 1_{\{f>c\}}\bigr]+c\,E\bigl[|u_k|\bigr]=\|w\|_1\operatorname{P}(f>c)+c\|u_k\|_1=(s/c)^p+c .$$

（我把 $\operatorname{P}(f_{kj}>c)$ 写成 $(s/c)^p$，用的是尾上界，$s<c$ 保证它是真概率。）合起来 $\|w+v_{kj}\|\ge2-2\bigl((s/c)^p+c\bigr)>2-h$，最后这个严格不等号就是 (kw:p-choice) 的中间那条。$c<h/4$ 的作用：$2c<h/2$，给 $2(s/c)^p$ 留 $h/2$ 的额度。$s<c$ 是 $p$ 充分接近 $1$ 的结果，用来保证 $\operatorname{P}(f>c)$ 可以任意小（$s\to0$ 时 $(s/c)^p\to0$，因为 $c$ 已经固定为正）。

整体球逼近（`construction.tex:209-270`），这是最长的一段，我按七步拆：

步一：取任意表示 $g=x+\sum_ku_kz_k$，$x\in G$，$z_k=\sum_ja_{kj}f_{kj}$。表示不唯一，但下面的界与表示无关（`construction.tex:234-235` 明写）。

步二：固定 $k$，在辅助乘积空间上重采该组全部变量得 $z_k'$、$g^{(k)}$。同律给 $\|g^{(k)}\|_1=\|g\|_1\le1$，所以 $E|g-g^{(k)}|\le2$。而 $g-g^{(k)}=u_k(z_k-z_k')$（其余项不变），旧坐标与新鲜坐标独立给 $E|u_k(z_k-z_k')|=E|u_k|\cdot E|z_k-z_k'|=\|u_k\|_1E|z_k-z_k'|=E|z_k-z_k'|$，其中 $\|u_k\|_1=1$。所以 $E|z_k-z_k'|\le2$。

步三：$Y_j=f_{kj}-f_{kj}'$ 满足引理 4.3 的条件，$Z=\sum_ja_{kj}Y_j=z_k-z_k'$，故 $A_k/54\le E|Z|\le2$，$A_k\le108$；再代上界：$\operatorname{P}(|z_k-z_k'|>r)\le10(108s/r)^p<q$（(kw:p-choice) 第三条）。这就是 (kw:coefficient-bound)。

步四：把 $z_k$ 集中到某个常数附近。对 $z_k'$ 取条件概率再平均，$\operatorname{P}(|z_k-z_k'|>r)=E_{z_k'}[\operatorname{P}(|z_k-z_k'|>r\mid z_k')]$，所以存在一个实现值 $c_k$ 使 $\operatorname{P}(|z_k-c_k|>r)<q$。论文 `construction.tex:241` 特意声明："These constants may depend on $g$; no simultaneous choice is needed." 这句是防我误读成"要一组对所有 $g$ 通用的 $c_k$"。

步五：$\psi=x+\sum_kc_ku_k\in G$，$D=\bigcap_k\{|z_k-c_k|\le r\}$。$D$ 只依赖新鲜坐标，$\operatorname{P}(D)\ge1-mq$（union bound，$m$ 组），$mq<1$ 保证它正。在 $D$ 上 $|g-\psi|\le\sum_k|u_k||z_k-c_k|\le r\sum_k|u_k|$。

步六：$E(|g|\mathbf 1_D)\ge E\bigl[(|\psi|-r\sum|u_k|)\mathbf 1_D\bigr]=(\|\psi\|-mr)\operatorname{P}(D)$，最后一步用 $\psi$（旧坐标可测）与 $D$（新鲜坐标可测）独立，以及 $E\sum_k|u_k|=m$。$1\ge E(|g|\mathbf 1_D)\ge\operatorname{P}(D)(\|\psi\|-mr)\ge(1-mq)(\|\psi\|-mr)$，注意若 $\|\psi\|-mr<0$ 不等式自动成立，所以直接得 $\|\psi\|\le mr+(1-mq)^{-1}$。

步七：$\psi_0=\psi/\max(1,\|\psi\|)\in B(G)$。$\|\psi-\psi_0\|=\max(0,\|\psi\|-1)\le mr+(1-mq)^{-1}-1$。最后 Markov 限制在 $D$ 上：

$$\operatorname{P}(|g-\psi_0|>h)\le\operatorname{P}(D^c)+h^{-1}E(|g-\psi_0|\mathbf 1_D)\le mq+h^{-1}\bigl(mr+\|\psi-\psi_0\|\igr)\le mq+h^{-1}\bigl(2mr+(1-mq)^{-1}-1\bigr)<h,$$

即 (kw:rq-choice) 第二条。由 (eq:measure-metric)/(kw:metric) 的定义，$\operatorname{P}(|g-\psi_0|>h)<h$ 正是 $d(g,\psi_0)\le h$。

平均恢复（`construction.tex:275-294`）。(kw:lln) 是截断中心化的独立和：

$$E\Bigl|\frac1n\sum_{j=1}^nf_j-1\Bigr|\le2E(f-f^M)+\sqrt{\operatorname{Var}(f^M)/n},\qquad f^M=\min(f,M).$$

我自己验了三项拆分：$E|\bar f-1|\le E|\bar f-\bar{f^M}|+E|\bar{f^M}-Ef^M|+|Ef^M-1|$；首项 $\le\frac1n\sum_jE|f_j-f_j^M|=E(f-f^M)$；末项 $\le E(f-f^M)$（因 $Ef=1$、$Ef^M\le Ef$）；中项 $\le\sqrt{\operatorname{Var}(\bar{f^M})}=\sqrt{\operatorname{Var}(f^M)/n}$（独立、$L^2$ 均值 $\le$ 标准差）。合计 $2E(f-f^M)+\sqrt{\operatorname{Var}(f^M)/n}$。$f$ 可积（$Ef=1$）给 $E(f-f^M)\to0$（控制收敛，被 $f$ 控制）；$f^M$ 有界故方差有限，$n\to\infty$ 使第二项 $\to0$。先 $M$ 后 $n$ 的顺序是硬的：$M$ 必须先固定，第二项的常数才有限。取 $n$ 使左端 $\le h$。全部 $k$ 组同律，独立性给

$$\Bigl\|u_k-\frac1n\sum_jv_{kj}\Bigr\|=E|u_k|\cdot E\Bigl|1-\frac1n\sum_jf_{kj}\Bigr|\le h,$$

即 (kw:enlarge-b)。$G'=G_n'$ 只用有限多个新坐标，前两个结论对每个有限 $n$ 都成立所以保留。

**(c) 每个参数为什么是这个位置。** $h<1$ 出现在两处：(a) 的结论 $\|w+v\|\ge2-h>1$ 要有意义；迭代里 $h_b=2^{-b}\le1/2$。$c\in(0,h/4)$：$4$ 是 $h/2$ 的分摊选择（另一半给尾部），$c>0$ 才使 $\operatorname{P}(f>c)$ 有非平凡上界。(kw:rq-choice) 里 $mq<1$ 单独列出，是因为 $(1-mq)^{-1}$ 要有限；$mq$ 的系数 $m$ 是网的基数，它只能出现在 union bound 的位置。(kw:p-choice) 的三条分别喂给：$s<c$（尾上界可用，$c\ge s$）、$2((s/c)^p+c)<h$（喂 (a)）、$10(108s/r)^p<q$（喂 (c)）。$r,q$ 只需要"充分小"，具体条件全部打包在 (kw:rq-choice) 与第三条里；$r$ 同时是 $d$ 层面的偏差量级和 Markov 的分母的一部分，$q$ 是每组失败概率的上界。$n$ 只出现在 (b)，而 (b) 的右边 $h$ 是最终给迭代用的同一个 $h$，所以 $n$ 的选取是三个结论里唯一"事后"的。$108$ 在 (kw:p-choice) 中出现于 $A_k\le108$ 被证明之前，我核对过这不是循环：$108=54\cdot2$ 的两个因子都先验已知（$54$ 来自引理 4.3 的下界、$2$ 来自 $B(G_n')$ 内两点差 $\le2$），所以 (kw:p-choice) 里可以直接把 $108$ 当作常数使用。

**(d) 失败路线，三条，标 [推测]。** 其一：用一组通用的乘子 $\{f_j\}_{j\le n}$ ，并非 $\{f_{kj}\}_{k,j}$（即 $v_{kj}=u_kf_j$ 共用 $n$ 个变量）。停住点：$z_k=\sum_ja_{kj}f_j$ 之间不再独立，(c) 的 union bound $\operatorname{P}(D)\ge1-mq$ 崩塌，$D$ 的定义要改成 $m$ 个相关事件的交，独立性 $\psi$ 与 $D$ 的因子化（步六）也失效。其二：把 $f$ 换成 $p$-稳定或指数尾变量。停住点：需要 $\operatorname{E}f=1$、$\operatorname{P}(f>c)$ 任意小、以及 $\sum a_jY_j$ 的 $\operatorname{E}|Z|\ge c(p)A$ 三者同时成立；指数尾时 $A$ 只能是 $\ell^2$ 型而重尾需要 $p$ 与尾指数一致。这个"用同一个 $p$ 同时控制上下界"是 $f=sV^{-1/p}$ 的独有优点：尾指数与系数空间的 $\ell^p$ 范数完全对齐。[推测] 其三：跳过 $G_n'$ 而直接令 $G'=G\oplus\operatorname{span}\{v_{kj}\}$ 的 $\ell^1$-和。停住点：那样 $\|w+v\|=\|w\|+\|v\|=2$ 精确成立，Daugavet 性质倒是满足了，但 (kw:enlarge-c) 失效，$B(G')$ 里的 $x+\sum_ku_kz_k$ 的球范数会强迫系数很小、而 $d$ 距离不再贴旧球，预紧性断掉；更硬的是 (b) 要求 $\|u_k-\frac1n\sum v_{kj}\|\le h$，在直和中 $v_{kj}$ 与 $u_k$ 属于不同分量、距离恒为 $1+\|\cdot\|$ 型，不可能小于 $h<1$。这就是本篇必须用"乘子耦合"而不能只用"直和"的根本原因，我在第 19 节还会回到它。[推测]

## 15 迭代与取闭包：$h_b=2^{-b}$ 为什么可和就够

**(a) 原文（`construction.tex:48-57` 与 `304-365` 的首段）。**

```tex
\begin{theorem}[Kadets--Werner construction]\label{kw:existence}
There is an infinite-dimensional closed real subspace $E\subseteq L^1$
such that $B(E)$ is totally bounded for $d$ and has the following slice
property: for every $w\in S(E)$, every nonempty slice
\[
 H=\{y\in B(E):\ell(y)>\alpha\},\qquad \ell\in E^*,\quad\alpha\in\R,
\]
and every $\rho>0$, there is $y\in H\cap S(E)$ such that
$\norm{w+y}\ge2-\rho$.  In particular, $E$ has the Daugavet property.
\end{theorem}
```

```tex
Start with $G_1=\operatorname{span}\{1\}$ and put $h_b=2^{-b}$.
Given $G_b$, choose a finite $h_b$-net
$\{u_{b,k}:1\le k\le m_b\}$ of $S(G_b)$ in norm and apply
Lemma~\ref{kw:enlargement} with $h=h_b$.  Denote the resulting space by
$G_{b+1}$ and its new unit vectors by $v_{b,kj}$, $1\le j\le n_b$.
All stages depend on finitely many coordinates, so the construction
continues on $\Omega$.  Set
\[
 E=\overline{\bigcup_{b\ge1}G_b}^{\,\norm{\cdot}}\subseteq L^1.
\]
Each inclusion $G_b\subseteq G_{b+1}$ is strict: if any $v_{b,kj}$
belonged to $G_b$, substituting $w=-v_{b,kj}$ in
\eqref{kw:enlarge-a} would give $0\ge2-h_b$.
Thus $E$ is infinite-dimensional.
```

**(b) 推导。** 严格性论证我核对了 $\|-v+v\|=0$，而 $v_{b,kj}\in S(G_{b+1})$；若 $v\in G_b$ 则它自己就是 $S(G_b)$ 里的 $w=-v$ 合法对象（$w\in S(G_b)$ 条件满足），(a) 给 $\|w+v\|=\|-v+v\|=0\ge2-h_b$，而 $h_b=2^{-b}\le1/2<1\Rightarrow2-h_b\ge3/2>0$，矛盾。所以每步维数严格增，$E$ 无穷维。这个"用 $w=-v$ 自反"的论证与我第 14 节里 (a) 的强度有关：$2-h$ 必须 $>0$ 才有矛盾，所以 $h<1$ 又一次被消费。

预紧性。稠密性：$\bigcup_bB(G_b)$ 在 $B_E$ 中范数稠。论文 `construction.tex:322-324` 的论证是"$x_j$ 在代数并不中趋于 $x\in B_E$，则 $x_j/\max(1,\|x_j\|)$ 也趋于 $x$"。我核对了这步：$\|x_j-x\|\to0$ 且 $\|x\|\le1$；若 $\|x\|<1$，则 eventually $\|x_j\|<1$，归一化不动，收敛显然；若 $\|x\|=1$，则 $\max(1,\|x_j\|)\to1$，$|x_j/\alpha_j-x|\le|x_j-x|+|x_j||1/\alpha_j-1|\to0$。归一化后的元素仍在某个 $B(G_b)$ 里（$\alpha_j\ge1$ 使 $\|x_j/\alpha_j\|\le1$，且 $x_j/\alpha_j\in G_b$）。

望远镜：$a>b$、$g\in B(G_a)$ 时，反复用 (kw:enlarge-c) 逐级往下投影 $\psi_l\in B(G_l)$，每级 $d\le h_l$，由 $d$ 的三角不等式（`construction.tex:39-41` 用 union bound 验过：$\operatorname{P}(|f-h|>a+b)\le a+b$）得

$$\inf_{\psi\in B(G_b)}d(g,\psi)\le\sum_{l=b}^{a-1}h_l=\sum_{l=b}^{a-1}2^{-l}=2^{-b}(2-2^{1-a})\le\sum_{l=b}^\infty2^{-l}=2^{1-b}.$$

我核了几何级数：$\sum_{l=b}^\infty2^{-l}=2^{-b}\cdot\frac{1}{1-1/2}=2^{1-b}$。$a\le b$ 时自动（距离 $0$）。然后：到固定非空集的距高函数对 $d$ 是 $1$-Lipschitz（$|d(g,S)-d(g',S)|\le d(g,g')$），而 $\bigcup_bB(G_b)$ 范数稠于 $B_E$，范数收敛蕴含 $d$-收敛（Markov：$d(f,g)\le\|f-g\|_1^{1/2}$，`construction.tex:44-46`），所以距离估计从 $B(G_a)$ 的元素扩到 $B_E$ 的极限元素。最后：$B(G_b)$ 有限维闭球故范数紧故 $d$-紧，给 $\eps>0$ 取 $b$ 使 $2^{1-b}<\eps/2$，再取 $B(G_b)$ 的有限 $\eps/2$-网，合起来是 $B_E$ 的 $\eps$-网。这正是 `construction.tex:335-337`。

slice 条件的极限化。给定 $w,H,\ell,\alpha,\rho$。先要 $u\in S(E)$ 使 $\ell(u)>\alpha$：论文 `construction.tex:341-343` 写"the supremum of a linear functional over the ball equals its supremum over the sphere, including when the functional is zero"。我把这句拆成两种情形核：$\ell\ne0$ 时 sup over $B_E$ 在 $S_E$ 上逼近（正齐次），slice 非空给 sup $>\alpha$，故存在单位 $u$ 与 $\ell(u)>\alpha$（可能要把 $\|\cdot\|\le1$ 的元素放大到球面，放大后 $\ell$ 值不减）。$\ell=0$ 时 slice 非空要求 $0>\alpha$，任取 $u\in S(E)$（需要 $E\ne\{0\}$，已知无穷维）即 $\ell(u)=0>\alpha$。这个"包括泛函为零"的处理与引理 2.3 正向开头那句"$\ell=0$ 时 $H=B_X$"是同一件事的两个方向，我特意对齐了一遍。

再由"从递增并不归一化逼近"得 $u^{(b)},w^{(b)}\in S(G_b)$，$u^{(b)}\to u$、$w^{(b)}\to w$。取网点 $u_{b,k_b}$ 使 $\|u_{b,k_b}-u^{(b)}\|\le h_b$，令 $a_b=\frac{1}{n_b}\sum_jv_{b,k_bj}$。(b) 给 $\|a_b-u_{b,k_b}\|\le h_b$，于是 $\|a_b-u\le\|a_b-u_{b,k_b}\|+\|u_{b,k_b}-u^{(b)}\|+\|u^{(b)}-u\|\le2h_b+\|u^{(b)}-u\|\to0$。这正对应 `construction.tex:351-352`。$\ell$ 连续故 $\ell(a_b)>\alpha$ 对大 $b$ 成立；$\ell(a_b)=\frac1{n_b}\sum_j\ell(v_{b,k_bj})$ 大于 $\alpha$ 意味着**至少一个** summand 满足 $\ell(v)>\alpha$，那个 $v\in H$（且 $v\in S(G_{b+1})\subseteq S(E)$，$\|v\|=1$ 故在 $B_E$ 里）。同时每个 summand 由 (a) 有 $\|w^{(b)}+v\|\ge2-h_b$，故 $\|w+v\|\ge2-h_b-\|w-w^{(b)}\|$。取 $b$ 使 $h_b+\|w-w^{(b)}\|<\rho$，命中的那个 summand 就是所需的 $y\in H\cap S(E)$。

`construction.tex:363-364` 收尾一句 "Finally, Lemma~\ref{lem:daugavet-slices} turns this slice property into $\norm{I+T}=1+\norm T$"，用的是引理 2.3 的反向。

**(c) $2^{-b}$ 与 $2^{1-b}$ 的理由。** $h_b=2^{-b}$ 唯一被使用的性质是"可和且尾 $\to0$"，$b$ 起点 $1$ 使尾和恰为 $2^{1-b}$、在 $b=1$ 处 $=1$（不超过 $d$ 的平凡界 $2$ 之外，$d$ 本身可以任意大吗？$d(f,g)$ 在 $L^1$ 单位球里可以很大，所以尾和 $<\eps$ 的条件就是 $2^{1-b}<\eps$）。$2^{-b}$ 的具体底数不是本质，$\sum_bh_b<\infty$ 才是；我核对过若取 $h_b=b^{-2}$ 则尾和 $\sim1/b$ 仍 $\to0$，整套论证照跑，只是"给定 $\eps$ 取 $b$"的速率变慢。选 $2^{-b}$ 是为了 (a) 里的 $h_b<1$（$b\ge1$ 时 $2^{-b}\le1/2$）与严格性论证 $2-h_b>0$ 同时成立；$b^{-2}$ 在 $b=1$ 时 $=1$ 会破坏 $h<1$。这大概是最省事的解释，论文没有说，标 [推测]。$u^{(b)}$、$w^{(b)}$ 的逼近与 $h_b$ 是同阶小量，所以 $2h_b+\|u^{(b)}-u\|$ 里两项都能压到 $\rho$ 以下，没有速率匹配问题。$n_b$ 由 $m_b$（$S(G_b)$ 的 $h_b$-网基数）决定，指数式增长，论文没有追踪，我在常数表里标 [推测] 并说明论文未追踪。

**(d) 失败路线，三条，标 [推测]。** 其一：把并不换成 $\bigcup_bG_b$ 不取闭。停住点：$E$ 必须闭（定理要求 closed subspace），而 $\bigcup_bG_b$ 不闭；更关键的是第 11 节的上界证明要用引理 2.5，它需要 $B_E$ 弱开集上的对径性，而 slice 条件在非闭并不上仍然成立，所以主要损失是完备性，并非几何。其二：$h_b$ 不随 $b$ 衰减（例如恒取 $h_b=1/2$）。停住点：望远镜 $\sum_lh_l$ 发散，$B_E$ 到 $B(G_b)$ 的距离不趋于 $0$，预紧性断。Daugavet 一侧反而不受影响（slice 论证只要 $h_b\to0$）。这是两条假设被"分别消费"的最直接证据，我在第 16 节的依赖链里把它写成一行。其三：网取在 $B(G_b)$ ，并非 $S(G_b)$。停住点：(kw:enlarge-b) 只对网点的 $u_k$ 成立，我需要的是 $u\in S(E)$ 被球面元素逼近，取 $B$ 的网会逼近到一个范数可能 $<1$ 的极限，$\ell(a_b)>\alpha$ 仍成立但 $a_b$ 的极限是 $u$（已归一化）没问题；实际障碍在 (a) 的 $w\in S(G)$ 与严格性论证需要 $v\in S$，网在球面上更省。[推测]

## 16 常数与参数台账

我把全篇每一个出现的数值、阶数、位移与指数收进这张表，五栏全部填实。位置栏用 `文件:行`，`intro`=sections/introduction.tex，`moduli`=sections/moduli.tex，`construction`=sections/construction.tex，`main`=main.tex，`fig`=figures/moduli.tex，Lean 侧用文件名:行。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| 定义里的 $\frac12$ | 常数 $1/2$，在 $H_N$ 的平均中 | intro:16 | (eq:overlap-identity) 的左端 moduli:10；上界一侧 moduli:279-283 | 换成别权重则 moduli:282 的 $\frac{t+(t-2)_+}2$ 不再等于 $\max\{t/2,t-1\}$，两分支折点移位 |
| 质量二分的 $1/2$ | $\lVert C(y)\rvert _1\le1/2+\varepsilon$ | moduli:57 | moduli:58-59 的 $t/2-t\varepsilon$；Lemma 2.1 结论 moduli:21 | 若符号泛函只压到 $\delta\ne1/2$，下界为 $t(1-\delta)$，与 moduli:279-283 的上界 $t/2$ 不等，定理失精确  |
| clip 高度 $\vert x\vert/t$ | 逐点，随 $t$ 反比缩小 | moduli:24-26 | moduli:48-50 的 $\lVert y-C(y)\rvert =1-\lVert C(y)\rvert $；moduli:35 的 $2\vert x\vert/t$ | 改常数高度则 $\min\{\vert x\vert,t\vert y\vert\}$ 与 $t\lVert C(y)\rvert $ 不对齐，(eq:overlap-identity) 第三段失去抓手  |
| 网误差 $\varepsilon$ | 任意小，最后 $\varepsilon\downarrow0$ | moduli:41,60-61 | moduli:52-57 的两次 $\pm\varepsilon$；$t\varepsilon$ 损失 | 若禁止 $F$ 随 $\varepsilon$ 变，则 moduli:62-63 的免责句变成要求，取不到 sup 的极限 |
| 网点数 $m$ | 有限，随 $K$ 与 $\varepsilon$ 增长，速率未追踪 | moduli:41 | moduli:44-46 的 $\bigcap_{i\le m}\ker\sigma_i$ 余维 $\le m$ | $m=\infty$ 时 $F\notin\operatorname{cof}(E)$，$H_E$ 定义 moduli/intro:14 不认这个 $F$ |
| $t-1$ 分支 | 位移恰 $1$ | moduli:65-68 | $\max\{t/2,t-1\}$ 的右支；与上界 moduli:278 对齐 | 若改用反向三角（得 $t-2$）则 moduli:69 "Combining the two bounds" 只给 $\max\{t/2,t-2\}$，$t>2$ 处上界严格大于下界 |
| $t-2$ 分支 | 位移 $2$ = $\lVert x\rvert =1$ 加定义的 $-1$ | moduli:239-241 | $D_E\ge\max\{0,t-2\}$；与上界 moduli:278-284 对齐 | 若删定义的 $-1$ 则变 $t-1$，与 $H_E$ 的错位 $1$ 消失，图 fig:11-12 两线重合  |
| $2-\eta$ 与 $\eta$ | $0<\eta<\min\{1-\alpha,\rho/2\}$ | moduli:120 | moduli:124 的 $\ell(y)>1-\eta>\alpha$；moduli:126 的 $2-2\eta>2-\rho$ | 丢掉 $1-\alpha$ 约束则 $y$ 可能不在 slice $H$；丢掉 $\rho/2$ 则达不到 $2-\rho$ |
| $(1-\eta)+(1-\eta)^2$ | 三个独立 $\eta$-损失 | moduli:136-138 | moduli:140 的 $\eta\downarrow0$ 得 $1+a$ | 少一条 $\varphi(w)\ge1-\eta$ 则 $a$ 的因子失，等号右侧不足 $1+\lVert T\rvert $  |
| $M$，$R>M$ | $M=\max_{q\in D}\vert q\vert$，误差 $M^2/(2R)$ | moduli:164-176 | moduli:177-179 的 exposed 生成 $D$ | $R\le M$ 时系数 $p_R+Ra$ 可能为零，unique-maximizer 论证崩 |
| slices 数 $l$ | 有限，界未追踪 | moduli:181,210 | moduli:224-226 的指数 $(1-\eta)^l$ | $l\to\infty$ 使 $2(1-\eta)^l\to0$，Lemma 2.5 的 $\sup=2$ 归零 |
| 权重 $\lambda_i$ | 严格正，$\sum\lambda_i=1$ | moduli:182,211 | moduli:220-221 保证 $\lVert z_i\rvert >0$ 归纳可续 | 某 $\lambda_i=0$ 则 $z_i$ 可为 $0$，下一步 $z_i/\lVert z_i\rvert $ 除零  |
| $2(1-\eta)^l$ | 趋于 $2$，展开为 $2-2l\eta$ | moduli:226 | Lemma 2.5 结论 moduli:206 | 若要给定 $\rho$ 的显式率，需 $\eta\le\rho/(2l)$，论文未给 |
| 投影 $P$ | 有限秩，$\ker P=F$ | moduli:244-246 | moduli:248-251 的 $U_\varepsilon$ 弱开 | $P$ 无限秩则非弱-范连续，$U_\varepsilon$ 不弱开，Lemma 2.5 不适用 |
| 上界侧 $\varepsilon$ | $0<\varepsilon<1/2$ | moduli:246 | moduli:261 的 $2-2\varepsilon<L_\varepsilon\le2+\varepsilon$ | $\varepsilon\ge1/2$ 时 $L_\varepsilon$ 可趋 $0$，moduli:257 的 $y_\varepsilon=z_\varepsilon/L_\varepsilon$ 除零 |
| $L_\varepsilon$ | 夹逼到 $2$ | moduli:256-261 | moduli:278 的 $(t-L_\varepsilon)_+\to(t-2)_+$ | 若对径性只到 $2-\delta$，折点移到 $t=2-\delta$，公式不再精确 |
| $\lambda=\min\{t/L_\varepsilon,1\}$ | 分段，$\le1$ | moduli:267-268 | moduli:269-277 的凸分解与三角 | 直接取 $t/L_\varepsilon$ 在 $t>L_\varepsilon$ 时权重 $>1$，凸组合失效 |
| $1+\varepsilon+(t-L)_+$ | 单一上界式 | moduli:275-277 | 同时给 moduli:279-284 的两条曲线 | 分头估计两条需两族方向，$F$ 内的构造自由度不足 |
| $t_0=a/(4R)$ | $R$ 在分母，系数 $1/4$ | moduli:306 | moduli:313-315 的半径阈值；moduli:339 的 $t_0R+\eta<a/2$ | $t_0$ 取大则 $U$ 中 $z$ 更易越过阈值，$N(u)>R$ 的矛盾仍成但 $\lVert u-x_0\rvert <1/2$ 失  |
| $\gamma$ | $0<\gamma<\overline\delta_N(t_0)$ | moduli:307 | moduli:308 的 $(1+\gamma)N(x_0)>R$；moduli:325 的 $\eta$ 上界 | 无 AUC 假设则 $\overline\delta_N(t_0)$ 可为 $0$，$\gamma$ 无从取，整段失效 |
| $\eta$ 的双约束 | $<\min\{(1+\gamma)N(x_0)-R,\;a/4\}$ | moduli:325 | moduli:335 的 $N(u)>R$；moduli:339 的 $<a/2$ | 去第一约束则 $u\in B_E$ 不矛盾；去第二则 $\lVert u-x_0\rvert <1/2$ 失  |
| 下等价常数 $a$ | $a\lVert u\rvert \le N(u)$ | moduli:302-303 | moduli:340 的 $\lVert u-x_0\rvert <1/2$ 换算 | 只有上界则 $N$-小不蕴含原范数小，且弱拓扑可能变化  |
| $R=\sup_{B_E}N$ | 有限，等于 $\sup_{S_E}N$ | moduli:303,310 | moduli:306 的 $t_0$；moduli:339 的 $t_0R$ | $R=\infty$ 则 $t_0=0$，AUC 定义只在 $t>0$ 有意义 |
| 常数 $10$ | $2+4/(2-p)$ 在 $p=3/2$ 处 $=10$ | construction:101,127-128 | construction:185 的 $10(108s/r)^p<q$；(kw:coefficient-bound) | $p\to2$ 时 $10\to\infty$，$q$ 无法同时满足 (kw:p-choice) |
| $s=(p-1)/p$ | $s\to0$ 当 $p\downarrow1$ | construction:94,110 | $\E f=sp/(p-1)=1$；$\PP(f>u)=(s/u)^p$ | $s$ 定义改动则均值不为 $1$，$\lVert v_{kj}\rvert =1$（construction:198）失  |
| $18$ | $2\cdot3^p$，用 $3^p\le9$ 与 $1-2^{-p}\ge1/2$ | construction:135-138 | construction:143 的 $\max$ 尾下界 | $p>2$ 时 $3^p>9$，$18$ 变大并连锁 $36,54,108$ |
| $36$ | $2\cdot18$，来自 $1-e^{-v}\ge v/2$（$v\le1/18$） | construction:144-146 | construction:159 的积分下限 | 该初等不等式失效需换指数积分估计，$\max$ 路线断 |
| $54$ | $36p\le36\cdot\frac32=54$ | construction:160 | construction:230 的 $A_k\le54\cdot2$ | $p$ 上限抬到 $2$ 则 $54\to72$，$108\to144$，(kw:p-choice) 需重选 $r$ |
| $108$ | $54\cdot2$，$2=\lVert g\rvert +\lVert g^{(k)}\rvert $ | construction:224,230 | construction:185 与 (kw:coefficient-bound) | 球半径若 $>1$ 则 $2$ 变大，$q$ 的可用额度随之缩小  |
| $c\in(0,h/4)$ | $h/4$ 是尾部与小值两半的分摊 | construction:177 | construction:202-206 的 $(s/c)^p+c$；$2((s/c)^p+c)<h$ | $c\ge h/4$ 则 $2c\ge h/2$，剩给尾部的额度不足，$\lVert w+v\rvert \ge2-h$ 失  |
| $r,q$ | 由 (kw:rq-choice) 双条件限定 | construction:178-181 | $\PP(D)\ge1-mq$；Markov 分母 $h$ | $mq\ge1$ 则 $(1-mq)^{-1}$ 无意义，$\lVert \psi\rvert $ 界断  |
| $2mr+(1-mq)^{-1}-1$ | $mr$ 计两次的代价式 | construction:254,261,268 | (kw:enlarge-c) 的最后一步 | 只计一次则 $\psi$ 的范数与 $\lVert \psi-\psi_0\rvert $ 有一处失控  |
| $n$ | 最后选取，速率未追踪 | construction:188,285-286 | (kw:enlarge-b) | 先定 $n$ 则 construction:207,270 的"对每个 $n$ 成立"余地消失 |
| $f^M=\min(f,M)$ | 先 $M$ 后 $n$ | construction:278-284 | $\PP$-$\E$ 界 (kw:lln) | 顺序反则 $\operatorname{Var}(f^M)$ 无限，第二项不收敛 |
| $h_b=2^{-b}$ | 可和、且 $\le1/2<1$ | construction:305 | 严格性 $2-h_b>0$（construction:317）；尾和 $2^{1-b}$ | $h_b\equiv1/2$ 则尾和不 $\to0$，$B_E$ 的 $d$-预紧断，Daugavet 侧仍活 |
| $2^{1-b}$ | 几何尾和 | construction:329 | construction:335-336 的 $\eps/2$ 选 $b$ | 换 $b^{-2}$ 需重证 $\sum_{l\ge b}l^{-2}\to0$，且 $b=1$ 处 $h=1$ 破 $h<1$ |
| $d$ 的次可加 | 常数 $1$（union bound） | construction:40-41 | construction:326-330 的望远镜 | 无三角不等式则逐级误差不可加，迭代整体失效 |
| $d(f,g)\le\lVert f-g\rvert ^{1/2}$ | 开方率，Markov | construction:44-46 | construction:332-333 的极限延拓 | 无这座桥则 $B_E$ 中极限元素的距离估计不成立  |
| Lean 的 $\min(1/4,\delta/6)$ | 显式 $1/4$ 与 $1/6$ | UpperBounds.lean:47-50 | 供 $2-2\varepsilon<L_\varepsilon$ 与 $\varepsilon$ 两项相加 | $6$ 是 $2\varepsilon+\varepsilon$ 加余量的打包，改小则 $\delta$ 目标达不到 |

**依赖链。** 我把两条假设的去向按消费点排序。total boundedness in measure 只被 Lemma 2.1（moduli:20）消费一次，其内部消费点是 clip 集的 $L^1$-紧性（moduli:28-39）与有限 $\varepsilon$-网的存在（moduli:41）；删掉它，(L1) 的 $t/2$ 分支先断，$H_E$ 只剩 $\max\{0,t-1\}$ 型的平凡下界，而 $t\le2$ 处下界为 $0$，与上界 $t/2$ 之间留下不可弥合的空隙，精确公式整体失效；Daugavet 一侧的三条（两条上界、AUC 排除）完全不受影响。Daugavet 性质被三处消费：Lemma 2.5（经由引理 2.3 与 2.4）、上界证明 moduli:243-289、AUC 排除 moduli:301-343；删掉它，两条上界与排除同时失，只剩 $H_E\ge\max\{t/2,t-1\}$、$D_E\ge\max\{0,t-2\}$ 与"原范数不 AUC"（因为下界已给 $\overline\delta_E=0$ 在 $t\le2$）。无穷维性单独被四处消费：$S_F\ne\varnothing$（moduli:47 与 moduli:237 的 $\ker\varphi$ 非零）、引理 2.3 的反向里 $\ell$ 的 slice 非空（不，那里只需非零空间）、$E$ 的严格递增构造（construction:315-318）、以及 intro:32-33 那句比较论证里的交核。$0<h<1$ 与 $h_b<1$ 是构造侧的独立硬约束，断点在 construction:317 的 $0\ge2-h_b$。最先断的删法排序：先删 total boundedness 会让 $t/2$ 分支立刻没有来源（下界掉到 $t-1$ 与 $0$ 之间）；删 Daugavet 会让上下界之间的缝扩大到"完全未知"，因为它同时抽走上下界的一侧与排除论证；删无穷维性则所有 $\operatorname{cof}$ 里的测试向量集合变空，$H_E$、$D_E$ 的内层下确界在空集上取，定义本身塌。

## 17 Lean 取证

我用下面的命令实测（全部在 `E:\math\lean` 下跑，不做全库 grep）。

```
grep -n -i "daugavet|D72|exact-asymptotic|asymptotic-moduli" formalization.yaml
  -> 367: title, 369: id, 1090: comparator_config, 1091: declaration, 1092: file
cat ComparatorChallenges/DaugavetModuli.json
ls OAI/Analysis/Daugavet/*.lean | wc -l        -> 28
cat *.lean | wc -l                             -> 4307
cat *.lean | wc -c                             -> 205985
grep -c sorry *.lean                            -> 28 个文件全部 0
grep -n "axiom|sorryAx|native_decide|opaque" *.lean -> 无命中
grep -ho "^theorem\b"  -> 19    "^lemma\b" -> 206   "^def\b" -> 52
grep -ho "^abbrev\b"   -> 10    "^instance\b" -> 2   "^structure\b" -> 3
grep -ho "^noncomputable \S*" -> 28 次全是 "noncomputable section"
grep -h "^import " *.lean | wc -l -> 28，其中外部 1 条（import Mathlib），内部 27 条
cat lean-toolchain -> leanprover/lean4:v4.34.1
```

行首词频（`grep -ho "^\s*[A-Za-z_][A-Za-z0-9_.']\+"` 聚合）：have 604、rw 232、exact 148、let 106、obtain 101、simp 85、apply 80、intro 73、refine 71、change 64、linarith 61、dsimp 27、nlinarith 26、ring 24、calc 22、filter_upwards 20、classical 20、rintro 19、by_cases 35、simpa 35、unfold 17、by_contra 9、ext 8、field_simp 6、cases 6、rfl 5、omega 3、convert 5。全文出现次数（含行内）：simp 279、rw 297、linarith 211、norm_num 50、positivity 42、ring 37、nlinarith 37、field_simp 15、filter_upwards 25、csInf 15、calc 22；aesop、gcongr、norm_cast、measurability 均为 0。namespace 71、section 18、end 89、variable 54、open 57、universe 23。

三个登记在 `DaugavetModuli.json` 的 theorem_names 是 `OAI.ExactModuli.exact_main`、`OAI.ExactModuli.kadets_werner_existence`、`OAI.ExactModuli.exact_example`，`definition_names` 是空数组，`permitted_axioms` 是 `["propext","Quot.sound","Classical.choice"]`，`enable_nanoda` 为 `false`。formalization.yaml 的 `declaration` 只指 `OAI.ExactModuli.exact_example`（`Main.lean:22`）。我没有在 28 个文件里找到任何 `#print axioms` 记录，也没有 `.lake` 里对应本模块的构建产物，所以公理集是按配置声明的，我无法独立验证；这一点我如实登记为"未验证"。

论文陈述与 Lean 陈述的错口，我按严重程度排：

1. $y$ 的归一化强度不同。论文 Lemma 2.3（moduli:113）结论是 $y\in H$，即 $\|y\|\le1$；Lean 把带 Daugavet 性质的几何统一抽象成 `UnitSliceProperty`（`Model:61-64`），硬性要求 `‖y‖ = 1`。这一步在论文里由构造定理自己承担（construction:55 的 $y\in H\cap S(E)$），引理层没写；Lean 用 `daugavet_normalized_slice`（`slices:29`）与 `exists_unit_near_opNorm`（`slices:15`）把它补成独立引理。错口的方向是 Lean 更强。
2. 反向刻画的多一个假设。论文 Lemma 2.3 说"nonzero real Banach space"；Lean 的 `unitSlice_daugavet`（`SliceCharacterization:26`）要求实例 `[Nontrivial X]`。语义等价，但 Lean 把它作为类型类参数在证明里流动。
3. 排除 AUC 的半径与路线不同。论文取 $t_0=\dfrac{a}{4R}$，其中 $R=\sup_{B_E}N$（moduli:303-306），并用反证加 $\gamma$；Lean 取 `t := a / (4 * b)`（`ExactModuli:21`），其中 `b` 是等价常数（`EquivalentNorm:39` 的 `a * ‖x‖ ≤ N x ∧ N x ≤ b * ‖x‖`）。因为 $R\le b$，Lean 的半径更小。Lean 的路线也不同：它先由 `equivalentNorm_supremum`（`EquivalentNorm:87`）拿到近似上确界元 $x$，再用 `normD_bound_at_original_unit`（`EquivalentNorm:148`）直接证 `oneSidedModulus N t ≤ 0`（`ExactModuli:23-38`），全程不出现 $\gamma$、不出现反证。结论相同，中间量不同。
4. 无穷维性的显式程度。论文 Lemma 2.1 的陈述带"infinitely-dimensional"（moduli:18），而正文开头（moduli:4-5）声明" The clipping argument uses only total boundedness of $B_E$ in measure"。Lean 把 `hinf` 作为 `clipping_lower_bound`（`LowerBounds:194-201`）与 `oneSided_lower_bound`（`LowerBounds:213`）的显式假设，并被 `cofinite_has_Nunit`（`EquivalentNorm:23`）这类引理消费，用途是让 $S_F\ne\varnothing$。也就是说 Lean 证实了论文那句"只用 total boundedness"是不精确的：无穷维性在"测试集非空"这一点上被真实消费。这一条是我这次取证最实的收获。
5. sup/inf 的存在性被 Lean 显式化。论文的 $H_N$、$D_N$ 直接写 $\sup$、$\inf$；Lean 用 `sSup`/`sInf` 集合式定义（`Model:23-35`），于是要证 `normOneSidedValues_bddBelow`（`EquivalentNorm:33`）、`normD_outer_bddAbove`（`EquivalentNorm:45`）、`normD_centers_bddBelow`（`EquivalentNorm:64`）等一组有界性与非空性引理，且 `averaged_upper_bound`/`oneSided_upper_bound`（`UpperBounds:41,63`）里用 `csSup_le` 时要提供集合非空的见证元 `⟨_, ⊤, cofinite_top, rfl⟩`。这部分工作量在论文里完全隐形。
6. 概率空间从"任意"收到"具体"。论文的定理 1.1 对任意概率空间 $(\Omega,\mathbb P)$ 陈述；Lean 的 `exact_main`（`ExactModuli:42-45`）也确实对任意 `[IsProbabilityMeasure μ]` 陈述，但存在性定理 `kadets_werner_existence`（`Main:11-16`）把空间固定为 `kwMeasure`（`Model:69`，`Measure.infinitePi` over `ℕ → unitInterval`，即论文 construction:26 的 $([0,1]^\mathbb N,\lambda^\mathbb N)$）。所以 Lean 覆盖度与论文一致，没有丢失普适度；这是本篇少见的"形式化没有降级"的地方。
7. 索引平移。论文 $h_b=2^{-b}$（$b\ge1$，尾和 $2^{1-b}$，construction:305,329）；Lean `stageError n = (1/2)^(n+1)`（`Stages:106`），相应 `stage_ball_control` 给 `2 * stageError b - 2 * stageError a`（`ClosedUnion:59-61`），即 $2^{-b}-2^{-a}$。差一个下标，两边自洽。
8. 命题打包顺序。Lean 的 `exact_example`（`Main:22-36`）在合取里同时列 `UnitSliceProperty E` 与 `Daugavet E`，而论文的定理 4.1 只声明 slice 性质并用 "In particular" 带出 Daugavet（construction:56）；Lean 里 Daugavet 由 `KW.constructedSpace_daugavet` 提供，其来源是 `unitSlice_daugavet`（见错口 2）。

## 18 源流：我检索到的与我自己知道的，分开写

这一节的口径与前面不同，内容是论文之外的。论文自己的文献账我在 `references.bib` 里逐条核对过（8 条，全部带卷期页码与 DOI 或 arXiv 号）：DKRRZ2016（JMAA 436(2):810-821）、KW2004（PAMS 132(6):1765-1773，arXiv:math/0301182）、Baudier2026（arXiv:2609.21283v1，2026-09-18）、BourgainRosenthal1980（Israel J. Math. 37:54-75）、KSSW2000（Trans. AMS 352(2):855-873，arXiv:math/9709216）、Shvydkoy2000（JFA 176(2):198-212，arXiv:math/9903098v2）、ANP2019（Pacific J. Math. 301(2):385-394）、BrezisLieb1983（PAMS 88(3):486-490）。这八条是论文正文引用过的，我在 moduli/intro/construction 里逐一找到过 `\cite` 的位置。

我按派单要求做了外部检索，结果是这次检索基本无用。我跑了五条 WebSearch（关键词覆盖 "Daugavet 1963 C[0,1]"、"Kadets Werner Schur Daugavet ALM 2007 survey"、"asymptotic uniform convexity modulus Kubokawa"、"Daugavet property survey structural consequences weak open diameter two"），命中集合里唯一数学上相关的是 arXiv:2307.10647（The Daugavet and Delta-constants of points in Banach spaces）这一条链接；两次 WebFetch，一次成功取到 arXiv:math/0301182 的摘要句 "yields a space with the Daugavet property and the Schur property"，另一次取 MathSciNet 被 Cloudflare 拦截返回脚本页。所以下面的历史叙述依据的是我自己的先验知识，凡我记忆不确定的归属都标 [推测]，我不用它们去解释论文的任何结论。

Daugavet 性质的源头。[推测] 1963 年 Daugavet 证明了 $C[0,1]$ 上的算子等式 $\|I+T\|=1+\|T\|$ 对（弱）紧算子 $T$ 成立，出处我记为 Uspekhi Mat. Nauk 一类的短文；论文 `intro:52-53` 的口径是把这条等式抽象成空间性质："a Banach space has the Daugavet property if $\|I+T\|=1+\|T\|$ for every rank-one bounded operator $T$"。从"紧算子"缩到"rank-one"再靠 KSSW 的刻画扩回全体算子，这条路径我按论文引用顺序核对：`intro:107-109` 把弱开刻画记到 Shvydkoy `[Lemma~3]`，把 slice 刻画记到 KSSW `[Lemma~2.2]`，并在 `moduli:106-108` 补一句 KSSW 的这条也被 Kadets 与 Werner `[Lemma~1.1]` 复述。

结构侧的已知结论。[推测] KSSW 2000 里我确信的有两条：$C(K)$ 有 Daugavet 性质当且仅当 $K$ 无孤立点；有 Daugavet 性质的空间失败 Radon-Nikodým 性质。[推测] 我记有一条更强的：任意无穷维 $L_1$-predual（即对偶是抽象 $L$-空间的预对偶）都有 Daugavet 性质，这条与本篇的关系值得留意，因为本篇的空间是 $L^1$ 的**子空间**，属于抽象 $L$-空间的子空间，一般不是 $L_1$-predual。派单点名的 "ALM 2007 的 Daugavet 结构综述" 我没能确认，检索未命中，我把它记为"用户提示中存在、我未能核实的一条引用"，并推测它指的是 2007 年前后关于 Daugavet 结构后果的综述性文章；本篇没有引它。[推测] 关于 Daugavet 与逐点一致凸重赋范的互斥，我记忆中标准的论证渠道正是"弱开子集直径为 $2$"，因为 LUR 或 AUC 重赋范会强制某些弱邻域的直径小于 $2$；这与本篇 `moduli:292-299` 的自述路线一致（它明写适用于任何满足该弱邻域性质的空间），但归属我核实不了。

模数定义的谱系。论文 `intro:9-25` 给出的 $D_N$ 形式，与我记忆中 Kubokawa 型渐近一致凸模数的标准写法一致：先在中心归一元上取 $\sup_{\operatorname{codim}F<\infty}$、再在内层对 $S_F$ 取 $\inf$，AUC 要求该函数在每个正半径上为正。`intro:39-41` 把 AMUC 的引入与"AMUC 与 AUC 是否可重赋范等价"这个问题明确归给 DKRRZ2016（`[Definition~2.2 and the question in Section~5]`）。`intro:42-45` 归给 Baudier 的是两条：$L^1$ 中测度相对紧子空间的 AMUC（`[Theorem~1]`）与对 Kadets-Werner 例的应用（`[Corollary~1]`）。`intro:46-50` 给出方法与文献分界：Baudier 用 Brézis-Lieb 沿几乎处处收敛子列的 $L^1$ 拆分恒等式（`[Theorem~1]` of BrezisLieb1983），本篇改用"有限截断网 + 网点的符号泛函"。`intro:80-84` 承认 Baudier 对最大型模数给过一致线性下界（`[final paragraph]`），本篇的推进是把平均与单侧两条曲线**逐点**定死。这三处是我唯一可以当作"论文自己声明的谱系"来引用的。

## 19 与最初设想的差异，以及我还怀疑的三处

我把进场时的三个判断与结局并列：

其一，我以为这是一个"算模数"的问题，实质是一个"谁被允许挑方向"的问题。定义里 $\sup_F\inf_y$ 的量词顺序决定了下界可以造 $F$、上界必须扛住一切 $F$，于是下界走 $L^1$ 逐点与测度紧、上界走 Daugavet 弱几何，两条完全异构的技术被一个公式缝合。我最初的路线（用 $L^1$ 结构同时做两侧）在机制上不可能成功，理由是任意给定 $F$ 与 $x$ 的支撑关系可以任意坏，我对此毫无控制。

其二，我以为 $1/2$、$1$、$2$ 是优化常数，实际它们全是定义里的归一化与逐点恒等式的搬运。我在第 5 节与第 11 节把它们逐一结到账上：$1/2$ 来自符号泛函造成的一次二分（$2\|C(y)\|_1\le1+2\varepsilon$），$t-1$ 的 $1$ 来自 $H_N$ 定义里的 $-1$，$t-2$ 的 $2$ 是那个 $-1$ 加上反向三角吃掉的 $\|x\|=1$。两处折点重合在 $t=2$，是 $\frac{t+(t-2)_+}{2}=\max\{t/2,t-1\}$ 这条纯标量恒等式的后果。

其三，我以为 $\overline\delta_E\equiv0$ 在 $[0,2]$ 上就把排除 AUC 解决了，实际上它只解决原范数那一侧，换范数后必须回到引理 2.5 的弱几何，而那里的参数 $a/(4R)$ 也说明排除强度取决于两个范数的等价常数之比。

我仍然怀疑、并且论文没有给我答案的三件事。第一，$H_E$ 与 $m_E$（最大值版本）在第 1 节的 $\tfrac12m_E\le\widehat\delta_E$ 比较里，本篇的精确值使 $t\le2$ 时比值恰好 $1/2$，即 intro:32-33 的"交核"技巧在这类空间上是尖锐的。这个尖锐性是巧合还是必然，论文没有讨论，我构造不出第二个例子，标 [推测]。第二，Daugavet 性质与测度预紧性是否彼此接近独立：本篇要求两条同时成立，构造则同时给两条。若把引理 2.5 换成任何"弱邻域含近对径点"的其他来源，第 11、12 节几乎逐字复用，说明上界与排除只吃后者，而 $t/2$ 只吃前者；这个分离我已在第 16 节的依赖链里落到具体行号，但"是否存在只满足其中一条的空间使另一条公式仍成立"，我没有查到，标 [推测]。第三，Lean 侧我只验证了声明层与常数层，没有跑 `lake build`，所以对"0 sorry"的实际含义我只能理解为源文件里没有 `sorry` 词元（我用 `grep -c sorry` 在 28 个文件上得到 28 个 0），编译层的 `#print axioms` 我没能取得证据。

我认为自己这份笔记最薄弱的三节是：第 12 节，因为 $t_0=a/(4R)$ 里 $\gamma$ 与 $\eta$ 的耦合我只做到"逐条核对不等式方向"，没有给出如果 $\overline\delta_N$ 只在某些半径为正的更弱假设下论证能走多远；第 13 节下界 $\operatorname{E}|Z|\ge A/54$ 的 $18\to36\to54$ 链条我给的是重构，其中"$\int_{sA}^\infty$"这一步我用了尾部积分公式，论文 `construction:159` 直接写结果，我没检查它在 $u<sA$ 段被丢弃时是否需要额外论证；第 14 节的参数顺序 $c\Rightarrow(r,q)\Rightarrow p\Rightarrow n$ 我只解释了"为什么可行"，没有解释"为什么这是必要顺序"，特别是 $r$ 早于 $p$ 出现而 $r$ 只通过 $10(108s/r)^p<q$ 用到，若把 $r$ 挪到 $p$ 之后是否会改变可容许的 $h$ 范围，我算不出反例。