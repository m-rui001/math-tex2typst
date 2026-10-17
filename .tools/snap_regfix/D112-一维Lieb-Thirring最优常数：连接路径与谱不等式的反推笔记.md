# D112 一维 Lieb--Thirring 最优常数：连接路径与谱不等式的反推笔记

论文：Sharp One Dimensional Lieb Thirring Constants（build 目录署名 OpenAI，日期 2026-09-23）。
素材：`E:\math\preprints\Sharp-One-Dimensional-Lieb-Thirring-Constants-September-23-2026\build\`，
`main.tex` 911 B、`preamble.tex` 1337 B、`references.bib` 8404 B，分片按字节降序为
`sections/connecting-path.tex` 13047、`sections/spectral.tex` 10827、`sections/matrix-field.tex` 8921、
`sections/introduction.tex` 8808、`sections/rank-one.tex` 8881、`sections/action-limit.tex` 3210、
`sections/action-framework.tex` 2886。
Lean 侧：`lean/formalization.yaml:1278-1280` 逐字登记
`comparator_config: ComparatorChallenges/LiebThirring.json` /
`declaration: OAI.SharpLiebThirring.sharp_lieb_thirring` /
`file: OAI/Analysis/LiebThirring/Main.lean`。
注意登记名空间是 `OAI.SharpLiebThirring`，而目录名是 `LiebThirring`，两者不同名。

## 0 起点：只剩开区间的那段猜想，和我一开始的算盘

我读这篇论文之前手上有的是端点信息，而这些信息全在论文自己的引言里被交代干净。摘要给出的命题是
`main.tex:12-14`：

> We resolve affirmatively the remaining cases of the scalar one-dimensional
> Lieb--Thirring conjecture: for every $\frac12<\gamma<\frac32$,
> the optimal constant is the one-bound-state constant.

而这段区间的猜想内容，`introduction.tex:33-35` 写得很硬：

> denoted by $L_{\gamma,1}^{(1)}$. The one-dimensional Lieb--Thirring
> conjecture predicts the one-bound-state constant for
> $1/2<\gamma<3/2$ and the semiclassical constant for $\gamma\ge3/2$.

我的第一反应是：两端点都已知（$\gamma=1/2$ 的 $1/2$ 值、$\gamma=3/2$ 的 $3/16$ 值，加上
$\gamma>3/2$ 的 Aizenman--Lieb 单调性，引言 `introduction.tex:72-86` 逐条带出处），$\gamma=1$ 也已被
Read--Schulz 解决（`introduction.tex:106-107`："Read and Schulz proved the case $\gamma=1$ in"），
剩下的只是把 $\gamma=1$ 那一招插值到整个开区间。这就是我的初始猜想，也是我在这篇论文里最先撞墙的地方。
插值路线的机械要求是这样的：若已在 $\gamma_0=1/2$ 与 $\gamma_1=3/2$ 各有一个常数为 $L_j$ 的估计，
对同一个 $W$ 做 $\int W^{\gamma+1/2}$ 的 Hölder 插值，能拿到形如
$L_{1/2}^{1-\theta}L_{3/2}^{\theta}$ 的上界，$\theta=\gamma-1/2$。我手算过一遍：把
$L_{1/2,1}=1/2$（Hundertmark--Lieb--Thomas）与 $L_{3/2,1}=3/16$（Zakharov--Faddeev、GGKM）代进去，
在 $\gamma=1$ 处得到 $2^{-1/2}\cdot(3/16)^{1/2}=\sqrt{3/32}\approx0.306$，而真实值是
$4/(3\sqrt3\pi)\approx0.2456$，比例约 $1.25$，已经偏离；对单个束缚态常数 $L^{(1)}_{\gamma,1}$ 的
显式公式（一维一束缚态问题就是 $\sech^2$ 势的超越方程解）而言，端点插值给出的曲线在中段始终高于
$L^{(1)}$。所以纯插值只能给出一个 $c\cdot L^{(1)}_{\gamma,1}$ 型常数，永远够不到"最优"。
`introduction.tex:102-104` 把我撞的那个障碍写成了论文的动机句：

> Such computations support the conjectured value but do not bound the
> contribution of every orthonormal family. That uniform bound is the
> obstacle addressed by our action inequality.

我从这句话反推到的定位是：这篇论文的全部力气花在一个"与位势无关的、对任意正交族一致成立的下界"上，
它把谱问题彻底替换成了一个有限维区间上的作用量下界问题。这个替换是我完全没有预料到的，也是后面所有
构造的根源。

[推测] 我试的第一条弯路：把 Read--Schulz 的累积质量（cumulative mass）矩阵修正直接搬到一般 $\sigma$。
失败原因是累积质量方法本质上依赖指数 1 处的标度不变性，$\sigma\ne0$ 时那个修正项不再闭合。
[推测] 第二条弯路：对 $\sum_j k_j^{2\gamma}$ 直接做半经典配分函数估计加 Berezin--Lieb 型
投影下界。这类方法在 $\gamma\ge3/2$ 才给到最优常数，$\gamma<3/2$ 时只能给到
$2L^{\cl}_{\gamma,1}$（Hundertmark--Laptev--Weidl，`introduction.tex:89-91`），量级差一个因子 2。
[推测] 第三条弯路：变分法直接取 $\sup_W$，先把最优势的 Euler--Lagrange 方程解出来再证唯一性。
一维束缚态可以是无限多个，这个自由极大问题的约束集没有紧性，$\sech^2$ 唯一性在 $N\ge2$ 时根本是
open 的；论文自己也声明不分类全部极值元（`introduction.tex:54-55`："Its sharpness assertion
exhibits an equality potential without classifying all optimizers."）。

## 1 先把骨架摊开：论文到底把定理切成了哪几块

`main.tex:20-26` 的 include 顺序就是我后来重建思路时必须遵循的顺序：

> \input{sections/introduction}
> \input{sections/action-framework}
> \input{sections/matrix-field}
> \input{sections/rank-one}
> \input{sections/connecting-path}
> \input{sections/action-limit}
> \input{sections/spectral}

我一开始以为这个顺序是排版礼貌，读完 `action-framework.tex` 才发现它是一条真正的依赖链：
`matrix-field`（造场 $M_\delta$ 与原函数 $J$）→ `rank-one`（$M(B)=aa^{\mathsf T}$ 时的比较）→
`connecting-path`（造从 $K$ 到 $-K$ 的路径与系数 $C$）→ `action-limit`（$\varepsilon\to0$、$\delta\to0$
得作用量不等式）→ `spectral`（回到位势、耗尽整条线、验 sharpness）。前四片是纯有限维/ODE 的，
唯一用到谱论的是最后一片。这个切法给我的第一个教训是：作者刻意把"与位势无关"的下界单独隔离成一个
命题（Theorem 2.1），使得任何谱侧的粗糙度都不渗进核心不等式。

主定理在 `introduction.tex:37-48`，我关心的是常数的形状：

> \begin{theorem}\label{thm:main}
> For every $1/2<\gamma<3/2$ and every nonnegative
> $W\in L^{\gamma+1/2}(\R)$,

以及 `introduction.tex:41-44` 的显式界：

>  \Tr(H_{-W})_-^\gamma
>  \le 2\left(\frac{\gamma-1/2}{\gamma+1/2}\right)^{\gamma-1/2}
>        L_{\gamma,1}^{\cl}\int_\R W^{\gamma+1/2}.

`introduction.tex:27-31` 给出半经典常数：

>  L_{\gamma,1}^{\cl}
>  =\frac1{2\pi}\int_\R(1-\xi^2)_+^\gamma\,d\xi
>  =\frac{\Gamma(\gamma+1)}{2\sqrt\pi\,\Gamma(\gamma+3/2)}

我把 `introduction.tex:42` 的系数与 $\int_{-1}^{1}(1-\xi^2)^\gamma d\xi$ 的 Beta 函数值自己推了一遍：
$\int_{-1}^1(1-\xi^2)^\gamma d\xi=\mathrm B(1/2,1+\gamma)=\sqrt\pi\,\Gamma(1+\gamma)/\Gamma(3/2+\gamma)$，
所以 $L^{\cl}_{\gamma,1}=\Gamma(\gamma+1)/(2\sqrt\pi\Gamma(\gamma+3/2))$ 与 `introduction.tex:30` 一致，
没有额外的 $2\pi$ 陷阱（我的第一次手算把 $\frac{1}{2\pi}$ 与 $\frac{1}{\pi}$ 弄混，多出一个因子 2，
这就是我在第 16 节要回到常数辨识时特别小心 $2(\sigma/(1+\sigma))^\sigma$ 这个前因子的原因）。

[推测] 弯路之一：我原以为 $2((\gamma-1/2)/(\gamma+1/2))^{\gamma-1/2}$ 这一坨是从某个
Sobolev/Onofri 型极值算出来的显式变分结果。读了 `spectral.tex:11-14` 才知道它只是
$A_\sigma/\mathrm B(1/2,1+\sigma)$ 的换元写法，来源是标量极大化 $\max_{m\ge0}(Wm-m^q)$，
也就是说整个最优常数最后由一个单变量微积分题加一个 Beta 积分决定；剩下的全是结构。
[推测] 弯路之二：以为论文会分 $\gamma$ 的子区间分别处理（比如 $\gamma<1$、$\gamma>1$ 两套
符号）。实际上 `action-framework.tex:5` 一次固定 $0<\sigma<1$ 就覆盖了全部，指数区间只从
$\beta=\sigma-\tfrac12$ 的收敛性那里进来。
[推测] 弯路之三：以为 $N$（正交族的长度）会被当作趋于无穷的参量处理。读完 `connecting-path.tex`
才看清整个路径构造里 $N$ 一直是固定的有限数，无穷性只在 `spectral.tex:143-202` 的"有限部分和取上确界"
这一步出现；把无穷维紧性问题推到最后的耗尽步骤，是这个证明能保持有限维的原因。

## 2 我最初的做法：对 $C$ 直接极大化，以及它为什么一定断

`action-framework.tex:24-25` 是核心命题的左边与右边：

>  \sup_{C\text{ lower triangular}}\mathcal E_K(Cu)
>  \ge \sum_{i=1}^N\int_{-k_i}^{k_i}(k_i^2-s^2)^\sigma\,ds.

而 `action-framework.tex:30-34` 交代了三角限制的用途：

> The restriction to lower triangular matrices is what makes this inequality
> useful spectrally. If the $u_i$ are eigenfunctions ordered from the lowest
> eigenvalue upward, the $i$th component of $Cu$ stays in the span of the first
> $i$ eigenfunctions. Section~\ref{sec:spectral} will use this observation to
> bound the left side from above by an integral of the potential.

我的初始打算很直白：把 $\mathcal E_K(Cu)$ 看成 $\dim\mathcal L=N(N+1)/2$ 个变量的函数，对 $C$ 求驻点。
写下来第一项是 $\int|Cu'|^2$，第二项 $\int (Cu)^{\mathsf T}K^2(Cu)$，第三项 $-\int|Cu|^{2q}$。驻点方程是
一个二次加 $(2q-2)$ 次的耦合系统，$q=1+1/\sigma$ 一般非整数，所以没有任何代数结构可依赖。更致命的是
右端要求的是 $\sum_i\int_{-k_i}^{k_i}(k_i^2-s^2)^\sigma ds$，这是**逐尺度**的信息：$k_i$ 必须以各自的身份
出现。任意驻点方程只会把 $k_i$ 混在一起，我看不出能从驻点里读出这种逐尺度分离。`introduction.tex:141-143`
正是这一击：

> The difficulty is to obtain this lower bound for an arbitrary orthonormal
> family while retaining its individual scales $k_i$. The argument replaces
> a direct optimization over $C$ by a path with prescribed matrix endpoints.

我读到这里确认了换招的理由：不去"求最大值"，而去"造一条路径"，让 $B$ 从 $K$ 跑到 $-K$，
途中 $M(B)$ 与 $aa^{\mathsf T}$ 的比较自动把尺度 $k_i$ 保留在端点积分里。$B$ 的端点直接是
$\operatorname{diag}(k_i)$，尺度就锁在对角线上，逐尺度分离因此是构造出来的，不是推出来的。

[推测] 我试过的对称化改法：先只对对角 $C$ 做极大化，得到逐尺度的下界再对角化逼近非对角元。
断在第 11 节的"零行不能消失"那里，因为对角 $C$ 会退化到零行，路径在同伦里失去可延拓性。
[推测] 第二种改法：把 $\sup_C$ 换成对 $a$ 的自由极大化（$a\in H^1_0(I;\R^N)$ 任意）。
这样左边会变大，不等式方向反而更容易，但谱侧 `spectral.tex:104-113` 的
"$a=Cu$ 的第 $i$ 分量落在前 $i$ 个特征函数张成的空间里"就没了，三角序机制失效，
左边无法被 $\int W^p$ 控制。
[推测] 第三种改法：用 Lagrange 乘子把 $\int uu^{\mathsf T}=I_N$ 的约束并入。约束在论文里只在
两处被消费（`connecting-path.tex:40` 与 `spectral.tex:104`），并乘子反而把正交性变弱，我看不到好处。

## 3 换元与 Young 常数：$\sigma$、$p$、$q$、$A_\sigma$、$\ell_\sigma$ 各管什么

`action-framework.tex:5` 定了全套参数：

>  0<\sigma<1,\qquad p=1+\sigma,\qquad q=1+\frac1\sigma.

而 `action-framework.tex:15` 是作用量：

>  \mathcal E_K(a)=\int_I\bigl(|a'|^2+a^{\transpose}K^2a-|a|^{2q}\bigr)\,dx.

我的读法是：$\sigma=\gamma-1/2$ 把谱指数搬到非线性指数上（`introduction.tex:126`："Put
$\sigma=\gamma-1/2\in(0,1)$."）。$p=1+\sigma=\gamma+1/2$ 正是位势的可积指标；$q=1+1/\sigma$
是 $p$ 的 Hölder 共轭，验证：$1/p+1/q=1/(1+\sigma)+\sigma/(1+\sigma)=1$ ✓。所以 $|a|^{2q}$ 这一项
和 $\int W|a|^2$ 天然是同一对共轭指标下的配对，$q-1=1/\sigma$ 就是后面所有 $(\cdot)^{1/\sigma}$
出现的地方。

`spectral.tex:11-14` 定义了那两个常数（我把 label 行也带上）：

> \begin{equation}\label{spectral:constant}
>  A_\sigma=\frac{\sigma^\sigma}{(1+\sigma)^{1+\sigma}},
>  \qquad
>  \ell_\sigma=\frac{A_\sigma}{\mathrm B(1/2,1+\sigma)},

`introduction.tex:33-35`（见第 0 节引用）里的 $L^{(1)}$ 与这里 $\ell_\sigma$ 的桥在
`spectral.tex:134-141`：

> \begin{align}\label{spectral:constant-identification}
>  \ell_\sigma
>  &=\left(\frac{\sigma}{1+\sigma}\right)^\sigma
>    \frac{\Gamma(\sigma+3/2)}{\sqrt\pi\,\Gamma(\sigma+2)}
>  \notag\\
>  &=2\left(\frac{\sigma}{1+\sigma}\right)^\sigma
>    L_{\gamma,1}^{\mathrm{cl}}.

我逐字验算了这条等式。第一步：$A_\sigma=(\sigma/(1+\sigma))^\sigma\cdot1/(1+\sigma)$；
$\mathrm B(1/2,1+\sigma)=\Gamma(1/2)\Gamma(1+\sigma)/\Gamma(3/2+\sigma)=\sqrt\pi\,\Gamma(1+\sigma)/\Gamma(\sigma+3/2)$；
相除得 $(\sigma/(1+\sigma))^\sigma\Gamma(\sigma+3/2)/[\sqrt\pi\,(1+\sigma)\Gamma(1+\sigma)]$，
再用 $(1+\sigma)\Gamma(1+\sigma)=\Gamma(2+\sigma)$，就是 `spectral.tex:136-137`。第二步用
$\gamma=\sigma+1/2$ 代入 $L^{\cl}_{\gamma,1}$：$\Gamma(\gamma+1)/(2\sqrt\pi\Gamma(\gamma+3/2))
=\Gamma(\sigma+3/2)/(2\sqrt\pi\Gamma(\sigma+2))$，乘 $2(\sigma/(1+\sigma))^\sigma$ 与第一步相同 ✓。
这解释了为什么 $\ell_\sigma$ 与 $L^{(1)}_{\gamma,1}$ 的相等是**恒等式**，并非某种极限：
`spectral.tex:132-133` 明说"The beta--gamma identity identifies the constant without any limiting
argument in $\sigma$"。

$s^2$-积分那一半也补一下（`spectral.tex:127-129`）：

> Substituting $s=k_jt$ in each integral gives
> $\mathrm B(1/2,1+\sigma)k_j^{2\sigma+1}$, proving
> \eqref{spectral:dirichlet-bound}.

代入 $s=k_jt$：$\int_{-k_j}^{k_j}(k_j^2-s^2)^\sigma ds=k_j^{2\sigma+1}\int_{-1}^{1}(1-t^2)^\sigma dt$，
而 $\int_{-1}^1(1-t^2)^\sigma dt=2\int_0^1(1-t^2)^\sigma dt$，取 $u=t^2$，$dt=\tfrac12u^{-1/2}du$，
得 $\int_0^1u^{-1/2}(1-u)^\sigma du=\mathrm B(1/2,1+\sigma)$；$2\sigma+1=2\gamma$，于是
$\sum_j\int_{-k_j}^{k_j}(\cdots)=\mathrm B(1/2,1+\sigma)\sum_jk_j^{2\gamma}$。左边整体被 $A_\sigma\int W^p$
界住（`spectral.tex:122-126`），两边同除 $\mathrm B(1/2,1+\sigma)$ 就把 $A_\sigma$ 变成 $\ell_\sigma$。
这就是 $\ell_\sigma$ 唯一的存在理由：它是 Beta 因子对 Young 常数的除法。

标量极大化那一处的中间步骤在 `spectral.tex:119-120`：

> The last inequality follows by maximizing $Wm-m^q$ over $m\geq0$;
> the maximizer is $(W/q)^\sigma$.

我自己推：$\partial_m(Wm-m^q)=W-qm^{q-1}=0$，$m^*=(W/q)^{1/(q-1)}=(W/q)^\sigma$（用 $q-1=1/\sigma$）；
$m^{*q}=(W/q)^{\sigma q}=(W/q)^{1+\sigma}$（用 $\sigma q=\sigma+1$）；
故最大值 $=W^{1+\sigma}(q^{-\sigma}-q^{-1-\sigma})=W^{p}q^{-\sigma}(1-1/q)=W^{p}(\sigma/(1+\sigma))^\sigma
\cdot1/(1+\sigma)=A_\sigma W^p$ ✓，逐项对上 `spectral.tex:12` 的 $A_\sigma$。

[推测] 若把 $q$ 换成别的共轭指标，比如硬取 $q'=2\gamma$，$A_\sigma$ 的那次极大化会给出一个依赖 $W$
的形状因子，`spectral.tex:116-118` 的"$\le A_\sigma\int W^p$"就不能逐点完成，只能靠积分型 Young，
常数就不再是 $A_\sigma$。
[推测] 若 $\sigma$ 越界到 $\sigma\ge1$（即 $\gamma\ge3/2$），$q=1+1/\sigma\le2$，上面的逐点极大化仍然成立，
但 $\beta=\sigma-1/2\ge1/2$ 让 `matrix-field.tex:43-44` 的 $c$ 积分发散，整个场构造断掉。这与
"半经典区由 Aizenman--Lieb 单调性负责"的分工一致，也反过来说明这套构造天生只覆盖开区间。
[推测] 若 $\sigma\le0$（$\gamma\le1/2$），$(\sigma/(1+\sigma))^\sigma$ 无定义，$A_\sigma$ 崩塌，对应的正是
$L_{1/2,1}$ 需要另一套论证的历史事实。

## 4 标量原型：$m=(k^2-b^2)^\sigma$ 是怎么被逼出来的

`matrix-field.tex:5-12` 是全篇我读得最慢的一段，因为它把整篇的构造逻辑压缩成三行：

> The scalar case explains the choice of field. For $N=1$, write $K=(k)$.
> If $-k\le b\le k$, putting $m=(k^2-b^2)^\sigma$ gives
> \[
>  m(k^2-b^2)=m^{1+1/\sigma}.
> \]
> Thus this field gives equality in the scalar version of the rank-one
> comparison, and a primitive with derivative $-m$ has the required change
> $\int_{-k}^k(k^2-b^2)^\sigma\,db$ from $k$ to $-k$.

我把这三句拆开做代数。$N=1$ 时 $B=(b)$ 是一个数，$|a|^2=m$，命题 4.1 的 rank-one 比较
（`rank-one.tex:10-12`）在标量情形是 $a^2(k^2-b^2)\ge|a|^{2q}$，即 $m(k^2-b^2)\ge m^q$。
由于 $q=1+1/\sigma$，$m^{q}=m\cdot m^{1/\sigma}$，于是两边同除 $m$ 得 $k^2-b^2\ge m^{1/\sigma}$，
即 $m\le(k^2-b^2)^\sigma$。所以场在 $b$ 处的值**必须**是 $M(b)=(k^2-b^2)^\sigma$，否则要么不等式不成立
（$M$ 取大了），要么边界的下界不紧（$M$ 取小了）。这就是 `matrix-field.tex:10-11` 那句"this field gives
equality in the scalar version"的意思：它给出的是标量情形下的**唯一**紧候选。

第二句关于原函数：$J$ 要满足 $dJ/db=-m=-(k^2-b^2)^\sigma$，于是
$J(-k)-J(k)=\int_{-k}^{k}(k^2-b^2)^\sigma db$，正是 Theorem 2.1 右端在 $N=1$ 的那一项。
所以场 $M$ 与原函数 $J$ 是一对：$M$ 决定逐点比较，$J$ 决定端点增益，两者用同一个被积函数绑住。
这一点在矩阵情形由 `matrix-field.tex:82-85`（原函数定义）与 `matrix-field.tex:194-197`（边界面值）承担。

我在这个原型上多花了些工夫，因为它是唯一让我能猜出"$M$ 应该是 $K^2-B^2$ 的某种 $\sigma$ 幂"的线索。
矩阵里 $K^2-B^2$ 一般不正定，也不与 $B$ 交换，于是需要一个把"$\sigma$ 幂"合理化的装置。论文给的装置是
沿一条抛物线族做积分：`matrix-field.tex:16-22`：

> The identity
> \[
>  k^2-2sb+s^2=(s-b)^2+k^2-b^2
> \]
> suggests integrating a scalar function of the quadratic on the left:
> its affine dependence on $b$ will let us construct a trace primitive
> even when the corresponding matrices $K$ and $B$ do not commute.

我的补算：左端 $k^2-2sb+s^2$ 对 $b$ 是**仿射**的，这关键。若 $f$ 是任意函数，$\operatorname{tr}F(K^2-2sB+s^2)$
对 $B$ 求微分时，因为 $K^2$ 与 $B$ 不交换，链式法则会有非对角的 divided difference 残留；但若把 $s$ 积分
掉，仿射性保证 $d/ds$ 与 $\partial/\partial b$ 之间有一个交换关系，让梯度性得以保持。论文用
`matrix-field.tex:119-124` 具体实现这一点：对 $s\ne0$，映射 $B\mapsto f(X_s(B))-f(s^2)I_N$ 是梯度的，
势函数显式是 $-\frac{1}{2s}\operatorname{tr}F(X_s(B))-f(s^2)\operatorname{tr}B$。我核对了这个势：
用 `matrix-field.tex:114-116` 的 $\,d\operatorname{tr}F(A)[H]=\operatorname{tr}(f(A)H)$，且
$dX_s[B;H]=-2sH$，得
$d[-\tfrac{1}{2s}\operatorname{tr}F(X_s)][H]=-\tfrac{1}{2s}\operatorname{tr}(f(X_s)(-2sH))=\operatorname{tr}(f(X_s)H)$，
再减去 $f(s^2)\operatorname{tr}H$ 就是 $\operatorname{tr}((f(X_s)-f(s^2)I)H)$ ✓。$s=0$ 时场是常数，
显然还是梯度。这一步是"仿射依赖"这个说法的兑现处，也是我一开始完全没想到的构造理由。

另外把 $f(s^2)I_N$ 减掉这件事本身也不是装饰：不减的话 $M_R(B)$ 在 $R\to\infty$ 时发散，因为
$f(s^2)\sim$ 常数的 $s$ 积分线性增长；减法把偶数部分消掉（`matrix-field.tex:107-108`：
"The first term on the right of \eqref{eq:tail} is odd in $s$ and cancels at every symmetric cutoff;
the remainder is integrable."）。

[推测] 若直接取 $M(B)=(K^2-B^2)_+^{\sigma}$（谱截断后取幂），`matrix-field.tex:200-203` 用的标量凹性
就不成立，因为 $t\mapsto t_+^\sigma$ 在 $0$ 处不是 $C^1$；而 rank-one 需要的正是 $C^1$ 与全局严格增。
[推测] 若取 $M(B)=\mu(K^2-B^2)$ 的矩阵函数形式（$\mu$ 是标量函数），它不满足
`matrix-field.tex:221-225` 的号对称等变性以外的任何共轭协变性，路径部分的 Gronwall/唯一性论证（
`connecting-path.tex:186-204`）需要的是 $M$ 沿 $S(\cdot)S$ 的等变性，这一条恰好满足，但 $M$ 的 Lipschitz
性在 $K^2-B^2$ 穿越奇异方向时不可控（$\sigma$ 幂在 0 处导数发散）；抛物线积分把奇性用 $\delta$ 磨掉了。
[推测] 若没有 $-f(s^2)I_N$ 的减法，`matrix-field.tex:47-53` 的 $M_R$ 会有一个随 $R$ 线性增长的中心项，
极限不存在，后面所有比较从第一步就没定义。

## 5 场与标量函数 $f$：$\beta$、$c$、$\delta$ 三个参数的机械理由

`matrix-field.tex:23-29` 是构造的心脏：

> Set $\beta=\sigma-\tfrac12\in(-\tfrac12,\tfrac12)$ and define
> $f:\R\to\R$ by
> \begin{equation}\label{eq:f}
>  f(0)=0,\qquad f'(y)=(\max\{y,0\}+\delta)^{\beta-1},
>  \qquad
>  c=\frac{\sigma}{\displaystyle\int_\R(1+s^2)^{\beta-1}\,ds}.
> \end{equation}

紧接着 `matrix-field.tex:30-36` 说明这两个数是被刻意选出来的：

> The exponent and normalization are chosen so that, for $z\ge0$,
> scaling the integration variable gives
> \[
>  c\int_\R f'(s^2+z)\,ds
>  =\sigma(z+\delta)^{\beta-1/2}
>  =\sigma(z+\delta)^{\sigma-1}.
> \]

我的补算与逐参数的机械理由如下。

其一，$\beta=\sigma-\tfrac12$ 的唯一作用是让
$\beta-\tfrac12=\sigma-1$。$f'$ 的幂是 $\beta-1$，$s$ 积分后幂降 $1/2$（因为
$(s^2)^{\beta-1}=s^{2\beta-2}$ 与 $ds$ 换元 $s=\sqrt{z+\delta}\,t$ 给出一个 $(z+\delta)^{1/2}$ 因子），
得到 $(z+\delta)^{\beta-3/2+1}=(z+\delta)^{\beta-1/2}$。要它等于 $(z+\delta)^{\sigma-1}$ 就必须
$\beta=\sigma-\tfrac12$。拆开看：谱侧需要的非线性指数是 $\sigma-1$（因为要积出 $(z+\delta)^\sigma$），
而一维高斯型积分 $\int(s^2+a)^{-\alpha}ds$ 的幂降是固定 $1/2$，两者之差正好是 $1/2$，$\beta$ 就是这个
补偿量。区间 $(-\tfrac12,\tfrac12)$ 来自 $\sigma\in(0,1)$，两端都开：$\beta<1/2$ 保证 $c$ 的积分在
无穷远收敛（`matrix-field.tex:43-44`："The integral defining $c$ is finite because $\beta<1/2$"），
$\beta>-1/2$ 保证 $\max\{y,0\}$ 在 $y=0$ 附近的 $(\cdot)^{\beta-1}$ 可积（$f$ 的 $C^1$ 性要求
$f'$ 连续有限，这点由 $\delta>0$ 给），同时也让 `rank-one.tex:47-48` 的 resolvent 表示
"$O(v^\beta)$ near zero and $O(v^{\beta-2})$ at infinity"两个端点同时收敛（论文说
"The range $-1<\beta<1$ suffices for convergence"，$\beta\in(-\tfrac12,\tfrac12)$ 是其真子区间）。

其二，$c$ 的归一化：取 $z=0$ 得 $c\int_{\R}f'(s^2)ds=c\int_{\R}(s^2+\delta)^{\beta-1}ds$；
换元 $s=\sqrt\delta t$ 得 $\sqrt\delta^{\,2\beta-1}\int(1+t^2)^{\beta-1}dt=\delta^{\beta-1/2}\cdot(\sigma/c)$
（按 $c$ 的定义）。所以 $c\int f'(s^2)ds=\sigma\delta^{\sigma-1}$。而 $z$ 一般时是
$\sigma(z+\delta)^{\sigma-1}=\partial_z[(z+\delta)^\sigma-\delta^\sigma]$。因此对 $z$ 积分一次就得到
`matrix-field.tex:37-38`："Integration in $z$ therefore produces the regularized power
$(z+\delta)^\sigma-\delta^\sigma$."，正是 $\mu(z)$ 在 $z\ge0$ 时的显式值
（`matrix-field.tex:150-153`）。$\delta^\sigma$ 这个常数偏移是为了 $f(0)=0$（即 $\mu(0)=0$）而不得不减掉的；
后面 `action-limit.tex:66-69` 取 $\delta\to0$ 时 $(z+\delta)^\sigma-\delta^\sigma\to z^\sigma$，
偏移自动消失。我特别注意了 $\mu(0)=0$ 这条：`connecting-path.tex:15-16` 把它列为路径论证要用的性质之一，
因为它让 `matrix-field.tex:221` 的 $M(K)=M(-K)=0$ 成立，从而路径端点处的 $B'$ 只差一个 $aa^{\mathsf T}$。

其三，$\max\{y,0\}$ 与"负半轴上 $f'$ 取常数"：`matrix-field.tex:40-41`
"Keeping $f'$ constant for negative arguments extends the construction
beyond that interval, as needed for the continuation argument."。
我的理解是：路径 $B(x)$ 在途中不满足 $K^2-B^2\ge0$，$X_s(B)$ 的谱可以取负，所以 $f$ 必须在 $\R$ 上定义；
用 $\max\{y,0\}$ 把负侧冻结成 $f'(y)=\delta^{\beta-1}$，$f$ 就在全 $\R$ 上 $C^1$、严格增、凹
（`matrix-field.tex:42`），这三条分别被 `lem:jensen` 的凹性证明（`matrix-field.tex:200-203`）、
rank-one 的严格增（`rank-one.tex:82-83`）与 resolvent 表示使用。若负侧不冻结而直接取
$(y+\delta)^{\beta-1}$，$y\to-\delta$ 时 $f'$ 爆炸，$f$ 连 $C^1$ 都没有。

其四，$\delta>0$ 的必要性在三个不同地方各断一次：(i) `matrix-field.tex:94-95` 说"All arguments of $f$
are positive"，尾部估计靠 $f''(y)=(\beta-1)(y+\delta)^{\beta-2}$；$\delta=0$ 时 $f''$ 在 $0$ 附近不可积。
(ii) `rank-one.tex:70-71`："All these integrals converge absolutely, since $\delta>0$."，
指 resolvent 分母 $(y_i+\delta+v)(y_j+\delta+v)$。 (iii) `rank-one.tex:123` 的
$P_{ij}$ 核里有 $(d+\delta)$ 做分母。三处都只依赖 $\delta>0$，都不要求 $\delta$ 小；
这就是为什么 `action-limit.tex:63` 能"Let $\varepsilon\downarrow0$ at this fixed $\delta$"，把 $\delta$
的极限留到最后。

场的定义在 `matrix-field.tex:46-53`：

> For $B\in\Sym_N$, put
> \begin{equation}\label{eq:X-M}
>  \begin{split}
>  X_s(B)&=K^2-2sB+s^2I_N,\\
>  M_R(B)&=c\int_{-R}^R\bigl(f(X_s(B))-f(s^2)I_N\bigr)\,ds,\\
>  M(B)&=\lim_{R\to\infty}M_R(B).
>  \end{split}
> \end{equation}

我数出这里有两个容易忽略的记号约定：标量函数作用在对称/Hermitian 矩阵上走谱定理
（`matrix-field.tex:54-55`："Here and below scalar functions of symmetric or Hermitian matrices are
defined by the spectral theorem."），以及"对称截断是定义的一部分"（`matrix-field.tex:55-56`：
"The symmetric cutoff in \eqref{eq:X-M} is part of the definition."）。第二条在 rank-one 部分被反复消费，
因为 $\int_{-R}^R$ 的奇偶消去（`matrix-field.tex:107-108`）在非对称截断下不成立；若换成
$\int_0^R$，$-2sf'(s^2)B$ 项会留下一个正比于 $B$ 的发散项，$M$ 直接不存在。

[推测] 把 $\beta$ 改成 $\sigma$（即不设 $-1/2$ 的补偿），$c\int f'(s^2+z)ds=\sigma(z+\delta)^{\sigma-3/2}$，
积出来是 $(z+\delta)^{\sigma-1/2}$ 的倍数，`matrix-field.tex:150-153` 的 $\mu(z)=(z+\delta)^\sigma-\delta^\sigma$
变成 $\mu(z)\propto(z+\delta)^{\sigma-1/2}$，于是 `rank-one.tex:96` 的
$d=(m+\delta^\sigma)^{1/\sigma}-\delta$ 无法解出，`rank-one.tex:100` 那句"This choice matches the nonzero
eigenvalue of $M(B)$"当场失效。
[推测] 把 $f'$ 的幂改成 $\beta$ ，并非 $\beta-1$，$f$ 变成 $(y+\delta)^{\beta}$ 型，
$f$ 的凹性在 $\beta\in(0,1)$ 时仍在，但 $\int_{\R}(s^2+\delta)^{\beta}ds$ 发散，$M$ 与 $\mu$ 都没定义。
[推测] 去掉 $\max\{\cdot,0\}$ 而用 $|y|^{\beta-1}$：$f$ 变成非单调，`lem:mu` 的严格增失效，
`rank-one.tex:82-89` 的"$X_s(B)\ge0$"整块论证崩塌，切不等式 `rank-one.tex:37` 的 $f(X)\le f(Y)+T_Y(X-Y)$
不再能套（它要求 $X,Y\ge0$）。

## 6 收敛性与原函数：为什么度量非选 Hilbert--Schmidt 不可

`matrix-field.tex:63-66` 先立了一个看起来与主题无关的小引理：

> \begin{lemma}\label{lem:HS-calculus}
> If a real function $h$ is $L$-Lipschitz on an interval containing the spectra
> of two Hermitian matrices $A$ and $B$, then
> $\|h(A)-h(B)\|_{\HS}\le L\|A-B\|_{\HS}$.

它的证明在 `matrix-field.tex:68-77` 只有四行：取两套正交特征基 $v_i,w_j$，
$h(A)-h(B)$ 在第 $(i,j)$ 个位置是 $(h(\lambda_i)-h(\nu_j))\langle v_i,w_j\rangle$，
$A-B$ 的对应位置是 $(\lambda_i-\nu_j)\langle v_i,w_j\rangle$，平方求和后逐项用标量 Lipschitz 界。
我把平方求和那一步写全：$\|h(A)-h(B)\|_{\HS}^2=\sum_{ij}(h(\lambda_i)-h(\nu_j))^2|\langle v_i,w_j\rangle|^2
\le L^2\sum_{ij}(\lambda_i-\nu_j)^2|\langle v_i,w_j\rangle|^2=L^2\|A-B\|_{\HS}^2$ ✓。
这条引理的价值在于它绕开了 Löwner--Heinz 型算子 Lipschitz 结论：$\sigma$ 幂在 $[0,\infty)$ 上
它不是算子 Lipschitz（这是矩阵分析里的经典反例），但它在 HS 范数下是 Lipschitz 的，只需标量 Lipschitz。
[推测] 我一开始试图用算子范数版本：立刻断在这里，因为 $f'$ 的算子 Lipschitz 常数根本不有限，
$M$ 的局部 Lipschitz 性（路径部分 `connecting-path.tex:14-15` 明确要用）就没法证。

有了它，场的收敛性（`matrix-field.tex:79-86`）就变成一次尾部阶的记账：

> \begin{lemma}\label{lem:field-regularity}
> The limit in \eqref{eq:X-M} is locally uniform. The resulting map $M$ is
> locally Lipschitz. Moreover,
> \begin{equation}\label{eq:J}
>  J(B)=-\int_0^1\tr\bigl(BM(tB)\bigr)\,dt
> \end{equation}

我的补算按 `matrix-field.tex:88-109` 逐行走。固定 $B$ 的有界集，$|s|$ 大时
$H_s(B)=K^2-2sB$ 的谱落在 $[-A|s|,A|s|]$，$A$ 与 $B$ 无关（因为 $\|K^2\|$ 固定、$\|2sB\|\le 2|s|\cdot\sup\|B\|$）。
定义二阶 Taylor 余项 $h_s(t)=f(s^2+t)-f(s^2)-f'(s^2)t$。在区间 $[-A|s|,A|s|]$ 上，
$f$ 的自变量 $s^2+t>0$（$|s|$ 足够大时），故 $f''(y)=(\beta-1)(y+\delta)^{\beta-2}$ 可用。
于是 $|h_s'(t)|=|f'(s^2+t)-f'(s^2)|\le\sup_{|u|\le A|s|}|f''(s^2+u)|\cdot|t|
\asymp(s^2-2A|s|)^{\beta-2}\cdot A|s|\asymp|s|^{2\beta-4}\cdot|s|=O(|s|^{2\beta-3})$，
这正是 `matrix-field.tex:97` 的 $\operatorname{Lip}(h_s)=O(|s|^{2\beta-3})$；
而 $|h_s(t)|\le|t|\cdot|h_s'(\cdot)|$ 给 $O(|s|^{2\beta-3}\cdot|s|)=O(|s|^{2\beta-2})$，
即 `matrix-field.tex:98`。合起来：$R_s(B)=f'(s^2)K^2+h_s(H_s(B))$，第一项
$f'(s^2)=(s^2+\delta)^{\beta-1}=O(|s|^{2\beta-2})$ ✓，第二项的 $B$-Lipschitz 常数用链式法则
$\operatorname{Lip}(h_s)\cdot\|B\mapsto H_s(B)\|=O(|s|^{2\beta-3})\cdot 2|s|=O(|s|^{2\beta-2})$，
论文在 `matrix-field.tex:105-107` 用一句话说了同一件事："the factor $2|s|$ from $H_s$ multiplies
$O(|s|^{2\beta-3})$"。

关键收口在 `matrix-field.tex:107-109`：

> The first term on the right of \eqref{eq:tail} is odd
> in $s$ and cancels at every symmetric cutoff; the remainder is integrable.
> On bounded $s$-intervals, $f$ is Lipschitz and the same lemma applies directly.

"可积"的机械条件是 $2\beta-2<-1$，即 $\beta<1/2$，与第 5 节里 $c$ 有限的条件**完全同一个**。
我特意核对了这个巧合：$-2sf'(s^2)B$ 里 $f'(s^2)$ 是偶函数、乘 $s$ 变奇，在 $[-R,R]$ 上逐点为 0，
所以唯一的发散风险被奇偶性消掉，剩下 $O(|s|^{2\beta-2})$ 的余项可积。如果截断不是对称的，
这个消去就没有，$\int^R s\,ds$ 二次发散，$M$ 不存在。这就是 `matrix-field.tex:55-56` 把
"The symmetric cutoff in \eqref{eq:X-M} is part of the definition."写成定义级声明的原因，也是
`rank-one.tex:109-110` 反复注明"with the integral understood at symmetric cutoffs"的原因。

原函数 $J$ 那半部分（`matrix-field.tex:112-135`）我读的时候最不舒服，因为它故意不直接对 $M$ 求导。
逻辑是三步：其一，$d\operatorname{tr}F(A)[H]=\operatorname{tr}(f(A)H)$（`matrix-field.tex:114-116`），
多项式情形由迹的循环性，一般情形由紧谱区间上用多项式同时逼近 $F$ 与 $F'$（`matrix-field.tex:117-118`）。
其二，$s\ne0$ 时 $B\mapsto f(X_s(B))-f(s^2)I_N$ 是梯度场，势显式写作
$-\frac{1}{2s}\operatorname{tr}F(X_s(B))-f(s^2)\operatorname{tr}B$（`matrix-field.tex:119-123`）；
我代进去验过：$dX_s[B;H]=-2sH$，故前项微分给 $\operatorname{tr}(f(X_s)H)$，后项给 $f(s^2)\operatorname{tr}H$，
差就是要的场 ✓；$s=0$ 时 $X_0=K^2$ 与 $B$ 无关，场为常数 $f(K^2)-f(0)I$，显然也是梯度。
其三，于是每个 $M_R$ 沿任何分段 $C^1$ 闭曲线积分为 0（`matrix-field.tex:124-126`，先沿曲线积再对 $s$ 积），
所以射线公式 `matrix-field.tex:128` 的 $J_R(B)=-\int_0^1\operatorname{tr}(BM_R(tB))dt$ 确实是它的势
（梯度场的势等于沿射线积分，且此定义给出 $J_R(0)=0$）。最后局部一致收敛让 $J_R\to J$、$M_R\to M$，
把线段恒等式取极限得 `matrix-field.tex:131-133` 的
$J(B+H)-J(B)=-\int_0^1\operatorname{tr}(M(B+tH)H)dt$，由 $M$ 连续直接读出 $J$ 是 $C^1$ 且
$dJ(B)[H]=-\operatorname{tr}(M(B)H)$，即 `action-framework.tex:39-41` 的 \eqref{eq:framework-gradient}。
[推测] 若直接对 $M=\lim M_R$ 求导再逐项交换极限，需要先证 $DM_R$ 的一致收敛，而 $f''$ 的尾部阶只给
$O(|s|^{2\beta-4})$（不可积！，$2\beta-4<-1$ 需要 $\beta<3/2$ 才勉强，但一致收敛性拿不到），
这条硬路会断；作者用闭曲线积分绕开二阶信息，是我没想到的取巧处。
[推测] 若 $J$ 定义里的 $tB$ 换成 $B+tH$ 之类的其它参数化，射线公式与势的一致性就要重新验证，
而 $M$ 只在 HS 度量下 Lipschitz，其它参数化会引入非对称扰动。

## 7 $\mu$：一个显式公式加一条平移不变性，撑起了全部紧性

`matrix-field.tex:139-145` 定义 $\mu$ 并立刻交代收敛性：

> Define
> \begin{equation}\label{eq:mu}
>  \mu(z)=c\int_\R\bigl(f(s^2+z)-f(s^2)\bigr)\,ds,
>  \qquad z\in\R.
> \end{equation}
> This integral is absolutely convergent: on bounded $z$-sets its integrand
> has tail $O(|s|^{2\beta-2})$.

结论集中在 `matrix-field.tex:147-158`：

> \begin{lemma}\label{lem:mu}
> The function $\mu$ is locally Lipschitz and strictly increasing, with
> $\mu(0)=0$. For $z\ge0$,
> \begin{equation}\label{eq:mu-positive}
>  \mu(z)=(z+\delta)^\sigma-\delta^\sigma,
>  \qquad \mu'(z)=\sigma(z+\delta)^{\sigma-1}.
> \end{equation}
> For every fixed $b,z\in\R$,
> \begin{equation}\label{eq:shift}
>  c\lim_{R\to\infty}\int_{-R}^R
>  \bigl(f((s-b)^2+z)-f(s^2)\bigr)\,ds=\mu(z).
> \end{equation}

第一式的推导我在第 5 节已备好：$\mu'(z)=c\int_{\R}(s^2+z+\delta)^{\beta-1}ds
=\sigma(z+\delta)^{\beta-1/2}=\sigma(z+\delta)^{\sigma-1}$（`matrix-field.tex:164-168` 逐字如此），
从 0 积到 $z$ 并用 $\mu(0)=0$ 得 $\mu(z)=(z+\delta)^\sigma-\delta^\sigma$。$\delta\to0$ 时
$\mu(z)\to z^\sigma$，第 4 节的标量原型 $m=(k^2-b^2)^\sigma$ 就这样被恢复，这就是
`action-limit.tex:63-69` 里"先 $\varepsilon\to0$ 后 $\delta\to0$"这个顺序能够存在的数学依据。

第二式（平移不变性）是我在这个单元里花最久的地方，因为它看起来"当然"，但证明方式很挑。
`matrix-field.tex:171-180` 的做法：令 $g(s)=f(s^2+z)$，它偶，且 $g'(s)=2sf'(s^2+z)=O(|s|^{2\beta-1})\to0$。
$b\ge0$ 时差是 $\int_R^{R+b}g(t)dt-\int_{R-b}^{R}g(t)dt$，绝对值 $\le b^2\sup_{|t-R|\le b}|g'(t)|\to0$。
我核对了两处阶：$2\beta-1<0$（同样要求 $\beta<1/2$）才让 $\sup|g'|\to0$；$b^2$ 因子来自用中值定理把
两个长度 $b$ 的端块之差压成 $b\cdot(b\sup|g'|)$。偶性处理 $b<0$。这条恒等式的用武之地在两处：
`matrix-field.tex:191-192` 的 $M(B)e_i=\mu(k_i^2-b_i^2)e_i$（因为 $X_s(B)$ 在共同特征向量上的特征值
正是 $(s-b_i)^2+k_i^2-b_i^2$，$z=k_i^2-b_i^2$、平移量 $b=b_i$），以及 `rank-one.tex:108-110` 的
$c\int_{\R}(f(Y_s)-f(s^2)I)ds=mI$（$Y_s$ 的特征值 $(s-z_i)^2+d$，逐特征值平移后都给 $\mu(d)=m$）。
也就是说：$M$ 的定义里嵌的是 $(s-b)^2$，而比较用的 $Y_s$ 里嵌的是 $(sI-B)^2$，把两者缝起来的就是这条
平移不变性；没有它，`eq:M-tangent` 右端的 $mI$ 无从出现。

方向比较（`matrix-field.tex:183-188`）：

> \begin{lemma}[Directional comparison]\label{lem:jensen}
> For every $B\in\Sym_N$ and every real unit vector $e$,
> \begin{equation}\label{eq:jensen}
>  e^{\transpose}M(B)e\le
>  \mu\bigl(e^{\transpose}K^2e-(e^{\transpose}Be)^2\bigr).
> \end{equation}

证明只有三行（`matrix-field.tex:200-203`）：$e^{\mathsf T}f(X_s(B))e\le f(e^{\mathsf T}X_s(B)e)$。
我把这行的来源写清：取 $X_s(B)$ 的特征基，$e=\sum_j\alpha_jv_j$，$\sum\alpha_j^2=1$，则
$e^{\mathsf T}f(X_s)e=\sum_j\alpha_j^2f(\lambda_j)\le f(\sum_j\alpha_j^2\lambda_j)=f(e^{\mathsf T}X_se)$，
用的是**标量** $f$ 的凹性加 Jensen。`matrix-field.tex:206-207` 特别强调了这一点：
"This uses scalar concavity only; no operator concavity on the whole real line is asserted."
右端标量是 $(s-b)^2+z$，其中 $b=e^{\mathsf T}Be$、$z=e^{\mathsf T}K^2e-b^2$（这个 $z$ 恰好是
$e^{\mathsf T}(K^2-B^2)e$ 的形式，第 10 节的 rank-one 结论要的就是它）。对称截断积分后由 \eqref{eq:shift}
得到 $\mu(z)$ ✓。注意这里 $z$ 可正可负，而 \eqref{eq:mu-positive} 只对 $z\ge0$ 成立；论文没有把 $\mu$
的负侧写成显式公式，负侧只靠严格增与局部 Lipschitz 消费。
[推测] 若误以为 $t\mapsto t_+^\sigma$ 算子凹从而直接写 $M(B)\le\mu(K^2-B^2)$（矩阵不等式），
会在 $B$ 与 $K$ 不交换时出错，算子 Jensen 需要 operator concavity，而 $\delta$ 正则化后的 $f$ 在
全 $\R$ 上不 operator concave；作者把不等式降级为"每个方向一个标量不等式"，是我读到的第一个
真正的手法差异。

边界面值（`matrix-field.tex:194-197`）：

> For the primitive in \eqref{eq:J},
> \begin{equation}\label{eq:boundary-J}
>  J(-K)-J(K)=\sum_{i=1}^N\int_{-k_i}^{k_i}\mu(k_i^2-s^2)\,ds.
> \end{equation}

推导在 `matrix-field.tex:211-218`：把 $dJ=-\operatorname{tr}(M\,dB)$ 限制到对角矩阵上，
沿对角线段从 $K$ 走到 $-K$，第 $i$ 个坐标贡献 $-\int_{k_i}^{-k_i}\mu(k_i^2-s^2)ds$。
这里用的是 \eqref{eq:common-eigenvector}（对角路径上每个 $B$ 都对角，故每个 $e_i$ 都是特征向量）。
$M(K)=M(-K)=0$（`matrix-field.tex:221`）由 $\mu(0)=0$ 立得，它保证路径端点处方程
$\varepsilon B'=M(B)-aa^{\mathsf T}$ 退化为 $\varepsilon B'=-aa^{\mathsf T}$，端点的强制项符号正确。
号对称等变性在 `matrix-field.tex:221-227`：$SKS=K$，$X_s(SBS)=SX_s(B)S$，谱定理给
$f(X_s(SBS))=Sf(X_s(B))S$，故逐截断成立。`matrix-field.tex:226-227` 补了一句限定：
"The matrix $K$ stays fixed throughout; we do not require equivariance under conjugations that move $K$."
这句话我先前理解错了，把它当成"等变性不重要"，实际上它是第 12 节商流形构造的前提：$G$ 只由号矩阵组成，
商空间 $\mathcal L^\times/G$ 的维数与 $\Sym_N$ 的维数相同（都是 $N(N+1)/2$），这个等维数才是
`path:parity` 的 rank $d$ 假设能被满足的唯一原因。

## 8 rank-one 比较（上）：把 $f$ 写成 resolvent 的积分，切不等式就白送

`rank-one.tex:7-13` 是本篇唯一一条我一开始看不出必要性的命题：

> \begin{proposition}\label{prop:rankone}
> For every $B\in\Sym_N$ and every $a\in\R^N$,
> \begin{equation}\label{eq:rankone}
>  M(B)=aa^{\transpose}\quad\Longrightarrow\quad
>  a^{\transpose}(K^2-B^2)a\ge |a|^{2q}.
> \end{equation}

它的地位要从 `action-limit.tex:3-6` 才看得清："The matrix comparison controls points
where $M(B)=aa^{\transpose}$ exactly. The differential equation supplies a penalty for the remaining
points"。也就是把整个作用量不等式拆成"精确满足 rank-one 的点"与"不满足的点"，后者靠 $\varepsilon^{-1}$ 罚。
`rank-one.tex:15-17` 给出三步计划：

> The proof compares $X_s(B)$ with a matrix that is a function of $B$ alone.
> Its tangent map, integrated in $s$, is an average of unitary conjugations.
> Trace monotonicity then removes this average from the needed inequality.

第一步的装置是 resolvent 表示（`rank-one.tex:29-34`）：

> \begin{equation}\label{eq:resolvent-f}
>  f(y)=c_\beta\int_0^\infty v^\beta
>  \left(\frac1{\delta+v}-\frac1{y+\delta+v}\right)\,dv,
>  \qquad
>  c_\beta^{-1}=\int_0^\infty\frac{t^\beta}{(1+t)^2}\,dt.
> \end{equation}

我验算了三条。收敛性：$v\to0$ 时被积函数 $\sim v^\beta\cdot y/(\delta(\delta+v))$，即 $O(v^\beta)$，
需 $\beta>-1$；$v\to\infty$ 时括号 $\sim y/v^2$，即 $O(v^{\beta-2})$，需 $\beta<1$；
`rank-one.tex:47-48` 正是这两句（"The range $-1<\beta<1$ suffices for convergence."），
$\beta\in(-\tfrac12,\tfrac12)$ 落在其中。求导：$c_\beta\int_0^\infty v^\beta/(y+\delta+v)^2dv$，
换元 $v=(y+\delta)t$ 得 $c_\beta(y+\delta)^{\beta-1}\int_0^\infty t^\beta/(1+t)^2dt
=c_\beta c_\beta^{-1}(y+\delta)^{\beta-1}=(y+\delta)^{\beta-1}=f'(y)$ ✓（`rank-one.tex:50-53`），
两端在 $y=0$ 同时为 0，故 \eqref{eq:resolvent-f} 成立。$\delta>0$ 在这里第三次出现为必需：
`rank-one.tex:70-71` "All these integrals converge absolutely, since $\delta>0$."，
$\delta=0$ 且 $y_i=y_j=0$ 时 $\int v^{\beta}/(v)^2$ 在 0 端发散。

切不等式（`rank-one.tex:36-44`）：

> If $X,Y\ge0$ are Hermitian matrices, then
> \begin{equation}\label{eq:tangent}
>  f(X)\le f(Y)+T_Y(X-Y),
> \end{equation}
> where, in an eigenbasis of $Y$ with eigenvalues $y_i$,
> \begin{equation}\label{eq:divdiff}
>  (T_Y Z)_{ij}=f[y_i,y_j]Z_{ij},\qquad
>  f[x,y]=\int_0^1 f'(\tau x+(1-\tau)y)\,d\tau.
> \end{equation}

证明的核心是算子单调性 $t\mapsto-(A+tZ)^{-1}$ 的凹性：`rank-one.tex:58-63` 的 resolvent 恒等式
$-(A+Z)^{-1}=-A^{-1}+A^{-1}ZA^{-1}-A^{-1}Z(A+Z)^{-1}ZA^{-1}$，最后一项 $\le0$（它是
$-[(A+Z)^{-1/2}ZA^{-1}]^{*}[\cdots]$ 型的平方项，或直接用 $A+Z>0$ 写作
$-A^{-1}Z(A+Z)^{-1}ZA^{-1}=-( (A+Z)^{-1/2}ZA^{-1})^{*}((A+Z)^{-1/2}ZA^{-1})\cdot$ 对称化，非正），
所以 $-(A+Z)^{-1}\le-A^{-1}+A^{-1}ZA^{-1}$，对 $v$ 带权 $v^\beta$ 积分即 \eqref{eq:tangent}。
线性项对 $Z_{ij}$ 的系数是 $c_\beta\int_0^\infty\frac{v^\beta}{(y_i+\delta+v)(y_j+\delta+v)}dv$
（`rank-one.tex:64-69`），我验证它等于 $f[y_i,y_j]$：用恒等式
$\frac1{ab}=\int_0^1\frac{d\tau}{(\tau a+(1-\tau)b)^2}$（两边对 $a$ 积分即可看出），
于是内层 $v$ 积分交换为 $c_\beta\int_0^1d\tau\int_0^\infty\frac{v^\beta}{(\tau(y_i+\delta)+(1-\tau)(y_j+\delta)+v)^2}dv$，
内层按前面的求导公式给 $(\tau y_i+(1-\tau)y_j+\delta)^{\beta-1}=f'(\tau y_i+(1-\tau)y_j)$ ✓。
重根情形 $y_i=y_j$ 时该式给出 $f'(y_i)$，与 \eqref{eq:divdiff} 的第二条一致，
所以 `rank-one.tex:70` 这句"This also covers repeated eigenvalues."是白送的。

这里有一个我一开始没跟上的限定：\eqref{eq:tangent} 只在 $X,Y\ge0$ 时成立，而 $X_s(B)$ 一般不定。
`rank-one.tex:76-89` 专门先把 $X_s(B)$ 证成半正定（**前提**是 $M(B)=aa^{\mathsf T}$）：

> Strict increase of $\mu$ implies
> $e^{\transpose}K^2e\ge(e^{\transpose}Be)^2$. Consequently
> \begin{equation}\label{eq:X-positive}
>  e^{\transpose}X_s(B)e
>  =(s-e^{\transpose}Be)^2
>    +e^{\transpose}K^2e-(e^{\transpose}Be)^2\ge0
> \end{equation}
> for every real $s$: the matrices $X_s(B)$ are positive semidefinite.

我的补记：由 \eqref{eq:jensen} 与 $e^{\mathsf T}M(B)e=|e^{\mathsf T}a|^2\ge0$，得
$0\le\mu(e^{\mathsf T}K^2e-(e^{\mathsf T}Be)^2)$；$\mu$ 严格增且 $\mu(0)=0$ 就逼出括号 $\ge0$。
代回 $e^{\mathsf T}X_s(B)e=e^{\mathsf T}K^2e-2s\,e^{\mathsf T}Be+s^2=(s-e^{\mathsf T}Be)^2
+\bigl(e^{\mathsf T}K^2e-(e^{\mathsf T}Be)^2\bigr)\ge0$ ✓。注意配方那一步正是第 4 节
`matrix-field.tex:17-19` 那条恒等式 $k^2-2sb+s^2=(s-b)^2+k^2-b^2$ 的矩阵版；
也就是说这条恒等式在论文里被用了两次：一次构造 $M$，一次在 rank-one 里保证半正定性。
[推测] 若去掉 $\mu(0)=0$（比如把 $f(0)=0$ 改成任意常数），最后一步只能得到括号 $\ge$ 某个非零常数，
半正定性可能在 $e^{\mathsf T}K^2e=(e^{\mathsf T}Be)^2$ 的边界方向失效，resolvent 表示的 $y\ge0$ 假设断裂。
[推测] 若不用 rank-one 假设而试图对所有 $B$ 证 \eqref{eq:rankone}，$X_s(B)$ 不定，切不等式无从应用；
这正是第 14 节需要 $\varepsilon^{-1}$ 惩罚项的根本原因。

## 9 rank-one 比较（中）：$\mathcal P$ 是酉共轭的平均，我在这里第一次改方向

选定比较对象是这一节的关键动作，`rank-one.tex:91-103`：

> To apply the tangent inequality, we compare $X_s(B)$ with
> $(sI-B)^2+dI$, which is diagonal in an eigenbasis of $B$.
> Choose $d>0$ so that its integrated scalar value is $\mu(d)=m$:
> \begin{equation}\label{eq:D-d-Y}
>  D=K^2-B^2,\qquad
>  d=(m+\delta^\sigma)^{1/\sigma}-\delta,\qquad
>  Y_s=(sI-B)^2+dI.
> \end{equation}
> This choice matches the nonzero eigenvalue of $M(B)$.
> When we pair the integrated tangent inequality with $M(B)$,
> the identity $M(B)^2=mM(B)$ will cancel the contribution $mI$
> against the left side.
> We have $X_s(B)=Y_s+(D-dI)$; we do not assert that $D\ge0$.

我把 $d$ 的来历解出来：$\mu(d)=m$ 且 $d\ge0$ 时用 \eqref{eq:mu-positive}，
$(d+\delta)^\sigma-\delta^\sigma=m\iff(d+\delta)^\sigma=m+\delta^\sigma\iff d=(m+\delta^\sigma)^{1/\sigma}-\delta$ ✓。
$d>0$ 因为 $m>0$ 时 $(m+\delta^\sigma)^{1/\sigma}>\delta$（两边 $\sigma$ 次幂即 $m+\delta^\sigma>\delta^\sigma$）。
$Y_s\ge dI>0$ 严格正定，正好满足 \eqref{eq:tangent} 里 $Y>0$ 的需要（resolvent 论证中
$A=Y+(\delta+v)I$ 必须正定）。$X_s(B)=Y_s+(D-dI)$ 是纯代数：
$K^2-2sB+s^2=((sI-B)^2+dI)+(K^2-B^2-dI)$，因 $(sI-B)^2=s^2I-2sB+B^2$ ✓。
最后一句"we do not assert that $D\ge0$"是作者在防我把 $D$ 当正定用，确实不能用：
$D\ge0$ 等价于结论本身的一部分，属于循环。

积分切不等式得到的 \eqref{eq:M-tangent}（`rank-one.tex:105-114`）：

> Apply Lemma~\ref{lem:resolvent-tangent} to $X_s(B)\ge0$ and $Y_s>0$,
> and denote the tangent map at $Y_s$ by $T_s$.
> Subtract $f(s^2)I$ and integrate symmetrically.
> In an eigenbasis of $B$, the shift identity \eqref{eq:shift} gives
> $c\int_\R(f(Y_s)-f(s^2)I)\,ds=mI$, with the integral understood
> at symmetric cutoffs. Thus
> \begin{equation}\label{eq:M-tangent}
>  M(B)\le mI+\mu'(d)\mathcal P(D-dI),
>  \qquad \mathcal P=\frac{c}{\mu'(d)}\int_\R T_s\,ds.
> \end{equation}

左端 $c\int(f(X_s)-f(s^2)I)ds=M(B)$ 是定义；右端第一项来自
$c\int(f(Y_s)-f(s^2)I)ds$，其特征值 $(s-z_i)^2+d$ 经 \eqref{eq:shift} 每个都变 $\mu(d)=m$，
故整体为 $mI$（这一句是我在第 7 节末尾说的"缝起来"的兑现处）；第二项是
$c\int T_s(X_s-Y_s)ds=c\int T_s(D-dI)ds$，作者把 $c\int T_sds$ 拆成 $\mu'(d)\mathcal P$。
拆分的理由在 \eqref{eq:P-kernel} 的证明里，`rank-one.tex:133-142`：$Y_s$ 的特征值
$y_i=(s-z_i)^2+d$，代入 \eqref{eq:divdiff}：

>  f[y_i,y_j]=\int_0^1
>  \bigl((s-\tau z_i-(1-\tau)z_j)^2+d+\delta
>        +\tau(1-\tau)(z_i-z_j)^2\bigr)^{\beta-1}\,d\tau.

我补出这一步：$f'(\tau y_i+(1-\tau)y_j)$ 里的 $\tau y_i+(1-\tau)y_j+d+\delta$ 要写成"完全平方加常数"，
$\tau(s-z_i)^2+(1-\tau)(s-z_j)^2=(s-\tau z_i-(1-\tau)z_j)^2+\tau(1-\tau)(z_i-z_j)^2$
（这是方差分解恒等式 $\tau a^2+(1-\tau)b^2=(\tau a+(1-\tau)b)^2+\tau(1-\tau)(a-b)^2$ 取 $a=s-z_i$、
$b=s-z_j$，注意 $\tau a+(1-\tau)b=s-(\tau z_i+(1-\tau)z_j)$、$a-b=z_j-z_i$）✓。
被积函数非负（`rank-one.tex:140` "These scalar integrands are nonnegative."），所以可用 Tonelli 换序，
对 $s$ 积分时把中心 $\tau z_i+(1-\tau)z_j$ 平移掉（对称截断下合法），剩下的正是第 5 节 \eqref{eq:mu-positive}
那条算式，只是把 $d+\delta$ 换成 $d+\delta+\tau(1-\tau)(z_i-z_j)^2$：
$c\int_{\R}(\cdots)^{\beta-1}ds=\sigma(d+\delta+h)^{\beta-1/2}=\sigma(d+\delta+h)^{\sigma-1}$，
其中 $h=\tau(1-\tau)(z_i-z_j)^2$。提出 $\mu'(d)=\sigma(d+\delta)^{\sigma-1}$ 就得
$P_{ij}=\int_0^1(1+h/(d+\delta))^{\sigma-1}d\tau$，即 `rank-one.tex:121-124` 的
\eqref{eq:P-kernel}。`rank-one.tex:141-142` 用"by the same calculation as $\mu'(d)$ in Lemma~\ref{lem:mu}"
一句话跳过的正是这段。收敛性：$T_s$ 的矩阵元 $=O(|s|^{2\beta-2})$（`rank-one.tex:115-116`），
分母 $d+\delta>0$ 保证了 $\sigma-1<0$ 时 $(1+hx^2/(d+\delta))^{\sigma-1}$ 有界可控。

真正的转折在 \eqref{eq:P-average}（`rank-one.tex:125-130`）：

> There is an even probability measure $\nu$ on $\R$ such that
> \begin{equation}\label{eq:P-average}
>  \mathcal P(Z)=\int_\R e^{itB}Ze^{-itB}\,d\nu(t).
> \end{equation}
> In particular $\mathcal P(I)=I$, and $\mathcal P$ is self-adjoint for the
> trace pairing on Hermitian matrices.

构造链条（`rank-one.tex:144-160`）我完全补上了。Gamma 积分给出
$(1+hx^2)^{\sigma-1}=\frac1{\Gamma(1-\sigma)}\int_0^\infty v^{-\sigma}e^{-v}e^{-vhx^2}dv$ ✓，
因为 $\int_0^\infty v^{-\sigma}e^{-(1+hx^2)v}dv=\Gamma(1-\sigma)(1+hx^2)^{\sigma-1}$（需 $\sigma<1$）。
密度 $v^{-\sigma}e^{-v}/\Gamma(1-\sigma)$ 总质量恰为 1（同上取 $h=0$），所以它是一个概率测度；
$e^{-vhx^2}$ 是方差 $2vh$ 的中心 Gauss 在 $x$ 处的特征函数（$\mathbb E e^{itX}=e^{-\frac12(2vh)x^2}$）；
$\tau$ 在 $[0,1]$ 均匀、$h=\tau(1-\tau)/(d+\delta)$，混合起来得 $\nu$，且 $\nu$ 与 $i,j$ 无关，
这是 $\mathcal P$ 能写成**同一个**共轭平均的原因。对角元：$x=0$ 时 $P_{ii}=1$；
自伴性：$\nu$ 偶，$t\to-t$ 加上迹循环 ✓。

这一步为什么是转折：我要证的最终结论涉及 $D$ 本身，而手上只有 $\mathcal P(D)$。
把 $\mathcal P$ 认成酉共轭的平均之后，问题从"某个抽象正线性映射"变成"一族具体的
$\operatorname{tr}(f(X_s)\cdot(2D-UDU^{*}-U^{*}DU))$"，从而可以套单调性。
[推测] 如果 $\mathcal P$ 只是"正映射"而没有表示成共轭平均，第 10 节的 trace 单调就没有可用对象；
一般 doubly-stochastic（Unruh--Holt 型）映射也能写成共轭平均（量子信道 Kraus 表示），但那需要更多 Kraus
算子且不与 $B$ 对易，代数量会失控；这里 $\nu$ 的关键属性是所有 Kraus 算子都是 $e^{itB}$，都与 $B$ 交换。
[推测] 如果 $\sigma-1$ 换成 $\sigma-2$（即核 $(1+\cdot)^{\sigma-2}$），它不再是正定函数的幂，
Gauss 混合的特征函数表示就没了，$\nu$ 会变成带符号测度，第 10 节的"平均后取 $\ge0$"当场失效。
[推测] 若 $\tau$ 的选取非均匀，$P_{ij}$ 会变，但 $P_{ii}=1$ 与偶性仍成立；说明这个自由度是
构造上的冗余，作者取均匀是因为 $P_{ij}$ 必须等于 $c\int f[y_i,y_j]ds/\mu'(d)$ 这个由 \eqref{eq:divdiff}
定死的量。

## 10 rank-one 比较（下）：一次 trace 单调性把平均吃掉，再用次可加性收口

`rank-one.tex:162-164` 明确交代了缺口在哪里：

> The integrated tangent inequality \eqref{eq:M-tangent} controls
> $\mathcal P(D)$, while the desired conclusion involves $D$ itself. The
> next step compares them in precisely the trace pairing with $M(B)$.

结论是 \eqref{eq:trace-average}（`rank-one.tex:168-172`）：

> \begin{lemma}\label{lem:trace-average}
> With $B,D$ and $\mathcal P$ as above,
> \begin{equation}\label{eq:trace-average}
>  \tr(M(B)D)\ge\tr(M(B)\mathcal P(D)).
> \end{equation}

工具是广义 Klein 迹不等式的一个初值实例（`rank-one.tex:175-185`），出处标在
Petz 的综述：

> \begin{equation}\label{eq:trace-monotonicity}
>  \tr\bigl((g(A_1)-g(A_2))(A_1-A_2)\bigr)\ge0.
> \end{equation}
> Indeed, in eigenbases of the two matrices the trace equals
> \[
>  \sum_{i,j}(g(\lambda_i)-g(\nu_j))(\lambda_i-\nu_j)
>        |\langle v_i,w_j\rangle|^2\ge0.
> \]

我核对这个展开：$\operatorname{tr}(g(A_1)A_1)=\sum_ig(\lambda_i)\lambda_i$ 与交叉项
$\operatorname{tr}(g(A_1)A_2)=\sum_{ij}g(\lambda_i)\nu_j|\langle v_i,w_j\rangle|^2$，
两两配对后确实整理成上面那个双重和，每项 $(g(\lambda)-g(\mu))(\lambda-\mu)\ge0$ 只需 $g$ 单调增 ✓。

代入 $g=f$（严格增）、$A_1=UX_s(B)U^{*}$、$A_2=X_s(B)$、$U=e^{itB}$。
`rank-one.tex:186-190` 说"$U$ 与 $(sI-B)^2$ 交换，展开迹得"

> \begin{equation}\label{eq:trace-fixed-s}
>  0\le\tr\bigl(f(X_s(B))(2D-UDU^*-U^*DU)\bigr).
> \end{equation}

这一步论文跳得最多，我全部补出。记 $Q=(sI-B)^2$（与 $U$ 交换），则 $A_2=Q+D-dI$、
$A_1=U(Q+D-dI)U^{*}=Q+UDU^{*}-dI$，故 $A_1-A_2=UDU^{*}-D$。不等式左边是
$E=\operatorname{tr}((f(A_1)-f(A_2))(UDU^{*}-D))$。用循环性与 $U^{*}A_1U=A_2$：
$\operatorname{tr}(f(A_1)UDU^{*})=\operatorname{tr}(U^{*}f(A_1)UD)=\operatorname{tr}(f(A_2)D)$；
$\operatorname{tr}(f(A_1)D)=\operatorname{tr}(Uf(A_2)U^{*}D)=\operatorname{tr}(f(A_2)U^{*}DU)$。
于是
$E=\operatorname{tr}(f(A_2)D)-\operatorname{tr}(f(A_2)U^{*}DU)-\operatorname{tr}(f(A_2)(UDU^{*}-D))
=\operatorname{tr}\bigl(f(A_2)(2D-UDU^{*}-U^{*}DU)\bigr)$ ✓，$A_2=X_s(B)$ 即 \eqref{eq:trace-fixed-s}。

接着是那个"可以减掉 $f(s^2)I$"的技巧（`rank-one.tex:191-193`）：
"The coefficient $2D-UDU^*-U^*DU$ has trace zero. We may therefore subtract $f(s^2)I$ inside the trace"。
迹为零是显然的（$\operatorname{tr}(UDU^{*})=\operatorname{tr}(D)$、$\operatorname{tr}(U^{*}DU)=\operatorname{tr}(D)$）。
这一步是**必须**的：$f(s^2)$ 随 $|s|$ 增长，不减掉就无法对 $s$ 积分（回到第 5 节 $M$ 定义里的同一个减法），
而且减掉之后被积对象恰好就是 $M(B)$ 的定义式。取极限的一致性问题在 `rank-one.tex:197-198`：
系数范数 $\le4\|D\|_{\HS}$（三次共轭保 HS 范数，三角不等式），而 $M_R(B)\to M(B)$ 按矩阵范数，
所以逐点 $t$ 的不等式可以积分取极限。最后对偶测度 $\nu$ 平均：$\int UDU^{*}d\nu=\int U^{*}DUd\nu=\mathcal P(D)$
（偶性把 $U^{*}$ 那一支也算成 $\mathcal P(D)$），$2D$ 那支给 $2\mathcal P(D)$? 这里要小心：
平均后是 $\operatorname{tr}(M(B)(2D-2\mathcal P(D)))\ge0$，即 \eqref{eq:trace-average} ✓。

最后一步的算术（`rank-one.tex:205-216`）我把两个 $\operatorname{tr}$ 恒等式写清：用 psd 的 $M=aa^{\mathsf T}$
去配 \eqref{eq:M-tangent} 取迹，$\operatorname{tr}(M\cdot M)=\operatorname{tr}(M^{2})$，而
$M^{2}=a(a^{\mathsf T}a)a^{\mathsf T}=mM$，故 $\operatorname{tr}(M^2)=m\operatorname{tr}M$，两边同时出现就消掉，
剩下 $0\le\mu'(d)(\operatorname{tr}(M\mathcal P(D))-d\operatorname{tr}M)$；$\mu'(d)=\sigma(d+\delta)^{\sigma-1}>0$
（`eq:mu-positive`）所以可除，得 $\operatorname{tr}(M\mathcal P(D))\ge d\operatorname{tr}M$。
配合 \eqref{eq:trace-average}：$\operatorname{tr}(MD)\ge\operatorname{tr}(M\mathcal P(D))\ge d\operatorname{tr}M=dm$。
而 $\operatorname{tr}(MD)=\operatorname{tr}(aa^{\mathsf T}D)=a^{\mathsf T}Da$ ✓，这正是 `rank-one.tex:213-216`。
收尾用 $m=(d+\delta)^\sigma-\delta^\sigma\le d^\sigma$（$0<\sigma<1$ 时 $(x+y)^\sigma\le x^\sigma+y^\sigma$，
`rank-one.tex:217-219`），于是 $d\ge m^{1/\sigma}$，$a^{\mathsf T}Da\ge dm\ge m^{1+1/\sigma}=|a|^{2q}$ ✓
（$|a|^{2q}=(|a|^2)^q=m^{q}$，$q=1+1/\sigma$）。

这里的次序值得记一笔：$d$ 是**由 $m$ 反解出来的辅助量**，最后又用次可加性把 $d$ 消回 $m$。
中间那步 $\operatorname{tr}(M\mathcal P(D))\ge d\operatorname{tr}M$ 只有在 rank-one 假设下才成立，
因为要用到 $M^2=mM$（`rank-one.tex:100-102` 预告了这次消去）。
[推测] 如果 $M(B)$ 是秩 2 的，$M^2$ 与 $mM$ 不再相等，$m\operatorname{tr}M$ 的两侧消去失败；
我试过把 $m$ 换成 $\|M\|_{\mathrm{op}}$，得到的是一个带 $\operatorname{tr}M$ 与 $\operatorname{tr}M^2$
两个不同量的不等式，无法闭合。这说明 rank-one 假设与技术省事的取舍无关，它是结构必需。
[推测] 若不用次可加性而试图直接从 $\mu(d)=m$ 解出 $d=m^{1/\sigma}+\cdots$ 的精确关系，
在 $\delta>0$ 时只能得到 $d=(m+\delta^\sigma)^{1/\sigma}-\delta\ge m^{1/\sigma}-\delta$，
多出 $-\delta$ 会让结论变成 $a^{\mathsf T}Da\ge m^{q}-\delta m$，需要额外吸收；次可加性一步到位，
而且与 `action-limit.tex:70-72` 用的支配函数是同一条不等式（$(x+y)^\sigma\le x^\sigma+y^\sigma$）。

## 11 连接路径：把"选 $C$"变成一个端点匹配的同伦问题

`connecting-path.tex:3-9` 开篇就把这一节的赌注写全了，我认为这是全文最需要反推的一段：

> The action argument needs a symmetric matrix path from $K$ to $-K$.
> Its differential equation also contains a lower triangular coefficient
> matrix $C$, which we are free to choose.  We choose $C$ by matching the
> terminal endpoint.  At the start of a deformation, the matching problem
> has exactly one solution after identifying each row of $C$ with its
> negative.  A compactness argument shows that this solution count cannot
> disappear modulo two.

要证的对象是 `connecting-path.tex:45-58` 的命题，方程与端点写在 \eqref{path:equation}：

>  \varepsilon B'=M(B)-aa^{\mathsf T},
>  \qquad B(x_-)=K,\qquad B(x_+)=-K.

外加 \eqref{path:operator-bound} 的 $\|B(x)\|_{\mathrm{op}}\le\|K\|_{\mathrm{op}}$ 和最后一句
"For fixed $M$, $K$, and $I$, the matrices $C$ can be chosen bounded uniformly for $0<\varepsilon\leq1$."。

我先把"为什么 $C$ 只能靠匹配终端来选"想通。方程右端只通过 $aa^{\mathsf T}=Cu(Cu)^{\mathsf T}$ 依赖 $C$，
而 $B(x_-)=K$ 是初值问题，$C$ 给定了整条曲线；终端 $B(x_+)=-K$ 是 $N(N+1)/2$ 个标量条件，
$C$ 的自由度恰好也是 $N(N+1)/2$（下三角），所以这是**方阵型**的匹配问题，同伦/度数是自然的工具。
这个等维数是 `path:parity` 里"$E\to Q$ rank $= \dim Q=d$"的来源，我在第 7 节末尾已经提过。

构造的第一步是截断（`connecting-path.tex:142-149`）：取 $\kappa=\|K\|_{\mathrm{op}}$、$\ell=x_+-x_-$，
选 $\chi$ 光滑、非负、正交共轭不变、紧支，且在 $\|B\|_{\mathrm{op}}\le\kappa$ 上等于 1，
例子给的是 $\chi(B)=\eta(\operatorname{tr}B^2)$，$\eta$ 在 $[0,N\kappa^2]$ 上为 1
（合理：$\|B\|_{\mathrm{op}}\le\kappa$ 时 $\operatorname{tr}B^2\le N\kappa^2$ ✓）。
$\widehat M=\chi M$ 有界且全局 Lipschitz。为什么非要全局：`connecting-path.tex:160-162`
"The bounded globally Lipschitz field and continuous forcing give a unique solution throughout $I$."
只有全局 Lipschitz 才能保证解在整个 $I$ 上存在，从而 $\Phi_\theta$ 处处有定义；$M$ 本身只是局部
Lipschitz（第 6 节），无界场可能在有限 $x$ 处 blow-up，同伦就断了。

同伦与映射（`connecting-path.tex:156-167`）：

> \begin{equation}\label{path:homotopy-ode}
>  \varepsilon B'=\theta\widehat M(B)-(Cu)(Cu)^{\mathsf T},
>  \qquad B(x_-)=K.
> \end{equation}

我补出 $\Phi_\theta$ 连续性的机制：写成积分方程
$B(x)=K+\varepsilon^{-1}\int_{x_-}^x[\theta\widehat M(B)-Cu(Cu)^{\mathsf T}]$，
两解之差满足 $\varepsilon\|\delta B(x)\|\le\varepsilon^{-1}L_{\widehat M}\int\|\delta B\|
+\varepsilon^{-1}\|\delta C\|\cdot(\text{含 }u\text{ 的项})$，Gronwall 给
$\sup\|\delta B\|\le\mathrm{const}\cdot(\|\delta C\|+|\delta\theta|)$，所以
$C\mapsto B(x_+)$ 连续 ✓（$u$ 取连续代表元，`connecting-path.tex:143` 交代过；
$H^1_0(I)$ 在一维嵌入连续函数，见 `action-framework.tex:17-18`）。

系数恒等式是我最想核对的一条，`connecting-path.tex:169-174`：

> At a zero of $\Phi_\theta$, integration of
> \eqref{path:homotopy-ode} and orthonormality of $u$ give
> \begin{equation}\label{path:coefficient-identity}
>  CC^{\mathsf T}
>  =2\varepsilon K+\theta\int_I\widehat M(B(x))\,dx.
> \end{equation}

推导：对 $x$ 从 $x_-$ 到 $x_+$ 积分 \eqref{path:homotopy-ode}，
$\varepsilon(B(x_+)-B(x_-))=\theta\int_I\widehat M(B)dx-\int_I(Cu)(Cu)^{\mathsf T}dx$。
在零点处 $B(x_+)=-K$、$B(x_-)=K$，左端 $=-2\varepsilon K$；右端第二项用
$\int_Iu\,u^{\mathsf T}dx=I_N$ 得 $CC^{\mathsf T}$。移项即 \eqref{path:coefficient-identity} ✓。
这里 $\int uu^{\mathsf T}=I_N$ 是全文第二次被消费（第一次是 `spectral.tex:104` 的谱侧用法），
它把一个积分项变成纯代数项，从而把 $C$ 与 $B$ 的轨迹绑在一起。
紧界（`connecting-path.tex:176-180`）就是取迹：$\|C\|_{\HS}^2=\operatorname{tr}(CC^{\mathsf T})
\le2\varepsilon\operatorname{tr}K+\ell\sup_B|\operatorname{tr}\widehat M(B)|$ ✓（用了 $\theta\le1$），
有限维中有界闭集即紧，所以"for fixed $\varepsilon$, the full zero set in $\mathcal L\times[0,1]$
is compact"。我特别注意到：$\Phi_\theta$ 的零集在 $\mathcal L\times[0,1]$ 中闭是靠连续性，
有界是靠 \eqref{path:coefficient-identity}，两者合起来才让第 12 节的引理能用；如果
$\widehat M$ 的迹无界（即不做截断），零集就可能跑向无穷，mod-2 论证整体失效。

[推测] 弯路：把同伦参数 $\theta$ 放在 $C$ 那一项上（$\varepsilon B'=\widehat M(B)-\theta^2(Cu)(Cu)^{\mathsf T}$）。
$\theta=0$ 时方程退化，$B\equiv K$，$\Phi_0(C)=2K$ 无零点，初始"奇数个零点"就没了；
$\theta=0$ 支必须是纯代数方程 $CC^{\mathsf T}=2\varepsilon K$，这正是论文把它放在 $\widehat M$ 上的原因。
[推测] 弯路：用 Leray--Schauder 度或 Brouwer 度直接给"至少一个解"。论文的写法是 mod-2 版本
（`connecting-path.tex:136`："No orientation of $Q$ or $E$ is required."），因为 $\mathcal L^\times/G$
上的商丛 $E$ 未必可定向；用带符号的度需要先证定向平凡，我没找到办法，而 mod 2 完全不要求。
[推测] 弯路：不设 $\kappa$ 界而直接对 $M$ 用 Peano 存在定理。Peano 只给存在不给唯一，
而第 13 节的零行排除靠的是**唯一性**（"$S_iBS_i=B$ throughout the flow"），
所以必须先靠 $\chi$ 换回全局唯一性，再用拓扑；这里"用唯一性去证拓扑、用拓扑去证存在"的循环
是靠 $\chi$ 打破的。

## 12 模二延拓：我先把度数定理想用歪了，才看懂这条引理为什么必须自证

`connecting-path.tex:61-63` 先交代出处与范围：

> The parity principle is the compact-one-manifold argument underlying
> mod-two degree; see \cite[Section~4]{Milnor1965}. The smooth regular-value
> facts used below are given in \cite[Sections~2--3]{Milnor1965}.

紧接着 `connecting-path.tex:64-68` 说明要证的其实是相对版本：

> We prove the needed relative version for continuous families of bundle
> sections here. A section of a vector bundle assigns to each base point a
> vector in the fiber above it.  A zero is \emph{transverse} if the
> derivative of the section in any local trivialization maps onto that
> fiber.

引理原文（`connecting-path.tex:70-79`）：

> \begin{lemma}[Continuation modulo two]\label{path:parity}
> Let $Q$ be a smooth $d$-dimensional manifold without boundary, and let
> $E\to Q$ be a smooth real vector bundle of rank $d$.  Suppose
> $s_\theta$, $0\leq\theta\leq1$, is a continuous homotopy of sections and
> \[
>  \{(q,\theta)\in Q\times[0,1]:s_\theta(q)=0\}
> \]
> is compact.  If $s_0$ is smooth and has an odd number of zeros, all
> transverse, then $s_1$ has a zero.
> \end{lemma}

我第一版的理解是"这就是 mod-2 度的同伦不变性，一句话即可"，然后卡住：$Q$ 非紧（下一节里
$Q=\mathcal L^\times/G$ 是开的），标准教科书陈述要紧性或者要在边界上非零，两个都不满足。
论文的解法是**自己造一个带边界的 1 维流形然后数端点**。我把证明的骨架按中间步骤重排如下。

反设 $s_1$ 无零点。先取一个相对紧的光滑区域 $\Omega\subset Q$ 覆盖住整个零集的投影
（`connecting-path.tex:82-85`：用"在一个紧支光滑函数（在投影附近恒为 1）的正则水平集"造出来，
这一步需要正则值定理，出处即 `Milnor1965` 的第 2 至 3 节）。取纤维度量后，在紧集
$(\partial\Omega\times[0,1])\cup(\overline\Omega\times\{1\})$ 上 $\lVert s_\theta(q)\rVert$
有严格正的极小值（`connecting-path.tex:86-91`）。这一步是我认为整条引理最"机械"的地方：
必须 $\theta=1$ 那一片也无零点，紧集上才有正极小；若 $s_1$ 允许有零点，整个构造就退化回
"$s_1$ 已经有零点"，正是要证的东西。

接着两级逼近。第一级：把同伦重新参数化，使它在初始细邻域内恒等于 $s_0$，然后用有限多个丛坐标 +
单位分解把连续系数函数光滑逼近，逼近误差取成边界正极小的**四分之一**
（`connecting-path.tex:93-103`）。我算过这个 $1/4$ 的余量分配：光滑段与原同伦差 $<\varepsilon_0$，
在边界上原同伦范数 $\ge 2\varepsilon_0$ 时（正极小记作 $\delta_0$，取 $\varepsilon_0=\delta_0/4$），
光滑段在边界上范数 $\ge\delta_0-\delta_0/4>0$，在终边也一样；剩下 $\delta_0/4$ 的余量给第二级扰动用。
第二级：把横截性做出来（`connecting-path.tex:105-130`），这是全节我补得最多的一段。
初始细邻域里 $s_0$ 的零点本来就近端（沿 $Q$ 方向的微分已映上）。其余可能的零点落在内部的紧子集里；
取有限多个紧支局部标架截面，其值在该邻域的每个纤维上张成，支集避开初始边界与禁入边界。
待加的是这些截面的线性组合，参数在 $\mathbb R^m$ 的小开球里（$m$ 是截面个数）。
通用零点集
$\mathcal Z=\{(q,\theta,b): s_0' (q,\theta)+\sum_kb_k\sigma_k(q,\theta)=0\}$
在 $(Q\times[0,1])\times\mathbb R^m$ 中是维数 $(d+1)+m-d=m+1$ 的光滑流形（对 $b$ 方向的微分就是
截面张成的映上映射，所以 0 是正则值）。Sard 定理用在投影 $\mathcal Z\to\mathbb R^m$ 上，
给出任意小的正则参数 $b$。$b$ 固定后的截面近端性由 `connecting-path.tex:122-127` 那句论证：
在零点处通用微分写成 $Av+Db$（$v$ 是 $(q,\theta)$ 方向、$b$ 是参数方向），投影在切空间上的满射性等价于
"$Av=-Db$ 对每个 $b$ 可解"；在需要扰动的区域 $D$ 本身满，于是等价于 $A$ 满 ✓。
小性保证：在张成邻域的补集与初始细邻域上保持正间隙（无新零点），且在光滑拓扑下保住初始细邻域上
已有的近端性（`connecting-path.tex:128-130`）。

最后一步是纯拓扑记账（`connecting-path.tex:132-136`）：

> The zero set of the resulting section is a compact smooth
> one-dimensional manifold.  Its boundary consists exactly of the zeros
> of $s_0$ on $\Omega\times\{0\}$.  A compact one-dimensional manifold
> has an even number of boundary points, contradicting the assumed odd
> count.  No orientation of $Q$ or $E$ is required.

维数账：底空间 $\overline\Omega\times[0,1]$ 维数 $d+1$，丛秩 $d$，近端零点集维数 $(d+1)-d=1$ ✓。
它的边界恰在 $\theta=0$ 那一片：$\theta=1$ 无零点、$\partial\Omega\times[0,1]$ 上范数有正界 ✓。
而 1 维紧光滑流形的边界点数是偶数（每个连通分支是闭区间或圆），与"$s_0$ 的零点数为奇"矛盾。
`connecting-path.tex:136` 那句"No orientation of $Q$ or $E$ is required."是这条引理对我最有教育意义的部分：
它把定向问题彻底绕开，代价是只能得到"存在一个零点"，得不到"至少一个带符号的解"。

现在能看清 $d=\dim Q=\operatorname{rank}E$ 这个假设的分量：秩与底维数不等时，零点集维数不是 1，
"数端点"这一步就没有意义；论文下一节里 $Q=\mathcal L^\times/G$ 维数 $N(N+1)/2$，
$E$ 的纤维是 $\Sym_N$（同维数），这个等式**由设计给定**（第 13 节展开）。
[推测] 我试过的第一条替代路线：直接用 Brouwer 度。需要在 $\partial\Omega$ 上把 $s_\theta$ 的同伦族
做成边界非零的映射并给 $E$ 选定向；商丛 $E=(\mathcal L^\times\times\Sym_N)/G$ 由号共轭给出，
定向是非平凡的额外工作，而且 $\operatorname{Sym}_N$ 在 $Z\mapsto SZS$ 下的行列式符号随 $S$ 变化
（$N$ 为偶数时可能翻转），带符号度根本定义不了。
[推测] 第二条：把 mod-2 论证搬到 $Q$ 本身不商掉 $G$ 的情形。此时零点数是 $2^N$（偶数），
奇偶性立刻失效；这一步解释了为什么"$G$-轨道"的商化是必需的，并非审美的。
[推测] 第三条：不重新参数化初始细邻域、直接整体光滑逼近连续同伦。这样 $\theta=0$ 片不再是 $s_0$，
边界点与 $s_0$ 零点的对应关系就断了，奇偶记账无从谈起。

## 13 零行排除与初始轨道：$G$ 商掉之后只剩一个横截零点

这一节要用到的三条性质在 `connecting-path.tex:11-34` 被预先列成清单：局部 Lipschitz 的 $M$ 与 $\mu$、
严格增且 $\mu(0)=0$、以及

> \begin{equation}\label{path:coordinate}
>  Be_i=t e_i
>  \quad\Longrightarrow\quad
>  M(B)e_i=\mu(k_i^2-t^2)e_i.
> \end{equation}

`connecting-path.tex:33-34` 特意限定等变性的范围："The equivariance in
\eqref{path:equivariance} only concerns sign matrices, which commute with the fixed matrix $K$."

同伦映射的等变性在 `connecting-path.tex:186-192`：

> Let $G$ be the group of diagonal sign matrices.  Equation
> \eqref{path:equivariance}, invariance of $\chi$, and uniqueness of the
> flow show that
> \begin{equation}\label{path:terminal-equivariance}
>  \Phi_\theta(SC)=S\Phi_\theta(C)S
>  \qquad(S\in G).
> \end{equation}

我把"show that"背后的一步写出来：以 $S\in G$ 作用，方程 \eqref{path:homotopy-ode} 中
$(S(Cu))(S(Cu))^{\mathsf T}=S(Cu)(Cu)^{\mathsf T}S$，初值 $SKS=K$，而
$\widehat M(SBS)=\chi(SBS)\,M(SBS)=\chi(B)\,SM(B)S=S\widehat M(B)S$（$\chi$ 由
$\operatorname{tr}B^2$ 构成，正交共轭不变，号共轭当然不变）。所以 $SBS$ 与 $S\cdot(\cdot)\cdot S$ 像
满足同一初值问题，唯一性给 $B_{SC}=SB_CS$，终端映射等变 ✓。

零行排除（`connecting-path.tex:193-204`）是这一节最精巧的一击：

> Suppose that row $i$ of $C$ vanishes, and let $S_i$ change only its
> sign.  Then $S_iC=C$, so uniqueness gives $S_iBS_i=B$ throughout the
> flow.  Hence $Be_i=b_i e_i$.  By \eqref{path:coordinate},
> \[
>  \varepsilon b_i'
>  =\theta\chi(B(x))\mu(k_i^2-b_i^2),
>  \qquad b_i(x_-)=k_i.
> \]
> Regarding $\theta\chi(B(x))/\varepsilon$ as a known continuous
> coefficient, local Lipschitz uniqueness for this scalar equation gives
> $b_i\equiv k_i$.  Since $k_i>0$, the terminal value cannot be $-k_i$.

我的补记分三层。第一层：$S_iC=C$ 只在第 $i$ 行全零时成立（号翻转不动零向量）。第二层：$S_iBS_i=B$
意味着 $B_{jk}=0$ 只要 $j,k$ 中恰有一个等于 $i$（因为该位置乘上 $-1$ 而整体不变），
所以 $e_i$ 是 $B$ 的特征向量，特征值记 $b_i$。第三层：把 \eqref{path:equation} 的 $(i,i)$ 分量单独提出，
$aa^{\mathsf T}=Cu(Cu)^{\mathsf T}$ 的 $(i,i)$ 元是 $(Cu)_i^2$，而第 $i$ 行为零使 $(Cu)_i=0$，
所以对角分量方程闭合为 $\varepsilon b_i'=\theta\chi(B)\mu(k_i^2-b_i^2)$ ✓。
把它当线性（非自治）系数 $\lambda(x)=\theta\chi(B(x))/\varepsilon$ 已知的一维方程：
$b\equiv k_i$ 是解（因 $\mu(0)=0$），局部 Lipschitz 给唯一性，故整条曲线恒为 $k_i$，
终端 $-k_i$ 与 $k_i>0$ 矛盾 ✓。这一段我的失败路线是把 $B$ 的谱随 $x$ 变化来论证，
但那样需要特征值的可微选择（重根时不可能），而作者用号对称性把问题降成一个坐标，绕开了全部
谱扰动分析。

有了"零行不存在"，商空间才是流形（`connecting-path.tex:206-230`）：

> Let $\mathcal L^\times\subset\mathcal L$ be the open subset on which
> every row is nonzero.  The compact joint zero set lies inside
> $\mathcal L^\times\times[0,1]$, and hence a positive distance away
> from every zero-row stratum.  We do not require $C$ to be invertible.

维数账（`connecting-path.tex:218-220`）："is therefore a smooth manifold of dimension
$d=N(N+1)/2$. Concretely, each row $i$ belongs to $\mathbb R^i\setminus\{0\}$ and is identified
with its negative."。$\sum_{i=1}^N i=N(N+1)/2$ ✓。自由性在 `connecting-path.tex:213-214`：
"The action of $G$ on $\mathcal L^\times$ is free: changing the sign of a nonzero row cannot fix $C$."
商丛写作 $E=(\mathcal L^\times\times\Sym_N)/G$，$(C,Z)\sim(SC,SZS)$（`connecting-path.tex:221-227`），
秩 $=\dim\Sym_N=N(N+1)/2=d$，正是第 12 节需要的等维。零行的"正距离"那句是技术必需：
它保证可以在 $\mathcal L^\times$ 内取 $\Omega$，也让后面的近似不会撞到奇点。
"我们并不要求 $C$ 可逆"这句我要强调，因为它是这条路径能覆盖退化情形的原因：
$\mathcal L^\times$ 允许行非零但整体奇异（例如第二行只在对角非零、第一行与之成比例）。

$\theta=0$ 的显式求解（`connecting-path.tex:232-245`）：

> At $\theta=0$,
> \[
>  \Phi_0(C)=2K-\varepsilon^{-1}CC^{\mathsf T}.
> \]
> The lower triangular solutions of $CC^{\mathsf T}=2\varepsilon K$
> are exactly
> \[
>  C=\operatorname{diag}
>    (\pm\sqrt{2\varepsilon k_1},\ldots,
>     \pm\sqrt{2\varepsilon k_N}).
> \]
> Indeed, the first row determines $C_{11}$, the other entries of the
> first column then vanish, and the same argument applies successively
> to the remaining principal blocks.  These solutions form one $G$-orbit.

$\Phi_0$ 的式子来自第 11 节的 \eqref{path:coefficient-identity}（$\theta=0$），或者直接积分：
$\varepsilon B'=-CC^{\mathsf T}$ 常系数，$B(x_+)=K-\varepsilon^{-1}CC^{\mathsf T}$，加 $K$ 即。
逐块推导我补全了：$(CC^{\mathsf T})_{11}=\sum_kC_{1k}^2=C_{11}^2=2\varepsilon k_1$（下三角只有 $k=1$），
故 $C_{11}=\pm\sqrt{2\varepsilon k_1}$；对 $i>1$，$(CC^{\mathsf T})_{i1}=C_{i1}C_{11}=0$（右端对角）
给 $C_{i1}=0$；然后对去掉第一行第一列的主块重复。注意 $k_i>0$ 在这里第二次被消费：
$k_i=0$ 时 $C_{ii}=0$，下一步的"正距离"和下面的同构都会断。最后 $2^N$ 个解在 $G$ 作用下成一个轨道，
所以在商里**恰好一个**零点，奇数 ✓。

同构性（`connecting-path.tex:246-256`）：$D\Phi_0(C)[H]=-\varepsilon^{-1}(HC^{\mathsf T}+CH^{\mathsf T})$，
在该零点处 $C=\operatorname{diag}(c_i)$，故像的对角元 $-2c_iH_{ii}/\varepsilon$、$(i,j)$（$i>j$）元
$-c_jH_{ij}/\varepsilon$（$H^{\mathsf T}$ 的上三角部分被 $H$ 的下三角结构吃掉）。
给定任意对称 $Z$，可逐元解出 $H_{ii}=-\varepsilon Z_{ii}/(2c_i)$、$H_{ij}=-\varepsilon Z_{ij}/c_j$，
唯一，故 $\mathcal L\to\Sym_N$ 是线性同构（维数本来就相等）；零点近端 ✓。
于是 `connecting-path.tex:256` 一句"Lemma~\ref{path:parity} now gives a zero of $\Phi_1$."把前两节接上。

[推测] 若把 $\mathcal L$ 换成全体矩阵：$CC^{\mathsf T}=2\varepsilon K$ 的解是
$C=(2\varepsilon K)^{1/2}O$（$O$ 任意正交），零点是连续统，mod-2 计数失去意义。
这说明**下三角限制同时服务两件事**：谱侧的逐特征函数包含（`spectral.tex:106-113`）与这里的
离散计数（消掉正交规范自由度）。我一开始以为三角性只是谱侧的技巧，这是个误判。
[推测] 若 $\chi$ 不正交不变，\eqref{path:terminal-equivariance} 就不成立，号对称论证整体失效；
这也是为什么作者特意构造 $\chi(B)=\eta(\operatorname{tr}B^2)$ 而不用任意截断。
[推测] 若初值取 $B(x_-)=-K$、终端 $K$，$\Phi_0(C)=-(2K-\varepsilon^{-1}CC^{\mathsf T})$? 符号相反但零点集
相同，结论不变；真正的方向性要求出现在第 14 节的障碍论证里（$h$ 只能不增），那里初终端互换后
两段的"不能从左边起/不能回到右边"正好对称互换，所以方向其实不敏感，这点我核对过。

## 14 障碍论证去掉截断，一致界只依赖固定的 $\delta$

`connecting-path.tex:259-278` 是全文唯一一处一维ODE比较原理式的论证：

> Take a path obtained from this zero.  For a fixed real unit vector
> $e$, put $h(x)=e^{\mathsf T}B(x)e$.  Whenever $|h(x)|>\kappa$,
> \eqref{path:comparison} implies
> \begin{align*}
>  \varepsilon h'(x)
>  &\leq\chi(B(x))
>     \mu\bigl(e^{\mathsf T}K^2e-h(x)^2\bigr)
>        -|e^{\mathsf T}Cu(x)|^2
>  \leq0.
> \end{align*}

我补出 $h'$ 的来源：$h'(x)=e^{\mathsf T}B'(x)e$，用 \eqref{path:homotopy-ode} 在 $\theta=1$，
$e^{\mathsf T}\widehat M(B)e=\chi(B)\,e^{\mathsf T}M(B)e$ 与 \eqref{path:comparison}，
第二项 $e^{\mathsf T}(Cu)(Cu)^{\mathsf T}e=(e^{\mathsf T}Cu)^2$ ✓。
括号里的自变量是 $e^{\mathsf T}K^2e-h^2$；因为 $e^{\mathsf T}K^2e\le\kappa^2<h^2$（`connecting-path.tex:270`），
它是负数，而 $\mu$ 严格增且 $\mu(0)=0$ 给 $\mu(\text{负})<0$，再乘 $\chi\ge0$ 仍 $\le0$，
减掉一个平方，整体 $\le0$ ✓。`connecting-path.tex:270-271` 补了一句
"the last inequality uses $\chi\geq0$ and remains true where $\chi=0$."，这是在提醒：
$\widehat M$ 在 $\chi=0$ 处消失，不等式仍成立，所以论证不依赖 $\chi$ 的具体形状。

然后是区间分支的记账（`connecting-path.tex:272-278`）：

> Both endpoint values of $h$ lie in $[-\kappa,\kappa]$.
> A component of $\{h>\kappa\}$ cannot start from the initial side:
> on that component $h$ is nonincreasing, whereas its left endpoint
> has value $\kappa$.  Similarly, a component of $\{h<-\kappa\}$
> cannot return to the final endpoint: its right endpoint would have
> value $-\kappa$, again contradicting nonincrease.  Thus
> $|h(x)|\leq\kappa$ throughout $I$.

我的展开：设 $\{h>\kappa\}$ 非空，取其一连通分支 $(a,b)$。$h$ 连续，$h(a)=\kappa$（或 $a=x_-$，
此时 $h(a)=e^{\mathsf T}Ke\in[-\kappa,\kappa]$，同样 $\le\kappa$）。在 $(a,b)$ 上 $h>\kappa$ 故
$h'\le0$，$h$ 不增，于是对 $t\in(a,b)$ 有 $h(t)\le h(a)=\kappa$，与 $h(t)>\kappa$ 矛盾 ✓。
$\{h<-\kappa\}$ 同理取分支 $(a,b)$：$h$ 在其上不增，$h(b)=-\kappa$（或 $b=x_+$，
$h(x_+)=-e^{\mathsf T}Ke\in[-\kappa,\kappa]$），不增给 $-\kappa=h(b)\le h(t)<-\kappa$，矛盾 ✓。
注意两个方向用的都是同一句"$h$ 不增"，这就是我在第 13 节末说"方向不敏感"的依据；
$\varepsilon>0$ 的符号在这里被消费（$\varepsilon h'\le0$ 与 $h'\le0$ 等价）。
$e$ 任意所以 $\|B\|_{\mathrm{op}}=\sup_{\lVert e\rVert=1}|h(e)|\le\kappa$（$B$ 对称，op 范数就是
Rayleigh 商的上确界 ✓），于是 $\chi(B)\equiv1$，路径解的是**未截断**方程 \eqref{path:equation}。

一致界（`connecting-path.tex:283-290`）：

> Finally, its integrated equation gives, for $0<\varepsilon\leq1$,
> \begin{equation}\label{path:uniform-coefficients}
>  \|C\|_{\mathrm{HS}}^2
>  \leq 2\operatorname{tr}K
>  +\ell\sup_{\|B\|_{\mathrm{op}}\leq\kappa}
>              |\operatorname{tr}M(B)|.
> \end{equation}

与第 11 节的 \eqref{path:homotopy-bound} 相比有两处变化：$2\varepsilon\operatorname{tr}K$ 用 $\varepsilon\le1$
放大成 $2\operatorname{tr}K$；$\sup|\operatorname{tr}\widehat M|$ 换成在球 $\lVert B\rVert_{\mathrm{op}}\le\kappa$
上对真场 $M$ 取上确界，$\widehat M=M$ 在该球上成立（$\chi=1$），而球是紧的、$M$ 连续，故有限 ✓。
这一步同时给出了 $\varepsilon$ 一致性，是第 15 节能取 $\varepsilon_n\downarrow0$ 的前提。

结尾三行（`connecting-path.tex:293-299`）是我读第一遍时完全没当回事、后来才发现承重的一段：

> For the regularized field $M_\delta$, the bound
> \eqref{path:uniform-coefficients} may depend on $\delta$.
> With $\delta$ fixed, it implies that all pairs $(B(x),Cu(x))$ produced
> for $0<\varepsilon\leq1$ lie in one compact subset of
> $\Sym_N\times\mathbb R^N$.
> This is the compactness needed in the action limit; it requires no
> bound on $B'$ uniform in $\varepsilon$.

我把它翻译成机制：$\|B(x)\|\le\kappa$ 给出 $B$ 值的一致紧；$\|C\|_{\HS}\le R_\delta$ 加上 $u$ 在
$\overline I$ 上连续（取连续代表元）给出 $a=Cu$ 的一致界（$|Cu(x)|\le\|C\|_{\mathrm{op}}|u(x)|
\le\|C\|_{\HS}\sup|u|$）。两者合起来就是第 15 节里的 $\mathcal K$。而 $B'$ 的量级是
$\varepsilon^{-1}$，根本没有关于 $\varepsilon$ 的一致 Lipschitz 界，所以**不能**用 Arzelà--Ascoli 抽路径子列；
作者明确声明不需要（"it requires no bound on $B'$ uniform in $\varepsilon$"），因为第 15 节的论证
只用到逐点值落在同一个紧集上。[推测] 这是我判定"作者曾试过、并且放弃了路径本身的收敛性论证"的最强文本
证据：这句话在没有替代方案的情况下写出来是多余的，它更像是一条留给自己的路标。
[推测] 若强行要求 $\delta$-一致界：$\sup_{\lVert B\rVert\le\kappa}|\operatorname{tr}M_\delta(B)|$ 里
$M_\delta$ 的量级带 $\delta^{\beta-1}=\delta^{\sigma-3/2}$（因 $f'(\cdot)=(\cdot+\delta)^{\beta-1}$
在自变量为 0 时取极大 $\delta^{\beta-1}$，$\beta-1<0$），$\delta\to0$ 时发散，第 15 节的紧集就取不出来；
所以"先 $\varepsilon$ 后 $\delta$"与风格选择无关，它是被这个发散逼出来的唯一次序。

## 15 从路径到作用量：一个全微分恒等式与两次极限

`action-limit.tex:3-6` 把整节的分工写清：

> We now prove Theorem~\ref{thm:action}. The matrix comparison controls points
> where $M(B)=aa^{\transpose}$ exactly. The differential equation supplies a
> penalty for the remaining points, and compactness makes that penalty
> effective without requiring convergence of the chosen coefficients $C$.

恒等式（`action-limit.tex:16-23`）：

> \begin{align}
>  (J(B)+a^{\transpose}Ba)'
>  &=2(a')^{\transpose}Ba
>       -\tr\bigl((M(B)-aa^{\transpose})B'\bigr)\notag\\
>  &=2(a')^{\transpose}Ba
>       -\varepsilon^{-1}\|M(B)-aa^{\transpose}\|_{\HS}^2.
>  \label{eq:action-identity}
> \end{align}

我逐层补：$J(B(x))$ 的导数用第 6 节末的 $dJ(B)[H]=-\operatorname{tr}(M(B)H)$ 得
$-\operatorname{tr}(M(B)B')$；$(a^{\mathsf T}Ba)'=2(a')^{\mathsf T}Ba+a^{\mathsf T}B'a$
（$B$ 对称所以 $a^{\mathsf T}B'a=a^{\mathsf T}B'a$ 就是那一项，合并成 $2(a')^{\mathsf T}Ba$）；
再把 $a^{\mathsf T}B'a=\operatorname{tr}(a a^{\mathsf T}B')$ 并入迹，得第一行。第二行是把
$B'=\varepsilon^{-1}(M(B)-aa^{\mathsf T})$ 代入，$\operatorname{tr}(XX)=\|X\|_{\HS}^2$（$X$ 对称）✓。
这里 $a\in H^1_0$ 只需绝对连续，$B\in C^1$，所以恒等式在 a.e. 成立（`action-limit.tex:14-15` 明说）。

积分后（`action-limit.tex:24-29`）：

> Since $a$ vanishes at the endpoints, integration and
> $2(a')^{\transpose}Ba\le |a'|^2+a^{\transpose}B^2a$ yield
> \begin{equation}\label{eq:penalty-bound}
>  J(-K)-J(K)\le\mathcal E_K(a)
>       +\int_I F_\varepsilon(B(x),a(x))\,dx,
> \end{equation}

我核对边界项：$a^{\mathsf T}Ba$ 在两端为 0 因为 $a=Cu$ 且 $u\in H^1_0$ ✓；而 $J(B)$ 的两端值
$J(-K)-J(K)$ 正是第 7 节的 \eqref{eq:boundary-J}。Young 步 $2(a')^{\mathsf T}Ba\le|a'|^2+|Ba|^2$
用的就是 $2xy\le x^2+y^2$，$|Ba|^2=a^{\mathsf T}B^2a$（$B$ 对称）✓。把
$-\int a^{\mathsf T}B^2a$ 移到 $\mathcal E_K$ 的形式里，得 `action-limit.tex:31-35` 的被积函数

>  F_\varepsilon(B,a)
>  =|a|^{2q}-a^{\transpose}(K^2-B^2)a
>        -\varepsilon^{-1}\|M(B)-aa^{\transpose}\|_{\HS}^2.

结构一目了然：前两项正是 rank-one 比较 \eqref{eq:rankone} 的**反面**（$a^{\mathsf T}Da\ge|a|^{2q}$
即 $|a|^{2q}-a^{\mathsf T}Da\le0$），第三项是惩罚。所以只要 $M(B)=aa^{\mathsf T}$ 就 $F\le0$。

一致小性（`action-limit.tex:37-45`）用第 14 节交来的紧集 $\mathcal K$：

> The bounds from Section~\ref{sec:path} place every pair
> $(B_\varepsilon(x),a_\varepsilon(x))$, for $x\in\overline I$ and
> $0<\varepsilon\le1$, in a single compact set $\mathcal K$.
> ... We claim that
> \begin{equation}\label{eq:uniform-penalty}
>  \eta_\varepsilon:=\max_{(B,a)\in\mathcal K}
>        \max\{F_\varepsilon(B,a),0\}\longrightarrow0.
> \end{equation}

反证链条（`action-limit.tex:46-56`）补全如下：若不然，存在 $\eta>0$、$\varepsilon_n\downarrow0$ 与
$\mathcal K$ 中收敛的 $(B_n,a_n)$（收敛性正是紧性给的）使 $F_{\varepsilon_n}(B_n,a_n)\ge\eta$。
前两项在 $\mathcal K$ 上被同一个 $C$ 界住（$|a|^{2q}$ 有界、$|a^{\mathsf T}(K^2-B^2)a|\le
(|a|^2\kappa^2+|a|^2\|B\|^2)$ 有界），故 $\varepsilon_n^{-1}\|M(B_n)-a_na_n^{\mathsf T}\|_{\HS}^2\le C$，
即 $\|M(B_n)-a_na_n^{\mathsf T}\|_{\HS}^2\le C\varepsilon_n\to0$。取极限（$M$ 连续、$\mathcal K$ 紧）
得 $M(B_*)=a_*a_*^{\mathsf T}$ 且 $|a_*|^{2q}-a_*^{\mathsf T}(K^2-B_*^2)a_*\ge\eta>0$，
与命题 \ref{prop:rankone} 矛盾 ✓。

我特别把"为什么这里必须要 $\mathcal K$"这一点记下来：$\eta_\varepsilon$ 是**一致**上确界，并非逐点，
而 $\varepsilon^{-1}\|\cdot\|^2$ 的惩罚强度在每一点都一样，只有把取值限制在同一个紧集上才能把
"逐点趋于 0"升级成"一致趋于 0"。如果只有 $\varepsilon$-相关的紧集，$|I|\eta_\varepsilon$
就不能控制积分。这也解释了第 14 节末尾那句"requires no bound on $B'$ uniform in $\varepsilon$"：
惩罚论证只吃取值不吃导数。

两次极限（`action-limit.tex:58-74`）：

> Equation~\eqref{eq:penalty-bound} now implies
> \[
>  J(-K)-J(K)\le
>  \sup_{C\text{ lower triangular}}\mathcal E_K(Cu)+|I|\eta_\varepsilon.
> \]
> Let $\varepsilon\downarrow0$ at this fixed $\delta$. By
> Lemma~\ref{lem:jensen},
> \[
>  \sup_C\mathcal E_K(Cu)
>  \ge\sum_i\int_{-k_i}^{k_i}
>        \bigl((k_i^2-s^2+\delta)^\sigma-\delta^\sigma\bigr)\,ds.
> \]
> Finally let $\delta\downarrow0$. On each integration interval the integrand
> converges to $(k_i^2-s^2)^\sigma$ and lies between zero and this same function,
> by subadditivity of the power $\sigma$. Dominated convergence gives
> \eqref{eq:action-bound}. No convergence of $C_\varepsilon$, and no bound
> uniform in $\delta$, has been used.

我核对了支配函数的合法性：$z\ge0$ 时 $(z+\delta)^\sigma-\delta^\sigma\le z^\sigma$ 等价于
$(z+\delta)^\sigma\le z^\sigma+\delta^\sigma$，即 $0<\sigma<1$ 的次可加性 ✓，
这与第 10 节末尾把 $d$ 换回 $m$ 时用的是同一条不等式；$z<0$（即 $\lvert s\rvert>k_i$）不会出现，
因为积分区间就是 $[-k_i,k_i]$。第二行的来源是把 \eqref{eq:boundary-J} 的 $\mu$ 换成
\eqref{eq:mu-positive} 的显式式子，注意 $k_i^2-s^2\ge0$ 在该区间上成立，所以可以用 $z\ge0$ 分支。
左边 $\sup_C$ 之所以能取代具体的 $C_\varepsilon$：$\mathcal E_K(C_\varepsilon u)\le\sup_C\mathcal E_K(Cu)$ ✓。

[推测] 次序颠倒的尝试（先 $\delta\to0$ 再 $\varepsilon\to0$）会在哪一步断：$\delta=0$ 时 $f'(y)=y^{\beta-1}$
在 $y=0$ 无界，$M_0$ 只是局部 Lipschitz 而**不是** Lipschitz，第 11 节的截断 $\chi$ 依然能做，但
\eqref{eq:uniform-penalty} 的反证要用 $M$ 连续（成立）与 rank-one 比较在 $\delta=0$ 的版本
（第 5 节末尾说明 $\mu(z)=z^\sigma$ 时 $f$ 在 0 处不可微，\eqref{eq:tangent} 的切映射 $T_Y$ 在
$y_i=0$ 处发散），链条从第 8 节就开始漏。
[推测] 想让 $C_\varepsilon$ 收敛到一个极限系数：$\mathcal K$ 只给有界性，抽取子列后 $a_\varepsilon$
在 $H^1$ 里无界（$a_\varepsilon'=C_\varepsilon u'$ 是有界的，其实 $C$ 有界即可控 $H^1$ 范数），
真正的障碍是 $B_\varepsilon$ 的导数 $\sim\varepsilon^{-1}$，路径本身剧烈振荡，无法给出一个"极限 rank-one
约束"；作者干脆不做极限，改用紧集上的一致惩罚，这一点是我读第三遍才确认的取巧。
[推测] 若把惩罚写成 $\varepsilon^{-2}$，同样能收敛到 0，但 $B'$ 的量级会破坏第 14 节的端点障碍
（$h$ 不增只依赖符号，不依赖强度，所以其实仍可），我会怀疑 $\varepsilon^{-1}$ 是被 \eqref{eq:action-identity}
第二行的代数逼出来的：只有 $B'=\varepsilon^{-1}(\cdot)$ 才能把迹配成平方，换成 $\varepsilon^{-2}$
得到的是 $\varepsilon^{-1}\|\cdot\|^2$，惩罚更强，所以 $\varepsilon^{-1}$ 是"刚好够用"的选择。

## 16 谱侧 I：$p>1$ 出现在哪一行，Dirichlet 估计里三角序怎么兑现

`spectral.tex:9-10` 固定本节参数：`Throughout this section, $0<\sigma<1$, $p=1+\sigma$,` /
`$q=1+1/\sigma$, and $\gamma=\sigma+1/2$.` 于是 $2\gamma=2\sigma+1$、$p=\gamma+1/2$ ✓，
与第 3 节的换元闭合。

形式部分的输入（`spectral.tex:20-24`）：

> For $0\leq W\in L^p(\R)$, define
> \[
>  h_{-W}[v]=\int_\R |v'|^2-\int_\R W|v|^2,
>  \qquad v\in H^1(\R).
> \]

结论与出处（`spectral.tex:33-41`，`spectral.tex:26-30` 交代 Teschl 的定理号）：闭、下有界、
每个 $(-\infty,-\alpha]$ 的谱投影有限秩、负谱是有限重特征值只能积聚在 0、区间上 Dirichlet 形式
有紧预解式。我把 `spectral.tex:44-50` 那三行插值补齐：

> Put $p'=p/(p-1)$.  The one-dimensional Sobolev inequality and
> interpolation give
> \[
>  \|v\|_{2p'}^2
>  \leq \|v\|_\infty^{2/p}\|v\|_2^{2-2/p}
>  \leq 2^{1/p}\|v'\|_2^{1/p}\|v\|_2^{2-1/p}.
> \]

第一行是 Riesz--Thorin 型的对数凸性：$\frac1{2p'}=\frac{1-\theta}{2}+\frac{\theta}{\infty}$ 给
$\theta=1-\frac1{p'}=\frac1p$（用 $\frac1p+\frac1{p'}=1$），所以
$\lVert v\rVert_{2p'}\le\lVert v\rVert_\infty^{1/p}\lVert v\rVert_2^{1-1/p}$，平方即得。
第二行用一维基本不等式 $\lVert v\rVert_\infty^2\le 2\lVert v\rVert_2\lVert v'\rVert_2$
（对 $v^2$ 求导取上确界，$H^1(\R)$ 函数在无穷远消失），$\theta$ 次幂给
$\lVert v\rVert_\infty^{2/p}\le 2^{1/p}\lVert v'\rVert_2^{1/p}\lVert v\rVert_2^{1/p}$，
乘上 $\lVert v\rVert_2^{2-2/p}$ 就是 $2^{1/p}\lVert v'\rVert_2^{1/p}\lVert v\rVert_2^{2-1/p}$ ✓。
这里的 $2^{1/p}$ 不是最优常数，它只决定 $b_{\eta,W}$，不进最终常数，所以我判断作者没花心思，
这是个可以放心忽略的因子。

`action-limit` 那边我说过 $b_{\eta,W}$，此处补它的来源（`spectral.tex:51-58`）：

> Consequently H\"older's and Young's inequalities imply that, for every
> $\eta>0$, there is $b_{\eta,W}<\infty$ such that
> \begin{equation}\label{spectral:form-bound}
>  \int_\R W|v|^2
>  \leq \eta\|v'\|_2^2+b_{\eta,W}\|v\|_2^2.
> \end{equation}
> The KLMN Theorem \cite[Theorem~6.24]{Teschl2009} now gives closure and semiboundedness, with
> form domain exactly $H^1(\R)$.

我补 Young 的参数选取：$\int W|v|^2\le\lVert W\rVert_p\lVert v\rVert_{2p'}^2
\le 2^{1/p}\lVert W\rVert_p\lVert v'\rVert_2^{1/p}\lVert v\rVert_2^{2-1/p}$。写成
$A^{\theta}B^{1-\theta}$ 型，$\theta=\frac1{2p}$、$A=\kappa\lVert v'\rVert_2^2$、
$B=\kappa^{-\frac{\theta}{1-\theta}}\lVert v\rVert_2^2$；指数配平检查：
$B$ 的 $1-\theta$ 次要给 $\lVert v\rVert_2^{2-1/p}$，而 $2(1-\theta)=2-1/p$ ✓。
Young 给 $A^\theta B^{1-\theta}\le\theta A+(1-\theta)B$，取 $\kappa$ 使
$2^{1/p}\lVert W\rVert_p\theta\kappa=\eta$，于是相对界为 $\eta$（可任意小）且
$b_{\eta,W}=2^{1/p}\lVert W\rVert_p(1-\theta)\kappa^{-\theta/(1-\theta)}<\infty$ ✓。
机械理由是：$\theta=\frac1{2p}<1$ 需要 $p>\frac12$，而 $\lVert v\rVert_{2p'}$ 的插值目标 $2p'\ge2$
需要 $p'>1$ 即 $p>1$；$p=1$（即 $\gamma=\frac12$）时 $p'=\infty$、$\theta=1$，
上面 Young 的 $1-\theta$ 那一项没了，$b_{\eta,W}$ 爆炸，这就是端点 $\gamma=\frac12$ 必须另做
（Weidl、Hundertmark--Lieb--Thomas）的证明论解释。[推测] 这条断裂点在论文里没有任何一句话点明，
是我从证明结构推出来的。

负谱有限秩（`spectral.tex:60-86`）我按两条引理补。第一条：$\sqrt W$ 作为 $H^1\to L^2$ 的乘法算子紧。
逼近论证给算子范数收敛：`spectral.tex:64-67` 的
$\lVert(\sqrt W-\sqrt{W_n})v\rVert_2^2\le\lVert W-W_n\rVert_p\lVert v\rVert_{2p'}^2
\le C_p\lVert W-W_n\rVert_p\lVert v\rVert_{H^1}^2$ ✓，第一用 $(\sqrt a-\sqrt b)^2\le|a-b|$，
第二用刚证的插值。$\sqrt{W_n}$ 紧靠局部 Rellich（$W_n$ 有界且紧支）。
第二条：反证。设 $(-\infty,-\alpha]$ 的谱子空间无限维，取其中标准正交列 $v_n$。
`spectral.tex:73-77` 用 $\eta=\frac12$ 的 \eqref{spectral:form-bound} 加上 $h[v_n]\le-\alpha$ 得到
$H^1$ 有界：$\lVert v_n'\rVert_2^2/2\le h[v_n]+b\lVert v_n\rVert_2^2\le-\alpha+b$ ✓。
弱收敛到 0（`spectral:forms` 证明里给的理由是"因为它们在 $L^2$ 中正交"，Bessel 不等式足以说明
对任何 $L^2$ 测试函数内积趋于 0，从而 $H^1$ 的弱极限作为分布也是 0）；紧性给 $\sqrt Wv_n\to0$ in $L^2$。
但 `spectral.tex:79-81` 的夹逼

>  -\alpha\geq h_{-W}[v_n]\geq-\|\sqrt Wv_n\|_2^2.

说明 $\lVert\sqrt Wv_n\rVert_2^2\ge\alpha$，矛盾 ✓（下界来自丢弃非负的动能项）。
区间情形 `spectral.tex:82-85` 用零延拓与 $H^1_0\hookrightarrow L^2$ 紧。

Dirichlet 估计的核心机制在 `spectral.tex:104-113`：

> Choose real orthonormal eigenfunctions $u_1,\ldots,u_N$; these exist
> because the Dirichlet form is real.  Put $u=(u_1,\ldots,u_N)^{\mathsf T}$
> and $K=\operatorname{diag}(k_1,\ldots,k_N)$.  For every real lower
> triangular matrix $C$, write $a=Cu$.  Its $i$th component lies in the
> span of $u_1,\ldots,u_i$, and the eigenfunction equations in form sense
> give
> \[
>  \int_I \bigl(|a_i'|^2-W|a_i|^2+k_i^2|a_i|^2\bigr)
>  =\sum_{j\leq i} C_{ij}^2(k_i^2-k_j^2)\leq0.
> \]

这一行我把双线性形式全展开。记 $\mathfrak b(f,g)=\int(f'g'-Wfg)$。$u_j$ 是特征值为 $-k_j^2$ 的
Dirichlet 特征函数，形式意义下 $\mathfrak b(u_j,v)=-k_j^2\int u_jv$，取 $v=u_l$ 得
$\mathfrak b(u_j,u_l)=-k_j^2\delta_{jl}$。于是
$\mathfrak b(a_i,a_i)=\sum_{j,l\le i}C_{ij}C_{il}\mathfrak b(u_j,u_l)=-\sum_{j\le i}C_{ij}^2k_j^2$，
而 $\lVert a_i\rVert_2^2=\sum_{j\le i}C_{ij}^2$，所以
$\mathfrak b(a_i,a_i)+k_i^2\lVert a_i\rVert_2^2=\sum_{j\le i}C_{ij}^2(k_i^2-k_j^2)$ ✓。
不等号 $\le0$ **只用顺序** $k_1\ge\cdots\ge k_N$（$j\le i\Rightarrow k_j\ge k_i$）✓。
这就是 `action-framework.tex:30-34` 与 `spectral.tex:90-91`（"The order of the eigenfunctions is what
makes the triangular coefficient restriction in Theorem~\ref{thm:action} useful."）反复指的那个机制：
若 $C$ 不是下三角，$a_i$ 会掺进 $j>i$ 的项，那些项的 $k_i^2-k_j^2>0$，符号就毁了。

对 $i$ 求和（`spectral.tex:114-118`）：

> Summing over $i$ and putting $m=|a|^2$, we obtain
> \[
>  \mathcal E_K(a)\leq\int_I(Wm-m^q)
>  \leq A_\sigma\int_I W^{1+\sigma}.
> \]

我写成等式链：$\sum_i\int|a_i'|^2+\sum_ik_i^2\int|a_i|^2\le\sum_i\int W|a_i|^2=\int Wm$，
左边正是 $\int|a'|^2+a^{\mathsf T}K^2a$ ✓，故 $\mathcal E_K(a)=\int|a'|^2+a^{\mathsf T}K^2a-\int m^q
\le\int(Wm-m^q)$ ✓；第二式是第 3 节验算过的逐点极大化。然后套 Theorem 2.1 得
`spectral.tex:122-126` 的 $\sum_j\int_{-k_j}^{k_j}(k_j^2-s^2)^\sigma ds\le A_\sigma\int W^{1+\sigma}$，
再除以 Beta 因子（第 3 节）得 \eqref{spectral:dirichlet-bound}
（`spectral.tex:97-100`：` \sum_{j=1}^N k_j^{2\gamma}` / ` \leq \ell_\sigma\int_I W^p.`）。

[推测] 若把 $C$ 换成上三角并同时反序 $k_1\le\cdots$，机制对称，结论一样；但若 $C$ 只是任意可逆矩阵，
$\le0$ 变不成，`thm:action` 左端的 $\sup$ 也无法由位势界住，整个证明在第一步就断。
[推测] 若特征函数取复的（矩阵值位势的常见做法），$a_i$ 的 $|a_i|^2$ 与形式项要共轭对称化，
"$\le0$"仍然成立但论文这里明确用了实性（"these exist because the Dirichlet form is real"），
标量情形可以，一般情形需要额外论证；Lean 侧恰好有 `ComplexFamilies.lean`、`MomentBound.lean`
的复族版本，说明机器化时这一步是专门做的（见第 18 节）。
[推测] 若 $W$ 只做 $L^1_{\mathrm{loc}}$，$b_{\eta,W}$ 不存在，形式不可定义，
这就是论文一开始把 $W\in L^{\gamma+1/2}$ 写进假设的原因（`main.tex:15-16`）。

## 17 谱侧 II：耗尽整条线、有号位势、$\sech^2$ 势把常数钉死

有限维试探空间的做法在 `spectral.tex:145-158`：

> Let $0\leq W\in L^p(\R)$.  If there are no negative eigenvalues, the
> trace inequality is immediate.  Otherwise fix any finite number $N$
> of them, counted with multiplicity and ordered increasingly:
> \[
>  \lambda_1\leq\cdots\leq\lambda_N<0.
> \]
> Let $\phi_1,\ldots,\phi_N\in H^1(\R)$ be corresponding orthonormal
> eigenfunctions.  Choose smooth cutoffs $\chi_R$ equal to one on
> $[-R,R]$, supported in $I_R=(-2R,2R)$, and satisfying
> $0\leq\chi_R\leq1$ and $\|\chi_R'\|_\infty\leq c/R$.  Then
> \[
>  v_{j,R}=\chi_R\phi_j\longrightarrow\phi_j
>  \quad\hbox{in }H^1(\R).
> \]

$H^1$ 收敛我补两项：$\int|(\chi_R-1)\phi_j'|^2\to0$ 由支配收敛（$\phi_j'\in L^2$、
$\chi_R-1\to0$ 逐点且 $\le1$）；$\int|\chi_R'\phi_j|^2\le(c/R)^2\int_{R\le|x|\le2R}|\phi_j|^2\to0$
因为 $\phi_j\in L^2$ 且 $R^2$ 吸收 ✓。$L^{2p'}$ 的嵌入使位势形式连续
（`spectral.tex:159-160`）。

Gram/形式矩阵的扰动记账（`spectral.tex:162-177`）：$G_R\to I_N$、$Q_R\to\Lambda$
（矩阵范数），$g_R=\lVert G_R-I_N\rVert_{\op}$、$e_R=\lVert Q_R-\Lambda\rVert_{\op}$，

>  \eta_R=\frac{e_R+\|\Lambda\|_{\mathrm{op}}g_R}{1-g_R}
>  \longrightarrow0.

我的推导：广义特征值问题 $Q_Rc=\mu G_Rc$ 等价于 $(I+F)^{-1}(\Lambda+E)c=\mu c$
（$F=G_R-I$、$E=Q_R-\Lambda$）。$\lVert F\rVert=g_R<1$ 给 Neumann 级数
$\lVert(I+F)^{-1}\rVert\le(1-g_R)^{-1}$，于是
$\lVert(I+F)^{-1}(\Lambda+E)-\Lambda\rVert\le\frac{e_R+\lVert\Lambda\rVert g_R}{1-g_R}$
（把 $(I+F)^{-1}(\Lambda+E)=\Lambda+E+(\text{含 }F\text{ 的项})$ 展开，$\lVert F(\Lambda+E)\rVert
\le g_R(\lVert\Lambda\rVert+e_R)$，我核对过这一步的合并与论文写法一致）✓。
`spectral.tex:178-181` 引 Teschl 的形式域 min--max 定理用在
$\operatorname{span}\{v_{1,R},\ldots,v_{j,R}\}$ 上，得 `spectral.tex:183` 的
` \lambda_j(I_R)\leq\lambda_j+\eta_R,`，且 `spectral.tex:185-186` 说这些水平在大 $R$ 时全负。
我确认了方向：$j$ 维试探子空间的 Rayleigh 商上确界给出第 $j$ 个特征值的一个上界 ✓，
而该上确界不超过 $j\times j$ 块的广义最大特征值 $\le\lambda_j+\eta_R$（块内特征值都 $\le\lambda_j+\eta_R$，
因为块的扰动估计一致）。

于是（`spectral.tex:187-193`）

>  \sum_{j=1}^N(-\lambda_j-\eta_R)^\gamma
>  \leq \sum_{j=1}^N|\lambda_j(I_R)|^\gamma
>  \leq \ell_\sigma\int_{I_R}W^p
>  \leq \ell_\sigma\int_\R W^p.

第一号来自 $-\lambda_j(I_R)\ge-\lambda_j-\eta_R\ge0$ 与 $t\mapsto t^\gamma$ 单增 ✓，
第二号是 \eqref{spectral:dirichlet-bound}（$N$ 个 Dirichlet 负水平的前 $N$ 个之和不超过任何 $N$ 个的水平，
论文这里用的是"$-k_j^2$ 是前 $N$ 个负 Dirichlet 特征值"的表述，我核对：$\lambda_1(I_R)\le\cdots$ 排序后，
$\sum_{j\le N}|\lambda_j(I_R)|^\gamma$ 就是前 $N$ 个负 Dirichlet 水平的和 ✓），第三号单调性 ✓。
$R\to\infty$ 后右端与 $R$ 无关，左端对每个有限族成立，取上确界得 \eqref{spectral:line-bound}
（`spectral.tex:196-199`）。`spectral.tex:200-202` 的收尾我要抄下来当作方法论：

> Thus the full moment is finite even when there are infinitely many
> negative eigenvalues.  No approximation of $W$ by smoother potentials
> is needed.

这解释了为什么"moment 有限"是被证明的，并非假设的：摘要里那句
"$L^{\gamma+1/2}(\mathbb R)$, with all negative eigenvalues included"（`main.tex:15-16`）就是这条。
引言 `introduction.tex:19-20` 也预先声明"before the inequality is proved this sum is allowed to be infinite"。

有号位势（`spectral.tex:209-226`，corollary `spectral:signed`）：形域取
$\mathcal D_V=\{v\in H^1:\int V_+|v|^2<\infty\}$，$V_+\in L^1_{\mathrm{loc}}$ 时 $C_c^\infty\subset\mathcal D_V$
给稠密（`spectral.tex:233-234`）。闭性由正的部分完备 + \eqref{spectral:form-bound} 相对界
（`spectral.tex:228-232`）。有限秩的论证复用，`spectral.tex:236-242` 那句
"On a negative spectral subspace bounded away from zero, the same relative form bound controls the
$H^1$ norm of unit vectors, since the positive potential term can be discarded." 是关键：
丢掉 $V_+$ 项不影响下界方向，所以 $H^1$ 有界性照样拿到 ✓。
比较只用形式单调 $h_V[v]\ge h_{-V_-}[v]$（`spectral.tex:244-245`）与带形域包含的 min--max，
得 $\operatorname{Tr}(H_V)_-^\gamma\le\operatorname{Tr}(H_{-V_-})_-^\gamma\le\ell_\sigma\int V_-^p$ ✓。

sharpness（`spectral.tex:254-281`）。取 $r=1/\sigma$、$W=(r+1)\sech^2(rx)$、$\psi=\sech^{1/r}(rx)$，
`spectral.tex:261-265`：

> Direct differentiation gives
> \[
>  \frac{\psi'}{\psi}=-\tanh(rx),
>  \qquad
>  \frac{\psi''}{\psi}=1-(r+1)\sech^2(rx).
> \]

我算第二式：$(\psi'/\psi)'=(\psi''\psi-(\psi')^2)/\psi^2=\psi''/\psi-(\psi'/\psi)^2$，
左边 $=-r\sech^2(rx)$，加 $(\psi'/\psi)^2=\tanh^2=1-\sech^2$，得
$\psi''/\psi=-r\sech^2+1-\sech^2=1-(r+1)\sech^2$ ✓。于是
$-\psi''-W\psi=-\psi[1-(r+1)\sech^2]-\psi(r+1)\sech^2=-\psi$，即 $H_{-W}\psi=-\psi$ ✓
（`spectral.tex:266-268` 交代指数衰减保证 $\psi\in H^2$，是此有界 $W$ 的算子域）。
反过来说：给定正的下界函数 $\psi$，$W=-\psi''/\psi+\cdots$ 被唯一决定，所以这个势不是猜的，
是"先有 $\psi$ 后有 $W$"，与我第 2 节里想直接解 $W$ 的 Euler--Lagrange 的思路正相反。
积分（`spectral.tex:269-275`）：

> Substitution $t=rx$, followed by $z=\tanh t$, gives
> \[
>  \int_\R W^p
>  =\frac{(r+1)^p}{r}\,\mathrm B(1/2,p),
>  \qquad
>  \left(\int_\R W^p\right)^{-1}=\ell_\sigma.
> \]

我补 Beta 的出现：$\int_{\R}\sech^{2p}t\,dt$，$z=\tanh t$，$dz=\sech^2t\,dt$，
$\sech^{2p}dt=\sech^{2p-2}dz=(1-z^2)^{p-1}dz$，$z\in(-1,1)$，即 $\mathrm B(1/2,p)$（第 3 节同款）✓。
再代 $r=1/\sigma$、$p=1+\sigma$：$(\int W^p)^{-1}=\frac{\sigma}{((1+\sigma)/\sigma)^{1+\sigma}
\mathrm B(1/2,1+\sigma)}=\frac{\sigma^\sigma}{(1+\sigma)^{1+\sigma}}\frac1{\mathrm B(1/2,1+\sigma)}
=A_\sigma/\mathrm B(1/2,1+\sigma)=\ell_\sigma$ ✓，与 \eqref{spectral:constant} 完全一致。
特征值 $-1$ 给 $\operatorname{Tr}(H_{-W})_-^\gamma\ge1$，上界给反向，于是等号成立
（`spectral.tex:276-278`），常数最优（`spectral.tex:279-281`）：

> This completes the proof of Theorem~\ref{thm:main}.
> Hence this potential attains equality, and the constant in
> \eqref{spectral:constant-identification} is optimal.  This establishes
> $L_{\gamma,1}=L_{\gamma,1}^{(1)}$ throughout $1/2<\gamma<3/2$.

[推测] 若 $r$ 不取 $1/\sigma$ 而取别的缩放，$\sech^2$ 势仍然是某个特征值的下界函数，
但 $(\int W^p)^{-1}$ 会多出 $r$ 的幂，不再等于 $\ell_\sigma$；$r=(\gamma-1/2)^{-1}$ 是被
"W 的振幅必须等于 $r+1$"这一个条件与测度缩放同时锁定的（`introduction.tex:46-47` 给的正是这个 $r$）。
[推测] 我试过用势的缩放族 $W_\lambda(x)=\lambda^2W(\lambda x)$ 去"凑"等号：$\int W_\lambda^p$ 按
$\lambda^{2p-1}=\lambda^{2\sigma+1}$ 变，而负特征值按 $\lambda^2$ 变、$\gamma$ 次幂给
$\lambda^{2\gamma}=\lambda^{2\sigma+1}$，两边同标度，所以缩放不改变比值，只能证明"若存在极值元则其缩放族
都是极值元"，无法给出常数；这个观察解释了我一开始为什么在"变分+极值元存在性"上打转。
[推测] $\gamma\ge3/2$ 时 $r=1/\sigma\le2$，同一个 $\sech^2$ 势给出的比值不再是全局上确界，
半经典常数反超，与猜想的另一半吻合；论文没有声明这件事，是我用 $2(\sigma/(1+\sigma))^\sigma L^{\cl}$
与 $L^{\cl}$ 的比值 $\le1$（当 $\sigma\ge1$）反推出来的。

[外部推断] 关于该猜想的历史地位，我检索到 Phan Thành Nam 的 arXiv:1704.07188（2017），
其摘要写道最优常数何时与半经典常数相等仍是长期开放问题，并给出带半经典常数加低阶梯度误差项的改进界；
这与本文引言 `introduction.tex:88-104` 对"剩余缺口"的描述一致，也说明本文只解决标量一维开区间，
不涉及高维或 $\gamma\ge3/2$ 的新内容。

## 18 Lean 机器侧取证：登记名、声明链、以及机器实际吃下的假设

登记条目（`lean/formalization.yaml:1278-1280` 逐字）：

>     - comparator_config: ComparatorChallenges/LiebThirring.json
>       declaration: OAI.SharpLiebThirring.sharp_lieb_thirring
>       file: OAI/Analysis/LiebThirring/Main.lean

我按这三行做定向取证，先读 `Main.lean`（56 行），再在 `OAI/Analysis/LiebThirring/`
（62 个 `.lean`，顶层合计 15944 行）内 grep。比较器配置
`ComparatorChallenges/LiebThirring.json` 里 `solution_module` 写 `OAI.Analysis.LiebThirring.Main`、
`theorem_names` 只有一条 `OAI.SharpLiebThirring.sharp_lieb_thirring`、`definition_names` 为空数组、
`permitted_axioms` 是 `propext`、`Quot.sound`、`Classical.choice`、`enable_nanoda` 为 `false`。
命名上要注意的坑我踩到了：登记名空间是 `OAI.SharpLiebThirring`，目录名是 `LiebThirring`，
两者不同名，按目录猜命名空间会得到 `OAI.LiebThirring`，那条声明根本不存在。
grep 结果只有两处命中：`Main.lean:38` 与 `SpectralMain.lean:90`（后者是另一条
`sharp_lieb_thirring_spectral`，名字前缀相同但不是登记项），这告诉我登记的入口是
`Main.lean` 那条而谱侧版本另有出口。

目标命题的类型在 `Model.lean:81-90`，是一个六元合取：

> def MainClaim : Prop :=
>   ∀ γ : ℝ, 1 / 2 < γ → γ < 3 / 2 →
>     (∀ W : ℝ → ℝ, Admissible γ W →
>       negativeMoment γ W ≤ ENNReal.ofReal (sharpConstant γ) * potentialMass γ W) ∧
>     optimalConstant γ = ENNReal.ofReal (sharpConstant γ) ∧
>     oneStateConstant γ = ENNReal.ofReal (sharpConstant γ) ∧
>     Admissible γ (equalityPotential γ) ∧
>     0 < potentialMass γ (equalityPotential γ) ∧
>     negativeMoment γ (equalityPotential γ) =
>       ENNReal.ofReal (sharpConstant γ) * potentialMass γ (equalityPotential γ)

对照笔头版本，我把每一条的落点找出来（全部在 `Main.lean`）：第一项由
`Main.lean:45` 的 `fun _ hW ↦ negativeMoment_bound hγ₀ hγ₁ hW`，其源头是
`MomentBound.lean:72`，那条 lemma 上方的 docstring（`MomentBound.lean:71`）写着
"The full (unlimited-family-size) negative spectral moment estimate."。第二、三项由
`Main.lean:46` 的两个 `le_antisymm`，它们把 `optimalConstant_le_sharp`（`Main.lean:16-21`）、
`sharp_le_oneStateConstant`（`Main.lean:22-34`）与 `oneStateConstant_le_optimalConstant`
（`BoundState.lean:503`）串起来，这正是笔头证明里 "$L_{\gamma,1}=L^{(1)}_{\gamma,1}$"
那一句（`spectral.tex:281`）的机器形态，而且它被拆成了两条独立不等式。第四、五项是
`Main.lean:47` 交出的 `hW`（即 `equalityPotential_admissible hγ₀`）与 `potential_mass_pos hr`。
第六项由 `Main.lean:48-50`：`le_antisymm` 一侧用上界，另一侧
`rw [sharp_times_extremizer_mass hγ₀]` 后接 `one_le_negativeMoment hr γ`，
中间那块代数在 `Main.lean:10-14` 的 `sharp_times_extremizer_mass`，它化归到
`ExtremizerMass.lean:66-67` 的

> lemma sharp_times_extremizer_integral {γ : ℝ} (hγ : 1/2 < γ) :
>     sharpConstant γ * (∫ x, (equalityPotential γ x)^(γ+1/2)) = 1

这条就是笔头 `spectral.tex:271-275` 的 $(\int_{\R}W^p)^{-1}=\ell_\sigma$，机器侧把它写成
"常数乘势的 $L^p$ 范数恰为 1"。它的证明（`ExtremizerMass.lean:68-77`）用
`potential_power_integral`（`ExtremizerMass.lean:12` 起，docstring 声明
"Exact substitution `z = tanh (r*x)`; no integrability convention is used to guess the integral,
since the Jacobian theorem applies to the full line."）与 `action_constant_eq_sharp`，
后者把 `actionYoungConstant`（`ActionBounds.lean:88`：`σ ^ σ / (1 + σ) ^ (1 + σ)`，
逐字对应 `spectral.tex:12` 的 $A_\sigma$）与 Beta 因子组装成 `sharpConstant`。
也就是说：笔头"三步代入即得"的常数辨识，在机器侧是一条显式的引理链，$A_\sigma$、
$\mathrm B(1/2,1+\sigma)$、$L^{\cl}$ 各自有独立定义（`semiclassicalConstant` 在
`Model.lean:62-63`，与 `introduction.tex:30` 的 $\Gamma(\gamma+1)/(2\sqrt\pi\Gamma(\gamma+3/2))$
同式）。

关键的定义级取证是 `Model.lean` 的这几个：

> def negativeMoment (γ : ℝ) (W : ℝ → ℝ) : ℝ≥0∞ :=
>   ⨆ (N : ℕ) (u : Fin N → H1) (k : Fin N → ℝ)
>     (_ : IsOrthonormalFamily u) (_ : ∀ i, IsNegativeEigenfunction W (k i) (u i)),
>       ∑ i, (ENNReal.ofReal (k i)) ^ (2 * γ)

（`Model.lean:46-49`）与 `Admissible`（`Model.lean:56-57`，`(∀ᵐ x : ℝ, 0 ≤ W x) ∧
MemLp W (ENNReal.ofReal (γ + 1 / 2))`）、`potentialMass`（`Model.lean:59-60`，
$\int^-\ (\lvert W(x)\rvert_{\mathbb R_{\ge0}})^{\gamma+1/2}$ 的 ENNReal 积分）、
`sharpConstant`（`Model.lean:65-66`）、`equalityPotential`（`Model.lean:76-78`，
`let r := (γ - 1 / 2)⁻¹` 然后 `(r + 1) * (Real.cosh (r * x))⁻¹ ^ 2`，即笔头的
$(r+1)\sech^2(rx)$，`spectral.tex:256`）。

我要把 `negativeMoment` 的这个写法当作一条取证结论读出来：它把"所有负特征值之和"实现成
对有限正交族的指标上确界，指标变量 $N$ 是量词，并非极限，因此摘要里
"with all negative eigenvalues included"（`main.tex:16`）与 `introduction.tex:19-20` 的
"before the inequality is proved this sum is allowed to be infinite"在机器侧是**结构性**成立的，
不需要任何"先证有限再取和"的步骤。相应地 `MomentBound.lean:75-76` 的证明就是
`unfold negativeMoment` 后对四个指标变量 `iSup_le`，把 `finite_complex_eigenfamily_bound`
（`MomentBound.lean:51-55`，结论形如 `∑ i, k i^(2*γ) ≤ sharpConstant γ*∫ x, W x^(γ+1/2)`）
逐族套用。这解释了 `Model.lean` 里为何同时有 `H1` 型（笔头的 $H^1$）而没有出现任何
自伴算子谱测度：主登记命题走的是"形式/特征函数族"路线。

第二条出口在 `SpectralMain.lean`，它才是真正构造算子的那一侧：
`schrodingerOperator`（`SpectralMain.lean:12`）、`schrodingerOperator_selfAdjoint`（:15）、
`schrodingerOperator_associated`（:19）、`spectralMoment`（:40-41，用 `eigenvalueSum`
对 `NegativeEnergy` 的全基计数）、`spectralOptimalConstant`（:48-50）、
`sharp_bound_for_associated_operator`（:76）、`sharp_lieb_thirring_spectral`（:90-97），
后者的 docstring（`SpectralMain.lean:87-89`）逐字是：

> /-- All main conclusions in the actual-operator formulation. Its operator is
>     constructed unconditionally; no existence, trace equivalence, spectral estimate,
>     or finiteness assumption is used as an input. -/

`SpectralMain.lean:84-85` 还从"moment 有界"反推出每个负能量本征空间
`FiniteDimensional ℂ (eigenSpace A e.1)`，即笔头 `spectral.tex:71-81` 的有限秩论证在机器侧
是被**当作结论**从估计导出的，并非当作先验输入；对照 `spectral.tex:33-41` 把有限秩与紧预解式
写在 lemma 里当作工具用，我认为两侧的依赖方向相反，这是我在第 20 节要展开的差异之一。
另外 `SpectralMain.lean:98` 那行 `obtain ⟨hb,ho,hs,hW,hp,he⟩ := sharp_lieb_thirring γ hγ₀ hγ₁`
说明两条出口彼此打通：谱侧版本从登记命题里析取材料。

模块与笔头分片的对应，我用声明名扫描（只读签名，未通读证明）：
`Continuation.lean:19` 的 `radialCut` 是 \eqref{path:homotopy-ode} 附近那个 $\chi$ 的实现；
`RowSigns.lean` 的 `LowerSpace`、`rowSign`、`signConjugate`、`NonzeroRows`、`lowerDim` 对应
$\mathcal L^\times/G$；`ActionPenalty.lean:198-207` 的 `triangularLinearInverse`（带
`hc : ∀ i, c i ≠ 0` 假设）对应 `connecting-path.tex:246-255` 的 $D\Phi_0$ 同构；
`FlowContinuation.lean:101` 的 `vanishing_row_stationary`、`:142` 的 `matching_nonzero_rows`、
`:21` 的 `scalar_stationary_unique`、`:47/:71` 的 `upper_barrier`/`two_sided_barrier` 对应
`connecting-path.tex:193-204` 与 `:259-278`；`MatrixTangent.lean` 的
`gaussianSchur`/`powerSchur`/`tangentSchur` 与 `powerSchur_trace_comparison` 对应
\eqref{eq:gamma-mixture} 与 \eqref{eq:P-average}，机器侧把 $\mathcal P$ 写成 Schur 乘子族；
`ResolventCalculus.lean`（574 行）对应 `rank-one.tex:27-72`；`MatrixOrder.lean`（1063 行，
本模块最大单文件）对应 `rank-one.tex:175-201` 的迹单调；`FieldRegularity.lean`（571 行）、
`FieldLimit.lean`（482 行，含 `symmetric_shift_*`、`primitive_taylor_bound`）、
`FieldPrimitive.lean` 对应 `matrix-field.tex:58-135`；`IntervalAction.lean` 的
`penalized_action_integral`、`compact_amplitudes`、`regularized_action_upper_test`、
`finite_action_upper_test` 对应 `action-limit.tex` 的两步极限；`BoundState.lean`（651 行，
`profile`、`potential`、`profileDerivative`、`oneStateConstant_le_optimalConstant`）对应
`spectral.tex:254-281` 与 `Model.lean` 的常数比较；`RankOne.lean:601` 是
`source_rankone_comparison`，其陈述

>     (∑ i, a i ^ 2) ^ (1 + 1 / σ) ≤
>       ∑ i, a i * ((diagonal (fun i ↦ k i ^ 2) - B ^ 2) *ᵥ a) i

与 \eqref{eq:rankone} 同（右端逐项展开即 $a^{\mathsf T}(K^2-B^2)a$，左端即 $|a|^{2q}$，
$q=1+1/\sigma$）。它的证明（`RankOne.lean:606-614`）先 `complexify` 再用
Hermitian 版本 `rankone_hermitian_comparison`，也就是机器侧把实对称情形作为复 Hermitian
情形的推论，而笔头 `rank-one.tex` 全程在 $\Sym_N$ 里做；这条差异我在第 20 节记为一处实质分歧。

关于"笔头声称而机器未吃下"的部分，我能核对到的清单：`spectral.tex:14-15` 的
`$0\leq W\in L^p$` 在机器侧是 a.e. 非负加 `MemLp`（`Model.lean:57`），一致；
`introduction.tex:50-52` 提到的 signed 势推论（`spectral:signed`，`spectral.tex:209-226`）
我在扫描的声明里**没有**找到对应出口（登记项与谱侧出口都只处理 `Admissible γ W`，
即非负势）；`spectral.tex:57` 的 KLMN、`connecting-path.tex:82-130` 的 Sard/横截性光滑化，
在机器侧分别是 `LocalWeight.lean`/`WeightedCutoff.lean` 之类的形式论证与
`FiniteParity.lean`（761 行）的**组合化替代**：该文件的声明名是
`affine_constraints_endpoints`、`even_affine_constraints_endpoints`、`augmentedMap`、
`facetHit`、`even_facetHit_of_kernel_line`、`augmentedMap_surjective`，
读这些签名我的判断（标注为推断）是：机器侧把"紧 1 维流形边界点为偶数"这条微分拓扑论证
替换成了多面体/胞腔意义上的"仿射约束的命中端点数为偶"，`CubeFlags.lean`（750 行）、
`FlagGeometry.lean`、`EquivariantFlags.lean`、`FreeLocus.lean`、`GenericPosition.lean`、
`InitialOrbit.lean`、`BoundaryParity.lean`（452 行）合起来是这套离散奇偶性机器的几何部分。
[推测] 这个替换不是翻译上的偷懒：Sard 定理与光滑逼近在 Lean 数学库里的可用面很窄，
PL 化的奇偶性论证把"任意小的正则参数"换成"组合式的面命中计数"，代价是需要
`GenericPosition`、`FreeLocus` 这类一般位置引理的有限维版本。

取证纪律上我能给的负面结论：在该目录内的 grep 显示无 `sorry`、无 `admit` 策略
（`EquivariantFlags.lean:88` 唯一的 `admit` 命中在 docstring 的英文句子
"Free finite group actions admit arbitrarily close equivariant generic..." 里，是散文不是策略），
无 `axiom`/`opaque`/`native_decide` 声明，因此允许公理集合就是 json 里那三条
`propext`/`Quot.sound`/`Classical.choice`（版本记为 Lean 4.34.1）。我没有运行构建，
所以"整个模块在当前 Mathlib 上可编译"这一条我**不**当作已验证事实来写；我能验证的是
声明类型链与登记项的一致性。

## 19 尝试过的错误路线及失败原因

这一节把前面散落的弯路按"我在哪一步、被哪个具体机制挡住"重新归拢，每条都落到行号上。

其一，端点插值。我以为 $\gamma=\frac12$ 与 $\gamma=\frac32$ 的已知值可以插出整条曲线。
数值上我在第 0 节算过：$\gamma=1$ 处插值给 $\approx0.306$，真值 $4/(3\sqrt3\pi)\approx0.2456$，
差约 25%，插值只能给 $c\,L^{(1)}$ 型常数。机制层面：插值保不住"最优常数"这个属性，
它给的是凸组合的上界。

其二，把 Read--Schulz 的累积质量矩阵修正推广到一般 $\sigma$。该方法是指数 1 处的
标度不变性产物（`introduction.tex:106-113` 描述其来源为 Benguria--Loss 的标量累积质量论证），
$\sigma\ne0$ 时修正项不闭合。`introduction.tex:114-115` 作者自陈差异："Our proof retains the
individual eigenvalue scales in a finite-interval action inequality."，"retains" 一词
正是对我这条路失败的确认。

其三，对 $C$ 直接求驻点（第 2 节）。失败在右端的逐尺度结构，锚在 `introduction.tex:141-143`。

其四，自由极大化 $a\in H^1_0$（丢掉下三角）。方向变容易，但 `spectral.tex:106-113` 的
"$a_i$ 落在前 $i$ 个特征函数张成空间内、$\sum_{j\le i}C_{ij}^2(k_i^2-k_j^2)\le0$" 失效，
左边无法被 $\int W^p$ 界住；同时 `connecting-path.tex:232-245` 的 $CC^{\mathsf T}=2\varepsilon K$
会从 $2^N$ 个孤立解变成 $(2\varepsilon K)^{1/2}O$ 的连续统，奇偶计数失效。

其五，算子范数下的矩阵 Lipschitz。断在 `matrix-field.tex:63-66` 提供的是 HS 版本，
而 $\sigma$ 幂不算子 Lipschitz；若强用，`connecting-path.tex:14-15` 要的局部 Lipschitz 与
Gronwall 依赖（`connecting-path.tex:160-162`）都得重做。

其六，直接取 $M(B)=(K^2-B^2)_+^{\sigma}$ 或 $\mu(K^2-B^2)$ 的矩阵函数。断在两处：
$f$ 在 0 处不 $C^1$（`matrix-field.tex:42` 声明的 $C^1$、严格增、凹全丢），
以及 `matrix-field.tex:200-203` 只需要标量凹性，一旦要求 operator concavity 就不成立
（`matrix-field.tex:206-207` 明确否认）。

其七，非对称截断 $\int_0^R$。断在 `matrix-field.tex:101-108`：$-2sf'(s^2)B$ 是奇项，
只在对称截断下逐 $R$ 归零，否则 $M$ 不存在；`rank-one.tex:109-110`、`rank-one.tex:191-193`
也全押在对称截断上。

其八，用特征值微扰/连续谱选择替代号对称论证。`connecting-path.tex:193-204` 给的是
"第 $i$ 行零 ⟹ $S_iBS_i=B$ ⟹ $Be_i=b_ie_i$"，绕开了一切特征值可微选择；
反过来做会撞在重根不可微上。

其九，带符号的度。断在 `connecting-path.tex:136` "No orientation of $Q$ or $E$ is required."
所对应的必要性：商丛 $E$ 的定向非平凡（第 12 节的失败路线里我给了行列式翻转的具体理由）。

其十，抽取路径子列（Arzelà--Ascoli 式）。断在 $B'\sim\varepsilon^{-1}$，
`connecting-path.tex:298-299` 明说"it requires no bound on $B'$ uniform in $\varepsilon$"，
而 `action-limit.tex:41-56` 只需要紧集上的一致惩罚。

其十一，$\delta$ 与 $\varepsilon$ 同时或反序取极限。断在
`matrix-field.tex:26` 的 $f'$ 界与 `rank-one.tex:70-71`、`rank-one.tex:123` 的 $\delta$ 依赖；
`action-limit.tex:63`、`action-limit.tex:73-74` 两次强调次序与"不用 $\delta$-一致界"。

其十二，先解最优势的 Euler--Lagrange 再证极值元唯一。第 17 节末尾我算了缩放族
$W_\lambda(x)=\lambda^2W(\lambda x)$ 给出同一比值，说明这条路最多只能给出极值元的
一个族，给不出常数；而论文在 `spectral.tex:261-268` 是反过来由 $\psi$ 造 $W$。
此外 `introduction.tex:54-55` 明确放弃了分类全部极值元。

其十三，把 $N$ 当作趋于无穷的参量做极限。第 1 节我已说明：整个路径构造里 $N$ 固定，
无穷性只通过 `spectral.tex:145-149` 的"任选有限 $N$ 个负特征值"与
`spectral.tex:194-196` 的上确界进来；先做 $N\to\infty$ 会让 $\dim\mathcal L=d$ 的等维计数失效。

其十四，把 $W$ 先光滑化再估计。`spectral.tex:200-202` 直接声明不需要
"No approximation of $W$ by smoother potentials is needed."，而我一开始默认要光滑化，
因为我相信 $H^1$ 试探函数需要 $W$ 有界；实际上 `spectral.tex:44-50` 的插值 +
`spectral.tex:60-69` 的算子范数逼近已经承担了这件事。

## 20 最终思路与最初设想的差异

我把差异按"我原来的直觉"与"论文实际的做法"并列，只列我在前面各节已经落过地的条目。

第一，我把问题当变分问题，论文把它当**存在性问题**。我以为核心是
$\sup_C\mathcal E_K(Cu)$ 的极大化，实际核心是 `connecting-path.tex:36-59` 的
命题 path:existence：先证明存在一对 $(C,B)$ 使 $B$ 从 $K$ 走到 $-K$，再由
`action-limit.tex:16-23` 的全微分恒等式把这条路径的值塞进 $\sup$。
"sup 至少多大"被换成"存在一个具体的 $C$"，逻辑强度上是等价替代，但方法论上完全反向。

第二，我以为拓扑只是装饰，实际上它是唯一承重柱。`path:parity` 用
`connecting-path.tex:132-136` 的 1 维紧流形端点计数，配 `connecting-path.tex:206-230`
的商丛，再配 `connecting-path.tex:232-256` 的"商掉 $G$ 后恰一个横截零点"。
少了任何一环，同伦就没有起点或终点。而这三环各自都需要一个独立的机械条件：
等维（$d=\operatorname{rank}E=N(N+1)/2$）、自由作用（行非零）、
可解线性化（$c_i\ne0\iff k_i>0$）。

第三，我以为 rank-one 约束要靠 Lagrange 乘子或投影实现，论文用
$\varepsilon^{-1}\lVert M(B)-aa^{\mathsf T}\rVert_{\HS}^2$ 的**软惩罚**
（`action-limit.tex:21`、`action-limit.tex:32-35`），并且只在紧集 $\mathcal K$ 上论证惩罚一致地小
（`action-limit.tex:41-56`）。这一招把"约束的极限"变成"逐点不等式的一致化"，
避开了任何弱收敛与放松（relaxation）分析。

第四，我以为两个小参数 $\varepsilon$、$\delta$ 是重复劳动，实际它们分工严格：
$\delta$ 只服务于分析正则性（$f'\in L^\infty$、resolvent 可积、$d+\delta$ 作分母），
$\varepsilon$ 只服务于约束惩罚；次序被 `action-limit.tex:63` 与 `action-limit.tex:73-74`
钉死，我在第 14、15 节给出过反序会断在哪一行的具体核算。

第五，我以为最优常数背后有深的极值结构，实际它由两条初等事实相除得到：
一次单变量极大化（$A_\sigma$，`spectral.tex:119-120`）与一个 Beta 积分
（$\mathrm B(1/2,1+\sigma)$，`spectral.tex:127-129`）。`spectral.tex:132-133`
甚至强调常数辨识"without any limiting argument in $\sigma$"。所有深度都前移到了
"能否证明作用量不等式"这一层。

第六，我以为号群 $G$ 的作用只是记号对称，实际它是使解集有限的**规范固定**：
不商掉 $G$ 就有 $2^N$ 个零点（偶数），mod-2 立刻失效（第 12 节的失败路线）；
而 $G$ 只由与 $K$ 交换的号矩阵构成，`matrix-field.tex:226-227` 明确拒绝更大的等变群。
同理，下三角也不是谱侧的权宜：它同时保证了 $a_i$ 的层次包含与 Cholesky 解的孤立性。

第七，我以为"所有负特征值"要靠先证有限性，实际论文用有限子空间的指标上确界
（`spectral.tex:145-149`、`spectral.tex:194-199`），把有限性作为结论。Lean 侧把这个设计
做得更彻底：`Model.lean:46-49` 的 `negativeMoment` 干脆把 $N$ 做成量词，
`SpectralMain.lean:84-85` 则把本征空间有限维当作**从估计导出**的结论。

第八，机器侧与笔头侧的分歧集中在两处拓扑/解析装置上：
（i）`rank-one.tex` 全程实对称，`RankOne.lean:601-614` 却经由 `complexify`
把实情形化成 Hermitian 情形的推论；（ii）`connecting-path.tex:70-137` 的光滑丛截面 + Sard
论证，在机器侧对应 `FiniteParity.lean` 的 `facetHit`/`even_facetHit_of_kernel_line`
一系组合化命题[推测]。两处差异都不落在内容层，而落在可用工具层。

第九，回到第 0 节我的算盘：我最初把这篇论文设想成"Read--Schulz 在 $\gamma=1$ 的推广"，
读完之后我的定位改成了"一个与位势无关的有限维作用量下界，外加一次耗尽"。
`introduction.tex:114-119` 这段话是我改主意的落点，逐字如下：

> Our proof retains the individual eigenvalue scales in a finite-interval
> action inequality. Its main analytic step is a rank-one comparison for
> an energy-dependent regularized matrix field. A continuation argument
> chooses a lower triangular coefficient matrix and a path joining two
> prescribed matrix endpoints. Together these yield the action inequality
> for every $1/2<\gamma<3/2$. Theorem~\ref{thm:main} therefore resolves
> the remaining open-interval cases of the one-dimensional Lieb--Thirring
> conjecture positively; the case $\gamma=1$ is already covered by
> Read--Schulz.

其中"energy-dependent regularized matrix field"这个说法在第 5 节的构造里落地为
$M_\delta$ 依赖 $K$（$X_s(B)=K^2-2sB+s^2I_N$ 里的 $K$ 是数据，不是变量），
这一点我一开始完全没料到：场本身把谱尺度 $k_i$ 编进了定义，
所以尺度可以在路径端点处被原样取出（`matrix-field.tex:194-197`）。

## 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\gamma$ | $1/2<\gamma<3/2$，两端均不取 | `introduction.tex:126` | $\sigma=\gamma-1/2$ 的一切定义、谱侧全部估计 | 取 $\gamma=3/2$ 则 $\beta=1/2$，`matrix-field.tex:97-98` 的尾部 $O(\lvert s\rvert^{2\beta-2})$ 变成 $O(\lvert s\rvert^{-1})$，$\int_{\R}$ 发散，$M$ 不存在 |
| $\sigma$ | $\sigma=\gamma-1/2\in(0,1)$ | `introduction.tex:126` | 作用量非线性幂 $2+2/\sigma$、$A_\sigma$、$\ell_\sigma$ | 放到 $\sigma\ge1$ 时 `matrix-field.tex:43` 要求的 $\beta<1/2$ 破坏，$c$ 的积分发散 |
| $p$ | $p=1+\sigma\in(1,2)$ | `spectral.tex:9` | 位势类 $W\in L^p$、Young 极大化、$W^{1+\sigma}$ | 取 $p=1$（$\sigma=0$）则 `spectral.tex:44` 的 $p'=p/(p-1)$ 无穷，`spectral.tex:52-55` 的形式界失义 |
| $q$ | $q=1+1/\sigma$，等于 $2p'$ | `spectral.tex:10` | 目标项 $\lvert a\rvert^{2q}$、`action-framework.tex:45` 的结论 | 改 $q$ 后与 $p$ 不再共轭，`spectral.tex:117-120` 的 $Wm-m^q$ 极大值不再是 $A_\sigma$ |
| $\beta$ | $\beta=\sigma-1/2\in(-1/2,1/2)$ | `matrix-field.tex:23` | $f'$ 的幂 $\beta-1$、尾部指数 $2\beta-2$、$c$ 的分母 | 把 $\beta$ 换成 $\sigma$ 则奇性与尾部同时超限，`matrix-field.tex:95-98` 的均值定理估计与 `matrix-field.tex:28` 的 $c$ 同时崩 |
| $\delta$ | 固定 $>0$，末了 $\delta\to0$ | `matrix-field.tex:4` | $f'$ 的正则化、$\mu(z)=(z+\delta)^\sigma-\delta^\sigma$ | 置 $\delta=0$ 且 $\beta<1/2$ 时 $f'(0)$ 为 $0$ 或 $\infty$，`rank-one.tex:112` 的 $M(B)\le mI+\mu'(d)\mathcal P(D-dI)$ 无法闭合 |
| $f'$ | $(\max\{y,0\}+\delta)^{\beta-1}$，配 $f(0)=0$ | `matrix-field.tex:25-26` | $X_s(B)$ 的函数演算、$M_R$、切映射 $T_s$ | 去掉 $\max\{y,0\}$ 则负谱处取实幂无定义，`matrix-field.tex:63` 的 HS 函数演算前提不成立 |
| $c$ | $\sigma/\int_{\R}(1+s^2)^{\beta-1}\,ds$ | `matrix-field.tex:28` | 归一化 $\mu'(z)=\sigma(z+\delta)^{\sigma-1}$（`matrix-field.tex:165-167`） | 差一个常数倍则 `matrix-field.tex:151` 的 $\mu$ 不再等于 $(z+\delta)^\sigma-\delta^\sigma$，`rank-one.tex:219` 的 $m=(d+\delta)^\sigma-\delta^\sigma$ 断 |
| $c_\beta$ | $\bigl(\int_0^\infty t^\beta/(1+t)^2\,dt\bigr)^{-1}$ | `rank-one.tex:33` | 预解式表示 $f(y)=c_\beta\int_0^\infty v^\beta(\cdots)\,dv$ | 归一化错则 `rank-one.tex:51-52` 的恒等式带残因子，`rank-one.tex:41-42` 的 $T_Y$ 系数与 $M$ 不匹配 |
| $X_s(B)$ | $K^2-2sB+s^2I_N$，即 $(sI-B)^2$ 加 $K^2-s^2I$ | `matrix-field.tex:49` | $M_R$ 定义、`rank-one.tex:103` 的 $X_s=Y_s+(D-dI)$ | 把 $-2sB$ 改成任意扰动会破坏完全平方，`rank-one.tex:186-187` 中 $U=e^{itB}$ 与 $(sI-B)^2$ 交换的用法失效 |
| $M_R,M$ | $c\int_{-R}^{R}(f(X_s)-f(s^2)I)\,ds$，$M=\lim_RM_R$ | `matrix-field.tex:50-51` | $J$、`rank-one.tex:198` 的平均、路径方程 | 改单边 $\int_0^{R}$ 则 `matrix-field.tex:107` 依赖的奇项抵消失效，$\operatorname{tr}M$ 无界 |
| $J$ | $-\int_0^{1}\operatorname{tr}(BM(tB))\,dt$ | `matrix-field.tex:82-83` | `action-framework.tex:39-40` 的 $dJ[B][H]=-\operatorname{tr}(M(B)H)$ | 前面的负号翻掉后 `action-limit.tex:21` 的惩罚项变正，`action-limit.tex:43-44` 的 $\eta_\varepsilon\to0$ 反证失效 |
| $\mu$ | $c\int_{\R}(f(s^2+z)-f(s^2))\,ds=(z+\delta)^\sigma-\delta^\sigma$ | `matrix-field.tex:141` 与 `matrix-field.tex:151` | $\mu'(d)$、行方程 `connecting-path.tex:197-198` | 平移恒等式 `matrix-field.tex:155-157` 不成立则 `rank-one.tex:113` 的系数 $c/\mu'(d)$ 无界 |
| 尾部阶 | $\operatorname{Lip}(h_s)=O(\lvert s\rvert^{2\beta-3})$，$\sup\lvert h_s\rvert=O(\lvert s\rvert^{2\beta-2})$ | `matrix-field.tex:97-98` | $M_R$ 的收敛与局部一致 Lipschitz | $\beta\ge1/2$ 时 $2\beta-2\ge-1$，`matrix-field.tex:101` 的余项不可积 |
| $D$ | $K^2-B^2$ | `rank-one.tex:95` | 目标 $a^{\transpose}Da\ge\lvert a\rvert^{2q}$（`rank-one.tex:11`） | 反号定义成 $B^2-K^2$ 则 `rank-one.tex:219-220` 的 $dm\ge m^{1+1/\sigma}$ 与结论方向相反 |
| $d$ | $(m+\delta^\sigma)^{1/\sigma}-\delta$，$m=\lvert a\rvert^2$ | `rank-one.tex:96` | $\mu(d)=m$、`rank-one.tex:112` 的 $D-dI$ | 换 $\mu'$ 的别的反函数支则 `rank-one.tex:219` 的 $m\le d^\sigma$ 给错次幂，末步 $dm\ge m^{1+1/\sigma}$ 断 |
| $\mathcal P$ | $(c/\mu'(d))\int_{\R}T_s\,ds$，等于酉共轭对 $\nu$ 的平均 | `rank-one.tex:113` 与 `rank-one.tex:127` | `rank-one.tex:171` 的 $\operatorname{tr}(M(B)D)\ge\operatorname{tr}(M(B)\mathcal P(D))$ | $\nu$ 非概率测度（`rank-one.tex:125`）则 $\mathcal P(I)=I$（`rank-one.tex:129`）失效，`rank-one.tex:206-207` 用 $M^2=mM$ 的抵消不成立 |
| $P_{ij}$ | $\int_0^{1}(\cdots)^{\beta-1}\,d\tau$，对角元为 $1$ | `rank-one.tex:122` 与 `rank-one.tex:157` | $\nu$ 的特征函数即 $P_{ij}$（`rank-one.tex:155-156`） | 方差 $h=\tau(1-\tau)/(d+\delta)$（`rank-one.tex:153`）一改，Gamma 混合与高斯乘子的对应断，$\mathcal P$ 不再是共轭平均 |
| Petz 单调性 | $\operatorname{tr}((g(A_1)-g(A_2))(A_1-A_2))\ge0$ | `rank-one.tex:175-179` | `rank-one.tex:188-189` 的 $0\le\operatorname{tr}(f(X_s)(2D-UDU^*-U^*DU))$ | $f$ 不单调时该不等式无方向，`rank-one.tex:191-193` 减 $f(s^2)I$ 再取极限整段失去依据 |
| $\varepsilon$ | 任意 $>0$；$C$ 的一致界只对 $0<\varepsilon\le1$ 声明 | `connecting-path.tex:45` 与 `connecting-path.tex:58` | 惩罚 $\varepsilon^{-1}\lVert M(B)-aa^{\transpose}\rVert_{\mathrm{HS}}^2$、端点 $B(x_\pm)=\pm K$ | 直接令 $\varepsilon=0$ 就没有 ODE，`connecting-path.tex:48-50` 的解存在性与 `path:operator-bound`（`connecting-path.tex:53-55`）都无从谈起 |
| $\chi,\widehat M$ | $\chi(B)=\eta(\operatorname{tr}B^2)$，在 $[0,N\kappa^2]$ 上为 $1$ | `connecting-path.tex:144-148` | 使场有界且全局 Lipschitz，保证解存在 | $\chi$ 非 $1$ 的区域内路径解的是 modified 方程，必须靠 `connecting-path.tex:261-278` 的拦路论证撤掉截断 |
| $\kappa,\ell$ | $\kappa=\lVert K\rVert_{\mathrm{op}}$，$\ell=x_+-x_-$ | `connecting-path.tex:142` | 拦路函数 $h(x)=e^{\mathsf T}B(x)e$ 的界、$\operatorname{tr}\widehat M$ 的上界 | $\kappa$ 取小则 $[0,N\kappa^2]$ 覆盖不到解，`connecting-path.tex:270` 的 $e^{\mathsf T}K^2e\le\kappa^2<h(x)^2$ 不成立 |
| $G$ | $\{\pm1\}^N$ 行变号群，$Q=\mathcal L^\times/G$ | `connecting-path.tex:216` | 把 $\Phi_\theta$ 降成向量丛截面（`connecting-path.tex:228-230`） | 不商 $G$ 时零点为 $2^N$ 个（偶数），mod-$2$ 计数立刻归零；等变性见 `connecting-path.tex:190` |
| $d=\dim\mathcal L$ | $N(N+1)/2$ | `connecting-path.tex:218` | 截面零集的 $1$ 维流形结构（`connecting-path.tex:133-134`）、Sard 用 $(m+1)$ 维射影（`connecting-path.tex:120`） | 与纤维秩 $N(N+1)/2$ 不等维时横截性论证不闭合，端点计数无法等于 $1\bmod 2$ |
| $\sqrt{2\varepsilon k_i}$ | $\Phi_0$ 的下三角解 $C=\operatorname{diag}(\pm\sqrt{2\varepsilon k_i})$ | `connecting-path.tex:236` 与 `connecting-path.tex:240-241` | $\theta=0$ 端"恰一个 $G$-轨道"（`connecting-path.tex:245`）、$D\Phi_0$ 同构（`connecting-path.tex:249-253`） | 右端换成 $2\varepsilon K^2$ 则 Cholesky 解尺度错，同伦起点与终点的零点数不再同余 |
| $CC^{\mathsf T}$ 恒等式 | $CC^{\mathsf T}=2\varepsilon K+\theta\int_I\widehat M(B)\,dx$ | `connecting-path.tex:173` | $\lVert C\rVert_{\mathrm{HS}}^2\le2\varepsilon\operatorname{tr}K+\ell\sup_B\lvert\operatorname{tr}\widehat M(B)\rvert$（`connecting-path.tex:177-179`） | 丢 $\theta$ 就没有关于 $\theta$ 一致的先验界，`connecting-path.tex:181-182` 的零点集紧性失效 |
| $b_i$ 行方程 | $\varepsilon b_i'=\theta\chi(B(x))\mu(k_i^2-b_i^2)$ | `connecting-path.tex:197-198` | "行不可消失"（`connecting-path.tex:201-204`）、$\mathcal L^\times$ 的开性 | 系数 $\theta\chi/\varepsilon$ 变号则局部 Lipschitz 唯一性不再排除 $b_i\equiv0$，商作用失去自由性 |
| $F_\varepsilon$ | $\lvert a\rvert^{2q}-a^{\transpose}(K^2-B^2)a-\varepsilon^{-1}\lVert M(B)-aa^{\transpose}\rVert_{\mathrm{HS}}^2$ | `action-limit.tex:32-34` | $\eta_\varepsilon=\max_{\mathcal K}\max\{F_\varepsilon,0\}$（`action-limit.tex:43-44`） | 惩罚项换成非 HS 的范数则 `action-limit.tex:49-50` 推不出 $M(B_n)-a_na_n^{\transpose}\to0$ |
| $\eta_\varepsilon$ | 趋于 $0$（$\varepsilon\downarrow0$，$\delta$ 固定） | `action-limit.tex:43-44` | $\sup_C\mathcal E_K(Cu)+\lvert I\rvert\eta_\varepsilon$（`action-limit.tex:61`） | 若 $\mathcal K$ 不紧，反证序列 `action-limit.tex:46-48` 无收敛子列，一致小性断 |
| $\mathcal K$ | $(B_\varepsilon(x),a_\varepsilon(x))$ 的公共紧集 | `action-limit.tex:37-40` | $\eta_\varepsilon$ 的定义域与 $\max$ 的存在性 | 依赖 `connecting-path.tex:57-58` 的 $C_\varepsilon$ 一致界与 $\lVert B\rVert_{\mathrm{op}}\le\kappa$，缺一个 $\mathcal K$ 就不紧 |
| $N$ | 任意有限正整数，非极限 | `action-framework.tex:21-22` | $\mathcal E_K$、$\dim\mathcal L$、和式 $\sum_{i=1}^{N}$（`action-framework.tex:25`） | 把 $N\to\infty$ 塞进路径则 $d=N(N+1)/2$ 与紧性、Sard 同时崩；谱侧靠 `spectral.tex:146` 的"任取有限个"绕过 |
| $A_\sigma$ | $\sigma^\sigma/(1+\sigma)^{1+\sigma}$ | `spectral.tex:12` | $Wm-m^q$ 的极大值（`spectral.tex:117-120`）；Lean 侧 `actionYoungConstant`（`ActionBounds.lean:88`）逐字同式 | 指数 $(1+\sigma)$ 写成 $\sigma$ 则与极大值差因子 $1/(1+\sigma)$，$\ell_\sigma$ 随之偏移 |
| $\mathrm B(1/2,1+\sigma)$ | Beta 函数值 | `spectral.tex:14` 与 `spectral.tex:16` | $\ell_\sigma=A_\sigma/\mathrm B(1/2,1+\sigma)$ 的归一 | beta--gamma 恒等式 `spectral.tex:132-140` 不成立时 $\ell_\sigma$ 与 $2(\sigma/(1+\sigma))^\sigma L_{\gamma,1}^{\mathrm{cl}}$ 脱钩，猜想的常数形式对不上 |
| $\ell_\sigma$ | $2(\sigma/(1+\sigma))^\sigma L_{\gamma,1}^{\mathrm{cl}}$ | `spectral.tex:139-140` | 区间界 `spectral.tex:99`、线界 `spectral.tex:196-198` | 直接用 $L_{\gamma,1}^{\mathrm{cl}}$ 替代则 `spectral.tex:274` 的 $(\int W^p)^{-1}=\ell_\sigma$ 差一个 $2(\sigma/(1+\sigma))^\sigma$ |
| $2^{1/p}$ | $\lVert v\rVert_{2p'}^2\le2^{1/p}\lVert v'\rVert_2^{1/p}\lVert v\rVert_2^{2-1/p}$ | `spectral.tex:46-49` | $b_{\eta,W}$ 的存在（`spectral.tex:51-55`）、KLMN（`spectral.tex:57`） | 指数 $1/p$ 来自 $\lVert v\rVert_\infty^2\le2\lVert v\rVert_2\lVert v'\rVert_2$；$p=1$ 时 `spectral.tex:44` 的 $p'$ 无穷，整条形式界消失 |
| $\eta$ | 任意 $>0$，证明中取 $\eta=1/2$ | `spectral.tex:52` 与 `spectral.tex:75` | $h_{-W}$ 的半下有界、谱子空间序列的 $H^1$ 界 | 取 $\eta\ge1$ 时 `spectral.tex:74-76` 不能用 $h_{-W}[v_n]\le-\alpha$  bound 住 $\lVert v_n\rVert_{H^1}$，Rellich 提取弱收敛失效 |
| $k_1\ge\cdots\ge k_N$ | Dirichlet 本征值的降序排列 | `spectral.tex:95` 与 `spectral.tex:112` | 三角和 $\sum_{j\le i}C_{ij}^2(k_i^2-k_j^2)\le0$ | 不排序则该项符号不定，`spectral.tex:108-114` 的 $\mathcal E_K(Cu)\le\int(Wm-m^q)$ 断，作用量下界与谱上界接不上 |
| $\chi_R$ | 在 $[-R,R]$ 上为 $1$，支在 $I_R=(-2R,2R)$，$\lVert\chi_R'\rVert_\infty\le c/R$ | `spectral.tex:152-154` | $v_{j,R}=\chi_R\phi_j\to\phi_j$ 于 $H^1$（`spectral.tex:155-157`） | 导数界换成与 $R$ 无关的常数则 $Q_R\not\to\Lambda$，`spectral.tex:175` 的 $\eta_R$ 不趋于 $0$ |
| $G_R,Q_R$ | Gram 与形式矩阵，$G_R\to I_N$、$Q_R\to\Lambda$ | `spectral.tex:162-168` | $\lambda_j(I_R)\le\lambda_j+\eta_R$（`spectral.tex:181-185`） | 若 $g_R=\lVert G_R-I_N\rVert_{\mathrm{op}}\ge1$（`spectral.tex:171`），Rayleigh 商比较的分母 $1-g_R$ 无意义 |
| $\eta_R$ | $(e_R+\lVert\Lambda\rVert_{\mathrm{op}}g_R)/(1-g_R)\to0$ | `spectral.tex:174-176` | `spectral.tex:189` 的 $(-\lambda_j-\eta_R)^\gamma$ | 符号写成 $+\eta_R$ 则与 min--max 方向不符，`spectral.tex:189-192` 的不等式链断 |
| $r$ | $r=1/\sigma=(\gamma-1/2)^{-1}>1$ | `introduction.tex:46`；Lean `Model.lean:77` | 极化势 $W=(r+1)\sech^2(rx)$ 与 $\psi=\sech^{1/r}(rx)$ | $\sigma\ge1$ 时 $r\le1$，`spectral.tex:259-267` 的 $\psi''/\psi$ 计算不变但 $\psi\in H^2$ 的指数衰减裕度与 $\gamma>1/2$ 的下界同时失去意义 |
| $r+1$ | 势的幅度 | `spectral.tex:256` | $\psi''/\psi=1-(r+1)\sech^2(rx)$，故 $H_{-W}\psi=-\psi$（`spectral.tex:263-268`） | 幅度改成别的常数则本征值不再是 $-1$，`spectral.tex:276` 的 $\Tr(H_{-W})_-^\gamma\ge1$ 与上界不再互逆 |
| $\int_{\R}W^p$ | $(r+1)^p\mathrm B(1/2,p)/r$ | `spectral.tex:270-272` | $(\int_{\R}W^p)^{-1}=\ell_\sigma$（`spectral.tex:274`） | 换元 $t=rx$、$z=\tanh t$ 的 Jacobian 一变就多 $\pm r$ 因子，最优性论证给出错误常数 |
| $-1$ | 单本征值 $\lambda_1=-1$ | `spectral.tex:276` | 反证常数不可改进 | 若 $\psi$ 不是算子域中的函数（`spectral.tex:266-268` 用指数衰减保证）则本征方程不能逐点代入 |
| $3/16$ | $L_{3/2,1}$ 的已知值 | `introduction.tex:74` | 说明 $\gamma=3/2$ 已被别法解决，本论文只补开区间 | 想把端点 $\gamma=3/2$ 纳入本方法需重做尾部积分，见本表 $\gamma$ 行 |
| $4/(3\sqrt3\pi)$ | $\gamma=1$ 的已知最优常数 | `introduction.tex:108` | 与 Read--Schulz 结果的对照点 | 对应 $\sigma=1/2$ 即 $\beta=0$，`matrix-field.tex:43-44` 特别指出定义本身覆盖 $\beta=0$ 而无需极限约定 |
| Lean `negativeMoment` | 对 $(N,u,k)$ 的 $\text{iSup}$，$N$ 是量词，并非极限 | `Model.lean:46-49` | `MomentBound.lean:73-74` 的矩界、`Main.lean:19` 的三重 `iSup_le` | 若改成无穷和定义则需先证收敛，`MainClaim` 的"无有限谱截断"（`Main.lean:36-38`）无法陈述 |
| Lean `sharpConstant` | $2((\gamma-1/2)/(\gamma+1/2))^{\gamma-1/2}\cdot\Gamma(\gamma+1)/(2\sqrt\pi\,\Gamma(\gamma+3/2))$ | `Model.lean:62-66` | `optimalConstant_le_sharp`（`Main.lean:16-20`）、`sharp_times_extremizer_mass`（`Main.lean:10-14`） | 因子 $2$ 或 `semiclassicalConstant` 的分母错则乘积极值不再是 $1$，`Main.lean:14` 的 `ENNReal.ofReal_one` 闭合失败 |
| Lean `equalityPotential` | $(r+1)(\operatorname{cosh}(rx))^{-2}$，$r=(\gamma-1/2)^{-1}$ | `Model.lean:76-78` | `oneStateConstant_le_optimalConstant`（`Main.lean:30-34`）、`potential_power_integral`（`ExtremizerMass.lean:12-14`） | $r$ 与势幅度 $r+1$ 必须成对改，否则 `ExtremizerMass.lean:39` 用到的 $\tanh^2+\operatorname{sech}^2=1$ 与本征方程不再同时成立 |
| Lean 允许公理 | `propext`、`Quot.sound`、`Classical.choice` | `ComparatorChallenges/LiebThirring.json`；登记三行 `formalization.yaml:1278-1280` | 整个 `OAI.Analysis.LiebThirring` 的检查 | 出现 `sorryAx` 或额外公理即不符合验收；`enable_nanoda false` 表示未借助外部求解器 |
| Lean `actionYoungConstant` | $\sigma^\sigma/(1+\sigma)^{1+\sigma}$ | `ActionBounds.lean:88` | `sigma_holderConjugate`（`ActionBounds.lean:90-92`）把 $1+\sigma$ 与 $1+1/\sigma$ 配成 Hölder 共轭 | 少写一个 $(1+\sigma)$ 幂则与 $A_\sigma$ 不一致，矩界常数与笔头 $\ell_\sigma$ 无法对齐 |

台账的读法是链条，并非清单。$\gamma$ 先经 `introduction.tex:126` 变成 $\sigma$，$\sigma$
在 `matrix-field.tex:23` 再减 $1/2$ 成 $\beta$，于是 $f'$ 的幂 $\beta-1$、$c$ 的分母积分、
尾部阶 $2\beta-2$ 三处同时被同一个 $\beta$ 锁死：这条链上任改一个数，最先断的是
`matrix-field.tex:43` 的 $c$ 有限性与 `matrix-field.tex:97-98` 的可积性，而这两处一断，
$M$ 就不存在，后面的 `rank-one.tex:112`、`rank-one.tex:171`、`connecting-path.tex:49`
全部失去作用对象。另一条链从 $\delta$ 出发：$\delta$ 进入 $\mu$（`matrix-field.tex:151`），
$\mu$ 决定 $d$（`rank-one.tex:96`），$d$ 决定 $\mu'(d)$ 与 $\mathcal P$ 的归一
（`rank-one.tex:113`），归一决定 $\mathcal P(I)=I$（`rank-one.tex:129`），最终决定
`rank-one.tex:219-220` 的 $dm\ge m^{1+1/\sigma}$；次序上 $\delta$ 只能在
`action-limit.tex:63` 之后（即 $\varepsilon\downarrow0$ 之后）才被去掉，因为
$\mathcal P$ 的构造分母含 $d+\delta$（`rank-one.tex:153`），提前令 $\delta=0$ 会让
$h=\tau(1-\tau)/(d+\delta)$ 在 $d=0$ 处爆炸。第三条链在谱侧：$p,q,\sigma$ 三者由
`spectral.tex:9-10` 绑定，$q$ 与 $p$ 的共轭关系同时决定 $2^{1/p}$ 插值
（`spectral.tex:46-49`）、$b_{\eta,W}$（`spectral.tex:52-55`）、$A_\sigma$ 的极大化
（`spectral.tex:117-120`）与 $\sech^2$ 势的 $\int W^p$（`spectral.tex:270-272`），
所以 $p=1+\sigma$ 任改一处就要同时改四处，否则 `spectral.tex:274` 的
$(\int W^p)^{-1}=\ell_\sigma$ 不再给出与上界相同的常数，最优性论证失效。
机器侧的常数链更短也更硬：`Model.lean:62-66` 的两个定义一旦写定，
`Main.lean:10-14` 的乘积等于 $1$ 就把它们钉死，任何与笔头 $\ell_\sigma$ 的偏差都会
在 `ExtremizerMass.lean` 的质量计算里立刻暴露成不等于 `ENNReal.ofReal_one` 的目标。
