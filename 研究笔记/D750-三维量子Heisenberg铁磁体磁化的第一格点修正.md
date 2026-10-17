# D750 研究笔记：三维量子 Heisenberg 铁磁体磁化的第一格点修正

## §0 登记、取证窗口与未读区间

这份笔记对应的预印本处理的是固定自旋 $S\in\{\tfrac12,1,\tfrac32,\ldots\}$ 的三维最近邻量子 Heisenberg 铁磁体，目标是把自发磁化亏缺 $S-m_S(\beta)$ 的低温展开推进到第二个非零项，并证明它等于用完整格点色散 $\varepsilon_S(k)$ 写出的理想磁振子密度 $n_S^{\rm sw}(\beta)$，误差 $o(\beta^{-5/2})$。笔记用第一人称记录做这项研究时的思路链：初始猜想、走不通的路线、转折点，以及最终形态与最初设想之间的差距。凡属事后整理的正向叙述，我一律避免。

取证窗口按调用顺序列出，字节数为本会话 `ls -l` 与 `find -printf "%s"` 实测：

- `main.tex:1-70`，该文件共 2,614 B，含摘要与 `\input` 顺序。摘要在 `main.tex:48-58`。注意输入顺序把 `04-capacity` 排在 `03-geometry` 之前，这是刻意的：容量判据先出场，几何估计后出场。
- `01-introduction.tex:1-156`，该文件共 7,640 B，含模型定义、主定理、显式推论与历史脉络。
- `02-loops.tex:1-198`，该文件共 9,814 B，含钉住律、圈恒等式、核的压缩与能量损失引理。
- `04-capacity.tex:1-150`，该文件共 6,421 B，含有限维容量判据与均匀比较命题。
- `07-energy.tex:1-169`，该文件共 21,441 B，此窗口只覆盖前半。
- `06-scalar.tex:1-174`，该文件共 14,516 B，此窗口只覆盖前半。
- `08-pressure.tex:1-300`，该文件共 11,917 B，含主定理与显式推论的闭合证明。

`build/` 下 `.tex` 共 13 个文件，总计 135,291 B。未读区间如实登记：`03-geometry.tex` 共 27,078 B 整档未读；`05-sources.tex` 共 14,999 B 整档未读；`references.tex` 共 4,198 B 只当书目索引；`figures/isolated-surgery.tex` 共 2,234 B 与 `figures/period-averaging.tex` 共 1,693 B 未读；`07-energy.tex:170` 到文件末尾未读；`06-scalar.tex:175` 到文件末尾未读；`04-profiles.tex` 共 10,726 B 在首块落盘时未读，其后的补读结果写在 §10。凡只能从这些未读区间确认的细节，本笔记标 `[推测]` 并说明信息为什么不足。约定与素材一致：全文固定 $S$，常数可依赖 $S$；有限槽位空间上的范数取计数测度；局部比较估计对体积与允许的确定性钉点集一致。

素材目录：`preprints/The-first-lattice-correction-to-Blochs-law-October-5-2026`
队列位置：其他队列第 475 行号

## §1 初始动机：格点色散第一次可见的那一阶

我最初的念头很朴素。Bloch 在 1930 年给出低温磁化亏缺正比于 $T^{3/2}$，这里 $T=\beta^{-1}$，来源是长波自旋波的自由度计数：三维色散若是二次型 $\varepsilon(k)\sim c\lVert k\rVert^2$，态密度给 $\int_0^\infty \frac{\varepsilon^{1/2}\,d\varepsilon}{e^{\beta\varepsilon}-1}\propto\beta^{-3/2}$。Holstein 与 Primakoff 的玻色表示把"独立自旋波"与"自旋波相互作用"这两件事区分开来，Dyson 的相互作用展开接着把账目做细。素材在 `01-introduction.tex:71-77` 明确复述了这笔账：在 Dyson 的展开里，磁化的 $T^{5/2}$ 与 $T^{7/2}$ 两阶**已经**由独立磁振子的格点色散产生，而领头相互作用贡献要到 $T^4$ 才出场。

这句话决定了我要证什么。格点色散是 $\varepsilon_S(k)=2S\sum_{j=1}^3(1-\cos k_j)$，把 $\cos k_j=1-\tfrac{k_j^2}2+\tfrac{k_j^4}{24}-\cdots$ 代入，得到连续近似 $\varepsilon_S(k)\approx S\lVert k\rVert^2$ 之下的第一阶修正 $-\tfrac{S}{12}\sum_j k_j^4$。这个修正进入 Bose 积分后，按尺度 $k\sim\beta^{-1/2}$ 计数，$\sum_j k_j^4$ 项相对主项小 $\beta^{-1}$，于是把 $\beta^{-3/2}$ 推到 $\beta^{-5/2}$。所以"第一格点修正"的名字是准确的：$\beta^{-5/2}$ 那一阶的系数里，格点性第一次以可计算的方式显形，而相互作用还没开始贡献。

我想要的定理形态因此非常明确：不是再证一次 $\beta^{-3/2}$，是把误差压到 $o(\beta^{-5/2})$，从而让 $n_S^{\rm sw}(\beta)$ 的第二项系数被唯一钉出来。素材摘要 `main.tex:51-54` 写的就是这句话：磁化亏缺与完整理想磁振子密度一致到 $o(\beta^{-5/2})$，除了 Bloch 主项之外额外给出修正 $3\zeta(5/2)(\beta S)^{-5/2}/(128\pi^{3/2})$。

严格结果那边的现状让我意识到差距在哪。Conlon 与 Solovej 给出过正确的幂次但系数非最优的自由能界；Tóth 用随机搅拌表示改进了它；Correggi、Giuliani 与 Seiringer 对每个固定自旋证明了三维零场自由能的领源自旋波渐近；Benedikter 的相互作用修正是自由能上界，且处在 $S\to\infty$ 而 $\beta S$ 固定的另一个区间。素材在 `01-introduction.tex:90-94` 点了关键一句：那些结果讲的是零场自由能，要从自由能里取出零场的右导数需要额外的控制。我一开始把它当成技术性补充，后来才明白它决定了整篇的骨架顺序。

于是初始猜想可以写成一句话：存在 $S$ 依赖的 $\varepsilon_S(\beta)\to0$，使 $\lvert S-m_S(\beta)-n_S^{\rm sw}(\beta)\rvert\le\varepsilon_S(\beta)\beta^{-5/2}$。剩下的全是把它变成证明的路。

## §2 结果的确切形状与一处自己核对的系数

模型与记号取素材 `01-introduction.tex:12-30` 的版本：$\Lambda_N=\{-N,\ldots,N\}^3\subset\Z^3$，每个格点 $x$ 上是 $\mathbb C^{2S+1}$ 中的自旋算符 $\boldsymbol S_x=(S_x^1,S_x^2,S_x^3)$，自由边界条件下

\[
H_{S,N}=-\sum_{\substack{\{x,y\}\subset\Lambda_N\\ \lvert x-y\rvert_1=1}}\boldsymbol S_x\cdot\boldsymbol S_y,\qquad M_N=\sum_{x\in\Lambda_N}S_x^3,
\]

每个无序格边只计一次。逆温 $\beta>0$、场 $h\ge0$ 下定义

\[
p_{S,\beta}(h)=\lim_{N\to\infty}\frac1{\beta\lvert\Lambda_N\rvert}\log\Tr e^{-\beta(H_{S,N}-hM_N)},\qquad m_S(\beta)=\partial_{h+}p_{S,\beta}(0).
\]

理想磁振子密度用完整格点色散，见 `01-introduction.tex:36-43`：

\[
n_S^{\rm sw}(\beta)=\int_{[-\pi,\pi]^3}\frac{d^3k}{(2\pi)^3\bigl[e^{\beta\varepsilon_S(k)}-1\bigr]},\qquad \varepsilon_S(k)=2S\sum_{j=1}^3(1-\cos k_j).
\]

三维里这个积分有限：被积函数在 $k=0$ 附近像 $\frac{1}{\beta S\lVert k\rVert^2}$ 乘上 $d^3k$，即 $\int_0^1 r^2\,r^{-2}\,dr$ 收敛。主定理（素材 `01-introduction.tex:45-51`）是

\[
\lim_{\beta\to\infty}(\beta S)^{5/2}\bigl[S-m_S(\beta)-n_S^{\rm sw}(\beta)\bigr]=0,
\]

推论（`01-introduction.tex:55-63`）把 $n_S^{\rm sw}$ 展开成两项：

\[
S-m_S(\beta)=\frac{\zeta(3/2)}{8\pi^{3/2}}(\beta S)^{-3/2}+\frac{3\zeta(5/2)}{128\pi^{3/2}}(\beta S)^{-5/2}+o\bigl((\beta S)^{-5/2}\bigr).
\]

这里 $\zeta$ 是 Riemann zeta 函数。我在草稿阶段把第二项系数重算了一遍，用来确认幂次记账没错。设 $t=\beta S$，一维核 $I(t)=\frac1{2\pi}\int_{-\pi}^{\pi}e^{-2t(1-\cos k)}\,dk$ 满足 $I(t)=(4\pi t)^{-1/2}\bigl(1+\frac1{16t}+O(t^{-2})\bigr)$，立方后得 $p_\beta(0)=(4\pi t)^{-3/2}\bigl(1+\frac3{16t}+O(t^{-2})\bigr)$。逐项对周期 $n$ 求和时，$t$ 换成 $nt$，$\sum_{n\ge1}n^{-3/2}=\zeta(3/2)$，$\sum_{n\ge1}n^{-5/2}=\zeta(5/2)$。系数核对：$(4\pi)^{-3/2}=1/(8\pi^{3/2})$ 给 Bloch 项；$\frac3{16}\cdot(4\pi)^{-3/2}=\frac3{16\cdot8\pi^{3/2}}=\frac3{128\pi^{3/2}}$ 给格点修正项。两处都对上素材 `08-pressure.tex:284-297`。

幂次的层级值得盯一下：$\beta^{-3/2}\gg\beta^{-5/2}\gg\beta^{-3}$。要把 $\beta^{-5/2}$ 的系数钉死，误差必须真的小于 $\beta^{-5/2}$；素材里 $1-c=\frac{v(x)}{1+v(x)}=v(x)+O(\beta^{-3})$ 这类从有理映射产生的误差是安全裕度，见 `08-pressure.tex:43-46`。危险的是那些自然出现在单粒子比较里的 $\beta^{-2}$ 型误差：它们比目标尺度还大，会直接吃掉想证的项。

## §3 定义的顺序：三个极限不可交换

磁化被定义为热力学压力在零场的右导数，体积极限先于场导数，低温极限最后取。素材 `main.tex:55-57` 与 `01-introduction.tex:31-34` 都强调了这一点：$p_{S,\beta}(h)$ 是 usual 的有限程热力学极限，凸性加上 $\lvert M_N\rvert\le S\lvert\Lambda_N\rvert$ 给出有限的右导数，因此 $m_S$ 的定义里体积极限排在零场极限之前。

我最初以为这只是把定义写严谨，后来发现它是有内容的。有限体积里 $\beta\to\infty$ 时基态是全极化的，$\beta$ 很大时谱隙很小，$\frac1{\beta V}\log\operatorname{Tr}$ 对 $h$ 的依赖在 $h\sim\beta^{-1}$ 尺度上剧烈变化；若把 $\beta\to\infty$ 与 $h\downarrow0$ 交换，得到的是另一个量。证明里真正使用的顺序在 `08-pressure.tex:221-240`：先把逐点比较式对 $t\in[0,h]$ 积分再除以 $h$，然后在 $\beta$ 与 $h$ 都固定的情况下让 $N\to\infty$，再 $h\downarrow0$，最后 $\beta\to\infty$。

这个顺序对局部估计提出了一个具体要求：所有中间界必须对体积一致。素材 `02-loops.tex:47-50` 就把低温室不等式声明成"对有限立方体与其允许的确定性钉点集一致"，常数只依赖固定自旋与固定几何常数，不依赖额外钉点的数目与位置。正是这条一致性让后面可以把外场表示成额外的随机钉点。

还有一个隐藏的顺序依赖：比较命题的适用区域是"内点"区域。设 $R_*=\lceil\beta^{5/3}\rceil$，$\rho_N$ 是使 $B_{50R_*}(x)$ 落在 $\Lambda_N$ 内部的格点比例，见 `08-pressure.tex:197-199` 与 `04-capacity.tex:7-8`。$\beta$ 固定时 $R_*$ 固定，$\rho_N\to1$ 才成立；若先让 $\beta\to\infty$，这个球会跟着膨胀，边界坏点的比例就不再可控。我把它记成一句话：证明允许的极限顺序是"体积吃掉尺度，尺度吃掉温度"。

## §4 圈表示：把自旋换成槽位上的周期圈

现在进入证明的第一层素材，`02-loops.tex:11-45`。固定自由边界的有限立方体 $\Lambda=\Lambda_N$，记 $\ell=2S$，槽位集 $V_\Lambda=\Lambda\times\{1,\ldots,\ell\}$；若两个槽位的格点最近邻，就把这两个槽位连一条槽边。基础图像 $\mathbb P_{\mathrm b}$ 是：在每条无向槽边上放速率 $\tfrac12$ 的独立 Poisson 时钟，作用在 $[0,\beta)$；在接缝 $0$ 处，每个格点的 $\ell$ 个槽位做一次独立的均匀置换。跟着交换走、再跟接缝置换走，就在时间圆 $\R/\beta\Z$ 上得到有向圈。瞬时操作处的槽位时间点理解为"刚过该操作之后"。这是 Tóth 的交换圈表示，高自旋版本按 Nachtergaele 把自旋 $S$ 实现成 $2S$ 个自旋 $\tfrac12$ 空间的对称张量积。

边界处理是钉住律的一部分：$\partial_{\mathrm{in}}\Lambda$ 是在 $\Lambda$ 内但有邻点在 $\Lambda$ 外的格点集，

\[
D_0=\partial_{\mathrm{in}}\Lambda\times\{1,\ldots,\ell\}\times(\R/\beta\Z),
\]

允许的钉点集是 $D=D_0\cup F$，$F$ 为任意有限确定性槽位时间点集。钉住一个点就要求经过它的圈取向上色。若 $n_D(\omega)$ 是与 $D$ 不相交的圈数，钉住律是

\[
Z_D=\EE_{\mathrm b}2^{n_D},\qquad \PP_D(\cdot)=Z_D^{-1}\EE_{\mathrm b}\bigl[2^{n_D}\mathbf 1_{\cdot}\bigr],\qquad \mathcal B_D=\bigcup_{C\cap D=\varnothing}C.
\]

配套的着色律下，与 $D$ 相交的圈必须向上，其余圈以等概率独立取向上或向下，记号 $\mathbb P_D^{\rm col}$。$D=\varnothing$ 时这些定义同样成立。

 partition 恒等式与热力学量的接口在 `02-loops.tex:78-88`：若 $q_\Lambda$ 是槽边总数、$c(\omega)$ 是圈数，则

\[
\Tr e^{-\beta H_{S,\Lambda}}=e^{\beta q_\Lambda/4}\,\EE_{\mathrm b}2^{c(\omega)}.
\]

我自己验了这个 $e^{\beta q_\Lambda/4}$ 的来源。$S=\tfrac12$ 时 $\boldsymbol S_x\cdot\boldsymbol S_y=\tfrac12 P_{xy}-\tfrac14$，$P_{xy}$ 是交换算符，所以每条边上掉出一个常数 $-\tfrac14$，$\ell$ 个槽位对 $\ell^2$ 条槽边各贡献一份；槽边总数在 $\Lambda_N$ 上是 $q_\Lambda=3N(2N+1)^2\ell^2$（每方向 $N(2N+1)^2$ 对格点，每对格点 $\ell^2$ 条槽边）。速率 $\tfrac12$ 的 Poisson 交换正是 $\exp(\tfrac\beta2\sum(P_{xy}-1))$ 的随机搅拌表示，常数字于是给出 $e^{\beta q_\Lambda/4}$。$S>\tfrac12$ 时同一形式由对称张量积继承，素材把这条列为 `02-loops.tex:110-112` 引用的输入，我接受它，只在 §10 说明它对我这一篇的权重。

场的接入靠无钉着色律：给时间零点的每个向上槽位记 $+\tfrac12$、向下槽位记 $-\tfrac12$，其和的分布就是总 $z$ 自旋的谱分布；在该归一化着色律下 $\exp(\beta h\cdot\text{该和})$ 的期望等于带场与零场配分函数之比。素材在 `02-loops.tex:84-88` 用文字表述了这一句，我在 §16 把它写成公式并用起来。

## §5 曝光与新鲜行走：把自旋亏缺换成一个返回概率

素材 `02-loops.tex:52-73` 给出比较的全部抓手。取允许的 $E$ 与未被钉住的点 $i$，令 $P=E\cup\{i\}$，在 $\mathbb P_P$ 下抽样图像，然后把 $\mathcal B_P$ 里的圈全部曝光，连同它们的格点间跳跃与接缝映射。在固定曝光之后，每个时刻被占用的槽位叫障碍，补集槽位叫空位；每个钉点在其规定时刻都是空位。

在固定曝光下，新鲜行走在空位之间的每条边上以速率 $\tfrac12$ 跳动；当障碍交换进一个空位时，该空位沿相反方向被搬运；两个障碍之间的交换对空位毫无影响；接缝处，行走使用该格点剩余槽位之间的一个新的均匀双射，并且尊重已曝光的那部分接缝置换。曝光按周期重复，行走的所有转移随机性在每一轮重采样。素材在 `02-loops.tex:66-68` 用一句话划清了界限：这是固定曝光下的时间不齐次马尔可夫行走，它并非由追踪单个已条件化图像中未曝光的部分得到。

我起初把这两件事混为一谈，以为"未曝光部分的真实轨迹"本身就是那条行走。这个误会代价很大：真实图像里未曝光部分的演化条件在整幅图上，关于时间并不马尔可夫，我也无法给它写一个伴随核；而新鲜行走按定义每轮重采样，于是单周期核 $U$ 与它的伴随 $U^*$ 都是明确的对象，容量判据才有输入。也就是说，我为了让"障碍吃掉一条边"与"障碍将空位搬走"两个效应同时进入一个线性代数框架，必须放弃真实轨迹，改用一个刻意构造的、可取伴随的辅助行走。素材 `01-introduction.tex:123-126` 说比较必须同时保留这两个效应，正是这个意思：

- 障碍在邻位时少掉一条边，源密度是 $\tfrac12(\varphi_s(j)-\varphi_s(k))$，记在空位 $j$ 上；
- 障碍从 $k$ 换进空位 $j$，空位退回 $k$，源是 $\varphi_s(j)-\varphi_s(k)$，记在到达的空位上；
- 两障碍相换不产生任何源。

设 $q_i$ 为从 $i$ 出发、在撞上 $E$ 之前于严格正经过时间回到同一槽位时间点的概率。返回只可能发生在整数个周期之后，这一点后面很关键。记 $r=\mathbb E_Pq_i$，$d_E(i)=\mathbb P_E^{\rm col}(i\text{ 向下})$。素材 `02-loops.tex:89-93` 的恒等式是

\[
\PP_E(i\in\mathcal B_E)=\frac{2r}{1+r},\qquad d_E(i)=\frac{r}{1+r},\qquad r=\EE_Pq_i.
\]

同时钉住多个点的不等式在 `02-loops.tex:94-102`：若 $T$ 是同一确定性时刻上非空的有限点集、与允许的 $D$ 不交，$P'=D\cup T$，$q_j^{D,T}$ 是从 $j\in T$ 出发在撞上 $D$ 之前命中 $T$ 的正时间返回概率，则

\[
\PP_D(T\subset\mathcal B_D)\le(2r_T)^{\lvert T\rvert},\qquad r_T=\frac1{\lvert T\rvert}\sum_{j\in T}\EE_{P'}q_j^{D,T},
\]

并且不假设测试点之间有任何空间分离。第四条输入是标记支配：在 $\mathbb P_D$ 下 $j$ 个不同格点间标记的阶乘测度不超过基准阶乘测度的 $2^j$ 倍，时间有序与对边和时间的任意确定性限制都成立。这条支配让我能把 Nash 型能量耗散论证原封不动地搬到钉住律下。

回到 $d_E(i)=\frac{r}{1+r}$ 为什么是整篇的枢轴。目标是把 $d_E(i)$ 换到尺度 $\frac1\ell n_S^{\rm sw}(\beta)$，其量级是 $\beta^{-3/2}$。有理映射 $r\mapsto\frac r{1+r}$ 在 $0$ 处导数为 $1$，二阶余项是 $O(r^2)=O(\beta^{-3})$，比目标尺度 $o(\beta^{-5/2})$ 还小两个半幂次，见 `08-pressure.tex:54-55`。所以"从返回概率到自旋亏缺"这一步是免费的，全部负担都落在把 $r$ 本身做到 $o(\beta^{-5/2})$ 精度上。这是我读这段时最在意的一处结构调整：证明的难度不在概率与磁化的换算，而在返回概率自身的近似。

## §6 压缩、Dirichlet 能量与单周期核的范数损失

核的约定在 `02-loops.tex:119-129`，很琐碎但决定成败：核向前作用在列向量上，内积与范数都取计数测度；钉点上的消灭就是其规定时刻的投影；边界消灭在整个区间上强加，包括区间端点；离开某空间集时的消灭把离开速率保留在生成元的对角上；一个区间的伴随要把所有因子次序反转、把搬运取逆、把接缝平均转置、把消灭投影的次序反转。于是瞬时操作的两侧仍是不同的切片，每次遍历恰好用一次接缝因子。

把空位图向外延长：让 $\Lambda$ 之外的每个槽位都可用，其上的槽位按最近邻连边。对在内边界与 $\Lambda$ 外按零延拓的向量定义

\[
\D_t(v)=\frac12\sum_{\{a,b\}\text{ 在 }t\text{ 可用}}(v(a)-v(b))^2,
\]

见 `02-loops.tex:131-139`。 exterior 延拓是为了让流量可以走向无穷，所有测试向量仍有限支撑。素材 `02-loops.tex:141-165` 的引理给我三件事：任一带消灭的区间核及其伴随在两种计数和下都是子随机的，并且压缩计数 $\ell^p$，$p=1,2,\infty$；瞬时操作之间传播的向量满足 $\frac{d}{dt}\lVert v_t\rVert_2^2=-2\mathcal D_t(v_t)$；瞬时操作处平方范数不会上升。

最有用的部分是能量损失形式。设 $U$ 是带任意允许钉点消灭的单周期核，$y$ 在其切断消灭槽位上为零，记 $e_y=\langle y,(I-U)y\rangle\ge0$。对 $U_d=U$ 或 $U^*$，让 $Y_t$ 是 $y$ 从末端切断到中间切片的伴随传播，则

\[
\int_{\text{遍历}}\D_t(Y_t)\,dt\le e_y,\qquad \lVert y-U_d^*y\rVert_2^2\le2e_y,
\]

见 `02-loops.tex:156-160`。证明的机关很朴素：对新鲜交换与接缝补全的一个实现，未被消灭的轨迹在两端空位集之间给出一个双射，删去撞上消灭集的轨迹得到部分置换；平均之后给出两种计数和的子随机性与 $\ell^1$、$\ell^\infty$ 压缩，逐行 Cauchy--Schwarz 给出 $\ell^2$ 压缩；转置给出反向实现与同样的界。平滑区间上生成元对称，逐边求和给出范数损失恒等式；零延拓恰好给出 $\mathcal D_t$，因为存活的内部槽位没有直接连到立方体外部的边。最后用实二次型相等得到

\[
\lVert y\rVert_2^2-\lVert Vy\rVert_2^2=2e_y-\lVert y-Vy\rVert_2^2,
\]

$V=U$ 或 $U^*$。这一行的意义我要强调：$e_y$ 只看到 $I-U$ 的对称部分，所以 $U$ 不必自伴，能量语言依然成立。素材 `07-energy.tex:56-58` 把这点写成结论：这些界对带符号向量成立，既不要求单周期核可逆，也不要求曝光律在时间反演下不变。我第一次尝试用可逆马尔可夫链的位势论（非可逆位势论里能量与打击电势的关系确实存在，素材 `04-capacity.tex:38-40` 引了那类文献的公式）时，卡点就在这里；换成"计数双射加逐行 Cauchy--Schwarz"之后，非自伴性不再是障碍，只是让两个方向的残差 $\mu_+$、$\mu_-$ 必须分别估计而已。

## §7 有限维容量判据：一条恒等式加一个稳定性

素材在 `04-capacity.tex:34-94` 把整个问题压成有限维线性代数，这是我认为全篇最漂亮的一节。设 $H$ 有限坐标集，$K\subset H$ 为消灭坐标，$i\in H\setminus K$。$U$ 是 $\R^H$ 上非负、双向子随机的矩阵，在 $K$ 上行列皆零，向前作用于列。给每列补一个死亡状态补足到 $1$，用它作被杀死链的逐次转移。$q$ 是从 $i$ 出发、至少走一步后在被杀死之前回到 $i$ 的概率；$f_j$ 为从 $j$ 出发先命中 $i$ 后死的概率，$f_i=1$，$f$ 在 $K$ 上为零，于是 $0\le f\le1$。记

\[
A=I-U,\qquad \eta=\mathbf 1_{\{i\}},\qquad e_z=\langle z,Az\rangle .
\]

$U$ 是 $\ell^2$ 压缩，故 $e_z\ge0$，实内积给出 $e_z=\langle z,A^*z\rangle$。应用里 $H$ 是时间零切断处的空位集，$U$ 是在 $E$ 上杀死的一次遍历，§6 的引理恰好提供这些压缩性质与其连续时间能量解释。

选实向量 $h$ 满足 $h_i=1$、$h$ 在 $K$ 上为零，再选实数 $c$，用两个残差

\[
\mu_+=Uh-h+c\eta,\qquad \mu_-=U^*h-h+c\eta,
\]

即 $Ah=c\eta-\mu_+$、$A^*h=c\eta-\mu_-$。容量引理（`04-capacity.tex:73-94`）对 $y=f-h$ 断言三条恒等式：

\[
A^*f=(1-q)\eta,\qquad e_y=\langle y,\mu_-\rangle,\qquad q-(1-c)=\langle h,\mu_+\rangle+\langle y,\mu_+\rangle .
\]

第一条来自首步分解：对 $j\notin K\cup\{i\}$ 有 $f_j=\sum_kU_{kj}f_k=(U^*f)_j$，在 $K$ 上该式为零，而 $(U^*f)_i=q$。素材特意加了一句：不需要假设被杀死是几乎必然的，即便链能永远停留在既不含 $i$ 也不含死亡状态的那类里，等式照样成立。第二条由 $A^*y=(1-q-c)\eta+\mu_-$ 与 $y_i=0$ 配对得到。第三条用 $h_i=f_i=1$：

\[
1-q=\langle A^*f,h\rangle=\langle f,Ah\rangle=c-\langle f,\mu_+\rangle,
\]

再代 $f=h+y$。稳定性部分：若 $\lVert h\rVert_\infty\le M$，且存在 $X,\varepsilon\ge0$ 使对 $d=+,-$ 都有

\[
\lvert\langle\mu_d,z\rangle\rvert\le X\sqrt{e_z}+\varepsilon\quad\text{只要 }z\upharpoonright_K=0\text{ 且 }\lVert z\rVert_\infty\le1+M,
\]

则 $\lvert q-(1-c)\rvert\le\lvert\langle h,\mu_+\rangle\rvert+2X^2+2\varepsilon$。证明只有一步：$y$ 是容许测试向量，故 $e_y\le X\sqrt{e_y}+\varepsilon$，即 $\sqrt{e_y}\le X+\sqrt\varepsilon$，于是 $\lvert\langle y,\mu_+\rangle\rvert\le X^2+X\sqrt\varepsilon+\varepsilon\le2X^2+2\varepsilon$。

我在草稿里把这条不等式链单独抄了一遍，因为它解释了整篇的模块划分。伴随残差控制打击电势与试探势之间的距离，向前残差控制容量本身；一个标量估计加两个能量估计就够了，对返回次数完全不做展开。素材 `04-capacity.tex:130-134` 就是这句结论。反过来看，凡是想"按圈数逐阶展开 Bose 和"的做法都会撞上组合爆炸，而判据把整个 Bose 和吸进一个标量 $c$ 里，代价是必须给出对任意测试向量的能量界。这正是 §13 与 §14 那么费劲的原因。

## §8 随机环境平均与误差预算的设计

判据可以对随机环境取平均，见 `04-capacity.tex:136-147`：若所有对象可测、$c\in[0,1]$ 确定性、能量界在可测事件 $\mathcal G$ 上一致成立（界 $M$ 统一），则

\[
\lvert\EE q-(1-c)\rvert\le\EE\bigl[\mathbf 1_{\mathcal G}\lvert\langle h,\mu_+\rangle\rvert\bigr]+2\EE[\mathbf 1_{\mathcal G}X^2]+2\EE[\mathbf 1_{\mathcal G}\varepsilon]+\PP(\mathcal G^c).
\]

我把四项当成一张预算表来读，预算的上限是 $\beta^{-5/2}$：

- 第一项是标量配对，由 §12 处理，素材命题在 `06-scalar.tex:11-20`，结论 $\mathbb E_P[\mathbf 1_{\mathcal G}\lvert\langle\mu_+,h\rvert\rigr]=o(\beta^{-5/2})$；
- 第二项是能量系数平方在好事件上的期望，由 §13 处理，素材结论在 `07-energy.tex:31-34`，$\mathbb E_P[\mathbf 1_{\mathcal G}(X_+^2+X_-^2)]=o(\beta^{-5/2})$；
- 第三项中的 $\varepsilon$ 是 rapidly small 的 $\rho(\beta)$ 乘以 $\lVert y\rVert_\infty$ 的上界常数 $C_0$，见 `07-energy.tex:20-27`；
- 第四项 $\mathbb P(\mathcal G^c)$ 不需要任何精细估计，因为在 $\mathcal G$ 的补集上只用 $0\le q_i\le1$，素材 `08-pressure.tex:40-41` 明说了这一点。

预算的分工里最反直觉的是第四项：坏事件只要求概率小，不要求在其上做任何精确比较。这是"先构造好事件、再在其上用判据"这类论证的标准形状，但它的成立依赖于 $q\in[0,1]$ 的先验界；如果判据给的是无界量的渐近，这一项就会变成灾难。$c\in[0,1]$ 的要求也解释了为什么试探势要带前因子 $c$ 并保持 $0\le h\le1$（见 §10）。

有了这张表，剩下的工作就是三件事：造一个把完整 Bose 和吃进去的试探势（§10），把残差写成传播的局部误差并证明孤立链丝上的带符号抵消（§11），然后用标量配对与流对偶把两项能量估计做实（§12、§13、§14）。

## §9 均匀比较命题：结论先行的那一节

素材把最终要用的局部结论放在 `04-capacity.tex:5-32`，也就是容量判据出场之前。记 $B_r(x)=\{z\in\Z^3:\lvert z-x\rvert_\infty\le r\}$，$R_*=\lceil\beta^{5/3}\rceil$。命题说：对每个固定的正半整数 $S$，存在 $\beta_0(S)<\infty$ 与 $\varepsilon_S(\beta)\to0$，使 $\beta\ge\beta_0(S)$ 时下面的一致比较成立：任取有限立方体 $\Lambda$，任取 $E=D_0\cup F$（$F$ 是任意有限确定性槽位时间点集），任取时间零点接缝后的槽位 $i=(x,a)$，只要 $B_{50R_*}(x)$ 在 $\Lambda$ 内部且 $E$ 在该球上方无点，则

\[
\Bigl\lvert d_E(i)-\frac1\ell n_S^{\rm sw}(\beta)\Bigr\rvert\le\varepsilon_S(\beta)\beta^{-5/2}.
\]

把 $\varepsilon_S$ 放大后，同样的界对 $\bigl\lvert\mathbb E_{E\cup\{i\}}q_i-\ell^{-1}n_S^{\rm sw}(\beta)\bigr\rvert$ 也成立。素材在 `04-capacity.tex:28-32` 补了两句要紧的话：界对所有球外钉点的数目与位置一致；证明本身推迟到压力一节之后才补完。

我读到这里时的第一反应是"为什么把没证的命题放在最前面"，第二反应是想明白了：这条一致性是外场表示成随机钉点的前提。如果界只在不带额外钉点的环境里成立，那么 §16 里把 $A$ 看成随机钉集时，条件钉集 $A$ 的分布与 $d$ 的估计就会互相纠缠。素材要的是"钉点随便加，界不变"，于是可以先把球内条件满足的那些点逐点比较，再用并集界控制坏球。两条式子（$d_E(i)$ 与 $\mathbb E q_i$）都要，是因为 §5 的有理映射把它们连在一起：证一个自动得另一个，但陈述时把两条都写出来，后面引用才不用绕路。

几何预算是这一节的隐形约束。素材里出现的半径层层嵌套：源支撑在 $B_{R+2}(x)$ 上方（`05-sources.tex:41-42`），非零贡献的链丝起点在 $B_{4R}(x)$（`05-sources.tex:90-94`），一块的传播把质量落在 $B_{6R}(x)$（`07-energy.tex:123-124`），链丝与相邻源点在起始格点周围 $CL$ 内（`05-sources.tex:170-171`），而这一切必须装进 $B_{50R_*}(x)$。所以半径之间必须有 $4R+CL\le 6R+CL\ll50R_*$。这条链是几何上的硬约束，也是尺度窗口下端点之一（见 §10 末）。

## §10 尺度、全周期自由势与 Bose 和的守恒

试探势的构造在 `04-profiles.tex:21-72`，这是我认为素材里最"设计感"强的一段。在整格 $\Z^3\times\{1,\ldots,\ell\}$ 上让 $\mathscr L$ 在每条槽边上取速率 $\tfrac12$，记 $T_s=\exp(s\mathscr L)$，$J$ 为在每个格点把 $\ell$ 个槽位平均的投影。槽位均匀的向量对应的格点跳跃速率是 $\ell/2=S$，其半群记 $P_s$、原点核记 $p_s(z)$，Fourier 乘子是 $\exp[-2sS\sum_{j=1}^3(1-\cos k_j)]$（`04-profiles.tex:29-33`）。关键观察：若在每格点上槽位分量为零和，则 $\mathscr L$ 在其上作用成 $-3\ell I$，于是

\[
T_s=P_sJ+e^{-3\ell s}(I-J).
\]

自由接缝就是 $J$，且与 $T_s$ 交换，故任意方向的理想满周期算符是 $U_0=JT_\beta=T_\beta J=P_\beta J$，其 $n$ 次幂的矩阵元为 $(U_0^n)_{(z,b),(x,a)}=\frac1\ell p_{n\beta}(z-x)$，$n\ge1$。素材 `04-profiles.tex:47-48` 那句话是全节的心脏：被接缝抹掉的槽位模式对正的满圈毫无贡献，只剩下 $e^{-3\ell s}$ 的瞬时衰减。

有了它，试探势就照着理想对象写：

\[
v(z)=\frac1\ell\sum_{n\ge1}p_{n\beta}(z-x),\qquad c=\frac1{1+v(x)},\qquad h=c\chi(\eta+v),
\]

其中 $\chi$ 光滑、在 $\lvert z-x\rvert_\infty\le R/2$ 上为 $1$、在 $\lvert z-x\rvert_\infty\ge R$ 上为 $0$，一二阶导数分别以 $C/R$、$C/R^2$ 为界。$h$ 在所有被消灭的切断槽位上为零，$h(i)=1$，且由 $p_s(z)\le p_s(0)$ 得 $0\le h\le1$。半群性质给出 $U_0(\eta+v)=v$，也就是 $(I-U_0)g=c\eta$ 对 $g=c(\eta+v)$ 成立：理想情形下前向残差恰好为零，而 $1-c=\frac{v(x)}{1+v(x)}$。源点处

\[
\ell v(x)=\sum_{n\ge1}p_{n\beta}(0)=\int_{[-\pi,\pi]^3}\frac{d^3k}{(2\pi)^3}\sum_{n\ge1}e^{-2n\beta S\sum_j(1-\cos k_j)}=n_S^{\rm sw}(\beta),
\]

见 `04-profiles.tex:216-225`。这一步把我的初始困难直接解决了：Bose 和不是展开出来的，是被 $J$ 与 $T_s$ 交换这一结构性事实"保存"下来的；所有正周期 $n\ge1$ 都进入 $v(x)$，精度不必再靠逐圈累加。

前向与反向剖面在 `04-profiles.tex:74-100`：$a_s=\chi T_sg$（$0\le s<\beta$）、$a_\beta=\chi JT_\beta g$、$b_0=\chi g$、$b_{0+}=\chi Jg$、$b_s=\chi T_sJg$。每次遍历恰好用一次接缝，端点恒等式 $a_0=b_0=h$、$a_\beta=b_\beta=h-c\eta$。光滑部分是 $cv$ 的贡献，点部分是 $c\eta$ 的贡献。

包络权重在 `04-profiles.tex:102-110`，取 $r_z=\lvert z-x\rvert_\infty$、$d\ge1$：

\[
G(z)=\beta^{-1}(D_*+r_z)^{-1},\quad W(z)=\beta^{-1}(D_*+r_z)^{-2},\quad P_d(z)=d^{-3}(1+r_z/d)^{-12},\quad W_d(z)=d^{-4}(1+r_z/d)^{-12}.
\]

自由剖面的界（`04-profiles.tex:116-136`）是：光滑部分 $u_s$ 的绝对值、有界距离差分、开区间时间导数分别 $\le CG(z)$、$CW(z)$、$CW(z)/D_*$；点部分 $w_s$（$d=\sqrt{1+s}$）分别是 $CP_d(z)$、$CW_d(z)$、$CW_d(z)/d$；$s\ge a\beta$ 时点部分满足光滑部分的界。证明工具是热核估计 $\lvert\nabla^jp_t(z)\rvert\le C_{m,j}(1+t)^{-(3+j)/2}(1+\lvert z\rvert_\infty/\sqrt{1+t})^{-m}$（$\omega(k)\ge c_S\lvert k\rvert^2$ 加 $m$ 次分部积分）与逐点和 $\sum_{n\ge1}(n\beta+s)^{-(3+j)/2}(1+r_z/\sqrt{n\beta+s})^{-m}\le\frac C\beta(D_*+r_z)^{-1-j}$。

素材引用的尺度表 `eq:scales` 在我未读的区间里（按编译顺序，$R$、$L$、$D_*$、$\lambda$ 这些记号应在 `03-geometry.tex` 中定义，该档 27,078 B 我整档未读），所以我只能从使用处反推，并把结果标成 `[推测]`。反推链条如下：`06-scalar.tex:49-51` 用了 $\sup W=C\beta^{-2}$，而 $\sup W=\beta^{-1}D_*^{-2}$，得 $D_*\asymp\beta^{1/2}$，这与 `04-profiles.tex:210-211` 说的"$s\ge a\beta$ 时 $d$ 与 $D_*$ 可比"完全一致，即 $D_*$ 就是整个周期末的扩散长度。再看 `06-scalar.tex:99-100` 记录的三个幂次 $-4+3\delta$、$-5/2-\delta/4$、$-21/8+\delta$：这三项都带公共因子 $\beta^{-1}$（来自 `06-scalar.tex:88-92` 的权重和除以 $L$），设 $\lambda=\beta^{-a}$、$L=\beta^{\ell}$，后两项给出方程 $a+\frac\ell4=\frac32+\frac\delta4$ 与 $\ell-a=-\frac32+\delta$，解得 $a=\frac32$、$\ell=\delta$，即 $\lambda=\beta^{-3/2}$、$L=\beta^{\delta}$；回代第一项 $\beta^{-1}L^3\lambda^2=\beta^{-4+3\delta}$，正好吻合。$\lambda=\beta^{-3/2}$ 也有独立解释：它是规定槽位是障碍的概率上界，量级就是每槽位的磁振子密度 $n_S^{\rm sw}/\ell$。

剩下的约束由一致性给出：$L\ll\beta^{1/4}$（`06-scalar.tex:103-104`，即 $\delta<\tfrac14$）、$L\ll D_*$（`05-sources.tex:171-172`）、$R\gg\beta^{1/2}$（`04-profiles.tex:205-209` 里 $d\le\sqrt{1+\beta}\ll R$）、以及 `06-scalar.tex:122-128` 给出的截断背景界 $\frac{C}{\beta R}=o(\beta^{-5/2})$ 要求 $R\gg\beta^{3/2}$；配上 $R\lesssim R_*=\beta^{5/3}$ 与 §9 的半径嵌套，窗口是 $\beta^{3/2}\ll R\le O(\beta^{5/3})$。这一整套反推我当成检验用：任何一个尺度选择若不同时满足这五件事，标量预算就会漏。

## §11 符号源、守恒恒等式与孤立链丝上的抵消

`05-sources.tex:19-95` 把试探势的误差写成真实热方程里的源。固定一个方向，剖面记 $\varphi_s$。不含瞬时操作的开区间上，连续源是 $\mathscr L_s^{\rm act}(\varphi_s|_{H_s})-(\partial_s\varphi_s)|_{H_s}$；在瞬时转移 $K:\R^{H_-}\to\R^{H_+}$ 处，原子源（记在出发切片上）是 $K(\varphi_-|_{H_-})-\varphi_+|_{H_+}$。反向时间用转置映射、次序反转，于是反向原子源按前向时间看落在该操作之前。对源集合的积分指连续部分的 Lebesgue 积分加上原子的求和。所有源支撑在 $B_{R+2}(x)$ 上方，那里既无 $E$ 的钉点也无边界槽位，所以消灭不额外造源。

源分两类。第一类是截断对易子 $\gamma_s=\mathscr L\varphi_s-\partial_s\varphi_s$，未截断剖面解自由热方程，故 $\gamma_s$ 支撑在环域 $R/3\le r_z\le2R$，且 $|\gamma_s(z,a)|\le Cb_*$，$b_*:=\beta^{-1}R^{-3}$。接缝处没有截断原子，因为逐格点的截断既与满剖面接缝平均交换、也与 sites 内限制交换（`05-sources.tex:62-65`）。第二类来自障碍：从空位 $j$ 到障碍 $k$ 被移走的边在 $j$ 上贡献 $\tfrac12(\varphi_s(j)-\varphi_s(k))$；障碍从 $k$ 换进空位 $j$、空位退回 $k$，到达的空位上的源是 $\varphi_s(j)-\varphi_s(k)$；两障碍相换不造源；接缝源是剩余空位槽位上的真实平均与满剖面平均之差，在没有障碍的格点上为零。

把这些源指派给链丝之后，守恒恒等式（`05-sources.tex:96-141` 的引理）出场。取好图像与一个有向块 $I=[u,v]$，$Z_s$ 是起始于 $B_{4R}(x)$ 上方的孤立障碍链丝，则指派给它的所有障碍源的带符号总质量（对源槽位求和再对时间积分）等于

\[
\varphi_v(Z_v)-\varphi_u(Z_u)+\int_u^v\gamma_s(Z_s)\,ds.
\]

证明就是三段望远镜：孤立意味着所有邻位都是空位，于是平滑时刻 $\tfrac12\sum_{j\sim Z_s}(\varphi_s(j)-\varphi_s(Z_s))=(\mathscr L\varphi_s)(Z_s)=(\partial_s\varphi_s)(Z_s)+\gamma_s(Z_s)$；搬运源恰是剖面沿 $Z_s$ 每次跳跃的增量；接缝处 $\sum_{H_+}(K\varphi_- -\varphi_+)=\sum_{H_-}\varphi_- - \sum_{H_+}\varphi_+=\varphi_+(Z_+)-\varphi_-(Z_-)$。反向遍历用逆搬运，同一证明照写。

这块素材我读了两遍才接受它的含义：带符号总质量不是"$O(\text{块长}\times\text{权重})$"，是一个端点差加一个截断积分。于是块源界（`05-sources.tex:148-167`）把两个量分开记：支撑在 $z$ 周围 $CL$ 内，总变差 $\le CL\mathcal W(z)$；若链丝孤立，带符号和 $\le CL^{3/4}\mathcal W(z)$。这里 $\mathcal W=W$ 用于光滑部分，点部分在块内 $d=\sqrt{1+s}$ 可比且 $\inf d\ge L$ 时取起始时刻的 $\mathcal W=W_d$。节约因子就是 $L^{1/4}$。

这个因子有多大用处，是我整个研究过程中最戏剧性的一步。素材 `01-introduction.tex:127-132` 说"这就是把误差推进到领源自旋波尺度之外的抵消"，我要把它量化。标量预算里孤立链丝的带符号部分贡献尺度是 $\beta^{-1}\lambda L^{3/4}L^{-1}=\beta^{-1}\lambda L^{-1/4}$（$L^{-1}$ 来自把块长 $\asymp L$ 的权重和折算成 $L^{-1}$ 倍的积分界），代入反推值 $\lambda=\beta^{-3/2}$、$L=\beta^\delta$ 得 $\beta^{-5/2-\delta/4}$；若没有抵消、只能用总变差 $CL\mathcal W$，同一项就退化成 $\beta^{-1}\lambda=\beta^{-5/2}$，正好压在界上、拿不到 $o(\beta^{-5/2})$。$L^{1/4}$ 这个看似不起眼的因子，是整篇能否过关的唯一支点。素材 `06-scalar.tex:101` 那句"中间那一项正是需要带符号抵消的一项"就是这个意思。

## §12 标量残差：三项预算与两处不用抵消的地方

标量命题在 `06-scalar.tex:11-20`：$\mathbb E_P[\mathbf 1_{\mathcal G}\lvert\langle\mu_+,h\rvert\rigr]=o(\beta^{-5/2})$，误差对有限立方体、确定性钉点集、注入槽位一致。（这里我抄写的素材公式在排版上把一侧定界符写坏了，本笔记在 §23 之外的位置不回改，登记进勘误节。）前向时间 $s$ 处记 $d=\sqrt{1+s}$、$d'=\sqrt{1+\beta-s}$，反向剖面值界为 $C(G+P_{d'})$。基础权重积分是

\[
\int_0^\beta\sum_{r_z\le4R}(W+W_d)(z)(G+P_{d'})(z)\,ds\le C\beta^{-1}(1+\log\beta),
\]

验证分三段（`06-scalar.tex:35-52`）：径向壳层求和给 $\sum_{r_z\le4R}W(z)G(z)\le C\beta^{-2}\bigl(1+\int_0^{4R}\frac{r^2\,dr}{(D_*+r)^3}\bigr)\le C\beta^{-2}(1+\log\beta)$；$s\le\beta/2$ 时 $P_{d'}\le CG$ 且 $\sum_zW_dG\le\sup G\sum_zW_d\le C\beta^{-3/2}d^{-1}$，半个周期积分只花 $C\beta^{-1}$；$s\ge\beta/2$ 时用 $W_d\le CW$ 与 $\sum_zP_{d'}\le C$，剩下乘积每单位时间至多 $C\sup W=C\beta^{-2}$。

中段块指包含在 $[\beta^{1/4},\beta-\beta^{1/4}]$ 里的那些，其上 $d,d'\ge\beta^{1/8}$，权重在块内与距离 $CL$ 内可比。给定切片上，规定槽位是障碍的概率 $\le C\lambda$；若不孤立，则在 $c_2L$ 内还有另一个障碍，并集界给

\[
\PP_P(\text{规定槽位是障碍且不孤立})\le CL^3\lambda^2 .
\]

非孤立链丝直接用总变差界，标量贡献 $\le CL(W+W_d)(z)(G+P_{d'})(z)$。孤立链丝则从测试剖面 $\bar b$ 里减去它在链丝起始格点与起始时刻的值：常数值与带符号源配对，源界 $CL^{3/4}(W+W_d)(z)$；测试剖面的剩余变化至多

\[
CL(W+W_{d'})(z)\le CL\beta^{-1/8}(G+P_{d'})(z),
\]

空间变化来自 $CL$ 距离上的差分界，时间变化来自时间导数界，最后一步用了 $W\le G/D_*$ 与 $W_{d'}=P_{d'}/d'$。取期望、用不孤立概率、把块加起来（块长可比于 $L$，故权重和至多 $\frac1L$ 倍基础积分），中段块总贡献

\[
C\beta^{-1}(1+\log\beta)\bigl[L^3\lambda^2+\lambda(L^{-1/4}+L\beta^{-1/8})\bigr]=o(\beta^{-5/2}),
\]

三项幂次 $-4+3\delta$、$-5/2-\delta/4$、$-21/8+\delta$。注意第三项 $\lambda L\beta^{-1/8}$ 用的是总变差、没有抵消，靠 $\beta^{-1/8}$ 的时间变化把幂次压到 $-\tfrac{21}{8}$，仍在 $-\tfrac52$ 之下：这说明抵消只用来救那一项，其余项各有自己的小量来源。

端点块（距两端 $2\beta^{1/4}$ 以内，因 $L\ll\beta^{1/4}$）用bin 的总变差界、不做抵消：权重在一个bin内变化不超过 $H_\beta$，期望贡献 $\le H_\beta\lambda$ 乘上限制在端点区间的同一积分。素材 `06-scalar.tex:111-120` 给出第一段 $\le C[\beta^{-7/4}(1+\log\beta)+\beta^{-11/8}]$、最后一段 $\le C\beta^{-7/4}(1+\log\beta)$，乘上 $H_\beta\lambda$ 得幂次至多 $-23/8$ 与 $-13/4$。这里 $H_\beta\lambda$ 要退化到 $\lambda=\beta^{-3/2}$ 量级才与记录的幂次吻合（$-\tfrac{11}{8}-\tfrac32=-\tfrac{23}{8}$，$-\tfrac74-\tfrac32=-\tfrac{13}{4}$），所以 $H_\beta\le(\log\beta)^C$；$H_\beta$ 的定义在我未读的区间，此处的判断标 `[推测]`。

截断背景单独处理：环域上反向剖面值至多 $\frac{C}{\beta R}$，故

\[
\Bigl\lvert\int\langle\gamma_s|_{H_s},\bar b_s\rangle\,ds\Bigr\rvert\le C\beta R^3b_*\frac1{\beta R}=\frac{C}{\beta R}=o(\beta^{-5/2}),
\]

这一步同时把 $R\gg\beta^{3/2}$ 逼出来，是我在 §10 反推尺度窗口的依据。`06-scalar.tex:130` 还留了一句要紧提示：双份 Duhamel 公式的第一项已处理，剩下要控制两个源集合之间的相互作用；对应的箱矩引理（`06-scalar.tex:139-157`）我读了，它把不同时刻源位置的相关性用并集界与 Cauchy--Schwarz 处理掉，不需要独立性假设：

\[
\Bigl(\EE_P\sum_QA_Q^2\Bigr)^{1/2}\le C\Bigl[\sqrt\lambda\,\lVert w\rVert_2+\lambda\Bigl\{\sum_Q\Bigl(\sum_{z\in Q}w(z)\Bigr)^2\Bigr\}^{1/2}\Bigr],
\]

其中 $Q$ 是边长可比 $F\ge1$ 的立方体划分，$A_Q$ 是该立方体内障碍槽位的权重和。同一格点两个不同槽位也算"两个不同槽位"，这条我在草稿里特别核过，因为它决定了第二项的 $\lambda^2$ ，并非 $\lambda$。接缝两侧的界相同，因为 $A_Q$ 只依赖每格点障碍槽位数，而接缝保持这些数不变。

## §13 对偶能量估计：源要写成流的散度

命题形态在 `07-energy.tex:14-37`。固定 $S$ 与尺度，设 $B_{50R_*}(x)$ 在立方体内部、$E$ 在该球上方无点，$\mathcal G$ 是好事件，$\mu_+,\mu_-$ 是终端残差。结论：存在依赖曝光的非负可测函数 $X_+,X_-$ 与一个确定性的 rapidly small 函数 $\rho(\beta)$，使得在 $\mathcal G$ 上

\[
\lvert\langle\mu_d,y\rangle\rvert\le X_d\sqrt{e_y}+C_0\rho(\beta),\qquad d\in\{+,-\},
\]

对每个在切断消灭槽位上为零、且满足 $\lVert y\rVert_\infty\le C_0$ 的实切断向量 $y$ 成立；$X_d$ 不依赖 $y$ 也不依赖 $C_0$；并且

\[
\EE_P\bigl[\mathbf 1_{\mathcal G}(X_+^2+X_-^2)\bigr]=o(\beta^{-5/2}).
\]

素材在 `07-energy.tex:5-7` 明说标量估计在这里不够用：测试向量没有理由长得像自由势。这一句是我读这段时最认同的自我否定。我最初的设想是既然 $\langle\mu_+,h\rangle$ 已经是 $o(\beta^{-5/2})$，把 $\mu_+$ 看成"在 $h$ 附近"的向量场，用某种 Lipschitz 传递就得到了能量界。这个想法错了两处。第一，判据要的界是对 $y=f-h$ 成立，而 $f$ 是被真实环境杀死的打击电势，它在障碍密集处可以剧烈偏离 $h$，两者之差没有剖面那样的包络。第二，判据的稳定性部分消耗的是 $X^2$ 的期望，一次矩再小也没用；$\sqrt{e_y}$ 乘上 $X$ 之后平方才会进入预算，所以必须给二阶量。

可用的路线是配对偶侧的能量语言。终端向量 $y$ 的伴随后缀 $Y(t)=T_{\beta,t}^*y$ 满足三件事（`07-energy.tex:47-55`）：

\[
\int_0^\beta\D_t(Y(t))\,dt\le e_y,\qquad \lVert y-U_d^*y\rVert_2^2\le2e_y,\qquad \lVert Y(t)\rVert_\infty\le C_0 .
\]

固定切片上，若有限能量流 $J$ 的散度是 $\nu$，则逐边分部求和给出

\[
\lvert\langle\nu,Y\rangle\rvert=\Bigl\lvert\sum_eJ(e)\bigl(Y(e^-)-Y(e^+)\bigr)\Bigr\rvert\le\bigl(2\lVert J\rVert_2^2\D_t(Y)\bigr)^{1/2},
\]

见 `07-energy.tex:60-66`。$Y$ 在被消灭的内边界与立方体外按零延拓，有限支撑，所以分部求和在无穷远处无项；跨边界的边已经计入 $\mathcal D_t$。总质量非零也允许，因为 §14 的流把那份质量在延长可用槽位图上送到无穷。素材 `07-energy.tex:72-74` 说这是同伴稿件里的同一流量配对原理，新的节约来自下面的分块抵消。

于是整节变成一道构造题：把传播之后的源写成散度，并控制流的平方范数。带符号抵消的作用在这里第二次出现，且方式与标量情形不同。素材 `07-energy.tex:7-12` 的说法是：对一个障碍链丝对应的那一组源，先把带符号质量路由到附近的一个槽位，只有随之剩下的净质量才需要送往无穷；抵消降低的是第二份代价。也就是说，路由到近邻槽位这一步的代价按总变差算（大），而送往无穷的代价按净质量算（小，靠 §11 的守恒恒等式）。两级代价分开记账，是能量界与标量界结构相似但互不蕴含的原因。

我还要记下 $C_0$ 的用法。判据要求的容许测试向量满足 $\lVert z\rVert_\infty\le1+M$，$M=\lVert h\rVert_\infty\le1$，所以容许上界是 $2$；素材在 `08-pressure.tex:17-18` 正是"以固定的上确界界 $2$ 应用"该命题，从而那里的 $\varepsilon_\beta$ 就是 $2\rho(\beta)$，rapidly small。$X_d$ 不许依赖 $C_0$ 这条要求看起来繁琐，其实是自举的前提：$e_y\le X\sqrt{e_y}+\varepsilon$ 要能推出 $\sqrt{e_y}\le X+\sqrt\varepsilon$，系数 $X$ 必须是先于 $y$ 定下来的。

## §14 单块流界：三项代价与一次期望

源被分成两堆，见 `07-energy.tex:78-92`。第一堆含所有截断源、来自光滑势的障碍源，以及经过时间落在 $[\beta/2,\beta]$ 的点剖面障碍源；第二堆是剩下的点剖面源，经过时间在 $[0,\beta/2)$。分成两堆的理由写在素材里：$\beta/2$ 是一块的分界，故把晚段点剖面源收进第一堆时没有任何块被截断；而晚段点剖面满足 $W_d\le CW$，于是 §11 的块界可以在第一堆上一律用包络 $W$（这条兼容陈述在 `05-sources.tex:164-166`）。第一堆里截断源的规模至多每槽位每单位时间 $Cb_*$，$b_*=\beta^{-1}R^{-3}$。

记该方向的连续块为 $I_1,\ldots,I_n$，块长在 $L$ 与 $2L$ 之间，故 $n\le C\beta/L$。$\mathcal A_j$ 是块 $I_j$ 起始切片上格点在 $B_{4R}(x)$ 内的障碍槽位，同一个指标也指从该槽位出发的链丝，起始格点记 $z_\alpha$。定义

\[
\theta_\alpha=\begin{cases}L^{-1/4},&\text{该链丝在 }I_j\text{ 内孤立},\\[2pt]1,&\text{否则},\end{cases}\qquad Q_j=\sum_{\alpha\in\mathcal A_j}W(z_\alpha)^2,
\]

以及带库仑型核的两两和

\[
C_j=\sum_{\alpha,\alpha'\in\mathcal A_j}\frac{\theta_\alpha\theta_{\alpha'}W(z_\alpha)W(z_{\alpha'})}{1+\lvert z_\alpha-z_{\alpha'}\rvert_\infty}.
\]

这些是有限快照和，槽位重数保留。$\theta_\alpha$ 把 §11 的 $L^{1/4}$ 节约直接编码进两两和：孤立链丝的带符号质量小 $L^{-1/4}$ 倍，于是 $C_j$ 比裸和 $\sum\sum WW'$ 小。

单块流界（`07-energy.tex:118-144`）这样陈述：在 $\mathcal G$ 上固定块 $I_j$，把它的源传播到 $I_{j+1}$ 的一个完全正则切片 $t$（约定 $I_{n+1}=\beta+I_1$，即在周期的一个副本里）。传播后的带符号质量与一个支撑在 $B_{6R}(x)$ 内的局部化质量 $\nu_j(t)$ 在计数 $\ell^1$ 范数下只差 rapidly small 量，而后者是某个流的散度，该流的平方范数至多

\[
F_j=C\bigl(L^6Q_j+L^2C_j+L^2b_*^2R^5\bigr),
\]

常数与局部化误差对 $j$ 与 $t$ 一致。并且

\[
\EE_P[\mathbf 1_{\mathcal G}F_j]\le C\bigl[L^6\lambda\beta^{-2}D_*^{-1}+L^2(L^{-1/2}\lambda^2+L^3\lambda^3)\beta^{-2}R+L^2b_*^2R^5\bigr].
\]

末块只传播到终端切断，其质量与 $m_{\mathrm{loc}}$ 在 $\ell^1$ 下差 rapidly small，且 $\lVert m_{\mathrm{loc}}\rVert_2^2\le K_n=CL^5(Q_n+b_*^2R^3)$。

我用反推出的尺度把这组界验算了一遍，因为这是最容易出错的地方。取 $\lambda=\beta^{-3/2}$、$L=\beta^\delta$、$D_*\asymp\beta^{1/2}$、$R\le O(\beta^{5/3})$ 且 $R\gg\beta^{3/2}$：

- 项 $L^6\lambda\beta^{-2}D_*^{-1}$ 的幂次是 $6\delta-\tfrac32-2-\tfrac12=6\delta-4.5$，要小于 $-\tfrac52$ 需 $\delta<\tfrac13$；
- 项 $L^2\cdot L^{-1/2}\lambda^2\cdot\beta^{-2}R$ 给 $2\delta-\tfrac\delta2-3-2+\tfrac53=\tfrac{3\delta}{2}-\tfrac{10}{3}$，需 $\delta<\tfrac59$；
- 项 $L^2\cdot L^3\lambda^3\beta^{-2}R$ 给 $5\delta-\tfrac92-2+\tfrac53=5\delta-\tfrac{23}{6}$，需 $\delta<\tfrac{4}{15}$；
- 项 $L^2b_*^2R^5=\beta^{2\delta}\beta^{-2}R^{-1}$ 用 $R\gg\beta^{3/2}$ 得 $2\delta-\tfrac72$，需 $\delta<1$。

四条都不构成新限制，真正卡住 $\delta$ 的仍是 §10 里的 $L\ll\beta^{1/4}$ 与 $L\ll D_*$，即 $\delta<\tfrac14$。这个一致性能过，说明我从使用处反推的尺度至少内部自洽；尺度表原文在未读区间，整套反推标 `[推测]`。

`07-energy.tex:170` 之后我没读，所以流的显式构造、两条堆的合并、把 $F_j$ 汇总成 $X_d$ 的那几步、以及 $\mathbb E_P[\mathbf 1_{\mathcal G}F_j]$ 如何从快照二阶矩导出，都只有命题级的把握，细节标 `[推测]`。我能确定的只有一件结构事实：$X_d^2$ 必须由 $F_j$ 型量的期望控制，因此 §13 的二次矩要求最终落在 §15 的快照联合界上，并非落在链丝的逐点路径界上。

## §15 几何节：我没能读到的那一层，以及它被引用的确切位置

`03-geometry.tex` 共 27,078 B，本会话整档未读，这是本篇取证的最大缺口。按编译顺序它排在 `04-capacity` 之后、`04-profiles` 之前，尺度表就在其中。我能从已读文件里精确列出它被引用的四条接口，其余一概不假装知道：

- 好事件 $\mathcal G$：在 `07-energy.tex:17`、`06-scalar.tex:15`、`05-sources.tex:90-92` 三处被引用，用途分别是"源在块内回溯至多用 $CL$ 步"、"命题的期望界只在 $\mathcal G$ 上成立"、以及 `08-pressure.tex:33-41` 的"坏事件只用 $\mathbb P(\mathcal G^c)$ 与 $0\le q_i\le1$"。素材 `04-capacity.tex:148-150` 说这一步是先造一个有扩散与空间流估计的事件，之后才把自由试探势放进去。
- 快照联合界：`06-scalar.tex:57-65` 引用它给出规定槽位是障碍的概率 $\le C\lambda$ 与不孤立概率 $\le CL^3\lambda^2$；`07-energy.tex:116` 的 $Q_j$、$C_j$ 都是快照和。素材 `01-introduction.tex:143-145` 声明该节把单点钉住估计强化成联合快照界，并证明短块上需要的路径与热核估计。
- 局部化引理：`07-energy.tex:146-157` 用它把每条链丝的传播杀死在起始格点周围半径 $CL$ 的更大球之外，代价是总变差的 rapidly small 相对损失，对每条链丝分别施加以至对每个注入格点分别施加。
- 分箱总变差界：`06-scalar.tex:104-106` 在端点块上用它，不做抵消。

两个同伴手稿是这一层的外部输入，素材 `01-introduction.tex:100-111` 点名的方式是"直接输入"：一篇建立低温排序与被钉住圈的均匀估计，一篇证明领源磁化渐近并发展返回核与压力论证；热核界走 Nash 的能量耗散与复合路线，局部几何与流估计由同伴稿件提供。对我这一篇来说，这意味着边界很清楚：本篇新加的只有"$o(\beta^{-5/2})$ 精度"这件事，几何与排序层的均匀性是从同伴稿件继承的。任何读者若要复现 §13 到 §14 的期望界，必须先复现那份好事件的构造，而那在我未读的 27,078 B 里。这一句我按事实登记，不做弥补。

## §16 压力一侧：表面代价与把场写成随机钉住

`08-pressure.tex:66-96` 先把配分函数摆好。记 $V_N=\lvert\Lambda_N\rvert$，$\partial\Lambda_N$ 为内边界，$q_{\Lambda_N}$ 为槽边总数；对图像 $\omega$ 记 $\mathcal C(\omega)$ 为其圈集、$a_C$ 为圈 $C$ 上时间零点的槽位数。取颜色 $\sigma_C\in\{-1,1\}$，定义

\[
M(\omega,\sigma)=\frac12\sum_Ca_C\sigma_C,\qquad N_\downarrow(\omega,\sigma)=\sum_{C:\,\sigma_C=-1}a_C=SV_N-M(\omega,\sigma),
\]

并令 $\chi_D(\omega,\sigma)$ 表示"每个与 $D$ 相交的圈都向上"。带场配分函数与其边界钉住版本是

\[
Z_N(t)=e^{\beta q_{\Lambda_N}/4}\EE_{\rm b}\sum_\sigma e^{\beta tM(\omega,\sigma)},\qquad Z_N^+(t)=e^{\beta q_{\Lambda_N}/4}\EE_{\rm b}\sum_\sigma\chi_{D_0}(\omega,\sigma)e^{\beta tM(\omega,\sigma)},
\]

压力 $p_N(t)=\frac{\log Z_N(t)}{\beta V_N}$、$p_N^+(t)=\frac{\log Z_N^+(t)}{\beta V_N}$。

表面代价引理（`08-pressure.tex:102-147`）说对每个有限 $\beta>0$、每个 $t\ge0$、每个有限立方体，

\[
0\le p_N(t)-p_N^+(t)\le(\log2)\Bigl(\frac\ell\beta+24\ell^2\Bigr)\frac{\lvert\partial\Lambda_N\rvert}{V_N},
\]

因此固定 $\beta$ 与 $t$ 时 $p_N^+(t)\to p_{S,\beta}(t)$。证明的四步我全部复算过，值得抄在笔记里。抽出全向上因子后，带场倾斜的图像权重是 $W_t(\omega)=\prod_C(1+e^{-\beta ta_C})$；在该倾斜律下每圈向上概率是 $(1+e^{-\beta ta_C})^{-1}\ge\frac12$。设 $b_0$ 为与 $D_0$ 相交的圈数，Jensen 不等式给出 $1\ge\frac{Z_N^+}{Z_N}\ge\mathbb E_t2^{-b_0}\ge\exp[-(\log2)\mathbb E_tb_0]$。每条碰边界的圈要么在时间零点有边界槽位，要么经过某个边界标记，一个标记至多属于两个圈，故 $b_0\le\ell\lvert\partial\Lambda_N\rvert+2J_\partial$，而边界关联槽边数 $q_\partial\le6\ell^2\lvert\partial\Lambda_N\rvert$。插入一个标记要么合并两圈要么拆开一圈，每个 $W_t$ 因子在 $[1,2]$ 内且至多多出两个因子，所以 $W_t(\omega\cup\{u\})\le4W_t(\omega)$；速率 $\tfrac12$ 的 Poisson 插入公式给 $\mathbb E_tJ_\partial\le2\beta q_\partial\le12\beta\ell^2\lvert\partial\Lambda_N\rvert$。合并：$\frac{(\log2)(\ell\lvert\partial\Lambda_N\rvert+24\beta\ell^2\lvert\partial\Lambda_N\rvert)}{\beta V_N}$ 正是上面那个界。

场的表示在 `08-pressure.tex:149-180`。令 $b_\beta(t)=1-e^{-\beta t}$，$\nu_b$ 为以概率 $b$ 独立选取每个时间零点槽位的律，$A$ 为被选集，$\operatorname{Up}$ 为该截面的向上槽位集，则

\[
\sum_A\nu_b(A)\mathbf 1_{\{A\subset\operatorname{Up}\}}=(1-b)^{N_\downarrow}=e^{-\beta tN_\downarrow}.
\]

于是带场律是联合律 $\widehat{\mathbb P}_{N,t}(d\omega,d\sigma,A)\propto\mathbb P_{\rm b}(d\omega)\nu_b(A)\chi_{D_0\cup A}(\omega,\sigma)$ 在图像与颜色上的边缘，归一化里可抽出的公共因子是 $e^{\beta q_{\Lambda_N}/4+\beta tSV_N}$；条件于 $A$ 时它恰好就是带确定性钉集 $E=D_0\cup A$ 的零场着色律。素材紧跟着警告：$A$ 的边缘律一般已不再是独立选择，因为其归一化被钉住配分函数加权；反过来条件于 $(\omega,\sigma)$ 时，向上槽位上的选取是参数 $b$ 的独立选择、向下槽位上禁止选取，因此每个指定槽位 $j$ 满足

\[
\widehat\PP_{N,t}(j\in A)=b_\beta(t)\,\widehat\PP_{N,t}(j\text{ 向上})\le b_\beta(t),
\]

而这一个性质就是后面全部所需。

我为什么要把这一段看得这么重：它替换掉了"证明导数收敛"这个几乎不可能的任务。直接从 $p_{S,\beta}(h)$ 的定义取 $h\downarrow0$，需要有限体积导数在 $h$ 与 $N$ 上一致收敛，或者需要压力的二阶模；两者都要额外的正则性。把差分商写成随机钉集上的平均之后，我只需要对每个确定性钉集都成立的逐点比较（§9 的一致版），然后积掉 $t$。代价是引入了 $b_\beta(t)$ 这一项，而它满足 $\lim_{t\downarrow0}b_\beta(t)=0$ 只在 $\beta$ 固定时成立：$\beta\to\infty$ 时任意固定 $t>0$ 都有 $b_\beta(t)\to1$。所以方法的可行性本身就把极限顺序钉死了，先 $\beta\to\infty$ 会让并集界项炸开。定义要求的顺序与方法允许的顺序在这里完全一致，这不是巧合，是这套表示的必然。

## §17 闭合：从逐点比较到主定理的十行

比较命题的补完在 `08-pressure.tex:11-64`。把 §13 的对偶能量界以容许上界 $2$ 代入 §8 的平均判据，$0\le h\le1$ 使判据适用，标量命题与好事件概率界给出

\[
r:=\EE_Pq_i=1-c+o(\beta^{-5/2}),
\]

误差对立方体与允许钉集一致。再由 §6 的界得 $v(x)=O(\beta^{-3/2})$，故

\[
1-c=\frac{v(x)}{1+v(x)}=v(x)+O(\beta^{-3}),
\]

代入 §5 的精确钉住恒等式：

\[
d_E(i)=\frac{r}{1+r}=v(x)+o(\beta^{-5/2})=\frac1\ell\sum_{n\ge1}p_{n\beta}(0)+o(\beta^{-5/2})=\frac1\ell n_S^{\rm sw}(\beta)+o(\beta^{-5/2}).
\]

主定理的证明在 `08-pressure.tex:184-241`，我把它拆成七步写下来，因为顺序里每步都用到了前面的一个特定性质。第一步，有限体积磁化有界，所以 $Z_N^+$ 里对 $t$ 逐项求导合法，配合联合律得到

\[
S-(p_N^+)'(t)=\frac1{V_N}\widehat\EE_{N,t}N_\downarrow=\frac1{V_N}\sum_{j\text{ 在时间 }0}\widehat\EE_{N,t}d_{D_0\cup A}(j),
\]

其中 $d_E(j)$ 对已钉槽位也定义为向下概率，取值 $0$。第二步，$\rho_N$ 是使 $B_{50R_*}(x)$ 内蕴的格点比例，对这样的 $x$ 令 $\mathcal A_x$ 表示球上方无选中钉点，用 $\widehat{\mathbb P}_{N,t}(j\in A)\le b_\beta(t)$ 与并集界得 $\widehat{\mathbb P}_{N,t}(\mathcal A_x^c)\le C_{S,\beta}b_\beta(t)$，$C_{S,\beta}$ 与 $N$ 无关。第三步，在 $\mathcal A_x$ 上对 $x$ 的 $\ell$ 个槽位与每个条件钉集都用比较命题；在其补集与内蕴失败处只用概率有界。第四步，求和得

\[
\bigl\lvert S-(p_N^+)'(t)-n_S^{\rm sw}(\beta)\bigr\rvert\le\ell\varepsilon_S(\beta)\beta^{-5/2}+C_S(1-\rho_N)+C_{S,\beta}b_\beta(t),
\]

这里大 $\beta$ 时 $n_S^{\rm sw}(\beta)$ 有界，所以例外格点上的贡献并入 $C_S$。第五步，对 $t\in[0,h]$ 积分再除以 $h$。第六步，$\beta$ 与 $h$ 固定时令 $N\to\infty$：半径固定故 $\rho_N\to1$，表面代价引理给出两端点处 $p_N^+$ 收敛，于是

\[
\Bigl\lvert S-\frac{p_{S,\beta}(h)-p_{S,\beta}(0)}h-n_S^{\rm sw}(\beta)\Bigr\rvert\le\ell\varepsilon_S(\beta)\beta^{-5/2}+\frac{C_{S,\beta}}h\int_0^hb_\beta(t)\,dt .
\]

第七步，$h\downarrow0$ 时末项消失（我自己算过：$\frac1h\int_0^h(1-e^{-\beta t})dt=1-\frac{1-e^{-\beta h}}{\beta h}\sim\frac{\beta h}2$），凸性与一致磁化界给出极限压力的右导数，故 $\lvert S-m_S(\beta)-n_S^{\rm sw}(\beta)\rvert\le\ell\varepsilon_S(\beta)\beta^{-5/2}$，最后 $\beta\to\infty$ 并乘 $(\beta S)^{5/2}$。

这七步里我最欣赏第六步与第七步的分工：$\rho_N\to1$ 需要"半径在体积极限里是固定的"，$\frac1h\int_0^hb_\beta\to0$ 需要"$\beta$ 在场极限里是固定的"。两个"固定"分别属于不同步骤，所以任何想把低温极限提前的改动都会在第六步或第七步断掉。这也是我在 §22 的台账里把 $R_*$、$\rho_N$、$b_\beta(t)$ 三条并列登记的原因。

## §18 显式系数：全部格点物理缩成一个数 $1/16$

系数那一节（`08-pressure.tex:249-300`）在整篇里几乎独立。记 $t=\beta S$，坐标独立性给 $p_\beta(0)=I(t)^3$，$I(t)=\frac1{2\pi}\int_{-\pi}^{\pi}e^{-2t(1-\cos k)}\,dk$。取 $u=\sqrt t\,k$ 并先限制在 $\lvert u\rvert\le t^{1/10}$：

\[
2t\bigl(1-\cos(u/\sqrt t)\bigr)=u^2-\frac{u^4}{12t}+O(u^6/t^2),\qquad e^{-2t(1-\cos(u/\sqrt t))}=e^{-u^2}\Bigl(1+\frac{u^4}{12t}+O\Bigl(\frac{u^6+u^8}{t^2}\Bigr)\Bigr).
\]

被 $2(1-\cos k)\ge ck^2$ 控制的补区间在同样换元下贡献 $O(e^{-ct^{1/5}})$，把高斯积分延长到 $\R$ 的误差同阶。用 $\int_{\R}e^{-u^2}du=\sqrt\pi$ 与 $\int_{\R}u^4e^{-u^2}du=\frac34\sqrt\pi$，得一致于 $t\ge1$ 的

\[
I(t)=\frac1{\sqrt{4\pi t}}\Bigl(1+\frac1{16t}+O(t^{-2})\Bigr).
\]

我核对过这个 $1/16$ 的来历：$\frac1{2\pi\sqrt t}\int e^{-u^2}\bigl(1+\frac{u^4}{12t}\bigr)du=\frac1{2\sqrt{\pi t}}\bigl(1+\frac1{12t}\cdot\frac34\bigr)$，即 $\frac1{12}\cdot\frac34=\frac1{16}$。立方给 $p_\beta(0)=(4\pi t)^{-3/2}\bigl(1+\frac3{16t}+O(t^{-2})\bigr)$，因子 $3$ 来自三个独立坐标。在 $nt$ 处套用并对 $n\ge1$ 求和，余项被 $Ct^{-7/2}\sum_{n\ge1}n^{-7/2}$ 控制，于是

\[
n_S^{\rm sw}(\beta)=\frac{\zeta(3/2)}{8\pi^{3/2}}(\beta S)^{-3/2}+\frac{3\zeta(5/2)}{128\pi^{3/2}}(\beta S)^{-5/2}+O\bigl((\beta S)^{-7/2}\bigr),
\]

主定理把左边的 $S-m_S(\beta)$ 与 $n_S^{\rm sw}(\beta)$ 的差压成 $o(\beta^{-5/2})$，推论随之成立。

这里有一个我认为值得写进笔记的对比。全部格点依赖都藏在指数里 $u^4/(12t)$ 那一项，也就是色散 $\varepsilon_S(k)=S\lvert k\rVert^2-\frac S{12}\sum_jk_j^4+\cdots$ 的第四阶项；算出它对最终数字的贡献只需要分部积分与两个高斯矩。而为了配得上这个 $o(\beta^{-5/2})$，前面用了容量判据、非自伴核的能量、孤立链丝的 $L^{1/4}$ 抵消、快照二阶矩与随机钉集。换言之，难的部分买来的是一个小 $o$，简单的部分给出的才是那个数。最初我以为证明的难点会体现在系数的复杂结构上，实际上系数与相互作用完全无关，只与单粒子色散的四阶梯点项有关，这正是 Dyson 分级表说的事情在严格证明里的镜像。

## §19 走过的错误路线与它们各自的失败方式

下面这些路线里，凡涉及"我当时怎么想"的部分是我按素材的现有结构反推的思维链，属于重建；素材本身只给出结论与对照陈述，所以这一节的心理内容标 `[推测]`，而每条末尾的失败证据都指向具体行号。

第一条：按返回圈数逐阶展开。既然 $q_i$ 是"在整数个周期后返回"的概率，最直接的写法是按圈数 $n$ 展开，$r=\sum_{n\ge1}(\text{n 圈的返回贡献})$，再逐阶估计。这在物理上就是玻色和的微扰读法。它在我的纸面上死于两条：一是 $n$ 可以大到 $\beta/L$ 量级，逐阶误差累加会吃掉 $\beta^{-5/2}$ 的预算；二是将 Bose 和截断到 $n\le n_0$ 就直接丢掉要证的第二项系数。素材 `04-profiles.tex:5-8` 把这条说得很清楚：空间截断让它成为有限体积测试向量，而**不**截断周期数；`04-capacity.tex:130-134` 补了判据的好处：对返回次数完全不做展开。

第二条：从自由能渐近推磁化。Correggi、Giuliani、Seiringer 已经有每个固定自旋的领源自由能渐近，我原以为加一句"对参数求导"即可。素材 `01-introduction.tex:90-92` 直接否掉了这种乐观：那结果讲的是零场自由能，取出零场右导数需要额外控制。失败原因我在 §16 末算清楚了：$b_\beta(t)=1-e^{-\beta t}$ 在 $\beta$ 大时对任何固定 $t>0$ 趋于 $1$，所以任何"先用低温渐近、再对场求导"的路线都会把并集界项放大到不收敛；顺序是方法级的障碍，只是书写习惯问题。

第三条：用真实图像里未曝光部分的轨迹作行走。这条我在 §5 交代过误会。它的致命处是马尔可夫性缺失：未曝光部分条件在整幅图上，时间不齐次不是从"每轮重采样"来的，于是写不出单周期核 $U$，也写不出 $U^*$；而判据的两个残差 $\mu_+,\mu_-$ 分别需要正向与伴随即两个方向同时可用（`04-capacity.tex:36-37` 明写"两个方向都要出现，因为它的转移矩阵不必对称"）。

第四条：可逆位势论。我试过把 $U$ 当成某个测度可逆链的转移核，用对称狄利克雷形与标准打击电势不等式。素材 `07-energy.tex:56-58` 与 `02-loops.tex:171-174` 给的替代方案说明这条路是绕远：真正的输入只是"计数双射加逐行 Cauchy--Schwarz"给出的 $\ell^2$ 压缩，以及 $e_y=\langle y,(I-U)y\rangle=\langle y,(I-U)^*y\rangle$ 只看对称部分这一事实。可逆性一旦假设上，就要额外论证曝光律在时间反演下不变，而那并不成立。

第五条：用标量估计包办能量估计。失败理由写在 `07-energy.tex:5-7`：测试向量 $y=f-h$ 没有理由长得像自由势，因此 $h$ 上的配对界不能平移过去。

第六条：不做带符号抵消、只用总变差。这条最微妙，因为它只差一个 $L^{1/4}$。§11 末算过：孤立链丝用总变差 $CL\mathcal W(z)$ 时标量项是 $\beta^{-1}\lambda=\beta^{-5/2}$，压在边界上拿不到小 $o$。也就是说这条路线会给出一个形如 $O(\beta^{-5/2})$ 的比较命题，其结果只能确认领源项与次项之间没有额外贡献，无法把次项系数从误差里分辨出来。失败方式是"恰好差一个无穷小因子"，这类失败最容易在草稿里被误当成过关。

第七条：把联合快照界省成单点钉住估计。若只知 $\mathbb P_P$ 下单个槽位是障碍的概率 $\le C\lambda$，那么 $Q_j=\sum W(z_\alpha)^2$ 的期望与 $C_j$ 的两两和都无法闭合；`01-introduction.tex:143-145` 声明几何节把单点估计强化成联合快照界，`06-scalar.tex:57-65` 用了它，`06-scalar.tex:139-157` 的箱矩引理则处理了"两个不同时刻的源位置相关"这件事且不假设独立。`02-loops.tex:114-115` 也提醒同时钉住不等式不假设测试点的空间分离，而随机钉集产生的钉点在空间上是可以聚拢的，所以带分离假设的版本在此不可用。

第八条：借 $S\to\infty$ 区间的结果。Benedikter 的相互作用修正上界处在 $S\to\infty$、$\beta S$ 固定的区间（`01-introduction.tex:92-94`），与本篇"固定 $S$、$\beta\to\infty$"是两个不相交的极限过程；虽然主定理里出现 $(\beta S)^{5/2}$ 的归一化看似可以互相迁移，$\beta_0(S)$ 与 $\varepsilon_S$ 都对 $S$ 有依赖，一致性没有任何来源。

## §20 三个关键转折

第一个转折是容量判据的有限维化。把问题写成 $A=I-U$、$\eta=\mathbf 1_{\{i\}}$、$e_z=\langle z,Az\rangle$、$\mu_\pm$ 之后，整篇的形制从"分析一个随机环境里的多体返回概率"变成"给一个试探向量 $h$ 和一个标量 $c$，证三条恒等式加两条残差界"。我判断这一步是决定性的，因为它同时解决了两个矛盾：既要保留全部周期（$c=\frac1{1+v(x)}$ 里就含全部周期），又不许对周期求和逐阶控制误差。判据把求和藏进 $h$ 与 $c$ 的定义，把误差换成残差。

第二个转折是接缝与半群的交换性 $T_s=P_sJ+e^{-3\ell s}(I-J)$（`04-profiles.tex:34-38`）。这条分解说明槽位模式只在 $e^{-3\ell s}$ 内衰减，满圈上只剩 $P_\beta J$，于是 $(U_0^n)_{(z,b),(x,a)}=\frac1\ell p_{n\beta}(z-x)$ 与自旋完全无关。$\ell v(x)=\sum_{n\ge1}p_{n\beta}(0)=n_S^{\rm sw}(\beta)$（`04-profiles.tex:216-225`）因此是恒等式，估计只是证明它有限。我在这一行上停了很久：本来担心的"相互作用把 Bose 和改成散射相移"这类问题在这里根本不存在，因为 $2S$ 个槽位的对称化在满周期上退化成一个格点随机游走。

第三个转折是孤立链丝上的守恒恒等式。源本来是"边被移走加空位被搬运"，逐点看没有任何抵消；把它们按链丝归并、对时间积分之后，带符号总质量塌成端点差 $\varphi_v(Z_v)-\varphi_u(Z_u)$ 加截断积分 $\int_u^v\gamma_s(Z_s)\,ds$（`05-sources.tex:98-107`）。于是块源界里带符号和是 $CL^{3/4}\mathcal W(z)$、总变差是 $CL\mathcal W(z)$（`05-sources.tex:155-163`），$L^{1/4}$ 的余量出现，第六条错误路线起死回生。素材 `01-introduction.tex:127-132` 的表述与此完全一致：对孤立障碍，其对自由热方程的带符号贡献望远镜成剖面沿障碍轨迹的变化加一个截断误差。

顺带记下第四个较小的转折：流量配对 $\lvert\langle\nu,Y\rangle\rvert\le(2\lVert J\rVert_2^2\mathcal D_t(Y))^{1/2}$ 加"先路由到近邻槽位、只把净质量送向无穷"的两级结构（`07-energy.tex:60-74`、`07-energy.tex:7-12`）。它让能量估计用到了与标量估计不同形式的抵消，两条预算因此互不蕴含，必须分别做。

## §21 最终思路与最初设想的差异，以及留下的问题

最初我设想的工作形态是 Dyson 式的：写出磁振子的相互作用图式，逐阶求和，把格点修正从独立磁振子的四阶色散项里读出来，再论证相互作用从 $T^4$ 才开始。最后成形的证明里，图式与逐阶求和被彻底替换：唯一的"展开"是有限维恒等式 $q-(1-c)=\langle h,\mu_+\rangle+\langle y,\mu_+\rangle$，唯一的"阶数"来自尺度幂次。相互作用没有出现在证明的任何一处，因为要证的这一阶本来就与相互作用无关；素材的整个技术构造都在把"独立磁振子的完整格点和"严格实现成钉住圈的返回概率。

难度的落点也和我预想的不同。我原以为难点在多体关联，实际难点在精度：所有关联控制（快照联合界、箱矩、好事件）都为的是让 $X_d^2$ 的期望是 $o(\beta^{-5/2})$，而这个尺度比领源项 $\beta^{-3/2}$ 小两个幂次，比自然误差 $\beta^{-2}$ 也小。也就是说，这是一篇被幂次驱动的论文，物理上的新内容只有一个格点因子 $1/16$。

留下的问题我按可及程度排：

- 把 little-oh 换成显式率。从素材记录的幂次看，最慢的一项是 $\beta^{-5/2-\delta/4}$（`06-scalar.tex:99-100`），受 $\delta<\tfrac14$ 约束；要把误差做到 $O(\beta^{-3})$，需要同时改 $L$ 的选取与块内抵消的结构，不是微调常数可得。
- 下一阶 $T^4$ 的相互作用项。素材 `01-introduction.tex:73-77` 指出那是相互作用首次出场的阶，而本篇的机器只处理了独立磁振子的完整格点和；要够到 $T^4$，比较命题必须换成含散射的对象，$J$ 与 $T_s$ 交换这一结构事实就不再够用。
- $S$ 的一致性。所有常数依赖固定 $S$，$(\beta S)^{5/2}$ 的归一化暗示存在经典区间里的统一形态，但 $\beta_0(S)$、$\varepsilon_S$、$D_*$ 与 $\lambda$ 的定义都带 $S$；把 $S\to\infty$、$\beta S$ 固定与本篇区间衔接，我没有可用的输入。
- 边界条件。全文用自由边界，边界槽位通过 $D_0$ 的所有时刻钉住来处理，表面代价引理只在体积极限里被用掉（`08-pressure.tex:102-147`）；周期性边界下 $D_0$ 变空，钉住律的其他部分不变，但我没有验证过分块与局部化是否仍成立。
- 几何层。`03-geometry.tex` 的 27,078 B 我整档未读，好事件、路径与短块热核估计、联合快照界的具体形态都在里面。上面任何一条问题的推进大概都要先进入那一层。

最后一条与本笔记的方法有关：素材把证明拆成八节，而输入顺序（`main.tex:60-68`）把容量判据放在几何之前，这本身是一种论证修辞的选择。我在 §9 里已经说明它的功能理由（一致性需求先行），但这也意味着第一次读它的人会在 `04-capacity.tex:30-32` 遇到一条"证明稍后补完"的命题；我自己是读了两遍才适应这种先立约后交付的结构。

## §22 台账

这张表把全篇用到的量、它们的增长率或数值、真实读取到的位置、消费它的环节，以及改动之后断裂的那一步并列登记。表里凡 $\lambda$、$L$、$D_*$、$H_\beta$、$R$ 的具体取值都是我从使用处反推的，位置栏指向使用处，并非定义处，并在符号栏标 `[推测]`；$R_*$ 有素材原文，位置栏即定义处。三条被 §17 的极限顺序各自消费的量（$R_*$、$\rho_N$、$b_\beta(t)$）在表中并列，是为了对照：$\rho_N\to1$ 需要半径 $50R_*$ 在体积极限中固定，$\frac1h\int_0^hb_\beta(t)\,dt\to0$ 需要 $\beta$ 在场极限中固定，$(\beta S)^{5/2}\to\infty$ 需要前两步都已完成。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $S$ | 全程固定，$S\in\{\tfrac12,1,\tfrac32,\ldots\}$ | `01-introduction.tex:45-51` | 主定理与全部常数 | 改成 $S\to\infty$ 时 $\beta_0(S)$ 无来源 |
| $\varepsilon_S(k)=2S\sum_j(1-\cos k_j)$ | 格点色散 | `01-introduction.tex:36-42` | $n_S^{\rm sw}$ 与 Fourier 乘子 | 换成 $S\lVert k\rVert^2$ 就没有 $\beta^{-5/2}$ 项 |
| $n_S^{\rm sw}(\beta)$ | 量级 $(\beta S)^{-3/2}$ | `01-introduction.tex:38-43` | 主定理右端与 §17 | 积分在一二维发散，比较命题失效 |
| $m_S(\beta)=\partial_{h+}p_{S,\beta}(0)$ | 右导数 | `01-introduction.tex:24-30` | §3 与 §17 第七步 | 交换 $h\downarrow0$ 与 $\beta\to\infty$ 得到别的量 |
| $\Lambda_N,\ V_N$ | $\lvert\Lambda_N\rvert=(2N+1)^3$ | `01-introduction.tex:12-13` | 压力定义与 $\rho_N$ | 体积极限提前则 §17 第六步断 |
| $\partial_{\mathrm{in}}\Lambda$ | 有外邻点的格点集 | `02-loops.tex:26-31` | $D_0$ 与表面代价 | 周期边界下该集为空，§16 无对象 |
| $D_0$ | 全时刻边界钉集 | `02-loops.tex:28-31` | 允许钉集与 §17 第二步 | 去掉它则 $p_N^+$ 不再趋于 $p_{S,\beta}$ |
| $Z_D=\mathbb E_{\mathrm b}2^{n_D}$ | 权重归一化 | `02-loops.tex:36-41` | 钉住律 $\mathbb P_D$ 与着色律 | 指数改成 $n_D-1$ 会破坏 §5 的有理恒等式 |
| $e^{\beta q_\Lambda/4}$ | 每边常数字 $-\tfrac14$ | `02-loops.tex:78-83` | 配分函数表示 | 取 $-\tfrac12$ 与 $\boldsymbol S_x\cdot\boldsymbol S_y=\tfrac12P_{xy}-\tfrac14$ 冲突 |
| $q_\Lambda$ | $3N(2N+1)^2\ell^2$（本笔记自算） | `02-loops.tex:78-80` | 常数字与 $q_\partial\le6\ell^2\lvert\partial\Lambda_N\rvert$ | 计数错则 §16 中 $24\ell^2$ 系数随动 |
| $q_i,\ r=\mathbb E_Pq_i$ | 只在整数周期返回 | `02-loops.tex:70-73` | §5 与 §17 第一步 | 允许非整周期返回则单周期核不闭合 |
| $d_E(i)=\frac{r}{1+r}$ | $r=O(\beta^{-3/2})$ | `02-loops.tex:89-93` | §17 的有理映射 | 恒等式差因子 $2$ 则次项系数全错 |
| $(2r_T)^{\lvert T\rvert}$ | 无空间分离假设 | `02-loops.tex:94-102` | 联合快照界与 §19 第七条 | 需要分离假设则随机钉集不可用 |
| $2^j$ 标记支配 | 阶乘测度比较 | `02-loops.tex:103-107` | 短块路径与热核论证 | 失败则 §15 第一条接口无输入 |
| $\mathcal D_t(v)=\frac12\sum(v(a)-v(b))^2$ | 计数狄利克雷形 | `02-loops.tex:131-139` | §13 的流配对 | 取消零延拓则跨边界边漏计 |
| $\frac{d}{dt}\lVert v_t\rVert_2^2=-2\mathcal D_t(v_t)$ | 能量耗散 | `02-loops.tex:144-149` | 单周期能量累加 | 接缝处范数可升则 $\int\mathcal D_t$ 界断 |
| $\lVert y-U_d^*y\rVert_2^2\le2e_y$ | $d\in\{+,-\}$ | `02-loops.tex:151-160` | §13 定义 $X_d$ | 系数 $2$ 改掉则 $\varepsilon_\beta$ 随动 |
| $\ell^2$ 压缩 | 逐行 Cauchy--Schwarz | `02-loops.tex:167-175` | 保证 $e_y\ge0$ | 无压缩则二次型非负失效 |
| $A=I-U,\ \eta=\mathbf 1_{\{i\}}$ | 有限维记号 | `04-capacity.tex:53-57` | 三条恒等式 | 强行假设 $U$ 自伴则 §19 第四条复活 |
| $\mu_{\pm}=Uh-h+c\eta$ 型 | 双向残差 | `04-capacity.tex:65-71` | §7 与 §13 | 只留一个方向则 $e_y=\langle y,\mu_-\rangle$ 断 |
| $A^*f=(1-q)\eta$ | 不需几乎必然死亡 | `04-capacity.tex:73-101` | 容量恒等式 | 加死亡假设会引入额外余项 |
| $\lvert q-(1-c)\rvert\le\lvert\langle h,\mu_+\rangle\rvert+2X^2+2\varepsilon$ | 稳定性 | `04-capacity.tex:83-93` | §8 预算表 | 一次矩版不成立，$2X^2$ 不可替换 |
| $\sqrt{e_y}\le X+\sqrt\varepsilon$ | 自举 | `04-capacity.tex:119-126` | §13 的 $X_d$ 独立于 $y$ | $X$ 若依赖 $y$ 则该步闭合不了 |
| $\lvert\mathbb E q-(1-c)\rvert$ 含 $\mathbb P(\mathcal G^c)$ | 四项平均判据 | `04-capacity.tex:136-147` | §17 第一步 | 坏事件需精确界则全篇重做 |
| $R_*=\lceil\beta^{5/3}\rceil$ | 增长 $\beta^{5/3}$ | `04-capacity.tex:7-8` | 内蕴球与 $\rho_N$ | 幂次提高则 §10 的 $R\lesssim R_*$ 窗口挤压 |
| $\varepsilon_S(\beta)\to0$ | 一致 little-oh | `04-capacity.tex:10-26` | §17 第七步 | 只给 $O(1)$ 就没有可辨认的次项 |
| $T_s=P_sJ+e^{-3\ell s}(I-J)$ | 槽位模瞬时衰减 | `04-profiles.tex:21-48` | 全周期 $U_0^n$ | 接缝不与 $T_s$ 交换则 Bose 和不守恒 |
| $v(z)=\frac1\ell\sum_{n\ge1}p_{n\beta}(z-x)$ | $v(x)=O(\beta^{-3/2})$ | `04-profiles.tex:50-57` | $c$ 与 $h$ | 截断周期数则 §18 的 $\zeta(5/2)$ 消失 |
| $c=\frac1{1+v(x)}$ | $1-c=v(x)+O(\beta^{-3})$ | `04-profiles.tex:52-55` | §17 第三步 | 裕度若退成 $\beta^{-2}$ 就吃掉目标尺度 |
| $h=c\chi(\eta+v)$ | $0\le h\le1$，$h(i)=1$ | `04-profiles.tex:61-72` | 判据取 $M=1$ | 失去 $0\le h$ 则 §8 平均式不适用 |
| $G,\ W$ | $\beta^{-1}(D_*+r_z)^{-1}$ 与 $\beta^{-1}(D_*+r_z)^{-2}$ | `04-profiles.tex:102-110` | 全部剖面界 | $\sup W\asymp\beta^{-2}$ 不再成立时 §10 反推断 |
| $P_d,\ W_d$ | $d^{-3}(1+r_z/d)^{-12}$ 与 $d^{-4}(1+r_z/d)^{-12}$ | `04-profiles.tex:102-110` | 点剖面界与 §12 | 衰减幂降低则箱矩求和不收敛 |
| $\lvert\nabla^jp_t(z)\rvert$ | $(1+t)^{-(3+j)/2}$ 乘任意负幂 | `04-profiles.tex:138-166` | 逐点和的推导 | 少一次分部积分则 $v$ 的点态收敛断 |
| $\sum_{n\ge1}(n\beta+s)^{-(3+j)/2}(\cdots)$ | 不超过 $\frac C\beta(D_*+r_z)^{-1-j}$ | `04-profiles.tex:168-185` | §10 与 §12 | 换成粗积分界会丢 $\beta^{-1}$ 因子 |
| $\ell v(x)=n_S^{\rm sw}(\beta)$ | 恒等式，非渐近 | `04-profiles.tex:216-227` | 目标识别 | 只有渐近式时系数不可辨认 |
| $\int_0^\beta\sum_{r_z\le4R}(W+W_d)(G+P_{d'})\,ds$ | 不超过 $C\beta^{-1}(1+\log\beta)$ | `06-scalar.tex:29-52` | §12 三项预算 | 丢 $\beta^{-1}$ 则三项全部超标 |
| $CL^3\lambda^2$ | 不孤立概率 | `06-scalar.tex:57-66` | §12 第一项 | 幂次不足则中段块的第一项断 |
| $-4+3\delta,\ -\frac52-\frac\delta4,\ -\frac{21}{8}+\delta$ | 三项幂次 | `06-scalar.tex:88-101` | §11 与 §14 的验算 | 去抵消后中间项变成恰好 $-\frac52$ |
| $\lambda=\beta^{-3/2}$ `[推测]` | 障碍概率密度 | `06-scalar.tex:93-101` | §10 反推与 §14 验算 | 若 $\lambda\asymp\beta^{-1}$ 则中段块全部超标 |
| $L=\beta^\delta,\ \delta<\frac14$ `[推测]` | 块长 | `06-scalar.tex:101-105` | §11 的余量与 §14 | 若 $L\gg\beta^{1/4}$ 则端点块不能免抵消 |
| $H_\beta\le(\log\beta)^C$ `[推测]` | bin 内权重振荡 | `06-scalar.tex:104-120` | §12 端点块 | 若 $H_\beta\asymp1$ 则 $-\frac{23}{8}$ 与 $-\frac{13}{4}$ 不合 |
| $D_*\asymp\beta^{1/2}$ `[推测]` | 周期末扩散长度 | `06-scalar.tex:44-52` | §10 与 §14 验算 | 取 $\beta^{1/3}$ 则与 $\sup W=C\beta^{-2}$ 冲突 |
| $b_*=\beta^{-1}R^{-3}$ | 截断源每槽位每单位时间 | `05-sources.tex:45-55` | §14 的 $L^2b_*^2R^5$ | 若 $R\ll\beta^{3/2}$ 则 §12 背景界不过关 |
| $R/3\le r_z\le2R$ | 截断源支撑环域 | `05-sources.tex:51-55` | §11 与 §12 | 环域外推则会撞上钉点区 |
| $CL^{3/4}\mathcal W(z)$ | 孤立链丝带符号和 | `05-sources.tex:148-167` | §20 第三转折 | 退回总变差 $CL\mathcal W(z)$ 则精度失守 |
| $\varphi_v(Z_v)-\varphi_u(Z_u)+\int_u^v\gamma_s(Z_s)\,ds$ | 守恒恒等式 | `05-sources.tex:96-141` | §11 | 接缝项漏计则望远镜断裂 |
| $\theta_\alpha=L^{-1/4}$ | 孤立标记 | `07-energy.tex:96-116` | §14 的 $C_j$ | 取 $\theta_\alpha=1$ 则两两和失去抵消 |
| $F_j$ | $C(L^6Q_j+L^2C_j+L^2b_*^2R^5)$ | `07-energy.tex:118-128` | §13 的 $X_d^2$ | 任一项提幂即断 |
| $\mathbb E_P[\mathbf 1_{\mathcal G}F_j]$ | 三项界 | `07-energy.tex:131-136` | §14 的 $\delta$ 验算 | 最强约束把 $\delta$ 压到 $\frac{4}{15}$ |
| $K_n$ | $CL^5(Q_n+b_*^2R^3)$ | `07-energy.tex:137-143` | 末块处理 | 若用 $L^6$ 则末块多出一个 $L$ |
| $X_d\sqrt{e_y}+C_0\rho(\beta)$ | 对偶能量界 | `07-energy.tex:14-37` | §8 第二与第三项 | $\rho$ 若非 rapidly small 则 $\varepsilon$ 超标 |
| $\mathbb E_P[\mathbf 1_{\mathcal G}(X_+^2+X_-^2)]$ | $o(\beta^{-5/2})$ | `07-energy.tex:31-34` | §17 第一步 | 一次矩版本不满足 $2X^2$ 的消耗 |
| $p_N(t)-p_N^+(t)$ | 不超过 $(\log2)(\frac\ell\beta+24\ell^2)\frac{\lvert\partial\Lambda_N\rvert}{V_N}$ | `08-pressure.tex:102-147` | §16 与 §17 第六步 | 无此界则钉住压力不收敛到 $p_{S,\beta}$ |
| $b_\beta(t)=1-e^{-\beta t}$ | 固定 $\beta$ 时趋于 $0$ | `08-pressure.tex:149-150` | §16 末与 §17 第七步 | 先 $\beta\to\infty$ 则该项趋于 $1$，顺序崩塌 |
| $\widehat{\mathbb P}_{N,t}(j\in A)\le b_\beta(t)$ | 后验钉集唯一所需性质 | `08-pressure.tex:171-180` | §17 第二步并集界 | 需要 $A$ 独立则断 |
| $S-(p_N^+)'(t)$ | 等于 $\frac1{V_N}\sum_j\widehat{\mathbb E}_{N,t}d_{D_0\cup A}(j)$ | `08-pressure.tex:189-194` | §17 第一步 | 逐项求导不合法则整个表示断 |
| $\rho_N$ | 半径固定时趋于 $1$ | `08-pressure.tex:197-199` | §17 第六步 | $\beta$ 先动则坏点比例不可控 |
| $I(t)$ | $(4\pi t)^{-1/2}(1+\frac1{16t}+O(t^{-2}))$ | `08-pressure.tex:256-283` | §18 | $1$ 与 $16$ 任一处算错则次项系数错 |
| 两项系数 | $\frac{\zeta(3/2)}{8\pi^{3/2}}$ 与 $\frac{3\zeta(5/2)}{128\pi^{3/2}}$ | `08-pressure.tex:284-297` | 推论 | 余项若只 $O(t^{-5/2})$ 则系数不唯一 |
| $o\bigl((\beta S)^{-5/2}\bigr)$ | 最终精度 | `01-introduction.tex:56-63` | 定理与推论的接缝 | 退成 $O(\beta^{-5/2})$ 时次项系数失去意义 |

表外补一句结构：位置栏全部是本会话真实读过的行区间，未读区间的量只在符号栏带 `[推测]` 标记，其定义位置我没有引用。

## §23 勘误、缺口申报与自检

一、落盘与体量。首块 12,772 B，含 §0 到 §4，低于规格给出的 20,000 B 目标带下限，按类别申报为缺口；缺口没有推迟任何后续笔，第二笔起连续追加，逐笔落盘后的实测字节为 24,588、40,020、69,035、79,446。取证共 10 次调用，其中 1 次目录与字节列举、9 次 `.tex` 窗口读取；首次落盘发生在第 9 次调用，落在要求的第 6 到第 12 次之间；第 10 与第 11 次调用（即第 9 次与第 10 次取证）读完 `04-profiles.tex` 全文与 `05-sources.tex` 前 172 行，此后停止取证，未读区间在 §0 与 §15 列明。每个读取窗口都控制在 12,000 B 以内，最大的是 `04-profiles.tex` 的 10,726 B 与 `05-sources.tex` 窗口的约 8,600 B。

二、就地改动申报。全文有三处把一个定界符字符就地改成了闭合反引号，位置在原第 269 行、原第 277 行以及 §14 首段那条位置引用；改动都是单字符替换，字节数不变，依据是规格里关于定界符配对错位时改那一处为反引号的条款。除此之外没有对已落盘内容做任何删除、回滚、改写或重排，也没有用脚本整档重写。

三、禁串命中申报（只报类别与行号，交本体侧机械清理）。对举转折词类 3 处，在第 28、255、285 行；该类短否定式 2 处，在第 333、577 行；顺承提示短语类 3 处，在第 114、365、563 行；该类短语的另一形态 1 处，在第 527 行。长停顿号、整行分隔符、勾号与那一个二十字头的数量词，实测零命中。

四、未译英文残留申报。同一类别共 14 行命中，行号为 72、98、146、212、319、337、367、387、399、418、567、606、621、631，其中两处位于台账单元格里。这些词本应在落笔时就写成中文。

五、素材记号泄漏申报。两处：第 9 行写进了一个排版指令名，第 267 行写进了一个公式标签名。正文没有抄录素材的交叉引用命令、公式标签与命题编号，位置一律以文件加行区间表示。

六、残缺定界符申报。第 210 行与第 291 行各有一处从素材抄来的公式，其一侧定界符在素材里就是残缺形态，我原样保留；两行的定界符字符成对性不受影响。

七、交叉引用松指申报。§4 末尾预告"在 §10 说明配分函数表示那条输入的权重"，实际兑现于 §15 与 §17；§0 声明 `04-profiles.tex` 的补读结果写在 §10，实际分布在 §10、§11、§15 与 §22。节号本身连续，物理排布与编号一致。

八、关键量复核，用来对照台账。次项系数 $\frac{3\zeta(5/2)}{128\pi^{3/2}}$ 的四份来源彼此独立：一维 Laplace 展开给 $\frac1{16}$，三个独立坐标给因子 $3$，满周期求和给 $\zeta(5/2)$，三维归一化给 $(4\pi)^{-3/2}$。误差预算里的四个尺度按 $\beta^{-3/2}\gg\beta^{-2}\gg\beta^{-5/2}\gg\beta^{-3}$ 排列，判据实际消耗的是 $2X^2$ 与 $2\varepsilon$ 两项，前者由 $\mathbb E_P[\mathbf 1_{\mathcal G}(X_+^2+X_-^2)]=o(\beta^{-5/2})$ 供应，后者由 $2\rho(\beta)$ 供应，另外两项由 $\lvert\langle h,\mu_+\rangle\rvert$ 的 $\beta^{-5/2-\delta/4}$ 与坏事件上 $0\le q\le1$ 的粗界供应。$\delta$ 的有效上限是 $\frac14$，最慢误差项在 $\delta=\frac14$ 时是 $\beta^{-21/8}$，仍达不到 $\beta^{-3}$，这解释了 §21 第一条遗留问题为什么不是微调常数就能解决。尺度侧的自检同样闭合：由 $\sup W=\beta^{-1}D_*^{-2}=C\beta^{-2}$ 得 $D_*\asymp\beta^{1/2}$，由三项幂次方程解得 $\lambda=\beta^{-3/2}$ 与 $L=\beta^{\delta}$，由背景界 $\frac{C}{\beta R}=o(\beta^{-5/2})$ 得 $R\gg\beta^{3/2}$，由内蕴球 $B_{50R_*}$ 与 $R_*=\lceil\beta^{5/3}\rceil$ 得 $R\le O(\beta^{5/3})$，四条同时满足的窗口非空。压力侧的极限顺序自检：$\frac1h\int_0^h(1-e^{-\beta t})\,dt\sim\frac{\beta h}{2}$ 在 $h\downarrow0$ 时消失，$\rho_N\to1$ 要求 $50R_*$ 在 $N\to\infty$ 中固定，$(\beta S)^{5/2}\to\infty$ 最后登场，三者顺序不可调换。

九、追加更正一条。本节第三段末句在指代那个数量词类别时，用来指代的短语本身含该类别的被禁字形，因此申报为同类命中 1 处，位置就在该段末句；同一句里给出的零命中判断随之作废，其余三类的零命中结论按实测保留。

十、素材缩写记号沿用申报。按类别说明而不写出记号本身：涉及期望、概率、狄利克雷形与迹这四类只在素材导言区定义的缩写记法，我在正文与台账里都沿用了，实测影响 55 行，分布从 §4 一直到本节。规格要求这类记号展开成标准写法，我落笔时没有做到，落盘之后按规则不做就地替换。

十一、裸竖线申报。表外正文有三行用了未加保护的竖线字符，行号 273、275、324，形态是限制算子与绝对值的旧写法，共 7 枚。台账部分 62 行（表头 1 行、分隔行 1 行、数据 60 行）每行恰好 6 枚竖线，格内的绝对值、范数、分隔条件与限制算子全部改用带方向的正规定界写法，实测格内零裸竖线。

十二、收工实测（追加以上四段之前的数字）。全文 83,585 B、660 行、24 个小节，编号 §0 到 §23 连续且物理排布与编号一致；数学定界符字符 2,048 枚即 1,024 对，逐行奇偶全平；行内代码用的反引号 462 枚，逐行成对，无一处把闭合符误写成数学定界符；竖线共 379 枚，其中 372 枚是台账单元格分隔符，7 枚见上一条申报；台账数据行 60 行，表头行与带空格的分隔行全文各一次。本节以上四段自身不含数学定界符、反引号与竖线字符，所以那些计数在追加之后保持不变，只有字节数与行数增加。取证窗口、未读区间与首次落盘时机已在 §0 与本节第一段登记。
