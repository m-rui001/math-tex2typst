# D70 SK 自旋玻璃的临界慢化：我把"慢"拆成一个符号持续性检验

对象论文：`Critical slowing down in the Sherrington--Kirkpatrick model`（2026-09-24，OpenAI）。
TeX 源码：`E:\math\preprints\Critical-slowing-down-in-the-Sherrington-Kirkpatrick-model-September-24-2026\build\`，主文件 `paper.tex` 用 `\input` 串起 `sections/introduction.tex`、`model.tex`、`spectral.tex`、`spherical.tex`、`orientation.tex`、`dynamics.tex`，附录 `sections/specification.tex`（`paper.tex:96-103`）。
下文引文行号形如 `spectral:32`，指 `sections/spectral.tex` 第 32 行。
分工一句话：本篇走的是动力学与谱隙一侧（弛豫时间与混合时间的临界标度），`D08-Mezard-Parisi公式.md` 走的是静态自由能公式一侧，此刻另有 agent 在就地加深它，我不读它也不把它的任何结论当输入；本文凡涉及 Parisi 或 1RSB 变分泛函的地方，一律从本篇 tex 自己的陈述出发，不复述那边推导。`D25` 不同线，本文不引。

论文摘要（`paper.tex:93-95`）先把口径钉死：

```tex
At the critical inverse temperature $\beta=1$, we prove slow mixing for zero-field Gaussian Sherrington--Kirkpatrick heat-bath dynamics from typical equilibrium configurations held fixed as initial states. For every deterministic sequence $t_n=o(n^{2/3})$ in rate-one-per-site time, the Gibbs mass of initial states whose time-$t_n$ total-variation distance from equilibrium exceeds $1/4$ tends to one in probability over the disorder.
```

## 0 我进场时手里有什么，以及我先猜了什么

我手里最初只有一个物理直觉：临界点附近关联时间发散，SK 这种平均场系统在半critical 尺度上应当有 $n^{2/3}$ ，并非 $\log n$ 的弛豫时间。这个直觉在我这里被翻译成一个很强的猜想，也是我做这项研究的第一形态：

猜想（我自己写的，论文里没有这句话）：存在一列测试函数 $f_n$，使 $\operatorname{Var}_{\mu}(f_n)/\mathcal D_\mu(f_n)\ge c\,n^{2/3}$ 以高概率成立，于是 Dirichlet 谱隙 $\lambda_1\le (c n^{2/3})^{-1}$，即全谱隙退化。

它听起来只差一步：找一个方向、算两个二次型、比一下。我在草稿纸上按这条路线推了整整一轮，然后撞在三个机械故障上。我把这些故障按撞上的顺序记下来，因为它们决定了最后成型的定理为什么长成现在这个样子（比我最初的猜减弱了一档，但比论文摘要更强的一点是逐初始态）。

故障一：线性方向只控制线性类。取单位向量 $v$ 与 $g(x)=v^Tx$，`model:64-69` 给出

```tex
 \mathcal D_\mu(a^Tx)=\sum_i a_i^2\alpha_i,
 \qquad
 \alpha_i=\mu[\sech^2 g_i],\quad
 g_i(x)=\sum_{j\ne i}W_{ij}x_j.
```

因为 $\operatorname{sech}^2\le1$，$\sum_i v_i^2=1$，立刻有 $\mathcal D_\mu(v^Tx)\le1$（`dyn:54-58` 就是这么写的）。而 $\operatorname{Var}_\mu(v^Tx)=v^T\Sigma v=\mu[(v^Tx)^2]$ 在临界标度上有 $n^{2/3}$ 的量级。两个一夹，逆 Rayleigh 商 $\mathcal R_{\rm lin}(\mu_W)$ 就落到 $n^{2/3}$。到这一步一切都好。问题是 $\mathcal R_{\rm lin}$ 只是对 $a\in\R^n$ 上确界（`intro:63-69`），而真正的谱隙要对 $\Omega_n$ 上所有非常值函数取上确界。论文在 `intro:78-81` 明确把这条断掉：

```tex
Because the quotient here ranges only over linear functions,
its upper bound does not control the full inverse spectral gap.
```

并在 `dyn:548-557` 的 remark 里再钉一次：全 Poincaré 常数不能靠把 `thm:linear-scale` 的函数类放大得到。我最初的猜想要么换成"$\mathcal R_{\rm lin}$ 的临界标度"（弱化一档），要么另找全函数类的工具（本篇只在 $n^{2/3-\epsilon}\le t_{\rm mix}$ 的意义上找到，见 §7）。

故障二：对初始态取平均会把结论抹平。谱隙论证天然是 $L^2(\mu)$ 的，也就是将初始态按 $\mu$ 平均。可平稳性说：把转移律对 Gibbs 初始配置平均，得到的还是 $\mu_W$，距离恒为零。论文在 `intro:51-54` 与 `dyn:149-150` 两处写同一句话：

```tex
The theorem tests each realized start separately: averaging its transition
law over the equilibrium initial configuration would give the stationary
law $\mu_W$.
```

这是第一条真正的转折：可用的量必须逐固定 $x$ 陈述，即 $d_t^{\rm ct}(W,x)$ 这种条件在实现初态上的 TV 距离（`model:96-99`）。我最初的猜想里根本没有"逐初态"这一层，所以我那版陈述在平均意义下是空洞的。

故障三：本性（essential）上界在固定 $n$ 就崩。附录 `spec:38-56` 的 `prop:two-spin` 说明，若把"$\max_x$ 距离 $\le1/4$"要求成对所有 disorder 实现的本性界，$n=2$ 就已经失效：

```tex
For $n=2$ and the discrete uniform-site heat-bath kernel, the mixing time has no finite deterministic essential upper bound over the Gaussian coupling, although it is finite for every realization.
```

机制在 `spec:44-53`：取 $g(x)=x_1+x_2$，$w=W_{12}$，则 $Pg=\theta g$，$\theta=(1+\tanh w)/2$，从 $(1,1)$ 出发 $\|P^k((1,1),\cdot)-\mu\|_{\mathrm{TV}}\ge\tfrac12\theta^k$，$w$ 大时任意固定 $k$ 都超 $1/4$，而每个这样的 Gaussian 尾事件概率为正。这条给我划定了量词的形状：所有概率极限都在原 off-diagonal disorder 上取（`intro:33-35`、`model:101`），只能要"以概率趋于 1"，不能要"几乎必然一致"。

还有第四个故障是我在进入 tex 之前就想错的：我以为临界慢化要从自由能景观的势垒高度（1RSB 那套）推。本篇的静态输入里没有任何 Parisi 型变分泛函出现，出现的是 GOE 特征值、球面倾斜测度的 saddle 函数 $B(a)$（`spherical:21-28`）以及两个 overlap 定律的比较。它的"景观"因此是谱的：ordering direction 是最大特征向量，慢化的来源是它在 Gibbs 测度下几乎不靠近零、而局部更新改它改得慢（`intro:2-7`）。[推测] 我的推测是，走势垒路线会把问题拖进 $\beta=1$ 处尚未被本篇控制的那一侧，而谱路线只需要 edge 标度与一次 Haar 转移。来源登记：本笔记语料的目录全名是 `preprints/Critical-slowing-down-in-the-Sherrington-Kirkpatrick-model-September-24-2026`（本机完整路径在 `E:\math\` 下），队列第 68 行号，§9 台账里 `spectral`、`spherical`、`orient`、`dyn`、`intro`、`model`、`spec` 的全部行号都从该目录的 `build/sections` 数出来。

## 1 三条被排除的路线，以及它们各自停在哪个具体步骤

排除一（谱隙直取）：如上，停在"函数类从线性到全体"那一步，那里没有可比的量。

排除二（先求 $\mu_W$ 的 Poincaré 常数上界，再取补）：这条看起来是正路，实际停在常数与阶的冲突。$L^2$ 谱衰减转成逐初态 TV 需要最小 Gibbs 质量做补偿，论文把它写成 `dyn:500-511`：

```tex
 \max_x d_t^{\mathrm{ct}}(W,x)
 &\le\tfrac12\mu_{\min}^{-1/2}e^{-t/C_n},\label{eq:gap-tv-ct}\\
 \max_x d_k^{\mathrm{dt}}(W,x)
 &\le\tfrac12\mu_{\min}^{-1/2}e^{-k/(nC_n)}.
 \label{eq:gap-tv-dt}
```

$\mu_{\min}^{-1/2}$ 在 $n$ 上是 $e^{O(n)}$ 量级（`dyn:470-476` 给 $\mu_{\min}\ge e^{-(3+\log2)n}$），于是这种转化最多给出 $e^{\epsilon n}$ 型上界，永远给不出 $n^{2/3+o(1)}$ 型上界。所以本篇的上界侧只承诺 subexponential（`prop:subexponential-upper`），precise 指数交给另一篇 companion（`intro:185-194`），而 companion 不在本文范围里。这里我读到一个很实在的取舍：想要多项式上界就得换工具，本篇宁可把下界做硬、上界做稳。

排除三（把 $\mathcal D_{\mu_W}$ 换成梯度型 Dirichlet 形式做算子比较）：单点重采样的形式 $\mathcal D_\mu(f)=\sum_i\mu[(f-P_if)^2]$（`model:56-62`）与全自旋翻转梯度形式不同，而文献里带全梯度形式的对数 Sobolev 结果（如 `intro:168-170` 提到的 Bauerschmidt-Bodineau）不直接落到 heat-bath 时钟上。本篇选的是 heat-bath 版本，并把 clock 显式区分：$\mathcal L=n(P-\mathrm{Id})$（`model:48`），"一个时钟的时间不能读成另一个时钟的尝试次数"。机械后果：连续时间阈值 $n^{2/3}$ 与离散尝试次数阈值 $n^{5/3}$ 只差一个因子 $n$，这不是巧合，是同一个量在两个时钟下的两种读法。

## 2 转折点之后的最终思路，和我最初设想的差别

`intro:196-215` 的 "How the proof works" 我读了三遍，因为它把上面那些故障的解药一次给完。原文：

```tex
Following the augmentation used by Comets \cite[Equation~(1.1)]{comets1996},
add an independent Gaussian diagonal to the coupling matrix. Its energy
is constant on the cube, so the Gibbs law and both chains stay the same,
while the augmented matrix is GOE. Let $v$ be a unit top eigenvector of
that matrix. The main static input is
\[
 \mu_W\{|v^Tx|\le b_n n^{1/3}\}\longrightarrow0
 \quad\text{in probability for every positive deterministic }b_n\to0.
\]
```

转折一，免费的 GOE。原本 $W$ 只有 off-diagonal（`intro:13` 的 $W_{ij}\sim N(0,1/n)$，$i<j$），加上独立对角之后变成完整 GOE，而 $x_i^2=1$ 使对角项对每个构型贡献同一个 $\tfrac12\sum_iW_{ii}$，在 Gibbs 归一化里完全抵消（`model:28-32`）。协方差、heat-bath 核、混合时间都只依赖原 off-diagonal disorder；只有测试方向 $v$ 允许依赖对角。`model:32-36` 那句话是整篇的设计核心：在逐实现初态的证明里先用这个方向去检验一个内蕴的 TV 距离，然后再把对角积掉。这样就不必为所有初态同时挑一个方向。

转折二，"慢"被写成符号持续性。静态输入给 $|v^Tx|$ 在 $n^{1/3}$ 尺度上 rarely 小，形式上就是上面那行；平稳增量给 $g(X_t)$ 的均方改变 $\le 2t$（连续）与 $\le 2k/n$（离散）（`lem:stationary-increments`）。当 $t\ll a_n^2=b_n^2n^{2/3}$ 时，两端点投影同号；同号定义一个半空间，而自旋翻转对称性给它的 Gibbs 质量 $\le1/2$，于是它是合格的 TV 检验（`dyn:103-122`）。我最初设想的"找一个函数让方差/Dirichlet 比很大"在这里变成"找一个集合，让链在短时间内出不去它的半空间"。前者是能量型的、只能在 $L^2(\mu)$ 平均意义说话；后者是分布型的、能逐 $x$ 说话。这就是我最终写的定理比进场时的猜想"弱一档、强一档"的原因：弱一档在不再声明全谱隙，只声明 $d_t>1/4$ 的 Gibbs 质量趋于 1；强一档在它是逐实现初态的陈述，比平均化后的谱隙陈述更难。

于是主定理（`intro:37-49`）：

```tex
\begin{theorem}[Realized equilibrium initial states]\label{thm:gibbs-start}
For every deterministic sequence $t_n\ge0$ with $t_n=o(n^{2/3})$,
\[
 \mu_W\{x:d_{t_n}^{\rm ct}(W,x)>1/4\}
 \xrightarrow{\Prob}1.
\]
For every deterministic integer sequence $k_n\ge0$ with $k_n=o(n^{5/3})$,
\[
 \mu_W\{x:d_{k_n}^{\rm dt}(W,x)>1/4\}
 \xrightarrow{\Prob}1.
\]
The convergence is in probability over the disorder.
\end{theorem}
```

配套的静态定理（`intro:71-76`）：

```tex
\begin{theorem}[Covariance and linear tests]\label{thm:linear-scale}
For every positive deterministic sequence $M_n\to\infty$, with probability tending to one both $\|\Sigma\|$ and $\mathcal R_{\rm lin}(\mu_W)$ belong to
\[
 \left[\frac{n^{2/3}}{M_n},\ M_n n^{2/3}\right].
\]
\end{theorem}
```

混合时间版本（`intro:89-99`）：

```tex
\begin{theorem}[Critical mixing bounds]\label{thm:mixing}
For every fixed $\epsilon>0$,
\begin{align}
 \Prob\!\left\{n^{2/3-\epsilon}\le t_{\rm mix}
                   \le e^{\epsilon n}\right\}&\longrightarrow1,
       \label{eq:continuous-main}\\
 \Prob\!\left\{n^{5/3-\epsilon}\le k_{\rm mix}
                   \le e^{\epsilon n}\right\}&\longrightarrow1.
       \label{eq:discrete-main}
\end{align}
\end{theorem}
```

注意 $M_n$ 与 $\epsilon$ 的分工：`intro:78` 说 $M_n$ 可以比任何指定的幂或对数发散得都慢，这是"自然标度"式的紧量化；而 $n^{2/3-\epsilon}$ 只丢一个固定 $\epsilon$。这两个强度差是刻意留的，`spectral:8-10` 交代了原因：

```tex
A fixed logarithmic enlargement
would lose the strongest quantifiers of the main theorems, so the
enlargement below may diverge as slowly as needed.
```

也就是：谱的好事件上边缘扩大因子 $L_n$ 必须允许任意慢发散，否则 `thm:linear-scale` 与 `thm:gibbs-start` 那种"对每个发散阈值都成立"的量词拿不到。这条约束在后面 §4 到 §6 里以三种具体形式反复出现（`orient:505-538` 的 keep $L_n$ free until the tail threshold is specified、`orient:455-460` 的 choose $L_n$ after $b_n$、`spherical:491-497`）。

## 3 静态骨架：模型、两个时钟与 heat-bath 形式

先把 `model.tex` 的记号定死，否则后面每个常数都要重推。$H_W(x)=\tfrac12x^TWx$，$\mu_W(x)\propto e^{H_W(x)}$，GOE 归一化为 $W_{ij}\sim N(0,1/n)$（$i<j$）、$W_{ii}\sim N(0,2/n)$（`model:16-27`）。$P_i$ 是对 $x_{-i}$ 的条件期望，$\mathcal L=\sum_i(P_i-\mathrm{Id})$，$P=\frac1n\sum_iP_i$（`model:39-46`）。

`lem:heatbath-form`（`model:54-69`）是动力学侧唯一的算子输入，我按四段来批。

(a) 逐字引用：

```tex
\begin{lemma}[Heat-bath forms]\label{lem:heatbath-form}
Each $P_i$ is an orthogonal projection in $L^2(\mu)$. The unscaled Dirichlet form is
\begin{align}
 \mathcal D_\mu(f)
 &=-\langle f,\mathcal Lf\rangle_\mu
   =\sum_i\mu[(f-P_if)^2]  \label{eq:heatbath-form}\\
 &=\sum_i\inf_{h_i:\{-1,1\}^{n-1}\to\R}
       \mu[(f-h_i(x_{-i}))^2].\nonumber
\end{align}
The discrete form is $\langle f,(\mathrm{Id}-P)f\rangle_\mu=\mathcal D_\mu(f)/n$, and $P$ has spectrum in $[0,1]$. For a linear function,
\begin{equation}\label{eq:linear-form}
 \mathcal D_\mu(a^Tx)=\sum_i a_i^2\alpha_i,
 \qquad
 \alpha_i=\mu[\sech^2 g_i],\quad
 g_i(x)=\sum_{j\ne i}W_{ij}x_j.
\end{equation}
\end{lemma}
```

(b) 补完推导。$P_i$ 作为"$L^2(\mu)$ 到只依赖 $x_{-i}$ 的子空间"上的条件期望，自伴（$\mu[fP_ig]=\mu[P_if\,P_ig]$）且幂等（$P_i^2=P_i$），故是正交投影。正交投影给出 $\|f\|^2=\|P_if\|^2+\|f-P_if\|^2$，于是 $\langle f,(\mathrm{Id}-P_i)f\rangle=\mu[(f-P_if)^2]$；对 $i$ 求和得 $\langle f,\mathcal Lf\rangle=-\sum_i\mu[(f-P_if)^2]$，对 $i$ 取平均得 $\langle f,(\mathrm{Id}-P)f\rangle=\mathcal D_\mu(f)/n$。投影的第二个性质的等价表述就是 $\|f-P_if\|_{L^2(\mu)}^2=\inf_{h_i}\mu[(f-h_i(x_{-i}))^2]$，这条在 `dyn:417-434` 的 `lem:density-comparison` 里被单独重推一次，因为换测度时要用 infimum 形式，并非核形式。线性函数的 $\alpha_i$：固定 $x_{-i}$ 后 $g_i$ 是常数，条件律是 $\mathbb P(x_i=1\mid x_{-i})=(1+\tanh g_i)/2$，条件均值 $\tanh g_i$、条件方差 $1-\tanh^2g_i=\operatorname{sech}^2g_i$；$\mathcal D_\mu(a^Tx)$ 的第 $i$ 项是 $a_i^2$ 乘条件方差，得 `model:64-69`。$P$ 谱在 $[0,1]$ 由 $0\le\langle f,Pf\rangle\le\langle f,f\rangle$（`model:77-79`）。

(c) 为什么每项是这个值。$\mathcal D$ 定义为"未缩放"的和式（$\sum_i$ ，并非 $\frac1n\sum_i$）有两个消费点：`intro:60-62` 明说这是 rate-one-per-site 时钟的形式，因此 $e^{t\mathcal L}$ 的谱衰减率直接是 $1/\mathcal D$ 的倒数（`dyn:488-490`：连续时间 gap $\ge1/C_n$，离散 $\ge1/(nC_n)$）；而 `lem:stationary-increments` 的两个右端 $2t$ 与 $2k/n$ 的差别恰好来自这一个 $n$（`dyn:49-52`）。$\operatorname{sech}^2g_i\le1$ 的用处是 $\mathcal D_\mu(v^Tx)\le1$，即"局部更新改得慢"这一侧；$\operatorname{sech}^2g_i>0$ 严格正是"$P_i$ 的每个条件概率为正、两链不可约、离散链非周期"（`model:50-52`）的根据，混合时间才定义为有限。

(d) 候选失败路线。其一，改用 Metropolis 核：$P_i$ 不再是条件期望，正交投影这一步直接失效，$\mathcal D$ 变成带 acceptance 权重的形式，$\alpha_i=\mu[\operatorname{sech}^2g_i]$ 会被换成一个不对称量，`dyn:54-58` 的 $\mathcal D\le1$ 是否仍成立需要重证。[推测] 我判断仍然有界，但整条"符号持续"证明要重写。其二，试图把 $\mathcal D_\mu(a^Tx)$ 与 $\operatorname{Var}$ 用矩阵不等式 $\Sigma\preceq C\,\mathrm{diag}(\alpha_i)$ 比：这在 $n^{13/25}$ 那一节（`dyn:311-342`）被显式绕开，因为 $\alpha_i^{-1}$ 可以对少数站点爆炸，逐点比较会丢 $n$ 的幂，论文改用分块 + 正定性控制交叉块。其三，用 $P$ 的谱隙代替 $\mathcal L$ 的：`model:48` 那句 $\mathcal L=n(P-\mathrm{Id})$ 说明两者只差 $n$，但 `model:101` 强调不许把"一个时钟的时间读成另一个的尝试次数"，[推测] 因为离散链可停留（$\mathrm{Id}$ 分量非零），把 $k$ 当 $t$ 用会把阈值 $n^{5/3}$ 错当成 $n^{2/3}$，与 `thm:gibbs-start` 的两行结论直接冲突。

`model.tex` 结尾的静态恒等式（`model:104-114`）把 overlap 与协方差接上：零场给 $\mu(x)=\mu(-x)$，故 $\mu[x]=0$、$\Sigma=\mu[xx^T]$、$\Sigma_{ii}=1$，两个独立样本展开平方得

```tex
 \Tr\Sigma^2=n^2\E_{\mu\otimes\mu}q^2.
 \label{eq:overlap-covariance}
```

这个等式是后来 `cor:covariance-scale`（`orient:571-610`）上半界的全部来源：$\|\Sigma\|^2\le\operatorname{Tr}\Sigma^2$（半正定）把谱范数换成 trace 的平方，而后者是 overlap 二阶矩。我进场时把这条看成"平凡展开"，读到 §6 才意识到它承担了上界一侧全部工作量，而 $n^2$ 这个因子决定了为什么 overlap 的 $n^{-2/3}$ 标度正好对应 $\|\Sigma\|$ 的 $n^{2/3}$。

## 4 spectral：三级台阶与一整套标度选择

`sec:spectral` 的任务只有一句（`spectral:4-7`）：在只依赖特征值的事件上控制前导特征值与两个预解式 trace，位置在 GOE 边缘上方 $s_0=L_nn^{-2/3}$。结构分三步（`spectral:12-15`）：tridiagonalization 隔离独立噪声；一个同时的二次型估计把噪声与确定性约束能比；Hermite 恒等式算出确定性预解式。

标度表（`spectral:18-30`，逐字）：

```tex
Let $L_n\to\infty$ be any positive deterministic sequence with $L_n\le\log n$ for
all sufficiently large $n$, and set
\begin{equation}
 s_*=n^{-2/3},\qquad s_0=L_ns_*,\qquad
 h_n=L_n^{1/8},\qquad
 A_n=h_n+\sqrt{\log(2+L_n)},\qquad
 \eta_n=A_nL_n^{-3/4}.
 \label{eq:spectral-scales}
\end{equation}
In particular, $\eta_n\to0$.  Define
\[
 R(s)=\frac{2+s-\sqrt{s(4+s)}}2,\qquad s>0.
\]
```

我先解释每个符号为什么是这个阶，否则 §5、§6 里出现 $L_n^2b_n$、$L_n^4$、$L_n^{-3/2}$ 时无法判断松紧。

$s_*=n^{-2/3}$ 是 GOE 硬边（soft edge）的自然间距：最大特征值到 $2$ 的典型距离，也是 $R(s)=1-\sqrt s+O(s)$（`spherical:442`）里 $\sqrt s$ 变成 $n^{-1/3}$ 的来源。$s_0=L_ns_*$ 是把这一间距扩大一个可任意慢的发散因子，目的是让后面所有"误差 $\le$ 常数乘 $s_0$ 的某次幂"的估计都能被吸进主项。$A_n$ 与 $\eta_n$ 是同一个量的两种用法：$A_n$ 出现在 $\Phi_n$ 的前置因子，$\eta_n$ 是它的归一化后大小。机械核对：$\Phi_n$ 的导数上界是 $Cn^{-1/2}A_ns_0^{-3/4}$（`spectral:362`），把 $s_0^{-3/4}=L_n^{-3/4}n^{1/2}$ 代入正好得 $A_nL_n^{-3/4}=\eta_n$。也就是说 $\eta_n$ 的定义完全是解出来的，唯一自由度是 $h_n$。

$h_n=L_n^{1/8}$ 承担双向拉扯。要求一：事件概率损失是 $Ce^{-c'h_n^2}=Ce^{-c'L_n^{1/4}}$（`spectral:274`），故 $h_n\to\infty$。要求二：$\eta_n=(h_n+\sqrt{\log(2+L_n)})L_n^{-3/4}\to0$，故 $h_n\le o(L_n^{3/4})$。$1/8$ 在这两个约束里都很宽，选它是为了让失败概率的指数 $L_n^{1/4}$ 尽量大同时不威胁 $\eta_n\to0$。我最初以为可以把 $h_n$ 取成 $\log L_n$ 之类更小的东西以省出余量，算了之后发现那只会让失败概率变差而没有任何收益，两处都用不到额外余量。

$R(s)=\frac{2+s-\sqrt{s(4+s)}}2$ 来自半圆的 Stieltjes 方程 $R^2-(2+s)R+1=0$ 的小根（`spectral:418-421` 的两个根是 $R(s)$ 与 $R_+(s)$，大根在 $s\to\infty$ 时发散，所以必须选小根；`spectral:442` 用到 $R(s)=1-\sqrt s+O(s)$，这直接决定 §5 里 saddle 的位置和 $\sum_i h_i=n(1-\sqrt{s_0}+o(\sqrt{s_0}))$）。

### 4.1 prop:spectral

(a) 逐字（`spectral:32-61`）：

```tex
\begin{proposition}[An eigenvalue-only good event]
\label{prop:spectral}
Let $W$ have the GOE normalization of Section~\ref{sec:model}, and write its
eigenvalues as $\lambda_1\ge\cdots\ge\lambda_n$.  There are events
$\mathcal G_n(L_n)$, measurable with respect to these eigenvalues alone,
such that
\[
 \Prob\bigl(\mathcal G_n(L_n)^c\bigr)
 \le C\exp(-cL_n^{1/4})
\]
for all sufficiently large $n$.  On the same events, for every fixed
$M<\infty$,
\begin{equation}
\begin{aligned}
 &\lambda_j=2+o(s_0)\quad(1\le j\le3),
 &&\max_i|\lambda_i|\le3,\\
 &\frac1n\sum_{i=1}^n\frac1{2+s-\lambda_i}
     =R(s)+o(\sqrt s),
 &&\frac1n\sum_{i=1}^n\frac1{(2+s-\lambda_i)^2}
     \le\frac{C_M}{\sqrt s}
 \quad(s_0\le s\le M).
\end{aligned}
\label{eq:spectral-estimates}
\end{equation}
All denominators in these formulas are positive.  The little-oh terms have
deterministic bounds, uniformly over the event: the first three eigenvalue
errors divided by $s_0$ are at most $C(L_n^{-1}+\eta_n)$, and the first
resolvent error divided by $\sqrt s$ is at most
$C_M(L_n^{-3/2}+\eta_n)$.  The event does not depend on $M$.
\end{proposition}
```

(b) 中间步骤。四条结论的来源分三条链。第一条链，$|\lambda_i-e_i|\le\Phi_n(e_i)$（`spectral:482-485`）由 min-max 得到，$\mathcal G_n$ 就定义成这条不等式成立的事件（`spectral:489-491`），从而只依赖有序特征值；$e_i$ 是 $E=2I-D$ 的特征值，$D$ 是 off-diagonal 为 $c_i=\sqrt{1-i/n}$ 的确定性三对角矩阵（`spectral:168-173`）。第二条链，$\lambda_j=2+o(s_0)$（$j\le3$）：取 $m=\lfloor n^{1/3}\rfloor$，用 $\{1,\ldots,m\}$ 上前三个 Dirichlet 正弦模张成测试子空间并在段外补零（`spectral:499-501`）。该段上 Dirichlet Laplacian 的特征值是 $4\sin^2(k\pi/[2(m+1)])$，故子空间上二次型 $\le C/m^2$；$E$ 与 Laplacian 在段上的形式差绝对值至多 $2\max_{i<m}|1-c_i|\sum_{i<m}|u_iu_{i+1}|\le Cm/n$（`spectral:503-508`）。min-max 给 $0\le e_1,e_2,e_3\le C(m^{-2}+m/n)$。这里 $m$ 的选取是纯粹的平衡：$m^{-2}$ 与 $m/n$ 相等时 $m^3=n$，即 $m=n^{1/3}$，值 $Cn^{-2/3}=Cs_*$。再用 $\Phi_n(e_3)\le\Phi_n(Cs_*)$ 与 `eq:phi-smallness` 得 $\max_{j\le3}|\lambda_j-2|/s_0\le C(L_n^{-1}+\eta_n)$（`spectral:512-516`）：$L_n^{-1}$ 来自 $\Phi_n\propto(e+s_0)^{1/4}\ge s_0^{1/4}$ 与 $s_0=L_ns_*$ 之比里剩下的 $s_*/s_0=L_n^{-1}$，$\eta_n$ 是 $A_n$ 那个前置因子。第三条链，两个 trace：先由 $\Phi_n(e)/(s+e)\le C\eta_n$（`spectral:524-529`）得 $2+s-\lambda_i=(s+e_i)(1+O(\eta_n))$，一致于 $i$ 与 $s\ge s_0$，于是二 trace 由 $T_D(s)$ 控制；一 trace 逐项相减并用 $(e_i+s_0)^{1/4}\le(s+e_i)^{1/4}$ 得（`spectral:538-543`）

```tex
 &\left|\frac1n\sum_i\frac1{2+s-\lambda_i}-R_D(s)\right|\notag\\
 &\qquad\le Cn^{-1/2}A_n\frac1n\sum_i
 (s+e_i)^{-7/4}\sqrt{1+\log(1+e_i/s_0)}.
```

然后按 dyadic shell 求和：$e_i\le s$ 贡献 $Cs^{-7/4}\frac{N(s)}n\sqrt{1+\log(1+s/s_0)}\le Cs^{-1/4}\sqrt{\cdot}$，shell $2^ks<e_i\le2^{k+1}s$ 贡献 $Cs^{-1/4}2^{-k/4}\sqrt{1+\log(1+s/s_0)+(k+1)\log2}$（`spectral:545-555`），几何级数带 $\sqrt k$ 因子收敛，总和 $C_Ms^{-1/4}\sqrt{1+\log(1+s/s_0)}$。除以 $\sqrt s$ 并写 $r=s/s_0$ 得 $C_M\eta_nr^{-3/4}\sqrt{1+\log(1+r)}\le C_M\eta_n$（`spectral:562-567`）。最后确定性部分 $|R_D(s)-R(s)|/\sqrt s\le C_M/(ns^{3/2})\le C_ML_n^{-3/2}$（`spectral:568-572`，用 $ns_0^{3/2}=L_n^{3/2}$）。两个误差项 $L_n^{-3/2}$ 与 $\eta_n$ 就是这样出现的。

(c) 每个假设与常数的机械理由。"$M<\infty$ 任意固定"：一 trace 的误差常数 $C_M$ 依赖上端点，因为 $-R'(s)\le1/(2\sqrt s)$ 型比较只在 $s$ 有界时给出统一系数；而"事件不依赖 $M$"（`spectral:60`）是 §5、§6 能把 $L_n$ 留到最后的先决条件：$\mathcal G_n$ 定义里只含 $e_i$ 与 $\Phi_n$，不含任何 $M$，所以后续选 $L_n$ 时不必回头重新定义事件。"$\max_i|\lambda_i|\le3$"：这条看着粗，但 §5 的 `lem:partition-bounds` 与 `lem:spherical-identity` 都要 $\max|\lambda_i|\le3$ 来给 $1+a\lambda_n\le z_a\le1+a\lambda_1$ 和 $k_i\ge1/13$（$1+2\cdot3=7$，取 13 是把 $a\le2$ 时 $1+a(\lambda_1-\lambda_n)\le1+12=13$ 用满）。证明由 $e_i\in[0,4]$ 与 $\max|\lambda_i|\le2+\Phi_n(4)$ 得到，而 $\Phi_n(4)=o(1)$ 需要 $L_n\le\log n$（`spectral:517-519`）：$\Phi_n(4)=C_0n^{-1/2}A_n(4+s_0)^{1/4}\sqrt{1+\log(1+4/s_0)}$，对数项 $\le C\sqrt{\log n}$，故需 $A_n\sqrt{\log n}=o(\sqrt n)$；$L_n\le\log n$ 给出 $A_n\le C\sqrt{\log\log n}$，绰绰有余。为什么把约束写成 $L_n\le\log n$ ，并非 $L_n\le n^{1/10}$：因为 §6 的 $s_0/q_0^2=L_nn^{-1/12}\to0$（`orient:158`）只要求 $L_n$ 是 $n$ 的任意慢次幂以内，$\log n$ 已经够用，而它同时保证失败概率 $e^{-cL_n^{1/4}}$ 求和可控。[推测] 我的推测是 $\log n$ 只是取一个既超过所有需要的下界选择（$\min\{\log n,b_n^{-1/4}\}$、$\min\{\log n,T_n^{1/8}\}$）又不必重新检查 $\Phi_n(4)=o(1)$ 的安全上界。

(d) 三条候选失败路线。其一，用算子单调性做 $\lambda_i$ 与 $e_i$ 的比较：论文在 `spectral:486-487` 特意声明这一步用的是 Rayleigh 商的标量单调性，"does not require an operator-monotonicity assertion"。我试过写算子单调版本，停在 $(s+A)^{-1}$ 对算子序反单调这一条在 $2+s-\lambda_i$ 与 $s+e_i$ 之间不能直接引用，因为 $T$ 与 $E$ 不交换；标量 min-max 路线绕开了这个交换性问题。其二，只用最大特征值 $\lambda_1$：§5 的删除一步（`spherical:478-482`）说明删去任意一个 Gaussian 坐标后至少要剩两个大方差坐标，故需要 $k_j\ge c/s_0$ 对 $j\le3$ 成立，进而需要 $e_1,e_2,e_3$ 三条都定位。只有一条时，删除 $i=1$ 后残差密度 $\sup p_{-1}\le Cs_0$ 变成不可用，`prop:spherical-small-ball` 的 $CL_n^2b$ 就没了根据。其三，把失败概率 $e^{-cL_n^{1/4}}$ 想加强成 $n$ 的幂次：`spectral:271-274` 的和式只在 $h_n^2=L_n^{1/4}$ 上给指数，$L_n$ 可任意慢发散时这个指数本身就任意慢，不可能给出 $n^{-A}$；这条对 §6 无影响，因为那里只用 $\mathbb P(\mathcal G_n^c)\to0$（`orient:435`、`orient:548`）。

### 4.2 三对角化与 chi 噪声

`lem:tridiagonal`（`spectral:69-80`）逐字：

```tex
\begin{lemma}[Tridiagonal representation]
\label{lem:tridiagonal}
The eigenvalues of $W$ have the same law as those of a symmetric
tridiagonal matrix $T$ whose entries
\[
 T_{ii}\sim N(0,2/n),\qquad
 T_{i,i+1}=T_{i+1,i}\sim\frac{\chi_{n-i}}{\sqrt n}
 \quad(1\le i<n)
\]
are independent.  Here $\chi_m$ is the Euclidean norm of $m$ independent
standard normal variables.
\end{lemma}
```

推导我按论文的暴露顺序补完：第一步，$W$ 的第一行/列分成三块（对角元、下面 $n-1$ 个 $N(0,1/n)$ 元、右下 $(n-1)\times(n-1)$ 块），三者独立，因为 GOE 密度 $\propto e^{-n\operatorname{Tr} W^2/4}$ 按坐标分解。第二步，在尾坐标里选一个正交变换把那个 $(n-1)$ 向量送到它的非负长度乘第一个基向量，共轭后 off-diagonal 的第一元就是 $\chi_{n-1}/\sqrt n$，而尾块的密度在共轭下不变（密度与体积都正交不变），并且给定那个列向量时变换是固定的，所以共轭后的尾块仍是同一 GOE 密度，且条件律与列向量无关，故与已暴露的所有元独立。第三步，在尾块内递归，第 $i$ 步的新列有 $n-i$ 个独立 $N(0,1/n)$ 元，得 $\chi_{n-i}/\sqrt n$。共轭保特征值。

为什么 off-diagonal 是 $\chi_{n-i}$ ，并非别的幂：它是被 Householder 式变换"吸"进一个坐标的那 $n-i$ 个高斯向量的长度，维度直接决定阶。为什么中心化的 chi 仍然给维数无关的指数估计（`spectral:106-111`）：

```tex
 \E\exp\left(t\frac{\chi_m-\E\chi_m}{\sqrt n}\right)
 \le \exp(Ct^2/n),\qquad
 0\le\sqrt m-\E\chi_m\le\frac C{\sqrt m}.
```

链条在 `spectral:113-152`：$\chi_m^2$ 的 MGF 加 Chernoff 给 $\mathbb P\{\chi_m^2\ge ma\}\le(ae^{1-a})^{m/2}$（$a>1$，$0<a<1$ 时下尾同式），配 $a-1-\log a\ge(\sqrt a-1)^2$ 得 $\mathbb P\{|\chi_m-\sqrt m|\ge r\}\le2e^{-r^2/2}$；由此 $\operatorname{Var}(\chi_m)\le C$ 与 Jensen 得 $\sqrt m-\mathbb E\chi_m=\operatorname{Var}(\chi_m)/(\sqrt m+\mathbb E\chi_m)\le C/\sqrt m$。要"没有额外前置因子"的居中指数界，取 $Z=X-X'$（两独立副本之差），$Z$ 对称，$\mathbb P\{|Z|\ge r\}\le4e^{-r^2/8}$，积分尾得 $\mathbb E Z^{2k}\le4\cdot8^kk!$；条件 Jensen 加 $\cosh$ 幂级数得 $\mathbb E e^{t(X-\mathbb E X)}\le\mathbb E\cosh(tZ)\le1+4\sum_{k\ge1}\frac{8^kk!t^{2k}}{(2k)!}\le1+4(e^{8t^2}-1)\le e^{32t^2}$，用了 $(2k)!\ge(k!)^2$ 与 $(1+u)^4\ge1+4u$。$t$ 换成 $t/\sqrt n$ 就是 `eq:chi-entry-bounds`。

这一段我卡过：$\sqrt m-\mathbb E\chi_m\ge0$ 是凹性（Jensen 给 $\mathbb E\chi_m\le\sqrt m$），论文在 `spectral:109` 把它写成下界非负，我一开始以为是排版问题，后来明白 $\chi_m$ 是长度（凹函数 of the vector? 实际是 $\sqrt m$ 减均值），符号方向由 $\operatorname{Var}/(\sqrt m+\mathbb E\chi_m)$ 的推导固定。[推测] 这条只是我的读数怀疑，不影响后续使用。

### 4.3 lem:form-bound：一个噪声事件服务所有能量

(a) 逐字（`spectral:175-196`）：

```tex
\begin{lemma}[Noise controlled by deterministic energy]
\label{lem:form-bound}
There is a universal constant $C_0$ such that, with
\[
 \Phi_n(x)=C_0n^{-1/2}A_n(x+s_0)^{1/4}
             \sqrt{1+\log(1+x/s_0)},\qquad x\ge0,
\]
the matrix $H=T-D$ satisfies, simultaneously for every unit vector
$u\in\R^n$,
\begin{equation}
 |u^THu|\le\Phi_n(u^TEu)
 \label{eq:form-bound}
\end{equation}
on an event $\mathcal F_n$ with
$\Prob(\mathcal F_n^c)\le C\exp(-cL_n^{1/4})$ for all sufficiently large $n$.
Moreover,
\begin{equation}
 \sup_{x\ge0}|\Phi_n'(x)|\le C\eta_n,
 \qquad \Phi_n(0)\le C\eta_ns_0.
 \label{eq:phi-smallness}
\end{equation}
\end{lemma}
```

(b) 三步推导。第一步，确定性能量给空间质量与梯度：$e=u^TEu=\sum_{i<n}c_i(u_i-u_{i+1})^2+\sum_i(2-c_i-c_{i-1})u_i^2$（`spectral:205-209`）。系数下界 $2-c_i-c_{i-1}\ge i/(2n)$ 由 $1-\sqrt{1-t}\ge t/2$ 与边界直接验证；又 $c_i\ge1/\sqrt2$（$i\le n/2$）。于是 $\sum_i\frac inu_i^2\le2e$ 以及 $\sum_{i>n/2}u_i^2+\sum_{i<n}(u_i-u_{i+1})^2\le Ce$（`spectral:215-219`）。$D$ 的 row sum 至多 2，故 $0\le E\le4I$，这就是后面 $e\le4$ 的出处。第二步，为每个能量尺度准备块：$\sigma_j=2^js_*$，$0\le j\le J_n=\lceil\log_2(4/s_*)\rceil$，$d_j=\max\{1,\lfloor\sigma_j^{-1/2}\rfloor\}$；把对角元序列与居中 off-diagonal 序列各分成长度在 $[d_j,2d_j]$ 的连续块（末块短就并入前块），按块首指标贴标签：$\le2n\sigma_j$ 记 $r=0$，否则 $(2^rn\sigma_j,2^{r+1}n\sigma_j]$ 记 $r\ge1$。居中偏和的最大值用非负上鞅 $\exp(tS_k-Ckt^2/n)$ 停在首次越过 $a$，优化 $t$ 得 $\mathbb P\{\max_{k\le m}|S_k|\ge a\}\le2\exp(-na^2/(Cd_j))$。固定 $(j,r)$ 的块数至多 $C(1+2^rn\sigma_j/d_j)\le C2^rn\sigma_j^{3/2}=C2^{r+3j/2}$（用 $d_j\ge\sigma_j^{-1/2}/2$ 或 $d_j=1$，并且 $n\sigma_j^{3/2}\ge1$ 吸收加性常数）。取充分大的固定 $K$，联合估计给：所有块的所有居中偏和 $\le K\sqrt{d_j/n}(h_n+\sqrt{j+r})$（`spectral:264-267`），失败概率 $\le C\sum_{j,r\ge0}2^{r+3j/2}e^{-cK^2(h_n+\sqrt{j+r})^2}\le Ce^{-c'h_n^2}$（`spectral:270-275`），$K$ 大到让 $j,r$ 两个方向的因子构成可和几何级数。第三步，sum-by-parts：固定噪声事件后取任意单位向量，选第一个使 $e\le\sigma_j$ 的 $j$，则 $\sigma_j\le2(e+s_*)$。对权 $w_i=u_i^2$ 或 $u_iu_{i+1}$，标签 $r$ 的块上 $\sum|w_i|\le C2^{-r}$（$r\ge1$ 时坐标都在 $2^rn\sigma_j$ 之后，`eq:energy-tail-gradient` 给总平方质量 $\le2e/(2^r\sigma_j)\le2^{1-r}$；$r=0$ 用单位范数），块内权的变化总量 $\le C2^{-r/2}\sqrt e$（用 $u_{i+1}^2-u_i^2=(u_{i+1}-u_i)(u_{i+1}+u_i)$ 与 $u_{i+1}u_{i+2}-u_iu_{i+1}=u_{i+1}[(u_{i+2}-u_{i+1})+(u_{i+1}-u_i)]$，配 Cauchy-Schwarz 与梯度总量）。逐块求和（`spectral:311-320`）：若块内偏和界为 $B$、块均值 $\bar\xi$ 则 $|\bar\xi|\le B/d_j$，去均值后偏和 $\le2B$ 且在块末归零，于是

```tex
 \left|\sum_{i\text{ in block}}\xi_iw_i\right|
 \le\frac B{d_j}\sum_{i\text{ in block}}|w_i|
      +2B\sum_{\substack{i,i+1\text{ in block}}}|w_{i+1}-w_i|.
```

代 $B=K\sqrt{d_j/n}(h_n+\sqrt{j+r})$ 并对 $r$ 求和得 $Cn^{-1/2}\sum_{r\ge0}(h_n+\sqrt{j+r})(d_j^{-1/2}2^{-r}+d_j^{1/2}2^{-r/2}\sqrt e)\le C(h_n+\sqrt j)n^{-1/2}\sigma_j^{1/4}$（`spectral:323-327`）。剩下确定性误差：$\mathbb E\chi_{n-i}/\sqrt n$ 与 $c_i$ 的差 $\le C/(\sqrt n\sqrt{n-i})$，故 $i\le n/2$ 时 $\le C/n$、其后 $\le C/\sqrt n$，二次型贡献 $\le C/n+Ce/\sqrt n$（`spectral:335-343`）。最后 $j\le C\log(2+e/s_*)\le C[\log(2+L_n)+\log(1+e/s_0)]$（`spectral:345-348`）把 $\sqrt j$ 换成 $A_n$ 里的两项，$\sigma_j\le2(e+s_*)$ 与 $s_*\le s_0$ 把 $\sigma_j^{1/4}$ 换成 $(e+s_0)^{1/4}$，得 `eq:form-bound`；两个序列与 off-diagonal 的因子 2 都由 $C_0$ 一次吸收。

(c) $\Phi_n$ 的形状逐个解释。$(x+s_0)^{1/4}$：块估计给 $\sigma_j^{1/4}$，而 $\sigma_j\asymp e+s_*$，故是"能量的四分之一次幂"，这个 $1/4$ 是 $\sqrt{d_j}\cdot d_j^{-1/2}\cdot d_j^{1/2}$ 这些幂合起来的产物（$d_j\asymp\sigma_j^{-1/2}$，两项分别是 $\sigma_j^{1/4}$ 与 $\sigma_j^{-1/4}\sqrt e$，后者被 $e\le\sigma_j$ 吸进前者）。$\sqrt{1+\log(1+x/s_0)}$：来自 $\sqrt j$ 与 $j\le C\log(2+e/s_*)$。前置 $n^{-1/2}A_n$：块偏和的天然尺度 $\sqrt{d_j/n}$。$s_0$ 的加入：$e=0$ 时能量不控制任何东西，$s_0$ 项给出 $\Phi_n(0)=C_0\eta_ns_0$，保证 $\Phi_n$ 在原点正且 `eq:phi-smallness` 的导数界让 $\Phi_n$ 单调（`spectral:476` 说两个 $f_\pm$ 递增靠的就是 $\sup|\Phi_n'|\le C\eta_n<1$）。$\Phi_n'$ 的显式形式在 `spectral:357-360`，用 $y^{-3/4}\sqrt{1+\log y}$ 在 $y\ge1$ 有界。

(d) 候选失败路线。其一，把 $\Phi_n$ 换成单一指数型 $Ce^{-cn^\alpha}$ 事件上加一个全局 $\varepsilon$-net：$|u^THu|$ 要对所有单位向量同时成立，net 的参数是 $n$ 维，网尺寸 $e^{Cn}$ 与 $e^{-cL_n^{1/4}}$ 完全不相容，$1/4$ 次幂付不出 $n$。这是本引理必须用能量分块（，并非维度枚举）的根本原因。其二，跳过 $r$ 标签、只用一个块尺度：那 $\sum_r$ 变成对 $n/d_j$ 个块求和，多出 $\log$ 之外的幂，$\sigma_j^{1/4}$ 会变成 $\sigma_j^{1/4}(n\sigma_j^{3/2})^{1/2}$ 之类，界直接退化到不能用；论文把"尾部质量 $\le C2^{-r}$"这一半交给能量，才使 $r$ 级数几何收敛。其三，让 $K$ 依赖 $j,r$ 以省掉 $h_n$：那么失败概率求和不再给 $e^{-ch_n^2}$，而 $h_n$ 与 $A_n$ 是同一个 $L_n$ 的两面，省 $h_n$ 就等于省 $A_n$，$\Phi_n$ 的前置因子变大，`eq:phi-smallness` 的 $\eta_n\to0$ 保住但 `spectral:476` 的单调性与 `spectral:514` 的 $L_n^{-1}+\eta_n$ 会被破坏。[推测] 这条我没能完全排除，只是从 $\eta_n$ 的定义反推。

### 4.4 lem:deterministic-resolvent：Hermite Riccati

(a) 逐字（`spectral:373-392`）：

```tex
\begin{lemma}[Hermite resolvent estimates]
\label{lem:deterministic-resolvent}
Let $e_1\le\cdots\le e_n$ be the eigenvalues of $E=2I-D$, and set
\[
 R_D(s)=\frac1n\Tr(s+E)^{-1},\qquad
 T_D(s)=\frac1n\Tr(s+E)^{-2}=-R_D'(s).
\]
For every fixed $M<\infty$ and all sufficiently large $n$, uniformly for
$s_0\le s\le M$,
\begin{equation}
 T_D(s)\le C_Ms^{-1/2},\qquad
 0\le R(s)-R_D(s)\le\frac{C_M}{ns}.
 \label{eq:deterministic-traces}
\end{equation}
Moreover,
\begin{equation}
 N(t):=\#\{i:e_i\le t\}\le Cnt^{3/2}
 \qquad(t\ge s_0).
 \label{eq:deterministic-counting}
\end{equation}
\end{lemma}
```

(b) 推导补完。把 $D$ 的坐标反向，off-diagonal 变成 $\sqrt{k/n}$，于是顺序主子式特征多项式满足 $P_{k+1}(z)=zP_k(z)-(k/n)P_{k-1}(z)$。归纳 $P_k'=kP_{k-1}$：对递推求导得 $P_{k+1}'=P_k+zP_k'-(k/n)P_{k-1}'=P_k+zP_k'-P_k'$（用 $P_k'=kP_{k-1}$），即 $P_{k+1}'=(k+1)P_k$。合并得 $P_n''-nzP_n'+n^2P_n=0$（`spectral:409`）。由于 $P_n$ 是 $D$ 的特征多项式，$R_D(s)=P_n'(2+s)/(nP_n(2+s))$；代入微分方程整理出 Riccati 型恒等式

```tex
 R_D(s)^2-(2+s)R_D(s)+1=\frac{T_D(s)}n>0.
 \label{eq:hermite-riccati}
```

左边的两个根是 $R(s)$ 与 $R_+(s)=\frac{2+s+\sqrt{s(4+s)}}2$；$R_D>0$ 且 $s\to\infty$ 时 $R_D(s)\to0$ 而 $R_+(s)\to\infty$，故 $R_D$ 在大 $s$ 落在小根下方，正的间隙使它无法越过任一根，于是处处 $R_D\le R$。记 $\delta=R-R_D$，分解二次式得 $0\le\delta(s)\le\frac{T_D(s)}{n\sqrt{s(4+s)}}$（`spectral:426-430`）。逐项比较预解式给 $T_D(s)\le\frac2s[R_D(s/2)-R_D(s)]\le\frac2s[R(s/2)-R(s)+\delta(s)]$；显式求导 $0<-R'(s)=\frac{2}{\sqrt{s(4+s)}(2+s+\sqrt{s(4+s)})}\le\frac1{2\sqrt s}$，从 $s/2$ 积到 $s$ 得 $R(s/2)-R(s)\le\sqrt s-\sqrt{s/2}\le\sqrt s$，于是 $T_D(s)\le\frac C{\sqrt s}+\frac{2T_D(s)}{ns\sqrt{s(4+s)}}$，$s\ge s_0$ 时最后一项系数 $\le(ns_0^{3/2})^{-1}=L_n^{-3/2}\to0$，吸收即得 $T_D\le C_Ms^{-1/2}$，回代 `eq:root-difference` 得 $\delta$ 界。计数：$s_0\le t\le1$ 时每个 $e_i\le t$ 对 $nT_D(t)$ 贡献至少 $(2t)^{-2}$，故 $N(t)\le4nt^2T_D(t)\le Cnt^{3/2}$；$t\ge1$ 由 $N(t)\le n\le Cnt^{3/2}$。

`eq:root-difference` 与 $R_D(s/2)\le R(s/2)$ 的一致性有一处容易被读掉：论文在 `spectral:451-452` 特别指出后者对所有正 $s/2$ 成立、不需要 $s/2\ge s_0$。这是为了让 $T_D(s)$ 的自举第一次进入 $s/2<s_0$ 的区域时不必补条件。

(c) $3/2$ 与 $1/2$ 这两个指数的出处：$T_D\le Cs^{-1/2}$ 是半圆律边缘密度 $\propto\sqrt{e}$ 的积分表现（$\int_0^t\sqrt e\,de\propto t^{3/2}$），而 $N(t)\le Cnt^{3/2}$ 就是同一条边缘律的计数形式；$C_M/(ns)$ 是有限维 $R_D$ 对无穷维 $R$ 的偏差，通过 $\delta\le T_D/(n\sqrt{s(4+s)})$ 与 $T_D\le Cs^{-1/2}$ 得 $C/(n\sqrt s\cdot\sqrt s)=C/(ns)$，所以 $M$ 只出现在 $T_D$ 的上端点上。

(d) 失败路线。其一，直接引用 GOE 边缘的 Tracy-Widom 收敛来代替这条确定性恒等式：那需要边缘分布的收敛率，而本篇要的是在 $\mathcal G_n$ 上一致、确定性的界（`spectral:494` 起所有结论都是 deterministic on $\mathcal G_n$），TW 率给不出这种一致形式。其二，用一般的 Stieltjes 变换凸性替代 Hermite 递推：凸性只能给 $R_D$ 与半圆的弱收敛，给不出 $0\le R-R_D$ 的符号；符号在这里是必需的，因为 $T_D$ 的上界靠 $R_D(s/2)-R_D(s)\le R(s/2)-R(s)+\delta$ 这一步。其三，把 $c_i=\sqrt{1-i/n}$ 换成别的确定性剖面（例如常数 1）：Riccati 方程就变了，$R$ 不再是半圆 Stieltjes 变换，`eq:deterministic-counting` 的 $3/2$ 也随之改变，而 §6 的 $q_0=n^{-7/24}$ 三关系（`orient:155-158`）正是按半圆边缘的 $3/2$ 调出来的。[推测] 最后这句是我按指数匹配反推的，论文没有写这段选择史。

## 5 spherical：球面上的精确 Gaussian 条件化

`sec:spherical` 的任务：把倾斜球面测度写成独立 Gaussian 坐标条件化在平方半径上，再用 §4 的边缘估计给出"第一坐标很少小"与"平方 overlap 的上界"。定义（`spherical:21-28`）：

```tex
 S(a)=\int e^{a u^T\Lambda u/2}\,\sigma_n(du),
 \qquad
 B(a)=\inf_{z>a\lambda_1}
 \left\{\frac{z-1}{2}
       -\frac1{2n}\sum_{i=1}^n\log(z-a\lambda_i)\right\}.
```

$\sigma_n$ 是 $\{u:\|u\|^2=n\}$ 上的均匀概率，$\Lambda=\operatorname{diag}(\lambda_1,\ldots,\lambda_n)$，有序谱满足 $\max_i|\lambda_i|\le3$、$n\ge3$、$0\le a\le2$。

### 5.1 lem:spherical-identity

(a) 逐字（`spherical:49-74`）：

```tex
\begin{lemma}[Gaussian representation]
\label{lem:spherical-identity}
For every $a\in[0,2]$, the infimum defining $B(a)$ has a unique minimizer
$z_a$.  With
\begin{equation}
\label{eq:spherical-saddle}
 k_i(a)=(z_a-a\lambda_i)^{-1},
 \qquad
 \sum_{i=1}^n k_i(a)=n,
\end{equation}
one has
\[
 1+a\lambda_n\le z_a\le1+a\lambda_1,
 \qquad
 \frac1{13}\le k_i(a)\le n.
\]
Let $Y_i$ be independent $N(0,k_i(a))$ variables, and let $p_a$ be the
density of $\sum_iY_i^2$.  Then
\begin{equation}
\label{eq:spherical-identity}
 S(a)=e^{nB(a)}
       \frac{p_a(n)}{p_{\chi_n^2}(n)}.
\end{equation}
The conditional law of $Y$ given $\|Y\|^2=n$, defined by radial
disintegration, is $\sigma_{\Lambda,a}$.
\end{lemma}
```

(b) 推导补完。记目标函数为 $F_a(z)$，在 $z>a\lambda_1$ 上 $F_a'(z)=\frac12-\frac1{2n}\sum_i(z-a\lambda_i)^{-1}$，$F_a''(z)=\frac1{2n}\sum_i(z-a\lambda_i)^{-2}>0$，严格凸；$F_a'$ 在左端点趋于 $-\infty$、无穷处趋于 $1/2$，$F_a$ 两端都趋于 $+\infty$，故唯一极小点存在且满足 $F_a'(z_a)=0$，即 `eq:spherical-saddle` 的 $\sum_ik_i(a)=n$。倒数 $\{k_i\}$ 的算术平均是 1，故其最小值至多 1、最大值至少 1，于是 $\min_i(z_a-a\lambda_i)\le1\le\max_i(z_a-a\lambda_i)$，解出 $1+a\lambda_n\le z_a\le1+a\lambda_1$。再由 $0<z_a-a\lambda_i\le1+a(\lambda_1-\lambda_n)\le1+2\cdot6=13$ 得 $k_i\ge1/13$；$k_i\le n$ 由正性与和为 $n$。$a=0$ 给出 $z_0=1$、$k_i(0)=1$、$B(0)=0$，用作后面所有比较的基点。

极坐标恒等式：取任意可行 $z$，$Q=zI-a\Lambda$、$Y^{z,a}\sim N(0,Q^{-1})$，它对标准 Gaussian 密度的比是 $(\det Q)^{1/2}\exp(-\frac{z-1}{2}\|y\|^2+\frac a2y^T\Lambda y)$；标准 Gaussian 的角度分布均匀，在平方半径 $n$ 的球面上积分该比值，得 `spherical:112-117`

```tex
 \frac{p_{z,a}(n)}{p_{\chi_n^2}(n)}
 =(\det Q)^{1/2}e^{-n(z-1)/2}S(a),
```

在 $z=z_a$ 处整理就是 `eq:spherical-identity`；同一比值固定半径即给出条件律的断言。

(c) 每个常数与假设的来历。$1/13$ 完全由 $\max|\lambda_i|\le3$ 与 $a\le2$ 生成（$1+a(\lambda_1-\lambda_n)\le13$），它有两处消费者：`spherical:358` 的 $\sup p_a\le C$（配 `eq:two-square-density`，取两个 $k_i\ge1/13$）与 `spherical:390-393` 的压缩矩阵每个方差 $\ge1/13$、$\sqrt{z_a-a\lambda_n}\le\sqrt{13}$。$a\in[0,2]$ 的右端点由 §6 决定：$M(1)=M(-1)=S(2)$（`orient:81-83`），pair 界要在参数 $1+|q|\le2$ 上调用 `lem:partition-bounds`。`spherical:45-47` 声明 "no saddlepoint approximation is used in this conditioning step"，即该式是精确等式，$B(a)$ 只作指数率，所有误差都走密度比 $p_a(n)/p_{\chi_n^2}(n)$ 这一条通道。$n\ge3$ 的用处见 `lem:mean-density`（至少三个正权重）与 `model:6-7`（三坐标论证要求 $n\ge3$）。

(d) 失败路线。其一，直接对 $S(a)$ 做 Laplace 近似：那会给出 $e^{nB(a)}$ 乘一个来源不明的 $1+o(1)$，而 §6 的相对二矩要比较同一 saddle 下不同集合（超平面、格点箱）的质量之比，误差符号不可控；精确恒等式把所有误差压进"密度的上下界"。其二，用矩方法或自由卷积处理球面配分：给不出 $n^{\pm1/2}$ 这种多项式精度，而 `lem:partition-bounds` 的 $cn^{-1/2}\le S(a)e^{-nB(a)}\le Cn^{1/2}$ 正是 §6 里 $n^2$ 因子的来源。其三，把半径条件化改成软约束（例如加一个 $e^{-\varepsilon(\|Y\|^2-n)^2}$）：`spherical:118-120` 强调这是连续径向密度在正半径处的极坐标恒等式，软约束引入额外卷积，而 §6 的箱比较已经独立处理过一次格点误差，两处叠加会破坏 $\delta_n\to0$ 的确定性。[推测] 第三条按结构反推，论文未写。

### 5.2 两块平方与均值处的密度下界

两个平方平滑（`spherical:125-142`）：$G,H$ 独立标准正态、$d,e>0$，$r_{d,e}$（$dG^2+eH^2$ 的密度）满足 $r_{d,e}(t)=\frac1{2\pi\sqrt{de}}\int_0^t\frac{e^{-x/(2d)-(t-x)/(2e)}}{\sqrt{x(t-x)}}dx\le\frac1{2\sqrt{de}}$，因 $\int_0^t[x(t-x)]^{-1/2}dx=\pi$；再与其它独立变量卷积保持上界。这是全部 $\sup$ 密度估计的原子。

`lem:mean-density`（`spherical:154-163`）：

```tex
\begin{lemma}[Density at the mean]
\label{lem:mean-density}
There is a universal constant $c>0$ such that, for every $n\ge3$ and
every $k_1,\ldots,k_n>0$ with $\sum_i k_i=n$, the density $p$ of
$\sum_i k_iG_i^2$, for independent standard Gaussians $G_i$, satisfies
\begin{equation}
\label{eq:mean-density}
 p(n)\ge c\left(\sum_i k_i^2\right)^{-1/2}.
\end{equation}
\end{lemma}
```

推导（`spherical:165-311`）我按它的两条分支补完。归一化：$\tau=(\sum k_i^2)^{1/2}$、$d_i=k_i/\tau$，$T_d=\sum d_i(G_i^2-1)=(\sum k_iG_i^2-n)/\tau$ 的密度 $f_d$ 满足 $f_d(0)=\tau p(n)$，$\sum d_i^2=1$，$n\ge3$ 保证至少三个正权重；特征函数绝对值 $O(|t|^{-n/2})$ 使密度有连续版本。反证设 $f_{d^{(r)}}(0)\to0$，排序补零取对角子列 $d_i^{(r)}\to c_i$，$\sum c_i^2\le1$。

分支 $c_1=0$：$\psi_d(t)=\mathbb E e^{itd(G^2-1)}=e^{-itd}(1-2itd)^{-1/2}$，取在 $t=0$ 为零的连续对数分支，$|td|$ 小时 $\log\psi_d(t)=-t^2d^2+O(|t|^3d^3)$；$\sum_i(d_i^{(r)})^3\le d_1^{(r)}\sum_i(d_i^{(r)})^2=d_1^{(r)}\to0$，故 $\phi_r(t)=\prod_i\psi_{d_i^{(r)}}(t)\to e^{-t^2}$ 逐点。弱收敛不管单点，于是要一致可积控制：$|\phi_r(t)|=\prod_i(1+4(d_i^{(r)})^2t^2)^{-1/4}\le(1+4(d_1^{(r)})^2t^2)^{-1/(4(d_1^{(r)})^2)}$，用 $\log(1+x)$ 凹性与 $\sum(d_i^{(r)})^2=1$；$x\mapsto\log(1+Ax)/x$ 递减，故一旦 $(d_1^{(r)})^2\le1/8$ 就 $\le(1+t^2/2)^{-2}$。Fourier 反演加控制收敛给 $f_{d^{(r)}}(0)\to\frac1{2\pi}\int_{\R}e^{-t^2}dt=1/(2\sqrt\pi)$，矛盾。

分支 $c_1>0$：删最大坐标，$R_r=\sum_{i\ge2}d_i^{(r)}(G_i^2-1)\Rightarrow R=\sum_{i\ge2}c_i(G_i^2-1)+Z$，$Z\sim N(0,2(1-\sum_{i\ge1}c_i^2))$ 与诸 Gaussian 独立。识别极限：$d_{m+1}^{(r)}\le(m+1)^{-1/2}$，同一对数展开给 $\log\mathbb E e^{itR_r}=\sum_{i=2}^m\log\psi_{d_i^{(r)}}(t)-t^2(1-\sum_{i=1}^m(d_i^{(r)})^2)+O(|t|^3/\sqrt{m+1})$，先 $r\to\infty$ 后 $m\to\infty$；$L^2$ 收敛由尾方差 $2\sum_{i>m}c_i^2\to0$。残差极限在零附近有正质量：截断到尾部方差 $<\delta^2/16$，有限部分每个非零项的密度在零附近为正，与 $Z$ 一起在 $(-\delta/2,\delta/2)$ 有正概率（零权重或退化的 $Z$ 都不碍事），独立尾部由 Chebyshev 给同区间正概率，取交即得；论文注明这步用 $(c_i)$ 的平方可和，并非可和。于是 $\liminf_r\mathbb P\{|R_r|<c_1/3\}\ge\mathbb P\{|R|<c_1/3\}>0$。$d(G^2-1)$ 的密度 $g_d(x)=\frac{e^{-(x+d)/(2d)}}{\sqrt{2\pi d(x+d)}}\mathbf1_{\{x>-d\}}$ 在 $d$ 靠近 $c_1$、$|x|\le c_1/3$ 有正下界 $c(c_1)$（区间严格在支撑内部）。卷积恒等式 $f_{d^{(r)}}(0)=\mathbb E[g_{d_1^{(r)}}(-R_r)]$ 在该点成立（不只 a.e.），理由是 $R_r$ 有有界密度（`eq:two-square-density` 用其中两个正坐标），有界密度与 $L^1$ 函数卷积连续（平移改变量被残差密度 supremum 乘 $\|g(\cdot+h)-g\|_{L^1}\to0$ 控制）。矛盾。

$Z$ 的方差 $2(1-\sum_{i\ge1}c_i^2)$ 我会验一遍：$\sum_{i\ge2}(d_i^{(r)})^2$ 的极限 $\sum_{i\ge2}c_i^2\le1-\dots$，剩余质量 $1-\sum_{i\ge1}c_i^2$ 弥散在无穷多个趋于零的权重上，每项 $\chi^2$ 中心化项方差 $2d^2$，叠加成 Gaussian；这就是 $c_1=0$ 分支与 $c_1>0$ 分支在极限里唯一的差别。

(d) 失败路线。其一，把 $n\ge3$ 放松成 $n\ge2$：两权重且 $d_1\to1$ 时 $R_r$ 只剩一个坐标，去掉最大坐标后残差可能恒为零，$Z$ 的方差 $2(1-\sum_{i\ge1}c_i^2)$ 也归零，"零附近有正质量"的论证退化成单点质量，卷积下界失效。其二，用 Berry-Esseen 型定量 CLT 代替紧性：那会给 $p(n)\ge c/\tau$ 附一个 $\sum d_i^3$ 小的条件，恰好排除支配权重存在的情形，而 §5.4 的 $p(n)\ge c/(n\sqrt{s_0})$ 用在 $\tau\asymp n\sqrt{s_0}$（支配权重确实存在）的地方。其三，把 Fourier 控制放松为 $|\phi_r(t)|\le(1+t^2)^{-1}$：不够衰减到能取 $t=0$ 处的极限，需要 $(1+t^2/2)^{-2}$；$1/8$ 这个门槛我推测正是为保证指数 $\ge2$。[推测]

### 5.3 partition 界与超平面版本

`lem:partition-bounds`（`spherical:318-335`）断言 $cn^{-1/2}e^{nB(a)}\le S(a)\le Cn^{1/2}e^{nB(a)}$，且对每个 $(n-1)$ 维子空间 $H$、半径 $\sqrt n$ 球面均匀测度 $\sigma_{n,H}$，有 $S_H(a)\le Cn^{1/2}e^{nB(a)}$，同一个 $C$ 对所有 $H$ 与 $a\in[0,2]$ 有效。推导：$p_{\chi_m^2}(r)=\frac{r^{m/2-1}e^{-r/2}}{2^{m/2}\Gamma(m/2)}$，Stirling 给 $cn^{-1/2}\le p_{\chi_m^2}(n)\le Cn^{-1/2}$（$m=n$ 或 $m=n-1$、$n\ge3$，有限个小维度被常数吸收）；下界 $p_a(n)\ge c/n$ 由 `lem:mean-density` 与 $(\sum k_i^2)^{1/2}\le\sum k_i=n$；上界 $\sup p_a\le C$ 由 `eq:two-square-density` 与 $k_i\ge1/13$。超平面：$\theta_1\ge\cdots\ge\theta_{n-1}$ 为 $\Lambda_H$ 的特征值，min-max 给 $\lambda_i\ge\theta_i\ge\lambda_{i+1}$；$a\ge0$ 时交错给

```tex
 (\det Q_H)^{-1/2}
 \le\prod_{i=1}^{n-1}(z_a-a\lambda_i)^{-1/2}
 =\left(\prod_{i=1}^n(z_a-a\lambda_i)^{-1/2}\right)
   \sqrt{z_a-a\lambda_n},
```

末根号 $\le\sqrt{13}$。同一极坐标计算在维数 $n-1$、平方半径仍为 $n$ 处给 $S_H(a)=e^{n(z_a-1)/2}(\det Q_H)^{-1/2}p_{H,a}(n)/p_{\chi_{n-1}^2}(n)$，$Q_H$ 的特征值 $\le z_a-a\lambda_n\le13$ 即所有方差 $\ge1/13$，至少两个，$\,p_{H,a}(n)\le C$。

这段只用上界，且 $z_a$ 不必是压缩问题自己的极小点（`spherical:395-398`）。我最初想给 $H$ 也配一个 $B_H(a)$，那样 §6 的 pair 界分子会带两个不同的指数率，`eq:orientation-pair-bound` 那种"$B(1+|q|)+B(1-|q|)-2B(1)$"的单一批量比较就凑不出来。

### 5.4 临界参数与两个输出

`lem:critical-sphere`（`spherical:417-434`）：

```tex
\begin{equation}
\label{eq:critical-spherical-parameters}
 \lambda_1<z_1<2+s_0,\qquad
 \left(\sum_i k_i^2\right)^{1/2}\le Cn\sqrt{s_0},
 \qquad
 k_j\ge c/s_0\quad(1\le j\le3).
\end{equation}
```

外加 $p(n)\ge c/(n\sqrt{s_0})$ 与 $\sup_rp_{-i}(r)\le Cs_0$。置 $h_i=(2+s_0-\lambda_i)^{-1}$，由 `prop:spectral` 一 trace 与 $R(s)=1-\sqrt{s}+O(s)$ 得 $\sum_ih_i=n(1-\sqrt{s_0}+o(\sqrt{s_0}))<n$；$z\mapsto\sum(z-\lambda_i)^{-1}$ 在 $(\lambda_1,\infty)$ 严格递减、在 $z_1$ 处等于 $n$，故 $\lambda_1<z_1<2+s_0$ 且 $k_i\ge h_i$。总增量 $\sum(k_i-h_i)=n-\sum h_i=n\sqrt{s_0}(1+o(1))$。非负向量的 Euclidean 范数不超过坐标和，故三角不等式加二 trace：$(\sum k_i^2)^{1/2}\le(\sum h_i^2)^{1/2}+\sum(k_i-h_i)\le C\sqrt n\,s_0^{-1/4}+Cn\sqrt{s_0}\le Cn\sqrt{s_0}$，末步用 $n^{-1/2}s_0^{-3/4}=L_n^{-3/4}\to0$（同一 $L_n^{-3/4}$ 在 §4 是 $\eta_n$ 的分母）。$j\le3$ 用 $0<z_1-\lambda_j\le2+s_0-\lambda_j\le Cs_0$。删除估计：删任意 $i$，$\{1,2,3\}$ 至少剩两个，两个方差 $\ge c/s_0$ 的平方卷积给 $\sup p_{-i}\le Cs_0$。

`prop:spherical-small-ball`（`spherical:485-497`）给 $\sigma_\Lambda\{|u_1|\le bn^{1/3}\}\le CL_n^2b$。我把 $L_n^2$ 的来源算干净，因为 §6 用它决定 $b_n$ 与 $L_n$ 的关系。条件化一坐标：

```tex
 \sigma_\Lambda\{|u_1|\le T\}
 &=\frac1{p(n)}
   \int_{|y|\le T}\varphi_{k_1}(y)p_{-1}(n-y^2)\,dy\\
 &\le \frac{Cs_0}{p(n)}\,\Prob\{|Y_1|\le T\}.
\end{split}
```

（原文 `spherical:507-512`，负自变量处残差密度取零。）$Cs_0/p(n)\le Cns_0^{3/2}=CL_n^{3/2}$（用 $s_0^{3/2}=L_n^{3/2}n^{-1}$），$\mathbb P\{|Y_1|\le bn^{1/3}\}\le Cbn^{1/3}/\sqrt{k_1}\le Cbn^{1/3}\sqrt{s_0}=Cb\sqrt{L_n}$。相乘 $=CbL_n^2$。分配是硬的：$L_n^{3/2}$ 是条件化代价，$L_n^{1/2}$ 是原始 Gaussian 质量，没有余量可挪。取 $L_n=\min\{\log n,b_n^{-1/4}\}$ 即 $L_n^2b_n\le b_n^{1/2}\to0$。

`lem:spherical-covariance`（`spherical:531-548`）：$\int u_i^2\sigma_\Lambda\le Cs_0k_i/p(n)$，进而

```tex
 \E\left(\frac{U^TV}{n}\right)^2
 \le
 \frac{Cs_0^2}{n^2p(n)^2}\sum_i k_i^2
 \le Cn^{-2/3}L_n^4.
```

链条：$m_i\le Cs_0k_i/p(n)$；$\mathbb E(U^TV/n)^2=n^{-2}\sum m_i^2\le\frac{Cs_0^2}{n^2p(n)^2}\sum k_i^2$；$p(n)^{-2}\le C\sum k_i^2$（`lem:mean-density`）；$\sum k_i^2\le Cn^2s_0$（`lem:critical-sphere`）。合起来 $Cs_0^2(n^2s_0)^2/n^2=Cn^2s_0^4=Cn^{-2/3}L_n^4$。$L_n^4$ 是两个 $\sum k_i^2$ 各贡献一个 $L_n^2$；$n^{-2/3}$ 与 `intro:20-23` 说的临界 overlap 平方法则一致（overlap 标度 $n^{-1/3}$）。均值零与对角协方差来自"翻转单个坐标不改变 $\sigma_\Lambda$ 的密度"（`spherical:552-555`）。

## 6 orientation：一次 Haar 平均完成搬运

`sec:orientation` 的输入是 §5 的两条，输出是 §7 的 `thm:static-small-ball`、`prop:overlap`、`cor:covariance-scale`，中间全是一次矩比较。立方体 overlap 律 $\mathcal Q_n=\{-1+2j/n\}$、$p_I(q)=2^{-n}\binom{n}{n(1+q)/2}$；球面 $f_S(q)=c_n(1-q^2)^{(n-3)/2}$、$c_n=\frac{\Gamma(n/2)}{\sqrt\pi\Gamma((n-1)/2)}$（`orient:58-104`）。配对矩 `orient:69-72`：

```tex
 M(q)=\E\exp\!\left(
       \frac{(1+q)U^T\Lambda U+(1-q)V^T\Lambda V}{2}\right).
```

一次恒等式 $\mathbb E_OI=S(1)$；二次 $\mathbb E_OI^2=\sum_qp_I(q)M(q)$（`orient:85-88`），端点 $q=\pm1$ 时 $y=\pm x$、合并能量 $x^TWx$，故 $M(1)=M(-1)=S(2)$；球面侧 $\int_{-1}^1M(q)f_S(q)dq=S(1)^2$。$M$ 偶且关于 $|q|$ 不减，写法 $M(q)=\mathbb E[e^{(A+D)/2}\cosh(q(A-D)/2)]$（`orient:90-96`），这条单调性是后面"向外搬箱"的唯一支点。

pair 上界（`orient:134-138`）：

```tex
 \frac{M(q)}{S(1)^2}
 \le Cn^2\exp\!\left(n\bigl[B(1+|q|)+B(1-|q|)-2B(1)\bigr]\right).
```

给定 $U$ 时 $V$ 在 $U^\perp$ 的球面上，用超平面界（参数 $1-|q|$），剩下对 $U$ 的积分用全空间界（参数 $1+|q|$），除以 $S(1)^2$ 的下界。$n^2$ 我按 `lem:partition-bounds` 重算：分子两个 $Cn^{1/2}$ 相乘给 $n$，分母 $\ge c^2n^{-1}e^{2nB(1)}$ 再贡献一个 $n$，故 $Cn^2$。$|q|=1$ 仍有效，因为参数 0 的积分等于 1。

大 overlap 的压制要求指数里有比 $q^2/2$ 更小的量，而 $p_I(q)\le e^{-nq^2/2}$ 来自 $n$ 个独立均匀符号均值的 Chernoff：$(\log\cosh t)''\le1$ 从 0 两次积分得 $\cosh t\le e^{t^2/2}$（`orient:141-148`）。分点 $q_0=n^{-7/24}$ 与三条尺度关系（`orient:151-159`）：

```tex
 nq_0^3=n^{1/8}\longrightarrow\infty,\qquad
 nq_0^4=n^{-1/6}\longrightarrow0,\qquad
 \frac{s_0}{q_0^2}=L_n n^{-1/12}\longrightarrow0.
```

$7/24$ 的来历是可解的：$nq^3\to\infty$ 要求 $q\gg n^{-1/3}=n^{-8/24}$；$nq^4\to0$ 要求 $q\ll n^{-1/4}=n^{-6/24}$；$s_0/q^2\to0$ 在 $L_n\le\log n$ 下要求 $q\gg n^{-1/3}(\log n)^{1/2}$，比第一条略松。取中点 $-7/24$ 使两侧各余 $n^{1/24}$。

### 6.1 lem:cubic-deficit

(a) 逐字（`orient:170-180`）：

```tex
\begin{lemma}[Cubic deficit]
\label{lem:cubic-deficit}
There is a universal constant $c>0$ such that, for all sufficiently large $n$,
uniformly for spectra in $\mathcal G_n$ and $q_0\le q\le1$,
\begin{equation}
 B(1+q)+B(1-q)-2B(1)
 \le \frac{q^2}{2}-cq^3.
 \label{eq:cubic-deficit}
\end{equation}
One may take $c=1/24$.
\end{lemma}
```

(b) 推导。$z_a$ 连续可微（saddle 方程 + 隐函数）。在极小点处对参数求导给两条（`orient:190-196`）：$B'(a)=\frac1{2n}\sum_i\frac{\lambda_i}{z_a-a\lambda_i}$ 与 $B'(a)=\frac{z_a-1}{2a}$（$a>0$；第一条在 $a=0$ 也成立，端点取单侧导数）。正权重 $(z_a-a\lambda_i)^{-1}$ 和为 $n$，故 $|B'(a)|\le\frac12\max|\lambda_i|\le3/2$（$0\le a\le2$），这条后面当 dominator 用。写 $r_a=z_a/a$，saddle 方程等价于 $\frac1n\sum_i(r_a-\lambda_i)^{-1}=a$，并记 $m_n(s)=\frac1n\sum(2+s-\lambda_i)^{-1}$。

超临界（$a=1+u$，$0\le u\le1$）：$m_n(s_0)=1-\sqrt{s_0}+o(\sqrt{s_0})<1$，预解式单调给 $r_a<2+s_0$，于是 `orient:214-218`

```tex
 B'(1+u)
 \le \frac{1+u}{2}-\frac{u^2}{2(1+u)}+\frac{s_0}{2}.
```

我在纸上核对右端：$B'(1+u)=\frac{r_a-1}{2(1+u)}\le\frac{1+s_0}{2(1+u)}$，而 $\frac{1+s_0}{2(1+u)}=\frac{1+u}{2}-\frac{u^2}{2(1+u)}+\frac{s_0}{2(1+u)}\cdot(1+u)-$ 项整理后与论文式一致（差在 $\frac{s_0}{2(1+u)}\le\frac{s_0}2$，即放大的那一处）。

亚临界要更定量：$4\sqrt{s_0}\le u\le1/4$ 时置 $t=u^2/(1-u)$，则 $t\le1/12$ 且 $0.9t\ge14.4s_0$。$R(t)=1-u$（验证：$R$ 满足 $R^2-(2+t)R+1=0$，代 $R=1-u$、$t=u^2/(1-u)$ 得 $(1-u)^2-(2+\frac{u^2}{1-u})(1-u)+1=(1-u)^2-2(1-u)-u^2+1=0$）。$-R'(s)\ge c_1/\sqrt s$（$0<s\le1/12$），从 $0.9t$ 积到 $t$ 得 $R(0.9t)-(1-u)\ge c_2\sqrt t\ge c_2u$；$m_n(0.9t)=R(0.9t)+o(\sqrt t)$ 的误差在该范围一致且小于此 margin，故 $m_n(0.9t)>1-u$，单调性给 $r_{1-u}\ge2+0.9t$，代回第二条导数恒等式得 `orient:242-246`

```tex
 B'(1-u)\ge\frac{1-u}{2}-\frac{u^2}{20(1-u)}
 \qquad(4\sqrt{s_0}\le u\le1/4).
```

短区间 $0\le u\le4\sqrt{s_0}$ 改用在 $r_{1-u}>\lambda_1=2+o(s_0)$ 处取值：$B'(1-u)\ge\frac{1-u}2-\frac{u^2}{2(1-u)}-o(s_0)\ge\frac{1-u}2-Cs_0$（这里 $u^2\le16s_0$ 被吸收进 $Cs_0$）。

合并：记 $F(q)=B(1+q)+B(1-q)-2B(1)$。$F'(u)=B'(1+u)-B'(1-u)\le u-\bigl(\frac1{2(1+u)}-\frac1{20(1-u)}\bigr)u^2+Cs_0$，而 $0\le u\le1/4$ 时括号 $\ge1/3$，故 $F'(u)\le u-\frac{u^2}3+Cs_0$；$F(0)=0$ 积分得 `orient:266-270`

```tex
 F(q)\le\frac{q^2}{2}-\frac{q^3}{9}+Cs_0q
 \qquad(0\le q\le1/4).
```

$q\ge q_0$ 时末项除以 $q^3$ 至多 $Cs_0/q_0^2=CL_nn^{-1/12}\to0$，所以 `eq:cubic-deficit` 在 $[q_0,1/4]$ 成立，甚至可用 $c=1/18$（$1/9$ 的一半，一半留给误差）。

宏观侧另走：固定 $a\in(0,1)$，用恒等式 $R(a+a^{-1}-2)=a$（验证：$R=a$ 时 $t=a+a^{-1}-2=(1-a)^2/a$，与上面 $R(t)=1-u$ 的同一根方程），$R$ 严格单调加预解式估计夹住 $r_a$，得 $r_a\to a+a^{-1}$、$B'(a)\to a/2$（每条 $a$ 用的上端预解参数有限，不需 $a\downarrow0$ 的一致估计）。$|B'|\le3/2$ 给 dominated convergence：$\rho_n=\int_0^1|B'(a)-a/2|da\to0$。积分超临界不等式、用 $\rho_n$ 界住亚临界误差，对 $0\le q\le1$ 一致地（`orient:298-304`）

```tex
 F(q)
 &\le \frac{q^2}{2}
       -\int_0^q\frac{u^2}{2(1+u)}\,du+\rho_n+\frac{s_0}{2} \notag\\
 &\le \frac{q^2}{2}-\frac{q^3}{12}+\rho_n+\frac{s_0}{2}.
```

$q\ge1/4$ 时 $\frac{q^3}{12}\ge\frac1{768}$ 有正下界，$\rho_n+s_0/2\to0$ 可吸收，取 $c=1/24$（$1/12$ 的一半），这覆盖 $q=1$。一致性最后用反证：若 $\rho_n\to0$ 在 $\mathcal G_n$ 上不一致，可选出违反子列，而它们的确定性谱界仍给出刚证过的逐点收敛与有界控制，矛盾（`orient:307-315`）。

(c) 常数台账。$c=1/24$ 由 $1/9$（小区间，来自 $F'$ 里 $u^2/3$ 积分）与 $1/12$（宏观，来自 $\int_0^q\frac{u^2}{2(1+u)}du\ge\int_0^q\frac{u^2}4du$）各取一半，再取两者较小。$1/3$ 来自 $\frac1{2(1+u)}-\frac1{20(1-u)}$ 在 $u\le1/4$ 的下界，其中 $1/20$ 是亚临界式 $B'(1-u)\ge\frac{1-u}2-\frac{u^2}{20(1-u)}$ 的分母。$4\sqrt{s_0}$ 这个分点的机械理由是 margin $c_2u$ 必须大于谱误差 $o(\sqrt t)$ 且要求 $0.9t\ge14.4s_0$，而 $t=u^2/(1-u)$，$u\ge4\sqrt{s_0}$ 时 $t\ge16s_0/(3/4)\approx21s_0$。$q^2/2$ 这一项是 Chernoff 的临界量，$-cq^3$ 是唯一可用的亏损；若只有 $-o(q^2)$ 级别，尾估计 $\sum_{|q|\ge q_0}p_IM/S(1)^2$ 无法给出 $e^{-cn^{1/8}}$。

(d) 失败路线。其一，只对 $B$ 做二阶展开：那给 $F(q)\le q^2/2+O(q^4)$ 或符号不明的三次项，$B'(a)\to a/2$ 在 $a=1$ 处失效（那正是临界点），二阶恰好被 Chernoff 完全抵消，尾估计变成 $Cn^2$ 乘 $e^0$。其二，对重加权的 pair 积分求导做 Riemann 和比较：`orient:353-356` 说明障碍是 $M(q)$ 变化太快、导数界不可用；本节的箱比较（下面 `eq:orientation-bin-comparison`）完全不依赖 $h$ 的变化速度（`orient:415`）。其三，把 $c$ 取成紧的 $1/12$：那需要 $\rho_n+s_0/2\le q^3/24$ 对 $q\ge1/4$ 成立，而 $\rho_n\to0$ 在 $\mathcal G_n$ 上无速率，任何等号级常数都会把一致陈述降级为逐谱陈述；取一半是给反证论证留空间。[推测] 这最后一条我从证明结构反推，论文未记选择过程。

### 6.2 集中度、小投影、平方 overlap、协方差标度

`prop:orientation-concentration`（`orient:320-330`）声明 $\mathbb E_OI=S(1)$ 与 $\sup_{\Lambda\in\mathcal G_n}\mathbb E_O[(I/S(1)-1)^2]\to0$。大区：$p_I(q)\frac{M(q)}{S(1)^2}\le Cn^2e^{-cn|q|^3}$，格点至多 $n+1$ 个，$nq_0^3=n^{1/8}$，故尾 $\le Cn^3e^{-cn^{1/8}}=:\tau_n$（`orient:336-351`），比任何固定负幂都小。中心区：Stirling 给 $p_I(q)=\sqrt{\frac{2}{\pi n(1-q^2)}}e^{-nJ(q)}(1+O(n^{-1}))$，$J(q)=\frac{(1+q)\log(1+q)+(1-q)\log(1-q)}2=q^2/2+O(q^4)$；$c_n=\sqrt{n/(2\pi)}(1+O(n^{-1}))$、$\log(1-q^2)=-q^2+O(q^4)$，相除得

```tex
 \frac{p_I(q)}{\Delta f_S(q)}
 =\exp\!\bigl(O(n^{-1}+q^2+nq^4)\bigr)=1+o(1),
 \qquad |q|<q_0,
```

$\Delta=2/n$，相对误差一致（靠 $nq_0^4\to0$）。箱（`orient:376-385`）：$q>0$ 配 $[q,q+\Delta]$，$q<0$ 配 $[q-\Delta,q]$，$q=0$ 配 $[-\Delta/2,\Delta/2]$。偶 $n$ 时原点附近格点为 $\ldots,-2\Delta,-\Delta,0,\Delta,2\Delta,\ldots$，居中的零箱在 $(\Delta/2,\Delta)$ 与 $(-\Delta,-\Delta/2)$ 留缝；奇 $n$ 时最近两点是 $\pm\Delta/2$，外箱留缝 $(-\Delta/2,\Delta/2)$。两种情形箱内部互不相交，每个 $r\in\mathcal B_q$ 有 $|r|\ge|q|$，全部箱落在 $[-q_0-\Delta,q_0+\Delta]\subset(-1,1)$。箱内 $f_S$ 的变化由 $(\log f_S)'(r)=-\frac{(n-3)r}{1-r^2}$ 控制：$|\log(f_S(r)/f_S(q))|\le Cn(q_0+\Delta)\Delta\le C(q_0+\Delta)$。于是存在确定性 $\delta_n\to0$，使对每个非负、偶、关于 $|q|$ 不减的 $h$ 有 $p_I(q)h(q)\le(1+\delta_n)\int_{\mathcal B_q}h(r)f_S(r)dr$；具体可取 $1+\delta_n=(1+e_n)e^{C(q_0+\Delta)}$。取 $h=M$，箱不相交故其和 $\le$ 全区间积分，配 $\tau_n$ 与 `eq:orientation-spherical-second-moment` 得 $\mathbb E_OI^2/S(1)^2\le1+\delta_n+\tau_n$，相对方差 $\le\delta_n+\tau_n$；无条件部分由 Chebyshev 与 $\mathbb P(\mathcal G_n^c)\to0$。

`thm:static-small-ball`（`orient:440-452`）：$\mu\{x:|v^Tx|\le b_nn^{1/3}\}\to0$ in probability。限制配分 $I_b=2^{-n}\sum_x\mathbf1_{\{|v^Tx|\le b_nn^{1/3}\}}e^{x^TWx/2}$，在 $W=O\Lambda O^T$ 表示里取 $v=Oe_1$，则 $\mathbb E_OI_b/S(1)=\sigma_\Lambda\{|U_1|\le b_nn^{1/3}\}\le CL_n^2b_n$；一次 Markov 加集中度：$\mathbb P_O(I_b/I>\varepsilon)\le\mathbb P_O(I/S(1)<\frac12)+\frac2\varepsilon\mathbb E_OI_b/S(1)\to0$，在好谱上一致；$I_b/I$ 正是要求的 Gibbs 质量，加 $\mathbb P(\mathcal G_n^c)$ 收工。补一段简单谱论证（GOE 有密度、重谱集是非零判别式多项式的零点、Lebesgue 零测），故 $v$ 的任何取法与 $Oe_1$ 只差符号，而事件 $|v^Tx|\le\cdot$ 与符号无关。$L_n$ 在 $b_n$ 之后选（`orient:455-460`）。

`prop:overlap`（`orient:493-503`）：$Q_n=\mathbb E_{\mu^{\otimes2}}q^2$，$n^{2/3}Q_n$ 依概率有界。加权二次矩恒等式（`orient:510-514`）

```tex
 \E_O\!\left[\left(\frac I{S(1)}\right)^2Q_n\right]
 =\frac1{S(1)^2}\sum_{q\in\mathcal Q_n}p_I(q)q^2M(q),
```

$q^2M(q)$ 非负偶且关于 $|q|$ 不减，故同一箱比较可用；尾部因 $q^2\le1$ 至多 $\tau_n$；球面侧 $\frac1{S(1)^2}\int q^2Mf_S=\mathbb E_{\sigma_\Lambda^{\otimes2}}(U^TV/n)^2\le Cn^{-2/3}L_n^4$，于是 $\mathbb E_O[\widehat I^2n^{2/3}Q_n]\le CL_n^4+n^{2/3}\tau_n\le C'L_n^4$。给定任意 $T_n\to\infty$ 取 $L_n=\min\{\log n,T_n^{1/8}\}$，则 $L_n^4/T_n\le T_n^{-1/2}\to0$；条件 Markov 给 $\mathbb P_O(n^{2/3}Q_n>T_n)\le\mathbb P_O(\widehat I<1/2)+\frac4{T_n}\mathbb E_O[\widehat I^2n^{2/3}Q_n]\le o(1)+CL_n^4/T_n$。$T_n^{1/8}$ 里的 $1/8$ 是 $L_n^4\le T_n^{1/2}$ 开四次方的结果，而 $L_n\le\log n$ 的上界与 §4 的要求兼容。`orient:551-568` 那一段处理"$L_n$ 随 $T_n$ 改变是否改变被研究变量的分布"，答案是 $n^{2/3}Q_n$ 每个 $n$ 只有一个固定分布（只依赖 off-diagonal disorder），改 $L_n$ 只改辅助好事件；并用阶梯 $T_n=j$（$n_j\le n<n_{j+1}$）把"对每个发散阈值成立"与"依概率有界"互转，这是我读到的一处最硬的非一致量化技巧。

`cor:covariance-scale`（`orient:571-610`）：上界取 `prop:overlap` 的阈值 $T_n=M_n^2$，配 `eq:overlap-covariance` 与 $\|\Sigma\|^2\le\operatorname{Tr}\Sigma^2$；下界取 `thm:static-small-ball` 的 $b_n=M_n^{-1/4}$，$\|\Sigma\|\ge v^T\Sigma v=\mu[(v^Tx)^2]\ge b_n^2n^{2/3}(1-B_n)=M_n^{-1/2}n^{2/3}(1-B_n)$，在 $B_n\le1/2$ 上 $\ge n^{2/3}/(2\sqrt{M_n})\ge n^{2/3}/M_n$。$M_n^{-1/4}$ 的 $1/4$ 由两头夹出：一次矩要 $L_n^2b_n\to0$（$b_n$ 不能太小），下界里 $b_n^2$ 消耗 $M_n$（$b_n$ 不能太大），四次方根把消耗压到 $\sqrt{M_n}$ 并留下因子 2。`cor:covariance-scale`（`orient:571-610`）：上界取 `prop:overlap` 的阈值 $T_n=M_n^2$，配 `eq:overlap-covariance` 与 $\|\Sigma\|^2\le\operatorname{Tr}\Sigma^2$；下界取 `thm:static-small-ball` 的 $b_n=M_n^{-1/4}$，$\|\Sigma\|\ge v^T\Sigma v=\mu[(v^Tx)^2]\ge b_n^2n^{2/3}(1-B_n)=M_n^{-1/2}n^{2/3}(1-B_n)$，在 $B_n\le1/2$ 上 $\ge n^{2/3}/(2\sqrt{M_n})\ge n^{2/3}/M_n$。$M_n^{-1/4}$ 的 $1/4$ 由两头夹出：一次矩要 $L_n^2b_n\to0$（$b_n$ 不能太小），下界里 $b_n^2$ 消耗 $M_n$（$b_n$ 不能太大），四次方根把消耗压到 $\sqrt{M_n}$ 并留下因子 2。两侧同时成立用 union bound，最后积掉辅助对角（协方差与它无关）。

## 7 dynamics：符号持续、cavity 计数与上界比较

`sec:dynamics` 的四个产出依次是 `thm:gibbs-start`、`prop:linear-scale`（于是 `thm:linear-scale`）、`prop:subexponential-upper`（于是 `thm:mixing`）与一条 remark。

### 7.1 lem:stationary-increments

(a) 逐字（`dyn:15-30`）：

```tex
\begin{lemma}[Stationary increments]\label{lem:stationary-increments}
Fix the disorder and a function $f:\{-1,1\}^n\to\R$.
Let $(X_t)_{t\ge0}$ be the continuous-time heat-bath chain with generator
$\mathcal L$, and let $(Y_k)_{k\ge0}$ be the discrete-time chain with
transition operator $P$, each started from $\mu$.  Then
\begin{align}
 \E_\mu\bigl[(f(X_t)-f(X_0))^2\bigr]
 &\le 2t\,\mathcal D_\mu(f), \qquad t\ge0,\label{eq:stationary-increments-ct}\\
 \E_\mu\bigl[(f(Y_k)-f(Y_0))^2\bigr]
 &\le \frac{2k}{n}\,\mathcal D_\mu(f),
 \qquad k\in\{0,1,2,\ldots\}.\label{eq:stationary-increments-dt}
\end{align}
Here the expectations average only over the initial configuration and
the trajectory.  In particular, if $g(x)=v^Tx$ and $\|v\|=1$, the two
right-hand sides are at most $2t$ and $2k/n$, respectively.
\end{lemma}
```

(b) 推导：平稳性与自伴给 $\mathbb E_\mu[(f(X_t)-f(X_0))^2]=2\langle f,(\mathrm{Id}-e^{t\mathcal L})f\rangle_\mu$（交叉项 $\mathbb E[f(X_t)f(X_0)]=\langle f,e^{t\mathcal L}f\rangle$ 由平稳性得到）；$-\mathcal L$ 自伴非负，在共同正交特征基展开并用 $1-e^{-t\lambda}\le t\lambda$，配 `lem:heatbath-form` 的 $\langle f,-\mathcal Lf\rangle=\mathcal D_\mu(f)$ 得连续式。离散式同理：$P$ 自伴、谱在 $[0,1]$（`model:77-79`），$2\langle f,(\mathrm{Id}-P^k)f\rangle$ 配 $1-\theta^k\le k(1-\theta)$（$0\le\theta\le1$）与 $\langle f,(\mathrm{Id}-P)f\rangle=\mathcal D_\mu(f)/n$。线性情形的 $\mathcal D_\mu(v^Tx)=\sum_iv_i^2\mu[\operatorname{Var}(x_i\mid x_{-i})]\le\sum_iv_i^2=1$（`dyn:54-58`）。

(c) 因子 2 的来源是平稳轨道的对称性：两端各贡献 $\langle f,(\mathrm{Id}-e^{t\mathcal L})f\rangle$。$2k/n$ 里的 $n$ 来自 $P$ 是 $\frac1n\sum_iP_i$，也就是"一次尝试只碰一个站点"，这一个因子把连续时间阈值 $n^{2/3}$ 与离散阈值 $n^{5/3}$ 绑在一起。$1-\theta^k\le k(1-\theta)$ 与 $1-e^{-t\lambda}\le t\lambda$ 都是一阶展开，意味着这条引理在 $t\mathcal D\gg1$ 时给出大于 2 的平凡界，因此只能在 $t=o(n^{2/3})$ 使用（那里 $2t/a_n^2\to0$）。

(d) 失败路线。其一，想用 $\|f(X_t)-f(X_0)\|_\infty$ 型有界差代替均方差：线性 $g$ 的幅度是 $n^{1/3}\cdot n^{1/2}$ 量级，无界可判。其二，想用马尔可夫不等式直接对距离做概率界：距离是转移核的泛函，不含 $\mu$ 平均，而这条引理的两个右端都带 $\mathbb E_\mu$，即必须 stationary 起始，这恰好与"逐初态"的量化冲突，解法在下一步：只对"符号是否持续"使用它，把逐初态的部分留给半空间检验。其三，把 $2t$ 换成谱隙型的 $e^{-t\lambda_1}$ 衰减：那需要 $\lambda_1$ 的下界，而本篇的结论恰是它不该有 $n^{-2/3}$ 以上的下界，路线循环。[推测] 我把它列为候选，论文没有写。

### 7.2 thm:gibbs-start 的三步

第一步（`dyn:61-99`）。给定确定性 $t_n=o(n^{2/3})$，选正确定性 $b_n\to0$ 使 $t_n/(b_n^2n^{2/3})\to0$，例子是 $b_n=(t_n/n^{2/3})^{1/4}+n^{-1}$，置 $a_n=b_nn^{1/3}$。为什么是 $1/4$ 次幂：同时要 $b_n\to0$、$t_n/(b_n^2n^{2/3})\to0$（取 $b_n=(t_n/n^{2/3})^\theta$ 则条件为 $(t_n/n^{2/3})^{1-2\theta}\to0$，需 $\theta<1/2$）与静态输入给的 $L_n^2b_n\to0$、$L_n=\min\{\log n,b_n^{-1/4}\}$（§6），即 $b_n$ 不能太快趋零；$\theta=1/4$ 是这两侧的中间点。写 $W=A+D$（零对角加独立对角），$\mu_A=\mu_W$、转移律只依赖 $A$，而 $v=v(A+D)$ 允许依赖两者。$g(x)=v^Tx$。条件在 $A,D$ 上、从 $\mu_A$ 起轨，若 $|g(X_0)|>a_n$ 而两端点投影不同号或为零，则 $|g(X_{t_n})-g(X_0)|\ge a_n$，于是 `dyn:86-90`

```tex
 \Prob_{\mu_A}\bigl(g(X_0),g(X_{t_n})
     \text{ do not have the same nonzero sign}\mid A,D\bigr)
 \le \mu_A\{|g|\le a_n\}+\frac{2t_n}{a_n^2}.
```

`thm:static-small-ball` 让第一项依概率趋零，又因它取值在 $[0,1]$，故期望也趋零，得确定性量 `dyn:94-98`

```tex
 \varepsilon_n
 :=\E_{A,D}\mu_A\{|g|\le a_n\}+\frac{2t_n}{a_n^2}
 \longrightarrow0
```

第二步（`dyn:101-122`）：先固定初态再定义检验集。$g(x)\ne0$ 时 $H_{v,x}=\{y:g(y)g(x)>0\}$，$r_n(A,D,x)=1-(e^{t_n\mathcal L}\mathbf1_{H_{v,x}})(x)$；$g(x)=0$ 时置 $r_n=1$。这个约定把所有零投影纳入失败事件。自旋翻转对称给 $\mu_A(H_{v,x})\le1/2$，故对 $g(x)\ne0$ 有 $d_{t_n}^{\rm ct}(A,x)\ge\frac12-r_n(A,D,x)$。由此得 `dyn:119-122`

```tex
 \mathbf1_{\{d_{t_n}^{\mathrm{ct}}(A,x)\le1/4\}}
 \le4r_n(A,D,x).
```

$4$ 的来历是纯代数的：$d\le1/4$ 迫使 $r_n\ge1/4$，而 $r_n\in[0,1]$，指示函数 $\le4r_n$ 在两种情形（含 $g(x)=0$ 时 $r_n=1$）都成立。阈值 $1/4$ 本身与 `model:96-99` 的 $t_{\rm mix}$ 定义同一个数，改变它会把因子 4 改成它的倒数。

第三步（`dyn:123-142`）：左边的坏态指示不依赖 $D$，右边的检验集依赖 $D$，于是可以只对左边积 $D$：$\mathbb E_A\mu_A\{x:d\le1/4\}=\mathbb E_{A,D}\mu_A\{x:d\le1/4\}\le4\varepsilon_n$，再 Markov 得 `dyn:133-138`

```tex
 \Prob_A\!\left(
   \mu_A\{x:d_{t_n}^{\mathrm{ct}}(A,x)>1/4\}<1-\delta
 \right)
 \le\frac{4\varepsilon_n}{\delta}\longrightarrow0.
```

这一顺序（用 $D$-依赖的方向检验 $D$-无关的距离，然后积掉 $D$）就是 `model:32-36` 承诺的那件事的落地。离散版本把 $2t_n/a_n^2$ 换成 $2k_n/(na_n^2)$，取 $b_n=(k_n/n^{5/3})^{1/4}+n^{-1}$；$5/3=2/3+1$ 里那个 1 是 `lem:stationary-increments` 的 $n$。

### 7.3 prop:linear-scale：cavity 与一次分块

(a) 逐字（`dyn:167-172`）：

```tex
\begin{proposition}[Linear tests]\label{prop:linear-scale}
With probability tending to one,
\begin{equation}\label{eq:linear-covariance-comparison}
 \|\Sigma\|\le\mathcal R_{\mathrm{lin}}(\mu)
 \le16\|\Sigma\|+n^{13/25}.
\end{equation}
```

(b) 推导四段。第一段（加权协方差）：$b_i=\sqrt{\alpha_i}a_i$ 换元给 $\mathcal R_{\rm lin}(\mu)=\|\Gamma\|$，$\Gamma=\operatorname{diag}(\alpha_i^{-1/2})\Sigma\operatorname{diag}(\alpha_i^{-1/2})$；下界由 $\alpha_i\le1$ 逐项确定性地成立。第二段（删一个自旋）：$\nu_i$ 是删去站点 $i$ 及其所有耦合、不重新缩放剩余耦合后的 Gibbs 律，$\bar\mu_i$ 是 $\mu$ 的对应边缘，$Z_i=\nu_i[\cosh g_i]$，$R_i=\mathbb E_{\nu_i\otimes\nu_i}[(x_{-i}^Ty_{-i}/n)^2]$。对 $x_i$ 求和给精确恒等式 $d\bar\mu_i/d\nu_i=\cosh g_i/Z_i$ 与 $\alpha_i=\nu_i[(\cosh g_i)^{-1}]/Z_i\ge Z_i^{-2}$（Jensen 于倒数函数）。$\cosh\ge1$ 与 $(q-x_iy_i/n)^2\le2q^2+2n^{-2}$ 给 `dyn:230-234`

```tex
 R_i\le Z_i^2\E_{\bar\mu_i\otimes\bar\mu_i}
           \left[\left(\frac{x_{-i}^Ty_{-i}}n\right)^2\right]
 \le2Z_i^2(Q_n+n^{-2}).
```

$\mathcal F_i$ 是删掉第 $i$ 行与列后生成的 σ-域；条件于它，$\nu_i$ 固定而入射耦合是独立 $N(0,1/n)$，故固定构型下 $g_i$ 是中心化 Gaussian、方差 $\sigma_{\rm loc}^2=(n-1)/n$。Jensen 给 $\mathbb E[Z_i^m\mid\mathcal F_i]\le\mathbb E_{G\sim N(0,\sigma_{\rm loc}^2)}[\cosh^mG]\le2e^{m^{2}/2}$；取 $m=200$ 与 union bound 得 $\mathbb P(\max_iZ_i>n^{1/100})\to0$（`dyn:247-250`）。我验算这条：Markov 给 $\mathbb P(\max_iZ_i>n^{1/100})\le n\cdot2e^{20000}\cdot n^{-200/100}=2e^{20000}n^{-1}\to0$。$m=200$ 与 $1/100$ 是一对：任何 $m>100$ 都行，因为 $e^{m^2/2}$ 是与 $n$ 无关的常数，而 $n^{1-m/100}$ 要衰减；$200$ 只是让 $n^{-1}$ 的余量明确。

合并 `prop:overlap` 得 `dyn:254-258`：$\mathbb P(E_n)\to1$，$E_n=\{\max_iR_i\le r_n\}$，$r_n=n^{-7/12}$。论文在 `dyn:259-264` 亲自把指数余量算出来：$1/12-1/50=19/300>0$，在 $\max_iZ_i\le n^{1/100}$ 与 $Q_n\le\frac14n^{-2/3+19/300}$ 上，`eq:cavity-overlap` 右端第一项 $\le r_n/2$（因为 $n^{1/50}\cdot n^{-2/3+19/300}=n^{6/300-200/300+19/300}=n^{-175/300}=n^{-7/12}$），第二项 $n^{1/50}\cdot2n^{-2}\le r_n/2$ 对大 $n$ 成立。$r_n$ 的 $-7/12$ 就是这两步拼出来的，带余量。

第三段（异常站点计数）：条件于 $\mathcal F_i$，两个剩余构型的局部场方差 $\sigma_{\rm loc}^2$、协方差 $c=x_{-i}^Ty_{-i}/n$，故 $\mathbb E[\cosh g_i(x)\cosh g_i(y)\mid\mathcal F_i]=e^{\sigma_{\rm loc}^2}\cosh c$，进而 $\mathbb E[Z_i\mid\mathcal F_i]=e^{\sigma_{\rm loc}^2/2}$、$\operatorname{Var}(Z_i\mid\mathcal F_i)=e^{\sigma_{\rm loc}^2}\mathbb E_{\nu_i\otimes\nu_i}[\cosh c-1]\le CR_i$（$|c|\le1$ 上 $\cosh c-1\le Cc^2$）。裁剪计数 $N_n=\sum_i\mathbf1_{\{R_i\le r_n\}}\mathbf1_{\{Z_i>4\}}$，用 $4-e^{\sigma_{\rm loc}^2/2}\ge4-e^{1/2}>0$ 与条件 Chebyshev 得 $\mathbb E N_n\le Cnr_n=Cn^{5/12}$；在 $E_n$ 上 $N_n=|B|$（$B=\{i:Z_i>4\}$），故 $\mathbb P(|B|>n^{1/2})\le\mathbb P(E_n^c)+Cn^{-1/12}\to0$（$5/12-1/2=-1/12$）。$4$ 这个门槛是为压过 $e^{1/2}$ 并给后面 $4^2=16$ 留一个整平方。$R_i$ 是 $\mathcal F_i$-可测的，这一点让"在 $E_n$ 上条件 Chebyshev"合法，而 `dyn:308-309` 声明没有用站点间独立性、也没有把 Gaussian 计算条件在 $E_n$ 上。

第四段（合块）：在 $\{\max_iZ_i\le n^{1/100},|B|\le n^{1/2}\}$ 上，$G=B^c$ 上 $\alpha_i^{-1/2}\le Z_i\le4$，故 $\|\Gamma_{GG}\|\le16\|\Sigma\|$、$\|\Gamma_{BB}\|\le\operatorname{Tr}\Gamma_{BB}=\sum_{i\in B}\alpha_i^{-1}\le|B|\max_iZ_i^2\le n^{1/2}\cdot n^{1/50}=n^{13/25}$。$13/25$ 是 $1/2+1/50$ 的通分结果，$16$ 是 $4^2$。交叉块由半正定在 $(u,sw)$ 处非负对一切实 $s$ 给出 $|u^T\Gamma_{GB}w|^2\le(u^T\Gamma_{GG}u)(w^T\Gamma_{BB}w)$，于是 $(u,w)^T\Gamma(u,w)\le(\sqrt a\|u\|+\sqrt b\|w\|)^2\le(a+b)(\|u\|^2+\|w\|^2)$，$a=\|\Gamma_{GG}\|$、$b=\|\Gamma_{BB}\|$，任一块为空时同式，故 $\|\Gamma\|\le16\|\Sigma\|+n^{13/25}$。最后 `thm:linear-scale` 的证明（`dyn:345-362`）用 `cor:covariance-scale` 的阈值 $M_n/32$（$32=2\cdot16$）与 $13/25<2/3$ 把加项吸成 $M_nn^{2/3}/2$。

(c) 为什么需要这一整套：`intro:246-251` 说协方差单独不够，因为 Dirichlet 分母按 $\alpha_i$ 加权每个系数，而 $\alpha_i^{-1}$ 可以在少数站点上爆炸。$n^{13/25}$ 就是这个爆炸的容许代价，它必须严格小于 $n^{2/3}$；$13/25=0.52$ 与 $2/3\approx0.667$ 之间余 $0.147$，全部来自 $|B|\le n^{1/2}$ 与 $\max Z_i\le n^{1/100}$ 这两个门槛。

(d) 失败路线。其一，逐点比较 $\Sigma$ 与 $\operatorname{diag}(\alpha_i)$：$\alpha_i$ 没有一致正下界（$Z_i$ 可大），那会把 $n^{13/25}$ 换成 $n\cdot\max_i\alpha_i^{-1}$ 级别，超过 $n^{2/3}$。其二，把异常集 $B$ 用 Chernoff 型集中证明 $|B|\le n^{1/2}$：需要 $Z_i$ 之间独立，而它们共享 $W$，`dyn:308-309` 明确不用独立性，改用条件方差加裁剪计数。其三，把 $r_n$ 取得比 $n^{-7/12}$ 更接近 $n^{-2/3}$：$\max_iZ_i$ 的多项式界带 $n^{1/50}$，$Q_n$ 的界只依概率成立，两者相加的余量 $19/300$ 就用尽，`eq:cavity-small-overlaps` 的 $\mathbb P(E_n)\to1$ 断掉。[推测] 余量是我按 $1/50$ 与 $2/3$ 反算的，论文只给了 $19/300>0$ 这一步。

### 7.4 上界：与一个固定次临界模型比较

`thm:high-temperature-gap`（`dyn:371-391`）是从 companion 引来的输入（`\cite[Theorem~1.1]{skgapcompanion}`），陈述固定 $0<\beta<1$、$J_{ij}\sim N(0,\beta^2/n)$、存在只依赖 $\beta$ 的有限 $C_\beta$ 使 $\operatorname{Var}_{\nu_J}(f)\le C_\beta\mathcal D_{\nu_J}(f)$ 以概率趋于 1 对一切 $f$ 成立，从而离散 heat-bath 谱隙至少 $1/(nC_\beta)$。`dyn:392-396` 强调 $C_\beta$ 只需在每个固定 $\beta<1$ 可用：先选 $\beta$（在所需的指数容差之后），再让 $n\to\infty$。

`lem:density-comparison`（`dyn:398-414`）：若 $0\le m\le\rho(x)/\nu(x)\le M$，则 $\operatorname{Var}_\rho(f)\le\frac MmC_\nu\mathcal D_\rho(f)$；特别地 $\rho\propto e^H$、$\nu\propto e^{\beta H}$（$\beta<1$）时可取 $M/m=e^{(1-\beta)\operatorname{osc} H}$。推导走最小二乘刻画（`dyn:417-434`）：$\operatorname{Var}_\eta(f)=\inf_c\eta[(f-c)^2]$、$\mathcal D_\eta(f)=\sum_i\inf_{h_i}\eta[(f-h_i(x_{-i}))^2]$，第二条由正交分解 $\eta[(f-h_i)^2]=\eta[(f-\eta[f|x_{-i}])^2]+\eta[(\eta[f|x_{-i}]-h_i)^2]$；密度界给 $\operatorname{Var}_\rho\le M\operatorname{Var}_\nu$、$\mathcal D_\rho\ge m\mathcal D_\nu$。这条引理刻意避开逐点比较条件核，我认为这是它能同时服务两个时钟的原因。

`prop:subexponential-upper`（`dyn:447-526`）：固定 $\epsilon>0$，选 $\beta\in(0,1)$ 使 $3(1-\beta)<\epsilon$；把高概率谱界与 $\|W\|\le3$（由 `prop:spectral` 的高概率部分）相交，得 $\operatorname{osc} H_W\le3n$ 与 $\mu_{\min}\ge2^{-n}e^{-\operatorname{osc} H_W}\ge e^{-(3+\log2)n}$；密度比较给 $\operatorname{Var}_\mu(f)\le C_n\mathcal D_\mu(f)$，$C_n=C_\beta e^{3(1-\beta)n}$。$\operatorname{osc} H_W\le3n$ 的来历：$|H_W(x)|\le\tfrac12\|W\|\cdot\|x\|^2=\tfrac12\cdot3\cdot n$，两端相减给 $3n$；于是 $3(1-\beta)$ 里的 $3$ 就是 $\|W\|\le3$ 的 $\frac12\cdot2\cdot3/2$ 组合，而 $\beta$ 的选择条件直接把这个 3 吸收进 $\epsilon$。谱衰减与 $h_x(y)=\mathbf1_{\{y=x\}}/\mu(x)-1$（$\|h_x\|^2=\mu(x)^{-1}-1$）配 Cauchy-Schwarz 得 `eq:gap-tv-ct` 与 `eq:gap-tv-dt`；令 $B_n=\log2+\tfrac12(3+\log2)n$，则 $t_{\rm mix}\le C_nB_n$、$k_{\rm mix}\le\lceil nC_nB_n\rceil$。$B_n$ 的 $\log2$ 来自要求 $\tfrac12\mu_{\min}^{-1/2}e^{-t/C_n}\le1/4$，即 $e^{-t/C_n}\le\tfrac12\mu_{\min}^{1/2}$，取对数正是 $\log2+\tfrac12\log\mu_{\min}^{-1}$。两个事件相交不需独立性；混合时间只依赖 off-diagonal，故积掉辅助对角保持结论。

`thm:mixing` 的证明（`dyn:528-546`）取 $t_n=n^{2/3-\epsilon}$、$k_n=\lfloor n^{5/3-\epsilon}\rfloor$，由 `thm:gibbs-start` 得存在慢混合初态；最坏初态距离在 Markov 核下随时间不增（TV 压缩），故 $t_{\rm mix}\ge t_n$、$k_{\rm mix}>k_n$，再由 $k_{\rm mix}$ 为整数把 $>$ 换成 $\ge n^{5/3-\epsilon}$（含 $k_n=0$ 的边界情形），与上界事件相交。`dyn:548-557` 的 remark 再钉一次线性类与全函数的分离。

## 8 附录：为何平衡模型本身给不出混合时间

`sec:specification` 是我读得最慢的一节，因为它否定的正是我进场时的默认假设：给了 Gibbs 律与可逆性，混合时间还没被定义。`prop:arbitrary-refresh`（`spec:8-28`）逐字：

```tex
\begin{proposition}[Arbitrary refresh times]\label{prop:arbitrary-refresh}
Fix any realization of the SK measure on $\Omega_n$, $n\ge2$. For every positive integer $r$, there is an irreducible, aperiodic, reversible Markov kernel with stationary law $\mu$ whose worst-state threshold-$1/4$ mixing time equals $r$.
\end{proposition}
```

构造是 $K_p=(1-p)\mathrm{Id}+p\Pi$、$\Pi(x,y)=\mu(y)$：$\Pi^2=\Pi$ 给 $K_p^k=\Pi+(1-p)^k(\mathrm{Id}-\Pi)$，$\max_x\|K_p^k(x,\cdot)-\mu\|_{\mathrm{TV}}=(1-p)^k(1-\mu_{\min})$，取 $1-p=[4(1-\mu_{\min})]^{-1/r}$ 就恰好在第 $r$ 步到 $1/4$。$\mu_{\min}\le2^{-n}\le1/4$ 保证根号里的数不超过 1，$p=1$ 时混合时间为 1。随后一段（`spec:30-31`）说明即使限制"每步最多改一个自旋"，$(1-p)\mathrm{Id}+pP$ 仍有同样的平稳律、细致平衡、不可约与转移限制，从最小质量态出发 $k$ 步距离 $\ge(1-p)^k-\mu_{\min}$，$p\downarrow0$ 时混合时间发散。这直接解释了 `thm:gibbs-start` 必须写死"rate-one-per-site"与"uniform-site attempt"这两种时钟。

`prop:two-spin` 我在 §0 的排除三里已经用过一次；这里补一处机械细节：$\theta=(1+\tanh w)/2\uparrow1$ 时 $\tfrac12\theta^k$ 对固定 $k$ 超 $1/4$，而每个有限 $w$ 的链自身混合时间有限，所以"本性上界"与"依概率的渐近界"在同一个模型里就被分开了。`spec:56` 明确它不与 `thm:mixing` 冲突。

## 9 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $s_*=n^{-2/3}$ | 固定幂 | `spectral:21` | $\sigma_j=2^js_*$ 网格、$e_3\le Cs_*$、$d_j$ 定义 | 换成 $n^{-1/2}$ 则 $\Phi_n$ 的 $(x+s_0)^{1/4}$ 与 $j\le C\log(2+e/s_*)$ 全变，临界标度消失 |
| $s_0=L_nn^{-2/3}$ | $L_n\to\infty$ 任意慢 | `spectral:21` | `lem:critical-sphere` 的 $k_j\ge c/s_0$、`eq:deterministic-traces` 的范围 | 取 $L_n$ 固定则 `orient:273` 的 $Cs_0/q_0^2$ 不再趋零，`lem:cubic-deficit` 小区间断 |
| $h_n=L_n^{1/8}$ | 慢发散 | `spectral:22` | 失败概率 $e^{-ch_n^2}$、$A_n$ 的主项 | 取 $h_n\ge o(L_n^{3/4})$ 之外则 $\eta_n\not\to0$，`spectral:476` 的 $\Phi_n$ 单调失效 |
| $A_n=h_n+\sqrt{\log(2+L_n)}$ | $=O(L_n^{1/8})$ | `spectral:23` | $\Phi_n$ 前置因子、$j\le C[\log(2+L_n)+\log(1+e/s_0)]$ | 去掉对数项则 `spectral:345-348` 的 $j$ 上界无处吸收 |
| $\eta_n=A_nL_n^{-3/4}$ | $\to0$ | `spectral:24` | `eq:phi-smallness`、`eq:denominator-comparison`、$L_n^{-3/2}+\eta_n$ | 若不趋零则分母比较 `spectral:524-529` 给不出 $(s+e_i)(1+O(\eta_n))$ |
| $L_n\le\log n$ | 上界约束 | `spectral:18-19` | $\Phi_n(4)=o(1)$、$s_0/q_0^2=L_nn^{-1/12}\to0$ | 放宽到 $n^\alpha$ 则 `spectral:519` 的 $\max_i\lvert \lambda_i\rvert \le3$ 断，§5 全部失效  |
| $C_M$（$M<\infty$ 固定） | 依赖 $M$ | `spectral:51` | 二 trace 界、`orient:288-290` 的宏观 $r_a$ 夹逼 | 要求 $M=\infty$ 一致则 `orient:289` 那句"No estimate uniform as $a\downarrow0$"被违反 |
| $R(s)=\frac{2+s-\sqrt{s(4+s)}}2$ | $1-\sqrt s+O(s)$ | `spectral:29` | `spherical:442` 的 $\sum h_i<n$、`orient:225-233` 的 margin | 取大根 $R_+$ 则 `spectral:422-425` 的根选取断，$R_D\le R$ 失效 |
| $\Phi_n(x)$ | $n^{-1/2}A_n(x+s_0)^{1/4}\sqrt{1+\log(1+x/s_0)}$ | `spectral:179-181` | `eq:eigenvalue-comparison`、`eq:trace-perturbation` | 幂 $1/4$ 改则块估计 `spectral:326` 的 $\sigma_j^{1/4}$ 对不上 |
| $e^{-cL_n^{1/4}}$ | 失败概率 | `spectral:39-41` | `orient:435`、`orient:548` 加 $\mathbb P(\mathcal G_n^c)$ | 只要求 $\to0$，改成 $n^{-A}$ 无收益但会强制 $L_n$ 有下界 |
| $1/13$ | $k_i$ 的下界 | `spherical:63` | `spherical:358`、`spherical:379`、`spherical:391-393` | 换成任何正数都可，但它必须由 $\max\lvert \lambda_i\rvert \le3$ 与 $a\le2$ 生成，改 3 就改它  |
| $p(n)\ge c/(n\sqrt{s_0})$ | 均值处密度 | `spherical:429-430` | `prop:spherical-small-ball` 的 $Cs_0/p(n)\le CL_n^{3/2}$ | 若只有 $c/n$ 则 $L_n^{3/2}$ 变 $L_n^{1/2}$，$L_n^2b_n$ 关系与 §6 选法要重推 |
| $q_0=n^{-7/24}$ | 分点 | `orient:151-152` | 尾部 $\tau_n$、中心区 `eq:orientation-local-density` | 挪出 $(-1/3,-1/4)$ 区间则 $nq_0^3\to\infty$ 或 $nq_0^4\to0$ 之一断 |
| $c=1/24$ | 立方亏损系数 | `orient:179` | $p_I(q)M(q)/S(1)^2\le Cn^2e^{-cnq^3}$ | 取 $c=0$ 则 Chernoff 的 $e^{-nq^2/2}$ 被完全抵消，`eq:orientation-tail` 断 |
| $\tau_n=Cn^3e^{-cn^{1/8}}$ | 超多项式小 | `orient:346-351` | `prop:overlap` 的 $n^{2/3}\tau_n$ | 若尾只到 $e^{-cn^{1/12}}$ 仍可，但 $n^3$ 前置需要 $nq_0^3\gg\log n$ |
| $\Delta=2/n$，$1+\delta_n=(1+e_n)e^{C(q_0+\Delta)}$ | 格点箱 | `orient:357`、`orient:414` | `eq:orientation-bin-comparison`、`prop:overlap` 加权版 | 奇偶两种留缝写法若统一，箱不相交断 |
| $CL_n^2b_n$，$L_n=\min\{\log n,b_n^{-1/4}\}$ | 小投影 | `spherical:491`、`orient:458-460` | `thm:static-small-ball`、`cor:covariance-scale` 下界 | 取 $L_n$ 固定则 $b_n=M_n^{-1/4}$ 对任意慢 $M_n$ 不可行 |
| $Cn^{-2/3}L_n^4$，$L_n=\min\{\log n,T_n^{1/8}\}$ | 平方 overlap | `spherical:546`、`orient:537` | `prop:overlap` 的 $CL_n^4/T_n$ | $1/8$ 若改成 $1/4$ 则 $L_n^4/T_n$ 不趋零，紧量化断 |
| $b_n=(t_n/n^{2/3})^{1/4}+n^{-1}$ | 分离阈值 | `dyn:73-74` | `eq:sign-failure` 的 $2t_n/a_n^2$ | 取 $\theta\ge1/2$ 则第一项不趋零；$\theta$ 太小则 $L_n^2b_n$ 不趋零 |
| $2t$、$2k/n$ | 平稳增量 | `dyn:21-25` | `eq:sign-error-average` | 因子 2 与 $n$ 若丢，$n^{2/3}$ 与 $n^{5/3}$ 的对应关系断 |
| $1/4$ 与 $4r_n$ | TV 阈值 | `dyn:119-122` | `eq:nested-gibbs-start` 的 $4\varepsilon_n/\delta$ | 阈值改 $\eta$ 则倍数改 $1/(1/2-\eta)$，$1/4$ 时是 4 |
| $\sigma_{\rm loc}^2=(n-1)/n$ | 局部场方差 | `dyn:240-241` | `dyn:273-283` 的 $\mathbb E[Z_i\vert\mathcal F_i]=e^{\sigma^2/2}$ | 若重新缩放耦合则此方差改变，$4-e^{\sigma^2/2}>0$ 的门槛要重算 |
| $m=200$、$n^{1/100}$ | $Z_i$ 的多项式界 | `dyn:247-250` | `eq:cavity-overlap`、`eq:cavity-exceptional-count` | 需 $m>100$；取 $m=101$ 则 $n^{1/100}$ 变 $n^{1/101}$，$13/25$ 要重算 |
| $r_n=n^{-7/12}$，余量 $19/300$ | 裁剪界 | `dyn:254-264` | $N_n$ 的 $\mathbb E N_n\le Cn^{5/12}$ | $r_n$ 若接近 $n^{-2/3}$ 则 $n^{1/50}$ 余量用尽，$\mathbb P(E_n)\to1$ 断 |
| $n^{13/25}=n^{1/2+1/50}$、$16=4^2$、$32=2\cdot16$ | 分块常数 | `dyn:316-324`、`dyn:347-357` | `prop:linear-scale`、`thm:linear-scale` | $13/25$ 若升到 $\ge2/3$ 则加项不能被 $M_nn^{2/3}/2$ 吸收 |
| $C_\beta$、$3(1-\beta)<\epsilon$、$\mu_{\min}\ge e^{-(3+\log2)n}$、$B_n=\log2+\tfrac12(3+\log2)n$ | 上界链 | `dyn:380-390`、`dyn:460-516` | `prop:subexponential-upper`、`thm:mixing` | $\lVert W\rvert \le3$ 改成 $\le K$ 则 $3$ 换 $K$、$\beta$ 选择条件同步改  |
| $n^{2/3-\epsilon}$、$n^{5/3-\epsilon}$ | 下界指数 | `intro:92-97`、`dyn:533-534` | `thm:mixing` 的四条同时成立 | 丢 $\epsilon$ 需要逐序列的一致版本，本篇量词不允许（`model:101`） |
| $T_{ii}\sim N(0,2/n)$、$T_{i,i+1}\sim\chi_{n-i}/\sqrt n$ | GOE 三对角化，各条目独立 | `spectral:74-76` | 其后三对角条目浓度的推导与 $\sigma_j=2^js_*$ 网格的入口 | 若把 $\sqrt n$ 改成 $\sqrt{2n}$，则 `spectral:46` 的 $\lambda_j=2+o(s_0)$ 变 $2\sqrt2$，`eq:spectral-estimates` 整条断 |
| $C(L_n^{-1}+\eta_n)$、$C_M(L_n^{-3/2}+\eta_n)$ | `eq:spectral-estimates` 两个 o 项在事件上的确定性模 | `spectral:58-60` | `eq:eigenvalue-comparison` 与 `eq:trace-perturbation` 的一致版本，§9 的 $\eta_n$ 行里 $L_n^{-3/2}+\eta_n$ 由此登记 | 松成逐点 $o(1)$ 无确定性模，`eq:phi-smallness` 对 $j$ 的联合界丢掉强度，§4 三级台阶的单调性论证在这一步断 |
| $\mathbb E\exp(t(\chi_m-\mathbb E\chi_m)/\sqrt n)\le\exp(Ct^2/n)$ 与 $0\le\sqrt m-\mathbb E\chi_m\le C/\sqrt m$ | 中心 mgf 对全体实 $t$ 成立，偏差按 $m^{-1/2}$ | `spectral:106-111` | §4 三对角条目集中步骤的两味原料，供 $\sigma_j$ 尺度的块求和 | 若 $Ct^2/n$ 松成 $Ct^2$，非对角涨落从 $n^{-1/2}$ 变 $O(1)$，`spectral:326` 的块估计合不上 |
| $\mathbb P\{\chi_m^2\ge ma\}\le(ae^{1-a})^{m/2}$ | 双侧 chi 平方 Chernoff，$0<a<1$ 下尾同右端 | `spectral:116-119` | 经 $a-1-\log a\ge(\sqrt a-1)^2$ 推出 $\chi_m$ 双侧尾，再推方差与偏差 | 下尾若没有同右端，双侧尾变单侧，`spectral:126-129` 链条从方差可控与偏差那步断 |
| $\mu_W$ 对对角块 $\tfrac12\sum_iW_{ii}$ 不敏感 | $x_i^2=1$ 恒成立，对角贡献逐配置同值、配分消去 | `model:28-31` | 协方差、heat-bath 核、混合时间只依赖 off-diagonal 无序；谱方向先保留对角再积掉 | 这条消去若不登记，§3 的 realized-start 论证就被迫对所有初始配置写死一个公共测试方向 |
| $\mathcal L=n(P-\mathrm{Id})$ | 两个时钟的精确换算因子 | `model:44-49` | `thm:gibbs-start` 里 $d_t^{\rm ct}$ 与 $d_k^{\rm dt}$ 的换算关系，`intro:38-44` 的连续与离散两条陈述 | 丢掉因子 $n$ 则两钟并成一钟，离散侧的 $o(n^{5/3})$ 会被错标成 $o(n^{2/3})$ |
| $W_{ij}\sim N(0,1/n)$（$i<j$）、$\beta=1$ 零场 | 模型输入归一化，半圆边 2 的来源 | `intro:12-13` | `prop:spectral` 引用的 GOE 归一化、局部场方差链、门槛 $4-e^{1/2}>0$ | 方差改 $1/(2n)$ 则边落到 $\sqrt2$，$R(s)$ 定义与它的 $\sqrt{s(4+s)}$ 结构同时断在选根那一步 |
| 双 replica overlap $n^{-1}x^Ty$ 的临界标度 $n^{-1/3}$ | 对照值：固定 $\beta<1$ 侧是 Gaussian $n^{-1/2}$，文献口 `duHuang2026Overlap` | `intro:20-23` | §9 的 $s_*$ 行所引的物理来源倍关系，§4 开篇临界性锚点 | 这条外部标度若登记错，$n^{-2/3}$ 变无动机断言，网格划分那节失去经验支撑 |
| $f_S(q)=c_n(1-q^2)^{(n-3)/2}$、$c_n=\Gamma(n/2)/(\sqrt\pi\,\Gamma((n-1)/2))$ | 球面双点 overlap 的精确密度，旋转定点后 beta 积分 | `orient:100-103` | `eq:orientation-spherical-second-moment` 的左端密度，$\sum p_I(q)M(q)$ 对积分的 $(1+o(1))$ 比较靠它 | $c_n$ 写错则右端从 $S(1)^2$ 变常数倍，§6 的 Haar 搬运链在二矩恒等处断 |
| $\frac{M(q)}{S(1)^2}\le Cn^2\exp\!\left(n\left[B(1+\lvert q\rvert)+B(1-\lvert q\rvert)-2B(1)\right]\right)$ | 对积分上界，`orient:139-140` 补一句 $\lvert q\rvert=1$ 端点仍适用 | `orient:135-137` | $Cn^2$ 前置因子与指数括号喂给立方亏损系数的展开 | 括号若只对 $q$ 线性，margin 压不过 $e^{-nq^2/2}$，`eq:orientation-tail` 在 Chernoff 比较那步断 |
| $\mathbb P(\lvert B\rvert>n^{1/2})\le\mathbb P(E_n^c)+Cn^{-1/12}$ | 裁剪计数走条件 Chebyshev，$Cn^{5/12}$ 除出一档 $n^{-1/2}$ | `dyn:303-306` | `dyn:313-315` 那行合并事件与 `dyn:316` 起的覆盖陈述 | $n^{1/2}$ 放宽到 $n^{1/2+\alpha}$ 则 $G=B^c$ 覆盖率缩水，`prop:linear-scale` 在 $\alpha_i^{-1/2}\le4$ 一侧丢主项 |
| `OAI.CriticalSK.covariance_and_linear_tests`、`OAI.CriticalSK.critical_mixing_bounds` | `records.txt` 里 SK 记录两条：第 40 行锚 `Rayleigh.lean`，第 41 行锚 `CriticalMixing/Main.lean`；两个 comparator JSON 的 `permitted_axioms` 同为 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 皆 false（`CriticalSK.json:10-15`、`CriticalSKMixing.json:8-13`） | `records.txt:40-41` | §10 第二、第三条错口的 Lean 锚点 | 声明名挪走则 `Rayleigh.lean:607-621` 与 `thm:linear-scale` 的配对在锚定这一步断，§10 五条错口需全部重核 |

依赖链一段（按传递方向写）。温度参数 $\beta$ 只在上界链里出现，且次序是 $\epsilon\to\beta\to n$（`dyn:459-461`、`dyn:392-396`）：$\beta$ 决定 $C_\beta$，$C_\beta$ 与 $\mu_{\min}$（由 $\|W\|\le3$ 给出 $\operatorname{osc} H\le3n$）通过 $M/m=e^{(1-\beta)\operatorname{osc} H}$ 拼成 $C_n$，$C_n$ 再经 $B_n$ 变成 $t_{\rm mix}\le C_nB_n$；$3(1-\beta)<\epsilon$ 是让整条乘积被 $e^{\epsilon n}$ 吞掉的唯一约束。谱隙下界这一侧完全不走 $\beta$：$L_n$ 决定 $s_0$，$s_0$ 决定 $k_j\ge c/s_0$ 与 $p(n)\ge c/(n\sqrt{s_0})$，二者决定 $L_n^2b_n$ 与 $L_n^4$，于是 $b_n$、$T_n$、$M_n$ 三个外部阈值各自决定一次 $L_n$ 的取法（$b_n^{-1/4}$、$T_n^{1/8}$、$M_n^{-1/4}$ 的 $1/4$），三者共用同一个 `prop:spectral` 事件因为该事件不依赖 $M$（`spectral:60`）。比较算子的常数链是 $\|W\|\le3\Rightarrow\max|\lambda_i|\le3\Rightarrow$ 球面参数 $1/13$ 与 $z_a$ 界 $\Rightarrow$ 密度比较里的 $C$ $\Rightarrow$ $M/m=e^{(1-\beta)\operatorname{osc} H}$ $\Rightarrow$ $16$（来自 $4-e^{\sigma_{\rm loc}^2/2}>0$ 的门槛 4）$\Rightarrow32$（`thm:linear-scale` 的 $M_n/32$）。这条链里最脆的一环是 4：它同时被"压过 $e^{1/2}$"与"给出整平方 16"要求，改成 3 或 5 会让 §7.3 第四段的 16 与 $n^{13/25}$ 的组合重写。

## 10 Lean 取证

条目位置：`E:\math\lean\formalization.yaml:347-350` 有题目 `Critical slowing down in the Sherrington–Kirkpatrick model`（作者 OpenAI，id 指向该 preprint 目录的 `paper.pdf`）。声明级条目两条，在 `formalization.yaml:1074-1080`：`OAI.CriticalSK.covariance_and_linear_tests`（文件 `OAI/MathematicalPhysics/CriticalSK/Rayleigh.lean`，comparator `ComparatorChallenges/CriticalSK.json`）与 `OAI.CriticalSK.critical_mixing_bounds`（文件 `OAI/MathematicalPhysics/CriticalMixing/Main.lean`，comparator `ComparatorChallenges/CriticalSKMixing.json`）。

实测数字（全部为本地 grep/wc 结果）。入口目录 `OAI/MathematicalPhysics/CriticalSK/` 有 43 个 `.lean` 文件、合计 19947 行；顶层声明 1709 条，其中 `theorem` 20、`lemma` 1299、`def` 240、`noncomputable def` 5、`abbrev` 10、`instance` 134、`structure` 1、`example` 0；另有 42 行 `noncomputable section`。`sorry`、`admit`、`native_decide` 在该目录 43 个文件中命中 0；目录内 `^axiom` 命中 0；comparator JSON 的 `permitted_axioms` 为 `propext`、`Quot.sound`、`Classical.choice`（两个 JSON 相同，`enable_nanoda` 均为 false）。`Classical.` 出现 6 次（含 `Classical.choose` 4 次），`choose` 共 19 次。tactic 词频：`rw` 1351、`have` 2442、`simp` 681、`apply` 711、`exact` 762、`positivity` 476、`intro` 513、`norm_num` 334、`linarith` 406、`ring` 358、`calc` 181、`show` 235、`let` 155、`field_simp` 111、`omega` 124、`obtain` 87、`cases` 62、`refine` 90、`induction` 27、`gcongr` 33、`decide` 7、`norm_cast` 1、`conv` 0、`aesop` 0。姊妹模块 `CriticalMixing/` 2 个文件、170 行（`Comparison.lean` 120、`Main.lean` 50）。上界一侧真正依赖的高温 companion `OAI/Probability/SKGap/` 有 556 个 `.lean` 文件、100110 行，含 `sorry` 的文件数 0，主入口 `Main.lean:112` 的 `theorem sk_main (β : ℝ) (hβ0 : 0 < β) (hβ1 : β < 1)`。

论文陈述与 Lean 陈述的错口，我按实测列五条。

其一，`thm:gibbs-start` 对应 `Equilibrium.lean:103-114` 的 `realized_equilibrium_initial_states`，它是两个分量的合取，写成 `|continuousGoodMass W (t n) - 1|` 与 `|discreteGoodMass W (k n) - 1|` 的概率趋零；`SpinModel.lean:106-110` 显示 `continuousGoodMass W t = ∑ x, if 1/4 < continuousDistance W t x then gibbs W x else 0`，即"好"是从证明者角度命名的慢混合质量，与论文的 $\mu_W\{x:d>1/4\}\to1$ 同式。量词形状一致：$t_n/n^{2/3}\to0$、$\forall n,0\le t n$、$k_n/n^{5/3}\to0$。

其二，`thm:linear-scale` 对应 `Rayleigh.lean:607-621`，参数是 $M:\mathbb N\to\mathbb R$ 加正性与 `Tendsto M atTop atTop`，四条不等式（`covarianceNorm` 与 `linearRayleigh` 各两侧）在同一集合里合取，与论文的公共区间一致。`SpinModel.lean:102-104` 的 `linearRayleigh` 是对 `a : Fin n → ℝ`、`a ≠ 0` 的 `sSup`，与 `intro:65-69` 的上确界同构。

其三，路线变化在 `thm:mixing`。论文的 `prop:subexponential-upper` 在本篇内部证明，而 Lean 的 `critical_mixing_bounds`（`CriticalMixing/Main.lean:23-38`）住在 companion 模块，由 `twoClockMixingEvent`、`temperature_close_to_one`、`fixed_temperature_poincare` 组装，后者在 `Comparison.lean:98-100` 直接调用 `SKGap.sk_main`。密度比较本身在本篇模块里有对应物（`GapMixing.lean` 的 `poincare_density_comparison`、`poincare_temperature_comparison`、`discreteDistance_gap_bound`、`continuousDistance_gap_bound`），但固定 $\beta$ 的 Poincaré 不等式在 Lean 里是外部输入，与 tex 的引用姿态一致。

其四，被加强或被削弱的假设。`prop:spectral` 的"$L_n$ 可任意慢发散、事件不依赖 $M$"在 Lean 里没有以发散序列形式出现：目录内 `L : ℝ` 出现 45 次，配合 `naturalOverlapConstant L`（`Covariance.lean:249-251`）与 `exists_spectral_failure_parameter`，指数化则走 `VariationalDefinitions.lean:27-31` 的 `ExponentInProbability (X) (a)`，即"对每个 $\delta>0$ 落在 $n^{a\pm\delta}$"。所以 Lean 版本把发散因子换成固定参数加 $\delta$ 余量，强度略低于 `thm:linear-scale` 与 `thm:gibbs-start` 的 tex 量词（后两者确实带发散序列）。维数处理也不同：tex 用 $n\ge3$，Lean 大量用 $n+1$、$n+3$、$n+4$ 的偏移（`DisorderTransfer.lean:358` 的 `goe_disorder_law` 与 `Covariance.lean:246` 的 `goeLaw (Fin (n+4)) (goeScale (n+3))`），对角增强的方差写作 $4(\text{goeScale }n)^2=2/(n+1)$（`GOESpectrum.lean:265`），与 tex 的 $W_{ii}\sim N(0,2/n)$ 之间隔着这套偏移。

其五，换了表示法与未形式化的部分。`alpha_i=\mu[\sech^2g_i]` 在目录内 `sech` 命中 0，Lean 走 `SpinModel.lean:88-89` 的 `dirichlet`（用 `siteKernel` 的转移概率直接写平方差）与 `Cavity.lean:128-163` 的 `Real.cosh`/`cavityNormalization`（对应 $Z_i=\nu_i[\cosh g_i]$）。论文常数的命中统计：`7/24` 5 次、`1/100` 57 次、`7/12` 2 次、`1/24` 12 次、`13/25` 0 次、`1/18` 0 次、`19/300` 0 次、`1/13` 0 次，说明宏观分点 $q_0$ 与 $c=1/24$ 被形式化了，而 tex 里那些"取一半余量"的中间常数（$1/18$、$19/300$）与 $1/13$ 在 Lean 中由更粗的正下界替代；`13/25` 为 0 则说明 `prop:linear-scale` 的上界在 Lean 里以别的等价形式（多半是 $|B|\max Z_i^2$ 的直接幂）出现。未形式化清单里我确认两项：附录 `prop:arbitrary-refresh` 与 `prop:two-spin` 在两个模块中都无对应（以 `refresh`、`two_spin`、`twoSpin`、`arbitrary` 检索命中 0 个文件）。另外 `LowerExponents.lean:16-42` 证明的 `critical_logSobolev_lower_bound` 与 `critical_lower_exponents`（含弛豫时间与对数 Sobolev 常数的 $2/3-\delta$、$5/3-\delta$ 下界）在本篇 tex 里只是被引用给 companion（`intro:185-189`），也就是说 Lean 目录覆盖的定理集合比本篇 tex 更宽。

## 11 检索所得与论文口径分栏

论文口径（只在 tex 里）：SK 的 heat-bath 动力学在 $\beta=1$ 处，逐实现平衡初态有 $n^{2/3}$（连续）与 $n^{5/3}$（尝试次数）的下界；协方差与线性逆 Rayleigh 商的公共标度是 $n^{2/3}$；最坏初态混合时间夹在 $n^{2/3-\epsilon}$ 与 $e^{\epsilon n}$ 之间；上界侧引固定 $\beta<1$ 的 companion Poincaré 结果；`intro:173-180` 记录 Wang 的固定 $\beta<1/2$ 最坏初态 $O_\beta(n\log(n/\varepsilon))$ 混合、Boban-Li-Oveis Gharan 的 $\beta<1/2+\varepsilon_0$ 常数未缩放谱隙与 $O(n^2)$ 混合；`intro:101-128` 记录 Kirkpatrick-Sherrington 1978 的线性化平均场自相关、Sompolinsky-Zippelius 的关联-响应方程与软自旋 Langevin、Billoire-Campbell 的 $n^{2/3}$ 数值标度、Kosterlitz-Thouless-Jones 的谱边定位、Comets 的一次矩恒等式、Baik-Lee 与 Landon 的球面自由能、Bhattacharya-Sen 的 $1\pm q$ 二矩约化。

检索所得（我自己的上网查询，与上面分开，不得当作论文结论）：我跑的查询是 SK 谱隙与混合时间、Ben Arous-Gui-Gong 类谱隙结果、Parisi/1RSB 自由能密度、平均场临界慢化指数。返回结果里可读的一手文本有限，多为综述页与讲座页；命中项包括 YMSC 概率讲座页"Spectral gap and two point functions for spin glass models"（2023-12-21，与 Ben Arous 一系报告主题相邻）、arXiv 2510.12678v2 的引言页、SIAM 期刊上经谱无关性得到 Glauber 快速混合的论文页，以及 ScienceDirect 的 Spin Glass 综述条目与若干模拟研究页（自旋玻璃关联长度增长放缓、平均场 Ising Glauber 动力学的 cut-off 与临界幂律条目）。[推测] 我据此推测：物理文献里临界慢化通常报一个动态指数 $z$（平均场 Langevin 情形常写成 $z=2+\theta$ 一类形式），而本篇给的 $2/3$ 与 $5/3$ 是"未缩放时间/尝试次数"的标度，两种口径之间要过一个 $\log$ 与"每站点速率 1"的换算，不能直接对照。[推测] 我还推测 Luenberger-Sly 型 SK 高温 Glauber 混合结果落在本篇引用的 Wang 与 Boban-Li-Oveis Gharan 之前的高温带上（$\beta<1/2$ 一侧），本篇的下界机制（谱方向投影的符号持续）在高温处应当失效，因为此时 $n^{2/3}$ 标度让位于 $n$ 的线性时间；论文没有讨论这点，所以我只在检索口径下陈述。

## 12 我自己最不放心的一节到哪一节

第一薄的是 §6 的 $c=1/24$ 与箱比较之间我没有真正验证的兼容性：`eq:orientation-bin-comparison` 对 $h=M$ 使用时要求 $|r|\ge|q|$ 的"向外"方向与 $M$ 关于 $|q|$ 不减同时成立，我在奇 $n$ 的原点箱上只核对到留缝 $(-\Delta/2,\Delta/2)$，没有写出该箱对 $h(r)=r^{2}M(r)$ 这种带权情形下 $|r|\ge|q|$ 是否处处成立（原点箱里 $|r|$ 可以大于 $|q|=0$，方向没问题，但 $q=\pm\Delta/2$ 的箱会伸到 $|\cdot|>\Delta$ 一侧）。论文在 `orient:416-417` 用"最外箱可以越过 $q_0$，因为比较积分在整个 $[-1,1]$ 上"处理掉外层，内层的对称性我依赖的是 `orient:90-96` 的偶性，这一步我只做了纸面验证。

第二薄的是 §7.3 里 $n^{13/25}$ 与 $16\|\Sigma\|$ 的分块合并：交叉块不等式我按 `dyn:325-338` 复核了 $(u,sw)$ 处的非负性，但"任一块为空时同式"那句我只能在 Lean 里找证据，而 Lean 端 `13/25` 命中为 0（§10 其五），说明那边的写法与此处不同，我没法确认两种写法在同一假设下等价。

第三薄的是 §10 其四：$L_n$ 发散序列与固定参数加 $\delta$ 的等价性我只证了一半。发散序列版本推出固定参数版本显然，反向要能从 $\delta$ 余量里构造出任意慢的发散因子，我在 tex 里能看到这种构造的空间（`intro:78` 那句 $M_n$ 可任意慢），但 Lean 端有没有等价的 `Tendsto M atTop` 型谱事件版本，我检索过 `ExponentInProbability` 与 `L : ℝ` 两类写法，没有找到 `prop:spectral` 的发散序列镜像，因此本篇 Lean 覆盖在谱事件这一层确实比 tex 弱一档。

