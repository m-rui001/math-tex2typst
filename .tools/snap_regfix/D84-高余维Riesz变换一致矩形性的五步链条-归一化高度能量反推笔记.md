# D84 高余维 Riesz 变换的一致矩形性：归一化高度能量链条的反推笔记

队列行 108。论文：Riesz transforms and uniform rectifiability in higher codimension，署名作者 OpenAI，日期 2026-09-24。本笔记以第一人称还原这条推理链，写法是"正在做这项研究的我"的现场记录，包含走错的路、断点、转折与台账。

## §0 素材坐标、读取规则与工作姿态

正文素材只来自 tex。仓库里 `paper.pdf` 是加密的，pdftotext 这条路本身走不通，也不允许走，所以我的全部引文都从 `build/sections/*.tex` 里逐行取。测量结果如下（字节 / 行数）：

- `paper.tex` 2,367 B / 59 行，只是装载壳；
- `00-introduction.tex` 10,267 B / 198 行；
- `01-background.tex` 19,718 B / 405 行；
- `02-flat-balls.tex` 30,656 B / 727 行；
- `03-planar-limits.tex` 29,022 B / 642 行；
- `04-height-compactness.tex` 22,215 B / 519 行；
- `05-fractional-rigidity.tex` 26,892 B / 615 行；
- `06-excess-propagation.tex` 17,431 B / 427 行；
- `07-packing-endpoint.tex` 15,254 B / 358 行；
- `08-consequences.tex` 8,396 B / 192 行；
- `09-geometric-conventions.tex` 4,224 B / 79 行。

十个 section 合计 184,075 B / 4,162 行。我的读法是先建目录再局部读：用一次 ERE grep 把 `section{`、`subsection{`、`(begin){theorem|lemma|proposition|corollary|definition}` 的行号全部打出来，得到 29 个编号条目的落点表，然后按条目行段回读。正文体量接近 180 KB，通读会把我淹在证明的细节里，而目录结构本身携带了论文真正的骨架信息：02 与 03 最厚，05 次之，08、09 极薄。这个体量分布后来成为我判断"作者真正怕的地方"的依据。

Lean 侧的取证范围严格限定在三处：`lean/formalization.yaml`、`lean/OAI/Analysis/RieszRectifiability/`、`lean/ComparatorChallenges/RieszQuantitative.json`。这三个坐标是登记信息给定的，我不越界去翻别的目录。

我的工作姿态说明白：我不接受"作者写下的顺序就是我可能想到的顺序"。tex 里的顺序是打磨过的、去掉失败痕迹的顺序。我要还原的是原始猜测的分布，所以我先把剩下的公开问题读成一个约束满足问题，然后列出所有合理的攻击点，再逐个尝试，看哪一条会在哪一步崩。崩的位置和症状要写清楚，因为症状是唯一的判据。

## §1 初始动机与猜想：我以为剩下的那个 case 长什么样

我拿到的起点是这句摘要（`build/paper.tex` 前置的 abstract，正文 `00-introduction.tex:36-44`）：

> "We prove that an $n$-Ahlfors--David regular Radon measure on $\R^d$ is uniformly $n$-rectifiable if its $n$-dimensional Riesz transform is uniformly bounded from scalar $L^2(\mu)$ to vector-valued $L^2(\mu)$ over all positive hard truncations, for integers $d\ge4$ and $2\le n\le d-2$. This gives a positive answer to the David--Semmes Riesz-transform question in its remaining higher-codimension range."

我第一眼关心的是"remaining"这个词落在哪里。David--Semmes 问题在 n = d（超曲面）与 n = d-1（余维一）之后，剩下的解析条件版本是 `1 < n < d-1`。论自己在引言里把这个缺口说得非常直白（`00-introduction.tex:103-104`）：

> "The remaining range for this bound-alone question, $1<n<d-1$, is stated explicitly in \cite[Question~4.4]{Tolsa2026ICM}"

于是我脑子里的形状是这样的：已知条件只有截断算子的一致 L² 界，没有主值存在性假设（正文 `00-introduction.tex:43` 有一句我当时就想找到的话："No pointwise principal-value hypothesis is imposed."），要导出的是几何端的一致矩形性，也就是大块的 Lipschitz 像。中间缺一个把 L² 有界转成几何平坦的机制。

我把可能的攻击点列成三条，并且给自己排了优先级。

第一条：Tolsa 型的 $\beta_2$ 数路线。这条是我最想用的，因为它在平面的情形（`n = d-1`）里已经被打磨得非常成熟：由 Riesz 变换的 L² 有界导出 $\beta_2^2 \frac{dr}{r}$ 的 Carleson 测度，然后由 David--Tolsa 的 $\beta$ 数判别法得一致矩形性。我知道 Dąbrowski--Tolsa 那条等式（后来核到 arXiv 2402.08615）说的是在 $\R^{n+1}$ 里 $\lVert R\mu\rVert_{L^2(\mu)}^2$ 加上总质量等价于 $\beta_{2,\mu}(x,r)^2$ 对 $\frac{\mu(B(x,r))}{r^n}\frac{dr}{r}$ 的积分。这条路线的诱惑在于它把问题压缩成一个数量，而数量的平方积分天然对接 L² 有界。我期待的攻击点是"把 $\beta_2$ 的定义里的法向偏差投影到余维方向的 d-n 个坐标上"，看能不能逐坐标复用平面情形的对偶论证。

第二条：Litzinger--Moraes 型的 MDS（measure density spectrum / 密度测度）路线。我的想法是：高余维里最难的是法向几何，那么先把极限测度分类，用 Preiss 型刚性把切测度锁成定密度平面测度，再由一致测度的刚性回推原测度的平坦。论文引言自己也提到了这条线的两个部件（`00-introduction.tex:126-131`），引 Tolsa 2015 uniform measures 的 `[Section~3]` 与 Preiss 刚性的 `[Theorem~2.4]`。我原本把这条当第二选择，因为它需要"所有切测度都一致"这种强得多的输入，而我的假设只给算子范数。

第三条：从截断 L² 有界直接推几何。也就是不经过 $\beta$ 数的 Carleson 积分，直接对测试函数配对，把 $\mathcal R_\mu(\varphi)$ 这种东西当成"几何的线性泛函"来用，然后靠反证与 blow-up 抽取极限。这条在我眼里是最笨的，因为看起来要处理的定量项太多，而且没有已发表的模板可抄。

我的初始猜想是这样的：剩余高余维 case 的真正困难在于"没有标量位势论"，也就是没有调和函数的最大值原理可用，而 NTV 在余维一里恰好用了它。论文引言把这句话写死在 `00-introduction.tex:87-89`（引 `[Section~1]` of Nazarov--Tolsa--Volberg 2014）：

> "They identify reliance on a maximum principle, for which they report no known higher-codimension analogue, as the main obstacle"

所以我最先猜的攻击点位置是：需要一个替代最大值原理的东西，而且它应该在标量 Riesz 变换的配对里就能被读出来。我当时以为那个替代品多半是某种单调量（Almgren 型频率函数、或者 $\beta$ 数的递推衰减），也就是"某个数量沿尺度单调"。这个猜想决定了我第一周的全部尝试方向。

我也给自己定了一个判别式的目标形式：最终要证的几何目标必须写成"对某个固定充分大的 H，集合 $\{Q : b_\mu(z_Q, H\ell(Q)) > \varepsilon\}$ 满足 Carleson 估计"（论文后来在 `01-background.tex:341-345` 明确写了这个目标，我在还原时把它当作我的靶心）。选这个形式的原因是它离 David--Semmes 的双边判别法最近，双边量 $b$ ，并非单边 $\beta$ 是因为高余维里"平面里有洞"这种事必须排除；论文在 `01-background.tex:259` 有一句话印证了这个选择："The second term in $b$ rules out holes in an approximating plane."

## §2 尝试过的错误路线及失败原因

### §2.1 错误路线一：把 $\beta_2$ 的平方积分 Carleson 性直接搬到余维 d-n > 1

我做的第一件事是把 $\beta_\mu(x,r)$ 定义为 $L^2$ 意义的法向偏差，然后把 d-n 个法向坐标分开，声称每个坐标的 $\beta$ 数由 Riesz 变换的对应分量控制，于是"照抄平面情形的对偶论证"就能得到 Carleson 估计。

断点在对偶那一步。平面情形（`n = d-1`）里，法向只有一个方向，把 $\beta$ 写成对偶配对时，我用的是一个标量 Lipschitz 测试函数，它的支撑在法向量上取一次方向；这一步的实质是 $\R^d$ 中过 $x$ 的法线只有一条（模尺度），于是 $\beta(x,r)^2$ 能被一个"到超平面的距离"的平方控制，而距离函数本身是 Lipschitz 且零均值条件的实现非常干净。到了余维 d-n ≥ 2，法向是一个 d-n 维的子空间，我到平面的距离是 $\sqrt{\sum_{a=1}^{d-n} u_a^2}$，也就是 s 个标量高度函数的 $L^2$ 组合。我要的估计形状是 $\int (\sum_a u_a^2)\,d\mu$，而对偶机制给我的是每个 $a$ 单独的 $\int u_a$ 对某个测试函数的配对。从"逐个法向坐标"回到"坐标的平方和"需要对每个坐标取一个依赖于该点局部最佳平面的方向 $e_Q$，而这个方向是逐立方体选择的，非度量可加。

症状：在把平方和拆开的时候，交叉项的符号失控。我试着用 Cauchy--Schwarz 把交叉项吸进主项，得到的不等式右边多出 $\mu(B)^{1/2}$ ，并非 $\mu(B)$，量纲（scaling）在 $\ell(Q)^n$ 这个尺度上对不上。具体地说，我在做一个 Carleson 求和时，$\sum_Q \frac{|\int \varphi_Q u\,d\mu|^2}{\ell(Q)^n}$ 这一项的 Bessel 型估计需要 $\{\varphi_Q\}$ 是某个 $L^2(\mu)$ 函数系上的 Bessel 序列，而平面情形的证明里这个 Bessel 性质是靠一个已知定理（NTV 2014 的 Section 14 或 Jaye--Nazarov 的 Appendix B）给的，那两个引用的证明都依赖余维一的结构。我试着直接证明一个余维 d-n 的版本，在 Gram 矩阵那一步卡住：我可以把 $\lvert\langle f_Q,f_P\rangle\rvert$ 控制住，但控制常数里出现 $H_J H_J'$，而 $H_J'$ 依赖下界 $c_1$，我没有可接受的 $c_1$，因为我还没建立 dyadic 胞元的下界质量。也就是循环依赖：需要 Bessel 来出 $\beta$ 的 Carleson，需要 Carleson 来出下界质量，需要下界质量来出 Bessel。

失败根因：这条路线要的是"先把几何量平方，再对偶"，而平方结构在高余维里把标量对偶变成了向量值对偶，标量 $L^2(\mu)$ 假设（对 $f$ 标量、输出向量）根本给不出向量值输入的界。这一点我是在读到论文 `00-introduction.tex:39-42` 的表述时才彻底确认的：假设是 scalar $L^2(\mu)$ 到 vector-valued $L^2(\mu)$，标量在输入端，向量在输出端；我的对偶需要的是向量在输入端。这是一个方向性错误，修不好，只能换靶子。

### §2.2 错误路线二：先分类一致测度 / 切测度，再靠刚性回推

第二条我认真走了几天。想法是：假设 $\mu$ 满足截断 L² 界，取任意 blow-up 序列 $\mu_j$，由紧致性得极限 $\sigma$，证明 $\sigma$ 是定密度平面测度，再由反证得到"$\mu$ 在许多尺度上平坦"。

断点有两处，第一处是 blow-up 极限的几何维度不够。要由反证得到 Carleson 打包，我必须对"平坦性失败"的尺度集合做密度控制，也就是需要一个"$\mu$ 在每个 dyadic 胞元上都有下界质量"的可用结构，而这要靠 regular dyadic cells（论文 `01-background.tex:270-307`，即 prop:dyadic-lattice）来给。这一步本身没问题。真正的问题在第二处：由反证得到的极限测度 $\sigma$ 是平坦的（支撑在一个 n 平面上），但平坦极限本身不回推原测度的平坦，除非我知道**收敛速率**。反证只给我"$\mu_j$ 在固定半径上趋于平面"，而我要的结论是"$e_{\mu_j}(0,1)$ 与某个尺度上的振荡量之比趋于 0"。缺少速率，我就无法把结论写成 Carleson 估计，因为 Carleson 需要的是一族尺度上的和，并非单尺度的收敛。

症状：我写出的引理结论长这样：对每个固定的 $r$，当 $j\to\infty$ 时 $e_{\mu_j}(0,r)\to0$。这是个逐尺度的陈述，无法打包。而 Carleson 打包必须要求"同一个 $j$、跨越 $K_j$ 个尺度的同时控制"，也就是需要形如 $e_{\mu_j}(0,2^k)\le\delta_j 2^{\gamma k}$（论文 `03-planar-limits.tex:510` 附近的 eq:flat-limit-source-excess 正是这个形状）的水平。我原本以为这个水平控制可以用一致测度刚性去换，思路是：如果每个切测度都是一致的，那么平坦性沿尺度一致改进。这里我撞到了论文自己在 `03-planar-limits.tex:486-489` 写下的坦白，还原时我把它当成我这条路的墓碑（引文在 `03-planar-limits.tex` 正文，紧邻 prop:flat-limit 之前）：

> "we do not invoke a classification of arbitrary higher-codimension reflectionless measures"

也就是：高余维无反射测度的分类本身就是未知的，一致测度路线在这里必须先解决一个比原问题更难或至少同样难的分类问题。而 Tolsa 2015 那条一致测度的刚性定理是给"所有切测度都一致"这种强假设准备的，论文在 `00-introduction.tex:131-134` 说明了为什么接不上（这句我读到时正是在解释我的失败）：

> "Here AD regularity gives two-sided comparisons rather than exact ball masses. The normalized-height energy and rigidity argument below provides the required propagation without a uniform-measure rigidity input."

失败根因：AD 正则性只给双侧比较，不给精确球质量，而一致测度刚性要的是精确质量。差一个乘性常数 $C_{\rm AD}$ 就意味着切测度是一族，并非一点，刚性定理的输入形式（"每个切测度等于其密度乘以平面测度"）不再成立，我需要一个"对所有可能的极限都成立"的结论，而 L² 界只告诉我极限算子有界，不告诉我极限测度是精确一致的。

### §2.3 错误路线三：找替代最大值原理的单调量（Almgren 型频率 / $\beta$ 数递推衰减）

因为引言明确把最大值原理的缺失当成障碍，我猜作者的解法一定是一个单调量，于是我去找一个沿尺度单调递减的量，希望它同时被 Riesz 配对控制。我最看好的候选是归一化能量 $\int_{B(x,r)}\dist(x,L)^2r^{-n-2}\,d\mu$（即 $e_\mu^2$，论文 `01-background.tex:247-248`）的递推衰减：希望有 $e_\mu(a,r/2)\le C(e_\mu(a,r)^{1+\alpha}+C_{\rm R}^{-1}\text{之类})$。

断点在等式本身：$e$ 的递推里，法向高度的非线性项需要一个"高度函数满足什么方程"的信息，而我只有算子范数。$e$ 的改进要靠 Riesz 配对给的正则性，但当我把配对写成高度函数的泛函时，出现的不是局部量，是半局部量：一个在 $B(0,R)$ 内部与外部之间分配的边界项。我想要单调性，就必须证明边界项对内部量的贡献是次主导的；这一步在高余维里出问题时因为核 $K_n(z)=z/|z|^{n+1}$ 的阶只跟 $n$ 有关，与 $d$ 无关，于是外部的远场贡献衰减是 $|y|^{-n-1}$，而质量的生长是 $r^n$，两者相乘得到 $\int^\infty t^{-2}t^{n}\cdot t^{-n}\,dt$ 形式的边缘收敛。我原以为这足够，实际算下来远场项给的是一个常数，并非 $o(e)$。也就是说：递推式右边有一个不随 $j$ 消失的误差项，单调性被打断。

症状非常具体：我推出的形式是 $e_j \le \tfrac12 e_{j-1} + \eta$，其中 $\eta$ 由远场控制，而我对 $\eta$ 的最佳估计是 $O(1)$（不随 $e$ 变小而变小）。于是尺度递推在 $\eta$ 处饱和，只能得到"平坦到 $\eta$ 水平"，而 $\eta$ 是任意固定的，这刚好是我需要的 ε-平坦，看着够用，但它对 $C_{\rm R}$ 的依赖是坏的：饱和值 $\eta$ 需要取成小于最终输出的 $\varepsilon$，而我能给出的 $\eta$ 只依赖 $d,n,C_{\rm AD},G$，与 $C_{\rm R}$ 无关，那意味着我的结论对 $C_{\rm R}$ 巨大时也成立，这显然与已知的情形矛盾（例如余维一里已知界是定量依赖于 $C_{\rm R}$ 的）。也就是说这个饱和值实际上是我在中间某处丢掉了 $C_{\rm R}$ 的因子。回头找，丢的位置在把远场项用 Cauchy--Schwarz 估成 $\|u\|_2$ 时，用了 $L^2$ 界但把 $u$ 的归一化选成了 $1$，于是所有 $C_{\rm R}$ 都进了一个可以吸收掉的常数里。这正是论文 `04-height-compactness.tex:227-229` 那段专门警告的地方（这段我读到时以为是多余的注释，实际是失败模式的记录）：

> "Thus the remote part retains the factor $\delta$ supplied by the centered test. Replacing that factor by a constant would lose the required normalization."

失败根因：我想要的单调量根本不存在，存在的是"能量有界"，并非"能量递减"。这个认识直接把我推到 §3 的转折点上。

### §2.4 错误路线四：把截断算子的界直接当主值算子的界来用

第四条更短，但我确实先掉进去过一次。我一开始默认 $\mathcal R_\mu$ 作为一个全局配对是良定义的，然后想用 $\lvert\mathcal R_\mu(\varphi)\rvert\le C\lVert\varphi\rVert_{\Lip}$ 这种形式的估计。症状是：在我的第一个 blow-up 引理里，我需要把 $\mathcal R_{\mu_j}(\varphi)$ 传到极限 $\mathcal R_\sigma(\varphi)$，而测试函数的均值条件 $\int\varphi\,d\mu_j=0$ 在弱收敛下会漂移，因为 $\mu_j(B)$ 不收敛到 $\sigma(B)$（球边界有质量）。这一段我卡了很久，直到看到论文 `01-background.tex:86-96` 的 lem:pairings 是怎么绕开的：

> "The integrals in \eqref{eq:pairing-definition} converge absolutely, and their sum is independent of $a,R$."

也就是说全局配对 $\mathcal R_\sigma(\varphi)$ 是通过"内截断 + 外截断的两个积分之和"定义的，而它存在的原因正是主值的奇偶抵消被显式写进了定义里；而均值条件漂移的问题，论文在 lem:weak-compactness 用一个测试修正解决：$\varphi_j=\varphi-c_j\eta$，$c_j=\int\varphi\,d\sigma_j/\int\eta\,d\sigma_j\to0$。我的错误是试图在"点态主值"的意义下使用它，而论文在 `00-introduction.tex:43` 与 `01-background.tex:146-147` 两处反复强调它没有这个意思（后一处原文："The notation does not assert a pointwise principal value."）。这是一条概念性错误路线，代价是我在弱收敛传递上白白设计了两套不必要的机器。

## §3 关键转折点：把法向高度先除以 excess 尺度再取极限

论文的五步链条我复述成：（1）flat balls，即由算子界得到"在 Carleson 例外族之外，每个 dyadic 立方体内有有限深度内的双边平坦球"；（2）height compactness，即把法向高度作为函数在测度序列上抽出收敛；（3）fractional rigidity，即极限高度满足一个阶为一的分数方程，于是是仿射的；（4）excess propagation，即把（1）到（3）合成为一个尺度递推："若跨越 $K$ 个尺度的 excess 以 $\delta 2^{\gamma\ell}$ 增长且振荡量小于 $\delta^3 r^n$，则半尺度处 excess 降到 $\delta$ 且双边平坦小于 $\varepsilon$"；（5）packing endpoint，即把（4）的输出打包成 Carleson 估计，再交给 David--Semmes 双边判别法。

转折点在第（2）步与第（3）步的接缝处，具体是"归一化的时机"。我在 §2.3 失败以后，重新写了能量式，然后做了下面这个代换。设 $u_j$ 是第 $j$ 个尺度上的法向高度（真实物理量，量级 $\delta_j$），我原来的写法是直接研究 $u_j$，于是所有估计里都带着一个消失中的因子 $\delta_j$，极限是零函数，零函数什么也告诉我不了。我在纸上写下的下一个自然选择是 $w_j=u_j/\delta_j$，也就是把高度除以 excess 尺度再取极限。这一步看起来只是记号，实际改变了整个论证的类型：$u_j$ 的极限是平凡的（恒零），而 $w_j$ 的极限是非平凡的，代价是它的能量只有一致有界、没有趋于零。

这就是我从"找单调量"转向"找有界量"的瞬间。而让这个转向真正成立的，是我在推第（2）步的核心恒等式时发现的一个符号事实。要估的是 $\mathcal E_{\mu,D}(\chi U)$，其中 $U$ 是中心化后的高度、$\chi$ 是截断。把它写成双重积分并对称化以后，出现的被积函数恰好可以配方，论文里对应的行是 eq:height-cutoff-identity（在 `04-height-compactness.tex` 的证明中段）：

> $(U(x)-U(y))(\chi^2U(x)-\chi^2U(y))=|\chi(x)U(x)-\chi(y)U(y)|^2-U(x)U(y)(\chi(x)-\chi(y))^2$

左边的第一个因子 $(U(x)-U(y))$ 正是反对称核 $K_n$ 与仿射高度配对时留下的东西，也就是说它正是 $\langle e,\mathcal R_\mu(\phi)\rangle$（取 $\phi=\chi^2U$）所能提供的量；右边第一项是我要的能量、符号为正，第二项是截断误差、被 $\Lip(\chi)$ 控制。一次反对称核的配对，天然给出的就是正的分数能量。这是这篇论文里我最想自己先想到的观察。它的后果是：Riesz 变换的 L² 界在余维 $d-n\ge2$ 里不需要最大值原理，因为要替代最大值原理的东西是能量恒等式，而能量恒等式来自核的奇性与配方的正号，两者都是纯代数的。

转折点出生的那一刻我要定位得更精确：是在我意识到"外场项必须带上 $\delta$ 因子"之后。若我先归一化（直接用 $w_j$），外场项的 $\delta$ 就没了，界变成 $O(1)$ 乘 $\lVert w\rVert^2$，能量界无法自举；若我一直不归一化（用 $u_j$），能量趋于零但极限平凡。正确的顺序是先用 $u_j$（带着 $\delta$）把能量估出 $C(\delta^3+\delta^2+\delta T^{-1})$，然后在最后一步整体除以 $\delta^2$，得到 $C(1+\delta+1/(\delta T))$。论文在 `04-height-compactness.tex:227-229` 写下了这个取舍的警告（我在 §2.3 引用过一次，这里给出它在证明里的原位置）：

> "Thus the remote part retains the factor $\delta$ supplied by the centered test. Replacing that factor by a constant would lose the required normalization."

紧接着论文在结论之后又补了一句防止误读的话（`04-height-compactness.tex` 证明末尾，测量在 260 行附近）：

> "The conclusion is a \emph{bounded} normalized energy; no vanishing of that energy has been asserted."

这句话在我眼里就是转折点的纪念碑：作者明确告诉你，这里的收获是有界，不是小。

有了有界能量，第（3）步就变成了一个纯粹的刚性定理：一个在 $\R^n$ 上带权 $(1+|x|)^{-n-2}$ 可积、且对一切零均值紧光滑测试满足 $\int v\,\mathcal Lg=0$ 的函数必然是仿射的。这里 $\mathcal L$ 是分数算子，它的 Fourier 符号是 $c_n\lvert\xi\rvert$，阶为一。符号阶为一意味着零频附近的核是线性的，所以核空间恰为仿射函数；而权重 $(1+|x|)^{-n-2}$ 的可积性假设排除了次数 ≥ 2 的多项式，论文 `05-fractional-rigidity.tex:603` 附近的计数是：次数 $k\ge2$ 的多项式会让 $\int_{R_0}^\infty r^{k-3}\,dr$ 发散。整个第（3）步只用 Fourier 分析与阶的计数，一点几何都没有，这正是它能在链条里被复用两次的原因（见 §4.4）。

## §4 最终思路与最初设想的差异

### §4.1 从"单调量"到"有界量"

我最想找的是一个沿尺度单调的量，最后用的是一个沿序列一致有界的量。差异的原因：单调性需要 PDE 型的比较原理（最大值原理、Harnack、频率函数），而这些在向量值 / 高余维核结构下都缺；有界性只需要一个代数恒等式加一次归一化。这个替换的代价是要多引一个刚性定理（lem:fractional-rigidity），而那个定理的证明成本极低（纯 Fourier），所以总体上是赚的。我最初以为第（4）步（excess propagation）会是一长串硬分析估计，最后发现它的主体是把第（1）到（3）步按反证法组装成一个紧性论证，真正的新内容只有"倾斜平面的重建"（lem:normal-affine-planes）。

### §4.2 定量常数的位置与我预期的不同

我原本假设结论里的 $\theta,M$ 会依赖 $\mu$ 的很多细节。论文给的是（`00-introduction.tex:66-67`）：

> "Its constants $\theta$ and $M$ can be chosen in terms of $d,n,C_{\rm AD}$ and $C_{\rm R}$ alone."

更重要的是链条中间那些常数的"选择次序"被反复强调。例如 lem:annular-alternative 末尾（`02-flat-balls.tex:266`）："The number $\rho$ is chosen before $\mu$, $a_0$, and $s$."；thm:excess-propagation 末尾（`06-excess-propagation.tex:351-352`）："The constants $J,\delta,K,A$ are chosen before the measure, center, and radius. The test radius $Ar$ need not be admissible."。最后这句"测试半径 $Ar$ 未必容许"是我一开始完全没预料到的设计：为了让振荡假设能覆盖 $A=8\cdot2^{K}$ 倍大的球，必须放弃"测试支撑在容许半径内"这个自然限制，转而用全局增长（lem:global-growth 给的 $G=9^dC_{\rm AD}$）去吃掉超出 $D_E$ 的那部分。这是一个我原本会做错的取舍。

### §4.3 平坦性用双边量，而 $\beta$ 数只在证明内部出现

我最想定 $\beta_2$ 的 Carleson 积分，最终几何目标写成 $b_\mu$（双边）的 Carleson 失败集（`01-background.tex:341-345` 与 `07-packing-endpoint.tex:84-91`）。原因在 §1 末尾说过：$b$ 的第二项 $\sup_{y\in L\cap B(a,r)}\dist(y,F)$ 排除"平面里有洞"。高余维里洞是真实威胁，因为支撑集是 $\R^d$ 中的 n 维集，一个平面片段没有质量是完全可能的；单边 $\beta$ 对此完全无感。论文在 dyadic 侧确实引入了振荡量 $W_J(Q)$（`01-background.tex:328-334`）作为 $\beta$ 的替身，它的量纲与 $\mu(Q)$ 相同（`01-background.tex` 定义后一句："The quantity $W_J(Q)$ has the same scaling as $\mu(Q)$."），也就是把 $\beta^2\mu$ 型二阶量改成线性的一阶配对量。我的失败路线一把平方结构当成资产，论文把它当成负债。

### §4.4 刚性被用了两次，而且不循环

我最初以为任何"先证明极限是定密度平面、再用它分类极限"的论证都会循环。论文在 `01-background.tex:362-369` 的 proof map 里明确处理了这一点：lem:fractional-rigidity 独立于测度极限，因此被用两次，一次在有界情形给出常密度（在 lem:planar-rigidity 内部），一次以加权形式识别归一化高度，两处不产生循环依赖，原文的收尾是：

> "so these two applications introduce no circular dependence"

这一点我在设计自己的路线时完全漏掉了：我把"刚性"看成一个整体黑箱（一致测度刚性），而论文把它拆成"算子层面的仿射刚性（无测度输入）"加"测度层面的常密度（有算子输入）"。拆分之后前者可以喂给后者，链条是单向的。这是我最初设想与最终思路之间最结构化的差异。

### §4.5 五步链条里真正的新东西比我想的少，但位置不同

我原本预期每个 step 都需要新的硬分析。实际读下来：第（1）步的主引理 lem:annular-alternative 明确写着算子界在这个引理里不需要，它是一个纯几何的二分法，靠对平面维度做强归纳；算子界只在 lem:annular-average-gap 里以 $E_0=3C_{\rm R}(G2^nM)^{1/2}+3C(n)G$（`02-flat-balls.tex:525`）的形式进来一次。第（3）步是纯 Fourier。真正的分析集中在第（2）步的能量估计与第（4）步的组装。我最初把难度预期放在第（4）步（以为需要复杂的 corona 分解），结果第（4）步在 Lean 里的体量也只有约 40 个文件、约三千行（见 §7），反道是第（1）步与第（2）步在机器里最重。

### §4.6 与 Dipierro--Savin--Valdinoci 的引用位置是我没预料到的

论文在机制叙述末尾（`00-introduction.tex:186-187`）和 `05-fractional-rigidity.tex:9-13` 各比较了一次 Dipierro--Savin--Valdinoci 2019，原文（`05-fractional-rigidity.tex:11-13`）：

> "Interpreting a fractional operator modulo constants is natural for functions of polynomial growth; compare \cite{DipierroSavinValdinoci2019}."

我原来的直觉是这类比较属于文献装饰，实际它是第（3）步技术前提的出处：$v$ 只在测度极限的几乎处处意义下确定，而 $\mathcal L$ 作用在带权可积函数上必须先解决"常数在分布意义下怎么定义 $\mathcal L$"的问题，答案是模常数、用零均值测试。这条引用是承重的。

## §5 逐条目四段式还原

编号条目一共 29 个：`00-introduction.tex` 3 个（def:ad、def:ur、thm:main），`01-background.tex` 5 个（lem:global-growth、lem:pairings、lem:weak-compactness、def:flatness、prop:dyadic-lattice），`02-flat-balls.tex` 5 个（lem:dyadic-test-bessel、prop:oscillation-packing、prop:flat-seeds、lem:annular-alternative、lem:annular-average-gap），`03-planar-limits.tex` 4 个（lem:plane-comparison、lem:fixed-plane-moments、lem:planar-rigidity、prop:flat-limit），`04-height-compactness.tex` 2 个（lem:height-energy、lem:moving-compactness），`05-fractional-rigidity.tex` 2 个（prop:height-equation、lem:fractional-rigidity），`06-excess-propagation.tex` 4 个（lem:affine-polarization、lem:normal-affine-planes、prop:normalized-excess-limit、thm:excess-propagation），`07-packing-endpoint.tex` 3 个（lem:seed-charging、prop:beta-packing、thm:bwgl），`08-consequences.tex` 1 个（cor:variation）。`09-geometric-conventions.tex` 不含编号环境，它只承载 thm:bwgl 的证明，我在 §5.8 的 thm:bwgl 条目里一并处理。每个条目四段：原文逐字引用加坐标、我补的推导、假设与常数的机械理由、`[推测]` 候选失败路线。

### §5.1 引言三件套

#### §5.1.1 def:ad（`00-introduction.tex:18-27`）

(a) 原文：

> "A Radon measure $\mu$ on $\R^d$ is \emph{$n$-Ahlfors--David regular} with constant $C_{\rm AD}\ge1$ if \[ C_{\rm AD}^{-1}r^n\le\mu(B(x,r))\le C_{\rm AD}r^n \qquad(x\in E,\quad 0<r\le D_E). \] We call these positive radii \emph{admissible}. The inequalities have no instances when $D_E=0$."

(b) 我补的推导。这里唯一需要补的是"为什么上界只在 $x\in E$、$r\le D_E$ 成立就够了"。因为 $\mu$ 是 Radon 测度且 $\supp\mu=E$，质量全在 $E$ 上；若 $r>D_E$，则 $B(x,r)\subset B(x,2r)\cap E\subset E$，此时任何 $r$ 的球内质量都不超过 $\mu(\R^d)$，而 lem:global-growth 会给出 $\mu(\R^d)\le 9^dC_{\rm AD}(D_E/2)^n$，于是粗上界可以从全局增长引理里免费拿到，无需写进定义。下界就没有这种补救：如果 $r>D_E$，$B(x,r)$ 可以吞下整个支撑而质量仍是 $\mu(E)$，而 $\mu(E)$ 与 $r^n$ 无可比性（$r$ 变大时 $r^n$ 无界），所以下界必须限制在容许半径内。定义把两个方向都限制在 $r\le D_E$，是为了让"容许半径"成为一个统一概念，后面所有引理都只在这个概念下说话。$D_E=0$ 时"无实例"这句话是空真：约束集为空，任何 $\mu$（只要支撑是单点）都自动满足定义，这正是 thm:main 证明里 degenerate 分支的入口（`07-packing-endpoint.tex:337` 之后）。

(c) 假设与常数的机械理由。要求 $C_{\rm AD}\ge1$ 纯粹是为了让 $C_{\rm AD}^{-1}\le C_{\rm AD}$，从而两个方向能被一个数控制，后面所有以 $C_{\rm AD}$ 为参数的常数表（$G=9^dC_{\rm AD}$、$H_J$、$E_0$ 等）都能写成 $C_{\rm AD}$ 的单调函数。指数 $n$ 出现在两侧是给定的维度，不可调：它决定核 $K_n(z)=z/|z|^{n+1}$ 的齐次阶为 $-n$，从而 $\int_{|x-y|>\varepsilon}\lvert K_n\rVert^2d\mu$ 的发散阶正好是 $\varepsilon^{-n}$，这是绝对收敛论证（lem:global-growth 最后一句）的核心。$x\in E$ ，并非 $x\in\R^d$ 是必须的，因为下界在支撑外完全无意义。

(d) `[推测]` 候选失败路线一：把定义改成"$0<r\le D_E$ 换成一切 $r>0$"，则单点支撑测度立刻违反下界，定理的退化分支要另写。`[推测]` 候选失败路线二：只用上界加"逐点下密度正"的 liminf 条件，此时 dyadic 胞元质量下界（prop:dyadic-lattice 的 $c_1\ell(Q)^n$）不再有证明入口，第（1）步的 Bessel 估计因 $H_J'$ 发散而崩。`[推测]` 候选失败路线三：把双侧比较改成"每个球质量 $\approx\mu(B(x,D_E))$"的弱形式，就落回 §2.2 的一致测度泥潭。

#### §5.1.2 def:ur（`00-introduction.tex:48-59`）

(a) 原文：

> "An $n$-Ahlfors--David regular measure $\mu$ on $\R^d$ is \emph{uniformly $n$-rectifiable} if there are $\theta>0$ and $M<\infty$ such that, for every $x\in E$ and $0<r\le D_E$, there is an $M$-Lipschitz map \[ g:B_{\R^n}(0,r)\longrightarrow\R^d, \qquad \mu\bigl(B(x,r)\cap g(B_{\R^n}(0,r))\bigr)\ge\theta r^n. \] The constants are chosen before $x$ and $r$."

(b) 我补的推导。定义里三个次序要拆开看：先给 $\theta,M$，再给 $x,r$，最后给 $g$。若把 $M$ 的量化挪到 $r$ 之后（即允许 Lipschitz 常数依赖尺度），定义会退化成"逐尺度 Lipschitz 可近似"，那在高余维里比一致矩形性弱，因为它允许近似图的斜率随尺度爆炸，而 David--Semmes 的判别法链条里"大块的 Lipschitz 像"必须是均匀 Lipschitz 的（thm:bwgl 的结论写的正是 $L$ 与 $a,r$ 无关）。为什么定义域是 $B_{\R^n}(0,r)$（半径 $r$ 的 n 维球），并非单位球：这样像集 $g(B_{\R^n}(0,r))$ 的直径自然是 $O(r)$（$M$-Lipschitz 给 $\le M\cdot 2r$），与 $B(x,r)$ 同量级，质量下界 $\theta r^n$ 才能与 AD 上界 $C_{\rm AD}r^n$ 直接比较；若用单位球，就要在结论里额外放一个尺度因子，而那个因子会跟 $M$ 纠缠。最后一句"The constants are chosen before $x$ and $r$"是我在 Lean 侧最关心的量化顺序（见 §7.2）。

(c) 假设与常数的机械理由。$\theta>0$ 的量级最终由 $\lvert\rVert$ 与 $\mu(B(x,r))$ 的比例给出，论文在 thm:main 证明里把它落到 $c\theta_0 2^{-n}r^n$（`07-packing-endpoint.tex` 末尾），所以 $\theta$ 是"判别法给的 $\theta_0$"乘"测度与 $\H^n$ 比较常数"乘一个 $2^{-n}$ 的覆盖损失。$M$ 的来源是判别法的 $L$ 加上 $r\mapsto r/2$ 的重参数化（$g(u)=f(u/2)$ 让 Lipschitz 常数减半而半径减半，净效应是把 $L$ 变成 $L/2$，同时在质量里丢 $2^{-n}$）。$n$ 与 $d$ 不出现在定义里是刻意的：一致矩形性的定义对 $(n,d)$ 无需求，所有 $(n,d)$ 的约束都在定理侧。

(d) `[推测]` 候选失败路线一：用双 Lipschitz 像（bilipschitz charts）替代 Lipschitz 像，在高余维里需要额外的法向单射性控制，我的证明给不出斜率一致性。`[推测]` 候选失败路线二：容许 $g$ 的定义域是 $\R^n$ 上的任意可测集（Reifenberg 型），会得到一个真弱的结论，无法由 Carleson 打包导出。`[推测]` 候选失败路线三：把 $\theta r^n$ 换成 $\theta\mu(B(x,r))$，看似等价（差 $C_{\rm AD}$ 的倍数），实际会让第（1）步 flat-seeds 的深度 $N_{\rm F}$ 与 $\theta$ 的依赖关系反转，破坏"$\rho$ 先于 $\mu$ 选定"的次序。

#### §5.1.3 thm:main（`00-introduction.tex:61-67`）

(a) 原文：

> "Let $d\ge4$ and $2\le n\le d-2$ be integers. Let $\mu$ be an $n$-Ahlfors--David regular Radon measure on $\R^d$ satisfying \eqref{eq:riesz-bound}. Then $\mu$ is uniformly $n$-rectifiable in the sense of Definition~\ref{def:ur}. Its constants $\theta$ and $M$ can be chosen in terms of $d,n,C_{\rm AD}$ and $C_{\rm R}$ alone."

而 eq:riesz-bound 本身在 `00-introduction.tex:39-42`：

> " \|R_{\mu,\varepsilon}f\|_{L^2(\mu;\R^d)}\le C_{\rm R}\|f\|_{L^2(\mu)} "

对所有 $\varepsilon>0$ 一致成立，紧接 `00-introduction.tex:43`："No pointwise principal-value hypothesis is imposed."

(b) 我补的推导。范围 $d\ge4$、$2\le n\le d-2$ 是怎么长出来的：下界 $n\ge2$ 排除 $n=1$（$n=1$ 由高余维的 Farag 2000 处理，引言 `00-introduction.tex:80-84` 引 `[Theorem~4]`），也排除 $n=0$（无意义）。上界 $n\le d-2$ 排除余维一（$n=d-1$，NTV 2014）与 $n=d$（MMV 1996 与 Tolsa 2015/2025 那条线）。把这两个约束合起来解：$2\le n$ 且 $n+2\le d$，于是 $d\ge4$ 自动成立，也就是说"$d\ge4$"是冗余陈述，它只是为了让读者一眼看到最低维数。我验证过 tex 里 `d-2` 只出现在两处：`00-introduction.tex:62` 与 `08-consequences.tex:45`（cor:variation 的重述），中间所有章节的假设只写 $1\le n<d$（`02-flat-balls.tex:13`、`03-planar-limits.tex` 各引理、`04-height-compactness.tex:33`、`06-excess-propagation.tex:320`、`05-fractional-rigidity.tex:382` 只要求 $n\ge1$）。链条的实际机制是 $d-n\ge1$（至少一个法向）加 $n\ge1$，而 $d-n\ge2$ 从未被任何引理单独消费。证明的整体形状（`07-packing-endpoint.tex:337` 起）：先用 thm:excess-propagation 与 prop:beta-packing 得 $b_\mu$ 的 Carleson 失败集，再用 `07-packing-endpoint.tex:276-307` 的 $\mu$ 与 $\H^n\restrict E$ 双侧比较把 Carleson 估计从 dyadic 立方体搬到连续半径的积分形式，交给 thm:bwgl（David--Semmes 双边判别法）得 big pieces of uniformly Lipschitz images，最后由 AD 正则性与 $\H^n$ 比较把 $\H^n$ 版的大块换回 $\mu$ 版，得到 def:ur。退化分支（$D_E=0$ 或支撑单点）在开头处理。

(c) 假设与常数的机械理由。$\theta,M$ 只依赖 $d,n,C_{\rm AD},C_{\rm R}$ 这句是全文定量的收口，我沿着链条核对过它的可行性：$G=9^dC_{\rm AD}$ 只含 $C_{\rm AD},d,n$；dyadic lattice 常数 $c_0,C_0,c_1,C_1$ 只含 $d,n,C_{\rm AD}$（prop:dyadic-lattice 末句）；$B_J=4H_JH_J'$ 只含 $C_{\rm AD},C_{\rm R}$ 经由 $G$ 与格常数；$\rho$ 依赖 $d,n,C_{\rm AD},G,\kappa,\varepsilon,T$，而 $T=E_0+2$ 与 $E_0$ 含 $C_{\rm R}$；$J$（thm:excess-propagation 的整数）依赖 $c,G,D_0,\gamma,\varepsilon,J_0$，其中 $D_0$ 由 $C_{\rm R}$ 与 $G$ 给出（lem:pairings："smooth truncations with a fixed bounded profile have bound at most $D_0+CG$"）。于是整条依赖链的终端只有四个数。$C_{\rm R}$ 的入口只有两处，这也是我最初以为可以不用它的原因：$E_0$（平均隙的地板）与 lem:planar-rigidity 里的局部 $L^2$ 界 $D_1$。

(d) `[推测]` 候选失败路线一：把结论加强为 $\theta,M$ 有显式原始递归表达式，链中 thm:excess-propagation 的 $J$ 是反证法给的（无界），因此任何试图给出 $J$ 的显式界的努力都会断在 compactness 论证里。`[推测]` 候选失败路线二：把假设放宽为"某个 $\varepsilon$ 序列上有界"，此时 lem:annular-average-gap 的对 $\varepsilon$ 一致声明失效，$E_0$ 不再是地板。`[推测]` 候选失败路线三：把范围扩到 $n=d-1$（余维一），技术上链条仍然闭合（内部章节只要 $n<d$），但结论会与 NTV 已证的重复；真正无法覆盖的是 $n=1$ 与 $d$ 之间 $d-1\le n$ 的边界，论文选择把 $n=1$ 让给 Farag、把 $n=d,d-1$ 让给已有结果。

### §5.2 背景五件套

#### §5.2.1 lem:global-growth（`01-background.tex:14-25`）

(a) 原文：

> "Let $1\le n\le d$, and let $\mu$ be $n$-Ahlfors--David regular with $D_E>0$. Then \[ \mu(B(a,r))\le G r^n\qquad(a\in\R^d,\ r>0), \qquad G=9^d C_{\rm AD}. \] If $D_E<\infty$, then $\mu(\R^d)\le9^d C_{\rm AD}(D_E/2)^n$. For every $\varepsilon>0$, every $f\in L^2(\mu)$, and every $a\in\R^d$, the integral defining $R_{\mu,\varepsilon}f(a)$ is absolutely convergent."

(b) 我补的推导。$G=9^dC_{\rm AD}$ 的推导是覆盖计数：取 $E$ 中极大的 $D_E/4$-分离点集 $\{x_i\}$，则以 $x_i$ 为中心、半径 $D_E/8$ 的互不相交球都在 $B(a,9D_E/8)$ 内（对任何 $a\in E$，$B(x_i,D_E/8)\subset B(a,D_E+D_E/8+D_E/8)<B(a,9D_E/8)$）。由 AD 下界，每个小球质量 $\ge C_{\rm AD}^{-1}(D_E/8)^n$，而 $B(a,9D_E/8)$ 内的总质量 $\le\mu(\R^d)$；用体积比较（$d$ 维）得点数 $\le 9^d$（这里实际是 $\omega_d$ 相消后的纯体积比 $(2\cdot9/2)^d$ 化简，论文给出的形式是"体积比较把数目界在 $9^d$"，并把 $2^n\le9^d$ 用上，因为 $n\le d$）。有了 $9^d$ 的分离点数，任意 $B(a,r)$ 用半径 $r$ 的球覆盖：若 $r\le D_E$ 直接用 AD 上界；若 $r>D_E$ 则 $B(a,r)\subset B(a,2r)$ 且 $\mu\le9^dC_{\rm AD}(D_E/2)^n\le9^dC_{\rm AD}(r/2)^n\cdot 2^n\le9^dC_{\rm AD}\cdot(2r)^n$，论文用一个更干净的处理得到常数 $G=9^dC_{\rm AD}$ 而不额外放大，因为 $r>D_E$ 时 $B(a,r)$ 吞掉整个支撑，$\mu(B(a,r))\le\mu(\R^d)\le9^dC_{\rm AD}(D_E/2)^n<9^dC_{\rm AD}r^n$（这里 $2^n\le9^d$ 的余地供放缩）。绝对收敛部分：$\int_{|x-y|>\varepsilon}\lvert K_n(a-y)\rVert^2d\mu(y)$ 用 dyadic 环分解，$\sum_j$ 第 $j$ 环上核平方 $\sim(2^j\varepsilon)^{-2n}$ 乘质量 $\le G(2^j\varepsilon)^n$，得 $\sum 2^{-jn}$ 收敛，于是 Cauchy--Schwarz 给出 $\int\lvert K_n\rvert\,d\mu$ 在截断外域上对 $L^2(\mu)$ 函数绝对收敛。

(c) 常数理由：$9^d$ 里的 $9$ 来自 $D_E/8$ 与 $9D_E/8$ 的半径比再取 $d$ 次方，指数 $d$ 用的是环境维数（体积比较是 $\R^d$ 里的），所以 $G$ 对 $d$ 是指数级的，这个放大后面被消费在 $H_J$、$E_0$、$\rho$ 里，是最终 $\theta,M$ 对 $d$ 极差的依赖的主要来源。$n\le d$ 这个假设的唯一消费者是 $2^n\le9^d$ 这一步；如果只有 $n\le d$ 不成立，覆盖计数还能做但常数要走另一条路，所以论文在内部章节只假设 $n<d$ 是安全的。这个引理的消费者是几乎所有后续引理：任何超出容许半径的球、任何远场积分都靠它。

(d) `[推测]` 候选失败路线一：把 $G$ 换成"$\mu(B(a,r))\le G'r^n$ 对 $r$ 大到 $\diam$ 以上"的更弱形式，则 lem:pairings 的尾项 $O(T^{-1})$ 与 lem:annular-alternative 的环分解都失去统一的地板。`[推测]` 候选失败路线二：试图用 Besicovitch 覆盖代替分离点计数，把 $9^d$ 换成与 $d$ 无关的常数；在 n 维集上 Besicovitch 常数本身依赖 $d$，且对 Radon 测度不给出更好的结果，收益为零。`[推测]` 候选失败路线三：跳过绝对收敛声明，直接在配对里用截断的主值极限；这时 lem:pairings 的"和与 $a,R$ 无关"就无从证明，因为交换极限与积分需要一个可积控制。

#### §5.2.2 lem:pairings（`01-background.tex:86-96`）

(a) 原文：

> "Suppose $\sigma$ satisfies global upper $n$-growth, with $n\ge1$. The integrals in \eqref{eq:pairing-definition} converge absolutely, and their sum is independent of $a,R$. For a fixed compact Lipschitz test, the contribution of $|y-a|>T$ is $O(T^{-1})$ as $T\to\infty$. If the hard truncations have $L^2$ bound $D_0$, smooth truncations with a fixed bounded profile have bound at most $D_0+CG$. Pairings against an indicator of finite measure have a limit as the inner truncation tends to zero whenever that indicator equals one on a neighborhood of the compact Lipschitz test's support."

对应的定义 eq:pairing-definition 在 `01-background.tex:70-78`，其中 $A=B(a,2R)$。

(b) 我补的推导。$\mathcal R_\sigma(\varphi)$ 被写成两项之和：近域 $A\times A$ 上的"对称差商"形式（内含 $2\varphi(x)-\varphi(y)-\varphi(z)$ 型的抵消）与远域 $A\times A^c$ 上的修正形式（用 $K(x-y)-K(-y)$ 补偿）。绝对收敛来自：近域用 $\lvert\varphi(x)-\varphi(y)\rVert\le\Lip(\varphi)\lvert x-y\rVert$ 加上核的 $\lvert x-y\rVert^{-n-1}$，得到可积性 $\int_0^1 t^{-n}\,d(\text{mass})$ 型，用 eq:near-growth-integral $\int_{0<\lvert x-y\rVert<h}\lvert x-y\rVert^{1-n}d\sigma\le C_nGh$（这个由环分解 $\sum_{j}2^{-j}\cdot h$ 得到）。独立性于 $a,R$ 是因为核为奇：把 $A$ 换成 $A'$ 时改变的部分正好是一个奇核在两个相同集合上的差，抵消为零，严格地说需要先把内截断 $\varepsilon$ 固定，再让边界项在 $\varepsilon\to0$ 时按 eq:localized-pairing-tail 型估计消失，论文给的是 $CG\frac rT\int\lvert\varphi\rVert d\sigma$。尾项 $O(T^{-1})$ 的来源：$\lvert y-a\rVert>T$ 时核 $\sim T^{-n}$，但配对里有一阶泰勒展开的余项，多出一个 $T^{-1}$，配合 $\sigma$ 的至多 $n$ 维生长得到绝对收敛级数。平滑截断的界 $D_0+CG$ 由 Schur 检验给出，核为 $Cs^{-n}\mathbf 1_{\{s<\lvert x-y\rVert<2s\}}$；这里 $CG$ 项是"硬截断与光滑截断之差的算子范数"，它只含全局增长 $G$ 与形状常数，因此与 $D_0$ 相加，并非相乘。指标函数的配对极限：需要指标在测试支撑的邻域上恒为一，是为了让截断球边界上的不连续不进入配对，此时内截断的极限存在是单调 + 有界论证。

(c) 假设与常数理由：$n\ge1$ 唯一的消费者是 $\int_0^1 t^{1-n}\cdot t^{n-1}\,dt$ 型积分的可积性（$n=1$ 时对数边缘，仍可用）；"固定解析类"的定义（`01-background.tex:58-59`：$\text{fixed analytic class}$ 意味着 $d,n,G,c$ 与硬截断算子界 $D_0$ 固定）说明 $D_0$ 是这个类的参数，因此"$D_0+CG$"是类内一致的。最后一句"The notation does not assert a pointwise principal value."（`01-background.tex:146-147`）是防混淆声明，消费者是所有把 $\mathcal R_\sigma$ 当泛函使用的引理（lem:weak-compactness、prop:flat-limit、lem:height-energy、prop:normalized-excess-limit）。

(d) `[推测]` 候选失败路线一：把 $\mathcal R_\sigma$ 定义成逐条主值 $\lim_{\varepsilon\to0}R_{\sigma,\varepsilon}\varphi$，则对 AD 测度的存在性需要 $L^2$ 有界加主值弱的极限论证，而论文刻意避开了它，因为主值的存在性会要求向量值输出的 a.e. 收敛，而我拿不到。`[推测]` 候选失败路线二：只用近域项（丢掉远域修正），$\mathcal R$ 就不再与 $a,R$ 无关，prop:flat-limit 的极限配对 $\mathcal R_{\mu_j}(\varphi)\to\mathcal R_\sigma(\varphi)$ 无法通过紧支撑测试闭合。`[推测]` 候选失败路线三：用光滑截断取代硬截断作为假设，会让 $C_{\rm R}$ 的输入形式偏离论文声明的"over all positive hard truncations"，Lean 侧 `Model.lean:18-20` 的严格不等式定义也必须重写（见 §7.3）。

#### §5.2.3 lem:weak-compactness（`01-background.tex:156-230`）

(a) 原文（前段）：

> "Let $\sigma_j$ be Radon measures with a common global upper growth bound $G$. Suppose $0\in\supp\sigma_j$ and that a common lower bound $c r^n$ holds at support centers up to radii $L_j\to\infty$. There is a subsequence converging locally weakly to a nonzero measure $\sigma$ with global upper and lower $n$-growth bounds. The supports converge locally in the following sense: (i) each point of $\supp\sigma$ is a limit of points of $\supp\sigma_j$; (ii) any convergent sequence $x_j\in\supp\sigma_j$ has its limit in $\supp\sigma$. Uniform hard-truncation $L^2$ bounds pass to $\sigma$."

(b) 我补的推导。标准步骤：在半径 $R$ 的球上，$\sigma_j(B_R)\le GR^n$ 给紧性（Prokhorov 在 Radon 测度局部弱拓扑下的形式，用可数稠密测试函数族对角化）。非零性来自下界在半径 $1$ 处成立（$0\in\supp$ 给 $\sigma_j(B(0,1))\ge c$ 需要 $1\le L_j$，$j$ 大时成立），于是极限在 $\overline B(0,1)$ 上有质量 $\ge$ 某正数（这里要小心：球闭包的质量下半连续给 $\sigma(\overline B(0,1))\ge\limsup\sigma_j(B(0,1))\ge c$）。下界传递：$\sigma(B(x,r))\ge cr^n$ 对 $x\in\supp\sigma$ 成立，需要把 $x$ 近似为 $x_j\in\supp\sigma_j$（这正是 (i)），再用 $\sigma_j(B(x_j,r'))\ge c(r')^n$ 与测试函数从内部的逼近；半径要留出边缘，所以结论形式对几乎每个 $r$ 成立（论文用"$\varepsilon$ 是好半径，除可数多个之外"的论证）。上界传递更直接：对 $B(x,r)$ 取 $\varphi\equiv1$ 于 $B(x,r)$、支撑在 $B(x,r+\eta)$，令 $\eta\to0$。支撑收敛的 (ii) 是"limsup 集被包含在支撑里"，它给出的是支撑集在 Hausdorff 局部意义下的收敛方向。$L^2$ 界传递的证明是这里唯一非标准的地方：固定 $f$ 与 $\varepsilon$，$\langle R_{\sigma,\varepsilon}f,g\rangle$ 里的核 $(x-y)/\max\{\eta,\lvert x-y\rVert\}^{n+1}$ 做截断上限化（capped kernel），使其在有界区域上是一致可积核，然后用弱收敛传配对，最后让 $\eta\to0$ 并用 $L^2$ 下半连续性；论文还要"所有除了可数多个 $\varepsilon$"来避开球边界质量的不可控。测试修正 $\varphi_j=\varphi-c_j\eta$，$c_j=\int\varphi\,d\sigma_j/\int\eta\,d\sigma_j$，$c_j\to0$ 是因为 $\int\eta\,d\sigma_j\to\int\eta\,d\sigma>0$（选 $\eta$ 使分母正）且 $\int\varphi\,d\sigma_j\to\int\varphi\,d\sigma=0$。这个修正是把"$\int\varphi\,d\sigma=0$"从极限搬到近似序列上的标准手法，我在 §2.4 卡住的就是这一步。

(c) 假设与常数理由：$L_j\to\infty$ ，并非固定半径，是因为要的下界是"全局"下界（对一切 $r$），只有让已知下界的范围扩张到无穷才能取遍所有半径；这是这个引理存在的全部理由，也是我在 §2.2 失败的原因之一（我当时的 $L_j$ 不扩张）。capped kernel 的 $\eta$ 是纯技术辅助参数，不属于链条。消费者：prop:flat-limit（第（2）步的测度极限）、lem:planar-rigidity（把有界情形的刚性搬到极限）。

(d) `[推测]` 候选失败路线一：直接用 vague 拓扑不加支撑收敛，则 (i) 缺失，$\sigma$ 的下界只能在"已知有质量的点"上成立，而这些点在极限下可能消失。`[推测]` 候选失败路线二：用 $L^2$ 界的强收敛传递，需要 $R_{\sigma_j,\varepsilon}f$ 的弱紧性与对角的可分性，成本比 capped kernel 大得多且仍要处理边界半径。`[推测]` 候选失败路线三：把 $G$ 换成逐 $j$ 不同的 $G_j$ 但 $\sup G_j<\infty$，看似无害，实际 $D_0+CG$ 类常数的"固定解析类"就不再固定，后续所有"$\rho$ 先于 $\mu$ 选定"的次序声明失效。

#### §5.2.4 def:flatness（`01-background.tex:244-257`）

(a) 原文：

> "For $r>0$ and a measure $\sigma$ with support $F$, let \begin{align*} e_\sigma(a,r)&=\inf_L\left(r^{-n-2}\int_{B(a,r)}\dist(x,L)^2\,d\sigma(x)\right)^{1/2},\\ b_\sigma(a,r)&=\inf_L\frac1r\left( \sup_{x\in F\cap B(a,r)}\dist(x,L) +\sup_{y\in L\cap B(a,r)}\dist(y,F)\right). \end{align*} Both infima run over affine $n$-planes in $\R^d$, and an empty supremum is zero. We call $e$ the \emph{excess} and $b$ the \emph{bilateral flatness number}."

(b) 我补的推导。$e$ 的归一化：$\int\dist^2d\sigma$ 的量纲是（长度）$^{2}\cdot$（长度）$^n$，除以 $r^{n+2}$ 后无量纲，开根后 $e$ 无量纲。这保证了 $e_{\mu_j}(0,2^k)\le\delta 2^{\gamma k}$ 里的 $2^{\gamma k}$ 是有意义的（$e$ 无量纲，而 $2^k$ 有量纲，所以 $\gamma>0$ 的增长因子是允许的）。为什么是 $L^2$ ，并非 $L^1$：能量恒等式（§3）产生的是平方项，$L^2$ 的 excess 才能与分数能量直接对话；$L^1$ 版本会让 §3 的配方失败。$b$ 里除以 $r$ 让双边量无量纲，两个 sup 相加，并非取 max 是随意的（差因子 2），但两项都保留是实质性的（排除平面里的洞）。"empty supremum is zero"是为了 $F=\varnothing$ 或 $L\cap B(a,r)=\varnothing$ 时的良定义，实际用在退化支撑情形。$b$ 与 $e$ 的关系：局部 doubling 下 $\beta\lesssim b$ 与 $b\lesssim\beta+\text{holes}$，论文不直接用这个比较，是只在第（1）步用 $e$、在第（5）步用 $b$，所以只需 $e$ 的次可加性与 $b$ 的尺度协变性。$b$ 的尺度协变：$b_{r^{-n}(T_{a,r})_\#\sigma}(0,1)=b_\sigma(a,r)$，论文在 `06-excess-propagation.tex` 的 eq:prop-flatness-covariance 里用了这个（我在 §5.7 处理）。

(c) 理由：指数 $n+2$ 的消费者是第（4）步的递推 $e_\mu(a,2^\ell r)\le\delta 2^{\gamma\ell}$，$\gamma$ 与 $n+2$ 的组合决定了高度平方的 dyadic 力矩 $M\delta_j^22^{(n+2+2\gamma)k}$（eq:height-dyadic-moments），于是 $n+2$ 出现在两处并相互抵消，任何一边改动都要同步。inf 在 affine $n$-planes 上：注意是 $n$ 维仿射平面在 $\R^d$ 中，这与 Lean 侧 `IsAffineNPlane` 用 `Module.finrank ℝ S.direction = n` 一致。$b$ 的消费者是 prop:flat-seeds、thm:excess-propagation、prop:beta-packing、thm:bwgl；$e$ 的消费者是 lem:plane-comparison、prop:flat-limit、prop:normalized-excess-limit、thm:excess-propagation。

(d) `[推测]` 候选失败路线一：把 $e$ 改成 $L^\infty$ 偏差（$\sup\dist/r$），则第（2）步的能量估计无法用 $L^2$ 截断测试闭合，因为无穷范数没有配对表示。`[推测]` 候选失败路线二：去掉 $b$ 的第二项（洞项），会得到单边 $\beta$ 型量，第（5）步就无法调用 David--Semmes 的双边判别法（thm:bwgl 明确要求 $b_E$）。`[推测]` 候选失败路线三：把 inf 限制在过 $a$ 的平面上，会人为制造"最佳平面偏移"的二阶误差，lem:plane-comparison 的 $\frac c2\eta^2R^n$ 型界就不成立（两个近似平面可能因偏移项而互相远离）。

#### §5.2.5 prop:dyadic-lattice（`01-background.tex:270-307`）

(a) 原文（节选 (ii)）：

> "writing $\ell(Q)=2^{-k}$ for $Q\in\mathcal D_k$, there are centers $z_Q\in Q$ and constants $0<c_0\le1/2$, $C_0\ge2$ for which \[ (E\setminus N)\cap B(z_Q,c_0\ell(Q))\subset Q \subset E\cap B(z_Q,C_0\ell(Q)),\qquad c_1\ell(Q)^n\le\mu(Q)\le C_1\ell(Q)^n; \]"

另外 (i) 是"each $\mathcal D_k$ partitions $E\setminus N$, and cells of different generations are disjoint or nested"，(iii) 处理父与子，末尾要求"finite-diameter join"在 $D_E\le2^{-k_0}<2D_E$ 处发生；常数只依赖 $d,n,C_{\rm AD}$；引用是 `[Section~4, p.~12]{AzzamMourgoglouVilla2023}`。

(b) 我补的推导。构造是标准 dyadic 格在度量空间上的限制：先在 $\R^d$ 上取标准立方体格，再对支撑 $E$ 做"最近点分配"，把 $E$ 分给包含它最近的立方体；这样得到的胞元可能退化，所以引入核心球 / 外球夹逼（$c_0,C_0$）。质量下界 $c_1\ell(Q)^n$ 的证明：$z_Q\in Q$ 且 $(E\setminus N)\cap B(z_Q,c_0\ell(Q))\subset Q$，于是 $\mu(Q)\ge\mu(B(z_Q,c_0\ell(Q))\cap E)-0\ge C_{\rm AD}^{-1}(c_0\ell(Q))^n$（$c_0\ell(Q)\le D_E$ 由 join 条件保证），所以 $c_1=c_0^nC_{\rm AD}^{-1}$。上界同理 $\mu(Q)\le C_{\rm AD}(C_0\ell(Q))^n$。null 集 $N$ 是所有世代立方体边界的并（可数个），$\mu(N)=0$ 因为每个边界是 $\le d-1$ 维集而 AD 测度给不出质量（用 $\mu(B(x,r))\le Cr^n$ 与 $n$- Hausdorff 比较）。"different generations are disjoint or nested"在限制到 $E$ 后仍然成立，代价是胞元不再是立方体，是 Borel 集。

(c) 理由：$c_0\le1/2$、$C_0\ge2$ 的约束是为了让"父胞元的外球包含子胞元的外球"，并且 $B(z_Q,C_0\ell(Q))$ 覆盖 $Q$ 时留出 $2$ 倍余地给后面的 $S=B(z_{Q_0},(C_0+2)L)$ 型外球（`02-flat-balls.tex:137`）。$\ell(Q)=2^{-k}$ 的二进制比是第（1）步 $N_{\rm F}$ 取 $\log_2$ 的原因：$N_{\rm F}>\log_2(16(A_{\rm F}+C_0)/\rho)$。$D_E$ 处的 join 保证只有有限多个世代，从而"有限族统一截断 $\varepsilon$"可行（prop:flat-seeds 证明末尾对 $\varepsilon<\frac12\min r_Q$ 的单次截断）。这一族常数被 lem:dyadic-test-bessel（$H_J'=c_1^{-1}G(2J+C_0)^n$）、prop:oscillation-packing（$S$ 的半径）、prop:flat-seeds（$B(z_P,A_{\rm F}\ell(P))\subset B(z_Q,c_0\ell(Q)/4)$）、prop:beta-packing（$H\ge4(C_0+1)$）四处消费。

(d) `[推测]` 候选失败路线一：用 Christ--Dyadic 格（需要 $E$ 是齐性空间且用准距离展开），会把常数复杂化并丢掉 $\ell(Q)=2^{-k}$ 的精确二进制；论文的 $N_{\rm F}$、$J_{\rm o}$ 都要取 $\log_2$，换成非二进制比会让"深度"计数变成 $\lceil\log\rvert\rVert/\log 64\rceil$ 型，我在 §7.5 会看到 Lean 侧正是这么做的（$1/64$）。`[推测]` 候选失败路线二：跳过 null 集 $N$，直接用闭包型胞元，则 (i) 的"disjoint or nested"失效，Carleson 求和里会出现重复计数。`[推测]` 候选失败路线三：把 $c_1$ 的下界改成"每个胞元的子代至少一个有质量"，这是逐点弱化的条件，无法支撑 Bessel 估计里的 $H_J'$。

### §5.3 第（1）步：平坦球（02-flat-balls 五件套）

这个 section 的前言（`02-flat-balls.tex:13-26`）交代了三件事：全节假设 $1\le n<d$；常数可依赖 $d,n,C_{\rm AD},C_{\rm R}$ 与格常数；dyadic Bessel 与振荡技术的出处是 `[Section~14]{NazarovTolsaVolberg2014}` 与 `[Section~5 and Appendix~B]{JayeNazarov2013}`。我读到这里的第一反应是：作者承认这一层的技术是抄平面的，只在必要处改写。

#### §5.3.1 lem:dyadic-test-bessel（`02-flat-balls.tex:43-124`）

(a) 原文：

> "Fix $J>1$. For each cube in a finite family $\mathcal A\subset\mathcal D$, choose one test $\varphi_Q$ from the class defining $W_J(Q)$. There is $B_J<\infty$, independent of $\mathcal A$ and the choices, such that \[ \sum_{Q\in\mathcal A} \frac{\left|\int\varphi_Q u\,d\mu\right|^2}{\ell(Q)^n} \le B_J\int |u|^2\,d\mu\qquad(u\in L^2(\mu)). \] For vector-valued $u$ the same constant works with $\int\varphi_Q u$ replaced by $\int\varphi_Q\langle e_Q,u\rangle$, where each $|e_Q|\le1$ may be chosen independently."

(b) 我补的推导。这是把 $\{\ell(Q)^{-n/2}\varphi_Q\}$ 证明成 $L^2(\mu)$ 上的 Bessel 序列。标准做法是 Gram 矩阵判据：若存在正权 $w_Q$ 使 $\sum_{P\in\mathcal A}\lvert\langle f_Q,f_P\rangle\rVert w_P\le C w_Q$ 对所有 $Q$ 成立，则 $\{f_Q\}$ 是 Bessel 序列且界为 $C$（这里用 $2\lvert t_Qt_P\rvert\le\lvert t_Q\rVert^2w_P/w_Q+\lvert t_P\rVert^2w_Q/w_P$ 的对称配分）。要控制 $\langle f_Q,f_P\rangle=\ell(Q)^{-n/2}\ell(P)^{-n/2}\int\varphi_Q\varphi_P\,d\mu$。$\varphi_Q$ 的支撑在 $B(z_Q,J\ell(Q))$、Lipschitz 常数 $\ell(Q)^{-1}$、零均值；当 $Q,P$ 的世代差很大时，小球的 $\varphi$ 与大的 $\varphi_P$ 的配对靠 $\varphi_P$ 在小球上的近似常数性（Lipschitz 给出的偏差是 $\Lip(\varphi_P)\cdot$ 直径 $\le$ 比值），加上 $\int\varphi_Pd\mu$ 的均值条件与核 $\sim$ 无，得到衰减。论文把重叠关系封装成两个计数常数：$H_J=GJ^{n+1}(2J+1)^2$（`02-flat-balls.tex:68`，一个父 / 邻居计数，来自同世代胞元的球堆积与 $J$ 倍邻域），以及 $H_J'=c_1^{-1}G(2J+C_0)^n$（`02-flat-balls.tex:87`，跨世代的质量比，用到下界 $c_1$）。于是 $\sum_P\lvert\langle f_Q,f_P\rangle\rVert w_P\le4H_JH_J'w_Q$（`02-flat-balls.tex:107`），取 $w_Q\equiv1$ 得 $B_J=4H_JH_J'$（`02-flat-balls.tex:118`）。向量值版本之所以"同一个常数"，是因为每个 $Q$ 的方向 $e_Q$ 只出现在 $\langle e_Q,u\rangle$ 这个标量里，$u$ 是向量而 $\lvert\langle e_Q,u\rVert\rvert\le\lvert u\rVert$，$L^2(\mu)$ 的范数用的是 $\R^d$ 值，所以估计与标量一致。这一点正是 §2.1 我搞错的地方：这里的向量值是**输出侧**的，Bessel 假设需要的仍是标量测试函数，所以 $C_{\rm R}$ 的标量输入界刚好够用。

(c) 常数与指数理由：$J^{n+1}$ 的一个 $J$ 来自 $\Lip(\varphi_Q)\le\ell(Q)^{-1}$ 支撑放大 $J$ 倍后 $\varphi_Q$ 的振幅（$\sim J$），$J^n$ 来自体积；$(2J+1)^2$ 是两世代重叠的双因子。$c_1^{-1}$ 出现在 $H_J'$ 里，是 AD 下界进入 Bessel 界的位置，所以 $B_J$ 对 $C_{\rm AD}$ 是 $\propto C_{\rm AD}$（经由 $c_1^{-1}=C_{\rm AD}c_0^{-n}$）乘 $G=9^dC_{\rm AD}$，即二次依赖。消费者：prop:oscillation-packing（那里出现 $4v^{-2}B_JC_{\rm R}^2\mu(S)$），以及 prop:flat-seeds 证明里的 $\sum_Q\lvert\int h_Q\langle e_Q,u\rangle d\mu\rvert^2\le I\lVert u\rVert_2^2$ 的 Haar 版本。

(d) `[推测]` 候选失败路线一：把测试类换成非零均值的类，则重叠世代之间的配对不衰减，Gram 判据的发散立即出现。`[推测]` 候选失败路线二：对向量值测试（每个 $Q$ 一个 $\R^d$ 值向量 $\varphi_Q$）声明同一个 Bessel 界，需要在输入侧用向量值 $L^2$ 假设，而假设只给标量输入；这正是我 §2.1 的崩点。`[推测]` 候选失败路线三：改用 Haar 系统直接展开（跳过 Bessel），会需要 $\{h_Q\}$ 的正交性，而限制到 $E$ 上的 dyadic 胞元的 Haar 只给出近似正交，误差项要重新引入 $H_I=(C_1/c_1)2^{In}$（这个数在 prop:flat-seeds 证明里出现，见 `02-flat-balls.tex:580-727` 段）。

#### §5.3.2 prop:oscillation-packing（`02-flat-balls.tex:126-204`）

(a) 原文：

> "For every $J>1$ and $v>0$, the family \[ \mathcal O(J,v)=\{Q\in\mathcal D:W_J(Q)>v\ell(Q)^n\} \] is Carleson. Its constant depends only on the fixed data, $J$, and $v$."

(b) 我补的推导。这是全文里"$C_{\rm R}$ 换成几何"的第一次实质交换。取 $Q_0$，$L=\ell(Q_0)$，$S=B(z_{Q_0},(C_0+2)L)$。$\mathcal A\subset\mathcal O(J,v)\cap\mathcal D(Q_0)$ 有限，每个 $Q\in\mathcal A$ 有见证测试 $\varphi_Q$，$\lvert\mathcal R_\mu(\varphi_Q)\rvert>v\ell(Q)^n$。关键替换是把 $\mathcal R_\mu(\varphi_Q)$ 换成 $\mathcal R_\nu(\varphi_Q)$，其中 $\nu=\mu\restrict S$（质量截断到一个球），误差形如 eq:oscillation-outer-error：$\lvert\mathcal R_\mu(\varphi_Q)-\mathcal R_\nu(\varphi_Q)\rvert\le T_J(r_Q/L)r_Q^n$，$T_J=C(n)G^2J^{n+2}$（`02-flat-balls.tex:160-163`）。这个误差带一个 $r_Q/L$ 因子，所以对细尺度立方体是小量；于是选 $N$ 使 $2^{-N}\le\min\{(2J)^{-1},v/[2(T_J+1)]\}$（`02-flat-balls.tex:165-169`），把 $\mathcal A$ 分成"细的"（$r_Q\le2^{-N}L$）与"粗的"（不足 $N$ 个世代）。细的部分用 Bessel：对每个细立方体 $\lvert\mathcal R_\nu(\varphi_Q)\rvert>\frac v2 r_Q^n$，而 $\mathcal R_\nu(\varphi_Q)=\int\varphi_Q u\,d\nu$，其中 $u$ 是 $\nu$ 上 Riesz 算子的（向量值）作用，用 lem:dyadic-test-bessel 得 $\sum_{\text{细}}\frac{(v r_Q^n/2)^2}{r_Q^n}\le B_J\int\lvert u\rVert^2d\nu\le B_JC_{\rm R}^2\nu(S)\le B_JC_{\rm R}^2\mu(S)$，于是 $\sum_{\text{细}}r_Q^n\le4v^{-2}B_JC_{\rm R}^2\mu(S)$。粗的部分只有 $N$ 个世代，每世代里的立方体互不重叠、质量下界 $c_1r_Q^n$，直接求和得 $\le Nc_1^{-1}\mu(S)$。两部分合起来正是 Carleson 定义 eq:carleson-definition（`01-background.tex:317-320`）的形式 $\sum_{Q\in\mathcal F,Q\subset P}\mu(Q)\le C\mu(P)$（把 $r_Q^n$ 换成 $\mu(Q)$ 用 $c_1,C_1$ 互推）。

(c) 理由：$J$ 与 $v$ 是自由参数，$v$ 越小族越大、界 $\propto v^{-2}$，这个倒数平方在第（5）步被 $v=\delta^3/2$ 消费（`07-packing-endpoint.tex`），于是第（5）步里出现 $\delta^{-6}$ 量级的常数，最终喂进 $C_{H,\varepsilon}$。$G^2$ 在 $T_J$ 里出现两次：一次来自外层误差的生长，一次来自 $\nu$ 的生长界。$(C_0+2)$ 的选择保证 $S$ 覆盖所有 $\supp\varphi_Q$（$Q\subset Q_0$ 时 $B(z_Q,Jr_Q)\subset B(z_{Q_0},(C_0+2)L)$，需要 $J$ 相对 $Q_0$ 是细的，这也是 $2^{-N}\le(2J)^{-1}$ 的用途）。消费者：prop:flat-seeds（例外族就是 $\mathcal O(J,v)$ 加上平坦失败的种子族）与 prop:beta-packing（那里的 $\mathcal O=\{W_{J_{\rm o}}(T)>v\ell(T)^n\}$ 直接引用此命题的 $C_{\rm o}$）。

(d) `[推测]` 候选失败路线一：跳过 $\nu$ 截断，直接在 $\mu$ 上用 Bessel，则 $u$ 不再是 $L^2(\mu)$ 且范数不受 $C_{\rm R}$ 控制，求和发散。`[推测]` 候选失败路线二：把 $v\ell(Q)^n$ 换成 $\varepsilon^2\mu(Q)$（$\beta^2$ 型），则 $W_J$ 的线性定义不匹配，需要平方版本的 Bessel，回到 §2.1。`[推测]` 候选失败路线三：让 $N$ 依赖 $Q_0$，则粗世代数 $N$ 无法统一，Carleson 常数对 top cube 不一致，prop:flat-seeds 的"常数对 $Q$ 与顶立方体一致"就失效。

#### §5.3.3 prop:flat-seeds（`02-flat-balls.tex:212-225`）

(a) 原文：

> "For every $A_{\rm F}\ge1$ and $\eta>0$ there are an integer $N_{\rm F}\ge1$ and a Carleson family $\mathcal F$ such that every $Q\in\mathcal D\setminus\mathcal F$ has a proper descendant $P\subset Q$ with \[ 1\le\operatorname{depth}_Q(P)\le N_{\rm F}, \qquad b_\mu(z_P,A_{\rm F}\ell(P))<\eta. \] One may also require $B(z_P,A_{\rm F}\ell(P))\subset B(z_Q,c_0\ell(Q)/4)$. The constants are uniform in $Q$ and the top cube used in the Carleson estimate; they depend only on the fixed data, $A_{\rm F}$ and $\eta$."

(b) 我补的推导。这是第（1）步的最终形式，证明在 `02-flat-balls.tex:580-727`。取 $L_0=\max\{1,2C_0\}$、$M=(8L_0)^n/c_1$（这个 $M$ 是给 lem:annular-average-gap 的 $A\subset B(a,r/2)$、$r^n\le M\mu(A)$ 用）、$\kappa=c_0/32$（控制 annular-alternative 的球落在 $Q$ 内）、$\epsilon_{\rm F}=\eta A_{\rm F}/(32(A_{\rm F}+C_0))$（把 $b$ 从尺度 $t$ 搬到 $A_{\rm F}\ell(P)$ 时需要的除数）、$T=E_0+2$（地板加 2，让"大环"与"平均隙"矛盾有 2 的余量）。对给定的 $Q$，若 $Q$ 不在 $\mathcal F$ 里，则在 $B(z_Q,\kappa\ell(Q))$ 内以 annular-alternative（$\rho$ 依赖 $d,n,C_{\rm AD},G,\kappa,\epsilon_{\rm F},T$）找尺度 $s$：结论 (1) 给出平坦球 $b_\mu(a,t)<\epsilon_{\rm F}$，$\rho s\le t<\kappa s$；然后取包含 $z_P$ 的、满足 $t/(16(A_{\rm F}+C_0))<\ell(P)\le t/(8(A_{\rm F}+C_0))$ 的世代，得到 $b_\mu(z_P,A_{\rm F}\ell(P))<16\epsilon_{\rm F}(A_{\rm F}+C_0)/A_{\rm F}=\eta/2$（论文写的是"$=\eta/2$"，所以还留一倍余量给 $\mathcal F$ 内的估计），深度 $N_{\rm F}>\log_2(16(A_{\rm F}+C_0)/\rho)$ 就是这个尺度搬运所需的世代数上界。若结论 (2) 成立（大环），则 lem:annular-average-gap 说 $\lvert\mathcal S_\mu(a;r,R)\rvert>T$ 与算子界矛盾（因为平均隙被 $E_0$ 控制，而 $T=E_0+2$），故 (2) 只能发生在"某些 Haar 系数大"的立方体上；把这些立方体收进 $\mathcal F$。Haar 部分：$I>\log_2(8L_0/\rho)$，$H_I=(C_1/c_1)2^{In}$，$h_Q=\mu(A_Q)^{1/2}(1_{A_Q}/\mu(A_Q)-1_{B_Q}/\mu(B_Q))$，$\lVert h_Q\rVert_2^2=1-\mu(A_Q)/\mu(B_Q)\le1$，有限深度的 Haar Bessel $\sum_Q\lvert\int h_Q\langle e_Q,u\rangle d\mu\rvert^2\le I\lVert u\rVert_2^2$。最终 Carleson 常数 $H_IIC_{\rm R}^2G(C_0+2)^n/c_1$。截断一致性用 $\varepsilon<\frac12\min r_Q$，让有限族共用一个截断。

(c) 理由：$A_{\rm F}\ge1$ 是用户给的"平坦球相对胞元的放大率"，它进入 $\epsilon_{\rm F}$ 的分母，所以 $A_{\rm F}$ 越大要求的平坦度越高、$\eta$ 固定时 $N_{\rm F}$ 越大（$\log_2A_{\rm F}$ 级）。$\eta$ 只通过对数进入 $N_{\rm F}$。$c_0/32$ 里的 $32$ 是 $B(z_P,A_{\rm F}\ell(P))\subset B(z_Q,c_0\ell(Q)/4)$ 的余量：$\kappa s$ 链上要走 $4$ 层除法与 $A_{\rm F}$ 的放大。$T=E_0+2$ 的 2 是让 (2) 与"平均隙地板 $E_0$"之间留出绝对间隔，避免边界钝化。消费者：prop:beta-packing（种子族与 $\mathcal F$ 的关系）、thm:excess-propagation 的假设里 $A=8\cdot2^K$ 的球选择（种子给初始平坦性）以及 Lean 侧 `Uniformity/SurfacePieces.lean`（见 §7.6）。

(d) `[推测]` 候选失败路线一：去掉"$\rho$ 先于 $\mu$ 选定"的次序声明，把 $\rho$ 定义成依赖于 $a_0,s$ 的量，annular-alternative 就退化为逐点陈述，无法给出统一深度 $N_{\rm F}$。`[推测]` 候选失败路线二：把 Haar 部分换成直接的 $\beta$ 数级数和，需要 $\beta$ 的平方可和，回到 §2.1 的输入侧向量值问题。`[推测]` 候选失败路线三：让 $T$ 依赖 $Q$（例如取 $T=E_0+\lvert\log\ell(Q)\rVert^{-1}$），则 (2) 与地板不再矛盾，例外族的 Carleson 界无法求和。

#### §5.3.4 lem:annular-alternative（`02-flat-balls.tex:252-502`）

(a) 原文：

> "Fix $0<\kappa<1/8$, $\varepsilon>0$, and $T>0$. There exists $\rho\in(0,\kappa)$, depending only on $d,n,C_{\rm AD},G,\kappa,\varepsilon,T$, with the following property. For every $a_0\in E$ and $0<s\leq D_E$, at least one of the following assertions holds: (1) There are $a\in E\cap B(a_0,\kappa s)$ and $\rho s\leq t<\kappa s$ such that $b_\mu(a,t)<\varepsilon$. (2) There are $a\in E\cap B(a_0,\kappa s)$ and $\rho s\leq r\leq R<\kappa s$ such that $|\mathcal S_\mu(a;r,R)|>T$. The number $\rho$ is chosen before $\mu$, $a_0$, and $s$."

对应的环变换定义 eq:smooth-annular-transform 在 `02-flat-balls.tex:243-247`：

> " \mathcal S_\mu(a;r,R)=\int(\chi_{a,R}-\chi_{a,r})K_n(a-y)\,d\mu(y) "

其中 $\chi\equiv1$ 于 $\overline B(0,1)$、$0$ 于 $B(0,2)$ 外。

(b) 我补的推导。这是一个纯几何的二分法，证明里明说"算子界在这个引理里不需要"。反证：假设对某个 $a_0,s$，在 $\rho s$ 到 $\kappa s$ 的所有尺度上没有平坦球也没有大环。取 $\mu_j$ 为 $a_0$ 处尺度趋于 $0$ 的 blow-up（用 lem:weak-compactness），极限 $\sigma$ 全局双侧生长。若 $\sigma$ 平坦（支撑在某个 n 平面上），则 $b$ 在某尺度会小于 $\varepsilon$，这与"$\sigma$ 由一族非平坦的 rescaling 极限得到"矛盾；于是需要证明 $\sigma$ 平坦。关键引理 eq:nonflat-limit-flat（`02-flat-balls.tex:305-319`）给出：如果所有尺度都非平坦，则 $\sigma$ 的双边偏差在 2 倍球上有正下界 $b_\sigma(a,2t)\ge\eta/64$（这里 $\eta$ 是归一化后的下界）。然后 eq:annular-flat-scaling（`02-flat-balls.tex:339-345`）给出一组精确恒等式，把 rescaling 下的 $b$、$\mathcal S$ 的尺度变换写清。降维步骤是这条路线的心脏：取两个不同的切平面方向 $e_1,e_2$（两条切线），用最近点不等式 $2\langle e,y-a\rangle+\lvert y-a\rVert^2\ge0$ 得到 $\sigma$ 在半空间 $\{\langle e,x\rangle\ge0\}$ 上的矩条件；定义 $p_e(x)=\langle e,x\rangle_+/\lvert x\rVert^{n+1}$，由 $\lvert\mathcal S\rvert$ 的小性（反证假设）得 $\int_{v<\lvert x\rVert<R_0}p_e\,d\tau\le\lvert e\rVert T$，其中取 $r=\min(v,R_0)/4$；令 $T$ 固定、$R_0\to\infty$ 让远端趋于零，得 eq:vanishing-normal-moment，即 $\sigma$ 的支撑落入 $Q=P\cap e^\perp$，$\dim Q<\dim P$。于是对 $\dim P$ 做强归纳（基底 $\dim=0$ 平凡），每步降一维，最终 $\sigma$ 支撑在低维平面、与双侧 $n$ 维生长矛盾，除非原来的 blow-up 里就已经有平坦球。最后一段（`02-flat-balls.tex:460-501`）是把矛盾论证"局部化"，把紧致性估计每降一维带来的损失明确记账："the compactness estimates may multiply the upper constant by $2^n$ and divide the lower constant by $4^n$ at each tangent"（`02-flat-balls.tex:449-458`），而 beta 阈值的损失是 $\eta\to\eta/4096$；局部化段末尾有个地板 $\min(\varepsilon,1)/64$。

(c) 理由：$\kappa<1/8$ 是给 $B(a_0,\kappa s)$ 与尺度链 $\rho s\le t<\kappa s$ 留双重余量（$1/8$ 让三次 $\times2$ 的放缩仍留在 $s$ 内）。$\varepsilon>0$ 是输出平坦度，$\rho$ 对它的依赖是这条引理唯一非定量的部分。$T$ 是"大环"的门槛，它的选择在第（1）步的最后是 $T=E_0+2$，$E_0$ 来自下一条引理。$\eta/64$ 与 $\eta/4096$ 的 64、4096 是降维归纳的维度步数 $\le n$ 的每次损失的显式化，$4096=2^{12}$，说明最坏情况下作者预留了 12 次双指数余量。消费者：prop:flat-seeds（种子），以及 Lean 侧 Flatness/ 目录（5,556 行）。

(d) `[推测]` 候选失败路线一：如果只用一个切方向 $e$，$\sigma$ 的支撑只被压到一个半空间的边界，降不到低维；我用两次切线就是为了得到 $\langle e_1,x\rangle=\langle e_2,x\rangle=0$ 型的两个线性约束，这个"两次"是必须的，单次会停在半空间。`[推测]` 候选失败路线二：把环变换 $\mathcal S$ 换成硬截断差 $R_{\mu,\varepsilon_1}-R_{\mu,\varepsilon_2}$，则边界项带 $\varepsilon$ 的不连续，eq:nonflat-limit-flat 的极限传递需要额外的球半径选取，紧致性论证多出可数例外集，作者改用光滑 $\chi$ 正是为了回避。`[推测]` 候选失败路线三：不做维度归纳而直接对切平面族的紧集做对角抽取，会因为切平面族的紧致性本身就是 $b$ 有界才能给而循环。

#### §5.3.5 lem:annular-average-gap（`02-flat-balls.tex:515-576`）

(a) 原文：

> "Let $0<r\le R$, let $S$ be a bounded measurable set containing $B(a,2R)$, and let $A\subset B$ be measurable sets of positive finite measure satisfying \[ A\subset B(a,r/2),\qquad B\subset B(a,R/2),\qquad r^n\le M\mu(A),\qquad R^n\le M\mu(B). \] There is a constant \[ E_0=3C_{\rm R}(G2^nM)^{1/2}+3C(n)G, \] independent of $r,R,R/r,S$ and $\varepsilon$, such that, for every $0<\varepsilon<r/2$, \[ \left|\mathcal S_\mu(a;r,R)-\bigl(\langle R_{\mu,\varepsilon}1_S\rangle_A -\langle R_{\mu,\varepsilon}1_S\rangle_B\bigr)\right|\le E_0. \]"

(b) 我补的推导。这是算子界进入第（1）步的唯一入口。分解 $1_S=f+g+h$，$f=\chi_{a,r}$，$g=\chi_{a,R}-\chi_{a,r}$，$h=1_S-\chi_{a,R}$（`02-flat-balls.tex:542-546`），其中 $\chi_{a,\rho}$ 是同族的平滑截断（这里指环指示的光滑版本）。三项各给出 $\le C_{\rm R}(G2^nM)^{1/2}$：$f$ 项用 $\lVert f\rVert_{L^2(\mu)}^2\le\mu(B(a,r))\le Gr^n$，再由 $r^n\le M\mu(A)$ 得 $\lVert f\rVert_2^2\le GM\mu(A)$，于是 $\langle R_{\mu,\varepsilon}f\rangle_A$（在 $A$ 上的平均）由 Cauchy--Schwarz 与算子界 $\le C_{\rm R}(GM)^{1/2}$，论文写成 $(G2^nM)^{1/2}$ 是因为 $A\subset B(a,r/2)$ 时 $\mu(A)$ 与球平均之间的 doubling 损失放了一个 $2^n$。$g$ 与 $h$ 项是差的形式：$R_{\mu,\varepsilon}u$ 在两个支撑点上的差被 $C(n)G$ 控制（$g$ 一次、$h$ 两次），因为 $x\mapsto R_{\mu,\varepsilon}u(x)$ 当 $u$ 光滑且远离奇点时是 Lipschitz 的，界为 $C(n)G$（用核梯度 $\lvert\nabla K_n\rvert\sim\lvert z\rVert^{-n-1}$ 与 $\int\lvert z\rvert^{-n-1}d\mu$ 的环分解，加 $D_0$ 不出现）；所以 $3C(n)G$ 是"一个 $g$ 加两个 $h$"的和。三项 C_R 部分合并成 $3C_{\rm R}(G2^nM)^{1/2}$。

(c) 理由：$E_0$ 与 $R/r$ 无关是这条引理的价值所在，因为 annular-alternative 需要在所有 $r\le R<\kappa s$ 上一致地排除 (2)；如果 $E_0$ 有 $\log(R/r)$ 损失，$T$ 就不能固定。$M$ 来自 prop:flat-seeds 的 $M=(8L_0)^n/c_1$，因此 $E_0$ 对 $C_{\rm AD}$ 的依赖经 $\sqrt{M}$ 变成 $C_{\rm AD}^{1/2}\cdot c_1^{-1/2}$，而 $c_1^{-1/2}\propto C_{\rm AD}^{1/2}$，即 $E_0\propto C_{\rm AD}$ 乘 $C_{\rm R}$。$2^n$ 的存在是为了 $A,B$ 是"球的一半半径内的可测集"这一放宽；若假设 $A=B(a,r/2)$ 则可省。消费者：prop:flat-seeds（取 $T=E_0+2$），因此 $C_{\rm R}$ 经 $T$ 进入 $\rho$，再进入 $N_{\rm F}$，最终进入 $C_{H,\varepsilon}$ 与 $\theta,M$。这就是 $C_{\rm R}$ 进入几何的第一个位置，也是我在 §2.3 丢掉 $C_{\rm R}$ 时应该看到的入口。

(d) `[推测]` 候选失败路线一：想把这个地板做成 $o(1)$（随尺度比趋于零）是徒劳的，因为 $E_0$ 与 $R/r$ 无关正是它的用途；若强行要求趋于零，annular-alternative 的 (2) 分支就永远不排除。`[推测]` 候选失败路线二：用 $L^1$ 版的算子界替代 $L^2$ 版，$\langle\cdot\rangle_A$ 的平均无法由 Cauchy--Schwarz 控制，$(G2^nM)^{1/2}$ 会变成 $\mu(A)^{-1}\int\lvert R1_S\rvert$，发散。`[推测]` 候选失败路线三：把 $1_S$ 换成无界函数（比如 dyadic 测试本身），则 $h$ 的"两次 Lipschitz 差"不再有 $C(n)G$ 界，因为 $S$ 的有界性与包含 $B(a,2R)$ 是 $h$ 的支撑远离奇点的保证。

### §5.4 第（2）步的前半：平面极限（03-planar-limits 四件套）

#### §5.4.1 lem:plane-comparison（`03-planar-limits.tex:13-112`）

(a) 原文：

> "Fix $1\le n\le d$, $G\ge0$, and $c>0$. There are constants $A>0$ and $0<\varepsilon_0\le1$, depending only on $n,d,G,c$, with the following property. Suppose that $\sigma$ has global upper $n$-growth $G$, $R>0$, and $\sigma(B(0,R))\ge cR^n$. If $S,W$ are affine $n$-planes and $0<\eta\le\varepsilon_0R$ satisfy \[ \int_{B(0,R)}\bigl(\dist(x,S)^2+\dist(x,W)^2\bigr)\,d\sigma(x) \le \frac c2\eta^2R^n, \] then \[ \dist(x,W)\le A\eta(1+|x|/R)\quad(x\in S),\qquad |\dist(x,S)-\dist(x,W)|\le A\eta(3+|x|/R)\quad(x\in\R^d). \]"

(b) 我补的推导。这是"两个 $L^2$ 近似平面必须彼此靠近"的定量版本，也是我在 §2.1 里想当然使用而未证明的东西。设 $k$ 为方向交的维数（用 eq:lower-dimensional-tube：$\sigma\{x\in\overline B(0,R):\dist(x,V)<\tau R\}\le G2^n3^k\tau R^n$，$V$ 是 $\le k$ 维子空间；这是把低维子空间附近的管状邻域用体积比盖住，$3^k$ 来自管内的分离点计数）。取 $\tau=\min\{1,c/[4(G2^n3^n+1)]\}$：若 $S,W$ 的方向夹角大于 $\tau$，则 $S\cap W$ 附近的管包含 $S$ 在 $B(0,R)$ 中的大部分，于是 $\dist(\cdot,S)$ 与 $\dist(\cdot,W)$ 的联合 $L^2$ 偏差至少是 $\sim c\eta^2R^n$ 的两倍，与假设矛盾。锚点条件化是数值稳定步骤：$K_0=0$，$K_{j+1}=K_j(1+2/\tau)+1/\tau$，这个递推记录"把平面原点搬回锚点"的损失；最后 $\eta/R\le1/[4(K+1)]$ 保证偏移相对半径可忽略。输出常数 $A=2(1+8K)$，$\varepsilon_0=\min\{1,1/[4(K+1)]\}$。第一式（$x\in S$ 时 $\dist(x,W)\le A\eta(1+\lvert x\rVert/R)$）说明 $S$ 作为集合落在 $W$ 的 $A\eta$ 邻域内，且随远离原点线性放宽（两平面可能平行偏移）。第二式是关键：距离函数的**逐点差**受控，这才允许在第（2）步里把"用 $S$ 定义的高度"换成"用 $W$ 定义的高度"。

(c) 理由：假设里的 $\frac c2\eta^2R^n$ 中 $c/2$ 是为了与 $\sigma(B(0,R))\ge cR^n$ 配对，形成"平均平方偏差 $\le\eta^2/2$ 乘每单位质量的界"，让管论证的余量正好减半。$\eta\le\varepsilon_0R$ 是"$\eta/R$ 小"的量纲写法。$1+\lvert x\rVert/R$ 与 $3+\lvert x\rVert/R$ 的差别（1 对 3）来自三角不等式里的常数项，$3$ 覆盖"$x$ 到 $S$ 的最近点"与"$x$ 到 $W$ 的最近点"之间的两次跳转。消费者：lem:fixed-plane-moments（那里需要跨 $K$ 世代的统一平面）、prop:flat-limit 与 prop:normalized-excess-limit（用第二式交换高度定义）。

(d) `[推测]` 候选失败路线一：只用单边假设 $\int\dist(x,S)^2d\sigma\le\frac c2\eta^2R^n$（丢掉 $W$），则两个平面之间无约束，第二式失效。`[推测]` 候选失败路线二：把 $L^2$ 假设换成 $L^1$，管论证给出的是 $\tau$ 的一次方，并非平方，损失一个尺度幂次。`[推测]` 候选失败路线三：不引入 $K_j$ 递推（即假定平面已通过原点），跨世代复合时偏移线性累积，$A$ 会随 $K$ 爆炸，而 prop:flat-limit 需要的是与 $K_j$ 无关的 $A$。

#### §5.4.2 lem:fixed-plane-moments（`03-planar-limits.tex:114-165`）

(a) 原文：

> "Fix $0<\gamma<1/2$ and the constants $n,d,G,c$ of Lemma~\ref{lem:plane-comparison}. There are $\kappa>0$ and $M<\infty$, depending only on these data and $\gamma$, as follows. Suppose $K\ge0$ is an integer, $\delta>0$, $\delta2^{\gamma K}\le\kappa$, $\sigma$ has global upper growth $G$, and, for $0\le k\le K$, \[ \sigma(B(0,2^k))\ge c2^{kn}, \qquad e_\sigma(0,2^k)\le\delta2^{\gamma k}. \] Then an affine $n$-plane $S$ satisfies \[ \int_{B(0,2^k)}\dist(x,S)^2\,d\sigma(x) \le M\delta^2 2^{k(n+2+2\gamma)} \]"

(b) 我补的推导。这是"跨世代的 excess 衰减假设 $\Rightarrow$ 存在一个统一的参考平面，其对每个世代的矩都有指定增长率"。做法是迭代 lem:plane-comparison：在尺度 $2^k$ 与 $2^{k+1}$ 上各取最优平面 $L_k$，$e_\sigma(0,2^k)\le\delta2^{\gamma k}$ 给出 $\int_{B(0,2^k)}\dist(x,L_k)^2\le\delta^22^{2\gamma k}2^{kn}$；用 2 倍球的下界 $\sigma(B(0,2^k))\ge c2^{kn}$ 把两个假设凑成 lem:plane-comparison 的形式（$\eta_k=\delta2^{\gamma k}$），得 $\dist(x,L_{k+1})\le A\eta_k(1+\lvert x\rVert/2^{k+1})$ 于 $x\in L_k$。取 $b=2^\gamma$（尺度比不是 2 ，是 $b$，通过插入中间世代实现），$R_i=2^i$，则偏差的累积是一个几何级数，公比 $\eta_k/\eta_{k+1}=b^{-1}<1$（这里 $\gamma<1/2$ 与 $b=2^\gamma$ 的关系是收敛性的来源）。$D=2+2\cdot2^{n+2}b^2$ 是"累积偏移"的显式上界，$L$ 由 $D\le L^2c/2$ 选定（把 $D$ 换成 $L$ 以便在 lem:plane-comparison 的形式里让 $\eta$ 对应 $L$ 倍），$\kappa=\varepsilon_0/L$ 是给"假设 $\delta2^{\gamma K}\le\kappa$"的门槛（保证所有中间步骤都落在 $\eta\le\varepsilon_0R$ 的适用域内）。$B=AL(\frac3{2b-1}+\frac1{b-1})$ 是两个几何级数的和，输出 $M=4+2GB^2$。

(c) 理由：$\gamma<1/2$ 在这里已经出现（lem:height-energy 只要求 $\gamma<1$，thm:excess-propagation 要求 $\gamma<1/2$）。为什么是 $1/2$：$b=2^\gamma$，$\frac1{b-1}$ 与 $\frac3{2b-1}$ 在 $\gamma\to0$ 时发散，在 $\gamma\ge1/2$ 时 $b^2\ge2$ 会让 $D$ 与 $L$ 的关系（$D\le L^2c/2$）与矩目标 $2^{k(n+2+2\gamma)}$ 的指数不匹配：$2\gamma$ 若 $\ge1$，则 $\sum_k$ 里"偏移平方"与"质量"的卷积在指数上超出 $n+2+2\gamma$ 可吸收的范围。$M\delta^22^{k(n+2+2\gamma)}$ 就是 lem:height-energy 的 eq:height-dyadic-moments 的输入格式，指数完全一致，这是两条引理之间的接口。消费者：lem:height-energy、prop:flat-limit（eq:flat-limit-source-excess 到力矩的转换）、prop:normalized-excess-limit（eq:prop-fixed-plane-moments 里的 $C_*$）。

(d) `[推测]` 候选失败路线一：如果假设只有 $e_\sigma(0,1)\le\delta$（单尺度），跨代迭代无法启动，得到的平面 $S$ 只在一个尺度上有效；这是我从 §2.2 得到"缺少速率"教训的具体表现。`[推测]` 候选失败路线二：把 $\delta2^{\gamma k}$ 换成 $\delta k^{100}$（对数增长），$b=2^\gamma$ 型的几何级数换成超几何级数，$D$ 发散。`[推测]` 候选失败路线三：把参考平面的存在性交给紧致性（取 $K\to\infty$ 的极限平面），会失去 $M$ 的一致性，而 lem:height-energy 需要的正是同一个 $M$。

#### §5.4.3 lem:planar-rigidity（`03-planar-limits.tex:185-479`）

(a) 原文：

> "Let $1\le n\le d$, let $L$ be an affine $n$-plane, and let $\sigma$ be a nonzero Radon measure on $\mathbb R^d$ supported in $L$. Suppose that $c,G>0$ and \[ \sigma(B(x,r))\le Gr^n\quad(x\in\mathbb R^d,\ r>0), \qquad \sigma(B(x,r))\ge cr^n\quad(x\in\supp\sigma,\ r>0). \] Suppose also that $\mathcal R_\sigma(\varphi)=0$ for every compactly supported Lipschitz function $\varphi$ with $\int\varphi\,d\sigma=0$. Assume the hard Riesz truncations are uniformly bounded on $L^2(\sigma)$."

结论包含 $\supp\sigma=L$ 与 $\sigma=\theta\H^n\restrict L$，且 $c/\omega_n\le\theta\le G/\omega_n$，$\omega_n=\lvert B_{\R^n}(0,1)\rvert$；论文另外说同样的结论在"source assumption"下也成立。

(b) 我补的推导。这是全链条里唯一一个"从算子性质反推测度结构"的引理，也就是 §4.4 说的"测度层面的常密度"。步骤补全如下。第一步：把 $\mathcal R_\sigma$ 作用在"两个半径的指示之差"型测试上，得到 $P_{a,R}(\varphi)$ 的表达式与 eq:planar-radius-difference（半径差公式）：$\sigma$ 在 $L$ 上，所以对 $\supp\varphi\subset B(a,R)$ 的测试，配对只依赖 $\sigma\restrict B(a,R)$，球对称性给出 $\theta$ 的候选。第二步：局部 $L^2$ 界。eq:planar-local-cap-bound $\lVert T_{\varepsilon,B}1\rVert_{L^2(\mu\restrict B)}\le D_1\mu(B)^{1/2}$，用 Schur 检验，误差核是 $\varepsilon^{-n}\mathbf 1_{\{\lvert x-y\rVert\le\varepsilon\}}$，它的行 / 列和被 lem:global-growth 界在 $2^nG$（这里 $2^n$ 是 doubling）。第三步：eq:planar-local-constant 与 eq:planar-unweighted-local，把局部配对在无权重与带权两种形式之间转换。第四步：梯度式 Riesz。对单位向量 $u$，定义 $R_ug(x)=-\frac12\int\frac{\langle u,h\rangle[g(x+h)-g(x-h)]}{\lvert h\rVert^{n+1}}dh$，然后验证 eq:planar-riesz-gradient：$\sum_iR_{u_i}(\partial_{u_i}\psi)=\mathcal L\psi$，其中 $\mathcal L$ 就是 eq:fractional-operator-definition（`03-planar-limits.tex:170-174`）

> " \mathcal Lg(x)=\int_{\R^n}\frac{2g(x)-g(x+z)-g(x-z)}{2|z|^{n+1}}dz "

这个恒等式的验证靠射线参数化 $Q_x(t)=tQ_x(1)$（沿每条射线积分，把 $n$ 维积分化为球面积分乘一维）。第五步：把 $\mathcal R_\sigma(\varphi)=0$ 翻译成 $g=d\sigma/d\H^n$ 满足 $\mathcal Lg=0$（分布意义，零均值测试），结合第四步，$g$ 的各方向 $R_{u_i}(\partial_{u_i}\psi)$ 组合为零。第六步：有界仿射函数为常数（这是 lem:fractional-rigidity 的第一次应用：$\mathcal Lg=0$ 且有界给 $g$ 常数）。$\theta$ 的双侧界来自 $c\le\theta\omega_n\le G$（取单位球的上下界）。$\supp\sigma=L$ 的方向：若 $\supp\sigma$ 是 $L$ 的真闭子集，则 $L$ 中有开片无质量，用零均值测试可以局部化到 $L\cap B$ 的任意子集这一事实，得 $g$ 在一个正 $\H^n$ 测度集上为零而另一些集上为正，与常数密度矛盾。中间还用到 $\|\eta_s\|_\infty\le(cs^n)^{-1}$、$\Lip\eta_s\le(cs^{n+1})^{-1}$、$A=C_n(G^2/c+G)$、环界 $\le2A$、$p_{-e}(x)\le\frac12\lvert x\rVert^{1-n}$ 与 eq:planar-two-sided-density。

(c) 理由：$n\le d$（不是 $n<d$）是因为这个引理纯平面，与余维无关；$\mathcal R_\sigma(\varphi)=0$ 的无反射性是必需的（否则常数密度不成立）；"hard truncations uniformly bounded"这条额外假设是关键，论文用它给局部 $L^2$ 界（第二步），没有它则 $\mathcal R_\sigma$ 作为泛函可能无界，第四到六步的分布意义失效（这是与经典 Preiss / Mattila 刚性不同的地方，也是我在 §2.2 想省掉的那条）。$\omega_n$ 的出现是 Euclidean 归一化：$\H^n$ 在正交坐标下等于 Lebesgue 测度，单位球质量 $\omega_n$ 提供 $\theta$ 的自然除数。消费者：prop:flat-limit（极限测度的常密度识别），以及 thm:main 证明里 $\mu$ 与 $\H^n\restrict E$ 的比较（`07-packing-endpoint.tex:276-307`）。

(d) `[推测]` 候选失败路线一：用 Tolsa 2015 的一致测度刚性替代这条引理，则需要"$\sigma$ 的每个切测度都等于自身平移的常数倍"，而我只有无反射性；无反射性到高余维一致性的桥不存在（论文在 `03-planar-limits.tex:486-489` 明确拒绝这条路）。`[推测]` 候选失败路线二：跳过局部 $L^2$ 界直接假设密度局部可积，则 $\theta$ 的双侧界与 $g$ 的有界性都无从证明，第六步要用"有界 $\Rightarrow$ $\ell=0$"就失效。`[推测]` 候选失败路线三：把 $\mathcal L$ 换成经典 Laplacian（$g$ 调和 $\Rightarrow$ 常数的 Liouville 定理），需要 $g$ 全局 $C^2$，而我只拿到 $g\in L^\infty_{\rm loc}$；正则性提升正是我要证的东西，循环。

#### §5.4.4 prop:flat-limit（`03-planar-limits.tex:491-634`）

(a) 原文：

> "Fix $1\le n<d$, $c>0$, $0<G<\infty$, $0\le D_0<\infty$, and $0<\gamma<1/2$. Let $\mu_j$ be Radon measures on $\R^d$ with $0\in E_j=\supp\mu_j$, global upper $n$-growth $G$, and \[ \mu_j(B(x,r))\ge cr^n \quad(x\in E_j,\ 0<r\le\diam E_j). \] Assume every hard-truncated Riesz transform on $L^2(\mu_j)$ has norm at most $D_0$. Let $\delta_j>0$, integers $K_j\ge0$, and $A_j,v_j>0$ satisfy \[ \delta_j\longrightarrow0,\quad K_j\longrightarrow\infty,\quad \delta_j2^{\gamma K_j}\longrightarrow0, \]"

后续假设是 eq:flat-limit-source-excess（$e_{\mu_j}(0,2^k)\le\delta_j2^{\gamma k}$）与 eq:flat-limit-source-oscillation（对 $\Lip\varphi\le1$、$\supp\varphi\Subset B(0,A_j)$、零均值有 $\lvert\mathcal R_{\mu_j}(\varphi)\rvert\le v_j$），结论 eq:flat-limit-measure：$\mu_j\rightharpoonup q(L_\infty)_\#\mathcal L^n$ 且 $c/(4^n\omega_n)\le q\le2^nG/\omega_n$，另有 eq:flat-limit-lower-growth $\nu(B(x,r))\ge4^{-n}cr^n$。

(b) 我补的推导。这是"blow-up 序列若 excess 沿 $K_j$ 个世代以 $\delta_j2^{\gamma k}$ 增长且振荡趋于零，则极限是平面测度"。顺序：lem:weak-compactness 给子列收敛到 $\sigma$ 且双侧 growth；由 eq:flat-limit-source-excess 与 lem:fixed-plane-moments 得参考平面族 $L_j$ 使 $e_{\mu_j}(0,2^k)/(\delta_j2^{\gamma k})$ 有界；旋转坐标使 $L_j\to L_\infty$（法向框架 $N_j$ 的收敛，eq:flat-limit-normal-coordinate $u_{j,i}(x)=\langle N_je_i,x-a_j\rangle$）；由 excess 趋于零得 $\supp\sigma\subset L_\infty$（法向矩消失，eq:flat-limit-normal-moments）；对 $\sigma$ 验证 $\mathcal R_\sigma(\varphi)=0$（振荡假设 $v_j\to0$ 在这里变成无反射性，要用 lem:weak-compactness 的配对传递与测试修正）；最后用 lem:planar-rigidity 得 $\sigma=q\H^n\restrict L_\infty$ 与 $q$ 的双侧界。$4^{-n}$ 与 $2^n$ 的损失分别来自弱收敛下球的内 / 外夹逼（两次半径折半，$4^n=(2^2)^n$）。

(c) 理由：$D_0$ 出现在假设里是为了给 lem:planar-rigidity 的"hard truncations uniformly bounded"提供输入；$0\le D_0<\infty$ 允许 $D_0=0$（平凡情形），说明作者不想在陈述里加 $D_0>0$。$\gamma<1/2$ 由 lem:fixed-plane-moments 带入。$\delta_j2^{\gamma K_j}\to0$ 是"$K_j$ 不能长得比 $\delta_j^{-1/\gamma}$ 更快"，这是 lem:height-energy 的 eq:height-last-radius（$2^{-K_j}/\delta_j\to0$）的镜像条件，两者一起把可用尺度区间 $[1,2^{K_j}]$ 与误差项 $\delta_j$ 协调。schedule 在 `03-planar-limits.tex:636-643` 明确给出（我把它作为 §6 台账的锚）：

> "In the later contradiction argument we take $\gamma=1/4$, $\delta_j=2^{-j}$, $K_j=2j+3$, $A_j=8\cdot2^{K_j}$, and $v_j=\delta_j^3$. These satisfy $\delta_j2^{\gamma K_j}\to0$ as well as $\delta_j^{-1}2^{-K_j}\to0$."

$K_j=2j+3$ 与 $\gamma=1/4$ 的搭配是精确的：$\delta_j2^{\gamma K_j}=2^{-j}2^{(2j+3)/4}=2^{-j/2+3/4}\to0$，而 $\delta_j^{-1}2^{-K_j}=2^{j}2^{-2j-3}=2^{-j-3}\to0$。两个条件要求 $\gamma<1/2$ 严格成立（$\gamma=1/2$ 时第一个条件不趋于零），这就是 $\gamma<1/2$ 的最终消费位置。消费者：prop:normalized-excess-limit（第（4）步的极限机器）。

(d) `[推测]` 候选失败路线一：用"切测度分类"替代无反射性的推导，即先假设每个切测度都是定密度平面测度，回到 §2.2 的循环。`[推测]` 候选失败路线二：把振荡假设 $v_j\to0$ 放宽成 $v_j\le v$（只趋于一个小数），则 $\sigma$ 只满足近似无反射性，lem:planar-rigidity 需要 $\varepsilon$-近似版本，而这个近似版本的失败形式是 $\theta$ 的双侧界丢失，进而 $q$ 可能为零，与 lem:weak-compactness 的非零性冲突。`[推测]` 候选失败路线三：不假设 $\diam E_j\to\infty$（论文靠 $2^{K_j}\le\diam E_j$ 保证下界可用的半径范围），则 $\sigma$ 的下界只在有限半径内，而 lem:planar-rigidity 需要全局 $cr^n$ 对所有 $r$，失效。

### §5.5 第（2）步的后半：高度紧致性（04-height-compactness 两件套）

#### §5.5.1 lem:height-energy（`04-height-compactness.tex:31-255`）

(a) 原文：

> "Let $1\le n<d$, $0<\gamma<1$, and let $\mu_j$ be Radon measures on $\R^d$ with $0\in\supp\mu_j$. Suppose that, for fixed $G,c>0$, \[ \mu_j(B(x,r))\le Gr^n \quad(x\in\R^d, r>0),\qquad \mu_j(B(0,r))\ge cr^n \quad(0<r\le\diam\supp\mu_j), \] and $\diam\supp\mu_j\to\infty$. Let $u_j$ be real affine functions with \[ u_j(x)-u_j(y)=\langle e_j,x-y\rangle, \qquad |e_j|\le1, \qquad |u_j(0)|\le W. \]"

加上 eq:height-last-radius（$2^{-K_j}/\delta_j\to0$）、eq:height-dyadic-moments（$\int_{B(0,2^k)}\lvert u_j\rVert^2d\mu_j\le M\delta_j^22^{(n+2+2\gamma)k}$，$0\le k\le K_j$）、eq:height-small-oscillation（$\lvert\mathcal R_{\mu_j}(\phi)\rvert\le\delta_j^3\Lip(\phi)$），结论 eq:height-uniform-energy：

> " \int_{B(0,H)}|w_j|^2\,d\mu_j +\mathcal E_{\mu_j,B(0,H)}(w_j)\le C_H. "

其中 $w_j=u_j/\delta_j$，而能量定义在 `04-height-compactness.tex:16-21`：

> " \mathcal E_{\sigma,U}(f)=\iint_{U\times U}|f(x)-f(y)|^2|x-y|^{-n-1}\,d\sigma\,d\sigma "

(b) 我补的推导。这就是 §3 说的转折点所在。取 $\chi$：$\Lip(\chi)\le2/H$、在 $B(0,H)$ 上为 1、在 $B(0,3H/2)$ 外为 0（支撑在 $B(0,2H)$）；取最小的二进半径 $R\ge4H$，$D=B(0,R)$，$T=2^K$。中心化 $b=\int\chi^2u\,d\mu/\int\chi^2d\mu$，$U=u-b$，$\phi=\chi^2U$。则 $\phi$ 是紧支撑 Lipschitz 且 $\int\phi\,d\mu=0$，所以 eq:height-small-oscillation 可用。核心代数（eq:height-cutoff-identity）把配对转成能量：左边的双重积分正好等于 $\langle e,\mathcal R_\mu(\phi)\rangle$ 的两倍（符号与因子靠核 $K_n$ 的奇性与配对定义 eq:pairing-definition 对齐），于是得 eq:height-energy-reduction：

> " \mathcal E_{\mu,D}(\chi U)\le2|\langle e,\mathcal R_\mu(\phi)\rangle|+2|\mathrm{Ext}|+C\delta^2 "

右端第一项被振荡假设 $\delta^3\Lip(\phi)$ 控制（$\Lip(\phi)$ 由 $\chi$ 与 $U$ 的 Lipschitz 界给出）；第三项来自 eq:height-cutoff-error（$\le CGR\Lip(\chi)^2\int_DU^2d\mu\le C\delta^2$，用到 eq:height-near-row $\int_D\lvert x-y\rVert^{1-n}d\mu\le CGR$）。$\mathrm{Ext}$（外场项）分两支：可控部分用 eq:height-shell-first-moment $\int_{t\le\lvert y\rVert<2t}\lvert U\rVert d\mu\le C\delta t^{n+1+\gamma}$（来自 $e$ 的单位界与 $\mu$ 的生长），得 eq:height-controlled-tail $\le C\delta\sum t^{\gamma-1}\le C\delta$（这里用到 $\gamma<1$，这是 $\gamma<1$ 假设唯一的消费者）；不可控部分（超出 $K$ 世代）用截断尾 $T^{-1}$，得 eq:height-uncontrolled-tail $\le C(T^{-1}+T^{-2})\le CT^{-1}$。合并为 eq:height-exterior-bound $\lvert\mathrm{Ext}\rvert\le C(\delta^2+\delta T^{-1})$。于是未归一化能量界 eq:height-unnormalized-energy $\le C(\delta^3+\delta^2+\delta T^{-1})$，除以 $\delta^2$ 得 eq:height-normalized-bound $\le C(1+\delta+1/(\delta T))$。最后 $1/(\delta T)\to0$ 是 eq:height-last-radius 的消费位置。所以 $C_H$ 只依赖 $H,n,\gamma,G,c,M,W$。

(c) 理由：$\lvert e_j\rVert\le1$ 与 $\lvert u_j(0)\rVert\le W$ 是给归一化后的 $w_j$ 一个统一的斜率与截断账目（$w_j$ 的斜率 $\le1/\delta_j$ 发散，但能量估计里只用到 $e_j$ 的单位界配合 $\delta_j$ 的因子，这正是 §2.3 我丢 $C_{\rm R}$ 的位置）。$\gamma<1$（比别处的 $\gamma<1/2$ 弱）是因为这里只消费 $\sum t^{\gamma-1}$ 的收敛。$\delta_j^3$ 的三次方不是随意：在 $\mathcal E\le2\lvert\langle e,\mathcal R_\mu(\phi)\rangle\rvert+\dots$ 里 $\mathcal R_\mu(\phi)$ 的上界是 $\delta^3\Lip(\phi)$，归一化除以 $\delta^2$ 后要求 $\delta^3/\delta^2=\delta\to0$，所以三次是"$\delta^3$ 相对 $\delta^2$ 是高阶小"的最低要求。消费者：lem:moving-compactness（能量界作为输入）、prop:height-equation（$w_j=u_j/\delta_j$ 的力矩与配对识别）。

(d) `[推测]` 候选失败路线一：先归一化再估（§3 里的错序），eq:height-controlled-tail 的 $\delta$ 因子消失，得到 $\mathcal E(w)\le C\mathcal E(w)$ 型自反不等式，界为空。`[推测]` 候选失败路线二：不中心化（$b=0$），则 $\int\phi\,d\mu$ 非零，配对 $\mathcal R_\mu(\phi)$ 不受 eq:height-small-oscillation 控制，第一项失去 $\delta^3$ 界。`[推测]` 候选失败路线三：把 $R$ 取成 $H$ 的固定倍，并非最小二进半径，eq:height-uncontrolled-tail 的 $T^{-1}$ 换成非二进形式后与 dyadic moments 的指数不匹配。

#### §5.5.2 lem:moving-compactness（`04-height-compactness.tex:286-504`）

(a) 原文：

> "Suppose $\mu_j$ are Radon measures with a common global upper $n$-growth bound and a common lower bound $cr^n$ at every support point and every admissible radius. Suppose also that $\diam\supp\mu_j\to\infty$ and \[ \mu_j\longrightarrow\nu=q\,e_\#\mathcal L^n, \qquad q>0, \] against continuous compactly supported tests. Let $w_j^1,\ldots,w_j^s$ be finitely many real measurable functions. Assume that each belongs to $L^2$ on bounded balls and has integrable local fractional energy."

结论是 eq:height-three-measures：$\mu_j\restrict\Omega_H\to\nu\restrict\Omega_H$、$w_j^a\mu_j\to v^a\nu$、$\lvert w_j^a\rvert^2\mu_j\to\lvert v^a\rvert^2\nu$。

(b) 我补的推导。"三个测度同时收敛"是本引理的形式核心，也是它叫"moving measures"的原因：不仅测度在动，函数以及函数的平方测度也在动。区域选择 eq:height-projection-regions（`04-height-compactness.tex:267-274`）：$Q_H=(-(H+1),H+1)^n$，$\Omega_H=\pi^{-1}(Q_H)\cap B(0,(\sqrt n+1)(H+1))$，$\pi$ 是到 $L$ 的正交投影；选立方体，并非球是为了让胞元分割对齐，选 $\sqrt n+1$ 的额外半径是为了覆盖 $\pi^{-1}(Q_H)$ 的角部。eq:height-region-null-boundary 给 $\nu(\partial\Omega_H)=0$（$\nu$ 是平面上的 Lebesgue 型测度，边界是 $\H^n$ 零集），这保证弱收敛可以限制到 $\Omega_H$。细胞方差恒等式 eq:height-cell-variance：

> $\int_{C_D}\lvert w_j-m_{j,D}\rVert^2d\mu_j=\frac{1}{2\mu_j(C_D)}\iint_{C_D\times C_D}\lvert w_j(x)-w_j(y)\rVert^2\le C_nq^{-1}h\iint\frac{\lvert w_j(x)-w_j(y)\rVert^2}{\lvert x-y\rVert^{n+1}}$

第一个等号是均值的方差公式（精确代数），第二个不等号用 $\mu_j(C_D)\approx qh^n$（$h$ 为胞元边长）与胞元内 $\lvert x-y\rVert^{-n-1}\ge(\sqrt n\,h)^{-n-1}$ 的下界。这一步给出"$w_j$ 在其胞元均值附近的 $L^2$ 偏差 $\le Ch$"，于是 Poincaré 型：eq:height-partition-error $\int_{\Omega_H}\lvert w_j-P_k^jw_j\rVert^2d\mu_j\le C_Hh$。论文在此加了一句防止误读的话：

> "There is no factor counting the cells in this estimate"

意思是分区误差里不出现胞元个数：每个胞元的误差已带 $h$ 因子，求和时 $\sum_D\mu_j(C_D)=\mu_j(\Omega_H)$ 有界，所以直接得 $O(h)$。剩下的是分段常数 $P_k^jw_j$ 的对角论证：胞元质量 $\mu_j(C_D)\to\nu(C_D)=qh^n$（用 $\nu(\partial C_D)=0$）；同一胞元内支撑点距离 $\le(\sqrt n+2)h$；eq:height-continuous-approximation 用极化恒等式把 $\int w_j^a\psi\,d\mu_j\to\int v^a\psi\,d\nu$ 从对角情形推到全部三个测度。

(c) 理由：$s$ 有限是必需的（对角抽取对每个 $a$ 各做一次，无限族会破坏子列统一性）；$q>0$ 来自 $\nu\ne0$。$q^{-1}$ 在方差恒等式里出现，说明这一步用到极限测度的下界密度，而 $q$ 的双侧界 $c/(4^n\omega_n)\le q\le2^nG/\omega_n$（prop:flat-limit 的输出）正是它的来源。$\Omega_H$ 用 $H+1$（，并非 $H$）是给胞元边界留余地。消费者：prop:height-equation（需要 $v$ 作为 $w_j$ 的共同极限），以及 Lean 侧 Limits/ 目录（7,906 行）。

(d) `[推测]` 候选失败路线一：假设 $w_j$ 一致有界（$L^\infty$），则不需要能量界就能抽弱星极限，但我没有 $L^\infty$（$w_j$ 的斜率是 $\delta_j^{-1}$，发散）。`[推测]` 候选失败路线二：直接对 $w_j\mu_j$ 用 Banach--Alaoglu 在 $L^2(\nu)$ 单位球内抽极限，需要先有 $w_j$ 在 $L^2(\mu_j)$ 的一致界，而这正是 eq:height-uniform-energy 的第一项，顺序不能反。`[推测]` 候选失败路线三：用分数 Sobolev 紧嵌入（$H^{1/2}\hookrightarrow L^{2n/(n-1)}$），在无界域 $L$ 上需要全局版本，代价比胞元 Poincaré 大且会引入额外的维数限制。

### §5.6 第（3）步：分数刚性（05-fractional-rigidity 两件套）

#### §5.6.1 prop:height-equation（`05-fractional-rigidity.tex:110-363`）

(a) 原文：

> "Assume the hypotheses and conclusions of Lemmas~\ref{lem:height-energy} and~\ref{lem:moving-compactness} for a scalar height. We retain their notation and record the conditions used below. Let $\mu_j$ converge on compact tests to $\nu=q\H^n|_L$, where $q>0$ and $L$ is an $n$-plane through $0$. Here $\H^n|_L$ has Euclidean normalization, equal to Lebesgue measure in orthonormal coordinates on $L$. Let $u_j$ satisfy \eqref{eq:affine-source-height} with $|e_j|\le1$, let $w_j=u_j/\delta_j$, and let $v$ be the common limit given by Lemma~\ref{lem:moving-compactness}. Suppose $\delta_j>0$, $\delta_j\to0$, $K_j\to\infty$,"

其假设是 eq:height-source-moment（$\int_{B(0,2^k)}\lvert u_j\rVert^2d\mu_j\le M\delta_j^22^{k(n+2+2\gamma)}$，$0\le k\le K_j$，且 $\delta_j^{-1}2^{-K_j}\to0$）与 eq:height-source-oscillation：

> " |\mathcal R_{\mu_j}(\xi)| \le C(\Lip\xi+1)\delta_j^3. "

结论是 eq:limit-height-weight 与 eq:limit-fractional-equation：

> " \int_L |v(x)|(1+|x|)^{-n-2}\,d\H^n(x)<\infty. "

以及"for every compactly supported smooth complex function $g$ with $\int_{\R^n}g=0$"，

> " \int_{\R^n}v(x)\mathcal Lg(x)\,dx=0, \qquad \mathcal Lg(x)=\frac12\int_{\R^n} \frac{2g(x)-g(x+h)-g(x-h)}{|h|^{n+1}}\,dh. "

(b) 我补的推导。这一条是"把配对识别成分数方程"的桥。起点是 eq:normalized-height-pairing（`05-fractional-rigidity.tex:33-39`）：定义 $\mathcal B_{\rho,A}(w,\phi)$ 为"内部半双重积分 + 外部 $\iint_{A\times A^c}\phi(x)[w(x)k(x-y)-w(y)\{k(x-y)-k(-y)\}]d\rho\,d\rho$"，其中 $k(z)=\lvert z\rVert^{-n-1}$。然后 eq:height-riesz-identification 声明

> " \mathcal B_{\rho,A}(w,\phi)=\delta^{-1}e\cdot\mathcal R_\rho(\phi) "

即"配对除以 $\delta$ 等于加权分数双线性型"，这一步是把 lem:height-energy 里的代数恒等式在带外部修正的版本下重做一遍（外部项之所以长成 $k(x-y)-k(-y)$ 这种差形式，是为了让 $y$ 的远场展开的一阶项抵消，从而只需 $w$ 的加权可积性）。eq:height-diagonal-estimate 用 Cauchy--Schwarz 处理对角，误差为 $h^{1/2}$；eq:height-weighted-tail 与 eq:height-kernel-tail 分别控制 $w$ 的尾巴与核的尾巴。极限过程：对固定的 $g\in C_c^\infty$、$\int g=0$，取 $\phi\approx g$（在 $L$ 上）、$w=w_j$，让 $j\to\infty$；左边由 lem:moving-compactness 的三个测度收敛传到 $\int v\mathcal Lg$；右边由 eq:height-riesz-identification 变成 $\delta_j^{-1}e_j\cdot\mathcal R_{\mu_j}(\phi)$，而 eq:height-source-oscillation 给出 $\lvert\mathcal R_{\mu_j}(\phi)\rvert\le C(\Lip\phi+1)\delta_j^3$，除以 $\delta_j$ 后是 $O(\delta_j^2)\to0$。所以极限方程成立。eq:limit-height-weight 的证明用 eq:limiting-height-moments（$\le Ct^{n+2+2\gamma}$）与 eq:limiting-height-tail-bound（$\le CT^{\gamma-1}$，需 $\gamma<1$）：把 $\int\lvert v\rVert(1+\lvert x\rVert)^{-n-2}$ 分成球内（由力矩与 Hölder）与球外（由尾巴的 $T^{\gamma-1}$ 求和，$\gamma<1$ 保证可和）。技术难点是 collar 论证：$F_h$ 是 $\partial A\cup\partial B$ 的 $h$-邻域，用来吸收"$\mu_j$ 的限制与 $\nu$ 的限制边界不一致"产生的误差；eq:two-height-tail-errors 给出总误差 $C_\phi(T^{-1}+T^{\gamma-1}+\delta_j^{-1}2^{-K_j})$，其中第三项正是 $\delta_j^{-1}2^{-K_j}\to0$ 的消费位置。eq:compact-renormalized-height-equation 是中间形式，用 $c_j=\int\phi\,d\mu_j/\int\eta\,d\mu_j$ 做均值重整。$\lvert u_j(0)\rvert\le1+C\delta_j$ 是从 1-Lipschitz 加 $B(0,1)$ 的正质量推出的（说明 $W$ 可以取绝对常数）。

(c) 理由：$\gamma$ 在本条只要求 $<1$（尾巴求和），而 $<1/2$ 的强度来自上游 lem:fixed-plane-moments。$\delta_j^{-1}2^{-K_j}\to0$ 与 $2^{-K_j}/\delta_j\to0$ 是两个相反方向的条件，前者在本条（外场尾）、后者在 lem:height-energy（截断尾），同时成立要求 $K_j$ 落在窗口 $\log_2\delta_j^{-1}<K_j<\delta_j^{-2}$ 型的区间里，schedule $K_j=2j+3$、$\delta_j=2^{-j}$ 恰好满足（$2^{-K_j}/\delta_j=2^{-j-3}$、$\delta_j^{-1}2^{-K_j}=2^{-j-3}$ 都对）。$\int g=0$ 的必要性：$\mathcal L$  annihilate 常数（模常数的解释，见 `05-fractional-rigidity.tex:11-13` 对 Dipierro--Savin--Valdinoci 的比较），所以方程只能在零均值测试的商空间里陈述。$q>0$ 保证 $\mathcal B$ 里的除数合法。消费者：lem:fractional-rigidity（把方程转成仿射）。

(d) `[推测]` 候选失败路线一：直接把 $w_j$ 的极限当作 $\mathcal L$-调和函数并使用均值不等式，需要 $v$ 的局部有界性，而 lem:moving-compactness 只给 $L^2_{\rm loc}$；$L^2$ 到 $L^\infty$ 的提升在分数情形需要 De Giorgi 型论证，那是最大值原理的替身，回到 §2.3 的障碍。`[推测]` 候选失败路线二：省掉 collar 论证，让 $\mu_j$ 的限制直接收敛，则边界项 $F_h$ 的误差无法控制，$\int v\mathcal Lg=0$ 里会留下一个非零边界分布。`[推测]` 候选失败路线三：把加权尾 $(1+\lvert x\rVert)^{-n-2}$ 换成 $(1+\lvert x\rVert)^{-n-1}$，则与 $k(z)=\lvert z\rVert^{-n-1}$ 的卷积边缘发散，eq:height-kernel-tail 失去可和性；$n+2$ 这个指数是外部修正 $k(x-y)-k(-y)$ 的一阶消去给出的最小要求。

#### §5.6.2 lem:fractional-rigidity（`05-fractional-rigidity.tex:381-611`）

(a) 原文：

> "Let $n\ge1$, and let $v:\R^n\to\R$ be measurable with \[ \int_{\R^n}|v(x)|(1+|x|)^{-n-2}\,dx<\infty. \] Suppose that, for every $g\in C_c^\infty(\R^n;\mathbb C)$ with $\int g=0$, \[ \int_{\R^n}v(x)\mathcal Lg(x)\,dx=0. \] Then there are $b\in\R$ and a real linear functional $\ell:\R^n\to\R$ such that $v(x)=b+\ell(x)$ almost everywhere. If $v$ is also essentially bounded, then $\ell=0$."

对应的 Schwartz 版本 eq:rigidity-fractional-operator 在 `05-fractional-rigidity.tex:372-376`，带 $-\frac12$ 的符号约定。

(b) 我补的推导。纯 Fourier 论证，我把七步补全。第一步：把测试类从 $C_c^\infty$ 零均值扩到 Schwartz 空间 $\mathcal S$ 的适当商，用到 seminorm $p(g)=\sup(1+\lvert y\rVert)^{n+3}(\lvert g\rVert+\lVert D^2g\rVert)$ 与 $M_1(g)=\int\lvert y\rVert\lvert g\rVert$，加权可积假设保证配对绝对收敛。第二步：eq:rigidity-schwartz-decay 给出 $\lvert\mathcal Lg(x)\rvert\le C_np(g)(1+\lvert x\rVert)^{-n-2}$；证明分近 / 远：近部分在 $R=r/2$ 处切开，用 $\int_{\lvert h\rVert<R}\lvert h\rVert^{1-n}dh$ 得 $r^{-n-2}$（这里 $\lvert h\rVert^{1-n}$ 来自二阶差分 $\lvert g(x+h)-g(x-h)-2g(x)+\dots\rvert$ 的 Taylor 余项 $D^2g\cdot\lvert h\rVert^2$ 除以 $\lvert h\rVert^{n+1}$）；远部分 eq:rigidity-far-correction 用 $\int g=0$ 把 $\mathcal Lg$ 写成核的差。第三步：构造截断 $g_j=\chi(\cdot/j)g-(\int\chi(\cdot/j)g)\rho$（$\rho$ 是固定的零均值 Schwartz 校正），使 $g_j$ 仍在允许的测试类内且收敛到 $g$；于是方程对一切 $g\in\mathcal S$ 成立（分布意义）。第四步：$\mathcal L$ 是 Fourier 乘子。eq:rigidity-fourier-multiplier 声明 $\widehat{\mathcal Lg}(\xi)=c_n\lvert\xi\rvert\hat g(\xi)$，其中

> " a_n(\xi)=\int(1-\cos(2\pi\xi\cdot h))|h|^{-n-1}\,dh=c_n|\xi|, \qquad c_n=a_n(e_1)>0 "

正性与 1-齐次性：$a_n$ 是径向的（对 $\xi$ 旋转不变）且 1-齐次（变量替换 $h\mapsto h/\lvert\xi\rVert$），所以 $a_n(\xi)=c_n\lvert\xi\rVert$；$c_n>0$ 的被积函数非负且不恒零，论文另外给了一个直接见证：取 $h=\xi/(2\lvert\xi\rVert^2)$ 时 $1-\cos(2\pi\xi\cdot h)=1-\cos\pi=2>0$。第五步：由 $\int v\mathcal Lg=0$ 对所有 $g$ 成立得 $\langle T_v,\mathcal Lg\rangle=0$，即 $\mathcal F^{-1}[\hat T_v\cdot c_n\lvert\xi\rVert]=0$ 在分布意义。因 $\lvert\xi\rVert$ 只在 $\xi=0$ 处为零，$S=\mathcal F^{-1}T_v$（准确说 $\hat T_v$ 除以 $\lvert\xi\rVert$ 后的对象）的支撑为 $\{0\}$。第六步：支撑为单点的分布是有限阶的，eq:rigidity-finite-order 给出存在 $N$ 使 $T_v$ 是次数 $\le N$ 多项式的 Fourier 变换的导数组合；Taylor jet 论证（$\eta_\varepsilon$ 与幂次 $\varepsilon^{N+1-\lvert\alpha\rVert}$ 的估计）确定 $P(x)=\sum_{\lvert\alpha\rVert\le N}c_\alpha(-2\pi ix)^\alpha$。第七步：用加权可积性砍掉高阶项：次数 $k\ge2$ 的多项式会让 $\int_{R_0}^\infty r^{k-3}\,dr$ 发散（`05-fractional-rigidity.tex:603`；论文加注"(For $n=1$, one uses either of the two rays.)"，因为 $n=1$ 时要用单侧射线上的积分来检测次数）。于是 $v=b+\ell$ a.e.，$k\le1$。最后若 $v\in L^\infty$，则线性部分 $\ell$ 有界，故 $\ell=0$。

(c) 理由：$n\ge1$ 是 $\mathcal L$ 的核 $\lvert h\rVert^{-n-1}$ 在原点的可积性下限（$n=0$ 无意义）。权重指数 $n+2$ 与第七步的 $r^{k-3}$ 直接对应：$(1+r)^{-n-2}\cdot r^{n-1}$（球面测度 $r^{n-1}$）乘 $r^k$ 得 $r^{k-3}$，所以 $k\ge2$ 发散、$k\le1$ 收敛，即 $n+2$ 是"恰好允许仿射、排除二次"的唯一指数。这是我在 §7.7 的台账里标为"改动即断"的一条。$c_n>0$ 是核空间维数论证的前提（若 $c_n=0$ 则 $\mathcal L$ 是零算子，方程无信息）。测试类的复值性（$\mathbb C$）是为了 Fourier 变换的代数便利，实值版本在 `05-fractional-rigidity.tex:613-615` 被声明为同样成立（"same conclusion for real mean-zero tests"）。消费者：lem:planar-rigidity（第一次，有界情形给常数密度）、prop:height-equation 之后（第二次，加权情形识别归一化高度）；`01-background.tex:362-369` 声明这两次无循环。Lean 侧对应 Rigidity/ 的 57 文件 / 4,592 行，名字含 `FractionalFourierMultiplier`、`FractionalRadialSymbol`、`PointSupportedFiniteJet`、`TemperedFiniteOrderBound`、`polynomial_tail_has_degree_one_representative`。

(d) `[推测]` 候选失败路线一：用唯一延拓 / 半空间最大值原理替代 Fourier，则需 $v$ 连续，而 $v$ 只是 $L^2_{\rm loc}$ 的等价类。`[推测]` 候选失败路线二：假设 $v$ 有多项式增长的逐点界，并非加权可积，则第七步的 $r^{k-3}$ 计数不再给排除，$\mathcal L$-调和的多项式增长解空间会包含高次谐波型对象（在分数情形它们并非解，但我无法在不使用加权可积的条件下证明这点）。`[推测]` 候选失败路线三：把 $\mathcal L$ 换成 $(-\Delta)^{s}$，$s\ne1/2$，则符号为 $\lvert\xi\rVert^{2s}$，核空间仍是仿射，但第七步的加权指数要从 $n+2$ 改成 $n+1+2s$，与本链条里核 $k(z)=\lvert z\rVert^{-n-1}$ 产生的自然权重不一致，eq:limit-height-weight 无法直接给出所需可积性。

### §5.7 第（4）步：excess 传播（06-excess-propagation 四件套）

这一节的前言（`06-excess-propagation.tex:13-24`）固定 $1\le n<d$、$c,G$、$D_0$，并列出三个假设 eq:prop-upper、eq:prop-lower、eq:prop-riesz，其中 eq:prop-riesz 特别注明"includes existence of the indicated $L^2$ output"，即输出侧的 $L^2$ 可积性也在假设内（这一点与 Lean 侧 `RieszL2BoundedWithConstant` 的合取形式完全对应，见 §7.3）。

#### §5.7.1 lem:affine-polarization（`06-excess-propagation.tex:36-79`）

(a) 原文：

> "Let $\mu_j$ and $\nu$ be finite measures on $\R^d$, all concentrated on one bounded set, and suppose that $\mu_j$ converges weakly to $\nu$. Let $w_j\in L^2(\mu_j)$ and $f\in L^2(\nu)$. Suppose that \[ \int w_j^2\,d\mu_j\longrightarrow\int f^2\,d\nu \] and, for every compactly supported Lipschitz function $\psi$, \[ \int w_j\psi\,d\mu_j\longrightarrow\int f\psi\,d\nu. \] If $v:\R^d\to\R$ is globally Lipschitz and $f=v$ almost everywhere for $\nu$, then \[ \int|w_j-v|^2\,d\mu_j\longrightarrow0. \]"

(b) 我补的推导。这是"弱收敛 + 范数收敛 $\Rightarrow$ 强收敛"的极化版本，测度也在动。展开 $\int\lvert w_j-v\rVert^2d\mu_j=\int w_j^2d\mu_j-2\int w_jv\,d\mu_j+\int v^2d\mu_j$。第一项由假设收敛到 $\int f^2d\nu=\int v^2d\nu$；第二项需要 $v$ 作为测试可用，$v$ 只是全局 Lipschitz ，并非紧支撑，所以要用截断 $v_R=\chi_Rv$ 做逼近，这里"全部集中在一个有界集上"的假设起作用：$w_j$ 的 $L^2$ 有界（由范数收敛）加上有界支撑，让尾部 $\int_{\lvert x\rVert>R}w_j^2d\mu_j$ 对大 $R$ 一致小；第三项由弱收敛直接给 $\int v^2d\mu_j\to\int v^2d\nu$（$v^2$ 连续但在有界集上被截断控制）。三项合并即得。论文另外给出 ambient 仿射表示 eq:ambient-affine-representative：$v(x)=b+ML^*x$，即 $\R^d$ 上的全局 Lipschitz 仿射函数可以写成"到 $n$ 平面 $L$ 的正交投影后再线性"的形式，$L^*$ 是 $L$ 的参数化 maps 的伴随。

(c) 理由：假设里"同一个有界集"是必需的，否则 $f\in L^2(\nu)$ 与 $w_j\in L^2(\mu_j)$ 的范数收敛不足以给出一致可积性（质量可以从紧集逃逸到有界集外，$\int w_j^2d\mu_j$ 的极限会丢质量）。消费者：lem:normal-affine-planes（那里 $f=v$ 由 prop:height-equation 的仿射极限给出），进而 thm:excess-propagation。这条引理是本节唯一"纯测度论"的部件，成本极低但位置关键：它把"几乎处处仿射"升级为"$L^2$ 意义上仿射"，而 $b_{\mu_j}$ 的定义是 sup 型的、$e_{\mu_j}$ 是 $L^2$ 型的，只有 $L^2$ 版本能被 excess 使用。

(d) `[推测]` 候选失败路线一：去掉共同有界支撑假设，则第二项 $\int w_jv\,d\mu_j$ 的截断误差没有一致界（$v$ 有线性增长），结论失效；补救办法是要求 $v$ 有界，但那正是"仿射部分为零"的额外信息，链条拿不到。`[推测]` 候选失败路线二：只用逐点 a.e. 收敛 $w_j\to v$（沿子列的表示），则无法在变动的测度上写 a.e.，这正是 lem:moving-compactness 用三个测度收敛回避的问题。`[推测]` 候选失败路线三：把 $L^2$ 换成 $L^1$，极化恒等式不再适用（$\mathcal L^1$ 没有内积结构）。

#### §5.7.2 lem:normal-affine-planes（`06-excess-propagation.tex:111-174`）

(a) 原文：

> "Let $\mu_j$ be measures, let the frames satisfy \eqref{eq:complete-normal-splitting}, and suppose that $\delta_j>0$ tends to zero. Assume \[ \sup_j\int\|w_j\|^2\,d\mu_j<\infty \] and that, for one fixed affine map $v(x)=b+Bx$ from $\R^d$ to $\R^{q_0}$, each function $\|w_j-v\|^2$ is integrable and \[ \int\|w_j-v\|^2\,d\mu_j\longrightarrow0. \] Then there are affine $n$-planes $S'_j$ such that \[ \int\left(\frac{\dist(x,S'_j)}{\delta_j}\right)^2 d\mu_j(x)\longrightarrow0. \]"

(b) 我补的推导。$q_0=d-n$ 是余维。这里的物理量关系是 eq:physical-normal-error：$\lvert x-P_jx\rVert=\delta_j\lVert w_j(x)\rVert$，其中 $P_jx=a_j+L_jL_j^*(x-a_j)$ 是到当前近似平面的投影、$w_j(x)=\delta_j^{-1}N_j^*(x-a_j)$ 是归一化法向坐标（eq:normalized-vector-height）。有了 $\int\lVert w_j-v\rVert^2d\mu_j\to0$，我想构造真实平面 $S'_j$ 使 $\dist(\cdot,S'_j)/\delta_j$ 在 $L^2$ 意义下消失。做法是把仿射部分 $v(x)=b+Bx$ 的斜率 $B$ 吸进平面方向：设 $S'_j=\{a_j+L_jt+\delta_jN_j(c_j+A_j't):t\in\R^n\}$（eq:genuine-tilted-plane），其中 $A_j'$ 是 $B$ 的线性部分在 $L$ 上的限制、$c_j$ 吸收常数项。eq:affine-projection-replacement 给替换误差 $\lVert B\rVert^2\delta_j^2\int\lVert w_j\rVert^2$，由 $\sup_j\int\lVert w_j\rVert^2<\infty$ 与 $\delta_j\to0$ 这一项趋于零。关键的一步是"$S'_j$ 真的是 $n$ 维仿射平面"：需要 $t\mapsto L_jt+\delta_jN_jA_j't$ 单射，而这由 $L_j^*(L_j+\delta_jN_jA_j')=I_{\R^n}$ 给出（因为 $L_j^*L_j=I$ 且 $L_j^*N_j=0$），单射的 $n$ 维线性映射的像就是 $n$ 维子空间。论文在这里特意说"This conclusion needs no bound on its slope"，也就是不需要 $A_j'$ 有界，只要 $L_j^*L_j=I$ 与 $\delta_j$ 小即可（严格说单射性来自 $\delta_j$ 充分小时的 Neumann 型论证或者分块矩阵的行列式，但因为 $\delta_j\to0$，最终 $j$ 都够小）。eq:tilted-plane-distance-limit 给出输出。另外一句重要的话："No convergence of the normal frames $N_j$ is required."，即不需要法向框架 $N_j$ 收敛。

(c) 理由：$\sup_j\int\lVert w_j\rVert^2d\mu_j<\infty$ 是 lem:height-energy 的 eq:height-uniform-energy 的第一项（$L^2$ 部分）的输入，所以这条引理是能量有界性的直接消费者；$\delta_j\to0$ 是投影替换项 $\lVert B\rVert^2\delta_j^2(\cdot)\to0$ 的除数。$q_0=d-n$ 是法向坐标个数，也是 $v$ 的值域维数，与 def:flatness 里的 $n$ 平面编码一致（Lean 侧 `bilateralBeta` 用 `AffineSubspace ℝ (Ambient d)` 加 `IsAffineNPlane n`）。消费者：prop:normalized-excess-limit（把 $b_{\mu_j}(0,r)\to0$ 写出来）与 thm:excess-propagation。

(d) `[推测]` 候选失败路线一：若坚持用原始平面 $L_j$（不倾斜），则 $\dist(x,L_j)/\delta_j$ 的极限是 $\lVert Bx+b\rVert$ ，并非零，$b_{\mu_j}$ 型结论只能到"近似平坦到 $\delta_j$ 倍的非零偏差"，无法给出 $<\varepsilon$。`[推测]` 候选失败路线二：先证 $N_j$ 收敛（取子列）再重构平面，看似更直观，但 $N_j$ 的收敛需要对切平面的额外紧致性论证，而且当 $\mu_j$ 的支撑维数退化时会失败；论文用 $L_j^*$ 的代数恒等式绕开了它，我一开始写的版本正是走 $N_j$ 收敛这条，被一个"法向框架可能在极限处旋转"的技术麻烦卡住。`[推测]` 候选失败路线三：把 $v$ 允许为一般的局部 Lipschitz 函数（非仿射），则 $S'_j$ 不再是平面，是曲面，$b$ 的定义（对平面的 sup 偏差）不适用。

#### §5.7.3 prop:normalized-excess-limit（`06-excess-propagation.tex:183-310`）

(a) 原文：

> "Fix $0<\gamma<1/2$. Let $\mu_j$ satisfy \eqref{eq:prop-upper}--\eqref{eq:prop-riesz} with the same constants, and suppose that $0\in\supp\mu_j$. Let $\delta_j>0$ and $K_j\in\mathbb N$ satisfy \[ \delta_j\to0,\qquad K_j\to\infty,\qquad \delta_j2^{\gamma K_j}\to0,\qquad \delta_j^{-1}2^{-K_j}\to0. \] Assume that $2^{K_j}\le\diam(\supp\mu_j)$ and \[ e_{\mu_j}(0,2^\ell)\le\delta_j2^{\gamma\ell} \qquad(0\le\ell\le K_j). \] Put $A_j=8\,2^{K_j}$. Suppose, for every compactly supported"

后续是 eq:sequential-cubic-oscillation（$\lvert\mathcal R_{\mu_j}(\varphi)\rvert\le\delta_j^3$），结论 eq:sequential-excess-conclusion：$e_{\mu_j}(0,r)/\delta_j\to0$ 且 $b_{\mu_j}(0,r)\to0$（$r$ 固定），另有 eq:prop-fixed-plane-moments 里的 $C_*$。

(b) 我补的推导。这是第（2）步与第（3）步的组装。顺序：由 prop:flat-limit 得 $\mu_j\rightharpoonup q(L_\infty)_\#\mathcal L^n$（$\nu=q\H^n\restrict L_\infty$）；由 lem:fixed-plane-moments 把 eq:sequential-horizon-excess 转成 dyadic 力矩界（eq:prop-fixed-plane-moments，常数 $C_*$）；取法向坐标 $w_j^a=\delta_j^{-1}\langle N_j^ae_j,\cdot\rangle$（$a=1,\dots,q_0$），验证 lem:height-energy 的全部假设（力矩来自上一步、振荡来自 eq:sequential-cubic-oscillation、$\diam\to\infty$ 来自 $2^{K_j}\le\diam\supp\mu_j$ 且 $K_j\to\infty$），得三个量（$L^2$ 与能量）一致有界；由 lem:moving-compactness 抽 $v^a$ 并得三个测度收敛；由 prop:height-equation 得 $\int v\mathcal Lg=0$ 与加权可积；由 lem:fractional-rigidity 得 $v^a=b^a+\ell^a$ a.e.；由 lem:affine-polarization 得 $\int\lvert w_j-v\rVert^2d\mu_j\to0$；由 lem:normal-affine-planes 得 $S'_j$ 使 $\int(\dist(x,S'_j)/\delta_j)^2d\mu_j\to0$。最后一步把 $L^2$ 结论升级成 $e$ 与 $b$：$e_{\mu_j}(0,r)/\delta_j\to0$ 是直接的（$e$ 的定义是同一个 $L^2$ 量的 inf 归一化）；$b_{\mu_j}(0,r)\to0$ 需要 sup 型控制，这里用到 $S'_j$ 与 $\supp\mu_j$ 的相互逼近，而论文注明"this step requires no assertion about mass on the sphere $\partial B(0,r)$"，也就是说这一步之所以能避开球面质量问题，是因为 $b$ 的两个 sup 项都可以用 $L^2$ 小 + 全局生长 + 支撑收敛（lem:weak-compactness 的 (i)(ii)）联合给出，而不需要 $\mu_j(\partial B)=0$。

(c) 理由：四个趋于零 / 无穷的排列（$\delta_j\to0$、$K_j\to\infty$、$\delta_j2^{\gamma K_j}\to0$、$\delta_j^{-1}2^{-K_j}\to0$）每一个都有指定消费者：第二个是 $\diam\to\infty$ 的来源，第三个是 lem:fixed-plane-moments 的门槛 $\kappa$ 要求，第四个是 prop:height-equation 的外场尾。$A_j=8\cdot2^{K_j}$ 的 8 是给 eq:sequential-cubic-oscillation 的测试支撑留覆盖余量（要覆盖 $B(0,2^{K_j})$ 与它的邻域）。$\gamma<1/2$ 由上游锁定。消费者：thm:excess-propagation（唯一）。

(d) `[推测]` 候选失败路线一：试图在本条直接给出 $b_{\mu_j}(0,r)\to0$ 的**速率**（例如 $O(\delta_j^\alpha)$），则需要 $v$ 的仿射部分对 $\delta_j$ 的显式依赖，而 lem:fractional-rigidity 的结论是纯存在的（分布意义 + 支撑为点），无速率。`[推测]` 候选失败路线二：把四个条件压缩成两个（例如去掉 $\delta_j^{-1}2^{-K_j}\to0$，只留 $\delta_j2^{\gamma K_j}\to0$），则 prop:height-equation 的尾巴误差 $C_\phi(T^{-1}+T^{\gamma-1}+\delta_j^{-1}2^{-K_j})$ 中第三项不消失，$\int v\mathcal Lg=0$ 得证不出。`[推测]` 候选失败路线三：用对角抽取一次性处理所有 $r$（，并非固定 $r$），会需要子列依赖于 $r$ 的可数集合，而 thm:excess-propagation 的反证里 $r$ 是要随 $\sigma$ 重标度变化的，可数对角化不能覆盖。

#### §5.7.4 thm:excess-propagation（`06-excess-propagation.tex:318-421`）

(a) 原文：

> "Fix $1\le n<d$, $c,G>0$, $D_0\ge0$, $0<\gamma<1/2$, and $\varepsilon>0$. For every integer $J_0\ge0$, there is an integer $J\ge J_0$, depending only on these fixed data, with the following property. Set \[ \delta=2^{-J},\qquad K=2J+3,\qquad A=8\,2^K. \] Let $\mu$ satisfy \eqref{eq:prop-upper}--\eqref{eq:prop-riesz}, let $a\in\supp\mu$, and let $r>0$. Assume \[ 2^Kr\le\diam(\supp\mu),\qquad e_\mu(a,2^\ell r)\le\delta2^{\gamma\ell} \quad(0\le\ell\le K), \] and assume \[ |\mathcal R_\mu(\varphi)|\le\delta^3r^n \]"

对 $\Lip(\varphi)\le r^{-1}$、$\supp\varphi\subset B(a,Ar)$、$\int\varphi\,d\mu=0$，结论

> " e_\mu(a,r/2)\le\delta, \qquad b_\mu(a,r/2)<\varepsilon. "

并附三句：

> "Equivalently, the oscillation hypothesis can be stated with $\Lip(\varphi)\le1$ and threshold $\delta^3r^{n+1}$. The constants $J,\delta,K,A$ are chosen before the measure, center, and radius. The test radius $Ar$ need not be admissible."

(b) 我补的推导。证明是反证 + prop:normalized-excess-limit。若结论对一切 $J\ge J_0$ 都失败，则可取 $\delta_j=2^{-(j+J_0)}$、$K_j=2(j+J_0)+3$，构造反例序列 $\mu_j$（配重标度使中心为 0、尺度为 1），它满足 eq:sequential-horizon-schedule 的四个条件（$2^{K_j}\le\diam$ 来自 eq:prop-admissible-horizon），于是 prop:normalized-excess-limit 给 $e_{\mu_j}(0,1/2)/\delta_j\to0$ 与 $b_{\mu_j}(0,1/2)\to0$，与"反例"要求（$e_\mu(a,r/2)>\delta$ 或 $b_\mu(a,r/2)\ge\varepsilon$）矛盾。重标度协变性：$\sigma=r^{-n}(T_{a,r})_\#\mu$，则 $e_\sigma(0,\rho)=e_\mu(a,\rho r)$（eq:prop-flatness-covariance），而配对按 $\mathcal R_\sigma(\psi)=r^{-n}\mathcal R_\mu(\varphi)$ 变换（$\varphi(x)=\psi((x-a)/r)$），这就是为什么阈值写成 $\delta^3r^n$ 配 $\Lip(\varphi)\le r^{-1}$；论文给出等价形式"threshold $\delta^3r^{n+1}$ 配 $\Lip\le1$"，两者互换靠 $\Lip$ 的量纲 $1/$长度。$\delta=2^{-J}$、$K=2J+3$、$A=8\cdot2^K$ 的关系是：$K=2J+3$ 保证 $\delta2^{\gamma K}=2^{-J}\cdot2^{(2J+3)/4}=2^{-J/2+3/4}\to0$（$\gamma=1/4$）以及 $\delta^{-1}2^{-K}=2^{-J-3}\to0$；$A=8\cdot2^K$ 与 eq:prop-admissible-horizon $2^Kr\le\diam(\supp\mu)$ 一起保证下界在所需范围内可用，且 $A$ 覆盖测试所需的 $8$ 倍余量。$J\ge J_0$ 的任意性是给第（5）步的"多尺度链"留自由度：prop:beta-packing 要在同一个 $\mu$ 上沿链条 $r_j=H2^{-j}\ell(S)$ 反复应用本定理，$J_0$ 控制起始深度。"The test radius $Ar$ need not be admissible"的实现靠 eq:prop-riesz 与全局 growth $G$（超出 $D_E$ 的部分用 lem:global-growth 的球外推广）。

(c) 理由：$\varepsilon>0$ 是本定理的输出平坦度，$J$ 依赖它（经由 prop:normalized-excess-limit 内部的紧致性）。$D_0\ge0$ 允许零。$\gamma\in(0,1/2)$ 是自由参数但在 `06-excess-propagation.tex:423` 立刻被固定："We henceforth fix $\gamma=1/4$."，其作用是给第（5）步提供指数 $\delta2^{i/4}$（见 §5.8.2 的 eq:seed-initial-excess）。消费者：prop:beta-packing（唯一）。

(d) `[推测]` 候选失败路线一：把 $J$ 换成显式可计算的数（比如给出 $J$ 对 $\varepsilon$ 的原始递归界），则本定理的紧致性证明结构（反证 + 序列）不允许，任何显式化尝试都断在 prop:flat-limit 的子列抽取；这也是 §7 里 Lean 侧用 `badBudgetChartConstant` 原始递归塔来封装的原因。`[推测]` 候选失败路线二：把结论加强为 $e_\mu(a,r/2)\le\delta$ 且 $b_\mu(a,r/2)<\varepsilon$ 同时带 $r/2$ 的一个更小因子（例如 $r/4$），则需要 $\diam$ 假设加倍（$2^{K+1}r\le\diam$），在第（5）步的链上会消耗额外的世代。`[推测]` 候选失败路线三：不设 $2^Kr\le\diam(\supp\mu)$ 而只设 $r\le D_E/2$，则跨 $K$ 世代的下界 eq:prop-lower 在中途失效（超过 $D_E$ 后没有 $cr^n$ 型下界），prop:flat-limit 的 $\sigma$ 下界无从谈起。

### §5.8 第（5）步：打包与端点（07-packing-endpoint 三件套）

本节开头（`07-packing-endpoint.tex:15-18`）固定 $H\ge4(C_0+1)$ 并写 $\beta_H(Q)=b_\mu(z_Q,H\ell(Q))$，也就是把第（1）步的双边平坦量重新命名为 $\beta$，这是全文里唯一一次让 $\beta$ 与 $b$ 同义。

#### §5.8.1 lem:seed-charging（`07-packing-endpoint.tex:28-78`）

(a) 原文：

> "Let $R\in\mathcal D$ and let $\mathcal F$ be a finite family of subcubes of $R$. For each $Q\in\mathcal F$, choose a cube $S(Q)\subset Q$ such that, for fixed $N\in\mathbb N$ and $M\geq1$, \[ k(Q)\leq k(S(Q))\leq k(Q)+N, \qquad \mu(Q)\leq M\mu(S(Q)). \] Let $\mathcal O\subset\mathcal D(R)$ satisfy $\sum_{T\in\mathcal O}\mu(T)\leq K\mu(R)$. Suppose that whenever $Q,Q'\in\mathcal F$ satisfy \[ k(S(Q))<k(Q'), \qquad Q'\subset S(Q), \] there is a cube $T\in\mathcal O$ with \[ k(S(Q))\leq k(T)<k(Q'), \qquad Q'\subset T. \]"

结论（我读到的形式）是 $\sum_{Q\in\mathcal F}\mu(Q)\le M(N+1)(1+K)\mu(R)$。

(b) 我补的推导。这是一个纯组合的质量记账引理，没有任何分析。$k(\cdot)$ 是世代编号。对每个 $Q\in\mathcal F$，把它的"质量债务"记到 $S(Q)$ 上：由 $\mu(Q)\le M\mu(S(Q))$，$\sum_Q\mu(Q)\le M\sum_Q\mu(S(Q))$。现在按 $S$ 分组：固定 $S$，考虑 $\{Q\in\mathcal F:S(Q)=S\}$；这些 $Q$ 都是 $S$ 的祖先、世代差不超过 $N$（$k(Q)\le k(S)\le k(Q)+N$），所以同组至多 $N+1$ 个（每世代至多一个祖先），贡献 $\le M(N+1)\mu(S)$。剩下的问题是同一个 $S$ 会不会被不同分支的后代 $Q'$ 嵌套进来造成重复计数：假设里的 charge 条件正是为此而设。若 $Q'\subset S(Q)$ 且 $k(Q')>k(S(Q))$（即 $Q'$ 真在 $S(Q)$ 内部且比它细），则存在 $T\in\mathcal O$ 夹在中间（$k(S(Q))\le k(T)<k(Q')$，$Q'\subset T$），于是 $Q'$ 这一支的重复被 $\mathcal O$ 的 Carleson 界 $K$ 吸收。做法是把 $\mathcal F$ 按"最外层"排序逐层剥离：外层贡献 $\le M(N+1)$ 乘 $\mu(R)$ 的倍数，内层被 $\mathcal O$ 覆盖的部分用 $\sum_{T\in\mathcal O}\mu(T)\le K\mu(R)$，合并成 $M(N+1)(1+K)\mu(R)$。论文用的语言是"分组按世代、每组至多 $N+1$ 个、电荷区间互不相交"，其中"区间"就是把 $[k(S(Q)),k(Q'))$ 当成数轴上的区间，条件是这些区间除被 $\mathcal O$ 覆盖的部分外不重叠。

(c) 理由：$N$ 来自 prop:flat-seeds 的 $N_{\rm F}$（种子深度），$M$ 来自 eq:seed-mass-comparison（$M\le C(d,n,C_{\rm AD})2^{nN}$，见 §5.8.2），$K$ 是振荡例外族 $\mathcal O$ 的 Carleson 常数 $C_{\rm o}$。三个数的乘积 $M(N+1)(1+K)$ 就是最终 $C_{H,\varepsilon}$ 的主要构成，$K$ 里带 $\delta^{-6}$（来自 prop:oscillation-packing 的 $v^{-2}$ 与 $v=\delta^3/2$），所以打包常数的爆炸主要来自 $K$ ，并非 $N$。$H\ge4(C_0+1)$ 在本条不出现（只在 $\beta_H$ 的定义与后续尺度比较里用），说明这条引理是尺度无关的纯组合。消费者：prop:beta-packing（唯一）。

(d) `[推测]` 候选失败路线一：去掉 $k(Q)\le k(S(Q))$（即允许种子比 $Q$ 粗），则"同组至多 $N+1$"变成"同组可任意多"，界失效；这是 prop:flat-seeds 结论里 $P\subset Q$（真后代）不可省的原因。`[推测]` 候选失败路线二：把 charge 条件改成"$Q'\subset S(Q)$ 时直接排除 $Q'$"，即假设种子互不嵌套，则 $\mathcal F$ 会空掉太多、无法覆盖所有非平坦立方体，Carleson 结论的完备性丢失。`[推测]` 候选失败路线三：用 Vitali 型选取（每分支挑一个最大者）替代按世代分组，会把 $(N+1)$ 换成指数级因子，因为深度 $N$ 的分支数可以是指数的。

#### §5.8.2 prop:beta-packing（`07-packing-endpoint.tex:82-225`）

(a) 原文：

> "For each $H\geq4(C_0+1)$ and $\varepsilon>0$, there is a constant $C_{H,\varepsilon}<\infty$, depending only on $d,n,C_{\rm AD},C_{\rm R},H,\varepsilon$, such that \[ \sum_{\substack{Q\subset R\\\beta_H(Q)\geq\varepsilon}}\mu(Q) \leq C_{H,\varepsilon}\mu(R) \qquad(R\in\mathcal D). \]"

(b) 我补的推导。这是全文定量的汇合点，参数在 `07-packing-endpoint.tex:94` 起被一次性钉死：对 $\gamma=1/4$ 与输出容差 $\varepsilon$ 应用 thm:excess-propagation，得 $\delta=2^{-j_*}$、$K_*=2j_*+3$、$A_*=8\cdot2^{K_*}$。然后依次选：$A_{\rm f}>H2^{K_*}+2C_0+1$（种子球放大率要吞下整条 $K_*$ 尺度的链）；$0<\alpha<\min\{\varepsilon H/4,\ \delta H/(2\sqrt{G+1})\}$（种子平坦度容差，第一个分量保证后续 $b$ 不超过 $\varepsilon$，第二个保证初始 excess 被 $\delta$ 吸收，$\sqrt{G+1}$ 是 $e\le\sqrt G$ 型放缩的分母）；$J_{\rm o}>A_*H+2C_0+1$（振荡测试放大率必须大于链总跨度）；$v=\delta^3/2$（把 prop:oscillation-packing 的阈值取成第（4）步 $\delta^3$ 的一半，留 2 倍余量）；$\mathcal O=\{W_{J_{\rm o}}(T)>v\ell(T)^n\}$，Carleson 常数 $C_{\rm o}$；种子容差 $\alpha/(2A_{\rm F})$（prop:flat-seeds 的 $\eta$），给出 $N$（即 $N_{\rm F}$）与 $M$（$M\le C(d,n,C_{\rm AD})2^{nN}$）；视域限制 $\ell(Q)\le D_E/B_*$，$B_*=H2^{K_*}$，代价 $2+\lceil\log_2B_*\rceil$ 个世代（排除装不下 $2^{K_*}$ 链的粗立方体）。

主论证：取种子 $S$，$a=z_S$，令 $r_j=H2^{-j}\ell(S)$，$j=0,\dots,m$。初始 excess 界 eq:seed-initial-excess 由种子平坦性与 $e^2$ 的双边界推出：$e_\mu(a,2^ir_0)\le\sqrt G\,\alpha\ell(S)/(2^ir_0)\le\delta2^{i/4}$，这里 $\gamma=1/4$ 的形状出现，靠 $\alpha\le\delta H/(2\sqrt{G+1})$ 与 $r_0=H\ell(S)$ 吸收 $\ell(S)/r_0$。振荡假设 eq:chain-oscillation 由 $Q\notin\mathcal O$ 给出（$W_{J_{\rm o}}(T)\le v\ell(T)^n$，而 $J_{\rm o}$ 足够大使 $B(a,A_*r_j)$ 落在测试球内）。于是每一层 $j$ 都能应用 thm:excess-propagation（$J\ge J_0$ 的自由度用来匹配 $j$），归纳得到 $e_\mu(a,r_j)\le\delta$（$0\le j\le m$）与 $b_\mu(a,r_j)<\varepsilon$（$1\le j\le m$）。论文注明"no test at the terminal cube $Q'$ was used"，即终端立方体本身不需要振荡假设，它只是被前面的层控制的对象，这让归纳的边界情形不需要额外例外族。最后：非平坦的 $Q$（$\beta_H(Q)\ge\varepsilon$）要么在 $\mathcal F$ 里、要么在某个种子的链上被充电到 $\mathcal O$，于是 lem:seed-charging 给出 $\sum\mu(Q)\le M(N+1)(1+C_{\rm o})\mu(R)$，再乘上粗世代的 $2+\lceil\log_2B_*\rceil$ 因子，合并为 $C_{H,\varepsilon}$。

后半（`07-packing-endpoint.tex:227-274`）把离散的 $\beta_H$ 估计搬到连续的 $b_\mu(x,t)$：先说明 $b_\mu$ 的 Borel / 下半连续性使"球指标"可测；再过渡到内在球，对 $s_j/2<t\le s_j$ 有 $b_\mu(x,t)\le(Hs_j/t)\beta_H(Q_j(x))\le2H\beta_H(Q_j(x))$；得到 eq:continuous-bwgl

> " \int_{E\cap B(a,R)}\int_0^R\mathbf1_{\{b_\mu(x,t)>\varepsilon\}}\frac{dt}{t}\,d\mu\le C_\varepsilon R^n "

做法是把尺度 $s_j$ 的立方体按尺度 $s$ 的祖先分组，只统计与 $B(a,R)$ 相交且被包含在 $B(a,(1+4C_0)R)$ 内的祖先（$1+4C_0$ 是格的外球余量）。再往后（`07-packing-endpoint.tex:276-307`）用 5r 覆盖引理与半径 $<D_E/10$ 的限制得到 eq:measure-hausdorff-comparison $c\H^n\restrict E\le\mu\le C\H^n\restrict E$ 与 $\H^n_\eta(F)\le C_nC_{\rm AD}\mu(U)$。

(c) 理由：$H\ge4(C_0+1)$ 保证 $H\ell(Q)$ 的球覆盖 $Q$ 的外球 $B(z_Q,C_0\ell(Q))$ 并留一倍余量，同时给尺度比较里的因子 $Hs_j/t\le2H$ 留出空间。$\alpha$ 的两个分量各自钉住一个不等式方向，缺一个就断。$v=\delta^3/2$ 里的 2 是余量。$B_*=H2^{K_*}$ 是链的总跨度，$\log_2B_*$ 是必须舍弃的粗世代数。消费者：thm:bwgl（把 $C_\varepsilon R^n$ 喂进去）与 cor:variation（间接）。

(d) `[推测]` 候选失败路线一：让 $J_{\rm o}$ 不依赖 $A_*$（例如固定 $J_{\rm o}=2$），则种子的振荡控制覆盖不了 $A_*r_j$ 大的球，eq:chain-oscillation 在链条前几层就不成立。`[推测]` 候选失败路线二：把 $\beta_H(Q)\ge\varepsilon$ 换成 $e_\mu(z_Q,H\ell(Q))\ge\varepsilon$（单边），则 thm:excess-propagation 的输出 $b<\varepsilon$ 与假设不匹配（一个是双边 sup 型、一个是单边的平方平均），例外族定义要重做，$\beta$ 与 $b$ 的比较会丢一项。`[推测]` 候选失败路线三：省去视域限制（允许 $\ell(Q)>D_E/B_*$），则 $2^{K_*}r\le\diam(\supp\mu)$ 在链条第一层就不成立，thm:excess-propagation 无法启动；失败的症状表现为一个有限但依赖 $\mu$ 的额外项，而这正是"常数在测度之前选定"被破坏的方式。

#### §5.8.3 thm:bwgl（`07-packing-endpoint.tex:309-335`，证明在 `09-geometric-conventions.tex:10-79`）

(a) 原文：

> "Let $E\subset\R^d$ be closed, of positive diameter, and $n$-AD regular with respect to $\H^n$. Suppose that for every $\varepsilon>0$ there is $C_\varepsilon<\infty$ such that \[ \int_{E\cap B(a,R)}\int_0^R \mathbf1_{\{b_E(x,t)>\varepsilon\}}\,\frac{dt}{t}\,d\H^n(x) \leq C_\varepsilon R^n \quad(a\in E,\ 0<R<\diam E). \] Then $E$ has big pieces of uniformly Lipschitz images: there are $\theta_0>0$ and $L<\infty$ such that for every $a\in E$ and $0<r<\diam E$ there is an $L$-Lipschitz map $f:B^n(0,r)\to\R^d$ for which \[ \H^n\bigl(E\cap B(a,r)\cap f(B^n(0,r))\bigr)\geq\theta_0r^n. \]"

引用出处是 `[Chapter~II.2]{DavidSemmes1993}`、`[Theorem~2.5]{Tolsa2015Uniform}`、`[Theorem~1.0.4]{BateHydeSchul2023}`。

(b) 我补的推导。这一条是外部输入（David--Semmes 双边判别法），而 `09-geometric-conventions.tex` 的作用是处理记号约定带来的三个引理，让论文里的 $b$ 与文献里的双边量对上。我补的三处。第一，$\overline b_E(x,t)\le2b_E(a,2t)$（把以 $a$ 为中心的 $b$ 搬到以 $x$ 为中心的版本，因子 2 来自三角不等式与 $t$ 的两倍放大）；$R<\diam(E)/2$ 的情形直接用这个比较，$D/2\le R<D$ 的情形用半径 $D/8$ 的球覆盖，得 $(\log8)\H^n(E)$ 型的对数损失（$\int dt/t$ 在 $[D/8,D]$ 上的长度是 $\log8$）。第二，$\xi_E(a,t)\le36\overline b_E(a,2t)$（把局部连通性缺陷 $\xi$ 用双边量控制）：取 $0<\lambda<1/12$、畸变 $4\lambda t$、$y=\pi_L(a)+(1-6\lambda)v$，则 $\lvert y-a\rVert\le(1-4\lambda)t$、$\lvert z-y\rVert\le2\lambda t$、$\lvert f(z)-v\rVert\le8\lambda t$，于是 $\xi_E\le12\lambda$；常数映射的后备情形给 $\xi_E\le3$。第三，把 Lipschitz 图真正造出来：$V=(\phi(F)-\phi(p))/(4K)$，$h(u)=\phi^{-1}(4Ku+\phi(p))$ 是 $4K^2$-Lipschitz 的，延拓常数为 $4\sqrt dK^2$，质量因子 $2^{-n}$（把半径 $r$ 的像缩到 $r/2$ 时的 $\H^n$ 损失）。所引用的具体条款是 `[Definition~3.1.3]{BateHydeSchul2023}`、`[Theorem~B, implication $(3)\Rightarrow(5)$]`、`[Proposition~9.0.2 and Lemma~9.0.4]{BateHydeSchul2023}`。thm:main 的证明（`07-packing-endpoint.tex:337-358`）在应用本条时取半径 $r/2$ 并令 $g(u)=f(u/2)$，从而捕获 $c\theta_02^{-n}r^n$ 的质量。

(c) 理由：$E$ 闭、正直径、$\H^n$-AD 正则是判别法的标准输入；正直径排除退化（thm:main 证明里退化支撑另处处理）。$0<R<\diam E$ 与 def:ad 的容许半径同源。$b_E$ 用的是集合版（对 $E$ ，并非 $\mu$），这就是为什么需要 eq:measure-hausdorff-comparison：$\mu$ 与 $\H^n\restrict E$ 双侧等价，才能把 $\mu$ 版 Carleson 变成 $\H^n$ 版。$\theta_0,L$ 的存在性是非构造性的（来自判别法），所以 thm:main 的 $\theta,M$ 也是非构造性的，这是 §7 里"定量塔"出现的原因。

(d) `[推测]` 候选失败路线一：用 Bate--Hyde--Schul 的 $\beta$ 版（单边）判别法替代双边版，需要额外证明"无洞"，而"无洞"恰恰等价于我要证的结论的一部分，循环。`[推测]` 候选失败路线二：跳过 `09-geometric-conventions.tex` 直接把 eq:continuous-bwgl 塞给 David--Semmes，会因为文献里的双边量以 $x$ 为中心而我的估计以 $z_Q$ 为中心而对不上（差一个 $\overline b_E(x,t)\le2b_E(a,2t)$ 型引理）。`[推测]` 候选失败路线三：改用 Reifenberg 平坦性（逐尺度 sup 小）替代 Carleson 型条件，则需所有尺度，并非"Carleson 多数尺度"的平坦性，而第（1）步只给例外族外的种子，覆盖不了全部尺度。

### §5.9 后果（08-consequences 一件）

#### §5.9.1 cor:variation（`08-consequences.tex:44-192`）

(a) 原文：

> "Let $d\ge4$ and $2\le n\le d-2$ be integers, and let $\mu$ be an $n$-Ahlfors--David regular Radon measure satisfying \eqref{eq:riesz-bound}. Fix $\rho>2$ and a real odd $C^2$ convolution kernel $K$ satisfying \eqref{eq:variation-kernel}. For every real $f\in L^2(\mu)$, \[ \bigl\|V_\rho((T^{K,\mu}_\varepsilon f)_{\varepsilon>0})\bigr\|_{L^2(\mu)} \le C_2\|f\|_{L^2(\mu)}. \] The principal value \[ T^{K,\mu}f(x)=\lim_{\varepsilon\downarrow0}T^{K,\mu}_\varepsilon f(x) \] exists finitely for $\mu$-almost every $x$, belongs to $L^2(\mu)$,"

后接 $\lVert T^{K,\mu}_\varepsilon f-T^{K,\mu}f\rVert_{L^2(\mu)}\to0$ 型陈述与弱 (1,1)。核条件 eq:variation-kernel：$\lvert\partial^\beta K\rvert\le C_K\lvert z\rVert^{-n-\lvert\beta\rVert}$，$\lvert\beta\rVert\le2$；截断条件 eq:variation-cutoff：$\mathbf1_{[4,\infty)}\le\varphi_{\R}\le\mathbf1_{[1/4,\infty)}$，$\mathbf1_{[1/3,3]}\le C_\varphi\lvert\varphi_{\R}'\rvert$。

(b) 我补的推导。这是一条"由定理的几何结论调用别人已证的解析结论"的推论，本身不含新几何。逻辑：thm:main 给 $\mu$ 一致 $n$-矩形；Mas--Tolsa 2014 的 $\rho>2$ 变差刻画（引 `[Theorem~1.3]`，另用其 Definition 2.1 与 Theorem 2.3 的条款 $(a)\Rightarrow(c)$、$(a)\Rightarrow(b)$）说：对一致矩形测度，奇 $C^2$ 核的截断变差 $V_\rho$ 在 $L^2$ 上有界；于是主值 a.e. 存在（有限变差蕴含收敛），Fatou 引理把 a.e. 界搬进 $L^2$，弱 (1,1) 由同一族定理给出。技术上唯一需要我自己补的是有界支撑归约（把无界测度化成有界情形以套用文献定理的假设）：取 $n$ 维仿射平面 $P$ 使 $\dist(a,P)=4D$（$D$ 为支撑直径相关量），令 $\sigma=\mu+\H^n\restrict P$。则对 $x\in E$ 有 $3D\le\dist(x,P)\le5D$，所以 $\sigma$ 仍 AD 正则：上界用 $(9^dC_{\rm AD}+\omega_n)r^n$；下界分两段，$D<r<12D$ 时给 $C_{\rm AD}^{-1}24^{-n}r^n$ 与 $\theta24^{-n}r^n$，$r\ge12D$ 时在 $P$ 内取半径 $r/2$ 的圆盘，其中每点与 $E$ 的距离 $<r/2+5D\le11r/12$，质量 $\omega_n2^{-n}r^n$，并用一个 $1/2$-Lipschitz 的仿射映射把尺度调齐。这样 $\sigma$ 是有界 AD 正则且一致矩形的，可以套用 Mas--Tolsa 定理，再限制回 $\mu$。

(c) 理由：$\rho>2$（严格大于 2）是 Mas--Tolsa 定理的硬性输入；$C^2$ 与 $\lvert\beta\rVert\le2$ 的导数界是同一假设的两面。$d\ge4,2\le n\le d-2$ 在本条没有额外作用，只是继承 thm:main 的范围，但它是全文除 `00-introduction.tex:62` 之外唯一再次出现 $d-2$ 的地方（我 grep 验证过），也就是说 cor:variation 的作者认为这条推论的范围必须与主定理同步陈述。$4D$、$5D$、$12D$、$11r/12$、$24^{-n}$ 这一串数字都是为了"加进一个平面后仍 AD 正则"的最紧放缩：若把 $4D$ 改成 $2D$，则 $\dist(x,P)\ge D$，$D<r<12D$ 段的下界退化。消费者：无（终端推论）。

(d) `[推测]` 候选失败路线一：直接从截断 L² 界用 Hormander 条件推主值存在（绕开几何），这条路在 AD 正则的高余维里我做不到，因为需要 $T$ 的弱 (1,1)，而弱 (1,1) 在这里正是被推论出来的，并非假设。`[推测]` 候选失败路线二：不加平面 $P$ 而直接用截断支撑 $\mu\restrict B$，则 $\mu\restrict B$ 失去下界 AD 正则（边界附近的球质量不足），Mas--Tolsa 假设不满足。`[推测]` 候选失败路线三：把 $\rho>2$ 放宽到 $\rho=2$，则 Mas--Tolsa 的刻画本身失效（他们的定理明确要 $\rho>2$），变差界的结论形式不成立。

## §6 常数与参数台账

我把链条上每一个被显式定出的数、指数、增长率都登记一遍，位置是实测的文件行号。表内绝对值一律写 `\lvert\rvert`。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $d,n$ | $d\ge4$，$2\le n\le d-2$ | 00-introduction.tex:62 | thm:main 与 cor:variation 的范围陈述 | 内部章节只假设 $1\le n<d$，把 $d-2$ 改成 $d-1$ 时主定理仍逐条可证，只是与 NTV 余维一结果重合 |
| $n\le d$ | 全称假设 | 00-introduction.tex:12-13 | lem:global-growth 的 $2^n\le9^d$ | 破坏 $G=9^dC_{\rm AD}$ 的覆盖计数，lem:annular-alternative 的环分解常数同时改变 |
| $D_E$ | $\diam E$，空时取 $0$ | 00-introduction.tex:15-16 | def:ad 的容许半径集 | 去掉 $D_E=0$ 约定则退化支撑分支需要另写，thm:main:07:337 的分支失效 |
| $C_{\rm AD}\ge1$ | 双侧 AD 常数 | 00-introduction.tex:18-27 | $G$、$c_0,C_0,c_1,C_1$、$E_0$ | 取消 $\ge1$ 则所有以 $C_{\rm AD}$ 写的界不再单调，台账下游全需分情况 |
| $K_n(z)$ | $z/\lvert z\rvert^{n+1}$ | 00-introduction.tex:29 | 全部配对与截断 | 改成 $\lvert z\rvert^{-n}$ 则阶次错，eq:hard-truncation 的发散阶由 $\varepsilon^{-n}$ 变 $\varepsilon^{-1}$ |
| $C_{\rm R}$ | 硬截断 $L^2$ 界 | 00-introduction.tex:39-42 | $E_0$、$D_0$、prop:oscillation-packing、$C_{H,\varepsilon}$ | 只在某个 $\varepsilon$ 序列上有界时 lem:annular-average-gap 的地板不成立，第（1）步二分法失效 |
| $G=9^dC_{\rm AD}$ | 全局上生长 | 01-background.tex:18-19 | lem:pairings、$H_J$、$T_J$、$E_0$、$C_{\rm AD}$ 比较 | 换成 $C\cdot 9^n$ 则体积比较不成立（球在 $\R^d$ 内计数），lem:global-growth 证不出 |
| $\theta,M$ | 一致矩形性常数 | 00-introduction.tex:48-59, 66-67 | thm:main 结论 | 允许 $M$ 依赖 $r$ 则退化，def:ur 不再给出判别法可用的结论 |
| $D_0$ | 固定解析类的算子界 | 01-background.tex:58-59, 86-96 | prop:flat-limit、thm:excess-propagation、lem:planar-rigidity | 令 $D_0$ 依赖 $j$ 则 lem:weak-compactness 的界传递失效，第（2）步无极限 |
| $c$ | 下生长常数 | 01-background.tex:54-57 | lem:plane-comparison、prop:flat-limit、lem:moving-compactness | 去掉下界则 $q$ 可为零，方差恒等式里的 $q^{-1}$ 发散 |
| $A=B(a,2R)$ | 配对的近域球 | 01-background.tex:70-78 | lem:pairings、$\mathcal R$ 的定义 | 把 $2R$ 改成 $R$ 则"与 $a,R$ 无关"的独立性证明多出边界项 |
| $O(T^{-1})$ | 尾项衰减 | 01-background.tex:90-91 | prop:height-equation 的尾巴、eq:two-height-tail-errors | 若只有 $O(T^{-1/2})$ 则 eq:height-last-radius 需要更强条件，schedule 不满足 |
| $c_0\le1/2,\ C_0\ge2$ | 格的核心 / 外球常数 | 01-background.tex:277-281 | prop:flat-seeds 的 $\kappa=c_0/32$、$S$ 半径、$H\ge4(C_0+1)$ | $C_0$ 变大直接抬高 $J_{\rm o}$、$A_{\rm f}$、$B_*$，链条世代数增加 |
| $c_1,C_1$ | 胞元质量双侧界 | 01-background.tex:281 | $H_J'$、$M=(8L_0)^n/c_1$、eq:seed-mass-comparison | $c_1$ 消失则 $H_J'$ 发散，lem:dyadic-test-bessel 断，第（1）步全线断 |
| $H_J=GJ^{n+1}(2J+1)^2$ | 同世代重叠计数 | 02-flat-balls.tex:68 | $B_J=4H_JH_J'$ | 指数 $n+1$ 少 1 则 $J$ 倍邻域的体积不够，Gram 判据的发散项无法吸收 |
| $H_J'=c_1^{-1}G(2J+C_0)^n$ | 跨世代质量比 | 02-flat-balls.tex:87 | $B_J$ | 同上，且 prop:oscillation-packing 的 $\sum r_Q^n$ 界失效 |
| $B_J=4H_JH_J'$ | Bessel 界 | 02-flat-balls.tex:118 | prop:oscillation-packing 的 $4v^{-2}B_JC_{\rm R}^2$ | 改成 $H_JH_J'$（去掉 4）不影响正确性但会影响后续 $C_{\rm o}$ 的具体数值 |
| $T_J=C(n)G^2J^{n+2}$ | 外球误差系数 | 02-flat-balls.tex:160-163 | $N$ 的选取 $2^{-N}\le v/[2(T_J+1)]$ | 若误差无 $r_Q/L$ 因子则 $N$ 无法选，粗 / 细分裂失效 |
| $\ell(Q)=2^{-k}$ | 二进制世代比 | 01-background.tex:276 | $N_{\rm F}>\log_2(16(A_{\rm F}+C_0)/\rho)$、$2+\lceil\log_2B_*\rceil$ | 换成非二进制比则所有 $\log_2$ 计数要重算，Lean 侧已用 $1/64$（见 §7.5） |
| $W_J(Q)$ | 振荡量，量纲同 $\mu(Q)$ | 01-background.tex:328-334 | $\mathcal O(J,v)$、prop:flat-seeds、prop:beta-packing | 改成 $\beta^2\mu(Q)$ 型则回到输入侧向量值 $L^2$ 问题（§2.1） |
| $0<\kappa<1/8$ | annular 的尺度上限 | 02-flat-balls.tex:253 | prop:flat-seeds 取 $\kappa=c_0/32$ | $\kappa\ge1/8$ 则 $B(a_0,\kappa s)$ 与 $\kappa s$ 的球链超出 $Q$ 的外球 |
| $\rho\in(0,\kappa)$ | 平坦球的半径下界比 | 02-flat-balls.tex:253-266 | $N_{\rm F}$、$I$ | $\rho$ 若依赖 $\mu$ 或 $s$，第（1）步的统一深度失效 |
| $\eta/64,\ \eta/4096$ | 降维归纳中的阈值损失 | 02-flat-balls.tex:305-319, 449-458 | lem:annular-alternative 的归纳假设 | 每降一维损 $2^n$ 上界、除 $4^n$ 下界；维数超过 12 时 $4096$ 不够 |
| $E_0=3C_{\rm R}(G2^nM)^{1/2}+3C(n)G$ | 平均隙地板 | 02-flat-balls.tex:525 | $T=E_0+2$、prop:flat-seeds | 地板若含 $\log(R/r)$ 则 $T$ 不能固定，(2) 分支永不被排除 |
| $M=(8L_0)^n/c_1$ | 集合质量放大 | 02-flat-balls.tex:580-727 | lem:annular-average-gap 的 $M$ | $L_0=\max\{1,2C_0\}$ 变小则 $A\subset B(a,r/2)$ 的质量条件不满足 |
| $\epsilon_{\rm F}=\eta A_{\rm F}/(32(A_{\rm F}+C_0))$ | 种子容差换算 | 02-flat-balls.tex:580-727 | $b_\mu(z_P,A_{\rm F}\ell(P))<\eta/2$ | 分母少一个 $A_{\rm F}+C_0$ 则尺度搬运后只得到 $\eta$ 级别，无余量 |
| $H_I=(C_1/c_1)2^{In}$ | Haar 族的世代放大 | 02-flat-balls.tex:580-727 | 最终 Carleson 常数 $H_IIC_{\rm R}^2G(C_0+2)^n/c_1$ | $I$ 增大时指数 $2^{In}$ 爆炸，$C_{H,\varepsilon}$ 随之爆炸 |
| $A,\ \varepsilon_0$ | 平面比较常数 | 03-planar-limits.tex:15, 24-27 | lem:fixed-plane-moments 的 $B$、$\kappa$ | $A$ 依赖 $K$ 则跨世代和发散（§5.4.1(d) 路线三） |
| $\tau=\min\{1,c/[4(G2^n3^n+1)]\}$ | 低维管阈值 | 03-planar-limits.tex 管论证段 | $K_j$ 递推 $K_{j+1}=K_j(1+2/\tau)+1/\tau$ | $\tau$ 变大则管界不成立，两平面可能真斜交 |
| $K_0=0,\ K_{j+1}=K_j(1+2/\tau)+1/\tau$ | 锚点条件化递推 | 03-planar-limits.tex:13-112 证明内 | $A=2(1+8K)$、$\varepsilon_0=\min\{1,1/[4(K+1)]\}$ | 去掉递推则平面偏移线性累积，$A$ 随世代爆炸 |
| $b=2^\gamma,\ D=2+2\cdot2^{n+2}b^2$ | 跨代累积量 | 03-planar-limits.tex:114-165 | $L$（由 $D\le L^2c/2$）、$\kappa=\varepsilon_0/L$ | $\gamma\ge1/2$ 时 $b^2\ge2$，$D$ 与 $M\delta^22^{k(n+2+2\gamma)}$ 的指数不再匹配 |
| $B=AL(\frac3{2b-1}+\frac1{b-1})$ | 几何级数和 | 03-planar-limits.tex:114-165 | $M=4+2GB^2$ | $b\to1$（即 $\gamma\to0$）发散，故 $\gamma$ 不能取 $0$ |
| $\omega_n=\lvert B_{\R^n}(0,1)\rvert$ | Euclidean 归一化 | 03-planar-limits.tex:185-479 | $\theta$ 的双侧界 $c/\omega_n\le\theta\le G/\omega_n$ | 换归一化则 $\theta$ 界要同步缩放，lem:moving-compactness 的 $q$ 也随之缩放 |
| $D_1$ | 局部 $L^2$ 界 | eq:planar-local-cap-bound | lem:planar-rigidity 第二步 | 无此界则 $g$ 的有界性证不出，"有界 $\Rightarrow$ 常数"失效 |
| $c/\omega_n\le\theta\le G/\omega_n$ | 常密度的双侧界 | 03-planar-limits.tex:185-479 | prop:flat-limit 的 $q$ 界 | 单侧则 $q$ 可能为零，极限测度消失 |
| $\gamma\in(0,1/2)$ | Hölder 型增长指数 | 03-planar-limits.tex:492, 06-excess-propagation.tex:320 | $K_j=2j+3$ 的 schedule、$e\le\delta2^{i/4}$ | $\gamma=1/2$ 时 $\delta_j2^{\gamma K_j}\to2^{3/4}$，prop:flat-limit 假设不成立 |
| $\delta_j2^{\gamma K_j}\to0$ | 视域上条件 | 03-planar-limits.tex:502-505 | lem:fixed-plane-moments 的 $\kappa$ 门槛 | 破坏则第（2）步的力矩指数超过可吸收范围 |
| $\delta_j^{-1}2^{-K_j}\to0$ | 视域下条件 | 05-fractional-rigidity.tex:127, 06-excess-propagation.tex:192 | prop:height-equation 的外场尾 | 破坏则 $\int v\mathcal Lg=0$ 证不出，刚性无输入 |
| $2^{-K_j}/\delta_j\to0$ | 截断尾条件 | 04-height-compactness.tex:50-53 | $C_H$ 的界 $1/(\delta T)$ | 破坏则归一化能量不有限，lem:moving-compactness 无法抽取 |
| $\mathcal E_{\sigma,U}(f)$ | 能量定义（核 $\lvert x-y\rvert^{-n-1}$） | 04-height-compactness.tex:16-21 | eq:height-uniform-energy、eq:height-cell-variance | 核指数改则胞元方差与 $h$ 的匹配失败 |
| $C_H$（依赖 $H,n,\gamma,G,c,M,W$） | 归一化能量界 | 04-height-compactness.tex:76-77 | lem:moving-compactness、prop:normalized-excess-limit | 若依赖 $\delta_j$ 则第（4）步的极限不存在 |
| $Q_H,\ \Omega_H$ | $(-(H+1),H+1)^n$ 与 $\pi^{-1}(Q_H)\cap B(0,(\sqrt n+1)(H+1))$ | 04-height-compactness.tex:267-274 | 三个测度收敛的区域 | 去掉 $\sqrt n+1$ 的余量则角部覆盖丢失，分区误差非 $O(h)$ |
| $s$（高度个数） | 有限 | 04-height-compactness.tex:298-302 | 对角抽取 | $s=\infty$ 则无统一子列 |
| $(1+\lvert x\rvert)^{-n-2}$ | 加权可积权重 | 05-fractional-rigidity.tex:384 | lem:fractional-rigidity 排除 $k\ge2$ | 指数改成 $n+1$ 则 $\int^\infty r^{k-3}dr$ 的临界移动，二次项不再被排除 |
| $c_n=a_n(e_1)>0$ | Fourier 符号 | 05-fractional-rigidity.tex:381-611 内 | 核空间为仿射 | $c_n=0$ 则 $\mathcal L$ 为零算子，方程无信息 |
| $N$（有限阶） | 支撑为点的分布阶 | 05-fractional-rigidity.tex:381-611 内 | Taylor jet 论证 $\varepsilon^{N+1-\lvert\alpha\rvert}$ | 无有限阶则 $T_v$ 不必是多项式，结论失效 |
| $\mathcal Lg$ 的 $\frac12$ | 对称差商系数 | 03-planar-limits.tex:170-174, 05-fractional-rigidity.tex:147-148 | eq:planar-riesz-gradient 的验证 | 系数改则符号 $c_n$ 缩放，与配对恒等式的因子不匹配 |
| $q_0=d-n$ | 余维 | 06-excess-propagation.tex:111-174 | lem:normal-affine-planes 的 $v$ 值域 | 与法向框架维数不一致则 $w_j$ 无定义 |
| $v(x)=b+Bx$ | 极限仿射映射 | 06-excess-propagation.tex:111-174 | eq:genuine-tilted-plane 的斜率 $A_j'$ | 若 $v$ 非仿射则 $S_j'$ 不是平面，$b$ 的定义不适用 |
| $\gamma=1/4$ | 全文固定的传播指数 | 03-planar-limits.tex:637, 06-excess-propagation.tex:423, 07-packing-endpoint.tex:96 | $K_j=2j+3$、eq:seed-initial-excess 的 $\delta2^{i/4}$ | 改 $\gamma$ 需同时改 $K_j$ 的线性系数以保持两个视域条件 |
| $\delta_j=2^{-j},\ K_j=2j+3,\ A_j=8\cdot2^{K_j},\ v_j=\delta_j^3$ | 反证 schedule | 03-planar-limits.tex:636-643 | prop:flat-limit、prop:normalized-excess-limit、thm:excess-propagation | 任一改数需重验 $\delta_j2^{\gamma K_j}\to0$ 与 $\delta_j^{-1}2^{-K_j}\to0$ |
| $\delta=2^{-J},\ K=2J+3,\ A=8\cdot2^K$ | 传播常数 | 06-excess-propagation.tex:324-326 | prop:beta-packing 的 $j_*,K_*,A_*$ | $K=2J+2$ 则 $\delta^{-1}2^{-K}=2^{-2}$ 不趋于零，第（3）步断 |
| $H\ge4(C_0+1)$ | 双边平坦的放大率 | 07-packing-endpoint.tex:15-18 | $\beta_H$、eq:continuous-bwgl、$A_{\rm f}$、$B_*$ | $H$ 太小则 $B(z_Q,H\ell(Q))$ 装不下 $Q$ 的外球，比较失败 |
| $A_{\rm f}>H2^{K_*}+2C_0+1$ | 种子放大率 | 07-packing-endpoint.tex:94 之后的参数段 | prop:flat-seeds 的 $A_{\rm F}$ | 小了则种子球覆盖不到链的全跨度 |
| $\alpha<\min\{\varepsilon H/4,\ \delta H/(2\sqrt{G+1})\}$ | 种子容差 | 07-packing-endpoint.tex 参数段 | eq:seed-initial-excess | 大了则 $e_\mu(a,2^ir_0)\le\delta2^{i/4}$ 不成立，归纳从第 0 层就断 |
| $J_{\rm o}>A_*H+2C_0+1$ | 振荡测试放大率 | 07-packing-endpoint.tex 参数段 | $\mathcal O$、eq:chain-oscillation | 小了则 $B(a,A_*r_j)$ 不被 $W_{J_{\rm o}}$ 的测试球覆盖 |
| $v=\delta^3/2$ | 振荡阈值 | 07-packing-endpoint.tex 参数段 | $C_{\rm o}$（含 $v^{-2}\sim\delta^{-6}$） | 取 $v=\delta^3$ 则无余量，$\mathcal O$ 与传播假设之间冲突 |
| $B_*=H2^{K_*}$，代价 $2+\lceil\log_2B_*\rceil$ | 视域世代数 | 07-packing-endpoint.tex 参数段 | $C_{H,\varepsilon}$ 的粗世代因子 | 不减去粗世代则 $\theta,M$ 会依赖 $\diam E/\ell(Q)$，破坏"先于测度选定" |
| $M(N+1)(1+K)$ | 充电界 | 07-packing-endpoint.tex:28-78 | $C_{H,\varepsilon}$ | 三因子任一去掉了不等式 |
| $C_\varepsilon R^n$ | 连续 BWGL 界 | 07-packing-endpoint.tex:227-274 | thm:bwgl | 缺 $(1+4C_0)R$ 的外扩则祖先分组漏项 |
| $c\H^n\restrict E\le\mu\le C\H^n\restrict E$ | 测度与 Hausdorff 比较 | 07-packing-endpoint.tex:276-307 | thm:bwgl 的输入 | 5r 覆盖与半径 $<D_E/10$ 任一改动则 $\H^n_\eta(F)\le C_nC_{\rm AD}\mu(U)$ 断 |
| $\theta_0,L$ | 判别法输出 | 07-packing-endpoint.tex:309-335 | thm:main 的 $\theta,M$ | 集合版 $b_E$ 与测度版 $b_\mu$ 混用则需重写比较 |
| $c\theta_02^{-n}r^n$ | 主定理收尾的质量 | 07-packing-endpoint.tex:337-358 | def:ur 的 $\theta$ | 半径取 $r$ ，并非 $r/2$ 则 $g(u)=f(u/2)$ 的重参数化失效 |
| $\rho>2$ | 变差指数 | 08-consequences.tex:45 | Mas--Tolsa 定理条款 | $\rho=2$ 时该刻画不成立，$V_\rho$ 界无从调用 |
| $4D,5D,12D,11r/12,24^{-n}$ | 有界支撑归约的放缩链 | 08-consequences.tex 证明段 | cor:variation | 改 $4D$ 为 $2D$ 则 $\dist(x,P)\ge D$，$D<r<12D$ 段下界退化 |

台账之后的依赖链（我从输出端往输入端倒推写一遍，这条链就是我核对"$\theta,M$ 只依赖四个数"时用的路线）：

$\theta,M$ ← thm:bwgl 的 $\theta_0,L$ ← eq:continuous-bwgl 的 $C_\varepsilon$ ← prop:beta-packing 的 $C_{H,\varepsilon}=M(N+1)(1+C_{\rm o})$ 乘粗世代因子 ← $M\le C(d,n,C_{\rm AD})2^{nN}$ 与 $C_{\rm o}\propto v^{-2}B_JC_{\rm R}^2\propto\delta^{-6}B_JC_{\rm R}^2$ ← $N=N_{\rm F}>\log_2(16(A_{\rm F}+C_0)/\rho)$ ← $\rho$（来自 lem:annular-alternative，依赖 $d,n,C_{\rm AD},G,\kappa,\epsilon_{\rm F},T$）← $T=E_0+2$ ← $E_0=3C_{\rm R}(G2^nM)^{1/2}+3C(n)G$ ← $M=(8L_0)^n/c_1$ ← $c_0,C_0,c_1,C_1\,(d,n,C_{\rm AD})$ ← $G=9^dC_{\rm AD}$。另一支：$\delta=2^{-J}$ ← thm:excess-propagation 的 $J$ ← prop:normalized-excess-limit ← prop:flat-limit（需 $c,G,D_0,\gamma$）← lem:planar-rigidity（需 $D_0$、局部界 $D_1$）← $D_0\le C_{\rm R}+CG$（lem:pairings 的平滑截断转换）。两支的终端合起来只有 $d,n,C_{\rm AD},C_{\rm R}$ 四个数，与 thm:main 的声明一致。

我从这条链读出的两个脆弱点。第一个是 $\delta^{-6}$：它来自 prop:oscillation-packing 的 $v^{-2}$ 与 $v=\delta^3/2$，而 $\delta$ 又来自 thm:excess-propagation 的 $J$，$J$ 的存在性靠反证。于是"常数先于测度选定"这件事在定量上付出了 $\delta^{-6}$ 乘 $2^{nN}$ 乘 $2^{In}$ 三重爆炸，这也是 Lean 侧要把 $M$ 做成原始递归塔（`badBudgetChartConstant`）的根本原因：任何试图给出原始递归界的努力都必须把这三重爆炸显式化。第二个是 $G=9^dC_{\rm AD}$ 的 $d$ 次指数：它进入 $E_0$（开根后变 $9^{d/2}$）、$T_J$、$H_J$、$B_*$ 里的 $2^{K_*}$，最终 $\theta$ 对 $d$ 的依赖至少是 $9^{-c\cdot d}$ 型（在分母上），也就是高环境维数下大块的占比会指数级恶化。这与已知的一致矩形性定量结果的趋势相符，我把它当作链条健康的一个旁证。

## §7 Lean 取证

grep 范围严格限定在三处：`lean/formalization.yaml`、`lean/OAI/Analysis/RieszRectifiability/`、`lean/ComparatorChallenges/RieszQuantitative.json`。

### §7.1 登记坐标与 comparator 契约

登记在 `lean/formalization.yaml:1466-1468`，三行原文：

- `comparator_config: ComparatorChallenges/RieszQuantitative.json`
- `declaration: OAI.RieszRectifiability.quantitative_higher_codimension_riesz_rectifiability`
- `file: OAI/Analysis/RieszRectifiability/Uniformity/Rectifiability.lean`

书目条目在 `formalization.yaml:547-549`（`title` 在 547，`authors` 在 548 为 "OpenAI"，`id` 在 549 指向 PDF），`type: article` 在 550 行。

`ComparatorChallenges/RieszQuantitative.json` 共 389 字节，实测字段：`challenge_module` 为 `ComparatorChallenges.RieszQuantitative`；`solution_module` 为 `OAI.Analysis.RieszRectifiability.Main`；`theorem_names` 数组里只有一个元素 `OAI.RieszRectifiability.quantitative_higher_codimension_riesz_rectifiability`；`definition_names` 是空数组；`permitted_axioms` 是 `["propext","Quot.sound","Classical.choice"]`；`enable_nanoda: false`。

`permitted_axioms` 只有这三条意味着：comparator 允许整个证明使用命题外延、商外延与选择公理，而不允许任何 `native_decide` 或自定义公理。结合 `definition_names` 为空可以看出，契约只认证一个定理名，不要求任何定义被逐字对齐（这与 tex 里 def:ad、def:ur 两个定义的地位有关，见 §7.3）。

### §7.2 树规模与目录分布

实测 `.lean` 文件数 824（`find ... -name '*.lean' | wc -l`），行数 65,638（`find -name '*.lean' -print0 | xargs -0 cat | wc -l`，与逐文件 `wc -l` 之和一致；注意用 Python 的 `split('\n')` 或按非空行计会得到 66,462，多出的 824 是缺尾换行的文件造成的幻影行，所以台账用 `wc -l` 语义）。

目录分布（文件数 / 行数，所有文件都在深度 ≤ 2，因此按二级目录聚合即完整）：

| 目录 | 文件数 | 行数 |
| --- | --- | --- |
| Kernel | 175 | 14,578 |
| Restart | 128 | 11,512 |
| Limits | 103 | 7,906 |
| Foundations | 98 | 6,924 |
| Flatness | 75 | 5,556 |
| Nets | 61 | 4,444 |
| Rigidity | 57 | 4,592 |
| Surfaces | 46 | 3,340 |
| Packing | 39 | 3,056 |
| Projections | 34 | 2,797 |
| Uniformity | 4 | 787 |
| 顶层（BallMaps, Main, Model, PerMeasure） | 4 | 146 |

十二项相加为 824 文件 / 65,638 行，与总量吻合。定理数（以行首 `theorem` 计，用 Python 逐文件统计）：Kernel 596、Foundations 271、Restart 290、Nets 223、Limits 239、Flatness 192、Rigidity 174、Packing 101、Surfaces 78、Projections 77、Uniformity 16、顶层 2，合计 2,259 个 theorem；另有 def 312 与 abbrev 4（合计 316 个定义类声明），文件行数中位数 76。最大的七个文件：`Uniformity/RestartBudgets.lean` 274、`Uniformity/SurfacePieces.lean` 268、`Restart/ActiveRegionAllScaleForwardFlatness.lean` 237、`Kernel/FiniteRieszPairing.lean` 212、`Projections/ProjectionCells.lean` 209、`Kernel/DyadicCommonHeightEquation.lean` 206、`Limits/SignedKernelConvergence.lean` 204。

声明种类普查（行首 token）：`theorem` 2259、`def` 312、`abbrev` 4、`structure` 8、`instance` 2、`variable` 101、`namespace` 1642、`open` 1322、`import` 2249、`noncomputable` 815；`example`、`attribute`、`section`、`set_option`、`macro`、`#print`、`#check`、`#eval` 全为 0；带 `protected` 或 `private` 前缀的声明为 0。`noncomputable` 815 与 `theorem` 2259 的比例说明大量定义是被证明消费的构造性对象（测度、格、截断核），而 `#check` 为 0 表示没有任何行内调试残留。

### §7.3 审计命中：sorry / admit / axiom / #print axioms

- `sorry`：0 次命中，0 个文件；
- `sorryAx`：0；
- `^axiom`（行首）：0；任意位置的 `axiom`：0；
- `#print axioms`：0；
- `native_decide`：0；`decide`：13（都是 `by decide` 型的自然数小引理）；
- `admit`：5 次命中，但全部五个都在 docstring 的英文散文里（`Limits/OriginalADLimit.lean:10`、`Limits/WeakL2Subsequence.lean:9`、`Restart/ActiveRegionAllScaleForwardFlatness.lean:9`、`Restart/ActiveRegionPositiveScaleInnerDisk.lean:10`、`Uniformity/SurfacePieces.lean:131`），也就是说实际作为 tactic 的 `admit` 是 0。

公名（axiom name）的使用：`Classical.choice` 出现 1 次（`Foundations/OriginalOscillationWitness.lean:55`，振荡见证的非构造性选取），`apply propext` 5 次（`Foundations/PlanarPullbackMeasure.lean:47`、`Kernel/BoundedBoxBoundary.lean:29`、`Kernel/DyadicBoxes.lean:89`、`Nets/ConstructedSupportCells.lean:88`、`Restart/SelectedRestartBallChartData.lean:58`），`Quot.sound` 0 次。结论：树内没有任何公理审计（0 个 `#print axioms`），审计完全委托给 comparator，而 comparator 的白名单正是那三条；`enable_nanoda: false` 表示没有把决策过程交给外部求解器。

导入普查：内部 `OAI.Analysis.RieszRectifiability.*` 1426 条，`Mathlib` 822 条，非 Mathlib 的外部导入恰好 1 条：`FixedPointTheorems.brouwer`（`Surfaces/ContinuousPerturbedBallCoverage.lean:3`），在同行文件的第 36 行以 `_root_.brouwer_fixed_point (closedBall a r)` 使用。也就是说整个 824 文件的机器只额外依赖一个非 Mathlib 的拓扑不动点定理，而它在 tex 里对应的是第（5）步把"近似球覆盖"变成"真正覆盖"的那一步（09 的 $\xi_E$ 论证附近），这是我在 tex 里读不出来的隐藏依赖。

### §7.4 核心问题一：登记的是 quantitative 版本，与 tex 主定理差在哪

模型层实测。`Model.lean` 共 54 行，关键定义与行号：`abbrev Ambient (d : ℕ) := EuclideanSpace ℝ (Fin d)`（:10）；`AdmissibleRadius μ r := 0 < r ∧ ENNReal.ofReal r ≤ Metric.ediam μ.support`（:12-13）；`kernel n x y := (‖x - y‖ ^ (n + 1))⁻¹ • (x - y)`（:15-16）；`truncated n μ ε f x := ∫ y in {y | ε < dist x y}, f y • kernel n x y ∂μ`（:18-20，Bochner 积分、值在 `Ambient d`）；`ADRegularWithConstant n C μ`（:22-26，内含 `1 ≤ C`）；`RieszL2BoundedWithConstant n C μ`（:28-32）：

`∀ ε : ℝ, 0 < ε → ∀ f : Ambient d → ℝ, MemLp f 2 μ → MemLp (truncated n μ ε f) 2 μ ∧ eLpNorm (truncated n μ ε f) 2 μ ≤ (C : ℝ≥0∞) * eLpNorm f 2 μ`

`BallImageConclusion n μ θ M`（:34-39）与 `QuantitativeFullStatement`（:41-49）：

```
def QuantitativeFullStatement : Prop :=
  ∀ d n : ℕ, 4 ≤ d → 2 ≤ n → n + 2 ≤ d →
    ∀ C_AD : ℝ, 1 ≤ C_AD → ∀ C_R : ℝ≥0,
      ∃ θ : ℝ, 0 < θ ∧ ∃ M : ℝ≥0,
        ∀ μ : Measure (Ambient d), μ.Regular →
          ADRegularWithConstant n C_AD μ →
          RieszL2BoundedWithConstant n C_R μ →
          BallImageConclusion n μ θ M
```

对照 tex 的 thm:main（`00-introduction.tex:61-67`）：tex 写的是"存在 $\theta,M$，可由 $d,n,C_{\rm AD},C_{\rm R}$ 选定"，而 Lean 的量化顺序将 $\theta,M$ 放在 $\mu$ 之前（$\forall C_{AD}\forall C_R\exists\theta\exists M\forall\mu$）。tex 的 def:ur 也写了"The constants are chosen before $x$ and $r$"（`00-introduction.tex:58`），但没有明说先于 $\mu$；tex 在 thm:excess-propagation 与 lem:annular-alternative 处用"The constants ... are chosen before the measure"这样的句子暗示了这一点。因此 Lean 与 tex 在这个方向上不是差距，是 Lean 把 tex 的散文承诺变成了类型。

真正的差距在另一侧：定性孪生版本 `FullStatement` 也已经被形式化，位置在 `Foundations/MeasureBounds.lean`（共 55 行）：`ADRegular n μ`（:13-16，$\exists C$）、`UniformlyRectifiable n μ`（:18-23，$\exists\theta>0\ \exists M$，主体与 `BallImageConclusion` 逐字相同）、`RieszL2Bounded n μ`（:25-28，$\exists C:\mathbb R_{\ge0}$）、`FullStatement`（:30-33）：

`∀ d n, 4 ≤ d → 2 ≤ n → n + 2 ≤ d → ∀ μ, μ.Regular → ADRegular n μ → RieszL2Bounded n μ → UniformlyRectifiable n μ`

这就是 tex 主定理的字面翻译（把 $\theta,M$ 的存在放到 $\mu$ 之后）。它有一个端点证明 `exact_higher_codimension_riesz_rectifiability : FullStatement`（`PerMeasure.lean:24-38`）与一个展开引理 `exact_unfolded_ball_map_conclusion`（`BallMaps.lean:23-29`）。也就是说：登记给 comparator 的是更强的 `quantitative_...`，而 tex 陈述的定性版本在树内同样被证明但没有被登记。差距的方向是"登记语句强于 tex"，并非"tex 强于登记"。

comparator 认证语句给出的具体量化与常数：$\theta$ 与 $M$ 的显式形式我实测到（`Uniformity/Rectifiability.lean:89-120` 的端点证明）：$\theta=(1-1/2)/(C\cdot 32^{p+1})$（其中 $n=p+1$），Lipschitz 常数是 $M\cdot(1/4)$，其中 $M=$ `badBudgetChartConstant (fun M => restartChartStepConstant d N P (restartChartStepConstant d N P M)) b`。在 `quantitative_ball_images_of_clean_cell_deficits`（`Rectifiability.lean:24-87`）里质量占比形如 $(1-\zeta)/(C\cdot32^n)$，用 `supportLatticeNets μ (r/4) hR 0`、`latticeRadius (r/4) 0 = r/4`、`AdmissibleRadius μ (latticeRadius R k / 8)`、`cleanSupportCell_measure_bounds`、`retained_mass_of_chart_deficit` 与 `exists_rescaled_ball_chart`（因子 `1/4`），产出 `BallImageConclusion n μ ((1-ζ)/(C*32^n)) (M*(1/4))`。$32^n$ 与 $1/4$ 都是覆盖与重标度的损失，与 tex 里 $2^{-n}$、$24^{-n}$ 型的损失同类，但底数 32 是 Lean 侧自己的格常数选择带来的（$1/64$ 的世代比，见 §7.5）。

另一个差距：tex 的 eq:riesz-bound 只声明 $L^2$ 界，而 Lean 的 `RieszL2BoundedWithConstant` 把输出的 $L^2$ **可积性**（`MemLp (truncated ...) 2 μ`）也写进假设，形成一个合取。tex 在 `06-excess-propagation.tex:22-24` 的 eq:prop-riesz 处恰好注明这个条件"includes existence of the indicated $L^2$ output"，所以这是 tex 内部假设与 Lean 端点假设一致、而 tex 摘要与 Lean 端点假设之间的表述差。我在 §7.2 的台账里把这一条记成"表述位置差"，并非"内容差"。

### §7.5 核心问题二：positive hard truncations 是否被显式定义

是。`Model.lean:18-20` 的 `truncated n μ ε f x := ∫ y in {y | ε < dist x y}, ...` 用的正是严格不等式 $\varepsilon<\lvert x-y\rvert$，与 tex 的 eq:hard-truncation（`00-introduction.tex:31-34`）$\int_{\lvert x-y\rVert>\varepsilon}$ 一致；假设对它做 $\forall\varepsilon>0$（`Model.lean:29-30`），所以"所有正硬截断"是字面定义的。tex 另外两处也说明这一点：`00-introduction.tex:39-42` 的 eq:riesz-bound 与 `00-introduction.tex:43` 的"No pointwise principal-value hypothesis is imposed."，Lean 端假设里没有主值项，与之一致。

对角约定不需要：`Foundations/MeasureBounds.lean:43` 的 `kernel_self`（`kernel n x x = 0`）与 :46 的 `kernel_antisymm` 把核的奇性与原点值写成了定理，并非约定，`{y | ε < dist x y}` 的严格不等式也让 $\varepsilon$-球外的积分域自动避开对角。

被用作"另一族截断"的是 capped 家族：`cappedRieszKernel m ε`、`cappedInverseDistancePow`，出现在 `Kernel/CappedRieszKernel.lean:20`、`Kernel/CappedBilinearKernel.lean:15` 与 `:59`、`Kernel/CappedEnergy.lean:14` 与 `:18`、`Kernel/CappedRieszInterior.lean:14`。我的判断是：这一族对应 tex 里 lem:weak-compactness 证明中的 capped kernel $(x-y)/\max\{h,\lvert x-y\rVert^{n+1}\}$，它是传递弱收敛时的估计工具，并非假设所指的算子族。tex 里另外两族（eq:smooth-annular-transform 的光滑环变换、lem:pairings 里的"smooth truncations with a fixed bounded profile"）在 Lean 中也有对应物，但同样处在"被证明消费"的位置。

`ScalarOscillationBound m μ a A v`（`Kernel/OscillationTests.lean:14-19`）的实现：对一切 $\lVert e\rVert\le1$、一切 `LipschitzWith 1 φ`、`tsupport φ ⊆ ball a A`、`∫φ∂μ = 0`，有 `|rieszScalarPairing m μ a (2*A) e φ| ≤ v`。这正对应 tex 在 `06-excess-propagation.tex:349-350` 给的等价形式（$\Lip(\varphi)\le1$ 配阈值 $\delta^3r^{n+1}$），说明 Lean 选的是"$\Lip\le1$"，并非"$\Lip\le r^{-1}$"那一支归一化。见证结构 `OriginalOscillationWitness`（`Foundations/OriginalOscillationWitness.lean:15-28`）字段含 `lip_bound : (lip:ℝ) ≤ 1/r`、`support_subset : tsupport test ⊆ ball a (J*r)`、`large_pairing : v * r^n < |rieszScalarPairing n μ a (2*(J*r)) direction test|`，即 tex 的 $W_J(Q)$ 的否定形式；第 55 行用 `Classical.choice` 取得见证（这是 §7.3 里唯一一次 `Classical.choice`）。`rieszScalarPairing`（`Kernel/RieszPairingIdentification.lean:52`）定义为 `1/2 * ∫ q, rieszInteriorIntegrand ... ∂ν.prod ν + ∫ q, rieszFarIntegrand ... ∂ν.prod (μ.restrict (closedExterior a R))`，其中 `ν = μ.restrict (ball a R)`，即 tex eq:pairing-definition 的内 / 外两半结构，含 $\frac12$ 系数。

格的实现与 tex 有一处实质偏离：`latticeRadius R k := R * (1/64 : ℝ)^k`（`Nets/RegularLatticeScales.lean:13`），世代比是 $1/64$，不是 tex 的 $\ell(Q)=2^{-k}$（`01-background.tex:276`）。胞元是 `supportLatticeCell` = `supportLatticeNets` 的 `closedNetCell`（`Nets/ConstructedSupportCells.lean:13-19`，由 `nestedSeparatedCovers` 造），并经"清洗"移除 `supportLatticeExceptional μ R hR = ⋃_k supportLatticeOverlap μ R hR k`（`Restart/CleanSupportPartition.lean:20-27`），其零测性由 `supportLatticeExceptional_null`（:29-37）给出。这解释了我先前在台账里预言的问题：所有 $\log_2$ 型的深度计数在 Lean 里变成以 64 为底的计数（`Rectifiability.lean` 里的 `32^n`、`AdmissibleRadius μ (latticeRadius R k / 8)` 的除以 8 等），因此 Lean 的显式常数比 tex 的更差。tex 的 null 集 $N$（prop:dyadic-lattice (i) 的 $E\setminus N$）在这里就是 `supportLatticeExceptional`。

平坦量的编码：`directedBallDeviation`（`Flatness/BilateralBeta.lean:12`）、`bilateralPlaneError`（:15-18，两个有向偏差之和除以 $r$）、`bilateralBeta`（:20-21，对 `AffineSubspace ℝ (Ambient d)` 取 `sInf`，配合 `IsAffineNPlane n S`）；`IsAffineNPlane` 用 `Module.finrank ℝ S.direction = n`（`Kernel/LeastSquaredExcess.lean:20-21`）；`quadraticPlaneError = (r^(n+2))⁻¹ * ∫ x in ball a r, infDist x S ^ 2 ∂μ`（:23-25）与 `squaredExcess`（:27），正是 tex 的 $e_\mu^2$。$b$ 的"洞"项由 `directedBallDeviation` 的第二方向（平面到集合）实现，说明 tex 的 $b_\sigma$ 的双 sup 结构被拆成两个有向量再相加，与 `bilateralPlaneError` 的"和除以 $r$"一致。

### §7.6 核心问题三：整数范围在机器里的表达与额外假设

`4 ≤ d`、`2 ≤ n`、`n + 2 ≤ d` 这三个字符串在全树里只出现在 3 个语句位置：`Model.lean:43`（`QuantitativeFullStatement`）、`Foundations/MeasureBounds.lean:31`（`FullStatement`）、`BallMaps.lean:23`（`exact_unfolded_ball_map_conclusion`）。另有 `Nets/SupportCellOverlaps.lean:116` 出现一个同名假设 `hd`，实测它是格半径不等式，并非范围假设，不计入。

机器里没有用 `d - 2` 这种减法，是把 tex 的 $n\le d-2$ 写成加法形式 `n + 2 ≤ d`，这是避免自然数截断减值的常规手法（`Nat` 上 $d-2$ 在 $d<2$ 时为零，会让假设失去含义）。两个端点证明都丢弃了 $4\le d$：`Uniformity/Rectifiability.lean:89` 起是 `intro d n _hd hn hnd C hC D`，`4 ≤ d` 被命名为 `_hd`（前导下划线即"从不使用"）；另一个端点 `PerMeasure.lean:25` 同样是 `intro d n _hd hn hnd μ hreg hAD hRiesz`。随后 `cases n with | zero => omega` 用 `2 ≤ n` 排除 $n=0$，`have hnd' : p + 1 ≤ d := by omega` 从 `n + 2 ≤ d` 与 `n = p+1` 推出 `p + 1 ≤ d`。

内部机器的维度假设普查（固定串匹配 `grep -F`，我一开始用 ERE `p + 1 ≤ d` 匹配失败，因为 `+` 在 ERE 里是量词）：`n ≤ d` 出现在 45 处、38 个文件， binder 形式 `(hnd : n ≤ d` 45 次；`p + 1 ≤ d` 出现在 33 处、23 个文件，binder `(hnd : p + 1 ≤ d` 32 次；`0 < n` 出现在 34 处、27 个文件。除此之外没有任何算术假设。也就是说：除了 tex 的范围之外没有被迫增加任何假设；反而 tex 的范围比机器所需的更强（$d\ge4$ 被丢弃，$n\ge2$ 只用来消掉 $n=0$ 分支）。tex 侧同样是 $d-2$ 只在 `00-introduction.tex:62` 与 `08-consequences.tex:45` 出现，中间章节只需 $1\le n<d$。

全树普遍的重索引 `n = p + 1`（配合 `Nat.succ_pos p`，实测 4 处；类型写成 `Ambient (p + 1)`）是机器把 `0 < n` 免费拿到的手段，代价是维度不等式统一变成 `p + 1 ≤ d`。这个模式与 tex 的差别是纯机械的，但它解释了为什么 `4 ≤ d` 无用：`2 ≤ n` 与 `n + 2 ≤ d` 已经蕴含 `4 ≤ d`，`omega` 决策器能自己推出来。

### §7.7 核心问题四：五步链条的行数归属

第一步是关键词普查（文件数 / 命中数）：`reflectionless` 14/65、`bilateral` 139/404、`BilateralBeta` 56/154、`restart` 145/479、`cleanSupportCell` 76/322、`LipschitzWith` 229/552、`Haar` 22/124、`Bessel` 13/53、`Schur` 4/7、`Carleson` 8/15、`excess` 29/137、`height` 157/806、`Fourier` 13/170、`Schwartz` 85/740；而 `corona`、`Bate`、`David`、`Semmes`、`BWGL`、`weakGeometric` 在 824 个文件里是 0 命中。

第二步是按文件名做互斥归属（每个文件只算第一次匹配到的步骤，总和校验为 824 文件 / 65,638 行）：

| 归属 | 文件数 | 行数 |
| --- | --- | --- |
| S07 重启 / 图块装配（tex 里没有对应步骤） | 162 | 14,159 |
| S01 模型与核 | 111 | 9,433 |
| 未归属（通用支撑 / 覆盖 / 顺序） | 165 | 12,288 |
| S02 平坦球 | 83 | 6,256 |
| S04 高度紧致性 | 76 | 6,218 |
| S03 平面极限 | 69 | 5,395 |
| S05 刚性 | 67 | 4,887 |
| S07 beta 打包 | 51 | 3,980 |
| S06 excess 传播 | 40 | 3,022 |

结论有三条。（1）单个最大的消费者是"重启 / 图块装配"这一块，14,159 行，而它在 tex 的五步链条里根本没有对应物：tex 用 thm:bwgl（David--Semmes 双边判别法）+ Bate--Hyde--Schul 的推论一步跨到"大块 Lipschitz 像"，机器里则用 `Restart`/`Surfaces`/`Projections` 三个目录把球图块逐个装配出来。（2）论文五步之中，第（1）步（平坦球）与第（2）步（高度紧致性）是最大两块（6,256 与 6,218 行），与 tex 的体量分布（02 是 30,656 B、04 是 22,215 B）方向一致。（3）第（4）步 excess 传播是具名步骤里最小的（40 文件 / 3,022 行），而第（5）步的"几何判别"部分几乎不存在（关键词 0 命中），它的角色被 `Restart` 的预算递归取代；第（5）步里被形式化的是 `Packing`（39 文件 / 3,056 行）与 `Uniformity`（4 文件 / 787 行）承担的 Carleson 打包与最终输出。

第（3）步的刚性子链在 `Rigidity/`（57 文件 / 4,592 行）里，名字能直接对上 tex：`FractionalFourierMultiplier`、`FractionalRadialSymbol`、`PointSupportedFiniteJet`、`TemperedFiniteOrderBound`、`polynomial_tail_has_degree_one_representative`，以及 `Rigidity/AffineHeightRigidity.lean:15-32` 的 `represented_fractional_height_ae_affine`（尾巴假设写成 `IntegrableOn (fun x => |w x| * inverseDistancePow (p+1+2) 0 x) (closedExterior 0 1)`，即 tex 的 $(1+\lvert x\rVert)^{-n-2}$ 可积性，用 `p+1+2` 表达 $n+2$）与 :34 的 `common_height_intrinsic_ae_affine`。定理名前缀普查（取 `theorem` 名的首词）：`exists` 272、`active` 135、`finite` 90、`fractional` 75、`cell` 62、`compact` 61、`capped` 48、`bounded` 43、`dyadic` 42、`riesz` 37、`scalar` 35、`normalized` 35；以 `quantitative_` 开头的定理有 16 个。

战术词频（行首第一个 token，允许前导空白，取前十）：`have` 6071、`rw` 2033、`exact` 1920、`intro` 1220、`let` 1112、`apply` 978、`obtain` 938、`simpa` 720、`refine` 605、`change` 597；随后是 `simp` 466、`calc` 455、`linarith` 316、`unfold` 276、`ENNReal.ofReal` 273、`filter_upwards` 251、`ring` 227、`Tendsto` 208、`nlinarith` 200、`by_cases` 183、`dsimp` 143、`classical` 135、`by_contra` 118。用"行内任意位置"的宽松口径另外测得：`positivity` 785、`linarith` 673、`norm_num` 465、`ring` 418、`integral_congr` 80、`aesop` 0。`have` 与 `rw` 的绝对优势、`aesop` 的 0 次使用、`ENNReal.ofReal` 与 `filter_upwards` 的高频，我读出的机器风格是：测度论不等式靠手工链式放缩推进，几乎不依赖自动搜索；`ENNReal.ofReal` 的 273 次是 $\mathbb R$ 与 $\mathbb R_{\ge0\infty}$ 边界（AD 常数与测度值都在 `ENNReal`）的税。

重启 / 图块装配里的关键常数（这些是我判断"tex 与 Lean 的定量分歧有多大"的直接证据）：

| 记号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| `latticeRadius R k` | $R\cdot 64^{-k}$ | Nets/RegularLatticeScales.lean:13 | 全部胞元与 `AdmissibleRadius` 判断 | 改回 $2^{-k}$ 需重做 `32^n`、`/8`、`/64` 三处损失记账 |
| `activeProjectionError d ε` | $(2048+1048576\cdot 9^d)\varepsilon$ | Restart/ActiveProjectionLocalComparison.lean:16-17 | `SurfacePieces` 与 `RestartBudgets` 的假设 | 系数减小则 `closedBall` 覆盖引理（Surfaces）不再闭合 |
| $\varepsilon\le 2^{-48}$ | `1/281474976710656` | Uniformity/SurfacePieces.lean:202-222 | `quantitative_recursive_chart_from_surface_pieces` | 放宽则该 ε 不再满足 `activeProjectionError d ε ≤ 1/128` |
| `activeProjectionError d ε ≤ 1/128` | $1/128$ | Uniformity/SurfacePieces.lean:202-222 | 同上（:229-252 的假设） | 改 $1/64$ 则投影误差吞掉图块的平坦余量 |
| `Bad i` 孔径 | `1024 * i.radius` | Uniformity/SurfacePieces.lean（`Bad := fun i => ε ≤ bilateralBeta n μ i.center (1024*i.radius)`） | 打包谓词 | 孔径缩小会漏检非平坦球，θ 的下界不成立 |
| 损失预算 | `(ofReal G + activeRegionStopMassAreaConstant n G) * μH[n] ((range model ∩ closedBall center (3*radius)) \ E q) ≤ ofReal δ * μ q.cell` | Uniformity/SurfacePieces.lean:202-222 | 重启停止条件 | 系数 3 改 2 则覆盖半径不足 |
| `restartChartStepConstant d N P M` | `max M (max 1 (max (immediateChildAssemblyConstant d M) (activeCellFinitePieceAssemblyConstant d N P M)))` | Restart/RestartChartStepBounds.lean:21-24 | `badBudgetChartConstant` | 去掉 `max 1` 则塔深递归的单调性丢失 |
| `badBudgetChartConstant step b` | 原始递归塔：`0 => step 1`，`b+1 => step (… b)` | Restart/RestartCoverageInduction.lean:24-26 | 最终 Lipschitz 常数 | 展开成显式界不可行，改动即失去存在性形式 |
| $\theta$ | `(1 - 1/2) / (C * 32 ^ (p + 1))` | Uniformity/Rectifiability.lean:89-120 | `BallImageConclusion` 的第一分量 | $32$ 换成 $16$ 需要重做格半径 $1/64$ 的全部放缩 |
| Lipschitz $M$ | `M * (1/4)`，$M$ 为塔值 | Uniformity/Rectifiability.lean:89-120 | `BallImageConclusion` 第二分量 | 去掉 $1/4$ 则 `exists_rescaled_ball_chart` 的重标度对不上 |

端点证明的实际调用（`Uniformity/Rectifiability.lean:89-120`）只有两个大定理：`quantitative_uniform_restart_surface_pieces (Nat.succ_pos p) hnd' C G hC hG` 与 `quantitative_recursive_chart_from_surface_pieces hnd' C G D hC hG 1024 ε ... (1 / 2) ...`，其中 `1024` 是孔径、`1/2` 是质量占比参数（对应 θ 里的 `1 - 1/2`），退化情形由 `ediam_eq_zero_iff` 在 `¬ μ.support.Nontrivial` 时处理，端点证明的实际调用只有两个大定理（`Uniformity/Rectifiability.lean:89-120`），退化情形由 `ediam_eq_zero_iff` 在 `¬ μ.support.Nontrivial` 时处理，这与 tex 在 `07-packing-endpoint.tex:337` 之后的退化分支一致。

## §8 外部文献检索

这一节只做一件事：把论文引用的每个外部对象，与我能真正拿到的一手材料对齐，并把拿不到的部分显式降级。检索面分三层。第一层是书目文件本身，`E:\math\preprints\Riesz-transforms-and-uniform-rectifiability-in-higher-codimension-September-24-2026\build\references.bib`，实测 186 行、18 个条目（`grep -c "^@"`）。第二层是 tex 正文的引用点，实测 `\cite` 命令 31 处、键实例 32 个（`00-introduction.tex:73` 一行同时给两个键）、被引键 15 个、未被引键 3 个。第三层是外部接口：arXiv 摘要页 6 次、arXiv HTML 正文渲染 3 次、arXiv API 查询 2 次、Numdam 目录页 1 次、WebSearch 3 次。全程没有打开任何 PDF，目标论文自身的 PDF 在本仓库是加密的，规则上也禁止；`references.bib:28` 给的是 Farag 的 msp PDF 直链，我只读了它旁边的字段，没有取文件。

### §8.1 强度口径的定法

| 代号 | 我实际拿到什么 | 能支撑哪类断言 | 撑不住哪类断言 |
| --- | --- | --- | --- |
| A | 接口原文返回的摘要页或 HTML 正文段落 | 该文的主题、维度范围、主定理的口头形状 | 内部编号、证明细节、任何常数 |
| B | 出版社或仓库目录页的元数据（标题、卷号、页数、DOI） | 书目字段没写错 | 任何内容性断言 |
| C | 只有 `references.bib` 的字段加上 tex 里 `\cite[...]{key}` 这一事实 | "本文声称某文献某节含某结论"这件事本身 | 该声称是否为真 |
| D | 检索接口返回零个相关命中 | 只支撑"我拿不到"这条日志 | 关于该文献的任何断言 |

我自己给的规则：C 级与 D 级的文献内容一律带 `[推测]` 出现，即使 tex 的声称看起来无害，即使我内心倾向相信它。这一节里凡没有出现"接口返回"四个字的内容，都是推测。

### §8.2 条目对齐表（18 条全列，逐条给位置）

| bib 键（`references.bib` 行号） | tex 引用点（文件:行） | 一手取得物 | 强度 |
| --- | --- | --- | --- |
| `DavidSemmes1991`（1-9） | `00-introduction.tex:73`（双键行） | Numdam 目录页：Astérisque 193、1991、147 页、无摘要、无章节目录 | B |
| `DavidSemmes1993`（88-97） | `00-introduction.tex:73`、`01-background.tex:267`、`07-packing-endpoint.tex:331`（`[Chapter~II.2]`） | 无 | C |
| `MattilaMelnikovVerdera1996`（10-19） | `00-introduction.tex:82` | 无 | C |
| `Farag2000`（20-29） | `00-introduction.tex:84`（`[Theorem~4]`） | 无；1 次 WebSearch 零相关命中 | D |
| `NazarovTolsaVolberg2014`（30-41） | `00-introduction.tex:86`、`:89`（`[Section~1]`）、`02-flat-balls.tex:23`（`[Section~14]`）、`:236`（`[Section~10]`）、`:508`（`[Section~15]`） | arXiv 1212.5229 摘要原文（"d-dimensional Ahlfors-David regular measure in $\R^{d+1}$"、"non-BAUP David-Semmes cells form a Carleson family"）、备注字段"88 pages" | A |
| `MasTolsa2014Variation`（64-75） | `00-introduction.tex:92`（`[Theorem~1.3]`）、`08-consequences.tex:95-98`（Thm 2.3 / Def 2.1 / Thm 1.3） | arXiv 1109.0466 摘要原文（"For 0<n<d integers and r>2 ... if and only if the r-variation ... is a bounded operator in $L^2(M)$"） | A |
| `Tolsa2008PrincipalValues`（76-87） | `00-introduction.tex:112`（`[Theorem~1.1]`）、`:155`（`[Theorem~1.3]`） | arXiv 0708.0109 摘要原文（"$E\subset R^d$ with $H^n(E)<\infty$"、"if and only if the limit exists $H^n$-almost everywhere"） | A |
| `Tolsa2015Uniform`（98-109） | `00-introduction.tex:120`（`[Theorem~2.5]`）、`:128`（`[Section~3]`）、`:130`（`[Theorem~2.4]`）、`07-packing-endpoint.tex:332` | arXiv 1310.0658 摘要原文（"weak constant density condition"、"already proved by David and Semmes in the cases n=1, 2 and d-1"、"n-uniform measures ... satisfy the big pieces of Lipschitz graphs property"） | A |
| `Tolsa2025BAUPP`（42-50） | 正文零命中（实测 `grep` 无该键） | arXiv 2509.26547 摘要原文（"$\mathbb R^{n+1}$"、BAUPP = bilateral approximation by unions of parallel planes、BWGL = bilateral weak geometric lemma、BAUP = bilateral approximation by unions of planes、"solve the David-Semmes problem in codimension one"） | A |
| `Tolsa2026ICM`（51-62） | `00-introduction.tex:104`（`[Question~4.4]`） | arXiv 2607.16457 摘要页（ICM 2026 大会报告、pp. 313-340）+ HTML 正文局部返回的 Question 4.4 原文 | A |
| `BateHydeSchul2023`（110-118） | `09-geometric-conventions.tex:12`、`:35`、`:58`、`:63`、`07-packing-endpoint.tex:333`（四处理论编号：Thm 1.0.4、Def 3.1.3、Thm B、Prop 9.0.2 与 Lem 9.0.4） | 无 | C |
| `AzzamMourgoglouVilla2023`（119-126） | `01-background.tex:266`（`[Section~4, p.~12]`） | 无 | C |
| `JayeNazarov2018I`（127-138） | `00-introduction.tex:123`、`03-planar-limits.tex:485` | arXiv 1409.8556 摘要原文（"s-dimensional Calderón-Zygmund operator T acting in $\R^d$, where $s\in(0,d)$"） | A |
| `JayeNazarov2013`（139-146） | `02-flat-balls.tex:26`（`[Section~5 and Appendix~B]`） | arXiv 1309.6661 摘要原文（含应用："the $s$-dimensional Riesz transform of a non-trivial $s$-dimensional measure is unbounded if $s\in(d-1,d)$"）与备注字段"preliminary version" | A |
| `DipierroSavinValdinoci2019`（147-158） | `00-introduction.tex:187`、`05-fractional-rigidity.tex:11` | 无 | C |
| `FeffermanStein1972`（159-167） | 正文零命中 | 无 | C |
| `Hormander2003`（168-177） | `05-fractional-rigidity.tex:542`（`[Theorem~2.3.4]`） | 无 | C |
| `Mattila1995`（178-186） | 正文零命中 | 无 | C |

这张表里 A 级有 7 条、B 级 1 条、C 级 9 条、D 级 1 条。换句话说它是本节最硬的部分：A 级的七条我都有接口返回的原文，其余十一条只有书目字段。

### §8.3 David--Semmes 原始问题：我能对齐到的最外一层

论文对自己起点的定位写在两处。`00-introduction.tex:71-78` 说 David 与 Semmes 把一致矩形性发展成形，然后一句 "Their question asks whether the boundedness of the Riesz transform alone forces this geometry for an integer-dimensional regular measure"；摘要 `build\paper.tex:41-42` 直接写 "This gives a positive answer to the David--Semmes Riesz-transform question in its remaining higher-codimension range"。这两句都属于论文自述，我在 §0 已经划过边界：它们不能当外部证据用。

我拿到的最硬外部对齐来自 Tolsa 的 ICM 报告 HTML 正文，接口原样返回了 Question 4.4 的文本："Question 4.4. For 1<n<d-1, if μ is n-Ahlfors regular and ℛⁿ_μ is bounded in L²(μ), is then μ uniformly n-rectifiable?"，以及它前面的一句："The David-Semmes problem is still open when n is an integer such that 1<n<d−1:"。这三件事对得上：本文的范围 $2\le n\le d-2$（`00-introduction.tex:62`）恰好是 Question 4.4 的 $1<n<d-1$；本文引用的 `[Question~4.4]` 编号与 HTML 里的编号一致；那个"剩余高余维范围"的说法有外部独立来源。这一条我从 C 级抬到了 A 级，是这次检索里最值的一次。

Astérisque 193 本体我只拿到目录页：卷号、年份、147 页都对得上 `references.bib:3-7`，页面没有摘要、没有章节目录，也没有出现 "uniform rectifiability" 字样。所以"原始问题在 1991 年书里长什么样"这个问题我没解决，`[推测]` 它的最初陈述与 Question 4.4 形状相同但不一定逐字相同；`[推测]` 论文选 `references.bib:1-9` 与 `:88-97` 两条并列引用，是因为 1991 卷给问题、1993 卷给判别法。1993 卷（Mathematical Surveys 38）我完全没取，它却在端点承担关键一步：`07-packing-endpoint.tex:331` 用 `[Chapter~II.2]` 引 David--Semmes 双边判别法喂给 thm:bwgl。也就是说我笔记 §5.8.3 里那条"链条把外部定理当黑箱"的判断，强度只能停在 C：我没有翻过 Chapter II.2，无法确认那里的陈述是否含有限直径假设（`09-geometric-conventions.tex:58-63` 一整段就是在处理这个假设差）。

### §8.4 已解范围与本文范围的接缝，以及一个归属冲突

论文的分工表是这样写的：$n=1$ 且环境维任意交给曲率方法（`00-introduction.tex:82-84`，引 Farag `[Theorem~4]`），平面 $n=1,d=2$ 交给 Mattila--Melnikov--Verdera（同处，`:80-82`），余维一交给 Nazarov--Tolsa--Volberg（`:85-86`），$1<n<d-1$ 是剩余范围（`:103-104`）。

外部对齐结果有两处偏差值得记下来。

第一处是 $n=1$ 的归属。ICM 报告 HTML 返回的句子是："In the case n=1 the answer to this question is known, and it is true, as shown by Jaye and Nazarov in [61]"。而本文把同一格让给 Farag 2000，且 `references.bib:127-146` 收了 Jaye--Nazarov 两条（1409.8556 与 1309.6661）却在正文里从不用于 $n=1$。我试图把 [61] 落到具体文献：ICM 页面的参考文献列表被截断，接口三次返回都没给出 [61] 与 [90] 的条目文本，所以这条冲突我无法在 A 级消解。`[推测]` [61] 是 Jaye--Nazarov 系列中处理一维情形的部分（可能正是被本文标为 `JayeNazarov2018I` 的那篇，其 arXiv 摘要只写一般 $s\in(0,d)$ 理论，没有 $n=1$、AD 正则或一致矩形性字样，故摘要层面看不出它能否承担这个归属）。`[推测]` Farag 的 Theorem 4 给出的是曲率型充分条件，与 Question 4.4 的假设形式不完全同型，本文把它当"已解"用可能偏松。这两条推测都记在这节，不去改 §5.1.3 里已经落盘的正文还原。

第二处是余维一的陈述形状。NTV 摘要原文用的是 "$d$-dimensional Ahlfors-David regular measure in $\R^{d+1}$"，并且结论先给的是"非 BAUP 的 David--Semmes 方体组成 Carleson 族"，再由 David--Semmes 的结果转成一致矩形性。这与本文 §5.8 的路线（先打包、再双边判别法）形状相同，是外部对齐成功的一格。ICM 报告还返回了 "The case of codimension one for d>2 is due to Nazarov, the author, and Volberg [90]"，说明余维一的完整覆盖里 $d=2$（即平面 Cauchy 情形）被单列，这也和本文把 MMV 1996 单独写进 `:80-82` 的处理一致。

### §8.5 "最大原理障碍"这句声称的对齐结果

`00-introduction.tex:87-89` 是全文最需要外部验证的一句：它替 NTV 报告了障碍所在，并精确到节（`[Section~1]`）。我先查 arXiv 摘要页，接口明确回答：摘要不含 maximum principle、不含 codimension one、不含 higher codimension。摘要层面对不齐。然后我查 Tolsa 的 ICM HTML 正文，接口返回："The main obstacle to answer this question by the same techniques as in [90] is the absence of a suitable maximum principle for functions of the form ℛn η for n<d−1"。两句在同一位作者笔下重合，本文那句"他们报告没有已知的高余维类比"由此在 A 级得到间接证实（证实的对象是"障碍确被报告"，不是 NTV 原文的逐字表述，因为 Acta 原文与 Section 1 我没取到，强度仍是 C）。

这件事对 §3 的意义我单独记一下：我在 §3 把关键转折定在 lem:height-energy 的归一化那一步，理由是"论文主动避开了需要最大原理的那类论证"。现在这句"避开"有外部依据了，不再只是我从正文缺位反推的姿态判断。

### §8.6 变化度假设与 cor:variation 的外部消费

`00-introduction.tex:90-102` 用 Mas--Tolsa 做假设对照：$\rho$-变化度在 $L^2(\mu)$ 有界（$\rho>2$），控制的是跨尺度的变化，并非每个截断各自有界，本文假设只有 `eq:riesz-bound` 的公共界。arXiv 1109.0466 摘要原文返回 "For 0<n<d integers and r>2 ... if and only if the r-variation for the Riesz transform with respect to M is a bounded operator in $L^2(M)$"。维度范围（$0<n<d$ 整数）与指数（$r>2$）都对得上；"if and only if" 的双向也在摘要里，而本文只取它的一侧。

`08-consequences.tex:91-99` 是真正的消费点：cor:variation 的向后方向交给 Mas--Tolsa 的 Theorem 2.3 的 $(a)\Rightarrow(c)$ 与 $(a)\Rightarrow(b)$ 两个前向条款、Definition 2.1 提供固定截断剖面、Theorem 1.3 覆盖向量 Riesz 族，然后一句 "Their range $1\le n<d$ contains the present one" 把本文范围塞进去。摘要页面不含任何定理编号，所以这四个内部编号我停在 C 级：`[推测]` Thm 2.3 的前向条款就是"一致矩形性推出变化度有界"，`[推测]` Def 2.1 的截断剖面与本文 `08-consequences.tex:44-60` 写的固定剖面同型。这两条推测直接关系到 §5.9.1 的 (b)：如果 Definition 2.1 的剖面是光滑截断，并非本文的硬截断，那 cor:variation 的陈述就得先在两种剖面之间搬运，而 tex 只在 `08-consequences.tex:88-100` 用了一句"Their Definition~2.1 is precisely the fixed cutoff above"，没有给搬运过程。这处接缝我只记录，不改判。

另外我在 §5.9.1 提到的"有界支撑化归无界支撑"用了 `08-consequences.tex:101-130` 的 $\sigma=\mu+\H^n\restrict P$ 构造，这一步纯属本文，不需要外部输入； Mas--Tolsa 只被用来接已证的 $E$ 外几何，这一点 tex 的处理是干净的。

### §8.7 Tolsa 2008 主值线：假设类型的差别是否被正确陈述

`00-introduction.tex:109-114` 的声明有两半：Tolsa 用主值几乎处处存在刻画了普通可矩形性（前提是 $\H^n$ 有限测度），并且该文既不假设 `eq:riesz-bound` 也不给定量球参数化结论。arXiv 0708.0109 摘要原文给出 "$E\subset R^d$ with $H^n(E)<\infty$" 与 "E is n-rectifiable if and only if the limit exists $H^n$-almost everywhere in E"，另外一句说证明靠 Lipschitz 图上 $n$ 维 Riesz 变换 $L^2$ 范数的上下精确估计。第一半在 A 级证实。摘要没有给维度范围（是否覆盖全部 $0<n<d$），所以 `[推测]` 它对所有整数 $n<d$ 成立；这一点无关紧要，因为本文用的是"假设类型不同"，并非"范围不同"。

第二半是负向陈述（"neither assumes ... nor asserts ..."），摘要层面无法验证它没写过什么，我停在 C 级；`[推测]` 一个只能给出 a.e. 结论的定理确实不可能同时给出 def:ur 里那种带 $\theta,M$ 的定量大块结论，这个推测我认为安全。

同一节 `00-introduction.tex:153-157` 引 `[Theorem~1.3]` 说"小斜率 Lipschitz 图上用法向分量控制几何偏差"在 Tolsa 2008 里有定量版本。这条我完全停在 C 级：摘要里没有 Theorem 1.3，也没提法向分量。它在我的还原里只是一个"本文不是从图上开始"的对照（§4.3 用过），不承担链条正确性。

### §8.8 Tolsa 2015 一致测度线与 Preiss 刚性：一处书目缺口

`00-introduction.tex:116-134` 把两件事归给 Tolsa 2015：一是 BWGL 的 Euclidean 全半径形式（`[Theorem~2.5]`，在 `07-packing-endpoint.tex:332` 再次被引），二是平坦子球与稳定性步骤（`[Section~3]`），并补一句"稳定性用 Preiss 在无穷远处的刚性，见 `[Theorem~2.4]`"。arXiv 1310.0658 摘要原文给的是："if μ is an n-dimensional Ahlfors-David regular measure in $\R^d$, which satisfies the so-called weak constant density condition, then μ is uniformly rectifiable"，并说"已在 $n=1,2$ 与 $d-1$ 情形由 David 和 Semmes 证得，其余 $n$ 是开问题"，以及"证明靠研究 $\R^d$ 中的 $n$-uniform measures，并证它们满足 Lipschitz 图大块性质"。摘要不含 flat measures、Preiss、BWGL、$n<d$ 范围这些词，所以 Theorem 2.4、Theorem 2.5、Section 3 三处内部编号全停在 C 级。

书目的缺口在这里：`Preiss` 这个名字在 tex 里只出现一次（实测 `grep -n "Preiss"` 在 `build` 下唯一命中 `00-introduction.tex:129`），`references.bib` 18 条里没有 Preiss 的独立条目（实测 1-186 全列）。也就是说 Preiss 1987 那篇关于切测度与整可矩性定理的文章被以人名方式提及、只通过 Tolsa 2015 的 Theorem 2.4 间接进入本文。这对我 §2.2 的失败路线二是一条硬证据：我原本打算把"极限测度分类"当第一步，而论文的自述显示它把这类刚性留在对照位（"Here AD regularity gives two-sided comparisons rather than exact ball masses"，`:131-134`），并且明说自己"不需要一致测度刚性输入"。`[推测]` 本文正文里没有任何地方真正用过 Preiss 定理，我用 `grep` 查过 tex 全树，除这一句提及之外无使用点，与推测一致。

`00-introduction.tex:126-131` 还有一句关键分工："There the ball masses are exactly proportional to $r^n$"，即 Tolsa 2015 依赖精确球质量，本文只有双侧比较。这句与我 §2.1、§2.2 的失败经验一致：精确质量是紧致性的免费输入，双侧比较必须由能量自己造紧致性，这正是 lem:height-energy 到 lem:moving-compactness 那段在做的事。

### §8.9 BAUPP 2025：一条进了书目却从未被引的文献

`references.bib:42-50` 收了 `Tolsa2025BAUPP`（arXiv 2509.26547），我在 tex 全树实测零命中（`grep` 该键，无输出）。摘要原文返回："if $\mu$ is an $n$-Ahlfors regular measure in $\mathbb R^{n+1}$ such that the $n$-dimensional Riesz transform is bounded in $L^2(\mu)$ and the so-called BAUPP ... holds ..., then $\mu$ satisfies the BWGL ..., and so $\mu$ is uniformly $n$-rectifiable. In this way, one can solve the David-Semmes problem in codimension one without relying on the BAUP ... criterion of David and Semmes."。接口还确认该文明确只在余维一（"$\mathbb R^{n+1}$"、"in codimension one"），没有处理 $n<d-1$。

三个我用得上的结论。第一，BAUPP、BWGL、BAUP 三个缩写的外部定义拿到了 A 级来源，我在 §5.8.3 与 §6 台账里对 BWGL 的用法与之相容。第二，这篇不覆盖高余维，所以它不能替本文做任何事；tex 也确实没引它，这条零命中不是我的 grep 失误。第三，它留在书目里说明写作过程中曾打算用它（大概是引言或端点），后来被 `Tolsa2015Uniform` 的 `[Theorem~2.5]` 取代；`[推测]` 取代的原因是 2025 那篇的结论假设里带 BAUPP，而本文端点需要的是纯双边平方积分判别法。

顺带同类：`FeffermanStein1972`（`references.bib:159-167`）与 `Mattila1995`（`:178-186`）也是正文零命中。三条未引条目的后果是排版层面的：`build\paper.tex:57-58` 用的是 `\bibliographystyle{amsplain}` 加 `\bibliography{references}`，全树没有 `\nocite`（实测 `grep -n "nocite\|printbib"` 只命中这两行），`[推测]` 按 amsplain 的语义这三条不会出现在打印出来的参考文献表里，build 目录里没有 `.bbl` 或 `.blg` 产物（实测 `find` 无），所以我无法用编译产物验证这条推测，只能停在规则推断层。

### §8.10 曲率/对易子线与反例线：两块没能升上去的材料

任务点名要查的两条线里，第一条我彻底失败。Mattila--Melnikov 曲率与对易子这条线（1994 Acta 那篇以 Calderón 计划为名的合作，以及它对 $n$ 维 Riesz 变换的延伸），我做了 1 次 WebSearch（关键词组合含标题与期刊），接口返回 5 个中文索引页与 1 个 wiki 页，零个相关命中；`references.bib` 里只有 `MattilaMelnikovVerdera1996`（10-19）与 `Mattila1995`（178-186，且未被引）两条，没有 1994 年那篇的条目。因此本文 `00-introduction.tex:80-84` 用曲率方法串起 MMV 与 Farag 的这条叙事，我没有任何一手支撑：`[推测]` 曲率/对易子线给出的是"$n=1$ 或特殊范围的充分性"，`[推测]` 它在 $n\ge2$ 的一般 Riesz 变换上没有对应物，这正是本文为何在高余维绕开它。强度 D，全部标推测，且不作为我笔记里任何一步的证据。

第二条线部分成功。Nazarov--Volberg 反例线，我用 1 次 WebSearch（关键词含 non-doubling、weak type (1,1)、heat ball），返回零个一手页面；但我从 `JayeNazarov2013` 的 arXiv 摘要里拿到了一条同族的一手陈述："in $\mathbb{R}^d$, the s-dimensional Riesz transform of a non-trivial $s$-dimensional measure is unbounded if $s\in(d-1,d)$"，即 Eiderman--Nazarov--Volberg 的分数维反例。这条是 A 级，它给出的信息是：在 $s$ 越过 $d-1$ 之后连"有界"本身都不可能成立，因此本文把整数维范围限制在 $n\le d-2$ 不是修辞选择，是被这条已知障碍压出来的。`[推测]` 整数情形 $n=d$（测度活在整空间上，但作为"$d$ 维 Riesz 变换在别的支持上"）另有平凡性；这一点我没有任何来源，只是把 ENV 陈述的补集写出来。至于任务描述里 Nazarov--Volberg 那条更常见的"非双倍测度上 Calderón--Zygmund 算子端点反例"传统（`FeffermanStein1972` 的 $H^p$ 与极大算子线在书目里躺着但未被引），我停在 D 级：`[推测]` 本文之所以用硬截断一致有界，并非主值存在，正是为了不把证明押在这类端点反例的边界上。

另外记一个 D 级的失败：Farag 2000 的 `[Theorem~4]`。1 次 WebSearch 返回的 10 个链接里没有一个指向 msp 或 Euclid 的该文页面，全是无关中文条目；`references.bib:28` 给的直链是 PDF，按规则我不取。于是本文"$n=1$ 由高余维曲率方法解决"这块分工，我既没有一手也没有二手，只有 tex 的一句话。我在 §5.1.3(b) 解释 thm:main 的 $2\le n$ 下界时引用了这个分工，那处引用因此继承 C/D 级强度，我在 §8.4 已经把它标成推测可复核的对象。

### §8.11 Litzinger--Moraes 与 MDS：检索日志与物理隔离

以下四段是我的检索记录与由它导出的判断，与论文自述无关，不对应 tex 里任何一句。

检索日志。本次会话重跑 2 次 arXiv API：`search_query=all:%22Litzinger%22+AND+all:%22rectifiability%22`，接口返回 total 0；`search_query=au:%22Moraes%22+AND+abs:%22rectifiability%22`，接口返回 total 0。更早的会话里做过 2 次 WebSearch 与 2 次同族 API 查询（`au:"Litzinger"` 返回 15 条全不相关，另一条组合返回 0），加上这次共 6 次，零个一手命中。tex 侧我查了三次：`build` 下全树 `*.tex` 搜 `Litzinger`、`Moraes`、`MDS`、`minimal dense`，实测 0 命中；`references.bib` 1-186 全量读完，无该姓条目；正文对可密度谱/密度测度分类的依赖只在 `00-introduction.tex:126-134` 处以 Tolsa 2015 与 Preiss 的名义出现。

`[推测]` 我在 §1 与 §2.2 把 "Litzinger--Moraes 型 MDS" 写成一条候选路线，其来源是我自己此前读过的密度测度类文献的印象；MDS 这个缩写在本文里不存在，我把它展开成 measure density spectrum 也属于我的展开，不是论文的用法。

`[推测]` 该路线若存在，它需要的是"所有切测度被分类为平面测度"级别的输入，而本文假设只给一个算子范数 $C_{\mathrm R}$；这个缺口与我 §2.2 记录的失败同构，即我试图用外部刚性替代论文自己造出的归一化高度能量。

`[推测]` 本文没有引用它，最经济的解释是：论文的路线根本不需要切测度分类，lem:planar-rigidity（`03-planar-limits.tex:185-479`）用局部 $L^2$ 界与常数密度论证替代了那一整层机器。

我把这四段与 §8.2 至 §8.10 分开写，是为了让"论文说了什么"和"我以为有什么"之间不留混合的可能。这一节里唯一与本文实际引用结构相关的事实是：本文的引用面里根本没有 MDS 这个东西。

### §8.12 分数算子与约定附录的两处 C 级依赖

`05-fractional-rigidity.tex:5-15` 与 `00-introduction.tex:184-187` 两处提到多项式增长函数的分数 Laplacian 定义需要"恰好的外部可积性"，比较对象是 `DipierroSavinValdinoci2019`（`references.bib:147-158`，Rev. Mat. Iberoam. 35 (2019) 1079-1122，DOI 10.4171/RMI/1079）。我没有取这篇的一手页面，强度 C：`[推测]` 该文处理的是整式外尾部在加权意义下的良定义性，与本文 `05-fractional-rigidity.tex:138-152` 里 $(1+\lvert x\rvert)^{-n-2}$ 型尾部的作用是同一族。这个推测影响我在 §5.6.1 对权重指数 $-n-2$ 的机械解释吗：不影响，那一处的推导是我自己从极坐标算出来的，权重指数的必然性不依赖该文。

`05-fractional-rigidity.tex:542` 引 `Hormander2003` 的 `[Theorem~2.3.4]` 支撑一个分布层面的连续性步骤。这条我只在 C 级：`[推测]` 该定理是关于紧支撑分布与 Fourier 变换的基本定理之一（Paley--Wiener 型或支撑定理），被引以排除更高阶 Taylor 项之外的可能。这是 §5.6.2 推导里唯一一处我不掌握一手细节的外部依据；好在该步在链条里只做收尾（把点支撑分布限定成多项式 jets），失败风险低。

约定附录 `09-geometric-conventions.tex` 的三处外部依赖全在同一个键上：`:12` 引 Theorem 1.0.4、`:35` 引 Definition 3.1.3、`:58` 引 Theorem B 的 $(3)\Rightarrow(5)$、`:63` 引 Proposition 9.0.2 与 Lemma 9.0.4，全部指向 `BateHydeSchul2023`（arXiv 2306.12933，书目 `references.bib:110-118`），另外 `01-background.tex:266` 引 `AzzamMourgoglouVilla2023` 的 Section 4 第 12 页来说明尺度与有限直径约定。这两条是整篇论文外部承重最集中、而我强度最低的地方（全 C 级）。风险具体化：thm:bwgl 的有限直径形式靠 BHS 的 Theorem 1.0.4 与 Tolsa 2015 的 Theorem 2.5 两条一起支撑（`07-packing-endpoint.tex:330-333` 一句里三引），我既没读 2306.12933 也没读 1310.0658 的内部编号，因此 §5.8.3 里"附录是在补约定差，并非在补证明"这个判断，属于我从 tex 段落形状做出的推断。书目层面还有一处可记的不自洽：`AzzamMourgoglouVilla2023` 的键名写 2023，而 `year = {2025}` 且 note 里写 "revised 13 November 2025; first posted 2023"（`references.bib:119-126`），这是键名与年份字段的错位，不影响数学。

### §8.13 这节小结（只列强度，不评价论文）

拿到一手原文的：NTV 摘要、Mas--Tolsa 摘要、Tolsa 2008 摘要、Tolsa 2015 摘要、Tolsa 2025 摘要、Jaye--Nazarov 两篇摘要、ICM 报告的 Question 4.4 及其前后三句。拿到元数据的：Astérisque 193 的 Numdam 目录页。API 层确认零结果的：两条 Litzinger/Moraes 组合查询。拿到零相关命中的：Farag 2000、Mattila--Melnikov 1994、Nazarov--Volberg 端点反例三次检索中的两次。完全没动手的：DS1993、MMV1996、BHS2023、AMV2023、DSV2019、Hörmander 2003。### §8.14 对 §8.2 统计句的更正

§8.2 末尾那句强度统计我数错了，正确值在这里给出：A 级 8 条（`NazarovTolsaVolberg2014`、`MasTolsa2014Variation`、`Tolsa2008PrincipalValues`、`Tolsa2015Uniform`、`Tolsa2025BAUPP`、`Tolsa2026ICM`、`JayeNazarov2018I`、`JayeNazarov2013`），B 级 1 条（`DavidSemmes1991`），C 级 8 条（`DavidSemmes1993`、`MattilaMelnikovVerdera1996`、`BateHydeSchul2023`、`AzzamMourgoglouVilla2023`、`DipierroSavinValdinoci2019`、`FeffermanStein1972`、`Hormander2003`、`Mattila1995`），D 级 1 条（`Farag2000`）。18 条全分类完毕，无遗漏。§8.13 里"完全没动手的"那组的承重位置也要更正：`DavidSemmes1993` 的 Chapter II.2 是在 §8.3 讨论的（对应 `07-packing-endpoint.tex:331` 与 thm:bwgl），`MattilaMelnikovVerdera1996` 是在 §8.4 讨论的，`BateHydeSchul2023` 与 `AzzamMourgoglouVilla2023` 在 §8.12，`DipierroSavinValdinoci2019` 与 `Hormander2003` 也在 §8.12。这一节保留错误句原文而不删，是为了让我自己的计数失误可追溯；以本节末两段为准。

## §9 未解问题与下一步

### §9.1 链条里我仍不完全信服的三个接缝

第一处：`lem:annular-average-gap`（`02-flat-balls.tex:515-538`）的地板 $E_0=3C_{\mathrm R}(G2^nM)^{1/2}+3C(n)G$（`:525`）与 `lem:annular-alternative`（`:252-266`）的两次维度归约之间，损失因子的归属我没能逐字对齐。台账 §6 里我记了两条分支（$2^n$ 与 $4^n$，以及 $\eta\to\eta/4096$），但 $E_0$ 的 $\rho$ 次（$1/2$）幂来自把算子界开方，而打包不等式 `prop:oscillation-packing`（`:126-132`）给的是平方和意义上的界；这两处幂次如何互锁，我在 §5.2.5(b) 只写到"开方后成为地板"，没有把常数链条走通。风险具体化：如果真实链条需要 $E_0$ 带 $C_{\mathrm R}$ 的一次幂，并非平方根，那么 `prop:flat-seeds` 的种子质量指数会跟着变，$M(N+1)(1+K)$ 的充能预算（`07-packing-endpoint.tex:28-44`）仍然闭合，但 $K$ 的定义 $K=2J+3$ 里的加性常数会重排。下一步我应该把 `02-flat-balls.tex:538-620` 的三段证明重抄一遍到行级，专查开方发生在哪一行。

第二处：`prop:normalized-excess-limit`（`06-excess-propagation.tex:183-310`）里论文明说倾斜平面的法向部分 $N_j$ 不收敛（`lem:normal-affine-planes`，`:111-127` 只给 $L_j^{*}(L_j+\delta_jN_jA_j')=I$ 这一代数式），却仍取到归一化 excess 的极限。我的还原停在"用 $L_j$ 的子列紧性 + $A_j'$ 的一致界"，但 $A_j'$ 的一致界来自哪里，我在 §5.7.3(c) 归给了 `lem:affine-polarization`（`:36-52`）的极化恒等式，这一步我只做了形式验证（代回展开），没有验证极化在 $n$ 维余维 $\ge2$ 时是否唯一确定对称部分。这关系到 thm:excess-propagation（`:318-353`）假设里 $\delta=2^{-J}$、$K=2J+3$ 的耦合，属于我在台账 §6 标过的脆弱点。

第三处：`thm:bwgl` 到 `def:ur` 的最后一步，即把 $\H^n$ 版的大块换回 $\mu$ 版（`07-packing-endpoint.tex:276-307`）。我在 §5.8.3 记了"双侧比较 + 密度下界"两件事，但 $b_{\sigma}$ 与 $\beta_{\mu}$ 之间质量占比的搬运，tex 用的是逐点包含关系，并非测度论引理；如果支撑的 $\H^n$ 密度下界只在一个 Carleson 意义下成立，那 def:ur 里的 $\theta$ 是否还是同一个 $\theta$ 我没有确认。这一步恰好落在 Lean 侧唯一没有对应物的位置（§7.4：机器里注册的语句是球映射形状，`BallImageConclusion` 在 `Model.lean:34-39`，而 $\H^n$ 比较在 Lean 树里关键词零命中），所以两边同时存疑，值得优先处理。

### §9.2 Lean 侧可执行的下一步

按 §7 的实测数字排优先级。第一，把注册语句与 tex 主定理对齐是最小可行工作：`lean/OAI/Analysis/RieszRectifiability/Foundations/MeasureBounds.lean:30-33` 的 `FullStatement` 是定性孪生语句却未登记（§7.4），若把它补进 `lean/ComparatorChallenges/RieszQuantitative.json` 的 `theorem_names`（现只有一个元素），需要在 `formalization.yaml:1466-1468` 旁新增一条登记项，成本一行级；而反向对齐（把注册语句削弱到 tex 的量化次序）需要动 `Model.lean:41-49` 的 `QuantitativeFullStatement`，那里 $C_{\mathrm{AD}}$、$C_{\mathrm R}$ 是显式参数而 tex 是存在式结论，改动会波及 `Uniformity/Rectifiability.lean:24-87` 的整段陈述层。五处 `admit` 全在 docstring（§7.3 给了五个位置），没有 `sorry`、没有局部 `axiom`、没有 `#print axioms`，所以审计压力低。压力在别处：端点靠 `Uniformity/SurfacePieces.lean:202-222` 的 $\varepsilon\le 2^{-48}$ 与孔径 $1024$ 硬算，而 tex 在同样位置调用外部定理（`07-packing-endpoint.tex:330-333`），这意味着 Lean 版比 tex 版多背了一个 primitive-recursion 预算塔（§7.7 的 `badBudgetChartConstant` 一族）。第三，若要把 14,159 行的 S07-restart-charts 组削减（§7.7 归属表），最可能的入手点是 `Restart/ActiveProjectionLocalComparison.lean:16-17` 的 `activeProjectionError d ε := (2048 + 1048576 * (9 : ℝ)^d) * ε`：$9^d$ 型增长在 tex 里对应的是各向同性常数 $C(n)$ 的线性使用，机器把它显式化后每一步都要重估；不改它的话，$2^{-48}$ 这类地板就改不动。

### §9.3 文献侧的补齐清单

六个 C 级承重项按风险排序：`BateHydeSchul2023`（四处理论编号被约定附录使用，`09-geometric-conventions.tex:12,35,58,63`）、`DavidSemmes1993` Chapter II.2（thm:bwgl 的直接来源）、`MasTolsa2014Variation` 的 Thm 2.3/Def 2.1/Thm 1.3（cor:variation 的全部向后方向）、`Tolsa2015Uniform` 的 Thm 2.4/Thm 2.5/Section 3、`NazarovTolsaVolberg2014` 的 Section 1/10/14/15（本文四段方法自述的归属）、`DipierroSavinValdinoci2019` 与 `Hormander2003` Theorem 2.3.4（各一处收尾）。具体动作：arXiv HTML 渲染层（`arxiv.org/html/<id>v<n>`）是这次唯一给我正文段落的接口，对 2306.12933 与 1109.0466 优先试它；对 1993 卷与 Acta 系（NTV、Tolsa 2008）只能试出版社目录页，强度上限是 B。`Farag2000` 的 Theorem 4 与 ICM 报告把 $n=1$ 归给 Jaye--Nazarov 的冲突（§8.4），必须靠取到 ICM 报告的参考文献表才能消解，而那次接口三次返回都截断在正文末尾；下一步试 SIAM 页面（DOI 10.1137/25M1804054）与 arXiv v2/v3 的 HTML。

### §9.4 我原路线里值得救回来的两个部件

Tolsa 型的 $\beta$ 数路线我在 §2.1 判死，死点是"由截断 $L^2$ 有界直接得 $\beta$ 的 Carleson 估计"缺少跨尺度的正性；但本文实际造了两个可替代品：`def:flatness`（`01-background.tex:244-257`）的双侧平坦 $b_{\sigma}$ 与 `prop:oscillation-packing` 前的振荡泛函 $W_J(Q)$。如果 $W_J$ 能被夹在两个 $\beta$ 之间（$b_{\sigma}\lesssim W_J\lesssim \beta$ 型的单向已在 tex 的 `02-flat-balls.tex:57-125` 隐含），那我在 §2.1 想要的"$\beta$ 数语言"可以在不借最大原理的前提下复活，代价是要重做 `lem:dyadic-test-bessel`（`:43-56`）的 Gram 矩阵部分，把 $B_J=4H_JH_J'$ 的因式分解改写。这是我下一步最想试的数学问题。MDS 路线（§8.11）我仍然认为不可救，因为它要求的外部输入恰好是本文用归一化高度能量替换掉的东西。

还有一个开放问题我不会写进任何结论：本文的 $2\le n\le d-2$ 里，$n=1$ 的缺口是否真的被已有文献闭合。我的外部证据只有 tex 自己的一句话（`00-introduction.tex:82-84`）与一句归属不同的 ICM 陈述（§8.4），两边我都没有一手。链条本身在内部章节只要求 $1\le n<d$（我在 §5.1.3(b) 实测列出六处假设行），所以把 $n=1$ 也纳入并不会撞坏任何引理；也就是说，本文对 $n=1$ 的排除是分工上的礼貌，不是技术上的必需。这个观察如果成立，价值在于它把"剩余范围"的说法变得比论文自述更宽松，我不敢在只有一手缺口下公开它，只作为笔记里的待核事项。

### §9.5 若从头再做一遍，我会先改的三个动作

动作一：先做 §7 的规模统计再读 tex。我实际顺序相反，结果在 §2.4 里花掉一整条失败路线去猜"机器是否已经有 β 数语言"，而 `grep` 的关键词表（§7.3、§7.7：`BilateralBeta` 56 文件/154 行、`Haar` 22/124、`Carleson` 8/15、`corona`/`Bate`/`David`/`Semmes`/`BWGL` 全 0）十分钟就能给答案。动作二：在 §5 的逐条还原里，把"该引理的消费者是谁"作为强制字段先填，因为台账 §6 的依赖链是我最后才反推出来的，两处曾因此对不上（$D=2+2\cdot2^{n+2}b^{2}$ 与 $M=4+2GB^{2}$ 的消费点，我第一版写成"后续使用"，靠重读 `03-planar-limits.tex:114-165` 才定位到 `lem:planar-rigidity` 的第二步）。动作三：任何被 tex 归给外部文献的句子，先做 A/B/C/D 分级再决定它能否进入我的推导；§8.5 那次升格（最大原理障碍）和 §8.4 那次没能消解的归属冲突，是同一纪律的正反例。

