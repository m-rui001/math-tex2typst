# D75 van der Waerden 数的定量超指数下界：我把 k 同时塞进底数和指数的全过程

对象论文：`Quantitative Superexponential Bounds for van der Waerden Numbers`（OpenAI，2026-09-23）。TeX 源码 `E:\math\preprints\Quantitative-Superexponential-Bounds-for-van-der-Waerden-Numbers-September-23-2026\build\`，`paper.tex`(27 行) + `preamble.tex`(87 行) + `sections/01-introduction.tex`(192) … `sections/08-upper.tex`(134)，八分片合计 1924 行。编号条目 24 个（5 定理、15 引理、2 命题、1 推论、1 定义），另有两处无编号命名证明：`07:61` 的 `Proof of Theorem~\ref{main:intro}` 与 `06:99-108` 的图示。Lean 入口由 `E:\math\lean\formalization.yaml:1430-1432` 给出：`OAI/Combinatorics/ProgressionColoring/Main.lean`，声明 `OAI.QuantitativeVanDerWaerden.uniform_lower_bound`。

引文行号形如 `05:174`，指 `sections/05-dichotomy.tex` 第 174 行。

## 0 我进场时手里有什么

abstract 逐字（`paper.tex:9-13`）：

```tex
We prove that there are absolute constants $c>0$ and $K_0$ such that
$W_r(k)>k^{ck\lfloor\log_2 r\rfloor}$ for every $k\ge K_0$ and $r\ge2$.
Consequently $W_r(k)^{1/k}\to\infty$ for each fixed $r\ge2$, giving a
quantitative positive resolution of Erd\H{o}s's superexponential-growth
question, including the two-color case.
```

正文里的定理形态（`01:18-26`）：

```tex
\begin{theorem}
\label{main:intro}
There is an absolute integer $K_0$ such that, for every integer
$k\ge K_0$ and every integer $r\ge2$,
\[
 W_r(k)>k^{c k\lfloor\log_2r\rfloor},
 \qquad c=10^{-5}.
\]
\end{theorem}
```

$r$ 与 $k$ 的初等定义在 `01:4-12`，我要逐字钉住，因为 Lean 那边按它核对量化：

```tex
For positive integers $r$ and $k$, let $W_r(k)$ be the least positive
integer $N$ such that every map $[N]\to[r]$ is constant on some
arithmetic progression
\[
 a,a+d,\ldots,a+(k-1)d,\qquad a,d\ge1,\quad a+(k-1)d\le N.
\]
Here $[N]=\{1,\ldots,N\}$, and using fewer than $r$ colors is allowed.
```

三条量化顺序上的读法决定了后面所有取舍。第一，$K_0$ 必须先于 $r$ 选定，`07:73-74` 明写 "The threshold on $k$ was fixed before $r$ was introduced, so it is absolute and uniform in the number of colors"。这条纪律让我在 §3 里所有阈值只允许出现 $k$。第二，$r\ge2$ 是硬下界，`01:111` 登记了边界值 `$W_1(k)=k$，$W_r(1)=1$，$W_r(2)=r+1$`，`07:215-217` 补一句 "The restrictions on the parameters are necessary"。第三，`using fewer than $r$ colors is allowed` 意味着我构造的下界必须对"至多 $r$ 色"成立，而我的乘积只产出 $2^m$ 个颜色元组，`07:53-54` 用 "embed the at most $2^m\le r$ color tuples into $[r]$" 收尾。

我的第一个动作是把 `01:113-166` 那段构造纲要拆成一张依赖图，因为这篇论文的骨架全在那 54 行里：循环群 $\Z/q^D\Z$、$q$ 是超过 $k$ 的素数的幂、两套圆坐标 $x_i,y_i=\lambda x_i$、按区间给点贴标签、标签染外色 $c_*$、再在"盒子 + 整数范数带"的 key 上做 Bernoulli 翻转。`01:164` 给出量化落点：`With $D=\lceil k^{1/10}\rceil$，their logarithmic count is $O(k^{9/10}\log k)=o(pk)$`。

本笔注叙事对应的论文目录为 preprints/Quantitative-Superexponential-Bounds-for-van-der-Waerden-Numbers-September-23-2026，在 .tools/lean_queue.txt 队列第 103 行号（按题名逐字匹配登记，本行只补登记、不改前文）。

## 1 初始动机与第一个猜想

我要的东西用一句话说：让 $k$ 同时出现在底数和指数上。已知最强形态的对照在 `01:48-50`（Kozik-Shabanov 的 $\beta r^{k-1}$）与 `01:55-56`（Fox-Hunter 的 $W_3(k)>2^{k\log^*k/4}$）。前者的 $k$ 只在指数，后者的 $k$ 只在指数的系数里。让 $k$ 进底数等价于让"可用色数的对数"和"长度"同时进入计数熵。

我最初的猜想很朴素：van der Waerden 的下界工程有一整条经典做法，取一个大群、找一个"看起来无结构"的随机染色、然后证明没有单色长进程。我要的三件事看起来都能各给一个因子：随机扰动给指数级的 $2^{\Theta(N)}$，Behrend 型球面给 $N^{c\log N}$ 的密度界，乘积构造给 $m$ 次方。把三者串起来，我猜会得到 $N^{c\log N}$ 型，配上 $\log_2 r$ 次方就凑出 $k^{ck\log_2 r}$。

这个猜想在量化上有一个致命含糊点：三个因子乘起来时底数是谁的。Behrend 型给出的熵增益是 $\log N$ 量级，而我需要的指数增益是 $\log k$ 量级（因为要 $k^{ck}$，取对数得 $ck\log k$）。$\log N$ 与 $\log k$ 之间要靠 $N\ge k^{ck}$ 搭桥，而那正是我要证的结论。也就是说这条链条有循环，$N$ 的熵不能拿来产生 $N$ 的下界。我在纸上把不等式方向写反了一次才发现：如果我用 $\log N$ 去估"可行染色数"，我必须独立地知道 $N$ 已经多大，而 $N$ 的大小正是构造的输出。

## 2 错误路线一：纯随机加对称局部引理，天花板算出来就死

我认真算的第二条路：直接随机二色 $c:[N]\to\{0,1\}$，坏事件取"某个 $k$ 项进程单色"，用对称 Lovasz 局部引理。依赖度：与固定进程冲突的进程数至多 $O(k^2N)$（两个进程的公差与起点决定交集），单色概率 $2^{1-k}$。对称 LLL 要求 $e(D+1)p\le1$，即 $2^{1-k}k^2N\lesssim1/2$，得 $N\lesssim2^k/k^{2+o(1)}$。这条天花板与 `01:45-47` 记录的 Szabo 结果 `$W_2(k)\ge2^k/k^\varepsilon$` 同级，离 $k^{ck}$ 差一个 $\log k$ 次幂的整数量级。

机械死因：对称 LLL 的裕度是 $e\cdot D\cdot p\le1$ 里的 $D$，$D$ 只能被公差个数 $N$ 与"能相交"的进程长度约束，$p$ 只能被 $2^{-k}$ 压。要突破 $2^k$，$p$ 必须以 $N$ 的多项式次幂衰减才够，而单色事件的概率天生是 $2^{-k}$。这条路上唯一可能的解药是把事件族换小（比如只测某些"结构性"进程），我在 §11 会看到论文最终做的正是这件事的强化版，但它的形态与随机独立染色已经完全不同。

我在这条路上还撞了第二个钉子。局部引理给的是"存在一个染色避开所有坏事件"，坏事件必须是关于独立变量的事件。若我想让坏事件是"进程在两种外色上都丰富却最终单色"，事件之间就不再独立于局部支持，对称形式失效，需要用非对称版本与权重 $z_E$。这个需要直接把我推到 `04:16-26` 的 `outer:lll` 形态。

## 3 错误路线二：把 Behrend 环带直接当二色构造

第三条我试过并放弃的：把 Behrend 的"球面壳层无 3-AP"搬到长度 $k$。壳层 $m\le\|z\|^2<m+1$ 与直线的交长很短这个性质只在 $k=3$ 有意义，因为中点关系 $x+z=2y$ 只有三个量。论文自己在 `07:126-154` 用了这个论证，但那里的结论只到 3-AP：`This excludes every progression with positive difference and length $k\ge3$，since its first three terms would already give a forbidden triple`（`07:155-157`）。所以这条路线只能贡献"色数增长"那一侧（`transfer:large-r`），不能贡献"长度增长"那一侧。

机制性停住点：$k\ge4$ 时壳层与直线最多交 2 点，但 4-AP 需要排除的是四点共线等距，一条直线穿环带可以给出 4 个整数点吗？我实测过的答案是"在 $\|z\|^2=t^2+C'$ 的参数化下，$t^2$ 落在宽度 1 的带内至多给 2 个 $t$ 值/半轴"（这是 `06:75-88` 的论证），所以二色构造里环带只能提供有重数界（每 key 至多 4 次），不能单独提供无进程性。这个发现让我把环带从"排除器"降级为"重数控制器"，是后面转折的起点。

## 4 参数表与每个指数的机械理由

`02:13-20` 是全篇算术的起点，逐字：

```tex
\begin{equation}\label{setup:parameters}
\begin{gathered}
 c=10^{-5},\qquad \delta=\frac1{10},\qquad \gamma=\frac1{100},\qquad
 D=\ceil{k^{1/10}},\qquad M=\ceil{k^{1/2}},\\
 h_0=D^2,\qquad p=k^{-1/20},\qquad H=k^{-2},\qquad
 \eta=\frac1{1000D}.
\end{gathered}
\end{equation}
```

`02:21`：`We take $k$ large enough that $h_0<2M<k$`。

每个指数的理由我都反推了一遍：

$D=k^{1/10}$：维度要长得足够慢。`count:local` 的界是 $(CDh)^{6D}$，取对数是 $6D\log(Dh)$。局部引理要用 $e^{-h/64}$ 压住它（`04:136-137`），要求 $\sup_{h>D^2}6D\log(CDh)/h=o(1)$，`04:142-145` 把上界写成 $6\log(CD^3)/D=o(1)$。这一步只要求 $D\to\infty$。真正的紧约束在另一端：`06:163-164`（纲要）与 `perturb:entropy` 需要 $\log T_{\mathrm{aff}}=O(k^{9/10}\log k)=o(pk)=o(k^{19/20})$。而 $\log T_{\mathrm{aff}}$ 含 $6\log q$，$\log q=O(k^{0.9}\log k)$（`02:97-101`），指数 $0.9$ 就是 $1-1/10$。所以 $D=k^{1/10}$ 的选择同时满足"$D$ 足够慢让 $6\log(CD^3)/D\to0$"与"$D$ 的倒数进入 $\log q$ 的系数时仍留足 $k^{19/20}$ 的余量"。

$M=k^{1/2}$：轻重标签的分界 $k/M=k^{1/2}$。`dichotomy:drift` 的漂移界 $|v_i|\le4MH/k$（`05:51`）要小于 $\eta$（`05:253` 用 `$|v_i|\le4MH/k<\eta$`），即 $4k^{1/2}k^{-2}/k=4k^{-2.5}\ll1/(1000k^{0.1})$，绰绰有余。同时 $2M/k=2k^{-1/2}\le1/16$（`05:287`）也靠 $M=k^{1/2}$。而 $h\le2M$ 要让"完整 $h$-块"够多：`05:303` 需要 $k-h-\delta k\ge\frac45k$，用 $h\le2M=o(k)$。$M=k^{1/2}$ 是满足全部三处的最小自然选择。

$p=k^{-1/20}$：flip 概率。它要满足两个反向不等式。第一，`perturb:rich-bound` 要 $2q^{2D}p^{\gamma k/4}<1$，取对数得 $2D\log q+\frac{\gamma k}{4}\log p$ 为负，即 $-2\times10^{-5}k\log k+\frac{k^{0.9}\log k}{ } $... 精确地说 `06:237-241` 给出系数 $2c-\gamma/80=1/50000-1/8000=-21/200000<0$，这一项里根本没有 $p$：$p^{\gamma k/4}=k^{-\gamma k/80}$，其对数 $-\frac{\gamma k}{80}\log k$。第二，`perturb:affine-bound` 要 $T_{\mathrm{aff}}e^{-pk/4}=o(1)$，即 $pk\gg k^{0.9}\log k$。$p=k^{-1/20}$ 给 $pk=k^{19/20}$（`06:180` 明写 `$pk=k^{19/20}$`），刚好压过 $k^{0.9}\log k$。所以 $1/20$ 是被 $1-1/10$ 与"$p<1/2$、以及第一项的 $1/80$ 系数还要留给 $\gamma/4$ 用"共同夹出来的。

$H=k^{-2}$：$y$-网格的宽度尺度。`02:94-95` 令 $H_x=H/\lambda$。$H_x$ 要小于 $U$-区间宽度，才能 `dichotomy:path` 用"同 $U$ 区间内圆距 $\le H_x$"判标签不同（`05:134-136`）。$H=k^{-2}$ 与 $k^2\lambda$ 个 $U$-端点（`02:136`）互为倒数关系：$H_x^{-1}=k^2\lambda$ 是整数，这是 `02:138` 那句 "exact partition of $[0,1)$" 的全部理由。

$\eta=1/(1000D)$：`dichotomy:regular-fraction`（`05:261-264`）需要 $D(4\eta+1/h_0)=4/1000+1/D<1/2$。$4\eta$ 前系数 4 来自"弧长 $4\eta$ 含至多 $4\eta s_i+1$ 个格点"（`05:255-256`）。1000 只要比 8 大就够了，取 1000 是让 $4/1000$ 与 $1/D$ 之和明确小于 $1/2$。

$\delta=1/10,\gamma=1/100$：`outer:coloring`(i) 给轻位置上每色至少 $1/4$，于是 $\gamma k\le\delta k/4$ 需要 $\gamma\le\delta/4$，取 $1/100\le1/40$ 有余量。$\delta$ 本身来自"轻位置占比 $\ge\delta k$"这个 dichotomy 入口。

## 5 §2 setup：dilation 与两套网格

### 5.1 Lemma (Dilation of short periods)，`02:33-42`

(a) 原文逐字：

```tex
\begin{lemma}[Dilation of short periods]\label{setup:dilation}
We have $\log\lambda\le h_0\log(2M)$. If $1\le h\le2M$, then
every prime-power divisor of $h$ with prime at most $h_0$ divides
$\lambda$. Consequently, $h\mid\lambda$ whenever $h\le h_0$, and, for
every integer $t$, the denominator
\begin{equation}\label{setup:denominator}
 s=\frac{h}{\gcd(h,\lambda t)}
\end{equation}
is either $1$ or greater than $h_0$.
\end{lemma}
```

其中 $\lambda$ 由 `02:24-27` 定义：`\lambda=\prod_{\substack{\ell\le h_0\\ \ell\text{ prime}}}\ell^{\floor{\log(2M)/\log\ell}}`。

(b) 推导。$\log\lambda=\sum_{\ell\le h_0}\lfloor\log(2M)/\log\ell\rfloor\log\ell\le\sum_{\ell\le h_0}\log(2M)=\pi(h_0)\log(2M)\le h_0\log(2M)$，论文用"至多 $h_0$ 个因子、每因子至多 $2M$"（`02:45-46`）绕过素数定理。第二步：设 $\ell^a\| h$ 且 $\ell\le h_0$，则 $\ell^a\le h\le2M$，故 $a\le\log(2M)/\log\ell$，取整后 $a\le\lfloor\log(2M)/\log\ell\rfloor$，正是 $\lambda$ 里 $\ell$ 的指数，所以 $\ell^a\mid\lambda$。对所有 $\ell\le h_0$ 合起来得"$h$ 的 $\le h_0$ 素数部分整除 $\lambda$"。若 $h\le h_0$，$h$ 的每个素因子都 $\le h_0$ 且指数 $\le\log(2M)/\log\ell$，故 $h\mid\lambda$。第三步：$s=h/\gcd(h,\lambda t)$ 的素因子只能来自 $h$ 中未被 $\lambda t$ 吃掉的部分，即全部 $>h_0$。所以 $s$ 的每个素因子 $>h_0$；若 $s>1$ 则 $s\ge\ell_{\min}>h_0$。$t=0$ 时 $\gcd(h,0)=h$，$s=1$，`02:50-51` 特意点名这个退化情形。

(c) 为何是这个值。$h_0=D^2$ 与 $2M=k^{1/2+o(1)}$：$\lambda$ 的质因子集合大小 $\pi(D^2)=O(D^2/\log D)$，每个指数 $\le\log(2M)/\log2$，于是 $\log\lambda\le D^2\log(2M)=O(k^{1/5}\log k)$（`02:99`）。这个量同时是两处代价的来源：$F=|U|+|V|=k^2\lambda+O(k^3\log k)$（`03:77`）进入全局字数，$\log\lambda$ 因此进入 `count:global` 的 $O(D(\log k+\log\lambda))$。若把 $h_0$ 提到 $M$，$\log\lambda$ 变成 $O(k^{1/2}\log k)$，全局字数对数变 $O(k^{0.6}\log k)$ 仍可，但 `dichotomy:regular-fraction` 的 $1/h_0$ 项变 $1/M$，也仍可；真正的破坏在 `mesh:truncated` 与 $\eta$ 的耦合。[推测] 论文选 $h_0=D^2$ 是让"$s_i>h_0$"直接给出 $1/s_i<1/D^2$，从而与 $4\eta=O(1/D)$ 并排时 $D\cdot(1/h_0)=1/D\to0$ 这一项干净。若 $h_0$ 取常数，`count:local` 的 $h$ 范围从 $h>D^2$ 退成 $h>h_0$，`04:136-137` 的指数压制就会失败：$(CDh)^{6D}e^{-h/64}$ 在小 $h$ 处发散。

(d) 候选失败路线。其一：用 $\lambda=\operatorname{lcm}(1,\ldots,2M)$，$\log\lambda=O(M)$，比 $D^2\log(2M)$ 大 $k^{1/2}/k^{1/5}$ 倍，全局字数对数升到 $O(D\cdot M)=O(k^{0.7})$，仍 $o(M)$，看似可行；[推测] 但 $F$ 进入 $T_{\mathrm{glob}}$ 的方式是 $(3k^2F)^2$，对数 $2D\log F$ 里 $F$ 的对数才关键，所以这条路线的代价其实温和，我判断它被排除的理由是 $s$ 的界会弱化成"$s$ 的素因子 $>2M$"，即 $s=1$ 或 $s>2M\ge h$，等于把 dichotomy 的分岔压成单支。其二：完全不做 dilation，让 $y$ 坐标自己处理有理运动；[推测] 停在 `dichotomy:short-motion` 之后：$h\mid\lambda$ 这一步是"$\lambda t/h$ 为整数"的来源，缺它就没有实步 $w=v/h$，短周期分支 (ii) 无法建立。其三：只用 $\lambda$ 的一次幂，并非各素数的最高幂，则 $\gcd(h,\lambda t)$ 无法吃掉 $h$ 的全部 $\ell$-primary 部分，$s$ 可以等于 $\ell^2$ 与 $h_0$ 不可比，长/短分岔失效。

### 5.2 Lemma (An elementary prime bound)，`05:54-57`… 实为 `02:54-57`

(a) `For all sufficiently large integers $k$, there is a prime $P$ satisfying $k<P\le2k^2$.`

(b) 推导在 `02:59-82`，不依赖 Bertrand 之外的任何解析输入：$v_\ell\binom{2n}{n}=\sum_{a\ge1}(\lfloor2n/\ell^a\rfloor-2\lfloor n/\ell^a\rfloor)\le\lfloor\log_\ell(2n)\rfloor$（每项 0 或 1，$\ell^a>2n$ 时消失）。若 $\binom{2n}{n}$ 的全部素因子 $\le k$，则其值 $\le\prod_{\ell\le k}(2n)^{\lfloor\log_\ell 2n\rfloor}$，论文简化为 $\le(2n)^k$。另一侧 $\binom{2n}{n}\ge4^n/(2n+1)$。取 $n=k^2$：对数下界 $k^2\log4-\log(2k^2+1)$ 对数上界 $k\log(2k^2)$，前者主导。故存在素因子 $P>k$，且 $P\mid(2n)!$ 给 $P\le2n=2k^2$。

(c) 为什么上界是 $2k^2$ 而 $\lambda$ 需要 $P>h_0$。`02:90-91`：`Since $h_0<k<P$ for large $k$，\Cref{setup:dilation-definition} shows that $\gcd(\lambda,q)=1$`。互素是关键：它保证 $\lambda$ 在 $\Z/q^D\Z$ 上是单位，`06:47-48` 用 "$\lambda$ is a unit modulo $q^D$" 得到 $\lambda(n_j-n_{j'})$ 是非零剩余类，进而 key 分离 `perturb:separation`。$q$ 是 $P$ 的幂，$P>h_0\ge\lambda$ 的一切质因子，故 $q$ 与 $\lambda$ 互素。若只有 Bertrand（$P\le2k$），$q$ 的幂次增长太快，`setup:q-bounds` 的第二式 $D\log q\le ck\log k+D\log(2k^2)$ 会给出 $q$ 上界与 $2k^2$ 挂钩；论文用 $2k^2$ 恰好把 $\log q-\frac{ck}{D}\log k\le\log(2k^2)=O(\log k)$ 做成一个可忽略的加性项。

(d) [推测] 失败路线：用 $P\in(k,2k]$（Bertrand）。则 $q$ 的最小 $\ge k^{ck/D}$ 的 $P$-幂满足 $q\le Pk^{ck/D}\le2k\cdot k^{ck/D}$，只把 `setup:q-bounds` 的 $2k^2$ 换成 $2k$，估计变好，看似更省。[推测] 它被绕开的原因我没能从 tex 得到解释，论文可能只想用中心二项式系数这一条初等路线，避开任何素数分布输入。另一路线：让 $q$ 直接等于 $P$（不做幂）。那么 $q^D=P^D$，需要 $P^D\ge k^{ck}$，$P\ge k^{ck/D}$，与 $P\le2k$ 冲突，所以必须允许 $q$ 是幂。

### 5.3 mesh 三兄弟

`mesh:width`（`02:175-182`）：`\frac14H\bigl(\rho(Y)+\alpha\bigr)\le |I|\le2H\bigl(\rho(Y)+\alpha\bigr)\le2H` 与 `$|V|=2m=O(k^3\log k)$`。几何理由：$V$ 的端点 $a_\ell=\alpha(e^{\ell R/m}-1)$ 是几何网格（对数均匀），越靠近切割点 $1/2$ 越细，宽度与到切割点距离成比例，比例系数 $\theta=R/m\in[H/2,H]$（`02:186`），于是 $|I|/(\rho+\alpha)$ 被 $1-e^{-\theta}$ 与 $e^\theta-1$ 夹住，$\theta\le1$ 时二者分别 $\ge\theta/2$ 与 $\le2\theta$（`02:194-196`）。$\alpha=q^{-(D+1)}$（`02:94`）是"让网格有限"的下限：$R=\log(1+1/(2\alpha))$ 若 $\alpha=0$ 则发散。$\alpha$ 的第二重作用在 `dichotomy:step-lattice`（`02:208-211`）：$w_i\ne0\Rightarrow|w_i|\ge q^{-i}\ge q^{-D}\ge\alpha$，把离散步格与网格下限绑在一起。

`mesh:neighbors`（`02:205-212`）：$N(I)$ 是 $\bar I$ 的 $w$-邻域，则 closure 与之相交的 $J$ 满足 $|J|\ge w/16$，且 $N(I)$ 含至多 49 个端点。这两个数在 `count:local` 的 stationary 分支直接消费（`03:175-176`：`at most $49$ mesh endpoints are relevant`）。49 的来源是 `02:229`：弧长 $3w$，逐对间隔 $\ge w/16$，故 $(b-1)w/16\le3w$，$b\le49$。

`mesh:truncated`（`02:244-249`）：长度 $\le4H$ 的弧上 $V_\eta$ 至多 $16004D$ 个断点。16000 来自 `02:258`：端点间隔 $\ge H\eta/4$，故至多 $4H/(H\eta/4)+2=16/\eta+2$，加两个阈值点得 $16/\eta+4=16000D+4\le16004D$。这个数字本身不重要，重要的是它关于 $h$ 与锚点宽度都线性无关，`count:local` 因此能拿到 $(Dh)^2$ ，并非 $(Dh\cdot(\text{anchor width}))^2$。

## 6 §3 counting：排列、全局字数与锚定局部模式

### 6.1 Lemma (Affine comparisons, including equality)，`03:12-22`

(a) 逐字：

```tex
\begin{lemma}[Affine comparisons, including equality]\label{count:arrangement}
Let $s$ affine hyperplanes be given in $\R^e$, and record, for each
hyperplane, the sign in $\{-,0,+\}$ of a defining affine function.
The number of realized joint sign vectors is at most
\begin{equation}\label{count:arrangement-bound}
 \sum_{d=0}^e\binom{s}{d}\sum_{j=0}^{e-d}\binom{s}{j}
 \le(e+1)^2(s+1)^e.
\end{equation}
The same bound applies when the parameter space is restricted to an
arbitrary subset of $\R^e$.
\end{lemma}
```

(b) 推导两条。严格符号：区域数按 $s$ 归纳，新增超平面把每个被它穿过的区域一分为二，穿过的区域对应该超平面上的 $(e-1)$-维诱导排列的区域，故 $R(s,e)\le R(s-1,e)+R(s-1,e-1)$，配 Pascal 得 $\sum_{j=0}^e\binom{s}{j}$。含零号：设实现的符号向量零集对应超平面族在 $A$ 上交出余维 $d$ 的仿射子空间，其中 $d$ 个法向量独立的方程已决定 $A$（选法 $\le\binom{s}{d}$），$A$ 上剩余超平面给 $(e-d)$-维严格符号 $\le\sum_{j=0}^{e-d}\binom{s}{j}$。乘积和 $\le(e+1)^2(s+1)^e$ 来自 $\binom{s}{d}\binom{s}{j}\le(s+1)^{d+j}\le(s+1)^e$ 与 $(e+1)^2$ 个 $(d,j)$ 对。

(c) 为何要带等号。网格是半开区间（`02:135-137`、`02:149-153`），一个点恰在端点上时属于哪个区间是定义的一部分；`03:68-69` 写 "Equality signs give precisely the assigned half-open labels"，`03:194-196` 再写 "They determine values at breakpoints as well as on open intervals; this accounts for half-open endpoints and for exact equalities $\rho=\eta$"。若只用开区域计数，边界点会被漏掉，计数上界对真实标签字数不再成立。带 $0$ 号后同一引理在两个地方复用，且维度 $e$ 被固定：`count:local` 用 $e=2$（`03:198`），`perturb:signatures` 用 $e=3$（`06:159-160`）。$e$ 固定是整篇论文能扛住 $D\to\infty$ 的结构原因：`(e+1)^2` 是常数，只有 $(s+1)^e$ 里的 $s$ 随 $D,h$ 增长，次数是 $e$ ，并非 $D$。

(d) [推测] 失败路线一：直接引 Stanley 的严格区域数（论文 `03:7-8` 承认参照 `[Lemma~2.1 and Proposition~2.4]`），自己补等号。停在"$A$ 的每个剩余零方程都是所选方程的推论"这一步：这需要点在 $A$ 上时的一致性论证，论文 `03:37-38` 用一行处理，若用一般位置假设（Stanley 常见做法）会丢退化情形，而这里退化情形恰好是端点标签。失败路线二：把 $e$ 当作随 $D$ 增长的空间维度，一次计所有坐标。那就变成 $(D+1)^2(s+1)^D$，对数里出现 $D\log s$ 与前面的 $2D$ 次方重复合并，界会膨胀到 $O(D^2\log(Dh))$，与 `outer:second-weight` 需要的 $e^{-h/64}$ 仍然可调和，但 `count:local` 的 $(CDh)^{6D}$ 会变成 $(CDh)^{cD^2}$，`04:144` 的 $6\log(CD^3)/D$ 就变成 $O(D)$，发散。逐坐标独立计数是关键。

### 6.2 Lemma (Global label words)，`03:49-57`

(a) 逐字：

```tex
\begin{lemma}[Global label words]\label{count:global}
Let $T_{\mathrm{glob}}$ be the number of words
$\bigl(L(n_j)\bigr)_{0\le j<k}$ arising from the progressions in
\Cref{setup:cyclic}. Then
\begin{equation}\label{count:global-bound}
 \log T_{\mathrm{glob}}
 =O\bigl(D(\log k+\log\lambda)\bigr)
 =O(k^{3/10}\log k)=o(M).
\end{equation}
\end{lemma}
```

(b) 推导（`03:60-87`）。标量情形：圆分割有 $F$ 个端点（含代表切割），自由选起点与公差 $a,b\in[0,1)$。$a+jb\in[0,k)$，其模 $1$ 落点由与所有 $\tau+z$（$-1\le z\le k$，$z$ 整数）的比较决定。对每个端点 $\tau$、每个平移 $z$、每个 $j$，条件"$a+jb\ge\tau+z$"是 $(a,b)$ 平面的一条直线。$j<k$ 共 $k$ 个，$z$ 共约 $k+2$ 个（论文给 $3k^2$ 的乘积），端点 $F$ 个，得 $\le3k^2F$ 条线。$e=2$ 套 `count:arrangement`：$9(3k^2F+1)^2$。$2D$ 个坐标各自独立放大地数：$T_{\mathrm{glob}}\le[9(3k^2F+1)^2]^{2D}$，取对数 $4D\log(3k^2F+1)+O(D)$，$\log F=O(\log k+\log\lambda)$（因 $F=k^2\lambda+O(k^3\log k)$ 且 $\lambda\ge1$），得 $O(D(\log k+\log\lambda))$。代 $D=k^{0.1}$、$\log\lambda=O(k^{0.2}\log k)$ 得 $O(k^{0.3}\log k)=o(k^{0.5})=o(M)$。

(c) 为什么允许"起点与公差自由变化"。`03:72-75` 解释这是放大集合，故是上界。这一步把我原本担心的"$x_i,y_i$ 之间有 $\lambda$ 倍关系"绕开了：$y_i=\lambda x_i$ 让两个坐标的参数不独立，论文直接把 $2D$ 个坐标都当独立处理，代价是把指数从 $D$ 翻成 $2D$。省掉的是任何关于 $\lambda$ 与 $q$ 关系的算术论证。为什么 $o(M)$ 就够了：`outer:first-weight`（`04:130-131`）是 $kT_{\mathrm{glob}}e^{-(\delta M-1)/32}$，$T_{\mathrm{glob}}$ 与 $e^{\delta M/32}=e^{c\,k^{1/2}}$ 比，$\log T_{\mathrm{glob}}=o(M)$ 正是让它消失的条件。

(d) [推测] 失败路线：用 $F$ 的实际结构（$U$ 是均匀格、$V$ 是对数格）做逐坐标精确计数。会停在"端点集合与 $j$ 的乘法关系"上：精确计数的收益只把 $3k^2F$ 降成常数倍，而 $e=2$ 的平方 $(s+1)^2$ 对 $s$ 是二次，收益本来就 $\le O(1)$ 因子，改不动主项。第二条：把 $T_{\mathrm{glob}}$ 当作 `perturb:signatures` 的乘数时若它只是 $o(M)$ ，并非 $o(pk)$，富色分支的 union bound 会失败；`06:171-172` 显示实际用到了 $\log T_{\mathrm{glob}}=O(k^{0.3}\log k)=o(k^{0.95})=o(pk)$，余量极大。

### 6.3 Definition (Eligible local patterns)，`03:106-129`

(a) 逐字（含三条 (i)(ii)(iii)）：

```tex
\begin{definition}[Eligible local patterns]\label{count:eligible}
Choose $x,y\in\T^D$ and $u,v\in\R^D$, and form
\begin{equation}\label{count:local-paths}
 X_z=x+\frac z h(t+u),\qquad
 Y_z=y+\frac z h(\lambda t+v)\qquad(0\le z<h)
 \quad\text{in }\T^D.
\end{equation}
A position $z$ is \emph{regular} if
$\rho(Y_{z,i})\ge\eta$ in every rotating coordinate; if there are
no rotating coordinates, every position is regular. Record
$L(X_z,Y_z)$ at a regular position and a dummy symbol $*$ otherwise.
The resulting word in $(\cL\cup\{*\})^h$ is \emph{eligible for
$h,t$} if it admits a realization satisfying all of the following:
\begin{enumerate}[label=\textup{(\roman*)}]
 \item At least $h/2$ positions are regular, and the full labels at
       those positions are pairwise distinct.
 \item $|u_i|\le H_x$ for every $i$, and $|v_i|\le H$ in every
       rotating coordinate.
 \item In every stationary coordinate $i$, one has
       $|v_i|\le |V(Y_{z,i})|$ at every regular position $z$.
\end{enumerate}
The recorded word is the pattern; different realizations of one word
do not define additional patterns.
\end{definition}
```

前置的 $s_i$ 定义在 `03:89-98`：$h_0<h\le2M$，$t\in\{0,\ldots,h-1\}^D$，$s_i=h/\gcd(h,\lambda t_i)$，$s_i=1$ 为 stationary，否则 rotating，`03:96` 用 `setup:dilation` 得 rotating 坐标 $s_i>h_0$。

(b) 逐条读它为什么要这三项。(i) 两小句各有用途：$h/2$ 保证事件至少测试 $h/2$ 个独立变量，`04:106` 那句 "their number is at least $h/2$" 直接把它变成 $e^{-h/64}$ 的指数；标签两两不同保证被测试的 $\xi_\beta$ 真的互异，否则同一变量测两次没有集中度可言（`outer:tail` 的 $\mathbb P(E)\le2e^{-l/8}$ 要求 $l$ 个独立变量）。(ii) 是 `dichotomy:drift-bounds` 的产物原样搬来（`05:268-269`）。(iii) 是最精细的一条：stationary 坐标的 $\lambda t_i/h$ 是整数，有理运动消失，剩下的只有漂移 $v_i$，而它的绝对界 $H=k^{-2}$ 与 $V$-区间宽度不可比（区间可以任意细，靠切割点），所以必须把漂移界相对化到区间宽度本身。`03:131-133` 明写："The stationary drift bound is relative to interval width because those intervals may be arbitrarily fine. This is the condition that makes the following count independent of the anchor's width."

(c) "different realizations of one word do not define additional patterns" 是计数能成立的语言学前提：事件按字面词计数，不按参数族计数，否则参数是实数、事件族无穷、`outer:lll` 的有限性假设破产。`04:107-109` 呼应："Although the realizations of the patterns have real parameters, these event families are finite: $\mathcal L$，the word lengths，and the choices of $h,t$ are all finite."

(d) [推测] 失败路线：把 regular 判据去掉，直接对所有位置测标签。停在 `count:local`：靠近切割点的区间宽度 $\sim H\alpha$ 极小，$(a,b)$ 的允许矩形相应极小，而端点线在单位尺度上仍是 $O(Dh)$ 条，计数不再受 $(Dh)^2$ 控制（因为比较线与矩形尺度失配后仍然给同样上界，但断点数量在切割邻域无 $D$ 界）。截断 $V_\eta$ 的作用正是在切割邻域把输出强制成 $*$，`mesh:truncated` 才有 $16004D$ 这个界。第二条：把 (iii) 换成绝对界 $|v_i|\le H$ 对所有坐标。[推测] 会停在 `dichotomy:main` 的 stationary 分支验证 `|V(y_i(n_j))|\ge L_*/16\ge|v_i|`（`05:285-286`）：$L_*/16\ge|v_i|$ 依赖 `dichotomy:relative-width` 的 $|v_i|\le(2M/k)L_i$，那一步本身是相对宽度的，绝对界给不出来。

### 6.4 Lemma (Local patterns through a specified label)，`03:135-144`

这是全篇最吃紧的一步，我逐句走完。

(a) 逐字：

```tex
\begin{lemma}[Local patterns through a specified label]\label{count:local}
There is an absolute constant $C$ such that, for every
$h_0<h\le2M$ and every full label $\beta\in\cL$, the number of pairs
consisting of $t\in\{0,\ldots,h-1\}^D$ and an eligible pattern for
$h,t$ containing $\beta$ is at most
\begin{equation}\label{count:local-bound}
 (CDh)^{6D}.
\end{equation}
The constant is independent of $q$，$\lambda$，$\beta$，and $D$.
\end{lemma}
```

(b) 完整推导。固定 $t$ 与一个记录值等于 $\beta$ 的位置 $z_0$（该位置必 regular）。逐标量坐标以 $z_0$ 为锚重参数化：$a$ 是 $z_0$ 处由 $\beta$ 指定的区间内的实代表，$b$ 是漂移变量（$u_i$ 或 $v_i$）。目标位置 $z$ 的未约化代表是 `count:anchored-scalar`：$a+\tau_z+\frac{z-z_0}{h}b$，$\tau_z=(z-z_0)t_i/h$ 或 $(z-z_0)\lambda t_i/h$。关键纪律在 `03:160-163`："The translation $\tau_z$ is fixed once $t,z_0,z,i$ are fixed. We retain only the restrictions on $a,b$ implied at the anchor，since discarding other restrictions can only increase the number of outputs." 丢弃别处约束、只留锚点约束，是把这个引理从"依赖 $\beta$ 宽度"变成"不依赖"的开关。

三分支的端点数各自封顶。第一系：$a$ 在长 $H_x$ 区间内，$|b|\le H_x$，$|z-z_0|/h<1$，故目标范围落在长 $\le3H_x$ 的实区间；$U$-端点的实提升是间距 $H_x$ 的格，$\le4$ 个端点入范围。stationary 第二系：$I=V(Y_{z_0,i})$，$|b|\le|I|$（来自 (iii)），$\lambda t_i/h$ 整数使 $\tau_z$ 整数，故模 $1$ 后所有目标落在 `mesh:neighbors` 的 $N(I)$ 内，$\le49$ 个端点相关；未约化范围长 $\le3|I|<1$，每个圆端点在其中至多一个提升。rotating 第二系：锚区间宽 $\le2H$，$|b|\le H$，目标范围长 $\le4H<1$，套 `mesh:truncated` 得至多 $16004D$ 断点，每个圆断点至多一个提升。

合并：`03:187-196` "the enclosing target interval and the finite list of breakpoint lifts are fixed before $a,b$ are varied"，"the magnitude of the fixed translation $\tau_z$ introduces no factor in the count"。每条比较线在 $(a,b)$ 中仿射；对 $0\le z<h$ 全部合并，每标量坐标至多 $16004Dh$ 条线（4、49 都被 $16004D$ 吃掉，因 $D\ge1$）。$e=2$ 套 `count:arrangement`：$9(16004Dh+1)^2\le C_0(Dh)^2$。$2D$ 个坐标相乘（只对 rotating 第二系截断）。

还原词：`03:205-208` 说明标量输出决定完整记录词，位置为 dummy 当且仅当某 rotating 输出为 $*$，"No additional choice of a regular-position mask is needed"（否则要多乘 $2^h$，那是致命的）。最后 `03:210-217`：$t$ 有 $h^D$ 种、锚点 $z_0$ 有 $\le h$ 种，总数 $\le h^{D+1}[C_0(Dh)^2]^{2D}=C_0^{2D}D^{4D}h^{5D+1}\le(CDh)^{6D}$。

(c) 每个常数与指数的落点。$h^{D+1}$ 里 $D$ 次方来自 $t$，$+1$ 来自锚点；$(Dh)^{4D}$ 来自 $2D$ 个坐标各贡献平方。合成 $h^{5D+1}D^{4D}$，要写成 $(CDh)^{6D}$ 需要 $h^{5D+1}D^{4D}\le C^{6D}D^{6D}h^{6D}$，即 $h\cdot C_0^{2D}\le C^{6D}D^{2D}h^{D}$；$h\ge1$、$D\ge1$ 时把 $h$ 的一个幂次留给 $h^{D}$ 的余量（$h\le2M$ 而 $D\ge1$，$h$ 至少 $1$），论文用一句 "since $D\ge1$"（`03:217`）收掉。$6D$ 的余量正好允许 $C$ 独立于 $D,q,\lambda,\beta$。$e=2$ 是"每次两个标量参数"的实现，`01:145-146` 的纲要句 "It follows by anchoring at one visit and counting affine comparisons in two scalar parameters at a time" 与此完全对应。$C$ 独立于 $\beta$ 的宽度这件事，是 `01:142-144` 那句 "with an absolute $C$ independent of $q$，$\lambda$，and the width of the anchor interval" 的兑现。

(d) 三条候选失败路线与机制性停住点。其一：不锚定，直接对起点 $x,y$ 与 $u,v$ 四个变量一起用 $e=4D$ 排列。停在维度：$(e+1)^2(s+1)^e$ 里 $e$ 是维度，取 $e=4D$ 得 $(Dh)^{4D}$ 变成 $(Dh)^{cD}$ 但底数 $s$ 要按 $D$ 个坐标同时列举，总对数变成 $D^2\log(Dh)$ 量级，`outer:second-weight` 的 $6\log(CD^3)/D$ 变 $O(D)$，`04:137` 的和不再 $o(1)$。这正是 `01:132-135` 说 "constants depending arbitrarily on the dimension would not suffice" 的具体含义。其二：保留所有位置的约束（不只锚点）。停在 $\tau_z$ 的量级进入计数：一旦 $a$ 的允许集变成"所有 $z$ 的区间约束之交"，区间随 $z$ 在圆上跑遍 $s_i$ 个格点位置，锚定矩形变成一堆小矩形的交，其端点数量随 $h$ 增长，线数从 $O(Dh)$ 升到 $O(Dh^2)$，$(Dh)^2$ 升到 $(Dh^2)^2$，合成 $(CDh)^{8D}$，`outer:second-weight` 的指数 $6\log(CDh)/h$ 变 $8\log(CDh)/h$，仍可；但 `dichotomy:main` 里"含 heavy 索引的块才 eligible"这条要用 (iii) 的相对宽度，若约束全保留则 $v_i$ 必须在所有 stationary 坐标满足宽度条件，验证 `05:281-289` 时要额外控制跨切割行为，`05:292-293` 的 "This argument uses only the two endpoint representatives; it requires no assertion about the intervening path across a cut" 这条节省就没了。[推测] 论文用"只留锚点约束"换来的是完全绕开路跨切割的问题。其三：把 dummy 位置也算进比较线。停在 mask 的 $2^h$ 因子：$2^h e^{-h/64}$ 发散，`04:137` 的求和立刻崩。

## 7 §4 outer：计数不等式在这里承担的角色

我在读到 §4 之前对 outer 的猜测是"它就是给标签随机染色然后集中"。读完发现它的角色更窄也更关键：`count:global` 与 `count:local` 这两个计数只在这里被消费，而且是以"事件族的总权重"这种形式被消费。outer 这一层把"字数有限"翻译成"局部引理的依赖图可解"。§3 的全部力气因此是为了让 §4 的事件族在两个方向上同时稀：按字（第一族）稀，按标签（第二族）稀。

轻重定义在 `04:4-10`，逐字：

```tex
The pattern counts allow one coloring of $\cL$ to balance all the
tests needed below. For a fixed cyclic progression as in
\Cref{setup:cyclic}, call a full label \emph{light} if its multiplicity
in the progression is at most $k/M$, and \emph{heavy} otherwise.
A position has the same designation as its label. These designations
always refer to the whole progression, even when we later examine a
short block of its positions.
```

$k/M=k^{1/2}$ 是轻重阈值。`04:8-10` 那句 "always refer to the whole progression" 我在 §8 用到：`dichotomy:heavy-width` 里的 heavy 索引可以与选 $h$ 时用的 heavy 标签无关，全靠这条约定才成立。

### 7.1 Lemma (Finite asymmetric local lemma)，`04:16-26`

(a) 逐字：

```tex
\begin{lemma}[Finite asymmetric local lemma]\label{outer:lll}
Let $\mathcal E$ be a finite family of events. Suppose a graph on
$\mathcal E$, with neighbor sets $\Gamma(E)$, has the property that each
$E$ is independent of the sigma-algebra generated by the events outside
$\{E\}\cup\Gamma(E)$. If numbers $z_E\in(0,1)$ satisfy
\begin{equation}\label{outer:lll-condition}
 \Pp(E)\le z_E\prod_{F\in\Gamma(E)}(1-z_F)
 \qquad(E\in\mathcal E),
\end{equation}
then $\Pp(\bigcap_{E\in\mathcal E}E^c)>0$.
\end{lemma}
```

(b) 推导（`04:28-66`，构造性，无 Moser 环）。同时对 $|T|$ 归纳证两件事：$\mathbb P(A_T)>0$ 与 $\mathbb P(E\mid A_T)\le z_E$（$E\notin T$），$A_T=\cap_{F\in T}F^c$。$T=\varnothing$：正性显然，条件界由 `outer:lll-condition` 除以空积 $=1$ 得。归纳步：从 $T$ 去掉任一 $F$，$\mathbb P(A_T)=\mathbb P(A_{T\setminus F})(1-\mathbb P(F\mid A_{T\setminus F}))$，$T\setminus F$ 更小故 $\mathbb P(F\mid A_{T\setminus F})\le z_F<1$，正性得。条件界：拆 $T_1=T\cap\Gamma(E)$、$T_2=T\setminus T_1$。$T_1=\varnothing$ 时 $E$ 与 $A_{T_2}$ 独立（用 sigma-代数那条假设），$\mathbb P(E\mid A_T)=\mathbb P(E)\le z_E$。否则先由归纳对小集 $T_2$ 得正性；$T_1$ 的元素排序后逐个条件化，每步条件集大小 $\le|T|-1$，得 $\mathbb P(A_{T_1}\mid A_{T_2})\ge\prod_{F\in T_1}(1-z_F)$；分子用 $E$ 对 $T_2$ 独立，$\mathbb P(E\mid A_T)\le\mathbb P(E)/\mathbb P(A_{T_1}\mid A_{T_2})\le\mathbb P(E)/\prod_{F\in T_1}(1-z_F)\le z_E$，末步用 `outer:lll-condition` 和 $T_1\subseteq\Gamma(E)$。取 $T=\mathcal E$。

(c) 为何是非对称版，并非对称版。对称版要 $\mathbb P(E)\le p$、$|\Gamma|\le D$、$ep(D+1)\le1$，把 $\Gamma$ 的大小乘进 $p$ 的要求里。这里第一族事件之间可能共享大量标签（同一字的不同行、不同字的相同片段），$|\Gamma|$ 不好统一估；非对称形式允许"邻居权重的和" $\sum_{F\in\Gamma(E)}z_F$ 替代 $D$，`04:160-163` 正是这样用：$\sum_{F\in\Gamma(E)}z_F\le l(E)/500$，与 $z_E=e^{-l(E)/32}$ 指数同阶地小。为何要有限性与 sigma-代数表述：$c_*$ 的随机变量是 $\mathcal L$ 上的独立比特，$\mathcal L$ 有限（$|U|^D|V|^D<\infty$），所以 $\mathcal E$ 有限，不需要一般测度论版本；sigma-代数表述保证"$E$ 只依赖它 support 上的变量"这条被正式使用。

(d) [推测] 失败路线：用 Lovasz 原始对称陈述配最大度数。停在依赖度的双重计数：第一族事件数 $kT_{\mathrm{glob}}$，每个事件的 support 是 $\ge\delta M-1$ 个标签，两个事件相关的概率随 support 交集大小变化，度数上界会引入 $T_{\mathrm{glob}}$ 的线性倍数，$ep(D+1)\le1$ 变成 $e\,p\,T_{\mathrm{glob}}\le1$，即 $p$ 要小到 $1/T_{\mathrm{glob}}$，而 $p=\mathbb P(E)=2e^{-l/8}$，$l\ge\delta M$ 给 $p\approx e^{-k^{1/2}/80}$，与 $1/T_{\mathrm{glob}}=e^{-O(k^{0.3}\log k)}$ 比仍小得多，看似可用；真正的问题是第二族事件度数无界（同一标签 $\beta$ 可出现在极多 pattern 里），必须按标签局部化，这只有非对称权重形式能做。第二条：用 Erdos 概率方法（union bound）代替 LLL。停在第二族：单个 pattern 坏的概率 $2e^{-h/64}$ 而对 pattern 总数要求 $o(1)$ 需要 $\sum_{t,\text{patterns}}2e^{-h/64}<1$，这个和对 $\beta$ 无限制时会乘进 $|\mathcal L|\cdot h^D$ 的巨大因子；LLL 换来的是"每个标签的入射权重 $\le1/500$"这种逐点条件。

### 7.2 Proposition (Balanced outer coloring)，`04:68-79`

(a) 逐字：

```tex
\begin{proposition}[Balanced outer coloring]\label{outer:coloring}
For all sufficiently large $k$, there is a map
$c_*:\cL\to\{0,1\}$ with the following properties.
\begin{enumerate}[label=\textup{(\roman*)}]
 \item In every cyclic progression having at least $\delta k$ light
 positions, each bit occurs on at least one quarter of its light
 positions when labels are colored by $c_*$.
 \item In every eligible recorded pattern of \Cref{count:eligible},
 each bit occurs on at least one quarter of its regular positions.
\end{enumerate}
The threshold on $k$ is absolute.
\end{proposition}
```

(b) 第一族的构造我要完整重走，因为 "rows" 这个 device 是整个 dichotomy 的入口。取一个有 $L_0\ge\delta k$ 个轻位置的循环进程，取其不同完整标签字；$w_{\max}$ 是轻标签的最大重数，$\le k/M$。把轻位置按等标签分组排成一列（分组顺序由字本身决定，`04:88-89` "with all choices fixed as functions of the word"，这一句是为了让事件族不引入额外随机选择），再把这列按模 $w_{\max}$ 循环分发到 $w_{\max}$ 行。每行长度 $\ge\lfloor L_0/w_{\max}\rfloor\ge\delta M-1$（`04:92-96`）。每行内同一标签至多出现一次（因组大小 $\le w_{\max}$），所以每行测试的都是互异独立变量。坏事件：某行有某个比特出现次数严格少于其位数的 $1/4$。事件总数 $\le kT_{\mathrm{glob}}$（行数 $w_{\max}\le k/M\le k$，字数 $T_{\mathrm{glob}}$）。

第二族：每个 eligible pattern 配其离散参数 $(h,t)$，$h_0<h\le2M$，一个坏事件：某比特在 regular 位置上严格少于 $1/4$。测试变量数 $l(E)\ge h/2$（eligibility (i) 给出 $\ge h/2$ 个两两不同的标签）。

尾部：$l$ 个独立公平比特里 $1$ 的个数 $X$，$\mathbb E e^{\pm(X-l/2)}=(\cosh(1/2))^l\le e^{l/8}$，依据是 $(2j)!\ge2^jj!$ 使 $\cosh t\le e^{t^2/2}$（逐项比较幂级数，`04:116-117`）。Markov 对两侧偏离给 `outer:tail`：$\mathbb P(E)\le2e^{-l/8}$。

权重 $z_E=e^{-l(E)/32}$。第一族总权重 $\le kT_{\mathrm{glob}}e^{-(\delta M-1)/32}=o(1)$（`04:130-131`，用 `count:global` 的 $o(M)$）。第二族按固定标签 $\beta$ 局部化：`04:135-138`

```tex
 \sum_{h_0<h\le2M}(CDh)^{6D}e^{-h/64}
 \le\sum_{h>D^2}(CDh)^{6D}e^{-h/64}=o(1).
```

统一性论证在 `04:139-145`：取 $C\ge1$，$\log(CDh)/h$ 在 $h\ge D^2$、$D$ 大后递减，故 $\sup_{h>D^2}6D\log(CDh)/h\le6\log(CD^3)/D=o(1)$，于是每项至多 $e^{-h/128}$，尾部随 $D\to\infty$ 趋于 $0$。合并两族得逐标签入射权重 `outer:incident-weight`：$\sum_{E:\,\xi_\beta\text{ used}}z_E\le1/500$。依赖图：两事件 support 共享标签就相连。$\sum_{F\in\Gamma(E)}z_F\le l(E)/500$。$l(E)\ge100$（第一族 $\delta M-1$、第二族 $h/2>D^2/2$，`04:164-165`）。$z_E<1/2$，$\log(1-z)\ge-2z$（$0\le z\le1/2$），得 `outer:criterion`：

```tex
 z_E\prod_{F\in\Gamma(E)}(1-z_F)
 &\ge\exp\!\left[-\left(\frac1{32}+\frac2{500}\right)l(E)\right]
 \notag\\
 &\ge2e^{-l(E)/8}\ge\Pp(E).
```

`04:175-176` 给出最后一步的算术：正差 $1/8-1/32-2/500$ 乘 $100$ 超过 $\log2$。

(c) 常数的机械理由。$1/32$ 是 $1/8$ 与"还要吃掉邻居损失"之间的分割：$1/8$ 是尾部系数，$1/32$ 让 $z_E$ 比 $\mathbb P(E)$ 的指数慢 4 倍，剩下 $2/500$ 付邻居。三者的算术余量：$1/8-1/32-1/250=(125-25-4)/1000\cdot... $，精确地 $=0.125-0.03125-0.004=0.08975$，乘 $100$ 得 $8.975>\log2=0.693$，余量极大。$l(E)\ge100$ 就是这个"乘 100"的来源：论文只需 $1/8-1/32-2/500\ge(\log2)/l$，用 $l\ge100$ 换成一个绝对不等式检查。$1/500$ 的选取同理只要比 $1/32$ 小得多，与 $500$ 无关紧要。$h>D^2$ 与 $h_0=D^2$ 一致，这解释了 `setup:dilation` 里 $h_0=D^2$ 的第二重作用：它同时是"短周期消失"的界与"权重和收敛"的下限。若 $h_0$ 小于 $D^2$ 的某个倍数，$\sup 6D\log(CDh)/h$ 会在小 $h$ 处变大，`04:144` 的界要用 $6\log(CDh_0')/h_0'$，只要 $h_0'\to\infty$ 且 $\log h_0'/h_0'\cdot D\to0$；$h_0=D^2$ 让 $6\log(CD^3)/D$ 这一形式最干净。

(d) [推测] 失败路线：给 $c_*$ 加"平衡到 $1/2$ 附近"的更强结论。停在事件定义：$1/4$ 已经只需尾部 $e^{-l/8}$ 的一半裕度；若把 $1/4$ 改成 $1/2-\varepsilon$，$\mathbb P(E)$ 变成 $2e^{-2\varepsilon^2l}$，与 $z_E=e^{-l/32}$ 比较需要 $\varepsilon^2\ge1/32$ 且邻居项还要更小，而 $l\ge100$ 的绝对性会被 $\varepsilon$ 破坏，整个"绝对阈值"声明受威胁。第二条：让 $c_*$ 依赖 $r$。`02:9-10` 明确禁止："no threshold in the construction depends on the eventual number of colors $r$"，`outer:coloring` 末句 "the threshold is absolute" 是对它的兑现；这条失败的性质属于量化纪律一侧，机制层面它并不违反任何一条估计。

## 8 §5 dichotomy：它分的是哪两种情形

`05:4-9` 的开场白就是答案，逐字：

```tex
We show that every cyclic progression either receives many occurrences
of each outer bit or admits one affine lift in the centered second
coordinates. The issue is repeated labels: a closest return to a heavy
label identifies a rational period and a small drift. Short periods
disappear under the dilation, while longer periods supply the eligible
patterns tested in \Cref{outer:coloring}.
```

分岔对象：一个固定循环进程 $n_j=n_0+jd$，$d\ne0$。两个分支：(i) 每个外色至少出现 $\gamma k$ 次（富色），(ii) 居中代表 $\tilde y(n_j)$ 整体在 $\R^D$ 中仿射。二者可重叠，`06:276-277` "The cases may overlap，which only enlarges their combined bound"。

### 8.1 Lemma (Affinity inside a small box)，`05:11-17`

(a) 逐字：

```tex
\begin{lemma}[Affinity inside a small box]\label{dichotomy:affinity}
Let $z_j=a+jb$ in $\T^e$, for $0\le j<k$, and let
$J\subseteq\{0,\ldots,k-1\}$. Suppose real representatives
$Z_j\in\R^e$，$j\in J$，lie in one box whose coordinate intervals
have length at most $2H$. If $2kH<1$，there are $A,B\in\R^e$
such that $Z_j=A+jB$ for every $j\in J$.
\end{lemma}
```

(b) `05:19-31`。任取 $j_1<j_2<j_3\in J$。模 $1$ 仿射给 $(j_3-j_2)(Z_{j_2}-Z_{j_1})-(j_2-j_1)(Z_{j_3}-Z_{j_2})\in\Z^e$。逐坐标绝对值 $\le2H(j_3-j_1)\le2kH<1$，故为 $0$。三点共仿射；$|J|\ge2$ 时用最小与最大索引插值出 $A,B$，三重恒等式把其余点放到同一条插值上；$|J|\le1$ 直接成立。

(c) $2H$ 是完整标签盒子的坐标宽度上限（`mesh:width` 给 $|I|\le2H$）。条件 $2kH<1$ 即 $2k\cdot k^{-2}<1$，$k>2$ 就成立，取 $H=k^{-2}$ 让它对一切大 $k$ 成立。$J$ 不要求连续是本引理的要点，`06:41` 特意保留 "The indices in $J$ need not be consecutive"。

(d) [推测] 失败路线：把"一个盒子"换成"直径 $\le2H$ 的点集"。停在盒子的坐标积结构：三重恒等式的坐标估计要用同一坐标内所有 $Z_j$ 落在长 $\le2H$ 的同一区间，一般点集直径只在 $\ell^\infty$ 或 $\ell^2$ 意义下成立时也可，但 `06:71-73`（convex combination 论证）要用盒子是实半开区间的积、因而凸，这一点在一般点集上不成立。

### 8.2 Lemma (Closest return and drift)，`05:37-56`

(a) 逐字（结论块）：

```tex
\begin{gathered}
 1\le h\le2M,\\
 |u_i|\le\frac{H_x}{m_*-1}\le\frac{2MH_x}{k},\qquad
 |v_i|\le\frac{2H}{m_*-1}\le\frac{4MH}{k}
 \quad(1\le i\le D),
 \end{gathered}
```

其中 $m_*=|J|>k/M$，$h$ 是 $J$ 中两元素的最小正差，$u=\hat x(n_{j'+h})-\hat x(n_{j'})$，$v=\tilde y(n_{j'+h})-\tilde y(n_{j'})$。

(b) `05:58-81`。$m_*>k/M$ 给 $m_*-1\ge k/(2M)$（大 $k$）。$h\le(j_+-j_-)/(m_*-1)\le(k-1)/(m_*-1)\le2M$，抽屉原理：$m_*-1$ 个相邻差的和是 $j_+-j_-\le k-1$。所有 $(\hat x,\tilde y)$ 落在同一完整标签盒，坐标宽 $\le2H$（`mesh:width`），用 `dichotomy:affinity` 得差与指标差成正比；所选 gap $h$ 处的差是两端点差的 $h/(j_+-j_-)$ 倍。第一坐标端点差绝对值 $\le H_x$、第二坐标 $\le2H$，除以 $(j_+-j_-)/(h)\ge(m_*-1)$ 的倒数关系即得 `dichotomy:drift-bounds`。$v=\lambda u$ 的实向量等式：$y=\lambda x$ 在环面上成立，故 $v-\lambda u\in\Z^D$；由 $\lambda H_x=H$，$|v_i-\lambda u_i|\le|v_i|+\lambda|u_i|\le4MH/k+H\cdot2M/k=6MH/k<1$，整数向量逐坐标为 $0$。

(c) $H_x\le H$ 使两界能合并成 $6MH/k$；$6MH/k=6k^{-2.5}$。要它 $<1$ 只需 $k\ge2$。$u,v$ 的实向量等式是分支 (ii) 的种子：有了 $v=\lambda u$，`dichotomy:path` 才能把第二系路径写成 $\lambda t/h+v/h$。阈值 $2M$ 的来源：$h\le2M$ 保证块长度可控，`count:local` 的 $h$ 范围与 `outer:second-weight` 的求和上限都锚在这个 $2M$ 上。

(d) [推测] 失败路线：不取最小差而取任意两次的差。停在 $|u_i|\le H_x/(m_*-1)$：比例因子 $h/(j_+-j_-)$ 只有在 $h$ 是最小差时才 $\le1/(m_*-1)$（$j_+-j_-\ge(m_*-1)h$）。取一般差会得到大得多的漂移，$\eta$ 的比较（`05:253`）就失效。第二条：用中位数差代替最小差。停在 $h\le2M$：抽屉只给最小差 $\le2M$。

### 8.3 Lemma (Rational path and separated residues)，`05:83-96`

(a) 结论逐字：存在 $t\in\{0,\ldots,h-1\}^D$ 使 `dichotomy:path-equations`

```tex
 x(n_j)&=x(n_0)+\frac jh(t+u),\\
 y(n_j)&=y(n_0)+\frac jh(\lambda t+v)
```

在 $\mathbb T^D$ 中成立（$0\le j<k$）；并且 $\gcd(t_1,\ldots,t_D,h)=1$；模 $h$ 不同余的指标有互异的完整标签，于是同一完整标签的所有出现都落在模 $h$ 的单一剩余类中。

(b) `05:98-137`。$hx(d)=u$ 于 $\mathbb T^D$，故 $t'=h\hat x(d)-u$ 为整向量，逐坐标模 $h$ 约化得 $t$。第一式：$x(n_j)=x(n_0)+jx(d)=x(n_0)+\frac jh(hx(d))=x(n_0)+\frac jh(t+u)$。第二式由 $\lambda$ 乘第一式与 $v=\lambda u$。gcd：设 $e>1$ 整除 $h$ 与所有 $t_i$；$t'-t\in h\Z^D$ 故 $e\mid t'_i$ 全部；于是从 $j'$ 到 $j'+h/e$ 的环面位移是 $u/e$ 与 $v/e$；向量 $(\hat x(n_{j'}),\tilde y(n_{j'}))+\frac1e(u,v)$ 是两端点代表的凸组合，而共同完整标签盒是实半开区间的积、凸，所以它落在同一盒内，是该样本被选定的代表，于是在严格更小的正 gap $h/e$ 处再次访问同一标签，与 $h$ 的最小性矛盾。阶：$t/h$ 在环面上阶恰为 $h$（Bézout：若 $h\mid at_i$ 全部则 $h\mid a$）。标签分离：$j_1\not\equiv j_2\pmod h$ 时至少一坐标的有理位移 $(j_1-j_2)t_i/h$ 圆距 $\ge1/h$；该坐标漂移绝对值 $\le k|u_i|/h\le2MH_x/h\le2MH/h$；三角不等式给实际位移圆距 $\ge(1-2MH)/h\ge(1-2MH)/(2M)>H\ge H_x$（大 $k$，用 $2MH=2k^{-1}\to0$）。同处一个 $U$-区间的两样本圆距 $\le H_x$，故不同余者完整标签必异。

(c) `05:134-136` 用 $U$-区间判分离，并非 $V$-区间，这是刻意的：$U$ 是均匀分割，宽度 $H_x=H/\lambda$ 与所有点等宽；$V$ 靠切割点可以任意细，用 $V$ 判"距离 $>H$ 就不同标签"需要下界而 `mesh:width` 只给上界。$H_x\le H$ 使 $(1-2MH)/2M>H\ge H_x$ 成立。$2MH\to0$ 是 $H=k^{-2}$、$M=k^{1/2}$ 的直接后果。

(d) [推测] 失败路线：跳过 gcd 论证，直接宣称 $t/h$ 阶为 $h$。停在"$h$ 是最小 gap"这一信息如何进入：gcd 恰好排除"存在公共因子使更小 gap 也访问同标签"，若不证 gcd，后面的"每块内标签两两不同"只在剩余类模 $\operatorname{ord}(t/h)$ 上成立，块长 $h$ 的 eligibility (i) 会缺。第二条：用 $V$-区间分离。停在宽度下界不存在。

### 8.4 Lemma (Drift relative to every heavy interval)，`05:139-147`

(a) 逐字：

```tex
For every heavy index $j_*$ of the fixed progression and each
$1\le i\le D$,
\begin{equation}\label{dichotomy:relative-width}
 |v_i|\le\frac{2M}{k}\,|V(y_i(n_{j_*}))|.
\end{equation}
The heavy label here need not be the one used to choose $h$.
```

(b) `05:149-172`。设 $j_*$ 处标签重数 $m'>k/M$，$j_\pm$ 为其极端出现指标。`dichotomy:path` 给 $j_+-j_-=ah$，$m'-1\le a<k/h$。记 $L_i=|V(y_i(n_{j_*}))|$。实代表差 $\Delta_i=\tilde y_i(n_{j_+})-\tilde y_i(n_{j_-})$ 满足 $|\Delta_i|\le L_i\le2H$（同一区间内两点的代表差以区间长为界）。由 `dichotomy:path-equations`，$\Delta_i\equiv av_i\pmod1$。又 $|av_i|\le\frac{4MH}{h}\cdot\frac{a h}{k}\cdot\frac{k}{h}... $，论文给 $|av_i|\le4MH/h$（用 $a<k/h$ 与 $|v_i|\le4MH/k$ 相乘：$a|v_i|<(k/h)(4MH/k)=4MH/h$），$|\Delta_i-av_i|\le2H+4MH/h<1$（$h\ge1$、$H$ 小）。整数 $\Delta_i-av_i$ 为 $0$。故 $|v_i|=L_i'/a\le L_i/(m'-1)\le(2M/k)L_i$。

(c) $m'-1\ge k/(2M)$ 给出系数 $2M/k$。此引理是把 `count:eligible` 的 (iii) 从"锚点坐标"推广到"块内每个位置"的中间站：`05:285-286` 的组合 $|V(y_i(n_j))|\ge L_*/16\ge|v_i|$ 里第二个不等号正是 `(2M/k)L_*\ge|v_i|$ 配上 $2M/k\le1/16$（`05:287`）。

(d) [推测] 失败路线：只用 $j_*=j'$（选 $h$ 的那个标签）。停在 `dichotomy:main` 的块使用：长周期分支要"任何含 heavy 索引的整块"都 eligible，heavy 索引可以是块内任意位置，与锚 $j'$ 无关。第二条：跨切割路径论证。`05:170-172` 明确拒绝："This argument uses only the two endpoint representatives; it requires no assertion about the intervening path across a cut."

### 8.5 Theorem (Outer-color dichotomy)，`05:174-186`

(a) 逐字：

```tex
\begin{theorem}[Outer-color dichotomy]\label{dichotomy:main}
For every sufficiently large $k$, the coloring $c_0$ from
\Cref{outer:pullback} has the following property. Every cyclic
progression $n_j=n_0+jd$，$0\le j<k$，with $d\ne0$ in $G$，
satisfies at least one of these alternatives:
\begin{enumerate}[label=\textup{(\roman*)}]
 \item each bit occurs among $c_0(n_0),\ldots,c_0(n_{k-1})$
 at least $\gamma k$ times;
 \item there are $A,B\in\R^D$ such that
 $\tilde y(n_j)=A+jB$ for all $0\le j<k$.
\end{enumerate}
The threshold on $k$ is absolute.
\end{theorem}
```

`outer:pullback`（`04:186-188`）就是 $c_0(n)=c_*(L(n))$。

(b) 富色入口：若有 $\ge\delta k$ 个轻位置，`outer:coloring`(i) 直接给每色 $\ge\delta k/4\ge\gamma k$。以下假设轻位置 $<\delta k$，于是存在 heavy 标签，`dichotomy:drift/path/heavy-width` 交出 $h,t,u,v$。

短周期分支（$h\le h_0$，`05:196-234`）。$h\mid\lambda$（`setup:dilation`），故 $\lambda t/h$ 为整，`dichotomy:path-equations` 的第二路有实步 $w=v/h$ 模 $1$。总位移 `dichotomy:short-motion`：$k|w_i|\le4MH/h<1/2$。另一面 $w_i=y_i(d)\pmod1$ 属 $q^{-i}\Z$（$y_i(d)$ 的代表是 $q^{-i}$ 的整数倍，加整数不变），故 `dichotomy:step-lattice`：$w_i\ne0\Rightarrow|w_i|\ge q^{-i}\ge q^{-D}\ge\alpha$。反证：若采样居中代表不等于 $\tilde y(n_0)+jw$，某坐标 $w_i\ne0$ 且闭线段 $\tilde y_i(n_0)+\tau w_i$，$0\le\tau\le k-1$ 碰到 $1/2+\Z$ 中的切割点；"closed" 包含首末样本恰在切割上的情形（`05:217-219`，覆盖两个运动方向与精确命中）。于是每个采样点到最近切割的实距 $\le k|w_i|$，即 $\rho(y_i(n_j))\le k|w_i|$。由 `mesh:width` 与 `dichotomy:step-lattice`：$|V(y_i(n_j))|\le2H(\rho+\alpha)\le2H(k+1)|w_i|<|w_i|$，末步用 `05:226` 的 $2H(k+1)<1$（$H=k^{-2}$）。但 `dichotomy:short-motion` 说同坐标任意两采样圆距 $|j-j'||w_i|\ge|w_i|$（总位移 $<1/2$ 保证圆距等于实距）。宽 $<|w_i|$ 的单个 $V$-区间装不下两点，故所有完整标签两两不同，与 heavy 标签矛盾。于是逐点等于 $\tilde y(n_0)+jw$，即分支 (ii)。

长周期分支（$h_0<h\le2M$，`05:236-307`）。把前 $h\lfloor k/h\rfloor$ 个指标切成连续整 $h$-块，余块 $<h$ 个。整块起点 $j_0$、起点 $x(n_{j_0}),y(n_{j_0})$、同样的 $h,t,u,v$，形式即 `count:local-paths`。regularity 验证：rotating 坐标 $i$ 有 $s_i>h_0$；无漂移时 $h$ 个值 $\{y_i(n_{j_0})+z\lambda t_i/h\}_{z<h}$ 遍历 $s_i$ 点等距格各 $h/s_i$ 次；实际值与格值差 $\le|v_i|\le4MH/k<\eta$；故实际位置在该坐标非 regular 时，格值距切割 $\le2\eta$；长 $4\eta$ 的弧含 $s_i$-格点至多 $4\eta s_i+1$，故该坐标排除的位置比例 $\le4\eta+1/s_i$；对 rotating 坐标并集：非 regular 比例 $\le D(4\eta+1/h_0)=4/1000+1/D<1/2$（`dichotomy:regular-fraction`）。于是每块至少 $h/2$ 个 regular 位置；块内标签两两不同（`dichotomy:path`）；(ii) 由 `dichotomy:drift-bounds`。取含 heavy 索引 $j_*$ 的整块，固定 stationary 坐标 $i$，$I_*=V(y_i(n_{j_*}))$、$L_*=|I_*|$：有理步整数使 $\operatorname{dist}(y_i(n_j),y_i(n_{j_*}))\le\frac{|j-j_*|}{h}|v_i|\le|v_i|\le\frac{2M}{k}L_*$，大 $k$ 时把 $y_i(n_j)$ 放进 $\overline{I_*}$ 的圆 $L_*$-邻域；`mesh:neighbors` 给 $|V(y_i(n_j))|\ge L_*/16\ge|v_i|$（末步 $2M/k\le1/16$ 加 `dichotomy:relative-width`）。于是 eligibility (iii) 在块内每个位置成立，特别在每个 regular 位置成立。每个含 heavy 索引的整块都 eligible，`outer:coloring`(ii) 给每块每色 $\ge h/8$ 次。未被这样用的整块全是轻位置，故被用整块覆盖的位数 $\ge k-h-\delta k\ge\frac45k$（`h\le2M=o(k)`），每色至少 $k/10\ge\gamma k$。

(c) 指数链：$4\eta+1/s_i$ 的 $4$ 来自弧长 $4\eta$；$\eta=1/(1000D)$ 与 $h_0=D^2$ 使 `dichotomy:regular-fraction` 等于 $0.004+1/D$；$h/8$ 是 "$\ge h/2$ regular 中的 $1/4$"；$\gamma=1/100$ 与 $1/10$ 的 $k/10$ 对齐。$4/5$ 与 $h\le2M$ 的松弛只服务 $k/10\ge\gamma k$。

(d) [推测] 失败路线：短周期分支不设格 $q^{-i}$。停在 $|V|\le2H(k+1)|w_i|$ 需要 $\alpha\le|w_i|$ 这个下限；若无 `dichotomy:step-lattice`，$w_i$ 可以任意小，区间宽上界与位移下界无法比较，矛盾推不出来。$\alpha=q^{-(D+1)}\le q^{-D}$ 与 $q^{-i}\ge q^{-D}$ 的夹逼正是 `02:140-142` 预告的 "its choice will be compared with the discrete step lattice in the short-period argument of \Cref{dichotomy:main}"。第二条：长周期分支不设 regular 截断。停在 `count:local` 的宽度无关性，见 §6.3(d)。第三条：让块可重叠。停在 `outer:coloring`(ii) 只能逐块给 $h/8$，重叠块会重复计数同一位置，$k-h-\delta k$ 的求和界失效。

## 9 §6 perturbation：扰的是哪个对象

先立一句我自己的判断：这一节扰的对象是"外色 $c_0$ 在具体点上的取值"，而承载随机性的索引集是几何 key，一个 key 是"第二系盒子 + 整数平方范数带"的对。我最初的读法把扰动理解成"再随机一次颜色"，这是错的；`06:5-8` 说得很克制："This allows a small flip probability to preserve the progressions containing many of each outer color." 扰动的功能是二选一：把富色进程用 rare flip 杀掉，把仿射进程用 rare 变量个数杀掉。

keys 定义在 `06:15-21`，逐字：

```tex
f(n)=\norm{q\tilde y(n)}_2^2,
 \qquad
 \kappa(n)=\left((V(y_i(n)))_{i=1}^D,\,\floor{f(n)}\right),
 \qquad
 \cK=\{\kappa(n):n\in G\}.
```

`06:22-23`：`Thus a key records a specific second-system box and a specific integer squared-norm band. Since $G$ is finite, so is $\cK$.`

### 9.1 Lemma (Bounded multiplicity of a key)，`06:29-32`

(a) 逐字：

```tex
\begin{lemma}[Bounded multiplicity of a key]\label{perturb:multiplicity}
For every progression $n_j=n_0+jd$ in $G$ with $d\ne0$ and
$0\le j<k$, every key occurs at most four times among the $\kappa(n_j)$.
\end{lemma}
```

(b) `06:34-97`。先固定第二系盒子，$J$ 为落入它的指标集。每坐标区间宽 $\le2H$，`dichotomy:affinity` 给 $\tilde y(n_j)=A+jB$（$j\in J$）；$|J|\le1$ 时结论显然，$|J|\ge2$ 时缩放后的点 $q\tilde y(n_j)$ 共线。分离性：进程各项由 `setup:cyclic` 互异（$q$ 的阶 $>k$），$\lambda$ 是 $q^D$ 的单位故 $\lambda(n_j-n_{j'})$ 为非零剩余。取整数代表 $z$，$a$ 是最大的使 $q^a\mid z$ 的整数；$b\le D$ 时的整除性在加 $q^D$ 倍数下不变，故 $a$ 是剩余类的内禀量。写 $z=q^au$，$q\nmid u$。第 $a+1$ 坐标的圆位移是 $u/q\pmod1$，$u\bmod q\in\{1,\ldots,q-1\}$，除以 $q$ 后圆距 $\ge1/q$。于是两不同点的 $\ell^2$ 距离经缩放后 $\ge1$（`perturb:separation`）。`06:59-61` 特别标注这一步只用到 $q\nmid u$，"it does not require $u$ to be a unit or $q$ to be prime"。

几何：直线 $\ell$ 上取最接近原点之点 $z_0$ 与单位方向 $e$，点写成 $z_0+te$，则 $\|z_0+te\|^2=t^2+C'$，$C'=\|z_0\|^2\ge0$（因 $z_0\perp e$）。固定整数带 $m\le t^2+C'<m+1$ 非空时，在半轴 $t\ge0$ 上含于端点 $\sqrt{\max\{0,m-C'\}}$ 与 $\sqrt{m+1-C'}$ 的闭区间；两数下方面积差 $\le1$，而 $0\le u\le v$ 时 $(\sqrt v-\sqrt u)^2\le v-u$，故区间长 $\le1$；反射给 $t\le0$ 同样界。分离性使每个这样的区间至多含 2 个采样点（3 点需总分离 $\ge2$）。两半轴合计至多 4。`06:92-96` 处理了三处退化：带触及 $z_0$ 时 $t=0$ 在两半轴重复计入只会放大上界；把半开带换成闭区间覆盖了边界相等；恰两点的情形不需额外论证。`06:99-108` 的配图（`figures/norm-band.tex`）就是这条抛物面截线。

(c) 为什么盒子是 $V$ 系（第二系），并非 $U$ 系：`dichotomy:affinity` 的前提"坐标区间宽 $\le2H$"与 $2kH<1$ 都以 $H=k^{-2}$ 陈述，$U$ 系宽度是 $H_x=H/\lambda$，同样满足，但 `06:36-40` 直接引用第二系盒子是因为 key 的后半（范数带）也定义在 $\tilde y$ 上，两者必须同一坐标系统，才能用同一条直线参数化。为什么系数是 4：$t^2$ 的二次性给每半轴一段长 $\le1$ 的区间，两段就是 4。$q$ 的缩放让"整数格分离 $\ge1/q$"变成"缩放后 $\ge1$"，与带宽 1 同尺度，这个匹配是 $\|q\tilde y\|^2$ 里那个 $q$ 的全部理由。若把 $q$ 去掉，带宽与点分离度不可比，重数无界。

(d) [推测] 失败路线：把 key 换成只用盒子（不含范数带）。停在 `perturb:rich-bound` 之前的"$\gamma k/4$ 个互异 key"：盒子本身可以沿进程重复出现极多次（`dichotomy:path` 只保证模 $h$ 剩余类内标签不同，盒子粗于标签），重数无界则 $p^{\gamma k/4}$ 不成立。第二条：把带指标 $\lfloor f\rfloor$ 换成 $\lfloor f\|B\|^2\rfloor$ 之类的自适应宽度。停在 `perturb:separation` 与带宽的匹配被破坏，区间长不再是 1，四点界变成随 $B$ 变化的量，`perturb:signatures` 的三次系数 $(\theta_0,\theta_1,\theta_2)$ 也要重算。

### 9.2 签名与 Lemma (Counting affine signatures)，`06:110-136`

(a) 定义逐字（`06:110-118`）：

```tex
Call a cyclic progression \emph{affine} when its entire sequence of
centered representatives $\tilde y(n_j)$ is affine in $j$ as a sequence
in $\R^D$.  Its \emph{signature} is the literal word
\begin{equation}\label{perturb:signature}
 \sigma=\bigl((c_0(n_j),\kappa(n_j))\bigr)_{0\le j<k}.
\end{equation}
In particular, the entries retain the identities of the boxes and the
integer band indices.  Keys are not renamed when passing from one
progression to another.
```

结论逐字（`06:120-136`）：

```tex
 T_{\mathrm{aff}}
 \le C T_{\mathrm{glob}}\bigl(k(Dq^2+2)\bigr)^3.
```

以及

```tex
 \log\max\{1,T_{\mathrm{aff}}\}
 \le O(k^{3/10}\log k)+6\log q+O(\log k)
 =O(k^{9/10}\log k)=o(pk).
```

(b) `06:138-185`。仿射进程上 $\tilde y(n_j)=A+jB$，$f(n_j)=q^2\|A+jB\|^2=\theta_0+\theta_1j+\theta_2j^2$，$\theta_0=q^2\|A\|^2$、$\theta_1=2q^2\langle A,B\rangle$、$\theta_2=q^2\|B\|^2$。坐标都在 $[-1/2,1/2)$ 给 $0\le f(n_j)\le Dq^2/4$，记 $B_*=\lfloor Dq^2/4\rfloor+1$。对每个 $j<k$ 与每个 $b\le B_*$，"二次式与 $b$ 的比较"是 $(\theta_0,\theta_1,\theta_2)$ 空间中的一个曲面…论文把它当仿射超平面处理，因为比较式 $\theta_0+\theta_1j+\theta_2j^2\ge b$ 关于 $\theta$ 三元仿射（系数 $(1,j,j^2)$），确为超平面。总数 $\le k(B_*+1)\le k(Dq^2+2)$。$e=3$ 套 `count:arrangement` 给至多 $C(k(Dq^2+2))^3$ 个整数部分词。`06:160-162` 强调允许全部三元组、不施加几何关系，只会增大计数。完整标签词 $(L(n_j))$ 决定具体第二系盒子以及（$c_*$ 已固定）每个 $c_0(n_j)$，与整数部分词合并决定签名的每个分量，故相乘；`06:168-169`："no independence between the two words is asserted or needed"。对数估计用 `count:global` 的 $O(k^{3/10}\log k)$、$Dq^2+2\le3Dq^2$（$Dq^2\ge1$）、$\log q\le\frac{ck}{D}\log k+\log(2k^2)=O(k^{9/10}\log k)$，$pk=k^{19/20}$，$k^{0.9}\log k/k^{0.95}=k^{-1/20}\log k\to0$。

(c) 为什么维度固定在 3：仿射的二次范数只有三个系数，$D$ 完全被吸收进 $\theta$ 的值里。`06:183-184` 明写 "The arrangement constant comes from dimension three, so it is independent of the growing dimension $D$"。这就是我在 §1 里那个循环含糊点的出口：熵预算不来自 $D$ 维几何的直接计数，而来自"任何 $D$ 维仿射直线上的平方范数是 $j$ 的二次多项式"这个维数坍塌。$6\log q$ 的 6 是 $3\times2$（三次方 $\times$ $q^2$）。$Dq^2$ 的上界来自 $\|A+jB\|^2\le D/4$ 再乘 $q^2$。

(d) [推测] 失败路线一：直接对 $(A,B)\in\R^{2D}$ 做排列计数。停在 $e=2D$ 时 $(s+1)^{2D}$ 的对数是 $2D\log(kDq^2)=O(k^{0.1}\cdot k^{0.9}\log k)=O(k\log k)$，与 $pk=k^{0.95}$ 不可比，界崩。坍塌到 3 维是必要的，我一开始没有看到"$c_0$ 与盒子已经由完整标签词固定"这一层，所以以为必须计 $(A,B)$。失败路线二：把签名换成"外色词 + key 多重集"（丢掉 key 的字面身份）。停在 `perturb:affine-bound` 之后的"同一字面签名给同一事件"论证：多重集允许 key 改名，两个进程就不再定义同一事件，union bound 只能按进程计，出现 $q^{2D}$ 因子，而 $\log q^{2D}=O(k^{1.0}\log k)$ 又超出预算。

### 9.3 Theorem (A cyclic two-coloring)，`06:187-196`

(a) 逐字：

```tex
\begin{theorem}[A cyclic two-coloring]\label{perturb:cyclic}
There is an absolute integer $K_0$ such that, for every integer
$k\ge K_0$, the construction in \Cref{sec:setup} gives an integer
\[
 N=q^D\ge k^{ck},\qquad c=10^{-5},
\]
and a coloring $C:\Z/N\Z\to\{0,1\}$ for which no progression
$n_0,n_0+d,\ldots,n_0+(k-1)d$ with $d\ne0$ in $\Z/N\Z$ is
monochromatic.
\end{theorem}
```

(b) 染色定义 `perturb:final-coloring`：$C(n)=c_0(n)+E_{\kappa(n)}\pmod2$，$E_\kappa$ 独立 Bernoulli($p$)，$\mathbb P(E_\kappa=1)=p=k^{-1/20}$。`06:204-206` 三条纪律：只有这族比特随机；同 key 的位置用同一个比特，即使外色不同；$p<1/2$。

富色侧：设进程含 $\ge\gamma k$ 个每种外色，固定目标色 $b$。要使全进程成 $b$，每个 $c_0(n_j)=1-b$ 的位置必须 $E_{\kappa(n_j)}=1$。`perturb:multiplicity` 给这些位置至少指定 $\gamma k/4$ 个互异 key（每 key 至多 4 次），且 key 集合在采样比特之前已由进程与目标色确定（`06:213-214`），独立性可用：$\mathbb P\le p^{\gamma k/4}$。`06:219-221` 处理冲突：若某 key 也出现在外色为 $b$ 的位置，要求互相矛盾，概率为 0，仍受同一界约束。`06:221-223`："There is no choice of a subset of keys to count"。union bound：$(n_0,d)$ 少于 $|G|^2=q^{2D}$ 种，两个目标色，得 `perturb:rich-bound`，其指数主项系数由 `perturb:negative-coefficient` 给：

```tex
 2c-\frac{\gamma}{80}
 =\frac{1}{50000}-\frac{1}{8000}
 =-\frac{21}{200000}<0.
```

推导：$\log p=-\frac1{20}\log k$，$\frac{\gamma k}{4}\log p=-\frac{\gamma k\log k}{80}$；$2D\log q\le2D(\frac{ck}{D}\log k+\log(2k^2))=2ck\log k+2D\log(2k^2)$。合并系数 $2c-\gamma/80$。仿射侧：固定一个仿射进程实现的签名与目标色 $b$，每个分量 $(c_j,\kappa_j)$ 规定 $E_{\kappa_j}=b-c_j$；不一致则空事件；否则 $s$ 个互异 key 中 $u$ 个被规定为 1，$\mathbb P=p^u(1-p)^{s-u}\le(1-p)^s\le(1-p)^{k/4}$（用 `perturb:multiplicity` 得 $s\ge k/4$，$p\le1-p$）。同一字面签名的两个进程规定同一组随机变量的同一取值，故定义同一事件，只需计一次。于是 `perturb:affine-bound`：$A_k\le2T_{\mathrm{aff}}(1-p)^{k/4}\le2T_{\mathrm{aff}}e^{-pk/4}=\exp(-pk/4+o(pk))=o(1)$。`06:272-273` 强调两侧 union bound 都不需要进程之间或签名之间的独立。合并 `dichotomy:main`：$R_k+A_k=o(1)<1$，存在一组比特给出所需染色。$N=q^D\ge(k^{ck/D})^D=k^{ck}$。

(c) $2c-\gamma/80$ 的两项各自的来源：$2c$ 是 $q^{2D}$ 的对数主项（$2D\log q$ 里 $D$ 被 $\log q$ 的 $c/D$ 消掉），$\gamma/80$ 是 $p^{\gamma k/4}$ 的对数主项（$1/4$ 来自四点重数，$1/20$ 来自 $p$，$1/100$ 来自 $\gamma$，$\gamma/(4\cdot20)=1/8000$）。所以 $c$ 的上限被 $\gamma/160=1/16000$ 卡住，论文取 $10^{-5}$，留了 $1.6$ 倍余量。这是 $c$ 这个"绝对常数"被决定的地方。[推测] 若想让 $c$ 更大，必须同时改 $D$（影响 $\log q$ 的 $c/D$ 项）或改 $p$（影响 $1/20$）或改 $\gamma$（影响 dichotomy 的输出强度），而 §4 的整条指数链是互相锁死的。

(d) [推测] 失败路线一：flip 附在标签 $\beta$ 上（即 $C(n)=c_0(n)+E_{L(n)}$）。停在 `perturb:rich-bound`：一个标签沿进程可重复至多 $k/M$ 次（轻）或更多（重），重数无绝对上界，$\gamma k/4$ 个互异变量这一句失效。这解释 key 必须比标签细。失败路线二：flip 附在点上（完全独立）。停在 `perturb:affine-bound`：那样事件数就是进程数 $q^{2D}$，$\log$ 主项 $O(k\log k)$ 无法被 $-pk/4=-k^{0.95}/4$ 压住；论文在 `06:10-11` 就预告 "For progressions with affine lifts, a separate count of the possible keys makes the same small probability sufficient"，靠的正是"共享变量把进程折叠成签名"。失败路线三：把 $N=q^D\ge k^{ck}$ 直接当 $2^m$ 用而跳过 digit product。停在循环群到整数区间的转化没有一般做法，`07:57-59` 补了 "$m=1$ restricts the cyclic coloring to an ordinary interval of length $N$"，说明整数区间那一侧要靠 $m$ 次乘积，而 $m=\lfloor\log_2 r\rfloor$ 才是色数来源。

## 10 §7 transfers：搬的是什么，从哪个尺度到哪个尺度

`07:4` 一句定了性："The cyclic coloring has a deterministic product extension." 搬的是"循环群上无单色非零步进程的二色染色"，从尺度 $N$ 搬到 $N^m$，代价是色数从 $2$ 变成 $2^m$。这一步是全篇 $k$ 进入指数 $\log_2 r$ 次的唯一通道。

### 10.1 Proposition (Digit product)，`07:12-23`

(a) 逐字：

```tex
\begin{proposition}[Digit product]
\label{transfer:product}
Let $N,k\ge2$ be integers.  Suppose that a coloring
$C:\Z/N\Z\to\{0,1\}$ has no monochromatic progression
$a,a+d,\ldots,a+(k-1)d$ with $d\ne0$ in $\Z/N\Z$.
Then, for every positive integer $m$,
\[
 W_{2^m}(k)>N^m.
\]
Consequently $W_r(k)>N^{\lfloor\log_2r\rfloor}$ for every integer
$r\ge2$.
\end{proposition}
```

(b) `07:25-55`。$0\le n<N^m$ 写成 $N$ 进制 $n=\sum_{i=0}^{m-1}n_iN^i$，染色为 $(C(n_0),\ldots,C(n_{m-1}))\in\{0,1\}^m$，digit 与其模基数的剩余类认同。设有单色进程 $a,a+d,\ldots,a+(k-1)d$，$d>0$。$k\ge2$ 故 $d<N^m$。取最大的 $i$ 使 $N^i\mid d$，令 $e=d/N^i$，$N\nmid e$。核心恒等式 `transfer:division`：$\lfloor(a+jd)/N^i\rfloor=\lfloor a/N^i\rfloor+je$，成立理由是 $je$ 为整数（无需处理进位，因为 $d/N^i$ 已是整数，$a/N^i$ 的小数部分乘 $j$ 也不会影响 floor 的等式…精确地说：$a+jd=a\cdot1+jN^ie$，$\lfloor(a+jN^ie)/N^i\rfloor=\lfloor a/N^i+je\rfloor=\lfloor a/N^i\rfloor+je$）。模 $N$ 约化说明第 $i$ 位数字构成步长 $e\not\equiv0\pmod N$ 的循环进程；元组单色使 $C$ 在其上常数，矛盾。平移一位得到 $[N^m]$ 上的 $2^m$ 色无单色 $k$-AP 染色，即 $W_{2^m}(k)>N^m$。取 $m=\lfloor\log_2r\rfloor\ge1$，把至多 $2^m\le r$ 个颜色元组嵌入 $[r]$。

(c) "最大非零位"这个 device 的机械理由：低位（$i'>i$）会因 $d$ 在该位为 $0$ 而只受进位影响，无法保证进程性；最高非零位往低走时 $je$ 是整数，floor 精确可分。`07:6-9` 的开场白 "The relevant digit is the first place at which the common difference is nonzero; division by the corresponding power of the base then introduces no carry" 就是这个意思，并交代它的文献形态（Erdos-Turan `p.~263`，Fox-Hunter `Section~2` 重述）。$m$ 可以任意大且只用同一个 $C$（`07:58-59`："The product uses the same fixed coloring $C$ in every digit, for arbitrarily many digits"），这是 $N^m$ ，并非 $N^{m+o(1)}$ 的原因。

$d$ 的退化边界我要记清楚：$d>0$ 是整数区间一侧的前提（与 `01:8` 的 $a,d\ge1$ 一致），而 `transfer:product` 假设的循环侧条件是 $d\ne0$ 在 $\Z/N\Z$ 中。这两个"非零"不是同一个陈述：循环侧排除了 $N\mid d$ 的情形，整数侧的 $d$ 可以等于 $N$ 的倍数吗？在 digit 第 $i$ 位上出现的进程步长是 $e\bmod N$，$N\nmid e$ 保证非零，所以循环侧的强排除刚好够用。

(d) [推测] 失败路线：按最低位取 $i$。停在 $je$ 不再是整数或不再是全部低位进程：最低非零位往高位走，$d/N^i$ 是整数但高位数字受进位影响，$\lfloor(a+jd)/N^i\rfloor$ 无法分解，`transfer:division` 失效。第二条：用 $r$ ，并非 $2^m$ 直接配 $m$ 个 digit。停在 $2^m\le r<2^{m+1}$，多出的颜色用不上，$\lfloor\log_2r\rfloor$ 因此天生是"可用 digit 数"。

### 10.2 主定理的合成：$k$ 如何同时出现在底数与指数

`07:61-75` 的证明只有七行，但正是我最初猜想的那个落点，逐字：

```tex
\begin{proof}[Proof of Theorem~\ref{main:intro}]
Theorem~\ref{perturb:cyclic} supplies, for every integer $k$ above an
absolute threshold, such a cyclic coloring with
\[
 N=q^D\ge k^{ck},\qquad c=10^{-5}.
\]
Proposition~\ref{transfer:product} gives, simultaneously for every
integer $r\ge2$,
\[
 W_r(k)>N^{\lfloor\log_2r\rfloor}
 \ge k^{ck\lfloor\log_2r\rfloor}.
\]
The threshold on $k$ was fixed before $r$ was introduced, so it is
absolute and uniform in the number of colors.
\end{proof}
```

$k$ 的双重出现被拆成两个完全独立的生产环节。底数与指数里的那个 $ck$ 来自 $N=q^D$ 与 $\log q\ge\frac{ck}{D}\log k$：$D\log q\ge ck\log k$，即 $N\ge k^{ck}$，这里的 $k^{ck}$ 是"$k$ 个坐标、每个贡献 $k^c$"的产物（`setup:q-bounds` 的 $q\ge k^{ck/D}$ 加上 $N=q^D$）。指数的第二个 $k$ 位置上的 $\lfloor\log_2r\rfloor$ 来自乘积次数 $m$，与 $k$ 无关，是 $r$ 的属性。二者相乘靠的是 $(k^{ck})^m=k^{ckm}$ 这一条幂律。我的第一个猜想之所以有循环，是因为我想从"染色数的熵"里同时榨出这两个因子；论文的解法是把它们分家：一个由 $D$-维几何与概率给出，一个由进制分解给出，然后相乘。

$\lfloor\log_2r\rfloor$ 在 $r=2,3$ 的退化，是我读到 `07:53` 时停下来核对的：$\lfloor\log_22\rfloor=\lfloor\log_23\rfloor=1$，$\lfloor\log_24\rfloor=2$。所以二色与三色得到同一个下界 $k^{ck}$，而 `07:51` 那句 "$N^{\lfloor\log_2r\rfloor}$ for every integer $r\ge2$" 在 $r=2$ 时是 $m=1$ 的退化情形，也就是 `07:57-58` 说的 "restricts the cyclic coloring to an ordinary interval of length $N$"。$m=1$ 时 digit product 的论证里最大非零位只能是 $i=0$，$e=d$，退化成"区间 $[N]$ 上的染色直接继承循环群上无进程性"。二色情形的正解（abstract 明写 "including the two-color case"）全部由 §6 提供，乘积只是把它推广到 $r\ge3$；$r$ 在 $[2^m,2^{m+1})$ 中不动时整个下界不变，这个台阶函数形态在文献里之所以自然，是因为它正好是"可用二值 digit 数"，与 Behrend/乘积传统的色数预算一致。`transfer:limits` 里用的粗化是 $\lfloor\log_2r\rfloor\ge(\log r)/(2\log2)$（`07:191`）。

$r=1$ 的排除是必须的：`07:215-217` "The restrictions on the parameters are necessary: the exact values $W_1(k)=k$，$W_r(1)=1$，and $W_r(2)=r+1$ are established along with finiteness in Appendix"。$k=1$ 同理，下界 $k^{ck\cdot m}$ 在 $k=1$ 时是 $1$，而 $W_r(1)=1$，严格不等号直接失败。

### 10.3 Theorem（色数增长，$r\ge256$），`07:87-93`

(a) 逐字：`For every pair of integers $r\ge256$ and $k\ge3$，` \[ W_r(k)>\exp\!\left(\frac{(\log r)^2}{64\log2}\right). \]

(b) `07:95-168`。取 $b=\lfloor r^{1/4}\rfloor$、$s=\lfloor\log r/(4\log2)\rfloor$，都正且 $b\ge2$。digit 集分成两半 $H_0=\{0,\ldots,\lceil b/2\rceil-1\}$、$H_1=\{\lceil b/2\rceil,\ldots,b-1\}$，$h(u)$ 记录所在半。$0\le n<b^s$ 有唯一 digit 向量 $x$，染色为 `transfer:norm-color`：$(h(x_0),\ldots,h(x_{s-1}),\sum_i x_i^2)$。色数 $\le2^s(1+s(b-1)^2)\le2^s(1+sb^2)$；用 $s+1\le2^s$、$2^s\le r^{1/4}$、$b^2\le r^{1/2}$ 得 `transfer:color-count`：$\le r^{1/4}(s+1)r^{1/2}\le r$。无单色非平凡 3-AP：设等距三数 digit 向量 $x,y,z$ 同色，中点关系 `transfer:midpoint` $\sum(x_i-2y_i+z_i)b^i=0$；每半直径 $\le\lceil b/2\rceil-1$，故 $|x_i-2y_i+z_i|\le2(\lceil b/2\rceil-1)$，偶数时 $=b-2$、奇数时 $=b-1$，均严格 $<b$；模 $b$ 约化逼第 0 系数为 $0$，除以 $b$ 反复得所有系数为 $0$，故 $x+z=2y$ 于 $\R^s$；末项相等给 $\|x\|^2=\|y\|^2=\|z\|^2$，于是 $\|x-z\|^2=2\|x\|^2+2\|z\|^2-4\|y\|^2=0$，故 $x=y=z$，原三数相等。这就排除了所有正差、长度 $k\ge3$ 的进程（前三项已禁）。平移一位得 $W_r(k)>b^s$。最后 $L=\log r\ge8\log2$，用 $\lfloor u\rfloor\ge u/2$（$u\ge1$）得 $s\ge L/(8\log2)$、$\log b\ge L/4-\log2\ge L/8$，故 $\log(b^s)\ge L^2/(64\log2)$。

(c) $r\ge256$ 就是 $L\ge8\log2$，它是 $\log b\ge L/8$ 这一步成立的条件（$L/4-\log2\ge L/8\iff L\ge8\log2$）。$1/4$ 与 $1/(4\log2)$ 是一对：$b=r^{1/4}$ 使 $b^2=r^{1/2}$，与 $2^s\le r^{1/4}$ 相乘得 $r^{3/4}(s+1)$，要它 $\le r$ 需要 $s+1\le r^{1/4}$，正由 $s=\log_2r/4$ 保证。$64=8\times8$ 是两个 $1/8$ 的乘积。$k\ge3$ 是论证的输入（只用前三项）。

这条定理与 `main:intro` 是彼此独立的两个构造：`07:79-80` 说 "a separate construction gives a useful bound with a threshold independent of the length"，而 `01:87-88` 说它 "gives a direct elementary lower bound with an explicit constant uniform over all lengths $k\ge3$"。`01:89-97` 把它与伴随论文的染色上界 $\lceil\exp(A_k(2+\log r)^{A_k})\rceil$ 并置，得出定长一侧"超多项式但至多多项式对数"的夹逼，并声明 "no uniform bound on that dependence or matching logarithmic exponent is asserted"。

(d) [推测] 失败路线：把两半 $H_0,H_1$ 换成更多段。停在 `transfer:midpoint` 的系数估计：段数增加会让 $|x_i-2y_i+z_i|<b$ 需要段直径 $\le(b-1)/2$，$t$ 段时每段长 $b/t$，色数因子从 $2^s$ 变 $t^s$，$\log$ 增益 $\log t/\log2$ 倍但 $b^2$ 项不变，$2^s(1+sb^2)\le r$ 会被破。第二条：把 $\sum x_i^2$ 换成 $\sum x_i$。停在 $x+z=2y$ 时 $\sum x_i=\sum z_i$ 自动成立（线性），排除不了非平凡解。中点必须被二次型排除，这是 Behrend 的核心。

### 10.4 Corollary（两个一致极限），`07:172-187`

(a) 逐字：

```tex
\lim_{k\to\infty}
 \inf_{\substack{r\in\Z\\r\ge2}}
 \frac{\log W_r(k)}{k\log r}=\infty,
 \qquad
 \lim_{r\to\infty}
 \inf_{\substack{k\in\Z\\k\ge3}}
 \frac{\log W_r(k)}{\log r}=\infty.
```

(b) `07:189-213`。第一式：$\lfloor\log_2r\rfloor\ge(\log r)/(2\log2)$ 与 `main:intro` 给，$k\ge K_0$ 时 $\inf\ge\frac{c}{2\log2}\log k$。第二式：`transfer:large-r` 给，$r\ge256$ 时 $\inf\ge\frac{\log r}{64\log2}$。两侧右端都发散。定 $r\ge2$：$W_r(k)^{1/k}>k^{c\lfloor\log_2r\rfloor}\to\infty$。定 $A>0$：$\log(W_r(k)/r^A)>\frac{(\log r)^2}{64\log2}-A\log r\to\infty$，对整数 $k\ge3$ 一致。

(c) 系数 $2\log2$ 是台阶函数与连续 $\log$ 之间的粗化损失，论文只要发散，不追常数。两个 inf 的分开区间（$r\ge2$ 与 $k\ge3$）正是 §10.2 末提到的退化边界的另一面。

(d) [推测] 失败路线：想把第一式的 $\inf$ 推到 $r=1$。停在 $W_1(k)=k$，$\log W_1(k)/(k\log1)$ 无定义。$k$ 的下限取 $3$ 是为了第二式里 `transfer:large-r` 的假设。

## 11 §8 附录：一个初等递推上界

`upper:finite`（`08:9-27`）逐字：

```tex
\begin{theorem}
\label{upper:finite}
Define $F(r,1)=1$ and $F(r,2)=r+1$ for every integer $r\ge1$.
For $k\ge3$，with $r$ and $k$ fixed，define
\begin{equation}
 m_0=1,\qquad
 m_{t+1}=2m_tF(r^{m_t},k-1)\quad(0\le t<r),\qquad
 F(r,k)=m_r.
 \label{upper:recursion}
\end{equation}
Then, for all positive integers $r,k$,
\[
 W_r(k)\le F(r,k)<\infty.
\]
The boundary parameter values are exactly
\[
 W_r(1)=1,\qquad W_r(2)=r+1,\qquad W_1(k)=k.
\]
\end{theorem}
```

`08:30-33` 处理良基性：先造完长度 $k-1$ 的一切色数，再造长度 $k$；`08:35-40` 三个边界值各一行论证（单项进程是单点；$[r+1]$ 的 $r$ 染色有两同色位，$[r]$ 的单射染色给出反向；一色时 $[k]$ 有、$[k-1]$ 无）。`08:50-61` 定义 focus：点 $f$ 与正整数 $d_1,\ldots,d_t$，使 $f-sd_i$（$1\le s\le k-1$、$1\le i\le t$）都在区间内，第 $i$ 臂的 $k-1$ 点同色 $a_i$，$a_1,\ldots,a_t$ 两两不同；无单色 $k$-AP 的染色里 focus 自身色必须避开所有 $a_i$。内层归纳断言：长度 $m_t$ 的无进程 $r$-染色必有 $t$ 色 focus。$t=0$ 取单点。设 $m=m_t$、$B=F(r^m,k-1)$、$m_{t+1}=2mB$；把 $[2mB]$ 分成 $2B$ 个长 $m$ 的块，块 $j$ 关联词 $w_j$（块内染色，共至多 $r^m$ 种）。对前 $B$ 个块指标用外层归纳（长度 $k-1$、色数 $r^m$）得 `upper:matching-blocks`：$w_b=w_{b+\Delta}=\cdots=w_{b+(k-2)\Delta}$，$b+(k-2)\Delta\le B$；$k-2\ge1$ 故 $\Delta\le B-1$，于是 `upper:next-block` 的新块指标 $q=b+(k-1)\Delta\le B+\Delta\le2B-1<2B$ 仍在分配的块内，其词不必与前面相同。把共同词视作 $[m]$ 的染色（它内部无单色 $k$-AP，否则块 $b$ 内已有），用内层归纳取其 focus $f$、差 $d_i$、臂色 $a_i$、自身色 $a_0$（与所有 $a_i$ 不同）。新 focus $f'=(q-1)m+f$。对每个 $i$ 与 $s$：$f'-s(m\Delta+d_i)=(b+(k-1-s)\Delta-1)m+(f-sd_i)$，右侧块是匹配块之一、块内位置在 $[m]$，故色为 $a_i$。多一臂 $f'-sm\Delta=(b+(k-1-s)\Delta-1)m+f$，色 $a_0$。$t+1$ 个臂差都正、臂点都在区间、色两两不同，配合 `upper:next-block` 给出 $t+1$ 色 focus。$t=r$ 时臂用掉 $r$ 种不同色，focus 自身无处可去，矛盾，故 $[m_r]$ 的一切 $r$-染色含单色 $k$-AP。

我读这段时最初以为它是全文的一个量化环节（$W_r(k)$ 的上界会影响下界陈述的意义），但 `01:105-110` 把它的位置说清了：它是 "a coarse version of the classical argument"，量级上比 Shelah 的本原递推与 Gowers 的界都弱，功能上只负责"定义里的 least 存在"。它与我的下界之间唯一的实质接口是：`main:intro` 的 $W_r(k)$ 是一个真自然数，`08:19-22` 提供了这件事的证明。`01:107-110` 的措辞 "including a proof of finiteness" 就是这个用途。

[推测] 失败路线：用 Gowers 的 tower 型界替代这个递推。停在"引理越多、越容易在 Lean 里出现无源依赖"；论文 `08:5-7` 强调 "involves only previously defined integers"，这条纪律使附录可以自足。另一路线：不设 $m_{t+1}=2mB$ 的因子 2。停在 $q\le2B-1$ 需要第 $2B$ 个块作为余量，去掉 2 就没有 $q$。

## 12 常数与参数台账

五列都在，位置一律指 tex 分片的实际行号（我逐条 grep 或按 offset 读到过）。

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $c$ | $10^{-5}$ | 02:15 | `perturb:cyclic` 的 $N\ge k^{ck}$；`main:intro` | `perturb:negative-coefficient`(06:238-241) 的 $2c-\gamma/80$ 由负转正，$R_k$ 不收敛 |
| $\delta$ | $1/10$ | 02:15 | `outer:coloring`(i) 前提、`dichotomy:main` 入口(05:189) | $\delta k/4\ge\gamma k$ 失效(05:191-192)，二分支互斥性丢 |
| $\gamma$ | $1/100$ | 02:15 | `dichotomy:main`(i)；富色侧 $\gamma k/4$ 个 key(06:212-213) | $\gamma/80$ 变小，$c$ 的合法上限同时变小(06:238) |
| $D$ | $\lceil k^{1/10}\rceil$ | 02:16 | $N=q^D$、$(CDh)^{6D}$、`mesh:truncated` 的 $16004D$ | $\log T_{\mathrm{aff}}$ 的 $6\log q=O(k^{1-1/10}\log k)$ 与 $pk=k^{19/20}$ 失去间隙(06:176-182) |
| $M$ | $\lceil k^{1/2}\rceil$ | 02:16 | 轻重阈值 $k/M$、$h\le2M$、$o(M)$ | `count:global` 的 $o(M)$ 与 `dichotomy:regular-fraction` 同时失效 |
| $h_0$ | $D^2$ | 02:17 | `setup:dilation` 全部结论、`outer:second-weight` 下限(04:137) | $\sup_{h>D^2}6D\log(CDh)/h$ 变大，权重和不再 $o(1)$(04:142-145) |
| $p$ | $k^{-1/20}$ | 02:17 | `perturb:final-coloring`、$p^{\gamma k/4}$、$(1-p)^{k/4}$ | $pk$ 跌破 $k^{0.9}\log k$，`perturb:affine-bound` 发散(06:266-268) |
| $H$ | $k^{-2}$ | 02:17 | `dichotomy:affinity` 的 $2kH<1$、`mesh:width` 上界 | 小盒仿射引理前提失效，`dichotomy:drift` 无 $u,v$(05:16-17) |
| $\eta$ | $1/(1000D)$ | 02:18 | $V_\eta$ 截断、`dichotomy:regular-fraction` | $D(4\eta+1/h_0)<1/2$ 破，eligibility (i) 的 $h/2$ 得不到了(05:261-265) |
| $\lambda$ | $\prod_{\ell\le h_0}\ell^{\lfloor\log(2M)/\log\ell\rfloor}$，$\log\lambda=O(k^{1/5}\log k)$ | 02:24-27, 02:99 | `setup:dilation`、$F=k^2\lambda+\cdots$(03:77)、$\lambda$ 是 $q^D$ 单位(06:47) | $\gcd(\lambda,q)=1$ 破(02:90-91)，`perturb:separation` 无下界 |
| $s$ | $h/\gcd(h,\lambda t)$，$=1$ 或 $>h_0$ | 02:39, 03:92 | stationary/rotating 分类(03:94-96)、$1/s_i$ 求和(05:259) | 长短周期分岔不成立，`dichotomy:main` 两支都失据 |
| $P$ | 素数，$k<P\le2k^2$ | 02:55-56 | $q$ 是 $P$ 的幂(02:84-85) | 中心二项式论证的 $\le(2n)^k$ 与 $\ge4^n/(2n+1)$ 交叉点变，$P$ 可能 $\le h_0$ |
| $q$ | $k^{ck/D}\le q\le2k^2k^{ck/D}$ | 02:87 | `setup:orders` 的 $\log q=O(k^{9/10}\log k)$、$T_{\mathrm{aff}}$ 的 $6\log q$ | $N\ge k^{ck}$ 或 $\log q\ll pk$ 二者之一断 |
| $H_x$ | $H/\lambda$ | 02:94 | $U$-分割精确性 $H_x^{-1}=k^2\lambda$(02:136-138)、$\lvert u_i\rvert \le H_x$ | $U$ 不再是 $[0,1)$ 的分割，标签未定义(02:138)  |
| $\alpha$ | $q^{-(D+1)}$ | 02:94 | $R=\log(1+1/(2\alpha))$、`dichotomy:step-lattice` $\lvert w_i\rvert \ge\alpha$(05:208-211) | $V$ 无限或短周期分支的反证失效  |
| $R,m$ | $R=O(k\log k)$，$2m=O(k^3\log k)$ | 02:144-146, 02:181 | `count:global` 的 $F=\lvert U\rvert +\lvert V\rvert $ | $\log F$ 变大，$T_{\mathrm{glob}}$ 失去 $o(M)$  |
| $49$ | $N(I)$ 内网格端点数上限 | 02:211, 03:176 | `count:local` 的 stationary 分支 | 端点数进入 $(Dh)^2$ 的 $s$，界膨胀但主要是"每端点至多一个提升"失效 |
| $16004D$ | `mesh:truncated` 断点数 | 02:246, 03:184 | `count:local` 的 rotating 分支、$C_0(Dh)^2$ | 线数失去与 $h$ 的一次关系，$(CDh)^{6D}$ 不成 |
| $C$ | 绝对常数，独立于 $q,\lambda,\beta,D$ | 03:136, 03:143 | `outer:second-weight`(04:136) | 若依赖 $D$，$6\log(CD^3)/D$ 不再 $o(1)$(04:144) |
| $(CDh)^{6D}$ | 每标签的 eligible pattern 数 | 03:141 | `outer:coloring` 第二族权重(04:136) | 指数 $6D$ 抬到 $cD^2$ 时 §7.2 的 $o(1)$ 崩 |
| $T_{\mathrm{glob}}$ | $\log=O(k^{3/10}\log k)=o(M)$ | 03:54-56 | `outer:first-weight`(04:131)、`perturb:signatures`(06:171) | 两族权重同时失控 |
| $w_{\max}$ | $\le k/M$ | 04:86, 04:96 | 行数、每行 $\ge\delta M-1$ | 行内出现重复标签，独立性失效，`outer:tail` 不成立 |
| $z_E$ | $e^{-l(E)/32}$ | 04:128 | `outer:criterion`(04:169-173) | 系数与尾部 $1/8$ 的间隙被邻居项吃掉 |
| $1/500$ | 逐标签入射权重和的上界 | 04:153 | $\sum_{\Gamma(E)}z_F\le l/500$(04:162) | `outer:criterion` 末项 $1/8-1/32-2/500$ 可能 $<(\log2)/100$ |
| $l(E)\ge100$ | 两族共同的下界 | 04:165 | $z_E<1/2$ 与 $\log(1-z)\ge-2z$ | 邻居乘积无法换成指数和 |
| $\gamma k/4$ | 富色进程指定的互异 key 数 | 06:212-214 | $p^{\gamma k/4}$(06:217) | 分母 $4$ 来自 `perturb:multiplicity`，重数上界一改此数就改 |
| $q^{2D}$ | $(n_0,d)$ 的选择数 | 06:225 | `perturb:rich-bound` 的 $2c$ 项 | $2D\log q$ 与 $ck\log k$ 的比例改变 |
| $-21/200000$ | $2c-\gamma/80$ 的显式值 | 06:238-240 | $R_k=o(1)$ | 整个 §6 的存在性论证 |
| $B_*$ | $\lfloor Dq^2/4\rfloor+1$ | 06:153 | 超平面数 $k(B_*+1)\le k(Dq^2+2)$ | $T_{\mathrm{aff}}$ 的三次方底数变大 |
| $T_{\mathrm{aff}}$ | $\log=O(k^{9/10}\log k)=o(pk)$ | 06:131-133 | `perturb:affine-bound`(06:266-268) | $A_k$ 不收敛 |
| $m$ | $\lfloor\log_2r\rfloor$，$r=2,3$ 时 $=1$ | 07:21, 07:53 | `transfer:product` 的 $N^m$ | $\log_2$ 换成别的底就与 $2^m\le r$ 的嵌入矛盾 |
| $N^m$ | $>W_{2^m}(k)$ 的下界 | 07:19-20 | `main:intro` 的合成(07:69-71) | $k$ 在指数上的第二个因子消失 |
| $b,s$ | $\lfloor r^{1/4}\rfloor$，$\lfloor\log r/(4\log2)\rfloor$ | 07:98-99 | `transfer:color-count`(07:119-122) | $2^s(1+sb^2)\le r$ 的预算被超 |
| $64\log2$ | $(\log r)^2$ 的分母 | 07:91 | `transfer:limits` 第二式(07:199-202) | $L\ge8\log2$（即 $r\ge256$）的推导链断(07:160-166) |
| $r\ge256$ | `transfer:large-r` 前提 | 07:89 | 色数一侧的一切极限(07:198) | $\log b\ge L/8$ 不成立 |
| $1/(2\log2)$ | $\lfloor\log_2r\rfloor\ge(\log r)/(2\log2)$ | 07:191 | `transfer:limits` 第一式 | 只剩台阶形式的下界，连续比失去 |
| $K_0$ | 绝对整数，先于 $r$ 固定 | 01:20, 07:73-74 | 主定理的量化 | 一致性声明 "uniform over all color counts" 失效 |
| $F(r,k)$ | $m_r$，$m_{t+1}=2m_tF(r^{m_t},k-1)$ | 08:14-17 | $W_r(k)\le F(r,k)<\infty$(08:20-21) | 定义里 "least" 的存在性无根据 |

依赖链（按消费顺序）：`setup:parameters` 的 $D,M,h_0,H,\eta,p$ 六个数决定 $\lambda$ 与 $P,q$，从而决定两套网格的端点数量 $F$；$F$ 进入 `count:global` 得 $T_{\mathrm{glob}}=e^{o(M)}$，$h_0$ 进入 `count:local` 得 $(CDh)^{6D}$；这两个计数是 `outer:coloring` 两族事件权重的全部输入，输出的 $c_*$ 只依赖 $k$；$c_*$ 与 `dichotomy:main` 的两分支一起进入 §6；§6 的两个 union bound 分别消费 $q^{2D}$（由 $\log q$ 决定）与 $T_{\mathrm{aff}}$（由 $T_{\mathrm{glob}}$ 与 $q^2$ 决定），并在 `perturb:negative-coefficient` 处与 $\gamma$、$c$、$p$ 三方对账；`perturb:cyclic` 输出 $N\ge k^{ck}$ 交给 `transfer:product` 的 $m=\lfloor\log_2r\rfloor$，得到 `main:intro`；`transfer:large-r` 与 `main:intro` 并列喂 `transfer:limits` 的两个 inf；`upper:finite` 独立于全链，只负责把 $W_r(k)$ 钉成一个自然数。任何一环上的 $k$-依赖泄漏到 $r$ 上都会破坏 `02:9-10` 的那条纪律。

## 13 Lean 取证

以下数字全部实跑测出。目录 `E:\math\lean\OAI\Combinatorics\ProgressionColoring\`。

规模：`.lean` 文件 115 个，总行数 14837，总字节 658143。顶层声明 897 个，分解为 `theorem` 734、`def` 137、`abbrev` 13、`structure` 13，`lemma`、`inductive`、`example`、`instance`、`class`、`notation`、`macro` 各 0。`namespace` 248、`section` 2、顶层 `open` 74、`variable` 44、`import` 399、`private` 28、`noncomputable` 94。doc 注释起始 `/--` 434 处。

公理与完整性：`sorry` 出现 0 次（逐文件 `grep -c` 全为 0，全目录 `grep -o` 计数 0）。目录内 `axiom`、`constant` 声明 0 处，唯一含 "constant" 的行是 `AffineEntropy.lean:47` 的散文。`Classical` 相关使用存在，例如 `AdaptiveMesh.lean:397,400` 的 `Classical.choose` 与 `Classical.choose_spec`。`ComparatorChallenges/QuantitativeVanDerWaerden.json` 的 `permitted_axioms` 为 `propext`、`Quot.sound`、`Classical.choice`，`enable_nanoda` 为 `false`，`theorem_names` 只列 `OAI.QuantitativeVanDerWaerden.uniform_lower_bound`，`definition_names` 为空数组。

tactic 频次（行首计）：`have` 1461、`exact` 528、`rw` 336、`simp` 298、`apply` 287、`intro` 283、`obtain` 221、`refine` 153、`calc` 139、`let` 128、`linarith` 111、`nlinarith` 78、`constructor` 63、`ring` 62、`by_contra` 37、`field_simp` 32、`omega` 27、`norm_num` 27、`congr` 27、`push_cast` 26、`funext` 22、`cases` 22、`filter_upwards` 21、`ext` 17、`left` 12、`induction` 12、`subst` 10、`right` 8、`positivity` 7、`conv` 6、`generalize` 3、`use` 2、`symm` 2、`revert` 2、`simp_all` 1、`show` 1、`norm_cast` 1、`gcongr` 1、`exists` 1。`have` 与 `calc` 的高占比与该论文以显式不等式链为主的风格一致；`nlinarith` 78 次说明大量非线性余项靠自动化。

入口与主链：`Main.lean` 49 行，5 条定理，行号 12（`uniform_lower_bound`）、18（`uniform_lower_bound_floor`）、29（`exists_uniform_lower_bound`）、35（`kthRoot_tendsto`）、41（`length_rate_tendsto`）。`Model.lean:9` `MonoAP`、`:12` `HasMonoAP`、`:15` `IsRamsey`、`:20` `noncomputable def W`。`CyclicBasic.lean:13` `CyclicAvoids`。`Parameters.lean:14` `def c := 1/100000`、`:21` `c_pos`、`:24` `rich_coefficient`（内容正是 `2*c-(1/100)/80 = -(21/200000)`，与 `perturb:negative-coefficient` 对得上）。`CyclicWitness.lean:106` `exists_cyclic_coloring`。`UniformTransfer.lean:12` `def CyclicLowerBound`、`:18` `uniform_lower_of_cyclicLowerBound`、`:36` `kthRoot_tendsto_of_cyclicLowerBound`、`:44` `length_rate_tendsto_of_cyclicLowerBound`。`DigitProductBounds.lean:11` `cyclic_binary_product_lower`、`:15` `cyclic_binary_color_lower`。`Growth.lean:16` `natLog_two_eq_floor_log`。`UpperBound.lean:18` `Fcore`、`:24` `F`、`:28` `F_recursion`、`:49` `F_pos`、`:282` `W_le_F`、`:286` `W_spec`、`:289` `W_two`。`LargeColorGrowth.lean:126` `exp_bound`。`LargeColorConsequences.lean:22` `color_rate_tendsto`、`:33` 附近 `fixed_length_polynomial_ratio_tendsto`（`:31` 是 256 的 `filter_upwards`）。

论文陈述与 Lean 陈述的错口，我按严重度排：

其一，`W` 的定义方式。`Model.lean:20-21` 用 `sInf {N | 0 < N ∧ IsRamsey (Fin r) k N}`，而 `Model.lean:18-19` 的 doc 自己承认 "Statements about its Ramsey property require a finiteness proof; no such proof is built into this definition."。论文的 `01:4-5` 直接把 $W_r(k)$ 写成 "the least positive integer $N$ such that…"，把存在性藏在自然数良序里，再在附录以 `upper:finite` 兑现。Lean 里 `sInf` 在空集上取 $0$，所以每条用到 $W$ 的下界的定理都必须显式携带有限性证据：`DigitProductBounds.lean:16,22` 调用 `finite_ramsey`，`UpperBound.lean:282` 给 `W_le_F`。两侧的逻辑内容并不冲突，差别出现在同一条陈述的"起点"选取上，我把它记为最重要的错口。

其二，染色对象的类型。`IsRamsey`（`Model.lean:15-16`）量化在 `c : ℕ → Fin r`，即全体自然数的染色；论文 `01:5` 量化在 `map [N]→[r]`。二者可通过把 $[N]$ 外补同色互转，但 Lean 侧的 $\forall c$ 覆盖面更广，需要方向性论证才能回到论文陈述。[推测] 这一步在 Lean 里被 `HasMonoAP` 的 `a+(k-1)*d < N` 与 `0 < d` 吸收掉了。

其三，$\lfloor\log_2r\rfloor$ 的形态。被 comparator 认证的 `uniform_lower_bound`（`Main.lean:12`）用的是 `Nat.log 2 r`；把台阶写成实数 floor 的 `uniform_lower_bound_floor`（`Main.lean:18`）靠 `Growth.lean:16` 的 `natLog_two_eq_floor_log`（`Nat.log 2 r = ⌊Real.log r / Real.log 2⌋₊`）从前者导出，但它不在 JSON 的 `theorem_names` 里。论文 abstract 与 `main:intro` 都写 $\lfloor\log_2r\rfloor$，所以严格对齐论文原形的Lean 陈述是未被 comparator 登记的那一条。

其四，"存在绝对常数 $c>0$" 与 "$c=10^{-5}$"。论文的 `main:intro` 直接把 $c$ 钉成 $10^{-5}$；Lean 的 `Main.lean:29` `exists_uniform_lower_bound` 才给出 abstract 那句"存在 $c>0$ 与 $K_0$"的存在式形态（见证 $1/100000$，用 `by norm_num` 验正）。两种写法等价，但 comparator 只认 `Main.lean:12`。

其五，阈值 $K$ 的构造。`UniformTransfer.lean:22` 用 `max K 2`，因为 `cyclic_binary_color_lower` 要求 `2 ≤ k`；论文 `02:21` 用一句 "We take $k$ large enough that $h_0<2M<k$" 承担同样的职责，写法上是假设，并非显式 `max`。

其六，边界值覆盖不全。论文在 `08:23-26` 与 `01:111` 断言三条精确边界值。我在 `UpperBound.lean` 内只找到 `W_two`（`:289`，`W r 2 = r + 1`）；对 `W r 1` 与 `W 1 k` 的 grep 在该文件零命中。[推测] 它们要么在别处、要么未形式化，我没有做全库检索（按纪律被禁止宽 grep），在此如实标注。

其七，`CyclicLowerBound` 的地位。`UniformTransfer.lean:10-12` 的 doc 写 "One threshold supplies actual avoiding cyclic colorings independently of the eventual number of colors. This is a proposition, not an axiom."，我专门核对了 `Main.lean:15` 的 `exact uniform_lower_of_cyclicLowerBound exists_cyclic_coloring`：主定理是从 `CyclicWitness.lean:106` 的真实构造推出的，不是假设。这一点很重要，因为它排除了"整条下界靠一个 postulate 撑起"的可能。

其八，$r\ge2$ 的下界写法。Lean 处处用 `hr : 2 ≤ r`（如 `Main.lean:35`、`DigitProductBounds.lean:15`），与论文 `01:21`、`07:21` 一致；`Nat.log 2 2 = 1`、`Nat.log 2 3 = 1`，所以 $r=2,3$ 退化在 Lean 里也照样发生，二色情形的强度完全来自 `exists_cyclic_coloring`。

## 14 我上网检索到的背景（与论文内容分开记）

以下不是论文的陈述，是我自己的检索印象，多数条目在检索里只拿到标题级信息，凡我不能确认细节的都标 [推测]。

经典上界一侧，我熟悉的坐标是：van der Waerden 1927 的原证给 tower 型界；Shelah 1988 把界降为本原递推；Gowers 2001 用定量 Szemeredi 定理给出 $r_k(N)$ 的塔型倒数界，从而把 $W_r(k)$ 的上界写成 tower 在 $r$ 与 $k$ 上的函数（我检索到的条目 `A quantitative ergodic theory proof of Szemeredi's theorem` 与 `A new proof of the density Hales-Jewett theorem` 属于这条线的相邻文献）。[推测] 论文 `01:107-110` 只把 Shelah 与 Gowers 作为量级参照点名，附录 `upper:finite` 明确是"coarse"版本，比这两者都弱，这与我看到的处理一致。

下界工程一侧，我检索到 `Lower Bounds on the van der Waerden Numbers: Randomized- and Deterministic-Constructive` 与 `Improved lower bounds for van der Waerden numbers`（arXiv:2111.01099）这类条目，以及 `ON COMPUTATION OF EXACT VAN DER WAERDEN NUMBERS`。[推测] 任务提示我关注的 Berarducci-Mantaci 那条下界工程与实验数据线，我的检索没有直接命中该名字的页面，只命中一般性下界与计算文献，因此我不把任何具体实验数值安到他们名下。

超指数突破一侧，论文自己的 bib（属于论文口径，我照录题目）包含 `Three-color van der Waerden numbers grow super-exponentially`（Fox-Hunter 2026）、`A new lower bound for two-color van der Waerden numbers`（Campos-Fox-Schildkraut 2026）、`Lower bounds for multicolor van der Waerden numbers`（Hunter 2025）、`An improved upper bound for colorings without symmetrically colored k-term arithmetic progressions`（Shi-Dong 2026）。任务提示里的 Shniguang-Pech-Yudovina 路线与 Cohen 的随机扰动构造在 bib 中零命中：我逐条核对了 27 个条目，无此三名。[推测] 论文对"随机扰动"的用法（§6 的 key-indexed Bernoulli flip）与 Green 2022、Hunter 2022 的"随机扰动椭球环带"是同一传统的不同实例，`01:171-174` 自己就作了这个定位。

关于 $\lfloor\log_2r\rfloor$ 为何自然，我的检索印象与 `07:6-9` 给的线索一致：digit 乘积是 Erdos-Turan 1936 的旧技法、Fox-Hunter 的 Section 2 重述了它，而 $2^m\le r$ 的台阶是"用 $m$ 个二进制位表达 $r$ 色"的直接代价，因此 $\lfloor\log_2r\rfloor$ 是这个乘积的可用位数，任何多色下界在通过二色乘积获得时都会自然带上它。[推测] 论文对此没有额外解释，`01:166` 只用一句 "A deterministic digit product then gives all $r\ge2$" 交代。

我也检索到 OpenAI 自己的年度数学进展汇总页与 Polymath wiki 的旧条目，前者是宣传口径、后者年代过早，二者都不构成可引用的技术细节，我没有据此写任何结论。

## 15 关键转折，以及最终思路与我最初设想的差异

我的关键转折发生在读完 `06:10-11` 的那一刻。在那之前我把 §5 与 §6 的关系理解成"§5 给定性、§6 给随机"，也就是外色处理结构性、扰动处理随机性。那句话把我的理解翻了过来：扰动的功能是收缩随机性的载体，把随机性从"每个点"收到"每个几何 key"上，从而让"同一事件的重复实现只需计一次"成为可能。这句话之后我才看清 §3 的两个计数在为何服务：`count:global` 让富色一侧的 key 集合可数、`count:local` 让仿射一侧的签名可数，两者都是为了让同一个 $p=k^{-1/20}$ 在两个方向上都够用。

与最初设想的四条具体差异。

差异一，熵的来源。我原以为 $k$ 进指数要靠 $D$ 维几何的直接熵；实际是 $D$ 维仿射直线上的平方范数坍缩成三个系数 $\theta_0,\theta_1,\theta_2$，`count:arrangement` 的维度被固定在 3（`06:159-160`、`06:183-184`）。$k$ 在指数上的位置由 $m=\lfloor\log_2r\rfloor$ 提供，与几何无关；$k$ 在底数上的位置由 $N=q^D$ 与 $\log q\ge(ck/D)\log k$ 提供。两个 $k$ 由一条幂律相乘，谁也不生产谁。

差异二，$r$ 的角色。我原以为多色是构造的一部分，需要为每个 $r$ 重做参数；实际 $r$ 在 §2 到 §6 中一次都不出现（`02:9-10` 是这条纪律的明文），它只在 `transfer:product` 里作为 digit 数出现。Lean 侧同样如此：`Main.lean:12` 的量化 `∀ r ≥ 2` 出现在结论里，而 `CyclicWitness.lean:106` 的 `exists_cyclic_coloring` 完全没有 $r$。

差异三，扰动的载体。我原打算在标签上 flip（§9.3(d) 路线一），失败原因是标签重数无绝对界；论文把它换成"盒子 + 整数范数带"，靠 Behrend 型截线拿到 4。这个 4 同时进入两处（$\gamma k/4$ 与 $s\ge k/4$），是全篇唯一的重数控制点。

差异四，我对 dichotomy 的预期。我最初以为分岔在"进程是否有理周期"，读完 `05:179-184` 才知道分岔在"每个外色是否够多"与"居中代表是否在 $\R^D$ 中整体仿射"之间，有理周期 $h$ 只是通往后一支的中间量，而且 $h$ 自己还要在 `dichotomy:main` 的证明里二次分岔为 $h\le h_0$ 与 $h_0<h\le2M$（`05:196`、`05:236`）。我原本把这两个层次混成了一个。

我自己认为最薄的三处，说明理由。

第一薄是 §6.4(d) 的第二条候选失败路线。我在那里说"保留所有位置的约束会破坏 `dichotomy:main` 的跨切割节省"，但我的论证只到"绝对界给不出相对宽度"为止，没有把 $(Dh^2)^2$ 之后的权重和被真正算到底；论文 `04:142-145` 的 $o(1)$ 有 $6\to8$ 的余量，我的机制性停住点因此是软的，真正的硬处我没能定位。

第二薄是 §5.2(d) 关于 $P\le2k$ 与 $P\le2k^2$ 的取舍。我把这条写成 [推测] 并且坦白"没能从 tex 得到解释"。中心二项式论证给 $2k^2$ 几乎是免费的，论文选 $n=k^2$ ，并非 $n=k$ 的真实动机我没有证据，只能说 $2k^2$ 在 `setup:q-bounds` 里以 $\log(2k^2)$ 的形式进入加性余项，而这个余项对结论不敏感。

第三薄是 §13 的其六（边界值）。`W r 1` 与 `W 1 k` 在 `UpperBound.lean` 零命中是我实测的，但"因此它们未形式化"这一步我没有权利下结论，它们可能在 `Basic.lean` 或 `ComparisonOutputs.lean` 里；我没有扩大检索范围（纪律限定 grep 只在该 yaml 与定位到的目录上做），所以这条只是待查项，不是结论。

还有一处我在写作中始终没能彻底解决的怀疑，留在这里：`04:164-165` 的 $l(E)\ge100$ 与 `04:175-176` 的"乘 100 超过 $\log2$"是一对互相强化的松弛选择，$1/32$、$1/8$、$2/500$ 三个数的间隙（$0.08975$ 对 $0.00693$）大得不自然。[推测] 这是论文在"绝对阈值"与"常数可读性"之间的刻意松弛，并非必要约束；若要收紧，$c$ 的上界由 $\gamma/160$ 决定，与这三个数的松弛无关，所以这份大余量本身不改变 $c$。我没能找到它非取这些值不可的机械理由。

Sources:
- [Lower Bounds on the van der Waerden Numbers: Randomized- and Deterministic-Constructive](https://arxiv.org/abs/1005.3749)
- [Improved lower bounds for van der Waerden numbers](https://arxiv.org/abs/2111.01099)
- [A quantitative ergodic theory proof of Szemeredi's theorem](https://m.zhangqiaokeyan.com/journal-foreign-detail/0704076829348.html)
- [A new proof of the density Hales-Jewett theorem](https://m.zhangqiaokeyan.com/journal-foreign-detail/0704068864613.html)
- [A Subexponential Upper Bound for van der Waerden Numbers W(3,k)](https://m.zhangqiaokeyan.com/journal-foreign-detail/0704078436740.html)
- [ON COMPUTATION OF EXACT VAN DER WAERDEN NUMBERS](https://m.zhangqiaokeyan.com/academic-journal-foreign_detail_thesis/0204121773783.html)
- [Advancing Mathematics Research with AI-Driven Formal Reasoning](https://arxiv.org/html/2605.22763v1)
- [数学与理论计算机科学的十项进展 | OpenAI](https://openai.com/zh-Hans-CN/index/ten-advances-in-mathematics/)
- [Polymath Wiki](http://michaelnielsen.org/polymath/index.php?direction=prev&oldid=719&title=Main_Page)
