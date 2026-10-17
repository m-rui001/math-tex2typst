# 素材：《The Mézard–Parisi formula for diluted spin glasses》（OpenAI, 2026-09-23）

论文源码：`E:\math\preprints\The-Mezard-Parisi-formula-for-diluted-spin-glasses-September-23-2026\build\`（main.tex + sections/ 共 11 节 2692 行：introduction / model / overview / trees / upper / cavity / perturbations / decorrelation / comparison / reduction / consequences）。思维链 summary：`E:\math\reasoning_traces\mezard-parisi-formula.tex`（5 页）。

---

## 一、定理总览

### 1.1 模型类精确陈述（model.tex, §2）

固定偶数 $p\ge2$、$\alpha>0$。$\theta$ 是 $\{-1,1\}^p\to\mathbb R$ 的随机函数，$h$ 是实随机变量，记 $B(\theta)=\max_s|\theta(s)|$，假设**一阶矩可积**

$$\mathbb E B(\theta)+\mathbb E|h|<\infty. \tag{model:integrability}$$

对每个 $N$：$M_N\sim\mathrm{Poisson}(\alpha N)$，$\theta_k$ 为 $\theta$ 的独立副本，$h_i$ 为 $h$ 的独立副本，指标 $i_{\ell,k}\in[N]$ 独立均匀**有放回**抽取，所有族相互独立。

$$-H_N(\sigma)=\sum_{k=1}^{M_N}\theta_k(\sigma_{i_{1,k}},\ldots,\sigma_{i_{p,k}})+\sum_{i=1}^Nh_i\sigma_i,\qquad F_N=\frac1N\mathbb E\log Z_N.$$

（论文把 $\frac1N\mathbb E\log Z_N$ 称为 *pressure*；物理自由能是其负值除以 $\beta$。）模型参数与无序分布随 $N$ 固定。

**因子化条件**（Panchenko–Talagrand (1.2)）：

$$e^{\theta(s_1,\ldots,s_p)}=a\Big(1+b\prod_{\ell=1}^pf_\ell(s_\ell)\Big),\qquad \Big|b\prod_{\ell=1}^pf_\ell(s_\ell)\Big|<1\ \text{a.s.} \tag{model:factorization}$$

其中 $a>0$、$b$ 为实随机变量，$f_\ell:\{-1,1\}\to\mathbb R$ 是同一个随机函数的独立副本，$b$ 与它们独立。**正性条件**：

$$\mathbb E[(-b)^n]\ge0\qquad(n\ge1). \tag{model:positivity}$$

关键松弛：$a$ 可以依赖表示中的所有其他变量；**不对 $\log a$ 做任何可积性假设**（上界证明里用归一化技巧消掉，见 §upper）。退化情形（$b=0$ 或 $\max_s|f_1(s)|=0$ a.s.）意味着相互作用是自旋无关的随机常数，可取 $b=0$；非退化情形下独立性与严格乘积界**强制** $b$ 与 $\max_s|f_1(s)|$ 本性有界（upper.tex 中给出显式界），故正性条件里的期望自动有限。

### 1.2 层级 trial 泛函（model.tex §2.1）

消息 $x\in\mathbb R$，$q_x(s)=e^{xs}/(2\cosh x)$。两个 cavity 量：

$$C_\theta(x_1,\ldots,x_p)=\sum_{s\in\{-1,1\}^p}e^{\theta(s)}\prod_{\ell=1}^pq_{x_\ell}(s_\ell),\qquad U_\theta(x_1,\ldots,x_{p-1};\varepsilon)=\log\sum_{s\in\{-1,1\}^{p-1}}e^{\theta(s_1,\ldots,s_{p-1},\varepsilon)}\prod_{\ell=1}^{p-1}q_{x_\ell}(s_\ell),$$

且 $|\log C_\theta|,|U_\theta|\le B(\theta)$ 一致成立。层级消息空间 $\mathcal M_1=\mathcal P(\mathbb R)$，$\mathcal M_{j+1}=\mathcal P(\mathcal M_j)$。对 $r\ge1$、$\zeta\in\mathcal M_{r+1}$、$0<m_1<\cdots<m_r<1$，每个消息标签独立抽样链 $\eta_0\sim\zeta$，$\eta_{d+1}|\eta_d\sim\eta_d$，$x|\eta_{r-1}\sim\eta_{r-1}$；取 $k\sim\mathrm{Poisson}(\alpha p)$，令

$$V_{\rm s}=\frac12\sum_{\varepsilon=\pm1}\exp\Big(h\varepsilon+\sum_{j=1}^kU_{\theta_j}(x_1^j,\ldots,x_{p-1}^j;\varepsilon)\Big),\qquad V_{\rm e}=C_\theta(x_1,\ldots,x_p).$$

幂平均算子（条件期望只对辅助消息、物理无序保持 quenched）：$T_rV=V$，$T_dV=(\mathbb E[(T_{d+1}V)^{m_{d+1}}|\mathscr F_d])^{1/m_{d+1}}$。定义

$$\mathcal B_r(\zeta,\mathbf m)=\log2+\mathbb E\log T_0V_{\rm s}-\alpha(p-1)\,\mathbb E\log T_0V_{\rm e},\qquad \Phi_r=\inf_{\zeta,\mathbf m}\mathcal B_r(\zeta,\mathbf m).$$

$r=0$ 时所有消息独立同分布 $\zeta\in\mathcal P(\mathbb R)$、省去 $T_d$，即优化的 replica-symmetric 值 $\Phi_0$。trial 泛函对任意 trial 消息有限：$|\log T_0V_{\rm s}|\le|h|+\sum_{j=1}^kB(\theta_j)$，$|\log T_0V_{\rm e}|\le B(\theta)$（幂平均保持逐点乘性界）。

### 1.3 主定理与推论

**主定理（Theorem 1.1, main:theorem）**：在 (integrability)–(positivity) 下，热力学极限存在且

$$\lim_{N\to\infty}F_N=\inf_{r\ge0}\Phi_r. \tag{main:formula}$$

右边是有限层级上的下确界；不假设某个 trial 律达到下确界，也不构造极限无限层级 Gibbs 态。这解决 Panchenko–Talagrand Theorem 4 之后紧接的 sharpness 猜想（PT 类 Poisson 偶元 Ising 模型）。

**推论**（consequences.tex §11）：
- **Viana–Bray / 稀释偶自旋模型**（models:spin）：$\theta_\beta=\beta J\prod s_\ell$（$p=2$ 即 Viana–Bray），$J$ 对称、$\mathbb E|J|+\mathbb E|H|<\infty$。因子化参数 $a=\cosh(\beta J)$，$b=\tanh(\beta J)$，$f_\ell(s)=s$；$|b|<1$，奇数矩为零、偶数矩非负，正性成立。
- **Soft random even-$K$-SAT**（models:sat）：$\theta_\beta=-\beta W\prod_\ell\frac{1+\varepsilon_\ells_\ell}2$，$W\ge0$ 独立、$\mathbb E W<\infty$。写 $e^{\theta}=1+(e^{-\beta W}-1)I_\varepsilon(s)$，取 $a=1$、$b=e^{-\beta W}-1\in[-1,0)$、$f_\ell(s)=\frac{1+\varepsilon_\ells}2$，则 $0\le-b<1$，全部正性不等式成立。
- **零温基态能**（models:ground）：两个模型中 $g=\lim_N\frac1N\mathbb E\max_\sigma\mathcal E_N(\sigma)$ 存在且

$$g=\lim_{\beta\to\infty}\frac1\beta\inf_{r\ge0}\inf_{\zeta,\mathbf m}\mathcal B_{r,\beta}(\zeta,\mathbf m),$$

更精确地该表达式落在 $[g,\,g+\log2/\beta]$（由 $2^N$ 个组态的夹逼 $g_N\le P_N(\beta)/\beta\le g_N+\log2/\beta$ 得到）。单位权 SAT 的极限期望每变量最少违约子句数为 $-g$。

**排除 3-SAT 的说明**（§11 末 remark）：even-arity 假设排除随机 3-SAT（奇数元）；姊妹篇 [Theorem 8.4] 对 Poisson 子句、变量位置独立有放回的模型给出有限有理 trial 上的精确 soft-pressure 公式，但其符号索引消息对不必构成概率分布，trial 泛函与本文 (model:functional) 不同。

### 1.4 证明的四步结构（overview.tex）

上界在每个 $N$、每个有限深度都成立，直接重现 PT 插值。**下界四步**：

1. **选 cavity reservoir**：比较 $N$ 与 $N+1$ 系统的公共 $N$ 自旋 Gibbs 系统。加入数量为亚线性（$s_N=N^{3/4}$）的有界 Poisson 扰动，对 pressure 影响 $o(1)$。在每个固定层级深度，选取系统尺寸与确定性扰动参数，使经幂平均递归后逐次期望对数差 $\le$ 原压强下极限加任意小误差；同样选择给出每个扰动 score 的集中（cavity.tex + pert:selection）。
2. **规定分支形状**：有限概率树上的初等演算把插入展开成对新增副本路径的带号求和；独立标记选取任意规定的分支形状；score 集中给出这些带号和的恒等式（trees.tex + pert:tree-identity）。
3. **集中所有 multioverlap**：把目标树的每个内部分支深度后移一步；每个新深度处的第一个 fresh 分裂供给与归一化系数相同的小因子；绝对系数和的相对界保证除法后的误差控制；条件协方差对副本数归纳衰减；第二个恒等式集中剩余的条件均值（decorrelation.tex）。
4. **恢复独立 cavity 消息**：把均匀抽取的 reservoir 位点的整个有限层级用逐次条件律编码；multioverlap 集中允许把不同位点标签换成该过程的独立副本代入 cavity 插入，得到与所选增量接近的合法 trial 值（comparison.tex）。

### 1.5 上界与下界的分工

- **上界**（upper.tex）：Guerra 插值 + Franz–Leone/PT 的稀释适配。用到因子化 + 正性：三处插入的阶-$n$ 系数合并成 $-\frac{\lambda^n}{n}\mathbb E[(-b)^n]\,\mathbb E_{Q_n}\mathbb E[P_\mathcal T^p-pP_\mathcal TB_\mathcal T^{p-1}+(p-1)B_\mathcal T^p]$，$p$ 偶保证 $x\mapsto x^p$ 凸性使括号非负，正性使系数非正。
- **下界**（cavity–comparison 四步）：**只用**相互作用有界 + 输入置换不变性。原文明确："Neither the factorization nor the positivity assumption is used in the lower bound"（cavity.tex §5 开头）。
- **缝合**（reduction.tex）：常数平移 $c=\theta(1,\ldots,1)$ 消去非对称乘子 $a$ 得到置换不变的 $\widehat\theta$；截断到 $[-K,K]$ 用有界版下界；稳定性引理给出一致误差 $2\alpha pD_K+2d_K\to0$。

---
## 二、逐引理带批注重构

按论文实际章节顺序（model → trees → upper → cavity → perturbations → decorrelation → comparison → reduction）。每条含：(a) 精确陈述；(b) 证明机制推导；(c) 假设/常数的机械理由；(d) 候选失败路线 [推测]。

### 2.0 model.tex：模型、trial 泛函与主定理

**(a) 陈述**：见 §一。trial 界 (model:trial-bounds)：$|\log T_0V_{\rm s}|\le|h|+\sum_{j=1}^kB(\theta_j)$，$|\log T_0V_{\rm e}|\le B(\theta)$。

**(b) 机制**：$V_{\rm s},V_{\rm e}$ 是有界正量（$\log|V_{\rm s}|\le|h|+\sum_jB(\theta_j)$ 逐点成立，因每个 $U_{\theta_j}$ 有界）；幂平均 $T_dV=(\mathbb E[V^{m}|\mathscr F_d])^{1/m}$ 对满足 $a\le V\le b$ 的量保持同样的根可测界（由 Jensen / 幂平均单调性），故逐层向上保持界，$T_0V_{\rm s}$ 的 $\log$ 可积性只需 $\mathbb E|h|+\alpha p\,\mathbb EB(\theta)<\infty$。深度二的显式展开（论文给出）$T_0V=(\mathbb E_{\boldsymbol\eta_1}[(\mathbb E_{\boldsymbol x}[V^{m_2}|\boldsymbol\eta_1])^{m_1/m_2}|\boldsymbol\eta_0])^{1/m_1}$ 表明：外层平均物理无序与根测度，内层只平均辅助消息——这个"哪些变量在条件里"的区分是整个上下界 bookkeeping 的基础。

**(c) 机械理由**：一阶矩假设够用是因为 trial 泛函与 $F_N$ 都对物理无序逐点 Lipschitz（见 reduction:stability），而幂平均保持有界性——不需要 $b$ 的高阶矩；$b$ 的有界性反而是在上界里从因子化推出的（非退化情形），不是假设。

**(d) 失败路线**：
- 若 trial 消息无矩假设会导致 $\mathcal B_r=\infty$，下确界失控——靠 (model:trial-bounds) 的逐点界封死 [推测：这正是把 $V_{\rm s}$ 写成对 $\varepsilon$ 求和而非求 log-sum-exp 之外形式的原因，任何含 $x$ 无界增长的参数化都会破坏逐点界]。
- 若允许 $r=\infty$（无限层级），$\mathcal M_{r+1}$ 拓扑与 $T_d$ 递归的良定义都成问题，且 infimum 可能不被有限层级逼近——定理刻意只对有限 $r$ 取 inf，"No attainment at a fixed level or by a particular trial law is asserted" [推测]。
- 若去掉 $m_1<\cdots<m_r<1$ 的严格递增，幂平均链可能退化（$m=0$ 时是均值、$m\to1$ 时是极大），树演算中 $\gamma_\beta=m_{d_\beta}-n_\betam_{d_\beta+1}$ 的符号结构改变——证伪路线：取 $m_{d+1}\ge m_d/n$ 会使 fresh 分裂系数恒非负，Q_k 律失去概率归一 [推测]。

### 2.1 trees.tex §3.1：插入演算（Lemma tree:insertion）

**(a) 陈述**：固定 $L\ge1$，$0=m_0<m_1<\cdots<m_{L-1}<m_L=1$。路径核 $K_d$（$1\le d\le L$），根分布固定。由配分函数出发的向后递归 $X_{L-1}=\log Z$，$X_{d-1}=m_d^{-1}\log P_de^{m_dX_d}$ 定义**倾斜核**

$$K_d(dz|\mathscr F_{d-1})=e^{m_d(X_d(z)-X_{d-1})}P_d(dz|\mathscr F_{d-1}).$$

对正路径函数 $A$，$Y_L=A$，$Y_{d-1}=(K_dY_d^{m_d})^{1/m_d}$；更新核 $K_d^A=(Y_d/Y_{d-1})^{m_d}K_d$。把每个自旋权重乘 $A$ 后，根对数变化 $\log Y_0$；内部顶点 $\beta$（深度 $d_\beta$、子数 $n_\beta$）的树密度

$$W_\mathcal T(A)=\frac{dP_\mathcal T^A}{dP_\mathcal T}=\prod_{a\in\mathrm{Leaves}}A^a\prod_{\beta\in\mathrm{Int}}Y_\beta^{\gamma_\beta},\qquad \gamma_\beta=m_{d_\beta}-n_\betam_{d_\beta+1}.$$

单调性与齐次性：$a\le A\le b$（根可测）$\Rightarrow a\le Y_d\le b$；$A$ 乘根可正常数则所有 $Y_d$ 乘同一常数。

**(b) 机制**：终末端 $m_L=1$ 使配分函数比 $K_LA=Y_{L-1}$；代入前一层的幂平均得 $\exp(m_d(X_{d-1}^A-X_{d-1}))=K_d\exp(m_d(X_d^A-X_d))$，向后归纳得 $X_d^A-X_d=\log Y_d$ 与更新核。密度：把每条边的密度比 $(Y_d/Y_{d-1})^{m_d}$ 沿树相乘，内部顶点收到来自入边指数 $+m_d$、来自 $n_\beta$ 条出边指数 $-n_\betam_{d+1}$；根无入边（$m_0=0$ 一致），叶收到 $m_L=1$。一阶变分（tree:first-variation）：

$$\partial_{t_j}\log Y_d=E^{A_{\boldsymbol t}}\Big[\frac{D_j}{A_{\boldsymbol t}}\Big|\mathscr F_d\Big],\qquad A_{\boldsymbol t}=1+\sum t_jD_j,$$

即对指定前缀之下沿一条新路径的条件期望——对单层幂平均求导得 $\partial\log Y_{d-1}=K_d^A\partial\log Y_d$。

**(c) 机械理由**：$\gamma_\beta$ 的符号不定（$j=1$ 时 $m_d-m_{d+1}$ 可为负——在均匀网格上恰为 $-\delta$），这个带号结构是后面"fresh divergence 因子"与"small factor"的全部来源；$m_0=0$ 保证根不产生额外系数；解析域 $\sum_j|t_j|\|D_j\|_\infty<1$ 加主辐角论证（$|\arg Y_d|\le m_d\vartheta$，$\vartheta=\arcsin\rho$）给出对核一致、对树大小/深度固定的解析界，使一切求导与级数合法。

**(d) 失败路线**：
- 若 $A$ 不一致远离 0（如允许 $1+tD$ 变号），$Y_d^{m_d}$ 的复幂（$m_d$ 非整数）无主分支——被解析域与 $\rho<1$ 截断封死 [推测：这也是扰动因子 $\psi_\nu=1+t_\nug\sigma_i+u_\nug_0S_0$ 严格夹在 $1/2,3/2$ 的原因]。
- 试图把 $Y_\beta^{\gamma_\beta}$ 换成 $|Y_\beta|^{|\gamma_\beta|}$ 的绝对值版本会丢失带号相消，$\kappa(S)$ 的乘积公式不复成立 [推测]。
- 若根分布也乘 $A$（未 quenched 的根变量），齐次性破缺，$\log Y_0$ 递归初值改变，树密度公式多出根因子 [推测]。

### 2.2 trees.tex §3.2：两条展开规则（Lemma tree:log-expansion 与 tree:extension-expansion）

**(a) 对数展开**：$A=1+tD$，$|t|\|D\|_\infty<1$ 时（条件于根）

$$\log Y_0=\sum_{k\ge1}\frac{(-1)^{k-1}t^k}{k}\,\mathbb E_{Q_k}E_\mathcal T\prod_{a=1}^kD^a,$$

余项 $|\cdot|\le\sum_{k>K}c^k/k$。$Q_k$ 是叶标 $1..k$ 的树律：从单路径开始，当前树 $n$ 叶时以概率 $\frac{n_\betam_{d_\beta+1}-m_{d_\beta}}{n}$（注意正号，是 $-\gamma_\beta$）选内部顶点 $\beta$ 生成 fresh child，接全新路径到深度 $L$，终端标号 $n+1$。归一化靠恒等式（telescoping）

$$\sum_{\beta\in\mathrm{Int}(\mathcal T)}(n_\betam_{d_\beta+1}-m_{d_\beta})=n.$$

$Q_2$ 下两路径在深度 $d$ 分裂的概率为 $m_{d+1}-m_d$；均匀网格 $m_d=d/L$ 时对 $d$ 一致。

**(b) 机制**：一阶导是单条更新路径上 $D/A$ 的期望；把该叶"保护"（protected：其 $A^a$ 因子与分母相消）后，后续每次求导只能添加 fresh path，$k$ 阶时 $k-1$ 个 fresh 系数全负；归一化后系数绝对值乘积为 $(k-1)!$ 乘 $Q_k$ 概率，故 $\frac{d^k}{dt^k}\log Y_0|_0=(-1)^{k-1}(k-1)!\,\mathbb E_{Q_k}E_\mathcal T\prod D^a$。解析性补全级数。

**Canceled-anchor 展开**：固定旧树 $\mathcal T$、锚叶 $a_*$、有界 $H$；给旧路径依次着色后，对下一颜色允许 (i) 选未用旧叶（系数 $1$）或 (ii) 从内部顶点 $\beta$ 生成 fresh path（系数 $\gamma_\beta$）。扩展历史 $E$，系数积 $c_E$。则

$$\partial_{t_1}\cdots\partial_{t_k}E_\mathcal T^{A_{\boldsymbol t}}\frac{H}{A_{\boldsymbol t}^{a_*}}\Big|_{\boldsymbol t=0}=\sum_Ec_E\,E_{\mathcal T_E}\Big[H\prod_{j=1}^kD_j^{a_j(E)}\Big].$$

**(b) 机制**：从 $C=\{a_*\}$、$G=H$ 出发用保护叶论证逐步合并 $D_j$；fresh 叶立即保护，唯一未保护的叶是未用旧叶；在 $\boldsymbol t=0$ 处所有 $A,Y$ 因子为 1。

**(c) 机械理由**：保护叶机制让求导不产生"对旧叶再加权"的交叉项——这是把混合导数严格写成扩展和的关键；空扩展权重 1；同一方向 $D_j=D$ 时 $t^k$ 系数要除 $k!$（对称化）。

**(d) 失败路线**：
- 若不用 canceled anchor 而直接对 $E_\mathcal T^A[H A^{a_*}]$ 展开，锚叶的 $D_j^{a_*}$ 因子会与树密度叶项纠缠，扩展系数失去 $\gamma_\beta$ 的封闭形式 [推测：summary 里"Barbier–Panchenko Poisson 扰动恒等式系数交错"的困难对应此处]。
- 若 $H$ 依赖插入参数（不固定），求导会多出 $\partial_tH$ 项破坏系数计算——所以 $f$ 必须是旧 multioverlap 的固定多项式 [推测]。
- 若扩展规则允许"复用锚叶或已用颜色"，$\mathfrak E$ 的计数与 $\kappa(S)$ 迭代会重复计入，参考路径总数引理失效 [推测]。

### 2.3 trees.tex §3.3：扩展系数和（Lemma tree:reference-total 与 tree:charging）

**(a) 参考路径总数**：若下一颜色必须沿指定参考前缀到深度 $d$ 后进入与 $j$ 个含参考路径的子树都不同的子树，则所有允许选择的系数和为

$$m_d-jm_{d+1}. \tag{tree:one-reference-total}$$

因此若锚与各颜色必须构成指定树 $S$，所有相容扩展的总系数为

$$\kappa(S)=\prod_{v\in\mathrm{Br}(S)}\prod_{j=1}^{a_v-1}(m_{d_v}-jm_{d_v+1}). \tag{tree:K}$$

**(b) 机制**：在指定分歧顶点处，$n$ 为当前树子数，$j$ 个被排除子树含全部参考；其余 $n-j$ 个子树不含参考，其叶均为未用旧叶。对 $q$ 叶子树在内部 telescope：$q+\sum_{\beta}(m_{d_\beta}-n_\betam_{d_\beta+1})=m_{d+1}$。与指定顶点的 fresh 选择相加：$m_d-nm_{d+1}+(n-j)m_{d+1}=m_d-jm_{d+1}$。对一致的指定分裂深度，最深要求公共前缀决定分歧顶点与排除子树，故单步和只依赖当前参考树；对颜色反向求和，分支顶点处排除参考子树数恰为 $1,\ldots,a_v-1$，与颜色顺序无关。

** motivating 计算**（正文给出）：两条旧路径在 $d$ 分裂、锚为第一条、要求新颜色恰在 $d$ 分裂：$1+(m_d-2m_{d+1})+\sum_{\ell=d+1}^{L-1}(m_\ell-m_{\ell+1})=m_d-m_{d+1}$。均匀网格下带号总量 $=-\delta$ 但绝对值和 $=2+\delta$；若把要求的分裂推迟到 $d+1<L$（旧树上该处为 unary），唯一选择是 fresh 分裂，系数 $-\delta$，绝对和 $=\delta$。**这就是"深度平移"的原型**：把目标分支深度移离旧分支深度，可把绝对系数和从 $O(1)$ 降到 $O(\delta)$。

**(a') Charging fresh splits**：设 $m_d=d/L$、$\delta=1/L$。旧树 $q$ 叶、$k$ 个颜色；指定形状中 $b$ 个分支顶点的深度不在旧树任何分支深度处，则

$$\sum_{E\text{ allowed}}|c_E|\le C_{q,k}\delta^b. \tag{tree:charging-bound}$$

若这 $b$ 个顶点处 $m_{d_v}\ge\eta>0$，且 $J=\prod_v\prod_{j=1}^{a_v-1}(m_{d_v}-jm_{d_v+1})\ne0$，则

$$\frac1{|J|}\sum_{E}|c_E|\le C_{q,k,\eta}. \tag{tree:relative-charging}$$

**(b') 机制**：无约束一步的总绝对系数 $\le2s\le2(q+k)$（telescoping 给 fresh 总和 $=s$，旧选择 $\le s$ 个）；限制到指定深度的 unary fresh 分裂时每项系数 $-\delta$、该深度至多 $s$ 个顶点，故一步和 $\le s\delta$。每个指定顶点在"首次变成分支顶点"的那步必须由 unary 分裂 fresh 产生（它不能已在旧树分支），且不同顶点的创建步不同（一次 fresh 只造一个分支顶点）；分配数至多 $k!/(k-b)!$，固定分配后放大到"指定步造指定深度 unary 分裂 + 其余无约束"，得 $\frac{k!}{(k-b)!}(q+k)^b(2(q+k))^{k-b}\delta^b$。相对版：$j=1$ 因子绝对值 $=\delta$，$j\ge2$ 时 $|m_d-jm_{d+1}|=(j-1)m_d+j\delta\ge\eta$，故 $|J|\ge\delta^b\eta^{\sum_v(a_v-2)}$。

**(c) 机械理由**：$C_{q,k}$ 不依赖 $L$、指定深度、以及不同顶点深度的重合——"even when their depths coincide" 是 shift 方案的命门：两个对齐副本的对应顶点共享同一深度坐标，但仍是不同顶点、各付各的 $\delta$；$b\le k$ 且分配是组合选择而非对抽样值的条件（历史是选择不是事件），避免条件概率陷阱。

**(d) 失败路线**：
- 不平移深度：要求的分裂恰在旧分支深度处时带号和为 $m_d-jm_{d+1}$ 可能极小而绝对和 $O(1)$，除以 $\kappa(S)$ 后误差 $O(1)$——正是 summary 中"除以指数间隙乘积后误差太大"卡死的形态 [推测]。
- 等指数细分（equal-exponent refinements）：想用深度邻域内多项插值代替 $-\delta$ 单因子，但每个邻域贡献的连续性误差除以 $\kappa$ 后仍 $\not\to0$（summary："available continuity errors are too large after that division"）[推测]。
- 若两个目标顶点同深度被当成一个顶点计费，$\delta^b$ 变 $\delta^{b-1}$，$b$ 大时不足以压制 $1/|J|\sim\delta^{-2b}$（decorrelation 里 $J=\kappa(S^+)^2$ 有 $2b$ 个 $j=1$ 因子）[推测]。

### 2.4 trees.tex §3.4：分支深度分布（Lemma tree:regular-shapes）

**(a) 陈述**：$m_d=d/L$。固定 $\eta<1/2$，形状 *regular* 若每个分支深度 $/L\in(\eta,1-\eta)$ 且不同分支顶点的归一化深度差 $>\eta$。则 $Q_k\{$非 regular$\}\le C_k(\eta+L^{-1})$；任一指定带标号拓扑（$a$ 个分支顶点）与其深度赋值满足 $Q_k\{\cdot\}\le C_kL^{-a}$；从 regular 树删叶仍 regular。

**(b) 机制**：新分支顶点恰在下一路径于 unary 顶点分歧时产生，概率 $\delta/n$；任一深度至多 $n$ 个顶点，故下一步在深度集 $B$ 造分支顶点的概率 $\le|B|\delta$；前 $k-1$ 步的禁区（边界深度 + 已有分支顶点 $\eta$ 邻域）基数 $\le C_k(\eta L+1)$，union bound。指定拓扑+深度：限制到叶 $1..n$ 的树决定其在 $Q_k$ 规则下的逐次历史，每个分支顶点首次由 unary 分歧创造、概率 $\le\delta$，其余转移概率 $\le1$，故 $\le\delta^a$；等价子序号排列数只依赖 $k$。

**Remark（深度平均的合法性）**：$L^{-a}\sum$ 的深度平均可通过 (assignment-probability) 换算成 $Q_k$ 上的贡献；对子形状误差，把被丢弃坐标求和至多花对应幂次的 $L$；与 (irregular-probability) 合并，允许在 regular 深度赋值上的平均估计用于对数展开——**"深度平均意义"的集中即可，无需对深度一致集中**，这是整篇下界对集中性要求最弱的地方。

**(c)**：$\eta$ 正则性同时保证 (i) 禁区计数线性、(ii) shifted 深度 $q_v+1$ 落回 $\eta/2$-regular 域（decorrelation 用）、(iii) 删叶封闭（comparison 里诱导子树用）。

**(d) 失败路线**：
- 若用固定的少量深度（如只允许 $d=e$ 一处分裂），$Q_k$ 概率 $\sim\delta$ 不足以承担 $k$ 个约束的联合选择 [推测]。
- 试图对每个深度赋值做逐点（非平均）集中：regular 性只是高概率，坏赋值上无条件估计需要 $N$ 一致性——没有；论文靠 $Q_k$ 下坏树概率小 + 平均 Holder (decor:average-holder) 绕开 [推测]。
- 删叶后不重新检查 regular：被删分支顶点的深度坐标残留在平均里会破坏 $L^{-a}$ 归一化 [推测]。
### 2.5 upper.tex：插值上界（Proposition upper:bound）

**(a) 陈述**：在主定理假设下，$F_N\le\mathcal B_r(\zeta,\mathbf m)$ 对一切 $N$ 与一切允许的有限层级 trial 律成立；从而 $F_N\le\inf_{r\ge0}\Phi_r$。

**(b) 机制**（三段）：

*退化因子化的处理*：$M=\max_s|f(s)|$。若 $b=0$ 或 $M=0$ a.s.，相互作用是自旋无关常数 $c$，$F_N=\mathcal B_r=\log2+\mathbb E\log\cosh h+\alpha\mathbb Ec$ 对一切 trial 律成立。否则取 $u,v>0$ 使 $\mathbb P(M\ge u)>0$、$\mathbb P(|b|\ge v)>0$；由 $|b|\prod M_\ell<1$ a.s. 与独立性，

$$\|b\|_\infty\le u^{-p},\qquad\|M\|_\infty\le(vu^{p-1})^{-1},$$

（反证：在正概率集上违反一界、把其他独立因子限制在另一界上会违反严格乘积条件）。故下面用到的所有矩有限。

*插值*：固定 trial 律，$L=r+1$。在真实相互作用（均值 $t\alpha N$）与每点独立 cavity 相互作用 $U_\theta(x_1,\ldots,x_{p-1};\sigma_i)$（均值 $(1-t)\alpha p$）之间插值；不同 cavity 项的消息标签不相交；计数、相互作用、场、根消息测度全 quenched。记 $\varphi(t)$ 为插值系统经向后幂平均后的期望根对数 $/N$；站点间独立性给出 $\varphi(1)=F_N$，$\varphi(0)=\log2+\mathbb E\log T_0V_{\rm s}$。Poisson 求导：$\varphi'(t)/\alpha$ = 一个真实相互作用的期望插入增量 $-p\times$ 一个均匀位点 cavity 交互的增量；每个增量绝对值 $\le B(\theta)$。要证

$$\varphi'(t)+\alpha(p-1)\mathbb E\log T_0V_{\rm e}\le0. \tag{upper:derivative}$$

*归一化（消去 $a$）*：所有三种插入在因子化下形如 $a(1+D)$：真实交互 $D=b\prod_\ell f_\ell(\sigma_{i_\ell})$；cavity 交互把 $p-1$ 个因子换成 $\bar f(x)=\sum_sf(s)q_x(s)$；edge 插入把 $p$ 个全换。先减去 $c=\theta(1,\ldots,1)=\log a(1+D_*)$（$D_*=b\prod_\ell f_\ell(1)$，可积），在系数 $1,-p,p-1$ 组合中相消。再对 $0<\lambda<1$ 把每个归一化增量换成

$$\log Y_0(1+\lambda D)-\log(1+\lambda D_*),$$

由恒等式 $\frac{1+\lambda D}{1+\lambda D_*}=(1-w)+w\frac{1+D}{1+D_*}$，$w=\frac{\lambda(1+D_*)}{1+\lambda D_*}\in[0,1]$，比值夹在 $e^{-2B(\theta)}$ 与 $e^{2B(\theta)}$ 之间，故正则化增量绝对值 $\le2B(\theta)$；$\lambda\uparrow1$ 时对自旋输入与消息一致收敛，有限递归保持，支配收敛恢复目标增量。

*凸性*：对正则化增量用对数展开。树 $\mathcal T$（$n$ 叶）上定义 $P_\mathcal T=\frac1N\sum_i\mathbb E_f\prod_{a=1}^nf(\sigma_i^a)$（一个 fresh $f$ 被 $n$ 个副本共享）与 $B_\mathcal T=\mathbb E_{f,x}\prod_{a=1}^n\bar f(x^a)$（含整棵 fresh 消息标签树，与旧系统独立，故对固定树是确定性的）。对独立均匀指标与独立 $f$、消息标签求平均分别得 $P_\mathcal T^p$、$P_\mathcal TB_\mathcal T^{p-1}$、$B_\mathcal T^p$。三处插入共享同一 $Q_n$ 树律，阶-$n$ 系数为

$$-\frac{\lambda^n}{n}\,\mathbb E[(-b)^n]\,\mathbb E_{Q_n}\mathbb E\Big[P_\mathcal T^p-pP_\mathcal TB_\mathcal T^{p-1}+(p-1)B_\mathcal T^p\Big]. \tag{upper:remainder}$$

$p$ 偶 $\Rightarrow$ $x\mapsto x^p$ 凸 $\Rightarrow$ 括号 $\ge0$（即 $A^p-pAB^{p-1}+(p-1)B^p\ge0$ 取 $A=P_\mathcal T,B=B_\mathcal T$ 的期望形式）；$\mathbb E[(-b)^n]\ge0$ 使整体 $\le0$。$\lambda\uparrow1$ 后对 $t\in[0,1]$ 积分。

**(c) 机械理由**：$\lambda$-正则化是为绕开 $\log a$ 不可积——$D_*$ 减法要求 $\mathbb Ec$ 可积（由 $|c|\le B(\theta)$ 保证），而 $a$ 本身的对数从不单独出现；$1,-p,p-1$ 系数来自对 $t$ 的 Poisson 求导组合（真实交互均值变化率 $\alpha$、cavity $\alpha p$、以及 $\varphi(0)$ 与 $V_{\rm e}$ 项的 $-\alpha(p-1)$ 配平）；三插入共享 $Q_n$ 是因为 $Q_n$ 只由 $m$-网格与树规则决定、与核无关。

**(d) 失败路线**：
- 不做 $\lambda$-正则化直接对 $\log a(1+D)$ 取期望：$\mathbb E|\log a|=\infty$ 可能发生（$a$ 依赖其余变量），$\varphi'(t)$ 不存在 [推测：这是 PT 原证可以回避而本文必须自建的部分]。
- $p$ 奇：凸性论证失效，括号无定号——正是 3-SAT 被排除在上界路线之外的结构原因 [推测]。
- $B_\mathcal T$ 若与旧系统相关（消息树不 fresh），$P^p-pPB^{p-1}+B^p$ 的因子化结构破坏，凸性括号不再出现 [推测]。
- cavity 增量的 $B(\theta)$ 一致界依赖幂平均保界；若 trial 消息无界而用别种递归（如算术平均），$\varphi'$ 有界性失效 [推测]。

### 2.6 cavity.tex：扰动 reservoir 与 cavity 增量（Lemma cavity:increment）

**(a) 设置与陈述**：自此到 reduction 假设 $B(\theta)\le B$、$|h|\le H$ a.s. 且 $\theta$ 的律对 $p$ 个坐标置换不变（**下界不用因子化与正性**）。固定 $L\ge2$、$r=L-1$、网格 $m_d=d/L$、$\delta=1/L$。取 $(c_\nu)_{\nu\ge1}$ 正、和为 1，$s_N=N^{3/4}$；向自旋权重加独立的单点因子 $\psi_\nu$ 的 Poisson 族（计数均值 $c_\nu s_N$、独立均匀位点），$1/2\le\psi_\nu\le3/2$。总因子数 $\mathrm{Pois}(s_N)$；计数、类型、位点为根变量；参数 $\mathbf u$ 固定（非 quenched）。$P_N^{L,\mathbf u}$ 为扰动系统幂平均后的期望根对数，$|P_N^{L,\mathbf u}-NF_N|\le(\log2)s_N$（逐点比较后经递归）。

**Lemma（cavity:increment）**：增量 $\Delta_N^{L,\mathbf u}=P_{N+1}^{L,\mathbf u}-P_N^{L,\mathbf u}$ 对 $N,L,\mathbf u$ 一致有界；存在 $N$ 自旋 reservoir（物理交互计数均值 $\rho_N=\alpha(N+1)(\frac{N}{N+1})^p$、通常场、扰动计数均值 $c_\nu s_N$）使

$$\Delta_N^{L,\mathbf u}=\log2+\mathbb E\log Y_{0,\rm s}-\mathbb E\log Y_{0,\rm b}+o_N(1),$$

误差对 $L,\mathbf u$ 一致。插入末端：

$$A_{\rm s}(\sigma)=\frac12\sum_{\varepsilon=\pm1}\exp\Big(h\varepsilon+\sum_{j=1}^{K_{\rm s}}\theta_j(\sigma_{i_{1,j}},\ldots,\sigma_{i_{p-1,j}},\varepsilon)\Big),\quad K_{\rm s}\sim\mathrm{Pois}(\alpha p);$$
$$A_{\rm b}(\sigma)=\exp\Big(\sum_{j=1}^{K_{\rm b}}\theta_j(\sigma_{i_{1,j}},\ldots,\sigma_{i_{p,j}})\Big),\quad K_{\rm b}\sim\mathrm{Pois}(\alpha(p-1)).$$

**(b) 机制**：把 $(N+1)$ 系统的 Poisson 交互过程按"含新指标 $N+1$ 的个数"分裂：无新指标者均值 $\rho_N$；恰一个新指标者均值 $\alpha p(N/(N+1))^{p-1}=\alpha p+O(N^{-1})$，由置换不变性把新输入放到末位，其余指标是 $[N]$ 上独立均匀指标、交互函数保持原律；至少两个新指标者总均值 $O(N^{-1})$，丢弃。另一方面 $N$ 系统可从同一 reservoir 加均值 $\alpha N-\rho_N=\alpha(p-1)+O(N^{-1})$ 的旧交互得到（对大 $N$ 非负）。扰动配对：$(N+1)$ 系统的旧位点扰动计数均值 $s_{N+1}N/(N+1)$、新位点 $s_{N+1}/(N+1)$，用公共 Poisson 点耦合，未匹配因子期望 $\le|s_{N+1}-s_N|+2s_{N+1}/(N+1)=O(N^{-1/4})$；删/加一个扰动改根对数 $\le\log2$，一个交互改 $\le B$；多余的辅助变量可直接以其先验积掉。汇总：丢弃重复新指标交互、配平扰动、把两个插入计数均值换成极限，总期望代价 $O(N^{-1/4})$；对新自旋求和给 $2A_{\rm s}$（因子 2 供出 $\log2$），旧系统修正给 $A_{\rm b}$；插入恒等式（trees 插入演算对 $K_{\rm s}$ 条件化后的形式）给出 (cavity:identity)。界 $|\log Y_{0,\rm s}|\le H+BK_{\rm s}$、$|\log Y_{0,\rm b}|\le BK_{\rm b}$ 配合耦合估计给出增量一致有界。

**(c) 机械理由**：$\rho_N$ 的具体形状 $\alpha(N+1)(N/(N+1))^p$ 来自"$(N+1)$ 系统中不含新位点的交互均值"，差 $\alpha(p-1)$ 恰是旧系统需要补的 bond 修正——$\alpha p$（site 项）与 $\alpha(p-1)$（edge 项配平）正是 trial 泛函里的系数；$s_N=N^{3/4}$ 是亚线性（扰动代价 $N^{3/4}\log2=o(N)$）但要足够大（后面 score 除以 $c_\nu s_N$ 后集中可除）的折中；$\psi_\nu\in[1/2,3/2]$ 保证 $\log$ 变化 $\le\log2$ 与幂平均下的逐点比较。

**(d) 失败路线**：
- 共享随机性路线（summary 的多位点 cavity）：条件于所有位点共享的层级随机变量再找独立位点消息——共享变量会"过拟合"抽到的位点（"overfitting shared variable can simulate original model at smaller scale"），逐点 LLN 无一致比较，pinning 可能以错误权重选态 [推测：对应本文方案里 reservoir 无序全程 quenched、消息才独立化的设计差异]。
- $s_N$ 若取 $N^\beta$，$\beta<1/2$ 会使 score 除法后的集中不够（pert:concentration 需要 $\lambda_\nu=c_\nu s_N\to\infty$ 快于别的误差），$\beta\ge1$ 扰动代价不再是 $o(N)$ [推测]。
- 两个新指标交互不丢弃而保留：$O(N^{-1})$ 均值不贵，但其插入形状（$p$ 元输入含两个新位）不在 $A_{\rm s}$ 类型里，需另类处理 [推测]。

### 2.7 perturbations.tex：扰动族与 score 集中（Lemma pert:concentration）

**(a) 扰动族**：mark specification = 有限个带标号 Rademacher 坐标（各配深度 $\in\{1,\ldots,L-1\}$）、两个有理值函数 $g,g_0:\{-1,1\}^n\to\mathbb Q\cap[-1,1]$、$S_0=1$（marker anchor）或 $S_0=\sigma_i$（spin anchor）。坐标在其指定深度沿辅助路径抽样；共享顶点处共享值、不同顶点独立。对每个 specification 配所有整数 $j\ge4$ 的类型，参数

$$t_\nu=j^{-1},\qquad I_\nu=[j^{-j},2j^{-j}],\qquad u_\nu\in I_\nu,$$

枚举为 $\nu\in\mathbb N$，权重 $c_\nu>0$、$\sum c_\nu=1$；各类型独立 $n_\nu\sim\mathrm{Poisson}(c_\nu s_N)$，每项带独立均匀位点与独立 mark 副本，叶处乘

$$\psi_\nu=1+t_\nug\sigma_i+u_\nug_0S_0\in(1/2,3/2).$$

$\pi=\prod_\nu\mathrm{Unif}(I_\nu)$，$\mathbf u=(u_\nu)$ 用 $\pi$ 选**确定性**参数向量（不是 quenched 律的一部分）。$t$ 的角色：探测插入的 Taylor 展开；$u$ 的角色：求导产生集中 score；$u\ll t^{\text{任意次幂}}$ 将迫使每个极限 Taylor 系数为零。

score：$D_\nu=\sum_{q=1}^{n_\nu}\frac{g_{0,q}S_{0,q}}{1+t_\nug_q\sigma_{i_q}+u_\nug_{0,q}S_{0,q}}$；$e_{\nu,N}(\mathbf u)=\frac1{c_\nu s_N}\mathbb E_{\mathbf u}\langle|D_\nu-\mathbb E_{\mathbf u}\langle D_\nu\rangle|\rangle$（$\langle\cdot\rangle$ 为条件于根的倾斜路径期望）。

**(b) 集中引理**：固定 $L,\nu$，$\int e_{\nu,N}(\mathbf u)\pi(d\mathbf u)\to0$（reservoir 同样成立）。证明三段：

*路径内涨落*：把 $\log$（自旋权重）当作 $X_L$（$m_L=1$），单层求导 $\partial_uX_{d-1}=K_d(\partial_uX_d)$，$\partial_u^2X_{d-1}=K_d(\partial_u^2X_d)+m_d\mathrm{Var}_{K_d}(\partial_uX_d)$。于是 $X_0'(u)=\langle D_\nu\rangle$，且

$$X_0''(u)=\langle\partial_uD_\nu\rangle+\sum_{d=1}^Lm_d\langle(M_d-M_{d-1})^2\rangle\ \ge\ m_1\mathrm{Var}(D_\nu|\mathscr F_0)-4n,$$

其中 $M_d=\langle D_\nu|\mathscr F_d\rangle$，$\partial_uD_\nu=-\sum_q\frac{(g_{0,q}S_{0,q})^2}{\psi_{\nu,q}^2}\in[-4n,0]$。在 $I_\nu=[a,b]$ 上积分并用 $|X_0'|\le2n$：

$$\int_a^b\mathbb E_{\mathbf u}\mathrm{Var}(D_\nu|\mathscr F_0)du\le\frac{4\lambda_\nu(1+b-a)}{m_1},\qquad \lambda_\nu=c_\nu s_N,$$

即区间平均热涨落（MAD/方差）$\le(\frac{4(1+|I_\nu|)}{m_1|I_\nu|\lambda_\nu})^{1/2}$。

*根均值的集中*：$G(u)=X_0(u)+2nu^2$ 在含 $I_\nu$ 的区间 $J_\nu$ 上凸。Efron–Stein（用 Doob 差正交性证明的独立输入版 $\mathrm{Var}Z\le\frac12\sum_j\mathbb E(Z-Z^{(j)})^2$）：重抽一个交互/场/扰动项只改 $X_0$ 有界量（幂平均保持；删项时多余 mark 变量可积掉），Poisson 计数的 Lipschitz 函数方差 $\le C^2\mathrm{Var}(Q)$，得 $\mathrm{Var}(G(u))\le C_\nu N$、$|\mathbb E_{\mathbf u}G'(u)|\le C_\nu\lambda_\nu$（对 $u\in J_\nu$ 一致）。

*从凸函数到导数*：$\bar G=\mathbb E_{\mathbf u}G$，$Z=G-\bar G$，差商不等式 $|G'(u)-\bar G'(u)|\le\frac{|Z(u-\rho)|+2|Z(u)|+|Z(u+\rho)|}{\rho}+\bar G'(u+\rho)-\bar G'(u-\rho)$，配合 $\bar G'$ 单调与 $\int_a^b[\bar G'(u+\rho)-\bar G'(u-\rho)]du\le2\rho[\bar G'(b+\rho)-\bar G'(a-\rho)]$，得区间平均 $\mathbb E_{\mathbf u}|G'(u)-\mathbb E_{\mathbf u}G'(u)|\le C_\nu(\frac{\sqrt N}{\rho}+\frac{\rho\lambda_\nu}{|I_\nu|})$。取 $\rho=N^{-1/8}$，除以 $\lambda_\nu=c_\nu N^{3/4}$ 两项都 $\to0$；去掉 $2nu^2$ 修正代价 $C_\nu\lambda_\nu^{-1/2}$。

**(c) 机械理由**：$u$ 是求导参数而 score $D_\nu$ 是 $\partial_u\log$——二阶导的正项（各层 $m_d\mathrm{Var}$ 之和）正是热方差的来源，所以集中从"对 $u$ 的凸性"免费得到（Ghirlanda–Guerra 式恒等式的 Poisson/均值版本）；$t$ 出现在分母里只是保证 $1/2<\psi<3/2$；$I_\nu$ 长度固定正（对固定类型），集中常数可依赖它；$u_\nu$ 取在 $j^{-j}$ 尺度是为 analytic 提取（下一引理）里 $|H(j^{-1})|\le2Cj^{-j}$ 压过任何 $j^{-q}$。

**(d) 失败路线**：
- 把 $u$ 的扰动也当作 quenched 随机参数：$\pi$ 上的平均会变成对背景测度的改变（summary 第三页的担忧"varying the small insertion parameter silently changes the background measure"）——本文用确定性选择 + "每个 $u$ 值视为同一固定背景上的假想额外因子"（Poisson removal 供给背景）绕开 [推测]。
- 若扰动计数均值不趋于无穷（如 $s_N=\log N$），$\lambda_\nu^{-1}$ 项不消失，score 集中失败 [推测]。
- 想直接对 $t$ 求导取集中（$t$ 也小）：$\partial_t\log\psi=g\sigma_i/(\cdots)$ 无 $u$ 那样的平方结构，二阶导缺乏正项 [推测]。
- 差商半径 $\rho$ 若取 $N^{-1/2}$：$\sqrt N/\rho=N$ 太大；若取常数：$\rho\lambda_\nu/|I_\nu|\sim N^{3/4}$ 太大——$N^{-1/8}$ 是让两项在 $N^{3/4}$ 除法下都消失的可行选择 [推测]。

### 2.8 perturbations.tex：一个序列拿低增量与全部恒等式（Lemma pert:selection）

**(a) 陈述**：$\underline F=\liminf_NF_N$（对有界模型全体尺寸）。对每个固定 $L\ge2$、$\varepsilon>0$，存在 $N_j\uparrow\infty$ 与确定性 $\mathbf u_j$ 使 (i) $\Delta_{N_j}(\mathbf u_j)\le\underline F+2\varepsilon$；(ii) 每个固定类型 $\nu$ 有 $e_{\nu,N_j}(\mathbf u_j)\to0$（reservoir 中）；(iii) reservoir 中每个固定有限树、深度 $L$ 上 multioverlap 的每个有限乘积的期望沿该序列收敛。

**(b) 机制**：一致扰动界给 $\liminf_N\frac1N\int P_N^{L,\mathbf u}\pi(d\mathbf u)=\underline F$，故无穷多个 $N$ 满足 $\int\Delta_Nd\pi\le\underline F+\varepsilon$（否则平均增量 telescope 矛盾）；$|\Delta_N|\le C$ 一致。对有限类型族，集中引理 + Markov：选 $N_j$ 使 $\sum_{\nu\le j}\int e_{\nu,N_j}\,d\pi\le j^{-3}$，则 $G_j=\{e_{\nu,N_j}\le j^{-1},\forall\nu\le j\}$ 的补测度 $q_j\le j^{-2}$；$G_j$ 上条件均值增量 $\le\frac{\underline F+\varepsilon+Cq_j}{1-q_j}\le\underline F+2\varepsilon$；在 $G_j$ 内取增量小的向量。(iii) 用可数树形集合 + 对角子列（每个乘积绝对值 $\le1$），不影响 (i)(ii)。此后 "$N\to\infty$" 都指沿该序列；对 $L$、路径数、类型无一致性断言。

**(c) 机械理由**：低增量与集中必须在**同一个确定性参数向量**上成立——否则恒等式只在"平均意义上"成立而无法代入 cavity 比较；$q_j\le j^{-2}$ 使坏参数集的质量被 $Cq_j$ 吸收；因为所有误差在固定 $L$ 下才取极限，"$\nu$ 有限"的对角化足够。

**(d) 失败路线**：
- 想让一个序列对所有 $L$ 同时工作：集中常数对 $L$ 不一致（引理明说"Constants need not be uniform in $L$ or $\nu$"），必须每个 $L$ 独立选序列 [推测：对应 summary"order of limits matters: errors in fixed-depth identities disappear before the hierarchy is refined"]。
- 若 (iii) 的收敛对象取成所有树形上的一致收敛：树形可数但无界，对角化不封口 [推测]。
- 把 $\varepsilon$ 的选择推迟：$\Delta$ 界 $\underline F+2\varepsilon$ 中的 $2\varepsilon$ 在最后 corollary 里要 $\varepsilon\downarrow0$，若 $\mathbf u_j$ 依赖 $\varepsilon$ 而中间步骤偷换序列会破坏收敛 [推测]。

### 2.9 perturbations.tex：Palm 恒等式与解析提取（Lemma pert:palm、pert:analytic）

**(a) Palm 恒等式**：固定旧树 $\mathcal T$、锚叶 $a_*$、有界 overlap 多项式 $f$。score 集中给

$$\Big|\frac{\mathbb E[fD_\nu^{a_*}]-\mathbb Ef\,\mathbb E\langle D_\nu\rangle}{c_\nu s_N}\Big|\le\|f\|_\infty e_{\nu,N}\to0. \tag{pert:score-identity}$$

引入独立新均匀位点与独立 mark 副本，$A=1+tg\sigma_i+ug_0S_0$，$Y$ 为其插入递归，$W_\mathcal T(A)$ 为更新树密度，令

$$J_{N,\mathcal T}(t,u)=\mathbb E\Big[f\,\frac{g_0^{a_*}S_0^{a_*}}{A^{a_*}}W_\mathcal T(A)\Big],\qquad H_N(t,u)=J_{N,\mathcal T}(t,u)-\mathbb Ef\,J_{N,\{a_*\}}(t,u).$$

则 $|H_N(t_\nu,u_\nu)|\le\|f\|_\infty e_{\nu,N}$；且对固定 mark specification，$H_N(t,u)$ 对其所有类型 $j$ 相同（基底 reservoir 含全部类型的原 Poisson 族，未删任何类型）。

**(b) 机制**：对 $D_\nu$ 的类型-$\nu$ 求和用 Poisson add-one 恒等式：除以均值 $c_\nu s_N$ 后剩余计数仍是 $\mathrm{Pois}(c_\nu s_N)$、其余计数不变——剩余模型恰有原 reservoir 律；被区分项成为独立新插入（参数 $t_\nu,u_\nu$），其 score 为 $g_0^{a_*}S_0^{a_*}/A^{a_*}$；更新树密度乘入后锚因子 $A^{a_*}$ 相消，得 $\frac{\mathbb E[fD_\nu^{a_*}]}{c_\nu s_N}=J_{N,\mathcal T}(t_\nu,u_\nu)$、$\frac{\mathbb E\langle D_\nu\rangle}{c_\nu s_N}=J_{N,\{a_*\}}(t_\nu,u_\nu)$。

**(a') 解析提取**：$H_N(t,0)$ 的每个 Taylor 系数沿选定序列 $\to0$。

**(b') 机制**：canceled-anchor 展开给出 $|t|,|u|<\rho$ 上解析且对 $N$、选定参数一致有界（缩 $\rho$ 得 $u$-导数一致界；常数依赖固定树、$L$、$\|f\|_\infty$ 但**不依赖类型号 $j$**）。每个 Taylor 系数是"规定树上的 multioverlap 矩与两个矩乘积"的有限线性组合，系数与 $N$ 无关，故由 pert:selection(iii) 收敛；一致解析界 + Taylor 尾的几何界给 $H_N(t,0)\to H(t)$ 在小圆盘一致。对充分大固定 $j$：$\limsup_N|H_N(j^{-1},0)|\le C\limsup_N|u_{\nu,N}|\le2Cj^{-j}$（score 误差在 $j$ 固定时 $\to0$，且所有 $j$ 用同一个 $H_N$）。若 $H$ 的首个非零 Taylor 系数次数为 $q$，则 $|H(j^{-1})|\ge cj^{-q}$ 对大 $j$，矛盾。故 $H\equiv0$ 于零附近，逐系数得证。

**(c) 机械理由**："$H_N$ 对所有 $j$ 相同" 是整个论证的枢纽——它使 $j\to\infty$ 的点值衰减 $j^{-j}$ 能压任何固定次幂 $j^{-q}$，从而逐系数归零；而这一点靠的是 Poisson add-one 后"背景不含被删类型"。$j\ge4$ 的下限是保证 $t,u$ 足够小进入解析域。

**(d) 失败路线**：
- 对每个 $j$ 重新定义 $H_N^{(j)}$（例如从 reservoir 里删去类型 $\nu$）：不同 $j$ 的解析函数不同，$j^{-j}$ 点值不再约束同一个 $H$，首系数次数 $q$ 的反证失效 [推测]。
- $u_\nu$ 若取固定值（如 $u=j^{-2}$）：点值 $|H(j^{-1})|\le Cj^{-2}$ 与 $q=1$ 的下界 $cj^{-1}$ 不矛盾，提取失败——$j^{-j}$ 超多项式衰减是必须的 [推测]。
- Taylor 系数的 $N$ 无关性若被破坏（$f$ 依赖 $N$ 或树形集合含 $N$），pert:selection(iii) 的对角化不覆盖 [推测]。

### 2.10 perturbations.tex：规定树上的恒等式（Theorem pert:tree-identity）

**(a) 陈述**：锚为 color 0，加色 $1,\ldots,k$ 占据与锚不同的副本位置，按 canceled-anchor 规则扩展；约束 $\mathcal C$ 只规定加色与锚之间的成对分裂深度（对其他旧副本无额外限制）。$\mathfrak E(\mathcal T,a_*,\mathcal C)$ 为允许扩展历史，$c_E$ 为系数；$R_E=\frac1N\sum_i\sigma_i^{a_*}\prod_{j=1}^k\sigma_i^{a_j(E)}$（spin anchor）或 $\frac1N\sum_i\prod_j\sigma_i^{a_j(E)}$（marker anchor）。则沿 pert:selection 的每个序列

$$\sum_{E\in\mathfrak E(\mathcal T,a_*,\mathcal C)}c_E\,\mathbb E[fR_E]-\mathbb Ef\sum_{E\in\mathfrak E(\{a_*\},a_*,\mathcal C)}c_E\,\mathbb E[R_E]\longrightarrow0,$$

对每个固定旧树、两种锚、每个有界多项式 $f$、任意有限有序加色、每个一致约束 $\mathcal C$ 成立。误差在固定 $L$、固定树、固定约束下取零，先于任何 $L$ 极限。

**(b) 机制**：$k=0$ 用常数 mark 的 vanishing 常系数。$k\ge1$ 两步：

*极化*：取有界有理 $g_0,g_1,\ldots,g_k$（由同一有限 mark 集合构造），混合插入 $A=1+\sum_{j=1}^kz_jg_j\sigma_i$ 的混合导数是单方向 degree-$k$ 系数的极化：若 $Q_N(g)=k![t^k]H_N(t,0)$，则混合导数 $=\frac{k^k}{2^kk!}\sum_{\epsilon\in\{\pm1\}^k}(\prod\epsilon_j)Q_N(k^{-1}\sum_j\epsilon_jg_j)$；每个自变量有理有界，仍属固定 mark 族，故由 pert:analytic 趋零；混合导数展开恰是有序扩展规则（无额外阶乘）。

*标记选择器*：对颜色对 $(a,b)$ 与深度 $d$，"分裂深度 $\ge d$"即"共享深度 $d$ 顶点"；在该深度引入独立 Rademacher 坐标并同时给 $g_a,g_b$ 该因子，mark 期望贡献 $1$ 当共享、$0$ 当不共享；不同要求用不同独立坐标、$g_a$ 取所配因子之积：

$$\mathbb E_{\rm marks}\Big[g_0^{a_*}\prod_{j=1}^kg_j^{a_j(E)}\Big]=\prod_{(a,b,d)\text{ required}}\mathbf 1_{\{a,b\text{ share their depth-}d\text{ vertex}\}}.$$

记 $H_d(a,b)$ 为共享示性函数（$H_0=1$、$H_L=0$，对相异副本位置——是**抽样树上的位置**，即使自旋组态碰巧相同）；精确在 $d$ 分裂 $=H_d-H_{d+1}$，乘积与有限线性组合选取任意一致着色形状。对 (pert:analytic-difference) 用混合 canceled-anchor 展开、按选择器平均 mark、再平均独立均匀插入位点（恰为 $R_E$），得恒等式。mark 只用到深度 $L-1$：扩展规则不复用锚或已用色，无需深度 $L$ 的重合检验。

**(c) 机械理由**：约束只涉及加色与锚——旧副本间的关系由旧的树抽样决定，不进恒等式；$R_E$ 中"位置相异但自旋可同"的区分避免把树位置与自旋值混淆；对固定 $L$ 只有有限多个相关树/约束，误差可在有限族上取极大 $\varepsilon_{N,L,k}\to0$（decorrelation 用）。

**(d) 失败路线**：
- 想直接规定"新副本与某个旧副本（非锚）的分裂深度"：mark 因子要同时挂在旧路径上，破坏 canceled-anchor 展开中旧叶"未保护"的地位，$\gamma_\beta$ 系数结构改变 [推测：decorrelation 里两副本方案用"对齐深度的两份 $S$ 副本"来绕开这一点]。
- 用连续权重的 $g$（非 $\{\pm1\}$ 值）做选择器：mark 族固定性（有理值、有限符号域）被破坏，pert:analytic 的统一界失效 [推测]。
- 把 $H_d$ 当作自旋相等的示性函数而非树位置共享：深度 $L$ 处两个副本的自旋可以相同，恒等式会多出虚假约束 [推测]。
### 2.11 decorrelation.tex §7.1–7.2：深度平均、收缩与深度连续性

**(a) 深度平均算子**：拓扑 $S$ = 压缩 unary 点的有根有限树（叶带标号），每个分支顶点配整数深度 $\in\{0,\ldots,L-1\}$、沿枝严格递增。固定 $\eta>0$，深度赋值 *$\eta$-regular* 若每个深度 $/L\in(\eta,1-\eta)$ 且相异分支顶点深度差 $>\eta$（两副本对齐深度时共享坐标，regular 施加于相异坐标）。对非负数组 $z(\mathbf q)$（$a$ 个深度坐标）：

$$\mathcal A_{L,\eta}z=L^{-a}\sum_{\mathbf q\ \eta\text{-regular}}z(\mathbf q)\qquad\text{（未归一化，总质量}\le1\text{）},$$

故 $0<\gamma\le1$ 时 $\mathcal A_{L,\eta}(z^\gamma)\le(\mathcal A_{L,\eta}z)^\gamma$（Holder）。两个常用比较：对未用坐标求和至多花 $L$（被归一化抵消）；固定整数平移把 $\eta$-regular 赋值单射入 $\eta/2$-regular（$L$ 充分大）。误差记号 $\varepsilon_{N,L,k}$：固定 $L,k$ 下有限树族上恒等式误差的最大值，$\varepsilon_{N,L,k}\to0$；乘它的常数可任意依赖 $L$。

**目标定理（decor:overlap-concentration）**：每个固定带标号拓扑 $S$，

$$\lim_{L\to\infty}\limsup_{N\to\infty}\mathcal A_{L,\eta}\operatorname{Var}(R_S)=0\qquad(\eta>0),$$

只对 $S$ 的 $b(S)$ 个分支深度平均；单点（singleton，无坐标）时 $\operatorname{Var}(R_S)\to0$ 对每个固定 $L$。

**(a') 收缩与三副本（Lemma decor:contractions）**：对 $S$ 的抽样副本记 $A_S=(\prod_{a\in S}\sigma_i^a)_{i\le N}$，$R_S=\mathbf1\cdot A_S$，$x\cdot y=N^{-1}\sum_ix_iy_i$。在初始干上深度 $d$（含首个分支深度）令 $\mu_{d,S}=\mathbb E[A_S|\mathscr F_d]$，

$$v_N(S,d)=\frac1{N^2}\mathbb E\sum_{i,j=1}^N\operatorname{Cov}(A_{S,i},A_{S,j}|\mathscr F_d)^2\ \in[0,1].$$

则：(i) 若 $B\in[-1,1]^N$ 条件独立于 $A_S$，$\|(A_S-\mu_{d,S})\cdot B\|_{L^2}\lev_N(S,d)^{1/4}$；(ii) 三条件独立副本 $X,Y,Z$、条件协方差阵 $C$：$\mathbb E(X\cdot Y-X\cdot Z)^2\ge\frac2{N^2}\mathbb E\sum_{ij}C_{ij}^2$。

**(b') 机制**：(i) 条件于 $\mathscr F_d,B$，平方收缩期望 $=N^{-2}\sum_{ij}C_{ij}B_iB_j$，绝对值 $\le N^{-2}\sum|C_{ij}|$，先 Cauchy–Schwarz 于 $(i,j)$ 再于前缀，得 $v^{1/2}$ 的平方根 $=v^{1/4}$。(ii) 条件计算 $\mathbb E[(X\cdot Y-X\cdot Z)^2|\mathscr G]=\frac2{N^2}\mathrm{tr}((C+\mu\mu^{\mathsf T})C)\ge\frac2{N^2}\mathrm{tr}(C^2)$（$C\succeq0$）。**为什么用 $v_N$**：它是"前缀之下随机性的平方条件协方差"，能同时承担三副本下界（把方差变成可测的平方量）与收缩上界（把任意相关测试函数的误差化成 $v^{1/4}$）两个方向——归纳的对象必须同时是"可被低阶项控制的"和"能给出下界的"。

**(a'') 深度连续性（Lemma decor:depth-continuity）**：把 $U$ 中分支顶点深度 +1 得 $S^U$。则（$L$ 充分大）

$$\mathcal A_{L,\eta}\mathbb E\|\mu_{d,S^U}-\mu_{d,S}\|_N^2\le C/L;$$

若 $d$ 沿初始 unary 段变化，$\mathcal A_{L,\eta}\mathbb E\|\mu_{d+1,S}-\mu_{d,S}\|_N^2\le C/L$。常数只依赖顶点数与平移数，对 $N$、求值深度、转移核一致。

**(b'') 机制**：单路径上 $\mu_{t,T}$ 是有界向量鞅，增量正交：$\sum_t\mathbb E\|\mu_{t+1,T}-\mu_{t,T}\|_N^2\le1$（martingale energy）——对 $L$ 个深度求和再除以 $L$ 给 $C/L$。单顶点平移：分支顶点（深度 $q$、子形 $T_1,\ldots,T_s$）原条件均值 $\prod_j\mu_{q,T_j}$；推迟到 $q+1$ 则为 $\mathbb E[\prod_j\mu_{q+1,T_j}|\mathscr F_q]$；Jensen + $[-1,1]^s$ 上的乘积差不等式给 $\le s\sum_j\mathbb E\|\mu_{q+1,T_j}-\mu_{q,T_j}\|_N^2$；逐顶点平移、平方三角不等式带平移数因子；changed 子树均值向祖先求值传播只经条件期望与 $\le1$ 的乘法，均收缩；regular 保证中间形状同祖先关系且落入 $\eta/2$-regular 域。单前缀边际律与别的抽样分支无关，故估计在更大的抽样树中也成立。

**(c) 机械理由**：$C/L$ 是"平均意义"的：不求 $N\to\infty$ 或对深度的一致性，只求固定深度族上求和后被 $L$ 摊薄——与 summary"bounded martingale increments control the one-level shifts after averaging over depths" 对应；$\eta/2$ 域的放大是为了平移后的坐标仍可被同一个平均算子覆盖。

**(d) 失败路线**：
- 想要逐深度（非平均）连续性：单点深度上 $\mathbb E\|\mu_{d+1,S}-\mu_{d,S}\|^2$ 无任何小界（质量可集中在一个深度）[推测]。
- 鞅能量 $\le1$ 依赖 $A_S$ 坐标有界（$|\sigma|\le1$）；若推广到无界自旋空间失效 [推测]。
- 平移多个顶点时若不用平方三角而用线性三角，因子从 $\sqrt{\#U}$ 变 $\#U$，与 $1/L$ 摊薄配合仍可但常数依赖暴露于 $L$ [推测]。

### 2.12 decorrelation.tex §7.3：条件去相关（Proposition decor:conditional-concentration）

**(a) 陈述**：每个固定带标号拓扑 $S$、每个 $\eta>0$：

$$\lim_{L\to\infty}\limsup_{N\to\infty}\mathcal A_{L,\eta}v_N(S,d)=0,$$

平均遍历 $S$ 的所有分支深度与一个严格先于首个分裂的附加 regular 深度 $d$；单点时只平均 $d$。

**(b) 机制**（对叶数 $k$ 归纳，记录 $V_{k,L}(\eta)=\max_{1\le|S|\le k}\limsup_N\mathcal A_{L,\eta}v_N(S,d)$）：

*单叶*：两条旧路径在 $d$ 分裂、路径 1 为 spin anchor，加一色要求恰在 $d$ 分裂。可选：用旧路径 2（系数 $1$）；fresh 从两条旧路径在 $d$ 共同分裂（系数 $-c_d$）；沿路径 2 到 $\ell>d$ 离开（系数 $-c_\ell$），其中

$$c_d=2m_{d+1}-m_d=(d+2)\delta,\qquad c_\ell=\delta\quad(d<\ell\le L-1).$$

仅从锚看总系数 $-\delta$。写 $X=R_{12}$、$X_\ell=R_{13}$；每个 $X_\ell$ 有 $X$ 的边际律，$\sum_{\ell=d}^{L-1}c_\ell=1+\delta$。规定树恒等式（$f=X$）给

$$\frac12\sum_{\ell=d}^{L-1}c_\ell\,\mathbb E(X-X_\ell)^2=\delta\operatorname{Var}(X)+o_N(1)\le\delta+o_N(1).$$

$\ell=d$ 时三个自旋向量条件独立于 $d$ 之下，三副本界 + $c_d\ge\eta$ 给 $v_N(S,d)\le\delta/\eta+o_N(1)$，故 $V_{1,L}(\eta)\le\delta/\eta$。

*平移副本及其系数*：$|S|=k\ge2$，首分裂 $e>d$，子形 $T_1,\ldots,T_s$。抽旧树 = $S$ 的两个副本 I、II，干在 $d$ 分裂、内部分支深度**对齐**；取 I 中一叶为 spin anchor。$S^+$ = 所有内部深度 +1 的 $S$。在规定树恒等式中要求：锚与加色构成 $S^+$ 的两份副本、在 $d$ 分离、锚在其原标号位置；先加 I 侧其余色、再加 II 侧。令

$$J=\kappa(S^+)^2,\qquad |J|\ge c_{k,\eta}\delta^{2b}>0\quad(b=b(S)),$$

（每个顶点 $j=1$ 因子 $=-\delta$；$j\ge2$ 绝对值 $\ge\eta/2$ 对大 $L$）。regular 使每个平移深度异于旧树的一切分支深度（含 $d$），故 $2b$ 个目标分支顶点必须由 fresh unary 分裂创造；charging 引理给

$$\frac1{|J|}\sum_{\text{allowed}}|c|\le C_{k,\eta}.$$

两副本深度对齐但顶点相异——每个顶点各付一个 $\delta$，**这就是平移的目的**。带号总系数另有分离于 $d$ 的因子 $-\delta$；除以 $J$ 后保留该因子。

*两侧投影*：每个扩展中，边际目标树是 $S^+$ 的两份普通副本、在 $d$ 下独立；投影界 (decor:projection-bound) 给其 multioverlap 与在 $e+1$ 投影均值收缩的 $L^2$ 差 $\le2p_N(S^+,e+1)$，其中

$$a_{S,e}=\prod_{j=1}^s\mu_{e,T_j},\qquad p_N(S,e)=\sum_{j=1}^sv_N(T_j,e)^{1/4}.$$

把子代深度退回 1、再把求值深度从 $e+1$ 移到 $e$：乘积差不等式 + 深度连续性给 $L^2$ 误差 $h_N(S)$，$\mathcal A_{L,\eta}h_N(S)^2\le C_k/L$；$h_N(S)$ 只依赖单副本边际形状、对扩展求和一致。

*带号扩展求和*：$f$ 取全部 $2k$ 个旧叶的 overlap。侧 I 加色留在锚枝 $d$ 之下，不动旧 II。侧 II 首条加色路径按前缀到 $e$ 分类：fresh 在 $\ell=d$ 分歧（系数 $-c_d$），或沿旧 II 干在 $d<\ell<e$ 分歧（系数 $-c_\ell=-\delta$）；该类中新干上的 $a_{S,e}$ 记 $b_\ell$（共享旧 II 前缀到 $\ell$）；$\ell=d$ 时载 $a,b,b_d$ 的三干条件独立于 $d$ 下；其余情形沿旧 II 前缀到 $e$、投影向量 $b$。对固定扩展历史，保留全部旧路径与首条目标-II 前缀到 $e$、删其余新枝——删除子树在概率核下积分为 1、复用旧叶不引入新变量，故类内联合边际固定、$f\times$投影 overlap 期望类内为常数可乘总带号系数。侧 II 后续色反向求和给 $\kappa(S^+)$、侧 I 给另一因子 $\kappa(S^+)$；fresh 类总系数 $-c_\ell J$；总系数 $-\delta J$（旧树与仅锚两侧一致）；由 $\sum_{\ell=d}^{e-1}c_\ell=(e+1)\delta=m_e+\delta$，剩余"前缀到 $e$"类系数 $m_eJ$。于是投影项系数表：

| 侧 II 前缀 | 投影 overlap | 总系数 |
|---|---|---|
| fresh 在 $d\le\ell<e$ 分歧 | $a\cdot b_\ell$ | $-c_\ell J$ |
| 沿旧前缀到 $e$ | $a\cdot b$ | $m_eJ$ |

除以 $J$、整理得**归纳恒等式**

$$\sum_{\ell=d}^{e-1}c_\ell\,\mathbb E\big[f(a\cdot b-a\cdot b_\ell)\big]=\delta\big(\mathbb E[f(a\cdot b)]-\mathbb Ef\,\mathbb ER_{\rm target}\big)+\rho_N(S,d),$$

$|R_{\rm target}|\le1$，误差 $|\rho_N(S,d)|\le C_{k,\eta}(p_N(S^+,e+1)+h_N(S))+C_{L,k,\eta}\varepsilon_{N,L,k}$（乘投影误差的 $f$ 即使相关也只花 $L^2$ 范数因 $|f|\le1$；末项含原恒等式误差除以 $J$、固定 $L$ 下趋零）。

*收尾归纳*：$\|f-a\cdot b\|_{L^2}\le2p_N(S,e)$；$\sum_{\ell=d}^{e-1}c_\ell\le1$；$a\cdot b_\ell$ 与 $a\cdot b$ 同边际律，左端成 $\frac12\sum c_\ell\mathbb E(a\cdot b-a\cdot b_\ell)^2\ge\frac12c_d\mathbb E(a\cdot b-a\cdot b_d)^2$（$c_d\ge\eta$）；右端 $|{\cdot}|\le2\delta+|\rho_N|$。于是

$$v_N(S,d)\le C_{k,\eta}\big(\delta+p_N(S,e)+p_N(S^+,e+1)+h_N(S)\big)+C_{L,k,\eta}\varepsilon_{N,L,k}.$$

子代协方差项的深度平均换算：对齐构造有 $D=b(S)+1$ 个相异坐标，$T_j$ 的项只用 $D_j=b(T_j)+1$ 个；平移项坐标 $\pi_j(\mathbf q)=(e+1,(q_v+1)_v)$，每个保留赋值至多 $L^{D-D_j}$ 个原像、坐标 $\eta/2$-regular；fiber 界

$$L^{-D}\sum_{\mathbf q}w_j(\pi_j(\mathbf q))^\gamma\le\big(L^{-D_j}\sum_{\mathbf y}w_j(\mathbf y)\big)^\gamma\quad(0<\gamma\le1)$$

——对齐副本用单副本估计，**没有"独立平均的一对副本被限制到对角线"的困难**。取 $\gamma=1/4$、$\limsup_N$：$V_{k,L}(\eta)\le C_{k,\eta}(L^{-1/2}+V_{k-1,L}(\eta/2)^{1/4})$，归纳得 $V_{k,L}(\eta)\to0$。

**(c) 机械理由**：$\eta$ 同时控制 (i) $c_d\ge\eta$（三副本下界的可除性）、(ii) $j\ge2$ 因子 $\ge\eta/2$（$J$ 的下界）、(iii) shifted 深度与旧深度的分离（charging 适用）；$1/4$ 与 $1/2$ 幂来自收缩界 $v^{1/4}$ 的两连用；$L^{-1/2}$ 来自 $h_N$ 的 $C/L$（平方后 $L^{-1}$ 再开方在 $V^{1/4}$ 里）。误差 $\varepsilon_{N,L,k}$ 乘 $C_{L,k,\eta}$：固定 $L$ 下误差先消失，"No rate of convergence in $N$ uniform in $L$ is used"。

**(d) 失败路线**：
- 不平移（用原深度）：目标分支顶点可落在旧树分支深度上，fresh 分裂不再被迫，绝对系数和不以 $\delta^b$ 衰减，除以 $J\sim\delta^{2b}$ 后爆炸 [推测：summary 卡点"division by products of small exponent gaps"的精确形态]。
- 精确 purity 断言（直接断言条件均值向量在严格指数跳跃内聚簇）：hidden Poisson–Dirichlet clustering 可在跳跃内保留非平凡 overlap 变化（summary 原文）——所以只能证三副本差平方的可除上界，不能证纯度 [推测]。
- 两副本若独立抽深度再求联合平均：regular 赋值上的联合质量 $\sim L^{-2b}$，除以 $J$ 后系数不匹配；对齐深度 + 相异顶点使每个 fresh 分裂各付各的 $\delta$、$J$ 的 $2b$ 个因子被 $2b$ 次创建精确吸收 [推测：summary"distinct new branching vertices are charged to distinct fresh divergences, including when their depths coincide"]。
- $\rho_N$ 中 $p_N$ 与 $f$ 相关（$f$ 是全 $2k$ 叶 overlap，含目标侧信息）：直接用 Cauchy–Schwarz 会双重计数；引理 (decor:contractions) 的条件独立收缩恰为此设计 [推测]。

### 2.13 decorrelation.tex §7.4：每个 multioverlap 的集中（Theorem 的证明 + marker anchor）

**(b) 机制**：单点用无加色的 spin-anchor 恒等式：$\mathbb ER_S^2=(\mathbb ER_S)^2+o_N(1)$。一般 $S$ 首分裂于 $e$、子形 $T_1,\ldots,T_s$：以 $S$ 为旧树、指定一叶为 **marker anchor**（$S_0=1$），加一份完整 $S$ 副本、全部叶在 $e-1$ 从锚分裂（首路径必须在 $e-1$ fresh，因旧树在该处未分支）。两侧扩展系数相同且非零：

$$C(S,e)=-\delta\,\kappa(S). \tag{decor:marker-coefficient}$$

目标与旧副本在 $\mathscr F_{e-1}$ 下条件独立同分布；$f=R_S$、$M=\mathbb E[R_S|\mathscr F_{e-1}]$ 时乘积条件期望 $M^2$；仅锚一侧删掉 marker 的 $e-1$ 之下延拓（概率核积分为 1）留下普通目标律、均值 $\mathbb ER_S$。恒等式给

$$C(S,e)\operatorname{Var}(M)=o_N(1),\qquad\text{故 } \operatorname{Var}(M)\to0\ \text{在每个固定 } L,S,e. \tag{decor:marker-variance-identity}$$

除以 $C(S,e)$ 只在固定 $L$ 做，不需要 $L\to\infty$ 的下界。再控前缀下条件方差：$G=\mathbf1\cdot\prod_j\mu_{e,T_j}$、$G_-=\mathbf1\cdot\prod_j\mu_{e-1,T_j}$（$\mathscr F_{e-1}$-可测）；$\mathbb E(R_S-G)^2\lep_N(S,e)^2$；乘积差 + 鞅能量给 $\mathcal A_{L,\eta}\mathbb E(G-G_-)^2\le C_k/L$（$e$ 本身是变化坐标，增量先求和再除 $L$）；条件期望是最优 $L^2$ 投影：$\mathbb E(R_S-M)^2\le\mathbb E(R_S-G_-)^2\le2p_N(S,e)^2+2\mathbb E(G-G_-)^2$。方差分解 + $p_N(S,e)^2\les\sum_jv_N(T_j,e)^{1/2}$ + fiber 界（$\gamma=1/2$）：

$$\limsup_N\mathcal A_{L,\eta}\operatorname{Var}(R_S)\le C_k\big(L^{-1}+V_{k-1,L}(\eta/2)^{1/2}\big)\quad(L\text{ 充分大}),$$

由条件去相关命题收尾。

**(c) 机械理由**：marker anchor 的作用是把"条件均值 $M$ 的方差"变成一个可直接代入规定树恒等式的量——anchor 侧删延拓即回到目标律，所以 $\mathbb EM^2-(\mathbb ER_S)^2$ 被恒等式"免费"给出；$e-1$（而非 $e$）分裂保证首路径 fresh、系数只有单个 $-\delta$；除法只在固定 $L$ 做是因为 $C(S,e)\sim\delta$，若要 $L$ 一致下界则需 $\kappa(S)$ 的一致控制（没有）。

**(d) 失败路线**：
- 把 marker 放在 $e$（而非 $e-1$）分裂：旧树已在 $e$ 分支，系数是 $m_e-\ldots$ 的组合，可能为零（$m_e=2m_{e+1}$ 型）或需多次 fresh 计费 [推测]。
- 想一步到位证明 $\operatorname{Var}(R_S)$ 小：条件方差部分（$e$ 之下）与条件均值部分（$e-1$ 之上）需要两个不同机制（归纳 + marker），单一恒等式不覆盖 [推测：summary"An exact purity claim also proves too strong"]。
- $\operatorname{Var}(M)\to0$ 只对固定 $L,e$ 成立，若在 (variance-estimate) 里提前换极限顺序会引入 $L$ 不一致 [推测]。

### 2.14 comparison.tex §8：独立层级消息与 cavity 比较

**(a) 编码引理（comp:encoding）**：固定 $N,L$、选定参数，reservoir 根无序平均后，存在确定性 trial 律 $\zeta_{L,N}\in\mathcal M_L$，其单标签自旋过程在每个规定树上的期望自旋乘积与均匀抽取的 reservoir 位点相同；不同标签可独立。

**(b) 机制**：根变量加一个独立均匀位点 $i$；沿倾斜 reservoir 辅助核抽样；深度 $r=L-1$ 处放 $x=\operatorname{arctanh}\langle\sigma_i\rangle$（有限：有限 $N$ 所有组态权重严格正，$|\langle\sigma_i\rangle|<1$），即 $x$ 在深度 $L$ 的终末自旋转移**之前**确定；每个终末副本叶以 $q_x$ 抽自旋——给定辅助前缀，这些自旋独立且恰有独立终末 Gibbs 副本的单点律。向后定义 $\eta_{r-1}=\operatorname{Law}(x|\mathscr G_{r-1})$，$\eta_d=\operatorname{Law}(\eta_{d+1}|\mathscr G_d)$；$\zeta_{L,N}=\operatorname{Law}(\eta_0)\in\mathcal M_L$（标准 Borel 保证可测版本；辅助先验在每个实现根上是有限 mark 空间有限积，也可条件于根计数直接验证）。对任意后代树 $T$、终端指定自旋 $e_a$：深度 $r$ 条件概率 $G_T(x)=\prod_aq_x(e_a)$；深度 $d<r$ 子树条件独立给向后递归 $G_T(\eta_d)=\prod_\ell\int G_{T_\ell}(\nu)\eta_d(d\nu)$，归纳得该概率只通过 $\eta_d$ 依赖前缀——嵌套测度保持每个后代树的联合输出律（含 unary 段与任意子数），恰是 (model:chain) 的分支版。于是对每个叶子集 $S$：$\mathbb E\prod_{a\in S}\tau^a=\frac1N\sum_i\mathbb E\prod_{a\in S}\sigma_i^a=\mathbb ER_S$。不同标签用整条构造的独立副本（含 reservoir 根与位点）。

**(c) 机械理由**：arctanh 磁化是"单点信息的最充分统计压缩"；编码必须发生在终末自旋转移之前，否则 $x$ 会依赖被比较的自旋实现；"在固定 $N$ 下编码、再让 $N$ 沿序列走"避免对 $\mathcal M_L$ 上任意测度做逼近。

**(a') 经验模式比较（comp:patterns）**：固定 $k$ 叶规定树，绝对值 $\le1$、依赖 $a$ 个独立均匀位点标签副本自旋模式的可观测，把这些模式换成 $a$ 个独立 trial 标签模式，期望值变化至多

$$a\sum_{\varnothing\ne S\subseteq[k]}\mathbb E|R_S-\mathbb ER_S|. \tag{comp:pattern-error}$$

可观测还可依赖与 reservoir 独立的新插入无序。

**(b') 机制**：条件于 reservoir 组态，均匀位点模式 $\boldsymbol\sigma_i$ 的经验分布 $\pi(\boldsymbol e)=\frac1N\sum_i\prod_b\frac{1+e_b\sigma_i^b}2=2^{-k}\sum_{S\subseteq[k]}R_S\prod_{b\in S}e_b$；trial 分布 $\bar\pi=\mathbb E\pi$（由单标签矩恒等式）；条件乘积抽样给 $\pi^{\otimes a}$ vs $\bar\pi^{\otimes a}$；乘积测度 TV 望远镜界 $\|\pi^{\otimes a}-\bar\pi^{\otimes a}\|_{\rm TV}\lea\|\pi-\bar\pi\|_{\rm TV}\le\frac a2\sum_{S\ne\varnothing}|R_S-\mathbb ER_S|$；有界函数积分至多花两倍 TV；再对独立插入无序条件化。

**形状误差**：由 decorrelation 定理导出（$Q_k$ 树律、固定 $k$）

$$\lim_{L\to\infty}\limsup_{N\to\infty}\mathbb E_{Q_k}\sum_{\varnothing\ne S\subseteq[k]}\mathbb E|R_S-\mathbb ER_S|=0. \tag{comp:shape-error}$$

证明：$\mathfrak S_k$ = $[k]$ 非空子集上带标号拓扑的有限族；

$$\mathbb E_{Q_k}\sum_S\mathbb E|R_S-\mathbb ER_S|\le C_k\Big(\eta+L^{-1}+\sum_{U\in\mathfrak S_k}\big(\mathcal A_{L,\eta}\operatorname{Var}(R_U)\big)^{1/2}\Big),$$

非 regular 树概率 $\le C_k(\eta+L^{-1})$；regular 树上诱导子树保留内部与分离条件；$a'$ 个分支顶点的子树深度赋值至多 $L^{a-a'}$ 个延拓，求和消去未用坐标后恰剩 $\mathcal A_{L,\eta}$ 归一化；Cauchy–Schwarz 把 MAD 平均换成 $\operatorname{Var}^{1/2}$；先固定 $\eta$ 按序取极限、再 $\eta\downarrow0$。

**(a''') 插入比较（comp:insertion-comparison）**：对 comp:encoding 的 trial 律、$\mathbf m^{(L)}=(1/L,\ldots,(L-1)/L)$：

$$\lim_{L\to\infty}\limsup_{N\to\infty}\big|\Delta_N^{L,\mathbf u_{L,N}}-\mathcal B_{L-1}(\zeta_{L,N},\mathbf m^{(L)})\big|=0.$$

**(b''') 机制**：把 cavity:increment 两处插入中 reservoir 自旋换成独立 trial 自旋过程，得 $\widetilde A_{\rm s},\widetilde A_{\rm b}$ 与其递归 $\widetilde Y_{0,\rm s},\widetilde Y_{0,\rm b}$。终末自旋转移处对独立 trial 自旋平均：$\widetilde A_{\rm s}\mapsto V_{\rm s}$，故 $\widetilde Y_{0,\rm s}=T_0V_{\rm s}$；$\widetilde A_{\rm b}$ 的同一步给 $K_{\rm b}$ 个不相交消息标签的 edge 因子乘积，条件于物理无序与各深度消息前缀这些标签组保持独立，乘积逐层（从最后一级到第一级）穿过条件幂平均，故 $\mathbb E\log\widetilde Y_{0,\rm b}=\alpha(p-1)\mathbb E\log T_0V_{\rm e}$、$\log2+\mathbb E\log\widetilde Y_{0,\rm s}-\mathbb E\log\widetilde Y_{0,\rm b}=\mathcal B_{L-1}(\zeta_{L,N},\mathbf m^{(L)})$。剩 reservoir vs trial 插入对数比较：截断 $K\le M$；$C=H+BM$、$z=\cosh C$、$c=\tanh C<1$，两侧插入都可写 $A=z(1+D)$、$|D|\le c$、$\log z$ 在比较中相消。阶 $k$ 处 $D$ 的 $k$ 乘积是至多 $pM$ 个标签自旋模式与独立插入无序的有界函数，comp:patterns 给固定树误差 $\lepM\sum_S\mathbb E|R_S-\mathbb ER_S|$，comp:shape-error 使树平均误差在规定极限序下趋零；截断 $q$ 项后双侧余项 $\le\sum_{k>q}c^k/k$ 一致；计数截断外两侧插入对数 $\le H+BK$、期望贡献 $\le2\mathbb E[(H+BK)\mathbf 1_{K>M}]\to0$。极限序：先 $M$（Poisson 尾）、再 $q$（几何尾）、再 $N,L$（有限剩余项）。

**Corollary（comp:bounded-lower）**：有界置换不变交互律 + 有界场：$\liminf_NF_N\ge\inf_{r\ge0}\Phi_r$。机制：$A=\inf_r\Phi_r$ 有限（trial 界）；每个编码 trial 值 $\ge A$，故每个固定 $L$：$A\le\underline F+2\varepsilon+\limsup_N|\Delta_N-\mathcal B_{L-1}|$；$L\to\infty$ 后 $\varepsilon\downarrow0$。

**(c) 机械理由**：$\mathbf m^{(L)}$ 是均匀网格——与 trees/decorrelation 全部 $m_d=d/L$ 计算一致；edge 项因子化通过幂平均是因为"不相交标签组在给定前缀下条件独立"恰好是幂平均链的条件结构；$c=\tanh C<1$ 保证对数展开的几何收敛域；$\underline F$ 取"全体尺寸"的 liminf（非沿序列），因为 (i) 的选择靠平均增量 telescope。

**(d) 失败路线**：
- 用 reservoir 的根分布（含位点）做 trial 律而不换独立副本：trial 消息与 reservoir 组态相关，"不同标签独立"失败，插入比较失去独立性框架 [推测：对应 summary 的多位点 cavity 困境的另一面]。
- 不截断 Poisson 计数直接展开：$|D|\le c$ 需要一致 $B$ 界于 $K$ 上，$K$ 无界时对数展开域破裂；先 $M$ 后 $q$ 的顺序不可换 [推测]。
- trial 律 $\zeta_{L,N}$ 依赖 $N$：corollary 里 "$\inf_{\zeta,\mathbf m}$" 的 trial 值是每个 $N$ 的合法选择，无问题；但若试图把 $\zeta_{L,N}$ 换成其 $N\to\infty$ 极限律，$\mathcal M_L$ 上紧性需要额外论证且无必要 [推测]。

### 2.15 reduction.tex §9：稳定性、平移与截断（Lemma reduction:stability + 主定理证明）

**(a) 稳定性引理**：耦合 $(\theta,h),(\theta,h')$，各满足 (integrability)，$D=\mathbb E\max_s|\theta(s)-\theta'(s)|$、$d=\mathbb E|h-h'|$。则

$$|F_N-F_N'|\le\alpha D+d,\qquad|\mathcal B_r(\zeta,\mathbf m)-\mathcal B_r'(\zeta,\mathbf m)|\le\alpha(2p-1)D+d$$

对 $N,r$ 与一切 trial 律（含 $r=0$）一致。若 $c$ 是某交互的可积随机常数、$\widehat\theta=\theta-c$，则 $\widehat F_N=F_N-\alpha\mathbb Ec$，$\widehat{\mathcal B}_r=\mathcal B_r-\alpha\mathbb Ec$。

**(b) 机制**：两 Hamiltonian 用相同计数与指标；逐点 log 权差 $\le$ 交互 sup-范差和 + 场差；配分函数 log 保持该界（自由能稳定性）。每个 cavity 交互改 $\le$ 相应 sup-范差，edge 对数同；幂平均保持根可测界；site 项均值 $\alpha p$、edge 项系数 $\alpha(p-1)$，故 trial 差 $\le\alpha(p+p-1)D+d=\alpha(2p-1)D+d$。平移：物理常数从自旋配分函数与每个幂平均中提出；泛函中 site 项移 $-\alpha p\mathbb Ec$、edge 项 $+\alpha(p-1)\mathbb Ec$，净移 $-\alpha\mathbb Ec$。

**主定理证明**：$a$ 可能非对称依赖带标号输入函数，原交互律未必置换不变。取 $c=\theta(1,\ldots,1)$、$\widehat\theta=\theta-c$（$|c|\le B(\theta)$ 可积）；因子化给

$$\widehat\theta(s)=\log\frac{1+b\prod_\ell f_\ell(s_\ell)}{1+b\prod_\ell f_\ell(1)},$$

$a$ 消失；$f_\ell$ 独立同分布且与 $b$ 独立 $\Rightarrow$ $\widehat\theta$ 律置换不变；$\mathbb EB(\widehat\theta)\le2\mathbb EB(\theta)<\infty$。截断 $\widehat\theta^{(K)}\in[-K,K]^{\{-1,1\}^p}$、$h^{(K)}\in[-K,K]$（保持置换不变）。有界版下界 comp:bounded-lower 适用（截断不必保持因子化）；支配收敛给 $D_K,d_K\to0$；trial 泛函的一致估计给 $|\widehat I-I_K|\le\alpha(2p-1)D_K+d_K$（$\widehat I,I_K$ 为归一化后 infimum）；于是 $\liminf_N\widehat F_N\ge I_K-\alpha D_K-d_K\ge\widehat I-2\alpha pD_K-2d_K$；$K\to\infty$ 得 $\liminf_N\widehat F_N\ge\widehat I=\inf_r\widehat\Phi_r$；撤销平移；upper:bound 给 $\limsup_NF_N\le\inf_r\Phi_r$；两极限相等。

**(c) 机械理由**：$\alpha(2p-1)$ 来自 site ($\alpha p$) + edge ($\alpha(p-1)$) 两侧交互计数；$\widehat\theta$ 的置换不变性靠"对数比消去 $a$ 后只剩 $f_\ell$ 的对称结构"，这正是选择 $c=\theta(1,\ldots,1)$ 而非别的常数的原因（分母在 $s=(1,\ldots,1)$ 处归一）；截断的下界使用"不必保持因子化"——因为下界根本不用因子化，这是上下界分工在缝合步骤的直接红利。

**(d) 失败路线**：
- 若先截断再消 $a$：截断后的 $\widehat\theta^{(K)}$ 一般不再是 (log 比) 形式、失去置换不变性，有界下界的前提破缺 [推测]。
- 若 $c$ 不可积（试图用别的参考点）：$F_N$ 与 $\mathcal B_r$ 的平移不等式都要求 $\mathbb E|c|<\infty$ [推测]。
- trial 侧稳定性若不"一致于一切 trial 律"：$I_K$ 与 $\widehat I$ 的比较会对 infimum 与逼近次序敏感 [推测]。
## 三、summary 时间线（5 页逐段，失败路线卡点 → 救活观察 → 引理映射）

summary 结构为三节 + 提示词引文；每节内的推理段落逐条整理。引号内为 summary 原文。

### 第 1 页（提示词 + §1 "From structural obstacles to marked hierarchies"）

**起点：上下界之差**。推理从 PT 插值上界与想要的下界之间的缺口开始。Panchenko 有限 RSB 分析提供自旋分布识别的模型，但 pair-overlap 超度量性不决定稀释系统需要的 multioverlap（→ 论文 introduction"多副本自旋模式的概率依赖子集乘积，multioverlap 才是信息载体"）。

**失败路线 1：找反例**。"Initial checks look for a counterexample in the assumptions: a nonintegrable factorization constant, asymmetric fields, interactions close to the positivity boundary, or messages tending to infinity. **None yields one.**" 常数相互作用反而成为归一化检验。→ 映射：upper:bound 的退化情形处理（$b=0$ 时 $F_N=\mathcal B_r=\log2+\mathbb E\log\cosh h+\alpha\mathbb Ec$，正是归一化检验）与 "$a$ 无可积性也不构成反例" 的结论（upper 归一化技巧消去 $a$）。

**失败路线 2：多位点 cavity 共享随机性**。"A many-site cavity argument appears promising: condition on randomness shared by all sites in a hierarchical representation, then seek independent site messages. The difficulty is that this shared randomness can adapt to the sampled sites. A pointwise law of large numbers gives no uniform comparison, and pinning may select states with the wrong weights." 随后原文卡点：

> "Aha recursive structure: overfitting shared variable can simulate original model at smaller scale."

→ 救活：放弃对共享随机性做条件化；改为 reservoir 方案——物理无序全程 quenched、只有消息被独立化（cavity.tex §5 "Until reduction, assume… Neither the factorization nor the positivity assumption is used in the lower bound"），以及最终 comp:encoding 的单点编码（每个标签独立复制整条构造，含 reservoir 根与均匀位点）。

**文献触发**：enriched Gaussian fields（Mourrat–Panchenko）与 Hamilton–Jacobi 观点（Mourrat）暗示辅助层级；Barbier–Panchenko 的 multioverlap 恒等式提示 Poisson 扰动。"The Bayesian setting does not transfer automatically: posterior-sampled observations and fractionally weighted observations have different laws."（失败路线 3：Bayesian 设置迁移）→ 救活：自建扰动族 $\psi_\nu=1+t_\nug\sigma_i+u_\nug_0S_0$，$t$（探测 Taylor）与 $u$（求导集中）角色分离（pert:parameters 的机械理由）。

**转向幂平均与标记扰动**："The investigation therefore works directly with iterated power means and their tilted path transitions. A marked perturbation can specify where replicas branch; expanding the change of density gives signed coefficients for extending an old replica tree. For two replicas, the resulting identity suggests approximate invariance under replacing a child when adjacent exponents are close."

**失败路线 4：高阶乘积系数交错**。"Higher products are harder: their coefficients alternate in sign, dummy anchors cancel, and conditional projections cannot simply be inserted as arbitrary test functions."

**失败路线 5：小指数间隙除法**。"The target becomes conditional decorrelation of sitewise product vectors, followed by concentration of ordinary multioverlaps. Fresh subtrees isolate useful conditional moments, but recovering a whole prescribed shape requires division by products of small exponent gaps. Coarse partitions and equal-exponent refinements repeatedly encounter the same problem: available continuity errors are too large after that division." → 这是贯穿到第 2 页的核心卡点；救活在"深度平移"（见下）与 trees:charging 的相对界 (tree:relative-charging)：$1/|J|\sum|c_E|\le C_{q,k,\eta}$，$J$ 的 $j=1$ 因子 $=\delta$ 与 fresh 分裂的 $\delta$ 精确配平。

### 第 2 页（§2 "Shifting branching depths"）

**失败路线 6：更多 pinning 尝试**。"Further pinning attempts fail to reconcile their observation law with the cavity comparison."

**失败路线 7：精确 purity 断言太强**。"An exact purity claim also proves too strong: hidden Poisson–Dirichlet clustering inside a strict exponent jump can retain nontrivial overlap variation." → 救活：只证三副本平方协方差可除上界（decor:contractions + decor:three-copy-bound），不证纯度。

**失败路线 8：阶乘多项式展开不够**。"Factorial-polynomial expansions and a cancellation using two copies expose squared covariance terms, but do not yet turn the signed identities into the desired ordinary covariance estimate." → 救活：带号恒等式 + 三副本界组合（decor:conditional-concentration 的收尾归纳）。

**转折：深度平移**（本页核心观察）：

> "The change is to shift every internal branching depth of the target tree by one level. These shifted splits avoid the old tree's branching depths. Each new branching vertex must then pay a small fresh-divergence factor, matching the small factor in the prescribed shape's normalization."

即：目标树每个内部分支深度 +1 → shifted 分裂避开旧树所有分支深度 → 每个新分支顶点付 fresh-divergence 小因子 $\delta$，与指定形状归一化系数（$\kappa(S^+)$ 中 $j=1$ 因子 $-\delta$）匹配。紧接着的卡点与救活：

> "Great! Need carefully prove average error little with shifted depths not rare"

→ "average error little"：martingale energy $\sum_t\mathbb E\|\mu_{t+1,T}-\mu_{t,T}\|^2\le1$ 除以 $L$（decor:depth-continuity）；"not rare"：$Q_k$ 下 regular 树概率 $\ge1-C_k(\eta+L^{-1})$（tree:regular-shapes）+ 规定拓扑+深度赋值概率 $\le C_kL^{-a}$（把深度平均换算成 $Q_k$ 贡献，tree:averaging-remark）。

**归纳设计**："The proposed induction replaces proper descendant groups by conditional mean vectors. An anchor identity supplies a positive weighted sum of squared replacement differences; bounded martingale increments control the one-level shifts after averaging over depths. A separate marker anchor introduces a fresh copy before the original first split, converting conditional decorrelation into ordinary shape-wise multioverlap concentration. The order of limits matters: errors in fixed-depth identities disappear before the hierarchy is refined." → 映射：decor:projection-bound（子代换条件均值）、decor:contractions (i)（锚恒等式给正权和）、decor:marker-variance-identity（marker anchor）、remark decor:order-of-limits（极限次序）。

**上界一侧与下界一侧的收束**："The power-mean expansion is organized directly by adding paths. Its logarithmic coefficient magnitudes telescope, yielding a geometric remainder estimate after rescaling a bounded positive insertion."（tree:log-expansion + tree:telescoping）"On the upper-bound side, normalization by the interaction at the all-plus configuration avoids demanding separate integrability of the factorization constant."（upper 归一化 $c=\theta(1,\ldots,1)$）"The sign calculation reduces to the even-power convexity remainder $A^p-pAB^{p-1}+(p-1)B^p\ge0$."（upper:remainder）"For the lower bound, sublinear marked Poisson perturbations yield identities while a diagonal selection retains low cavity increments. Polarization isolates prescribed branching patterns."（pert:selection + pert:tree-identity 极化）"Finally, a uniformly sampled site's leaf magnetization defines trial messages through its inverse hyperbolic tangent and successive conditional laws. Empirical spin-pattern probabilities are combinations of multioverlaps; concentration allows their replacement by the probabilities of independent trial labels. Exceptional tree shapes, large insertion counts, and series tails are removed in sequence."（comp:encoding 的 arctanh、comp:patterns 的经验分布展开、比较证明的 $M\to q\to N,L$ 消尾次序）

### 第 3 页（§3 "Checking the identities and closing the comparison"）

**检查 1：锚已属旧树时目标子树的分布**。"The final stage returns repeatedly to whether a target subtree remains correctly distributed when its anchor already belongs to an old tree. Marginalizing the unused paths preserves the prescribed independent transitions. This permits conditional covariance estimates even when the observable being tested is correlated with the extension." → 映射：decorrelation 带号扩展求和中"保留旧路径 + 首条目标-II 前缀、删除其余新枝"的类内边际固定论证；comp:patterns 末句"可观测还可依赖独立插入无序"。

**检查 2：系数计算**。"The coefficient calculation is checked at two levels and reorganized as a positive squared-difference identity. Distinct new branching vertices are charged to distinct fresh divergences, including when their depths coincide. This is the point of the shift: after normalization, the absolute coefficient bounds remain controlled." → 映射：tree:reference-total（单步和 $m_d-jm_{d+1}$、与颜色顺序无关）与 tree:charging（分配计数 $k!/(k-b)!$、指定步保持相异）；"positive squared-difference identity" = decor:singleton-identity / 归纳恒等式左端 $\frac12\sum c_\ell\mathbb E(\cdot-\cdot)^2$。

**检查 3：unary 段误差**。"Along unary stretches, bounded vector martingales have bounded total squared increments, so the averaged error from moving a depth by one tends to zero." → decor:martingale-energy + depth-continuity。

**检查 4：扰动参数是否偷换背景测度**。"Another concern is whether varying the small insertion parameter silently changes the background measure. The calculation instead treats each value as a hypothetical extra factor in the same fixed background. Poisson removal supplies that background, cancellation removes the anchor factor, and uniform analytic estimates permit coefficient extraction. Polarized marks then select the required tree constraints." → pert:palm（Poisson add-one：除以均值后剩余计数仍 Poisson、"no type has been deleted from the law of the base reservoir"）+ pert:analytic（$H_N$ 对所有 $j$ 相同）+ tree:extension-expansion。

**检查 5：两个核心归纳联检**。"The conditional-decorrelation induction and the marker-anchor variance argument are checked together. Proper child groups are replaced by conditional means, and the resulting three-copy estimate controls the normalized squared conditional covariance. Ordinary multioverlap concentration follows by comparing a fresh copy with the original shape. In the cavity comparison, fresh uniformly sampled sites give empirical pattern masses; the trial hierarchy uses their expectations. Finite cutoffs leave only finitely many such comparisons, while nonregular shapes and analytic tails contribute vanishing errors." → decor:conditional-concentration + decor:overlap-concentration 证明的合并；comp:encoding/comp:patterns；pert:selection(iii) 的对角化（finite cutoffs）+ tree:regular-shapes（nonregular）+ pert:analytic 尾（analytic tails）。

**收尾**："To return from bounded disorder to the stated first-moment assumptions, the construction subtracts the all-plus interaction value and truncates the normalized interaction and field. Uniform free-energy and trial-functional error bounds allow the truncations to be removed. The final response claims that the resulting lower comparison matches the interpolation upper bound, giving the existence of the limit and the infimum over finite hierarchies." → reduction:stability + 主定理证明（$c=\theta(1,\ldots,1)$ 平移 + $[-K,K]$ 截断 + $2\alpha pD_K+2d_K\to0$）。

### 失败路线总表（summary 卡点 → 引理级救活）

| # | 卡点（summary 原文要点） | 救活观察 | 对应引理 |
|---|---|---|---|
| 1 | 反例搜寻（不可积 $a$、非对称场、正性边界、消息发散）"None yields one" | 常数交互=归一化检验；$a$ 被减法+正则化消去 | upper:bound 退化情形、归一化段 |
| 2 | 多位点 cavity 共享随机性可"过拟合" | reservoir 无序 quenched、只独立化消息；单点编码 | cavity:increment、comp:encoding |
| 3 | Bayesian 设置不迁移（后验抽样 vs 分数加权观测律不同） | 自建 $t/u$ 双参数扰动族 | pert:parameters、pert:concentration |
| 4 | 高阶乘积系数交错、dummy anchor 相消 | 混合导数极化 + 保护叶扩展规则 | tree:extension-expansion、pert:tree-identity |
| 5 | 恢复整形状需除以小指数间隙乘积，除后误差过大 | 深度平移：$j=1$ 因子 $\delta$ 与 fresh 分裂 $\delta$ 精确配平 | tree:charging、decor:relative-absolute-cost |
| 6 | pinning 观测律与 cavity 比较不相容 | marker anchor 在 $e-1$ fresh 分裂 | decor:marker-variance-identity |
| 7 | 精确 purity 太强（strict exponent jump 内隐藏聚簇） | 只证三副本平方协方差可除上界 | decor:contractions、decor:three-copy-bound |
| 8 | 两副本带号恒等式 → 普通协方差估计不通 | 带号和吸收进归纳恒等式、右端剩 $\delta(\cdot)$ | decor:induction-identity |
| 9 | "average error little with shifted depths not rare" 未证 | 鞅能量 $C/L$ + $Q_k$ regular 性/赋值概率 | decor:depth-continuity、tree:regular-shapes |
| 10 | 扰动参数可能偷换背景测度 | Poisson removal 供背景、$H_N$ 与 $j$ 无关 | pert:palm、pert:analytic |
## 四、常数与参数表

### 4.1 模型与泛函参数

| 符号 | 定义/取值 | 出处 | 机械理由 |
|---|---|---|---|
| $p$ | 偶整数 $\ge2$ | model | 偶性 $\Rightarrow x^p$ 凸、$\mathbb E[(-b)^n]\ge0$ 生效；排除 3-SAT |
| $\alpha$ | 交互密度，$M_N\sim\mathrm{Pois}(\alpha N)$ | model | site 项均值 $\alpha p$、edge 修正 $\alpha(p-1)$ |
| $B=B(\theta)$ | $\max_s\lvert\theta(s)\rvert$ | model | 一切插入增量的逐点界 |
| $H$ | $\lvert h\rvert\le H$（下界阶段） | cavity | site 插入界 $H+BK_{\rm s}$ |
| $\rho_N$ | $\alpha(N+1)\big(\frac{N}{N+1}\big)^p$ | cavity:reservoir-mean | $(N+1)$ 系统中不含新位点交互的均值；$\alpha N-\rho_N=\alpha(p-1)+O(N^{-1})$ |
| $K_{\rm s},K_{\rm b}$ | $\mathrm{Pois}(\alpha p)$、$\mathrm{Pois}(\alpha(p-1))$ | cavity | site 插入与 bond 修正的计数 |
| $q_x(s)$ | $e^{xs}/(2\cosh x)$ | model | 单点消息的自旋律；trial 终末转移的核 |
| $x$（编码） | $\operatorname{arctanh}\langle\sigma_i\rangle$ | comp:encoding | 叶磁化的充分统计量；有限 $N$ 严格 $\in(-1,1)$ |

### 4.2 树演算与网格

| 符号 | 定义/取值 | 出处 | 机械理由 |
|---|---|---|---|
| $L$ | $\ge2$；$r=L-1$ 辅助层级 | cavity | 深度 $L$ 载 Gibbs 自旋组态；$L$ 先固定、误差消失后才增大 |
| $m_d$ | $d/L$（$0\le d\le L$），$\delta=1/L$ | cavity:grid | 均匀网格：fresh unary 分裂系数恰 $-\delta$、$Q_2$ 分裂深度一致分布 |
| $\gamma_\beta$ | $m_{d_\beta}-n_\betam_{d_\beta+1}$ | tree:density | 内部顶点树密度指数：入边 $+m_d$、出边 $-n_\betam_{d+1}$ |
| telescope | $\sum_\beta(n_\betam_{d+1}-m_{d_\beta})=n$ | tree:telescoping | $Q_k$ 归一化；fresh 总绝对系数 $=s$（$s$ 叶时） |
| $Q_k$ | 树律：$n$ 叶时以 $\frac{n_\betam_{d+1}-m_{d_\beta}}{n}$ 选顶点生 fresh child | tree:Q-rule | 对数展开系数的组合规范化 |
| 单步和 | $m_d-jm_{d+1}$ | tree:one-reference-total | 排除 $j$ 个含参考的子树后的带号总系数 |
| $\kappa(S)$ | $\prod_{v\in\mathrm{Br}(S)}\prod_{j=1}^{a_v-1}(m_{d_v}-jm_{d_v+1})$ | tree:K | 指定参考树的总扩展系数；$j=1$ 因子 $=-\delta$（网格上） |
| charging | $\sum_E\lvert c_E\rvert\le C_{q,k}\delta^b$；$\frac1{\lvert J\rvert}\sum_E\lvert c_E\rvert\le C_{q,k,\eta}$ | tree:charging | $b$ 个指定顶点各付 fresh unary $\delta$；$j\ge2$ 因子 $\ge\eta$ |
| regular | 分支深度$/L\in(\eta,1-\eta)$、两两差 $>\eta$ | tree:regular-shapes | 禁区计数 $C_k(\eta L+1)$；$Q_k\{$非 regular$\}\le C_k(\eta+L^{-1})$；赋值概率 $\le C_kL^{-a}$ |
| $\mathcal A_{L,\eta}$ | $L^{-a}\sum_{\mathbf q\ \eta\text{-reg}}$（未归一化） | decor:average-definition | 总质量 $\le1$；$\mathcal A(z^\gamma)\le(\mathcal Az)^\gamma$ |
| $\varepsilon_{N,L,k}$ | 有限树族上恒等式误差最大值，$\to0$（固定 $L,k$） | decor:identity-error | 乘它的常数可依赖 $L$；固定深度误差先消失 |

### 4.3 扰动族

| 符号 | 定义/取值 | 出处 | 机械理由 |
|---|---|---|---|
| $s_N$ | $N^{3/4}$ | cavity | 亚线性（扰动代价 $(\log2)s_N=o(N)$）且 $\lambda_\nu=c_\nu s_N\to\infty$ 足够快 |
| $\psi_\nu$ | $1+t_\nug\sigma_i+u_\nug_{0,q}S_{0}\in(1/2,3/2)$ | pert:factor | 逐点比较、$\log$ 变化 $\le\log2$；解析域 |
| $t_\nu$ | $j^{-1}$（$j\ge4$） | pert:parameters | 探测 Taylor 展开；$j\ge4$ 进入解析域 |
| $u_\nu$ | 在 $I_\nu=[j^{-j},2j^{-j}]$ 均匀 | pert:parameters | 求导参数；$j^{-j}$ 超多项式衰减压过任何 $j^{-q}$ 首系数 |
| $c_\nu$ | $>0$、$\sum_\nu c_\nu=1$ | pert | 各类型计数均值；$1/(c_\nu s_N)$ 是 Palm 归一化 |
| $\pi$ | $\prod_\nu\mathrm{Unif}(I_\nu)$ | pert | 选**确定性**参数向量；非 quenched |
| score $D_\nu$ | $\sum_q\frac{g_{0,q}S_{0,q}}{\psi_{\nu,q}}$ | pert:score | $\partial_u\log$；$0\ge\partial_uD_\nu\ge-4n$ |
| 热方差界 | $\big(\frac{4(1+\lvert I_\nu\rvert)}{m_1\lvert I_\nu\rvert\lambda_\nu}\big)^{1/2}$ | pert:thermal-bound | $X_0''\gem_1\mathrm{Var}(D_\nu\mid\mathscr F_0)-4n$ 积分 |
| 根方差界 | $\mathrm{Var}(G(u))\le C_\nu N$（Efron–Stein） | pert:root-variance | 重抽单项改有界量；Poisson Lipschitz 方差 |
| 差商半径 | $\rho=N^{-1/8}$ | pert:convex-bound | $(\frac{\sqrt N}{\rho}+\frac{\rho\lambda_\nu}{\lvert I_\nu\rvert})/\lambda_\nu\to0$ 的可行选择 |
| $G(u)$ | $X_0(u)+2nu^2$ | pert | 凸化（吸收 $\partial_uD_\nu\le0$ 项） |

### 4.4 去相关与比较

| 符号 | 定义/取值 | 出处 | 机械理由 |
|---|---|---|---|
| $A_S,\mu_{d,S}$ | 逐点自旋乘积向量、条件均值 | decor | 收缩与投影的载体 |
| $v_N(S,d)$ | $N^{-2}\mathbb E\sum_{ij}\mathrm{Cov}(A_{S,i},A_{S,j}\mid\mathscr F_d)^2\in[0,1]$ | decor:covariance | 归纳对象：可上控（收缩 $v^{1/4}$）可下界（三副本） |
| 收缩 | $\lVert(A_S-\mu)\cdot B\rVert_{L^2}\lev^{1/4}$ | decor:contraction-bound | $B\in[-1,1]^N$ 条件独立 |
| 三副本 | $\mathbb E(X\cdot Y-X\cdot Z)^2\ge\frac2{N^2}\mathbb E\sum C_{ij}^2$ | decor:three-copy-bound | $C\succeq0$，$\mathrm{tr}((C+\mu\mu^{\mathsf T})C)\ge\mathrm{tr}(C^2)$ |
| 鞅能量 | $\sum_t\mathbb E\lVert\mu_{t+1,T}-\mu_{t,T}\rVert_N^2\le1$ | decor:martingale-energy | 深度平移误差 $C/L$ 的来源 |
| $c_d,c_\ell$ | $c_d=2m_{d+1}-m_d=(d+2)\delta$、$c_\ell=\delta$（$\ell>d$） | decor:c-weights | 单叶情形的扩展系数；$c_d\ge\eta$（regular）供可除性 |
| $J$ | $\kappa(S^+)^2$，$\lvert J\rvert\ge c_{k,\eta}\delta^{2b}$ | decor:J-definition | 两份对齐副本 $\Rightarrow$ $2b$ 个 $j=1$ 因子；除后误差受控 |
| $p_N(S,e)$ | $\sum_jv_N(T_j,e)^{1/4}$ | decor:projection-definition | 子代替换的累计 $L^2$ 误差 |
| $h_N(S)$ | 平移比较的 $L^2$ 距离和（尺寸依赖常数） | decor:projection-shift-error | $\mathcal A h_N^2\le C_k/L$ |
| marker 系数 | $C(S,e)=-\delta\kappa(S)$ | decor:marker-coefficient | 仅锚侧删延拓回到目标律 |
| 归纳递归 | $V_{k,L}(\eta)\le C_{k,\eta}(L^{-1/2}+V_{k-1,L}(\eta/2)^{1/4})$ | decor:induction-recursion | $\gamma=1/4$ fiber 界 |
| 方差估计 | $\limsup_N\mathcal A\operatorname{Var}(R_S)\le C_k(L^{-1}+V_{k-1,L}(\eta/2)^{1/2})$ | decor:variance-estimate | $\gamma=1/2$ fiber 界 |
| TV 误差 | $a\sum_{S\ne\varnothing}\mathbb E\lvert R_S-\mathbb ER_S\rvert$ | comp:pattern-error | 乘积测度望远镜界 |
| 比较截断 | $K\le M$；$C=H+BM$、$z=\cosh C$、$c=\tanh C<1$ | comp | $A=z(1+D)$、$\lvert D\rvert\lec$；几何尾 $\sum_{k>q}c^k/k$；Poisson 尾 $2\mathbb E[(H+BK)\mathbf 1_{K>M}]$ |
| $\mathbf m^{(L)}$ | $(1/L,\ldots,(L-1)/L)$ | comp:insertion-comparison | 与全部 $m_d=d/L$ 计算一致 |

### 4.5 缝合与误差预算

| 符号 | 定义/取值 | 出处 | 机械理由 |
|---|---|---|---|
| $\alpha D+d$ | $\lvert F_N-F_N'\rvert$ 界 | reduction:free-stability | 同计数耦合 |
| $\alpha(2p-1)D+d$ | trial 泛函差界 | reduction:trial-stability | site $\alpha p$ + edge $\alpha(p-1)$ |
| $c=\theta(1,\ldots,1)$ | 平移常数；$\widehat\theta=\theta-c$ | reduction | 消去 $a$；$\widehat F_N=F_N-\alpha\mathbb Ec$ |
| $K$（截断） | $\widehat\theta^{(K)},h^{(K)}\in[-K,K]$ | reduction | $D_K,d_K\to0$；最终误差 $2\alpha pD_K+2d_K$ |
| $(\log2)s_N$ | 扰动对压强代价 | cavity:negligible | $o(N)$ |
| $O(N^{-1/4})$ | reservoir 耦合失配期望 | cavity | $\lvert s_{N+1}-s_N\rvert+2s_{N+1}/(N+1)$ |
| $2B(\theta)$ | 正则化增量绝对值界 | upper:regularization | $(1+\lambda D)/(1+\lambda D_*)$ 凸组合夹在 $e^{\pm2B}$ |
| $\lvert J\rvert\ge\delta^b\eta^{\sum_v(a_v-2)}$ | charging 相对版 | tree:charging | $j\ge2$ 因子下界 |
| 零温窗 | $[g,\,g+\log2/\beta]$ | models:ground | $2^N$ 组态夹逼 |
| $\underline F+2\varepsilon$ | 选中增量上界 | pert:selection (i) | 坏参数集质量 $q_j\le j^{-2}$ 吸收 $Cq_j$ |

---

*素材完。*（合计约 17,500 字；源文件见文件头路径。）
