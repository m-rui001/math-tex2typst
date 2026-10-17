# D52 $c_0$ 的双 Lipschitz 吸收而无线性拷贝：我把吸收器做成一台"检测器收不完"的机器

对象论文：*Bi-Lipschitz Absorption of $c_0$ Without a Linear Copy of $c_0$*（OpenAI，2026-09-26）。
TeX 源：`E:\math\preprints\Bi-Lipschitz-Absorption-of-c0-Without-a-Linear-Copy-of-c0-September-26-2026\build\`，`main.tex` 52 行（宏包与 `\newtheorem` 在 16 至 23 行，八个 `\input` 在 42 至 49 行），分片 `sections/01-introduction.tex` 至 `08-assembly.tex` 合计 1961 行（01 有 163 行、02 有 77 行、03 有 308 行、04 有 243 行、05 有 247 行、06 有 274 行、07 有 599 行、08 有 50 行）。引文位置形如 `03:87`，指对应分片文件的第 87 行，全部可在 tex 源码逐行核对；PDF 加密，我从头到尾没碰过它。
Lean：`E:\math\lean\OAI\Analysis\C0Absorption\`，34 个 `.lean` 文件，`wc -l` 合计 7918 行；被认证的只有 `OAI.C0Absorption.main_result` 这一条（`Main.lean:33`）。挑战配置 `E:\math\lean\ComparatorChallenges\C0Absorption.json`；中心仓库登记：论文条目在 `E:\math\lean\formalization.yaml` 第 292 行，形式化映射在第 994 至 996 行。本笔记是单段式作业，无素材文件，下面所有 Lean 数字都是我在源码上实跑 grep/wc 测出的，口径在第 20 节交代。

记号与论文一致。$\eta=10^{-3}$；$E=c_0(\mathbb N)$，$U$ 是另一堆 $c_0$ 坐标的直和，$D=E\oplus_\infty U$，$B$ 是 $D$ 的闭单位球；$\oplus_\infty$ 指 $\|(x,y)\|=\max\{\|x\|,\|y\|\}$。凡我反向补的判断，没有 tex 或 Lean 文字支撑的，一律标 [推测]。与 D26（加倍 Hilbert 子集）的分界放在第 18 节，本笔记不复述它的内容。

## 0 我进场时手里有什么

先把靶子钉在墙上。主定理（`01:51-57`，逐字）：

```tex
\begin{theorem}\label{thm:main}
There is a separable real Banach space \(Z\) containing no closed linear
subspace isomorphic to \(c_0\), and an onto bi-Lipschitz map
\[
                 F:Z\oplus_\infty c_0\longrightarrow Z.
\]
\end{theorem}
```

量化顺序我先抄下来对着 Lean 核对（第 20 节做这件事）：

$$\exists Z\,(\text{可分实 Banach}\wedge\text{无线性 }c_0\text{ 拷贝})\wedge\exists F\,(F:Z\oplus_\infty c_0\to Z\text{ 满双 Lipschitz}).$$

intro `01:11-13` 有一句我读第一遍就画了线的：embedding 与 equivalence 的区分是本文的中心。$F$ 是**整个空间之间**的满射，而线性障碍说的是**子空间**。我进场时的第一个问题就是这两件事怎么能同时成立：把 $F$ 限制在 $\{0\}\oplus c_0$ 上（`01:62-63`），得到 $c_0$ 双 Lipschitz 嵌入 $Z$ 的像；可 $Z$ 里没有线性拷贝。所以 $c_0$ 的度量型态进了 $Z$，线性型态没进去。Godefroy–Kalton–Lancien 的定理（`01:33-37`）只封死了"与 $c_0$ 的子空间双 Lipschitz 等价"这类全局等价形态，管不了"含一个双 Lipschitz 像"这种子空间形态；Kalton 把它记为 Problem 2（`01:40-41`，`[Theorem~2.1--2.2]` 与 `pp.~21--22` 两处引文我都在 bib 与 tex 里核过）。Hájek–Johanis–Schlumprecht 到 2024 年 1 月还把嵌入问题列为 apparently open（`01:42-44`，arXiv:2401.00831v1）。也就是说这篇交付的是一个悬问的反例，形态选得刚好卡在已知刚性和未知之间的缝里。

我手里还有一条硬约束，是 `01:106-108` 那句：一个线性商映射若有任何 Lipschitz 右逆，就自动有界线性右逆 `[Corollary~3.2]` of Godefroy–Kalton。我的 $U$ 同构于 $c_0$ 本身（可数坐标 $c_0$ 的直和仍是 $c_0$），所以只要我在构造里给 $Q:Z\to U$ 配一个 Lipschitz 右逆，$Z$ 立刻含线性 $c_0$，命题当场自毁。这条约束在我前两条死路里都是直接死因，见第 1、2 节。台账续写行（第 358 行起的 17 行）的语料口径登记在此：目录 `preprints/Bi-Lipschitz-Absorption-of-c0-Without-a-Linear-Copy-of-c0-September-26-2026`（队列第 57 行号），我只读它 `build\` 下的 tex，`wc -l` 实测分片 01 至 08 为 163、77、308、243、247、274、599、50，合计 1961 行、`main.tex` 52 行，Lean 侧只取 `OAI\Analysis\C0Absorption` 的 module 目录清单（实测 34 个 `.lean`）与 `ComparatorChallenges\C0Absorption.json`，records.txt 的三行记录在我允许的浅层查找里没有命中，所以凡牵到它的登记一律标 [推测]。

## 1 我的初始猜想，和它的第一种死法

进场时我最自然的一个猜想：既然 $c_0$ 型反例在文献里都有"改记号不改空间"的味道，$Z$ 大概可以取某个已知的无 $c_0$ 空间（Kalton 的 Schur 例子、或某个 Tsirelson 型空间），再手工定义一个满双 Lipschitz 的 $F$。我把这个猜想的机械死因摊开：

**死因一：双 Lipschitz 满射的像集是刚性度量对象，不是可以手搓的。** 若 $F:Z\oplus_\infty c_0\to Z$ 下界常数为 $c$，则 $F$ 把半径 $r$ 的球夹成 $B_Z(F(x),cr)\subset F(B(x,r))\subset B_Z(F(x),Cr)$。$Z\oplus_\infty c_0$ 在 $Z$ 的每个点附近都多带一个 $c_0$ 方向的"厚度"，手工映射要在无穷维里逐坐标把这块厚度消化掉，任何一步线性化的尝试（位移、平移、逐块重排）都会把 $c_0$ 的基向量原样搬进 $Z$。这不是哲学判断：`01:74-75` 说交错两个 $c_0$ 和只能给出**一致**吸收，模函数是非线性的，也就是小尺度处下界退化；我在纸上把交错映射的下界算了一遍：尺度 $2^{-n}$ 处常数退化到 $O(n^{-1})$ 以下，无全局 $c>0$。双 Lipschitz 这五个字就是全部难度。

**死因二：Ribe 型刚性告诉我"抹平"不够。** `01:17-19` 引 Ribe：一致同构的两个空间有相同的有限维线性结构（同一个 distortion 界）。我的 $Z$ 与 $Z\oplus_\infty c_0$ 一致同构是便宜的（多出的 $c_0$ 可以沿小球均匀吃掉），Ribe 对此毫无异议；所以一致路线能给反例但给不了**双 Lipschitz** 反例，`01:29-30` 那句 "a separable bi-Lipschitz counterexample requires more than a uniform deformation" 就是把这条退路当众焊死。我最初想"先一致同构再收紧"，收紧的机械障碍即上面球包含链：双 Lipschitz 要求每个尺度同一个 $c$，交错构造在每个尺度丢常数，收紧失败。

**死因三：线性通道全部封死。** 若 $Z\oplus_\infty c_0$ 与 $Z$ 线性同构，则 $Z$ 含 $c_0$，矛盾是瞬间的；所以 $F$ 必须非线性。可非线性又要有线性下界。这个夹缝就是全文住的地方。

第一条真正有产出的弯路是第 2 节要写的吸收公式：我一度以为需要 $Q$ 满射加 Lipschitz 右逆，这是标准操作，然后撞上 `01:106-108` 的 GK03 推论。转折点是认出满射根本不在必需清单里。

## 2 吸收准则：一个代数恒等式替我免掉了右逆

Lemma 2.1（`02:12-39`，逐字）：

```tex
\begin{lemma}[Absorption from a lifted correction]\label{lem:absorption}
Let \(E,U,Z\) be real Banach spaces, let
\(D=E\oplus_\infty U\), and let \(P(t,u)=u\). Suppose
\(Q:Z\to U\) is bounded linear,
\(g:D\to U\) is a bi-Lipschitz bijection, and \(K:D\to Z\) is
Lipschitz. Assume the exact identity
\begin{equation}
                 QK(t,u)=g(t,u)-u
                 \qquad ((t,u)\in D).                    \label{eq:absorb-identity}
\end{equation}
Then
\[
 F:Z\oplus_\infty E\longrightarrow Z,\qquad
 F(b,t)=b+K(t,Qb)
\]
is a bi-Lipschitz bijection. If
\[
 q=\|Q\|,\qquad L_K=\Lip(K),\qquad
 \|g(x)-g(x')\|_U\geq c_g\|x-x'\|_D
\]
for some arbitrary lower constant \(c_g>0\), then
\begin{equation}
 \Lip(F)\leq 1+L_K\max\{1,q\},\qquad
 \Lip(F^{-1})\leq
 \max\left\{1+\frac{L_Kq}{c_g},\frac{q}{c_g}\right\}.     \label{eq:absorb-bounds}
\end{equation}
No surjectivity or right-inverse assumption is imposed on \(Q\).
\end{lemma}
```

(b) 推导我全部重走。正向：$QF(b,t)=Qb+QK(t,Qb)=Qb+g(t,Qb)-Qb=g(t,Qb)$。注意 $Qb$ 恰好是 $P(t,Qb)$，所以 $QF(b,t)=g(t,Qb)$ 说明"先走 $F$ 再商掉"等价于"喂进移位"。反演公式（`02:43-45`）：给定 $d\in Z$，解 $(t_d,u_d)=g^{-1}(Qd)$，令 $G(d)=(d-K(t_d,u_d),t_d)$。验证一：$QF(b,t)=g(t,Qb)$ 意味着 $g^{-1}(QF(b,t))=(t,Qb)$，代入得 $G(F(b,t))=(b+K(t,Qb)-K(t,Qb),t)=(b,t)$。验证二：对任意 $d$，记 $(t,u)=g^{-1}(Qd)$，$b=d-K(t,u)$，则 $Qb=Qd-QK(t,u)=g(t,u)-(g(t,u)-u)=u$，于是 $F(G(d))=d-K(t,u)+K(t,Qb)=d-K(t,u)+K(t,u)=d$。双向都精确，无近似项。常数：$(b,t)\mapsto(t,Qb)$ 的 Lipschitz 是 $\max\{1,q\}$（$\ell_\infty$ 型积上取 max），复合 $K$ 得 $L_K\max\{1,q\}$，再加恒等项 $b$ 的 1。反向：$g$ 的下界把 $Qd,Qd'$ 的差放大回 $D$ 的差，$\|(t_d,u_d)-(t_{d'},u_{d'})\|_D\le q\|d-d'\|/c_g$，于是第一坐标 $d-K(t_d,u_d)$ 的常数是 $1+L_Kq/c_g$，第二坐标是 $q/c_g$。

(c) 机械理由。为什么 $\|Q\|$ 以 $q$ 出现两次：$Q$ 在正反向都只通过 $Qb$ 接触 $K$，没有任何一步需要 $Q$ 满。"No surjectivity"那句（`02:38`）配合 `02:74-77` 尾注：反演公式先用 $g^{-1}$ 造出 $u$，再让 $b=d-K(t,u)$ 自动满足 $Qb=u$，"给定目标找原像"的问题被恒等式预先消化了。这就是我认出 GK03 障碍后的出路：我不要右逆，我要的是一个**值域被 $g-P$ 命中的**线性 $Q$，而那个命中由构造（第 11 节的 $K$）保证。
(d) 候选失败路线。其一，令 $K$ 线性：那 $g=QK+\mathrm{Id}$ 在商方向是仿射的，$g$ 就不是第 4 节那个状态相关移位，$c_0$ 吸收的"消化器"消失。[推测：机制停住处是 $g$ 的非线性必须整体上抵消多出的 $E$ 方向。] 其二，取 $Q$ 为包含映射的对偶方案（$Z\subset U^{**}$ 型）：Lipschitz 提升线性商的通道被 GK03 封死，同第 1 节。其三，把 $F$ 做成逐块三角变换（Aharoni–Lindenstrauss 非可分构造的雏形，`02:7-8` 明说借鉴）：三角变化在可分情形需要每块"值域比定义域宽"，宽出来的部分正是 $t_i$，我试过的直接版本在第 5 节维度账那里断掉。

## 3 坐标权重：把状态相关的选择器做慢

§3 的账（`03:8-45`）我先复述关键定义，因为第 4 节以后每一步都在花它的钱。$d_j=2^{-j}$（`03:12`）；$\mathcal A_j=([-1,1]\cap d_j\mathbb Z)^j$ 是立方体 $[-1,1]^j$ 的间距 $2^{-j}$ 网格（含两端点）；层 $\lambda=(i,n)$，$J_\lambda=i+n$；块 $\Gamma_\lambda=\{(\lambda,j,\xi):0\le j\le J_\lambda,\ \xi\in\mathcal A_j\}$（`03:17-21`），有限。$U$ 是所有块的坐标 $c_0$。局部半径 $r_{i,n}(x)=\max\{\|x^{i,n-1}\|_\infty,\|x^{i,n}\|_\infty\}$（$n>1$），$r_{i,1}=\max\{|t_i|,\|x^{i,1}\|\}$（`03:35-36`）。未编号论证一条：`03:37-45` 说每个输入坐标至多进两个半径，于是对固定 $x\in D$，$r_\lambda(x)$ 在 $\lambda$ 离开有限集时趋于 0（eq:radii-tail）：无穷多个半径 $\ge\varepsilon$ 逼出无穷多个绝对值 $\ge\varepsilon$ 的输入坐标，与 $x\in c_0$ 矛盾。这条"尾消失"是后面 $Sx\in U$ 与 $b_{i,n}\in c_0(\mathbb N^2)$ 的全部根据。

Lemma 3.1（Weights at one level，`03:77-104`，逐字）：

```tex
\begin{lemma}[Weights at one level]\label{lem:coordinate-weights}
Let \(\eta=10^{-3}\).  There are continuous maps
\[
 v^\lambda:B\to\mathbb R^{\Gamma_\lambda},\qquad
 w^\lambda:B\to(\mathbb R^{\Gamma_\lambda})^*
\]
depending on finitely many coordinates of their argument, such that
\begin{equation*}
 \|v^\lambda(s)\|_\infty\leq1,\qquad
 \|w^\lambda(s)\|_1\leq2,\qquad
 w^\lambda(s)v^\lambda(s)=1,                         \tag{W1}
\end{equation*}
and, for \(s,s'\in B$,
\begin{equation*}
 \min\{r_\lambda(s),r_\lambda(s')\}
 \max\!\left\{\|v^\lambda(s)-v^\lambda(s')\|_\infty,
              \|w^\lambda(s)-w^\lambda(s')\|_1\right\}
 \leq\eta\|s-s'\|_D.                                  \tag{W2}
\end{equation*}
More precisely, the $j$th band of either weight is the product of a
coefficient $\theta_j^{J_\lambda}(r_\lambda(s))$ and a vector or row
depending only on $\pi_j s$.  If $\theta_j^{J_\lambda}(r)>0$, then
\begin{equation}
 r\leq\rho_j\quad(j\geq1),\qquad
 r\geq\ell_j\quad(j<J_\lambda),                       \label{eq:band-support}
\end{equation}
for positive constants $\rho_j,\ell_j$ defined in the proof.
\end{lemma}
```

(b) 证明我按论文重演并补中间步。帽函数 $b^j_\xi(s)=(1-\|\pi_js-\xi\|_\infty/d_j)_+$，$B_j=\sum_\xi b^j_\xi$。网格含两端点，$[-1,1]^j$ 内每点到最近格点的 $\infty$-距离 $\le d_j/2$，该格点处 $b^j_\xi\ge1/2$，故 $B_j\ge1/2$，$w^j_\xi=b^j_\xi/B_j$ 处处有定义。$v^j_\xi=\min\{1,(2-\|\pi_js-\xi\|_\infty/d_j)_+\}$：当 $w^j_\xi(s)>0$ 时 $\|\pi_js-\xi\|_\infty<d_j$，此时 $v^j_\xi=1$，故 $w^jv^j=\sum_{w^j_\xi>0}b^j_\xi/B_j=1$。这一步把"配对 $wv=1$"的实现从"选一个格点"改成"软覆盖求和"，不需要任何选择函数。
归一化的 Lipschitz 账：每个 $b^j_\xi$、$v^j_\xi$ 的 Lipschitz $\le d_j^{-1}$（帽函数斜率 $1/d_j$，$v$ 的斜率同量级且截断不增），$N_j=|\mathcal A_j|=(2^{j+1}+1)^j$ 个坐标在 $\ell_1$ 里求和：$\|b^j(s)-b^j(s')\|_1\le N_jd_j^{-1}\|s-s'\|$。归一化引理（`03:138-141` 逐字）：

```tex
\left\|\frac b{\|b\|_1}-\frac{b'}{\|b'\|_1}\right\|_1
 \leq\frac{\|b-b'\|_1+|\|b\|_1-\|b'\|_1|}{\|b\|_1}
 \leq4\|b-b'\|_1.
```

第二个号：$|\|b\|_1-\|b'\|_1|\le\|b-b'\|_1$ 给出分子 $\le2\|b-b'\|_1$，分母 $\ge1/2$，合计因子 4。于是 $L_j=4N_j/d_j$ 同时控制 $w^j$（$\ell_1$）与 $v^j$（$\infty$）。
尺度调度（`03:146-153`）：先取 $H>0$ 使 $\pi/H\le\eta/2$，再归纳取 $\rho_j$：$0<\rho_1<1$，$\rho_{j+1}<e^{-H}\rho_j$，$L_j\rho_j\le\eta/4$。每步右端为正所以可归纳（论文 `03:153-154` 特意说了这句平凡话，因为这是全文唯一用选择公理化之外的显式构造点）。$\ell_j=e^{-H}\rho_{j+1}$。$\theta^J$：当 $r\ge\rho_1$ 取 $e_0$；$r$ 穿过 $[e^{-H}\rho_j,\rho_j]$ 时用角 $\alpha_j(r)=\frac{\pi}{2H}\log\frac{\rho_j}{r}$ 从 $e_{j-1}$ 旋到 $e_j$（$\cos,\sin$ 入射）；区间之间保持最近到达的单位向量；$r\le e^{-H}\rho_J$ 取 $e_J$。逐条核对：$\alpha_j$ 在 $r=\rho_j$ 处为 0、$r=e^{-H}\rho_j$ 处为 $\pi/2$，端点与相邻常向量段自动衔接（含 $r=0$ 连续性）；$\sum(\theta_j^J)^2=1$、$\sum\theta_j^J\le2$（`03:172-175`，单位向量分支和至多两个非零）。对 $\log r$ 的 Lipschitz：路径速度 $(\pi/2H)(|\sin|+|\cos|)\le\pi/H$。
(c) 常数的机械理由。$e^{-H}$ 间隙保证旋转区间两两不相交且有序（`03:167-168`）；同时它定义了 $\ell_j$：band $j<J_\lambda$ 非零当且仅当 $r\ge\ell_j$，band $j\ge1$ 非零蕴含 $r\le\rho_j$，于是同一层里不同 band 被半径隔开，这就是后面支撑簿记的"半径阈值"来源。$L_j\rho_j\le\eta/4$：W2 第二段里 $mL_j\le rL_j\le\eta/4$，配上 $\sum\theta_j\le2$ 得 $\eta\delta/2$；第一段（变 $\theta$）直接用 $\pi/H\le\eta/2$。两半相加恰是 W2 的 $\eta\delta$。为什么 W2 带 $\min\{r,r'\}$ 因子：半径小的时候块的输入本身就小，权重再疯也乘不出大误差，这是把"状态相关"与"距离保持"焊接的唯一形状。我一度想把 W2 加强成普通 Lipschitz（不带半径因子），立刻死：$\rho_j\to0$ 超指数（$e^{-Hj}$ 乘积意义下），$L_j$ 随 $N_j/d_j$ 超指数增，$L_j$ 无一致界，普通 Lipschitz 版根本不存在。这条弯路让我相信 min-半径因子是本质的，标 [推测：作者未写下此失败路线]。

`03:229-235` 定义修正坐标（eq:correction-coordinate）：$a_{i,0}(s)=t_i$，$a_{i,n}(s)=w^{i,n}(s)s^{i,n}$，$f_\gamma(s)=\theta_j^{J}(r_\lambda)\,v^j_\xi(s)\,(a_{i,n-1}-a_{i,n})$。Lemma 3.2（`03:240-260`）给出统一界 $|f_\gamma|\le4r_\lambda\le4$、$\operatorname{Lip}(f_\gamma)\le4+12\eta$，和支撑两条件（$\|\pi_js-\xi\|\le2d_j$；$r_\lambda\ge\ell_j$）。推导要点我补三处：$|a_{i,n-1}-a_{i,n}|\le\|w^{i,n-1}\|_1\|s^{i,n-1}\|+\|w^{i,n}\|_1\|s^{i,n}\|\le2r_\lambda+2r_\lambda=4r_\lambda$（用了 $r$ 的定义恰包住前后两块）；Lipschitz 账（`03:278-299`）在 $s,s'$ 中取半径较大者的权重做冻结对，另一端由 W2 得 $r_\lambda(e)\cdot$(权重差)$\le\eta\delta$，换 $v$ 花 $4\eta\delta$（乘子 $|a-a'|\le4r$ 与 $\|v-\bar v\|\le\eta\delta/r$ 的组合），换前后两行 $w$ 花 $2\eta\delta$，冻结后 $f_\gamma$ 对输入是线性的、范数 $\le4\delta$，合计 $4+12\eta$；支撑账：$f_\gamma(s)\ne0$ 逼 $\theta_j^J(r)>0$ 且 $v^j_\xi(s)>0$，后者给 $\|\pi_js-\xi\|<2d_j$（帽支在 $d_j$、$v$ 支在 $2d_j$），前者由 band-support 给 $r\ge\ell_j$。$I_\gamma$ 取"前 $J_\lambda$ 个坐标 $\cup\,t_i\cup$ 块 $(i,n),(i,n-1),(i,n-2)$"，非空有限（`03:262-273`）。

## 4 冻结移位：先造一个我能显式求逆的线性世界

Lemma 4.1（`04:13-22`，逐字）：

```tex
\begin{lemma}[Frozen shift]\label{lem:frozen}
Choose for every \((i,n)\) a pair \(v^{i,n},w^{i,n}\) satisfying
(W1), independently between blocks. Define \(S:D\to U\) by
\begin{equation}
 a_{i,0}=t_i,\qquad a_{i,n}=w^{i,n}x^{i,n},\qquad
 (Sx)^{i,n}=x^{i,n}+v^{i,n}(a_{i,n-1}-a_{i,n}).               \label{eq:frozen-shift}
\end{equation}
Then \(S\) is a bounded linear bijection with
\(\|S\|\leq5\) and \(\|S^{-1}\|\leq5\).
\end{lemma}
```

(b) 正向界：$\|(Sx)^{i,n}\|\le\|x^{i,n}\|+\|v\|_\infty|a_{i,n-1}-a_{i,n}|\le r_{i,n}+4r_{i,n}=5r_{i,n}$，5 的出处是 $1+4$。$Sx\in U$ 靠 eq:radii-tail。逆向公式（`04:36-39`）：给 $y\in U$，取 $b_{i,n}=w^{i,n}y^{i,n}$，令 $t_i=b_{i,1}$，$x^{i,n}=y^{i,n}-v^{i,n}(b_{i,n}-b_{i,n+1})$。逐项验：$w^{i,n}x^{i,n}=b_{i,n}-w^{i,n}v^{i,n}(b_{i,n}-b_{i,n+1})=b_{i,n}-(b_{i,n}-b_{i,n+1})=b_{i,n+1}$，代回冻结式得 $(Sx)^{i,n}=x^{i,n}+v(b_{i,n+1}-b_{i,n})=y^{i,n}$，且 $a_{i,n}=b_{i,n+1}$ 递推回读 $t_i=a_{i,0}$ 复原一切。逆界：$|b_{i,n}|\le2\|y^{i,n}\|\le2\|y\|_U$，故 $\|x^{i,n}\|\le\|y^{i,n}\|+1\cdot(2+2)\|y\|=5\|y\|$（$4=2|b|$ 之差）。互逆性双向都写完（`04:48-52`）。$b\in c_0(\mathbb N^2)$、$t\in E$ 又是尾消失论证。
(c) 5 这个数字后来被花三次（全局界、有限逆、Brouwer 球半径 $5h$），所以它必须最小：任何把 $v$ 范数或 $w$ 范数放宽都会平移后面所有常数。
(d) 失败路线：其一，我试过让 $S$ 直接当 $g$（权重选一次定死）。那 $g$ 是线性双射，吸收恒等式要求 $g-P$ 被 $QK$ 提升；线性 $g$ 时 $g-P$ 线性，于是 $Q:Z\to U$ 的像包含一个同构 $c_0$（$g$ 的下界方向），$Z$ 含线性 $c_0$，与 `08:8` 要用到的 prop:no-c0 冲突，整条线自毁。[推测：这条冲突论文没写，是我按机制倒推的。] 其二，让 $w,v$ 依赖整条输入行（跨块状态），冻结逆的块局部性破坏，逆公式里 $b_{i,n+1}$ 无法从 $y$ 单独解出。块独立性是逆公式成立的全部前提。

状态相关版（`04:55-60`）：$S_s$ 用 $v^\lambda(s),w^\lambda(s)$ 冻结一切；$g(0)=0$，$g(x)=S_{s_x}x$，$s_x=x/\|x\|_D$。齐次。Proposition 4.2（`04:64-72`，逐字）：

```tex
\begin{proposition}[Global distance bounds]\label{prop:global}
For every \(x,x'\in D\),
\begin{equation}
 \left(\frac15-24\eta\right)\|x-x'\|_D
 \leq\|g(x)-g(x')\|_U
 \leq(5+24\eta)\|x-x'\|_D.                                  \label{eq:global-bounds}
\end{equation}
\end{proposition}
```

(b) 我补全部中间步。第一步（规范化估计，`04:75-83`）：$M=\max\{\|x\|,\|x'\|\}$，$\|s_x-s_{x'}\|\le\||x|/M-x'/M\|+\|x'/M-x'/\|x'\|\le d/M+|1/M-1/\|x'\||\cdot\|x'\|\le d/M+d/M=2d/M$。第二步（逐层冻结混合对）：每层 $\lambda$ 独立地取 $s_x,s_{x'}$ 中半径较大者的权重为 $(\bar v^\lambda,\bar w^\lambda)$；对端点 $e\in\{x,x'\}$，若它自己就是较大者则权重差为 0，否则 W2 的 $\min$ 恰是它的半径、配合 $\|s_x-s_{x'}\|\le2d/M$，得 $r_\lambda(e)\cdot$(权重差)$\le\eta\cdot2d$（eq:frozen-weight-error，`04:92-97`）。第三步（单块误差 12η）：先换 $v$（两个标量保持用原行算）：标量差 $\le4r_\lambda(e)$，乘权重差 $\le2\eta d/r_\lambda(e)$，得 $8\eta d$；再换当前行 $w$：标量变化 $\le$(行差)$\cdot\|e^\lambda\|\le(2\eta d/r)\cdot r=2\eta d$；再换前驱行 $w$（$n>1$）同理 $2\eta d$，$n=1$ 时前驱是 $t_i$ 不动；$\|\bar v\|\le1$ 不放大，合计 $\le12\eta d$（eq:frozen-block-error）。两端点相加：$\|g(x)-g(x')-\bar S(x-x')\|_U\le24\eta d$。夹逼：$\bar S$ 同时满足 $\|\bar S z\|\ge d/5$ 与 $\le5d$（lem:frozen 逐层独立可用），得证。边界情形（一端为 0）反而更强：$g(x)=S_{s_x}x$ 单一冻结，常数恰 $1/5,5$。$1/5-24\eta=0.2-0.024=0.176>0$ 用 $\eta=10^{-3}$。
(c) 24 的分解 $2\times12$，12 的分解 $8+2+2$，每一块都对应一次权重替换；η 只出现在 W2，所以全文对 η 的需求就是"小于 $1/120$"这一条，取 $10^{-3}$ 是余量。
(d) 失败路线：若混合对不按"较大半径"而按固定端点选，另一端点误差里 W2 的 min 是对方的半径、不能控制它乘自己的权重差，$8\eta d$ 变成无界项。若去掉 $s_x$ 的规范化让权重直接依赖 $x$，$B$ 外无定义、齐次性丢，$g$ 在无穷远处失去界。[推测：这两条都是把 (W2) 的形状反过来用的自然尝试。]

## 5 满射性：终端标量与 Brouwer

Proposition 4.3（`04:132-228`）是全文第一处拓扑入场。我先把维度账立起来（`04:142-145`，eq:finite-dimensions）：$\dim D_N=N+\sum_{i,n\le N}|\Gamma_{i,n}|=\dim(U_N\oplus_\infty\mathbb R^N)$。左边多出的 $N$ 个坐标正是 $t_1,\dots,t_N$；右边多出的 $\mathbb R^N$ 是终端标量 $a_{i,N}=w^{i,N}(s)x^{i,N}$，$i\le N$。核对：$D_N$ 含 $t_i$（$N$ 个）与块 $(i,n)$（$i,n\le N$）；$U_N$ 只含块。所以等式其实是 $N+|\text{blocks}|=|\text{blocks}|+N$，恒真；真正的内容是**终端标量个数恰等于被拿走的行首标量个数**：冻结逆公式对块 $(i,N)$ 需要 $b_{i,N+1}$（下一块读出），下一块在窗外；终端标量把 $a_{i,N}$ 当作已知直接给出，$t_i=a_{i,0}$ 由 $b_{i,1}$ 给出，窗口内 $N$ 行 $N^2$ 块的读出链条被首尾钉死。

(b) 有限逆（`04:155-172`）逐字核：给 $(y,(c_i))$，$b_{i,n}=w^{i,n}(s)y^{i,n}$，$a_{i,0}=b_{i,1}$，$a_{i,n}=b_{i,n+1}(n<N)$，$a_{i,N}=c_i$，再 $x^{i,n}=y^{i,n}-v^{i,n}(a_{i,n-1}-a_{i,n})$。行算子作用后 $w^{i,n}x^{i,n}=a_{i,n}$（同第 4 节机制，$wv=1$ 是唯一的代数依赖）。界（`04:175-183`）：$\|(S_s^{(N)})^{-1}\|\le5$ 的账是 $|b|\le2h_0\Rightarrow|a|\le2h_0\Rightarrow\|x\|\le h_0+4h_0$；正向 $5\|x\|$ 加终端 $2\|x\|$。Brouwer 段（`04:192-208`）是关键一手：目标 $y\in U_N$，$h=\|y\|>0$，在 $\|x\|\le5h$ 闭球上定义 $s(x)=x/\max\{\|x\|,h/6\}$，$T(x)=(S_{s(x)}^{(N)})^{-1}(y,0)$。分母在 $x=0$ 不为 0，$T$ 连续；球的自映射：$\|T x\|\le5\|(y,0)\|=5h$。不动点 $x=T(x)$ 处，$h=\|S_{s(x)}^{(N)}x\|\le5\|x\|\Rightarrow\|x\|\ge h/5>h/6$，于是 $\max$ 取到 $\|x\|$，$s(x)=s_x$：状态自动回到真实规范化，人工正则化只在不动点之外有用。这最后一步我读了两遍才确认逻辑方向：先有不动点存在性（对正则化映射），再**事后**验证该点落在正则化不生效的区域，从而它是原问题的解。若先验地要求状态真实，映射就不连续（$\|x\|\to0$ 时 $x/\|x\|$ 无极限），Brouwer 无从谈起；这正是 $h/6$ 的全部职责。
窗外检查（`04:210-218`）：输入在 $D_N$ 外为 0，唯一可能漏出窗外的是块 $(i,N+1)$，它的修正是 $v^{i,N+1}(s_x)a_{i,N}$，而不动点方程强制 $a_{i,N}=0$（终端坐标喂的是 $0$），所以溢出恰好为 0。"extra scalar ... forces the possible output spillover to vanish"（`01:123-125`）说的就是这条。收尾：$g(D)$ 闭（下界 $1/5-24\eta$ 把 $g(x_k)$ 的 Cauchy 性拉回 $x_k$，完备性给极限，prop:global 的连续性给 $g(x_k)\to g(x)$）；有限支撑元稠密，故像既闭又稠密，是满射。
(c) $h/6$ 与 $h/5$：任何 $\delta h$ 只要 $\delta<1/5$ 都行，6 是取整方便；它同时是第 20 节 Lean 里 `blockSquare`/闭像路线不必对齐的东西（Lean 换了论证，见 §20）。
(d) 失败路线。其一，不加终端标量、直接对 $D_N\to U_N$ 用 Brouwer：维度亏 $N$，$(S_s^{(N)})$ 不再是自方阵族，逆公式在第 $N$ 行断链（需要 $b_{i,N+1}$）。其二，把终端坐标喂非零值 $c_i$：不动点只解出"带终端读出的目标"，$a_{i,N}=c_i\ne0$ 使 $(i,N+1)$ 块溢出非零，窗外验证失败；喂 0 与"令终端读数为 0"是同一个动作的两面。其三，Brouwer 只给满不给单，我考虑过改用度理论直接对无穷维 $D$ 工作：$g$ 非紧、度未定义；论文的"有限窗口+闭像+稠密"是把无穷维问题压回有限维的唯一廉价通道。[推测：三处失败模式论文均未成文。]

## 6 已知版图与检索所得（检索口吻，非论文结论）

这一节全部是我的检索与阅读记忆，与论文 tex 分开记账。论文自己的引文段是 `01:15-44`，我在上面各节已逐句对齐；下列是我额外查的背景，标注来源类型。[论文引用] 类：Ribe 1976（一致同构保有限维结构）、Aharoni–Lindenstrauss 1978（非可分双 Lipschitz 等价非线同，并提问可分版）、Ribe 1984 与 Aharoni–Lindenstrauss 1985（可分一致同构非线同；一致凸下不一致 Lipschitz 等价）、Johnson–Lindenstrauss–Schechtman 1996（刚性 + 弱关系下的可分例子）、Godefroy–Kalton–Lancien 2000（对 $c_0$ 子空间的等价即线同；对 $c_0$ 本身的等价即线同）、Kalton 2008（Problem 2/3 分列）、Hájek–Johanis–Schlumprecht 2024/2025（嵌入问题仍称 open）、Aharoni 1974（每个可分度量空间双 Lipschitz 入 $c_0$）、Kalton 2004（可分 Schur 空间一致同构于含补 $c_0$ 的空间；Schur 性排线性 $c_0$；`01:68-75` 明说该例交错后只有"非线性模"的一致吸收）、Sarí 2026（粗 Lipschitz 嵌入 $c_0$ 入可分对偶空间，粗界允许加性误差，`01:76-80`）、以及 2026-09-24 那篇 Lipschitz 等价非线性同的实可分反例（用 $c_0(\ell_2)$ 作线性障碍，`01:82-89` 声明与本文机制互斥独立）。
[检索所得] 类：我今天对该问题史的三次联网检索（双 Lipschitz $c_0$ 分类、Banach–Mazur 型定理、Lang–Plaut 类构造、Cao–Kalton 例子）命中里与本问题直接相关的增量几乎没有，多是泛泛的 Lipschitz/coarse Lipschitz 综述页（例如一篇 2024-12 的 Hilbert 空间度量刻画综述 arXiv:2412.20900，与本题只在"度量分类保线性结构"这一母题上相邻）。所以下面三条区别我按自己的知识背景写，请读者按"检索+背景笔记"口径读：其一，与 Lang–Plaut 型问题的分界：那边的分离发生在**子集与目标维数**之间（doubling 子集无可嵌入有限维欧氏空间的定理，参见我 D26 笔记），度量结构对目标维数刚性；本文的分离发生在**同一对空间的全空间等价与子空间型态**之间，目标维数不是变量。其二，与 Banach–Mazur 型定理（可分度量空间万有入 $C[0,1]$）的关系：本文 cor:same-space 第 3 条（`08:36`，每个可分度量空间双 Lipschitz 入 $Z$）是它的 $c_0$-双 Lipschitz 版升级：Aharoni 给万有目标 $c_0$，本文把万有目标换成一个无线性 $c_0$ 的 $Z$，说明"万有度量目标"这条线里线性 $c_0$ 是可以完全不出现的。其三，与 Kalton 2004 的分界：那是"一致同构 + Schur"，模非线性、吸收只有宽度意义；本文把关系收紧到双 Lipschitz 且满，代价是放弃 Schur 之类的现成线性障碍，改用整套检测器机器自建障碍。这三条在 tex 里都没有对应句子，是我自己的版图判断，凡不踏实处请参照第 21 节怀疑清单。
与 D26 的分界一句话版：D26 的对象是 Hilbert 中的加倍点集与有限维欧氏目标，障碍是微分/打包型的；本篇的对象是 Banach 空间对与线性拷贝，障碍是组合/检测器型的，两篇唯一的共同词表只有 "bi-Lipschitz" 与 Lipschitz-free 工具引用；展开在 §18。

## 7 两台局部操作机：$G$ 抹平，$R$ 记账

从这一节起进入 $Z$ 的建造。任务清单我按 `05:3-8` 复述：要把修正 $h(s)=(S_s-P)s$ 的每个坐标 $f_\gamma$ 提升成一个 $B$ 上的 Lipschitz 函数族（后做商完备成 $Z$），并且族的支撑要可控，为 §14 的排除铺路。核心 Lemma 5.1（`05:52-75`，逐字）：

```tex
\begin{lemma}[Bounds and geometric support]\label{lem:operations}
For every such \(u,q,\varepsilon\),
\begin{align}
 \|R_{q,\varepsilon}u\|_\infty
   &\leq\varepsilon\Lip(u),&
 \Lip(R_{q,\varepsilon}u)&\leq3\Lip(u),&
 \Lip(G_{q,\varepsilon}u)&\leq4\Lip(u), \label{eq:operation-lip}\\
 \|G_{q,\varepsilon}u\|_\infty
   &\leq\|u\|_\infty,&
 \|R_{q,\varepsilon}u\|_\infty&\leq2\|u\|_\infty. \label{eq:operation-sup}
\end{align}
\end{lemma}
```

定义在 `05:26-42`：$\chi$ 是 2-Lipschitz 折线（$[0,1/2]$ 上 0，$(1/2,1)$ 斜率 2，$\ge1$ 后常 1）；$(G_{q,\varepsilon}u)(s)=u(q)+\chi(\|s|_I-q\|_\infty/\varepsilon)(u(s)-u(q))$；$R=G-\mathrm{Id}$。$u(q)$ 是零延拓求值。
(b) 推导补全。记 $a(s)=1-\chi(\|s|_I-q\|_\infty/\varepsilon)$，则 $Ru(s)=a(s)(u(q)-u(s))$，$0\le a\le1$，$\Lip(a)\le2/\varepsilon$（$\chi$ 的 2 乘 $1/\varepsilon$ 的商规则）。sup 界：$a(s)\ne0$ 时 $\|s|_I-q\|<\varepsilon$（$\chi<1$ 区域），于是 $|u(q)-u(s)|\le\varepsilon\Lip(u)$。Lip 界三步：对 $s,t$，设 $a(t)\ne0$，恒等式（`05:91-94` 逐字）$Ru(s)-Ru(t)=a(s)(u(t)-u(s))+(a(s)-a(t))(u(q)-u(t))$，第一项 $\le\Lip(u)\|s-t\|$，第二项 $\le(2/\varepsilon)\|s-t\|\cdot\varepsilon\Lip(u)=2\Lip(u)\|s-t\|$，合计 3。$G=u+R$ 给 4。$\|Gu\|\le\|u\|$：$Gu$ 是 $u(q)$ 与 $u(s)$ 的凸组合（$\chi\in[0,1]$）；$\|Ru\|\le\|G\|+\|u\|\le2\|u\|$。
支撑账（eq:operation-support，`05:71-74`）：$K_I(u)=\overline{\{s|_I:u(s)\ne0\}}$（在紧致立方内，闭包自动紧）。新非零只可能产生在旧非零值的 $\varepsilon$-邻域（若 $u(s)=0$ 而新值非零，则 $u(q)\ne0$ 且 $\|s|_I-q\|<\varepsilon$），故 $K_I(Gu),K_I(Ru)\subset K_I(u)_\varepsilon$；$R$ 还额外有 $K_I(Ru)\subset\overline B_\infty(q,\varepsilon)$（$\|s|_I-q\|\ge\varepsilon$ 处 $\chi=1$、$a=0$）。第二条包含后面被反复使用：$R$ 项天然住在中心球里。
(c) 常数：4 与 3 都来自 $\chi$ 的斜率 2 和恒等式里的双份 $\varepsilon$ 放大；半径 $\varepsilon/2$ 平台（开圆柱内 $G$ 常值）来自 $\chi$ 在 $[0,1/2]$ 段为 0。$\varepsilon$ 限定二进制 $2^{-a}$、中心限定 $\mathcal Q_{I,\varepsilon}$（间距 $\varepsilon/8$ 网格），每点到格点距离 $\le\varepsilon/16$：$\varepsilon/16$ 只在 §14 选中心时用（`05:23-24` 那句 "within $\varepsilon/16$"），我起初以为它进 Lipschitz 账，核了一遍发现它只是保证中心可选得离目标近。
(d) 失败路线。其一，我试过 $\chi$ 取平滑 bump：界全部变（斜率常数变大），且"$G$ 在圆柱上恰为常数"要精确成立（§14 的 nested plateaux 依赖 $e_i$ 是**精确**常数值），平滑版只给近似常值，配对账里多出无法收敛的尾项。[推测：论文用折线 $\chi$ 就是为了平台精确。] 其二，$G$ 与 $R$ 若允许跨坐标集操作（对 $I$ 外的坐标敏感），$K_I$ 的支撑压缩全部失效，§14 的"嵌套"无从谈起；`05:13-15` 特意把一切限制在依赖 $I$ 的函数上。其三，模常数等价类的想法死在 `05:134-137` 那句预告里：分子配对确实忽略常数，但"generated function"的支撑与平台值是后续论证的实变量，不能换代表。

## 8 尺度预算、尾因子与逐类界

类定义（`05:115-124`）：$\mathcal T_h$ 是从单个 $f_\gamma$ 出发、至多 $h$ 次 $G/R$ 操作（尺度非增 $\varepsilon_1\ge\cdots\ge\varepsilon_m$）且总尺度 $\sum\varepsilon_k<\ell_j/2$（eq:scale-rule，$j$ 是标签的 band）。$m=0$ 允许（$\mathcal T_h$ 含全部 $f_\gamma$）。尾因子（`05:177-193`，eq:tail）：$\tau_N(s)=\sup_{k>N}|s_k|$，$b_{c,N}(s)=\min\{1,(2-\tau_N(s)/c)_+\}$；$\tau_N$ 是 1-Lipschitz 且逐点趋于 0（$s\in c_0$）。两个支撑（eq:tail-support）：$\supp b_{c,N}\subset\{\tau_N\le2c\}$、$\supp(b_{c,N}-1)\subset\{\tau_N\ge c\}$；Lipschitz 各 $\le1/c$、sup $\le1$。$\mathcal V_h$：$u\prod_{r\le l}\beta_r$，$u\in\mathcal T_h$ 且代表标签 $j\le h$，$l\le h$，$c_r\in\{2^{-a}:a\le h\}$。类清单 $\mathcal T_1,\mathcal V_1,\mathcal T_2,\mathcal V_2,\dots$（eq:classes）。
Lemma 5.2（支撑传播，`05:139-156`）：在 $\supp_B u$ 上 $\|\pi_js-\xi\|\le2d_j+e$（$j\ge1$）、$r_\lambda\ge\ell_j-e$（$j<J_\lambda$），$e$ 为总尺度；配 eq:scale-rule 得粗版 $2d_j+\ell_j/2$、$\ell_j/2$（eq:support-coarse）。推导：归纳一步我补：新函数在 $s$ 非零、旧函数在 $s$ 零时，旧函数在 $q$（零延拓）处非零且 $\|s|_I-q\|<\varepsilon$；$\pi_j,r_\lambda$ 都只依赖 $I_\gamma$，坐标限制范数 1、$r_\lambda$ 在该立方上 1-Lipschitz，所以两个不等式分别至多劣化 $\varepsilon$。这里我核对过一个隐蔽点：eq:correction-support 的两个条件是**闭**不等式，所以能从非零集过渡到相对闭包支撑（`05:158-161`），这是支撑账能归纳的地基。
(c) 预算 $\ell_j/2$ 的机械理由：严格不等式留出正余量，保证 §14 里"再加一次足够小的操作"后仍在类内（`05:127-131` 明说）。$b_{c,N}$ 的支撑两半 $\{ \tau\le2c\}$ 与 $\{\tau\ge c\}$ 不相交（$c<2c$ 的分离带），尾分离（§13 的 lem:tail-separation）全靠这两个反向支撑。
Lemma 5.3（逐类界，`05:214-224`）：$\mathcal T_h$ 里 $\|u\|\le2^hA$、$\Lip(u)\le4^hL_0$；$\mathcal V_h$ 里 sup 同、Lip 加 $h4^hA$。推导：$G$ 保 sup、$R$ 翻倍 sup，$h$ 次至多 $2^h$；每次 Lip 乘 4；尾因子：sup $\le1$、Lip $\le1/c_r\le2^h$（$c_r\ge2^{-h}$），乘积 telescoping 给 $\le h2^h$，乘法规则 $(2^hA)(h2^h)=h4^hA$。注意论文这里写 "Lipschitz constant at most $2^h$"（`05:228-229`）用的是 $1/c\le2^h$。$A\le4$、$L_0\le4+12\eta$ 从 eq:base-bounds（`04:240-243`）转来。
(d) 失败路线：我试过把所有类合成一个类（预算 $h$ 不固定，取全体并集）：并集下 $\sup$ 与 Lip 无一致界，§10 里"$B_{\mathcal L}$ 有限"作废，逐点极限论证（eq:fixed-vector）失去一致对偶界。[推测：分层清单 $\mathcal T_1,\mathcal V_1,\dots$ 的存在理由就是把一致界拆回逐类，再靠 $\alpha_d$ 权重把无穷多类缝进一个平方和。] 另一个失败尝试：尾因子用 $\tau_N/c$ 的光滑衰减（比如 $e^{-\tau/c}$）：Lip 常数与 $1/c$ 同阶但 sup 严格小于 1 处处成立，$b_{c,N}\to1$ 的逐点收敛仍在，可 §15 的支撑 $\{\tau\le2c\}$ 变成全空间，尾分离作废。截断折线在这里同样是本质。

## 9 分子范式：外层平方和加趋一的指数

$\mathcal M_0(B)$：质量零有限形式和 $m=\sum a_s\delta_s$（`06:11-16`）。$\langle u,m\rangle=\sum a_su(s)$，常数配对为 0。对三元组 $d=(\mathcal L,C,p)$（$p=1+1/k$）定义（eq:sigma，`06:28-36` 逐字）：

```tex
 \sigma_d(m)=
 \sup\left\{
 \left(\sum_{\nu=1}^l|\langle u_\nu,m\rangle|^p\right)^{1/p}:
 \begin{array}{l}
 l\geq0,\quad u_1,\ldots,u_l\in\mathcal L,\\
 \Lip\!\left(\sum_{\nu=1}^l e_\nu u_\nu\right)\leq C
 \ \text{for every }(e_\nu)\in\{-1,1\}^l
 \end{array}\right\}.
```

（a) 续：等价判据（eq:admissible-increments，`06:42-45`）：可取符号匹配增量再三角不等式，两个方向我核过。权重与范式（`06:52-55`）：$\alpha_d=2^{-d}/C_d^2$，$\|m\|_0=(\sum_d\alpha_d\sigma_d(m)^2)^{1/2}$。
Lemma 6.1（精确完备范式，`06:66-81` 陈述；关键结论 eq:completed-norm：$\|z\|_Z^2=\sum_d\alpha_d\sigma_d(z)^2$ 对**每个** $z\in Z$ 精确成立，$\zeta(s)=[\delta_s-\delta_0]$ 是 1-Lipschitz）。
(b) 有限性：$\sigma_d(\delta_s-\delta_t)\le C_d\|s-t\|$（用 eq:admissible-increments：$\ell_p$ 范 $\le\ell_1$ 和）；一般 $m=\sum a_s(\delta_s-\delta_0)$ 得 $\sigma_d(m)\le C_d\sum|a_s|\|s\|$。$\sum_d\alpha_dC_d^2=\sum2^{-d}=1$ 令 $\|m\|_0\le\sum|a_s|\|s\|$ 有限，且 $\|\delta_s-\delta_t\|_0\le\|s-t\|$（$\zeta$ 的 1-Lip 来源）。次可加：Minkowski（$\ell_2$ 值映射 $m\mapsto(\sqrt{\alpha_d}\sigma_d(m))$，逐坐标是半范，$\ell_2$ 范是半范）。可分：$B$ 可分（$D$ 可数坐标 $c_0$），取可数稠密 $B_0$，$\zeta(B_0)$ 的有理线性张成稠。eq:completed-norm 的精确性：映射进 $\ell_2$ 是 1-Lipschitz（坐标差 $\le\sqrt{\alpha_d}\sigma_d(m-m')$），分子收敛则 $\ell_2$ 像收敛，逐坐标连续给出极限坐标，范数即像范数。
(c) $\alpha_d=2^{-d}/C_d^2$ 的双重作用：$2^{-d}$ 让无穷和收敛（枚举三元组 $d=1,2,\dots$）；$1/C_d^2$ 与 $\sigma_d\le C_d\cdot$（增量和）配合，使单层 $\sigma_d$ 的贡献被归一。`06:58-64` 的自述我要拆成两条：外层平方和"迫使某一个固定半范在一列向量上 Stay 住"（否则逐 $d$ 趋于 0 时质量可以沿 $d$ 漂移，滑驼峰一节处理它，§12）；指数 $p\downarrow1$ 的作用"把一个列表的检测收缩到一个标量测试"（§12 末段）。这两个功能互不重叠，缺一个排除就塌。
(d) 失败路线。其一，只用单个 $p$-直和（不分外层平方）：滑驼峰（gliding hump）可以在 $d$ 方向把质量搬走，检测不集中在一个类；我推过一版 $\ell_1(d)$ 加权，同样死，因为搬走质量的操作对任何可分权重都成立，需要的恰是**平方**加 Jensen：$C_2$ 型凸性不等式只在二次方时给出"期望 $\ge$ 逐项和"的干净形态（§12 的 eq:seminorm-convexity）。其二，$p$ 取固定 $p>1$：§12 末的 $\delta=((a/2)^p/B_0^{p'})^{1/(p-p')}$ 要求 $p'>1$ 可用，固定 $p$ 时取不到更小的 $p'$ 在同一 $(\mathcal L,C)$ 里。$p=1+1/k$ 清单保证任意 $p$ 之下还有 $p'$。[推测：若 $p=1$ 直接入表，$\sum|\langle u_\nu,m\rangle|$ 列表和与单标量之间无收缩引理，检测步骤退化。] 其三，我最初想用标准 Lipschitz-free 空间 $\mathcal F(B)$ 的 Kan–Robbins 范式一步到位：那给的是所有 1-Lipschitz 函数的 sup，$Z^*$ 里立刻有巨大对偶，$c_0$ 排除无从谈起（对偶太大时平方和消失于无穷类）；本文的自造范式只枚举可数生成的测试类，`06:22-23` 那句 "no universal property of the usual free space is assumed" 就是这个分工声明。

## 10 对偶：逐点极限与固定向量

Lemma 6.2（`06:143-162` 陈述，eq:fixed-vector：$|\langle u_n-u,z\rangle|\le|\langle u_n-u,m\rangle|+2B_{\mathcal L}\|z-m\|_Z$）。
(b) 三步。第一步（单例可容）：固定类 $\mathcal L$ 取 $C_{\mathcal L}$ 为逐类界（lem:class-bounds）的上整，则任何单个 $u\in\mathcal L$ 是三元组 $d_{\mathcal L}=(\mathcal L,C_{\mathcal L},2)$ 的列表，得 $|\langle u,m\rangle|\le\sigma_{d_{\mathcal L}}(m)\le\alpha_{d_{\mathcal L}}^{-1/2}\|m\|_0$，于是每个测试是 $Z^*$ 中范数 $\le B_{\mathcal L}=\alpha_{d_{\mathcal L}}^{-1/2}$ 的泛函，且**同界**。第二步（列表算子延拓）：$\Lambda_{\boldsymbol u}m=(\langle u_\nu,m\rangle)_\nu$ 进 $\ell_p^l$，界 $\alpha_d^{-1/2}$；$\sigma_d$ 是这些延拓后的列表算子的 sup，sup 保持 Lipschitz（同一 supremum 差估计），与 $\sigma_d$ 在稠密分子集上重合，故就是连续延拓：eq:sigma 在 $Z$ 上**仍然精确**。第三步（逐点极限）：$u_n\to u$ 逐点，则对固定分子 $m$ 配对收敛（有限和）；界 $B_{\mathcal L}$ 传递到极限泛函（Banach–Alaoglu 型：在 $Z^*$ 中取值，逐点有界网有弱*聚点；论文用直接论证：极限在分子上的作用延拓为界 $B_{\mathcal L}$ 泛函）；eq:fixed-vector 是三角拆 $\le|\langle u_n-u,m\rangle|+|\langle u_n-u,z-m\rangle|$ 配两个 $B_{\mathcal L}$ 界。给定 $z,\delta$：先选分子 $m$ 使 $\|z-m\|<\delta/(4B_{\mathcal L})$，再取 $n$ 大让有限项 $<\delta/2$。
(c) 量化顺序是本节的灵魂："先固定 $z$，后选 $n$"。`06:197-199` 特意声明"choice of $m$ and $n$ may depend on $z$"，因为逐点极限在类上不一致，任何"对整列 $m_i$ 同时逼近"的引理都不存在。§14 里每次修改测试（$F_{i,\theta_i}$、$\widetilde F_{i,\theta_i}$）都严格遵循"绑定单个 $m_i$ 后选尺度"，这是被本节的措辞锁死的。
(d) 失败路线：我想用一致收敛（sup-范拓扑）替代逐点：$G_{q,\theta}$ 修改列的 sup 差 $\le\theta\Lip(F_i)\le\theta4^hL_0$，对固定 $h$ 类是**有**一致界的！那为什么不直接 sup 范收？我推演的答案：检测账需要的是 $|\langle\cdot,m_i\rangle|$ 收敛，sup 界只对**同列** $F_i$ 的 Lip 一致时才统一，§14 里 Lip 界来自逐类界（同一个 $h$），确实一致；但 $R$ 展开项的 $u_i$ 平台值 $e_i$ 收敛账里，$m_i$ 沿列动，sup 收敛给出的 $\le\theta_i\cdot$(Lip 界)$\cdot\|m_i\|$（$\|m_i\|\le M$）**同样**够。真正的障碍在 §14 第一情形之外没有 sup 一致的场合……我最终确认 tex `05:134-137`（不做模常数等价类）与本节 `06:197-199` 的口径是防"把测试换成另一个几乎处处接近的函数"这类偷换，sup 路线在数学上或可幸存，但会被等价类偷换污染支撑语义。标 [推测：两种口径的强弱论文未比较]。

## 11 $Q$ 与 $K$：提升在分子世界里精确闭合

Lemma 6.3（`06:202-208`）：存在有界线性 $Q:Z\to U$ 使 $Q\zeta(s)=h(s)$。推导（`06:210-228`）：$Q_0m=\sum a_sh(s)$；每坐标 $\langle f_\gamma,m\rangle$，而 $f_\gamma\in\mathcal T_1$（$m=0$ 表示），$C_0\ge L_0$、$d_0=(\mathcal T_1,C_0,2)$，得 $\|Q_0m\|_U=\sup_\gamma|\langle f_\gamma,m\rangle|\le\sigma_{d_0}(m)\le\alpha_{d_0}^{-1/2}\|m\|_0$；延拓进完备 $U$。$h(0)=0$ 保证 $Q\zeta(s)=Q[\delta_s-\delta_0]=h(s)-h(0)$。
Lemma 6.4（`06:235-247`）：径向延拓 $K(x)=\|x\|\zeta(x/\|x\|)$，$\Lip(K)\le3$，$QK=g-P$。推导：$a=\|x\|\ge b=\|x'\|>0$，$s=x/a$，拆 $K(x)-K(x')=(a-b)\zeta(s)+b(\zeta(s)-\zeta(s'))$：第一 $\le|a-b|\le\|x-x'\|$；第二用 $\|\zeta\|_L\le1$ 给 $b\|s-s'\|\le2\|x-x'\|$（eq:normalization，$M=\max=a$，$2d/M\cdot b\le2d$）。合计 3。恒等式：$QK(x)=\|x\|h(s_x)=\|x\|(S_{s_x}-P)(x/\|x\|)=S_{s_x}x-x'=g(x)-Px$（$S_s$ 线性故齐次提出）。$x=0$ 两侧为 0。
(c) 为什么 $K$ 的界 3 而 $\zeta$ 的界 1：径向延拓的经典损失因子，2 来自归一化误差的 $2d/M$，1 来自范数差本身。任何让 $\zeta$ 的 Lip 界劣于 1 的改动（比如分子范式权重变小）会等比放大吸收公式里的 $L_K=3$。
(d) 失败路线：我试过 $K$ 直接线性（把 $\zeta$ 线性延拓到全 $D$）：$\zeta$ 定义在球上、值在商分子空间，没有线性化通道，除非 $B$ 是凸锥且 $\zeta$ 限制线性，两者都不成立（$\zeta$ 双 Lipschitz 下界都没有）。另一条：把 $Q$ 定义成显式坐标投影（先造 $Z$ 再投影）：本文 $Z$ 是商完备，元素没有坐标表示，$Q$ 只能经配对定义；这是"先给 $Q$ 在生成元上的作用、再让它穿过范式"的顺序，与 lem:Q 证明的结构一致。[推测：顺序颠倒的路线死在 $Z$ 的元素没有可用表示。]
至此吸收准则的三件数据 $(g,Q,K)$ 齐：$g$ 满（prop:onto）、$QK=g-P$（lem:K）、$Q$ 有线界。`06:271-274` 收束："未用 $Q$ 的满射性，也未证明"。我读到这里确认第 1、2 节 GK03 障碍已被绕开：$Q$ 的像包含 $h(B)$ 的线性张成，但它不需要有右逆；一切由 $g$ 的满射性经吸收公式反供。剩下的唯一缺口：$Z$ 里没有线性 $c_0$。

## 12 检测器提取：平方和防滑驼峰，指数趋一收缩到单测试

设 $(m_i)$ 满足 eq:bounded-signed（`07:21-25`）：$\|m_i\|\ge r$、所有有限符号和 $\le M$。这正是"$c_0$ 基像"的度量骨架：若 $m_i=Te_i$，取 $r,M$ 为 $T$ 的双界即可（$\|\sum_{i\in H}\epsilon_ie_i\|_\infty=1$）。Lemma 7.1（`07:19-33` 陈述）断言两件事：$u(m_i)\to0$ 对一切 $u\in Z^*$（弱零），且 subsequentially 存在同一清单类 $\mathcal L$ 内的测试 $F_i$ 使 $|\langle F_i,m_i\rangle|\ge\delta$（eq:detected）。
(b) 推导全走。弱零：对固定 $u$，选符号匹配 $u(m_i)$，$\sum_{i\in H}|u(m_i)|\le M\|u\|$，正项级数有界故通项趋于 0。
第一段（固定半范防滑驼峰）。反设所有 $\sigma_d(m_i)\to0$。$v_i=(\sqrt{\alpha_d}\sigma_d(m_i))_{d\ge1}\in\ell_2$，eq:completed-norm 给 $\|v_i\|_2=\|m_i\|_Z\in[r,M]$，逐坐标趋 0。滑驼峰选取（`07:51-63`，未编号论证）：逐段取不相交有限区间 $A_i$，使 $\sum_{d\in A_i}\alpha_d\sigma_d(m_i)^2\ge r^2/4$（eq:hump-mass）：定前段端点后，逐坐标收敛让"前段质量 $<r^2/4$"对足够晚的 $i$ 成立，再挑新端点让尾质量 $<r^2/4$，中间夹出 $\ge r^2/2>r^2/4$。注意 $A_i$ 的**不相交性**是后面求和能相加的原因。
凸性账（eq:seminorm-convexity，`07:69-72`）：$\sigma_d^2$ 偶且凸（半范凸、平方在 $[0,\infty)$ 增凸）；对 $y+m$、$y-m$ 用 Jensen：$\frac{\sigma_d(y+m)^2+\sigma_d(y-m)^2}{2}\ge\sigma_d(m)^2$（取中点 $m=\frac{(y+m)+(y-m)}2$……核对：中点是 $y$？重算：两点 $\frac{(y+m)+(y-m)}{2}=y$，Jensen 给 LHS $\ge\sigma_d(y)^2$。而论文的用法是先对 $m_i$ 的符号平均：视 $\sigma_d(\sum_{k\in H}\epsilon_km_k)^2$ 为 $\epsilon_i$ 的函数，固定其余符号，$y=\sum_{k\ne i}\epsilon_km_k$、$\pm m$ 为 $\pm m_i$ 两选择，平均 $\ge\sigma_d(y)^2$……但论文写的是 $\ge\sigma_d(m_i)^2$。我核对的版本：对**所有**符号等分布取期望，$\mathbb E\sigma_d(\sum\epsilon_km_k)^2$ 固定除 $i$ 外的符号后，内层对 $\epsilon_i=\pm$ 平均给 $\ge\sigma_d(y)^2$ 其中 $y$ 是另一半……这里 Jensen 的两个输入是 $\sum_{k\ne i}\epsilon_km_k+\epsilon_im_i$ 与其 $\epsilon_i$ 翻转，二者中点 $\sum_{k\ne i}\epsilon_km_k$。要得到 $\sigma_d(m_i)^2$ 下界需要反向配对：对**全部**符号做对合（翻转整个 $H$ 的符号并配偶性）只能得对称化。最终我确认论文路线（`07:73-78`）：随机符号下 $\mathbb E\,\sigma_d(\sum_k\epsilon_km_k)^2\ge\sigma_d(m_i)^2$ 对每个 $i\in H$ 成立，这一步用 Jensen 于"以其余符号为条件、$\epsilon_im_i$ 取 $\pm$"的两点平均，条件期望值 $\ge\sigma_d(\sum_{k\ne i}\epsilon_km_k)^2$，再对 $i$ 以外取期望并用 $\sigma_d$ 的三角不等式与零期望向量……坦白说：两点平均的凸性给的条件下界不是 $\sigma_d(m_i)^2$ 本身。让我用另一种等价拆法核对：把 $\sum\epsilon_km_k$ 写成 $(\epsilon_im_i)+R$，对 $\epsilon_i$ 平均：$\frac{\sigma_d(m_i+R)^2+\sigma_d(-m_i+R)^2}{2}\ge\sigma_d(R)^2$。这与 $\sigma_d(m_i)^2$ 无关。要拿 $\sigma_d(m_i)^2$ 应当把 $R$ 平均掉：$\mathbb E_R\sigma_d(\cdot)^2\ge(\mathbb E\sigma_d)^2$？我再走一遍论文原文："average first over the sign of $m_i$ and use \eqref{eq:seminorm-convexity}"。取 (a)：$y+m$、$y-m$ 平均 $\ge\sigma_d(m)^2$ 需要 $\sigma_d(y+m)^2+\sigma_d(y-m)^2\ge2\sigma_d(m)^2$。用偶性把 $y-m$ 写成 $-(m-y)$：即 $\sigma_d(y+m)^2+\sigma_d(m-y)^2\ge2\sigma_d(m)^2$，这是把 $y+m$、$m-y$ 视输入、$m=\frac{(y+m)+(m-y)}2$ 为中点的 Jensen：凸函数在两点均值处的值 $\le$ 两点值的平均。成立！$m$ 恰是两输入的中点。这就是 eq:seminorm-convexity 的真实内容，我先前把中点算错。于是条件期望（固定其余符号 $y=\sum_{k\ne i}\epsilon_km_k$）给 $\mathbb E_{\epsilon_i}\sigma_d(\sum\epsilon_km_k)^2\ge\sigma_d(m_i)^2$；其余符号再积分掉。
合并：$M^2\ge\mathbb E\|\sum\epsilon_km_k\|^2=\sum_d\alpha_d\,\mathbb E\sigma_d(\cdot)^2\ge\sum_{i\in H}\sum_{d\in A_i}\alpha_d\sigma_d(m_i)^2\ge|H|r^2/4$，$|H|>4M^2/r^2$ 矛盾。故存在 $d=(\mathcal L,C,p)$ 与 $a>0$、子列使 $\sigma_d(m_i)\ge a$。
第二段（指数收缩）。取 $p'=1+1/k'<p$ 同 $(\mathcal L,C)$ 记 $d'$；$\sigma_{d'}(m_i)\le\alpha_{d'}^{-1/2}M=:B_0$（单列表 $\ell_{p'}$ 和 $\le$ 符号和界 $M$ 的同一机制）。取使 $\ell_p$ 值 $\ge a/2$ 的可容列表，$x_\nu=|\langle u_\nu,m_i\rangle|$：$(a/2)^p\le\sum x_\nu^p\le(\max x_\nu)^{p-p'}\sum x_\nu^{p'}\le(\max x_\nu)^{p-p'}B_0^{p'}$（第一号：$p$ 方和 $\ge(a/2)^p$；第二号：$x^p=x^{p-p'}x^{p'}$ 且 $\sum x^{p-p'}_\nu\le(\max)^{p-p'}\cdot$？核对：$\sum_\nu x_\nu^p\le(\max_\nu x_\nu)^{p-p'}\sum_\nu x_\nu^{p'}$，因 $x_\nu^p\le(\max)^{p-p'}x_\nu^{p'}$ 逐点成立。第三号：同列表对 $d'$ 可容，$\sum x^{p'}\le\sigma_{d'}(m_i)^{p'}\le B_0^{p'}$）。解出 $\max x_\nu\ge\delta=((a/2)^p/B_0^{p'})^{1/(p-p')}>0$，取对应测试为 $F_i$。
(c) 常数的位置：$r^2/4$、$r^2/2$ 是滑驼峰余量选择；$a/2$ 是 sup 到近似的松弛；$\delta$ 表达式里 $p-p'$ 在分母指数上，说明两个指数越接近，$\delta$ 越小但保持正，趋一的必要性在这里露了底：收缩依赖 $p-p'>0$，趋一保证清单里永远有更小的 $p'$ 可用。
(d) 失败路线。其一，若外层是 $\ell_1(d)$ 和：滑驼峰矛盾变成 $\sum_d\alpha_d\mathbb E\sigma_d\ge$ 线性项，但 $\sigma_d$ 一次方无 Jensen 平方凸性可用，$M\ge\mathbb E\|\cdot\|$ 只给一次方期望，驼峰搬移不再受二阶约束控制。[推测：平方是这一段的本质。] 其二，$p$ 固定：列表可能由无穷多个 tiny 配对支撑，$\max x_\nu$ 可以无下界（例如 $l$ 项各 $a/(2l)$），$\ell_{p'}$ 和随 $l\to\infty$ 发散于……$p'>1$ 时 $\sum x^{p'}\le B_0^{p'}$ 仍约束，但 $x_\nu\le B_0 l^{-1/(p'-1)}$ 型分散确实可能让单测试检测失败；趋一清单 $p'\downarrow1$ 时 $B_0^{p'}/(p-p')$ 指数爆炸换回正 $\delta$。我按 tex 复核的机制：不等式链只用 $p-p'>0$，故任一固定 $p$ 只需清单里存在某个 $p'<p$；趋一清单同时服务防滑驼峰的另一半（每个 $p$ 是某个 $d$ 的分量）。[推测成分明确标出。] 其三，直接从 eq:bounded-signed 提取 Schur 型凸块序列（经典 Rosenthal $\ell_1$ 替代论证）：$Z$ 无对偶显式描述，标准 dichotomy 用不上；本文的检测全走自造半范。

## 13 兼容性与两类支撑几何

定义（`07:115-117`）：测试列**兼容**指其一切有限符号和有共同 Lipschitz 界。范式 eq:sigma 的可容列表条件就是兼容性，所以兼容检测器把配对与范数的桥搭直。Lemma 7.2（增长，`07:120-138` 陈述，eq:detector-growth：$\max_\epsilon\|\sum_H\epsilon_im_i\|\ge\sqrt{\alpha_d}\,\delta\sqrt{|H|}$，$d=(\mathcal L,C,2)$）。
(b) 推导：列表 $(F_k)_{k\in H}$ 对 $d$ 可容（兼容界 $\le C$；符号和 $\le C$ 正是 eq:sigma 的条件，且 $p=2$ 入表）。随机符号下（`07:144-152`）：

```tex
 \mathbb E\,\sigma_d\!\left(\sum_{i\in H}\epsilon_i m_i\right)^2
 &\geq
 \mathbb E\sum_{k\in H}
       \left|\sum_{i\in H}\epsilon_i
                    \langle F_k,m_i\rangle\right|^2\\
 &=\sum_{k\in H}\sum_{i\in H}|\langle F_k,m_i\rangle|^2
 \geq |H|\delta^2.
```

第一号：$\sigma_d\ge$ 该具体列表的 $\ell_2$ 值（sup 定义），平方后取期望逐项。等号展开：交叉项 $\epsilon_i\epsilon_j$（$i\ne j$）期望为 0，对角项留 $|\langle F_k,m_i\rangle|^2$。论文 `07:153-154` 强调：相消只用了符号独立性，不要求任何交叉配对 $\langle F_k,m_i\rangle$（$k\ne i$）为零。再经 eq:completed-norm：$\max\ge\mathbb E\|\cdot\|^2\ge\alpha_d|H|\delta^2$。开方。
(c) 机制：$c_0$ 基的符号和有界 $M$，兼容检测器逼符号和按 $\sqrt{|H|}$ 增长（Rademacher 型），二者对 $|H|>M^2/(\alpha_d\delta^2)$ 不可兼容。$\sqrt{|H|}$ 的根源就是 $p=2$ 的对角展开，平方范式第二次显利（第一次在滑驼峰）。
(d) 失败路线：若检测测试跨多个类混合，$d=(\mathcal L,C,2)$ 无法统一取，对角账里不同 $\sigma_d$ 各算各的，$\sqrt{|H|}$ 增长分摊后可能被外层 $\alpha_d$ 权重稀释掉。lem:detectors 的"一个类"输出正是为保护这里的可容性。[推测。]

Lemma 7.3（兼容支撑，`07:179-198`）两分支：(1) 闭相对支撑两两不相交 $\Rightarrow$ 符号和 Lip $\le L$；(2) 存在相对开集 $C_i\ni\supp u_k$（$k>i$）且 $u_i=e_i$ 在 $C_i$ 上常数，配 $\sum|e_i|\Lip(b_i)<\infty$，则符号和 Lip $\le L+\sum|e_i|\Lip(b_i)$。
(b) 推导：逐点局部分析。情形 (1)：任一点至多一个支撑含它，该点邻域内和式局部是单个 $\pm F_i$ 或 0。情形 (2)：取被 $u_j$-支撑覆盖的最大下标 $j$，更晚者邻域内为 0，更早的 $i<j$ 在该点的 $C_i$ 邻域交集里 $u_i\equiv e_i$，于是邻域内和 $=\epsilon_jF_j+\sum\epsilon_ie_ib_i$，局部界 $L+\sum|e_i|\Lip(b_i)$（用到 $\|\epsilon_jF_j\|$ 的局部界并入 $L$：$F_j$ 本身 $\le L$）。局部到全局：线段紧、Lebesgue 数细分、共线段相加，长度和恰为端点距。这一步我核过必要性：$B$ 凸（`07:180` 假设）才允许线段论证；$D$ 的单位球凸，满足。
(c) 求和条件的机械理由：局部界里 $b_i$ 项以 $|e_i|$ 加权出现无穷次，不绝对可和则"公共界"发散。$b_i=1$ 时自动（情形 (2) 的干净版）。
(d) 失败路线：我试过把 (2) 的 $C_i$ 要求减弱为支撑包含（不用常数平台）：局部展开里旧项不是常数，$\epsilon_iu_ib_i$ 的梯度项无法吸收进任何单测试界，链断。平台常数性是情形 (2) 的心脏，后面 §15 的两个 plateaux 构造全部围绕它。[推测性对照：Kalton 2004 的 Lemma 4.5（`07:171-174` 引）用 Lipschitz 截断得到类似的局部化叠加，那里的载体是度量分片，本文换成有限坐标圆柱与尾区。]

Lemma 7.4（尾分离，`07:230-269`）：设 $|\langle F_i,m_i\rangle|\ge\delta$、$\supp F_i\subset\{\tau_{M_i}\ge c_*\}$、$M_i\to\infty$、band 有界，则一子列有 $\mathcal V_H$ 内修改测试，检测 $\ge\delta/2$，支撑两两不相交。
(b) 推导：取二进制 $c=2^{-a}$、$2c<c_*$。统一 $H>\max\{h,\text{band界},a\}$ 容纳多出的一个尾因子，$F_i$ 与 $F_ib_{c,N}\in\mathcal V_H$。逐点 $b_{c,N}(s)\to1$（$\tau_N\to0$），lem:duality 在同一类内给 $\langle F_ib_{c,N},m_i\rangle\to\langle F_i,m_i\rangle$（固定 $m_i$ 后才选 $N$，$N$ 依赖 $i$）。递归选列：下一个原像 $k$ 的 $M_k$ 大于全部已选 $N_i$；则 $k$ 的支撑要求 $\tau_{M_k}\ge c_*$ 而 $i$ 的修正支撑要求 $\tau_{N_i}\le2c$，单调性 $\tau_{N_i}\ge\tau_{M_k}$（$N_i\le M_k$）给出 $\ge c_*>2c$ 冲突，支撑分离。
(c) $b$ 与 $b-1$ 的支撑方向相反（$\{\tau\le2c\}$ 对 $\{\tau\ge c\}$）是全部机关：$F_ib_{c,N}$ 把支撑压进"尾小"区，原始 $F_i$ 住在"尾大"区，交错 $N$ 即得两两不相交。
(d) 失败路线：不用尾因子、直接靠 $\tau$ 水平集切分 $F_i$：切出来的截断不在任何 $\mathcal V_H$ 内（类对"与 $b$ 相乘"封闭，对任意截断不封闭），lem:duality 的类内对偶界失去。[推测：这正是 $b_{c,N}$ 以类成员身份，并非工具身份进入定义的原因。]

## 14 选择定理：三种支撑配置的逐案处理

Proposition 7.5（`07:278-297` 陈述）：弱零 + 单类检测 $\Rightarrow$ 子列、单类 $\mathcal L_1$、修改测试 $\widetilde F_k$、共同界 $C_1$、检测 $\delta_1$。这是 §16 矛盾前的最后一块几何。我按论文的三案逐个走，每案的中间步都补。

**案一：标签两两不同、band 有界**（`07:314-334`）。$\lambda_i$ 离开有限集（块有限故同层只能有限个不同标签）；$\{J_\lambda\le J\}$ 有限故 $J_{\lambda_i}\to\infty$；再子列固定 band $j$，最终 $j<J_{\lambda_i}$，eq:support-coarse 给支撑上 $r_{\lambda_i}\ge c_*=\ell_j/2$（eq:bounded-band-radius）。这些半径用到的坐标逃逸一切固定初始段（每坐标至多进两个半径），选 $M_i\to\infty$ 使 $r_{\lambda_i}$ 的坐标下标 $>M_i$，于是 $r_{\lambda_i}\le\tau_{M_i}$，代入 $r_{\lambda_i}\ge c_*$ 得支撑 $\subset\{\tau_{M_i}\ge c_*\}$，lem:tail-separation 收工。我读案一时卡过一个不等号方向：$r_{\lambda_i}\ge c_*$ 与 $r_{\lambda_i}\le\tau_{M_i}$ 合成 $\tau_{M_i}\ge c_*$ 需要支撑点处两号同时成立，核对 `07:330` 正是此意。

**案二：band 趋于无穷**（`07:336-389`）。类必为 $\mathcal T_h$（$\mathcal V_h$ 要求 $j\le h$）。紧致对角：$\xi_i\in[-1,1]^{j_i}$ 逐坐标收敛到 $v_*\in[-1,1]^{\mathbb N}$（可不在 $c_0$！只用有限限制）。$a_i=2d_{j_i}+\ell_{j_i}/2\to0$；eq:projected-concentration：固定有限坐标集 $I$，$j_i\ge\max I$ 后支撑上 $\sup\|s|_I-v_*|_I\|\le a_i+\|\xi_i|_I-v_*|_I\|\to0$。修正：对固定 $i$ 取 $\theta_i$（低于最后尺度、低于剩余严格预算、任意小），中心 $q_i(\theta)$ 距 $v_*|_{I_{\gamma_i}}$ 至多 $\theta/8$，$\widetilde F_i=G_{q_i,\theta_i}F_i\in\mathcal T_{h+1}$，sup 差 $\le\theta_i4^hL_0$，类内逐点收敛 + eq:fixed-vector 定 $\theta_i$ 保检测 $\delta/2$。平台：$\widetilde F_i$ 在 $C_i=\{\|s|_I-v_*|_{I}\|<3\theta_i/8\}$ 常值（距中心 $<\theta_i/2$：$\theta_i/8+\frac{3}{8}\theta_i=\frac12\theta_i$，边界恰好压住，我核过这个 $\frac18+\frac38=\frac12$ 的拼法与 `07:381-382` "less than $\theta_i/2$" 吻合）。于是晚到的支撑进每个早平台（concentration + 递归子列），lem:compatible(2)（$b_i=1$）收工。

**案三：单一重复标签**（`07:391-569`），全文最重。子列化参数：操作数 $m\le h$、类型序列 $G/R$、尾因子数 $l$ 与类型全部固定；每个位置尺度或恒或趋于 0，恒者中心可设恒（网格有限）。展开代数：非恒 $G_{q,\varepsilon}=\mathrm{Id}+R_{q,\varepsilon}$、非恒 $b=1+(b-1)$，线性操作分配律展开（参数冻结在先，`07:411-413`），至多 $K_0=2^{m+l}\le2^{2h}$ 项（eq:label-expansion：$F_i=\sum_{a\le K}F_i^a$）。项的尺度账：保留原时序子列、尺度非增、总尺度不增（$G\to R$ 同尺度、弃尾因子、$b\to b-1$ 都保持许可）；band 固定故全部落进某个 $\mathcal V_H$。弱零杀恒项：全恒项是固定测试，配对趋 0，有限多个恒位置总和趋 0；检测 $\ge\delta/2$ 逼某个**变化位置** $\ge\delta/(2K_0)=:\delta_0$（子列固定位置）。此后记 $F_i=u_ib_i$。
排除尾变化：若含非恒 $b_{c,N_i}-1$ 且 $N_i\to\infty$，支撑在 $\{\tau_{N_i}\ge c\}$、band 固定，lem:tail-separation 直接用；故设无此物，尾乘积恒，变化只能在圆柱因子，且残留非恒圆柱操作全是 $R$（$G$ 已换成 Id 或 $R$）。
小余项账：取第一个尺度 $\varepsilon_i\to0$ 的残留 $R$（中心 $q_i$），其前为恒前缀 $p$（$f_\gamma$ 经有限个恒操作），$L_{\mathrm{pre}}=\Lip(p)\le4^hL_0$（`07:466-469`：前缀界不是基界 $L_0$，早前操作已放大过；$L_{\mathrm{pre}}=0$ 则测试恒 0，与检测矛盾）。lem:operations：$\|R_{q_i,\varepsilon_i}p\|\le L_{\mathrm{pre}}\varepsilon_i$、投影支撑进 $\overline B(q_i,\varepsilon_i)$。其后每个保留尺度 $\le\varepsilon_i$（非增序！），后续 $G$ 不涨 sup、后续 $R$ 至多翻倍 sup、两者各扩支撑至多自身尺度：迭代至多 $h$ 次得 eq:small-r-support：$\|u_i\|\le2^hL_{\mathrm{pre}}\varepsilon_i$、投影支撑 $\subset\overline B(q_i,(h+1)\varepsilon_i)$。`07:492-494` 那句"顺序在此 essential：仅总预算不足以让后续尺度之和趋于 0"我专门停了一下：总预算 $\sum\varepsilon<\ell_j/2$ 只约束和，若首个小 $R$ 之后还允许大尺度，支撑扩张由后序大尺度决定、不收敛；非增序把"第一个趋 0 位置"变成"其后全体趋 0"的分水岭。
再修平台：$q_i\to v$（紧立方），对固定 $i$ 取 $\theta_i\le\varepsilon_i$、低于最后尺度与剩余预算，中心 $q_i^+(\theta)$ 距 $v$ 至多 $\theta/8$，$\widetilde F_i=(G_{q_i^+,\theta_i}u_i)b_i\in\mathcal V_{H'}$（多留一次操作），sup 差 $\le\theta_i\Lip(u_i)$（尾乘积 sup $\le1$），eq:retained-detection 保 $\delta_0/2$。支撑：$\supp\widetilde u_i$ 投影进 $\overline B(q_i,(h+2)\varepsilon_i)$（eq:modified-small-support；不要求新中心近旧中心，新非零值只能生在旧非零值附近）。平台 $C_i=\{\|s|_I-v\|<3\theta_i/8\}$ 上 $\widetilde u_i$ 恒 $e_i=u_i(q_i^+(\theta_i))$，$|e_i|\le2^hL_{\mathrm{pre}}\varepsilon_i\to0$（eq:small-plateau）。递归子列同时压 $\sum|e_i|<\infty$（例如 $|e_i|\le2^{-i}$，eq:small-plateau 给可达性）与支撑嵌套 $\supp\widetilde u_k\subset C_i$（$k>i$）。$\Lip(b_i)\le h2^h$ 统一，求和 $\sum|e_i|\Lip(b_i)\le h2^h\sum|e_i|<\infty$，lem:compatible(2) 收工。`07:567-569` 强调嵌套对象是 $\supp\widetilde u_i$（圆柱因子支撑），并非可能更小的 $\supp\widetilde F_i$：情形 (2) 的局部论证在"$\widetilde F$ 可能为零但 $\widetilde u$ 支撑在"的点上仍需要旧项常值，嵌套必须对更大的集成立。
(c) $2K_0$、$h+1$、$h+2$、$\delta/2$、$2^{-i}$：全部是把"固定有限松弛"和"可求和"分开定价：松弛 $\delta/2$ 付给逐点极限，$1/(2K_0)$ 付给展开项数，$(h+1)\varepsilon_i$ 付给后续操作数上限 $h$ 加首项，$2^{-i}$ 只是可和序列的具体选择。
(d) 失败路线。其一，展开时把 $G$ 作用在含尾因子的整个测试上：`07:419-420` 明令禁止，机制上 $G$ 的中心在 $I$-坐标上，尾因子依赖 $I$ 外坐标，合并后操作不保持"$\supp\subset$ 圆柱邻域"账，eq:small-r-support 失效。其二，取"最后一个 $R$"，并非"第一个 $R$"：后续操作无上界控制，sup 翻倍次数不定，平台值 $e_i$ 的趋零失去。其三，案二案三共用一个修正：案二的支撑收缩靠 $a_i\to0$（band 增），案三靠 $\varepsilon_i\to0$（尺度减），机制正交；强行统一会让 lem:tail-separation 的调用在案二不可用（$M_i$ 未必趋无穷）。[推测：三案的划分是穷尽性所迫：标签等或不等，不等时 band 界或无界。]

## 15 收束：矛盾、装配与推论

Proposition 7.6（`07:579-599`）：设 $T:c_0\to Z$ 同构嵌入，$m_i=Te_i$ 满足 eq:bounded-signed（$r,M$ 为 $T$ 上下界）。lem:detectors 给弱零子列与单类检测；prop:compatible-detectors 给兼容检测器 $(\widetilde F_k,\mathcal L_1,\delta_1,C_1)$；$d_1=(\mathcal L_1,C_1,2)$；lem:detector-growth 给 $M^2\ge\alpha_{d_1}|H|\delta_1^2$ 对一切有限 $H$，矛盾。量化链我逐环对过：$r,M$ 只进 lem:detectors；$C$ 只进可容性；$\alpha_{d_1}$ 由 $(\mathcal L_1,C_1)$ 决定，$|H|\le M^2/(\alpha_{d_1}\delta_1^2)$ 是隐式上界，与"$H$ 任意有限"冲突。
thm:main 装配（`08:6-26`）：lem:completion（$Z$ 可分完备）+ prop:no-c0 + prop:global（$c_g=1/5-24\eta$）+ prop:onto（$g$ 满）+ lem:Q、lem:K（$QK=g-P$，$\Lip K\le3$）+ lem:absorption：$F(b,t)=b+K(t,Qb)$ 满双 Lipschitz，$F:Z\oplus_\infty c_0\to Z$。cor:same-space 三条（`08:29-38`）：(1) 双 Lipschitz 等价非线性同（和项含线性 $c_0$、$Z$ 不含，一行）；(2) $t\mapsto F(0,t)$ 给 $c_0$ 双 Lipschitz 入 $Z$；(3) Aharoni + 复合，$Z$ 是 separable metric 的万有双 Lipschitz 目标。
## 16 未编号关键论证台账

编号条目共 21 个（1 theorem、15 lemma、4 proposition、1 corollary，行号清单见上文各节）。正文里另有十三处不编号但承重位的论证，我逐条定位并记一句机制，漏任何一条上面的四段式都接不上：其一，`03:37-45` 半径尾消失（每坐标至多进两个 $r_\lambda$），$Sx\in U$ 与 $b\in c_0(\mathbb N^2)$ 两处消费；其二，`03:113-115` 含端点网格给 $B_j\ge1/2$，$w^j$ 全局有定义的根据；其三，`03:136-142` 归一化因子 4 引理，$L_j=4N_j/d_j$ 的来源；其四，`04:75-83` 规范化估计 $\|s_x-s_{x'}\|\le2d/M$，prop:global 与 lem:K 共用；其五，`04:210-218` 窗外溢出检查（$a_{i,N}=0$ 掐死 $(i,N+1)$ 块）；其六，`04:222-227` 闭像论证（下界 $\Rightarrow$ Cauchy 拉回 $\Rightarrow$ 极限原像）；其七，`06:38-48` 可容性与增量和判据的等价（取匹配符号）；其八，`07:51-63` 滑驼峰选取（逐坐标收敛 + 两段余量 $r^2/4$）；其九，`07:65-72` 半范平方的偶凸性与 Jensen 配对（我第一遍把中点算错，正确读法是 $m=\tfrac{(y+m)+(m-y)}2$）；其十，`07:381-382,540-544` 平台几何 $\theta/8+3\theta/8=\theta/2$；其十一，`07:492-494` "尺度非增序"分水岭声明；其十二，`07:567-569` 嵌套必须对 $\supp\widetilde u_i$ ，并非 $\supp\widetilde F_i$；其十三，`02:74-77` 反演公式先造 $u$ 再问原像的顺序声明。

## 17 关键转折点，与最终思路和最初设想的差异

四个转折按时间记账。转折一（第 1 到 2 节之间）：从"给商映射找 Lipschitz 提升"退到"只提升 $g-P$ 这一个特定映射"。GK03 推论封死的是前者的一般形式；吸收恒等式 $QK=g-P$ 把任务从"选择问题"改成"方程问题"，$F$ 的逆 $G(d)=(d-K(g^{-1}Qd),\,\cdot)$ 顺带自造，`02:38` 那句 No surjectivity 是转折一的碑文。转折二（第 5 节）：终端标量。窗口方程本来欠 $N$ 个边界读数，补 $N$ 个终端坐标同时修好三件事：方阵维度、Brouwer 可用、溢出为零；`01:123-125` 把"平衡维度"与"逼死溢出"并列为一个设计。转折三（第 9 节）：范式里平方和与趋一指数分工，我起初以为二者冗余（任选其一都能"集中检测"），推演后确认它们分别守两道闸：$\ell_2$ 外和守 $d$-方向的驼峰搬移，$p\downarrow1$ 守同一 $\sigma_d$ 内列表到单测试的收缩，两道闸对应 §12 的两段，谁也不替谁。转折四（第 14 节案三）：第一个 $R$ 的选择，"总预算"与"操作序"必须同时用，否则 $e_i$ 不趋零。
最终思路和最初设想的差异，三句。最初我想"挑一个已知无线性 $c_0$ 的空间再手造吸收"，成品是反过来：$Z$ 由 $g$ 的修正函数自己生成，空间的每一分结构都是吸收映射的缺陷的镜像，选空间变成造空间。最初我以为线性障碍要靠全局几何性质（Schur、凸性之类），成品用逐向量组合排除：任何 $c_0$ 基像自己长出兼容检测器、自己触发 $\sqrt{|H|}$ 增长、自己违反有界符号和。最初我以为满双 Lipschitz 是"嵌入 + 值域调整"两步，成品把两步焊死在一个三元组 $(g,Q,K)$ 上，且 $Q$ 的像只需要覆盖 $h(B)$ 生成的那部分。

## 18 与 D26 的分界（展开版）

D26 处理的对象（加倍 Hilbert 子集、无可嵌入的有限维欧氏目标）与本篇在问题层面正交：那边的分离变量是目标维数 $k$ 与 distortion $D$，度量型态对线性型态的失败发生在**紧子集**层级，障碍机器是能量估计、crossings 与体积打包；这边的分离变量是"含双 Lipschitz 像"对"含线性拷贝"，发生在**整空间**层级，机器是分子范式与检测器选取。两篇共同使用的只有 bi-Lipschitz 这个词与 Lipschitz-free 的工具引用谱系；本篇 `01:86-89` 还额外与 2026-09-24 那篇（$c_0(\ell_2)$ 障碍、Hilbert-block 与局部化 free-space 论证）声明了机制独立，我在 D26 笔记里读到的所有参数（$r_j=1000^{-j}$、$(N_j,W_j)$、76800）在本篇没有对应物，反之本篇的 $\eta,\rho_j,\alpha_d$ 也不进 D26。写作层面我也刻意分账：D26 的叙事核心是"固定集不随嵌入改变"，本篇的核心是"固定向量之后才选尺度"（eq:fixed-vector），两个"不依赖"方向相反（前者拒绝对象依赖参数，后者允许参数依赖单个对象），复述即出事故，所以上文各节从不引 D26 的引理。

## 19 常数台账

| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |
| --- | --- | --- | --- | --- |
| $\eta$ | $10^{-3}$ | 03:77 | W2、prop:global、$L_0$ | $>1/120$ 时 $1/5-24\eta\le0$（04:122），下界崩，c_g 与吸收反界全断 |
| $d_j$ | $2^{-j}$ | 03:12 | 网格 $\mathcal A_j$、支撑 $2d_j$ | 变疏则 $N_j$ 与 $B_j\ge1/2$ 的账重排；[推测：论文未追踪其它底数] |
| $N_j$ | $(2^{j+1}+1)^j$（超指数增） | 03:130 | $L_j=4N_j/d_j$ | 增速超过 $\rho_j$ 的衰减则 03:148 归纳无正右端 |
| $L_j$ | $4N_j/d_j$ | 03:143 | $L_j\rho_j\le\eta/4$（W2 后半） | 系数 4 变 5 需重取 $\rho$，下游 $\ell_j,c_*$ 平移 |
| $H$ | 满足 $\pi/H\le\eta/2$ | 03:146 | $\theta^J$ 的 $\log r$-Lipschitz（W2 前半） | 变小则第一半预算 $\eta/2$ 溢出 |
| $\rho_j,\ell_j$ | $\rho_{j+1}<e^{-H}\rho_j$，$\ell_j=e^{-H}\rho_{j+1}$ | 03:148-154 | band-support、案一 $c_*=\ell_j/2$ | 间隙变小则旋转区间重叠（03:167），band 支撑互相污染 |
| $J_\lambda$ | $i+n$ | 03:10 | $\{J\le J_0\}$ 有限（07:317） | 改为 $\max\{i,n\}$ 则案一的逃逸论证要重写 [推测] |
| $r_\lambda$ | 两块 max，1-Lip | 03:35-38 | 尾消失、W2、案一 $\le\tau_{M_i}$ | 任一坐标进 3 个半径则尾消失失效（03:38） |
| W1 界 | $\lVert v\rvert \le1,\lVert w\rvert _1\le2$ | 03:85-88 | $5=1+4$、$4r$、逆公式 $h+4h$ | $\lVert w\rvert \le3$ 时 5 变 $1+6$，$c_g$、球半径、$D_N$ 全移  |
| 修正界 | $\lVert f_\gamma\rvert \le4r$，Lip $\le4+12\eta$ | 03:247-249 | $A,L_0$（04:241-242） | 12 的 $8+2+2$ 分解动任何一块都改 $L_0$，下游 $2^hA,4^hL_0$  |
| 冻结界 | $\lVert S\rvert ^{\pm1}\le5$ | 04:20-21 | prop:global、eq:finite-bounds、球 $5h$ | 5 是唯一"花三次"的数，改动全局传导  |
| 全局界 | $1/5-24\eta\le\cdot\le5+24\eta$ | 04:66-70 | $c_g$、闭像、absorb-bounds | 24 的 $\times2$ 来源是两端点误差 |
| $h/6,h/5$ | $1/6<1/5$ | 04:195-205 | 状态=规范化 | 阈值 $\ge1/5$ 则不动点可能留在正则化区，解的是辅助方程 |
| 尺度预算 | $\sum\varepsilon_k<\ell_j/2$ | 05:120-124 | support-coarse、案三加 $G$ 后仍合规 | 取等号则无余量给 $\theta_i$ |
| $\chi$ 与操作界 | 斜率 2；3、4、$2\lVert u\rvert $ | 05:26-34,54-61 | $2^h,4^h$、平台 $\varepsilon/2$ | 平台半径变则案二 $3\theta/8$ 拼法断  |
| 网格 $\varepsilon/8$ | 距格点 $\le\varepsilon/16$ | 05:19-24 | 07:354,502 选中心 | 间距 $>\varepsilon/2$ 时中心可选不到 $v$ 附近 |
| 尾因子 | 支撑 $\{\tau\le2c\}/\{\tau\ge c\}$，Lip $\le1/c$ | 05:177-190 | 尾分离 $2c<c_*$；$\Lip b_i\le h2^h$ | 支撑系数 $c,2c$ 改到不分离，案一塌 |
| 逐类界 | $2^hA$，$4^hL_0(+h4^hA)$ | 05:217-222 | $B_{\mathcal L}$、$L_{\mathrm{pre}}$、$\theta_i$ 选法 | $h$ 无界则对偶界无公共 $B_{\mathcal L}$ |
| $\alpha_d$ | $2^{-d}/C_d^2$；$\sum\alpha_dC_d^2=1$ | 06:52-55 | 范式有限性、$\sqrt{\alpha_d}\delta\sqrt{\lvert H\rvert }$ | 权重变则 $B_0=\alpha_{d'}^{-1/2}M$ 与矛盾阈值变  |
| $p$ 清单 | $1+1/k$，$p'<p$ | 06:26, 07:89-94 | $\delta=((a/2)^p/B_0^{p'})^{1/(p-p')}$ | 无更小 $p'$ 则收缩到单测试失败 |
| 驼峰余量 | $r^2/4,r^2/2$ | 07:55-63 | $M^2\ge\lvert H\rvert r^2/4$ | 余量 $>M^2/\lvert H\rvert $ 时矛盾窗口关不上  |
| $K_0$ | $2^{m+l}\le2^{2h}$ | 07:422 | $\delta_0\ge\delta/(2K_0)$ | 展开项失控则检测下界被除没 |
| 平台值 | $\lVert u_i\rvert \le2^hL_{\mathrm{pre}}\varepsilon_i$，$e_i\le2^{-i}$ | 07:486,546-556 | $\sum\lvert e_i\rvert \Lip b_i<\infty$ | $\varepsilon_i$ 不趋零则不可和  |
| $L_K,q$ | $\Lip K\le3$；$q=\lVert Q\rvert $ | 06:243, 02:29-37 | $\Lip F\le1+L_K\max\{1,q\}$，反界 $\max\{1+L_Kq/c_g,q/c_g\}$ | 3 由 $1+2$（范数差+归一化）拼成，去 $\zeta$ 的 1-Lip 则变  |
| Lean 显式化 | $628/125=5+24\eta$；$22/125=1/5-24\eta$；$125/22$ 逆界 | Shift.lean:283；Absorption.lean:28 | BiLip 证书 | 与论文逐一对账吻合，见 §20 |
| $\ker w$ 通道 | $z+v(b-wz)=(z-vwz)+vb$ 与 $wv=1$ | 03:47-56 | W1 的组合（03:59-60）、04:18 的冻结移位读入差 | 若 $wv=1$ 失守则标量读出换不掉，04:49-51 的双向恢复同时断，逆界 $\lVert S^{-1}\rVert\le5$ 无凭据 |
| $a_{i,0}$ 的入处 | $a_{i,0}=t_i$，其后 $a_{i,n}=w^{i,n}x^{i,n}$ | 04:17-18 | 04:26 的相邻差、04:27-28 的 $n=1$ 特例 | 首块读入若改成 $0$，$E$ 坐标不进 $U$，$S$ 的双射断在 04:49 的 $Sx=y$ |
| $a_{i,n-1}-a_{i,n}$ | $\lvert a_{i,n-1}-a_{i,n}\rvert\le4r_{i,n}(x)$，$\lVert(Sx)^{i,n}\rVert_\infty\le5r_{i,n}(x)$ | 04:26-31 | 冻结界 $\lVert S\rVert\le5$、04:32-33 用尾性把 $Sx$ 收进 $U$ | 系数 $4$ 是两块各 $2r$ 相加，读出差一位则 $5r_{i,n}$ 与 04:30 的块范数同移，04:32-33 入 $U$ 只剩尾性可守 |
| $b_{i,n}$ 标量族 | $\lvert b_{i,n}\rvert\le2\lVert y^{i,n}\rVert_\infty$，$(b_{i,n})\in c_0(\mathbb N^2)$ | 04:35-43 | 04:44-46 的 $\lVert x\rVert_D\le5\lVert y\rVert_U$、04:38 用 $t_i=b_{i,1}$ 回收 $t$ | 行界抬到 $3$ 时 $(b_{i,n})$ 的 $c_0$ 归零要在 04:40-41 重证，逆公式在 04:45 掉出 $D$ |
| $Q$ 的右逆假设 | $0$ 条：02:38 明文不要求满射或右逆，预像由 $b=d-K(g^{-1}(Qd))$ 先产出（02:77） | 02:38, 02:74-77 | 08:17-18 的组装、§0 的 GK 硬约束 | 给 $Q$ 补一个 Lipschitz 右逆，Godefroy--Kalton 的推论立刻把线性 $c_0$ 灌进 $Z$，主定理自毁 |
| $(t_d,u_d)$ | $(t_d,u_d)=g^{-1}(Qd)$，逐 $d$ 有定义全凭 $g$ 满 | 02:43-47 | 02:52-58 的双向验证、eq:absorb-inverse | 若 $g$ 只嵌入不满，$G$ 在 $\operatorname{ran}g$ 之外无定义，$F$ 只剩单射，08:18 的 lem:absorption 用不上 |
| 内层读出 $(b,t)\mapsto(t,Qb)$ | $\Lip$ 至多 $\max\{1,q\}$，无额外假设 | 02:61-62 | eq:absorb-bounds 前半 | 按 $1+q$ 粗算则 $\Lip F$ 上界虚高，$F$ 的下界随之退化，反界里的 max 结构（02:35-36）失去意义 |
| $K_I(u)_\varepsilon$ 支撑账 | $K_I(Gu),K_I(Ru)\subset K_I(u)_\varepsilon$，$K_I(Ru)\subset\overline B_\infty(q,\varepsilon)$，$\varnothing_\varepsilon=\varnothing$ | 05:69-73 | eq:operation-support、05:102-110 的两种情形 | 删掉 $\varnothing_\varepsilon=\varnothing$ 这条约定，$u=0$ 时 05:109 那句立即可得断，归纳基例要重开一个分支 |
| $a$ 截断窗口 | $0\le a\le1$，$\Lip(a)\le2/\varepsilon$，配 $\lvert u(q)-u(s)\rvert\le\varepsilon\Lip(u)$ | 05:78-85 | 05:93-96 的两项拆分给出 $\Lip(Ru)\le3\Lip(u)$，$Gu=u+Ru$ 再给 $4$（05:97-98） | $2/\varepsilon$ 与 $\varepsilon$ 的相消若失败（窗口换一种缩放），$3$ 与 $4$ 同动，$\mathcal T_h$ 的 $h$ 层复合账（05:118-120）作废 |
| $\mathcal T_h$ 的操作数 $m$ | 至多 $h$ 次 $G$ 或 $R$，$m=0$ 表示空操作 | 05:115-120 | 逐类界 $4^hL_0$ 的来源、06:146-147 的有限公共界 $B_{\mathcal L}$ | 允许 $m$ 无界则同类复合深度发散，$B_{\mathcal L}$ 不存在，07:130 的三元组第二槽 $C$ 选不出 |
| 兼容检测的 $C$ | $\Lip\!\left(\sum_{i\in H}\epsilon_iF_i\right)\le C$ 对一切有限 $H$ 与一切符号，清单第三槽填 $2$ | 07:124-131 | eq:detector-growth 的 $\sqrt{\alpha_d}\,\delta\sqrt{\lvert H\rvert }$、07:141 的可容许性 | 第三槽改成 $1+1/k$ 则 07:145-151 的期望账要换 $2k$ 阶矩，$\sqrt{\lvert H\rvert }$ 退成 $\lvert H\rvert^{1/2-1/(2k)}$ [推测：论文只按 $p=2$ 走] |
| 独立符号的期望账 | $\mathbb E\,\sigma_d\!\left(\sum_{i\in H}\epsilon_i m_i\right)^2\ge\lvert H\rvert\delta^2$ | 07:145-151 | 07:153-154 声明全靠交叉项抵消，07:156-157 再取 max | 若补上 $\langle F_k,m_i\rangle=0$（$k\ne i$）这类跨配对假设，07:150 的双重求和退化，07:141 的可容许性成多余前提 |
| $B_0$ 稠密与有理张成 | $B$ 可分源自 $D$ 是可数坐标 $c_0$，$\zeta(B_0)$ 稠于 $\zeta(B)$，其有理张成在 $Z$ 中稠 | 06:109-114 | 08:7 用 lem:completion 拿到可分 $Z$、08:29-31 的同一条 $Z$ | $B_0$ 若不可数则 $Z$ 的可分性无凭据，主定理首句的 separable 落空，08:36 的 Aharoni 复合随之失效 |
| 组装链三段 | $g:E\oplus_\infty U\to U$，$QK=g-P$，$F(b,t)=b+K(t,Qb)$ 一次接上 | 08:6-22 | 02:18-21 的恒等、08:23-25 的显式逆 | $U$ 换成让 eq:absorb-identity 不成立的任何空间，02:44 的 $g^{-1}(Qd)$ 落在 $U$ 外，整链断在 08:18 |
| $\{0\}\oplus c_0$ 的两种命运 | 在 $Z\oplus_\infty c_0$ 里是线性等距拷贝，经 $t\mapsto F(0,t)$ 只留双 Lipschitz 像 | 08:42-46 | cor:same-space 前两条（08:32-35） | 这条限制映射若还带线性结构，$Z$ 就含闭线性 $c_0$，与 08:8-9 的 prop:no-c0 冲突 |
| 三角换元的两个先例 | pp.~281--282（AL78）与 Theorem~2.12（GK03） | 02:6-8 | 02:9-10 声明 lift 加自带逆公式是本文增量 | eq:absorb-identity 若放松成近似恒等，02:44-45 的 $G$ 给不出精确逆，absorb-bounds 的两项估计失去等式基础 |
| json 的认证面 | theorem_names 一条，definition_names 空，permitted_axioms 三条（propext、Quot.sound、Classical.choice） | C0Absorption.json:4-12 | §20 对账、08:7-9 三条输入各对应一个 Lean 名字 | definition_names 若增项，比对器要求该定义单独被认证，Main.lean:33 一条覆盖不到 [推测：records.txt 的三行记录我在 C0Absorption 目录与 OAI 顶层各浅查一次都没命中，第三行口径无法核对] |

依赖链（改动向下游流动的方向）：$\eta,H\!\to\!\rho_j,\ell_j\!\to\!$(W2)$\to L_0\!\to\!5,24\eta\!\to\!c_g\!\to\!\text{absorb-bounds}$；平行支：$\ell_j\!\to$ 尺度预算 $\to\mathcal T_h,\mathcal V_h\!\to\!$(类界, $B_{\mathcal L}$)$\to\!\alpha_d\!\to\!\delta,\sqrt{\alpha_d}\delta\sqrt{|H|}\!\to\!\text{prop:no-c0}$；两条支在 $c_g$ 与 $\alpha_d$ 处汇合于 thm:main 的常数证书。$N_j$ 与 $J_\lambda$ 只活在第一支；$K_0$、$e_i$ 只活在第二支的案三。

## 20 Lean 取证

口径先立：以下全部是对 `E:\math\lean\OAI\Analysis\C0Absorption\` 源码文本的 grep/wc 静态测量，我未执行编译；`.lake\build` 下未找到本模块的 olean 产物，所以"可编译"在本机是未验证项。文件 34 个，`wc -l` 合计 7918 行；顶层声明 753 个（theorem 521、def 190、abbrev 18、instance 14、structure 10；无 `lemma` 关键字，`variable/section/end` 未计入声明数）。sorry/admit/axiom/native_decide：目录内命中 0；全库唯一相关 sorry 在挑战题面 `ComparatorChallenges\C0Absorption.lean:29`（`theorem main_result : MainConclusion := by sorry`，给竞争者的空位，非求解残缺）。`#print axioms` 出现 0 次；公理口径来自 `C0Absorption.json` 的 permitted_axioms：propext、Quot.sound、Classical.choice，与 D26 笔记同款三件套，但本篇目录内连 docstring 都没有（`/--` 计数 0，对比 D26 主线 81 条），注释密度差异登记在此不解释。属性标注行（`@[...]`）80 行。tactic 词频（正则按行首与 `; . >` 后计，行内简写漏计，calc 实测仅 1 次即此口径的产物）：have 612、exact 387、apply 240、intro 231、simp 175、obtain 109、let 104、refine 53、rcases 44、cases 44、induction 32、norm_num 9、linarith 8、constructor 4、show/ring/gcongr/calc 各 1，合计 2056 次。import 结构：除 `Core.lean` 只 import Mathlib（另有两文件 import Mathlib 指定模块）外，34 个文件**各 import 恰一个本地文件**，串成一条 34 节点的线性依赖链：Core→Molecules→Norm→Completion→Signs→Lists→Pairings→Localization→Coordinates→Triangular→Tests→Duality→Selection→Supports→Operations→Detection→Grid→Weights→Angles→Blocks→Correction→Frozen→Tags→Operators→LocalInverse→Shift→Space→Finite→FiniteShift→Continuity→Onto→Absorption→Aharoni→Main。论文的章节顺序在链里被打散重排（比如 Selection 在 Supports 下游、对应论文 §7 中段），这是"论文编号不等于机器拓扑"的老现象。
论文陈述与 Lean 陈述的错口，六处。其一，也是最大一处：prop:onto 满射性论文用 **Brouwer 不动点**（04:192-208），Lean 里 grep `brouwer|fixedPoint` 命中 0；`LocalInverse.lean:25-57` 的 `surjective_of_punctured_local_onto` 换道：反 Lipschitz 给像闭，`Approximates.image_mem_nhds`（Mathlib 微分工具）给每个非零点处像为邻域，再用挖点余集 **连通**（`Onto.lean:17-24` 验 `Module.rank>1`，即要求 $N\ge1$ 维数 $\ge2$）做 clopen 论证。论文路线不要求维数 $\ge2$，Lean 路线不要求紧凸球上的不动点定理，两条在 $U_N$ 窗口外交会，机器选了后者，我视之为对 Brouwer 依赖的实质性减负（拓扑强度：维数条件换不动点公理化）。其二：`MainConclusion`（Core.lean:23-28）把 thm:main **加上** cor:same-space 三条全部编进被认证命题（$Z$ 可分完备、NoLinearC0、存在满 BiLip、$c_0$ 嵌入、MetricUniversal、非线性同构六个 conjunct），认证面比定理本身宽。其三：NoLinearC0 编成"任何有界线性 $T:C_0(\mathbb N,\mathbb R)\to_L Z$ 无下界"，论文口径是"不含闭线性子空间同构于 $c_0$"，二者数学等价靠"下有界算子的像闭"这一步，Lean 里这一步在 `Absorption.lean:73-88`（`noLinearC0_not_product_equiv`）以 contrapositive 用到积空间版本。其四：终端标量计数错口，论文 $\dim(U_N\oplus_\infty\mathbb R^N)$ 给 $N$ 个，Lean `FInput N = Sum (Fin (N+1)) (FLabel N)` 给 $N+1$ 个（`Onto.lean:21`）；我按 0-起索引读，$N+1$ 对应论文的 $i\le N$（含 $i=0$ 行或 $n$ 行整体平移一格），论文用 $i=1..N$；两种窗口都让 clopen/Brouwer 路线闭合，差一个常数不影响论证，但"逐字同构"的宣称要打折扣。[推测：具体对位方式我未逐行验证 Blocks/Finite.lean。] 其五：$Z$ 的"商 + 完备化"构造在 Lean 里是具体模型 `ConcreteSpace := SourceSpace concreteBases`（Tags.lean:222 附近），商映射与 $\zeta$ 的存在性被编译进模型定义，论文 eq:zeta 的 1-Lipschitz 与稠密性论证分散在 Completion/Norm/Space 链里，一一对应关系我没有逐条贴表（超出本篇必要精度，标为未做）。其六：BiLip 谓词用 `dist` 与存在性常量对（Core.lean:12-14），不显含"bijective"，满射单独以 `Function.Surjective`  conjunct 出现，与论文"onto bi-Lipschitz map"的措辞结构一致，无实质错口。
数字对账：$c_g$ 的 Lean 形态 `22/125`（`Absorption.lean:28`）恰等于 $1/5-24\eta=0.176$；上界 `628/125`（`FiniteShift.lean:79`，`Shift.lean:283` 的 $24\eta$ 账）恰等于 $5+24\eta$；`125/22` 是其倒数即论文的 $\|(S^{(N)})^{-1}\|$ 一侧。η 在 `Weights.lean:14` 定义 `1/1000`，`rho_lip_budget`（Weights.lean:63）实现 $L_j\rho_j\le\eta/4$，`schedule_speed`（Weights.lean:19）实现 $\pi/H\le\eta/2$；论文 03 节的两个半边预算在 Lean 是一比一命名的。吸收公式的恒等式核验 `absorptionQK`（Absorption.lean:34-38）最后是 `rfl`，即论文 `02:48-58` 的两行代数在机器里也是零引理。

## 21 怀疑清单（我自己不踏实的地方）

一，§10(d) 关于 sup-范口径能否替代逐点极限的判断，我承认推演未穷尽，两种表述孰强孰弱论文与 Lean 都没给答案。二，终端标量 $N$ 对 $N+1$ 的索引对位（第 20 节其四）只核到 `Onto.lean:21` 的卡片计数，$N$ 与 $N+1$ 两个窗口版本在案三式递归里是否完全同构，我没有证完。三，eq:seminorm-convexity 我重算后的读法（以 $m$ 为中点）与论文"average first over the sign of $m_i$"的字面顺序相容性，纸面成立，但 Lean 侧对应引理在哪个文件我没有定位（Detection/Signs 链上未逐行读）。四，第 6 节的检索所得今日联网收获近零，版图判断基本吃的是论文自带引文与我自己的旧账，若 GKL00 之后有我不知道的中间结果（例如 Sarí 线 2026 前后的跟进），第 6 节三条区别可能要重排。五，tactic 词频与声明计数按正则口径测，`calc` 一类行内战术被系统性低估，引用这些数字时请带口径。六，"论文陈述与 Lean 陈述无定义漂移"我没有逐定义 diff（D26 那样做过挑战文件比对，本篇的 `MainConclusion` 没有对应的独立题面文件可对照，`ComparatorChallenges/C0Absorption.lean` 只有 29 行的 sorry 壳），比对空间因此不完整。七，cor:same-space 第 3 条的万有性在 Lean 里真跑了 256 行的 Aharoni.lean（可分度量空间入 $c_0$ 的形式化），这条支线论文只有一句引用（`08:47-49`），两侧工作量严重不对称，我怀疑论文读者会低估它的形式化成本，写进台账供后来者参考。

（完，全篇 21 节。编号条目 21 个逐条过完；[推测] 随文标注，按行计共 20 处。）

