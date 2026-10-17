# D426 固定 Kerr 时空附近带平方可积联络的一般性未来不可延拓性

研究笔记 · 编号 D426 · 写作日期 2026-10-10 · 论文落款 2026-09-23

## 0 这一单到底在说什么

我这次读的是一个 Baire 范畴式的陈述：固定一个转动的亚极端 Kerr 桥，质量 $M>0$，带符号的转动参数满足 $0<|\mathfrak a|<M$，那么在这座桥的光滑真空数据附近，"其整体最大双曲发展 $(M_d,g_d)$ 允许一个未来 $C^0\cap W^{1,2}_{\mathrm{loc}}$ 延拓"的那些数据组成加权光滑拓扑里的贫集（main.tex:14-21）。我自己把这句话拆成三块来记：延拓的正则性级别、数据邻域的级别、以及"贫集"这个词真正允许我做什么。

第一块最要紧。延拓度量 $\widetilde g$ 只需连续、非退化，分量在光滑坐标卡里属于 $W^{1,2}_{\mathrm{loc}}$（introduction.tex:52-58），并且要求存在一条未来指向类时 $C^1$ 曲线 $c:[0,1]\to\widetilde M$ 满足 $c([0,1))\subset\iota(M_d)$ 而 $c(1)\in\partial\iota(M_d)$（introduction.tex:59-64）。像 $M_d$ 之外没有任何场方程或整体双曲性要求（introduction.tex:65-66）。第二块：邻域只要求第十个加权半范数小，$\mathcal U_{\epsilon}=\{d\in\mathcal D:p_{10}(d-d_*)<\epsilon\}$（introduction.tex:40），而半范数族是

$$
p_m(u,v)=\sum_{j=0}^m\Bigl(\sup_{\Sigma}\rho^{1+j}|\nabla_*^j u|_*+\sup_{\Sigma}\rho^{2+j}|\nabla_*^j v|_*\Bigr),\qquad m=0,1,\dots
$$

（introduction.tex:26-29），拓扑由差分上的全体 $p_m$ 生成。第三块："贫集"按论文的定义是可数多个相对无处稠密集之并（introduction.tex:108），所以论证必须先把所有可能的延拓装进可数次测试里，再对每次数一个无处稠密。这三块合起来就是我这次真正要盯着的东西：$p_{10}$ 只控制到十阶，而范畴论证要能调用任意有限高阶，两者之间的缝隙全靠"$e^{o(T)}$"这一类约定填补（background.tex:167-177）。

约束面我也记清楚：数据 $\mathcal D$ 里的 $(h,K)$ 满足真空约束

$$
R(h)+(\operatorname{tr}_hK)^2-|K|_h^2=0,\qquad \operatorname{div}_hK-\mathrm d(\operatorname{tr}_hK)=0
$$

（introduction.tex:34-35），除此之外不规定任何领头渐近系数、电荷值或宇称条件（introduction.tex:42-45）。这条"什么都不额外规定"的取舍，是我全部构造成本的来源。

本单素材范围（只读 `build/` 下 `.tex`，逐字登记如下）：`main.tex`、`macros.tex`、`companion-references.tex`、`figures/` 两张、`refs/sources.bib` 未取正文，以及 `sections/` 下七片 attachment_signal（484 行）、background（525 行）、holonomy_category（562 行）、introduction（291 行）、nonlinear_comparison（1322 行）、packet_preparation（743 行）、weak_exits（588 行），合计 233,978 字节。

preprints/Generic-Future-Inextendibility-with-Square-Integrable-Connection-Near-a-Fixed-Kerr-Spacetime-September-23-2026
其他队列第 249 行号

## 1 阈值的来历：为什么正好卡在 $W^{1,2}$ 上

我一开始把这篇论文看成"把 $C^1$ 情形再降一阶"的例行工作，读完引言才纠正过来：这一阶下降动的不是估计的强度，是整个论证的立足点。Christodoulou 在把强宇宙监督表述为弱解问题时，就把联络系数平方可积当作自然阈值（introduction.tex:145-147）。Luk 的无对称构造给出了连续可延拓的相交零奇边界，其构造坐标里的 Christoffel 系数并不可积平方（introduction.tex:148-150）。Dafermos--Luk 的内稳定定理说明受控的内 Cauchy 数据的最大 Cauchy 发展可以在 Cauchy 视界的一段非平凡部分上承认连续 Lorentz 延拓（introduction.tex:151-156）。Sbierski 用和乐在局部 Lipschitz 级别上给出障碍（introduction.tex:156-159），后来又给出基于带符号积分曲率爆破的非对称判据（introduction.tex:159-160）。Cameron--Sbierski 在强球对称范畴得到 $C^0\cap W^{1,s}_{\mathrm{loc}}$、$s>1$ 的障碍，其局部判据还要额外假定与某个参考连续边界等价（introduction.tex:171-176）。这几条线放在一起，$s=2$ 恰好落在"迹与逐点控制全部失效"的那一侧。

$\Gamma$ 在这里的弱意义我抄了一遍才算真懂。对 merely continuous 的度量，先在光滑坐标卡里按下指标定义 Koszul 系数为分布：

$$
\Gamma^{\flat}_{i\,jk}=\tfrac12\bigl(\partial_jg_{ik}+\partial_kg_{ij}-\partial_ig_{jk}\bigr)
$$

（introduction.tex:72-75）。分布恒等式 $\partial_kg_{ij}=\Gamma^{\flat}_{i\,kj}+\Gamma^{\flat}_{j\,ki}$ 说明 $g\in W^{1,2}_{\mathrm{loc}}$ 等价于这些降指标系数有局部 $L^2$ 代表（introduction.tex:76-79）。在紧包含于更大坐标卡的坐标子域上，连续性与非退化同时界住 $g$ 与 $g^{-1}$，于是升指标与降指标都保持 $L^2$，得到通常的弱 Christoffel 阵（introduction.tex:79-83）。这里用的是分布导数，对连续函数"恰好几乎处处存在的导数"派不上用场（introduction.tex:83-85）。在 Definition 1.1 的度量下，弱系数在 $M_d$ 的开像上几乎处处与光滑联络一致（introduction.tex:85-87）。这套解释沿用 Geroch--Traschen 与 LeFloch--Mardare 的分布曲率框架，从 $W^{1,2}_{\mathrm{loc}}$ 推出 $L^2_{\mathrm{loc}}$ Levi-Civita 联络的正向蕴含见 LeFloch--Mardare 的 Proposition 4.4（introduction.tex:89-93）。紧包含子域上的这种局部正则性被光滑坐标变换保持（introduction.tex:94-95）。

引言末尾那句限定我读了三遍：以上事实没有一条给出联络在单独指定曲线上的迹（introduction.tex:95-96）。这句话就是我后面所有绕路的地图。

定理本身还埋了几条我很在意的"不承诺"。$\epsilon=\epsilon(M,\mathfrak a)$ 允许依赖固定的 Kerr 中心（introduction.tex:99-101,112）。没有任何关于 $|\mathfrak a|\to0$ 或趋于极端 $|\mathfrak a|\to M$ 的一致估计（introduction.tex:113-114）。邻域之外不主张一般性（introduction.tex:114）。不可延拓性也没有主张是开性质（introduction.tex:115）。拓扑是 Baire 的，这条记录在 $C^1$ 伙伴的 Lemma 2.4（introduction.tex:116-118；companion-references.tex:85-86），而下面的无处稠密证明直接给出所主张的可数覆盖。我先把这些"不承诺"当作约束条件：它们决定了每一步估计里常数可以依赖什么，见第 15 节的量级账。

## 2 第一条死路：在一条给定曲线上取联络的迹

我最先想复制的是 Sbierski 那类单曲线和乐论证。它的形状是这样的：取一条未来类时测地线，沿它带一个平行框架，考察小闭和的旁向方程

$$
\frac{\mathrm D^2}{\mathrm d\tau^2}W=R(\dot\gamma,W)\dot\gamma,
$$

若联络系数在 $\gamma$ 上有可积的逐点控制，就能把和乐的偏离与积分曲率联系起来。在 $C^1$ 或局部 Lipschitz 级别这一步是成立的，$\Gamma$ 有 $L^\infty$ 逐点界。到 $C^0\cap W^{1,2}_{\mathrm{loc}}$ 我立刻撞上两堵墙。

第一堵：$\widetilde\Gamma\in L^2_{\mathrm{loc}}$ 是一条一维曲线上的 restriction 未定义。测地线本身是待求对象，它的轨迹关于四维 Lebesgue 测度是零集，所以"几乎处处"这个词在曲线上毫无内容。$W^{1,s}$ 的迹定理要求 $s>2$ 才能在余维 3 的曲线上有迹；$s=2$ 正好卡在临界之下。第二堵更隐蔽：这里连测地线方程本身都在 ambient 一侧失效，$\widetilde g$ 的Christoffel 是 $L^2$，二阶 ODE 的唯一性论证不能运行。论文里那句"这里什么也没说：它没有解任何 ambient 测地线方程（边界处不求解）"（weak_exits.tex:389-390）就是对我这条路最直接的否定。

我也试过把 Cameron--Sbierski 的"与参考连续边界等价"这一条当作脚手架，把延拓度量和 Kerr 内部参考度量差成更好的正则性。那条假设在他们的应用里靠球对称刚性去掉（introduction.tex:174-178），我在转动情形没有刚性可用，去掉它就没有可比性。失败的原因我总结成一句：任何"逐条曲线"的策略都要在 ambient 一侧产生 trace，而本篇的 $L^2$ 只允许"对几乎每条曲线成立"的平均陈述。这个失败决定了第 4 节的形式：平均必须在初值相空间做，并且要能证明平均权重是正测度。

因此所有可用的信息只能是这种形状：给一个可测的初始种子集 $S\subset T\Sigma$，$\mu_d(S)>0$，其上每条测地线的整段轨迹都处在有限个坐标卡的联合覆盖里，且这些坐标卡里 $\|\widetilde\Gamma\|_{L^2}\le C$（weak_exits.tex:199-212）。这条陈述里没有一点 $\Gamma$ 的逐值信息，我后面所有环节都在付这个代价。

## 3 第二条死路：把首出图当作逐点控制来用

第二条弯路是把边界写成图以后当 Lipschitz 超曲面用。设延拓曲线离开 $M$，先做一个引理：可以把靠后一段换成一条直的类时首出段，平移到 $(0,0)$、方向竖直化，得到坐标 $(s,z)\in\mathbb R\times\mathbb R^3$，其中 $s$ 为时间向，锥 $|\eta|<c$ 内每个 $(1,\eta)$ 一致未来类时（weak_exits.tex:48-56）。底高 $-d_0<0$ 满足 $(-d_0,z)\in I^+_M(\Sigma)$（weak_exits.tex:56），竖段 $\{(s,z):-d_0\le s<f(z)\}\subset M$ 而 $(f(z),z)\in\partial M$（weak_exits.tex:57-58）。首出高度按 $\inf$ 定义：

$$
f(z)=\inf\{s\in[-d_0,2\delta]:(s,z)\notin M\},\qquad\inf\varnothing=2\delta
$$

（weak_exits.tex:107-110）。我原本打算直接用"$f$ 是 Lipschitz，故边界是 Lipschitz 超曲面，法向量 $\partial_s$ 一致横截"来做逐点测地线论证。这个打算在这里就断了。

断点有三处。第一处，那个 $\inf$ 的定义必须先把截断值 $2\delta$ 证明是惰性的：若 $f(z)>\delta$，则 $p_z=(-d_0,z)$ 与 $q_z=(\delta,z)$ 及其整个竖直连接段都在 $M$ 内，而折线 $p_z\to(0,0)\to q_z$ 的空间斜率都小于 $c/2$，把它的图与竖直段线性插值就得到一族端点固定的未来类时同伦，成员穿过 $(0,0)\notin M$，与引理 ex:homotopy 矛盾（weak_exits.tex:114-124）。于是 $f(z)\le\delta$，截断确实不生效，但同一段文字马上补了一句：$(f(z),z)\in\partial M$ 即便竖线在更高处重新进入 $M$ 也成立（weak_exits.tex:125-127）。也就是说 $f$ 只是"首次"离开的高度，边界点集与图之间没有单值关系。

第二处，$f$ 的 Lipschitz 常数同样要靠同一类同伦拿到：先把半径 $R$ 缩到 $2R/(d_0-\delta)<c/2$，取 $L>4/c$，若 $f(z')>f(z)+L|z-z'|$，选高度 $b'$ 使 $f(z)+2|z-z'|/c<b'<f(z')$，则折线 $(-d_0,z')\to(f(z),z)\to(b',z')$ 两段斜率都小于 $c/2$，再次与 ex:homotopy 矛盾（weak_exits.tex:129-144）。这里 $R/\delta<c/4$ 与 $0<\delta<d_0/4$ 的比例（weak_exits.tex:113,59-61）是锥宽 $c$ 与图振幅 $\delta$ 之间唯一的桥梁；我最初的版本把 $c$ 当成固定数、把 $\delta$ 当成可自由缩的小量，实际上两者必须互相缩。

第三处，也是我认为最有价值的一处：ex:homotopy 本身只用 $M$ 内部的整体双曲性。陈述是：$p,q\in M$，$H:[0,1]\times[0,1]\to\widetilde M$ 连续，每条 $H(r,\cdot)$ 是局部 Lipschitz 未来因果路径、切向量几乎处处因果，且 $H(0,[0,1])\subset M$，则整幅像落在 $M$ 内（weak_exits.tex:22-30）。证明靠的是把 $r$ 的集合写成既开又闭：开来自 $M$ 的开性与参数区间紧性；闭来自 $r\in A$ 时像含在内禀紧菱形

$$
K=J^+_M(p)\cap J^-_M(q)
$$

里，而 $K$ 在 Hausdorff 流形 $\widetilde M$ 中的像是紧的从而闭（weak_exits.tex:32-43）。我原先以为这种"因果同伦不能穿过边界"需要 ambient 一侧的因果理论；实际上完全不需要，ambient 只用来提供连续性与紧致像的闭性。这个认识把我从"在 $\widetilde M$ 里做微分几何"拉回到"在 $M$ 里做微分几何、在 $\widetilde M$ 里只做拓扑"。

## 4 第一个转折：相空间平均与截面体积守恒

转折点是放弃"指定曲线"，改成"指定初值的正测度集"，然后让 Fubini 替我做逐点的工作。具体机制分四层，我把量级都记下来。

第一层是选盒子。对 $K>1$ 与 $D'\Subset D$，存在 $l_n\downarrow0$ 与 $z_n\in D'$ 使盒子 $Q_l(z)=\{(s,y):|y-z|<Kl,\ |s-f(z)|<Kl\}$ 满足归一化联络质量趋零：

$$
l_n^{-3}\int_{Q_{l_n}(z_n)}|\widetilde\Gamma|\,\mathrm ds\,\mathrm dy\longrightarrow0
$$

（weak_exits.tex:149-161）。做法是在紧坐标区域上 $L^2$ 蕴含 $L^1$，把所有这类盒子塞进一层

$$
\mathcal L_l=\{(s,y):y\in D'',\ |s-f(y)|\le K(1+L)l\},\qquad D'\Subset D''\Subset D,
$$

对每个 $(s,y)$ 可能的中心 $z$ 的体积不超过 $C_Kl^3$，于是 Tonelli 给出 $\int_{D'}l^{-3}\int_{Q_l(z)}|\widetilde\Gamma|\,\mathrm ds\,\mathrm y\,\mathrm z\le C_K\int_{\mathcal L_l}|\widetilde\Gamma|$；再用 $f$ 的图的四维 Lebesgue 测度为零（Fubini）与 $L^1$ 积分的绝对连续性让右边趋零，最后取"不超过平均质量"的中心（weak_exits.tex:164-186）。这一层只用了一次逐点信息：选到的中心 $z_n$ 存在，我不控制它的位置。

第二层是初值集的体积下界。在 $(s_0,z)$，$|z-z_c|<\rho_0l$ 处把单位初速按斜率参数化：$U=N(1,\eta)$，$N=[-\widetilde g((1,\eta),(1,\eta))]^{-1/2}$，$\pi_i=N(\widetilde g_{i0}+\widetilde g_{ij}\eta^j)$。对斜率变量求导得到的 Jacobi 阵是

$$
\frac{\partial\pi_i}{\partial\eta^j}=N\widetilde g_{ij}+N^3(\widetilde g_{i0}+\widetilde g_{ik}\eta^k)(\widetilde g_{j0}+\widetilde g_{jk}\eta^k)
$$

（weak_exits.tex:240-256），它一致正定，因为空间块 $\widetilde g_{ij}$ 一致正定；这一步用的是连续性，没有用到 $\widetilde g$ 的任何导数（weak_exits.tex:248-251）。于是得到的开初态集 $A_l$ 满足

$$
c_1l^3\le|A_l|\le C_1l^3
$$

（weak_exits.tex:262-266）。这个 $l^3$ 是后面所有平均的分母。

第三层是停在光滑一侧的流。从每个 $x\in A_l$ 出发沿完整 $M$ 里的极大测地线走，用 $s$ 作参数，只要还在该坐标卡且 $|\eta|<2\epsilon_0$；另外在 $s=s_1$ 或盒子面处停（weak_exits.tex:271-275）。停之前 $|z(s)-z_c|\le(\rho_0+4\epsilon_0)l<l$，所以空间盒子面根本到不了（weak_exits.tex:276-279）。命中映射 $\Phi_s:D_s\to T^*\{s=\text{const}\}$ 在 $(z,\pi)$ 坐标里光滑单射，$\dot s>0$，后向唯一性从末态复原同一初态（weak_exits.tex:286-291）。这里我停顿了很久：$D_s$ 随 $s$ 变化，命中时刻不固定，凭什么体积守恒？答案在单位质量壳的几何：在 $\mathcal H=\tfrac12g^{\alpha\beta}\pi_\alpha\pi_\beta=-\tfrac12$ 上 $\partial\mathcal H/\partial\pi_0=\dot s>0$，故 $\pi_0=-h(s,z,\pi)$ 是光滑根，约化 Hamilton 方程

$$
\frac{\mathrm dz^i}{\mathrm ds}=\frac{\partial h}{\partial\pi_i},\qquad\frac{\mathrm d\pi_i}{\mathrm ds}=-\frac{\partial h}{\partial z^i}
$$

在 $(z,\pi)$ 里散度为零，从而 $\Phi_s^*(\mathrm d^3z\,\mathrm d^3\pi)=\mathrm d^3z\,\mathrm d^3\pi$（weak_exits.tex:291-307）。等价的说法是：限制辛形式在单位壳上的核正是流方向，命中时间随初态变化的那些附加导数在 pullback 里消失（weak_exits.tex:308-312）。这就是第 5 节里"一个横截面命中映射保持被限制的二维形式及其三次外幂"那条一般陈述的原型（background.tex:286-293）。

第四层是把平均换成斜率控制。记

$$
I(x)=\int_{\text{停之前}}|\Gamma_M(\gamma_x(\tau))|\,\mathrm ds,
$$

用截面体积守恒与 Tonelli 以及动量纤维的一致有界性得到

$$
\int_{A_l}I(x)\,\mathrm dx=\int_{s_0}^{s_1}\int_{\Phi_s(D_s)}|\Gamma_M(s,z)|\,\mathrm d^3z\,\mathrm d^3\pi\,\mathrm ds\le C\int_{Q_l(z_c)}|\widetilde\Gamma|\,\mathrm s\,\mathrm z=o(l^3)
$$

（weak_exits.tex:314-330）。最要紧的是下面这段说明：弱与光滑 Christoffel 阵只是 $M$ 上的几乎处处相等，这就够了，同一套相改变量与 Fubini 说明它的例外坐标零集在几乎每条初弧上的时间测度为零（weak_exits.tex:331-336）。我读到这里确认第 2 节的死路确实被绕开了：全程没有对单独指定的曲线取 Sobolev 迹。

斜率方程 $\dfrac{\mathrm d\eta^i}{\mathrm ds}=-\Gamma^i_{\alpha\beta}V^\alpha V^\beta+\eta^i\Gamma^0_{\alpha\beta}V^\alpha V^\beta$（$V=(1,\eta)$）给出停之前 $|\mathrm d\eta/\mathrm ds|\le C_2|\Gamma_M|$（weak_exits.tex:338-347）。由 $|A_l|\asymp l^3$ 与 $\int_{A_l}I=o(l^3)$，$l$ 足够小时存在 $G_l\subset A_l$，$|G_l|\ge|A_l|/2$，使 $I(x)<\epsilon_0/(2C_2)$；这些弧上斜率始终小于 $3\epsilon_0/2$，够不到更宽的阈值 $2\epsilon_0$，而位置估计已经排除坐标卡与盒面两种停法（weak_exits.tex:348-353）。剩下的收尾是反证：若某条这样的弧活过 $s_1$ 还在 $M$ 内，取支撑在 $(s_0,s_1)$ 内、$\beta(s_c)=1$、$|\beta'|\le C_\beta/l$ 的鼓包，令 $z_r(s)=z(s)+r\beta(s)\Delta z$，$|\Delta z|\le(\rho_0+2\epsilon_0)l$，则每条图 $(s,z_r(s))$ 的空间斜率仍小于 $c$（靠第 3 节那组比例约束），首条是内部的测地弧、末条穿过 $(s_c,z_c)\in\partial M$，与 ex:homotopy 矛盾（weak_exits.tex:355-370）。于是每条 $G_l$ 中的弧都有极大的"停之前"高度 $s_*\le s_1$，且没有斜率或坐标卡停法；单位归一化给出

$$
0<c_3\le\dfrac{\mathrm ds}{\mathrm d\tau}=N\le C_3
$$

（weak_exits.tex:371-376），所以到 $s_*$ 的固有时有限，斜率有界又给出紧子矩形里的位置极限；极限若在 $M$ 内就得到光滑延拓、与极大性或存活弧矛盾，故在 $\partial M$，从而"刚刚证明的有限寿命就是完整未来寿命"（weak_exits.tex:377-391）。

我还特意核对了"所有初态都真能与 $\Sigma$ 相交"这一步。极大类时测地线没有内禀因果端点：在假想端点附近的紧光滑时间坐标卡里所有因果斜率 $\eta$ 有界，而时间分量方程

$$
\dfrac{\mathrm d}{\mathrm ds}\log\dfrac{\mathrm ds}{\mathrm d\tau}=-\Gamma^0_{\alpha\beta}(1,\eta)^\alpha(1,\eta)^\beta
$$

右边有界且 $s$ 有有限端点，故 $\mathrm ds/\mathrm d\tau$ 有正上下界、仿射时长有限、速度有界，光滑测地线方程给出速度极限与延拓；反向取向同理处理过去端点。于是极大类时测地线因果不可延拓，Cauchy 性质迫使它与 $\Sigma$ 恰交一次（weak_exits.tex:392-412）。往回命中 $\Sigma$ 的映射保持正则截面体积（weak_exits.tex:414-429），可数二基给出 $A_l$ 的一个开邻域让命中与命中时间都光滑，其中某个邻域与 $G_l$ 交成正测度，取 $S$ 为其像（weak_exits.tex:417-432）。最后把有限个前向流管的紧性与"每个坐标卡可取为更大坐标卡的紧子集"合并，就得到命题 prop:exit-family 要的坐标见证 $(C,m)$（weak_exits.tex:433-445）。

## 5 把延拓见证计数化：$E(O,B)$ 与 $.99$ 密度

有了正测度族，下一个问题是我原以为最琐碎、其实最不琐碎的一步：怎么把"存在某个延拓"变成可数个闭不闭都无所谓的测试。这里我又走错一次。我最初的写法是：对每个 $O$ 定义"存在延拓使 $S\subset O$ 且逐点界为 $B$"，然后主张该集是闭的，于是由无处稠密直接得结论。这个主张没有依据。原因在定义里写得很硬：所有管常数、坐标卡、发射小片与 $T$ 的子列都是"对给定数据的存在性见证"，它们既不是额外的可数指标，也不要求在给数据的邻域里继续有效（weak_exits.tex:517-520）。数据变了，见证可以整个换掉，闭性无从谈起。测试 $E(O,B)$ 也不做任何闭性主张（weak_exits.tex:529）。

正确的计数化是：取 $T\Sigma$ 中坐标球的可数基 $\mathcal B$，中心与半径在可数坐标 atlases 下取有理数，使这个基对任意光滑正密度都足以做 Lebesgue 微分（weak_exits.tex:472-479）。对 $O\in\mathcal B$ 与整数 $B\ge1$，令 $E(O,B)\subset\mathcal U_\epsilon$ 由两条条件定义。第一条：存在指定正则性的延拓，存在可测 $S\subset O$ 满足

$$
\mu_d(S)>.99\,\mu_d(O),
$$

其上每种子有有限完整未来寿命；沿每条这样的整测地线从 $\Sigma$ 到其端点见证坐标条件至多用 $\le B$ 个预紧 ambient 坐标卡；每个 $V_j$ 上度量范数、逆度量范数、Christoffel 的 $L^2$ 范数都不超过 $B$；每点选定的坐标卡里速度范数 $\le B$、到 $\mathbb R^4\setminus V_j$ 的欧氏距离 $\ge1/B$（weak_exits.tex:487-502）。第二条：存在满足引理 lem:bg-branch-tube 三部分的观测邻域 $\mathcal N$，$\overline O\subset\mathcal N$，光学排序取 $v\to\infty$，并且一份见证（中心分支轨道、紧状态区间、$p$ 的正界、早期的横截流管、区间 $J$、观测盒、容许发射小片、无界 $T$ 列、常数 $u_2,c_2,c_0$）对 $\overline{\mathcal N}$ 中每种子通用（weak_exits.tex:503-516）。

$.99$ 这个数字我起初以为是装饰，后来确认它承担三处功能。一处是第 14 节里两次扣除之后还剩 $.91$：两族好种子各自损失不超过 $.01$ 倍测度，合并损失小于 $.04\mu_d(O)$（holonomy_category.tex:441-530 区间内的联合好参数估计）。二处是它严格大于 $1/2$，与第 4 节 $|G_l|\ge|A_l|/2$ 那种"至少一半"的余量兼容。三处是它与可数基的微分性质配合：在密度点 $w$ 取 $O\ni w$ 使 $\mu_d(S_*\cap O)>.99\mu_d(O)$，而为了让指标可数，把以密度点为心的小球按任意小相对量放大成有理心半径的球，光滑正密度保持测度可比，相对补测度仍趋零（weak_exits.tex:560-576）。这段是我认为本篇被低估的一处小心：可数化不是免费的，它要求对放大的误差有绝对控制。

覆盖命题就是这两条的合取：任何有未来 $C^0\cap W^{1,2}_{\mathrm{loc}}$ 延拓的数据必属某个 $E(O,B)$，故可延集恰为

$$
\bigcup_{O\in\mathcal B}\ \bigcup_{B=1}^{\infty}E(O,B)
$$

（weak_exits.tex:531-542）。证明里有一条我很在意的顺序安排：先用引理 prop:bg-runout 说 $S_*$ 中每种子都跨过比较柱面 $\mathcal S$ 且首次比较逃逸是分支或角点、角点成 $\mu_d$ 零集（weak_exits.tex:544-558），再取密度点，再套引理 lem:bg-branch-tube。也就是说首次逃逸只被用来"定位更早的观测"，它完全不必是 ambient 意义上的端点（weak_exits.tex:581-587）。角点零集性靠伙伴的两条输入：$C^2$ 伙伴的推论 8.6 做完整寿命分类、引理 8.7 给角点比例估计，$C^1$ 伙伴的命题 3.10 做截面体积角点剔除，后者对 $T\Sigma$ 上任意光滑正度量都成立（background.tex:295-317；companion-references.tex:16-19,93-94）。

还有一条实现细节：以后做平均时，一个点与速度同时满足多个坐标卡条件就取最小指标，坐标余量与速度的有限个条件是内禀单位壳上的 Borel 条件，于是得到可测选择器，即使它依赖动量（weak_exits.tex:523-529）。我在第 13 节会看到这个"最小指标"如何与"停时"一起保住可测性，那是一处很容易写坏的地方。

## 6 振幅之选：$A_T=e^{-\kappa T/4}$ 与 $\sqrt a$ 的关系

观测处的前因子写成双零形式 $g=-2a\,\mathrm du\,\mathrm dv+\gamma_{AB}(\mathrm d\theta^A-b^A\mathrm du)(\mathrm d\theta^B-b^B\mathrm du)$，其中 $a=q\mathcal A$，$q=q_0e^{-\kappa(u+v)}$，$q_0,\kappa>0$（background.tex:122-129）。观测时刻取 $v\in T+J$、$u$ 收敛到 $u_*\in\mathbb R$，于是 $a\asymp e^{-\kappa T}$，$\sqrt a\asymp e^{-\kappa T/2}$。本篇的波包振幅定为

$$
\alpha=\kappa/4,\qquad A_T=e^{-\alpha T},\qquad\lambda=e^{\zeta T}
$$

（packet_preparation.tex:21-24），引言里补了一句：$A_T$ 严格大于 $\sqrt a$（introduction.tex:242-246），第 26-27 行也重复了这一点（packet_preparation.tex:25-27）。

我试过三个候选量级，只有这个通过。候选一：$A_T=\sqrt a=e^{-\kappa T/2}$，即把振幅取成临界大小。它的信号 $\lambda^2A_T$ 仍大，但低误差系统里的相对因子会把二次余量吃掉。我在第 10 节抄到的那条椭圆估计 $|\Delta\xi_j|_1\le C(\sigma^{-1}Z_i+P)$（$\sigma=\sqrt q$，nonlinear_comparison.tex:795-905）说明角向 div--curl 步骤要付 $\sigma^{-1}$，即 $e^{\kappa(u+v)/2}$ 这一档的损失；如果振幅是 $\sqrt a$，二次项 $A_T^2$ 与损失 $\sigma^{-1}$ 的乘积就不再严格小于线性项，bootstrap 与插值都缺间隙。这一段是我的重构，论文没有直接写"$\sqrt a$ 失败"，我标为推测，理由是它只写了 $A_T>\sqrt a$ 这个不等号并把它当作前提用。候选二：$A_T=e^{-\kappa T/3}$，介于两者之间。它能给出间隙，但间隙是 $\kappa T/12$ 这个量级，插值需要的 $\vartheta=(k+2)/M$ 余量（第 10 节）与 $\eta_0<\alpha/2$ 的模板改动余量（nonlinear_comparison.tex:1174-1322）合起来比它大，余量不够分。候选三：$A_T$ 更大，比如 $e^{-\kappa T/8}$。此时 $p_{10}$ 小性不再保证 $p_m(d_T-d)\to0$ 所需的代价可控，而且和乐侧的 $Q_Te^{-\kappa T}$ 项（holonomy_category.tex:267-270）与 $A_T$ 的比较要反过来用 $Q_T$ 的多项式增长去顶，风险更大。定在 $\kappa/4$ 的妙处是三件事同时对上：信号 $>2A_T$ 而配对后的持续性下界恰好写成 $A_T$（attachment_signal.tex:178-187；holonomy_category.tex:449-455）；比较误差 $e^{-(1+c)\alpha T}$ 相对 $A_T=e^{-\alpha T}$ 有干净的指数间隙（nonlinear_comparison.tex:54-59）；$A_T^2=e^{-2\alpha T}$ 提供的 $L^2$ 指数经插值衰减后仍跨过 $(1+c)\alpha$。

$\zeta>0$ 的选取时机我特意记下来，因为它决定了整篇参数依赖图的形状：小常数 $\zeta$ 只在所有有限的基座阶与损失容差定完之后才选（packet_preparation.tex:25-27,728-743；nonlinear_comparison.tex:1191-1220）。等价的说法写在命题的尾巴上：在那些最终由主定理请求的有限高阶入口阶上，真实场有 $e^{o(T)}$ 界（packet_preparation.tex:78-81）。这里 $e^{o(T)}$ 的含义是约定 conv:bg-subexp：对每个 $\delta>0$ 存在 $C_\delta,T_\delta$ 使 $Q_T\le C_\delta e^{\delta T}$，正量的双侧界同时界住倒数，常数可依赖给定数据与所选阶（background.tex:167-177）。

## 7 第三条死路：借用伙伴的单点极化与整片 footprint

$C^1$ 伙伴的波包定理本身只给出单点极化（introduction.tex:217-218）。我一开始以为可以直接把它引过来：在观测盒里挑一个中心点 $(u_c,v_c,\theta_c)$，让 $p_0$ 在该点非零，然后用有限 Cauchy 稳定性把该点的信号传到附近数据上。这条路在范畴论证里断了，断点在第 14 节：我要同时对两个延拓见证把和乐估计压小，被压小的区域是一个测度集；单点信号没有测度可言，而位置平均产出的例外集 $\mathcal N_T$ 是按 $\nu_T$ 度量的（holonomy_category.tex:261-265）。所以我必须自己证整片下界：在整个观测盒 $\mathcal Q_T$ 上

$$
|(p_0)_{AB}|_\gamma\ge e^{-o(T)}
$$

（packet_preparation.tex:58-60）。做的方式是把极化取成实的、无迹、单位化的 $2^{-1/2}(e^1\otimes e^1-e^2\otimes e^2)$，其中 $e^1,e^2$ 由入口屏幕度量对固定光滑局部余标架正交化得到，再乘上一个在整个足印集的开邻域上至少为一的鼓包（packet_preparation.tex:142-149）。关键的传播事实是：领头输运是实的，保持无迹与湮灭 $k_v$，在正屏幕商上作用为等距平行输运乘一个实的非零标量；该标量及其倒数都是 $e^{o(T)}$，因为它的对数是膨胀系数的积分（packet_preparation.tex:152-158）。这样就得到在足印集内每点、在整个 $\mathcal Q_T$ 上一致的下界，而且明确写了没有单点相位调整（packet_preparation.tex:159）。另一个细节也省下不少力气：极化只在那一个小坐标片上存在，完全无需在 $\mathbb S^2$ 上全局选一个处处非零的无迹张量（packet_preparation.tex:150-152），这是我在球面拓扑上白担心的一场。

发射小片的尺寸与精度阶的解耦，是我从伙伴那里继承的第二条硬约束：片的大小由低阶射线与领圈构造定，独立于后面的导数与精度选取（background.tex:358-367；packet_preparation.tex:183-190）。正幂 $s+3/2$ 与后续精度的无关性有一段明确的账：受约束光束在一个固定的三维中心片上叠加，归一化取 $(\lambda/2\pi)^{3/2}$，$s$ 次微分至多花 $\lambda^s$，每个有限的相位与振幅系数在提取显示幂次后是 $e^{o(T)}$，取中心的绝对值积分给出

$$
\|h^B\|_{C^s}\le A_T\lambda^{s+3/2}e^{o(T)}
$$

（packet_preparation.tex:171-175,191-197）。实 caustic 之后虚 Hessian 仍正是靠辛恒等式 $P_c^*Q_c-Q_c^*P_c=2i\operatorname{Im}M_0$（$P_c(0)=\mathrm{Id}$，$Q_c(0)=M_0$）给出复位置投影的次指数逆（packet_preparation.tex:198-206）。固定横向 Taylor 次数 $d$ 的同次齐振幅 jet 输运，回到固定坐标时还要作用 $J_c(t,s)^{-\mathsf t}$ 的 $d$ 次对称张量幂，$J_c(t,s)=P_c(t)P_c(s)^{-1}$，两个界的控制使该因子对每个固定 $d$ 保持次指数（packet_preparation.tex:206-212）。未抵消的 Taylor 次数靠高斯积分得到 $\lambda^{-1/2}e^{o(T)}$（packet_preparation.tex:213-215）。这几行合起来回答了我最初的疑问：提高有限精度阶只会改善逆频精度，不会抬高正幂成本。

层级本身也值得一记。设 $P$ 为背景的线性化约化真空算子、$C_g=\operatorname{div}_g$、$P_1$ 为诱导的一次形式波算子，Bianchi 恒等式是 $C_gP=P_1C_g$。对 $k_v=g^{-1}\mathrm dv=-a^{-1}L_0$、$K_vp=p(k_v,\cdot)$、$\mathcal T=2\nabla_{k_v}+\square_gv$，系数解

$$
i\mathcal Tp_j+Pp_{j-1}=0,\qquad iK_vp_j+C_gp_{j-1}=0,\qquad p_{-1}=0
$$

（packet_preparation.tex:109-122）。在归一化槽 $(a^{-1/2}L_0,a^{-1/2}L_1,\partial_\theta)$ 里常数对角权重是 $\kappa(n_0-n_1)/2$，$n_i$ 计一个协变二张量分量里类型为 $a^{-1/2}L_i$ 的槽个数，故 $n_0+n_1\le2$；归一化联络公式使层级从高权重向低权重成三角（packet_preparation.tex:123-131）。非负权重在 $u=-v$  prescribing，含 $L_0$ 槽的分量由规范方程固定；负权重 $1A,11$ 在 $u_f$ prescribing 并向后输运，每个权重的符号在其 prescribing 方向都是有利的（packet_preparation.tex:132-136）。高阶被微分系数只乘已经控制的低 jet，所以每次有限输运归纳只花 $e^{o(T)}$（packet_preparation.tex:136-141）。规范相容性由把 $C_gP=P_1C_g$ 与 $e^{i\lambda v}$ 共轭直接得到：前一个规范缺陷为零时，下一个满足齐次一次形式输运且初值为零；末端 prescribing 不产生额外条件，因为 $K_v$ 恰好收缩 $L_0$ 槽（packet_preparation.tex:161-166）。发射带以外取零的光滑零延拓因此合法，截断足够远时缩放约化波与规范残差是 $A_T\lambda^{-M}e^{o(T)}$（packet_preparation.tex:166-169）。

## 8 精确约束修正：保护球、权重类与无动量条件

我要的是整体桥上精确的光滑真空数据 $d_T$，且在所选端以外完全等于 $d$。局部形变约束的经典工具是 Corvino--Schoen 与 Chruściel--Delay（packet_preparation.tex:224-231）。这里的用法有两点跟我原来的直觉不一样。

第一点是要保住的区域。记外区实验室位置 $z$、漂移中心 $C(t_e)$、共动半径 $r_{\rm co}=|z-C(t_e)|$，$t_T\asymp T$ 对应发射柱面，$z_*=C(t_T)$。取小间隙 $\beta>0$ 使 $s_*:=\sup|C'|<1-2\beta$，保护球定义为

$$
\rho_T=(1-2\beta)t_T,\qquad|z-z_*|<\rho_T
$$

（packet_preparation.tex:232-241）。薄的发射环带在这个球之外且有余量。变量 $y=(z-z_*)/\rho_T$ 下，Cartesian 度量分量不动、第二基本形式分量乘 $\rho_T$，于是两个约束都乘 $\rho_T^2$；把未扰动的重标数据光滑延进单位球内、在球内不强加约束，就得到一个在每个固定 symbol 阶大小为 $O_s(T^{-1})$ 的平坦数据扰动（packet_preparation.tex:242-249）。第二点是函数类。界面取

$$
\|f\|_{H^j_\ell}=\|f\|_{H^j(B_2)}+\sup_{R\ge1}R^\ell\|f(R\,\cdot)\|_{H^j(\{1<|y|<2\})},\qquad X^s=H^{s+2}_1\oplus H^{s+1}_2,\qquad Y^s=H^s_4
$$

（packet_preparation.tex:251-258）。权重一与权重二包含饱和 $|y|^{-1}$ 与 $|y|^{-2}$ 衰减的场，这些类比紧支撑场的闭包更大（packet_preparation.tex:259-264）。给出的有界算子 $\mathcal K:Y^s\to X^s$ 保持外区支撑，且对支撑在外区的 $z$ 有 $P_{\rm flat}\mathcal Kz=z$（packet_preparation.tex:264-267）。原文紧接着强调两件事：迭代源本身可以带非紧的外区支撑尾巴；对原始缺陷没有任何矩条件，也没有固定电荷要求（packet_preparation.tex:270-276）。这两句正好对上引言里"不规定领头渐近系数、电荷值或宇称条件"的取舍（introduction.tex:42-45），所以我把它当作本篇对伙伴的一条真实依赖来核对：如果那里需要矩条件，本篇的邻域 $\mathcal U_\epsilon$ 就会缩水。

求解的形状是压缩映射

$$
z=-f_B-N_{d_B}(\mathcal Kz),\qquad N_{d_B}(w)=\Phi(d_B+w)-\Phi(d_B)-P_{\rm flat}w
$$

（packet_preparation.tex:302-305）。缺陷估计是

$$
\|f_B\|_{Y^s}\le\operatorname{poly}(T)e^{o(T)}\bigl(A_T\lambda^{-M}+A_T^2\lambda^{P_*}\bigr)
$$

（packet_preparation.tex:288-292），其中重标种子的基座范数是 $O_s(T^{-1})+\operatorname{poly}(T)A_T\lambda^{P_*}e^{o(T)}$，靠 $\zeta P_*<\alpha/2$ 变小（packet_preparation.tex:296-299）；Lipschitz 常数至多 $1/2$（packet_preparation.tex:306-307）。修正量与缺陷同阶，在内边界附近光滑为零，支撑保持的逆与非线性迭代让整个内侧保持零；由 $P_{\rm flat}\mathcal Kz=z$ 得 $\Phi(d_B+\mathcal Kz)=\Phi(d_B)-f_B$，故球外约束恰为零，球内 $N_{d_B}(\mathcal Kz)=0$（packet_preparation.tex:307-313）。反重标并恢复原真空数据后就得到整桥光滑精确数据。$p_m$ 层面的代价也写了：种子至多贡献 $\operatorname{poly}(T)A_T\lambda^{m+5/2}e^{o(T)}$，修正贡献同型多项式损失乘以缺陷界，于是 $p_m(d_T-d)\to0$（packet_preparation.tex:317-323），而外区尾巴与任何电荷变化都保留在 $d_T$ 里（packet_preparation.tex:324-326）。注意 $m\ge10$ 是固定的有限阶（packet_preparation.tex:4-6）。

外区传播一侧有一条我起初漏看的关键论证。要在整个外区把扰动传到入口柱面，需要一个不断收缩的计算片 $r_{\rm co}<R_{\rm out}(t_e)=C_{\rm out}(1+T)+V_{\rm out}(t_T+C_2-t_e)$，$V_{\rm out}>\sup_{\rm causal}|\mathrm dr_{\rm co}/\mathrm dt_e|$（packet_preparation.tex:359-366），其半径在有限比较区间上是 $O(T)$、侧面严格流出（packet_preparation.tex:367-368）。能量率不等式 $E_j'\le r_eE_j+C_je^{o(T)}\sum_{k<j}E_k+\mathcal F_j$，$\mathcal F_j\le\operatorname{poly}(T)e^{o(T)}(A_T\lambda^{-M}+A_T^2\lambda^{P_*})$（packet_preparation.tex:371-376）。到区率之所以能任意小，靠的是首达估计

$$
(1-2\beta)t_T\le(1+\delta_R)t_e+O(R)+s_*|t_T-t_e|,\qquad\delta_R\longrightarrow0
$$

（packet_preparation.tex:386-390）：在第一次打到固定大共半径 $R$ 之前，从被改变支撑出发的因果路径实验室速度至多 $1+\delta_R$，末点在 $O(R)$ 内贴近 $C(t_e)$；$1-s_*>0$ 这个固定间隙说明该改变在 $t_e\ge t_T-\beta'T$ 之前看不到有界率区域，$\beta'>0$ 可以任意小（packet_preparation.tex:391-398）。于是 $\int_0^{t_T+C_2}r_e\,\mathrm dt_e\le\eta'T$ 对任意给定 $\eta'>0$ 成立（packet_preparation.tex:399-402）。我原来的想法是"把远阈值取远一点，自然就有小率"，这里补上了它缺的那一步：远阈值的增加与薄环带的要求同时成立，因为有界紧区域的费用与所选远阈值无关（packet_preparation.tex:402-406），并且这些选择同时保护整段更早的入口区间 $v<(1-\nu)T$（packet_preparation.tex:406）。入口处的最终比较是

$$
\|g_T^{\rm ext}-g-h^p\|_{C^N(\mathcal S)}\le A_T^2e^{\eta T}
$$

（packet_preparation.tex:413-416），它严格改进 bootstrap，因为 $2\alpha-\eta>\alpha$（packet_preparation.tex:419-421）。内部损失 $0<\eta<\min\{\eta_{\rm out},\alpha/4\}$ 先取小、在最后一步再换成输出容差，这个区分使任意给定的正输出容差都能实现（packet_preparation.tex:84-89）。波 $h^p$ 本身的形状也记一下：

$$
h^p=A_T\,\operatorname{tr.rev.}_g\operatorname{Re}\Bigl(e^{i\lambda v}\sum_{j=0}^{J_*}\lambda^{-j}p_j\Bigr)
$$

（packet_preparation.tex:51-55），领头系数实、无迹、湮灭 $L_0$（packet_preparation.tex:56-57）。

## 9 绝不把误差除以 $q$：相对平移恒等式与线性光学规范

这一节是我读得最慢的地方，因为它的全部价值都在一句禁令里：这个证明从来没有把 $\partial_vk_b$ 的普通误差估计除以小的 $q$（packet_preparation.tex:625-626）。我第一次构造模板时正是这样做的：先估 $\|\partial_vk_b\|_{C^s}$ 的普通界，再除 $q$ 得到 $q^{-1}\partial_vk_b$，而 $q\asymp e^{-\kappa T}$ 在观测处，于是白丢 $e^{\kappa T}$，整片的相对精度就救不回来。

正确路径分四步。第一步，坐标变化 $Z=(z^0,z^1,z^\theta)$ 由线性化的 eikonal 与角标条件决定：

$$
\partial_vz^0=-\frac{h^p_{11}}{2a},\qquad L_0z^1=-\frac{h^p_{00}}{2a},\qquad\partial_vz^\theta=b\partial_vz^0+a\gamma^{-1}\mathrm d_\theta z^0+\gamma^{-1}h^p_{1\cdot}
$$

（packet_preparation.tex:438-451）。固定角导数个数与 $r$ 个纵向导数时，

$$
|\partial_{u,v}^{r}\partial_\theta^sZ|\le A_T\lambda^{r-1}e^{o(T)}
$$

（packet_preparation.tex:452-457）。这里 $r-1$ 的那个 $-1$ 全靠振荡积分：对形如 $A_Te^{i\lambda v}f(u,v,\theta)$ 的项，

$$
\int_{-u}^{v}e^{i\lambda s}f(u,s,\theta)\,\mathrm ds=\frac{e^{i\lambda v}f(u,v,\theta)-e^{-i\lambda u}f(u,-u,\theta)}{i\lambda}-\frac1{i\lambda}\int_{-u}^{v}e^{i\lambda s}\partial_sf(u,s,\theta)\,\mathrm ds
$$

（packet_preparation.tex:490-497），区间长 $O(T)$ 的多项式被 $e^{o(T)}$ 吸收（packet_preparation.tex:499-500），对 $u$ 微分会微分动下端点及其系数、也会微分该端点的相位 $e^{-i\lambda u}$，每个纵向导数至多再花一个 $\lambda$，角导数不微分相位（packet_preparation.tex:500-505）。$z^1$ 更省力：$h^p_{00}/a$ 已经带因子 $\lambda^{-1}$，因为 $p_0$ 湮灭 $L_0$，而迹反演保持同零方向的 $00$ 分量为零（$g_{00}=0$），所以沿 $L_0$ 积分时根本不需要在该方向振荡（packet_preparation.tex:507-517）。角向方程里 $\int_{-u}^{v}b\partial_vz^0\,\mathrm dv=bz^0|_{-u}^{v}-\int_{-u}^{v}(\partial_vb)z^0\,\mathrm dv$ 用了分部积分，下端的 $z^0$ 为零，$\partial_vb$ 的所有导数都保留其因子 $a$（packet_preparation.tex:524-531）。逆度量是 $g^{-1}=-a^{-1}(L_0\otimes L_1+L_1\otimes L_0)+\gamma^{AB}\partial_A\otimes\partial_B$，$z^0$ 的方程来自 $g^{-1}(\mathrm du,\mathrm du)=0$ 的线性化 $-a^{-2}h^p_{11}-2a^{-1}\partial_vz^0=0$（packet_preparation.tex:470-476）；相对因子 $h^p_{11}/a$ 是归一化张量元素，所以这里没丢逆 lapse（packet_preparation.tex:506-507）。

第二步，新标签下的度量变分是 $k=h^p-\mathcal L_Zg$，字面公式为

$$
k_\gamma=h^p_{AB}-2z^0\chi_0-2z^1\chi_1-\mathcal L_W\gamma,
$$
$$
k_H=-a^{-1}h^p_{01}-Z\log a-L_0z^0-\partial_vz^1,
$$
$$
k_b=-\gamma^{-1}h^p_{0\cdot}+\partial_uW+[b,W]-z^1\partial_vb-a\gamma^{-1}\mathrm d_\theta z^1,
$$

其中 $W=z^\theta-z^0b$ 是角向向量场（packet_preparation.tex:533-543）。核对来自 $(\mathcal L_Zg)_{AB}=2z^0\chi_0+2z^1\chi_1+\mathcal L_W\gamma$、$(\mathcal L_Zg)(L_0,L_1)=-Za-a(L_0z^0+\partial_vz^1)$、$0A$ 分量 $\gamma_{AB}(\partial_uW+[b,W]-z^1\partial_vb)^B-a\partial_Az^1$，而线性双零分量条件 $k_{11}=k_{00}=k_{1A}=0$ 由第一步的方程给出（packet_preparation.tex:544-552）。所有除以 $a$ 的地方都是相对因子：$h^p_{01}/a$ 是归一化量，$\partial a/a=\partial\log a$ 有给定的系数界（packet_preparation.tex:553-556）。到这一步还没有 $q^{-1}\partial_vk_b$，原文也明说这段论证本身估不了它（packet_preparation.tex:556-558）。

第三步，绕开它的办法是走挠率方程。$X_i$ 记 $\xi_i$ 在 $k$ 下的精确线性变分，挠率和恒等式给 $X_0+X_1=\mathrm d_\theta k_H$（packet_preparation.tex:560-561）。线性化的真空恒等式以任意线性精度可用，理由是真空背景上的微分同胚协变性 $D\!\operatorname{Ric}_g(\mathcal L_Zg)=\mathcal L_Z\operatorname{Ric}(g)=0$（packet_preparation.tex:562-566）；把 Ricci 分量化成零方程的代数与微分步骤会损失固定幂次 $q^{-1}$，但只作用在线性残差上，在 $\mathcal D_T$ 上这些幂是 $e^{C_sT}$，$\zeta$ 定了以后加大 $M$ 就让该残差在全部有限所需阶上小于任何指定的指数（packet_preparation.tex:568-574）。用无平移的方向 $1$ 的挠率方程线性化：

$$
(\partial_v+\tau_1)X_0=\delta\beta_1+\delta\tau_1\,\xi_1+\tau_1\mathrm d_\theta k_H+\mathfrak r_{\rm lin}
$$

（packet_preparation.tex:575-582），其中 $\delta\chi_1=\tfrac12\partial_vk_\gamma$，$\delta\tau_1=\operatorname{tr}_\gamma\delta\chi_1-\gamma^{AC}k_{\gamma,CD}\gamma^{DB}\chi_{1,AB}$，$\delta\beta_1=\operatorname{div}_\gamma\delta\chi_1-\mathrm d_\theta\delta\tau_1+(\delta\operatorname{div}_\gamma)\chi_1$，最后一个算子变化只用 $k_\gamma$ 与它的一个角导数（packet_preparation.tex:583-593）。整个右端只用已经估过的量，既不用 $X_i$ 也不用未知的相对平移导数（packet_preparation.tex:594-598）。积分因子能用，是因为 $\int_{-u}^{v}|\tau_1(u,s,\theta)|\,\mathrm ds\le C\int_{-u}^{v}(q+g_1(s))\,\mathrm ds\le C$（packet_preparation.tex:599-602），这里同时用到 $q$ 的可积性与背景包里 $\sum_{n\in\mathbb Z}\sup_{[n,n+1]}g_i<\infty$（background.tex:186-190）。入口高斯 $q=q_0$ 处初值 $X_0$ 是无小分母的有限 jet 表达式，大小 $A_T\lambda^{P_s}e^{o(T)}$（packet_preparation.tex:603-605）；积分因子估计把该界传给 $X_0$ 再传给 $X_1$（packet_preparation.tex:605-606）。与 $u$、角导数交换保持同一顶层输运系数，被微分系数只乘已估的低阶 $X_0$ jet，来自微分 $v=-u$ 的入口项由已控的被微分入口数据控制，$v$ 方向导数由方程恢复（packet_preparation.tex:607-613）。

第四步，把线性化后的平移定义关系直接写下：

$$
q^{-1}\partial_vk_b=\mathcal A\gamma^{-1}(X_1-X_0)+\bigl(k_H\,\mathrm{Id}-\gamma^{-1}k_\gamma\bigr)q^{-1}\partial_vb
$$

（packet_preparation.tex:615-622）。背景的相对导数及其所有固定 jet 次指数（packet_preparation.tex:623）。于是 $\|(k_\gamma,k_H,k_b,q^{-1}\partial_vk_b)\|_{C^s}\le A_T\lambda^{P_s}e^{o(T)}$，而指数 $P_s$ 只依赖该阶、不依赖后面的逆频精度（packet_preparation.tex:461-467）。

模板的定义是精确赋值：$\bar\gamma=\gamma+k_\gamma$，$\bar{\mathcal A}=\mathcal A e^{k_H}$，$\bar a=q\bar{\mathcal A}$，$\bar b=b+k_b$，$\bar g=-2\bar a\,\mathrm du\,\mathrm dv+\bar\gamma_{AB}(\mathrm d\theta^A-\bar b^A\mathrm du)(\mathrm d\theta^B-\bar b^B\mathrm du)$，带杠的导出场全部按真实几何定义算，绝不当作独立截断级数（packet_preparation.tex:629-646）；例如 $\bar\xi_0=\tfrac12(\mathrm d_\theta\log\bar{\mathcal A}-\bar{\mathcal A}^{-1}\bar\gamma\,q^{-1}\partial_v\bar b)$、$\bar\xi_1$ 同号相加（packet_preparation.tex:652-657），其定义用到刚刚被控制住的相对平移导数（packet_preparation.tex:663-665）。把 $\{\gamma,\gamma^{-1},\mathcal A,\mathcal A^{-1},b,H=\log\mathcal A,V=q^{-1}\partial_vb\}$ 当成有限微分表达式来看，这些式子里的径向 lapse 因子只有 $q$ 的非负幂：交叉形状源是 $q\mathcal A\nabla\xi$、$q\mathcal A K_\gamma\gamma$、$q\mathcal A\xi^2$ 与两个形状的积；lapse 交叉方程有 $q\mathcal A K_\gamma$、$q\mathcal A\xi^2$ 与形状积；角向对的主系数是 $q\mathcal A/2$，其余项是 $q\mathcal A(K_\gamma\xi+\xi\nabla\xi+\xi^3)$ 与 $\chi_i\nabla\chi_j+\chi_j\nabla\chi_i$；其余角向方程用 $\chi_i(K_\gamma,\nabla\xi)$ 与 $\nabla\chi_i\xi$；平移恒等式 $\partial_vb=q\mathcal A\gamma^{-1}(\xi_1-\xi_0)$；迹方程可写成不含 lapse 导数的 $(L_i+\kappa)(\tau_i/\mathcal A)=-\mathcal A^{-1}|\chi_i|^2$；角向曲率与 div--curl 只用球面度量及其导数；$q$ 的普通求导保持其因子（packet_preparation.tex:667-690）。代入后的 Taylor 分解给出缺陷

$$
O\bigl(A_T\lambda^{-M}e^{C_NT+o(T)}+A_T^2\lambda^{P_N}e^{o(T)}\bigr)
$$

（packet_preparation.tex:692-701），原文点明这个分离是本质性的：固定的逆 $q$ 损失只允许出现在线性那一项上，二次项没有这种损失（packet_preparation.tex:702-705）。我先取的顺序因此被钉死：定观测与 bootstrap 阶、把主定理要的有限高阶入口与残差阶都并入基座预算 $N$、再定所有能量损失容差与支撑比例 $\nu$、包括外区首达选择、再按这些基座阶选 $\zeta$、最后才扩大层级与光束、相位 Taylor、匹配精度阶去吸收一切线性逆 $q$ 损失（packet_preparation.tex:728-743）。入口柱面上 $q=q_0$，所有 eikonal 根与角输运在低阶一致非特征，其初值时空 jet 是外区度量 jet 与 prescribed 坐标值的有限 jet 函数，线性化正是第一步的方程，于是真实减模板的入口 jet 是 $A_T^2e^{\eta T}$，非线性坐标项在该固定深度是二次有限 jet 项，不需要在两规范深处作比较（packet_preparation.tex:711-721）；一阶到达性、双零坐标里的因果单调性与光学输运唯一性说明精确改变与模板改变在 $v<(1-\nu)T$ 处处为零，只要局部精确双零演化存在（packet_preparation.tex:722-727）。

## 10 非线性比较的三层结构：高估、二次低误、插值

主定理的结论是对 $\mathcal U=(\gamma,\log\mathcal A,b,\chi_0,\chi_1,\ell_0,\ell_1,\xi_0,\xi_1)$ 的有限阶 $s$（放大后设 $s\ge30$）满足

$$
\max_{|I|\le s}\|\partial^I(\mathcal U'-\bar{\mathcal U})\|_{L^\infty(\Omega_T)}\le e^{-(1+c)\alpha T}
$$

（nonlinear_comparison.tex:19-21,50-59）。约定很清楚：杠是精确双零模板、撇是待构造的真空解、不带装饰的是固定背景，而带杠的度量一般并非真空，它的方程带有第 8、9 节提供的受控缺陷（nonlinear_comparison.tex:4-9）。区域是 $\Omega_T=\{0\le t\le L_T=(T+u_*)/2+c_0,\ u=t-x\le u_2-c_0t/T,\ v=t+x\le T+c_2-c_0t/T\}$（nonlinear_comparison.tex:22-28），每个空间区间 $I_T(t)$ 长度有固定正下界、至多 $C(T+1)$，取迹与端点重启时用到这些放大（nonlinear_comparison.tex:29-33）。$q=q_0e^{-\kappa(u+v)}$，$\sigma=\sqrt q$（nonlinear_comparison.tex:35-36）。定理还额外承诺：$q^{-1}\partial_vb'-q^{-1}\partial_v\bar b$ 在任何预先指定的有限阶也满足同一结论，代价是提高有限阶预算；primed 相对场的各别普通 jet 直到实验用到的每一阶都对该移动族一致 $e^{o(T)}$；精确解与模板在 $v<(1-\nu)T$ 等于背景；由局部几何唯一性，精确解在入口领圈上与外区解一致（nonlinear_comparison.tex:60-68）。三条估计把入口数据接到这个结论：低阶 bootstrap 下先取得任意小指数损失的个体高阶界，再对真实减模板差证二次 $L^2$ 界并保留补偿角向椭圆估计的 lapse 因子，最后在两者之间插值得到所需有限 jet 误差并改进 bootstrap；所有估计在每个存在的部分薄片上成立，于是局部重启完成存在性论证（nonlinear_comparison.tex:71-80）。

方程组的形态决定了我能在哪儿保留因子。三个度量共用的定义是 $a=q\mathcal A$、$B_0=b$、$B_1=0$、$L_i=\partial_{y_i}+B_i$、$\mathfrak L_i=\partial_{y_i}+\mathcal L_{B_i}$、$(y_0,y_1)=(u,v)$、$\chi_i=\tfrac12\mathfrak L_i\gamma$、$\tau_i=\operatorname{tr}_\gamma\chi_i$、$\ell_i=L_i\log a$、$\xi_0+\xi_1=\mathrm d_\theta\log\mathcal A$、$\xi_0-\xi_1=-a^{-1}\gamma\partial_vb$、$\beta_i=\operatorname{div}_\gamma\chi_i-\mathrm d_\theta\tau_i$、$c_i=\operatorname{curl}_\gamma\xi_j$、$Q_i=(K_\gamma,c_i)$、$m_i=K_\gamma-\operatorname{div}_\gamma\xi_j$（$i\ne j$）（nonlinear_comparison.tex:84-102）。真空双零方程是

$$
L_i\tau_i=\ell_i\tau_i-|\chi_i|_\gamma^2,
$$
$$
\mathfrak L_j\chi_i=a\operatorname{Sym}\nabla\xi_j-\tfrac a2K_\gamma\gamma+a\xi_j^{\otimes2}-\tfrac12(\tau_i\chi_j+\tau_j\chi_i)+\chi_i\chi_j+\chi_j\chi_i,
$$
$$
\mathfrak L_i\xi_j=\beta_i+\tau_i\xi_i,\qquad L_j\ell_i=aK_\gamma-\chi_i\cdot\chi_j+\tau_i\tau_j+a(2\xi_i\cdot\xi_j-|\xi_i|^2)
$$

（nonlinear_comparison.tex:103-117），加上精确的定义恒等式 $\partial_v\gamma=2\chi_1$、$\partial_v\log\mathcal A=\ell_1+\kappa$、$\partial_vb=q\mathcal A\gamma^{-1}(\xi_1-\xi_0)$（nonlinear_comparison.tex:118-123）。把 Raychaudhuri 与 $L_i\log\mathcal A=\ell_i+\kappa$ 合并得到那条特别有用的形式

$$
(L_i+\kappa)w_i=-\mathcal A^{-1}|\chi_i|^2,\qquad w_i=\tau_i/\mathcal A
$$

（nonlinear_comparison.tex:124-130）：常数阻尼在除以相对 lapse 之后仍然活着。我第一次推迹方程时写成 $L_i\tau_i$ 的形式，阻尼只出现在 $\ell_i$ 里，被 $e^{-\kappa(u+v)}$ 一冲就看不出结构；换成 $w_i$ 以后 $\kappa$ 变成一致阻尼，这直接决定第 13 节的圈长选取。角向系统也值得抄，因为 $*$ 记号的约定很严格（表示用 $\gamma^{\pm1}$ 做的有限缩并，显示出来的因子就是全部因子，不藏额外导数）：

$$
\mathfrak L_j\beta_i=\tfrac a2(\mathrm dK_\gamma+J\mathrm dc_i)+a(K_\gamma*\xi+\xi*\nabla\xi+\xi^3)+\chi_i*\nabla\chi_j+\chi_j*\nabla\chi_i,
$$
$$
L_iQ_i=(\operatorname{div},\operatorname{curl})\beta_i+\mathcal R_i,\qquad L_im_i=\mathcal T_i,
$$

其中 $\mathcal R_i,\mathcal T_i$ 的因子型是 $\chi_i*(K_\gamma,\nabla\xi)+\nabla\chi_i*\xi$，$J\mathrm df=(-\partial_2f,\partial_1f)$ 取定向正交分量（nonlinear_comparison.tex:132-148）。核对因子型时不必微分时空气曲率分量：对形状交叉方程作用散度减迹微分，用 $L_iK_\gamma=\operatorname{div}\beta_i-\tau_iK_\gamma$、$L_i\operatorname{div}\zeta=\operatorname{div}(\mathfrak L_i\zeta)-2\chi_i^{AB}\nabla_A\zeta_B-(2\operatorname{div}\chi_i-\mathrm d\tau_i)\cdot\zeta$、$L_i\operatorname{curl}\xi_j=\operatorname{curl}\beta_i+\operatorname{curl}(\tau_i\xi_i)-\tau_i\operatorname{curl}\xi_j$，特别是 $\beta_i$ 的散度在 $L_im_i$ 里相消，展开式 $L_im_i=-\tau_iK_\gamma-\operatorname{div}(\tau_i\xi_i)+2\chi_i^{AB}\nabla_A(\xi_j)_B+(2\operatorname{div}\chi_i-\mathrm d\tau_i)\cdot\xi_j$ 逐项验证了显示的因子型（nonlinear_comparison.tex:149-171）。

我把它读成三层，顺序很要紧。第一层是 bootstrap：把 $\mathcal U'-\mathcal U$ 的普通导数到十阶界住

$$
\|\mathcal U'-\mathcal U\|_{C^{10}}\le e_T,\qquad e_T=e^{-\alpha T/2},
$$

并把相对 lapse 与球面度量保持在关于背景界的固定开非退化区间里；必要时可放大固定的 bootstrap 阶以配合局部存在性约定（nonlinear_comparison.tex:172-180）。由背景估计包 prop:bg-package 与这条 bootstrap，$\gamma'^{\pm1},\mathcal A'^{\pm1}$ 有一致的角向 $H^6$ 界、挠率有 $H^5$ 界，所有需要的低角向范数与低纯纵向系数范数被主项

$$
h_{i,T}=C_0\bigl(q+g_i(y_i)+e_T\bigr)
$$

控制，$g_i\ge0$ 是固定的背景包络、单位上确界可和，并已放大以纳入纯 jet 控制（nonlinear_comparison.tex:181-195）。带杠场在 $\zeta$ 于有限基座阶取得足够小之后满足同一界（nonlinear_comparison.tex:191-194）。输入侧一切初差与缺陷都被 $F_T=A_T^2e^{\eta T}$ 界住到任意有限阶（nonlinear_comparison.tex:196-202），模板的有限 jet 与背景差 $A_T\lambda^{P_N}e^{o(T)}$ 且含相对平移导数（nonlinear_comparison.tex:203-206），$\zeta P_N<\alpha/2$ 后初始高范数对该族一致 $\le e^{o(T)}$（nonlinear_comparison.tex:206-211）。只有真实入口数据初始化真空 Cauchy 问题，模板不初始化（nonlinear_comparison.tex:210-211）。

第二层是两条风格不相容的估计。上面那条一致有限薄片高界是引理 lem:dn-high-uniform（nonlinear_comparison.tex:213-215 起），负责把 $H^M$ 顶压成次指数；下面这条是我认为整节的心脏：定义低阶尺寸

$$
Y_i=|\Delta\beta_i|_0,\qquad Z_i=\sigma|(\Delta Q_i,\Delta m_i)|_0,\qquad z_i=|\Delta w_i|_1,\qquad N_i=|\Delta\chi_i|_0+|\Delta\ell_i|_0,
$$
$$
D_b=|\Delta b|_1,\qquad R_i=|\Delta\chi_i|_1,\qquad P=|\Delta\gamma|_1+|\Delta\log\mathcal A|_0+|\Delta\xi_0|_0+|\Delta\xi_1|_0,
$$

以及 $V=P+D_b+\sum_i(N_i+Y_i+Z_i+z_i)$，$H_s=\sigma+h_0+h_1$；平方和的含义是每个分量按指定的输运方向配平方，这个约定对 $P$ 的各分量是真要紧的（nonlinear_comparison.tex:795-818）。命题 prop:dn-low-error 说：对每个 $\eta_2>0$，输入损失 $\eta$ 与支撑比例 $\nu$ 可取足够小，使每个存在的 bootstrap 子薄片上

$$
\sup_{0\le t\le L_T}\|(\Delta\gamma,\Delta\log\mathcal A,\Delta b,\Delta\chi_i,\Delta\ell_i,\Delta\xi_i)\|_{L^2(I_T(t)\times\mathbb S^2)}\le A_T^2e^{\eta_2T}
$$

（nonlinear_comparison.tex:820-843），同时 $\sum_i\|Y_i+Z_i+z_i\|_{L^2(I_T(t))}+\|(\nabla\Delta\gamma,\nabla\Delta b)\|_{L^2(I_T(t)\times\mathbb S^2)}\le A_T^2e^{\eta_2T}$，上确界只在可用薄片上取（nonlinear_comparison.tex:843-849）。证明的前置动作是把算子差写清楚，好让我在估电流之前先核对导数计数：角向联络差恰为

$$
C^C{}_{AB}=(\Gamma')^C{}_{AB}-(\bar\Gamma)^C{}_{AB}=\tfrac12(\gamma'^{-1})^{CD}(\bar\nabla_Ah_{BD}+\bar\nabla_Bh_{AD}-\bar\nabla_Dh_{AB}),\qquad h_{AB}=\Delta\gamma_{AB},
$$

所以 $|C|_0\le C|\Delta\gamma|_1$（nonlinear_comparison.tex:844-853）；对带杠一次形式，$(\operatorname{div}'-\bar{\operatorname{div}})f=((\gamma'^{-1})^{AB}-(\bar\gamma^{-1})^{AB})\bar\nabla_Af_B-(\gamma'^{-1})^{AB}C^D{}_{AB}f_D$，$(\operatorname{curl}'-\bar{\operatorname{curl}})f=\tfrac12((\epsilon')^{AB}-\bar\epsilon^{AB})(\mathrm df)_{AB}$，张量情形的每个协变槽一个联络差，不出现 $h$ 的二阶导（nonlinear_comparison.tex:854-865）。于是对 $\bar\beta_i$ 或 $\bar\chi_i$ 的损失是 $Ch_iP$，对带杠有界挠率的损失是 $CP$（nonlinear_comparison.tex:865-868）。精确的挠率和恒等式给出 $|\Delta\log\mathcal A|_1\le CP$ 与 $|\Delta\mathcal A|_1\le CP$（nonlinear_comparison.tex:872-875）；迹的转换用了精确恒等式 $\Delta\tau_i=\mathcal A'\Delta w_i+(\Delta\mathcal A)\bar w_i$，因此 $|\Delta\tau_i|_1\le C(z_i+h_iP)$，而 primed 度量下 $\Delta\chi_i$ 的迹是 $\Delta\tau_i-(\gamma'^{-1}-\bar\gamma^{-1})\bar\chi_i$（nonlinear_comparison.tex:876-885）。剩下两步是带撇的无迹散度估计（含未微分张量范数以覆盖它的核）与带撇一次形式的 div--curl 估计，记 $C_{\rm inv}=\gamma'^{-1}-\bar\gamma^{-1}$，从

$$
\operatorname{div}'\Delta\chi_i-\mathrm d\operatorname{tr}'\Delta\chi_i=\Delta\beta_i-(\operatorname{div}'-\bar{\operatorname{div}})\bar\chi_i+\mathrm d(C_{\rm inv}:\bar\chi_i)
$$

得到

$$
R_i\le C(Y_i+N_i+z_i+h_iP),\qquad|\Delta\xi_j|_1\le C(\sigma^{-1}Z_i+P)
$$

（nonlinear_comparison.tex:886-896），前者的散度数据是 $\Delta K_\gamma-\Delta m_i$、旋度数据是 $\Delta c_i$ 加上显示的系数差（nonlinear_comparison.tex:897-904）；这些一阶椭圆常数只需要一致的低阶几何（nonlinear_comparison.tex:905）。这里就是我说的"保留 lapse 因子"的具体位置：$Z_i$ 的定义里预先乘了 $\sigma$，所以 $\sigma^{-1}$ 的损失在电流层就已经被配对吸收，到估计层不再出现裸的 $q^{-1/2}$ 放大。我第一次写这一段时把 $Z_i$ 定义成不带 $\sigma$ 的样子，结果 $\sigma^{-1}$ 直接乘进 $V$ 的闭合不等式，指数上少了 $\kappa T/2$，闭合不了。

第三层是插值、改进与重启，我把它的选择顺序抄成一张单向图（nonlinear_comparison.tex:1174-1220）。空间目标阶取 $k\ge2s$ 并按需放大以改进每个 bootstrap 与延续范数；时间恢复每个时间导数至多用两个空间导数；取整数 $M\gg k+2$ 使 $\vartheta=(k+2)/M$ 满足

$$
2\alpha(1-\vartheta)>(1+c_1)\alpha\quad\text{对某 }0<c<c_1<1/2,
$$

$k+2$ 里的 $2$ 来自三维薄片的 Sobolev 嵌入；lem:dn-high-uniform 决定有限的初始缓冲 $r(M)$ 及其模板与外区 jet 需求，有限阶 $m$ 也并入该基座预算；$\eta_2$ 取得足够小，使加上全部插值与后续时间恢复损失后严格间隙仍在（nonlinear_comparison.tex:1176-1203）。然后在 prop:dn-low-error 里先定当前乘子、小区域阈值、增长容差，再定 $\nu$，最后定足够小的输入与外区损失（nonlinear_comparison.tex:1200-1203）。$P_{\mathrm{base}}\ge1$ 是这些固定基座阶上有限正频指数的最大值，$\zeta$ 取得使每个都得到分配的损耗、特别 $\zeta P_{\mathrm{base}}<\alpha/2$；只有到这时才提高有限的层级与光束精度阶，把所有线性缺陷压低，包括导出线性化双零恒等式时的有限逆 lapse 损失；该步骤只改常数与所需的固定背景 jet，不再抬高任何先前已预算的、被 $P_{\mathrm{base}}$ 界住的 $\lambda$ 正幂（nonlinear_comparison.tex:1204-1214）。最后 $T$ 取大，每个输入高范数都是制备阶段已给的有限入口范数，这个顺序里没有未知的"高范数小性"要求（nonlinear_comparison.tex:1215-1220）。逐片插值

$$
\|f\|_{C^k(I_T(t)\times\mathbb S^2)}\le C\operatorname{poly}(T)\|f\|_{L^2}^{1-\vartheta}\|f\|_{H^M}^{\vartheta}\le e^{-(1+c_1)\alpha T}
$$

（nonlinear_comparison.tex:1229-1238）只需区间长度下界来保证一致的局部延拓常数，覆盖更长区间至多多项式代价，而且不要求已存在时间厚度有正下界（nonlinear_comparison.tex:1238-1241）。时间导数由恢复方程给出：$\partial_t\gamma=4\chi_1-\partial_x\gamma$，$\partial_t\log\mathcal A=2(\ell_1+\kappa)-\partial_x\log\mathcal A$，$\partial_tb=2q\mathcal A\gamma^{-1}(\xi_1-\xi_0)-\partial_xb$（nonlinear_comparison.tex:1242-1252），方向 $0$ 的张量输运用 $\mathfrak L_0=(\partial_t-\partial_x)/2+\mathcal L_b$、标量把 Lie 项换成 $b\cdot\mathrm d$，于是每个时间导数等于两倍右端加一个空间导数再加适当的角向 Lie 项；形状或 lapse 交叉方程至多含度量的两个角导数与挠率的一个，挠率方程含一个角向形状导数，因此 $r$ 个时间导数加 $p$ 个空间导数至多需要空间阶 $p+2r$，$k\ge2s$ 覆盖全部总阶 $\le s$ 的普通导数（nonlinear_comparison.tex:1253-1265）。用带真实主算子的方程相减，所有乘积只用已控的低阶误差 jet 与 lem:dn-high-uniform 的个体 jet，带杠缺陷有 prescribed 的被微分有限界，全程没有除以 $q$，有限乘积损失可在该引理里分配任意小的率，最终留下带 $c<c_1$ 的主误差（nonlinear_comparison.tex:1266-1272）。相对平移的结论由对代数恒等式 $q^{-1}\partial_vb=\mathcal A\gamma^{-1}(\xi_1-\xi_0)$ 求导得到（nonlinear_comparison.tex:1273-1276）。

模板在固定 bootstrap 阶上的改动至多 $e^{-(\alpha-\eta_0)T}$，$\eta_0<\alpha/2$；与主误差合起来对大 $T$ 严格小于 $\tfrac12e^{-\alpha T/2}$，因此改进 bootstrap、保住非退化余量、并给出重启所需的有限 Sobolev 缓冲（nonlinear_comparison.tex:1278-1284）。存在性论证必须自己收尾，因为在一个假定的全域上作先验比较并不够：固定有限实验上 $q\ge q_0e^{-2\kappa L_T}>0$，所有必要的有限范数与逆度量到可能的末薄片都有界；用较早薄片的诱导度量与第二基本形式初始化波规范、在放大余量上把薄片 jet 越过区间端点延拓、约束只需在原余量上成立，约化波方程的正局部存在时间依赖那些有限范数与有限的正 lapse；从薄片解 eikonal 对与角输运并继承其值，横截性与可逆性在小于固定的下界的时间里保持；限制到新解的带出边区域，那里未来因果向量满足 $\mathrm du,\mathrm dv\ge0$，人工延拓数据进不了保留区域，约束与规范传播给出该处的真空方程，局部几何唯一性加上 eikonal 与角输运的唯一性把它与既有解在重合处认同；在任何提议的终点之前重启，该固定 $T$ 下的一致界与终止矛盾；重启时间无需在 $T\to\infty$ 时一致（nonlinear_comparison.tex:1286-1311）。每个固定 $T$ 上，带权 $e^{-2Kt}$ 的固定区域版高电流证明把任何更大的有限阶从光滑入口数据传播出去，常数可依赖该阶与 $T$，不主张也不需要同步的全阶次指数估计，于是构造出的光滑解抵达整个 $\Omega_T$，并在入口领圈上是同一个真空解（nonlinear_comparison.tex:1312-1320）。

## 11 观测管的三件套：分支态、足映像 Jacobian 与有限域贴合

本篇所有观测都发生在引理 lem:bg-branch-tube 给的开分支管里，我把它的三条内容与三条配套估计一次记全，因为第 13、14 节的每个常数都从这里取。

先交代归一化，免得后面临时补条件。$\mathfrak a<0$ 时用固定轴反射 $\varphi\mapsto-\varphi$、Killing 时间不动，把参数 $\mathfrak a$ 的 Kerr 度量认同为 $|\mathfrak a|$ 的那个，它把桥及其未来法向带到对应的桥；同时 pullback 数据与参考几何保持每个协变导数阶（background.tex:10-17）。之后取归一化桥坐标到这座桥的固定认同 $\Psi:\Sigma_n\to\Sigma$，常数时空缩放 $M^{-2}$ 把数据增量送去 $\mathcal T(u,v)=(M^{-2}\Psi^*u,M^{-1}\Psi^*v)$，中心送去 $d_{*,n}=(M^{-2}\Psi^*h_*,M^{-1}\Psi^*K_*)$，参数为 $(1,|\mathfrak a|/M)$（background.tex:20-29）。$h_{*,n}=M^{-2}\Psi^*h_*$ 的联络是 $\nabla_*$ 的 pullback，因为常数度量缩放不改 Levi-Civita 联络；秩 $2+j$ 的协变张量范数被 $M^{2+j}$ 缩放，于是

$$
\lvert\nabla_n^j(M^{-2}\Psi^*u)\rvert_{h_{*,n}}=M^j(\lvert\nabla_*^ju\rvert_*)\circ\Psi,\qquad\lvert\nabla_n^j(M^{-1}\Psi^*v)\rvert_{h_{*,n}}=M^{j+1}(\lvert\nabla_*^jv\rvert_*)\circ\Psi
$$

（background.tex:30-41）。两个权重在 $\Psi$ 下可比，故对每个有限 $m$ 有固定 $C_m\ge1$ 使 $C_m^{-1}p_m^{\mathrm{orig}}(u,v)\le p_m^{\mathrm{norm}}(\mathcal T(u,v))\le C_m p_m^{\mathrm{orig}}(u,v)$（background.tex:42-51），特别地归一化 $p_{10}$ 球的原像包含原来的 $p_{10}$ 球（background.tex:52-54）。固定的这些变换保持完备性、真空方程、极大性与未来定向，也保持 Definition 1.1：光滑坐标变换保持局部 Sobolev 条件，常数度量缩放不改联络与类时出口；加权约束空间上的诱导映射是同胚，贫集可以拉回并限制到原来的开球（background.tex:56-64）。所以我按 $M=1$ 与一个固定的 $0<\mathfrak a<1$ 来证。

比较发展的输入也记一下，因为里面有两条我一开始以为可以省掉的不等式。取物理 Kerr 参数的一个小紧邻域，包含在转动亚极端范围里；那里的精确轮廓构造给出 $r_-<0$ 与正的绝对内表面引力，它把两个光学方向都重标到同一个固定率 $\kappa>0$，例如中心的绝对内表面引力，并给出内边界上光滑正的内部 lapse 与球度量及其光滑逆（background.tex:68-75）。深度 $q_0>0$ 要同时取得足够小以配合两个角向规范与那条精确轮廓不等式

$$
(\lvert\partial_\vartheta F\rvert^2+\mathfrak a^2\sin^2\vartheta)_{\mathrm{entry}}<4\mathfrak a^2,
$$

其中 $F$ 是该构造里的光学修正；可行之所以成立，是因为固定的紧参数范围离开零转动（background.tex:76-80）。更深的计算出口、外区常数与数据阈值都在其后选取，所有这些选择可依赖固定中心，没有一条要求在趋于零转动或极端时保持一致（background.tex:81-83）。$\epsilon$ 取得足够小以启用外区与内部构造（background.tex:85-86），得到的包不需要高阶半范数小性，也不需要 prescribed 领头系数或固定电荷条件（background.tex:92-95）。它给出以整桥为 Cauchy 面的光滑真空比较发展 $\mathcal P_d$ 与进入 $M_d$ 的开等距嵌入，我把 $\mathcal P_d$ 与它的像等同（background.tex:95-99）。依赖关系的坦白清单也在这一节：伙伴用了 Kerr 的稳态线性估计与零模分类（Theorems 5.1、5.2、6.6 与 Proposition 6.8、Lemma 6.9）， trapping 与系统估计来自 Dyatlov 与 Hintz，在该应用里 Hintz 的 Condition (2.5) 控制次主项余量、Proposition 3.12 给出伪微分内积归约，trapping 假设与对渐近平坦 Kerr 问题的特化在伙伴内提供，有限时间非线性闭合也是伙伴的另一段论证（background.tex:100-111）。

结构上有三点关键。$\mathcal P_d$ 含一个带过去领圈的下层区域、两端的外区计算区域，以及在整条类时柱面 $\mathcal S\simeq\mathbb R\times\mathbb S^2$ 上贴合的未来双零楔；在粘合构造里 $\mathcal S$ 是楔在 $\mathcal P_d$ 中唯一的相对边界，所以跨过 $\mathcal S$ 的未来类时轨道在从 $\mathcal P_d$ 首次耗尽之前一直留在楔里（background.tex:113-121）。楔内 $t=(u+v)/2\ge0$、$x=(v-u)/2$、$\mathcal S=\{t=0\}$，度量如第 6 节所写（background.tex:122-129）。角向 Sobolev $H^k$ 范数用固定有限球面 atlas 里的分量导数、固定局部化子与坐标密度；等价地可用一个固定的光滑参考联络与参考度量，等价常数与解无关，这就是固定坐标卡约定；下面的度量与逆界给出与参考度量的一致逐点比较（background.tex:155-165）。

背景估计包 prop:bg-package 三条我逐条抄。第一条：$\gamma^{\pm1}$ 与 $\mathcal A^{\pm1}$ 在角向 $H^6$ 有界，$\xi_i$、$a^{-1}\partial_vb$ 在 $H^5$ 有界；存在非负可测 $g_i:\mathbb R\to[0,\infty)$ 满足

$$
\sum_{n\in\mathbb Z}\sup_{[n,n+1]}g_i<\infty
$$

使得 $\lVert\chi_i\rVert_{H^4}+\lVert\ell_i+\kappa\rVert_{H^4}+\lVert B_i\rVert_{H^5}\le C(q+g_i(y_i))$；方向 $0$ 的一阶纯纵向导数 $\mathfrak L_i\chi_i$、$L_i\ell_i$、$\partial_ub$ 在放大 $g_i$ 之后有方向可和界直到角向 $H^2$（background.tex:183-199）。第二条：一阶普通纵向 jet 满足 $\lVert b\rVert_{H^5}+\sum_i\lVert(\chi_i,\ell_i+\kappa)\rVert_{H^4}\to0$ 等三行式，当 $t\to\infty$ 且 $\lvert u\rvert,\lvert v\rvert\to\infty$，显示的范数在楔内处处有界（background.tex:200-211）。第三条：固定 $U\in\mathbb R$、$C>0$ 与每个固定的普通坐标导数阶，$\gamma^{\pm1}$、$\log\mathcal A$、$b$、$a^{-1}\partial_vb$ 在截断楔 $u\le U$、$v\le CT$、$t\ge0$ 上有 $e^{o(T)}$ 界；对任一光学排序与受限坐标路子区间都成立；$a$、$\sqrt a$、$\partial_vb$ 的固定导数分别保留因子 $a$、$\sqrt a$、$a$，系数界次指数（background.tex:212-226）。证明里有一处我特别喜欢：把包络在每个 $[n,n+1)$ 上换成其在 $[n,n+1]$ 的上确界，得到可测阶梯函数，其闭单元上确界之和至多翻倍（background.tex:235-239）；这类"翻倍"细节是我原来最容易漏掉的。

归一化框架给出 $V_0\to D_0$、$V_1\to-D_0$、$V_A\to0$，

$$
D_0=\operatorname{diag}(-\kappa/2,\kappa/2,0,0),
$$

其中 $\widehat e_i=a^{-1/2}L_i$、$\widehat e_A=\partial_A$、$Z_i=L_i$、$Z_A=\sqrt a\,\partial_A$，$V_\alpha$ 是 $\nabla_{Z_\alpha}$ 在该框架下的联络矩阵（background.tex:249-260）。$a\operatorname{Riem}$ 在归一化槽上的分量与进入波算子的被微分联络阵都有界且在那里趋零，它们的固定普通 jet 花 $e^{o(T)}$；这是 prop:bg-package 与真空恒等式的推论，不含任何沿轨道曲率有界的假设（background.tex:261-269）。这句话是我和"标准内稳定文献"划清界限的地方：本篇的中间输入不需要观测者平行框架里的曲率界，所以后面的整片信号不被一个我 control 不了的背景量污染。

种子测度 $\mu_d$ 的定义要精确：种子 $w\in T\Sigma$ 决定未来单位初速，其法向与切向分量是 $(\sqrt{1+h(w,w)},w)$；用 $w\mapsto h(w,\cdot)$ 把 $T\Sigma$ 认同为 $T^*\Sigma$，$\mu_d$ 是其典范辛体积的 pullback，在位置与空间协变动量坐标里就是普通坐标体积；它是光滑正测度，在固定的预紧种子坐标卡上连续依赖初始度量（background.tex:271-285）。截面版本的一般陈述是：在未来单位质量壳上，辛形式的限制以流方向为核，故单值横截命中映射保持被限制二维形式及其三次外幂，于是时间层截面上的测度就是典范位置--动量体积，即使命中时间随初态变化（background.tex:286-293）。第 4 节那个具体计算就是它的实例。

引理 prop:bg-runout：完整寿命有限的种子必过 $\mathcal S$，其从 $\mathcal P_d$ 的首次耗尽或者是分支（一个光学坐标有限极限、另一个趋于 $+\infty$）、或者是角点（两者都趋于 $+\infty$）；对每个固定数据，首耗为角点的种子成 $\mu_d$ 零集（background.tex:295-303）。证明里我核对了几条假设：角点比例估计的前提是 prop:bg-package 的内部低阶界与一条从两个光学坐标都足够远处起步的未来单位类时楔轨道，它不含曲率界，也不含正则延拓假设（background.tex:310-315）。

管本身（lem:bg-branch-tube）三条：其一，$\overline{\mathcal N}$ 中所有种子有从 $\Sigma$ 到固定晚 $v$ 层的初始流管，其后轨道留在公共紧 $u$ 范围与一个球坐标卡里；较早流管里的层命中横截且单值；在典范状态变量 $(u,\theta,\pi_u,P)$ 里两个动量有界且

$$
p=-(\pi_u+b^AP_A)=a\dot v
$$

有正上下界，每条轨道在该排序下分支耗尽（background.tex:344-357）。其二，对足够小的固定零附近区间 $J$ 与一无界 $T$ 列，存在边长固定的乘积观测盒 $\mathcal Q_T$（在 $(u,v-T,\theta)$ 里）包含这些轨道在 $v\in T+J$ 的全部命中位置；固定的放大闭包留在公共 $u$ 与角向卡余量内；该放大闭包每一点出发的 $L_0$ 段在 $\mathcal S$ 上的角向足印，带固定内部余量，落在同一个容许的小发射片里，片的大小由低阶射线与领圈构造决定，与后来的导数与精度选择无关（background.tex:358-367）。其三，对固定 $u_2>u_*$、$c_2>0$ 与足够小的 $c_0>0$，管、$J$ 与盒长可取到使全部入口至观测的轨道段与放大观测盒带严格外余量地放进

$$
0\le t\le L_T=(T+u_*)/2+c_0,\qquad u\le u_2-c_0t/T,\qquad v\le T+c_2-c_0t/T
$$

里；薄片区间 $x$ 的长度对大 $T$ 有一致的正下界；入口面 $t=0$ 不需要余量（background.tex:368-382）。

证明的四个技术点我都想留住。分支态估计：令 $\Xi=\dot\theta-b\dot u$、$P_A=\gamma_{AB}\Xi^B$，单位归一化给

$$
2a\dot u\dot v=1+\lvert\Xi\rvert_\gamma^2,\qquad p=-g(\dot c,L_0)>0
$$

（background.tex:388-393）；低阶联络恒等式给出 $\lvert\dot{\log p}\rvert\le C(\dot u+\lvert\Xi\rvert_\gamma)$，形状项被 $\lvert\Xi\rvert_\gamma^2/p\le2\dot u$ 控制，lapse 与挠率系数有界（background.tex:394-398）；分支上 $\int\mathrm du<\infty$ 且 $\int a\,\mathrm dv<\infty$，由单位归一化得

$$
\int\lvert\Xi\rvert_\gamma\,\mathrm d\tau\le C\Bigl(\int\mathrm du\int a\,\mathrm dv\Bigr)^{1/2}<\infty
$$

（background.tex:399-403），这个 Cauchy--Schwarz 是我原来没想到的：两个可积量各带一个因子，交叉项自动可积。于是 $p,p^{-1}$ 有界，角向轨道长度有限（$\dot\theta=\Xi+b\dot u$ 且 $b$ 有界），有球上极限点并最终留在固定卡里（background.tex:404-407）。以 $v$ 为时间的约化 Hamilton 量是

$$
\mathsf H_v=-\pi_v=\frac{a(1+\gamma^{AB}P_AP_B)}{2p},\qquad\frac{\mathrm du}{\mathrm dv}=\frac{a(1+\gamma^{AB}P_AP_B)}{2p^2}
$$

（background.tex:409-417），其角向 Hamilton 方程与低角向系数界给 $\lvert\mathrm dP/\mathrm dv\rvert\le C(p+\lvert P\rvert)\mathrm du/\mathrm dv$，在递增且有界的 $u$ 里做 Gronwall 就界住 $P$，进而 $\Xi$、$\dot u$、$\pi_u=-p-b^AP_A$ 有界（background.tex:418-426）。状态邻域的半径可以取成与 $v$ 无关：$b$ 的低阶一阶导一致有界，故 $\mathrm{bg:p}$ 在有界动量集上一致状态-Lipschitz（background.tex:428-433）；在该邻域上 $\mathsf H_v$ 的每个固定状态导数被 $Ce^{-\kappa v}e^{o(v)}$ 界住（background.tex:433-437），Hamilton 场及其 Lipschitz 界因此对 $v$ 可积，初层选得让剩余积分场界小于状态余量，Gronwall 就把所有足够接近的状态留在邻域内对每个更晚的 $v$；它们的 $u$ 收敛、$v$ 无界、分支耗尽；再用较早的紧光滑流把邻域搬运回 $T\Sigma$ 里的 $\mathcal N$（background.tex:438-446）。

足印映射：记 $\Phi_v(u,\theta)$ 为过 $(u,v,\theta)$ 的 $L_0$ 特征线在 $u=-v$ 上的角向足印，角向变分方程给出

$$
\lVert D_\theta\Phi_v\rVert+\lVert(D_\theta\Phi_v)^{-1}\rVert\le C\exp\Bigl(C\int_{-v}^{u}(q+g_0(s))\,\mathrm ds\Bigr)\le C,
$$

其中 $\int_{-v}^{u}q\,\mathrm ds\le q_0/\kappa$，另一个积分由可和性控制（background.tex:448-457）。对终端 $u$ 求导贡献一个有界因子 $b$；对 $v$ 求导贡献动端点项 $b(-v,v,\cdot)$ 加上 $\partial_vb$ 乘以有界角向变分映射的积分，而 $\partial_vb=O(a)$ 且 $\int_{-v}^{u}a\,\mathrm ds\le C$，故也一致有界，于是足印映射在 $(u,\theta,v)$ 上一致 Lipschitz（background.tex:458-466）。有了它，缩 $\mathcal N$ 与 $J$ 就能让足印落在中心足印（在 $v=T$）的任意小固定邻域里；中心足印在紧球面上，某个无界子列落在同一个卡与同一个带内部余量的小片里；命中位置对 $\mathcal N$ 的接近由可积状态-Lipschitz 界保证，它们在固定区间 $J$ 上的变化由 Hamilton 场控制；取比这些变化大而相对发射余量小的固定盒半径，一致 Lipschitz 界就把放大闭包的足印留在该余量内（background.tex:468-487）。

有限域贴合的最后一步我算过一遍：$c_0$ 相对 $u_2-u_*$ 与 $c_2$ 取小，再缩状态邻域、$J$ 与盒半径使放大盒的每一点到三个上侧面都有严格余量；未来因果向量满足 $\mathrm du,\mathrm dv\ge0$ 且 $t$ 为时间向，故轨道上更早的点满足同样的严格侧面不等式，$u+c_0t/T$ 与 $v+c_0t/T$ 都向过去递减；薄片区间长度是

$$
T+c_2+u_2-2t-2c_0t/T,
$$

在 $t=L_T$ 处趋于 $c_2+u_2-u_*-3c_0>0$，更早的区间更长（background.tex:488-502）。这条"三个 $c_0$"的下界是第 10 节插值常数一致性的唯一来源，而它只在到观测为止的轨道段上要求，轨道后来的部分可以离开该区域（background.tex:502-505）。

最后一条是 Cauchy 稳定性的形式，我把它当作第 14 节配对的许可证：给定固定数据、其光滑发展中的一个紧子集、连到初始面的紧较早流管、以及有限个导数阶，附近的光滑约束数据有对应的邻域，度量在这些范数下任意接近；认同来自局部波规约、依赖域与几何唯一性；特别是严格的有限观测与横截不等式持续成立（background.tex:507-521）。每次使用都在一个固定有限实验上，允许的数据邻域可依赖它的时间与导数阶；既不要求附近数据共有同一光学规范的持续，也不要求极大测地线寿命的连续性（background.tex:522-525）。这两句"不要求"是我判断哪些东西必须本篇自证的分界线，见第 16 节。

## 12 曲率块信号：$D(g)$ 的显式公式与 $2A_T$

信号命题的形状：在 $\mathcal Q_T$ 内每个满足 $\lvert\cos(\lambda v)\rvert\ge1/2$ 的点上，对全部大 $T$ 有

$$
\lvert D(g_T)-D(g)\rvert>2A_T,
$$

范数是普通的角向分量范数；不假定 $\lvert D(g)\rvert$ 的界，也不假定背景平行框架曲率的界（attachment_signal.tex:178-187）。引言把 $D$ 称作"曲率块"，即零--角向曲率分量的二乘二阵列（introduction.tex:253-255）。

它的显式来源我很欣赏：完全避开曲率的分量展开，直接对一个无平移方向做交换子。取 $L_1=\partial_v$，零联络恒等式是 $\nabla_{L_1}L_1=\ell_1L_1$、$\nabla_{\partial_A}L_1=\chi_{1,A}{}^B\partial_B+\xi_{1,A}L_1$；因 $[\partial_v,\partial_A]=0$，把曲率交换子作用后与 $\partial_B$ 配对得

$$
D(g)_{AB}=\gamma_{BC}\partial_v(\chi_{1,A}{}^C)+(\chi_1\gamma^{-1}\chi_1)_{AB}-\ell_1\chi_{1,AB},
$$

用 $\partial_v\gamma=2\chi_1$ 降下被微分的指标，就得到精确公式

$$
D(g)=\partial_v\chi_1-\chi_1\gamma^{-1}\chi_1-\ell_1\chi_1=\tfrac12\partial_v^2\gamma-\tfrac14(\partial_v\gamma)\gamma^{-1}(\partial_v\gamma)-\tfrac12(\partial_v\log a)(\partial_v\gamma)
$$

（attachment_signal.tex:189-208）。原文特意为它加注：这个公式里没有逆径向 lapse（attachment_signal.tex:208）。这一条与第 9 节那条禁令是同一件事的两端：lapse 因子在模板定义里非负（packet_preparation.tex:667-690），信号公式里根本没有 $q^{-1}$。

线性化部分随之变得可算。模板满足 $\bar\chi_1=\chi_1+\tfrac12\partial_vk_\gamma$ 与 $\bar\ell_1=\ell_1+\partial_vk_H$（精确），故

$$
\delta D=\tfrac12\partial_v^2k_\gamma-\tfrac14\bigl((\partial_vk_\gamma)\gamma^{-1}\partial_v\gamma+(\partial_v\gamma)\gamma^{-1}\partial_vk_\gamma\bigr)+\tfrac14(\partial_v\gamma)\gamma^{-1}k_\gamma\gamma^{-1}(\partial_v\gamma)-\tfrac12\ell_1\partial_vk_\gamma-\tfrac12(\partial_vk_H)\partial_v\gamma
$$

（attachment_signal.tex:209-220）。$k_\gamma$ 表达式里的角向 Lie 项只含 $Z$ 与 $Z$ 的角导数、不含 $Z$ 的纵向导数（packet_preparation.tex:533-543），于是第 10 节的坐标增益给 $\partial_v^2(\mathcal L_Zg)_{AB}=O(A_T\lambda e^{o(T)})$；$k_H$ 的公式里 $Z$ 的纵向导数至多一阶，所以 $\partial_vk_H=O(A_T\lambda e^{o(T)})$；$\delta D$ 的其余线性项同界（attachment_signal.tex:221-227）。两次微分实的领头振荡（其无迹领头张量在迹反演下不变）给出

$$
D(\bar g)-D(g)=-\tfrac12A_T\lambda^2\cos(\lambda v)(p_0)_{AB}+O(A_T\lambda e^{o(T)})+O(A_T^2\lambda^{P}e^{o(T)})
$$

（attachment_signal.tex:228-236）。$\zeta$ 取足够小使最后一项是 $o(A_T)$（attachment_signal.tex:236-237），中间项相对领头是 $\lambda^{-1}e^{o(T)}$ 阶，而 $\lambda^2A_T$ 与整片下界 $\lvert(p_0)_{AB}\rvert_\gamma\ge e^{-o(T)}$（packet_preparation.tex:58-60）配上 $\lvert\cos(\lambda v)\rvert\ge1/2$，就把领头压过第 10 节的主误差 $e^{-(1+c)\alpha T}$（attachment_signal.tex:237-240 附近）。这就是我为什么在第 11 节要盯住"$e^{o(T)}$"这个约定的适用范围：$e^{-o(T)}$ 与 $e^{-(1+c)\alpha T}$ 之间的比较是真正的指数之争，只有 $\lambda$ 的幂次能赢。

粘合命题我也核对了假设清单，因为范畴论证要在完整 MGHD 里做观测。命题 prop:experiment-attachment 说：足够大的有限 $T$ 下，精确外区与深层实验限制在各自构造余量内，落在 $d_T$ 的一个光滑整体双曲真空发展里；该发展等距嵌入其完整 MGHD $M_{d_T}$；保留完整初桥与外区修正尾巴；公共的较早分支管与紧观测区域在贴合区域内有余量（attachment_signal.tex:15-23）。证明依赖下层与外区的定性粘合构造，其假设是：全桥 $p_{10}$ 接近、早期贴合的紧因果阴影上的精确保护一致性、真实的修正部分薄片数据、放大匹配带上的低阶外区接近、以及严格的流出与重合余量（attachment_signal.tex:24-32）。下层有限块构造对 $d_T$ 适用，因为 $p_{10}(d_T-d)\to0$；它包含新桥的每个空间半径、一个过去领圈、两端弯曲的外区初始薄片及其上的固定前向带，在两端弯曲薄片在固定紧集外等于原桥（attachment_signal.tex:33-39）。保护球含一个固定原点球，半径 $(1-2\beta-s_*)t_T-O(1)\to\infty$，所以弯曲件与有界连接件需要的每个固定紧因果阴影都完全未变；公共早期 Cauchy 规范里的依赖域把这些件与背景认同；大半径处所选端的水平薄片携带真实的新数据及其尾巴，那里没有用旧数据替换（attachment_signal.tex:40-47）。外区在一个固定的贴合时刻 $t_a$ 接上，用收缩外截断；放大固定带上的认同 wave map 有 prescribed 初始薄片映射与匹配单位法向；固定时间 wave map 稳定性给出较小带上的微分同胚，并且在大的外截断上一致：外区坐标卡有一致低正则几何、新度量低阶接近、人工侧面严格流出；诱导度量与第二基本形式一致，wave 规范决定其余法向度量 jet，约化唯一性使该映射成为等距（attachment_signal.tex:48-62）。

## 13 平均和乐障碍：停时、十七个圈长与密度换体积

和乐侧的目标命题值得逐字记：设观测盒上满足 Gram 假设 $\mathrm{(ho{\text -}gram{\text -}assumptions)}$、所选单位切向的 $F$ 分量有界、动量落在固定有界盒内；固定一个延拓与一簇至多 $B$ 个坐标卡，带有定义 def:exit-test 里的度量、逆度量与联络界。令 $\mathcal G_T\subset\mathcal P_T$ 为那些基点与单位切向在该簇至少一个卡里满足余量与速度条件的可测参数。则存在可测例外集 $\mathcal N_T\subset\mathcal G_T$ 使

$$
\nu_T(\mathcal N_T)\le C e^{-\kappa T/16},
$$

且对 $\mathcal G_T\setminus\mathcal N_T$ 里的每个参数，

$$
\lvert D\rvert\le C e^{-13\kappa T/32}+Q_Te^{-\kappa T}=o(A_T),
$$

常数只用 $B$ 与一致观测界（holonomy_category.tex:251-272）。我把 $\nu_T$ 理解为参数测度 $\mathrm dx\,\mathrm dm$，$x=(v,u,\theta)$、$m=(\pi_u,P)$，是六维的（holonomy_category.tex:316-330；联合估计里出现的 $\operatorname{vol}_6$ 也印证这一点，holonomy_category.tex:441-530）。参数集的具体形状我没有逐行读，标为推测，见第 17 节。

圈与曲率的接口是引理 ho:loop-jets。统一在观测位置与 $X\in\mathcal X$ 下有

$$
\sup_{0\le l\le17l_T}\lVert\partial_l^{18}H_{x,X}(l)\rVert\le Q_T,
$$

而 $H_{x,X}(l)-\mathrm{Id}$ 的二阶 Taylor 系数 $C_2(x,X)$ 是在 $F(x)$ 下 $\pm R(\partial_v,rX)$ 的矩阵，于是

$$
g\bigl(C_2(x,X)F_1,X\bigr)=\pm R(\partial_v,X,\partial_v,X)=\pm D(X,X),
$$

符号由曲率与圈取向的同一约定固定（holonomy_category.tex:172-184）。证明用 Koszul：$F$ 交换，故 $C^k{}_{ij}=\tfrac12G^{kh}(F_iG_{jh}+F_jG_{ih}-F_hG_{ij})$；对常数列 $V$ 与 $W=rV^iF_i$，$W$ 上的联络矩阵是

$$
\mathsf A(W)^k{}_j=\tfrac12G^{kh}V^i\bigl((rF_i)G_{jh}+(rF_j)G_{ih}-(rF_h)G_{ij}\bigr),
$$

每个 $rF_i$ 是 $r\partial_u$、$\partial_v$、$r\partial_{\theta^A}$ 之一（holonomy_category.tex:185-200）。这里的缩放 $r$ 与我读到的第 14 节 $r_T=e^{-\kappa T}$ 是同一族归一化（attachment_signal.tex:284-348 区间内的框架定义），它让四条边的长度在物理尺度上是各向异性的：$v$ 方向不缩、$u$ 与角向缩 $r$。这一点很重要，因为 $D$ 是 $\partial_v$--角向的曲率块，圈要在两个方向上都有非退化跨度才能探测它。

命题证明里有四处我认为是纯技巧但决定生死。其一，选择器：在每个好参数处选取坐标余量至少 $1/B$ 且 $\lvert U_c\rvert\le B$ 的最小卡指标；有限个选择器可测，且可以依赖全部三个动量标签；先固定那有限个弱 Christoffel 阵的 Borel 代表；由引理 ho:base-comparison 基点框架矩阵满足 $\lVert M(0)\rVert+\lVert M(0)^{-1}\rVert\le C_0$，取固定 $K>2C_0+1$（holonomy_category.tex:274-283）。其二，采样：固定 $X\in\mathcal X$ 与采样的正尺度 $l=j\,l_T$，$1\le j\le17$；四条拼接边全程使用选定的基点卡；在这条拼接上只定义一个首次停止：当 $\lVert M\rVert=K$ 或坐标位置相对基点移动了欧氏距离 $1/(2B)$ 时就停，后者因基点余量 $1/B$ 保证路径仍在卡内；早停之后的边对下面任何积分不贡献；全局停之前的内禀光滑路径、框架矩阵与坐标都是有定义的；更精确地，参数在给定时刻处于停之前，当且仅当两个严格阈值在拼接中每个较早时刻都成立，在固定卡里这个条件可以用对有理较早时刻的上确界表达，故在光滑状态域上是 Borel，与可测所选参数集相交给出下面用的停定子集（holonomy_category.tex:284-306）。这段是我在第 5 节末尾承诺要看的"停时加最小指标如何保住可测性"，答案是：把可数性放在"对有理时刻取上确界"上，其余全部交给 Borel 结构与有限卡数。

其三，边平移与"只用密度"的体积控制。四条边的平移依次是 $sl\,\partial_v$、$l\,\partial_v+slrX$、$(1-s)l\,\partial_v+lrX$、$(1-s)lrX$（holonomy_category.tex:307-315），在固定边参数 $s$ 处位置是 $x\mapsto x+c_e(s,l)$ 的平移，与 $m$ 无关。选定一个卡 $c$，先限制在好参数且全局停之前，再把非负积分放大到所有 $m\in Q$ 与所有落在该卡里的平移后观测位置。在位置上，该平移、光滑开等距嵌入与坐标映射合成为光滑单射坐标映射；它的体积变化不必估计导数矩阵就能控制：等距性与密度界给出

$$
\mathrm dx\le C r^{-1}\,\mathrm dvol_g=C r^{-1}\sqrt{\lvert\det\widetilde g_c\rvert}\,\mathrm dy_c\le C_B r^{-1}\,\mathrm dy_c,
$$

于是对每个固定 $s$，

$$
\int_{\mathcal G_T:\text{卡 }c\text{ 被选，全局停之前}}\lvert\widetilde\Gamma_c(y_c(x+c_e(s,l)))\rvert^2\,\mathrm d\nu_T\le\frac{C_B\lvert Q\rvert}{r}\int_c\lvert\widetilde\Gamma_c(y)\rvert^2\,\mathrm dy.
$$

这里 $\mathrm d\nu_T=\mathrm dx\,\mathrm dm$，没有种子 Jacobian 剩下，有界动量纤维只贡献 $\lvert Q\rvert$；依赖动量的卡选择与停条件只是在放大之前限制了积分；原文特别加了一句：这一步还没有用到那个尚未证明的沿边 $M$ 界（holonomy_category.tex:316-343）。我读到这里停了一下，因为它防止了一个很常见的循环：先用沿圈框架的界去换体积，再拿体积平均去证框架的界。正确顺序是只用等距性给出的密度界，把 $r^{-1}=e^{\kappa T}$ 这一笔代价显式留在右边，靠 $L^2$ 界的固定 $B$ 与采样尺度把它压回指数之下。

其四，几乎处处与 Fubini：卡的弱 Christoffel 阵在开像上几乎处处等于其内禀光滑阵；对每个 $s$，例外位置零集在前面的光滑坐标映射下的原像是零集；对 $s,x,m$ 用 Fubini 说明，在一个参数的零集之外，停止后的轨迹积分不因代表元的选取而改变；对有限个采样圈各自丢掉该零集。这一步论证了可以用光滑联络方程，且没有对单独指定的圈宣称任何 Sobolev 迹（holonomy_category.tex:331-345）。接着对 $s\in[0,1]$ 积分并把至多 $B$ 个卡相加，用形如 $I_e(x,m)=\int_0^1\mathbf 1_{\{\text{全局停之前}\}}\,\mathrm ds$ 的量把四条边的贡献汇总（holonomy_category.tex:346-352）。

最后把两个数摆在一起核对，这是我在这节最想要的确认：$e^{-13\kappa T/32}$ 与 $A_T=e^{-\kappa T/4}=e^{-8\kappa T/32}$ 相比多出 $5\kappa T/32$ 的衰减，确实是 $o(A_T)$；$Q_Te^{-\kappa T}$ 要成为 $o(A_T)$ 就需要 $Q_T=o(e^{3\kappa T/4})$，而 $Q_T$ 是引理 ho:loop-jets 里那个 18 阶圈 jet 界，在我的推测里至多按 $e^{o(T)}$ 或某个固定多项式增长，条件很松（holonomy_category.tex:172-184,267-270）。例外测度 $C e^{-\kappa T/16}$ 在第 14 节被当作不超过 $0.05$ 的损失扣除，配合 $.99$ 密度得到 $.91$，这个我在第 14 节里逐项对过。17 个尺度与 $\partial_l^{18}$ 的组合对应引言里那句"在圈长上做有限插值，于是抽出一个曲率分量"（introduction.tex:261-264）：对一个 $l$ 的 $18$ 次可微函数，在 $17$ 个离散尺度上的取值足以把二阶 Taylor 系数与高阶余项分离，余项用 $\sup\lvert\partial_l^{18}\rvert\le Q_T$ 控制；至于为何正好是 $17$ 与 $18$，我的理解是"尺度数比导数阶少一"式的有限差分配置，但原文的具体插值引理我没有逐行读，标为推测。

## 14 两个延拓见证的配对：$0.91$ 的联合好参数

命题 prop:matched-seeds 是范畴论证的铰链，内容我按三段记。第一段是末态认同与回推映射：对 $v\in T+J_0$，在 $g_T$ 的未来单位壳上使用同一组数值末态，它们的回推测地线给出映射 $\Psi_{T,v}:O_0\to O$ 且

$$
\sup_{v\in T+J_0}\lVert\Psi_{T,v}-\mathrm{incl}\rVert_{C^1}\longrightarrow0,
$$

记左边为 $\delta_T$；每个映射单射并保持对应的截面测度，$\Psi_{T,v}^*\mu_{d_T}=\mu_d$ 于 $O_0$；特别地 $\mathcal H_v(O_0)$ 对每个这样的 $v$ 有典范体积 $\mu_d(O_0)$（attachment_signal.tex:286-300）。第二段是框架与密度：取

$$
r_T=e^{-\kappa T},\qquad F=(\partial_u,\,r_T^{-1}\partial_v,\,\partial_{\theta^1},\,\partial_{\theta^2}),
$$

则在大观测盒上 $g$ 与 $g_T$ 关于 $F$ 的 Gram 矩阵及其逆一致界且非退化，它们的普通坐标 jet 直到三十阶是 $e^{o(T)}$；所选单位切向在 $F$ 下有界，所有状态动量落在一个有界盒里，且

$$
c\,r_T\,\mathrm du\,\mathrm dv\,\mathrm d^2\theta\le\mathrm dvol_g,\ \mathrm dvol_{g_T}\le C\,r_T\,\mathrm du\,\mathrm dv\,\mathrm d^2\theta
$$

（attachment_signal.tex:300-312）。第三段是持续性：对每个固定有限 $T$ 与每个 $\eta_{\rm map}>0$，这些观测在 $d_T$ 的某个足够小相对加权光滑邻域内持续，信号下界换成 $A_T$ 取代 $2A_T$；持续下来的公共坐标无需是光学的；典范截面体积、单射回映射入 $O$、框架与密度界都持续，且回映射满足 $\sup_{v}\lVert\widehat\Psi_{T,v}-\Psi_{T,v}\rVert_{C^1}<\eta_{\rm map}$ 与 $\sup_v\lVert\widehat\Psi_{T,v}-\mathrm{incl}\rVert_{C^1}\le\delta_T+\eta_{\rm map}$，邻域可依赖 $T$ 与 $\eta_{\rm map}$（attachment_signal.tex:312-330）。证明的入口是双零变量下的单位质量壳 $p=-(\pi_u+b^AP_A)>0$、$2p\pi_v+a(1+\gamma^{AB}P_AP_B)=0$，于是约化 Hamilton 量 $\mathcal H=-\pi_v=a(1+\gamma^{AB}P_AP_B)/(2p)$；用 primed 场写的同一表达式在相同数值末态处定义新的未来单位根；背景管把 $p$ 留在紧正区间、其余动量有界，又 $b_T-b\to0$ 一致，故新的 $p_T$ 仍离零有界（attachment_signal.tex:331-348）。

我原来以为"同一数值末态"是句方便话，读完配对论证才明白它是全篇最紧的一条约束：两个数据的测地线必须在同一组坐标数值上有相同的末位置与末动量，才能在第 13 节的同一批圈上同时套用障碍。这条约束的代价由截面体积守恒支付：$\Psi_{T,v}$ 单射且保测度，所以两个好种子族在 $O_0$ 上的原像可以直接做测度扣除。

定理 thm:nowhere-dense 的陈述：对 prop:bg-package 固定的那一个邻域 $\mathcal U_\epsilon$，def:exit-test 的每个 $E(O,B)$ 在 $\mathcal U_\epsilon$ 中相对无处稠密（holonomy_category.tex:457-461）。反证结构我按它的顺序记。假定有非空相对开集 $V\subset\mathcal U_\epsilon$ 含于 $\overline{E(O,B)}$；因在 $V$ 中稠密，取 $d\in E(O,B)\cap V$；加权半范数递增，故存在有限 $m\ge10$ 与 $\eta>0$ 使 $\{d'\in\mathcal U_\epsilon:p_m(d'-d)<\eta\}\subset V$（holonomy_category.tex:462-472）。固定该数据的分支管与延拓见证；在阶 $m$ 上按其无界可容许观测时刻列应用有限波包构造，于是精确全桥数据 $d_T$ 满足 $p_m(d_T-d)\to0$，对充分大 $T$ 落在 $V$ 里（holonomy_category.tex:473-481）。由 $E(O,B)$ 在 $V$ 中稠密，prop:matched-seeds 允许对每个这样的固定 $T$ 取 $\widehat d_T\in E(O,B)\cap V$，接近 $d_T$ 到全部有限观测条件所要求的程度，并且另外要求 $p_0(\widehat d_T-d_T)\to0$；记其观测度量为 $\widehat g_T$，于是在公共位置管上有

$$
\lvert D(\widehat g_T)-D(g_d)\rvert>A_T\quad\text{只要 }\lvert\cos(\lambda v)\rvert\ge1/2,
$$

两个度量都满足第 13 节的一致假设，那里的常数与 $T$ 无关，所需的有限接近正是为保住它们而选的；初始截面密度对 $h$ 的光滑依赖给出 $\mu_{\widehat d_T}(O)/\mu_d(O)\to1$（holonomy_category.tex:482-500）。

测度扣除这一步我把每个数都记下来。$S\subset O$ 与 $\widehat S_T\subset O$ 是两个存在性延拓见证里的好种子族，各自超过其 $O$ 上相应测度的 $99$ percent；用参数测度做背景命中，在固定 $v$ 处，来自背景种子落在 $S$ 之外的参数损失至多 $.01\mu_d(O)$；$\widehat g_T$ 的匹配回映射单射入 $O$ 并保持其典范截面测度，故来自 $O\setminus\widehat S_T$ 的损失至多 $.01\mu_{\widehat d_T}(O)$；由测度比趋一，二者合计对大 $T$ 小于 $.04\mu_d(O)$，且对每个 $v$ 层一致，于是若 $\mathcal G_T^{\cap}$ 表示对两个度量都好的参数，

$$
\operatorname{vol}_6(\mathcal G_T^{\cap}\cap\{v=\text{const}\})>(.95-.04)\mu_d(O)=.91\mu_d(O),
$$

对 $v$ 的依赖由光滑有限流映射可测；两个见证任一方的坐标界都适用于这些观测，因为 def:exit-test 把它们施加在整个未来测地线寿命上，而匹配观测是该测地线的内点（holonomy_category.tex:501-520）。这里的 $.95$ 我核对过：它来自第 13 节例外集 $\nu_T(\mathcal N_T)\le C e^{-\kappa T/16}$，$T$ 大后小于 $.05$，与 $.99$ 的两次 $.01$ 损失相互独立地扣掉（holonomy_category.tex:263-265,501-520）。

最后的 $v$ 积分也很干净。令 $I_T=\{v\in T+J_0:\lvert\cos(\lambda v)\rvert\ge1/2\}$，该条件占每个完整周期的 $2/3$，区间里只有两个端周期可能不完整，故 $|I_T|=\tfrac23|J_0|+O(\lambda^{-1})>\tfrac12|J_0|$ 对大 $T$ 成立；把逐层下界在 $I_T$ 上积分就得到 $\nu_T(\mathcal G_T^{\cap}\cap\{v\in I_T\})$ 的正下界（holonomy_category.tex:521-530）。有了正测度的联合好集，矛盾是现成的：集上每个参数对两个度量都有 $\lvert D\rvert=o(A_T)$（第 13 节），故 $\lvert D(\widehat g_T)-D(g_d)\rvert=o(A_T)$，与上面 $>A_T$ 冲突。我在第 7 节说过的"单点极化不够用"就是在这里兑现：需要一个测度下界 $.91\mu_d(O)$ 与周期占比 $2/3$ 相乘后的正测度集，逐点信号不能提供这个。原文还补了一句关于范畴论证性格的话：每个持久性断言只涉及一个固定有限观测，整个论证不要求极大测地线寿命的连续性（introduction.tex:280-282）。

## 15 量级账的核对：指数之间的严格间隙

我把所有不等式集中排一遍，这是我自己检查这篇论文的方式，任何一条反了就会在对应那一步崩。记 $\alpha=\kappa/4$，$A_T=e^{-\alpha T}$（packet_preparation.tex:21-24）。

第一组是制备侧。内部损失 $\eta<\min\{\eta_{\rm out},\alpha/4\}$（packet_preparation.tex:84-89）；入口比较 $A_T^2e^{\eta T}$ 严格改进 bootstrap 需要 $2\alpha-\eta>\alpha$，等价于 $\eta<\alpha$，被更强的 $\eta<\alpha/4$ 满足（packet_preparation.tex:413-421）。频参数侧 $\zeta P_*<\alpha/2$ 让重标种子基座范数变小（packet_preparation.tex:296-299），并在主定理选择序里加强为 $\zeta P_{\mathrm{base}}<\alpha/2$（nonlinear_comparison.tex:1204-1210）；模板缺陷第二项 $A_T^2\lambda^{P_N}e^{o(T)}$ 要成为 $o(A_T)$ 需要 $\alpha>\zeta P_N$，同上条件已足够（packet_preparation.tex:698-707）。

第二组是比较侧。低误差给 $L^2$ 指数 $2\alpha-\eta_2$（nonlinear_comparison.tex:820-849），高阶给 $e^{o(T)}$，插值消耗因子 $1-\vartheta$，$\vartheta=(k+2)/M$，要求 $2\alpha(1-\vartheta)>(1+c_1)\alpha$（nonlinear_comparison.tex:1178-1186）。取 $\eta_2$ 与 $\vartheta$ 足够小即可，$\vartheta$ 小靠 $M\gg k+2$，$k\ge2s$、$s\ge30$（nonlinear_comparison.tex:20-21,1176-1180）：例如 $k=2s=60$、$M\ge130$ 时 $\vartheta\le62/130<1/2$，再放大 $M$ 就能把 $2(1-\vartheta)$ 推到任意接近 $2$，跨过 $1+c_1$ 有余量。主误差 $e^{-(1+c)\alpha T}$ 相对 $A_T$ 的间隙是 $c\alpha T$（nonlinear_comparison.tex:54-59）。模板改动界 $e^{-(\alpha-\eta_0)T}$ 与 $\eta_0<\alpha/2$ 使它小于 $\tfrac12e^{-\alpha T/2}$，从而改进 $e_T=e^{-\alpha T/2}$（nonlinear_comparison.tex:176,1278-1284）。

第三组是信号侧。领头 $-\tfrac12A_T\lambda^2\cos(\lambda v)(p_0)_{AB}$ 与线性余项 $O(A_T\lambda e^{o(T)})$ 之比是 $\lambda e^{-o(T)}$，靠 $\lambda=e^{\zeta T}$ 发散（attachment_signal.tex:228-236）；整片极化下界 $\lvert(p_0)_{AB}\rvert_\gamma\ge e^{-o(T)}$ 只损失次指数（packet_preparation.tex:58-60）；于是 $\lvert D(g_T)-D(g)\rvert>2A_T$ 在 $\lvert\cos(\lambda v)\rvert\ge1/2$ 处成立（attachment_signal.tex:182-184），持续性把它降到 $A_T$（attachment_signal.tex:312-330）。

第四组是和乐侧。$e^{-13\kappa T/32}$ 对 $A_T=e^{-8\kappa T/32}$ 有 $5\kappa/32$ 的间隙；$Q_Te^{-\kappa T}$ 与 $A_T$ 相比需要 $Q_T=o(e^{3\kappa T/4})$；例外集测度 $C e^{-\kappa T/16}$ 供 $.05$ 的扣除（holonomy_category.tex:263-270,501-520）。$r^{-1}=e^{\kappa T}$ 的密度代价出现在平均不等式右端，$1/r$ 与 $B$ 个卡的 $L^2$ 界合起来决定上面那两个 $32$ 分母指数（holonomy_category.tex:316-343）。

有一处我起初算错过，值得留着：$\sqrt a\asymp e^{-\kappa T/2}$ 与 $A_T$ 比较时我误用 $u+v$ 的最大值 $2T$，得 $a\asymp e^{-2\kappa T}$。实际观测在 $u\to u_*\in\mathbb R$ 的分支上，$u+v=T+O(1)$，所以 $a\asymp e^{-\kappa T}$（background.tex:127,341-357 的分支设定）。这个 $O(1)$ 差别在第 6 节的三候选比较里决定 $\sqrt a$ 与 $A_T$ 的相对次序。

## 16 伙伴接口的分工：哪些必须本篇自证

三篇近 Kerr 文章的嵌入与未来出口约定相同；在同一固定正转动中心的公共数据邻域限制上，许可的 ambient 度量类满足

$$
C^2\ \subset\ C^1\ \subset\ C^0\cap W^{1,2}_{\mathrm{loc}},
$$

排除最大类给出三者中最强的不可延拓结论；每篇仍是独立结果，各自可选自己的邻域；本篇使用中间伙伴结果时以下述假设为条件，两个伙伴的头条不可延拓定理都不是本篇前提（introduction.tex:180-191）。分工表我按角色抄成散文。$C^2$ 伙伴提供外区与内部比较几何、有限完整寿命测地线的首耗分类、约束层级与光束构造、支撑保持的约束修正、下层区域构造；$C^1$ 伙伴提供角点零测性、分支态与典范管估计、对 $C^2$ 射线构造的固定片精化、对每个固定 $\alpha>0$ 与 $A_T=e^{-\alpha T}$ 直到入口柱面的线性与外区制备、以及定性整桥贴合接口；本篇提供从任意弱出口得到正测度族、开观测族与整片波包适配、在 $A_T=e^{-\kappa T/4}$ 的双零非线性比较、以及平均和乐障碍（introduction.tex:193-215）。

两件事被明确划成本篇自证，我在正文里都找到了对应的证明位置。第一件：$C^1$ 的波包定理本身给单点极化，整片下界在本篇从其输运构造证出（introduction.tex:217-218），落点是第 7 节的实输运与鼓包论证（packet_preparation.tex:142-159）。第二件：$C^1$ 伙伴在这些固定衰减率上的外区估计止步于入口柱面，本篇在当前振幅处证明深度比较（introduction.tex:219-221），落点是第 8 节的首达与能量率论证（packet_preparation.tex:336-427）。这两条正是我第 7 节那条死路的出口。

伙伴编号接口我从映射表里核了几条常用的：$C^2$ 那边的 Prop 8.2 给比较发展、Lemma 8.1 给有限范围、Cor 8.6 与 Lemma 8.7 给首耗分类与角点比例、Prop 6.4 给外区闭合、Prop 7.3 到 7.7 给入口柱面假设、低阶、纯 jet、高阶与延续、Lemma 7.8 给标签交换、Prop 9.7 与 9.6 给光束与逃逸、Prop 9.9 与 9.10 给外区与贴合命题、Lemma D.1 与 D.2 给约束求解界面、Prop 2.2 给闭测试引理（companion-references.tex:14-60）；$C^1$ 那边的 Lemma 2.4 给 Baire、Prop 4.3 与 4.5 给分支态与系数、Prop 4.6 与 Cor 4.8 给波包与振幅无关版本、Cor 5.3 与 5.4 节给外区制备、Lemma 3.3 与 Prop 3.10 给闭测试与角点零测、7.1 节与 Lemma 7.2、7.3 给整桥贴合接口（companion-references.tex:65-94）。这些编号是接口标签，我只在本篇引用处核对名字与种类是否一致，没有去读伙伴正文。

## 17 与最初设想的差异，以及仍然存疑之处

动笔前我对这篇论文的期待是"把 $C^1$ 的障碍降到 $L^2$ 联络"，重心应在偏微分估计。读完七片正文后，我的判断改了三次，记录如下。

第一次改动发生在第 2 节那条死路上：缺的东西是工具类，指数值。$L^2_{\mathrm{loc}}$ 的联络在给定曲线上无迹，$W^{1,s}$、$s>1$ 的既有判据又都带迹或带参考边界等价（introduction.tex:171-178），所以任何单曲线策略都要重新发明。真正被引进的是三件测度工具：相空间平均配截面体积守恒（weak_exits.tex:286-336）、位置平均配密度换体积（holonomy_category.tex:316-345）、以及有限采样在圈长上插值出曲率分量（holonomy_category.tex:172-184）。偏微分那三节（第 8 到第 10 节）在我眼里降级成了信号发生器：它们的全部任务是在一个正测度观测集上造出 $2A_T$ 的相对差，其余部分与通常的内稳态分析关系不大。

第二次改动是关于范畴论证的性格。我原本打算把"可延拓数据"写成某种闭或可测依赖的集合，再谈上半连续；实际论证只用最弱的一种持久性：每个固定有限观测的严格不等式在数据的小相对加权光滑邻域内持续（background.tex:507-525；attachment_signal.tex:312-330），并且明确不要求附近数据共有同一光学规范，也不要求极大测地线寿命连续（background.tex:522-525；introduction.tex:280-282）。这一点让我在第 5 节那次闭性误判上承认了自己的默认假设来自双曲 PDE 的直觉，此处并不成立。

第三次改动是振幅。我起初把 $A_T$ 当作线性精度的副产品，读完第 6、12、13 节才明白它是一个三方仲裁的结果：对模板误差要 $e^{-(1+c)\alpha T}=o(A_T)$，对信号要 $A_T\lambda^2\gg A_T\lambda e^{o(T)}+A_T^2\lambda^{P}e^{o(T)}$，对 bootstrap 改进要 $2\alpha-\eta>\alpha$，而和乐侧的 $Ce^{-13\kappa T/32}$ 又要求 $A_T$ 落在它和 $e^{-\kappa T}$ 之间。$\kappa/4$ 是唯一同时满足这四条的简洁取法（packet_preparation.tex:21-24；nonlinear_comparison.tex:1178-1186；attachment_signal.tex:228-236；holonomy_category.tex:267-270）。

存疑清单我按"没读到的行段"来列，因为这些都是取材边界造成的，我拒绝硬编。

其一，圈长基准尺度 $l_T$ 的定义在 holonomy_category.tex:17-169 之间，我没有读那一段，所以无法写出 $17l_T$ 的物理跨度，只能确认它必须让二阶项与余项同时是 $o(A_T)$（holonomy_category.tex:174-176,284-286）。$l_T$ 与 $r=e^{-\kappa T}$ 缩放的关系也是推测。

其二，$\nu_T(\mathcal N_T)\le C e^{-\kappa T/16}$ 与 $\lvert D\rvert\le C e^{-13\kappa T/32}+Q_Te^{-\kappa T}$ 的推导链在 holonomy_category.tex:353-440，我读到的是它的汇总形式（holonomy_category.tex:251-352）。因此我对"$1/16$ 与 $13/32$ 从哪一步分别掉出来"只有第 15 节那种必要条件级的理解。

其三，参数集 $\mathcal P_T$、测度 $\nu_T$ 的精确构造、以及 Gram 假设的内容在 holonomy_category.tex:17-136，我只用了命题与证明里出现的记号（holonomy_category.tex:251-272,316-343）。所以第 13 节末尾关于"六维参数测度"的判断，是从 $\operatorname{vol}_6$ 与 $\mathrm dx\,\mathrm dm$ 反推的。

其四，两个度量的末态对齐细节在 attachment_signal.tex:241-283，包括式 at:terminal-state 的写法，我只读到它的引用处（attachment_signal.tex:286-300）；同片 63-175 的内部贴合与符号讨论我也只读了尾部。第 14 节关于"同一数值末态"的说法因此部分依赖我的重构。

其五，一致有限薄片高界的证明主体在 nonlinear_comparison.tex:216-794，低阶电流的闭合在 906-1173；我只引用了它的陈述位置与它在插值侧请求的缓冲阶（nonlinear_comparison.tex:213-215,1178-1203）。第 10 节第三层里"每个固定状态导数花 $e^{o(T)}$"这类断言的出处在那里，我没有逐条对上。

其六，$Q_T$ 的增长类型（多项式或 $e^{o(T)}$）我没有证据，第 6 与第 13 节把它当 $o(e^{3\kappa T/4})$ 用属于推测，理由仅在约定 conv:bg-subexp 的适用范围（background.tex:167-177）。

其七，第 6 节三个候选振幅的失败量级是我的重构：正文只给了 $A_T>\sqrt a$ 这个不等号与最终选取，没有列出被淘汰的方案（introduction.tex:242-246；packet_preparation.tex:25-27）。

其八，参考文献与两篇伙伴的正文都不在本单取材范围，`refs/sources.bib` 与 `README.md` 我只当索引，两张 `figures/` 分片只用了正文中的图注（weak_exits.tex:450-462）。

## 18 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $p_{10}$ | 仅十阶半范数要求小 | introduction.tex:40 | 定理主陈述与邻域 $\mathcal U_\epsilon$ | 降到 $p_{9}$ 则第 5 节条件 $(ii)$ 无来源 |
| $\epsilon(M,\mathfrak a)$ | 只依赖固定中心 | introduction.tex:99-101 | 主定理邻域 | 要求一致则第 11 节归一化不闭合 |
| $\Gamma^{\flat}_{i\,jk}$ | 与 $g\in W^{1,2}$ 等价 | introduction.tex:72-79 | 全部和乐与平均估计 | 改用逐点导数则第 2 节死路复活 |
| $C^2\subset C^1\subset C^0\cap W^{1,2}$ | 三类包含关系 | introduction.tex:183-186 | 结论强度排序 | 缩小类别则第 14 节配对失去动机 |
| $.99$ | 好种子密度阈值 | weak_exits.tex:487-493 | 第 14 节 $.91$ 联合余量 | 降到 $.90$ 则扣除后余量为负 |
| $B$ | 卡数与三界及余量倒数 | weak_exits.tex:494-502 | 可数覆盖与和乐常数 | 令其依赖数据则可数化失效 |
| $1/B$ | 坐标余量下界 | weak_exits.tex:501-502 | 第 13 节停阈值 $1/(2B)$ | 阈值放大则停前区域可能出卡 |
| $c_1l^3\le\lvert A_l\rvert$ | 初态体积两侧 | weak_exits.tex:262-266 | 平均的分母与 $G_l$ 测度 | 失去下界则 $G_l$ 陈述无意义 |
| $o(l^3)$ | 归一化联络质量趋零 | weak_exits.tex:157-161,323-330 | 斜率停法排除 | 仅为 $O(l^3)$ 时选不到好中心 |
| $2\epsilon_0$ | 斜率宽阈值 | weak_exits.tex:348-353 | 停法三选一的排除 | 与 $\epsilon_0$ 同值则鼓包同伦失效 |
| $c_3\le\mathrm ds/\mathrm d\tau\le C_3$ | 固有时与坐标时可比 | weak_exits.tex:371-376 | 有限寿命即完整寿命 | 失去下界则端点寿命可能无穷 |
| $\mathcal S$ | 楔的唯一相对边界 | background.tex:113-121 | 首耗定位 | 若有别的边界则分支论证不闭合 |
| $q_0e^{-\kappa(u+v)}$ | 径向 lapse 因子 | background.tex:122-129 | 全部相对因子估计 | 改 $\kappa$ 定义则 $A_T$ 指数错位 |
| $D_0$ | $\operatorname{diag}(-\kappa/2,\kappa/2,0,0)$ | background.tex:249-260 | 线性转移的常系数模型 | 符号改变则归一化模板失配 |
| $e^{o(T)}$ | 约定含义 | background.tex:167-177 | 每一处次指数界 | 要求数据一致则第 15 节间隙不足 |
| $\sum_n\sup_{[n,n+1]}g_i$ | 有限可和 | background.tex:186-190 | 积分因子与足印界 | 发散则第 11 节一致 Lipschitz 失 |
| $\int_{-v}^{u}q\,\mathrm ds\le q_0/\kappa$ | 可积性 | background.tex:448-457 | 足印映射整片极化 | 失去则发射片尺寸无法固定 |
| $p=a\dot v>0$ | 状态动量正界 | background.tex:351-357,388-407 | 分支态与观测盒 | $p$ 趋零则截面坐标退化 |
| $c_2+u_2-u_*-3c_0$ | 薄片长度下界为正 | background.tex:488-502 | 插值常数一致性 | 非正则 $C^k$ 延拓常数不一致 |
| $A_T=e^{-\kappa T/4}$ | 波包振幅 | packet_preparation.tex:21-24 | 信号与误差全部比较 | 取 $e^{-\kappa T/3}$ 或 $e^{-\kappa T/8}$ 见第 6 节 |
| $\lambda=e^{\zeta T}$ | 频参数 | packet_preparation.tex:21-24 | 信号 $\lambda^2A_T$ 与余项 | $\zeta$ 次序颠倒则正幂失控 |
| $\eta<\min\{\eta_{\rm out},\alpha/4\}$ | 内部损失 | packet_preparation.tex:84-89 | 任意输出容差 | 取等则改进 bootstrap 不严格 |
| $\lVert h^B\rVert_{C^s}\le A_T\lambda^{s+3/2}e^{o(T)}$ | 光束基界 | packet_preparation.tex:171-197 | 外区传播与精度解耦 | 正幂若依赖精度则层级崩溃 |
| $P_c^*Q_c-Q_c^*P_c=2i\operatorname{Im}M_0$ | 虚 Hessian 正定保持 | packet_preparation.tex:198-206 | 复位置投影的次指数逆 | 失去则实 caustic 后界失效 |
| $\rho_T=(1-2\beta)t_T$ | 保护球半径 | packet_preparation.tex:232-241 | 精确贴合的因果阴影 | $\beta\to0$ 则首达间隙消失 |
| $X^s=H^{s+2}_1\oplus H^{s+1}_2$ | 约束求解空间 | packet_preparation.tex:251-267 | 尾巴保留与无矩条件 | 换成紧支撑闭包则电荷条件复活 |
| $\operatorname{Lip}\le1/2$ | 压缩常数 | packet_preparation.tex:302-307 | 修正存在与支撑保持 | 失效则约束修不出来 |
| $\int_0^{t_T+C_2}r_e\,\mathrm dt_e\le\eta'T$ | 到区率积分可任意小 | packet_preparation.tex:386-402 | 入口比较 $A_T^2e^{\eta T}$ | 否则第一层 bootstrap 不改进 |
| $\lvert\partial_{u,v}^{r}\partial_\theta^sZ\rvert\le A_T\lambda^{r-1}e^{o(T)}$ | 坐标增益 | packet_preparation.tex:452-457 | 信号线性余项 $O(A_T\lambda)$ | 缺 $-1$ 则坐标变化淹没信号 |
| $q^{-1}\partial_vk_b$ | 相对平移恒等式 | packet_preparation.tex:615-626 | 模板精度的核心 | 除以 $q$ 则整片相对界失 |
| $F_T=A_T^2e^{\eta T}$ | 输入缺陷与模板缺陷 | nonlinear_comparison.tex:196-202,packet_preparation.tex:698-701 | 低误差的二次性 | 若只线性则第 10 节三层不闭合 |
| $e_T=e^{-\alpha T/2}$ | 十阶 bootstrap | nonlinear_comparison.tex:172-180 | 三层结构第一层 | 取 $A_T$ 则改进不严格 |
| $Z_i=\sigma\lvert(\Delta Q_i,\Delta m_i)\rvert_0$ | 预乘 $\sigma=\sqrt q$ | nonlinear_comparison.tex:795-818 | 椭圆损失配对 | 去掉 $\sigma$ 则第 10 节闭合失 $\kappa T/2$ |
| $2\alpha(1-\vartheta)>(1+c_1)\alpha$ | 插值条件 | nonlinear_comparison.tex:1176-1186 | 主误差 $e^{-(1+c)\alpha T}$ | $\vartheta=(k+2)/M$ 过大则失败 |
| $\eta_0<\alpha/2$ | 模板改动界 | nonlinear_comparison.tex:1278-1284 | bootstrap 改进 | 取 $\alpha/2$ 则改进不成立 |
| $q\ge q_0e^{-2\kappa L_T}>0$ | 固定实验上正 lapse | nonlinear_comparison.tex:1286-1300 | 局部重启 | 无正下界则重启时间趋零 |
| $\lvert D(g_T)-D(g)\rvert>2A_T$ | 整片曲率信号 | attachment_signal.tex:178-187 | 第 14 节矛盾 | 只在一点成立则测度论证失效 |
| $-\tfrac12A_T\lambda^2\cos(\lambda v)(p_0)_{AB}$ | 领头项 | attachment_signal.tex:228-237 | 信号与误差的支配关系 | $\zeta$ 不小时二次项破坏支配 |
| $r_T=e^{-\kappa T}$ | 框架与体积缩放 | attachment_signal.tex:284-348 | 密度界与和乐代价 $r^{-1}$ | 缩放错则第 13 节指数全变 |
| $\lvert D\rvert\le Ce^{-13\kappa T/32}+Q_Te^{-\kappa T}$ | 和乐小性 | holonomy_category.tex:267-270 | 与 $A_T$ 冲突 | 指数若低于 $\kappa/4$ 则无矛盾 |
| $\nu_T(\mathcal N_T)\le Ce^{-\kappa T/16}$ | 例外参数测度 | holonomy_category.tex:263-265 | 第 14 节 $.05$ 扣除 | 超过 $.05$ 则 $.91$ 变负 |
| $\sup_{l\le17l_T}\lVert\partial_l^{18}H\rVert\le Q_T$ | 圈 jet 界 | holonomy_category.tex:172-184 | 有限尺度插值 | 阶或尺度不足则余项不可分离 |
| $0.91\mu_d(O)$ | 联合好参数逐层下界 | holonomy_category.tex:441-530 | 正测度交集 | 低于与 $I_T$ 占比乘积则矛盾不成 |
| $\lvert I_T\rvert>\tfrac12\lvert J_0\rvert$ | 周期占比 $2/3$ | holonomy_category.tex:521-530 | 在 $v$ 上积分 | 区间过短则正测度丢失 |
| Lemma 2.4 | 拓扑为 Baire | introduction.tex:116-118,companion-references.tex:85-86 | 贫集推出残余集 | 无 Baire 则无处稠密不构成结论 |
| Prop 4.4 | $W^{1,2}$ 给 $L^2$ 联络 | introduction.tex:89-93 | 弱联络解释 | 缺它则等价须本篇自证 |

表内共四十六行数据行，位置栏全部是本会话真实读到的 `文件:行`；行段形式（例如 `holonomy_category.tex:441-530`）表示我按该范围整段读过，无法逐行给单一行号的那些条目也一律用这种范围形式标出，没有凭记忆写行号。单元格中的绝对值一律用 $\lvert\cdot\rvert$、范数用 $\lVert\cdot\rVert$，避免出现与表格分隔符同形的字符。

