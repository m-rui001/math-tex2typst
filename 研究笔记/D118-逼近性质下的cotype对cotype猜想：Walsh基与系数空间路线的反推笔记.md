# D118 逼近性质下的 cotype 对 cotype 猜想：Walsh 基与系数空间路线的反推笔记

素材目录：`E:\math\preprints\The-cotype-cotype-conjecture-under-the-approximation-property-September-23-2026\build\`，扁平八个 tex 分片。机器侧：`E:\math\lean\OAI\Analysis\Cotype\`（125 个 `.lean` 文件，`grep -rc 'sorry'` 在该目录内返回空，即我读过的文件里都找不到 `sorry`），权威条目 `E:\math\lean\formalization.yaml:1062-1064`，比较器 `E:\math\lean\ComparatorChallenges\Cotype.json`。

## 0 起点：我手上只有题名时先立起来的三个猜想

我拿到题名 The cotype cotype conjecture under the approximation property 时，对自己的预期是三件事。

猜想一：这是一个"BAP 情形的推广"工作。我脑中已有 Pisier 的旧格局，即在指数受限条件下、并且带基或带一致可补的有限维子空间塔时证 $K$-凸性，再往前一步换到 BAP。既然这次把 BAP 换成普通 AP，我猜正文的主线一定是"把有界逼近算子换成无界逼近算子，然后在某个求和里做一次截断权的重新分配"。

猜想二：Walsh 概率工具会出现在鞅或者 Littlewood-Paley 型平方函数的位置上，也就是把 Rademacher 投影的范数直接用逐阶（一阶、二阶……）Wainer 型估计来控。

猜想三：cotype 2 会以"两侧都是 cotype 2"的具体形式出现，因为两侧 cotype 2 加 AP 时 Pisier 的结论更强（同构于 Hilbert 空间），我猜作者会先做 cotype 2 再谈一般指数。

读下去以后三条基本都被推翻，具体差异我放在 `## 16`。这里先记下真正的开局动机：`introduction.tex:3-6` 逐字写着

```
The cotype--cotype problem asks whether finite Rademacher cotype
of a Banach space and its dual forces \(K\)-convexity. Without an
approximation hypothesis the assertion is false. We prove the characterization under the
ordinary approximation property.
```

一句话里塞了三条约束：反例存在（无 AP 为假）、结论是刻画（iff）、假设只要普通 AP。我的第一反应是去问：AP 到底被用在哪个环节，才会让一个本来假的命题变真。这个问题后来变成全文的锚点，因为它等价于问"证明里哪一步需要算子范数极限"。

`introduction.tex:163-165` 给了反例的出处：

```
The assertion with no approximation hypothesis is false.
Pisier's construction embeds every cotype-two space into a space whose
primal and dual both have cotype two
```

于是我知道 AP 的作用一定是"把某个紧算子写成有限秩算子的范数极限"，而范数极限恰好会把结论从有限秩推广到一般。这是我从题名到正文结构的第一次猜测命中。

本笔注叙事对应的论文目录为 preprints/The-cotype-cotype-conjecture-under-the-approximation-property-September-23-2026，在 .tools/lean_queue.txt 队列第 130 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 论文自写的目标形状与它的两个缺口

`introduction.tex:43-54` 的主定理：

```
\begin{theorem}\label{thm:main}
Let \(X\) be a nonzero real Banach space with the ordinary approximation
property. Then \(X\) is \(K\)-convex if and only if
\[
C_q(X)<\infty
\quad\hbox{and}\quad
C_r(X^*)<\infty
\qquad\text{for some }q,r\in[2,\infty).
\]
The exponents \(q\) and \(r\) may differ. The forward implication holds
for every real Banach space, without an approximation hypothesis.
\end{theorem}
```

我在草稿纸上写下两个缺口。缺口 A：正向（$K$-凸推出两侧有限 cotype）不需要 AP，那 AP 只在反向出现，所以整个证明应当被切成"与 AP 无关的衰减定理"加"把衰减搬到 $\operatorname{Id}_X$ 上的一次传递"。缺口 B：结论里 $K$-凸性只是一个存在性命题，没有给出 $K(X)$ 的上界形状，而均匀界被单独放进了 `introduction.tex:91-99` 的推论里：

```
\begin{corollary}[Uniform cotype bounds and entropy duality]
\label{cor:uniform-cotype-entropy}
Fix \(q,r\in[2,\infty)\) and \(C,D\in[1,\infty)\). There is a
finite constant \(\kappa=\kappa(q,r,C,D)\) such that every nonzero
real Banach space \(X\) with AP and
```

这个切分对后来的机器取证很重要：Lean 侧 `MainTarget` 只编码了主定理的反向骨架，均匀 $\kappa$ 与熵对偶都不在其中。

AP 的定义在 `introduction.tex:9-14`：

```
Recall that \(X\) has the \emph{approximation property}
(AP) if, for every compact set \(M\subset X\) and every \(\delta>0\),
there is a bounded finite-rank linear map \(S:X\to X\) such that
\[
\sup_{x\in M}\|Sx-x\|<\delta.
\]
```

而 `introduction.tex:143-144` 直接把困难说破了：

```
Thus an argument using ordinary AP must accommodate approximants whose
norms have no common bound.
```

我的第一版尝试路线是"先补一条引理，说 cotype 与 AP 合起来能给出 BAP"。这条路在我手上走不通，理由是我知道的反例方向恰好相反：Figiel-Johnson 分离 AP 与 BAP（`introduction.tex:140-141`），所以任何需要 $\sup_j\|S_j\|<\infty$ 的求和都会在没有界的地方断掉。带着这个失败，我改为逐字找正文里"有没有任何一处对 $\|S_j\|$ 取上界"，答案在 `approximation.tex:206-207`：

```
Only the composites \(S_jJ\) converge in operator norm;
no common bound on \(\|S_j\|\) is required.
```

这一句是全文我最先划线的句子之一，它告诉我 AP 的消费界面只有一个：算子范数收敛。

## 2 固定长度 cotype 常数 $c_m$：为什么要换指标

`preliminaries.tex:24-27` 定义了核心量：

```
Let \(V_n=\F_2^n\), with its standard dot pairing, and put
\(\chi(u,v)=(-1)^{u\cdot v}\). For \(T:G\to F\), define
\[
(W_n^Tx)(v)=\E_{u\in V_n}\chi(u,v)Tx(u),\qquad
w_n(T)=\|W_n^T:L_2(V_n;G)\to L_2(V_n;F)\|.
\]
```

`preliminaries.tex:76-84` 把 cotype 换成固定长度形式：

```
Define \(c_m(Y)\) to be the least constant in
\begin{equation}\label{eq:fixed-cotype}
\left(\sum_{i=1}^m\|y_i\|^2\right)^{1/2}
\le c_m(Y)\left(\E_\eps\left\|\sum_{i=1}^m\eps_i y_i\right\|^2\right)^{1/2}.
\end{equation}
Thus, if \(Y\) has cotype \(q\) with constant \(C_q(Y)\), then
\begin{equation}\label{eq:fixed-from-cotype}
c_m(Y)\le C_q(Y)m^{1/2-1/q}.
\end{equation}
```

补中间步骤。设 $a_i=\lVert y_i\rVert\ge0$。在 $m$ 个点的计数测度上，$\ell_p$ 范数满足 $\lVert a\rVert_2\le m^{1/2-1/p}\lVert a\rVert_p$ 当且仅当 $p\ge2$，这是 $\ell_p\subset\ell_2$ 的连续嵌入，指数来自把 $\sum a_i^2$ 写成 $\sum a_i^2\cdot1$ 后用 Hölder 以共轭指标 $q/2$ 与 $(q/2)'$：

$$\sum_{i=1}^m a_i^2\le\Big(\sum_i a_i^{q}\Big)^{2/q}m^{1-2/q}.$$

两边开平方得 $(\sum a_i^2)^{1/2}\le m^{1/2-1/q}(\sum a_i^q)^{1/q}$，再套 cotype $q$ 定义 $(\sum\lVert y_i\rVert^q)^{1/q}\le C_q(Y)(\mathbb E\lVert\sum\varepsilon_iy_i\rVert^2)^{1/2}$，即得 `eq:fixed-from-cotype`。

机械理由：指数 $1/2-1/q$ 的非负性完全靠 $q\ge2$。若换成 $q<2$，上式方向翻转，$c_m(Y)\le C_q(Y)m^{1/2-1/q}$ 会变成小于 1 的幂，与 $c_m(Y)\ge1$（取一元组即得）矛盾，所以 $q\ge2$ 这个门槛在这里就被钉死。这也解释了主定理为什么把 $q,r$ 的范围写成 $[2,\infty)$。

为什么要换指标：后面所有的矩提升都是"长度恰好 $m$ 的组"上的操作（`preliminaries.tex:153-178`），而 cotype $q$ 是对任意长度的求和。把任意长度的估计压回长度 $m$ 的估计，代价正好是 $m^{1/2-1/q}$，这是一个关于 $m$ 的多项式增长，并非关于维数的增长。$m$ 是全文唯一被自由选取的整数，代价可控。

`preliminaries.tex:86-88` 的放大不变性：

```
\begin{equation}\label{eq:cotype-amplification}
c_m(L_2(\Omega;Y))\le c_m(Y).
\end{equation}
```

补一步：对 $\Omega$ 上取值的组 $z_i(\omega)\in Y$，先对每个固定 $\omega$ 用 `eq:fixed-cotype`，得 $(\sum_i\lVert z_i(\omega)\rVert^2)^{1/2}\le c_m(Y)(\mathbb E_\varepsilon\lVert\sum_i\varepsilon_iz_i(\omega)\rVert^2)^{1/2}$，两边平方后对 $\omega$ 求平均，左边变成 $\mathbb E_\omega\sum_i\lVert z_i(\omega)\rVert^2=\sum_i\mathbb E\lVert z_i\rVert^2$，右边用 Fubini 交换 $\mathbb E_\omega$ 与 $\mathbb E_\varepsilon$ 得 $c_m(Y)^2\mathbb E_\varepsilon\lVert\sum_i\varepsilon_iz_i\rVert_{L_2(Y)}^2$，开方即原式。这条不变性的用处是：一旦我们在 $G$ 上做了任意有限 $L_2$ 放大（Walsh 放大、$\mathrm{GL}(n,\mathbb F_2)$ 放大），$D_g,D_f$ 不会变大，所以后面固定不动点的 $a,b$ 在放大后仍然合法。`walsh.tex:125-127` 明说这一点：

```
Equation \eqref{eq:cotype-amplification} also preserves the bounds
\(D_g,D_f\), so the moment lifts remain available with the same
\(a,b\).
```

机器侧对应：`Target.lean:12-14` 的 `FixedCotypeBound` 逐字是

```
def FixedCotypeBound (m : ℕ) (D : ℝ) : Prop := 0 ≤ D ∧
  ∀ x : Fin m → E,
    Real.sqrt (∑ i, ‖x i‖ ^ 2) ≤ D * cubeL2 E (rademacherSum E x)
```

`FiniteCotypeBounds.lean:11-14` 是我找到的 $\ell_2\le\ell_q$ 那一步的机器版本（`finite_l2_le_lq`），结论形状 `Real.sqrt (∑ i, x i ^ 2) ≤ (m : ℝ)^(1/2-1/q) * (∑ i, x i ^ q)^(1/q)`；`FiniteCotypeBounds.lean:45-47` 的 `finiteCotype_fixed_bounds` 显式用 `max C 1` 把 cotype 常数抬到 $\ge1$，这是笔头隐含（论文 `approximation.tex:169` 写 $C_F,C_Y\ge1$）、机器必须补的一条。

## 3 矩比较引理：$L=24$ 的停机账

`preliminaries.tex:96-101`：

```
\begin{lemma}[Moment comparison]\label{lem:kahane}
For every finite Rademacher sum \(S=\sum_{i=1}^m\eps_i z_i\) in a Banach
space,
\begin{equation}\label{eq:kahane}
(\E\|S\|^2)^{1/2}\le L\,\E\|S\|,\qquad L=24.
\end{equation}
\end{lemma}
```

`preliminaries.tex:104-136` 的证明我逐步核过。记 $M=\mathbb E\lVert S\rVert$，$b=\max_i\lVert z_i\rVert$。

第一步 $b\le M$：$z_i=\mathbb E_\varepsilon(\varepsilon_iS(\varepsilon))$（正交性：只有 $j=i$ 项留存），故 $\lVert z_i\rVert\le\mathbb E\lVert\varepsilon_iS\rVert=M$。

第二步停机上尾：$S_j=\sum_{i\le j}\varepsilon_iz_i$，停在第一个 $j$ 使 $\lVert S_j\rVert>u$。条件在停到的前缀值 $z$ 上，剩余和 $h$ 仍对称，而 $\lVert z+h\rVert+\lVert z-h\rVert\ge\lVert(z+h)+(z-h)\rVert=2\lVert z\rVert>2u$，故 $\max(\lVert z+h\rVert,\lVert z-h\rVert)>u$；由 $h\stackrel{d}{=}-h$，$\mathbb P(\max>u)\le2\mathbb P(\lVert z+h\rVert>u)$，对停前的历史求和得 $\mathbb P(\text{stop occurs})\le2\mathbb P(\lVert S\rVert>u)$。

第三步尾部上尾：对固定 $j$，尾部 $T_j=\sum_{i>j}\varepsilon_iz_i$，条件在尾部值 $h$ 上，前缀 $p$ 对称且 $\lVert h+p\rVert+\lVert h-p\rVert\ge2\lVert h\rVert$，同样给 $\mathbb P(\lVert T_j\rVert>v)\le2\mathbb P(\lVert S\rVert>v)$。

第四步合成：$\lVert S\rVert>u+b+v$ 要求首次停住时的值 $\le u+b$（因为前一步 $\le u$、单跳 $\le b$），其尾部必须超过 $v$；两事件独立，得

$$\mathbb P(\lVert S\rVert>u+b+v)\le4\,\mathbb P(\lVert S\rVert>u)\,\mathbb P(\lVert S\rVert>v).$$

第五步取 $u=8M$：Markov 给 $\mathbb P(\lVert S\rVert>8M)\le M/(8M)=1/8$，又 $b\le M$ 使 $u+b\le 9M$，于是 $\mathbb P(\lVert S\rVert>9M+v)\le\tfrac12\mathbb P(\lVert S\rVert>v)$，归纳得 $\mathbb P(\lVert S\rVert>9jM)\le2^{-j}$。

第六步积分：用 $\mathbb E\lVert S\rVert^2=\sum_{j\ge0}\int_{9jM}^{9(j+1)M}\mathbb P(\lVert S\rVert>t)\,d(9\cdot j\text{段})$ 的分段粗化，即每段长度 $9M$ 上以该段左端点处的尾概率控制，得

$$\mathbb E\lVert S\rVert^2\le\sum_{j\ge0}\big[(9(j+1)M)^2-(9jM)^2\big]2^{-j}=81M^2\sum_{j\ge0}(2j+1)2^{-j}.$$

这里 $\sum_{j\ge0}(2j+1)2^{-j}=2\sum j2^{-j}+\sum2^{-j}=2\cdot2+2=6$，故 $\mathbb E\lVert S\rVert^2\le486M^2$，而 $24^2=576>486$，即 `preliminaries.tex:133-135` 的逐字结论：

```
\E\|S\|^2
\le81M^2\sum_{j\ge0}(2j+1)2^{-j}
=486M^2<24^2M^2.
```

$24$ 的机械角色：它出现在 `preliminaries.tex:161-162` 的 $a,b$ 分母里各一次，随后进入系数引理门槛的分母两次（$24L$ 与 $12\cdot24L$）。$L$ 变大只是把 $m$ 的选取门槛推高，不影响论证结构；论文作者也明说这是"explicit, sufficient constant"（`preliminaries.tex:93-94`）。反过来说，$L$ 若小于 $\sqrt{486}\approx22.05$ 就不再被这条停机论证支撑，正文取整到 24 只是为了好看。

`[推测]` 我尝试过的失败路线（本条）：想用 de la Peña 型的上尾不等式直接得到 $(\mathbb E\lVert S\rVert^p)^{1/p}\le C(p-1)(\mathbb E\lVert S\rVert)$，这样所有常数都是可追踪的 $O(p)$，但 Banach 值情形我需要额外的 2 余型来做 $p$ 的启动，而 2 余型正是我们还没有的东西，会形成循环。

## 4 有界矩提升：$a,b$ 的形状与两种对偶机制

`preliminaries.tex:153-178` 逐字：

```
\begin{lemma}[Bounded moment lifts]\label{lem:lifts}
Suppose
\[
c_m(G^*)\le D_g,\qquad c_m(F)\le D_f,
\qquad D_g,D_f\ge1.
\]
Set
\begin{equation}\label{eq:lift-parameters}
a=\frac1{2LD_g\sqrt m},\qquad
b=\frac1{2LD_f\sqrt m}.
\end{equation}
Then:
\begin{enumerate}[label=\textup{(\roman*)}]
\item For \(x_1,\ldots,x_m\in B_G\), there are \(P_\eps\in B_G\) such that
\[
\E_\eps\eps_iP_\eps=ax_i\quad(1\le i\le m).
\]
```

先看 $\sqrt m$ 的来源。$U:L_\infty(\{-1,1\}^m;G)\to\ell_2^m(G)$，$UP=(\mathbb E\varepsilon_iP_\varepsilon)_i$，右逆 $(x_i)\mapsto\sum_i\varepsilon_ix_i$ 说明它满。其伴随 $U^*(z_i^*)=\sum_i\varepsilon_iz_i^*$ 落在 $L_1(G^*)$，用 `lem:kahane` 与 `eq:fixed-cotype`：

$$\lVert U^*(z^*)\rVert_{L_1}=\mathbb E\Big\lVert\sum\varepsilon_iz_i^*\Big\rVert\ge L^{-1}\Big(\mathbb E\Big\lVert\sum\varepsilon_iz_i^*\Big\rVert^2\Big)^{1/2}\ge(LD_g)^{-1}\Big(\sum_i\lVert z_i^*\rVert^2\Big)^{1/2}.$$

`preliminaries.tex:139-144` 的商提升原理

```
If a bounded surjection \(U:A\to B\) satisfies
\(\|U^*b^*\|\ge D^{-1}\|b^*\|\), then
\begin{equation}\label{eq:quotient-lift}
\inf_{Ua=b}\|a\|\le D\|b\|.
\end{equation}
```

在这里给出 $\inf\lVert P\rVert_{L_\infty}\le LD_g\lVert(ax_i)\rVert_{\ell_2^m(G)}\le LD_g\,a\sqrt m$，因为 $x_i\in B_G$ 使 $\sum_i\lVert x_i\rVert^2\le m$。要让这个上界 $\le1$，$a$ 就必须 $\le1/(LD_g\sqrt m)$；论文取半 $1/(2LD_g\sqrt m)$ 留余量，让提升范数 $\le1/2$，从而"范数 $\le1$ 的提升存在"这句话在闭球里成立。$\sqrt m$ 与 $\lVert(ax_i)\rVert_{\ell_2^m}$ 的 $m$ 次方增长恰好抵消，这是 $\sqrt m$ 的全部机械理由。

再看 (ii) 为什么换机制。$V:\ell_2^m(F)\to L_1(\{-1,1\}^m;F)$，$Vw=\sum_j\delta_jw_j$，$\lVert Vw\rVert_{L_1}\ge(LD_f)^{-1}\lVert w\rVert_{\ell_2^m(F)}$ 是嵌入下界，并非满射。泛函 $\Lambda(Vw)=b\sum_jy_j(w_j)$ 在 $\operatorname{ran}V$ 上满足

$$|\Lambda(Vw)|\le b\sum_j\lVert y_j\rVert\lVert w_j\rVert\le b\sqrt m\,\lVert w\rVert_{\ell_2^m(F)}\le b\sqrt m\,LD_f\lVert Vw\rVert_{L_1}=\tfrac12\lVert Vw\rVert_{L_1},$$

Hahn-Banach 延到 $L_1(F)$ 上保持 $1/2$，再用 `preliminaries.tex:16-17` 的 $L_1(\Omega;Y)^*=L_\infty(\Omega;Y^*)$ 表示成 $Z\in L_\infty(F^*)$，即 `preliminaries.tex:206-213`。核对配对：$\langle Vw,Z\rangle=\mathbb E_\delta\sum_j\delta_jw_jZ_\delta=\sum_jw_j\mathbb E_\delta\delta_jZ_\delta$，故矩条件 $\mathbb E\delta_jZ_\delta=by_j$ 正是延拓泛函的限制。

两个假设各被用在哪：$c_m(G^*)\le D_g$ 只用于 $U^*$ 的下界（即对偶空间要有 2 型方向的估计）；$c_m(F)\le D_f$ 只用于 $V$ 的下界。这正是"两侧 cotype"进入机器的方式，且一侧是 $G^*$、一侧是 $F$，指标不对称：$G^*$ 与 $F$。这一点决定了后面传递时必须把 $X^*$ 的 cotype 交给定义域的对偶。

`[推测]` 我试过的失败路线（本条）：一开始想给 (i)(ii) 都只用商提升，把 $V$ 的像看成商空间。这在 $F$ 不是自反时会崩，因为 $\operatorname{ran}V$ 在 $L_1(F)$ 里的闭包的商不能自然写成 $L_\infty(F^*)$ 的子空间，得到的 $Z$ 只是 $ba$ 空间里的元素，代回 $B(x,y)$ 时配不上 $F$ 侧的向量。改用 $L_1$-$L_\infty$ 对偶 + Hahn-Banach 才能把 $Z$ 拉回 $F^*$。

## 5 标量系数引理：阻尼、Chebyshev 截断与 $AB/2$ 的压制

这一节是全文的技术心脏。`coefficient.tex:54-85` 的陈述：

```
\begin{lemma}[A coefficient of rank at least two]\label{lem:coefficient}
Let \(M_0=4\), and suppose that
\[
4\le d=\lceil2\log_2m\rceil<m.
\]
Let \(a,b>0\), put \(A=ma\), \(B=mb\), and assume
\begin{equation}\label{eq:large-parameters}
\min(A,B)\ge20M_0d(d+1)^2.
\end{equation}
```

`coefficient.tex:57` 逐字为 `4\le d=\lceil2\log_2m\rceil<m.`，`coefficient.tex:61` 逐字为 `\min(A,B)\ge20M_0d(d+1)^2.`。

$M_0=4$ 的来历在 `walsh.tex:233-237`：

```
These functions are odd, and the slow-decrease hypothesis gives
\[
\max(\|f\|_\infty,\|g\|_\infty,\|\Psi\|_\infty)
\le w_{n-2m}(T)/\gamma\le4.
```

补这一步：$\gamma\ge w_n(T)/2$（`walsh.tex:82`）且慢下降假设 $w_{n-2m}(T)\le2w_n(T)$（`walsh.tex:62`），故 $w_{n-2m}/\gamma\le2w_n/(w_n/2)=4$。所以 $M_0=4$ 是 $2$ 与 $1/2$ 两个松弛因子的商，硬编码在 `coefficient.tex:55` 与 `CoefficientTarget.lean:17` 的 `|Ψ S| ≤ 4`。

反证假设（`coefficient.tex:100-103`）：$\Psi$ 的 Fourier 支撑里每个指标二元秩 $\le1$。奇性先清掉偶权重指标：$\Psi(-S)=-\Psi(S)$ 且 $(-S)^P=(-1)^{|P|}S^P$，故 $\widehat\Psi(P)=-(-1)^{|P|}\widehat\Psi(P)$，$|P|$ 偶时为零。秩 $\le1$ 且权重奇的指标唯一写成 $P=ph^t$，$p,h\ne0$，且 $|p|$、$|h|$ 都是奇数。定义 `coefficient.tex:105-107`：

```
C_{kl}=\sum_{\substack{|p|=k\\|h|=l}}\widehat\Psi(ph^t).
\end{equation}
```

（原文 105 行前有 `\Let` 之前的公式环境起始，逐字为 `C_{kl}=\sum_{\substack{|p|=k\\|h|=l}}\widehat\Psi(ph^t).`）

Parseval 与 Cauchy-Schwarz 给 `coefficient.tex:110`：$|C_{kl}|\le M_0\sqrt{\binom mk\binom ml}$。补中间：$\sum_P\widehat\Psi(P)^2=\mathbb E|\Psi|^2\le M_0^2$，而满足 $|p|=k,|h|=l$ 的指标恰有 $\binom mk\binom ml$ 个，故 $|C_{kl}|\le\sqrt{\binom mk\binom ml}\cdot(\sum\widehat\Psi(P)^2)^{1/2}\le M_0\sqrt{\binom mk\binom ml}$。

阻尼多项式（`coefficient.tex:114-117`）：

```
H(s,u)=\sum_{\substack{1\le k,l\le m\\ k,l\ {\rm odd}}}
C_{kl}s^ku^l2^{-kl}.
\]
It has sup norm at most \(M_0\) on \([-1,1]^2\].
```

（`coefficient.tex:118` 逐字 `It has sup norm at most \(M_0\) on \([-1,1]^2\).`）它为什么 $\le M_0$：取独立符号 $D_i,E_j,R_{ij}$ 均值 $s,u,1/2$，令 $S_{ij}=D_iE_jR_{ij}$。对奇矩形 $p_ih_j$：$D_i$ 的总指数是 $p_i|h|$，奇偶同 $p_i$，故 $\mathbb E D_i^{p_i|h|}=s^{p_i}$，乘积 $s^{|p|}=s^k$；同理 $u^{|h|}$；$R_{ij}$ 在 $p_ih_j=1$ 的格子上出现一次，$\mathbb E R_{ij}=1/2$，格子数 $|p||h|=kl$，得 $2^{-kl}$。于是 $H(s,u)=\mathbb E\Psi(S)$，$|H|\le M_0$。阻尼因子 $2^{-kl}$ 就是把 $R_{ij}$ 的均值 $\tfrac12$ 塞进去的物理后果，它让 $k,l$ 同时大的矩形被指数压掉。

删除双大项（`coefficient.tex:127-138`）：删去 $k,l>d$ 得 $H_0$。用 `coefficient.tex:130` 的两条不等式

```
(k+l)\log_2m\le kl,\qquad kl/2\ge k+l.
```

第一条：$k,l>d$ 时 $\dfrac{kl}{k+l}\ge\dfrac{d}{2}\ge\log_2m$（因为 $kl/(k+l)$ 关于两个变量都单调增，下确界在 $k=l=d+1$ 附近取得，$\ge d/2$），而 $\lceil2\log_2m\rceil=d$ 给出 $d/2\ge\log_2m$。第二条：$d\ge4$ 使 $k,l\ge5$，$\tfrac1k+\tfrac1l\le\tfrac25<\tfrac12$。于是 $m^{(k+l)/2}2^{-kl}\le2^{kl/2}2^{-kl}=2^{-kl/2}\le2^{-k-l}$，$\sum_{k,l>d}2^{-k-l}\le(2^{-d}\cdot\tfrac12/(1-\tfrac14))^2<1$（$d\ge4$）。删除部分 $\le M_0$，故 $\lVert H_0\rVert_\infty\le2M_0$。

这里 $d=\lceil2\log_2m\rceil$ 的选取被精确用尽：它是"使 $m^{(k+l)/2}\le2^{kl/2}$ 成立的最小整数刻度"。若把系数 2 改成 1，即 $d=\lceil\log_2m\rceil$，则 $d/2\simeq\tfrac12\log_2m$，$m^{(k+l)/2}\le2^{kl/2}$ 在 $k,l$ 刚超过 $d$ 时不成立，删除估计会多出 $m$ 的正幂，门槛里 $d(d+1)^2$ 就要换成带 $m$ 的形状，$\min(A,B)\ge20M_0d(d+1)^2$ 再也无法由 $m^{1/q}$ 压过。

边界矩行列（`coefficient.tex:140-155`）：

```
C_{1l}=ma\sum_{|h|=l}\widehat g(h),\qquad
C_{k1}=mb\sum_{|p|=k}\widehat f(p).
```

我把这一步补全（正文只写"comparing Fourier coefficients"）。对 `coefficient.tex:76` 的投影恒等式 $\mathbb E_\sigma\sigma_i\Psi(\sigma S)=a\,g(S_{i,:})$ 两边取测试函数 $\prod_jS_{ij}^{h_j}$（即指标 $e_ih^t$）的平均。右端：$a\mathbb E_Sg(S_{i,:})\prod_jS_{ij}^{h_j}=a\widehat g(h)$。左端：作变量替换 $S'=\sigma S$（对合），$\prod_jS_{ij}^{h_j}=\sigma_i^{|h|}\prod_jS_{ij}^{\prime h_j}$，而 $(\sigma S)^{e_ih^t}=\prod_j(\sigma_iS'_{ij})^{h_j}=\sigma_i^{|h|}\prod_jS_{ij}^{\prime h_j}$，所以左端 $=\mathbb E_{\sigma}\sigma_i\sigma_i^{|h|}\cdot\mathbb E_{S'}\Psi(S')\prod_jS_{ij}^{\prime h_j}=\mathbb E_{S'}\Psi(S')(S')^{e_ih^t}=\widehat\Psi(e_ih^t)$，其中用了 $|h|$ 奇使 $\mathbb E\sigma_i^{1+|h|}=1$。对 $i$ 求和即 $C_{1l}=\sum_{|h|=l}\sum_i\widehat\Psi(e_ih^t)=ma\sum_{|h|=l}\widehat g(h)$，$m$ 是单非零行的选法数。同理 $\sum_j$ 给 $C_{k1}=mb\sum_{|p|=k}\widehat f(p)$。

混合导数（`coefficient.tex:150-155`）：

```
\partial_sH_0(0,u)&=A\sum_h\widehat g(h)(u/2)^{|h|},\\
\partial_uH_0(s,0)&=B\sum_p\widehat f(p)(s/2)^{|p|},\\
\partial_s\partial_uH_0(0,0)&=AB/2.
```

第一步：$H_0$ 中含 $k=1$ 的项未被删除，$\partial_s$ 在 $s=0$ 只留 $k=1$，得 $\sum_lC_{1l}u^l2^{-l}=ma\sum_{|h|=l}\widehat g(h)(u/2)^l=A\sum_h\widehat g(h)(u/2)^{|h|}$。第二步同理。第三步：$\partial_s\partial_u$ 在 $(0,0)$ 只留 $k=l=1$，值 $C_{11}/2$；而 $C_{11}=ma\sum_{|h|=1}\widehat g(h)=ma\cdot mb=AB$（用 `coefficient.tex:71` 的 $\widehat f(e_i)=a$、$\widehat g(e_j)=b$ 分别对 $m$ 个指标求和），故 $=AB/2$。

Chebyshev 分割（`coefficient.tex:161-167`）：

```
Expand \(H_0\) in the Chebyshev basis \(T_j(s)\), defined by
\(T_j(\cos\theta)=\cos(j\theta)\). Let \(H_1\) retain the terms
with \(j\le d\), and set \(H_2=H_0-H_1\).
Then
\begin{equation}\label{eq:separate-degrees}
\deg_sH_1\le d,\qquad \deg_uH_2\le d.
\end{equation}
```

机制：$H_0$ 的每个单项 $s^ku^l$ 满足 $k\le d$ 或 $l\le d$（双大的被删）。$s^k$ 在 $T_j(s)$ 基下只含 $j\le k$，所以 $k\le d$ 的单项全落入 $H_1$；于是 $H_2$ 里的单项都满足 $k>d$，从而 $l\le d$，即 $\deg_uH_2\le d$。这一步是"每个单项只在某一个变量里低次"这一事实的实现方式，用 Chebyshev 截断，并非用 $s$ 幂次截断，是因为 $s$ 幂次截断会破坏 $u$ 方向的次数控制。

系数与导数界（`coefficient.tex:172-182`）：

```
Each Chebyshev coefficient of a polynomial on \([-1,1]\) is bounded
by twice its sup norm, by cosine orthogonality. Since \(|T_j|\le1\),
\[
\|H_1\|_\infty\le4M_0(d+1),\qquad
\|H_2\|_\infty\le6M_0(d+1).
\]
Also, \(|T_j'(0)|\le j\), so every polynomial \(Q\) of degree at most
\(d\) satisfies
\begin{equation}\label{eq:derivative-bound}
|Q'(0)|\le d(d+1)\|Q\|_\infty.
\end{equation}
```

我核过：$|c_j|\le\frac2\pi\int_{-1}^1|Q(s)|\,|T_j(s)|/\sqrt{1-s^2}\,ds\le2\lVert Q\rVert_\infty$，故 $\lVert H_1\rVert_\infty\le\sum_{j\le d}2\lVert H_0\rVert_\infty=2(d+1)\cdot2M_0=4M_0(d+1)$；$\lVert H_2\rVert_\infty\le\lVert H_0\rVert+\lVert H_1\rVert\le2M_0+4M_0(d+1)\le6M_0(d+1)$。$|T_j'(0)|$：由 $T_j'(x)=jU_{j-1}(x)$ 与 $x=\cos\theta$，$T_j'(0)=j\sin(j\pi/2)/\sin(\pi/2)$，绝对值 $\le j$。于是对 $\deg\le d$ 的 $Q=\sum_{j\le d}q_jT_j$，$|Q'(0)|\le\sum|q_j|j\le2\lVert Q\rVert_\infty\sum_{j\le d}j=d(d+1)\lVert Q\rVert_\infty$，即 `coefficient.tex:181` 逐字 `|Q'(0)|\le d(d+1)\|Q\|_\infty.`。

两次应用（`coefficient.tex:183-199`）先在一侧变量上用导数界、再在另一侧变量上用一次，得 `coefficient.tex:198` 逐字

```
\le M_0d(d+1)\bigl(A+B+10d(d+1)^2\bigr).
```

我把 $10$ 的来历摊开：$\lVert\partial_sH_2(0,\cdot)\rVert_\infty\le\lVert\partial_sH_0(0,\cdot)\rVert+\lVert\partial_sH_1(0,\cdot)\rVert\le AM_0+4M_0d(d+1)^2$（第一项来自 `eq:H-derivatives` 的第一行加上 $|g|$ 的 sup 界 $M_0$，第二项来自对 $H_1$ 在 $s$ 变量用 `eq:derivative-bound`），同理 $\lVert\partial_uH_1(\cdot,0)\rVert_\infty\le BM_0+6M_0d(d+1)^2$。混合导数分解成 $\partial_s\partial_uH_0=\partial_s\partial_uH_1+\partial_s\partial_uH_2$，第一项对 $\partial_uH_1(\cdot,0)$（$s$-次数 $\le d$）用导数界给 $d(d+1)(BM_0+6M_0d(d+1)^2)$，第二项对 $\partial_sH_2(0,\cdot)$（$u$-次数 $\le d$）用导数界给 $d(d+1)(AM_0+4M_0d(d+1)^2)$；相加得 $M_0d(d+1)(A+B)+10M_0d^2(d+1)^3$，正是 `eq:mixed-upper`。$6+4=10$ 就来自 $\lVert H_1\rVert$ 前的 $4$ 与 $\lVert H_2\rVert$ 前的 $6$，而那两个 $4,6$ 又来自删除后多出的一个 $M_0$。

压制（`coefficient.tex:200-206`）：

```
On the other hand, \eqref{eq:large-parameters} gives
\[
\frac{AB}{2}\ge5M_0d(d+1)^2(A+B),\qquad
10d(d+1)^2\le\frac{A+B}{4M_0}.
\]
Since \(5(d+1)>1+1/(4M_0)\), these inequalities contradict
```

核对第一条：设 $\mu=\min(A,B)$，则 $A+B\le2\max(A,B)$，$AB=\mu\max\ge\mu(A+B)/2$，$AB/2\ge\mu(A+B)/4$；再由 $\mu\ge20M_0d(d+1)^2$ 得 $AB/2\ge5M_0d(d+1)^2(A+B)$。第二条：$10M_0d(d+1)^2\le\mu/2\le(A+B)/2$，正文写 $(A+B)/4$ 只是取弱一些的形式。合起来，$AB/2$ 与 $M_0d(d+1)(A+B)+10M_0d^2(d+1)^3$ 的差为正（除以 $(d+1)(A+B)$ 后是 $5M_0d$ 对 $M_0d+\tfrac14$），矛盾。所以 $20M_0=80$ 这个数、$d(d+1)^2$ 的三次对数增长、以及 $AB/2$ 里的 $\tfrac12$（来自 $2^{-kl}$ 在 $k=l=1$ 处取值 $\tfrac12$）三者互相咬合：门槛是 $80\cdot d(d+1)^2$，而 $\tfrac12$ 是"赢面"的一半来源。

紧凑性化归（`coefficient.tex:87-98`）：先证存在性再取最小值。可行三元组 $(\Psi,f,g)$ 是有限维空间里由逐点闭不等式定义的闭有界集，故紧；$\max_{\operatorname{rank} P\ge2}|\widehat\Psi(P)|$ 连续；若该最大值恒不为零，紧集上有正下界 $c_*$；空集情形任意正 $c_*$ 都可以。这一步对 Lean 侧是必需的，因为机器里 $c_*$ 是 `∃ c, 0 < c`（`CoefficientTarget.lean:29-31`），存在性必须由紧性给出。

`[推测]` 本节两条失败路线：(1) 我原先打算跳过 $H_1/H_2$ 分割，直接对整块 $H_0$ 用 Markov-Bernstein 不等式 $|Q'(0)|\le(\deg Q)\lVert Q\rVert_\infty$ 一类的一次界。这里 $\deg$ 是 $m$，混合导数会带来 $m^2$ ，并非 $d(d+1)$，门槛变成 $\min(A,B)\gtrsim m^2$，而可得的 $A,B$ 只有 $m^{1/q}$ 增长，$q$ 稍大就永远追不上。(2) 另一条：不设阻尼因子 $2^{-kl}$，直接用 $\sum_{k,l}$ 的 $\binom mk\binom ml$ 组合数增长。此时 $k\approx l\approx m/2$ 的矩形权重 $\sim2^m/\sqrt m$ 完全压不住，Parseval 的 $M_0$ 会被指数放大，$H$ 的 sup 界随之失效。

`[推测]` 第三条：把 $H$ 的表示用 $R_{ij}$ 换成 Bernoulli 参数 $\theta$（均值 $2\theta-1$）会更自然，但那样阻尼因子变成 $\theta$ 的多项式，并非 $2^{-kl}$，删除估计里的 $2^{-kl/2}$ 就换不成 $2^{-k-l}$；论文选均值 $1/2$ 正是为了让"每格一半"给出干净的 $2^{-kl}$。

## 6 帧与 $\mathrm{GL}(n,\mathbb F_2)$ 等变提升：把向量依赖压成符号矩阵

`walsh.tex:5-12` 交代了这一节要解决的问题：

```
We now show that a slow decrease of Walsh norms forces a large Walsh
norm at almost twice the original index. The proof uses the scalar
coefficient lemma to find several independent Walsh factors inside a
single pairing. To make that lemma applicable, we first arrange that
our pairings depend only on their matrices of signs. The initial Walsh
test is indexed by vectors, whereas the scalar lemma concerns arbitrary
sign matrices; the frame construction below removes the extra dependence
on the vectors.
```

`walsh.tex:18-27` 的帧引理：

```
\begin{lemma}[Pairs of frames]\label{lem:frames}
The action
\[
(U,V)\longmapsto(HU,H^{-t}V),\qquad H\in\GL(n,\F_2),
\]
is transitive on pairs of frames of fixed lengths with a prescribed
matrix of pairings \((u_i\cdot v_j)\).
Every binary \(r\times s\) matrix is such a pairing matrix if
\(n\ge r+s\).
\end{lemma}
```

机械理由：$H^{-t}$ 出现在对偶侧是为了把配对 $u_i\cdot v_j$ 保持不变：$(Hu_i)\cdot(H^{-t}v_j)=u_i\cdot(H^{t}H^{-t}v_j)=u_i\cdot v_j$。可行性 $n\ge r+s$ 来自 `walsh.tex:46-47` 的显式构造 $u_i=(e_i,0)$、$v_j=(D_{:,j},e_j)$，前段 $r$ 维与后段 $s$ 维各占一份，$n=r+s$ 恰好够用；维数不够时任意 $D$ 就未必实现得了。传递性的证明把 $H$ 的自由度切成三块：$\operatorname{span}(U)$ 上的映射由 $u_i\mapsto u_i'$ 固定，$\ker\pi$ 内的映射可任选同构，剩下 $n-(r+s)$ 维由"共同像 $\pi(\operatorname{span}(U))$ 的补基提升"决定。`walsh.tex:44-45` 的关键一句是 $H U=U'$ 与 $\pi'H=\pi$，后者逐坐标写就是 $(H^{-t}v_j)\cdot u_i'=v_j\cdot u_i$，于是等价于 $H^{-t}V=V'$。

Step 1 的两次放大（`walsh.tex:84-101`）：先取 $\gamma=\mathbb E_{u,v}\chi(u,v)q_v(Tp_u)\ge w_n(T)/2$（`walsh.tex:82`，用 `eq:walsh-bilinear` 的准极值组），再在 $V_n\times V_n$ 上放大：

```
x'_u(\alpha,\beta)=(-1)^{u\cdot\beta+\alpha\cdot\beta}p_{u+\alpha},
\qquad
y'_v(\alpha,\beta)=(-1)^{\alpha\cdot v}q_{v+\beta}.
```

`walsh.tex:99-100` 的相位恒等式逐字为

```
u\cdot\beta+\alpha\cdot\beta+\alpha\cdot v
=(u+\alpha)\cdot(v+\beta)+u\cdot v.
```

我展开验证：右端 $=(u+\alpha)\cdot(v+\beta)+u\cdot v=u\cdot v+u\cdot\beta+\alpha\cdot v+\alpha\cdot\beta+u\cdot v$，在 $\mathbb F_2$ 里两个 $u\cdot v$ 相消，得 $u\cdot\beta+\alpha\cdot v+\alpha\cdot\beta$，与左端逐项一致。有了它，配对变成

$$y'_v(T'x'_u)=\mathbb E_{\alpha,\beta}(-1)^{u\cdot\beta+\alpha\cdot\beta+\alpha\cdot v}q_{v+\beta}(Tp_{u+\alpha})=(-1)^{u\cdot v}\mathbb E_{a,b}\chi(a,b)q_b(Tp_a)=\gamma\chi(u,v),$$

第二步把 $(\alpha,\beta)\mapsto(u+\alpha,v+\beta)$ 当作 $V_n\times V_n$ 上的平移，均匀平均不变。"精确实现符号"是整个等变构造的前提。

第二次放大在 $R\in\mathrm{GL}(n,\mathbb F_2)$ 上做（`walsh.tex:103-112`），$x_u(R)=x'_{Ru}$、$y_v(R)=y'_{R^{-t}v}$，得 `eq:exact-pairing`：$B(x_u,y_v)=\gamma\chi(u,v)$。核一下：$B(x_u,y_v)=\mathbb E_R\langle y'_{R^{-t}v},T'x'_{Ru}\rangle=\mathbb E_R\gamma\chi(Ru,R^{-t}v)$，而 $(Ru)\cdot(R^{-t}v)=u\cdot(R^{t}R^{-t}v)=u\cdot v$，故每个 $R$ 给出同一个 $\chi(u,v)$，平均后不变。右平移 $\Lambda(H)z(R)=z(RH)$ 满足 `walsh.tex:118-121`：

```
\Lambda(H)x_u=x_{Hu},\qquad
\Lambda(H)y_v=y_{H^{-t}v},\qquad
\Lambda(H_1)\Lambda(H_2)=\Lambda(H_1H_2).
```

`walsh.tex:122` 说 "The orders follow directly from \((RH)^{-t}=R^{-t}H^{-t}\)"，确实：$\Lambda(H_2)\Lambda(H_1)z(R)=z(RH_1H_2)$，按右作用读即 $\Lambda(H_1H_2)$。同平移保 $B$：$B(\Lambda(H)x,\Lambda(H)y)=B(x,y)$，因为 $(Ru)\cdot(R^{-t}v)$ 在参数 $R$ 被整体右乘 $H$ 后仍是 $u\cdot v$，这是"配对只依赖符号模式"的引擎。

Step 2 的等变化（`walsh.tex:130-142`）：

```
For every primal \(m\)-frame \(U=(u_i)_{i=1}^m\), choose
\(P_{U,\eps}\in B_{\widetilde G}\) with
\[
\E_\eps\eps_iP_{U,\eps}=ax_{u_i}.
\]
We can make these choices equivariant. For one reference frame,
take the lifts from Lemma~\ref{lem:lifts} and average each of them over
its stabilizer under \(\Lambda\). The prescribed moments are fixed
by this stabilizer, and the averaged lifts are stabilizer-invariant.
Transport them to any other frame by \(\Lambda(H)\).
Two transporters differ on the right by a stabilizer element, so
the result is well-defined and equivariant.
```

把 `lem:lifts` 用在放大后的空间上合法，靠 $c_m(\widetilde G^*)\le D_g$（`eq:cotype-amplification`）与 $w_j(\widetilde T)=w_j(T)$（`walsh.tex:123-124`）。对稳定子取平均时矩没被抹掉：$\mathbb E_\varepsilon\varepsilon_i\,\mathbb E_{H\in\operatorname{Stab}}\Lambda(H)P=a\mathbb E_Hx_{Hu_i}=ax_{u_i}$，用了 $H$ 逐点固定 $u_i$。搬运的唯一性：若 $HU_0=U=H'U_0$，则 $H'H^{-1}$ 固定 $U$，而参考提升已按稳定子平均过，故 $\Lambda(H)$ 与 $\Lambda(H')$ 给同一个 $P_{U,\varepsilon}$。这一步是我花时间最多的地方，因为我最初打算在整个 $\mathrm{GL}$ 上共轭平均，那会把矩平均成 $\mathrm{GL}$-不变量而被 $\sum_i$ 之类的对称求和抵消。

于是 `walsh.tex:153-162` 的三个函数只依赖符号模式与提升标签；`walsh.tex:163` 一句 `All patterns are feasible since \(n>4m\).`：把 $v\ne0$ 看成长度 $1$ 的对偶帧需 $n\ge m+1$，两个长度 $m$ 的帧需 $n\ge2m$，再留 Step 3 的标记位；$n>4m$ 一次覆盖全部，并同时给出 $n'=n-2m>2m\ge1$。

三个矩恒等式 `walsh.tex:165-174` 是纯代入：$\mathbb E_\varepsilon\varepsilon_i\Phi(S,\varepsilon,\delta)=B(\mathbb E_\varepsilon\varepsilon_iP_{U,\varepsilon},Z_{V,\delta})=aB(x_{u_i}\text{ 组装},Z)=a\psi(S_{i,:},\delta)$；$\mathbb E_\delta\delta_j\Phi=b\phi(S_{:,j},\varepsilon)$；$\mathbb E_\varepsilon\varepsilon_i\phi(s,\varepsilon)=aB(x_{u_i},y_v)=a\gamma\chi(u_i,v)=a\gamma s_i$。

`[推测]` 本处一条失败路线：跳过帧引理，直接对 $(u,v)$ 的联合分布做平均，指望 $\Phi$ 自动只依赖符号矩阵。这在 $n\le r+s$ 时立刻失败（配对矩阵不可实现）；更糟的是同一符号矩阵可对应不同的线性相关结构，而 $P_{U,\varepsilon}$ 依赖 $U$ 的整体，相关结构变了值就变，等变性无从建立。另一条：用正交群代替 $\mathrm{GL}(n,\mathbb F_2)$，但 $\chi(u,v)=(-1)^{u\cdot v}$ 只在 $\mathbb F_2$ 上有意义，换群会破坏 `eq:exact-pairing` 里的等号。

## 7 $n'=n-2m$ 的分割与奇部一致界

`walsh.tex:177-185`：

```
\textit{Step 3: control the odd parts on a smaller Walsh cube.}
We need a bound that remains useful after division by \(\gamma\).
For every fixed choice of lift labels, we claim that
\begin{equation}\label{eq:odd-bounds}
\|\Odd_S\Phi(\cdot,\eps,\delta)\|_\infty,\quad
\|\Odd_s\phi(\cdot,\eps)\|_\infty,\quad
\|\Odd_t\psi(\cdot,\delta)\|_\infty
\le w_{n'}(T).
\end{equation}
```

分解 $V_n=V_{n'}\oplus\mathbb F_2^m\oplus\mathbb F_2^m$，固定 $S_0=((-1)^{D_{ij}})$，取 $U(u)_i=(u,e_i,0)$，$V^{+}(v)_j=(v,D_{:,j},e_j)$，$V^{-}(v)_j=(v,D_{:,j}+\mathbf1,e_j)$（`walsh.tex:189-196`）。算符号：$\chi(U(u)_i,V^{+}(v)_j)=(-1)^{u\cdot v+e_i\cdot D_{:,j}+0\cdot e_j}=\chi(u,v)S_0{}_{ij}$；$V^{-}$ 中段多 $\mathbf1$，$e_i\cdot\mathbf1=1$，故整体变号，矩阵为 $-\chi(u,v)S_0$。`walsh.tex:198` 说明标记位的作用：`The tags \(e_i,e_j\) ensure independence for every \(u,v\).`，即使所有 $u$ 相同也无妨。

于是 `walsh.tex:202-205`：

```
B\left(P_{U(u),\eps},
\frac{Z_{V^+(v),\delta}-Z_{V^-(v),\delta}}2\right)
=\chi(u,v)(\Odd_S\Phi)(S_0,\eps,\delta).
```

补完：第一项 $=\Phi(\chi(u,v)S_0,\varepsilon,\delta)$，第二项 $=\Phi(-\chi(u,v)S_0,\varepsilon,\delta)$，半差 $=\chi(u,v)\frac{\Phi(S_0)-\Phi(-S_0)}2=\chi(u,v)\mathcal O_S\Phi(S_0,\varepsilon,\delta)$，用了 $\mathcal O$ 是奇算子。固定 $\varepsilon,\delta$，把 $u\mapsto P_{U(u),\varepsilon}$ 当作 $V_{n'}$ 索引、范数 $\le1$ 的一族，$v\mapsto\frac{Z_{V^+}-Z_{V^-}}2$ 当作对偶侧范数 $\le1$ 的一族，对 $n'$ 用 `eq:walsh-bilinear` 即得 $|\mathcal O_S\Phi(S_0,\varepsilon,\delta)|\le w_{n'}(\widetilde T)=w_{n'}(T)$。这正是"$u,v$ 只在自己那半截 cube 上动"的兑现方式：标记位吃掉 $2m$ 个坐标，剩余自由度 $n'$ 就是被测试的 Walsh 阶。

$\phi$ 用 $(v,h,e_1)$ 与 $(v,h+\mathbf1,e_1)$（$s_i=(-1)^{h_i}$），$\psi$ 用 $(v,0,e_j)$ 配 $(u,e_1,h)$ 与 $(u,e_1,h+\mathbf1)$（`walsh.tex:211-218`）。`walsh.tex:219`：`The \(e_1\) tags keep the singleton vectors nonzero.`，即 $\phi,\psi$ 的定义要求 $v\ne0$、$u\ne0$，加一位 $e_1$ 让长度为 1 的"帧"永远非零。

`[推测]` 可能的失败路线一：把奇部界写成 $w_n(T)$ ，并非 $w_{n'}(T)$。做不到，取奇部要用 $V^{+}$、$V^{-}$ 的差，两者都消耗标记位，$u,v$ 只能在 $V_{n'}$ 上动，可用的最紧界是 $w_{n'}$。而"除以 $\gamma$"恰恰需要 $w_{n'}=w_{n-2m}$，与慢下降假设 $w_{n-2m}\le2w_n$ 的形状对上。路线二：想用相关结构代替标记位来强制帧独立，那会让帧引理的传递性失效（配对矩阵不可任意指定），$\Phi$ 就不再只依赖 $S$。

## 8 秩至少二的指标到维数倍增：$n$ 到 $2(n-2m)$

`walsh.tex:225-232` 的归一化：

```
f(s)&=\gamma^{-1}\Odd_s\E_\eps\phi(\eps s,\eps),\\
g(t)&=\gamma^{-1}\Odd_t\E_\delta\psi(\delta t,\delta),\\
\Psi(S)&=\gamma^{-1}\Odd_S\E_{\eps,\delta}
                  \Phi(\eps S\delta,\eps,\delta).
```

由 `eq:odd-bounds` 与 `walsh.tex:234-236` 得三者 sup 界 $\le w_{n-2m}(T)/\gamma\le4$，$M_0=4$ 落地。一次矩给出 `walsh.tex:241-242` 逐字

```
\widehat f(e_i)
=\gamma^{-1}\E_{s',\eps}s'_i\eps_i\phi(s',\eps)=a.
```

补最后等号：$\mathbb E_{s,\varepsilon}s_i\varepsilon_i\phi(s,\varepsilon)=\mathbb E_ss_i\big(\mathbb E_\varepsilon\varepsilon_i\phi(s,\varepsilon)\big)=\mathbb E_ss_i(a\gamma s_i)=a\gamma$，用 `walsh.tex:170` 与 $\mathbb E_ss_i^2=1$。奇投影不改一次系数：$\mathbb E_s\frac{F(s)-F(-s)}2s_i$ 中把 $s\to-s$ 代入第二项得 $+\mathbb E_sF(s)s_i$，半和复原。故 $\widehat f(e_i)=a$，同理 $\widehat g(e_j)=b$。

行列投影是 `walsh.tex:256-265` 的四行推导，末两行逐字为

```
&=a\,\E_\delta\frac{\psi(\delta S_{i,:},\delta)
                         -\psi(-\delta S_{i,:},\delta)}2\\
&=a\gamma\,g(S_{i,:}).
```

第一行到第二行：$\gamma\mathbb E_\sigma\sigma_i\Psi(\sigma S)=\mathbb E_{\xi,\varepsilon,\delta}\xi_i\varepsilon_i\Phi(\xi S\delta,\varepsilon,\delta)$ 用了 $\xi=\varepsilon\sigma$ 替换（三个符号向量仍独立均匀）；第二行用 `walsh.tex:167` 的 $\mathbb E_\varepsilon\varepsilon_i\Phi(S,\varepsilon,\delta)=a\psi(S_{i,:},\delta)$ 把 $\varepsilon$ 积掉，只剩 $\xi_i$ 与 $S_{i,:}$ 的耦合；第三行用 $\mathbb E_\xi\xi_if(\xi_iW)=\frac{f(W)-f(-W)}2$；第四行按 $g=\gamma^{-1}\mathcal O_t\mathbb E_\delta\psi$ 的定义。至此 `eq:scalar-projections` 成立，`lem:coefficient` 的全部假设就位，参数量为固定的 $m,a,b$。

选出 $P$、$\operatorname{rank}_{\mathbb F_2}P=k\ge2$、$|\widehat\Psi(P)|\ge c_*$（`walsh.tex:272-273`）。$\Psi$ 奇且该系数非零逼 $|P|$ 为奇数，于是"去掉奇投影"对该系数无影响（`walsh.tex:274-277`）。`walsh.tex:281-284` 的恒等式我逐项核过：

```
\gamma\widehat\Psi(P)
=\E_{\eps,\delta}
\left[\left(\prod_{i,j}(\eps_i\delta_j)^{P_{ij}}\right)
\widehat{\Phi_{\eps,\delta}}(P)\right].
```

由 $\gamma\widehat\Psi(P)=\mathbb E_S\mathbb E_{\varepsilon,\delta}\Phi_{\varepsilon,\delta}(\varepsilon S\delta)S^P$，作 $S'=\varepsilon S\delta$ 即 $S=\varepsilon S'\delta$，则 $S^P=\prod_{ij}(\varepsilon_iS'_{ij}\delta_j)^{P_{ij}}=\big(\prod_{ij}(\varepsilon_i\delta_j)^{P_{ij}}\big)(S')^P$，而 $\varepsilon S\delta=S'$，故内层对 $S'$ 的平均恰是 $\widehat{\Phi_{\varepsilon,\delta}}(P)$。对固定 $\varepsilon,\delta$ 取最大即 `walsh.tex:289` 逐字 `|\widehat h(P)|\ge c_*\gamma.`；`walsh.tex:291` 补一句 "No oddness assertion about this individual function \(h\) is needed."，因为 $\varepsilon,\delta$ 的选取已把奇性用尽。

Step 5（`walsh.tex:294-333`）把系数变成 Walsh 测试。取 $U_i=(u'_i,e_i,0)$、$V(D)_j=(v'_j,D_{:,j},e_j)$，`walsh.tex:305-309`：

```
B\left(P_{U,\eps},
\E_D(-1)^{\langle P,D\rangle}Z_{V(D),\delta}\right)
=\widehat h(P)(-1)^{\sum_{i,j}P_{ij}u'_i\cdot v'_j},
```

正文用一句话交代：`Indeed, translate the uniform matrix \(D\) by \((u'_i\cdot v'_j)_{ij}\) in the defining Fourier average.`（`walsh.tex:311-312`）。核对平移：$\langle P,D+(u_i'\cdot v_j')_{ij}\rangle=\langle P,D\rangle+\sum_{ij}P_{ij}u_i'\cdot v_j'$，而 $D\mapsto D+(u_i'\cdot v_j')_{ij}$ 是 $\{0,1\}^{m\times m}$ 上的双射；同时 $V(D+(u_i'\cdot v_j'))$ 恰是把 $v'_j$ 换成 $v'_j+\sum_iP$-相关项后的……更直接地：$B(P_{U,\varepsilon},Z_{V(D),\delta})=h\big(\chi(u',v')\,S_D\big)$，其中 $S_D=(-1)^{D}$，故 $\mathbb E_D(-1)^{\langle P,D\rangle}h(\chi(u',v')S_D)$ 对 $D$ 做平移后等于 $\big(\prod_{ij}(-1)^{P_{ij}u_i'\cdot v_j'}\big)\mathbb E_D(-1)^{\langle P,D\rangle}h(S_D)=\widehat h(P)(-1)^{\sum P_{ij}u_i'\cdot v_j'}$。两端向量范数都 $\le1$：前者在 $B_{\widetilde G}$，后者是单位球的凸组合（$\mathbb E_D$ 带符号时范数 $\le1$ 由三角不等式）。

关键的秩分解 $I^tPJ=\mathrm{Id}_k$（$I,J$ 为 $m\times k$ 二元矩阵，`walsh.tex:317-318`）。存在性：$\operatorname{rank} P=k$ 说明 $P$ 在 $\mathrm{GL}(m,\mathbb F_2)\times\mathrm{GL}(m,\mathbb F_2)$ 双边等价下化为 $\begin{pmatrix}\mathrm{Id}_k&0\\0&0\end{pmatrix}$，取 $I,J$ 为相应单位列即可。代入 $u'_i=\sum_\ell I_{i\ell}\zeta_\ell$、$v'_j=\sum_{\ell'}J_{j\ell'}\eta_{\ell'}$：

$$\sum_{ij}P_{ij}u_i'\cdot v_j'=\sum_{\ell,\ell'}\zeta_\ell\cdot(I^tPJ)_{\ell\ell'}\eta_{\ell'}=\sum_{\ell=1}^k\zeta_\ell\cdot\eta_\ell,$$

这正是 $V_{kn'}$ 上 Walsh 测试的相位（$k$ 对 $(\zeta_\ell,\eta_\ell)$，每对独立地跑满 $n'$ 维）。于是 `walsh.tex:330-333` 逐字

```
w_{2n'}(T)\ge w_{kn'}(T)
=w_{kn'}(\widetilde T)\ge|\widehat h(P)|
\ge(c_*/2)w_n(T).
```

第一等号是 $w$ 在放大下不变，第二不等号是该 $kn'$ 阶测试的幅度，$(c_*/2)$ 来自 $\gamma\ge w_n/2$。`walsh.tex:334` 逐字 `Taking \(c_1=\min(1/2,c_*/2)\) proves the lemma.`，其中 $\min$ 与 $1/2$ 是为下一步的块论证保留"比值 $<2$"的余量。

维数增长的账面：一次增长把阶从 $n$ 送到 $2(n-2m)$，中间经过 $kn'$ 且 $k\ge2$；若 $P$ 的秩更大，我们只借单调性 $w_{2n'}\ge w_{kn'}$ 取 $k=2$ 那一档，$k>2$ 的额外增益被故意丢掉。`[推测]` 这个取舍是有意的：保留 $k$ 会引出非线性迭代与另一套参数，而块论证只需要"$c_1$ 量级的下界 + 至少 $3/2$ 的指标放大"。

`[推测]` 失败路线一：不加倍维数，试图在同一阶 $n$ 上做常数改进。结构上不可能：所有约束（矩条件、sup 界）都固定在同一 $n$，把 Fourier 能量全部放在秩 1 指标上是相容的，只有"行、列两侧同时达到 $a$、$b$ 量级"才被 `lem:coefficient` 排除。路线二：跳过 $I^tPJ=\mathrm{Id}_k$，直接用 $P$ 的行向量当自由变量，会得到 $\zeta_\ell$ 之间的耦合相位，$k$ 个因子不再独立，$w$ 的阶数无法写成 $kn'$。

## 9 从增长到一致衰减：$n_0$、$\rho_N$ 与有限秩的最后一次使用

`walsh.tex:339-342` 把有限秩的位置说得很清楚：

```
The growth lemma turns a sufficiently late slow decrease into an
infinite sequence of slow decreases for the same operator. For a
finite-rank operator, this would contradict its Hilbert-space bound.
This is the only point at which finite rank is used.
```

`walsh.tex:344-360` 的定理含三处需要盯住的细节：结论 `w_n(T)\le\tfrac12 w_{n-2m}(T)\qquad(n\ge n_0)`（`walsh.tex:350`）；衰减序列 $\rho_N\to0$ 独立于 $G,F,T$（`walsh.tex:352-353`）；`walsh.tex:357-360` 明确把结论延伸到"有限秩映射的算子范数极限"。

$n_0$ 的算法（`walsh.tex:362-366`）：

```
Let \(c_1\) be given by Lemma~\ref{lem:growth}. Choose an integer
\(K>\log_2(1/c_1)\), and put
\[
n_0=4m(K+2)+2.
\]
```

块的适配（`walsh.tex:376-381`）：$a_n=\lceil3n/2\rceil$，块 $[a_n+2m(j-1),a_n+2mj]$（$1\le j\le K$）要落在 $[n,2n-4m]$ 内；右端条件 $a_n+2mK\le2n-4m$ 等价于 $2n-a_n\ge2mK+4m$，而 $2n-\lceil3n/2\rceil=\lfloor n/2\rfloor$。`walsh.tex:380-381` 逐字

```
fit in this interval, since
\(2n-a_n=\lfloor n/2\rfloor\ge2mK+4m+1\).
```

代入 $n\ge n_0$ 得 $\lfloor n/2\rfloor\ge2m(K+2)+1=2mK+4m+1$，逐项吻合；$+1$ 是取整余量。另需 $a_n\le2n-4m$，即 $n\ge8m$，由 $K\ge1$ 时 $n_0\ge8m+2$ 保证；$a_n\ge n$ 自动。

望远比（`walsh.tex:382-387`）：$\prod_{j=1}^K\frac{w_{a_n+2m(j-1)}}{w_{a_n+2mj}}=\frac{w_{a_n}}{w_{a_n+2mK}}\le\frac1{c_1}$。上界来源：增长引理给 $w_{2n-4m}\ge c_1w_n$，单调性把该下界铺满整个 $[n,2n-4m]$；而 $w\le w_n$ 在同一区间成立，于是比值 $\le w_n/(c_1w_n)=1/c_1$。$2^K>1/c_1$ 使 $K$ 个比值的几何平均 $<2$，故存在右端点 $t=a_n+2mj$ 使 $w_{t-2m}(T)\le2w_t(T)$，同时 $t\ge a_n+2m\ge3n/2$、$w_t\ge c_1w_n$（`walsh.tex:388-392`）。

迭代与矛盾（`walsh.tex:393-403`）：在 $t$ 处重复，得 $n_j\ge(3/2)^jn$、$w_{n_j}\ge c_1^jw_n$。`walsh.tex:394-395` 特意为 "Every application of the growth lemma returns an inequality for the original \(T\); its auxiliary amplifications are discarded."，即放大空间是逐次用完即弃的装置，不会累积维数。再配 `eq:rank-dependent-decay`：

```
0<w_n(T)\le D_Tc_1^{-j}2^{-n_j/2}\longrightarrow0,
```

因为 $2^{-n_j/2}\le2^{-(3/2)^jn/2}$ 压过 $c_1^{-j}$。$2^{-n/2}$ 的来源在 `preliminaries.tex:67-69`，逐字含 `matrix gives \(\|W_n^{\Id_H}\|=2^{-n/2}\), proving (iii).`：有限秩 $T$ 分解为 $G\to H\to F$，$H$ 有限维 Hilbert；归一化 Walsh 矩阵满足 $2^{-n}\sum_{v}\chi(u,v)\chi(u',v)=\delta_{u,u'}$，即 $2^{-n/2}$ 倍的正交矩阵，范数恰 $2^{-n/2}$。这就是 Littlewood-Paley 型尺度在本证明里的真实形态：速率来自 Walsh 系统的正交性，步长来自 $2m$。

$\rho_N$ 的显式形式（`walsh.tex:410-414`）逐字为

```
\rho_N=
\begin{cases}
1,&N<n_0,\\
2^{-\lfloor(N-n_0)/(2m)\rfloor},&N\ge n_0.
\end{cases}
```

核对：`eq:uniform-drop` 给 $w_N\le2^{-j}w_{N-2mj}$；取 $j=\lfloor(N-n_0)/(2m)\rfloor$ 时 $N-2mj\ge n_0-2m+\text{(余数)}\ge0$，迭代 $j$ 次后用 $w\le\lVert T\rVert$（`eq:walsh-basic`(i) 上界）即 $w_N\le2^{-j}\lVert T\rVert$。$N<n_0$ 段填 $1$ 是平凡情形。

范数极限的传递（`walsh.tex:416-420`）用 `preliminaries.tex:54` 逐字 `|w_n(A)-w_n(B)|\le\|A-B\|.`：$W_n^{A-B}=W_n^A-W_n^B$ 加上界 (i) 给出该连续型，于是 $w_s(T_j)\to w_s(T)$ 与 $\lVert T_j\rVert\to\lVert T\rVert$ 一起把两条估计传下去。这一步是 $T=J$ 的命门：$J$ 的秩无限，只有 $S_jJ$ 有限秩。

`walsh.tex:423-430` 的 remark 同时管理两种"秩"：

```
The constant \(D_T\) may depend on the operator rank. It is used only
to rule out an infinite sequence of slowly decreasing indices for
one fixed operator; the resulting \(n_0\) and \(\rho_N\) depend only
on the fixed moment parameters. The binary ranks of Fourier indices
in Lemmas~\ref{lem:coefficient} and~\ref{lem:growth} play a different role: they
count the independent Walsh factors extracted from a coefficient.
```

`[推测]` 本处失败路线：想让 $D_T$ 也与秩无关，从而跳过反证迭代直接写 $w_n(T)\le D\,2^{-n/2}$。`eq:walsh-basic`(i) 左端 $2^{-n/2}\lVert T\rVert\le w_n(T)$ 说明任何一致上界不能快于 $2^{-n/2}$，而增长引理只给"$c_1$ 量级"的下降，两者合并最多得到步长 $2m$ 的几何衰减 $2^{-\lfloor(N-n_0)/(2m)\rfloor}$；想要一致速率 $2^{-N/2}$ 就必须让 $m$ 有界，而 $m$ 恰恰必须取大才能过 `eq:large-parameters` 的门槛。这是一处真实的取舍，也解释了正文为何只声明 $\rho_N\to0$ 而不写速率。

## 10 紧致定义域 $G$：$3\Delta$、$12\Delta$ 与权 $2^{-l}$ 的常数链

`approximation.tex:4-12` 开门见山地说清了为什么要造新空间：

```
We now transfer Walsh decay to the identity of \(X\).
The approximation property will let us apply Theorem~\ref{thm:uniform-decay}
to compact maps into \(X\). We therefore factor the inclusion of
each finite-dimensional \(E\subset X\) through a compact map
whose domain dual has a controlled moment estimate.
Using \(E\) itself as the domain would not suffice: the quotient
\(E^*\) of \(X^*\) need not inherit the cotype estimate of \(X^*\).
Instead, we enlarge \(E\) to retain the moment lifts available in
\(X\), and use decreasing weights to obtain compactness.
```

`approximation.tex:16-24` 的引理陈述：

```
Let \(m\ge1\) be an integer, let \(\Delta\ge1\), and let \(X\) be
a Banach space with \(c_m(X^*)\le\Delta\).
For every nonzero finite-dimensional subspace \(E\subset X\), there
exist a Banach space \(G\), an injective compact operator \(J:G\to X\),
and a contraction \(\iota:E\to G\), such that
\begin{equation}\label{eq:compact-domain}
J\iota x=x\quad(x\in E),\qquad
\|J\|\le2,\qquad c_m(G^*)\le12\Delta.
\end{equation}
```

第一层：有限层提升 `approximation.tex:34-36`：

```
\E_\eps\eps_iH_l(\eps)=z_i,\qquad
\|H_l\|_{L_2(E_{l+1})}\le3\Delta\|z\|_{\ell_2^m(E_l)}.
```

$U:L_2(\{-1,1\}^m;X)\to\ell_2^m(X)$ 满（右逆 $(z_i)\mapsto\sum_i\varepsilon_iz_i$），伴随 $U^*(\theta_i)=\sum_i\varepsilon_i\theta_i$ 满足 `approximation.tex:46-48`：

```
\|U^*(\theta_i)\|_{L_2(X^*)}
=\left(\E_\eps\left\|\sum_i\eps_i\theta_i\right\|^2\right)^{1/2}
\ge\Delta^{-1}\|(\theta_i)\|_{\ell_2^m(X^*)}.
```

这里用的正是 `eq:fixed-cotype` 在 $Y=X^*$、$c_m(X^*)\le\Delta$ 下的形式。`eq:quotient-lift` 给出单位组的下确界提升范数 $\le\Delta$，`approximation.tex:50-51` 逐字

```
By \eqref{eq:quotient-lift}, the infimal lift norm of a unit tuple
is at most \(\Delta\), so a lift of norm below \(2\Delta\) exists.
```

把 $\Delta$ 放宽成 $2\Delta$ 是为了让"存在"严格成立（下确界未必取到）。接着在 $\ell_2^m(E_l)$ 的单位球上取有限 $\eta$-网，$0<\eta\le\min(1/2,\Delta/\sqrt m)$（`approximation.tex:52-53`），对每个网点选一个范数 $<2\Delta$ 的提升，$E_{l+1}$ 取 $E_l$ 与全部提升值的张成。任意单位组 $z$：取近点 $v$，校正项 $\sum_i\varepsilon_i(z_i-v_i)$ 落在 $E_l\subset E_{l+1}$，其 $L_2$ 范数按 `approximation.tex:61-64`：

```
\left\|\sum_i\eps_i(z_i-v_i)\right\|_{L_2(X)}
\le\sqrt m\,\|z-v\|_{\ell_2^m(X)}\le\Delta
```

第一步是 $(\mathbb E\lVert\sum\varepsilon_iw_i\rVert^2)^{1/2}\le\sum\lVert w_i\rVert\le\sqrt m(\sum\lVert w_i\rVert^2)^{1/2}$（三角不等式加 Cauchy-Schwarz），第二步是 $\sqrt m\cdot\eta\le\sqrt m\cdot\Delta/\sqrt m=\Delta$。总范数 $2\Delta+\Delta=3\Delta$，$\eta/\sqrt m$ 的配比就是为了让校正项恰好等于 $\Delta$，即"主项两倍、校正一倍"。$\eta\le1/2$ 保证网点都在单位球附近、校正不超过 $\Delta$ 的量级不被 $\lVert v\rVert$ 的漂移破坏。

第二层：加权 $\ell_2$ 直和与紧性 `approximation.tex:71-88`：

```
\mathcal H=\left(\bigoplus_{l=0}^\infty E_l\right)_{\ell_2},
\qquad
j:\mathcal H\to X,\qquad j(z)=\sum_{l\ge0}2^{-l}z_l.
```

$\lVert j\rVert\le(\sum_{l\ge0}4^{-l})^{1/2}=\sqrt{4/3}\approx1.155<2$（`approximation.tex:77-78`），来源是 Cauchy-Schwarz：$\lVert\sum2^{-l}z_l\rVert\le(\sum4^{-l})^{1/2}(\sum\lVert z_l\rVert^2)^{1/2}$。尾巴 $\sum_{l>L}4^{-l}$ 趋于零说明有限秩截断按算子范数收敛到 $j$，故 $j$ 紧。取 $G=\mathcal H/\ker j$、商映射 $Q$、$JQ=j$：$\ker j$ 闭所以 $G$ 是 Banach；$\lVert J\rVert=\lVert j\rVert<2$ 由商范数；$J$ 单因为 $\ker J=\{Qh:jh=0\}=\{0\}$。$B_G$ 的每个元素有 $\le2B_{\mathcal H}$ 中的代表元（商范数的下确界取一半余量），故 $J(B_G)\subset j(2B_{\mathcal H})$ 相对紧。$\iota(x)=Q(x,0,0,\ldots)$：$\lVert(x,0,\ldots)\rVert_{\mathcal H}=\lVert x\rVert$，故 $\lVert\iota\rVert\le1$；$J\iota x=j(x,0,\ldots)=x$ ✓。

`approximation.tex:89-92` 是我认为全文逻辑密度最高的一段：

```
The finite-rank truncations of \(j\) need not annihilate \(\ker j\),
so they need not induce operators on \(G\). Thus this compactness
argument does not itself approximate \(J\) by finite-rank maps;
that passage will use the approximation property of \(X\).
```

补上机制：$j$ 的截断 $p_L:\mathcal H\to\mathcal H$（保留前 $L$ 层）满足 $jp_L\to j$，但要在 $G$ 上定义 $J$ 的有限秩逼近，需要 $\tilde p_L$ 使 $\tilde p_LQ=Qp_L$，即 $\ker j\subset\{h:Qh=0\Rightarrow Qp_Lh=0\}$，也就是 $p_L(\ker j)\subset\ker j$；而 $h\in\ker j$ 意味着 $\sum2^{-l}h_l=0$，逐层截断后这个和一般非零。所以这条路堵住，只能靠 $X$ 的 AP。

第三层：权重移位拼出 $G$ 中的矩提升 `approximation.tex:97-102`：

```
R:\mathcal H\to\mathcal H,\qquad
R(z_0,z_1,\ldots)=(0,2z_0,2z_1,\ldots)
\]
a bounded map. The factor \(2\) compensates for the next dyadic
weight, so \(jR=j\) and therefore \(QR=Q\).
```

核对 $jR=j$：$j(Rz)=\sum_{l\ge1}2^{-l}\cdot2z_{l-1}=\sum_{l\ge1}2^{-(l-1)}z_{l-1}=j(z)$ ✓，$\lVert R\rVert\le2$。由 $j=JQ$ 与 $J$ 单，$QR=Q$。给定 $g_1,\ldots,g_m\in G$，取代表 $z^i$ 使 $\lVert z^i\rVert_{\mathcal H}\le2\lVert g_i\rVert$（`approximation.tex:107-109`，$g_i=0$ 时取 $z^i=0$），对每层组 $(z_l^i)_i\in\ell_2^m(E_l)$ 用有限层提升得 $H_l$，令

$$\widetilde H(\varepsilon)=(0,2H_0(\varepsilon),2H_1(\varepsilon),\ldots),$$

则 $\lVert\widetilde H\rVert_{L_2(\mathcal H)}^2=\mathbb E_\varepsilon\sum_{l\ge0}4\lVert H_l(\varepsilon)\rVert^2=\sum_l4\lVert H_l\rVert_{L_2}^2\le\sum_l4\cdot9\Delta^2\sum_i\lVert z_l^i\rVert^2=36\Delta^2\sum_i\lVert z^i\rVert^2$，开方得 $\le6\Delta(\sum_i\lVert z^i\rVert^2)^{1/2}\le6\Delta\cdot2(\sum_i\lVert g_i\rVert^2)^{1/2}=12\Delta(\sum_i\lVert g_i\rVert^2)^{1/2}$，即 `approximation.tex:116-119`。$12=2\cdot3\cdot2$：第一个 2 是代表元松弛，3 是有限层提升，第二个 2 是移位 $R$ 的补偿。常数链一环扣一环，去掉任何一个 2 都要付出别的代价。

矩正确性：$\widetilde H$ 的第 $i$ 矩是 $Rz^i$（逐层比对 $2E_\varepsilon\varepsilon_iH_{l}(\varepsilon)=2z^i_l$ 落在第 $l+1$ 层 ✓），于是 `approximation.tex:124-126`：

```
\E_\eps\eps_iQ\widetilde H(\eps)=QRz^i=Qz^i=g_i.
```

最后一步的 $12\Delta$ 收成对偶估计 `approximation.tex:128-137`：$\lvert\sum_i\theta_i(g_i)\rvert=\lvert\mathbb E_\varepsilon\langle Q\widetilde H(\varepsilon),\sum_i\varepsilon_i\theta_i\rangle\rvert\le\lVert\widetilde H\rVert_{L_2(\mathcal H)}(\mathbb E_\varepsilon\lVert\sum_i\varepsilon_i\theta_i\rVert_{G^*}^2)^{1/2}$（用了 $\lVert Qh\rVert_G\le\lVert h\rVert_{\mathcal H}$），对 $\sum_i\lVert g_i\rVert^2\le1$ 取上确界即 $(\sum_i\lVert\theta_i\rVert^2)^{1/2}\le12\Delta(\mathbb E\lVert\sum\varepsilon_i\theta_i\rVert^2)^{1/2}$，这就是 $c_m(G^*)\le12\Delta$ 的定义式。

`[推测]` 此处两条失败路线：(1) 令 $G$ 直接为 $\mathcal H$（不取商），则 $J=j$ 不单，而 $w_N(J)$ 的衰减传递到 $\mathrm{Id}_X$ 需要 $J\iota=\mathrm{Id}_E$ 与 $\lVert z\rVert\le\lVert x\rVert$，不单不影响这两条；但 $\lVert\iota(x)\rVert_{\mathcal H}=\lVert x\rVert$ 仍成立，所以这条路看似可行。它真正的破绽在 $c_m(G^*)$：$\mathcal H^*=(\bigoplus E_l^*)_{\ell_2}$ 的 $c_m$ 需要每个 $E_l^*$ 有 $c_m$ 界，而 $E_l^*$ 是 $X^*$ 的商，回到原来的困难。(2) 把权 $2^{-l}$ 换成 $l^{-2}$ 之类，$j$ 仍紧，但 $R$ 不再有界（比值 $w_{l}/w_{l-1}$ 无界），$QR=Q$ 失效，逐层提升拼不起来。dyadic 权是"同时给出紧性与有界移位"的唯一简洁选择。

## 11 AP 被消费的唯一位置，以及正向不含 AP 的部分

反向证明 `approximation.tex:165-170`：

```
Conversely, suppose that \(X\) has the approximation property and
\[
C_q(X)\le C_F,\qquad C_r(X^*)\le C_Y
\]
for finite \(q,r\ge2\) and finite constants \(C_F,C_Y\ge1\).
```

`approximation.tex:192-199` 是 AP 的全部用场：

```
Apply the approximation property to the compact set
\(M=\overline{J(B_G)}\). For every \(j\ge1\), it supplies a bounded
finite-rank map \(S_j:X\to X\) such that
\[
\|S_jJ-J\|
\le\sup_{x\in M}\|S_jx-x\|<1/j.
\]
```

$\lVert S_jJ-J\rVert=\sup_{\lVert g\rVert_G\le1}\lVert S_jJg-Jg\rVert\le\sup_{x\in J(B_G)}\lVert S_jx-x\rVert\le\sup_{x\in M}\lVert S_jx-x\rVert$，最后一步用 $S_j-\mathrm{Id}$ 的连续性把 $J(B_G)$ 换到闭包。取 $\delta=1/j$ 即可。$M$ 的紧性由 $J$ 紧给出，这一步与 `eq:walsh-continuity` 一起构成"AP 只用来产生范数极限"的两条腿。

于是 `approximation.tex:201-205`：

```
Since \(c_m(G^*)\le D_g\) and \(c_m(X)\le D_f\),
the norm-limit assertion of Theorem~\ref{thm:uniform-decay} gives
\begin{equation}\label{eq:compact-walsh-decay}
w_N(J)\le\rho_N\|J\|\le2\rho_N.
\end{equation}
```

$c_m(X)\le D_f$ 的来源是 $c_m(X)\le C_q(X)m^{1/2-1/q}=D_f$（`eq:fixed-from-cotype`）。注意 $c_m(F)\le D_f$ 里的 $F$ 在这里是 $X$，而 $c_m(G^*)\le D_g=12\Delta$ 里的 $G^*$ 正是 `lem:compact-domain` 造出来的，两个假设各自落在正确的一侧。

传到 $\mathrm{Id}_X$（`approximation.tex:209-220`）：对 $x=(x_u)_{u\in V_N}\in L_2(V_N;X)$，取 $E=\operatorname{span}\{x_u\}$、相应的 $J,\iota$，$z_u=\iota(x_u)$，则 $\lVert z\rVert_{L_2(G)}\le\lVert x\rVert_{L_2(X)}$（$\iota$ 是压缩）且 $Jz_u=x_u$，故 $W_N^{\mathrm{Id}_X}x=W_N^Jz$ 逐点相等（$W_N$ 与算子可交换：$\mathbb E_u\chi(u,v)Tx_u$ 里把 $T=\mathrm{Id}_E$、$x$ 换成 $J\circ z$ 即可）。于是 $\lVert W_N^{\mathrm{Id}_X}x\rVert\le w_N(J)\lVert z\rVert\le2\rho_N\lVert x\rVert$，即 `eq:identity-walsh-decay` $w_N(\mathrm{Id}_X)\le2\rho_N$。

矛盾收尾（`approximation.tex:222-238`）：若 $K(X)=\infty$，`eq:classical-characterization`（`introduction.tex:67-75`）给出 $\lambda\ge1$ 与一致嵌入的 $\ell_1^{2^N}$：$\lVert\sum_u\alpha_ux_u\rVert\ge\lambda^{-1}\sum_u\lvert\alpha_u\rvert$，$x_u\in B_X$。取 $\alpha_u=\chi(u,v)$（$\lvert\alpha_u\rvert=1$，$\sum_u=2^N$）：$\lVert(W_N^{\mathrm{Id}}x)(v)\rVert=2^{-N}\lVert\sum_u\chi(u,v)x_u\rVert\ge\lambda^{-1}2^{-N}\cdot2^N=\lambda^{-1}$。所以 $w_N(\mathrm{Id}_X)\ge\lambda^{-1}$ 对每个 $N$ 成立，与 $\rho_N\to0$ 冲突。这里 $\lambda$ 与 $N$ 无关是关键：一致 $\ell_1^s$ 拷贝给出的下界是常数级，而衰减是 $\rho_N$ 级。

正向部分 `approximation.tex:142-164` 不含 AP，我把它单独核对。`approximation.tex:143-146`：

```
First suppose \(K(X)<\infty\).
On each finite cube, the adjoint of the Rademacher projection on
\(L_2(X)\) is the corresponding projection on \(L_2(X^*)\).
Therefore \(K(X^*)=K(X)\).
```

机器理由：$\mathcal R_s$ 在第一阶 Fourier 系数上的矩阵元素只涉及 $\mathbb E_\eta\eta_if(\eta)$，转置后作用在对偶值的函数上仍是同一个一阶投影，而 $L_2(\Omega;X)^*=L_2(\Omega;X^*)$（`preliminaries.tex:15`）与 $L_\infty$-$L_1$ 的对偶（`preliminaries.tex:16-17`）保证算子范数相同；取有限 cube 上的 $\sup$ 后即 $K(X^*)=K(X)$。再由 `eq:classical-characterization` 得 $X$、$X^*$ 都有型 $p>1$。型推对偶余型的推导在 `approximation.tex:153-159`：

```
\left|\sum_i y_i^*(y_i)\right|
&=\left|\E_\eps
\left\langle\sum_i\eps_i y_i,\sum_i\eps_i y_i^*\right\rangle\right|\\
&\le D\left(\sum_i\|y_i\|^p\right)^{1/p}
\left(\E_\eps\left\|\sum_i\eps_i y_i^*\right\|^2\right)^{1/2}.
```

对 $\lVert y_i\rVert$ 的 $\ell_p^m(Y)$ 单位球取上确界：左端趋近 $(\sum\lVert y_i^*\rVert^{p'})^{1/p'}$（用 $\sum_iy_i^*(y_i)$ 的 $\ell_p$-$\ell_{p'}$ 配对），右端留下 $(\mathbb E\lVert\sum\varepsilon_iy_i^*\rVert^2)^{1/2}$，故 $Y^*$ 有 cotype $p'=p/(p-1)$。$Y=X^{**}$ 的情形再限制回 $X$（正则嵌入保持不等式）。`approximation.tex:163` 明写 `This direction does not use the approximation property.`

`[推测]` 本处的失败路线：想用 $\ell_1^s$ 的一致拷贝直接构造 $w_N(\mathrm{Id}_X)$ 的下界而绕过 $2^{-N/2}$ 型衰减，但 $w_N$ 的定义里带归一化 $2^{-N}$，任何"逐点 $\ge\lambda^{-1}$"的估计都需要输入侧 $\mathbb E_u\lVert x_u\rVert^2\le1$ 的规范化；$\ell_1$ 拷贝的向量都在 $B_X$ 里，规范化刚好通过，这一步看似平凡，实际上正是 Maurey-Pisier 等价式（`introduction.tex:69-74`）与 Walsh 语言之间的接口。另一条：想让 AP 用在 $X^*$ 上（对偶 AP），那是假命题，$X$ 有 AP 不蕴含 $X^*$ 有 AP。

## 12 $m$ 的选取：$m^{1/q}$ 与 $(\log m)^3$ 的比赛

`approximation.tex:170-185`：

```
For an integer \(m\), set
\[
D_f=C_Fm^{1/2-1/q},\qquad
\Delta=C_Ym^{1/2-1/r},\qquad D_g=12\Delta.
\]
The parameters in \eqref{eq:lift-parameters} then satisfy
\[
ma=\frac{m^{1/r}}{24LC_Y},\qquad
mb=\frac{m^{1/q}}{2LC_F}.
\]
These positive powers of \(m\) eventually exceed any fixed multiple
of \((\log m)^3\). Choose \(m\) once so that the hypotheses of
Lemma~\ref{lem:coefficient} hold, and fix the decay sequence \(\rho_N\)
given by Theorem~\ref{thm:uniform-decay} for \(m,D_g,D_f\).
All these parameters are independent of the finite-dimensional
subspaces and approximating operators chosen below.
```

我把 $ma$ 的代数和 $L=24$ 一起算出来。$a=1/(2LD_g\sqrt m)$，$D_g=12C_Ym^{1/2-1/r}$，故

$$ma=\frac{m}{2L\cdot12C_Ym^{1/2-1/r}\cdot m^{1/2}}=\frac{m^{1/r}}{24LC_Y}=\frac{m^{1/r}}{576C_Y},\qquad mb=\frac{m^{1/2}}{2LC_Fm^{1/2-1/q}}=\frac{m^{1/q}}{2LC_F}=\frac{m^{1/q}}{48C_F}.$$

门槛 `eq:large-parameters` 是 $\min(A,B)\ge20M_0d(d+1)^2=80d(d+1)^2$，$d=\lceil2\log_2m\rceil$，所以右端是 $80(2\log_2m+1)(2\log_2m+2)^2$，量级 $C_{\log}(\log_2m)^3$，具体上界约 $640(\log_2m)^3+O((\log m)^2)$。左端是 $m^{1/q}/(48C_F)$ 与 $m^{1/r}/(576C_Y)$。$\lim_{m\to\infty}m^{1/q}/(\log m)^3=+\infty$（任何正幂压过多项式对数），故存在 $m$ 同时满足 $4\le d$（需 $m\ge16$）、$d<m$（需 $m\gtrsim8$）与门槛。$q,r$ 只是把"多大才够"推得离谱地远，不影响存在性。这正是"指数限制被去掉"的全部技术内容：Pisier 旧定理里的限制来自要求 $m^{1/q}$ 与某常数赛跑，而这里赛跑对手只是 $(\log m)^3$。

机器侧把这套论证做得更刚性。`ParameterChoice.lean:10-14` 强制 $m=2^N$：

```
theorem degreeCutoff_pow_two (N : ℕ) : degreeCutoff (2^N) = 2*N := by
```

于是 $d=2N$ 精确成立（`CoefficientTarget` 里 `degreeCutoff m = ⌈2*logb 2 m⌉₊`，`CoefficientTarget.lean:12`）。`ParameterChoice.lean:71-77` 的多项式界是 $80\cdot2N(2N+1)^2\le1440N^3$，用 $(2N+1)^2\le(3N)^2=9N^2$（$N\ge1$）得 $160N\cdot9N^2=1440N^3$。`ParameterChoice.lean:81-92` 把 $A,B$ 化成纯指数：

```
have hdscale : (m : ℝ)*(1/(2*24*(12*(CY*(m : ℝ)^(1/2-1/r)))*Real.sqrt m)) =
      ((2 : ℝ)^(1/r))^N/(576*CY) := by
```

与 $((2)^{1/q})^N/(48CF)$（`ParameterChoice.lean:87-92`）。这两条正好是我上面手算的 $m^{1/r}/(576C_Y)$ 与 $m^{1/q}/(48C_F)$，其中 $m=2^N$ 时 $m^{1/r}=(2^{1/r})^N$，`source_lift_scale`（`ParameterChoice.lean:29-42`）就是恒等式 $x\cdot\frac1{A(Cx^{1/2-1/q})\sqrt x}=\frac{x^{1/q}}{AC}$ 的机器化。收尾用 `eventually_cube_le_exponential`（`ParameterChoice.lean:21-27`，底 $b>1$ 时 $A\,N^3\le b^N$ 最终成立）配 $b=2^{1/q}$、$A=1440\cdot48\cdot C_F$ 与 $b=2^{1/r}$、$A=1440\cdot576\cdot C_Y$（`ParameterChoice.lean:57-60`），另加 $N\ge4$（`Filter.eventually_ge_atTop 4`）。

`[推测]` 失败路线一：让 $m$ 依赖于 $E$ 或 $S_j$。那会破坏 `approximation.tex:184-185` 声明的"与后面选的有限维子空间和逼近算子无关"，$\rho_N$ 随之变成依赖对象的序列，最后一步 $w_N(\mathrm{Id}_X)\le2\rho_N$ 里的 $\rho_N\to0$ 就没有统一意义。路线二：取 $m$ 非 2 的幂以省一次对数放大，机器侧要额外证 $\lceil2\log_2m\rceil$ 的组合界，`degreeCutoff_pow_two` 的等式变成不等式，$N^3$ 界要重做；论文正文允许一般 $m$，Lean 只走 $2^N$ 这支，两边覆盖同一命题。
`[推测]` 路线三：想让门槛里的 $(\log m)^3$ 降成 $(\log m)^2$（若能改进 Chebyshev 分割对 $\lVert H_2\rVert_\infty$ 的一个冗余），存在性论证不变，只是 $m$ 可取小；这会影响 $\rho_N$ 的步长 $2m$ 与 $n_0$，但影响不到结论。

## 13 两个推论：一致 $\kappa$ 与 Grothendieck 对

一致界 `approximation.tex:243-263` 的反证设计：

```
If no uniform \(\kappa\) existed, choose spaces \(X_j\) with the
stated fixed cotype bounds and AP, but \(K(X_j)\to\infty\), and set
\[
Z=\left(\bigoplus_{j\ge1}X_j\right)_{\ell_2}.
```

$Z$ 的 AP 论证值得细看（`approximation.tex:248-251`）：

```
Finite-coordinate truncations converge uniformly on each compact subset
of \(Z\). Approximating its finitely many compact coordinate images by
finite-rank maps therefore proves AP for \(Z\); no uniform bound on
the norms of those maps is needed.
```

机制：给紧集 $M\subset Z$ 与 $\delta$，截断 $P_L$ 在 $M$ 上一致逼近 $\mathrm{Id}_Z$（紧集在各坐标上的一致尾巴小）；对 $P_L(M)\subset\bigoplus_{j\le L}X_j$ 逐坐标用 $X_j$ 的 AP 取有限秩逼近，合成后即得 $M$ 上的有限秩逼近。由于 $P_L(M)$ 的每个坐标像是紧的，每个坐标只需一次 AP，无需 $\lVert S_j\rVert$ 的公共界。cotype 的合并用 Minkowski（`approximation.tex:253-259`）：

```
\left(\sum_i\|z_i\|_Z^q\right)^{2/q}
\le \sum_j\left(\sum_i\|z_{ij}\|^q\right)^{2/q}
\le C^2\E_\eps\left\|\sum_i\eps_i z_i\right\|_Z^2.
```

第一步是 $\ell_{q/2}$（对指标 $i$）的 Minkowski，需要 $q/2\ge1$ 即 $q\ge2$，这是"$q\ge2$"第二次被结构性用到；$\lVert z_i\rVert_Z^2=\sum_j\lVert z_{ij}\rVert^2$ 是关键代换。对偶侧 $Z^*=(\bigoplus X_j^*)_{\ell_2}$ 等距（`approximation.tex:252`），同论证给 $C_r(Z^*)\le D$。主定理给 $K(Z)<\infty$；而有限 cube 上的 Rademacher 投影限制到坐标和项给出 $K(X_j)\le K(Z)$，与 $K(X_j)\to\infty$ 矛盾。

熵对偶 `introduction.tex:103-107`：

```
\frac1b\log N(L^\circ,atK^\circ)
\le \log N(K,tL)
\le b\log N(L^\circ,a^{-1}tK^\circ),
```

`approximation.tex:265-281` 交代常数来源：有限维赋范空间自动有 AP（`approximation.tex:265`：`For the entropy assertion, finite-dimensional gauge spaces have AP`），故 $K(X_K),K(X_L)\le\kappa$；AMSTJ 的 bounded-$K$ 对偶定理（引 `AMSTJ2004` Theorem 5，配 `Milman2007` 的 covering-number 形式）中的 $a,b$ 只依赖 $K$-凸常数的上界；再用 $X_{B^\circ}=X_B^*$、$K(X_B^*)=K(X_B)$、$X_{tL}\cong X_L$ 与 $(tL)^\circ=t^{-1}L^\circ$、$N(t^{-1}L^\circ,cK^\circ)=N(L^\circ,ctK^\circ)$。`[推测]` 这里若 $K$-凸界只给一侧，反向不等式会缺对偶界，所以正文在 `introduction.tex:108-109` 要求"两侧之一"满足原始与对偶 cotype 界，从而 $K$ 界同时给到 $X_K$ 与 $X_K^*$。

Grothendieck 对 `consequences.tex:24-34` 的定义：

```
Following \cite[Definition 1.2]{GMR25}, call \((\mathcal E,F)\)
a \emph{Grothendieck pair} if there is \(C<\infty\) such that
\begin{equation}\label{eq:grothendieck-pair}
\|A\otimes\Id_F:
E_m\widehat\otimes_\eps F
\longrightarrow E_n^*\widehat\otimes_\pi F\|
\le C\|A\|
\end{equation}
for all \(m,n\ge1\) and every \(A:E_m\to E_n^*\).
```

`consequences.tex:36-43` 的推论把 BAP 换成 AP，证明分三段（`consequences.tex:44-78`）：GMR 的 Theorem 1.3 给 $F,F^*$ 有限 cotype，主定理给 $F$ 为 $K$-凸；Figiel-TJ 的可补欧氏子空间定理给一致分解 $V_dU_d=\mathrm{Id}_{\ell_2^d}$、$\lVert U_d\rVert\lVert V_d\rVert\le D$；度量映射性质加上因子化

```
A\otimes\Id_{\ell_2^d}
=(\Id_{E_n^*}\otimes V_d)
 (A\otimes\Id_F)
 (\Id_{E_m}\otimes U_d),
```

给 $\le CD\lVert A\rVert$ 一致于 $d,m,n,A$；最后一步（`consequences.tex:68-77`）用"任何 $E_m\otimes\ell_2$ 的代数和张量的第二坐标落在有限维子空间 $H$，$H\hookrightarrow\ell_2$ 与正交投影范数皆为 1"把一致估计搬到 $E_m\widehat\otimes_\varepsilon\ell_2$。`[推测]` 这一步是全文最短也最容易写坏的地方：若 $H$ 的投影范数大于 1，`[推测]` 另一处风险点是 `Cube` 用 `Fin n → Bool`、`sign b = if b then -1 else 1`（`Model.lean:10-12`），这与论文的 $\{-1,1\}^s$ 一致，但 $\mathbb F_2^n$ 的加法在机器里是 `xorCube`（见 `CoefficientTarget.lean:20-21` 的 `xorCube (rowCube σ) S`），任何"$u+v$ 的配对展开"都要靠 Bool 上的引理，`walsh.tex:99-100` 那条相位恒等式在机器里必然是另一套逐 Bool 的验证。

## 14 尝试过的错误路线及失败原因

这一节把我实际走死的路按"当时的假设、卡住的位置、失败的机械理由"记下来。凡是论文没写、由我构造成因的，一律标 `[推测]`。

路线一：先证 AP 加 cotype 蕴含 BAP，再套旧的 BAP 定理。失败在起点：Figiel-Johnson 已经分离 AP 与 BAP（`introduction.tex:140-141` 逐字 `Figiel and Johnson separated AP from BAP \cite[p.~199]{FJ73}`），所以这条蕴含链不可能成立。机械理由：AP 只给逐点/逐紧集逼近，算子范数 $\lVert S\rVert$ 的下确界可以随紧集发散；一旦证明里出现 $\sup_j\lVert S_j\rVert$，就没有任何已知工具能把它有限化。论文在 `approximation.tex:206-207` 明确把这条路封死。

路线二：把有限维子空间 $E$ 直接当 $G$，即 $J$ 取包含映射 $E\hookrightarrow X$。失败在 $c_m(G^*)$：$E^*$ 是 $X^*$ 的商（$E^*=X^*/E^{\perp}$），而 cotype 是子空间遗传的性质、对商不遗传。`approximation.tex:9-10` 逐字 `Using \(E\) itself as the domain would not suffice: the quotient / \(E^*\) of \(X^*\) need not inherit the cotype estimate of \(X^*\).` 更深的理由：Pisier 的反例（`introduction.tex:164-165`）本身就是"把 cotype 2 空间塞进一个两侧都 cotype 2 的空间"，那种构造恰恰通过商/扩张破坏对偶侧估计，所以对偶 cotype 对商的不稳定性是这个问题的核心困难。

路线三：直接给 $w_n(T)$ 一个与秩无关的界 $w_n(T)\le\rho_n\lVert T\rVert$，靠 moment comparison 的逐阶改进。失败在常数 $D_T$：`eq:rank-dependent-decay` 的 $D_T$ 来自把 $T$ 因子化经过有限维 Hilbert 空间 $H$，$H$ 的维数随秩增长，而 `eq:walsh-basic`(i) 的左端 $2^{-n/2}\lVert T\rVert\le w_n(T)$ 说明 $2^{-n/2}$ 这个速率已经不可改进，任何一致界只能在"速率形状"上做文章。`walsh.tex:424-427` 的 remark 把 $D_T$ 的地位限定为"只用来排除同一个算子的无穷多个慢下降指标"。

路线四：在标量系数引理里避开 Chebyshev 分割，用整块多项式的 Bernstein 型不等式。失败在于次数：$H_0$ 的 $s$-次数与 $u$-次数都可以到 $m$，导数界会带 $m^2$ ，并非 $d(d+1)$，门槛变成 $\min(A,B)\gtrsim m^2$，而可得的 $A,B$ 只有 $m^{1/q}$、$m^{1/r}$。`coefficient.tex:165-167` 的 $\deg_sH_1\le d,\ \deg_uH_2\le d$ 是"把 $m$ 换成 $\log m$"的唯一手段。

路线五：用 Littlewood-Paley 逐阶分解直接拼 Rademacher 投影的界，也就是把 $\mathcal R$ 写成 $\sum_j$ 各向局部化块再用平方函数估计。失败在目标错位：我们要证的恰是 $\mathcal R$ 在 $L_2(X)$ 上的一致有界性，任何"把 $\mathcal R$ 拆成逐阶然后逐阶有界"的写法都要么默认结论、要么给出与维数有关的界。论文选择换一个完全无关的量 $w_n(T)$（它是 Walsh 变换的算子范数，随 $n$ 衰减），把问题转化为"衰减 vs 一致 $\ell_1^s$ 拷贝"的互斥，见 `approximation.tex:222-238`。这个换向是我在反推里最难自己想到的一步。

路线六：`[推测]` 想让增长引理里的 Fourier 指标秩 $k$ 参与迭代，得到 $w_{kn'}\ge c_k w_n$ 一类的非线性加速。失败在下文不需要：块论证只要求"比值 $\le1/c_1$ 的 $K$ 个望远比中有一个 $<2$"，加速会让 $n_0$ 依赖 $k$，而 $k$ 由 $\Psi$ 挑出来、事先不可控。

路线七：`[推测]` 想在 $G$ 的构造里省掉 $\mathrm{GL}(n,\mathbb F_2)$ 放大，只保留 $V_n\times V_n$ 放大。失败在"配对只依赖符号矩阵"：仅有 $y'_v(T'x'_u)=\gamma\chi(u,v)$ 时，$\Phi$ 会依赖帧 $U$ 的具体向量而不仅仅是配对矩阵 $S$，于是 $\mathbb E_\varepsilon\varepsilon_i\Phi(S,\varepsilon,\delta)=a\psi(S_{i,:},\delta)$ 一类的恒等式右端无法只写成 $S$ 的函数，`eq:three-functions` 根本不成立。第二次放大把 $R$ 变成参数，用 $\Lambda(H)$ 的等变性把依赖抹平，这是不可替代的。

路线八：`[推测]` 在 AP 环节尝试用 $J$ 自身的有限秩逼近（经过 $\ker J$ 的兼容截断）。`approximation.tex:89-92` 已经给出反证理由：$j$ 的逐层截断不保持 $\ker j$，故不能在 $G$ 上诱导算子。

## 15 Lean 机器侧取证：机器证到的与笔头声称的

### 15.1 权威条目与比较器

`E:\math\lean\formalization.yaml:1062-1064` 逐字为

```
    - comparator_config: ComparatorChallenges/Cotype.json
      declaration: OAI.Cotype.mainTarget_proved
      file: OAI/Analysis/Cotype/Main.lean
```

`E:\math\lean\ComparatorChallenges\Cotype.json` 全文含 `theorem_names` 只有一个 `OAI.Cotype.mainTarget_proved`，`definition_names` 为空数组，`permitted_axioms` 为 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 为 `false`。也就是说机器侧的全部验收点就一个声明，模块内其余 124 个 `.lean` 文件都是支撑它的依赖。我在 `E:\math\lean\OAI\Analysis\Cotype` 目录内跑 `grep -rn 'mainTarget_proved' . --include=*.lean`，命中只有两处：`Main.lean:26`（定义）与 yaml 指向的同一行；`grep -rc 'sorry'` 在该目录内无输出行，说明我读的这些文件里没有显式 `sorry`。我手上没有执行 `lake build` 或 `#print axioms` 的记录，所以下面凡涉及"公理实际用了哪三个"的判断都属 `[推测]`。

### 15.2 声明名通用，断言内容要靠展开

`Main.lean:26-28` 逐字：

```
theorem mainTarget_proved [Nontrivial X] : MainTarget X := by
  intro hAP
  exact ⟨forwardTarget_proved, fun ⟨hX, hXd⟩ => kConvex_of_AP_cotype_cotype hAP hX hXd⟩
```

`Main.lean:11` 的类型前提是 `variable {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]`，所以 $X$ 是实的、完备的，`[Nontrivial X]` 对应论文的"nonzero"。把 `MainTarget` 展开（`Model.lean:45-47` 逐字）：

```
def MainTarget [CompleteSpace E] [Nontrivial E] : Prop :=
  ApproximationProperty E →
    (KConvex E ↔ FiniteCotype E ∧ FiniteCotype (E →L[ℝ] ℝ))
```

于是 `mainTarget_proved` 断言的就是：AP 作为最外层蕴含的前件（`intro hAP` 那行把它当函数参数引入），后件是一个双向蕴含 `↔`，右侧是两个 `FiniteCotype` 的合取。AP 以"前件"形式进入，不出现在右侧任何位置。

`Model.lean:40-43` 的 AP 定义：

```
def ApproximationProperty : Prop := ∀ (M : Set E), IsCompact M →
  ∀ δ : ℝ, 0 < δ → ∃ S : E →L[ℝ] E,
    FiniteDimensional ℝ (LinearMap.range S.toLinearMap) ∧
    ∀ x ∈ M, ‖S x - x‖ < δ
```

与 `introduction.tex:9-14` 一一对应，且**没有**任何对 $\lVert S\rVert$ 的约束，这正是"普通 AP"，并非 BAP 的形式。机器侧把"有界有限秩线性映射"写成 `E →L[ℝ] E` 加 `FiniteDimensional ℝ (LinearMap.range S.toLinearMap)`，连续性自动含在 `→L[ℝ]` 里。

### 15.3 cotype 2 的常数在结论里以什么形状出现

答案要分三层说。

第一层，结论形状里**没有**常数。`Model.lean:34-38` 逐字：

```
def HasCotype (q : ℝ) : Prop := 2 ≤ q ∧ ∃ C : ℝ, 0 ≤ C ∧
  ∀ (n : ℕ) (x : Fin n → E),
    (∑ i, ‖x i‖ ^ q) ^ (1 / q) ≤ C * cubeL2 E (rademacherSum E x)

def FiniteCotype : Prop := ∃ q : ℝ, HasCotype E q
```

`KConvex`（`Model.lean:31-32`）同样是 `∃ K : ℝ, 0 ≤ K ∧ ∀ (n : ℕ) (f : Cube n → E), cubeL2 E (radProjection E f) ≤ K * cubeL2 E f`。所以 `mainTarget_proved` 的结论是一个纯存在性双向蕴含，$C_q(X)$、$C_r(X^*)$、$K(X)$ 的具体数值、以及"衰减序列 $\rho_N$"的形状都不在结论里出现。指数 $q$ 只有下界 `2 ≤ q`、无上界，`FiniteCotype` 里 $q$ 是被 $\exists$ 约束的，与原语 `Model.lean:10` 的 `abbrev Cube (n : ℕ) := Fin n → Bool` 一样是机器化的表示选择。

第二层，cotype 常数在**内部引理**里以固定长度形式出现。`Target.lean:12-14` 的 `FixedCotypeBound m D` 要求 `0 ≤ D` 且对 `Fin m` 索引的组给出 `(∑‖x i‖²)^{1/2} ≤ D·cubeL2(...)`，对应 `preliminaries.tex:77-80`。把论文的 $C_q$ 换成 $D=C_q m^{1/2-1/q}$ 的工作由 `FiniteCotypeBounds.lean:35-43 fixedCotypeBound_of_cotype_constant` 与 `:45-53 finiteCotype_fixed_bounds` 完成，后者顺手做了 `max C 1`，因为下游 `ParameterChoice.lean:43-44` 的假设形状是 `hCF : 1 ≤ CF`。

第三层，衰减率在机器里是显式函数。`UniformDecay.lean:37` 逐字 `def uniformDecayRate (m n₀ N : ℕ) : ℝ := (1/2 : ℝ)^((N-n₀)/(2*m))`，指数是自然数除法即向下取整，与 `walsh.tex:410-414` 的 $\rho_N=2^{-\lfloor(N-n_0)/(2m)\rfloor}$ 完全一致。`UniformDecay.lean:49-61` 的 `exists_uniform_walsh_decay` 返回 `∃ n₀, 4*m < n₀ ∧ Tendsto ... ∧ ∀ X Y ... T, FixedCotypeBound (X→L[ℝ]ℝ) m Dg → FixedCotypeBound Y m Df → FiniteDimensional ℝ (LinearMap.range T.toLinearMap) → (∀ n, n₀ ≤ n → walshNorm n T ≤ (1/2)*walshNorm (n-2*m) T) ∧ ∀ N, walshNorm N T ≤ uniformDecayRate m n₀ N * ‖T‖`。对照论文：`walsh.tex:60` 的 `n>4m` 变成 `4*m < n₀` 加 `4*m < n`（`GrowthTheorem.lean:19`），`walsh.tex:350` 的 $\tfrac12$ 变成 `1/2`，`walsh.tex:355` 的 $w_N(T)\le\rho_N\lVert T\rVert$ 变成最后那个合取支。

`walshNorm` 本身在 `WalshNorm.lean:11-13` 用 $\sup$ 定义：

```
def walshOutputs (n : ℕ) (T : X →L[ℝ] Y) : Set ℝ :=
  {r | ∃ f : Cube n → X, cubeL2 X f ≤ 1 ∧ cubeL2 Y (operatorWalsh T f) = r}

def walshNorm (n : ℕ) (T : X →L[ℝ] Y) : ℝ := sSup (walshOutputs n T)
```

只约束输入侧归一化，与 `eq:walsh-bilinear` 双侧归一化的写法不同；这个差别由 `FiniteL2Dual`、`FiniteSupDual`、`DualMomentLifts` 一族文件通过对偶补齐（对应论文 `preliminaries.tex:30` 的"Finite-sum duality gives the equivalent formula"）。

### 15.4 AP 在机器里被消费的确切位置

`Approximation.lean:11-14` 的 `compactMap_approximation` 把 AP 用在 `closure (J '' Metric.closedBall 0 1)` 上（`:15-16` 用 `hJ.isCompact_closure_image_closedBall` 证紧），结论是 `∃ S : X →L[ℝ] X, FiniteDimensional ℝ (LinearMap.range S.toLinearMap) ∧ ‖S.comp J - J‖ < δ`；`:25-28` 的 `compactMap_finiteRank_approximation` 把 `S.comp J` 认作 $G\to X$ 的有限秩算子。这正是 `approximation.tex:192-199` 的机器形状，且**全程没有对 $\lVert S\rVert$ 取值**。`WalshMainEstimates.lean:39` 的 `compactMap_walsh_bound` 再把它与 `exists_uniform_walsh_decay` 合起来；`IdentityWalshDecay.lean:41-44` 里的调用

```
have hJ : walshNorm N c.J ≤ 2*uniformDecayRate m n₀ N := by
  have h := compactMap_walsh_bound hAP c.J c.compact N hρ0
    (fun A hA => (hall c.G X A c.dual_cotype hprimal hA).2 N)
```

显示 AP `hAP` 只作为 `compactMap_walsh_bound` 的第一个参数出现，而 `2*` 前缀来自 `c.norm_J`（`IdentityWalshDecay.lean:44` 的 `mul_le_mul_of_nonneg_left c.norm_J hρ0`），对应论文的 $\lVert J\rVert\le2$ 与 `eq:identity-walsh-decay` 的 $2\rho_N$。

### 15.5 机器路线与笔头路线的一处结构性分叉

论文从"$w_N(\mathrm{Id}_X)\to0$"直接推出 $K(X)<\infty$（`approximation.tex:222-239`，靠 `eq:classical-characterization` 的反例形式）。机器多插了两个谓词台阶：`MainConstruction.lean:22-27` 的 `no_uniform_l1_of_AP_cotype_cotype` 先把衰减换成"不存在一致 $\ell_1$ 拷贝"，`APNontrivialType.lean:10-13` 的 `bConvex_of_AP_cotype_cotype` 再经 `BConvexity.lean:78` 的 `bConvex_of_not_uniformL1` 得到 `BConvex`（定义在 `BConvexity.lean:11`），`APNontrivialType.lean:15-17` 用 `nontrivialType_of_bConvex`（`TypeExtrapolation.lean:88`）升到 `NontrivialType`，最后 `Main.lean:13-20` 的 `kConvex_of_nontrivialType` 经 `CubeCoordinateProjections.lean:85` 的 `cube_coordinate_semigroup_power_gap` 与 `CoefficientPowerGap.lean:10` 的 `projectionLinearCoefficient_bound_of_power_gap`、`KConvexCoordinateCriterion.lean:11` 的 `kConvex_iff_coordinate_firstCoefficient_bound` 得到 `KConvex`。

也就是说：论文把 Maurey-Pisier 的"非平凡型等价于 $K$-凸"当引用使用（`introduction.tex:67-78` 明确引 `Pis11IHP` Theorem 4.40 与 `Pis80Kseminar` Theorem 1.5），机器把它拆成一整套投影半群、power gap、坐标一阶系数界自己去证。`FixedTypeImprovement.lean:120-122` 的 `fixed_quadratic_improvement_of_bConvex` 说明 `BConvex` 在机器里的内容是"某个固定长度 $n$ 上的二次型改进 $A<n$"。这条台阶链是机器侧特有的，笔头文本里找不到对应物，我把整条链走完花了最久。

正向也分叉：`TypeExtrapolation.lean:102-105` 的 `forwardTarget_proved` 走 `nontrivialType_of_kConvex` 与 `kConvex_dual_iff`，而论文的 `approximation.tex:143-151` 走"$\mathcal R$ 的伴随仍是 $\mathcal R$ 故 $K(X^*)=K(X)$，再由型推对偶余型"。`Target.lean:16-17` 的 `ForwardTarget` 定义里不含 AP，`Main.lean:28` 把 `forwardTarget_proved` 原样放进第一个合取支，忽略 `intro hAP` 拿到的那个 `hAP`，这正是 `approximation.tex:163` 那句 "This direction does not use the approximation property." 的机器证据。

### 15.6 笔头声称而机器目标没有覆盖的内容

三处。其一，均匀界 $\kappa=\kappa(q,r,C,D)$（`introduction.tex:93-99`）不在 `MainTarget` 里；`MainTarget` 的右侧没有对 $C_q,C_r$ 取上界的入口。其二，熵对偶双不等式 `eq:cotype-entropy-duality`（`introduction.tex:103-107`）依赖 AMSTJ 与 Milman 的外部定理，`Cotype.json` 的 `definition_names` 为空、`theorem_names` 只有一条，说明该推论未被纳入验收。其三，Grothendieck 对推论 `cor:grothendieck`（`consequences.tex:36-39`）同样在外，且它额外依赖 Figiel-Tomczak-Jaegermann 的可补欧氏子空间定理。

`[推测]` 公理面：模块内每个文件顶部都有 `noncomputable section`，`walshNorm` 用 `sSup`，矩提升要用 Hahn-Banach（对应 `preliminaries.tex:210`），我猜 `Classical.choice` 必然被用到，`propext` 由大量 `simp`、`filter_upwards` 接触，`Quot.sound` 由商空间 `G=\mathcal H/\ker j$ 的构造接触；这三个恰是 json 允许的全部，所以没有越界风险。要坐实需要跑 `#print axioms OAI.Cotype.mainTarget_proved`，我在只读源码的约束下无法给出打印结果。
`[推测]` 另一处风险点是 `Cube` 用 `Fin n → Bool`、`sign b = if b then -1 else 1`（`Model.lean:10-12`），这与论文的 $\{-1,1\}^s$ 一致，但 $\mathbb F_2^n$ 的加法在机器里是 `xorCube`（见 `CoefficientTarget.lean:20-21` 的 `xorCube (rowCube σ) S`），任何"$u+v$ 的配对展开"都要靠 Bool 上的引理，`walsh.tex:99-100` 那条相位恒等式在机器里必然是另一套逐 Bool 的验证。
## 16 最终思路与最初设想的差异

把 `## 0` 的三条猜想逐条对账。

猜想一（"BAP 到 AP 的推广"）错了大半。AP 在证明里的工作量小到不成比例：它只出现在 `approximation.tex:192-199` 的四行与 `walsh.tex:357-360` 的"范数极限"一句话里，机器侧对应 `Approximation.lean` 全文 39 行里的两条定理。全文的力气花在"与 AP 完全无关"的那一侧（一致衰减）。真正被去掉的限制是 `introduction.tex:149-154` 说的指数限制：

```
His subsequent work proved \(K\)-convexity under a restriction on the
cotype exponents, first with a basis or a dense increasing family of
uniformly complemented finite-dimensional subspaces, and then with BAP
\cite[Theorem~1, Remarks~2 and~9]{Pis81}.
He asked whether the exponent restriction could be removed
```

题名把 AP 写在最显眼处，实际新内容是"$q,r$ 可以是任何有限指数"，而这件事的技术载体是 $m^{1/q}$ 对 $(\log m)^3$ 的胜利（`approximation.tex:180-181`）。我最初按"BAP 推广"去预期会看到一堆关于逼近算子范数的重新分配，结果一行都没有。

猜想二（鞅与 Littlewood-Paley）方向性错误。核心对象 $w_n(T)$ 随 $n$ 的变化里，唯一来自 LP 精神的是"单调性靠平均掉无用坐标"（`preliminaries.tex:60-64`）和 $2m$ 步长的分块；速率的下界 $2^{-n/2}$ 来自 Walsh 矩阵的正交性，与平方函数无关。而且证明的推进方式是反证迭代，不是逐阶求和。真正起作用的解析工具在标量引理里，是阻尼生成函数 $H(s,u)$ 加 Chebyshev 截断，这两个都是"一元/二元多项式"层面的初等武器，跟 Banach 空间的鞅论没有交集。

猜想三（先做两侧 cotype 2）也错。论文一次到位处理任意 $q,r\ge2$，而且 cotype 2 的特殊性完全没有被利用：$c_m(Y)\le C_q(Y)m^{1/2-1/q}$ 在 $q=2$ 时给出与 $m$ 无关的界 $c_m(Y)\le C_2(Y)$，那会让 $A,B$ 的增长变成 $m$ 的正幂（$m^{1/2}$），门槛更容易过。作者宁可处理慢一点的 $m^{1/q}$，说明这个框架对 $q$ 的依赖是"锦上添花式"的，真正的机制与 $q$ 无关。

第四条差异，也是最实在的一条：真正驱动全篇的是一个二元域上的初等线性代数事实。`coefficient.tex:21-27`：

```
The point of the binary rank is the identity
\[
\prod_{i,j}\chi(u_i,v_j)^{P_{ij}}
=(-1)^{\sum_{i,j}P_{ij}u_i\cdot v_j},
\qquad u_i,v_j\in\F_2^n.
\]
An index of rank \(k\) yields \(k\) independent bilinear terms after
binary changes of variables.
```

秩 $k$ 的 0-1 矩阵经双边代换给出 $k$ 个独立的双线性项，因而一个非零 Fourier 系数能被"读"成 $k$ 倍维数上的 Walsh 测试。我最初设想的路线里完全不会出现这种"用矩阵秩换维数"的操作；它把概率/几何问题转成了一个表示论式的计数问题，而 $c_m$、矩提升、$\mathrm{GL}(n,\mathbb F_2)$ 等变全是为它服务的配套。反推时我在 `## 5` 里反复找不到"为什么一定要秩 $\ge2$"的答案，答案在 `walsh.tex:317-318` 的 $I^{t}PJ=\mathrm{Id}_k$：秩 1 只能给一个双线性因子，代换后指数是 $\zeta\cdot\eta$，维数不增，无法迭代；$k\ge2$ 才让 $n$ 跑到 $2(n-2m)$。

第五条差异：我原本以为"两侧 cotype"会以对称形式进入。实际进入方式是 $c_m(G^*)\le D_g$（原始侧的对偶）与 $c_m(F)\le D_f$（目标侧），即定理 `thm:uniform-decay` 里两个假设挂在不同侧；传递到 $X$ 时，$F=X$ 用 $X$ 自身的 cotype，而 $G^*$ 需要 `lem:compact-domain` 专门造出来。这个"不对称"解释了为什么必须造 $G$：$X^*$ 的 cotype 要交给一个**对偶空间**，而 $X^*$ 的商 $E^*$ 不可信。

第六条：机器路线比我预想的离笔头更远。`## 15.5` 记录的 `BConvex`、`NontrivialType`、投影半群 power gap 链条在论文文本里完全没有对应段落，论文只引 Maurey-Pisier。反过来说，机器没有覆盖笔头的两个推论（均匀 $\kappa$ 与 Grothendieck 对），所以"机器证到的"与"笔头声称的"两侧各有对方没有的内容，这一点在开工前我完全没料到。

最后一点自我修正：`## 0` 里我把"AP 的作用"当成谜题的钥匙，读完才发现钥匙在 `introduction.tex:192-194` 那句：

```
The scalar coefficient
lemma uses an additional feature of Fourier indices: their rank over
\(\F_2\), which determines the number of independent Walsh factors.
```

我最初把这行当成引言里的装饰性总结，跳过了两次；真正逼我停下来的是 `walsh.tex:317` 的 `Since \(\rank_{\F_2}P=k\), choose binary \(m\times k\) matrices / \(I,J\) with \(I^tPJ=\Id_k\).`，因为它在证明内部以"选矩阵"的形式重现了引言里那句话，我才确认这是机制本体。

## 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $m$ | 一次取大的整数，机器里强制 $m=2^{N}$ 且 $N\ge4$ | approximation.tex:181; ParameterChoice.lean:61 | $D_f,\Delta,a,b,\rho_N$ 的步长 | $m$ 不够大则 `eq:large-parameters` 断，`GrowthTheorem.lean:13` 的 hsize 无证明 |
| $q,r$ | 任意有限且 $\ge2$，允许不等 | introduction.tex:50; Model.lean:34 | 幂 $1/2-1/q$ 与 $m^{1/q}$ | $q<2$ 时 `FiniteCotypeBounds.lean:12` 的前提 hq 断，Hölder 方向翻转 |
| $C_F,C_Y$ | 给定，$\ge1$ | approximation.tex:169 | $A,B$ 的分母 | 机器需 `max C 1`（FiniteCotypeBounds.lean:49），否则 `ParameterChoice.lean:44` 的 hCF 断 |
| $c_m(Y)$ | $\le C_q(Y)m^{1/2-1/q}$ | preliminaries.tex:83 | $a,b,D_f,\Delta$ | 幂换号则 $c_m\ge1$ 与上界同时矛盾 |
| $L$ | $24$ | preliminaries.tex:100 | $a,b$ 分母各一次，门槛里 $2L$ 与 $24L$ | 取小于 $\sqrt{486}$ 则 `preliminaries.tex:135` 的 $486M^2$ 撑不住 |
| $M_0$ | $4$ | coefficient.tex:55 | 门槛系数 $20M_0$ 与 `CoefficientTarget.lean:17` 的逐点界 | $M_0$ 变大则门槛线性变大，$m$ 需更大 |
| $d$ | $\lceil2\log_2m\rceil$，机器里 $=2N$ | coefficient.tex:57; ParameterChoice.lean:10 | 删除估计与 Chebyshev 截断次数 | 系数 2 改 1 则 `coefficient.tex:130` 第一条不等式断 |
| $20M_0d(d+1)^2$ | $80d(d+1)^2$，量级 $(\log_2m)^3$ | coefficient.tex:61; CoefficientTarget.lean:28 | $\min(A,B)$ 的门槛 | 换成含 $m^2$ 的形状则 $m^{1/q}$ 永远追不上 |
| $a$ | $1/(2LD_g\sqrt m)$ | preliminaries.tex:161 | 原始侧矩提升的幅度 | 去掉 $\sqrt m$ 则提升范数成 $\sqrt m/2$，落在单位球外 |
| $b$ | $1/(2LD_f\sqrt m)$ | preliminaries.tex:162 | 对偶侧 Hahn-Banach 延拓的范数 | 同上，`preliminaries.tex:209` 的 $1/2$ 断 |
| $A=ma$ | $m^{1/r}/(24LC_Y)=m^{1/r}/(576C_Y)$ | approximation.tex:177 | 混合导数与 $\partial_sH_0$ 的系数 | 幂 $1/r$ 变负则 `eq:large-parameters` 永不成 |
| $B=mb$ | $m^{1/q}/(48C_F)$ | approximation.tex:178 | 混合导数与 $\partial_uH_0$ 的系数 | 同上 |
| $AB/2$ | $\partial_s\partial_uH_0(0,0)$ 的值 | coefficient.tex:153 | 反证的一侧 | $2^{-kl}$ 在 $k=l=1$ 给 $1/2$，去掉阻尼则此项改变 |
| $c_*$ | 只依赖 $m,a,b$ 的正数 | coefficient.tex:63 | $c_1$ 与 `walsh.tex:332` 的 $(c_*/2)$ | 无正下界则紧性论证（coefficient.tex:94-98）失效 |
| $c_1$ | $\min(1/2,c_*/2)$，落在 $(0,1/2]$ | walsh.tex:334; GrowthTheorem.lean:29 | $K>\log_2(1/c_1)$ | 去掉与 $1/2$ 取小则 $K$ 可能为 $0$，块数消失 |
| $K$ | 大于 $\log_2(1/c_1)$ 的整数 | walsh.tex:362 | $n_0$ 与望远比 | 变小则 $2^K>1/c_1$ 断，取不到比值 $<2$ |
| $n_0$ | $4m(K+2)+2$ | walsh.tex:365 | 把 $K$ 个块装进 $[n,2n-4m]$ | 少加 $2$ 则 `walsh.tex:381` 的 $\lfloor n/2\rfloor\ge2mK+4m+1$ 断 |
| $a_n$ | $\lceil3n/2\rceil$ | walsh.tex:376 | 指标序列 $n_j\ge(3/2)^{j}n$ | 改成 $n+1$ 则迭代不放大，$D_T$ 界追不上 |
| $n'$ | $n-2m$ | walsh.tex:71 | 奇部一致界 $\lVert\mathcal O\Phi\rVert\le w_{n'}$ | 标记位要占 $2m$ 个坐标，少减则独立性断 |
| $\gamma$ | $\ge w_n(T)/2$ | walsh.tex:82 | 归一化 $f,g,\Psi$ 与 $M_0=4$ | 若只到 $w_n/4$ 则 $M_0$ 变 $8$，门槛翻倍 |
| $k$ | $\operatorname{rank}_{\mathbb F_2}P\ge2$ | walsh.tex:272; CoefficientTarget.lean:31 | $kn'$ 上的 Walsh 测试 | $k=1$ 时代换后只有一个双线性因子，维数不增 |
| $r+s$ | 需 $n\ge r+s$ 才实现任意配对矩阵 | walsh.tex:25 | 帧引理的可行性与 $n>4m$ 的取法 | 维数不足则某些 $D$ 不可实现，$\Phi$ 定义断 |
| $n>4m$ | 严格不等式 | walsh.tex:60 | 所有模式可行加 $n'>2m$ | 取 $n=4m$ 则 $n'=2m$，Step 4 的组边界断 |
| $\rho_N$ | $2^{-\lfloor(N-n_0)/(2m)\rfloor}$ | walsh.tex:411; UniformDecay.lean:37 | $w_N(J)$ 与 $w_N(\mathrm{Id}_X)$ | 步长改 $m$ 则块重叠，望远比不相消 |
| $D_T$ | 依赖算子秩的常数 | preliminaries.tex:48 | 反证收敛的一侧 | 若与秩无关则可省掉整个 $n_0$ 论证，事实是做不到 |
| $\lVert W_n^{\mathrm{Id}_H}\rVert$ | $2^{-n/2}$ | preliminaries.tex:69 | $D_T$ 的形状与下限 | Walsh 矩阵不再正交则速率改变 |
| $\Delta$ | $C_Ym^{1/2-1/r}$ | approximation.tex:173 | $3\Delta$ 与 $12\Delta$ | 换 $q$ 指数则 $D_g$ 与 $A$ 的对应断 |
| $3\Delta$ | 有限层提升的 $L_2$ 范数 | approximation.tex:36 | $12\Delta$ 的一个因子 | 网比 $\eta$ 改动则 $2\Delta+\Delta$ 的配比断 |
| $\eta$ | $\le\min(1/2,\Delta/\sqrt m)$ | approximation.tex:53 | 校正项 $\le\Delta$ | 去掉 $\sqrt m$ 则 `approximation.tex:63` 的 $\sqrt m\lVert z-v\rVert\le\Delta$ 断 |
| $2^{-l}$ | dyadic 权 | approximation.tex:74 | $j$ 紧、$\lVert j\rVert<2$ 与 $jR=j$ | 换成 $l^{-2}$ 则移位 $R$ 无界，$QR=Q$ 断 |
| $(\sum4^{-l})^{1/2}$ | $\sqrt{4/3}<2$ | approximation.tex:78 | $\lVert J\rVert\le2$ 与 $2\rho_N$ | 权比改变则 $\lVert J\rVert$ 未必 $<2$ |
| $12\Delta$ | $2\cdot3\cdot2$ 的合成 | approximation.tex:23 | $D_g$ 与 $a$ 的分母 | 任一个因子改动则 $c_m(G^*)$ 界断 |
| $2\rho_N$ | $w_N(\mathrm{Id}_X)$ 的上界 | approximation.tex:189; IdentityWalshDecay.lean:25 | 与下界冲突 | 丢掉前因子 2 则 `c.norm_J` 一步缺依据 |
| $\lambda^{-1}$ | $w_N(\mathrm{Id}_X)$ 的一致下界 | approximation.tex:237 | 矛盾的另一侧 | 下界随 $N$ 衰减则矛盾不成 |
| $1440$ | $80\cdot2N(2N+1)^2\le1440N^3$ | ParameterChoice.lean:71 | hsize 的多项式侧 | $(2N+1)^2\le9N^2$ 只在 $N\ge1$ 成立，界改动需重证 |
| $48C_F$ 与 $576C_Y$ | 指数比赛的常数 | ParameterChoice.lean:59-60 | 与 $(2^{1/q})^{N}$ 比较 | 放大则需更大的 $N$，存在性不变 |
| $p'=p/(p-1)$ | 型到对偶余型的指标 | approximation.tex:150 | 正向的一半 | $p\le1$ 时无共轭，正向断 |
| $q/2\ge1$ | Minkowski 的前提 | approximation.tex:256 | $C_q(Z)\le C$ | $q<2$ 时三角不等式方向反 |
| $CD$ | Grothendieck 对的最终界 | consequences.tex:77 | 一致张量估计 | $\lVert U_d\rVert\lVert V_d\rVert$ 依赖 $d$ 则一致性断 |

依赖链散文（从最内层往外读）：$L=24$ 进入 $a,b$ 的分母，$a,b$ 与 $D_g=12\Delta$、$D_f=C_Fm^{1/2-1/q}$ 一起决定 $A=ma$、$B=mb$ 的增长率 $m^{1/r}$、$m^{1/q}$；门槛 $20M_0d(d+1)^2=80d(d+1)^2$ 由 $d=\lceil2\log_2m\rceil$ 给出 $(\log m)^3$ 级，于是 $m$ 可一次选大，把 $A,B$ 顶过门槛。门槛一旦过，$c_*$ 由紧性给出正值，$c_1=\min(1/2,c_*/2)$ 进入 $K>\log_2(1/c_1)$，$K$ 进入 $n_0=4m(K+2)+2$，$n_0$ 与 $m$ 一起决定 $\rho_N=2^{-\lfloor(N-n_0)/(2m)\rfloor}$；$\rho_N$ 的上界一侧还要乘 $\lVert J\rVert\le2$（来自 $(\sum4^{-l})^{1/2}<2$），得到 $w_N(\mathrm{Id}_X)\le2\rho_N$。另一侧的下界 $\lambda^{-1}$ 与 $2\rho_N$ 冲突发出 $K(X)<\infty$。链条里 $n'$ 与 $k$ 是纯组合环节：$n>4m$ 保证标记位可安置，$n'=n-2m$ 给出奇部界，$\operatorname{rank} P=k\ge2$ 把阶从 $n$ 送到 $kn'\ge2(n-2m)$。$\Delta$、$3\Delta$、$12\Delta$、$\eta$、$2^{-l}$ 属于第二条链（构造 $G$），它只通过 $D_g=12\Delta$ 汇入第一条链，因此改动 $G$ 的构造不会碰门槛的形状，只会平移 $m$ 的量级。$D_T$ 与 $2^{-n/2}$ 处在反证的一侧，被 $n_0$ 的使用范围限制住，不参与任何显式常数。

核过的行号样例（我逐条 `sed -n 'Np'` 实测）：`coefficient.tex:61` 为 `\min(A,B)\ge20M_0d(d+1)^2.`；`walsh.tex:334` 为 `Taking \(c_1=\min(1/2,c_*/2)\) proves the lemma.`；`walsh.tex:381` 为 `\(2n-a_n=\lfloor n/2\rfloor\ge2mK+4m+1\).`；`approximation.tex:177` 为 `ma=\frac{m^{1/r}}{24LC_Y},\qquad`；`approximation.tex:206` 为 `Only the composites \(S_jJ\) converge in operator norm;`；`preliminaries.tex:54` 为 `|w_n(A)-w_n(B)|\le\|A-B\|.`。

行号复核与校正（下面每一条都是收稿前用 `sed -n 'Np'` 逐行实测的结果，用于修正正文里三处指向公式环境的行号偏移，同时保留原来的范围标注便于对照）：

`walsh.tex:72` 实测为 `Put \(n'=n-2m\). We will turn a Walsh test at index \(n\) into`，台账里 "$n'$" 一行标的 `walsh.tex:71` 是增长引理证明环境的起始行，精确值应读作 72；`walsh.tex:410` 实测为 `\rho_N=`，`walsh.tex:413` 实测为 `2^{-\lfloor(N-n_0)/(2m)\rfloor},&N\ge n_0.`，台账 "$\rho_N$" 一行标的 411 是 `\begin{cases}`，取值行在 413，正文 `## 9` 里的范围 410-414 覆盖正确。

`coefficient.tex:104` 实测为 `Let`，`105` 实测为 `\[`，`106` 实测为 `C_{kl}=\sum_{\substack{|p|=k\\|h|=l}}\widehat\Psi(ph^t).`，`107` 实测为 `\]`；`## 5` 里我把 $C_{kl}$ 的定义式标成 105-107 并在块尾误留了 `\end{equation}`，实际闭合符在第 107 行且写作 `\]`，式体在 106。同节引用的反证假设三行实测位于 `coefficient.tex:100-102`，行 103 收尾为 `\(P=ph^t\) with \(p,h\ne0\), and both \(k=|p|\) and \(l=|h|\) are odd.`。

`WalshNorm.lean:11` 实测为 `def walshOutputs (n : ℕ) (T : X →L[ℝ] Y) : Set ℝ :=`，`WalshNorm.lean:14` 实测为 `def walshNorm (n : ℕ) (T : X →L[ℝ] Y) : ℝ := sSup (walshOutputs n T)`，`## 15.3` 标的 11-13 应读作 11-14（13 是空行）。

`introduction.tex:192` 整行实测为 `Rademacher comparison with quotient duality and Hahn--Banach. The scalar coefficient`，`## 16` 引用的三行块从该行尾部的 "The scalar coefficient" 起，行 193 为 `lemma uses an additional feature of Fourier indices: their rank over`，行 194 为 `\(\F_2\), which determines the number of independent Walsh factors.`。

`coefficient.tex:110` 实测为 `|C_{kl}|\le M_0\sqrt{\binom mk\binom ml}.`，`coefficient.tex:118` 实测为 `It has sup norm at most \(M_0\) on \([-1,1]^2\).`，两处与 `## 5` 的引用逐字一致，无需改动。

