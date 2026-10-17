# Vlasov–Maxwell 全局经典解 —— 第一人称研究思维链复盘素材（证明重构级）

> 素材来源：
> - 思维 summary：`E:\math\reasoning_traces\relativistic-vlasov-maxwell.pdf`（OpenAI，6 页）
> - 论文 tex 源码：`E:\math\preprints\Global-classical-solutions-of-the-three-dimensional-relativistic-Vlasov-Maxwell-system-September-23-2026\build\`（main.tex + sections/ 共 11 个文件，3524 行）
> - Lean 形式化：`E:\math\lean\OAI\Analysis\VlasovMaxwell\`（207 文件、9 个子目录、约 9 万行）+ `E:\math\lean\ComparatorChallenges\VlasovMaxwell.json`

---

## 一、定理总览

### 1.1 问题

3+3 维单物种相对论 Vlasov–Maxwell（RVM）系统，无量纲归一化。记

- $q(v)=\sqrt{1+|v|^2}$（能量/速度模），$\hat v = u(v)=v/q(v)$；
- $\rho_f=\int f\,dv$，$j_f=\int u(v) f\,dv$。

方程组（论文 eq:rvm）：

$$\partial_t f+u\cdot\nabla_x f+(E+u\times B)\cdot\nabla_v f=0$$
$$\partial_t E-\nabla\times B=-j_f,\qquad \partial_t B+\nabla\times E=0$$
$$\nabla\cdot E=\rho_f,\qquad\nabla\cdot B=0$$

**光滑容许初值**（eq:data）：$f_0\in C_c^\infty(\R^3_x\times\R^3_v)$、$f_0\ge0$；$E_0,B_0\in C_b^\infty\cap L^2$（各阶空间导数有界，场本身平方可积，允许非零总电荷及其 Coulomb 尾）；Gauss 约束 $\nabla\cdot E_0=\rho_{f_0}$、$\nabla\cdot B_0=0$。无任何大小或对称性限制。

**主定理（thm:global）**：每 组光滑容许初值生成唯一全局经典解；任意有限 $T$ 上 $f,E,B\in C^\infty$，$f$ 相空间支撑紧；两个散度约束对全部时间成立。

### 1.2 已有结果版图（introduction.tex §Historical context）

- **弱存在**：DiPerna–Lions 全局弱解；Rein 的单物种直接表述。不给正则性/唯一性。
- **延续判据**：Glassey–Strauss 1986：动量支撑有界 ⟹ 可延拓；"奇点只能在高速处形成"。Klainerman–Staffilani 的 Fourier 证明、Bouchut–Golse–Pallard 的物理空间证明。**Luk–Strain 2014**：投影到固定二维平面的动量支撑有界即可（Theorem 1.2）；其 Theorem 1.1 给出本文使用的 $H^5$ 场正则性形式的 Glassey–Strauss 判据。Pallard 的矩条件与特征线积分估计。
- **降维全局解**：Glassey–Schaeffer 的 1+1/2、2+1/2、平面问题。
- **小数据**：Schaeffer（衰减尾）、Bigorgne（向量场法+修正交换子，允许非零电荷与非紧粒子数据但加权小）、Wang 小数据、Wei–Yang（大 Maxwell 场+小加权密度）。
- **近期**：Wang 2022 柱对称大数据；Wang 2026 年 7 月两篇（柱对称大数据，需 $H^s$、$s\ge6$ 场 + 加权 $H^s$ 粒子密度 + 轴旋转协变）。本文不假设对称性、不假设 $H^s$ 场——数据类不可混同。

### 1.3 延续定理（prop:continuation，setup.tex）

每个光滑容许初值有唯一极大经典解，在寿命的每个紧子区间上光滑；若 $T_{\max}<\infty$ 且动量支撑有界（$\sup\{|v|:0\le t<T_{\max},(x,v)\in\supp f(t)\}<\infty$），则解可经典延拓越过 $T_{\max}$。这是 Luk–Strain Theorem 1.1（$H^5$ 表述 + 脚注 1）的引用 + §continuation 对初值场类（仅 $C_b^\infty\cap L^2$，非 $H^5$）的修正适配。

### 1.4 核心机制：符号动量增量估计（prop:increment，本文的心脏）

固定有限视界 $T_0$、紧区间 $[0,t_*]\subset[0,T_{\max})$。接收者（receiver）特征 $(X(t),V_X(t))$：$X'=u(V_X)$，$K(t)=V_X'=E(t,X)+u(V_X)\times B(t,X)$；$a(t)=u(V_X)$，$q_X=q(V_X)$。源（source）特征用 $Y,V,u$ 记号。

**尺度记号**（eq:P-range）：$P\ge 1024\max_{z\in\supp f_0} q(V(t,z))$ 取 2 的幂；$L=\log(2+P)$；$S(w)=P^2L/w$。接收者尺度 $w=2^k$（$k\ge0$），在非空范围 $w/8\le q_X\le 8w$ 上必有 $w\le P$。

**主命题（符号动量增量）**：存在常数 $M,A\ge1$、阈值 $P_0$（均与 $t_*,P$ 无关；$P_0$ 可依赖 $M,A$），使得：对每个支撑的接收者、每个 $w=2^k$、每个使 $w/8\le q_X(t)\le 8w$ 全程成立的区间 $[t_1,t_2]\subset[0,t_*]$，

$$\boxed{\;|V_X(t_2)-V_X(t_1)|\;\le\; M P\sqrt{t_2-t_1}\;+\;A\,(t_2-t_1)\,\frac{P^2\log(2+P)}{w}\;}$$

（即用户提法 $|\Delta V|\le MP\sqrt\tau+A\tau\log(2+P)/w$ 的精确形态：线性项实为 $A\tau S(w)=A\tau P^2L/w$，比用户提法多一个 $P^2$——这是与 $P\ge1024\,\max q$ 的归一化相配套的。）

**两项的分工与来源**：

- **$MP\sqrt\tau$（根号项）**：来自绝对力（absolute force）估计 $|K|\lesssim P^2$ 乘以 $\tau$ 后的最优能量通量形态——直接估计在最佳情形给 $|K|\lesssim P^2$，但那是"绝对值先取"的损失版；根号项是把 $|K|\le C P^2$ 在能量守恒下对 $\tau$ 平方根化后的截断形态（$P\sqrt\tau$ 与 $\tau P^2/w$ 在 $w\asymp P$ 时相接）。它的作用是覆盖**区间端点附近**和**任何签号估计够不着的残段**。
- **$A\tau S(w)$（带时间权重的签名项）**：筛选（selection）后选定角范围的签名积分：全导数项边界贡献 + 体项，其中接收者加速度系数经求和后 $\lesssim w^{-1/2}$，恰好抵消绝对力估计里多余的 $\sqrt w$ 损失。$P^2/w$ 反映源能量 $\le P^2$（能量上界平方出现在延迟 Jacobian/通量里），$L=\log(2+P)$ 来自二进距离/角度求和与角计数对数项。

**为何这个形态能闭口**（setup.tex 的收口论证）：设 $T_{\max}<\infty$，则动量支撑必无界。令 $Q(t)=\max_{z\in\supp f_0}q(V(t,z))$（连续，因特征流连续 + 标签集紧）。取 $t_n<T_{\max}$ 为首次 $Q=2^n$ 的时刻，$s_n$ 为同一标签最后一次处于能量 $2^{n-1}$ 的时刻（$s_n\ge t_{n-1}$，因初能量更小）。在 $[s_n,t_n]$ 上能量 $\in[2^{n-1},2^n]$，对该前缀 $[0,t_n]$ 用 $P=1024\cdot2^n$、$w=2^n$ 的命题（$q$ 是 1-Lipschitz）：

$$2^{n-1}\le|V(t_n)-V(s_n)|\le 1024M\,2^n\sqrt{\Delta_n}+1024^2A\,2^n\Delta_n\log(2+1024\cdot 2^n),\quad \Delta_n=t_n-s_n.$$

右端至少一项 $\ge 2^{n-2}$，故 $t_n-t_{n-1}\ge\Delta_n\ge c/\log(2+1024\cdot2^n)$，调和–对数级数发散 ⟹ $t_n$ 不能停在有限 $T_{\max}$ 内。矛盾。**注意发散速率只有 $1/\log$：这就是为什么增益必须是"严格"的（常数从 $M$ 降到约 $M/2$），任何边角残段（端点短区间）都必须被根号项或旧 bootstrap 吃掉，不能留一次性的 $O(1)$ 损失。**

**Bootstrap 结构**：为证命题，在 $[0,\tau]\subset[0,t_*]$ 上假设 eq:bootstrap 对所有接收者/尺度/区间成立（bootstrap 假设），推出一致严格改进，再用连续性闭口。$C$ 与 $\lesssim,\asymp$ 可依赖数据、$T_0$、固定分解参数，**不可依赖 $t_*,P,M,A$**。最终常数选取顺序固定：**先时间斜坡分数（time-ramp fraction），再 $M$，再 $A$，再 $P$ 的下阈值**——这个顺序是"每个常数只用尚未选取的更下游常数来约束自己"的闭环关键。非负估计允许对区间 $J\subset[0,\tau]$（长 $\le I$）内满足 $w/8\le q_X\le8w$ 的任意可测时间子集积分，约束 $0<I\le(w/P)^2$；最终签名估计则要求区间长恰为 $I$ 且全程在范围内。这一"可测子集 vs 全程"的区分使得对不相交时间片的求和不需要每片新增常数。

**证明路线图**（依赖图，figure-dependencies）：
1. §retarded：Glassey–Strauss 延迟场分解，把力写成沿源特征延迟时刻的积分核（改换变元到初始粒子标签）；
2. §occupation：源粒子在二进距离/角度盒中的占据（residence time）估计；
3. §direct：直接（绝对值先取）力估计——大角度便宜、窄角区损失 $\sqrt w$；
4. §cancellation：窄角区的签名恒等式——力 = 全导数 + 体项（含接收者加速度项）；
5. §direction：用签名估计（第一次使用）控制方向改变次数 ⟹ 改进占据；
6. §selection：筛选满足阈值的盒（第二次使用签名估计），接收者加速度系数求和后 $\le C w^{-1/2}$；
7. §closure：时间权重 + 端点补齐 + 连续性闭口；
8. §continuation：局部存在唯一、光滑持久、场修正，套用 Luk–Strain。

---

## 二、逐引理带批注重构（按论文 §3–§10 顺序）

### §3 Energy and the retarded force（retarded.tex）

#### 引理 3.1（ret:energy，输运与锥能量）

**陈述**：特征流保相体积、把 $f_0$ 沿流搬运 ⟹ $0\le f\le\|f_0\|_\infty$。定义能量密度 $\mathcal U=\tfrac12(|E|^2+|B|^2)+\int qf\,dv$、能流 $\mathcal S=E\times B+\int qu f\,dv$、总能量 $\mathcal H_0=\int\mathcal U(0,x)\,dx$。两条守恒/估计：(i) 全空间能量守恒 $\int\mathcal U(s,x)dx=\mathcal H_0$；(ii) **向后光锥能量不等式**——对顶点 $(t,x)$，$r=t-s$、$y=x-rn$、$n\in S^2$、$d=1-n\cdot u(v)$、$G=|E+n\times B|+|n\cdot B|$，有

$$\int_0^t\!\!\int_{S^2} r^2\Big(G^2+\int q\,d\, f(s,x-rn,v)\,dv\Big)\,dn\,ds\ \le\ 4\mathcal H_0.\tag{cone-energy}$$

**推导**：相体积守恒来自向量场 $(u, E+u\times B)$ 无散：$\nabla_x\cdot u=0$（$u$ 不依赖 $x$）、$\nabla_v\cdot E=0$（$E$ 不依赖 $v$）、$\nabla_v\cdot(u\times B)=B\cdot(\nabla_v\times\nabla_v q)=0$。能量恒等式 $\partial_s\mathcal U+\nabla\cdot\mathcal S=0$、$|\mathcal S|\le\mathcal U$ 由 Vlasov 方程乘 $q$ 积分 + Maxwell 能量恒等式拼出（动量无边界项因为相支撑紧）。关键技巧：**只在 $L^2$ 场正则性下**用 cutoff $\chi_R$（球上为 1、梯度 $C/R$）截断积分，误差 $O(1/R)\to0$——这正是"场不必 $H^5$"的第一个用武之地。锥不等式的精确版本是对收缩球 $|y-x|<t-s$ 写能量恒等式：外法向是 $-n$，边界通量为 $\mathcal U-n\cdot\mathcal S$，锥尖处球能量由局部连续性趋于零，得**恒等式**

$$\int_0^t\!\!\int_{S^2} r^2(\mathcal U-n\cdot\mathcal S)(s,x-rn)\,dn\,ds=\int_{|y-x|<t}\mathcal U(0,y)\,dy.$$

场部分代数化：$\mathcal U-n\cdot\mathcal S=\tfrac12(|E+n\times B|^2+|n\cdot B|^2)$（交叉项恰好相消——这是 Maxwell 方程的刚性），粒子部分是 $\int q\,d\,f\,dv$（$q$ 为粒子能量，$d=1-n\cdot u$ 是把 $dy$ 换到 $dz$ 的 Jacobian 因子，见下）。最后 $(a+b)^2\le2(a^2+b^2)$ 放缩成不等式。常数 4 = 2（交叉放缩）× 2（$\tfrac12$ 归一）。

**批注（机械理由）**：(ii) 是全文的"燃料库"——后面所有源加速度 $b$、场量 $G$ 的积分控制都从这里来，形式是 $r^2 G^2$ 的锥面平均。$\theta^2\asymp d$ 的定义使 $d$ 出现的地方都能换成 $\theta$。
**[推测] 失败路线 A**：若不用 $(\mathcal U-n\cdot\mathcal S)$ 而只用 $\mathcal U$ 做锥估计，场部分失去 $|n\cdot B|$ 分离，$G$ 里会多出 $|B|$ 的未加权项——而 $|B|$ 沿锥面没有 $L^2$ 通量界（只有全空间 $L^2$），源加速度界 (ret:acceleration-bounds) 里 $\theta^2|B|$ 项就无法被 $\theta$ 幂次压住，窄角区签名恒等式的体项爆炸。
**[推测] 失败路线 B**：若初值场只有 $L^2$ 却试图直接分部积分，cutoff 误差 $C/R$ 不趋零（场导数非 $L^2$），守恒律本身不成立——这是为什么必须先用"球截断 + 误差趋零"的经典论证，而不是形式化地"乘方程积积分"。

#### 引理 3.2（ret:phase-change，延迟相点 → 初始标签）

**陈述**：固定 $(t,x)$，锥上 $(y,v)$（$s=t-|x-y|$）到初始标签 $z=(y_{\rm in},v_{\rm in})$ 的映射（除锥尖外）一一对应，Jacobian

$$dz=d\,dy\,dv,\qquad d=1-n\cdot u(v)>0.\tag{phase-jacobian}$$

像集为 $\mathcal L_{t,x}=\{z:|x-Y(0,z)|<t\}$（初始时刻位于接收者初始球内的标签），延迟时刻 $s$ 由 $s+|x-Y(s,z)|=t$ 唯一解出。从而波势

$$(\Phi,\mathcal A)(t,x)=\frac1{4\pi}\int_{\mathcal L_{t,x}}f_0(z)\frac{(1,u(V(s,z)))}{r\,d}\,dz.\tag{label-potentials}$$

**推导**：固定时刻逆流 $Z_s$ 行列式为 1（Liouville），$\partial_s Z_s=-DZ_s\,(u,V')$；因 $\nabla_y s=n$，复合映射 $(y,v)\mapsto Z_{t-|x-y|}(y,v)$ 的导数是固定时刻导数乘以秩一摄动 $\Id-(u,V')\otimes(n,0)$，其行列式 $=1-n\cdot u=d$（矩阵行列式引理）。单射性：固定标签时 $s+|x-Y(s,z)|$ 严格增（增量 $\ge(1-\sup|u|)(s_2-s_1)$），恰有一个根；根为锥尖 ⟺ $Y(t,z)=x$，此集合相测度为零（保测流 + Fubini）。

**批注**：这是"沿源标签固定、不微分密度 $f$"策略的代数基础——把 $f(t-r,y,v)$ 换成 $f_0(z)/d$ 后，一切被微分的对象都是显式几何量（$r,d,n,u,b$），而不是 $f$ 本身。summary 中反复出现的 "held particle labels fixed to avoid differentiating the initial density" 落点在此。
**[推测] 失败路线**：若在 $(y,v)$ 变量下直接对势做 $\nabla_x$，$\nabla_xs=-n/d$ 的分母 $d$ 在近锥方向爆破且 $f$ 的导数出现—— needing $f$ 的 Lipschitz/导数界，而 bootstrap 只控制动量增量。换成标签变量后最坏奇性只剩 $r^{-2}$。

#### 命题 3.3（ret:representation，延迟场表示——Glassey–Strauss 核）

**陈述**：设 $E^{\rm fr},B^{\rm fr}$ 为自由波动方程解（初值 $(E_0,\nabla\times B_0)$、$(B_0,-\nabla\times E_0)$）。定义初始球面边界项（ret:initial-boundary，$n_0=(x-y_0)/t$）

$$(E^{\rm bd},B^{\rm bd})=\frac1{4\pi t}\int_{|x-y_0|=t}\int\frac{f_0(y_0,v_0)}{d_0}\bigl(n_0-u_0,\ n_0\times(n_0-u_0)\bigr)\,dv_0\,dS_{y_0}.$$

则对 $t>0$：

$$E=E^{\rm fr}+E^{\rm bd}+\frac1{4\pi}\int_{\mathcal L_{t,x}}f_0(z)\,\mathscr K\,dz,\qquad B=B^{\rm fr}+B^{\rm bd}+\frac1{4\pi}\int_{\mathcal L_{t,x}}f_0(z)\,(n\times\mathscr K)\,dz,$$

核为（ret:kernel，源加速度 $b=u'=\frac{\Id-u\otimes u}{q}(E+u\times B)$）

$$\mathscr K=\frac{n-u}{r^2q^2d^3}+\frac{(n-u)(n\cdot b)-db}{r\,d^3}.$$

且四项"数据场"一致有界：$\sup_{t\le T_0,x}(|E^{\rm fr}|+|B^{\rm fr}|+|E^{\rm bd}|+|B^{\rm bd}|)\le C_{T_0,f_0,E_0,B_0}$。

**推导分四步**：
1. **波表示**：Kirchhoff 公式给 $\Box(\Phi,\mathcal A)=(\rho_f,j_f)$（零初值），Maxwell 化为 $\Box E=-\nabla\rho_f-\partial_t j_f$、$\Box B=\nabla\times j_f$，故 $E=-\nabla\Phi-\partial_t\mathcal A+E^{\rm fr}$、$B=\nabla\times\mathcal A+B^{\rm fr}$。**精细点**：电势部分要求初速度 $-j_f(0)$——只在 $C^1$ 源下论证：变量 $y=x-rn$ 下势对 $C^1$ 源积分权重 $r\,dr\,dn$，一阶导连续且 $\partial_t\mathcal A=t\,j_f(0,x)+O(t^2)$、$\nabla\Phi,\nabla\mathcal A=O(t^2)$。分布唯一性通过空间卷 mollifier + 波方程给连续二阶时间导 + 局部波能量归零来化归经典唯一性——**不用 $f$ 的二阶导数**。
2. **内核微分**：固定标签，隐函数微分 $s+|x-Y(s,z)|=t$ 给 $s_t=1/d$、$\nabla_xs=-n/d$。记 $\ell=(rd)^{-1}$：固定 $s$ 时 $\nabla_x\ell=-\frac{n-u}{r^2d^2}$；固定 $x$ 时 $r_s=-n\cdot u$、$n_s=-\frac{u-n(n\cdot u)}r$、$\ell_s=\frac{q^{-2}-d}{r^2d^2}+\frac{n\cdot b}{rd^2}$。于是内电核
$$-\nabla_x^{\rm total}\ell-\partial_t(u\ell)=\frac{n-u}{r^2d^2}+\frac{n-u}{d}\ell_s-\frac{b}{rd^2}\ \xrightarrow{\text{化简}}\ \mathscr K$$
（用到 $q^{-2}$ 项与 $r^2q^2d^3$ 分母的配平）。磁核是 $\nabla_x^{\rm total}\times(u\ell)=n\times\mathscr K$。
3. **边界项与锥尖**：标签域指示子 $\mathbf1_{\{t>|x-y_0|\}}$ 的 $\partial_t$ 是 $\delta$、$\nabla_x$ 是 $-n_0\delta$，给电因子 $(n_0-u_0)/(td_0)$。$d_0$ 有固定正下界（初速度紧支撑），故 $|E^{\rm bd}|+|B^{\rm bd}|\le C_{f_0}t$ 一致。锥尖的合法性：插入 $r<\gamma$ 为 0、$r>2\gamma$ 为 1 的光滑 cutoff，其导数 $\le C/\gamma$；被略去的势/截断误差是 $O(\gamma^2)$、$O(\gamma)$，被略去的核积分 $O(\gamma)$（换元后最坏径向奇性 $r^{-2}$），局部一致趋于零 ⟹ 锥尖无残余支撑项。
4. **数据场界**：Kirchhoff 公式 $\|W(t)\|_\infty\le\|W_0\|_\infty+t\|\nabla W_0\|_\infty+t\|W_1\|_\infty$，用 $C_b^\infty$ 初值。注意两个自由波**合起来不必是真空 Maxwell 解**——表示只需要展示的波数据。

**批注（1024 之类的常数此刻尚未出现；这里出现的结构性常数是 $4\pi$ 与 4）**：$(n-u)(n\cdot b)-db$ 与 $n$ 切（$n\cdot N=0$）这一点是 Pallard 也用的"加速度核与锥法向正交"，后面接收者投影时再省一个 $\phi$ 因子。
**[推测] 失败路线**：若初值数据只有 $L^2$ 而无 $C_b^\infty$，$E^{\rm fr}$ 无 $L^\infty$ 界，ret:data-bound 失效——这正解释了为什么容许数据类选 $C_b^\infty\cap L^2$ 而不是纯有限能量：$C_b^\infty$ 负责点状核界，$L^2$ 负责能量通量。若试图要求 $H^5$ 则落入 Luk–Strain 原始假设与题设数据类的落差（summary 失败路线：需要 §continuation 的场修正来补）。

#### 引理 3.4（ret:direct-bounds，逐点力界）

**陈述**：取 $\theta^2\asymp d$（源角）、$\phi^2\asymp D$（接收角）。接收者几何量 $D=1-n\cdot a$、$e=1-a\cdot u$、$Q=D\Id+n\otimes a$（由 $h+a\times(n\times h)=Qh$ 而来）。力 $K=K^{\rm data}+\frac1{4\pi}\int(T_{\rm ker}+S_{\rm ker})$：

$$T_{\rm ker}=\frac{fQ(n-u)}{r^2q^2d^2},\qquad S_{\rm ker}=\frac{fQ\bigl((n-u)(n\cdot b)-db\bigr)}{r d^2}.$$

界（$G=|E+n\times B|+|n\cdot B|$）：
$$T_r=\frac{Cf}{r^2q^2\theta^2},\qquad T_\perp=\frac{Cf\phi}{r^2q^2\theta^3};\tag{transport-bounds}$$
$$|b|\le\frac Cq(G+\theta^2|B|),\quad |n\cdot b|\le\frac{C\theta}q(G+\theta^2|B|),\quad|q'|\le C(G+\theta|B|);\tag{acceleration-bounds}$$
$$|S_{\rm ker}|\le S_g+S_b,\qquad S_g=\frac{Cf\phi}{rq\theta^2}G,\qquad S_b=\frac{Cf\phi}{rq}|B|;\tag{source-bounds}$$
若 $P_X$ 是向 $V_X^\perp$ 的投影则 $|P_XS_{\rm ker}|\le C\phi(S_g+S_b)$。

**推导**：恒等式 $2d=|n-u|^2+q^{-2}$、$2D=|n-a|^2+q_X^{-2}$ 给 $|n-u|\le C\theta$、$|n-a|\le C\phi$。$Qn=n$；$h\perp n$ 时 $|Qh|\le D|h|+|a\cdot h|\le C\phi|h|$——$T_{\rm ker}$ 里 $n-u$ 分解为法向 $dn$（给 $T_r$，注意 $d\le\theta^2$ 使 $d$ 抵掉一个 $\theta^2$ 分母）与切向 $\le C\theta$（给 $T_\perp$，$\phi\times\theta/d^2=\phi/\theta^3$）。源加速度：写 $u=(1-d)n+u_\perp$、$H=E+n\times B$，则 $F_{\rm src}=H+(-dn+u_\perp)\times B$，切向分量 $\le C(G+\theta^2|B|)$（$u_\perp\times B$ 切向只涉 $n\cdot B$）、法向 $\le C(G+\theta|B|)$；$L_u=\Id-u\otimes u$ 满足 $|L_un|\le C\theta$、$n\cdot L_un=2d-d^2\le C\theta^2$、$|n\cdot L_uh|\le C\theta|h|$。分子 $N=(n-u)(n\cdot b)-db$ 与 $n$ 切（$n\cdot N=d(n\cdot b)-d(n\cdot b)=0$，恒等抵消），$|N|\le\frac{C\theta^2}{q}(G+\theta^2|B|)$，配 $Q$ 的切向 $\phi$ 界得 source-bounds。投影额外 $\phi$：$P_Xa=0\Rightarrow|P_Xn|=|P_X(n-a)|\le C\phi$，且 $h\perp n$ 时 $|P_XQh|\le D|h|+|P_Xn||a\cdot h|\le C\phi^2|h|$——对 $N$ 应用后比 source-bounds 再小一个 $\phi$。

**批注（$\sqrt w$ 损失的病灶在此）**：$S_g$ 中 $G$ 项带 $\phi/\theta^2$：当 $\theta\ll\phi$（源速度比接收速度更贴近光线方向）时此项巨大——直接估计中 $\int S_g$ 恰好在 $\theta\lesssim\phi$ 窄角区产生超出 $A\tau S(w)$ 预算的 $\sqrt w$ 因子（summary："The loss occurs when the source velocity is much closer to the light-ray direction than the receiver velocity is"）。签名恒等式的任务就是把这一窄区抢救出来。$q'$ 界（$q'=u\cdot E=u\cdot H-u\cdot(n\times B)$）后面在"$q\asymp$ 稳定窗"论证里用。
，接收者投影省不掉一个 $\phi$，selection 的系数预算 $w^{-1/2}$ 恰好不够。

### §4 Occupation of retarded bins（occupation.tex）

**总设定**：假设 eq:bootstrap 到时刻 $\tau\le t_*$。固定接收者 $X$、二进尺度 $w$、闭区间 $J\subset[0,\tau]$（长 $\le I\le(w/P)^2$），积分域为 $\{t\in J:w/8\le q_X\le8w\}$ 的任意可测子集。已建立的界：$0\le f\le\|f_0\|_\infty$、$\sup_s\int qf\,dy\,dv\le C$。

#### 4.1 动量与角度范围（定义层）

**定义**：$H_0=\max(1,T_0)$。对 $r/H_0,\sqrt{d/2},\sqrt{D/2},\sqrt{e/2},q$ 做光滑二进分解，代表元 $h,\theta,\phi,\sigma\in\{1,2^{-1},\dots\}$、$q\asymp p$（$p=64p_0$，$64\le p\le P$，即 $p/128\le q\le p/32$）。分解要求：支撑在半倍到两倍代表元之间、含端点 1、有界重叠、对对数变量导数一致有界（归一化 dilate 的固定 bump，支撑 $(1/2,2)$、在 $[3/4,3/2]$ 上为正）。

**角恒等式**（occ:angle-identities，全文最常引用的代数事实）：
$$2d=|n-u|^2+q^{-2},\qquad 2D=|n-a|^2+q_X^{-2},\qquad 2e=|a-u|^2+q^{-2}+q_X^{-2}.$$
**推导**：第一行 $|n-u|^2=1+|u|^2-2n\cdot u$，而 $|u|^2=1-q^{-2}$，故 $=2(1-n\cdot u)-q^{-2}=2d-q^{-2}$；第二行把 $u$ 换 $a$、$q$ 换 $q_X$；第三行 $|a-u|^2=2(1-a\cdot u)-q^{-2}-q_X^{-2}=2e-q^{-2}-q_X^{-2}$。

**角范围**（occ:angle-ranges）：非空盒上 $\theta\ge1/p$、$\phi\ge c/w$、$\sigma\ge c/m$、$m=\min(p,w)$。推导：$2d=|n-u|^2+q^{-2}\ge q^{-2}\asymp p^{-2}$ 且 $d\asymp\theta^2$。三个角至多 $C\log(2+P)$ 个非空二进盒——**$\log P$ 的第一个来源**。关系 $\sigma\le C(\theta+\phi)$、两角充分分离时 $\sigma\asymp\max(\theta,\phi)$：对 $\R^5$ 中向量 $(u-n,q^{-1},0)$、$(n-a,0,q_X^{-1})$（范数 $\sqrt{2d},\sqrt{2D}$，和的范数 $\sqrt{2e}$）用三角/反三角不等式。

**扇区分割**：固定小数值 $\kappa>0$。小扇区 $\theta<\kappa\phi$（此时 $\sigma\asymp\phi$，略去 $\sigma$ 分解，估计有效范围放大到 $\theta\le16\kappa\phi$）；其余扇区 $\theta\ge\kappa\phi$（保留 $\sigma$ 分解，含 $\theta\gg\phi$）。两扇区参数（occ:sector-parameters）：
$$\begin{array}{c|c|c|c}&\nu&k_1&\omega\\\hline\text{small}&\theta&1&\phi\\\text{remaining}&\min(\theta,\sigma)&1+\phi/\sigma&\sigma\end{array}$$
$\omega$ 是占据论证的速度容差；$k_1$ 是"方向单调穿越时长"因子；$\nu$ 是控制角。

**密度界**（occ:density）：$N(t,s,n)=\int_{\text{盒的动量限制}}f\,dv\le Cp^3\nu^2$。推导：动量壳体积 $\le Cp^3$；$\theta$ 小时角恒等式把速度方向限制到绕 $n$ 半径 $C\theta$ 的球冠；$\sigma$ 小时两个速度模都近 1 且方向差 $\le C\sigma$，给出绕接收方向 $a$ 的球冠——取较小者；控制参数有下界时壳界单独成立（常数变大）。允许的 $n$ 球面面积 $\le C\phi^2$。

#### 引理 4.1（occ:crude-lemma，粗糙占据界）

**陈述**：占据测度 $\mathsf M=\int dt\,ds\,dn\,r^2D\,N$（$t$ 在允许时间集、$0\le s<t$；因子 $D$ 使锥积分等于源时刻命中意义上的粒子质量）。每个盒上：
$$\mathsf M\le C\frac{\max(I,h)}p\tag{occ:energy 能量界}$$
$$\mathsf M\le CI\frac{\phi^2}{\theta^2}.\tag{occ:time 时间界}$$

**推导**：两套换元各给一界。
(1) **空间换元**（Pallard 2005 Lemma 2.1 / Luk–Strain Prop 5.2 证明中的技巧）：固定 $s$，映射 $(t,n)\mapsto y=X(t)-(t-s)n$ 单射（固定 $y$ 时 $t-s-|X(t)-y|$ 严格增，可微处导数 $\ge1-|a(t)|>0$），Jacobian 绝对值 $r^2D$（球面两切向量 + 时间导 $a-n$，法向分量 $-D$）。于是 $\mathsf M=\int f(s,y,v)\,ds\,dy\,dv$；源时刻落在长 $\le C(I+h)$ 的区间，动量盒上 $q\ge cp$，粒子能量界给 occ:energy。
(2) **标签换元**：$\mathsf M=\int f_0(z)\,dz\int_{\text{hits of }z}ds$（固定 $s$ 换初始标签，测度守恒）。由引理 3.5，无碰撞标签有唯一增 $C^1$ 延迟分支，$dt/ds=d/D$；命中接收者时间的总长 $\le I$；盒上 $D/d\le C\phi^2/\theta^2$；每标签命中时长 $\le CI\phi^2/\theta^2$，对守恒的有限总质量积分得 occ:time。

**批注**：occ:time 的 $\phi^2/\theta^2$ 是"接收者比源更贴光线时，源滞留被拉长"的倒数表述；随后被 bootstrap 稳定窗截断。
**[推测] 失败路线**：只用 (1)，小 $\theta$ 区无 $\theta$ 增益，直接力估计在窄角区发散；只用 (2)，$h$ 大时失去能量池控制。两者的 min 结构由 occ:actual 的 $\max(1,I/\lambda,h/\lambda)$ 分情况吸收。

#### 4.2 短胞上的稳定性（occ:lambda、occ:stability）

**定义**：大常数 $C_0,C_1$（后面定），$\lambda=\bigl[C_1\frac Pm\bigl(\frac M\omega+\sqrt{\frac{AL}{\omega}}\bigr)\bigr]^{-2}$。盒称 **actual** 若 $\omega>C_0/m$，否则 **deficit**。actual 盒上角恒等式给 $|u(s)-a(t)|\ge c\omega$（两个动量倒数项在 $C_0$ 大时 $\ll\omega^2$）；deficit 盒上 $\lambda\le C_0^2/(C_1^2P^2)$。

**稳定窗引理**（occ:stability）：任一 hit 的源时刻 $\pm C_*\lambda$、接收者时刻 $\pm C_*\lambda$（裁到 $[0,\tau]$）内：
$$|\Delta V|\le\varepsilon_0 m\omega,\qquad|\Delta u|\le\varepsilon_0\omega,\qquad q\asymp q_{\rm hit},$$
$\varepsilon_0$ 可经取 $C_1\gg C_*$ 任意小，**与 $M,A$ 无关**。

**推导（bootstrap 的反用/停时论证）**：取最接近 $q_{\rm hit}$ 的二进 $w'$，停时在首次离开 $[q_{\rm hit}/2,2q_{\rm hit}]$；离开前 bootstrap 以 $w'\asymp q_{\rm hit}\ge cm$ 适用。长 $\le C_*\lambda$ 的区间上两项：
$$MP\sqrt{C_*\lambda}\le\frac{\sqrt{C_*}}{C_1}m\omega,\qquad CA C_*\lambda\frac{P^2L}{m}\le\frac{CC_*}{C_1^2}m\omega,$$
（把 $\lambda$ 定义代入：根号项 $\sqrt\lambda\sim C_1^{-1}\sqrt m\,(\cdots)^{-1/2}/\sqrt P$ 恰好配出 $m\omega$；线性项 $\lambda P^2L/m\sim(C_*/C_1^2)\omega\cdot(m/P)(m/\omega)^2\cdot L$ 的配平同理。）$q$ 是 1-Lipschitz 且 $\omega\le1$，$C_1$ 充分大时两项都小于 $m\omega$ 的固定小份额，排除首出；同论反向跑。速度估计：两动量向量间线段上 $q\ge c\,q_{\rm hit}$，$\|D_vu\|\le1/q$ 沿线段积分。然后固定 $C_*$（覆盖下文胞与延迟时刻间隔），再固定 $C_1$。

**批注（$\lambda$ 的机械含义）**：$\lambda$ 是"bootstrap 自己担保的速度稳定时长"；$\lambda$ 定义中两个求和逆 $M/\omega$（对应根号项预算）与 $\sqrt{AL/\omega}$（对应线性项预算）正是 eq:bootstrap 的两项。$M,A$ 允许出现在 $\lambda$ 里，因为稳定窗只喂给占据估计，其常数最终由能量池吸收。$P/m$ 因子来自 $w'\ge cm$、$P\ge w'$。
**[推测] 失败路线（对应 summary："intervals too long to preserve particle speed under the bootstrap's linear term"）**：若稳定窗不缩短（例如直接用 $I\le(w/P)^2$ 当窗长），线性项 $A\tau P^2L/w$ 在 $\tau\sim$ 原窗长时已 $\gtrsim m\omega$，$q\asymp q_{\rm hit}$ 速度可比性破坏，"胞内 $u$ 的固定方向投影单调"论证失败，占据从 $hk_1/p$ 退化回 $\max(I,h)/p$，窄角直接估计闭不了口。summary 里救活观察 = "shortened them by a factor involving 2+γ·log P"——即把计数窗长乘上 $(2+\gamma\log P)^{-1}$ 类因子，让线性项落在预算内。

#### 引理 4.2（occ:cell-lemma，稳定胞上的占据）

**陈述**：每个 actual 盒上
$$\mathsf M\le C\frac{h k_1}{p}\max\Bigl(1,\frac I\lambda,\frac h\lambda\Bigr).\tag{occ:actual}$$

**推导**：设 $h\le\lambda$（否则用 occ:energy：其右边 $\le$ occ:actual 右边，因 $k_1\ge1$、$h\max(I,h)/\lambda\ge\max(I,h)$）。$[0,\tau]$ 切成 $\lambda$ 长的胞。命中闭胞的标签集可测（紧集投影：初支撑 × 胞 × $J$ × $S^2$；盒有 $r\ge ch>0$）。取胞内一次命中 $(s_0,t_0)$ 为参考：胞内每个同时刻 $s$ 处 $u(s,z)$ 与 $a(s)$ 都在参考速度的小倍数 $\omega$ 邻域（时间间隔 $\le\lambda+C_{T_0}h\le C_*\lambda$，用稳定窗）；因此**同一时刻的速度差有某固定方向上至少 $c\omega$ 的投影**（方向可依赖标签）。任何命中处 $Y(s,z)-X(s)=\int_s^t(a(t')-n)dt'$、$|Y-X|\le Ch(\phi+\omega)$（用 $|a-n|\le C\phi$ + 接收者稳定性）；投影同时距离严格单调、导数模 $\ge c\omega$，命中值在长 $Ch(\phi+\omega)$ 的区间内 ⟹ 总 $s$ 时长 $\le Ch(1+\phi/\omega)\le Chk_1$（hit 集不连通也成立）。命中标签在胞内公共时刻 $q\asymp p$（稳定性）⟹ 相体积守恒 + 能量界给总标签质量 $\le C/p$；源时刻范围长 $\le C(I+h)$ ⟹ 至多 $C\max(1,I/\lambda,h/\lambda)$ 个胞。对 occ:label-measure 求和即得。

**批注**：$k_1=1$（小扇区）与 $1+\phi/\sigma$（其余扇区）的差别来自速度容差 $\omega$ 取 $\phi$ 还是 $\sigma$：穿越时长 $\propto h(1+\phi/\omega)$。
**[推测] 失败路线**：若不先证"胞内所有命中共享同一投影符号方向"，hit 集可来回穿越同一投影值——时长估计失去单调性，占据数要乘命中次数（无界）。这正是 summary 中 direction changes 计数要杀的对象：**没有方向计数，穿越可以是无限次振荡而非一次单调扫过**。

#### 4.3 联合能量预算（occ:energy-budget）

**定义**：$J^*=\{s\in[0,\tau]:\mathrm{dist}(s,J)\le C_{T_0}I\}$，$|J^*|\le CI$。对固定 $(s,y)$ 定义延迟时刻 $t_{\rm ret}(s,y)\in(s,\tau]$（$t-s=|X(t)-y|$ 的唯一解，去掉尖端 $y=X(s)$），**刻意不要求** $t_{\rm ret}$ 属于 $J$ 或允许时间子集。两个指标（固定充分放大的比较常数）：
$$H^{(1)}_{p\phi}=\mathbf1\{q\asymp p,|u(v)-a(s)|\asymp\phi\},\qquad
H^{(2)}_{p\phi}=\mathbf1\{q\asymp p,\ t_{\rm ret}\text{ 存在},\ \sqrt{(1-n_{\rm ret}\cdot a(t_{\rm ret}))/2}\asymp\phi\},$$
$n_{\rm ret}=(X(t_{\rm ret})-y)/(t_{\rm ret}-s)$。能量预算
$$\mathcal E_{p\phi}=\frac1I\int_{J^*}\int qf\,(H^{(1)}_{p\phi}+H^{(2)}_{p\phi})\,dy\,dv\,ds;\tag{occ:energy-budget}$$
**与 $\theta,h$ 及可测子集无关**，且 $\sum_{p,\phi}\mathcal E_{p\phi}\le C$：每个 $(s,y,v)$ 在两族中至多落入有界个 $p,\phi$ 盒（第二族只有一个延迟时刻），求和 + 能量界 + $|J^*|\le CI$。可测性：$H^{(2)}$ 的存在性是闭不等式条件（根在 $(s,\tau)$ 连续、可连续延拓到 $\tau$ 处的根），去掉尖端后可测。

**批注**：这是"多个二进变量共用一个能量池"的记账设计——若每个 $(\theta,h)$ 盒单独用能量界，求和会对同一粒子重复计费（summary："checked that aggregation did not repeatedly charge the same force integral"）。

#### 命题 4.3（occ:refined-proposition，基线占据）

**陈述**：设 $h\le I$，仅排除 $h\le\lambda$ 的 deficit 盒。则
$$\mathsf M\le C\frac{h k_1}{p}\Bigl(1+\frac I\lambda\mathcal E\Bigr),\qquad \mathcal E=\begin{cases}\mathcal E_{p\phi}&\text{small sector}\\1&\text{remaining sector}\end{cases}\tag{occ:refined}$$
从而令 $R=1+\sqrt{I/\lambda}\sqrt{\mathcal E}$，除 $h\le\min(I,\lambda)$ 的 deficit 盒外：
$$\mathsf M\le C\frac{h k_1}{p}R^2.\tag{occ:R-bound}$$

**推导**：其余扇区：actual 盒用 occ:actual；$h>\lambda$ 用 occ:energy 给 $\mathsf M\le CI/p\le Ch(I/\lambda)/p$（顺带覆盖允许的 deficit 盒）。小扇区：$h\le\lambda\le I$ 且 actual 时，把命中标签质量在整胞上平均——胞内所有时刻同时有 $q\asymp p$、$|u-a(s)|\asymp\phi$（同 Lemma 4.2 稳定性），满胞平均给 $\int_{Z_C}f_0\,dz\le\frac C{p\lambda}\int_C\int qf\,H^{(1)}_{p\phi}\,dy\,dv\,ds$；所有胞在 $J^*$ 内、内部不交；至多两个端点裁剪胞用公共时刻论证（不平均）给 $\le C/p$；每标签命中时长 $\le Ch$；求和给 occ:refined。$\lambda>I$ 时源时刻范围只含有界个胞，粗糙界已给 $\mathsf M\le Ch/p$（不用 $J^*$ 外平均）。$\lambda<h\le I$（actual 或 deficit）：空间换元下每个命中都属于 $H^{(2)}$ 且源时刻在 $J^*$，故 $\mathsf M\le\frac Cp\int_{J^*}\int qf\,H^{(2)}\le\frac{CI}p\mathcal E_{p\phi}$，由 $h/\lambda>1$ 被右边控制。$1+(I/\lambda)\mathcal E\le R^2$ 给 occ:R-bound（$h\le I$）；$h>I$ 时 occ:energy 给 $\mathsf M\le Ch/p$、$k_1R^2\ge1$ 收尾。预算对每个盒都有定义（无论 $h\le I$ 与否），最后这个用法只需非负性。

**批注**：$R$ 是"占据增强因子"，携带 $\mathcal E$（能量池配额）与 $I/\lambda$（胞数）。direct.tex 用 $\mathsf M\lesssim hk_1R^2/p$ 替换粗糙占据，让力估计对 $(p,\theta,\phi,h)$ 可求和。
**[推测] 失败路线**：若 $\mathcal E$ 按 $\theta$ 分池，$\sum_\theta$ 引入额外 $\log$ 或发散——$\mathcal E$ 只按 $(p,\phi)$ 索引、$\theta$ 方向"免费"是刻意安排（小扇区淘汰 $\theta$、其余扇区 $\mathcal E=1$）。

---

### §5 Direct bounds for the retarded force（direct.tex）

**目标**：绝对值先取，控制除窄角 $S_g$ 之外的一切项；并给出全力的绝对界（多 $\sqrt w$ 因子）。设置同 §4：$J$ 长 $\le I\le(w/P)^2$，$\mathcal T\subset J$ 为 $w/8\le q_X\le8w$ 的任意可测时间集。

#### 命题 5.1（dir:direct，积分力界）

假设 bootstrap。**基线界**（数据项、$T_r$、$T_\perp$、$S_b$、其余扇区 $S_g$ 合并）：
$$\int\le C\bigl[P\sqrt I+(M+\sqrt A)I\,S(w)\bigr].\tag{dir:baseline}$$
**全力绝对界**：
$$\int_{\mathcal T}|K|\,dt\le C\sqrt w\bigl[P\sqrt I+(M+\sqrt A)I\,S(w)\bigr].\tag{dir:absolute}$$
$C$ 独立于 $P,w,I,M,A$。

#### 场预算与单盒估计（dir:G-budget、dir:F-budget、dir:density-integrals、dir:near-far）

**场预算**：$\mathcal G_\phi=\frac1I\int_{\mathcal T}dt\int_0^t ds\int_{S^2}dn\,r^2\chi_\phi\,G^2$ ——由锥能量不等式 $\sum_\phi\mathcal G_\phi\le C$（对 $\phi$ 求和只是支撑放大）。$\chi_\phi$ 是接收角盒的放大支撑指示子，重叠有界。**磁预算**：$\mathcal F_\phi=\frac1I\int_{J^*}ds\int dy\,|B|^2\chi_\phi(t_{\rm ret},s,n_{\rm ret})$——由有界重叠 + 全空间能量守恒 $\sum_\phi\mathcal F_\phi\le C$。两者都独立于 $p,\theta,\sigma,h$。由空间换元 Jacobian $r^2D$ 与 $D\asymp\phi^2$：
$$\int_{\rm bin}r^2\phi^2|B|^2\,dt\,ds\,dn\le C(I+h)\mathcal F,\qquad \mathcal F=\begin{cases}\mathcal F_\phi&h\le I\\1&h>I.\end{cases}\tag{dir:magnetic-budget}$$

**盒上密度积分**（dir:density-integrals；$N$ 在盒外为 0）：
$$N\le Cp^3\nu^2,\quad \int dt\,ds\,dn\le CIh\phi^2,\quad \int N\,dt\,ds\,dn\le\frac{C\mathsf M}{h^2\phi^2},\quad \int N^2\le C\min\bigl(Ih\phi^2p^6\nu^4,\ \tfrac{p^3\nu^2\mathsf M}{h^2\phi^2}\bigr).$$

**单盒 majorant 表**（dir:near-far；$dy=r^2ds\,dn$ 后，"$S_g$ 的 majorant"=$\frac{f\phi G}{rp\theta^2}$ 等）：
$$\begin{array}{c|c|c}
&\text{near bound}&\text{far bound}\\\hline
T_r&Ihp(\nu/\theta)^2\phi^2&-\\
T_\perp&Ihp\,\theta^{-3}\nu^2\phi^3&\mathsf M/(h^2\phi p^2\theta^3)\\
S_g&I\sqrt h\,p^2(\nu/\theta)^2\phi^2\sqrt{\mathcal G_\phi}&\sqrt I\sqrt{p\mathsf M}\,\nu(\theta^2h)^{-1}\sqrt{\mathcal G_\phi}\\
S_b&\sqrt{I(I+h)}\sqrt h\,p^2\nu^2\phi\sqrt{\mathcal F}&\sqrt{I+h}\sqrt{p\mathsf M}\,\nu(\phi h)^{-1}\sqrt{\mathcal F}
\end{array}$$
前两行来自密度积分；$S_g$ 行：对 $rGN$ 用 Cauchy–Schwarz，第一个因子 $\le I\mathcal G_\phi$（用 $\int r^2G^2$ 预算），第二个因子取 $\int N^2$ 两个界之一，前缀 $\phi/(p\theta^2)$；$S_b$ 行：取 $r\phi|B|$ 为第一因子、用磁预算、前缀 $1/p$。

#### 半径求和（dir:balance、dir:balanced、dir:deficit、dir:radial-transport）

**二进平衡引理**（dir:balance）：$\sum_{h\in2^{\mathbb Z}}\min(ah^\alpha,bh^{-\beta})\le C_{\alpha,\beta}a^{\beta/(\alpha+\beta)}b^{\alpha/(\alpha+\beta)}$——在 $h=(b/a)^{1/(\alpha+\beta)}$ 处分割、两侧几何级数求和。**这是 near/far 表变成可用估计的枢纽**：near 在小 $h$ 好、far 在大 $h$ 好，逐盒取 min 后按半径求和自动配平。

把 occ:R-bound 的 $\mathsf M\le Chk_1R^2/p$ 代入 near-far 表再用平衡引理（dir:balanced）：
$$T_\perp:\ C\sqrt I\,Rp^{-1}\theta^{-3}\nu\phi\sqrt{k_1};\qquad S_g:\ CI^{3/4}R^{1/2}p\phi\nu^{3/2}\theta^{-2}k_1^{1/4}\sqrt{\mathcal G_\phi};\qquad S_b(h\le I):\ CI^{3/4}R^{1/2}p\nu^{3/2}k_1^{1/4}\sqrt{\mathcal F_\phi}.$$
第一行平衡 $h$ vs $h^{-1}$；后两行平衡 $h^{1/2}$ vs $h^{-1/2}$。

**大半径 $S_b$**（$h>I$）：用 occ:time $\mathsf M\le CI\phi^2/\theta^2$，min 化为 $C\sqrt I\min(hp^2\nu^2\phi,h^{-1/2}\sqrt p\,\nu/\theta)$，半径求和 $\le C\sqrt I\,p\nu^{4/3}\theta^{-2/3}\phi^{1/3}$；角因子分情形 $\theta^{2/3}\phi^{1/3}$ 或 $C\theta(\sigma/\theta)^{4/3}$ 均几何可和；求和 $p$ 后大半径 $S_b$ 总代价 $\le CP\sqrt I$。

**deficit 例外盒**（$h\le\min(I,\lambda)$、$\lambda\le CP^{-2}$）：near 界求和给 $S_g+S_b\le CI\frac{p^2}{Pm^2}$、$T_\perp\le\begin{cases}CIp/P^2&\theta\ge\kappa\phi\\CIp^2/P^2&\theta<\kappa\phi\end{cases}$；剩余盒至多 $CL^4$ 个，用 $\frac{p^2}{Pm^2}\le\frac1P+\frac{P}{w^2}$，总代价对 $IS(w)$ 之比 $\le CL^3(\frac w{P^3}+\frac1{Pw}+\frac w{P^2})\le\frac{CL^3}P$ ——一致吸收进 $IS(w)$。

**$T_r$**：near 界直接求半径（$\theta\asymp\phi$ 时 $(\nu/\theta)^2$ 对 $\sigma$ 几何可和），得 $\int T_r\le CIPL\le CIS(w)$。

#### 角与动量求和（dir:momentum-sums、dir:R-expansion 及五个 paragraph）

**动量和**（dir:momentum-sums，在 $p=w$ 处分割验证；$p\le w$ 时 $m=p$、$p>w$ 时 $m=w$；正幂和几何、常数项 $\le CL$）：
$$\sum_p p\le CP,\quad \sum_p\frac pm\le C(L+P/w),\quad \sum_p\frac{\sqrt p}{m}\le C(1+\sqrt{P}/w),\quad \sum_p p\sqrt{P/m}\le CP\sqrt{P/w},\quad \sum_p p^{3/2}\sqrt{P/m}\le CP^2/\sqrt w.$$

**$R$ 的展开**（dir:R-expansion，由 $\lambda$ 定义精确化）：
$$R-1\le C\sqrt I\frac Pm\Bigl(\frac M\omega+\frac{\sqrt{AL}}{\sqrt\omega}\Bigr)\sqrt{\mathcal E},\qquad R^{1/2}\le C\Bigl[1+I^{1/4}\sqrt{\frac Pm}\Bigl(\frac{\sqrt M}{\sqrt\omega}+\frac{(AL)^{1/4}}{\omega^{1/4}}\Bigr)\Bigr].$$

**小扇区输运项**：$\nu=\theta$、$k_1\asymp1$，对 $\theta\ge1/p$ 求和给 $C\sqrt I\,Rp\phi$；plain 部分求和 $\le CP\sqrt I$。$M$ 项代价 $CIM P(L+\sqrt L\,P/w)$（Cauchy–Schwarz + 联合预算把 $\sum\frac pm\sqrt{\mathcal E_{p\phi}}$ 化为平方根），$\sqrt{AL}$ 项类似。由 $1\le w\le P$、$L\ge1$，两者 $\le C(M+\sqrt A)IS(w)$。

**其余扇区输运项**：分 $\theta>16\phi$（$\sigma\asymp\theta$）与 $\theta\asymp\phi$（$\sigma\lesssim\theta$）。plain 角因子 $p^{-1}\theta^{-2}\phi$ 与 $p^{-1}\theta^{-1}(\sigma/\theta)^{1/2}$ 对每个 $p$ 一致可和，plain 贡献 $\le CL\sqrt I\le CP\sqrt I$。参数项提出 $CIMP(p/m)$、$CI\sqrt{AL}\,P\sqrt p/m$ 后角和有界（用 $\sigma$ 个数 $\le C[1+\log_+(m\theta)]\le C\sqrt{p\theta}$），给 $\le C(M+\sqrt A)IS(w)$。

**其余扇区 good-field 项（$S_g$）**：plain 部分角因子 $\sqrt\theta\frac\phi\theta$、$\sqrt\theta(\sigma/\theta)^{5/4}$，固定 $\phi$ 求和 $\le C\sqrt\phi$，plain $\le CI^{3/4}P\le CP\sqrt I$（Cauchy–Schwarz：$\sum_\phi\mathcal G_\phi\le C$）。参数项除以 $\sqrt\sigma$、$\sigma^{1/4}$ 后仍可和；$\sum_\phi\sqrt{\mathcal G_\phi}\le C\sqrt L$，总代价 $CI(\sqrt M+(AL)^{1/4})P\sqrt{P/w}\sqrt L\le C(M+\sqrt A)IS(w)$（dir:field-parameters）。

**磁余项**（$S_b$，$h\le I$）：角因子 $\theta^{3/2}$ 及其变体在固定 $\phi$ 下可和；plain $\le CI^{3/4}P\sqrt L$，用 $x\le1+x^2$（$x=I^{1/4}\sqrt L$）得一致界 $I^{3/4}\sqrt L\le\sqrt I+IL$，由 $PL\le S(w)$ 完成。

**小扇区 good-field 项（只为 dir:absolute）**：角因子 $\phi/\sqrt\theta$ 对 $\theta$ 求和 $\le C\sqrt p\,\phi$，plain $\le CI^{3/4}P^{3/2}$，由 $I\le(w/P)^2$ 得 $I^{3/4}P^{3/2}\le\sqrt w\,P\sqrt I$——**$\sqrt w$ 损失显形**。参数项用动量和末条 $\sum_p p^{3/2}\sqrt{P/m}\le CP^2/\sqrt w$，总 $\le C\sqrt w(M+\sqrt A)IS(w)$。

**收口**：合并 dir:large-radius、dir:deficit、dir:radial-transport 得 dir:baseline（数据力 $\le CI\le CP\sqrt I$ 因 $I\le1$）；加小扇区 $S_g$、用 $w\ge1$ 得 dir:absolute。

**批注**：
- $P\sqrt I$ 与 $IS(w)$ 的关系：在 $w\asymp P$ 时 $S(w)\asymp L$，线性项退化；$w\ll P$ 时 $S(w)=P^2L/w$ 巨大，基线界主要由它承载——根号项用于端点残段（见 §closure）。
- **[推测] 失败路线**：若 near/far 不取 min 而只用 near，小 $\theta$ 处 $S_g$ 的 $\theta^{-2}$ 无界；若 deficit 例外盒不单独处理（比如直接声称 occ:R-bound 全域成立），$CL^4$ 个小盒的累积贡献会突破 $IS(w)$ 预算——$L^4$ 个 $\log$ 因子正是这里付的。

### §6 Signed cancellation along the source trajectories（cancellation.tex）——签名恒等式

**角色**：窄角区 $\theta<\kappa\phi$ 内，沿源轨迹先积分再取绝对值。**输运项必须包括进来**：它抵消"微分锥几何产生的项"。

#### 6.1 几何与精确恒等式（can:geometry、can:definitions、can:identity）

延迟分支上 $t=s+r$、$rn=X(t)-Y(s)$；' 表沿分支的 $s$ 微分，$a_t$ 表接收者自身时间的导数。测度恒等式（can:measure）：$dt/ds=d/D$、$ds\,f_0\,dz=D\,dt\,f\,dy\,dv$。微分延迟关系得
$$r'=\frac dD-1,\qquad rn'=N_0:=\frac dD(a-n)+n-u,\qquad n\cdot N_0=0.\tag{can:geometry}$$
定义矩阵/向量（can:definitions）：
$$Q=D\Id+n\otimes a,\qquad H=Q/D,\qquad g=\frac{u-n}{d},\qquad k_0=u-\frac eD n;\qquad Hg=\frac{k_0}{d}.$$

换到 $ds\,f_0dz$ 后，ret:force-kernels 两个内力项合并为核（can:input-kernel）：
$$\mathcal K=-\frac Hr\,\partial_s^{(u)}g-\frac{Hg}{r^2q^2d},$$
$\partial_s^{(u)}$ 只对 $u$ 微分；第二项是输运核。

**引理 6.1（can:identity，签名力恒等式）**：分支上每个非尖端点
$$\mathcal K=-\Bigl(\frac{k_0}{rd}\Bigr)'+\frac{e}{r^2D^2}\Bigl(\frac{n}{q_X^2D}-a\Bigr)+\frac{n(a_t\cdot k_0)}{rD^2}.\tag{can:label-identity}$$
从而在 $dt\,dy\,dv$ 测度下的两个**未微分类体项**：
$$\mathcal R=\frac{fe}{r^2D}\Bigl(\frac{n}{q_X^2D}-a\Bigr),\qquad \mathcal A=\frac{fn(a_t\cdot k_0)}{rD}.\tag{can:bulk}$$

**推导（这是全文的代数心脏，逐步展开）**：
1. **乘积法则**改写源加速度项：$-\frac Hr\partial_s^{(u)}g=-(Hg/r)'+(H/r)'g+(H/r)\partial_s^{(n)}g$。
2. **$a$ 变分**：固定 $u,n$，$\partial_a k_0[A]=\frac nD(A\cdot k_0)$；由 $a'=a_t\,d/D$，此项贡献 = 最后一项 $\frac{n(a_t\cdot k_0)}{rD^2}$。
3. **$r,n$ 项（含输运项）**：$\frac1r(\frac{k_0}{d})'_n-\frac{k_0r'}{r^2d}-\frac{k_0}{r^2q^2d^2}$。乘 $r^2d^2$ 得 $rd(k_0)'_n+k_0(N_0\cdot u-dr'-q^{-2})$。
4. **两条关键代数恒等式**（由 can:geometry 与 $|u|^2=1-q^{-2}$ 直接验证）：
$$N_0\cdot u-dr'-q^{-2}=-\frac{ed}{D},\qquad rd(k_0)'_n=-\frac{ed}{D}\Bigl(N_0+\frac{n(N_0\cdot a)}D\Bigr).$$
5. 最后 $|a|^2=1-q_X^{-2}$ 给 $N_0+\frac{n(N_0\cdot a)}D+k_0=\frac dD\bigl(a-\frac{n}{q_X^2D}\bigr)$——合并出中项 $\frac{e}{r^2D^2}(\frac{n}{q_X^2D}-a)$。乘测度因子 $fD$ 得 can:bulk。

**批注（相消的实质）**：微分锥几何（$(H/r)'g$ 与 $(H/r)\partial_s^{(n)}g$ 中的 $r',n',d'$）本会留下含源亏损 $d$ 的负幂项（最坏 $d^{-3}$）；与**输运核** $-\frac{Hg}{r^2q^2d}$ 合并后，$N_0\cdot u-dr'-q^{-2}=-ed/D$ 这条恒等式把所有 $d^{-1}$ 以上的幂全部吃掉——这就是 summary 中"IBP trades source acceleration for boundary and receiver acceleration coupling"以及"cancellation removed a source-angle singularity but left endpoint terms and a receiver-acceleration coefficient"的精确落点。体项 $\mathcal R,\mathcal A$ **既不含源加速度 $b$ 也不含 $d$ 的负幂**。
**[推测] 失败路线**：若省掉输运核（只对 $S_{\rm ker}$ 做分部积分），步骤 4 的 $-q^{-2}$ 项（来自输运核）缺位，$N_0\cdot u-dr'$ 不再化简，残留 $d^{-1}$ 幂，窄角区 $\theta\to0$ 时发散——**不筛选/不含输运项的签名估计在近锥方向死亡**。

#### 6.2 光滑 cutoff 与小扇区（can:cutoff-cancellation）

二进代表元 $p,\theta,\phi,h$（$q\asymp p$、$q_X\asymp w$、$d\asymp\theta^2$、$D\asymp\phi^2$、$r\asymp h$）。乘积 cutoff $\beta_j$（$j=(p,\theta,\phi,h)$），$\sum_j\beta_j=1$、局部有限、有界重叠；导数界取在闭支撑指示子上（**不假设**"导数被 bump 自身控制"——bump 不支撑在变号处）。

**引理 6.2（can:cutoff-cancellation，选定和的导数）**：$\mathcal S$ 为任一小扇区指标集，$\chi=\sum_{j\in\mathcal S}\beta_j$（选取可依赖区间与固定参数，**不可依赖被微分的变量**）。对源变量 $(q,u)$ 或几何变量 $(r,n)$ 单独微分：
$$\partial\chi=-\sum_{j\notin\mathcal S}\partial\beta_j.\tag{can:partition-cancel}$$
此导数仅在选定与未选定支撑相遇处非零；相遇处每坐标代表元相差至多 4 倍，$\theta/\phi$ 比至多变 16 倍，故仍在放宽的小扇区 $\theta\le16\kappa\phi$ 内。

**批注（cutoff 导数去哪了）**：求和恒等式先于限制到轨迹微分 ⟹ 选定集上的 cutoff 导数 = 落在未选定邻居上的等量导数，可直接指派给未选定的（已被直接估计覆盖的）邻居盒。summary："Repeated audits concentrated on whether this cancellation survived cutoffs" 的肯定答案就是本引理。注意它**只适用于先提出公共物理乘子之后的单个核的 cutoff 导数**，不比较两个不同核的导数。

#### 6.3 各导数的界（can:bulk-bounds、三类 cutoff 导数、时间权重、变投影）

Lorentz 加速度 $a_t=(\Id-a\otimes a)K/q_X$。小扇区向量界（can:vector-bounds）：
$$|e-D|\lesssim\phi\theta,\quad|k_0|\lesssim\theta/\phi,\quad|P_Xk_0|\lesssim\theta,\quad|P_Xn|\lesssim\phi$$
（$e-D=a\cdot(n-u)$，$a=n+(a-n)$ 分裂；$k_0=(u-n)+n(1-e/D)$）。体项界（can:bulk-bounds，用 $q_X^{-2}\lesssim D$、$|a_t|\lesssim|K|/w$、$|n\cdot a_t|\lesssim\phi|K|/w$、$|a_t\cdot k_0|\lesssim\theta|K|/w$）：
$$|\mathcal R|\lesssim f/r^2,\quad|P_X\mathcal R|\lesssim f\phi/r^2,\quad|\mathcal A|\lesssim\frac{f\theta|K|}{wr\phi^2},\quad|P_X\mathcal A|\lesssim\frac{f\theta|K|}{wr\phi}.$$

分部积分后 cutoff 导数有公共乘子 $fDk_0/(rd)$（$dt\,dy\,dv$ 测度），大小 $\le Cf\phi/(r\theta)$（投影后多 $\phi$）。三类导数：
- **源导数**：$\frac{|q'|}q+\frac{|d'_u|}d\lesssim\frac1p(\frac G\theta+\theta|B|)$ ⟹ 误差核 $\le C(\frac{f\phi}{rp\theta^2}G+\frac{f\phi}{rp}|B|)$——**与直接源力 majorant 相同**，可指派给未选定邻居（引理 6.2）。
- **几何导数**：$|r'|\lesssim1$、$|n'|\lesssim\theta/r$、$n'\perp n$ ⟹ $\frac{|d'_n|}d\lesssim r^{-1}$、$\frac{|D'_n|}D\lesssim\frac\theta{r\phi}\lesssim r^{-1}$ ⟹ $\le C\frac{f\phi}{r^2\theta}$，同样可指派。
- **接收者导数**：cutoff 中只有 $D$ 依赖 $a$：$\frac{|D'_a|}D=\frac{|n\cdot a_t|}D\frac dD\lesssim\frac{\theta^2|K|}{w\phi^3}$ ⟹ 乘 $fDk_0/(rd)$ 给 $\le C\frac{f\theta|K|}{wr\phi^2}$——**在选定支撑上直接估计**（不能指派）。投影后均多 $\phi$。

**时间权重**：Lipschitz 权重 $\psi(t)$ 的导数贡献 $\psi_t\chi\Pi\frac{fk_0}r$，$|fk_0/r|\lesssim f\theta/(r\phi)$。**变投影**：$\Pi=wP_X/|V_X|$（$|V_X|\asymp w$），$\|\Pi\|$ 有界、$\|\Pi_t\|\lesssim|K|/w$（微分单位方向），$\Pi_t$ 项 $\le\frac{f\theta|K|}{wr\phi}$——与投影接收项同尺寸（用 $|k_0|\lesssim\theta/\phi$，保留 $k_0$ 纵向部分）。

#### 命题 6.3（can:weighted-formula，加权签名公式）

设 $J=[t_1,t_2]$，$0\le\psi\le1$ Lipschitz、端点为零、零延拓；$\chi$ 为选定和；$\Pi(t)$ 有界 $C^1$ 矩阵（含 $\Pi=\Id$）。则可以逐标签对 can:label-identity 乘 $\psi\chi\Pi$ 积分：
$$\int_J\!\!\int\psi\chi\Pi\mathcal K_t\,dy\,dv\,dt=\mathcal B_0+\int_J\!\!\int\Bigl[\psi\chi\Pi(\mathcal R+\mathcal A)+\psi_t\chi\Pi\frac{fk_0}r+\psi\chi\Pi_t\frac{fk_0}r+\psi\Pi\frac{fDk_0}{rd}\chi'_s\Bigr]dy\,dv\,dt,\tag{can:weighted-terms}$$
$\mathcal K_t=fD\mathcal K$，$\mathcal B_0$ 是初始锥边界项；$\|\Pi\|\lesssim1$ 时 $|\mathcal B_0|\le C\int_J|\psi(t_0)|\,dt_0$（can:initial-boundary-bound）。

**推导**：碰撞标签零测可弃；其余标签连续性给 $r$ 逐标签下界（$|Y(t)-X(t)|\le2r$）；分支 $C^1$ 增；除 $s=0$ 进入点外所有积分端点处 $\psi=0$；$\psi_s=\psi_td/D$、$\Pi_s=\Pi_td/D$ 代回测度恒等式即得。**$s=0$ 边界项**：符号为正，被积式 $f_0(z)\psi(t_0)\chi\Pi(t_0)\frac{k_0}{t_0d(0)}$；固定初速度、参数化 $y_{\rm in}=X(t_0)-t_0n$（一一映射、Jacobian $t_0^2D$）；$d(0)$ 有下界（初动量紧支撑）、$Dk_0=Du-ne$ 范数有界 ⟹ 边界项 $\le C\int_J|\psi(t_0)|dt_0$。合法化：固定紧经典区间上 $d,D$ 正下界、加速度有界；换到 $dt\,dy\,dv$ 后被微核有可积 majorant $C_{\rm comp}f(r^{-2}+r^{-1})$；完全截断论证：插径向 cutoff（$r<\gamma$ 为 0），新导数项积分 $O_{\rm comp}(\gamma)\to0$；锥尖无边界残余。

**批注（时间权重的角色预告）**：$\psi$ 端点为零是 §closure"端点残段"问题的伏笔——签名估计天然只覆盖区间内部的加权部分，端点附近由旧 bootstrap（根号项）覆盖。

#### 6.4 后续筛选用的系数（can:receiver-coefficient）

固定接收者时刻，接收项/cutoff 接收项中 $|K|$ 的系数在单个小盒上积分后：
$$\frac Cw\min\Bigl(h^2(p\theta)^3,\ \frac1{p\theta h\phi^2}\Bigr).\tag{can:receiver-coefficient}$$
第一界：密度 $\int_{\rm bin}f\,dv\lesssim p^3\theta^2$ + $n$-球冠面积 $O(\phi^2)$ + $dy=r^2ds\,dn$。第二界：把核 $f\theta/(wr\phi^2)$ 除以粒子锥通量密度 $qdf$、用锥预算。投影后第一界多 $\phi$；$\Pi_t$ 项同投影尺寸。§direction 用第一（投影）界，§selection 用两侧 min。两个应用都**在微分 cutoff 时保持选定指标集固定**。

**批注（1024 在哪）**：本节尚未出现 1024；它属于 §closure/§setup 的尺度约定 $P\ge1024\max q$（让 $w\le P$、以及 $\Delta_n$ 论证里 $1024M2^n\sqrt{\Delta_n}$ 的首系数配平）。1024 的机械作用：把所有下游常数（$M,A$ 前的 $C$、$L$ 的下界）挤压到安全裕度内，使"至少一项 $\ge2^{n-2}$"的分配论证有固定余量。
**[推测] 失败路线**：若接收者系数（can:bulk-bounds 的 $|\mathcal A|\lesssim f\theta|K|/(wr\phi^2)$）求和后不能 $\lesssim w^{-1/2}$，签名估计右边出现 $|K|$——试图移项得 $|K|\le C|K|+\cdots$，当 $C\ge1$ 时无界；summary 中"derived incompatible exponent inequalities for a receiver-acceleration coefficient exceeding its proposed threshold: writing β=…、α=…, the improved occupancy bound forced β<0.41 while the excessive coefficient required β>0.496"正是这个死局的数值化（见第三节时间线）。

---

### §7 Direction changes and improved occupation（direction.tex）

**角色**：当两个粒子都高能、相对角居中时改进占据估计。新增信息 = **规定角大小的方向改变次数界**。证明只用符号 bootstrap + 基线估计（**不用**本节末证明的改进占据——避免循环）。$L=\log(2+P)$、$S(w)=P^2L/w$、$m=\min(p,w)$。

#### 引理 7.1（ang:direction，方向改变计数）

**陈述**：假设 eq:bootstrap 在 $[0,\tau]$。设二进 $w\ge P^{3/5}$，$J\subset[0,\tau]$ 闭区间长 $\le(w/P)^2$、其上支撑特征 $w/8\le q_X\le8w$。设
$$w^{-3/5}\le\delta\le w^{-1/10}.$$
从 $J$ 左端出发，每当方向 $\xi=V_X/|V_X|$ 与上一停时方向的弦距离首次达到 $\delta$ 就停（含最后不完整段）。$P$ 充分大时段数
$$N_c\le C(M,A)L^6/\delta.\tag{ang:count}$$

**推导（结构：停时长度下界 → 每段加权签号下界 → 求和吸收 $N_c$）**：
1. **每段长下界**：$|V_X|\asymp w$ ⟹ $|\xi(t)-\xi(s)|\le Cw^{-1}|V_X(t)-V_X(s)|$。取 $\ell=\min\{(\frac{w\delta}{MP})^2,\frac{w\delta}{AS(w)}\}$：bootstrap + 归一化界给长 $c\ell$ 区间上方向变化 $\le C(\sqrt c+c)\delta$，$c$ 小则每个完整首出区间长 $\ge c\ell$ ⟹ $N_c<\infty$。
2. **每段加权签名下界**（ang:weighted-exit）：每完整区间取端点为零的 Lipschitz 权 $\psi$（斜坡长 $c'\ell$、内部为 1）。斜坡上对被削权积分 $\xi_t$、减去外端点方向：被削权的导数 $L^1$ 范数为 1，故被削签号积分 $\le C(\sqrt{c'}+c')\delta$（bootstrap 只给**端点相对**增量——不用绝对方向变化界）。$c'$ 再缩小一次后每段 $|\int\psi\,w\xi_t\,dt|\ge\frac12w\delta$、$\int|\psi_t|dt=2$。
3. **代入签名公式**：$P_X=\Id-\xi\otimes\xi$、$\Pi=wP_X/|V_X|$、$w\xi_t=\Pi K$，对固定选取 $\{\theta<\kappa\phi,\ p\theta\sqrt h\le1\}$（ang:selection）用命题 6.3。权内部不交、和 $\le1$ ⟹ 体项误差在并集上用单一长度 $I$ 界定；**只有权的导数产生因子 $N_c$**。
4. **接收者/投影导数项无 $N_c$**：$\Pi_t$ 显式式 $-\frac w{\rho^2}[(\xi\cdot K)P_X+(P_XK)\otimes\xi+\xi\otimes(P_XK)]$、$|\Pi_tk_0|\le\frac{C\theta|K|}{w\phi}$。投影接收系数（ang:receiver-coefficient）$\frac{Ch^2(p\theta)^3\phi}w\le\frac{C\sqrt h\,\phi}w$（选定指标上用 $p\theta\sqrt h\le1$），$h,\phi$ 几何可和、$p,\theta$ 计数 $O(L^2)$ ⟹ 总系数 $CL^2/w$。基线绝对力 $\int_J|K|\le C(M,A)w^{3/2}L$。故全部接收/投影导数项 $\le C(M,A)w^{1/2}L^3$——**不带 $N_c$**。
5. **权导数项带 $N_c$**：核 $f\Pi k_0/r$ 的固定时刻系数 $Ch^2(p\theta)^3\phi^2\le C\sqrt h\,\phi^2$，和 $CL^2$；ang:weighted-exit 给总权导数代价 $CL^2N_c$。初始锥边界项 $\le C\int\sum\psi\,dt\le CI$，无胞数。
6. **其余体项**：小扇区外 $p\theta\sqrt h>1$ 使投影 good-field far 界可和；基线占据 $\mathsf M\le ChR^2/p$、$R=1+\sqrt{I/\lambda}$（未改进版！）；小扇区 $\lambda$ 定义给 $\sqrt I\,Rp\phi\le\frac{wp\phi}P+C\frac{w^2p}{Pm}(M+\sqrt{AL\phi})\le C(M,A)w\sqrt L$（ang:R-bound）。基线直接力 $\le C(M,A)wL$。good-field far 界 $C\sqrt I\,R\frac{\phi}{\theta\sqrt h}\le\frac{C(M,A)w\sqrt L}{p\theta\sqrt h}$，选取条件失败处分母 $>1$ ⟹ 只有 $O(L)$ 个径向二进、$O(L^4)$ 角动量 ⟹ $\le C(M,A)wL^5$。小 deficit 例外在调大 $C_1$ 后完全落入选取集（$p\theta\sqrt\lambda\le\frac{C\kappa C_0^2}{C_1m}\le1$）。源 cutoff 导数由引理 6.2 指派给未选定邻居；结构边 $\theta\asymp\kappa\phi$ 用其余扇区直接界。投影空间 cutoff 核 $Cf\phi^2/(r^2\theta)$ 基线平衡后 $\le C\sqrt I\,Rp\phi^2$，角动量和 $\le C(M,A)wL^4$；deficit 尺度用 near 界单独求和 $\le CIp^3/(P^2m^5)$ 后并入。
7. **收口**：$\tfrac12N_cw\delta\le C(M,A)wL^6+CL^2N_c$；由 $w\delta\ge w^{2/5}\ge P^{6/25}$，$P$ 大时末项被吸收。除以 $w\delta$、加上最后不完整段即得。

**批注（$w\ge P^{3/5}$ 与 $\delta$ 窗的机械理由）**：$w^{2/5}\ge P^{6/25}$ 是吸收 $CL^2N_c$ 的最小余量；$\delta\le w^{-1/10}$ 保证 $\delta/j'^{-1/10}$ 可控、$\delta\ge w^{-3/5}$ 保证 $\delta/j'^{-3/5}\to\infty$（下节引理 7.2 的假设检查）。
**[推测] 失败路线**：若 $\Pi$ 取常投影 $P_X$ 而不乘 $w/|V_X|$，$w\xi_t=\Pi K$ 不成立，签名公式右边出现未归一化量纲；若不构造斜坡权（直接在整段用 $\psi\equiv1$），段间边界无 $\psi=0$ 控制，被削签号积分失去 $(\sqrt{c'}+c')\delta$ 界——**段的"每段 $\ge\frac12w\delta$"就推不出**。

#### 引理 7.2（ang:improved-hit，中间角的改进占据）

**陈述**：小扇区盒满足窗（ang:window）：
$$p,w\ge P^{7/10},\qquad j^{-49/100}\le\phi\le j^{-4/25}\quad(j=p,w),$$
接收时间在长 $\le I\le(w/P)^2$ 的闭区间 $J$、能量 $[w/8,8w]$。令 $I_m^0=(m/P)^2$、$\beta=29/25$。$P\ge P_*(M,A)$ 时
$$\mathsf M\le C\frac hp\,\phi^{-\beta}\max\Bigl(1,\frac I{I_m^0},\frac h{I_m^0}\Bigr),\tag{ang:improved-occupation}$$
$C$ **独立于 $M,A$**。

**推导**：
1. **窗的余量**（ang:margins）：$m\phi\ge m^{51/100}$（actual 性）、$m^{-2}/\phi\le m^{-151/100}$（速度模亏损 $\ll\phi$）、$\phi\le P^{-14/125}$。
2. **$h>\lambda_0$ 免疫**：$Q_0=C_2(M^2+AL)$、$\lambda_0=I_m^0/Q_0$。$\phi^{-\beta}\ge Q_0$（$P$ 大）⟹ $h\phi^{-\beta}\ge I_m^0$，能量估计 $\mathsf M\le\max(I,h)$ 已被右边控制。
3. **$h\le\lambda_0$ 胞论证**：源时间切 $\lambda_0$ 胞；命中源时刻在长 $\le C(I+h)$ 内 ⟹ 至多 $C(1+(I+h)/\lambda_0)$ 个胞有贡献。胞右延 $C_Th$。胞内稳定性：bootstrap 在长 $C_T\lambda_0$ 上两项 $\le Cm/\sqrt{C_2}$、$Cm/C_2$，$C_2$ 大排除首出（**这里的稳定窗只保 $q\asymp p,w$，不保角度**——与基线 $\lambda$ 的本质区别：$\lambda_0$ 不随 $\phi$ 收缩）。
4. **方向分割**：对每个用引理 7.1 的场合取最接近参考命中能量的二进 $j'$（接收者 $w$、源 $p$）；$j'\ge P^{3/5}$、$\delta=c_2\phi$ 满足 $\delta/j'^{-3/5}\ge cj^{11/100}\to\infty$、$\delta/j'^{-1/10}\le Cj^{-3/50}\to0$。公共接收者方向分割胞数 $\le C(M,A)L^6/\phi$；每个标签独立取源方向分割（同界）。
5. **坏/好命中**：坏 hit = 接收方向分割的边界落在 $[s,t]$ 内；坏时长 $\le C(M,A)hL^6/\phi$（只用 $t-s$，不用 $dt/ds$）。好 hit：$s,t$ 同一接收方向胞，方向变化 $\le2c_2\phi$、速度亏 $O(w^{-2})$ ⟹ $|Y(s)-X(s)|\le Ch\phi$（ang:small-separation）。
6. **联合单调穿越**：胞上联合细分（两分割胞数和 +1）；含好 hit 的联合区间内取该 hit 为参考，actual 小角几何给 $|u(s)-a(t)|\ge c\phi$，替换 $a(t)\to a(s)$ 改变 $\le Cc_2\phi+Cm^{-2}$；取 $c_2$ 小、$P$ 大后存在固定单位向量 $e_F$（依标签与联合区间）使 $e_F\cdot(u(s)-a(s))\ge c\phi$ 全程成立 ⟹ $e_F\cdot(Y-X)$ 严格增、导数 $\ge c\phi$；好 hit 值在长 $\le Ch\phi$ 区间内 ⟹ 联合区间内好 hit 总时长 $\le Ch$（多分量也成立）。求和 + 坏项 = ang:label-duration $C(M,A)hL^6/\phi$。
7. **质量与组装**：命中 $F$ 的标签质量 $\le C/p$（公共时刻能量 $\ge cp$ + 总能量守恒；闭合支撑约定使命中集是紧投影，可测；**标签级参考命中与方向分割只需证明数值界、无需可测**）。乘时长、数胞：
$$\mathsf M\le C(M,A)\frac hp\phi^{-1}L^7\max\bigl(1,\tfrac I{I_m^0},\tfrac h{I_m^0}\bigr).\tag{ang:before-absorption}$$
最后 $\beta-1=\frac4{25}$：$\phi^{-(\beta-1)}\ge P^{56/3125}$，正幂吸收 $C(M,A)L^7$（$P\ge P_*(M,A)$）⟹ 常数独立于 $M,A$。

**批注**：
- $\phi^{-\beta}$ 与基线的 $k_1\sim1+\phi/\sigma$（小扇区 $k_1=1$）相比，本质增益是把"速度容差 $\omega=\phi$"换成了"方向容差 $\delta=c_2\phi$ 的有限次切换"——穿越次数从 $\lambda^{-1}$（受 bootstrap 线性项限制）变成 $L^6/\phi$（受方向计数限制）。
- **[推测] 失败路线（对应 summary 的 β<0.41）**：若把窗设得更宽（$\phi$ 更小端 $j^{-\gamma}$、$\gamma$ 更大），方向分割胞数 $L^6/\phi$ 变大、坏命中时长按 $\phi^{-1}$ 增长，最终 $\mathsf M$ 的 $\phi$ 指数只能压到 $\beta<1$；而 selection 阶段为压接收者系数要求 $\beta\ge$ 某阈值（summary 中 0.496 对应的量）——两端夹不出公共值时签名 bootstrap 闭不了口。论文的化解：窗只取 $\phi\in[j^{-49/100},j^{-4/25}]$ 这一段"中间角"，把 $\phi$ 指数钉在 $\beta=29/25=1.16$，且窗外由 selection 的排除机制处理。
- **[推测] 失败路线（不筛选的后果）**：若对所有角度都用改进占据而不设窗，$\phi\gtrsim1$ 的大角区 $\phi^{-\beta}<1$ 方向变负——计数论证反而不成立；这正是"need only hold in the stated angular window"的原因。

---

### §8 Selecting the signed part of the force（selection.tex）——筛选与指数矛盾

**设定**：固定接收者与区间 $J=[t_1,t_2]$（长 $I>0$、$w/8\le q_X\le8w$、$I\le(w/P)^2$）。基线界 $\mathcal B(I,w)=P\sqrt I+(M+\sqrt A)IS(w)$（sel:baseline），绝对力 $\int_J|K|\le C\sqrt w\,\mathcal B(I,w)$（sel:absolute）。**$\sqrt w$ 多余因子将由接收项在签名分部积分后的小系数抵消**。固定参数（sel:epsilon）：$\epsilon=10^{-5}$、$\beta=1.16$（注意 §7 用的是分数 $29/25=1.16$，这里是同一值）。

#### 8.1 筛选与可和权重（sel:pure、sel:weight、sel:selection、引理 8.1）

**三个占据纯界**（sel:pure；$\mathsf M_*$ = 适用条目的 min，"displayed entries contain no implicit constants"——筛选是代表元之间的**精确**不等式）：
$$\begin{array}{c|l}
\text{条目}&\text{纳入条件}\\\hline
\max(I,h)/p&\text{总是}\\
(h/p)\max(1,I/\lambda,h/\lambda)&\phi>C_0/m\\
(h/p)\phi^{-\beta}\max(1,I/I_m^0,h/I_m^0)&p,w\ge P^{.7},\ j^{-.49}\le\phi\le j^{-.16}\ (j=p,w)
\end{array}$$

**可和权重**（sel:weight）：$W=(P\theta)^{-\epsilon}\phi^\epsilon h^\epsilon$。一鱼两吃：未选定盒的 good-field 直接估计 $\le CP\sqrt I\,W$；选定盒的 $|K|$ 系数将证明 $\le Cw^{-1/2}W$——求和后恰抵 sel:absolute 的 $\sqrt w$。

**筛选判据**（sel:selection）：小盒被选定 ⟺
$$\min\Bigl\{I\sqrt h\,p^2\phi^2,\ \frac{\sqrt I\sqrt{p\mathsf M_*}}{\theta h}\Bigr\}>P\sqrt I\,W$$
（近/远 good-field 界中较大者仍超阈值）。指标集在 $J$ 上固定 ⟹ **微分 cutoff 不会微分筛选**。

**引理 8.1（sel:weight-sum）**：$\sum W$ 有界（$\theta$ 和 $\sum_{\theta\ge1/p}(P\theta)^{-\epsilon}\le C_\epsilon(p/P)^\epsilon$，其余几何）；未选定小扇区 good-field 总积分 $\le CP\sqrt I$。

#### 8.2 选定盒上的接收者系数——指数矛盾（引理 8.2，sel:exponents）【全文最精巧的论证】

**陈述**：固定 $M,A$，存在 $P_*(M,A)$ 使每个选定指标满足**精确代表元不等式**
$$U\le w^{-1/2}W,\qquad U=w^{-1}\min\{h^2(p\theta)^3,(p\theta h\phi^2)^{-1}\}.\tag{sel:safe}$$
$U$ 是接收项系数（来自 can:bulk-bounds 的 $\mathcal A$ 与 can:receiver-cutoff-bound，majorant $Cf\theta|K|/(wr\phi^2)$，经密度界与锥通量界得 min）。

**推导（反证三步，幂指数记法）**：
把代表元写成 $P$ 的精确幂（sel:powers）：
$$p=P^{1-\alpha},\quad w=P^z,\quad c=1-z,\quad p\theta=P^b,\quad\phi=P^{-y},\quad h=P^{-H},\quad\Delta=\epsilon(\alpha+b+y+H),$$
$\alpha,z,c,b,y,H\ge0$、$z+c=1$、$W=P^{-\Delta}$。十进小数都是精确有理数。

**Step 1：不安全的选定盒必有 actual 速度分离。**
近选取给 $2\alpha+\frac H2+2y<z+\Delta$（sel:near-exponent）；远选取用纯能量界给 $b<\frac H2-\alpha+\Delta$（$H\le2c$）或 $b<H-c-\alpha+\Delta$（$H>2c$）（sel:far-energy）。记 $d_*=\alpha+b+y+H$，得 $d_*\le2H+y+\Delta<4z+5\Delta$，从而 $z>0$、$\Delta<\frac4{99995}z<.001z$（sel:delta-small）——**到这里只用纯能量界**。

假设 sel:safe 失败：min 的两项都 $>w^{-1/2}W$，即（sel:unsafe）
$$b>\frac{2H}3+\frac z6-\frac\Delta3,\qquad b<H+2y-\frac z2+\Delta.$$
若 $H\le2c$，sel:far-energy 第一支与 sel:unsafe 第一条给 $H+z+6\alpha<8\Delta<.008z$——不可能。故 $H>2c$，另一支给
$$H>\frac z2+3(\alpha+c)-4\Delta>.496z+3(\alpha+c).\tag{sel:H-lower}$$
与近选取合并：$3.5\alpha+1.5c+2y<.753z$、$z>\frac{500}{751}>.66$、$y<.377z-1.75\alpha-.75c$（sel:actual-margin）；于是 $m\phi>P^{.3}$——盒是 actual。

**Step 2：稳定胞占据把这个盒逼进改进窗。**
$\rho=\max(\alpha,c)$、$\lambda^{-1/2}\le C_1(M+\sqrt{AL})P^{\rho+y}\le P^{\rho+y+.001z}$（$P\ge P_*$，因 $z>.66$ 阈值对指标一致）。$I,h\le P^{-2c}$、$\rho\ge c$，actual 纯界给 $\sqrt{p\mathsf M_*}\le P^{-H/2+\rho-c+y+.001z}$；远选取给 $b<\frac H2-\min(\alpha,c)+y+.002z$（sel:far-actual）。与 sel:unsafe 第一条比较、再用近选取：$2y>\frac H3+.328z+2\min(\alpha,c)$、$H<.8076z<.81z$（sel:middle）。与 sel:H-lower 合并：$\alpha+c<.105z$、$z>\frac{200}{221}>.90$、$1-\alpha>.895$（sel:high-momenta）。sel:unsafe 两条还给 $y>\frac z3-\frac H6-\frac{2\Delta}3>.19z$。于是窗两端检查：$y>.171>.16\max(z,1-\alpha)$（下端）；记 $Y=.377z-1.75\alpha-.75c$，$.49z-Y=.113z+1.75\alpha+.75c>0$、$.49(1-\alpha)-Y=.113z+1.26\alpha+1.24c>0$（上端）。故
$$ .16\max(z,1-\alpha)<y<.49\min(z,1-\alpha),$$
与 sel:high-momenta 一起**恰好是**改进占据条目的纳入条件。

**Step 3：改进占据与不安全系数矛盾。**
$I_m^0=P^{-2\rho}$，改进条目给 $\sqrt{p\mathsf M_*}\le P^{-H/2+\rho-c+\beta y/2}$；远选取与 sel:unsafe 给 $\beta y>\frac H3+.33z+2\min(\alpha,c)$。另一方面，近选取乘 $\beta/2=.58$、用 sel:delta-small：$\beta y<.58z-.29H+.58\Delta<.582z-.29H$。两式比较得 $H<\frac{378}{935}z<.41z$——**与 sel:H-lower 的 $H>.496z+3(\alpha+c)\ge.496z$ 矛盾**。∎

**批注（β<0.41 vs γ>0.496 的来源——回应任务要求）**：
- summary 中"writing β=… and the distance scale as …, the improved occupancy bound forced β<0.41, while the excessive coefficient required β>0.496"对应的正是一对指数 $H/z$（距离尺度相对动量比的幂）：远选取（系数小）要求 $H>0.496z$，而改进占据 + 近选取要求 $H<0.41z$。
- 0.41 的分子分母：$\beta y<.58z-.29H$（来自近选取系数 .58=β/2）与 $\beta y>\frac H3+.33z$（来自远选取+改进占据）夹出 $\frac H3+.33z<.58z-.29H$ ⟹ $H(1/3+.29)<.25z$ ⟹ $H<0.407z\approx.41z$。0.496 来自远选取纯能量界的 $H>\frac z2+3(\alpha+c)-4\Delta$ 减去余量 $4\Delta<.004z$。
- **[推测] 失败路线（矛盾具体怎么出现）**：若 $\beta$ 取更小（如 $\beta=1$，即不做方向计数改进、只用 $\phi^{-1}$），Step 3 的下界 $\beta y>\frac H3+.33z+2\min(\alpha,c)$ 变弱而上界 $\beta y<(\beta/2)z-.29H$ 变强，矛盾区间可能闭合——事实上 $\beta=1$ 时上界 $y<.5z-.5H$、下界 $y>\frac H3+.33z$ 给 $H<0.2z$，更矛盾！真正的敏感点在 Step 2 的稳定胞占据：$\rho$ 项依赖 $\lambda$（含 $M,A$），若不先把盒逼进改进窗（其中占据界独立于 $M,A$），$\sqrt{p\mathsf M_*}$ 的指数带 $M,A$ 依赖，无法与纯幂不等式闭合。**若不筛选**：所有小盒都走签名公式，接收系数 $U$ 在 $p\theta h\phi^2$ 大的盒上取第一支 $h^2(p\theta)^3$——求和无 $\epsilon$ 权重控制，$\sum U\cdot\sqrt w\mathcal B$ 爆破。
- **[推测] 若稳定窗不缩短（$\lambda$ 换成更大的窗）**：Step 2 中 $\lambda^{-1/2}\le P^{\rho+y+.001z}$ 的 $+.001z$ 余量消失，actual 纯界的指数估计失去一致性，"逼进改进窗"的窗口两端检查失败——改进条目不适用，Step 3 无从谈起。

#### 8.3 空间过渡（sel:spatial-sum）——"不能引入新的 log"

空间 cutoff majorant（sel:spatial-kernel）：$C\frac f{r^2}\frac\phi\theta$。由引理 6.2，选定 cutoff 的偏导和 = 未选定和的负数，支撑在重叠处（邻域代表元比 $\le4$）。对固定 $p,\phi$，$R=1+\sqrt{I/\lambda}\sqrt{\mathcal E_{p\phi}}$、$\sum\mathcal E_{p\phi}\le C$（$R$ 独立于 $\theta,h$——**每次使用都如此**）。deficit 例外外，near/far 界（sel:spatial-near-far）：
$$C\min\Bigl\{Ihp^3\theta\phi^3,\ \frac{R^2}{ph\theta\phi}\Bigr\}.$$

**引理 8.3**：总空间 cutoff 误差 $\le C\mathcal B(I,w)$。证明要点：
- 结构邻居（$\theta\ge\kappa\phi$、与选定支撑重叠）：$\theta/\phi$ 被钉在 $\kappa$ 的固定倍数 ⟹ 每个 $\phi$ 只有有界个 $\theta$；$h$ 平衡给 $C\sqrt I\,Rp\phi$，用共享预算计算 $\le C\mathcal B(I,w)$。
- 其他重叠未选定盒：定义过渡半径 $h_0$（sel:h0）：$I\sqrt{h_0}p^2\phi^2=P\sqrt I(P\theta)^{-\epsilon}\phi^\epsilon h_0^\epsilon$。near 量/阈值 $=(h/h_0)^{1/2-\epsilon}$，故与选定邻居重叠 ⟹ $h\ge ch_0$；near 失败 ⟹ $h\le h_0$（只有有界个径向二进）。
- 过渡盒代价 $\le C\min(n_0,f_*)$，$n_0=Ih_0p^3\theta\phi^3$、$f_*=\frac{R^2}{ph_0\theta\phi}$、$D_0=\sqrt{n_0f_*}=\sqrt I\,Rp\phi$。far 失败盒用 $\mathsf M\le CP^2W^2\theta^2h^2/p$ 代入 far 空间界得附加估计 $\frac{CP^2W^2\theta}{p\phi}=Cn_0(h/h_0)^{2\epsilon}$；$h\ge ch_0$ 上求和给（sel:radial-crossing）
$$C\begin{cases}f_*&f_*\le n_0\\ n_0^{1/(1+2\epsilon)}f_*^{2\epsilon/(1+2\epsilon)}&f_*>n_0\end{cases}$$
（把 $\sum_h\min(n_0t^{2\epsilon},f_*/t)$ 在 $t=(f_*/n_0)^{1/(1+2\epsilon)}$ 分割，两侧几何）。
- **关键的 $\epsilon$ 技巧**：$h_0\propto\theta^{-\epsilon/(1/2-\epsilon)}$、$n_0\propto\theta^\gamma$、$\gamma=\frac{1-4\epsilon}{1-2\epsilon}>0$；$D_0$ 独立于 $\theta$，令 $x=n_0/D_0$ 后界变成 $CD_0\begin{cases}x^{(1-2\epsilon)/(1+2\epsilon)}&x\le1\\x^{-1}&x\ge1\end{cases}$——**两个 $\theta$ 尾都是几何和**，总和 $\le CD_0$，**无额外 log**。
- deficit 例外（$\lambda\le CP^{-2}$、$\phi\le C/m$）：near 空间界求和 $\le CIp^3\phi^4/P^2$，动量权 $\le1/(P^2p)$（$p\le w$）或 $P/w^4$（$p>w$），全部进 $CIS(w)$——**在 far 占据界不可用的地方不用它**。

**批注**：$\gamma=\frac{1-4\epsilon}{1-2\epsilon}>0$ 正是 $\epsilon>0$ 存在的全部理由：$\epsilon=0$ 时 $\gamma=1$ 仍正，但 $(P\theta)^{-\epsilon}$ 权消失后 $W$ 退化、sel:h0 的比率 $(h/h_0)^{1/2-\epsilon}$ 变成 $h^{1/2}$ 无法与阈值比较——$\epsilon$ 是把"结构边界两侧的锐利过渡"磨成"几何可和的幂律过渡"的最小手段。

#### 8.4 时间权重（sel:time-weight）

$\psi$：端点为零、斜坡长 $\eta I$ 的单调斜坡、内部 1，$|\psi_t|\le C/(\eta I)$。时间权 majorant（can:time-weight-bound）$C_\eta f\theta/(Ir\phi)$。**引理 8.4**：总时间权导数 $\le C_\eta\mathcal B(I,w)$。证明：$h\le I$ 时 majorant/$f\!\cdot r^{-2}\le C_\eta h\theta/(I\phi)\le C_\eta$，套用中心项估计；$h>I$ 时近积分除以 $P\sqrt I$ 得（sel:long-weight）$\frac{C_\eta h^2p^3\theta^3\phi}{P\sqrt I}\le C_\eta h(p/P)^5\phi^3W^{-4}$（第一步用近选取不等式；第二步用远选取 + 纯界 $\mathsf M_*\le h/p$ 得 $P\theta\sqrt h<W^{-1}$，即 $(P\theta)^{1-\epsilon}<\phi^{-\epsilon}h^{-1/2-\epsilon}$）。对递增因子 $(P\theta)^{4\epsilon}$ 求和后剩 $C_\eta(p/P)^5h^{1-6\epsilon/(1-\epsilon)}\phi^{3-4\epsilon/(1-\epsilon)}$——两指数皆正，$h,\phi,p$ 几何求和 $\le C_\eta P\sqrt I$。

#### 8.5 加权签名估计（命题 8.5，sel:bulk-impulse）

**陈述**：$P\ge P_*(M,A)$ 时
$$\Bigl|\int_J\psi(t)K(t)\,dt\Bigr|\le C_\eta\bigl[P\sqrt I+(M+\sqrt A)IS(w)\bigr],\tag{sel:bulk}$$
$C_\eta$ 独立于 $M,A$。

**推导**：选定 cutoff 和 $\chi$，分裂 $T_{\rm ker}+S_{\rm ker}=\chi(\cdot)+(1-\chi)(\cdot)$。**虽然筛选判据用 good-field majorant $S_g$，选定项仍含输运核**（引理 6.1 的要求）——对它用命题 6.3（$\Pi=\Id$），补集用直接界。未选定 good-field、空间导数、时间权导数由引理 8.1/8.3/8.4 界定；源导数、中心签名项、未选定输运与磁余项、结构邻居已由 $C_\eta\mathcal B(I,w)$ 界定；初始锥边界 $CI\le CP\sqrt I$；端点权 $\psi$ 消去时间边界。接收项：引理 8.1 + 8.2 给每个接收时刻 $\sum_{\rm selected}CU\le Cw^{-1/2}$，乘 sel:absolute 后总积分 $\le C\mathcal B(I,w)$。所有求和用固定几何指数、常数独立于 $M,A$；唯一放大 $P$ 阈值发生在引理 8.2。

**批注（第二次使用签名估计的全貌）**：这里 $\Pi=\Id$（全力），与 §7 的 $\Pi=wP_X/|V_X|$（垂直投影）不同——同一个恒等式 can:weighted-terms 两次实例化，分别喂给方向计数与动量增量。

---

### §9 Closing the signed-increment bootstrap（closure.tex）——连续性收口

**目标**：证明命题 1.4（prop:increment）。前面所有估计都以 eq:bootstrap 为条件；常数允许**一致严格改进**（改进到一半），再用连续性去掉假设。

#### 端点截断与严格改进

固定长 $I$ 的区间 $[t_1,t_2]$、$w/8\le q_X\le8w$。完整 bootstrap 界 $\mathcal B_w(I)=MP\sqrt I+AIS(w)$。

**平凡情形**：若 $\mathcal B_w(I)\ge32w$，则 $|V_X(t_2)-V_X(t_1)|\le q_X(t_2)+q_X(t_1)\le16w\le\frac12\mathcal B_w(I)$——能量守恒直接给。否则（$M\ge32$）得 $I\le(w/P)^2$，进入前面估计的适用范围。$I=0$ 平凡。

**加权主体**：取斜坡长 $\eta I$ 的端点为零权 $\psi$，加权签名估计（sel:bulk）给 $|\int\psi K|\le C_\eta[P\sqrt I+(M+\sqrt A)IS(w)]$。

**端点恢复（不用绝对力！）**：左端 $\chi=1-\psi$、$F(t)=V_X(t)-V_X(t_1)$，分部积分
$$\int\chi K=-\int\chi'F,$$
斜坡单调性给 $\int|\chi'|=1$，每个 $F(t)$ 由 bootstrap 界 $\le\mathcal B_w(\eta I)$；右端同理锚定 $t_2$。合并：
$$|V_X(t_2)-V_X(t_1)|\le(C_\eta+2M\sqrt\eta)P\sqrt I+\bigl[C_\eta(M+\sqrt A)+2A\eta\bigr]IS(w).\tag{eq:closure-improvement}$$

**常数链（这是 8C≤M / 16CM≤A / 256C²≤A 型凑法的论文版本）**：
选 $\eta$：$2\sqrt\eta\le\frac18$ 且 $2\eta\le\frac18$（即 $\eta\le1/256$）；定 $M\ge\max(32,8C_\eta)$；再定 $A\ge\max(1,16C_\eta M,256C_\eta^2)$。则右边 $\le\frac14\mathcal B_w(I)$，特别 $\le\frac12\mathcal B_w(I)$。最后定 $P_0$（可依赖 $M,A$）。得一致严格改进
$$|V_X(t_2)-V_X(t_1)|\le\tfrac12\mathcal B_w(t_2-t_1).\tag{eq:strict-improvement}$$

**批注（常数顺序为什么不可换）**：$\eta$ 只影响 $C_\eta$ 与 $2\sqrt\eta,2\eta$ 的分数——必须最先定，否则 $M$ 的下界会依赖 $\eta$ 而循环；$M$ 出现在 $A$ 的下界 $16C_\eta M$ 里，故 $A$ 后定；$P_0$ 依赖 $M,A$ 最后定。**这与 §setup 宣告的"选取顺序：时间斜坡分数 → M → A → P 阈值"逐字对应**。$C_\eta$ 里的 $\eta$ 依赖经 $\eta\le1/256$ 的选择被冻结成一个固定数值常数。
**[推测] 失败路线**：若端点残段不用"符号 bootstrap 的分部积分"而用绝对力 $|K|\le C P^2$ 估计，边贡献 $CI\sim C\eta I$ 无 $P,\sqrt I$ 结构，无法被 $\frac14\mathcal B_w$ 吸收（当 $w\ll P$ 时 $IS(w)\gg I$ 才有余量；而根号项端 $MP\sqrt{\eta I}$ 与 $\eta$ 的 $\sqrt$ 缩放恰好匹配——$2M\sqrt\eta\le M/8$ 正是为此）。

#### 连续性论证

固定 $P\ge P_0$ 满足 eq:P-range。令 $\mathcal T=\{\tau\in[0,t_*]:\text{eq:bootstrap 对 }[0,\tau]\text{ 内所有合格接收者/尺度/区间成立}\}$。
- 含 0、是初始区间；
- **闭**：把非平凡合格区间的端点用递增序列从下方逼近，用 $V_X$ 连续性 + 范围条件在截断下保持；
- **右相对开**：固定紧解区间上 $|K|\le C_*$（所有支撑特征一致界），故长 $\le\ell_0$ 的区间自动满足 bootstrap（$C_*I\le MP\sqrt I$）；若 $\tau\in\mathcal T$，更长区间的**前缀**（到 $\tau$ 止）由严格改进占 $\le$ 全界一半，**后缀**冲量 $\le C_*\varepsilon$，$\varepsilon$ 小时小于剩余余量——一致地，因为全界 $\ge MP\sqrt{\ell_0}$；起点在 $\tau$ 之后的区间当 $\varepsilon<\ell_0$ 时是短区间。故 $\mathcal T=[0,t_*]$。

**批注**：$C_*$ 只用于固定 $P$ 下传播 bootstrap，**不进入 $M,A,P_0$**——这个区分保住了 setup 中动量倍增论证所需的一致性（否则 $\Delta_n\ge c/\log(\cdot)$ 的常数 $c$ 会依赖 $n$）。

### §10 Local theory and continuation（continuation.tex 预告，详见下文取证）

命题 prop:continuation = Luk–Strain Theorem 1.1（$H^5$ 形式 + 脚注 1）+ §continuation 的**场修正**：保留初始 Coulomb 场、对无散余项截断向量势、被去掉部分作为真空 Maxwell 场演化并在选定视界内于粒子区域恒为零——给延续定理提供 Sobolev 场数据而不改变粒子动力学。

---

### §10 Local theory and continuation for finite-energy fields（continuation.tex）——初值场非 $H^5$ 难题的正面攻坚

**核心难题**：定理的初值场只需 $C_b^\infty\cap L^2$（各阶导数有界但不一定平方可积），而 Luk–Strain 延续判据要求 $H^5$。策略：**先做 Sobolev 场的局部理论，再把粒子球外的场换掉并保持约束，用一个真空场在有限视界内"传送"两种数据之间的解**。

#### 10.1 特征线与 Maxwell 演化（cont:characteristics、cont:maxwell-duhamel、cont:local-energy）

- 特征系统在任意 $C^1$ 场的闭区间上整体存在：$|\dot X|\le1$ 把 $X$ 限制在紧球，场上紧时空柱上有界 ⟹ $|\dot V|$ 有界。输运给 $f(t,X,V)=f_0$、$\supp_xf\subset\{|x|\le R_0+t\}$。相空间向量场零散度（$u=\nabla_v(1+|v|^2)^{1/2}$，$\nabla_v\cdot(u\times B)=0$）⟹ 正性与 $L^\infty$ 保持；$\partial_t\rho_f+\nabla\cdot j_f=0$ 传播两个散度约束。
- **一阶 Maxwell 演化**（不需要散度约束）：Fourier 生成元 $A(\xi)=\begin{pmatrix}0&iC_\xi\\-iC_\xi&0\end{pmatrix}$ 反自伴 ⟹ $U(t)$ 是 $L^2$ 与每个 $H^k$ 上的强连续酉群；Duhamel（cont:maxwell-duhamel）给 $\|F(t)\|_{H^k}\le\|F(0)\|_{H^k}+\int_0^t\|j_f\|_{H^k}ds$。
- **无全局可积性假设的有限传播**：局部能量恒等式 $\partial_te+\nabla\cdot(E\times B)=-E\cdot j$、$|E\times B|\le e$，对收缩球 $B(x,r+t-s)$ 积分：零初值 + 零电流的向后锥 ⟹ 终端球上为零（边界项 $\le0$）。不用全局 $L^2$ 也不用约束。

#### 引理 10.1（cont:exterior，外部比较）

$C^1$ 解在 $[0,S]$、$f_0$ 紧支撑、$F(0)\in\bigcap_kH^k$ ⟹ 场在 $C([0,S];L^2)$、一阶空间导数在整块上一致有界，且 $F(t,x)=U(t)F(0)(x)$ 若 $|x|>R_0+t$。**推导**：$j_f$ 在 $|x|\le R_0+t$ 外为零；$F^h=U(t)F(0)$ 光滑（一致 Sobolev 界）；差 $W=F-F^h$ 零初值、电流 $j_f$；$|x|>R_0+t$ 处取 $r<|x|-R_0-t$，向后锥上电流为零，局部能量给 $W=0$ ⟹ $W$ 支撑在固定球 $|x|\le R_0+S$，紧柱上 $C^1$ 给 $C_tL^2$ 与一阶导界。**注意 $F^h$ 电散度可非零——只用了分量自由波动方程意义上的一阶 Maxwell 组**。

#### 10.2 经典唯一性与局部 Sobolev 解（cont:uniqueness-energy、cont:tame、GN 不等式、Picard）

- **经典唯一性**：两解之差 $g,\delta F$ 满足输运方程（右端 $-(\delta E+u\times\delta B)\cdot\nabla_vf_2$）；零相散度、紧支撑、$\|j_{f_1}-j_{f_2}\|_{L^2}\le C_R\|g\|_{L^2}$；输运 + Maxwell 能量积分（用 cutoff $\chi(x/N)$ 合法化，边界误差 $\to0$，**不需要平方可积场导数**）+ Gronwall 得零。
- **整数值 Gagliardo–Nirenberg**（cont:integer-interpolation）：$\|D^jg\|_{L^{2s/j}}\le C\|g\|_\infty^{1-j/s}\|D^sg\|_2^{j/s}$。**证明自带**：分部积分一次给 $A_j^2\le CA_{j-1}A_{j+1}$，取 $b_j=\log A_j-\ldots$ 得 $2b_j-b_{j-1}-b_{j+1}\le\log C$，**离散最大值原理**（减去 $\frac12(\log C)j(s-j)$ 后）给 $b_j\le\frac12(\log C)j(s-j)$；一般类用截断 + mollify + Fatou。tame 乘积（cont:tame-product）：$\|D^\alpha gD^\beta h\|_2\le C_s(\|g\|_\infty\|h\|_{H^s}+\|h\|_\infty\|g\|_{H^s})$——**系数无高于一阶的导数**。
- **tame 估计**（cont:tame）：$Y_k=\|f\|_{H^k(\R^6)}+\|F\|_{H^k(\R^3)}$，动量支撑 $\le R$ 的光滑解满足
$$Y_k(t)\le Y_k(0)+C_{k,R}\int_0^t\bigl(1+\|F\|_{W^{1,\infty}_x}+\|\nabla_{x,v}f\|_\infty\bigr)Y_k\,ds.$$
推导：对 Vlasov 做 $(x,v)$ 至多 $k$ 阶微分、$L^2$ 配对；主输运项因零散度消失；落 $u$ 上的导数有界只花 $\|f\|_{H^k}$；力项用动量 cutoff $\zeta_R$ 后 $a_R=\zeta_R(E+u\times B)$，$\|a_R\|_{H^k(\R^6)}\le C_{k,R}\|F\|_{H^k(\R^3)}$、$\|\nabla a_R\|_\infty\le C_R\|F\|_{W^{1,\infty}}$，交换子积用 tame-product；$\|j_f\|_{H^k_x}\le C_R\|f\|_{H^k}$（$v$ 的 Cauchy–Schwarz）+ Duhamel。
- **Picard 迭代（局部构造，重启时间显式）**：线性输运（力 $F^n$）+ 线性 Maxwell（电流 $j_{f^n}$）交替。$H^6(\R^6)$ 控制 $L^\infty$ 一阶导 ⟹ 动量支撑仍在固定球内时 $Y_6^{n+1}\le Y_6(0)+C_R\int((1+Y_6^n)Y_6^{n+1}+Y_6^n)$；取 $M>2(Y_6(0)+1)$、$\tau$ 小（依 $M,R_v$），归纳 $Y_6^n\le M$、再缩 $\tau$ 使动量增 $\le1$（$|\dot V|\le CM$），闭支撑条件 $R=R_v+1$。相邻迭代 $L^2$ 差 $D_{n+1}\le C_{R,M}\int D_n$，$C_{R,M}\tau<1/2$ 使迭代在 $C_tL^2$ 中 Cauchy；高阶 $Y_k^{n+1}\le Y_k(0)+C\int(Y_k^{n+1}+Y_k^n)$，指数上界 $Y_k(0)e^{2Ct}$；$L^2$ 收敛与一致 $H^{k+1}$ 界插值 ⟹ $C_tH^k$ 收敛（每个 $k$）；极限保持正性、紧支撑、约束；Sobolev 嵌入 + 方程给时空光滑。**关键：公共寿命 $\tau$ 只依赖 $Y_6(0)$ 与初始动量半径，不依赖更高范数**——重启论证的生命线。

#### 引理 10.2（cont:vacuum，光滑有限能量真空场）

无散 $D_E,D_B\in C_b^\infty\cap L^2$ ⟹ 全局光滑真空 Maxwell 解（$C_tL^2$、每个有限块上各阶导数有界）；若数据在 $B(0,L)$ 上为零则 $|x|+t<L$ 处为零。**推导**：球均值公式 $M_tg=(4\pi)^{-1}\int_{S^2}g(x+t\omega)d\omega$，$E^v=\partial_t(tM_tD_E)+tM_t(\nabla\times D_B)$、$B^v=\partial_t(tM_tD_B)-tM_t(\nabla\times D_E)$；Maxwell 残差是零初值波方程解、初速 $\nabla(\nabla\cdot D)=0$，局部波唯一性消去；散度为零；球均值公式给有限传播。$C_tL^2$ 合法化：mollify 数据（无散、$\to L^2$、各固定导数一致收敛），Kirchhoff 解按固定导数收敛、同时是 $U(t)(\eta_\epsilon*D)$，酉性给 $L^2$ 一致收敛，两个极限局部一致 ⟹ 所求解 $=U(t)(D_E,D_B)$。

#### 10.3 粒子球外换场（cont:coulomb、cont:potential、cont:modified-data）

- **Coulomb 场**：$E_C=-\nabla(-\Delta)^{-1}\rho_0$，$\nabla\cdot E_C=\rho_0$，属于每个 $H^s$（$\widehat{E_C}=-i\xi|\xi|^{-2}\widehat\rho_0$，零点 $O(|\xi|^{-1})$ 在三维平方可积、无穷远速降）——**允许任意总电荷**（Coulomb 尾非 $L^2$ 的问题被 $L^2$ 场假设只加在 $E_0-E_C$ 类的差上绕开）。
- **Poincaré 型向量势引理**（cont:potential）：$V(x)=\int_0^1tG(tx)dt$、$\mathcal A_G=V\times x$，则 $\nabla\times\mathcal A_G=G$。验证：$\nabla\cdot V=0$、$\nabla\times(V\times x)=2V+(x\cdot\nabla)V=\int_0^1\frac d{dt}(t^2G(tx))dt=G(x)$。
- **修正数据**：$\chi\in C_c^\infty$ 在 $B(0,L)$ 上为 1（$L=R_0+2H+1$），
$$\overline E_0=E_C+\nabla\times(\chi\mathcal A_{E_0-E_C}),\qquad\overline B_0=\nabla\times(\chi\mathcal A_{B_0}).$$
属于每个 $H^k$、满足原散度约束、在 $B(0,L)$ 上与原场一致；与原场之差无散、光滑有界导数、$L^2$。
- **真空传送**：$D(t)$ = 引理 10.2 以 $(E_0-\overline E_0,B_0-\overline B_0)$ 为初值的真空解；$D(t,x)=0$ 当 $0\le t\le H$、$|x|\le R_0+t$（因 $|x|+t\le R_0+2H<L$）。于是 $(f,F)\leftrightarrow(f,F-D)$ 在时刻 $H$ 前是经典解之间的等价（Maxwell 方程与约束在减无散真空解下保持；输运方程在粒子区域不变；$C_tL^2$ 与紧支撑保持）。**Sobolev 构造（$H=1$）+ 加回 $D$ = 全初值场类的局部经典存在**；唯一性允许拼接成唯一极大经典解。

#### 10.4 光滑持久与有界动量判据（cont:persistence、cont:continuation）

- **光滑持久**：全 $H^k$ 初值 + $[0,S]$ 上经典解 ⟹ 引理 10.1 给一致 $W^{1,\infty}_x$ 界，紧支撑与 $C^1$ 给动量半径与 $\nabla f$ 一致界，tame 估计按 Slab 界住所有 $Y_k$。假设首损时刻 $\le S$：从下方逼近的时刻处 Sobolev 构造有同样的正寿命，充分靠近重启可越过；经典唯一性拼接 ⟹ 矛盾。**不需要端点处 $H^6$ 极限的先验存在**。原场类：取更大视界做修正数据、对修正解用上述、加回真空。
- **有界动量判据**：引用 Luk–Strain Theorem 1.1（arXiv 版脚注 1）：$H^5$ 粒子与场数据 + 约束，若有有界连续 $\kappa:[0,T)\to(0,\infty)$ 使 $f=0$ 当 $|v|\ge\kappa(t)$，则 $C^1$ 延拓过 $T$。**归一化匹配**（cont:normalization）：Luk–Strain 的密度/电流是 $4\pi\int f_{\rm LS}dv$、$4\pi\int uf_{\rm LS}dv$，故取 $f_{\rm LS}=f/(4\pi)$、$E_{\rm LS}=E$、$B_{\rm LS}=B$。动量支撑 $\le P_*$ 时用 $H=T+1$ 做场修正、$\kappa\equiv P_*+1$，得修正解的 $C^1$ 延拓（$\epsilon<1$）；特征线给紧相支撑、引理 10.1 给 $C_tL^2$（含穿过 $T$ 的连续性）⟹ 本文意义下的经典解；加回 $D$（在 $T+\epsilon<H$ 内于粒子区域恒为零）⟹ 原数据的经典延拓；光滑性由持久论证给出（**不从引用定理进口**）。$f_0=0$ 时约束给两场均无散，引理 10.2 直接给全局真空解。

**批注（"场修正"思想 = Lean 近半篇幅的来源）**：整个 §10 是一篇自足的局部理论论文，其存在理由只有一个：把 $\{C_b^\infty\cap L^2\}$ 数据"洗"成延续定理要的 $H^5$ 而不改变粒子动力学。Lean 里 Continuation/、Flow/、LocalPDE/、Maxwell/ 的体量与此一一对应。
**[推测] 失败路线**：若直接对原数据做 Picard（无 $H^k$ 初值），迭代连第一步都定义不了（$U(t)F_0$ 有意义但 $j_f$ 无 $H^k$ 界）；若只截断场而不恢复真空差（$\overline E_0\ne E_0$ 在球外被直接丢弃），解的 Maxwell 部分在球外错、通过特征线污染球内——必须"截断 + 真空差补偿"成对出现。

---

## 三、summary 时间线：6 页思维链逐段拆解

summary 结构 = 原题转录 + 5 个阶段段（"1 Signed impulses and angular-event counts" … "5 A signed momentum estimate under repeated scrutiny"）。每段按【想干什么 → 卡点 → 救活观察 → 映射到论文】拆。

### 阶段 1：Signed impulses and angular-event counts（第 2 页）

**想干什么**：先攻"粒子动量的有限区间界"。尝试过：零锥（null-slab）能量界、方向冻结、滞留时间（residence times）。立刻撞上正则性：光滑有界有限能量场**不必属于 $H^5$**。拟议补救 = Coulomb 分解 + 向量势局部化 + 真空 Maxwell 修正，把题设数据接到 Glassey–Strauss 有界动量延续判据（Luk–Strain 表述）。
**并行动作**：考虑 Cheverry–Ibrahim 的局部可解性（动量扩散表示）作为另一视角；Wang 频率局部化共振思想超出柱对称的推广；Serre 的 Vlasov–Poisson 正应力构造 vs Maxwell 应力的不定性。采用 **Pfaffelmoser 型滞留时间策略**：推导了一个"加速度相关场与输运场之间的符号分部积分相消"——消掉源角奇性，但留下端点项和一个需要绝对力控制的**接收者加速度系数**。试图加强一致方向稳定性时又遇到**移动 cutoff 的导数**这一障碍。
**转向**：另一方案是光滑化接收者速度 + 短区间磁估计；最终选择**在速度稳定窗内计数"显著角变化"次数**——更锐利的事件计数可以在不要求更强一致方向模量的前提下，改进粒子在延迟锥附近滞留时间的界。目标演化成"符号动量增量界：$\propto\sqrt\tau$ 项 + 区间长度的线性项（系数含 $\log$）"，并用加权 cutoff 与共享能量因子保证二进和收敛。
**后续修正**：发现该估计在**极短区间**失败 ⟹ 修正权重；发展了"以改进事件计数为条件的系数界解析论证"；检查端点平均。
**映射**：Coulomb 分解 + 真空修正 → §10（cont:modified-data/vacuum）；符号分部积分相消 → §6 引理 6.1（can:identity）；接收者加速度系数 → can:bulk-bounds 的 $\mathcal A$；移动 cutoff 导数 → §6.2 引理 6.2 + can:receiver-cutoff-bound；短区间失败 → §4 稳定窗 $\lambda$ 与 $I\le(w/P)^2$。

### 阶段 2：Repairing and auditing the signed momentum strategy（第 3 页）

**想干什么**：围绕符号特征增量组织计算：$|\Delta V|\lesssim P\sqrt\tau+P^2\tau\log(2+P)/w$ 形态的 bootstrap（接收者能量 $\asymp w$、$P$ 界能量、$M,A$ 为固定 bootstrap 常数）。意图：积分力的相消改进 bootstrap、排除有限时间动量爆破。
**审计内容**：直接加速度场估计、边界项、初值场局部化；Cheverry–Ibrahim 延迟功核的近锥估计**仍有一个幂损失**。核心机制 = 延迟轨迹的占据界 + 窄角扇区内选择性分部积分：相消消掉源加速度、留下接收者加速度系数与 cutoff 导数；把角 cutoff 移到角尺度的固定小比率处、近/远估计平衡，**拟议以此避免一个额外的 log**。
**卡点**：计数方向变化的时间区间**太长，bootstrap 的线性项破坏粒子速度保持** ⟹ 按 $2+\gamma\log P$ 因子缩短。之后审计依赖顺序：bootstrap → 方向变化 → 改进占据 → bootstrap 改进。
**检查与拼装**：核对 Luk–Strain 的有界动量判据；检查 Cheverry–Ibrahim 的动量扩散表示；提出无散截断 + 真空 Maxwell 还原来满足延续假设；用 Picard 迭代 + tame Sobolev 估计发展光滑持久。条件性结论：bootstrap 改进成功则逐次动量倍增需 $\sim1/\log$ 的时间间隔，其和发散。
**映射**：估计形态 → §1.4（eq:bootstrap，注意定稿是 $P\sqrt\tau+P^2L\tau/w$）；"避免额外 log" → §8.3 sel:spatial-sum 的 $\epsilon$ 技巧（结构边界无 log）；稳定窗缩短 → §4 occ:lambda/occ:stability；依赖顺序 → §7 引理 7.2 的"不用改进占据证自己"；倍增求和发散 → §setup 的 $\Delta_n\ge c/\log(2+1024\cdot2^n)$。

### 阶段 3：Stress-testing the signed impulse argument（第 3–4 页）

**想干什么**：审计角占据与符号冲量估计：对能量 $q=1+|v|^2$ 的特征核验 $|V(t_2)-V(t_1)|\lesssim P\sqrt\tau+P^2\log(P)/w\cdot\tau$（$\tau=t_2-t_1$）；最大能量处迫使逐次动量倍增的时间间隔和发散。
**审计手法**：反复重建 Glassey–Strauss 延迟场分解、延迟几何、分部积分——**固定粒子标签以免微分初值密度**，与输运场相消消掉最坏的源角奇性；剩下的接收者加速度系数、cutoff 导数、端点项单独估计；"计数源与接收者方向变化"意在把占据界改进到足以让该系数变小。保留"把速度稳定窗按 $2+\gamma\log P$ 因子缩短"的修正，并检查聚合不会对同一力积分重复计费。
**重访延续假设错配**：Luk–Strain 对 Glassey–Strauss 判据的表述施加了比题设有限能量场类更强的 Sobolev 假设 ⟹ 修复 = 截断无散场分量 + 粒子区域外还一个真空 Maxwell 差；tame Sobolev 估计保光滑。
**组织**：能量守恒、延迟核、符号 bootstrap、二进分解；下一任务 = 角分解的正当化与 bootstrap 改进所需估计。
**映射**：固定标签 → §3 引理 3.2（ret:phase-change）；角奇性相消 → §6.1；cutoff 导数与端点项 → §6.3–6.4；重复计费检查 → §4.3 occ:energy-budget 的联合预算；场修正 → §10.3；tame 估计 → cont:tame。

### 阶段 4：Testing a candidate momentum bound（第 4–5 页）【失败路线的正面遭遇】

**想干什么**：把符号冲量计算与场局部化提案组装成完整动量估计；延续用 Luk–Strain 表述的 Glassey–Strauss 有界动量定理（需动量界 + 正则性假设归约）。
**中心机制**：先组合延迟输运与源加速度核再取绝对值；分部积分的物理诠释（verbatim）："Is there a conservation law obstructing? Think physical: retarded Liénard–Wiechert field impulse between near-parallel particles. IBP trades source acceleration for boundary and receiver acceleration coupling."（近平行粒子间的延迟 Liénard–Wiechert 场冲量；IBP 用源加速度换边界项与接收者加速度耦合。）近估计用相密度界；远估计数"访问二进距离与角盒的粒子标签"；符号增量经首出论证保证速度稳定性；方向偏移界锐化受限角范围内的占据。
**卡点（著名的指数矛盾）**：**条件于那些几何估计，为超出阈值的接收者加速度系数导出了不相容的指数不等式**：改进的占据界迫使一个指数 $<0.41$，而过大的系数要求 $>0.496$。
**并行检查**：与 Pallard 的特征线积分估计（Luk–Strain 也有）对比；检查延迟 Jacobian、滞留时间、边界穿越胞、锥尖可积性、cutoff 微分的相消；检查最终常数可独立于 bootstrap 常数选取；重核 Luk–Strain 表述需把密度归一化换成 $f/(4\pi)$ 并满足定理的 $H^5$ 假设 ⟹ 修复 = 保约束的远处场修正 + 有限传播 + Sobolev 持久后再引用定理。
**救活观察**：回到几何与符号冲量计算重查占据估计、cutoff 求和、bootstrap 依赖——即后来 §7/§8 的"先方向计数、再筛选"双步结构。
**映射**：指数矛盾 → §8.2 引理 8.2 Step 3（$H<.41z$ vs $H>.496z+3(\alpha+c)$）；首出论证 → occ:stability 停时；归一化 $f/(4\pi)$ → cont:normalization。

### 阶段 5：A signed momentum estimate under repeated scrutiny（第 5 页）【定稿形态】

**想干什么**：最终延续论证 = 源标签相消 + 角退出计数 + 修正稳定窗。提出的估计：$|\Delta V|\lesssim P\sqrt\tau+P^2\log(2P)/w\cdot\tau$。
**再遇 $\sqrt w$ 损失**：发现绝对力估计丢一个因子 $\sqrt w$。补救 = **沿源标签在窄角扇区内对符号力分部积分**（加速度核 + 输运核组合）；伴随的积分界由**能量守恒与锥通量**给出。
**反复审计**：相消是否在 cutoff、角求和、对 bootstrap 常数的依赖下存活。估计：角大小 $\delta$ 的退出次数至多 $(M,A)\log(2+P)/\delta$ 型（对应论文 ang:count $C(M,A)L^6/\delta$）；用它强化"高动量 + 中间角"受限域的占据界；稳定窗按 $2+\gamma\log(2+P)$ 因子缩短（否则线性 bootstrap 项破坏能量可比性）；随后**指数矛盾被用于控制剩余的接收者加速度系数**。
**收尾（含 summary 自我审计的诚实声明）**：条件于 bootstrap 闭合，动量倍增需 $\sim1/\log$ 级时间间隔，排除有限时间聚集；引用 Luk–Strain 的 Glassey–Strauss 判据（紧粒子支撑 + $H^5$ 场），用无散场修正 + 真空还原来满足假设。最后声明全局光滑延续成立——**并明确注明**："That assertion rests on the occupation bound, direction-count estimate, and cutoff cancellations needed to close the signed momentum bootstrap; the cited continuation theorem alone does not establish those estimates."（该断言依赖占据界、方向计数估计与 cutoff 相消；引用的延续定理本身不建立这些估计。）
**映射**：$\sqrt w$ 损失 → §5 dir:absolute / 小扇区 good-field 段；窄角签名分部积分 → §6；退出计数 → §7 ang:count；窗口缩短 → §4 λ 与 §7 λ_0；指数矛盾控制系数 → §8.2 sel:safe；端点恢复 + 严格改进 → §9。

### 关键转折总表

| 转折 | 从 | 到 | 论文落点 |
|---|---|---|---|
| 正则性错配的发现 | 直接套 Luk–Strain $H^5$ | Coulomb 保留 + 向量势截断 + 真空补偿 | §10 |
| 微分对象的选择 | $(y,v)$ 延迟相点 | 固定初始标签 | §3 ret:phase-change |
| 相消结构的补全 | 只对加速度核 IBP | 加输运核一起 IBP（全导数+体项） | §6 can:identity |
| 稳定窗的缩短 | 长区间速度保持失败 | $\lambda\sim(M/\omega+\sqrt{AL/\omega})^{-2}$ 型短窗 | §4 occ:lambda |
| 占据改进的信息来源 | 更强一致方向模量（失败：移动 cutoff 导数） | 稳定窗内方向改变计数 | §7 ang:direction |
| 指数矛盾的化解 | 单一占据估计（0.41 vs 0.496 冲突） | 筛选 + 改进窗内占据分工 | §8 sel:exponents |
| $\sqrt w$ 损失的抵消 | 绝对力界 | 选定盒接收系数 $\le w^{-1/2}W$ 求和 | §8 sel:bulk |
| 端点残段 | 绝对力估计端点 | 斜坡权 $\psi$ + 符号 bootstrap 分部积分 | §9 closure |

---

## 四、Lean 取证（OAI/Analysis/VlasovMaxwell，207 文件、约 9 万行，零 sorry）

配置 `ComparatorChallenges/VlasovMaxwell.json`：challenge 模块对 `OAI.Analysis.VlasovMaxwell.Main`，目标定理 `OAI.RVM.global_classical_solution`，允许公理仅 `propext / Quot.sound / Classical.choice`——即形式化必须在 Lean/Mathlib 内自足重证一切，包括 Luk–Strain 的正则性理论。

### 4.1 目录体量与映射

| 目录 | 文件 | 行数 | 对应论文 |
|---|---|---|---|
| Population/ | 56 | 32 037 | §4–§8：占据、直接估计、方向计数、筛选、权重 |
| Retarded/ | 53 | 23 862 | §3：延迟核、锥几何、直接力 |
| Regularity/ | 27 | 8 388 | §10 的正则性/能量/bump 机器 |
| Geometry/ | 22 | 5 765 | 二进分解、cutoff 几何、碰撞排除 |
| Flow/ | 13 | 5 655 | 特征流、标签换元、测度恒等式 |
| LocalPDE/ | 15 | 7 263 | §10.2 Picard 局部构造 |
| Continuation/ | 11 | 3 840 | §1.4+§9：bootstrap、闭口、动量倍增 |
| Maxwell/ | 8 | 3 020 | 延迟场表示、边界场、波核 |

Model.lean（`OAI/Analysis/VlasovMaxwell/Model.lean`）定义基础：`Vec = EuclideanSpace ℝ (Fin 3)`、`q v = sqrt(1+‖v‖²)`、`velocity = (q v)⁻¹ • v`、`Datum`（f₀,E₀,B₀）、`BoundedSmooth`（$C^\infty$ + 各阶迭代导数一致有界 = $C_b^\infty$ 的 Lean 化）、`Admissible`（ContDiff ∞ + 紧支撑 + 非负 + 两场 BoundedSmooth + MemLp 2 + 两个散度约束）、`Classical`（$C^1$ 片段上解方程 + `TimeContinuousL2` + `CompactOnFiniteHorizons` + 初值匹配）、`Equations`（逐点方程组含两个散度约束）。`Main.lean` 的收口链：`global_classical_of_uniform_physical_increment hd (fun H _ => hd.uniform_physical_population_increment H)`——**把动量倍增论证压缩成一个"一致物理增量"接口**。

### 4.2 力恒等式的拆分：boundaryLorentzForce + 推迟密度积分

`Maxwell/ElectricBoundaryField.lean`：

```lean
def boundaryLorentzForce (s : Solution) (t : ℝ) (x a : Vec) : Vec :=
  electricBoundaryField s t x + cross a (magneticBoundaryField s t x)

lemma classical_physical_force_representation (hs : Classical d s) (hm : SmoothOnFiniteHorizons s)
    (ht : 0<t) (x a : Vec) :
  s.E (t,x) + cross a (s.B (t,x)) =
    boundaryLorentzForce s t x a +
    (4*Real.pi)⁻¹ • ∫ z in ball (0:Vec) t,
      retardedElectricDensity s t x (x+z) + cross a (retardedMagneticDensity s t x (x+z))
```

这就是论文 §3 命题 3.3（ret:fields/ret:force）的 Lean 化：力 = **数据边界项**（自由波 + 初始球面边界，即 $K^{\rm data}$）+ **$4\pi^{-1}$ 倍初始球上的推迟密度积分**（变量 $z\mapsto x+z$ 把锥变成原点球）。`retardedDensity f t x z = f (t - coneRadius x z.1, z)`（ConeRadius.lean:467）。配套恒等式 `retarded_electric_density_identity`（ConeRadius.lean）逐分量改写 $\frac{f\cdot\text{kernel}}{}$ = r^{-2} 主项 + 两个**散度项**（输运散度 + 力散度）——正是把微分从密度转到几何的 IBP 前置步骤；`eulerian_kernel_decomposition` 与 `retardedG`（`retardedG x z = eulerianG(coneRadius,coneDirection,velocity)/…`）对应 $\ell=(rd)^{-1}$ 与 $g=(u-n)/d$。`TransportAngularCore.lean` 的 `transportAngularCore n u`、`sourceAngularCore n u b`、`coneLorentz`、`transportSingularShell` 及 `transportSingularShell_near_far`/`physical_transport_log_bound` 是 §6 输运核进入签名恒等式的形态（含 $r^{-2}$ vs $r^{-1}$ 的近远分壳 log 界）。

**初值场非 $H^5$ 难题的化身**：`datumBoundarySolution d = ⟨f₀∘p.2, E₀∘p.2, B₀∘p.2⟩`（常数"解"承担边界数据），`electricConeBoundary_initial_congr` 表明锥边界项只依赖初值——因为 `Admissible` 只给 $C_b^\infty+L^2$，自由波部分不能走 $H^k$ 能量，而用 Kirchhoff/球均值逐点表示 + mollify（Regularity/ 与 Maxwell/WaveK、WaveGradient）。

### 4.3 prefixFlow / PrefixClamp / 停时化

`Continuation/PrefixClamp.lean`：

```lean
def prefixClamp (T t : ℝ) : ℝ := max 0 (min T t)
def prefixFlow (α : Phase → ℝ → Phase) (T : ℝ) (z : Phase) (t : ℝ) : Phase := α z (prefixClamp T t)
```

**动机**：`PhaseFlowOn F` 的流只在 $[0,T]$ 有定义，但下游论证（连续性、积分 $\int_{t\in\mathbb R}\psi(t)\cdot(\cdot)$）需要在全 $\mathbb R$ 上谈"力场沿流"。`prefixFlow` 把流在 $T$ 后冻结在端点值、$0$ 前冻结在初值。`PhaseFlowOn.prefixMomentum_hasDerivAt` 证明在 $t\in(0,T)$ 内导数与真流一致（`congr_of_eventuallyEq`：clamp 在内部恒等）；`prefixMomentumForce s α T z t = (lorentzField s.E s.B (prefixClamp T t, prefixFlow α T z t)).2`（`Continuation/PrefixMomentumForce.lean:37`）。配套 `prefixAngularMultiplier/Rate`：`extendedAngularCLM w hw (prefixFlow …).2` 及其 fderiv——对应论文 $\Pi=wP_X/|V_X|$ 的**变投影**（can:projector-derivative）。

**停时化**（`Continuation/IncrementBootstrap.lean`）：

```lean
def IncrementBootstrap (V : ℝ → Vec) (T M A P L : ℝ) : Prop :=
  ∀ n a b, 0 ≤ a → a ≤ b → b ≤ T →
    (∀ t ∈ Icc a b, 2^n/8 ≤ q (V t) ∧ q (V t) ≤ 8*2^n) →
    ‖V b - V a‖ ≤ M*P*sqrt (b-a) + A*(b-a)*(P^2*L/2^n)
```

`momentum_stopping`（连续性 + 首出中间值论证）与 `IncrementBootstrap.stopped_forward`：若 $M P\sqrt{b-a}+2A(b-a)P^2L/q(V a)\le\varepsilon<q(V a)/2$，则全程 $\|V t - V a\|\le\varepsilon$ 且 $q(V a)/2\le q(V t)\le 2q(V a)$——**bootstrap 反用出的稳定窗**（论文 occ:stability）的精确形态；`velocity_stopped_forward` 再给 $\|{\rm velocity}(V t)-{\rm velocity}(V a)\|\le2\varepsilon/q(V a)$（用 `‖fderiv velocity‖ ≤ q⁻¹`，对应 $\|D_vu\|\le1/q$）。

### 4.4 时间切片重启 Picard 全套（为何占近半篇幅）

`Continuation/GlobalContinuation.lean`（1058 行）的骨架：

- `bounded_momentum_field_bound / field_gradient_bound / second_jet_bound`：有界动量前缀上，场及其一、二阶 jet 的 Volterra 型界（`classical_*_log_closed_bound`、`prefix_spatial_gradient_volterra`——用 `log_one_add_mul_exp_le` 型标量比较闭式）。
- `bounded_momentum_uniform_restart`：给定"有界动量经典前缀 + $P<\|v\|$ 处 $f=0$"，存在 $\delta>0$ 与延拓解匹配到 $U+\delta$。做法：取 `timeSliceDatum`（把前缀端点切片当新初值）、验证切片数据 `Admissible`（`slice_admissible`：粒子界 `particle_bound_datum`、空间支撑 `spatial_support_datum`、Lipschitz `bounded_momentum_particle_lipschitz_bound`、场 jet 界 $C_0+C_1+C_2$），然后喂给 `family_bounded_classical_prefix`（一族一致受控数据的统一局部存在定理——即 Picard 构造的族版本），最后 `pasteSolution` 粘合。
- `bounded_momentum_arbitrarily_long_prefix`：归纳（每次 +δ）+ 反证，得超过任意 $H$ 的前缀。
- `global_classical_of_arbitrarily_long_prefixes` → `global_classical_of_uniform_prefix_momentum` → `global_classical_of_uniform_physical_increment`：用 `time_slab_mem_nhdsWithin`/`contDiffOn_halfspace_of_slabs`/`timeContinuousL2_of_slabs` 把逐片光滑粘成半空间上的 $C^\infty$。

**为何占近半篇幅（Continuation+LocalPDE+Flow+Regularity ≈ 25k 行 vs 分析核 Population+Retarded ≈ 56k 行；若连同 Geometry 则"外围"超过一半）**：论文里 §10 的每个"显然/经典"的断言在 Lean 里都要显式构造：(1) 切片数据必须重新满足 `Admissible` 的**全部**字段（含 $L^2$ 与散度约束——约束传播靠 `closed_equations`）；(2) 公共寿命只依赖 $Y_6$（Lean 里用有限 jet $C_0,C_1,C_2$ + Lipschitz 常数 $L$ 显式打包进 `family_bounded_classical_prefix`）；(3) `pasteSolution` 后 `Classical` 的每一项（$C^1$、$C_tL^2$、方程、紧支撑）都要在两段拼接处重新验证；(4) 非负性/紧支撑/散度在切片时都依赖特征线的显式界而非引用。LocalPDE/ 的 `PicardContraction / PicardBounds / PicardBoundary / PicardCurvature / RelativeCauchyConstant / StrongLocalExistence / SmoothLocalExistence`（约 4700 行）就是论文 cont:tame + Picard 迭代的完整 Lean 化，其中 `RelativeCauchyConstant`（909 行）专门处理迭代差估计的常数。

### 4.5 核心引理假设清单（Admissible.force_bulk_uniform，Population/BulkReceiverResidual.lean:112）

这是"加权签名冲量估计"（论文 §8 命题 8.5 + §9 主体）的 Lean 中心接口，假设逐条（20 条）：

1. `Admissible d`（数据类）；
2. `T₀` 有限视界、`D`（权重导数界常数）非负；
3. 存在 $C\ge0$（结论常数），对**所有** $M,A\ge1$ 一致；
4. `∀ᶠ P in atTop`（$P$ 充分大，可依赖 $M,A$）、$P\ge1$、$\log(2+P)\ge1$；
5. `SmoothClassicalPrefix d s T`（前缀光滑经典）；
6. $0\le T\le T_0$；
7. `zX ∈ tsupport d.f₀`（接收者是支撑标签）；
8. 区间参数 $0\le a\le b\le T$、$0<I\le1$、$b-a\le I$；
9. $1\le w\le P$、$I\le(w/P)^2$（**短区间约束**，论文 sel:short）；
10. 全体支撑动量 $\le P$（初始标签与 $f\neq0$ 处，两条）；
11. 接收者能量带 $q(\text{flow } zX\, t)\in[w/8,8w]$ 于 $[a,b]$；
12. **IncrementBootstrap**（符号 bootstrap 对所有支撑标签在 $[0,T]$ 成立，$L=\log(2+P)$）；
13. 权重 $\psi$：Lipschitz 常数 $L_\psi$、$|\psi|\le1$、$[a,b]$ 外为零、$|\psi'|\le D/I$、$[a,b]$ 外 $\psi'=0$、$\psi(T)=0$（**端点为零权**）；
14. 结论：$\int_{0<t<T}\psi(t)(E+\hat v\times B)(t,X(t))\,dt$ 的范数 $\le C(P\sqrt I+(M+\sqrt A)I P^2\log(2+P)/w)$。

对应的姊妹引理：`Admissible.signed_increment_strict`（Continuation/Bootstrap.lean）给出**严格改进**（右边 $\le\frac12\text{incrementBound}$），其常数选取逐字实现论文 §9 的链条：`let M := 32+8*C; let A := 1+16*C*M+256*C^2`，验证 `8*C≤M`、`16*C*M≤A`、`256*C^2≤A`——见 4.6。注意 Lean 版对权重多了显式导数界 $D/I$（论文的 Lipschitz 斜坡 $\eta I$ 隐含它）与 `ψ T=0`（右端点也归零，配合 `supported_weight_integral_eq` 把 $\int_{\mathbb R}$ 化为 $\int_a^b$）。

### 4.6 closure_coefficient_bound 的常数凑法（Continuation/Bootstrap.lean:275）

```lean
lemma closure_coefficient_bound (hCM : 8*C≤M) (hCA : 16*C*M≤A) (hC2A : 256*C^2≤A) :
  C*(P*sqrt I + (M+sqrt A)*I*P^2*L/w) + 2*incrementBound M A P L w (I/256)
    ≤ incrementBound M A P L w I / 4
```

三个假设正是任务所问的 **8C≤M / 16CM≤A / 256C²≤A**；证明四步：
1. `sqrt (I/256) = sqrt I/16`（斜坡长 $\eta=I/256$，即论文 $\eta\le1/256$）；
2. `16*C ≤ sqrt A` ⟹ `C*sqrt A ≤ A/16`（nlinarith 用 $A^2$ 的平方根单调性——这就是为什么 $A$ 的下界里要有 $256C^2$：使 $C\sqrt A$ 能被 $A$ 的固定份额吸收）；
3. `C + M/8 ≤ M/4`（根号项系数：$C\cdot P\sqrt I+2\cdot M P\sqrt{I/256}\cdot\frac12\le(C+M/8)P\sqrt I\le\frac M4 P\sqrt I$——**8C≤M 使 $C$ 自身被 $M$ 的余量吞掉**）；
4. `C*(M+sqrt A)+A/128 ≤ A/4`（线性项系数：$C(M+\sqrt A)IS(w)+2\cdot A(I/256)S(w)\le(C(M+\sqrt A)+A/128)IS(w)$——**16CM≤A 吞 $CM$ 项、$A/128$ 来自斜坡两项 $2\times\frac1{256}$**；最后 `nlinarith only [hp,hq]` 一次闭出 $\le\frac14$）。

调用处（同文件 :405）把它接进 `signed_increment_strict`；$M=32+8C$ 中的 32 对应论文"$\mathcal B_w(I)\ge32w$ 平凡情形 / $M\ge32$"。

### 4.7 自行重证 Luk–Strain 正则性

Lean 里没有引用任何"延续定理"黑盒：`momentum_bounded_of_increment`（Bootstrap.lean）自证"动量倍增 ⟹ 动量整体有界"（反证 + 中间值取首达时刻 + `first_level_time/last_level_time/first_levels_strict` 处理 $2^n$ 层级的分离），再把 `Admissible.signed_increment_strict` 的严格改进接进 `PopulationIncrement`。数据归一化 $f/(4\pi)$ 在 Lean 中不出现——因为整个形式化从头按本文归一化重推（`force_bulk_retarded_uniform` 直接从延迟表示出发）。`global_classical_of_arbitrarily_long_prefixes` 扮演 Luk–Strain Theorem 1.1 的角色：它内部用的是自建的 `bounded_momentum_uniform_restart`（§4.4），等价于"$H^5$ 场数据的 $C^1$ 延拓"被替换为"有限 jet 界 + Lipschitz 粒子密度的统一重启"——即 Lean 版连 $H^5$ Sobolev 理论都绕开，用显式常数化的二阶 jet 界（`secondJetSum`）实现持久性（Regularity/ 的 `SlabEvolutionRegularity / SlabL2 / ParticleC1 / EnergyBump / MomentLimit` 支撑 $C_tL^2$ 与能量恒等式）。

### 4.8 其它值得记录的取证点

- **零 `sorry`**：全部 207 文件无占位符；公理仅三条标准。
- **重复开放命令**：多数文件开头重复 `open Set MeasureTheory Metric Filter ODE` 十余次——自动生成的痕迹，说明模块按统一模板批量产出。
- **命名对齐**：`PhysicalBinBasePrefix / InClosedConeBin / GeometryCutoffDeficitLogSum / GeometryCutoffStableLogSum / DyadicBalanceConstant / SharedBudget / SelectionWeight / UnselectedCover / DirectExpandedDeficitUniform` 等逐一对应论文 occ:/dir:/sel: 的术语；`CrossCLM`/`crossCLM` 是叉乘的连续线性映射化（积分与叉乘交换的桥）。
- **测度论合法化**：论文"逐标签、零测碰撞集、紧投影可测"的技巧在 `Geometry/CollisionLabels`、`Flow/PhaseHits`、`Population/PhysicalBinPhaseSet`、`Population/LabelOccupation*` 中实现；`Regularity/ParamPrimitive`、`SmoothIntegral` 处理含参积分的连续性/可微性。

---

## 五、常数表：每个常数的角色与来历

| 常数 | 精确定义/取值 | 出现处 | 角色 | 来历（机械理由） |
|---|---|---|---|---|
| **P** | 2 的幂，$P\ge1024\max_{z\in\supp f_0}q(V)$，且 $P\ge P_0(M,A)$ | setup eq:P-range；Lean：`P₀ ≤ 2^k`、`1024*q ≤ 2^k` | 全局动量尺度上限；所有二进分解的顶 | 由初始动量支撑 + bootstrap 的反用确定；取 2 的幂保证 $\Delta_n$ 论证中 $P=1024\cdot2^n$ 与 $w=2^n$ 的层级咬合 |
| **1024** | $P\ge1024\max q$ | setup、closure（$1024M\,2^n\sqrt{\Delta_n}$、$1024^2A\ldots$） | 安全裕度因子 | 保证 (a) 非空范围 $w/8\le q_X\le8w$ 内 $w\le P$；(b) $\Delta_n$ 分配论证"至少一项 $\ge2^{n-2}$"的固定余量；(c) 所有"固定常数被 $P$ 的幂吸收"的步骤有 $10^3$ 级余量。取值不敏感，只需足够大且为 2 的幂 |
| **L** | $L=\log(2+P)$ | 全文 | 对数因子总管 | 三个来源：(1) 每个角变量的非空二进盒数 $\le C\log(2+P)$（occ:angle-ranges）；(2) 动量和 $\sum_p p/m\le C(L+P/w)$ 的常数段；(3) defcit 例外盒计数 $CL^4$。$2+P$ 的"+2"防 $\log$ 在 $P$ 小时退化 |
| **S(w)** | $S(w)=P^2L/w$ | setup、direct、selection | 签名估计线性项的尺度 | $P^2$：源能量平方（延迟核里 $q^{-2}$ 换成 $p$ 幂后通量/占据界的能量配额）；$/w$：接收者能量越大、同样的源对它做的功越少；$L$：角求和残差 |
| **M** | bootstrap 常数，$M\ge\max(32,8C_\eta)$；Lean `M := 32+8*C` | setup eq:bootstrap、closure | 根号项 $MP\sqrt\tau$ 的系数 | $32$：平凡情形 $\mathcal B_w\ge32w$ 与 $I\le(w/P)^2$ 的切换阈值；$8C_\eta$：吸收 $C_\eta$（来自 sel:bulk 的主体估计），见 closure_coefficient_bound 的 `C+M/8≤M/4` |
| **A** | bootstrap 常数，$A\ge\max(1,16C_\eta M,256C_\eta^2)$；Lean `A := 1+16*C*M+256*C^2` | 同上 | 线性项 $A\tau S(w)$ 的系数 | $16C_\eta M$：吸收 $C_\eta M IS(w)$ 交叉项；$256C_\eta^2$：保证 $C\sqrt A\le A/16$（$C$ 与 $\sqrt A$ 的竞争项）；$1$：保证 $A\ge1$ 使 "$M,A\ge1$" 的单调性论证成立 |
| **η（eta）** | $0<\eta<1/2$，closure 取 $\eta\le1/256$（$2\sqrt\eta,2\eta\le1/8$）；Lean 斜坡长 $I/256$ | §9、sel:time-weight（斜坡 $\eta I$） | 时间斜坡分数 | 端点残段宽度：$\sqrt\eta$ 进根号项、$\eta$ 进线性项；$\le1/256$ 使两项各自 $\le\frac18$ 份额。**选取顺序第一位** |
| **C_η** | sel:bulk / closure-improvement 里的固定常数 | §8–§9 | 主体签名估计的常数（依赖 η） | 所有求和（角、动量、半径）的几何级数常数汇总；因 η 冻结成数值，后续 $M,A$ 只依赖这一个数 |
| **ε（epsilon）** | $\epsilon=10^{-5}$ | sel:epsilon、sel:weight $W=(P\theta)^{-\epsilon}\phi^\epsilon h^\epsilon$ | 权重的幂余量 | 使 $\gamma=\frac{1-4\epsilon}{1-2\epsilon}>0$、$(h/h_0)^{1/2-\epsilon}$ 可比、$\Delta=\epsilon(\alpha+b+y+H)<.001z$——把结构边界的过渡磨成几何可和，代价可忽略（$\epsilon$ 幂在所有比值下近 1） |
| **β (beta)** | $\beta=1.16=29/25$ | §7 ang:window/ang:improved-occupation、§8 sel:pure/sel:exponents | 改进占据的角指数 | 由方向计数 $L^6/\phi$ 的 $\phi^{-1}$ 加上吸收 $L^7$ 所需的正幂 $\phi^{-(\beta-1)}\ge P^{56/3125}$ 平衡出；$29/25$ 的分子分母恰好让 §8.2 Step 3 的线性不等式 $\beta y<.58z-.29H$ 与 $\beta y>\frac H3+.33z$ 夹出 $H<.41z$ |
| **0.41 / 0.496** | $H<\frac{378}{935}z<.41z$ vs $H>\frac z2+3(\alpha+c)-4\Delta>.496z$ | §8.2 sel:H-lower 与 Step 3 | 指数矛盾两端 | $.41$：$1/3+.29=.63$ 的倒数截断（$(1/3+29/100)$ 与 $.58$ 的代数）；$.496$：远选取纯能量界的 $z/2$ 减余量 $4\Delta<.004z$ |
| **w** | $w=2^k$，接收者能量尺度；带 $w/8\le q_X\le8w$ | 全文 | 接收者动量二进层 | 8 倍带宽给相邻层的重叠余量；$w\le P$ 由 $P\ge1024\max q$ 保证 |
| **p** | $p=64p_0$，源动量尺度，$p/128\le q\le p/32$、$64\le p\le P$ | occ、direct | 源动量二进层 | 64/128 偏置使 $p$ 与"动量倒数亏损"角尺度 $1/p$ 的比较常数干净 |
| **m** | $m=\min(p,w)$ | occ、selection | 源/接收中较小者 | 决定角下界 $\sigma\ge c/m$ 与稳定窗 $\lambda$ 的分子；$p\le w$ 与 $p>w$ 分段是所有动量和的分割点 |
| **θ, φ, σ, h** | $\theta^2\asymp d$、$\phi^2\asymp D$、$\sigma^2\asymp e$、$h\asymp r/\max(1,T_0)$ | §4 起 | 源角/接收角/相对角/半径代表元 | $2d=\|n-u\|^2+q^{-2}$ 等角恒等式使"角"含动量倒数亏损；乘法性二进分解（支撑 $(1/2,2)$、$[3/4,3/2]$ 上为正）保证有界重叠与对数导数有界 |
| **κ (kappa)** | 固定小数值常数 | occ、cancellation、direction、selection | 小扇区阈值 $\theta<\kappa\phi$ | 把"窄角"定义成比例关系；放宽到 $\theta\le16\kappa\phi$（cutoff 重叠的 16 倍比界）；κ 需足够小使直接估计在扇区外有正确的角幂 |
| **C₀, C₁** | occ:lambda 的大常数；actual 判据 $\omega>C_0/m$、$\lambda=[C_1\frac Pm(\frac M\omega+\sqrt{AL/\omega})]^{-2}$ | §4 | actual/deficit 分界与稳定窗长 | $C_0$ 大：actual 盒的两个动量倒数项 $\ll\omega^2$；$C_1$ 大：bootstrap 两项在 $C_*\lambda$ 窗内 $<\varepsilon_0 m\omega$（$\varepsilon_0$ 与 $M,A$ 无关） |
| **C₂, Q₀, λ₀** | $Q_0=C_2(M^2+AL)$、$\lambda_0=I_m^0/Q_0$、$I_m^0=(m/P)^2$ | §7 引理 7.2 | 改进占据的胞长 | 只保能量可比（不保角度）：$C_2$ 大使 bootstrap 两项 $\le Cm/\sqrt{C_2},Cm/C_2$ 排除首出；$\lambda_0$ 不含 $\phi$——方向稳定交给引理 7.1 的有限次切换 |
| **λ (lambda)** | 见 C₀/C₁ 条 | §4 occ:lambda、§8 sel:lambda | 速度稳定窗长（基线版） | 两个求和逆 $M/\omega$（根号预算）与 $\sqrt{AL/\omega}$（线性预算）取 $\lambda^{-1/2}$ 的和；$P/m$ 来自 $w'\ge cm$ |
| **δ (delta)** | $w^{-3/5}\le\delta\le w^{-1/10}$；引理 7.2 里 $\delta=c_2\phi$ | §7 | 方向改变的角大小 | 下界 $w^{2/5}\ge P^{6/25}$ 保证 $CL^2N_c$ 可被 $\frac12N_cw\delta$ 吸收；上界保证 $\delta/j'^{-1/10}$ 可控；$c_2$ 小使好命中的相对速度投影保持 $c\phi$ |
| **I, I_m⁰** | $I\le(w/P)^2$；$I_m^0=(m/P)^2$ | setup eq:short-I、§4、§7、§8 | 区间长度上限（两版） | $(w/P)^2$ 使根号项 $P\sqrt I\le w$（能量份额）；$I_m^0$ 是改进占据的"无 $M,A$"版本 |
| **R** | $R=1+\sqrt{I/\lambda}\sqrt{\mathcal E}$ | occ:R-bound、direct、selection | 占据增强因子 | 胞数 $I/\lambda$ 与能量池 $\mathcal E$ 的平方和组合；$R^2$ 保持估计的乘法结构 |
| **W** | $W=(P\theta)^{-\epsilon}\phi^\epsilon h^\epsilon$ | §8 | 可和权重 | 双重角色：未选定盒代价 $\le CP\sqrt I\,W$、选定盒系数 $\le Cw^{-1/2}W$；$\sum W\le C_\epsilon$ |
| **U** | $U=w^{-1}\min\{h^2(p\theta)^3,(p\theta h\phi^2)^{-1}\}$ | §8 sel:U | 选定盒接收系数 | 两支分别来自密度界（近）与锥通量界（远）；min 后经筛选保证 $\le w^{-1/2}W$ |
| **𝓔_{pφ}** | occ:energy-budget；$\sum\le C$ | §4.3、§5、§8 | 联合能量预算 | 每个 $(s,y,v)$ 只计一次；索引只按 $(p,\phi)$——θ 与 h 方向免费 |
| **𝓖_φ, 𝓕_φ** | dir:G-budget、dir:F-budget；$\sum\le C$ | §5 | 场预算（锥通量/磁） | 锥能量不等式（常数 4）与全空间能量守恒的直接产物 |
| **𝓑(I,w)** | $P\sqrt I+(M+\sqrt A)IS(w)$（无 M/A 版 $\mathcal B_{\rm base}$） | §5、§8 | 基线界 | 全部"可直接控制"项的汇总预算；signing 后 $\sqrt A$ 与 $M$ 分开出现对应 eq:bootstrap 两项 |
| **C*** | occ:stability 的参考窗倍数；§9 的 $|K|$ 一致界 | §4、§9 | 双重身份 | 前者：稳定窗覆盖胞与延迟间隔的倍数（先定，再定 $C_1$）；后者：紧区间上力的普通有界性（**不进** $M,A,P_0$） |
| **D (Lean)** | force_bulk_uniform 的权重导数界 $D/I$ | Lean | 显式 Lipschitz 斜坡 | 论文 $|\psi_t|\le C/(\eta I)$ 的参数化 |
| **C (Lean)** | force_bulk_uniform 输出的统一常数 | Lean Bootstrap | 上游常数 | 是 $M,A$ 常数链（8C≤M 等）的唯一输入——对应论文把"主体估计常数"命名为 $C_\eta$ |

**常数依赖图（最终选取顺序）**：$\eta$（冻结 $C_\eta$）→ $M$ → $A$ → $P_0$；Lean 中 $C$（force_bulk_uniform）→ $M=32+8C$ → $A=1+16CM+256C^2$ → $P_0$（filter_upwards 的阈值）。β、ε、κ、C₀、C₁、C₂、c₂ 是**固定数值/结构常数**，在 $M,A$ 之前确定且不依赖它们——这是"最终常数独立于 bootstrap 常数"这一审计项（summary 反复出现）在论文与 Lean 中的双重落实。
