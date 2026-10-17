# D759 连续整数的联合 Dickman 律：自然密度、二元独立与序密度二分之一

## §0 这一单的素材盘面与我打算怎么用它

派单给的素材目录是 `preprints/The-joint-Dickman-law-for-consecutive-integers-September-24-2026`，标注字节 265783，属于厚档，所以我的取法定了：先量每个分文件的字节，再按窗口取，绝不把整份读进上下文。目录盘面是 `README.md`(608 B)、`build/`、`paper.pdf`(578632 B)、`typst/`；PDF 按规格不碰，`typst/` 分片不作来源，正文素材只从 `build/` 下的 `.tex` 取。

`build/` 下的分文件与字节数（我实测的排序）：`sections/arithmetic.tex` 38497、`sections/kernel.tex` 34788、`sections/amplification.tex` 30795、`sections/moments.tex` 27762、`sections/labels.tex` 27589、`sections/graph.tex` 21198、`sections/channels.tex` 18193、`sections/conclusion.tex` 17521、`sections/sampling.tex` 17340、`sections/introduction.tex` 16086、`sections/distribution.tex` 13342，加上 `preamble.tex` 1603、`main.tex` 1069。装配顺序在 `main.tex:17--27`：introduction、labels、arithmetic、amplification、graph、moments、channels、kernel、sampling、conclusion、distribution。最后一个是收口的分布节，这个装配顺序本身透露了作者的写法：先把全部技术零件按依赖排完，再把最像定理的两行推回去。

记号约定我按素材的写法还原成标准形式（`preamble.tex:21--33`）：期望写 $\mathbb{E}$、概率写 $\mathbb{P}$、示性函数写 $\mathbf{1}$、自然数集 $\mathbb{N}$、实数 $\mathbb{R}$、复数 $\mathbb{C}$、有限化整数环 $\widehat{\mathbb{Z}}$、最大素因子写 $P^+(n)$ 并约定 $P^+(1)=1$，另有 $\operatorname{supp}$、$\operatorname{Var}$、$\operatorname{sgn}$ 三个算子。方程按节编号，所以我引用素材里的式子只能给 `文件:行`，不能给编号。

主定理的盘面（`introduction.tex:19--29`）：对每对固定的 $a,b\in(0,1)$，

\[
 \lim_{X\to\infty}\frac1X
 \#\{2\leq n\leq X: P^+(n)\leq n^a,\ P^+(n+1)\leq n^b\}
 =\rho(1/a)\rho(1/b),
\]

极限沿全部实数 $X$ 取，计数不带权。推论在 `introduction.tex:43--50`：$\frac1X\#\{2\le n\le X: P^+(n)<P^+(n+1)\}\to\frac12$，反向序同密度。摘要在 `main.tex:9--14` 说这是把 Erdős--Pomerance 的联合 Dickman 猜想肯定地解决了。

登记两条：
- 素材目录：preprints/The-joint-Dickman-law-for-consecutive-integers-September-24-2026
- 队列位置：其他队列第 484 行号

## §1 初始动机：一个已经知道的单变量律，与一条我一开始不信的二元命题

我的出发点跟所有人一样是那个单变量的经典结论。Dickman 函数 $\rho$ 由 $[\![0,\infty)\![)$ 上的延迟微分方程确定：

\[
 \rho(u)=1\quad(0\le u\le 1),\qquad u\rho'(u)=-\rho(u-1)\quad(u>1),
\]

de Bruijn 一系的理论给出，固定 $0<a\le 1$ 时

\[
 \frac1X\#\{n\le X: P^+(n)\le X^a\}\longrightarrow \rho(1/a).
\]

于是我手里有一个一元的极限分布：把 $\log P^+(n)/\log n$ 当成 $[0,1]$ 上的随机变量，它的极限分布函数是 $t\mapsto\rho(1/t)$（补上 $t\le 0$ 与 $t\ge 1$ 的分段定义就成真的分布函数）。这在我读到的素材里是 `distribution.tex:163--173` 的分段写法 $D(t)$。

现在把两个变量并排：$n$ 与 $n+1$。它们之间有一条最强的算术约束，$\gcd(n,n+1)=1$，即二者没有任何公共素因子。我的第一反应是这种约束一定会在最大素因子尺度上留下痕迹。设 $U_n=\log P^+(n)/\log n$、$V_n=\log P^+(n+1)/\log n$（`distribution.tex:266--269` 就是这个定义）。直觉上有两类互相拉扯的效应。

拉扯的第一侧：互素让 $n$ 与 $n+1$ 的素因子集近乎不相交，所以"$n$ 的全部大素因子都不许出现"这一条件对 $n+1$ 毫无帮助，甚至略微收紧了它的可用素数集，因为它排除了 $n$ 用掉的那些模类；这会把联合密度往下压，让乘积律的下界难证。

拉扯的第二侧：光滑性事件本身在尺度上是"薄"的。$\{m\le x: P^+(m)\le x^a\}$ 的规模是 $x\rho(1/a)$，而 $P^+(m)$ 由最大的那一个素因子主导；当 $a$ 接近 $1$ 时 $\rho(1/a)$ 接近 $1$，几乎没约束；当 $a$ 小（例如 $a=1/2$）时 $\rho(2)\approx 1-\log 2\approx 0.306$，约束才真正起作用。互素条件对"哪一个素数是最大者"这种粗粒度的问题应该没有多少发言权。所以乘积律也不是不可能。

Erdős 与 Pomerance 1978 年的原始结论在 `introduction.tex:58--64`：两种序各有正的下自然密度，显式下界 $0.0099$；并且对每个 $\varepsilon>0$ 存在 $\delta>0$ 使满足 $X^{-\delta}<P^+(n)/P^+(n+1)<X^{\delta}$ 的 $n<X$ 少于 $\varepsilon X$。他们给出的猜想版本是"两种序的自然密度都存在且都等于 $\frac12$"。改进的数值链我记得很清楚，素材 `introduction.tex:65--72` 列了：de la Bretèche--Pomerance--Tenenbaum 的 $0.05544$，同节记录的 Fouvry 观察给 $0.05866$，Wang 的 $0.1063$ 与 $0.1356$，Lü--Wang 的 $0.2017$，Yang 2026 预印本对两种序给 $0.280$。这条链的性质要注意：全是下密度的下界，没有一条断言密度存在。

于是我的初始动机分三层：第一层是二元律本身；第二层是"自然密度"这个拓扑（相对数密度 $1/\log X$ 加权而言难得多）；第三层是序密度 $\frac12$ 到底是二元律的推论还是独立的难题。素材 `introduction.tex:52--54` 与 `distribution.tex:296--314` 把第三层解决得很干净：极限边缘分布连续，所以乘积测度给对角线零质量，交换性给两侧各 $\frac12$，全程不需要任何定量的分离估计。这一层的答案对我后面所有取舍都有影响，所以我先记下来。

## §2 我先试的三条路线，以及它们各自的死法

这三条路线里第一条和第三条是我按论证结构反推出来的必然尝试（素材不会写它没做的尝试，凡属反推我在此标注 [推测]）；第二条有素材里的文献行作凭。

**路线一：把对数密度的结论 Tauber 提升到自然密度。** [推测] 这是最省力的尝试：已知 Teräväinen 在 $1/n$ 权、$\log X$ 归一化下有乘积律（`introduction.tex:75--79`），而 $1/n$ 权把质量集中在 $n$ 小的那端，去掉权重就是把一个区间上的平均推成另一个区间上的平均。标准做法要单调性：对 $A(X)=\#\{n\le X:\cdot\}$ 这种量，加权收敛加单调（或至少单侧可控制）才推得出普通收敛。这里指示函数 $n\mapsto\mathbf{1}(P^+(n)\le X^a)$ 完全不单调，它在 $n$ 为素数时是 $1$，在 $n$ 有一个大素因子时是 $0$，逐点跳变，$X$ 变化时阈值 $X^a$ 自己也在动。更硬的一条：Tao--Teräväinen 的定量结果（`introduction.tex:91--94`）只在一个对数密度为零的例外尺度集外成立。例外集测度零加权重 $1/n$ 意味着例外尺度可以集中在 $[X,X^{1+\eta}]$ 这种对数很短的带里而不影响对数密度，但恰恰会影响沿全部实 $X$ 的自然密度极限。也就是说，我想要的"每个充分大的尺度都成立"与"几乎所有尺度成立"之间差的正是这种窄带。这条路我只能走到"改进误差项"的位置，走不到极限存在性。

**路线二：条件路线，借光滑数的 Elliott--Halberstam 型分布水平。** [推测] Wang 在光滑数版本 Elliott--Halberstam 猜想下证过普通平均的联合律（`introduction.tex:86--87`）。这条路的形态我是清楚的：要控制

\[
 \sum_{q\le Q}\max_{\substack{a\\(a,q)=1}}
 \left|\#\{m\le x: P^+(m)\le y,\ m\equiv a\pmod q\}
 -\frac{1}{\varphi(q)}\#\{m\le x: P^+(m)\le y,\ (m,q)=1\}\right|,
\]

并且 $Q$ 要超过 $x^{1/2}$。相邻整数的条件 $n+1\equiv 0$ 会把 $n$ 的模类约束搬到 $q$ 上，于是模 $q$ 的同时约束 $n\equiv a$、$n\equiv -1$ 出现，$Q$ 的有效范围还要再缩。素材 `arithmetic.tex:423--658` 那一整节只用了上界筛（区间筛、矩形筛、随机根筛）与 Selberg--Delange 型局部系数估计，从不声称超越 $1/2$ 的分布水平，这印证了我的判断：无条件地想要这条路的输入，等价于想要一个当时不存在、而且大概率有奇偶性障碍的估计。

**路线三：直接对二维光滑性事件做渐近筛。** [推测] 也就是指望

\[
 \sum_{\substack{n\le X\\ P^+(n)\le X^a\\ P^+(n+1)\le X^b}}1
 = X\rho(1/a)\rho(1/b)+o(X)
\]

由 Selberg 上界筛加组合恒等式直接吐出。这里失败的原因最有讲头，它也是全篇结构的真正起源。上界筛能给的是 $\le$ 方向；下界要穿过奇偶性障碍：筛函数在 $\mu^2$ 加权下对莫比乌斯函数的符号无差别，所以任何只依赖"有多少个小素因子整除"的筛法论证，无法区分"恰好两个素因子"与"恰好三个素因子"的那一类事件，而光滑性事件恰恰靠这种区分来定大小。GPY 型障碍在这里的具体形态是：我把 $n=am$ 与 $n+1=cl$ 的因子分解代入后，误差项里出现的对角与次对角贡献符号交替，筛法层面只能把它们当作绝对值处理，得到的就是上界。素材的处理方式在 `amplification.tex:622--700`：不再直接问那个一次和，是问一个二次能量，先证明它有一个正的、与尺度无关的下界 $d_0>0$，再证明同一个能量在迭代极限里趋于 $0$。也就是说，我把"下界难证"换成了"若下界为假则出现矛盾"，矛盾的两端分别是 `amplification.tex` 的正能量与 `conclusion.tex:217` 的主能量消失命题。

我在这三条路上浪费的时间主要体现在路线三：一直想把能量写成筛的平方，而没有先看它天然是一个图。

## §3 转折：从"证一个渐近式"改成"证一个剖面必须同时满足的两件事"

转折点有三步，按我读到的顺序写。

**第一步：事件换成特征函数。** 素材 `introduction.tex:104--120` 的做法是固定 $J\ge 2$，把 $(x^{1/J},x]$ 里的素数分箱成 $\mathcal B_{k,x}=(x^{k/J},x^{(k+1)/J}]$（$1\le k<J$），$\Omega_E(n)$ 记 $n$ 在 $E$ 中素因子的个数（按重数），给一组单位复数相位 $\zeta_k$，令

\[
 f_x(n)=\prod_{k=1}^{J-1}\zeta_k^{\Omega_{\mathcal B_{k,x}}(n)}.
\]

再取第二组任意相位定义 $g_x$，令 $F_x=f_x-\mu$，$\mu$ 是 $f_x$ 的极限均值。有限傅里叶反演（`distribution.tex:31--41`）说：因为每个坐标落在 $\{0,\dots,J\}$（每个被计的素因子都超过 $x^{1/J}$），按模 $J+1$ 约化在计数向量集上是单射，取 $\zeta_0=\exp(2\pi i/(J+1))$，对 $\boldsymbol r\in\{0,\dots,J\}^{J-1}$ 有恒等式

\[
 \mathbf 1_{\{\boldsymbol b=\boldsymbol r\}}
 =\frac1{(J+1)^{J-1}}\sum_{\boldsymbol h\in\{0,\dots,J\}^{J-1}}
   \zeta_0^{\,\boldsymbol h\cdot(\boldsymbol b-\boldsymbol r)},
\]

于是每个分箱事件都是有限多个特征的线性组合。要证联合律，只剩证混合去相关

\[
 \frac1x\sum_{n<x}\overline{g_x(n)}\,F_x(n+1)\longrightarrow 0.
\]

这里最妙的是 $\boldsymbol\zeta$ 与第二组相位是各自独立的选取：两个相位向量可以不同，所以这个式子一旦对全部相位组成立，就把两个计数向量的独立性榨出来了。这是我读到的第一个"结构性"的好处：问题被搬到了混合相关，并非双边相关。

**第二步：性质清单决定了后面所有构造。** `introduction.tex:122--146` 列出 $F_x$ 与 $g_x$ 的两条性质，它们连接证明的首尾。其一是固定倍数的不变性：任何固定正整数 $u$ 的全部素因子在 $x$ 足够大时都落在分箱之下，所以 $F_x(un)=F_x(n)$、$g_x(un)=g_x(n)$。其二是短区间取消：以 $B$ 为辅助参数、$T=T(B)\to\infty$ 为增长的移位尺度，取素数集 $P_B$ 满足 $\min P_B\to\infty$，定义

\[
 G_{B,v}(n)=\prod_{\substack{p\in P_B\\ p\mid n}}\frac{1+p^{-v/B}}{2},\qquad v\ge 0,
\]

则对任意含 $L_B\to\infty$ 个连续整数移位的区间 $I_B$、固定 $0<s_0<s_1$、正整数 $D$、模 $D$ 的剩余类 $r$、$v\ge 0$，有

\[
 \lim_{B\to\infty}\limsup_{x\to\infty}
 \frac1{Tx}\sum_{s_0Tx\le n\le s_1Tx}
 \left|\frac1{L_B}\sum_{\substack{i\in I_B\\ i\equiv r\pmod D}}
   F_x(n+i)G_{B,v}(n+i)\right|^2=0.
\]

这两条性质的顺序值得记：不变性说明放大器可以只由"大于一切分箱边界的素数"构成，短区间取消说明真正可证的只有平方平均。素材 `introduction.tex:148--158` 补了它们的技术接口：$F_x$ 本身不乘性，但在 $n=O_B(x)$ 的范围内分箱计数只取有限多个值，所以能用一族固定的、实的、非负的乘性函数去插值；剩余类条件由迪利克雷特征解出，实的主部用 Matomäki--Radziwiłł 的短区间定理比较到长平均（中心化组合消失），非主部的扭由 Matomäki--Radziwiłł--Tao 的复数定理控制。

**第三步：反证骨架。** 假设混合相关在某个尺度列上不趋于零。取子列得到一个定义在 $(0,\infty)\times\widehat{\mathbb Z}$ 上的有界剖面 $W(t,w)$，它 Against 每个固定的紧支撑连续检验 $\Phi(t,w)$ 的积分，是加权混合平均 $\frac1x\sum\Phi(n/x,n)\overline{g_x(n)}F_x(n+1)$ 的子列极限（这里 $n$ 在第二个变量里通过它的全体模类进入 $\widehat{\mathbb Z}$，$dt$ 是勒贝格测度、$dw$ 是哈尔测度）。可以挑一个固定的非负紧支撑光滑截断 $\phi$ 使 $\int\phi(t)W(t,w)\,dt\,dw\ne 0$。于是要害变成：能否为每个 $B$ 造出一个非负、$L^2$ 有界、哈尔均值不小于某固定 $d_0>0$、且对每个固定剩余坐标独立的放大器 $D_B$，使得 $\int\phi(t)W(t,w)D_B(w)\,dt\,dw$ 的绝对值在 $B\to\infty$ 时有一致的正下界。

这一步是我自己的取舍点。我把全部力气放在"放大器必须与每个固定坐标独立"这条要求上，因为它决定了后面的换元：一旦 $D_B(n)$ 只由高于某个趋于无穷的截断的素数决定，$\Phi(t,w)=\phi(t)D_B(w)$ 就是合法的剖面检验，子列极限给出

\[
 \lim_{x\to\infty}\frac1x\sum_{n\ge 1}
 \phi(n/x)\overline{g_x(n)}F_x(n+1)D_B(n)
 =\int\phi(t)W(t,w)D_B(w)\,dt\,dw,
\]

右端有正下界；而左端在 `amplification.tex:564--620` 与 `conclusion.tex:217`--`sampling.tex:49` 的链条上必须趋于零。两个方向同时成立就是矛盾。我原先以为要证的是一个渐近式，实际证的是"存在一个既正又零的数"不可能，整个论文的分节顺序都由这个改口决定。

## §4 标签一节：我先要一个"极限存在且不依赖区间"的单变量事实

素材把这一节放在引言之后（`main.tex:18`），位置本身就说明它是全篇的地基。分箱定义在 `labels.tex:13--16`：固定整数 $J\ge2$，对 $1\le k<J$ 取 $\mathcal B_{k,x}=(x^{k/J},x^{(k+1)/J}]$；$\Omega_E(n)$ 记 $n$ 落在素数集 $E$ 中的素因子个数（按重数计，`labels.tex:17--18`）。两条标签由两组相位给出：$|\zeta_k|=1$、$|\xi_k|=1$，且 `labels.tex:18--21` 明写两组之间不要任何关系。完全乘性的定义在 `labels.tex:22--30`：素数 $p$ 落在第 $k$ 个箱时 $f_x(p)=\zeta_k$，落在所有箱之外时 $f_x(p)=1$，于是

\[
 f_x(n)=\prod_{k=1}^{J-1}\zeta_k^{\Omega_{\mathcal B_{k,x}}(n)},\qquad
 g_x(n)=\prod_{k=1}^{J-1}\xi_k^{\Omega_{\mathcal B_{k,x}}(n)},
\]

两者模恒为 $1$（`labels.tex:35`）。

我读到这里先抓住的是 `labels.tex:36--39` 那句看起来无关紧要的计数：对每个固定 $C>0$，只要 $x$ 相对 $C,J$ 足够大，任何 $n\le Cx$ 在全部箱的并里至多有 $J$ 个素因子。理由是 $J+1$ 个这样的素因子乘起来超过 $(x^{1/J})^{J+1}=x^{1+1/J}>Cx$。这句话决定了后面所有"有限性"论证的形状：计数向量 $\boldsymbol b_x(n)=(\Omega_{\mathcal B_{k,x}}(n))_{1\le k<J}$ 的值域被压进 $\{0,\dots,J\}^{J-1}$ 这个与 $x$ 无关的有限集，所以示性函数可以用有限个乘性函数插值，剖面的测试函数类可以取紧支撑连续的，收敛的论证可以走 $L^2$ 逼近，并非逐点。

`labels.tex:41--60` 的主干是我原本最难接受的：计数向量在 $\alpha x<n\le\beta x$、$n\equiv a\pmod q$ 的整数中归一化后收敛，且极限只依赖 $J$，与 $\alpha,\beta,q,a$ 无关；于是存在 $|\mu|\le1$ 使

\[
 \lim_{x\to\infty}\frac{q}{(\beta-\alpha)x}
 \sum_{\substack{\alpha x<n\le\beta x\\ n\equiv a\pmod q}}f_x(n)=\mu,
\]

$g_x$ 同理给 $\mu_g=\mu_g(J,(\xi_k))$。

[推测] 素材在 `labels.tex:61--200` 用了一百多行来证它，我没有逐行读完，这里给的是我自己按位点模型推的还原，用来核对"极限只依赖 $J$"这句话的分量。第 $k$ 个箱的素数倒数和是

\[
 \sum_{p\in\mathcal B_{k,x}}\frac1p
 =\log\log x^{(k+1)/J}-\log\log x^{k/J}+o(1)
 =\log\frac{(k+1)/J}{k/J}+o(1)
 =\log\Bigl(1+\frac1k\Bigr)+o(1),
\]

而 $p\mid n$ 在整段区间上的概率恰是 $1/p$，箱与箱互不相交、每个 $n$ 至多贡献 $J$ 次，所以按库比利乌斯式的独立位点近似，第 $k$ 箱的重数趋于参数 $\lambda_k=\log(1+1/k)$ 的泊松分布，各箱渐近独立。于是极限均值应是

\[
 \mu=\prod_{k=1}^{J-1}\exp\Bigl(-\lambda_k+\zeta_k\lambda_k\Bigr)
 =\prod_{k=1}^{J-1}\Bigl(1+\frac1k\Bigr)^{\zeta_k-1},
\]

模长 $|\mu|=\prod_k(1+1/k)^{\operatorname{Re}\zeta_k-1}\le1$，因为 $\operatorname{Re}\zeta_k\le1$。这恰好解释了 `labels.tex:51--52` 只写 $|\mu|\le1$ 而不给具体值：一旦 $\boldsymbol\zeta\ne\mathbf 1$，$\mu$ 就严格小于 $1$；而 $\prod_{k=1}^{J-1}(1+1/k)=J$ 这一望远镜乘积也说明，当所有 $\zeta_k=1$ 时 $\mu=1$，即全 $1$ 特征不参与去相关，这与"$F_x=f_x-\mu$ 的中心化"完全一致。另外 $\lambda_k$ 只与 $k$ 有关、$\sum_k\lambda_k=\log J+o(1)$ 与区间端点无关，这就是"极限不依赖 $\alpha,\beta$"在我这里的直观来源；剩余类 $q,a$ 只改变每个位点的概率至多 $O(1/p^2)$ 量级（模 $q$ 条件下 $\Pr(p\mid n)$ 与 $1/p$ 的差在 $(p,q)=1$ 时是 $O(1/p^2)$ 级别），而 $\sum_p p^{-2}$ 收敛，所以影响可吸收。这一段是我的还原，不是素材的原文结构。

同一个位点视角还给出 `labels.tex:226--243` 里 $G_{B,v}$ 的意义。给定辅助参数 $B$、有限素数集 $P_B$（$\min P_B\to\infty$）、$v\ge0$：

\[
 G_{B,v}(m)=\prod_{\substack{p\mid m\\ p\in P_B}}
 \Bigl(\frac12+\frac12 p^{-v/B}\Bigr),
\]

它是实的、非负的、以 $1$ 为界的乘性函数，固定 $B$ 时周期整除 $\prod_{p\in P_B}p$。令 $S_B(m)=\{p\in P_B:p\mid m\}$，再把 $S_B(m)$ 中每个素数以概率 $\frac12$ 独立保留、乘起来得到随机乘积 $b$（空乘积记为 $1$），独立性立刻给出

\[
 G_{B,v}(m)=\mathbb E_{\mathrm{split}}
 \Bigl[\exp\Bigl(-\frac{v\log b}{B}\Bigr)\Bigr].
\]

我之所以在意这条恒等式，是因为它是全篇"公平拆分"语言的第一次出现：后面所有把算术量换成模型量的步骤，都是把某个乘积写成 $\mathbb E_{\mathrm{split}}[\cdot]$，而这里的 $v$ 就是拉普拉斯型参数。端的整数点处，$G_{B,v}$ 正是 `introduction.tex:261--264` 里端点特征 $\mathbb E_{\mathrm{split}}[e^{-v\log b/B}\mid S]=\prod_{p\in S}\frac{1+p^{-v/B}}2$ 的取值。

## §5 混合去相关命题与两条短区间输入：可证的东西长什么样

`labels.tex:207--216` 给出全篇唯一的分析命题：对每个固定 $J\ge2$ 与任意两组单位模相位，

\[
 \lim_{x\to\infty}\frac1x\sum_{1\le n<x}\overline{g_x(n)}\,F_x(n+1)=0,
 \qquad F_x=f_x-\mu,
\]

极限沿全体整数尺度取。`labels.tex:218--221` 立刻交代写法：假设该平均沿某个数列保持离零的固定距离，推出矛盾，而短平均输入要到 `conclusion.tex` 的最后一步才用。

矛盾论证需要的输入在 `labels.tex:245--262`：设 $T=T(B)\to\infty$、$L_B\to\infty$、$a_B$ 任意整数，固定 $0<s_0<s_1<\infty$、正整数 $D$、剩余 $r\pmod D$、$v\ge0$，则

\[
 \lim_{B\to\infty}\limsup_{x\to\infty}
 \frac1{Tx}\sum_{s_0Tx\le n\le s_1Tx}
 \Bigl|\frac1{L_B}\sum_{i=a_B+1}^{a_B+L_B}
 \mathbf 1_{i\equiv r\ (\mathrm D)}F_x(n+i)G_{B,v}(n+i)\Bigr|^2=0.
\]

`labels.tex:259--261` 补了两句技术约束：固定 $B$ 时 $x$ 足够大后所有自变量为正；内和上限沿任何 $x\to\infty$ 的数列取都同结论。这两句是我判断"极限次序不可交换"的依据：整个证明里 $x\to\infty$ 必须先于 $B\to\infty$，反过来则 $T=T(B)$ 会与 $x$ 纠缠。

这里我要老实记下自己的一个误判。[推测] 我起初以为这个平方平均是"技术上更强的替代品"，作者本来想证逐点消失但证不动。读完 `labels.tex:264--273` 才看清：平方是必需的，因为可用的公开定理本身就是均方形式。素材定义

\[
 \mathcal A_Hg(z)=\frac1H\sum_{z<n\le z+H}g(n),\qquad
 \mathcal L_Xg=\frac1X\sum_{X<n\le2X}g(n),
\]

并把与 $n^{it}$ 的相似半度量记作（`labels.tex:284--289`）

\[
 \mathbb D(g,n^{it};X)^2=\sum_{p\le X}\frac{1-\operatorname{Re}(g(p)p^{-it})}{p},
 \qquad M(g;X)=\inf_{|t|\le X}\mathbb D(g,n^{it};X)^2.
\]

两条输入分别是 `labels.tex:294--303` 的实函数比较：存在 $r(H)\to0$，使每个实乘性 $g:\mathbb N\to[-1,1]$ 与 $2\le H\le X$ 满足

\[
 \frac1X\int_X^{2X}\bigl|\mathcal A_Hg(z)-\mathcal L_Xg\bigr|^2\,dz\le r(H),
\]

以及 `labels.tex:310--321` 的复函数短平均：$|g|\le1$、$X\ge H\ge10$ 时

\[
 \frac1X\int_X^{2X}|\mathcal A_Hg(z)|^2\,dz
 \ll (1+M(g;X))e^{-M(g;X)}
 +\Bigl(\frac{\log\log H}{\log H}\Bigr)^2+(\log X)^{-1/50}.
\]

`labels.tex:305--308` 说明第一条来自 Matomäki--Radziwiłł 定理中关于例外集的一致估计，靠有界性过渡到均方，而其中含 $X$ 的项因 $X\ge H$ 可以被 $r(H)$ 吸收；`labels.tex:323--327` 说明第二条取自 Matomäki--Radziwiłł--Tao 附录定理的修订证明（该修订允许因子 $e^{-M}$，素材用更弱的 $(1+M)e^{-M}$ 以覆盖 $M<1$），并强调对我们而言只要 $\inf_{|t|\le X}\mathbb D^2$ 发散就够。这一段读下来我得到一个可操作的结论：全部力气要花在造出相似距离发散的乘性函数上，其余是机械的。

`labels.tex:329--336` 处理整数起点：$|g|\le1$ 时 $|\mathcal A_Hg(z)-\mathcal A_Hg(\lfloor z\rfloor)|\le 2/H$，逐单位区间积分即得，端点代价 $O(1/X)$，短区间端点移动有界量代价 $O(1/H)$。这类"两个单位"的粗糙化在我自己的草稿里一度被忽略，结果在 $L_B$ 与 $H$ 的关系上少了一个因子；素材把它写成三行引理，我就照此把 $H$ 取为 $L_B$ 的同量级。

`labels.tex:264--273` 与 `labels.tex:338--345` 给出了从 $F_x$ 到这两条定理的桥：$F_x$ 不乘性，但固定原点 $n$ 的剩余后，$i$ 上的同余变成对参数 $m=n+i$ 的固定剩余条件；用迪利克雷特征解该条件就把任务分成两半，主特征要把短平均和与长平均比较（长平均的中心化线性组合为零），非主特征要短平均自身小。固定非主特征的估计以 $J$、正常数 $c,C$、模 $q_\chi$ 的非主特征 $\chi$ 与有限素数集 $E$ 为参数，对每个 $x$ 处理一个以 $1$ 为界的乘性函数 $h_x$。[推测] 这一条（`labels.tex:340` 起）我要的输出是 $M(h_x\bar\chi;X)\to\infty$ 型的发散：分箱标签的相位是单位复数，与非主特征在多数素数上不共振，$\mathbb D$ 的求和被 $\sum_p(1-\operatorname{Re}(\cdot))/p$ 里的正项撑开。这正是为什么 `labels.tex:18--21` 坚持两组相位之间不要关系：一旦有关系，非主部就可能与某个特征对齐，$M$ 就不发散，复数定理会给出一个不能忽略的常数项。

于是 §3 末的反证骨架里那句"短区间取消"有了精确形状：它是一个带权 $G_{B,v}$、带剩余条件 $\mathbf 1_{i\equiv r\ (D)}$、取平方、再对 $n$ 在 $[s_0Tx,s_1Tx]$ 上做均方的量，而这个量在 $B\to\infty$、$x\to\infty$ 的迭代极限中为零。剩下要做的全在翻译：把能量写成这种量。

## §6 放大器一节：一个必须"正、有界、与每个固定坐标独立"的权重

`amplification.tex:11--25` 把继承下来的量摆好：保留剖面 $W$、截断 $\phi$（实、非负）与

\[
 \beta_*=\Bigl|\int_{(0,\infty)\times\widehat{\mathbb Z}}\phi(t)W(t,w)\,dt\,dw\Bigr|>0,
\]

再固定两个实、非负、非零的 $C_c^\infty((1,2))$ 函数 $\rho_0,\psi$；正则性栅格与其容差 $\tau$ 全程固定；$C_*$ 是 $B\to\infty$ 时已固定的常数；下面每一个 $x$ 极限先在 `labels.tex` 选好的坏子列上取。我特别在意"全程固定"这四个字：它意味着 $\rho_0,\psi$ 的形状不能随 $B$ 动，所以后面所有 $B$ 依赖都只能通过 $\log c/B$、$a/(Tc)$ 这类归一化变量进来了。

放大器的定义在 `amplification.tex:29--44`。对整数 $n\ge1$ 考虑两个因子分解 $n=am$、$n+1=cl$，要求 $\log c/B$ 落在 $\rho_0$ 的支撑里、$a/(Tc)$ 落在 $\psi$ 的支撑里，权重 $A(a),A(c)$ 加在被选出的因子上、$K(m),K(l)$ 加在两个商上，然后在有限化整数上定义归一化除数和

\[
 D_B(w)=\frac1B\sum_{\substack{a\mid w\\ c\mid w+1}}
 A(a)K(w/a)A(c)K((w+1)/c)
 \rho_0\Bigl(\frac{\log c}{B}\Bigr)\psi\Bigl(\frac{a}{Tc}\Bigr),
 \qquad w\in\widehat{\mathbb Z}.
\]

`amplification.tex:45--48` 处理了我在第一遍读时卡住的地方：在 $\widehat{\mathbb Z}$ 里"$a$ 整除"意思是属于乘以 $a$ 的像集，而正整数在 $\widehat{\mathbb Z}$ 上的乘法是单射，所以商 $w/a$、$(w+1)/c$ 是良定义的。`amplification.tex:50--57` 给出有限性：固定 $B$ 时系数支撑有限，$e^B<c<e^{2B}$、$Tc<a<2Tc$，每个系数小于 $e^{4B}$，故非零权重的素因子全在 $\mathcal P$ 里；模 $\prod_{p\in\mathcal P}p^2$ 就足以决定 $D_B$，因为系数是无平方的，而判断 $p$ 是否整除某个商至多需要模 $p^2$ 的剩余。于是 $D_B$ 是有限多个高素数剩余的函数，这条性质就是它与每个固定剩余坐标独立的原因。

加权相关的记号在 `amplification.tex:59--72`：

\[
 \frac{I_{1,x}}{B}=\frac1x\sum_{n\ge1}\phi(n/x)\overline{g_x(n)}F_x(n+1)D_B(n),
 \qquad
 \lim_{x\to\infty}\frac{I_{1,x}}{B}
 =\int\phi(t)W(t,w)D_B(w)\,dt\,dw,
\]

第二个式子成立是因为固定 $B$ 时 $\phi(t)D_B(w)$ 是紧支撑连续的剖面检验。

归一化因子 $\frac1B$ 的理由在 `amplification.tex:74--82`：每个有限素数集在被当作公平拆分求和时贡献一个因子 $B$；两个独立乘积（律为 $\nu_{1/2}$）的一阶矩计算会给出"光滑的尺寸与比值期望是一个正常数除以 $B$"，于是两个内部的 $B$ 与外部的除以 $B$ 合起来在模型里给出有界的正均值。我觉得这是全节最容易被误读的一步：$\frac1B$ 属于规范化选择，它的必要性来自 $\nu_{1/2}$ 的分布函数在尺度 $B$ 上的斜率量级。

目标命题在 `amplification.tex:86--96`：存在 $C_0>0$、$d_0>0$，使每个固定 $C_*\ge C_0$ 与充分大的 $B$ 有 $\|D_B\|_{L^2(\widehat{\mathbb Z})}\ll_{C_*}1$、$\int_{\widehat{\mathbb Z}}D_B(w)\,dw\ge d_0$，并且 $d_0$ 与 $C_*$、$B$ 都无关；另有与 $C_*$ 无关的 $\int D_B\ll1$。

比较模型在 `amplification.tex:103--121`：取 $S_1,S_2$ 为 $\mathcal P$ 的两个独立随机子集，每个素数 $p$ 以概率 $1/p$ 独立入选；给定这两个集合后，每个 $S_\nu$ 再用独立公平硬币拆成系数子集 $\mathcal C_\nu$ 与余下子集 $\mathcal R_\nu$，写

\[
 a=\prod_{p\in\mathcal C_1}p,\qquad c=\prod_{p\in\mathcal C_2}p,
\]

空乘积为 $1$，并定义

\[
 \widetilde D_B(S_1,S_2)
 =B\,\mathbb E_{\mathrm{split}}
 \Bigl[\rho_0\Bigl(\frac{\log c}{B}\Bigr)\psi\Bigl(\frac{a}{Tc}\Bigr)
 \mathbf 1_{\text{四个子集全部正则}}\ \Big|\ S_1,S_2\Bigr],
\]

逐点有 $0\le\widetilde D_B\ll B$。`amplification.tex:123--130` 的比较引理说：对每个固定 $C_*\ge0$，当 $B\to\infty$ 时 $\int_{\widehat{\mathbb Z}}D_B(w)^r\,dw=\mathbb E\,\widetilde D_B^r+o(1)$，$r=1,2$。也就是说哈尔矩与模型矩在二阶以内一致，之后所有计算都可以搬到概率语言里。

一阶矩的计算在 `amplification.tex:300--325`。不加正则性示性时 $a,c$ 独立、各自的律是 $\nu_{1/2}$；记 $f_B=f_{1/2,B}$，在紧的正对数区间上 $f(s)=c_{1/2}s^{-1/2}$。对 $\rho_0$ 支撑上固定的 $s=\log c/B$，分部求和给

\[
 B\,\mathbb E_a\,\psi\Bigl(\frac{a}{Tc}\Bigr)
 =\int_0^\infty\psi(r)\,
 f_B\Bigl(s+\frac{\log T+\log r}{B}\Bigr)\frac{dr}{r}+o(1).
\]

`amplification.tex:313--317` 交代了这里被忽略的误差有多大：$\log a/B$ 的相关区间长度是 $O(1/B)$，其绝对分布函数误差是 $O(B^{-80})$，对总变差有界的光滑窗口做分部求和，在乘回 $B$ 之前只剩 $o(1/B)$。再加上 $\log T/B\to0$ 与 $f_B$ 及其导数在这些紧区间上的一致收敛，对 $c$ 再用一次同样的近似，未截断的一阶矩趋于

\[
 d_*=\Bigl(\int_0^\infty\rho_0(s)f(s)^2\,ds\Bigr)
 \Bigl(\int_0^\infty\psi(r)\,\frac{dr}{r}\Bigr)>0.
\]

这里 $\int_0^\infty\psi(r)\frac{dr}{r}$ 是 Mellin 型对数积分，$\psi$ 支撑在 $(1,2)$ 所以它有限且为正；$f(s)^2=c_{1/2}^2/s$ 让 $\rho_0$ 的支撑（$s\in(1,2)$）保证另一个因子也正。同一计算还给出尺寸与比值事件 $\mathcal H_1$ 在独立系数乘积律下的概率是 $O(1/B)$。

正则性带来的损耗在 `amplification.tex:331--365`，我把它当作全节最"值钱"的一段来读。做法是用 $O(B)$ 个二进尺寸方框 $c\asymp X$、$a\asymp TX$ 盖住系数支撑；由位点乘积概率界，$(a,c)$ 处的联合乘积概率不超过 $C\frac{A_0(a)A_0(c)}{B^2ac}$，而方框内 $ac\asymp TX^2$；独立系数版本的加权和（其中一个系数不正则时）被 $O\bigl(TX^2\{o(1)+e^{-c_3C_*}\}\bigr)$ 控制；除掉调和分母、对 $O(B)$ 个方框求和、再乘回外面的 $B$，系数正则性的净损耗就是 $o(1)+O(e^{-c_3C_*})$。条件化的那一步我读得很慢：给定某位点上被选入系数的子集后，该系数未选中的素数上的其余示性变量仍独立，概率变成

\[
 \frac{1/(2p)}{1-1/(2p)}=\frac1{2p-1},
\]

而选中系数素数的倒数和在系数支撑上一致地是 $O(B/P_0)$（因其乘积的对数是 $O(B)$），于是 `arithmetic` 一节的独立示性正则性估计在挖掉这些素数后一致适用，余下子集不正则的条件概率同样是 $o(1)+O(e^{-c_3C_*})$。合起来得到 $\mathbb E\widetilde D_B=d_*+O(e^{-c_3C_*})+o(1)$，误差中的指数项常数不含 $C_*$，所以把 $C_0$ 取大、固定 $d_0<d_*/2$ 就拿到正下界（`amplification.tex:367--378`）。`amplification.tex:374--378` 补了两句我原本担心的对称问题：上界 $\int D_B\ll1$ 靠删掉全部正则性示性即得，而且下界也可以看出"增大 $C_*$ 只放松尾部截断"，所以 $d_0$ 真的与 $C_*$ 无关。

二阶矩的路线在 `amplification.tex:380--430`。比较每个位点素数的两次指派：若有改变，其最大对数落在互不相交的区间 $(Y/2,Y]$，$Y=2^i\log P_0$、$1\le i\le i_{\max}$，其中 $4B\le2^{i_{\max}}\log P_0<8B$；记 $\mathcal A_Y$ 为"这是最大的被改动区间"这一事件。由于联合律与 $\mathcal E_1\cap\mathcal E_2$ 在交换两次拆分下不变，可得定向不等式

\[
 \Prob(\mathcal E_1\cap\mathcal E_2\cap\mathcal A_Y)
 \le2\sum_{\nu=1}^2
 \Prob(\mathcal E_1\cap\mathcal E_2\cap\mathcal A_Y\cap\mathcal U_{Y,\nu}),
\]

其中 $\mathcal U_{Y,\nu}$ 要求位点 $\nu$ 上至少有一个对数落在 $(Y/2,Y]$ 的素数从第一个余下子集移到第二个系数子集。上界的做法是把四个第一次拆分的集合耦合到四个互相独立的素数过程（每个入选概率 $1/(2p)$）：同一位点上两类原本互斥，所以逐素数耦合代价 $O(1/p^2)$，总代价 $O(1/P_0)$；在成功且无碰撞的耦合上这恰好重建原来的第二次拆分，例外情形下同一素数出现两次，仍赋独立硬币并按重数定义系数乘积。`amplification.tex:419--423` 算了这个偷懒的价钱：即使把耦合误差在全部 $O(\log B)$ 个区间里逐个单独计账，乘上 $B^2$ 后仍是 $O(B^2\log B/P_0)=o(1)$，而且不需要"给定稀有的系数值后的一致耦合"这种强断言。我看到这句话时松了一口气：这正是我自己写这类论证时最容易多要的东西。

剖面保持在 `amplification.tex:566--606`：令 $H(t,w)=\phi(t)W(t,w)$，则

\[
 \int H\,D_B-\Bigl(\int H\Bigr)\Bigl(\int D_B\Bigr)\longrightarrow0\qquad(B\to\infty).
\]

证明是标准的两步：$H$ 有界且 $t$ 方向支撑固定，故平方可积；对 $t$ 与有限剩余坐标 $w\bmod q$ 取条件期望能在 $L^2$ 里逼近 $H$，即对每个 $\varepsilon>0$ 有只依赖 $t$ 与 $w\bmod q$ 的 $H_q$ 使 $\|H-H_q\|_2<\varepsilon$ 且 $\int H_q=\int H$。充分大的 $B$ 下没有整除 $q$ 的素数落在 $\mathcal P$ 里，于是作为有限剩余函数的 $D_B$ 在哈尔测度下与 $w\bmod q$ 独立，故 $\int H_qD_B=(\int H)(\int D_B)$；再用柯西--施瓦茨与 $L^2$ 有界性，替换误差是 $O_{C_*}(\varepsilon)$，$\varepsilon$ 任意。结合 $\int D_B\ge d_0$ 与剖面极限，`amplification.tex:613--616` 给出下界

\[
 \liminf_{B\to\infty}\ \lim_{x\to\infty}\frac{|I_{1,x}|}{B}\ge d_0\beta_*,
\]

而且这个正的下界常数不含 $C_*$。

最后是能量。`amplification.tex:624--642` 用固定倍数不变性把 $g_x$ 搬出内和：$c\mid am+1$ 时记 $l_a=(am+1)/c$，固定 $B$ 时系数表有限，故 $x$ 足够大后 $g_x(am)=g_x(m)$ 对表上所有 $a$ 同时成立，展开得恒等式

\[
 I_{1,x}=\frac1x\sum_{c\ge1}\rho_0\Bigl(\frac{\log c}{B}\Bigr)A(c)
 \sum_{m\ge1}K(m)\overline{g_x(m)}
 \sum_{\substack{a\ge1\\ c\mid am+1}}
 A(a)K(l_a)\psi\Bigl(\frac{a}{Tc}\Bigr)
 \phi\Bigl(\frac{am}{x}\Bigr)F_x(am+1).
\]

`amplification.tex:674--696` 是柯西--施瓦茨的落地：取 $0<\alpha_\phi<\beta_\phi$ 包住 $\phi$ 的支撑、$u_-=\inf I_\psi$、$u_+=\sup I_\psi$，内和非零时

\[
 \frac{\alpha_\phi x}{u_+Tc}\le m\le\frac{\beta_\phi x}{u_-Tc}
\]

（记此区间 $\mathcal I_{c,x}$），于是

\[
 |I_{1,x}|^2\le V_{B,x}I_{2,x},\qquad
 V_{B,x}=\frac1x\sum_c\rho_0\Bigl(\frac{\log c}{B}\Bigr)A(c)
 \sum_{m\in\mathcal I_{c,x}}K(m),
\]

其中 $|g_x(m)|=1$ 提供单位因子，而且 `amplification.tex:695--696` 强调这里完全不需要 $F_x$ 的乘性。`amplification.tex:644--671` 把结论写成命题：存在与充分大固定 $C_*$ 无关的 $c_5>0$，使

\[
 I_{2,x}=\frac1x\sum_c\rho_0(\log c/B)A(c)\sum_{m\ge1}K(m)
 \Bigl|\sum_{\substack{a\ge1\\ c\mid am+1}}
 A(a)K(l_a)\psi(a/(Tc))\phi(am/x)F_x(am+1)\Bigr|^2
\]

满足 $\liminf_{B\to\infty}\liminf_{x\to\infty}I_{2,x}/(BT)\ge c_5$，而对角部分（展开平方后系数指标相同那些项）满足 $\lim_{B\to\infty}\limsup_{x\to\infty}I_{2,x}^{\mathrm{diag}}/(BT)=0$。

我对这一节的取舍：$V_{B,x}$ 的上界必须在同一个迭代极限里有 $O(T)$ 的增长，否则 $|I_{1,x}|^2\le V_{B,x}I_{2,x}$ 与 $|I_{1,x}|\ge d_0\beta_*B$ 推不出 $I_{2,x}\gg BT$。素材把归一化定在 $I_{2,x}/(BT)$ 上，正说明 $V_{B,x}\ll T$；量级也对得上，$\mathcal I_{c,x}$ 的长度是 $x/(Tc)$ 级、$c$ 在 $[e^B,e^{2B}]$ 里对数宽度为 $B$，所以 $c$ 的求和与 $m$ 的求和合起来贡献 $T$ 的一次方。[推测] 这一段依赖 `arithmetic` 一节的 $A$、$K$ 均值，我在那里核对。

正对角分离之后，剩下的全是非对角：存在不同的系数 $a\ne b$ 使 $c$ 同时整除 $am+1$ 与 $bm+1$。

## §7 算术一节：四个常数是彼此咬合的，动一个就全塌

这一节供的是局部渐近式与上界，全部极限都是 $B\to\infty$；常数可依赖显式固定的紧尺度范围、后面列出的有限个光滑范数、以及固定的正则性栅格与容差，在陈述范围内的整数变量与模上是一致；$B$ 在证明他处取内层 $x$ 极限时始终固定（`arithmetic.tex:4--10`）。记号 $e(t)=\exp(2\pi it)$。

参数选择我抄得很慢（`arithmetic.tex:13--22`）：$B$ 取充分大的正整数，

\[
 T=\lfloor B^{0.32}\rfloor,\qquad P_0=B^{1000},\qquad
 \mathcal P=\{p: P_0<p\le \exp(4B)\},\qquad
 R=\frac{B}{\log P_0},\qquad \ell=\log R,
\]

于是 $R\to\infty$、$\ell/\log B\to1$、$T<P_0$；称没有不超过 $P_0$ 的素因子的整数为粗糙数；$\mu_{\mathrm{Mob}}$ 是莫比乌斯函数，$\omega$ 记不同素因子个数，$\omega_E$ 是限制在素数集 $E$ 上的同一计数。

权重设计在 `arithmetic.tex:24--42`，这里是全篇最干净的一处设计：

\[
 A_0(a)=(\log P_0)R^{1/2}\mu_{\mathrm{Mob}}^2(a)2^{-\omega(a)}\mathbf 1_{a\ \text{粗糙}},
 \qquad K_0(v)=R^{1/2}2^{-\omega_{\mathcal P}(v)}.
\]

$K_0$ 同样定义在 $\widehat{\mathbb Z}$ 上与 $\mathcal P$ 的子集 $S$ 上（取 $\omega_{\mathcal P}(S)=|S|$）。对 $U\subset S\subset\mathcal P$ 记 $a_U=\prod_{p\in U}p$、$a_\varnothing=1$，则

\[
 A_0(a_U)K_0(S\setminus U)=(\log P_0)R\,2^{-|S|}=B\,2^{-|S|},
\]

而 $2^{-|S|}$ 恰是"每个素数以概率 $\frac12$ 独立入选"的公平拆分概率，所以对 $U$ 的函数求和就给出 $B$ 乘公平拆分期望。§6 末尾我留下的那个关于 $\frac1B$ 归一化的疑问在这里结清：放大器定义里那个 $\frac1B$ 就是把这条恒等式的 $B$ 除掉，从而使 $D_B$ 的哈尔均值是 $O(1)$ ，并非 $O(B)$。$A_0$ 里多出的 $\log P_0$ 因子只作用在粗糙的无平方系数上，$A_0$ 与 $K_0$ 各带 $R^{1/2}$，三重量相乘就是 $R^{3/2}$，这个事实下面 §8 的边质量估计会精确用到。

系数支撑包含在 $[1,\exp(bB)]$（固定 $b<4$）里，故这些支撑上粗糙系数的每个素因子都属于 $\mathcal P$（`arithmetic.tex:44--46`）。

局部估计有两路输出（`arithmetic.tex:50--58`）：一路给 $A_0$ 在对数尺度 $B$ 的乘性窗口上的光滑均值，包括模与实频率都被 $B$ 的固定幂次界住的加性相位；另一路给按概率 $z/p$（$z\in\{1/4,1/2\}$）独立选素数形成的乘积 $a$，在限制到单位剩余类后 $\log a/B$ 的光滑密度，其绝对误差在宽度只有 $O(1/B)$ 的区间上也有效。两路都由分部求和从"带任意指定 $B$ 幂次节省"的累积估计导出。

第一路的原料是 Selberg--Delange。对 $g_z(n)=\mu_{\mathrm{Mob}}^2(n)z^{\omega(n)}$、$g_{z,P_0}(n)=g_z(n)\mathbf 1_{n\ \text{粗糙}}$（`arithmetic.tex:61--65`），`arithmetic.tex:67--88` 说：每个固定的非负整数 $H$ 与两个 $z$ 之一，存在实常数 $c_j(z)$ 使 $Y\ge3$ 时

\[
 \sum_{n\le Y}g_z(n)=Y\sum_{j=0}^{H}c_j(z)(\log Y)^{z-1-j}
 +O_H\bigl(Y(\log Y)^{z-2-H}\bigr),\qquad
 c_0(z)=\frac1{\Gamma(z)}\prod_p(1+z/p)(1-1/p)^z>0,
\]

并且对每个固定 $C,D>0$，一致地对模 $d\le(\log Y)^C$ 的非主迪利克雷特征有 $\sum_{n\le Y}g_z(n)\chi(n)\ll_{C,D}Y(\log Y)^{-D}$，其中常数与阈值可以无效。我在自己的本子上重走了 Dirichlet 级数那一半（`arithmetic.tex:95--118`）：$\Re s>1$ 时

\[
 \sum_n\frac{g_z(n)}{n^s}=\zeta(s)^zG_z(s),\qquad
 G_z(s)=\prod_p(1+zp^{-s})(1-p^{-s})^z,
\]

每个局部因子的对数是 $O(p^{-2\Re s})$，所以 $G_z$ 在 $\Re s\ge0.9$ 上解析、非零、有界，导数在更小的紧集上有界；把 $\frac{(u\zeta(1+u))^zG_z(1+u)}{1+u}$（$u=s-1$）在 $u=0$ 展开，其值为 $G_z(1)$，截断的 Perron 反演加绕割线的轮廓积分把第 $j$ 个泰勒项对 $Ye^{u\log Y}u^{j-z}$ 积分，Hankel 的倒数伽马公式给出 $(\log Y)^{z-j-1}/\Gamma(z-j)$，这就_identifies_ $c_0(z)=G_z(1)/\Gamma(z)$。轮廓可取右缘 $1+1/\log Y$、高 $\exp(c\sqrt{\log Y})$、左缘 $1-c'/\sqrt{\log Y}$、半径 $1/\log Y$ 的小圆弧；经典零点无关区域允许固定充分小的 $c,c'$，其余轮廓段与 Perron 截断误差是 $O_H(Y\exp(-c''\sqrt{\log Y})(\log Y)^{O_H(1)})$，被吸收。

第二路的难点是那个会动的粗糙截断。`arithmetic.tex:173--194`：固定 $D>0$，存在固定的整数 $H=H(D)$ 与实系数 $C_{j,z}(P_0)$，一致地对 $B^{0.89}\le\log Y\le4B$ 有

\[
 \sum_{n\le Y}g_{z,P_0}(n)
 =Y\sum_{j=0}^{H}C_{j,z}(P_0)(\log Y)^{z-1-j}+O_D(YB^{-D}),
\]

且有绝对常数 $C_0$ 使 $|C_{j,z}(P_0)|\ll_j(\log P_0)^{C_0+j}$、

\[
 C_{0,z}(P_0)=c_0(z)\prod_{p\le P_0}(1+z/p)^{-1}
 \sim\frac{e^{-\gamma_{\mathrm E}z}}{\Gamma(z)}(\log P_0)^{-z},
\]

$\gamma_{\mathrm E}$ 是欧拉常数；同一尺寸范围内对模 $d\le B^{15}$ 的非主特征一致地有 $\sum_{n\le Y}g_{z,P_0}(n)\chi(n)\ll_D YB^{-D}$。

证明是卷积的：$h_z(p^e)=(-z)^e$（$p\le P_0$、$e\ge1$），$h_z(p^e)=0$（$p>P_0$、$e\ge1$），于是精确恒等式 $g_{z,P_0}=g_z*h_z$。取 $\epsilon_0=1/\log P_0$，

\[
 \sum_v\frac{|h_z(v)|}{v^{1-\epsilon_0}}
 =\prod_{p\le P_0}(1-zp^{-1+\epsilon_0})^{-1}
 \ll(\log P_0)^{C_0},
\]

理由是 $p^{\epsilon_0}\le e$、乘积的对数被 $O(\sum_{p\le P_0}p^{-1+\epsilon_0})$ 加有界的平方项和控制，而 Mertens 估计把前者界到 $O(\log\log P_0)$；由 $(\log v)^k\le k!\epsilon_0^{-k}v^{\epsilon_0}$ 又得 $\sum_v|h_z(v)|v^{-1}(\log v)^k\ll_k(\log P_0)^{C_0+k}$。卷积里 $v>\sqrt Y$ 的项除以 $Y$ 后至多贡献 $(\log P_0)^{C_0}\exp\bigl(-\frac{L_Y}{2\log P_0}\bigr)$（$L_Y=\log Y$），因为内层（有扭或无扭）和的绝对值不超过 $Y/v$；$v\le\sqrt Y$ 用 $Y/v$ 处的经典展开，并把 $(L_Y-\log v)^{z-1-j}$ 泰勒展开成 $\sum_{k\le H-j}\binom{z-1-j}{k}(-\log v)^kL_Y^{z-1-j-k}$ 加 $O_H(L_Y^{z-2-H}(\log v)^{H-j+1})$，该余项在 $0\le\log v\le L_Y/2$ 上一致；合并后总余项是 $O_H(Y L_Y^{z-2-H}(\log P_0)^{C_0+H+1})$。我看到 $B^{0.89}$ 这个下界时先算了一遍：余项要 $O_D(YB^{-D})$，而 $L_Y\ge B^{0.89}$ 时 $L_Y^{-H-1}(\log P_0)^{C_0+H+1}$ 里 $(\log P_0)^{C_0+H+1}=B^{O_{C_0,H}(1)}$，只要 $H$ 相对 $D$ 取大就压过 $B^{O(1)}$，因为 $L_Y^{-H-1}\le B^{-0.89(H+1)}$。这就解释了 $H=H(D)$ 的"先选 $D$ 再选 $H$"。

`arithmetic.tex:300--312` 里有两处我用来对齐量级：$Q_{z,B}\sim(4R)^{-z}$（Mertens），以及 $f_{z,B}(s)\ll s^{z-1}$ 对 $B^{-1/10}\le s\le3.2$ 成立、密度在该范围对充分大 $B$ 为正；主项在 $Bs\ge B^{0.89}$ 上一致地控制低阶项，比值被 $\log P_0$ 的固定幂次除以 $Bs$ 的正幂次界住。

命题级的输出在 `arithmetic.tex:314--353`，我把四条全抄下来，因为后面每一节都只用其中一条：$w_3$ 光滑、支撑在 $(0,\infty)$ 的固定紧子区间内，则一致地对 $0.9B\le\log X\le2.2B$、$q\le B^{15}$、$(u,q)=1$、$|\xi|\le B^{14}$，

\[
 \sum_c A_0(c)w_3(c/X)e(cu/q+\xi c/X)
 =X\frac{\mu_{\mathrm{Mob}}(q)}{\varphi(q)}
 \int w_3(t)m_B(\log(Xt)/B)e(\xi t)\,dt+O(XB^{-50});
\]

记 $\nu_z$ 为按 $z/p$ 独立选 $\mathcal P$ 中素数的乘积律、$s=\log a/B$ 为其对数坐标，$d\le B^{15}$ 时每个这样的乘积都是模 $d$ 的单位，故一致地对所有区间 $I'\subset[B^{-1/10},3.2]$ 与单位剩余 $r\pmod d$，

\[
 \Prob_{\nu_z}(s\in I',\ a\equiv r\pmod d)
 =\frac1{\varphi(d)}\int_{I'}f_{z,B}(s)\,ds+O(B^{-80});
\]

一致地对 $0\le\delta\le1$ 有 $\mathbb P_{\nu_z}(s\le\delta)\ll(\delta+1/R)^z$；对每个正整数 $n\le\exp(3.2B)$ 有 $\nu_{1/2}(n)\ll A_0(n)/(Bn)$，两边在无平方粗糙乘积（以及允许的空乘积 $n=1$）之外为零。$O(B^{-80})$ 与 $O(XB^{-50})$ 这两个"任意高次节省"的余量，正是 §6 里分部求和敢用 $O(B^{-80})$ 的来源。[推测] 素材选 $z=1/4$ 是为了二阶矩中两条独立 $\nu_{1/2}$ 律重叠时的乘积律，我没有在 `arithmetic.tex:360--440` 里核对这一步。

上界筛的形状在 `arithmetic.tex:440--475`。令 $r_d=\mathcal V_d-\mathcal V\prod_{p\mid d}\theta_p$ 并零延到其他正整数；经典上界筛基本引理给出只依赖 $k$ 的 $s_k>0$ 与绝对值不超过 $1$、支撑在 $\mathcal R_Z$ 中素数构成的无平方 $d\le D$ 上的上界权，当 $Z\le D^{1/s_k}$ 时避开被保留的禁止条件的质量至多

\[
 C_k\mathcal V\prod_{p\in\mathcal R_Z}(1-\theta_p)+\sum_{d\le D}|r_d|,
\]

常数在满足所示维数条件的禁止集上一致；这是 Ford 的有界维上界筛陈述。随后的区间、矩形与随机根筛引理（`arithmetic.tex:456--475`）：长度 $N\ge1$ 的区间中，每个 $p\le Z$ 至多 $k$ 个禁止剩余给出 $C_kN\prod_{p\le Z}(1-\theta_p)+O_k(N^{0.8})$（$Z\le N^{c_k}$）；边长 $N_1,N_2\ge1$ 的矩形中，每个素数处禁止集是至多 $k$ 条传真仿射线的并，$N_*=\min(N_1,N_2)$ 时给出 $C_kN_1N_2\prod_{p\le Z}(1-\theta_p)+O_k(N_1N_2N_*^{-0.4})$（$Z\le N_*^{c_k}$）。矩形那条我是照着后面 §8 的候选重数需要来记的：两条系数同属一个素数的情形就是仿射线。

正则性栅格与它的代价在 `arithmetic.tex:659--753`，这一段我读得最仔细，因为常数选择全在这里对表。固定 $L\ge1$、$\Delta=1/L$、栅格 $g=i/L$（$1\le i\le L$）；先取 $L$ 充分大，再取 $\tau$ 充分小，最后取 $C_>$ 充分大的 $C_*$；本节任何估计都不需要 $L$ 的上界或 $\tau$ 的正下界；前缀界要控制 `moments` 一节中互相竞争的除数表示，尾部下界要让 `amplification` 的二拆分二阶矩可求和。定义（`arithmetic.tex:674--699`）：

\[
 N_g(S)=\begin{cases}|\{p\in S:\log p\le B^g\}|,&g<1,\\ |S|,&g=1,\end{cases}
 \qquad Y_i=2^i\log P_0,
\]

$i_{\max}$ 是首个使 $Y_i\ge4B$ 的下标；$S$ 正则当且仅当每个栅格点上都满足

\[
 (g/2-\tau)\ell\le N_g(S)\le(g/2+\tau)\ell,
\]

并且对所有 $0\le i\le i_{\max}$ 有 $|\{p\in S:\log p>Y_i\}|\ge0.4\log(B/Y_i)-C_*$。整数或有限化整数正则是指它来自 $\mathcal P$ 的整除素数集正则，这些截断不计重数。

取 $A=A_0\mathbf 1_{\mathrm{reg}}$、$K=K_0\mathbf 1_{\mathrm{reg}}$，定义里的总计数下界给出

\[
 A(a),\ K(v),\ K(S)\le B^{h_0+\tau\log2+o(1)},\qquad h_0=\frac{1-\log2}{2}.
\]

$\tau$ 要小到满足三条严格不等式

\[
 2(h_0+\tau\log2)<0.32,\qquad
 1-6(h_0+\tau\log2)>0.07,\qquad
 1-5(h_0+\tau\log2)>0.229,
\]

而 $2h_0=0.3068528\ldots$、$1-6h_0=0.0794415\ldots$、$1-5h_0=0.2328679\ldots$，所以三条相容，再减小 $\tau$ 也保持。我把这四行当成全节的钥匙来读：第一个不等式的右端 $0.32$ 就是 $T=B^{0.32}$ 的指数；第二个 $0.07$ 与第三个 $0.229$ 分别给 `moments.tex` 里 $\kappa_1-5\tau\log2>.229$ 与 $B^{-.21}$ 留出余量。也就是说 $T$、$P_0$、$L$、$\tau$、$C_*$ 是一组互相解耦但单向依赖的选择，改 $T$ 的指数就要重排 $h_0$ 的条件。正则性损耗引理（`arithmetic.tex:724--753`）给出绝对 $c_3>0$，使未截断和中"至少一个系数不正则"的部分至多 $C TX^2\Sigma(j)(\epsilon_B+e^{-c_3C_*})$，其中 $C$ 可依赖固定栅格、容差与尺度范围，但不依赖 $C_*,j,X,B$，$\epsilon_B\to0$ 与 $C_*$ 无关；同样的上界概率 $O(\epsilon_B+e^{-c_3C_*})$ 对参数为 $1/(2p)+O(p^{-2})$ 的独立素数示性集成立（$O$ 中常数固定时一致），并且在挖掉一个满足 $\sum_{p\in E_B}1/p\le C_EB/P_0$ 的确定子集 $E_B\subset\mathcal P$ 后仍成立，$E_B$ 可依赖 $B$，界对每个固定 $C_E$ 的所有此类子集一致。[推测] 最后这句是专门为 §6 里"给定系数子集后其余示性概率变成 $\frac1{2p-1}$"准备的，因为 $\frac1{2p-1}=\frac1{2p}+O(p^{-2})$，而 $\sum_{p\in E_B}1/p=O(B/P_0)$ 正是被选中系数素数集。

## §8 图一节：两次固定乘法把一个除数关系换成加法滞后

素材在 `graph.tex:4--12` 交代本节任务：柯西--施瓦茨已经消掉模为 $1$ 的标签 $g_x$，正的平方 $I_{2,x}$ 只含中心化的 $F_x$；先把它的非对角项变成小加法距离上的边，再把端点处的剩余数据与每条边表示附带的额外剩余数据分开。本节除 $B,x$ 外所有参数固定，$x$ 先趋于无穷。

换元在 `graph.tex:16--38`。取 $I_{2,x}$ 内平方中不同的系数 $a,b$、固定的 $m,c$，记 $l_a=(am+1)/c$、$l_b=(bm+1)/c$。同余式蕴含 $m$ 是模 $c$ 的单位且

\[
 a-b=jc,\qquad 0<|j|\le T,
\]

并且 $(a,c)=(b,c)=1$；因 $a,b$ 粗糙而 $|j|\le T<P_0$，有 $(a,j)=(b,j)=1$，从而 $(a,b)=1$。对 $a$ 因子被共轭的那个有序项令

\[
 n'=bl_a,\qquad n'+j=al_b.
\]

固定这两个系数时这是以 $b\mid n'$、$a\mid n'+j$ 为条件的双射重编号：写 $n'=bz$，由后一同余与 $b=a-jc$ 得 $j(1-cz)\equiv0\pmod a$，于是 $m=\frac{cz-1}{a}$ 是整数，代回可恢复原来的两个同余与两个恒等式。正的紧尺度支撑保证 $x$ 大时一切自变量为正。

`graph.tex:44--60` 有一张图记录这两次固定乘法产生加法移位的过程；我在下面用一行文字复述它的交换关系：$l_a$ 乘 $b$ 得 $n'$，$l_b$ 乘 $a$ 得 $n'+j$，中间的纽带是 $a-b=jc$。`graph.tex:62--70` 强调只用了固定倍数不变性，$F_x$ 不需要乘性：固定 $B$ 时系数支撑有限，故 $x$ 大后对 $c,b,a$ 三个乘子同时可用，先去 $c$ 再插入 $b,a$ 得

\[
 \overline{F_x(am+1)}F_x(bm+1)
 =\overline{F_x(l_a)}F_x(l_b)
 =\overline{F_x(n')}F_x(n'+j).
\]

光滑因子的对表在 `graph.tex:71--84`：定义 $\Psi_s(u_1,u_2)=\psi(u_1)\psi(u_2)\phi(s/u_1)\phi(s/u_2)$；若 $s=n'/(Tx)$、$u_1=a/(Tc)$、$u_2=b/(Tc)$，则 $s/u_1=bm/x+b/(ax)$、$s/u_2=am/x+1/x$，原来的两个 $\phi$ 自变量被交换且误差 $O_B(1/x)$，因为它们成积出现，替换成 $\Psi_s$ 的误差在固定 $B$ 下消失；存在只依赖 $\phi,\psi$ 的固定紧区间 $\mathcal S\subset(0,\infty)$，在其外 $\Psi_s$ 在系数支撑上为零。

于是 $I_{2,x}/(BT)$ 的非对角部分，除 $o_x(1)$ 外等于（`graph.tex:86--91`）

\[
 \frac1{Tx}\sum_{n'}\sum_{0<|j|\le T}\overline{F_x(n')}F_x(n'+j)\,
 \mathcal K_j(n',n'/(Tx)),
\]

其中对 $u\in\widehat{\mathbb Z}$（`graph.tex:92--102`）

\[
 \mathcal K_j(u,s)=\frac1B
 \sum_{\substack{a-b=jc,\ (a,b)=(a,c)=(b,c)=1\\ b\mid u,\ a\mid u+j}}
 A(a)A(b)A(c)K(u/b)K((u+j)/a)\,
 K\Bigl(\tfrac{c(u/b)-1}{a}\Bigr)
 \rho_0(\log c/B)\Psi_s(a/(Tc),b/(Tc)).
\]

所有系数变量是正整数；$\widehat{\mathbb Z}$ 上的整除仍是乘法像集、乘法单射，前面的同余计算也证明了每个商在其求和域上有定义。该核非负、依赖有限多个素数幂剩余，并且 $\mathcal K_j(u,s)=\mathcal K_{-j}(u+j,s)$，理由是对换 $a,b$ 后最后的商不变，因为 $c(u+j)-a=cu-b$。

边质量均值（`graph.tex:115--140`）：一致地对 $0<|j|\le T$、$s\in\mathcal S$ 有 $\mathbb E_{u\in\widehat{\mathbb Z}}\mathcal K_j(u,s)\ll\Sigma(j)/T$，隐含常数可不含 $C_*$。证明我把每步的量级都对了一遍：先用未截断的优势替换截断权；固定两两互素的 $a,b,c$ 时两个端点同余的哈尔概率是 $1/(ab)$；在 $p\in\mathcal P$、$p\nmid abc$ 处，三个剩余权的零点类 $0$、$-j$、$b/c$ 互异（这里用到 $p>|j|$，而 $b/c\not\equiv-j\pmod p$ 来自 $a=b+jc$），局中均值是 $1-\frac{3}{2p}$；整除 $abc$ 的素数处丢掉局部折减因子，欧拉乘积只变 $\exp(O(\sum_{p\mid abc}1/p))=O(1)$，因为那个和是 $O(B/P_0)$；素数独立加 Mertens 给出 $R^{3/2}\prod_{p\in\mathcal P}(1-3/(2p))\ll1$；在二进框 $c\asymp X$ 内分母 $ab\asymp T^2X^2$，三型系数估计把 $1/B$ 因子之前的贡献界到 $O(\Sigma(j)/T)$。这里 $R^{3/2}$ 的出现正是 $A,A,A$ 与三个 $K$ 里 $R^{1/2}$ 的合计，与 $\prod(1-3/(2p))\asymp R^{-3/2}$ 相互抵消，所以"每个位点被三条互异剩余各折减一半概率"这件事在总质量上是免费的。$\Sigma(j)$ 的定义在 `arithmetic.tex:554--658` 那两条二型、三型系数界里，我没有读到它的闭形式，只知道它被 $\frac1T\sum_{0<|j|\le T}\Sigma(j)\ll1$（`moments.tex:668`）使用。

端点类型与候选表示在 `graph.tex:190--250`。记 $S_i(u)=\{p\in\mathcal P: p\mid u+i\}$，与独立集合 $S_i$（每个 $p\in\mathcal P$ 以概率 $1/p$ 独立入选）比较：在固定 $p>P_0>M$ 处，真实律在每个位点的命中互斥、概率 $1/p$，与独立命中的全变差距离是 $O(M^2/p^2)$，所以联合位点律可以耦合，失败概率 $O(M^2/P_0)$；另有 $\mathbb P\{p^2\mid u+i\ \text{对某个}\ p\in\mathcal P,\ i\le M\}\ll M/P_0$。对允许的对 $i,k=i+j$（$j>0$），一个候选由 $S_i$ 的一个子集乘积 $b$、$S_k$ 的一个子集乘积 $a$、以及正整数 $c=(a-b)/j$ 组成；要求两两互素、粗糙无平方、三个系数正则，并且两个余下集合 $S_i\setminus b$、$S_k\setminus a$ 正则；用闭支撑窗口 $B\le\log c\le2B$、$Tc\le a,b\le2Tc$ 无害，光滑因子仍施加原支撑；反向有序对指同一候选。计数：有贡献的端点至多 $(1+2\tau)\ell$ 个素数，一对端点的子集选择至多 $2^{2(1+2\tau)\ell}$，于是整块中的候选数是 $O(B^4)$；这个粗界对"位点有平方因子时仍对 `graph.tex:92--102` 有贡献的表示"同样适用，因为系数与商的素数集之并覆盖该位点的不同素数。配合权重界，下面用到的全部矩阵总质量有确定的 $O(B^{10})$ 上界，这允许在更锐的均值估计之前先丢掉小概率误差。[推测] 我只核对到 $2^{(1+2\tau)\ell}=B^{\log2+o(1)}$ 这一步，$B^4$ 与 $B^{10}$ 里的其余指数来自对 $j$、方框与五个权重的求和，我没有逐项复算。

再记 $k_B=\mathbb E_S K(S)$（独立 $1/p$ 律下），未截断欧拉乘积给 $k_B\ll1$，并定义潜在核

\[
 \mathcal L_{ik}(S_i,S_k;s)=\frac{k_B}{B}\sum_{\text{候选}}
 A(a)A(b)A(c)K(S_i\setminus b)K(S_k\setminus a)
 \rho_0(\log c/B)\Psi_s(a/(Tc),b/(Tc)),
\]

按对称延拓、非对取零。没有位点平方的真实端点集上，光滑因子允许的那些项在 $\mathcal K$ 与 $\mathcal L$ 里有相同的系数表示，两个端点商的素数集正是互补集；后者保留这些项，并把剩下的因子 $K(m)$ 换成它的独立均值 $k_B$。这一步"换均值"是我在这节学到的第二个技巧：它把位点集合上的乘积函数拆成一个只依赖类型的外积，代价是需要重数控制。

一致条件均值（`graph.tex:252--286`）说的是"对每一个可能的端点类型 $S_i$，不只是几乎每个典型类型"以及每个允许的滞后 $j=k-i$ 有 $\mathbb E_{S_k}\mathcal L_{ik}(S_i,S_k;s)\ll\Sigma(j)/T$，于是每个条件期望度都是 $O(1)$，$\mathbb E\sum_{i,k}\mathcal L_{ik}=O(M)$。证明路线：第一个端点上容许的公平拆分 $b$ 给出 $A(b)K(S_i\setminus b)=B2^{-|S_i|}$；另一端先用同一恒等式再对其位点集取平均，得到拆分乘积律 $\nu_{1/2}$，由 $\nu_{1/2}(n)\ll A_0(n)/(Bn)$ 控住 $a$ 的质量，丢掉其余限制作上界得

\[
 \mathbb E_{S_k}\mathcal L_{ik}\ll
 \mathbb E_{b\mid S_i,\mathrm{split}}
 \mathbf 1_{\{b\ \text{在可行范围}\}}
 \sum_{\substack{c\asymp b/T,\ a=b+jc\asymp b\\ B\le\log c\le2B}}
 \frac{A_0(c)A_0(a)}{a}
 \ll\frac{\Sigma(j)}T
 \mathbb E_{b\mid S_i,\mathrm{split}}\mathbf 1_{\{b\ \text{在可行范围}\}}
 \le C\frac{\Sigma(j)}T.
\]

`graph.tex:281--285` 补了两句我很在意：这是质量不超过 $1$ 的限制期望，没有除以该期望的概率；若固定类型没有容许拆分，其核为零；带符号滞后反向的同一估计处理另一个端点。

独立根比较命题（`graph.tex:295--312` 的陈述）说：设 $\mathcal M_{ik}(S_i,S_k;s)$ 是实对称核、非对为零、总绝对质量一致 $O(B^{10})$，则

\[
 \mathbb E_u\Bigl\|\bigl(\mathcal K_{k-i}(u+i,s)
 -\mathcal M_{ik}(S_i(u),S_k(u);s)\bigr)_{i,k}\Bigr\|_{\square}
 \le o(1)+\mathbb E_{(S_i)\mathrm{独立}}
 \Bigl\|\bigl(\mathcal L_{ik}(S_i,S_k;s)-\mathcal M_{ik}(S_i,S_k;s)\bigr)_{i,k}\Bigr\|_{\square},
\]

误差对 $s\in\mathcal S$ 一致，$\|\cdot\|_\square$ 是割范数。它比"对某一对预定检验成立"强得多，而右边那个 $\mathcal M$ 可以任选，这正是后面特征分解与采样两节的接口。

## §9 矩一节：一条边的多个表示才是危险源

`moments.tex:4--11` 把需求说得很直白：独立根比较把潜在核 $\mathcal L$ 留在手上，它的条件一阶矩被 $\mathbb E_{S_k}\mathcal L_{ik}\ll\Sigma(j)/T$ 对每个位点类型一致界住；采样论证还要一个积分型的二阶矩界；单个表示很小是不够的，因为一条边可能有若干表示；把平方展开并对其中一个表示加权，就能识别出必须在其下控制这个重数的那个测度。我在自己的草稿上试过"逐表示界乘边数"这条捷径，结果是：边数本身是 $O(M)$ 级随机量、最坏情形没有确定界，两个因素相乘就把 $B$ 的负幂吃掉。素材的绕行办法是把重数吸进一个倾斜测度里。

参数选择在 `moments.tex:13--20`：栅格尺寸 $L$ 与容差 $\tau$ 在下面一次性选好，与 `arithmetic.tex:659--668` 的次序一致（先 $L$ 大、后 $\tau$ 小）；每个 $B\to\infty$ 极限里 $\eta>0$、块常数 $C_6$、$C_*$ 与光滑权都固定；所有一致性对位置与 `graph` 一节那固定紧范围上的 $s$ 成立；常数可依赖固定参数，但不可依赖 particular 的第一个表示。

主命题（`moments.tex:22--38`）：对充分细的固定正则性栅格、再对充分小的固定容差，独立位点的潜在核满足，对 $1\le i\le M$，

\[
 \sum_{k\ne i}\mathbb E\,\mathcal L_{ik}^{2}\ll B^{-.21},
\]

并且归一化总质量二阶矩有界 $\mathbb E\bigl(\frac1M\sum_{i,k}\mathcal L_{ik}\bigr)^2\ll1$；对任何 $I\subseteq\{1,\dots,M\}$，把 $\mathcal L_{ik}$ 换成 $\mathbf 1_{\{i,k\in I\}}\mathcal L_{ik}$ 后同样成立，归一化仍是 $M$。

指数预算从 `moments.tex:40--51` 起算。记 $h_\tau=h_0+\tau\log2$，$\mathcal L_{ik}$ 的每个加和项里有五个截断权重，$k_B\ll1$ 且光滑因子有界，于是由权重界

\[
 \text{单个贡献}\le B^{-\kappa_1+5\tau\log2+o(1)},\qquad
 \kappa_1=1-5h_0=0.232867951\ldots>.2328.
\]

这里 $\kappa_1$ 与 §7 里第三条 $\tau$ 条件 $1-5(h_0+\tau\log2)>0.229$ 是同一件事的两端：五个 $B^{h_\tau}$ 权重相乘给出 $B^{-5h_\tau}$，而 $1-5h_0$ 来自 $A_0,A_0,A_0,K,K$ 与分母 $ab$ 之间的净幂次。

第一个表示固定的集合在 `moments.tex:54--60`：$\mathcal C_j$ 是满足

\[
 a-b=jc,\qquad B\le\log c\le2B,\qquad Tc\le a,b\le2Tc
\]

的正整数组 $(a,b,c)$ 之有限集，其元素两两互素、粗糙、无平方、正则。重数引理（`moments.tex:150--163`）说：栅格与容差可以选成使一致地对 $(a,b,c)\in\mathcal C_j$ 与 $\eta T\le|j|\le T$，

\[
 \mathbb E^{\mathrm{tilt}}_{a,b}
 \bigl[\mathbf 1_{\mathcal T_b\ \text{正则}}\,
       \mathbf 1_{\mathcal T_a\ \text{正则}}\,
       N_{a,b,c}(\mathcal T_b,\mathcal T_a)\bigr]\ll B^{.009},
\]

其中 $N_{a,b,c}(\mathcal T_b,\mathcal T_a)$ 是给定第一个表示后 competing 候选的个数。[推测] 上标 tilt 的测度就是"以第一个表示为条件后剩下的位点律"，我在 `moments.tex:60--150` 那九十行里没有读到它的定义式；这个 $B^{.009}$ 的极小指数说明作者只要重数增长慢于任何固定 $B$ 幂，真正的杠杆仍是单个表示的 $B^{-.2328}$。备选候选的唯一分解在 `moments.tex:165--175`：

\[
 b'=d_1y,\ d_1\mid b,\ \mathcal P(y)\subset\mathcal T_b,\qquad
 a'=e_1z,\ e_1\mid a,\ \mathcal P(z)\subset\mathcal T_a,\qquad
 a'-b'=jc',
\]

所有乘积无平方，$y$ 与 $b$ 互素、$z$ 与 $a$ 互素，一旦这四个乘积选定，$c'$ 就被确定。这一句是重数能被"除子 $d_1,e_1$ 加上两个新素数集"参数化的原因，也是我把 $B^{.009}$ 读成"$y,z$ 的素数个数集中于极少数情形"的理由。

命题证明（`moments.tex:637--697`）把两块拼起来，对允许边 $i,k=i+j$ 用重数引理与 $\Xi$ 的一致界得

\[
 \mathbb E\mathcal L_{ik}^2
 \ll B^{-\kappa_1+5\tau\log2+.009+o(1)}
 \frac1B\sum_{(a,b,c)\in\mathcal C_j}\frac{A(a)A(b)A(c)}{ab}.
\]

剩下的系数和用三型估计：$c$ 的支撑由 $O(B)$ 个二进框 $c\asymp X$ 盖住，每框内 $a,b\asymp TX$，丢掉系数截断作上界，

\[
 \frac1B\sum_{a-b=jc}\frac{A_0(a)A_0(b)A_0(c)}{ab}
 \ll\frac1{B(TX)^2}\,TX^2\Sigma(j)=\frac{\Sigma(j)}{BT},
\]

对框求和得 $O(\Sigma(j)/T)$，负 $j$ 由对称同法。于是

\[
 \mathbb E\mathcal L_{ik}^{2}
 \ll B^{-\kappa_1+5\tau\log2+.009+o(1)}\frac{\Sigma(k-i)}{T}.
\]

$\tau$ 的选择使 $\kappa_1-5\tau\log2=1-5h_\tau>.229$，故右端指数在加 $o(1)$ 之前严格小于 $-.220$；再由 $\frac1T\sum_{0<|j|\le T}\Sigma(j)\ll1$ 对一行求和就得到 $B^{-.21}$，指数里还留着吸收 $o(1)$ 的余量。

第二个断言用行和 $D_i=\sum_k\mathcal L_{ik}$：给定 $S_i$ 后，$k\ne i$ 的那些加和项相互独立，因为其他位点类型独立、根也已被平均掉，所以

\[
 \mathbb E\operatorname{Var}(D_i\mid S_i)
 \le\sum_k\mathbb E\mathcal L_{ik}^2\ll B^{-.21},
\]

条件均值由 $\Sigma(j)/T$ 那条一致界住（对每个 $S_i$），方差恒等式给出

\[
 \mathbb E D_i^2=\mathbb E\operatorname{Var}(D_i\mid S_i)
 +\mathbb E\bigl(\mathbb E[D_i\mid S_i]\bigr)^2\ll1,
\]

跨行用 Jensen：$\mathbb E\bigl(\frac1M\sum_iD_i\bigr)^2\le\frac1M\sum_i\mathbb E D_i^2\ll1$。`moments.tex:688--689` 特意为一句辩解：这里只用到了积分型的条件方差界，逐点的条件二阶矩估计不必要；核限制到 $I$ 时非负性只会减小条件均值、行平方和与总质量，保持归一化 $M$ 就得到陈述中的界。

这一节我学到的取舍是：重数的代价（$B^{.009}$）与单个表示的节省（$B^{-.2328}$）指数相差二十多倍，所以正确的做法是把力气花在让"$\eta T\le|j|\le T$"里 $j$ 的排除段变短上。为什么必须排除 $|j|<\eta T$？我的读法是回到 §8 那句 $p>|j|$：三个零点类 $0,-j,b/c$ 互异只对 $p\le|j|$ 之外的素数成立，小滞后会有一批位点失去独立，而折损全在 $\Sigma(j)$ 里；$\frac1T\sum\Sigma(j)\ll1$ 这条平均界只能容忍少数坏 $j$。

## §10 通道一节：把对数坐标与剩余坐标同时磨平

先声明取证范围：本节的陈述我只逐行读到 `channels.tex:19--52`，其后各命题只见到标题与行号（`channels.tex:70` 的一致通道界、`channels.tex:121` 的独立公共与专属乘积、`channels.tex:184` 的小专属乘积双侧 Schur 估计、`channels.tex:244` 磨平全部非常值剩余模式、`channels.tex:301` 的一致粗紧性、`channels.tex:408` 的粗位点特征推论），所以凡是涉及这些命题的式子我都按功能叙述并标注 [未核]。

已读到的设置如下。$\Omega_B$ 是 $\mathcal P$ 的一切子集构成的有限集，其测度下各包含事件 $p\in S$ 独立、概率 $1/p$；给定 $S$ 后每个素数以概率 $\frac12$ 独立保留，$b$ 是它们的乘积，无条件地 $b$ 的律是 $\nu_{1/2}$。记

\[
 I=[1/2,3],\qquad x_b=\frac{\log b}{B},
\]

把 $I$ 等分成 $m_1$ 个粗区间 $I_l$；细分区间数取

\[
 n_B=m_1\Bigl\lceil\frac{|I|B^{11/10}}{m_1}\Bigr\rceil,\qquad
 \delta_B=\frac{|I|}{n_B},
\]

于是细分精确加细粗分，且对每个固定 $m_1$ 有 $\delta_B\asymp B^{-11/10}$；半开约定一致，最后一个端点归入末格。对整数 $1\le d\le B$ 记 $\mathcal R_d=(\mathbb Z/d\mathbb Z)^\times$ 带均匀概率测度，$d=1$ 时是单点群；由于 $P_0>B$（充分大 $B$），所有涉及的乘积都是模 $d$ 的单位；$I\times\mathcal R_d$ 上给乘积测度 $d\lambda_d(x,r)=dx\,d\mathrm{unif}_{\mathcal R_d}(r)$。对 $g\in L^2(\Omega_B)$ 定义在每个细对数格上为常数的函数，其形式以 $\frac{\varphi(d)}{\delta_B}$ 为归一化前缀（`channels.tex:52` 处被我的窗口切断，[未核]）。

我把这一节的功能概括成两条通道，因为它们各自对付一种残余依赖。

第一条是对数通道。$x_b=\log b/B$ 的分布密度在 §7 里已经有了：$\nu_{1/2}$ 的对数坐标密度 $f_{1/2,B}(s)\asymp s^{-1/2}$ 且带 $O(B^{-80})$ 的单类误差。取 $\delta_B\asymp B^{-11/10}$ 的宽度后，单个细格内密度的振荡是 $O(\delta_B\cdot\sup|f'|)=O(B^{-11/10})$ 级，而对数坐标上任何需要"格常数化"的误差都以 $B^{-1}$ 为单位出现；$11/10$ 这个指数就是把"格宽比自然误差尺度 $B^{-1}$ 更细"写成的最省形式，再多花一点指数换来 $n_B$ 仍是 $B$ 的多项式。$n_B$ 被要求成 $m_1$ 的整数倍这一点在 §11 才显出用处：粗特征 $V_l(S)=\frac1{|I_l|}\mathbb P_{\mathrm{split}}(\frac{\log b}{B}\in I_l\mid S)$ 的 $I_l$ 必须恰好是若干个细格之并，否则"细格上常数化"与"粗格上的取值"之间会留下边缘格。

第二条是剩余通道。固定 $d$ 后把 $x_b$ 与 $r\equiv b\pmod d$ 合在 $I\times\mathcal R_d$ 上看，归一化前缀 $\frac{\varphi(d)}{\delta_B}$ 说明该算子先对单位类求平均再对格宽归一。$\mathcal R_d$ 上的均匀测度就是"磨平非常值剩余模式"的目标测度：`channels.tex:244` 那条（[未核]）按标题要做的是把任何非常值的特征模式在通道作用后压小。这与我读到的 §6 里 $G_{B,v}$ 的公平拆分解释是同一族操作的两端，$G_{B,v}$ 在素数集上取乘积期望，通道在乘积的对数与剩余两个坐标上取平均。

专属乘积（我按标题的用法理解：两个端点各自独占的那部分素数）的删除在 `channels.tex:165--244`，工具是双侧 Schur 估计（`channels.tex:184`，[未核]）。我为什么需要双侧：潜在核 $\mathcal L_{ik}$ 在割范数下要被比较，而割范数是"对两端各取不超过 $1$ 的实向量取最大配对"，任何一侧的范数失控都会漏；Schur 检验同时对行与列给界，正好对上割范数的双线性形状。至于"小"专属乘积为何危险，我的读法是：专属部分越短，其乘积模 $d$ 的分布越容易被少数剩余类卡住，此时公共部分（两端共享的素数结构，`channels.tex:121` 的独立公共与专属乘积 [未核]）无法把它抹匀。

`channels.tex:301--425` 的一致粗紧性与粗位点特征推论是把两条通道合成的地方：按标题（[未核]）它给出对数输出在这固定粗分划上一致可逼近，进而把 $V_l$ 变成合法的粗特征。这与 `introduction.tex:239--241` 的口号完全对应：公平拆分压制剩余依赖，并使对数输出在该分划上一致可逼近。

[推测] 我在自己的顺序里会更早把粗特征定义抽出来单独证明，素材却把它放在通道末尾的推论里；我猜理由是它的一致性要同时用到两条通道的界，抽出反而要重复参数。这个猜法没有素材凭据，只作为我对结构的一处不满记录在此。

## §11 核一节：把两端的数据真正拆开，付出的是小弧

本节我只拿到标题级的地图（`kernel.tex:40` 去掉正则性限制、`kernel.tex:68` 的一致去截断、`kernel.tex:158` 傅里叶探测与被丢弃的弧、`kernel.tex:339` 细直方图与剩余平均、`kernel.tex:491` 精确剩余因子、`kernel.tex:575` 阿基米德反演与粗特征、`kernel.tex:729` 一致积分割比较与行界、`kernel.tex:736` 积分比较命题），下面的机制叙述里凡是式子都由我从 `introduction.tex:230--251` 的口号与 §7 的可用输入反推，标 [推测] 处即我没能核对原式。

目标是把 $\mathcal L_{ik}(S_i,S_k;s)$ 换成两端函数的乘积。素材给出的形状是

\[
 \sum_{l}c_{l,B}(j,s)\,V_l(S_i)V_l(S_k),\qquad j=k-i,\qquad
 V_l(S)=\frac1{|I_l|}\Prob_{\mathrm{split}}\Bigl(\frac{\log b}{B}\in I_l\ \Big|\ S\Bigr),
\]

其中 $I_l$ 是某紧对数区间的一个固定粗分划元素、个数为固定值，而 $V_l$ 的取值与系数 $c_{l,B}$ 都可以依赖 $B$。系数把 $|j|$ 的算术因子与归一化滞后 $|j|/T$、块原点 $s$ 的光滑因子分开，这一步分开之后 §13 才可能逐段近似。

先说我认可的推导顺序。第一个必需动作是去截断（`kernel.tex:40--158` 之前）：潜在核里 $A,K$ 都带正则性示性，而 $V_l$ 是纯概率量，两边要对表必须先把截断以误差形式剥离；§7 的正则性损耗界给出的是 $C TX^2\Sigma(j)(\epsilon_B+e^{-c_3C_*})$ 这种"乘上未截断和的主量再乘一个小因子"的形状，所以去截断在割范数意义下一致成立，代价仍可被 $C_*$ 压到任意小。这一句我是有凭据的，因为损耗的形式与不含 $C_*$ 的 $\epsilon_B$ 都在 `arithmetic.tex:724--753` 写明了。

第二个动作是探测 $a-b=jc$。我的还原是这样的：条件 $c\mid(a-b)$ 且商为 $j$ 可以用加性特征写出

\[
 \mathbf 1_{c\mid(a-b)}=\frac1c\sum_{u\ (\mathrm mod\ c)}e(ua/c)\,e(-ub/c),
 \qquad e(t)=\exp(2\pi it),
\]

按 $u/c$ 的大小分大弧与小弧。大弧上 $q$ 小，归约到 §7 的第一条局部律，也就是带加性相位 $e(cu/q+\xi c/X)$ 的 $\sum_c A_0(c)w_3(c/X)$，那里模 $q\le B^{15}$ 与实频率 $|\xi|\le B^{14}$ 的一致界恰好为大弧上所有有理点准备；小弧要用 Montgomery--Vaughan 的指数和估计（`introduction.tex:298--300` 明写这一路输入），`kernel.tex:158` 标题里的"被丢弃的弧"就是这部分被证成可丢。我把这条顺序反推出来的根据是：局部律命题里 $q,\xi$ 的允许范围（$B^{15}$、$B^{14}$）远远超过公平拆分乘积本身需要的范围，而 $P_0=B^{1000}>B^{15}$ 保证粗糙数对这些模全是单位；若只处理单一剩余类就不必把 $q,\xi$ 两轴同时参数化。

第三个动作是细直方图与剩余平均（`kernel.tex:339--491` 段）。[推测] 这一步把 §10 的对数通道与剩余通道接起来：先用宽度 $\delta_B\asymp B^{-11/10}$ 的细格把 $x_b$ 常数化，使每个细格内的密度可用 $f_{1/2,B}$ 的主项代替，再对 $\mathcal R_d$ 平均以消掉非常值剩余模式。标题里"精确剩余因子"（`kernel.tex:491`）应当就是把欧拉乘积写成闭合形的那一步；我在 §8 已经亲手算过一个同类因子 $R^{3/2}\prod_{p\in\mathcal P}(1-3/(2p))\ll1$（`graph.tex:134--137`），那里三条互异零点类各折 $\frac1{2p}$，一般情形是 $k$ 条零点类给 $\prod(1-k/(2p))\asymp R^{-k/2}$，与 $k$ 个 $R^{1/2}$ 权重相消。[未核] 素材是否就是这一形式，我没能读到。

第四个动作是阿基米德反演（`kernel.tex:575--729` 段）：从对数坐标的分布函数把粗特征 $V_l$ 反解出来。可用的原料是 §7 第二条 $\mathbb P_{\nu_z}(s\in I',\ a\equiv r\pmod d)=\frac1{\varphi(d)}\int_{I'}f_{z,B}(s)\,ds+O(B^{-80})$ 与第三条 $\mathbb P_{\nu_z}(s\le\delta)\ll(\delta+1/R)^z$，加上 $f_{z,B}(s)\ll s^{z-1}$ 在 $B^{-1/10}\le s\le3.2$ 上一致、密度在该范围对大 $B$ 为正。$I=[1/2,3]$ 落在这个范围内部，所以粗格上的概率能用密度积分替换，误差 $O(B^{-80})$ 对固定 $m_1$ 求和后仍然微小；这就是我理解的"一致粗紧性"为何能给出可逼近的粗特征。

`kernel.tex:729--800` 的一致积分割比较与行界（[未核]）我按名字读成两件事：把逐点割比较加强成对 $s$ 积分后的比较，并且给出行方向的界，供 §12 的重数与独立位点二阶矩接口使用。到这里，端点核已被表达成粗特征的外积加一个只依赖 $|j|$、$|j|/T$、$s$ 的标量系数。

## §12 采样一节：优化检验是整体对象，只能靠列样本逼近

§11 得到的比较是"对两个独立端点集各自的函数积分成立"。真实标签并不具有这种单位点形状，而割范数的优化检验 $(\alpha_i),(\beta_k)$ 可以依赖整个构型：

\[
 \|(\mathcal A_{ik})\|_\square
 =\max_{|\alpha_i|\le1,\ |\beta_k|\le 1}
 \Bigl|\frac1{M}\sum_{i,k}\alpha_i\mathcal A_{ik}\beta_k\Bigr|,
\]

素材在 `introduction.tex:224--226` 就把割范数定义成"与两个不超过 $1$ 的实向量的最大归一化配对，向量在矩阵已知之后选取"。`introduction.tex:253--258` 交代了绕行：用一个小的列样本去逼近优化的割。这一节我读到三条支撑命题的标题与行号（`sampling.tex:49` 的类型核采样命题、`sampling.tex:89` 的公共度事件与一致可积性、`sampling.tex:165` 用小列集逼近、`sampling.tex:223` 固定列集后的一致均值），式子按我的理解叙述，标 [未核]。

我的取舍是这样形成的。Frieze--Kannan 式的正则性引理给的是"固定矩阵、随机取 $q$ 列、则除列张成部分外割范数小"，代价是 $q$ 只依赖精度。这里的困难有两条：矩阵本身依赖 $B$，条目可以大到让 $q$ 的选取失效；矩阵是随机的，样本与矩阵共享同一批位点集合，独立性不能用常规方式声明。素材的回答是把矩条件先立起来再上集中不等式，`introduction.tex:288--291` 明写这一点：因为这里的核随 $B$ 变且可以很大，证明先建立所需矩界，然后才用有界差异集中（McDiarmid）。

具体接口正是 §9 那两条：$\sum_{k\ne i}\mathbb E\mathcal L_{ik}^2\ll B^{-.21}$ 给"平均意义上每行的平方和质量极小"，$\mathbb E(\frac1M\sum_iD_i)^2\ll1$ 给总质量的二阶矩有界。我的读法是：先用 $B^{-.21}$ 那条证明一个以高概率成立的事件：每行的度（以及列的度）都不超过固定的 $C_6$ 倍期望，这就是 `sampling.tex:89` 的公共度事件；在这个事件上，单个位点集合的改变对割配对的影响被该点的度界住，于是有界差异可用；一致可积性是防止"事件外"那一小部分贡献失控，因为度只有期望有界、逐点可以任意大，`graph.tex:259--260` 那里说的是条件期望度 $O(1)$、总质量期望 $O(M)$，逐点无界。[推测] `sampling.tex:165` 的小列集逼近就是在公共度事件上对采样矩阵做通常的列投影，`sampling.tex:223` 固定列集后的一致均值处理剩余的列随机性。

我还注意了一处容易被略过的对称性：$\mathcal K_j(u,s)=\mathcal K_{-j}(u+j,s)$（`graph.tex:109--111`）说明矩阵本身并非对称，对称化要把 $(i,k)$ 与 $(k,i)$ 的滞后反向配对。`graph.tex:297--299` 对比较核 $\mathcal M$ 的要求是实对称、非对为零、总绝对质量 $O(B^{10})$，也就是说对称性是被塞进假设里的，真正的非对称性由滞后符号承担。这一点我在自己写割范数界时吃过亏：把非对称矩阵当对称处理会让"列样本"与"行样本"的计数差一个自由度。

## §13 矛盾闭合：把粗特征写成 $G_{B,v}$ 的有限组合，然后调用 §5 的那条零界

这一段我有 `conclusion.tex` 的标题地图（`conclusion.tex:35` 位点特征的逼近、`conclusion.tex:161` 滞后因子的周期逼近、`conclusion.tex:217` 主能量消失命题），加上 `introduction.tex:259--276` 的完整描述，所以机制我按描述复述，细节标 [未核]。

第一步是把窗口示性换成指数族的有限组合。目标是 $V_l(S)=\frac1{|I_l|}\mathbb P_{\mathrm{split}}(x_b\in I_l\mid S)$，其中 $x_b=\log b/B\in I=[1/2,3]$。我的做法（也是 `introduction.tex:259--264` 的说法）是对 $y=e^{-x}$ 用多项式逼近：$x\in[1/2,3]$ 对应 $y\in[e^{-3},e^{-1/2}]$，多项式在该区间上按最大模稠密于连续函数，于是存在固定次数 $n$ 的多项式 $q(y)$ 使 $\|\mathbf 1_{I_l}-q(e^{-x})\|_{L^2}$ 小于给定精度（在密度 $f_{1/2,B}(x)\asymp x^{-1/2}$ 意义下）。展开 $q(y)=\sum_{v=0}^{n}a_vy^v$ 就得到

\[
 \Prob_{\mathrm{split}}(x_b\in I_l\mid S)
 \approx\sum_{v=0}^{n}a_v\,\mathbb E_{\mathrm{split}}
 \bigl[e^{-v\log b/B}\mid S\bigr]
 =\sum_{v=0}^{n}a_v\prod_{p\in S}\frac{1+p^{-v/B}}{2},
\]

误差均方小。右端在整数端点上恰是 §4 里那个 $G_{B,v}$：`labels.tex:228--241` 已经给出 $G_{B,v}(m)=\prod_{p\mid m,\,p\in P_B}(\frac12+\frac12p^{-v/B})$，取 $P_B=\mathcal P$ 时逐点相同。这一步是全篇的枢纽，它把"核的特征分解"与"§5 的短平均零界"接在同一族函数上，而我原先以为需要的是某种乘性函数的谱分解。

第二步是滞后因子的分解。系数 $c_{l,B}(j,s)$ 分成 $|j|$ 的算术因子与 $(|j|/T,s)$ 的光滑因子；`conclusion.tex:161` 的命题（[未核]）说前者在滞后上按均值可被一个固定的周期函数逼近。做法我按 `introduction.tex:267--273` 复述：为达到所需精度取固定的小 $\delta>0$，把每个位置块分成固定个数、长度随 $T$ 增长且不超过 $\delta T$ 的区间；在同一对区间内归一化滞后变动至多 $2\delta$，于是光滑因子在该对内可当作常数；再把那个周期因子按固定剩余类解出，得到形如

\[
 \sum_{\substack{i\in\mathcal I\\k\in\mathcal J\\k-i\equiv r\ (\mathrm{mod}\,D)}}
 w_1(i)w_2(k)\,\mathcal L_{ik}
\]

的和，其中 $\mathcal I,\mathcal J$ 是那两个区间、$D$ 与 $r$ 是解周期因子时出现的固定模与剩余。非对角项按端点类型展开后，恰是 §5 中带权短平均的乘积形状：内和对移位 $i$ 加权 $G_{B,v}$ 与 $\mathbf 1_{i\equiv r\ (\mathrm D)}$，外层对 $n$ 在 $[s_0Tx,s_1Tx]$ 上取均方。于是 `labels.tex:245--262` 那条零界直接把它压到 $0$。

第三步是收尾。`conclusion.tex:217` 的主能量消失命题说（[未核] 原式）在迭代极限 $B\to\infty$ 后 $\limsup_{x\to\infty}$ 下有 $I_{2,x}/(BT)\to0$；而 §6 的正能量给出 $\liminf_{B\to\infty}\liminf_{x\to\infty}I_{2,x}/(BT)\ge c_5>0$，且 $c_5$ 与充分大的固定 $C_*$ 无关。两者在同一迭代次序下不可能同时成立，反证闭合，混合去相关命题（`labels.tex:207--216`）对每个 $J$ 与每两组相位成立。

我把这三步的次序在意的地方说清楚：先是均方（能量），再是有限组合（特征），最后才是短区间取消。若我按"先取消再组合"的顺序写，会需要逐点的类型一致界，而 §9 明确拒绝了逐点条件二阶矩（`moments.tex:688--689`）。素材选择的正是弱的那一条，这也是它能容忍 $B$ 依赖核的原因。

矛盾用掉的是"每个可能的坏尺度列都有子列"这一选取，`introduction.tex:303--305` 说明：反证适用于每一种可能的坏原始尺度列的一个子列，因此得到完整的普通极限。分箱数据、特征次数、剩余模与除数乘子都在那个内层极限里固定。

## §14 分布一节：从混合去相关一路走回 $\rho$，最后拿到 $\frac12$

这一节我是逐行读完的（`distribution.tex:1--315`），因为它是唯一一处能检验"前面的机器到底交付了什么"的地方。

开头把中心化加回去（`distribution.tex:14--19`）：

\[
 \lim_{x\to\infty}\frac1x\sum_{1\le n<x}\overline{g_x(n)}f_x(n+1)=\overline{\mu_g}\,\mu,
\]

其中 $x$ 跑遍正整数；$\overline{g_x(n)}$ 的均值由单变量分布引理及其初段延拓趋于 $\overline{\mu_g}$。反演用的群在 `distribution.tex:24--41`：计数向量 $\boldsymbol b_x(m)=(\Omega_{\mathcal B_{k,x}}(m))_{1\le k<J}$ 的每个坐标落在 $\{0,\dots,J\}$（每个被计的素因子都超过 $x^{1/J}$），所以按模 $J+1$ 约化在计数向量集上是单射；取 $\zeta_0=\exp(2\pi i/(J+1))$，对 $\boldsymbol r\in\{0,\dots,J\}^{J-1}$ 有精确恒等式

\[
 \mathbf 1_{\{\boldsymbol b=\boldsymbol r\}}
 =\frac1{(J+1)^{J-1}}\sum_{\boldsymbol h\in\{0,\dots,J\}^{J-1}}
 \zeta_0^{\boldsymbol h\cdot(\boldsymbol b-\boldsymbol r)}.
\]

在 $n$ 与 $n+1$ 各代一次，就把任意一对"计数向量的固定函数"的极限期望分解成各自期望之积。`distribution.tex:42--48` 交代了两个我原先担心的技术点：两组相位是各自独立选的，共轭只是把可用的单位根相位重排；求和范围平移对一个有界边缘平均只改 $O(1/x)$。

有理阈值到实阈值的过渡在 `distribution.tex:50--55` 与 `distribution.tex:186--211`。若 $c,d\in(0,1)$ 有理，取 $J$ 使二者都是格点；$m\le x$ 时 $P^+(m)\le x^c$ 恰好是"所有下端点不小于 $x^c$ 的箱计数全为零"，于是阈值 $x^c,x^d$ 的联合光滑事件密度是两边缘极限之积。对实指数，给定 $X$ 令 $x=\lfloor X\rfloor+1$，则 $x/X\to1$、整数区间 $n\le X$ 与 $n<x$ 一致，且对充分大 $X$ 有 $x^{c_-}\le X^c\le x^{c_+}$、$x^{d_-}\le X^d\le x^{d_+}$，夹住后取下上限、再让有理指数趋于 $c,d$：

\[
 \lim_{X\to\infty}\frac1X\#\{2\le n\le X: P^+(n)\le X^c,\ P^+(n+1)\le X^d\}
 =D(c)D(d)=\rho(1/c)\rho(1/d).
\]

丢掉 $n=1$ 至多改一个求和项。

边缘识别是我最喜欢的一段，因为它把古典定理从我们自己的矩里重新造出来。设 $c=k_0/J$，令 $N_{c,x}(m)=\sum_{k=k_0}^{J-1}\Omega_{\mathcal B_{k,x}}(m)$，则 $P^+(m)\le x^c$ 等价于 $N_{c,x}(m)=0$，且 $0\le N_{c,x}(m)\le J$；对非负整数 $z$ 记下降阶乘 $(z)_h=z(z-1)\cdots(z-h+1)$、$(z)_0=1$，有有限包含排除恒等式

\[
 \mathbf 1_{\{N_{c,x}(m)=0\}}=\sum_{h=0}^{J}\frac{(-1)^h}{h!}(N_{c,x}(m))_h,
\]

以及下降阶乘的多项式恒等式

\[
 (N_{c,x}(m))_h=\sum_{\substack{r_{k_0},\dots,r_{J-1}\ge0\\ r_{k_0}+\cdots+r_{J-1}=h}}
 \frac{h!}{\prod_k r_k!}\prod_{k=k_0}^{J-1}\bigl(\Omega_{\mathcal B_{k,x}}(m)\bigr)_{r_k}.
\]

对每项用逐因子矩极限的初段形式（$k<k_0$ 时取 $r_k=0$），多项式系数正是"把 $h$ 个有序变量分配到各箱"的计数，于是那些单纯形积分合并成 $(c,1]$ 上的一个：

\[
 \lim_{x\to\infty}\frac1x\sum_{1\le m\le x}(N_{c,x}(m))_h
 =\int_{\substack{s_1,\dots,s_h\in(c,1]\\ s_1+\cdots+s_h\le1}}
 \prod_{i=1}^h\frac{ds_i}{s_i}.
\]

代入 $s_i=cv_i$ 后每个 $v_i$ 的上界由 $v_1+\cdots+v_h\le1/c$ 自动给出，把下边界从 $v_i>1$ 改成 $v_i\ge1$ 不改积分值，于是有理光滑密度是 $H(1/c)$，其中

\[
 H(u)=1+\sum_{h\ge1}\frac{(-1)^h}{h!}I_h(u),\qquad
 I_h(u)=\int_{\substack{v_1,\dots,v_h\ge1\\ v_1+\cdots+v_h\le u}}
 \prod_{i=1}^h\frac{dv_i}{v_i},
\]

和式局部有限，因 $h>u$ 时 $I_h(u)=0$；特别地 $1/c\le J$ 保证这与上面的有限包含排除一致。延迟恒等式在 `distribution.tex:129--138`：对 $h\ge1$、$y>z\ge1$，用对称性与 $1=(v_1+\cdots+v_h)/(v_1+\cdots+v_h)$ 得

\[
 I_h(y)-I_h(z)=h\int_z^y I_{h-1}(t-1)\frac{dt}{t},
\]

做法是先用对称性再约掉最后一个分母、令 $t=v_1+\cdots+v_h$，余下变量满足 $v_1+\cdots+v_{h-1}\le t-1$；$h=1$ 时同式。于是各 $I_h$ 连续、$H=1$ 在 $[0,1]$ 上、且 $uH'(u)=-H(u-1)$（$u>1$）；在区间 $[k,k+1]$ 上逐次积分由 $[0,1]$ 上的值唯一决定连续解，故 $H=\rho$。无理 $c$ 用 $c_-<c<c_+$ 夹逼加 $\rho$ 在有限点 $1/c$ 的连续性。

我在这一段学到的东西超出本单：包含排除产生的单纯形积分自己满足延迟方程，这就把"我们的矩极限对不对"与"$\rho$ 是不是唯一解"两件事分开验证，任何一侧出错都会露出来。

`distribution.tex:156--173` 顺带把边缘律的端点行为取干净：$0\le\rho(u)\le1$、延迟方程使 $\rho$ 在 $[1,\infty)$ 上不增、其在无穷处的极限必为零（若极限 $L>0$，积分 $\rho'(u)=-\rho(u-1)/u\le-L/u$ 与非负性矛盾）。于是

\[
 D(t)=\begin{cases}0,&t\le0,\\ \rho(1/t),&0<t<1,\\ 1,&t\ge1\end{cases}
\]

是连续分布函数（含零点与一点），其概率测度无原子。

上尾独立在 `distribution.tex:213--238`，它是 Erdős--Pomerance 原文讨论的那个形式：

\[
 \lim_{X\to\infty}\frac1X\#\{2\le n\le X: P^+(n)>X^c,\ P^+(n+1)>X^d\}
 =(1-D(c))(1-D(d))\qquad(0\le c,d\le1).
\]

内部指数由包含排除从固定尺度律与两个边缘律得到；$n+1$ 的边缘就是上面那条，因为平移计数范围只改 $O(1)$ 项；把严格比较改成非严格同极限，理由是固定 $c>0$ 时 $P^+(m)=X^c$ 除非 $X^c$ 是素数 $p$ 否则不可能，而那种情形下所有这样的 $m$ 被 $p$ 整除，$m\le X+1$ 中只有 $O(X^{1-c}+1)=o(X)$ 个；指数为零时上尾条件对所有 $m\ge2$ 成立、等号只可能在 $m=1$；指数为一时上尾条件在 $m\le X+1$ 中只有 $O(1)$ 个整数。右端由 $D$ 的连续性在 $[0,1]^2$ 上连续。

移动阈值那步（`distribution.tex:240--260`）用的技巧我抄进自己的备忘：对固定 $\varepsilon\in(0,1)$，一致地对 $\varepsilon X\le n\le X$ 有 $X^{c_-}\le n^a\le X^{c_+}$、$X^{d_-}\le n^b\le X^{d_+}$，于是下指数的固定尺度事件含于移动阈值事件、后者含于上指数事件；被丢掉的初段在归一化计数里至多 $\varepsilon+O(1/X)$；先用 $\varepsilon\downarrow0$，再让指数趋于 $a,b$，靠 $D$ 的连续性收尾。这里的关键是"先扔掉一个固定比例的初段"，否则 $n^a$ 与 $X^a$ 之差在 $n$ 靠近 $0$ 时不可控。

序密度那一步（`distribution.tex:262--314`）比我预想的更短。取 $U_n=\log P^+(n)/\log n$、$V_n=\log P^+(n+1)/\log n$， empirical 的法律就是均匀抽样 $2\le n\le\lfloor X\rfloor$，归一化 $1/(\lfloor X\rfloor-1)$ 与 $1/X$ 之比趋于 $1$。第二坐标可以略超 $1$，但 $n\ge N\ge2$ 时

\[
 0\le V_n\le\frac{\log(n+1)}{\log n}\le1+\frac1{N\log N},
\]

所以经验律族是紧的、每个极限律支撑在 $[0,1]^2$ 上；把 $V_n$ 夹成 $\widetilde V_n=\min(V_n,1)$ 后，对 $0<a,b<1$ 其联合分布函数与 $(U_n,V_n)$ 完全相同，故由主定理趋于 $D(a)D(b)$；这些内部矩形决定极限概率律（质量随 $a,b\uparrow1$ 趋于 $1$，有限差分给出所有内部网格胞的质量），用这种网格逼近 $[0,1]^2$ 上的连续函数即得弱收敛到以 $D$ 为边缘分布函数的乘积律；去掉夹取由上面那条界与 $n<N$ 比例趋于零完成。设 $U,V$ 独立、分布函数为 $D$，连续性给 $\mathbb P(U=V)=0$，交换性给

\[
 \mathbb P(U<V)=\mathbb P(V<U)=\frac12,
\]

集合 $\{(u,v):u<v\}$ 的边界是对角线、乘积质量为零，故弱收敛给出 $\frac1X\#\{2\le n\le X:U_n<V_n\}\to\frac12$；由于两个对数尺寸有相同的正分母，$U_n<V_n$ 恰是 $P^+(n)<P^+(n+1)$；对 $v<u$ 同一连续性集合论证给出反向序。`distribution.tex:312--314` 强调这里用的对称性属于独立的极限律，不假设有限相邻整数对的任何对称性。这句是给我这种人写的：我一开始就试图在有限层面找一个 $n\mapsto n+1$ 的对合，那是找不到的。

## §15 常量对照表之外：三处我仍然不完全信服的地方

把散在各节的数摆在一起看最能发现设计。$T=\lfloor B^{0.32}\rfloor$ 与 $h_0=(1-\log2)/2$ 通过 $2(h_0+\tau\log2)<0.32$ 绑定；$P_0=B^{1000}$ 通过 $T<P_0$、$q\le B^{15}<P_0$、$O(B^2\log B/P_0)=o(1)$ 与 $O(M^2/P_0)$ 四条同时绑定；$\ell=\log R$、$R=B/\log P_0$ 给出正则性栅格 $(g/2\pm\tau)\ell$ 的中心值，也就是"$\log b$ 的期望落在 $\frac12\log P_0$"这件事的对数形式。误差等级是分层设计的：$O(B^{-50})$ 服务加性相位的局部律、$O(B^{-80})$ 服务对数坐标的分布函数（因为它要被分部求和乘上 $B$ 后仍留 $o(1/B)$）、$B^{-.21}$ 与 $B^{.009}$ 服务二阶矩的指数预算、$B^{-0.4}$ 与 $N^{0.8}$ 服务上界筛的余项。

$1-\log2=0.3068528\ldots$ 同时出现在两处，我核对得有点惊讶：一处是 $2h_0$，另一处是 $\rho(2)=1-\log2$。素材只在前者用它，但我倾向认为这不是巧合，$h_0$ 来自"$\nu_{1/2}$ 的一个乘积的质量界"，而 $\nu_{1/2}$ 的对数密度是 $s^{-1/2}$ 型，其归一化常数里出现 $\log2$ 是很自然的。[推测] 若真要改写指数条件，$0.32$ 与 $1-\log2$ 的关系就是硬约束。

三处不完全信服，如实写下。

第一处是 $B^{.009}$（`moments.tex:161`）。重数上界只要慢于任何固定幂就够用，但 $0.009$ 与 $0.2328$ 相加仍远小于 $0.229$ 的门，指数上留了二十多倍的余量；我怀疑作者把重数引理证的时机放在最后，导致这个数是被"够用即可"决定的。若日后有人要把 §12 的公共度事件做成逐点事件，$B^{.009}$ 就不够了。

第二处是 $\eta T\le|j|\le T$ 的排除段（`moments.tex:153`）。$\eta$ 只在一处出现（与 $C_6$ 同时固定，`moments.tex:15`），而我读到的三处使用都默认了 $|j|\ge\eta T$；小滞后那部分要如何在能量里补回来，我在 §13 的区间分划叙述里只能靠"归一化滞后在成对区间内变动至多 $2\delta$"来猜。[未核] 这一处我承认自己没读懂它的归属，可能在 `conclusion.tex:161--217` 的周期逼近里，也可能在 §12 的度事件里被直接当作零质量丢掉。

第三处是 $z=1/4$。两个值 $\{1/4,1/2\}$ 在 `arithmetic.tex:61--65` 并列出现，我读到的一切使用点都只需要 $1/2$（公平拆分与 $D_B$ 的两个系数乘积）。$1/4$ 最可能的出处是两个独立 $\nu_{1/2}$ 律的公共部分（同一素数被两边都选中），[推测] 它在 `amplification.tex:380--430` 的二拆分里被用到，但我在那里只核对了 $1/(2p)$ 的耦合与 $O(1/p^2)$ 的代价，没有把 $1/4$ 的必要性钉死。

## §16 取证范围、我留下的缺陷与位置申报

取证实际读取（全文窗口逐行读）：`main.tex:1--31`、`preamble.tex:1--49`、`introduction.tex:1--305`、`distribution.tex:1--315`、`labels.tex:1--60` 与 `labels.tex:201--345`、`amplification.tex:1--130`、`amplification.tex:294--430`、`amplification.tex:560--700`、`arithmetic.tex:1--120`、`arithmetic.tex:173--235`、`arithmetic.tex:300--360`、`arithmetic.tex:440--475`、`arithmetic.tex:660--760`、`graph.tex:1--140`、`graph.tex:190--320`、`moments.tex:1--60`、`moments.tex:150--175`、`moments.tex:630--700`、`channels.tex:19--52`，另有一次全文标题扫描（各节与小节的行号即由此得来，也给了我引用位置的下界）。

未逐行读取、只按标题与行号引用的分文件：`labels.tex:61--200`、`amplification.tex:131--293`、`arithmetic.tex:121--172`、`arithmetic.tex:236--299`、`arithmetic.tex:361--439`、`arithmetic.tex:476--659`、`graph.tex:141--189`、`graph.tex:321--终`、`moments.tex:61--149`、`moments.tex:176--629`、`moments.tex:630-698--终`、`channels.tex:1--18`、`channels.tex:53--终`、`kernel.tex` 全文、`sampling.tex` 全文、`conclusion.tex` 全文。§10 到 §13 四节因此大量使用 [未核] 与 [推测] 标注，其机制叙述一部分来自 `introduction.tex:102--305` 的方法节（那里逐条给了口号级的陈述），一部分是我按已读输入反推的。这一批缺陷的类别是"陈述保真度不足"，凡涉及具体上界形式处我都留在原地没有补造。

已落盘内容中的缺陷，按类别登记如下，我不做任何回改。

第一类是首块体量。首块（§0 到 §3）实测 14,559 字节，低于目标带 15,000 的下限，属首块偏小类缺口；落盘后立刻以追加方式把它追回，现全文见收工检查中的实测值。

第二类是行内代码引用的闭合符打错。我在五处把闭合反引号打成数学开定界符，形态都是"文件.tex:起--止"后接一个定界符字符，使所在行的定界符计数变奇。发现位置在收工前的逐行奇偶自查中，按规格允许的处理是就地把那五处改回反引号，我逐处只改那一个字符，未触碰同段其它字节。这五处分别落在 §6 的剖面保持段末、§8 的独立根比较段首、以及 §11 的三个动作段首（去截断、细直方图与剩余平均、阿基米德反演）。改后全文逐行奇偶为零。

第三类是素材序言自定义宏未展开。概率测度的那个单字母宏被我在 11 处公式里照抄，集中在 §6 的二拆分概率、§7 的局部律、§10 的测度设置、§11 的阿基米德反演段与 §13 的特征展开式里；其余记号（期望、示性函数、数集、有限化整数环、最大素因子）都已按标准写法展开。这一类我不做就地替换。

第四类是转折连读禁串。全文命中四处，形态为"转折副词接肯定"的两字与三字连读，分别落在 §2 路线三的末尾段、§3 第一步的末尾句、§4 计数向量有限性的末尾句、§7 权重设计段的末尾句。这一类属可机械清理。

第五类是未翻译的英文词残留。共四处普通词（§7 一处动词、§9 两处限定词、§14 一处形容词）与一处英文缩略语（§2 路线三提到的那类素数间隙障碍的三字母缩写）。另有两处德语与芬兰语人名变音我没有转写，按人名处理。

第六类是段落引导的加粗。§2 与 §3 用了行首加粗标记做段落引导，共六处，属接近装饰性加粗清单的形态，申报由本体侧判定。

第七类是节序。我的节序按"问题到零件再到闭合"的依赖排（§4 标签、§5 短区间、§6 放大、§7 算术、§8 图、§9 矩、§10 通道、§11 核、§12 采样、§13 矛盾、§14 分布），与素材的装配序（§0 已逐字列出）不同处在于：素材把算术节排在放大节之前，我把放大节写在前，因为 $D_B$ 的归一化疑问是我在 §6 现场提出、到 §7 才结清的；编号连续、物理排布与编号一致，无重号。

另有一条不属于缺陷但我愿意记下：§8 的候选计数我核到单个端点的 $2^{(1+2\tau)\ell}=B^{\log2+o(1)}$，整块 $O(B^4)$ 与矩阵总质量 $O(B^{10})$ 的其余指数没有逐项复算，写在这一节的正文里，并非勘误里，以免读者以为那是已验证的数。

## §17 常量与依赖台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $P^+(n)$ | 最大素因子，约定 $P^+(1)=1$ | introduction.tex:3 | 主定理与边缘律 | 反演示性恒等式失配 |
| $\rho$ | 延迟方程 $u\rho'(u)=-\rho(u-1)$ 的连续解 | introduction.tex:8 | 联合律右端 | 边缘识别失去唯一性 |
| $a,b$ | 固定于 $(0,1)$ | introduction.tex:20 | 移动阈值夹逼 | 上下指数区间不可控 |
| $J$ | 任意固定整数 $\ge2$ | introduction.tex:105 | 分箱与有限反演 | 模 $J+1$ 单射失效 |
| $\mathcal B_{k,x}$ | $(x^{k/J},x^{(k+1)/J}]$ | labels.tex:15 | 计数向量定义 | 值域不再有限 |
| $\Omega_E(n)$ | 按重数计的素因子个数 | labels.tex:17 | 两条标签 | 事件展开断 |
| $\zeta_k,\xi_k$ | 两组无约束单位模相位 | labels.tex:19 | 独立性提取 | 非主部可与特征对齐 |
| $f_x,g_x$ | 完全乘性、模恒为 $1$ | labels.tex:23 | 混合去相关 | 均值极限不存在 |
| $\mu,\mu_g$ | 极限均值，$\lvert \mu\rvert \le1$ | labels.tex:51 | 中心化 $F_x=f_x-\mu$ | 常数项残留在平均里  |
| $\zeta_0$ | $\exp(2\pi i/(J+1))$ | distribution.tex:32 | 有限反演 | 分箱事件不可线性展开 |
| 极限次序 | 先 $x\to\infty$ 后 $B\to\infty$ | introduction.tex:300 | 全部迭代极限 | 两方向结论不兼容 |
| 混合去相关 | 平均趋于 $0$ | labels.tex:212 | 联合律 | 全篇主命题断 |
| $P_B$ | 有限素数集，$\min P_B\to\infty$ | labels.tex:224 | 权重 $G_{B,v}$ | 与固定剩余坐标不独立 |
| $G_{B,v}$ | $\prod_{p\in P_B,\,p\mid m}(\frac12+\frac12p^{-v/B})$ | labels.tex:229 | 短平均权与特征展开 | §13 的替换断 |
| $T(B)$ | 趋于无穷的移位尺度 | labels.tex:247 | 短平均归一化 | 均方界失去尺度 |
| $L_B$ | 连续移位个数，趋于无穷 | labels.tex:247 | 内层平均 | 取消不可见 |
| $r(H)$ | 趋于 $0$ 的函数 | labels.tex:296 | 实短区间比较 | 主部换不到长平均 |
| $(1+M)e^{-M}$ | 复短平均主因子 | labels.tex:316 | 非主部控制 | 特征扭不消失 |
| $\beta_*$ | 严格正的剖面积分 | amplification.tex:13 | 下界 $d_0\beta_*$ | 正能量无来源 |
| $\rho_0,\psi$ | 固定的无穷可微紧支撑函数 | amplification.tex:18 | 系数支撑窗口 | $B$ 依赖泄进形状 |
| $D_B$ | 哈尔均值不小于 $d_0$ | amplification.tex:92 | 剖面保持 | 正下界丢失 |
| $\lVert D_B\rVert_2$ | 有界，界可含 $C_*$ | amplification.tex:90 | 替换误差 $O_{C_*}(\varepsilon)$ | 逼近步骤断 |
| $d_*$ | 一阶矩极限，正常数 | amplification.tex:322 | 选取 $d_0<d_*/2$ | 均值下界断 |
| $\frac1{2p-1}$ | 条件化后的入选概率 | amplification.tex:354 | 余下子集正则性 | 条件独立性断 |
| $O(B^2\log B/P_0)$ | 二拆分耦合总代价 | amplification.tex:422 | 模型矩与哈尔矩一致 | 二阶矩界断 |
| $c_5$ | 与 $C_*$ 无关的正能量界 | amplification.tex:648 | 矛盾两端之一 | 能量可正可零 |
| $I_{2,x}^{\mathrm{diag}}/(BT)$ | 迭代极限为 $0$ | amplification.tex:667 | 非对角成图 | 只剩对角无结构 |
| $a-b=jc$ | 整数 $j$ 满足 $0<\lvert j\rvert\le T$ | graph.tex:21 | 换元成立的前提 | 加法滞后无从出现 |
| $n'=bl_a$ | 双射重编号 | graph.tex:27 | 标签在固定乘子下不变 | 端点尺寸迁移断 |
| $\Psi_s$ | 四个光滑因子的乘积 | graph.tex:73 | 光滑因子对齐 | $O_B(1/x)$ 误差不可弃 |
| $\mathcal K_j(u,s)$ | 非负、有限剩余依赖 | graph.tex:95 | 边核与割范数 | 矩阵不可测度化 |
| 核的对称式 | $\mathcal K_j(u,s)=\mathcal K_{-j}(u+j,s)$ | graph.tex:110 | 反向滞后配对 | 行列配对断 |
| $\Sigma(j)$ | 满足 $\frac1T\sum_{0<\lvert j\rvert\le T}\Sigma(j)\ll1$ | moments.tex:668 | 行平方和求和 | 界 $B^{-.21}$ 失 |
| $O(B^{10})$ | 矩阵总质量的确定界 | graph.tex:230 | 先丢小概率误差 | 采样无可用上界 |
| $O(M^2/P_0)$ | 位点律耦合失败概率 | graph.tex:202 | 独立位点比较 | 与 $\mathcal L$ 不可比 |
| $k_B$ | 独立律下 $K$ 的均值，$\ll1$ | graph.tex:234 | 以均值替换 $K(m)$ | 单位点分解断 |
| $B^{.009}$ | 表示重数的倾斜期望界 | moments.tex:161 | 二阶矩合并 | 吃满单个表示的节省 |
| $\kappa_1$ | $0.232867951\ldots$ | moments.tex:48 | 指数预算 | 与 $0.229$ 的门冲突 |
| $B^{-.21}$ | 逐行平方和的积分界 | moments.tex:27 | 公共度事件与集中不等式 | 有界差异失效 |
| $T$ | $\lfloor B^{0.32}\rfloor$ | arithmetic.tex:15 | 滞后范围与块长 | 指数不等式链断 |
| $P_0$ | $B^{1000}$ | arithmetic.tex:15 | 粗糙截断与全变差 | 耦合误差不可控 |
| $R$ | $B/\log P_0$ | arithmetic.tex:17 | $R^{3/2}$ 与欧拉乘积相消 | 边质量界断 |
| $\ell$ | $\log R$，与 $\log B$ 同阶 | arithmetic.tex:17 | 正则性栅格中心 | 正则集概率趋零 |
| $A_0,K_0$ | 乘积恒等于 $B2^{-\lvert S\rvert}$ | arithmetic.tex:37 | 公平拆分解释 | 放大器归一化失衡 |
| $z$ | 取 $\frac14$ 与 $\frac12$ | arithmetic.tex:63 | Selberg--Delange 展开 | 对数密度主项不存在 |
| $c_0(z)$ | $G_z(1)/\Gamma(z)>0$ | arithmetic.tex:118 | 移动截断的系数渐近 | Mertens 折减断 |
| $B^{0.89}$ | $\log Y$ 的下界指数 | arithmetic.tex:177 | 由 $D$ 定 $H$ | 余项压不住 $B^{-D}$ |
| $q\le B^{15}$ | 局部律允许的模 | arithmetic.tex:318 | 大弧归约 | 加性相位输入不可用 |
| $O(B^{-80})$ | 单位类上的分布误差 | arithmetic.tex:338 | 分部求和乘 $B$ | 一阶矩的 $o(1)$ 失 |
| $\nu_{1/2}(n)$ | $\ll A_0(n)/(Bn)$ | arithmetic.tex:348 | 行均值界 | $\Sigma(j)/T$ 那条断 |
| $h_0$ | $(1-\log2)/2$ | arithmetic.tex:705 | 三条严格指数不等式 | $T$ 的指数与权重量级冲突 |
| $e^{-c_3C_*}$ | 正则性损耗 | arithmetic.tex:732 | 使 $d_0$ 与 $C_*$ 无关 | 正下界随 $C_*$ 退化 |
| $\delta_B$ | $\asymp B^{-11/10}$ | channels.tex:34 | 对数细格常数化 | 密度振荡不可控 |
| $I$ | $[1/2,3]$ | channels.tex:28 | 粗特征 $V_l$ 的支撑 | 逼近次数失控 |
| $m_1$ | 固定的粗分划个数 | channels.tex:30 | 令 $n_B$ 为其倍数 | 边缘格残差留下 |
| $M$ | $\lceil C_6T\rceil$ | introduction.tex:217 | 块结构与归一化滞后 | 分划内滞差不受控 |
| $\eta$ | 固定小正数 | moments.tex:15 | 排除 $\lvert j\rvert<\eta T$ | 小滞后归属不明 |
| $D(t)$ | 分段定义的连续分布函数 | distribution.tex:164 | 弱收敛与对角质量 | 序密度推论断 |
| $I_h(u)$ | 单纯形上的乘积积分 | distribution.tex:119 | 验证 $H=\rho$ | 延迟方程不可校 |
| $O(X^{1-c}+1)$ | 等号事件的例外规模 | distribution.tex:232 | 严格与非严格同极限 | 边界指数处理断 |
| $\varepsilon+O(1/X)$ | 丢弃初段的代价 | distribution.tex:253 | 移动阈值夹逼 | 主定理不可夹 |
| $1+\frac1{N\log N}$ | 第二坐标的过冲上界 | distribution.tex:280 | 经验律族的紧性 | 极限律越出单位平方 |
| $\frac12$ | 两种序的自然密度 | introduction.tex:47 | 推论的结论 | 无（这是结论本身） |
| $0.280$ | 此前已知的最好下密度 | introduction.tex:70 | 历史对照 | 无（对照数值） |
