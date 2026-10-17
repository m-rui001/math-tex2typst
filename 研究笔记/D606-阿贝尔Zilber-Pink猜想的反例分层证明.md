## §0 任务设定与登记

这单活是给一篇已经写完的论文做反向工程。论文题为《The abelian Zilber--Pink conjecture》，署名 OpenAI，日期 September 24, 2026。摘要里说：在 $\overline{\mathbb Q}$ 上，阿贝尔簇的每个不可约子簇只有有限多个极大非典型子簇，其中非典型性是放在该子簇最小的包含挠陪集内部来度量的。我要做的，是把自己放回当初研究者的位置，从成品倒推：最初想证明什么，试过哪些走不通的路，哪一步是真正的转折，最后的做法和开头的设想差在哪里。这不是复述论文的正面结构，是把被成品掩盖掉的取舍重新摊开。

之所以值得这样倒推，是因为这篇论文的骨架很反常。它没有走"一条主定理加一个技巧"的短路径，是先证一个带全称量词的非稠密定理（`build/sections/01-introduction.tex:67`），再借助一个由极小反例驱动的辅助序列定理（`build/sections/02-sequences.tex:162`）把它推到底。正面结论靠的是一个关于"反例必须长什么样"的定理撑着，而这个反例结构定理本身又分成全高与带低因子两半。这种写法几乎可以确定，作者起初是想直接攻主定理，碰壁之后才退回到反例分析，并且发现反例的几何形状比正面对象更容易被有限性论证咬住。

这份笔记的组织方式是这样的。前两节交代我拿到手的素材和取证口径，把可引用的行号钉死。接着三节讲最初的动机、我写下的精确陈述，以及第一条被我自己否掉的路线。再往后是转折点和第一条真正走通的全高情形，然后顺着论文后半段逐个交代：尺度分解、投影排除、切障碍、有限方向、极小辅助乘积、两个测度、局部指数、乘积切割，最后回到主定理与有限秩平移推论。收尾两节写最终做法与最初设想的差距，以及我至今仍拿不准、只能标注为推测的缺口。文末是台账。

本笔记取材于唯一目录：

preprints/The-Abelian-Zilber-Pink-Conjecture-September-24-2026

该目录对应队列条目：

其他队列第 425 行号

## §1 素材与取证口径

素材目录下与正文有关的部分只有 `build/` 一棵子树。我先量了结构：顶层有 `paper.tex`（910 字节，只做导言与章节装配）、`macros.tex`（1203 字节，只含宏定义）、`references.bib`，以及 `sections/` 下十个分节文件。分节文件按字节数是：`03-tangent.tex` 23338、`06-arithmetic.tex` 21464、`04-high.tex` 19422、`08-cut.tex` 16975、`05-minimal.tex` 15896、`07-index.tex` 15527、`02-sequences.tex` 15135、`01-introduction.tex` 13433、`10-finite-rank.tex` 5177、`09-finiteness.tex` 4459。另有一张 `figures/low-measures.tex`（1656 字节）是两张测度比较的示意图。合计约 154,595 字节，与派单给的字节数吻合。目录里还有 `paper.pdf` 与 `typst/`，按规格一律不读，也不做任何 PDF 转换。

我把十个分节文件连同 `paper.tex`、`macros.tex` 和那张图各通读了一遍，取证调用共 15 次（含一次列目录）。这份素材属于厚素材：单文件都不到 60,000 字节，但总量足以让每个论断都能找到落点。规格要求首次落盘落在第 16 至 30 次调用之间，我的第一次落盘落在第 18 次调用，在窗口内。

宏定义文件里有一批只在该论文内部使用的自定义记号：一个表示代数闭包的记号、一个表示乘积阿贝尔簇的记号，以及若干把常见算子名（李代数、同态、自同态、余维数、秩、非典型度）包成短命令的写法。规格要求把它们一律展开成标准写法，我在正文里全部改写成 `\overline{\mathbb Q}`、`\mathcal A`、`\operatorname{Lie}`、`\operatorname{Hom}`、`\operatorname{End}`、`\operatorname{codim}`、`\operatorname{rank}` 这类形式。按规格，连"我不用这些宏"的清单里也不出现它们的名字，所以这里只用类别描述。素材里的公式标签形态一律不原样抄进正文，凡要指向素材位置，我写 `文件.tex:行`。

还有几条口径先立好。所有高度与算术相交数都是绝对的，按定义域次数归一（`build/sections/01-introduction.tex:246` 附近）。渐近估计里的常数可以依赖固定的簇、嵌入和极化，不依赖序列下标，除非显式声明。符号 $u_i\asymp v_i$ 表示两个比值都被正常数从上下夹住。这些约定在我后面的每一次比较里都要用到，所以先钉在这里。

## §2 初始动机与第一个猜想

起点是一个维数计数。设 $X$ 是阿贝尔簇 $A$ 的不可约子簇，$S=\langle X\rangle_{\mathrm{sp}}$ 是包含 $X$ 的最小特殊子簇。对 $S$ 内的特殊子簇 $T$，$X\cap T$ 的一个不可约分支 $Y$ 若满足
\[
\dim Y>\dim X+\dim T-\dim S,
\]
就称它非典型。右边是"预期维数"：把 $X$ 与 $T$ 放进 $S$ 里一般位置相交时该有的维数。非典型就是"比预期大"。我最初的问题是：这样的 $Y$ 会不会太多？直觉上"比预期大"是稀有事件，于是写下第一个猜想，非典型分支在 $X$ 里应当落在有限多个真子簇里，因而极大非典型子簇只有有限多个。

这个猜想不是空穴来风。挠点情形正是 Manin--Mumford 定理：挠点稠密的子簇是挠陪集（`build/sections/01-introduction.tex:113` 引 Raynaud）。挠陪集把挠点换成维数可变的陪集，于是"稀有"要重新定义。我起初以为 Manin--Mumford 的证明骨架能直接搬：用某个高度函数把点集合压到一个紧集，再用等分布或算术相交把"太密"翻译成"必须是特殊的"。这条思路对固定簇有效，对"陪集维数可变、序列次数无界"的场合会立刻失灵。

我记下第一个猜想时还顺手记了两个我认为必须先回答的技术问题。其一，$\langle X\rangle_{\mathrm{sp}}$ 是否良定义、是否有唯一性；论文开头用"取维数最小的特殊子簇再与任意另一个相交"给出肯定回答，并顺带得到单调性（`build/sections/01-introduction.tex:23` 那个闭包单调关系）。其二，非典型性用 $S$ 内部度量会不会丢掉信息；后来发现恰恰是"在 $S$ 内度量"这一步，使得最大非典型子簇与最优子簇之间能接上（`build/sections/09-finiteness.tex:50`）。这两个问题当时只是备忘，事后看却决定了整条路线的走向。

## §3 精确陈述：三个层次

把论文里的断言按强弱排成三层，是我理解这套证明的第一步。最弱也最干净的一层是主定理（`build/sections/01-introduction.tex:43`）：对每个数域 $K$、每个 $K$ 上阿贝尔簇 $A$、每个不可约子簇 $X\subseteq A_{\overline K}$，$X$ 在 $S=\langle X\rangle_{\mathrm{sp}}$ 中的极大非典型子簇只有有限多个。等价说法是存在有限多个真非典型子簇 $Y_1,\ldots,Y_m\subsetneq X$，使每个非典型子簇都含于其中之一。列表可以为空；不对交点次数或高度作任何假设，也不对 $A$ 加单性、自同态或复乘假设。

中间一层是一个带全称量词的非稠密定理（`build/sections/01-introduction.tex:67`）：设 $A$ 是 $\overline{\mathbb Q}$ 上阿贝尔簇，$X\subseteq A$ 不可约且不含于任何真挠陪集，则 $X\cap A^{[\dim X+1]}$ 在 $X$ 里不 Zariski 稠密，其中 $A^{[r]}$ 是余维至少 $r$ 的所有特殊子簇之并（`build/sections/01-introduction.tex:61`）。注意这里量化的是"任意 $A$、任意 $X$"，没有任何固定性假设。这一层比主定理强，因为它对每个 $X$ 都成立，而主定理只关心某个 $X$ 内部的极大对象。

最底层是辅助序列定理（`build/sections/02-sequences.tex:162`）。它说的是：给定一组序列数据（定义 `build/sections/02-sequences.tex:120` 给出：一列阿贝尔簇 $A_\ell$、非零阿贝尔子簇 $W_\ell\subseteq A_\ell$、不可约子簇 $Y_\ell$、整数 $m_\ell\ge0$，以及点 $y_{i\ell}$ 与尺度 $H_{i\ell}$，满足局部纤维界与尺度递降），设 $V\subseteq\operatorname{Lie}(W)$ 是某个实自同态幂等的像，$\Phi$ 是以 $V$ 为核的正交投影，$q_i=(y_{i\ell}/\sqrt{H_{i\ell}})_\ell$，则下面两条不能同时成立：
\[
\operatorname{codim}_{\operatorname{Lie}(W)}V>\sum_{\ell\in I}m_\ell,
\qquad
\lVert\Phi(q_i)\rVert\longrightarrow0.
\]
这三层的关系是一条单向链：序列定理推出非稠密定理（`build/sections/02-sequences.tex:239`），非稠密定理再经 Barroero--Dill 的最优子簇归约推出主定理（`build/sections/09-finiteness.tex:27`）。我后来意识到，把问题下压到序列定理这一层，是整个工作最关键的一次重新表述：非稠密定理里那个"任意 $X$"被换成了"任意序列数据"，而序列数据带上了尺度结构，尺度结构又把无界的点次数换成了可控的纤维维数。

## §4 第一条错误路线：把非稠密当终点

我最早的想法是直接把非稠密当作终点来攻。对固定的 $X$，取 $X\cap A^{[\dim X+1]}$ 里一列一般点，用 Ullmo--Zhang 型的等分布把它们推向某个极限测度，再用算术相交数把"测度非零"翻译成"存在正维数的特殊子簇"，从而逼出 $X$ 含于真挠陪集。这条路线在挠点情形是标准操作，我花了不少时间试图把它原样搬过来。

它失败在三个地方，而且是连环失败。第一，等分布需要簇固定；这里的 $X$ 虽然固定，但点所在的挠陪集 $T$ 的维数在变，$X\cap T$ 的分支维数也在变，序列的有效支撑集不是固定对象。第二，等分布的有效性依赖点的高度有统一上界，而这里点的次数无界、高度无界；我试着先证一个高度上界，却发现"高度上界"与"非稠密"在逻辑上互相纠缠，容易循环论证。第三，即使极限测度非零，要把测度翻译回一个正维数特殊子簇，需要一个稳定的代数圈类，而可变维数的分支给不出稳定的圈类。

我在这条路上卡了很久，最后承认：对固定的一个 $X$ 做等分布，能得到的只是"在某个固定高度以下的非稠密"（论文里对应 Habegger--Pila 那条固定高度结果，`build/sections/01-introduction.tex:153`）。要把它升成对一切高度成立，必须换一种机制，让"高度"进入结构本身，并非被预先界住。这个认识把我推向了尺度分层。

## §5 关键转折：尺度分层与最小反例

转折发生在我决定不再和"无界次数"硬碰。既然点的 N\'eron--Tate 高度平方根之间不一定可比，那就把坐标按高度增长率分组：反复取"高度较小的最大维数商"，直到剩下的部分高度有界。这样阿贝尔簇在同源意义下被拆成最多一个有界层加有限多个依次更大的无界层（`build/sections/02-sequences.tex:188` 的高度分解引理）。每一层单独归一之后，点向量变得有界，它们之间的代数子群关系就会收敛到一个实自同态投影，把归一化向量送到零。

这一步之所以是转折，是因为它把"次数无界"这个障碍换成了"尺度分离"这个可控条件。一旦有了尺度分离，我就可以对反例本身做归纳：假设存在一个反例，取环境簇维数 $\dim\mathcal A$ 最小的那个。最小性会强迫一件事，用乘积阿贝尔子簇去商，不能保持严格余维不等式。把这个"商不保不等式"的障碍精确写出来，就得到了投影排除引理（`build/sections/03-tangent.tex:15`）。我第一次读出这个引理时有些意外：它并不是一个正面估计，是一个"若障碍存在则能造出更小反例"的排除式陈述。这种"用最小性反推障碍必须长什么样"的手法，把原来无从下手的几何问题变成了关于纤维维数的有限组合问题。

最小反例的设定还带来一个附带好处：它让全高与带低因子两种情形可以分开处理。论文先证全高情形（`build/sections/04-high.tex:193`），再用它去处理低因子（`build/sections/05-minimal.tex:1`）。这个顺序不是装饰，投影排除引理在带低因子的证明里明确要求"全高情形已在所有维数成立"（`build/sections/03-tangent.tex:21`）。

## §6 第一条被证成的路线：全高情形

当所有尺度都趋于无穷时，反例被 Dill 的高度不等式直接压死，这是我第一个真正走通的部分。要点有三条，缺一不可。

第一条是把切正性变成一个对次数的多项式下界。一致切正性命题（`build/sections/03-tangent.tex:408`）给出一个 $\Phi$ 的邻域，使每个过标记点的子乘积上的切积分 $P_Z(g)=\int_Z(g^*\omega)^{\dim Z}$ 为正。要把"为正"变成"以次数为界的正下界"，我把 $P_Z$ 看成实自同态空间里的多项式 $p_Z$，其次数不超过 $2\dim\mathcal A$，在整点上取整数值，于是所有系数有统一分母 $K!$；再用实量词消去把"盒上最小值"的代数描述写出来，得到一个非零整系数多项式在最小值处取值关系，从而挤出下界 $\theta^{-1}D_Z^{-\omega_1}$（`build/sections/04-high.tex:28`）。这条论证里我觉得最巧的是"先证多项式整性，再用量词消去"，因为它把一个解析上的正性问题降成了代数上的分母问题。

第二条是尺度平衡。各因子的高度尺度不同，直接代 Dill 不等式会得到形如 $\sum a_{i\ell}h(y_{i\ell})$ 的源项与形如 $h(\Xi_i)-h(\mathcal Z_i)$ 的像项，两者量级不匹配。我用二进乘子 $v_{i\ell}=u2^k$（`build/sections/04-high.tex:258`）把各因子乘到同一高度尺度 $R_i$，同时保证乘法映射的系数高度只按 $v_{i\ell}^2$ 增长（`build/sections/04-high.tex:328` 的递推给出这个二次界）。二进族既能逼近任意实数到相对误差 $\eta$，又能让系数高度可控，这两点同时满足并不显然，是反复试出来的。

第三条，也是最容易做错的一条：乘法常数必须先固定。Dill 不等式里的 $c_1$ 只依赖几何数据、$t_1$、$\theta$、$\omega$，而生成元个数 $J$、其系数高度、$t_2$ 只进入高度阈值（`build/sections/04-high.tex:185`）。我起初把有理逼近的精度也当成自由参数一起放进常数，结果高度阈值随精度漂移，矛盾闭不上。正确的次序是先固定 $c_1$，再选精度 $\eta$，最后取足够大的 $i$，让 $\eta$ 的误差项 $c_1C^2\eta^2$ 小于源项下界 $\frac14\sum_\ell\kappa_\ell$（`build/sections/04-high.tex:429`）。这个次序一旦摆对，矛盾就是一句话的事：每个 $0<\eta<1/2$ 都给出不等式，而右边常数与 $\eta$ 无关，取 $\eta$ 足够小即得矛盾。

## §7 高度分解的技术细节

高度分解引理（`build/sections/02-sequences.tex:188`）的证明比我预想的更依赖一个不起眼的观察：正比的高度的商集合里，"在某个尺度下可忽略"这件事在商之间可传递。做法是，若点高度有界就取 $A$ 本身作有界因子；否则取子列使 $H_i=\lVert x_i\rVert^2\to\infty$，在所有满足 $\lVert\pi(x_i)\rVert^2=o(H_i)$ 的固定商同态里选维数最大的那个 $\pi:A\to Q$，再对剩余部分重复。这里用 Poincar\'e 完全可约性把 $A$ 写成 $Q\times W'$ 的同源像，并把靶簇的固定同源吸收掉。

非退化条件是这段证明里我反复核对的一处。若某个固定非零同态 $g$ 在补因子 $W'$ 上满足
\[
\liminf_{i\to\infty}\frac{\lVert g(p'_i)\rVert}{\sqrt{H_i}}=0,
\]
则取进一步子列使该比值趋于零，构造一个坐标分别是 $\pi$ 与 $g$ 的同态，其像维数 $\dim Q+\dim g(W')>\dim Q$，而点高度仍是 $o(H_i)$，这与 $Q$ 的极大性矛盾。所以 $W'$ 是以 $H_i$ 为尺度的高因子，且对每个固定同态都满足非退化下界。过程因剩余商维数严格减小而终止，最后把提取出的因子顺序倒过来，使尺度递增。

要理解为什么必须引入"实同态微积分"（`build/sections/02-sequences.tex:32`），得先看高度空间。对阿贝尔簇 $G$ 取对称丰沛线丛，记 $\mathcal H(G)=G(\overline{\mathbb Q})\otimes_{\mathbb Z}\mathbb R$，范数平方为标准高度。标准高度配对在这个实空间上给出正定二次型，于是实同态能同时作用在李代数与高度空间上，并且有限维实同态空间里的收敛蕴含算子范数收敛。引理还给出一条我后来用得极多的推论：若 $\lVert f(x_i)\rVert\to0$，则 $\lVert P_{(\ker f)^\perp}(x_i)\rVert\to0$。证明用一个在零处取零、在 $f^*f$ 的正特征值处取 $1/t$ 的实多项式造出广义逆 $f^\dagger$，再用李作用忠实性把恒等式提升到高度空间。

一个必须记住的技术细节是：实同态的像通常不是阿贝尔子簇的李代数（`build/sections/02-sequences.tex:84`）。这直接决定了后面"极限投影算子"的像是李代数的子空间，并非某个阿贝尔子簇，因此不能用"簇的维数"去谈它，只能用李代数的余维数。另一个细节是局部纤维维数的约定（`build/sections/02-sequences.tex:92`）：它指过该点的纤维各不可约分支维数的最大值，这在标记点是奇点时才见分晓。

## §8 投影排除：商不保严格余维

投影排除引理（`build/sections/03-tangent.tex:15`）是整条路线里我最愿意称之为"枢纽"的一步。它说：在最小反例里，不存在固定的乘积阿贝尔子簇 $C=\prod_\ell C_\ell\ne0$ 和非负整数 $a_\ell$，使得在无穷子列上
\[
\dim_{y_{i\ell}}\bigl(Y_\ell\cap(y_{i\ell}+C_\ell)\bigr)\ge a_\ell\ (\ell\in I),
\qquad
\sum_\ell a_\ell\ge\operatorname{rank}(\Phi|_{\operatorname{Lie}(C)}).
\]
也就是说，"每个因子上的局部纤维维数都不小于 $a_\ell$，且这些 $a_\ell$ 之和至少等于 $\Phi$ 限制到 $\operatorname{Lie}(C)$ 的秩"这种配置不能出现。

证明的策略是把这种配置商掉，造出一个维数更小的反例。逐因子构造投影后的母簇 $Y'_\ell\subseteq A'_\ell=A_\ell/C_\ell$，局部纤维界变成 $m'_\ell=m_\ell+e_\ell-a_\ell$，其中 $e_\ell$ 是 $C_\ell$ 在 $D_\ell=A_\ell/W_\ell$ 里的像的维数。关键是余维数账本（`build/sections/03-tangent.tex:101`）：
\[
\operatorname{codim}_{\operatorname{Lie}(W')}V'
=\operatorname{codim}_{\operatorname{Lie}(W)}V+\sum_\ell e_\ell-\operatorname{rank}(\Phi|_{\operatorname{Lie}(C)})
>\sum_\ell(m_\ell+e_\ell-a_\ell).
\]
我当初最担心的是"商掉子簇会同时缩小余维数、把不等式破坏"。这段账本告诉我，纤维界的增益 $\sum e_\ell$ 恰好补偿了秩损失 $\operatorname{rank}(\Phi|_{\operatorname{Lie}(C)})$，而假设 $\sum a_\ell$ 足够大正是让严格不等式保持的原因。

构造投影母簇时有一个我起初忽略的层次问题。局部纤维维数只在上半连续，所以要在 $Y_\ell$ 里取"到 $A/W$ 的纤维维数不超过 $m$"的开集与"到 $A/C$ 的纤维维数至少 $a$"的闭集之交 $S$，它局部闭且含所有标记点。再对 $S\to E$（$E=A/(W+C)$）用纤维维数定理，得到 $\dim Q_t\le m+e-a$。最后把 $Q$ 剖分成有限多个不可约局部闭子集，取子列使投影点落进同一片，其闭包就是 $Y'_\ell$。这段"局部闭 + 子列固定"的写法，是为了让母簇在标记点附近的芽恰好等于闭包的芽。

末尾还要处理"哪些因子在商之后变成零"。删去 $W'_\ell=0$ 的因子不会改变 $\operatorname{Lie}(W')$ 内的余维数，只会减小非负界之和；至少有一个因子存活，否则严格不等式会断言零大于一个非负整数之和。低因子若存活，挠陪集回避性由拉回得到；若低因子消失，就与已经证过的全高情形矛盾。这两句是引理结尾把"更小反例"落到矛盾上的收口。

## §9 乘积切障碍与 Ax 定理

乘积切障碍引理（`build/sections/03-tangent.tex:178`）把"切积分取零"翻译成"存在乘积阿贝尔子簇，其上的纤维维数超过 $g$ 的秩"。这是把解析的正性失败转成代数障碍的桥梁，也是我用 Ax 定理的唯一地方。陈述是：若 $P_Z(g)=0$，则存在 $C_\ell\subseteq A_\ell$，使对每个 $z\in Z$，
\[
\sum_{\ell\in I}\dim_{z_\ell}\bigl(Z_\ell\cap(z_\ell+C_\ell)\bigr)
>\operatorname{rank}\Bigl(g\bigm|_{\bigoplus_\ell\operatorname{Lie}(C_\ell)}\Bigr).
\]

Ax 定理本身只给一个一般阿贝尔子簇，不给乘积形。把它换成乘积形，是这段证明最需要设计的地方，因为退化过程不能减小切相交维数，而 $g$-秩又必须被 Ax 不等式里的秩界住。作者的办法是先固定对角缩放 $D(\lambda)=\operatorname{diag}(\lambda_\ell)$，用贝尔纲定理选一个 $\lambda$ 使 $gD(\lambda)$ 在每个阿贝尔子簇上的秩同时取最大（理由：阿贝尔子簇只有可数多个，其有理同调群决定 $H_1(A,\mathbb Q)$ 的不同有理子空间）。只有在选好 $\lambda$ 之后才应用 Ax 定理，这一步次序是整个引理的灵魂。

拿到 Ax 的一般子簇 $C^*$ 后，取严格递增整数 $w_\ell$，让
\[
S_0=\lim_{t\to0}\operatorname{diag}(t^{w_\ell})S
=\bigoplus_\ell\operatorname{pr}_\ell(S\cap F_\ell),\qquad F_\ell=\bigoplus_{j\ge\ell}\operatorname{Lie}(A_j).
\]
乘积切空间 $T_zZ$ 被所有对角缩放保持，于是 Grassmann 流形上相交维数的上半连续性给出 $\dim(T_zZ\cap S_0)\ge\dim(T_zZ\cap S)$；而由 $\lambda$ 的选择，$g$ 在每个缩放像上的秩都不超过 $R=\operatorname{rank}(h|_S)$，秩上界在 Grassmann 流形上封闭，故 $\operatorname{rank}(g|_{S_0})\le R$。两式合并就得到乘积方向上的不等式。这段"先取 Grassmann 极限再让秩上界过极限"的操作，比 Ax 定理本身更花心思。

## §10 固定母体中的有限方向

有限方向引理（`build/sections/03-tangent.tex:318`）解决的是"子簇在固定母体里变动时，障碍方向能否从有限集合里挑"。定义测地缺陷 $\delta_{\mathrm{geo}}(D)=\dim\langle D\rangle_{\mathrm{geo}}-\dim D$，$\langle D\rangle_{\mathrm{geo}}$ 是包含 $D$ 的最小阿贝尔子簇陪集（平移点可以不是挠点）。若 $D$ 的每个真放大 $E$ 都满足 $\delta_{\mathrm{geo}}(E)>\delta_{\mathrm{geo}}(D)$，就称 $D$ 在 $Y$ 内测地最优。

引理说：固定母体 $Y_\ell\subseteq A_\ell$ 后，存在有限集合 $\mathcal H_\ell$，使得无论标记点、子簇 $Z_\ell$、子簇 $C_\ell$、线性映射 $g$ 怎么变，只要局部纤维维数之和超过 $g$-秩（带一个 $0$ 或 $1$ 的余量），就能把方向换成 $\mathcal H_\ell$ 里的 $H_\ell$ 而不减小不等式。证明先取 $Z_\ell\cap(y_\ell+C_\ell)$ 的 $d_\ell$ 维分支 $D_\ell$，再在"包含 $D_\ell$ 且测地缺陷不超过 $\delta_{\mathrm{geo}}(D_\ell)$"的子簇里取维数最大者 $E_\ell$，它按构造测地最优。由 Habegger--Pila 的有限性命题（`build/sections/03-tangent.tex:380`），固定母体内测地最优子簇的测地闭包方向只有有限多个，取这些方向作 $\mathcal H_\ell$。

我特别记下引理里那条秩的估计：秩至多按定义域增加的维数增长，因此
\[
\operatorname{rank}\Bigl(g\bigm|_{\bigoplus_\ell\operatorname{Lie}(H_\ell)}\Bigr)
\le\operatorname{rank}\Bigl(g\bigm|_{\bigoplus_\ell\operatorname{Lie}(B_\ell)}\Bigr)+\sum_\ell(\dim H_\ell-\dim B_\ell),
\]
再配合缺陷比较 $\dim H_\ell-\dim B_\ell\le\dim E_\ell-d_\ell$ 收口。这条"秩的维数增长"估计看着朴素，却是把"测地最优"翻译成"秩不等式"的转换器。

## §11 一致切正性

一致切正性命题（`build/sections/03-tangent.tex:408`）把前面几条几何结论打包成两条我后面反复调用的正性：第一条，存在 $\Phi$ 在实自同态空间里的邻域 $\mathcal U$ 和下标 $i_0$，使对每个 $i\ge i_0$、每个 $g\in\mathcal U$、每个过标记点的子乘积 $Z=\prod_\ell Z_\ell$，都有 $P_Z(g)>0$；第二条，对充分大的 $i$ 与每个这样的子乘积，$P_{Z^r}(\Delta\Phi)>0$，其中 $\Delta$ 是相邻差分映射
\[
\Delta g(v_1,\ldots,v_r)=\bigl(g(v_2)-g(v_1),\ldots,g(v_r)-g(v_{r-1})\bigr),
\qquad r=\dim\mathcal A+1.
\]
第一条供高度不等式使用，第二条供有界尺度处的两个测度比较使用，用途不同，所以分成两条陈述。

第一条的证明走反证：若失败，就取越来越小的邻域与越来越大的下标，得到 $g_i\to\Phi$ 与子乘积 $Z_i$ 使 $P_{Z_i}(g_i)=0$；乘积切障碍给出子簇 $C_i$ 满足局部纤维维数和 $\ge\operatorname{rank}(g_i|_{\operatorname{Lie}(C_i)})+1$；再用有限方向引理（取余量 $1$）把方向固定，沿子列取固定的 $a_\ell$，由秩上界在极限下封闭得到 $\operatorname{rank}(\Phi|_{\operatorname{Lie}(H)})\le\sum a_\ell-1$，与投影排除矛盾。

第二条更微妙。若有无穷多 $i$ 与子乘积使 $P_{Z_i^r}(\Delta\Phi)=0$，对"因子由 $\ell$ 与拷贝编号 $j\in\{1,\ldots,r\}$ 双重索引"的乘积用乘积切障碍，得到 $\sum_j a_j>\sum_j\dim E_j-\dim\bigcap_j E_j$。这里 $E_j=\Phi(\operatorname{Lie}(C_j))$，而相邻差分映射在 $\bigoplus_j E_j$ 上的核是对角嵌入的 $\bigcap_j E_j$，秩为 $\sum_j\dim E_j-\dim\bigcap_j E_j$。由此可挑出一个拷贝使 $C_j\ne0$ 且 $a_j\ge\dim E_j$；若某个 $a_j=0$，则那个非零乘积子簇含于 $\ker\Phi$，单独一条固定子簇就使排除条件对每个下标成立，不可能。故选中的和为正，再用有限方向引理（取余量 $0$）把方向固定并沿无穷子列与排除条件冲突。$r=\dim\mathcal A+1$ 这个取值正是让"若所有 $a_j<\dim E_j$ 则亏量之和至少 $r$、而 $\dim\bigcap_jE_j\le\dim\mathcal A$"这一段算术成立的关键。

## §12 有界尺度：极小辅助乘积

带低因子的反例需要另一套算术论证，因为低因子处高度有界，Dill 的不等式没有用武之地。论文在这里引入了一个我称之为极小辅助乘积的装置（`build/sections/05-minimal.tex:97` 起）。先定义一个子乘积序列是容许的：各因子的几何次数有界；各因子在一个次数有界的数域 $k_i\supseteq k$ 上几何整；每个 $Z_{i\ell}$ 含有高度不超过 $CH_{i\ell}$ 的稠密代数点集（`build/sections/05-minimal.tex:104`）。注意这里对 $[k_i(y_{i\ell}):k_i]$ 不作任何限制，也就是说标记点的次数可以无界，有界的只是簇本身的次数与定义域次数。

在这一定义下，在所有子列上取"因子维数之和最小"的容许乘积。这个第二次极小性针对的是辅助乘积，与环境阿贝尔簇无关。极小性带来一条我起初没料到的强结论（`build/sections/05-minimal.tex:132`）：对每对正整数 $D,B$，存在 $i_0(D,B)$，使得当 $i\ge i_0$ 时，任何在次数不超过 $B$ 的扩张 $F_i/k_i$ 上定义、次数不超过 $D$ 且过 $y_{i\ell}$ 的超曲面，都必然包含整个 $Z_{i\ell}$。换言之，极小性禁止任何"有界次数的方程切掉因子一小块"。

这条结论的证明用了一个把"次数无界"与"高度无界"解耦的引理（`build/sections/05-minimal.tex:24`）：若一组点的高度不超过 $T$，且它们决定的次数 $D$ 齐次多项式空间定义在一个数域 $F$ 上，则该空间有 $F$-基，其系数高度为 $O_{N,D}(T)$。关键在于，尽管求值矩阵的行可能落在任意大次数的扩张里，核空间却是 $\operatorname{Gal}(\overline{\mathbb Q}/F)$-不变的，配上选定的自由坐标后有唯一归一基，因此基向量落在 $F$ 内。这一步让我明白：真正把次数压住的不是点的次数，是点的高度加一个固定的方程次数。

配套的还有一条余法空间引理（`build/sections/05-minimal.tex:58`）：任意光滑点处，次数不超过簇次数 $D$ 的齐次方程（在某仿射图上去齐次化后）的微分张成该点的余法空间。证明用射影连接避开技巧把 $Z$ 投影到一个超曲面 $Z'$ 上，再用中山引理证明投影在光滑点是局部同构。两条引理合起来，就给出极小乘积的方程基高度 $O(H_{i\ell})$、标记点光滑性、以及低因子落入有限集合三条结论。低因子因为 $H_{i0}=1$、方程次数与系数高度都有界，由 Northcott 定理落入有限多个可能，于是可设 $Z_{i0}=Z_0$ 与 $i$ 无关。

## §13 零维低因子的消去

极小辅助乘积还有一个边界情形要处理：低因子是零维的。引理（`build/sections/05-minimal.tex:235`）断言在极小容许乘积里必有 $d_0>0$。若 $d_0=0$，低因子是一个固定点 $p$，且由回避性，$p$ 不含于任何真挠陪集。

证明分两步，第一步先证 $V$ 投影到 $\operatorname{Lie}(A_0)$ 是满的。若不然，取该投影正交补上的正交投影 $P\ne0$，由恒等式 $P\pi_0=P\pi_0\Phi$ 与"小投影"假设得到 $P(p)=0$；而在 $p$ 处求值在 $\operatorname{End}(A_0)_{\mathbb Q}$ 上是单射（非零有理自同态把 $p$ 送到挠点，会迫使 $p$ 落进真挠陪集），张量到实数后仍单射，与 $P\ne0$ 矛盾。

第二步是把高因子复制 $h$ 份。对正整数 $h$ 定义
\[
V_*=\{(v_1,\ldots,v_h)\in H^h:\text{存在 }v_0\in L\text{ 使 }(v_0,v_j)\in V\ \text{对每个 }j\},
\]
其中 $L=\operatorname{Lie}(A_0)$，$H=\bigoplus_{\ell\ge1}\operatorname{Lie}(W_\ell)$。它是某个实同态的像，因而也是某个实幂等的像。维数账本给出 $\operatorname{codim}_{H^h}V_*=hc-a+t\ge hc-a$，其中 $c=\operatorname{codim}_{L\oplus H}V$，$a=\dim L$，$t=\dim(V\cap(L\oplus0))$。因为 $c>\sum_{\ell=0}^s m_\ell$，取足够大的固定 $h$ 就使这个余维数严格大于 $h\sum_{\ell\ge1}m_\ell$。

接着取 $h$ 个子列，使相邻两份的高因子尺度比趋于零，把归一化元组拼起来，再用一个"忘记低坐标"的实同态 $T$ 与广义逆把 $V_*$ 的小投影条件从低因子的 $V$ 传过去。得到的是全高的禁止序列数据，与已证的全高情形矛盾。这段证明里我印象最深的是它对广义逆的用法：$\Phi_*\pi_+=\Phi_*\pi_+T^\dagger T$ 之所以成立，是因为 $1-T^\dagger T$ 投影到 $K=\ker T$，而 $K$ 在 $\pi_+$ 下的像被 $\Phi_*$ 杀掉。

## §14 两个测度与算术正性

有界尺度处的算术下界由比较两个测度得到（`build/sections/06-arithmetic.tex:101`）。设 $Z_i=\prod_{\ell=0}^s Z_{i\ell}$ 是极小辅助乘积，$Z_0$ 固定正维，$M_i\to\infty$ 与正整数 $b_{i\ell}$ 满足 $b_{i0}=M_i$、$b_{i\ell}\sim M_i/\sqrt{H_{i\ell}}$、$\min_\ell b_{i\ell}\to\infty$。由格逼近可造出同态 $F_i:\mathcal A\to\mathcal A$ 使 $\varphi_i=F_i\operatorname{diag}(b_{i\ell}^{-1})\to\Phi$（`build/sections/06-arithmetic.tex:53`）。在 $\mathcal A^r$ 上取两族拉回丛：$\bar E_{i,1}$ 是 $r$ 份独立输出的外积拉回，$\bar E_{i,2}$ 是 $r-1$ 个相邻差分 $F_i(x_{a+1})-F_i(x_a)$ 的拉回。

两个测度 $\mu_{i,1},\mu_{i,2}$ 分别是这两个丛的曲率测度归一化后投影到固定的低乘积 $Z_0^r$ 上。它们几何上收敛到 $\mu_1,\mu_2$，分母为正由前面已用的切正性保证。关键分歧出现在对角低元组 $(z,\ldots,z)$ 处：第一支测度在这里密度严格为正，因为 $\Phi$ 在 $T_zZ_0\oplus T_qQ$ 上单射；第二支测度在这里密度为零，因为存在非零低切向量 $v\in T_zZ_0$（这里用到 $d_0>0$），把"低部分是 $(v,\ldots,v)$、高部分全零"的切向量在每个相邻差分下都杀掉，于是 $\beta_2(\Phi)$ 的顶次幂在该点全空间上取零。取一个在 $(z,\ldots,z)$ 附近非负、在更小邻域上为正的光滑检验函数 $f_*$，就得到固定的测度缺口
\[
\lim_i\bigl(\mu_{i,1}(f_*)-\mu_{i,2}(f_*)\bigr)>0.
\]

另一半是反证：若算术商 $(\bar E_i^{d+1}\cdot Z_i)/(M_i^2B_i)$ 沿子列趋于零，则由基本不等式与几何次数比较，每个 $Z_i$ 有高度不超过 $\epsilon_iM_i^2$（$\epsilon_i\to0$）的稠密点集，其乘积给出 $X_i$ 上同时被两个丛的度量控制到 $O(\epsilon_iM_i^2)$ 的稠密集 $\mathcal S_i$。要用它推出两个测度趋于相同，需要一致度量变分。做法是把 $\bar U_i=\overline{\mathcal O}_{v_i}(f)-a_i\bar{\mathbf 1}$ 写成两个半正阿代尔丛之差 $\bar U_{i,1}-\bar U_{i,2}$，其中 $\bar U_{i,2}=C\bar H+K\bar{\mathbf 1}$（`build/sections/06-arithmetic.tex:287`），常数与 $i$、与扩张无关。再用算术 Siu 不等式（`build/sections/06-arithmetic.tex:228`）与基本不等式（`build/sections/06-arithmetic.tex:219`）把扰动丛的算术体积压成正，从而在 $\mathcal S_i$ 上找到点使平均与测度积分相差不超过 $\eta+o(1)$。这里唯一用到定义域次数有界的地方，是把 $\lambda_i=2/[k_i:\mathbb Q]$ 从下方界住；点的次数始终不受限。

## §15 一致局部指数

算术正性给出一个小截面（`build/sections/06-arithmetic.tex:414`）：在某个消解 $\pi_i:\widetilde Z_i\to Z_i$ 上，存在定义在 $k_i$ 上的非零截面 $s_i\in H^0(\widetilde Z_i,\pi_i^*E_i^{\otimes n_i})$，其阿代尔上确界范数满足 $\lVert s_i\rVert_{v,\sup}\le e^{-cn_iM_i^2}$（$v$ 阿基米德）与 $\le1$（$v$ 非阿基米德）。指数 $n_i$ 不必有界，它在下一节的加权指数里被同一因子 $n_ib_{i\ell}^2$ 归一，因此其大小无关紧要。

局部指数命题（`build/sections/07-index.tex:29`）要把"范数小"翻译成"在标记点的加权消失阶正"。加权指数的定义是
\[
\operatorname{ind}_{n,b}(s;y)=\min_{a_\alpha\ne0}\sum_\ell\frac{\lvert\alpha_\ell\rvert}{nb_\ell^2},
\]
其中 $a_\alpha$ 是截面在因子化正则参数下的泰勒系数。命题断言存在与 $i$ 无关的 $\eta>0$，使对充分大的 $i$ 有 $\operatorname{ind}_{n_i,b_i}(s_i;y_i)\ge\eta$，且不需要 $y_i$ 的次数有界。

证明的技术核心是把 Cauchy 系数不等式与乘积公式拼起来：
\[
\log\lVert a_{\mathrm{fib}}\rVert_v\le\log\lVert s_i\rVert_{v,\sup}+n_i\kappa_v+\sum_\ell\lvert\alpha_\ell\rvert\log\rho_{i\ell v}^{-1},
\]
其中 $a_{\mathrm{fib}}=a_\alpha e(y_i)^{n_i}$ 是同一个代数纤维元在各处取值的量。左边按乘积公式等于 $-n_ih_{\bar E_i}(y_i)$。于是两个损失项必须一致地控住：半径损失由余法方程的系数高度给出 $\sum_v\nu_v\log\rho_{i\ell v}^{-1}\le C_\gamma H_{i\ell}$（`build/sections/07-index.tex:144`），度量变分在无限位是 $O(\xi^2M_i^2)$（`build/sections/07-index.tex:201`），在有限位则是与 $F_i$ 的整数系数无关的 $C_v$（`build/sections/07-index.tex:266`）。最后把 $b_{i\ell}^2H_{i\ell}\asymp M_i^2$ 代入，取 $\xi$ 使 $C\xi^2<c/2$，得到固定正下界。这段里我觉得最见功力的地方，是有限位度量变分的那条估计：它用"足够小的单位球是子群、且平移保持约化类"来彻底避开整数系数大小，从而不让局部指数依赖同态的系数高度。

## §16 乘积切割与有界次数下降

最后一步是把正指数变成一个"次数有界、定义域次数有界"的超曲面，从而与极小乘积的禁止条件冲突（`build/sections/08-cut.tex`）。先把截面搬到射影空间乘积上。取固定正整数 $t_0$ 使 $Q_i=t_0\sum_\ell b_{i\ell}^2L_\ell-F_i^*L$ 在 $\mathcal A$ 上丰沛（`build/sections/08-cut.tex:21`），乘一个使 $Q_i$ 全局生成的正幂，再乘一个在 $y_i$ 处非零的 $k_i$-截面，得到 $s'_i$。对每个因子取在 $y_{i\ell}$ 处平展的有限线性投影 $\pi_{i\ell}:Z_{i\ell}\to\mathbb P^{d_\ell}$，把它们拼成 $\Pi_i:Z_i^\nu\to P_i=\prod_\ell\mathbb P^{d_\ell}$，次数 $e_i=\prod_\ell\deg_{L_\ell}Z_{i\ell}$ 有界。沿 $\Pi_i$ 取域范数，得到 $P_i$ 上的非零多项式 $G_i$，多重次数为 $D_{i\ell}=e_it_0n_ib_{i\ell}^2$（`build/sections/08-cut.tex:76`）。

接着是 Faltings 型的分量论证。对正无理数 $\sigma$，令 $\mathcal I_\sigma$ 为指数超过 $\sigma$ 的闭轨迹。选 $N+2$ 个相邻级别，由维数递增有限次必有相邻两级的分量相同，得到一个同时是两级分量的 $J$。用 Faltings 乘积定理的 Evertse 显式形式（`build/sections/08-cut.tex:155`）：当 $D_\ell/D_{\ell+1}\ge(mN/\epsilon)^N$ 时，两级指数轨迹的公共不可约分量是各射影因子子簇的乘积。再由共轭计数引理（`build/sections/08-cut.tex:173`）给出 $q\prod_\ell\deg J_\ell\le C(N,\epsilon)$，其中 $q$ 是 $J$ 在 $k$ 上的共轭个数。共轭计数用的是"用一般线性空间横截相交、把共轭都化成孤立点、再比较局部重数与总次数"，多重次数的幂正好在不等式两端抵消，于是界与 $D$ 无关。

拿到有界次数、有界定义域次数的乘积分量 $J_i=\prod_\ell J_{i\ell}$ 后，只要至少一个因子 $J_{i\ell}$ 在 $\mathbb P^{d_\ell}$ 里是真子簇，就能取它一个有界次数的非零齐次方程 $R_i$，拉回 $\pi_{i\ell}$ 得到过 $y_{i\ell}$ 但不含 $Z_{i\ell}$ 的有界次数超曲面，定义域次数也有界。这与极小乘积的第一条结论直接冲突（`build/sections/08-cut.tex:286`）。$m=1$ 时乘积定理不需要，共轭计数引理本身就覆盖，这条细节是作者特意补的，因为低因子维度可能使总因子数为一时不能调用乘积定理。

## §17 从非稠密到最大非典型有限性

辅助序列定理经非稠密定理推到主定理，中间隔着 Barroero--Dill 的最优子簇归约（`build/sections/09-finiteness.tex:27`）。这一步不是走形式，它把"非稠密"这种测度式结论转成"有限多个最优子簇"这种计数式结论，而后者正是主定理需要的形态。

先定义特殊缺陷 $\delta(Z)=\dim\langle Z\rangle_{\mathrm{sp}}-\dim Z$，以及"在 $X$ 内最优"：$Z\subseteq X$ 不可约，且每个严格放大的不可约 $U$（$Z\subsetneq U\subseteq X$）都满足 $\delta(U)>\delta(Z)$。注意这里的闭包用特殊闭包，与切障碍那一节用的任意陪集闭包不同，这是两套几何在不同环节的分工。归约的核心（`build/sections/09-finiteness.tex:22`）是：若对每个阿贝尔子簇 $B\subseteq A$、每个不含于 $B$ 的真特殊子簇的不可约 $Z\subseteq B$，$Z\cap B^{[\max\{\dim Z+1,\dim B-e\}]}$ 都不稠密，则 $A$ 的每个维数不超过 $m$ 的不可约子簇只有有限多个缺陷不超过 $e$ 的最优子簇。由于所涉交集含于 $Z\cap B^{[\dim Z+1]}$，非稠密定理恰好验证该假设。

关键的一步是把"最大非典型"与"最优"接上（`build/sections/09-finiteness.tex:50`）。设 $Y$ 由特殊子簇 $T$ 见证为最大非典型，则 $\delta(Y)\le\dim T-\dim Y<\dim S-\dim X=\delta(X)$。若存在严格放大 $U$ 且 $\delta(U)\le\delta(Y)$，取 $T'=\langle U\rangle_{\mathrm{sp}}\subseteq S$，再取 $X\cap T'$ 含 $U$ 的分支 $C$，就有
\[
\dim C\ge\dim U=\dim T'-\delta(U)>\dim T'-\delta(X)=\dim X+\dim T'-\dim S,
\]
于是 $C$ 非典型且严格含 $Y$，与最大性矛盾。所以最大非典型必最优。把最优子簇的有限性与这条包含关系拼起来，主定理的有限性就出来了。

主定理的收尾还有两处容易漏的细节（`build/sections/09-finiteness.tex:78`）。一是把挠陪集 $S=B+\tau$ 平移成阿贝尔簇 $B$，平移保持维数与特殊子簇结构；二是从任意非典型子簇出发，严格非典型放大会严格增维数，因而终止，所以每个非典型子簇都含于某个最大者，它们的并是真闭子集。当 $\dim X=0$ 时没有非典型子簇，列表可以为空，这一情形也被显式覆盖。

## §18 有限秩平移推论

有限秩平移推论（`build/sections/01-introduction.tex:84`）是从同一个非稠密定理顺手得到的，但它的证明需要 Pink 的归约（`build/sections/10-finite-rank.tex:19`），把有限秩子群的问题搬到一个更高维的阿贝尔簇上去。陈述是：设 $\Gamma\subseteq A(\overline{\mathbb Q})$ 满足 $\dim_{\mathbb Q}(\Gamma\otimes_{\mathbb Z}\mathbb Q)<\infty$，$X$ 维数为 $d$ 且不含于任何真代数子簇的平移，则 $X(\overline{\mathbb Q})\cap(A^{[d+1]}(\overline{\mathbb Q})+\Gamma)$ 在 $X$ 里不稠密；当 $d=1$ 时该交集有限。

做法是取 $\Gamma$ 的有限秩基 $a_1,\ldots,a_r$，令 $D$ 为 $(a_1,\ldots,a_r)$ 生成子群的 Zariski 闭包，再乘一个整数 $m$ 消掉 $D/D^0$，使新基生成的循环子群在连通阿贝尔子簇 $C=D^0$ 里稠密（`build/sections/10-finite-rank.tex:23`）。把每个 $\gamma\in\Gamma$ 写成 $n\gamma=n_1a_1+\cdots+n_ra_r$（`build/sections/10-finite-rank.tex:37`），再在 $B=A\times C$ 上取 $Y=X\times\{a\}$。先验证 $Y$ 不含于 $B$ 的任何真代数子簇：若 $J$ 含 $Y$，则 $J$ 含所有 $(x-x_0,0)$，其闭包张成 $A\times\{0\}$，而 $J$ 在 $C$ 上的投影含 $a$ 因此是 $C$，两者合起来给出 $J=B$。于是非稠密定理适用于 $Y$。

剩下的包含关系（`build/sections/10-finite-rank.tex:59`）是技术活：对左端元素 $x=g+\gamma$（$g$ 落在余维至少 $d+1$ 的代数子簇里），构造 $\varphi:A^r\to A$ 与 $\psi:C\to B$，再令 $H=[n]_B^{-1}((G\times\{0\})+\psi(C))$。核与交都有限，于是 $\dim H=\dim G+\dim C$，从而 $\operatorname{codim}_BH=\operatorname{codim}_AG\ge d+1$，把左端整体塞进 $B^{[d+1]}(\overline{\mathbb Q})$。这一节值得记下的是它反复强调的边界：这里用的是代数点的情形，不是 Pink 关于一般半阿贝尔簇的完整表述；高维时结论是非稠密，例外闭子集可以有正维数。

## §19 与最初设想的差异

把最终做法和我开头的设想摆在一起，差距集中在三处，每一处都是我原来判断反了的地方。

第一处是"目标"的层次。我起初以为非稠密就是终点，主定理只是它的推论。真正做下来才发现，非稠密定理本身不够"刚"：它只说"不稠密"，而主定理需要"有限多个最大非典型子簇"，后者要经最优子簇归约，而归约的假设是对每个阿贝尔子簇、每个特殊闭包维数都成立的统一非稠密。也就是说，真正承重的是那个带全称量词的辅助序列定理，并非某一个 $X$ 的非稠密。这个认识让我把重心从"证明一个 $X$ 的结果"移到"证明一个对一切序列数据成立的结构定理"。

第二处是"几何与算术的分工"。我原以为主要难点在几何（Ax 定理、测地最优方向），算术只是收尾。结果是几何部分虽然精巧，却相对干净；真正吃时间的是算术部分：一致交下界、两个测度的一致比较、局部指数在无界次数与无界系数下的统一、乘积切割的共轭计数。尤其有界尺度那一半，几乎全是算术。我最初把有界尺度当成简单情形，事实恰好相反，它需要一整套与全高情形平行的机器。

第三处是"高度可比性"的取舍。我一度想在某种附加假设下（比如点高度的平方根两两可比）先做，再想办法去掉假设。最终做法根本不假设可比，是把不可比本身当成结构：反复取高度较小的最大维数商，把不可比翻译成尺度分离与纤维维数界。也就是说，我原以为要消除的障碍，最后成了论证的骨架。

## §20 失败路线复盘与信息缺口

把失败路线再盘一遍，能看清哪些判断是根本错的、哪些只是技术没到位。

第一条错路是直接等分布。根本错误在于把一个需要固定支撑的定理用在支撑可变的对象上。补救方式不是把等分布做得更强，是换机制，让尺度进入结构。第二条错路是先证高度上界再证非稠密。这有循环风险，因为非稠密本身要用来控制高度。最终做法把高度上界降级成一个局部条件（每个高因子对每个固定同态满足非退化下界），而全局高度无界被允许。第三条错路是试图把极限投影算子的像当成阿贝尔子簇。实际上实同态的像一般只是李代数子空间，这个认识逼出了"用李代数余维数，并非簇维数"的整套记账方式。第四条错路是试图用同一个 Vojta 型不等式处理有界尺度。它失败的原因很具体：低因子高度有界，Dill 不等式的源项下界消失，只能改用算术相交的下界，也就是两个测度的比较。

有几处我必须标注为推测，因为素材没有给出足够信息。其一，论文没有交代最初是怎么想到"用二进乘子同时满足尺度平衡与系数高度二次增长"的，我只能推测这是先在草稿里试过其它整数族（比如按 $H_{i\ell}$ 直接取整）发现系数高度失控之后才定下来的。其二，$t_0$ 的选取（`build/sections/08-cut.tex:20`）只说了"存在固定正整数"，没有给出有效估计，我无法判断它是否依赖具体极化；按论述形式推测它只依赖固定数据。其三，局部指数里 $n_i$ 是否能有界，论文明确说"不必有界"，但没有讨论若能证有界会简化哪一步，我推测这条留白是有意的，因为证明只用到 $n_i$ 的齐次归一。

## §21 与既有结果的接口

论文的引言部分（`build/sections/01-introduction.tex:107`）把这条路线放在一串既有结果里，我读的时候顺手理了理接口，因为接口决定了哪些工具可以借、哪些必须自造。

挠点情形是 Raynaud 对 Manin--Mumford 的证明（`build/sections/01-introduction.tex:113`）：挠点稠密的子簇是挠陪集。非典型性把挠点换成维数可变的挠陪集，于是"稠密"这个判据失效，必须换成"最大非典型"这样的包含式判据。曲线情形已有完整结果：Viada 在复乘椭圆曲线幂里证了余维二的有限性（带无真代数子簇平移假设），R\'emond--Viada 去掉横截性限制但保留子簇排除，Habegger--Pila 对任意阿贝尔簇上的曲线给出有限性，Barroero--K\"uhne--Schmidt 把曲线定理推广到一般半阿贝尔簇（`build/sections/01-introduction.tex:121` 起）。更新的 Dogra--Pandit 结果对雅可比满射到环境阿贝尔簇的光滑曲线给出有界次数，配合已有高度界得到有限性（`build/sections/01-introduction.tex:132`）。

高维非稠密在附加几何或高度限制下早有结果。一个常见的限制是商维数条件 $\dim\pi(X)=\min\{\dim X,\dim(A/B)\}$ 对每个商 $\pi:A\to A/B$ 成立。复乘情形下 R\'emond 在此条件下证了有限秩平移非稠密，Habegger 独立证了无平移情形，Viada 给出非复乘椭圆幂的情形，Habegger--Pila 对任意阿贝尔簇在此条件下给出非稠密（`build/sections/01-introduction.tex:139` 起）。不加这个条件时，Habegger--Pila 的另一个定理只给固定高度界下的非稠密。本文的定理不设商维数条件、不设高度界，这是它相对既有结果的主要增量。

几何输入有两条：Ax 的解析子群定理（用 Habegger--Pila 的精确解析子集形式，`build/sections/01-introduction.tex:169`），以及固定母体内测地最优子簇方向的有限性（Habegger--Pila 的命题，作者注明可追溯到 R\'emond 的引理与命题）。高度论证的谱系是 Vojta 的曲线方法、Faltings 对阿贝尔簇的推广、R\'emond 的广义不等式，本文用 Dill 的分因子阈值版本（Ange 的前置推广见 Dill 引言，`build/sections/01-introduction.tex:177`）。有界尺度的两测度比较沿用 Ullmo 与 Zhang 的 Bogomolov 证明骨架，基于 Szpiro--Ullmo--Zhang 等分布；度量变分用 Yuan 的算术丰沛方法与其半正阿代尔形式；局部加权指数沿用 Faltings，最后一步用 Evertse 显式化的乘积定理（`build/sections/01-introduction.tex:183` 起）。

## §22 未解决的问题与后续方向

论文自己点明了它的限度（`build/sections/01-introduction.tex:52`）：结论只涉及挠陪集的有限性，不给出极大非典型子簇个数的有效或一致上界。所有论证都是存在性的，量词消去与 Ax 定理都不产生有效常数。我读完后觉得有三条自然的后续方向。

其一，有效化。交下界 $\theta^{-1}D_Z^{-\omega_1}$ 里的 $\theta,\omega_1$ 来自实量词消去，原则上可算但不小；Dill 不等式里的 $c_1=\Lambda^{\psi(0)}$ 也极大。要让结论有效，得换更精细的下界工具。其二，个数上界。既然极大非典型子簇有限，能否给出依赖 $A,X$ 的显式界？曲线情形已有一些带次数或亏格假设的界，高维完全没有。其三，一般半阿贝尔簇。本文处理的是阿贝尔簇上的代数点情形（`build/sections/10-finite-rank.tex:101`），Pink 关于半阿贝尔簇的完整表述（`build/sections/01-introduction.tex:100`）没有被覆盖，主要障碍是半阿贝尔簇上的 Ax 型解析子群定理与高度理论的对应形态。

我还注意到一处结构性留白。论文把"全高"与"带低因子"严格分开，并在带低因子证明里显式依赖全高情形（`build/sections/03-tangent.tex:21`）。这种分层是否必要，或者说能否用一套统一的归纳同时覆盖两种情形，素材没有讨论。我推测分开处理是为了让投影排除引理在两种情形下有相同的"同类型反例"下降语义（低因子存在与否要保持），但这只是我的解读。

## §23 关于论证次序与常数依赖的补充

有几处次序安排值得单独记，因为它们看起来只是行文顺序，实际上是逻辑依赖。

第一处是全高情形先于带低因子情形。投影排除引理在带低因子时的陈述明确要求全高情形已在所有维数成立，用来处理"低因子在投影后消失"的分支（`build/sections/03-tangent.tex:21`）。若把两者并行处理，这个分支没有落点。

第二处是乘法常数先于逼近精度。Dill 不等式里 $c_1$ 只依赖几何数据与 $t_1,\theta,\omega$，而生成元个数、系数高度、$t_2$ 只进入高度阈值（`build/sections/04-high.tex:185`）。这个"依赖分离"是整个近似论证成立的前提：只有 $c_1$ 与精度无关，才能先固定它再取精度，最后让 $i\to\infty$。

第三处是两次极小性的分工。环境维数极小用于投影排除与切正性，辅助乘积维数极小用于把有界次数方程的矛盾落实到具体的 $Z_{i\ell}$（`build/sections/05-minimal.tex:124`）。两次极小性针对不同对象，不能合并，否则要么得不到投影排除的障碍形态，要么得不到方程的禁止结论。

第四处是固定数据的时机。投影正规性、$t_0$、$\delta_\ell$、有限方向集 $\mathcal H_\ell$ 都在构造之前固定，这样后面出现的常数才独立于下标与逼近。我核对过：$t_0$ 由"换元后第一项是固定正形式乘以 $t_0$"定出（`build/sections/08-cut.tex:24`），$\delta_\ell=\max(1,C_{f,e,U})$ 依赖逼近但与 $i$ 无关（`build/sections/04-high.tex:338`），有限方向集只依赖固定母体（`build/sections/03-tangent.tex:385`）。

## §24 关于可形式化性的观察

这一点我要标注为推测，因为素材里没有任何形式化目录或机器验证记录的痕迹，我也没有去查证。按论文现在的写法，若要把它形式化，最难的应当是三处。第一处是实量词消去（`build/sections/04-high.tex:89` 附近）：它既要证明多项式整性，又要从消去后的符号条件挤出正下界，涉及实闭域的量词消去定理，机械验证的代价很高。第二处是 Ax 定理的解析形式（`build/sections/03-tangent.tex:235`）：解析子集、指数映射、Zariski 闭包这些对象的形式化在现有库里覆盖有限。第三处是算术 Siu 不等式与基本不等式（`build/sections/06-arithmetic.tex:219`、`build/sections/06-arithmetic.tex:228`）：阿代尔丛、算术体积、本质极小这些概念的形式化基础还在建设中。

相对而言，投影排除、有限方向引理、局部指数的组合部分更接近"有限维线性代数加估计"，形式化难度低一些。我推测这篇论文短期内不会走形式化路线，因为它依赖的几何与分析定理太多、太重。这只是基于素材形态的判断，不代表任何外部信息。

## §25 非稠密与有限性两种结论的对照

把论文的两类结论并排看，能看清为什么它先证较弱的非稠密、再升级到有限性。非稠密定理的结论是"一个集合不 Zariski 稠密"，它的否定式只要求"存在一个真闭子集包含交集"，量化上是存在性的、结构上是松的。有限性定理的结论是"极大非典型子簇只有有限多个"，它要求把交集分解成有限多个真子簇，量化上是计数式的、结构上是紧的。

从松到紧的代价体现在两个地方。第一，非稠密只对"含于无真挠陪集"的 $X$ 陈述，而主定理里的 $X$ 一般会含于某个挠陪集 $S$；处理办法是把 $S$ 平移成阿贝尔簇，把问题搬进 $S$，这需要 $S$ 本身是挠陪集（否则平移不保持特殊子簇结构）。第二，非稠密给的是"某个真闭子集"，而主定理要的是"有限多个最大非典型子簇"，中间需要最优子簇归约，而归约的假设比非稠密定理更强，它要求对每个阿贝尔子簇 $B$、每个维数上界 $m$、每个缺陷上界 $e$ 都统一成立。这就是为什么本文的承重结论必须是那个带全称量词的序列定理，而不能停在某个固定 $X$ 的非稠密上。

还有一个常被忽略的对照点：非稠密的"真闭子集"可以依赖 $X$，而有限性的"有限列表"必须由 $X$ 显式确定。前者允许选择公理式的取法，后者不行。这一差别在归约里表现为"对所有 $B,Z$ 同时成立"的要求，也正是全称量词无法被局部化削弱的原因。我最初以为可以把非稠密逐点加强成有限性，后来明白逐点加强不保留"有限多个"，必须一次性拿到统一版本。

## §26 若重做一遍我会怎么安排

如果让我从头再走一遍，我会在三个地方更早做决定。

第一个决定是尽早接受"尺度分层"作为骨架，并非先试等分布。等分布那条路我花了太多时间才放弃，其实只要问一句"支撑集是否固定"，就能立刻否掉。今后遇到"对象可变、次数无界"的有限性，我会先问：能不能把无界性编码成结构（这里是尺度），并非先想办法消掉它。

第二个决定是尽早把"最小反例"设成主工具，并且明确它要用来反推障碍形状。投影排除引理的价值在于它把"若存在障碍则能造出更小反例"写成了可操作的形式。我起初把最小性当成一个方便的归纳假设，没意识到它同时是一个障碍分类器：任何能挡住下降的配置，都会被最小性逼成特定形状，而这些形状恰好能用切正性排除。今后遇到同类问题，我会把"障碍必须长什么样"当成一等公民来写。

第三个决定是尽早把算术部分当作独立的一半来规划。有界尺度那一半需要的机器（两测度比较、一致度量变分、局部指数、乘积切割）与全高那一半几乎不共享，若一开始就把它当成"简单情形"，会在中途被迫重排章节。现在回看，论文把章节顺序排成全高、极小乘积、零维消去、算术正性、局部指数、乘积切割，正是按依赖关系，并非按直觉难度排的。

我还会改一处表述习惯。论文里大量使用"若…则能造出更小反例"的排除式陈述，第一次读时我总想把它们读成正面估计，结果反复卡壳。若由我来写，我会在每一条排除引理后面加一句"本条的使用方式是：假设某配置存在，则与极小性矛盾"，把用法点明，免得读者误把排除当成构造。

## §27 台账

这一节把整篇笔记里我认定承重的符号与数值收进一张表。前四列依次记录符号本身、它的取值或增长率、在本会话里真实读到的位置、以及它在证明链里被哪一步消费；最后一列记录一个反事实，即若把这个符号或数值改掉，最先断在哪一步。我按证明的实际依赖顺序排列，从主定理的非典型性判据开始，经序列数据、切正性、全高算术、极小乘积、有界尺度算术、局部指数、乘积切割，直到最优子簇归约与有限秩推论。

依赖结构可以概括成几条主干。第一条主干是定义链：非典型性判据与特殊闭包单调性支撑主定理的陈述，而后者经最优子簇归约才落到计数式结论。第二条主干是几何链：局部纤维界与尺度递降定义序列数据，乘积切障碍把切积分取零翻成乘积子簇障碍，有限方向引理再把障碍方向压进有限集合，最后一致切正性给出邻域与相邻差分两支正性。第三条主干是全高算术链：交下界供 Dill 不等式的几何假设，二进乘子与系数高度递推保证阈值独立于近似，乘法常数先于精度固定是矛盾闭合的前提。第四条主干是有界尺度算术链：缩放同态收敛给出极限测度，两个测度在对角元组处的分歧给出缺口，一致度量变分把"算术相交趋于零"翻成"两测度一致"，从而反证正下界。第五条主干是收尾链：小截面范数经 Cauchy 估计与半径界翻成加权指数，正指数经域范数与乘积定理翻成有界次数超曲面，与极小乘积的禁止条件冲突。

每一行的位置栏都是我本会话真实读出的 `文件.tex:行`。凡我无法从素材确证的判断，正文里已用推测标注，本表只收可定位的符号与数值。表头两行如下。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\dim Y>\dim X+\dim T-\dim S$ | 非典型性判据 | build/sections/01-introduction.tex:38 | 主定理陈述 | 非典型定义失效 |
| $A^{[r]}$ 特殊子簇之并 | 高余维并集 | build/sections/01-introduction.tex:61 | 非稠密定理 | 交集目标改变 |
| $Z\subseteq Z'$ 蕴含特殊闭包含 | 闭包单调性 | build/sections/01-introduction.tex:23 | 最优子簇归约 | 归约包含链断裂 |
| $\mathcal H(G)=G(\overline{\mathbb Q})\otimes_{\mathbb Z}\mathbb R$ | 实高度空间 | build/sections/02-sequences.tex:15 | 实同态微积分 | 归一化无从定义 |
| $\lVert P_{(\ker f)^\perp}(x_i)\rVert\to0$ | 广义逆推论 | build/sections/02-sequences.tex:47 | 极限投影 | 小投影条件传不下去 |
| $f^\dagger=p(f^*f)f^*$ | 广义逆构造 | build/sections/02-sequences.tex:74 | 实同态微积分 | 正交投影恒等式不成立 |
| $\dim_{y_{i\ell}}(Y_\ell\cap(y_{i\ell}+W_\ell))\le m_\ell$ | 局部纤维界 | build/sections/02-sequences.tex:136 | 序列数据 | 纤维维数不受控 |
| $H_{i\ell}/H_{i\ell'}\to0$ | 相邻尺度比 | build/sections/02-sequences.tex:141 | 高度分解 | 尺度分离失败 |
| $\operatorname{codim}_{\operatorname{Lie}(W)}V>\sum_\ell m_\ell$ | 严格余维不等式 | build/sections/02-sequences.tex:175 | 辅助序列定理 | 禁止序列失去矛盾 |
| $U_i=\operatorname{diag}(H_{i\ell}^{-1/2})\operatorname{Lie}(B_i)$ | 缩放子群 | build/sections/02-sequences.tex:263 | 极限投影 | 初始投影不收敛 |
| $m_\ell=\dim Y_\ell-\dim Y_{\ell^-}$ | 纤维维数 | build/sections/02-sequences.tex:292 | 投影构造 | 纤维界之和偏离 $\dim X$ |
| $\sum_\ell a_\ell$ 不小于 $\Phi$ 在 $\operatorname{Lie}(C)$ 上的秩 | 投影障碍 | build/sections/03-tangent.tex:32 | 投影排除 | 障碍配置漏判 |
| $m'_\ell=m_\ell+e_\ell-a_\ell$ | 投影纤维界 | build/sections/03-tangent.tex:46 | 投影排除 | 纤维增益算错 |
| $\operatorname{codim}_{\operatorname{Lie}(W')}V'$ 的展开 | 余维账本 | build/sections/03-tangent.tex:103 | 投影排除 | 最小反例下降失败 |
| $P_Z(g)=\int_Z(g^*\omega)^{\dim Z}$ | 切积分 | build/sections/03-tangent.tex:146 | 一致切正性 | 正性判据失效 |
| $P_Z(g\operatorname{diag}(b_\ell))=\prod_\ell b_\ell^{2\dim Z_\ell}P_Z(g)$ | 分块缩放恒等 | build/sections/03-tangent.tex:164 | 算术次数 | 缩放因子算错 |
| 乘积子簇上局部纤维维数之和大于 $g$ 的秩 | 乘积切障碍 | build/sections/03-tangent.tex:189 | 投影排除 | 方向替换断裂 |
| $\dim U_1$ 大于 $h$ 在 $\operatorname{Lie}(C^*)$ 上的秩 | Ax 切线不等式 | build/sections/03-tangent.tex:256 | 乘积切障碍 | 障碍不等号反向 |
| $S_0=\lim_{t\to0}\operatorname{diag}(t^{w_\ell})S$ | 格拉斯曼极限 | build/sections/03-tangent.tex:266 | 乘积方向替换 | 退化不保切相交维数 |
| $\delta_{\mathrm{geo}}(D)=\dim\langle D\rangle_{\mathrm{geo}}-\dim D$ | 测地缺陷 | build/sections/03-tangent.tex:312 | 有限方向引理 | 最优性比较失据 |
| 固定母体上局部纤维维数之和大于秩加 $\varepsilon$ | 固定母体秩不等式 | build/sections/03-tangent.tex:340 | 有限方向引理 | 方向固定失败 |
| $\Delta g(v_1,\ldots,v_r)=(g(v_2)-g(v_1),\ldots)$ | 相邻差分映射 | build/sections/03-tangent.tex:421 | 一致切正性 | 第二支正性失效 |
| $\theta^{-1}D_Z^{-\omega_1}$ | 交下界 | build/sections/04-high.tex:36 | Dill 假设 | 高度不等式缺输入 |
| $p_Z(x_1,\ldots,x_q)=P_Z(\sum_j x_je_j)$ | 切积分多项式 | build/sections/04-high.tex:46 | 交下界 | 整性与分母界失效 |
| $\Lambda=\theta(2t_1u_0)^{u_0}\max_\ell(N_\ell+1)\prod_\ell\deg X_\ell$ | Dill 常数 | build/sections/04-high.tex:161 | 乘法常数固定 | 精度选择依赖近似 |
| $c_1=c_2=\Lambda^{\psi(0)}$ | 乘性常数 | build/sections/04-high.tex:163 | 高度比较 | 矛盾不闭合 |
| $v_{i\ell}=u2^k$ | 二进乘子 | build/sections/04-high.tex:258 | 尺度平衡 | 系数高度增长失控 |
| $b_w(k+1)\le4b_w(k)+C_w$ | 系数高度递推 | build/sections/04-high.tex:328 | 一致系数界 | 阈值不独立于近似 |
| $h(y_{i\ell})\ge\kappa_\ell H_{i\ell}$ | 源高度下界 | build/sections/04-high.tex:385 | 高度比较 | 大源项不成立 |
| $\sqrt{\widehat h_L(f([v_i]y_i))}/(eR_i)\le C\eta+o(1)$ | 小像估计 | build/sections/04-high.tex:400 | 高度比较 | 误差项不可控 |
| $[k_i:\mathbb Q]$ 有界 | 定义域次数界 | build/sections/05-minimal.tex:112 | 极小乘积 | 有限性论证失效 |
| $d_\ell=\dim Z_{i\ell}$ 与 $d=\sum_\ell d_\ell$ | 辅助维数 | build/sections/05-minimal.tex:129 | 极小性 | 下降不终止 |
| 有界次数超曲面必含因子 | 极小乘积结论 | build/sections/05-minimal.tex:136 | 乘积切割 | 矛盾构造失据 |
| $Z_{i0}=Z_0$ 固定 | 低因子有限性 | build/sections/05-minimal.tex:146 | 极小乘积 | 低因子随 $i$ 变 |
| $d_0>0$ | 低因子正维 | build/sections/05-minimal.tex:237 | 零维消去 | 测度分歧不现 |
| $\operatorname{codim}_{H^h}V_*=hc-a+t\ge hc-a$ | 复制余维 | build/sections/05-minimal.tex:272 | 零维消去 | 禁止序列造不出 |
| $\varphi_i=F_i\operatorname{diag}(b_{i\ell}^{-1})\to\Phi$ | 缩放同态收敛 | build/sections/06-arithmetic.tex:54 | 测度极限 | 极限测度不存在 |
| $h_{\bar E_i}(y_i)=o(M_i^2)$ | 标记点小高度 | build/sections/06-arithmetic.tex:68 | 局部指数 | 指数下界消失 |
| $(\bar E_i^d\cdot Z_i)\asymp B_i$ | 几何次数 | build/sections/06-arithmetic.tex:85 | 算术正性 | 归一化因子错 |
| $(\bar E_i^{d+1}\cdot Z_i)/(M_i^2B_i)$ | 算术相交商 | build/sections/06-arithmetic.tex:111 | 算术正性 | 小截面不存在 |
| $\mu_{i,j}$ 由曲率测度归一 | 两个测度 | build/sections/06-arithmetic.tex:126 | 测度比较 | 分歧不现 |
| $\lim_i(\mu_{i,1}(f_*)-\mu_{i,2}(f_*))>0$ | 测度缺口 | build/sections/06-arithmetic.tex:206 | 反证矛盾 | 检验函数失效 |
| $e_1(X,\bar D)/(n+1)$ 与算术相交之比 | 基本不等式 | build/sections/06-arithmetic.tex:219 | 小点集 | 高度估计失败 |
| $\widehat{\operatorname{vol}}(\bar D-\bar N)\ge(\bar D^{n+1}\cdot X)-(n+1)(\bar D^n\bar N\cdot X)$ | 算术 Siu | build/sections/06-arithmetic.tex:228 | 正体积 | 小截面无来源 |
| $\bar U_i=\bar U_{i,1}-\bar U_{i,2}$ | 半正分解 | build/sections/06-arithmetic.tex:287 | 一致度量变分 | 一致界不成立 |
| $\lVert s_i\rVert_{v,\sup}\le e^{-cn_iM_i^2}$ | 小截面范数 | build/sections/06-arithmetic.tex:425 | 局部指数 | 指数增益缺失 |
| $\operatorname{ind}_{n,b}(s;y)=\min\sum_\ell\lvert\alpha_\ell\rvert/(nb_\ell^2)$ | 加权指数 | build/sections/07-index.tex:20 | 局部指数命题 | 矛盾构造失效 |
| $b_{i\ell}^2H_{i\ell}\asymp M_i^2$ | 权重匹配 | build/sections/07-index.tex:42 | 局部指数 | 加权指数无下界 |
| 泰勒系数对数不超过范数项、度量项与半径项之和 | Cauchy 估计 | build/sections/07-index.tex:120 | 局部指数 | 指数比较不闭合 |
| $\sum_v\nu_v\log S_{i\ell v}\ll H_{i\ell}$ | 系数高度和 | build/sections/07-index.tex:137 | 半径界 | 高度估计不闭合 |
| $\rho_{i\ell v}=(\gamma_v/(c_vS_{i\ell v}))^4$ | 解析半径 | build/sections/07-index.tex:144 | Cauchy 估计 | 半径损失失控 |
| 无限位度量变分不超过 $C\xi^2M_i^2$ | 无限位度量变分 | build/sections/07-index.tex:201 | 局部指数 | 变分损失失控 |
| $D_{i\ell}=e_it_0n_ib_{i\ell}^2$ | 多项式多重次数 | build/sections/08-cut.tex:76 | 乘积切割 | 指数界丢失 |
| $D_\ell/D_{\ell+1}\ge(mN/\epsilon)^N$ | 乘积定理阈值 | build/sections/08-cut.tex:155 | 乘积切割 | 分量不成乘积 |
| $q\prod_\ell\deg J_\ell\le C(N,\epsilon)$ | 共轭乘积次数界 | build/sections/08-cut.tex:182 | 有界次数下降 | 矛盾不成立 |
| $\delta(Z)=\dim\langle Z\rangle_{\mathrm{sp}}-\dim Z$ | 特殊缺陷 | build/sections/09-finiteness.tex:14 | 最优子簇有限性 | 最大非典型不最优 |
| $n\gamma=n_1a_1+\cdots+n_ra_r$ | 有限秩关系 | build/sections/10-finite-rank.tex:38 | 有限秩归约 | 子群循环稠密不成立 |
| $\operatorname{codim}_BH=\operatorname{codim}_AG\ge d+1$ | 有限秩包含 | build/sections/10-finite-rank.tex:90 | 有限秩推论 | 平移非稠密不成立 |
| $\dim\pi(X)=\min\{\dim X,\dim(A/B)\}$ | 商维数条件 | build/sections/01-introduction.tex:143 | 既有结果对照 | 限制条件不匹配 |
| $n=\dim\mathcal A$ 与 $q=\operatorname{rank}_{\mathbb Z}\operatorname{End}(\mathcal A)$ | 多项式维数 | build/sections/04-high.tex:42 | 交下界 | 分母界失效 |
| $p_Z$ 次数不超过 $2n$ | 多项式次数 | build/sections/04-high.tex:48 | 交下界 | 整性论证失效 |
| $Q=K!$ | 统一分母 | build/sections/04-high.tex:60 | 交下界 | 下界常数失控 |
| $b=\max_j\deg_c R_j$ 与 $h=\max_j\deg_t R_j$ | 消去后次数 | build/sections/04-high.tex:100 | 交下界 | 根方程界失效 |
| $Q_0=(\boxtimes_\ell L_\ell^{t_1e^2})\otimes(f^*L)^{-1}$ | 全局生成丛 | build/sections/04-high.tex:268 | 截面系统 | 生成元计数失败 |
| $a_{i\ell}=e^2v_{i\ell}^2$ | 权重 | build/sections/04-high.tex:287 | Dill 假设 | 次数不匹配 |
| $\frac{f([v_i]y_i)}{eR_i}=(f/e)D_iq_i$ | 分解恒等 | build/sections/04-high.tex:395 | 小像估计 | 误差项不可控 |
| $\frac14\sum_\ell\kappa_\ell\le c_1C^2\eta^2+o(1)$ | 最终不等式 | build/sections/04-high.tex:424 | 全高矛盾 | 精度选择失据 |
| $q=\binom{N+D}{D}$ | 方程空间维数 | build/sections/05-minimal.tex:33 | 高度核引理 | 基高度界失效 |
| $\pi:Z\to Z'\subseteq\mathbb P^{d+1}$ | 有限投影 | build/sections/05-minimal.tex:80 | 余法引理 | 超曲面次数界失效 |
| 算术次数不超过 $O(H_{i\ell})$ | 算术次数界 | build/sections/05-minimal.tex:176 | 极小乘积 | 稠密高度条件失效 |
| $B_i=\prod_{\ell=0}^s b_{i\ell}^{2d_\ell}$ | 缩放因子 | build/sections/06-arithmetic.tex:63 | 几何次数 | 归一化错 |
| $(E_{i,j}^{rd}\cdot Z_i^r)\asymp B_i^r$ | 几何次数 | build/sections/06-arithmetic.tex:87 | 测度归一 | 极限测度错 |
| $\gamma_j(\varphi_i)\to\gamma_j(\Phi)$ | 不变量收敛 | build/sections/06-arithmetic.tex:167 | 测度极限 | 极限测度不存在 |
| $h_{\bar E_{i,1}}(x),h_{\bar E_{i,2}}(x)\le C_r\epsilon_iM_i^2$ | 同时小高度 | build/sections/06-arithmetic.tex:253 | 测度比较 | 比较不成立 |
| $\lvert\lambda_i\operatorname{av}_{i,x_i}(f)-\lambda_i\mu_{i,j}(f)\rvert\le\eta+o(1)$ | 平均与测度差 | build/sections/06-arithmetic.tex:394 | 测度比较 | 一致变分失效 |
| $U_\ell+\beta_\ell T_\ell+Q_\ell(T_\ell,U_\ell)=0$ | 隐式方程组 | build/sections/07-index.tex:85 | 解析半径 | 参数化失败 |
| $\kappa_v=\sup_z\log(\lVert e_v(y_i)\rVert_v/\lVert e_v(z)\rVert_v)$ | 度量变分 | build/sections/07-index.tex:114 | 局部指数 | 度量项失控 |
| $n_i((c-C\xi^2)M_i^2-C_0-o(M_i^2))$ | 指数下界源 | build/sections/07-index.tex:285 | 局部指数 | 指数下界不成立 |
| $\pi_{i\ell}:Z_{i\ell}\to\mathbb P^{d_\ell}$ | 有限投影 | build/sections/08-cut.tex:53 | 域范数 | 多项式构造失败 |
| $e_i=\prod_\ell\deg_{L_\ell}Z_{i\ell}$ | 投影次数 | build/sections/08-cut.tex:71 | 域范数 | 多重次数算错 |
| $\sigma_j=\sigma_0+j\epsilon$ | 指数级别 | build/sections/08-cut.tex:133 | 分量构造 | 相邻分量不重合 |
| 局部重数不小于 $\left(\frac{\epsilon}{2c}\right)^c\prod_\ell D_\ell^{c_\ell}$ | 局部重数界 | build/sections/08-cut.tex:241 | 共轭计数 | 幂不抵消 |
| $\overline{\langle(ma_1,\ldots,ma_r)\rangle}=[m]D=D^0$ | 稠密子群 | build/sections/10-finite-rank.tex:28 | 有限秩归约 | 循环稠密不成立 |
| $H=[n]_B^{-1}((G\times\{0\})+\psi(C))$ | 预像子群 | build/sections/10-finite-rank.tex:76 | 有限秩包含 | 包含关系失效 |

## §28 勘误

本节的登记不改变任何已落盘内容，只按规格的机械清理通道申报命中项，命中字形一律用中性描述指代，不逐字抄写。

第一类，规格点名的两字成对连接结构，属于否定加转折的那一族，全文命中 7 处，分别位于第 0 节两处、第 5 节一处、第 12 节一处、第 18 节一处、第 19 节两处。该类在规格列出的自动清理范围内，本体侧一次即可清掉。

第二类，规格点名的两字否定并列连接词，命中 2 处，位于第 7 节与第 19 节各一处。该类同样在规格列出的自动清理范围内。

第三类，规格点名的四字口语连接语，命中 1 处，位于第 8 节。该类未见于规格列举的自动清理清单，请本体侧按禁串清理通道处理。

第四类，成对长停顿号，命中 2 处，位于第 2 节与第 5 节各一处。该类在规格列出的自动清理范围内。

另有一项非禁串缺口需要申报。首块（第 0 节至第 6 节）首次落盘字节为 14,837，低于规格给定的硬下限 20,000。按规格，该缺口不可回改，属永久缺口，此处按类别登记。

除上述四类命中与一项首块缺口外，本次落盘没有删除、回滚、改写、重排任何已落盘内容，也没有使用脚本或整档重写。
