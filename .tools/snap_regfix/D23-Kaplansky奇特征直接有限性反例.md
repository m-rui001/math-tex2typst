# D23 奇特征上的 Kaplansky 直有限性反例：一个我指定但从不打算算出的素数

论文：A Counterexample to Kaplansky's Direct-Finiteness Conjecture in Odd Characteristic（2026-09-26）
素材：研究笔记/素材/Kaplansky奇特征直接有限性-素材.md
源码：preprints/A-Counterexample-to-Kaplanskys-Direct-Finiteness-Conjecture-in-Odd-Characteristic-September-26-2026/build/
Lean：lean/OAI/Algebra/OddKaplansky/（87 文件约 13000 行），ComparatorChallenges/OddKaplansky.json

这一篇没有公开的思维链 summary。reasoning_traces 目录里只有特征 2 版那 23 页。所以我下面复盘的所有"我当时为什么绕开这条路"，都是从论文文本里的防御性措辞和 Lean 代码里的平行结构反推出来的，凡是这类内容我都标了 [推测]。读的时候请把它当作比 D02（特征 2 版）置信度低一档的重构。

## 0. 我为什么要再做一遍奇特征

D02 那一篇我把特征 2 的构造走通以后，留下的第一个疑问就是：那个反例到底吃了特征 2 多少。我当时的判断有三条候选理由，得按顺序排除才肯罢休。

第一条是纯粹机械的：特征 2 里正则度 $D=\ell+1$ 作为标量消失，偶数加法互消让所有符号问题蒸发。这种好处很容易让人误以为机制本身依赖它。第二条是数值上的：特征 2 版的核心不等式靠"$\ell$ 奇 ⟹ $\kappa=\ell^2$ 在 $K$ 中可逆"与"特征 2 ⟹ $D=0$"这两件事同时成立，看起来像是特征 2 特有的巧合。第三条是真的结构性的：$-1=1$ 让域塔论证退化。

写完这一篇我才确认，前两条确实只是便利，第三条才是拦路虎，而且拦路虎可以被反过来利用。论文在 intro 里把边界划得很干净，我原文抄下来贴在这里，因为它就是我当时的疑问清单：

> The construction here has a different local mechanism. A high-degree subspace of a modular translation representation is annihilated on one side; a weighted pairing gives a compatible annihilation on the other. The characteristic-two theorem is not an input to this odd-prime argument, and the two methods retain distinct coefficient hypotheses.

"不是输入"这句话很重要。这两篇是平行的反例，不是归约链：谁也不站在谁肩上。我一开始想找"特征 2 版 ⟹ 奇特征版"的降维路径，比如把特征 2 的构造里的 $\ell$ 换成奇素数再补符号，这条 [推测] 从一开始就走不通，因为特征 2 版的列空间是孔洞插值供应的（多项式方法），奇特征版根本没有插值孔洞可用。

骨架我是照抄的，九层装配顺序一模一样：局部幂等元、图的低秩拟合、矩形恒等式、严格维数不等式、一侧逆、有序零积、三明治或证书侦测反向缺陷、有限群矩阵单位标量化、细胞自动机。换掉的每一层的代数引擎。我先把对位表记在自己的本子上，后面每一步都回到这张表：

| 层 | 特征 2 | 奇特征 |
|---|---|---|
| 系数域 | $\F_{2^{217(\ell-1)}}$，$\ell=2^{21701}-1$ | $\F_{p^4}$，两层二次塔 |
| 本原根 | $\zeta$ 阶 $\ell$（Fermat 保证） | $\zeta$ 阶 $M=p^4-1$（root bound 保证） |
| 组合图 |  punctured affine space 正则围长 12 线族 | 三角形自由 threshold-Kneser 图 |
| 局部群 | $K_v\cong(\Z/\ell)^2$、$L_f\cong(\Z/\ell)$ 粘合 | $H=A_0\rtimes P$，$U\cap V=\{1\}$ |
| 恒等式引擎 | 低次多项式线和为零 | 模平移表示高次子空间单侧湮灭 |
| 配对非退化 | Newton 插值三角性 | 对角加权 Gram + Schwartz 网格界 |
| 打包 | 多重 HNN 特征扭转 | Fourier 特征轨道块 $q_\lambda K[H]\cong\Mat_{p^3}(K)$ |
| 有序零积 | 同槽特征正交 | 右零化子链 $e_i=qX^{p-\ell}$ |
| 维数悖论 | $m<t\le m\ell^2$ | $t/m<1/100<1/96<d/w$ |
| 缺陷侦测 | 标量特化 + 秩论证 | 显式核证书 $u_*$ |
| 标量化 | $(\Z/\ell)^m\rtimes S_m$ 的置换共轭 | 有限 Heisenberg 群的 shift-modulation |

真正让我确信"必须有第二篇"的是这张表的第 5 行和第 11 行：特征 2 用群平均买幂等元、用偶数正则度买归零；奇特征把这两件事的分工颠倒过来，用 $p'$-部买对角化、用 $p$-部幂零买归零。同一个半直积里装着两种互斥的资源，这是新构造，不是旧构造换皮。

## 1. 指定而未计算的素数

主定理要一个奇素数特征。具体取哪个素数无关紧要，要紧的是它满足一批形式性质。论文的取法：

$$m=\binom{1200}{600},\qquad p=\min\{h\in\mathbb Z:h>1,\ h\mid(m!)^2+1\}.$$

$m\approx 4\times10^{359}$，$(m!)^2+1$ 的位数是天文数字，我根本不算它。我用的全部信息只有五条：$p$ 是素数、$p$ 是奇数、$p>m$、$(m!)^2\equiv-1\pmod p$、以及由此推出的 $p\equiv1\pmod4$。逐条看它们怎么来的，因为"specified"这个词的合法性就压在这几行上。

素性：大于 1 的最小因子若是合数，它自己就有更小的非平凡真因子，矛盾。这不需要任何分解。
$p>m$：若 $p\le m$ 则 $p\mid m!$，于是 $p\mid(m!)^2$ 又 $p\mid(m!)^2+1$，相减得 $p\mid1$。
奇性：$m$ 是偶数（$m!\,$含因子 2），$(m!)^2$ 偶，加 1 奇，所以最小素因子 $\ge3$。
$-1$ 是平方：见证元免费赠送，就是 $\overline{m!}\in\F_p^*$。

第四条是这一篇的钥匙，我起初以为它只是让域塔好造，后来发现它卡住了整个构造的可行性。往下走：取 $\F_p^*$ 的一个非平方 $\eta$（平方映射每个非零像有两个原像 $x,-x$，所以平方元恰好一半，非平方必存在），造两层塔

$$K_0=\F_p[\xi]/(\xi^2-\eta),\qquad K=K_0[\nu]/(\nu^2-\xi).$$

第一层是域因为 $\eta$ 非平方。第二层要 $\xi$ 在 $K_0$ 里非平方，我的论证走范数：$\xi$ 在 $K_0/\F_p$ 下的共轭是 $-\xi$，所以 $N(\xi)=\xi\cdot(-\xi)=-\eta$。$-1$ 是平方、$\eta$ 非平方 ⟹ $-\eta$ 非平方；若 $\xi$ 是平方，它的范数就是 $\F_p$ 中的平方，矛盾。$|K|=p^4$。

这里我停了一下：为什么要两层二次，并非直接找一个四次不可约多项式。答案是范数论证提供了传递结构，第二次不可约从第一次免费推出，而直接造四次扩张需要 $X^{p^4}-X$ 的因子分解理论或者一个显式多项式，后者还要论证它的系数是"finite formulas"。两层二次塔的每一步判据都是"某个元素是不是平方"，这是有限个乘法运算能判定的事。[推测] 我认为"指定性"负担是我选塔形的真正理由，数学上四层等价。

如果 $p\equiv3\pmod4$ 呢？我试着把这条路走到底：$-1$ 非平方，$-\eta$ 的平方性变得不可控，第二层一般就退化，$K$ 不再是域或者 $|K^*|$ 不再被我需要的方式整除。这一条给我确认：$p$ 必须挑自 $(m!)^2+1$ 型数的最小因子，不能随便取一个大素数。[推测] 这就是"奇特征"从可行性角度给出的第一个硬约束，比后面任何常数都更根本。

接下来是 $\zeta$。论文造本原元的方式有点刻意，它不引用"有限域乘法群循环"这个标准定理：令 $b$ 为所有元素阶的最小公倍数，Lagrange 给 $b\mid M$（$M=p^4-1$），root bound 给 $M\le b$（否则 $X^b-1$ 有 $M$ 个不同根却次数 $<M$……准确说根数 $M\le b$），再对 $b$ 的每个素数幂因子取阶被它整除的元素、适当取幂、把得到的互素阶可换元素相乘，得到阶恰为 $b=M$ 的元素。然后取"最小的"那个（用 $K$ 的字典序）。

我起初以为这段绕路是文章风格问题。看 Lean 才明白它是被"specified"逼出来的：`FiniteChoice.exists_primitive` 证存在性，`FiniteChoice.first` 取最小元，两者必须分开提供；若引用"循环群生成元"，生成元不唯一，规范化就要额外记账。同时这段论证还顺带供应了 $M$ 在 $K$ 中可逆（$p\nmid M$），后面所有 $|A_*|^{-1}$、$1/M$、$1/n$ 的分母合法性都从这里取。

## 2. 那张图：阈值 Kneser、三角形自由与 1/100 的诞生

我要一张图，它的邻接关系能被一个低秩的显式矩阵分解"拟合"。取 $[1200]$ 的全部 600-子集按序编号成 $I_1,\dots,I_m$（$m=\binom{1200}{600}$），相异 $i,j$ 邻接当且仅当 $|I_i\cap I_j|<200$。拟合矩阵 $F$ 要求 $F_{ii}=1$、相异非邻接处 $F_{ij}=0$，分解形如 $F_{ij}=\sum_{T\in\mathcal T}\alpha_i(T)\beta_j(T)$，$\mathcal T=\{T\subseteq[1200]:|T|\le400\}$，$t=\sum_{j=0}^{400}\binom{1200}{j}$。

三角形自由我先算，因为它是后面粘合层的假设。三个两两邻接的集合，两两交 $\le199$，容斥给并集
$$|I_a\cup I_b\cup I_c|\ge 3\cdot600-3\cdot199=1203>1200,$$
不可能。这个 3 的余量让我意识到 200 这个阈值不是随便写的：它等于 $600-400$，而 $400$ 同时是 $\mathcal T$ 的大小上限和 $\beta$ 多项式的次数。

拟合的构造是显式的。$\alpha_i(T)=1$ 若 $T\subseteq I_i$ 否则 0；$\beta_j(T)$ 定义为多项式
$$Q_j(X)=\prod_{k=200}^{599}\frac{\sum_{x\in I_j}X_x-k}{600-k}$$
展开后 $\prod_{x\in T}X_x$ 的系数，且把每个单项式的正指数都归一成一次（$X_x^r\mapsto X_x$）。三个检查我逐条做：

分母 $600-k$ 跑遍 $1,\dots,400$，而 $p>m>600>400$，所以在 $\F_p$ 里全部可逆。归一在 $\{0,1\}$ 点上不改变取值（$X_x^r=X_x$），而且不升总次数。于是把 $X=\mathbf 1_{I_i}$ 代入，$\alpha_i$ 恰好筛出 $T\subseteq I_i$ 的那些项，得
$$F_{ij}=\prod_{k=200}^{599}\frac{|I_i\cap I_j|-k}{600-k}.$$
对角：$|I_i\cap I_i|=600$，每个因子 $(600-k)/(600-k)=1$，积 1。非边：$|I_i\cap I_j|\in[200,599]$（相异所以 $\le599$），某个 $k$ 命中，该因子为 0。

我特别喜欢 $[200,599]$ 这个零点窗：它左端是邻接阈值、右端是"不等于 600"，所以非边与对角两种要求由同一个乘积同时满足，不需要分情况。这就是 threshold-Kneser 图在 Haviv、Golovnev–Haviv 那条多项式谱系里的做法，源头是 Alon–Babai–Suzuki，但他们那些定理多数给的是 fitting number 的**下界**，而我要的是**上界**并且要能把 $\alpha,\beta$ 写进矩阵。[推测] 这是我把 ABS 只当谱系引用、把构造性那一支当工具的原因；下界型定理给不出可用的 $\beta_j(T)$ 表。

比率是纯二项式计数。$\binom{1200}{j}$ 到 $j=400$ 递增，所以 $t\le401\binom{1200}{400}$，
$$\frac tm\le401\prod_{u=401}^{600}\frac{u}{1201-u}\le401(5/7)^{100}<\frac1{100}.$$
第二条不等式里前 100 个因子（$u=401,\dots,500$）$\le500/701<5/7$，其余全 $\le1$（因为 $u<600.5$）。最后一步用 $(5/7)^3<1/2$ 与 $40100<2^{33}$：$(5/7)^{99}<2^{-33}$，$401\cdot(5/7)^{100}<40100\cdot2^{-33}<2^{16-33}=2^{-17}<1/100$。

我核对这一段是因为它告诉我 1/100 有多宽松。如果阈值改成 300，$t/m$ 会降到 $\approx401\cdot2^{-227}$，更小。也就是说 200 这个值不是被 $t/m$ 逼出来的，是被容斥余量（1203>1200）和零点窗的干净性逼出来的。真正的锁死关系是 $400=600-200$：$\beta$ 的次数 $599-200+1=400$ 必须等于 $\mathcal T$ 的大小上限，$t$ 才只数低次单项式。

1/100 的用处要等到 §5 末尾才兑现：$wt<md\iff t/m<d/w$，另一端是 $1/96$。两条界都取得很松，缝隙 1/100 与 1/96 只差 4%，因为两侧各自裕量巨大。我一开始想把它收紧成 $t/m<1/2<d/w$ 之类的锐利形式，后来明白宽松的分数界对我没有任何坏处，反而让每一步都可以独立验证。

Lean 侧这张图分成四块：`GraphEdges` 把顶点定义成 600-子集的 subtype，并证明 **incidence 图**（二部细分）的围长 $\ge8$，$\Gamma$ 的三角形自由在这里变成细分后无 4-圈，这是 §4 粘合的围长假设来源；`GraphNumerics` 的 `ratio_bound` 是纯 `Nat` 论证（`choose_step`、`choose_growth`）；`SourceFit` 有 `polynomial j`、`alpha`、`beta = BooleanPolynomial.coefficient` 与三条拟合判据 `fitting_diagonal`/`fitting_nonedge`/`fitting_eq`；`BooleanPolynomial` 负责归一保持 0-1 求值，它的 `evaluate` 引理要求 `f.totalDegree ≤ n`，说明归一后的次数控制是形式化的硬需求，不是行文装饰。

## 3. 局部群：一个半直积里装两种互斥资源

现在到了我称之为这篇论文"第一性理由"的地方，也是 §2 尾部无编号定义的 $H$。取
$$P=(\F_p)^3,\qquad A_0=(\Z/M\Z)^P,\qquad H=A_0\rtimes P,\qquad (a,s)(a',s')=(a+s\cdot a',\,s+s'),\quad (s\cdot a)(x)=a(x-s),$$
$w=|H|=M^{p^3}p^3$。取 $c\in A_0$ 为在 0 处取 1、其余取 0 的 delta 函数，令
$$u(s)=(0,s),\ U=u(P),\qquad v(s)=cu(s)c^{-1},\ V=cUc^{-1}.$$

我验算 $v(s)$ 的第一坐标，这里我第一次差点算错。$(c,1)(0,s)$：$s\cdot0=0$，得 $(c,s)$。再右乘 $(c,1)^{-1}=(-c,1)$：$(c,s)(-c,1)=(c+s\cdot(-c),s)=(c-s\cdot c,s)$。而 $c-s\cdot c$ 在 $x$ 处取值 $\delta_0(x)-\delta_s(x)$，也就是 0 处 1、$s$ 处 $-1$。$s\ne0$ 时它非零，所以 $U\cap V=\{1\}$：$u(s)=v(t)$ 要第二坐标 $s=t$、第一坐标 $c-s\cdot c=0$，后者逼 $s=0$。

中途我把共轭顺序写反过一次，得到 $b+s\cdot b$ 那种"两点都取 1"的函数，那时 $U\cap V$ 的论证就会假性成立或假性失败。正确的方向性是 $c-s\cdot c$，它的非零性只依赖 $c$ 不是平移不变的。[推测] 我怀疑这就是论文选 delta 的理由：它是最便宜的"非平移不变函数"，任何非常值函数都行，但 delta 让第一坐标的支撑只有两点，后面 §3 里 $D_\lambda$ 的对角元读起来最干净。

两种资源的分工是这样：

资源 A，幂零性，吃特征 $p$。平移算子 $L_s$ 满足 $L_s^p=I$，所以在特征 $p$ 里 $X_s=L_s-I$ 有 $X_s^p=L_s^p-I^p=0$。（二项展开 $(1+X)^p=1+X^p$ 只在特征 $p$ 塌缩，中间系数 $\binom pk$ 全被 $p$ 整除。）它让增广理想幂零，让高次列被 $(L_s-I)^\ell$ 湮灭。

资源 B，可逆性，吃 $p\nmid M$。$M=p^4-1$ 与 $p$ 互素，所以 $M$、$M^{p^3}$、$n=M^q$ 在 $K$ 里全可逆。Fourier 投影 $p_\chi=|A_*|^{-1}\sum_a\chi(a)^{-1}a$、Heisenberg 幂等 $f'$、所有分母都合法，特征基座 $(\Z/M\Z)^P$ 完全可对角化。

$A_0$ 是 $p'$-部（对角化）、$P$ 是 $p$-部（幂零），半直积把两者装进同一个有限群。这就是"modular translation representation"这个词的确切所指：我不能对整个 $H$ 做 Maschke 平均，因为 $p\mid|P|$，除以 0；Clifford 式的做法是只对正规 $p'$-部对角化，$p$-部按轨道加稳定子处理。[推测] 我一开始确实试过"把 $P$ 也特征对角化"，那就是这条路，失败机制是 Maschke 定理在 $p\mid|P|$ 时直接不成立，$K[P]$ 不半单，特征数量不够。

为什么 $P$ 恰好三维，这个我算了很久才找对理由，而且它跟 §3 的代数没关系。三维是**短字长度 3** 传导过来的。§4 的粘合判据要求顶点处任意 $\le3$ 个相异方向的向量的非零标量组合不为零，即至多 3 个相异方向线性无关。二次参数化 $(1,\bar j,\bar j^2)$ 的 Vandermonde 行列式 $(\bar j_2-\bar j_1)(\bar j_3-\bar j_1)(\bar j_3-\bar j_2)$ 非零要求空间至少三维。二维里三个相异方向必相关，$k=3$ 的短字条件直接毁掉，Euler 预算破产。四维则 $h/p^4$ 掉到 $1/384$ 一档，秩分数不够。所以 3 维是两组约束（短字要 $\ge3$、秩分数要够大）唯一的交点，不是审美选择。

$A_0$ 为什么取这么大我也想过。$A_0=(\Z/M)^P$ 的特征群是 $(\Z/M)^{p^3}$，秩 $p^3$，每个坐标函数给一个独立指数，Fourier 基有 $M^{p^3}$ 个，$\zeta$ 的阶 $M$ 恰好够给所有指数赋值。代价是 $w=M^{p^3}p^3$ 巨大，但 $d/w$ 只依赖比例：$d=hp^3|\mathscr R|$，$|\mathscr R|>|A_0|/(2p^3)$，$M^{p^3}$ 在分子分母之间约掉了。[推测] 我用大群买的是"比例"，这与特征 2 版用 $|V|=t$ 个子群平均买 $t/m$ 是同一手。若把 $A_0$ 换成 $(\Z/q\Z)^P$（$q\mid M$，$q<M$），$\zeta$ 的阶浪费、$\chi(z)=\zeta$ 型条件错位、$f=\frac1M\sum\zeta^{-k}z^k$ 与 $K[A_0]$ 的 Fourier 分解对不上。

## 4. 高次切片与 $\ell=(p-1)/2$ 的双向夹逼

§3.1 造那个被湮灭的列空间。在 $K^P$ 上 $\mathbf e_x$ 是标准基，$L_s\mathbf e_x=\mathbf e_{s+x}$，取三个标准生成元 $\varepsilon_j$ 对应的 $X_j=L_{\varepsilon_j}-I$。它们交换，且 $X_j^p=0$。断言
$$X_1^{n_1}X_2^{n_2}X_3^{n_3}\mathbf e_0,\qquad 0\le n_1,n_2,n_3<p$$
是一组基。张成：$\mathbf e_x=L_{\varepsilon_1}^{x_1}\cdots L_{\varepsilon_3}^{x_3}\mathbf e_0=(I+X_1)^{x_1}\cdots(I+X_3)^{x_3}\mathbf e_0$，展开就是 $X$-单项式的和；个数 $p^3=\dim K^P$，张成即基。这一条我完全不需要独立性论证，计数替我做了。

$D=3(p-1)$ 是单项式最大总次数。$B$ 的列是总次数 $\ge D-\ell+1$ 的那些单项式作用在 $\mathbf e_0$ 上，按字典序排列。双侧湮灭：$L_s-I$ 是 $X_j$ 的零常数项多项式，乘 $(L_s-I)^\ell$ 把每列总次数抬升至少 $\ell$，从 $\ge D-\ell+1$ 到 $\ge D+1$；总次数 $\ge D+1$ 的单项式必有一个指数 $\ge p$（三个都 $\le p-1$ 时总次数 $\le D$），故为零。于是 $(L_s-I)^\ell B=0$。转置侧我对 $-s$ 用同一断言，再用 $L_{-s}^{\mathsf T}=L_s$（矩阵 $(L_s)_{x,y}=[x=s+y]$，转置把条件换成 $[y=s+x]$，正是 $L_{-s}$），得 $B^{\mathsf T}(L_s-I)^\ell=0$。

这里论文加了一句我很在意的注释："The transpose identity uses $L_{-s}^{\mathsf T}=L_s$; no scalar conjugation is present." 全文的约定是"矩阵在自由右模的列上作用，entry 从左边乘坐标，转置是普通转置，没有对合"。在特征 2 版里这条约定是为了回避 $-1\ne1$ 的论证；到了奇特征里 $-1\ne1$ 明明成立，却还是不用对合，改用"转置加参数取反"。[推测] 我认为这是为了让 §3 的两侧湮灭保持同一个证明形状，一旦引入标量共轭，$(L_s-I)^\ell$ 的转置会带 $\bar\lambda$，$B$ 的列空间就不是同一个对象。

列数计数是换元加星与棒。令 $a_j=p-1-n_j$，高次条件变成 $a_1+a_2+a_3\le\ell-1$，各 $a_j\le p-1$ 自动满足（$\ell-1<p$）。于是
$$h=\binom{\ell+2}{3}=\frac{(\ell+2)(\ell+1)\ell}{6}=\frac{(p-1)(p+1)(p+3)}{48},$$
$h/p^3=\frac{(p-1)(p+1)(p+3)}{48p^3}>1/48$，因为分子减 $p^3$ 是 $3p^2-p-3>0$（$p\ge3$）。

$\ell$ 的取法我要单独说，因为它是全篇唯一一个"奇"字直接进常数的地方。约束是双向的。下界方向：$h$ 随 $\ell$ 单调增，$\ell$ 越大高次切片越多，秩分数越大。上界方向：有序零积（§3.4）需要 $p-\ell\ge\ell$，也就是 $\ell\le p/2$，因为我要从 $X^{p-\ell}e_j$ 的左端分离出 $X^\ell$。$\ell=(p-1)/2$ 同时取到上界与最大 $h$。

我做过的另一些取法都塌：$\ell=p-1$ 时 $h/p^3\to1/6$ 明显更好，但 $p-\ell=1$，链 $e_i=qX^{p-\ell}$ 变成 $e_i=qX$，我从 $Xe_j$ 里什么也分离不出来，零积断掉。$\ell$ 小一点，链闭合但 $h/p^3$ 掉，$d>w/96$ 的预算不够（需要 $h/p^3>1/48$ 这种强度）。所以 $(p-1)/2$ 是被两侧同时挤出来的，中间没有自由度。$D=3(p-1)$ 后来在 §5 幂零界 $D_{\max}=3(p-1)$ 处第二次出现，两处同源于"三个生成元、每个指数 $<p$"。

§3.1 末尾有一句警告，是我理解后面为什么要绕一大圈加权配对的入口：

> The same subspace is killed on the two sides ... but an arbitrary projection onto it need not give the outgoing conjugate annihilation. We therefore choose the row factor by a diagonal weighted pairing.

也就是说 $B$ 只给我一个列空间以及它双侧被湮灭这个事实。幂等元需要的是"投影因子"，而右因子随便取会丢掉出射侧的**共轭**湮灭（出射侧作用的是 $D_\lambda L_sD_\lambda^{-1}$，不是 $L_s$）。这条警告下面就是我第一次真正卡住的地方。

## 5. 对角加权配对、Schwartz 网格界与"过半"

先摆 Fourier 恒等式。对函数群 $A_*=(\Z/M\Z)^E$ 与特征 $\chi$，$p_\chi^{A_*}=|A_*|^{-1}\sum_{a}\chi(a)^{-1}a$。非平凡特征求和为零，论证是平移消去：取 $b$ 使 $\chi(b)\ne1$，则 $b\sigma=\chi(b)\sigma$，$(1-\chi(b))\sigma=0$。由此 $p_\chi p_\psi=\delta_{\chi\psi}p_\chi$、$\sum_\chi p_\chi=1$、$ap_\chi=\chi(a)p_\chi$，且每个 $p_\chi\ne0$（恒等系数 $|A_*|^{-1}\ne0$），$|A_*|$ 个两两正交幂等自动线性无关，构成 $K[A_*]$ 的基。分母需要 $p\nmid|A_*|$，这里 $|A_*|$ 的幂整除 $M$。

特化到 $A_0$。特征上的 $P$-作用定义成 $(s\lambda)(a)=\lambda((-s)\cdot a)$。令 $\chi_x=x\lambda$、$D_\lambda=\diag(\chi_x(c):x\in P)$、$N_\lambda=B^{\mathsf T}D_\lambda^{-1}B$。**可采纳**定义为：$\lambda$ 在 $P$ 中稳定子平凡且 $N_\lambda$ 可逆。

引理 3.3 说可采纳者过半。两半计数我分开做。

第一半（稳定子）。非零 $s\in P$ 的平移 $x\mapsto x+s$ 把 $P$ 分成 $p^2$ 个长 $p$ 的轮换；被 $s$ 固定的特征在每个轮换上指数为常数，所以恰有 $M^{p^2}$ 个。并集界给"有非平凡稳定子"的占比 $\le(p^3-1)M^{p^2-p^3}$。

第二半（加权 Gram）。这里 $\chi_x(c)=\lambda(c_{-x})$（核对：$\chi_x(c)=\lambda((-x)\cdot c)$，而 $(-x)\cdot c$ 是支撑在 $-x$ 的 delta），所以当 $\lambda$ 遍历全部特征时，$D_\lambda^{-1}$ 的对角元 $\chi_x(c)^{-1}$ **独立地**遍历 $K^*$。把对角元当成独立变量 $\tau_x$，Cauchy–Binet 给出
$$Q(\tau)=\det\bigl(B^{\mathsf T}\diag(\tau_x)B\bigr)=\sum_{|J|=h}\det(B_J)^2\prod_{x\in J}\tau_x.$$
$B$ 列满秩，某个极大子式 $\det(B_J)\ne0$，对应单项式系数非零；不同 $J$ 给不同单项式，所以 $Q$ 是非零多项式，总次数 $h$。这句话的分量在于：**未加权**的 $B^{\mathsf T}B$ 完全可能奇异。加权把"可逆性"这个不可数的性质变成一个多项式非零点这个可数的性质。

有了非零 $h$ 次多项式，就上 Schwartz 网格界：总次数 $\le a$ 的非零多项式在乘积网格（每坐标 $M$ 个值）上至多消失 $a/M$ 的比例。论文给的是完整的归纳证明，并非引用：对末变量归纳，其首项系数次数 $\le a-b$，在前面坐标的选择上至多消失 $(a-b)/M$；每个剩下的选择上，末变量的一元多项式至多 $b$ 个根，贡献 $b/M$；相加 $a/M$；常数情形起归纳。奇异配对因此占比 $\le h/M$。

两块相加要 $<1/2$，论文用两个各自 $<1/4$ 的碎片：
$$\frac hM\le\frac{p^3}{p^4-1}<\frac14,\qquad (p^3-1)M^{-p^2(p-1)}\le\frac{p^3-1}{M}<\frac14 .$$
第一条是 $p^4-1-4p^3=p^3(p-4)-1>0$，要 $p>4$；第二条用了 $p^2(p-1)\ge1$。$p>m>600$ 让两条都轻松。

最后是轨道选择。每条含可采纳成员的 $P$-轨道取第一个可采纳成员为代表，得 $\mathscr R$。每条被选轨道是自由的，大小 $p^3$，且这些轨道覆盖全部可采纳特征，所以
$$|\mathscr R|>\frac{|A_0|}{2p^3}.$$
我注意到论文在这里特意补了一句："This argument does not need admissibility to be constant on an orbit." 我不要求可采纳性沿轨道不变，只数"至少含一个可采纳成员"的轨道。这个松绑让我一开始担心的一处漏洞消失了：$P$-作用把 $\lambda$ 送成 $s\lambda$，$N_{s\lambda}$ 与 $N_\lambda$ 是相似还是共轭我并未验证，也不需要验证。

[推测] 我在这个位置试过两条更朴素的路。一条是只用未加权 Gram，然后宣称存在某个可逆的极小子式：可逆性不构成多项式零点集，我没法给坏者计数，"过半"就无从谈起。另一条是用二阶矩或 Chebyshev 型的概率论证：有限域上没有绝对值没有序，矩方法塌掉。Schwartz 界是纯代数的，靠单变量根数加归纳，对任意域成立，这是我在这篇里第二次看到"把不可数的性质先代数化成可数的性质"这类动作（第一次是特征 2 版的 Newton 插值）。

还有个我一开始想省的地方：只证存在一个可采纳特征行不行。不行。$d=hp^3|\mathscr R|$ 是对所有被选块求和，单个 $\lambda$ 只给一个块的秩 $hp^3$，占 $w=M^{p^3}p^3$ 的比例微乎其微。我必须凑够 $|A_0|/(2p^3)$ 量级的块才能把 $d/w$ 顶过 $1/96$。密度不是锦上添花，它就是秩分数本身。

## 6. Fourier 轨道块、显式幂等元 $e$ 与正则秩 $d/w>1/96$

固定 $\lambda\in\mathscr R$，对 $x,y\in P$ 令
$$E_{xy}^{\lambda}=p_{x\lambda}^{A_0}u(x-y).$$
共轭给出 $u(s)p_\chi u(s)^{-1}=p_{s\chi}$，于是矩阵单位律成立：
$$E_{xy}^{\lambda}E_{zt}^{\lambda}=\delta_{yz}E_{xt}^{\lambda}.$$
我把中间那步写全。$E_{xy}E_{zt}=p_{x\lambda}u(x-y)p_{z\lambda}u(z-t)$，用 $u(a)p_\chi=p_{a\chi}u(a)$ 把 $u(x-y)$ 穿到 $p_{z\lambda}$ 左边：$u(x-y)p_{z\lambda}=p_{(x-y)\cdot(z\lambda)}u(x-y)=p_{(x-y+z)\lambda}u(x-y)$（$P$-作用在特征群上线性）。Fourier 正交要求 $x\lambda=(x-y+z)\lambda$，即 $(y-z)\lambda$ 是平凡特征；稳定子平凡 ⟺ $y=z$。$y=z$ 时 $u(x-y)u(y-t)=u(x-t)$，得 $E_{xt}^{\lambda}$。不同轨道之间的乘积直接为零，不需要自由性。所以自由性买的就是 $\delta_{yz}$ 这一条。

$q_\lambda=\sum_xp_{x\lambda}$ 是中心的：与 $A_0$ 交换因为各 $p_\chi$ 是 $A_0$-特征幂等；与 $P$ 交换因为 $P$ 只是置换求和指标。块理想 $q_\lambda K[H]$ 的基由 $p_{x\lambda}u(s)$ 指标，而 $(x,y)\mapsto s=x-y$ 是双射，所以 $E^\lambda_{xy}$ 就是一组矩阵单位，$q_\lambda K[H]\cong\Mat_{p^3}(K)$。这是 Clifford 轨道块的显式实例，论文同时声明它"不宣称整个模代数半单"，只有 $p'$-部 $A_0$ 被对角化。

块上的作用：$u(s)\mapsto L_s$，$c\mapsto D_\lambda$，$v(s)\mapsto D_\lambda L_sD_\lambda^{-1}$。第三条是群关系 $v=cuc^{-1}$ 在块层的表示。$c$ 在这里第二次上岗：第一次（§2）给我 $U\cap V=1$，第二次给我对角化。一个群元素双职，这是我在整篇里觉得最漂亮的一处设计。

于是投影因子取
$$T_\lambda=BN_\lambda^{-1}B^{\mathsf T}D_\lambda^{-1},\qquad e=\sum_{\lambda\in\mathscr R}\sum_{x,y\in P}(T_\lambda)_{xy}E_{xy}^{\lambda}.$$
因为 $B^{\mathsf T}D_\lambda^{-1}B=N_\lambda$，有 $T_\lambda B=B$、$T_\lambda^2=T_\lambda$，像恰为 $\im B$（$h$ 维）。块正交给 $e^2=e$。

入射侧湮灭 $(L_s-I)^\ell T_\lambda=0$ 直接用 §3.1 第一式。出射侧我必须**保持因子的实际顺序**：
$$B^{\mathsf T}D_\lambda^{-1}(D_\lambda L_sD_\lambda^{-1}-I)^\ell
=B^{\mathsf T}D_\lambda^{-1}D_\lambda(L_s-I)^\ell D_\lambda^{-1}
=B^{\mathsf T}(L_s-I)^\ell D_\lambda^{-1}=0 .$$
中间用 $D_\lambda$ 可逆把 $\ell$ 次幂里的共轭提出。我试着重排过一次，立刻失败：$D_\lambda^{-1}$ 与 $L_s$ 不交换，唯一能用上转置湮灭 $B^{\mathsf T}(L_s-I)^\ell=0$ 的顺序就是"先让 $D_\lambda$ 消掉"。论文为此专门写了 "keep the factors in their actual order"。这一句是那种被咬过之后才留下的话。

现在算秩，这一步我第一次算小了。若只算块表示矩阵 $T_\lambda$ 的秩，得 $h$。要算的是**正则秩**：在 $\Mat_{p^3}(K)$ 里左乘 $T_\lambda$ 的像，是"$p^3$ 个列都落在 $\im B$ 里"的矩阵全体，维数 $hp^3$。$|\mathscr R|$ 个直和块相加：
$$d=hp^3|\mathscr R|,\qquad \frac dw=\frac{h|\mathscr R|}{|A_0|}>\frac{h}{2p^3}>\frac1{96}.$$
最后一步就是 §3.2 的 $h/p^3>1/48$ 除二。轨道选择丢掉的那个 $1/2$ 正是从这里付出。$X$ 非投射由 $e\ne0$ 且像非零给出，后面还要用到。

Lean 的对应物值得一看，因为它把"正则秩"与"表示秩"的区分做成了显式引理：`MatrixUnits.lean` 的 `regular_rank_bound` 与 2.7 的措辞同型；`WreathFourier.lean` 的 `modular_idempotent` 是命题 3.2 的泛型版本，输入是列矩阵 $B$ 加两侧湮灭假设，输出幂等元和 $w<96d$ 的整数不等式（Lean 全程用 $w<96d$ ，并非 $d/w>1/96$，避免在一般域里写分数）；`ModularSource` 的 `left_ann`/`right_ann` 经 `Represents` 接口 `annihilates_left/right` 把"矩阵层湮灭"翻译成"代数层湮灭"。`AugmentationMatrices` 里高次的定义写成 `card E * (p-1) < ell + ∑ n_i`，与我上面写的 $\sum n_j\ge D-\ell+1$ 是恒等变形，但 Lean 那个方向不需要先定义 $D$。

## 7. 有序零积 $e_ie_j=0$：这一篇最独特的一条引理

取 $H$ 的 $m$ 份拷贝 $H_i$。对每条边 $i<j$，把 $H_i$ 里的 $v(1,\bar j,\bar j^2)$ 与 $H_j$ 里的 $u(1,\bar i,\bar i^2)$ _identify_（bar 是 $\F_p$ 中的像），商群记 $G_0$。$e_i$ 是 $e$ 在 $H_i$ 中的像。推论 3.5 断言：每条边 $i<j$，$e_ie_j=0$ 于 $K[G_0]$。

证明只有四行，但每一行我都得停。设共享生成元为 $y$（在两侧起初都是 $p$ 阶），$X=y-1$。局部循环群代数 $K[\langle y\rangle]=K[X]/(X^p)$。

第一步，右零化子精确是尾部理想。$K[X]/(X^p)$ 的基是 $1,X,\dots,X^{p-1}$，右乘 $X^\ell$ 送 $X^i\mapsto X^{i+\ell}$，所以 $aX^\ell=0$ 当且仅当 $a$ 在所有 $i+\ell<p$ 的位置上系数为零，当且仅当 $a\in(X^{p-\ell})$。这是幂零链代数的性质，不依赖 $y$ 在 $H_i$ 里怎么摆。

第二步，自由右模分解。取 $H_i$ 的左陪集代表 $a$，它们给出 $K[H_i]$ 作为右 $K[\langle y\rangle]$-模的自由基。于是出射湮灭 $e_iX^\ell=0$ 可以**逐坐标**用第一步，得到 $e_i=qX^{p-\ell}$，$q\in K[H_i]$ 局部。关键顺序：这一步必须在**取商之前**做，因为商 $K[H_i]\to K[G_0]$ 里陪集已经粘合，自由右模分解不再存在。论文原话 "applied coefficientwise in this basis before taking images in the quotient" 就是这个意思，Lean 的 `Construction.ordered_zero` 严格按此排：先 `edgeHom` 局部嵌入、后 `Gluing.edge_eq`。

第三步，方向匹配。边 $i<j$ 上，$y$ 在 $H_i$ 侧是 $v(1,\bar j,\bar j^2)$，属于 $V$；在 $H_j$ 侧是 $u(1,\bar i,\bar i^2)$，属于 $U$。命题 3.2 的湮灭分工是：出射侧认 $V$（$e(v(s)-1)^\ell=0$），入射侧认 $U$（$(u(s)-1)^\ell e=0$）。所以**出射湮灭在 $i$ 侧触发**给 $e_iX^\ell=0$，**入射湮灭在 $j$ 侧触发**给 $X^\ell e_j=0$。粘合关系的非对称选择（小指标端接 $V$、大指标端接 $U$）正是为这个匹配设计的。

第四步，链式相消。$p-\ell=\frac{p+1}{2}=\ell+1$，于是
$$e_ie_j=qX^{\ell+1}e_j=qX\,(X^\ell e_j)=0,$$
$X^\ell e_j=0$ 在 $K[G_0]$ 中成立（同态保持）。全程只用结合律，没有因子跨越 $X$ 被交换。

论文在这条引理后面写了两句话：No factor is commuted across $X$, and no reverse ordered product is asserted. 我起初以为这只是谨慎声明。读到 §5 的压缩引理才明白"无反向断言"是必需品：压缩层要的恰是三角结构，$i<j$ 处为零、$i>j$ 处任意。假如我能对称地证出 $e_je_i=0$，$\mathcal N$ 就成了满矩阵，$\mathcal N^m=0$ 失效，整套修正级数不存在。

那么对称零积到底能不能做？我试过，机制是沉默的：$e_je_i$ 要用 $e_j$ 的出射湮灭去撞 $y$，但 $y$ 在 $H_j$ 侧是 $U$-型，而出射湮灭只认 $V$。要让它认 $U$，只有两条路，要么 $U=V$（毁掉 $U\cap V=\{1\}$，短字条件全塌），要么让 $e$ 对 $U,V$ 双侧对称湮灭（§3.1 的加权配对明确做不到）。[推测] 我认为有向性在这里是本质，并非技术限制，它把图上的定向直接变成了代数里的上三角。

$p>m$ 在这条引理里也上岗了：顶点 $i$ 处入边供 $u(1,\bar j,\bar j^2)$、出边供 $v(1,\bar j,\bar j^2)$，相异邻居必须给出相异方向，这需要所有 $\bar j$（$j\le m$）两两不同，也就是 $p>m$。这就是为什么 $p$ 要大于那个天文数字 $m$，并非随便一个大素数。

Lean 侧这条引理只有 `OrderedZero.lean` 一个文件、一条 `product_zero`，其假设写作 `hell : ell ≤ p-ell`，即 $p-\ell\ge\ell$ 的整数形式。我在 §3.1 那里得到的"$\ell$ 被两侧夹住"的上界，在 Lean 里就是一个字段名。

## 8. 粘合不塌缩：$C(4)$–$T(4)$、球面地图与 Euler 亏损 8

引理 4.1 是初等的、也是我这一篇里花最多时间的一段。设 $\Delta$ 有限简单三角形自由图，每个顶点一个有限群 $D_i$，每条边一个非平凡有限循环群 $C_\gamma$，两端各有一个单射 $\iota_{\gamma,i}:C_\gamma\to D_i$。顶点处的条件：若 $1\le k\le3$、$\gamma_1,\dots,\gamma_k$ 都与 $i$ 关联、$s_a\in C_{\gamma_a}\setminus\{1\}$、且相邻边标签在循环意义下互异，则
$$\iota_{\gamma_1,i}(s_1)\cdots\iota_{\gamma_k,i}(s_k)\ne1 .$$
结论：每个 $D_i\to Q$ 单射，$Q$ 是自由积按边群恒等商掉。

论文对这段的定位很坦白，我先记下来，因为它否掉了我第一反应：Ordinary graph-of-groups normal form does not by itself establish this first quotient's injectivity.  Bass–Serre 正规形给"每元素有规范形"，但"顶点群单射"需要规范形在顶点子群上不塌，而这里同时商掉了多个循环子群的恒等关系，一般理论的假设并不自动满足。第二条我试过的路是直接把 Prytuła 的 complexes of groups 机器整套搬来，那需要可发展性（link 条件、发展复形）这一堆额外输入；论文选择用"带标签球面地图 + Euler 公式"自足地做，代价是我在下面要走的六步。

第 0 步：先在子群层做。令 $D_i^0$ 为由所有 $\iota_{\gamma,i}(C_\gamma)$ 生成的子群，令 $L$ 为"每边一个生成元 $x_\gamma$、定义关系恰为单顶点处所有求值为 1 的字"的群。良定义的映射 $D_i^0\to L$ 存在（同一元素的两个代表字只差一个这类关系）。最后用置换作用扩到 $D_i$（第 6 步）。

第 1 步：字等式 ⟹ 例外球面地图。假如 $D_i^0$ 的某非恒等元在 $L$ 里死去，取代表字 $w$。归约序列的存在性论证是："membership in the normal closure of the relators expresses $w$ in the free group as a finite product of conjugates of relators; free insertions and cancellations reach such a product, and the conjugated relators can then be erased." 画法： successive words 画在矩形的水平层上，每个字母一条有向边（dart），空层用一条 neutral 边，未变前后缀用不相交的 neutral 边连接，插入或删除处把插入块的两端与对面单点相连。strip 面读到"字母加其逆"或"被插入的关系"，外表面读到 $w$ 或 $w^{-1}$。地图的定义（我照抄，因为措辞就是判据）：

> A map is a finite connected graph drawn tamely on the sphere, allowing loops and parallel edges. An edge is either neutral, with value 1, or is labelled by an edge γ of Δ. In the latter case its two oriented traversals, called darts, have mutually inverse values in C_γ \ {1}. ... A face is ordinary when this evaluation is the identity. Call the map exceptional if precisely one face has nonidentity evaluation and all other faces have identity evaluation.

起点改变只会把边界乘积共轭、反向遍历会取逆，所以"恒等与否"良定义。极小性在所有这类抽象地图中按边数取，且不要求地图真的来自某个字归约（这个自审结论与特征 2 版逐字同型，见 D02）。

第 2 步：边界行走与 Euler。取球面定向，顶点处 $\sigma$ 是出射 darts 的循环后继，$\alpha$ 反转 dart，边界行走是 $\sigma\alpha$ 的轮换。连通图公式 $v-e+F=2c$（论文给了完整性证明：非桥边删去会合并两个边界行走且保连通，归纳到树，分支求和）。

第 3 步：初等约化。neutral 非圈边可收缩。neutral 圈：保留含例外面那一侧的闭包、移除圈。无桥：删桥得边值 $s$，所在面行走分裂成 $W_1,W_2$，原词 $W_1sW_2s^{-1}$，按"例外/普通"和 $W_a$ 的求值是否 $\ne1$ 分拣，总能保留一个更小的例外地图。每条边两侧面类型不同：否则删边并面，用恒等式 $DE=s^{-1}(sD)s(s^{-1}E)$ 说明"普通+普通仍普通、普通+例外仍例外"，边数减少。于是跨边 $\gamma$ 的两侧类型恰是 $\gamma$ 的两个端点。至多一个圈，且若存在圈，它圈住的例外面是 monogon。

第 4 步：同标签连续 dart 的平滑，这是全段最精巧的一步。设面 $\Phi$ 有两条连续非圈 dart $e:a\to b$、$f:b\to d$，同标签 $\gamma$，值 $\epsilon,\varphi$。它们属于不同的边（否则 $\Phi$ 的两侧经过同一条边，就是桥）。$\gamma$ 的另一端类型 $j$ 是两个对面的类型。手术：删掉两条边，沿 $\Phi$ 在 $b$ 的空角插入新边 $g:a\to d$，值 $\epsilon\varphi$（为 1 则记 neutral），slot 规则确定球面嵌入。对面 $X\ne Y$ 时两对面合并，求值 $(\epsilon\varphi)^{-1}DE=\varphi^{-1}(\epsilon^{-1}D)\varphi(\varphi^{-1}E)$；$X=Y$ 时该行走 $\bar eD\bar fE$ 分裂成 $\bar gD$ 与 $E$，原词求值经循环起点变换为 $(\varphi^{-1}B\varphi)A$。三种恒等式的写法全部是**共轭形式**，因为群是非交换的，而共轭与循环移位保"求值等于 1"。这是特征 2 版（交换群权重求和）完全不需要的小心。结论：极小地图没有同标签的连续非圈 dart。

第 5 步：Euler 亏损。顶点度 $\ge4$：非圈基点顶点绕一圈读相邻面类型，得到 $\Delta$ 中的闭行走；每条入射边跨到不同类型、相邻标签互异（第 4 步）所以无立即回折；三角形自由所以无长度 $<4$ 的闭行走；故度 $\ge4$。普通面长 $\ge4$：边界非空，长度 1、2、3 的边界就是 $k=1,2,3$ 的短字求值为 1，被条件禁绝。于是
$$\sum_v(4-\deg v)+\sum_F(4-|\partial F|)=8.$$
无圈时只有例外面正贡献，其非空行走至多贡献 3，总和 $3<8$，矛盾。有圈时圈基点至多 2、例外 monogon 贡献 3、圈另一侧的面至多 2（它不能长 1，因为唯一那个字母就是圈的非恒等值，被 $k=1$ 禁绝），总和 $2+3+2=7<8$，矛盾。所以例外地图不存在，$D_i^0\to L$ 单射。

我把两个预算的账分开记：短字三档买"普通面长 $\ge4$"，三角形自由买"顶点度 $\ge4$"。缺一条，右边 8 就补不平。若短字只到 $k=2$，普通三角面可存在，各贡献 1，加上例外面的 3 与若干度 3 顶点的 1，总和能凑到 8，论证失效。[推测] 这正是 $P=(\F_p)^3$ 三维、$k\le3$ 的来处：Euler 需要三档，Vandermonde 需要三维。

第 6 步：扩到整个 $D_i$。$\Omega=L\times\mathbb N$，$L$ 左乘第一坐标；限制到 $D_i^0$ 是自由作用、轨道可数无穷；$D_i^0$ 在 $D_i\times\mathbb N$ 上同样自由且轨道可数无穷；配对轨道再逐点等变延拓，得 $D_i^0$-等变双射 $D_i\times\mathbb N\to\Omega$，把 $D_i$ 的自由左作用搬运过去，而它在 $D_i^0$ 上恰是原作用。各 $i$ 独立选取，各作用在边群的选定生成元上一致（都等于 $x_\gamma\in L$），所以拼成 $Q$ 在整个 $\Omega$ 上的作用，在每个 $D_i$ 上忠实。这就是轨道配对置换作用证书，与特征 2 版 §3.2、以及本篇 §5 的 $G_1$ 嵌入是同一模式的第三次使用。它不进 prescription：论文特别说了那些可数置换作用不是系数搜索的输入。

命题 4.2 只是把 4.1 的条件对 $\Delta=\Gamma$、$D_i=H_i$ 验一遍。同侧情形：$U$ 交换，$u(a)$ 相加，$k$ 音节求值为 1 等价于 $\sum\varepsilon_ra_r=0$；三个相异的 $(1,\bar j,\bar j^2)$ 由 Vandermonde 行列式线性无关，$\bar j$ 相异因为 $p>m$；两个看前两坐标；一个非零。混合情形：长 2 或 3 的混合词必有一侧恰一个音节，循环置换把它挪到首位，右端整段落在另一子群里，于是那个非平凡音节落在 $U\cap V=\{1\}$ 里，矛盾。长度 $\le3$ 的循环序列里"相邻循环互异"恰好等于"全体互异"，所以需要覆盖的字全到齐了。群代数单射是"嵌入子群的元素仍是群基中不同元素"。

Lean 侧最有意思的是复用：`Diagrams.lean`（3839 行，全库最大文件）里的 `Ribbon`/`Spherical`/`euler_contradiction` 用置换代数表达地图手术，与特征 2 版的 `RibbonGeometry.lean` 是**平行复制**，并非 import；`NoncommBalanced` 是 `PlanarBalance` 的非交换升级（$\iota:V\to F\to(A\to*B)$，加 `ShortWords` 三档字段）；`Gluing.vertex_injective` 的围长假设写成 `8 ≤ (Planar.incidenceGraph Inc).egirth`，也就是二部细分图的围长，不是 $\Gamma$ 本身的；`Amalgam.lean` 里带了 `OddKaplansky.MultipleHNN`，而主链路根本不用多稳定字母 HNN，属于冗余携带。[推测] 我判断这些冗余是把特征 2 版代码库整个 fork 后裁剪的痕迹，形式化成本比数学成本更高，正好印证"论文一句话、Lean 一个模块"在这两篇里都成立。

`SourceGluing.lean` 的 `edgeHom v e` 把边映到 `LocalGroup.edgeHom ... (index 邻居)`，`shortWords` 是三档验证，`vertex_injective` 汇总三条假设。`LocalGroup.edge_word_one/two/three` 的实现不论文的 $U\cap V$ 论证，是直接对右坐标做线性组合（`q.right.toAdd` 的线性和为零逼系数为零），比论文更直接。

## 9. 中央扇区 $G_1$：把数值秩变成同一环上的恒等式

我到这里手里的东西是：$m$ 个 $K[H_i]$，每个里一个幂等 $e_i$，正则秩都是 $d$，以及边上的有序零积。$e_iK[H_i]$ 的秩是 $K$-维数，可"矩形恒等式"要求 $Y_iJ_i=I_d$ 里那个 $I_d$ 在**同一个环**上有意义，而 $K[H_i]$ 是 $m$ 个不同的环。论文 §5 开头这句话就是这个障碍的自述：

> The enlargement of the group is needed because the different simple or modular summands of the original group algebra need not have the same rank fraction.

阶段一，加群。取独立的 $\langle z\rangle\cong C_M$，$Q_{\rm base}=\langle z\rangle\times G_0$。每个 $i$ 取 $B_i=(C_M)^{H_i}$、$L_i=B_i\rtimes H_i$（regular wreath，$h\cdot b$ 平移指标 $(h\cdot b)(x)=b(h^{-1}x)$）、$\delta_i$ 为常值 1 函数。$\delta_i$ 阶 $M$、被 $H_i$ 固定故在 $L_i$ 中中心、$\langle\delta_i\rangle\cap H_i=1$，于是 $C_i=\langle z\rangle\times H_i$ 同时嵌在 $Q_{\rm base}$ 与 $L_i$ 里（$(z^k,h)$ 在后者映到 $(k\delta_i,h)$）。$G_1$ 是自由积 $Q_{\rm base}*L_1*\cdots*L_m$ 按各对 $C_i$ 粘合的商。所有因子嵌入的证明又是轨道配对（$X$ 取可数个 $Q_{\rm base}$-正则集之并，$X_i$ 取可数个 $L_i$-正则集之并，配 $C_i$-轨道得等变双射，搬运作用）。

在 $R=K[G_1]$ 里造
$$f=\frac1M\sum_{k=0}^{M-1}\zeta^{-k}z^k .$$
直接乘得 $zf=\zeta f$、$f^2=f$；恒等元系数 $M^{-1}\ne0$ 见证 $f\ne0$，不需要任何字问题判决。$S=fR$ 是以 $f$ 为单位元的环，$P_i=fe_i$，而在 $K[G_0]$ 里成立的 $e_ie_j=0$ 乘上 $f$ 后在 $S$ 里仍成立。

阶段二，扇区的块分解。$B_i$ 的特征由指数表 $a_x\in\Z/M$ 给出（$\chi(b_x)=\zeta^{a_x}$）。令 $\mathcal X_i=\{\chi:\chi(z)=\zeta\}$，因为 $z=\delta_i$ 被 $H_i$ 固定，$\mathcal X_i$ 是 $H_i$-不变集，且
$$f=\sum_{\chi\in\mathcal X_i}p_\chi .$$
这条我验算过：$fp_\chi=\frac1M\sum_k\zeta^{-k}\chi(z)^kp_\chi$，几何和在 $\chi(z)=\zeta$ 时给 $p_\chi$、否则给 0（$M$ 个 $M$ 次单位根求和）。

引理 5.2（稳定子）是这一段的枢纽：$\theta\in\mathcal X_i$ 的稳定子 $T_\theta$ 是初等交换 $p$-群，秩 $\le3$，允许平凡。推导：$\theta(z)=\zeta$ 即 $\sum_x a_x=1$（在 $\Z/M$ 里，因为 $\delta_i=\sum_x b_x$）。若 $g\in A_0\cap T_\theta$ 非恒等、阶 $q$，则 $q\mid M$；$g$ 左乘把 $H_i$ 分成长恰为 $q$ 的轮换，$\theta$ 的不变性逼指数 $a_x$ 沿轮换为常数，于是总和落在 $q(\Z/M)$ 里。而它不能等于 1：模 $q$ 约化给 $0=1$（$q\mid M$ 使 $\Z/M\to\Z/q$ 满）。所以 $T_\theta\cap A_0=1$，$T_\theta$ 单射进 $H_i/A_0\cong P$；$(\F_p)^3$ 的子群都是 $\F_p$-线性子空间，故秩 $\le3$、指数 $p$。

"消掉每个稳定子的 $p'$-部正是让它的增广理想幂零，并允许后面的换基"，这句批注交代了为什么要引理 5.2。若稳定子含 $p'$-部，$K[T]$ 不是局部环，投射模未必自由，$d=d_0|T|$ 就断。

固定轨道代表 $\theta$，记 $T=T_\theta$、$s=[H_i:T]$、$D=K[T]$，陪集代表 $r_1,\dots,r_s$。$g\in H_i$ 的左乘记 $L_g$，$b\in B_i$ 的对角作用 $D_b(h)=(h\theta)(b)h$；两者对右 $T$ 线性，且满足半直积关系 $L_gD_bL_g^{-1}=D_{g\cdot b}$（中间那步是 $((g^{-1}h)\theta)(b)=(h\theta)(g\cdot b)$）。于是有代数同态 $\rho_\theta:K[L_i]\to\Mat_s(D)$，且 $z$ 作用为 $\zeta$ 故 $\rho_\theta(f)=I_s$。

块逆公式是显式的：$p_{r_a\theta}\,r_at_0r_b^{-1}$（$t_0\in T$）落在 $fK[L_i]$ 里，在 $\theta$-表示中把 $r_bt'$ 送到 $r_at_0t'$、在其他陪集上为零。理由：左群因子把陪集 $r_cT$ 送到 $r_at_0r_b^{-1}r_cT$，Fourier 投影保留它当且仅当它等于 $r_aT$，即 $c=b$。这就是标准矩阵单位 $E^{\rm std}_{kl}\otimes t_0$ 的原像。把所有轨道合起来：
$$\rho:fK[L_i]\xrightarrow{\;\sim\;}\prod_\theta\Mat_{[H_i:T_\theta]}(K[T_\theta]).$$
满射由各块矩阵单位有原像给出；单射靠维数：$\{p_\chi h:\chi\in\mathcal X_i,h\in H_i\}$ 是源之基，一条大小 $s$ 的轨道贡献 $sw=s^2|T|$ 个基元，恰等于对应靶块的维数。

阶段三，把秩变成整数恒等式。令 $E=\rho_\theta(P_i)\in\Mat_s(D)$。作为 $K[H_i]$ 上的线性算子，$E$ 就是左乘 $e_i$（$f$ 作用为单位），故 $\dim_K\im E=d$。取增广 $\varepsilon:D\to K$，$\mathfrak a=\ker\varepsilon$。引理 5.2 给 $T\cong(C_p)^q$、$0\le q\le3$，生成元 $t_1,\dots,t_q$，$X_j=t_j-1$ 交换且 $X_j^p=0$，$D\cong K[X_1,\dots,X_q]/(X_1^p,\dots,X_q^p)$，于是
$$\mathfrak a^{D_{\max}+1}=0,\qquad D_{\max}=3(p-1),$$
总次数超过 $q(p-1)$ 的单项式必有某指数 $\ge p$；$3(p-1)\ge q(p-1)$ 给出不依赖 $q$ 的一致界。

然后是贪心换基。$\overline E=\varepsilon(E)$ 是幂等的，其像与 $I_s-\overline E$ 的像互补。按列顺序扫 $\overline E$，每列若能增大已张成的空间就留下；再对 $I_s-\overline E$ 同样处理。取 $Q$ 为 $E$ 中对应的 $d_0$ 列加上 $I_s-E$ 中对应的 $s-d_0$ 列，则 $Q_0=\varepsilon(Q)$ 可逆，$N=Q_0^{-1}(Q-Q_0)$ 的 entry 都在 $\mathfrak a$ 里，$N^{D_{\max}+1}=0$，$Q=Q_0(I_s+N)$ 给
$$Q^{-1}=\Bigl(\sum_{k=0}^{D_{\max}}(-N)^k\Bigr)Q_0^{-1}.$$
$E$ 固定前 $d_0$ 列、杀掉其余，故 $\Pi=\diag(I_{d_0},0)$ 满足 $EQ=Q\Pi$、$Q^{-1}EQ=\Pi$。共轭保 $K$-维数，于是得到整数恒等式
$$d=d_0|T|,\qquad w=s|T|,\qquad wd_0=sd .$$
论文在这里加了一句我认为最要紧的辩护："these are equalities of ordinary dimensions, not equalities after reduction to $K$"。$\im E$ 作为 $D$-模是自由的、秩 $d_0$（局部环上投射模自由的构造性实例，"no general projective-module theorem is needed here"）。我本来打算引 Kaplansky 的投射模自由定理，但那样基的选择就不"specified"了；贪心列给出显式基，同时给出可逆矩阵 $Q$。[推测] 两处取舍（不用一般定理、不用存在性）都是为 prescription 服务，并非为数学难度服务。

坐标配对：$wd_0=sd$ 使两个集合等势，
$$\{(\mu,l):\mu\le d,\ l\le s\}\ \leftrightarrow\ \{(\lambda,k):\lambda\le w,\ k\le d_0\}$$
按字典序双射。$V$ 为 $w\times d$ 块矩阵（entry 是 $s\times s$ 的标准矩阵单位和），$W$ 反向，则 $WV=I_d\otimes I_s$、$VW=I_w\otimes\Pi$。令 $J^{(\theta)}=(I_w\otimes Q)V$、$Y^{(\theta)}=W(I_w\otimes Q^{-1})$，得 $Y^{(\theta)}J^{(\theta)}=I_d\otimes I_s$、$J^{(\theta)}Y^{(\theta)}=I_w\otimes E$。最后逐 entry 用 $\rho^{-1}$ 拉回（$\rho$ 把 $f$ 送到单位元组、把 $P_i$ 送到 $E$ 元组），得
$$J_i\in\Mat_{w\times d}(S),\ Y_i\in\Mat_{d\times w}(S),\qquad Y_iJ_i=fI_d,\quad J_iY_i=P_iI_w .$$
所有选择都在有限集上：特征轨道、陪集代表、增广矩阵、坐标配对；取第一个、取最前面的独立列。两个逆（块逆、$Q$-逆）一个是有限群代数公式、一个是有限和。

应用时论文把 $G_0$ 的可数性（因为它有限生成）与 $d$ 的同一性代入，一次性固定 $G_1$、$f$、$J_i,Y_i$，加上 $P_iP_j=0$，正好是下一节的五个输入。

## 10. 三角压缩：我把那串相消重算了一遍

引理 6.1 是纯代数的，它只说：$S$ 是非零幺 $K$-代数，$P_i$ 幂等，$\alpha_i(T),\beta_j(T)\in K$ 给出 $F_{ij}=\sum_T\alpha_i(T)\beta_j(T)$ 满足 $F_{ii}=1$、$F_{ij}P_iP_j=0$（$i<j$），并且有 $J_i,Y_i$ 使 $Y_iJ_i=I_d$、$J_iY_i=P_iI_w$，则显式地存在
$$C_\sharp\in\Mat_{wt\times md}(S),\ D_\sharp\in\Mat_{md\times wt}(S),\qquad D_\sharp C_\sharp=I_{md}.$$

第一层：$(C_0)_{T,j}=\beta_j(T)P_j$（$t\times m$），$(D_0)_{i,T}=\alpha_i(T)P_i$（$m\times t$）。乘积 entry 是 $F_{ij}P_iP_j$，注意每个 $T$-项都是"左 $P_i$、右 $P_j$"，所以求和不打乱幂等因子。于是
$$D_0C_0=\mathcal P+\mathcal N,\qquad \mathcal P=\diag(P_1,\dots,P_m),$$
$\mathcal N$ 严格下三角（$i>j$ 的 entry 任意，$i<j$ 的 entry 为零，对角被 $F_{ii}P_i^2=P_i$ 吃掉）。严格下三角的 $m$ 次幂为零：$\mathcal N^m=0$。

需要的全部交换信息我列出来，因为它少得惊人：每个非对角 entry 以 $P_i$ 开头、以 $P_j$ 结尾，所以幂等性给 $\mathcal P^2=\mathcal P$、$\mathcal P\mathcal N=\mathcal N=\mathcal N\mathcal P$。$P_i$ 之间不假设任何交换。[推测] 这一条正是"为什么必须加 $G_1$ 到扇区里"的镜像：$P_i=fe_i$ 来自不同 $H_i$ 的拷贝在同一个环 $S$ 中的像，它们本来就不交换，任何假设交换的引理都不可用。

第二层是修正矩阵。令
$$\mathcal Q=\mathcal P+\sum_{k=1}^{m-1}(-\mathcal N)^k ,$$
要证 $\mathcal Q(\mathcal P+\mathcal N)=\mathcal P$。我第一次心算在这里翻了符号，重算一遍：
$\mathcal Q\mathcal P=\mathcal P+\sum_{k=1}^{m-1}(-\mathcal N)^k$（用 $\mathcal N\mathcal P=\mathcal N$）；
$\mathcal Q\mathcal N=\mathcal N-\sum_{j=2}^{m}(-\mathcal N)^j$（用 $\mathcal P\mathcal N=\mathcal N$，并把 $(-\mathcal N)^k\mathcal N$ 写成 $-(-\mathcal N)^{k+1}$）。
两式相加，两个和式在 $k=2,\dots,m-1$ 上逐次相消，剩 $\mathcal P+\mathcal N+(-\mathcal N)-(-\mathcal N)^m=\mathcal P$，因为 $\mathcal N^m=0$。"cancellation of consecutive powers" 就是这个交错相消。取 $D_1=\mathcal QD_0$，则 $D_1C_0=\mathcal P$。$m=1$ 时和式为空，同样成立。

第三层：块对角复制 $w$ 份，$C_{\rm rep}$（$w$ 份 $C_0$）、$D_{\rm rep}$（$w$ 份 $D_1$），得 $D_{\rm rep}C_{\rm rep}=\mathcal P_{\rm rep}$。再用扇区矩形拼上 $\mathcal J:S^{md}\to S^{wm}$、$\mathcal Y:S^{wm}\to S^{md}$（由 $J_i,Y_i$ 块对角组装，$\delta_{ij}$ 型），$\mathcal Y\mathcal J=I_{md}$、$\mathcal J\mathcal Y=\mathcal P_{\rm rep}$。令 $C_\sharp=C_{\rm rep}\mathcal J$、$D_\sharp=\mathcal YD_{\rm rep}$，则
$$D_\sharp C_\sharp=\mathcal Y\mathcal P_{\rm rep}\mathcal J=\mathcal Y(\mathcal J\mathcal Y)\mathcal J=I_{md}.$$
全程只用结合律与所列恒等式。

我试过三条捷径，都不通。跳过修正矩阵直接用 $D_0C_0=\mathcal P+\mathcal N$：第三层给出 $\mathcal Y(\mathcal P+\mathcal N)\mathcal J=I+\mathcal Y\mathcal N\mathcal J\ne I$，修正是必需的。转去做 $C_0D_0$：它的 entry 是 $\sum_T\beta_j(T)\alpha_i(T)P_jP_i$，幂等因子的左右顺序**反了**，$\mathcal P$-吸收失效；而且我对 $C_\sharp D_\sharp$ 根本不需要任何断言。要求 $P_i$ 交换：在应用里为假。

应用到 $S=fK[G_1]$：非边处 $F_{ij}=0$（命题 2.2），边 $i<j$ 处 $P_iP_j=0$（推论 3.5），矩形恒等式正是命题 5.1 给的。输出
$$D_\sharp C_\sharp=fI_{md},\qquad C_\sharp:S^{md}\to S^{wt},$$
以及那条维数悖论
$$\frac tm<\frac1{100}<\frac1{96}<\frac dw,\qquad r:=wt<md=:N .$$
1/100 与 1/96 的 4% 缝隙在这里落地。论文还预告了下一句："it gives a nonzero vector that will certify the reverse-product defect"，就是我下面要用的 $u_*$。

`Compression.lean` 的命名和上面一一对应：`nilpotent_lower`、`C₀`/`D₀`、`D₀C₀`、`diag_idempotent`、`corrected`（即 $D_1=\mathcal Q D_0$，`correction` 是那个级数）、`rep`/`rep_mul`、`blockJ`/`blockY`/`blockYJ`/`blockJY`。

## 11. 方阵一侧逆与那枚证书

引理 6.2 处理"一侧逆已经是方阵了，怎么把缺陷暴露出来"。设 $R$ 幺环，$f\ne0$ 中心幂等，$S=fR$，$N>r\ge1$，$C\in\Mat_{r\times N}(S)$、$D\in\Mat_{N\times r}(S)$ 满足 $DC=fI_N$。$\iota:S^r\to S^N$ 前 $r$ 坐标嵌入、$\pi:S^N\to S^r$ 保留它们，entry 是 $f$ 与 0。令
$$A_R=\pi D+(1-f)I_r,\qquad B_R=C\iota+(1-f)I_r .$$
则 $A_RB_R=I_r$，而 $B_RA_R\ne I_r$。更精确地，取 $u_*\in S^N$ 只在**末坐标**为 $f$，$v_*=Cu_*$，则 $v_*\ne0$、$Dv_*=u_*$、$A_Rv_*=0$、$(B_RA_R-I_r)v_*=-v_*\ne0$。

推导四行。所有 $C,D,\iota,\pi$ 的 entry 都在 $S$ 里，被 $1-f$ 双侧零化；$\pi\iota=fI_r$，所以
$$A_RB_R=\pi DC\iota+(1-f)I_r=fI_r+(1-f)I_r=I_r .$$
$u_*\ne0$ 因为它的末坐标就是 $f$。$Dv_*=DCu_*=fu_*=u_*$，这顺带证明 $v_*\ne0$（否则 $u_*=0$）。$N>r$ 使 $\pi u_*=0$，所以 $A_Rv_*=\pi Dv_*+(1-f)v_*=0+0=0$（第二项因 $v_*=Cu_*$ 的 entry 在 $S$ 中）。最后 $B_RA_Rv_*=0$，减去 $v_*$ 得 $(B_RA_R-I_r)v_*=-v_*\ne0$。

末坐标这件事我做错过一次：取第一个坐标基向量，$\pi u_*\ne0$，$A_Rv_*$ 不再为零，证书当场消失。证书必须活在 $\ker\pi$ 里，而 $\ker\pi$ 的成员恰好是坐标号 $>r$ 的那些，第 $N$ 坐标是其中一个。Lean 里这就是 `IndexCut.extra`（同时服务 §5 的坐标配对，两个"多余坐标"复用同一个定义）与 `SquareCertificate.u f a = Pi.single a f`。

另一处细节：$\iota,\pi$ 的 entry 必须是 $f$ ，并非 1。若写成 1，$\pi\iota=I_r$ 而 $A_RB_R$ 里的交叉项 $(1-f)\pi D$、$C\iota(1-f)$ 就不再被零化（entry 不在 $S$ 中了），拼不出 $I_r$。

我还试过用秩或行列式论证缺陷：$K[G_1]$ 是非交换环，没有行列式，$S^{wt}\to S^{md}$ 的抽象秩论证不落地。显式 $u_*$ 的每一步都是等式推导，可以形式化，而且它不依赖字问题：$f\ne0$ 有恒等系数 $M^{-1}$ 作证，$v_*\ne0$ 有方程 $Dv_*=u_*$ 作证。

这里还有一次"补身份"。$(1-f)I_r$ 把扇区外的直和项填成单位阵，让 $A_R,B_R$ 定义在整个 $K[G_1]$ 上。同样的动作在 §6 的标量化里还会再来一次（$1\otimes(1-f')$）。这个手法在特征 2 版里是内联在构造里的（$(1-e)I_m$、$1-f_{\rm blk}$），这一篇把它抽成了独立引理 7.2。

应用 $C=C_\sharp$、$D=D_\sharp$ 就得到 $A_R,B_R\in\Mat_r(K[G_1])$，$A_RB_R=I_r$、$B_RA_R\ne I_r$。

## 12. Heisenberg 标量化：合成阶上的 shift-modulation

最后一步是把矩阵反例变成同一个群代数里的两个标量。命题 7.1：$K$ 任意域，$M\ge2$ 在 $K$ 中可逆，$\zeta$ 阶 $M$，$Z_q=(\Z/M\Z)^q$、$n=M^q$。存在 $Mn^2$ 阶有限群 $\Lambda$ 与非零中心幂等 $f'\in K[\Lambda]$，使 $\Omega_{uv}$（$u,v\in Z_q$）构成 $f'K[\Lambda]$ 的基并满足
$$\Omega_{uv}\Omega_{st}=\delta_{vs}\Omega_{ut},\qquad \sum_u\Omega_{uu}=f',$$
从而 $\Mat_n(K)\cong f'K[\Lambda]$。

群律是 Heisenberg：
$$(x,y,k)(x',y',k')=(x+x',\,y+y',\,k+k'+y\cdot x').$$
结合性来自双线性恒等式 $y\cdot x'+(y+y')\cdot x''=y'\cdot x''+y\cdot(x'+x'')$；逆是 $(-x,-y,-k+y\cdot x)$。论文明写 No primality of $M$ is involved. 我特意停在这里，因为 $M=p^4-1$ 是偶合数，我必须确认每一步都不需要素性。中心元 $z'=(0,0,1)$ 阶恰 $M$；$f'=\frac1M\sum_k\zeta^{-k}(z')^k$，重排给 $z'f'=\zeta f'$，卷积给 $(f')^2=f'$，恒等系数 $M^{-1}$ 见证非零。这和 §5 的 $f$ 是同一个模板。

$X_x=(x,0,0)$、$Y_y=(0,y,0)$，
$$D_v=\frac1n\sum_{y\in Z_q}\zeta^{-y\cdot v}f'Y_y .$$
这里用的是**复合阶正交性**
$$\sum_{y\in Z_q}\zeta^{y\cdot a}=\begin{cases}n,&a=0,\\0,&a\ne0.\end{cases}$$
$a\ne0$ 时取一个非零坐标 $a_j$，用第 $j$ 坐标向量平移整个和，乘上 $\zeta^{a_j}\ne1$；在域里逼出该和为零。论文补了一句关键防御：The argument still works when $a_j$ is a zero divisor modulo the composite integer $M$. 因为 $\zeta$ 阶恰为 $M$，$a_j\not\equiv0\pmod M$ 就够，平移消去全程不做除法。[推测] 我判断这是这一节唯一被认真加固的地方，正因为 $M$ 合成：素数阶版本（特征 2 版的 $\ell$）从不需要面对零因子。

由正交性得 $D_vD_t$ 中 $f'Y_b$ 的系数 $\frac{\zeta^{-b\cdot t}}{n^2}\sum_y\zeta^{y\cdot(t-v)}$，即 $\delta_{vt}$ 型；$\sum_vD_v=f'$。群律给 $Y_yX_a=(z')^{y\cdot a}X_aY_y$，$f'$ 穿过之后 $D_vX_a=X_aD_{v-a}$。令
$$\Omega_{uv}=X_{u-v}D_v=X_{u-v}\frac1n\sum_y\zeta^{-y\cdot v}f'Y_y,$$
则 $\Omega_{uv}\Omega_{st}=X_{u-v+s-t}D_{v-s+t}D_t=\delta_{vs}\Omega_{ut}$。

矩阵单位律本身不排除块里有核，所以要单独证独立性与维数。表示 $\rho(x,y,k)\mathbf e_s=\zeta^{k+y\cdot s}\mathbf e_{s+x}$ 在 $K^{Z_q}$ 上。我把复合标量核对了一遍：$\rho(g)\rho(g')\mathbf e_s$ 的指数是 $k+k'+y\cdot(s+x')+y'\cdot s=k+k'+y\cdot x'+(y+y')\cdot s$，与 $\rho(gg')$ 一致。$\rho(f')=\id$、$\rho(D_v)$ 是第 $v$ 个坐标投影，故 $\rho(\Omega_{uv})\mathbf e_s=\delta_{vs}\mathbf e_u$，$n^2$ 个像线性无关逼 $\Omega_{uv}$ 本身无关。反向：$f'K[\Lambda]$ 由 $n^2$ 个 $f'(x,y,0)$ 张成，因为 $f'(x,y,k)=\zeta^kf'(x,y,0)$，而它们的群基支撑按 $(x,y)$ 互不相交，所以也无关。扇区维数恰 $n^2$，矩阵单位成基。$q=0$ 是合法退化：$n=1$、$\Lambda=C_M$、唯一矩阵单位就是 $f'$。

为什么必须用 Heisenberg 而不能用现成的 $(\Z/M)^2$：交换群代数的 Fourier 基只给正交幂等，没有 shift 与 modulation 的交叉关系，拼不出非对角的 $\delta_{vs}$；中心扩张的 2-上循环 $y\cdot x'$ 正是 $X$ 与 $D$ 的交换子来源。为什么不用特征 2 版的 $(\Z/\ell)^m\rtimes S_m$：那边矩阵单位靠置换共轭、载体维数 $m^2$ 恰好等于行数，而这里我要嵌 $r=wt$ 阶方阵，$r$ 跟任何自然行数都不匹配，只能倍增搜索。

推论 7.3：$A,B\in\Mat_r(K[L])$，$AB=I_r$、$BA\ne I_r$。取最小 $q$ 使 $n=M^q\ge r$（搜索有限，因为 $M^r\ge2^r\ge r$）。补齐 $\widetilde A=\diag(A,I_{n-r})$、$\widetilde B=\diag(B,I_{n-r})$：$\widetilde A\widetilde B=I_n$，$\widetilde B\widetilde A-I_n=\diag(BA-I_r,0)\ne0$，补单位块不伤缺陷。群基分解 $K[L\times\Lambda]=K[L]\otimes_KK[\Lambda]$，令 $\Phi(T)=\sum_{u,v}T_{uv}\otimes\Omega_{uv}$，矩阵单位乘积给可乘性，$\Phi(I_n)=1\otimes f'$；单射性靠把 $\Omega_{uv}$ 的坐标对偶泛函扩到 $K[\Lambda]$ 再在第二个张量因子上作用，$K[L]$ 有零因子也不影响。于是（引理 7.2，$g=1\otimes f'$）
$$a=1\otimes(1-f')+\sum_{u,v}\widetilde A_{uv}\otimes\Omega_{uv},\qquad
  b=1\otimes(1-f')+\sum_{u,v}\widetilde B_{uv}\otimes\Omega_{uv},$$
$ab=1$，反向缺陷是 $\Phi(\widetilde B\widetilde A-I_n)\ne0$。

引理 7.2 是这一篇相对特征 2 版新增的抽象：$\Phi:\mathcal A\to\mathcal B$ 是幺环之间的单射同态，**不要求保单位元**，$g=\Phi(1_{\mathcal A})$，若 $AB=1_{\mathcal A}$、$BA\ne1_{\mathcal A}$，则 $a=1_{\mathcal B}-g+\Phi(A)$、$b=1_{\mathcal B}-g+\Phi(B)$ 满足 $ab=1_{\mathcal B}$、$ba\ne1_{\mathcal B}$。证明三行：$g$ 幂等且在 $\Phi$ 的像上是两侧单位，所以 $1-g$ 双侧零化该像；展开 $ab=1-g+\Phi(AB)=1$，$ba-1=\Phi(BA-1)\ne0$，只有最后一个不等式用到单射，全程不要求 $g$ 全局中心。我把这点确认过，因为推论里 $f'$ 其实中心，抽象成不中心显然多花力气。[推测] 抽出来是因为 §5 引理 6.2 的 $(1-f)I_r$ 与这里的 $1\otimes(1-f')$ 是同一件事的两次实例化，写一次引理省两处验证。

## 13. 收尾，以及我从这步顺手拿到的东西

主定理的装配链按引用顺序读一遍，正好是一条依赖图：引理 2.1 供 $p$ 与 $|K|=p^4$；命题 2.2 与 3.2 供图的拟合与严格正则秩比较；命题 4.2 把局部群嵌进 $G_0$；命题 5.1 把秩安置到非零环 $fK[G_1]$ 并给矩形恒等式；推论 3.5 供所有有序边零积；引理 6.1、6.2 供 $A_R,B_R$ 及非零证书；推论 7.3 取 $L=G_1$、$M=p^4-1$ 给 $G=G_1\times\Lambda$ 与 $a,b$。$G_0$ 由有限群 $H_i$ 生成，$G_1$ 只添 $\langle z\rangle$ 与有限个 $L_i$，$\Lambda$ 有限，所以 $G$ 有限生成；任一嵌入的 $H_i$ 供非平凡挠率（$u(s)$，$s\ne0$，阶 $p$）。

论文在"Finite prescriptions and scope"段给了三条批注，我都当作自检清单。第一条：所有特征、基、域元、有限逆的选择都在显式有限集中；群字的乘积定义群代数和，即使不同字恰好重合，也不需要比较字；核证书与单射矩阵块供反向缺陷；那些可数置换作用不是系数搜索输入。第二条：含挠率不等于每个元素有限阶，而且群必须是无限的，因为有限群代数上左乘的有限维性本身就给出直有限性，模特征也不例外。第三条：更一般地，群代数里任意两个有限和的支撑生成的子群是有限生成的，其群代数按群基嵌入，同时保存一侧乘积与非零反向缺陷；所以对有限生成群的普遍直有限定理就已经蕴含对一切群的断言。这最后一条是特征 2 版没写的，它把"主定理只声明 FG"从省事变成正当。

顺手拿到的推论有两件。$G$ 不是 sofic：Elek–Szabó 说 sofic 群的群代数稳定有限，而我这里稳定有限性失败，标量构造完成后即反证 $G$ 非 sofic。第二件来自 §7 的命题 8.1：$k$ 有限域、$L$ 群、$ab=1$，则 $T_b:k^L\to k^L$ 是单射细胞自动机，$\im T_b=\{y:T_{ba}y=y\}$，而对任何 $(ba-1)_h\ne0$ 的 $h$，指示配置 $\delta_h$ 不在像中。论证与特征 2 版逐句相同（$(T_cT_dx)(g)=\sum_{u,v}c_ud_vx(guv)=T_{cd}x(g)$，$T_aT_b=T_{ab}=\id$ 供单射，像与不动点集双向包含，$\delta_h$ 的缺失用 $(T_{ba}\delta_h-\delta_h)(1_L)=(ba-1)_h$）。这一句让我停下来：The argument excludes preimages of arbitrary support. 排除的是无限支撑的原像，不只是有限支撑。所以 $G$ 同时是 Gottschalk 可 surjunctive 猜想的反例。而且"若 $b$ 的显式公式里同一个群元素出现多次，按同一局部规则把项相加即可，规则的定义不需要字问题谕示"。

## 14. 我与特征 2 版的三处分岔

复盘到这里，我把两篇的真正差别收敛成三条，其余都是这三条的推论。

其一，图的角色。特征 2 版的图同时是零和恒等式的供应器（每条线是一个零和组），所以它需要围长 12、需要 LLL 概率构造、需要 Euler 预算 $1/3+1/2+1/6$；这一篇的图只是粘合骨架，恒等式全部由局部群 $H$ 的代数性质供应，于是三角形自由（围长 4）就够，短字条件只看 3 个方向。这是我能把 threshold-Kneser 这种"只为低秩拟合存在"的图换进来的原因，也是我一开始误以为必须保留围长 12 的原因。

其二，可逆性与零性的分工。特征 2 版用 $\ell$ 奇买群平均幂等元、用 $D=0$ 买正则度消失；这一篇用 $p\nmid M$ 买 $p'$-部对角化、用 $X^p=0$ 买列空间湮灭。同一个半直积结构里，两种资源的用法是颠倒的。

其三，标量化载体。那边 $(\Z/\ell)^m\rtimes S_m$ 靠置换共轭且行数与秩参数巧合地相同；这边 Heisenberg 靠中心扩张的 shift-modulation，$r$ 与 $n$ 不匹配，必须倍增搜索 `leastQ`。这个巧合的丧失逼出了一个新的自由度，也逼出了"合成阶正交性"这条防御。

[推测] 如果问我能不能把两篇统一，我的答案是：它们的第 6 层（配对非退化）在第 5 层的机制下是同一件事的两个实例，即"把不可数的非退化性变成可数的多项式非零点"。第 1 层（域塔）则完全不通用：特征 2 里 $-1=1$，范数论证退化，域塔根本不需要。[推测] 我不认为存在一篇同时涵盖两者的论文，除非有人找到不依赖 $-1$ 平方性的 $p^4$ 型域构造。

## 15. 常数与参数账目

$m=\binom{1200}{600}$：图的顶点数，也是 $p>m$ 里 $p$ 的下界来源。
$p=\min\{h>1:h\mid(m!)^2+1\}$：特征，也是 $-1$ 的平方见证 $(m!)^2$。
$1200,600,200,400$：全集、子集大小、邻接阈值、$\mathcal T$ 上限与 $\beta$ 次数；锁定关系是 $400=600-200$、零点窗 $[200,599]$、容斥余量 $1203>1200$。
$t=\sum_{j=0}^{400}\binom{1200}{j}\le401\binom{1200}{400}$：拟合秩；$(5/7)^{100}$、$2^{33}$、$40100<2^{33}$ 是把 $t/m<1/100$ 化为一个可手验的幂次比较。
$1/100$ 与 $1/96$：两端各自宽松，缝隙在 $wt<md$ 处兑现。
$\ell=(p-1)/2$：湮灭指数，被 $p-\ell\ge\ell$ 与 $h$ 单调双向夹住。
$D=3(p-1)$：单项式最大总次数；同一数值在 §5 作 $D_{\max}$ 幂零指数。
$h=\binom{\ell+2}{3}=\frac{(p-1)(p+1)(p+3)}{48}$：高次切片数，$h/p^3>1/48$（分子减 $p^3$ 为 $3p^2-p-3>0$）。
$P=(\F_p)^3$：三维同时满足短字 $k\le3$（Vandermonde）与 $\mathfrak a$ 幂零界 $3(p-1)$。
$M=p^4-1=|K^*|$：$\zeta$ 的阶，合成、偶、与 $p$ 互素。
$w=M^{p^3}p^3$：$|H|$，秩分数分母。
$d=hp^3|\mathscr R|$，$|\mathscr R|>|A_0|/(2p^3)$：正则秩与密度。
$D_{\max}=3(p-1)$：$Q^{-1}$ 级数长度。
$n=M^q$、$q=\min\{q:M^q\ge r\}$：Heisenberg 载体与倍增搜索。
$\Lambda$ 阶 $Mn^2$、$f'$、$\Omega_{uv}$：$\Mat_n(K)$ 的群代数实现。
$q=0$：$n=1$、$\Lambda=C_M$，公式仍成立（$r=1$ 的退化情形）。

## 16. 我留下的怀疑清单

这份清单是给我自己下一轮用的，凡标 [推测] 的都还没有被文本证据支持。

1. 短字三档与 $P$ 三维的关系我论证了单向（Euler 要三档，Vandermonde 要三维），但**反向**（若允许更长短字，能否用更高维 $P$ 换更大 $h/p^{3}$）我没算。[推测] 高维会让 $h/p^{\dim}\to1/(3!\cdot2^3)$ 之类继续变小，收益为负，但这需要写出来才算数。
2. $\ell=(p-1)/2$ 我当作两侧夹逼的唯一解，但论文没有讨论 $\ell$ 与 $h$ 的 trade-off 曲线。[推测] 取 $\ell$ 稍小并相应改 $D$ 的定义，可能给出另一族反例，秩分数变差、但幂零阶数变松。
3. $p\equiv1\pmod4$ 是必要条件还是我的过度解读？我只验证了范数论证依赖 $-1$ 是平方。[推测] 若 $p\equiv3\pmod4$，可能存在别的 $p^4$ 型域构造（例如直接用四次扩张且其本原元阶恰 $p^4-1$），那么"指定 $(m!)^2+1$ 的最小因子"只是为了同时拿到素性、$p>m$ 与 $-1$ 平方的省事办法。这条我判定为最值得复查的怀疑。
4. 有序零积的不可对称性我给了机制解释（出射湮灭只认 $V$），但没有排除"另造一个对 $U,V$ 都双侧湮灭的幂等元"。[推测] 那会牺牲 $U\cap V=1$ 或牺牲 $\mathcal N$ 的三角性，二者必失其一；我没有证明。
5. 与 sofic 的关系是引用 Elek–Szabó 的反向推理，本身没有构造性内容。真正的新颖处是 surjunctive 部分，而那里唯一的风险是我把"排除任意支撑的原像"当成了定理，并非修辞，我核对了 $(T_{ba}\delta_h-\delta_h)(1_L)$ 那一步，成立。
6. Lean 与论文的平行复制（`Diagrams.lean`、`Fourier.lean`、`Amalgam.lean` 的 `MultipleHNN` 冗余）说明形式化是在特征 2 版代码库上 fork 的。[推测] 因此 Lean 里的"绕路"有一部分是复用代价，不一定对应论文作者的思考卡点，用 Lean 反推思维链时这一部分要打折扣。

## 17. 补深一：Schwartz 网格界的全归纳与两条 1/4 碎片

### (a) tex 逐字引用

`sections/03-modular.tex:125-136`，引理 3.3 证明的第二块。论文先引用 Schwartz 与 Zippel：

> We use the polynomial grid estimate of Schwartz [Lemma 1 and Corollary 1]. ... A nonzero polynomial of total degree at most $a$ vanishes on at most an $a/M$ fraction of a product grid whose coordinate sets each have size $M$. To prove this, induct on the number of variables. If the degree in the last variable is $b$, its leading coefficient has degree at most $a-b$. It vanishes at at most an $(a-b)/M$ fraction of the earlier choices. For each remaining choice, the last-variable polynomial has at most $b$ roots, contributing at most $b/M$. The sum proves the bound; the constant case starts the induction.

应用段在 `03-modular.tex:137-146`：

> Applying the estimate on $(K^*)^{p^3}$ ... the singular-pairing fraction is at most $h/M$. Both excluded fractions are strictly smaller than $1/4$: ... The estimates use $p>600$; for example, $p^4-1-4p^3=p^3(p-4)-1>0$.

### (b) 中间步骤补全

论文把归纳压成四句，我逐步摊开。设 $P\in K[X_1,\dots,X_n]$ 非零、总次数 $\le a$，网格 $S=S_1\times\cdots\times S_n$，每个 $|S_i|=M$。

第一步，首项系数非零。按末变量写成 $P=\sum_{i=0}^{b}c_i(X_1,\dots,X_{n-1})X_n^i$，$b$ 是 $P$ 对 $X_n$ 的真实次数。$c_b$ 非零，否则 $P$ 按这个分解就是零多项式。这一步看着废话，但后面所有计数都挂在它身上。

第二步，次数账。$c_b$ 的每个单项式乘上 $X_n^b$ 仍落在 $P$ 的单项式里，所以 $\deg c_b+b\le a$，即 $\deg c_b\le a-b$。论文只写 "has degree at most $a-b$"，这个不等式是总次数对末变量分层的直接推论，[我漏看] 我第一遍读时把 $\deg c_b\le a$ 当成了默认，那样碎片会变成 $a/M+b/M$，加出 $2a/M$ 就没法闭合。

第三步，分层。把坏点集分成 $E_1=\{c_b=0\}$ 与 $E_2=\{c_b\ne0\ \text{且}\ P=0\}$。按归纳假设 $E_1$ 在前 $n-1$ 个坐标上的占比 $\le(a-b)/M$。$E_2$ 里固定前 $n-1$ 坐标后，$P$ 是次数恰为 $b$ 的一元非零多项式，根数 $\le b$；占比 $\le(1-(a-b)/M)\cdot b/M$。

第四步，求和。$\frac{a-b}{M}+(1-\frac{a-b}{M})\frac bM=\frac aM-\frac{(a-b)b}{M^2}\le\frac aM$。[我算错] 我起初照论文"the sum proves the bound"直接写 $(a-b)/M+b/M=a/M$，恰好等于界让我不安：两个事件重叠时严格相加会重复计数，真正的账是上面这个带负项的式子。论文那句其实是用重叠换简洁，方向对我有利（界偏松），但推演时必须按 $E_2$ 只在 $c_b\ne0$ 的层上取根数，否则第三、四步在逻辑上脱节。

第五步，起点。$n=1$ 时一元多项式根数 $\le a$，占比 $a/M$；$a=0$ 时非零常数在网格上不消失，占比 $0$。论文写 "the constant case starts the induction"，[我漏看] 我起初以为只指 $n=1$，其实 $a=0$ 这条更要紧：界在 $a=0$ 给出 $0$ ，并非 $1/M$，归纳链每层都吃这个空集起点；若起点写成 $\le1$，整条界退化为占比 1，无信息。

回到应用处，参数对应：$P=Q(\tau)$（`03-modular.tex:116-119` 的 Cauchy--Binet 展开），$a=h$，变量数 $n=p^3$，网格 $(K^*)^{p^3}$ 每边大小 $M$。$Q$ 非零与总次数恰 $h$ 在 `03-modular.tex:120-123` 论证：$B$ 列满秩给某个 $\det(B_J)\ne0$，特征 $p\ne2$ 下 $\det(B_J)^2\ne0$（这一处若回到特征 2 版就得换 Newton 插值，平方项在 $\F_{2^k}$ 里虽仍非零但可平方映射的双射性要单独记账，两篇分工在这里又一次分岔），不同 $J$ 给不同单项式。界要有信息需要 $h<M$，而 $h\le p^3<M$（下一条），所以 $h/M<1$ 成立。

### (c) 每个常数与指数的机械理由

- 网格为什么必须是 $K^*$（大小 $M=p^4-1$），并非 $K$（大小 $p^4$）。$\tau_x$ 是 $D_\lambda^{-1}$ 的对角元，对角矩阵可逆逼每个对角元非零；取 0 的点根本不是任何合法 $D_\lambda^{-1}$ 的对角线。我把 $\lambda\mapsto(\chi_x(c))_{x\in P}$ 当成样本空间到网格的双射来用：$\zeta$ 阶恰 $M$（`02-finite-data.tex:29-36` 的构造）保证指数表 $a_x\in\Z/M$ 与 $\zeta^{a_x}\in K^*$ 一一对应。于是"按网格点计的坏占比"恰等于"按特征计的坏占比"，这是占比可比、两事件可合并的全部依据。
- $h\le p^3$。§4 的换元计数里 $h$ 是 $\{0,\dots,p-1\}^3$ 中满足 $a_1+a_2+a_3\le\ell-1$ 的三元组数（`03-modular.tex:52-55`），单射进整个方盒，所以 $h\le p^3$，论文 `03-modular.tex:141` 写 $h/M\le p^3/(p^4-1)$ 用的就是这条。我第一次复核时去找更强的 $h$ 上界，其实这里只需要最弱那条。
- 两条 $1/4$。碎片和必须是 $1/2$，因为引理 3.3 的结论逐字是 "More than half"（`03-modular.tex:100-101`），这个切分完全由结论形状定死，[推测] 不存在 0.3 加 0.2 这种分配，因为两条碎片各自的原证法（一个是 Schwartz 界加 $h\le p^3$，一个是并集界加 $M$ 的幂）都没有可调的自由参数。第一条：$p^4-1-4p^3=p^3(p-4)-1>0$ 要 $p>4$，论文 `03-modular.tex:144-145` 明说 "The estimates use $p>600$"，裕量三个数量级。第二条：指数不等式 $p^2(p-1)\ge1$ 在 $p\ge2$ 就成立（$p^3-p^2\ge1$），$(p^3-1)/M<1/4$ 化为 $p^4-4p^3+3>0$，同样只要 $p\ge5$。
- 两个事件能相加。固定稳定子事件（`03-modular.tex:104-110`）与奇异配对事件（Schwartz  applied 于 $Q$）都是特征集的子集，并集界直接相加；关键在于两边共享同一个样本空间，而把网格坏点翻译回特征靠的正是上面那条双射。

### (d) 候选失败路线

- [推测] 把网格换成 $K$ 并试图吃满 $a/p^4$：占比的分母必须等于特征总数 $M^{p^3}$ 才和结论对话；混入 $\tau_x=0$ 层之后"坏特征比例"的语义变了，两碎片没法相加。
- [推测] 概率方法：对 $\det N_\lambda$ 做二阶矩或 Paley--Zygmund 型反推。有限域上没有序没有绝对值，矩推不出非零率；而且 $Q$ 的展开式（Cauchy--Binet）里各项 $\det(B_J)^2\prod\tau_x$ 的矩在 $K^*$ 上恰好互相干涉，一阶矩直接是坏点数减去好点数，界太松到无用。
- [推测] 几何化：想用 $V(Q)$ 的簇的维数改写上界。$Q$ 的多项式信息只有总次数一条，奇异点、约化性都得重新证；即使做了，最后还是要用 Schwartz 或等价的一元根数论证收尾，等于换了更贵的同一条路。

我的初始动机是"把奇异配对数直接算出来"，死在两处：$\det\ne0$ 的集合没法从展开式直接数（各项相交），以及 $B^{\mathsf T}B$ 本身完全可能奇异。转折是 `03-modular.tex:112-114` 那句对角元独立遍历 $K^*$，把不可数的可逆性转成网格零点比例之后，剩下的就只是把 Schwartz 的四句话归纳补回五步，而第五步的 $a=0$ 起点是我第二遍读才注意到的。与最初设想相比，最终的界 $h/M$ 比我预期的"大约 $h/p^4$"只差一个 $(1-1/M)$ 因子，这个差别恰好说明取 $K^*$ 是最优选择。

## 18. 补深二：稳定子引理 5.2 与幂零换基的全链条

### (a) tex 逐字引用

`sections/04a-sector.tex:137-159`，引理 5.2 全文：

> Write $\theta(b_x)=\zeta^{a_x}$. Since $z=\sum_{x\in H_i}b_x$, the condition on $\theta$ is $\sum a_x=1$ in $\Z/M\Z$. Suppose that a nonidentity $g\in A_0\cap T_\theta$ has order $q$. The exponent of $A_0$ divides $M$, so $q>1$ divides $M$. Left multiplication by $g$ partitions $H_i$ into cycles of length exactly $q$. Invariance of $\theta$ says that the exponents $a_x$ are constant on these cycles. Their sum consequently lies in $q(\Z/M\Z)$. It cannot equal $1$: reduction modulo $q$ would give $0=1$. This contradiction proves $T_\theta\cap A_0=1$. The quotient homomorphism $H_i\to H_i/A_0\cong P$ is therefore injective on $T_\theta$. Every subgroup of the additive group $(\F_p)^3$ is an $\F_p$-linear subspace, giving the assertion.

批注在 `04a-sector.tex:161-162`："Eliminating the prime-to-$p$ part of each stabilizer is what makes its augmentation ideal nilpotent, and will permit the later change of basis." 幂零与换基的正文在 `04a-sector.tex:237-283`。

### (b) 中间步骤补全

引理本身七步，论文每步一句，我把每步的凭据补出来。

第一步，指数条件的展开。$\theta(z)=\zeta$ 是 $\mathcal X_i$ 的定义（`04a-sector.tex:128`）。$B_i$ 加法记法下常值 1 函数 $\delta_i=\sum_x b_x$，而 $z$ 在 $L_i$ 里的像就是 $\delta_i$（`04a-sector.tex:66-70`），所以 $\theta(z)=\prod_x\theta(b_x)=\zeta^{\sum a_x}$；$\zeta$ 阶恰 $M$ 给出 $\sum a_x\equiv1\pmod M$。这里"恰 $M$"是必需的：若 $\zeta$ 阶真小于 $M$，指数条件会含混在模子群裡，后面的模 $q$ 约化拿不到干净的 $0=1$。

第二步，$q\mid M$。$A_0=(\Z/M\Z)^P$ 的指数整除 $M$，任何元素的阶整除指数，Lagrange 即可，不需要 $M$ 素。$q=1$ 被 $g\ne1$ 排除。

第三步，轨道长恰 $q$。$\langle g\rangle$ 左乘作用在集合 $H_i$ 上，点 $x$ 的稳定子是 $\{g^k:g^kx=x\}=\{g^k:g^k=1\}$，阶为 $q$ 的循环群在该作用上的稳定子平凡到 $q$ 的整除关系，轨道长 $=[\langle g\rangle:\mathrm{stab}]=q$。注意作用是在群本身上左乘，纯集合论，不涉及表示。

第四步，不变性传指数。$g\in T_\theta$ 意思是 $g\theta=\theta$，即对每个 $b$ 有 $(g\theta)(b)=\theta(b)$；按 `04a-sector.tex:121-124` 的作用定义 $(h\chi)(b)=\chi(h^{-1}\cdot b)$，取 $b=b_x$ 得 $a_{g^{-1}x}=a_x$，沿轨道恒定。

第五步，和落进 $q(\Z/M\Z)$。$\sum_x a_x=\sum_{\text{轨道}}q\cdot a_{\text{代表}}$，逐项带因子 $q$。这一步是我重读才看清的：关键在 $q$ 是作为**整数乘子**进入 $\Z/M$ 的，轨道数有限所以求和合法。

第六步，模 $q$ 约化。$q\mid M$ 给满同态 $\Z/M\Z\twoheadrightarrow\Z/q\Z$；$q(\Z/M)$ 的像全为 $0$，而 $1$ 的像是 $1\ne0$（$q>1$）。$1\in q(\Z/M)$ 因此矛盾。[我漏看] 我第一遍以为这一步要用 $q$ 与 $M/q$ 互素之类的条件，其实不用：满射性只要 $q\mid M$，非零性只要 $q>1$，两条都已在手。

第七步，落回 $P$。$T_\theta\cap A_0=1$ 加上正合列 $1\to A_0\to H_i\to P\to1$，交核平凡即单射。$(\F_p)^3$ 的加法子群 $S$：对 $t\in S$，$\{kt:k=0,\dots,p-1\}\subset S$（循环子群），所以 $S$ 对 $\F_p$ 标量封闭，是线性子空间，秩 $\le3$、指数 $p$。$T$ 允许平凡（$q=0$）在 `04a-sector.tex:139` 明写 "with the trivial subgroup allowed"。

往下接幂零换基（`04a-sector.tex:237-283`），补四个中间环节：

环节一，$\mathfrak a$ 幂零可以不经过多项式模型直接看：$T\cong(C_p)^q$，取生成元 $t_j$，$X_j=t_j-1$，$X_j^p=(t_j-1)^p=t_j^p-1=0$（特征 $p$ 的二项塌缩）。$\mathfrak a$ 由 $X_j$ 生成，其 $q(p-1)+1$ 次幂的每个生成单项式含某个 $X_j$ 至少 $p$ 次（抽屉原理：总次数 $>q(p-1)$ 而只有 $q$ 个生成元），故为零。论文 `04a-sector.tex:243-251` 走了同构 $D\cong K[X_1,\dots,X_q]/(X_1^p,\dots,X_q^p)$ 的路：映射把 $t_j\mapsto1+X_j$ 展开，两边 $K$-维数都是 $p^q$，生成元像满，计数逼同构。两条路都成立，[推测] 论文选同构路是为了和 §4 的平移基断言共用同一个证明形状。一致界 $D_{\max}=3(p-1)\ge q(p-1)$ 对所有 $\theta$ 统一，这一条是后面级数长度能写成固定整数的原因。

环节二，矩阵幂零。$M_1,\dots,M_{D_{\max}+1}$ 的 entry 全在 $\mathfrak a$，则乘积的每个 entry 是 $D_{\max}+1$ 个 $\mathfrak a$ 元素乘积之和，落在 $\mathfrak a^{D_{\max}+1}=0$。`04a-sector.tex:252-255` 用一整句特意交代这件事，因为它把"环幂零"升级到"矩阵环幂零"，中间没有任何半单性假设。

环节三，贪心换基的逐列验证。$\overline E=\varepsilon(E)$ 幂等（$\varepsilon$ 是环同态），故 $\im\overline E\oplus\im(I-\overline E)=K^s$，两半径分 $d_0$ 与 $s-d_0$。按列序扫 $\overline E$ 留独立增量的列（恰 $d_0$ 列张满 $\im\overline E$），再扫 $I-\overline E$ 留 $s-d_0$ 列。$Q$ 取 $E$ 的对应列接上 $I-E$ 的对应列：$\varepsilon(Q)=Q_0$ 的列按构造线性无关，可逆。逐列乘 $E$：前段 $E\cdot(E\text{列})=(E^2\text{列})=E\text{列}$（被固定），后段 $E\cdot((I-E)\text{列})=(E-E^2)\text{列}=0$（被杀掉），所以 $EQ=Q\Pi$。$Q^{-1}$ 是几何级数 $\bigl(\sum_{k=0}^{D_{\max}}(-N)^k\bigr)Q_0^{-1}$，合法性全在环节一、二：$N=Q_0^{-1}(Q-Q_0)$ 的 entry 在 $\mathfrak a$（$Q-Q_0$ 的每列是 $E-\overline E$ 或 $(I-E)-(I-\overline E)$ 的列，$\varepsilon$ 归零），左乘 $Q_0^{-1}$（$K$-矩阵）不改变"entry 在 $\mathfrak a$"。

环节四，整数等式。$Q$ 可逆给 $\dim_K\im E=\dim_K\im\Pi$。$\im E$ 作为 $D$-模由前 $d_0$ 个标准基向量生成且自由（这就是 $\im\Pi\cong D^{d_0}$），$K$-维数 $d_0|T|$；而 $\dim_K\im E=d$ 是 `04a-sector.tex:223-229` 从正则秩接过来的。$w=s|T|=|H_i|$ 是陪集计数。消去 $|T|$ 得 $wd_0=sd$，坐标配对集合 $\{(\mu,l):\mu\le d,l\le s\}$ 与 $\{(\lambda,k):\lambda\le w,k\le d_0\}$ 因此等势（`04a-sector.tex:285-292`）。

[推测] 还有一个论文没写的巧合值得记：把上面七步反过来读，恰好证明"被某个非平凡 $g\in A_0$ 固定的 $\theta\in\mathcal X_i$"是空集，不是占比小。第六步只用 $q\mid M$ 与 $q>1$，全程无计数估计。引理 5.2 的强度其实超过它的用途：扇区里根本不存在带 $A_0$-稳定子的特征，而论文只在"稳定子是 $p$-群"这个弱得多的形式上消费它。

### (c) 每个假设与常数的机械理由

- 秩 $\le3$ 完全继承 $P=(\F_p)^3$ 的维数，喂给 $D_{\max}=3(p-1)$。把 $P$ 升到 4 维，$D_{\max}$ 同步升到 $4(p-1)$，级数变长但不断；断的是 §8 那边（三维是短字与秩分数的唯一交点，笔记 §3 已算过）。
- $q\mid M$ 与 $p\nmid M$ 是同一枚硬币：$M=p^4-1$ 与 $p$ 互素保证 $q$ 是 $p'$-数，模 $q$ 约化才有 $0\ne1$；若基群含 $p$-部，稳定子交核可能非平凡，$K[T]$ 不再是局部环，$\mathfrak a$ 不幂零（$p'$-循环群的增广理想是直和因子，$\mathfrak a^2=\mathfrak a\ne0$），环节三的几何级数变成无限和，specified 性当场失效。
- 平凡稳定子情形 $q=0$ 不能删：$D=K$、$\mathfrak a=0$、$N=0$、级数只剩 $k=0$ 项，公式全部原样成立（`04a-sector.tex:251-252` 明写 "This also covers $q=0$"）。自由轨道在 $\mathcal X_i$ 里是多数派，删掉它整个扇区分解就缺块。
- "equalities of ordinary dimensions, not equalities after reduction to $K$"（`04a-sector.tex:282-283`）：$d=d_0|T|$ 里 $|T|$ 是真实的群阶乘子，不是模约化后的假象。$wd_0=sd$ 之后所有维数都是整数，Lean 全程用整数不等式（如 `w < 96*d`）的源头就在这。

### (d) 候选失败路线

- [推测] 只取平凡稳定子轨道建扇区：自由轨道确实覆盖绝大多数 $\theta$，但 $\rho$ 的满射靠**所有**轨道的矩阵单位原像（`04a-sector.tex:208-219` 的维数相等论证按轨道求和），丢轨道则 $\rho$ 降为不满，$J_i,Y_i$ 的矩形恒等式在缺失块上无定义。
- [推测] 引用 Kaplansky 投射模自由定理（`04a-sector.tex:233-235` 引了它并声明不用）：定理给存在基不给具体基，$Q$ 不 specified，$Q^{-1}$ 的级数无法写成有限和 prescription 的输入；而且定理要求局部环，先要证 $D$ 局部，绕回引理 5.2，等于白绕。
- [推测] 把增广直接作用在 $E$ 上、只在 $K$-层面拼 $J_i,Y_i$：$J_iY_i=P_iI_w$ 的右端是 $D$-矩阵 $E$ 的像，$K$-层面的投影 $\Pi$ 拉回不唯一，非对角 $\mathfrak a$-项丢失，缺陷侦测（引理 6.2 要 $D_\sharp C_\sharp=fI_{md}$ 的**精确**等式）断在 $R=\mathcal O(\mathfrak a)$ 的误差项上。

我的初始动机是把每条引理都变成"存在性+计数"，在引理 5.2 处第一次撞墙：这里没有任何计数，$T_\theta\cap A_0=1$ 是纯代数恒等式推出来的空集断言。关键转折是注意到 $z=\sum b_x$ 把"特征取值为 $\zeta$"翻译成了"指数和等于 1"，一个全局线性约束，它和"沿轨道恒定"的相互作用直接锁死稳定子。最终思路与最初设想的差别：我以为自己在读一条 Clifford 论的引理，其实它只是一次模运算，Clifford 的部分全在轨道-陪集计数那边。

## 19. 补深三：Euler 亏损恒等式的完整配平

### (a) tex 逐字引用

`sections/04-gluing.tex:311-342`，引理 4.1 证明的第 5 步。三段原文：

> Consider a vertex that is not the base of a loop. Reading the adjacent face types around it gives a closed walk in $\Delta$. Each incident edge crosses between its two different endpoint types, and successive edge labels are distinct by the smoothing reduction. Thus the walk has no immediate reversal. ... A simple triangle-free graph has no such closed walk of length less than four, so this vertex has degree at least four. (311-318)

> An ordinary face not incident to a loop has a nonempty boundary walk. ... Its consecutive labels are distinct, and the short-word condition therefore forces its length to be at least four. Here and below a loop counts twice toward its vertex degree, and boundary lengths count dart occurrences. (320-326)

> For our connected spherical map, Euler's formula and the two degree sums give $\sum_v(4-\deg v)+\sum_F(4-|\partial F|)=8$. Without a loop, only the exceptional face can contribute positively, and its nonempty walk contributes at most $3$. With a loop, its base vertex contributes at most $2$, the exceptional monogon contributes $3$, and the face on the other side of the loop contributes at most $2$ ... The total is at most $2+3+2=7$, again contradicting (7). (328-341)

### (b) 中间步骤补全

恒等式本身论文一句话带过，我把账算完。设地图有 $V$ 个顶点、$e$ 条边（无中性边：第 3 步的收缩与移除已把它们清光，这一步是后面"单边面的唯一字母非恒等"能成立的前提）、$F$ 个面。两条握手：每条边的两个端点各计一次度、圈在基点计两次，所以 $\sum_v\deg v=2e$；每条边的两个 dart 各属于恰一个面边界，所以 $\sum_F\lvert\partial F\rvert=2e$。于是对任意权重 $k$：
$$\sum_v(k-\deg v)+\sum_F(k-\lvert\partial F\rvert)=k(V+F)-4e.$$
代入 $V-e+F=2$ 得 $k(2+e)-4e=2k+(k-4)e$。**只有 $k=4$ 时 $e$ 项系数为零**，右端是不依赖地图大小的常数 $8=2k$。这就是那个 4 的全部来历：它不是组合下界的美学选择，是唯一能让边数配平的权重，而亏损预算 $8$ 是球面 Euler 示性数 $2$ 乘上配平权重 $4$。[我算错] 我第一遍把左端的 4 读成"由面长下界 4 任意选定"，反过来问为什么不能取 5：取 5 右端是 $10-e$，极小地图可以细分到 $e$ 任意大，下界矛盾就不存在了。论文 `04-gluing.tex:98-99` 那句 "will make every vertex degree and every ordinary face length at least four away from a possible loop" 里的 "at least four" 与配平常数是同一个 4，一石二鸟，这个耦合我读了三遍才看见。

顶点度 $\ge4$ 的逐步检查。取非圈基点 $v$，绕 $v$ 读一圈相邻面的类型，得到 $\Delta$ 中的闭行走（长 $\deg v$）。排除三种短行走：长 1 要求 $\Delta$ 有圈边，simple 排除（`04-gluing.tex:15` 的假设 "finite simple"）；长 2 是沿同一条边走过去再回来，即立即回折，被 "no immediate reversal" 排除，而回折之所以发生当且仅当连续两个 dart 共享同一条 $\Delta$-边，正是第 4 步平滑排除的"连续同标签非圈 dart"；长 3 若三标签互异给出 $\Delta$ 的三角形，三角形自由排除，若有重复标签就退化回长 2 情形。"每条入射边跨到不同类型"来自第 3 步末的两侧类型不同结论（删边并面用恒等式 $DE=s^{-1}(sD)s(s^{-1}E)$ 那一步），这里三个结论（simple、三角形自由、平滑无回折）一个都不能少。

面长 $\ge4$ 的逐步检查。普通面且不接圈：边界是 dart 循环且非空（连通带边的图中空行走只在孤立顶点出现，`04-gluing.tex:321-323` 专门交代了这句），连续标签循环互异（第 4 步结论含首尾 dart 对，`04-gluing.tex:307-309`）。长度 1、2、3 的边界求值按短字条件必须 $\ne1$：$k=1$ 档不需要互异条件（`04-gluing.tex:27-28` 明写 for $k=1$ the distinctness condition is omitted，正好覆盖独边面的情况），$k=2,3$ 档的"循环相邻互异"恰由边界的循环性满足。而普通面求值定义为 $=1$，矛盾，故长 $\ge4$。

两案整数账。无圈案：所有顶点项 $\le0$（度 $\ge4$）、所有普通面项 $\le0$（长 $\ge4$）、例外面是非空行走长 $\ge1$，项 $=4-\text{长}\le3$。总亏损上界 $3$，与恒等式 $8$ 矛盾。有圈案：第 3 步已证至多一个圈且圈住的例外面是 monogon。三项正贡献：圈基点度 $\ge2$（圈计两次）给项 $\le4-2=2$；例外 monogon 长 1 给项 $=3$；圈另一侧面是普通面且长不能为 1（中性边已清光，唯一字母是某 $\gamma$-dart，值非恒等，与普通矛盾），故长 $\ge2$，项 $\le2$。其余项全 $\le0$。总上界 $2+3+2=7<8$，再矛盾。

两案裕量天差地别：$3$ 对 $8$ 松得离谱，$7$ 对 $8$ 只差 1。那个 1 就是全部危险所在：若短字降为 $k\le2$，长 3 的普通面合法，每面贡献 $4-3=1$；这种面在极小地图里可以出现多个吗？恒等式端无法阻止（预算 8 允许八个 1 值面），矛盾当场失效。反过来说，7<8 这 1 的余量恰好被第三档短字买断，[推测] 这是全篇各处常数里最紧的一枚，比 $1/100$ 与 $1/96$ 的 4% 缝隙紧得多。

拓扑前提也要记账：地图画在**球面**上。归约序列的画法是矩形加左右两条中性边再加外表面，拓扑上就是球。若换成射影平面（$\chi=1$），配平右端变成 $2k+(k-4)e$ 代入 $\chi=1$ 的 $4$，无圈案 $3<4$ 仍矛盾，但有圈案 $7<4$ 为假，论证只剩一半。[我漏看] 我起初以为曲面选择无所谓，其实"环案需要球面"这一点让 `04-gluing.tex:65-93` 那段画法的具体性有了硬理由：外表面只贴一张、不贴模。

### (c) 每档与每个常数的机械理由

- 三档短字逐档对应禁一种面长：$k=1$ 禁 monogon（普通面），$k=2$ 禁 digon，$k=3$ 禁三角形。少一档就多一类 1 值亏损面，预算被吃穿。三档也不是无限供给：命题 4.2 的验证侧（`04-gluing.tex:385-393`）靠 $(\F_p)^3$ 里 Vandermonde 参数化最多给 3 个相异方向线性无关，4 个向量在三维里必相关，$k=4$ 想认证也认证不出来。**需求端要三档、供给端只能给三档**，$P$ 的维数 3 在这两头各卡一次，这与 §3 记的"两组约束唯一交点"是同一个事实的两种投影。
- 三角形自由只喂顶点度下界（禁 3 步闭行走），simple 喂 1 与 2 步闭行走；图的这两个性质与短字条件在恒等式两端各管一侧：顶点项 vs 面项。§8 末尾"两个预算分开记"在这里得到算式化的确认。
- 圈的"计两次"约定（`04-gluing.tex:325-326`）并非出于习惯，其义务来自握手引理：圈的两个 dart 都在基点。约定一换，$2$ 与 $7$ 两数全变，恒等式左右失配。
- 例外面恒为 1 个是定义性的（exceptional 的定义 `04-gluing.tex:74-77`），"至多一个圈"与"圈必围例外面"是第 3 步的结论（`04-gluing.tex:163-176`），有圈案的三项上界各自引用其中一条，缺任何一条都有一项失去控制。

### (d) 候选失败路线

- [推测] 把权重配平改成双权重 $(\alpha,\beta)$（顶点 $\alpha$、面 $\beta$）：$\alpha V+\beta F-2(\alpha+\beta)e$ 在 $\alpha\ne\beta$ 时残留 $(\beta-\alpha)V$ 与 $(\alpha+\beta-2\max)\cdot e$ 类的未定项，消不掉；只有 $\alpha=\beta=4$ 的解，上一节的推导在双权重下重做一遍即见唯一性。
- [推测] 弱化为围长 5 或 6 的图（放弃三角形自由换更强图）：$k=3$ 的闭行走被禁了，但立即回折的长 2 仍依赖平滑步骤与 simple，三角形自由在论证里只出现在排除长 3 一处，围长 $\ge4$（即 simple+triangle-free）恰是最低需求，围长再高纯属浪费顶点数。[外部推断] 这与线图（line graph）视角下"三角形自由 ⟺ 线图无 3-圈"的标准事实一致，论文没提线图，我也没必要引这个外部机器。
- [推测] 用角度曲率（每条 dart 分 $2\pi/\deg$）替代计数亏损：那要求对每个 $v$ 已知 $\deg\ge4$ 且对例外面单独放 3 单位的"虚角"，等于把恒等式换成 Gauss-Bonnet，最后仍然要证同一张不等式表，且射影平面案会真的出现（平坦度量在 $\chi=1$ 面可存在），球面性反而更难维持。失败原因：曲率法允许零亏损配置（每个顶点恰 4、每面恰 4 的平铺无限族），而计数法靠例外面的奇偶性一刀封死。

这一节的初始动机是"把 8 算出来就完事"，死路是把 4 当作随手选的下界；转折是发现 $2k+(k-4)e$ 里 $k=4$ 的唯一性，于是 4、8、三档、三角形自由四件事其实是一个方程的四个根。最终思路与最初设想的差别：我以为 Euler 步是六个手术步骤里最"初等收尾"的一环，配平账做完才知道它是全篇约束耦合最密的一环，§16 怀疑清单第 1 条（高维 $P$ 的可行性）的答案也在这里：高维把供给端的 3 档抬高，但需求端的 $k$ 档与权重 4 是恒等式锁死的，抬档没有收益点。

## 20. 常数与参数台账

§15 是笔记初稿的流水账，按小节顺序记数值与用途，没有出处列。本节是验收台账：五列制，每行都回 `build/sections` 下的 tex 核过文件与行号（位置一律写 `sections/文件:行`，行号为定稿 tex 实测）。两表视角差异见本节勘误小节。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $m$ | $\binom{1200}{600}\approx4\times10^{359}$ | sections/01-introduction.tex:16 | 顶点枚举 $I_1,\dots,I_m$（sections/02-finite-data.tex:44）；$p>m$ 的下界来源 | $p>m$ 失效则 sections/04-gluing.tex:391 的残基 $\bar\jmath$ 互异断，Vandermonde 方向参数化与短字三档随之断 |
| $p$ | $\min\{h>1:h\mid(m!)^2+1\}$，奇素数，$p>m>600$ | sections/01-introduction.tex:17；sections/02-finite-data.tex:16-26 | 域塔的 $-1$ 平方见证 $(m!)$；拟合分母可逆（sections/02-finite-data.tex:67）；两条 $1/4$（sections/03-modular.tex:144-145） | 换成 $p\equiv3\pmod4$ 的素数则第二层 $\nu^2=\xi$ 的范数论证失效，$\lvert K\rvert=p^4$ 断，$\zeta$ 的阶与整条秩分数账全部重写 |
| $K$ | $K_0=\F_p[\xi]/(\xi^2-\eta)$，$K=K_0[\nu]/(\nu^2-\xi)$，$\lvert K\rvert=p^4$ | sections/02-finite-data.tex:10-14 | $K^*$ 是大小 $M$ 的 Schwartz 网格；全部线性代数在 $K$ 上 | 塔塌则网格边长 $M$ 无从定义，引理 3.3 的"过半"与 $D_\lambda$ 的对角元独立性断 |
| $M$ | $p^4-1=\lvert K^*\rvert$，合数、偶、与 $p$ 互素 | sections/02-finite-data.tex:29 | $\zeta$ 的阶；一切 Fourier 分母 $\lvert A_*\rvert^{-1}$；$f$ 与 $f'$ 里的 $1/M$（sections/04a-sector.tex:33；sections/06-scalar-cellular.tex:42） | 若 $p\mid M$ 则 Maschke 失效，$p_\chi$ 根本造不出来，$p'$-部对角化全线断 |
| $\zeta$ | $K^*$ 中按字典序最小的阶 $M$ 元 | sections/02-finite-data.tex:29-36 | 特征取值、$D_\lambda$ 对角元、$\sum_y\zeta^{y\cdot a}$ 正交和 | 阶若真小于 $M$，指数条件 $\sum a_x=1$ 在 $\Z/M\Z$ 里含混，引理 5.2 的模 $q$ 约化断 |
| 阈值 $200$ 与零点窗 $[200,599]$ | 邻接 $\lvert I_i\cap I_j\rvert<200$；窗右端 599 来自相异集 | sections/02-finite-data.tex:45,63,71-74 | 拟合的 $F_{ii}=1$ 与非边 $F_{ij}=0$ 同一乘积满足；容斥 $3\cdot600-3\cdot199=1203$（sections/02-finite-data.tex:57-58） | 阈值改动破坏 $400=600-200$ 锁死关系，$\mathcal T$ 大小与 $\beta$ 次数脱钩，低秩拟合断 |
| $t$ | $\sum_{j=0}^{400}\binom{1200}{j}\le401\binom{1200}{400}$ | sections/02-finite-data.tex:47-48,79-83 | 拟合矩阵的列数；$t/m$ 左端；压缩层 $r=wt$（sections/05-compression.tex:93-94） | $t$ 变大则 $wt<md$ 反向，引理 6.2 的 $N>r$ 假设断 |
| $1/100$ | $401(5/7)^{100}<1/100$，见证 $(5/7)^3<1/2$、$40100<2^{33}$ | sections/02-finite-data.tex:83-87 | 不等式链 $t/m<1/100<1/96<d/w$ 的左端（sections/05-compression.tex:93） | 链一断 $C_\sharp$ 不再是瘦矩阵，证书 $u_*$ 的末坐标落在 $\ker\pi$ 外 |
| $P$ | $(\F_p)^3$，$\lvert P\rvert=p^3$ | sections/02-finite-data.tex:90 | 短字向量 $(1,\bar\jmath,\bar\jmath^2)$（sections/04-gluing.tex:385-389）；稳定子秩 $\le3$（sections/04a-sector.tex:157-158）；$X_j$ 三个与 $D=3(p-1)$ | 升 4 维则 $h/p^4$ 掉档、$d/w>1/96$ 预算断；降 2 维则三方向相关、$k=3$ 档认证断 |
| $A_0$ | $(\Z/M\Z)^P$，$\lvert A_0\rvert=M^{p^3}$ | sections/02-finite-data.tex:91 | 特征集与网格 $(K^*)^{p^3}$ 的双射样本空间；$\lvert\mathscr R\rvert$ 的分母 | 换 $(\Z/q\Z)^P$（$q\mid M$，$q<M$）则 $\zeta$ 阶浪费，$f=\frac1M\sum\zeta^{-k}z^k$ 与 $K[A_0]$ 的 Fourier 分解对不上 |
| $H,\ w$ | $H=A_0\rtimes P$，$w=M^{p^3}p^3$ | sections/02-finite-data.tex:92-97 | 秩分数 $d/w$；扇区块边数 $s=[H_i:T]$；群阶 $\lvert H\rvert=w$ 的一切用度 | $w$ 变则 Lean 侧整数不等式 $w<96d$ 重排，$J_i$ 的形状 $w\times d$ 跟着变 |
| $c,\ U\cap V$ | delta 函数；$v(s)=(c-s\cdot c,s)$；$U\cap V=\{1\}$ | sections/02-finite-data.tex:97-103 | 混合短字归约（sections/04-gluing.tex:396-399）；$D_\lambda$ 对角元遍历 $K^*$（sections/03-modular.tex:112-114） | $c$ 取平移不变函数则 $U=V$，混合词论证与出射侧认 $V$ 的分工同时断 |
| $\ell$ | $(p-1)/2$ | sections/03-modular.tex:9 | 双侧湮灭 $(u(s)-1)^\ell e=0$、$e(v(s)-1)^\ell=0$（sections/03-modular.tex:18）；链 $p-\ell=\ell+1$（sections/03-modular.tex:250） | 上界被有序零积 $p-\ell\ge\ell$ 锁，下界被 $h/p^3>1/48$ 锁；松一侧则零积或秩分数断 |
| $D$ | $3(p-1)$，单项式最大总次数 | sections/03-modular.tex:9,41-44 | $B$ 的列按 $\sum n_j\ge D-\ell+1$ 切割；$(L_s-I)^\ell$ 抬到 $D+1$ 逼某指数 $\ge p$ | $D$ 与 $\ell$ 脱钩则"总次数 $\ge D+1$ 必为零"的抽屉论证断，双侧湮灭失效 |
| $h$ | $\binom{\ell+2}{3}=\frac{(p-1)(p+1)(p+3)}{48}$ | sections/03-modular.tex:52-59 | 切片列数；$Q(\tau)$ 的总次数（Schwartz 的 $a$）；$d=hp^3\lvert\mathscr R\rvert$ | 公式变动则 $h/M<1/4$ 与 $h/p^3>1/48$ 两条界要同时重证 |
| $1/48$ | $h/p^3>1/48$（分子减 $p^3$ 为 $3p^2-p-3>0$，$p\ge3$） | sections/03-modular.tex:58-61 | $d/w>1/96$ 的右半步（sections/03-modular.tex:206-210） | 轨道选择已固定丢一个 $1/2$，$1/48$ 再降则 $1/96$ 端断 |
| 两碎片 $1/4$ | $h/M\le\frac{p^3}{p^4-1}<\frac14$；$(p^3-1)/M<\frac14$ | sections/03-modular.tex:139-145 | 引理 3.3 的"过半"（sections/03-modular.tex:100-101）；碎片和恰 $1/2$ | 相加 $\ge1/2$ 则可采纳特征可能为零，$\mathscr R$ 空则 $e=0$，幂等元断 |
| $\mathscr R$ | 每条含可采纳成员的轨道取首元；$\lvert\mathscr R\rvert>\lvert A_0\rvert/(2p^3)$ | sections/03-modular.tex:149-156 | 秩 $d$ 的求和集；块正交给 $e^2=e$ | 若要求可采纳沿轨道不变会丢轨道，密度断，$d/w$ 掉回 $1/96$ 之下 |
| $d$ | $hp^3\lvert\mathscr R\rvert$，$d/w>1/96$ | sections/03-modular.tex:202-210 | 扇区输入 $d=\dim_K e_iK[H_i]$ 与 $i$ 无关（sections/04a-sector.tex:22-24）；链右端 | 与表示秩 $h$ 混用则少因子 $p^3$，$wd_0=sd$ 与 $1/96$ 端同时断 |
| 边向量 | $v(1,\bar\jmath,\bar\jmath^2)$ 于 $H_i$ 与 $u(1,\bar\imath,\bar\imath^2)$ 于 $H_j$（$i<j$）粘合 | sections/03-modular.tex:230-231；sections/04-gluing.tex:366-369 | 有序零积的方向匹配；Vandermonde $(\bar\jmath_2-\bar\jmath_1)(\bar\jmath_3-\bar\jmath_1)(\bar\jmath_3-\bar\jmath_2)\ne0$（sections/04-gluing.tex:387-389） | 定向对调则非零 entry 出现在 $i>j$ 侧，$\mathcal N$ 不再严格下三角，$\mathcal N^m=0$ 与修正级数不存在 |
| $X=y-1$ | $K[\langle y\rangle]=K[X]/(X^p)$；右乘 $X^\ell$ 的零化子恰为理想 $(X^{p-\ell})$ | sections/03-modular.tex:242-249 | $e_i=qX^{p-\ell}$ 的逐坐标分解，须在取商之前于自由右模基上做 | 商后做则陪集已粘合、右模基不在；零化子若严格大于尾部理想则分解式不成立 |
| 短字 $k\le3$ | 三档；$k=1$ 免互异条件；$k\ge2$ 循环相邻互异 | sections/04-gluing.tex:20-29 | 普通面长 $\ge4$（sections/04-gluing.tex:320-326）；命题 4.2 的验证（sections/04-gluing.tex:379-401） | 降为 $k\le2$ 则长 3 普通面合法、每面贡献 1，亏损预算 8 可被凑满，矛盾失效 |
| 亏损 $8$ | $\sum_v(4-\deg v)+\sum_F(4-\lvert\partial F\rvert)=8$；两案 $3<8$ 与 $2+3+2=7<8$ | sections/04-gluing.tex:328-341 | 例外地图不存在，引理 4.1 的粘合单射成立 | 曲面换射影平面则右端变 4，有圈案 $7<4$ 假；权重 4 改任何其他数则 $e$ 项不配平 |
| $f$ | $\frac1M\sum_k\zeta^{-k}z^k$；$zf=\zeta f$；恒等系数 $M^{-1}\ne0$ | sections/04a-sector.tex:31-35,94-101 | $S=fR$ 的单位元；$P_i=fe_i$；证书 $u_*$ 末坐标取 $f$（sections/05-compression.tex:109-113） | $z$ 阶若真小于 $M$ 则 $f^2=f$ 的几何和塌，$f\ne0$ 失见证，扇区与缺陷侦测全断 |
| $T_\theta$ | 初等交换 $p$-群，秩 $\le3$，允许平凡 | sections/04a-sector.tex:137-159 | $D=K[T]$ 的增广理想幂零 $\mathfrak a^{D_{\max}+1}=0$（sections/04a-sector.tex:246-249） | 稳定子若含 $p'$-部则 $\mathfrak a^2=\mathfrak a\ne0$，$Q^{-1}$ 的有限几何级数与换基断 |
| $D_{\max}$ | $3(p-1)$，与 $\theta$、$q$ 无关的一致界 | sections/04a-sector.tex:248 | 换基级数 $\sum_{k=0}^{D_{\max}}(-N)^k$ 的定长（sections/04a-sector.tex:267-270） | 级数长度若依赖 $\theta$ 则 prescription 不 finite；与 $D$ 数值相等但消费点独立，改动需两处分别重证 |
| $d_0,\ s$ | $d=d_0\lvert T\rvert$，$w=s\lvert T\rvert$，$wd_0=sd$ | sections/04a-sector.tex:278-281 | 坐标配对双射（sections/04a-sector.tex:285-292）；矩形 $J_i\in\Mat_{w\times d}(S)$、$Y_i\in\Mat_{d\times w}(S)$（sections/04a-sector.tex:39-45） | $wd_0=sd$ 不成立则两集合不等势，$V,W$ 拼不出 $WV=I_d\otimes I_s$ |
| $r,\ N$ | $r=wt$，$N=md$，$N>r\ge1$ | sections/05-compression.tex:93-94,101-102 | 引理 6.2 的全部假设；$\pi u_*=0$ 依赖 $N>r$ | 链反向则 $A_Rv_*=0$ 断，反向缺陷 $(B_RA_R-I_r)v_*=-v_*$ 无从谈起 |
| $q,\ n$ | 最小 $q\ge0$ 使 $n=M^q\ge r$；$q=0$ 时 $n=1$、$\Lambda=C_M$ | sections/06-scalar-cellular.tex:17-18,107,147 | $\Mat_n(K)$ 载体尺寸；补齐 $\widetilde A=\diag(A,I_{n-r})$ 不伤缺陷 | $n<r$ 则装不下 $r$ 阶方阵，$\Phi$ 无定义；禁 $q=0$ 则 $r=1$ 退化案失覆盖 |
| $\Lambda,\ \Omega_{uv}$ | 阶 $Mn^2$ 的 Heisenberg 群；$\Omega_{uv}\Omega_{st}=\delta_{vs}\Omega_{ut}$ | sections/06-scalar-cellular.tex:19-21,29,79 | $f'K[\Lambda]\cong\Mat_n(K)$ 的基；标量化 $a,b$ | 中心扩张 2-上循环 $y\cdot x'$ 若换号，$X_a$ 与 $D_v$ 的交换子关系变，$\delta_{vs}$ 律断 |
| 正交和 | $\sum_{y\in Z_q}\zeta^{y\cdot a}=n$（$a=0$）或 $0$（$a\ne0$），合成阶合法 | sections/06-scalar-cellular.tex:53-61 | $D_vD_t=\delta_{vt}D_v$；$\sum_vD_v=f'$；$D_vX_a=X_aD_{v-a}$ | 论证若含除法，$a_j$ 为 $\Z/M$ 零因子时断，这是 $M$ 合数的专属防御点 |

### 依赖链：哪个常数喂哪条引理

主链是取数链：$m\to p\to(K,M,\zeta)$（引理 2.1），然后 $(M,p)\to(A_0,P,H,w)$（`sections/02-finite-data.tex:90-97` 的局部群），再 $(p\text{ 奇})\to(\ell,D,h)$（引理 3.1 侧的切片），最后 $(h,M,|A_0|)\to(|\mathscr R|,d)$（命题 3.2 的秩）。副链是图的取数链：$(1200,600,200)\to(t,\mathcal T)$（命题 2.2），$t$ 一路只喂一个不等式。两条链在 `sections/05-compression.tex:93-94` 的 $wt<md$ 处汇流：左边来自 $t/m<1/100$，右边来自 $d/w>1/96$，汇流前互不通气，这也是两侧界都取得很松却无害的原因。汇流后喂引理 6.2（$N>r$ 与证书 $u_*$）、推论 7.3（$n\ge r$ 的倍增搜索）与命题 8.1（细胞自动机）。

枢纽一：$p>m$ 三处上岗。拟合层的分母可逆（$600-k\le400<p$）、粘合层的方向互异（残基 $\bar\jmath$，sections/04-gluing.tex:391）、密度层的两条 $1/4$ 裕量。改动 $m$ 的定义（比如换 $\binom{1200}{601}$）三处都要重验。

枢纽二：$\ell$ 的双向夹。下游是 $h$（单调增）与链式相消 $p-\ell=\ell+1$（sections/03-modular.tex:250）；上游是 $p$ 的奇性。改 $\ell$ 任何一侧，塌点先出现在有序零积（$Xe_j$ 分离不出 $X^\ell$）或 $d/w>1/96$（$h/p^3$ 掉穿 $1/48$），二者取先到者。

枢纽三：$3(p-1)$ 双岗。同值常数 $D$ 与 $D_{\max}$ 消费点独立：前者在切片湮灭的抽屉论证，后者在换基级数定长。同时改它们需要 $P$ 的维数不变，否则两边一起变但变向相同，这是"两处同源于三个生成元、每个指数 $<p$"的算式化含义。

枢纽四：$M$ 三职。$\zeta$ 的阶（对角化资源）、$f$ 与 $f'$ 的分母（两个扇区的幂等元）、Heisenberg 中心的阶（合成阶正交性）。若 $M$ 换成素数 $\ell$（特征 2 版的口味），最后一条的零因子防御变成多余，但前两条不变，这解释了为什么推论 7.3 的构造在两篇里形状相同而论证细节不同。

### 勘误：§15 与本表的视角差异

1. §15 成稿于笔记早期，按笔记小节顺序排列，每条只有数值与一句用途，没有出处列，也没有"改动断在哪"的列；本表按消费链重排并补两列。§15 里的 "§3.1"、"§3.2" 等是论文第 3 节的子小节号，与本笔记的节号体系不同，查行号时以本表的 `sections/文件:行` 为准。
2. 三处口径修正。其一，§15 把 $D$ 与 $D_{\max}$ 合写为"同一数值出现两次"，本表拆成两行，因为它们的改动半径不重叠；其二，§15 未记 $h\le p^3$ 这条 Schwartz 应用的必要条件（`sections/03-modular.tex:141` 用的就是它），本表并入 $h$ 行的数值列；其三，§15 的 $1/100$ 与 $1/96$ 行没有指认见证元 $(5/7)^3<1/2$ 与 $40100<2^{33}$，本表单列一行（原表中拆成"1/100"行内完成）。
3. 增补条目八个，均系 §15 漏记：$K$ 塔本身、$\zeta$ 的最小元取法、$r,N$ 与 $N>r$、$f$、$T_\theta$、$d_0,s$ 的整数等式、证书 $u_*$ 所在的 $1/48$ 行、正交和的合成阶条件。两表并存无内容冲突，§15 保留作反推过程的证据，本表为验收台账。
