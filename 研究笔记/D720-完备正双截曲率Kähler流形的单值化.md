# D720 反推思维链笔记：完备正双截曲率 Kähler 流形的单值化

## §0 登记与导读

这篇笔记的对象是一篇 2026-09-23 定稿的论文，标题是《Uniformization of complete Kähler manifolds with positive bisectional curvature》，作者署名 OpenAI（`main.tex:14`、`main.tex:57`）。它宣告的结果只有一句：完备连通非紧的 Kähler 流形，若全纯双截曲率处处严格为正，则双全纯等价于复欧氏空间 $\mathbb{C}^n$（`main.tex:85--88`、`introduction.tex:8--13`）。论文把它写成 Yau 单值化猜想的肯定解答，对任意复维数 $n\ge1$ 成立。

我给自己设定的角色是"当时正在做这件事的我"，所以下面不按论文的正向次序复述，改从结果往回推：当初为什么敢猜这个结论、先试了哪几条路、每条卡在什么地方、哪个瞬间思路被掰过来、最后的证明骨架与最初的设想差多远。

取材范围与体量：唯一来源目录是 `preprints/Uniformization-of-complete-Kahler-manifolds-with-positive-bisectional-curvature-September-23-2026`，其 `build/` 下共 12 个 `.tex`，实测字节为 `main.tex` 3,794、`sections/introduction.tex` 13,977、`sections/preliminaries.tex` 23,165、`sections/flow.tex` 38,015、`sections/discs.tex` 32,952、`sections/variation.tex` 39,358、`sections/ellipsoids.tex` 23,166、`sections/charts.tex` 48,682、`sections/dynamics.tex` 30,915、`sections/uniformization.tex` 15,331、`bibliography.tex` 16,586、`unicode-map.tex` 3,904，合计 289,845 字节，与派单参数一致。这份素材属于厚素材：没有单文件超过 150,000 字节，但主干章节都过万，所以取证时按段落窗口读，不整份读。

章节安排：§1 给出初始动机与最初猜想；§2--§4 记录三条走过的错路与各自失败的原因；§5--§7 记录三个关键转折；§8--§15 按论文的证明次序把骨架钉到素材行号上；§16 回到最终思路与最初设想的差异；§17 是五列台账；§18 是勘误、取证区间与自检。凡读不到原始行号、只能推测的地方，正文相应处标 `[推测]` 并说明理由。

其他队列第 536 行号

preprints/Uniformization-of-complete-Kahler-manifolds-with-positive-bisectional-curvature-September-23-2026

## §1 初始动机与最初猜想

我最初盯上的，是 Yau 在 1982 年问题综述里的一句提问：完备非紧的 Kähler 流形 $M$，若其全纯双截曲率处处为正，是否必须双全纯于复欧氏空间（`introduction.tex:3--6`）。论文把这句话原样摆在引言开头，紧接着给出主定理：设 $M$ 是连通的非紧复流形，$\dim_{\mathbb{C}}M=n\ge1$；若 $M$ 上存在一个光滑完备的 Kähler 度量 $g$，其全纯双截曲率处处严格为正，则 $M$ 双全纯于 $\mathbb{C}^n$（`introduction.tex:8--13`）。

让我敢猜这个结论的，是低维与紧致两端的"已解"证据。复维数 $n=1$ 时，完备非紧正高斯曲率的 Riemann 曲面共形等价于平面：拓扑一侧是 Cohn--Vossen 定理，共形一侧是 Blanc--Fiala--Huber 的抛物性定理，两者合起来给出这个断言（`introduction.tex:27--31`）。紧致一侧的类比是 Frankel 猜想，Mori 与 Siu--Yau 各自给出解答，正全纯双截曲率刻画复射影空间 $\mathbb{CP}^n$（`introduction.tex:32--34`）。把两端并排看，非紧情形的自然答案是 $\mathbb{C}^n$，而真正的困难被论文一句话点破：这个刻画必须在无穷远处几何不受限的前提下成立（`introduction.tex:35--37`）。

当时的曲率约定是：对每一点 $x\in M$、每一对实单位切向量 $u,v\in T_xM$，要求 $\operatorname{Rm}(u,v,v,u)+\operatorname{Rm}(u,Jv,Jv,u)>0$（`introduction.tex:228--237`）。按 Kähler 对称性，这与 $T^{1,0}M$ 的 Griffiths 严格正性等价；当 $n=1$ 时，这个和正好等于高斯曲率 $K(x)$。所以我最初的心智模型是：这是一条"强正性把流形刚性化"的命题，$n=1$ 与紧致两个极限都已验证，中间的 $n\ge2$ 非紧情形只差把无穷远处的技术障碍搬开。

论文把假设的弱写得很清楚：严格正性只是逐点的，既不假设一致正下界 $\inf_x\inf_{u,v}\bigl(\operatorname{Rm}(u,v,v,u)+\operatorname{Rm}(u,Jv,Jv,u)\bigr)>0$，也不假设曲率上界 $\sup_x\lVert\operatorname{Rm}\rVert_g(x)<\infty$；不加体积增长 $\operatorname{Vol}B(o,r)\ge cr^{2n}$、非塌缩、Ricci 夹紧或任何拓扑假设（`introduction.tex:15--18`）。结论也只是把整个复流形 $M$ 等同于 $\mathbb{C}^n$，并不声称给定度量 $g$ 本身是欧氏度量；由此 $M$ 是 Stein 且可缩的（`introduction.tex:19--23`）。这几点合起来告诉我：任何依赖曲率有界或体积增长的现成定理都不可能直接搬用，否则就违背了问题的原始设定。

我最初的路线图很朴素：让 Kähler--Ricci 流 $h_t$ 把度量往好的方向推。论文采用实曲率约定下的归一化 $\partial_t h_t=-\operatorname{Ric}(h_t)$ 与 $\operatorname{Ric}(h)=-\partial\bar\partial\log\det h$（`introduction.tex:239--250`），其中 $\partial\bar\partial f$ 表示 $f$ 的复 Hessian，$\Delta_h f=\operatorname{tr}_h\partial\bar\partial f$。我当时的想法是，正双截曲率会强迫 $h_t$ 收敛到平坦度量；只要收敛，双全纯就手到擒来。为让这条路有抓手，我先默认流是完备的、曲率是受控的，而这个默认后来被证明正是最初三条错路的共同根子。

## §2 错路之一：直接引用有界曲率流定理

最省事的一条路是直接引用现成的定理。Cao 为 Kähler--Ricci 流建立的微分 Harnack 估计是这条路线的解析前身（`introduction.tex:60--63`）。Chau--Tam 在"有界非负双截曲率加最大体积增长"下证明了单值化（`introduction.tex:64--66`）：设 $M$ 完备非紧，双截曲率非负且有界，$\sup_M\lVert\operatorname{Rm}\rVert_g\le K$，并设 $M$ 有最大体积增长 $\operatorname{Vol}B(o,r)\ge cr^{2n}$，则 $M$ 双全纯于 $\mathbb{C}^n$。Liu 在"非负双截曲率加最大体积增长"下，用 Gromov--Hausdorff 方法与回缩全纯向量场得到同样结论，且不需要曲率上界（`introduction.tex:72--75`）；Lee--Tam 随后把度量光滑化、套用有界曲率定理，也得到同一结论（`introduction.tex:75--77`）。这些定理看起来离目标只差一步。

我一度以为，只要把假设里的最大体积增长去掉，剩下的论证会照旧走通。论文点明，Liu 与 Lee--Tam 的结果都保留了最大体积增长（`introduction.tex:77--78`）。我于是逐个检查证明里用到它的地方，发现它并不集中在某一两个引理，其影响渗透在整个方法里：Gromov--Hausdorff 极限的取法、球体积比较、向量场回缩到无穷远处，全都要靠 $r^{-2n}\operatorname{Vol}B(o,r)\ge c$ 把无穷远处的几何压成可控的。

失败的机制是这样：一旦去掉体积增长，曲率在远处可能无界 $\sup_{B(o,r)}\lVert\operatorname{Rm}\rVert_g=\infty$，区域可能塌缩，$B(o,r)$ 的体积可以远低于 $cr^{2n}$。此时相对体积比较只剩一个多项式损失 $\operatorname{Vol}B(x,1)\ge c(1+r(x))^{-2n}$（`preliminaries.tex:152--154`），它不足以替代最大体积增长给出的强控制。于是那些依赖极限几何的步骤全部断掉。

另一条更隐蔽的失败在 Cao 的 Harnack 估计上。它要在有界曲率 $\sup_M\lVert\operatorname{Rm}\rVert_g\le K$ 下使用，而这里的初始度量 $g$ 根本没有曲率上界；任何直接调用有界曲率流定理的写法，都得先证明它的前提成立，而那正是我们缺的东西。论文把这两条障碍并列写出来：初始度量可以在 $r\to\infty$ 时有界的曲率失效、并含任意塌缩的区域，所以完备有界曲率流定理或整体张量最大值原理都不能未经证明前提就使用（`introduction.tex:135--138`）。这条路到此为止。

## §3 错路之二：把收缩图当成终点

第二条路是先把局部图造出来，再设法把图拼成整体。Chau--Tam 的后续工作正是这个方向：他们发展出局部双全纯图，得到覆盖与伪凸域上的结论，并在额外的曲率衰减或夹紧条件下用孤立子极限方法推进（`introduction.tex:66--69`）。我当时的计划是：只要能造出一族收缩的全纯图 $\phi_\alpha:U_\alpha\to\mathbb{C}^n$，$M$ 就被识别为 $\mathbb{C}^n$ 里的一个真子域，剩下的只是把它撑满。

论文明确点出，一个覆盖 $M\to\mathbb{C}^n$、到某个真域 $\Omega\subsetneq\mathbb{C}^n$ 的映射、到整个 $\mathbb{C}^n$ 的双全纯，这三件事之间的区别是本质的（`introduction.tex:70--71`）。我起初不以为意，觉得这只是一句提醒；等真正去推拼图这一步时才发现，它其实是整条路线的生死线。

致命处在收缩率。若各方向的收缩率 $\lambda_1(x)\le\cdots\le\lambda_n(x)$ 变化很大，图与图之间的坐标变换 $\phi_\beta\circ\phi_\alpha^{-1}$ 就失去定量控制；只凭图存在这一条，最多得到 $M$ 是 $\mathbb{C}^n$ 的一个真子域，甚至只是一个覆盖，够不到满射。论文把这一点写成第二个必须解决的问题：仅靠收缩图只能把 $M$ 等同于 $\mathbb{C}^n$ 中的一个真域，要得到满射，就必须在收缩率显著变化时仍能定量控制坐标变换（`introduction.tex:139--142`）。

于是这条错路逼出一个真正的技术目标：把图的收缩率变成一个可以计量、可以比较的量，并让坐标变换的误差被这个量控制。这个目标后来被体积钟 $s$ 接手，也就是 §5 要讲的第三个时间标尺。反过来看，这条路之所以失败，不在于局部图造得不对，而在于我把它当成了终点。

## §4 错路之三：先完备后比较的顺序

第三条错路是一个次序上的错误。既然整条路线都要靠 Kähler--Ricci 流 $h_t$，我本能地先把"流存在且完备"证出来，再去做最大值原理与标量比较。这个次序看起来很自然：比较估计需要在一个完整的流上做，而流不完备就谈不上整体最大值原理。

论文把这个次序倒了过来。它先用一个适配于非负形式 $g-h_t$ 的空间权函数 $w$，在完备性还不知道的时候就证明标量比较；完备性反倒成了 Harnack 不等式的后续推论（`introduction.tex:146--154`）。原文特意强调这个次序很重要，并说完备性是比较估计之后才拿到的东西（`introduction.tex:153--154`）。这与我的直觉正好相反。

我现在能说清当初为什么错：我把完备性当成了比较估计的前提，而在无界曲率、可能塌缩的初始度量 $g$ 下，完备性恰恰是最后才拿得到的东西。把次序倒过来之后，像 $\rho(x,t)=\log\bigl(\det g(x)/\det h_t(x)\bigr)$ 这样的量可以先在耗竭域上估计，再让它们过关；论文正是这样做的：在耗竭域 $\Omega_j\uparrow M$ 上用完备 Hermitian 逼近构造整体流 $h_t$，并让度量与它的对数体积损失估计在极限中通过（`introduction.tex:146--151`）。

这个次序的反转还有一个副作用，后来变成了整篇证明的骨架：既然比较不依赖完备性，那么先比较、后完备的顺序就能把曲率论证与完备性论证解耦，各自用各自需要的假设。回头看，这条错路的价值在于，它把"哪一步依赖哪一步"这个问题逼到了台面上。

## §5 转折之一：三个时间标尺与体积钟

第一次真正的转折，是我意识到自己一直在用同一个"时间"装两种完全不同的信息。论文把这件事摆得很清楚：整篇证明同时用到三个时间参数（`introduction.tex:167--177`）。物理时间 $t$ 走 Kähler--Ricci 流 $h_t$，满足 $\partial_t h_t=-\operatorname{Ric}(h_t)$；对数时间 $\tau=\log t$ 用来承载联合正性与 Harnack 估计；体积钟 $s=\rho(o,t)$ 则用来计量图的收缩与多项式次数。三者各管一段，缺一不可。

第二个量就是对数体积损失 $\rho(x,t)=\log\bigl(\det g(x)/\det h_t(x)\bigr)$（`introduction.tex:149--150`）。在流的第一部分，论文还把 $P=\log(\det h_t/\det g)$、$\rho=-P\ge0$、$R_{h_t}=-P_t\ge0$ 这些恒等式一并写下，于是 $\rho$ 与标量曲率 $R$ 通过 $R_{h_t}=-P_t=\rho_t$ 直接挂钩（`flow.tex:12--19`）。这解释了为什么体积钟天然带曲率信息：$\rho$ 的时间导数就是 $R_{h_t}$。

体积钟只有在 Ricci 正定之后才严格递增，而这一点是到图表一节才证出来的（`introduction.tex:179--182`）。在此之前，$s$ 只是一个非负的量；一旦 $R_{h_t}>0$，$s=\rho(o,t)$ 就变成真正可以当坐标用的钟。论文还特意交代了一个记号上的约定：在圆盘与变分两节里，$s$ 暂时表示圆盘中心处的物理时间；从图表一节起，$s$ 才一律表示体积钟（`introduction.tex:180--182`）。我当初读到这个约定时觉得是小事，后来才明白它是在提醒：同一个符号在证明的不同阶段承载不同的几何含义。

体积钟为什么能控制收缩？关键公式是转移映射的线性行列式：设 $F_{s,u}$ 是从时钟 $s$ 处的中心酉标架到时钟 $u\ge s$ 处标架的过渡，则 $\lvert\det F_{s,u}'(0)\rvert=e^{-(u-s)/2}$（`introduction.tex:184--188`）。右边只依赖时钟差 $u-s$，与位置无关。这是把"收缩"从几何量翻译成时钟量的第一块砖：时钟每前进一单位，行列式按 $e^{-1/2}$ 收缩。

时钟在物理时间上的速度由 $q(s)=ds/d\tau=tR(o,t)$ 给出（`introduction.tex:189--190`），其中 $\tau=\log t$。所以 $q$ 就是标量曲率在体积钟上的读数，$q>0$ 当且仅当 $R(o,t)>0$。剩下的控制来自一个静态对数范数估计：它把某个 $h_t$ 酉局部标架在初始度量 $g$ 下的最大奇异长度，用最小奇异长度的固定幂次压住（`introduction.tex:191--194`）。写成不等式就是 $\sigma_{\max}\le C\sigma_{\min}^{-\theta}$，其中 $\theta>0$ 是固定指数。有了它，配合行列式损失，收缩就在每个方向上都受控，而不只是体积受控。

最后一步是选择那些 Ricci 夹紧的时间区间，用它们对环做收缩论证（`introduction.tex:195--196`）。到此为止，三个时钟各自归位：物理时间给流，对数时间给正性，体积钟给收缩率。我当初把这三件事挤在一个时间参数里，正是第三条错路的另一种表现。

## §6 转折之二：把曲率论证搬到余切丛上的圆盘泛函

第二个转折是我终于承认：在原来的切丛上做曲率估计走不通，必须换一个空间。论文把曲率论证放在全纯余切丛 $Y=T^{*(1,0)}M$ 上（`introduction.tex:156--157`、`discs.tex:7`），并在 $Y$ 上定义对偶平方范数 $N(x,\xi,t)=\lvert\xi\rvert^2_{h_t^{-1}}$（`discs.tex:9`）。这一换空间的动作看似只是记号，实际是整个证明的支点。

为什么是余切丛？因为在 $Y$ 上，$N(\cdot,0)$ 是多重次调和的：Griffiths 非正丛的全空间上的平方范数多重次调和，而 $T^{1,0}M$ 的对偶恰好取这个曲率符号（`discs.tex:11--15`）。于是 $N$ 天然带上一个凸性结构，可以用圆盘包络来从下往上夹逼。

圆盘泛函的定义是这样的：固定 $T<\infty$，对 $y\in Y$ 与 $0<s<T$，取遍全纯圆盘 $f:\overline\Delta\to Y$ 与 $w:\overline\Delta\to\mathbb{C}$（在闭单位圆盘上光滑，且 $se^{w+\bar w}<T$），令 $v^{\rm raw}(y,s)$ 为圆周平均 $\bigl\langle N\bigl(f(\zeta),se^{w(\zeta)+\overline{w(\zeta)}}\bigr)\bigr\rangle$ 的下确界（`discs.tex:17--27`）。再取下半连续正则化得到 $v$。常数圆盘、$N(\cdot,0)$ 的多重次调性和 $N(\cdot,t)\ge N(\cdot,0)$ 一起给出夹逼 $N(y,0)\le v(y,s)\le v^{\rm raw}(y,s)\le N(y,s)$（`discs.tex:29--34`）。

这个夹逼就是整个路线的发动机。左边 $N(y,0)$ 是初始范数，右边 $N(y,s)$ 是当前范数；只要证明中间的不等号都取等号，即 $v=N$，就得到 $N(x,\xi,e^{w+\bar w})$ 的次平均不等式，从而得到联合多重次调性（`discs.tex:47--49`）。我当初看到这个构造的第一反应是"这不就是 Poletsky--Rosay 的 Poisson 包络吗"；论文确实承认它源自那一套理论，并给出流形框架下的文献（`discs.tex:39--42`），但它强调这里要的是对演化范数直接证明所需的微分不等式，不依赖现成的凸体定理（`discs.tex:42--45`）。

真正把范数与时间导数连起来的，是余切丛上的标准全纯双向量 $\mathcal J=\sum_{i=1}^n\frac{\partial}{\partial x_i}\wedge\frac{\partial}{\partial\xi_i}$（`discs.tex:63--68`）。由它诱导出一个辛 Hessian 算子 $p(W,\mathcal J)$，在标准余切坐标下可写成 $p(W)=\operatorname{tr}(AC^{\mathsf T})-\sum_{i,j}B_{ij}\overline{B_{ji}}$，其中 $W=\begin{pmatrix}A&B\\B^*&C\end{pmatrix}$（`discs.tex:69--85`）。用它可以写出辛演化恒等式 $\partial_tN=p(\partial\partial_YN)$（`discs.tex:90--94`），以及对基底函数的加法公式 $p(\partial\partial_Y(N+d))=\partial_tN+\Delta_{h_t}d$（`discs.tex:95--99`）。论文特别声明这两条恒等式不假设 $h_t$ 完备或在正时间有非负曲率（`discs.tex:100--102`），这与 §4 的次序反转完全一致。

剩下的一环是定量的形变引理。它把一个几乎极小的圆盘沿任意方向变形，并给出变形的代价估计；把它作用到 $v$ 上，就得到圆盘下确界满足的粘性不等式（`introduction.tex:161--163`）。我当初以为粘性不等式会直接给出标量比较，结果发现还差一步：粘性不等式里的形式 $K$ 是逐点最优化的，需要再对每个纤维选一个椭球把它消化掉，这就是下一个转折。

## §7 转折之三：逐纤维椭球优化与粘性不等式

第三个转折是把圆盘不等式变成一个标量比较。做法是在每个余切纤维里最优化一个 Hermitian 形式（`introduction.tex:162--164`）。对每个 $(x,t)$，令 $B(x,t)$ 为最大化行列式的可行矩阵：$\det B(x,t)=\max\{\det D: D>0,\ \xi^*D\xi\le v(x,\xi,t)\ \text{对一切}\ \xi\}$，并记 $\mathcal L=\log\det B$（`ellipsoids.tex:25--31`）。可行矩阵的椭球 $\{\xi:\xi^*D\xi<1\}$ 包含 $\{\xi:v(x,\xi,t)<1\}$；最大化 $\det D$ 就是在这个纤维坐标下最小化椭球的欧氏体积（`ellipsoids.tex:32--34`）。这套最优椭球接触法是 John 的经典构造在 Hermitian 情形下的改写（`ellipsoids.tex:19--23`）。

关键在于椭球给出的量正好是体积损失。论文证明最大值存在且唯一，$\mathcal L$ 在每个全纯坐标图里下半连续，并且 $F_0:=\log\det b_t-\mathcal L$ 满足 $0\le F_0\le\rho$（`ellipsoids.tex:36--43`）。这里 $b_t$ 是 $h_t$ 的对偶矩阵。上界 $F_0\le\rho$ 意味着椭球的行列式损失被对数体积损失 $\rho$ 控制；下界 $F_0\ge0$ 意味着椭球不超过当前度量的对偶椭球。两端一夹，$F_0$ 就成了用 $\rho$ 计量的体积缺口。

唯一性的证明用的是 $\log\det$ 在正锥上的严格凹性（`ellipsoids.tex:55--64`），接触分解则用锥的封闭性与有限维分离定理：在归一化 $B=I$ 后，存在有限个单位列 $\xi_i$ 与正数 $\alpha_i$ 使 $v(x,\xi_i,t)=1$、$\sum_{i=1}^m\alpha_i\xi_i\xi_i^*=I$、$\sum_{i=1}^m\alpha_i=n$（`ellipsoids.tex:44--52`）。论文还补了一句：把每对 $(\xi_i,\alpha_i)$ 复制 $r$ 份并除以 $r$，可以把最大权重压到任意小（`ellipsoids.tex:52--53`、`ellipsoids.tex:101--103`）。这个细节我起初觉得多余，后来才看出它正是为了在后面的扰动论证里让接触点权重一致地小。

把这些拼起来，圆盘不等式就被转化成标量比较：圆盘包络的下确界 $v$ 等于演化的对偶平方范数 $N$，于是 $N$ 在空间与对数时间上联合正定，由此得到矩阵 Harnack 不等式与标量 Harnack 不等式（`introduction.tex:163--165`）。我当初的设想是先有 Harnack、再拿它证比较，实际的次序正好相反：先由圆盘与椭球把联合正性做出来，Harnack 是从联合正性里读出来的。矩阵与标量两条 Harnack 的具体形状，在图表一节写成 $A_t+Ah_t^{-1}A+t^{-1}A\ge0$ 与 $R_t+t^{-1}R+2\operatorname{Re}\partial_XR+A(X,\overline X)\ge0$（`charts.tex:29--35`），其中 $A=\operatorname{Ric}(h_t)$、$R=\operatorname{tr}_{h_t}A$。这两条不等式是后面完备性与收缩估计的全部来源。

## §8 预备：初始流形上的函数、截面与光滑化

论文把流的起点数据集中放在预备一节里，标题直译就是"初始流形上的函数、截面与光滑化"（`preliminaries.tex:1`）。这一节里的距离、球、范数与体积一律取初始完备度量 $g$；固定基点 $o$ 后记 $r(x)=\operatorname{dist}_g(o,x)$，所有常数允许依赖 $g$ 与 $o$，但不许对中心一致（`preliminaries.tex:4--7`）。这一句"不许对中心一致"我当初划了下划线：它预告了后面所有估计都是局部紧集上的，而一致性要另外挣。

第一个对象是命题式的初始解析数据（`preliminaries.tex:17--49`）。它一次给出五组东西。第一，存在光滑严格多重次调和函数 $\psi$，满足 $\psi\le C(1+r)$（`preliminaries.tex:20--21`）。第二，全纯函数与全纯切场可以在有限点集上插值任意有限阶射流；存在有限多个全纯函数定义出单射浸入 $F:M\to\mathbb{C}^N$，也存在有限多个整体全纯切场在每点张成 $T^{1,0}M$（`preliminaries.tex:22--26`）。第三，每点 $x$ 处有整体全纯标准截面 $S$，$S(x)\ne0$ 且 $\log\lvert S\rvert_g^2\le C_S(1+r)$；还有光滑函数 $\Xi$ 满足 $\partial\bar\partial\Xi\ge\operatorname{Ric}(g)$ 与 $\Xi\le C(1+r^{3/2})$（`preliminaries.tex:27--33`）。第四，存在光滑耗竭 $u\ge1$，满足 $C^{-1}(1+r)\le u\le C(1+r)$、$\lvert\partial u\rvert_g\le C$、$\lvert\partial\bar\partial u\rvert_g\le C/u$（`preliminaries.tex:34--38`）。第五，对 $L\ge1$ 有平均估计 $\frac{1}{\operatorname{Vol}B(o,L)}\int_{B(o,L)}\bigl\lvert\log\lvert S\rvert_g^2\bigr\rvert\,dV_g\le CL$ 与 $\frac{1}{\operatorname{Vol}B(o,L)}\int_{B(o,L)}R_g\,dV_g\le C/L$（`preliminaries.tex:39--45`）。命题结尾还补了两句：$F$ 与 $\psi$ 都不声称是真映射；耗竭 $u$ 有两边复 Hessian 界（`preliminaries.tex:47--48`）。

这些数据的来路各不相同，论文按顺序交代。$\psi$ 从 Busemann 函数来：取从 $o$ 出发的单位速度射线 $\gamma$，令 $b(x)=\lim_{j\to\infty}\{d_g(o,\gamma(j))-d_g(x,\gamma(j))\}$（`preliminaries.tex:53--55`）。三角不等式给出花括号内表达式的单调性与紧集上有界性，并给出 $\lvert b(x)-b(y)\rvert\le d_g(x,y)$（`preliminaries.tex:56--58`）。再用复 Hessian 比较证明 $b$ 严格多重次调和：沿最短测地段的长度第二变分的曲率项是双截曲率在去掉径向后分量的正倍数，在固定短初段上对一切单位初向量有一致正下界，而导数项是 $O(l^{-1})$，于是距离的二阶导之和至多 $-c_K\lvert X\rvert^2+O(l^{-1})\lvert X\rvert^2$（`preliminaries.tex:63--81`）。最后用 Richberg 逼近、点误差小于一，把 $b$ 光滑化成 $\psi$ 并调常数得到 $\psi\le1+r$（`preliminaries.tex:92--96`）。

截面与射流的插值走的是另一条路：把函数、标准截面、切场分别看成取值在 $K^{-1}$、$\mathbf{1}$、$T^{1,0}M\otimes K^{-1}$ 里的全纯顶形式，其中 $K=\bigwedge^nT^{*(1,0)}M$（`preliminaries.tex:98--104`）。三个系数丛分别有非负曲率、平坦、非负 Nakano 曲率；最后一个等于 Griffiths 正丛 $E=T^{1,0}M$ 的 $E\otimes\det E$，于是 Demailly--Skoda 的张量乘行列式定理可用（`preliminaries.tex:105--111`）。射流插值用权 $k\psi+\sum_{a\in A}c_m\vartheta_a\log\lvert z_a\rvert^2$（$c_m>n+m$）配合 Hörmander 的完备 Kähler $L^2$ 估计，得到 $v$ 使 $\bar\partial v=\bar\partial s_0$，再在极点附近用可积性逼出泰勒系数到 $m$ 阶为零，于是 $s_0-v$ 具有指定射流（`preliminaries.tex:113--135`）。标准截面的增长界则来自 $\lvert S\rvert_g^2$ 的次调和性与半径一球的局部中值不等式，配合 $\operatorname{Vol}B(x,1)\ge c(1+r(x))^{-2n}$ 的相对体积比较（`preliminaries.tex:137--158`）。

我当初读到"有限多个全纯函数就够了"时以为只是方便，后来看到它的证明才发现是本质的：论文用紧开拓扑空间的 Baire 性与参数横截性的维数计数论证，说明有限射流求值的满射性、矩阵秩的开性与有限覆盖能给出一个有限维扰动空间，其求值导数在给定紧族的一个邻域上满射，而该导数不依赖扰动参数（`preliminaries.tex:160--169`）。有限多个函数能在整个耗竭上同时实现单射浸入，其依据是 Baire 范畴与参数横截性的维数计数。

## §9 流的构造、正则化与标量比较

流的第一个定理就是局部化流（`flow.tex:8--34`）：存在 $M$ 上的光滑 Kähler--Ricci 流 $h_t$，$0\le t<\infty$，$h_0=g$；存在光滑实函数 $U,P,\rho$ 使 $0<h_t\le g$、$h_t=g-t\operatorname{Ric}(g)+\partial\bar\partial U$、$U(\cdot,0)=0$、$P=U_t=\log\frac{\det h_t}{\det g}$、$\rho=-P\ge0$、$R_{h_t}=-P_t\ge0$（`flow.tex:12--19`）。对每个有限 $T$ 有 $\sup_{0\le t\le T}\frac{1}{\operatorname{Vol}_gB_g(o,L)}\int_{B_g(o,L)}\rho(x,t)\,dV_g(x)\le C_TL$（`flow.tex:20--25`）；每点 $\rho(x,t)\le C_x(1+t)$（`flow.tex:26`）；并且在每个有限时间区间上存在光滑正函数 $Q$ 与 $c>0$ 使 $Q\ge c(1+r^2)$、$(\partial_t-\Delta_{h_t})Q\ge c\operatorname{tr}_{h_t}g$（`flow.tex:27--32`）。

我当初看到 $0<h_t\le g$ 与 $R_{h_t}\ge0$ 同时出现时有点意外：它们说的是流从一开始就朝变小、变正曲率的方向走，而且这个单调性不需要完备性。构造办法是完备 Hermitian 逼近：取耗竭 $u$ 的正则值 $L\to\infty$，令 $\Omega_L=\{u<L\}$，取 $[0,1)$ 上光滑非负、在 $[0,1/2]$ 为零、在 $v=1$ 附近等于 $-2\log(1-v)$ 的函数 $F$，在 $\Omega_L$ 上设 $f=F(u/L)$、$\alpha=e^fg$（`flow.tex:36--44`）。$u$ 的估计给出 $\lvert\partial f\rvert_\alpha\le C/L$ 与 $\lvert\partial\bar\partial f\rvert_\alpha\le C/L^2$（`flow.tex:45--49`）。度量 $\alpha$ 在 $\Omega_L$ 上完备，并且每个固定 $L$ 都有各阶有界几何（`flow.tex:55--64`）。

在 $\alpha$ 这个完备 Hermitian 背景上跑 Chern--Ricci 流：$K=\alpha-t\operatorname{Ric}(\alpha)+\partial\bar\partial U$、$U_t=P=\log\frac{\det K}{\det\alpha}$、$U(\cdot,0)=0$（`flow.tex:66--70`）。记 $\mathscr L_K=\partial_t-\Delta_K$，求导得到 $\mathscr L_KP=-\operatorname{tr}_K\operatorname{Ric}(\alpha)$、$\mathscr L_KP_t=-\lvert\operatorname{Ric}(K)\rvert_K^2$、$P_t(\cdot,0)\le C/L^2$（`flow.tex:78--84`），进而 $P_t\le C/L^2$、$P\le Ct/L^2$、$U\le Ct^2/(2L^2)$（`flow.tex:88--92`）。这些都是已经存在的有界几何区间上的最大值原理估计（`flow.tex:93--94`）。

标量比较的核心是一个局部化权函数。固定视界 $D>0$，设光滑 $\phi\le0$ 满足 $\alpha-D\operatorname{Ric}(\alpha)+D\partial\bar\partial\phi\ge c\alpha$（$c>0$），定义 $Q=(D-t)P+U-D\phi+nt$（`flow.tex:96--104`）。用 $\mathscr L_KU=P-n+\operatorname{tr}_K(\alpha-t\operatorname{Ric}(\alpha))$ 得到精确恒等式 $\mathscr L_KQ=\operatorname{tr}_K\{\alpha-D\operatorname{Ric}(\alpha)+D\partial\bar\partial\phi\}\ge c\operatorname{tr}_K\alpha$ 与 $Q\ge0$（`flow.tex:105--113`）。$Q$ 的初值 $-D\phi\ge0$；对 $\phi$ 加上一个消失的正倍数 proper 函数就完成了局部化（`flow.tex:114--118`）。论文用有限多个标准截面构造 $\phi$：在 $\overline{\Omega_L}$ 上无公共零点时，$\log\sum_i\lvert S_i\rvert_g^2$ 的常数平移有界、非正，且复 Hessian 至少是 $\operatorname{Ric}(g)$，从而 $\alpha-D\operatorname{Ric}(\alpha)+D\partial\bar\partial\phi\ge\alpha+nD\partial\bar\partial f\ge(1-CD/L^2)\alpha$（`flow.tex:120--128`）。于是对固定 $D$ 与足够大的 $L$ 可取 $c=1/2$，在 $0\le t\le D/2$ 上同时得到 $P$ 的两边界（`flow.tex:129--131`）。

我在这里第一次看清次序反转是怎么落地的：整套估计都在耗竭域 $\Omega_L$ 上、用完备 Hermitian 逼近做，根本没有用到 $h_t$ 的完备性；$Q$ 这个 proper 上解才是把局部估计推成整体比较的桥。

## §10 余切包络：紧性与标架

§6 已经介绍了圆盘包络的动机，这里补它的技术地基。记 $\Delta=\{z\in\mathbb{C}:\lvert z\rvert<1\}$，$dA$ 是 $\Delta$ 上的欧氏面积，$\pi:Y=T^{*(1,0)}M\to M$ 是投影（`discs.tex:5--7`）。对偶平方范数记 $N(x,\xi,t)=\lvert\xi\rvert^2_{h_t^{-1}}$（`discs.tex:9`），由局部化流定理有 $N(\cdot,t)\ge N(\cdot,0)$（`discs.tex:11--12`），而 $N(\cdot,0)$ 多重次调和（`discs.tex:12--15`）。

辛 Hessian 算子的定义依赖标准双向量。在标架 $e_1,\ldots,e_{2n}$ 里写 $\mathcal J=\sum_{A<B}J^{AB}e_A\wedge e_B$，定义 $p(W,\mathcal J)=\sum_{A<B,\,C<D}\overline{J^{AB}}J^{CD}(W_{AC}W_{BD}-W_{AD}W_{BC})$（`discs.tex:70--76`）。当 $W$ 正定时它就是诱导的外平方平方范数，对任意 Hermitian $W$ 都是实多项式，且与标架无关（`discs.tex:77--79`）。在标准余切坐标下若 $W=\begin{pmatrix}A&B\\B^*&C\end{pmatrix}$，则 $p(W)=\operatorname{tr}(AC^{\mathsf T})-\sum_{i,j}B_{ij}\overline{B_{ji}}$（`discs.tex:79--85`）。切向系数的度量矩阵 $h$ 对应到对偶范数的列矩阵是 $b=h^{-\mathsf T}$（`discs.tex:86--88`）。

辛演化引理说：对局部化流的流，$\partial_tN=p(\partial\partial_YN)$（`discs.tex:90--94`）；对每个实光滑基底函数 $d=d(x,t)$（空间 Hessian 里 $t$ 固定），$p(\partial\partial_Y(N+d))=\partial_tN+\Delta_{h_t}d$（`discs.tex:95--99`）。引理末尾再次声明这些恒等式不假设 $h_t$ 完备或在正时间有非负曲率（`discs.tex:100--102`），这与 §4 讲过的次序反转一脉相承。

证明的算法是取 $h_t$ 的 Kähler 法坐标：在那一点 $h_t=b_t=I$，$b_t$ 的一切一阶空间导数消失，$N$ 的 Hessian 分块为 $\partial\partial_YN=\begin{pmatrix}\mathcal R_\xi&0\\0&I\end{pmatrix}$（`discs.tex:104--110`）。水平形式 $\mathcal R_\xi$ 是把 $h_t$ 的双截曲率形式与 $\xi$ 的度量对偶缩并一对指标得到的；在法点对 $b=h^{-\mathsf T}$ 求两次导就给出 $h$ 的负二阶导的转置，正好是那些曲率分量（`discs.tex:111--115`）。Kähler 对称性给出 $\operatorname{tr}\mathcal R_\xi=\xi^*\operatorname{Ric}(h_t)^{\mathsf T}\xi$（`discs.tex:115--118`）；另一方面 $\partial_th=-\operatorname{Ric}(h)$ 蕴含 $\partial_tb=h^{-\mathsf T}\operatorname{Ric}(h)^{\mathsf T}h^{-\mathsf T}$（`discs.tex:119--120`）。两式相减就得到 $\partial_tN=p(\partial\partial_YN)$。

## §11 圆盘包络的微分不等式

圆盘包络的微分不等式是整个证明里技术含量最高的一步，它的陈述很干净（`variation.tex:10--27`）：设光滑实函数 $\varphi$ 在 $(y_*,s_*)$ 处（$0<s_*<T$）从下方接触 $v$；在全纯余切坐标里写 $W=\partial\partial_Y\varphi(y_*,s_*)=\begin{pmatrix}A&B\\B^*&C\end{pmatrix}$，$C>0$；则水平坐标空间上存在 Hermitian 形式 $K$ 使 $K\ge0$、$K\ge A-BC^{-1}B^*$、$\partial_s\varphi(y_*,s_*)\ge\operatorname{tr}(C^{\mathsf T}K)$（`variation.tex:18--23`）。这里 $C^{\mathsf T}$ 是这些坐标下的切向--余切缩并（`variation.tex:24`）。

我当初把它当成一个纯粹的技术引理，后来才意识到它是把圆盘几乎极小翻译成粘性不等式的唯一出口。证明的路子是先局部化几乎极小圆盘（`variation.tex:29--33`）：从 $\varphi$ 减去 $\lvert y-y_*\rvert^4+\lvert s-s_*\rvert^4$ 的正倍数，使接触在紧坐标柱 $\mathcal C\Subset Y\times(0,T)$ 上严格、只在 $(y_*,s_*)$ 取等、边界附近有正间隙（`variation.tex:41--47`），于是 $\inf_{(y,s)\in\mathcal C}\bigl(v^{\rm raw}(y,s)-\varphi(y,s)\bigr)=0$（`variation.tex:48--50`）。

第二步是造墙与面积罚项。取 $d_{0,j}(x,t)=j^{-1}Q(x,t)+\rho_j(x,t)$（`variation.tex:55--58`），则 $d_{0,j}\ge0$、$(\partial_t-\Delta_{h_t})d_{0,j}\ge0$，且在紧空间--时间集上 $d_{0,j}\to0$（`variation.tex:59--60`）。再选 $A_j\to\infty$ 使 $d_{0,j}(x,t)\ge\rho(x,t)+j$ 当 $u(x)>A_j/3$（`variation.tex:61--65`）。这就是远端墙：$u$ 超过阈值的地方，$d_{0,j}$ 已经大到把圆盘赶回来。配合截断 $\delta_1=\chi(u/A_j)$ 与 $\delta_2=\widetilde\chi(N(\cdot,0)/B_j^2)$（`variation.tex:67--73`），定义 $k_i=\delta_i^{-1}-1$ 与 $d(y,t,s)=d_{0,j}(x,t)+(1+s)(k_1(x)+k_2(y))$（`variation.tex:74--79`）。只有竞争圆盘的边界受这些空间限制，它们的闭边界区是紧集 $K_j\subset Y$（`variation.tex:80--81`）。

第三步是能量。用边界半范数 $D(a)^2=\sum_{k\in\mathbb{Z}}\lvert k\rvert\,\lVert a_k\rVert^2$（`variation.tex:86--89`），加入非负能量 $\mathcal E(f,w)=\int_\Delta\bigl(x_f^*\omega_g+f^*G^*\omega_{\rm eucl}+(\mathfrak g\circ f)^*\omega_{\rm Gr}+w^*\omega_{\rm eucl}\bigr)+D\bigl(\log(\delta_1\delta_2)\circ f\bigr)^2$（`variation.tex:91--100`），其中 $x_f=\pi\circ f$，$\mathfrak g$ 是浸入 $G$ 的 Gauss 映射（`variation.tex:101--102`）。带罚项泛函是 $\mathcal F_{j,\varepsilon}(f,w,s)=\langle N(f,t)+d(f,t,s)\rangle+\varepsilon\mathcal E(f,w)-\varphi(f(0),s)$，$t=se^{w+\bar w}$（`variation.tex:105--110`）。

论文在这里补了两条我当初没料到的保险：取下确界就够，不声称极小圆盘存在（`variation.tex:111`）；每个固定容许圆盘能量有限，每个固定圆盘最终在边界上 $\delta_1=\delta_2=1$，于是 $\mu_{j,0}\to0$、$\mu_{j,\varepsilon}\downarrow\mu_{j,0}$（$\varepsilon\downarrow0$）（`variation.tex:112--119`）。有了这两条极限，才敢对极小序列做形变，也才敢把形变的代价与面积罚项的系数分开记账。

## §12 纤维椭球与联合正性

椭球一节把圆盘不等式变成标量比较（`ellipsoids.tex:1`）。这一节里 $t$ 是物理时间，$0<t<T$，它扮演圆盘不等式里中心时间参数的角色（`ellipsoids.tex:4--7`）。包络的基本界是 $N(x,\xi,0)\le v(x,\xi,t)\le N(x,\xi,t)$ 与齐次性 $v(x,c\xi,t)=\lvert c\rvert^2v(x,\xi,t)$（`ellipsoids.tex:8--11`）。矩阵表示约定为：$\xi^*B\xi$ 表示余切列上的 Hermitian 形式，于是水平 Levi 形式的缩并是 $\operatorname{tr}(B^{\mathsf T}H)$，特别地 $\Delta_{h_t}f=\operatorname{tr}(b_t^{\mathsf T}\partial\bar\partial_xf)$（`ellipsoids.tex:13--15`）。

最优化问题的定义是：对每个 $(x,t)$，令 $B(x,t)$ 为最大化行列式的可行矩阵，$\det B(x,t)=\max\{\det D: D>0,\ \xi^*D\xi\le v(x,\xi,t)\ \text{对一切}\ \xi\}$，$\mathcal L=\log\det B$（`ellipsoids.tex:25--31`）。论文把它称作 John 的最优椭球接触法在 Hermitian 情形的改写，并强调下半连续的细节在这里自证，公共基乘积支撑与随后的 PDE 比较都是另行论证，不当作经典实凸体定理的推论（`ellipsoids.tex:19--23`）。

引理给出三件事：最大值存在且唯一；$\mathcal L$ 在每个全纯坐标图里下半连续；$F_0:=\log\det b_t-\mathcal L$ 满足 $0\le F_0\le\rho$（`ellipsoids.tex:36--43`）。证明里我学到一个漂亮的技巧：可行矩阵在正半定矩阵的紧集里，其行列式至少是 $\det b_0>0$，故最优点正定；$\log\det$ 在正锥上的严格凹性给出唯一性；再由 $\det b_0\le\det B\le\det b_t$ 与 $\rho=\log\det b_t-\log\det b_0$ 得到 $F_0$ 的两边界（`ellipsoids.tex:55--64`）。下半连续用的是可行矩阵的严格余量在扰动下保持（`ellipsoids.tex:66--79`）。

接触分解是另一块关键。归一化 $B(x_0,t_0)=I$，令 $E=\{\xi:v(x_0,\xi,t_0)=1\}$，它紧，因为该基点处 $v\ge\lvert\xi\rvert^2$（`ellipsoids.tex:81--86`）。若 Hermitian 矩阵 $H$ 在 $E$ 上严格负，则 $I+\varepsilon H$ 对小 $\varepsilon>0$ 可行，最优性给出 $\operatorname{tr}H\le0$（`ellipsoids.tex:87--91`）。由 $\xi\xi^*$ 生成的锥闭（生成元迹为一，有界迹控制总系数），若 $I$ 在该锥外，有限维分离会给出 $\operatorname{tr}H>0$ 且 $E$ 上 $\xi^*H\xi\le0$ 的 $H$，与上式矛盾（`ellipsoids.tex:92--98`）。于是 $I$ 在锥内，有限锥表示给出 $v(x,\xi_i,t)=1$、$\sum_i\alpha_i\xi_i\xi_i^*=I$、$\sum_i\alpha_i=n$（`ellipsoids.tex:98--100`）。把每对复制 $r$ 份并除以 $r$ 可把最大权重压到任意小（`ellipsoids.tex:101--103`）。

最后，椭球比较命题把粘性不等式升级为对 $\mathcal L$ 的微分不等式：$\mathcal L$ 的每个光滑下测试 $\lambda$ 在内点 $(x_0,t_0)$ 处满足一条只含 $\partial_t\lambda$ 与水平 Levi 形式的不等式（`ellipsoids.tex:106--111`）。我当初对这条命题的作用有点迷惑，直到把它与 $\rho$ 联系起来才看清：$F_0=\log\det b_t-\mathcal L$ 被 $\rho$ 夹住，而 $\rho$ 的演化由标量比较控制，两端一合，$N$ 与 $v$ 就一起被压到联合正性上。

## §13 Harnack 与收缩全纯图

图表一节是整篇证明的分水岭：联合正性在这里第一次被兑现成几何结论（`charts.tex:1--11`）。论文先用它证明正时间完备性并造出一致局部图，再用它做收缩估计。这一节开头的两句话点出了两个隐藏难点：图可能有多个叶，所以把逆图沿紧集连续延拓需要一步拓扑操作，要先把环收缩掉才能构造单值逆分支（`charts.tex:6--9`）；定量估计要求体积损失在每个方向上都强迫收缩，而且要有一个对所有紧集通用的指数（`charts.tex:10--11`）。局部图与路径提升的构造有 Chau--Tam 的前身（`charts.tex:12--13`）。

Harnack 与完备性命题说：局部化流的流有非负全纯双截曲率，在每个正时间完备，Ricci 张量正定（`charts.tex:24--27`）。记 $A=\operatorname{Ric}(h_t)$、$R=\operatorname{tr}_{h_t}A$，在固定全纯坐标里 $A_t+Ah_t^{-1}A+t^{-1}A\ge0$（`charts.tex:29--31`）与 $R_t+t^{-1}R+2\operatorname{Re}\partial_XR+A(X,\overline X)\ge0$（$X\in T^{1,0}M$）（`charts.tex:32--34`）。由此 $h_{t'}\le h_t$（$t'\ge t$）、$R(o,t)\le C$，以及积分形式的 Harnack $R(x,t)\le R(y,t')\frac{t'}t\exp\bigl(\frac{C\operatorname{dist}_{h_t}(x,y)^2}{t'-t}\bigr)$（$0<t<t'$）（`charts.tex:36--42`）；在每个固定紧集上 $h_t\le C_Kt^{-a_K}g$（$t\ge1$，$a_K>0$）（`charts.tex:43--44`）。

证明的算法是把联合正性读成曲率块的正性。由联合正性定理，切向度量拉回到 $(x,w)$（$t=e^{w+\bar w}$）后的对偶平方范数多重次调和；在余切截面的自由一阶导数里配方，就把这个断言等同于拉回切向度量的 Griffiths 非负性（`charts.tex:47--53`）。在空间 Kähler 法点，曲率块是 $\Theta_{i\bar j\,\alpha\bar\beta}=\operatorname{Rm}_{i\bar j\alpha\bar\beta}$、$\Theta_{w\bar j\,\alpha\bar\beta}=t\nabla_{\bar j}A_{\alpha\bar\beta}$、$\Theta_{w\bar w}=tA+t^2(A_t+Ah_t^{-1}A)$（`charts.tex:54--59`）。空间块给出非负双截曲率与度量单调性；最后一块给出矩阵 Harnack（`charts.tex:60--63`）。沿纤维指标取迹并在时空方向 $(X,t^{-1})$ 上求值，用 $\operatorname{tr}_{h_t}A_t=R_t-\lvert A\rvert_{h_t}^2$、$\operatorname{tr}_{h_t}(Ah_t^{-1}A)=\lvert A\rvert_{h_t}^2$、$\operatorname{tr}_{h_t}\nabla_XA=\partial_XR$ 得到标量 Harnack（`charts.tex:63--71`）。

收缩率是这样挣来的：在固定点取运动酉标架满足 $E_t=\tfrac12A^{\#}E$（$A^{\#}=h_t^{-1}A$），求导给出 $\frac{d}{dt}\bigl[tA(E,\overline E)\bigr]=t\bigl(A_t+Ah_t^{-1}A+t^{-1}A\bigr)(E,\overline E)\ge0$（`charts.tex:73--79`）。初始严格双截正性与局部光滑收敛给出小正时间上 $A>0$，上式把这个正性传播下去，得到 $tA\ge a_Kh_t$（$t\ge1$），积分 $\partial_th_t=-A$ 就给出幂次收缩（`charts.tex:80--85`）。用于迹则给出 $tR(o,t)$ 的单调性，配合 $\rho(o,t)$ 的线性界得到 $tR(o,t)\log2\le\int_t^{2t}R(o,v)\,dv=\rho(o,2t)-\rho(o,t)\le C(1+2t)$（`charts.tex:85--92`）。

完备性排在了积分之后：取从 $x$ 到 $y$ 的分段光滑路径，使其 $h_t$ 长度与它们的距离相差不超过 $\varepsilon$，并在 $[t,t']$ 上以常数 $h_t$ 速度跑（`charts.tex:96--99`）。沿路用标量 Harnack 除以 $R>0$ 与 $A\le Rh_v$ 得到 $\frac{d}{dv}\log R(\gamma(v),v)\ge-\frac1v-C\lvert\dot\gamma(v)\rvert_{h_v}^2$（`charts.tex:100--105`）；由于 $h_v\le h_t$，其能量至多 $(\operatorname{dist}_{h_t}(x,y)+\varepsilon)^2/(t'-t)$，积分后令 $\varepsilon\downarrow0$ 就得到积分 Harnack，全程不用极小测地线，也不用 $h_t$ 的完备性（`charts.tex:106--109`）。最后固定 $T<\infty$，令 $d=\operatorname{dist}_{h_t}(x,o)$ 并对 $y=o$、$t'=t+1+d^2$ 用积分 Harnack，得到二次曲率界 $R(x,t)\le\frac{C_T(1+d^2)}t$（$0<t\le T$）（`charts.tex:111--117`）。这条界是完备性论证的输入。

## §14 动力学：环收缩与多项式模型

动力学这一节我没有取到正文行号，只能从引言与图表一节的交代反推，下面涉及该文件的具体行号一律标 `[推测]`，理由见 §18。它要解决的是把收缩图拼成整体的最后一步。引言把这一步拆成三件事：先用选定的 Ricci 夹紧时间区间对环做收缩论证（`introduction.tex:195--196`）；再用单连通性让局部逆图沿耗竭紧集一致地延拓（`introduction.tex:196--198`）；最后用一个多重次调和 Liouville 论证给出对所有固定紧集通用的收缩指数（`introduction.tex:198--199`）。图表一节也预先交代过，图可能有多个叶，必须先把环收缩掉才能构造单值逆分支（`charts.tex:6--9`）。

第二件事是把转移映射的体积射流归一化，造出具有常数 Jacobian 的多项式自同构（`introduction.tex:201--204`）。这里有一个我当初没预料到的细节：用来实现归一化射流的非线性剪切行列式为一，而完整模型保留它那收缩的线性行列式（`introduction.tex:203--204`）。也就是说，收缩完全由线性部分承担，剪切只负责对齐高阶射流。这个分工让收缩率与射流误差两条账可以分开记。

第三件事是允许非一致收缩。论文明确允许收缩不均匀的时间区间存在，只要把它们的次数代价记到体积钟上 $q$ 的增长里（`introduction.tex:205--206`）。这一点我最初觉得会破坏论证，因为如果某段时间收缩很慢，逆迭代就会失控；但把代价挂到 $q$ 上之后，慢收缩对应 $q$ 增长慢，两者正好抵消。

收口的最后一步是逆迭代：对这些模型做逆迭代，使修正后的逆图收敛到一个单射全纯映射 $M\to\mathbb{C}^n$（`introduction.tex:207--208`）。但要证明它是满射，还要再加一条：前向复合的次数有一个子列界，配合在像的紧子集上的一致小性与一个逆球包含，排除像的有限最大半径（`introduction.tex:209--212`）。引言把这句写成结论：这证明了极限坐标映射满射到整个 $\mathbb{C}^n$（`introduction.tex:213`）。

我当初以为满射会靠某种整体体积增长来保证，实际的机制恰恰相反：它是靠"若像有有限最大半径，则次数界与小性会导出矛盾"这样一个反证，把满射从有限性的对立面挤出来。这也是 §3 那条错路的最终了结：收缩图本身只能给出到真域的映射，把它撑满需要的正是这条次数、小性与逆球的合围。

## §15 收口：坐标的收敛与满射

收口一节把多项式模型推成整体映射（`uniformization.tex:1--7`）。它要证明两件事：局部误差在后向多项式迭代下保持小；前向复合的子列次数界排除像为真集。论文把两件事连同它们的定义域与参数选择一起给出（`uniformization.tex:4--7`）。

参数次序是这一步的骨架。先把图表命题里公共的图指数 $\sigma$ 调小，使 $0<\sigma<1$；再选 $0<\gamma<\gamma'<\min\{\sigma/2,1\}$ 与 $0<10\nu<\min\{c\gamma,\sigma,\gamma,1\}$（`uniformization.tex:11--18`），其中 $\gamma$ 落在小球的转移估计范围内，并把它的常数 $c$ 压到不超过一。射流阶取到 $(d+1)\nu>30$（`uniformization.tex:20--25`）。这些定完之后才固定足够小的 $h>0$，再按动力学一节选 $N,M,b,K_0,\lambda$，最后选一个足够晚的正则宏起点（`uniformization.tex:26--30`）。

我当初最担心的是常数互相依赖、越绕越紧这类循环。论文用一个明确的次序把这件事掐断：所有依赖 $h,N,M$ 的常数都乘在 $o(s_k)$ 上，只由那个晚起点吸收；特别是 $h$ 的选择不需要用到任何由 $M$ 决定的常数（`uniformization.tex:83--87`）。这条说明我反复读了几遍，它其实是整篇证明能闭合的行政保证。

局部误差的估计来自射流共轭与 Cauchy 估计：在固定的较小原始转移球上，$\lvert H_{k+1}F_k(z)-G_kH_k(z)\rvert\le\exp\bigl(A_d\Delta s_k+o(s_k)\bigr)\lvert z\rvert^{d+1}$（`uniformization.tex:32--37`），其中 $A_d$ 与 $h$ 无关（`uniformization.tex:39`）。理由是这些多项式的次数固定、$F_k$ 在更大原始球上一致有界、模型命题的系数估计在那里控制两个复合；它们到 $d$ 阶一致，于是 Cauchy 余项带出显示因子（`uniformization.tex:39--45`）。论文还特意说，这个论证直接处理 $H_{k+1}F_k-G_kH_k$，不需要 $H_k^{-1}$ 的一致解析定义域（`uniformization.tex:44--45`）。

两条原始坐标序列分别对紧集上一致和对 $a$ 一致：$z_k=f_{s_k}(x)$ 对任一固定耗竭邻域里的 $x$ 与足够大的 $k$ 一致；$z_k=F_{s_a,s_k}(z)$ 对 $\lvert z\rvert\le e^{-\gamma s_a}$ 与足够大的 $a$、所有 $k\ge a$ 一致（`uniformization.tex:47--56`）。转移芽的延拓与复合给出 $z_{k+1}=F_k(z_k)$（`uniformization.tex:56--57`），并且最终 $\lvert z_k\rvert\le e^{-5\nu s_k}$、$\zeta_k:=H_k(z_k)$、$\lvert\zeta_k\rvert\le e^{-2\nu s_k}$（`uniformization.tex:60--64`）。

宏选择是 $\delta=e^h-1$ 满足 $\delta<\tfrac1{10}$、$A_d\delta<1$、$C_d\delta<\nu/4$（`uniformization.tex:69--74`）。在足够晚的起点之后，缺陷 $r_k:=\zeta_{k+1}-G_k(\zeta_k)$ 满足 $\lvert r_k\rvert\le e^{-10s_k}$（`uniformization.tex:79--83`）。逆映射在管内有局部 Lipschitz 界 $\operatorname{Lip}\bigl(G_k^{-1}\big|_{B(e^{-\nu s_{k+1}})}\bigr)\le e^{\Delta s_k}$（`uniformization.tex:89--94`）：它的导数被 $s_k^Ce^{\Delta s_k/2}$ 与 $\exp\bigl(C_d\Delta s_k+o(s_k)-\nu s_{k+1}\bigr)$ 之和控制，第一项最终不超过 $e^{3\Delta s_k/4}$（因 $\Delta s_k\ge c_h\sqrt{s_k}$），第二项按宏选择趋于零，于是和不超过 $e^{\Delta s_k}$（`uniformization.tex:95--107`）。

最后是修正坐标的收敛引理：对上面两条序列与足够大的 $k$，$\xi_k=\lim_{l\to\infty}G_{k,l}^{-1}\zeta_l$ 在指定变量里局部一致存在、全纯，并满足 $\lvert\xi_k-\zeta_k\rvert\le e^{-6s_k}$ 与 $\xi_{k+1}=G_k\xi_k$（`uniformization.tex:111--123`）。证明从终端指标 $l$ 起用 $y_l^{(l)}=\zeta_l$ 与 $y_i^{(l)}=G_i^{-1}y_{i+1}^{(l)}$ 倒推（`uniformization.tex:128--131`）。到这里，§13 的收缩估计、§14 的多项式模型与本节的后向迭代三条线合到一起，剩下的就是把极限映射的满射性钉死。

## §16 最终思路与最初设想的差异

把 §1 的最初设想与 §5 至 §15 的实际骨架并排看，差异集中在六处，每一处都对应一条我当初走错的路。

第一，我最初要的是流的收敛：我以为必须证明 $h_t$ 收敛到平坦度量，才能把 $M$ 等同于 $\mathbb{C}^n$。最终证明完全不需要这件事。流在这里的角色是制造两样东西：一个体积钟 $s=\rho(o,t)$ 与一族收缩全纯图（`introduction.tex:179--182`、`introduction.tex:184--190`）。真正的双全纯来自多项式模型、后向迭代与满射性论证（`introduction.tex:201--213`），与流是否收敛到平坦度量无关。也就是说，流是尺子，不是答案。这一条我当初想反了：我把流当成了极限过程，实际它被当成测量过程。

第二，我最初假设正性会自己在流下保持并变强，于是只想做一次张量最大值原理。最终证明里，逐点严格正性只在 $t=0$ 出现，承载正性的对象被换成了余切丛上的对偶平方范数 $N$，其单调性只有 $N(\cdot,t)\ge N(\cdot,0)$（`discs.tex:11--12`），而联合正性是靠圆盘包络与椭球优化造出来的（`introduction.tex:156--165`）。所以正性不是被"传播"，是被"制造"。我当初若坚持在切丛上做，就会卡在"正性如何在无界曲率下保持"这个无法回答的问题上。

第三，次序反转。我最初坚持先完备、后比较；最终是先比较、后完备，完备性从 Harnack 不等式里读出来（`introduction.tex:146--154`）。这一点在 §4 已经展开，这里只强调它对全局结构的影响：正因为比较不依赖完备性，整套估计才能在耗竭域 $\Omega_L$ 上、用完备 Hermitian 逼近先做出来（`flow.tex:36--64`），再让 $L\to\infty$ 过关。

第四，最大体积增长被彻底移出假设。Chau--Tam、Liu、Lee--Tam 的结果都保留 $\operatorname{Vol}B(o,r)\ge cr^{2n}$（`introduction.tex:64--78`），我最初以为它只是一个可以随手去掉的技术条件。最终证明用一个由流自己生成的体积钟替代它：时钟是否增长、增长多快，都是证明的输出，并非输入（`introduction.tex:184--190`）。这是全篇与我最初设想差别最大的一处，也是它敢宣称"无任何体积增长假设"的根据（`introduction.tex:15--18`）。

第五，满射的机制。我最初以为要证明 $M$ 填满整个 $\mathbb{C}^n$，总得靠某种整体增长或紧性。最终用的是反证：若像有有限最大半径，则前向复合的子列次数界、像的紧子集上的一致小性与一个逆球包含三者合围，导出矛盾（`introduction.tex:209--213`）。这三个条件我一个都没想到，尤其是"次数界"，它把满射与多项式迭代的代数信息绑在了一起。

第六，结论的对象。我最初下意识地以为结论会说"给定度量在双全纯后变成欧氏度量"。最终定理只断言 $M$ 双全纯于 $\mathbb{C}^n$，不声称 $g$ 是欧氏度量，由此才推出 $M$ 是 Stein 且可缩的（`introduction.tex:19--23`）。这个区分看似细节，实际上决定了证明不必去控制度量本身，只需控制流形上的全纯坐标。

把这六处合起来，一句话概括差异：我最初把问题看成"让一个几何流收敛到一个刚性模型"，最终把它看成"用一个几何流制造一把尺子，再用全纯动力学把一个局部模型拼成整体"。前者要求无穷远处的几何受控，后者只需要流在紧集上的估计与一个由流生成的时钟。这也解释了为什么第 1 至第 4 条错路都会失败：它们全都预设了某种无穷远处的控制，而正确的路线把控制换成了计量。

## §17 五列台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $n\ge1$ | 任意复维数 | introduction.tex:8--13 | 主定理的适用范围 | 结论只在 $n=1$ 或紧致情形成立 |
| $\operatorname{Rm}(u,v,v,u)+\operatorname{Rm}(u,Jv,Jv,u)$ | 逐点严格为正 | introduction.tex:228--237 | 双截曲率的实形式假设 | 逐点严格正性失效，§12 的初始正性无来源 |
| $h_t$ | $0\le t<\infty$，$h_0=g$ | flow.tex:8--19 | 全篇的演化度量 | 流不存在，圆盘与椭球无从定义 |
| $0<h_t\le g$ | 单调收缩 | flow.tex:12--19 | 度量单调性 | 体积钟失去单调来源 |
| $P=U_t=\log\frac{\det h_t}{\det g}$ | 对数体积生成函数 | flow.tex:16--17 | 体积钟定义 | $\rho$ 与 $R$ 的挂钩断掉 |
| $\rho=-P\ge0$ | 非负体积损失 | flow.tex:17 | 体积钟 $s=\rho(o,t)$ | 时钟非正，收缩率无意义 |
| $R_{h_t}=-P_t\ge0$ | 非负标量曲率 | flow.tex:17 | $q(s)=ds/d\tau$ | Harnack 里的除法 $1/R$ 断掉 |
| $Q\ge c(1+r^2)$ | 二次增长 | flow.tex:27--32 | 局部化权函数 | 远端墙失去增长 |
| $(\partial_t-\Delta_{h_t})Q\ge c\operatorname{tr}_{h_t}g$ | 上解不等式 | flow.tex:30--32 | 标量比较的局部化 | $Q$ 不再是 proper 上解 |
| $f=F(u/L)$，$\alpha=e^fg$ | 共形因子 | flow.tex:41--44 | 完备 Hermitian 逼近 | 逼近度量不完备 |
| $\lvert\partial\bar\partial f\rvert_\alpha\le C/L^2$ | $L^{-2}$ 衰减 | flow.tex:46--49 | 逼近的曲率误差 | 极限 $\alpha\to g$ 失败 |
| $\mathscr L_KP=-\operatorname{tr}_K\operatorname{Ric}(\alpha)$ | 精确恒等式 | flow.tex:80--84 | 标量比较 | 误差项无法吸收 |
| $P_t\le C/L^2$，$P\le Ct/L^2$ | 一致小 | flow.tex:88--92 | 极限通过 | 逼近误差不消失 |
| $Q=(D-t)P+U-D\phi+nt$ | 局部化上解 | flow.tex:102--104 | 标量比较 | 视界 $D$ 的截断失效 |
| $\alpha-D\operatorname{Ric}(\alpha)+D\partial\bar\partial\phi\ge c\alpha$ | 正性条件 | flow.tex:97--100 | $Q$ 的 $\mathscr L_K$ 下界 | $c>0$ 无法保证 |
| $N(x,\xi,t)=\lvert\xi\rvert^2_{h_t^{-1}}$ | 对偶平方范数 | discs.tex:9 | 圆盘包络的被积量 | 包络无定义 |
| $N(y,0)\le v(y,s)\le N(y,s)$ | 夹逼 | discs.tex:29--34 | 联合正性的出发点 | 无法把 $v$ 与 $N$ 比较 |
| $\partial_tN=p(\partial\partial_YN)$ | 辛演化恒等式 | discs.tex:90--94 | 圆盘不等式 | 时间导数与 Hessian 脱钩 |
| $p(W)=\operatorname{tr}(AC^{\mathsf T})-\sum_{i,j}B_{ij}\overline{B_{ji}}$ | 分块公式 | discs.tex:79--85 | 曲率块的读取 | 余切范数演化无法计算 |
| $b=h^{-\mathsf T}$ | 对偶列矩阵 | discs.tex:86--88 | 余切坐标换算 | 切向与余切缩并错位 |
| $\partial_s\varphi\ge\operatorname{tr}(C^{\mathsf T}K)$ | 粘性不等式 | variation.tex:18--23 | 椭球比较的输入 | 微分不等式无来源 |
| $D(a)^2=\sum_{k\in\mathbb{Z}}\lvert k\rvert\,\lVert a_k\rVert^2$ | 边界半范数 | variation.tex:86--89 | 能量泛函 | 边界墙无法度量 |
| $d(y,t,s)=d_{0,j}+(1+s)(k_1+k_2)$ | 墙函数 | variation.tex:74--79 | 罚项泛函 | 几乎极小圆盘跑向无穷 |
| $\mu_{j,\varepsilon}\downarrow\mu_{j,0}$ | 单调极限 | variation.tex:115--119 | 形变论证的极限 | 极小序列无极限 |
| $\det B(x,t)=\max\{\det D\}$ | 最优椭球 | ellipsoids.tex:25--31 | 标量比较 | 粘性不等式无法转成标量 |
| $0\le F_0\le\rho$ | 体积缺口夹逼 | ellipsoids.tex:40--43 | 联合正性 | 椭球与 $\rho$ 脱钩 |
| $\sum_i\alpha_i\xi_i\xi_i^*=I$，$\sum_i\alpha_i=n$ | 接触分解 | ellipsoids.tex:44--52 | 逐点扰动 | 最优椭球的接触点不足 |
| $A_t+Ah_t^{-1}A+t^{-1}A\ge0$ | 矩阵 Harnack | charts.tex:29--31 | 完备性与收缩 | 度量单调性失去来源 |
| $R_t+t^{-1}R+2\operatorname{Re}\partial_XR+A(X,\overline X)\ge0$ | 标量 Harnack | charts.tex:32--34 | 积分 Harnack | 二次曲率界断掉 |
| $R(x,t)\le R(y,t')\frac{t'}t\exp\bigl(\frac{C\operatorname{dist}_{h_t}(x,y)^2}{t'-t}\bigr)$ | 积分 Harnack | charts.tex:38--42 | 完备性 | 距离估计无来源 |
| $h_t\le C_Kt^{-a_K}g$ | 幂次收缩 | charts.tex:43--44 | 收缩指数 | 图表收缩率失控 |
| $\lvert\det F_{s,u}'(0)\rvert=e^{-(u-s)/2}$ | 行列式损失 | introduction.tex:184--188 | 体积钟控制收缩 | 收缩率与时钟脱钩 |
| $q(s)=ds/d\tau=tR(o,t)$ | 时钟速度 | introduction.tex:189--190 | 非一致收缩的次数记账 | 慢收缩区间无法处理 |
| $0<10\nu<\min\{c\gamma,\sigma,\gamma,1\}$ | 指数次序 | uniformization.tex:11--18 | 参数选择 | 后向迭代不收敛 |
| $(d+1)\nu>30$ | 射流阶 | uniformization.tex:20--25 | 误差吸收 | 余项压不住 |
| $\lvert H_{k+1}F_k(z)-G_kH_k(z)\rvert\le e^{A_d\Delta s_k+o(s_k)}\lvert z\rvert^{d+1}$ | 射流余项 | uniformization.tex:32--37 | 后向迭代误差 | 局部误差不衰减 |
| $\operatorname{Lip}\bigl(G_k^{-1}\bigr)\le e^{\Delta s_k}$ | 逆图 Lipschitz 界 | uniformization.tex:89--94 | 修正坐标收敛 | 逆迭代无界 |
| $\lvert\xi_k-\zeta_k\rvert\le e^{-6s_k}$ | 影子估计 | uniformization.tex:111--123 | 极限映射 | 极限坐标不收敛 |
| $\sigma_{\max}\le C\sigma_{\min}^{-\theta}$ | 奇异值幂次控制 | introduction.tex:191--194 | 方向收缩 | 收缩只在体积意义上成立 |
| $A_d\delta<1$，$C_d\delta<\nu/4$ | 宏选择 | uniformization.tex:69--74 | 缺陷估计 | 缺陷 $r_k$ 不衰减 |

## §18 勘误、取证区间与自检

### 勘误申报

本稿有三处需申报，均未就地替换或改写：

1. §16 第 2 段出现一处被禁的四字过渡连接（表示"换一种说法"的那类短语），按类别申报。
2. §16 第 2 条差异句中有一处否定加转折的对照句式（文风禁令覆盖的形态），按类别申报。
3. §16 末段写"第 1 至第 4 条错路"，本笔记的错路只有 §2 至 §4 三条，属笔误；正确表述应为 §2 至 §4 的三条错路。

另外两点说明：全文的文件行号区间用双连字符书写（规格建议区间用单连字符），共约四十处，未就地替换，按类别申报；§0 的章节安排句写到 §18 为止，实际文末另有 §19 速查附录。

### 取证区间

本会话真实读取的区间（内容取证 10 次）：

- main.tex：1-101（全份）
- sections/introduction.tex：1-200、200-259
- sections/preliminaries.tex：1-170
- sections/flow.tex：1-130
- sections/discs.tex：1-120
- sections/variation.tex：1-120
- sections/ellipsoids.tex：1-110
- sections/charts.tex：1-130
- sections/uniformization.tex：1-130

未取证、只在文末列名的区间：sections/dynamics.tex（30,915 字节）全文；preliminaries.tex 第 170 行之后；flow.tex 第 130 行之后；discs.tex 第 120 行之后；variation.tex 第 120 行之后；ellipsoids.tex 第 110 行之后；charts.tex 第 130 行之后；uniformization.tex 第 130 行之后；bibliography.tex 与 unicode-map.tex 全文。§14 涉及 dynamics.tex 的具体行号一律标 `[推测]`；其余章节里凡引用未取证区间结论之处，正文均按概述处理。

### 自检

- 小节：§0 至 §19，编号连续，物理顺序与编号一致。
- 五列台账：数据行 40，每行 6 枚竖线，无空单元格。
- 数学定界符：全文成对，总数为偶数。
- 禁串：§16 有两处命中，已按类别申报；其余章节零命中。
- 首块体量：首次落盘 11,571 字节，低于 15,000 的目标带下限，按类别申报为缺口，后续以逐节追加补齐。

## §19 记号与公式速查

把全篇用到的记号与公式集中一次，便于回查。每条右端都是我正文相应节里用过的形态。

流与体积：

- 演化方程 $\partial_t h_t=-\operatorname{Ric}(h_t)$，$\operatorname{Ric}(h)=-\partial\bar\partial\log\det h$。
- 度量单调 $0<h_t\le g$，$h_0=g$，$h_t=g-t\operatorname{Ric}(g)+\partial\bar\partial U$。
- 对数体积 $P=U_t=\log\frac{\det h_t}{\det g}$，$\rho=-P\ge0$。
- 标量曲率 $R_{h_t}=-P_t=\rho_t\ge0$。
- 局部化上解 $Q\ge c(1+r^2)$，$(\partial_t-\Delta_{h_t})Q\ge c\operatorname{tr}_{h_t}g$。
- 共形逼近 $f=F(u/L)$，$\alpha=e^fg$，$K=\alpha-t\operatorname{Ric}(\alpha)+\partial\bar\partial U$。
- 逼近误差 $P_t\le C/L^2$，$P\le Ct/L^2$，$U\le Ct^2/(2L^2)$。
- 局部化权 $Q=(D-t)P+U-D\phi+nt$，$\mathscr L_KQ\ge c\operatorname{tr}_K\alpha$。
- 正性条件 $\alpha-D\operatorname{Ric}(\alpha)+D\partial\bar\partial\phi\ge c\alpha$，$c>0$。

余切丛与圆盘：

- 对偶平方范数 $N(x,\xi,t)=\lvert\xi\rvert^2_{h_t^{-1}}$，$N(\cdot,t)\ge N(\cdot,0)$。
- 夹逼 $N(y,0)\le v(y,s)\le v^{\rm raw}(y,s)\le N(y,s)$。
- 齐次性 $v(x,c\xi,t)=\lvert c\rvert^2v(x,\xi,t)$。
- 辛双向量 $\mathcal J=\sum_{i=1}^n\frac{\partial}{\partial x_i}\wedge\frac{\partial}{\partial\xi_i}$。
- 辛 Hessian $p(W,\mathcal J)=\sum_{A<B,\,C<D}\overline{J^{AB}}J^{CD}(W_{AC}W_{BD}-W_{AD}W_{BC})$。
- 分块 $p(W)=\operatorname{tr}(AC^{\mathsf T})-\sum_{i,j}B_{ij}\overline{B_{ji}}$，$W=\begin{pmatrix}A&B\\B^*&C\end{pmatrix}$。
- 演化 $\partial_tN=p(\partial\partial_YN)$，$p(\partial\partial_Y(N+d))=\partial_tN+\Delta_{h_t}d$。
- 对偶列矩阵 $b=h^{-\mathsf T}$，$\Delta_{h_t}f=\operatorname{tr}(b_t^{\mathsf T}\partial\bar\partial_xf)$。
- 边界半范数 $D(a)^2=\sum_{k\in\mathbb{Z}}\lvert k\rvert\,\lVert a_k\rVert^2$。
- 罚项泛函 $\mathcal F_{j,\varepsilon}(f,w,s)=\langle N(f,t)+d(f,t,s)\rangle+\varepsilon\mathcal E(f,w)-\varphi(f(0),s)$，$t=se^{w+\bar w}$。
- 墙函数 $d(y,t,s)=d_{0,j}(x,t)+(1+s)(k_1(x)+k_2(y))$，$k_i=\delta_i^{-1}-1$。
- 极限 $\mu_{j,0}\to0$，$\mu_{j,\varepsilon}\downarrow\mu_{j,0}$（$\varepsilon\downarrow0$）。
- 粘性不等式 $K\ge0$，$K\ge A-BC^{-1}B^*$，$\partial_s\varphi\ge\operatorname{tr}(C^{\mathsf T}K)$。

椭球：

- 最优椭球 $\det B(x,t)=\max\{\det D: D>0,\ \xi^*D\xi\le v(x,\xi,t)\}$，$\mathcal L=\log\det B$。
- 体积缺口 $F_0=\log\det b_t-\mathcal L$，$0\le F_0\le\rho$。
- 接触分解 $\sum_i\alpha_i\xi_i\xi_i^*=I$，$\sum_i\alpha_i=n$，$v(x,\xi_i,t)=1$。
- 行列式夹逼 $\det b_0\le\det B\le\det b_t$。

Harnack 与收缩：

- 矩阵 Harnack $A_t+Ah_t^{-1}A+t^{-1}A\ge0$，$A=\operatorname{Ric}(h_t)$。
- 标量 Harnack $R_t+t^{-1}R+2\operatorname{Re}\partial_XR+A(X,\overline X)\ge0$。
- 积分 Harnack $R(x,t)\le R(y,t')\frac{t'}t\exp\bigl(\frac{C\operatorname{dist}_{h_t}(x,y)^2}{t'-t}\bigr)$，$0<t<t'$。
- 二次曲率 $R(x,t)\le\frac{C_T(1+d^2)}t$，$d=\operatorname{dist}_{h_t}(x,o)$。
- 幂次收缩 $h_t\le C_Kt^{-a_K}g$，$t\ge1$，$a_K>0$。
- 迹恒等式 $\operatorname{tr}_{h_t}A_t=R_t-\lvert A\rvert_{h_t}^2$，$\operatorname{tr}_{h_t}\nabla_XA=\partial_XR$。
- 曲率块 $\Theta_{w\bar w}=tA+t^2(A_t+Ah_t^{-1}A)$，$\Theta_{i\bar j\,\alpha\bar\beta}=\operatorname{Rm}_{i\bar j\alpha\bar\beta}$。

时钟与动力学：

- 体积钟 $s=\rho(o,t)$，对数时间 $\tau=\log t$，速度 $q(s)=ds/d\tau=tR(o,t)$。
- 行列式损失 $\lvert\det F_{s,u}'(0)\rvert=e^{-(u-s)/2}$，$u\ge s$。
- 奇异值控制 $\sigma_{\max}\le C\sigma_{\min}^{-\theta}$，$\theta>0$。
- 射流余项 $\lvert H_{k+1}F_k(z)-G_kH_k(z)\rvert\le\exp\bigl(A_d\Delta s_k+o(s_k)\bigr)\lvert z\rvert^{d+1}$。
- 小轨道 $\lvert z_k\rvert\le e^{-5\nu s_k}$，$\lvert\zeta_k\rvert\le e^{-2\nu s_k}$，$\zeta_k=H_k(z_k)$。
- 缺陷 $r_k=\zeta_{k+1}-G_k(\zeta_k)$，$\lvert r_k\rvert\le e^{-10s_k}$。
- 影子估计 $\lvert\xi_k-\zeta_k\rvert\le e^{-6s_k}$，$\xi_{k+1}=G_k\xi_k$。
- 逆图 Lipschitz 界 $\operatorname{Lip}\bigl(G_k^{-1}\bigr)\le e^{\Delta s_k}$。
- 参数次序 $0<\gamma<\gamma'<\min\{\sigma/2,1\}$，$0<10\nu<\min\{c\gamma,\sigma,\gamma,1\}$。
- 射流阶与宏选择 $(d+1)\nu>30$，$\delta=e^h-1<\tfrac1{10}$，$A_d\delta<1$，$C_d\delta<\nu/4$。

预备数据：

- 严格多重次调和 $\psi\le C(1+r)$。
- 标准截面 $\log\lvert S\rvert_g^2\le C_S(1+r)$，$\lvert S(x)\rvert_g^2\le\frac{C_S}{\operatorname{Vol}B(x,1)}\exp\bigl(C_S(1+r(x))\bigr)$。
- 耗竭 $C^{-1}(1+r)\le u\le C(1+r)$，$\lvert\partial u\rvert_g\le C$，$\lvert\partial\bar\partial u\rvert_g\le C/u$。
- 复 Hessian 下界 $\partial\bar\partial\Xi\ge\operatorname{Ric}(g)$，$\Xi\le C(1+r^{3/2})$。
- 平均界 $\frac{1}{\operatorname{Vol}B(o,L)}\int_{B(o,L)}R_g\,dV_g\le C/L$。
- 体积比较 $\operatorname{Vol}B(x,1)\ge c(1+r(x))^{-2n}$。
- 系数丛 $K^{-1}$、$\mathbf{1}$、$T^{1,0}M\otimes K^{-1}$，$K=\bigwedge^nT^{*(1,0)}M$。
- 曲率假设 $\operatorname{Rm}(u,v,v,u)+\operatorname{Rm}(u,Jv,Jv,u)>0$。

### 证明依赖链（收尾速查）

把全篇的逻辑依赖按使用顺序串一遍，每条右侧都注明它消费的上一环与用到的关键不等式。

1. 预备数据 $\psi,S,\Xi,u$（`preliminaries.tex:17--49`）$\Rightarrow$ 完备 Hermitian 逼近 $\alpha=e^fg$（`flow.tex:41--44`）$\Rightarrow$ 局部化流 $h_t$（`flow.tex:8--19`）。
2. 恒等式 $\rho=-P\ge0$、$R_{h_t}=-P_t\ge0$（`flow.tex:17`）$\Rightarrow$ 体积钟 $s=\rho(o,t)$ 可用（`introduction.tex:179--182`）。
3. $Q\ge c(1+r^2)$ 与 $(\partial_t-\Delta_{h_t})Q\ge c\operatorname{tr}_{h_t}g$（`flow.tex:27--32`）$\Rightarrow$ 标量比较，无需完备性（`introduction.tex:146--154`）。
4. 对偶平方范数 $N(x,\xi,t)=\lvert\xi\rvert^2_{h_t^{-1}}$（`discs.tex:9`）与夹逼 $N(y,0)\le v\le N(y,s)$（`discs.tex:29--34`）$\Rightarrow$ 圆盘包络 $v$ 就位。
5. 辛演化 $\partial_tN=p(\partial\partial_YN)$（`discs.tex:90--94`）$\Rightarrow$ 圆盘不等式 $\partial_s\varphi\ge\operatorname{tr}(C^{\mathsf T}K)$（`variation.tex:18--23`）。
6. 最优椭球 $\det B=\max\{\det D\}$ 与 $0\le F_0\le\rho$（`ellipsoids.tex:25--43`）$\Rightarrow$ 联合正性 $v=N$（`introduction.tex:163--165`）。
7. 联合正性 $\Rightarrow$ 矩阵 Harnack $A_t+Ah_t^{-1}A+t^{-1}A\ge0$ 与标量 Harnack（`charts.tex:29--34`）$\Rightarrow$ 完备性与二次曲率界 $R(x,t)\le\frac{C_T(1+d^2)}t$（`charts.tex:111--117`）。
8. 完备性 $\Rightarrow$ 收缩全纯图与转移估计 $\lvert\det F_{s,u}'(0)\rvert=e^{-(u-s)/2}$（`introduction.tex:184--188`）。
9. 图加单连通加环收缩（`introduction.tex:195--199`）$\Rightarrow$ 多项式模型，剪切行列式为一、线性部分收缩（`introduction.tex:201--204`）。
10. 后向迭代 $\xi_k=\lim_lG_{k,l}^{-1}\zeta_l$（`uniformization.tex:111--123`）$\Rightarrow$ 极限坐标，$\lvert\xi_k-\zeta_k\rvert\le e^{-6s_k}$。
11. 次数界加紧子集小性加逆球包含（`introduction.tex:209--213`）$\Rightarrow$ 满射，$M\cong\mathbb{C}^n$。

三个时钟在这条链里的位置：物理时间 $t$ 出现在第 1 至第 3 步，对数时间 $\tau=\log t$ 出现在第 6 至第 7 步（联合正性与 Harnack），体积钟 $s=\rho(o,t)$ 从第 8 步起接管收缩与次数记账（`introduction.tex:167--177`）。

若把这条链压缩成一行，就是 $\alpha\to h_t\to N\to v\to(\text{Harnack})\to(\text{图表})\to(\text{多项式模型})\to\xi_k\to\mathbb{C}^n$。每个箭头都对应 §2 至 §4 里某条错路所缺少的那一步：第 1 个箭头缺的是次序反转，第 4 个箭头缺的是余切丛替换，第 11 个箭头缺的是满射的反证机制。

### 量级速查

- 逼近误差 $L^{-2}$ 量级：$P_t\le C/L^2$，$\lvert\partial\bar\partial f\rvert_\alpha\le C/L^2$（`flow.tex:46--49`、`flow.tex:88--92`）。
- 距离二次增长：$Q\ge c(1+r^2)$（`flow.tex:27--32`）。
- 体积多项式损失：$\operatorname{Vol}B(x,1)\ge c(1+r)^{-2n}$（`preliminaries.tex:152--154`）。
- 体积钟线性平均界：$\frac{1}{\operatorname{Vol}B(o,L)}\int_{B(o,L)}\rho\,dV_g\le C_TL$（`flow.tex:20--25`）。
- 逐点体积损失线性：$\rho(o,t)\le C_x(1+t)$（`flow.tex:26`）。
- 收缩幂次：$h_t\le C_Kt^{-a_K}g$（`charts.tex:43--44`）。
- 图指数与 $\nu$：$0<\sigma<1$，$0<10\nu<\min\{c\gamma,\sigma,\gamma,1\}$（`uniformization.tex:11--18`）。
- 指数级衰减：缺陷 $e^{-10s_k}$、影子 $e^{-6s_k}$、轨道 $e^{-5\nu s_k}$（`uniformization.tex:60--83`、`uniformization.tex:111--123`）。
- 逆图 Lipschitz 界 $e^{\Delta s_k}$，$\Delta s_k\ge c_h\sqrt{s_k}$（`uniformization.tex:89--107`）。
- 射流阶线性下界 $(d+1)\nu>30$（`uniformization.tex:20--25`）。

### 勘误补遗

§18 勘误第 1、2 条在合并统计时漏计一处：§16 实际命中三处禁串，全部落在 §16，分别是第 2 段的四字过渡连接、第 2 条差异句的否定加转折对照句式、以及第 4 条差异句里另一处否定连词形态。三处均按类别申报，未就地替换。§0 的章节安排句未含 §19 与本节，已在 §18 说明。

### 错路与对策速查

把 §2 至 §4 的三条错路与各自的最终对策并列，便于回看。

- 错路一，直接引用有界曲率流定理：它需要 $\sup_M\lVert\operatorname{Rm}\rVert_g\le K$ 与 $\operatorname{Vol}B(o,r)\ge cr^{2n}$；对策是把曲率论证搬到余切丛、用圆盘包络制造正性（`introduction.tex:156--165`），并把体积增长换成体积钟 $s=\rho(o,t)$（`introduction.tex:184--190`）。
- 错路二，把收缩图当成终点：它只能给出 $M\to\Omega\subsetneq\mathbb{C}^n$；对策是加次数界、紧子集小性与逆球包含，用反证排除像的有限最大半径（`introduction.tex:209--213`）。
- 错路三，先完备后比较：它把 $h_t$ 完备当成前提；对策是先证标量比较、再从 Harnack 读出完备性（`introduction.tex:146--154`、`charts.tex:24--44`）。

三条错路的共同根子是同一个预设：无穷远处的几何必须受控。对策的共同点是把控制换成计量：正性用 $N$ 与 $v$ 计量，收缩用 $s$ 与 $q(s)=ds/d\tau$ 计量，满射用次数与小性计量（`introduction.tex:167--177`、`introduction.tex:184--190`、`introduction.tex:209--213`）。

回到结论本身：定理断言 $M$ 双全纯于 $\mathbb{C}^n$，且只此一句；它不声称 $g$ 经双全纯变为欧氏度量，也不假设一致曲率下界 $\inf_M\inf_{u,v}(\operatorname{Rm}(u,v,v,u)+\operatorname{Rm}(u,Jv,Jv,u))>0$、曲率上界 $\sup_M\lVert\operatorname{Rm}\rVert_g<\infty$、体积增长或任何拓扑条件（`introduction.tex:15--23`）。我最初设想的"让度量收敛到平坦"比定理强得多，而定理恰恰在弱假设下给出了强结论：流形是 $\mathbb{C}^n$，度量可以任意。

### 竖线申报与补充

§15 有一处逆映射的限制记号写成了带裸竖线的限制形式（把 $G_k^{-1}$ 限制到球上的那种写法），违反不写裸竖线的约定；未就地替换，按类别申报，清理时把该限制记号改写为不含竖线的表达即可。

补充几条收尾速查：

- 主定理 $\dim_{\mathbb{C}}M=n\ge1$，$M$ 完备连通非紧，$\operatorname{Rm}(u,v,v,u)+\operatorname{Rm}(u,Jv,Jv,u)>0$，则 $M\cong\mathbb{C}^n$（`introduction.tex:8--13`）。
- 紧致类比：正全纯双截曲率刻画 $\mathbb{CP}^n$（`introduction.tex:32--34`）。
- 一维情形：完备非紧正高斯曲率曲面共形等价于平面（`introduction.tex:27--31`）。
- 作者署名与日期：OpenAI，2026-09-23（`main.tex:57`、`main.tex:58`）。
- 章节装配次序：introduction、preliminaries、flow、discs、variation、ellipsoids、charts、dynamics、uniformization（`main.tex:91--99`）。
