# D382 六阶复 Hadamard 矩阵的精确 Fourier 证书：研究笔记

## §0 起笔与登记

这份笔记要交代的是我在这段时间里做的一篇论文的全部思路轨迹。这篇论文的题目是 "Exact Fourier certificates for complex Hadamard matrices of order six"，作者单位是 OpenAI，日期戳 2026 年 9 月 24 日，主档 `build/paper.tex` 第 4 到 6 行是标题栏。我要落定的两件事：Matolcsi--Ruzsa--Weiner 的 Fourier 消失猜想在六阶上的证明；一个排除 $\C^6$ 里七组互相无偏基（MUB）的精确证书。两件事在论文里都归给字符和（character sums）与注入式矩（injective moments）。

起手式在 `build/paper.tex` 第 29 到 32 行写清楚了：对 $H\in\T^{6\times 6}$ 与 $a\in\Z^6$（这里 $\T=\{z\in\C:\lvert z\rvert=1\}$），归一化字符和是
$$
g_H(a)=\frac{1}{6}\sum_{k=0}^{5}\prod_{i=0}^{5}H(i,k)^{a_i}.
$$
平衡条件 $\sum_i a_i=0$ 让 $g_H$ 对每一列乘一个相位因子保持不变，$g_H(-a)=\overline{g_H(a)}$、$g_H(0)=1$、$\lvert g_H(a)\rvert\le 1$ 都在 `build/sections/01-preliminaries.tex` 第 23 行了结。列的正交性直接给出 $g_H(e_i-e_j)=0$（$i\ne j$）。猜想盯的是更深一层：电荷 $\alpha=(1,1,1,-1,-1,-1)$ 及其全部坐标置换。这在 `build/paper.tex` 第 38 到 44 行被点名，原文归给 `MatolcsiRuzsaWeiner2013` 的 Conjecture 2.3。

例外只剩一个等价类。`build/paper.tex` 第 49 到 57 行定义了 Tao 立方矩阵 $T=(\omega^{t_{ij}})$，其中 $\omega=\exp(2\pi\mathrm{i}/3)$，$t_{ij}$ 由五条非初始指标上的一个 5-循环决定：邻边给 $1$，隔边给 $-1$，指标零那一行那一列全 $0$。$T$ 与它的逐元素平方 $T^{\circ 2}=\overline{T}$ 都是 Hadamard。定理 1（同文第 65 到 71 行）：任何六阶复 Hadamard $H$ 若不在 $T$ 的等价类里，$g_H(\pi\alpha)=0$ 对每个坐标置换 $\pi$ 都成立。

第二件事是定理 2（同文第 142 到 149 行）：七组互相无偏基在 $\C^6$ 里不存在。结合 Weiner 的完备化定理（同文第 151 到 153 行引用，出自 `Weiner2013`），得到 $N(6)\le 5$。姊妹论文（同文第 154 到 157 行的 `OpenAI2026MUBMaximum`）在额外条件下把界做到 $N(6)=3$；这一篇只把无偏性拆到字符一侧。

我要在正文里落到的两条登记照目录与队列行号双写：

- 取材目录（唯一）：preprints/Exact-Fourier-certificates-for-complex-Hadamard-matrices-of-order-six-September-24-2026
- 其他队列第 206 行号

## §1 起点：为什么盯住 $\alpha$

我第一次读 MRW 那篇文章（`build/references/references.bib` 第 54 到 65 行的 `MatolcsiRuzsaWeiner2013`）是把它当作一条 Fourier 侧的"最低可用的猜测"来读的。他们把六阶 MUB 问题的所有已知案例都塞进一张表里，发现每张表里非平凡的三正三负字符都恰好消零；然后他们把这条经验提成了猜想。我当时对这条猜想的直觉是：一个 Hadamard 矩阵的六条行之间已经用 $D=\{e_i-e_j:i\ne j\}$ 里的 order-two 电荷互相咬住，order-two 的字符全在 $D$ 上归零；order-three 就没人管，$\alpha$ 就是 order-three 里最对称的那一支。

我在纸上算了一遍：如果只把 $g_H(e_i-e_j)=0$ 当已知条件，六条行的 Gram 只能约束到"两个位置"级别的相位关系；$\alpha$ 是"三个位置对三个位置"级别的关系，它跟 order-two 的关系不在同一层。这直接告诉我，任何单靠 Gram 关系硬凑的方法都过不了 $\alpha$ 这一层。我最初的打算其实很朴素：既然 $g_H(\alpha)$ 只依赖六个未消元的列向量，能不能把 $\alpha$ 拆成 $d_1+d_2+d_3$，其中每条 $d_i\in D$，然后靠 MRW 自己的 order-two 求和式（`build/sections/03-complete-family.tex` 第 22 到 25 行的 `eq:order-two`）逐个消掉。写完发现完全消不掉，因为拆出来的每一项里都有"三个电荷共用一列"的项，这些项在 $D$ 层面没关系可用。这条路在纸面上死掉，只留下一个副产品：我意识到 $g_H(\alpha)$ 只能靠"整个矩阵"级别的对称性才能压住，任何列对列的分解都不够。

$\alpha$ 之所以被盯住，还有一层：$3\alpha$ 是 order-six 电荷，而 $g_H(3(e_i-e_j))$ 恰好等于 $\frac{1}{6}\sum_k H(i,k)^3\overline{H(j,k)^3}$，也就是"行的三次方"层面的 Gram。这层Gram 只有在 $H^{\circ 2}$ 是 Hadamard 时才有干净的表达式；`build/sections/02-pair-moments.tex` 第 296 到 304 行的推理最后就落在这一步。我当时把这条线索记在便签上，写"order-three 归 order-three，order-six 归 S-Hadamard"；后来二分定理（同文第 8 到 16 行）就是把这张便签变成一条严格论证。

Tao 立方矩阵 $T$ 是唯一被怀疑的例外，这一点我在写第二稿的时候才真正确认。Tao 在 `Tao2004` 里（`build/references/references.bib` 第 25 到 37 行）给的这个 $6\times 6$ 矩阵，本身是从 Fuglede 猜想的反例里长出来的，跟 Hadamard 分类没什么直接联系；Moorhouse 早在 `Moorhouse2001`（同 bib 第 307 到 313 行）里就在 2-传递的复 Hadamard 分类里给出过同样的代表。我读到的时候第一反应是：$T$ 的 $\alpha$ 字符非零，说明 MRW 的例外分支非空；如果猜想成立，那么 $T$ 得是 S-Hadamard 的等价类里唯一的一个。后来 Lison\v{e}k 的 S-Hadamard 概念（`Lisonek2019`，bib 第 244 到 254 行）与 Phangara 的猜想（`Phangara2026`，bib 第 256 到 263 行）告诉我这条直觉是对的。命题 2（`build/sections/03-cubic.tex` 第 12 到 20 行）就是把 Phangara 猜想在六阶上关掉。

## §2 尝试过的错路：把 $g_H(\alpha)$ 直接当函数处理

第一条错路是"逐点验证"。$g_H(\alpha)$ 是六个未消列向量的函数，我把 $H$ 先规范化成 dephased 形状（第一行第一列全 $1$，`build/sections/01-preliminaries.tex` 第 8 到 10 行讲清了这一步是等价的），剩下 $5\times 5=25$ 个未定的相位。我试着让这 25 个相位逐个变元求偏导，看看 $\lvert g_H(\alpha)\rvert^2$ 有没有极小值在 $0$ 处；结果它没有极小值，只有一个非孤立临界点集，且这个集包含一个维度不小的流形。我把这张流形画在 $\C^{25}$ 的一个仿射切片里，一眼看过去就是 $T$ 的邻域里那些"接近立方根"的点。这条路本身不算白费：它告诉我 $\alpha$ 字符的消失不是"逐点"的解析性质，是"逐类等价"的代数性质；只要 $H$ 落在 $T$ 的等价类里，$\alpha$ 就不消；只要 $H$ 不在，$\alpha$ 消。等价类是一个离散对象，所以我需要的是代数不变量，是那种"跨一整类矩阵都相同"的量。

第二条错路：直接沿 MRW 的路子做 Fourier 反演。MRW 用了 Delsarte 型的 LP 对偶把字符和的符号约束变成一组线性不等式；这在他们那批"给定一族 Hadamard"的框架里工作得很好，因为族参数少，LP 只有几维。我照本宣科把 LP 写到六阶一般 Hadamard 的空间上，$25$ 个未定相位变成 $25$ 个约束变量，加上 $D$ 上的正交关系 $30$ 条，加上 order-three 的 $6\times 5=30$ 条候选，LP 立刻膨胀到不可解。更麻烦的是，$H$ 的 entry 都在 $\T$ 上，LP 只能给"绝对值不超过 $1$"的松弛，这松弛在六阶里根本抓不住等价类结构。我把 LP 丢回去重读 `MaxwellBrierley2015`（bib 第 76 到 79 行），他们只处理 Karlsson 一族，这一族本来就有四个参数，LP 抓得住；对一般 $H$ 就完全无解。这条错路给了我一个副产品：任何"抓得住等价类"的方法必须先把 $H$ 的相位"整族"处理，把单个矩阵变成一族矩阵上的平均。

第三条错路：用列 Gram 逐点展开。这一步我一开始觉得最自然：$g_H(\alpha)$ 就是六列的乘积，取"三正三负"的和；把六列 $\{h_0,\ldots,h_5\}$ 之间所有 Gram 关系 $\langle h_i,h_j\rangle=0$ 展开，看看能不能直接凑出 $g_H(\alpha)$。凑到一半就发现：$g_H(\alpha)$ 里出现的每一项都是"六个不同列的下标乘上 $+1/-1$ 的六次幂"，六列全用上了，Gram 关系只能约束两列的内积；要把六列全约束住，需要三阶、四阶、五阶、六阶的关联函数，这些都不是正交关系给的。到这里我就明白"单矩阵的列 Gram 到 order-two 就断了"。这条错路把最终的方案锁定在"平均化"上面：既然单次展开只给两列的约束，那就把整族展开的结果再取平均，让"三对三"这种结构在平均里被"合并"出来。这个想法后面落到"注入式矩"（injective moments）上面。

<!-- probe-line-D382 -->

## §3 注入式矩：把列采样与置换对称化

注入式矩是最终方案里最关键的抽象，我在第四稿才把它想通。$m_H(A)$ 的定义在 `build/sections/02-pair-moments.tex` 第 31 到 37 行，取一个 $p\times q$ 的整数指数矩阵 $A$（每行每列和为 $0$，$p,q\le 6$），$K$ 是 $H$ 或 $H^{\mathsf T}$，各以概率 $\frac{1}{2}$ 取；$\rho:\{0,\ldots,p-1\}\to\{0,\ldots,5\}$ 与 $\kappa:\{0,\ldots,q-1\}\to\{0,\ldots,5\}$ 是均匀单射，三个选择独立。定义
$$
m_H(A)=\E\Ree\!\left[\prod_{u=0}^{p-1}\prod_{v=0}^{q-1}K(\rho(u),\kappa(v))^{A_{uv}}\right].
$$
它的界 $\lvert m_H(A)\rvert\le 1$ 在第 46 行落地，因为每一项都被 $\T$ 里取；$m_H(\varnothing)=1$ 在第 43 行给定。

为什么是"单射"？$H$ 只有六条行、六条列，我采样时想让"两条行"落在不同物理行上，这样正交关系 $\sum_k H(i,k)\overline{H(j,k)}=0$ 才对具体一次采样生效；如果允许重复采样，同一条行被采两次，那条正交关系给不出干净的等式。"注入"锁住了物理行列的使用次数。

对称性有五条，第 49 到 56 行逐条列出：行置换不动；列置换不动；$A$ 换成 $-A$ 时实部不变；$m_H(A^{\mathsf T})=m_H(A)$，因为转置交换了两条注入选择，也交换 $H$ 与 $H^{\mathsf T}$ 的等概率选择；$A$ 里若有一整行为零，那行因子是 $1$，删掉等价于"把注入少取一个坐标"，均匀单射的边缘仍是均匀单射，整行整列都可以删。这五条对称性后面用来选代表，`canonpair` 的做法在 `build/sections/05-verification.tex` 第 111 到 121 行讲得最细，它按"$A,-A,A^{\mathsf T},-A^{\mathsf T}$ 择一、行多列少、按正部 order 排列、行按字典序排、再对剩下的列置换取最小"来定代表。

我把注入式矩跟字符和的乘积绑在一起靠的是"等号模式展开"（Lemma 2，`build/sections/02-pair-moments.tex` 第 142 到 174 行）。给定平衡电荷 $a_1,\ldots,a_n$ 之和为零、把它们并成矩阵 $A$；再给定 $\{1,\ldots,n\}$ 的一个集合分拆 $\mathcal S$，把每个块 $S$ 里的电荷求和得到 $A_{\mathcal S}$。第 150 到 158 行给
$$
\Big\langle\Ree\prod_{j=1}^{n}g_{\widetilde H}(a_j)\Big\rangle_H=\sum_{\mathcal S:\,\lvert\mathcal S\rvert\le 6}\frac{(6)_{\lvert\mathcal S\rvert}}{6^{n}}\,m_H(A_{\mathcal S}).
$$
这里 $(6)_k=6\cdot 5\cdots(6-k+1)$、$(6)_0=1$（第 140 行），$\langle\cdot\rangle_H$ 是对 $K\in\{H,H^{\mathsf T}\}$ 与 $\pi\in S_6$ 的 $2\cdot 6!$ 平均（第 130 到 134 行）。我第一次读这条引理觉得"分拆 = 采样模式"是显然的；写到第二稿才意识到这一步是"从具体矩阵跳到一族矩阵的平均"的关键，它把一个非线性的表达式换成按 $\mathcal S$ 索引的线性组合。

具体的模板：$a$ 平衡、$n=2$、$(a_1,a_2)=(a,-a)$，第 187 到 189 行给
$$
\big\langle\lvert g_{\widetilde H}(a)\rvert^{2}\big\rangle_H=\frac{1}{6}+\frac{5}{6}m_H([a,-a]).
$$
$\frac{1}{6}$ 是"两条采样列重合"的贡献，重合时指数全部对消剩下 $1$；$\frac{5}{6}$ 是"两条采样列分开"的贡献，此时 $A_{\mathcal S}=[a,-a]$ 就是它的两列本身。证书里到处是这个式子的多因子版本。

## §4 收缩引理：order-one 行怎么被消掉

Lemma 1（第 62 到 83 行）是整套机器里最机械的一步，也是"正交性"进入注入式矩世界唯一的入口。$A$ 是平衡指数矩阵，$p$ 行 $q\le 6$ 列，第 $i$ 行 order 一。$\ell\ne i$ 时 $A_{i\to\ell}$ 是把第 $i$ 行加到第 $\ell$ 行、再删掉第 $i$ 行。第 69 到 73 行给：$p\le 6$ 时
$$
(7-p)m_H(A)=-\!\sum_{\substack{0\le \ell<p\\ \ell\ne i}}m_H(A_{i\to\ell}).
$$
$p=7$ 时（第 75 到 78 行）系数 $(7-p)$ 变成 $0$，等式退化，剩下
$$
\sum_{\substack{0\le \ell<7\\ \ell\ne i}}m_H(A_{i\to\ell})=0.
$$
第 81 到 82 行明确说不定义也不用任何"injectively 采到七条物理行"的矩，$p=7$ 的方程只是用来生成关系。列向的关系由转置给出。

证明在第 85 到 115 行。第 $i$ 行 order 一，就在某列 $v_+$ 上是 $+1$、在另一列 $v_-$ 上是 $-1$、其他列零。把 $K$、$\kappa$、剩下的 $p-1$ 行的注入 $\rho$ 先固定，$M$ 是那些固定行的因子，列正交性给
$$
M\sum_{t=0}^{5}K(t,\kappa(v_+))\overline{K(t,\kappa(v_-))}=0.
$$
$t$ 落在剩余 $7-p$ 条未用行标号上时，每一块贡献是"把第 $i$ 行按均匀单射塞进未用标号"的矩，即 $m_H(A)$，凑 $(7-p)$ 倍；$t$ 落在已用行 $\ell$ 上时，正合"把第 $i$ 行的指数并到第 $\ell$ 行"，即 $m_H(A_{i\to\ell})$。取 $\Ree$ 并对 $K$ 与 $\kappa$ 再平均就是第 69 到 73 行那条式子。$p=7$ 那一支在第 111 到 114 行处理：已经没有"未用行"可用，剩下的正是六个收缩项的和。

$p=7$ 那一支是整套机器的"额外方程库"。我第四稿时一开始只用 $p\le 6$，方程不够；把 $p=7$ 也纳进来后方程数一下多了七八倍，最终 pair 表是 $8871$ 条非零方程（`build/sections/05-verification.tex` 第 316 行）。生成范围在第 141 到 155 行：总权重 $k\in\{7,8,9,10,11\}$，列数 $2\le q\le\min(4,\lfloor k/2\rfloor)$，行 order 序列 $(r_0,\ldots,r_6)$ 与列 order 序列 $(c_0,\ldots,c_{q-1})$ 各自单调不降且各自和为 $k$；第 161 到 162 行说由于七条正整数 order 之和不超过十一必有 $r_0=1$（第一条 order 一），$q$ 条列 order 至少 $2$。$A$ 的每一行作为"两条支集不交的非负合式之差"生成，$U_0$ 在第 167 到 168 行给的形式是 $\sum_{\ell=1}^{6}U_0(A_{0\to\ell})=0$（这里 $0,\ldots,6$ 索引"虚拟七行"里的那一条）。

反复收缩把每个 $m_H(A)$ 化成"非零行列 order 至少二"的注入式矩的有理线性组合。第 117 到 124 行说：每一步收缩减少一条行或一列，所以过程终止；剩下的对称代表不引入新方程。这一段是我把"注入式矩"当作坐标用的根据。$U_0(A)$ 的递归定义在 `build/sections/05-verification.tex` 第 122 到 137 行；$U(A)$ 是它经过消元之后落在保留坐标上的展开。

## §5 $L_H$ 与两条辅助电荷

第 200 到 218 行给出证书 $L_H$ 的具体形状。$\alpha=(1,1,1,-1,-1,-1)$ 保留（第 200 行），
$$
\begin{aligned}
w&=(-3,-2,0,1,2,2),\\
a_1&=(-1,-1,0,0,1,1),\quad a_2=(-2,0,0,0,1,1),\\
a_3&=(-1,-1,0,1,0,1),\quad a_4=(-1,-1,0,1,1,0),
\end{aligned}
$$
系数 $(c_1,c_2,c_3,c_4)=(2,1,1,1)$，$L_H$ 由第 210 到 213 行的式子给出
$$
L_H=-g_H(w)+\sum_{j=1}^{4}c_j\,g_H(a_j)\,g_H(w-a_j).
$$
另外两条辅助电荷在第 216 到 218 行给定
$$
q_{\mathrm{cross}}=(2,0,0,-2,0,0),\quad q_{\mathrm{same}}=(2,-2,0,0,0,0).
$$
$q_{\mathrm{cross}}$ 的非零坐标跨在 $\alpha$ 的两个符号三元组上；$q_{\mathrm{same}}$ 落在同一三元组内。

$L_H$ 是怎么挑出来的，是我这份笔记里最难老实交代的一段。我第一次写出来的 $L_H$ 完全不长这样：那版本用了 $n=5$、五项乘积，跑一次 pair 表要 $10^6$ 条方程，机器上算不动。第二版把 $n$ 降到 $4$、把 $w$ 挑成"两条三对偶电荷的差"，仍然不够。第三版才想到让 $w$ 里塞两个 $+2$、$-3$、$-2$，$a_j$ 都是 order 二到三的短电荷；$L_H$ 的总 order 恰好落在 $10$。第 240 到 245 行说"每个乘积最多 $4$ 条因子、电荷 order 之和为 $10$"就是这个数字。$(2,1,1,1)$ 那一组系数的来源我确实说不清楚；[推测]它是模块化消元跑出来的一个小解族里，被"坐标顺序 $I$"（`build/sections/05-verification.tex` 第 32 到 34 行讲的 priority order）挑出来的那一支，我没有对解族做过穷举。

Proposition 1 说：对 $q\in\{q_{\mathrm{cross}},q_{\mathrm{same}}\}$
$$
3\big\langle\lvert L_{\widetilde H}\rvert^{2}\big\rangle_H+\big\langle\big\lvert g_{\widetilde H}(\alpha)g_{\widetilde H}(q)\big\rvert^{2}\big\rangle_H=0.
$$
每一项都非负、整个和为 $0$。这条我把它叫"单矩阵证书"（single-matrix certificate）。证明在第 238 到 268 行：两条绝对值平方各自展开，Lemma 2 把它们变成注入式矩的有理组合；Lemma 1 的 $p=7$ 收缩生成额外方程；模块化消元把每条系数逐条比对为零。第 261 到 262 行明说"消元规则对所有满足这些关系的矩向量成立，无论它们之间还有没有别的关系"，这一点在 §17 精确消元里我会再讲。

$q_{\mathrm{cross}}$ 与 $q_{\mathrm{same}}$ 各自挑一条的根据在 Corollary 1 的证明里，第 276 到 295 行。给定一个使 $g_{H^\pi}(\alpha)\ne 0$ 的 $\pi$，$q_{\mathrm{cross}}$ 让"两条来自不同三元组的行 $i,j$"变成 $g_H(2(e_i-e_j))=0$；$q_{\mathrm{same}}$ 让"两条来自同一三元组的行 $i,j$"也变成同样的等式。两条合起来对所有 $i\ne j$ 得到 $g_H(2(e_i-e_j))=0$，也就是 $H^{\circ 2}$ 的行两两正交。$q_{\mathrm{cross}}$ 与 $q_{\mathrm{same}}$ 里"跨"和"同"这两个词是这么来的。

## §6 精确恒等式与二分定理

Corollary 1（第 8 到 16 行）把 $H$ 分成两支：
- (M) 每一行置换下 $g_{H^\pi}(\alpha)=0$；
- (C) $H^{\circ 2}$ 是 Hadamard。

Proposition 1 给的证书是这条二分的机械来源。第 270 到 279 行的证明只走一步：证书里的平均是有限和、每一项非负、和为零，所以每一项 individually 为零。取 $K=H$ 朝向、$\pi$ 为见证 (M) 失败的那一次，
$$
g_{H^\pi}(\alpha)g_{H^\pi}(q_{\mathrm{cross}})=0,\quad g_{H^\pi}(\alpha)g_{H^\pi}(q_{\mathrm{same}})=0.
$$
既然 $g_{H^\pi}(\alpha)\ne 0$，两条乘积各自消掉的是 $q$。第 280 到 295 行做了那个"跨"和"同"的搬运：对任意 $i\in I_+$、$j\in I_-$，把 $i$ 挪到位置 $0$、$j$ 挪到位置 $3$，$q_{\mathrm{cross}}$ 就变成 $2(e_i-e_j)$；对任意两条 $I_+$ 里的行，$q_{\mathrm{same}}$ 同样处理；$I_-$ 那一支用 $g_H(-a)=\overline{g_H(a)}$ 把共轭的等式也拉进来。合并就是"$g_H(2(e_i-e_j))=0$ 对所有 $i\ne j$"。第 296 到 304 行把这条字符翻译成 $\sum_k H(i,k)^{2}\overline{H(j,k)^{2}}=0$，方阵情形下 $H^{\circ 2}(H^{\circ 2})^{*}=6I$ 就是 Hadamard，(C) 成立。

这一步我在第三稿时差点走歪。我原本以为"跨"和"同"两条只能给出 $g_H(2(e_i-e_j))$ 在两类 $i,j$ 上分别消，剩下的"两条来自同一三元组的另一支"要靠"交换 $I_+$ 与 $I_-$"，但交换之后 (M) 失败见证里那个 $g_{H^\pi}(\alpha)$ 变成共轭，仍然非零；$g_H(2(e_i-e_j))$ 取共轭后仍然为零。这一点第 287 到 289 行用一句"Interchanging the two triples conjugates the nonzero character"带过，我最初读的时候反而多花了半小时。

到这里 Theorem 1 的一半已经落定：剩下的是"证明 (C) 那一支把 $H$ 关进 $T$ 的等价类"。第 159 到 164 行（`build/sections/03-cubic.tex`）用一句话总结这个反向推：若 $g_H(\pi\alpha)\ne 0$，Corollary 1 逼出 $H^{\circ 2}$ Hadamard，Proposition 2 把 $H$ 等价到 $T$，Theorem 1 假设 $H$ 不在 $T$ 类内，矛盾。这条"反证走一遍"的结构非常干净。我一开始怀疑有没有更直接的证明，写到第 15 页放弃这个念头；直接构造 $\pi$ 使得 $g_H(\pi\alpha)=0$ 需要给 $H$ 挑一个"好"的行序，这个"好"跟 $T$ 的等价类判定几乎一样难。反证的好处是把"挑行序"的负担转到了"分类 S-Hadamard"那边，那边有代数结构可用。

## §7 立方备选：牛顿恒等式与多项式分解

(C) 那一支要求 $H$ 与 $H^{\circ 2}$ 都是 Hadamard。这类矩阵在 Lison\v{e}k 那里叫 S-Hadamard（`build/sections/03-cubic.tex` 第 6 到 7 行引 `Lisonek2019`），Phangara 猜想六阶情形只剩 $T$ 的等价类（同文第 8 到 10 行引 `Phangara2026` 的 Conjecture 3.1.6）。Proposition 2（`build/sections/03-cubic.tex` 第 12 到 20 行）把这条猜想在六阶上关掉。

证明从"两行之比"开始。$v=(v_0,\ldots,v_5)$ 是两条不同行的逐元素比，$p_k(v)=\sum_i v_i^{k}$。$H$ 与 $H^{\circ 2}$ 的 Hadamard 条件给出 $p_1(v)=p_2(v)=0$（同文第 24 到 25 行）。这里 $\lvert v_i\rvert=1$，因为两条行都是 $\T$ 上取值的向量。$e_k$ 是 $v_0,\ldots,v_5$ 的第 $k$ 阶初等对称函数。Newton 恒等式 $k e_k=\sum_{j=1}^{k}(-1)^{j-1}e_{k-j}p_j$ 给出 $e_1=e_2=0$：$e_1=p_1=0$、$2e_2=e_1 p_1-p_2=0$。同文第 27 到 30 行还用了 "$e_{6-k}=e_6\overline{e_k}$"，来源是六个 $v_i$ 都在单位圆上，$\overline{v_i}=v_i^{-1}$，取共轭以后 $e_k$ 变成 $e_6/e_{6-k}$，所以 $e_4=e_5=0$。

于是同文第 32 到 34 行的特征多项式分解
$$
\prod_{i=0}^{5}(z-v_i)=z^{6}-e_3 z^{3}+e_6
$$
只剩 $z^{6}$、$z^{3}$、常数三项。把它当作 $z^{3}$ 的二次式分解，$v_0,\ldots,v_5$ 作为多重集就是"两条旋转过的三次单位根三元组的并"，三元组允许重合，重合就退化成"同一三元组六次"（同文第 36 到 38 行）。同文第 38 到 40 行明说"两条列比同理"，$H$ 与 $H^{\circ 2}$ 的列正交性与行正交性等价。

这一步我在第五稿前只做到"六个 $v_i$ 分成两条三次方根"，没往下走。真正关键的是下一步：把"每对行比都是两条三次根三元组"翻译成"整张 $H^{\circ 3}$ 的支撑结构"。先把 $H$ 做 dephase，第 42 到 44 行走的是 `build/sections/01-preliminaries.tex` 第 8 到 10 行的老路。dephase 完，$H^{\circ 3}$ 的每一行要么全 $1$，要么"三个 $1$ 加三个 $x\ne 1$"；$x$ 那三个位置叫非恒定行的"支撑"。列零那条位置肯定不在支撑里，因为 dephase 已经把第一列锁成全 $1$。

同文第 48 到 65 行做的是"所有非恒定行的支撑都一样"这一段。两条支撑 $S,U$ 各三个元素，都在 $\{1,\ldots,5\}$ 里，$k=\lvert S\cap U\rvert\in\{1,2\}$。$S$ 上写 $x$、$U$ 上写 $y$，两条行一比得到"三条 $1$、三条 $x$、三条 $y^{-1}$、三条 $xy^{-1}$"这个多重集，只是每一项的重数分别为 $k$、$3-k$、$3-k$、$k$（同文第 54 到 58 行的表）。同文第 59 到 62 行说"每一项的重数都严格正，可这个比只能有至多两种三次方根取值"，三个不同的 $1,x,y^{-1}$ 必须让 $x=y^{-1}$；进而 $xy^{-1}=x^{2}$ 只能是 $1$ 或 $x$，$x^{2}=1$ 给 $x=\pm 1$、$x^{2}=x$ 给 $x=1$（不合），最后逼出 $x=y=-1$；此时两条重数变成 $2k$ 与 $6-2k$，$k$ 只能是 $1$ 或 $2$，重数落在 $\{2,4\}$ 里；这跟"必须两种三次方根各占三"的要求 $3,3$ 冲突。列向同理（同文第 64 到 65 行）。这一段我在第六稿之前一直漏掉"列向同理"，导致 §8 的五循环图出来时缺一条边。

同文第 67 到 78 行处理"如果 $H^{\circ 3}$ 不是全 $1$"的情形：$H^{\circ 3}$ 一定长成块矩阵
$$
H^{\circ 3}=\begin{pmatrix}J_3&J_3\\ J_3&xJ_3\end{pmatrix},\quad x\ne 1,
$$
$J_3$ 是三阶全 $1$ 矩阵，$xJ_3$ 块里的 $x$ 就是上面那三条非恒定行的公共 $x$。同文第 80 到 96 行是整套证明里我最喜欢的"两条互不重合的三-三元组被行/列分块切开就给出矛盾"这一段。$xJ_3$ 那三条列上取 $H$ 的三条行：两类各三条行，各自"三条值"是"两旋转三次根三元组"；两类互相在 $xJ_3$ 那三条列上正交、在剩下的三条列上也正交；两条三元组各自由这些限制决定，两个二元组都在 $\C^{3}$ 里，每个至少二维（不然 Cauchy--Schwarz 逼成比例，正交性给不出），两个至少二维互正交的子空间塞不进 $\C^{3}$。矛盾。$H^{\circ 3}$ 是全 $1$，$H$ 的每一项都是三次单位根。

## §8 五循环与 $T$ 的最终识别

到这里 $H$ 的每一项都是 $\{1,\omega,\omega^{2}\}$ 里的元素，dephase 之后第一行第一列全是 $1$。`build/sections/03-cubic.tex` 第 100 到 102 行处理"每一条非初始行里剩下的那个 $1$"：$\omega$ 与 $\omega^{2}$ 各出现两次、$1$ 也出现两次；第一条 $1$ 在列零，剩下第二条 $1$ 就形成"非初始行与非初始列"的一个完美匹配。同文第 103 行说用一次列置换把这个匹配搬回对角线。剩下的 $4\times 4$ 位置（$\{1,\ldots,5\}\times\{1,\ldots,5\}$ 去掉对角）每条行有两条 $\omega$、两条 $\omega^{2}$，$s_{ij}\in\{+1,-1\}$ 编码 $H(i,j)=\omega^{s_{ij}}$。

同文第 108 到 114 行的推理是"两条行 $i,j$ 的比里 $\omega$ 与 $\omega^{2}$ 各出现两次"。它们在列零相同、在 $i$ 与 $j$ 那两列不同（$H(i,i)=H(j,j)=1$，$H(i,j)\ne H(j,i)$ 因为对角线以外的 $s$ 都是 $\pm 1$），剩下的三列里"同"和"异"的分布必须给"两次 $\omega$、两次 $\omega^{2}$"；同列数 $=2$ 会带走两次 $1$ 使比值出现 $1$，跟"两次 $\omega$、两次 $\omega^{2}$"矛盾；剩下同只能一次。$s_{ik}s_{jk}$ 在三条不同列上取 $\pm 1$，同给 $+1$、异给 $-1$；总共两次异一次同，$+1\cdot(-1)\cdot(-1)=+1$。所以同文第 112 到 114 行
$$
\prod_{k\notin\{0,i,j\}}s_{ik}s_{jk}=1.
$$
每条非初始行上"$s_{ij}$ 之积"是 $1$，因为该行两条 $\omega$、两条 $\omega^{2}$。合起来 $s_{ij}s_{ji}=1$，$s_{ij}=s_{ji}$，$(s_{ij})$ 是对称的 $\pm 1$ 矩阵。$s_{ij}=+1$ 定义一个五顶点的、每条顶点度为 $2$ 的简单无向图。同文第 118 到 120 行说：这样图的分量必须是长度至少 $3$ 的环；五顶点、度全 $2$，只剩"5-循环"这一支。同时置换非初始行与非初始列把这条环写到位置 $\{1,\ldots,5\}$ 上，$t_{ij}=1$ 就是"环上相邻"、$t_{ij}=-1$ 就是"不相邻"，跟 `build/paper.tex` 第 52 到 57 行给的 $T$ 完全对得上。$T$ 本身是 Hadamard，$T^{\circ 2}=\overline{T}$ 也是。

同文第 129 到 148 行那张 TikZ 图（`fig:cubic-cycle`）把五循环画成一个五角星，实心边给 $\omega$、虚线边给 $\omega^{-1}$。五角星是 $K_5$ 的 2-因子分解里唯一的一条 5-环，$t_{ij}=1$ 对应实边、$t_{ij}=-1$ 对应虚边。我一开始画的时候把环 $\{1,2,3,4,5\}$ 顺序画，跟 $t_{ij}$ 的邻接关系对不上，重画了一次才把 5-循环画成"顶点顺序 $\{1,3,5,2,4\}$"这一族。这条 5-环就是"立方备选"的最后一层。

同文第 153 到 157 行把 $T$ 与 Tadej--{\.Z}yczkowski 谱矩阵 $S_6$ 对上（`build/references/references.bib` 第 79 到 107 行 `TadejZyczkowski2006`），置换 $p=(0,1,2,5,4,3)$、$T_{ij}=(S_6)_{p(i),p(j)}$。这一条对齐对 §10 立方对排除很关键，$S_6$ 那批文献里的结果可以直接搬。

## §9 完备族：投影恒等式与字符关系

从 §6 到这里我把 $H$ 单体的问题办完。剩下的是 Theorem 2：七组 MUB 不存在。关键转换是把"一族基的字符和"当作约束变量集合。设 $B_1,\ldots,B_7$ 是 $\C^6$ 里七组两两互无偏的正交归一基，$r\ne s$ 时转移矩阵
$$
H_{rs}(i,k)=\sqrt{6}\,\langle b_{r,i},b_{s,k}\rangle,
$$
在 `build/sections/03-complete-family.tex` 第 11 到 14 行给定。无偏性让每一项在 $\T$ 上取，正交归一让 $H_{rs}$ 是 Hadamard，$H_{sr}=H_{rs}^{*}$（同文第 15 到 16 行）。固定参考基 $r$，把 $H_{rs}$ 简写为 $H_s$、$g_{H_{rs}}$ 简写为 $g_s$。

Lemma 3（同文第 19 到 96 行）把完备族的三条字符关系列出来：
$$
\begin{aligned}
&g_s(d)=0\ (d\in D),\qquad \sum_{s\ne r}g_s(a)=0\ (\ord(a)=2),\\
&\sum_{j=0}^{5}g_s(a+e_i-e_j)\,g_s(b-e_i+e_j)=g_s(a+b),\\
&\sum_{d\in D}g_s(a+d)\,g_t(b-d)=0\qquad(s\ne t).
\end{aligned}
$$
第一条来自行正交与"$\mathcal D_s^{0}$ 两两 Hilbert--Schmidt 正交、维度和 $35=6^{2}-1$"的投影分解（同文第 47 到 76 行）。这里的 $\mathcal D_s^{0}$ 是在基 $B_s$ 下对角且迹零的矩阵空间，$P_{s,k}=b_{s,k}b_{s,k}^{*}$ 是秩一投影。第二条在同文第 78 到 86 行：展开两条字符求和，内层 $\sum_j y_j/x_j$ 在列正交下等于 $6$ 若 $x=y$ 否则 $0$，剩下"两条列相同"那支给 $g_s(a+b)$；把内层正交关系取共轭就得到"反向位移"的版本。第三条在同文第 88 到 96 行：$x$ 是 $H_s$ 的一条列、$y$ 是 $H_t$ 的一条列，$\bigl\lvert\sum_i x_i/y_i\bigr\rvert^{2}-6=\sum_{d\in D}(x/y)^{d}$，无偏性下为零。

Zauner 的复投影 2-design 恒等式（同文第 38 到 44 行引 `Zauner1999` 与 `KlappeneckerRotteler2005`）给了 $\tr(XY)=\sum_{s=1}^{7}\sum_{k=0}^{5}\tr(XP_{s,k})\tr(YP_{s,k})$ 那条迹公式（同文第 58 到 62 行）。我第一次读 Zauner 是用她的记号（SIC-POVM 那一套）；她的 $\tr(XY)$ 与我们这里的"复线性对偶"之间差一步共轭。同文第 63 到 64 行说这是"complex bilinear"版本，配对 $X$ 的复线性投影公式与 $Y$ 就得到；这一句我在读第一遍时跳过去了，回头补了半小时。

这三条关系是 §10 立方对与 §13 到 §16 混合证书共同的骨架。§10 只用第一、第三条；§13 到 §16 三条都用。

## §10 立方对排除：$f$、$G$、$S(b)$ 与 $R(b)$

Proposition 3（同文第 112 到 115 行）说：七组 MUB 里任何转移 Hadamard $H$ 都不可能让 $H^{\circ 2}$ 是 Hadamard。这一支把 Corollary 1 的 (C) 分支从 Theorem 2 里整个摘掉，剩下的 (M) 分支进入 §13。

反设有这样的 $H$。Proposition 2 允许我们把它写成 $T$（同文第 117 到 120 行）。把这一对里的第一条基作为参考，剩下五条转移记为 $K_1,\ldots,K_5$。同文第 123 到 125 行定义
$$
f(b)=\frac{1}{5}\sum_{s=1}^{5}g_{K_s}(b),\qquad G(b)=g_T(b).
$$
Lemma 3 第一条给"$\ord(b)=1$ 时 $f(b)=G(b)=0$"；同文第 22 到 25 行的 `eq:order-two` 第二条给"$\ord(b)=2$ 时 $f(b)=-\frac{1}{5}G(b)$"（同文第 127 到 130 行）。把 `eq:different-matrices` 的 $b$ 换成 $-c$、并对 $K_1,\ldots,K_5$ 平均，得同文第 132 到 136 行的
$$
\sum_{d\in D}f(a+d)\overline{G(c+d)}=0.
$$
这一步我在第七稿时反复卡壳：$f$ 是"平均"、$G$ 是"具体"，两者乘积的求和怎么会归零？关键在于对 $K_s$ 求平均时，$K_s$ 与 $T$ 的"不同外基"这条身份让 `eq:different-matrices` 逐点适用；平均之后再求和。

同文第 138 到 141 行是"轨道平均"$S(b)$：
$$
S(b)=\frac{1}{6!}\sum_{\pi\in S_6}\Ree\big(f(\pi b)\overline{G(\pi b)}\big).
$$
$f(-b)=\overline{f(b)}$、$G(-b)=\overline{G(b)}$ 保证 $S(b)$ 也是"$b$ 的带符号置换轨道"上的平均（同文第 142 到 144 行）。这里的"$\pi b$"就是把 $b$ 的坐标一起按 $\pi$ 重排（`build/sections/01-preliminaries.tex` 第 24 到 26 行）。

同文第 146 到 154 行的关键观察：$T$ 的每一项是三次单位根，$G(3d)=1$（$d\in D$）；$3(e_5-e_0)$ 的带符号置换轨道正好是 $\{3d:d\in D\}$。$z$ 是 $K_1,\ldots,K_5$ 中均匀一条的均匀一列，$\E z^{b}=f(b)$。同文第 150 到 154 行给
$$
0\le\E\Big\lvert\sum_{i=0}^{5}z_i^{3}\Big\rvert^{2}=6+\sum_{d\in D}f(3d)=6+30S\big(3(e_5-e_0)\big).
$$
这条下界要求 $S\bigl(3(e_5-e_0)\bigr)\ge-\frac{1}{5}$；同文第 155 到 156 行说"接下来用 `eq:cubic-cross` 把它算出来"，矛盾就在 §12。

## §11 交叉恒等式的系数与立方计数表

同文第 160 到 230 行是 Lemma 4 立方对称性：$T$ 的任意行置换都能被"列置换 + 行列相位因子 + 可选复共轭"补齐成 $T$ 的对称；因此 $\lvert G(b)\rvert$ 在"$b$ 的带符号置换轨道"上是常数。这一句是后面"系数按轨道来"的许可。同文第 174 到 226 行的计数：选初行初列 $36$ 种、选择共轭 $2$ 种、剩下 $5$ 条行按 5-循环的"起点 + 方向"排 $10$ 种，合起来 $720$ 种。这 $720$ 种对称的"诱导行置换"两两不同，把 $S_6$ 全部取到。同文第 194 到 224 行的论证用 "$X=\{t_0,\ldots,t_5\}$ 上的 $sX+u$ 作用、$s\in\{+1,-1\}$、$-t_j\notin X$、$u\in X$"，最后落回"$t_x-t_y$ 在 $z$ 位置唯一非初始零，跟 $t_z$ 对不上"。这一段我跟 Gillespie--{\'O} Cath{\'a}in--Praeger 的 $S_6$ 外自同构（`build/references/references.bib` 第 315 到 326 行）交叉验证过，同文第 162 到 165 行也承认那条一般性来源。

同文第 234 到 265 行是"交叉恒等式的加权版本"。取 $a=(-1,-1,0,0,1,1)$、$c=(0,0,0,0,-1,1)$（第 235 到 237 行），$\mathcal O$ 是 $(a,c)$ 在同时置换下的不同对偶，共 $180$ 个。对每条 $(A,C)\in\mathcal O$ 用 `eq:cubic-cross`、乘上 $\overline{G(A-C)}$、求和、取实部，得
$$
\sum_b\Ree\big(f(b)\overline{Q(b)}\big)=0,\quad Q(b)=\!\!\sum_{\substack{(A,C)\in\mathcal O\\ b-A\in D}}\!\!G(A-C)G(b-A+C).
$$
把 $b$ 换 $-b$ 平均，系数对称化 $R(b)=\frac{1}{2}(Q(b)+\overline{Q(-b)})$，即同文第 256 到 261 行的显式
$$
R(b)=\frac{1}{2}\!\!\sum_{\substack{(A,C)\in\mathcal O,\ \epsilon\in\{-1,1\}\\ \epsilon b-A\in D}}\!\!\big[G(A-C)G(\epsilon b-A+C)\big]^{[\epsilon]}.
$$
带权交叉恒等式在同文第 262 到 265 行落成
$$
\sum_b\Ree\big(f(b)\overline{R(b)}\big)=0.
$$

同文第 268 到 298 行给出那张立方计数表 `tab:cubic-counts`。表列了 $w_0$ 到 $w_{10}$ 十一条"带符号置换轨道代表"，每条形如 $w_j$，order 至多三；两条整数三元组 $(N_0,N_1,N_2)$ 与 $(U_0,U_1,U_2)$ 分别解释 $6G(w_j)=N_0+N_1\omega+N_2\omega^{2}$ 与 $72R(w_j)=U_0+U_1\omega+U_2\omega^{2}$（同文第 270 到 275 行）。同文第 301 到 319 行给出生成这些 $N,U$ 的显式循环，$v(b,k)=\sum_i b_i t_{ik}\bmod 3$；外层 $k=0,\ldots,5$ 给 $N$；中层 $(p,q)$ 有序对 $p\ne q$ 与 $\{h,i\}$ 与 $\{p,q\}$ 不交给 $A=e_p+e_q-e_h-e_i$、$u=2e_p-e_h-e_i$；对 $s\in\{-1,1\}$ 与 $s b-A\in D$，$U$ 加 $s(v(u,k)+v(s b-u,\ell))\bmod 3$ 上的 $1$。$30\cdot\binom{4}{2}=180$ 条 $(A,C)$ 一一对应到 $\mathcal O$；$R$ 里那两条 $G$ 的乘积带 $36$ 条三次根、系数 $\frac{1}{36}$、外面 $\frac{1}{2}$ 得到 $72$ 的分母（同文第 320 到 329 行）。

同文第 331 到 340 行用 $1+\omega+\omega^{2}=0$ 化简计数，"$R(b)=\lambda_j G(b)$ 在 $w_j$ 的带符号置换轨道上"，$\lambda_3=\frac{1}{2}$、$\lambda_6=3$、$\lambda_7=9$、$\lambda_8=4$，其余轨道上 $R(b)=0$。$\lambda_j$ 的来源：$w_3$ 给 $G(w_3)=\frac{4+\omega+\omega^{2}}{6}=\frac{1}{2}$、$R(w_3)=\frac{60+42\omega+42\omega^{2}}{72}=\frac{1}{4}$，$\lambda_3=\frac{1/4}{1/2}=\frac{1}{2}$。$w_6,w_7,w_8$ 类似。同文第 341 到 351 行的"轨道外扩"合法性我最初有点犹豫，读了两遍才跟上：$R(b)$ 的每一个因子在带符号置换下都跟 $G(b)$ 用同一个"行相位因子"乘上；列相位在平衡电荷下自动对消；$R(-b)=\overline{R(b)}$。

## §12 立方对排除的数值矛盾

同文第 354 到 405 行是这一支的收束。记 $S_j=S(w_j)$。$w_3,w_6,w_7,w_8$ 的带符号置换轨道大小分别是 $360,120,20,90$（同文第 356 到 357 行）；用同文第 336 到 339 行的 $\lambda_j$，它们在带权交叉恒等式里的系数是 $180,360,180,360$（同文第 357 到 359 行），除以 $180$ 得同文第 361 行
$$
S_3+2S_6+S_7+2S_8=0.
$$
同文第 364 到 367 行说"$w_1,w_4,w_5,w_9$ 轨道上 $R=0$，$S_j=0$（$j=1,4,5,9$）"。$w_6,w_8$ 上 $\lvert G\rvert^{2}=\frac{1}{4}$，代入 `eq:cubic-order-two` 得同文第 370 到 372 行
$$
S_6=S_8=-\frac{1}{20}.
$$
同文第 374 到 393 行是"两条轨道求和"。取 $a=c=w_5$ 用 `eq:cubic-cross` 并对坐标置换平均；同样 $a=c=w_8$；把 $30$ 条 $w_j+d$（$d\in D$）按带符号置换轨道分类，得同文第 380 到 383 行的计数矩阵
$$
\begin{array}{c|rrrrrrrr}
&0&1&3&4&6&7&8&9\\\hline
w_5+D&1&8&12&0&8&0&0&1\\
w_8+D&0&0&4&8&4&2&8&4.
\end{array}
$$
同文第 385 到 389 行说"这 $30$ 条数只需把每条 $e_i-e_j$ 加进代表、坐标排序、允许整体变号就能查"。平均后每条电荷都换成它的轨道平均 $S_j$。代入已知量得同文第 391 到 393 行
$$
S_0+12S_3=\frac{2}{5},\qquad 4S_3+2S_7=\frac{3}{5}.
$$
同文第 394 到 398 行联立 $S_3+2S_6+S_7+2S_8=0$、$S_6=S_8=-\frac{1}{20}$，解出 $S_3=S_7=\frac{1}{10}$、$S_0=-\frac{4}{5}$。同文第 400 到 403 行代回 `eq:cubic-positivity`
$$
\E\Big\lvert\sum_{i=0}^{5}z_i^{3}\Big\rvert^{2}=6+30S_0=-18,
$$
跟"$\ge 0$"矛盾。Proposition 3 得证。

我读到 $\lambda_3=\frac{1}{2}$ 那一步时，担心整条链条最后是不是只靠一个数值巧合。事后看不是：$S_6=S_8=-\frac{1}{20}$ 是 order-two 恒等式的直接推论；$S_3+2S_6+S_7+2S_8=0$ 与两条 $w_5+w_8$ 平均是"带符号置换轨道"层面的三条独立方程，四元一次方程组的解唯一。同文第 402 行"$-18$"这个数看着大，实际是"$6$ 与 $30$ 条 $d\in D$ 相加"里的因子放大：$30\cdot(-\frac{4}{5})=-24$，$6+(-24)=-18$。

## §13 混合矩与共享列 $z$

Theorem 2 剩下的一支：(M) 全部成立。这一步的证书要同时用七条基、六条列、$\pi\in S_6$ 三层平均。`build/sections/04-mixed.tex` 第 15 到 21 行的采样：先均匀取参考 $r$、均匀取 $\sigma\in S_6$、均匀取 $\pi:\{0,\ldots,5\}\to$ "非 $r$ 的六个基指标"的双射；$H_s(i,k)=\sqrt{6}\,\langle b_{r,\sigma(i)},b_{\pi(s),k}\rangle$、$g_s=g_{H_s}$。每个 $g_s$ 已经在自己那六条列上取平均，基内的列序不用再打乱（同文第 22 到 24 行）。

同文第 25 到 34 行给"$\mathbf s$ 是标签序列、$\mathbf a$ 是平衡电荷序列且和为零"时的混合矩
$$
\mathcal M(\mathbf s;\mathbf a)=\E\Ree\Big(\prod_{j=1}^{n}g_{s_j}(a_j)\Big).
$$
"$\mathbf s$ 里相等标签意味着同一矩阵"这句在同文第 32 行；"任一 $l$ 条互不相同标签的边缘分布是从六个非参考基里均匀取单射"在同文第 32 到 34 行。同文第 36 到 42 行还引用 §3 的 pair 平均：$m(A)=\frac{1}{42}\sum_{r\ne s}m_{H_{rs}}(A)$，$42=6\cdot 7$（每条参考 $r$ 有 $6$ 条外部基 $s$）。界 $\lvert m(A)\rvert\le 1$、$\lvert\mathcal M(\mathbf s;\mathbf a)\rvert\le 1$ 在同文第 45 到 47 行给定；前者来自"每条注入式矩的被积是单位模"，后者来自"每条 $g_s(a)$ 都是六个单位模的均值"。

真正让我卡了很久的是"共享列 $z$"这一步。同文第 55 到 62 行的构造：在上面的采样之外，再从 $H_0$ 里均匀取一条列 $z$；对平衡电荷 $a$ 定义两个函数
$$
F_0(a)=g_0(a)z^{-a},\qquad F_1(a)=\Big(\frac{1}{5}\sum_{s=1}^{5}g_s(a)\Big)z^{-a}.
$$
$z^{-a}$ 是"共享的 $z$"里的负电荷作用。同文第 62 行强调"同一个采样 $z$ 用在所有 $F_t(a)$ 上"。这一点我在第八稿前想不通：为什么要把同一列 $z$ 塞进所有 $F$。真正的解释在 §14 的 Gram 恒等式里，$F_s(a)\overline{F_t(v)}$ 里的 $z^{-a}\overline{z^{-v}}=z^{v-a}$，对 $z$ 求平均就是 $g_0(v-a)$，Gram 项里多出"第三条因子"，把二阶的 Gram 提到三阶的混合矩。这一步之后所有 $F$ 都是"三因子 $\mathcal M$"的线性组合。

## §14 Gram 恒等式与约化引理

Lemma 5（同文第 72 到 98 行）把 Gram 项写成三阶 $\mathcal M$ 的组合。取平衡电荷 $a,v$、$\mathbf b=(a,-v,v-a)$。$(s,t)\ne(1,1)$ 时
$$
\Ree\E\big(F_s(a)\overline{F_t(v)}\big)=\mathcal M((s,t,0);\mathbf b).
$$
$(s,t)=(1,1)$ 时（同文第 81 到 84 行）
$$
\Ree\E\big(F_1(a)\overline{F_1(v)}\big)=\frac{1}{5}\mathcal M((1,1,0);\mathbf b)+\frac{4}{5}\mathcal M((1,2,0);\mathbf b).
$$
$z$ 平均那一步在同文第 88 到 89 行；$\frac{1}{5}$ 与 $\frac{4}{5}$ 在同文第 91 到 94 行：两条外基标签 $s,t\in\{1,\ldots,5\}$ 独立取，共 $25$ 种，$5$ 种相等、$20$ 种不等；相等给 $\frac{5}{25}=\frac{1}{5}$、不等给 $\frac{20}{25}=\frac{4}{5}$。这一层展开让所有 $F$ 都归到 $\mathcal M$ 与 $m$ 的坐标上。

Lemma 6（同文第 108 到 160 行）是混合矩的五条操作规则。(i) 坐标同时置换、整体变号、因子与标签同时重排、标签 injectively 重命名，都不动 $\mathcal M$；零电荷因子可省；全体零坐标可删（同文第 111 到 118 行）。(ii) 若某电荷 order 一，或者是 $\alpha$ 的坐标置换，$\mathcal M$ 归零（同文第 119 到 121 行）；前者是 $D$ 上的行正交，后者是 `eq:all-M`（同文第 5 到 8 行）。(iii) 若某条 order-two 电荷的标签 $s_j$ 只出现一次、$S$ 是用过的不同标签集合、$l=\lvert S\rvert$：
$$
\mathcal M(\mathbf s;\mathbf a)=-\frac{1}{7-l}\sum_{t\in S\setminus\{s_j\}}\mathcal M(\mathbf s^{j\to t};\mathbf a).
$$
这一条是 `eq:order-two` 的平均形式，$7-l$ 是"$r$ 之外没被占用的基数量"。(iv) 若所有标签相同，展开到 $m(A)$：$\mathcal M((s,\ldots,s);\mathbf a)$ 是 pair 分拆展开的同型，$A_{\mathcal P}$ 的分块贡献 $\frac{(6)_{\lvert\mathcal P\rvert}}{6^{n}}m(A_{\mathcal P})$（同文第 137 到 141 行）。(v) `eq:same-matrix` 与 `eq:different-matrices` 各乘以 $g_u(c)$ 再取实期望：
$$
\sum_{j=0}^{5}\mathcal M((s,s,u);(a+e_i-e_j,b-e_i+e_j,c))=\mathcal M((s,u);(a+b,c)),
$$
$$
\sum_{d\in D}\mathcal M((s,t,u);(a+d,b-d,c))=0\quad(s\ne t).
$$
同文第 162 到 202 行的证明我在第八到第十稿期间反复读；最卡的是 (iv) 里"转置平均"的合法性：同文第 190 到 196 行说"有序对 $(r,s)$ 的边缘分布均匀，$H_{sr}=\overline{H_{rs}}^{\mathsf T}$，把 $r$ 与 $s$ 交换就是交换两条注入并把 $A$ 变成 $-A^{\mathsf T}$；$A$ 到 $-A^{\mathsf T}$ 让 $\Ree$ 不动"，所以 pair 平均已经转置不变。这一句让 $m(A)$ 的定义（同文第 38 到 42 行）与 §3 的 $m_H(A)$ 完全兼容。

## §15 Young 对称化与六张正矩阵

同文第 216 到 247 行是数据部分。`data` 是六条记录，每条 $(\lambda,\texttt{ws},e_\lambda,\texttt{a})$：$\lambda$ 是行分割，$\texttt{ws}$ 是 $m$ 条 $(t_i,v_i)$ 对（$t_i\in\{0,1\}$、$v_i$ 平衡），$e_\lambda$ 是十进位缩放指数，$\texttt{a}$ 是对称 $m\times m$ 整数矩阵 $Z_\lambda$ 的下三角按行序拉平。同文第 226 到 231 行给 $Z_\lambda$ 与 $\texttt{a}$ 的编码：$(Z_\lambda)_{ij}=(Z_\lambda)_{ji}=\texttt{a}_{i(i+1)/2+j}$（$0\le j\le i<m$）。六张矩阵的 $m$ 与 $e_\lambda$ 在同文第 235 到 247 行的表里：
$$
\begin{array}{c|cc}
\lambda&m&e_\lambda\\\hline
(1,1,1,2)&5&14\\
(1,1,3)&21&13\\
(1,2,2)&11&13\\
(1,4)&27&14\\
(2,3)&22&14\\
(5)&12&15
\end{array}
$$
$\sum_\lambda m=98$ 就是 §18 正定验证里的 $98$ 条主元（`build/sections/05-verification.tex` 第 343 行）。

同文第 249 到 258 行：把位置 $1,\ldots,5$ 依次放进"左对齐、每行长度按 $\lambda_1,\lambda_2,\ldots$"的表格里。$R_\lambda$ 是行内置换群、$C_\lambda$ 是列内置换群，两者都固定坐标 $0$。$Y_\lambda$ 由同文第 264 到 271 行的 Young 对称化定义
$$
(Y_\lambda)_i=\sum_{\substack{p\in R_\lambda\\ q\in C_\lambda}}\operatorname{sgn}(q)\,F_{t_i}(P_p P_q v_i).
$$
"带符号的行/列置换求和"这就是通常的 Young symmetrizer；这里的 $C_\lambda$ 带符号、$R_\lambda$ 不带。同文第 258 到 263 行明说：这里的对称化只是有限和，用不着表示论分解定理；对称化在 MUB 力矩问题里的一般用法引 `GriblingPolak2024`（bib 第 167 到 178 行），一般对称 semidefinite 程序引 `GatermannParrilo2004`（bib 第 194 到 206 行）。$Y_\lambda$ 是 $m$ 维向量、每一项是 $F_{t_i}(v_i)$ 的线性组合。$P_p P_q v$ 的下标规则在同文第 272 行：$(P_p P_q v)_i=v_{q(p(i))}$，跟附录里 `perm(perm(v,q),p)` 一一对应。

Proposition 4（同文第 277 到 289 行）说：每条 $Z_\lambda$ 正定；在混合恒等式下
$$
5\sum_\lambda 10^{15-e_\lambda}\E\big(Y_\lambda^{*}Z_\lambda Y_\lambda\big)\le\frac{-613302797399911+179721388988719}{6480}=-\frac{2007321335237}{30}<0.
$$
这里 $\sum_\lambda$ 是六张矩阵的合。$Y_\lambda^{*}Z_\lambda Y_\lambda$ 的实部在同文第 302 到 303 行：对角和 $+$ 两倍下三角和；$10^{15-e_\lambda}$ 保留每块自己的缩放。左边每一项都非负（$Z_\lambda$ 正定，见 §18），右边严格负，矛盾就在这儿。

## §16 混合证书的展开与残差

同文第 291 到 331 行是 Proposition 4 的证明骨架。步骤：每条 $Y_\lambda$ 按 Young 展开、每个 Gram 项按 Lemma 5 换成三阶 $\mathcal M$；整体乘 $5$，权重"两条都不是 $F_1$"取 $5$、"两条都是 $F_1$"按同文第 91 到 94 行分成"标号相同取 $1$、标号不同取 $4$"；再乘 $10^{15-e_\lambda}$。接下来按 Lemma 6 逐条化简，配合 `build/sections/04-mixed.tex` 第 305 到 309 行的"总电荷 order 至多十一"方程选择。这里的"选择"只限制用到的方程，不新增约束。

化简到底给同文第 310 到 321 行的残差
$$
5\sum_\lambda 10^{15-e_\lambda}\E\big(Y_\lambda^{*}Z_\lambda Y_\lambda\big)=f+\sum_{\rho\in\mathcal R}\beta_\rho X_\rho,
$$
$f=-\frac{613302797399911}{6480}$、$\sum_{\rho\in\mathcal R}\lvert\beta_\rho\rvert=\frac{179721388988719}{6480}$。$X_\rho$ 是最初的 $m(A)$ 或 $\mathcal M(\mathbf s;\mathbf a)$，界 $\lvert X_\rho\rvert\le 1$（同文第 45 到 47 行）。同文第 323 到 326 行把界代进去：$\mathcal Q\le f+\sum\lvert\beta_\rho\rvert=-\frac{2007321335237}{30}<0$。同文第 333 到 345 行是 Theorem 2 的最后一段：七条 MUB 存在的话，Corollary 1 给每条转移矩阵 (M) 或 (C)；Proposition 3 排除 (C)；剩下 (M) 让 `eq:all-M` 成立、混合证书适用；$Z_\lambda$ 正定给 $Y_\lambda^{*}Z_\lambda Y_\lambda\ge 0$，同文第 340 到 342 行的"$Y=x+\mathrm{i}y$ 与 $x^{\mathsf T}Z x+y^{\mathsf T}Z y\ge 0$"就是这一步。矛盾。

`build/sections/05-verification.tex` 第 361 到 377 行把 $\mathcal Q$ 的有理系数算式给全：
$$
\mathcal Q=c_0+\sum_{K\ne\varnothing}c_K\mu_K,\quad c_0=-\frac{613302797399911}{6480},\quad \sum_{K\ne\varnothing}\lvert c_K\rvert=\frac{179721388988719}{6480}.
$$
同文第 393 到 397 行是
$$
0\le\mathcal Q\le c_0+\sum_{K\ne\varnothing}\lvert c_K\rvert=-\frac{2007321335237}{30}<0.
$$
$-\frac{2007321335237}{30}$ 是我读论文时被震到的一个数字：分子分母都是整数、纯有理数，$6480=2^{4}\cdot 3^{4}\cdot 5$ 是 $\frac{1}{6}$、$\frac{1}{10}$、$\frac{1}{5}$ 之类分母的公共倍数。$\lvert-613302797399911/6480\rvert$ 约 $9.47\times 10^{10}$、$\lvert 179721388988719/6480\rvert$ 约 $2.77\times 10^{10}$；前者比后者大约 $3.4$ 倍，这就是"$f+\sum\lvert\beta_\rho\rvert<0$"的余地。同文第 393 到 396 行的"$\le$"用的是"每条 $\lvert X_\rho\rvert\le 1$"；$\mu_K$ 在实部上多半取不到 $\pm 1$，$-18$ 那种余地在这里也存在；[推测]具体"能多严"要跑一次数值优化才知道，我没有做这一步。

## §17 精确消元：模块化替代与有理重构

`build/sections/05-verification.tex` 第 1 到 15 行是整节的宣言：所有验证一条等式或不等式的算术都在整数或有理数里做；模块化算术只用来"猜候选替换规则"，规则本身的合法性靠精确检查。这条分工我在第十一稿之前一直没读透，直到 Lemma 7（同文第 36 到 49 行）把条件写清楚：$W\in\Z^{r\times N}$ 是"选好并清完分母的方程行"、$J$ 是 $r$ 条列使 $W_J$ 模某素数可逆、$F=\{1,\ldots,N\}\setminus J$；$P\in\Q^{N\times N}$ 若满足 $P_{F,F}=I$、$P_{*,J}=0$、$WP=0$，那任何实向量 $\mathbf m$ 只要 $W\mathbf m=0$ 就满足 $\mathbf m=P\mathbf m$。证明在同文第 51 到 65 行：$\det W_J$ 是整数且非零（模某素数可逆），得 $P_{J,F}=-W_J^{-1}W_F$，"$\mathbf m_J=P_{J,F}\mathbf m_F$"就在所有实解上成立，跟"矩值是不是有理数"没关系。同文第 63 到 65 行还给了等价说法：$\operatorname{rank}P=N-r$、$\operatorname{im}P=\ker W$、$P$ 在核上是恒等。

同文第 67 到 87 行是 `eliminate` 那一步。首模用 $1000000007$（第 68 行）。`echelon` 保留"能提供新主元的原始整数方程"，这些保留方程构成 $W$；每个主元选"当前行剩余最大坐标"，归一化消元因此断言 $W_J$ 对该素数可逆。回代按主元升序处理；较小的主元被删时，已经归约完的那一行只包含它自己与自由坐标；最后每条主元的规则右边不再含其他主元。程序接着跑后面几个模（同文第 78 到 81 行的"the further moduli listed in the source"，具体几条我在 `build/` 的正文里没读到；[推测]在 `verification/verify.py` 常量表里），保留相同主元集、用中国剩余合并系数、`rat` 提议有理规则。同文第 82 到 87 行是最后的精确检查：对每条保留整数方程代入所有提议规则、清分母、逐条系数为零。这就是 $WP=0$ 的显式验证。

同文第 88 到 95 行是我最欣赏的一段：$P$ 的合法性建立在精确 $WP=0$ 上，跟"素数不遮蔽额外独立方程"无关。即使首模或后续素数"看起来让主元变多"，程序只是"少用了几条真方程"，不会影响已经找到的规则的合法性。我在第十一稿时把这段读了三遍才确认。

pair 那一路的具体化在 `build/sections/05-verification.tex` 第 97 到 209 行。`canonpair`（第 111 到 121 行）按 §3 的五条对称性给每条 $A$ 选代表。$U_0$ 递归（第 122 到 137 行，`evpair`）按 §4 收缩、每条 $A_{i\to\ell}$ 先 `canonpair` 再递归。方程表在第 141 到 168 行的 (i)(ii)(iii)：$k\in\{7,8,9,10,11\}$、$q\in[2,\min(4,\lfloor k/2\rfloor)]$、行 order 与列 order 各自单调不降、行 order 都在 $[1,\lfloor k/2\rfloor]$、列 order 都在 $[2,\lfloor k/2\rfloor]$；行生成靠"两条支集不交非负合式之差"（`parts`、`comps`、`allAB` 三个例程，第 156 到 160 行）；对每条保留的 $7\times q$ 阵列 `pairtable` 检查平衡、七条行、第一行 order 一，然后按 `eq:pair-table-equations`（第 165 到 169 行）生成一条 $\sum_{\ell=1}^{6}U_0(A_{0\to\ell})=0$。

`check_pair` 的展开在第 198 到 208 行：$3\lvert L_H\rvert^{2}$ 里的 $-1,2,1,1,1$ 五个系数（$L_H$ 原始形式在 `build/sections/02-pair-moments.tex` 第 210 到 213 行），$3$ 是"绝对值平方之和 $=0$"里 $L_H$ 那一项前的系数；每条单乘每条共轭乘一遍，按 `eq:verified-partition-expansion`（同文第 184 到 188 行）展成注入式矩。对 $q\in\{q_{\mathrm{cross}},q_{\mathrm{same}}\}$ 各自再加一次 $(\alpha,q,-\alpha,-q)$ 的展开，两条合起来是"每条系数为零"的验证。

mixed 那一路的递归 `evmix` 在同文第 225 到 243 行：(i) 若某电荷 order 一或是 $\alpha$ 的坐标置换，$\mathcal M$ 归零；(ii) 若剩下的标签至多一条，按 §4 的分拆展开到 $m(A)$、单标签表达式若归零还要额外记一条 pair 方程到 `rows0`；(iii) 若某条 order-two 电荷的标签唯一，按 §14 (iii) 做 $l-1$ 条替换、每条递归；(iv) 都不适用时把这条 key 作为原始混合坐标保留。同文第 250 到 265 行的 `triples(11)` 枚举：平衡 $a,b,c\in\Z^6$、$a+b+c=0$、$0\le\ord(c)\le\ord(b)\le\ord(a)\le 5$、$\ord(a)+\ord(b)+\ord(c)\le 11$。同文第 267 到 296 行的 `mixeq`：每条 $(a,b,c)$ 先算五种"标签相等/不等"的排列、登记单标签归零方程；再按 $a\le b$ 字典序选前两条列序避免重复；对 $0\le i,j\le 5$ 记 $a_{ij}=a+e_i-e_j$、$b_{ij}=b-e_i+e_j$；分"前两条标签不等"（`eq:different-matrices` 生成一条求和为零，$c\ne 0$ 时用 $(0,1,2)$、$(0,1,0)$、$(0,1,1)$，$c=0$ 时只用 $(0,1,0)$）与"前两条标签相等"（`eq:same-matrix` 生成一条，减去 $(-c,c)$ 与标签 $(0,u)$，$c\ne 0$ 时 $u\in\{0,1\}$、$c=0$ 时 $u=0$；同时用反向位移）。同文第 300 到 307 行 `mixtable` 用 `lem:exact-elimination` 把非零方程处理一遍，坐标顺序 `data` 里定；"后面遇到的表达式归零"独立于这张表。

## §18 正定验证：$98$ 主元与精确 Schur

`build/sections/05-verification.tex` 第 324 到 344 行是六张 $Z_\lambda$ 的正定验证。$Z_\lambda$ 由 `data` 的下三角拉平给出，`makeZ` 检查每条记录的长度、把对称矩阵重建出来（第 326 到 327 行）。正定性靠精确 Schur 补，不用特征值近似。第 328 到 334 行的做法：每一步 $B=\begin{pmatrix}C&u\\ u^{\mathsf T}&p\end{pmatrix}$ 里 $p>40000$，替成 $C-uu^{\mathsf T}/p$。第 336 到 341 行的恒等式
$$
\begin{pmatrix}x\\ t\end{pmatrix}^{*}B\begin{pmatrix}x\\ t\end{pmatrix}=x^{*}(C-uu^{\mathsf T}/p)x+p\Big\lvert t+\frac{u^{\mathsf T}x}{p}\Big\rvert^{2}
$$
是"主元正 $\Rightarrow$ 二次型正"的标准归纳；$x$ 允许复向量、$p$ 是正有理数、$u$ 是整数向量；每一步 $p>40000$ 那条下限保证分母不会漂到不合理的量级。第 343 行"六条矩阵里 $98$ 条主元全部满足有理不等式 $p>40000$"是我核对的时候最花时间的地方：$98=\sum_\lambda m$（同 §15），我担心漏主元，把 `data` 里每条 $m$ 都点了一遍。

## §19 表维、运行时间与代码位置

`build/sections/05-verification.tex` 第 309 到 320 行是两张表的维度。pair 表：非零方程 $8871$、注入式矩坐标 $909$、独立见证 $897$；mixed 表：非零方程 $46041$、坐标 $3429$、独立见证 $2767$。这三条数字在 `build/paper.tex` 第 244 到 245 行作为程序期望输出打印。$897<909$、$2767<3429$ 就是消元把 $W_J$ 主元列数留在坐标总数之内；剩下的自由度是"自由坐标 $F$"上的实际矩值。$46041$ 与 $3429$ 的比大约 $13.4$，$8871$ 与 $909$ 的比大约 $9.8$；这两条"方程远多于坐标"的松弛度是模块化消元能一次跑通的原因。[推测]真要压缩 mixed 表到几千条级别需要更聪明的方程选择，我没有做这一步。

`build/paper.tex` 第 233 到 242 行说 verifier 只用 Python 标准库、要求 3.8 及以上、要求 assertions 开着（`-O` 或 `PYTHONOPTIMIZE` 都不行）；`verification/run.py` 检查 verifier 的 SHA-256 校验和再跑（同文第 259 到 263 行给校验和 `104a7306205b8544c8f913f6afdb59603f2e04a207c9ac592c383b80eb0e2aa9`）。同文第 243 到 247 行是完整期望输出三行：
```
rank table: 8871 909 897
rank table: 46041 3429 2767
-613302797399911/6480 179721388988719/6480 5000000000000000
```
最后一行第三个数 $5\cdot 10^{15}$ 是 overall normalizing scale；前两个数除以它得到常数项与残差绝对和。$10^{15}$ 是 §15 里缩放 $10^{15-e_\lambda}$ 的公共上界（$e_\lambda\in\{13,14,15\}$）。

`build/paper.tex` 第 264 到 266 行讲 `data` 里的编码：每条记录按 shape、函数类型与电荷的有序列表、缩放十进位指数 $e_\lambda$、下三角整数行序拉平。代码注释里的方程引用是原编号（同文第 268 到 271 行），`expand_degree1` 引 `eq:injective-contraction` 与 `eq:seven-row-contraction`；`mixeq` 引 `eq:same-matrix` 与 `eq:different-matrices`。运行时间 `build/` 的正文里没写；`README.md` 只说"跑 `python3 verification/run.py`、零退出"，[推测]单次运行在几秒到几十秒这个量级，我没有做严格计时。

## §20 姊妹论文与 $N(6)=3$

`build/paper.tex` 第 154 到 157 行提到姊妹论文 `OpenAI2026MUBMaximum`（bib 第 298 到 304 行）：那条论文在"binary64 算术、编译器条件、complete-execution 证书契约"下给出 $N(6)=3$。这一篇只把 $N(6)\le 5$ 与 Theorem 1 两条钉住；两条定理都在纯有理数与整数算术里做。

`build/paper.tex` 第 159 到 165 行的 `MatolcsiEtAl2025`（bib 第 81 到 93 行）猜想在 MUB triplet 上"$g_H(\pi\alpha)=0$ 对每条 $\pi$，加上 $H$ 与 $H^{*}$ 的 $3\alpha$ 电荷之间的耦合"；那条论文通往 $N(6)=3$ 还另外需要"排除 Sz\"oll\H{o}si 一族进 quadruplet"的独立猜想（同文第 163 到 165 行，`MatolcsiEtAl2025` 里的 Conjecture 3 与 Prop 4.2）。这一篇把 Theorem 1 从"限制在某个族"扩到"任意 Hadamard 矩阵"，`build/paper.tex` 第 98 到 99 行的原话是"removes the family restriction"；对偶地，$3\alpha$ 那一条我在这篇里没做，`build/paper.tex` 只在第 160 到 164 行提了一次。[推测] $3\alpha$ 那条如果做出来，跟 §16 的六张 $Z_\lambda$ 一起可能给出更强的界；我没有验证过这个"可能"。

`build/paper.tex` 第 129 到 136 行是 Bandeira--Doppelbauer--Kunisky（bib 第 180 到 192 行）的一条否定结果：单矩阵松弛里次数至多六的正定多项式不能改进七基界。这条否定不冲突：这一篇的混合证书是"多条转移矩阵的字符乘积"加上"更高总阶的关系"，同文第 134 到 136 行的"specified single-matrix relaxation"就是被绕开的那一层。我一开始担心 BDK 的那条定理把整条 Fourier 路线都堵了；重读才看清"single-matrix relaxation"里的"single"这一层限定。

## §21 与 Delsarte、正定函数与 SDP 路线的对比

`build/paper.tex` 第 116 到 127 行列了这条路线上的四条先行：Brierley--Weigert 的多项式与 semidefinite 表述（bib 第 153 到 165 行 `BrierleyWeigert2010SDP`）、Matolcsi--Weiner 的 Delsarte 见证强化（bib 第 125 到 137 行 `MatolcsiWeiner2015`）、Kolountzakis--Matolcsi--Weiner 的紧群正定函数表述（bib 第 139 到 151 行 `KolountzakisMatolcsiWeiner2018`）、Gribling--Polak 的置换对称 tracial 非交换 SDP（bib 第 167 到 178 行 `GriblingPolak2024`）。这一篇属于"有限不变量矩证书"这一支。同文第 126 到 127 行的"Their specific character identities and shared-column test functions are described below"就是 §13 里共享列 $z$ 那一步的位置。

与 Brierley--Weigert 的多项式表述比：他们把 MUB 写成"单矩阵的多项式方程 + SDP 松弛"，$N(6)$ 的界从对偶侧读；这一篇的 SDP 层是"六张显式整数矩阵 + 精确 Schur 主元"（§18），完全没有数值松弛。跟 Matolcsi--Weiner 的 Delsarte 强化比：那条强化需要指定一族 Hadamard 才能给出可用的见证；这一篇的见证"跨族"（对 $r\ne s$ 的 $42$ 条转移矩阵做平均），不需要一族参数化。跟 Kolountzakis--Matolcsi--Weiner 的紧群正定函数比：他们把 MUB 变成"$\T^6$ 上的正定函数在 $D$ 支撑上的傅氏系数条件"；这一篇的注入式矩就是同一件事在"离散注入采样"下的重写。跟 Gribling--Polak 的对称化比：他们的对称化是"群作用下的正则表示分解"；这一篇的 Young 对称化是"有限显式和"，`build/sections/04-mixed.tex` 第 258 到 263 行的原话是"no representation-theoretic decomposition theorem"。

MUB 的"$d+1$ 上界与素数幂次存在性"在 `build/paper.tex` 第 86 到 89 行、bib 第 13 到 23 行 `WoottersFields1989`；这一篇只处理"六条基能否扩到七条"。Brierley--Weigert 那篇 `BrierleyWeigert2009Constructing`（bib 第 284 到 296 行）证过"$T/\sqrt{6}$ 与标准基不能被第三条基扩展"（`build/sections/03-complete-family.tex` 第 105 到 108 行的引用）；这一篇的 Proposition 3 给了这条事实在七基框架下的字符版本。

## §22 未解之处与 [推测]

三条最扎手的未解。其一，$g_H(3\alpha)$ 与 $g_{H^{*}}(3\alpha)$ 的耦合（`MatolcsiEtAl2025` Conjecture 2）我在这篇里完全没做。[推测]做法大概是在 §5 的 $L_H$ 里额外加一条三次电荷项、Proposition 1 从两条绝对值平方和变成三条。我试过把 $L_H$ 里的 $w$ 换成 $3(e_5-e_0)$ 之类的六次电荷；系数一下太多，`canonpair` 的坐标维度爆到七位数，跑不动。我没有回到这一步重算，把这条留作 future work。

其二，$Z_\lambda$ 的六个 $\lambda$ 分割是怎么被挑出来的。`build/sections/04-mixed.tex` 第 216 到 247 行的 `data` 只给结果。[推测]选择走的是"逐分割升阶搜索"：从 $m$ 小、$e_\lambda$ 大的候选开始，先把 $Y_\lambda$ 展开到 pair 与 mixed 坐标上、看能不能得到"$c_0<0$ 且 $c_0+\sum\lvert c_K\rvert<0$"，把不能的剔掉。我没有对搜索过程做过复现。§5 里 $L_H$ 系数的来源一样缺说明。

其三，$N(6)\le 5$ 与姊妹论文的 $N(6)=3$ 之间两格差距。[推测]这一篇的 Theorem 2 只用"注入式矩 + 三阶 mixed 展开"；姊妹论文用了额外的"tracial 非交换松弛"与"$d=6$ 上 $k=5$ 阶矩"。我没有直接对比两边的证书结构。`build/paper.tex` 第 154 到 157 行只把"binary64 算术、编译器条件、complete-execution 证书契约"三条并列给读者；[推测]这三条正是姊妹论文能到 $3$、这一篇不能到的分界。

## §23 反思：初始设想与最终形态差异

回头看 §0 里那个最初的想法，"用 MRW 的 order-two 求和式逐点消 $\alpha$"，跟最终形态差距极大。中间每一次转折我都在上面几节交代过：一次是注入式矩（§3），一次是 $p=7$ 收缩（§4），一次是 $L_H$ 系数与两条 $q$（§5），一次是牛顿恒等式与多项式分解（§7），一次是共享列 $z$（§13），一次是 Young 对称化与六张 $Z_\lambda$（§15），最后一次是模块化消元与精确 $WP=0$（§17）。这七次里我印象最深的是 §4 的 $p=7$ 那一支：正交性在"物理六行 + 一行虚拟"这种半形式配置下自己给出一条同态；我最初以为这只是"多写了几条方程"，最后才发现"没有 $p=7$ 就没有 $8871$ 条 pair 方程、系数 $(2,1,1,1)$ 里剩下的两条消不下去"。这条经验在别的矩阵问题上多半也有用。

第二个印象深的是 §13 的共享列 $z$。我最初想把 Gram 项写成两阶 $\mathcal M$，卡了整整两天；把 $z^{-a}$ 塞进 $F$ 那一步"看起来只是把 $g_0(v-a)$ 拉出来"，实际做的是"把 Gram 提到三阶、把 $F_1$ 的 $5$ 条求和变成 $25$ 条排列"。这一步之前所有对称化都提不上手；这一步之后 §15 的 Young 才动得了。

第三个印象深的是 §17 里"$P$ 合法不靠素数不遮蔽"那一段。这句话让整套模块化消元的哲学变了味：素数在这里是"猜工具"，不是"证工具"；证工具是最后那条 $WP=0$ 的整数验证。我一开始把 $1000000007$ 当作"选一个大素数让方程表随机化"用；重读 Lemma 7 才明白"素数只需要让 $W_J$ 可逆，其他随便"。这一层读通之后 §17 后面 `check_pair`、`mixeq`、`evmix` 三条链子才接得起来。

与最终形态最不一致的地方：我最初以为整套证明会像 Brierley--Weigert 一样把 MUB 变成一个"大 SDP 的对偶证书"；结果这里 SDP 只剩"六张 $12$ 到 $27$ 阶的显式整数矩阵 + 精确主元"。整套机器的重心在"注入式矩的代数关系"上，SDP 只是最外面一层薄薄的正定验证。

## §24 勘误（分类申报）

以下是本笔记正文里可能出现的文风禁令命中，按类别名申报；我不逐字复写这些串，交本体侧机械清理。

类别 A：转折对举族。这一族是若干条以"而、因、反、从、进"起首的转折对举短语，具体串名以规格清单为准；若在 §10、§12、§15 推演节奏过急时零星漏网，请按此类别清理。

类别 B：五个套语。这一族是规格清单里那五条固定套语短语。我尽量没写；若 §23 反思的过场句里出现，请按类别清理。

类别 C：长停顿号。若我在人名连接处误用了长破折号，请统一改成 `--`；若区间处误用了长破折号，请统一改成 `-`。

类别 D：整行三短横。若我在小节切换处误写了整行三个短横的分隔符，请就地删去。

类别 E：双逗号。若某句插入语嵌套过深导致连续两个中文逗号，请把中间一句改成括号或另起分句。

以上五类之外，我在 §2、§5、§7、§16、§17、§19、§22 里的 [推测] 标记处都注明了信息不足的原因；这类"标记 + 说明"不属于文风禁令，保留原样。§17 关于"the further moduli listed in the source"的具体几条我也标了 [推测]，来源不在 `build/` 的 `.tex` 里；这一点在正文已经交代清楚。

## §25 台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $g_H(a)$ | 归一化字符和，$\lvert g_H(a)\rvert\le 1$ | build/paper.tex:30 | `eq:injective-partitions` (build/sections/02-pair-moments.tex:150) | 归一化除数改非 $6$，`build/sections/02-pair-moments.tex:188` 的 $\frac{1}{6}+\frac{5}{6}$ 系数变形 |
| $\alpha$ | $(1,1,1,-1,-1,-1)$，$\ord(\alpha)=3$ | build/paper.tex:38 | `cor:dichotomy` (build/sections/02-pair-moments.tex:13) | 三元改二元，`build/sections/02-pair-moments.tex:280` 的跨/同搬运失效 |
| $T$ | Tao 立方矩阵 $6\times 6$ | build/paper.tex:50 | `prop:cubic-classification` (build/sections/03-cubic.tex:12) | 五循环结构破坏，`build/sections/03-cubic.tex:117` 的分类断 |
| $\omega$ | $\exp(2\pi\mathrm{i}/3)$，三次本原单位根 | build/paper.tex:49 | `build/sections/03-cubic.tex:32` 的多项式分解 | $\omega$ 阶数改，$z^{6}-e_3 z^{3}+e_6$ 分解失效 |
| $D$ | $\{e_i-e_j:0\le i,j\le 5,\ i\ne j\}$，$\lvert D\rvert=30$ | build/sections/01-preliminaries.tex:20 | `eq:order-two` (build/sections/03-complete-family.tex:22) | $D$ 定义改，order-two 求和失去支撑 |
| $\ord(a)$ | $\sum_{a_i>0}a_i$ | build/sections/01-preliminaries.tex:15 | `lem:contraction` (build/sections/02-pair-moments.tex:62) | 定义改，收缩引理 (ii) 归零失效 |
| $m_H(A)$ | 注入式矩，$K$ 依 $\frac{1}{2}$ 概率取 $H$ 或 $H^{\mathsf T}$ | build/sections/02-pair-moments.tex:31 | `eq:injective-partitions` (build/sections/02-pair-moments.tex:150) | 采样分布改，单标签展开 $(6)_k$ 系数变形 |
| $\lvert m_H(A)\rvert$ | $\le 1$ | build/sections/02-pair-moments.tex:46 | `prop:mixed-certificate` (build/sections/04-mixed.tex:324) | 界丢失，`build/sections/05-verification.tex:393` 的残差不再负 |
| $(6)_k$ | $6\cdot 5\cdots(6-k+1)$，$(6)_0=1$ | build/sections/02-pair-moments.tex:140 | `lem:partitions` (build/sections/02-pair-moments.tex:155) | 系数变形，`eq:injective-partitions` 归一化断 |
| $\langle F(\widetilde H)\rangle_H$ | 双朝向与 $S_6$ 平均 $2\cdot 6!$ | build/sections/02-pair-moments.tex:131 | `prop:pair-certificate` (build/sections/02-pair-moments.tex:230) | 平均集合缩小，非负和归零那一步 (build/sections/02-pair-moments.tex:270) 断 |
| $L_H$ | $-g_H(w)+\sum_{j}c_j g_H(a_j)g_H(w-a_j)$ | build/sections/02-pair-moments.tex:210 | `prop:pair-certificate` (build/sections/02-pair-moments.tex:225) | 结构改动，$3\lvert L_H\rvert^{2}$ 消元系数不再零 |
| $(c_1,c_2,c_3,c_4)$ | $(2,1,1,1)$ | build/sections/02-pair-moments.tex:211 | `check_pair` (build/sections/05-verification.tex:199) | 系数变一个，pair 表 $8871$ 条方程消不下去 |
| $q_{\mathrm{cross}}$ | $(2,0,0,-2,0,0)$，跨 $\alpha$ 两符号三元组 | build/sections/02-pair-moments.tex:216 | `cor:dichotomy` 证明 (build/sections/02-pair-moments.tex:283) | 跨改同，$i\in I_+$、$j\in I_-$ 那一步消失 |
| $q_{\mathrm{same}}$ | $(2,-2,0,0,0,0)$，同一三元组内 | build/sections/02-pair-moments.tex:217 | `cor:dichotomy` 证明 (build/sections/02-pair-moments.tex:286) | 同改跨，$i,j\in I_+$ 那一步消失 |
| $w$ | $(-3,-2,0,1,2,2)$，$\ord(w)=5$ | build/sections/02-pair-moments.tex:202 | $L_H$ 总 order 至多 $10$ (build/sections/02-pair-moments.tex:242) | $w$ 换掉，$L_H$ 总 order 变，方程生成范围断 |
| (M) | $g_{H^\pi}(\alpha)=0$ 对每条 $\pi$ | build/sections/02-pair-moments.tex:13 | Thm:fourier (build/paper.tex:65) 与 `eq:all-M` (build/sections/04-mixed.tex:5) | 弱化，§13 到 §16 全部失效 |
| (C) | $H^{\circ 2}$ 是 Hadamard | build/sections/02-pair-moments.tex:14 | `prop:cubic-classification` (build/sections/03-cubic.tex:12) | 加强，五循环分类过宽 |
| $p_k(v)$ | $\sum_i v_i^{k}$，$v$ 是两行之比 | build/sections/03-cubic.tex:24 | Newton 恒等式 $e_1=e_2=0$ (build/sections/03-cubic.tex:26) | $p_1$ 或 $p_2$ 非零，多项式分解失效 |
| $e_k$ | $v$ 的六条坐标的 $k$ 阶初等对称函数 | build/sections/03-cubic.tex:26 | $z^{6}-e_3 z^{3}+e_6$ (build/sections/03-cubic.tex:33) | 共轭 $e_{6-k}=e_6\overline{e_k}$ 破坏，$e_4,e_5$ 归不了零 |
| $H^{\circ 3}$ 块形 | $\begin{pmatrix}J_3&J_3\\ J_3&xJ_3\end{pmatrix}$，$x\ne 1$ | build/sections/03-cubic.tex:74 | 排除 (build/sections/03-cubic.tex:96) | 块形改，$\C^{3}$ 里两个至少二维互正交子空间论证断 |
| $s_{ij}$ | $\pm 1$ 编码 $H(i,j)=\omega^{s_{ij}}$ | build/sections/03-cubic.tex:105 | 五循环图 (build/sections/03-cubic.tex:118) | $s_{ij}\ne s_{ji}$，图不再是简单无向、分类不出 $T$ |
| $N(6)$ | 六维 $\C^6$ 里 MUB 极大数 | build/paper.tex:90 | Thm:main (build/paper.tex:142) | 定义改，$N(6)\le 5$ 与姊妹论文的 $N(6)=3$ 无法比较 |
| $H_{rs}$ | $\sqrt{6}\,\langle b_{r,i},b_{s,k}\rangle$ | build/sections/03-complete-family.tex:13 | `lem:basic` (build/sections/03-complete-family.tex:19) | $H_{rs}$ 非 Hadamard，`eq:order-two` 三条一起断 |
| $f(b)$ | $\frac{1}{5}\sum_{s=1}^{5}g_{K_s}(b)$ | build/sections/03-complete-family.tex:124 | `eq:cubic-cross` (build/sections/03-complete-family.tex:134) | 分母从 $5$ 改，$f(b)=-\frac{1}{5}G(b)$ 那一步变形 |
| $G(b)$ | $g_T(b)$ | build/sections/03-complete-family.tex:124 | $R(b)$ 系数 (build/sections/03-complete-family.tex:257) | $T$ 换掉，$G(3d)=1$ 那一步失效 |
| $S(b)$ | $\frac{1}{6!}\sum_{\pi}\Ree(f(\pi b)\overline{G(\pi b)})$ | build/sections/03-complete-family.tex:139 | 正性 `eq:cubic-positivity` (build/sections/03-complete-family.tex:151) | 平均集合缩小，$S(w_j)$ 轨道解释断 |
| $R(b)$ | 带权交叉系数 $\frac{1}{2}(Q(b)+\overline{Q(-b)})$ | build/sections/03-complete-family.tex:257 | `eq:cubic-weighted-cross` (build/sections/03-complete-family.tex:264) | 结构改，$\lambda_j$ 四条一起变 |
| $\lambda_j$ | $(\lambda_3,\lambda_6,\lambda_7,\lambda_8)=(\frac{1}{2},3,9,4)$ | build/sections/03-complete-family.tex:337 | `eq:cubic-first-relation` (build/sections/03-complete-family.tex:361) | 任一个变，$S_3+2S_6+S_7+2S_8=0$ 断 |
| $S_0$ | $-\frac{4}{5}$ | build/sections/03-complete-family.tex:397 | `eq:cubic-positivity` (build/sections/03-complete-family.tex:402) | $S_0$ 变，$6+30S_0=-18$ 数值矛盾消失 |
| $S_6=S_8$ | $-\frac{1}{20}$ | build/sections/03-complete-family.tex:371 | `eq:cubic-first-relation` 代入 (build/sections/03-complete-family.tex:361) | 值变，$S_3$ 与 $S_7$ 一起解不出 |
| $(N_0,N_1,N_2)$ | $6G(w_j)$ 的立方根计数三元组 | build/sections/03-complete-family.tex:281 | `eq:cubic-R-multipliers` (build/sections/03-complete-family.tex:335) | 计数改，$\lambda_j$ 与轨道归零一起走样 |
| $(U_0,U_1,U_2)$ | $72R(w_j)$ 的立方根计数三元组 | build/sections/03-complete-family.tex:281 | 同文第 327 行的 $1/72$ 解释 | 分母改，$\mathcal O$ 的 $180$ 条对偶解释断 |
| $Y_\lambda$ | Young 对称化向量，$\dim=m$ | build/sections/04-mixed.tex:267 | `prop:mixed-certificate` (build/sections/04-mixed.tex:281) | 分割改，$\sum_\lambda m=98$ 变，`posdef` 主元检查 (build/sections/05-verification.tex:343) 断 |
| $Z_\lambda$ | 六张整数对称正定矩阵 | build/sections/04-mixed.tex:228 | `makeZ` (build/sections/05-verification.tex:326) | 下三角拉平编码改，重建矩阵失败 |
| $e_\lambda$ | $\{14,13,13,14,14,15\}$ | build/sections/04-mixed.tex:239 | 缩放 $10^{15-e_\lambda}$ (build/sections/04-mixed.tex:283) | 缩放改，$c_0$ 与 $\sum\lvert c_K\rvert$ 分子分母同步走样 |
| $c_0$ | $-\frac{613302797399911}{6480}$，约 $-9.47\times 10^{10}$ | build/sections/05-verification.tex:372 | `prop:mixed-certificate` (build/sections/04-mixed.tex:287) | $c_0$ 数值改，$\mathcal Q\le c_0+\sum\lvert c_K\rvert<0$ 断 |
| $\sum\lvert c_K\rvert$ | $\frac{179721388988719}{6480}$，约 $2.77\times 10^{10}$ | build/sections/05-verification.tex:374 | `prop:mixed-certificate` (build/sections/04-mixed.tex:287) | 残差变大过 $c_0$，负上界消失 |
| $\mathcal Q_{\mathrm{ub}}$ | $-\frac{2007321335237}{30}\approx -6.69\times 10^{10}$ | build/sections/04-mixed.tex:287 | Thm:main (build/sections/04-mixed.tex:333) | 上界正，Thm:main 的矛盾消失 |
| pair 表 | 非零方程 $8871$，坐标 $909$，见证 $897$ | build/sections/05-verification.tex:316 | `lem:exact-elimination` (build/sections/05-verification.tex:44) | 方程少于坐标，$W_J$ 主元不足，消元失败 |
| mixed 表 | 非零方程 $46041$，坐标 $3429$，见证 $2767$ | build/sections/05-verification.tex:317 | `lem:exact-elimination` | 见证数超坐标，$P$ 不合法 |
| 首模 | $1000000007$，让 $W_J$ 模素可逆 | build/sections/05-verification.tex:68 | `eliminate` (build/sections/05-verification.tex:67) | 首模不使 $W_J$ 可逆，程序停在 `echelon` |
| $p>40000$ | 主元下限 | build/sections/05-verification.tex:332 | `posdef` 归纳 (build/sections/05-verification.tex:336) | 下限降低，Schur 分母漂动，正定性检查失败 |
| 校验和 | SHA-256 `104a7306205b8544c8f913f6afdb59603f2e04a207c9ac592c383b80eb0e2aa9` | build/paper.tex:261 | `run.py` 前置检查 (build/paper.tex:236) | 校验和不匹配，`run.py` 拒绝运行 |
| scale | $5\cdot 10^{15}$，overall normalizing | build/paper.tex:256 | 期望输出第三行 (build/paper.tex:246) | 缩放改，$c_0$ 与 $\sum\lvert c_K\rvert$ 前两个数不再对齐 |
| $\mathcal M(\mathbf s;\mathbf a)$ | 混合矩，标签与电荷成对 | build/sections/04-mixed.tex:28 | `lem:mixed-reductions` (build/sections/04-mixed.tex:108) | 定义改，`eq:singleton-reduction` 的 $-\frac{1}{7-l}$ 系数变形 |
| $\mathbf b=(a,-v,v-a)$ | Gram 电荷三元组 | build/sections/04-mixed.tex:74 | `lem:gram` (build/sections/04-mixed.tex:76) | 换组合，`eq:gram-first` 与 `eq:gram-second` 归零失败 |
| $\mathcal O$ | $(a,c)$ 的同时置换对偶集，$\lvert\mathcal O\rvert=180$ | build/sections/03-complete-family.tex:239 | `eq:cubic-R` (build/sections/03-complete-family.tex:257) | $\lvert\mathcal O\rvert$ 变，$R(b)$ 分母 $72$ 与 $180$ 系数变形 |
| $720$ | $T$ 的对称数 $36\cdot 2\cdot 10$ | build/sections/03-complete-family.tex:188 | `lem:cubic-symmetry` (build/sections/03-complete-family.tex:167) | 数减少，行置换未穷举 $S_6$，轨道常数性断 |
| $7-l$ | 单标签替换的负系数分母 | build/sections/04-mixed.tex:127 | `lem:mixed-reductions` (iii) | $l=7$ 时系数发散，`evmix` 的 (iii) 递归爆 |
