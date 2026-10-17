# D54 Brennan 猜想的反推：我把一个逐点积分问题改装成正算子的谱矛盾

对象论文：`Brennan's conjecture and sharp inverse-square integral means`（2026-09-24，OpenAI）。
TeX 源码：`E:\math\preprints\Brennans-conjecture-and-sharp-inverse-square-integral-means-September-24-2026\build\`，分片为 `main.tex`（62 行）+ `sections/00-introduction.tex`（175 行）+ `sections/00-history.tex`（108 行）+ `sections/01-preliminaries.tex`（331 行）+ `sections/02-weighted-law.tex`（284 行）+ `sections/03-escape.tex`（324 行）+ `sections/04-critical-pairing.tex`（483 行）+ `sections/05-transport.tex`（193 行）+ `sections/06-integrability.tex`（337 行），另有 `figures/rank-pairing.tex` 与 `references/references.bib`。正文 tex 合计 2297 行、93850 字节（不含 bib 与 figure）。引文行号形如 `04:191` 表示 `sections/04-critical-pairing.tex` 第 191 行。
Lean：`E:\math\lean\OAI\Analysis\IntegralMeans\`（47 个 `.lean` 文件、14188 行），入口 `OAI/Analysis/IntegralMeans/Main.lean` 与 `OAI/Analysis/IntegralMeans/SharpEndpoints.lean`，comparator 配置 `E:\math\lean\ComparatorChallenges\Brennan.json` 与 `BrennanSharp.json`，中心仓库登记在 `E:\math\lean\formalization.yaml` 第 307 至 309 行与第 986 至 991 行。第 20 节给全部实测数。
编号条目一共 24 条（定理 1、推论 3、引理 15、命题 4、定义 1），另有 5 处未编号的关键论证：`05:20-42` 的分支面积公式、`06:12-45` 与 `06:221-245` 的两段主定理证明、`06:247-257` 的圆盘与区域表述等价、`06:286-311` 的逐点端点谱等价。全篇没有 remark 环境实例。

记号与论文一致：$\mathbb D$ 单位圆盘，$\mathbb H$ 上半平面，$\mathcal S$ 规范单叶类，$\mathcal K$ 半平面紧类，$Q_F=1/F'$，$m(z)=(z-i)/(z+i)$。$t$ 一律指圆盘侧指数 $2-s$。

## 0 我进场时手里有什么

手里只有一个积分。Brennan 猜想问：若单连通平面区域 $W$ 共形双射到圆盘，$\varphi:W\to\mathbb D$，则

```tex
 \int_W|\varphi'(z)|^s\dd A(z)<\infty
 \qquad\left(\frac43<s<4\right).
```

（`00-introduction:9-12`）。论文的定理陈述在 `00-introduction:52-73`，逐字如下：

```tex
\begin{theorem}[Brennan's conjecture and inverse-square means]
\label{thm:main}
For every $\varepsilon>0$ there is $C_\varepsilon<\infty$ such that
\begin{equation}\label{eq:main-uniform}
 M_{-2}[f'](r)\le C_\varepsilon(1-r)^{-1-\varepsilon}
 \qquad\left(f\in\SSS,\ \frac12\le r<1\right).
\end{equation}
Moreover, $B_{\SSS}(-2)=1$.

Let $W\subset\CC$ be any simply connected domain whose boundary in
the Riemann sphere contains at least two points. Every conformal
bijection $\varphi:W\to\DD$ satisfies
...
\end{theorem}
```

我把量化顺序拆开对齐过，因为 Lean 那边要按它核对（第 20 节）：第一个 conjunct 是 $\forall\varepsilon>0\ \exists C_\varepsilon\ \forall f\in\mathcal S\ \forall r\in[1/2,1)$ 的均匀界，$C_\varepsilon$ 只依赖 $\varepsilon$，这个"只依赖"是全文最难守的一条，后面 Proposition 2.4 的证明结尾专门回收它（`01:325-326`）。第二个 conjunct 是谱等式 $B_{\mathcal S}(-2)=1$，注意 $B_{\mathcal S}(t)=\sup_f\beta_f(t)$ 的量词次序是"先逐 map 取 limsup，再对 $f$ 取 sup"（`00-introduction:41-48`），写成 $\sup$ 在 $\limsup$ 外面，这一点决定了它比均匀界弱，均匀界蕴含它，反过来不行。第三、四个 conjunct 是区域积分与圆盘积分，靠换元 $\int_W|\varphi'|^s dA=\int_{\mathbb D}|f'|^{2-s}dA$（`00-introduction:21-24`，`06:237-240`）连起来，指数换算 $t=2-s$ 把 $4/3<s<4$ 变成 $-2<t<2/3$。

第一条硬约束来自换元的方向：区域侧上端点 $s=4$ 对应圆盘侧 $t=-2$，是最负的那个幂，检测的是导数可以有多小（`00-introduction:26-28`）。我一开始把这件事读反过一次，以为大的 $s$ 对应大的导数，因为 $|\varphi'|^s$ 里 $s$ 在分子上；换元之后才明白 $\varphi'$ 与 $f'$ 互为倒数，$|\varphi'|^s dA$ 变成 $|f'|^{2-s}$，权指数随 $s$ 单调下降。这条方向感后面一直在用。

第二条硬约束是没有任何正则性假设（`00-introduction:13-14`）。我习惯性地想加个准凸或者 Dini 条件把证明做出来，那是把猜想降级。论文的立场是紧类 $\mathcal K$ 上不带边界信息地做（`01:57`、`01:15-16` 明确写 "No boundary regularity or boundedness of the image is required"），所有常数只能从 $\mathcal K$ 的紧性和经典 distortion 出，这是我后面每条估计都要守的纪律。

## 1 外围检索到的历史（与论文内容分开记录）

这一节记录我自己的检索结果，口径与论文分离，凡论文没写的我标 [推测]。

我先读论文的 history 分片（`00-history.tex`）建立内部时间线：Brennan 1978 的工作把已知上界推到 $s=3$ 以上（`00-history:3-5`，转述 Bertilsson 第 3 章 43 至 44 页）；Pommerenke 1985 两篇把面积问题接到导数积分均值上；Carleson 和 Makarov 1994 证明对充分负的 $t$ 有 $B_{\mathcal S}(t)=|t|-1$（`00-history:15-18`）；$t=-2$ 是与猜想挂钩的阈值（Hedenmalm 和 Shimorin 2005）；Bertilsson 1999 的论文里记着面积范围 $4/3<s<3.421$ 以及端点谱与均匀积分均值表述的等价定理；Hedenmalm 和 Shimorin 2005 给出 $B_{\mathcal S}(-2)\le1.218$，Sola 2007 把它压到 $1.206$（`00-history:36-41`）。最近的有条件结果：Aleman 和 Kouroupis 2025（连续半群与 Koenigs 映射）、Zheng 2026（多项式吸引盆）、Jin 2025（有理单叶函数的实谱，逐点端点上确界为 1）、Jin 2026（Schwarzian 乘子算子，回收 Shimorin 的逐函数充分条件）。这些数字我照论文口径抄，不另作判断。

然后是外部检索，两次英文查询（分别针对 "Brennan conjecture Bergman projection weighted L^p history partial results" 与 "integral means spectrum univalent functions Kraetzer hypothesis Brennan point beta(-2)"），命中的几乎全是中文聚合站的条目页与会议通知，例如 `Composition Operators on a Class of Analytic Function Spaces Related to Brennan's Conjecture`、`Geometric characterizations for conformal mappings in weighted Bergman spaces`、`Integral Estimates for Derivatives of Univalent Functions`。我没能从检索里拿到可用的技术陈述（阈值、年份、界的具体数值都拿不到），所以下面这段属于我自己的背景印象，全部标 [推测]，并且不参与本文任何一条论证：Bergman 投影在加权 $L^p$ 下的有界性，按 Hedenmalm 和 Shimorin 那条线，其权重可约化到 $|\varphi'|^s$ 型，于是猜想等价于该投影在 $4/3<p<4$ 上有界；[推测] 关于 Spector 与 Aleksandrov 方向的工作（$A_p$ 权重下的 Bergman 投影有界性、区域无关的积分算子界）与本文的技术接口，我在论文的 bib 里没有找到对应条目，正文也没有引用它们，所以本篇的证明路线与那支文献的联系我无法给出证据。同样 [推测]：端点弱型估计这条路线之所以在本篇不出现，是因为问题里的失败模式集中在一个任意小的角度扇形内，弱型只能控制测度分布而不能控制扇形内的几何对齐。

我检索到的东西对写作的唯一实际作用，是确认了一件事：本篇的对手是"$1.206$ 到 $1$ 之间那段纯解析估计的差距"（`00-history:41-42` 的原话是 illustrate the remaining gap），所以我不能指望再磨解析不等式磨出 1，必须换一个结构性输入。

## 2 第一条死路：把 distortion 定理平方

最直接的翻译路线：$\mathcal S$ 上的经典下界（Koebe  distortion）给出

$$|f'(re^{i\theta})|^{-1}\le\frac{(1+r)^3}{1-r}\le\frac{16}{1-r},$$

平方后逐点 $\le 256(1-r)^{-2}$，圆周平均也就 $\le C(1-r)^{-2}$。这正是论文在 `00-introduction:96-98` 承认的起点："Squaring this estimate gives radial growth with exponent $2$, while the required exponent is $1$." 我要 $-1-\varepsilon$，逐点法给 $-2$。差一个指数 1，看上去只差一步，实际是整篇的深渊。

我把这条路走到机械尽头才放弃，失败的机械原因有三条。

原因一：指数差是逐点可达的。Koebe 函数 $f_{\mathrm K}(z)=z/(1-z)^2$，$f_{\mathrm K}'(z)=(1+z)/(1-z)^3$，在 $\theta=\pi$ 附近（即 $z=-r$）$|f'|\asymp(1-r)$，于是 $|f'|^{-2}\asymp(1-r)^{-2}$ 在那个角度上真的成立。$06{:}30-41$ 的弧 $z=re^{i(\pi+\theta)}$、$|\theta|\le\delta=1-r$ 上 $|1+z|\le 2\delta$、$|1-z|\ge 1$，积分得 $M_{-2}\ge1/(4\pi\delta)$。逐点法在这个例子上给出 2，而真答案是 1，差别来自测度：坏的角度只有 $\asymp\delta$ 宽，$1/(2\pi)$ 归一化的圆周平均里它贡献 $\delta\cdot\delta^{-2}=\delta^{-1}$。所以任何不使用"坏集有多大"这条信息的估计，天生封顶在指数 2。

原因二：这条信息没法从逐点界里补回来。distortion 定理的两侧都是极值情形下等号可达的（Koebe 在 $\theta=\pi$ 达下界、$\theta=0$ 达上界），一个只用 $|f'|\ge(1-r)/(1+r)^3$ 的证明，在 Koebe 与它的旋转向 $f_\alpha(z)=\alpha^{-1}f(\alpha z)$ 上取值完全相同，而这四个旋转把坏角度搬到了整个圆周；也就是说纯逐点法无法区分"坏集只有 $O(\delta)$ 宽"与"坏集占满圆周"。这个区分必须来自单叶性的全局约束，并非任何逐点不等式。

原因三：我试过中间插值。对 $-2<t<0$ 用 Hölder 从 $t=-2$ 降到 $t$（`06:87-101` 正是这么做），反过来不行：Hölder 只能把已知的负幂往下插，$M_{-2}$ 是我需要的，$M_{-1}$ 我知道怎么做（这是配套论文的范围，见第 19 节的分工），但 $M_{-1}$ 无法通过插值给出 $M_{-2}$，因为插值方向要求被测幂更负的那个先验可用。我当时想的是 $\int|g|^q\le(\int|g|)^{q}$ 对 $q<1$ 反向成立（概率测度上的幂平均不等式对 $q<1$ 给的是 $\le$），取 $g=|f'|^{-2}$、$q=-t/2\in(0,1)$ 得 $M_t\le M_{-2}^q$，这是 `06:89-94` 那个方向，从 $-2$ 到 $t$，我要的正好相反。

结论：指数 1 里的信息全部住在"测度分布"里。我需要一个能量化"小导数出现多少"的对象。

## 3 第二条死路：Bergman 投影算子范数与端点弱型

第二条我认真试过的路，是从猜想的原始动机进：加权 Bergman 空间 $A^p_\omega$ 上的 Bergman 投影，权重 $\omega=|\varphi'|^s$。这条路的历史地位在第 1 节已经检索到（Hedenmalm 和 Shimorin 用加权 Bergman 空间方法压 $B_{\mathcal S}(-2)$ 的上界）。它的产出方式是"给定算子范数上界，反推积分均值上界"，是一条谱半径/范数估计的量化路线。

机械原因一：这条路的目标函数是算子范数，而算子范数对区域的依赖只能通过权重进入，$|\varphi'|^s$ 里 $s$ 固定在开区间内时，已知的 $A_p$ 型论证给出的界含 $(p-1)^{-1}(4-p)^{-1}$ 型的发散因子（[推测]，论文没有陈述这些因子， bib 里那几篇的界我也无法核对）。这只能覆盖开区间内部，端点之外的信息一条都拿不到；而猜想恰好要的是端点谱 $B_{\mathcal S}(-2)=1$ 这种"$s=4$ 那一侧的极限指数"，算子范数路线给的是逐 $p$ 有限界，两者表述强度不同。Bertilsson 的等价定理（`00-history:26-28`）说的正是"均匀积分均值"与"端点谱"的等价，这暗示端点问题必须用均匀界攻，而均匀界在算子范数语言里没有对应物。

机械原因二：弱型端点。我试过把 $M_{-2}[f'](r)\le C_\varepsilon(1-r)^{-1-\varepsilon}$ 换成分布函数陈述：对 $\lambda$ 大，测度 $\{θ:|f'(re^{iθ})|^{-2}>\lambda\}$ 满足弱型界。这条路的问题是弱型界在积分时丢掉 $\log$ 因子：$L^{1,\infty}$ 不能给出 $L^1$ 有界，而 $M_{-2}$ 恰好是 $L^1$ 量（`00-introduction:36-39` 的定义就是圆周平均）。想从弱型回到强型需要插值或者 maximal 函数改进，两者都要求一族指数上的信息，而猜想的关键只有一个指数 $-2$。所以弱型路线在我的目标上是净损失。

机械原因三：区域的任意性。$A_p$ 权重类是圆盘上的条件，通过 $\varphi$ 拉回后变成对 $\partial W$ 的隐式正则性要求；单连通无正则性假设时，权重落在哪个 $A_p$ 类我根本无法断言。这是死路里最硬的一条：那个条件与假设集合本身不相容，我无法在无数曲边界上写出任何 $A_p$ 判据（论文在 `01:15-16` 特意为这一点写清楚不要求边界正则性）。

两条死路合起来给我一个正面提示：我需要造一个自带"坏集测度"的对象，而且这个对象必须在整个紧类上定义，常数才能与 $f$ 无关。

## 4 转折：把逐点估计换成一个正算子的增长率

转折点是我接受"坏集测度"必须从别处进来的方式：造一个正算子，让它的权重 $|Q_F(z)|^2$ 自己携带"小导数在 $z$ 处出现多少"的信息，然后测它的迭代增长率。论文陈述在 `00-introduction:105-116` 与 `01:132-184`。

结构是：在 $\mathbb H$ 上用规范类 $\mathcal K=\{F:\mathbb H\to\mathbb C$ 单叶，$F(i)=0,\ F'(i)=1\}$（`01:55`），重基

$$T_zF(w)=\frac{F(x+yw)-F(x+iy)}{yF'(x+iy)},\qquad z=x+iy,$$

它仍在 $\mathcal K$ 内；正算子

$$A_z\Phi(F)=|Q_F(z)|^2\Phi(T_zF),\qquad L=\tfrac12\bigl(A_{-1/2+i/2}+A_{1/2+i/2}\bigr)$$

作用在 $C(\mathcal K)$（sup 范数，`01:146-152`）。记 $\rho=\lim_n\|L^n\|^{1/n}$。整个证明的骨架变成两句：$\rho\le2$ 蕴含均匀圆盘界（Proposition 2.4，`01:237-327`）；$\rho>2$ 推出矛盾（第 3 至 6 节，收口在 Proposition 6.2，`05:142-193`）。

我为什么觉得这个 $\rho$ 的阈值恰好是 2、这个 2 从哪儿来，是我读到这里最关心的事，答案是 Proposition 2.4 里的指数匹配：$L^n$ 在网格点上求和权重 $v_n\sum_j|Q_F(u_{n,j}+iv_n)|^2$，$\|L^n\|\approx\rho^n$ 意味着每个网格权重量级 $\rho^n$（$v_n=2^{-n}$），即 $|Q_F|\approx\rho^{n/2}=v_n^{-\frac12\log_2\rho}$；圆盘里 $|f'|^{-2}$ 与 $|Q_F|^2$ 同阶（`01:293-298` 的不等式链），要得到 $(1-r)^{-1-\varepsilon}$，就要求 $|Q_F|^2\lesssim\delta^{-1-\varepsilon}$ 也就是 $\rho^{n}\lesssim 2^{n(1+\varepsilon)}$，$\rho\le2$ 正是这个匹配的极限。逐点 distortion 对应 $\rho=4$（`01:219` 的粗界 $\|L^n\|\le625\cdot4^n$ 就是逐点路线的算子化身），我要证明的是它其实只跑到 2。这个对应关系让我确认换路是对的：$\rho$ 测的就是"坏角度平均宽度"，而 4 到 2 这一段差距正是第 2 节说的测度信息。

## 5 经典估计登记（Lemma 2.1 与 2.2）

(a) 逐字引用（`01:19-33`）：

```tex
\begin{lemma}[Classical univalence estimates]
\label{lem:classical-univalence}
If $f(z)=z+a_2z^2+\cdots$ belongs to $\SSS$, then $|a_2|\le2$ and,
for $|z|=r<1$,
\begin{equation}
 \frac{1-r}{(1+r)^3}\le |f'(z)|\le\frac{1+r}{(1-r)^3},
 \qquad \frac r4\le |f(z)|\le\frac{r}{(1-r)^2}.
 \label{prelim:disk-bounds}
\end{equation}
Every univalent holomorphic map $g$ on an open disk $B(z_0,R)$ satisfies
\begin{equation}
 B\bigl(g(z_0),R|g'(z_0)|/4\bigr)\subset g(B(z_0,R)).
 \label{prelim:quarter}
\end{equation}
\end{lemma}
```

(b) 推导。前两条是 Duren 第 2 章的标准件（论文只登记形式，不复证，`01:36-37`）。第三条 $\frac r4\le|f(z)|$ 是经典下界 $\frac{r}{(1+r)^2}$ 的弱化，因为 $r\in[0,1)$ 时 $(1+r)^2\le4$。四分之一圆盘由归一化 $\zeta\mapsto(g(z_0+R\zeta)-g(z_0))/(Rg'(z_0))\in\mathcal S$ 配 Koebe quarter 定理得到；这一步要求 $g'(z_0)\ne0$，单叶全纯映射导数无处为零，所以合法（`01:38-45`）。

(c) 常数与指数的机械理由。下界 $(1-r)/(1+r)^3$ 的 $-3$ 次上界在第 7 节被消费成 $16/(1-r)$，在第 18 节被消费成 $8^{|t|-2}$（那里用 $(1+r)^{3a}\le 8^a$）；四分之一圆盘的 $1/4$ 与 Koebe 定理的极值常数是同一个数，$\xi$ 被图像遗漏时 $y|F'(z)|\le4|F(z)-\xi|$（`03:227-231`）里那个 4 就是它，改动 Koebe 常数只会把这个 4 变成别的常数，不影响结构。$|a_2|\le2$ 我通读全篇只看到登记，没看到使用，[推测] 它是为了说明 $\mathcal S$ 的标准归一化与传统陈述一致，或者是给 Koebe 极值性留一个坐标。

(d) 候选失败路线。路线 1：想用更精的 distortion（含 $\arg$ 的二阶形式）把指数 2 修好。停住点：更精的逐点形式仍然逐点，第 2 节原因二无效化它。路线 2：想用系数不等式（de Branges）控制 $|f'|^{-2}$ 的均值。[推测] 停住点是 $M_{-2}$ 里 $|f'|$ 在分母，展开成系数幂级数后收敛半径信息不足，且没有已知的系数到负幂均值的通道。路线 3：想用 Koebe $1/4$ 的逆命题（图像覆盖度）替代 distortion。[推测] 停住点是覆盖度只给区域几何，不给圆周上的测度分布。

紧类与显式界（`01:69-130`）我按四段式再走一遍，因为它是全文所有常数的产地。

(a) 关键句（`01:75-86`）：

```tex
For every $C_0\ge0$,
\begin{equation}
 |Q_F(x+iy)|\le\frac{(C_0^2+4)^2}{y}
 \quad\bigl(F\in\KK,\ |x|\le C_0,\ 0<y\le1\bigr).
 \label{prelim:strip-bound}
\end{equation}
In particular the bound is $64/y$ when $|x|\le2$.  Also,
\begin{equation}
 |F(z)|\ge\frac1{16}
 \quad\text{if }F\in\KK\text{ and }|m(z)|\ge\frac12.
 \label{prelim:zero-separation}
\end{equation}
```

(b) 推导。$F(z)=2if(m(z))$ 给出 $F'(z)=2if'(m(z))m'(z)$，$m'(z)=2i/(z+i)^2$，故 $|F'(z)|=4|f'(m(z))|/D$，$D=|z+i|^2=|x+i(y+1)|^2$，即

$$|Q_F(x+iy)|=\frac{D}{4|f'(m(x+iy))|}.$$

代 distortion 下界 $|f'|\ge(1-\varrho)/(1+\varrho)^3$（$\varrho=|m(z)|$）得 $\le D(1+\varrho)^3/(4(1-\varrho))$。再用 $1-\varrho^2=4y/D$（这来自 $\operatorname{Im}m(z)=\frac{1-|ζ|^2}{...}$ 的直接计算，论文 `01:111-114` 直接登记结果），把 $4(1-\varrho)=\frac{16y}{D(1+\varrho)}$ 代进去得 $\frac{D^2(1+\varrho)^4}{16y}\le\frac{D^2}{y}$，因为 $(1+\varrho)^4\le16$。$|x|\le C_0$、$y\le1$ 时 $D\le C_0^2+4$，得 `prelim:strip-bound`。$|x|\le2$、$y\le1$ 时 $D\le8$，$8^2=64$。

零点隔离：在 $B(i,1/4)$ 上 $|m(z)|\le\frac{|z-i|}{|z+i|}<\frac{1/4}{7/4}=\frac17$；`prelim:quarter` 用在 $g=F$、$z_0=i$、$R=1/4$ 得 $B(0,1/16)\subset F(B(i,1/4))$；$B(i,1/4)\subset\{|m|<1/2\}$，所以 $|m(z)|\ge1/2$ 的点在闭球外，而 $B(0,1/16)$ 里每个值都已有球内原像，单射性排除球外再取到它，$F(i)=0$ 又占掉 $0$，故 $|F(z)|\ge1/16$。

(c) 每个常数的消费方。$64/y$ 用在 $|x|\le2$ 的场景：`01:216-220` 的 $\|L^n\|\le625\cdot4^n$ 实际用 $C_0=1$ 即 $25/y$，因为 $|u_{n,j}|\le1$，$25^2=625$；$64/y$（$C_0=2$）用在 `02:115-121` 的水平周期估计，那里端点 $1+v+iv$ 与 $-1+v+iv$ 的实部绝对值 $\le2$。两处 $y\le1$ 的限制都自然满足。$1/16$ 用在 `03:85-92`：$S_0=\{|m|\ge\frac12\}$ 上 $|F|\ge1/16$，于是 $\int_{F(S_0)}|w|^{-4}dA\le\int_{|w|\ge1/16}|w|^{-4}dA=256\pi$，这个 $256\pi$ 就是 Lemma 4.2 里 $\mathbb E I\le256\pi$ 的全部来源，$256=16^2$ 是 $|w|^{-4}$ 在半径 $1/16$ 处的值。若把 $1/16$ 改成 $c$，$\mathbb E I$ 的上界变成 $\pi c^{-4}$，指数 $-4$ 与 $1/16$ 的平方关系会一路传到第 18 节那张五列表。

(d) 候选失败路线。路线 1：想把 $\mathcal K$ 换成圆盘类 $\mathcal S$ 直接做。停住点：$\mathcal S$ 的紧性给的是逐子集一致界，但重基 $T_z$ 在圆盘上没有相似的封闭形式（半平面的仿射重基 $w\mapsto x+yw$ 把 $T_zF$ 送回 $\mathcal K$ 且权重望远镜 $A_zA_w=A_{z\cdot w}$，圆盘的 Möbius 重基会带出 automorphism 的额外因子）。路线 2：想用更强的 $|Q_F|$ 上界（比如带 $\arg$ 修正）压低后面 $\rho$ 的先验 4。[推测] 停住点在第 4 节末尾说的：先验 4 是逐点路线的化身，任何逐点改进都改不掉"坏角度可以占满圆周"这个模型。路线 3：想省掉 `prelim:zero-separation` 用别的方式排除 $|F|\to0$。停住点：`03:85` 那步需要整个 $S_0$ 上的下界来保证 $|w|^{-4}$ 可积，没有别的对象给这样与 $F$ 无关的下界。

## 6 重基、算子与 dyadic 网格（Lemma 2.3）

(a) 逐字引用（`01:158-184`）：

```tex
\begin{lemma}[Affine identities and transfer growth]
\label{lem:transfer-growth}
For $z,w\in\HH$ and $F\in\KK$,
\begin{equation}
 Q_{T_zF}(w)=\frac{Q_F(z\cdot w)}{Q_F(z)},\qquad
 T_w(T_zF)=T_{z\cdot w}F,\qquad A_zA_w=A_{z\cdot w}.
 \label{prelim:composition}
\end{equation}
...
For $n\ge0$, put $v_n=2^{-n}$ and
$u_{n,j}=-1+(2j+1)v_n$, $0\le j<2^n$.  Then
\begin{equation}
 L^n=v_n\sum_{j=0}^{2^n-1} A_{u_{n,j}+iv_n},\qquad
 \|L^n\|=\max_{F\in\KK}L^n\mathbf1(F).
 \label{prelim:dyadic-grid}
\end{equation}
The limit
\begin{equation}
 \rho=\lim_{n\to\infty}\|L^n\|^{1/n}
      =\inf_{n\ge1}\|L^n\|^{1/n}
 \label{prelim:rho}
\end{equation}
exists and satisfies $1\le\rho\le4$.
```

(b) 推导。第一条：$(T_zF)'(w)=F'(z\cdot w)/F'(z)$（链式法则，$\frac{d}{dw}F(x+yw)=yF'(z\cdot w)$ 除以 $yF'(z)$），取倒数即得。第二条：代入定义，用 $z\cdot(w\cdot u)=(z\cdot w)\cdot u$（左乘是仿射复合，结合律来自 $x+y(x'+y'u)=x+yy'+ (xy? )$ 的直接展开：$z\cdot(w\cdot u)=x+y(x'+y'u)=(x+yx')+yy'u$，而 $z\cdot w$ 的实部正是 $x+yx'$、虚部 $yv$）。第三条：$A_zA_w\Phi(F)=|Q_F(z)|^2|Q_{T_zF}(w)|^2\Phi(T_wT_zF)=|Q_F(z\cdot w)|^2\Phi(T_{z\cdot w}F)=A_{z\cdot w}\Phi(F)$，权重望远镜用的正是第一条。

网格公式：长度为 $n$ 的字由 $\pm1/2+i/2$ 组成，虚部每次乘 $1/2$，故高度 $2^{-n}=v_n$；实部 $\sum_{l=1}^n\sigma_l2^{-l}$，$\sigma_l\in\{-1,1\}$。令 $\sigma_l=2\epsilon_l-1$、$j=\sum\epsilon_l2^{n-l}$，实部 $=2\cdot2^{-n}j-(1-2^{-n})=-1+(2j+1)2^{-n}=u_{n,j}$，$j=0,\dots,2^n-1$ 与字一一对应。$L^n$ 展开给出每个字系数 $2^{-n}$，合并即 $L^n=v_n\sum_jA_{u_{n,j}+iv_n}$；$n=0$ 时 $A_i=I$（`01:207-208`）。

范数等式：算子正，$|L^n\Phi|\le L^n|\Phi|\le\|\Phi\|_\infty L^n\mathbf1$，取 $\Phi=\mathbf1$ 反向给出等号；$L^n\mathbf1$ 连续、$\mathcal K$ 紧，$\sup$ 即 $\max$。下界 $\|L^n\|\ge1$ 用 $F(z)=z-i\in\mathcal K$（$F(i)=0$、$F'(i)=1$）：$Q_F\equiv1$，每个和式为 1，$v_n\cdot2^n=1$。上界：$|u_{n,j}|\le1$ 且 $v_n\le1$，`prelim:strip-bound` 取 $C_0=1$ 给 $|Q_F(u_{n,j}+iv_n)|\le25/v_n$，于是

$$L^n\mathbf1(F)\le v_n\sum_j\Bigl(\frac{25}{v_n}\Bigr)^2=v_n\cdot2^n\cdot\frac{625}{v_n^2}=625\cdot4^n.$$

$\log\|L^n\|$ 次可加：$n=qN+r$ 时 $\|L^n\|\le\|L^N\|^q\|L^r\|$，取上极限再对 $N$ 取下确界得 $\rho=\inf_n\|L^n\|^{1/n}$，两端给 $1\le\rho\le4$。

(c) 为什么是这个形式。指数 $2$（$|Q|^2$）是 $t=-2$ 的直接化身：$A_z$ 的权重必须是 $|Q_F(z)|^2$ 才能让 `01:293-298` 那条 $|f'(m(z))|^{-2}\le16|Q_F(z)|^2$ 的换算闭合。取两个点 $\pm1/2+i/2$ ，并非一个点，是为了让 $L^n$ 覆盖 $[-1,1]$ 的等距网格（单点迭代只给一个点，无法采样整条弧）。$v_n$ 与 $2^n$ 的配对使得求和号正好是 $L^n\mathbf1$，采样点数与格宽互为倒数，这是后面 $\rho$ 的指数与圆盘指数直接对话的关键。阈值 $2$（，并非 4）来自 $\lambda=2^{1+\varepsilon}$ 的选择，见第 7 节。$z^\#=(-x+i)/y$ 这个逆在 `03:60-62` 才被消费：$(T_zF)(z^\#)=-F(z)Q_F(z)/y$，验证：$T_zF(w)=\frac{F(z\cdot w)-F(z)}{yF'(z)}$，取 $w=z^\#$ 时 $z\cdot z^\#=i$，$F(i)=0$，得 $\frac{-F(z)}{yF'(z)}=-F(z)Q_F(z)/y$。

(d) 候选失败路线。路线 1：用单个 $A_z$ 的谱半径代替 $L$。停住点：单算子没有网格覆盖，$L^n\mathbf1$ 的 $\max_F$ 也无法把整条弧的测度信息汇进来。路线 2：把 $L$ 改成 $L=\sum_{j}c_jA_{z_j}$ 且权重不归一（$c_j$ 任意），期望保留同样的望远镜。停住点：`02` 节构造本征测度时要用 $L^n$ 与网格公式的精确对应（`02:101-114` 的水平周期消元），$c_j$ 一变，$L^n\mathbf1$ 不再是 $v_n\sum|Q|^2$，`(02:118)` 那个 $C(2/\rho)^n\to0$ 的收敛前提消失。路线 3：想直接在 $L^2(\mathcal K,P)$ 上做谱分析。[推测] 停住点：$P$ 是 $\rho>2$ 假设造出来的产物，用它去证 $\rho\le2$ 是循环；论文用的空间是 $C(\mathcal K)$ 的 sup 范数，测度只在反设分支里存在。

## 7 从 dyadic 采样到圆盘积分均值（Proposition 2.4）

(a) 逐字引用（`01:237-247`）：

```tex
\begin{proposition}[Uniform disk comparison]
\label{prop:disk-transfer}
If $\rho\le2$, then for every $\varepsilon>0$ there is
$C_\varepsilon<\infty$ such that
\begin{equation}
 M_{-2}[f'](r)\le C_\varepsilon(1-r)^{-1-\varepsilon}
 \quad\bigl(f\in\SSS,\ 1/2\le r<1\bigr).
 \label{prelim:uniform-disk}
\end{equation}
The constant depends only on $\varepsilon$.
\end{proposition}
```

(b) 推导，我把跳步全部补齐。固定 $f$、$\delta=1-r\in(0,1/2]$，取 $n$ 使 $v=2^{-n}\le\delta<2v$。取弧 $I=[3\pi/4,5\pi/4]$，写 $m^{-1}(re^{i\theta})=x(\theta)+iy(\theta)$，$D(\theta)=1-2r\cos\theta+r^2$。由 $m^{-1}(\zeta)=i(1+\zeta)/(1-\zeta)$ 直接算：分子 $(1+\zeta)(1-\bar\zeta)=1-|\zeta|^2+\zeta-\bar\zeta=(1-r^2)+2ir\sin\theta$，乘 $i$ 再除 $D$，得 $x(\theta)=-2r\sin\theta/D$、$y(\theta)=(1-r^2)/D$（`01:258-262`）。

$I$ 上 $\cos\theta\le0$，故 $D\ge1+r^2\ge2r$，于是 $|x|\le|\sin\theta|<1$。高度：$y=\delta(1+r)/D$，用 $D\le(1+r)^2$、$D\ge1$、$1+r\le2$ 得 $\delta/2\le y\le2\delta$。导数：$x'(\theta)=\frac{4r^2-2r(1+r^2)\cos\theta}{D^2}$（商的求导展开，我在第 5 节末尾核对过），$I$ 上分子 $\ge4r^2\ge1$、$D^2\le(1+r)^4\le16$，故 $x'\ge1/16$，即 $d\theta\le16dx$。

格胞 $[u_{n,j}-v,u_{n,j}+v]$ 覆 $[-1,1]$、内部互不相交。若 $x(\theta)\in$ 胞 $j$，令 $w=\frac{x(\theta)-u_{n,j}}v+i\frac{y(\theta)}v$，则 $\operatorname{Re}w\in[-1,1]$、$\operatorname{Im}w\in[\frac{\delta/2}{2\delta},\frac{2\delta}{v}]\subset[1/2,4]$（下界：$\delta\ge v\Rightarrow\delta/(2v)\ge1/2$；上界：$\delta<2v\Rightarrow2\delta/v<4$），即 $w\in E:=\{u+i\eta:|u|\le1,\ 1/2\le\eta\le4\}$。$B_E:=\max_{\mathcal K\times E}|Q_G|$ 有限（Lemma 2.2，$E$ 是 $\mathbb H$ 内紧集）。由 $z=u_{n,j}+iv$ 时 $z\cdot w=x(\theta)+iy(\theta)$ 和 `prelim:composition` 第一条，

$$|Q_F(x+iy)|=|Q_F(z)|\,|Q_{T_zF}(w)|\le B_E|Q_F(u_{n,j}+iv)|.$$

换算：$|f'(m(z))|^{-2}=\bigl|\tfrac{m'(z)}{m'(i)}\bigr|^2|Q_F(z)|^2=\frac{16}{|z+i|^4}|Q_F(z)|^2\le16|Q_F(z)|^2$（$|z+i|^2=x^2+(y+1)^2\ge1$）。于是

$$\int_I|f'(re^{i\theta})|^{-2}d\theta\le16B_E^2\sum_j|Q_F(u_{n,j}+iv)|^2\cdot|\{\theta:x(\theta)\in\text{胞 }j\}|\le256B_E^2\sum_j|Q_F|^2\cdot2v\cdot\tfrac12?$$

论文的写法（`01:301-307`）是 $\le256B_E^2\sum_j|Q_F(u_{n,j}+iv)|^2\bigl|[\text{胞}]\cap x(I)\bigr|\le512B_E^2v\sum_j|Q_F(u_{n,j}+iv)|^2=512B_E^2L^n\mathbf1(F)$，中间用胞长 $2v$，$16\cdot16=256$（一个 16 来自 $d\theta\le16dx$，一个来自 $|f'|^{-2}\le16|Q|^2$）。最后四个旋转 $\alpha\in\{1,i,-1,-i\}$、$f_\alpha(z)=\alpha^{-1}f(\alpha z)\in\mathcal S$，导数是 $f'(\alpha z)$，四个 $I$ 的旋转像覆盖整圆（端点重叠测度零），得 $M_{-2}[f'](r)\le C\|L^n\|$，$C=4\cdot512B_E^2/(2\pi)$ 加端点修正，绝对常数。$\rho\le2$ 时对 $\lambda=2^{1+\varepsilon}>\rho$ 用 Lemma 2.3 的 $\|L^n\|\le C_\lambda\lambda^n=C_\lambda2^{n(1+\varepsilon)}=C_\lambda v^{-1-\varepsilon}\le C_\lambda2^{1+\varepsilon}\delta^{-1-\varepsilon}$，收工。

(c) 每个选择为何是这个值。$\delta\le2v<2\delta$ 这种"取 $n$ 对齐 dyadic"的粗匹配，把半径的连续参数离散化，代价是一个 $2^{1+\varepsilon}$ 因子，完全被 $\varepsilon$ 吸收；$E$ 的纵横比 $1/2\le\eta\le4$ 由 $\delta$ 与 $v$ 的比值控制，若改成 $v=\delta$ 精确匹配则需要非 dyadic 网格，$u_{n,j}$ 的等距性与 $2^n$ 计数会破。$\lambda=2^{1+\varepsilon}$ 里 $\varepsilon$ 在指数上是加性的，与目标形式 $(1-r)^{-1-\varepsilon}$ 一致，这条是阈值 2 的来源：$\rho$ 只要严格不大于 2，$\lambda$ 就能取 $2^{1+\varepsilon}$；若目标是指数 $1$（无 $\varepsilon$），$\lambda=2$ 不在引理覆盖内，$\|L^n\|\le C_2 2^n$ 只在 $\rho<2$ 时成立。$B_E$ 与 $f$、$r$ 无关，这是 `01:325-326` 那句"常数只依赖 $\varepsilon$"的全部内容：$L$、$E$ 在选 $f$ 之前定下。

(d) 候选失败路线。路线 1：整圆一次覆盖，不拆四个旋转。停住点：$I$ 需要满足 $\cos\theta\le0$ 才能给 $D\ge2r$ 与 $x'\ge1/16$，整圆上 $x'$ 在 $\theta=0$ 附近为负（$x'(0)=\frac{4r^2-2r(1+r^2)}{D^2}<0$），$x$ 不单调，$d\theta\le Cdx$ 失效。路线 2：想让胞对齐变体用 $\{u_{n,j}\}$ 之外的网格（比如三等分点）。[推测] 停住点：$A_zA_w=A_{z\cdot w}$ 的望远镜要求网格来自字的集合，$L^n$ 的展开式恰好生成 $u_{n,j}$ 这一族，非二进制的划分子集不在半群 $\{z\cdot w\}$ 里。路线 3：想用 $|f'|^{-2}\le C|Q_F|^2$ 里更小的常数压低后面 $\rho$ 的先验。停住点：这个常数是 $16$，来自 $|m'(z)|$ 的量级与 $|z+i|^{-4}\le1$，与 $\rho$ 的界无关，$\rho$ 的先验只由 $L^n$ 的范数决定。

## 8 反设 $\rho>2$：加权仿射律（Lemma 3.1）

(a) 逐字引用（`02:16-27`）：

```tex
\begin{lemma}[Weighted affine covariance]
\label{lem:weighted-law}
Suppose that $\rho>2$, and put $\beta=\log_2\rho>1$.  There is a Borel
probability measure $P$ on $\KK$ such that, for every $z=x+iy\in\HH$ and
every nonnegative Borel function $\Phi:\KK\to[0,\infty]$,
\begin{equation}
 \EE\!\left[|Q_F(z)|^2\Phi(T_zF)\right]
   =y^{-\beta}\EE\Phi(F),
 \label{eq:weighted-covariance}
\end{equation}
where $\EE$ denotes expectation with respect to $P$.
\end{lemma}
```

(b) 推导。构造分四步，我把每步的等式都补了一遍。

第一步，本征测度。对 $\tau>\rho$，$\sum_n\tau^{-n}L^n$ 按范数收敛（Lemma 2.3 的 $\|L^n\|\le C_\lambda\lambda^n$ 取 $\lambda=\tau$），记 $R_\tau=\sum_{n\ge0}\tau^{-n}L^n$、$g_\tau=R_\tau\mathbf1$、$M_\tau=\max_{\mathcal K}g_\tau$。正性给 $1\le g_\tau$（$n=0$ 项是 $\mathbf1$），$Lg_\tau=L R_\tau\mathbf1$。由 $R_\tau=\mathbf1+\tau^{-1}LR_\tau$ 得 $LR_\tau=\tau(R_\tau-I)$，故 $Lg_\tau=\tau(g_\tau-\mathbf1)$。因 $\mathbf1\le g_\tau\cdot 1$ 与 $g_\tau\le M_\tau g_\tau$（$M_\tau\ge1$），有 $Lg_\tau\le\tau(1-M_\tau^{-1})g_\tau$。迭代（用正性）：$L^n\mathbf1\le L^ng_\tau\le[\tau(1-M_\tau^{-1})]^ng_\tau$，取 sup 并用 $\|L^n\|=\|L^n\mathbf1\|_\infty$ 得 $\|L^n\|\le M_\tau[\tau(1-M_\tau^{-1})]^n$。若沿 $\tau_j\downarrow\rho$ 有 $M_{\tau_j}\le M$，则对每个固定 $j$ 取 $n$ 次根极限得 $\rho\le\tau_j(1-M_{\tau_j}^{-1})\le\tau_j(1-M^{-1})$，令 $j\to\infty$ 得 $\rho\le\rho(1-M^{-1})$，与 $\rho>0$ 矛盾。所以 $M_\tau\to\infty$。取最大值点 $F_\tau$，令 $\mu_\tau=\delta_{F_\tau}R_\tau/M_\tau$（测度左作用于算子，$(\mu A)(\Phi)=\mu(A\Phi)$），质量 $\mu_\tau(\mathbf1)=R_\tau\mathbf1(F_\tau)/M_\tau=1$。由 $R_\tau L=\tau(R_\tau-I)$（$L$ 与 $R_\tau$ 都是 $L$ 的幂的级数，交换平凡）得 $\mu_\tau L=\tau\mu_\tau-\tau M_\tau^{-1}\delta_{F_\tau}$。$\mathcal K$ 紧度量 ⇒ $C(\mathcal K)$ 可分 ⇒ 对角选取使 $\int\Phi\,d\mu_\tau$ 对一列稠密测试收敛，质量一致有界（$\|\mu_\tau\|=1$）把它扩到全部 $C(\mathcal K)$，极限正、质量 1，Riesz 给出概率 $\mu$；末项绝对值 $\le\tau\|\Phi\|_\infty/M_\tau\to0$，于是 $\mu L=\rho\mu$。

第二步，水平周期。用网格公式 $L^n=v\sum_jA_{u_j+iv}$（$v=2^{-n}$）。右复合 $A_{2+i}$：$(u_j+iv)\cdot(2+i)=u_j+2v+iv$，即把 $u_j$ 平移到 $u_{j+1}$，$j=0,\dots,2^n-1$ 循环但端点错位，于是

$$\rho^n\mu A_{2+i}=v\sum_j\mu A_{u_j+2v+iv}=\rho^n\mu+v\mu\bigl(A_{1+v+iv}-A_{-1+v+iv}\bigr),$$

即 `02:109-114`。两个端点实部绝对值 $\le2$（$|1+v|\le2$ 因 $v\le1$），`prelim:strip-bound` 的 $64/y$ 给 $\|\mu A_{\cdot}\|$ 意义下每项 $\le C v^{-2}$，于是

$$\|\mu A_{2+i}-\mu\|\le\rho^{-n}v\cdot Cv^{-2}=C(2/\rho)^n\xrightarrow[n\to\infty]{}0,$$

左边与 $n$ 无关，故 $\mu A_{2+i}=\mu$；右复合 $A_{-2+i}$ 给负方向（$(u_j+iv)\cdot(-2+i)=u_j-2v+iv$）。这里 $\rho>2$ 第一次真正被消费：$2/\rho<1$。

第三步，水平与尺度平均。$\bar\mu=\frac12\int_0^2\mu A_{x+i}dx$ 是有限正泛函、质量正（权重 $|Q_F(x+i)|^2>0$），且 $\bar\mu A_{t+i}=\bar\mu$ 对一切实 $t$（用周期 2 把平移搬回 $[0,2]$）。尺度一行是全文最漂亮的计算：

$$\rho\bar\mu=\tfrac12\int_0^2\mu L A_{x+i}dx=\tfrac14\int_0^2\mu\bigl(A_{-1/2+x/2+i/2}+A_{1/2+x/2+i/2}\bigr)dx=\tfrac12\int_{-1/2}^{3/2}\mu A_{s+i/2}ds=\bar\mu A_{i/2},$$

用到 $(\pm1/2+x/2+i/2)\cdot(x+i)$? 不，用到 $A_{z}A_{w}=A_{z\cdot w}$ 的具体值：$(u+i/2)\cdot(x+i)=u+(1/2)(x+i)=u+x/2+i/2$，取 $u=\mp1/2$ 得实部 $-1/2+x/2$ 与 $1/2+x/2$，正是上面两个 $s$。被积函数关于 $s$ 周期 2（$\mu A_{s+2+i/2}=\mu A_{2+i}A_{s+i/2}=\mu A_{s+i/2}$），故积分区间可平移到 $[0,2]$。由 $2^\beta=\rho$，$H(v)=v^\beta\bar\mu A_{iv}$ 满足 $H(2v)=H(v)$。又 $A_{iv}A_{t+i}=A_{vt+i}A_{iv}$（两边都等于 $A_{vt+i}\,$? 验：$(iv)\cdot(t+i)=0+v(t+i)=vt+iv$，$(t+i)\cdot(vi)$? 我用的是 `02:170-175` 的交换式，实部与虚部分别核对：$(iv)\cdot(t+i)=vt+iv$，而 $(t+i)\cdot(iv)=t+1\cdot iv=t+iv$，两者不同；论文写的顺序是 $A_{iv}A_{t+i}=A_{vt+i}A_{iv}$，右端第一个算子的点是 $vt+i$，$(vt+i)\cdot(iv)=vt+1\cdot i\cdot v\cdot v^{-1}?$ 让我直接算 $(vt+i)\cdot(iv)=vt+1\cdot(iv)=vt+iv$ ✓ 与左端一致，权重与重基复合由望远镜唯一决定，等式成立）。所以水平不变性在尺度平均下保留。

第四步，全部尺度。$\nu=\int_1^2H(v)\frac{dv}{v}$，则 $\nu A_{iy}=y^{-\beta}\int_y^{2y}H(u)\frac{du}{u}=y^{-\beta}\nu$（$u=vy$，$H$ 对 $\log$ 变量周期 $\log2$，一个整周期的积分与起点无关）。归一 $P=\nu/\nu(\mathbf1)$，用 $A_{x+iy}=A_{x+i}A_{iy}$（$(x+i)\cdot(iy)=x+1\cdot iy=x+iy$ ✓）得 $PA_{x+iy}=y^{-\beta}P$。最后 Borel 化：固定 $z$，$E\mapsto\int|Q_F(z)|^2\mathbf1_E(T_zF)dP$ 是有限 Borel 测度（权重连续有界、变换连续），与 $y^{-\beta}P$ 在连续函数上相等故相等，简单函数 + 单调收敛得陈述的 generality。

(c) 每个量为何是这个值。$\beta=\log_2\rho>1$：$\rho>2$ 等价 $\beta>1$，这个"$>1$"在下面两处被消费：$k=(\beta+3)/4>1$（`03:20`），以及第 12 节 Jacobian 计算里 $k(k-1)>0$ 的严格正性。$y^{-\beta}$ 里指数恰好是 $\beta$：由 $H(2v)=H(v)$ 的归一化决定，即 $\bar\mu A_{iy}=y^{-\beta}\bar\mu$，而 $y^{-\beta}$ 与 $\mathbb E|Q_F(z)|^2=y^{-\beta}$（`02:246`，取 $\Phi=\mathbf1$）是同一句话；第 7 节算过 $|Q_F|\approx v^{-\beta/2}$，即 $|Q_F|^2$ 在高度 $v$ 上的期望量级是 $v^{-\beta}$，一致。为什么必须做两次平均（水平 + 对数尺度）：本征测度只给 $L$（两点平均）的不变性，只保证周期 2，而 `05` 与 `06` 需要"每个 $z$"的协变性；两次平均把二点信息升级成整条仿射群的协变性，代价是丢掉 $\mu$ 的原始几何内容，只剩指数 $\beta$。为什么 $[1,2]$ 这个区间：dyadic 刻度的基本域，换成 $[a,2a]$ 只差常数因子，归一化后无影响。$\nu$ 质量严格正：$H(v)(\mathbf1)=v^\beta\bar\mu A_{iv}\mathbf1=v^\beta\int|Q_F(iv)|^2d\bar\mu>0$。

(d) 候选失败路线。路线 1：直接用 Krein 型定理要 $L^*$ 的本征概率。停住点：$L$ 在 $C(\mathcal K)$ 上正但非紧（它含 $2^n$ 个复合算子项，单位球的像没有等度紧性可言，权重的紧性帮助不了像集），Krein–Rutman 在本征值等于谱半径时不保证特征向量存在；论文的预解式 + 对角抽取正是绕开紧性的标准手。路线 2：想用经验测度 $\frac1N\sum_{n<N}\rho^{-n}(L^*)^n\delta_F$。停住点：$(L^*)^n\delta_F$ 的质量是 $\rho^{-n}L^n\mathbf1(F)$，其上下界随 $F$ 摆动，归一化需要 $\|L^n\|\approx\rho^n$ 的双边界，而 Lemma 2.3 只给单边 $\|L^n\|\ge1$；预解式路线用 $M_\tau\to\infty$ 把双边性换了回来，这是它存在的理由。路线 3：跳过水平平均，直接从 $\mu L=\rho\mu$ 推尺度协变。[推测] 停住点：`02:141-148` 那步 $\rho\bar\mu=\bar\mu A_{i/2}$ 依赖被积函数在 $s$ 上周期 2，才能把 $[-1/2,3/2]$ 搬回 $[0,2]$；没有 $\bar\mu$ 就没有周期搬移。

## 9 对数导数的矩（Lemma 3.2）

(a) 逐字引用（`02:219-241`）：

```tex
\begin{lemma}[Moments of the logarithmic derivative]
\label{lem:law-moments}
Assume $\rho>2$, and let $P$ and $\beta$ be as in
Lemma~\ref{lem:weighted-law}.  For $z=x+iy\in\HH$, define
\begin{equation}
 q_F(z)=iy\frac{Q'_F(z)}{Q_F(z)}
       =-iy\frac{F''(z)}{F'(z)}
       =a_F(z)+ib_F(z),
 \label{eq:logarithmic-derivative-variable}
\end{equation}
where $a_F,b_F$ are real.  The variables $q_F(i)$ are bounded on $\KK$, and
\begin{equation}
 \EE a_F(i)=-\frac\beta2,
 \qquad \EE b_F(i)=0,
 \qquad \EE|q_F(i)|^2=\frac{\beta(\beta+1)}4.
 \label{eq:law-moments}
\end{equation}
They also satisfy
\begin{equation}
 q_{T_zF}(w)=q_F(z\cdot w),\qquad z,w\in\HH.
 \label{eq:q-affine-covariance}
\end{equation}
\end{lemma}
```

(b) 推导。取 $\Phi=\mathbf1$ 得 $\mathbb E|Q_F(x+iy)|^2=y^{-\beta}$（`02:245-248`）。逐点恒等式：全纯 $Q$ 满足 $\partial_y Q=iQ'$、$\partial_xQ=Q'$，故

$$\partial_y|Q|^2=2\operatorname{Re}(\overline Q\,\partial_yQ)=2|Q|^2\operatorname{Re}\!\bigl(iQ'/Q\bigr)=\frac{2a_F}{y}|Q|^2$$

因 $iQ'/Q=q/y=a/y+ib/y$；同理 $\partial_x|Q|^2=2|Q|^2\operatorname{Re}(Q'/Q)=2|Q|^2\operatorname{Re}(-iq/y)=\frac{2b_F}{y}|Q|^2$。Laplacian：$\Delta=4\partial\bar\partial$，$\partial\bar\partial(Q\bar Q)=\partial(\overline{Q'})\,$… 标准结果 $\Delta|Q|^2=4|Q'|^2$（`02:262`）。在 $z=i$ 处 $y=1$、$Q_F(i)=1/F'(i)=1$，对 $y^{-\beta}$ 分别取 $\partial_y$、$\partial_x$、$\Delta$ 于 $(0,1)$：左端 $\mathbb E[\partial_y|Q|^2]=2\mathbb Ea_F(i)$，右端 $-\beta y^{-\beta-1}=-\beta$，得 $2\mathbb Ea=-\beta$；$x$ 方向右端为零（$y^{-\beta}$ 与 $x$ 无关），得 $\mathbb Eb=0$；Laplacian 右端 $\beta(\beta+1)y^{-\beta-2}=\beta(\beta+1)$，左端 $4\mathbb E|Q'_F(i)|^2$，而 $|q_F(i)|=|i\cdot1\cdot Q'_F(i)/1|=|Q'_F(i)|$，故 $4\mathbb E|q_F(i)|^2=\beta(\beta+1)$。微分与期望交换的合法性：在 $i$ 的紧邻域上 $Q,Q',Q''$ 对 $\mathcal K$ 一致有界（Lemma 2.2 的 $j$ 阶联合连续性 + 紧性），控制函数存在（`02:249-253`）。等变性：$Q_{T_zF}(w)=Q_F(z\cdot w)/Q_F(z)$ 对 $w$ 求导给 $Q'_{T_zF}(w)=y\,Q_F'(z\cdot w)/Q_F(z)$，配 $\operatorname{Im}(z\cdot w)=y\operatorname{Im}w$，

$$q_{T_zF}(w)=i\eta\frac{Q'_{T_zF}(w)}{Q_{T_zF}(w)}=i\eta\,y\frac{Q_F'}{Q_F}(z\cdot w)=iy\eta\frac{Q_F'}{Q_F}(z\cdot w)=q_F(z\cdot w)\ \checkmark$$

(c) 三个矩值的机械理由。$q$ 定义里那个 $iy$ 因子唯一目的就是等变性 (b) 最后一步：没有它，$w\mapsto Q'(z\cdot w)/Q(z\cdot w)$ 会多带一个 $y$，重基后不闭。$\mathbb Ea=-\beta/2$ 是 $\mathbb E|Q|^2=y^{-\beta}$ 在 $y$ 方向的对数导数，$\mathbb Eb=0$ 是平移不变性（水平协变性 `eq:horizontal-average` 的微分形式），$\mathbb E|q|^2=\beta(\beta+1)/4$ 是次调和量 $|Q|^2$ 的 Laplacian 与二阶矩的对话。这三个数在第 12 节被一起消费：$k^2\mathbb E[J_F(i)]=k(k-1)+(2k-1)\mathbb Ea+\mathbb E|q|^2$，代入 $k=(\beta+3)/4$、$2k-1=(\beta+1)/2$ 后 $(2k-1)\mathbb Ea=-\beta(\beta+1)/4$ 与 $\mathbb E|q|^2$ 精确相消，剩下 $k(k-1)>0$。也就是说后两个矩值的意义就是"必须互相抵消"，这是论文在 `04:58-60` 明说的设计。若 $P$ 的构造方式变了（比如尺度平均用 $[1,3]$ 之类非基本域），$\beta$ 与 $\mathbb E|q|^2$ 的关系会被破坏，相消失败。$q_F(i)$ 的一致有界性来自 $\mathcal K$ 的紧性：它保证第 16 节 $\mathbb E J_{F,\pm}(i)$ 有限，从而那个极限交换合法。

(d) 候选失败路线。路线 1：用 Schwarzian $\{F\}=(F''/F')'-\frac12(F''/F')^2$ 的矩。Shimorin 型乘子范数判据（`00-history:59-62` 提到 Jin 回收的那条）正是这种一阶/二阶组合的范数条件；[推测] 停住点是它给出逐函数充分条件，拿不到与 $f$ 无关的均匀常数，而我们的 $P$ 是给定的整体测度。路线 2：在边界高度 $y\to0$ 处取矩。停住点：$Q,Q',Q''$ 在 $y\to0$ 无一致界（`prelim:strip-bound` 本身就是 $O(1/y)$），微分与期望交换失去控制函数。路线 3：只用一阶矩 $\mathbb Ea=-\beta/2$。停住点：$k^2\mathbb E J=k(k-1)+(2k-1)(-\beta/2)+\mathbb E|q|^2$ 里第三项非负且必须已知，缺一阶以上信息时 $\mathbb E J$ 的符号无法确定，整个矛盾消失。

## 10 势函数、加权面积积分与逃逸迹界（Lemma 4.2 与 4.3）

(a) 逐字引用（`03:18-25` 的势与 `03:54-58`、`03:110-130`）：

```tex
Set
\begin{equation}
 k=\frac{\beta+3}{4}>1,\qquad
 V_\xi^F(x+iy)=\frac{y^k}{|F(x+iy)-\xi|}
 \quad(F\in\KK,\ \xi\in\CC),
 \label{escape:potential}
\end{equation}
with value $+\infty$ at the unique possible point where $F(z)=\xi$.
```

```tex
 S_0=\{z\in\HH:|m(z)|\ge\tfrac12\},\qquad
 I(F)=\int_{S_0}y^{\beta+1}|F(x+iy)|^{-4}\dd A(x+iy).
 \label{escape:weighted-integral}
```

```tex
\begin{lemma}[Weighted inverse area]
\label{lem:weighted-inverse-area}
The function $I:\KK\to[0,\infty]$ is Borel and satisfies
$\EE I(F)\le256\pi$.  In particular, $I(F)<\infty$ almost surely.
\end{lemma}
```

(b) 推导。恒等式（`03:60-71`）：$z\ne i$ 时 $T_zF(z^\#)=\frac{F(z\cdot z^\#)-F(z)}{yF'(z)}=\frac{F(i)-F(z)}{yF'(z)}=-\frac{F(z)Q_F(z)}{y}$（$z\cdot z^\#=i$）。取 $\Phi(H)=|H(z^\#)|^{-4}$，左端 $\mathbb E\bigl[|Q_F(z)|^2\,y^4|F(z)|^{-4}|Q_F(z)|^{-4}\bigr]=y^4\mathbb E[|F'(z)|^2|F(z)|^{-4}]$（因 $|Q|^{-2}=|F'|^2$），右端 $y^{-\beta}\mathbb E|F(z^\#)|^{-4}$，两边除 $y^4$ 得

$$\mathbb E\bigl[|F'(z)|^2|F(z)|^{-4}\bigr]=y^{-\beta-4}\mathbb E|F(z^\#)|^{-4}.\ \checkmark$$

这里要求 $z\ne i$ 且 $F(z)\ne\xi$ 型奇点：被积函数 $|H(z^\#)|^{-4}$ 在 $z^\#$ 处评估，而 $z^\#\ne i$（$z\ne i$），$T_zF(i)=0$ 是它唯一的零点，评估点避开零点故有限（`03:66` 那句 "Both evaluations avoid the unique zero"）。

换元 $(u,Y)=z^\#=(-x/y,1/y)$：Jacobian 矩阵 $\begin{pmatrix}-1/y&x/y^2\\0&-1/y^2\end{pmatrix}$，行列式 $y^{-3}$，即 $dxdy=Y^{-3}du\,dY$（符号取绝对值）。它是对合：两次作用回原值，$u=-x/y$、$Y=1/y$ 再走一次给 $-u/Y=x$、$1/Y=y$ ✓。$|m(z^\#)|^2=\frac{x^2+(y-1)^2}{x^2+(y+1)^2}=|m(z)|^2$ ✓（分子分母互换方向都验证过），所以对合保持 $S_0$。于是 Tonelli 链

$$\mathbb E\int_{S_0}|F'|^2|F|^{-4}dA=\int_{S_0}y^{-\beta-4}\mathbb E|F(z^\#)|^{-4}dxdy=\int_{S_0}Y^{\beta+1}\mathbb E|F(u+iY)|^{-4}du\,dY=\mathbb E I(F)$$

（$y^{-\beta-4}=Y^{\beta+4}$ 乘 $Y^{-3}$ 得 $Y^{\beta+1}$，正是 $I$ 的权）。逐边上界：$F$ 单叶 + 共形换元给 $\int_{S_0}|F'|^2|F|^{-4}dA=\int_{F(S_0)}|w|^{-4}dA$，`prelim:zero-separation` 在 $S_0$ 上给 $|F|\ge1/16$，故 $F(S_0)\subset\{|w|\ge1/16\}$，$\int_{|w|\ge1/16}|w|^{-4}dA=2\pi\int_{1/16}^\infty r^{-3}dr=2\pi\cdot\frac12\cdot16^2=256\pi$ ✓。

Lemma 4.3 的尾部（`03:131-150`）：$R(z)=|x|+y$，$z'\in B(z,y/2)$ 时 $y/2<y'<3y/2$、$R(z)\le|x'|+3y'\le3R(z')$，故这些盘落在 $\{R\ge R(z)/3\}$ 内并最终落入 $S_0$；$1/F$ 在其上全纯，$|1/F|^4$ 次调和（全纯模的偶数次幂次调和），次均值给

$$y^{\beta+3}|F(z)|^{-4}\le C_\beta\int_{S_0\cap\{R\ge R(z)/3\}}(\Im z')^{\beta+1}|F(z')|^{-4}dA(z')\to0,$$

收敛来自单一个可积函数 $I(F)$ 的尾，且关于 $z$ 一致；$4k=\beta+3$ 正是 $k$ 的定义，于是 $\frac{y^k}{|F|}\to0$（`escape:tail`）。高半平面内：$y\ge\varepsilon$ 时 $|F|\to\infty$ 当 $|x|+y\to\infty$，故紧集原像有界且闭（极限点高度 $\ge\varepsilon$、$F$ 连续），在 $\mathbb H$ 内紧；$H_{F,K}=\sup\{\Im z:F(z)\in K\}<\infty$。

迹界（`03:160-193`）是分部积分的干净一手：取 $0\le\psi\in C_c^\infty$、$\psi\ge\mathbf1_K$，$g=\psi\circ F$ 在 $y\ge\varepsilon/2$ 上紧支（刚证的紧性），$h(y)=\int_{\mathbb R}g(x,y)dx$ 光滑、$h,h'$ 在高处为零，$\int g_{xx}dx=0$，故

$$\int_{y>\varepsilon}(y-\varepsilon)\Delta g\,dxdy=\int_\varepsilon^\infty(y-\varepsilon)h''(y)dy=[(y-\varepsilon)h']_\varepsilon^\infty-[h]_\varepsilon^\infty=h(\varepsilon).$$

另一方面 $\Delta(\psi\circ F)=|F'|^2(\Delta\psi)\circ F$（全纯复合的 Laplacian 变换），用 $Y(w)=\operatorname{Im}F^{-1}(w)$ 换元得

$$h(\varepsilon)=\int_{\Omega\cap\{Y>\varepsilon\}}(Y(w)-\varepsilon)\Delta\psi(w)dA(w),$$

取绝对值（注意右端带符号，所以必须取模，这一步我在纸上确认过没有丢符号）并用 $Y\le H_{F,\operatorname{supp}\psi}$：

$$\int_{\mathbb R}\mathbf1_K(F(x+i\varepsilon))dx\le h(\varepsilon)\le H_{F,\operatorname{supp}\psi}\|\Delta\psi\|_{L^1}.$$

(c) 常数的机械理由。$-4$ 这个幂是全节最紧的设计：(i) 它让换元链 $y^{-\beta-4}\cdot Y^{-3}$ 与 $I$ 的权 $Y^{\beta+1}$ 对上，$-\beta-4+3=-\beta-1$… 核对：$y^{-\beta-4}$ 用 $y=1/Y$ 变成 $Y^{\beta+4}$，乘 $Y^{-3}$ 得 $Y^{\beta+1}$ ✓ 完全靠 4 与 3 的差；(ii) 它在无穷远可积（$r^{-4}\cdot r=r^{-3}$），在原点不可积，而 $|F|\ge1/16$ 恰好把原点排除；(iii) 次均值给 $|1/F|^4$，与 $|1/F|^2$ 相比多出的两次幂换来 $\beta+3$ 的加权，才使 $4k=\beta+3$ 与 $k>1$ 兼容。$256\pi$ 完全由 $1/16$ 定，$\pi c^{-4}$ 在 $c=1/16$ 处即 $256\pi$。$\psi$ 的选取只影响 $C_{F,K}$ 的数值，不影响与 $\varepsilon$ 无关这条性质，而后者才是关键（`03:196-200` 特别强调不需要依赖高度的例外集）。$S_0$ 补集的闭包在 $\mathbb H$ 内紧且含唯一零点 $i$（`03:51-52`），这是把 $|m|\ge1/2$ 作为截割面的理由：它同时给 $|F|\ge1/16$ 与"离奇点远"。

路线 3：想用 $|F|\to\infty$ 的更弱版本（例如只在 $x$ 方向）替代整条尾部。停住点：Proposition 4.1 要的是 $|x|+y\to\infty$ 的一致趋零，$x$ 与 $y$ 的耦合恰在 $R(z)\le3R(z')$ 那一步（`03:132-137`）被一次性处理，拆开证要在两个方向各做次均值，$B(z,y/2)$ 的半径选择 $y/2$ 同时控制两个方向，改动它（比如取 $y/4$）只改 $C_\beta$。

## 11 紧正上水平集、witness 胞与 Borel 性（Proposition 4.1 与 Lemma 4.4）

(a) 逐字引用（`03:27-35` 与 `03:257-261`、`03:299-303`）：

```tex
\begin{proposition}[Compact positive superlevels]
\label{prop:proper-superlevels}
For $P$-almost every $F\in\KK$, for planar area-almost every $\xi\in\CC$,
the set
\[
 \{z\in\HH:V_\xi^F(z)\ge\delta\}
\]
is compact in $\HH$ for every $\delta>0$.
\end{proposition}
```

```tex
Their union $E_h$ has area at most
\begin{equation}
 |E_h|\le C_{F,R,\delta}h^{2k-1}.
 \label{escape:target-cover}
\end{equation}
```

```tex
\begin{lemma}[Measurability of compact superlevels]
\label{lem:superlevel-borel}
The set of pairs $(F,\xi)\in\KK\times\CC$ for which every closed positive
superlevel of $V_\xi^F$ is compact in $\HH$ is Borel.
\end{lemma}
```

(b) 推导。固定 $F$（$I(F)<\infty$）、$\Omega=F(\mathbb H)$。高侧：`escape:target-tail` 由 Lemma 4.3 直接得，$y\ge\varepsilon$ 且 $|x|+y\to\infty$ 时 $|F|\to\infty$，故 $|F-\xi|\ge|F|/2$ 最终成立，$V\to0$。小侧只对遗漏目标 $\xi\notin\Omega$ 需要论证：固定 $R,\delta>0$ 与 dyadic $h\le1$，把 $\mathbb R$ 分成半开胞 $I_j=[jh,(j+1)h)$。称 $I_j$ 为 witness 胞，若存在 $x\in I_j$、$h\le y\le2h$、$|\xi|\le R$、$\xi\notin\Omega$ 使 $V_\xi^F(x+iy)\ge\delta$。该 witness 点满足 $|F(z)-\xi|\le y^k/\delta\le(2h)^k/\delta$；$B(z,y)\subset\mathbb H$ 的像遗漏 $\xi$，Koebe 四分之一圆盘（`prelim:quarter`，$R=y$、$z_0=z$）反向使用给 $y|F'(z)|/4\le|F(z)-\xi|$，即 `escape:witness-derivative` 的 $y|F'(z)|\le4(2h)^k/\delta$。对同胞任意 $x'\in I_j$，相对点 $\frac{x'-x}y+i\frac hy\in[-1,1]+i[1/2,1]$（实部 $\le h/y\le1$，虚部 $\in[1/2,1]$），$T_zF$ 在该固定紧集上被公共常数 $M$ 界住（Lemma 2.2），由定义 $F(x'+ih)=F(z)+yF'(z)(T_zF)(\text{rel})$，故

$$|F(x'+ih)-\xi|\le|F(z)-\xi|+y|F'(z)|\cdot M\le(1+4M)(2h)^k/\delta=:C_\delta h^k,$$

其中 $2^k$ 被吸进常数（$k$ 由 $F$ 的 $\beta$ 定，$h\le1$）。于是每个 witness 胞在高度 $h$ 的整段像落在固定盘 $K_{R,\delta}=\{|w|\le R+C_\delta\}$ 内（$|\xi|\le R$ 加上上面那条），由 `escape:trace` 用 $\varepsilon=h$，互不相交、长 $h$ 的胞数 $\le C_{F,R,\delta}/h$。在每个胞的中点像处放半径 $C_\delta h^k$ 的闭盘，这些盘覆盖该尺度下所有被 witness 的目标（$C_\delta h^k$ 那条估计对胞内所有 $x'$ 成立），面积 $|E_h|\le\frac{C}{h}\cdot\pi C_\delta^2h^{2k}=C_{F,R,\delta}h^{2k-1}$。dyadic $h\to0$ 时 $\sum h^{2k-1}$ 收敛（$2k-1>0$），故 $\limsup_nE_{2^{-n}}$ 面积为零。对正整数 $R$ 与 $\delta=1/n$ 取可数并，得每个留下的遗漏目标满足 `escape:small-height`：$\sup_xV_\xi^F(x+iy)\to0$（$y\downarrow0$）。内点目标 $\xi\in\Omega$：取 $a>0$ 使 $\overline B(\xi,a)\subset\Omega$，$F^{-1}$ 连续故 $\overline B(\xi,a)$ 的原像在 $\mathbb H$ 内紧、高度有正下界，低于该界时 $|F-\xi|\ge a$、$V\le y^k/a$，同样成立。合起来：给定 $\delta$，`escape:small-height` 排除所有足够小高度，`escape:target-tail` 排除所有足够大的 $|x|+y$，剩下 $\{V\ge\delta\}=\{|F-\xi|\le(\Im z)^k/\delta\}$ 闭（含可能的极点），落在高度有正下界的有界盒内，故在 $\mathbb H$ 内紧。最后用 Lemma 4.2 把"$I(F)<\infty$"换成概率 1。

Lemma 4.4 的论证：紧穷举 $C_m=\{|x|\le m,\ 1/m\le y\le m\}$，性质等价于"$\forall n\exists m$：$\{V>1/n\}\subset C_m$"。必要性：闭 $1/n$ 上水平集含于某个盒。充分性：给 $\delta$ 取 $1/n<\delta$，则 $\{V\ge\delta\}\subset\{V>1/n\}\subset C_m$。固定 $n,m$ 的包含等价于对所有 $q\in(\mathbb Q+i\mathbb Q)\cap(\mathbb H\setminus C_m)$ 有 $|F(q)-\xi|\ge n(\Im q)^k$：违反发生在一个非空开集里，所以被有理点检测到；每个不等式对参数 $(F,\xi)$ 闭（求值连续），可数测试给出 Borel。

(c) 每个指数与常数的机械理由。$2k-1$ 是"胞数 $\times$ 盘半径平方"的净幂：胞数 $\sim1/h$（一维长度除以胞宽），每盘面积 $\sim h^{2k}$。要 $\sum_{h\text{ dyadic}}h^{2k-1}<\infty$ 只需 $2k-1>0$，即 $k>1/2$；而本文的 $k=(\beta+3)/4>1$，这里有一大段余量，说明这个环节的约束松，真正卡死 $k$ 的是第 12 节那个相消。$C_\delta=(1+4M)$ 里 4 来自 Koebe 四分之一，$M$ 来自 $\mathcal K\times([-1,1]+i[1/2,1])$ 上的公共界；两者都与 $F$ 无关但与 $h$ 无关才是关键。胞宽 $h$ 与高度区间 $[h,2h]$ 同阶的选择是刻意的：它保证相对点的虚部 $\in[1/2,1]$，从而 $M$ 是单一常数；若把高度区间放宽到 $[h,H]$，$M$ 要随 $H/h$ 长，$1/16$ 型界会带进 $h$ 的额外负幂。$S_0$ 的 $|m|\ge\frac12$ 与 $C_m$ 的 $1/m\le y$ 都是同一族穷举的不同截面。

(d) 候选失败路线。路线 1：一步用 Fubini 处理 $(F,\xi)$ 联合零测。停住点：$C_{F,R,\delta}$ 依赖 $F$，先把 $F$ 固定才能取 $\psi$ 与 $M$；联合陈述需要在 $(F,\xi)$ 上的可测选择，正是 Lemma 4.4 补的那块。路线 2：把 witness 盘的半径改成与胞宽同阶的 $Ch$（用 Lipschitz 型论证）。[推测] 停住点：$F$ 在高度 $h$ 的像上无与 $F$ 无关的 Lipschitz 界（$|F'|\ge y^{-1}\cdot$常数下界会发散），只能用 $h^k$ 这种来自势函数本身的尺度。路线 3：直接用参数化 Sard 得到联合几乎处处好，从而跳过 Lemma 4.4。停住点：$\mathcal K$ 是无穷维紧空间，参数化 Sard 需要有限维光滑参数族；$P$ 只是 Borel 概率，没有光滑结构可用（论文在 `03:276` 强调 "only uses finite disk covers for the fixed map $F$"）。

## 12 Jacobian、期望与临界点符号（Lemma 5.1 与 5.2）

(a) 逐字引用（`04:16-25`、`04:29-41`、`04:63-88`）：

```tex
 G_F(z)=F(z)-\frac{iy}{k}F'(z),\qquad z=x+iy.
 \label{eq:critical-map}
```

```tex
\begin{lemma}[Jacobian and its expectation]
\label{lem:jacobian-moments}
For every $F\in\KK$ and $z\in\HH$,
\begin{equation}
 k^2J_F(z)=k(k-1)+(2k-1)a_F(z)+|q_F(z)|^2.
 \label{eq:jacobian-formula}
\end{equation}
The function $F\mapsto J_F(i)$ is bounded and continuous on $\KK$, and
\begin{equation}
 k^2\EE J_F(i)=k(k-1)>0.
 \label{eq:positive-jacobian-mean}
\end{equation}
\end{lemma}
```

```tex
 \Delta\ell=-\frac{k}{y^2},
 \label{eq:negative-laplacian}
```

```tex
 \det\operatorname{Hess}\ell(z)&=-\frac{k^4}{y^4}J_F(z).
 \label{eq:critical-hessian-det}
```

(b) 推导，实 Jacobian 的两列我逐项算过。$F''/F'=iq_F/y$（由 `eq:logarithmic-derivative-variable` 第二个等号）。

$x$ 列：$\partial_xG=F'-\frac{iy}{k}F''=F'\bigl[1-\frac{iy}{k}\cdot\frac{iq}{y}\bigr]=F'(1+q/k)=\frac{F'}{k}(k+q)$ ✓。
$y$ 列：$\partial_yG=iF'-\frac{i}{k}F'-\frac{iy}{k}\cdot iF''=F'\bigl[i-\frac ik+\frac{y}{k}\cdot\frac{iq}{y}\bigr]=F'\cdot\frac{i}{k}(k-1+q)$ ✓。
复向量的实行列式：$\det[u\,v]=\operatorname{Im}(\bar uv)$（写 $u=a+ib$、$v=c+id$，$\operatorname{Im}(\bar uv)=ad-bc$ ✓）。于是

$$\det DG=\operatorname{Im}\Bigl[\overline{\tfrac{F'}{k}(k+q)}\cdot\tfrac{iF'}{k}(k-1+q)\Bigr]=\frac{|F'|^2}{k^2}\operatorname{Im}\bigl[i(k+\bar q)(k-1+q)\bigr].$$

设 $q=a+ib$：$(k+a-ib)(k-1+a+ib)=(k+a)(k-1+a)+b^2+ib$，故 $\operatorname{Re}Z=k(k-1)+(2k-1)a+a^2+b^2$，$\operatorname{Im}Z=b$。乘 $i$ 后取虚部等于取实部，得 $\det DG=\frac{|F'|^2}{k^2}\bigl[k(k-1)+(2k-1)a+|q|^2\bigr]$，除 $|F'|^2$ 即 `eq:jacobian-formula` ✓。取期望，用第 9 节三矩与 $2k-1=(\beta+1)/2$：$(2k-1)\mathbb Ea=-\frac{(\beta+1)\beta}{4}=-\mathbb E|q|^2$，相消，$k^2\mathbb EJ(i)=k(k-1)>0$。$J_F(i)$ 的连续有界来自 $F\mapsto$ 二 jet 的联合连续（Lemma 2.2）与 $F'(i)=1$。

引理 5.2 一侧：在极点外 $\ell=\log V=k\log y-\log|F-\xi|$。$\Delta\ell=k\Delta\log y=\partial_{yy}(k\log y)=-k/y^2$ ✓（$\ell$ 的其余部分调和）。记 $r=F'/(F-\xi)$：$\partial_x\log|F-\xi|=\operatorname{Re}r$、$\partial_y\log|F-\xi|=\operatorname{Re}(ir)=-\operatorname{Im}r$，故 $\ell_x=-\operatorname{Re}r$、$\ell_y=\frac ky+\operatorname{Im}r$ ✓。临界方程 $\operatorname{Re}r=0$ 且 $\operatorname{Im}r=-k/y$，即 $r=-ik/y$，即 $F-\xi=\frac{iy}{k}F'$，即 $G_F(z)=\xi$ ✓，同时给出 `eq:critical-height`：$V=y^k/|F-\xi|=y^k\cdot\frac{k}{y|F'|}=ky^{k-1}|Q_F|$。极点本身解不了这方程：$F=\xi$ 时该式左边为 0、右边 $-\frac{iy}kF'\ne0$ ✓。
Hessian：$\partial_xr=r'$、$\partial_yr=ir'$，故 $\ell_{xx}=-\operatorname{Re}r'$、$\ell_{xy}=-\operatorname{Re}(ir')=\operatorname{Im}r'$、$\ell_{yy}=-\frac{k}{y^2}+\operatorname{Im}(ir')=-\frac{k}{y^2}-\operatorname{Re}r'$。在临界点 $r'=\frac{F''}{F'}r-r^2=\frac{iq}{y}\cdot\frac{-ik}{y}-\bigl(\frac{-ik}{y}\bigr)^2=\frac{kq}{y^2}+\frac{k^2}{y^2}=\frac{k(k+q)}{y^2}$ ✓（$(-i)(-i)=-1$，$\bigl(\frac{-ik}{y}\bigr)^2=-\frac{k^2}{y^2}$）。于是 $\operatorname{Re}r'=\frac{k(k+a)}{y^2}$、$\operatorname{Im}r'=\frac{kb}{y^2}$，代回得 `eq:critical-hessian` 的三个元 ✓。行列式：$\frac{k^2}{y^4}\bigl[-(k+a)(k-1+a)-b^2\bigr]=-\frac{k^2}{y^4}\cdot k^2J=-\frac{k^4}{y^4}J$ ✓。迹 $=\frac{k}{y^2}(-k-a+k-1+a)=-\frac{k}{y^2}<0$ ✓，因此 $\det>0$ 且迹负给两负特征值（严格极大），$\det<0$ 给鞍点；$\operatorname{Hess}V=V\operatorname{Hess}\ell+V(\nabla\ell)(\nabla\ell)^T$，临界点处第二项消失，分类对 $V$ 同样成立 ✓。

(c) 为什么 $k=(\beta+3)/4$ 被唯一钉死。相消条件 $(2k-1)\cdot\frac\beta2=\frac{\beta(\beta+1)}4$ 即 $2k-1=\frac{\beta+1}2$，$k=\frac{\beta+3}4$ 是唯一解；论文在 `03:20` 直接宣告 $k>1$，那是 $\beta>1$ 的翻译，也就是 $\rho>2$ 的翻译。整条正侧矛盾 $k(k-1)>0$ 因此最终追溯到 $\rho>2$ 这一个假设，$k$ 的选取没有自由度。归一化 Jacobian 除 $|F'|^2$ 的理由是等变性（第 13 节 `eq:jacobian-covariance`）：$\det DG$ 与 $|F'|^2$ 在重基下同乘同一个正因子，比值不变；不除则 $J$ 带 $y_0$ 的幂，第 16 节的期望搬运会多出面子的尺度因子。$J_{F,+}$ 与 $J_{F,-}$ 的分工也在这里定了：$J>0$ 是鞍、$J<0$ 是极大，源侧质量从正侧搬到负侧。

(d) 候选失败路线。路线 1：直接对 $V$ ，并非 $\log V$ 做临界分析。停住点：$\operatorname{Hess}V$ 在临界点差一个 $V$ 因子但 $\Delta V$ 没有确定符号（$V$ 含 $y^k$ 与 $|F-\xi|^{-1}$ 两部分，Laplacian 出现 $\ell$ 的梯度项），第 14 节的绕数论证要求 $\Delta\ell<0$ 这种纯号信息。路线 2：把 $\frac{iy}{k}F'$ 换成 $\frac{iy}{k}F'$ 的共轭方向（即 $+\frac{iy}{k}F'$）。停住点：$G_F$ 的 Jacobian 展开里 $(2k-1)a$ 项符号翻转，与 $\mathbb Ea=-\beta/2$ 不再相消，正侧变成 $k(k-1)+(2k-1)\beta+\cdots$ 的其它值。[推测] 论文没有讨论这个符号分叉，我按展开式自己核对，得到的结论是必须取负号才能与 $r=-ik/y$ 的临界方程一致。路线 3：用未归一化的 $\det DG$ 做期望。停住点：第 16 节的换元 $\omega_F= y^{\beta-1}|Q_F|^2$ 与 $J$ 的乘积要求被积量对重基不变（`eq:transport-equivariance` 那个 $\mathbf1_{D_N}(F,z)=\mathbf1_{D_N}(T_zF,i)$），未归一化的量按 $|F'(t)|^2$ 缩放，指标集不再等变。

## 13 好对、Sard 例外与等变性（Definition 5.3 与 Lemma 5.4）

(a) 逐字引用（`04:116-123` 与 `04:125-143`）：

```tex
\begin{definition}
\label{def:good-pair}
A pair $(F,\xi)\in\KK\times\CC$ is \emph{good} if every closed positive
superlevel of $V^F_\xi$ is compact in $\HH$, and $\xi$ is a regular value
of $G_F$.  Thus every solution $G_F(z)=\xi$ must satisfy $J_F(z)\ne0$;
a target with no such solution is regular.  Write $\mathcal G$ for the
set of good pairs.
\end{definition}
```

```tex
\begin{lemma}[Good pairs and affine changes of source]
\label{lem:good-pairs}
The set $\mathcal G$ is Borel.  For $P$-almost every $F$, its section
$\{\xi:(F,\xi)\in\mathcal G\}$ has full planar area measure.
```

(b) 推导。Borel：紧上水平集条件由 Lemma 4.4 给 Borel；正则性失败可写为"存在 $m$ 与 $w\in C_m$ 使 $G_F(w)=\xi$ 且 $J_F(w)=0$"，该集合在 $\mathcal K\times\mathbb C\times C_m$ 内闭（两个连续函数的公共零点集），因 $C_m$ 紧，其在 $\mathcal K\times\mathbb C$ 上的投影闭；对 $m$ 取可数并得闭集并，故例外集 Borel，$\mathcal G$ Borel ✓。这里我特意核对了"$C_m$ 紧"这一步不能省：$\mathbb H$ 非紧，若不截高度与实部，投影一般只解析，并非 Borel。

逐 $F$ 的 Sard：固定紧源盒与稍大的紧盒，$h>0$ 小，用 $O(h^{-2})$ 个边长 $h$ 的方块铺第一个盒。若某方块碰到临界集，取其中一临界点 $w_0$；$DG_{F}(w_0)$ 秩至多 1，Taylor 展开（二阶导在大盒上有界）把该方块像放进一条长 $O(h)$ 线段的 $O(h^2)$ 邻域，面积 $O(h^3)$；全部加起来外测度 $O(h^{-2})\cdot O(h^3)=O(h)\to0$。逐盒穷举 $\mathbb H$ 得临界值集面积零 ✓。与 Proposition 4.1 结合：对 a.e. $F$（$I(F)<\infty$ 且上水平集紧）与 a.e. $\xi$（非临界值），$(F,\xi)$ 好，故截面满面积 ✓。注意量化次序：先逐 $F$ 用 Sard（与 $P$ 无关），再和 $P$-a.e. 的紧性合并，得到一个 $(F,\xi)$ 的乘积满测集，这一步在第 16 节"根的例外目标"里被再次消费。

等变三条。$(T_tF)'(w)=F'(t\cdot w)/F'(t)$（第 6 节算过）。第一条：

$$G_{T_tF}(w)=T_tF(w)-\frac{i\eta}{k}(T_tF)'(w)=\frac{F(t\cdot w)-F(t)}{y_0F'(t)}-\frac{i\eta}{k}\frac{F'(t\cdot w)}{F'(t)}=\frac{G_F(t\cdot w)-F(t)}{y_0F'(t)}$$

因为 $\operatorname{Im}(t\cdot w)=y_0\eta$，$t\cdot w$ 的虚部因子与 $T_tF$ 定义里的 $y_0$ 一致 ✓。第二条：$q_{T_tF}(w)=q_F(t\cdot w)$（第 9 节），再由 `eq:jacobian-formula` 是 $q$ 与 $k$ 的函数得 $J_{T_tF}(w)=J_F(t\cdot w)$ ✓。第三条：$T_tF(w)-\widetilde\xi=\frac{F(t\cdot w)-\xi}{y_0F'(t)}$，故

$$V^{T_tF}_{\widetilde\xi}(w)=\frac{\eta^k}{|T_tF(w)-\widetilde\xi|}=\frac{\eta^k y_0|F'(t)|}{|F(t\cdot w)-\xi|}=y_0^{1-k}|F'(t)|\,V^F_\xi(t\cdot w)\ \checkmark$$

乘子 $y_0^{1-k}|F'(t)|$ 正且不依赖 $w$，所以同一纤维内的 $V$ 大小次序完全保留；源的 $w\mapsto t\cdot w$ 是 $\mathbb H$ 的同胚，目标是可逆相似，两个条件（紧上水平集、正则值）在两个方向都保持 ✓。

(c) 为什么"无解即正则"要写进定义（`04:120-121`）：第 16 节的面积公式在正负两侧都只跑 $\{J_{F,\pm}>0\}$ 的集，如果某个 $\xi$ 连临界点都没有，它自动是好对，配对映射在其上定义域为空，指标 $\mathbf1_{\mathcal G}$ 不会漏掉任何质量；把这种 $\xi$ 判为"坏"会在 `eq:root-exception` 那类论证里凭空造出一块非零例外集。乘子 $y_0^{1-k}$ 的指数值得注意：$1-k<0$，它不依赖 $w$，因此只整体缩放水平，不改变同纤维内次序，这就是为什么第 15 节的秩配对能用。

(d) 候选失败路线。路线 1：用参数化 Sard 一步得到 $(F,\xi)$ 联合满测。停住点：见第 11 节 (d) 路线 3，$\mathcal K$ 无有限维光滑参数结构。路线 2：把"好对"放宽成只要求紧上水平集（不要求正则）。停住点：第 14 节的临界点有限性与绕数求和都靠正则性（隔离 + 非退化），退化临界点使指标不定，计数不等式 `eq:cumulative-critical-count` 失去证明。路线 3：把 $\xi$ 固定成某个特殊值（例如 $-i/k$）来避开 Sard。停住点：这正是第 16 节 Lemma 6.1 处理的对象，一个固定值无法用面积零论证，必须额外搬运算子；而一般目标必须靠 Sard，两者不能互相替代。

## 14 上水平集计数与 Hopf 绕数（Lemma 5.5）

(a) 逐字引用（`04:191-203`）：

```tex
\begin{lemma}[Counting critical points above a level]
\label{lem:critical-count}
Fix a good pair $(F,\xi)$.  There are only finitely many critical points
of $V^F_\xi$ with value at least $h$, for every $h>0$.
For every such $h$,
\begin{equation}
 \#\{\text{maxima with }V^F_\xi\ge h\}
 \ \ge\
 \#\{\text{saddles with }V^F_\xi\ge h\}.
 \label{eq:cumulative-critical-count}
\end{equation}
The possible pole is excluded from the maximum count.
\end{lemma}
```

(b) 推导。有限性：正则性使解 $G_F(z)=\xi$ 隔离（实反演函数定理），解集闭；$\{V\ge h\}$ 紧（`def:good-pair` 的第一条），故计数有限。极点不参与：$F(z_0)=\xi$ 时 $G_F(z_0)-\xi=-\frac{i\operatorname{Im}z_0}kF'(z_0)\ne0$，所以极点周围不会有临界点聚集。

取 $\lambda>0$ 非临界值，$U_\lambda=\{V>\lambda\}$（含极点，若存在）。它开、闭包在 $\mathbb H$ 内紧；边界恰为水平集 $\{V=\lambda\}$：极点是 $U_\lambda$ 内点（$V\to+\infty$），水平点上 $\nabla\ell\ne0$ 给出两侧取值。水平集是紧无边的一维光滑流形，分支有限，每支是光滑正则简单闭曲线：把 $\nabla\ell/|\nabla\ell|$ 旋转 $90^\circ$ 得单位切场，沿它流线（紧 ⇒ 完备），轨道在每支内开 ⇒ 一支即一条轨道；轨道若非周期，其参数化是 $\mathbb R$ 到紧支的一一局部同胚，不可能；回归时间构成 $\mathbb R$ 的闭子群且在 $0$ 附近有间隙，最小正元给出周期参数化 ✓。

Jordan 内部 $D$ 的闭包在 $\mathbb H$ 内：低于 $\gamma$ 的正最小高度的点可以不穿过 $\gamma$ 就连到无穷，故在未界补支里。`eq:jordan-interior-superlevel`（$V>\lambda$ 在整个 $D$ 内）用超调和性证明：若有内点值更小，$\ell$ 在 $D$ 内取到低于边界值 $\log\lambda$ 的内点极小（取极小时可挖掉极点邻域，因 $\ell\to+\infty$），与 $\Delta\ell=-k/y^2<0$（$\ell$ 超调和，极小值原理）矛盾；排除更小值后，内点等值也是局部极小，同样不可能。

于是水平曲线内部互不相交且恰为 $U_\lambda$ 的分支：内嵌曲线被 `eq:jordan-interior-superlevel` 排除；$U_\lambda$ 的每支非空且有边界点（闭包紧），边界点不在 $U_\lambda$ 的开支内故在水平集上，其邻域内正则性 + 内部超水平性质把超水平一侧辨认为该水平曲线的内侧，支因此含住整个 Jordan 内部且不能出去 ⇒ 支数 $C_\lambda$ = 曲线数，且无支带孔。

指标求和：在每条边界的正方向上 $\nabla\ell$ 是内法向、绕数 $+1$。论文在此完整复证 Hopf 割线论证（`04:267-294`）：以左端点起步、正方向参数化 $\gamma:[0,1]\to\mathbb R^2$，初始切向朝下；单位割线 $\frac{\gamma(t)-\gamma(s)}{|\gamma(t)-\gamma(s)|}$ 在闭三角形上连续延拓（对角线取单位切向，$(0,1)$ 取初始切向的负，靠端点展开 $\gamma(t)-\gamma(s)=-((1-t)+s)\gamma'(0)+o((1-t)+s)$），有连续角度提升 $A(s,t)$；沿 $(0,t)$ 割线落在闭右半圆，$A(0,1)-A(0,0)=\pi$；$(t,1)$ 上的割线是 $(0,t)$ 的负，$A(t,1)-A(0,t)=\pi$；合计 $A(1,1)-A(0,0)=2\pi$，即切向总转角 $2\pi$，旋转到内法向不改绕数 ✓。

挖掉临界点与极点的小圆盘后，$X=\nabla\ell$ 在剩余紧光滑域上非零，角形式 $\frac{X_1dX_2-X_2dX_1}{X_1^2+X_2^2}$ 闭，Stokes 给外边界绕数 = 内圈绕数之和。非退化临界点处小圆上 $X$ 同伦到可逆线性部分，指标 $=\operatorname{sign}\det\operatorname{Hess}\ell$，极大 $+1$、鞍 $-1$（第 12 节 `eq:critical-hessian-det`）。极点处 $F-\xi$ 单零点给 $\ell=-\log|z-z_0|+\text{smooth}$、$\nabla\ell=-\frac{z-z_0}{|z-z_0|^2}+O(1)$，负径向主场的绕数也是 $+1$。求和：

$$C_\lambda=\#\{\text{极大}:V>\lambda\}-\#\{\text{鞍}:V>\lambda\}+B,\qquad B\in\{0,1\}.$$

$B=1$ 时该极点属于 $U_\lambda$ 故 $C_\lambda\ge B$；$B=0$ 时不等式自动。于是每个正则正水平上极大不少于鞍。最后对给定 $h$：$\ge h/2$ 的临界点有限，可选正则 $\lambda\in(h/2,h)$ 使 $[\lambda,h)$ 无临界值，则 $>\lambda$ 的计数等于 $\ge h$ 的计数（含并列），得 `eq:cumulative-critical-count`。

(c) 每个环节的机械理由。$B\in\{0,1\}$：$F$ 单叶 ⇒ $F-\xi$ 至多一个零点，而 $V$ 在该点为 $+\infty$ ✓ 论文在 `03:25` 就写明"唯一可能的点"。极点指标必须是 $+1$ 且必须计入 $C_\lambda\ge B$：这两个事实合起来才使不等式右移为 $\ge$；若极点指标是 $-1$，则 $C_\lambda=\#\max-\#\text{saddle}-1$ 允许鞍多一个，配对在第 15 节会在最高秩处失配。$\Delta\ell<0$ 定死了"内侧是超水平"这个方向：换成 $\Delta\ell>0$ 则每支曲线内部是亚水平，$U_\lambda$ 的分支结构完全变样（会变成外区域连通、支数与曲线数脱钩）。挖盘求绕数，并非用 Morse 理论整体恒等式，是因为 $\mathbb H$ 非紧且有奇异点（极点），Morse 求和 $\chi(U_\lambda)=\sum\text{index}$ 需要把 $U_\lambda$ 当作带边流形并算 $\chi$，而这里只要逐分支的局部绕数。$\lambda\in(h/2,h)$ 的存在性用了临界值集零测（正则性 + `lem:good-pairs` 里的 Sard 计数），区间长度 $h/2>0$ 保证可选。

(d) 候选失败路线。路线 1：用梯度流线把每个鞍送到它的下降流极限（一个极大）。停住点：下降流可能停在极点（$V=+\infty$ 是流线的吸引方向？$\nabla\ell$ 指向增大，极点处 $\ell\to+\infty$，故流线可以被极点吸走），那样该鞍不配任何有限极大；而且"逐点流线依赖 ODE 解的连续选择"在 $(F,\xi)$ 参数上给不出论文需要的 Borel 结构。路线 2：用 Morse 不等式或 $\chi$ 计算替代绕数求和。[推测] 停住点：$U_\lambda$ 含 puncture（极点），$\chi$ 需要额外一项，且 $U_\lambda$ 的分支可能多连通；论文已经证明"无孔"，所以绕数法与 $\chi$ 法在此等价，但 $\chi$ 法要把 $\partial U_\lambda$ 的定向与内法向再对一遍，等于重做 Hopf 那段。路线 3：只数极大与鞍的总数（不带水平 $\ge h$ 的累积形式）。停住点：第 15 节的等秩配对需要的是**每个水平上的累积**不等式，否则最高秩的鞍找不到 partner；这正是 `eq:cumulative-critical-count` 与朴素总数不等价的机械差别。

## 15 等秩配对的可测构造（Proposition 5.6）

(a) 逐字引用（`04:345-367`）：

```tex
\begin{proposition}[Measurable equivariant pairing]
\label{prop:critical-pairing}
Let
\[
 \mathcal D=\{(F,z)\in\KK\times\HH:
                  J_F(z)>0,\ (F,G_F(z))\in\mathcal G\}.
\]
There is a Borel map $R:\mathcal D\to\HH$, written $R_F(z)=R(F,z)$,
such that, for every $(F,z)\in\mathcal D$, with $z'=R_F(z)$ and
$\xi=G_F(z)$,
\begin{equation}
 G_F(z')=\xi,\qquad J_F(z')<0,\qquad
 V^F_\xi(z')\ge V^F_\xi(z).
 \label{eq:pairing-guarantees}
\end{equation}
For each fixed $F$, the map $R_F$ is injective on its domain.
It is affine equivariant: if $t\in\HH$ and $(F,t\cdot w)\in\mathcal D$, then
\begin{equation}
 (T_tF,w)\in\mathcal D,\qquad
 R_{T_tF}(w)=t^{\#}\cdot R_F(t\cdot w).
 \label{eq:pairing-covariance}
\end{equation}
\end{proposition}
```

(b) 推导。几何定义：固定好对 $(F,\xi)$，把鞍按 $V$ 降序排、并列时按 $(x,y)$ 字典升序破平；极大单独按同一规则排。每个点的"前驱"有限（前驱值 $\ge$ 它的正值），秩 = 前驱个数。相异点相异秩（若 $p$ 先于 $q$，则 $p$ 的前驱加 $p$ 本身都先于 $q$）；秩 $j$ 出现则 $0,\dots,j-1$ 全出现（有限有序集的前驱集自带全部更小的秩，无论整条纤维有限还是无限）。设鞍秩 $j$、值 $v$：至少有 $j+1$ 个鞍值 $\ge v$，`eq:cumulative-critical-count` 给至少 $j+1$ 个极大值 $\ge v$，它们构成极大序列的前段，故秩 $j$ 的极大存在且值 $\ge v$，把鞍配给它。注入性：纤维内等秩单射；不同纤维（不同 $\xi$）的点互异，故对固定 $F$ 全定义域注入。保证式 (a) 的第 1、2 条来自 `lem:critical-signs` 的符号分类。

Borel 构造。解图 $\Gamma=\{(F,\xi,w):G_F(w)=\xi,\ J_F(w)\ne0\}$。定点 $(F_0,\xi_0,w_0)$ 与可逆实矩阵 $D=DG_{F_0}(w_0)$；由导数在源紧集上对参数的联合连续，存在闭球 $\overline B(w_0,r)\subset\mathbb H$ 与开参数邻域 $U$ 使 $\|I-D^{-1}DG_F(w)\|\le\frac12$（$w\in\overline B$）且 $|D^{-1}(G_F(w_0)-\xi)|<\frac r2$（$(F,\xi)\in U$）。则 $w\mapsto w-D^{-1}(G_F(w)-\xi)$ 把闭球压缩进内部：对 $w\in\overline B$，

$$\bigl|w-D^{-1}(G_F(w)-\xi)-w_0\bigr|\le\tfrac12|w-w_0|+\bigl|D^{-1}(G_F(w_0)-\xi)\bigr|\le\tfrac r2+\tfrac r2=r,$$

严格内部性由 $\le\frac12$ 的 Lipschitz 与 $\frac r2$ 的平移给出；压缩映射原理给唯一不动点，它解 $G_F(w)=\xi$、非奇异，且对参数连续（任取收敛参数列，用球的紧性与不动点唯一性识别每个子列极限）。因此 $\Gamma\cap(U\times B(w_0,r))$ 是一个连续分支的图且在 $\Gamma$ 内开；$\Gamma$ 第二可数 ⇒ 可数分支覆盖 $b_j:U_j\to\mathbb H$。激活规则：分支 $j$ 在参数处激活当且仅当参数 $\in U_j$ 且其值不同于所有更早定义的分支；激活集 Borel（对固定 $j$ 只有有限个更早指标，两支连续映射相等在其开重叠上闭）。每个非奇异根恰属于一个激活分支。

分支上的临界值不用 $F(w)-\xi$ 的除法来算：$H(F,w)=k(\operatorname{Im}w)^{k-1}|Q_F(w)|$ 连续正，在根处等于 $V^F_\xi(w)$（`eq:critical-height`）。$J_F$ 的符号、$H$ 的比较、值相等、坐标字典比较都 Borel；某激活分支在同符号分支中的秩是其激活前驱的 Borel 指标之和，取扩展整数值，在好纤维上有限。"正支与负支秩相等且有限"是可数 Borel 测试；$\mathcal D$ Borel（`lem:good-pairs` + $(F,z)\mapsto(F,G_F(z))$ 连续）；在 $\xi=G_F(z)$ 处再加"正支的值等于 $z$"，恰有一个负支通过等秩测试，取其值即定义 Borel 映射（开集原像 = 可数并的 Borel 测试加上支约束）。

等变性：源仿射 $w\mapsto t\cdot w$ 下，纤维与符号按 `eq:critical-map-covariance`、`eq:jacobian-covariance` 对应；同纤维所有临界高度被同一正数 $y_0^{1-k}|F'(t)|$ 乘（`eq:critical-height-covariance`），次序不变；正实数尺度保持 $(x,y)$ 字典序（含第一坐标相等的情形，因 $x\mapsto x_0+y_0x$ 与 $y\mapsto y_0y$ 都递增）。故两套次序、秩、等秩指派一一对应，`eq:pairing-covariance` 成立，其中 $t^\#$ 是逆仿射。论文强调枚举只用于证可测性，不进入几何定义（`04:468-469`）。

(c) 每个选择的机械理由。破平规则必须是字典序，并非常数扰动：字典序与正仿射 $w\mapsto x_0+y_0w$ 交换（两个坐标各自单调），任何"依赖原点的加权"都会破坏等变性。$H(F,w)$ 的引入是必要的：$V^F_\xi$ 含 $|F(w)-\xi|^{-1}$，在 $\xi=G_F(w)$ 处 $F(w)-\xi=\frac{iy}kF'(w)\ne0$ 但把它写成参数函数会引入除法与支的耦合；`eq:critical-height` 给出无除法的表达式，使比较函数连续。秩配对给出的不只是"存在某个极大 $\ge$ 该鞍"，是**单射**指派，这是第 16 节能对目标纤维求和后仍保持不等式的原因（否则多个鞍可能挤到同一极大，质量重复计算）。$\mathcal D$ 的定义用 $(F,G_F(z))\in\mathcal G$ ，并非 $(F,z)$ 的某个局部性质：保证整条纤维好，从而 `eq:cumulative-critical-count` 可用。

(d) 候选失败路线。路线 1：直接用 Kuratowski–Ryll 可测选择定理从紧纤维选 partner。停住点：选择器依赖给定的可数基与选择规则，等变性 (b) 最后一段完全失效，第 16 节 $\mathbf1_{D_N}(F,z)=\mathbf1_{D_N}(T_zF,i)$ 无法成立。路线 2：用 Lusin–Novikov 统一化（论文 `04:393-396` 只把它作为背景引用 4F.6/4F.17）。[推测] 停住点：它给可测支而分支需要连续，连续支是 $H$ 比较与"两支相等是闭条件"的前提；论文自证的压缩映射分支正好给连续。路线 3：把鞍配给"最近的"或"同分支内唯一"的极大。停住点：$V(z')\ge V(z)$ 没有保证，而第 16 节的不等式 `eq:transport-box` 完全依赖 $(V/k)^4$ 这个权重在配对下单调不减（`04:472-481` 那句 "the pairing increases the weight"）。

## 16 分支面积公式、根例外与传输界（Lemma 6.1 与 Proposition 6.2）

(a) 逐字引用（`05:12-15`、`05:32-38`、`05:48-58`、`05:142-144`）：

```tex
 J_{F,+}=\max(J_F,0),\qquad J_{F,-}=\max(-J_F,0),\qquad
 \omega_F(x+iy)=y^{\beta-1}|Q_F(x+iy)|^2.
```

```tex
 \int_{\HH}\omega_F(z)J_{F,\pm}(z)h(z)\dd A(z)
 =
 \int_{\CC}
 \sum_{\substack{G_F(z)=\xi\\ \pm J_F(z)>0}}
 y^{\beta-1}|Q_F(z)|^4h(z)\dd A(\xi).
 \label{eq:transport-area}
```

```tex
\begin{lemma}[Exceptional targets at the root]\label{lem:root-exception}
 ...
  \EE\!\left[
   J_{F,+}(i)\,
   \mathbf 1_{\{(F,-i/k)\notin\mathcal G\}}
  \right]=0.
 \end{equation}
\end{lemma}
```

```tex
\begin{proposition}[Transfer bound]\label{prop:transfer-bound}
 The dyadic transfer operator satisfies $\rho\leq2$.
\end{proposition}
```

(b) 推导。面积公式的合法性（`05:20-42`）：$\{J_F>0\}$ 开，被可数个 $G_F$ 微分同胚图覆盖，去重后得 Borel 片 $E_j$，每片上 $G_F$ 单射、像 Borel；逐片标准面积公式 + Tonelli 汇成"对原像求和"的形式，无需 $G_F$ 整体单射或原像数有限。因子来源：$|\det DG_F|=|F'|^2|J_F|$（第 12 节），除以绝对 Jacobian 后从 $J$ 中拿掉 $|F'|^2$、再乘 $|Q_F|^2=|F'|^{-2}$，故源侧 $\omega J_\pm h$、目标侧 $y^{\beta-1}|Q_F|^4h$ ✓。在根（$G_F(z)=\xi$）处 `eq:transport-target-weight`：$4(k-1)=\beta-1$（$4k=\beta+3$ ✓）使 $y^{\beta-1}|Q|^4=(y^{k-1}|Q|)^4=(V/k)^4$（用 `eq:critical-height`）✓。

根例外：$\xi=-i/k$ 是 $G_F(i)$ 的固定值（归一化），不能直接用逐 $F$ 的面积零截面。令 $\Phi(F)=J_{F,+}(i)\mathbf1_{\{(F,-i/k)\notin\mathcal G\}}$。等变性给 $\Phi(T_zF)=J_{F,+}(z)\mathbf1_{\{(F,G_F(z))\notin\mathcal G\}}$（用 $J_{T_zF}(i)=J_F(z)$，因 $z=z\cdot i$，以及 $\widetilde\xi=(G_F(z)-F(z))/(yF'(z))$ 与好性等价）。取 $h=\mathbf1_{B_0}\mathbf1_{\{\ldots\}}$（$B_0=\{|x|\le1,1\le y\le2\}$）代入 `eq:transport-area`：目标积分支撑在坏 $\xi$ 的集合上，而对 a.e. $F$ 该集合面积零（`lem:good-pairs`），故 `eq:exception-box` 左端为 0。取期望并用协变性：$\mathbb E[\omega_F(z)\Phi(T_zF)]=y^{\beta-1}y^{-\beta}\mathbb E\Phi=y^{-1}\mathbb E\Phi$；Tonelli 给 $0=\int_{B_0}y^{-1}dxdy\cdot\mathbb E\Phi=2\log2\cdot\mathbb E\Phi$，故 $\mathbb E\Phi=0$ ✓（$\int_{B_0}y^{-1}dA=2\cdot\log 2$，宽 $2$、$\int_1^2dy/y=\log2$）。

传输界：$D_N$ 由位移条件 `eq:transport-displacement`（$1/N\le y'/y\le N$、$|x'-x|\le Ny$）定义，$R_F$ 的 Borel 性使其 Borel；等变性给 `eq:transport-equivariance`；$D_N\uparrow$ 且每个好目标鞍落入某个 $D_N$（坐标有限、高度为正）。$z\in B_{R,Y}$ 且 $(F,z)\in D_N$ 时 $R_F(z)\in B'_{R,Y,N}$（$|x'|\le R+NY$、$y'\in[1/N,NY]$）✓。配对单射 + 值不减 + `(V/k)^4` 权重，两侧用 `eq:transport-area` 展开并逐项比较，得 `eq:transport-box` $\int_{B_{R,Y}}\omega J_{+}\mathbf1_{D_N}dA\le\int_{B'_{R,Y,N}}\omega J_{-}dA$（该不等式逐 $F$ 成立，左端只挑配对有定义的纤维）。取期望，用协变性把源密度换成 $dxdy/y$（第 8 节那条 $\mathbb E[\omega_F(z)\Phi(T_zF)]=y^{-1}\mathbb E\Phi$）：

$$2R\log Y\cdot\mathbb E[J_{F,+}(i)\mathbf1_{D_N}(F,i)]\le2(R+NY)\log(N^2Y)\cdot\mathbb E J_{F,-}(i)$$

（$\int_{B_{R,Y}}dxdy/y=2R\log Y$、$\int_{B'_{R,Y,N}}=2(R+NY)\log(N^2Y)$，因 $\int_{1/N}^{NY}dy/y=\log(N^2Y)$ ✓）。固定 $N$，取 $R=Y^2$，$Y\to\infty$：右左系数比 $(1+N/Y)(1+2\log N/\log Y)\to1$；除以 $2R\log Y$ 得 $\mathbb E[J_{+}(i)\mathbf1_{D_N}(i)]\le\mathbb E J_{-}(i)$。$N\to\infty$ 单调收敛穷尽好目标鞍，`lem:root-exception` 结算剩余正 $J$ 质量，得 $\mathbb E J_{F,+}(i)\le\mathbb E J_{F,-}(i)$，即 $\mathbb E J_F(i)\le0$。与 `eq:positive-jacobian-mean` 矛盾（$k^2\mathbb E J=k(k-1)>0$），故 $\rho\le2$。根量的可积性：$q_F(i)$ 在紧类上一致有界，$J_F(i)$ 是该 2-jet 的固定二次式（`05:163-165`），故 $\mathbb E J_{F,\pm}(i)<\infty$，极限交换合法。

(c) 各环节的机械理由。$\omega_F=y^{\beta-1}|Q_F|^2$ 的指数 $\beta-1$ 与 $(V/k)^4$ 的 4 次幂是同一个恒等式 $4(k-1)=\beta-1$，改动 $\beta$ 的定义（比如把 $\beta=\log_2\rho$ 换成 $\log_4\rho$）会同时破坏第 12 节的矩相消与这里的权重匹配，两处不能各自独立调。盒子的纵横选择 $R=Y^2$：$R$ 需比 $NY$ 长得快（边界成本 $NY/R\to0$），而 $\log$ 因子只需 $Y\to\infty$；$R=Y^2$ 是同时满足两式的最省做法。测度 $dxdy/y$ 是仿射群的水平不变 Haar 型测度，盒子按 $y\in[1,Y]$、$x\in[-R,R]$ 取正好让期望搬运算子给出 $2R\log Y$ 这种可因式分解的表达式；换成圆盘或立方体会让边界膨胀率与体积累率之比不趋 1。$D_N$ 的双边位移条件（高度比与横向位移都以 $N$ 为界）保证 $B'$ 只依赖 $N$，若只约束 $y'/y$ 不约束 $|x'-x|$，右盒的 $x$ 半径无限，比较失去意义。$B_0$ 的取法（$1\le y\le2$、$|x|\le1$）只需 $\int_{B_0}y^{-1}dA>0$ 有限，任何这样的盒都给同样的结论。

(d) 候选失败路线。路线 1：对 $G_F$ 做全局单叶换元。停住点：$G_F$ 一般多对多，`05:40-42` 明说"no global injectivity of $G_F$ or finite total number of preimages is required"，全局换元不成立；分支化 + 求和是必需的。路线 2：跳过根例外引理，直接在 $\xi=-i/k$ 上用面积零论证。停住点：单点的面积是 0，"a.e. $\xi$" 的截面完全不排除它，必须靠 $\mathbf1_{B_0}$ 的搬运把逐点信息从测度零集上抬出来（这一步我在纸上确认过：没有 `lem:root-exception`，$\mathbb E J_{F,+}(i)$ 里可能混入非零的坏纤维质量）。路线 3：想让 $\mathbb E J\le0$ 与 $\mathbb E J>0$ 的矛盾只用一阶矩。[推测] 停住点：矛盾的正侧来自 $k(k-1)$，即 $\beta>1$，而 $J$ 的源侧上界只给非正号；若换成 $\rho\le2$ 的等价陈述 $\beta\le1$，$k\le1$ 时 $k(k-1)\le0$，矛盾自动消失，这解释了为什么反设必须严格 $>2$ 而结论必须容许 $\rho=2$（边界情形走 $\lambda=2^{1+\varepsilon}$，见第 7 节）。

## 17 面积指数、端点谱锐性与 Sobolev 表述（§7 与 Corollary 1.2）

(a) 逐字引用（`06:47-58`、`06:184-189`、`06:265-275`）：

```tex
\begin{corollary}[The full negative linear tail]\label{cor:negative-linear-tail}
For every real $t\leq-2$ and every $\epsilon>0$, there is
$C_{t,\epsilon}<\infty$ such that
\begin{equation}\label{eq:negative-linear-tail}
 M_t[f'](r)\leq C_{t,\epsilon}(1-r)^{-(|t|-1)-\epsilon}
 \qquad\left(f\in\SSS,\ \frac12\leq r<1\right).
\end{equation}
Consequently,
\[
 B_{\SSS}(t)=|t|-1\qquad(t\leq-2).
\]
\end{corollary}
```

```tex
\begin{lemma}[Positive derivative powers]\label{lem:positive-derivative-powers}
 For every $f\in\SSS$ and $0<t<2/3$,
 \[
  \int_{\DD}|f'(z)|^t\dd A(z)<\infty.
 \]
\end{lemma}
```

```tex
\begin{corollary}[Homogeneous Sobolev pullback]\label{cor:sobolev-pullback}
 ...
 $\varphi:\Omega\to\DD$ be a
 conformal bijection. For $2<p<\infty$ and $4/3<s<4$, put
 $q=ps/(p+s-2)$. Then pullback $\varphi^*u=u\circ\varphi$ is bounded
 from $L_p^1(\DD)$ to $L_q^1(\Omega)$.
```

(b) 推导。$B_{\mathcal S}(-2)=1$：$\rho\le2$ + Proposition 2.4 给上界 $\beta_f(-2)\le1$；Koebe 下界用 $|1+z|\le2\delta$、$|1-z|\ge1$ 在 $|\theta|\le\delta$ 弧上，$M_{-2}\ge\frac1{2\pi}\int_{-\delta}^{\delta}\frac{d\theta}{4\delta^2}=\frac1{4\pi\delta}$，故指数不能小于 1。

负线性尾：$a=|t|-2\ge0$，$|f'|^t=|f'|^{-2}|f'|^{-a}\le\bigl(\frac{(1+r)^3}{1-r}\bigr)^a|f'|^{-2}$（用 distortion 下界），积均值给 $M_t\le8^aC_\varepsilon(1-r)^{-(a+1)-\varepsilon}$，$a+1=|t|-1$ ✓，常数 $C_{t,\varepsilon}=8^{|t|-2}C_\varepsilon$。Koebe 下界在同一条弧上 $|f'_{\mathrm K}|\le2\delta$，$M_t\ge\frac1{2\pi}\int_{-\delta}^{\delta}(2\delta)^{-|t|}d\theta=\frac{2^{-|t|}}{\pi}\delta^{1-|t|}$ ✓。

$-2<t<0$：$q=-t/2\in(0,1)$，概率圆上的幂平均 $M_t=M_{-2}^{\,q}$ 一侧给 $M_t\le M_{-2}^q\le C_\varepsilon^q(1-r)^{-q(1+\varepsilon)}$，取 $\varepsilon<1/q-1$ 使 $q(1+\varepsilon)<1$，则 $\int_0^1rM_t(r)dr<\infty$ ✓。$t=0$ 给面积 $\pi$。

$L^p$ 正幂（Lemma 7.2）：零点外 $\Delta|f|^p=p^2|f|^{p-2}|f'|^2$，Green 径向均值恒等式（对数核）把圆周均值换成面积分；零点处用环形域上的 Green 定理，内圆均值 $O(\delta^p)$、其导数 $O(\delta^{p-1})$（$f(z)=z+O(z^2)$），内项 $O(\delta^p(1+|\log\delta|))\to0$。分两段：$|z|\le1/2$ 用 $|f|\ge c|z|$、$|f'|\le C$（$p-2<0$ 反向），得 $\int_0^{1/2}u^{p-1}\log(1/u)du<\infty$ ⟺ $p>0$；$|z|>1/2$ 用生长界 $|f|\le|z|/(1-|z|)^2$ 推 $(1-|z|)\le|f|^{-1/2}$，换元 $w=f(z)$ 得 $\int_{\mathbb C}|w|^{p-2}\min\{1,|w|^{-1/2}\}dA=2\pi(\int_0^1u^{p-1}du+\int_1^\infty u^{p-3/2}du)<\infty$ ⟺ $p>0$ 且 $p<1/2$ ✓。第二问：$0\le a<1$ 选 $\max\{0,a-\frac12\}<p<\frac12$，$a\le p$ 用幂平均，$a>p$ 用 $\bigl(\max_{|z|=r}|f|\bigr)^{a-p}\le(1-r)^{-2(a-p)}$，均值界为 $C(1-r)^{-2(a-p)_+}$，径向可积 ⟺ $2(a-p)_+<1$ ⟺ $p>a-\frac12$ ✓（正是那个下界）。

正导数幂（Lemma 7.3）：选 $0<\eta<2/t-3$（非空 ⟺ $t<2/3$ ✓ 这就是 $2/3$ 的出处），$a=\frac{(2+\eta)t}{2-t}\in(0,1)$（$a<1$ ⟺ $t(3+\eta)<2$ ✓ 同一条不等式）；$u_\eta=|f'|^2(1+|f|)^{-2-\eta}$，单叶共形换元给 $\int_{\mathbb D}u_\eta dA=\int_{f(\mathbb D)}(1+|w|)^{-2-\eta}dA\le\frac{2\pi}{\eta(1+\eta)}$（全平面极积分 $2\pi\int_0^\infty\rho(1+\rho)^{-2-\eta}d\rho=2\pi B(2,\eta)=\frac{2\pi}{\eta(1+\eta)}$）；精确分解 $|f'|^t=u_\eta^{t/2}\bigl((1+|f|)^a\bigr)^{(2-t)/2}$（指数核对：$-\frac{(2+\eta)t}2+\frac{a(2-t)}2=-\frac{(2+\eta)t}2+\frac{(2+\eta)t}2=0$ ✓），配指数 $2/t$ 与 $2/(2-t)$ 的 Hölder 与 Lemma 7.2 收工。

区域侧与端点锐性：$\int_W|\varphi'|^sdA=\int_{\mathbb D}|f'|^{2-s}dA$ 对被积非负函数无论有限与否都成立，$4/3<s<4\iff-2<2-s<2/3$ ✓。任意单叶 $f$ 归一化 $g=(f-f(0))/f'(0)\in\mathcal S$，乘子 $|f'(0)|^t$ 有限正 ✓。圆盘与区域表述范围等价：单叶圆盘像真包含于 $\mathbb C$（否则逆是有界非常全纯函数），球面边界至多一点时该像是球面去掉至多一点后的非空既开既闭子集，与"真平面区域"矛盾 ✓。Sobolev 推论按 Gol'dshtein 和 Ukhlov 的等价定理套用：$1<q<p$ 且 $(p-2)q/(p-q)=s$（$p-q=\frac{p(p-2)}{p+s-2}$ 代入验证 ✓）。端点逐点等价：$|f'|^{-2+\eta}$ 次调和（$f'$ 无零点）⇒ 圆周均值单调不减 ⇒ 面积有限给 $M_{-2+\eta}(r)\le C_{f,\eta}(1-r)^{-1}$；乘 $\sup|f'|^{-\eta}\le C_\eta(1-r)^{-\eta}$ 得 $M_{-2}(r)\le C'_{f,\eta}(1-r)^{-1-\eta}$，$\eta\downarrow0$ 得 $\beta_f(-2)\le1$ ✓。Koebe 锐性（`06:313-337`）：$|f'_{\mathrm K}(-1+w)|\asymp|w|$、$|f'_{\mathrm K}(1-w)|\asymp|w|^{-3}$，扇形 $\{0<|w|<\frac12,|\arg w|<\frac\pi3\}$ 在两种替换下都在 $\mathbb D$ 内（$|z|^2=1-2\operatorname{Re}w+|w|^2<1\iff|w|^2<2\operatorname{Re}w$ ✓），两侧各控制 $\int_0^{1/2}u^{-2}u\,du=\infty$；$t=-2$ 在 $-1$ 附近、$t=2/3$ 在 $1$ 附近，更一般地对 $t\le-2$ 与 $t\ge2/3$ 发散。

(c) 每个常数的机械理由。$2/3$ 与 $-2$ 是同一个论证的两端：$-2$ 卡在第 2 节（逐点法封顶）与第 17 节的 Koebe 扇形发散，$2/3$ 卡在 $\eta>0$ 的可解性 $2/t>3$，即 Hölder 指数 $2/t$ 与 $2/(2-t)$ 必须配对且 $(1+|f|)^a$ 可积要 $a<1$。$8^a$ 来自 $(1+r)^{3a}\le2^{3a}$。$\frac{2\pi}{\eta(1+\eta)}$ 是全平面上的 Beta 积分，$\eta\to0$ 时发散，正是 $t\to2/3^-$ 的边界行为。$8^{|t|-2}C_\varepsilon$ 里 $|t|-2$ 的指数差是 distortion 的 3 次幂与 $\delta^{-1}$ 的净结果，尾 $|t|-1$ 的 $-1$ 来自 Koebe 扇形宽度 $\delta$ 的补偿。

(d) 候选失败路线。路线 1：用 $M_{-2}$ 的均匀界直接令 $\varepsilon=0$。停住点：$\int_0^1(1-r)^{-1}dr$ 发散，且 Koebe 的 $\frac1{4\pi\delta}$ 使 $M_{-2}\asymp\delta^{-1}$ 逐 map 可达，$\varepsilon$ 不可去（论文 `00-introduction:77-79` 明说径向指数 1 与面积在 $t=-2$ 的发散兼容）。路线 2：正幂用 Besicovitch 型或 Hardy 空间理论。[推测] 停住点：那条路一般给 $t<1$ 量级的结果，且需要 $f'$ 的边界分布；论文的 $u_\eta$ 加权面积是初等且刚好到达 $2/3$ 的构造，瓶颈在 $(1+|f|)^a$ 的可积性 $a<1$。路线 3：想在 Lemma 7.2 里取 $p\ge1/2$。停住点：$\int_1^\infty u^{p-3/2}du$ 发散（$p-3/2\ge-1$），而 $a$-段要求 $p>a-\frac12$，两者合起来给 $a<1$；把 $1/2$ 改掉直接改写可行 $a$ 的范围，也就是改写后续 $2/3$。

## 18 常数与参数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $s$ 区间 | $4/3<s<4$（开） | `00-introduction:11`、`00-introduction:66` | 与 $t=2-s$ 互换，Thm 1.1 第三 conjunct | 闭端点被 Koebe 反例否掉，`06:313-337` 的发散直接推翻新陈述 |
| $t$ 区间 | $-2<t<2/3$ | `00-introduction:71`、`06:221-245` | 面积可积性主陈述 | 上端由 $\eta<2/t-3$ 可解性定，见 `06:192`，改即断 Lemma 7.3 |
| $M_{-2}[f'](r)$ 界 | $C_\varepsilon(1-r)^{-1-\varepsilon}$ | `01:241-245`、`06:17-20` | Cor 7.1、Hölder `06:89-94`、谱上界 | 去掉 $\varepsilon$ 则 $\int rM\,dr$ 对数发散 |
| $B_{\mathcal S}(-2)$ | $1$ | `00-introduction:59` | Thm 1.1 第二 conjunct、`06:286-311` 等价 | 与 Koebe 下界 $1/(4\pi\delta)$ 冲突，`06:37-44` |
| $\rho$ | $\lim\lVert L^n\rvert ^{1/n}\in[1,4]$，需证 $\le2$ | `01:175-184`、`05:142-193` | Prop 2.4 的前提 | $\rho>2$ 时第 8 至 16 节整体反证  |
| $\beta$ | $\log_2\rho>1$ | `02:18` | $k$、$y^{-\beta}$、$\omega_F$、矩 | $\beta\le1$ 则 $k\le1$、`eq:positive-jacobian-mean` 失正 |
| $k$ | $(\beta+3)/4$，唯一由相消定 | `03:20`、`04:58` | $V_\xi^F$、$G_F$、$k(k-1)$、$4(k-1)=\beta-1$ | 改即断 Jacobian 与权重匹配（见 (c) 两处） |
| $v_n,u_{n,j}$ | $2^{-n}$、$-1+(2j+1)2^{-n}$ | `01:168-174` | $L^n=v_n\sum A$、Prop 2.4 的格胞 | 非 dyadic 网格破坏 $A_zA_w=A_{z\cdot w}$ 的字展开 |
| $\lVert L^n\rvert $ 先验 | $1\le\lVert L^n\rvert \le625\cdot4^n$ | `01:215-220` | $\rho$ 的存在与 $1\le\rho\le4$ | 无此界则 $\rho$ 可能无穷、预解式不收敛  |
| $25/y$（$C_0=1$） | $\lvert Q_F\rvert \le(C_0^2+4)^2/y$ | `01:76-80` | $625=25^2$ 的上界 | 常数放大只改 $\lVert L^n\rvert $ 前置常数  |
| $64/y$（$C_0=2$） | 同上取 $C_0=2$ | `01:81`、`02:115-121` | 水平周期 $C(2/\rho)^n\to0$ | 无 $O(1/y)$ 型界则周期消元失败 |
| $1/16$ | $\lVert F\rvert \ge1/16$ 当 $\lVert m(z)\rvert \ge1/2$ | `01:82-86`、`03:85-92` | $256\pi=\pi(1/16)^{-4}$、$w\mapsto$ 覆盖 | 改成 $c$ 则界成 $\pi c^{-4}$，一路传到尾部论证  |
| $256\pi$ | $\mathbb E I(F)$ 上界 | `03:56-57`、`03:90` | 推 $I(F)<\infty$ a.s.，进而 Prop 4.1 | 有限性是 a.s. 结论的全部依据 |
| $-4$ 幂与 $\beta+1$ 权 | $I(F)=\int_{S_0}y^{\beta+1}\lVert F\rvert ^{-4}dA$ | `03:46-49` | 对合换元 $y^{-\beta-4}\cdot Y^{-3}$ | 幂改 $-2$ 则无穷远发散（见 §10 (d)）  |
| $S_0$ | $\{\lVert m\rvert \ge\frac12\}$ | `03:47` | 与 $1/16$、$C_m$ 穷举对齐 | 阈值改成 $<1/7$ 会含零点 $i$  |
| $C_\beta$、$4k=\beta+3$ | 尾部 $y^k/\lVert F\rvert \to0$ | `03:140-150` | Prop 4.1 的高侧逃逸 | 失去一致趋零则上水平集不紧  |
| $C_{F,K}$（迹界） | 与 $\varepsilon$ 无关 | `03:125-130`、`03:186-193` | witness 胞计数 $\le C/h$ | 依赖 $\varepsilon$ 则 $h^{2k-1}$ 求和失效 |
| $C_\delta=(1+4M)$ | $4$ 来自 Koebe 四分之一 | `03:240-246` | 目标盘半径 $C_\delta h^k$ | $M$ 变为随 $h$ 发散则 $2k-1$ 修正 |
| $h^{2k-1}$ | 面积和收敛条件 $k>1/2$ | `03:257-263` | $\limsup$ 集零测 | $k\le1/2$ 时不收敛（本文 $k>1$ 有余量） |
| $\mathbb Ea_F(i)$ | $-\beta/2$ | `02:231` | Jacobian 相消 `(2k-1)a` 项 | 改即断 `eq:positive-jacobian-mean` |
| $\mathbb Eb_F(i)$ | $0$ | `02:232` | $x$ 方向一阶信息（水平不变性微分） | [推测] 本篇只在 Jacobian 中未直接消费 $b$ 的一阶矩，删去不影响主链 |
| $\mathbb E\lVert q\rvert ^2$ | $\beta(\beta+1)/4$ | `02:233` | 与 $(2k-1)\beta/2$ 精确相消 | 由 $\Delta\lVert Q\rvert ^2=4\lVert Q'\rvert ^2$ 定，改动需重算 Laplacian  |
| $k^2\mathbb E J_F(i)$ | $k(k-1)>0$ | `04:38` | Prop 6.2 矛盾的正侧 | $k\le1$ 时非正，矛盾消失 |
| $V_\xi^F$ | $y^k/\lVert F-\xi\rvert $，极点 $+\infty$ | `03:20-25` | 临界方程、配对、传输权重 | 定义改动牵动 $G_F$、$H(F,w)$、$(V/k)^4$  |
| $G_F$ | $F-\frac{iy}{k}F'$，$G_F(i)=-i/k$ | `04:16-20` | 临界点、Sard、根例外 | 固定根目标值随归一化变，Lemma 6.1 需重写 |
| $J_F$ | $\det DG_F/\lVert F'\rvert ^2$ | `04:22-25` | 符号分类、等变性、$\mathbf1_{D_N}$ | 不除 $\lVert F'\rvert ^2$ 则指标集不等变  |
| $B\in\{0,1\}$ | 极点指标 $+1$ | `04:310-326` | $C_\lambda\ge B$ 给计数不等式 | 指标符号翻转则极大可少一个 |
| $\lambda\in(h/2,h)$ | 正则水平可选 | `04:332-336` | 累积计数与并列处理 | 无可选正则值则 $\ge h$ 形式失败 |
| $H(F,w)$ | $k(\operatorname{Im}w)^{k-1}\lVert Q_F(w)\rvert $ | `04:438-442` | 分支上无除法的临界值比较 | 用 $V$ 直接算需在根处除法，连续性断  |
| $\omega_F$ | $y^{\beta-1}\lVert Q_F\rvert ^2$ | `05:12-15` | 面积公式、期望换 $dxdy/y$ | 与 $4(k-1)=\beta-1$ 同时失效  |
| $D_N$ 位移 | $1/N\le y'/y\le N$，$\lVert x'-x\rvert \le Ny$ | `05:100-105` | 右盒 $B'$、等变指标 | 缺横向界则右盒无限，比较无意义  |
| $B_{R,Y}$、$B'_{R,Y,N}$ | $2R\log Y$ 对 $2(R+NY)\log(N^2Y)$ | `05:115-119`、`05:157-161` | 极限比 $\to1$ | 取 $R$ 不快于 $Y$ 则比不趋 1 |
| $R=Y^2$，$N$ 固定 | 边界成本 $(1+N/Y)(1+2\log N/\log Y)$ | `05:167-172` | 消去右盒放大 | 若 $N$ 随 $Y$ 增长则失去 $\to1$ |
| $2\log2$（$B_0$） | $\int_{B_0}dxdy/y$ | `05:93-94` | 根例外 $\mathbb E\Phi=0$ | 盒测度为 $0$ 时该论证退化 |
| $8^{\lVert t\rvert -2}$ | $C_{t,\varepsilon}=8^{\lVert t\rvert -2}C_\varepsilon$ | `06:66-71` | 负线性尾 | 来自 $(1+r)^{3a}\le8^a$，改 distortion 形式即改  |
| $\lVert t\rvert -1$ | 尾指数 | `06:51`、`06:84` | Cor 7.1 与 Carleson 和 Makarov 的已知尾对齐 | Koebe 下界 $\delta^{1-\lVert t\rvert }$ 锁死  |
| $q=-t/2$、$\varepsilon<1/q-1$ | Hölder 指数与损失 | `06:87-96` | $-2<t<0$ 面积可积 | $q\ge1$（即 $t\le-2$）时方向反，不可积 |
| $\eta$、$a=\frac{(2+\eta)t}{2-t}$ | $0<\eta<2/t-3$，$a\in(0,1)$ | `06:192-196` | Lemma 7.3 的 Hölder 与 $2/3$ 端点 | $t\ge2/3$ 时无 $\eta$ 可取 |
| $\frac{2\pi}{\eta(1+\eta)}$ | 全平面极积分 | `06:198-203` | $u_\eta$ 的界 | $\eta\to0$ 发散，正对应 $t\to2/3^-$ |
| $p\in(0,1/2)$ | Lemma 7.2 的范围 | `06:111-163` | $a<1$ 与正幂链 | $p\ge1/2$ 时 $\int_1^\infty u^{p-3/2}$ 散 |
| $2(a-p)_+<1$ | 径向可积条件 | `06:179-181` | $(1+\lVert f\rvert )^a$ 面积有限 | 违反则 Lemma 7.3 第二因子无穷  |
| $q=ps/(p+s-2)$ | $1<q<p$、$(p-2)q/(p-q)=s$ | `06:269-283` | Sobolev 推论（Gol'dshtein 和 Ukhlov 口径） | 论文未追踪该式在 Sobolev 空间的其它等价 |

依赖链一句话版：$\varepsilon$ 与 $C_\varepsilon$ 活在最外层，$2$ 是 $\rho$ 的阈值（一次出现在 Prop 2.4 的 $\lambda=2^{1+\varepsilon}$，一次出现在第 8 节 $(2/\rho)^n\to0$，两处必须同向），$\beta$ 由 $\rho$ 定义、$k$ 由 $\beta$ 唯一确定（相消条件），$k$ 同时决定 $V_\xi^F$ 的高度权 $y^k$、计数可用的 $2k-1>0$ 余量、以及传输权重 $4(k-1)=\beta-1$；$1/16$ 决定 $256\pi$，$256\pi$ 决定 $I(F)<\infty$，后者决定 Prop 4.1 的紧上水平集，紧上水平集决定 Lemma 5.5 的有限性与绕数求和，求和决定等秩配对，配对与 $P$ 的 $y^{-\beta}$ 协变性在第 16 节合流成 $\mathbb E J\le0$，与第 12 节的 $k(k-1)>0$ 相冲，闭环回到 $\rho\le2$，再由 Prop 2.4 出均匀径向界，最后由 Hölder（$q=-t/2$）与加权面积（$\eta$、$a$）铺满 $-2<t<2/3$，Koebe 扇形把两端钉死。任何一格改动都会在上述某处提前断裂，其中 $k$ 与 $\beta$ 的耦合、$-4$ 幂与对合 Jacobian 的耦合是全文最紧的两处。

## 19 与 D40 的分工

同一技术线有两篇，我这份笔记对应 $p=-2$（逆平方），`D40-单叶函数严格逆一次幂界.md` 对应 $p=-1$（逆一次幂）。分界按两篇正文各自的排他声明划：本篇 `00-history:101-108` 写着配套论文证明"uniform inverse-first-power bound with exponent strictly below $1/4$"、否掉 Kraetzer 在 $p=-1$ 的有界谱预测，并且"The proof here does not use that strict estimate; its Hölder interpolation from \eqref{eq:main-uniform} gives exponent $1/2$ with an arbitrary positive loss at $t=-1$"；D40 正文（其笔记第 14 行转述的 `00:98`）写着 "the companion's inverse-square endpoint theorem is not an input"。两句话互不相让，所以正确的读法是把它们看成同一机器上的两个不同权重设置：$A_z$ 的权重本篇是 $\lvert Q_F(z)\rvert^2$（D40 是 $\lvert Q_F(z)\rvert$），$A_zA_w=A_{z\cdot w}$ 的望远镜只对与权重同幂的赋值成立，两篇因此共用仿射律与临界点比较的骨架，各自需要自己的 $k$、自己的矩、自己的计数不等式，谁都不能把对方的结论当输入。本篇自己给的 $t=-1$ 结果是 $\varepsilon$ 损失下的指数 $1/2$（`06:87-96` 的 $q=-t/2=1/2$），严格小于 $1/4$ 的那个 $t=-1$ 界属于 D40，两者在 $t=-1$ 处的差（$1/2$ 与 $1/4$）说明本篇的 Hölder 插值在该点远未最优，而把它当成本篇的前提就会犯循环论证：D40 的证明结构里同样需要一条本类算子的本征测度，若本篇引用 D40 的严格界来推本篇的 $t=-2$ 界，方向上仍是较不紧的结果供较紧的结果，与第 2 节 (d) 路线里的插向限制一致。我在本篇正文里不复述 D40 的任何推导，也不在任何一步用它的 $<1/4$ 数字。

## 20 Lean 取证

条目在中心仓库有登记，检索证据：`grep -n -i "brennan" E:\math\lean\formalization.yaml` 命中第 307 至 310 行（title 与 id 指向该 preprint 目录下的 `paper.pdf`，`type: article`）与第 986 至 991 行，后者登记两条被认证声明与入口文件：`OAI.Brennan.main_theorem` → `OAI/Analysis/IntegralMeans/Main.lean`，`OAI.Brennan.Sharp.sharp_endpoints` → `OAI/Analysis/IntegralMeans/SharpEndpoints.lean`，对应 comparator 配置 `ComparatorChallenges/Brennan.json` 与 `BrennanSharp.json`。两文件在 `E:\math\lean\OAI.lean` 第 96、97 行被全库导入。以下数字全部实测。

规模与形状：目录 `E:\math\lean\OAI\Analysis\IntegralMeans\` 含 47 个 `.lean` 文件、合计 14188 行；顶层声明 1028 条，其中 `def` 169、`lemma` 837、`theorem` 8、`instance` 13、`structure` 1、`example` 0。八条 `theorem` 是 `critical_count`（CriticalCount.lean:478）、`criticalCountStatement_proved`（同文件 523）、`windingNumber_finite_regular_zeros`（Degree.lean:331）、`main_theorem`（Main.lean:10）、`transferRho_le_two`（Moments.lean:410）、`lintegral_inv_Ioo_eq_top` 与 `lintegral_eq_top_of_sector_lower_bound`（SectorDivergence.lean:15、29）、`sharp_endpoints`（SharpEndpoints.lean:23）。不 import 本模块任何文件的叶子只有 `Model.lean`（陈述定义）与 `SectorDivergence.lean`。

公理与 sorry：`sorry` 出现 0 次、`sorryAx` 0 次、`admit` 0 次、`axiom` 声明 0 处、`#print axioms` 0 处（目录里没有留下公理审计的打印记录）。可用的公理以 comparator 配置为准，两个 JSON 的 `permitted_axioms` 都是 `propext`、`Classical.choice`、`Quot.sound`，`enable_nanoda` 为 `false`。与选择公理相关的实际用量：`Classical` 词元 62 次（含 `Classical.choice` 3、`Classical.choose` 1、`Classical.choose_spec` 1、`Classical.arbitrary` 1）、小写 `classical` 31 次、`choose`  tactic 行首 7 次。

tactic 频次（行首计数 / 全文词元计数）：`have` 2080 / 2132、`rw` 814 / 931、`exact` 692 / 856、`apply` 379 / 406、`simp` 372 / 647、`intro` 311 / 459、`obtain` 221 / 230、`refine` 180 / 182、`simpa` 177 / 341、`ring` 97 / 198、`dsimp` 82 / 115、`filter_upwards` 76 / 80、`nlinarith` 66 / 102、`constructor` 62 / 66、`linarith` 53 / 272、`field_simp` 55 / 72、`calc` 57 / 60、`convert` 46 / 52、`norm_num` 25 / 197、`induction` 12 / 12、`fun_prop` 11 / 69、`positivity` 0 / 106（只作 term 使用）、`subst` 5、`aesop` 6、`cases` 3、`show` 3、`omega` 3、`gcongr` 1、`ring_nf` 4、`exfalso` 0。`:= by` 与行尾 `by` 合计 1766 处。分布特征很明显：`have` 一家独大、`positivity` 与 `gcongr` 几乎不用，说明这条形式化路线是手工搭引理链，不等式靠 `nlinarith`、`linarith` 与显式 `Real.rpow_*` 引理名传递。

与 tex 的错口，按"未形式化 / 换路线 / 假设被改变"三类列：

未形式化。Corollary 7.1（$B_{\mathcal S}(t)=\|t\|-1$ 对全部 $t\le-2$）在 Lean 里没有对应：`Spectrum.lean` 只有 `beta_inverse_le_one`（51）、`koebe_beta_ge_one`（71）、`inverse_spectrum_eq_one`（92），都固定在 $t=-2$；我在 47 个文件里检索 `linear_tail`、`negTail`、`abs_t` 等命名与 `\|t\| - 1` 型表达式，命中 0。Corollary 7.4（齐次 Sobolev 拉回，Gol'dshtein 和 Ukhlov 口径）完全未形式化：`grep -i "sobolev\|pullback\|ukhlov\|goldshtein"` 在该目录命中 0 行。`06:286-311` 那段"逐点端点指数与 $B_{\mathcal S}(-2)=1$ 的等价"（含 $M_{-2+\eta}$ 次调和论证）也没有独立声明，`MainStatement` 只把 `spectrum (-2) = 1` 与均匀界并列，不陈述二者等价。`06:247-257` 的圆盘与区域表述范围等价（球面边界至多一点导致矛盾）没有以独立引理出现，它被 `MainStatement` 第三 conjunct 的假设直接吸收。

换路线。tex 的 $\rho$ 在 Lean 里叫 `transferRho := growthRate transferOperator transferOperator_pow_norm_ge_one`（AffineLaw.lean:442），$\beta$ 叫 `transferBeta := Real.log transferRho/Real.log 2`（444）；tex 的 $\|L^n\|\le625\cdot4^n$ 这一显式先验没有以 625 出现（全目录检索 `625` 命中 0），Lean 用的是 `classWeight g (halfPoint 0 η) ≤ 1562500`（CircleBounds.lean:167、192、204、389）这种放得更粗的显式常数，`1562500` 是我在 tex 里找不到对应数字的独立常数。tex 的 Sard 覆盖论证（`04:158-170` 的 $O(h^{-2})$ 方块与 $O(h^3)$ 像）在 Lean 里换成 Mathlib 的 `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`，包在 `ae_regular_values`（GoodPairs.lean:162）里，假设只剩逐点 `DifferentiableAt ℝ` 加 Jacobian 行列式为零的集合，tex 那条"二阶导有界"的量化被 Mathlib 引理的内部条件接管。面积公式在 tex 是 Borel 片 + Tonelli（`05:20-42`），Lean 侧走 `ℝ≥0∞` 的 `lintegral` 与 `Measurable` 指标（`ExpectedDensity.lean` 的 `averagedDensity`、`measurable_averagedDensity`），全程在 ENNReal 里算，不再有"扩展实值可测"与"Borel 可测"的区分。Koebe 的逆在 tex 是显式表达式的代入（`06:313-337`），Lean 侧 `koebeInverse := Function.invFunOn koebeMap disk`（SharpModel.lean），先证 `koebe_inverse_areaMoment : areaMoment koebeInverse koebeDomain s = areaMoment koebeMap disk (2 - s)`（InverseMoment.lean:11-12，换元在这里以 `deriv koebeInverse (koebeMap z) = (deriv koebeMap z)⁻¹` 完成），再把 `areaMoment ... = ⊤` 转成 `¬ IntegrableOn`（`not_integrable_of_areaMoment_top`，同文件 35）。锐性陈述的形态因此与 tex 不同：tex 写 $\int=-\infty$ 型发散，Lean 写 `= ⊤` 与不可积两个 conjunct。

假设被加强或被削弱。`Main.lean` 第三洞的写法是 `intro W hW _hconnected _hsimply _hboundary φ hφ hb s hs hs4` 后 `exact conformal_domain_area hW hφ hb hs hs4`：连通性、单连通性与球面边界非平凡这三条假设被下划线丢弃，实际的 `conformal_domain_area`（DomainArea.lean:105）只需要 `IsOpen W`、`DifferentiableOn ℂ φ W` 与 `Set.BijOn φ W disk`。这是对外层 `MainStatement` 无影响（假设仍在陈述里，Model.lean:33 照 tex 写全），但意味着 Lean 证明的事实集合比 tex 陈述更强，tex 里那些条件在本篇是范围声明的角色，证明不需要它们。`uniform_inverse_square_bound`（CircleBounds.lean:535）的结论多要求 `0 < C`，比 tex 的"$C_\varepsilon<\infty$"多一个正性，属无害加强。`Model.lean` 的 `Schlicht` 用 `DifferentiableOn ℂ f disk ∧ Set.InjOn f disk` 加 `deriv f 0 = 1`，`beta` 用 `Filter.limsup ... (𝓝[<] 1)` 与 `EReal`，`spectrum` 用 `sSup`，`SphericalBoundaryNontrivial` 用 `frontier` 在一元化像里的 `Set.Nontrivial`，这些都是 tex 概念的量化改写：tex 说"边界含至少两点"，Lean 说一元化边集非平凡（两点即 `Nontrivial`），我在 `06:247-257` 读到的正是这条等价性的自然语言版。

矛盾收口的实际形态：`transferRho_le_two` 用 `by_contra!`，取 `exists_weighted_continuous_law hρ`，装成 `HasWeightedLaw`，再并 `jacobian_expectation_nonpos`（ExpectedTransport.lean:294）与 `jacobian_expectation_value`（取 $k:=(\text{transferBeta}+3)/4$），最后那个 `he : ... = ...` 的 `ring` 一步正是 tex `04:58-60` 与 `05:186-189` 的相消，`hp` 证 $k(k-1)>0$，`mul_nonpos_of_nonneg_of_nonpos (sq_nonneg ...) hn` 与 `linarith` 收尾（Moments.lean:410-428）。也就是说 Lean 忠实跟住了 tex 的反证骨架，改的只是常数与可测性语言。

## 21 最终思路与最初设想的差异

我最初设想的是"把一个逐点积分估计做精"：拿到 $|f'|^{-2}$，找更好的 distortion、找系数恒等式、找插值。最终写成的是"把一个解析命题换成一个反证命题"：先造一个由 $\rho>2$ 才存在的概率律，再用平面拓扑（指标求和 + 等秩配对）与测度输运算子在这个律上算出两个相反的符号。这两件事的差别在我这里留下的具体痕迹有三处。第一，常数的角色变了：最初我以为 $C_\varepsilon$ 会由某个显式链（$K$、$B_E$、$\|L^n\|$）算出来，实际论文里它由"紧类上的连续函数最大值"提供，从不显式，唯一显式的巨大常数是形式化端的 `1562500`，而它在 tex 里没有对应；这告诉我均匀性的代价是把常数交给紧性。第二，$\varepsilon$ 的位置变了：我以为损失项在面积端（$t>-2$ 的开区间），最终 $\varepsilon$ 同时出现在径向上（$-1-\varepsilon$）与负尾上（$-|t|+1-\varepsilon$），而端点谱 $B_{\mathcal S}(-2)=1$ 却无损失，这个"均匀界有损失、上确界无损失"的错位正是 `00-introduction:77-79` 那句兼容性的内容。第三，配对的角色变了：我以为临界点比较给出的是某种显式映射公式，实际它只需要"秩相等"这种纯次序信息，可测性是事后用压缩映射分支补的，枚举不进几何定义（`04:468-469`）。

我仍然不信或至少没完全核对的三处，按可疑程度排。第一处是第 12 节 (d) 路线 2 提到的符号分叉：$G_F$ 里 $-\frac{iy}{k}F'$ 的负号选择，我只能从"与 $r=-ik/y$ 一致"倒推，论文没有陈述别的符号为何不行，这是我的重构，并非它的论证。第二处是第 8 节本征测度的质量归一：`02:46` 说最大值 $\mu_\tau$ 的取得靠 $g_\tau$ 连续与 $\mathcal K$ 紧，而 $\mu_\tau=\delta_{F_\tau}R_\tau/M_\tau$ 的质量等于 1 依赖 $g_\tau(F_\tau)=M_\tau$，这两件事我在纸上核过一致，但对角抽取时"$\|\mu_\tau\|=1$ 把稠密测试上的收敛扩到全部 $C(\mathcal K)$"用的是等度有界的标准论证，论文只用一句带过，Lean 端把它拆成了 `exists_resolvent_probability` 与 `exists_growth_eigenmeasure`（Eigenmeasure.lean:341、378），我没能逐行核对那条 `by_contra` 路径是否与我补的一致。第三处是第 11 节的 witness 胞：$C_\delta=(1+4M)(2^k)/\delta$ 里我把 $2^k$ 折进常数，论文写作 $(1+4M)(2h)^k/\delta=:=C_\delta h^k$，$k$ 依赖 $F$（通过 $\beta$）而 $h\le1$，折常数是合法的，但 $C_\delta$ 随之与 $F$ 有关，后面 $|E_h|\le C_{F,R,\delta}h^{2k-1}$ 也标了 $F$，这条依赖在 $\limsup$ 零测论证里无害、在第 16 节对 $F$ 取期望时是否被静默消费，我没有找到显式说明，标 [推测]。这三处都属于"我重构的链条比论文陈述的链条更啰嗦"，写作上我把它们留在明处，以便后续核对。
