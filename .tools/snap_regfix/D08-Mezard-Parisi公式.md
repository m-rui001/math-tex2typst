# D08 · 稀释自旋玻璃的 Mézard–Parisi 公式：反推笔记（深版）

> 依据：论文 tex（11 节 2692 行：model/overview/trees/upper/cavity/perturbations/decorrelation/comparison/reduction/consequences）、5 页 reasoning summary。[推测] 标注反推成分。

引文行号形如 `trees:84`，指 `build/sections/trees.tex` 第 84 行；summary 的引文一律逐字抄自 `E:\math\reasoning_traces\mezard-parisi-formula.tex`（211 行，可直读，同目录 pdf 已加密），标 `sum:行号`。论文正文我只从 tex 取，逐字引用的tex 用代码块原样保留，行内数学符号按论文写法。素材来源 `研究笔记\素材\MezardParisi-素材.md`（四节：定理总览、逐引理带批注重构、summary 时间线、常数与参数表）全部读完并吸收，其 §二 的 (a)(b)(c)(d) 四段式是我下面各节骨架的原型。

记号与论文一致：$m_d$ 是指数网格、$\delta=1/L$、$\gamma_\beta=m_{d_\beta}-n_\beta m_{d_\beta+1}$ 是内部顶点的树密度指数、$\kappa(S)$ 是规定参考树的总扩展系数、$Q_k$ 是 $k$ 叶树的抽样律、$\mathscr F_d$ 是深度 $d$ 的前缀 sigma 域、$\mathcal A_{L,\eta}$ 是未归一化深度平均算子、$v_N(S,d)$ 是逐点条件协方差的平方、$R_S$ 是 multioverlap。这一版把每个关键引理补成四段：逐字引用原陈述、推导补到中间步骤、常数与阶数的机械理由、候选失败路线与其卡点。

Lean 一侧本篇没有条目（检索证据与判据在第 10 节）。

## 0. 出发点：先花力气找反例，一无所获本身就是信息

Mézard–Parisi 2001 的层次 cavity 图像给出的公式 lim F_N = inf_{r≥0} Φ_r（有限层级 trial 泛函的下确界）在 Panchenko–Talagrand 的插值上界一侧早已成立，缺口全在下界。我的研究从反例搜寻开始：非可积的因子化常数、非对称场、贴近正性边界的相互作用、发散的消息。summary 的记法是"**None yields one**"。常数相互作用反而成了归一化检验；a 无可积性不构成反例（上界归一化技巧消去它）。找不到反例把问题从"公式对不对"翻转成"下界为什么在这么大的函数类上都成立"。

先把这条缺口的历史刻度钉住，否则后面所有的力气都看不出贵在哪里。`introduction:13-22` 原文：

```tex
The Viana--Bray model is a classical diluted two-spin
model~\cite{VB85}. M\'ezard and Parisi~\cite{MP01} developed the
hierarchical cavity picture for the fixed-connectivity Bethe-lattice
spin glass, with an explicit one-step replica-symmetry-breaking
functional. Franz and Leone~\cite{FL03} adapted Guerra's
interpolation method~\cite{Guerra03} to diluted systems and obtained
replica-symmetric and one-step pressure bounds for even-arity models.
Panchenko and
Talagrand~\cite{PT04} then proved the arbitrary finite-level
hierarchical upper bounds considered here.
```

我的读法：MP01 给出的是**显式一阶**泛函（1RSB），Franz–Leone 只把 RS 与 1-step 两层做成严格上界，PT04 把上界推到任意有限层级，而"这些上界的下确界就是压强"这一步停在猜想位置（`introduction:24-26`："We prove that the infimum of these bounds is the limiting pressure. This resolves the equality conjecture stated immediately after Theorem~4 of Panchenko--Talagrand"）。所以本文要证的东西在量词上很具体：上界对每个有限 r 都已知，我要给的是同一批 trial 律上的**下界**，且 r 必须能任意大。

被断言的对象逐字如下（`model:130-136`）：

```tex
\begin{theorem}\label{main:theorem}
Under \eqref{model:integrability}--\eqref{model:positivity}, the thermodynamic
limit exists and
\begin{equation}\label{main:formula}
 \lim_{N\to\infty}F_N=\inf_{r\ge0}\Phi_r.
\end{equation}
\end{theorem}
```

紧接着的两行限定我抄下来贴在桌前（`model:138-140`）："The right side is an infimum over finite hierarchies. The theorem does not assume that a trial law attains it or that a limiting infinite-depth..."（下一词被省略号截住的部分是 hierarchy/Gibbs 态相关的断言，见 §1 末尾我对单调性的处理）。它的意义是：证明**不需要**构造无限层级对象，也不需要极值存在性。这一条自由度和一条负担同时到手：自由度是我可以只用固定 L 的有限树演算；负担是下确界不被任何单层达到时，我必须在 L→∞ 之后仍然守住不等式，而每一步的误差界都不许依赖 L 的一致性。

障碍本体在 `introduction:65-73`，我把这段逐字抄回来，因为它是本篇所有"信息载体"选择的根据：

```tex
The main obstacle is the distribution of spins seen across several
replicas, that is, several samples from the same Gibbs system. The
probability of each replica-spin pattern depends on products of every
subset of those spins. The spatial average of such a product is a
\emph{multioverlap}; pair overlaps alone do not determine all these
patterns. This is the information isolated by the spin-distribution
approach~\cite{Pan13}. To compare a cavity insertion with independent
hierarchical messages, we must control all finite multioverlaps before
redrawing the message roots independently.
```

summary 第一段的第一句就是这个缺口的另一种说法：pair-overlap 超度量性（Panchenko 有限 RSB 分析提供的自旋分布识别工具）不足以决定稀释系统需要的 multioverlap，于是我要控制的量从一开始就是全部有限子集乘积的空间平均，两副本重叠决定不了它。`tree:44-47` 给了它的定义式：

```tex
R_S=\frac1N\sum_{i=1}^N\prod_{a\in S}\sigma_i^a,
 \qquad R_\varnothing=1.
```

倒数第二句 "we must control all finite multioverlaps **before** redrawing the message roots independently" 的 before 我要标出来：这是全文的极限次序纪律的第一次出现，先集中 multioverlap、再换独立 trial 根，顺序反了就会把还没控制的量当成已知的。

第二条死路：多位点 cavity 共享随机性，条件于层次表示中全体位点共享的变量、希望得到独立位点消息。summary 的自省一字未改："Aha recursive structure: **overfitting shared variable can simulate original model at smaller scale.**"（`sum:162`）共享随机性会自适应于抽到的位点，逐点大数律给不出一致比较，pinning 可能选错权重的态。第三条：Bayesian 设置迁移失败："The Bayesian setting does not transfer automatically: posterior-sampled observations and fractionally weighted observations have different laws."（`sum:164`，Mourrat–Panchenko 富化高斯场与 Hamilton–Jacobi 观点启发但不迁移）。第四条：借 Barbier–Panchenko 的 multioverlap 恒等式，"Higher products are harder: their coefficients alternate in sign, dummy anchors cancel, and conditional projections cannot simply be inserted as arbitrary test functions."（`sum:166`）。第五条（贯穿最久的）：**"recovering a whole prescribed shape requires division by products of small exponent gaps. Coarse partitions and equal-exponent refinements repeatedly encounter the same problem: available continuity errors are too large after that division."**（`sum:168`）恢复整棵指定树形状要除以小指数间隙的乘积，除完误差爆炸。第六条：精确 purity 断言太强："hidden Poisson–Dirichlet clustering inside a strict strict exponent jump can retain nontrivial overlap variation"（`sum:171`）。

这四条我想逐条写下"它到底在哪一步停住"，因为把它们只当作失败故事读会丢掉信息量。

死路二停在**权重的可辨识性**上。如果我条件于共享的层级变量 $\eta_0$（把它当成"这一批位点公共的簇结构"），那么抽到的 $N$ 个位点消息在给定 $\eta_0$ 下独立，逐点大数律确实给我 $\frac1N\sum_i(\cdot)\to\mathbb E[\cdot|\eta_0]$。但 $\eta_0$ 本身是我为了拟合这 $N$ 个位点而抽的：它可以通过把质量集中到抽到的那些消息上来降低 $\mathbb E\log T_0V_{\rm s}$，也就是 summary 说的"能模拟更小尺度的原模型"。此时经验测度与 $\eta_0$ 的对角耦合使 $\mathbb E[\cdot|\eta_0]$ 与位点层面的经验量之间的比较没有一致误差界；pinning（用外部场挑态）挑出来的态权重由 $\eta_0$ 的自适应性决定，与 cavity 比较需要的权重不相容。本文的绕法是把这一层彻底放弃：`cavity.tex` 里物理无序（计数、交互、场、扰动类型与位点）全程 quenched 进根变量，只有**辅助消息**在幂平均的条件期望里被积分掉（`model:97`："Only auxiliary messages are integrated in these conditional expectations."），最后用 `comp:encoding` 的**单点**编码把共享结构的自由度收成一个位点的整条条件律链。共享变量的过拟合问题就变成"一个位点的层级律是什么"，而这个律由鞅与集中控制，不参与拟合。

死路三停在**观测测度**这一层。Bayesian 推断文献里的 multioverlap 恒等式（Barbier–Panchenko）建立在后验抽样观测上，观测律是乘积测度乘似然再归一化；本文需要的是"分数加权"的观测，即权重带 $m$ 次幂的 cavity 平均（`model:92-95` 的 $T_d$），两者的单观测律不同，任何直接把后验恒等式当已知的推导会在归一化常数上失配。解法是自建扰动族：$\psi_\nu=1+t_\nu g\sigma_i+u_\nu g_0S_0$，$t$ 专职探测 Taylor 展开、$u$ 专职求导产生集中，角色分离（见 §4）。

死路四停在**测试函数的插入权限**。恒等式给的是带号扩展和 $\sum_Ec_E\,\mathbb E[fR_E]$，我想把它变成普通协方差估计就需要把条件投影 $\mu_{d,S}$ 塞进 $f$ 的位置；但 $f$ 在 canceled-anchor 展开里必须是"旧树上固定的、不依赖插入参数的有界函数"（`trees:279-281`："Let $H$ be a bounded function of the variables on the old tree, fixed as the insertion parameters vary."），条件投影同时依赖旧树与前缀，直接代入会让求导多出的 $\partial_tH$ 项破坏系数。三副本平方差（`decor:contractions`）与归纳恒等式（§5）就是为了绕开这个权限问题：我只要 $\mathbb E[f(a\cdot b-a\cdot b_\ell)]$ 这种两侧同边际的差，$f$ 保持旧可观测量。

死路五停在**除法的成本**，它是本篇的心脏，机械形态我在 §2 与 §5 分别用 charging 引理和归纳恒等式展开：绝对系数和 $\sum_E|c_E|$ 在无约束步上是 $2(q+k)$ 量级（`trees:418-421`），而规定树的带号归一化 $\kappa(S)$ 在均匀网格上有 $b$ 个 $j=1$ 因子、每个恰为 $-\delta$，所以 $|\kappa(S)|\le\delta^b$。除完之后误差是 $\delta^{-b}$ 乘绝对和，除非绝对和本身也以 $\delta^b$ 衰减，否则什么都得不到。粗划分与等指数细分之所以反复卡住，是因为它们的连续性误差是 $O(1)$ 或 $o(1)$ 但**不含 $\delta^b$ 因子**，除以 $\delta^b$ 后不消失。

死路六停在**目标强度**。我想断言"严格指数跳跃内条件均值向量聚簇"（purity），这在数学上过强：跳跃内部仍可藏 Poisson–Dirichlet 型聚簇，留下非零的 overlap 变化。可证的强度是 $\mathbb E(X\cdot Y-X\cdot Z)^2\ge\frac2{N^2}\mathbb E\sum_{ij}C_{ij}^2$ 这种把平方协方差换成可测差的不等式（`decor:three-copy-bound`），也就是"能被证的"与"能用于比较的"两条线的交点。

转折在 summary 第 2 页（全文最重要的一段，`sum:173`）："The change is to **shift every internal branching depth of the target tree by one level**. These shifted splits avoid the old tree's branching depths. Each new branching vertex must then pay a small fresh-divergence factor, matching the small factor in the prescribed shape's normalization." 目标树每个内部分支深度 +1，新分支点避开旧树深度，每个付一个小 fresh-divergence 因子 δ，与归一化系数（κ(S⁺) 的 j=1 因子 −δ）精确配平。紧接着的自我警告（`sum:176`）："Great! Need carefully prove **average error little with shifted depths not rare**" 两个保留任务分别落在鞅能量 C/L（深度连续性）与 Q_k regular 性（深度平均的合法性）。极限次序的自白（`sum:178`）："errors in fixed-depth identities disappear before the hierarchy is refined."

我把这个转折的算术内核在这里先做一次最小例子，因为它在 §2 的 motivating 计算（`trees:317-332`）里只有三行，而这三行是整篇的胚胎。设旧树有两条路径在深度 $d$ 分裂、锚是第一条，我要加一个颜色并要求它**恰在 $d$** 与锚分裂。允许的选择与系数（`trees:261-269` 的规则：旧叶系数 $1$，从内部顶点 $\beta$ 生 fresh path 系数 $\gamma_\beta=m_{d_\beta}-n_\beta m_{d_\beta+1}$）：用第二条旧叶，系数 $1$；在深度 $d$ 那个顶点（此时子数 $n=2$）fresh 分裂，系数 $m_d-2m_{d+1}$；沿第二条旧路径下到深度 $\ell>d$ 再离开，系数 $m_\ell-m_{\ell+1}$。总和逐字是 `trees:323-327`：

```tex
  1+(m_d-2m_{d+1})
       +\sum_{\ell=d+1}^{L-1}(m_\ell-m_{\ell+1})
  =m_d-m_{d+1}.
```

带号和是 $m_d-m_{d+1}$，均匀网格上 $=-\delta$；而绝对值和是 $1+(2\delta-\delta)+(1-\delta)\cdot$... 论文直接把数写出来了（`trees:328-330`）："On the uniform mesh $m_d=d/L$, with $\delta=L^{-1}$, this signed total is $-\delta$, but the sum of absolute coefficients is $2+\delta$." 若把要求的分裂**推迟一层**到 $d+1$（旧树在那处是 unary，$n=1$），唯一允许选择是那次 fresh 分裂，系数 $-\delta$，绝对和也是 $\delta$（`trees:330-332`）。同一条恒等式，同一个归一化因子量级，绝对和从 $O(1)$ 掉到 $O(\delta)$。论文在 `trees:333-335` 明说这两个引理就是把这一段推广："the first computes signed totals, and the second controls absolute sums when specified splits occur away from old branching depths."

我读到这里最震动的一点是：**恒等式是免费的，误差才是花钱的**。带号系数由 telescoping 决定、与我选什么深度无关；我能设计的只有"目标深度集合与旧树分支深度集合是否相交"。归一化里出现 $\delta$，除法就要在绝对值上也拿到 $\delta$，两件事只能靠几何对齐同时满足，靠估计不可能。

## 1. 模型与泛函（model.tex）

模型：Poisson(αN) 个 p 元（偶）相互作用 −H_N(σ)=Σθ_k(σ_{i_{1,k}},…)+Σh_iσ_i，一阶矩可积 EB(θ)+E|h|<∞；因子化 e^θ=a(1+b∏f_ℓ(s_ℓ))、|b∏f_ℓ|<1；正性 E[(−b)^n]≥0。**a 可以依赖表示中所有其他变量、不对 log a 做可积性假设**，这是 PT 原始框架的松弛，上界用归一化消掉它。trial 泛函：消息空间 𝓜₁=𝒫(ℝ)、𝓜_{j+1}=𝒫(𝓜_j)；V_s=½Σ_ε exp(hε+ΣU_{θ_j}(…;ε))、V_e=C_θ(…)；幂平均 T_dV=(𝔼[(T_{d+1}V)^{m_{d+1}}|𝓕_d])^{1/m_{d+1}}（条件期望只对辅助消息、物理无序保持 quenched，"哪些变量在条件里"是全部上下界记账的基础）；B_r=log2+𝔼logT₀V_s−α(p−1)𝔼logT₀V_e。**下界只用有界+置换不变**（"Neither the factorization nor the positivity assumption is used in the lower bound"）。[推测]正性条件只进上界这一不对称，很可能正是该猜想二十多年没人攻克的结构原因：下界在更大的函数类上成立、上界靠特殊结构。

现在把这一节摊开。我要的三件事是：泛函的逐字形式、$r=0$ 与 $r=1$ 的显式形状（1RSB 变分步）、以及空腔场递归到底写在论文的哪一处。

**（a）逐字引用。**先验松弛的原文（`model:43-44`）：

```tex
The multiplier $a$ may depend on all the other variables in
the representation; no separate integrability of $\log a$ is assumed.
```

cavity 量的定义与它们的界（`model:54-66`）：

```tex
For $x\in\R$ let $q_x(s)=e^{xs}/(2\cosh x)$. Define
\begin{align}
 C_\theta(x_1,\ldots,x_p)
 &=\sum_{s\in\{-1,1\}^p}e^{\theta(s)}\prod_{\ell=1}^p q_{x_\ell}(s_\ell),
 \label{model:edge}\\
 U_\theta(x_1,\ldots,x_{p-1};\eps)
 &=\log\sum_{s\in\{-1,1\}^{p-1}}
 e^{\theta(s_1,\ldots,s_{p-1},\eps)}
 \prod_{\ell=1}^{p-1}q_{x_\ell}(s_\ell).
 \label{model:site-message}
\end{align}
Both $\abs{\log C_\theta}$ and $\abs{U_\theta}$ are bounded by $B(\theta)$,
uniformly in the messages.
```

链与两个被平均的量（`model:72-76`、`model:85-88`）：

```tex
 \eta_0^\omega\sim\zeta,\qquad
 \eta_{d+1}^\omega\mid\eta_d^\omega\sim\eta_d^\omega\ (0\le d\le r-2),
 \qquad x^\omega\mid\eta_{r-1}^\omega\sim\eta_{r-1}^\omega.
```
```tex
 V_{\rm s}&=\frac12\sum_{\eps=\pm1}
 \exp\left(h\eps+\sum_{j=1}^k
 U_{\theta_j}(x_1^j,\ldots,x_{p-1}^j;\eps)\right),\label{model:vs}\\
 V_{\rm e}&=C_\theta(x_1,\ldots,x_p).\label{model:ve}
```

幂平均、泛函、$r=0$ 与逐点界（`model:92-99`、`model:112-120`、`model:125-128`）：

```tex
 T_rV=V,\qquad
 T_dV=\left(\E[(T_{d+1}V)^{m_{d+1}}\mid\mathscr F_d]\right)^{1/m_{d+1}}
 \quad(d=r-1,\ldots,0).
```
```tex
Only auxiliary messages are integrated in these conditional expectations.
For example, at depth one,
$T_0V=(\E_x[V^{m_1}\mid\boldsymbol\eta_0])^{1/m_1}$.
```
```tex
 \cB_r(\zeta,\mathbf m)
 =\log2+\E\log T_0V_{\rm s}
 -\alpha(p-1)\E\log T_0V_{\rm e},
 \qquad \Phi_r=\inf_{\zeta,\,\mathbf m}\cB_r(\zeta,\mathbf m).
```
```tex
At $r=0$, the messages are independent with common law
$\zeta\in\mathcal P(\R)$ and the operators $T_d$ are omitted; this defines
$\cB_0(\zeta)$ and $\Phi_0$.
```
```tex
 \abs{\log T_0V_{\rm s}}\le\abs h+\sum_{j=1}^k B(\theta_j),
 \qquad \abs{\log T_0V_{\rm e}}\le B(\theta).
```

下界一侧假设的原文（`cavity:11-14`）：

```tex
Until \cref{reduction:section}, assume that $B(\theta)\le B$ and
$|h|\le H$ almost surely and that the law of $\theta$ is invariant under
permutations of its $p$ coordinates. Neither the factorization nor the
positivity assumption is used in the lower bound.
```

层级与深度的对应关系是我后面所有"步数"讨论的锚（`cavity:16-19`）："Fix $L\ge2$ and use $r=L-1$ auxiliary levels with $m_d=d/L$ $(0\le d\le L)$, $\delta=1/L$." 加上 `trees:24-27`："In an $r$-level application, $L=r+1$: depths $1,\ldots,r$ carry auxiliary variables, and depth $L$ carries a Gibbs spin configuration." 也就是说论文的 $L$ 与泛函的 $r$ 差一层，最深那层留给自旋，这是 $\gamma_\beta$ 的出边指数取 $m_{d_\beta+1}$ 而终端取 $m_L=1$ 的原因。

**（b）推导补全。**先补两个界，论文只写了结论。

界 1，`model:65-66` 那句 "$|\log C_\theta|$ 与 $|U_\theta|$ 都被 $B(\theta)$ 界住，对消息一致"。对 $C_\theta$：$\prod_{\ell=1}^pq_{x_\ell}(s_\ell)$ 是 $\{-1,1\}^p$ 上的乘积测度（每个 $q_x$ 规范和为 1），所以 $C_\theta=\sum_se^{\theta(s)}\pi(s)$ 是 $e^{\theta(s)}$ 对概率 $\pi$ 的期望，落在 $[\min_se^{\theta(s)},\max_se^{\theta(s)}]\subset[e^{-B},e^{B}]$，取 $\log$ 得 $|\log C_\theta|\le B(\theta)$，且完全与 $x$ 无关。对 $U_\theta$：先固定 $\eps$，$\sum_{s\in\{-1,1\}^{p-1}}e^{\theta(s,\eps)}\prod_{\ell<p}q_{x_\ell}(s_\ell)$ 同样是 $\{e^{\theta(s,\eps)}\}_s$ 的凸组合，界在 $[e^{-B},e^{B}]$，取 $\log$ 落在 $[-B,B]$；外层对 $s$ 已经求和、无额外归一。这两界是"消息可以任意野，泛函仍有限"的全部来源。

界 2，`model:126-127` 的 $|\log T_0V_{\rm s}|\le|h|+\sum_{j=1}^kB(\theta_j)$。写 $A_\eps=h\eps+\sum_{j=1}^kU_{\theta_j}(\cdot;\eps)$，则 $|A_\eps|\le|h|+\sum_jB(\theta_j)=:C$。上界：$V_{\rm s}=\frac12\sum_\eps e^{A_\eps}\le\frac12\cdot2e^{C}=e^{C}$。下界要用 $\frac12$ 配 $\frac12$ 的对数凸性：$\frac{e^{A_+}+e^{A_-}}2\ge e^{(A_++A_-)/2}\ge e^{-(|A_+|+|A_-|)/2}\ge e^{-C}$。所以 $|\log V_{\rm s}|\le C$ 双侧成立，$V_{\rm e}$ 由界 1 直接给 $|\log V_{\rm e}|\le B(\theta)$。剩下的一步是幂平均保逐点界：若根可测的 $a\le V\le b$，则 $a^{m}\le\mathbb E[V^m|\mathscr F_d]\le b^{m}$，开 $1/m$ 次仍夹在 $[a,b]$，逐层向上传递（`trees:107-110` 的单调性陈述是同一件事的树版本）。这条界解释了 $\frac12$ 那个因子为什么长在那里：$k=0$ 时 $V_{\rm s}=\cosh h$，$\log2+\mathbb E\log V_{\rm s}=\mathbb E\log(2\cosh h)$，恰是无交互单点配分函数，泛函退化成逐点自由能。

1RSB 变分步。取 $r=1$，$\zeta\in\mathcal M_2=\mathcal P(\mathcal P(\mathbb R))$，$0<m_1<1$。链是"每个标签先抽一个随机的场分布 $\eta_0\sim\zeta$，再从 $\eta_0$ 抽场 $x$"（`model:77-78` 原文："At $r=1$, this means that each label first draws a random probability measure $\eta_0$ with law $\zeta$, then draws $x$ with law $\eta_0$."）。把 $T_0$ 摊开：

$$T_0V_{\rm s}=\Big(\mathbb E\big[V_{\rm s}^{m_1}\mid\boldsymbol\eta_0\big]\Big)^{1/m_1},\qquad \mathcal B_1(\zeta,m_1)=\log2+\mathbb E\log\Big(\mathbb E_{\mathbf x\mid\boldsymbol\eta_0}V_{\rm s}^{m_1}\Big)^{1/m_1}-\alpha(p-1)\,\mathbb E\log\Big(\mathbb E_{\mathbf x\mid\boldsymbol\eta_0}V_{\rm e}^{m_1}\Big)^{1/m_1}.$$

这里 $\mathbf x$ 收集所有带不同标签的消息（$k$ 条边各 $p-1$ 个、加 $V_{\rm e}$ 的 $p$ 个），它们在给定 $\boldsymbol\eta_0$ 下独立同分布于 $\eta_0$，而 $h,\theta_j,k$ 属 $\mathscr F_0$、在条件期望里**不动**。变分的结构因此是嵌套的两层平均：内层 $\mathbb E_{\mathbf x|\eta_0}$ 带 $m_1$ 次幂（簇内态的分数加权），外层 $\mathbb E\log$ 不带幂（簇间自由能相加）。$m_1$ 的两个端点把物理含义说清楚：$m_1\to1^-$ 时 $(\mathbb E[V^{m_1}])^{1/m_1}\to\mathbb E[V]$，即按权重线性叠加配分函数；$m_1\to0^+$ 时 $(\mathbb E[V^m])^{1/m}\to\exp(\mathbb E\log V)$，即自由能（对数）平均。$m_1$ 就是这个插值的刻度，"变分步"是在 $\zeta$（场分布的分布）与 $m_1$（插值位置）两个方向上下确界。$r=0$ 时 $T$ 全被省掉，外层 $\mathbb E\log$ 直接吃 $V_{\rm s}$，即 RS：一个固定的非随机场律 $\zeta\in\mathcal P(\mathbb R)$，只有位置平均、没有簇结构。

空腔场递归。论文没有把这个递归单独立名，它藏在 $q_x$ 与 $\frac12\sum_\eps$ 的形式里，我把它推出来核对：一个位点在给定入现场 $\{x_\ell^j\}$ 与新自旋 $\eps$ 下的对数权重是 $A_\eps=h\eps+\sum_jU_{\theta_j}(x_1^j,\ldots,x_{p-1}^j;\eps)$，于是该位点被更新后的**单点律**是 $\propto e^{A_\eps}$。而消息的定义是 $q_x(s)=e^{xs}/(2\cosh x)$，它的对数几率 $[\log q_x(+1)-\log q_x(-1)]=2x$。所以新场为

$$x_{\rm new}=\frac{A_+-A_-}{2}=h+\frac12\sum_{j=1}^k\Big(U_{\theta_j}(x^j_\bullet;+1)-U_{\theta_j}(x^j_\bullet;-1)\Big),$$

配 $\langle\sigma\rangle=\tanh x_{\rm new}$。这个 $\tanh/\operatorname{arctanh}$ 对偶正是 `comp:encoding` 用 $x=\operatorname{arctanh}\langle\sigma_i\rangle$ 做编码的理由，我在 §6 会回到它：论文把"场"实现成"单点自旋律"（`model:49`："A message $x$ specifies a probability distribution on one spin."），编码因此必须在终末自旋转移**之前**取值。层级化之后，这个递归外面套的不是普通期望，是 $T_d$，也就是簇内 $m$ 加权、簇间对数相加的交替；MP01 的 1RSB 泛函与 PT 的有限层级上界写的是同一组式子（`trees:8-10` 承认 power-mean 计算见 MP01 Appendix A 与 PT §5，级联权重来自 Ruelle）。

机械理由，为什么允许的参数类是 $0<m_1<\cdots<m_r<1$ 加 $m_0=0,m_L=1$。$Q_k$ 的抽样规则（`trees:213-215`）以概率 $\big(n_\beta m_{d_\beta+1}-m_{d_\beta}\big)/n$ 选顶点，telescoping 恒等式（`trees:205-208`）后论文紧跟一句 "All summands are positive."（`trees:209`）。正性来自严格递增：$n_\beta\ge1$ 时 $n_\betam_{d+1}-m_d\ge m_{d+1}-m_d>0$，加上终端 $m_L=1$ 时给出真正的概率归一。同时严格递增使 $\gamma_\beta=m_d-n_\betam_{d+1}$ 在 $n_\beta\ge2$ 时**必负**，在 $n_\beta=1$ 时等于 $m_d-m_{d+1}<0$，这正是"fresh 分裂付小因子 $-\delta$"的代数来源；$m_0=0$ 保证根不带来额外系数（`trees:129-130`："At the root there is no incoming edge, which agrees with $m_0=0$."），$m_L=1$ 保证终端 Gibbs 比 $K_LA=Y_{L-1}$ 无幂次扭曲（`trees:114-115`）。所以这套约束不是我加的方便，是"树抽样律是概率"与"$\gamma_\beta$ 带号"两件事的公共解。

**（d）候选失败路线。**

路线 1：把消息参数化改成带无界系数的形式（例如把 $q_x$ 换成 $e^{xs}$ 不归一，或让 $V_{\rm s}$ 里出现 $\log$-sum-exp 的额外尺度因子）。停住点：界 2 的双边夹靠 $\frac12\sum_\eps$ 与 $|A_\eps|\le C$，任何无界尺度都会使 $|\log T_0V_{\rm s}|$ 失去逐点界，$\mathcal B_r$ 可能取到 $-\infty$，下确界失去意义 [推测]。

路线 2：允许 $m_{d+1}\le m_d/n$ 的"反常网格"以扩大 trial 类。停住点：`trees:209` 的 "All summands are positive" 失效，`trees:213-215` 的抽样权重变负，$Q_k$ 不再是概率律，对数展开（`trees:224-239`）的整体系数解释崩塌 [推测]。

路线 3：对 $r=\infty$ 直接陈述定理，把 $\inf_{r\ge0}$ 换成极限层级上的泛函。停住点：$\mathcal M_{r+1}$ 的弱拓扑与 $T_d$ 递归在无限层需要额外的投射一致性（projectivity），而论文刻意不做这件事；`model:138-140` 明说"不假设 trial 律达到下确界"。我核对过比较步骤确实只用"每个固定 $L$ 的编码值是合法的 $\Phi_{L-1}$ 候选"，因此不需要单调性也不需要 attainment [推测：若 $\Phi_r$ 对 $r$ 单调不增，则 $\inf_r\Phi_r=\lim_r\Phi_r$，把顶层 $\zeta$ 取成点质量并令 $m_{r+1}\to1$ 的"吸收一层"论证我没能从 `model:92-95` 的齐次性做成严格等式，因为 $m\to1$ 给出的是 $\mathbb E[V]$ ，并非 $V$，外层还多一个 $\log$]。

## 2. 树演算（trees.tex）：插入、展开与 charging

**插入演算（Lemma tree:insertion）**：倾斜核 K_d=e^{m_d(X_d−X_{d−1})}P_d；自旋权重乘 A 后根对数变化 log Y₀；树密度 W_T(A)=∏_{a∈Leaves}A^a·∏_{β∈Int}Y_β^{γ_β}，**γ_β=m_{d_β}−n_βm_{d_β+1}**（符号不定，j=1 时可为负，这个带号结构是 fresh-divergence 与 small factor 的全部来源）。[推测]若把 Y^γ 换成 |Y|^{|γ|} 的绝对值版本，带号相消丢失、κ(S) 的乘积公式不复成立。

（a）逐字引用，`trees:84-111` 的陈述体：

```tex
\begin{lemma}[Insertion calculus]\label{tree:insertion}
Suppose a leaf partition function is iterated by power means, with
exponents $m_1,\ldots,m_{L-1}$, and $K_1,\ldots,K_{L-1}$ are its tilted
kernels.  Let $K_L$ be its terminal Gibbs kernel.  Multiplying each spin
weight by $A$ changes the iterated root logarithm by $\log Y_0$, where
\eqref{tree:Y-recursion} uses the kernels before insertion.  The new
kernels are \eqref{tree:updated-kernel}.

For an internal vertex $\beta$ of a prescribed tree, let $d_\beta$ be
its depth, let $n_\beta$ be its number of children, and put
\[
  \gamma_\beta=m_{d_\beta}-n_\beta m_{d_\beta+1}.
\]
The conditional joint density of its updated tree law is
\begin{equation}\label{tree:density}
  W_{\mathcal T}(A)
  :=\frac{dP_{\mathcal T}^A}{dP_{\mathcal T}}
  =\prod_{a\in\operatorname{Leaves}(\mathcal T)}A^a
       \prod_{\beta\in\operatorname{Int}(\mathcal T)}
            Y_\beta^{\gamma_\beta}.
\end{equation}
```

（b）推导补到中间步骤。三条式子的来源我先按论文的顺序（`trees:51-82`）重走。配分函数侧：$X_{L-1}=\log Z$，$X_{d-1}=m_d^{-1}\log P_de^{m_dX_d}$（$1\le d<L$），于是倾斜核 $K_d=e^{m_d(X_d-X_{d-1})}P_d$ 是概率核，因为 $P_de^{m_d(X_d-X_{d-1})}=e^{-m_dX_{d-1}}P_de^{m_dX_d}=e^{-m_dX_{d-1}}e^{m_dX_{d-1}}=1$。终端 $K_L$ 直接是给定辅助前缀下的 Gibbs 核，不参与这个构造。插入侧：$Y_L=A$，$Y_{d-1}=(K_dY_d^{m_d})^{1/m_d}$。把 $X^A$ 与 $X$ 代进同一层幂平均（论文 `trees:118-121` 逐字）：

```tex
  \exp\bigl(m_d(X_{d-1}^A-X_{d-1})\bigr)
  =K_d\exp\bigl(m_d(X_d^A-X_d)\bigr).
```

从终端起归纳：$m_L=1$ 时 $X_L^A-X_L=\log A$（对 Gibbs 核做权重比就是普通 Gibbs 密度比），所以 $K_L e^{X_L^A-X_L}=K_LA=Y_{L-1}$，即 $e^{X_{L-1}^A-X_{L-1}}=Y_{L-1}$。设 $X_d^A-X_d=\log Y_d$，代入上式得 $e^{m_d(X_{d-1}^A-X_{d-1})}=K_dY_d^{m_d}=Y_{d-1}^{m_d}$，即 $X_{d-1}^A-X_{d-1}=\log Y_{d-1}$，同时得到更新核 $K_d^A=(Y_d/Y_{d-1})^{m_d}K_d$（`trees:76-80`）。密度公式就是把每条边的比值 $(Y_d/Y_{d-1})^{m_d}$ 沿树乘起来后按顶点归项：深度 $d$ 的内部顶点 $\beta$ 从入边得 $+m_d$（出现在分子的 $Y_\beta^{m_d}$），从 $n_\beta$ 条出边各得 $-m_{d+1}$，合起来 $\gamma_\beta=m_{d_\beta}-n_\beta m_{d_\beta+1}$；叶的入边指数是 $m_L=1$，所以是 $A^a$；根没有入边，若把约定 $m_0=0$ 写进同一式子，$\gamma_{\rm root}=-n_{\rm root}m_1$ 与"只有出边"一致，这正是 `trees:129-130` 那句 "At the root there is no incoming edge, which agrees with $m_0=0$" 的作用：一个约定统一了三种顶点。

一阶变分（`trees:142-154`）我补一行中间步：对单个幂平均求导，$\partial_t(K_dY_d^{m_d})^{1/m_d}=(K_dY_d^{m_d})^{1/m_d-1}\cdot K_d(m_dY_d^{m_d-1}\partial_tY_d)/m_d$，配上 $Y_{d-1}=({})^{1/m_d}$ 就化简成 $\partial_t\log Y_{d-1}=K_d^A\partial_t\log Y_d$，终端 $\partial_t\log Y_L=D/A$，逐层向上传即 `tree:first-variation`：$\partial_{t_j}\log Y_d=E^{A_{\boldsymbol t}}[D_j/A_{\boldsymbol t}|\mathscr F_d]$，右边是"在指定前缀之下沿一条新更新路径"的条件期望。这句话是后面所有扩展规则的单步原型。

（c）机械理由。$\gamma_\beta$ 符号不定是设计核心，并非缺陷：一元顶点（$n_\beta=1$）上 $\gamma=m_d-m_{d+1}$，均匀网格上恰为 $-\delta$；分支顶点（$n_\beta\ge2$）上更负。解析域 $\sum_j|t_j|\|D_j\|_\infty<1$（`trees:156-176`）之所以必须有，是因为 $m_d$ 非整数时 $Y_d^{m_d}$ 要取主分支幂，论文用辐角递推封住：$|\arg Y_d|\le m_d\vartheta$、$\vartheta=\arcsin\rho<\pi/2$，且模长下界按 $a_{d-1}=a_d\cos(m_d\vartheta)^{1/m_d}>0$ 逐层传递，$\cos$ 因子为正恰因 $\vartheta<\pi/2$。这段是我见过的"为了让一个非整数幂合法而付的最昂贵的保险费"，但它顺带给了对核一致、对树大小与深度固定的解析界（`trees:173-176`），后面 pert:analytic 的一致性和 $j$ 无关性全靠它。单调性与齐次性（`trees:107-110`）的功能是把 §1 界 2 的逐点界在树递归里逐层保住，并保证 $A$ 乘根可测常数时 $\log Y_0$ 只加同一常数（于是泛函里 $\log2$ 的规范和 $\lambda$-正则化能对齐）。

（d）候选失败路线。其一，绝对值版本 $|Y_\beta|^{|\gamma_\beta|}$：带号相消消失，`trees:323-327` 那个 $=m_d-m_{d+1}$ 的合计不再成立，$\kappa(S)$ 的乘积公式失去根据，除法定价回到 $O(1)$ [推测]。其二，让根分布也跟着乘 $A$（把根变量也当成可插入的）：齐次性破缺，$\log Y_0$ 的递归初值改变，密度公式多出根因子 $Y_0^{\gamma_{\rm root}}$，$Q_k$ 归一化与 telescoping 需要重算 [推测]。其三，$A$ 允许变号（例如 $t$ 太大使 $1+tD<0$）：$Y_d^{m_d}$ 走出主分支，辐角递推失效；这就是扰动因子被硬夹在 $1/2\le\psi_\nu\le3/2$（`cavity:25-27`）的同一机制 [推测]。

**对数展开（tree:log-expansion）**：log Y₀=Σ(−1)^{k−1}t^k/k·𝔼_{Q_k}E_T∏D^a。Q_k 树律：n 叶树以概率 (n_βm_{d+1}−m_{d_β})/n 选内部顶点生成 fresh child；归一化靠 telescope 恒等式 Σ(n_βm_{d+1}−m_{d_β})=n。机制是"保护叶"论证：一阶导是单条更新路径上 D/A 的期望；保护该叶后每次求导只能添加 fresh path，k−1 个 fresh 系数全负、归一化后绝对值乘积 (k−1)!。

（a）`trees:204-239` 的三个块，逐字：

```tex
For a tree with $n$ leaves, telescoping gives the useful identity
\begin{equation}\label{tree:telescoping}
  \sum_{\beta\in\operatorname{Int}(\mathcal T)}
       \bigl(n_\beta m_{d_\beta+1}-m_{d_\beta}\bigr)=n.
\end{equation}
All summands are positive.  Define a probability law $Q_k$ on trees
with leaves labeled $1,\ldots,k$ as follows.  Start with a single path.
When the current tree has $n$ leaves, choose an internal vertex
$\beta$ with probability
\begin{equation}\label{tree:Q-rule}
  \frac{n_\beta m_{d_\beta+1}-m_{d_\beta}}{n},
\end{equation}
create a fresh child there, and continue with a completely new path
to depth $L$.
```
```tex
For example, under $Q_2$ the two paths split at depth $d$ with probability
$m_{d+1}-m_d$, for $0\le d<L$. This split is uniform on the depths when
$m_d=d/L$.
```
```tex
\begin{lemma}[Logarithmic expansion]\label[lemma]{tree:log-expansion}
For a bounded real path function $D$ and $A=1+tD$,
\begin{equation}\label{tree:log-series}
  \log Y_0
   =\sum_{k\geq1}\frac{(-1)^{k-1}t^k}{k}
       \mathbb E_{Q_k}E_{\mathcal T}
          \prod_{a=1}^k D^a,
       \qquad |t|\|D\|_\infty<1.
\end{equation}
```

（b）中间步骤。telescoping 我按论文的规则验算一遍：当前树 $n$ 叶时，把所有内部顶点的 $(n_\beta m_{d_\beta+1}-m_{d_\beta})$ 加起来。按深度分层，深度 $d$ 上共有 $V_d$ 个顶点（含叶），叶在深度 $L$。$\sum_\beta n_\beta m_{d_\beta+1}=\sum_{d\ge1}V_dm_d$（每个深度 $\ge1$ 的顶点恰好被其父顶点的一条出边计入一次），$\sum_\beta m_{d_\beta}=\sum_{d=0}^{L-1}(\text{内部顶点数 at }d)$。差化简后剩终端 $V_L=n$ 个叶贡献 $m_L=1$、根贡献 $-m_0=0$，即 $n$。所以 $Q_k$ 的分母 $n$ 与分子之和匹配，抽样规则确实是概率。正性那句（`trees:209`）我在 §1 已核对：$n_\beta\ge1$ 给出 $n_\betam_{d+1}-m_d\ge m_{d+1}-m_d>0$。

$k$ 阶导数。$\partial_t\log Y_0$ 是一条更新路径上 $D/A$ 的期望；对该叶加"保护"（其 $A^a$ 与分母 $A^a$ 相消，`trees:180-183` 的定义："Call a leaf \emph{protected} if its factor $A^a$ in the tree density is canceled by a denominator $A^a$."）。此后每次求导，$\partial_t\log W_{\mathcal T}(A)=\sum_aD^a/A^a+\sum_\beta\gamma_\beta\partial_t\log Y_\beta$（`trees:186-191` 逐字）中：保护叶的叶项与分母导数精确抵消（`trees:192-195`）；每个 $\beta$ 项按 `tree:first-variation` 等于"在 $\beta$ 下接一条独立更新路径并在其终端乘 $D/A$"，系数 $\gamma_\beta$，新叶自动受保护（`trees:196-202`）。于是 $k$ 阶时恰有 $k-1$ 个 fresh 系数，全部为负，绝对值乘积 $\prod(n_\betam_{d_\beta+1}-m_{d_\beta})$，除以 $n$ 的逐层归一后正好是 $Q_k$ 路径概率的 $(k-1)!$ 倍，这就是 `trees:249-253` 的

```tex
  \left.\frac{d^k}{dt^k}\log Y_0\right|_{t=0}
    =(-1)^{k-1}(k-1)!\,
       \mathbb E_{Q_k}E_{\mathcal T}\prod_{a=1}^kD^a.
```

系数 $(k-1)!/k!=1/k$ 给出级数里的 $1/k$，解析性把泰勒级数补成恒等式，余项 $\le\sum_{k>K}c^k/k$（`trees:234-238`）。

（c）机械理由。$Q_2$ 那句"两路径在深度 $d$ 分裂的概率 $=m_{d+1}-m_d$，均匀网格上对深度一致"（`trees:220-222`）是整篇深度平均论证的起点：分裂深度在 $0,\ldots,L-1$ 上均匀，所以"随机树的分支深度"与"我指定的分支深度"可以互换，$\kappa(S)$ 与 $L^{-a}\sum$ 的平均才谈得上等价（见 `tree:averaging-remark`）。带号与绝对值的分野也在这里出现：级数前因子 $(-1)^{k-1}$ 是泰勒的，$Q_k$ 的概率是正的，两者不混。

（d）失败路线。其一，若不用保护叶论证而直接逐次求导，会出现"对旧叶再加权"的交叉项，叶项与内部顶点项不再一一对应 fresh 路径，$Q_k$ 的组合解释消失 [推测]。其二，若 $D$ 无界，$|t|\|D\|_\infty<1$ 无法成立，级数与余项界都失效，这正是插入被写成 $1+t_\nu g\sigma_i$（$g$ 有理取值于 $[-1,1]$，`sum` 与 `pert` 的 mark specification）的原因 [推测]。

**canceled-anchor 展开（tree:extension-expansion）**：对旧树固定锚叶与有界 H，下一颜色允许选未用旧叶（系数 1）或从内部顶点 fresh（系数 γ_β）：∂…∂E_T^A[H/A^{a_*}]=Σ_E c_E E_{T_E}[H∏D^{a_j(E)}]。[推测]若不用 canceled anchor 而直接展开 E_T^A[HA^{a_*}]，锚叶的 D 因子与树密度叶项纠缠、扩展系数失去 γ_β 的封闭形式，summary "系数交错" 卡点对应此处。

（a）规则与陈述逐字，`trees:259-296`：

```tex
Fix a tree
$\mathcal T$ with an anchor leaf $a_*$.  Starting from all its old
paths, assign colors $1,\ldots,k$ in that order.  For the next color,
one may either
  \item choose an unused old leaf other than $a_*$, with coefficient
  $1$; or
  \item create a fresh path from any internal vertex $\beta$ of the
  current tree, with coefficient
  $\gamma_\beta=m_{d_\beta}-n_\beta m_{d_\beta+1}$.
```
```tex
\begin{lemma}[Canceled-anchor expansion]\label{tree:extension-expansion}
Let $H$ be a bounded function of the variables on the old tree, fixed
as the insertion parameters vary.  For
$A_{\boldsymbol t}=1+\sum_{j=1}^k t_jD_j$, with bounded real path
functions $D_j$, one has
\begin{equation}\label{tree:mixed-expansion}
  \left.\partial_{t_1}\cdots\partial_{t_k}
       E_{\mathcal T}^{A_{\boldsymbol t}}
        \frac{H}{A_{\boldsymbol t}^{a_*}}
  \right|_{\boldsymbol t=0}
   =\sum_E c_E\,
       E_{\mathcal T_E}
          \left[H\prod_{j=1}^kD_j^{a_j(E)}\right].
\end{equation}
The formula holds in any fixed order of the colors.  For identical
directions $D_j=D$, the coefficient of $t^k$ is the right-hand side
divided by $k!$.  ... The empty extension has weight $1$.
```

（b）机制补全：从 $C=\{a_*\}$、$G=H$ 出发（`trees:298-304`），每次把一个新的 $D_j$ 并入 $G$。锚叶的保护来自分母 $A^{a_*}$ 本身，这条抵消是整条规则的开关：它使得锚叶**永远不进入**求导产生的叶项，于是每个颜色只能落到"未用旧叶"（叶项，系数 1，之后该叶受保护）或"fresh 路径"（内部顶点项，系数 $\gamma_\beta$）。同一颜色不能复用旧叶（`trees:271-276`："Every chosen leaf receives its color and cannot be chosen again."）。$\boldsymbol t=0$ 时所有 $A,Y$ 因子为 1，所以只剩系数与树期望。

（c）机械理由：$H$ 必须与插入参数无关，否则 $\partial_tH$ 混进系数表；$1$ 与 $\gamma_\beta$ 两套系数并存是"旧叶 vs 新路径"的物理区分；空扩展权重 1 保证 $k=0$ 情形（只有锚）也在同一式子里；"任意固定颜色顺序"这句让 §5 的两侧反向求和合法。

（d）失败路线：把锚换成"要展开的那一叶"（即分母不放 $A^{a_*}$）会立刻破坏保护，锚叶的 $D$ 因子与 $\prod_aA^a$ 纠缠 [推测]；$H$ 依赖 $N$ 或对 $N$ 不一致有界时，`trees:294-295` 的一致解析界失去意义，pert:analytic 的逐系数对角化覆盖不到它 [推测]；若允许"复用已用颜色"，扩展历史 $\mathfrak E$ 的计数与 $\kappa(S)$ 迭代重复计入，`tree:reference-total` 的单步和失效 [推测]。

**扩展系数和与 charging（tree:reference-total、tree:charging），深度平移的原型计算**：单步带号总系数 m_d−jm_{d+1}（telescope：q 叶子树内部 q+Σ(m−nm′)=m_{d+1}，加指定顶点 fresh 选择）。**motivating 计算**（论文原话）：两条旧路径在 d 分裂、要求新颜色恰在 d 分裂：1+(m_d−2m_{d+1})+Σ_{ℓ>d}(m_ℓ−m_{ℓ+1})=m_d−m_{d+1}，均匀网格下带号总量 −δ 但**绝对值和 2+δ**；若把要求的分裂推迟到 d+1<L（旧树该处 unary），唯一选择是 fresh 分裂、系数 −δ、**绝对和=δ**，把目标分支深度移离旧分支深度，可把绝对系数和从 O(1) 降到 O(δ)。这就是"深度平移"的算术胚胎。charging 界：Σ_E|c_E|≤C_{q,k}δ^b（b 个指定分支顶点各付 fresh unary δ；"每个指定顶点在首次变成分支顶点的那步必须由 unary 分裂 fresh 产生、不同顶点的创建步不同"）；相对版 (1/|J|)Σ|c_E|≤C_{q,k,η}（j≥2 因子 |m_d−jm_{d+1}|=(j−1)m_d+jδ≥η）。**C_{q,k} 不依赖 L、指定深度、以及不同顶点深度的重合，"even when their depths coincide" 是 shift 方案的命门**。[推测]两个目标顶点若同深度被当成一个计费，δ^b 变 δ^{b−1}，b 大时不足以压制 1/|J|~δ^{−2b}。

（a）`trees:337-357` 的陈述与 `trees:417-456` 的证明主体：

```tex
\begin{lemma}[Reference-path totals]\label{tree:reference-total}
Suppose the next color must follow a specified reference prefix to
depth $d$ and then enter a child distinct from all $j\geq1$ children
there that contain reference paths.  Apart from these ancestry
constraints its continuation is unrestricted.  The sum of the
coefficients of all allowed choices is
\begin{equation}\label{tree:one-reference-total}
  m_d-jm_{d+1}.
\end{equation}
Consequently, if the anchor and the colors must have a prescribed
tree $S$, the total coefficient over all compatible extensions of
any old tree is
\begin{equation}\label{tree:K}
 \kappa(S)=\prod_{v\in\operatorname{Br}(S)}
           \prod_{j=1}^{a_v-1}(m_{d_v}-jm_{d_v+1}),
\end{equation}
```
```tex
If such a subtree is
rooted at depth $d+1$, its permitted choices are an old leaf, with
coefficient $1$, or a fresh divergence at an internal vertex in the
subtree.  If it has $q$ leaves, telescoping within it gives
\[
  q+\sum_{\beta\text{ internal in the subtree}}
       (m_{d_\beta}-n_\beta m_{d_\beta+1})=m_{d+1}.
\]
```

（b）中间步骤我补两处。第一处是子树内的 telescoping：论文用 `tree:telescoping` 的形式 $\sum_\beta(n_\beta m_{d_\beta+1}-m_{d_\beta})=q$，两边乘 $-1$ 再移项得 $q+\sum_\beta(m_{d_\beta}-n_\betam_{d_\beta+1})=m_{d+1}$（子树根在深度 $d+1$，其入边项 $m_{d+1}$ 出现在右端）。所以"一个不含参考的 $q$ 叶子子树"允许的扩展系数内部合计恰为 $m_{d+1}$，与 $\beta$ 的结构无关，这是那个单步和能只依赖参考树的原因。第二处是合计 $m_d-jm_{d+1}$ 的组装：指定分歧顶点处全树子数 $n$，其自身 fresh 分裂系数 $m_d-nm_{d+1}$，另 $n-j$ 个不含参考的子树各贡献 $m_{d+1}$，和 $=m_d-nm_{d+1}+(n-j)m_{d+1}=m_d-jm_{d+1}$，$n$ 消掉了。于是 $\kappa(S)$：在每个分支顶点，"新子代组第一次进入"时的排除参考子代数依次是 $1,\ldots,a_v-1$（`trees:381-385`），与颜色顺序无关，乘起来即 `tree:K`。

charging 的机械骨架（`trees:417-447`）我逐步列：无约束步的绝对系数和 $\le s+(s)=2s\le2(q+k)$（fresh 部分由 telescoping 恰为当前叶数 $s$，旧叶部分至多 $s$ 个候选）；指定深度上的 unary fresh 每点系数 $-\delta$、该深度至多 $s$ 个顶点，故该类合计 $\le s\delta$。关键论证是"创建步"的唯一性：指定的目标分支顶点在旧树里不分支部，所以它"首次变成分支顶点"那一步必是一条 fresh 路径在 unary 顶点处分叉；一条 fresh 路径只造一个分支顶点，故 $b$ 个顶点的创建步两两不同；分配方式 $\le k!/(k-b)!$，且必有 $b\le k$。固定分配后，放宽其余约束，得 $\frac{k!}{(k-b)!}(q+k)^b(2(q+k))^{k-b}\delta^b$（`trees:443-445`）。相对版用 $j=1$ 因子绝对值 $=\delta$、$j\ge2$ 时 $|m_d-jm_{d+1}|=(j-1)m_d+j\delta\ge\eta$（`trees:449-453`），故 $|J|\ge\delta^b\eta^{\sum_v(a_v-2)}$，两式相除得 `tree:relative-charging`。

（c）机械理由，也是本篇"RSB 步数为什么断在这一层"的算术回答之一。第一，$\delta^b$ 与 $1$ 的比值完全由**均匀网格**给出：$m_d=d/L$ 使一元 fresh 系数恰为常数 $-\delta$，换成非均匀网格后各顶点的 fresh 系数不同，$\delta^b$ 要换成 $\prod_v(m_{d_v+1}-m_{d_v})$，相对界仍然对，但深度平均的 $L^{-a}$ 换算（regular-shapes）就不再是干净的概率。第二，指定深度数 $b$ 的上界是颜色数 $k$，而 $k$ 由我要控制的 multioverlap 阶数决定，与 $L$ 无关，这才是"$C_{q,k}$ 对 $L$ 一致"有意义的原因：$L$ 只进 $\delta$，不进常数。第三，"even when their depths coincide"（`trees:403-404`："The constant is independent of $L$, the prescribed depths, and their coincidences at different vertices."）是命门：两份对齐副本的对应顶点带**同一个深度坐标**，若计费按深度，并非按顶点，$2b$ 个 $j=1$ 因子只换来 $b$ 个 $\delta$，除法后剩 $\delta^{-b}$，全篇作废。第四，$b\le k$ 与"历史是选择，并非事件"（`trees:427-436`）避免了条件概率陷阱：我不是在"某顶点是分支点"这一事件上做条件期望，是在扩展规则的选择空间上枚举。

（d）失败路线。其一，不做深度平移：要求的分裂落在旧树分支深度时，`trees:328-330` 给出绝对和 $2+\delta$、带号和 $-\delta$，除以 $|J|\le\delta^b$ 后误差 $O(\delta^{-b})$，summary 卡点 5 的形态就是这个 [推测]。其二，粗划分/等指数细分想用邻域内的插值凑出额外小因子：连续性误差是 $o(1)$ 量级而不带 $\delta^b$，除完仍不消失 [推测]。其三，两个同深度目标顶点合并计费（上面第三点），$\delta^b$ 退化 $\delta^{b-1}$ [推测]。其四，若交互元数 $p$ 与树大小不再是"每步 $n_\beta\le p$ 有界"，则 $q,k$ 的依赖会漏进 $C_{q,k}$，$k$ 阶 multioverlap 的归纳在阶数上无法闭合 [推测]。

**分支深度分布（tree:regular-shapes）**：Q_k{非 regular}≤C_k(η+L^{−1})；指定拓扑+深度赋值概率 ≤C_kL^{−a}。Remark：深度平均可通过赋值概率换算成 Q_k 贡献，**"深度平均意义"的集中即可，无需对深度一致集中**，这是整篇下界对集中性要求最弱的地方，也是它可能成立的原因。

（a）`trees:460-525` 的 regular 定义与结论逐字：

```tex
For $0<\eta<1/2$, call a shape \emph{regular} if every
branching depth divided by $L$ lies in $(\eta,1-\eta)$ and any two
distinct branching vertices have normalized depths differing by more
than $\eta$.  A singleton is regular.
```
```tex
  Q_k\{\mathcal T\text{ is not regular}\}
        \leq C_k(\eta+L^{-1}).
```
```tex
  Q_k\{\text{that topology and depth assignment}\}
       \leq C_kL^{-a}.
```

（b）中间步骤。新分支顶点"恰在下一条路径于 unary 顶点分叉时产生"，该选择概率按 `tree:Q-rule` 是 $(1\cdot m_{d+1}-m_d)/n=\delta/n$；某一深度上至多 $n$ 个顶点，所以对深度集 $B$，下一步在 $B$ 中造分支顶点的概率 $\le|B|\delta$（`trees:487-492`）。前 $k-1$ 步的禁区由"边界深度 $\le2\eta L$ 个"加"已有分支顶点的 $\eta$ 邻域 $\le2\eta L$ 每点"组成，基数 $\le C_k(\eta L+1)$，union bound 得 $C_k(\eta+L^{-1})$（`trees:493-497`）。指定拓扑加深度赋值：把终树限制到前 $n$ 条叶、保留所有 unary 段，得到 `tree:Q-rule` 下的唯一历史序列，$a$ 个分支顶点各由一次 unary 分歧创造、概率各 $\le\delta$，其余转移概率 $\le1$，故 $\le\delta^a=L^{-a}$；等价子代排序数只依赖 $k$，吸收进 $C_k$（`trees:501-510`）。删叶封闭性：保留下来的分支顶点原本就是分支顶点、深度不变，坐标集合是原子集（`trees:511-513`）。Remark（`trees:516-525`）的换算我写成一句明确的话：对带 $a$ 个分支坐标的形状，$\mathcal A_{L,\eta}z=L^{-a}\sum_{\mathbf q}z(\mathbf q)$ 中的每一项都不超过该项在 $Q_k$ 下的贡献（因为赋值概率 $\ge$ 需要的是反向界，论文用的是"每项 $\le C_kL^{-a}$ 所以平均 $\le$ 单个 $Q_k$ 贡献乘 $C_k$"）[推测：这一方向的推导我只在 `tree:averaging-remark` 的 "converts an unnormalized depth average ... into a bound for its contribution under $Q_k$" 一句下自行补了不等号方向，论文没写细节]；子形状误差丢弃坐标的求和至多花对应幂次的 $L$，被 $L^{-a}$ 归一化吃掉。

（c）机械理由：$\eta$ 的正则性同时买三件东西：禁区计数线性（$\eta L+1$）、$c_d\ge\eta$ 与 $j\ge2$ 因子 $\ge\eta$ 的可除性（§5）、平移一层后仍落回 $\eta/2$-regular 域（`trees:465-467` 与 §5 的 fiber 界）。$\eta<1/2$ 是"$(\eta,1-\eta)$ 非空"的最低要求。$Q_k$ 与深度平均可以互换，是整篇把"逐点集中"降级成"平均集中"的合法性来源；这个降级换来的是不需要对深度做一致性，代价是 $\eta\downarrow0$ 要放在最后。

（d）失败路线：只用极少数固定深度（比如所有约束压在 $d=e$ 一处）时，赋值概率 $\sim\delta$ 承担不了 $k$ 个联合约束 [推测]；想做逐深度一致集中，则需要 $N$ 对 $L$ 一致的误差界，论文明确不提供（§5 末）[推测]；删叶后不复查 regular 会让残留深度坐标破坏 $L^{-a}$ 归一 [推测]。

## 3. 上界（upper.tex）：凸性余项与归一化

退化因子化先行：b=0 或 M=0 时相互作用是常数、F_N=B_r 平凡成立；否则 b、M 本性有界（反证+独立性+严格乘积界给 ‖b‖_∞≤u^{−p}、‖M‖_∞≤(vu^{p−1})^{−1}）。插值：真实交互与独立 cavity 交互之间，Poisson 求导。**归一化（消去 a）**：所有插入在因子化下形如 a(1+D)；先减 c=θ(1,…,1)=log a(1+D_*)，再对 λ<1 把每个增量换成 log Y₀(1+λD)−log(1+λD_*)，由恒等式 (1+λD)/(1+λD_*)=(1−w)+w(1+D)/(1+D_*) 夹在 e^{±2B}。[推测]不做 λ-正则化直接对 log a(1+D) 取期望，E|log a|=∞ 可能发生（a 依赖其余变量）、φ'(t) 不存在，这是 PT 原证可回避而本文必须自建的部分。**凸性余项**：三处插入共享 Q_n 树律，阶 n 系数 −(λ^n/n)E[(−b)^n]E_{Q_n}E[P_T^p−pP_TB_T^{p−1}+(p−1)B_T^p]；p 偶 ⇒ x^p 凸 ⇒ 括号 ≥0；正性使整体 ≤0。[推测]p 奇则括号无定号，这是 **3-SAT 被排除的结构原因**。

（a）陈述逐字（`upper:11-15`）：

```tex
\begin{proposition}\label[proposition]{upper:bound}
Under the hypotheses of \cref{main:theorem},
$F_N\le\cB_r(\zeta,\mathbf m)$ for every $N$ and every admissible finite-level
trial law. Consequently $F_N\le\inf_{r\ge0}\Phi_r$.
\end{proposition}
```

方法的历史交代在 `upper:3-9`："The interpolation method of Guerra, adapted to diluted systems by Franz and Leone and to arbitrary finite levels by Panchenko and Talagrand, replaces each real interaction by $p$ independent cavity interactions. The difference is controlled by the convexity of $x\mapsto x^p$." 注意 "for the full trial class, including **unbounded messages** and integrable physical disorder"（`upper:8-9`）：上界一侧对 trial 消息的野性免疫，靠的正是 §1 的逐点界 $|\log T_0V|\le|h|+\sum B(\theta_j)$（消息根本不出现在界里）。

归一化与凸性的原文（`upper:70-94`、`upper:115-127`）：

```tex
\emph{Normalization.}
We remove $a$ before taking expectations, so no integrability of
$\log a$ is needed. Put
$D_*=b\prod_\ell f_\ell(1)$ and $c=\theta(1,\ldots,1)$.
Subtract $c$ from each insertion increment. These integrable subtractions
cancel in the combination with coefficients $1,-p,p-1$.
```
```tex
 \log Y_0(1+\lambda D)-\log(1+\lambda D_*),
```
```tex
 -\frac{\lambda^n}{n}\E[(-b)^n]\,
 \E_{Q_n}\E\left[
 P_{\cT}^p-pP_{\cT}B_{\cT}^{p-1}+(p-1)B_{\cT}^p\right].
```

（b）推导补到中间步骤，四个小步。

步 1，退化情形的边界。$M=\max_{s=\pm1}|f(s)|$。若 $b=0$ a.s. 或 $M=0$ a.s.，乘积项恒零，$\theta=\log a$ 是自旋无关随机常数 $c$，则 $-H_N$ 里加的是与 $\sigma$ 无关的量，$F_N=\log2+\mathbb E\log\cosh h+\alpha\mathbb Ec$；同一式子在 trial 侧由幂平均把根可测常数提出来（`trees:109-110` 的齐次性），$\mathcal B_r$ 给出同一个值，等号平凡成立（`upper:18-23`）。否则取 $u,v>0$ 使 $\P(M\ge u)>0$、$\P(|b|\ge v)>0$。反证给 $\|b\|_\infty\le u^{-p}$：若 $\P(|b|>u^{-p})>0$，在该正概率集上取 $|b|>u^{-p}$，同时把 $p$ 个独立的 $f_\ell$ 各自限制到 $\{|f_\ell|\ge u\}$（每个正概率、独立、乘积正概率），得 $|b|\prod M_\ell>1$，违反严格乘积条件 $|b\prod f_\ell(s_\ell)|<1$ a.s.。$\|M\|_\infty\le(vu^{p-1})^{-1}$ 同理（把 $|b|\ge v$ 固定、其余 $p-1$ 个因子限制在 $u$ 上）。这条双向限制解释了"正性条件里的期望自动有限"（素材 §1.1 末）。

步 2，$\varphi$ 与三个系数的来历。$L=r+1$，$t$ 侧插值：真实交互均值 $t\alpha N$，独立 cavity 交互 $U_\theta(x_1,\ldots,x_{p-1};\sigma_i)$ 均值 $(1-t)\alpha p$，不同 cavity 项的消息标签不相交，计数/交互/场/根测度全 quenched。站点独立给 $\varphi(1)=F_N$、$\varphi(0)=\log2+\mathbb E\log T_0V_{\rm s}$。Poisson 求导（把均值随 $t$ 变化的 Poisson 过程求导=加/删一项的期望增量乘均值变化率）：$\varphi'(t)/\alpha=$【一个真实交互的插入增量】$-p\times$【一个均匀位点 cavity 交互的增量】，即系数 $(1,-p)$。要证的不等式（`upper:59-61`）再把第三项 $+\alpha(p-1)\mathbb E\log T_0V_{\rm e}$ 搬进来，等价于三项组合 $1\cdot(\text{real})-p\cdot(\text{cavity})+(p-1)\cdot(\text{edge})\le0$。三系数和 $1-p+(p-1)=0$。这就是"减 $c$ 能在组合中相消"的机械理由（`upper:74-75`）：$c$ 是根可测常数，在每个插入里以同一份出现，被零和系数抹掉；$c$ 可积因 $|c|\le B(\theta)$。**$1,p-1$ 的组合与泛函里 $\alpha(p-1)$ 的配平、与 §5 增量的 site/bond 计数 $\alpha p/\alpha(p-1)$ 是同一个账**，三处必须一致否则上下界接不上。

步 3，比值恒等式我逐字验算：$w=\frac{\lambda(1+D_*)}{1+\lambda D_*}\in[0,1]$（$\lambda<1$、$|D_*|<1$ 保证分母与分子同号且 $w\le1$），则

$$(1-w)+w\frac{1+D}{1+D_*}=1+\frac{\lambda(D-D_*)}{1+\lambda D_*}=\frac{1+\lambda D}{1+\lambda D_*}.$$

而 $\frac{1+D}{1+D_*}=\frac{e^{\theta(s)/}/a}{e^{\theta(1,\ldots,1)}/a}=e^{\theta(s)-\theta(1,\ldots,1)}\in[e^{-2B},e^{2B}]$，$a$ 在这一步**自动消失**。既然比值与 $1$ 都夹在 $[e^{-2B},e^{2B}]$，它们的凸组合也夹在里面，取 $\log$ 得 `upper:90-91` 的一致界 $2B(\theta)$。这一步是"不需要 $\log a$ 可积"的全部秘密：单独的 $\log a$ 从不出现，出现的只有 $a$-无关的比值。论文还补一句"对任意subset自旋输入按 $q_x$ 平均后同样成立"（`upper:88-89`），这保证 cavity 与 edge 两处插入（$\bar f(x)=\sum_sf(s)q_x(s)$）也合法。$\lambda\uparrow1$ 用一致收敛 + 有限递归保持 + 支配收敛（`upper:91-94`）。

步 4，凸性括号。$x^p$ 在 $p$ 偶时凸，切线不等式 $A^p\ge B^p+pB^{p-1}(A-B)$ 移项即 $A^p-pAB^{p-1}+(p-1)B^p\ge0$，对 $A=P_{\mathcal T},B=B_{\mathcal T}$ 逐点成立后取期望。三个量 $P_{\mathcal T}^p$、$P_{\mathcal T}B_{\mathcal T}^{p-1}$、$B_{\mathcal T}^p$ 的来源（`upper:96-112`）：真实交互有 $p$ 个自旋输入，独立均匀指标使每个输入落到不同位点、各带一份 $P_{\mathcal T}$（同一个 fresh $f$ 被树内 $n$ 个副本共享）；cavity 交互的 $p-1$ 个输入换成消息 $\bar f(x)$，即 $p-1$ 份 $B_{\mathcal T}$ 乘 1 份 $P_{\mathcal T}$；edge 插入全换成 $p$ 份 $B_{\mathcal T}$。$B_{\mathcal T}$ 对固定树是**确定性的**（`upper:104-108`：它平均了整棵 fresh 消息标签树、与旧系统独立），$P_{\mathcal T}$ 仍依赖旧副本，这个不对称正是凸性能点逐树成立的原因。级数绝对收敛于 $\lambda<1$（界 $\sum_{n\ge1}\lambda^n/n$，`upper:122-123`），$Q_n$ 对三处插入公共（`upper:120-121`：树律只由 $m$-网格与 `tree:Q-rule` 决定，与核无关）。$\lambda\uparrow1$ 后对 $t\in[0,1]$ 积分得命题。

（c）机械理由汇总：$\lambda<1$ 同时买三样（$w\in[0,1]$、级数绝对收敛、支配收敛的界 $2B$）；$c$ 的减法买"系数零和"；比值形式买"$a$ 消失"；$p$ 偶买凸性；正性买整体非正。四件事缺一件，$\varphi'\le-\alpha(p-1)\mathbb E\log T_0V_{\rm e}$ 就不成立。

（d）候选失败路线。其一，无 $\lambda$ 正则化：$a$ 依赖表示中其余变量、$\mathbb E|\log a|$ 可积性无保证，$\varphi'(t)$ 可能不存在，$\lambda$ 是本文自建（`upper:70-71` 明说 "We remove $a$ before taking expectations, so no integrability of $\log a$ is needed"）[推测]。其二，$p$ 奇：凸性括号失去定号（取 $A=-B$ 型反例即变号），上界路线整体失效；这解释了 even-arity 假设在上界一侧的位置，也是随机 3-SAT 被排除的结构原因 [推测]。其三，若 $B_{\mathcal T}$ 的消息树不 fresh（与旧系统相关），$P^p-pPB^{p-1}+B^p$ 不再逐点因式分解成凸性差，正负号失控 [推测]。其四，$r=0$ 时"消息本身是所有副本共享的根变量"（`upper:108-109`），凸性论证仍成立，但 $Q_n$ 的 $n$ 阶项要重算共享因子；这说明 RS 情形是同一论证的退化，并非另一个论证 [推测]。

## 4. cavity reservoir 与扰动族（cavity.tex + perturbations.tex）

**reservoir 与增量（cavity:increment）**：s_N=N^{3/4} 个亚线性 Poisson 扰动 ψ_ν∈(1/2,3/2)（代价 (log2)s_N=o(N)）；Poisson 过程按"含新指标个数"分裂：无新指标均值 ρ_N=α(N+1)(N/(N+1))^p、恰一个均值 αp+O(N^{−1})（置换不变性把新输入放末位）、两个以上 O(N^{−1}) 丢弃；扰动配对用公共 Poisson 点耦合（未匹配期望 O(N^{−4}​)=O(N^{−1/4})）。增量 Δ_N=log2+𝔼logY_{0,s}−𝔼logY_{0,b}+o_N(1)，K_s~Pois(αp)、K_b~Pois(α(p−1)) 恰是 trial 泛函的 site/edge 计数。[推测]s_N 若取 N^β、β<1/2，score 除法后的集中不够；β≥1 扰动代价不再 o(N)，N^{3/4} 是折中。

（a）`cavity:16-68` 的设置与结论，逐字关键段：

```tex
Fix $L\ge2$ and use $r=L-1$ auxiliary levels with
\begin{equation}\label{cavity:grid}
 m_d=d/L\quad(0\le d\le L),\qquad\delta=1/L.
\end{equation}
Let $(c_\nu)_{\nu\ge1}$ be positive with $\sum_\nu c_\nu=1$, and let
$s_N=N^{3/4}$.
```
```tex
 |P_N^{L,\mathbf u}-NF_N|\le (\log2)s_N,
```
```tex
\begin{lemma}[Cavity increments]\label[lemma]{cavity:increment}
The increments $\Delta_N^{L,\mathbf u}=P_{N+1}^{L,\mathbf u}-P_N^{L,\mathbf u}$
are uniformly bounded in $N,L,\mathbf u$. There is a reservoir on $N$ spins
with physical interaction count of mean
\begin{equation}\label{cavity:reservoir-mean}
 \rho_N=\alpha(N+1)\left(\frac{N}{N+1}\right)^p,
\end{equation}
... such that
\begin{equation}\label{cavity:identity}
 \Delta_N^{L,\mathbf u}
 =\log2+\E\log Y_{0,\rm s}-\E\log Y_{0,\rm b}+o_N(1).
\end{equation}
```
```tex
 A_{\rm s}(\sigma)&=\frac12\sum_{\eps=\pm1}
 \exp\left(h\eps+\sum_{j=1}^{K_{\rm s}}
 \theta_j(\sigma_{i_{1,j}},\ldots,\sigma_{i_{p-1,j}},\eps)\right),
 \label{cavity:site-insertion}\\
 A_{\rm b}(\sigma)&=\exp\left(\sum_{j=1}^{K_{\rm b}}
 \theta_j(\sigma_{i_{1,j}},\ldots,\sigma_{i_{p,j}})\right),
 \label{cavity:bond-insertion}
```

（b）分裂计数的算术我逐项核。$(N+1)$ 系统的交互总数均值 $\alpha(N+1)$，每条 $p$ 个指标独立均匀于 $[N+1]$。无新指标（全部落在 $[N]$）均值 $\alpha(N+1)\big(\frac{N}{N+1}\big)^p=\rho_N$。恰一个：$\alpha(N+1)\cdot p\cdot\frac1{N+1}\big(\frac N{N+1}\big)^{p-1}=\alpha p\big(\frac N{N+1}\big)^{p-1}=\alpha p+O(N^{-1})$，用置换不变性把新输入放到末位（`cavity:75-79`），其余 $p-1$ 个是 $[N]$ 上独立均匀、交互函数保持原律，这正好凑成 `cavity:site-insertion` 的形状。两个以上：均值 $\le\alpha(N+1)\binom p2\frac{2}{(N+1)^2}=O(N^{-1})$，丢弃。旧系统补足项：$\alpha N-\rho_N$，用 $(1-\frac1{N+1})^p=1-\frac p{N+1}+O(N^{-2})$ 得 $\rho_N=\alpha(N+1-p+O(N^{-1}))$，于是 $\alpha N-\rho_N=\alpha(p-1)+O(N^{-1})$，与 `cavity:bond-insertion` 的 $\mathrm{Pois}(\alpha(p-1))$ 对齐。$N$ 足够大时该量为非负（`cavity:85`）。扰动配对：旧位点计数均值 $s_{N+1}\frac N{N+1}$、新位点 $s_{N+1}/(N+1)$，公共 Poisson 点耦合后未匹配期望 $\le|s_{N+1}-s_N|+2s_{N+1}/(N+1)$；$s_N=N^{3/4}$ 给 $|s_{N+1}-s_N|\asymp\frac34N^{-1/4}$、$2s_{N+1}/(N+1)\asymp2N^{-1/4}$，合计 $O(N^{-1/4})$（`cavity:92-94`）。删/加一个扰动改根对数 $\le\log2$（因 $1/2\le\psi\le3/2$，$|\log\psi|\le\log2$），一个交互改 $\le B$，多余辅助变量按其先验直接积掉（`cavity:95-98`）。对新自旋求和给 $2A_{\rm s}$，那个因子 2 供出恒等式里的 $\log2$（`cavity:103-105`）。界 $|\log Y_{0,\rm s}|\le H+BK_{\rm s}$、$|\log Y_{0,\rm b}|\le BK_{\rm b}$ 是 §1 界 2 的 reservoir 版。

（c）机械理由：$\rho_N$ 的形状完全由"不含新位点"这一条件决定，$\alpha N-\rho_N=\alpha(p-1)$ 就是 bond 修正的来源，$\alpha p$ 与 $\alpha(p-1)$ 与 trial 泛函的 site/edge 系数逐字相同，这是上下界能对接的第一处硬约束。$s_N=N^{3/4}$：扰动代价 $(\log2)s_N=o(N)$ 要 $s_N$ 亚线性，score 除法要 $\lambda_\nu=c_\nu s_N\to\infty$ 足够快（见下段的 $\rho=N^{-1/8}$ 预算）[推测]。$L\ge2$：$\delta=1/L$、$r=L-1$ 是"层级数=深度减一"的定义性约定，深度 $L$ 留给自旋。参数 $\mathbf u$ 固定、不进 quenched 律（`cavity:29-31`），"All expectations in a statement at a specified parameter vector are taken with that vector held fixed"（`pert:9-10`）。

（d）失败路线：扰动数量取 $s_N$ 常数或 $\log N$ 时 $\lambda_\nu^{-1/2}$ 不消失，score 集中失败 [推测]；$\psi_\nu$ 若允许接近 0，$\log\psi$ 无界，`(log2)s_N` 的代价估计破 [推测]；含两个新指标的交互若保留，其插入形状（$p$ 元里两位是新位点）不在 $A_{\rm s}$ 类型内，需要第三类插入并重新配平 $\alpha$ 系数 [推测]。

**score 集中（pert:concentration）**：双参数扰动 ψ_ν=1+t_ν g σ_i+u_ν g₀S₀，**t 探测 Taylor 展开、u 求导产生集中**，角色分离是 summary 卡点 3（Bayesian 不迁移）的解法。集中三段：路径内涨落（X₀''≥m₁Var(D_ν|𝓕₀)−4n，二阶导的正项是热方差来源，集中从"对 u 的凸性"免费得到，Ghirlanda–Guerra 式恒等式的 Poisson/均值版本）；根均值集中（G(u)=X₀+2nu² 凸化吸收 ∂_uD_ν≤0；Efron–Stein 给 Var≤C_νN）；从凸函数到导数（差商+单调，差商半径 ρ=N^{−1/8}；[推测]N^{−1/2} 则 √N/ρ=N 太大、常数则 ρλ_ν 太大，N^{−1/8} 是让两项在 λ_ν=c_νN^{3/4} 除法下都消失的可行选择）。[推测]若把 u 的扰动也当 quenched 随机参数，π 上平均变成背景测度改变（"varying the small insertion parameter silently changes the background measure"），本文用确定性参数+Poisson removal 供背景绕开；若想直接对 t 求导取集中，∂_t log ψ 无平方结构、二阶导缺正项。

（a）扰动族与结论逐字（`pert:40-58`、`pert:95-104`）：

```tex
The two parameters have different roles: differentiation in $u$ produces
a concentrated score, while the values of $t$ probe an insertion's Taylor
expansion. Taking $u$ smaller than every fixed power of $t$ will force
each limiting Taylor coefficient to vanish. For each specification
include types indexed by all integers $j\geq4$.
The type $\nu$ corresponding to this specification and $j$ has
\begin{equation}
 t_\nu=j^{-1},\qquad
 I_\nu=[j^{-j},2j^{-j}],\qquad u_\nu\in I_\nu.
 \label{pert:parameters}
\end{equation}
```
```tex
 \psi_\nu=1+t_\nu g\sigma_i+u_\nu g_0S_0.
```
```tex
\begin{lemma}[Averaged score concentration]
\label{pert:concentration}
For each fixed $L$ and each fixed type $\nu$,
\begin{equation}
 \int e_{\nu,N}(\mathbf u)\,\pi(d\mathbf u)\longrightarrow0.
\end{equation}
The assertion holds for the reservoir as well as for the original
system.  Constants need not be uniform in $L$ or $\nu$.
\end{lemma}
```

mark specification 的定义（`pert:28-38`）我抄出要点：有限个带标号 Rademacher 坐标、每个配一个 $\{1,\ldots,L-1\}$ 中的深度、两个函数 $g,g_0:\{-1,1\}^n\to\mathbb Q\cap[-1,1]$、以及 $S_0=1$（marker anchor）或 $S_0=\sigma_i$（spin anchor）；坐标在其指定深度沿辅助路径抽样，共享顶点处共享值、不同顶点独立；"$n=0$ includes constant functions"、"Products of signs and their rational averages belong to this collection"。这个族是**可数**的，所以能枚举成 $\nu$ 并配 $c_\nu$。score 与误差（`pert:77-93`）：

```tex
 D_\nu=\sum_{q=1}^{n_\nu}
 \frac{g_{0,q}S_{0,q}}
 {1+t_\nu g_q\sigma_{i_q}+u_\nu g_{0,q}S_{0,q}}.
```
```tex
 e_{\nu,N}(\mathbf u)
 =\frac{1}{c_\nu s_N}
 \mathbb E_{\mathbf u}\Big\langle
 \big|D_\nu-\mathbb E_{\mathbf u}\langle D_\nu\rangle\big|
 \Big\rangle.
```

（b）三段的中间步骤。

第一段（路径内涨落）。把自旋权重对数当 $X_L$、自旋配分函数是指数 $m_L=1$ 的那一步（`pert:121-125`），单层求导两条恒等式：$\partial_uX_{d-1}=K_d(\partial_uX_d)$、$\partial_u^2X_{d-1}=K_d(\partial_u^2X_d)+m_d\mathrm{Var}_{K_d}(\partial_uX_d)$。第二条我补推导：$X_{d-1}=m_d^{-1}\log K_de^{m_dX_d}$，对 $u$ 求一次得 $\partial_uX_{d-1}=\frac{K_d(m_de^{m_dX_d}\partial_uX_d)}{K_de^{m_dX_d}}=K_d^{\rm tilt}(\partial_uX_d)$，其中倾斜就是 $K_d$ 本身（按定义 $K_d\propto P_de^{m_dX_d}$）；再求一次，对"归一化期望"求导产生协方差项，即 $\partial_u(K(\phi))=K(\partial_u\phi)+m_d\mathrm{Var}_K(\phi)$ 形式，$\phi=\partial_uX_d$。逐层累加，正项 $\sum_dm_d\langle(M_d-M_{d-1})^2\rangle$ 保留最粗的 $d=1$ 一项，$m_1\mathrm{Var}(D_\nu|\mathscr F_0)$；负项来自 $\partial_uD_\nu=-\sum_q\frac{(g_{0,q}S_{0,q})^2}{\psi_{\nu,q}^2}$，在 $|t|+|u|<1/2$（故 $\psi>1/2$）下 $\ge-4n$，得 `pert:133-140` 的 $X_0''\ge m_1\mathrm{Var}(D_\nu|\mathscr F_0)-4n$。积分：$\int_a^bX_0''(u)du=X_0'(b)-X_0'(a)\le4n$（用 $|X_0'|\le2n$），故 $m_1\int_a^b\mathrm{Var}\,du\le4n+4n(b-a)$，取根期望并用 $\mathbb E[n_\nu]=\lambda_\nu$ 得 `pert:150-153` 的 $\frac{4\lambda_\nu(1+b-a)}{m_1}$。MAD 版：$\frac1{|I|}\int\mathbb E\langle|D-\mathbb E\langle D\rangle|\rangle\le\frac1{|I|}\int\sqrt{\mathrm{Var}}\le\big(\frac{4\lambda(1+|I|)}{m_1|I|}\big)^{1/2}$，除以 $\lambda$ 得 `pert:158-160`。这一段是"集中从凸性免费得到"的确切含义：**热方差（路径内）由二阶导的正项控制，不需要任何独立性**。

第二段（根均值集中）。$G(u)=X_0(u)+2nu^2$ 凸（因 $X_0''\ge-4n$，而 $(2nu^2)''=4n$）。Efron–Stein 用 Doob 差证明（`pert:181-189` 逐字给出 $\mathrm{Var}Z=\sum_j\mathbb ED_j^2\le\sum_j\mathbb E(Z-E_jZ)^2=\frac12\sum_j\mathbb E(Z-Z^{(j)})^2$），我确认等号链：$Z-\mathbb E Z=\sum_jD_j$，正交性给方差=二阶矩和；$D_j=\mathbb E[Z-E_jZ|\mathscr G_j]$ 的 Jensen 给 $\le\mathbb E(Z-E_jZ)^2$；$E_jZ$ 与 $Z^{(j)}$ 同律给最后一步。重抽一个交互/场/扰动项只改 $X_0$ 有界量（幂平均保持逐点界；删项时多余 mark 变量按其先验积掉，`pert:192-196`），条件方差和 $\le C_\nu N$；计数侧用 Lipschitz-Poisson 不等式 $\mathrm{Var}(b(Q))=\frac12\mathbb E(b(Q)-b(Q'))^2\le C^2\mathrm{Var}(Q)$（`pert:199-205`），独立计数相加完成 $O(N)$。$|\mathbb E_{\mathbf u}G'(u)|\le C_\nu\lambda_\nu$ 直接由 $|D_\nu|\le2n$ 与 $\mathbb En=\lambda_\nu$。

第三段（凸函数到导数）。$\bar G=\mathbb E_{\mathbf u}G$、$Z=G-\bar G$，双侧差商给

$$|G'(u)-\bar G'(u)|\le\frac{|Z(u-\rho)|+2|Z(u)|+|Z(u+\rho)|}{\rho}+\bar G'(u+\rho)-\bar G'(u-\rho),$$

单调性给 $\int_a^b[\bar G'(u+\rho)-\bar G'(u-\rho)]du\le2\rho[\bar G'(b+\rho)-\bar G'(a-\rho)]\le2\rho\cdot2C_\nu\lambda_\nu$（用端点导数界），加上 $\mathbb E|Z|\le\sqrt{\mathrm{Var}G}\le\sqrt{C_\nu N}$，得 `pert:226-231` 的 $\frac1{|I|}\int\mathbb E|G'-\mathbb E G'|\le C_\nu(\frac{\sqrt N}{\rho}+\frac{\rho\lambda_\nu}{|I|})$。取 $\rho=N^{-1/8}$（落在固定邻域裕量内，`pert:233-234`）后除以 $\lambda_\nu=c_\nu N^{3/4}$：第一项 $N^{1/2+1/8}/N^{3/4}=N^{-1/8}\to0$；第二项 $\rho\lambda_\nu/(|I|\lambda_\nu)=N^{-1/8}/|I|\to0$（$|I_\nu|$ 对固定类型是正常数）。去掉 $2nu^2$ 修正的代价 $C_\nu\mathbb E|n-\lambda_\nu|/\lambda_\nu\le C_\nu\lambda_\nu^{-1/2}$（Poisson 的标准差除以均值），也 $\to0$。

（c）机械理由，逐项：$t_\nu=j^{-1}$ 与 $u_\nu\in[j^{-j},2j^{-j}]$ 的分离是"多项尺度 vs 超多项式尺度"，前者进 Taylor 变量、后者进误差幅度；$j\ge4$ 保证 $|t|+|u|<1/2$（`pert:108-110` 选 $J_\nu$ 的要求）从而 $\psi\in(1/2,3/2)$、解析域与 $|D_\nu|\le2n$ 同时成立；$I_\nu$ 长度为正且固定，所以 $\frac1{|I_\nu|}$ 只进常数；$c_\nu$ 可任意小但不为零，$\lambda_\nu=c_\nu s_N\to\infty$ 是全部消失性的前提；$\pi$ 只用来**选确定性向量**（`pert:67-69`："We use $\pi$ to select deterministic parameter vectors, not as part of their quenched law."），这句话是"背景测度不变"的正面表述。$\rho=N^{-1/8}$ 的位置可以一般化：设 $\rho=N^{-\alpha}$，两项除以 $\lambda_\nu$ 后分别是 $N^{\alpha-1/4}$ 与 $N^{-\alpha}/|I_\nu|$，前者要 $\alpha<1/4$、后者要 $\alpha>0$，可行区间是 $\alpha\in(0,1/4)$，$1/8$ 取在中间并给两端各留余量 [推测：论文只写 "$\rho=N^{-1/8}$ lies within the fixed neighborhood margin"，未解释选幂的自由度]。

（d）失败路线：把 $u$ 当 quenched 随机参数，$\pi$-平均就变成对背景测度的改变，score 恒等式失去对象 [推测]；直接对 $t$ 求导取集中：$\partial_t\log\psi=g\sigma_i/\psi$ 无平方结构，$\partial_t^2$ 无定号正项，第一段失效 [推测]；$\rho$ 的幂出 $(0,1/4)$ 区间则两项之一不消失；$|I_\nu|$ 若随 $j$ 收缩得比 $j^{-j}$ 更快，第二项 $\rho/|I_\nu|$ 反被放大 [推测]。

**选序列（pert:selection）**：存在 N_j 与确定性 u_j 使增量 ≤underline F+2ε、每个固定类型 e_{ν,N_j}(u_j)→0、multioverlap 乘积期望收敛，**低增量与集中在同一个确定性参数向量上成立**，否则恒等式只在平均意义上成立无法代入比较。极限次序警告："errors in fixed-depth identities disappear before the hierarchy is refined"（常数对 L 不一致，每个 L 独立选序列）。

陈述逐字（`pert:255-267`）：

```tex
\begin{lemma}[Deterministic parameter selection]
\label[lemma]{pert:selection}
For every fixed $L\geq2$ and $\varepsilon>0$, there are sizes
$N_j\uparrow\infty$ and deterministic vectors $\mathbf u_j$ such that
 \item $\Delta_{N_j}(\mathbf u_j)\leq \underline F+2\varepsilon$;
 \item for every fixed type $\nu$, $e_{\nu,N_j}(\mathbf u_j)\longrightarrow0$ in the reservoir;
 \item in the reservoir, the expectations of every finite product of multioverlaps on
 every fixed finite prescribed tree of depth $L$ converge along this
 sequence.
\end{lemma}
```

中间步骤：$\liminf_N\frac1N\int P_N^{L,\mathbf u}\pi(d\mathbf u)=\underline F$（由 $|P_N^{L,\mathbf u}-NF_N|\le(\log2)s_N$ 除 $N$ 后一致趋零），若只有有限个 $N$ 满足 $\int\Delta_Nd\pi\le\underline F+\varepsilon$，则其后所有 $N$ 的平均增量 $>\underline F+\varepsilon$，telescope 使 $\frac1N\int P_N\pi$ 破坏 liminf，矛盾。$|\Delta_N|\le C$ 来自 `cavity:increment` 的一致界。对角选取：$\sum_{\nu\le j}\int e_{\nu,N_j}d\pi\le j^{-3}$ 可实现（每个固定类型积分趋零、有限和取 $N_j$ 足够大），Markov 给 $G_j^c$ 测度 $q_j\le j^{-3}/j^{-1}=j^{-2}$；$G_j$ 上条件均值增量 $\le\frac{\underline F+\varepsilon+Cq_j}{1-q_j}$，$j$ 大时 $Cq_j\le\varepsilon$、$(1-q_j)^{-1}\le2$ 但论文把系数收到 $\le\underline F+2\varepsilon$（`pert:291-296`），取 $G_j$ 内一点即 (i)(ii)。(iii)：固定 $L$ 下带标号树形与有限乘积可数、每个乘积绝对值 $\le1$，对角子列不影响 (i)(ii)。此后 "$N\to\infty$" 一律指沿该序列（`pert:308-312`："No uniformity in $L$, in the number of paths, or in a perturbation type is asserted for these limits."）。

机械理由：低增量与集中必须落在**同一个确定性向量**上，因为 Palm 恒等式的左边是 $\mathbb E[fD_\nu^{a_*}]$ 在这种向量下的值，平均版本无法代入 §5 的逐形状估计。$q_j$ 的 $j^{-2}$ 与 $Cq_j$ 的吸收解释了为什么 $\sum e\le j^{-3}$ 而阈值取 $j^{-1}$：两个幂次之间留一个 $j$ 的裕度。每个 $L$ 独立选序列是"常数对 $L$ 不一致"（`pert:103`："Constants need not be uniform in $L$ or $\nu$."）的直接后果 [推测：这就是 summary 那句极限次序自白的技术根源]。

**Palm 恒等式与解析提取（pert:palm、pert:analytic）**：Poisson add-one，除以均值 c_νs_N 后剩余计数仍是 Pois(c_νs_N)、其余计数不变，剩余模型恰有原 reservoir 律（"no type has been deleted from the law of the base reservoir"）；被区分项成为独立新插入，锚因子 A^{a_*} 与更新树密度相消。**枢纽：H_N(t,u) 对其所有类型 j 相同**，于是 j→∞ 的点值衰减 |H(j^{−1})|≤2Cj^{−j} 压过任何固定次幂 j^{−q}，首系数非零的反证失败，H≡0、逐系数归零。[推测]若对每个 j 重新定义 H_N^{(j)}（从 reservoir 删类型 ν），不同 j 的解析函数不同、反证失效；u_ν 若取固定值 j^{−2}，点值 Cj^{−2} 与 q=1 下界 cj^{−1} 不矛盾，**j^{−j} 超多项式衰减是必须的**。

（a）`pert:323-360` 的三块逐字：

```tex
 \left|\frac{\mathbb E[fD_\nu^{a_*}]
       -\mathbb E f\,\mathbb E\langle D_\nu\rangle}
       {c_\nu s_N}\right|
 \leq\|f\|_\infty e_{\nu,N}\longrightarrow0.
 \label{pert:score-identity}
```
```tex
 J_{N,\mathcal T}(t,u)
 &=\mathbb E\left[
 f\,\frac{g_0^{a_*}S_0^{a_*}}{A^{a_*}}
          W_{\mathcal T}(A)\right],\label{pert:palm-expression}\\
 H_N(t,u)
 &=J_{N,\mathcal T}(t,u)
   -\mathbb E f\,J_{N,\{a_*\}}(t,u).
```
```tex
If $\nu$ is a type with the specified marks, then
 |H_N(t_\nu,u_\nu)|\leq\|f\|_\infty e_{\nu,N}.
For a fixed mark specification the function $H_N(t,u)$ is the same
for all its types $j$: its base reservoir contains the full original
Poisson families, including all types.
```

（b）机制补两步。第一，$\mathbb E[fD_\nu^{a_*}]$ 里 $D_\nu$ 是类型 $\nu$ 全部 $n_\nu$ 项之和，Poisson add-one（Campbell 型）说 $\mathbb E[\sum_{q=1}^{n}h(\xi_q)]=\lambda\,\mathbb E[h(\xi_0)]$，其中 $\xi_0$ 是独立新点、其余计数仍 $\mathrm{Pois}(\lambda)$：除以 $\lambda=c_\nu s_N$ 后剩余模型律不变，被区分项变成"带参数 $(t_\nu,u_\nu)$ 的独立新插入"，其 score 恰为 $\frac{g_0S_0}{A}$，在各副本位置取幂后得 $\frac{g_0^{a_*}S_0^{a_*}}{A^{a_*}}$。第二，插入对树律的影响由 `tree:density` 的 $W_{\mathcal T}(A)$ 描述，锚叶上的 $A^{a_*}$ 与 score 的分母相消，于是 $J_{N,\mathcal T}$ 里出现的是** canceled** 形式 $\frac{1}{A^{a_*}}W_{\mathcal T}(A)$，正是 §2 canceled-anchor 展开能吃进去的形状。$\{a_*\}$ 版本（单锚旧树、测试为 1）给出 $\mathbb E\langle D_\nu\rangle/(c_\nu s_N)$，两者相减得 `pert:score-identity` 左边乘 $\|f\|_\infty$ 的界。

解析提取的链条（`pert:390-424`）：canceled-anchor 展开给 $|t|,|u|<\rho$ 上解析且对 $N$、选定参数一致有界，缩 $\rho$ 得 $u$-导数一致界，常数依赖固定树、$L$、$\|f\|_\infty$ 而**不依赖 $j$**（`pert:395-397`）；每个 Taylor 系数是规定树上有限多个 multioverlap 矩与两矩乘积的线性组合、系数与 $N$ 无关，由 (iii) 收敛；Taylor 尾的几何界给 $H_N\to H$ 在小圆盘一致；$\limsup_N|H_N(j^{-1},0)|\le C\limsup_N|u_{\nu,N}|\le2Cj^{-j}$；若首非零系数次数 $q$，则 $|H(j^{-1})|\ge cj^{-q}$，与 $j^{-j}$ 矛盾，故 $H\equiv0$。

（c）机械理由：$H_N$ 与 $j$ 无关是整条提取的枢纽，它成立只因基底 reservoir 含**全部**类型（`pert:357-359` 与 `pert:379-380` 两次声明）。$j^{-j}$ 的作用是让"点值衰减"比任何固定次幂快，从而反证首系数存在性；$j\ge4$ 保证进解析域。误差 $\|f\|_\infty e_{\nu,N}$ 中 $f$ 固定、系数与 $N$ 无关，这两点合起来才允许 $j$ 固定后再取 $N\to\infty$。

（d）失败路线：每个 $j$ 重定义 $H_N^{(j)}$（从 reservoir 删类型）会让"同一个解析函数"变成一族，$j^{-j}$ 不再约束任何单一极限 [推测]；$u_\nu$ 取多项式小值（如 $j^{-2}$）时点值界与 $q=1$ 的下界 $cj^{-1}$ 并存不矛盾 [推测]；$f$ 依赖 $N$ 或树形集合含 $N$ 时 Taylor 系数的 $N$-无关性破，(iii) 的对角化不覆盖 [推测]。

**规定树恒等式（pert:tree-identity）**：极化（混合导数=单方向 degree-k 系数的极化，k^k/2^k k!·Σ(∏ε_j)Q_N(k^{−1}Σε_jg_j)，每个自变量有理有界仍属固定 mark 族）+**标记选择器**（颜色对与深度的"分裂深度 ≥d"=共享深度 d 顶点；引入独立 Rademacher 坐标、mark 期望贡献 1 当共享 0 当不共享；精确在 d 分裂=H_d−H_{d+1}）。[推测]想直接规定"新副本与某个旧副本（非锚）的分裂深度"，mark 因子要挂到旧路径上、破坏 canceled-anchor 展开中旧叶未保护的地位，decorrelation 的"对齐深度的两份 S 副本"正是绕开这一点的设计。

（a）定理体逐字（`pert:451-470`）：

```tex
\begin{theorem}[Identity on prescribed trees]
For the perturbation family defined above, along every sequence from
Lemma~\ref{pert:selection},
\begin{equation}
 \sum_{E\in\mathfrak E(\mathcal T,a_*,\mathcal C)}
       c_E\,\mathbb E[fR_E]
 -\mathbb E f
  \sum_{E\in\mathfrak E(\{a_*\},a_*,\mathcal C)}
       c_E\,\mathbb E[R_E]
 \longrightarrow0.
 \label{pert:tree-identity-eq}
\end{equation}
This holds for every fixed old tree, either kind of anchor, every
bounded polynomial $f$ in its multioverlaps, every finite number of
ordered added colors, and every prescribed constraint $\mathcal C$.
The empty addition is allowed.  The error is taken to zero at fixed
$L$, fixed tree, and fixed constraint, before any limit in $L$.
\end{theorem}
```

（b）极化常数的来历。$Q_N(g)=k![t^k]H_N(t,0)$ 是单方向 $g$ 的 degree-$k$ 系数。混合插入 $A=1+\sum_jz_jg_j\sigma_i$ 的 $\partial_{z_1}\cdots\partial_{z_k}$ 在 $0$ 处等于对称 $k$-线性形式作用在 $(g_1,\ldots,g_k)$。标准极化用 Rademacher 平均提取该 multilinear 部分：对 $k$-齐次 $Q$，$\frac1{2^k}\sum_{\epsilon}(\prod_j\epsilon_j)Q(\sum_j\epsilon_jv_j)=k!\,Q(v_1,\ldots,v_k)$（单项 $v_{i_1}\cdots v_{i_k}$ 只有当每个指标恰好出现一次时不被抵消，这样的项有 $k!$ 个）。论文把 $v_j$ 归一成 $k^{-1}g_j$ 以保持在 $[-1,1]$ 内，于是 $Q(k^{-1}\sum\epsilon_jg_j)=k^{-k}Q(\sum\epsilon_jg_j)$，前面的 $k^k$ 就是补偿这个缩放的，合起来正是 `pert:482-487` 的 $\frac{k^k}{2^kk!}\sum_\epsilon(\prod\epsilon_j)Q_N(k^{-1}\sum_j\epsilon_jg_j)$；$k!$ 在分母把 $Q_N$ 里自带的 $k!$ 抵消。每个自变量仍是有理值、界由 1，所以属固定 mark 族，`pert:analytic` 可用；且"混合导数展开恰是有序扩展规则、无额外阶乘"（`pert:491-492`）。

选择器的机制：颜色对 $(a,b)$ 与深度 $d$，"$a,b$ 分裂深度 $\ge d$" 等价于"它们在深度 $d$ 共享顶点"。在该深度放一个新的独立 Rademacher 坐标 $\xi$，同时把 $\xi$ 乘进 $g_a$ 与 $g_b$，则 mark 期望里 $\mathbb E\xi^2=1$（共享，同一个坐标值）而 $\mathbb E\xi=0$（不共享，两次独立抽样）。多个要求用不同独立坐标，$g_a$ 取所配因子之积，得 `pert:505-511` 的

```tex
 \mathbb E_{\rm marks}
       \left[g_0^{a_*}\prod_{j=1}^kg_j^{a_j(E)}\right]
 =\prod_{(a,b,d)\ {\rm required}}
       \mathbf1_{\{a,b\text{ share their depth-}d\text{ vertex}\}}.
```

精确在 $d$ 分裂 $=H_d-H_{d+1}$，$H_0=1$、$H_L=0$；乘积与有限线性组合选出任意一致着色形状。$R_E$ 的定义里 spin anchor 带 $\sigma_i^{a_*}$、marker anchor 不带（`pert:440-449`），$k=0$ 时两者分别是 $R_{\{a_*\}}$ 与 $1$。

（c）机械理由：$H_L=0$ 对**相异副本位置**成立，因为深度 $L$ 的终点是不同顶点（`trees:34-37`："Replica positions at depth $L$ are distinct vertices, but the values sampled there need not differ."），这句是"位置 vs 自旋值"混淆的防线，也是 mark 只用到深度 $L-1$ 的原因（约束都在 $d\le L-1$ 检验）；每个 $g$ 都是有界乘积、有理值，才能同时满足解析族固定与选择器精确；误差在固定 $L$ 的有限树/约束族上取极大得 $\varepsilon_{N,L,k}\to0$（`decor:identity-error` 用它）。

（d）失败路线：想规定"新副本与某非锚旧副本的分裂深度"，$g$ 因子必须挂到旧路径上，而旧路径在 canceled-anchor 规则里是"未保护的候选"，加因子会改写它的系数 $1$ [推测]；用非 $\{\pm1\}$ 值的连续权重 $g$，mark 族的有理有界性破坏，`pert:analytic` 的一致界失去 [推测]；把 $H_d$ 解释成自旋相等示性，深度 $L$ 处两个副本自旋可巧合同值，恒等式多出虚假约束 [推测]；极化里漏掉 $k^k$ 缩放补偿，则 $\sum_\epsilon$ 前的常数错、得到的是 $\le$ 型，并非 $=0$ 型极限，后续除法系数无法对齐 [推测]。

## 5. 去相关（decorrelation.tex）：深度平移的主战场

**归纳对象 v_N(S,d)=N^{−2}𝔼Σ_{ij}Cov(A_{S,i},A_{S,j}|𝓕_d)²**。[推测]选它是因为能同时承担两个方向：上控（条件独立收缩 ‖(A_S−μ)·B‖≤v^{1/4}）与下界（三副本 E(X·Y−X·Z)²≥(2/N²)𝔼ΣC_{ij}²）。**深度连续性（decor:depth-continuity）**：单路径上 μ_{t,T} 是有界向量鞅、增量正交 Σ𝔼‖μ_{t+1}−μ_t‖²≤1（martingale energy）⇒ 单顶点深度平移的平方误差平均 ≤C/L；regular 保证平移后坐标落入 η/2-regular 域。**这就是 "average error little" 的兑现：不求逐深度（质量可集中在一个深度）、只求固定深度族求和后被 L 摊薄。**

（a）原文逐字。节首的量化约定我全文照抄，因为它把这一节所有常数的依赖关系钉死了（`decor:1-12`）：

```tex
Throughout this section $m_d=d/L$ and $\delta=L^{-1}$.  The leaf set of
a prescribed tree is a subset of $[k]$, and its branching depths lie in
$\{1,\ldots,L-1\}$.  Different values of $L$ may use different sequences
of reservoir sizes and deterministic parameter choices from
Lemma~\ref{pert:selection}.  This section uses only the tilted
branching structure of the reservoir and the hierarchy of message
spaces.  It does not use the interaction factorization or the positivity
hypothesis from \cref{model:factorization}.
```

平均算子与正则形状（`decor:average-definition`）：

```tex
 \mathcal A_{L,\eta}z
   =L^{-a}\sum_{\mathbf q\ \eta\text{-regular}}z(\mathbf q),
 \qquad
 \mathcal V_{k,L}(\eta)
   =\sup_N\max_{\mathcal A_{L,\eta}}\sum_{\emptyset\ne S\in\mathfrak S_k}
      v_N(S,\cdot),
```

主定理（`decor:overlap-concentration`，即本节唯一要输出的东西）：

```tex
For every fixed depth $L\ge2$, every prescribed-tree leaf subset $S$, and
$\eta>0$,
 \lim_{N\to\infty}\mathcal A_{L,\eta}\E\bigl|R_S-\E R_S\bigr|=0.
```

深度连续性与三副本不等式的原文（`decor:martingale-energy`、`decor:three-copy-bound`）：

```tex
 \sum_{t=0}^{|T|-1}\E\|\mu_{t+1,T}-\mu_{t,T}\|_N^2\le1,
 \qquad
 \mathbb E\bigl[(X\cdot Y-X\cdot Z)^2\mid\mathscr G\bigr]
  \ge\frac2{N^2}\sum_{i,j}C_{ij}^2.
```

（b）推导补齐。**收缩方向**（`decor:contractions` 第一式）：对任意在 $\mathscr F_d$ 条件下独立抽取的副本向量组 $\{B_j\}$，$\|B_j\|_N\le1$，写 $A_S=(\mu_{ij})$，则 $N^{-1}\sum_j (A_S-\mu)\cdot B_j$ 的条件期望为零，取二阶幂并用协方差矩阵 $C=N^{-1}\sum_jB_jB_j^{\mathsf T}$ 得 $\mathbb E\|N^{-1}\sum_j(A_S-\mu)B_j\|^2$ 的界里出现 $N^{-2}\sum_{ij}C_{ij}B_iB_j$ 型项；两次 Cauchy–Schwarz：一次把 $\sum_{ij}C_{ij}B_iB_j$ 的期望压成 $(\sum C_{ij}^2)^{1/2}(\sum B_i^2B_j^2)^{1/2}$，一次把 $v_N$ 的平方协方差结构提出来，最后开方两次得 $\|(A_S-\mu)\cdot B\|\le v_N(S,d)^{1/4}$。**四次根的来源是两次 Cauchy–Schwarz 各贡献 1/2 次幂**，不是任取的指数。

**三副本方向**：条件在组态上，$X,Y,Z$ 是在 $\mathscr F_d$ 之下独立同律重抽的三份副本，令 $m_i=\mathbb E[\sigma_i\text{ 型量}\mid\mathscr F_d]$ 与 $C_{ij}$ 为条件协方差，则 $\mathbb E[(X\cdot Y-X\cdot Z)^2\mid\mathscr G]=\frac2{N^2}\mathrm{tr}((C+\mu\mu^{\mathsf T})C)$。展开验证：$X\cdot Y-X\cdot Z=(Y-Z)\cdot X$，条件二阶矩里交叉项消掉，$\mathbb E[Y_iY_j]-\mathbb E[Y_i]\mathbb E[Z_j]=C_{ij}$，于是得到 $\frac1{N^2}\sum_{ij}(\mathbb E[\sigma_i\sigma_j\mid\mathscr F_d]+\mu_i\mu_j)(\cdots)$ 形式，$C+\mu\mu^{\mathsf T}$ 是 Gram 型矩阵因此半正定，丢掉半正定项 $\frac2{N^2}\mu^{\mathsf T}C\mu\ge0$ 就剩 $\frac2{N^2}\mathrm{tr}(C^2)=\frac2{N^2}\sum C_{ij}^2$。**这一步是"平方"的真正用途**：左边是可除的量（三个真实副本，同一个 reservoir 抽三遍），右边是 $v_N$ 的分子，中间没有任何"两个独立平均副本被钉到对角线"的操作。

**鞅能量**（`decor:depth-continuity` 内部）：沿单条路径，$\mu_{t,T}$ 是对 $\sigma$-域链 $\mathscr F_t$ 的条件期望向量，$\|\mu_{t,T}\|_N\le1$；正交增量 $\sum_t\mathbb E\|\mu_{t+1}-\mu_t\|_N^2=\mathbb E\|\mu_{|T|,T}\|_N^2-\mathbb E\|\mu_{0,T}\|_N^2\le1$。单顶点平移一位的误差写成 $\|\mu_{t+1}-\mu_t\|_N$，平方后对 $t$ 求和被能量吸收；再对深度族求平均、除以 $L$（$\mathcal A_{L,\eta}$ 的归一化 $L^{-a}$ 只归一化 $a$ 个分支坐标，一个被平移的单顶点坐标多出一个 $L$ 因子）得 $C/L$。$C_k$ 只依赖形状是因为一个 $k$ 叶树最多 $\binom{k}{2}\le k^2/2$ 个内部顶点，逐顶点三角不等式后形状数有限。

**为什么必须 regular**：平移 $q_v\mapsto q_v+1$ 后若某个新分支深度撞上别的分支深度，坐标不再落在 $\{1\le d_1<d_2<\dots\}$ 的开序域里，$\mu$ 的连续性估计要额外处理重合情形（重合时两点差是"两位增量"，能量界仍给常数但归一化次数变化）。原文用 `tree:regular-shapes` 一次性把撞车情形归入测度 $O(\eta)$ 的坏集，好集内平移自动落回 $\eta/2$-regular 域，这是 $V_{k-1,L}(\eta/2)$ 里 $\eta/2$ 的出处。

（c）机械理由：$v_N$ 定义为**平方**协方差和（不是协方差绝对值和、不是协方差本身），因为三副本不等式给出的自然量是 $\sum C_{ij}^2$，而收缩不等式给的是 $v^{1/4}$，两头都按平方口径记账；$\delta=L^{-1}$ 与 $m_d=d/L$ 的选择让"单点 fresh 分裂系数恰为 $-\delta$"（见 §2 的 $\kappa$ 讨论），于是深度连续性的误差阶与 fresh 分裂的除数阶同为 $L^{-1}$，两边可以直接对消；$\mathcal A_{L,\eta}$ 未归一（总质量 $\le1$），并非取平均，是为了让 `decor:identity-error` 的 $\varepsilon_{N,L,k}$ 项在乘形状数后仍只是常数倍小量，原文还特意声明"Constants multiplying this error may depend arbitrarily on $L$"（`decor:identity-error`），即本节绝不试图在 $L$ 上一致。

（d）候选失败路线：[推测]想把深度连续性从平均版升级成逐深度版（"$q_v+1$ 与 $q_v$ 处的 $\mu$ 几乎相等"逐点成立），会在质量集中处停住：条件律可以把全部变化塞进一个深度，此时该深度误差是 $O(1)$ 而平均只是 $O(1/L)$，逐点版为假；[推测]想用两独立副本差 $X-Y$ 代替三副本 $X\cdot Y-X\cdot Z$，则 $\mathbb E[(X\cdot Y)^2]$ 里含 $\mathrm{tr}(C\cdot C)$ 之外的 $\mu$ 项且带号不定，无法把左边整理成可除的平方协方差；[推测]想让收缩与三副本共用一个非平方口径（协方差本身），则除以 $J$ 后的相对绝对代价界 `decor:relative-absolute-cost` 不再闭合，因为 charging 只对"绝对值乘积之和"成立。

**条件去相关（decor:conditional-concentration）：三副本归纳**：单叶情形的规定树恒等式给 ½Σc_ℓ𝔼(X−X_ℓ)²=δVar(X)+o_N(1)、c_d≥η ⇒ v_N(S,d)≤δ/η+o_N(1)。k≥2：**平移副本** S⁺（所有内部深度 +1），抽旧树=S 的两份副本 I、II、干在 d 分裂、**内部分支深度对齐**；J=κ(S⁺)²、|J|≥cδ^{2b}。两副本深度对齐但顶点相异、**每个顶点各付各的 δ**（"distinct new branching vertices are charged to distinct fresh divergences, including when their depths coincide"）；regular 使平移深度异于旧树一切分支深度 ⇒ 2b 个目标顶点必须由 fresh unary 分裂创建、charging 精确吸收 1/|J|。带号扩展求和后得**归纳恒等式**：Σc_ℓ𝔼[f(a·b−a·b_ℓ)]=δ(𝔼[f(a·b)]−𝔼f·𝔼R_target)+ρ_N；收尾：a·b_ℓ 与 a·b 同边际律 ⇒ 左端 ≥½c_d𝔼(a·b−a·b_d)²；fiber 界（γ=1/4）处理深度平均换算：**对齐副本用单副本估计，没有"独立平均的一对副本被限制到对角线"的困难**；递归 V_{k,L}(η)≤C(L^{−1/2}+V_{k−1,L}(η/2)^{1/4}) 归纳归零。[推测]不平移则目标分支顶点可落在旧树分支深度上、fresh 分裂不再被迫、绝对系数和不以 δ^b 衰减、除以 J~δ^{2b} 后爆炸。这就是 summary 卡点 5 的精确形态；两副本若独立抽深度，联合质量 ~L^{−2b} 与 J 不匹配。

（a）原文逐字。平移的动机与除法的合法性在同一句里（`decor:345-359`）：

```tex
For large $L$, regularity ensures that each shifted depth differs from
every branching depth of the old tree, including $d$.  Thus these $2b$
target branching vertices must be created by fresh unary splits.
Lemma~\ref{tree:charging} gives
 \frac1{|J|}\sum_{\text{allowed extensions}}|c| \le C_{k,\eta}.
The two copies have aligned depths but distinct branching vertices:
each vertex supplies its own factor $\delta$.  This is the reason for
the shift.  The full signed coefficient has an additional factor
$-\delta$ from separation at $d$; we divide by $J$ and leave that
factor in the identity.  Equation~\eqref{decor:relative-absolute-cost}
then controls every projection error after division.
```

带号系数表（`decor:426-431`，我把它当作本节的中枢记账来读）：

```tex
 \text{side-II prefix} & \text{projected overlap} & \text{total coefficient}\\ \hline
 \text{fresh divergence at }d\le\ell<e & a\cdot b_\ell & -c_\ell J\\
 \text{old prefix through }e & a\cdot b & m_eJ
```

归纳恒等式、误差、三口收尾（`decor:induction-identity`、`decor:induction-error`、`decor:projected-three-copy`、`decor:covariance-induction-estimate`、`decor:induction-recursion`）：

```tex
 \sum_{\ell=d}^{e-1}c_\ell \mathbb E\bigl[f(a\cdot b-a\cdot b_\ell)\bigr]
 =\delta\bigl(\mathbb E[f(a\cdot b)]-\mathbb Ef\,\mathbb ER_{\mathrm{target}}\bigr)+\rho_N(S,d),
 |\rho_N(S,d)|\le C_{k,\eta}\bigl(p_N(S^+,e+1)+h_N(S)\bigr)+C_{L,k,\eta}\varepsilon_{N,L,k},
 \mathbb E(a\cdot b-a\cdot b_d)^2\le C_\eta\bigl(\delta+p_N(S,e)+|\rho_N(S,d)|\bigr),
 v_N(S,d)\le C_{k,\eta}\bigl(\delta+p_N(S,e)+p_N(S^+,e+1)+h_N(S)\bigr)+C_{L,k,\eta}\varepsilon_{N,L,k},
 V_{k,L}(\eta)\le C_{k,\eta}\left(L^{-1/2}+V_{k-1,L}(\eta/2)^{1/4}\right).
```

（b）推导补齐。**系数记账**：$c_d=(d+2)\delta$、$c_\ell=\delta$（$\ell>d$），所以

$$\sum_{\ell=d}^{e-1}c_\ell=(d+2)\delta+(e-1-d)\delta=(e+1)\delta=m_e+\delta .$$

规定树恒等式对常函数求和为零（§2 的 telescope $\sum_\beta(n_\beta m_{d_\beta+1}-m_{d_\beta})=n$ 给出归一化，展开后各类系数净和为零），因此"未分裂/沿用旧前缀"这一类必须承担其余一切：它的系数 $=\big(\sum_\ell c_\ell\big)J-\delta J=m_eJ$，多出来的那个 $-\delta J$ 就是原文"additional factor $-\delta$ from separation at $d$"，它被留在恒等式里不除。除以 $J$ 后右端只剩 $\delta\times$(两个均值之差)，而 $|f|\le1$、$|R_{\mathrm{target}}|\le1$ 给出 $|\mathbb E[fab]-\mathbb Ef\,\mathbb ER_{\mathrm{target}}|\le2$，这就是右端 $\le2\delta+|\rho_N|$ 的出处。[推测]原文"That the total coefficient is $-\delta J$, both from the old tree and from the anchor alone"这两类的具体投影重叠我按"旧树侧=沿用旧前缀类、锚侧=anchor-alone 延拓类"来理解，符号分配是我从系数净和为零反推的，正文只写了结论。

**投影误差怎么进来的**：$f$ 乘上投影误差后，$|f|\le1$ 使其代价不超过该误差自身的 $L^2$ 范数（这点原文特意强调"even when correlated with it"），于是绝对系数求和后除以 $|J|$ 正好被 `decor:relative-absolute-cost` 吃掉；$p_N(S^+,e+1)$ 是目标侧投影（两次：深度改回一位、评估深度由 $e+1$ 改回 $e$），后者由乘积差分不等式 + 深度连续性给出 $h_N(S)$，且 $\mathcal A_{L,\eta}h_N^2\le C_k/L$。**这里有个我起初漏看的细节**：$h_N(S)$ 只依赖单边边际形状、不依赖具体延拓，所以它可以一致地用在扩展和的每一项上，即使"旧树 ∪ 目标树"整体深度不再 regular。

**归纳闭合**：把左端的 $f$ 换成 $a\cdot b$ 只花 $4p_N(S,e)$（$\|f-ab\|_{L^2}\le2p_N(S,e)$，且 $\sum_\ell c_\ell\le1$）；$a\cdot b_\ell$ 与 $a\cdot b$ **同边际律**（这是设计出来的：$b_\ell$ 是新干上的 $a_{S,e}$，与 $b$ 有相同的抽样规则），于是 $\mathbb E[(ab)-(ab_\ell)^2]$ 型对称化把左端变成 $\frac12\sum_\ell c_\ell\mathbb E(ab-ab_\ell)^2\ge\frac12 c_d\mathbb E(ab-ab_d)^2$，$c_d\ge\eta$ 提供可除性。三份条件独立副本 + 三副本不等式把 $\mathbb E(ab-ab_d)^2$ 换成 $\sum C_{ij}^2$ 型量，投影改动各花 $2p_N(S,e)$，得 `decor:covariance-induction-estimate`。

**fiber 界（深度平均的换算）**：对齐构造里有 $D=b(S)+1$ 个不同的深度坐标（含 $d$ 与 $e$），属于 $T_j$ 的项只用 $D_j=b(T_j)+1$ 个；平移项的坐标映射是 $\pi_j(\mathbf q)=(e+1,(q_v+1)_{v\in\mathrm{Br}(T_j)})$，每个保留的像至多有 $L^{D-D_j}$ 个原像，且大 $L$ 下落入 $\eta/2$-regular 域。于是对 $0<\gamma\le1$：

$$L^{-D}\sum_{\mathbf q\ \eta\text{-reg}}w_j(\pi_j(\mathbf q))^\gamma\le L^{-D_j}\sum_{\mathbf y\ \eta/2\text{-reg}}w_j(\mathbf y)^\gamma\le\Big(L^{-D_j}\sum_{\mathbf y\ \eta/2\text{-reg}}w_j(\mathbf y)\Big)^\gamma,$$

第一个不等式是原像计数（每个 $\mathbf y$ 被至多 $L^{D-D_j}$ 个 $\mathbf q$ 命中），第二个是 Jensen（$t\mapsto t^\gamma$ 凹）。**这一步的意义**：归纳假设 $V_{k-1,L}$ 是在"单份树自己的深度族"上平均的，而恒等式里出现的是两份对齐副本的联合深度族；fiber 界把联合平均降级成单副本平均，代价只是把 $\eta$ 换成 $\eta/2$。原文随后写明"The two aligned copies use single-copy estimates; there is no restriction of an independently averaged pair of copies to a diagonal"，即不需要把两个独立平均的副本对钉到对角线上（那正是 purity 类断言失败的地方）。取 $\gamma=1/4$ 与 $\limsup_N$，配合 `decor:projection-shift-error`（$C_k/L$，开方后 $L^{-1/2}$）与 `decor:identity-error`，得递归。**递归怎么真的归零**（正文只写"The base case and induction now imply"，我把量词补出来）：基例是 $k=1$，由单叶规定树恒等式直接给 $V_{1,L}(\eta)\le\delta/\eta+o_N(1)$（本节开头那条），它随 $L\to\infty$ 归零；每个 $v_N$ 分量不超过 1（原文"these covariances are bounded by one"），所以 $V_{k-1,L}^{1/4}$ 是把趋于零的量取正幂，仍趋于零；展开 $k$ 层后 $L^{-1/2}$ 项的总系数至多 $C^{1+1/4+1/16+\cdots}\le C^{4/3}$，$k$ 固定时有限。$\eta$ 每层折半共 $k-1$ 次、$k$ 固定故 $\eta/2^{k-1}>0$，于是每个固定 $k,\eta$ 有 $V_{k,L}\to0$。

（c）机械理由（含层级步数）。$b=b(S)\le k-1$ 是分支顶点数，$\kappa(S^+)^2$ 的绝对值下界是 $c\delta^{2b}$：两份副本各贡献 $b$ 个 fresh 一元分裂、每个带一个 $\delta$。除以 $J$ 需要绝对系数和以同幂的 $\delta^b$ 衰减，而 charging 给出的绝对衰减幂次**等于被迫 fresh 分裂的个数**，不是分支顶点个数。所以：对齐（同一组深度）但顶点相异（不同的分裂事件）是使两个计数相等的唯一办法，这就是平移的全部机械功能，也解释了为什么 $S^+$ 是"所有内部深度 +1"，并非随便扰动几个深度：整体 +1 保证 (i) 与旧树一切分支深度（含 $d$）分离，(ii) 与 $d$ 的比较结构保持，(iii) 像仍落在正则域内。RSB 步数在此节的体现是 $\gamma_\beta=m_{d_\beta}-n_\beta m_{d_\beta+1}$ 的严格正性链 $0<m_1<\dots<m_r<1$：归纳只在**外层第一个分裂深度 $d$** 上做除法（$c_d\ge\eta$），内层 $b-1$ 个分支顶点全部通过 fiber 界交给子形状 $T_j$ 的归纳假设，因此每加一层 RSB 就多用掉一个深度坐标、并把 $\eta$ 折半；$b$ 有限（$\le k-1$）是这条链能闭合的原因，一旦 $k$ 不固定（比如要控制整个重叠分布），层数无界、$\eta/2^k\to0$，折半预算破产。这就是"为什么在这一层断裂"：**断裂点不在代数，在 $\eta$ 的折半预算与 $L^{-b}$ 深度平均的组合。**

（d）候选失败路线：[推测]把平移改成"随机选一两个内部深度 +1"，则部分分支顶点仍落在旧树分支深度上，那些类的带号和 $\gamma_\beta$ 可近零而绝对值不小，`decor:relative-absolute-cost` 失败；[推测]把 $J$ 取成 $\kappa(S)$（不平移的自身系数），则 $\kappa(S)$ 在同一深度族的两个顶点上可含相同因子 $m_d-jm_{d+1}$，下界 $c\delta^{2b}$ 直接不成立；[推测]想跳过 fiber 界、直接把 $v_N(S,d)$ 的联合深度平均塞进归纳假设 $V_{k-1,L}$，会在归一化次数上差一个 $L^{D-D_j}$（平均口径不同，界会多出 $L^{b-1}$ 因子），递归不能归零；[推测]若想统一在 $L$ 上取 $\limsup$，`decor:order-of-limits` 明确写"No rate of convergence in $N$ uniform in $L$ is used"，即本节根本不提供这种强度，未除尽的小分母只在固定 $L$ 的有限树族上消失。

**marker anchor（decor:marker-variance-identity）**：单点用无加色 spin-anchor 恒等式；一般 S 首分裂于 e，以 S 为旧树、指定一叶为 **marker anchor**（S₀=1），加一份完整 S 副本、全部叶在 **e−1**（，并非 e）从锚分裂：首路径必须 fresh（旧树在该处未分支），两侧扩展系数相同且非零：C(S,e)=−δ·κ(S)。锚侧删掉 e−1 之下的延拓（概率核积分 1）回到普通目标律 ⇒ 恒等式给 C(S,e)Var(M)=o_N(1)、**条件均值 M 的方差在每个固定 L,S,e 归零**。[推测]marker 放在 e 则旧树已分支、系数是组合可能为零；想一步到位证 Var(R_S) 小则条件方差部分（归纳）与条件均值部分（marker）需要两个机制、单一恒等式不覆盖。这正是 summary 里 "An exact purity claim also proves too strong" 的分工化。方差分解+fiber 界（γ=1/2）+条件去相关收尾。

（a）原文逐字（`decor:537-569`、`decor:adjacent-prefix-error`、`decor:variance-estimate`）：

```tex
Suppose $S$ first splits at $e$ and has proper child shapes $T_1,\ldots,T_s$.
We will condition one step before $e$.  Use $S$ as the old tree, designate one of its
leaves as a marker anchor, and add a full copy of $S$ all of whose
leaves split from the anchor at $e-1$.  Its first path must be fresh at $e-1$,
because the old tree has not yet branched there.
 C(S,e)=-\delta \kappa(S).
 C(S,e)\bigl(\mathbb EM^2-(\mathbb E R_S)^2\bigr)=C(S,e)\operatorname{Var}(M)=o_N(1),
 \mathcal A_{L,\eta}\mathbb E(G-G_-)^2\le C_k/L.
 \limsup_{N\to\infty}\mathcal A_{L,\eta}\operatorname{Var}(R_S)
   \le C_k\left(L^{-1}+V_{k-1,L}(\eta/2)^{1/2}\right)
```

以及关键的一句免责："Division by $C(S,e)$ is made only at fixed $L$; no uniform lower bound as $L\to\infty$ is needed."

（b）推导补齐。**系数 $C(S,e)=-\delta\kappa(S)$ 怎么算**：树密度里每个内部顶点 $v$ 的指数是 $\gamma_v=m_{d_v}-n_v m_{d_v+1}$，乘积形式 $\kappa(S)=\prod_v\prod_{j=1}^{a_v-1}(m_{d_v}-jm_{d_v+1})$。目标副本的全部 $k$ 条路径都在同一深度 $e-1$ 从锚出发：$e-1$ 处的 first path 被迫 fresh，旧树在该深度尚未分支（$S$ 首分裂于 $e$），因此这一处的扩展系数是**一元 fresh 分裂系数** $m_{e-1}-m_e=\delta$，带号约定给出 $-\delta$；其余目标路径都落在这棵新建子树内部，各顶点的因子按扩展求和回收为旧树自身的 $\kappa(S)$（`tree:reference-total` 的"反向求和后回收参考树系数"）。两侧（旧树侧与锚侧）同形，所以系数相同且非零，这正是能在恒等式里**解出** $\mathrm{Var}(M)$ 的原因：恒等式左右各只有一个未知类。

**为什么删掉锚在 $e-1$ 之下的延拓就回到普通目标律**：$e-1$ 之下锚的分支是概率核的迭代，核积分为 1，对核下所有分支历史求和等于把该子树"积掉"，剩下的边际正是 $S$ 自身律，均值 $\mathbb ER_S$；这就是 §2 里"canceled anchor 扩展"的同一机制（概率核积分归一，不引入新变量、不改变旧路径的联合边际）。于是恒等式两侧分别是 $\mathbb E[M^2]$（条件独立两份副本的乘积，条件在 $\mathscr F_{e-1}$ 上）与 $(\mathbb ER_S)^2$。

**方差分解的三步**：$M=\mathbb E[R_S\mid\mathscr F_{e-1}]$ 是条件均值部分（marker 处理），$\mathbb E(R_S-M)^2$ 是条件方差部分（归纳处理）。原文用最优 $L^2$ 投影：$\mathbb E(R_S-M)^2\le\mathbb E(R_S-G_-)^2\le2p_N(S,e)^2+2\mathbb E(G-G_-)^2$，其中 $G=\mathbf1\cdot\prod_j\mu_{e,T_j}$、$G_-=\mathbf1\cdot\prod_j\mu_{e-1,T_j}$（后者 $\mathscr F_{e-1}$-可测）。$G\to G_-$ 的花费来自乘积差分不等式，配合逐因子深度连续性 `decor:martingale-energy`；这里 $e$ 本身是被求和的坐标（"e is itself a ranged coordinate"），所以增量在除以 $L$ 之前先求和，得到 $C_k/L$。最后用 $p_N(S,e)^2\le s\sum_jv_N(T_j,e)^{1/2}$ 与 `decor:fiber-bound`（$\gamma=1/2$；此处全平均有 $D=b(S)$ 个坐标因为 $d$ 不出现，而 $D_j=b(T_j)+1$）把条件方差部分换成 $V_{k-1,L}(\eta/2)^{1/2}$。方差分解 $\mathrm{Var}(R_S)=\mathrm{Var}(M)+\mathbb E\mathrm{Var}(R_S\mid\mathscr F_{e-1})$，前一项 $o_N(1)$、后一项被上面控制，定理得证。

（c）机械理由：**marker anchor 不带自旋因子**（$S_0=1$，对比 spin anchor 的 $\sigma_i^{a_*}$），因为它要测的是"前缀投影 $M$ 自身的涨落"，加自旋会把观测对象换成重叠；**分裂放在 $e-1$ ，并非 $e$**，因为 $e$ 是旧树的首个分支深度，在那里 target 与 old 共享分支结构、扩展系数变成组合量（可能为零或依赖具体分布），恒等式失去可解性；**条件 σ-域也放在 $e-1$**，因为可除系数与条件深度必须匹配（$C(S,e)$ 里的 $\delta$ 恰是 $e{-}1\to e$ 那一步的一元分裂）；最终估计里出现 $L^{-1}$（，并非 $L^{-1/2}$），因为这里是平方口径（$\mathbb E(G-G_-)^2$ 直接平均，不再开方）。

（d）候选失败路线：[推测]把 marker 直接放 $e$：系数不再是单一的 $-\delta\kappa(S)$，是一堆 $\gamma_\beta$ 的组合和，恒等式右端多出未知项，无法分离 $\mathrm{Var}(M)$；[推测]想只用 marker 一步证明 $\mathbb E|R_S-\mathbb ER_S|$ 小（purity 型断言）：marker 只消掉条件均值部分，条件方差部分必须走归纳，一个恒等式覆盖两个机制的期望在结构上落空，这就是 summary 里 "An exact purity claim also proves too strong" 在我读来的分工化解释；[推测]若把最终强度写成"$R_S$ 依概率收敛到常数"而不要 $L^2$ 口径，`decor:three-copy-bound` 的平方结构不再有对应物，收缩方向与三副本方向失去同一量纲。

## 6. 比较与缝合（comparison.tex + reduction.tex）

**编码（comp:encoding）**：reservoir 根加独立均匀位点 i，深度 L 终末自旋转移**之前**放 x=arctanh⟨σ_i⟩（有限：有限 N 所有组态权重严格正），"单点信息的最充分统计压缩"；[推测]编码若发生在终末转移之后，x 依赖被比较的自旋实现。向后定义 η_d=Law(·|𝓖_d)、ζ_{L,N}=Law(η₀)∈𝓜_L；后代树的输出律只通过 η_d 依赖前缀 ⇒ 对每个叶子集 𝔼∏τ^a=𝔼R_S。**不同标签用整条构造的独立副本（含 reservoir 根与位点）**。[推测]若用 reservoir 根分布做 trial 律而不换独立副本，trial 消息与 reservoir 组态相关、"不同标签独立"失败。

（a）原文逐字（`comp:19-24`、`comp:33-51`、`comp:58-82`）：

```tex
For each fixed $N$, $L\ge2$, and selected parameter vector, with the reservoir
root disorder averaged, there is a deterministic trial law
$\zeta_{L,N}\in\mathcal M_L$ whose single-label spin process has the same
expected spin products on every prescribed tree as a uniformly chosen site
of the reservoir. Different trial labels can be chosen independently.
At depth $r=L-1$ put $x=\arctanh\angles{\sigma_i}$ ... This is finite:
at finite $N$ all configuration weights are strictly positive, so $-1<\angles{\sigma_i}<1$.
Thus $x$ is determined at depth $r$, before the terminal spin transition at depth $L$.
 \eta_{r-1}=\operatorname{Law}(x\mid\mathscr G_{r-1}),\qquad
 \eta_d=\operatorname{Law}(\eta_{d+1}\mid\mathscr G_d) \quad(0\le d<r-1).
Then $\eta_d\in\mathcal M_{r-d}$, so $\zeta_{L,N}=\operatorname{Law}(\eta_0)\in\mathcal M_L$.
 G_T(\eta_d)=\prod_{\ell=1}^j \int G_{T_\ell}(\nu)\,\eta_d(d\nu).
 \E\prod_{a\in S}\tau^a =\frac1N\sum_{i=1}^N\E\prod_{a\in S}\sigma_i^a =\E R_S.
Use independent copies of the entire construction, including the reservoir
root and uniform site, for different labels.
```

（b）推导补齐。**为什么 $x=\operatorname{arctanh}\langle\sigma_i\rangle$ 就够**：深度 $r$ 处，给定前缀 $\mathscr G_r$，位点 $i$ 的终末单点 Gibbs 律是 $\{\pm1\}$ 上的某个概率，写作 $q_x(\varepsilon)=e^{x\varepsilon}/(2\cosh x)$（§1 的定义）就能一一对应：$\langle\sigma_i\rangle=\tanh x$，$\tanh$ 在 $\mathbb R$ 上双射到 $(-1,1)$，所以 $x=\operatorname{arctanh}\langle\sigma_i\rangle$ 是**唯一**能重现该单点律的场强。因此 $x$ 是该前缀下"单点信息"的充分统计量，把无限维的条件律压成一个实数。**层级计数**（我原先没写清、这是 $\zeta_{L,N}\in\mathcal M_L$ 的关键）：$x\in\mathbb R$，$\eta_{r-1}=\operatorname{Law}(x\mid\mathscr G_{r-1})\in\mathcal P(\mathbb R)=\mathcal M_1$；向后每步把测度空间升一级，$\eta_d\in\mathcal M_{r-d}$，故 $\eta_0\in\mathcal M_r=\mathcal M_{L-1}$；再取一次律 $\operatorname{Law}(\eta_0)\in\mathcal P(\mathcal M_{L-1})=\mathcal M_L$。所以"编码放在 $r=L-1$、终末自旋转移之前"与"$B_{L-1}(\zeta,\mathbf m^{(L)})$ 用 $L-1$ 层网格"是同一件事的两面：$x$ 若放在 $r=L$（终末转移之后），层级数就变成 $L+1$ 且 $x$ 会依赖自旋实现。**逐形状的验证**：固定后代树 $T$ 与终末自旋赋值 $e_a$，深度 $r$ 处条件概率 $G_T(x)=\prod_aq_x(e_a)$（终末副本独立抽 $q_x$）；深度 $d$ 处子树条件独立给出 $G_T(\eta_d)=\prod_\ell\int G_{T_\ell}(y)\,\eta_d(dy)$，归纳即得"后代树的输出律只通过 $\eta_d$ 依赖前缀"，一元延伸与任意多子都包含在内（原文点明"precisely the branching version of `model:chain`"）。$\mathbb E\prod_{a\in S}\tau^a=\frac1N\sum_i\mathbb E\prod_a\sigma_i^a=\mathbb E R_S$ 三式中，第一式是 trial 构造的定义、第二式是均匀位点、第三式正是去相关定理要的东西，于是 trial 过程与 reservoir 过程的所有 multioverlap 一阶矩相同。标准 Borel 假设只用来保证条件概率核有可测版本；原文补了一句更初等的替代（有限标记空间的有限和），说明这里没有集合论难点。

（c）机械理由：$\zeta_{L,N}$ 依赖 $(L,N)$ 与选出的参数向量，是**确定性**律（根无序已平均掉），这点必须如此，因为 $\mathcal B_{L-1}$ 是对 trial 律求的泛函、$r=L-1$ 层网格 $\mathbf m^{(L)}=(1/L,\dots,(L-1)/L)$ 也必须与 reservoir 的倾斜结构同参数；"不同标签用整条构造的独立副本（含 reservoir 根与均匀位点）"是插入比较的前提，插入用的物理无序必须是**新的**，否则消息与插入相关、乘积幂平均的因子化 $\widetilde Y_{0,\rm b}$ 一步就断。

（d）候选失败路线：[推测]想把整条 reservoir 前缀律直接当 trial 消息（"$\eta_d$ 就是 reservoir 的 $\eta_d$"），层级会多一级且条件律之间相关，$\mathcal P(\mathcal P(\cdots))$ 链对不上 $\Phi_r$ 的定义域；[推测]想用 $\langle\sigma_i\rangle$ 本身（不加 arctanh）做消息，$q_x$ 的参数域变成 $(-1,1)$、终末转移写不成指数族形式，§1 的 $V_{\rm s}$ 恒等式不再成立；[推测]想让 $x$ 依赖终末自旋实现（放在 $L$ 之后），$\mathbb E\prod\tau^a$ 变成"先抽自旋再定律"，与 reservoir 的顺序相反，单点矩相等的结论被破坏 [推测]。

**经验模式比较（comp:patterns）**：均匀位点模式的经验分布 π(e)=2^{−k}ΣR_S∏e_b（multioverlap 的组合展开）；trial 分布 π̄=𝔼π；乘积测度 TV 望远镜界 a·Σ_S𝔼|R_S−𝔼R_S|；形状误差由去相关定理导出。**插入比较**：截断 K≤M（Poisson 尾）、Taylor 阶 q（几何尾 ∑c^k/k）、再 N,L；先 M 后 q 不可换。Corollary：有界模型 liminf F_N≥inf Φ_r。[推测]若不截断 Poisson 计数直接展开，|D|≤c 需要一致 B 界于无界 K 上、对数展开域破裂。

（a）原文逐字（`comp:87-94`、`comp:103-118`、`comp:133-138`、`comp:198-217`）：

```tex
a\sum_{\varnothing\ne S\subseteq[k]}\E|R_S-\E R_S|.
 \pi(\boldsymbol e)=\frac1N\sum_i \prod_{b=1}^k\frac{1+e_b\sigma_i^b}{2}
 =2^{-k}\sum_{S\subseteq[k]}R_S\prod_{b\in S}e_b,
 \norm{\pi^{\otimes a}-\bar\pi^{\otimes a}}_{\rm TV}
 \le a\norm{\pi-\bar\pi}_{\rm TV}
 \le\frac a2\sum_{\varnothing\ne S\subseteq[k]}|R_S-\E R_S|.
 \E_{Q_k}\sum_{\varnothing\ne S\subseteq[k]}\E|R_S-\E R_S|
 \le C_k\left(\eta+L^{-1}+\sum_{U\in\mathfrak S_k}\bigl(\mathcal A_{L,\eta}\Var(R_U)\bigr)^{1/2}\right).
Set $C=H+BM$, $z=\cosh C$, and $c=\tanh C<1$. On this event both the reservoir
insertion and its trial version can be written as $A=z(1+D)$ with $|D|\le c$.
first choose $M$ to control the Poisson tail, then $q$ to control the
geometric tail, and then take the limits in $N$ and $L$ for the finitely many remaining expansion terms.
```

（b）推导补齐。**π 的组合展开**：$\prod_b\frac{1+e_b\sigma^b}{2}=2^{-k}\sum_{S\subseteq[k]}\prod_{b\in S}(e_b\sigma^b)$，对位点求平均即 $\pi(e)=2^{-k}\sum_SR_S\prod_{b\in S}e_b$，所以"$\pi$ 与 $\bar\pi$ 的差"与"全部 multioverlap 的偏差"是同一组坐标的线性变换（$\{-1,1\}^k$ 上的 Walsh–Hadamard 型变换，$2^{-k}$ 与求和顺序给出那个 $1/2$ 常数）。**望远镜**：$\otimes^a\pi-\otimes^a{\bar\pi}=\sum_{j=1}^a\bar\pi^{\otimes(j-1)}\otimes(\pi-\bar\pi)\otimes\pi^{\otimes(a-j)}$，逐项取 TV（乘积测度不放大全变差）得 $\le a\|\pi-\bar\pi\|_{\rm TV}$；$|f|\le1$ 的观测积定期望差 $\le2\|\cdot\|_{\rm TV}$，两处的 2 相消给出最终 $a\sum_S\mathbb E|R_S-\mathbb ER_S|$。**形状误差的计数**：$Q_k$ 下非正则树概率 $\le C_k(\eta+L^{-1})$（`tree:regular-shapes`）；正则树上 $a$ 个分支顶点 ⇒ 每个深度赋值概率 $\le C_kL^{-a}$；子形状保留 $a'$ 个分支顶点 ⇒ 该赋值有 $L^{a-a'}$ 个延拓；把用不到的坐标求和掉，剩下恰好是 $\mathcal A_{L,\eta}$ 的归一化 $L^{-a'}$；Cauchy–Schwarz 把 $\mathcal A$ 平均的 $\mathbb E|R_U-\mathbb ER_U|$ 变成 $(\mathcal A_{L,\eta}\mathrm{Var}(R_U))^{1/2}$；$\mathfrak S_k$ 有限（$\le\sum_j\binom kj\cdot(\text{shapes on }j)=O(3^k)$ 型），非正则树上用偏差 $\le2$ 兜底。然后按 `decor:overlap-concentration`：固定 $\eta$、先 $N\to\infty$（沿该深度的选定序列）、再 $L\to\infty$、最后 $\eta\downarrow0$。**插入比较**：截断事件 $K\le M$ 上 $|A|\le e^{C}$ 与 $A=z(1+D)$ 的构造我在 §3 已推过（$\log z$ 在两侧同现而相消）；$k$ 阶项 $\prod_{i=1}^kD_i$ 是至多 $pM$ 个标签的副本自旋模式的有界函数加独立插入无序，故套 patterns 引理得误差 $pM\sum_S\mathbb E|R_S-\mathbb ER_S|$，再由 `comp:shape-error` 让树平均误差在有序极限下归零；$q$ 阶后残差 $\le\sum_{k>q}c^k/k$ 在 $N,L$ 上一致；截断事件外两侧对数各 $\le H+BK$，合并 $\le2\mathbb E[(H+BK)\mathbf1_{K>M}]$，Poisson 尾使其随 $M\to\infty$ 归零。trial 侧的恒等式：终末转移对 $\widetilde A_{\rm s}$ 独立 trial 自旋求平均恰好给出 $V_{\rm s}$（故 $\widetilde Y_{0,\rm s}=T_0V_{\rm s}$）；$\widetilde A_{\rm b}$ 给出 $K_{\rm b}$ 个边因子的积、标签互不相交，条件在物理无序与深度处的全部消息前缀上这些标签组仍独立，所以乘积逐层通过每个条件幂平均因子化，得 $\mathbb E\log\widetilde Y_{0,\rm b}=\alpha(p-1)\mathbb E\log T_0V_{\rm e}$，两式合起来正是 $\mathcal B_{L-1}(\zeta_{L,N},\mathbf m^{(L)})$。

（c）机械理由：**次序 $M\to q\to N,L$ 的不可换性有具体数值理由**：几何尾的比是 $c=\tanh(H+BM)$，$c\uparrow1$ 当 $M\to\infty$，所以先定 $q$ 再放大 $M$ 时 $\sum_{k>q}c^k/k$ 失去一致小性；$M$ 定了以后 $|D|\le c<1$ 才在双侧一致成立，Taylor 展开（§2 的 log 展开）的定义域才有保证。Poisson 尾是 $M$ 的单侧函数、与 $q$ 无关，所以 $M$ 排第一。$N,L$ 必须最后，因为有限个 $(M,q)$ 项里每一项都要用去相关定理的极限，而该定理本身是 $\lim_N$ 先、$\lim_L$ 后（`decor:order-of-limits`）。$H$（场界）与 $B$（交互界）在 $C=H+BM$ 里的角色不同：$H$ 来自单点场、$BM$ 来自 $M$ 个交互，这是 $M$ 出现在 $c$ 里的原因。

（d）候选失败路线：[推测]想直接对未截断插入做 Taylor，$c=\tanh C$ 需在无界 $K$ 上一致 $<1$，$C=H+BM$ 随 $K$ 无界，展开域破裂（与 summary 卡点里"带号恒等式→普通协方差不通"不同的另一条死路）；[推测]想跳过 multioverlap 而直接比较"插入对数作为 $\sigma$-模式的可测函数"，需要逐模式的 TV 接近，而逐模式接近恰好等价于全部 multioverlap 集中（Walsh 变换双向），所以这条路线只是把同一个难点挪了个名字 [推测]；[推测]想让 trial 标签数 $a$ 随 $N$ 增长（一次比较很多插入），$a\sum_S\mathbb E|MAD|$ 里的 $a$ 会摧毁 `comp:shape-error` 的收敛，必须逐个插入比较后再对 Poisson 计数求期望 [推测]。

**缝合（reduction:stability + 主定理）**：稳定性 |F_N−F_N'|≤αD+d、trial 侧 ≤α(2p−1)D+d（site αp+edge α(p−1)）；**平移 c=θ(1,…,1)**：因子化给 θ̂(s)=log[(1+b∏f_ℓ(s_ℓ))/(1+b∏f_ℓ(1))]：a 消失、f_ℓ 独立同分布且与 b 独立 ⇒ θ̂ 律置换不变（这正是选 c=θ(1,…,1) ，并非别的常数的原因：分母在 s=(1,…,1) 处归一）；截断到 [−K,K] 用有界版下界（**截断不必保持因子化，因为下界根本不用因子化，这是上下界分工在缝合步骤的直接红利**）；K→∞ 得 liminf≥înf；上界给 limsup≤inf；两极限相等。[推测]若先截断再消 a，θ̂^{(K)} 不再是 log 比形式、失去置换不变性。

（a）原文逐字（`reduction:9-25`、`reduction:45-86`）：

```tex
 |F_N-F_N'|&\le\alpha D+d,\qquad
 |\cB_r(\zeta,\mathbf m)-\cB_r'(\zeta,\mathbf m)|\le\alpha(2p-1)D+d
uniformly in $N,r$ and all trial laws, including $r=0$.
 \widehat F_N=F_N-\alpha\E c, \qquad\widehat{\cB}_r=\cB_r-\alpha\E c.
The multiplier $a$ may depend asymmetrically on the labeled input functions,
so the original interaction law need not be permutation invariant.
Set $c=\theta(1,\ldots,1)$ and $\widehat\theta=\theta-c$.
 \liminf_N\widehat F_N \ge I_K-\alpha D_K-d_K \ge\widehat I-2\alpha pD_K-2d_K.
The bounded-law lower bound \cref{comp:bounded-lower} applies whether or not
truncation preserves the factorization.
```

（b）推导补齐（我把三处常数逐项算过，都对得上，但正文跳了）：

1. **$\alpha D+d$**：耦合用同一组计数与指标，$\log$-权重逐点差 $\le\sum_{\text{interactions}}|\theta-\theta'|+\sum_{\text{sites}}|h-h'|$；自由能是 $N^{-1}\log$-期望，交互数 $\approx\alpha N$、每个平均差 $D$，场项每站点 $d$ 除以 $N$ 后是 $d$ 量级（原文按"逐点界直接由 $\log Z$ 保持"处理，所以给出 $N^{-1}\cdot\alpha ND=\alpha D$）。
2. **$\alpha(2p-1)D+d$**：site 项 $\mathbb E\log T_0V_{\rm s}$ 里每个 $V_{\rm s}$ 含均值 $\alpha p$ 个入射交互，每个扰动 $\le D$，故贡献 $\alpha pD$；edge 项系数 $\alpha(p-1)$、每个边对数 $\le D$，贡献 $\alpha(p-1)D$；$p+(p-1)=2p-1$ ⇒ $\alpha(2p-1)D+d$。**幂平均保持根可测界**是这句："The power means preserve these root-measurable bounds"，即 $T_d$ 是条件期望的 $1/m$ 次幂，逐点界在同一 σ-域内直接传下去。
3. **平移的两侧一致**：$\widehat F_N=F_N-\alpha\E c$（$c$ 从自旋配分函数提出，每个交互一个 $c$，$\alpha N$ 个除 $N$）；$\widehat{\mathcal B}_r$：site 移 $-\alpha p\E c$、edge 移 $+\alpha(p-1)\Ec$（edge 项前已有负号），净 $-\alpha\E c$。**两者系数相同**正是 $F_N$ 与 $\mathcal B_r$ 能同时归一化的原因，也是 §1 里 edge 系数为何必须取 $\alpha(p-1)$（，并非 $-\alpha p$ 或别的）的最终检验。
4. **截断误差链**：$|\widehat I-I_K|\le\alpha(2p-1)D_K+d_K$ 与 $\liminf\widehat F_N\ge I_K-\alpha D_K-d_K$ 合并：$\liminf\ge\widehat I-[\alpha(2p-1)+\alpha]D_K-(d_K+d_K)=\widehat I-2\alpha pD_K-2d_K$，用了 $(2p-1)+1=2p$。$D_K\to0,d_K\to0$ 靠控制收敛，前提是 $\mathbb EB(\widehat\theta)\le2\mathbb EB(\theta)<\infty$，而 $B(\widehat\theta)=\sup_s|\theta(s)-c|\le B(\theta)+|c|\le2B(\theta)$（$|c|\le B(\theta)$）。
5. **收尾**：$\liminf_NF_N\ge\inf_r\Phi_r$（还原平移，两侧同消）；`main:bound`（§3 的上界）给 $\limsup_NF_N\le\inf_r\Phi_r$；两个夹住的右端同，于是极限存在且等于 $\inf_r\Phi_r$。**这里我注意到上界对假设的使用与下界完全错开**：上界用因子化+正性（$A$ 的凸性论证），下界用有界+置换不变（去相关+编码），缝合段只借一个可积常数把两者接上。

（c）机械理由：$c=\theta(1,\dots,1)$ 的选取由分母归一决定（§1 已述），而 $\widehat\theta$ 的置换不变性用到"$f_\ell$ 独立同分布且与 $b$ 独立"以及 $|b\prod f_\ell|<1$（保证 log 里恒正，无需分支）；$r=0$ 也被稳定性覆盖，说明 $\Phi_0$（RSB 零层级）参与 $\inf_r$，这与 §1 里"inf 从 $r\ge0$ 起"一致；截断保持置换不变性（逐坐标 clip 是共变的），这是"$\widehat\theta^{(K)}$ 仍可套用有界版下界"的前提。

（d）候选失败路线：[推测]想用$\theta/K$ 型压缩代替 clip，置换不变性可保但 $B$ 界不再逐点收敛到 $\theta$（$D_K\not\to0$，缺少单调控制）；[推测]想直接对无序 $a$ 做逐层逼近（不用常数平移），需要 $\log a$ 可积，而 §1 已写明"$a$ 可以依赖其余全部变量、不假设 $\log a$ 可积"，此路在我读来的构造下不通；[推测]想用同一份截断同时进入上界与下界（省去稳定性引理），则上界需要的因子化在截断后丢失，两侧假设集合不再互补，缝合失效。

## 7. summary 时间线与失败路线总表

十条卡点→救活：反例搜寻 "None yields one" → 常数交互=归一化检验+减法消 a；共享随机性 overfitting → reservoir 无序 quenched 只独立化消息+单点编码；Bayesian 不迁移 → t/u 双参数扰动族；系数交错 → 混合导数极化+保护叶扩展；除以小指数间隙 → **深度平移（j=1 因子 δ 与 fresh 分裂 δ 精确配平）**；pinning 不相容 → marker anchor 在 e−1 fresh；purity 太强 → 三副本平方协方差可除上界；带号恒等式→普通协方差不通 → 带号和吸收进归纳恒等式；"average error little with shifted depths not rare" 未证 → 鞅能量 C/L+Q_k regular 性；扰动参数偷换背景测度 → Poisson removal+H_N 与 j 无关。

逐条把 summary 的原句钉在时间线上，这样"卡住在哪一句"是可核对的，并非我事后编排的因果。反例搜寻的收束只有一句（`sum:157`）：

```tex
Initial checks look for a counterexample in the assumptions: a nonintegrable
factorization constant, asymmetric fields, interactions close to the positivity
boundary, or messages tending to infinity. None yields one. Constant
interactions instead provide a normalization check.
```

多点 cavity 的第一次死亡（`sum:159-162`）："condition on randomness shared by all sites in a hierarchical representation, then seek independent site messages. The difficulty is that this shared randomness can adapt to the sampled sites. A pointwise law of large numbers gives no uniform comparison, and pinning may select states with the wrong weights." 随后的顿悟句就是我反复引用的 `sum:162`。机械停住点我现在能写清：共享变量可以"模拟"缩小规模的原模型，意味着任何以共享前缀为条件的逐点大数律，其比较对象随 $N$ 一起变化，一致比较从定义上不可得；pinning 选态的权重错配则直接体现在 §4 的 $K_{\rm add}$ 与 $K_{\rm cand}$ 分布差异上。

Bayesian 迁移失败（`sum:164`）："The Bayesian setting does not transfer automatically: posterior-sampled observations and fractionally weighted observations have different laws." 停住点：分数权重扰动改变的是测量的种类（抽样 vs 加权），而 §4 需要的恰好是"同一背景测度下的假设因子"，所以必须换成 $t_\nu/u_\nu$ 双参数族的解析延拓论证。

小指数间隙的除法危机（`sum:168`）："Fresh subtrees isolate useful conditional moments, but recovering a whole prescribed shape requires division by products of small exponent gaps. Coarse partitions and equal-exponent refinements repeatedly encounter the same problem: available continuity errors are too large after that division." 这就是 §5 深度平移的直接前因；"equal-exponent refinements"（等指数细化）对应我在 §5(c) 写的"带号和可近零而绝对值不小"那一类失败。

purity 过强（`sum:171`）："An exact purity claim also proves too strong: hidden Poisson--Dirichlet clustering inside a strict exponent jump can retain nontrivial overlap variation." 我的读法：严格的指数间隙只能保证"某一层折叠"，而 PD 型聚类可以在折叠内部保留重叠的非平凡涨落，所以 purity（$R_S$ 收敛到常数）在这种构造下为假；退到"三副本平方协方差的可除上界"是量词层面的让步，也是唯一被后面所有步骤消费的强度。

shift 之后仍欠的平均误差（`sum:176`）："Great! Need carefully prove average error little with shifted depths not rare"。兑现物是 `decor:martingale-energy`（$\le1$）加 `tree:regular-shapes`（rare 的补集概率 $\le C_k(\eta+L^{-1})$），两句合起来才是这句话要的定理。

最后两次核对（`sum:189`、`sum:191`、`sum:193`）给了三处我认为最值钱的判据："'whether a target subtree remains correctly distributed when its anchor already belongs to an old tree. Marginalizing the unused paths preserves the prescribed independent transitions.'"（anchor 属于旧树时目标子树的边际正确性，靠"未用路径积掉"）；"Distinct new branching vertices are charged to distinct fresh divergences, including when their depths coincide. This is the point of the shift: after normalization, the absolute coefficient bounds remain controlled."；"Another concern is whether varying the small insertion parameter silently changes the background measure. The calculation instead treats each value as a hypothetical extra factor in the same fixed background."

我数了一下 §5–§6 与 summary 的对应密度：summary 里 8 段失败史，落到正文只有 3 个新构件（平移、marker、三副本），其余全靠次序纪律吸收；[推测]这就是为什么正文只 5 页而 trace 有 44 页级别的信息压缩感。

## 8. 常数表

p 偶（凸性与正性生效、排除 3-SAT）；α（site αp/edge α(p−1) 的来源）；B=B(θ)（一切插入的逐点界）；ρ_N=α(N+1)(N/(N+1))^p（含新位点交互均值、差 α(p−1) 恰是 bond 修正）；s_N=N^{3/4}（亚线性且 λ_ν→∞ 足够快）；ψ_ν∈(1/2,3/2)（log 变化 ≤log2）；t_ν=j^{−1}、u_ν∈[j^{−j},2j^{−j}]（j≥4 进解析域；j^{−j} 超多项式压任何 j^{−q}）；m_d=d/L、δ=1/L（均匀网格：fresh unary 系数恰 −δ）；γ_β=m_d−n_βm_{d+1}（带号树密度指数）；telescope Σ(nβm−m)=n（Q_k 归一化）；κ(S)=∏∏(m_{d_v}−jm_{d_v+1})（j=1 因子=−δ）；charging δ^b 与相对版 C_{q,k,η}；regular η（禁区计数线性、c_d≥η 可除性、平移落回 η/2 域）；𝒜_{L,η} 未归一化深度平均（总质量 ≤1、Holder）；v_N(S,d)（归纳对象）；收缩 v^{1/4}、三副本 (2/N²)𝔼tr C²；鞅能量 ≤1（C/L 来源）；c_d=(d+2)δ、c_ℓ=δ；J=κ(S⁺)²、|J|≥cδ^{2b}；C(S,e)=−δκ(S)（marker）；递归 V_{k,L}≤C(L^{−1/2}+V_{k−1,L}(η/2)^{1/4})；ρ=N^{−1/8}（差商半径）；G(u)=X₀+2nu²（凸化）；TV 误差 aΣ|MAD|；截断 K≤M、c=tanh C<1；稳定性 αD+d 与 α(2p−1)D+d；平移 c=θ(1,…,1)；最终误差 2αpD_K+2d_K；零温窗 [g, g+log2/β]。

这张速记表的用途是"回忆时的索引"，它不记录谁消费了谁，因此在复查时不可用。第 11 节把同一批常数改写成五列台账（数值、位置、消费者、改动后断在哪一步），那里才是可核对的版本；两处若有出入，以第 11 节为准，因为它的每一格都要求填实。补充两个我在整理时才确认的算术检查：$\log2/\beta$ 窗口的宽度来自 $2^N$ 个组态这一纯粹计数事实（$g_N\le P_N(\beta)/\beta\le g_N+\log2/\beta$），与模型细节无关，因此它对 §11 里所有模型级常数都是免疫的；$2\alpha pD_K+2d_K$ 里的 $2p$ 是 $(2p-1)+1$ 的合并，若把 trial 侧稳定性错写成 $\alpha pD$，最后的系数会变成 $2\alpha(p-\tfrac12)$，说明这两条界在同一条链上、不能各自独立改动。

## 9. 复盘

这篇的思维链有一个罕见的美德：**研究从"证伪"开始，并非从"构造"开始**。44 页级别的失败史里（本篇只 5 页但密度极高），最有信息量的是两个"不可达"的诊断：共享随机性的 overfitting（"recursive structure: overfitting shared variable can simulate original model at smaller scale"）与 purity 断言的过强（"hidden Poisson–Dirichlet clustering inside a strict exponent jump can retain nontrivial overlap variation"）。这两个诊断标定的是"正确目标强度"：三副本平方协方差的可除上界，恰好是"能被证"与"能用于比较"的交点。深度平移这个转折的数学本质值得单独说：**恒等式的带号系数是免费的（m_d−jm_{d+1}），但它的绝对值不是**。在旧树的分支深度处，带号和可以接近零而绝对和大；把目标树整体移出旧树的分支深度集，每个 fresh 分裂的绝对值恰好等于归一化里要除掉的那个 δ。除法的合法性由**对齐**设计给出，一致下界估计在此不必要。最后一个方法论注记：极限次序（固定 L 的误差先消失、再细化层级；固定 N 的编码、再让 N 沿序列走；先 M 后 q 再 N,L）在三节里各出现一次。这篇证明的正确性一半在恒等式里，另一半在次序纪律里。

## 10. Lean 与 summary 取证

**Lean 侧结论：本篇无 Lean，且整个稀释自旋玻璃/cavity 方向在本地 registry 里是空白。** 判据是我跑过的三条命令与它们的命中情况（都在 `E:\math\lean` 下，路径限定、不做大范围检索）：

1. `grep -c -i "spin\|glass" formalization.yaml` → `0`（exit=1）。`grep -n -i "mezard\|mézard\|parisi\|spin.glass\|spin glass\|cavity" formalization.yaml` → 无命中。也就是说标题层面没有任何以 cavity/Parisi/自旋玻璃为对象的条目。
2. `grep -n -i "glass\|ising\|panchenko\|talagrand\|sherrington\|kac" formalization.yaml` → 只有 6 处相关行：`347/349`（Critical slowing down in the Sherrington–Kirkpatrick model，只有 pdf 条目、无 `.lean` 字段）、`632/634`（Talagrand's discrete-convexity conjecture）、`742/744`（The sharp factor-of-IID threshold for the free Ising model on regular trees）、`1174-1176`（`OAI.Problem367.free_ising_factor_iff_threshold`，文件 `OAI/Probability/FreeIsing/Main.lean`）、`1574-1575`（`OAI.TalagrandDiscreteConvexity.talagrand_discrete_convexity`）、`1578-1579`（`OAI.TalagrandThreshold.talagrand_expectation_threshold_equivalence`）。
3. `grep -rn -i "parisi\|cavity\|spinGlass" OAI/ --include=*.lean` → 只有 `OAI/Analysis/AffineBernstein/*.lean` 里的 "Concavity"（`BaseConcavity.lean`、`MatrixConcavity.lean`、`ActualAreaMass.lean:226` 等），是子串误命中。

registry 规模核对：`wc -l formalization.yaml` = 1668，`grep -c "  - title:"` = 162 条，`grep -c "\.lean"` = 185 处 `.lean` 提及（含 file/import 字段），所以"192 条目"是我早先的记错，正确口径是 162 条。[推测]我倾向于认为 SK 那条（`347`）只有 paper.pdf、说明该篇在 registry 里也是"未形式化"状态，因此本地 Lean 覆盖对玻璃类问题整体尚未开工。

为什么这篇几乎不可能被轻量形式化，我按依赖顺序列出前置件：(i) $\mathcal M_1=\mathcal P(\mathbb R)$、$\mathcal M_{j+1}=\mathcal P(\mathcal M_j)$ 的迭代测度空间与标准 Borel 可测选择（`comp:52-53` 用到"standard Borel，条件概率核有可测版本"，这在 Lean 里要 `MeasureTheory.MarkovKernel` 全套）；(ii) 条件幂平均 $T_dV=(\mathbb E[(T_{d+1}V)^{m_{d+1}}\mid\mathscr F_d])^{1/m_{d+1}}$ 的 Jensen/单调性；(iii) telescope 恒等式 $\sum_\beta(n_\beta m_{d_\beta+1}-m_{d_\beta})=n$（纯组合，最早可形式化的一块）；(iv) 正性条件 $\mathbb E[(-b)^n]\ge0$ 对全部 $n$ 的无限合取，这条把"因子化 + 正性"写成了关于矩序列的全称命题，形式化代价最高；(v) 规定树恒等式与 charging。[推测]若真要开一条 Lean 支线，我会从 (iii) 加 `tree:regular-shapes` 的计数不等式切入，因为它们不依赖概率测度上的解析估计；$V_{k,L}$ 递归那条链最不像能近期形式化的东西。

**summary 侧取证。** `E:\math\reasoning_traces\mezard-parisi-formula.tex` 共 211 行，结构是：导言与宏定义（`\QuoteSource` 定义在 `81` 行，另有 `CoTQuote` 环境）；`\begin{PromptQuote}` 块从 `86` 到 `155`，里面是任务原文与公式；三段叙述标题依次是 `From structural obstacles to marked hierarchies`（156）、`Shifting branching depths`（170）、`Checking the identities and closing the comparison`（188）；文献从 `199` 起；`211` 行是 `\end{document}`。全文唯一一处显示公式在 `181-183`，就是偶次凸性余项 $A^p-pAB^{p-1}+(p-1)B^p\ge0$，出现在第二段叙述里（`sum:180-183`），说明思维链把上界一侧的符号核心压成了单行不等式。全文只有**两处**逐字 CoT 片段，分别由 `\QuoteSource`（`160`、`174`）标记：`sum:162` 的 overfitting 句与 `sum:176` 的 "Great! Need carefully prove average error little with shifted depths not rare"。也就是说，思维链里"灵光一闪"级别的原始记录只有两句，其余都是整理过的叙述；我在 §7 与 §9 引用的其余句子都是叙述段原句，标注时我一律写成 `sum:行号` 而不假装它们是原始 CoT。

内容分布审计（我自己写这篇笔记时的取材比例）：§2 树演算、§4 扰动族、§5 去相关的机制部分来自论文 tex 的 5 个章节（`trees.tex` 全 526 行、`perturbations.tex` 读到 524 行、`decorrelation.tex` 全 623 行、`comparison.tex` 全 246 行、`reduction.tex` 全 87 行）；summary 只贡献"为什么走这条路"与失败史，即 §7、§9 与各处 (d) 段。素材文件 §二 的 (a)(b)(c)(d) 骨架是我四段式的原型，它的 §三 提供时间线、§四 提供常数表的初稿，我在 §11 里把它升级为五列台账并逐格核对位置。

我在本篇中标了 [推测] 的、且论文 tex 未直接支持的推断，集中列一遍以免后续误当成事实引用：常数交互归一化检验的解释；$\rho=N^{-1/8}$ 的选取自由度与 $\alpha\in(0,1/4)$ 可行区间；$j^{-j}$ 与 $j^{-q}$ 的超多项式压制；极化里 $k^k$ 因子是对 $k^{-1}$ 缩放的补偿；恒等式里"old tree 与 anchor alone 两类各承担 $-\delta J$"的符号分配；$b\le k-1$ 与"$\eta$ 折半预算是层级步数的瓶颈"这条读法；$M\to q\to N,L$ 次序不可换的 $\tanh(H+BM)$ 论证；3-SAT 被偶数 $p$ 排除与消息空间构造的关联。其中我确证过的只有第 2、3、6、8 条（都做了显式算术），其余是解释性推断。

## 11. 常数与参数台账

表格按 §1 到 §6 的出现顺序排，每格必须填实；`位置` 一栏给"文件名:行号或标签"，`被谁消费` 指本篇内谁在用它，`若改动断在哪一步` 指改动后第一个断掉的步骤。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $p$ | 偶数、$\ge2$ | `model:40-53` | §1 泛函、§3 凸性、§6 编码 | 奇 $p$ 时余项 $A^p-pAB^{p-1}+(p-1)B^p$ 可负，§3 上界断 |
| $\alpha$ | 任意 $>0$；site $\alpha p$、edge $\alpha(p-1)$ | `model:40-53`、`model:trial-bounds` | §1 $B_r$、§4 $\rho_N$、§6 稳定性 | edge 系数改成别的值时 §6 平移两侧 $\alpha\E c$ 不相消 |
| $B(\theta),H$ | 逐点界；$\mathbb E\lvert\mathfrak h\rvert+\mathbb EB(\theta)<\infty$ | `model:44-49` | §1 $V_{\rm s}\le e^C$、§2 展开半径、§6 $C=H+BM$ | 缺 $H$ 时 §6 的 Poisson 尾 $2\mathbb E[(H+BK)\mathbf1_{K>M}]$ 不可控 |
| $m_d$ | $d/L$；$0<m_1<\cdots<m_r<1$ | `decor:1`、`comp:161-162` | §2 树系数、§5 $c_d,\gamma_\beta$ | 网格非均匀时 fresh 一元系数不再恰为 $\delta$，§5 除法与误差不同阶 |
| $\delta$ | $L^{-1}$ | `decor:1` | §5 $c_\ell$、$\kappa$ 的 $j=1$ 因子、$C(S,e)$ | 定义改动时 $\lvert J\rvert\ge c\delta^{2b}$ 与 charging 幂次错配 |
| $\gamma_\beta$ | $m_{d_\beta}-n_\beta m_{d_\beta+1}$ | `trees:98-100` | §2 密度 $W_T$、§5 带号系数 | $n_\beta$ 取错时 telescope 和不为 $n$，$Q_k$ 归一化断 |
| telescope 和 | $\sum_\beta(n_\beta m_{d+1}-m_d)=n$ | `trees:272-274` | §2 $Q_k$、§5 系数净和为零 | 失效时恒等式残差非零，§5 左端不再是协方差型 |
| $\kappa(S)$ | $\prod_v\prod_{j=1}^{a_v-1}(m_{d_v}-jm_{d_v+1})$ | `trees:327-332` | §5 $J=\kappa(S^+)^2$、$C(S,e)$ | 少一个 $j$ 因子时 $\lvert J\rvert$ 的下界幂次与 charging 不匹配 |
| charging | $\sum_E\lvert c_E\rvert\le C_{q,k}\delta^b$；相对版 $\le C_{k,\eta}$ | `trees:423-428`、`decor:349-353` | §5 投影误差除以 $J$ | 无相对版时 §5 的 $\rho_N$ 发散，归纳恒等式不成立 |
| regularity $\eta$ | 间隔 $>\eta L$；坏集 $\le C_k(\eta+L^{-1})$ | `trees:503-514`、`comp:141-142` | §5 平移落回 $\eta/2$ 域、$c_d\ge\eta$、§6 形状误差 | 去掉正则性时平移可撞旧分支深度，fresh 分裂不再被迫 |
| $\mathcal A_{L,\eta}$ | $L^{-a}\sum_{\eta\text{-reg}}$，总质量 $\le1$ | `decor:average-definition` | §5 命题、fiber 界、§6 Cauchy–Schwarz | 归一化成真平均时误差多出 $L$ 幂，$C_k/L$ 退化为 $C_k$ |
| $v_N(S,d)$ | $N^{-2}\sum_{ij}\mathrm{Cov}(A_{S,i},A_{S,j}\mid\mathscr F_d)^2$ | `decor:V-definition` | §5 归纳对象、$p_N$、§6 形状误差 | 改成非平方口径时三副本不等式失去量纲对应物 |
| $V_{k,L}(\eta)$ | $\sup_N\max\sum_{U}v_N(U,\cdot)$ | `decor:V-definition` | §5 递归、§6 | 用 $\limsup_N$ 代替 $\sup_N$ 时递归不能对 $N$ 一致闭合 |
| $p_N(S,e)$ | $\sum_jv_N(T_j,e)^{1/4}$ | `decor:projection-definition` | §5 收缩、替换代价 $4p_N$、协方差归纳估计 | 指数改 $1/2$ 时递归右端不再是 $V_{k-1}^{1/4}$，逐层归零失败 |
| 收缩指数 $1/4$ | 两次 Cauchy–Schwarz 各给 $1/2$ | `decor:contractions` | $p_N$ 定义、三副本使用 | 该指数是推导产物，硬改会同时废掉 §5 两个方向 |
| 三副本下界 | $\frac2{N^2}\mathrm{tr}((C+\mu\mu^{\mathsf T})C)\ge\frac2{N^2}\mathrm{tr}(C^2)$ | `decor:three-copy-bound` | §5 闭合归纳 | 丢掉半正定项的方向若反，左端不再非负 |
| $c_d,c_\ell$ | $(d+2)\delta$；$\delta$；$\sum_{\ell=d}^{e-1}c_\ell=(e+1)\delta=m_e+\delta$ | `decor:421-423` | §5 系数表、$c_d\ge\eta$ 可除性 | $c_d$ 估小时 $C_\eta$ 爆炸；和算错时 $m_eJ$ 类系数错 |
| $J$ | $\kappa(S^+)^2$，$\lvert J\rvert\ge c_{k,\eta}\delta^{2b}$ | `decor:342-344` | §5 全部除法 | 平移不彻底时下界为假，§5 每一条估计同时崩 |
| $h_N(S)$ | $\mathcal A_{L,\eta}h_N^2\le C_k/L$ | `decor:projection-shift-error` | §5 $\rho_N$、方差估计 | 若依赖具体延拓则无法一致用于扩展和 |
| fiber 幂 $\gamma$ | $1/4$（协方差）、$1/2$（方差） | `decor:500-507`、`decor:variance-estimate` | §5 递归、最终方差界 | 取 $\gamma>1$ 时 Jensen 方向反，平均换算失效 |
| 递归 | $V_{k,L}(\eta)\le C(L^{-1/2}+V_{k-1,L}(\eta/2)^{1/4})$ | `decor:induction-recursion` | §5 命题、§6 形状误差 | 缺 $L^{-1/2}$ 项时基例 $V_{1,L}\le\delta/\eta+o_N(1)$ 无法启动 |
| $C(S,e)$ | $-\delta\kappa(S)$ | `decor:546-549` | §5 marker、$\mathrm{Var}(M)\to0$ | 分裂放 $e$ 处时系数变成组合和，恒等式不可解 |
| $\varepsilon_{N,L,k}$ | 固定 $L$ 下 $\to0$，常数可任意依赖 $L$ | `decor:identity-error`、`decor:613-623` | §5 所有误差尾部 | 想要 $L$ 一致时 `decor:order-of-limits` 明确不提供该强度 |
| $s_N,\rho_N,\lambda_\nu$ | $N^{3/4}$；$\alpha(N+1)(N/(N+1))^p$；$\lambda_\nu=s_Nu_\nu\to\infty$ | `pert:164-166`、`pert:305-307` | §4 变化率与选参 | $\alpha N-\rho_N=\alpha(p-1)+O(N^{-1})$ 一变，分数 $o(\lambda_\nu)$ 的结构变 |
| $t_\nu,u_\nu,I_\nu,j$ | $j^{-1}$；$I_\nu=[j^{-j},2j^{-j}]$；$j\ge4$ | `pert:256-259` | §4 扰动族、解析抽取 | $j$ 小于 4 时 $\lvert z\rvert\le1/(j-1)<1$ 的幂级数域破裂 |
| 差商半径 $\rho$ | $N^{-1/8}$（我重推为 $N^{-\alpha}$，$\alpha\in(0,1/4)$ 任意） | §4（`pert:concentration` 之后） | §4 两条选参条件 | $\alpha\ge1/4$ 或 $\alpha\le0$ 时两条件不可同时满足 |
| 极化常数 | $k^k/(2^kk!)\,\mathbb E\prod\sigma^{a_j}\prod\xi_{ab}^{E_{ab}}>0$ | `pert:517-524` | §4 选择器、`pert:tree-identity` | 缺 $k^k$ 时不补偿 $\mathcal O_{E^\dagger}$ 的 $k^{-1}$ 缩放，系数错 |
| $H_d$ | 共享深度 $\ge d$；$H_0=1,H_L=0$ | `pert:505-511` | §4 着色形状选择 | $H_L$ 取 1 时深度 $L$ 出现虚假约束 |
| $\Delta_N^{L,\mathbf u},\underline F$ | $\Delta_N^{L,\mathbf u_{L,N}}\le\underline F+2\varepsilon$ | `comp:13-15` | §6 编码起点、推论 | 选参引理失效时下界只剩半个 $\liminf$ |
| $C,z,c$ | $C=H+BM$、$z=\cosh C$、$c=\tanh C<1$ | `comp:198-203` | §3 log 展开、§6 几何尾 | $q$ 先于 $M$ 取时 $c\uparrow1$，尾不再衰减 |
| 三级截断 | $K\le M$；$\sum_{k>q}c^k/k$；$2\mathbb E[(H+BK)\mathbf1_{K>M}]$ | `comp:198-217` | §6 插入比较 | 次序 $M\to q\to N,L$ 错乱时失去一致小性 |
| 稳定性 | $\alpha D+d$；$\alpha(2p-1)D+d$ | `reduction:15,17` | §6 缝合 | 把 $2p-1$ 写成 $p$ 时最终 $2\alpha pD_K$ 不闭合 |
| 常数平移 | $c=\theta(1,\dots,1)$；$\widehat F=F-\alpha\E c$，$\widehat{\mathcal B}=\mathcal B-\alpha\E c$ | `reduction:22-24`、`reduction:49-58` | §6 归一化 | 归一点换到别处时 $a$ 不消，置换不变性失去 |
| 截断误差 | $D_K,d_K\to0$；总误差 $2\alpha pD_K+2d_K$ | `reduction:61-81` | 主定理 | 缺 $\mathbb EB(\widehat\theta)\le2\mathbb EB(\theta)$ 时控制收敛不成立 |
| 零温窗 | $g\le I(\beta)/\beta\le g+\log(2)/\beta$ | `models:93-110` | §8 推论 | 宽度只由 $2^N$ 计数给出，对上述模型常数免疫 |
| soft SAT 因子化 | $a=1$、$b=e^{-\beta W}-1$、$f_\ell=(1+\varepsilon_\ell s)/2$ | `models:51-64` | §1 正性例 | $b$ 越出 $[-1,0)$ 时严格积条件与正性同时断 |

**依赖链**（读法：上游一格改动，下游全部要重算）：$p,\alpha$ → $B,H$ 与可积性 → $m_d,\delta$ 网格 → $\gamma_\beta$ → telescope 和 → $\kappa(S)$ → charging 与 $J$ → $c_d,\sum c_\ell$ → 系数表 → `decor:induction-identity` → $v_N,p_N$ → fiber 界 → 递归 → `decor:overlap-concentration` → `comp:shape-error` → 三级截断 → `comp:increment-comparison` → `comp:bounded-lower` → 稳定性 → 平移 → $D_K,d_K$ → 主定理 → 零温窗。链条上有三处数值巧合是承重墙：edge 系数 $\alpha(p-1)$ 与平移系数 $\alpha\E c$ 的相消；$\delta$ 在 $|J|$ 的下界与 $C_k/L$ 的误差两边同幂；$c=\tanh(H+BM)<1$ 对 $M$ 的单调依赖决定截断次序。三处任一被改动，本篇的上下界就不再夹同一个数。

## 12. 待定问题与三处分岔回看

**待定问题。**

1. $\inf_r\Phi_r$ 是否在某有限 $r$ 取到？正文只声明下确界（`main:130-136`），并且 `models:127-129` 特意补了"The formula does not require attainment or a limiting hierarchy"。我的疑问是：不取到是否可能由**层级数发散**造成，即 $\Phi_r$ 严格递减而极限落在 $r=\infty$。[推测]若 $\Phi_r$ 关于 $r$ 单调不增（可由把 $r+1$ 层的网格粗化到 $r$ 层来试，telescope 与 Jensen 似乎够用），那么 $\inf_r$ 其实是一个下降极限， attainment 问题就转成 Parisi 测度是否有原子/是否可数支撑的问题；我在 §2 推过 $\gamma_\beta>0$ 强制 $0<m_1<\dots<m_r<1$，但没看到正文里对单调性的任何陈述。
2. 1RSB 与 full-RSB 的实际差距在稀释模型里有多大？MP01 的图像给出显式 1-step 泛函，`introduction:13-22` 里 FL03 只把 RS 与 1-step 两层做成严格界。[推测]低温下 1-step 是否为真解，取决于 §1 的 trial 泛函在 $r=1$ 处的变分是否已经稳定；本篇不提供稳定性判据，所以"哪一层开始严格优于上一层"仍是开放计算题，需要数值最小化 $\Phi_r$（我手边没有可核对的数字，拒绝在这里编造）。
3. 奇数 $p$ 会断在哪一步？我在 §1 与 §11 都写成"$p$ 奇时余项可负"。[推测]真正不可愈合约有两处：其一 §3 凸性论证，其二 §1 正性条件与奇数乘积的符号翻转耦合；但奇 $p$ 的稀释模型（如随机 3-XORSAT 型）在物理上是有明确 1RSB 预言的，所以这两处的任一处松动都可能打开奇数情形 [推测]。
4. $p=2$（Viana–Bray）是否有更简单的独立证明，能否作为本篇的回归测试？`models:10-34` 显示 $p=2$ 时 $a=\cosh(\beta J)$、$b=\tanh(\beta J)$、$f_\ell(s)=s$，正性来自对称分布的偶矩非负。[推测]对 $p=2$ 我怀疑可以去掉树演算的一般形状归纳，只保留配对结构；若成立，那是一篇很好的检验性改写，能在小情形上验证我 §5 的系数记账。
5. `decor:order-of-limits` 拒绝了"$N$ 关于 $L$ 一致"的收敛率。[推测]若想要有效常数（比如 $V_{k,L}(\eta)$ 的显式速率），必须重做 charging 与相对界、让它们对 $L$ 一致，同时把 $\varepsilon_{N,L,k}$ 换成双变量率；我倾向于认为这是"是否可计算"的分水岭，一旦有了率，就能对有限 $N$ 给出可验证的区间。
6. 有界度数（非 Poisson 重数抽样）的图能否进入同一框架？`introduction:57-63` 逐字是："For the zero-field Ising spin glass with Rademacher couplings on random regular graphs, Concetti~\cite[Theorem~1.3]{Concetti25} gives a full-replica-symmetry-breaking pressure bound no larger than each optimized finite-level bound; equality with that functional is conjectural in that work. The result here identifies the finite-depth Panchenko--Talagrand infimum at arbitrary density in its stated interaction class." 我从中读出的分工是：那边有 full-RSB 上界但与有限层级下确界是否相等仍是猜想，这边把"相等"证了但只在稀释（Poisson 重数、带重数采样）类内。[推测]本篇的 Poisson 精确算术（§4 的 $\alpha N-\rho_N=\alpha(p-1)+O(N^{-1})$、加一点 Palm 恒等式）在固定度数图上会被替换成无重数采样的邻居计数，$O(N^{-1})$ 修正项的形式随之改变，这大概是两条路线合并的真正难点。
7. 3-SAT 排除后的接口是什么？`models:131-138` 明确说姊妹篇 `Theorem 8.4` 的消息"符号索引对不必构成概率分布"、trial 泛函也不同。[推测]差异点在 §1 的 $V_{\rm e}$ 是否可用概率核表示：本篇要求 $q_x$ 型概率与幂平均的 Jensen 论证同向，符号索引对失去这点后必须换插值方式，所以两条路线的"层级"含义不可互换。
8. 零温窗口 $[g,g+\log2/\beta]$ 能否改进？`models:106-110` 的上界只用 $Z_N\le 2^Ne^{\beta\max\mathcal E_N}$，下界用单个最大组态。我试过一条看似自然的改法：$h=0$ 且 $p$ 偶时全局自旋翻转保能量，最大组态成对出现，下界似乎能多 $\log2/\beta$ 一点，但 $2^N$ 与 $2^{N-1}$ 两个类计数之间的因子 2 恰好被每类两个组态抵消，逐项算下来窗口宽度不变。[推测]真正可能的改进要来自近最大组态数的次指数估计（把 $2^N$ 换成 $\exp(N\cdot(\text{熵}<\log2))$），这属于零点熵问题，本篇没有提供；这条界只影响我用它做数值上限时的误差预算，不影响定理。

**分岔回看之一：purity 与三副本协方差。** 初始设想是"每个 multioverlap 集中到常数"（purity 型断言，直接给出重叠律的确定性）。`sum:171` 记录的失败机制是"hidden Poisson--Dirichlet clustering inside a strict exponent jump can retain nontrivial overlap variation"。最终打法只证 $\mathcal A_{L,\eta}\mathbb E|R_S-\mathbb ER_S|\to0$，且用三副本平方协方差 $v_N$ 做中间量。差异的实质：purity 要控制**分布的弥散**，最终打法只控制**一个二次型**。我在 §5 试着还原为何三副本是必需的：$v_N$ 是双指标平方和，而三副本差 $X\cdot Y-X\cdot Z$ 的二阶矩展开里，$\mu$ 项恰好以半正定形式 $\mu^{\mathsf T}C\mu$ 出现并可丢，两副本差 $(X-Y)\cdot Z$ 展开后没有这个结构 [推测]。若当初坚持 purity，后面所有恒等式都要面对"条件均值部分与条件方差部分"的混合，marker anchor 的分工（§5）就不会自然浮现。

**分岔回看之二：共享随机性与 reservoir。** 初始设想是对层次表示中的共享变量做条件化、逐点大数律给出独立消息。`sum:159-162` 的机制性诊断是 overfitting。最终打法把共享性保留在 quenched reservoir 里，只在**消息之间**制造独立性，再用单点编码（§6）把 reservoir 压回 trial 律。差异：初始打法的独立性是"条件于共享变量后站点独立"，这在稀释图上根本不可能（子图树化只在深度方向成立，跨站点始终共享无序）；最终打法的独立性是"不同 trial 标签用整条构造的独立副本"，代价是多付一次 reservoir 的构造。[推测]我读到的关键取舍在 `comp:80-82`：不同标签必须独立于**新**的物理无序，这条要求把共享变量的角色限死为"消息的母体"，并非"比较的工具"。若把两条都想要（同一 reservoir 既当母体又当比较基），插入比较立刻退化回原模型自身，正是 overfitting 句的含义。

**分岔回看之三：小指数间隙的除法。** 初始设想是把层级做得足够细（coarse partitions、equal-exponent refinements），使 $\gamma_\beta$ 都远离零。`sum:168` 的卡点是"available continuity errors are too large after that division"：细化后除数 $\prod\gamma$ 的衰减比连续性误差快。最终打法放弃"避开小间隙"，改为**主动使用**间隙的量级：把目标树内部深度整体 +1，使每个新分支顶点被迫由 fresh unary 分裂产生，其绝对系数恰为 $\delta$，与归一化里的 $\delta$ 同幂。`sum:191` 的 "including when their depths coincide" 是这条路线的判据句。差异的实质：初始打法试图让除数不出现（技术上是均匀性），最终打法让除数与误差**同源**（设计上是相关性）。[推测]我猜这一转向的可迁移原则是：当你需要除以一族小量时，把这些小量做成同一机制产生的量，比把它们逼离零更容易闭合；代价是必须重抽目标对象（这里就是"平移副本"），而重抽后要在 fiber 界（§5 的 $\gamma=1/4$ 步骤）重新把联合平均降级回单副本平均。

**初始设想与最终打法的总体差异（我自己复述一遍）。** 我一开始以为这篇的重心在"变分"（trial 泛函的最小化、$q_x(s)=e^{xs}/(2\cosh x)$ 的极值性质）；读完并把 §5 摊开后，重心其实在**树的会计**：全篇几乎不做变分（只在 §3 上界与 §1 的凸性余项里出现一次），下界一侧的全部力气都在"系数从哪来、除多少、误差以什么幂回来"。第二个差异：我原以为 Poisson 扰动与极化是解析工具（为了取导数），实际它们是**离散选择器**（把指定的着色形状从恒等式的全体扩展里挑出来），解析性只在 `pert:analytic` 的一步（$j^{-j}$ 压过 $j^{-q}$）用到。第三个差异：我以为去相关定理是为了"证明重叠集中"，实际它只服务于一件事，即把 `comp:pattern-error` 的右端买掉，定理强度完全是被比较引理的量词形状决定的。

## 13. 离场清点

写到这里的实际状态：全篇 14 个小节（§0 到 §13），§1–§6 是正文重建（每节都带逐字引用与四段式），§7 是 summary 时间线的逐句核对，§8 是旧速记常数表，§11 是它的可核对替代，§10 记录 Lean 与 trace 的取证，§12 留了八个待定问题与三处分岔。

我手里现在成立的判断（可以当作后续引用的依据）：下界的全部难点集中在 §4 到 §6，且**每一步都只用到 reservoir 的倾斜分支结构与消息空间层级**，这一点 §5 节首写得很明白（"It does not use the interaction factorization or the positivity hypothesis"），所以上界的因子化/正性假设与下界的假设集合是分离的；缝合段（§6 第三块）是两侧唯一的接口。另一个我会重复使用的具体结论是 $\alpha N-\rho_N=\alpha(p-1)+O(N^{-1})$，它是"为什么稀释图上需要 edge 修正项 $\alpha(p-1)$"的最直接证据。

我暂时不能负责的说法（后续要复查）：§5 里关于"old tree 与 anchor alone 各承担 $-\delta J$"的符号分配是我从系数净和为零反推的；层级步数与 $\eta$ 折半预算的关联是我的读法；§4 的 $\rho=N^{-\alpha}$ 区间是我自己重算的、论文只给 $N^{-1/8}$；§11 表格里 `$H_d$` 行的"虚假约束"与极化 $k^k$ 补偿两条也是推断。这些都已就地标了 [推测]。

原稿里我发现的两处技术性错误（按任务要求只报告、不改结论）：§4 首段把未匹配交互数的期望写成了 $O(N^{-4})$，与同一句后面的 $O(N^{-1/4})$ 矛盾，正确的阶是 $O(N^{-1/4})$（来自 $|s_{N+1}-s_N|+2s_{N+1}/(N+1)$，$s_N=N^{3/4}$）；该 token 里还夹了一个零宽空格，所以我在 §4 的所有插入都避开整段、只锚周边句子。另外头部"依据"里写的 11 节与 trace 行数我核对过：tex build 是 11 个分片、约 2,700 行、约 118 KB，trace 是 211 行，这两处口径没问题；素材文件标题里的"合计约 17,500 字"我没重新统计，不作为引用依据。

下一步我会做的事，按优先级：把 §5 的 $V_{k,L}$ 递归在小情形（$k=2$、$L=4$）上做一次显式手算，检查我写的 $|J|\ge c\delta^{2b}$ 与 charging 幂次是否真的对得上（这是我对本篇最不放心的地方）；然后做 §12 问题 1 的 $\Phi_r$ 单调性尝试，如果成立就能把"attainment"转成 Parisi 测度的原子问题；再然后读 `introduction:57-63` 提到的 Concetti 那篇随机正则图工作，确认 full-RSB 上界与有限层级下确界之间的猜想缺口在我的记号下长成什么样；同批在飞的 D44（小 finitistic 维数）、D45（Auslander–Reiten 显式反例）、D47（无共轭点三流形）我这次没有碰，它们与本篇的接口最多只在"局部结构决定全局量"这一层抽象相似，留给各自的笔记处理。

留在桌面上的问题：本篇的"层级"与 SK 情形的"层级"是同一个东西的两个不同构造（后者靠重叠 ultrametric，前者靠消息空间迭代），我在这篇里没有为这个区别付出论证，只在 §0 与 §1 的记号差异里默认了它。如果以后要写一篇把两类模型统一起来的笔记，这个默认必须先被拆开。
