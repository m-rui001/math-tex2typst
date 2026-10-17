# D30 负 pinched 三维 Kähler 流形没有有界全纯坐标：我把两条独立机器焊在同一个 4 log 上

对象论文：`A negatively pinched Kähler threefold without bounded holomorphic coordinates`（2026-09-25，OpenAI 预印本）。
TeX 源码：`E:\math\preprints\A-negatively-pinched-Kahler-threefold-without-bounded-holomorphic-coordinates-September-25-2026\build\`（`main.tex` + `sections\01-introduction` 到 `09-pinching`）。引文行号形如 `03:129` 表示 `03-peaks.tex` 第 129 行。
Lean：`E:\math\lean\OAI\Geometry\Kahler\`。被认证的顶层定理是 `OAI.PinchedHartogs.main_theorem`，比对配置 `ComparatorChallenges\PinchedKahler.json`，许可公理三件套 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda: false`。
素材：`研究笔记\素材\Kähler负pinched三维fold-素材.md`（131,178 字节，末尾 `<!-- 完 -->`）。

记号约定与论文一致。$\B=\{z\in\C^2:|z|<1\}$ 是基球，$S=\{|\xi|=1\}$ 是其边界球面，$\sigma$ 是归一到总质量 $1$ 的表面测度。$\psi(z)=-\log(1-|z|^2)$ 是基位势，$I=(\psi_{i\bar j})$ 是它的复 Hessian（同时视为对第一变量线性的 Hermitian 形式）。$h=\partial\bar\partial\phi$。全篇实度量约定 $g=2\operatorname{Re}\widehat g$，"sectional curvature"一律指底层实 Riemannian 度量的截面曲率，"completeness"指测地完备。

三个术语我按论文口径先钉住，后文不再解释：

- pinched（夹逼）。这里指双侧实截面 pinching：存在有限常数 $0<A\le B$ 使每条实二平面 $\sigma$ 的截面曲率满足 $-B\le K_g(\sigma)\le -A<0$，即上下都夹在负常数之间。
- 有界全纯坐标（bounded holomorphic coordinates）。指一个全纯映射 $F:M\to\C^n$，像集在欧氏目标里有界，且其复 Jacobian 行列式处处非零。有界区域自动有这种坐标（坐标函数本身）；本文要造的 $M$ 没有。
- Hartogs 度量。指由基上的光滑实函数 $\phi$ 决定的 Hartogs 域 $M_\phi=\{(z,w)\in\B\times\C:e^{\phi(z)}|w|^2<1\}$ 上、位势 $\mathcal K_\lambda=\lambda\psi-\log(1-e^{\phi}|w|^2)$ 的复 Hessian 所给的 Kähler 度量；它是 Calabi 由基位势与 Hermitian 纤维范数的径向函数造度量这一构造的特化（`01:102-104`，引 `\cite[Section~3, equations~(3.1)--(3.2)]{Calabi1979}`）。

## 0 我进场时手里有什么

我进场要否证的是 Wu-Yau 双侧实截面版本猜想 4.3（`WuYauSurvey2019`，Conjecture 4.3, p.18，论文 `01:20-22` 逐字转述）：

> if a simply connected complete K\"ahler manifold has every real
> sectional curvature between two negative constants, must it be
> biholomorphic to a bounded domain in its complex dimension?

它的更早形态是 H. Wu 1967 正规族工作里的问题(1)（`WuNormal1967`，p.195，`01:14-17`）：完备单连通 Kähler 流形，实截面曲率非正，全纯截面曲率有负上界，是否双全等于有界区域。我的例子同时落进这两个问题：双侧负 pinching 比"非正 + 全纯截面上界为负"更强，所以否证了强的那个，自动否证弱的陈述里以双侧为假设的那一支。

维 1 的正结论是我的对照组，论文 `01:7-9` 交代得很直白：

> In complex
> dimension one, a complete simply connected surface whose curvature is
> bounded above by a negative constant is biholomorphic to the disk. In higher
> dimension, the existence of bounded holomorphic coordinates is a
> separate global analytic requirement.

这句"separate global analytic requirement"是整篇的立足点：高维里曲率+完备并不能逼出全局有界全纯坐标，它是另一回事。我要做的就是把"另一回事"造出一个具体的反例来。

我进场时手里能调用的已知工具，按谱系列（`01:24-32`、`01:63-88`、`01:102-145`）：

1. Mostow-Siu（1980）造了不被球覆盖的紧负曲率 Kähler 曲面；Deraux（2005）复习其构造并给出三维例子。它们 lift 到万有覆叠后的度量由紧性给双侧负截面界。但这是障碍 1，论文 `01:30-32` 明确它不够：

   > These non-ball results, however, do
   > not exclude a biholomorphic to some other bounded domain; that is
   > the stronger obstruction sought here.

   也就是说，Mostow-Siu/Deraux 只排除了"覆叠同构于单位球"这一个候选，没排除"双全等于某个别的有界区域"。我要的是后一个更强的排除，所以我的障碍必须直接针对"任何有界区域"，并非针对球。
2. Greene-Wu（1979）的 Bergman 度量下比较，Wu-Yau（2020）补上界并比较 Bergman、Kobayashi-Royden、完备负 Kähler-Einstein、原度量四者（`Theorems~4 and~6`、`Corollary~7`）。这是障碍 2，论文 `01:73-77`：

   > These comparisons
   > do not supply a fixed tuple of bounded holomorphic functions with
   > independent differentials everywhere. Applied to the example in
   > Theorem~\ref{main:theorem}, they show that all these intrinsic metrics
   > can be complete and mutually comparable while no such tuple exists.

   我读这句话时的第一层收获是：内在度量之间的比较是"逐点/整体等价"层面的信息，它给不出一个固定的有限 tuple。这告诉我，我的反例哪怕把四个内在度量都做到互相可比也照样成立，我不必去动它们。
3. Hao-Chen-Wang（2025）与 Hao-Chen-Wang-Zhang（2026）在"丛曲率决定底度量"或 Kähler-Einstein 假设下给盘丛的 pinching。这是障碍 4，论文 `01:115-121` 声明我的增量：

   > The estimate needed here concerns all real two-planes when the base
   > form $\lambda\partial\bar\partial\psi$ and the fiber-weight curvature
   > $\partial\bar\partial\phi$ are independent. We assume upper and lower
   > bounds for the latter form and bounds for the component derivatives
   > needed for curvature, expressed in centered ball coordinates. No curvature sign for the metric
   > $\partial\bar\partial\phi$ is assumed. We derive and estimate the
   > full curvature tensor under precisely these hypotheses.

   关键词 independent：底形式与纤维权曲率相互独立、且我不假设 $\partial\bar\partial\phi$ 的曲率符号。这意味着我的 §8 张量计算必须在"最一般"的假设下做，不能借任何现成的符号信息偷懒。这条直接决定了我 §8 的张量分解要写到全部分块（见第 9 节）。
4. 姊妹论文 `\cite{OpenAIOneSided2026}`（障碍 3）在足够大的固定有限维里造了"单侧曲率 $\le -1$、下界无界、只有常数有界全纯函数"的区域。`01:85-87`：

   > Its curvature is unbounded below. Here both curvature bounds are
   > finite and uniform, while the two bounded base coordinates remain.
   > The two constructions and their proofs are independent.

   这是我最开始最容易走错的方向。我一开始以为可以把两篇合并：既"没有非平凡有界函数"又"双侧 pinched"。但 `open question` 那侧要求曲率下界无界，而这侧要求双侧有限，二者在同一个例子里冲突。`[推测]` 我读最后那句"The two constructions and their proofs are independent"时，判断作者明确试过合并、并且结论是不行：一侧是"有界函数全消失"（Liouville 型），需要把域拉得极瘦；另一侧是"双侧负 pinching"，需要度量在各方向都受控，二者对"域的形状"提的要求相反。我的定位因此被写死在中间：我保留两个非常值有界全纯函数（基坐标 $z_1,z_2$），只消灭第三个方向。

本笔注叙事对应的论文目录为 preprints/A-negatively-pinched-Kahler-threefold-without-bounded-holomorphic-coordinates-September-25-2026，在 .tools/lean_queue.txt 队列第 21 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 主定理，以及两条"没有被否定"的边界

主定理 TeX 原文（`01:39-49`，标签 `main:theorem`）：

```tex
\begin{theorem}\label{main:theorem}
There exist a contractible domain $M\subset\C^3$, a smooth complete
K\"ahler metric $g$ on $M$, and finite constants $0<A\le B$ such that
\[
 -B\le K_g(\sigma)\le -A<0
\]
for every real two-plane $\sigma\subset T_pM$ and every $p\in M$.
No bounded holomorphic map $F:M\to\C^3$ has a nowhere-vanishing Jacobian
determinant. In particular, $M$ is not biholomorphic to a bounded domain
in $\C^3$.
\end{theorem}
```

量化结构我逐字拆开：$\exists M\,\exists g\,\exists A,B$ 使双侧 pinching，且 $\neg\exists F\,(\text{$F$ 有界全纯}\wedge\text{Jacobian 处处非零})$，尾句"$M$ 不双全等于任何 $\C^3$ 里有界区域"是这一否定的直接推论（最后一跳在 `02:169-171` 的链式法则）。

我特意把主定理之后论文逐字给出的两条"没有被否定"的东西（`01:51-61`）抄下来当护栏，因为过度解读这条定理太容易：

> The example has two bounded
> nonconstant holomorphic functions, supplied by its base coordinates.
> Its analytic obstruction concerns a fixed triple of bounded functions
> with independent differentials at every point.
> The domain is nevertheless Stein: the construction supplies a smooth
> strictly plurisubharmonic exhaustion (Lemma~\ref{metric:complete}), so Grauert's solution
> of the Levi problem applies \cite[Theorem~2 and Section~3.4]{GrauertLevi1958}.
> Thus the obstruction is to bounded holomorphic coordinates, not to
> holomorphic convexity.

护栏一：$M$ 有非常值有界全纯函数（$z_1,z_2$），障碍只在"处处独立的三元组"层面。护栏二：$M$ 是 Stein，严格 psh exhaustion 由 `lem metric:complete` 直接提供，Grauert 解 Levi 问题适用，所以障碍不是全纯凸性。这两条对我下面造 $\phi$ 有真实的约束力：我不能把 $M$ 造得"连一个有界函数都没有"，因为那会撞回姊妹论文的单侧构造；同时我必须保证 $\phi$ 光滑严格 psh，好让 exhaustion 成立。

`[推测]` 候选失败路线（第 0 到第 1 节层面）：

- `[推测]` 直接照搬 Mostow-Siu/Deraux 的紧商去论证"不双全等于任何有界区域"。失败机制：他们的障碍只作用在"覆叠是球"这一具体候选上，靠的是球上刚性（Mostow 刚性、Siu 的 Kähler  rigidity 一类）；换成任意有界区域，刚性不存在，那条论证根本没有可作用的靶子。这就是障碍 1 的字面含义。
- `[推测]` 用内在度量比较（Bergman/Kobayashi）导出"没有有限 tuple"。失败机制：比较定理给的是度量之间的双向 Lipschitz 等价，是逐点信息，无法产生一个具体的三元组 $F$，更无法对"所有有界三元组"取否。障碍 2。
- `[推测]` 造一个曲率下界无界的例子（借姊妹论文）。失败机制：那会掉出主定理的双侧 pinching 假设，不再是本猜想的反例；而且一侧构造要求把域拉瘦、与双侧受控冲突。

## 2 构造分层、参数选择顺序与两条机器如何咬合

`02:3-7` 开头就把整个构造声明成"两个输入 + 一段短论证"：

> The construction separates a problem about functions on the ball from a
> curvature estimate.  The first input is a strictly plurisubharmonic
> function with controlled derivatives and an obstruction to a prescribed
> holomorphic real-part bound.  The second turns its complex Hessian bounds
> into a complete metric with uniformly negative real sectional curvature.

据此我把构造分五层（依赖自底向上，对应素材 §1.3）：

第 0 层，归约骨架（§2）：产出 `prop base:existence`（受控位势 $\phi$）、`prop metric:transfer`（Hartogs 度量迁移）、`lem map:obstruction`（把"无全纯实部下界"转成"无 Jacobian 非零有界映射"）。`main:theorem` 的证明 = 取 $\phi$ + 取 $\lambda$ + 套引理。
第 1 层，解析原料（§3、§4）：§3 给射影分离集 $\mathcal P_k$、齐次峰 $P_k$（`peaks:polynomial`）、峰上界（`peaks:bounds`）、patch 单峰近似（`peaks:patches`）、径向轮廓 $f,b,R_0$（`peaks:profiles`）；§4 给正代表密度 $W_j$（`density:recursion`），`thm density:main` 给逐层正性、导数界、代表性质。
第 2 层，对数测试（§5、§6）：§5 给正则化对数 $U_k$（`tests:regularized`）、单尺度负平均 `prop tests:negative`（$-d_2$）、对后续密度仍负 `lem tests:later`（$-d_3$）；§6 给位势 $\phi=\psi+L\sum_jU_{k_j}$（`base:potential`）、局部 $C^\infty$ 收敛 `lem base:convergence`（$h\ge I$）、无 pluriharmonic 下界 `lem base:minorant`（$L>5\log Q/d_3$）、4 阶导一致界 `lem base:chart-estimates`。
第 3 层，全局几何（§7）：`lem metric:complete`，$M_\phi$ 可缩、$\mathcal K_\lambda$ 给光滑正定完备 Kähler 度量并严格 psh exhaustion。
第 4 层，曲率与 pinching（§8、§9）：§8 全张量分解 `prop curv:tensor`、实截面标量商 `lem curv:real-plane`、Gram 代数 `lem curv:gram`、误差收缩 `lem curv:errors`、分子 `curv:negative-numerator`；§9 混合平面代数 `lem pinch:algebra`、大 $\lambda$ 一致负 `lem pinch:positivity`、固定参数双侧界（`proof of metric:transfer`）。

闭合关系：`main:theorem` = `base:existence`（第 1-2 层）+ `metric:transfer`（第 3-4 层）+ `map:obstruction`（第 0 层）。

现在是被否定的猜想之外的第二难：整条解析链有一根严格的"选择顺序"，我不能反着来。`04-estimates:280-282` 与 `06:246-266` 反复强调它：

> We emphasize the order of the choices.  The normalized correction
> constant $C_2$ depends only on the fixed patch data.  It determines
> $K_*$; this in turn determines $C_1$; finally $Q_0$ is chosen.

以及 §6 证明末尾关于 $\lambda$ 独立性（`06:263-265`）：

> The chart constant is allowed to depend on these
> fixed choices, including $L$.  The metric parameter $\lambda$ in
> Proposition~\ref{metric:transfer} is chosen only afterward from
> these bounds, so none of the choices above depends on $\lambda$.

完整顺序链（素材 §1.4/§1.5，我核对到 tex）：

$$a\to\alpha=\log a\to s_1\to(f,b,R_0)\to(\epsilon,\eta)\to D_0\to(k_*,d_2)\to d_3=d_2/2\to C_2\to K_*\to C_1\to Q_0\to Q\to L\to\lambda.$$

每个箭头含义是"箭头右边的量只依赖左边已固定的量"。我之所以现在就把这条链摊开，是因为全篇至少三处崩盘都来自违反它：`prop tests:negative` 必须先于 spacing 定 $\epsilon$（`05:86-89`"The next estimate chooses the regularization before the spacing. This order matters"）；`thm density:main` 必须先定 $K_*$ 再选 $Q_0$（否则 $K_*$ 进 $H(Q)$、$H(Q)$ 进正性界、$Q$ 进 $C_1$，循环）；$\lambda$ 必须在整条解析链之外最后选（否则 $C_{\rm e}$ 依赖 $\lambda$ 又把 §6 的图界拉回 §9）。

`[推测]` 为什么是这套参数形状，并非别的选择：`[推测]` 双对数结构 $\lambda\psi-\log(1-e^\phi|w|^2)$ 让 $\lambda$ 成为唯一"总放大旋钮"，把曲率负性彻底归约成对 $\phi$ 的导数界（$\phi$ 的图界由解析侧固定、不含 $\lambda$），于是解析与几何解耦；`[推测]` $k_j=Q^j$ 指数分离次数，是为了让低次"几乎常数、高次指数小"两侧都几何收敛（见第 7 节 `base:chart-estimates`），线性分离 $k_j=j$ 两个级数都不收敛；`[推测]` $L>5\log Q/d_3$ 的形状是"$-Ld_3N$ 线性下降压过 $5\log(k_N/\eta)=5N\log Q+\text{const}$ 线性上升"的直接解出。这些是文本反推，论文没逐条论证为什么这样选。

## 3 §2：两个输入与有界映射障碍（`sec:reduction`）

### 中心化坐标图（`base:charts`、`base:control`、`base:jets`）

这是解析与几何唯一的接口。论文 `02:13-36` 定义把 $0$ 送到 $z_0$ 的球自同构：

```tex
 T=U\circ T_r,\qquad
 T_r(\zeta)=\left(
 \frac{r+\zeta_1}{1+r\zeta_1},
 \frac{\sqrt{1-r^2}\,\zeta_2}{1+r\zeta_1}
 \right).
```

并给出恒等式（`02:28-36`）：

> The identity
> \[
>  1-|T_r(\zeta)|^2
>  =\frac{(1-r^2)(1-|\zeta|^2)}{|1+r\zeta_1|^2}
> \]
> shows that $T^*I$ has the same expression in $\zeta$ as $I$ has in $z$:
> the additional terms in $\psi\circ T$ are constant or pluriharmonic.
> In particular, this matrix is the identity at $0$ and has zero first
> derivatives there.

我一步一步推这句话的机制。$T_r$ 是沿第一坐标的一维 Möbius 变换把 $0$ 推到 $r$、第二坐标按 $\sqrt{1-r^2}$ 缩并（保持球不变）。取 $\psi\circ T_r=-\log(1-|T_r|^2)$，代入恒等式：

$$\psi\circ T_r=-\log(1-|\zeta|^2)-\log(1-r^2)+\log|1+r\zeta_1|^2.$$

第一项是 $\psi$ 本身在 $\zeta$ 里的表达式，第二项是常数（关于 $r$），第三项 $\log|1+r\zeta_1|^2=2\log|1+r\zeta_1|$ 是 pluriharmonic（全纯函数 $1+r\zeta_1$ 的实部乘 2）。$\partial\bar\partial$ 杀常数与 pluriharmonic，所以 $T^*I=\partial\bar\partial(\psi\circ T)$ 在 $\zeta$ 里的表达式与 $I$ 在 $z$ 里完全一致。原点处 $I(0)=\mathrm{Id}$、一阶导 $=0$。这两件免费事实是我 §8、§6 反复要用的"中心化归一"。

控制条件（`02:46-56`）：

```tex
\begin{equation}\label{base:control}
 c\,\mathrm{Id}\le h^T(0)\le C\,\mathrm{Id}
\end{equation}
\begin{equation}\label{base:jets}
 \left|\partial_k h^T_{i\bar j}(0)\right|
 +\left|\partial_{\bar\ell}h^T_{i\bar j}(0)\right|
 +\left|\partial_k\partial_{\bar\ell}h^T_{i\bar j}(0)\right|
 \le C
 \qquad(i,j,k,\ell\in\{1,2\}).
\end{equation}
```

机械理由：`base:control` 给 $h$ 的椭圆性上下界，`base:jets` 给 $h$ 的原点 1-2 阶导界（即 $\phi$ 的 3-4 阶）。$c$ 用在 §8 `curv:D-bounds`（`08:181-185`：$\|G^{-1}\|\le1/(\lambda+cx)$，$x^2\|G^{-1}\|\le x/c$）与 §9 `pinch:positivity`（$m_D\ge c(1+x)m_I$、$c^2a_I\le a_h$）；$C$ 用在 $h$ 特征值 $d\in[c,C]$ 以及 `pinch:algebra` 代入 $E\le(2-\beta)h$ 时的界。若去掉 `base:jets`，`prop curv:tensor` 的误差 `curv:component-errors` 里 $C_3,C_4$ 变 $\infty$，§9 的 $C_{\rm e}$ 崩。

`[推测]` 候选失败路线：`[推测]` 用固定（非中心化）坐标控制 $\phi$ 导数。失败机制：$I$ 在球边界爆炸，逐点 $C^k$ 界不可能一致，图心趋边界时 $\psi\circ(\text{id})$ 各阶导 $\sim1/(1-|z|)$；§8"把基方向按 $\lambda$ 归一"会残留 $1/(1-r)$ 因子，`curv:D-bounds` 的 $\lambda\ge d$ 前提失效。作者改用自同构拉回正是为了把这个爆炸吸收进 pluriharmonic 项。`[推测]` 用一般双全纯图（非球自同构）中心化：$T^*I$ 表达式不再与 $I$ 同形，原点一阶导不再为零，`curv:third-derivatives` 表里多出 $(2,1)$ 型非零项。

### 命题 `prop base:existence`（一个受控位势，`02:60-69`）

```tex
\begin{proposition}[A controlled potential]\label{base:existence}
There exist $\phi\in C^\infty(\B,\R)$ and a finite constant $C$ for
which \eqref{base:control} and \eqref{base:jets} hold with $c=1$, and
such that no $H\in\mathcal O(\B)$ and $C_H\in\R$ satisfy
\begin{equation}\label{base:no-minorant}
 \operatorname{Re}H(z)
 \le C_H+4\log\frac1{1-|z|}+\phi(z)
 \qquad(z\in\B).
\end{equation}
\end{proposition}
```

$c=1$ 不是自由选择，是被 $\phi\ge\psi$ 钉死：`lem base:convergence` 给 $h=\partial\bar\partial\phi=I+L\sum\partial\bar\partial U_{k_j}\ge I$（`06:43-44`），于是 $h\ge1\cdot I$，下界常数恰为 1。`[推测]` 若 $\phi$ 不显含 $\psi$，$h\ge cI$ 得另证，而 $c$ 会退化到一个小的解析常数。

系数 $4$ 是全篇最"必须吻合"的数字。`base:no-minorant` 的 $4\log\frac1{1-|z|}$ 必须与 `lem map:obstruction` 推出的 Jacobian 上界 `map:determinant-bound`（`02:151-154`）里的 $4\log\frac1{1-|z|}$ 逐项同系数，两边才能撞出矛盾。$4$ 的来源是 $2\times2$：行列式 $|d|\le6B^3\delta^{-2}e^{\phi/2}$，取对数再乘 $2$（因为 $\operatorname{Re}H=\log|d|^2$），$\delta^{-2}$ 出 $4\log(1/\delta)$。`[推测]` 若把边界容许写成 $3\log$ 或 $5\log$，$H=2\ell$ 造出来后不等号方向对不上，`base:no-minorant` 与 `map:determinant-bound` 不再矛盾，障碍断链。

`[推测]` 候选失败路线：`[推测]` 让容许只到 $(1-|z|)^{-4}$ 的代数阶但 $\phi$ 增长更快。失败机制：那需要更强的 Cauchy 估计给行列式更大上界，$4$ 会随之改变，而 $4$ 由"两列基导各贡献 $\delta^{-1}$"锁死，改不动。

### 命题 `prop metric:transfer`（Hartogs 度量迁移，`02:71-101`）

这是两个输入里的第二个：把 $\phi$ 的复 Hessian 界搬运成完备 Kähler 度量的双侧曲率界。域与位势（`metric:domain`、`metric:potential` 与实度量约定，`02:71-84`）：

```tex
M_\phi=\{(z,w)\in\B\times\C:t(z,w)<1\},
 \qquad t(z,w)=e^{\phi(z)}|w|^2.
\]
\begin{equation}\label{metric:potential}
 \mathcal K_\lambda=\lambda\psi-\log(1-t),\qquad
 \widehat g_\lambda=\partial\bar\partial\mathcal K_\lambda.
\end{equation}
Our real metric convention is
$g_\lambda=2\operatorname{Re}\widehat g_\lambda$: if a real vector $X$
has $(1,0)$ part $u$, then
$g_\lambda(X,X)=2\widehat g_\lambda(u,u)$.
```

命题 TeX 原文（`metric:transfer`，`02:86-101`）：

```tex
\begin{proposition}[Hartogs metric transfer]\label{metric:transfer}
Let $\phi\in C^\infty(\B,\R)$ satisfy \eqref{base:control} and
\eqref{base:jets} for fixed $0<c\le C<\infty$.  There is a finite
$\lambda_0=\lambda_0(c,C)>0$ such that, for every
$\lambda\ge\lambda_0$, the domain $M_\phi$ in
\eqref{metric:domain} is contractible and the tensor
$g_\lambda=2\operatorname{Re}\widehat g_\lambda$ defined by
\eqref{metric:potential} is a smooth geodesically complete K\"ahler
metric.  For this fixed $\lambda$ there are constants
$0<A_\lambda\le B_\lambda<\infty$ such that
\[
 -B_\lambda\le K_{g_\lambda}(\sigma)\le-A_\lambda<0
\]
for every point of $M_\phi$ and every real two-plane $\sigma$ in its
tangent space.
\end{proposition}
```

量化结构我拆开：输入是"$\phi$ 满足 `base:control`、`base:jets`，固定 $0<c\le C$"，输出是"存在 $\lambda_0(c,C)$，对每个 $\lambda\ge\lambda_0$ 有 $M_\phi$ 可缩 + 光滑测地完备 Kähler 度量 + 双侧界 $-B_\lambda\le K\le-A_\lambda$"。注意这里 $A_\lambda,B_\lambda$ 是对"这一个固定的 $\lambda$"陈述的，即 $\lambda$ 一旦选定，界就跟着定死；这跟 §9 反证里让 $\lambda\to\infty$ 的用法是两个方向（见第 10 节 `proof of metric:transfer` 那条区分）。

机制（本命题在论文里分两处证，我在此把分工写清）：可缩性 + 光滑正定 + 完备性 + exhaustion 全在 §7 `lem metric:complete`，它对**任意** $\lambda>0$ 成立、不要求 $\lambda$ 大也不要求 $h\ge cI$（只 $h\ge0$）；双侧曲率界在 §9 末尾的 `proof of metric:transfer`，先经 `lem pinch:positivity` 造 $\lambda_0(c,C,C_{\rm e})$、取 $\lambda\ge\lambda_0$，再分 $x\in[0,X]$（紧性）与 $x\to\infty$（rescaling 极限张量 $\widetilde R_x=-S_{h+V}+O_\lambda(x^{-1/2})$）两段钉出 $A_\lambda,B_\lambda$。Lean 端 `metric_transfer`（`HartogsTransfer.lean:22`）= `metricThreshold` 加四个成分引理拼接：`hartogs_contractible`、`hartogsMetric_isKahler`（`MetricCalculus.lean:805`）、`hartogsMetric_geodesicallyComplete`（`HartogsCompletenessSupport.lean:319`）、`hartogsMetric_uniform_pinching`（`HartogsPinching.lean:21`）。这五个符号我一并核过，正对应论文把"迁移"拆成"可缩 / Kähler / 完备 / pinching"四件事再合起来的写法。

机械理由：假设 $0<c\le C$ 是 $h$ 的椭圆性下界与 $C^2$ 上界这一对，缺一不可。$c$ 用在 §8 `curv:D-bounds`（`08:181-185`：$\|G^{-1}\|\le1/(\lambda+cx)$、$x^2\|G^{-1}\|\le x/c$）与 §9 `pinch:positivity`（$m_D\ge c(1+x)m_I$、$c^2a_I\le a_h$、$c_1\frac x{\lambda+x}$ 的下界）；$C$ 用在 $h$ 特征值 $d\in[c,C]$ 以及把 $\lambda_0$ 抬到 $\max(1,C)$ 以启用 `curv:D-bounds` 上界 $D\le(1+2x)h$。$\lambda_0=\lambda_0(c,C)$（命题只写两个参数，证明里 $C_{\rm e}$ 由 `base:jets` 的界 $C$ 给出、已并入）只在两 regime 反证时出现：第一 regime 要 $\lambda\gg(1+x)^2$，第二 regime 要 $x^{-1/2}$ 间隙压过 rescaled 误差，两个下界合成 $\lambda_0$。`metric:domain` 的 $t=e^{\phi}|w|^2$ 与 `metric:potential` 的 $-\log(1-t)$ 这对：$t<1$ 定义 Hartogs 域、$-\log(1-t)$ 提供边界对数发散给完备性，$\lambda\psi$ 提供可调的"总放大旋钮"，是 §9 用单一 $\lambda$ 把曲率压负的结构根据。

`[推测]` 候选失败路线：`[推测]` 若 $c=0$（半正定，并非正定）。失败机制：`lem pinch:positivity` 里 $m_D\ge c(1+x)m_I$ 与 $c^2a_I\le a_h$ 全失效，退化方向（$h$ 沿某方向趋于零）的实平面压不住，`curv:D-bounds` 的 $\|G^{-1}\|\le1/(\lambda+cx)$ 也退化到 $\|G^{-1}\|\le1/\lambda$、$x^2\|G^{-1}\|$ 不再 $\le x/c$，误差界崩。`[推测]` 若实度量约定用 $\operatorname{Re}\widehat g_\lambda$ ，并非 $2\operatorname{Re}\widehat g_\lambda$。失败机制：`lem curv:real-plane` 的分母 $2a_{\widehat g}$ 与 `curv:sectional`、盘模型常数 $-2$（`lem curv:real-plane` 末"取 $u_2=iu_1$ 给实曲率 $-2$"）全部差一个因子 2，§9 极限区间 $[-2,-1/2]$ 变 $[-4,-1]$，与单位盘的标准归一对不上，$A_\lambda,B_\lambda$ 的数值断链。`[推测]` 若 $\lambda\psi$ 换成固定 $\psi$（不带 $\lambda$）。失败机制：§9 就没有"总放大旋钮"，两 regime 里 $\lambda\to\infty$ 的反证与 $x\to\infty$ 的主部 $L_x$ 都无参数可推，pinching 无从逼出。

### 引理 `lem map:obstruction`（零截面上的 Jacobian，`02:111-161`）

这是唯一把解析侧的"无下界"接到几何结论的短论证，我把它的每一步常数都对上：

1. 设 $F=(F_1,F_2,F_3)$ 处处 Jacobian 非零、$|F_\ell|\le B$（取 $B\ge1$）。$d(z)=\det\frac{\partial(F_1,F_2,F_3)}{\partial(z_1,z_2,w)}(z,0)$ 在 $\B$ 上全纯无零。
2. 基 Cauchy（`02:129-136`）：固定 $z$，$\delta=1-|z|$，圆盘 $\{z+\zeta e_j:|\zeta|<\delta\}$ 含于基球。$F_\ell(\cdot,0)$ 在整个基球上有界全纯，故
   $|\partial_{z_j}F_\ell(z,0)|\le B\delta^{-1}$。
   论文特意加一句（`02:142-143`）：
   > In particular, the base estimate requires no uniform fiber radius near
   > $z$; it is taken entirely on the zero section.

   这句是我读整节时最在意的一处"防错"。基导估计只在零截面 $w=0$ 上取，沿基球里的圆盘做 Cauchy，完全不碰纤维半径。$e^{-\phi(z)/2}$ 随 $z$ 剧烈变，若想在纤维上取基 Cauchy 就要一致纤维半径下界，界会退化。
3. 纤维 Cauchy（`02:137-141`）：固定这个 $z$，纤维是半径 $e^{-\phi(z)/2}$ 的盘，
   $|\partial_wF_\ell(z,0)|\le B e^{\phi(z)/2}$。
   这一步允许纤维半径随 $z$ 变，因为 $\partial_w$ 的 Cauchy 只在这一条纤维内部做。
4. 六项展开：每项 = 两列基导 $\times$ 一列纤维导，
   $|d(z)|\le6B^3\delta^{-2}e^{\phi(z)/2}$，取对数平方：
   $\log|d(z)|^2\le2\log6+6\log B+4\log\frac1{1-|z|}+\phi(z)$。
   我核一下：$\log(6B^3\delta^{-2}e^{\phi/2})^2=2\log6+6\log B+4\log(1/\delta)+\phi$，逐项吻合；$6=\det$ 六项、$\delta^{-2}$ 来自两列基导。
5. $\B$ 单连通 + $d$ 无零 ⇒ 全纯对数 $\ell$ 存在（$d^{-1}\partial d$ 的原函数，`02:155-159`）。$H=2\ell$ 使 $\operatorname{Re}H=\log|d|^2$，与 `base:no-minorant`（同 $4\log$）矛盾。

Lean 逐条对齐 `Obstruction.lean`：`cauchy_direction`（:78）、`jacobian_base_bound`（:136，$B/(1-\|z\|)$）、`jacobian_fiber_bound`（:165，$B\exp(\phi z/2)$）、`det_bound_columns`（:173，$\|\text{det}\,M\|\le6abc$，显式 `Matrix.det_fin_three` 六项三角不等式）、`jacobian_det_bound`（:213）、`jacobian_log_bound`（:228，右端 `2*log 6 + 6*log B + 4*log(1/(1-‖z‖)) + φ z` 与论文完全一致）、`exists_holomorphic_log`（:50）、`map_obstruction`（:249，`let B' := max B 1` 处理 $B\ge1$）。$B\ge1$ 的机械理由：取 $\log B$ 需 $B>0$，$B\ge1$ 让 $\log B\ge0$、放缩干净。

`[推测]` 候选失败路线：`[推测]` 在整条纤维（，并非零截面）取基 Cauchy。失败机制：需一致纤维半径下界，而 $e^{-\phi(z)/2}$ 随 $z$ 变，界退化（论文 `02:142-143` 明说规避）。`[推测]` 允许 $d$ 在零截面某点为零。失败机制：全局对数断链，$H$ 造不出；但这恰好是"有界坐标"要排除的点，不能放松。`[推测]` 只在某点局部取对数。失败机制：`exists_holomorphic_log` 要求沿整个零截面 $d\ne0$（Lean `map_obstruction:255` 的 `hzero`），局部对数给不出全局 $H$，与 `base:no-minorant` 的全域版本撞不上。

### `proof of Theorem main:theorem`（`02:163-172`）

```tex
Choose $\phi$ from Proposition~\ref{base:existence}, and then choose
$\lambda$ as in Proposition~\ref{metric:transfer}. ... A biholomorphism to a
bounded domain would be such a map: the chain rule applied to its
holomorphic inverse makes its Jacobian invertible everywhere.
```

纯装配。最后一跳"反演链式法则 ⇒ Jacobian 处处可逆"把"有界坐标障碍"升级成"不双全等于有界区域"。Lean `main_of_controlledPotential`（`HartogsTransfer.lean:32`）先证 `1 ≤ C`（用 `hctl 0`，:35），再 `metric_transfer 1 C`，再 `hartogs_obstruction`（`HartogsTopologySupport.lean:148`）。`1 ≤ C` 这步必需，因为 `MetricTransfer` 签名要求 $0<c\le C$，而 `ControlledPotential` 只给 `ChartControl φ 1 C`。

零截面两处"免责声明"（`02:174-177`，我照抄，因为它划定我结论的确切强度）：

> The logarithm argument uses nonvanishing along the entire zero section.
> It gives no assertion that a bounded map's determinant vanishes
> identically.  Nor are all bounded holomorphic functions constant:
> $z_1$ and $z_2$ are nonconstant bounded holomorphic functions on $M_\phi$.

## 4 §3：分离齐次峰（`sec:peaks`）

这一节是解析引擎的燃料库，全部为下一节造正代表密度服务。

### 代表均值判据 `lem peaks:mean-criterion`（`03:17-36`）

```tex
\begin{lemma}[Representing-mean criterion]\label{peaks:mean-criterion}
Let $u$ be a continuous real function on $\mathbb B$.  Suppose there
are radii $0<r_N<1$ and representing probabilities $\mu_N$ on $S$
such that
\[
 \int_S u(r_N\xi)\,d\mu_N(\xi)\longrightarrow-\infty.
\]
Then no holomorphic function $H$ on $\mathbb B$ and constant $C_H$
satisfy $\operatorname{Re}H\le C_H+u$ on $\mathbb B$.
\end{lemma}
```

代表概率的定义在它之前（`03:10-15`）：$\mu$ represents holomorphic evaluation at zero 若 $\int_S p(\xi)d\mu=p(0)$ 对每个全纯多项式 $p$。证明机制（`03:28-36`）：固定 $r_N<1$，$H$ 的 Taylor 多项式在 $r_NS$ 一致收敛，代表恒等式从多项式扩到 $H$：$\int_S\operatorname{Re}H(r_N\xi)d\mu_N=\operatorname{Re}H(0)$（与 $N$ 无关的常数）。代入假设不等式并积分，$\operatorname{Re}H(0)\le C_H+\int u\,d\mu_N\to-\infty$，矛盾。

这是整个解析构造的引擎：$u$ 只需连续，不需 psh；起作用的是"$\mu_N$ 代表全纯均值"这一条。后面 §3-§6 一切工作只为造出满足该引理假设的 $u,\mu_N,r_N$，并把 $u$ 取成 $\phi+4\log(1/(1-|z|))$（`03:38-39`）。

`[推测]` 失败路线：`[推测]` $\mu_N$ 只是概率而不代表 $0$。失败机制：$\int\operatorname{Re}H(r_N\xi)d\mu_N$ 换不成 $\operatorname{Re}H(0)$，$\le$ 链断。这正是 §4 要死磕"代表"二字的原因。`[推测]` $u$ 只沿部分方向负。失败机制：$\int u\,d\mu_N$ 下不到 $-\infty$；§5 因此要"每个 patch 都负、总和 $\ge N\cdot(-d)$"保证各向发散。

### 射影度量与球测度（`03:54-80`）

射影距离 $d([\xi],[p])=\sqrt{1-|\langle\xi,p\rangle|^2}$。论文 `03:60-64` 论证它是度量：等于两直线 rank-one 正交投影之间的算子范数距离（差迹零、特征值 $\pm d$），算子范数三角不等式给出 $d$ 的三角不等式。球测度（`peaks:sphere-measure`，`03:75-78`）：酉坐标 $\xi=(e^{i\theta}\cos v,e^{i\gamma}\sin v)$，体积元 $\cos v\sin v\,dv\,d\theta\,d\gamma$，换元 $u=\cos^2v$ 得 $d\sigma=du\,\frac{d\theta}{2\pi}\frac{d\gamma}{2\pi}$。推论：射影 cap $d(\xi,p)<s$ 测度 $s^2$（$0\le s\le1$）。

机械理由：cap 测度 $s^2$（不是 $s$ 或 $s^3$）是后面 `peaks:count` 计数与局部计数 $C(1+u)^2$ 的来源；`peaks:patch-measure` 也从它推。$|\langle\xi,p\rangle|^2=1-d^2$ 让峰 $|\langle\xi,p\rangle|^k=(1-d^2)^{k/2}\le e^{-kd^2/2}$（`03:129-132`）直接给高斯尾。`[推测]` 用 chordal/球面度量只会多算子范数等价常数，且高斯尾要重推。

### 峰多项式与 `lem peaks:bounds`（`03:82-147`）

取 $D_0\ge1$、整数 $k\ge D_0^2$，选 $\CP^1$ 中极大 $D_0/\sqrt k$-分离直线集，每条取一单位代表，集记 $\mathcal P_k$，$N_k=|\mathcal P_k|$。峰（`peaks:polynomial`）：$P_k(z)=\sum_{p\in\mathcal P_k}\langle z,p\rangle^k$。结论（`peaks:count`、`peaks:gaussian`、`peaks:global`）：

$$\frac{k}{D_0^2}\le N_k\le\frac{4k}{D_0^2},\qquad \sum_{\sqrt kd(\xi,p)\ge u}|\langle\xi,p\rangle|^k\le Ce^{-cu^2},\qquad |P_k(z)|\le C|z|^k,\ \int_S|P_k|d\sigma\le\frac{2N_k}{k+2}.$$

机制逐步：
1. 计数：$\rho=D_0/\sqrt k\le1$。极大 ⇒ 半径 $\rho$ cap 覆盖 $S$ ⇒ $1\le N_k\rho^2$；分离 ⇒ 半径 $\rho/2$ cap 内点互斥 ⇒ $N_k(\rho/2)^2\le1$。
2. 局部计数（常数不依赖 $D_0$，`03:119-126`）：距固定线 $\le u/\sqrt k$ 的中心放半径 $1/(3\sqrt k)$ cap，内点互斥含于半径 $(u+1/3)/\sqrt k$ cap ⇒ 个数 $\le9(u+1/3)^2$；半径超 1 时个数 $\le9k\le9(u+1/3)^2$。一律 $\le C(1+u)^2$。
3. 高斯尾：环带 $n\le\sqrt kd<n+1$ 贡献 $\le C(n+2)^2e^{-n^2/2}$（局部计数 × 高斯），从 $n=\lfloor u\rfloor$ 求和，多项式因子被更弱高斯吸收，$0\le u\le2$ 被常数吸收。
4. 全局界 $|P_k|\le C|z|^k$：$u=0$ 给 $S$ 上界，齐次性扩到全 $\C^2$（含球外）。
5. $L^1$ 界：$\int_S|\langle\xi,p\rangle|^kd\sigma=\int_0^1u^{k/2}du=\frac2{k+2}$，对 $N_k$ 项三角不等式。

机械理由："$C,c$ 与 $D_0$ 无关"是 §3 末（`03:276-277`）"enlarging $D_0$ later improves the single-peak approximation without altering the profiles"的前提；$k\ge D_0^2$（$\rho\le1$）用在覆盖论证（cap 测度公式只在半径 $\le1$ 成立）；$L^1$ 界 $\frac{2N_k}{k+2}\sim\frac{2}{D_0^2}$ 用在 §5 off-patch 误差 $C_{\rm off}\epsilon^2N_k/k$ 被 $\Delta/(2D_0^2)$ 吸收（靠 $N_k/k\le4/D_0^2$）。

`[推测]` 失败路线：`[推测]` 非齐次多项式峰。失败机制：全局界 $|P_k(z)|\le C|z|^k$（含球外）不再成立，§6 `base:chart-estimates` 低次区"$A_k$ 可越界估计"（`06:152-164`）依赖 $P_k$ 是 entire 齐次，会崩。`[推测]` 稠密网格，并非极大分离。失败机制：$N_k$ 失控（无 $D_0^{-2}$ 因子），$L^1$ 界失效。

### `lem peaks:patches`（patch 估计，`03:160-202`）

patch 定义 $y=-k\log|\xi_1|$、$\mathcal U_{k,p}=\{0\le y<R_0\}$。结论：$D_0>\max\{1,2\sqrt{2R_0}\}$ 且 $k\ge\max\{D_0^2,2R_0\}$ 时 patch 互斥；patch 测度 $d\sigma=\frac2ke^{-2y/k}dy\frac{d\theta}{2\pi}\frac{d\gamma}{2\pi}$（`peaks:patch-measure`）；单峰近似 $|P_k(\xi)-e^{-y}e^{ik\theta}|\le Ce^{-c(D_0-\sqrt{2R_0})^2}$（`peaks:single-peak`）；off-patch $|P_k|\le Ce^{-cR_0}$（`peaks:off-patch`）。$C,c$ 与 $R_0,D_0,k$ 无关。

机制：patch 射影半径 $\le\sqrt{2R_0/k}$，中心分离 $D_0/\sqrt k$，$D_0>2\sqrt{2R_0}$ 使两半径和 $<D_0/\sqrt k$ ⇒ 互斥。单峰近似：$\xi\in\mathcal U_{k,p}$、$p'\ne p$ 时 $\sqrt kd(\xi,p')\ge D_0-\sqrt{2R_0}$（三角不等式），其余峰按 `peaks:gaussian`（取该 $u$）被 $Ce^{-c(D_0-\sqrt{2R_0})^2}$ 控；本峰恰 $e^{-y}e^{ik\theta}$。off-patch：每中心 $kd^2\ge k(1-e^{-2R_0/k})\ge R_0$（用 $k\ge2R_0$、$1-e^{-v}\ge v/2$），再套高斯尾。

机械理由：$e^{-c(D_0-\sqrt{2R_0})^2}$ 是 §5 `tests:patch-error` 的第一项误差，靠扩 $D_0$ 压小；$Ce^{-cR_0}$ 是 `peaks:profiles` 里"$aP_k\le1/2$ off patches"的来源。$D_0>\max\{1,2\sqrt{2R_0}\}$ 同时保证互斥与 $D_0-\sqrt{2R_0}>0$。

### `lem peaks:profiles`（径向轮廓，`03:208-261`）

这是全篇最"手工"的一条，$f,b,R_0$ 的所有性质在此一次性造好。

```tex
\begin{lemma}[Radial profiles]\label{peaks:profiles}
Fix $1<a<2$ and put $\alpha=\log a$.  One can choose $0<s_1<1$,
smooth real functions $f,b$ on $[0,\infty)$, and $R_0>0$ such that
\begin{equation}\label{peaks:profile-negativity}
 \alpha^2-2s_1(\cosh\alpha-1)<0,
\end{equation}
\begin{equation}\label{peaks:profile-identities}
 \|f\|_\infty<1,\quad f=-s_1\ \text{on }[0,\alpha],\quad
 \int_0^\infty e^{-y}f(y)\,dy=0,\quad
 b'-b=f,\quad b(0)=0.
\end{equation}
Both functions vanish on a neighborhood of $[R_0,\infty)$.
Moreover, $R_0$ can be chosen so that $|aP_k|\le1/2$ off the
patches whenever the hypotheses of Lemma~\ref{peaks:patches} hold.
\end{lemma}
```

构造顺序（我逐步重推，因为每步都产一个后续要用的常数）：
1. 严格不等式 $2(\cosh\alpha-1)>\alpha^2$（$\cosh$ 级数 $\cosh\alpha-1=\alpha^2/2+\alpha^4/24+\cdots>\alpha^2/2$）给窗口 $\frac{\alpha^2}{2(\cosh\alpha-1)}<s_1<1$。$a<2$ 保证 $s_1(1-e^{-\alpha})<e^{-\alpha}$。
2. 小 $\delta$、截断 $\chi$（$[0,\alpha]$ 上为 1、$y\ge\alpha+\delta$ 为 0）。$\delta$ 足够小使 $N=s_1\int_0^\infty e^{-y}\chi<e^{-(\alpha+2\delta)}$。
3. 光滑 $\nu$ 支撑严格在 $\alpha+2\delta$ 之后、$0\le\nu\le1$、逼近足够长区间指标使 $P=\int e^{-y}\nu>N$。
4. $f=-s_1\chi+(N/P)\nu$：plateau 满足；加权积分 $-s_1\int e^{-y}\chi+(N/P)\int e^{-y}\nu=-N+N=0$；支撑不交 ⇒ $\|f\|_\infty\le\max\{s_1,N/P\}<1$。
5. $b(y)=e^y\int_0^y e^{-v}f(v)dv$：验 $b'-b=f$、$b(0)=0$；越过 $f$ 支撑后加权积分为零 ⇒ $b$ 紧支；近零 $b=-s_1(e^y-1)$ 在半直线边界光滑（`03:256-258`："Smoothness here does not require extending $f$ by zero to negative arguments"）。
6. $R_0$ 大于两支撑，再扩至 $aCe^{-cR_0}\le1/2$。

机械理由：`peaks:profile-negativity` 这个量正是 §5 `tests:model-sign` 的 $I_0(1)=-\Delta$（负平均种子），$\Delta=2s_1(\cosh\alpha-1)-\alpha^2>0$ 给 $d_2$；加权抵消 $\int e^{-y}f=0$ 让 §4 `density:moments` 的校正项对全纯矩精确归零；$f=-s_1$ on $[0,\alpha]$ 用在 `tests:model-sign` 末步提出 $-s_1$；$\|f\|_\infty<1$ 保证 $c_0=\frac{1-\|f\|_\infty}{4}>0$。§3 末（`03:263-272`）还预告了轮廓与模型的耦合：plateau $0\le y\le\alpha$ 恰是 $ae^{-y}$ 模 $\ge1$ 的区域，$\log|1-ae^{-y}e^{it'}|^2$ 对 $(1+f\cos t')$ 的积分等于 $\alpha^2-2s_1(\cosh\alpha-1)$。

`[推测]` 失败路线：`[推测]` $\int e^{-y}f\ne0$。失败机制：$b$ 在 $f$ 支撑外非零（$b=e^y\cdot\text{const}\ne0$）失紧支，§4 矩归零端点值 $b(R_0)$ 不为零，代表性质被破坏。`[推测]` $s_1$ 取到使 $\alpha^2-2s_1(\cosh\alpha-1)>0$。失败机制：$I_0(1)>0$，对数平均不负，`prop tests:negative` 崩。`[推测]` $a\ge2$。失败机制：$\alpha\ge\log2$，$s_1(1-e^{-\alpha})<e^{-\alpha}$ 可能选不到足够小 $N$；论文只用 $a<2$ 这一处（`03:229-230`）。

## 5 §4：正代表密度（`sec:densities`）

### 次数选择与递归（`04-construction:10-57`）

固定轮廓后 $c_0=\frac{1-\|f\|_\infty}{4}>0$；固定 $D_0>\max\{1,2\sqrt{2R_0}\}$；整数 $Q\ge2$ 足够大使每个次数过 patch 阈值；$k_j=Q^j$、$\ell_0=0$、$\ell_j=\sum_{l\le j}k_l$。于是 $\ell_{j-1}<k_j$ 且 $\ell_j<2k_j$（因为 $Q\ge2$ 时 $\ell_{j-1}=Q^{j-1}+\cdots<\frac{Q^j}{Q-1}\le Q^j=k_j$）。递归：

```tex
 A_{j,p}(\xi)
 &=e^{2y/k}\operatorname{Re}\left[
     e^{ik\theta}\left(f(y)S_p(\theta)
               -b(y)\frac{S_p'(\theta)}{ik}\right)\right],\\
 W_j&=W_{j-1}+\sum_{p\in\mathcal P_k}A_{j,p},
```

$S_p(\theta)=W_{j-1}(e^{i\theta}p)$，校正 patch 外零延拓。

设计动机（`04-construction:30-44`）我逐字复述，因为那第二项 $-bS_p'/(ik)$ 的存在全在这里：相位模式 $e^{is\theta}$（$|s|\le\ell_{j-1}$）乘 $e^{ik\theta}$ 移到频率 $m=k+s>0$，其共轭与全纯单项式 $\xi_1^m=e^{-my/k}e^{im\theta}$ 配对；消去表面因子 $e^{-2y/k}$ 后，若系数为 $b'-\frac mk b$ 则该径向矩归零，因为 $e^{-my/k}(b'-\frac mk b)=\frac d{dy}(e^{-my/k}b)$ 且 $b(0)=b(R_0)=0$。恒等式 $f=b'-b$ 于是把该模式系数规定为 $f-\frac sk b$，对所有 $s$ 求和即得递归（$\sum_s\widehat S_p(s)(f-\frac sk b)=fS_p-\frac bk S_p'\cdot\frac1{i}\cdot i$，整理出 $-bS_p'/(ik)$）。

机械理由：$\ell_{j-1}<k_j$（$m=k+s>0$）保证配对频率全正，`density:moments` 里 $l=n=0$ 情形"$\theta$ 平均给零"成立；$\ell_j<2k_j$ 用在 `lem tests:later` 算频率下界 $(Q-2)k_{\nu-1}$；$c_0>0$ 用在 §4 末 $K_*>2C_2/c_0$ 与 $Q^{-1/2}\le c_0/2$。

`[推测]` 失败路线：`[推测]` $k_j$ 任意递增。失败机制：$\ell_{j-1}<k_j$ 未必成立，模式配对落到非正频率，矩归零断。`[推测]` 删 $-bS_p'/(ik)$。失败机制：只有 $s=0$ 模式归零，代表性质仅剩常数多项式，`density:moments` 的"$\int p\,d\mu=p(0)$ 对所有 $p$"崩。`[推测]` $s\ne0$ 的相位漂移无处安放，正是这一项专为消它。

### `lem density:smooth`（校正的光滑性，`04-construction:59-82`）

归纳：$W_0=1$ 光滑；patch 中心圆用光滑坐标 $(\theta,\zeta)\mapsto(e^{i\theta}\sqrt{1-|\zeta|^2},\zeta)$，$y=-\frac k2\log(1-|\zeta|^2)$，各项在此坐标（含 $\zeta=0$）光滑且不依赖横向极角 $\gamma$（后者在 $\zeta=0$ 奇异）；外边界 $f,b$ 在 $R_0$ 邻域为零 ⇒ 校正在 patch 边界邻域恒零 ⇒ 零延拓光滑。机械理由："不依赖 $\gamma$"是中心圆光滑的关键，否则 $\gamma$ 在 $\zeta=0$ 无定义。`[推测]` 若 $f,b$ 只紧支到 $R_0$ ，并非邻域恒零，零延拓只 $C^0$，§5 求导（Fourier 系数 $B_\epsilon$ 界需 $V''$ 有界）缺光滑。

### `thm density:main`（一致代表密度，`04-construction:98-124`）

存在 $K_*>0$（只依赖 $f,b,R_0$），对每个固定 $D_0>\max\{1,2\sqrt{2R_0}\}$ 存在整数阈值 $Q_0$，使 $Q\ge Q_0$ 时递归对所有 $j\ge1$ 满足：(1) $W_j$ 光滑严格正、$W_jd\sigma$ 代表全纯零点求值（故概率）；(2) 全局相位旋转下频率限于 $[-\ell_j,\ell_j]$、每轨道均值恰 1；(3) 每点

$$c_0W_{j-1}\le W_j\le2W_{j-1},\qquad |ZW_j|\le K_*\sqrt{k_j}W_j,\quad |TW_j|\le K_*k_jW_j.$$

$Q_0$ 可再放大以给次数任意固定下阈。

机制（分两部分）：`lem density:moments`（精确矩与频率，先于正性成立）+ estimates 的归纳。归纳核心：设到 $j-1$ 成立，则 `density:central-derivatives`（$\frac{|S_p'|}{kS_p}\le\frac{K_*}Q$、$\frac{|S_p''|}{k^2S_p}\le\frac{C_1}{Q^2}$）+ 水平比较 `density:central-comparison`（比值夹在 $e^{\pm K_*D_R/\sqrt Q}$）建立 `density:normalized-patch` 归一假设，得 $|A_{j,p}|\le(1-2c_0)W_{j-1}$；每点至多一 patch 非零（来自互斥 $D_0>2\sqrt{2R_0}$）⇒ $2c_0W_{j-1}\le W_j\le(2-2c_0)W_{j-1}$；导数 $|YW_j|\le(C_2+K_*/\sqrt Q)W_{j-1}\le K_*c_0W_{j-1}\le K_*W_j$（用 $K_*>2C_2/c_0$）。

选择顺序（`04-estimates:207-239`，论文明示）：$C_2$（`density:normalized-patch`，只依赖固定 patch 数据 $R_0,D_R,F,B,F_1,B_1$）→ $K_*>2C_2/c_0$ → $C_1$（`density:central-derivatives`，依赖 $K_*,c_0,\chi$）→ $Q_0$。`density:Q-conditions`：

$$Q\ge2,\quad H(Q)\le2,\quad K_*/Q\le1,\quad C_1/Q^2\le1,\quad Q^{-1/2}\le c_0/2,\quad H(Q)(F+BK_*/Q)\le1-2c_0.$$

$H(Q)=\exp(K_*D_R/\sqrt Q+2R_0/Q)\to1$，$F=\|f\|_\infty=1-4c_0<1-2c_0$，$Q$ 充分大时全相容。

`[推测]` 失败路线：`[推测]` 先定 $Q$ 再定 $K_*$。失败机制：$K_*$ 进 $H(Q)$、$H(Q)$ 进正性界、$Q$ 进 $C_1$，循环依赖，$Q_0$ 不存在。论文用 $C_2\to K_*\to C_1\to Q_0$ 破环。`[推测]` 无 $\ell_{j-1}<k_j$。失败机制：`density:moments` 的"频率不含 0"失效，轨道均值 $\ne1$，$W_jd\sigma$ 不再是概率。`[推测]` $\|f\|_\infty\to1$（$c_0\to0$）。失败机制：$1-2c_0$ 与 $H(Q)(F+BK_*/Q)$ 间隙消失，正性归纳断。

### `lem density:moments`（矩保持，`04-construction:133-206`）

关键等式（`density:representing`）：$\int_S p(\xi)W_j(\xi)d\sigma=p(0)$ 对每个全纯多项式 $p$，且每个单独校正对所有此类多项式（含常数）积分为零。

精确矩计算（归纳）：$S_p(\theta)=\sum_{|s|\le\ell_{j-1}}\widehat S_p(s)e^{is\theta}$、$\widehat S_p(0)=1$。因 $b'-b=f$，`density:recursion` 括号内 $=\sum_s\widehat S_p(s)(b'-\frac{k+s}k b)e^{is\theta}$，全 $m=k+s>0$。校正频率集 `density:bandwidth` $=[k-\ell_{j-1},k+\ell_{j-1}]\cup[-k-\ell_{j-1},-k+\ell_{j-1}]$，不含 0 ⇒ 带宽 $\le\ell_j$、轨道均值仍 1。矩用适配单项式 $\xi_1^n\xi_2^l$：$l>0$ 由 $\gamma$ 平均给零；$l=n=0$ 由 $\theta$ 平均（$m>0$）给零；$l=0,n\ge1$ 时仅 $k+s=n$ 的共轭频率幸存：

$$\int_{\mathcal U_{k,p}}\xi_1^nA_{j,p}d\sigma=\frac{\overline{\widehat S_p(n-k)}}k\int_0^{R_0}e^{-ny/k}(b'-\frac nk b)dy=\frac{\overline{\widehat S_p(n-k)}}k\big[e^{-ny/k}b(y)\big]_0^{R_0}=0.$$

表面因子 $2/k$ 与实部 $1/2$ 合成 $1/k$；两端 $b(0)=b(R_0)=0$。酉坐标变换保全纯多项式 ⇒ 原坐标每项归零。

机械理由：$b(R_0)=0$（加权抵消 + 紧支）与 $b(0)=0$ 是矩归零的唯一支点，分部积分全坍成两端点值；$\widehat S_p(0)=1$ 保证 $n=k$ 时系数正确但仍归零；论证对每个 $n$ 成立、无次数截断（`04-construction:201`）。`[推测]` 若校不含 $-bS_p'/(ik)$，$m\ne k$ 模式的 $f$ 系数不是全导数，矩不为零，代表崩。

### `lem density:orbit-growth` 与 `lem density:weighted-derivative`

轨道增长（`04-estimates:10-53`）：设 $Q\ge2$、$k_j=Q^j$、$W_0,\dots,W_n$ 正且满足 $c_0W_{j-1}\le W_j\le2W_{j-1}$、$|TW_j|\le K_*k_jW_j$。取 $R=\frac2{c_0}$、$\beta=\log_2R$，则 $S_p(\theta+u)\le e^{K_*}R(1+k_n|u|)^\beta S_p(\theta)$，$|u|\le\pi$，常数与 $Q,n,p$ 无关。机制：取最大 $l\le n$ 使 $k_l|u|\le1$（无则 $l=0$）；逐步比较给比值 $\le R^{n-l}\cdot\frac{W_l(\theta+u)}{W_l(\theta)}$；$l\ge1$ 对数微分 $+|TW_l|\le K_*k_l|u|$ 使末比 $\le e^{K_*}$，$l=0$ 为 1；$l<n$ 时最大化性给 $k_n|u|>Q^{n-l-1}\ge2^{n-l-1}$ ⇒ $R^{n-l}\le R(1+k_n|u|)^\beta$。机械理由：$\beta=\log_2R$ 精确匹配 $R=2^\beta$；"$R,\beta$ 与 $Q,n,p$ 无关"是要喂给 `density:weighted-derivative` 的 $A,\beta$。`[推测]` 若 $Q<2$，$k_n|u|>2^{n-l-1}$ 不成立，幂律界证不出，只能用随 stage 发散的指数 $n-l$。

加权导数界（`04-estimates:55-117`）：$A\ge1,\beta\ge0$，$q\ge1$，$s$ 是次数 $\le2q$ 的正三角多项式、满足 $s(\theta+u)\le A(1+q|u|)^\beta s(\theta)$，则 $|s''(\theta)|\le C(A,\beta)q^2s(\theta)$。机制：$\chi$ 等于 1 于 $[-2,2]$、紧支，$K_q(u)=\sum_h\chi(h/q)e^{ihu}$；频率假设 ⇒ $s''=s*K_q''$；核衰减 `density:kernel-decay` $|K_q''(u)|\le C_Nq^3(1+q|u|)^{-N}$（系数 $a_h=q^2g(h/q)$，$O(q)$ 个各 $O(q^2)$ ⇒ 直和 $\le Cq^3$；$N$ 阶差分 $\le C_Nq^{2-N}$、$O_N(q)$ 个 ⇒ 绝对和 $\le C_Nq^{3-N}$；乘 $(1-e^{iu})^N$ 且 $|1-e^{iu}|\ge2|u|/\pi$ ⇒ $|K_q''|\le C_Nq^{3-N}|u|^{-N}$，两者合并）；取 $N>\beta+1$ 卷积得 $q^3\to q^2$。机械理由：$s$ 正性用在把 $s(\theta-u)$ 换成 $A(1+q|u|)^\beta s(\theta)$ 时保留 $s(\theta)$ 提出；次数 $\le2q$ 保证频带截断；$N>\beta+1$ 保证 $\int(1+q|u|)^{\beta-N}du$ 收敛并给净余 $q^{-1}$。`[推测]` 只用 $|s|$ 界无正性：$\int|K_q''|$ 发散，得不出 $q^2$ 缩放，$S_p''$ 界退化，这是为何必须先有 `density:orbit-growth` 的正函数乘性增长。

### 归一化校正估计 `lem density:normalized-patch`（`04-estimates:168-205`）

$F=\|f\|_\infty,B=\|b\|_\infty,F_1=\|f'\|_\infty,B_1=\|b'\|_\infty$。patch 上设 $W_{j-1}>0,S_p>0$，$\frac{e^{2y/k}S_p}{W_{j-1}}\le2$、$r_1=\frac{|S_p'|}{kS_p}\le1$、$r_2=\frac{|S_p''|}{k^2S_p}\le1$。则 $|YA_{j,p}|\le C_2W_{j-1}$（$Y=Z/\sqrt k$ 或 $T/k$），$C_2=2D_R[4(F+B)+F_1+B_1]$。$C_2$ 与 $K_*,Q,j,p$ 无关。机制：对递归求 $Y$ 导取绝对值 $|YA_{j,p}|\le D_Re^{2y/k}S_p[(1+2/k)(F+Br_1)+F_1+B_1r_1+Fr_1+Br_2]$。$D_R$ 直接验证（`04-estimates:147-165`）：$|Zc|\le\sqrt{1-|c|^2}\le\sqrt{2R_0/k}$、$|c|\ge e^{-R_0/k}$（$c=\langle\xi,p\rangle$），微分 $y=-k\log|c|$、$\theta=\arg c$；径向弧 $u\mapsto(e^{i\theta}\cos u,e^{i\gamma}\sin u)$ 单位速、复水平，长 $\le D_R/\sqrt k$。机械理由：$C_2$ 只依赖固定 patch 数据，是 $C_2\to K_*$ 能启动归纳的根因（若 $C_2$ 含 $K_*$ 则循环）。`[推测]` 若 $\frac{e^{2y/k}S_p}{W_{j-1}}$ 无上界（$W_{j-1}$ 任意小），$C_2W_{j-1}$ 界失去，正性断；这由 `density:central-comparison` 用 $H(Q)\le2$ 保证。

Lean：`density`（`BaseDensityDefinitions.lean:38`）用匹配 `| 0 => fun _ => 1`、`| j+1 => ... + ∑ p ∈ P (Q^(j+1)), densityCorrection`；`densityCorrection`（:35）用 `if Real.exp (-R/k) < ‖bracket z p‖ then ... else 0` 编码 patch 内外零延拓（$y<R$ 等价 $|\xi_1|>e^{-R/k}$）。`uniform_representing_densities`（`BaseDensityTheorem.lean:20`）结论打包成 `DensityStage`（`BaseDensityInduction.lean:20`）的 `positive/horizontal/phase/step` 四字段；归纳 `density_induction`（:26）前提 `hH/hsmall/hphase/hsecond/hderH/hderT` 即 `density:Q-conditions`。`Represents`（`BaseMeans.lean:25`）用 `MvPolynomial` 表达"对每个多项式 $\int p\,d\mu=p(0)$"。

## 6 §5：正则化对数测试（`sec:tests`）

### 正则化对数（`05:24-46`）

```tex
 F_\epsilon(v)=
 \log\frac{|1-av|^2+\epsilon^2}{1+\epsilon^2},
 \qquad U_k(z)=F_\epsilon(P_k(z)).
```

$F_\epsilon(0)=U_k(0)=0$（$P_k(0)=0$ 因 $k\ge1$ 齐次）。$U_k$ 光滑 psh，因 `(tests:hessian)`：

$$(U_k)_{i\bar j}=\frac{a^2\epsilon^2}{(|1-aP_k|^2+\epsilon^2)^2}(P_k)_i\overline{(P_k)_j}.$$

这是对 $\log(|1-aP_k|^2+\epsilon^2)$ 求 $\partial\bar\partial$ 的链式法则：$\partial\bar\partial\log(g\bar g+\epsilon^2)$ 给出秩一半正定 $\propto(\partial P_k)_i\overline{(\partial P_k)_j}$，正因子 $\frac{a^2\epsilon^2}{(\cdot)^2}$。Lipschitz `(tests:lipschitz)`：$|F_\epsilon(v)|\le C_{\epsilon,A}|v|$（$\epsilon$ 固定、$|v|\le A$ 时中值定理，$F_\epsilon(0)=0$）。

机械理由：正则化 $\epsilon^2$ 让 $\log$ 不再 $-\infty$，使 $U_k$ 光滑可求导（§6 逐项求导、`base:chart-estimates` 4 阶导都要光滑）；$U_k(0)=0$ 保证 $\phi(0)=0$；`tests:hessian` 半正定用在 `base:convergence` 的 $h\ge I$。`[推测]` 若 $\epsilon=0$，$U_k$ 在 $aP_k=1$ 处奇，不能作光滑位势，`tests:averaging` 里 $V''$ 无界，`lem tests:later` 的 Fourier 尾界 $B_\epsilon/m^2$ 失效。

### `lem tests:averaging`（精确平均，`05:48-84`）

```tex
 \int_S U_k(r\xi)W_j(\xi)\,d\sigma
 =\int_S U_k(r\xi)\,d\sigma
 +\sum_p\int_{\mathcal U_{k,p}}U_k(r\xi)e^{2y/k}f(y)\cos(k\theta)\,d\sigma.
```

机制：全局相位 $\xi\mapsto e^{i\omega}\xi$ 下 $P_k(e^{i\omega}\xi)=e^{ik\omega}P_k(\xi)$（齐次）⇒ $U_k(r\xi)$ 只含 $k\Z$ 频率。$W_{j-1}$ 频带 $\ell_{j-1}<k$、轨道常数系数 1 ⇒ $U_kW_{j-1}$ 相位平均只剩 $\int U_kd\sigma$（第一项）。patch 内校正频率 $\pm(k+s)$，$|s|\le\ell_{j-1}<k$，与 $k\Z$ 配对仅 $s=0$ 幸存，$\widehat S_p(0)=1$、$S_p'$ 零常系数 ⇒ 幸存部分恰 $e^{2y/k}f(y)\cos(k\theta)$（第二项）。

机械理由：这条把 $\int U_kW_j$ 化简成"背景 $\int U_kd\sigma$ + patch 内模型积分 $f(y)\cos(k\theta)$"，后者正是 `prop tests:negative` 的 $I_\epsilon(\rho)$ 形状。`[推测]` 若 $k\le\ell_{j-1}$（不严格分离），多个 $s$ 模式配对 $k\Z$，幸存项不再是纯 $f\cos(k\theta)$，模型积分对不上。

### `prop tests:negative`（单尺度负平均，`05:91-213`）

存在 $\epsilon,\eta\in(0,1/2),D_*$（只依赖固定轮廓），对每个 $D_0\ge D_*$ 存在 $k_*,d_2>0$，使对满足密度定理且 $Q\ge k_*$ 的整数 $Q$：

$$\int_SU_{k_j}(r\xi)W_j(\xi)d\sigma\le-d_2\qquad(j\ge1,\ 1-\eta\le r^{k_j}\le1),$$

$k_*,d_2$ 可依赖 $D_0$，但与 $j$、与进一步增大 $Q$ 无关。

机制（模型积分算尽）：$\Delta=2s_1(\cosh\alpha-1)-\alpha^2>0$。模型 `tests:model`：
$$I_\epsilon(\rho)=\int_0^{R_0}\int_0^{2\pi}\log\frac{|1-a\rho e^{-y}e^{it'}|^2+\epsilon^2}{1+\epsilon^2}(1+f(y)\cos t')\frac{dt'}{2\pi}dy.$$
$\rho=1$：未正则对数唯一奇点 $(y,t')=(\alpha,0)$，$|1-e^{\alpha-y+it'}|^2\asymp(y-\alpha)^2+(t')^2$ 局部可积；正则对数负部 $\le$ 未正则负部 $+\log2$ ⇒ 控制收敛。圆周矩：$q<1$ 时 $\log|1-qe^{it'}|^2$ 均值 0、余弦矩 $-q$；$q>1$ 时提 $q^2$ 得均值 $2\log q$、余弦矩 $-q^{-1}$。用抵消 $\int e^{-y}f=0$：
$$I_0(1)=\alpha^2-\int_0^\alpha f e^{y-\alpha}-\int_\alpha^{R_0}f e^{\alpha-y}=\alpha^2+\int_0^\alpha f(e^{\alpha-y}-e^{-(\alpha-y)})=\alpha^2-2s_1(\cosh\alpha-1)=-\Delta.$$
末步用 $f=-s_1$ on $[0,\alpha]$。比较 `tests:averaging-identity`：off-patch 用 $|aP_k|\le1/2$、$|F_\epsilon(v)-\log|1-av|^2|\le C\epsilon^2|P_k|$、未正则对数相位均值 0 ⇒ 总贡献 $\le C_{\rm off}\epsilon^2N_k/k$（`tests:off-patch`，`05:150-167`：$s=|1-av|^2\in[1/4,9/4]$，$\partial_s$ 幅度 $\le16\epsilon^2$）；on-patch 用 `peaks:patch-measure` 写成 $\frac2k\int F_\epsilon(\rho P_k)(e^{-2y/k}+f\cos(k\theta))$，套单峰近似 + $e^{-2y/k}\to1$，误差 $\le\frac2kC_{\epsilon,R_0}(e^{-c(D_0-\sqrt{2R_0})^2}+\frac1k)$（`tests:patch-error`）。选 $\epsilon$ 使 $|I_\epsilon(1)+\Delta|\le\Delta/8$、$C_{\rm off}\epsilon^2\le\Delta/8$；选 $\eta$ 使 $\rho\in[1-\eta,1]$ 时 $I_\epsilon(\rho)\le-3\Delta/4$；选 $D_*,k_*$ 压两误差各 $\le\Delta/16$。求和：$\int U_kW_jd\sigma\le-\frac\Delta2\frac{N_k}k\le-\frac\Delta{2D_0^2}$，即 $d_2=\Delta/(2D_0^2)$。

机械理由：$1-\eta\le r^{k_j}\le1$ 保证 $\rho=r^k$ 落进 $I_\epsilon(\rho)\le-3\Delta/4$ 的区间；"$d_2$ 与 $j$、与增大 $Q$ 无关"让 §6 求和 $\sum_{j\le N}(-d_2)=-d_2N$ 线性发散；$N_k/k\ge1/D_0^2$（`peaks:count`）使 $d_2>0$。

`[推测]` 失败路线：`[推测]` off-patch 误差 $C_{\rm off}\epsilon^2N_k/k$ 未被先选的 $\epsilon^2$ 压住。失败机制：正背景项盖过负 patch 项，$-\Delta/2\cdot N_k/k$ 变号；论文明说"chooses the regularization before the spacing"即为此。`[推测]` 单峰近似误差未 $\le\Delta/16$。失败机制：patch 内模型对不上，$-3\Delta/4$ 变号。`[推测]` 直接对 $U_k$ 用 Jensen（$\log|U_k(0)|=0$ 给 $\ge0$）。失败机制：与 $-d_2$ 矛盾，方向反了；作者改逐密度直证，Hedenmalm 反例（代表测度不满足对数不等式）背书。

### `lem tests:later`（对后续密度仍负，`05:215-275`）

固定 $\epsilon,\eta,D_0,k_*,d_2$，$d_3=d_2/2$；存在 $Q_*$ 使 $Q\ge Q_*$ 时 $\int_SU_{k_j}(r\xi)W_Nd\sigma\le-d_3$（$N\ge j\ge1$，$1-\eta\le r^{k_j}\le1$）。

机制：$W_N-W_j=\sum_{\nu>j}(W_\nu-W_{\nu-1})$，每增量频率在 $\pm k_\nu$ 的 $\ell_{\nu-1}$ 邻域，$\ell_{\nu-1}\le2k_{\nu-1}$ ⇒ 每频率绝对值 $\ge(Q-2)k_{\nu-1}\ge(Q-2)k_j$。把 $U_{k_j}(r\xi)$ 按相位频率展开 $c_m(\xi)$（频率 $mk_j$，$U_{k_j}=\sum_mc_m$）。$V(t')=\log\frac{|1-Ae^{it'}|^2+\epsilon^2}{1+\epsilon^2}$，$A=ar^{k_j}P_{k_j}(\xi)$，$|A|\le aC_P$，$\|V''\|_\infty\le B_\epsilon=\frac{2aC_P}{\epsilon^2}+\frac{4a^2C_P^2}{\epsilon^4}$。两次分部积分 ⇒ $m$ 阶 Fourier 系数 $\le B_\epsilon/m^2$。截断 $|m|\le Q-3$：误差 $\le2B_\epsilon/(Q-3)$，保留频率绝对值 $<(Q-2)k_j$，与 $W_N-W_j$ 频率无交 ⇒ 相位平均使截断积分为零。$\|W_N-W_j\|_{L^1}\le2$（两正概率）⇒ $|\int U_{k_j}(W_N-W_j)|\le4B_\epsilon/(Q-3)$。选 $Q_*$ 使 $\le d_2/2$，套 `prop tests:negative`（$-d_2$）得 $-d_3$。

机械理由：$Q\ge4$、$Q_*$ 含 $Q\ge k_*$ 与密度阈值；频率间隙 $(Q-2)k_j$ 与截断 $Q-3$ 全靠 $Q$ 大；$d_3=d_2/2$ 留一半给 Fourier 尾；$B_\epsilon$ 依赖 $\epsilon^{-4}$（$V''$ 有 $\epsilon^2,\epsilon^4$ 分母）决定 $Q_*$ 可多大但不影响存在性。`[推测]` 失败路线：`[推测]` $Q$ 不够大。失败机制：频率间隙不建立，$U_{k_j}$ 低频与 $W_N-W_j$ 共振，负性被污染。`[推测]` $\epsilon\to0$。失败机制：$m^{-2}$ 衰减消失，$c_m$ 级数不绝对收敛，交换积分/求和断。

Lean：`BaseLogTests.lean`、`BaseLaterNegative.lean`、`BaseLaterMoments.lean`、`BaseLaterComparison.lean`、`BaseOffPatchMean.lean`；`logarithmicTest_later_threshold`、`logarithmicTest_later_comparison` 在 `BaseTestSystem.lean` 被调用组装成 `TestSystem.negative`。

## 7 §6：受控基位势（`sec:base-potential`）

位势定义（`base:potential`，`06:7-9`）：

$$\phi(z)=\psi(z)+L\sum_{j=1}^\infty U_{k_j}(z).$$

### `lem base:convergence`（光滑收敛，`06:14-46`）

对每个有限 $L>0$，级数在 $\B$ 上局部 $C^\infty$ 收敛，和光滑、$\phi(0)=0$、$h\ge I$。

机制：固定 $r_0<r_1<1$，$|z|\le r_0$ 附近复多圆盘半径 $(r_1-r_0)/(2\sqrt2)$ 含于 $|z|<r_1$。Cauchy 估计 + `lem peaks:bounds` 给 $\sup_{|z|\le r_0}|D^mP_k(z)|\le C_{m,r_0,r_1}r_1^k$（$k=Q^j$ 指数衰减）。$P_k$ 值落固定有界盘，$F_\epsilon(P_k)$ 的正阶导是含至少一个 $P_k$（或其共轭）正阶导的乘积之和 ⇒ $D^mU_k$ 同指数界；$m=0$ 用 `tests:lipschitz`。$\sum_jr_1^{Q^j}<\infty$ ⇒ 每局部 $C^m$ 收敛。逐项 $\partial\bar\partial\phi=I+L\sum_j\partial\bar\partial U_{k_j}\ge I$（用 `tests:hessian` 半正定 + $\partial\bar\partial\psi=I$）。

机械理由：$\phi(0)=0$ 因 $\psi(0)=0$ 且 $U_{k_j}(0)=0$；$h\ge I$ 提供 `base:existence` 的 $c=1$；局部 $C^2$ 收敛保证逐项求 $\partial\bar\partial$ 合法；$L$ 有限即可（不需小），发散靠 $Q^j$ 指数。`[推测]` 失败路线：`[推测]` $Q=1$。失败机制：$r_1^{Q^j}=r_1^j$ 虽几何但次数不分离，与 `density:main` 的 $Q\ge2$ 冲突。`[推测]` 级数只 $C^0$ 收敛。失败机制：$\partial\bar\partial\phi\ge I$ 无定义，$c=1$ 断。

Lean：`basePotential`（`BaseLogTests.lean:30`）、`basePotential_contDiffOn`（`BasePotentialSmooth.lean`，用 `choose C hC hb` 机器化 $C^\infty$ 收敛，此处触发 `Classical.choice`）、`testSeries_contDiffOn`。

### `lem base:minorant`（无 pluriharmonic 下界，`06:48-109`）

若 $L>\frac{5\log Q}{d_3}$（`base:amplitude`），则无 $H\in\mathcal O(\B),C_H\in\R$ 满足 `base:no-minorant`。半径 `base:radii`：$r_N=1-\frac\eta{k_N}$。

机制：$j\le N$ 时 Bernoulli 给 $r_N^{k_j}=(1-\eta/k_N)^{k_j}\ge1-\eta k_j/k_N\ge1-\eta$（全满足 `tests:later-negative` 假设）；$j=N+m>N$ 时 $r_N^{k_j}\le e^{-\eta k_j/k_N}=e^{-\eta Q^m}$。尾和 `base:tail`：$\sum_{j>N}\sup_S|U_{k_j}(r_N\xi)|\le C_\epsilon\sum_{m\ge1}e^{-\eta Q^m}=:C_{\rm tail}<\infty$（与 $N$ 无关，靠 `tests:lipschitz` + 均匀多项式界）。$W_N$ 正概率 ⇒ 同界控加权尾（不需 $W_N$ 一致点界）。底位势只贡献一个对数：$\psi(r_N\xi)=-\log(1-r_N^2)\le\log\frac1{1-r_N}=\log(k_N/\eta)$。合并 `base:negative-means`：

$$\int_S\Big(\phi(r_N\xi)+4\log\frac1{1-r_N}\Big)W_Nd\sigma\le5\log(k_N/\eta)+L(-d_3N+C_{\rm tail})=N(5\log Q-Ld_3)+5\log(1/\eta)+LC_{\rm tail}\to-\infty.$$

末式因 $Ld_3>5\log Q$ 使系数 $5\log Q-Ld_3<0$，$N\to\infty$ 发散。套 `lem peaks:mean-criterion`（$u=\phi+4\log(1/(1-|z|))$、$\mu_N=W_Nd\sigma$、$r_N$）得无下界。

机械理由：$L>5\log Q/d_3$ 是"负平均 $-Ld_3N$ 线性下降压过边界容许 $5N\log Q$ 线性上升"的精确门槛；系数 5 来自 $\psi$ 的 1 个 $\log(k_N/\eta)$ 与 $4\log$ 合并；$r_N=1-\eta/k_N$ 同时保证前 $N$ 模式落入 $[1-\eta,1]$（用 `lem tests:later`）与尾指数小；$C_{\rm tail}$ 与 $N$ 无关靠 $Q^m$ 几何衰减，进常数项 $LC_{\rm tail}$ 不随 $N$ 涨；"$W_N$ 正概率控加权尾不需一致点界"因正概率总质量 1，$\int(\text{tail})W_N\le\sup|\text{tail}|\cdot1$。

`[推测]` 失败路线：`[推测]` $d_3$ 太小（被 `lem tests:later` Fourier 尾吃太多）。失败机制：$L$ 需超大才 $>5\log Q/d_3$，但 $L$ 大不影响收敛（`base:convergence` 对任意有限 $L$），真正约束在 $d_3>0$ ，并非 $L$ 上界。`[推测]` 尾和随 $N$ 增长（$Q$ 不够大使 $e^{-\eta Q^m}$ 衰减慢）。失败机制：发散被抵消。`[推测]` 用 Jensen ，并非逐密度。失败机制：$\phi+4\log$ 的负平均要 $\mu_N$ 代表全纯均值（已建）+ 对数不等式（Hedenmalm 说没有），必须走只"代表"不"Jensen"的 `peaks:mean-criterion`。

Lean：`TestSystem.noMinorant`（`BaseMinorant.lean:65`），前提 `hamp : 5*Real.log S.Q < L*S.d`；`series_mean_bound`（:20）给 $\int(\sum_j\text{logarithmicTest})d\mu\le-d\cdot N+T$（$T=C_{\rm tail}$）；主不等式靠 `(S.representing N).analytic_mean hH hrc`（$\int Hd\mu=H0$）+ `integral_mono` + `exists_nat_gt` 取 $N>(C-5\log\eta+LT-(H0).re)/(Ld-5\log Q)$ 使右端被负系数拖穿。

### `lem base:chart-estimates`（一致图估计，`06:116-244`）

对每个固定有限 $L>0$，$\phi$ 在所有中心化球图原点处直到 4 阶的正阶导一致有界 ⇒ `base:control`、`base:jets`（$c=1$、$C$ 有限）。

机制（分两区间，$k\delta$ 为标度，$\delta=1-r$，$\rho=1/16$）：
- 高次 $k\delta>1$：球自同构恒等式在 $D_\rho$ 上给 $1-|T_r(\zeta)|^2\ge\frac{1-2\rho^2}{(1+\rho)^2}\delta$ ⇒ $1-|T_r|\ge c\delta$ ⇒ $|P_k(T_r(\zeta))|\le C_Pe^{-ck\delta}$；固定多圆盘 Cauchy ⇒ 各阶（含 0 阶）$\le C_me^{-ck\delta}$。
- 低次 $k\delta\le1$：原坐标多圆盘 $A_k=\{|z_1-r|<1/k,|z_2|<1/\sqrt k\}$（可越界但 $P_k$ entire 齐次），$|z|^2\le1+4/k$，$|P_k|\le C_Pe^2$；半多圆盘 Cauchy 给 $|\partial_1P_k|\le Ck$、$|\partial_2P_k|\le C\sqrt k$。图位移 $|T_r^1-r|\le\frac{2\rho}{1-\rho}\delta$、$|T_r^2|\le\frac{\sqrt2\rho}{1-\rho}\sqrt\delta$（两系数 $<1/2$），$\delta\le1/k$ 使图像落进 $A_k$ ⇒ 沿直线段积分梯度 $|P_k(T_r)-P_k(r,0)|\le2C\sqrt{k\delta}$。Cauchy 于全纯差 $P_k\circ T_r-P_k(r,0)$ ⇒ 正阶导 $\le C_m\sqrt{k\delta}$（0 阶不主张，`06:189-190`："We make no such assertion for the zeroth-order value in this range"）。
- 合成 `base:scale-jets`：两区间 $P_k\circ T_r$ 值落固定盘，对 $1\le m\le4$，$|D^m(U_k\circ T_r)(0)|\le C_{\epsilon,m}\{\sqrt{k\delta},k\delta\le1;e^{-ck\delta},k\delta>1\}$。
- 求和：$J$ 为最大使 $Q^J\delta\le1$。低次 $\sum_{j\le J}\sqrt{Q^j\delta}\le\frac1{1-Q^{-1/2}}$；高次 $\sum_{j>J}e^{-cQ^j\delta}\le\sum_{m\ge0}e^{-cQ^m}<\infty$。均与图心无关。
- 底位势变换：$\psi\circ T_r=-\log(1-|\zeta|^2)-\log(1-r^2)+\log|1+r\zeta_1|^2$，正阶导（4 阶内）一致有界，末项 pluriharmonic ⇒ $h$ 分量及其 1、2 阶导（$\phi$ 的 2、3、4 阶）有界，合 $h\ge I$。

机械理由：只需 4 阶，因为 `base:jets` 到 $\partial_k\partial_{\bar\ell}h$（$h$ 的 2 阶 = $\phi$ 的 4 阶）；$\rho=1/16$ 固定保证位移系数 $<1/2$ 使图像落入 $A_k$，换更大 $\rho$ 会越界；低次"几乎常数"($\sqrt{k\delta}\to0$) 与高次"指数小"两区间互补覆盖所有 $j$。这正是 `01:152-155` 自述的"Low degrees vary little in a centered chart, while high degrees are exponentially small; this gives the uniform derivatives through order four needed for curvature"。

`[推测]` 失败路线：`[推测]` 非中心化图。失败机制：$k\delta$ 标度不存在（$\delta$ 不控 $|P_k|$ 边界行为），一致界无从谈起。`[推测]` 低次用整体 Cauchy ，并非"$P_k\circ T_r-P_k(r,0)$ 差"。失败机制：带上 0 阶值 $|P_k(r,0)|$ 无衰减，$\sum_{j\le J}$ 发散。`[推测]` $\rho$ 取大。失败机制：位移系数 $\ge1/2$，图像出 $A_k$，$|P_k|$ 界失。

### `proof of Proposition base:existence`（`06:246-266`）

选择顺序在此节末尾被逐字固定：

```tex
Choose $a,\alpha,s_1,f,b,R_0$ as in Lemma~\ref{peaks:profiles}.
Proposition~\ref{tests:negative} first chooses $\epsilon,\eta$ and
then permits any sufficiently large spacing $D_0$.  Fix such a
$D_0$ and its degree threshold $k_*$, and fix
$d_3=d_2/2>0$.  The density theorem holds for every $Q$ above a
threshold depending only on the fixed patch data and spacing.
Its derivative constant $K_*$ is fixed before that threshold is
chosen.  We may therefore choose one integer $Q$ satisfying the
density threshold, $Q\ge k_*$, and the Fourier-error threshold of
Lemma~\ref{tests:later}.
Now fix a finite amplitude $L$ satisfying~\eqref{base:amplitude}.
...  The metric parameter $\lambda$ in
Proposition~\ref{metric:transfer} is chosen only afterward from
these bounds, so none of the choices above depends on $\lambda$.
```

全局链 $a\to s_1\to(f,b,R_0)\to(\epsilon,\eta)\to D_0\to(k_*,d_2)\to d_3\to K_*\to Q\to L$。$Q$ 一次同时满足密度阈值、$Q\ge k_*$、Fourier 阈值 $Q_*$（都是下界，取 max）。$L$ 只依赖 $Q,d_3$。$\lambda$ 完全不进这条链（属 §9）。`[推测]` 若 $\epsilon$ 在 $D_0$ 之后选，单峰近似误差无法用扩 $D_0$ 压（$C_{\epsilon,R_0}$ 已定但 $F_\epsilon$ 导数随 $\epsilon$ 变），$\Delta/16$ 精度选不出；对应"regularization before the spacing"。

Lean：`controlled_potential`（`Main.lean:23`）装配 `let L := (5*Real.log (S.Q:ℝ))/S.d+1`（:25，即 $L=5\log Q/d+1$，`+1` 自动严格满足 `base:amplitude`），`hamp`（:29）用 `add_mul,div_mul_cancel₀` 验 $5\log Q<5\log Q+d$；`basePotential_chart_control`（`BasePotentialControl.lean`）给 `ChartControl φ 1 C` 与 `ChartJets φ C`。

## 8 §7：全局 Hartogs 度量（`sec:hartogs`）

### `lem metric:complete`（`07:12-167`）

```tex
\begin{lemma}\label{metric:complete}
Let $\phi$ be a smooth real plurisubharmonic function on $\B$, and let
$\lambda>0$.  The domain $M_\phi$ in \eqref{metric:domain} is
contractible, and the complex Hessian of
$\mathcal K_\lambda=\lambda\psi-\log(1-e^\phi|w|^2)$ defines a smooth
geodesically complete K\"ahler metric
$g=2\operatorname{Re}\widehat g$ on $M_\phi$.
Moreover, $\mathcal K_\lambda$ is a smooth strictly plurisubharmonic
exhaustion of $M_\phi$.
\end{lemma}
```

四段机制：
1. 域与光滑正度量。$M_\phi=\{t<1\}$ 开。$(z,w)\mapsto(z,e^{\phi/2}w)$ 是 $M_\phi\to\B\times\D$ 光滑实微分同胚（逆 $(z,u)\mapsto(z,e^{-\phi/2}u)$）⇒ 可缩，不需全纯平凡化（`07:32-33`："no holomorphic trivialization is needed for this conclusion"）。写 $h=\partial\bar\partial\phi$、$x=\frac t{1-t}$、$G=\lambda I+xh$、$\vartheta=dw+w\partial\phi$，`(metric:smooth-form)`：$\widehat g=G+\frac{e^\phi}{(1-t)^2}\vartheta\otimes\bar\vartheta$。$h\ge0$ ⇒ $G\ge\lambda I$ 控水平投影；$u_z=0$ 时第二项 $u_w\ne0$ 正 ⇒ 正定。零截面 `(metric:axis)`：$\widehat g|_{(z,0)}=\lambda I(z)+e^{\phi(z)}dw\otimes d\bar w$，混合块消失。远离零截面用 $s=\log t$、$q=x(1+x)$：`(metric:log-form)` $\widehat g=\lambda I+xh+q\partial s\otimes\bar\partial s$（供曲率用）。论文 `07:74-76` 特别："`\eqref{metric:smooth-form}`, rather than the coordinate $s$, defines the metric across $w=0$"。
2. 两函数有界梯度。约定 `(metric:gradient-convention)` $|\nabla f|_g^2=2|\partial f|_{\widehat g^{-1}}^2$。$\partial[-\log(1-t)]=\frac{e^\phi\bar w}{1-t}\vartheta$，coframe 分块对角 ⇒ $|\partial[-\log(1-t)]|_{\widehat g^{-1}}^2=t$（含 $w=0$，两端都零）；$|\partial\psi|_{I^{-1}}^2=|z|^2$，$G\ge\lambda I$ ⇒ `(metric:gradient-bounds)` $|\nabla[-\log(1-t)]|_g^2=2t<2$，$|\nabla\psi|_g^2\le2/\lambda$。
3. 度量球紧含。沿路径积分梯度界，$d_g(p,q)\le R$ ⇒ $-\log(1-t(q))\le a_R$、$\psi(q)\le b_R$ ⇒ $t\le\tau_R<1$、$|z|\le\rho_R<1$，$|w|^2\le e^{-m_R}\tau_R$ ⇒ 球含于紧集 `metric:compact-containment` $K_R$，不需极小测地线（`07:124`："This argument does not require a minimizing geodesic"）。同法 $\mathcal K_\lambda\le R$ 次水平集紧 ⇒ 严格 psh exhaustion。
4. 测地完备。单位速测地线有限最大时间 $T$ ⇒ 像含于紧 $K_T$，度量有欧氏正下界 ⇒ 欧氏速有界；Christoffel 于 $K_T$ 有界 ⇒ 加速度有界 ⇒ 位置速度有极限（在 $K_T\subset M_\phi$）⇒ 局部存在延拓，矛盾；逆向同理。

机械理由：$\phi$ psh（$h\ge0$）用在 $G\ge\lambda I$ 正定；$\lambda>0$（任意）用在 $|\nabla\psi|^2\le2/\lambda$ 有限。本引理不需 $h\ge cI$ 或大 $\lambda$（只 $h\ge0$），与 `prop metric:transfer` 分工：完备性对任何 $\lambda$ 成立（`07:169-171`："Lemma~\ref{metric:complete} applies for every $\lambda>0$"）。梯度界是完备性核心（把 $g$-距离换成 $t,\psi$ 显式界）。

`[推测]` 失败路线：`[推测]` 用 Hopf-Rinow（需先证度量空间完备）。失败机制：那绕回测地延拓，作者直接测地线方程延拓更初等。`[推测]` 零截面处理不当（跨 $w=0$ 用 $q\partial s\otimes\bar\partial s$）。失败机制：$s=\log t$ 在 $w=0$ 奇异，$\partial s$ 无定义；论文用 `metric:smooth-form`（$\vartheta\otimes\bar\vartheta$ 系数 $\frac{e^\phi}{(1-t)^2}$ 在 $w=0$ 仍正）避开。

Lean：`hartogsMetric_isKahler`（`MetricCalculus.lean:805`）、`hartogsMetric_geodesicallyComplete`（`HartogsCompletenessSupport.lean:319`）、`chartControl_psh`（`HartogsTransferTools.lean:53`）、`hartogs_contractible`（`HartogsTopologySupport.lean`）。完备性机器化 `choose γ hγ0 hγ`（`HartogsCompletenessSupport.lean:201`）与 `choose r hr ε hε H`（:133）触发 `Classical.choice`（在 permitted_axioms 内）。

## 9 §8：实二平面上的曲率（`sec:curvature`）

### 点态全纯规范与张量块（`08:18-72`）

固定 $w\ne0$，中心化基坐标，取 $\log w$ 分支，$s=\log t=\phi+\log w+\overline{\log w}$、$x=\frac t{1-t}$、$q=x(1+x)$。用全纯纤维变换清权重的一阶与纯二阶导：

$$P(z)=\sum_i\phi_i(0)z_i+\frac12\sum_{i,k}\phi_{ik}(0)z_iz_k,\qquad v=\log w+P(z),$$

使规范 `(curv:gauge)`：$s_i=s_{ik}=0$，$s_v=s_{\bar v}=1$，$s_{i\bar j}=h_{i\bar j}$，"All higher derivatives of $s$ involving a vertical index vanish"（`08:37`）。度量块 $\widehat g=\begin{pmatrix}G&0\\0&q\end{pmatrix}$，$G=\lambda I+xh$，竖直向量归一 $q^{-1/2}\partial_v$（指标 0），度量 $G+V$。约定 `(curv:coordinate-formula)` $R_{a\bar b c\bar d}=-\mathcal K_{ac\bar b\bar d}+\widehat g^{p\bar e}\mathcal K_{ac\bar e}\mathcal K_{p\bar b\bar d}$。对称张量 `(curv:symmetric-tensor)` $(S_P)_{a\bar b c\bar d}=P_{a\bar b}P_{c\bar d}+P_{a\bar d}P_{c\bar b}$。

机制：$F(s)=-\log(1-e^s)$ 求导 $F'=x,F''=q,F'''=q(1+2x),F''''=q(1+6x+6x^2)$。基 $\psi$ 中心化表达式与 $-\log(1-|z|^2)$ 差 pluriharmonic + 常数 ⇒ $(2,1)$ 型导数中心为零、$(2,2)$ 型为 $S_I$。规范 $v=\log w+P(z)$ 恰吸收 $\phi_i(0),\phi_{ik}(0)$，不改 $h$ 及其中心坐标导数（`08:38-39`："Subtracting $P+\bar P$ changes neither $h$ nor its component derivatives"）。

机械理由：清一阶/纯二阶导是为了让 `curv:third-derivatives`/`curv:fourth-derivatives` 大量项为零（`08:149-150`："All other terms contain a vanished first or pure second horizontal derivative"），是分解 $R=-\lambda S_I-qS_h-S_V-\cdots+T_4+T_3$ 只剩 $T_3,T_4$ 误差的根因。`[推测]` 若不清，$T_4$ 里多出 $qS_{(\text{pure }2)}$ 项，`curv:D-bounds` 失去。

### `prop curv:tensor`（完整曲率张量，`08:74-226`）

定义水平 Hermitian 形式 $D=(1+2x)h-qhG^{-1}h$。全张量 `(curv:tensor-identity)`：

$$R=-\lambda S_I-qS_h-S_V-(S_{D+V}-S_D-S_V)+T_4+T_3,$$

$T_j$ 恰 $j$ 个水平指标。非零分量（Kähler 对称与共轭 up to）：

$$(T_4)_{i\bar jk\bar l}=-xh_{i\bar j,k\bar l}+x^2G^{p\bar e}h_{i\bar e,k}h_{p\bar j,\bar l},\qquad (T_3)_{i\bar jk\bar0}=\sqrt q(-h_{i\bar j,k}+xG^{p\bar e}h_{i\bar e,k}h_{p\bar j}).$$

欧氏分量范数下 $\lambda\ge1$ 一致：`(curv:component-errors)` $\|T_4\|\le C_4x$，$\|T_3\|\le C_3\sqrt q$。若 $\lambda\ge h$ 特征值一致上界（即 $\lambda\ge C$），`(curv:D-bounds)` $(1+x)h\le D\le(1+2x)h$。

机制（导数表 → 代入公式）：三阶 $(2,1)$ 型（未归一）`curv:third-derivatives`：$\mathcal K_{ik\bar j}=xA_{ik\bar j}$、$\mathcal K_{iv\bar j}=qh_{i\bar j}$、$\mathcal K_{vv\bar v}=q(1+2x)$（$A_{ik\bar j}=h_{i\bar j,k}$）。四阶 $(2,2)$ 型 `curv:fourth-derivatives`：$\mathcal K_{ik\bar j\bar l}=\lambda(S_I)+xB_{ik\bar j\bar l}+q(S_h)$、$\mathcal K_{ik\bar j\bar v}=qA_{ik\bar j}$、$\mathcal K_{iv\bar j\bar v}=q(1+2x)h_{i\bar j}$、$\mathcal K_{vv\bar v\bar v}=q(1+6x+6x^2)$。链式法则核对完备性：四水平导两配对给 $qS_h$，第三配对含 $s_{ik}s_{\bar j\bar l}=0$；$\mathcal K_{ik\bar v}=\mathcal K_{vv\bar j}=0$，"No vanishing of pure third horizontal derivatives is needed"（`08:154`）。代入 `(curv:coordinate-formula)`：$T_4=-xB+x^2G^{-1}AA$、$T_3=\sqrt q(-A+xG^{-1}Ah)$。剩余块 `curv:remaining-blocks`：$R_{i\bar j0\bar0}=-D_{i\bar j}$、$R_{i\bar0k\bar0}=0$、$R_{0\bar00\bar0}=-2$（未归一 $-q(1+6x+6x^2)+q(1+2x)^2=-2q^2$，四竖直归一因子积 $q^{-2}$）。误差界：$h\ge cI$ ⇒ $\|G^{-1}\|\le1/(\lambda+cx)$、$x^2\|G^{-1}\|\le x/c$；配 `base:jets` 得 `curv:component-errors`。$D$ 界：$G=\lambda I+xh$ 与 $h$ 交换，特征值 $d$ 方向 $D/h=1+2x-\frac{x(1+x)d}{\lambda+xd}$，减分数非负且 $\lambda\ge d$ 时 $\le x$。

零截面（`08:202-226`）用正则坐标直接验：全纯纤维变换 $W=e^{P(z)+a}w$ 使新权重值零、一阶与纯二阶导零，混合 Hessian 仍 $h$；到 4 阶相关项 $\lambda\psi+|W|^2(1+\sum h_{i\bar j}z_i\bar z_j)+\frac12|W|^4$；原点度量 $\operatorname{diag}(\lambda I,1)$，`(curv:zero-section)` $R_{i\bar jk\bar l}=-\lambda(S_I)$、$R_{i\bar j0\bar0}=-h_{i\bar j}$、$R_{0\bar00\bar0}=-2$。故上面公式在 $x=q=0,G=\lambda I,D=h,T_3=T_4=0$ 时同样成立。

机械理由：$\lambda\ge1$（本节全程）用在 $x^2\|G^{-1}\|\le x/c$ 与误差界"与 $\lambda\ge1$ 无关"；$\lambda\ge C$ 用在 `curv:D-bounds` 上界（`lem pinch:positivity` 先把 $\lambda_0$ 抬到 $\max(1,C)$ 启用它）；$T_3$ 带 $\sqrt q$、$T_4$ 带 $x$ 的权重是 §9 两 regime 误差消失的定量依据。

`[推测]` 失败路线：`[推测]` 度量约定用 $\operatorname{Re}\widehat g$ ，并非 $2\operatorname{Re}\widehat g$。失败机制：`curv:remaining-blocks` 的 $R_{0\bar00\bar0}=-2$ 变 $-1$，§8 末盘模型"取 $u_2=iu_1$ 给实曲率 $-2$"对不上，且 `lem curv:real-plane` 分母 $2a_{\widehat g}$ 全差因子 2。`[推测]` 用 $\widehat g$ ，并非 $2\operatorname{Re}\widehat g$ 作实截面分母。失败机制：$K$ 数值整体翻倍，pinching 区间 $[-2,-1/2]$ 变 $[-4,-1]$，与盘模型矛盾。

### `lem curv:real-plane`（实曲率与 Gram 行列式，`08:255-310`）

量定义 `curv:gram-quantities`：$a_P=P(u_1,u_1)P(u_2,u_2)-(\operatorname{Re}P(u_1,u_2))^2$、$b_P=\operatorname{Im}P(u_1,u_2)$、$m_P=a_{P+V}-a_P-a_V$；$\mathcal H_T=T_{u_1\bar u_1u_2\bar u_2}-\operatorname{Re}T_{u_1\bar u_2u_1\bar u_2}$。结论 `(curv:sectional)` $K_g=\frac{\mathcal H_R}{2a_{\widehat g}}$；`(curv:xi-definition)` $\Xi^{a\bar b}=u_1^a\overline{u_2^b}-u_2^a\overline{u_1^b}$；`(curv:xi-contraction)` $\mathcal H_T=-\frac12T_{a\bar bc\bar d}\Xi^{a\bar b}\Xi^{c\bar d}$；`(curv:S-contraction)` $\mathcal H_{S_P}=a_P+3b_P^2$。

机制：实面积平方 $=4a_{\widehat g}$（因 $g=2\operatorname{Re}\widehat g$）。$A=R_{u_1\bar u_1u_2\bar u_2}$、$B=R_{u_1\bar u_2u_1\bar u_2}$，$U_j=u_j+\bar u_j$ 展开给 $R^\R(U_1,U_2,U_2,U_1)=A-B-\bar B+A=2\mathcal H_R$，除实面积得 `curv:sectional`。$\mathcal H_{S_P}$：$c_P=P(u_1,u_2)$，直接缩 `curv:symmetric-tensor` 得 $P(u_1,u_1)P(u_2,u_2)+|c_P|^2-2\operatorname{Re}(c_P^2)=a_P+3b_P^2$。盘模型：$-\log(1-|w|^2)$ 归一复曲率 $-2$，取 $u_2=iu_1$ 给实曲率 $-2$（`08:306-310`），定标准化。

机械理由：$a_{\widehat g}>0$ 由实线性无关保证分母正；定义允许水平/竖直投影退化（`08:252-253`）。`[推测]` 若误把 $\mathcal H_{S_P}=a_P$（忽略 $3b_P^2$），`prop curv:tensor` 里 $\lambda(a_I+3b_I^2)$ 少一项，§9 `pinch:algebra` 的 $a_h+3b_h^2$ 结构对不上，非负性证不出。

### `lem curv:gram`（混合 Gram，`08:312-347`）

半正定 Hermitian $P$：$a_P\ge b_P^2$；竖直 $V$：$a_V=b_V^2$（复秩 1）；$P$ 水平半正定时 $m_P$ 非负、线性、单调，且 `curv:mixed-gram` $m_P\ge2\sqrt{a_Pa_V}$，$a_Pa_V>0$ 时等号当且仅当两实 Gram 阵成比例。

机制：复 Cauchy-Schwarz $P(u_1,u_1)P(u_2,u_2)\ge|P(u_1,u_2)|^2$ ⇒ $a_P\ge b_P^2$，$V$ 秩 1 取等。$A,B$ 两实 Gram：$a_P=\det A$、$a_V=\det B$、$m_P=\operatorname{tr}(\operatorname{adj}(A)B)$；正定 $A$ 时 $C=A^{-1/2}BA^{-1/2}$，$m_P=(\det A)\operatorname{tr}C$、$\sqrt{a_Pa_V}=(\det A)\sqrt{\det C}$，二元 AM-GM $\operatorname{tr}C\ge2\sqrt{\det C}$ ⇒ 结论；半正定连续性；等号 ⇔ $C$ 标量 ⇔ 成比例。线性于 $P$ 元、半正定非负 ⇒ 单调。

机械理由：$m_D\ge2\sqrt{a_Da_V}$ 用在 §9；单调性用在 $D\ge(1+x)h$ ⇒ $m_D\ge(1+x)m_h$；$V$ 复秩 1（$\dim_\C$ 纤维 $=1$）用在 $a_V=b_V^2$。`[推测]` 若纤维维 $>1$，$a_V=b_V^2$ 失，`pinch:algebra` 等号分类（要混合块全零）不再成立，这可能是本构造卡在三维（纤维 1 维 + 基 2 维），并非高维的结构原因之一（论文未明说）。

### `lem curv:errors` 与分子（`08:374-419`）

$\Xi$ 块范数 `curv:xi-norms`：$\|\Xi_{HH}\|^2=2(a_I+b_I^2)\le4a_I$、$\|\Xi_{H\bar0}\|^2=m_I+2b_Ib_V$、$\|\Xi_{\rm mix}\|^2=2(m_I+2b_Ib_V)\le4m_I$（用 $|b_Ib_V|\le\sqrt{a_Ia_V}\le m_I/2$）。结论 `curv:contracted-errors`：$|\mathcal H_{T_4}|\le Cxa_I$，$|\mathcal H_{T_3}|\le C\sqrt q\sqrt{a_Im_I}$，更细 `curv:mixed-error` $|\mathcal H_{T_3}|\le C\sqrt q\|\Xi_{HH}\|\|\Xi_{\rm mix}\|$。分子 `curv:negative-numerator`：

$$-\mathcal H_R=\lambda(a_I+3b_I^2)+q(a_h+3b_h^2)+4a_V+m_D+6b_Db_V-\mathcal H_{T_4}-\mathcal H_{T_3}.$$

机制：$T_4$ 配对两 $\Xi_{HH}$ ⇒ $|\mathcal H_{T_4}|\le Cx\|\Xi_{HH}\|^2\le Cxa_I$；$T_3$（恰三水平指标）配对 $\Xi_{HH}$ 与 $\Xi_{\rm mix}$ ⇒ `curv:mixed-error`；$\mathcal H_{S_V}=4a_V$、$\mathcal H_{S_{D+V}-S_D-S_V}=m_D+6b_Db_V$（用 $a_V=b_V^2$），合并 `curv:tensor-identity`。

机械理由：`curv:xi-norms` 的 $\|\Xi_{\rm mix}\|\le\sqrt{4m_I}$ 把 $T_3$ 与混合块绑定，§9 正是在混合块趋零的退化平面用 `pinch:vanishing-error` 拿额外消失阶；$6b_Db_V$ 可正可负（`08:417-419`："The mixed term $6b_Db_V$ can have either sign"）是 §9 必须整组处理 `pinch:algebra` 的原因。`[推测]` 若放弃 $m_I$ 结构只用 $\|\Xi_{HH}\|\le C\sqrt{a_I}$，$T_3$ 界在退化平面（$m_I\to0$ 而 $a_I$ 不趋零）拿不到额外消失，§9 的 $o(x^{-1/2})$ 断。

Lean：曲率张量恒等 `HartogsCurvature.lean`（627 行）与 `HartogsModelBridge.lean`（273 行，`normalCurvature_model`）；Gram/平面代数在 `PinchingCompact.lean` 的 `PlaneAlgebra`（`metricArea/H/Symmetries/Supported/componentNorm`）；`horizontalPart`（4/3 水平投影）在 `HartogsErrorBounds.lean`。

## 10 §9：实二平面上的一致 pinching（`sec:pinching`）

### `lem pinch:algebra`（混合实平面代数，`09:33-157`）

引理前给退化平面的代数模型（`09:19-31`）：$h=I$、$E=2I$、$u_1=(e_1,1)$、$u_2=(ie_1,-i)$ 代入给 $a_h+3b_h^2+4a_V+m_E+6b_Eb_V=4+4+4-12=0$、$\Xi_{\rm mix}=0$（水平与竖直投影复定向相反）。这条模型告诉我：主表达式即使在基投影与纤维投影都非零时也能取零，所以非负性靠不住严格正，误差项必须在这些退化平面上跑得更快。

```tex
\begin{lemma}\label{pinch:algebra}
... Define \(P_h(E)=a_h+3b_h^2+4a_V+m_E+6b_Eb_V.\)
If \(a_ha_V=0\), then \(P_h(E)>0\).
If \(a_ha_V>0\), put \(\tau=|b_h|/\sqrt{a_h}\).
For every real \(\beta\) such that \(E\le(2-\beta)h\),
\begin{equation}\label{pinch:square}
 P_h(E)\ge
 \left(\sqrt{a_h+3b_h^2}-2\sqrt{a_V}\right)^2
 +2\beta(1+\tau)\sqrt{a_ha_V}.
\end{equation}
In particular, \(h\le E\le2h\) implies \(P_h(E)\ge0\).
If equality holds in this last conclusion, then
\[
 a_h=a_V>0,\qquad |b_h|=\sqrt{a_h},\qquad b_Eb_V<0,
\]
and both mixed blocks \(\Xi^{i\bar0}\) and \(\Xi^{0\bar i}\) vanish.
\end{lemma}
```

机制四步：
1. 零面积：$a_V=0\Rightarrow b_V=0$（纤维维 1）；$a_h=0\Rightarrow$ 水平投影实相关 ⇒ 任 Hermitian 配对实 ⇒ $b_E=0$。故 $a_ha_V=0\Rightarrow b_Eb_V=0$，$P_h(E)\ge a_h+4a_V+m_h\ge a_{h+V}>0$。
2. $A=a_h,U=a_V>0$：Hermitian Gram 给 $0\le\tau\le1$。实基变换使水平投影 $u_H,v_H$ 对 $h$ 实标准正交（$|b_h|/\sqrt{a_h}$、$|b_E|/\sqrt{a_h}$ 不变）。$u_H\pm iv_H$ 的 $h$-范数平方 $=2(1\pm\tau)$，$E$-范数平方绝对差 $=4|b_E|$。一上一下比 `pinch:imaginary-bound`：
   $$\frac{|b_E|}{\sqrt A}\le\frac{(2-\beta)(1+\tau)-(1-\tau)}2=\frac{1+3\tau}2-\frac{\beta(1+\tau)}2\le\sqrt{1+3\tau^2}-\frac{\beta(1+\tau)}2.$$
   末步 $1+3\tau^2-((1+3\tau)/2)^2=\frac34(1-\tau)^2\ge0$（严格除非 $\tau=1$）。此论证不需 $\beta\ge0$（`09:96`）。
3. `curv:mixed-gram` + Hermitian Gram：$m_E\ge2\sqrt{a_EU}\ge2|b_E|\sqrt U$；$U=b_V^2$ 使 $P_h(E)\ge A+3b_h^2+4U-4|b_E|\sqrt U=(\sqrt{A+3b_h^2}-2\sqrt U)^2+2\beta(1+\tau)\sqrt{AU}$（配方）。
4. 等号（$h\le E\le2h$，$\beta=0$）：$P_h(E)\ge(s-2\sqrt U)^2+4\sqrt U(s-B)\ge0$（$s=\sqrt{A+3b_h^2},B=|b_E|$）。等号逼 $s=2\sqrt U,B=s$、各不等式取等 ⇒ $\tau=1$（`pinch:imaginary-bound` 严格性）⇒ $U=A,B=2\sqrt A,b_Eb_V<0,m_E=2B\sqrt U$。$a_E\ge B^2,m_E\ge2\sqrt{a_EU}$ ⇒ $a_E=B^2$ 且 `curv:mixed-gram` 取等 ⇒ 水平 $E$-Gram 与竖直 Gram 成比例。$\tau=1$ 给水平投影形如 $u_H,\sigma iu_H$；$b_Eb_V<0$ 选反定向给竖直投影 $y,-\sigma iy$ ⇒ $\Xi^{i\bar0}=u_H^i\overline{-\sigma iy}-(\sigma iu_H^i)\bar y=0$，另一混合块同；任意基变换下 $\Xi$ 乘行列式 ⇒ 原基亦零。

机械理由：$E\ge h$（下界）用在零面积情形与配方基线；$E\le(2-\beta)h$（上界）用在第 2 步"从上面比一个范数"；$\beta$ 允许负是 `pinch:positivity` 里 $\beta=c_1\frac x{\lambda+x}-\frac{C_1}{x^2}$ 可能为负的关键。模型 $h=I,E=2I$ 恰取零说明"$E\le2h$"的常数 2 不可改大，这是 `curv:D-bounds` 给 $D\le(1+2x)h$ 且 $\sqrt q\sim x$ 时 $E=D/\sqrt q\le2h$ 的紧界。

`[推测]` 失败路线：`[推测]` 纤维维 $\ge2$。失败机制：$a_V=b_V^2$ 失，第 1 步 $b_V=0$ 与第 4 步 $U=b_V^2$ 断，$P_h$ 非负证不出。`[推测]` $E$ 无上界 $2h$。失败机制：$|b_E|/\sqrt A$ 无界，配方 $-4|b_E|\sqrt U$ 压倒正项，$P_h<0$。`[推测]` 要求 $\beta\ge0$。失败机制：见 `pinch:positivity` 那节末，退化平面 $L_x$ 可能仅 $O(x^{-1})$ 被 $T_3$ 的 $O(x^{-1/2})$ 压倒。

### `lem pinch:positivity`（大 $\lambda$ 一致负，`09:165-354`）

固定 $0<c\le C<\infty,0\le C_{\rm e}<\infty$；存在 $\lambda_0=\lambda_0(c,C,C_{\rm e})>0$。设 $\lambda\ge\lambda_0$、$x\ge0$、$cI\le h\le CI$，$q=x(1+x),G=\lambda I+xh,D=(1+2x)h-qhG^{-1}h$，$T_4,T_3$ 具 Kähler 对称与实条件、分别四/三水平指标、$\|T_4\|\le C_{\rm e}x,\|T_3\|\le C_{\rm e}\sqrt q$，$R=-\lambda S_I-qS_h-S_V-(S_{D+V}-S_D-S_V)+T_4+T_3$。则 $\mathcal H_R<0$ 于每条实二平面。

机制（反证 + 两 regime）：先抬 $\lambda\ge\max(1,C)$ 启用 `curv:D-bounds`。若假有序列 $\lambda\to\infty$ 使 $F=-\mathcal H_R\le0$（`pinch:leading-numerator`）。
- Regime $q/\lambda\to0$：单调性 $m_D\ge c(1+x)m_I$，$|b_D|\le\sqrt{a_D}\le C'(1+x)\sqrt{a_I}$。丢正项 $F\ge\lambda a_I+4a_V+c(1+x)m_I-C'((1+x)\sqrt{a_Ia_V}+xa_I+\sqrt q\sqrt{a_Im_I})$；第一积项吸收进 $2a_V$，末项吸收进 $\frac c2(1+x)m_I$（用 $q/(1+x)=x$）：$F\ge[\lambda-C''((1+x)^2+x)]a_I+2a_V+\frac c2(1+x)m_I$。$(1+x)^2+x=O(1+q)=o(\lambda)$ ⇒ 系数终正而 $a_I+a_V+m_I=a_{I+V}>0$ ⇒ 矛盾。
- Regime $\lambda/q$ 有界（$x\to\infty$）：把水平分量乘 $q^{1/4}$ 平衡 $qS_h$（四水平槽）与 $S_V$（系数 1），在 $\operatorname{Re}(I+V)$ 实标准正交基下取 rescaled pairs（固定紧 Stiefel 流形，$a_{I+V}=1$）。rescaled 主部 `pinch:rescaled-leading` $L_x=\frac\lambda q(a_I+3b_I^2)+P_h(E)$，$E=D/\sqrt q$。rescaled 误差 `pinch:rescaled-errors` $\|\widetilde T_4\|\le C'x/q=O(x^{-1})$、$\|\widetilde T_3\|\le C'q^{-1/4}=O(x^{-1/2})$。$E\ge h$；特征值 $d\in[c,C]$ 上 $E/h=\frac{1+2x}{\sqrt q}-\frac{\sqrt q d}{\lambda+xd}$，用 $\frac{1+2x}{\sqrt q}=\sqrt{4+1/q}\le2+C_1/x^2$、$\frac{\sqrt q d}{\lambda+xd}\ge c_1\frac x{\lambda+x}$ ⇒ `pinch:E-bounds` $h\le E\le(2+C_1/x^2-c_1\frac x{\lambda+x})h$。取子列收敛 $h\le E\le2h$，误差趋零，`pinch:algebra` 给两和项非负 ⇒ 都须零 ⇒ $P_h(E)=0$ ⇒ $a_h,a_V>0$ 且极限混合块零。$c^2a_I\le a_h\le C^2a_I$ ⇒ $a_I,a_h,a_V$ 沿子列正下界。改进误差：三水平张量只能配一 $\Xi_{HH}$ + 一 $\Xi_{\rm mix}$，$\Xi_{\rm mix}\to0$ ⇒ `pinch:vanishing-error` $|\mathcal H_{\widetilde T_3}|\le C'q^{-1/4}\|\Xi_{HH}\|\|\Xi_{\rm mix}\|=o(x^{-1/2})$（显式 $q^{-1/4}$ 制造额外阶，不需平面收敛速率）。取极限前用 `pinch:square`（$\beta=c_1\frac x{\lambda+x}-\frac{C_1}{x^2}$，可负）⇒ `pinch:positive-gap` $L_x\ge c_2(\lambda/q+\frac x{\lambda+x})-C_2/x^2$。$x\ge1$ 时若 $\lambda\ge x^{3/2}$ 则 $\lambda/q\ge1/(2\sqrt x)$；若 $\lambda\le x^{3/2}$ 则 $\frac x{\lambda+x}\ge1/(\sqrt x+1)\ge1/(2\sqrt x)$。故 $L_x\gtrsim x^{-1/2}>$ 误差 $o(x^{-1/2})$ ⇒ $F>0$，矛盾。

机械理由：$C_{\rm e}<\infty$ 是给 $T_3,T_4$ 一致界前提（来自 `base:jets`），去掉则 rescaled 误差不趋零；$c$ 用在 $m_D\ge c(1+x)m_I$ 与 $c^2a_I\le a_h$，$C$ 用在 $|b_D|\le C'(1+x)\sqrt{a_I}$ 与 $a_h\le C^2a_I$；$\lambda_0$ 依赖 $(c,C,C_{\rm e})$（第一 regime 要 $\lambda\gg(1+x)^2$，第二 regime 要 $x^{-1/2}$ 间隙压过误差，两下界合成）。这正是 `01:162-164` 自述的"This cancellation gives stronger error control near the degenerate planes"的实现处。

`[推测]` 失败路线：`[推测]` $\beta$ 必须 $\ge0$。失败机制：$c_1\frac x{\lambda+x}<C_1/x^2$ 时无法选合法 $\beta$ 造正间隙，退化平面 $L_x$ 仅 $O(x^{-1})$ 被 $T_3$ 的 $O(x^{-1/2})$ 压倒；`pinch:algebra` 的"不需 $\beta\ge0$"正是救这一路。`[推测]` 不用 $q^{1/4}$ rescale。失败机制：$qS_h$ 与 $S_V$ 系数失衡，$x\to\infty$ 时 $L_x$ 无紧化子列。`[推测]` $\Xi_{\rm mix}$ 不趋零（没先证 $P_h(E)=0\Rightarrow$ 混合块零）。失败机制：$T_3$ 只有 $O(x^{-1/2})$ 非 $o(x^{-1/2})$，与 $L_x\gtrsim x^{-1/2}$ 同阶，$F>0$ 证不出。

### `proof of Proposition metric:transfer`（固定参数双侧界，`09:358-454`）

几何结论（域、完备）来自 `lem metric:complete`。取任意有限 $\lambda\ge\lambda_0$ ⇒ $-\mathcal H_R>0$ 逐点。
- 有界 $x\in[0,X]$：归一化后 $(x,h,T_4,T_3,\text{pair})$ 落有限维闭有界集（约束 $cI\le h\le CI$、分量型与对称、$C_{\rm e}x/C_{\rm e}\sqrt q$ 闭范数界）⇒ 紧；$G,D,R$ 连续 ⇒ $-\mathcal H_R$ 有严格正最小与有限最大；$G+V$ 一致正定有界 ⇒ $a_{G+V}$ 上下有界 ⇒ `curv:sectional` 给双侧界。
- $x\to\infty$：rescale，固定 $\lambda$ 下 `pinch:D-limit` $D/\sqrt q-h=O_\lambda(x^{-1})$（`pinch:metric-limit` $G/\sqrt q-h=O_\lambda(x^{-1})$）。张量极限 `pinch:tensor-limit` $\widetilde R_x=-S_{h+V}+O_\lambda(x^{-1/2})$。极限度量 $h+V$、张量 $-S_{h+V}$ 给 $K=-\frac12(1+3b_{h+V}^2/a_{h+V})\in[-2,-1/2]$（$a_{h+V}\ge\min(c,1)^2$ 下界、紧族 ⇒ 一致收敛）。足够大 $X_\lambda$ 使 $x\ge X_\lambda$ 时 $-3\le K_g\le-1/4$。合并有界段 ⇒ $0<A\le B$。零截面 $x=0$ 由 `curv:zero-section` 光滑延拓覆盖。

机械理由：$-2,-1/2$ 来自 $b_{h+V}^2/a_{h+V}\in[0,1]$（Hermitian Gram $a\ge b^2$），纤维维 1 使 $b_V^2=a_V$，极限曲率区间与盘模型 $-2$ 吻合。$O_\lambda(x^{-1})$（度量）vs $O_\lambda(x^{-1/2})$（张量）。`[推测]` 失败路线：`[推测]` $x\to\infty$ 时 $\lambda$ 也随 $x$ 变。失败机制：$D/\sqrt q$ 不趋 $h$，极限张量非 $-S_{h+V}$，$K$ 区间无定，上界 $B_\lambda=\infty$；论文区分"固定 $\lambda$（此处）"与"$\lambda\to\infty$（反证）"正为此。`[推测]` 有界段闭性不够（$C_{\rm e}x$ 界不闭合）。失败机制：紧性失，最小值可能 $=0$，下界 $A$ 断。

Lean：`pinchingThreshold`（`PinchingCompact.lean:591`，`max(C+1, max(18*C^2+errorCoefficient+1, max(2*(5*C^2/4)+1, 2*(errorCoefficient+1)*((errorCoefficient+1)/thresholdGap+1))))`）、`errorCoefficient`（:586，$E+E^2/(2c)$）、`thresholdGap`（:588，$c^3/(8(2(errorCoefficient+1)+C))$）、`metricErrorConstant`（`HartogsFrame.lean:97`，$=9(C+4C^2/c)$）、`metricThreshold`（:98，$=\text{pinchingThreshold}\,c\,C\,(162\cdot\text{metricErrorConstant}\,c\,C)$，162 硬编码）、`curvatureModel_uniform_pinching`（:2814）、`hartogsMetric_uniform_pinching`（`HartogsPinching.lean:21`）。两 regime 机器化在 `PinchingCompact.lean`（2889 行）与 `HartogsCurvature.lean`。

## 11 叙事时间线：我自述的动机、障碍与文献

本节把论文里凡是我逐字写下的自述摊开，其余按论证依赖反推的都标 `[推测]`。素材 §3.6 那类"时间线重建（论文未述）"保留标记。

动机（`01:4-11`，`01:34-37`）：有界区域的坐标函数是处处独立的有界全纯坐标；负曲率 uniformization 问题问曲率与完备能否逼出这种坐标；维 1 答案是圆盘，高维里"有界全纯坐标的存在是 separate global analytic requirement"。术语约定：sectional curvature 指底层实 Riemannian 度量、completeness 指测地完备、bounded holomorphic map 指欧氏目标里像集有界。

五条障碍我在第 0 节已经引全（Mostow-Siu/Deraux 只排球、内在度量比较给不出固定 tuple、姊妹论文的单侧 Liouville 型、Hao-Chen-Wang 系列假设丛曲率决定底度量、Hedenmalm 的代表测度不满足对数不等式）。这里补第五障碍的原文（`01:136-139`）：

> The probabilities preserve
> holomorphic evaluation at the origin, but such
> measures need not preserve the logarithmic mean inequality for
> holomorphic functions: Hedenmalm gives an explicit example of this
> distinction \cite[Theorem~3.7]{Hedenmalm1989}.

它和 §5 开头那句（`05:17-19`）呼应："Here we need smooth logarithmic tests and negative bounds that persist through all later density corrections. We prove these properties directly for the densities of Theorem~\ref{density:main}."。我读这两句合起来读出的态度是：作者知道 Jensen 结构在代表测度上不可用，主动选择逐密度硬证负平均，用相位频率分离（`lem tests:later`）把负性传给后续密度。

构造自述（`01:123-133`）是解析任务的精确规格：

> The analytic task is to choose $\phi$ so that it has these derivative
> bounds but cannot dominate a holomorphic real part, even after adding
> the logarithmic boundary allowance forced by Cauchy's estimate for a
> Jacobian. To do this, we construct radii $r_N\uparrow1$ and positive
> probabilities $\mu_N$ on the unit sphere $S\subset\C^2$ such that ... $\longrightarrow-\infty$, while $\int_S\operatorname{Re}H(r_N\xi)\,d\mu_N(\xi)=\operatorname{Re}H(0)$ for every holomorphic $H$ on $\B$.

"the logarithmic boundary allowance forced by Cauchy's estimate"这句确认了我在 §1 的读法：$4\log$ 不是自由选择，是被 Cauchy 逼定。构造分层自述（`01:141-155`）与几何任务自述（`01:157-167`，"After rescaling the base directions, the leading expression is nonnegative but can vanish on planes with nonzero base and fiber projections. On these limiting planes the contribution of the potentially largest error term vanishes as well."）分别对应第 5-6 节与第 10 节。

文献谱系（`03.3` 核对 bib）：问题来自 `WuNormal1967`（问题(1) p.195）与 `WuYauSurvey2019`（Conjecture 4.3, p.18）/`WuYauInvariant2020`；对照正例维 1；刚性对照 `MostowSiu1980`、`Deraux2005`；内在度量 `GreeneWu1979`、`WuYauInvariant2020`；Levi/Stein `GrauertLevi1958`；构造骨架 `Calabi1979` + `HwangSinger2002`；解析峰与幂和 `RyllWojtaszczyk1983`（`[Section~2]`、`[p.~112 and Lemma~2.7]`）+ `Aleksandrov1983`（`[Lemmas~2--3]`，各向异性球里的峰）；反 Jensen 姿态 `Hedenmalm1989`；近邻 pinching `HaoChenWang2025`、`HaoChenWangZhang2026`；姊妹论文 `OpenAIOneSided2026`。`[推测]` 谱系判断：骨架是 Calabi 位势 + Hwang-Singer 动量形式，解析峰直接沿 Ryll-Wojtaszczyk 的射影 packing + 幂和，Hao-Chen-Wang 系列是作者明确"要超越其独立性假设"的近邻工作。

`[推测]` 时间线重建（论文未述，按论证依赖反推我的思考顺序）：
1. `[推测]` 先确立归约骨架：Cauchy 估计给 $|d|\le C\delta^{-2}e^{\phi/2}$，取对数平方必是 $4\log\frac1{1-|z|}+\phi+$ 常数 ⇒ 反推需要"无 pluriharmonic 下界"的 $\phi$，且 $4\log$ 系数被 Cauchy 逼定。这一步决定 $u=\phi+4\log$。
2. `[推测]` 再发现"代表测度 + 负平均"引擎（`peaks:mean-criterion`）足以把"无下界"翻译成可构造条件；确认 Hedenmalm 反例意味着不能用 Jensen，得逐密度硬做。
3. `[推测]` 设计峰多项式（借 Ryll-Wojtaszczyk），发现需要 patch 内径向校正消全纯矩，$b'-b=f$ 与加权抵消为此而生。
4. `[推测]` 为让负对数平均活过后续密度修正，构造 $k_j=Q^j$ 指数分离次数，使频率间隙 $(Q-2)k_j$ 可控（`lem tests:later`）。
5. `[推测]` 几何侧先建 Hartogs 度量与完备性（§7，独立于大 $\lambda$），再算张量（§8），最后逼出"退化平面 $T_3$ 额外消失"这一 pinching 关键引理（§9 `pinch:algebra` 等号分类）。
6. `[推测]` 维度 3 的选择：纤维 1 维 + 基 2 维使 $a_V=b_V^2$（复秩 1）成立，是 `pinch:algebra` 等号分类与 $K\in[-2,-1/2]$ 极限区间的结构前提，更高纤维维可能失效。

## 12 常数与参数台账

下表把全篇被固定选择的量按选择顺序列全，标明来源与敏感度；论文未证最优处我标 `[推测]`（数值最优多半是我外部推算，论文只证存在性与可用性）。

| 对象 | 值（论文） | 来源 | 用途 | 敏感度（改动后果） |
|---|---|---|---|---|
| $a$ | $1<a<2$（Lean 取 $3/2$） | `peaks:profiles` | 定 $\alpha=\log a$、$\Delta$ | $a\ge2$ 时 $s_1(1-e^{-\alpha})<e^{-\alpha}$ 可能选不到足够小 $N$ [推测] |
| $\alpha=\log a$ | $\log(3/2)$ | 同上 | 出现在 negativity、$f$ plateau 长 | 与 $s_1$ 一起进 $\Delta$ |
| $s_1$ | $\frac{\alpha^2}{2(\cosh\alpha-1)}<s_1<1$ | `peaks:profiles` | 定 $\Delta$ 大小 | 出窗 ⇒ $I_0(1)>0$、负平均崩 |
| $\Delta=2s_1(\cosh\alpha-1)-\alpha^2$ | $>0$ | `peaks:profile-negativity` | 每测试负平均预算 $d_2=\Delta/(2D_0^2)$ | $\Delta\to0$ 令 $d_2\to0$、$L$ 需求超大 |
| $f,b,R_0$ | $b'-b=f,\int e^{-y}f=0$ | `peaks:profiles` | $U_k$ 径向因子、矩抵消 | 抵消失效 ⇒ $b$ 失紧支 ⇒ 代表崩 |
| $c_0=\frac{1-\|f\|_\infty}{4}$ | $>0$ | §4 定义 | patch 宽度、$K_*>2C_2/c_0$ | $\|f\|_\infty\to1$ ⇒ $c_0\to0$ ⇒ 正性间隙消失 |
| $D_0$ | $>\max\{1,2\sqrt{2R_0}\}$ | §3/§4 | patch 互斥、单峰近似误差 | 越大单峰近似越好（$C,c$ 与 $D_0$ 无关才允许扩） |
| $k_j=Q^j,\ell_j$ | 次数阶梯 | `density:degrees` | 带宽隔离 $\ell_{j-1}<k_j,\ell_j<2k_j$ | 非指数分离 ⇒ 两几何级数不收敛 |
| $Q$ | $\ge Q_0,\ge k_*,\ge Q_*$ | `density:main`/`tests:negative`/`tests:later` | 频率间隙 $(Q-2)k_j$ | $Q<2$ ⇒ 矩/幂律界断；$Q$ 不够大 ⇒ 频率共振 |
| $K_*$ | $>2C_2/c_0$ | `density:main` | 导数归纳常数 | 必须先于 $Q_0$ 固定（否则循环） |
| $C_2=2D_R[4(F+B)+F_1+B_1]$ | patch 导数界 | `density:normalized-patch` | 定 $K_*$ | 只依赖固定 patch 数据（关键：不含 $K_*$） |
| $\epsilon,\eta$ | $\epsilon\le\sqrt{\Delta/(8C_{\rm off})},\eta<1/2$ | `tests:negative` | 令 $|I_\epsilon(1)+\Delta|\le\Delta/8$、$I_\epsilon(\rho)\le-3\Delta/4$ | $\epsilon$ 必须先于 $D_0$ 选；$\epsilon\to0$ 令 $Q_*$ 爆炸 |
| $D_*,k_*$ | 阈值 | `tests:negative` | 压 patch 误差各 $\le\Delta/16$ | 依赖固定轮廓 |
| $d_2=\Delta/(2D_0^2)$ | 单尺度负平均率 | `tests:negative` | 单位 patch 平均 $\le-d_2$ | 与 $j$、与增大 $Q$ 无关（关键） |
| $d_3=d_2/2$ | 稳定负平均率 | `tests:later` | 抗后续密度 | 留一半给 Fourier 尾 |
| $B_\epsilon=\frac{2aC_P}{\epsilon^2}+\frac{4a^2C_P^2}{\epsilon^4}$ | Fourier 尾常数 | `tests:later` | 定 $Q_*$ | 依赖 $\epsilon^{-4}$，决定 $Q_*$ 多大 |
| $L$ | $>5\log Q/d_3$ | `base:amplitude` | 负平均压过边界容许 | 系数 $5\log Q-Ld_3$ 的符号；5 来自 $\psi+4\log$ 合并 [推测] |
| $\lambda$ | $\ge\lambda_0(c,C,C_{\rm e})$ | `pinch:positivity` | 曲率压负 | 必须最后选、在解析链之外 |
| $C_{\rm e}$ | `metricErrorConstant` | `curv:errors` | 乘 162 进 pinching | 来自 `base:jets` |
| 放大器 $162$ | $=2\times81$（Lean 硬编码） | §9 | 局部框架误差压进阈值 | Lean 字面量，论文未给 81 的显式来源 [推测] |
| $K$（极限截面曲率） | $\in[-2,-1/2]$ | `pinch:tensor-limit` | 双侧界具体钳制 | 纤维维 1 使 $b_V^2=a_V$ |

敏感度总结（我的判断，`[推测]` 标注者非论文断言）：真正不可移动的三处是 $4\log$（Cauchy 逼定）、$c=1$（$\phi\ge\psi$ 逼定）、选择顺序链（$C_2\to K_*\to C_1\to Q_0$、$\epsilon$ 先于 $D_0$、$\lambda$ 最后）。其余常数（$\Delta,D_0,Q,L$ 阈值、162、$[-2,-1/2]$）都是"存在即可"的量，论文未主张任何数值最优。`[推测]` 162 与 $[-2,-1/2]$ 的具体数字我倾向认为可以优化，但优化它们不给本定理任何东西，所以作者取了一个能跑通的硬编码值。

## 13 Lean 取证

顶层认证定理：`OAI.PinchedHartogs.main_theorem`（命名空间 PinchedHartogs，"Hartogs"点明构造载体）。比对配置 `ComparatorChallenges\PinchedKahler.json`：三个目标定理 `main_theorem`、`controlled_potential`、`metric_transfer`，`definition_names: []`，`permitted_axioms: ["propext","Quot.sound","Classical.choice"]`，`enable_nanoda: false`（未走 DaS 自动战术，全人工证明）。

一处取证数据我必须如实记下并解释：素材头部写"$E:\math\lean\OAI\Geometry\Kahler$ 108 个 `.lean`、约 18,688 行"，而素材 §4.1 表格又写"36 个 `.lean`、约 6000 行，全部 sorry-free"。我实测该目录 `ls *.lean | wc -l` = 119 个文件、`cat *.lean | wc -l` = 18,688 行。`[推测]` 差异来源：36/6000 那一栏统计的是"直接对应论文构件的核心模块子集"（`Main`、`Definitions`、`Obstruction`、各 `Base*` 核心、`Hartogs*` 核心、`Pinching*` 核心），而 119/18688 是全目录（含 `BaseAdaptedHopf`、`BaseAnisotropic`、`BaseCauchyJets`、`BaseChart*` 等大量支持引理文件）。我采用全目录口径 119/18688 为准，18,688 行数与素材头部一致可作交叉验证；36/6000 是子集口径，两者不矛盾但需注明。

核心模块按论文构件归类（关键定理与行号，全部 sorry-free）：

| 论文构件 | 文件（行数） | 关键定理/定义 |
|---|---|---|
| 主定理 | `Main.lean` (44) | `controlled_potential` (:23)、`main_theorem` (:38) |
| 定义 | `Definitions.lean` (158) | `hartogs` (:18)、`sectional` (:66)、`IsNegativelyPinched` (:86)、`MainTheorem` (:100)、`ControlledPotential` (:142)、`MetricTransfer` (:146) |
| 障碍引理 | `Obstruction.lean` (273) | `map_obstruction` (:249)、`jacobian_log_bound` (:228)、`exists_holomorphic_log` (:50) |
| §3 峰 | `BasePeaks.lean` (186)、`BaseSets.lean` (377) | `homogeneousPeak`/`meanCriterion`/`projectivelySeparated`/`patchSet` |
| §3 轮廓 | `BaseProfiles.lean` (295) | `RadialProfiles` (:172)、`cosh_strict_quadratic` (:20)、`exists_radialProfiles` (:196) |
| §4 密度 | `BaseDensityDefinitions.lean` (56)、`BaseDensityInduction.lean` (285)、`BaseDensityTheorem.lean` (157)、`BaseSeparation.lean` (254) | `density` 递归 (:38)、`DensityStage` (:20)、`density_induction` (:26)、`uniform_representing_densities` (:20) |
| §5 测试 | `BaseLogTests.lean` (137)、`BaseMeans.lean` (45)、`BaseModelParameters.lean` (54)、`BaseTestSystem.lean` (127) | `TestSystem` (:20)、`exists_testSystem` (:44)、`Represents` (:25)、`modelGap` (:29) |
| §6 位势 | `BaseMinorant.lean` (181)、`BaseChartEstimates.lean` (209) | `TestSystem.noMinorant` (:65)、`series_mean_bound` (:20) |
| §7-§8 Hartogs | `MetricCalculus.lean` (1513)、`HartogsCompletenessSupport.lean` (356)、`HartogsMetric.lean` (218) | `hartogsMetric_isKahler` (:805)、`hartogsMetric_geodesicallyComplete` (:319) |
| §8 框架/误差 | `LocalFrame.lean` (594)、`LocalFrameTools.lean` (317)、`ErrorTerms.lean` (111)、`MetricError.lean` (92)、`HartogsGaugeTransfer.lean` (89) | 曲率张量分解、误差常数 |
| §9 pinching | `PinchingAlgebra.lean` (311)、`PinchingCompact.lean` (2889)、`PinchingEstimates.lean` (301)、`PinchingLimit.lean` (94) | `pinchingThreshold` (:591)、`errorCoefficient` (:586)、`thresholdGap` (:588)、`curvatureModel_uniform_pinching` (:2814) |
| §2 迁移 | `HartogsTransfer.lean` (49)、`HartogsFrame.lean` (138)、`HartogsPinching.lean` (90) 等 | `metric_transfer` (:22)、`main_of_controlledPotential` (:32)、`metricErrorConstant` (:97) |

依赖拓扑：底座链（§3-§6，`BaseRealPair/BaseSets/BasePeaks/BaseProfiles/BaseDensity*/BaseMeans/BaseLogTests/BaseModelParameters/BaseChartEstimates/BaseTestSystem/BaseMinorant`）与度量链（§7-§9，`ErrorTerms/MetricError/LocalFrame*/Pinching*/HartogsMetric/HartogsCharts/MetricCalculus/HartogsCompletenessSupport/HartogsFrame/HartogsPinching/HartogsTransfer`）两条链在 `Main.lean` 汇合。`Definitions → {HartogsMetric, LocalFrame}`，`Obstruction → {Definitions}`，`HartogsTopologySupport → {Definitions, Obstruction}`，`Main → {BaseMinorant, BaseProfiles, BaseTestSystem, Definitions, HartogsTransfer, HartogsTopologySupport, LocalFrame}`。两条跨接缝边：`BaseLogTests → HartogsTransferTools`（底座 §5 借度量侧工具）、`HartogsGaugeTransfer → BaseMinorant`（度量侧 §8 规约回底座 §6 的 noMinorant），正是"基底构造 ⇄ 度量计算"耦合的镜像。

形式陈述 vs 论文措辞的六处差异（取证重点）：
1. `MainTheorem`（`Definitions.lean:100`）把几何对象拆成八个分量合取 `IsOpen M ∧ Nonempty ∧ ContractibleSpace M ∧ IsKahlerMetric g ∧ GeodesicallyComplete g ∧ IsNegativelyPinched ∧ NoBoundedCoordinates ∧ ¬BiholomorphicToBoundedDomain`；论文只写"可缩区域 + 完备负 pinched + 双全纯排除"，`¬BiholomorphicToBoundedDomain` 需经 `BaseBiholomorphism` 单独证，不像论文当作显然。
2. `NoBoundedCoordinates`（:90）：论文"$F$ 每点非零 Jacobian"= Lean `∀ p∈M, jacobian F p≠0`，`jacobian`（:28）用 `fderiv ℝ` 实 Fréchet 导取 `LinearMap.det`，与复 Jacobian 等价但走实映射行列式。
3. `sectional`（:66）：因子 2 约定硬编进定义 `.../(2*realArea (g p) u v)`，与论文 $K=\mathcal H_R/(2a_{\widehat g})$ 对齐；`IsNegativelyPinched`（:86）用 `LinearIndependent ℝ ![u,v]` 表达实 2 平面。
4. `ControlledPotential`（:142）把 $c$ 钉死为 1，只剩 $C$ 与 $L$ 的自由度；`Main.lean:25 let L := (5*Real.log (S.Q:ℝ))/S.d+1`，`+1` 保证严格 $5\log Q<Ld$。
5. `MetricTransfer`（:146）：论文存在式 $\exists B,A$ 在 Lean 里把 $A,C$ 作输入（`1 ≤ C` 后调 `metric_transfer 1 C`），$B$ 由 `metricThreshold`/`pinchingThreshold` 显式给出。
6. `noMinorant`（`BaseMinorant.lean:65`）：论文"$u$ 不承认任何全纯实部下界"= 一个关于 `AnalyticOnNhd` 的实部下界的 `∀` 否定式，Lean 用序列平均 $-dN+T$（`series_mean_bound`:20）逼近。

卡点与非常规编码：
- 非构造选择（`Classical.choice` 许可）：`BaseTestSystem.lean:78 choose P hP using hex`（选 $\mathcal P_k$）、`HartogsCompletenessSupport.lean:133`、:201（测地线 $\gamma$ 存在）、`PinchingEstimates.lean:257`、`PinchingLimit.lean:76`、`Obstruction.lean:60`。这些把"取一列""存在 $\mathcal P_k$"落成 choice。
- 唯一 `Subsingleton.elim`（`HartogsCharts.lean:116`）：`exact (hij (Subsingleton.elim _ _)).elim`，把"某 chart jet 等式在两个等价写法上成立"经证明唯一性消去一个 proof-irrelevant 参数不等；全模块仅此一处依赖命题外延/证明不相关性，对应论文"该估计对所有等价写法一致"的省略。
- 可缩性：`simplyConnected_ball := convex_ball.contractibleSpace`（`Obstruction.lean:22`），直接调 Mathlib 球可缩实例。
- 常数落地：`a := 3/2`（`BaseTestSystem.lean:46`）；`Q := max Q₀ (max nD (M+3))`（:63）；`D := max D_star (2*sqrt(2*pr.R)+1)`（:52）；`modelGap`（`BaseModelParameters.lean:29`）= 论文 $\Delta$；`metricErrorConstant c C := 9*(C+4*C^2/c)`、`metricThreshold := pinchingThreshold c C (162*metricErrorConstant c C)`（`HartogsFrame.lean:97,98`，162 硬编码字面量）；`errorCoefficient c E := E+E^2/(2*c)`、`thresholdGap := c^3/(8*(2*(errorCoefficient c E+1)+C))`、`pinchingThreshold` 四档 max（`PinchingCompact.lean:586,588,591`，我实测核对）；`hamp`（`Main.lean:29`）是 `base:amplitude` 的可执行版。
- 语义间隙（Lean 侧公理化）：论文 `peaks:profiles` 的 $f,b$ 具体解析构造在 Lean 里以 `Real.smoothTransition` + `ContDiffOn ℝ 4` 公理化给出（`RadialProfiles` 字段 plateau/cancellation/ode/b_zero/tail/negativity 逐条对应，`cosh_strict_quadratic` 用 `Real.hasSum_cosh` 级数前三项证 $x^2<2(\cosh x-1)$）；`density:main` 的微分算子正定性由 `DensityStage.positive` 假设化，未从 Fourier 展开重建。这两处是"论文构造 ⇄ Lean 公理"最大的语义间隙，我把它如实登记，并非粉饰。

`[推测]` 我对取证的一句判断：难点集中在 `PinchingCompact.lean`（2889 行，纯代数不等式机器）与 `MetricCalculus.lean`（1513 行，张量分解），这与我写论文时的体感一致，几何侧的机器量远大于解析侧，因为 §9 的两 regime 反证在 Lean 里要把所有紧性、闭性、比例论证逐条落成不等式。

## 14 剩下的悬案，以及我若继续做的三条岔路

悬案（论文未解决、我在笔记里也不假装解决的）：

1. 维数。我的构造锁死在基 2 维 + 纤维 1 维（复三维）。`[推测]` 第 10 节 `lem curv:gram` 与 `pinch:algebra` 的核心是 $a_V=b_V^2$（竖直形式复秩 1），纤维维 $\ge2$ 时该等号失，等号分类（要混合块全零）断，$K\in[-2,-1/2]$ 区间也失去。但这是"我的证明断"，不是"命题假"。
2. 最优常数。$\Delta$、$d_2=\Delta/(2D_0^2)$、$L>5\log Q/d_3$、$\lambda_0$、162、$[-2,-1/2]$ 全无最优性主张。`[推测]` 我判断都可优化，但优化不产出新定理，所以未做。
3. 有界伪凸性。Wu-Yau 猜想 4.3 的结论是"有界伪凸区域"。我否定的是更强的"任何有界区域"，所以伪凸性自动被排除，但我的方法对"是否存在不完备但伪凸的中间情形"没有任何话。
4. 障碍的精确强度。主定理只排除"处处独立微分的固定三元组"，$M$ 上仍有 $z_1,z_2$ 两个非常值有界全纯函数、仍是 Stein。`[推测]` "Stein + 双侧负 pinching + 可缩"这一组合到底缺哪一维的坐标，我没有刻画。

我若继续做的三条岔路（方向陈述，非承诺）：

- 岔路一（攻纤维维）。把竖直 Hermitian 形式从复秩 1 推到秩 $m$，重做 `pinch:algebra`。要补的是 `curv:gram` 的等号分类：秩 $m$ 时 $m_P\ge2\sqrt{a_Pa_V}$ 的等号条件变成"$V$-Gram 落在 $P$-Gram 的某个秩-$m$ 锥里"，配方 $-4|b_E|\sqrt U$ 那一手可能不够。我估计需要引入 Plücker 坐标描述混合块 $\Xi$ 的高秩零集；这是纯代数活，可能通，也可能像现在这样卡在 $b_V^2=a_V$ 这一条上根本不可约。
- 岔路二（换引擎）。放弃"代表测度 + 逐密度负平均"，试 Bergman 空间里的显式极值函数或内蕴不变量造无坐标障碍。`[推测]` 我不看好：第 0 节障碍 2 已经说明内在度量比较给不出固定 tuple，任何走比较定理的路最多拿到逐点信息，产不出对"所有有界三元组"的否定。但把引擎换成一个不依赖 $k_j=Q^j$ 指数分离的方案（例如让 $Q$ 依赖 stage）值得探，因为它可能松动选择顺序链里"$K_*$ 必须先于 $Q_0$"这一硬约束。
- 岔路三（合并姊妹论文）。`01:85-87` 已声明两构造与两证明独立。`[推测]` 我判断不能直接合并（一侧要曲率下界无界、一侧要双侧有限，对域形状要求相反），但存在一个折中目标值得单独试：造一个双侧 pinched、且非平凡有界全纯函数少于三个的区域。这介于两篇之间，若成，会给"pinching 逼出多少坐标"一个定量答案。这条我最想试，也最没把握，因为它可能要 §9 之外的新曲率机器。

我把第 12 节末尾那句话留在这里作结：整篇构造里真正被数学本身钉死的只有三个量（$4\log$ 的系数、$c=1$、参数选择顺序），其余全是"存在即可"。识别哪几个数字是硬的、哪几个只是我随手取的，是这次做完之后我最想清楚的一件事。

## 15 常数与参数台账（文末逐字合规版）

第 12 节已有台账，但它的列名（对象/值(论文)/来源/用途/敏感度）不合验收口径，且"来源"一栏记的是 tex 标签名。本节按"符号定位"重做一版：每行的位置我逐条回 `build\sections` 下的 tex 核过真实文件与行号，核不过的直接不收录（第 12 节的放大器 162 一栏即属此类，见 15.3）。两表视角差异在 15.3 说明，第 12 节一字未动。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $0<A\le B$ | 只主张存在有限双侧界，论文未给数值 | 01-introduction.tex:39-44; 09-pinching.tex:443-446 | 主定理 pinching 断言; prop metric:transfer 外壳 02-reduction.tex:94-100 | 紧段界与尾段界合并那步塌：任一侧给不出 $A>0$ 或 $B<\infty$，定理退化为单侧 |
| $-3\le K_g\le-1/4$ | 尾部 $x\ge X_\lambda$ 的显式夹紧（对固定 $\lambda$） | 09-pinching.tex:439-442 | 09-pinching.tex:443-446 与紧段合并产出 $A,B$ | 该区间若越出 $(-\infty,0)$，$A$ 的下界在这一步没处取 |
| $K_\infty$ 极限区间 | $\in[-2,-1/2]$，由 $K=-\frac12\left(1+3\,\frac{b_{h+V}^2}{a_{h+V}}\right)$ 与 Gram $0\le b^2/a\le1$ | 09-pinching.tex:426-430 | 尾段一致收敛论证 09-pinching.tex:432-438 | 这是结论侧常数；若极限张量偏离 $-S_{h+V}$（即 pinch:metric-limit 09-pinching.tex:398-403 或 pinch:D-limit 09-pinching.tex:410-414 断），区间无定，尾段失去模型 |
| $\operatorname{Ric}_g$ | 论文无 Ricci 引理；对实 6 维切空间逐方向求和可由截面界导出 $6$ 倍量级双侧界 | 01-introduction.tex:41-44（唯一可追溯输入） | 无引理消费它；Lean 的 IsNegativelyPinched 也只用截面 | 若把假设换成 Ricci 版本：pinch:positivity 两 regime 反证全断，反证需要逐平面 $F=-\mathcal H_R\le0$，Ricci 平均值保留不下这个信息 |
| $\psi(z)=-\log(1-\lvert z\rvert^2)$ | 双曲模型位势，归一由 $\B\subset\C^2$ 单位球钉死 | 02-reduction.tex:13-15; 01-introduction.tex:97 | $I$、$\mathcal K_\lambda$、06-base-potential.tex:84-88 的对数增长 $\psi(r_N\xi)\le\log(k_N/\eta)$ | 换模型则 $\bigl(I^{-1}\bigr)$ 范数恒等式 07-hartogs-metric.tex:101-104 与极限区间都要重推 |
| $I=(\psi_{i\bar j})$ | 中心化球坐标原点处：单位矩阵、一阶导为零 | 02-reduction.tex:16; 02-reduction.tex:33-36 | curv:tensor 主项 $\lambda S_I$（08-curvature.tex:80-83）; pinch:metric-limit 09-pinching.tex:398-403 | 原点归一失效则 §8 的分块记账（哪些项为零）失效 |
| $t=e^{\phi}\lvert w\rvert^2$，$M_\phi=\{t<1\}$，$\mathcal K_\lambda=\lambda\psi-\log(1-t)$ | Hartogs 域与位势骨架 | 02-reduction.tex:71-79; 07-hartogs-metric.tex:12-19 | §7 全部（余框架 $\vartheta$、正定性、exhaustion）; §8-§9 度量 $G=\lambda I+xh$ | 动任一参数则 $\vartheta\otimes\bar\vartheta$ 公式 07-hartogs-metric.tex:44-48 与曲率分解同时重写 |
| 维数：基 $\B\subset\C^2$、$M\subset\C^3$ | 基 2 复维 + 纤维 1 复维 = 3 | 02-reduction.tex:13; 01-introduction.tex:40 | $N_k\asymp k/D_0^2$ 用基维 2（03-peaks.tex:96-97）; $a_V=b_V^2$ 用纤维维 1（08-curvature.tex:312-314） | 纤维维 $\ge2$ 时 09-pinching.tex:103 的 $U=b_V^2$ 一步断，pinch:algebra 等号分类失去；基维 1 时峰分离机器退化 |
| Kähler 结构 | $\widehat g=\partial\bar\partial\mathcal K$；$R$ 仅 $(2,2)$ 型分量；Kähler 对称减独立分量 | 07-hartogs-metric.tex:64-65; 08-curvature.tex:59-64; 08-curvature.tex:84-85 | $\mathcal H_T$ 收缩定义 08-curvature.tex:246-250; pinch:positivity 对称性假设 09-pinching.tex:175-177 | 换实度量则坐标公式（08-curvature.tex:59-64）不成立，§8 张量分解与分块误差整段塌 |
| $g=2\operatorname{Re}\widehat g$ | 实度量约定，因子 2；实平方面积 $=4a_{\widehat g}$ | 02-reduction.tex:81-84; 08-curvature.tex:244-245 | curv:sectional $K=\mathcal H_R/(2a_{\widehat g})$（08-curvature.tex:255-261）; metric:gradient-convention 07-hartogs-metric.tex:79-87 | 因子变动则 $[-2,-1/2]$、$[-3,-1/4]$、$2t<2$ 全体数值口径平移，模型检验 $4+4+4-12=0$（09-pinching.tex:19-31）失配 |
| $\sigma$ | 归一表面测度：$d\sigma=du\,\frac{d\theta}{2\pi}\frac{d\gamma}{2\pi}$，总质量 1；射影帽测度 $=s^2$ | 03-peaks.tex:72-80 | 一切平均积分：05-logarithmic-tests.tex:96-100; representing 概率 04-densities-construction.tex:133-137 | 归一变化则加权消去 $\int e^{-y}f=0$ 的配重与矩恒等式全部重推 |
| $P_k$，$N_k$ | $P_k=\sum_{\mathcal P_k}\langle z,p\rangle^k$；$\frac{k}{D_0^2}\le N_k\le\frac{4k}{D_0^2}$ | 03-peaks.tex:82-98 | $d_2$ 的 $N_k/k$ 下界（05-logarithmic-tests.tex:207-212） | $N_k$ 增长率变则 $\frac{\Delta}{2D_0^2}$ 系数直接被改写 |
| $C_P$ | 固定满足 $\lvert P_k(z)\rvert\le C_P\lvert z\rvert^k$ | 05-logarithmic-tests.tex:21-22; 出处 03-peaks.tex:105-108 | $B_\epsilon$（05-logarithmic-tests.tex:241-247）; 指数衰减 06-base-potential.tex:146、163 | $Q_*$ 经 $C_P^2/\epsilon^4$ 放大，$C_P$ 翻倍则 $Q_*$ 需求约四倍 |
| $a$，$\alpha=\log a$ | $1<a<2$ 自由选；$a<2$ 保 $s_1(1-e^{-\alpha})<e^{-\alpha}$ | 03-peaks.tex:209; 03-peaks.tex:229-230 | plateau 长 $[0,\alpha]$（03-peaks.tex:215、263-265）; $N$ 的选取（03-peaks.tex:231-241） | $a\ge2$ 时 $N$ 窗口可能为空，轮廓构造断在第一步 |
| $f,b,R_0$ | $\lVert f\rVert_\infty<1$，$f=-s_1$ 于 $[0,\alpha]$，$\int e^{-y}f=0$，$b'-b=f$，$b(0)=0$，支集 $\subset[0,R_0]$ | 03-peaks.tex:210-222; 构造 03-peaks.tex:249-260 | density 递归系数（04-densities-construction.tex:30-43）; $c_0$、$D_0$、$B_\epsilon$ | 消失去效则 $b$ 非紧支，$W_j$ 光滑性与 representing 性同时断 |
| $s_1$ | $\frac{\alpha^2}{2(\cosh\alpha-1)}<s_1<1$，严格开窗 | 03-peaks.tex:224-228; 需求 03-peaks.tex:211-213 | $\Delta$（05-logarithmic-tests.tex:106-109） | 出窗则 $\Delta\le0$，整条解析链没有负量可用 |
| $\Delta$ | $=2s_1(\cosh\alpha-1)-\alpha^2>0$；模型恒等 $I_0(1)=-\Delta$ | 05-logarithmic-tests.tex:106-109; 05-logarithmic-tests.tex:135-143 | $\epsilon,\eta,D_*,k_*$ 的预算 $\Delta/8$、$\Delta/16$（05-logarithmic-tests.tex:192-204）; $d_2$ | 所有预算同比缩放；$\Delta\to0$ 拉爆 $L$ 与 $Q_*$ |
| $\int_0^\infty e^{-y}f(y)\,dy=0$ | 加权消去 | 03-peaks.tex:214-218 | tests:model-sign（05-logarithmic-tests.tex:130-143）; 矩保持（04-densities-construction.tex:133-137）; 递归系数 $f-(s/k)b$（04-densities-construction.tex:36-43） | 失效则 $I_0(1)$ 不再等于 $-\Delta$，负平均没有基准值 |
| $c_0$ | $=\frac{1-\lVert f\rVert_\infty}{4}>0$ | 04-densities-construction.tex:10-14 | $K_*>2C_2/c_0$（04-densities-estimates.tex:207-209）; $Q^{-1/2}\le c_0/2$ 与 $H(Q)(F+BK_*/Q)\le1-2c_0$（04-densities-estimates.tex:230-237） | 窗口关闭则 $W_j>0$ 归纳断，正代表密度定理失去 |
| $D_0$ | $>\max\{1,2\sqrt{2R_0}\}$；§3 处还要求 $k\ge D_0^2$ | 04-densities-construction.tex:15; 03-peaks.tex:82-84 | patch 互斥（03-peaks.tex:113-114）; $d_2$; 单峰近似误差（05-logarithmic-tests.tex:184-187） | 缩小增大 $d_2$ 但指数近似失效；且 $\epsilon$ 必须先于 $D_0$ 选（05-logarithmic-tests.tex:86-89） |
| $\epsilon$，$C_{\rm off}$ | $\epsilon\in(0,1]$ 定 $\lvert I_\epsilon(1)+\Delta\rvert\le\Delta/8$ 与 $C_{\rm off}\epsilon^2\le\Delta/8$；$C_{\rm off}$ 独立于 $D_0,k,\rho,\epsilon$ | 05-logarithmic-tests.tex:124、192-196; $C_{\rm off}$ 出处 05-logarithmic-tests.tex:165-169 | $I_\epsilon(\rho)\le-3\Delta/4$ 窗口（05-logarithmic-tests.tex:197-199）; $B_\epsilon\sim\epsilon^{-4}$ | 若把 $\epsilon$ 放到 $D_0$ 之后选，单峰近似不再对固定光滑对数一致成立（05-logarithmic-tests.tex:86-89）；受控收敛那步（05:124-128）失去抓手 |
| $\eta$ | $\in(0,1/2)$，使 $1-\eta\le\rho\le1$ 时 $I_\epsilon(\rho)\le-3\Delta/4$ | 05-logarithmic-tests.tex:92-95、197-199 | 负平均带 05-logarithmic-tests.tex:96-100; $r_N=1-\eta/k_N$（06-base-potential.tex:58-61）; 尾部 $e^{-\eta Q^m}$（06-base-potential.tex:70-73） | Bernoulli 不等式（06-base-potential.tex:62-67）断，$C_{\rm tail}$ 膨胀 |
| $D_*$，$k_*$ | $D_*$ 使 patch 几何误差 $\le\Delta/16$；$k_*$ 使 $1/k$ 误差 $\le\Delta/16$ | 05-logarithmic-tests.tex:92-95、200-204 | prop tests:negative 对一切 $D_0\ge D_*$ 生效 | 预算被吃穿：$\Delta/2$ 主项抵不过误差 |
| $d_2$ | $=\Delta/(2D_0^2)$；与 $j$ 无关、与进一步增大 $Q$ 无关 | 05-logarithmic-tests.tex:207-212; 独立性声明 05-logarithmic-tests.tex:101-102 | $d_3$、$L$ 阈值（06-base-potential.tex:48-54） | 若依赖 $j$ 或 $Q$，$\phi$ 的级数逐尺度累负平均发散不成 $-\infty$ |
| $d_3$ | $=d_2/2$ | 05-logarithmic-tests.tex:215-217 | tests:later-negative（05-logarithmic-tests.tex:220-224）; $L>5\log Q/d_3$ | 分一半给 Fourier 尾；调分配则 05-logarithmic-tests.tex:273 的 $Q_*$ 不等式随之改 |
| $B_\epsilon$ | $=\frac{2aC_P}{\epsilon^2}+\frac{4a^2C_P^2}{\epsilon^4}$；Fourier 系数 $\le B_\epsilon/m^2$ | 05-logarithmic-tests.tex:241-250 | 截断误差 $\frac{4B_\epsilon}{Q-3}$（05-logarithmic-tests.tex:262-272）定 $Q_*$ | $\epsilon^{-4}$ 增长率决定 $Q_*$ 的规模；$B_\epsilon\to\infty$ 则尾部平均杀不掉 |
| $Q_*$ | 使 $\frac{4B_\epsilon}{Q-3}\le d_2/2$ 且 $Q\ge4$ | 05-logarithmic-tests.tex:227-229、273-274 | tests:later-negative 对 $Q\ge Q_*$ 成立 | 取小则后续密度污染单尺度负平均 |
| $k_j$，$\ell_j$ | $k_j=Q^j$，$\ell_j=\sum_{l\le j}k_l$；$\ell_{j-1}<k_j$、$\ell_j<2k_j$ | 04-densities-construction.tex:18-22 | 频率间隙 $(Q-2)k_j$（05-logarithmic-tests.tex:229-234） | 非指数分离则间隙 $\le0$，相位平均无法让 $W_N-W_j$ 的矩消掉 |
| $Q$，$Q_0$，$H(Q)$ | 六条件：$Q\ge2$、$H(Q)\le2$、$K_*/Q\le1$、$C_1/Q^2\le1$、$Q^{-1/2}\le c_0/2$、$H(Q)(F+BK_*/Q)\le1-2c_0$；$H(Q)=\exp(K_*D_R/\sqrt Q+2R_0/Q)\to1$ | 04-densities-estimates.tex:223-239; 相容性 $F=1-4c_0<1-2c_0$ 04-densities-estimates.tex:238-239 | thm density:main 正性归纳（04-densities-construction.tex:98-120）; 中心比较（04-densities-estimates.tex:215-222） | 六条任一条失，归纳假设 $r_1,r_2\le1$ 传不到下一层 |
| $K_*$ | $>2C_2/c_0$；必须先于 $Q_0$ 固定 | 04-densities-estimates.tex:207-209 | 导数界 $\lvert ZW_j\rvert\le K_*\sqrt{k_j}W_j$（04-densities-construction.tex:111-120）; $H(Q)$ | 顺序颠倒则 $C_2$ 依赖 $K_*$，选择链出现循环 |
| $C_2$，四范数 | $=2D_R[4(F+B)+F_1+B_1]$，$F,B,F_1,B_1$ 为 $f,b,f',b'$ 的 sup 范数；与 $K_*,Q,j,p$ 无关 | 04-densities-estimates.tex:168-189 | 定 $K_*$ | 独立性是其命门：一旦含 $K_*$，$K_*$ 的固定步骤循环 |
| $D_R$ | $\lvert Yy\rvert\le D_R$、$\lvert Y\theta\rvert\le D_R/k$ 等；只依赖 $R_0$；径向弧长 $\le D_R/\sqrt k$ | 04-densities-estimates.tex:140-166 | $C_2$; central-comparison 指数率 $K_*D_R/\sqrt Q$ | 放大按倍数进 $C_2$ 再进 $K_*$ 再进 $Q_0$ |
| $L$ | 严格 $>\frac{5\log Q}{d_3}$ | 06-base-potential.tex:48-54; 符号来源 $N(5\log Q-Ld_3)$ 06-base-potential.tex:91-100 | lem base:minorant 唯一假设 | 系数 $5\log Q-Ld_3\ge0$ 则均值不趋 $-\infty$，mean-criterion（03-peaks.tex:17）前提凑不齐，minorant 无法排除 |
| $C_{\rm tail}$ | $=C_\epsilon\sum_{m\ge1}e^{-\eta Q^m}<\infty$，与 $N$ 无关 | 06-base-potential.tex:74-82 | base:negative-means 常数项（06-base-potential.tex:91-100） | 若依赖 $N$ 或发散，极限 $-\infty$ 断 |
| $c$，$C$（chart 控制） | $c\,\mathrm{Id}\le h^T(0)\le C\,\mathrm{Id}$；三阶 jets $\le C$；不变形式 $cI\le h\le CI$ | 02-reduction.tex:44-58 | $\lambda_0(c,C)$（02-reduction.tex:86-90）; $\lambda_0(c,C,C_{\rm e})$（09-pinching.tex:165-167）; 面积下界 $\min(c,1)^2$（09-pinching.tex:432-434） | $c\to0$ 则紧性闭集打开、rescale 子列失去收敛依据，尾段论证断 |
| $c=1$ | base:existence 把下界口径钉成 1，只留 $C$ 自由 | 02-reduction.tex:60-62 | metric:transfer 输入接口 | 改 $c$ 只平移 $\lambda_0$；真正致命的是 $c=0$（$h$ 退化） |
| $C_{\rm e}$（tex 口径 $C_3,C_4$） | $\lVert T_4\rVert\le C_4x$、$\lVert T_3\rVert\le C_3\sqrt q$；pinch:positivity 以统一 $C_{\rm e}$ 收编 | 08-curvature.tex:96-100; 09-pinching.tex:175-181 | rescaled 误差趋零的两 regime 反证 | $C_{\rm e}=\infty$ 则第二 regime 的 $o(x^{-1/2})$ 间隙被误差抵掉，$\mathcal H_R<0$ 证不出 |
| $D=(1+2x)h-qhG^{-1}h$ | $(1+x)h\le D\le(1+2x)h$（当 $\lambda\ge\max(1,C)$，09-pinching.tex:189-194 启用） | 08-curvature.tex:74-78、101-105 | pinch:algebra 的 $E=D/\sqrt q$ 上界常数 2（09-pinching.tex:33-44） | 常数 2 被模型 $h=I,E=2I$ 卡死（09-pinching.tex:19-31）；改大则等号分类与 $\beta$ 机制失去锚点 |
| $B$（有界函数的界） | 任意有限，取 $B\ge1$：$\lvert F_\ell\rvert\le B$；$\lvert d(z)\rvert\le6B^3\delta^{-2}e^{\phi/2}$；$\log\lvert d\rvert^2\le2\log6+6\log B+4\log\frac1{1-\lvert z\rvert}+\phi$ | 02-reduction.tex:119-121、145-154（Cauchy 原料 02-reduction.tex:129-143：$\lvert\partial_{z_j}F_\ell\rvert\le B\delta^{-1}$、纤维盘半径 $e^{-\phi/2}$ 给 $\lvert\partial_wF_\ell\rvert\le Be^{\phi/2}$） | map:determinant-bound → lem map:obstruction（02-reduction.tex:111-116） | 数值改动只进加性常数 $2\log6+6\log B$，不断步；若 $F$ 无界则 Cauchy 估计本身不存在，障碍断 |
| $4\log\frac1{1-\lvert z\rvert}$ | minorant 不存在性阈值：无 $H$ 使 $\operatorname{Re}H\le C_H+4\log\frac1{1-\lvert z\rvert}+\phi$ | 02-reduction.tex:63-68; 被 Cauchy 平方逼出 02-reduction.tex:145-154 | lem map:obstruction 的前提 | 降阶则行列式上界不再被右端支配；升阶则 mean-criterion 反证更难凑，两侧在 4 精确接上 |
| $\lambda_0$，$\lambda$ | $\lambda_0=\lambda_0(c,C,C_{\rm e})$ 有限；$\lambda\ge\lambda_0$ 且最后选 | 09-pinching.tex:165-167; 09-pinching.tex:366; 02-reduction.tex:86-90 | pinch:positivity；主定理证明选序（02-reduction.tex:163-165） | 取 $\lambda<\lambda_0$ 则大 $\lambda$ 一致负断；完备性不受牵连（07-hartogs-metric.tex:169-171 对一切 $\lambda>0$ 成立） |
| $K_R$ | $\{\lvert z\rvert\le\rho_R,\ e^{\phi}\lvert w\rvert^2\le\tau_R\}$，$\rho_R<1$、$\tau_R<1$ 紧含 | 07-hartogs-metric.tex:114-141 | metric:complete 的测地延拓论证（07-hartogs-metric.tex:142-167） | 梯度界一失（$2t<2$ 或 $\lambda$ 无穷），$\tau_R,\rho_R$ 不再严格小于 1，$K_R$ 含不出 $M_\phi$，延拓那步断 |

### 15.1 依赖链：谁喂谁，改动后从哪一步塌

三条链，靠两处接缝互喂。

解析链（造负量）：$a\to\alpha\to s_1\to\Delta$ 是源头，$\Delta$ 一旦被 $s_1$ 出窗拖成非正，$\epsilon,\eta,D_*,k_*$ 的全部预算（$\Delta/8,\Delta/16$）同时作废，$d_2\to d_3\to L$ 只是把同一个负量往下传；$L$ 不等式失效时 base:minorant 断，于是 $4\log$ 阈值那侧的前提没了，map:obstruction 变哑弹，主定理的否定句失去来源。$Q$ 在这条链上出现两次（$Q_0$ 管正性、$Q_*$ 管尾部频率），而 $d_2$ 与 $Q$ 无关（05-logarithmic-tests.tex:101-102）正是这两个 $Q$ 能各自固定、互不打架的原因。

代数链（管密度）：$R_0\to D_R\to C_2\to K_*\to C_1\to Q_0$，每一环单向。$C_2$ 不含 $K_*$ 是全链能落地的命门（04-densities-estimates.tex:188 明文），若 $C_2$ 吃到 $K_*$，$K_*>2C_2/c_0$ 变成自指，density:main 的归纳起点不存在。

几何链（管曲率）：base:control 的 $c,C$ 与 curv:errors 的 $C_3,C_4$（合口径 $C_{\rm e}$）喂 $\lambda_0(c,C,C_{\rm e})$，$\lambda$ 压主项 $\lambda(a_I+3b_I^2)$；$D$ 的双侧界 $h\le E\le2h$ 是 pinch:algebra 唯一的入场券，模型 $E=2I$ 说明常数 2 不可改大。尾部 $[-2,-1/2]$ 与夹紧 $[-3,-1/4]$ 是这条链的出口，与解析链共用 $\phi$ 的 $C^\infty$ 光滑性但不共用任何数值。

曲率钳制口径挂账：全篇双侧钳制只有一个来源（01-introduction.tex:41-44 的 $-B\le K\le-A$），落实于 09-pinching.tex:439-446；截面到 Ricci 的求和在论文里从未被使用（表内 Ric 行），所以任何"只给 Ricci 下界"的改动不能救 §9 的任何一步。维数 3 与 Kähler 结构的使用点也各自挂清：前者在 $N_k$ 增长率与 $a_V=b_V^2$，后者在 $(2,2)$ 型分解与 $\mathcal H_T$ 收缩；两处的失败模式互不相干。

### 15.2 同一量的双口径并列（不改原文，只登记）

- Lean 模块规模：素材头部"108 个 .lean、约 18,688 行"与素材 §4.1"36 个、约 6000 行"两种口径，我在第 13 节实测得第三口径 119 个、18,688 行。出处：本笔记第 825 行（含前两处转述）；素材文件为 `研究笔记\素材\Kähler负pinched三维fold-素材.md`（头部与 §4.1 表）。原文未动。
- $a$ 的口径：论文只固定区间 $1<a<2$（03-peaks.tex:209；本笔记第 797 行），Lean 落地成具体值 $3/2$（`BaseTestSystem.lean:46`；本笔记第 858 行）。两口径并存，前者管存在性，后者管可执行。
- 尾部 pinching 数值：模型极限区间 $[-2,-1/2]$（09-pinching.tex:430；本笔记第 817 行）与实际写出的不等式 $-3\le K_g\le-1/4$（09-pinching.tex:441；本笔记第 749 行）。两个数都真，前者是 $x\to\infty$ 极限值域，后者是有限 $X_\lambda$ 之后的粗化上界，用途不同。

### 15.3 与第 12 节台账的勘误对照

两表不是重复劳动，视角有三处实差。其一，第 12 节按"参数选择顺序"叙事，来源栏写 tex 标签（如 `peaks:profiles`）；本表按符号定位，位置栏给真实文件行号，标签到行号的翻译在本表已完成。其二，行集不同：本表新增第 12 节没有的行（Ricci 缺口、$g=2\operatorname{Re}$ 约定、$K_\infty$ 与尾夹的区分、$B$ 有界函数界、$4\log$ 阈值、$D$ 公式、$C_{\rm off}$、$C_P$、$\sigma$、维数与 Kähler 结构两条"使用点"行）；第 12 节的敏感度栏讲"往哪个方向改会糟"，本表"若改动断在哪一步"栏给具体失效引理，二者在 $Q$、$\epsilon$、$L$ 三行结论一致、表述不同。其三，第 12 节的放大器 162 行我没有照搬：全篇 tex 无 162 字面（我逐文件 grep 过 `build\sections` 全部 9 个文件），它是 Lean 硬编码（`HartogsFrame.lean:98`，本笔记第 858 行已登记），在本表口径下属于"无法回 tex 核对"，故按规则换成了 $C_{\rm e}$ 行。第 12 节原表一字未删。

## 16 加深：`metric:gradient-bounds` 的逐步反推（`07-hartogs-metric.tex:78-112`）

选这段的理由：我在第 8 节把这条估计压成机制第 2 步的一行带过（本笔记第 623 行，"coframe 分块对角 ⇒ $=t$"），而它是全篇完备性论证的唯一弹药，两处恒等式在 tex 里也各只有一行中间步骤。这次把它们补到我自己能重算的程度。

### (a) tex 逐字（07-hartogs-metric.tex:78-112）

```tex
\emph{Two functions with bounded gradient.}
For a real smooth function $f$, the convention
$g=2\operatorname{Re}\widehat g$ gives
\begin{equation}\label{metric:gradient-convention}
 |\nabla f|_g^2=2|\partial f|_{\widehat g^{-1}}^2.
\end{equation}
Indeed, for a real vector $X$ with $(1,0)$ part $u$,
$g(X,X)=2\widehat g(u,u)$ and
$df(X)=2\operatorname{Re}\partial f(u)$, and the identity follows
by taking dual norms.

Globally on $M_\phi$,
\[
 \partial[-\log(1-t)]
 =\frac{e^\phi\bar w}{1-t}\,\vartheta.
\]
In the coframe of \eqref{metric:smooth-form}, the Hermitian metric is
block diagonal.  Therefore
\[
 |\partial[-\log(1-t)]|_{\widehat g^{-1}}^2
 =\frac{|e^\phi\bar w/(1-t)|^2}{e^\phi/(1-t)^2}=t.
\]
This calculation includes $w=0$, where both sides are zero.  For the
base potential, direct inversion of its complex Hessian gives
\[
 |\partial\psi|_{I^{-1}}^2=|z|^2.
\]
The covector $\partial\psi$ has only base components in the same
coframe, and $G\ge\lambda I$.  Combining these facts with
\eqref{metric:gradient-convention} yields
\begin{equation}\label{metric:gradient-bounds}
 |\nabla[-\log(1-t)]|_g^2=2t<2,
 \qquad
 |\nabla\psi|_g^2\le\frac{2|z|^2}{\lambda}\le\frac2\lambda.
\end{equation}
```

### (b) 中间步骤补全

第一个恒等式（对 $t$ 的）分三步。第一步，$\partial t$：$t=e^{\phi}w\bar w$，而 $\partial$ 只对全纯变量作用、把 $\bar w$ 当系数，所以 $\partial t=e^{\phi}\partial\phi\cdot w\bar w+e^{\phi}\bar w\,dw=e^{\phi}\bar w\,(dw+w\,\partial\phi)=e^{\phi}\bar w\,\vartheta$，这正是 tex 那行 $\partial[-\log(1-t)]=\frac{e^\phi\bar w}{1-t}\vartheta$ 的来源（链式：$\partial[-\log(1-t)]=\frac{\partial t}{1-t}$）。第二步，配对偶范数：余框架（基余框架 $\cup$ $\vartheta$）里 $\widehat g$ 是分块的，$\vartheta$ 方向系数为 $\frac{e^\phi}{(1-t)^2}$（metric:smooth-form，07-hartogs-metric.tex:44-48），所以纯 $\vartheta$-余向量 $c\,\vartheta$ 的逆度量范数平方就是 $\frac{\lvert c\rvert^2}{e^\phi/(1-t)^2}$。第三步，代 $c=\frac{e^\phi\bar w}{1-t}$：分子 $\frac{e^{2\phi}\lvert w\rvert^2}{(1-t)^2}$，约掉分母得 $e^{\phi}\lvert w\rvert^2=t$，一步不剩。$w=0$ 两端同时为零，恒等式全域成立，全程没用 $s=\log t$。

第二个恒等式（对 $\psi$ 的）tex 只说 "direct inversion"，我自己补算。记 $s_0=1-\lvert z\rvert^2$。$\psi_i=\frac{\bar z_i}{s_0}$；$I_{i\bar j}=\frac{\delta_{ij}}{s_0}+\frac{\bar z_i z_j}{s_0^2}$。$I$ 在 $U(2)$ 作用下等变，$\partial\psi$ 同权变换，故可酉旋转把 $z$ 搬到 $(r,0)$：此时 $I$ 对角，元素 $\frac{1}{s_0}+\frac{r^2}{s_0^2}=\frac{s_0+r^2}{s_0^2}=\frac1{s_0^2}$ 与 $\frac1{s_0}$，而 $\partial\psi$ 只有第一分量 $\frac rs$。于是 $|\partial\psi|_{I^{-1}}^2=\frac{r^2/s_0^2}{1/s_0^2}+0=r^2$。等价地，一般坐标下 Sherman-Morrison 给 $I^{i\bar j}=s_0(\delta_{ij}-\bar z_i z_j)$（分母里 $s_0+\lvert z\rvert^2=1$ 同一条恒等式），两种算法我核对一致。

第三段是拼界。$\partial\psi$ 与 $\vartheta$ 无分量（$\psi$ 不依赖 $w$，$dw$ 部分作用为零），所以它的 $\widehat g^{-1}$-范数就是水平块 $G^{-1}$-范数；$h\ge0$（$\phi$ 次调和）给 $G=\lambda I+xh\ge\lambda I$，Loewner 序取逆反号：$G^{-1}\le\lambda^{-1}I^{-1}$，故 $|\partial\psi|_{\widehat g^{-1}}^2\le\frac{|z|^2}{\lambda}$。约定 (metric:gradient-convention) 我是这样验的：在 1 复维平坦模型 $h=dz\otimes d\bar z$、$g=2(dx^2+dy^2)$ 上，$\partial f=f_z\,dz$，$f_z=\frac12(f_x-if_y)$，右边 $=2\cdot\frac{f_x^2+f_y^2}{4}$，左边 $=\frac{f_x^2+f_y^2}{2}$，两边一致，因子 2 就是从这里来的。最后 $t<1$ 是 $M_\phi$ 的定义（metric:domain），$\lvert z\rvert<1$ 是基球的定义，两条上界 $2t<2$、$\frac{2}{\lambda}$ 就此闭合。下游我核过：$a_R=-\log(1-t(p))+\sqrt2 R$、$b_R=\psi(p)+\sqrt{2/\lambda}R$（07-hartogs-metric.tex:119-122），再给出 $\tau_R,\rho_R<1$ 与 $|w|^2\le e^{-m_R}\tau_R$（07-hartogs-metric.tex:124-134），全篇完备性只吃这条估计，不吃别的。

### (c) 每个假设、常数、指数的机械理由

- 因子 2（$|\nabla f|_g^2=2|\partial f|_{\widehat g^{-1}}^2$）：$g=2\operatorname{Re}\widehat g$ 约定的直接代价，见上面 1 维平坦验证；它同步决定 curv:sectional 分母的 2（08-curvature.tex:255-261）。
- $\sqrt2 R$、$\sqrt{2/\lambda}R$：沿路径积分时梯度上界 $2t$、$\frac2\lambda$ 开根号而来；指数 $1/2$ 纯粹是"距离是速度的一次积分、界是梯度范数平方"的配对。
- $h\ge0$：在本引理只用了一次，就是 $G\ge\lambda I$；连 $cI\le h$ 都不需要（那是 07-hartogs-metric.tex:169-171 起才引入给 transfer 的）。
- $\lambda>0$ 任意：$\frac2\lambda$ 有限即可，不要求大；这就是"完备性独立于大 $\lambda$"（07-hartogs-metric.tex:169-171）的结构原因，两条机器咬合但不互相等待。
- $\vartheta=dw+w\partial\phi$ ，并非 $s=\log t$：$w=0$ 处 $\partial s=\vartheta/w$ 无定义，metric:smooth-form 全光滑（07-hartogs-metric.tex:67-76 明说），所以恒等式在零截面上的成立是靠余框架写法保证的，两端在 $w=0$ 同时为零。
- $m_R=\min_{\lvert z\rvert\le\rho_R}\phi$：只需要 $\phi$ 连续，不需要下方界一致；$\rho_R<1$ 由 $b_R<\infty$（即 $\lambda>0$ 有限）保证。这一步把"$\phi$ 可以无界"（06-base-potential.tex:112 "The value of $\phi$ need not be bounded"）与紧性缝合。

### (d) 候选失败路线

- [推测] 用 $s=\log t$ 坐标直接算 $|\partial(-\log(1-t))|^2$：在 $w\ne0$ 上会得同一个 $t$，但零截面处表达式 $\vartheta/w$ 奇异，要额外证"两端为零的极限拼接"。失败机制是论证形态：exhaustion 与梯度界必须在整个 $M_\phi$ 上一字成立，拼接论证把 metric:complete 的初等性弄脏，而 tex 用余框架一行绕过。
- [推测] 绕开梯度界、改用严格次调和 exhaustion 的通用完备判据：需要 $(dd^c\rho)^{-1}$ 沿 exhaustion 的一致控制，这里水平块逆是 $(\lambda I+xh)^{-1}$，$x$ 无界且 $h$ 只在中心化原点有界（base:control 给的是 $h^T(0)$，不在整条 $x$-轨道一致）。失败机制：判据假设在此不成立，回去还是要证 $-\log(1-t)$ 这一条，等于把tex的路线重走一遍还多绕路。
- [推测] 对 $\partial\psi$ 直接用完整 $\widehat g^{-1}$ ，并非单调性 $G^{-1}\le\lambda^{-1}I^{-1}$：得 $\frac{|\partial\psi|_{(\lambda I+xh)^{-1}}^2}{\ }$，上界随 $x$ 依赖，虽然仍 $\le\frac{|z|^2}{\lambda}$，但要先把 $x$-依赖项的正性逐块算清。失败机制：一旦 $\phi$ 不次调（$h$ 有负特征值），$G\ge\lambda I$ 与正定性同时断，说明"$\phi$ 次调"在本引理里的全部角色就是这一条单调性，这条路线省不掉它，只是把它藏进分块计算里。
