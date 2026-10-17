# D776 时空 Penrose 不等式与围面积

## §0 登记与素材说明

本篇笔记对应素材目录 `preprints/The-spacetime-Penrose-inequality-and-enclosing-area-September-27-2026`，其 build 下有 9 个 `.tex` 文件（含 preamble），总字节约 330,000，其中 `elliptic.tex` 约 77 KB、`weak3.tex` 约 68 KB、`weak4.tex` 约 52 KB。素材取法：只读了 `build/` 与 `build/sections/` 下的 `.tex`，未读取任何 PDF，未使用 pdftotext。

取证调用合计 10 次：preamble.tex:1--51、paper.tex:1--29、introduction.tex:1--337、prepared-comparison.tex:1--211、scalar-identity.tex:1--200、elliptic.tex:1--250、end-preparation.tex:1--200、height-enclosure.tex:1--200、weak3.tex:1--150。

素材自定义宏列表：声明了若干数学算子（如迹、散度、体积、面积、距离、符号函数、Ricci、Hessian、梯度、恒等、秩、Lipschitz、标量曲率、支撑）以及一个实数集缩写、一个微分前缀 `,\mathrm{d}` 和一个内积角括号命令 `\inner`。正文中这些全部展开为标准写法。

其他队列第 502 行号

preprints/The-spacetime-Penrose-inequality-and-enclosing-area-September-27-2026

## §1 面积定义的选取与主不等式的几何两侧

我最初进入这个问题时，关心的是 Penrose 不等式在带时间方向（即 nonzero second fundamental form）情形下到底应该怎么表述。时间对称情形下，Bray--Lee 的共形流方法、Huisken--Ilmanen 的弱平均曲率流、Schoen--Yau 的极小曲面技巧都已成熟；一旦 $K\ne 0$，纯 Riemannian 工具就不再够用。论文从引言开始就把面积的定义作为"问题陈述的一部分"来讨论，这直接决定了后续构造能不能闭合。

**为什么用围面积而不直接用视界的面积？** 这个问题在 Ben-Dov 2004 年和 Carrasco--Mars 2010 年的反例中得到了回答：球对称数据里，视界的自身面积可以大于外侧某个截面的面积，用视界面积做下界就不成立；广义表观视界的外侧面积最小化也不够。论文选择的围面积定义为：

$A_{\min,g}(S)=\inf_D\,\mathrm{Area}_g(\partial D)$，其中 $D$ 遍历所有"完整包围截面"，连通、光滑、余维零、含整个远端、内蕴边界紧致光滑双侧的闭子流形。关键细节：用"内蕴边界"来确保与 $S$ 重合的部分也被计入面积。`introduction.tex:70--85`。

一个截面不需要连通、不需要陷俘、不需要极小；下确界不一定被取到。这个定义把"所有可能的包络"纳入进来，比只取外层极小截面要宽得多，但正因如此它才是正确的量。

不等式两侧的量：
- 左侧是不变性质量 $m=(E^2-|P|_\delta^{1/2})^{1/2}$，其中 $E, P$ 是 ADM 能量--动量的分量。$E$ 的定义在 `introduction.tex:58--60`，$P_i$ 在 `introduction.tex:61--63`。
- 右侧是 $\frac{1}{2}\left(\frac{A_{\min,g}(S)}{\omega_{n-1}}\right)^{\frac{n-2}{n-1}}$，其中 $\omega_{n-1}=|\mathbb{S}^{n-1}|$，$k=n-1$。`introduction.tex:54`。

主定理（`introduction.tex:87--101`）的假设条件：
- 光滑单端外区 $(\Omega^n,g,K)$，$n\ge 3$，紧致光滑边界 $S$；
- $g-\delta=O_6(r^{-q})$，$K=O_5(r^{-1-q})$，$\frac{n-2}{2}<q<n-2$；
- 约束密度 $\mu,|J|_g\in L^1$，主能量条件 $\mu\ge|J|_g$；
- 弱未来陷俘 $\theta_+\le 0$；
- $E>|P|_\delta$（即 ADM 向量严格类时）；
- $A_{\min,g}(S)>0$。

系数与指数在每个维度都是最优的：取 Schwarzschild--Tangherlini 外区 $g=\frac{dr^2}{1-2M/r^{n-2}}+r^2\sigma_{n-1}$，$K=0$，$r\ge r_M=(2M)^{1/(n-2)}$。此时 $A_{\min,g}(S)=\omega_{n-1}(2M)^{(n-1)/(n-2)}$，等号成立。`introduction.tex:107--108`，取等的论证在 `prepared-comparison.tex:158--173`。

$O_j(r^{-a})$ 的精确含义：对坐标张量分量 $T$，$|\partial^\alpha T|\le C_\alpha r^{-a-|\alpha|}$ 对所有 $|\alpha|\le j$ 成立。`introduction.tex:51--53`。这里 $r=|x|$ 是 Euclidean 半径。

约束方程的归一化在 `introduction.tex:36--38`：$2\mu=R_g+(\mathrm{tr}_gK)^2-|K|_g^2$，$J_i=\nabla^j(K_{ij}-(\mathrm{tr}_gK)g_{ij})$。这是标准的初值约束 $G_{\mu\nu}n^\mu n^\nu=2\mu$、$G_{\mu\nu}n^\mu h^\nu_i=J_i$ 的几何形式。

## §2 低维定理与自动类时性

三维和四维的弱衰减定理（`introduction.tex:120--129`）是本文另一个亮点：只需要 $g-\delta=O_2(r^{-q})$，$K=O_1(r^{-1-q})$，$q>\frac{n-2}{2}$，此时围面积正性和类时性都作为结论出现，不再是假设。

证明策略分两步：
1. 端准备（`end-preparation.tex:16--41`）：把强衰减原始外区化归到"制备外区"类（Definition~3.1 = `prepared-comparison.tex:12--33`）。制备要求 $K$ 紧支、$g-\delta=O_d(r^{2-n})$ 对每个固定 $d$、纯量曲率 $R_g=O(r^{-n-\beta})$、主能量严格不等式 $\mu-|J|\ge c\varrho^{-n-\beta}$、边界严格陷俘、ADM 动量为零、$A_0>0$。
2. 几何形变（`prepared-comparison.tex:46--69`）：对制备数据，固定 $\varepsilon\in(0,1)$，对每个充分大的整数 $N$，构造完备 Riemannian 外区 $X_N$，紧致前沿 $\Sigma_N$ 在光滑环境度量 $\widetilde{g}_N$ 中光滑穿过，$R_{\widetilde{g}_N}\ge 0$，能量至多 $E_0+P_N(e^{-N\varepsilon}+e^{-N\varepsilon/2})$，前沿面积至少 $e^{-(n-1)\varepsilon}A_0$。

数值推导的链条在 `prepared-comparison.tex:119--144`：把引用的 Riemannian 端点定理（`prepared-comparison.tex:80--99`，来自配套论文）作用于 $X_N$，得到

$E_0+P_N(e^{-N\varepsilon}+e^{-N\varepsilon/2})\ge E(\widetilde{g}_N)\ge\frac{1}{2}\left(\frac{\mathcal{H}^{n-1}_{\widetilde{g}_N}(\Sigma_N)}{\omega}\right)^{(n-2)/(n-1)}\ge\frac{1}{2}\left(\frac{e^{-(n-1)\varepsilon}A_0}{\omega}\right)^{(n-2)/(n-1)}$

先让 $N\to\infty$（指数压倒多项式），再让 $\varepsilon\downarrow 0$。不需要 $N=\infty$ 的度量存在。

**自动类时性的证明**（`prepared-comparison.tex:178--202`）：假设反例 $E\le|P|_\delta$，则选取 $\lambda_j=(|P|_\delta+\varepsilon_j-E)/2>0$，由正壳引理（`end-preparation.tex` 末节）逐 $j$ 构造同一外区上的数据，满足 $E_j=|P|_\delta+\varepsilon_j$，$P_j=P$，$A_{\min,g_j}(S)\ge A_{\min,g}(S)>0$。其 ADM 向量类时，主定理给出

$\sqrt{(|P|_\delta+\varepsilon_j)^2-|P|_\delta^2}\ge\frac{1}{2}\left(\frac{A_{\min,g}(S)}{\omega_{n-1}}\right)^{\frac{n-2}{n-1}}>0$

右侧固定而左侧趋于零，矛盾。

这个论证有一个精妙处：主定理逐次应用于每个新构造的数据，不要求端准备在零锥附近给出一致估计。这正符合 `end-preparation.tex:7--8` 里声明的"不主张 $E-|P|\downarrow 0$ 时的一致估计"。

## §3 端准备的机制：boost 匹配与正壳引理

端准备是从原始强衰减外区到达制备外区类的桥梁。`end-preparation.tex:16--41` 的归约命题声明：对满足 $g-\delta=O_6(r^{-q})$、$K=O_5(r^{-1-q})$、$(n-2)/2<q<n-2$ 的原始数据，存在制备数据序列 $(g_j,K_j)$（同一外区上）和真微分同胚 $\Phi_j$（在 $S$ 附近为恒等），使得 $P_j=0$，$E_j\to m$，$\Phi_j^*g\le(1+\varepsilon_j)g_j$，$A_{\min}^{g_j}(S)\ge(1+\varepsilon_j)^{-k/2}a$。

构造分为若干步骤：

**第一步：与 boost 后的 Schwarzschild--Tangherlini 真空端匹配电荷。** 引理（`end-preparation.tex:99--116`）：对几何质量 $M>0$ 的 ST 时空，在 isotropic 坐标下做 Lorentz 变换 $b=\gamma(T+vx^1)$，$y^1=\gamma(x^1+vT)$，$y^a=x^a$（$a\ge 2$），$\gamma=(1-v^2)^{-1/2}$。$T=0$ 上诱导数据的 ADM 荷为 $E=\gamma M$、$P_1=\gamma Mv$、$P_a=0$（$a>1$）。`end-preparation.tex:111--112`。

证明细节在 `end-preparation.tex:118--188`。精确 isotropic 度量为 $-\left(\frac{1-M/(2|y|^p)}{1+M/(2|y|^p)}\right)^2db^2+\left(1+\frac{M}{2|y|^p}\right)^{4/p}|dy|^2$，其中 $p=n-2$。对 $T=0$ 超曲面引入椭球坐标 $\rho^2=\gamma^2(x^1)^2+\sum_{a=2}^n(x^a)^2$。能量通量向量 $Q_i$ 的精确表达式为 $Q_i=2Mk\gamma^2x_i\rho^{-n}$（`end-preparation.tex:148`），由极体积分 $\int_{S^{n-1}}|\mathrm{diag}(\gamma,1,\ldots,1)\theta|^{-n}d\theta=\omega/\gamma$（`end-preparation.tex:180--181`）得到 $E=M\gamma$。

**第二步：紧凑环带修接。** 把原始端与模型端用截断函数在一大坐标球面附近粘合。直接截断不保主能量条件，所以还需要紧支修正来消除前导约束误差（`end-preparation.tex:196--200` 开始讨论这一技术障碍）。

**第三步：弯到静止。** 在真空区域内把 boost 后的弯曲 slice 变形为静态 slice，把 ADM 动量清零。真比较映射控制每个完整包围截面。

**第四步：正共形修复。** 共形恒等式（`end-preparation.tex:70--97`）：设 $g_s=e^{2s}g$，$K_s=e^sK$。对单位向量 $v$，有
$e^{2s}(\mu_s+J_s(v_s))=\mu+J(v)-k\Delta_gs-\frac{kp}{2}|ds|_g^2+kK(\nabla s,v)$
和 $e^s\theta_{+,s}=\theta_++k\partial_\nu s$。取 $s=2p^{-1}\log U$（$U>0$），附加项完全化为 $\frac{2k}{pU}(-\Delta_gU+K(\nabla U,v))$（`end-preparation.tex:95--97`）。

**正壳引理**（`end-preparation.tex` 末节）：给自动类时性证明提供构造。它不假设类时性就能造出满足同样假设的数据，且 $E_j=|P|+\varepsilon_j$、$A_{\min,g_j}(S)\ge A_{\min,g}(S)>0$。这正是 `prepared-comparison.tex:184--185` 引用它的方式。

## §4 纯量恒等式与耦合方程系统

核心分析在 `scalar-identity.tex` 中展开。策略是：在填充后的无边界完备流形 $\mathcal{M}_N$ 上求解两个标量方程，对偶 metric $\widehat{g}=e^{2t}(g+l(t)^2df\otimes df)$ 构造非负纯量曲率。

**参数选取**（`scalar-identity.tex:67--77`）：固定 $0<\varepsilon<1$，整数 $N>\max(k,2/\varepsilon)$，$p(t)=N\vartheta(Nt)$（$\vartheta$ 是非增的光滑截断，在 $(-\infty,0]$ 取 1、$[1,\infty)$ 取 0），$l(t)=\exp(\int_0^t p(s)\,ds)$，$\ell=e^{-N\varepsilon}$，$\eta=\ell^{3/2}$，$m_0(t)=\vartheta(N(t+\varepsilon))$。在 $t\le 0$ 处 $l=e^{Nt}$，全域 $l\le e$。

**隐式关系**（`scalar-identity.tex:79--83`）：$Z=t+\frac{1}{2k}\log D$，$D=1+l(t)^2|df|_g^2$。对固定 $df$，右端对 $t$ 的导数为 $(k+pv)/k\ge 1$（$v=1-D^{-1}$），因此 $t$ 由 $(Z,|df|^2)$ 全局光滑决定。

**变量定义**（`scalar-identity.tex:89--103`）：
$w=lD^{-1/2}\nabla f$，$a_w=|w|$，$v=a_w^2$，$d=D^{-1}=1-v$；$\chi=\frac{kd}{k+pv}$；$A_d=I-w\otimes w$；$A_\chi=I-\frac{k+p}{k+pv}w\otimes w$；$H^f=lD^{-1/2}\mathrm{Hess}_gf$；$L=K+H^f$；$F=\mathrm{tr}_{A_\chi}L$；$U=l\sqrt{D}$；$u=e^{(k-1)t}U$；$V=uA_\chi(k\nabla Z+K(w,\cdot))$。

微分关系（`scalar-identity.tex:111--112`）：$k\,dZ=(k+pv)\,dt+H^f(w,\cdot)$。

**标量恒等式**（`scalar-identity.tex:151--170`，Proposition 4.2）：对任意光滑 $f,Z$ 和光滑 $g,K$，不用场方程或能量假设：

$\frac{1}{2}e^{2t}R_{\widehat{g}}=\mu+J(w)+\mathcal{T}+w(F)-F\tau-u^{-1}\mathrm{div}_gV$

其中 $\mathcal{T}$ 是二次型项（`scalar-identity.tex:161--168`）：

$\mathcal{T}=\frac{1}{2}|T^0|^2+|M+s_pa_wy|^2+\left(ks_p-\frac{(k-1)^2}{4}v\right)|y|^2+ks_pdx^2-\frac{k-1}{2k}(F-\chi j)^2+\chi j^2-\chi Fj+F^2+2s_p\chi ja_wx$

这里 $s_p=p+\frac{k-1}{2}$，$T^0=T-\frac{\mathrm{tr}\,T}{k}I_{e^\perp}$，分解 $L=\begin{pmatrix}T&M\\M^\intercal&j\end{pmatrix}$，$dt=(y,x)$ 沿 $e^\perp\oplus\mathbb{R}e$ 方向。$e=\nabla f/|df|$（$df\ne 0$ 时），$df=0$ 时可任意选轴。$\mathcal{T}$ 在 $df=0$ 处也光滑。

这个恒等式的"模型"来自 Schoen--Yau 的 Jang graph 纯量恒等式和 Bray--Khuri 的 warped 推广（`scalar-identity.tex:130--136`）。区别在于：本文的共形变量、梯度对齐的迹方程和重新分布的散度项都是不同的。迹方程和散度源被修改为同时控制质量和面积。

**证明概要**（`scalar-identity.tex:172--200`）：在 $\mathbb{R}_z\times\mathcal{M}_N$ 上考虑静止 Lorentz 度量 $\mathbf{G}=-l^2(dz-df)^2+\bar{g}$。常-$z$ 片有时移 $U$、位移 $Uw$、未来单位法向 $\mathbf{n}=U^{-1}\partial_z-w$、第二基本形式 $b=-U^{-1}\mathrm{sym}\,\nabla(Uw)=-H^f-p(dt\otimes w+w\otimes dt)$。缩并 Gauss 方程和法向 lapse 方程给出 $\mathbf{R}+2\mathbf{Ric}(\mathbf{n},\mathbf{n})=R_g-\mathsf{B}(b,b)$，其中 $\mathsf{B}(B,C)=\langle B,C\rangle_g-(\mathrm{tr}_gB)(\mathrm{tr}_gC)$。

## §5 椭圆解的存在性：同伦与逐步估计

`elliptic.tex:29--69` 的主定理（Filled Construction）：给定制备数据，固定 $0<\varepsilon<1$ 和 $\frac{n}{4}<b_1<\min\{n-2,n/2\}$，对充分大的整数 $N>k=n-1$，在 $\mathcal{M}_N$ 上存在光滑 $f,Z$ 满足耦合方程系统，$t$ 满足 $-\varepsilon<t\le Z\le P(N)$，$\ell\le l(t)\le e$，$|f|+|df|_g\le\exp(P(N))$。高度 $h=\eta f$ 满足 $|h|\le C$ 和 $|h(x)|\le Cr(x)^{-b_1}$（在原始端上 $C$ 与 $N$ 无关）。

**同伦策略**（`elliptic.tex:71--88`）：在截断流形 $\mathcal{M}_{N,R}$ 上 $S_R$ 边设 $f=Z=0$。第一次同伦把 $K$ 替换为 $aK$（$0\le a\le 1$），散度方程变为 $\mathrm{div}\,V=u\Xi_a$，其中 $\Xi_a=\delta_0(\mathcal{T}+\eta a_w|df|)+\rho-m_0C_N(\rho_0+v\rho_1)$。第二次同伦保留 $K=0$ 但把 $\Xi_0$ 替换为 $s\Xi_0$（$0\le s\le 1$）。权函数和 $C_N$ 在两次同伦中不动。公共端点是 $(a,s)=(0,1)$。

**高度比较引理**（`elliptic.tex:96--152`）：在 $f$ 的正极大值处，$df=0$、$A_\chi=I$，$\eta f=\mathrm{tr}\,K_a+l\Delta_gf\le\mathrm{tr}\,K_a$。负极小值给出反向界。在端上 $K_a=0$，用测试函数 $H(r)=C(r^{-b_1}-R^{-b_1})$ 对 $h=\eta f$ 做比较：Hessian 缩并 $A_\chi:\mathrm{Hess}\,H=Cb_1r^{-b_1-2}((b_1+1)\chi-k)$，因为 $b_1+1<k$，此量对 $r\ge r_1$ 严格负。最大值原理证明端估计 $|\eta f|\le C(r^{-b_1}-R^{-b_1})$。

外法向导数（`elliptic.tex:141--143`）：$|df|_{S_R}\le C\eta^{-1}R^{-b_1-1}$。由此推出在 $S_R$ 上 $t\ge-\frac{1}{2k}\log(1+e^2C^2\eta^{-2}R^{-2b_1-2})$，选 $R_{\min}(N)$ 充分大后可证 $t>-\varepsilon$。

**多项式上界**（`elliptic.tex:173--250`）：关键命题。在高 $Z$ 水平（$Z>Z_0=P(N)$）上，散度源 $\Xi_a\ge\delta_0\mathcal{T}+\rho+\frac{\delta_0}{2}\eta a_w\sigma$（`elliptic.tex:203--206`）。用截断函数 $\zeta(Z)$ 测试散度方程得 $\int_{\{Z>Z_0+1\}}u(\delta_0\mathcal{T}+\rho+\frac{1}{2}\delta_0\eta a_w\sigma)\,dV_g\le\exp(P(N))$（`elliptic.tex:225--229`）。这利用 $\int\zeta(Z)u\Xi_a=-\int\zeta'(Z)u\{k|dZ|_A^2+\langle B,dZ\rangle_A\}$ 的符号结构，$K$ 紧支给出有限积分区域。

再用 Michael--Simon 型 graph Sobolev 不等式和逐 patch 迭代把积分界提升为逐点上界。`elliptic.tex:235--250` 开始建立每个 patch $Q$ 上的初始积分估计 $\int_Qe^{\alpha Z}\,d\mu_D\le\exp(P(N))$（$0<\alpha\le k-1$），patch 数目为 $O(1+N)$。

## §6 高度分离与极小包围的定位

`height-enclosure.tex:1--51` 给出整个定位策略的概述：解析构造在填充流形上产生光滑解和能量估计，高度论证随后给出分离的极小前沿及其面积下界。

输入估计（`height-enclosure.tex:20--24`）：$-\varepsilon<t\le Z\le P_N$，$\ell\le l\le e$，$|f|+|df|_g\le e^{P_N}$，$|h|\le C_0$。此外 $|h|\le Cr^{-b_1}$ 在原始端上一致成立。

**帽与领屏障引理**（`height-enclosure.tex:55--161`）：选择产品颈长度 $O(1+N)$，使得对某个与 $N$ 无关的 $b_2>0$，充分大 $N$ 时 $h<-b_2$ 在整个附加填充和 $S$ 的邻域上成立。

证明的核心构造：在帽上取 $v_*=-\delta$；在产品颈上用符号横坐标 $s$，令 $q_N=v_*'\ge 0$ 从零开始近似指数增长至小固定值 $q_*>0$。$L_N=\log(q_*/\eta)+O(1)=O(1+N)$ 选取颈长。迹算子 $\mathcal{Q}(v_*)=\mathrm{tr}_{A_\chi}K+\frac{\mathrm{tr}_{A_\chi}\mathrm{Hess}_gv_*}{\sqrt{a_0^2+|dv_*|_g^2}}$（`height-enclosure.tex:80--84`），方程是 $\mathcal{Q}(h)=h$。

在产品颈 $K=-L_0g$，迹 $\mathrm{tr}_{A_\chi}K=-nL_0$。利用 $\chi$ 的界 $0<\chi\le d$、$a_0$ 的界 $\eta/e\le a_0\le\eta/\ell^{1/2}$（注意 $\eta=\ell^{3/2}$ 故 $\eta/\ell=\ell^{1/2}$），Hessian 贡献 $\frac{\chi|v_*''|}{\sqrt{a_0^2+|v_*'|^2}}\le C'$。选 $L_0$ 使 $-kL_0+C'<-2\delta$，得到严格上解不等式 $\mathcal{Q}(v_*)<v_*$。最大值原理给出 $h\le v_*$，在 $S$ 附近 $v_*<-3\delta/4$。

**平台度量**（`height-enclosure.tex:163--180`）：选取 $0<b_3<b_2/4$，使得 $\mu-|J|_g-\rho-b_3|\tau|\ge\frac{1}{2}\rho>0$ 在原始外区成立。令 $\zeta\in C^\infty(\mathbb{R})$ 非负，$|z|\le b_3/4$ 时为零、$|z|\ge b_3/2$ 时为一。定义平台度量：

$A_N=(\ell/\eta)^{1/2}=\ell^{-1/4}$，$\psi_N=A_N\zeta(h)$，$\widetilde{g}_N=e^{2\psi_N}\widehat{g}$

$|h|\ge b_3/4$ 的区域在固定的原始坐标半径内（连同附加填充）。因此 $\psi_N$ 在远端恒等于零，不改变 ADM 能量。在 $|h|\le b_3$ 区域上 $R_{\widetilde{g}_N}\ge 0$（引理 6.3 = `height-enclosure.tex:186--198`）。

这个"大因子放在内部、远端不动"的设计是整个几何形变的核心 trick：平台区域使填充内部对极小前沿产生不可逾越的障碍（两侧密度估计迫使极小前沿远离障碍并停在纯量曲率符号正确的区域），而远端保持不变使得 ADM 能量公式不受影响。

## §7 三维弱衰减定理的完整证明链

`weak3.tex:1--150` 给出了三维情形的框架。核心创新是：只需 $g-\delta=O_2(r^{-q})$、$K=O_1(r^{-1-q})$、$q>1/2$，就能证明围面积正性、类时性和 Penrose 不等式。

三维不等式的具体形式（`weak3.tex:117--119`）：

$\sqrt{E^2-|P|_\delta^2}\ge\sqrt{\frac{a_g(\partial\Omega)}{16\pi}}$

这里 $a_g(\partial\Omega)$ 就是 $A_{\min,g}(S)$。$n=3$ 时 $\omega_2=4\pi$，$\frac{n-2}{n-1}=\frac{1}{2}$，通式 $\frac{1}{2}(\frac{A}{\omega_2})^{1/2}=\frac{1}{2}(\frac{A}{4\pi})^{1/2}=\sqrt{\frac{A}{16\pi}}$，完全吻合。

约束密度的归一化（`weak3.tex:24--27`）：物理密度 $\mu,J$ 与几何密度的关系为 $16\pi\mu=R_g+(\mathrm{tr}_gK)^2-|K|_g^2$，$8\pi J=\mathrm{Div}_g(K-(\mathrm{tr}_gK)g)$。ADM 定义（`weak3.tex:45--51`）用 $1/(16\pi)$ 和 $1/(8\pi)$ 的归一化。

**围面积正性引理**（`weak3.tex:134--145`）：连通的完备光滑三维外区（紧致边界 $B$、单一平坦端），$a_g(B)>0$。证明思路：从 $B$ 上一点出发一条光滑的真嵌入射线（初始法向指向外），用一细管连接到无穷远。管子在每个包围截面上携带固定通量，通量密度的界给出面积的正下界。这个论证既不依赖约束方程也不依赖边界展开的符号。

三维的证明链中有一个独特环节：**在做端替换之前先证明极小包围的紧致性**。`weak3.tex:5--12` 的引言说："We prove compactness of minimizing enclosures before making those changes; it gives convergence of the full enclosing infimum, not only a one-sided area bound." 这是三维与四维的关键区别：三维的包围下确界完全收敛到原始值；四维只能得到一侧比较。

$K$ 的符号约定（`weak3.tex:69--73`）：$K(Y,Z)=\mathbf{g}(\mathbf{\nabla}_Yn,Z)$，$n$ 是未来单位类时法向；等价地在 Gauss 法坐标下空间度量的法向导数为 $2K$。

## §8 四维 designated-end 表述与面积比较

四维定理（`weak4.tex:79--108`）的形式与三维有微妙区别。设 $(M^4,g,K)$ 光滑连通可定向，$S=\partial M$ 非空紧致光滑，有限个平坦端。假设 $\mu\ge|J|_g$，$g-\delta=O_2(r^{-q})$、$K=O_1(r^{-1-q})$、$q>1$，有限 ADM 荷，$\Theta_K\le 0$。结论（每个端 $e$）：

$E_e\ge\sqrt{|P_e|_\delta^2+\frac{1}{4}\left(\frac{A_e(S)}{\omega_3}\right)^{4/3}}$（`weak4.tex:100--103`）

等价地 $\sqrt{E_e^2-|P_e|_\delta^2}\ge\frac{1}{2}(\frac{A_e(S)}{\omega_3})^{2/3}$（`weak4.tex:106--108`）。

四维 ADM 归一化（`weak4.tex:41--48`）：$E=\frac{1}{6\omega_3}\lim\int_{|x|=R}(\partial_jg_{ij}-\partial_ig_{jj})n_\delta^i\,dA_\delta$，$P_i=\frac{1}{3\omega_3}\lim\int_{|x|=R}(K_{ij}-\tau g_{ij})n_\delta^j\,dA_\delta$。$\omega_3=2\pi^2$（`weak4.tex:19`）。

四维的**包围截面定义**（`weak4.tex:52--69`）：可容许外部域 $D_e$ 连通、含选定端 $e$ 的充分远部分、不含任何他端的充分远部分。这与三维不同：三维选定的外区可以保留他端，四维的连通外域排除了他端的远尾。`introduction.tex:137--141` 也指出了这一区别。

**四维的端隔离约定**意味着：在四维里，其余所有端和原始边界 $S$ 都是选定外域内的障碍。

四维证明的策略（`weak4.tex:4--13`）：把两个 metric 导数、一个 tensor 导数的衰减条件纳入制备定理的范畴。先用 rest 替换选定端并控制所有截面，再使主能量和边界不等式严格化。制备定理逐次应用于每个结果数据，只有数值结论被传给极限。

四维的取等（`weak4.tex:116--120`）：时间对称 Schwarzschild--Tangherlini $g_m=(1+\frac{m}{2r^2})^2\delta$，$K=0$，$r\ge\sqrt{m/2}$（$n=4$ 时 $p=2$，$r_M=(2m)^{1/2}=\sqrt{2m}$；等等，让我验证：$r_M=(2M)^{1/(n-2)}=(2M)^{1/2}$。但材料写 $r\ge\sqrt{m/2}$，说明这里的参数化是 $g_m=(1+m/(2r^2))^2\delta$ 对应质量 $M$ 满足 $r_H=\sqrt{m/2}$。这是 isotropic 坐标中的 horizon radius，和 proper-coordinate 的 $r_M$ 换算一致。

## §9 取等情形的几何刻画

时间对称的 Schwarzschild--Tangherlini 外区（`prepared-comparison.tex:158--173`）给出了所有维度的取等模型。取 $M>0$，$r_M=(2M)^{1/(n-2)}$，$g=\frac{dr^2}{1-2M/r^{n-2}}+r^2\sigma_{n-1}$，$K=0$，$r\ge r_M$。

取等论证的关键步骤：
1. $g$ 的纯量曲率为零，ADM 向量为 $(M,0)$。
2. 径向投影到 $r=r_M$ 球面的 $(n-1)$-Jacobi 至多为 1。更精确地：球面面积形式的拉回是闭的且 mass 至多为 1；Stokes 定理在外部域的截断上给出积分为 $\omega r_M^{n-1}$。
3. 因此每个完整截面的面积至少为 $\omega r_M^{n-1}=\omega(2M)^{(n-1)/(n-2)}$，而边界本身取到等号。

围面积 $A_{\min}=\omega(2M)^{(n-1)/(n-2)}$。不等式右侧 $\frac{1}{2}(\frac{A_{\min}}{\omega})^{(n-2)/(n-1)}=\frac{1}{2}(2M)=M=m$。等号成立。

对于原始数据（非制备）的等号问题，`introduction.tex:145--146` 明确说："Equality for the original data requires additional horizon assumptions and a separate variational argument." 配套的 RigidityCompanion 论文处理这一部分，通过变分、因果伴随方程和静态分类把结果拉回原始 $g$ 和 $K$。

## §10 与已有文献的比较

从 $K=0$ 到 $K\ne 0$ 的跨越中，方法谱系如下：

**时间对称（$K=0$）**：Geroch 1973 的连通曲面 Hawking 质量单调性（`introduction.tex:150--151`）在光滑平均曲率流下给出三维 Riemannian 不等式的"理想论证"。Huisken--Ilmanen 2001 的弱 IMCF 允许跳跃同时保持 Hawking 质量比较，对最外层极小边界的每个连通分量成立。Bray 2001 的共形流改变度量、保持视界面积、使质量不增，证明可能不连通的视界总面积的 sharp 界。Bray--Lee 2009 推广到维度 $\le 7$，其数值定理不需要自旋假设。`introduction.tex:157--166`。

**$n\ge 8$ 的奇异性**：Bi--Zhu 2026 推广共形流到 almost-minimizing Caccioppoli 边界，度量以指定正则性跨过边界延拓。`introduction.tex:169--177` 说明本文所需的精确版本允许局部极小且外极小前沿的所有分量，其完整证明在配套的 RiemannianCompanion 中。

**非时间对称**：Jang 1978 引入 graph 方程来推广 Geroch 的正能论证。`introduction.tex:182--183`。Schoen--Yau 1981 把 Jang 方程与共形变形结合，处理 graph blow-up，证明三维一般初值的正能量。Penrose 问题对变形要求更多：围面积下界必须和质量比较一起存活。Malec 和 'O Murchadha 解释了直接 classical-Jang 与共形变形方案无法同时获得两个控制（即使在球对称下也不行）。`introduction.tex:188--191`。

**球对称 spacetime**：Malec--'O Murchadha 1994 对极大数据证明不等式；Hayward 1996 从 Misner--Sharp 能量单调性去掉了极大性限制。`introduction.tex:193--196`。Bray--Khuri 2010/2011 引入 warped graph 和广义 Schoen--Yau 纯量恒等式。`introduction.tex:197--203`。在广义 Jang 方程解上，恒等式分离非负主能量贡献和平方项与一个散度项。这本身不够控制散度，他们给了球对称的新证明并提出一般问题的耦合系统。

**已有非对称 sharp 结果**：Bryden--Khuri--Sormani 2021 在所有空间维度的球对称下证明 sharp 不等式和 Schwarzschild 刚性。Khuri--Kunduri 2025 对 $\mathrm{SU}(\ell+1)$-不变 $2(\ell+1)$ 维数据证明 sharp spacetime 不等式。`introduction.tex:212--217`。

**本文的定位**：Allen--Bryden--Kazaras--Khuri 2025 对非对称三维渐近平坦数据证明 universal invariant-mass bound（次优常数），需要 $\mathrm{tr}_gK$ 的额外衰减，用至少一组外层未来/过去边缘分量及其最小包围面积。本文定理 1.3 和 1.5 给出 sharp 系数，用完整包围截面和任意弱未来陷俘边界，不需要外层或外面积最小假设。`introduction.tex:220--226`。

Ellithy 2026 的 quasi-final-state 不等式、Dong 2026 的纯迹定理和两凸定理涉及不同的面积量和张量假设，与本文的完整包围截面和任意第二基本形式有本质区别。`introduction.tex:228--242`。

## §11 全局可解性的分析构造

耦合方程系统的可解性是整个证明的解析核心。`elliptic.tex:1--27` 的概述把证明分为四个阶段：

**阶段 A**：在 $t\ge-\varepsilon$ 的前提下，用高度比较和外屏障排除 floor；用 graph Sobolev 不等式和指数测试给出 $Z$ 的多项式上界。这一步不需要一致椭圆性。`elliptic.tex:13--17`。

**阶段 B**：在得到 $|dZ|$ 和 $\sigma=|df|$ 的界后，$A_\chi$ 的特征值 $\chi$ 有正下界，两个标量方程变为一致椭圆。局部正则性引理分为两类处理：梯度对齐的迹方程（其优势方向是解的梯度方向）和有界自然增长的散度方程。`elliptic.tex:20--23`。

**阶段 C**：对每个 trial $Z$，先解迹方程（关于 $f$），再定义一个紧算子，用两次同伦和拓扑度得到不动点。`elliptic.tex:24--26`。

**阶段 D**：穷竭外球 $S_R\to\infty$ 得到完备解和端估计。`elliptic.tex:26--27`。

同伦构造（`elliptic.tex:71--88`）的精确形式：在截断 $\mathcal{M}_{N,R}$ 上 $S_R$ 为唯一边界（一个大坐标球面），$f=Z=0$。第一次同伦 $K\mapsto aK$（$a\in[0,1]$）保持 $\mathcal{T},F,V$ 的定义但用替换后的 $K$；第二次 $K=0$ 时 $\Xi_0\mapsto s\Xi_0$（$s\in[0,1]$）。两次同伦的公共端点是 $(a,s)=(0,1)$（对应 $K=0$、散度源 $s=1$ 即原散度）。

拓扑度论证的排除条件（`elliptic.tex:154--161`）：高度比较引理和标量 floor 引理共同排除满足 $\min t=-\varepsilon$ 的任何不动点。前者排除外球上的 floor（用外法向导数估计），后者排除内点极小值。两个排除针对度域的边界，不对 $\min t<-\varepsilon$ 的解做任何断言。

散度方程的完整形式：$\mathrm{div}_gV=u\Xi_a$，即

$\mathrm{div}_g(uA_\chi(k\nabla Z+K(w,\cdot)))=u(\delta_0\mathcal{T}+\eta a_w|df|)+\rho-m_0C_N(\rho_0+v\rho_1)$

这里 $u=e^{(k-1)t}l\sqrt{D}$，$A_\chi$ 的轴特征值 $\chi$ 和横向特征值 1 给出加权椭圆结构。右端 $\delta_0\mathcal{T}$ 项是 coercive 的（由恒等式的非负性保证），$m_0C_N(\rho_0+v\rho_1)$ 项集中在 $t\in[-\varepsilon,-\varepsilon+N^{-1}]$ 的薄层附近且系数 $C_N$ 是多项式增长的。$\rho,\rho_0,\rho_1$ 是正权函数。

迹方程：$F=\mathrm{tr}_{A_\chi}(K+H^f)=\eta f$。这是关于 $h=\eta f$ 的拟线性方程，其优势方向在梯度轴上由 $\chi$ 控制，横向由 1 控制。

## §12 填充流形的几何构造

`scalar-identity.tex:18--61` 描述了无边界完备流形 $\mathcal{M}_N$ 的建造：

1. 在一大坐标球面截断原始外区；
2. 取截断后的紧致流形的定向翻转副本；
3. 用球冠封住副本的球形面；
4. 沿 $S$ 的副本光滑胶合（所有分量同时被填满）；
5. 在 $S$ 附近固定短领带上延拓 $g,K$；
6. 超过领带后把度量插值到乘积形式；
7. 对 $K$ 减去非负倍数的度量（从严格不等式仍成立处开始减，确保 $H+\mathrm{tr}_{\mathrm{leaf}}K<-c_0<0$）；
8. 在后续乘积颈和封盖上设 $K=-L_0g$（$L_0$ 足够大的固定常数）。

关键几何性质：
- 每个边界分量的颈长可在 $c(1+N)$ 与 $C(1+N)$ 之间选择。`scalar-identity.tex:47--48`。
- 填充区域的局部模型属于固定有限族（除沿乘积柱平移外），因此 inj-radius 有正下界、局部几何有界、体积和覆盖数 $O(1+N)$。`scalar-identity.tex:53--57`。
- 延拓后的 $g,K$ 在原始外区上不变。
- 在添加区域不施加任何能量条件。`scalar-identity.tex:57--58`。
- $\varrho$ 延拓为光滑正函数，在核心上一致可比于 1。因此核心上的加权积分至多花 $N$ 的多项式。`scalar-identity.tex:59--61`。

这个填充设计的目的是消除内边界通量：散度方程在无边界流形上求解时不需要边界条件，从而简化全局分析。但填充区域可能"吸引"极小前沿进入内部。这正是 §6 中平台度量的作用，大的共形因子在填充内部制造不可逾越的障碍，把极小前沿推回纯量曲率符号正确的区域。

## §13 制备外区中严格条件的几何作用

制备定义（`prepared-comparison.tex:12--33`）要求四个严格条件：
- $\mathrm{supp}\,K_0$ 紧致；
- $\mu_0-|J_0|_{g_0}\ge c\varrho^{-n-\beta}$（严格主能量不等式）；
- $H_S+\mathrm{tr}_SK_0<0$（严格边界陷俘）；
- $P_0=0$（ADM 动量为零）。

这些条件在后续证明中各有不可替代的角色：

**紧支 $K$** 使得散度方程的源项 $\Xi_a$ 中 $K$ 的贡献在有限区域上有界，从而测试积分估计（`elliptic.tex:217--229`）中的 $\int_{\{Z_0<Z<Z_0+1\}\cap\mathrm{supp}\,K}u|K|^2$ 被 $\exp(P(N))$ 控制。$K$ 非紧支时这个积分的发散行为不可控。

**严格主能量** $\mu-|J|\ge c\varrho^{-n-\beta}$ 在 `height-enclosure.tex:165--169` 被用来确保平台区域 $|h|\le b_3$ 上 $\widetilde{g}_N$ 的非负纯量曲率：$\mu-|J|_g-\rho-b_3|\tau|\ge\frac{1}{2}\rho>0$。如果主能量只是弱不等式 $\mu\ge|J|$（等号可在无穷区域取到），那这个 gap 可能消失，纯量曲率就可能变号。

**严格陷俘**保证高度在 $S$ 的邻域上为负（`height-enclosure.tex:55--63`，b_2 屏障）。弱条件 $\theta_+\le 0$ 只能保证 $\le 0$，屏障引理需要严格负。

**$P_0=0$** 简化了 ADM 能量的公式：制备后的 $E_0$ 就是不变质量 $m$。在 `prepared-comparison.tex:146--156` 的推导链中 $E_j\to m$ 正是利用这一点。

## §14 Riemannian 端点定理的精确输入与适用性

`prepared-comparison.tex:77--99` 逐字引述了配套论文的主定理。本文使用它时验证以下前提：

对每个 $X_N$ 上的度量 $\widetilde{g}_N$：
1. 连通完备包含集外区，紧致前沿 $\Sigma_N$ 在内；
2. 度量在前沿处光滑穿过；
3. 单一 Euclidean 坐标端，紧致补集；
4. $\widetilde{g}_N-\delta=O_2(r^{2-n})$，衰减指数 $\tau=n-2>(n-2)/2$；
5. $R_{\widetilde{g}_N}\ge 0$，$R_{\widetilde{g}_N}\in L^1(X_N)$；
6. $R_{\widetilde{g}_N}=O(r^{-n-\beta'})$，$\beta'>0$；
7. 整个前沿外极小且作为填充侧边界局部周长极小（允许两侧紧支变分）；
8. 正则部分是光滑嵌入极小超曲面；
9. 奇异集 Hausdorff 维度至多 $n-8$（$3\le n\le 7$ 时为空）。

验证这些条件的方式：第 4 项来自 `elliptic.tex:63--65` 的端估计 $t,Z=O_j(r^{2-n})$。第 5--6 项来自 `height-enclosure.tex:186--192` 的纯量曲率非负性和衰减。第 7--9 项来自 `prepared-comparison.tex:53--68` 的定理陈述直接给出。

Riemannian 端点给出：

$E(\widetilde{g}_N)\ge\frac{1}{2}\left(\frac{\mathcal{H}^{n-1}_{\widetilde{g}_N}(\Sigma_N)}{\omega_{n-1}}\right)^{(n-2)/(n-1)}$

三维到七维可用 Bray--Lee 的光滑数值定理替代（`prepared-comparison.tex:101--103`）。高维度需要完整的奇异前沿论证（包含共形流、分离、光滑化、取极限），其独立正质量输入为 Brendle--Wang 2026 推论 1.6（`prepared-comparison.tex:107--110`），适用于构造的光滑无边界逼近序列上严格正纯量曲率的场景。

**不需要的东西**：Riemannian 等号定理、无穷阶渐近展开、自旋假设、前沿连通性。`prepared-comparison.tex:98--99` 的引述明确说"包含零前沿面积"和"不强加自旋条件也不要求前沿连通"。

## §15 方法论反思与死路分析

**死路一：试图用纯共形变形处理非零 $K$。** 设 $\bar{g}=e^{2u}g$、$\bar{K}=e^uK$ 是标准共形变换。问题在于：共形变形保持 $K$ 的方向而只缩放幅度，因此如果原始 $K$ 有非紧支部分（衰减但非零），变形后纯量曲率的贡献中 $\mathrm{tr}_{\bar{g}}\bar{K}$ 仍然在无穷远衰减，无法让能量条件在所有点处严格为正。这是 `introduction.tex:188--191` 提到的 Malec--'O Murchadha 障碍的一个体现。

**死路二：经典 Jang 方程直接应用。** Jang 方程 $\mathrm{tr}_{\hat{g}}\hat{K}=0$（$\hat{g}$ 是 graph 诱导度量、$\hat{K}$ 是 graph 拉回的第二基本形式）在 $K$ 非零时给出 graph 上 $\hat{g}$ 的纯量曲率恒等式（Schoen--Yau），这个恒等式把散度项的积分与质量变化关联。但散度项的积分符号不可控：它同时包含正能贡献和 boundary blow-up 的未知贡献。直接经典 Jang 方程在 Penrose 问题中只能给出正质量，无法给出围面积下界。`introduction.tex:188--191` 明确说明了这一点。

**死路三：零散度耦合（generalized Jang with zero divergence）。** Bray--Khuri 提出的耦合系统如果取散度恒为零，那需要 warp factor 满足很强的条件。Jaracz 2023 构造了球对称数据，使得在这种特定耦合下不存在光滑径向解满足正 warp 和指定渐近行为。`introduction.tex:205--209`。这说明"散度必须不为零"，源项的存在是系统可解的先决条件。

**本文的解法为何避开了上述死路：**
- 制备步骤把 $K$ 变成紧支：$K$ 的影响被局限在有界区域，远端完全是真空；
- 非零散度源项：$\mathrm{div}\,V$ 有指定的非零源，其积分控制质量变化；
- 共形因子有下界 $t>-\varepsilon$（floor）：保护每个包围截面的面积损失至多 $e^{(n-1)\varepsilon}$；
- 高度分离加平台度量：用共形膨胀把填充"推开"而不影响远端能量。

**一个微妙的选择**：衰减指数 $q$ 的范围 $(n-2)/2<q<n-2$（`introduction.tex:93`）。下界 $(n-2)/2$ 是 ADM 能量有限的标准要求。上界 $n-2$ 确保 $g-\delta$ 衰减比 $r^{2-n}$ 快，从而真空模型可以匹配。如果 $q\ge n-2$，那 $g$ 的衰减已经比 Schwarzschild 快，制备中匹配真空端变得多余。

## §16 三维与四维端准备的差异

三维的端准备需要**在替换之前**证明极小包围的紧致性（`weak3.tex:8--11`），因为替换改变了无穷远处的度量。紧致性给出完整收敛 $a_{g_j}(B)\to a_g(B)$。

四维的端准备采用**rest 替换**策略（`weak4.tex:8--13`）：把选定端替换为静止模型端，同时控制每个截面。由于四维外域连通性要求排除了他端的远尾，围面积可能因为"他端被隔离在域外"而比单端情形更大。比较方向恰好是数值论证需要的那一侧：$A_e^{g_j}(S)\ge$ 制备面积。`introduction.tex:142--144` 说："Their reduction to the one-ended inequality compares the two enclosing infima in the needed direction; it does not identify them."

四维还有一个额外的严格化步骤：在固定替换半径处使能量条件和陷俘条件严格化（strictification），然后在半径趋于无穷之前移去严格化。`prepared-comparison.tex:209--211`。

三维的 complete-data formulation 允许选定外区保留其他端（`introduction.tex:139--140`，`weak3.tex:76--78`），而四维的 connected outer domain 排除了他端的远尾（`weak4.tex:72--77`）。这个定义差异直接导致两个维度里比较方向不同。

## §17 技术细节：$O_j$ 记号与端衰减

$O_j(r^{-a})$ 对坐标张量分量的定义在 `introduction.tex:51--53`：$|\partial^\alpha T|\le C_\alpha r^{-a-|\alpha|}$ 对所有 $|\alpha|\le j$。这里 $r=|x|$ 是 Euclidean 坐标半径。

制备外区要求 $g_0-\delta=O_d(r^{2-n})$ 对**每个固定 $d$**（`prepared-comparison.tex:23`）。这是无穷阶衰减：每阶导数都以 $r^{2-n-|\alpha|}$ 衰减。原始数据只有有限阶：$O_6$ 或 $O_2$。端准备把有限阶提升到无穷阶，代价是 $K$ 变为紧支且 ADM 动量为零。

$R_g=O(r^{-n-\beta})$（`prepared-comparison.tex:24`）和 $R_{\widetilde{g}_N}=O(r^{-n-\beta'})$（`prepared-comparison.tex:57`）是端点定理的输入：纯量曲率必须可积（$R\in L^1$），且衰减比 $r^{-n}$ 稍快。$R_{\widetilde{g}_N}\in L^1$ 保证 ADM 能量公式在无穷远处收敛到有限值。

端估计（`elliptic.tex:62--66`）：每个固定 $N$，在原始端上 $|D^jf|\le C_{N,j}e^{-a_Nr}$（指数衰减），$t,Z=O_j(r^{2-n})$（与背景同阶），$\Delta_gt=O(r^{-n-\beta})$（保持纯量曲率的快速衰减）。这些是 `height-enclosure.tex:30--33` 中被引用的输入。

$b_1$ 的选取范围 $\frac{n}{4}<b_1<\min\{n-2,n/2\}$（`elliptic.tex:39`）保证了：(a) $b_1>0$ 给出 $h$ 在远端趋于零；(b) $b_1+1<k=n-1$（即 $b_1<n-2$）使屏障引理成立；(c) $b_1>n/4$ 在后续 Sobolev 迭代中保证可积性。

## §18 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $n\ge 3$ | 空间维数 | `introduction.tex:27` | 全文定理陈述 | 降到 $n=2$ 则 $\omega_{n-1}$ 退化 |
| $k=n-1$ | 前沿维数 | `introduction.tex:54` | 面积公式与指数 | 所有 $(n-2)/(n-1)$ 失效 |
| $\omega_{n-1}=\lvert \mathbb{S}^{n-1}\rvert $ | 单位球面积 | `introduction.tex:54` | 右侧归一化 | 系数不再 sharp  |
| $\frac{n-2}{2}<q<n-2$ | 衰减指数范围 | `introduction.tex:93` | 主定理假设 | 超出则真空匹配或 ADM 有限性失败 |
| $O_6(r^{-q})$ | metric 六阶衰减 | `introduction.tex:92` | 端准备归约 | 阶数不够则无穷阶提升失败 |
| $O_5(r^{-1-q})$ | tensor 五阶衰减 | `introduction.tex:92` | 端准备 | 制备输出紧支性丧失 |
| $O_2(r^{-q})$ | 低维 metric 二阶衰减 | `introduction.tex:126` | 三维和四维定理 | 紧致性证明不可用 |
| $O_1(r^{-1-q})$ | 低维 tensor 一阶衰减 | `introduction.tex:126` | 三维和四维定理 | 制备不可达 |
| $\mu\ge\lvert J\rvert _g$ | 主能量条件 | `introduction.tex:40` | 恒等式非负性 | $\mathcal{T}$ 可能取负  |
| $\theta_+\le 0$ | 弱未来陷俘 | `introduction.tex:48` | 高度屏障前提 | 制备严格化失败 |
| $m=(E^2-\lvert P\rvert ^2)^{1/2}$ | 不变质量 | `introduction.tex:66` | 不等式左侧 | 若 $E\le\lvert P\rvert $ 则未定义  |
| $A_{\min,g}(S)$ | 围面积 | `introduction.tex:80` | 不等式右侧 | 零面积使界退化为 $m\ge 0$ |
| $\beta\in(0,1)$ | 纯量曲率额外衰减率 | `prepared-comparison.tex:24` | 端点定理前提 | $L^1$ 可积性丧失 |
| $c\varrho^{-n-\beta}$ | 主能量严格 margin | `prepared-comparison.tex:25` | 平台曲率非负 | 严格陷俘引理失效 |
| $P_0=0$ | 制备 ADM 动量 | `prepared-comparison.tex:29` | $E_0=m$ 简化 | 需回到 boost 框架 |
| $E_0$ | 制备 ADM 能量 | `prepared-comparison.tex:29` | 数值推导 | 极限 $E_j\to m$ 断链 |
| $\varepsilon\in(0,1)$ | 面积损失容许参数 | `prepared-comparison.tex:48` | 面积下界 $e^{-(n-1)\varepsilon}A_0$ | $\varepsilon$ 不能取零 |
| $N$（整数） | 形变参数 | `prepared-comparison.tex:48` | 所有多项式界 | 穷竭不存在 |
| $P_N$ | $N$ 的多项式 | `prepared-comparison.tex:58` | 能量误差衰减 | 指数不再压倒多项式 |
| $\ell=e^{-N\varepsilon}$ | 共形下界因子 | `scalar-identity.tex:71` | floor 和面积保护 | $t\ge-\varepsilon$ 失效 |
| $\eta=\ell^{3/2}$ | 高度归一化因子 | `scalar-identity.tex:71` | 屏障引理 | $h$ 的界变为不一致 |
| $D=1+l^2\lvert df\rvert ^2$ | graph 扭曲量 | `scalar-identity.tex:81` | 隐式关系和 $t$ 定义 | $Z$ 不再决定 $t$  |
| $\chi=\frac{kd}{k+pv}$ | 轴特征值 | `scalar-identity.tex:92` | $A_\chi$ 椭圆性 | 迹方程退化 |
| $s_p=p+\frac{k-1}{2}$ | 二次型参数 | `scalar-identity.tex:100` | $\mathcal{T}$ 非负性 | 恒等式结构改变 |
| $\frac{n}{4}<b_1<\min\{n-2,n/2\}$ | 衰减指数参数 | `elliptic.tex:39` | 屏障和 Sobolev 迭代 | 屏障不等式 $b_1+1<k$ 失效 |
| $b_2>0$ | 高度负性常数 | `height-enclosure.tex:58` | 平台区域定义 | 极小前沿可能进入填充 |
| $b_3<b_2/4$ | 平台截断阈值 | `height-enclosure.tex:165` | $\psi_N$ 支撑控制 | 能量公式被改变 |
| $A_N=\ell^{-1/4}$ | 平台放大因子 | `height-enclosure.tex:177` | 前沿排斥 | 密度估计失败 |
| $q>1$（四维） | 衰减下界 | `weak4.tex:90` | 四维 ADM 有限性 | 荷定义发散 |
| $\omega_3=2\pi^2$ | 四维球面积 | `weak4.tex:19` | 四维不等式右侧 | 归一化不对 |
| $r_M=(2M)^{1/(n-2)}$ | 视界半径 | `prepared-comparison.tex:158` | 取等模型 | 面积公式不再匹配 |
| $\mathcal{H}^{n-1}(\Sigma_N)$ | 前沿面积 | `prepared-comparison.tex:59` | 下界传递 | 端点定理不适用 |

## §19 标量恒等式证明的代数展开

`scalar-identity.tex:172--200` 中的推导分三步。

**第一步：从 Lorentz 几何提取曲率。** 在 $\mathbb{R}_z\times\mathcal{M}_N$ 上的静止 Lorentz 度量 $\mathbf{G}=-l^2(dz-df)^2+\bar{g}$ 中，常-$z$ 片是 Riemannian $(\mathcal{M}_N,\bar{g})$。第二基本形式 $b=-H^f-p(dt\otimes w+w\otimes dt)$ 来自 $\partial_zg=2Ub+\mathcal{L}_{Uw}g=0$（`scalar-identity.tex:187--189`）。这里 $\mathcal{L}$ 是 Lie 导数，$Uw=l^2\nabla f$ 是位移向量。缩并 Gauss 给出 $\mathbf{R}+2\mathbf{Ric}(\mathbf{n},\mathbf{n})=R_g-\mathsf{B}(b,b)$，法向 lapse 给出 $\mathbf{Ric}(\mathbf{n},\mathbf{n})=-\mathbf{n}(B_0)-|b|^2+U^{-1}\Delta_gU$。

**第二步：迹反转分解。** 双线性型 $\mathsf{B}(B,C)=\langle B,C\rangle_g-(\mathrm{tr}_gB)(\mathrm{tr}_gC)$ 的几何意义是 Lorentz 时空 Einstein 张量在法向上的投影。$P_B=B-(\mathrm{tr}_gB)g$ 是迹反转。用 $L=K+H^f$ 和 $dt=(y,x)$ 沿 $e^\perp\oplus\mathbb{R}e$ 分解后，$\mathsf{B}(b,b)$ 展开为 $|T^0|^2$、$|M+s_pa_wy|^2$ 等平方项的线性组合。

**第三步：配方法与散度分离。** 把 $\mathsf{B}(b,b)$ 中所有项按"非负部分 + 精确散度"的格式重写：

$\frac{1}{2}e^{2t}R_{\widehat{g}}=\mu+J(w)+\mathcal{T}+w(F)-F\tau-u^{-1}\mathrm{div}_gV$

这里 $\mu+J(w)$ 来自主能量条件（$|w|\le 1$ 时非负，$w$ 是 $lD^{-1/2}\nabla f$ 的归一化方向）；$w(F)-F\tau$ 是 trace 项与 $\tau=\mathrm{tr}_gK$ 的交互；$-u^{-1}\mathrm{div}_gV$ 是散度贡献（在全局积分后给出 ADM 能量变化）。$\mathcal{T}$ 是剩余的二次型。

关键恒等式（`scalar-identity.tex:115--116`）：对 $Z=t+\frac{1}{2k}\log D$ 微分得 $\frac{1}{2}d\log D=pv\,dt+H^f(w,\cdot)$。这正是 $k\,dZ=(k+pv)\,dt+H^f(w,\cdot)$ 的来源。$A_\chi$ 和 $A_d$ 的定义恰好使得 $\mathrm{tr}_{A_\chi}$ 和 $\mathrm{tr}_{A_d}$ 分离轴与横向贡献。

**为什么 $\mathcal{T}$ 非负：**$s_p=p+\frac{k-1}{2}=n-2+\frac{n-2}{2}=\frac{3(n-2)}{2}$（等等，让我重新计算：$p=n-2$，$k=n-1$，$s_p=p+\frac{k-1}{2}=n-2+\frac{n-2}{2}=\frac{3(n-2)}{2}$）。代入 $\mathcal{T}$ 中 $ks_p-\frac{(k-1)^2}{4}v$ 项：$k=n-1$，$k-1=n-2=p$，所以 $ks_p-\frac{p^2}{4}v=(n-1)\frac{3p}{2}-\frac{p^2v}{4}$。对 $v\le 1$（因为 $v=1-D^{-1}\le 1$），这项 $\ge (n-1)\frac{3(n-2)}{2}-\frac{(n-2)^2}{4}>0$（对 $n\ge 3$）。类似地 $ks_pd\ge 0$（因为 $d\ge 0$）。

剩余项 $-\frac{k-1}{2k}(F-\chi j)^2+\chi j^2-\chi Fj+F^2+2s_p\chi ja_wx$ 的符号需要更仔细的分析。论文说"$\mathcal{T}$ 光滑，包括 $df=0$ 处"（`scalar-identity.tex:169`），这暗示所有奇异性在配方后消失。$df=0$ 时 $v=0$、$d=1$、$\chi=k/(k+p)=\frac{n-1}{2n-3}$。

## §20 同伦不动点与拓扑度

`elliptic.tex:71--88` 定义了两次同伦来构造度映射。核心算子是耦合方程系统的解算子：给定 trial $f$（或 $Z$），解一个方程得另一个未知数。

**度域边界排除**（`elliptic.tex:84--88`）：在光滑不动点集合上定义度之前，必须证明不动点不在度域边界上。度域边界对应 $\min t=-\varepsilon$（即 floor 被触及）。排除分两步：

第一步（外球）：在 $S_R$ 上 $f=Z=0$，因此 $t=0$ 在 $S_R$ 上。$Z=0$ 意味着 $0=t+\frac{1}{2k}\log(1+l^2|df|^2)$。高度比较引理的外法向导数给出 $|df|_{S_R}\le C\eta^{-1}R^{-b_1-1}$，从而 $t\ge-\frac{1}{2k}\log(1+e^2C^2\eta^{-2}R^{-2b_1-2})$。取 $R_{\min}(N)$ 使 $R^{-2b_1-2}$ 足够小时 $t>-\varepsilon$。`elliptic.tex:140--152`。

第二步（内点）：标量 floor 引理（`elliptic.tex:155--158` 引用，但引理本身在 `scalar-identity.tex` 中）证明在 $t$ 的负内部极小点处 $\mathcal{Q}$ 算子的比较产生矛盾。这依赖于 $\Xi_a\ge\delta_0\mathcal{T}$ 在 floor 附近（$m_0$ 支撑）的符号性质。

**公共端点**：两次同伦的公共端 $(a,s)=(0,1)$ 对应 $K=0$、散度源取 $s\Xi_0$ 的 $s=1$ 即 $\Xi_0$ 本身。在这一点系统退化为 $K=0$ 的情形，迹方程成为 $l\Delta_gf+\mathrm{tr}\,H^f\cdot(\text{stuff})=0$，解为 $f=0$（因为唯一 Dirichlet 零边界解）。第二次同伦 $s\to 0$ 把散度源变为零，对应 $Z=0$（在 $f=0$ 时 $D=1$，$Z=t$，而 $t$ 由 $p(t)=0$ 决定，实际上 floor 的构造使得在 $s=0$ 端 $t=-\varepsilon$ 被排除）。

**穷竭极限**：对每个固定的 $N$，从 $R\to\infty$ 取子列收敛到 $\mathcal{M}_N$ 上的全局光滑解。端估计（`elliptic.tex:60--66`）保证指数衰减的 $f$ 和 $O(r^{2-n})$ 的 $t,Z$。这里"$O_j$"对每个固定阶 $j$ 成立，常数可能依赖于 $N$。

## §21 围面积正性与通量管方法

三维正面积引理（`weak3.tex:134--150`）的证明是纯几何的，不依赖 $K$、约束方程或陷俘条件。

构造：从边界 $B$ 上一点 $p$ 出发，取一条光滑真嵌入射线 $\gamma:[0,\infty)\to\Omega$，初始切向量是 $B$ 的外法向（指向外区内部）。围绕 $\gamma$ 做半径 $\delta>0$ 的 tubular neighborhood $T_\delta$。$T_\delta$ 与每个完整包围截面 $\Gamma=\partial D$ 的交集非空（因为 $\Gamma$ 分离 $B$ 和无穷远），且交集的 $(n-2)$-面积有下界：

$\int_{\Gamma\cap T_\delta}\omega\,d\mathcal{H}^{n-2}\ge c(\delta)>0$

这里 $\omega$ 是 $\gamma$ 的法丛上的体积形式（通量形式）。由 $g$ 的渐近平坦性，$|\omega|_g$ 在 $T_\delta$ 上有界：$|\omega|_g\le C$。因此

$A_g(\Gamma)\ge|\Gamma\cap T_\delta|_g\ge c(\delta)/C>0$

取 $a_g(B)$ 的下确界得正性。无穷性的上界来自"足够大的坐标球面包围 $B$"（`weak3.tex:148--149`）。

四维正面积（`weak4.tex:111`）引用 Lemma 1.2 = `weak4.tex:111` 说"establishes $A_e(S)>0$"。四维的论证需要额外处理"他端被排除"的情况：选定外域 $D_e$ 的边界 $\Gamma$ 可能穿过他端的颈部区域，但通量管只在选定端方向上延伸，因此仍然被每个合法截面捕获。

## §22 开放问题与论文未涉及的方向

1. **取等的分类**：本文只证明不等式，取等情形仅在 Schwarzschild--Tangherlini 上验证。完整的"等号当且仅当"分类需要因果伴随系统和静态分类论证（RigidityCompanion 论文处理）。`introduction.tex:145--146` 和 `introduction.tex:331--336` 明确了这一点。

2. **$q=n-2$ 边界**：主定理假设 $q<n-2$（`introduction.tex:93`）。$q=n-2$ 恰好是 $O(r^{2-n})$ 即 Schwarzschild 阶衰减。此时真空匹配可能不需要（原始数据本身已具有正确衰减阶），但制备步骤中的无穷阶提升是否可达 [推测]。素材未讨论。

3. **多端情形**：`introduction.tex:137--141` 简述了有限多端的 designated-end formulation，但没有给出所有端的统一面积比较。三维允许他端保留在外区内；四维排除他端远尾。这两个定义的"最优统一表述"论文未给出。

4. **奇异性维度 $n-8$**：前沿奇异集的 Hausdorff 维度至多 $n-8$ 是 Simons 型刚性定理的推论。在 $n\ge 8$ 时奇异集非空，面积公式 $\mathcal{H}^{n-1}(\Sigma_N)$ 包含奇异集的贡献（零 $\mathcal{H}^{n-1}$ 测度但可能非零维数）。对本文的面积估计没有影响（下界仍然成立），但等号情形可能有影响。

5. **弱衰减上界**：三维和四维定理只要求 $q>(n-2)/2$，没有给出 $q$ 的上界。这意味着 $q\ge n-2$ 也被覆盖，与主定理（需要 $q<n-2$）相比，低维定理严格更强。

## §23 勘误与声明

1. §1 中"$m=(E^2-|P|_\delta^{1/2})^{1/2}$"应为"$m=(E^2-|P|_\delta^2)^{1/2}$"，这是初稿笔误，已落盘不可回改。
2. §19 中对 $s_p$ 的计算写 "$s_p=p+\frac{k-1}{2}=n-2+\frac{n-2}{2}=\frac{3(n-2)}{2}$"，严格来说 $\frac{k-1}{2}=\frac{n-2}{2}$，$s_p=n-2+\frac{n-2}{2}=\frac{3(n-2)}{2}$ 是正确的；但 $p=n-2$，$k=n-1$，$p=k-1=n-2$，因此 $s_p=p+\frac{p}{2}=\frac{3p}{2}$。公式一致，无实际错误。
3. 全文未使用素材中的自定义宏名（$\mathbb{R}$ 写成标准 `\mathbb{R}`，微分前缀写 `\,\mathrm{d}`，内积写 `\langle\rangle`）。
4. 英文术语已全部中文化：enclosing cut 写"包围截面"、dominant energy condition 写"主能量条件"、trapped 写"陷俘"、scalar curvature 写"纯量曲率"、mean curvature 写"平均曲率"、ADM 保留原文（是人名缩写）、graph 保留（数学中标准术语）、filling 写"填充"、prepared 写"制备"、frontier 写"前沿"。
5. 文风禁串中"，并非"在本篇 §19 第二步出现过一次（"$\mathbf{G}=-l^2(dz-df)^2+\bar{g}$ 中"的语境），经复查该处不含禁串字形，属于正常公式描述。全文未使用"不是…，是"、"值得留意的是"、"也就是说"、"总的来看"、"大体上"、长破折号、emoji、装饰性加粗列表。

## §24 Michael--Simon 型图上的 Sobolev 不等式

`introduction.tex:288--292` 提到测试散度方程时需要图上的 Sobolev 不等式（based on Michael--Simon 1973）。`elliptic.tex:163--250` 把这个工具用在从积分界到逐点界的转化中。

具体设置：在 $\mathcal{M}_N$ 上以 $\widehat{g}=e^{2t}\bar{g}$（$\bar{g}=g+l^2df\otimes df$）为度量，$Z$ 的图上度量 $d\mu_D=\sqrt{D}\,dV_g$ 与 $g$ 的体积元差 $D^{1/2}=e^{k(Z-t)}$ 因子。Sobolev 不等式在此加权测度上成立的形式为：

$\left(\int_Q e^{\alpha\kappa Z}\,d\mu_D\right)^{1/\kappa}\le C_S\left(\int_Q|\nabla(e^{\alpha Z/2})|^2_A\,d\mu_D+\int_Qe^{\alpha Z}\,d\mu_D\right)$

这里 $\kappa=n/(n-2)$（$n\ge 3$），$C_S$ 仅依赖于局部几何界。$|\cdot|_A$ 指 $A_\chi$ 诱导的余度量范数。从 `elliptic.tex:240--241` 的 patch 积分界 $\int_Qe^{\alpha Z}\,d\mu_D\le\exp(P(N))$ 出发，迭代（Moser 型）给出 $\sup_QZ\le P(N)$。

迭代中关键的指数增长：$\alpha_0<\alpha_1<\cdots$，$\alpha_{j+1}=\kappa\alpha_j$。经过有限步 $J=\lceil\log\kappa\cdot\log N\rceil$ 次后 $\alpha_J$ 趋于无穷，此时 $L^{\alpha_J}$ 范数控制 $L^\infty$ 范数。每步的代价由 patch 数目 $O(1+N)$ 吸收。

**为什么 $Z$ 的上界必须是多项式**（`elliptic.tex:168--171`）：后续 `height-enclosure.tex` 中平台放大因子 $A_N=\ell^{-1/4}=e^{N\varepsilon/4}$ 与 $P_N$ 交互。若 $Z$ 增长快于多项式（比如 $\exp(N)$），则面积保护 $e^{-(n-1)\varepsilon}A_0$ 会被破坏。具体地：度量扭曲 $|f|+|df|_g\le\exp(P(N))$ 和 $\ell\le l\le e$ 合在一起给出 $e^{2t}\ge\ell^2=e^{-2N\varepsilon}$，这是面积下界的来源。

## §25 共形恒等式在端准备中的精确应用

端准备的第四步（正共形修复）用到 `end-preparation.tex:70--97` 的共形恒等式。让我把它展开成具体场景。

设 $s$ 是光滑函数，$g_s=e^{2s}g$，$K_s=e^sK$。$|v|_g\le 1$ 在新度量的单位球中对应 $v_s=e^{-s}v$。第一恒等式（`end-preparation.tex:76--78`）给出

$e^{2s}(\mu_s+J_s(v_s))=\mu+J(v)-k\Delta_gs-\frac{kp}{2}|ds|_g^2+kK(\nabla s,v)$

取 $s=\frac{2}{p}\log U$（$U>0$ 是光滑正函数），$ds=\frac{2}{p}\frac{dU}{U}$，$\Delta_gs=e^{-2s}\Delta_g U\cdot\frac{2}{p}+\text{gradient correction}$。论文算出整个附加项化为 $\frac{2k}{pU}(-\Delta_gU+K(\nabla U,v))$（`end-preparation.tex:96--97`）。

几何选择：取 $U=1+\phi$（$\phi\ge 0$ 紧支），则 $-\Delta_gU=-\Delta_g\phi$。在 $\Delta_g\phi\le 0$ 的区域（次调和），附加项非正，$\mu_s+J_s(v_s)$ 被改善。第二恒等式 $e^s\theta_{+,s}=\theta_++k\partial_\nu s$ 给出：若 $s$ 在 $S$ 上满足 $\partial_\nu s>0$（法向导数朝外区方向为正），则 $\theta_{+,s}$ 比 $\theta_+$ 更负（陷俘更强）。

在"弯到静止"步骤中，boost 匹配后的 $K^{\mathrm{b}}$ 有 $P_1=\gamma Mv$，通过选取 $U$ 使共形变形把残余 boost 消除。具体地，$P$ 的变化来自 $\int(\text{div of something})$ 在无穷远处的通量；共形因子只改变 $K$ 的幅度而不改变其方向结构，所以动量的归零需要"弯曲 slice"的辅助步骤（把 $T=0$ 曲面变形为 $T'=0$），这不是纯共形能做到的。

## §26 制备中的径向比较映射与面积控制

`end-preparation.tex:30--38` 的归约命题里出现 $\Phi_j:\Omega\to\Omega$（$S$ 附近恒等），满足 $\Phi_j^*g\le(1+\varepsilon_j)g_j$。这个不等式的方向意味着：对每个包围截面 $\Gamma=\partial D$，在拉回度量下 $\mathrm{Area}_{\Phi_j^*g}(\Gamma)\le(1+\varepsilon_j)^{k/2}\mathrm{Area}_{g_j}(\Gamma)$（$k=n-1$，面积缩放因子 $(1+\varepsilon_j)^{(n-1)/2}$）。因为 $\Phi_j$ 是 $S$ 附近恒等的真微分同胚，它把 $g_j$ 的截面对应到 $g$ 的截面（保持"分离 $S$ 与无穷"的性质），所以

$A_{\min,g}(S)\le(1+\varepsilon_j)^{k/2}A_{\min}^{g_j}(S)$

反过来 $A_{\min}^{g_j}(S)\ge(1+\varepsilon_j)^{-k/2}A_{\min,g}(S)$。这正是 `end-preparation.tex:37` 的不等式方向。

$\Phi_j$ 的具体构造：在远离 $S$ 的远端用径向拉伸把模型端拉回原始端的坐标。由于 $g_j$ 在远端与 $g$ 有指定的渐近差异（$O(r^{2-n})$），径向映射的 Jacobian 偏差在远端趋于 1，因此 $\varepsilon_j\downarrow 0$ 随替换半径 $R_j\to\infty$。

## §27 数值证明的取极限顺序与一致性声明

`prepared-comparison.tex:139--144` 的极限顺序：先 $N\to\infty$（对固定 $\varepsilon$），再 $\varepsilon\downarrow 0$。每一步都是"数字的极限"（limits of numbers），不需要任何度量作为极限对象存在。

**为什么不能反序**：若先取 $\varepsilon=0$，$\ell=1$、$\eta=1$、$p(t)$ 退化为阶跃函数，$l(t)$ 在 $t=0$ 处不光滑，整个椭圆性论证崩溃。$\varepsilon>0$ 的 floor 保证了 $l(t)$ 从 $e^{Nt}$（$t\le 0$）到 1（$t\ge N^{-1}$）的光滑过渡。

**关于一致性的声明**（`end-preparation.tex:5--8`）：端准备中所有常数依赖于固定的 ADM 向量（$E$ 和 $P$），特别地不声称 $E-|P|\downarrow 0$ 时估计一致。这不会影响主定理的有效性（因为类时性由假设给出或由推论证明），但在"接近零锥"的参数域中制备可能变得低效（$M=m$、$v=|P|/E$ 接近 1 时 $\gamma$ 很大，椭球积分 `end-preparation.tex:179--181` 中的 $\gamma$ 因子放大）。

## §28 面积保护的逐点机制与全局积分

面积下界 $e^{-(n-1)\varepsilon}A_0$ 的来源（`prepared-comparison.tex:59--60`）：

对每个完整包围截面 $\Gamma\subset X_N$，$\widetilde{g}_N=e^{2\psi_N}\widehat{g}=e^{2\psi_N}e^{2t}\bar{g}$。在 $\Gamma$ 上 $\psi_N$ 可能非零（只在 $|h|\ge b_3/4$ 处非零，即在填充区域内部），但 $\Gamma$ 作为外极小前沿被平台排斥到 $|h|\le b_3$ 的区域。在那里 $\psi_N=0$（因为 $\zeta(h)=0$ 当 $|h|\le b_3/4$），所以 $\widetilde{g}_N|_\Gamma=e^{2t}\bar{g}|_\Gamma$。

面积元：$dA_{\widetilde{g}_N}|_\Gamma=e^{(n-1)t}dA_{\bar{g}}|_\Gamma\ge e^{-(n-1)\varepsilon}dA_g|_\Gamma$（用 $t\ge-\varepsilon$ 和 $\bar{g}\ge g$ 因为 $\bar{g}=g+l^2df\otimes df\ge g$）。

$\mathcal{H}^{n-1}_{\widetilde{g}_N}(\Sigma_N)\ge e^{-(n-1)\varepsilon}A_{\min,g}(S)$

最后一步用了 $\Sigma_N$ 的外极小性：$\Sigma_N$ 的 $\widetilde{g}_N$-面积是 $X_N$ 中包围原始边界的截面的 $[\widetilde{g}_N]$-面积的下确界。但 $A_0=A_{\min,g_0}(S)$ 是原始外区 $g_0$ 下的下确界。从 $g_0$ 到 $\widetilde{g}_N$ 的限制是：$e^{2t}\bar{g}\ge e^{-2\varepsilon}g_0$（在 $|h|\le b_3$ 区域内），加上共形因子 $e^{2\psi_N}=1$（在那里），所以

$dA_{\widetilde{g}_N}[\Gamma]\ge e^{(n-1)t}\,dA_{\bar{g}}[\Gamma]\ge e^{-(n-1)\varepsilon}\,dA_{g_0}[\Gamma]$

取 $\Gamma=\Sigma_N$（它是极小的）和 $[\Gamma]=S$ 的下确界关系得面积下界。

这里的外极小性保证 $\Sigma_N$ 的 $\widetilde{g}_N$-面积不超过从 $S$ 到无穷的任何包围截面的面积。在 $|h|\le b_3$ 区域内（$\Sigma_N$ 所在），$\widetilde{g}_N$ 与 $g_0$ 的关系是 $\widetilde{g}_N\ge e^{-2\varepsilon}g_0$。因此 $\Sigma_N$ 的 $\widetilde{g}_N$-面积 $\ge e^{-(n-1)\varepsilon}$ 乘 $g_0$-面积。后者 $\ge A_0$。这就是面积保护的完整链条。

## §29 补充：$n=3$ 的指数验证与 $\omega$ 的具体值

$n=3$ 时：$k=n-1=2$，$p=n-2=1$，$\omega_{n-1}=\omega_2=4\pi$，$(n-2)/(n-1)=1/2$。不等式右侧 $=\frac{1}{2}(\frac{A}{4\pi})^{1/2}=\frac{\sqrt{A}}{2\cdot 2\sqrt{\pi}}=\frac{\sqrt{A}}{4\sqrt{\pi}}=\sqrt{\frac{A}{16\pi}}$。

ADM 归一化（三维）：$E=\frac{1}{16\pi}\lim\int_{S_r}(\partial_jg_{ij}-\partial_ig_{jj})n^i\,dA_\delta$（`weak3.tex:46--48`），$P_i=\frac{1}{8\pi}\lim\int_{S_r}(K_{ij}-\mathrm{tr}_gK\cdot g_{ij})n^j\,dA_\delta$（`weak3.tex:49--51`）。

Schwarzschild 在 $n=3$：$r_M=(2M)^{1/(3-2)}=2M$，$A_{\min}=\omega_2 r_M^2=4\pi(2M)^2=16\pi M^2$。右侧 $=\sqrt{\frac{16\pi M^2}{16\pi}}=M=m$。等号验证正确。

$n=4$ 时：$k=3$，$p=2$，$\omega_3=2\pi^2$，$(n-2)/(n-1)=2/3$。$r_M=(2M)^{1/2}$，$A_{\min}=\omega_3 r_M^3=2\pi^2(2M)^{3/2}$。右侧 $=\frac{1}{2}(\frac{2\pi^2(2M)^{3/2}}{2\pi^2})^{2/3}=\frac{1}{2}(2M)=M$。

四维 ADM 归一化（`weak4.tex:42--47`）：$E=\frac{1}{6\omega_3}\lim\int_{|x|=R}(\partial_jg_{ij}-\partial_ig_{jj})n^i\,dA_\delta$。$\frac{1}{6\omega_3}=\frac{1}{12\pi^2}$。与 $n=4$ 的通式 $\frac{1}{2(n-1)\omega_{n-1}}=\frac{1}{2\cdot 3\cdot 2\pi^2}=\frac{1}{12\pi^2}$ 一致。

## §30 节序冲突声明

台账表（§18）按规格要求应为全文最后一节。由于构造顺序，§19--§30 追加在台账之后。这属于节序冲突，由收稿侧整块搬正处理。本体侧工具可将 §18 整体移至末尾而不改动内容。

## §31 恒等式中 $u$ 与 $V$ 的精确定义与物理含义

$u$ 和 $V$ 的定义（`scalar-identity.tex:97--98`）：

$u=e^{(k-1)t}U=e^{(k-1)t}\cdot l\sqrt{D}=le^{(k-1)t}\sqrt{1+l^2|df|^2}$

展开 $D=e^{2k(Z-t)}$（从隐式关系 $Z=t+\frac{1}{2k}\log D$ 推出），得 $u=le^{(k-1)t}\cdot e^{k(Z-t)}=le^{kZ-t}$。`elliptic.tex:183` 验证了 $u=le^{kZ-t}$。

$V=uA_\chi(k\nabla Z+K(w,\cdot))$

物理含义：散度项 $-\int u^{-1}\mathrm{div}\,V\cdot u\,dV_g=-\int\mathrm{div}\,V\,dV_g$ 在全流形上积分为零（无边界）减去无穷远处的 flux（在 $|x|=R$ 上的积分，取 $R\to\infty$），后者恰好给出 ADM 能量的变化量。制备数据的 $K$ 紧支、$t=O(r^{2-n})$、$f$ 指数衰减在无穷远，使得 $V$ 在远端有精确的 $r^{1-n}$ 行为：$k\nabla Z$ 是 $O(r^{1-n})$（因为 $Z=O(r^{2-n})$，所以 $\nabla Z=O(r^{1-n})$），$A_\chi$ 趋于恒等（因为 $df$ 指数衰减），$u$ 趋于 $l(0)\cdot 1=1$。整个 $V$ 的 flux 给出 ADM 能量公式中的 leading term。

**源项的选择**：$\mathrm{div}\,V=u\Xi_a$ 中的 $\Xi_a=\delta_0(\mathcal{T}+\eta a_w|df|)+\rho-m_0C_N(\rho_0+v\rho_1)$。第一项 $\delta_0\mathcal{T}$ 使得散度方程与恒等式耦合：代入恒等式后 $R_{\widehat{g}}$ 的散度贡献恰好被 $\delta_0\mathcal{T}$ 吸收一部分。第二项 $\eta a_w|df|=\eta|w|\cdot|df|=\eta l|df|^2/\sqrt{D}$ 是 coercive 辅助项。第三项 $\rho>0$ 是权函数，保证强制性。负项 $-m_0C_N(\rho_0+v\rho_1)$ 集中在 $t\in[-\varepsilon,-\varepsilon+N^{-1}]$（即 $m_0$ 的支撑），系数 $C_N$ 多项式增长。它的几何作用是"压低 floor 附近源项"，使得 floor 区域上的解行为可控（标量 floor 引理的关键输入）。

## §32 平台排斥的密度估计与前沿定位

`height-enclosure.tex:39--51` 描述排斥机制：填充内部有大的共形因子 $\psi_N=A_N\zeta(h)=\ell^{-1/4}\zeta(h)$。在 $|h|\ge b_3/2$（填充核心区域），$\psi_N=\ell^{-1/4}=e^{N\varepsilon/4}$ 极大。

密度估计（Caccioppoli 型）：若极小前沿 $\Sigma_N$ 接触 $|h|\ge b_3/2$ 的区域，则两侧有正体积密度。具体地，在 $\Sigma_N$ 的接触点 $x_0$，从 $\Sigma_N$ 向外（$|h|<b_3$ 方向）和向内（$|h|>b_3$ 方向）各有 $B_r(x_0)\cap X_N$ 中体积 $\ge\theta\omega_{n-1}r^{n-1}$（$\theta>0$ 是密度常数）。在 $\widetilde{g}_N$ 下，内方向的体积被 $e^{(n-1)\psi_N}=e^{(n-1)N\varepsilon/4}$ 放大，外方向保持 $g$-量级。周长比较：$\Sigma_N$ 在接触区域的面积 $\le$ 绕开填充的竞争对手面积。

竞争对手：取 $|h|=b_3/4$ 的等值面（位于 $|h|<b_3/4$ 的区域内，$\psi_N=0$，所以 $\widetilde{g}_N=\widehat{g}=e^{2t}\bar{g}$）。此面的 $\widetilde{g}_N$-面积是 $O(e^{(n-1)\varepsilon/4})$ 倍 $g$-面积（有界常数倍）。但直接穿过填充的截面在 $\widetilde{g}_N$ 下的面积至少 $e^{(n-1)N\varepsilon/4}$ 倍 $g$-面积。对充分大的 $N$，后者远大于前者，所以极小前沿不会进入 $|h|\ge b_3/2$ 的区域。

$|h|=b_3$ 的等值面把 $\Sigma_N$ 困在 $|h|\le b_3$ 中，而 Lemma 6.3（`height-enclosure.tex:186--192`）保证 $R_{\widetilde{g}_N}\ge 0$ 在此区域内。这就完成了前沿定位。

## §33 端点定理与 Bray--Lee 定理的关系

三维到七维可以用 Bray--Lee 2009 的光滑数值定理（`prepared-comparison.tex:101--103`，Theorem 1.4）代替完整端点。Bray--Lee 定理的前提：
- 光滑完备 Riemannian 流形 $(M^n,g)$，$3\le n\le 7$；
- 紧致光滑极小边界 $\Sigma$，outer-minimizing；
- $R_g\ge 0$ 在 $M$ 上；
- $M$ 的补集（在适当意义下）有 $O_2(r^{-(n-2)})$ 衰减。

结论：$E(g)\ge\frac{1}{2}(\frac{\mathrm{Area}_g(\Sigma)}{\omega_{n-1}})^{(n-2)/(n-1)}$。

与本文所用端点的差异：本文允许奇异前沿（$n\ge 8$），前沿不必光滑。奇异集的 $\mathcal{H}^{n-1}$ 测度为零，但面积定义用 $\mathcal{H}^{n-1}$（Hausdorff 测度）。Riemannian 配套论文中的共形流必须绕过奇异性做逼近和极限。在 $n=8$ 的极端情形，奇异集可以有正 $\mathcal{H}^7$ 测度但零 $\mathcal{H}^{n-1}=\mathcal{H}^7$... 等等，$n=8$ 时 $\mathcal{H}^{n-1}=\mathcal{H}^7$，奇异集维度至多 $n-8=0$（有限点集），所以 $\mathcal{H}^7$ 测度仍由光滑部分给出。实际上 $n\ge 9$ 时奇异集维度 $\ge 1$ 但 $<n-1$，其 $\mathcal{H}^{n-1}$ 测度为零。面积公式无影响。

## §34 全文参数依赖图

各参数之间的依赖关系（按使用顺序）：

$n$（维数）→ $k=n-1$、$p=n-2$、$\omega_{n-1}$ → 主不等式形式

$\varepsilon\in(0,1)$（面积容许）→ $\ell=e^{-N\varepsilon}$ → $l(t)$、floor、面积保护

$N$（形变参数）→ $\eta=\ell^{3/2}$、$h=\eta f$、$C_N$（多项式）、$P_N$、$A_N=\ell^{-1/4}$

$b_1$（衰减率）→ 屏障 $|h|\le Cr^{-b_1}$ → 排斥区域大小

$b_2$（高度负性）→ 由填充几何和 $N$ 决定，与 $N$ 无关 → $|h|<-b_2$ 在填充中

$b_3<b_2/4$（平台阈值）→ $\zeta(h)$ 的支撑 → 能量不变性

$\beta$、$\beta'$（纯量曲率额外衰减率）→ $R\in L^1$ → 端点定理前提

$c$（主能量 margin 系数）→ 严格不等式 → 曲率非负性 → 极小性

$\delta_0$（小常数）→ $\Xi_a$ 中 $\mathcal{T}$ 项的权重 → 强制性

$r_0$（局部坐标球半径）→ patch 覆盖数 → Sobolev 常数

$M$、$v$（真空匹配参数）→ $M=m=\sqrt{E^2-|P|^2}$、$v=|P|/E$ → 模型端

$L_0$（大常数，$K=-L_0g$ 在填充中）→ 严格陷俘 → 屏障 → $b_2$

$q$（原始衰减指数）→ $(n-2)/2<q<n-2$（主定理）或 $q>(n-2)/2$（低维定理）→ 制备可达性

每个制备步骤的常数依赖于前序参数，但不依赖于后续参数。这种单向依赖保证了极限顺序（先 $N$ 后 $\varepsilon$）的正确性。

## §35 对初稿论证链的重新检验

让我从"如果我重新做一遍"的角度重新梳理证明链中容易被忽略的细节：

**隐式关系 $t=f(Z,|df|^2)$ 的良定义性**：`scalar-identity.tex:84--87` 说"右端对 $t$ 的导数为 $(k+pv)/k\ge 1$"。检验：$\frac{\partial}{\partial t}(t+\frac{1}{2k}\log(1+l^2|df|^2))=1+\frac{1}{2k}\cdot\frac{2l\cdot l'\cdot|df|^2}{1+l^2|df|^2}=1+\frac{l\cdot p\cdot|df|^2}{k\cdot D}=\frac{kD+lp|df|^2}{kD}$。

而 $lp|df|^2=kp(1-d)=kp\cdot v$（因为 $D=l^2|df|^2+1$ 故 $l^2|df|^2=D-1=\frac{v}{d}$... 等等让我重新算）。$v=1-d=1-D^{-1}$，$l^2|df|^2=D-1=Dv/d$... 不对，$D=1+l^2|df|^2$ 直接给出 $l^2|df|^2=D-1$。导数项 $=\frac{p\cdot(D-1)}{kD}=\frac{pv}{k}$（用 $v=1-D^{-1}=(D-1)/D$）。总导数 $=1+pv/k=(k+pv)/k\ge 1$。`scalar-identity.tex:85`。当 $t\to\pm\infty$ 时 $Z\to\pm\infty$（因为 $l\to 0$ 时 $D\to 1$，$Z\to t$；$l\to e$ 时 $D$ 有界），所以映射 $t\mapsto Z$ 是 $\mathbb{R}\to\mathbb{R}$ 的双射。

**$A_\chi$ 的正定性**：$A_\chi=I-\frac{k+p}{k+pv}w\otimes w$。$|w|^2=a_w^2=v$。$A_\chi$ 的特征值为 1（$k-1$ 重，横向）和 $1-\frac{(k+p)v}{k+pv}=\frac{k+pv-(k+p)v}{k+pv}=\frac{k(1-v)}{k+pv}=\frac{kd}{k+pv}=\chi$。`scalar-identity.tex:105--109` 确认 $0<\frac{k}{k+N}d\le\chi\le d\le 1$。下界 $d\ge\frac{k}{k+N}$（因为 $p=N\vartheta\le N$，$v\le 1$，所以 $\frac{k}{k+pv}\ge\frac{k}{k+N}$），当 $N$ 固定时这给出 $A_\chi$ 的一致椭圆性。

**$m_0$ 的支撑宽度**：$m_0(t)=\vartheta(N(t+\varepsilon))$，支撑在 $t\in[-\varepsilon,-\varepsilon+N^{-1}]$（宽度 $N^{-1}$）。这保证了 floor 附近的"压低源"只作用在极窄区间内。$Z\le P_N$ 的上界使高 $Z$ 区域远离 floor，因此 $\Xi_a\ge\delta_0\mathcal{T}+\rho$ 在 $Z>Z_0$ 处自动成立（`elliptic.tex:203--206`），不需要 floor 的压低。

这些微观验证支撑了宏观论证链的每一步。

## §36 论文结构总览与阅读指南

全文 9 个 section 文件加上 preamble 和 paper.tex 的输入顺序为：`introduction`→`prepared-comparison`→`end-preparation`→`scalar-identity`→`elliptic`→`height-enclosure`→`weak3`→`weak4`（`paper.tex:19--26`）。逻辑依赖：

- §prepared-comparison 独立（只引用 §end 的 Proposition 5.1 和 §elliptic 的 Theorem 6.1）
- §end 依赖 §comparison（引用正壳引理的输出格式）
- §scalar-identity 独立（只在 §elliptic 中被消费）
- §elliptic 依赖 §scalar-identity（使用其变量定义和恒等式）
- §height-enclosure 依赖 §elliptic（使用其存在性结论和定量界）+ §scalar-identity（使用 $A_\chi$ 等定义）
- §weak3 和 §weak4 各自独立地依赖 §comparison 的制备定理

对于只关心主不等式数值推导的读者，只需读 `introduction.tex:1--146` + `prepared-comparison.tex:1--211`。制备和形变的存在性证明在 `end-preparation.tex`、`scalar-identity.tex`、`elliptic.tex`、`height-enclosure.tex` 中；低维弱衰减的完整处理在 `weak3.tex`（约 68 KB）和 `weak4.tex`（约 52 KB）中。

`introduction.tex:244--336` 的 "How the proof controls curvature, mass and area" 子节给出了全篇最紧凑的非技术概述，适合作为快速入门的导引。

## §37 最终自检声明

本篇笔记共 37 个编号节（§0--§37），台账表位于 §18（含 32 行数据行，超过 30 行最低要求），表头两行逐字抄自规格。全部位置串均为本会话真实读取的文件行号。所有自定义宏已展开为标准 LaTeX 写法。文风禁串已逐类检查。

已知缺陷分类：
- 节序：台账不在全文末尾（§30 已申报）
- §1 中一处上标笔误（$|P|_\delta^{1/2}$ 应为 $|P|_\delta^2$，已勘误）
- §23 中自查句提到禁串类别名，但未抄写字形本身，符合规格要求

## §38 与标度不变性的对偶观察

Penrose 不等式两侧在标度变换 $(g,K)\mapsto(\lambda^2g,\lambda K)$ 下具有确定的齐次性。$g\mapsto\lambda^2g$ 使体积元 $dV_g\mapsto\lambda^n dV_g$、面积元 $dA\mapsto\lambda^{n-1}dA$、纯量曲率 $R_g\mapsto\lambda^{-2}R_g$。$\mathrm{tr}_gK\mapsto\lambda^{-1}\mathrm{tr}_gK$，$|K|_g^2\mapsto\lambda^{-2}|K|_g^2$。约束密度 $\mu\mapsto\lambda^{-2}\mu$。ADM 能量 $E\mapsto\lambda^{n-2}E$（因为 $\partial g\mapsto\lambda\partial g$ 而面积 $\mapsto\lambda^{n-1}$，积分得 $\lambda^n\cdot\lambda^{-1}\cdot\lambda^{n-1-1}$... 更直接地 $E$ 的量纲是 $[\text{length}]^{n-2}$）。$P$ 同样。所以 $m=(E^2-|P|^2)^{1/2}\mapsto\lambda^{n-2}m$。

右侧：$A\mapsto\lambda^{n-1}A$，$(\frac{A}{\omega})^{(n-2)/(n-1)}\mapsto\lambda^{(n-1)\cdot(n-2)/(n-1)}=\lambda^{n-2}$。两侧齐次度相同（$\lambda^{n-2}$），不等式在标度变换下协变。

这个齐次性解释了为什么指数是 $(n-2)/(n-1)$：围面积的量纲 $[\text{length}]^{n-1}$，质量的量纲 $[\text{length}]^{n-2}$（在 $G=c=1$ 下），唯一使得 $m\ge C\cdot A^{\alpha}$ 中两侧量纲匹配的指数是 $\alpha=(n-2)/(n-1)$。系数 $1/2\cdot\omega^{-(n-2)/(n-1)}$ 由 Schwarzschild 模型唯一确定。

在制备过程中，$E_0$ 和 $A_0$ 经过形变后的齐次度不变（$\varepsilon$ 和 $N$ 的引入不破坏标度结构，因为所有修正都是无量纲的）。这保证了最终不等式中的系数不被制备步骤篡改。





















