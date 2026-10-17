# D24 Kaplansky 拟迹猜想的反例：我把反例做成"只有坏拟迹"的代数

对象论文：`A counterexample to Kaplansky's quasitrace conjecture and failure of tensor-product stable finiteness`（2026-09-23，OpenAI）。
TeX 源码：`E:\math\preprints\A-counterexample-to-Kaplanskys-quasitrace-conjecture-September-23-2026\build\`（`paper.tex` + `01-introduction`…`07-consequences` + `bibliography` + `figures/finite-test.tex`）。
Lean：`E:\math\lean\OAI\Analysis\Kaplansky\`（72 个文件）加平行支持库 `OAI\Analysis\Quasitrace\`、`OAI\Analysis\Cuntz\`、`OAI\Geometry\BundleTests\`，comparator 配置 `ComparatorChallenges\KaplanskyQuasitrace.json`，被认证的只有 `OAI.Kaplansky.kaplansky_quasitrace_counterexample` 这一条。
素材：`研究笔记\素材\Kaplansky拟迹反例-素材.md`（12.6 万字符，§一到§三完整；§四 Lean 取证与§五常数表由我在本文第 13、14 节自己补）。

记号约定与论文一致。$D$ 这里没有用（不涉对偶范畴），$d$ 一律表示丛的秩或矩阵尺寸；$\mathcal H_{m,R,y}$ 是分层 Hilbert 空间，$E_j(y)$ 是它的第 $j$ 层纤维。文中所有带公式的行我都尽量保留论文 TeX 的写法，引文行号形如 `05:12` 表示 `05-algebra.tex` 第 12 行。


## 0 我进场时手里有什么

仓库里已经有两篇带 Kaplansky 名字的笔记素材：群环直有限性特征 2（D02）和奇特征群环（D23）。这一篇是同名的第三个 Kaplansky 猜想，算子代数方向的：

> 每个单复 $C^*$-代数上的规格化 2-拟迹都是迹态。

三个猜想除了名字相同，机制完全不通。前两篇的语汇（prescription、specified、群环基、Heisenberg 分块）在这篇里没有对应物，我在写作时刻意不把两边的"构造味道"混用。这篇给我的第一层困难是纯量化的：它的反例要求"$a,b$"这对元固定、缺陷有显式下界、并且对**每一个**规格化 2-拟迹成立。论文原文（`01:80-88`）：

```tex
\begin{theorem}
\label{thm:main}
There exist a separable unital complex \(C^*\)-algebra \(A\), admitting
a normalized \(2\)-quasitrace, and positive contractions \(a,b\in A\)
such that every normalized \(2\)-quasitrace \(\tau\) on \(A\) satisfies
\[
 \tau(a+b)-\tau(a)-\tau(b)\ge\frac1{144}.
\]
\end{theorem}
```

我把量化顺序逐字对齐了一遍，因为 Lean 那边要按它核对：

$$\exists A\,(\text{separable}\wedge\text{unital}\wedge C^*\text{-algebra}\wedge\exists\tau_0\,(\tau_0\text{ 规格化 }2\text{-拟迹}))\wedge\exists a,b\in A\,(a,b\text{ 正压缩元}\wedge\forall\tau\,(\tau(1)=1\wedge 2\text{-拟迹}\Rightarrow\text{缺陷}\ge1/144)).$$

有三点很容易被读掉：

1. 结论的量词让 $\tau$ 跑遍整个拟迹集合，缺陷的下界是 $1/144$ 这个实数。所以我根本不需要写出任何一个拟迹的公式。intro `01:209-211` 那句 "requires no formula for a chosen quasitrace" 就是在说这件事，而它是我在整个构造里最看重的自由度。
2. $a,b$ 限定在正压缩元（positive contractions）里，缺陷对实数序陈述。这隐含 $\tau(a+b)-\tau(a)-\tau(b)\in\mathbb R$，需要一步论证（正元在拟迹下取实值），Lean 那边把这步暴露成了 `.re`，见第 14 节。
3. 定理字面上没说 $A$ 无迹，但"无迹"是它的一句话推论：有迹态就与 $\ge1/144$ 矛盾。abstract 把宣传重心放在"有规格化 2-拟迹但没有迹态"，也就是存在性与障碍性各占一半。

被否定的对象的历史位置我按论文口径整理：Kaplansky 1951 年引入 $AW^*$-代数是为了用内在代数条件刻画它，不依赖选定的 Hilbert 空间表示；因子类型上三种结局不同，type I 的 $AW^*$-因子都是 $W^*$-代数，type III 有反例，type $\mathrm{II}_1$ 这个有限情形就是本文要处理的（`01:38-45`，转述 Gow）。Haagerup 把确切代数的情形证死了：单确切 $C^*$-代数上每个 2-拟迹都是迹（`[Theorem 5.11]`），1991 年完成草稿、2014 年发表。作者特意交代这 23 年的间隔，我读出的信息是"反例必须在非确切代数里找"这件事 1991 年就知道了，本文的新意只在具体绕开的方式上。紧接一句是路线宣言（`01:66-67`）：Without exactness, the existence of quasitraces is governed by a different condition.

还有一条我不能忽略的下限约束（`01:97-101`）：

> Haagerup reports Kirchberg's 2006 unpublished example of a \(1\)-quasitrace that is not a \(2\)-quasitrace, and hence is not a trace. This example lacks the matrix extension required here.

全篇只有这一处用 essential 来断言某条件的不可省。它划出我的反例的最低合法强度：必须扛得住"$M_2$ 延拓"这一加强。Kirchberg 的例子只做到 1-拟迹层面，所以我下面所有的估计都要在 2-拟迹的框架里活着。

文末的台账补表把本笔记的位置坐标统一收到 `preprints/A-counterexample-to-Kaplanskys-quasitrace-conjecture-September-23-2026/build/` 下 `*.tex` 的逐字行号上；补表前我核对过 `.tools/lean_queue.txt`，队列第 8 行逐字等于 `A-counterexample-to-Kaplanskys-quasitrace-conjecture-September-23-2026`，与上面的目录名是同一个对象。

## 1 第一条死路：显式造一个坏拟迹

最直接的翻译是：找一个代数，找一个具体的正线性泛函，验证它满足 (i)(ii)(iii) 与 $M_2$ 延拓，然后证明它在一个具体的对上不可加。这条路我在纸上推了一遍就废了，三个理由，都是机制性的：

**理由一：拟迹没法放大。** 假设我在 $B$ 上造出一个规格化 2-拟迹 $\tau$，而缺陷对天然住在 $M_{48}(B)$ 里（这是后面 Lemma 5.2 的产物，见第 10 节）。要把 $\tau$ 搬上 $M_{48}(B)$，标准手法是 $\operatorname{Tr}\otimes\tau$，而这个张量积要求 $\tau$ 是**迹**才线性。拟迹非线性，通道直接堵死。反过来走就顺了：先放大代数，再在放大后的代数上用存在定理。论文 `01:206` 那句 "set \(A=M_{48}(B)\) and apply Theorem~\ref{thm:existence} directly to \(A\)" 里的 directly 我读作有意强调。

**理由二：非确切代数上没有显式拟迹的手段。** Haagerup 的定理说明任何确切构造（自由积、某些归纳极限）都会自动让 2-拟迹变成迹，也就是白做。所以我的 $B$ 必须落在非确切范畴，而文献里根本没有在非确切代数上写出一个拟迹公式的工具。

**理由三：即使写出一个，也证不了"对每一个"。** 定理要求 $\forall\tau$。显式路线最多给 $\exists\tau$，那是 Kirchberg 2006 已经做到的强度（而且他还少了 $M_2$ 延拓）。

第三条理由实际决定了整篇论文的形态：既然 $\tau$ 不可控，那就把证明做成"$\tau$ 任意给定、缺陷自动 $\ge$ 某数"的形式，也就是让**代数本身**把所有拟迹都钉在同一个非可加对上。这就需要一个只依赖公理的估计（Lemma 5.2），和一个保证拟迹存在的机制（Theorem 2.1）。

## 2 第二个转折：把"没有迹"换成"每个矩阵代数都不适当无穷"

定义层先把四件事钉住（`02:6-29`）。1-拟迹是 $\tau:C\to\mathbb C$ 满足

```tex
\item \(\tau(x^*x)=\tau(xx^*)\ge0\) for every \(x\in C\);
\item \(\tau(h+ik)=\tau(h)+i\tau(k)\) for self-adjoint \(h,k\in C\);
\item the restriction of \(\tau\) to every abelian \(C^*\)-subalgebra
of \(C\) is complex linear.
```

2-拟迹：$M_2(C)$ 上的一个 1-拟迹限制在左上角等于 $\tau$。规格化：$\tau(1_C)=1$。

这四条里有三步我必须在纸上补完，否则第 10 节和第 12 节的用法会看不懂。

补步 1，正元取实值：$h$ 自伴，落在 abelian 子代数 $C^*(1,h)$ 里，(iii) 说 $\tau$ 在其上复线性；$h\ge0$ 时 $h=h^{1/2}h^{1/2}$，(i) 给 $\tau(h)\ge0$。于是 $\tau$ 在 $C^*(1,h)$ 上就是一个正的线性泛函（倍数态），实值。这就是 Theorem 1.1 那个 $\ge1/144$ 有意义的根据。

补步 2，$M_2$ 的单位值被钉死：记延拓为 $\sigma$，$e=\begin{psmallmatrix}1&0\\0&0\end{psmallmatrix}$、$f=\begin{psmallmatrix}0&0\\0&1\end{psmallmatrix}$、$t=\begin{psmallmatrix}0&1\\0&0\end{psmallmatrix}$，则 $t^*t=f$、$tt^*=e$，(i) 给 $\sigma(e)=\sigma(f)$；$e,f$ 同在 abelian 子代数 $\mathbb Ce\oplus\mathbb Cf$ 内，(iii) 给 $\sigma(1_{M_2(C)})=\sigma(e)+\sigma(f)=2\sigma(e)=2\tau(1_C)=2$。论文 `02:17-19` 用一行写完这一步，我在第 10 节要把它推广到 $2N$ 个角。

补步 3，(ii) 的功能：任何 $x=h+ik$，(ii) 把 $\tau(x)$ 由自伴部分决定，配 (iii) 得到"$\tau$ 在每个 abelian 子代数上是复线性正泛函"。(ii) 到底冗余与否，我留在第 15 节的怀疑清单里。

然后是这次转折的核心输入（`02:31-36`）：

```tex
\begin{theorem}[Quasitrace existence]
\label{thm:existence}
A unital \(C^*\)-algebra \(C\) admits a normalized \(2\)-quasitrace
if and only if \(M_m(C)\) is not properly infinite for every
positive integer \(m\).
\end{theorem}
```

论文随即登记它的出处与普适度（`02:38-47`）：这就是 Milhøj–Rørdam 的 `[Theorem 2.3]`，历史上游是 Cuntz 1978 的维数函数、Blackadar–Handelman 1982 的"2-拟迹对应下半连续维数函数"、Blackadar–Rørdam 的预序半群上态延拓；并且它"has no exactness, simplicity, or representation assumption"。最后这半句是本文能用它的原因：我的 $B$ 三样都不满足（非确切、单性没证、没有表示限制）。

这个 iff 立刻把任务改写成两边：

- 存在性一侧（⟸）：只要证明 $M_m(B)$ 对每个 $m$ 都不适当无穷，拟迹就免费到手。我不用写它。
- 障碍一侧：要让 $B$ 无迹，我只需要造一对关系 $\sum x_i^*x_i=1,\ \sum x_ix_i^*\le c<1$，因为迹态 $\sigma$ 会给出 $1=\sigma(\sum x^*x)=\sigma(\sum xx^*)\le c<1$（`07:65-66` 的写法是 "applying one to their two sums would give $1\le2/3$"）。

于是我要做的事情被压缩成一句：造一个由固定有限个生成元生成的可分单代数，生成元满足"列和恰为 1、行和严格 $<1$"，同时每个矩阵代数里都不存在两个正交值 isometry。前半句是局部代数关系，后半句是全局排除。两者的冲突就是全文的难点，也是它的趣味所在。

顺便记一个我一开始想多做的事，后来主动放弃：适当无穷的定义里只写"两个 isometry"，而"每个投影都有限"这种更强的陈述论文在 `02:28-29` 明确不要：

> Absence of stable proper infiniteness is the condition needed below; no assertion about finiteness of every projection is required.

我核对了一下机械理由：Theorem 2.1 的条件只涉及"没有两个正交值 isometry"，加投影有限性不会给证明任何东西；更重要的是 §5 的拓扑排除只服务于 isometry 对，扩展到任意投影需要"$P\oplus Q\cong E_j^{\oplus k}$"型分类，那条路上陈类预算完全不够（`04:120-121` 的普适度声明只覆盖"任意连续子丛"，不覆盖任意投影）。

## 3 双层索引的对角化：bounded product + 生成子代数

Milhøj–Rørdam 在 `[Remark 4.7]` 里给的提示，论文原文照抄在 `01:151-156`：

> Milh{\o}j and R{\o}rdam proposed separating a uniformly bounded length of such a tuple from increasingly delayed matrix proper infiniteness. The construction below uses a bounded product and a generated subalgebra, with a separate test for every matrix size and polynomial degree. The fixed number of generators preserves the trace obstruction while all finite polynomial candidates are excluded.

我把这段话拆成三个动作，因为它是整个骨架。

动作一：候选 isometry 出现在某个 $M_m(B)$ 里，它是 $B$ 的元素，而 $B$ 由 24 个生成元的 $*$-多项式范数稠密生成。任何具体候选都能被一个**词长有限**的多项式矩阵 $P$ 逼近，$P$ 的词长记为 $R(P)$。

动作二：对每一对 $(m,R)$ 我预先准备一个"测试"（一个底空间 $Y_{m,R}$ 加一列丛），它的容量刚好否决"$m\times2m$、词长 $\le R$"的所有候选。

动作三：把所有测试同时装进一个有界积 $\mathcal D=\prod_{m,R,y}\mathcal B(\mathcal H_{m,R,y})$，让 24 个生成元在每个坐标上同时实现各自那个测试的移位，然后取 $B=C^*(1,x_1,\dots,x_{24})$。

于是候选自己挑自己的否决者：$P$ 的词长 $R(P)$ 选中积里那个 $(m,R(P))$ 坐标，在那个坐标上 $P$ 的限制成为一个丛映射，被陈类否掉。intro `01:190-204` 的措辞是 "Its finite degree selects one of the tests already present in the product, which obstructs that approximation"。这个"对角化"结构让我第一次读到时很震动，因为它是把一个"对所有 $m$ 和所有词长"的双无界量化拆成"每个具体对象自带有限参数"的标准手段，而载体是一个不要求任何坐标间相容性的积。

顺序上有一条铁律，我在第 9 节回到它：$R$ 必须在 $P$ 之后选。多项式逼近的稠密性不控制词长，逼近某个具体 isometry 可能需要任意长的词。若先固定 $R$，逼近元的词长可能超出 $R$，限制之后靶跑出 $\bigoplus_{j\le R}E_j$ 这个窗口，那里全是续接段（纯 doubling），陈类控制不存在。

我也检查了它的反面做法会不会更省事：给每个 $m$ 造一个 $B_m$，再取直和或归纳极限。Villadsen/Rørdam 那条正统一路（特征类方法在近似酉等价下工作）在这里不行，因为本文需要 $\sum x_i^*x_i=1$ **精确**成立，才能与行和 $\le c<1$ 构成硬冲突（迹态论证里第一个等号就要用它）。近似关系给不出 $1\le c$ 这个矛盾。归纳极限/无限直和里精确等式还有一层技术障碍：$\ell^2$-直和上 $\sum x^*x=1$ 的逐分量收敛与生成元个数不相容。有界积配合"生成子代数"是同时保住精确性与可分性的最省事配置：可分性只依赖有限生成（`05:56-57` 说有理复系数的 $*$-多项式构成可数稠密子集），而 $\mathcal D$ 本身不可分（不可数坐标 + 连续底）。

还有一处我用直觉核对过：为什么用积，并非把全部 $\mathcal H_{m,R,y}$ 合一个大 Hilbert 空间、令 $x_i$ 为移位之和。关系式照样成立，但"限制到某个坐标"在那种实现下是压缩，并非 $*$-同态，而第 9 节的关键一步需要坐标求值把 $P^*P\ge\tfrac12I$ 原样带到该坐标上。满 $*$-同态给保序双向，压缩只给一侧。论文的措辞只有 "in one bounded operator product"（`01:174`），没写这个理由，我标 [推测]。

## 4 一列丛要同时满足五件事

Proposition 4.1 是拓扑测试的规格书（`04:14-37`）：

```tex
\begin{proposition}\label{prop:bundle-test}
For every pair of integers $m,R\geq 1$, set
\begin{equation}\label{eq:test-ranks}
 d_0=64m4^R,\qquad d_j=4^j d_0\quad(0\leq j\leq R).
\end{equation}
There are a compact smooth manifold $Y$, Hermitian complex vector bundles
$E_j\to Y$ for all $j\geq0$, and continuous bundle maps
$X_i^{(j)}:E_j\to E_{j+1}$, for $1\leq i\leq24$ and $j\geq0$, such that
$E_0$ is trivial of rank $d_0$, the rank of $E_j$ is $d_j$ for
$0\leq j\leq R$, and
\begin{equation}\label{bundle:scaled-identities}
 \sum_{i=1}^{24}(X_i^{(j)})^*X_i^{(j)}=I_{E_j},
 \qquad
 \sum_{i=1}^{24}X_i^{(j)}(X_i^{(j)})^*
 \leq\frac23 I_{E_{j+1}}.
\end{equation}
Moreover,
\begin{equation}\label{eq:chern-obstruction}
 \begin{gathered}
 \left(\bigoplus_{j=0}^R E_j\right)^{\oplus m}\\
 \text{contains no trivial subbundle of rank }2md_0.
 \end{gathered}
\end{equation}
\end{proposition}
```

五个条件同时成立才叫合格：生成元个数固定 24；每级映射满足列和恰等 $I$、行和 $\le\tfrac23I$，而且这组常数与 $(m,R)$ 无关；$E_0$ 平凡；到第 $R$ 级的直和取 $m$ 份以后没有秩 $2md_0$ 的平凡子丛；只对该 $j\le R$ 负责，$j>R$ 是填充。

论文把冲突自述得很清楚（`04:40-49`，这是全文最接近思维链的一段）：

> The bundles must satisfy two requirements. Their sum through level $R$ must retain a Chern class after allowing the trivial directions coming from $E_0$. At the same time, successive bundles must admit a fixed number of maps that expand every source subspace. We reduce each old line-bundle multiplicity by a factor of four at every step, so the total trivial part stays small. Each new projective-space factor is then sized to retain the Chern class contributed by every later occurrence of its line bundle. The initial rank leaves enough room in the reduced blocks to expand small subspaces; a large new block handles the others.

我把它翻译成一个具体的参数表（`04:52-77`）：

```tex
 b_i=\frac{15}{4}d_{i-1}.\qquad
 a_{0,j}=d_0 4^{-j}=64m4^{R-j},\qquad
 a_{i,j}=b_i4^{-(j-i)}=960m4^{R+2i-j-2}\ (1\leq i\leq j\leq R).
 K_i=m\sum_{j=i}^R a_{i,j}=320m^2 4^{2i-2}\bigl(4^{R-i+1}-1\bigr),\qquad
 Y=\prod_{i=1}^R\mathbb{CP}^{K_i}.
 E_j=\bigoplus_{i=0}^j L_i^{\oplus a_{i,j}}\qquad(0\leq j\leq R).
```

$L_0$ 平凡线丛，$L_i$（$i\ge1$）是第 $i$ 个 $\mathbb{CP}^{K_i}$ 因子上超平面线丛的拉回。

我自己验算了四处闭合，因为这套下标很容易骗人：

秩递推：$\operatorname{rank}E_{j+1}=\sum_{i=0}^j a_{i,j}/4+b_{j+1}=\tfrac14d_j+\tfrac{15}{4}d_j=4d_j=d_{j+1}$。也就是每层把旧乘度全部除 4，再加一个 $\tfrac{15}{4}d_j$ 的新块。

乘度和：$\sum_{i=1}^j b_i4^{-(j-i)}=\tfrac{15}{4}d_0\sum_{i=1}^j4^{2i-1-j}=\tfrac{15}{4}d_0\cdot\tfrac{4^{j+1}-4^{1-j}}{15}=d_04^j-d_04^{-j}$，加上 $a_{0,j}=d_04^{-j}$ 正好 $=d_j$。论文用归纳绕过这个和式，我把和式算出来当作自检。

整数性：$a_{i,j}=60m\,4^{R+2i-j}$（论文的 $960m4^{R+2i-j-2}$ 与它相同，$960/16=60$），指数 $R+2i-j\ge R-j\ge0$；$b_i=240m4^{R+i-1}$；$K_i=320m^24^{2i-2}(4^{R-i+1}-1)$。论文两处强调 "All these numbers are positive integers"（`04:64`）、"Thus every $K_i$ is a positive integer"（`04:71`）。$i=1,R=1$ 时 $K_1=960m^2$。

除 4 的安全性：所有被除的乘度 $D=a_{i,j}$（$j\le R-1$）都得被 4 整除且不能太小。最小的是 $a_{0,R-1}=d_0/4^{R-1}=256m$，其余 $a_{i,j}\ge60m\cdot4^{R+2-(R-1)}=3840m$；而 $60=4\cdot15$ 保证整除。论文的句子是 "every multiplicity $D$ to which division by four is allowed is divisible by four and satisfies $D\geq256m$"（`04:85-87`）。注意 §6 里小块实际用的界是 $D\ge64m$，比这个还弱，也就是说 $d_0$ 的余量在第 4 节就已经埋好了。

然后是保留陈类那一段（`04:89-121`），我把它写成五步：

令 $G=(\bigoplus_{j=0}^RE_j)^{\oplus m}$，$h_0=m\sum_{j=0}^Ra_{0,j}$，$p=\sum_{i=1}^RK_i$。

1. 由 $K_i$ 的定义，$L_i$ 在 $G$ 里的总乘度恰好是 $K_i$（这就是 $K_i:=m\sum_{j\ge i}a_{i,j}$ 的意思）。于是 $G\cong L_0^{\oplus h_0}\oplus\bigoplus_{i=1}^RL_i^{\oplus K_i}$。
2. $h_0$ 的闭式：$\sum_{j=0}^R4^{-j}=\tfrac{1-4^{-(R+1)}}{3/4}=\tfrac43(1-4^{-(R+1)})$，所以 $h_0=\tfrac43md_0(1-4^{-(R+1)})<2md_0$。这一步是整节最紧的不等式，我单独讨论它的参数敏感度（第 13 节，以及下面第 8 节对"为什么是 4"的分析）。
3. $H^*(Y;\mathbb Z)=\mathbb Z[z_1,\dots,z_R]/(z_1^{K_1+1},\dots,z_R^{K_R+1})$，$\deg z_i=2$，于是 $\prod z_i^{K_i}\ne0$：每个因子取自己的顶次，落在 $H^{2p}(Y)=\mathbb Z$ 的生成元上。
4. Whitney 公式：$c(G)=\prod_i(1+z_i)^{K_i}$，$2p$ 次分量唯一取法是每个 $i$ 都取 $z_i^{K_i}$，故 $c_p(G)=\prod z_i^{K_i}\ne0$。
5. 障碍：若 $G$ 含秩 $k$ 平凡子丛 $V$（$k>h_0$），取正交补 $W=V^\perp$，$\operatorname{rank}W=(h_0+p)-k<p$；$c(G)=c(V)c(W)=c(W)$（$V$ 平凡），于是 $c_p(G)=c_p(W)=0$（高于秩的陈类为零），矛盾。取 $k=2md_0>h_0$ 得 (4.4)。

这条论证有一个我很在意的普适度（`04:120-121`）：The argument applies to any continuous subbundle, without a condition on its position relative to the displayed line summands. 它预先解决了第 8 节末尾的一个尴尬：规格化之后的映射会混合线丛直和项，分块结构被破坏，而障碍不需要分块对齐。这两处一先一后，不是巧合。

## 5 为什么必须是 4：一个由两条夹出来的数

$d_{j+1}=4d_j$ 里那个 4，我在第 4 节看到它同时用于乘度衰减与秩递推。它的必然性我这样推：

设每层的乘度衰减因子是 $\rho$（旧线丛在下一级的出现量是 $1/\rho$），则 $h_0=m d_0\sum_{j\ge0}\rho^{-j}=\frac{m d_0}{1-1/\rho}$（忽略 $R$ 截断的上界），而障碍要求 $h_0<2md_0$，即 $\frac{1}{1-1/\rho}<2\iff\rho>2$。$\rho=2$ 直接不行，因为那会让 $h_0$ 撞上 $2md_0$，(4.4) 里要排除的平凡子丛秩不再超过平凡部分容量，障碍整条失效。$\rho=3$ 满足 $>2$，但 $a_{i,j}$ 的整除性要靠 $3^j$、$b_i$ 会变成 $(\rho-1)/\rho\cdot d_j$ 的分数形式，记账难受。$\rho=4$ 同时是 2 的幂（保 $4^{\pm j}$ 双向整除）且严格 $>2$。所以我把它记成"由 2 的幂 + 严格 $>2$ 夹出来的最小值"。

放大到 8 也成立：$D$ 更大、incidence 更宽裕，但 $\eta_j$（底空间预算）与 $b_i$ 同步放大，缺陷 $(1-c)/(2N)$ 完全不动，只是所有数变大。这条"放大无害、缩小有害"的不对称我在第 13 节的常数表里逐项标了敏感度。

论文没有讨论最优性（素材 §3.4 明确记了"未述 $d_0$、$q=16/8$、$\alpha=3/2$ 的最优性"），所以上面这一段连同下面的边界值计算都是我的外部推算，一律 [推测]。

## 6 Lemma 3.1：incidence 不等式是核丛维数算式的等价改写

两条使膨胀与拓扑相容的原料，论文自述在 `01:190-204`：

> Two ingredients keep the expansion and the topological obstruction compatible. First, a family of bundle maps whose collective image expands every source subspace by a factor of two can be normalized continuously to have column sum one and row sum at most \(2/3\). … Second, the bundle tests separate small and large source subspaces: sixteen maps into reduced copies of old line bundles handle the small ones, while eight generic maps into a new line-bundle block handle the large ones. This keeps the generator count fixed as the matrix size and word-length bound increase.

我要的是"$\sum_iT_iS$ 至少 $2\dim S$"这种集体膨胀，同时保留拓扑障碍。这两件事看起来互相拉扯：拓扑障碍要求映射高度特殊（受陈类约束），集体膨胀要求映射很一般（generic）。论文的第一层解耦是把这两件拆成两条互不相干的引理。

Lemma 3.1（`03:9-28`）：

```tex
\begin{lemma}[Avoiding small collective images]
\label{lem:incidence}
Let $E,F$ be smooth Hermitian complex vector bundles of ranks $d,r$ over
a compact smooth manifold $Y$ of real dimension $2h$, and let $q\geq1$.
Let $\mathcal A$ be a finite set of integer pairs $(s,t)$ with
$1\leq s\leq d$ and $0\leq t\leq r$ such that
\begin{equation}
  (qs-t)(r-t)-s(d-s)>h
  \qquad ((s,t)\in\mathcal A).
  \label{eq:incidence-dimension}
\end{equation}
There are smooth bundle maps $T_1,\ldots,T_q:E\to F$ such that, for every
$y\in Y$, every $(s,t)\in\mathcal A$, and every complex $s$-plane
$S\subset E_y$,
\[
  \dim_{\mathbb C}\sum_{i=1}^q T_i(y)S>t.
\]
\end{lemma}
```

它的价值全在"同时"：一组 $q$ 个映射，对所有底点、所有 $(s,t)\in\mathcal A$、所有 $s$-平面一起生效。

五步证明我按论文补全，因为第 8 节的预算表全靠它。

步 1，造有限维参数空间。取 $\operatorname{Hom}(E,F)$ 的有限平凡化开覆盖 $\{U_\alpha\}$ 与 subordinate 单位分解 $\{\rho_\alpha\}$（$\operatorname{supp}\rho_\alpha\subset U_\alpha$）；把每个平凡化截面乘 $\rho_\alpha$ 零延拓，张成复线性空间 $V$，有限维。论断：求值 $V\to\operatorname{Hom}(E_y,F_y)$ 逐点满。理由原文（`03:40-41`）："at least one partition function is nonzero there, and its multiplied frame still spans the fiber."非零常数缩放不改张成。$\mathcal V=V^q$，$\dim_{\mathbb C}V=M$、实维 $2M$。

步 2，数坏对象所在的 Grassmann 丛：固定 $(s,t)$，$\{(y,S,U):S\subset E_y,\dim S=s,\ U\subset F_y,\dim U=t\}$ 实维 $2h+2s(d-s)+2t(r-t)$。

步 3，关联丛 $\mathcal I_{s,t}$：在这个 Grassmann 丛上，从平凡丛 $\mathcal V\times(\cdot)$ 到纤维为 $\operatorname{Hom}(S,F_y/U)^q$ 的丛作限制映射。逐纤维满射的理由两句（`03:52-55`）：任何 $S\to F_y/U$ 先补成 $E_y\to F_y$（选 $S$ 的基映过去、在补空间上零），再靠步 1 的求值满性从 $V$ 里取到。目标丛复秩 $qs(r-t)$，故核丛实维
$$2M+2h+2s(d-s)+2t(r-t)-2qs(r-t).$$
要求它 $<2M$：两边减 $2M$、除 2、移项，得 $h+s(d-s)<(qs-t)(r-t)$，就是 (3.1)。论文在这里写了 "where the inequality is precisely \eqref{eq:incidence-dimension}"（`03:60-62`）。我在纸上算完这一步以后，对 (3.1) 的看法完全变了：它是核丛维数严格小于参数空间维数的**等价改写**，一点启发式余量都不是。后面第 8 节里那些 $133ms$、$(21/2)sd$ 的正数，就是这份严格性的显式付款。

步 4，投影像零测。$\pi:\mathcal I_{s,t}\to\mathcal V$ 光滑，定义域实维 $<2M$。论文不用 Sard 一般形式，用的是它自己的降维情形加一个显式 Lipschitz 立方体细分：紧坐标片上 $\pi$ Lipschitz，边长 $\delta$ 细分给 $O(\delta^{-a})$ 个原像块（$a=\dim\mathcal I_{s,t}$），每块像被 $O(\delta)$ 球覆盖，总 $2M$-体积 $\lesssim\delta^{2M-a}\to0$；"A countable exhaustion by such patches handles the possibly noncompact total space."（$\mathcal V$ 非紧。）

步 5，有限并。$\mathcal A$ 有限，坏集并仍零测，好元组存在。$\dim>t$ 的对偶写法：坏 $\iff\exists S\,\dim\sum T_iS\le t\iff\exists S\,\exists U(\dim U=t)\,\forall i:T_iS\subset U$。

几条假设的机械理由我逐条落：底空间实维写成偶数 $2h$，因为应用里底全是 $\prod\mathbb{CP}^{K_i}$，写成 $2h$ 让 (3.1) 两边的 Grassmann 维数在同一"复维"单位比较；$q\ge1$ 的作用是 $qs(r-t)$ 的 $q$ 倍放大，即"多映射共享同一目标余维"；$s$ 从 1 起（$s=0$ 时像和是 0，不可能 $>t\ge0$），$t$ 允许 0（含义是集体无公共核）；$\mathcal A$ 有限用在步 5，其实可数也够（可数并零测），论文写有限是为了不在光滑性/逐点一致性上多花笔墨，而应用里的 $\mathcal A$ 本就随 $m,R$ 有限；不等式必须严格，写 $\ge h$ 则核丛可满维、像可含内点；最后那句 "The same statement holds over a point, with $h=0$" 我一开始当修辞，读完第 8 节才知道它是小块方案的命脉，见下。

我试过的三条死路（[推测]，论文没写失败史）：不用单位分解、直接取全体光滑丛映射这个 Fréchet 空间，无穷维没有 Lebesgue 测度，步 4 报废，换成 Baire 残余集只能给"存在"而丢掉逐点同时性的稳定处理；用完整 Sard 临界值定理，需要 $C^k$ 正则性阈值并且要论证每个坏元组是临界值，工具过强，[推测] 作者自给立方体论证就是为了躲开 $k$ 的额外假设；把 $T_i$ 先验限制在"$\sum T_i^*T_i=I$"这类约束流形上做维数计数，非线性约束下求值满射与余维都失控。最后这条最有价值：它说明作者为什么把膨胀（Lemma 3.1，不管范数）与规格化（Lemma 3.2，不管拓扑）拆成两条互不相干的引理。这个解耦是方法论层面的设计。

## 7 Lemma 3.2：det-势规格化，唯一极小元用来跨标架粘合

输入输出映射个数相同，这是保住"$B$ 只用 24 个生成元"的关节（`03:86-104`）：

```tex
\begin{lemma}[Continuous normalization]
\label{lem:scaling}
Let $E,F$ be Hermitian complex vector bundles of positive ranks over a
compact manifold $Y$.  Suppose that continuous bundle maps
$T_1,\ldots,T_n:E\to F$ satisfy
\begin{equation}
  \dim_{\mathbb C}\sum_{i=1}^n T_i(y)S
  \geq 2\dim_{\mathbb C}S
  \qquad (y\in Y,\ S\subset E_y).
  \label{eq:expansion}
\end{equation}
Then there are continuous bundle maps $X_1,\ldots,X_n:E\to F$ with
\begin{equation}
  \sum_{i=1}^nX_i^*X_i=I_E,
  \qquad
  \sum_{i=1}^nX_iX_i^*\leq\frac23 I_F.
  \label{eq:scaled-bounds}
\end{equation}
\end{lemma}
```

假设 (3.2) 里是 2，结论 (3.3) 里是 $2/3$，两者中间夹着势函数里那个 $\tfrac32$。整个证明是一场变分论证，五段。

段 0，设置。逐纤维 $D_y(P)=\sum_iT_i(y)PT_i(y)^*$，$g_y(P)=\log\det(I_{F_y}+D_y(P))-\tfrac32\log\det P$，$P$ 正定。"Both determinants are intrinsic"：$\det$ 是谱不变量，酉共轭不变，所以不需要局部平凡化就能定义函数，这句是给段 3 的粘合铺路。

段 1，一致紧的下层集。先在秩 $s$ 正交投影 $p$ 上拿到 $\operatorname{ran}D_y(p)=\sum_iT_i(y)\operatorname{ran}p$，论文给的理由是"两边的正交补都是 $\bigcap_i\ker(pT_i(y)^*)$"。由 (3.2) 该像维数 $\ge2s$，于是 $\mu_{2s}(D_y(p))>0$（顺带一句 "in particular $r\ge2d$"，取 $s=d$ 就得 $F_y$ 至少 $2d$ 维，这是引理的隐含可行性条件，第 8 节里它变成 $E_{j+1}$ 秩 $\ge2d_j$ 的硬约束）。逐点正升级为一致正：特征值连续，$(y,p)$ 跑在"$Y$ 乘秩 $s$ 投影的 Grassmann 丛"这个紧空间上，取下确界得 $\epsilon_s>0$，再对 $1\le s\le d$ 取有限最小得 $\epsilon$。

一般 $P$（特征值 $\lambda_1\ge\dots\ge\lambda_d>0$）：取 $p_s$ 为顶部 $s$ 个特征向量的投影，则 $P\ge\lambda_sp_s$；$D_y$ 单调（$D_y(P_2-P_1)=\sum T_i(P_2-P_1)T_i^*\ge0$），故 $D_y(P)\ge\lambda_sD_y(p_s)$，特征值单调给 $\mu_{2s}(D_y(P))\ge\epsilon\lambda_s$。按 $(2s-1,2s)$ 配对展开 $\det(I+D_y(P))=\prod_{k=1}^r(1+\mu_k)$，每对贡献 $\ge(1+\epsilon\lambda_s)^2$，多出来的 $r-2d$ 项按 "$\ge1$" 丢弃（论文原话 discarding any remaining nonnegative terms）。于是 (3.4)：
$$\log\det(I+D_y(P))\ge2\sum_{s=1}^d\log(1+\epsilon\lambda_s).$$
令 $f(t)=2\log(1+\epsilon t)-\tfrac32\log t$。$t\to0^+$ 时 $-\tfrac32\log t\to+\infty$，$t\to\infty$ 时 $(2-\tfrac32)\log t\to+\infty$，故 $f$ 有下界 $b$。取 $C=\max_yg_y(I)$。若 $g_y(P)\le C$，则每个 $j$ 满足 $f(\lambda_j)\le C-(d-1)b$（因为其余 $d-1$ 项各 $\ge b$），而 $\{t:f(t)\le\text{const}\}$ 是 $(0,\infty)$ 内的紧区间 $[a,A]$。这里我必须补出论文省略的一句：(3.4) 用同一批 $\lambda_j$ 写了两遍（$s=j$ 那项给出 $\lambda_j$ 的贡献），所以合起来确实是 $\sum_jf(\lambda_j)$，没有重复计数漏洞。

段 2，沿正定测地线的严格凸。固定 $P_0>0$、Hermite $H\ne0$，$P(u)=P_0^{1/2}e^{uH}P_0^{1/2}$。取 $H$ 的标准正交特征基 $e_j$（特征值 $h_j$），记 $v_{ij}=T_iP_0^{1/2}e_j$，则 $D(P(u))=\sum_{i,j}e^{uh_j}v_{ij}v_{ij}^*$。Gram 行列式（Cauchy–Binet，$\det(I+CC^*)=\sum_{\text{列子集}}|\det C_{\text{sub}}|^2$）给出
$$\det(I+D(P(u)))=\sum_\alpha c_\alpha e^{u\alpha},\qquad c_\alpha\ge0,$$
$\alpha$ 跑遍被选列对应 $h_j$ 之和，$c_\alpha$ 是给出该 $\alpha$ 的各子集的 $|\det|^2$ 之和，非负。空子集给常数项 1；单元素子集给 $\sum_i\|T_iP_0^{1/2}e_j\|^2e^{uh_j}$，这个系数为正因为 $P_0^{1/2}e_j\ne0$ 且由 (3.2) 取一维 $S$ 可知 $\cap_i\ker T_i=0$。于是指数集合含 0 且含至少一个非零 $h_j$。关键分析事实：$\frac{d^2}{du^2}\log\sum_\alpha c_\alpha e^{u\alpha}$ 恰是概率测度 $\propto c_\alpha e^{u\alpha}$ 下 $\alpha$ 的方差，指数取到至少两个不同值且系数为正时严格 $>0$。而 $\log\det P(u)=\log\det P_0+u\operatorname{tr}H$ 仿射，$-\tfrac32$ 倍仍仿射。故 $g(P(u))$ 严格凸；任意两个正定元由 $H=\log(P_0^{-1/2}P_1P_0^{-1/2})$ 相连，极小元唯一。

段 3，连续性与粘合。局部酉标架下 $(y,P)\mapsto g_y(P)$ 连续，极小元同在 $\{aI\le P\le AI\}$ 内。取 $y_k\to y$、极小元 $P_k$ 的收敛子列极限 $P_\infty$：对任意固定正定 $R$ 在不等式 $g_{y_k}(P_k)\le g_{y_k}(R)$ 里取极限，得 $g_y(P_\infty)\le g_y(R)$，故 $P_\infty$ 是 $g_y$ 的极小元；唯一性迫使整列收敛到它，于是 $y\mapsto P_y$ 连续。两套标架的重叠区上，$P\mapsto UPU^*$ 且 $I+D(P)\mapsto U(I+D(P))U^*$（$T_iPT_i^*$ 里两侧标架变换正好相消），$\det$ 不变，故"极小元"的定义与标架无关，局部解粘成整体连续正定自同态 $P$。intro 的对应自述（`01:198-199`）：uniqueness makes the normalization compatible with changes of bundle frame。这一句我读了三遍才明白它为什么值得写进摘要级陈述：如果极小元不唯一，不同标架里挑出的极小元可能不重合，丛上的连续规格化根本不存在，只在局部平凡化里存在。

段 4，一阶条件与显式公式。记 $Q=I_F+D(P)$。沿 Hermite 方向 $K$ 求导：
$$\frac{d}{du}\Big|_0\log\det(Q+D(uK))=\operatorname{tr}(Q^{-1}D(K))=\operatorname{tr}\Big(\big(\sum_iT_i^*Q^{-1}T_i\big)K\Big),\qquad \frac{d}{du}\Big|_0\log\det(P+uK)=\operatorname{tr}(P^{-1}K).$$
（用了 $\operatorname{tr}(Q^{-1}T_iKT_i^*)=\operatorname{tr}(T_i^*Q^{-1}T_iK)$ 的循环性。）合并，$0=\operatorname{tr}[(\sum_iT_i^*Q^{-1}T_i-\tfrac32P^{-1})K]$ 对所有 Hermite $K$，迹配对非退化给
$$\sum_iT_i^*Q^{-1}T_i=\tfrac32P^{-1}.$$
取 $X_i=\sqrt{\tfrac23}\,Q^{-1/2}T_iP^{1/2}$，则
$$\sum_iX_i^*X_i=\tfrac23P^{1/2}\Big(\sum_iT_i^*Q^{-1}T_i\Big)P^{1/2}=\tfrac23\cdot\tfrac32\,P^{1/2}P^{-1}P^{1/2}=I_E,$$
$$\sum_iX_iX_i^*=\tfrac23Q^{-1/2}D(P)Q^{-1/2}=\tfrac23Q^{-1/2}(Q-I_F)Q^{-1/2}=\tfrac23(I_F-Q^{-1})\le\tfrac23I_F,$$
最后一步是 $Q\ge I$ 推 $Q^{-1}\le I$。

我把 $\tfrac23$ 的来历记清楚：它是 $\alpha=\tfrac32$ 的倒数；$\alpha$ 由一阶条件出现在右端，$X_i$ 前的归一化取 $\sqrt{\alpha^{-1}}$ 配平列和恰为 $I$。整个证明里唯一的放缩损失是 $I-Q^{-1}\le I$。

假设与常数的机械性（这是本节我想多写的一点）：
$\alpha=\tfrac32$ 同时决定三件事。结论行界 $1/\alpha=2/3$；必须 $\alpha<2$（假设里的膨胀率），否则 $f(t)=2\log(1+\epsilon t)-\alpha\log t$ 在 $t\to\infty$ 端不再趋于 $+\infty$：$\alpha=2$ 时 $f\to2\log\epsilon$ 常数，下层集不紧，$\alpha>2$ 时 $f\to-\infty$，段 1 与段 3 一起崩。论文自己的话（`03:116-118`）：The expansion factor 2 and the coefficient 3/2 leave a strict margin that prevents this minimizer from escaping to infinity. 一阶条件右端出现 $\alpha P^{-1}$，与 $\sqrt{\alpha^{-1}}$ 配平才把列和钉成精确的 $I_E$。若 $\alpha\le1$，行界 $\ge1$，两条关系不再互斥，迹态障碍消失。所以 $\tfrac32$ 是"$2/\alpha$ 余量严格为正、行界取干净分数"的折中。
膨胀率 2：把 $P$ 的第 $s$ 大特征值配对到 $D(P)$ 的第 $2s$ 大特征值，恰好需要像维数 $\ge2s$，所以 2 是配对方案的产物；一般 $\kappa$ 需要 $r\ge\kappa d$，行界仍是 $1/\alpha$（$\alpha<\kappa$）。
那个 "$+I_F$"：写 $\det D(P)$ 时 $D(P)$ 可奇异，$\log$ 取 $-\infty$，凸性/连续性全废；加 $I_F$ 把定义域整体保在 $\det>1$ 的光滑区，代价是行界从"$\le 1-\,$某正量"退化成一个不等式。
$Y$ 紧：$\epsilon$、$C=\max_yg_y(I)$、段 3 的子列论证都靠它。若底非紧，$\epsilon$ 可退到 0，$[a,A]$ 变成整条 $(0,\infty)$，一致界失去，连续粘合无法保证。
continuous ，并非 smooth：极小元是变分解，原则上可证正则性但没用到；$C^*$-侧只要连续。这也解释了 3.1 用 smooth、3.2 用 continuous 的差别，各取证明工具需要的那一档。

四条死路（[推测]，但强度较高）：
逐纤维独立规格化，比如 $\tilde X_i=T_i(\sum T^*T)^{-1/2}$：列和能凑成 $I$，行和是 $\sum T_i(T^*T)^{-1}T_i^*$，范数可到 $\dim E$ 量级，完全控不住 $<1$。det-势的全部价值在于一阶条件同时控制两侧，把"行和 $\le2/3$"作为变分问题的副产品逼出来。这也解释了为什么必须证唯一性：非唯一就没法跨标架粘。
用 operator scaling 的迭代格式（Gurvits 的 capacity 一系，含 Burgisser 等的算法版本）：迭代给"近似 doubly-stochastic"，而本文需要 $\sum x_i^*x_i=1$ **精确**成立（否则与行和 $\le c<1$ 的冲突消失：$1=\tau(\sum x^*x)=\tau(\sum xx^*)$ 这个等号是全篇迹障碍的第一块砖）。迭代的极限还依赖起点，不给出唯一 $P$，跨标架粘合再来一次失败。论文只引 Gurvits 的方法学（`03:78-84`）而不引格式，正是这个原因。
直接引用 Sra–Hosseini 的 $\log\det$ 凸性现成定理：文献的结论一般是对 $\log\det A(x)$（$A$ 仿射）给凸性，而这里 $\log\det$ 在正定锥上是**凹**的，方向相反；必须靠 Gram/Cauchy–Binet 展成指数和、再用"二阶导=方差"来证严格凸。论文明写 "We prove the version needed here, including the strict convexity and continuity that allow normalization over nontrivial bundles"（`03:82-84`），说明作者试过现成定理不够用。
用选择公理逐点取极小元：得到的 $y\mapsto P_y$ 一般不连续。有意思的是 Lean 的 permitted_axioms 里其实**有** `Classical.choice`，所以这条限制来自数学上的必需，不是形式化的门槛。

## 8 16 与 8：小块用点底，大块付底空间的账

现在回到 §4 的映射构造。源 $E_j$ 拆成替代块 $\bigoplus_iL_i^{\oplus(a_{i,j}/4)}$ 与新块 $L_{j+1}^{\oplus b_{j+1}}$。

小块方案（`04:147-197`）：对每个源块 $L_i^{\oplus D}$（$D=a_{i,j}$）与对应替代块 $L_i^{\oplus(D/4)}$，只取**乘度空间之间的标量矩阵**张量 $\operatorname{id}_{L_i}$。这类映射与底无关，所以在**点**上用 Lemma 3.1：$d=D$、$r=D/4$、$q=16$、$\mathcal A=\{(s,2s):1\le s\le m\}$、$h=0$。合法性两条前置（`04:152-155`）：$D\ge64m$ 给 $t=2s\le2m\le D/32<r=D/4$，以及 $r-2s\ge D/4-2m\ge\tfrac7{32}D\ge D/8$。incidence 值：
$$(16s-2s)(D/4-2s)-s(D-s)=\tfrac52sD-27s^2\ \ge\ 160ms-27ms=133ms>0.$$
一次应用同时覆盖全部 $s=1..m$，因为 $\mathcal A$ 是有限集、引理本来就吃整个 $\mathcal A$。得到的性质比需要的强一点：像维数 $>2s$ 即 $\ge2s+1$，而 (3.2) 只要 $\ge2s$（论文指出 avoiding dimension at most $2s$ gives a slightly stronger conclusion）。

这里"点底"是必要条件，并非便利，我把反例算出来了：若把小块也放到 $Y_{j+1}$ 上做，$h=\eta_j$ 那一项要由 $\tfrac52sD-27s^2$ 支付，而 $\eta_j<\tfrac{20}{3}md_j$ 中 $d_j\ge D$，$\tfrac52sD$ 在 $s\le m$ 时最大约 $\tfrac52mD$，远小于 $\tfrac{20}{3}md_j$。也就是说**目标比源小的配置只能在零维底上工作**。这个观察我在素材里没有对应段落，是自查得到的，写进第 15 节的怀疑清单以标明来源。

相关分量处理（flag 论证，`04:170-197`）：分块对角只在源向量整体落在单个块里时给膨胀；$S$ 若跨多块需另论。把源块排成 $V_1,\dots,V_K$、替代块 $F_1,\dots,F_K$，$V_{\le k}=\sum_{i\le k}V_i$，$S_k=S\cap V_{\le k}$，$W=\sum_iT_iS$，$W_k=W\cap F_{\le k}$。投影把 $S_k/S_{k-1}$ 看进 $V_k$（维数 $\le\dim S\le m$），把 $W_k/W_{k-1}$ 看进 $F_k$；分块对角给 $\sum_iT_{i,k}(S_k/S_{k-1})\subseteq W_k/W_{k-1}$，故 $\dim W_k/W_{k-1}\ge2\dim S_k/S_{k-1}$。对 $k$ 求和，两侧各是滤过的标准分解：
$$\dim W=\sum_k\dim(W_k/W_{k-1})\ge2\sum_k\dim(S_k/S_{k-1})=2\dim S.$$
论文特意补一句"This proves the required estimate even when $S$ has correlated components in several blocks."（`04:196-197`）。我在纸上证到这一步时停顿最久，因为"看起来显然"的分块对角性对跨块子空间确实不显然，而 flag 分解正好是把它救回来的最低工具。

大块方案（`04:199-229`）：源取整块 $d=d_j$，靶只取新块 $r=\tfrac{15}{4}d$，$q=8$，底是 $Y_{j+1}$（故 $h=\eta_j$），$\mathcal A=\{(s,2s):m<s\le d\}$。端点合法因 $2s\le2d<\tfrac{15}{4}d$。底空间预算先算（`04:133-140`）：
$$\eta_j=\sum_{i=1}^{j+1}K_i\le\frac43m\sum_{i=1}^{j+1}b_i=\frac53md_0(4^{j+1}-1)<\frac{20}{3}md_j.$$
第一 $\le$ 用 $K_i=\tfrac43mb_i(1-4^{-(R-i+1)})\le\tfrac43mb_i$（公比 $1/4$ 的几何级数），中间用 $\sum_{i=1}^{j+1}b_i=\tfrac54d_0(4^{j+1}-1)$，最后 $\tfrac53md_04^{j+1}=\tfrac53md_{j+1}=\tfrac{20}{3}md_j$。incidence 值：
$$(8s-2s)(\tfrac{15}{4}d-2s)-s(d-s)=\tfrac{43}{2}sd-11s^2\ \ge\ \tfrac{21}{2}sd\ >\ \tfrac{20}{3}md\ >\ \eta_j.$$
（$\ge$ 用 $11s^2\le11sd$，$\tfrac{43}{2}-11=\tfrac{21}{2}$；第一个 $>$ 用 $s>m$ 与 $\tfrac{21}{2}=10.5>\tfrac{20}{3}=6.66$。）

两组共 24 个映射 $T_i:E_j\to E_{j+1}$：$\dim S\le m$ 归第一组，$\dim S>m$ 归第二组，"adding maps cannot decrease an image span"（`04:224-225`）保证合并仍满足 (3.2)。沿 $\pi:Y\to Y_{j+1}$ 拉回（源靶本就是拉回），再对 $Y$ 用 Lemma 3.2 得连续 $X_i^{(j)}$ 满足列/行关系。论文这里补了防误读的一句："The scaling may mix the displayed line summands, but each resulting map still has source $E_j$ and target $E_{j+1}$."（`04:228-229`）我在第 4 节末尾埋的普适度声明正好在这里兑现：规格化破坏了分块对角（因为 $P$ 是 $E$ 上的自同态，可以混合线丛项），而陈类障碍不在乎。构造阶段必须保持分块对角（flag 论证的唯一来源），规格化阶段必须有自由度（变分极小），两者不能同时，所以顺序不可换。这是我读这一节得到的第二个结构性教训。

边界值分析（全部 [推测]，论文未讨论最优性）：小块的不等式 $(qs-2s)(D/4-2s)-s(D-s)>0$ 在 $s=m,D=64m$ 最紧，化成 $(q-2)\cdot14m^2-63m^2>0$，即 $q\ge7$；16 有 9 的富余。大块一般 $q$ 时左边 $=(q-2)s(\tfrac{15}{4}d-2s)-sd+s^2$，粗化到 $s\le d$、$\ge\big(\tfrac{7}{4}(q-2)-1\big)md$（我用 $r-2s\ge\tfrac74d$），要 $>\tfrac{20}{3}md$ 得 $q\ge7$。按论文的精确系数：$q=8$ 给 $\tfrac{43}{2}-11=\tfrac{21}{2}=10.5$，$q=7$ 给 $5\cdot\tfrac{15}{4}-1-11=\tfrac{27}{4}=6.75$，仍然 $>\tfrac{20}{3}=6.66$，余量只剩 $0.08$；$q=6$ 给 $4\cdot\tfrac{15}{4}-1-11=3<6.67$，崩。所以 8 是"有余量的最小整数"，7 是"余量趋零的边界"。至于为什么是 $16+8$ ，并非 $12+12$：$24=16+8$ 与两组共享同一个 $E_{j+1}$（替代块秩 $\tfrac14d_j$、新块秩 $\tfrac{15}{4}d_j$ 被 $\rho=4$ 固定）共同决定，各自允许的 $q$ 由自己的 incidence 给出；论文的官方理由只有一句 "keeps the generator count fixed"。[推测]

分界为什么取 $m$：flag 论证只需要逐块商维数 $\le m$，而小块在 $D\ge64m$ 下能安全覆盖到 $s\le D/8$，取 $m$ 与 §5 里 $M_{m,2m}$（列数 $2m$）以及 $E_0^{\oplus2m}$ 的秩对齐。[推测] 不是最优点。

续接段（`04:231-242`）：$j\ge R$ 时 $E_{j+1}=E_j\oplus E_j$，$X_1^{(j)}=2^{-1/2}\iota_1$、$X_2^{(j)}=2^{-1/2}\iota_2$、其余为 0。列和 $\tfrac12I+\tfrac12I=I$，行和 $\tfrac12I_{E_{j+1}}\le\tfrac23I$。"This continuation leaves the retained bundle in (4.4) unchanged"，因为 (4.4) 只涉及 $j\le R$。$2^{-1/2}$ 的必然性：行和要为 $\le\tfrac23$ 就必须把 $E_{j+1}$ 至少分成两份（一份时 $\lambda=1$、行界 1，违反），两份最省的标量由 $2\lambda^2=1$ 定死。

## 9 Theorem 5.1：九步，以及那个 $\|P-W\|<1/5$

陈述（`05:9-20`）：

```tex
\begin{theorem}
\label{thm:construction}
There is a separable unital complex $C^*$-algebra
$B=C^*(1,x_1,\ldots,x_{24})$ such that
\begin{equation}
  \sum_{i=1}^{24}x_i^*x_i=1,
  \qquad
  \sum_{i=1}^{24}x_ix_i^*\le\frac23\,1,
  \label{eq:algebra-relations}
\end{equation}
and $M_m(B)$ is not properly infinite for every integer $m\ge1$.
\end{theorem}
```

九步里我只详细写有内容的那几步。

步 1 到 4（装配）。对每对 $(m,R)$ 取 Prop 4.1 的数据，底改名 $Y_{m,R}$；$\mathcal H_{m,R,y}=\bigoplus_{j=0}^\infty E_j(y)$；$S_i^{m,R}(y)$ 是从 $E_j(y)$ 到 $E_{j+1}(y)$ 块为 $X_i^{(j)}(y)$ 的前向移位。一致范数界：列恒等式各项为正且和为 $I$，故每块范数 $\le1$，故每个移位 $\le1$，论文强调 "These bounds hold uniformly over all coordinates."（`05:36-37`），只有 $\ell^\infty$-积允许把无界多个坐标收成一个元素。$\mathcal D=\prod_{m,R,y}\mathcal B(\mathcal H_{m,R,y})$，$x_i=(S_i^{m,R}(y))_{m,R,y}$，$B=C^*(1,x_1,\dots,x_{24})$。

步 5（关系式核对）。列和逐坐标在每层给 $I$，"The column sum of the shifts is the identity on every level"（`05:47`）；行和进入第 0 层为 0（下面没有层），进入第 $j\ge1$ 层是 $\sum_iX_i^{(j-1)}X_i^{(j-1)*}\le\tfrac23I_{E_j}$。续接段保证每一层都满足，所以 (5.1) 在整个无穷直和上成立。漏掉续接则 $x_i$ 无界、连定义都没有。

步 6（可分）。有理复系数的 $*$-多项式可数稠密。$\mathcal D$ 不可分，可分性完全来自"有限生成"。

步 7（反证与矩形拼接）。固定 $m$，设 $M_m(B)$ 有两个正交值 isometry $s_1,s_2$，拼 $W=[s_1\ s_2]\in M_{m,2m}(B)$，$W^*W=I_{2m}$，并且 $\|W\|=1$（$\|W\xi\|^2=\langle W^*W\xi,\xi\rangle$）。

步 8（多项式逼近与下界）。取 $*$-多项式矩阵 $P$ 使 $\|P-W\|<1/5$。恒等式 $P^*P-W^*W=(P-W)^*P+W^*(P-W)$（展开核对：$P^*P-W^*P+W^*P-W^*W$）。取范数，用 $\|P\|<1+\tfrac15$：
$$\|P^*P-I_{2m}\|<\tfrac15(1+\tfrac15)+\tfrac15=\tfrac{11}{25}=0.44<\tfrac12,$$
自伴元范数 $<\tfrac12$ 推 $I+A\ge\tfrac12I$，取 $A=P^*P-I$ 得 (5.2) $P^*P\ge\tfrac12I_{2m}$。

关于 $1/5$：真正需要的是 $2\delta+\delta^2<1$，即 $\delta<\sqrt2-1\approx0.4142$；而要把结论写成干净的"一半"，需要 $2\delta+\delta^2<\tfrac12$，即 $\delta<\sqrt{3/2}-1\approx0.2247$。在简单分数里 $1/5=0.2$ 是第一个满足的（$1/4=0.25$ 失败，只给 $0.4375$）。所以 $1/5$ 是"跨过 $0.2247$"的最小简单分数；放大到 $1/4$ 矛盾照样出（任何一致正下界都够），真正崩的临界是 $\delta\ge\sqrt2-1$，崩在 $P_0$ 在某些纤维失去单射、像的秩跳、不再是连续子丛。$\tfrac12$ 本身在拓扑障碍里零敏感度，它只是"$>0$"的具象化。

步 9（对角化与矛盾）。顺序关键："After fixing this approximation, choose $R\ge1$ at least the length of every word occurring in its entries. We use the coordinate family belonging to the already constructed test $(m,R)$."（`05:77-79`）词传播：$S_i$ 抬一层，$S_i^*$ 降一层而"an adjoint applied at level zero gives zero"，$1$ 保层，所以从 0 层出发、长度 $\le R$ 的任何词停在层 $0..R$。于是限制 $P(y)\iota_0=\iota_F P_0(y)$，$P_0:E_0^{\oplus2m}\to F_{m,R}:=(\bigoplus_{j=0}^RE_j)^{\oplus m}$。连续性：$P_0$ 的块是 $X_i^{(j)},(X_i^{(j)})^*$（$j<R$）的有限复合与和；论文补 "This description is intrinsic to the bundles; no simultaneous trivialization of the Hilbert fibers or continuity between different tests is required."（`05:95-96`）以及 "The continuation beyond level $R$ does not enter these compositions."（`05:97`）。坐标求值是 $*$-同态，故 (5.2) 在坐标 $(m,R,y)$ 仍成立，压缩到 0 层输入（$\iota_0$ 等距）给 $P_0(y)^*P_0(y)\ge\tfrac12I$ 对一切 $y$。极分解用 §2 末尾那段无编号观察（`02:49-59`）：$W^*W$ 可逆时 $Q=W(W^*W)^{-1/2}$、$Q^*Q=I$、像不变、$QQ^*$ 是连续正交投影；这里 $(P_0^*P_0)^{-1/2}$ 的一致界来自 $\tfrac12$。于是 $\operatorname{ran}Q$ 是 $F_{m,R}$ 的连续子丛，同构于 $E_0^{\oplus2m}$，而 $E_0$ 平凡，故它是秩 $2md_0$ 的平凡子丛，与 (4.4) 矛盾。$m$ 任意。

那段无编号观察的机制我补一句：逐纤维 $W_y$ 单射（因 $W_y^*W_y$ 正定），像相同（右乘可逆不改像），$Q_yQ_y^*$ 是到像的正交投影；连续性来自 $T\mapsto T^{-1/2}$ 在正定锥上连续加 $\|(W^*W)^{-1/2}\|\le\delta^{-1/2}$ 的一致界，这个一致界才是"像丛连续"的真正来源。若不写极分解、只说"逐纤维单射的连续丛映射的像是子丛"，在缺一致下界时是错的（像维数可跳）。论文写 if $W^*W$ is invertible ，并非 pointwise injective，说明作者知道这一节需要在哪儿下锚。

三条死路：(1) 不近似、直接对 $W$ 做丛限制：$W$ 是 $B$ 的一般元素（连续函数，并非多项式），限制后的靶跑到无穷多层，$P_0$ 不落在任何有限 $F_{m,R}$ 里，陈类记账无从谈起。(2) 把靶取到 $\bigoplus_{j\ge0}E_j$ 整体：$j>R$ 是纯 doubling 填充，(4.4) 不覆盖它，高次陈类也不存在（$p=\sum_iK_i$ 只到 $R$ 级）。所以"词长 $\le R$ ⟹ 不出窗口"这条传播性质是截断的唯一依据，Figure 1 画的就是这个窗（caption 原话含 "The continuation after level $R$ does not affect this test"，以及排版注 "When $R=1$, the labels $E_1$ and $E_R$ denote the same level"）。(3) 想要 $B$ 单：$B$ 作为 $\mathcal D$ 的可分子代数几乎肯定有巨大闭理想（例如在某个坐标子集上为零的压缩），而 (i) 需要的单性来自 $AW^*$-因子，论文在 `01:132-133` 主动放弃了用 $B$ 证 (iii) 的单性。

## 10 把两条关系兑换成一对定量的缺陷（Lemma 5.2）

第 9 节收束时我手里有两样东西。一样是代数 $B$，24 个生成元 $x_1,\ldots,x_{24}$ 满足 (5.1)：列和恰为 $1$，行和 $\le\frac23$。另一样是"$M_m(B)$ 对每个 $m$ 都不适当无穷"。这两样各自离反例还差一步。第二样的下一步是 Theorem 2.1 的直接调用，没有技术含量。第一样的下一步才是真正需要设计的：我要一对具体的正压缩元 $a,b$，使得 $A$ 上**每一个**规格化 2-拟迹在 $(a,b)$ 上的可加性缺陷都有同一个下界。Lemma 5.2 就是这一步，而且它跟前面的丛构造完全脱钩，是全文唯一一个能整节搬去别的论文里用的模块。

原文陈述（`05:130-147`）：

```tex
\begin{lemma}
\label{lem:defect}
Let $B$ be a unital complex $C^*$-algebra, let $N\ge1$, and suppose
$x_1,\ldots,x_N\in B$ satisfy
\[
  \sum_{i=1}^N x_i^*x_i=1,
  \qquad
  \sum_{i=1}^N x_ix_i^*\le c1
  \quad\text{for some }0\le c<1.
\]
There are positive contractions $a,b\in M_{2N}(B)$, determined by this
tuple, such that every normalized $1$-quasitrace $\tau$ on $M_{2N}(B)$
satisfies
\begin{equation}
  \tau(a+b)-\tau(a)-\tau(b)\ge\frac{1-c}{2N}.
  \label{eq:uniform-defect}
\end{equation}
\end{lemma}
```

前置声明（`05:125-127`）："The passage from the two relations to a specified positive pair is useful independently of the construction. It requires only the $1$-quasitrace axioms once a quasitrace on the matrix algebra is given."

读第一遍时我把它当成记账练习，准备跳过。停下来重读是因为一句"$determined by this tuple"：$a,b$ 完全由生成元组写出，没有任何选择、没有依赖 $\tau$、没有依赖 $B$ 的其他性质。这意味着缺陷下界是**构造给出的代数常量**，并非对某个特定拟迹做的估计。主定理要的正是这种强度。

### 10.1 记号与两条关系的读数

$$u_i=x_i^*x_i,\quad v_i=x_ix_i^*,\quad H_i=\sum_{j=1}^i u_j,\quad J_i=\sum_{j=1}^i v_j,\quad H_0=J_0=0.$$

列关系说 $H_N=1$；行关系说 $0\le J_N\le c\,1$。注意这两句话的地位极不对称：一个是**等式**，一个是**严格不等式**（$c<1$）。整个引理就是把这种不对称兑换成数量。$u_i$ 与 $v_i$ 逐个配对相等是公理 (i) 唯一能提供的信息，而 $\{u_i\}$ 内部两两不交换，所以 $\sum u_i$ 上的可加性永远拿不到。设计的全部难度就在这里。

### 10.2 缺陷对的显式形状（式 5.5）与正压缩元核对

```tex
  a&=\operatorname{diag}
      (H_0,\ldots,H_{N-1},\,1-J_0,\ldots,1-J_{N-1}),\\
  b&=\operatorname{diag}
      (u_1,\ldots,u_N,\,1-v_1,\ldots,1-v_N).
```

$2N$ 个 $B$-值对角块，前段 $N$ 个用"部分和 $H_{i-1}$ 配 $u_i$"，后段 $N$ 个用"补元 $1-J_{i-1}$ 配补元 $1-v_i$"。逐块相加：

- 前段第 $i$ 块：$H_{i-1}+u_i=H_i$。
- 后段第 $i$ 块：$(1-J_{i-1})+(1-v_i)=2-J_i$。

正压缩元核对（`05:168-169`）需要逐条走：部分和递增（$u_j\ge0$）给 $0\le H_i\le H_N=1$，故每个 $H_{i-1}$、每个 $u_i$（$0\le u_i\le H_N=1$）都落在正单位球内；同理 $0\le J_i\le J_N\le c1$、$0\le v_i\le c1$，于是 $1-J_{i-1}\ge(1-c)1>0$、$1-v_i\ge(1-c)1>0$，且它们 $\le1$。对角元的范数是块范数的最大值，所以 $\|a\|\le1$、$\|b\|\le1$。

这里我最初想把后段直接写成 $-J_{i-1}$ 配 $-v_i$，让两段望远镜同号。核对立刻否决：$-J_{i-1}$ 是负元，$a$ 就不再是正元，主定理陈述里的 PositiveContraction 条件直接破掉。**"后段用补元 $1-J$"唯一的作用就是保正性**，代价是引入一堆标量 $1$，而标量的处理要靠 10.4 的 abelian 限定。

### 10.3 把 $2N$ 个角统一到一个泛函

固定 $M_{2N}(B)$ 上的规格化 1-拟迹 $\tau$，记 $\iota_k(z)$ 为把 $z$ 放在第 $k$ 个对角角、其余为 $0$。定义 $\varphi(z):=\tau(\iota_1(z))$。对 $z\ge0$ 取 $t$ 为在 $(k,\ell)$ 位置放 $z^{1/2}$、其余为 $0$ 的矩阵元，则

$$t^*t=\iota_\ell(z),\qquad tt^*=\iota_k(z).$$

矩阵单位的共轭把 $(k,\ell)$ 换到 $(\ell,k)$，而 $z^{1/2}$ 自伴，所以两个乘积都落在对角线上。由公理 (i)：$\tau(\iota_k(z))=\tau(\iota_\ell(z))$；取 $\ell=1$ 得

$$\tau(\iota_k(z))=\varphi(z)\qquad(z\ge0,\ 1\le k\le2N).$$

这一步只用 (i)，一步就把 $2N$ 个角全部并成一个定义在 $B_+$ 上的泛函。我在推演时反复确认过它不需要 $\tau$ 线性，甚至不需要 (iii)，因为搬运发生在**矩阵代数内部**，被搬运的对象是单块矩阵单位。这是"非交换性被矩阵单位吸收"的确切含义。

### 10.4 对角可加性与 $\varphi(1)=\dfrac1{2N}$，以及 $\varphi(u_i)=\varphi(v_i)$

支撑在不同对角角的自伴元两两相乘为 $0$，因此它们与 $1$ 一起生成一个 abelian $C^*$-子代数；公理 (iii) 在这个子代数上给复线性，于是对 $z_k\ge0$：

$$\tau(\operatorname{diag}(z_1,\dots,z_{2N}))=\sum_{k=1}^{2N}\varphi(z_k).$$

取所有 $z_k=1$，左边是 $\tau(1_{M_{2N}(B)})=1$（规格化），右边是 $2N\varphi(1)$，故

$$\varphi(1)=\frac1{2N}.\tag{5.6}$$

这就是第 2 节里我补的那步 $\sigma(1_{M_2(C)})=2$ 的 $2N$ 角版本，只是那里是"两个角相加得 $2$"，这里是"角数除以规格化得倒数"。

第二个等式（5.7）把平方公理用在**第一个角内部**：取 $t$ 只在 $(1,1)$ 块里等于 $x_i$，则 $t^*t=\iota_1(u_i)$、$tt^*=\iota_1(v_i)$，由 (i)：

$$\varphi(u_i)=\varphi(v_i).\tag{5.7}$$

我把 (5.7) 称为全引理的"唯一通道"。列关系和行关系分别只给出 $H_N$ 与 $J_N$ 的信息，两者住在 $B$ 里两两不交换的元素上，本来毫无关系。(5.7) 逐个配对地告诉我不交换的 $u_i$ 之间和 $v_i$ 之间的差异"在 $\varphi$ 眼里可以互相替换"，其余什么都没说。

### 10.5 逐块缺陷、望远镜，以及一个容易被跳过的限定语

前段第 $i$ 块的标量缺陷是 $\varphi(H_i)-\varphi(H_{i-1})-\varphi(u_i)$；后段第 $i$ 块是

$$\varphi(2-J_i)-\varphi(1-J_{i-1})-\varphi(1-v_i)=-\varphi(J_i)+\varphi(J_{i-1})+\varphi(v_i).$$

这里每一次把 $\varphi(\alpha\cdot1-X)$ 拆成 $\alpha\varphi(1)-\varphi(X)$ 都是**标量平移**，只在 abelian 子代数 $C^*(1_B,X)$（$X$ 为 $J_i$ 或 $v_i$，自伴）内使用线性。论文专门点明这一点（`05:207-209`）：

> "Here each scalar-translation identity is taken within the abelian algebra generated by the corner identity and the indicated self-adjoint element. Thus these equalities use no additivity on noncommuting elements of $B$."

我之前把这句当成作者的谨慎废话，直到自己试着对**两个不同**的非交换元素写 $\varphi(X+Y)=\varphi(X)+\varphi(Y)$，才发现拆不动。所以每一步都只能在单个自伴元素加上单位张成的代数里活动。这也解释了后段为什么必须写成 $2-J_i$ 这种"标量减元"的形状：望远镜里的每一项都是"标量 $\alpha$ 与单个自伴元 $X$"的组合，标量平移在 abelian 范围内合法，而如果我把后段设计成两个 $B$-元素的和（例如 $H$ 与 $J$ 混在同一块），拆不动。

把 $2N$ 个块的缺陷求和，$H_0=J_0=0$、$H_N=1$ 使两组望远镜各自塌缩：

$$\tau(a+b)-\tau(a)-\tau(b)=\Big[\varphi(H_N)-\sum_i\varphi(u_i)\Big]+\Big[-\varphi(J_N)+\sum_i\varphi(v_i)\Big]=\varphi(1)-\varphi(J_N),$$

中间用 (5.7) 把 $\sum\varphi(u_i)$ 与 $\sum\varphi(v_i)$ 逐项抵消。我要强调最后这一步给出的**是等式**，并非不等式：缺陷精确等于 $\varphi(1)-\varphi(J_N)$，放缩要到下一步才发生。这个"先精确等式、再单次放缩"的结构是引理干净的原因，也是它可复用性的来源。

### 10.6 最后的放缩

$\varphi$ 限制到 abelian 子代数 $C^*(1,J_N)\subseteq B$ 是正线性泛函（10.3 与 10.4 的产物），而 $0\le J_N\le c\,1$ 在该子代数里是序关系，故 $\varphi(J_N)\le c\varphi(1)$。于是

$$\tau(a+b)-\tau(a)-\tau(b)\ \ge\ \varphi(1)(1-c)=\frac{1-c}{2N}.\qquad\blacksquare$$

全篇常数的汇聚点就在最后这个式子里：$(1-c)/(2N)$，代入 $c=\frac23$（来自 Lemma 3.2 的 $\frac32$）、$N=24$（来自 Prop 4.1 的 $16+8$），得 $\tfrac{1/3}{48}=\tfrac1{144}$。

### 10.7 逐条常数理由

- **为什么是 $2N$ 个角，不是 $N$ 个**：后段的补元必须与前段并列而不能同处一角（同一角放不下 $H_{i-1}$ 和 $1-J_{k-1}$），且 10.3 的跨角搬运依赖角之间互不干涉。反过来若放大到 $4N$ 角，规格化使 $\varphi(1)=1/(4N)$，缺陷 $(1-c)/(4N)$ 更弱。所以 $2N$ 是最小可行也是最优尺寸，$A=M_{48}(B)$ 的尺寸由这里被钉死。
- **$\varphi(1)=1/(2N)$ 定死了放缩方向**：缺陷 $=\varphi(1)(1-c)$ 意味着想放大它只能减小 $N$ 或减小 $c$，两者都由上游决定，我在第 13 节的常数表里标了这条是"全篇最脆的一个数"。
- **前段配 $u_i$、后段配 $1-v_i$ 的符号设计**：前段望远镜给 $+\varphi(H_N)-\sum\varphi(u_i)$（用列关系 $H_N=1$），后段给 $-\varphi(J_N)+\sum\varphi(v_i)$（负号来自补元）。若两段同号，望远镜会留下混合项 $\varphi(1)-\varphi(J_N)+2\sum\varphi(v_i)$ 之类无法化简的东西；若后段不用补元，正性失败。**补元与负号是双向耦合**，改动任一处另一处就不成立。
- **$0\le c<1$**：$c<1$ 保证正的缺陷；$c=0$ 形式上给最大缺陷 $\frac1{2N}$，但 $c=0$ 意味 $\sum v_i=0$，由 $v_i\ge0$ 得全部 $x_i=0$，与 $\sum x^*x=1$ 矛盾，所以 $c=0$ 不可达，论文写下区间只是让陈述形式化；$c\ge1$ 时结论变成空话，也不再与"存在迹态"矛盾。
- **$a,b$ 落在正单位球**：让反例是"有界、定量"的，而不只是"存在某对元素使 $\tau$ 不可加"。这也让 Lean 侧能用 `PositiveContraction` 谓词直接表达（见第 14 节）。
- **只对 1-拟迹陈述**：引理**不需要** 2-延拓假设。这解释了 `01:209-211` 那句"This last step works for every normalized \(1\)-quasitrace on \(A\), hence for every normalized \(2\)-quasitrace there"。$A$ 上哪怕只有 1-拟迹、不含任何 $M_2$ 延拓信息，也必须非可加。$M_2$-延拓的全部用量都集中在存在性一侧（Theorem 2.1 输出 2-拟迹）。这条公理用量分析是我认为本节最值得记的东西：反例的强度其实**高于**主定理的陈述。
- **"$\tau$ 定义在 $M_{2N}(B)$ 上"是实质量化**：10.3 的跨角搬运要求 $\tau$ 能在矩阵代数上用 (i)。只有 $B$ 上的 1-拟迹时跨角完全不可用，所以引理不是"随便哪个代数上的拟迹"，它需要拟迹已经在矩阵代数上。

### 10.8 我试过的四条死路

1. **直接取 $a=u_1$、$b=\sum_{i\ge2}u_i$**：$\tau(a)+\tau(b)$ 里的 $\tau(b)$ 拆不动，$\{u_i\}$ 两两不交换使 (iii) 不适用，(i) 只能逐个给 $\tau(u_i)=\tau(v_i)$ 而不给和的可加性。缺陷算不出来。这里我学到的教训是：不可加性必须藏在**能被矩阵单位吸收**的地方，也就是对角矩阵的角之间，并非藏在 $B$ 内部的不交换乘积里。
2. **只用前段、单独望远镜**：$\varphi(H_N)-\sum\varphi(u_i)=\varphi(1)-\sum\varphi(u_i)$，要往下走必须把 $\sum\varphi(u_i)$ 认成 $\varphi(\sum u_i)=\varphi(1)$，而这正是 (iii) 覆盖不到的场景。所以后段的存在不是装饰，它是**唯一能把 $\sum\varphi(u_i)$ 换成 $\sum\varphi(v_i)$、再由行关系接住**的通道。
3. **想要分母 $N$**：那要 $\varphi(1)=1/N$，即角数减半，于是前段与后段共用角，10.2 的正性与 10.3 的搬运同时坏掉。分母 $2N$ 是"用规格化换可加性"的价格，没有别的算法。
4. **允许任意自伴元而不要求正压缩**：缺陷会因 $\tau(h+ik)$ 型线性公理被"归一化掉"（把 $a$ 换成 $a+\lambda1$ 直接改变缺陷符号），陈述反而变弱。论文选择正锥内的定量版本是最强可读形式。这条属于我的判断，论文未述。

## 11 六句话把整篇收口（06-conclusion.tex）

前面十一节的量在这里兑换成六句话。原文全文（`06:1-15`）：

```tex
\Needspace{8\baselineskip}
\begin{proof}[Proof of Theorem~\ref{thm:main}]
Theorem~\ref{thm:construction} supplies the separable unital algebra
\(B\), generated by twenty-four elements satisfying
\eqref{eq:algebra-relations}, with no properly infinite matrix
algebra over it. Consequently the same is true of \(A=M_{48}(B)\),
because \(M_k(A)\cong M_{48k}(B)\) for every \(k\).
Theorem~\ref{thm:existence} gives a normalized \(2\)-quasitrace on \(A\).

Apply Lemma~\ref{lem:defect} with \(N=24\) and \(c=2/3\).
It supplies positive contractions \(a,b\in A\) for which every
normalized \(2\)-quasitrace has defect at least
\((1-c)/(2N)=1/144\). Matrix amplification preserves separability
and unitality, so all assertions of Theorem~\ref{thm:main} follow.
\end{proof}
```

先说一个我起初以为是排版错误的东西：**06 这个文件里没有 `\section` 命令**。`paper.tex` 的输入顺序是 05、06、07，于是这段证明排在 §5 之后而占在 §5 的排版区间里，不占用定理编号；`06:1` 的 `\Needspace{8\baselineskip}` 是防跨页断排的指令。文件名叫 conclusion，真正的结论节却是 07（"Tensor products and stable finiteness"，编号 Section 6）。[推测] 这是稿件组装遗留的安排，作者把主定理证明推迟到构造之后，好让 §5 独立成篇。我记下这条，因为依赖图里"Theorem 1.1 的证明在第 5 节之后才出现"这件事会影响阅读顺序：读者要到最后一刻才知道存在性与缺陷估计如何拼起来。

### 11.1 六句的逐句用量

1. "$B$ 可分、有单位、由 24 个元素生成、满足 (5.1)、且其上无适当无穷矩阵代数"：这是 Theorem 5.1 的全部输出打包成一句。
2. "$M_k(A)\cong M_{48k}(B)$"、"$A$ 上同样无适当无穷矩阵代数"：标准同构 $M_k(M_n(B))\simeq M_{kn}(B)$。我要核对的是量词覆盖：$A$ 需要"每个 $k$ 的 $M_k(A)$ 不适当无穷"，经同构变成"每个 $k$ 的 $M_{48k}(B)$ 不适当无穷"，而 Theorem 5.1 给的是"每个 $m$"，$48$ 的倍数是其子集，所以覆盖足够，无需触碰非 $48$ 倍数的 $B$-矩阵尺寸。这一步是纯逻辑的，但漏掉它就会以为需要把 §3 至 §5 重做到 $48$ 的倍数以外。
3. "Theorem 2.1 给出 $A$ 上的规格化 2-拟迹"：把上一句的条件喂给存在定理的 ⟸ 方向。至此主定理的"admits a normalized 2-quasitrace"完成。
4. "Apply Lemma 5.2 with $N=24$、$c=2/3$"：$a,b\in M_{48}(B)=A$ 是正压缩元，且 $M_{48}(B)$ 上每个规格化 1-拟迹缺陷 $\ge\tfrac{1/3}{48}$。
5. "$M_{48}(B)=A$"，所以"$A$ 上每个规格化 1-拟迹"成立；而 2-拟迹首先是 1-拟迹（定义 2 第一句，`02:14-15`），故结论对"每个规格化 2-拟迹"成立。这一句是全文唯一一处把 2-拟迹的定义往回用。
6. "Matrix amplification preserves separability and unitality"：$M_{48}(B)$ 可分（有限积取有理系数矩阵元即稠密）、有单位。主定理全部断言清点完毕。

$\tfrac{1/3}{48}=\tfrac1{144}$ 的算术：$2N=48$，$1-c=1-\frac23=\frac13$，$\frac{1/3}{48}=\frac1{144}$。常数链条完整回溯是

$$16+8=24\ \xrightarrow{\text{Lemma 5.2}}\ 2N=48\ \xrightarrow{\ c=\frac23\ }\ \frac{1-c}{2N}=\frac{1/3}{48}=\frac1{144},$$

其中 $16+8$ 来自 Prop 4.1 的小块与大块分工，$c=\frac23$ 来自 Lemma 3.2 里势函数系数 $\frac32$ 与展开倍数 $2$ 之间的余量。全篇没有任何一个数字是自由参数。

### 11.2 这段证明没有用到什么

我认为这一栏比用到了什么更有信息量。没有用到 $\tau$ 的任何具体公式（`01:206-211` 明写"requires no formula for a chosen quasitrace"）；没有用到 2-延拓在缺陷估计里的作用（第 5 步只是"$2$-拟迹 $\Rightarrow$ 1-拟迹"这个方向）；没有用到确切性、单性、表示（Theorem 2.1 本身无这些假设，`02:46-47`）；没有用到 $B$ 的理想格、归纳极限结构、$K$-理论（$K_i>0$ 只是中间量）。

### 11.3 收口时的三条死路

1. **令 $A=B$**：缺陷对天然住在 $M_{2N}(B)$。不放大矩阵代数就没有现成的 $(a,b)$，只能退回"存在某个 2-拟迹不是迹"的非定量陈述，同时丢掉 $1/144$ 与"对所有拟迹一致"两条强度。
2. **显式给出一个 2-拟迹**：$A$ 必然非确切（`01:94-95`，Haagerup 定理的反向推论），并非确切世界的显式拟迹在文献里没有可用手段。Theorem 2.1 是唯一的存在性通道，代价是必须证"所有矩阵代数都不适当无穷"，也就是 §3 至 §5 的全部工作量。这就是本论文"绕远"的根本原因。
3. **先在 $B$ 上用 Theorem 2.1、再放大拟迹**：$\tau\mapsto\operatorname{Tr}\otimes\tau$ 的放大要求 $\tau$ 是**迹**才有线性；拟迹不线性，张量积放大不成立。所以顺序必须是"先放大代数、再在放大后的代数上调用存在定理"，不能反过来。论文没写这句，但它是依赖图里 Theorem 2.1 用在 $A$ ，并非 $B$ 上的原因。我判断这条死路的机制是确定的（[推测] 强度较高）：`01:206` 的 "set \(A=M_{48}(B)\) and apply Theorem~\ref{thm:existence} **directly** to \(A\)"，那个 directly 像是有意强调。

## 12 推论的三条外溢（07-consequences.tex，Section 6）

主定理到手后，作者立刻把它转成三个算子代数圈里更好读的失败命题。这一节的技术含量低、口径要求高，因为三条断言用的**是三个不同的代数**，混用就会说出错的断言。

### 12.1 两栏"输入登记"

因子输入（`07:9-21`），原样保留：

```tex
The assertion that every normalized \(2\)-quasitrace on every unital
\(C^*\)-algebra is a tracial state is equivalent to the assertion that
every \(AW^*\)-factor of type \(\mathrm{II}_1\) is a \(W^*\)-algebra;
see \cite[Section~2]{MR} and \cite[Theorem~4.11]{Gow}.
Every such factor admits
a normalized \(2\)-quasitrace, and it admits a tracial state exactly
when it is a \(W^*\)-algebra \cite[Section~2]{MR}. A finite
\(AW^*\)-factor is simple as a \(C^*\)-algebra
\cite[Remark~2.7]{Gow}. For a simple unital \(C^*\)-algebra, absence of
stable proper infiniteness is equivalent to stable finiteness
\cite[Section~2]{MR}. These statements impose no separability condition
on the factor.
```

张量积输入与 $\mathbb F_\infty\to\mathbb F_2$ 的降级（`07:23-45`）：

```tex
Haagerup's trace-obstruction theorem, in the properly infinite
formulation recorded by Milh{\o}j and R{\o}rdam
\cite[Theorem~3.1]{MR}, says that a unital \(C^*\)-algebra \(D\) has no
tracial state if and only if
\(D\otimes_{\min}C_r^*(\mathbb F_\infty)\) is properly infinite.
Haagerup notes that the subgroup inclusion
\(\mathbb F_\infty\hookrightarrow\mathbb F_2\) induces a unital
inclusion \(C_r^*(\mathbb F_\infty)\hookrightarrow C_r^*(\mathbb F_2)\)
\cite[Remark~2.5(a)]{Haagerup}. The minimal tensor product preserves
injective \(*\)-homomorphisms, so it gives a unital inclusion
\[
D\otimes_{\min}C_r^*(\mathbb F_\infty)
\hookrightarrow D\otimes_{\min}C_r^*(\mathbb F_2).
\]
The two isometries witnessing proper infiniteness retain their relations
under this inclusion. Consequently,
\begin{equation}
 D\text{ has no tracial state}
 \quad\Longrightarrow\quad
 D\otimes_{\min}C_r^*(\mathbb F_2)\text{ is properly infinite}.
 \label{eq:traceless-tensor}
\end{equation}
```

(6.1) 值得单独说一句。$\mathbb F_\infty\hookrightarrow\mathbb F_2$ 是经典事实（$\mathbb F_2$ 到 $\mathbb Z$ 的规约同态的核是无穷秩自由群），所以"用 $\mathbb F_2$"在生成元个数上是**降低**、在结论强度上也是降低（更大的张量积包含在更小的里，适当无穷性往上继承）。intro（`01:22-24`）的措辞是"can be properly infinite with one factor equal to … \(C_r^*(\mathbb F_2)\)"，语气是"能压到两个生成元"。

### 12.2 (i)：两个单稳定有限代数，极小张量积适当无穷

1. 主定理为假 ⟹ "每个规格化 2-拟迹都是迹态"这条命题被否证。
2. 因子输入第一句（等价性）⟹ 存在 type $\mathrm{II}_1$ 的 $AW^*$-因子 $M$ **不是** $W^*$-代数。
3. 因子输入第二句的后半（"admits a tracial state exactly when it is a $W^*$-algebra"）⟹ $M$ 无迹态。
4. Gow Remark 2.7（有限 $AW^*$-因子作为 $C^*$-代数单）⟹ $M$ 单。
5. $M$ 有规格化 2-拟迹（因子输入第二句前半），由 Theorem 2.1 的 ⟹ 方向排除稳定适当无穷（论文 `07:51-52`："Theorem~\ref{thm:existence} therefore excludes stable proper infiniteness"）。注意这里用掉的是**必要性方向**，与 §5 的存在性方向相反。
6. 因子输入第五句（单 + 有单位下"无稳定适当无穷"⟺"稳定有限"）⟹ $M$ 稳定有限。
7. $R=C_r^*(\mathbb F_2)$：Powers 定理给单性；典范迹态 faithful（论文直接陈述，并说"as are the matrix traces induced by it"）；faithful 迹排除非酉 isometry：若 $s^*s=1$、$ss^*\ne1$，则 $1-ss^*\ge0$ 非零，faithful 给 $\tau(1-ss^*)>0$，但 $\tau(ss^*)=\tau(s^*s)=1=\tau(1)$，矛盾。故 $R$ 稳定有限、有单位。
8. (6.1) 用于 $D=M$ ⟹ $M\otimes_{\min}R$ 适当无穷。(i) ✓

Theorem 2.1 在这一小节被用了两次而本文在其他地方也用两次，两个方向恰好相反，这是我在依赖图上标过的关键结构。

### 12.3 (ii)：拟迹在张量积上丢失

1. 取 Theorem 5.1 的显式 $B$（可分、有单位）。
2. 无矩阵代数适当无穷 ⟹ Theorem 2.1（⟸）⟹ $B$ 有规格化 2-拟迹。
3. 关系式 (5.1) 排除迹态：若有迹态 $\sigma$，则 $1=\sigma(\sum x_i^*x_i)=\sigma(\sum x_ix_i^*)\le\frac23\sigma(1)=\frac23$，矛盾（`07:65-66`："applying one to their two sums would give \(1\le2/3\]"）。**这一步是 (5.1) 在全文第二次独立发挥作用**：第一次是 Prop 4.1 的拓扑测试要它，第二次是这里让它直接否决迹态，一行算术。
4. (6.1) 用于 $D=B$ ⟹ $B\otimes_{\min}R$ 适当无穷。
5. Theorem 2.1 的必要方向取逆否：$M_1(B\otimes R)$ 自身已适当无穷 ⟹ $B\otimes_{\min}R$ 无规格化 2-拟迹 ✓

(ii) 的独立意义我用自己的话说：稳定有限性在张量积下不保持是 Milhøj–Rørdam 问题的原形，而这里失败得更彻底，连"存在拟迹"这种弱得多的性质都不保持。论文在 intro 里把它作为 (ii) 单列，是有意的加强。

### 12.4 (iii)：可分、稳定有限、无迹态

1. $M$ 无迹态 ⟹ Haagerup 有限迹障碍判据（`07:72-78`，引 `\cite[Lemma~2.1]{Haagerup}`）给出 $y_1,\dots,y_n\in M$：
$$\sum_{i=1}^ny_i^*y_i=1,\qquad \Big\|\sum_{i=1}^ny_iy_i^*\Big\|<1.$$
2. $C=C^*(1,y_1,\dots,y_n)\subseteq M$：有限生成 ⟹ 可分；有单位。
3. **继承稳定有限**（`07:80-82`）："an isometry in $M_k(C)$ is an isometry in $M_k(M)$, hence is unitary there and therefore already unitary in $M_k(C)$." 三步链条：包含是 $*$-同态故保持 $s^*s=1$；$M_k(M)$ 稳定有限（(i) 第 6 步产物）故其中 isometry 是酉；酉关系 $s^*s=ss^*=1$ 只涉及 $s$ 自身，故在 $M_k(C)$ 内也是酉。
4. 无迹：若 $\tau$ 是 $C$ 上的迹态，$1=\tau(\sum y_i^*y_i)=\tau(\sum y_iy_i^*)\le\|\sum y_iy_i^*\|<1$，矛盾。第一个等号用迹性与规格化，不等号用正线性泛函在正元上不超过范数。
5. 不宣称单（`01:132-133`）：$C$ 只是 $M$ 的有限生成子代数。

### 12.5 为什么三条断言要用三个不同代数

这是我在读 §6 时反复回去看的地方，答案在 `07:20-21` 那句"These statements impose no separability condition on the factor."。把三条断言的需求列成表，代数分配就变成唯一解：

| 断言 | 需要 | 提供的代数 | 放弃的性质 |
|---|---|---|---|
| (i) | 两因子都**单**且稳定有限 | $AW^*$-因子 $M$ + $C_r^*(\mathbb F_2)$ | $M$ 的可分性（且不声明它是 $W^*$-代数） |
| (ii) | **显式**可分代数，且拟迹丢失 | $B\otimes_{\min}R$ | 张量积的稳定性（它适当无穷，正是结论） |
| (iii) | **可分**、稳定有限、无迹 | $M$ 的有限生成子代数 $C$ | 单性 |

$M$ 给不了可分，$B$ 给不了单性与稳定有限，$C$ 给不了单性。三条各取所需，代价各写在各自主定理的限定语里（`01:126-133`）。这也解释了主定理为什么必须同时含 (i)(ii)(iii) 三条：任何单条都不覆盖另外两条的需求，而反例对象 $A$ 只在 (ii)(iii) 的机制层面被复用。

顺带一个我确认过两遍的书写细节：$C=C^*(1,y_1,\dots,y_n)$ 里的"$1$"是冗余的（由 $\sum y_i^*y_i=1$ 确有 $1\in C^*(y_1,\dots,y_n)$），§5 里 $B=C^*(1,x_1,\dots,x_{24})$ 同样冗余。两处一致，像作者的书写习惯，也可能与 Lean 侧 `generatedAlgebra (Set.range x)` 需要显式给出生成集有关（第 14 节）。

### 12.6 边界声明（作者主动划出的范围）

素材 §3.2 做过全库正则检索，论文里**没有** "we cannot"、"it is unclear whether"、"remains open" 这类句式，自我设限全部通过限定语完成。我把与本节直接相关的几条并在这里：`01:126-129`（(i) 的因子无可分性断言）、`01:129-131`（"we prove that no matrix algebra over \(B\) is properly infinite, not that \(B\) is stably finite"）、`01:131-133`（(iii) 无单性断言）、`01:133-135`（§6 只是"short deductions"）、`02:28-29`（"Absence of stable proper infiniteness is the condition needed below; no assertion about finiteness of every projection is required"）。

第 2.4 条与第 2.2 条的差别我要说清楚，因为它决定了 $B$ 这一支的强度上限。"无矩阵代数适当无穷"在**单**代数上等价于稳定有限，在一般代数上严格弱（可能存在无限但非适当无穷的投影）。$B$ 不单，所以论文只声明前者；而 (ii) 的用法恰好评判的是"适当无穷"这一侧（$M_1(B\otimes R)$ 自身适当无穷），所以这个弱化没有造成任何损失。这是"声明得刚好够用"的一个范例：`02:28-29` 那句限定语属于精确的用量登记，姿态上的谦虚只是外表。

## 13 常数与参数台账

我把全篇出现的每个数按"从上到下"排一张表，并给我的敏感度判断打标。素材 §3.4 明确记了论文未述 $d_0$、$q=16/8$、$\alpha=3/2$ 的最优性，所以"敏感度"这一列全是我的外部推算，整列 [推测]。

| 记号 | 值或定义 | 出处 | 在链条里的作用 | 敏感度 [推测] |
| --- | --- | --- | --- | --- |
| $m,R$ | 正整数，双层测试索引 | Thm 5.1 | $m$ 管矩阵尺寸，$R$ 管词长上界；对角化的两根轴 | 无自由度，必须两者都跑遍 |
| $d_0$ | $64m4^R$ | Prop 4.1 | 底层丛秩，一切秩的母数 | 系数 $64$ 很松，只需覆盖 incidence 不等式的余量；$4^R$ 与窗口长度耦合，不可减 |
| $d_j$ | $4^jd_0$ | Prop 4.1 | 第 $j$ 级秩 | 递推比 $4$ 被两条夹逼唯一确定（第 5 节） |
| $b_i$ | $\frac{15}{4}d_{i-1}$ | Prop 4.1 | 第 $i$ 个新射影空间因子的线丛贡献量 | $\frac{15}{4}$ 要保证 $r=\frac{15}{4}d$ 的大块 incidence 有余量，同时 $b_i4^{-(j-i)}$ 整除 |
| $a_{0,j}$ | $d_04^{-j}$ | Prop 4.1 | 平凡因子 $L_0$ 在第 $j$ 级的乘度 | 每级除 $4$ 是 $h_0$ 有界的唯一原因 |
| $a_{i,j}$ | $960m4^{R+2i-j-2}$ | Prop 4.1 | $L_i$ 在 $E_j$ 中的乘度 | 由 $b_i$ 与 $4^{-(j-i)}$ 唯一决定，无自由参数 |
| $K_i$ | $320m^24^{2i-2}(4^{R-i+1}-1)$ | Prop 4.1 | 第 $i$ 个 $\mathbb{CP}$ 因子的维数、$c_1$ 的幂次 | 闭式来自几何级数，$\sum_{j=i}^Ra_{i,j}=m^{-1}K_i$ 是恒等式 |
| $Y$ | $\prod_{i=1}^R\mathbb{CP}^{K_i}$ | Prop 4.1 | 底空间；$\dim_{\mathbb R}Y=2p$，$p=\sum_iK_i$ | 陈类次数 $p$ 恰好等于底维数一半的两倍，这是"顶陈类非零"的必要条件 |
| $h_0$ | $\frac43md_0(1-4^{-(R+1)})<2md_0$ | Prop 4.1 | $G$ 中平凡部分 $L_0^{\oplus h_0}$ 的秩 | 关键余量 $2-\frac43=\frac23$（单位 $md_0$）；$\rho=2$ 会让它归零 |
| $\eta_j$ | $<\frac{20}{3}md_j$ | Prop 4.1 | 前缀底空间 $\prod_{i\le j}\mathbb{CP}^{K_i}$ 的实维数上界 | 与 $b_i=\frac{15}{4}d_{i-1}$ 同步放大，改 $b_i$ 就改这里 |
| $q_{\text{small}}$ | $16$ | Prop 4.1 | 小块映射数（进旧线丛、点底） | $q=7$ 时余量 $0.08$，$q=6$ 失败（第 8 节边界算例） |
| $q_{\text{large}}$ | $8$ | Prop 4.1 | 大块映射数（进新块） | 与 $\frac{15}{4}d$、$\frac{20}{3}md$ 三方互相牵制 |
| $N$ | $24=16+8$ | Thm 5.1 | 生成元个数 | 进入分母 $2N$ |
| $\lambda$ | $2$ | (3.2) 展开倍数 | $\dim\sum T_iS\ge2\dim S$ | 势函数的强制条件要求 $\alpha<\lambda$ |
| $\alpha$ | $\frac32$ | Lemma 3.2 | 势函数 $g_y$ 里 $\log\det P$ 的系数 | 见下面 13.2，$\alpha$ 与 $c$ 有一一关系 |
| $c$ | $\frac23$ | (5.1) 行界 | 缺陷里的 $1-c$ | $c=1/\alpha$，所以 $\alpha\to2^-$ 时 $c\to\frac12$ |
| $\epsilon$ | 逐纤维最小特征值下界 | Lemma 3.2 | 紧性论证的入口 | 只用于证存在，不进最终常数 |
| $[a,A]$ | 子水平集区间 | Lemma 3.2 | 保证唯一极小点存在 | 同上 |
| $2^{-1/2}$ | 延拓映射系数 | Prop 4.1 | 使 $j>R$ 的行和 $\le\frac12$ | 由 $E_{j+1}=E_j\oplus E_j$ 的等距嵌入唯一确定 |
| $\frac15$ | 多项式逼近容差 | Thm 5.1 | 推出 $\|P^*P-I\|<\frac{11}{25}$ | 需要 $<\sqrt{3/2}-1\approx0.225$，$\frac15=0.2$ 是就近取的 |
| $\frac12$ | $P^*P\ge\frac12I$ | Thm 5.1 | 极分解的一致界来源 | $1-\frac{11}{25}=\frac{14}{25}>\frac12$ |
| $2N$ | $48$ | Thm 1.1 | $A=M_{48}(B)$ 的尺寸 | 最小可行（第 10 节论证 $N$ 角不够） |
| $\frac1{144}$ | $\frac{1/3}{48}$ | Thm 1.1 | 主定理的唯一数字 | 链条末端，见 13.2 |

### 13.1 一条链，两个源头

从表里能看出全篇只有一个"汇聚点"：$\frac{1-c}{2N}$。它的分子来自分析侧（Lemma 3.2 的 $\alpha$），分母来自几何侧（Prop 4.1 的 $16+8$）。两条链在中途互不相干，只在最后一步相乘。这解释了为什么论文能把 Lemma 5.2 单独说成"useful independently of the construction"：它是唯一的汇流口。

### 13.2 $\alpha$ 与 $c$ 的精确关系，以及 $\frac1{144}$ 并不是这套方法的上界

我把 Lemma 3.2 的最后一步改成参数 $\alpha$ 重算一遍。设势函数为

$$g_y(P)=\log\det(I+D_y(P))-\alpha\log\det P,$$

一阶条件是 $\sum_iT_i^*Q^{-1}T_i=\alpha P^{-1}$（$Q=I+D(P)$）。取

$$X_i=\alpha^{-1/2}Q^{-1/2}T_iP^{1/2}.$$

列和：

$$\sum_iX_i^*X_i=\alpha^{-1}P^{1/2}\Big(\sum_iT_i^*Q^{-1}T_i\Big)P^{1/2}=\alpha^{-1}P^{1/2}(\alpha P^{-1})P^{1/2}=I_E.$$

正好是 $1$，与 $\alpha$ 无关；这是 $\alpha^{-1/2}$ 这个前缀系数的全部理由。行和用 $D(P)=\sum_iT_iPT_i^*=Q-I$：

$$\sum_iX_iX_i^*=\alpha^{-1}Q^{-1}D(P)=\alpha^{-1}Q^{-1}(Q-I)=\alpha^{-1}(I-Q^{-1})\le\alpha^{-1}I_F,$$

最后一步是 $Q\ge I$（$D(P)\ge0$）。于是 $c=1/\alpha$ 是恒等式，论文里 $c=\frac23$ 就是 $\alpha=\frac32$ 的直接翻译，全篇唯一"看起来像凑"的 $\frac23$ 其实是 $\frac{3}{2}$ 的倒数。我原先以为 $\frac23$ 与 $\frac32$ 之间是某种余量权衡，重算后确认它们是同一个数的两张脸，中间唯一的损失就是 $I-Q^{-1}\le I$ 这一步放缩，而那一步在 $D(P)>0$ 时是严格不等的。

于是缺陷 $=\frac{1-1/\alpha}{48}$ 关于 $\alpha$ 单调上升。$\alpha$ 的上界由势函数的强制性给出：展开倍数 $\lambda=2$ 使 $\log\det(I+D(tP))$ 在射线上以 $2\log t$ 增长，而 $-\alpha\log\det P$ 以 $-\alpha\log t$ 增长，两者之差 $\to+\infty$ 要求 $\alpha<2$。所以这套方法能给的缺陷上确界是

$$\lim_{\alpha\to2^-}\frac{1-1/\alpha}{48}=\frac{1/2}{48}=\frac1{96},$$

取不到（$\alpha=2$ 时子水平集不再紧，极小点可能逃逸）。$\frac1{144}$ 落在 $(1,2)$ 的中点位置，看不出有特殊理由。[推测] 我的解释是：主定理只要"$>0$"，作者取中点让 $\alpha$ 与 $\lambda-\alpha$ 两侧的余量对称，证明里 $\epsilon$、$[a,A]$ 的界都最好看。

### 13.3 $\lambda$ 为什么停在 $2$，而结构上看似能给到 $4$

$d_{j+1}=4d_j$ 意味着 $E_j\to E_{j+1}$ 的映射族在极限情形可以联合满射到秩 $4d_j$ 的靶，从而对每个子空间给出 $\lambda$ 至多 $4$ 的膨胀。我的推算：真要 $\lambda$ 接近 $4$，就得让全部 $24$ 个映射的像在每一点张满 $E_{j+1}$，而 Prop 4.1 的构造里 $16$ 个小块映射被**限定**在旧线丛的指定分量内（那是点底论证的要求，见第 8 节我那条发现），它们的像只落在秩 $a_{i,j+1}=a_{i,j}/4$ 的小块里，不参与张满。能张满的只有 $8$ 个大块映射，其靶秩 $\frac{15}{4}d_j$，于是有效膨胀上界是 $\min\!\big(8,\ \tfrac{15}{4}\big)$ 对小子空间受 $q\cdot s$ 限制、对大子空间受靶秩限制，实际能一致保证的就是 $\lambda=2$。[推测] 论文没有讨论这一点，$\lambda=2$ 只出现在 (3.2) 作为待验证的目标。

### 13.4 若要把 $\frac1{144}$ 做大

按 $c=1/\alpha$ 与缺陷 $\frac{1-c}{2N}$，只有三条杠杆：$\alpha\uparrow2$（见 13.2，上限 $\frac1{96}$）、$q_{\text{large}}$ 或 $q_{\text{small}}$ 减小（第 8 节已算出 $q_{\text{small}}=7$ 只剩 $0.08$ 余量、$q_{\text{large}}=6$ 时 $\frac{43}{2}sd-11s^2\ge\frac{21}{2}sd$ 不再压过 $\eta_j$）、以及把展开与拓扑障碍做成"非方阵"以绕过 $2N$ 角规格化（Lemma 5.2 的分母 $2N$ 由角数决定，看不出可压缩的余地）。我倾向认为 $\frac1{96}$ 是这套框架的自然天花板，而论文显然不打算追这个数：它要的是"存在一个正常数"，而 $\frac1{144}$ 的写法让它能直接进 abstract。

## 14 Lean 侧取证：同一批数字，另一条路线

`lean/OAI/Analysis/Kaplansky/` 共 72 个 `.lean`、7837 行：顶层 15 个文件（2173 行），子目录 `Quotient/` 8、`Regular/` 19、`StableFiniteness/` 11、`Ultrapower/` 19。外围支撑库三块：`OAI/Analysis/Quasitrace/`（7 文件：Basic, Compactness, Defect, Extension, Infiniteness, Matrix, Order）、`OAI/Analysis/Cuntz/`（15 文件）、`OAI/Geometry/BundleTests/`（12 文件）。入口 `Main.lean` 只有 25 行。

### 14.1 骨架

```lean
theorem actual_normalizedTwoQuasitrace_exists :
    ∃ τ : OneQuasitrace ActualDefectAlgebra, τ.Normalized ∧ τ.IsTwo :=
  actualCuntzDimensionState.normalizedTwoQuasitrace_exists

theorem kaplansky_quasitrace_counterexample : MainTarget :=
  mainTarget_of_actualDefectQuasitrace actual_normalizedTwoQuasitrace_exists
```

`ComparatorChallenges/KaplanskyQuasitrace.lean` 里 `MainTarget` 的陈述末尾是

```lean
∀ τ : OneQuasitrace A, τ.Normalized → τ.IsTwo → (1 : ℝ)/144 ≤ (τ (a+b) - τ a - τ b).re
```

`ActualAlgebra.lean:98-103` 的 `mainTarget_of_actualDefectQuasitrace` 把 `actualDefectA`、`actualDefectB`、`actualDefectPair_spec` 三段拼进 `MainTarget`，量词结构逐字对应。json 里 `theorem_names:["OAI.Kaplansky.kaplansky_quasitrace_counterexample"]`、`definition_names:[]`，许可公理 `propext / Quot.sound / Classical.choice`。comparator 骨架里定理本体是 `by sorry`，认证的只有这一个名字。

### 14.2 公理口径的三处拆分

`Quasitrace/Basic.lean:17-25`：

```lean
structure OneQuasitrace (A : Type*) [CStarAlgebra A] where
  toFun : A → ℂ
  square_nonneg : ∀ x, 0 ≤ toFun (star x * x)
  square_swap : ∀ x, toFun (star x * x) = toFun (x * star x)
  real_imag : ∀ h k, IsSelfAdjoint h → IsSelfAdjoint k →
    toFun (h + Complex.I • k) = toFun h + Complex.I * toFun k
  abelian_linear : ∀ S : NonUnitalStarSubalgebra ℂ A,
    IsClosed (S : Set A) → (∀ x y : S, x * y = y * x) →
    ∃ f : S →ₗ[ℂ] ℂ, ∀ x : S, f x = toFun x
```

论文的公理 (i) 在这里被拆成两条（`square_nonneg` 与 `square_swap`），(iii) 被写成"在每个闭交换非单元 $*$-子代数上存在一个复线性映射与之相等"，用**存在性**表达线性，并非直接给线性性数据。下面紧跟着一条 `OneQuasitrace.linearOn` 把闭交换有单位情形从非单元公理化出来，说明这个绕法是刻意的（Lean 里给一个"定义在子代数上的线性泛函"需要额外结构，存在式陈述最省事）。

2-拟迹在 `Quasitrace/Matrix.lean:16-21`：

```lean
def upperLeft (a : A) : CStarMatrix (Fin 2) (Fin 2) A :=
  ...
  ∃ σ : OneQuasitrace (CStarMatrix (Fin 2) (Fin 2) A), ∀ a, σ (upperLeft a) = τ a
```

`Extension.lean:134-142` 的 `extension_value_two` 就是我第 2 节补写的那一步（$\sigma(1_{M_2(C)})=2$），而且它下面还有一条 `extension_not_normalized`（`:146-150`）明确说明：延拓 $\sigma$ 在 $M_2(A)$ 上取单位值为 $2$，所以它**不是**规格化的。这条定理带注释"A direct check that the target's matrix extension is not accidentally required to be normalized"，是在防一个形式化时容易误加的条件。

`PositiveContraction`（`Matrix.lean:25`）：$(\exists x,\ a=\operatorname{star}x\cdot x)\wedge\|a\|\le1$。注意它要求 $a$ 显式写成 $x^*x$，而论文只写"positive contraction"。在 $C^*$-代数里正元必有平方根所以两者等价，但 Lean 侧要把平方根造出来，这也是第 10 节里"$a,b$ 的每个块都写成部分和或补元"能被直接消化的原因。

### 14.3 存在性走的是 Cuntz 半群，并非论文的 Theorem 2.1 一句话

论文的 Theorem 2.1 是"有规格化 2-拟迹 ⟺ 每个 $M_m$ 不适当无穷"这一个双箭头。Lean 里 ⟸ 被切成两站：

- `Cuntz/State.lean:24-34`：`CuntzDimensionState A := ⟨state : CuntzMonoid A →+ ℝ, monotone, normalized⟩`，配 `cuntzDimensionState_nonempty (hf : ∀ k > 0, ¬ProperlyInfinite (CStarMatrix (Fin k) (Fin k) A))`。
- `Cuntz/Quasitrace.lean:232-237`：`normalizedTwoQuasitrace_exists (d : CuntzDimensionState A) : ∃ τ, τ.Normalized ∧ τ.IsTwo`，由 `normalizedTwoQuasitrace_of_spectral_linearity` 加两条谱构造的 abelian 线性性证明得到。

中间是 15 个文件的 Cuntz 库（`Regularization`, `Squares`, `SquareCutoff`, `Cutoff`, `Distribution`, `Measure`, `Spectral`, `Translation`, `Comparison`, `Content`, `Monoid`, `Commutative`, `State`, `Quasitrace`, `RegularizedState`）。也就是说机器化把论文引用为外部定理的"$2$-拟迹与下半连续维数函数的对应"重做了一遍，路线回到 Cuntz 与 Blackadar–Handelman 的原证，并非 MR 的打包陈述。`ActualAlgebra.lean:107-108` 的 docstring 与论文 `02:46-47` 呼应："No quasitrace-existence premise, simplicity, or exactness assumption is used."，而 `:112` 又老实写下"No analytic correspondence is claimed."，因为选出的那个态是用 `Classical.choice` 拿到的（`:113-114`）。

### 14.4 缺陷引理的机器形状

`Quasitrace/Defect.lean:178-212` 的 `uniform_defect` 是 Lemma 5.2 的一般 $N$ 版本，指标类型写成

```lean
τ : OneQuasitrace (CStarMatrix (Fin N ⊕ Fin N) (Fin N ⊕ Fin N) A)
```

`Fin N ⊕ Fin N` 就是论文"$2N$ 个对角角"的形状化：前段 $N$ 个 `Sum.inl`、后段 $N$ 个 `Sum.inr`。它给的结论是 `(1-c) / (2*N) ≤ (τ (defectA x N + defectB x N) - ...).re`。证明体三行关键：`defect_pair_identity`（先取**等式**，正是我 10.5 强调的"先等式后放缩"）、`corner_normalization`（$\varphi(1)=1/(2N)$，经 `Fintype.card (Fin N ⊕ Fin N) = 2*N`）、`corner_scalar_upper_bound`（$\varphi(J_N)\le c\varphi(1)$），收尾 `nlinarith`。特化版 `uniform_defect_twentyFour` 用 `defect_constant` 把 $\frac{1-2/3}{48}$ 化简成 `1/144`，一条 `simpa`。

### 14.5 几何侧：陈类被换成了障碍论

`BundleTests/Assembly.lean:132` 的 `exists_test_twentyFour_expanding_maps {m R j} (hm : 0<m) (hj : j<R)` 是 Prop 4.1 里"24 个映射一起膨胀"的可计算版本，`:42` 处调用 `Incidence.exists_eight_fresh_bundle_maps`（大块那 8 个）。`Normalized.lean:28` 取用前者。底空间是 `SmoothTestBase m R`，射影空间维数记账在 `Base.lean` 的 `testProjectiveDimension`、`retainedTrivialMultiplicity_bound`、`three_sum_pow_four`（后者是 $\sum4^{-j}$ 那个几何级数的机器形式），`Smooth.lean` 有 `smoothPrefix_incidence_margin`。

关键差异在障碍本体。`Complement.lean:41-43` 的 docstring 自己写得很清楚：

> "A hypothetical proper-infiniteness witness yields a genuine continuous frame whose orthogonal complement has rank below the Chern degree on every fiber. Identifying that Chern class and proving it nonzero remain separate."

它给的形式是 `Module.finrank ℂ (Submodule.span ℂ (range (f.vector y)))ᗮ < ∑ i : Fin R, testProjectiveDimension m R i`（`:48-50`），也就是"补丛秩 $<p$"这一半已经到位，而"$c_p(G)\ne0$"那一半不在这里。往下追，`Obstruction.lean:1` 顶层 import 的是 `OAI.AlgebraicTopology.IntegralHomology.Obstruction`，用的是 twisted section class / 相对同调的语言（该文件里的注释有"The actual twisted section carries the existing augmented-base"）。论文用一行陈类乘积 $\prod z_i^{K_i}\ne0$ 打完的仗，机器化改走整除性与截面障碍。素材 §五缺失，所以这条差异是我自己在 `Obstruction.lean` 与 `Complement.lean` 之间比对出来的。

### 14.6 论文里没有的三台机器

1. `Ultrapower/`（19 文件：`Polar`, `ApproxPolar`, `CornerPolarCut`, `PolarDefect`, `PolarScalar`, `QuasiFinite`, `QuasiNull`, `QuasiValue`, `UltraSaturation`, `UltraDiagonal`, `Wandering`, `DenseUnits`, `MatrixDenseUnits`, `Maximal`, `PartialCorners`, `PartialIsometry`, `Unitary`, `Quotient`, `Construction`）。论文第 9 节的极分解只用两行（$Q=P_0(P_0^*P_0)^{-1/2}$），这里却有一整套超积、饱和、近似极分解与"游荡向量"的机器 [推测] 这是早先一条被放弃的路线：先用超积饱和把近似 isometry 提升成真的 isometry，再用极分解取像。论文后来靠"词长有界 ⟹ 落在有限窗口内"直接避开提升，超积整支就不再进入主链。它留在仓库里但没有出现在 `Main.lean` 的依赖路径上（`Main.lean` 只经 `ActualAlgebra` 与 `TestAlgebra`）。
2. `Regular/`（19 文件，`PowersOperators`, `PowersAverageBound`, `PowersPartition`, `ReducedTrace`, `ReducedTensor`, `HilbertTensorModel`, `FreeFamily`, `FreeNormal`, `NearGram` 等）。这是 Powers 算子与自由概率估计的全套工具 [推测] 说明我（作者位置）一度想用 $C_r^*(\mathbb F_2)$ 的 Powers 生成元直接造 $B$，即用自由群的近正交半群做膨胀族，后来换成丛平移。换掉的理由我能反推出来：Powers 生成元给的是**单个**代数上的固定生成元，无法逐 $(m,R)$ 重选参数，而对角化要求"$k_i$ 对每个测试各取一套"（素材 §3.3 的"参数逐测试重选"）。
3. `Quotient/`（8 文件，其中 `Extraction.lean` 用 `commutatorSpan`、`positiveCone` 内点与 Hahn–Banach 式分离给出 `finite_trace_obstruction`）。这是 Haagerup 的有限迹障碍判据（`07:72-78` 引 `\cite[Lemma~2.1]{Haagerup}`）的机器化，对应推论 (iii)，而论文对 (iii) 只写了三行。也就是说：论文里最短的一支，在 Lean 里是一整条分离定理的构造。

三台机器共同说明一件事：Lean 侧的工作量分布与论文的正文长度分布是错开的。论文把篇幅给了 §3、§4（incidence 与丛测试），Lean 侧同样最重的是 `BundleTests/`，但额外把等价物做到了论文用引用打发的两处（Theorem 2.1 的 Cuntz 路线、Haagerup 判据）。

### 14.7 口径差汇总表

| 项目 | 论文 | Lean | 我的判断 |
|---|---|---|---|
| 缺陷不等式 | $\tau(a+b)-\tau(a)-\tau(b)\ge\frac1{144}$ | $\frac1{144}\le(\dots).\mathtt{re}$ | 正元上拟迹取实值，两者等价；`.re` 是为了避开复序 |
| 公理 (i) | 一条 $\tau(x^*x)=\tau(xx^*)\ge0$ | `square_nonneg` + `square_swap` | 拆分只是形式化需要 |
| 公理 (iii) | 在每个 abelian $C^*$-子代数上线性 | 闭交换非单元 $*$-子代数上存在复线性 `f` 相合 | 存在式陈述，附 `linearOn` 还原 |
| $2$-拟迹 | $\sigma$ 在左上角限制为 $\tau$ | `upperLeft` + `∃ σ`，另有 `extension_not_normalized` | 机器侧多证了 $\sigma$ 不规格化 |
| Theorem 2.1 | 单一双箭头，引 MR | `State.lean` + `Quasitrace.lean` 两站，中间 15 文件 Cuntz 库 | 论文用外部定理，机器重做对应 |
| 陈类非零 | $c_p(G)=\prod z_i^{K_i}\ne0$ | 障碍论 `IntegralHomology.Obstruction` | 同结论不同工具 |
| $M_{48}$ 放大 | $M_k(A)\cong M_{48k}(B)$ | `actualDefectAmplificationEquiv` + `properlyInfinite_map`（`ActualAlgebra.lean:95-96`） | 一一对应 |
| 极分解 | 两行初等论证 | `Ultrapower/` 19 文件 | 机器留了备用路线 |

## 15 剩下的悬案，以及我如果继续做会走的三条岔路

### 15.1 我自己没能回答的问题（论文也未述）

1. $B$ 到底稳不稳定有限。论文只证"每个 $M_m(B)$ 不适当无穷"，并在 `02:28-29` 主动声明不需要更强的结论。$B$ 不单，两者之间隔着一个我不知道如何填的沟。
2. $B$ 的其他不变量：理想格、归纳极限结构、核空间、是否可嵌入 $\mathcal R^\omega$。全篇只给了"可分、有单位、24 生成元、非确切"。非确切是从 Haagerup 定理倒推的必要条件（`01:94-95`），不是正面算出来的。
3. 数值。$K_i$ 只被证为正整数，$\frac1{144}$ 之外没有任何计算实验。全篇纯存在性，连一张表都没有。
4. $\alpha$ 能否取到 $2$、$\lambda$ 能否超过 $2$（13.2 与 13.3 是我的推算，边界情形我没能构造出来）。
5. 与相邻问题的关系：Connes 嵌入、预对偶唯一性。论文只写到 Gow 的"maximal abelian subalgebras and bidual retractions"那一句就停了。
6. Kirchberg 2006 的 1-拟迹例子至今未发表（`01:97-101` 引的是 Haagerup 的转述）。如果它发表，"$1$-拟迹是否都是 $2$-拟迹"与本文的关系需要重读一遍：我这条链上，Lemma 5.2 已经说明 $A$ 上每个规格化 **1**-拟迹都在 $(a,b)$ 上有缺陷，所以本文反例其实没用到 2-条件的强度，它只是需要 2-条件来保证存在性。这一点值得单独写一句，我在第 10 节记了，但它比论文 abstract 的表述更值得注意。

### 15.2 三条岔路

**岔路 A：把 $B$ 做成单。** 若 $B$ 单，"无矩阵代数适当无穷"立刻升级为稳定有限，(iii) 就能用 $B$ 本身，并非 $AW^*$-因子的有限生成子代数，整个 §6 会缩短一半，且 $A$ 自己就成为 (i)(ii)(iii) 三条的统一见证者。障碍在 $\mathcal D$ 的坐标投影：每个投影 $\mathcal D\to\mathcal B(\mathcal H_{m,R,y})$ 的核都是闭理想，而 $B$ 生成于 $\mathcal D$，除非所有坐标上的像都单且核交为 $0$。我的判断是这条路需要把"逐测试重选参数"改写成"单一代数内的分层"，也就是把乘积换成某种带连接的归纳极限，而那时列关系 $\sum x^*x=1$ 的精确性会丢（素材里我记过：直和与归纳极限的共同问题是无法保持精确等式）。

**岔路 B：把 $\lambda$ 提到 $4$。** 见 13.3，需要让全部 24 个映射联合张满 $E_{j+1}$，而这与"小块映射必须待在旧线丛分量内才能用点底计数"直接冲突。若能把点底论证换成**带底**的版本（即在 $\prod_{i\le j}\mathbb{CP}^{K_i}$ 上做 incidence 计数），小块就不必缩进线丛分量，$\lambda$ 有上升空间，代价是 $\eta_j$ 变大、$b_i$ 要跟着放大。我没有验证放大后的 $h_0$ 界是否还守住 $<2md_0$，因为 $b_i$ 变大只会增大 $p$ 而 $h_0$ 只依赖 $a_{0,j}$，看起来是可解耦的。这条我认为最可能有新东西。

**岔路 C：正面算 $K$-理论。** 反例代数 $A$ 的 $K_0$ 里若能有可辨识的序结构，就能把"2-拟迹存在但非迹"翻译成维数函数的不连续性（Cuntz–Blackadar–Handelman 对应下，下半连续维数函数与连续维数函数的差）。论文全程回避 $K$-理论，而 `BundleTests/Base.lean` 里 $K_i>0$ 的整除性计算已经很接近 $K_0$ 的生成元计数。这条属于"把反例变成一个可研究的对象"，工作量最大，回报也最不确定。

如果只容许我做一件事，我选岔路 B：它是唯一一条能在现有框架内改进具体数字的路，而改进 $\lambda$ 会顺带回答"$24$ 个生成元是不是最小值"这个我在第 8 节边界算例里碰到但没解决的问题。

## 台账补表

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $N=24$ 与 $c=2/3$ | 调用缺陷引理的代入对 | 06-conclusion.tex:10 | 主定理证明把两条关系兑换成 $1/144$ 的唯一一行 | 任一改动使 06-conclusion.tex:13 的 $(1-c)/(2N)=1/144$ 与 01-introduction.tex:86 的陈述失配 |
| $A=M_{48}(B)$ | 放大后的反例代数，尺寸 $48$ | 01-introduction.tex:206 | 存在性一侧把 Theorem 2.1 直接作用的对象 | 退回 $A=B$ 时 05-algebra.tex:140 的正压缩元对不在 $A$ 里，缺陷没有承载代数 |
| $M_k(A)\cong M_{48k}(B)$ | 矩阵放大的重结合同构 | 06-conclusion.tex:6 | 把"每个 $M_m(B)$ 不适当无穷"搬到 $A$ | 缺这一步则 02-preliminaries.tex:33 的双条件在 $A$ 上无法验证，06-conclusion.tex:8 的存在性调用断 |
| $\tau(a+b)-\tau(a)-\tau(b)\ge\frac1{144}$ | 主定理缺陷下界的实例值 | 01-introduction.tex:86 | Theorem 1.1 的结论式；Lean 侧 `MainTarget` 末尾按同一数字核对（第 14 节） | 换数字要同步 05-algebra.tex:144 的一般式与 06-conclusion.tex:13 的代入，三处任一漏改则陈述与证明对不上 |
| $\frac{1-c}{2N}$ | 一般 $N$ 的均匀缺陷下界 | 05-algebra.tex:144 | Lemma 5.2 的结论；第 13 节两条常数链的唯一汇流口 | 分母写成 $N$ 就与 05-algebra.tex:187 的 $\varphi(1)=\frac1{2N}$ 相差一倍，05-algebra.tex:220 的最后放缩给不出陈述值 |
| $2N$ 个对角角（$2N=48$） | 缺陷对所在矩阵代数的角数 | 05-algebra.tex:140 | 跨角搬运 05-algebra.tex:178 的作用域 | 角数减半则前段与后段共用角，05-algebra.tex:169 的正压缩元核对直接失败 |
| $u_i=x_i^*x_i,\ v_i=x_ix_i^*$ | 逐对配对的左右因子积 | 05-algebra.tex:152 | 部分和 $H_i,J_i$ 的加项；(5.7) 的载体 | 重新配对则 05-algebra.tex:193 的 $\varphi(u_i)=\varphi(v_i)$ 无对应项可消 |
| $H_i=\sum_{j\le i}u_j,\ J_i=\sum_{j\le i}v_j,\ H_0=J_0=0$ | 两组递增部分和 | 05-algebra.tex:155 | 望远镜的两端点 | 端点非零则 05-algebra.tex:216 塌不到 $\varphi(1)-\varphi(J_N)$，缺陷只剩表达式 |
| $a$ 的后 $N$ 块 $1-J_0,\dots,1-J_{N-1}$ | 补元形状 | 05-algebra.tex:162 | 正性核对 05-algebra.tex:169 与后段符号 | 改写 $-J_{i-1}$ 则 $a$ 脱离正锥，主定理的正压缩元前提断 |
| $b$ 的后 $N$ 块 $1-v_1,\dots,1-v_N$ | 补元形状（第二元） | 05-algebra.tex:164 | 与后段相加给出 $2-J_i$ | 改动则 05-algebra.tex:205 的 $-\varphi(J_i)+\varphi(J_{i-1})+\varphi(v_i)$ 符号翻转 |
| $\varphi(z)=\tau(\iota_1(z))$ | 把 $2N$ 个角并成一个泛函 | 05-algebra.tex:173 | 搬运 05-algebra.tex:178 与对角可加性 05-algebra.tex:184 | 只有 $B$ 上的拟迹时跨角不可用，本引理对 $\tau$ 的定义域要求断掉 |
| $\tau(\iota_k(z))=\varphi(z)$（$z\ge0$，$1\le k\le2N$） | 只花公理 (i) 的跨角搬运 | 05-algebra.tex:178 | 角归一化与逐块缺陷 | 若这里需要线性，(iii) 被偷偷加强，02-preliminaries.tex:11 之外的假设混进证明 |
| $\varphi(1)=\frac1{2N}$ | 角归一化，即 (5.6) | 05-algebra.tex:187 | 缺陷刻度 $\varphi(1)(1-c)$ 的分子 | 规格化条件 02-preliminaries.tex:16 一去掉，05-algebra.tex:220 的放缩只剩 $0$ |
| $\varphi(u_i)=\varphi(v_i)$（$1\le i\le N$） | 全引理的唯一通道，即 (5.7) | 05-algebra.tex:193 | 望远镜里两组和的逐项抵消 | 缺它则 05-algebra.tex:214 无法化简成 05-algebra.tex:216，$J_N$ 接不住 $\sum\varphi(u_i)$ |
| $-\varphi(J_i)+\varphi(J_{i-1})+\varphi(v_i)$ | 后段带负号的逐块缺陷 | 05-algebra.tex:205 | 与列段合成精确等式 | 同号设计留 $\sum\varphi(v_i)$ 不消，正是第 10.7 节记的那处双向耦合 |
| 标量平移限定语 within the abelian algebra generated by the corner identity and the indicated self-adjoint element | 每一步拆分的合法性边界 | 05-algebra.tex:207-209 | 05-algebra.tex:204 的每一次 $\varphi(\alpha\cdot1-X)$ 拆分 | 对两个不交换元写可加性则后段整段作废，10.5 节的限定语成了空话 |
| $0\le c<1$ | 行界参数的允许区间 | 05-algebra.tex:138 | 结论 $1-c>0$ 的正性来源 | $c\ge1$ 时 05-algebra.tex:144 退化为空陈述，也不再与迹态存在矛盾 |
| $\varphi(J_N)\le c\varphi(1)$ | 全引理唯一的放缩 | 05-algebra.tex:220 | 从精确等式跳到下界 | 换成逐点严格不等式只是修辞，正线性 05-algebra.tex:219 才是它的根据 |
| $\sum_{i=1}^{24}x_i^*x_i=1$ | 精确列关系（定理内版本） | 05-algebra.tex:14 | 第 9 节装配与无迹论证 07-consequences.tex:66 的第一等号 | 改成近似关系则 $1\le2/3$ 的矛盾链第一步断，第 3 节放弃直和路线的理由落空 |
| $\sum_{i=1}^{24}x_ix_i^*\le\frac23 1$ | 行关系，$c=\frac23$ 的落点 | 05-algebra.tex:16 | 缺陷分子 $1-c$；07-consequences.tex:66 的不等号 | 行界提到 $1$ 则两条关系不再互斥，$B$ 的无迹性失效 |
| $\sum_{i=1}^{24}x_i^*x_i=1,\ \sum_{i=1}^{24}x_ix_i^*\le\tfrac23 1$ | 同一对关系的 intro 版本 eq:intro-relations | 01-introduction.tex:141-142 | 导读对读者的承诺，靠 \label{eq:intro-relations} 与 \label{eq:algebra-relations} 分家 | 与 05-algebra.tex:14 不同步时，第 3 节到第 9 节读到的系数有两套 |
| $B=C^*(1,x_1,\dots,x_{24})$ | 有限生成（$24$ 个生成元）的可分子代数 | 05-algebra.tex:12 | 可分性论证 05-algebra.tex:56；对角化窗口的载体 | 生成元无界则 05-algebra.tex:44 的单一刻法在 $\ell^\infty$-积里不成立 |
| $s_i^*s_j=\delta_{ij}1_C$ | 适当无穷见证元的定义关系 | 02-preliminaries.tex:24 | 第 9 节反证假设 $s_1,s_2$ 与拼接 $W$ | 条件弱到单个 isometry 则 04-bundles.tex:34 要排除的对象变弱，秩 $2md_0$ 失去来由 |
| $\mathcal H_{m,R,y}=\bigoplus_{j\ge0}E_j(y)$ | 分层 Hilbert 空间 | 05-algebra.tex:27 | 移位 $S_i^{m,R}(y)$ 的定义域 | 去掉分层则 04-bundles.tex:17 的 $d_j$ 与续接段 04-bundles.tex:232 都没有对象 |
| $x_i=\bigl(S_i^{m,R}(y)\bigr)_{m,R,y}$ | 有界积里的单一刻度 | 05-algebra.tex:44 | 逐坐标的列核对 05-algebra.tex:47 与行核对 05-algebra.tex:50 | 改成移位之和则坐标求值只给压缩，05-algebra.tex:109 的保序方向丢一半 |
| 一致范数界，uniformly over all coordinates | 每块 $X_i^{(j)*}X_i^{(j)}\le I_{E_j}$ 给出移位 $\le1$ | 05-algebra.tex:36-37 | 有界积把无界多个坐标收成一个元素的前提 | 无一致界则 05-algebra.tex:39 的 $\mathcal D$ 收不下这族移位，元组不存在 |
| 行和在零层为 $0$、在第 $j\ge1$ 层 $\le\frac23 I_{E_j}$ | 逐坐标的两侧核对 | 05-algebra.tex:48-51 | 代数关系式在整个无穷直和上成立的依据 | 漏掉续接段则 $x_i$ 的范数无界，第 3 节的装配连定义都不给 |
| $\lVert P-W\rVert<1/5$ | 多项式逼近容差 $\delta=\frac15$ | 05-algebra.tex:67 | 恒等式与放缩 05-algebra.tex:70 | $\delta\ge\sqrt2-1$ 时 05-algebra.tex:74 的正下界取不到，$P_0$ 在纤维上失单射 |
| $P^*P\ge\frac12 I_{2m}$ | 逼近元的自伴下界（(5.2)） | 05-algebra.tex:74 | 逐纤维压缩 05-algebra.tex:111 与极分解的一致界 | 下界退化为 $0$ 则 05-algebra.tex:116 的 $(P_0^*P_0)^{-1/2}$ 无定义，像丛不连续 |
| $R\ge$ 词长，顺序是 after fixing this approximation | 双层索引的对角化纪律 | 05-algebra.tex:77-79 | 选取已构造的测试 $(m,R)$ | 先固定 $R$ 则 05-algebra.tex:82 的"停在层 $0$ 到 $R$"断，靶跑进续接段，(4.4) 不覆盖 |
| $P_0:E_0^{\oplus2m}\to F_{m,R}=(\bigoplus_{j=0}^{R}E_j)^{\oplus m}$ | 落在有限窗口内的丛映射 | 05-algebra.tex:87-88 | 陈类障碍 04-bundles.tex:33-34 的入口 | 靶换成 $\bigoplus_{j\ge0}E_j$ 则 04-bundles.tex:120 的普适度声明救不了它，矛盾无从触发 |
| $Q=P_0(P_0^*P_0)^{-1/2}$ | 极分解给出的连续等距 | 05-algebra.tex:116 | 像丛同构于 $E_0^{\oplus2m}$，即 05-algebra.tex:119-120 的平凡子丛 | 可逆性条件 02-preliminaries.tex:53 不满足时这一步与下一步同时断 |
| $d_0=64m4^R$ | 底层丛秩，一切秩的母数 | 04-bundles.tex:17 | $h_0$ 的余量 04-bundles.tex:100 与小块前提 $D\ge64m$ | 系数 $64$ 降到 $16$ 则 04-bundles.tex:152 失效，16 个映射那组先崩 |
| $d_j=4^jd_0$ | 秩递推比 $\rho=4$ | 04-bundles.tex:17 | 整除链 04-bundles.tex:86-87 与 $\eta_j$ 上界 04-bundles.tex:138 | $\rho=2$ 时 04-bundles.tex:100 的 $h_0$ 撞上 $2md_0$，(4.4) 要排除的秩不再超出平凡容量 |
| $1\le i\le 24$ | 每级映射个数与生成元个数对齐 | 04-bundles.tex:21 | 05-algebra.tex:12 的 $24$ 个生成元 | 个数随 $(m,R)$ 增长则 $B$ 不再有限生成，05-algebra.tex:56 的可分性论证断 |
| $\sum_{i=1}^{24}(X_i^{(j)})^*X_i^{(j)}=I_{E_j}$ | 丛层面的精确列关系 | 04-bundles.tex:25 | 05-algebra.tex:47 的逐层求和 | 只在 $j<R$ 成立则零层以上无界，05-algebra.tex:14 的 $1$ 兑不出来 |
| $\sum_{i=1}^{24}X_i^{(j)}X_i^{(j)*}\le\frac23 I_{E_{j+1}}$ | 丛层面的行关系 | 04-bundles.tex:28 | 05-algebra.tex:50 与 05-algebra.tex:16 | 系数变大则 $1-c$ 缩水，$1/144$ 跟着变小，主定理数字需重述 |
| 秩 $2md_0$ 的平凡子丛被排除 | 拓扑测试的输出 (4.4) | 04-bundles.tex:34 | 05-algebra.tex:121 的矛盾落点 | 秩减一半则极分解的像不再被排除，反证整链无终点 |
| $b_i=\frac{15}{4}d_{i-1}$ | 新块乘度 | 04-bundles.tex:54 | 大块靶秩 $r=\frac{15}{4}d$ 与 incidence 值 04-bundles.tex:206 | 比例改动则 04-bundles.tex:208 的 $\frac{21}{2}sd>\frac{20}{3}md$ 需重算，可能不再成立 |
| $a_{0,j}=d_04^{-j}=64m4^{R-j}$ | 平凡因子 $L_0$ 的逐层乘度 | 04-bundles.tex:59 | $h_0$ 的几何级数 04-bundles.tex:100 | 去掉 $4^{-j}$ 衰减则 $h_0$ 发散，平凡部分吞掉全部陈类余量 |
| $a_{i,j}=960m4^{R+2i-j-2}$（$1\le i\le j\le R$） | 旧线丛在第 $j$ 级的乘度 | 04-bundles.tex:61 | $K_i$ 的求和 04-bundles.tex:66-67 | 指数变负则 04-bundles.tex:64 的正整数断言失败，$\mathbb{CP}$ 因子无定义 |
| $K_i=320m^24^{2i-2}(4^{R-i+1}-1)$ | 第 $i$ 个射影空间因子的复维数 | 04-bundles.tex:67 | $Y$ 的因子次数 04-bundles.tex:106 与顶次 04-bundles.tex:111 | 减小 $K_i$ 则关系理想提前截断 $z_i^{K_i}$，保留陈类归零 |
| $Y=\prod_{i=1}^{R}\mathbb{CP}^{K_i}$ | 测试的底空间 | 04-bundles.tex:69 | 04-bundles.tex:128 的前缀底与 05-algebra.tex:24 的改名 $Y_{m,R}$ | 因子个数与 $R$ 脱钩则窗口内的陈类记账对不上词长 |
| $E_j=\bigoplus_{i=0}^{j}L_i^{\oplus a_{i,j}}$ | 分块对角结构的来源 | 04-bundles.tex:75 | flag 论证 04-bundles.tex:191-194 | 不写成直和则分块对角性没有出处，小块那 16 个映射无从定义 |
| $\operatorname{rank}E_{j+1}=\frac14d_j+\frac{15}{4}d_j=4d_j$ | 秩递推的验证式 | 04-bundles.tex:83 | 04-bundles.tex:85 的归纳与 $D\ge256m$ 的余量 | 旧块不除 $4$ 则 $h_0$ 无界，第 5 节夹出 $4$ 的两条约束同时失去 |
| 被除 $4$ 的乘度满足 $D\ge256m$ | 整除性下限 | 04-bundles.tex:87 | 04-bundles.tex:152 的小块前提 $D\ge64m$ | 收紧到 $64m$ 以下则 $D/4$ 非整数，替代块秩无定义 |
| $h_0=\frac43md_0(1-4^{-(R+1)})<2md_0$ | 平凡部分的总容量，全节最紧的不等式 | 04-bundles.tex:100 | 障碍 04-bundles.tex:115-119 里 $k>h_0$ 的取法 | 不等号反向则 04-bundles.tex:34 排除的是空陈述，陈类不再否决任何东西 |
| $z_i^{K_i+1}=0$，$\deg z_i=2$ | 上同调环的截断关系 | 04-bundles.tex:106 | 04-bundles.tex:111 的顶次乘积非零 | 关系改变则 $\prod z_i^{K_i}$ 可被提前杀掉，(4.4) 的整个论证作废 |
| $c_p(G)=\prod_{i=1}^{R}z_i^{K_i}\ne0$ | 保留陈类 | 04-bundles.tex:111 | 04-bundles.tex:115-119 的补丛秩 $<p$ 论证 | Whitney 展开阶数一错，$c_p(W)=0$ 与 $c_p(G)\ne0$ 的对撞消失 |
| $Y_{j+1}=\prod_{i=1}^{j+1}\mathbb{CP}^{K_i}$ | 第 $j$ 步映射的实际底 | 04-bundles.tex:128 | $\eta_j$ 的定义与 04-bundles.tex:213 的大块应用 | 底换成 $Y$ 则小块那条点底论证没有出处，$h=0$ 用不上 |
| $\eta_j<\frac{20}{3}md_j$ | 前缀底的复维数上界，即 (3.1) 里的 $h$ | 04-bundles.tex:138 | 大块 incidence 04-bundles.tex:210 | 上界超过 $\frac{21}{2}sd$ 则大块整组映射不存在，24 个生成元的账先断 |
| $q=16$，底为一个点（$h=0$） | 小块映射数与零维底选择 | 04-bundles.tex:156 | 04-bundles.tex:163 的一次同时覆盖 $s=1,\dots,m$ | 换到有 $\eta_j>0$ 的底上则 04-bundles.tex:161 的 $133ms$ 付不出，点底是必要条件 |
| $\frac52sD-27s^2\ge133ms>0$ | 小块 incidence 余量 | 04-bundles.tex:160-161 | 04-bundles.tex:167 的 16 个块对角映射 | $q$ 降到 $6$ 则正性失，flag 论证 04-bundles.tex:194 没有原料 |
| $\dim W\ge2\dim S$（跨块子空间） | 小块对全部 $S$ 的膨胀 | 04-bundles.tex:191-194 | 04-bundles.tex:221 的合并清单 | 无滤过论证则分块对角只覆盖单块向量，03-scaling.tex:92 的假设不满足 |
| $q=8$，$m<s\le d$，$r=\frac{15}{4}d$ | 大块映射数、范围与靶秩 | 04-bundles.tex:201 | 04-bundles.tex:213 在 $Y_{j+1}$ 上的应用 | 范围下界从 $m$ 抬起则 04-bundles.tex:209 的 $\frac{21}{2}sd>\frac{20}{3}md$ 不再由 $s>m$ 保证 |
| $\frac{43}{2}sd-11s^2\ge\frac{21}{2}sd>\frac{20}{3}md>\eta_j$ | 大块 incidence 的三段余量 | 04-bundles.tex:206-210 | 八个进新块的映射之存在 | 中段系数掉到 $\frac{20}{3}$ 以下则大块失效，$\dim S>m$ 那半边无人接管 |
| $\dim\sum_{i=1}^{24}T_iS\ge2\dim S$ | 两组合并后的膨胀 | 04-bundles.tex:221 | 04-bundles.tex:226 的规格化输入 | 任一组缺失则 03-scaling.tex:92 不满足，列与行关系无从规格化 |
| $X_i^{(j)}$ 可以混合线丛直和项 | 规格化阶段失去分块对角 | 04-bundles.tex:228-229 | 04-bundles.tex:120 的普适度在此兑现 | 若障碍要求分块对齐则构造与规格化的顺序不可换，全节需重做 |
| $X_1^{(j)}=2^{-1/2}\iota_1$，$X_2^{(j)}=2^{-1/2}\iota_2$ | 续接段的标量系数 | 04-bundles.tex:234 | 04-bundles.tex:239 的行和 $\frac12I_{E_{j+1}}$ | 系数取 $1$ 时 04-bundles.tex:28 在 $j\ge R$ 违反，05-algebra.tex:16 的全局行和也断 |
| $\dim\sum_{i=1}^{q}T_i(y)S>t$ | 引理 3.1 的输出，严格不等号 | 03-scaling.tex:24 | 04-bundles.tex:165 那句"结论比需要的略强" | 写成 $\ge t$ 则坏集不再是零测，03-scaling.tex:60 的维数严格性失 |
| 同一组 $T_1,\dots,T_q$ 同时覆盖所有 $(s,t)$ 与所有 $y$ | "同时"这一层强度 | 03-scaling.tex:20-22 | 04-bundles.tex:163 的一次应用覆盖 $s=1,\dots,m$ | 逐 $(s,t)$ 取映射则并起来无共同定义，小块那步不成立 |
| $(qs-t)(r-t)-s(d-s)>h$ | 核丛维数小于参数空间维数的等价改写（(3.1)） | 03-scaling.tex:16 | 03-scaling.tex:62 的 precisely 与 04 的两处 incidence 计算 | 不等号写 $\ge$ 则 03-scaling.tex:60 的 $<2M$ 失，像可含内点 |
| $\operatorname{Hom}(S,F_y/U)^q$，目标复秩 $qs(r-t)$ | 维数计账的落点 | 03-scaling.tex:56 | 03-scaling.tex:60 的核丛实维公式 | $q$ 掉则 $qs(r-t)$ 缩水，(3.1) 两侧同时变，余量需重算 |
| 单位分解与逐点满的求值 $V\to\operatorname{Hom}(E_y,F_y)$ | 有限维参数空间的构造 | 03-scaling.tex:40-41 | 03-scaling.tex:54 的逐纤维满射性 | 换成全体光滑映射的 Fréchet 空间则无测度可用，第 6 节记的死路即此 |
| 立方体细分加可数穷竭 | 投影像零测，且处理非紧总空间 | 03-scaling.tex:68-72 | 03-scaling.tex:73 的有限并 | 改回 Sard 一般形式则需 $C^k$ 阈值假设，第 6 节第二条死路 |
| $\dim_{\mathbb C}\sum_{i=1}^{n}T_i(y)S\ge2\dim_{\mathbb C}S$ | 膨胀率 $\lambda=2$（(3.2)） | 03-scaling.tex:93 | 03-scaling.tex:127 的特征值正性与势函数紧性 | $\alpha\ge2$ 时 03-scaling.tex:152 的 $f(t)$ 在无穷端失去下界，极小点逃逸 |
| $\sum_{i=1}^{n}X_i^*X_i=I_E$ | 规格化后的精确列关系（(3.3) 左半） | 03-scaling.tex:99 | 04-bundles.tex:25 与 05-algebra.tex:14 | 前缀系数 $\sqrt{\alpha^{-1}}$ 一错，列和不再是 $I_E$，与行关系不再互斥 |
| $\sum_{i=1}^{n}X_iX_i^*\le\frac23 I_F$ | 规格化行界（(3.3) 右半） | 03-scaling.tex:101 | 04-bundles.tex:28、05-algebra.tex:16、缺陷分子 | 行界 $\ge1$ 时 05-algebra.tex:138 的 $c<1$ 前提断，迹障碍消失 |
| $g_y(P)=\log\det(I_{F_y}+D_y(P))-\frac32\log\det P$ | 势函数与系数 $\alpha=\frac32$ | 03-scaling.tex:112 | 一阶条件 03-scaling.tex:214 与归一化 03-scaling.tex:220 | $\alpha$ 变则 $c=1/\alpha$ 同步变，$1/144$ 换成 $\frac{1-1/\alpha}{48}$ |
| 膨胀因子 $2$ 与系数 $\frac32$ 之间的 strict margin | 极小点不逃逸的根据 | 03-scaling.tex:116-118 | 03-scaling.tex:160 的公共紧区间 $[a,A]$ | 余量归零时 03-scaling.tex:199 的一致紧集失，逐纤维极小元不再连续依赖 $y$ |
| $\mu_{2s}(D_y(p))\ge\epsilon$ | 逐点正升级为一致正 | 03-scaling.tex:133 | 03-scaling.tex:147 的行列式下界 | 底非紧时 $\epsilon$ 可退到 $0$，(3.4) 与后面的紧性一起失 |
| $\log\det(I+D_y(P))\ge2\sum_{s=1}^{d}\log(1+\epsilon\lambda_s)$ | (3.4)，按 $(2s-1,2s)$ 配对 | 03-scaling.tex:146-147 | 03-scaling.tex:152 的 $f$ 与子水平集界 | 配对数从 $2$ 改动就与膨胀率 $\lambda=2$ 脱钩，第 13.3 节的 $\lambda$ 讨论失去锚点 |
| $[a,A]\subset(0,\infty)$ | 全纤维公用的紧区间 | 03-scaling.tex:160 | 03-scaling.tex:199 的粘合 | 区间退化则极小元可跑到 $0$ 或 $\infty$，连续正定自同态 $P$ 不存在 |
| 二阶导等于指数和的方差，故严格凸 | 唯一性之源 | 03-scaling.tex:186-188 | 03-scaling.tex:195 的唯一极小元与 03-scaling.tex:205 的跨标架粘合 | 失去严格凸则标架变换下极小元可不重合，丛上规格化只在局部存在 |
| 酉标架变换保持两个行列式 | 局部解粘成整体的机制 | 03-scaling.tex:203-205 | 01-introduction.tex:198 那句 compatible with changes of bundle frame | 若依赖平凡化则非平凡丛上 (3.3) 无从陈述，第 8 节的拉回全部作废 |
| $\sum_iT_i^*Q^{-1}T_i=\frac32P^{-1}$ | 一阶条件 | 03-scaling.tex:214 | 03-scaling.tex:226-227 的列和恰为 $I_E$ | 右端系数与 03-scaling.tex:220 的前缀 $\sqrt{\frac23}$ 配平失败，列和出现常数倍 |
| $X_i=\sqrt{\frac23}\,Q^{-1/2}T_iP^{1/2}$ | 规格化映射的显式公式 | 03-scaling.tex:220 | 03-scaling.tex:226 与 03-scaling.tex:230 两侧核对 | 因子顺序颠倒则不再是 $E\to F$ 的映射，两侧关系同时失 |
| 唯一的放缩损失 $I-Q^{-1}\le I$ | 行界的放缩来源 | 03-scaling.tex:230 | 缺陷分子 $1-c$ 的实际大小 | $D(P)>0$ 时这步严格，写成等式则 $c$ 变小、缺陷变大，与 $1/144$ 冲突 |
| $r\ge2d$ | 引理 3.2 的隐含可行性条件 | 03-scaling.tex:128 | 04-bundles.tex:83 的 $d_{j+1}=4d_j$ | 靶秩降到 $2d$ 以下时膨胀条件本身不可能，第 4 节的秩账全废 |
| 公理 (i) $\tau(x^*x)=\tau(xx^*)\ge0$ | 拟迹的第一条 | 02-preliminaries.tex:9 | 05-algebra.tex:175 与 05-algebra.tex:191 两处搬运 | 拆成两条只影响 Lean 表述，合并使用则 10.3 与 (5.7) 同时失去根据 |
| 公理 (ii) $\tau(h+ik)=\tau(h)+i\tau(k)$ | 实虚部分离 | 02-preliminaries.tex:10 | 第 2 节补步 3 与第 15.1 节的冗余怀疑 | 若 (ii) 能被 (iii) 推出则陈述变简，Lean 侧的 real_imag 字段成为冗余 |
| 公理 (iii) 在每个 abelian $C^*$-子代数上复线性 | 线性性的唯一许可范围 | 02-preliminaries.tex:11-12 | 05-algebra.tex:182 的对角可加性与 05-algebra.tex:207-209 的限定语 | 许可范围扩到不交换元则整个缺陷估计归零，反例不复存在 |
| 2-拟迹：$M_2(C)$ 上的 1-拟迹限制到左上角 | 加强条件的定义 | 02-preliminaries.tex:14 | 06-conclusion.tex:11 的回用方向；01-introduction.tex:97 的 essential | 降到 1-拟迹就落在 Kirchberg 例子的层次，本文的强度声明断 |
| 规格化 $\tau(1_C)=1$ | 归一化约定 | 02-preliminaries.tex:16 | 05-algebra.tex:187 的 $\varphi(1)=\frac1{2N}$，其来源是 $2N\varphi(1)=\tau(1_{M_{2N}(B)})$ | 去掉规格化则 $\varphi(1)$ 可任意小，$1/144$ 不再是下界 |
| 延拓在 $1_{M_2(C)}$ 上取值 $2$ | 第 2 节补步 2 的原型 | 02-preliminaries.tex:17 | 01-introduction.tex:75-76 的预告；05-algebra.tex:187 的 $2N$ 版本 | 误设延拓规格化则 05-algebra.tex:187 推不出，第 14.2 节记的 `extension_not_normalized` 正为此而设 |
| 存在性判据的 iff | 有规格化 2-拟迹 当且仅当 每个 $M_m(C)$ 不适当无穷 | 02-preliminaries.tex:33 | 06-conclusion.tex:8 的存在性；07-consequences.tex:51 的必要方向 | 只用单侧则第 12.2 节"两次反向使用"的结构塌掉 |
| 无 exactness、simplicity、representation 假设 | 该判据的普适度 | 02-preliminaries.tex:46-47 | 第 1 节理由二与第 11.2 节的用量清点 | 加上确切性假设则本代数不合格（01-introduction.tex:94 的必然非确切），通道封死 |
| 正下界使像成为连续子丛，条件写成 $W^*W$ 可逆 | 第 9 节极分解的依据 | 02-preliminaries.tex:52-53 | 05-algebra.tex:116 与 05-algebra.tex:118 | 假设降到逐纤维单射则像维数可跳，(4.4) 的矛盾无从陈述 |
| $M_m(B)$ 对每个 $m\ge1$ 不适当无穷 | 构造的拓扑侧输出 | 05-algebra.tex:19 | 06-conclusion.tex:7 的放大与 07-consequences.tex:51 的必要方向 | 只给单个 $m$ 则 02-preliminaries.tex:34 的"每个 $m$"不足，$A$ 上拟迹的存在断 |
| 可数稠密：有理复系数 $*$-多项式 | 可分性的来源 | 05-algebra.tex:56 | 01-introduction.tex:82 的可分陈述；推论 (ii) | 去掉有限生成则 05-algebra.tex:39 的积不可分，可分性无补救 |
| $W=[s_1\ s_2]\in M_{m,2m}(B)$ | 两个正交值 isometry 的矩形拼接 | 05-algebra.tex:63 | 04-bundles.tex:34 要排除的秩 $2md_0$ 之来源 | 矩形尺寸变则窗口靶与 $E_0^{\oplus2m}$ 的秩账全部错位 |
| Milhøj--Rørdam 的分离提示 | 有界长度与延迟适当无穷分家 | 01-introduction.tex:151 | 第 3 节三个动作的出处 | 不分离则需无界生成元，05-algebra.tex:56 的可分性先断 |
| 测试参数逐 $(m,R)$ 重选 | 对角化机制的自述 | 01-introduction.tex:187 | 05-algebra.tex:79 的坐标族选取 | 参数全局固定则 04-bundles.tex:17 的 $d_0$ 无法覆盖所有 $R$ |
| 有限词长选中积里已有的那个测试 | 候选自我否决 | 01-introduction.tex:180-181 | 第 3 节动作三与第 9 节步 9 | 词长无上界则窗口不存在，04-bundles.tex:33 的直和只到 $R$ 失去意义 |
| 规格化后列和为 $1$、行和至多 $2/3$ | 膨胀与拓扑相容的两件出口 | 01-introduction.tex:192-193 | 04-bundles.tex:25-28 与缺陷分子 | 行界写坏则 05-algebra.tex:138 的 $c<1$ 不成，$1/144$ 无从谈起 |
| 十六个进旧线丛、八个进新块 | 分工与 $24$ 的构成 | 01-introduction.tex:201-202 | 04-bundles.tex:167 与 04-bundles.tex:213 | 改成 $12+12$ 则 04-bundles.tex:161 与 04-bundles.tex:208 两侧余量同时失配 |
| 存在性一步不需要选定拟迹的公式 | 反例形态的自述 | 01-introduction.tex:211 | 第 0 节第 1 点与第 11.2 节的用量清点 | 改走显式拟迹路线则量词从 $\forall\tau$ 降为 $\exists\tau$，主定理陈述断 |
| Powers 定理给 $R=C_r^*(\mathbb F_2)$ 的单性 | 推论 (i) 的第二因子 | 07-consequences.tex:55 | 07-consequences.tex:58 的稳定有限与 (i) | 换成非单因子则 (i) 的"两个单代数"前提失配 |
| faithful 迹排除非酉 isometry | $R$ 稳定有限的机制 | 07-consequences.tex:57-58 | (i) 的稳定性一侧 | 迹非 faithful 则 $\tau(1-ss^*)>0$ 那步断，(i) 的第二因子失守 |
| $\mathbb F_\infty$ 降级到 $\mathbb F_2$ 的包含 | 张量积通道的收缩 | 07-consequences.tex:30-31 | 07-consequences.tex:43 的 (6.1) | 无此包含则只剩 $\mathbb F_\infty$ 版本，01-introduction.tex:24 的两个生成元承诺落空 |
| (6.1)：无迹态 ⟹ $D\otimes_{\min}C_r^*(\mathbb F_2)$ 适当无穷 | 单向蕴含式 | 07-consequences.tex:43 | (i) 的终点与 (ii) 的中转 | 写成双向则在 $B$ 上无据，第 12.1 节的口径要求失配 |
| $1\le2/3$ | 两条关系与迹态的硬冲突 | 07-consequences.tex:66 | (ii) 的无迹一侧；关系式的全文第二次独立发挥作用 | 列关系只是近似时第一个等号断，这正是第 3 节弃直和路线的正面理由 |
| Haagerup 有限迹障碍判据给 $y_1,\dots,y_n$ | (iii) 的输入元组 | 07-consequences.tex:73-77 | 07-consequences.tex:87 的矛盾与 $C$ 的无迹 | 判据失效则 (iii) 的代数 $C$ 无从构造，三条外溢少一条 |
| 稳定有限沿 $C\subset M$ 的三步继承 | (iii) 的稳定有限性 | 07-consequences.tex:80-82 | (iii) 的第二条断言 | 中间一步依赖 07-consequences.tex:52 的 $M$ 稳定有限，链断则 (iii) 只剩可分与无迹 |
| 图注：$R=1$ 时 $E_1$ 与 $E_R$ 同层 | 窗口图示的边界约定 | figures/finite-test.tex:34 | 第 9 节步 9 的窗口读法 | 忽略此约定会把最低档测试读成两层，04-bundles.tex:128 的前缀底多算一项 |
| 06 无 \section，输入顺序在 05 与 07 之间 | 主定理证明的排版归属 | paper.tex:50 | 第 11 节关于阅读顺序的记录 | 移到文末则 Theorem 1.1 的证明与 01-introduction.tex:80 的陈述相隔一节，依赖图不变但叙述链断 |

前十三节的表格是按符号聚合的口头坐标（"用在哪""改了会在哪断"写在我自己的行文里），这张表按消费点聚合：一行对应 tex 里一处逐字读到的坐标，以及那个量在原处被谁接走。我把主定理证明的六句话（第 11 节）倒过来拆成一条链，链上每个节点单独占一行，所以同一个符号在链上出现两次就登记两行（例如 $\frac23$ 在 03 的引理结论、04 的丛关系、05 的代数关系里各被接走一次）。位置列只写我这次实际读到内容的 `文件名.tex:行号`，跨行公式取起始行。

### 视角差异勘误

旧表把同一个符号的所有出现折成一行，出处列只给 Prop 4.1、Thm 5.1 这类编号，"在链条里的作用"与"敏感度"两列是我当时的口头判断，它的用途是在改一个数之前先扫一遍影响面。新表反过来组织：一行只对应一个消费点，坐标必须是 `文件名.tex:行`，因为补表这一趟让我确认口头坐标根本不可复核。两张表并存的代价是同一个量出现两次（$\eta_j$、$2^{-1/2}$、$c=\frac23$、$Y_{j+1}$ 各有两条），收益是任何一格都能被脚本和 tex 同时验掉。下面登记我这次读旧稿时发现的行号偏差与口径差，旧表本体一个字没动，列名也保留原样。

- 第 3 节末段把 in one bounded operator product 记作 `01:174`：该短语在 01-introduction.tex:176，:173-174 是 $x_i$ 与 $B$ 的显示式，差 2 行。
- 第 3 节把 Its finite degree selects one of the tests already present in the product, which obstructs that approximation. 记作 `01:190-204`：这句在 01-introduction.tex:180-181，190 到 204 是两条 ingredients 的那段。
- 第 6 节把逐纤维满射的理由两句记作 `03:52-55`：实为 03-scaling.tex:54-56。
- 第 0 节把 Without exactness 那句路线宣言记作 `01:66-67`：Without 落在 01-introduction.tex:65 的行尾，整句占 65 到 67。
- 第 0 节把 Kirchberg 转述记作 `01:97-101`：引文本体是 01-introduction.tex:98-101，:97 属于 essential 那句论断，范围多带一行。
- 第 13 节常数表的出处列整列都是编号级坐标，零个文件行号，验收脚本数到 ledgerRows=0 的根因就在这张表；同一批量在新表里落到了行号，两处冲突时以行号为准。
- 第 13 节表把 $\eta_j$ 说成"前缀底空间 $\prod_{i\le j}\mathbb{CP}^{K_i}$ 的实维数上界"：tex 里 $Y_{j+1}$ 的乘积指标到 $j+1$（04-bundles.tex:128），:131-132 明写 complex dimension，所以 $\eta_j$ 是复维数，它在 (3.1) 里恰好充当 $h$，底空间实维是 $2\eta_j$。第 8 节正文用的 $\eta_j=\sum_{i=1}^{j+1}K_i$ 与 tex 一致，表与正文在同一量上口径不一。
- 第 13 节表把 $2^{-1/2}$ 的作用写成"使 $j>R$ 的行和 $\le\frac12$"：tex 的续接段条件是 $j\ge R$（04-bundles.tex:232），端点被旧表漏掉，而 :239 那步行和正是靠 $j=R$ 才与 04-bundles.tex:28 接上。
- 第 13 节表给 $q=16$ 记的出处是 Prop 4.1：字面的 $q=16$ 只在 04-bundles.tex:156 出现，:167 是 16 个块对角映射的装配句，旧表把定义与装配合成一格。
- 规格化条件的使用点旧表没登记：02-preliminaries.tex:16 与 05-algebra.tex:187 是配对的两处，新表补了这两行。
- 第 13 节表写"$c=1/\alpha$，所以 $\alpha\to2^-$ 时 $c\to\frac12$"，我在 03-scaling.tex:112、03-scaling.tex:220、03-scaling.tex:230 三处逐字复核后确认成立，这条算旧表里少数能直接落到行号的判断。
- 第 2 节说论文用一行写完延拓取值那步（`02:17-19`）：tex 里它占三行软换行（02-preliminaries.tex:17-19），"一行"指的是一句话，属口径松动。
- 第 12.5 节的分配表与第 14.7 节的口径差表都是四列口头表，列名带"需要""放弃的性质""我的判断"，没有位置列，本次保留它们的分工，新表不接管。
- 一行 tex 容纳两个符号时我按符号拆行：04-bundles.tex:17 同时给 $d_0=64m4^R$ 与 $d_j=4^jd_0$，新表因此出现两次同一坐标，脚本按位置去重会看到重复，这是有意为之。
- 新表"被谁消费"一列允许指向本笔记的小节（第 0 节、第 2 节、第 3 节、第 4 节、第 5 节、第 6 节、第 8 节、第 9 节、第 10.7 节、第 11.2 节、第 12.1 节、第 12.2 节、第 13.3 节、第 14.2 节、第 15.1 节），这些编号在第 0 节到本节之间全部真实存在，我没有引用任何尚未写出的小节。

### 本节自检

- 追加范围：新内容全部落在文件末尾，§0 只增了收尾一段，旧稿正文与三张旧表未改写、未删除。
- 表头两行与交付要求逐字相等，我用 python 做整行等值比较：新表头在文件里命中 1 次（第 875 行），分隔行紧跟在第 876 行，两行相邻；旧第 13 节表另有一份同样式的五列分隔行（第 686 行），它的表头是旧列名，属旧内容，我未动。
- 数据行 106 条，逐行竖线数实测全为 6，异常列表为空。
- 位置列 106 格全部匹配 `文件名.tex:行` 或 `文件名.tex:行-行`，文件名都在 build 目录下真实存在，行号不超过各文件总行数；涉及 01 到 07 七个正文分片加 paper.tex 与 figures/finite-test.tex，共 9 个文件。
- 空格子与单字符占位（只含一个连字符或长破折号的格子）实测 0 个。
- 竖线冲突：范数一律写成 `\lVert P-W\rVert` 形式，绝对值写成 `\lvert\cdot\rvert`，表内无裸竖线；第 28 行那格我特意把原来的双竖线写法改掉了。
- 行号内容对照：本次完整读了 01-introduction.tex、02-preliminaries.tex、03-scaling.tex、04-bundles.tex、05-algebra.tex、06-conclusion.tex、07-consequences.tex、paper.tex、figures/finite-test.tex 九个文件全文，另用脚本两次打印单行原文共 144 行（第一次 98 行、第二次 46 行）逐格核对，其间修正了我自己一处把 $2N\varphi(1)=1$ 挂到 05-algebra.tex:186 的偏差，最终指向 :187。
- 队列核对：`.tools/lean_queue.txt` 第 8 行与素材目录名逐字相等，§0 末尾那句话里的行号就是这次核对的结果。
- 禁用句式与套话：在 `## 台账补表` 到文件末尾的区段上做字符串计数，命中全为 0；长破折号 0 次，人名连接改用双连字符（新表里 Milhøj--Rørdam 那一行是本次唯一涉及人名的格子，旧稿原有的短横写法保留）。
- 取证边界：只用 build 下的 `*.tex`，没读任何 PDF，没跑 git，Lean 侧只复用第 14 节已登记的三个坐标。
